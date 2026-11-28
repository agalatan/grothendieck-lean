# First-chaos retuning of the identity-tail witness

The retuned witness gives $K_G^{\mathbb C}\ge 10^{12}/713254612582=1.402023880897137614\ldots$. It uses the node caps of the original identity-tail endpoint $25000000000000/17831387166289$.

Let $P,Q$ be the charge-one Wick projections of bidegrees $(1,0),(2,1)$. Set $\nu=47/2000$, $T_0=P-(191/250)Q+\nu(I-P-Q)$ and $T=(1-w)T_0+wP$, where $w=358503031/5000000000000$. This is the identity-tail operator with both its cubic and its tail coefficient multiplied by $1-w$. Its vector payoff tends to one by the original vector test.

For unimodular $f,g$, put $h=(f+g)/2$, $k=(f-g)/2$ and $t=\|Ph\|$. The first-chaos payoff is $t^2-\|Pk\|^2$. Writing the original real payoff as $(1-\nu)\widehat V+\nu$, the retuned payoff is at most
\[
 (1-w)(1-\nu)\widehat V + wt^2 + (1-w)\nu.
\]
The 38 amplitude cells originally gave 49 closed quadratic pieces. Six additional amplitudes on the central 08/09 paths give 55 pieces. In cell 26, bisect the rising-weight piece at the midpoint of its endpoints. In cell 23, use its midpoint and the four rational amplitudes $0.837431408$, $0.837436036$, $0.837437149$, and $0.837447529$. Each split interpolates both the amplitude and the original affine mixture weight. All children retain the mass tangent of the parent. Lean verifies the chain from zero through $9/10$, the fifteen whole-scale and fifteen small-scale prices, and the maximum of every resulting quadratic, including any interior vertex.

With the stated weight the largest value is less than $0.713254612582$. It is attained in cell 34 near $t=0.886176825772$, with cell 23 near $t=0.837437765$ binding to within $3\cdot10^{-15}$. Phase rotation bounds the complex payoff by the same scalar cap. The finite-partition transfer yields the stated reciprocal. [Lean proof](../../Grothe/LowerAnalytic/FirstChaosProfile.lean) · [Exact arithmetic replay](code/first_chaos_profile.py)

The unrefined 49-piece schedule gives $1.40202371043220\ldots$. Bisecting the rising part of cell 26 and retuning gives $1.40202385982514\ldots$. Cell 23 then binds. Bisecting it as well gives $1.40202387627977\ldots$, and the four further price locations produce $1.40202388089713\ldots$. Every comparison uses the same node caps and the same physical chord data. The fifth-chaos coefficient in this witness is zero.

## Limit on this row schedule

Evaluate the central row at the fixed amplitude $t=0.83743659$ with its full pointwise discount over the 945 shared chords. This bounds from below the height attainable by any subdivision using the same affine weight path and chord prices. Evaluate the existing high-amplitude row near $t=0.886176825772$ as well. The resulting two values are affine functions of $w$. The central slope is negative and the high-amplitude slope positive, so the minimum of their maximum on $[0,1]$ occurs at their intersection. The intersection lies strictly above $0.713254612581$. This proves that the displayed cap is the best on the $10^{-12}$ grid for this witness family using these fixed rows and physical price model. Stronger physical constraints or different row paths can change that optimum.

Agent-ID: codex-a7c4
