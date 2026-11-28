# A shared fourth moment for the outer rows 06 and 07

The exact 126-piece research profile gives a reciprocal greater than **1.402030786852** for the signed fifth witness with debit $10^{-8}$. Optimizing the first-chaos mixture at zero debit gives a reciprocal greater than **1.402030790959**. These are finite-profile consequences of the same analytic inputs as the [previous outer-pair computation](OUTER_PAIR_SCHEDULE.md). The replay changes cells 12 through 17. It does not change the production Lean theorem.

For the same normalized remote cubic $q$ in both rows, write $\chi=\mathbb E|q|^4-2$ and $\sigma=\delta\tau$. At a checked Stein node the row polynomial bounds $\mathbb E\Psi_i(\sigma|q|)$ by

$$a_0+a_2+(2+\chi)a_4+(6+9\chi+C_6\chi^{3/2})a_6+(93/100)a_1,$$

where $a_1,a_6\ge0$ and $C_6=4045313/100000$. This upper bound is convex in $\chi$, so its endpoint maximum applies on each of 29 common shape intervals. Only the deterministic node at **zero** is included. The strictly positive knots all come from the row-specific Stein polynomials. Convexity of $\sigma\mapsto\mathbb E\Psi_i(\sigma|q|)$ gives the chord bound between any two valid knots. The 437 intersected pairs of affine chords cover the common shapes and all scales from zero to $7/20$.

For a row-07 share $w$, let $g(w)$ be the Schur lower bound of the mixed gate after the two individual quadratic terms have been removed. If the two chords at the same shape and scale are $L_i(\sigma)$, the simultaneous saving is bounded below by

$$ (1-w)c_6+wc_7-\max_{\sigma}\left((1-w)L_6(\sigma)+wL_7(\sigma)-\big((1-w)\kappa_6+w\kappa_7+g(w)/\delta^2\big)\sigma^2\right). $$

On each subinterval the maximum is checked at the endpoints and admissible vertex. The scale ceiling comes from the sixth-moment support at the left amplitude. Each individual response gives an affine lower cost in $w$ before minimization, so the uniform saving is concave in $w$. Interpolating verified endpoint savings therefore works for the entire subinterval. All savings are rounded down to multiples of $10^{-13}$ before use.

The [replay](code/joint_outer_stein.py) imports the [joint bank](code/outer67_bank.py) and the preceding signed and sixth-moment receipts. Run `python3 -IB -O experiments/quintic-signed/code/joint_outer_stein.py` from the repository root. At the chosen weights the predecessor misses both stronger caps. A second control uses two fixed amplitudes near $0.837432861328125$ and $0.885773796$. Its three prices are affine in the mixture weight. Testing their intersections certifies the quoted upward-rounded caps are the best possible on this fixed schedule, for each of the two fixed debits and any choice of mixture and high-amplitude switch in the terminal zone. This last statement concerns the numerical envelopes.

The [graded cubic and fifth comparison](CENTRAL_FIFTH_FLOOR.md) also applies to these same rows. At $w=.000035790$, $d=10^{-8}$ its scalar cap is $71325109802694/10^{14}$, with reciprocal **greater than 1.40203078938**. Both pure prices at the identical weight exceed this signed cap at $t=.885773796896554$. The separately retuned pure reciprocal still exceeds 1.402030790959. The [matched signed replay](code/sixth_angular_outer.py) checks both outer schedules, their pure ablations, and their retuned controls.
