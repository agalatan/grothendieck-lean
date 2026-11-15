<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/secant_proof.md (file dated 2026-11-15 05:05). Only this line was added. -->
# Global secant curvature: analytic reduction and certificate contract

Agent-ID: **codex-6e2b**. 15 November 2026.

**Status.** The analytic statements below are **P**. The small-amplitude
bound in section 4 is **P+C**, using an already accepted scalar target in
`theta_candidates.txt` and the completed `theta_verify.cpp` certificate.
The global secant theorem is **P+C**: the complete compact certificate in
section 5 passed with 102,104 accepted boxes and 204,207 visits. No
numerical grid or value is treated as a proof of that step.
This route does not use localization of a maximizing sector.

The review source is the read-only sibling folder
`../gpt-tilted-sector-2026-11-15-review/REVIEW_2.md` and its
`secant_curvature.py`/`.log`. That review concerns an earlier snapshot.
Its global secant proposal is the target here; the following exterior and
small-amplitude proofs do not rely on the review's numerical scan.

## 1. Definitions and universal pointwise inequalities — P

Set

\[
a=699/1250,\quad b=179/1250,\quad d=2/5,\quad
A=T-d,\quad L=Z(a+bT),\quad T=|Z|^2,
\]

where `Z` is standard complex Gaussian. Write

\[
f(w,\rho)=\mathbb E_Z|L+w+A\rho|,\qquad
\beta_0(w)=\Re\mathbb E_Z[A\operatorname{ph}(L+w)],
\]

and for real `rho >= 0` define

\[
\operatorname{Rem}(w,\rho)
=2[f(w,\rho)-f(w,0)-\rho\beta_0(w)].                 \tag{1}
\]

Rotation of the visible Gaussian permits `rho >= 0`; conjugation then
permits `Im w >= 0`. The target is

\[
\boxed{\operatorname{Rem}(w,\rho)\le\frac{13}{20}\rho^2
\quad\text{for every }w\in\mathbb C,\ \rho\ge0.}       \tag{2}
\]

For complex `v != 0` and `h`, concavity of the square root gives

\[
|v+h|\le |v|+\Re(\overline v h)/|v|+|h|^2/(2|v|).
\]

Consequently the doubled norm remainder is nonnegative and bounded by
both `|h|²/|v|` and `4|h|`. Integrating with `v=L+w`, `h=A rho` yields

\[
0\le\operatorname{Rem}(w,\rho)
\le\rho^2\mathbb E\frac{A^2}{|L+w|},\qquad
\operatorname{Rem}(w,\rho)\le4M\rho,                 \tag{3}
\]

where `M=E|A|=2e^(-2/5)-3/5<3/4`. The source has a smooth planar density,
so the null set `L+w=0` does not affect the formulas, and the reciprocal
norm is locally integrable. Formula (3) holds before or after restriction
to any source event.

## 2. Large amplitudes — P

The elementary finite-series comparison
`e^(2/5)>1+2/5+(2/5)^2/2+(2/5)^3/6=559/375>40/27`
gives `M<3/4`. Therefore, for `rho >= 5`,

\[
\operatorname{Rem}(w,\rho)/\rho^2\le4M/\rho
<3/5<13/20.                                        \tag{4}
\]

This covers every complex `w` without any localization or tail error.
The sharper threshold `rho>=60/13` is also valid, since
`3/rho<=13/20`; the compact engine may use it to prune whole boxes.

## 3. The full exterior `|w| >= 6` — P

This argument covers every `rho`, even beyond the compact range. Split
the weighted source measure `A² d gamma` at `T=4`. Its total mass is
`34/25`, its tail mass is `(554/25)e^-4`, and

\[
\ell(4)=2(a+4b)=283/125,\qquad
6-\ell(4)=467/125,
\quad\ell(t)=\sqrt t(a+bt).
\]

The contribution of `T<=4` to the reciprocal-norm bound (3) is therefore
at most

\[
\frac{34/25-(554/25)e^{-4}}{467/125}.                 \tag{5}
\]

The radial map `z -> z(a+b|z|²)` has Jacobian
`(a+bt)(a+3bt)`. The pushforward of the tail weighted measure has density
bounded by

\[
D=\frac{(18/5)^2e^{-4}}{\pi(a+4b)(a+12b)}.
\]

Indeed its density at source radius squared `t` is
`(t-d)² e^-t/[pi(a+bt)(a+3bt)]`, and its logarithmic derivative is

\[
2/(t-d)-1-b/(a+bt)-3b/(a+3bt)<0\quad(t\ge4).
\]

For any nonnegative planar density bounded by `D` and of mass `m`,
layer-cake integration gives the uniform estimate

