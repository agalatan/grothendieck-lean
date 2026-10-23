# A certified ceiling for the dimension-uniform cubic witness method

23 October 2026. Continuation of the genuine finite-response attack, using
repository history only. Work is isolated on
`codex/retuned-cubic-margin-20261023`; the main checkout is untouched.

## What changed

The earlier obstruction defeated only `P10-(149/200)P21`. Two explicit
genuine finite Gaussian response pairs now prove, for **every complex z**,

\[
 S_\infty(z):=\sup_N\|P_{10}^{(N)}-zP_{21}^{(N)}\|_{\infty\to1}
 > B:=.71313546585.
\]

The same construction, with a pure-cubic control and the elementary vector
spectral bound, gives

\[
 \frac{V_\infty(z)}{S_\infty(z)}<1.4022581233.
\]

Here `V_infinity` is the corresponding supremum of unit-vector-valued
payoffs over Gaussian dimensions. This is a ceiling for the
**dimension-uniform linear-minus-cubic witness architecture**. It is not an
upper bound on the complex Grothendieck constant, an exact cubic optimum,
or a ceiling for every smaller fixed-dimensional cubic kernel. The
construction also supplies the same scalar floor in its displayed finite
ambient dimension and every larger one.

The previously numerical warning near `1.402258` therefore has a rigorous
one-sided interpretation: this method cannot pass the displayed ceiling.
We have not proved that it can reach it. Both global Grothendieck endpoints
retain their previously audited proof status.

## 1. The actual finite Gaussian construction

Take `m=10^12`, `d=m(m+1)/2`, independent standard proper complex Gaussians
`Z`, `X in C^m`, and `Y in Sym^2(C^m)`. Define

\[
 q_m=\frac{\sum_i X_i^2\bar Y_{ii}
       +\sqrt2\sum_{i<j}X_iX_j\bar Y_{ij}}{\sqrt{m(m+1)}},
 \quad R_X=\|X\|^2,\quad R_Y=\|Y\|^2.
\]

The total number of complex Gaussian coordinates is the explicit finite
integer **500000000001500000000001**. No enumeration or high-dimensional
quadrature is used. Put

\[
 H=Z(|Z|^2-2)/\sqrt2,\quad
 A_X=(R_X-m)/\sqrt m,\quad A_Y=(R_Y-d)/\sqrt d.
\]

The full `U(m)` action `X -> UX`, `Y -> Sym^2(U)Y` gives the exact invariant
linear and cubic spaces

\[
 \operatorname{span}\{Z\},\qquad
 \operatorname{span}\{H,ZA_X,ZA_Y,q_m\}.
\]

These five features are orthonormal. The representation calculation, valid
also at `m=1`, is proved in
`GENUINE_CUBIC_OBSTRUCTION_2026-10-23.md`, sections 1--3. The central weights
one and two exclude every other remote invariant of the required degrees.
In particular the cubic projection is the actual Gaussian projection,
not a projector chosen from the marginal distribution of `q_m`.

The exact joint scalar realization is

\[
 R_X\sim\Gamma(m,1),\ G\sim CN(0,1),\ V\sim\Gamma(d-1,1),\quad
 q_m=\frac{R_XG}{\sqrt{m(m+1)}},\quad R_Y=|G|^2+V,
\]

with `Z,R_X,G,V` independent. The same `G` must occur in both identities.
For rational `c` and positive rational `b`, choose the actual responses

\[
 f_m=\operatorname{phase}\{R_X(Z+cH)+b\sqrt{m(m+1)}q_m\},\quad
 g_m=\operatorname{phase}\{R_X(Z+cH)-b\sqrt{m(m+1)}q_m\}.
\]

Since `R_X>0` almost surely, they have the scalar expressions
`phase(Z+cH +/- bG)`. They are phases of degree-five polynomials on the
original Gaussian space. This degree concerns the phase numerator; the
response has infinitely many Hermite levels. The witness still contains
only first and cubic chaos.

Let the real coefficients of the plus response be

