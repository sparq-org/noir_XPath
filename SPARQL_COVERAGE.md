# SPARQL 1.1 Function Coverage

This document details the implementation status of SPARQL 1.1 functions in noir_XPath.

## Implementation Status Legend

- ✅ **Fully Implemented**: Function is implemented and tested
- ⚠️ **Partial**: Function is partially implemented (e.g., integers only, not floats)
- 🔮 **Planned**: Function is planned for future implementation (each row cites its tracking bead)
- ❌ **Not Feasible / Deliberately Omitted**: Function cannot be implemented in the ZK
  context (RAND/NOW), or is excluded by policy with the reason stated (MD5/SHA1)
- 🚫 **Out of Scope**: Function is not part of XPath/XQuery operators

## 17.4.1 Functional Forms

| Function | Status | Notes |
|----------|--------|-------|
| BOUND | 🚫 | SPARQL-specific, not an XPath function |
| IF | 🚫 | SPARQL-specific, not an XPath function |
| COALESCE | 🚫 | SPARQL-specific, not an XPath function |
| NOT EXISTS | 🚫 | SPARQL query operator, not a function |
| EXISTS | ✅ | Implemented as `exists` for sequences |
| logical-or (`\|\|`) | ✅ | Implemented as `logical_or` |
| logical-and (`&&`) | ✅ | Implemented as `logical_and` |
| RDFterm-equal (`=`) | 🚫 | RDF-specific comparison |
| sameTerm | 🚫 | RDF-specific function |
| IN | 🚫 | SPARQL-specific operator |
| NOT IN | 🚫 | SPARQL-specific operator |

## 17.4.2 Functions on RDF Terms

| Function | Status | Notes |
|----------|--------|-------|
| isIRI | 🚫 | RDF-specific function |
| isBlank | 🚫 | RDF-specific function |
| isLiteral | 🚫 | RDF-specific function |
| isNumeric | 🚫 | RDF-specific function |
| str | 🚫 | RDF-specific function |
| lang | 🚫 | RDF-specific function |
| datatype | 🚫 | RDF-specific function |
| IRI | 🚫 | RDF-specific function |
| BNODE | 🚫 | RDF-specific function |
| STRDT | 🚫 | RDF-specific function |
| STRLANG | 🚫 | RDF-specific function |
| UUID | 🚫 | RDF-specific function |
| STRUUID | 🚫 | RDF-specific function |

## 17.4.3 Functions on Strings

| SPARQL Function | XPath Function | Status | Notes |
|----------------|----------------|--------|-------|
| STRLEN | fn:string-length | ✅ | Implemented as `string_length` |
| SUBSTR | fn:substring | ✅ | Implemented as `substring` - returns `([u8; N], u32)` byte array tuple. **Caveat**: uses BYTE positions (not codepoint positions as in XPath spec), exact parity with F&O only for ASCII content. For multi-byte UTF-8, position-based composition (e.g. `substring(s, i, string_length(s))`) is incorrect (sq-hjvte tracks codepoint-positional variant). |
| UCASE | fn:upper-case | ✅ | Implemented as `upper_case` - returns `([u8; N], u32)` byte array tuple. |
| LCASE | fn:lower-case | ✅ | Implemented as `lower_case` - returns `([u8; N], u32)` byte array tuple. |
| STRSTARTS | fn:starts-with | ✅ | Implemented as `starts_with` |
| STRENDS | fn:ends-with | ✅ | Implemented as `ends_with` - anchored to logical string length (pre-NUL), not buffer capacity. |
| CONTAINS | fn:contains | ✅ | Implemented as `contains` |
| STRBEFORE | fn:substring-before | ✅ | Implemented as `substring_before` - returns `([u8; N], u32)` byte array tuple. |
| STRAFTER | fn:substring-after | ✅ | Implemented as `substring_after` - returns `([u8; N], u32)` byte array tuple. |
| ENCODE_FOR_URI | fn:encode-for-uri | ✅ | Implemented as `encode_for_uri` - returns `([u8; R], u32)` byte array tuple. |
| CONCAT | fn:concat | ✅ | Implemented as `concat_bytes` - returns `([u8; R], u32)` byte array tuple. Joins two byte arrays with separator support via `string_join_two`. |
| langMatches | - (SPARQL-defined, RFC 4647) | ✅ | Implemented as `lang_matches` — RFC 4647 §3.3.1 **basic** filtering (SPARQL specifies basic, not extended, filtering): `"*"` matches any non-empty tag; otherwise case-insensitive exact match or prefix ending at a `-` subtag boundary. ASCII case fold (exact per RFC 5646 — tags/ranges are ASCII). Empty tag (no language) and empty range match nothing. |
| REGEX | fn:matches | 🔮 | Bounded circuit-friendly subset implemented (`matches_literal/anchored/prefix`, char-class matchers — sq-y73); FULL regex needs a bounded-NFA ZK-regex strategy, tracked sq-j8shy |
| REPLACE | fn:replace | 🔮 | `replace_literal` (literal pattern + replacement) implemented; full regex replace tracked with REGEX (sq-j8shy) |