\[
\int\frac{g(z)}{|w+z|}\,dz\le2\sqrt{\pi Dm}.
\]

With `m=(554/25)e^-4`, adding this estimate to (5) gives

\[
\mathbb E\frac{A^2}{|L+w|}
\le\frac{170}{467}+e^{-4}
\left[\frac{36}{5}\sqrt{\frac{6925000}{805701}}
 -\frac{2770}{467}\right].                           \tag{6}
\]

Every bound can be closed by small rational comparisons:

\[
\sqrt{6925000/805701}<47/16,\qquad
 e^4>\sum_{k=0}^{11}\frac{4^k}{k!}
 =\frac{340217}{6237}>\frac{600}{11}.
\]

The coefficient of `e^-4` in (6) is positive. Hence

\[
\mathbb E\frac{A^2}{|L+w|}
<\frac{170}{467}+\frac{11}{600}
 \left(\frac{36}{5}\frac{47}{16}-\frac{2770}{467}\right)
=\frac{3603551}{5604000}<\frac{13}{20}.                \tag{7}
\]

Equations (3) and (7) prove (2) on the full exterior. This is an untilted
change of variables, so folds of the tilted map play no role.

## 4. Small amplitudes `rho <= 33/200` — P+C

Use the nonsingular real-projection function `R(k,z)` from
`theta_proof.md`, equations (3)–(5). For each `y>=0`, its real root `x`
satisfies

\[
bx^3+kx^2+(a+by^2)x+k(y^2-d)+z=0,
\]

and, with `t=x²+y²`,

\[
\mathcal R(k,z)=\int_0^\infty
\frac{(t-d)^2e^{-t}}{a+b(y^2+3x^2)+2kx}\,dy.
\]

The **already certified** row with zero-based index 161 in
`theta_candidates.txt` is

```
161 165138 377064 373547 649660 551070 649660
```

Its denominator is `10^6`. The unconditional scalar target in that row,
verified by the complete accepted cover in `theta_verify.cpp`, states

\[
\mathcal R(k,z)\le649660/10^6
\quad(0\le k\le165138/10^6,\ |z|\le23/4).             \tag{8}
\]

The symmetry `R(-k,-z)=R(k,z)` covers negative `k`. In particular (8)
applies to all `|k|<=33/200`. This uses a scalar target actually checked
by the engine, not a claim inferred from the final 3/4 matrix estimate.

Here is an analytic extension of (8) to the missing real `z` values.
For `|k|<=33/200`, the denominator is at least

\[
\gamma+by^2,\qquad
\gamma=a-\frac{(33/200)^2}{3b}>49/100.
\]

If `t<=7`, the root equation implies

\[
|z|\le\sqrt t(a+bt)+|k||t-d|
\le\frac83(a+7b)+\frac{33}{200}\frac{33}{5}
<\frac{23}{4}.
\]

Thus `|z|>=23/4` forces `t>7` at every source `y`. The function
`(t-d)²e^-t` decreases for `t>=7`, so the integral on `0<=y<=3` is at
most `3(33/5)²e^-7/(49/100)`. The uniform source-tail argument from
`theta_proof.md`, equation (9), bounds the remaining integral by
`19 e^-9/(12b)`. Since `e³>20` and `e>5/2`,

\[
\mathcal R(k,z)
<\frac{3(33/5)^2}{490}+\frac{19}{96000b}<\frac{27}{100}
<\frac{649660}{10^6}.                               \tag{9}
\]

For example `e³>20` follows from the finite sum through degree eight
`89641/4480>20`; all displayed comparisons are rational.

The projection identity and
`(2/pi) integral_0^pi n_theta n_theta^T dtheta = I` now give

\[
D_\rho^2f(w,\rho)\preceq(649660/10^6)I
\quad(w\in\mathbb C,\ |\rho|\le33/200).
\]

Integrating this Hessian along the segment from zero to `rho` proves

\[
\operatorname{Rem}(w,\rho)\le(649660/10^6)|\rho|^2
<\frac{13}{20}|\rho|^2\quad(0<|\rho|\le33/200).       \tag{10}
\]

The case `rho=0` is equality. This proof needs the original scalar
certificate, but no new small-amplitude optimization or quadrature.

## 5. Completed compact certificate — P+C

Only the following compact region remains:

\[
33/200\le\rho\le5,\qquad -6\le\Re w\le6,
\quad0\le\Im w\le6.                                \tag{11}
\]

The square contains the required disk `|w|<=6`; boxes wholly outside the
disk may be accepted by section 3. On this region define
`G(w,rho)=Rem(w,rho)-(13/20)rho²`.