\[
 a=E[\bar Z f_m],\quad h=E[\bar H f_m],\quad
 q=E[\bar G f_m],\quad n=E[\bar Z(|G|^2-1)f_m].
\]

Conjugation symmetry makes them real. Independence makes the `ZA_X`
coefficient exactly zero. Integrating `V` retains the `ZA_Y` coefficient
`n/sqrt(d)`. The `q_m` coefficient is `sqrt(m/(m+1))*q`. The minus
response has the same `Z,H,ZA_X,ZA_Y` coefficients and the opposite `q_m`
coefficient. Consequently, for every complex `z`,

\[
 \boxed{\langle f_m,(P_{10}-zP_{21})g_m\rangle=p-zs_m},\quad
 p=a^2,\quad s_m=h^2-q^2+\frac{q^2}{m+1}+\frac{|n|^2}{d}.
\]

Cauchy--Schwarz gives `|n|<=1`. The last positive term in `s_m` represents
a negative contribution to the real positive-epsilon payoff; it has not
been discarded. This exact identity avoids any CLT, phase-tail estimate,
independence assumption about `A_Y`, or small-coordinate reduction.

## 2. The directed numerical certificate

For real `t`, set `x=t^2/2` and

\[
 \psi(t)=\frac{\sqrt\pi}{2}t e^{-x}[I_0(x)+I_1(x)],\quad
 \zeta(t)=\frac{\sqrt\pi}{2}e^{-x}I_0(x),\quad
 t(r)=\frac{r[1+c(r^2-2)/\sqrt2]}b.
\]

Direct integration of the proper Gaussian gives

\[
 a=\int_0^\infty2r^2e^{-r^2}\psi(t(r))\,dr,\quad
 h=\int_0^\infty2r^2e^{-r^2}\frac{r^2-2}{\sqrt2}\psi(t(r))\,dr,
 \quad q=\int_0^\infty2re^{-r^2}\zeta(t(r))\,dr.
\]

The signal is signed. The formulas also apply when the visible numerator
changes sign. Arb encloses the integrals on `[0,8]` and adds the full tails

\[
 \Gamma(3/2,64),\quad
 [\Gamma(5/2,64)+2\Gamma(3/2,64)]/\sqrt2,\quad
 (\sqrt\pi/2)e^{-64},
\]

