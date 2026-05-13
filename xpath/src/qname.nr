//! QName type and operations for XPath/SPARQL
//!
//! Implements xsd:QName (Qualified Name) type for XML namespace handling.
//! QNames consist of a namespace URI and a local name.
//!
//! XPath operators implemented:
//! - op:QName-equal

// ============================================================================
// QName Type
// ============================================================================

// QName component buffer sizes are sourced from `crate::constants` (single
// source of truth -- see `xpath/src/constants.nr`). They are referenced by
// the test generator and downstream consumers via `xpath::XSD_QNAME_MAX_*`.

/// XSD QName representation
/// A qualified name consists of a namespace URI and a local name
pub struct XsdQName<let NS_LEN: u32, let LOCAL_LEN: u32> {
    /// Namespace URI as bytes
    pub namespace_uri: [u8; NS_LEN],
    /// Actual length of namespace URI
    pub namespace_len: u32,
    /// Local name as bytes
    pub local_name: [u8; LOCAL_LEN],
    /// Actual length of local name
    pub local_name_len: u32,
}

impl<let NS_LEN: u32, let LOCAL_LEN: u32> XsdQName<NS_LEN, LOCAL_LEN> {
    /// Create a new QName from components
    pub fn new(
        namespace_uri: [u8; NS_LEN],
        namespace_len: u32,
        local_name: [u8; LOCAL_LEN],
        local_name_len: u32,
    ) -> Self {
        XsdQName { namespace_uri, namespace_len, local_name, local_name_len }
    }

    /// Create a QName with no namespace (empty namespace URI)
    pub fn from_local_name(local_name: [u8; LOCAL_LEN], local_name_len: u32) -> Self {
        XsdQName { namespace_uri: [0; NS_LEN], namespace_len: 0, local_name, local_name_len }
    }

    /// Check if QName has a namespace
    pub fn has_namespace(self) -> bool {
        self.namespace_len > 0
    }

    /// Local name component as `(bytes, length)`. Method form of
    /// `local_name_from_qname` for callers that hold the QName value.
    pub fn local_name(self) -> ([u8; LOCAL_LEN], u32) {
        (self.local_name, self.local_name_len)
    }

    /// Namespace URI component as `(bytes, length)`. Method form of
    /// `namespace_uri_from_qname`.
    pub fn namespace_uri(self) -> ([u8; NS_LEN], u32) {
        (self.namespace_uri, self.namespace_len)
    }

    /// op:QName-equal for QNames sharing both array sizes. Use the
    /// free `qname_equal` when the sizes differ.
    ///
    /// Cost note: equality runs in O(NS_LEN + LOCAL_LEN) byte compares
    /// regardless of the runtime `namespace_len` / `local_name_len`.
    /// Each iteration is a single conditional XOR-or-zero accumulated
    /// into one boolean -- cheaper than the previous form because the
    /// per-byte branch is now a multiplied-mask rather than a nested
    /// `if` chain.
    pub fn eq_same_size(self, other: Self) -> bool {
        // Length-mismatch shortcut: when either component's runtime
        // length differs, the two QNames cannot match irrespective of
        // the byte payloads.
        if (self.namespace_len != other.namespace_len)
            | (self.local_name_len != other.local_name_len) {
            false
        } else {
            // `mismatch` accumulates `1` as soon as any byte within the
            // declared `*_len` prefix differs. The straight-line form
            // (no nested `if`s) lets the optimiser CSE the per-byte work.
            let mut mismatch: u32 = 0;
            for i in 0..NS_LEN {
                let in_range: u32 = if (i as u32) < self.namespace_len {
                    1
                } else {
                    0
                };
                let neq: u32 = if self.namespace_uri[i] != other.namespace_uri[i] {
                    1
                } else {
                    0
                };
                mismatch = mismatch | (in_range * neq);
            }
            for i in 0..LOCAL_LEN {
                let in_range: u32 = if (i as u32) < self.local_name_len {
                    1
                } else {
                    0
                };
                let neq: u32 = if self.local_name[i] != other.local_name[i] {
                    1
                } else {
                    0
                };
                mismatch = mismatch | (in_range * neq);
            }
            mismatch == 0
        }
    }
}

impl<let NS_LEN: u32, let LOCAL_LEN: u32> Eq for XsdQName<NS_LEN, LOCAL_LEN> {
    /// Trait `Eq` -- delegates to `eq_same_size`. Required so callers
    /// can use `==` / `!=` on equal-shape QNames. Cross-shape callers
    /// must use the free `qname_equal` function (trait `Eq` requires
    /// `Self == Self`).
    fn eq(self, other: Self) -> bool {
        self.eq_same_size(other)
    }
}

// ============================================================================
// QName Comparison
// ============================================================================

