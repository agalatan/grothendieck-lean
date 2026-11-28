# A signed fifth lower-bound certificate on the 57 physical pieces

The nonzero fifth debit $d=1/31250000$ and first-chaos weight $w=7/100000$ give a rational scalar cap $7132538206126/10^{13}$. The finite-matrix transfer gives a reciprocal strictly greater than **1.40202543765**. This is an analytic and exact-arithmetic certificate. Its tilted high-amplitude proof is still pending formalization in Lean.

At the same $w$, setting $d=0$ makes both available scalar prices exceed the signed cap at $t=.885908228863324$. Thus changing the crossover alone cannot recover the signed result at that weight. Retuning to $w=.00006989$ with zero debit certifies the stronger **1.40202545078** on the same pieces. These comparisons concern certified prices. They do not determine the true norm of either witness.

The [Bernstein integration](BERNSTEIN_TILTED_ENDPOINT.md) sharpens both estimates on exactly the same sparse pieces.

For the unsigned sparse payoff in normalized units $V$, the first-chaos mixture is bounded by $aV+wt^2+c$, with $a=(1-w)(1-\nu)$ and $c=(1-w)\nu$. The signed witness subtracts $d\Delta_5$, the physical difference of fifth-projection energies. The following estimates cover the amplitudes.

* For $t\le.578$, $\Delta_5\ge-1$. For $t\ge.578$, clipping at radius $2/3$ gives $\Delta_5\ge3(t-\mu)-2/27$. These bounds and $\mu<.886227$ imply $\Delta_5\ge41t^2/20-3371/2000$. For the second interval the difference of the quadratic and the linear function is convex, so checking $.578$ and $.887$ suffices.
* At $t\ge.885868$, the radial projection estimate improves the floor to $13/500$. Maximize the corresponding two adjusted quadratic prices on each of the 57 pieces below the switch $.885908226465471$, splitting a piece at $.885868$ when necessary. Physical admissibility uses the affine Rice scale restriction $\sigma^2\le2(2129/2166)\mu_U((2167/2166)\mu_U-l)\delta_{08}^2$ at the left endpoint $l$, with $\mu_U=.886227$. The rational replay reconstructs the 17 weights and prices directly from the row and chord data.
* Above the switch use the derivation in [the central tilted test](TILTED_CENTER.md), now with $u=1$, $s=.09$, and $0\le d'=d/(1-w)\le.0001$. The trace prices for $(0,0),(0,1),(1,0),(1,1)$ or $(2,0)$ and the conjugate pair are at most $.80198,.62315,.93147,.98281,.98180$. The last trace pays $.485$ of the remote cubic energy. Substituting $\tau^2\le2\mu(\mu-t)$ and subtracting the tilt leaves $\beta-.485-.09=17/80$. The resulting upper bound on the physical mixed payoff is
  \[
  (1-w)\{\nu+\tfrac\pi4(\alpha-\beta/8)+\alpha(\mu-t)^2+2(17/80)\mu(\mu-t)+10^{-52}\}
  + wt^2-3\pi d/256 .
  \]
  Its upper envelope on the closed high interval follows from convexity and its two endpoint values. The exponential tail error is included explicitly. The Gaussian mean and $\pi$ are enclosed independently with rational arithmetic.

Finally the [signed operator transfer](lean/QuinticResearch/SignedVector.lean) applies since $0<d<(1-w)\nu$, so the vector strategies approach one as the dimension grows. Only the original identity-tail node caps enter the sparse rows.

From the repository root run `python3 -IB -O experiments/quintic-signed/code/tilted_signed_schedule.py`.

Agent-ID: codex-a7c4
