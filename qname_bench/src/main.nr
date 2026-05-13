//! Microbenchmark for `qname_equal` / `XsdQName::eq_same_size`.
//!
//! Amplified harness: each iteration constructs a witness-dependent
//! QName, runs the equality, and XORs the result into an accumulator.
//! Per the noir-optimisation skill section 2.4, microbenchmarks of a
//! single primitive call hit the UltraHonk padding floor; amplifying
//! with N=32 keeps the floor below 30% of the signal even for the
//! cheapest variant.
//!
//! Two variants live in this file so we can `bb gates` both forms
//! against the same backend version on the same Noir compiler:
//!   * `qname_equal_nested_if` -- the form shipped in `xpath/src/qname.nr`
//!     (and pre-refactor at `928dccc`). Kept verbatim here so we can
//!     measure against alternatives.
//!   * `qname_equal_mask` -- a "straight-line mismatch-mask" form tried
//!     during refactor wave 17. Measured 8232 backend gates vs. 4444 for
//!     `qname_equal_nested_if` at N=32 amplification (1.85x worse); kept
//!     here as a regression guard so future agents don't re-spike the
//!     same shape without re-measuring.
//!
//! Toggle `USE_MASK_FORM` to switch which one `main` exercises, then
//! `nargo compile && bb gates -s ultra_honk -b target/qname_bench.json`.

use xpath::XsdQName;

/// Nested-`if` form -- the production body in `xpath/src/qname.nr`.
fn qname_equal_nested_if<let NS_LEN: u32, let LOCAL_LEN: u32>(
    a: XsdQName<NS_LEN, LOCAL_LEN>,
    b: XsdQName<NS_LEN, LOCAL_LEN>,
) -> bool {
    if a.namespace_len != b.namespace_len {
        false
    } else if a.local_name_len != b.local_name_len {
        false
    } else {
        let mut ns_equal = true;
        for i in 0..NS_LEN {
            if (i as u32) < a.namespace_len {
                if a.namespace_uri[i] != b.namespace_uri[i] {
                    ns_equal = false;
                }
            }
        }

        let mut local_equal = true;
        for i in 0..LOCAL_LEN {
            if (i as u32) < a.local_name_len {
                if a.local_name[i] != b.local_name[i] {
                    local_equal = false;
                }
            }
        }

        ns_equal & local_equal
    }
}

/// Mismatch-mask form (kept as regression guard -- this is *worse* on
/// UltraHonk; do not re-introduce in production).
fn qname_equal_mask<let NS_LEN: u32, let LOCAL_LEN: u32>(
    a: XsdQName<NS_LEN, LOCAL_LEN>,
    b: XsdQName<NS_LEN, LOCAL_LEN>,
) -> bool {
    if (a.namespace_len != b.namespace_len) | (a.local_name_len != b.local_name_len) {
        false
    } else {
        let mut mismatch: u32 = 0;
        for i in 0..NS_LEN {
            let in_range: u32 = if (i as u32) < a.namespace_len { 1 } else { 0 };
            let neq: u32 = if a.namespace_uri[i] != b.namespace_uri[i] {
                1
            } else {
                0
            };
            mismatch = mismatch | (in_range * neq);
        }
        for i in 0..LOCAL_LEN {
            let in_range: u32 = if (i as u32) < a.local_name_len { 1 } else { 0 };
            let neq: u32 = if a.local_name[i] != b.local_name[i] {
                1
            } else {
                0
            };
            mismatch = mismatch | (in_range * neq);
        }
        mismatch == 0
    }
}

fn run_one<let NS_LEN: u32, let LOCAL_LEN: u32>(
    a: XsdQName<NS_LEN, LOCAL_LEN>,
    b: XsdQName<NS_LEN, LOCAL_LEN>,
    use_mask: bool,
) -> bool {
    if use_mask {
        qname_equal_mask(a, b)
    } else {
        qname_equal_nested_if(a, b)
    }
}

global USE_MASK_FORM: bool = false;

fn main(seed_a: pub u32, seed_b: pub u32) -> pub u32 {
    let mut ns_a: [u8; 32] = [0; 32];
    let mut ns_b: [u8; 32] = [0; 32];
    let mut local_a: [u8; 16] = [0; 16];
    let mut local_b: [u8; 16] = [0; 16];

    for i in 0..19 {
        ns_a[i] = ((seed_a + i as u32) & 0xFF) as u8;
        ns_b[i] = ((seed_b + i as u32) & 0xFF) as u8;
    }
    for i in 0..3 {
        local_a[i] = ((seed_a + i as u32 + 100) & 0xFF) as u8;
        local_b[i] = ((seed_b + i as u32 + 100) & 0xFF) as u8;
    }

    let q1: XsdQName<32, 16> = XsdQName::new(ns_a, 19, local_a, 3);
    let q2: XsdQName<32, 16> = XsdQName::new(ns_b, 19, local_b, 3);

    let mut acc: u32 = 0;
    for i in 0..32 {
        let rot_local: [u8; 16] = if (i & 1) == 0 { local_a } else { local_b };
        let qa: XsdQName<32, 16> = XsdQName::new(ns_a, 19, rot_local, 3);
        let eq1 = run_one(qa, q1, USE_MASK_FORM);
        let eq2 = run_one(qa, q2, USE_MASK_FORM);
        acc = acc ^ ((eq1 as u32) ^ (eq2 as u32));
    }
    acc
}