/// op:QName-equal -- cross-shape variant.
///
/// Two QNames are equal if both their namespace URIs and local names are
/// equal as byte sequences and their effective lengths match.
///
/// When the two QNames share both array sizes prefer the `==` operator
/// or `XsdQName::eq_same_size`; this free function exists for cases
/// where the buffer-size const generics differ between `a` and `b`.
/// Same big-O cost as the `Eq` impl above: bounded by
/// `min(NS1, NS2) + min(LOCAL1, LOCAL2)` byte compares.
pub fn qname_equal<let NS1: u32, let LOCAL1: u32, let NS2: u32, let LOCAL2: u32>(
    a: XsdQName<NS1, LOCAL1>,
    b: XsdQName<NS2, LOCAL2>,
) -> bool {
    if (a.namespace_len != b.namespace_len) | (a.local_name_len != b.local_name_len) {
        false
    } else {
        // Iterate up to the lhs buffer size; out-of-bounds slots on the
        // rhs are caught by the `(i as u32) < NS2` predicate. The previous
        // nested-`if` form was equivalent semantically but generated more
        // ACIR opcodes because each `else` branch carried its own
        // multiplexer; folding into one `mismatch` mask is uniformly
        // cheaper at the cost of one extra mul per byte (vs. two muxes).
        let mut mismatch: u32 = 0;
        for i in 0..NS1 {
            let in_lhs: u32 = if (i as u32) < a.namespace_len { 1 } else { 0 };
            let in_rhs: u32 = if (i as u32) < NS2 { 1 } else { 0 };
            // Defensive: `b.namespace_uri[i]` would be out-of-bounds
            // when `NS2 <= i`. The const-generic predicate above keeps
            // the byte read guarded; Noir's array indexing is bounded
            // and the optimiser folds the read away when `in_rhs == 0`.
            let b_byte: u8 = if (i as u32) < NS2 {
                b.namespace_uri[i]
            } else {
                0
            };
            let neq: u32 = if a.namespace_uri[i] != b_byte { 1 } else { 0 };
            mismatch = mismatch | (in_lhs * in_rhs * neq);
        }
        for i in 0..LOCAL1 {
            let in_lhs: u32 = if (i as u32) < a.local_name_len { 1 } else { 0 };
            let in_rhs: u32 = if (i as u32) < LOCAL2 { 1 } else { 0 };
            let b_byte: u8 = if (i as u32) < LOCAL2 {
                b.local_name[i]
            } else {
                0
            };
            let neq: u32 = if a.local_name[i] != b_byte { 1 } else { 0 };
            mismatch = mismatch | (in_lhs * in_rhs * neq);
        }
        mismatch == 0
    }
}

// ============================================================================
// QName Constructor Functions
// ============================================================================

/// fn:QName - Constructs an xs:QName from a namespace URI and local name
/// XPath: fn:QName($paramURI as xs:string?, $paramQName as xs:string) as xs:QName
/// The paramQName can be a prefixed name "prefix:local" or just "local".
/// For simplicity, this implementation extracts only the local name portion.
pub fn fn_qname<let NS_LEN: u32, let LOCAL_LEN: u32>(
    namespace_uri: [u8; NS_LEN],
    namespace_len: u32,
    local_name: [u8; LOCAL_LEN],
    local_name_len: u32,
) -> XsdQName<NS_LEN, LOCAL_LEN> {
    XsdQName::new(namespace_uri, namespace_len, local_name, local_name_len)
}

/// fn:QName from strings - Constructs an xs:QName from string parameters
/// This is a convenience wrapper that works with str<N> types
pub fn fn_qname_from_strings<let NS_LEN: u32, let LOCAL_LEN: u32>(
    namespace_uri: str<NS_LEN>,
    local_name: str<LOCAL_LEN>,
) -> XsdQName<NS_LEN, LOCAL_LEN> {
    let ns_bytes = namespace_uri.as_bytes();
    let local_bytes = local_name.as_bytes();

    // Calculate actual lengths (excluding null terminators)
    let mut ns_len: u32 = 0;
    for i in 0..NS_LEN {
        if (ns_bytes[i] != 0) & (ns_len == (i as u32)) {
            ns_len += 1;
        }
    }

    let mut local_len: u32 = 0;
    for i in 0..LOCAL_LEN {
        if (local_bytes[i] != 0) & (local_len == (i as u32)) {
            local_len += 1;
        }
    }

    XsdQName::new(ns_bytes, ns_len, local_bytes, local_len)
}

// ============================================================================
// QName Accessor Functions
// ============================================================================

/// fn:local-name-from-QName - Returns the local name part of a QName
/// XPath: fn:local-name-from-QName($arg as xs:QName?) as xs:NCName?
///
/// Thin wrapper over the inherent `XsdQName::local_name` method. New
/// code should prefer `qname.local_name()`.
pub fn local_name_from_qname<let NS_LEN: u32, let LOCAL_LEN: u32>(
    qname: XsdQName<NS_LEN, LOCAL_LEN>,
) -> ([u8; LOCAL_LEN], u32) {
    qname.local_name()
}

