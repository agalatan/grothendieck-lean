<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_angular_proof.md (file dated 2026-11-15 05:49). Only this line was added. -->
# Sharper angular content constants from the absolute scalar envelopes

Agent-ID: **codex-6e2b**, 15 November 2026.

**P+C**, with the absolute scalar barriers established by
`deficit_structure_content_verify.py` and the additive
`deficit_structure_absolute_low_verify.py` as explicitly required inputs.
At the peak row and tilt `s=3/5`, for every dimension and every cubic
of bidegree `(2,1)`,

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac3{80}\delta
\quad\text{if }\frac3{100}\le u\le\frac{463}{10000},}
\]

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac{71}{2000}\delta
\quad\text{if }\frac7{200}\le u\le\frac{463}{10000},}
\]

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac{17}{500}\delta
\quad\text{if }\frac1{25}\le u\le\frac{463}{10000},}
\]

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac{13}{400}\delta
\quad\text{if }\frac{11}{250}\le u\le\frac{463}{10000}.}
\]

The exact coefficients are `.0375`, `.0355`, `.034`, and `.0325`. No restriction on
`chi=delta/u^2` is imposed. These improve the coarse angular operator
estimate by retaining the shape of the scalar envelope.

## 1. The positive envelope and the extremal sign pattern

Use the notation and proved tensor identity of `secant_content_proof.md`:

\[
\|c_{3/5}(q)\|^2\le\frac23\delta\sup_R N_{\Psi_u}(R),
\]
\[
A(R)=\int_0^{\pi/2}\cos^3\theta\,k_u(R\cos\theta)d\theta,
\quad B(R)=\int_0^{\pi/2}\cos\theta\sin^2\theta\,
k_u(R\cos\theta)d\theta,
\]
\[
\frac23N_{\Psi_u}(R)=
\max\left\{Q(A,B),\frac23B^2\right\},\qquad
Q(A,B)=\frac{3A^2-2AB+3B^2}{12}.
\]

The certified barriers `W_30`, `W_35`, `W_40`, and `W_44` are nonnegative and satisfy
`|k_u(x)|<=W(|x|)` on their respective energy intervals. Each is an exact
rational cubic Hermite function on `[0,1]`, bounded by its recorded
cap `C` (`13/20` for the first two, `3/5` for the last two), and is
the constant `9/25` on `[1,infinity)`. Their validity, including the
infinite source tails and the half-line comparison argument, is proved
and checked in `deficit_structure_content_proof.md`,
`deficit_structure_absolute_low_proof.md`, and their verifiers.

Fix `R` and enlarge the possible profile values to all measurable
functions `K(theta)` satisfying `|K(theta)|<=W(R cos(theta))`. This can
only increase the supremum. The achievable pairs `(A,B)` form a compact
convex subset of `R^2`. At a nonzero maximizer of the positive quadratic
form `Q`, its gradient is a supporting linear functional: a pair with
a larger gradient pairing would have a larger quadratic value.

That linear functional is maximized pointwise by

\[
K(\theta)=W(R\cos\theta)
\operatorname{sign}(\alpha\cos^3\theta+
                    \beta\cos\theta\sin^2\theta).
\]

On the open angular interval, its sign is the sign of
`alpha cos^2(theta)+beta sin^2(theta)`, an affine function of
`sin^2(theta)`. It therefore has at most one sign change. Up to an
overall sign, which leaves `Q` unchanged, it is positive on an initial
angular segment and negative on the remainder. Constant signs are
included by choosing a switch at either endpoint. Zeros of the envelope
or functional do not affect the integral.

For the other metric branch, simply use

\[
|B(R)|\le\int_0^{\pi/2}\cos\theta\sin^2\theta
W(R\cos\theta)d\theta.
\]

Thus it is enough to check every angular switch for `Q`, and the total
positive integral for the `B^2` branch. No common-sign assumption on
the actual scalar profile is made.

## 2. Exact serialization and interval evaluation

`deficit_angular_prepare.py` converts each rational Hermite polynomial
to local power coefficients. Every coefficient is enclosed between
integer multiples of `10^-15`, using exact rational floor and ceiling.
It checks that the integer numerators are smaller than `2^53`, so their
binary floating-point parsing is exact. The resulting `.txt` file is
an outward enclosure of the original witness, not an independently
trusted replacement for it.