## 17.4.4 Functions on Numerics

| SPARQL Function | XPath Function | Status | Notes |
|----------------|----------------|--------|-------|
| abs | fn:abs | ✅ | `abs_int` / `abs_float` / `abs_double` (float lanes on the vendored `sparq_ieee754`) |
| round | fn:round | ✅ | `round_int` / `round_float` / `round_double` |
| ceil | fn:ceiling | ✅ | `ceil_int` / `ceil_float` / `ceil_double` |
| floor | fn:floor | ✅ | `floor_int` / `floor_float` / `floor_double` |
| RAND | - | ❌ | Not feasible in deterministic ZK context |

### Numeric Operators

| Operator | XPath Operator | Status | Notes |
|----------|----------------|--------|-------|
| `+` (addition) | op:numeric-add | ✅ | `numeric_add_int` / `_float` / `_double` |
| `-` (subtraction) | op:numeric-subtract | ✅ | `numeric_subtract_int` / `_float` / `_double` |
| `*` (multiplication) | op:numeric-multiply | ✅ | `numeric_multiply_int` / `_float` / `_double` |
| `/` (division) | op:numeric-divide | ✅ | Two xs:integer operands yield the xs:decimal quotient (7/2 = 3.5, never truncating), computed in IEEE 754 double precision (`numeric_divide_int_as_double`; documented approximation — no arbitrary-precision decimal type, tracked sq-n5e7p). Distinct from `idiv`/op:numeric-integer-divide (`numeric_divide_int`, truncates toward zero). Float/double lanes: `numeric_divide_float` / `_double` |
| unary `+` | op:numeric-unary-plus | ⚠️ | Implemented for integers (`numeric_unary_plus_int`); no named float/double lane |
| unary `-` | op:numeric-unary-minus | ⚠️ | Implemented for integers (`numeric_unary_minus_int`); no named float/double lane |
| `=` (equal) | op:numeric-equal | ✅ | Integer, float, and double lanes (plus mixed int↔double comparison helpers) |
| `<` (less than) | op:numeric-less-than | ✅ | Integer, float, and double lanes |
| `>` (greater than) | op:numeric-greater-than | ✅ | Integer, float, and double lanes |
| `<=` (less than or equal) | op:numeric-less-than-or-equal | ✅ | Implemented for integers, floats, and doubles |
| `>=` (greater than or equal) | op:numeric-greater-than-or-equal | ✅ | Implemented for integers, floats, and doubles |

## 17.4.5 Functions on Dates and Times