/// fn:namespace-uri-from-QName - Returns the namespace URI part of a QName
/// XPath: fn:namespace-uri-from-QName($arg as xs:QName?) as xs:anyURI?
///
/// Thin wrapper over the inherent `XsdQName::namespace_uri` method. New
/// code should prefer `qname.namespace_uri()`.
pub fn namespace_uri_from_qname<let NS_LEN: u32, let LOCAL_LEN: u32>(
    qname: XsdQName<NS_LEN, LOCAL_LEN>,
) -> ([u8; NS_LEN], u32) {
    qname.namespace_uri()
}

/// fn:prefix-from-QName - Returns the prefix part of a QName
/// XPath: fn:prefix-from-QName($arg as xs:QName?) as xs:NCName?
/// Note: Our QName struct doesn't store the prefix, so this returns empty
/// In a full implementation, you would need to add a prefix field to XsdQName
pub fn prefix_from_qname<let NS_LEN: u32, let LOCAL_LEN: u32, let PREFIX_LEN: u32>(
    _qname: XsdQName<NS_LEN, LOCAL_LEN>,
) -> ([u8; PREFIX_LEN], u32) {
    // Prefix is not stored in our simple QName representation
    // Return empty array
    ([0; PREFIX_LEN], 0)
}

// ============================================================================
// Tests
// ============================================================================

#[test]
fn test_qname_equal_same() {
    // Same QName
    let ns: [u8; 32] = [
        104, 116, 116, 112, 58, 47, 47, 101, 120, 97, 109, 112, 108, 101, 46, 99, 111, 109, 47, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    ]; // "http://example.com/"
    let local: [u8; 16] = [102, 111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // "foo"

    let q1 = XsdQName::new(ns, 19, local, 3);
    let q2 = XsdQName::new(ns, 19, local, 3);

    assert(qname_equal(q1, q2) == true);
    // Same-shape: exercise both the operator and the inherent method.
    assert(q1 == q2);
    assert(q1.eq_same_size(q2));
}

#[test]
fn test_qname_equal_different_local() {
    let ns: [u8; 32] = [
        104, 116, 116, 112, 58, 47, 47, 101, 120, 97, 109, 112, 108, 101, 46, 99, 111, 109, 47, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    ];
    let local1: [u8; 16] = [102, 111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // "foo"
    let local2: [u8; 16] = [98, 97, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // "bar"

    let q1 = XsdQName::new(ns, 19, local1, 3);
    let q2 = XsdQName::new(ns, 19, local2, 3);

    assert(qname_equal(q1, q2) == false);
    assert(!(q1 == q2));
}

#[test]
fn test_qname_equal_different_namespace() {
    let ns1: [u8; 32] = [
        104, 116, 116, 112, 58, 47, 47, 97, 46, 99, 111, 109, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
    ]; // "http://a.com/"
    let ns2: [u8; 32] = [
        104, 116, 116, 112, 58, 47, 47, 98, 46, 99, 111, 109, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
    ]; // "http://b.com/"
    let local: [u8; 16] = [102, 111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // "foo"

    let q1 = XsdQName::new(ns1, 13, local, 3);
    let q2 = XsdQName::new(ns2, 13, local, 3);

    assert(qname_equal(q1, q2) == false);
    assert(!(q1 == q2));
}

#[test]
fn test_qname_no_namespace() {
    let local1: [u8; 16] = [102, 111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // "foo"
    let local2: [u8; 16] = [102, 111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // "foo"

    let q1: XsdQName<32, 16> = XsdQName::from_local_name(local1, 3);
    let q2: XsdQName<32, 16> = XsdQName::from_local_name(local2, 3);

    assert(qname_equal(q1, q2) == true);
    assert(q1 == q2);
    assert(q1.has_namespace() == false);
}

#[test]
fn test_qname_cross_shape_equal() {
    // q1 has NS_LEN=32, LOCAL_LEN=16; q2 has NS_LEN=24, LOCAL_LEN=8.
    // Same logical "http://example.com/foo" QName. The trait `==` can't
    // express this case (Self != Self), so callers must use
    // `qname_equal`.
    let ns_a: [u8; 32] = [
        104, 116, 116, 112, 58, 47, 47, 101, 120, 97, 109, 112, 108, 101, 46, 99, 111, 109, 47, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    ];
    let ns_b: [u8; 24] = [
        104, 116, 116, 112, 58, 47, 47, 101, 120, 97, 109, 112, 108, 101, 46, 99, 111, 109, 47, 0,
        0, 0, 0, 0,
    ];
    let local_a: [u8; 16] = [102, 111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    let local_b: [u8; 8] = [102, 111, 111, 0, 0, 0, 0, 0];

    let q1 = XsdQName::new(ns_a, 19, local_a, 3);
    let q2 = XsdQName::new(ns_b, 19, local_b, 3);

    assert(qname_equal(q1, q2) == true);
}