respectively. The largest is below `6.127e-26`. The complex analytic
integrands use integer-order Bessel functions scaled by `exp(-x)`, an
entire continuation. This scaling convention was checked against the
[versioned FLINT documentation](https://raw.githubusercontent.com/flintlib/flint/v3.5.0/doc/source/acb_hypgeom.rst)
and the [python-flint interface](https://python-flint.readthedocs.io/en/latest/acb.html#flint.acb.bessel_i).
No floating-point value is used to decide an interval inequality: endpoints
are converted from exact dyadic Arb rationals and rounded outward.

Use the two profiles

\[
 (c_1,b_1)=(119623/500000,119623/500000),\quad
 (c_2,b_2)=(14953/62500,14953/62500).
\]

The replays give

\[
 p_1\approx.7131362880357070,\quad h_1^2-q_1^2\approx+1.086998898\cdot10^{-6},
\]
\[
 p_2\approx.7131348833481966,\quad h_2^2-q_2^2\approx-7.701393528\cdot10^{-7}.
\]

Both `q_i^2<.072`; hence the complete finite correction is bounded by
`.072/(m+1)+1/d <7.21e-14`. The actual finite slopes therefore satisfy
`s_1m>0>s_2m`.

Define the exact real number

\[
 w=-s_{2m}/(s_{1m}-s_{2m})\in(0,1).
\]

It is defined by actual finite Gaussian integrals, including both unknown
`n_i`. We do not presume that a numerical interval containing zero is an
exact cancellation. The identity

\[
 w(p_1-zs_{1m})+(1-w)(p_2-zs_{2m})=wp_1+(1-w)p_2
\]

holds for all complex `z`. The triangle inequality bounds the right side
by the maximum modulus of the two actual pairings. **Only payoffs are
mixed; response functions and their squared projection coefficients are
not averaged.**

Monotonicity of `-y/(x-y)` on `x>0>y` encloses the weight using the finite
slope intervals, even though their errors need not be independent. Exact
rational arithmetic then gives

\[
 wp_1+(1-w)p_2\ge
 \frac{1742619936289202336457234374653146799}
 {2443602961448005824645000000000000000}
 =.7131354658600422\ldots>B.
\]

This proves the norm floor. No maximizer or optimizer is trusted.

For the spectral extension, the separate actual pair `phase(G),-phase(G)`
has only the `q_m` cubic coefficient and gives scalar norm at least

\[
 |z|\alpha,\qquad \alpha=\frac m{m+1}\frac\pi4>B.
\]

Orthogonality of `P10,P21` gives the vector payoff bound
`V_N(z)<=max(1,|z|)` by the Hilbert-valued L2 operator norm. Writing `S_N`
for the scalar norm, `S_N>=B`, `S_N>=alpha*|z|`, and `alpha>B` imply
`V_N/S_N<=1/B<1.4022581233`. Embedding the
finite construction in larger Gaussian spaces proves the asserted
dimension-uniform statement. It supplies no embedding into a smaller
ambient dimension.

## 3. Retuning is possible, but its potential is limited

At `epsilon=1891/2500=.7564`, the explicit profile

\[
 c=1196181533/5000000000,\qquad b=478697007/2000000000
\]

has certified finite pairing at least `.7131354667922086`. This is a
**lower** norm value, approximately `.00013129498` below `500/701`.
It provides no upper bound on that norm and does not establish a new
Grothendieck lower endpoint.

Two additional rational profiles certify that real coefficients outside

\[
 .745928<\epsilon<.766838
\]

cannot reach the reciprocal target `1.402` within this architecture.
The left excluded interval `[0,.745928]` has norm floor
`.7132667760303787`, exceeding `500/701` by `1.4261e-8`; the right
interval `[.766838,1]` has floor `.7132667797125647`, exceeding it by
`1.7943e-8`. Negative epsilon is excluded by the exact `phase(Z)` pair;
`|epsilon|>1` is excluded by the pure-cubic control and vector spectral
bound. This window is necessary, not sufficient.

The droplet search tested the genuine five-feature model at
`m=1,4,16,64,128,512`, twelve starts, and `2^14` discovery points. It froze
both response numerators before three independent scrambled `2^19` Sobol
holdouts. Across all three retained winners and scrambles, the largest
phase(Z)-control-variate score was `.7131136617679634` at `m=512`.
This limited search found no target violation. Its sampling errors are
not certified, and the invariant family need not contain the global
adversary. Coarse discovery itself overestimates some frozen values;
the holdout distinction matters.

Relative to the audited conditional interval
`1.401695322458 < K_G^C < 1.404598170764`, the scalar `P10-z P21` architecture
has room for less than `.000562801`, about **19.385%** of that interval.
At least **80.615%** remains above its ceiling. This is a restriction on
the method, not evidence that the true constant equals its ceiling.
These research results change neither endpoint nor the remaining cap and
numerical comparison obligations described in README. The unconditional
completed Lean upper bound is `1.405364`.

### A certified failure of automatic upper conversion

For the **same actual finite response pairs**, let
`C1=Re E[conj(f_m)g_m]`. Their normalized scalar law makes this expectation
independent of `m`. A second external directed certificate proves,
simultaneously for both profiles and hence every probability mixture,

\[
 C1\le\frac{176321757969}{250000000000}=.705287031876.
\]

Here is the complete integration argument. With independent exponential
`R=|Z|^2,T=|G|^2`, write

\[
 u=R[1/c+(R-2)/\sqrt2]^2,\quad d=(u-T)/(u+T).
\]

The angular average of the phase product is
`C(d)=d/AGM(1,|d|)`, with continuous value zero at `d=0`.
The AGM integral identity is recorded in
[NIST DLMF, equation 19.8.4](https://dlmf.nist.gov/19.8.E4).
Before angular averaging, the integrand is
`d/sqrt(sin(theta)^2+d^2*cos(theta)^2)`. It increases in `d`.
For `0<c<1/sqrt(2)`, `u` increases in `R` and decreases in `c`; `d`
decreases in `T`. Thus the smaller profile parameter bounds both above.

Divide each exponential distribution into 1024 equal-probability
quantile bins. Cover the final `R` bin and first `T` bin by the bound
one, with exact union mass `2047/1048576`. In every other product cell,
use the upper `R`, lower `T` corner. This includes the unbounded final
`T` bin. Two AGM iterations give the upper corner bound `d/g2` for
positive `d` and `d/a2` for negative `d`, since `g2<=AGM<=a2`.
Arb encloses every log, square root and sum. The 1,046,529 interior
corners plus the full boundary mass give
`.70528703187597494925854918781199114 +/- 6.14e-36`.
There is no truncation, numerical quadrature estimate or omitted tail.

For charge-one actual responses let
`r_j=<P_(j+1,j) f,P_(j+1,j) g>`, and mix these coefficients with the
same probability weights as the kernels. Parseval and Cauchy--Schwarz
give absolute summability and `sum_j r_j=C1`. The finite zero-cubic
mixture therefore has

\[
 \sum_{j\ge2}|r_j|\ge |C1-p|\ge p-C1
 >.007848433974,
 \qquad p-\sum_{j\ge1}|r_j|\le C1\le.705287031876.
\]

The available absolute-tail budget to beat the incumbent
`.711947179793908982` at `p≈.71313547` is only `.00118831`.
Thus even the conservative **certified** tail loss is over six times
that budget. Ordinary quadrature estimates `C1≈.703370788764`, suggesting
the stronger tail `.009764677096`; those extra digits remain numerical.

This proves a failure of the direct absolute-coefficient conversion for
this pair bank and its mixtures. It does not rule out cancellation
against additional components, tensor preprocessing or a different
upper transfer. The certificate uses the full actual Gaussian law and
Parseval; it makes no claim that finitely many moments determine a tail.

## 4. Why the balanced branch appears

In the three-feature comparison law let
`M(c)=E|Z+c(H+G)|`. This is a convex function. Differentiation for `c>0`
is justified by the integrable majorant `|H+G|` and absence of a
positive-probability zero. Along `b=c`,

\[
 M'(c)=h+q,\qquad M(c)=a+c(h+q).
\]

At a stationary point `h=-q`, so `h^2-q^2=0` and the same comparison
pair has payoff `a^2=M(c)^2` for every multiplier. The numerical
stationary point is near `c=.2392471706193`, with the best-response
diagnostic `epsilon=c*a/q≈.7563721482301`.

Neither uniqueness of this point nor global optimality is proved or
needed. The two rational profiles bracket opposite actual finite slopes
and turn this stationary geometry into a uniform obstruction. This is
why adjusting one cubic coefficient cannot remove the adversary.

## 5. What is established and what remains external

- **Analytic paper proof:** actual Gaussian realization, exact invariant
  projection closure, normalized-G coefficient identity, Bessel formulas,
  tail bounds, payoff mixing and vector spectral argument.
- **External directed certificate:** six coefficient integrals, rational
  finite corrections and weight bounds, the family floor, strict ceiling,
  retuned feasible value, excluded epsilon intervals, and the complete
  endpoint correlation cap. The replay uses
  python-flint 0.9.0/Arb and exact rational arithmetic.
- **Completed new Lean work:** ten generic theorems in
  `Grothe/LowerAnalytic/ScalarCubicFamilyCeiling.lean`, covering complex
  affine cancellation, the triangle argument, existence of the weight,
  supplied-pairing norm implications, rational arithmetic and the
  spectral ratio implication. All use only `propext`, `Classical.choice`,
  and `Quot.sound`. They do not formalize the Gaussian or Bessel inputs.
- **Numerical only:** stationary-point discovery and droplet alternating
  optimization/holdouts. No global norm upper cap or cubic optimality
  theorem is claimed.

The verifier also passes one positive control and thirteen rejection
controls, including a false floor, false reciprocal ceiling, insufficient
finite dimension, wrong slope ordering, missing exact cancellation,
invalid weights, reversed intervals and invalid parameters. These check
the certificate guards, not the missing Gaussian formalization.

## 6. Research priorities after this obstruction

1. **Add spectral directions and actual-response separation together.**
   For a target beyond `1.4022581233`, cubic retuning alone is impossible
   in this architecture. Start with `P10+a1 P21+a2 P32`, retaining
   `max(1,|a1|,|a2|)<=1`. The decisive calculation is the **actual**
   `H32` projection of these two adversaries and other near contacts:
   can one coefficient reduce every active pairing, or can a realizable
   mixture cancel both nonlinear coordinates while keeping the linear
   floor? Derive the full invariant `H32` span before fitting coefficients;
   the five-feature cubic model cannot simply be relabeled as a quintic
   model. A signed interval separation problem on these actual columns
   is the first falsifier. Existing degree-five/seven barriers in the
   reassessment already warn that raising the lower endpoint to the
   present upper region within this Hermite-game framework requires
   going further, at least through degree nine. A substantially better
   upper construction could change that target. A non-polynomial witness or a smaller
   fixed-dimensional formulation remains a live alternative.
2. **Screen upper-rounding candidates by full-spectrum necessary tests.**
   Killing the cubic coordinate alone does not control the remaining
   signed coefficients. For any realizable phase-pair mixture write
   `r_j=<P_(j+1,j) f,P_(j+1,j) g>`. Charge-one equivariance and Parseval
   give `sum_j r_j=E[conj(f)g]`; hence a zero-cubic mixture with linear
   coefficient `p` has absolute higher tail at least
   `|E[conj(f)g]-p|`. A competitive full Wiener score needs that tail
   below roughly `.00118831` at this linear coefficient. Compute this
   endpoint first, then low chaos and signed tail bounds, before
   promoting any lower adversary to an upper component. The endpoint
   certificate above already rejects the direct conversion of this bank:
   a new component must alter its higher spectrum, or cancel it against
   another actual component. The first falsifier for a proposed bank is
   its mixed endpoint `C1`: if it remains below the incumbent score,
   its direct absolute-coefficient conversion cannot improve that score.
3. **Keep a retuned cubic proof as a bounded milestone.**
   If pursuing `1.402`, focus a uniform norm certificate inside the
   certified epsilon window, rather than extending the false `.745`
   target. The decisive lemma remains a cap over all actual coupled
   tensors, not the invariant model's numerical maximum. A single
   rigorously integrated actual pair above `500/701` falsifies a selected
   epsilon. The new ceiling limits the reward even if that proof succeeds.

These priorities use realizable response spectra as shared evidence.
They do not assume that difficulty on the two sides comes from one
missing theorem, or that the preferred conjectural value is correct.

## Replay

With Python and python-flint 0.9.0 available, run from the worktree:

```sh
python -I tools/verify_cubic_family_floor.py tools/cubic_family_floor.json
python -I tools/verify_cubic_family_floor.py tools/retuned_cubic_point.json
python -I tools/verify_cubic_family_floor.py tools/cubic_window_left.json
python -I tools/verify_cubic_family_floor.py tools/cubic_window_right.json
python -I tools/check_cubic_family_floor.py --verifier tools/verify_cubic_family_floor.py --certificate tools/cubic_family_floor.json
lake env lean Grothe/LowerAnalytic/ScalarCubicFamilyCeiling.lean
```

The external integral replays are small; optimization and QMC search ran
only in the task's own droplet directory, with a recorded PID and wait.
The additional rectangle replay is:

```sh
python -I tools/verify_balanced_endpoint.py tools/cubic_endpoint_cap.json
```

Run the rectangle replay in the task's own droplet directory. The saved
result records source/input hashes and the exact outward rational cap.
