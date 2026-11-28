# The signed fifth witness on the 55-piece first-chaos profile

Agent-ID: codex-a7c4

Let `T` be the identity-tail witness with first-chaos mixing weight
$w=358503031/5000000000000$. The perturbation $T-dP_{3,2}$ changes its real
phase payoff by $-d\Delta_5$, where $\Delta_5=\|P_{3,2}h\|^2-\|P_{3,2}k\|^2$,
$h=(f+g)/2$ and $k=(f-g)/2$. The observable amplitude is
$t=\|P_{1,0}h\|$. The finite-matrix theorem consumes a scalar upper bound on
the original hat payoff and this same amplitude. Its proof supplies both the
vector normalization and the complex phase rotation.
[Signed transfer](lean/QuinticResearch/SignedRowTransfer.lean)

## Signed prices from visible energy

If $r>0$ and $t>0$, radial clipping of the true half-difference gives
$$
 \Delta_5\ \ge\ -\|k\|^2\ \ge\ 2(t-\sqrt\pi/2)/r-r^2/6.
$$
Taking $r=2/3$ proves $\Delta_5\ge-1/4$ for $t\ge.828$.
The stronger signed visible-polynomial prices give $13/500$ from $.885868$
and $17/500$ from $.886176$. Bessel gives $-1$ elsewhere.
[Clipping proof](lean/QuinticResearch/FifthClip.lean) ·
[Upper-amplitude proof](lean/QuinticResearch/SignedRadial.lean)

The 55-piece schedule uses the same physical rows for every column of each
comparison. The one-cut case uses $\sigma\le.242$ on cell 23. The six-cut case
uses all the coarse physical cuts on cells 21 through 26. Each number in the
next three columns is a scalar cap in units of $10^{-12}$, rounded upward.
The reciprocal of a scalar cap is the corresponding finite-matrix endpoint.
[Physical row-scale proof](../../research/identity-tail/PHYSICAL_RICE.md) ·
[55-piece schedule](../../research/identity-tail/FIRST_CHAOS_RETUNING.md)

| Restricted cells | $d$ | Signed cap | Same $w$, $d=0$ | Optimized $w$, $d=0$ | Signed reciprocal |
|---|---:|---:|---:|---:|---:|
| 23 | $179/1953125000$ | 713254609466 | 713254612582 | 713254590186 | 1.40202388702216… |
| 21–26 | $205611/125000000000$ | 713254567542 | 713254612582 | 713254212953 | 1.40202396943096… |

At the fixed production weight the fifth term saves 3,116 or 45,040 units,
respectively. The best pure control on each of these schedules gives a larger
lower bound. The exact replay also certifies a limitation of these particular
price rules over **all** $w$ and $d\ge0$. It takes the central and high binding
points of the pure control and combines their affine bounds with positive
weights that cancel $w$. The coefficient of $d$ in the resulting lower bound
on the scalar majorant is greater than $.21037$ or $.21474$, respectively.
Its intercept rounds to the optimized pure cap in the table. Thus tuning the
two coefficients together with these same phase prices cannot improve that
cap. The central fifth-energy floor required to escape these two particular
test points is greater than $-.0055136070$ or $-.0048182964$, respectively.
This obstruction concerns the row majorant.

Run both exact replays from this branch:

~~~sh
python3 -IB -O experiments/quintic-signed/code/signed_bridge.py
python3 -IB -O experiments/quintic-signed/code/clipped_profile.py
~~~

The first replay tests the matched ablations without the intermediate clipping
improvement. The second independently maximizes each clipped quadratic
including its interior vertex and verifies the two-point obstruction. The
rational row replay is separate from the Lean phase estimates and generic
finite transfer. Integration of all 55 rows with the physical Rice input is
tracked in [#904](https://github.com/agalatan/grothendieck-lean/issues/904).
The generic scalar rows remain a hypothesis in the Lean endpoint on this branch.

## Stability at contact with the original row

For complex fields $A,B$ let $J_\nu(f,g)$ be the original coupled phase payoff
and $\psi_\nu$ its maximum. Iterate from $(1,1)$, replacing the two components
simultaneously by $\operatorname{ph}(A+\nu v)$ and $\operatorname{ph}(B+\nu u)$.
The resulting pair $(u_n,v_n)$ is measurable for measurable fields. Write
$q=|\nu|/(L-|\nu|)$ when $L>2|\nu|$. Every phase pair in the closed bidisc
satisfies the integrated estimate
$$
 \mathbb E[|f-u_n|^2+|g-v_n|^2]
 \le 8\Pr(\min(|A|,|B|)<L)+\frac{4\mathbb E[\psi_\nu-J_\nu(f,g)]}{L-2|\nu|}
      +16q^{2n}.
$$
The explicit templates permit comparison with a measured signed phase
response while retaining the identity-tail interaction. An unequal-field
version proves the instantaneous gap bound with coefficient $\gamma$ when
$a\le||A|-|\nu||$, $b\le||B|-|\nu||$, $a>\gamma$ and
$(a-\gamma)(b-\gamma)\ge\nu^2$. The remaining application needs a
quantitative estimate of the low-field set and the fifth projection of the
actual template on a binding pair.
[Kernel proof](lean/QuinticResearch/PhaseIteration.lean)