| SPARQL Function | XPath Function | Status | Notes |
|----------------|----------------|--------|-------|
| now | - | ❌ | Not feasible in ZK - no concept of current time |
| year | fn:year-from-dateTime | ✅ | Implemented as `year_from_datetime` |
| month | fn:month-from-dateTime | ✅ | Implemented as `month_from_datetime` |
| day | fn:day-from-dateTime | ✅ | Implemented as `day_from_datetime` |
| hours | fn:hours-from-dateTime | ✅ | Implemented as `hours_from_datetime` |
| minutes | fn:minutes-from-dateTime | ✅ | Implemented as `minutes_from_datetime` |
| seconds | fn:seconds-from-dateTime | ✅ | Implemented as `seconds_from_datetime` |
| timezone | fn:timezone-from-dateTime | ✅ | Implemented as `timezone_from_datetime` |
| tz | - | ✅ | Implemented as `tz_from_datetime` (+ reusable `tz_string_from_offset_minutes`) returning a `([u8; 6], u32)` byte tuple: `"Z"` for offset 0, `"+HH:MM"`/`"-HH:MM"` otherwise, `""` for the `TZ_OFFSET_NONE` sentinel. **Caveat**: `XsdDateTime` has no absent-timezone flag — absence must be encoded as `TZ_OFFSET_NONE` (i16::MIN, the adjust-to-timezone "None" encoding); offset-0 values render `"Z"` (a `+00:00` lexical spelling is not preserved). |

### DateTime Operators

| Operator | XPath Operator | Status | Notes |
|----------|----------------|--------|-------|
| `=` (equal) | op:dateTime-equal | ✅ | Implemented as `datetime_equal` |
| `<` (less than) | op:dateTime-less-than | ✅ | Implemented as `datetime_less_than` |
| `>` (greater than) | op:dateTime-greater-than | ✅ | Implemented as `datetime_greater_than` |
| `<=` (less than or equal) | op:dateTime-less-than-or-equal | ✅ | Implemented as `datetime_le` |
| `>=` (greater than or equal) | op:dateTime-greater-than-or-equal | ✅ | Implemented as `datetime_ge` |

## 17.4.6 Hash Functions

| Function | Status | Notes |
|----------|--------|-------|
| MD5 | ❌ | **Deliberately omitted, permanently** (not a pending TODO): MD5 is cryptographically broken (trivial collisions), there is no maintained sound Noir implementation to vendor, and hand-rolling a broken digest into a ZK crypto library is a footgun (see `xpath/src/hash.nr` honesty note) |
| SHA1 | ❌ | **Deliberately omitted, permanently**: SHA-1 is broken (SHAttered); same rationale as MD5 |
| SHA256 | ✅ | Implemented as `sha256_hex` (+ `sha256_hex_bytes` for `([u8; N], len)` pipelines) — canonical lowercase-hex `([u8; 64], 64)` output; digest core is the vendored noir-lang/sha256 v0.3.0 (FIPS 180-4 KAT-verified on the pinned toolchain, see `vendor/sha256/VENDOR-PROVENANCE.md`) |
| SHA384 | ✅ | Implemented as `sha384_hex` (+ `sha384_hex_bytes`) — `([u8; 96], 96)`; core is the SHA-384 lane of the vendored noir-lang/sha512 (see `vendor/sha512/VENDOR-PROVENANCE.md`) |
| SHA512 | ✅ | Implemented as `sha512_hex` (+ `sha512_hex_bytes`) — `([u8; 128], 128)`; core is the vendored noir-lang/sha512 |

Hashing operates on the logical UTF-8 bytes of the string (bytes before the
first NUL, the crate-wide capacity convention) — exact SPARQL semantics for any
UTF-8 content. Note the SHA-2 lanes cost tens of thousands of constraints per
call; when the goal is in-proof string identity/commitment rather than the
SPARQL hex digest as an observable result, prefer the circuit-native
`string_pedersen_hash`.

## Boolean Operators