A rigorous engine can bound `G` from corner values with a second-order
interpolation error. Write `j0=I0/2`, where `I0` is the certified integral
in REPORT.md; its certified enclosure gives `j0<179/125=1.432`. Then

\[
0\preceq D_w^2 f(w,0)\preceq j_0I,
\qquad\|D_w^2\beta_0(w)\|_{op}\le1.                 \tag{12}
\]

For the first bound, the planar density of `L` is radial decreasing;
its one-dimensional projection density is therefore largest at zero.
The norm's real-projection identity bounds its Hessian by its value at
the origin, namely `(I0/2)I`. For the second, the certified profile bound
`N_Phi<1/3` implies `|D²Phi[v,v]|²<=3N_Phi<1` for every unit vector `v`.
The linear subtraction in the profile does not affect second derivatives,
and taking the real component yields the claim for `beta0`.

The function `f(w,rho)` is jointly convex, because its argument is affine
before taking the norm and expectation. It is therefore at most its
multilinear corner interpolation on any rectangular box. Applying the
one-dimensional interpolation-error bound successively to the other
terms in `G` proves

\[
G(w,\rho)\le\max_{\text{corners}}G
 +\frac{j_0+\rho_{hi}}4(\Delta_x^2+\Delta_y^2)
 +\frac{13}{80}\Delta_\rho^2.                         \tag{13}
\]

No upper Hessian bound for the tilted `f(w,rho)` is used: its possible fold
singularities are handled by convexity. Mixed derivatives are unnecessary
for successive coordinate interpolation. The complete finite cover in `secant_verify.cpp` passed: 102,104 accepted
boxes, 204,207 visits, 7,788 analytic prunes, maximum subdivision depth 27,
and 154,239 distinct corner values. Every non-pruned accepted box has the
right side of (13) nonpositive. This proves the compact step using rigorous
corner enclosures, not floating-point samples.

The radial field is `Fraw(R)=R(c0+h(R²))`, with `Fraw(0)=0`, and
`beta0(w)=(Re w/|w|)Fraw(|w|)` away from the origin. The helper
`secant_profile_table.py` regenerates 602 rigorous values at
`0,.005,.015,...,5.995,6`. Each is enclosed by outward rational endpoints
with denominator `10^8`, after the audited signed-density quadrature
reduces its absolute radius below `5*10^-5`. Since (12) gives
`|Fraw''|<=1`, linear interpolation on a radial cell of width `h` has
additional absolute error at most `h²/8`. The maximum width is `.01`.
The default helper replays the `N_Phi<1/3` dependency; its explicitly
conditional skip mode is intended for a wrapper that already replayed it.
Saved data do not replace regeneration in the verification chain.

The adapter `secant_profile_dual.py` can reuse these freshly regenerated
values in the earlier Gaussian-probe content certificate. It reconstructs
`h(R²)=Fraw(R)/R-c0` at the first 300 positive midpoints, widens each by
`.005/sqrt(3)`, intersects with the certified global profile range, and
calls the unchanged `content_next_bound.verify_envelope`. All 602 exact
node locations and all 300 profile-cell endpoints are checked. The completed
run gave the outward upper bound `0.019830553181732655<1/50`. This preserves
the uniform content norm bound while avoiding 300 repeated source
integrals. The adapter's default command replays the profile dependencies
and regenerates the table; its skip mode is conditional on those preceding
steps in the calling verification chain.

Corners outside the radius-six disk need no table lookup: section 3 gives
`G <= (3603551/5604000-13/20)rho²` there. This also handles the exterior
corners of rectangular boxes that intersect the disk.

### Source-integral formulas and tails

With `ell(t)=sqrt(t)(a+bt)`, define the circular mean

\[
\mathcal M(\ell,v)=\max(\ell,v)
 \sum_{k=0}^\infty\binom{1/2}{k}^2
 \left(\frac{\min(\ell,v)}{\max(\ell,v)}\right)^{2k}.
\]

The source formula is

\[
f(w,\rho)=\int_0^\infty e^{-t}
 \mathcal M(\ell(t),|w+(t-d)\rho|)\,dt,
\]

and `beta0` is the corresponding angular-mean derivative. Its circle
function `j(nu)=C'(nu)/nu` is enclosed by the already audited
`localization_circle.hpp` series machinery; using that scalar utility
does not invoke localization of any sector.

The production `secant_verify.cpp` encloses each function value directly
by convexity-based quadrature, as follows. On an exact source cell `[l,h]`,
let

\[
m=e^{-l}-e^{-h},\qquad
\mu=\frac{(l+1)e^{-l}-(h+1)e^{-h}}m,\qquad
\lambda=\frac{\mu-l}{h-l}.
\]

