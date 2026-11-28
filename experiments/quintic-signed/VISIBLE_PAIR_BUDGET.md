# A signed payoff budget for arbitrary unimodular pairs

Agent-ID: codex-a7c4. Let $P,Q,F$ be the orthogonal projections onto complex Gaussian chaoses of bidegrees $(1,0),(2,1),(3,2)$. Fix $e=191/250$, $\nu=47/2000$, and $0\le d\le\nu$. For the actual operator $S=P-eQ+\nu(I-P-Q)-dF$, every pair of unimodular functions in every positive finite complex Gaussian dimension satisfies
\[
 \operatorname{Re}\langle f,Sg\rangle\le B_d+3\cdot10^{-52}+(e-\nu)\|Qk\|^2
 -\big[(1-\nu)t+(1-e-2\nu-3d/4)\mu\big]\,(\mu-t).
\]
Here $h=(f+g)/2$, $k=(f-g)/2$, $t=\|Ph\|$, $\mu=\sqrt\pi/2$, and
\[
 B_d=\nu+(1-\nu)\pi/4-(e+\nu)\pi/32-d\,3\pi/256.
\]
For $f=g=\operatorname{ph} Z$ the value is exactly $B_d$. The result covers arbitrary pairs, without a conditional Gaussian representation. Its application to the full lower bound needs control of the remaining term $\|Qk\|^2$. The complex phase rotation that makes a general payoff real also changes $h,k$ and hence this term.

**All diagonal pairs.** For $g=f$ the cubic debit vanishes. The negative real arm is bounded in magnitude by $e(93/100)^2$ since only $Q$ has a negative eigenvalue and the [certified projection bound](../../Grothe/LowerAnalytic/WitnessCap.lean) applies to $f$. The diagonal pairing is real by self-adjointness. Consequently its supremum in absolute value lies between $B_d$ and $B_d+3\cdot10^{-52}$. Its reciprocal exceeds **1.40372082** at $d=1/50$ (positive fifth eigenvalue $7/2000$), and **1.40397477** at $d=\nu$. The pure operator always fails the restricted $1.4023$ comparison even after retuning its first-chaos weight, by the visible-phase lower test in the [Gaussian phase comparison](GAUSSIAN_DRIVER_BOUND.md).

**Nondiagonal central pairs.** At $d=1/50$ the displayed real upper bound is strictly below $10000/14023$ on $.83743\le t\le .837445$ provided $\|Qk\|^2\le .06500$. On $.83882\le t\le .83885$ the threshold is $.06324$. On all five adjoining central cells $1071/1280\le t\le2151/2560$ a common threshold is $.06129$. The assumption concerns the *entire* cubic projection of the actual half-difference. The [exact replay](code/visible_pair_budget.py) verifies the cutoffs and the two corresponding signed debits.

## Proof

Choose an aligned unit Gaussian coordinate $Z$ so that $Ph=tZ$. If $t=0$ any such coordinate suffices. Set $T=|Z|^2$, $\rho=1-\operatorname{Re}(\overline{\operatorname{ph} Z}\,h)$ and $\delta=\mu-t$. Then $0\le\rho\le2$, $T$ is exponential of mean one, and $\mathbb E[\sqrt T\rho]=\delta$. The visible projections of $u=\operatorname{ph}Z$ are
\[
 Qu=(\mu/4)(2-T)Z,\qquad Fu=(\mu/8)(3-3T+T^2/2)Z .
\]
Indeed only the visible coordinate can contribute by independence, and integrating the charge-one normalized Laguerre polynomials gives $\|Qu\|^2=\pi/32$, $\|Fu\|^2=3\pi/256$. For either projection $D$, expansion of the nonnegative square $\|D(h-u)\|^2$ gives
\[
 -\|Dh\|^2\le-\|Du\|^2+2\operatorname{Re}\langle u-h,Du\rangle.
\]
Using these two lower tangents together bounds the excess charged to $h$ by $\mu\mathbb E[\sqrt T\rho W(T)]$, where
\[
 W(T)=(e+\nu)(2-T)/2+(d/4)(3-3T+T^2/2).
\]
The separate terms in this polynomial can be large; their sum is what enters the payoff. In fact
\[
 W(T)-W(0)=T[-(e+\nu)/2-3d/4+dT/8]\le0,\qquad 0\le T\le128,
\]
since $128\nu/8<(e+\nu)/2$. Above 128, $W(T)-W(0)\le dT^2/8$. Using $\rho\le2$ and $T^{5/2}\le T^3$ there yields the excess bound
\[
 \mu W(0)\delta + \frac{\mu d}{4} e^{-128}
       (128^3+3\cdot128^2+6\cdot128+6)
 < \mu(e+\nu+3d/4)\delta+3\cdot10^{-52}.
\]
The integral is the third incomplete gamma moment of an exponential variable, obtained by three integrations by parts.

The spectral identity for the real payoff is
\[
 \nu+(1-\nu)(t^2-\|Pk\|^2)-(e+\nu)(\|Qh\|^2-\|Qk\|^2)
       -2\nu\|k\|^2-d(\|Fh\|^2-\|Fk\|^2).
\]
Since the two projections of $k$ are orthogonal and $d\le\nu$,
\[
 (e+\nu)\|Qk\|^2+d\|Fk\|^2-2\nu\|k\|^2\le(e-\nu)\|Qk\|^2.
\]
Dropping the nonpositive $Pk$ term, inserting the combined polynomial estimate, and using $t^2-\mu^2=-(t+\mu)\delta$ gives the stated budget. The factor multiplying $\delta$ is positive even at $t=0$. The magnitude of the negative diagonal arm and all rational roundings are checked independently of the endpoint schedule. This proof gives a real-payoff condition that can be intersected with an existing actual-pair row.

~~~sh
python3 -IB -O experiments/quintic-signed/code/visible_pair_budget.py
~~~
