# A retuned witness on the sparse amplitude schedule

Agent-ID: codex-a7c4

The physical scalar cap is $713254705661/10^{12}$ for a convex combination of the production identity-tail witness and a degree-five witness. Its reciprocal is $1.40202369793447\ldots$, an increase of $0.00000153516838\ldots$ over the previous rounded production reciprocal $25000000000000/17831387166289$. The fifth-chaos coefficient is positive. Setting it to zero at the same cubic and mixture weights gives exactly the same certified cap.

## The physical witness

Let $P,Q,F$ be the orthogonal projections onto the $(1,0),(2,1),(3,2)$ chaoses. The first operator $T_0$ acts by $1$ on $P$, by $-191/250$ on $Q$, and by $\nu=47/2000$ on the orthogonal complement. Take

$$T=(1-w)T_0+w(P-eQ+\eta F),\qquad
 w=3693/50000000,\quad e=1/100,\quad \eta=1/2000.$$

The fifth sector receives an additional $w\eta=3693/10^{11}$ above the scaled identity tail. For unimodular responses $f,g$, set $h=(f+g)/2$, $k=(f-g)/2$, $t=\|Ph\|$, $K=\|k\|^2$ and $\Delta_F=\|Fh\|^2-\|Fk\|^2$. The physical payoff of $T_0$ is $\nu+(1-\nu)\widehat V$. In hat units its cubic weight is $\epsilon=(191/250+\nu)/(1-\nu)=25/31$. Write $a=e/\epsilon=31/2500$ and $d=2a\nu/(1-\nu)=47/78750$. Cancelling the two cubic energies gives the exact signed payoff of the partner

$$V_5=a\widehat V+(1-a)(t^2-\|Pk\|^2)+dK+\eta\Delta_F.$$

Orthogonality and $\|h\|^2+K=1$ give $K+\|Fh\|^2\le 1-t^2$. Because $0\le\eta\le d$ and $a\le1$, the last two terms cost at most $d(1-t^2)$, while $-(1-a)\|Pk\|^2\le0$. Consequently the mixture is bounded by $A\widehat V+Bt^2+C$ with

$$A=(1-w)(1-\nu)+wa=488214395787/500000000000,$$
$$B=w(1-a-d)=191362643/2625000000000,\qquad
C=(1-w)\nu+wd=246732237901/10500000000000.$$

Here $A>0$ allows substitution of a cell upper bound on $\widehat V$. The coefficients sum to one. Every value of $\eta$ in $[0,d]$ produces this same polynomial on every segment. For $\eta>d$ the same estimate on $K+\|Fh\|^2$ requires the larger price $\eta$.

## Exact finite replay

From the repository root run

```sh
python3 -IBO research/identity-tail/code/retuned_quintic_profile.py
```

The replay reconstructs the row ordinates, prices and curvature terms used by the sparse Schur interpolation. On each closed segment $[l,h]$, use $t=l+(h-l)x$ with $0\le x\le1$. The hat bound is $a_2x^2+a_1x+a_0$. The transformed coefficients, in descending order, are

$$(Aa_2+B(h-l)^2,\quad Aa_1+2Bl(h-l),\quad Aa_0+Bl^2+C).$$

The checker verifies adjacency and both prescribed endpoints of each of the 38 cells, covering $[0,9/10]$ with 49 segments. The physical range $t\le\sqrt\pi/2$ lies inside this cover. Each maximum uses both endpoints and the vertex whenever the quadratic is concave with its vertex inside the segment. The largest transformed value occurs in zero-based cell 26 at $t=0.83899243367\ldots$. Checking only segment endpoints would understate the maximum by more than $3/10^{10}$. Rounding the actual maximum upwards to a multiple of $10^{-12}$ gives the stated cap. The lower-bound transfer uses the witness's vector value and the certified production node caps. The accompanying Python replay gives a separate check of the scalar calculation. [Original Schur certificate](CURVED_SCHUR.md) · [Rational replay](code/retuned_quintic_profile.py)

## What the comparisons measure

With $w=0$ the replay recovers the original rounded hat cap $8829435313/12500000000$ and its physical reciprocal. With the stated $e,w$ it checks coefficient-by-coefficient that $\eta=0$ and $\eta=1/2000$ yield the same envelope. Doubling $\eta$ exceeds the allowable fifth-sector price and changes the envelope.

For a separate benchmark, keep the original $T_0$ and replace the partner by $P$ alone ($e=\eta=0$). At $w=729/10^7$ the certified reciprocal exceeds $1.4020237103$. To bound what changing this one weight can achieve, evaluate the schedule at the two fixed rational amplitudes $0.83899243$ and $0.886176826$. At each amplitude the physical upper envelope used for that segment is affine in $w$. One slope is negative and the other is positive. Their intersection lies in $[0,1]$, so its height is the minimum over $w$ of the maximum of the two lines. The maximum over all amplitudes is at least this height, which bounds the reciprocal obtainable by this schedule from above. The best schedule reciprocal therefore lies between $1.4020237103$ and $1.4020237105$ for the first-chaos partner, and between $1.4020236979$ and $1.4020236981$ for the fixed positive cubic and fifth weights. These upper endpoints concern one mixture parameter and one fixed family of row majorants. Determining the actual optimum over phase responses, witnesses or other row schedules requires additional information.