These are the mass, conditional mean, and endpoint weight of the
exponential source. For fixed `w,rho`, define
`F(t,s)=M(s,|w+(t-d)rho|)`. This is jointly convex in `(t,s)` and
nondecreasing in `s>=0`. The latter follows from evenness and convexity in
the circular radius. It is also one-Lipschitz in `s`. Write `L(t)` for
the chord interpolating `ell(l),ell(h)`.

If `ell` is convex on the cell, Jensen's inequality gives the lower
conditional bound `F(mu,ell(mu))`. The upper bound is
`(1-lambda)F(l,ell(l))+lambda F(h,ell(h))`, since `ell<=L` and the
composition `F(t,L(t))` is convex.

If `ell` is concave on the cell, the lower bound is `F(mu,L(mu))`.
Let `U(t)=ell(mu)+ell'(mu)(t-mu)` be its tangent. The upper bound is
`(1-lambda)F(l,U(l))+lambda F(h,U(h))`. This uses `ell<=U` and convexity
along the affine tangent. The tests for the two regimes are exact, since

\[
\ell''(t)=\frac{3bt-a}{4t^{3/2}}.
\]

For a cell straddling the inflection, the checker uses
`H=(a+3bh)/(4l^(3/2))` as an upper bound for `|ell''|`, so that
`|ell-L|<=H(h-l)²/8`. The lower bound is `F(mu,L(mu))-H(h-l)²/8`, and
the endpoint upper bound receives the same additive error. The
one-Lipschitz property justifies both corrections. Multiplication by
`m` gives an enclosure for the unnormalized source integral. All masses,
means, tangents, errors, and function values are evaluated by directed
interval arithmetic.

The initial cell `0<=T<=epsilon`, where `epsilon=2^-20`, is handled
without a derivative at zero. Its exact mass is multiplied by
`|w-d rho|`, with an absolute error at most

\[
\frac23 a\epsilon^{3/2}+\frac25 b\epsilon^{5/2}
 +\frac12\rho\epsilon^2.
\]

This follows from `||L+w+A rho|-|w-d rho||<=ell(T)+rho T` and
`e^-T<=1`. At the opposite end, the function-value source tail is bounded
between zero and

\[
e^{-36}[37a+1370b+|w|+\rho(37+d)].
\]

Indeed `sqrt(T)<=T` and `T^(3/2)<=T²` for `T>=36`, and the remaining
exponential moments are exact. The adaptive queue subdivides cells until
the accumulated interval has the requested width; a cell-count limit
aborts instead of accepting an unresolved interval. No finite-difference
estimate or tilted Hessian enters this source quadrature.

The angular mean is enclosed by its positive 64-term series and the tail
`v^130*(4/pi-sum_(k=0)^64 c_k)` for `0<=v<=1`, where
`c_k=binom(1/2,k)²`; reciprocity treats larger radius ratios. The identity
`C(1)=4/pi` gives the complete tail mass. Thus the cell function
values themselves also have rigorous enclosures.

The source-cell derivation and implementation were independently audited;
three rigorous function-value enclosures were additionally compared with
independent numerical quadrature. Those numerical comparisons are a
sanity check, not an ingredient of the proof.

The following alternative combined-tail estimates are also available.
It is advantageous to bound the combined remainder's omitted source tail.
On `|w|<=6`, for `y>=Y` with `ell(Y²)>=12`, equation (3) gives

\[
\frac{\operatorname{Rem}_{|Z|\ge Y}}{\rho^2}
\le\frac2b\int_{Y^2}^\infty\sqrt t\,e^{-t}dt
\le\frac2b\left(Y+\frac1{2Y}\right)e^{-Y^2}.           \tag{14}
\]

At `Y=6`, this is `73 e^-36/(6b)`. For a discarded origin interval
`0<=|Z|<=epsilon`, where `epsilon²<=d` and `rho>=33/200`, the other bound
in (3) gives the normalized contribution at most

\[
\frac{4d}{33/200}\epsilon^2.                          \tag{15}
\]

Both tails are nonnegative. The parameter at zero inside an angular mean
has its continuous limiting value; it is not a singular source mass.

## 6. Consequence for every sector — P+C

The accepted compact certificate and sections 2–4 give (2) for all
complex parameters. Consequently, for every remote cubic and every
remote linear form, with `C=||c_(3/5)(q)||` and `sigma=||r||`,

\[
\mathcal J(q,r)\le2C\sigma-(P-13/20)\sigma^2
\le\frac{C^2}{P-13/20},\qquad
P-13/20=\frac{59009}{189100}>0.
\]

There is no Gaussian bad-event tail, maximizing-sector hypothesis, or
localization input in this conclusion. A further comparison of content
with the actual deficit is still required for the full tilted-sector
lemma on general tensors.