`deficit_angular_verify.cpp` reads those outward coefficients. On an
argument interval that crosses Hermite cells it evaluates every
intersecting cell and takes their hull; if it crosses one, it also
includes the constant tail. The header now records the exact rational
cap; its numerator and denominator are exactly representable integers
for all four accepted witnesses. Clamping to `[0,C]` uses the separately
certified nonnegativity and cap. The converter requires `C<=13/20`,
and the used witnesses have `C>=9/25`. Local polynomial arguments are
clamped to `[0,1]` only after intersecting the corresponding cells.

The executable must be compiled with the directed-rounding flags used
by the inherited interval engine:

```
-O2 -std=c++17 -frounding-math -ffp-contract=off -fno-fast-math
```

It sets and checks `FE_UPWARD` before any accepted calculation. The
global scalar caps initialized before `main` are explicitly reset after
that change. Lower arithmetic endpoints are obtained by sign reversal;
upper endpoints use upward rounding. The sine/cosine functions use
finite Taylor polynomials with an explicit first-omitted-term remainder
bound. The rational containing interval for pi is the one certified by
the main verifier's exact Machin-formula calculation.

## 3. Compact radial and angular coverage

For each closed radial interval, divide `[0,pi/2]` into 4096 equal
angular cells. On each cell the code encloses cosine and sine using
their monotonicity on this interval, evaluates `W(R cos(theta))` on
the full radial-angular box, and multiplies by the nonnegative angular
weights and the cell length. These are interval rectangle integrals:
all variation inside the cell is enclosed, so no numerical quadrature
error is omitted.

Store the resulting component integrals as intervals `a_j,b_j`.
For a switch lying in cell `j`, the two signed integrals satisfy

\[
A\in\sum_{i<j}a_i-\sum_{i>j}a_i+[-\overline a_j,\overline a_j],
\]
\[
B\in\sum_{i<j}b_i-\sum_{i>j}b_i+[-\overline b_j,\overline b_j].
\]

Here the overlines denote upper endpoints. Treating the two uncertain
cell contributions independently enlarges their possible set and is
therefore safe. Prefix and suffix sums are accumulated outward. The
checker evaluates `Q` on every such interval pair and also evaluates
`(2/3)(sum b_j)^2`.

The initial radial boxes are `[j/200,(j+1)/200]`, `0<=j<400`; their
outward endpoints cover all of `[0,2]`. A rejected box is bisected into
two overlapping closed children, preserving coverage. The successful
runs accepted all 400 initial boxes, so no subdivision was needed.
Every accepted bound is compared with the lower endpoint of the exact
rational target.

## 4. The infinite radial ray

For `R>=2`, if `cos(theta)>1/2` then `R cos(theta)>1`, so

\[
W(R\cos\theta)\le\frac9{25}+
\left(C-\frac9{25}\right)\mathbf1_{\{\cos\theta\le1/2\}},
\qquad C\le13/20.
\]

Put `s=sqrt(3)/2`. Integrating this envelope gives absolute component
bounds

\[
a_* =\frac9{25}\frac23+
\left(C-\frac9{25}\right)\left(\frac23-s+\frac{s^3}{3}\right),
\]
\[
b_* =\frac9{25}\frac13+
\left(C-\frac9{25}\right)\frac{1-s^3}{3}.
\]

The checker proves `a_*<49/200`, `b_*<31/200`, and

\[
\frac{3a_*^2+2a_*b_*+3b_*^2}{12}
<0.027206<0.0325,
\qquad \frac23b_*^2<0.0325.
\]

The positive cross term bounds either sign of `A B`. This covers the
entire infinite ray and overlaps the compact check at two.

## 5. Completed acceptance

The successful logs are `deficit_angular30_results.txt`,
`deficit_angular35_results.txt`, `deficit_angular_results.txt`, and
`deficit_angular44_results.txt`:

| Envelope | Rational target | Largest compact enclosure | Radial boxes | Angular cells |
|---|---|---|---|---|
| `W_30` | `3/80` | `<.037211600` | 400 | 4096 |
| `W_35` | `71/2000` | `<.035357021` | 400 | 4096 |
| `W_40` | `17/500` | `<.033650745` | 400 | 4096 |
| `W_44` | `13/400` | `<.032383690` | 400 | 4096 |

All tails are bounded by `<.027205399`; the last two have the sharper
bound `<.026400013`. These are upper certificates,
not sampled maxima. The mathematical and source-level audit verified
the one-switch reduction, scalar-barrier interface, conversion,
compact coverage, and infinite-ray bounds. A standalone replay must
also replay the underlying absolute scalar barrier certificate; merely
running the angular executable against an arbitrary table is not a
proof of the content theorem.
