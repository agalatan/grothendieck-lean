# Radial weights couple the six energies of an actual response

Agent-ID: codex-a7c4. Task #800. **P + C, author only.** At visible amplitude
$t\ge .826$ and $\varepsilon=.752$, a physical remote energy of at least $.04$
forces the total even energy below $.04031$, in every dimension and for arbitrary
sharing. At $t=.826$ the single ellipsoid in 2.12b permits even energy greater
than $.05747$ at that same remote energy. The result concerns response feasibility.
The simultaneous payoff on the remaining responses still needs a separate estimate.

## Which energies can occur together?

Use the two response slots $h=(f+g)/2$, $k=(f-g)/2$, with $|f|,|g|\le1$,
$P_{1,0}h=tZ$ and $F=\varepsilon P_{2,1}k$. Write $T=|Z|^2$, with exponential
law of mean one, and use the six physical energies from
[the proof of 2.12b](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md).
Let $V=E_A+E_B$, $W=E_Q+E_P+E_\nu$ and $D=\varepsilon^2(\pi/4-t^2)$.
The components of the following vectors are in the same order:
$$
x=(t,\sqrt{E_q}/\varepsilon,\sqrt{E_A}/\varepsilon,\sqrt{E_B}/\varepsilon,
          \sqrt{E_Q}/\varepsilon,\sqrt{E_P}/\varepsilon,\sqrt{E_\nu}/\varepsilon),
\qquad
b(T)=(T,1,(T-1)^2,T^2/2,T,T,T(T-2)^2/2).
$$
For any strictly positive radial weight $w(T)$ with $J=\mathbb Ew$ and
$K_j=\mathbb E[b_j/w]$ finite,
$$
                        \sum_j x_j^2/K_j\le J.                         \tag{1}
$$
Indeed $|h|^2+|k|^2=(|f|^2+|g|^2)/2\le1$, so $\int w(|h|^2+|k|^2)\le J$. In the direct sum
of the two weighted $L^2$ spaces, test $h$ against $Z/w$ and $k$ against an
orthonormal Gaussian basis of each cubic sector divided by $w$. Their squared
norms are $K_j$. Distinct visible angular frequencies remain orthogonal.
Within the same frequency the remote cubic and linear fields are orthogonal,
and the remote quadratic $Q$ is centered, which makes it orthogonal to the
visible cubic. Weighting by a function of $T$ preserves both cancellations.
Bessel's inequality proves (1). Choosing $w=\sqrt T$ recovers 2.12b. The
[October manuscript, chapter 25](../manuscript/legacy/ch25-parts/70-canonical-ellipse.tex)
already calculates these sector integrals and applies a first-chaos penalty in
the $k$ slot. Equation (1) uses the two response slots directly and leaves that
penalty available for the payoff.

There is a one-dimensional test for the intersection of **all** the regions (1):
for all $a_j\ge0$ it is equivalent to
$$
                 \sum_j a_jx_j\le\mathbb E\sqrt{\sum_j a_j^2 b_j(T)}.    \tag{2}
$$
For fixed $a$, Cauchy–Schwarz applied to (1) gives the left side at most
$\sqrt{J\mathbb E[g/w]}$, $g=\sum a_j^2 b_j$. Its infimum over $w$ equals
$\mathbb E\sqrt g$: take $w=\sqrt g+\delta$ and let $\delta$ decrease to zero,
using $g/w\le\sqrt g$. Conversely the right side of (2) is at most
$\sqrt{J\sum a_j^2K_j}$ for every admissible $w$. Choosing $a_j=x_j/K_j$
gives (1), including $x=0$. This equivalence describes the information available
from these weights. Actual responses may satisfy further restrictions.

## Certified exclusions

For $w=\sqrt{T+r^2}$, set $M_j=\mathbb E[T^j/w]$. The following are
upper endpoints rounded outward. Increasing every denominator and the right
side of (1) preserves the necessity of the inequality.

| $r$ | $J$ | $M_1$ (visible, $Q,P$) | $M_0$ (remote) | $K_A$ | $K_B$ | $K_\nu$ |
|---:|---:|---:|---:|---:|---:|---:|
| .1 | .894465 | .878576 | 1.588929 | 1.156745 | .662484 | .765587 |
| .2 | .916975 | .859617 | 1.433950 | 1.027115 | .656200 | .743072 |
| .3 | .951022 | .833838 | 1.302044 | .927264 | .646448 | .714870 |
| .4 | .994471 | .804240 | 1.188941 | .848373 | .633956 | .684792 |

The $r=.3$ row suffices for three cuts.

- For every $0\le t\le .8393$ and $E_q\ge .95D$, one has $V<.54D$.
  Row 2.12b alone permits $V=.7875D$ at $E_q=.95D$ with $E_B=W=0$.
- For $0\le t\le .826$, $E_q\ge .95D$ and $V\ge .50D$ together imply
  $E_B<.041D$ and $W<.016D$. To see the separate charges, the even contribution
  is $V/K_A+E_B(1/K_B-1/K_A)$ and the odd contribution is at least $W/M_1$
  for the rounded row. After substituting the stated fractions of $D$, each
  claimed cut reduces to a strict affine inequality in $t^2$ at two endpoints.
- Fix $\varepsilon=.752$ and $t\ge .826$. The entire region
  $E_q\ge .04$, $V\ge .04$, $W\ge .005$ is excluded. At its corner and
  $t=.826$, 2.12b has more than $.00664$ of slack with $E_B=E_\nu=0$;
  (1) is violated by more than $.00476$ in physical-energy units, even with
  the cheapest possible distribution within both grouped sectors.

Weights chosen for the even contribution give stronger absolute cuts, again for
$\varepsilon=.752$, $t\ge.826$ and every odd energy.

| $E_q$ at least | $V$ strictly below | $s$ | $k$ |
|---:|---:|---:|---:|
| .02 | .05384 | .02 | .15 |
| .03 | .04711 | .05 | .10 |
| .04 | .04031 | .05 | .10 |
| .05 | .03347 | .05 | .075 |

For these four rows use a positive piecewise-constant weight. On each of the
256 intervals $[i/16,(i+1)/16)$ take $m=(2i+1)/32$; on $[16,\infty)$ take
$m=17$. The weight on that entire interval is $\sqrt{m+s+k(m-1)^2}$ rounded
down to a multiple of $2^{-80}$. Every bin, including the infinite tail, is
integrated exactly up to outward rational enclosures. For fixed $t$ and
$E_q$ the resulting upper bound on $V$ is
$\max(K_A,K_B)[\varepsilon^2(J-t^2/M_1)-E_q/M_0]$. An increase in either
$t$ or $E_q$ only decreases this bound.

## Replay

Run `python3 -IB research/conjecture-K/code/radial-response-weights-codex-a7c4/verify.py`.
The [standard-library checker](../../code/radial-response-weights-codex-a7c4/verify.py)
computes the smooth rows from $M_0=e^{r^2}(\sqrt\pi-2\int_0^r e^{-z^2}\,dz)$,
$J=r+M_0/2$, $M_1=J-r^2M_0$ and
$M_{j+1}=(j+1/2-r^2)M_j+jr^2 M_{j-1}$ for $j=1,2$. These are the
chapter 25 recurrences. It encloses the integrals for the step weights by
subtracting adjacent exponential tails; integration by parts gives
$\int_x^\infty T^j e^{-T}dT=e^{-x}P_j(x)$ with $P_0=1$,
$P_j=x^j+jP_{j-1}$. It recomputes all exclusions and rejects a one-unit
inward change to the tabulated remote denominator.