| Operator | XPath Function | Status | Notes |
|----------|----------------|--------|-------|
| fn:not | fn:not | ✅ | Implemented as `fn_not` |
| `&&` (and) | op:and | ✅ | Implemented as `logical_and` |
| `\|\|` (or) | op:or | ✅ | Implemented as `logical_or` |
| `=` (equal) | op:boolean-equal | ✅ | Implemented as `boolean_equal` |
| `<` (less than) | op:boolean-less-than | ✅ | Implemented as `boolean_less_than` |
| `>` (greater than) | op:boolean-greater-than | ✅ | Implemented as `boolean_greater_than` |
| `<=` (less than or equal) | op:boolean-less-than-or-equal | ✅ | Implemented as `boolean_le` |
| `>=` (greater than or equal) | op:boolean-greater-than-or-equal | ✅ | Implemented as `boolean_ge` |

## Duration Operations

| Operator | XPath Operator | Status | Notes |
|----------|----------------|--------|-------|
| duration + duration | op:add-dayTimeDurations | ✅ | Implemented as `duration_add` |
| duration - duration | op:subtract-dayTimeDurations | ✅ | Implemented as `duration_subtract` |
| duration * number | op:multiply-dayTimeDuration | ✅ | Implemented as `duration_multiply` |
| duration / number | op:divide-dayTimeDuration | ✅ | Implemented as `duration_divide` |
| duration / duration | op:divide-dayTimeDuration-by-dayTimeDuration | ✅ | Implemented as `duration_divide_by_duration` — xs:decimal ratio (never truncates; modelled as IEEE 754 double, the tree's documented decimal approximation) |
| yearMonthDuration / yearMonthDuration | op:divide-yearMonthDuration-by-yearMonthDuration | ✅ | Implemented as `ym_duration_divide_by_duration` — xs:decimal ratio (never truncates; modelled as IEEE 754 double, the tree's documented decimal approximation) |
| dateTime + duration | op:add-dayTimeDuration-to-dateTime | ✅ | Implemented as `datetime_add_duration` |
| dateTime - duration | op:subtract-dayTimeDuration-from-dateTime | ✅ | Implemented as `datetime_subtract_duration` |
| dateTime - dateTime | op:subtract-dateTimes | ✅ | Implemented as `datetime_difference` |
| `=` (equal) | op:dayTimeDuration-equal | ✅ | Implemented as `duration_equal` |
| `<` (less than) | op:dayTimeDuration-less-than | ✅ | Implemented as `duration_less_than` |
| `>` (greater than) | op:dayTimeDuration-greater-than | ✅ | Implemented as `duration_greater_than` |
| `<=` (less than or equal) | op:dayTimeDuration-less-than-or-equal | ✅ | Implemented as `duration_le` |
| `>=` (greater than or equal) | op:dayTimeDuration-greater-than-or-equal | ✅ | Implemented as `duration_ge` |

## Aggregate Functions

| SPARQL Function | Status | Notes |
|----------------|--------|-------|
| COUNT | ✅ | Implemented as `count` |
| SUM | ⚠️ | Implemented as `sum_int` for integers only |
| MIN | ⚠️ | Implemented as `min_int_seq` for integers only; returns `(value, present)` — empty input yields `present == false` (fn:min(()) = ()), not an error |
| MAX | ⚠️ | Implemented as `max_int_seq` for integers only; returns `(value, present)` — empty input yields `present == false` (fn:max(()) = ()), not an error |
| AVG | ⚠️ | Implemented as `avg_int` for integers only |
| GROUP_CONCAT | ✅ | Implemented as `group_concat` — joins a bounded member sequence (`[[u8; N]; M]` + lengths + count) with a separator (SPARQL default `" "` is supplied by the caller). This is the aggregate's STRING core: grouping, `DISTINCT`, and `ORDER BY` are query-engine concerns (as for all aggregates here, which receive the already-grouped sequence) |
| SAMPLE | ⚠️ | Implemented as `sample_int` / `sample_int_partial` for integers only (matching the other integer aggregates). Deterministically returns the FIRST element — a legal implementation-dependent choice per SPARQL 18.5.1.7, fixed because a prover-chosen nondeterministic sample would not be verifier-re-derivable; `(value, present)` with `present == false` for an empty group |

## Summary

### Fully Implemented (✅)
- All boolean operations (8 operators including `<=` and `>=`)
- All numeric operations (11 operators including `<=` and `>=`) for integers, floats, and doubles (named unary `+`/`-` lanes are integer-only)
- All datetime component extraction and comparison (12 total: 7 extraction functions + 5 comparison operators including `<=` and `>=`), plus TZ() lexical-part formatting
- All duration operations (13 total: 5 arithmetic operators + 5 comparison operators including `<=` and `>=`, plus 3 datetime-duration operators)
- Integer aggregate functions (COUNT, SUM, MIN, MAX, AVG, SAMPLE) + the GROUP_CONCAT string-join core
- Sequence operations (is_empty, exists, count)
- Generic comparison utilities (5 operators including `<=` and `>=`)
- String functions returning byte-array tuples (STRLEN, SUBSTR, UCASE, LCASE, STRSTARTS, STRENDS, CONTAINS, STRBEFORE, STRAFTER, CONCAT, ENCODE_FOR_URI, langMatches — see §17.4.3; substring byte-vs-codepoint caveat tracked in sq-hjvte)
- SPARQL hash digests SHA256 / SHA384 / SHA512 with canonical lowercase-hex output (vendored noir-lang digest cores; §17.4.6)

### Partial Implementation (⚠️)
- Aggregates: integers only (floats/doubles not yet supported)
- Regex: bounded circuit-friendly subset (`matches_literal/anchored/prefix`, char-class matchers, `replace_literal` — sq-y73); full XPath `fn:matches`/`fn:replace` deferred (sq-j8shy)

### Deferred/Future (🔮)
- Full regex `fn:matches` / `fn:replace` beyond the bounded subset (bounded-NFA ZK-regex strategy — sq-j8shy)
- `xsd:decimal` arbitrary-precision fixed-point type (sq-n5e7p; xs:decimal results are currently modelled in IEEE 754 double precision, stated per-row above)
- Codepoint-positional SUBSTR for multi-byte UTF-8 (sq-hjvte)

### Not Feasible / Deliberately Omitted (❌)
- RAND() - not meaningful in deterministic ZK proofs
- NOW() - no concept of current time in proofs
- MD5 / SHA1 - cryptographically broken digests, excluded by policy (see §17.4.6)

### Out of Scope (🚫)
- RDF term functions (not XPath functions)
- SPARQL-specific operators (BOUND, IF, COALESCE, IN, NOT IN, etc.)

## Notes for Users

When using this library for SPARQL 1.1 query verification in zero-knowledge:

1. **Determinism**: Functions like RAND() and NOW() must be provided as public/private inputs rather than computed
2. **String Operations**: Implemented over a `([u8; N], u32)` byte-array representation (buffer + logical length); functions that build new strings — including the SHA-2 hex digests, GROUP_CONCAT, and TZ() — return this tuple
3. **Numeric Types**: Float and double operations are implemented on the vendored `sparq_ieee754` library (IEEE 754 semantics; xs:decimal is approximated in double precision — sq-n5e7p tracks an exact decimal type)
4. **RDF Terms**: RDF-specific functionality is outside the scope of this XPath function library and should be implemented separately

## Testing

Implemented XPath-namespace functions have corresponding test cases generated
from the W3C qt3tests suite (see `test_packages/`). SPARQL-namespace builtins
with no qt3tests equivalent (langMatches, TZ, SHA256/SHA384/SHA512,
GROUP_CONCAT, SAMPLE) are covered by inline `#[test]`s and the
`xpath_unit_tests` binary, with expected values taken from the SPARQL 1.1
spec's own examples, RFC 4647, and FIPS 180-4 known-answer vectors
(cross-checked against Python `hashlib`).
