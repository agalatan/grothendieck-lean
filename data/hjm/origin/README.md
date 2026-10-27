# HJM origin response inputs

Agent-ID: codex-aa04. Upstream repository:
[Sheilman77/grothendieck_cx](https://github.com/sheilman77/grothendieck_cx/tree/7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f),
pinned commit `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`.

`upstream/` preserves thirteen upstream artifacts verbatim, including both
120-coefficient NPZ tables, their generation code, and the exact parameter and
energy-certificate sources. `manifest.json` records their original paths,
source URLs, byte lengths, and SHA256 hashes. The importer additionally pins
the manifest hash. These hashes establish source identity only.

Run `python3 tools/gen_hjm_origin_data.py --check --self-test` to validate
source integrity, generated outputs, exact rational definitions, table shape,
endpoint order, and the finite nonvanishing certificate. The importer uses
only Python's standard library and does not execute any upstream module,
import NumPy/FLINT, access the network, or replay numerical integration.
Running it without `--check` regenerates:

- `Grothe/HJM/OriginData.lean`: exact rational response definitions.
- `Grothe/HJM/OriginNonvanishingData.lean`: exact rational coefficients of
  `Re(P)^2+Im(P)^2-37/100`.
- `certificate.json`: the parameter and table schema described below.
- `nonvanishing-certificate.json`: a reproducible exact positivity certificate.
- `phase-derivative-certificate.json`: exact positivity data for the first two
  phase derivative bounds, awaiting their analytic/Lean soundness bridge.

## Exact definitions

All lists use ascending powers of the real radial variable `s`. The degree-nine
complex polynomial P uses the decimal strings `PRE_STR` and `PIM_STR` from
`complex_upper_convex_2e6_radial_coefficients.py`; each string denotes an exact
terminating rational, not its binary64 rounding. The defining parameters are

```
delta = 11/500
cayleyParameter = -71/400
cParameter = 356080252073/10^12
Cay(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2))
A = Cay(cayleyParameter), C = Cay(cParameter)
u0Squared = P(0)^2 / |P(0)|^2
D = -i * conjugate(C) * u0Squared
B = D * A
LEFT(s) = P(s) * (s + delta*A)
RIGHT(s) = C * conjugate(P(s)) * (s + delta*B)
```

`OriginData` exposes the parameter names above; `pReal`, `pImag`; rational
coordinates `aReal/aImag`, `bReal/bImag`, `cReal/cImag`, `dReal/dImag`; the
squared endpoint data; and the four degree-ten left/right polynomial lists.
The generator checks exact unit-circle identities and
`LEFT(0)*conjugate(RIGHT(0)) = i*delta^2*|P(0)|^2`. Analytic response definitions
and Lean proofs are in `OriginResponse.lean`.

## Table schema and proof boundary

`certificate.json` has `schema_version: 1`. Rational values are reduced
strings of the form `numerator/denominator`, or an integer string.

- `definitions` contains the exact rational parameters and coefficient lists.
- `source_tables` contains one table on `[0,25]` and one on `[25,36]`.
  Each has `count: 120`; each row identifies its radial index and the left
  and right complex rectangles as real/imaginary lower/upper rational pairs.
- Each NPZ binary64 endpoint is decoded as its **exact binary rational** via
  `as_integer_ratio`, never via a shortened decimal representation. Unknown
  keys, object types, malformed headers, duplicate zip members, wrong shapes,
  nonfinite values, and reversed intervals are rejected.
- `combined_table` adds corresponding source intervals by exact rational
  Minkowski addition to cover `[0,36]`, **conditional on both input enclosures**.
- `energy_targets` records exact upstream target numbers, explicitly as
  targets rather than proved bounds.

The source tables purport to enclose

```
(-1)^n / sqrt(n+1) * integral exp(-s)*sqrt(s)*L_n^1(s)*phase(Q(s)) ds,
```

with Q equal to LEFT or RIGHT, over their respective finite radial intervals.
The upstream generators substitute `s=t^2` and use Arb analytic integration.
They audit outward binary64 serialization against the computed Arb ball.
This importer does not reproduce or verify those integrals. There is no
integral theorem obtained from a hash or a successful decoding operation,
and no coefficient-table enclosure is emitted into Lean.

The `joint_l2_tail_bound` NPZ scalar was generated using ordinary
`math.exp` plus `math.nextafter`. Its exact serialized value is preserved as
metadata, but it is **not accepted as a proved exponential enclosure**.
The intended Bessel bound `exp(-cutoff/2)` must be proved analytically and
bounded separately by a verified exponential routine. Similarly, upstream
energy-integration code and printed totals are not Lean proofs.

## Finite nonvanishing certificate

`nonvanishing-certificate.json` is independent of the upstream Sturm and
Rouché routines. Let `Q=Re(P)^2+Im(P)^2-37/100`. All degree-18 Bernstein
coefficients are positive on these adjacent integer panels:

```
[0,1], [1,2], [2,4], [4,8], [8,16],
[16,24], [24,28], [28,30], [30,32].
```

All power coefficients of `Q(32+x)` are positive. Thus the convex-combination
property of the Bernstein basis and elementary monomial positivity prove
`|P(s)|^2 >= 37/100 > 9/25` for every real `s>=0`. The generator recomputes all
rational coefficients, expands each Bernstein representation back to the
power basis, and reverses the tail shift as independent identity checks.
`OriginNonvanishing.lean` binds this polynomial to the actual response and
uses the repository's rational Bernstein/Taylor soundness lemmas. A generated
JSON receipt alone is not evidence that the Lean module has compiled.

See `NUMERICS_DESIGN.md` for the remaining analytic and integration obligations.
