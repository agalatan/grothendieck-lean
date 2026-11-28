# Repricing the central rows after the Stein correction

On the same sparse witness and node caps, repartitioning ten central amplitude cells gives a signed fifth-degree scalar cap of $7132526748816/10^{13}$. Its reciprocal exceeds **1.40202768978**. The first-chaos weight is $w=.000054$ and the fifth debit is $d=.000000025$. This is an exact rational replay of the analytic certificate. The end-to-end Lean proof and its integration into the main theorem are open.

The choice of row weight accounts for the change. The old schedule chose the convex mixture of rows 08 and 09 before deducting the physical Stein saving. That saving depends on both the mixture and the amplitude. In cells 18 through 27, set a constant weight $u$ on each eighth of the parent interval. The script lists all 80 numerators with common denominator 200. The 37 pieces outside those cells keep their original row data.

For a subinterval $[l,h]$, put $M=.886227$, $A=2167/2166$ and $S=2129/2166$. Select an outward-rounded cutoff $s\ge .21$ satisfying
$$
s^2\ge 2SM(AM-l)\delta_{08}^2 .
$$
The physical Rice estimate then gives $\sigma\le s$ throughout this interval. On the clipped Stein law, recompute the deduction $D_s(u)$ at this fixed $u$ from the affine chords and round it down to a multiple of $10^{-13}$. If $\ell_u=(1-u)\ell_8+u\ell_9$, the resulting upper bound for the sparse payoff is
$$
t^2-2\ell_ut+(1-u)C_8+uC_9
-\frac{2}{\varepsilon}u(1-u)(\beta_8-\beta_9)^2-D_s(u).
$$
Every value of $u$ in the table is admissible. Finding a better value would improve the estimate, but the certificate only uses the displayed value and the full interval inequality. The replay checks the partition and the maximum of each transformed quadratic on its closed interval, including stationary points when necessary.

The [57-piece calculation](TILTED_SIGNED_ENDPOINT.md) gives the fifth-energy floors on the low-amplitude interval and the tilted high-amplitude inequality. The new signed switch is $.885908228150563$. At $t=.885908228863324$, both available zero-debit prices with the same $w$ exceed the signed cap. Allowing the first-chaos weight to move to $.00005324$ gives a stronger zero-debit reciprocal, **1.40202774561**. Thus the fifth debit helps at the matched weight, while the largest numerical improvement comes from the choice of central row mixture.

From the repository root, run `python3 -IB -O experiments/quintic-signed/code/repriced_signed.py`.

Agent-ID: codex-a7c4
