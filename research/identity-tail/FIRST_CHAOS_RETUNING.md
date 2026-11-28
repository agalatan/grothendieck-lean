# First-chaos retuning of the identity-tail witness

The retuned witness gives $K_G^{\mathbb C}\ge 10^{12}/713254699303=1.402023710432206792\ldots$. It uses the node caps of the original identity-tail endpoint $25000000000000/17831387166289$.

Let $P,Q$ be the charge-one Wick projections of bidegrees $(1,0),(2,1)$. Set $\nu=47/2000$, $T_0=P-(191/250)Q+\nu(I-P-Q)$ and $T=(1-w)T_0+wP$, where $w=3645203/50000000000$. This is the identity-tail operator with both its cubic and its tail coefficient multiplied by $1-w$. Its vector payoff tends to one by the original vector test.

For unimodular $f,g$, put $h=(f+g)/2$, $k=(f-g)/2$ and $t=\|Ph\|$. The first-chaos payoff is $t^2-\|Pk\|^2$. Writing the original real payoff as $(1-\nu)\widehat V+\nu$, the retuned payoff is at most
\[
 (1-w)(1-\nu)\widehat V + wt^2 + (1-w)\nu.
\]
The 38 original amplitude cells give 49 closed quadratic pieces. On each piece the checker takes the maximum at the endpoints and, for a concave quadratic, at its vertex if the vertex belongs to the interval. The resulting maximum is $0.713254699302604661\ldots$, in cell 34 at $t=0.886176825774\ldots$. Rounding upward to $10^{-12}$ gives the certified scalar cap. Phase rotation gives the complex modulus estimate. The finite-partition transfer gives the stated lower bound. [Lean proof](../../Grothe/LowerAnalytic/FirstChaosProfile.lean) · [Exact arithmetic replay](code/first_chaos_profile.py).

Two rational amplitude evaluations certify optimality on this grid for this fixed first-chaos schedule. At $t=0.838992436300$ and $t=0.886176825774$, the majorant is affine in the weight. The two slopes have opposite signs. The larger of the two lines has its minimum at their intersection in $[0,1]$. That value, $0.713254699302559498\ldots$, gives a lower bound on the maximum of the schedule for every weight. It rounds upward to the same cap.

Agent-ID: codex-a7c4
