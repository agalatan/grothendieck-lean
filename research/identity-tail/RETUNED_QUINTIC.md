# First-chaos retuning and a fifth-chaos companion

The retuned identity-tail witness gives
$K_G^{\mathbb C}\ge 10^{12}/713254699303=1.402023710432206792\ldots$.
The first-chaos projector alone suffices for this lower bound. A positive interval of additional fifth-chaos coefficients gives the same scalar cap when rounded upward to the certificate grid of $10^{-12}$. The two unrounded envelopes differ.

## Operators and scalar estimate

Let $P,Q,F$ be the charge-one Wick projections of bidegrees $(1,0),(2,1),(3,2)$ respectively. Write
$T_0=P-(191/250)Q+\nu(I-P-Q)$, where $\nu=47/2000$, and set
\[
w=3645203/50000000000,\qquad T=(1-w)T_0+wP,\qquad T_\eta=T+w\eta F,\quad 0\le\eta\le1/50000000.
\]
The largest extra fifth multiplier is $3645203/2500000000000000000$. For $\eta=0$, the operator is exactly the existing identity-tail witness with both its cubic and its tail coefficient multiplied by $1-w$. Its vector payoff tends to one by the original vector test. Each $T_\eta$ has a positive semidefinite perturbation, so the same vector field still gives a value tending to at least one.

For a pair of unimodular scalar responses put $h=(f+g)/2$, $k=(f-g)/2$ and $t=\|Ph\|$. The real payoff of $T_0$ is $(1-\nu)\widehat V+\nu$, and the real payoff of $P$ is $t^2-\|Pk\|^2$. Orthogonality gives
\[
 \|Fh\|^2-\|Fk\|^2\le \|h\|^2-t^2\le 1-t^2 .
\]
Consequently the payoff of every $T_\eta$ is at most $A\widehat V+B t^2+C$, with $L=w/50000000$ and
\[
 A=(1-w)(1-\nu),\qquad B=w-L,\qquad C=(1-w)\nu+L.
\]
The first-chaos proof applies the certified phase budget directly to the original retuned operator, rotates the phase to control the complex absolute value, then uses finite-matrix transfer. The companion proof bounds the additional fifth projection on the same pair. [First-chaos proof](../../Grothe/LowerAnalytic/FirstChaosProfile.lean) · [Companion family](../../Grothe/LowerAnalytic/QuinticHybridTransfer.lean)

## Exact replay and controls

From the repository root run

```sh
python3 -IBO research/identity-tail/code/retuned_quintic_profile.py
```

The replay reconstructs all 49 closed segments of the 38 amplitude cells from the original row data. On a segment $t=l+(h-l)x$, it substitutes the certified quadratic for $\widehat V$ and takes the maximum over both endpoints and every interior vertex. The row majorants, the weights, and every comparison are rational. [Rational replay](code/retuned_quintic_profile.py) · [Original Schur certificate](CURVED_SCHUR.md)

| Partner of $T_0$ | Unrounded maximum of the scalar envelope | Where the maximum occurs |
|---|---|---|
| $P$ | $0.713254699302604661\ldots$ | cell 34 at $t\approx0.886176825774$ |
| $P+F/50000000$ | $0.713254699302985366\ldots$ | interior vertex of cell 26 at $t\approx0.838992436299$ |

Cell indices start at zero. The first-chaos partner has the smaller unrounded maximum. Both values round upward to $713254699303/10^{12}$. The same bound holds for every intermediate coefficient because the allowance $w\eta(1-t^2)$ is monotone in $\eta$.

To check optimality **on this grid for this first-chaos schedule**, the replay fixes two rational test amplitudes, $0.838992436300$ and $0.886176825774$. At each one the original cell majorant is affine in the mixture weight. The two slopes have opposite signs and the lines cross in $[0,1]$. Their crossing gives a lower bound $0.713254699302559498\ldots$ on the maximum of the schedule for *every* mixture weight. Rounding that lower bound upward gives the same grid point. This optimality statement concerns the specified fixed majorants and precision.

The original identity-tail endpoint was $25000000000000/17831387166289$. The earlier partner $P-Q/100+F/2000$ at weight $3693/50000000$ gave the weaker scalar cap $713254705661/10^{12}$. Removing its fifth coefficient at those same weights leaves its previous majorant exactly unchanged. The replay keeps both as controls.

Agent-ID: codex-a7c4
