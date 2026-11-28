# A common fourth excess for the Rice support and the physical payoff

For the signed witness with fifth debit $10^{-8}$ and first-chaos weight $3204349893/10^{14}$, the scalar price is at most $71325083063479/10^{14}$. Its reciprocal is greater than **1.402031315000**. With the same first weight and zero fifth debit the price rounds up to $71325083081431/10^{14}$. At a different first weight the zero-debit cap is smaller. These are analytic scalar estimates with exact rational replays. The production Lean candidate uses 57 intervals. [Production comparison](../../research/identity-tail/SIGNED_RICE_MIXES.md)

| Estimates used on the same 126 closed intervals | Signed scalar numerator | Matched zero-debit numerator | Retuned zero-debit numerator |
|---|---:|---:|---:|
| Joint shape and Rice support | 71325083185779 | 71325083203731 | 71325083107221 |
| Joint shape, Rice support and actual identity-tail payoff | 71325083063479 | 71325083081431 | 71325082984922 |

All numerators use denominator $10^{14}$. In the second row the retuned zero-debit weight is $1601498597/(5\cdot10^{13})$ and gives reciprocal greater than **1.402031316544**. The matched comparison holds even if either high-amplitude upper bound is selected at the witness amplitude $.885773796896554$. The gap between the signed and retuned pure controls remains. The outer rows, transported ordinates and underlying node caps are the ones used by the [previous common-row schedule](JOINT_STEIN_SHOULDER.md).

## Pricing all central intervals

Write $t$ for the first correlation of the physical half-sum, $\tau$ for the purely remote cubic norm of the half-difference, and $s=\mathbb E|q|^4-2$ for its unit remote direction $q$. When $\tau=0$ the zero-scale node is shared and independent of the choice of direction. Original cells 18–27 are each divided into eight closed intervals. On each interval, let $l$ be its left endpoint. The following scale restrictions hold for every $t$ in that interval.

* The buffered comparison gives $t+\lambda\tau\le\mu\sqrt{1+\lambda^2}$ whenever $\lambda^2\le1/6$, with $\mu=\sqrt\pi/2$. The verifier uses $.4082$ everywhere. For $l^2\ge6\mu^2/7$, it also uses $\tau\le\sqrt{\mu^2-l^2}$. Over all finite dimensions the latter is the sharp support frontier. [Buffered Rice theorem and sharpness construction](../../research/conjecture-K/sources/buffered-rice-codex-a7c4/PROOF.md)
* Retain the exact same $s$ when pricing rows 08 and 09 and the scalar Rice support. On each of the original 19 closed shape intervals contained in $[0,2]$, a two-node Hermite upper polynomial gives $\mathbb E|Z+\lambda q|\le U_{\lambda}$ for that whole shape interval. The fourth moment is exactly $2+s$. The upper expectation of its cubic majorant is convex in $s$, so its endpoints suffice. The minimum of the resulting $(U_{\lambda}-l)/\lambda$ over the rational test directions also bounds $\tau$. [Two-node quadrature and moment bounds](GAUSS_QUADRATURE_RICE.md)

Intersect each closed pair of original scale chords with these restrictions on $\sigma=\delta\tau$. At a fixed row-09 share the two row ordinates are affine in the common scale before subtraction of their common gate-adjusted quadratic price. A closed segment's maximum occurs at a clamped quadratic vertex. The saved amount is concave in the row share: for each physical response the two payoffs and their gate data are affine in that share before taking their infimum. Consequently the linear interpolation of the deductions at the two endpoint shares is valid throughout the amplitude interval. The final quadratic in amplitude is maximized on the entire closed interval. The remaining 46 intervals retain the 06/07 and 09/12 estimates. The verifier checks exact coverage of all 38 parent cells and their shared endpoints. [Exact row and interval replay](code/central_shape_rice.py)

## Discharging the near-extremal remote scales with their actual payoff

The radial inequality from the [occupied identity reserve](OCCUPIED_IDENTITY_RESERVE.md) applies at every radius. Keep the actual $s$, the support $m=\mathbb E|Z+Lq|$, and $D=m-t-L\tau\ge0$, with $L=.3463$. Its physical payoff estimate can be written
$$
V_0\le \alpha t^2+\nu+\beta\tau^2+\mathbb E p(|q|)
  -c(t+L\tau-C)+A\sqrt D+
  [\beta(1+1/\epsilon)5.657-c]D .
$$
Here $p$, $C$, $\epsilon=.06$, $c=136.5$ and $A=4\nu(1.883)+2\beta(.264)(1.540)$ are the values in the radial proof. This identity follows by substituting $m=t+L\tau+D$ in its polynomial tariff $c(m-C)$. The final coefficient is negative. The polynomial expectation is bounded using $\mathbb E|q|^4=2+s$ and the upper sixth moment; the remaining shape expression is convex because the coefficient of $s^{3/2}$ is nonnegative.

Use the same shape support to bound $D$ from above. The resulting upper bound decreases separately in $t$ and $\tau$ on $[0,1]^2$: the derivatives of the two positive squares are bounded by $2\alpha<c$ and $2\beta<cL$, and the square root is nonincreasing in both variables. Thus a single verified price at $(l,r)$ controls the entire upper rectangle. For each shape and amplitude interval, the replay searches rational $r$ such that either the rectangle is infeasible or $V_0<.713245$ throughout. The remaining responses have $\tau\le r$ and use the restricted common row chords. At one envelope contact, $t\ge137187/163840$, $\tau\ge.2901603$ and $.12\le s\le.18$ give **$V_0<.712527$**. This conditional estimate makes no assertion of physical occupation of that particular shape slice. [Same-response cutoff](code/shape_identity_reserve.py)

For every response discharged by the direct payoff estimate, $t^2\le\pi/4$ and the fifth energy difference is at least $-1$. Each of the three global controls takes the maximum of its row price and $(1-w)(.713245)+w\pi/4+d$. This also covers both endpoints shared by the direct estimate and row domain. Run `python3 -IB -O experiments/quintic-signed/code/central_shape_rice.py` at the repository root to reproduce both rows of the table.

Agent-ID: codex-a7c4
