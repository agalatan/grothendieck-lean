# Certified endpoint cap for the balanced pair

Let `Z,G` be independent standard proper complex Gaussians, so `|Z|²` and
`|G|²` are independent exponential random variables of mean one. Define

`H(Z)=Z(|Z|²−2)/sqrt(2)`,

`f_c=phase(Z+cH(Z)+cG)`, `g_c=phase(Z+cH(Z)−cG)`.

The verifier proves, for each of the production parameters
`c=119623/500000` and `c=14953/62500`, that

`Re E[conj(f_c)g_c] <= 176321757969/250000000000 = .705287031876 < .71`.

Conjugation symmetry makes these expectations real. The same upper bound
holds for every probability mixture of the two correlation kernels. The
mixing probability need not be known, rational, or estimated.

## Analytic reduction and monotonicity

After rotating by the phase of `Z`, put `R=|Z|²`, `T=|G|²` and

`u(R,c)=R[1/c+(R−2)/sqrt(2)]²`, `d=(u−T)/(u+T)`.

The relative angle is uniform. Direct multiplication of the two phases gives
the real angular integrand

`d/sqrt(sin²(theta)+d²*cos²(theta))`.

Its angular average is `C(d)=d/AGM(1,|d|)`, or equivalently
`(2/pi)*d*K(1−d²)`. The value at `d=0` is zero by continuity. For almost every
angle the displayed integrand is nondecreasing in `d`, since its derivative is

`sin²(theta)/(sin²(theta)+d²*cos²(theta))^(3/2) >= 0`.

The AGM integral identity is [NIST DLMF 19.8.4](https://dlmf.nist.gov/19.8.E4).

Thus `C(d)` is nondecreasing, without requiring differentiation under an
integral at the exceptional point. If `0<c<1/sqrt(2)`, the quantity
`a=1/c−sqrt(2)+R/sqrt(2)` is positive, and

`du/dR=a*(a+sqrt(2)*R)>0`, `du/dc=−2*R*a/c²<=0`.

Also `d` increases with `u` and decreases with `T`. Therefore the smallest
supplied parameter, `119623/500000`, maximizes the expectation and the upper
corner values used below.

## Complete probability-grid bound

For `n=1024`, let `q_i=−log(1−i/n)` for `i=0,...,n−1`, with `q_n=+infinity`.
Each exponential quantile interval `[q_i,q_(i+1)]` has probability exactly
`1/n`, so every product cell has probability exactly `1/n²`.

The union of the final `R` interval and the first `T` interval has probability
`2/n−1/n²=2047/1048576`. On this union use the universal bound `C<=1`.
Every other cell has finite upper `R` corner `q_i`, `i=1,...,n−1`, and finite
lower `T` corner `q_j`, `j=1,...,n−1`. Monotonicity bounds its entire angular
mean by `C(d(q_i,q_j))`. This also covers the final, unbounded `T` interval;
there is no omitted tail or truncation.

To bound a corner without an elliptic integral, start `a0=1,g0=|d|` and take
two AGM iterations `a_next=(a+g)/2`, `g_next=sqrt(a*g)`. The inequalities
`g2<=AGM(1,|d|)<=a2` imply

`C(d)<=d/g2` if `d>0`, and `C(d)<=d/a2` if `d<0`.

If the Arb interval cannot decide the sign, the verifier uses the safe bound
one. In the replay there were zero ambiguous signs.

Arb128 computes all logarithms, square roots, and sums as intervals. The
`1,046,529` interior-corner bounds, divided by `n²` and augmented by the exact
boundary mass, give

`[.70528703187597494925854918781199114 +/- 6.14e-36]`.

Rounding its upper endpoint outward to a rational denominator `10^12` gives
the stated cap. This is a finite interval certificate, with no optimization
claim or numerical quadrature error. The Gaussian reduction, monotonicity,
and AGM identities above are analytic paper arguments, not completed Lean
formalization.

## Consequence and scope

For these charge-one actual response pairs with their complete orthogonal chaos cross
coefficients `c_j`, Parseval gives `C(1)=sum_j c_j`. Writing the linear
coefficient as `p>=0` and the cubic coefficient as `s` gives

`sum_(j>=2)|c_j| >= |C(1)−p−s|`.

Consequently the usual absolute-coefficient score satisfies

`p−|s|−sum_(j>=2)|c_j| <= p−|C(1)−p| <= C(1)`.

Thus this same pair, or its probability mixture, cannot beat the incumbent
score `.711947` through this absolute-tail conversion: its score is at most
`.705287031876`. This conclusion does not prohibit signed cancellation
against additional rounding components. It also does not certify the full
spectral realization of the Gaussian-limit model. Applying it to the
finite normalized-G construction requires the separate exact Gaussian-law
and original-chaos projection identities used in that construction.
Those are supplied by the companion
[cubic-family proof](../miscellaneous/other-bounds/tree/docs/CUBIC_FAMILY_CEILING_2026-10-23.md); no asymptotic
spectral identification is assumed.

## Replay

Portable source: `tools/verify_balanced_endpoint.py`.
Input: `tools/cubic_endpoint_cap.json`.
The delivery bundle includes the saved original and independent root droplet replays.

Source SHA256:
`0746c6192aadaf3b66bb3548d9b767a82261077f30e5c31e301d8fd25e174370`.

Input SHA256:
`8e655f4309408eb8bc1f617699656e388aa497a52bd7c72046f6bd57372679df`.

The droplet run completed in `4.54` seconds using python-flint `0.9.0`.
