# Two central contacts limit the signed fifth schedule

Apply the [joint cubic Rice estimate](JOINT_CUBIC_RICE.md) to the [117 repriced segments](REPRICED_SIGNED_ENDPOINT.md). The best reciprocal achievable by the current scalar upper estimates lies strictly between **1.40202774652 and 1.40202774653**. Every positive fifth debit $d\le(1-w)/10000$, at every first-chaos weight $0\le w\le1$, gives a worse scalar upper estimate than an available zero-debit choice. This statement concerns these particular upper estimates. A physical phase pair need not attain either central price.

The [new angular fifth bound](CENTRAL_FIFTH_FLOOR.md) raises the actual, all-dimensional fifth-difference floors at the two contacts to $-.122962$ and $-.053226$. They also retain the nonnegative terms $\|P_{2,1}k\|^2/2+3\|P_{1,0}k\|^2/8$. The amplitude-only floors still allow a detrimental sign. A stronger fifth estimate depending on proximity to a physical row extremizer could permit progress. [Shifted fifth stability](SHIFTED_FIFTH_STABILITY.md) and [upper planes at large remote cubic energy](FULL_FIFTH_PLANES.md) give two estimates for that investigation.

## Signed and zero-debit controls

Each integer in the table is an exact upward-rounded scalar price in units of $10^{-13}$. A smaller price gives a larger Grothendieck lower bound for the specified witness. The calculations combine the actual $.149$ joint high-amplitude coefficient with all the repriced central quadratics.

| First-chaos weight $w$ | Fifth debit $d$ | Scalar price numerator | Zero-debit numerator at the same weight |
|---:|---:|---:|---:|
| .0000533005 | .00000001 | 7132526482511 | 7132526466222 |
| .00005328 | 0 | 7132526460178 | 7132526460178 |
| .000054 | .000000025 | 7132526713346 | 7132526672639 |
| .0000605074 | .00000001 | 7132528613915 | 7132528616190 |

The first row gives a nonzero fifth witness with reciprocal $>1.40202774213$. Its matched pure control already gives $>1.40202774533$, and the second row gives the best certified value above. For the third row the matched comparison reverses upon introducing the stronger joint high-amplitude estimate. The final row still exhibits a fifth advantage at fixed weight, but its absolute reciprocal is smaller.

## An obstruction uniform in the debit and the first-chaos weight

Use two rational amplitudes, each strictly inside exactly one of the 117 closed pieces. The first belongs to cell 24 and is chosen just inside its common subdivision endpoint. The second belongs to cell 30:
$$
 t_1=167530517578123/200000000000000,\qquad t_2=43091569/50000000.
$$
Let $a_i$ be the zero-weight, zero-debit sparse price there. At each contact the sparse price is
$$
 a_i+m_iw+z_id,\qquad m_i=t_i^2-a_i,\qquad z_i=3371/2000-41t_i^2/20.
$$
At zero weight the alternative high price exceeds $a_i$ by more than $.0150$ and $.0069$, respectively. The replay checks that each margin exceeds $(3\pi_{\rm lo}/256+z_i)/10000$. Since the difference of high and sparse prices is the zero-weight margin times $1-w$, less the debit times $3\pi_{\rm lo}/256+z_i$, both supporting lines survive throughout the allowed debit range, even if the high estimate can be selected separately at each amplitude.

The slopes $m_i$ are approximately $-.0115914056$ and $+.0295022534$. The convex share $m_2/(m_2-m_1)\approx.71792715$ cancels $w$. The resulting necessary price is strictly greater than $.7132526460176+.2233320d$. At zero debit its reciprocal already gives the claimed upper end of the narrow window.

To handle arbitrarily small positive debits, first exclude $w$ outside $[.000052,.000054]$. There one supporting line exceeds the second table row even at $d=0$, and both $z_i$ are strictly positive. For weights inside this interval the pure price is attained on $t\le.88$. Specifically, taking the sparse price from $.88$ to $.885773796896554$ and the high price above that switch bounds the upper interval by $.71325239734$, strictly below the central supporting-line lower bound. Both endpoints of the weight interval suffice because each estimate is affine in $w$.

Over $t\le.88$, every sparse fifth penalty is strictly positive. Even at $w=0$ the high price exceeds the sparse pure price uniformly by more than $.00156403$, and after scaling by $1-w$ the maximum high discount $3\pi_{\rm lo}d/256$ cannot use up this margin. Thus a fixed $d>0$ increases the pointwise price above the pure sparse price by a uniform positive amount throughout the lower interval. The pure envelope uses that sparse price there and is strictly smaller at its maximum as well. The [exact replay](code/combined_central_profile.py) checks all seven table entries, the two interior contact lines, every quadratic maximum and minimum, and the interpolation ranges. Its check of the former [57-piece comparison](code/joint_cubic_schedule.py) uses the same high multiplier.

From the repository root run `python3 -IB -O experiments/quintic-signed/code/combined_central_profile.py`.

Agent-ID: codex-a7c4
