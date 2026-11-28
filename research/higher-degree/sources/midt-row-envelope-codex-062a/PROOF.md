# Continuous extrema of the scalar row bound in MIDT §6.3

Agent-ID: codex-062a. Refs #628. **P + C, author only.**

Set $T=500/701$. At radius $2287/2500$, the excess over $T$ of the scalar upper bound in
[MIDT §6.3](../degree5-midt-2026-11-25/NOTE.md) has the following extrema on $7/20\le t\le13/20$.
The open enclosures follow from exact rational comparisons.

| Scalar relaxation | Minimum excess | A minimizing $t$ | Maximum excess | A maximizing $t$ |
|---|---|---|---|---|
| Row squares discarded | $(0.0015387344,0.0015387345)$ | $(0.3851826526,0.3851826527)$ | $(0.0095284079,0.0095284080)$ | $(0.6320135611,0.6320135612)$ |

These are also the extrema for the original three numbered rows and the mass row. With **all fourteen
numbered rows of the final table and the mass row** retaining their square on the same vector, a
scalar allocation still gives $V>T+0.0011772030$ at every $t$ in the interval. This concerns
the strength of these inequalities. Existence of a unimodular pair realizing those energies remains open.

## Constraints

Use $x=t^2$, $K=\|k\|^2$, $A=\|Qk\|^2$, $e=39/50$, $a=779/10000$, $E=25/31$, $n=47/1953$,
$r=e/E$, $M=1/2+2n$, and $\rho=2287/2500$. For each numbered row let
$H_j=x-2\ell_j t+C_j$, and for the mass row let $H_m=(1+x)/2+S$ and $\beta_m=0$.
The [row table](../../../identity-tail/sources/stage0d-2026-11-17/ROW_CONSTANTS.txt)
gives all coefficients and $S$ as fractions. The capped cubic energy satisfies

$$0\le A\le\min\{K,\rho^2-(2/\pi)x,(S+MK)/E\}.$$

First consider the retained squares. Set $Qh=-u v$ with $u=3/80$, where $\|v\|^2=2$ by
[`norm_vL_sq`](../../../../Grothe/Lower/RowReduction.lean). Write $N=2u^2$ and
$D_j=2E(u-\beta_j/E)^2$. The square in row $j$ is exactly $D_j$, including in the mass row.
Give $Rh$ squared norm $1-x-K-N$, constrain $0\le K\le L=1-x-N$, and set
$Pk=Rk=h'=0$. The unused $k$ energy is $K-A$. MIDT (1.1) and the definition of the hat payoff then give

$$V=b+eA-aK,\qquad b=(1-a)x+a-(e+a)N,\qquad
\widehat V=x+E(A-N)-2nK\le H_j-D_j.$$

For the original square-discarding relaxation use $N=0$ and **discard** $D_j$ in every row.
Substituting $u=0$ in the retained squares is a different constraint.

## Eliminating the energy variables

Substitution bounds $V$ by two increasing affine functions $b_i+m_iK$, with
$(b_i,m_i)=(b,e-a)$ and $(b+rS,rM-a)$, and sixteen decreasing functions $d_j-s_jK$.
The radius contributes $(d,s)=(b+e(\rho^2-(2/\pi)x),a)$. Each row contributes

$$ d_j=r(H_j-D_j)+(1-r-a)x+a-aN,\qquad s_j=a-2rn>0.$$

At fixed $t$ the greatest payoff allowed by these lines and $0\le K\le L$ is the least of

$$ b_i+m_iL,\qquad d_j,\qquad
p_{ji}(t)=\frac{m_i d_j+s_j b_i}{m_i+s_j}.$$

Indeed, feasibility for a payoff $z$ requires $K$ above both $(z-b_i)/m_i$ and zero,
and below all $(d_j-z)/s_j$ and $L$. Comparing each lower endpoint with each upper endpoint
gives exactly the displayed conditions and $L\ge0$. For the retained allocation, the
certified payoffs exceed $T>b$ throughout the interval, so $A=(z-b+aK)/e$ is nonnegative.
The mass and energy lines enforce $A\le K$ and the mass cap. Thus the allocation obeys all rows
at once, including their convex mixtures.

## Certifying the extrema

Using $2/3$ in place of $2/\pi$ tightens the radius line since $\pi>3$. The resulting minimum
of 50 quadratics is a lower bound for the exact-radius envelope. All quadratics that supply the
matching upper bounds below are independent of the radius. The [verifier](../../code/midt-row-envelope-codex-062a/verify.py)
reads the rational coefficients from the source table and computes each quadratic from its values at $0,1,-1$.

* **Minimum.** Minimize each quadratic on the closed interval by evaluating its endpoints
  and, for positive leading coefficient, its interior vertex if present. The least of all 50 minima
  is attained by row 0.4 paired with the increasing mass line. The minimum therefore equals the value
  of that quadratic at its vertex for the original radius too.
* **Maximum.** Write $t_{jk}=(C_k-C_j)/(2(\ell_k-\ell_j))$. Split at
  $t_{0.4,0.6}$ and $t_{0.6,0.7}$. On the three resulting intervals, rows 0.4, 0.6 and 0.7,
  respectively, paired with the increasing energy line, supply convex quadratic upper bounds.
  Both endpoint values on each interval are at most $p_{0.6,\mathrm{energy}}(t_{0.6,0.7})$.
  At $t_{0.6,0.7}$ all 50 lower-envelope candidates are at least this high. Hence this crossing attains
  the global maximum. These same upper bounds apply to the original three numbered rows, whose
  envelope lies above the fourteen-row envelope and attains the same extrema.
* **Retained squares.** Repeating the minimum computation with $u=3/80$ attains the minimum
  at the same row, increasing line and vertex as before. Its excess lies in
  $(0.0011772030,0.0011772031)$. This gives a uniform lower bound even if the optimizer can vary $Qh$.
  As a control, forcing $Qh=0$ makes the row 0.7 and energy-line upper bound fall below $T$ at $t=13/20$.

The replay also reconstructs $K,A$ and checks the original energy identities, radius, mass and all
fifteen retained row inequalities at the extrema, the two endpoints, the first row crossing and $t=0.55$.

```sh
python3 -IB -O research/higher-degree/code/midt-row-envelope-codex-062a/verify.py
```
