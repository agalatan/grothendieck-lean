# Sharing the physical scale and fourth moment between rows 09 and 12

Cells 29 and 30 of the [sixth-order schedule](SIXTH_RICE_SUPPORT.md) mix rows 09 and 12. Their cubic scale and fourth moment come from the same response pair. Intersecting their existing moment certificates before bounding the mixture gives a larger deduction. For example at row-12 weight $.68$ and shared scale $\sigma\le .17$ it exceeds $.00001071$.

## The joint row bound

Let $w$ be the weight of row 12, $s=\mathbb E|q|^4-2$ the physical fourth excess, and $\sigma=\delta\tau$ the physical scale. Use the common refinement of the row-09 bank's $s$ knots and the squares of row 12's $x=\sqrt s$ knots on $[0,42]$. The original row-12 polynomial at each scale node has expectation bounded by
$$
 a_0+.93a_1+a_2+a_4(2+s)+a_6(6+9s+C_6s^{3/2}).
$$
The signs $a_1,a_6\ge0$ and the certified circular moments justify this upper bound. Convexity as a function of $s$ bounds it by the larger endpoint value on the common slab, including when $a_4<0$. Use the already certified row-09 scale nodes and their transported ordinates. Both moment envelopes interpolate linearly between scale nodes by convexity. The script intersects their chords on each slab. The file `tools/gen_lower_data.py --check` reproduces the original row-12 Lean source from these same JSON inputs.

Write the two upper chords on their intersection as $a+b\sigma$ and $c+d\sigma$. Denote the scalar row caps by $C_9,C_{12}$ and their curvatures by $\kappa_9,\kappa_{12}$. The minimum $g(w)$ of the blended physical quadratic gate is computed by its Schur complement. The joint saving on this intersection is bounded below by
$$
 (1-w)C_9+w C_{12}-\max_\sigma
 \left((1-w)(a+b\sigma)+w(c+d\sigma)
       -[(1-w)\kappa_9+w\kappa_{12}+g(w)/\delta^2]\sigma^2\right).
$$
Take the minimum over all physical slabs and chords. Below $\sigma=.03$ the row-12 Stein nodes have yet to start. On that interval use its certified pointwise radial majorant $A+1.1157r^2$, constructed from the original row-node chords and their final linear ray. The scalar reserve of row 09 and the mixed gate are nonnegative throughout. The minimum also includes this small-scale bound.

Subdivide each affected cell into four pieces. At the left endpoint intersect the physical scale bounds from the 59 sixth-moment tests. Round the upper cutoff up and the resulting endpoint savings down. The two actual row reserves and the common gate exist at the same physical scale on both ends of the weight interpolation. Their affine mixture dominates the chord of the two computed savings. Finally apply the retained-square row inequality and take the maximum of its quadratic on the entire amplitude interval.

## The other outer contact

Cell 14 uses rows 06 and 07. The four quarter intervals use row-07 endpoint weights $.164,.237,.309,.381,.454$. For rows 06 and 07 respectively, put $(B,A)=(112663/100000,1306661436213/10^{12})$ and $(113409/100000,332286882463/250000000000)$. The replay checks $A+B r^2$ over all original chords and the terminal ray. For each row its physical reserve is nonnegative, and is also at least $H_i-K_i x$ for $x=\tau^2$, $H_i=C_i-A_i$, $K_i=(B_i-\kappa_i)\delta_i^2$. For the pair, the sum of their individually truncated reserves and the joint gate gives a lower price
$$
 \min_{x\ge0}\{(1-w)(H_6-K_6x)_+ + w(H_7-K_7x)_+ + g(w)x\}.
$$
The minimum is attained at one of $0,H_6/K_6,H_7/K_7$, since the function is piecewise affine and its final slope is nonnegative. The remaining 114 of the resulting 126 pieces retain their previous estimates.

With debit $10^{-8}$, first-chaos weight $2244262513/50000000000000$ and switch $6920107784209/7812500000000$, the scalar cap is $7132517467996/10^{13}$. The signed matrix witness has reciprocal **greater than 1.402029514104**. At zero debit the weight $4485684001/10^{14}$ gives cap $7132517450036/10^{13}$ and reciprocal **greater than 1.402029517635**. These are analytic results with exact rational replays. The end-to-end Lean bounds remain the separate production work.

Run `python3 -IB -O experiments/quintic-signed/code/joint_outer_schedule.py` from the repository root.

Agent-ID: codex-a7c4

## Consuming the full fifth and cubic energy

The [angular joint-energy bound](CENTRAL_FIFTH_FLOOR.md) leaves a further half of the half-sum cubic energy in the signed price after paying the half-difference cubic. On the same 126 pieces, at $w=.000044870$, $d=10^{-8}$, the signed scalar cap is $71325174578437/10^{14}$, so its reciprocal is **greater than 1.40202951610**. The same-weight zero-debit scalar price is $71325174594251/10^{14}$. At $t=.885773796896554$ both the high and sparse pure prices exceed the signed upper bound, even if the better price can be chosen at that point. The separately retuned pure witness still gives **greater than 1.402029517635**. The [signed replay and controls](code/sixth_angular_outer.py) use the same row data and the full physical phase space.
