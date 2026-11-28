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


## Physical phase families and their remaining obstruction

For normalized, fixed-amplitude two-charge Gaussian phase drivers, reducing the
fifth eigenvalue by $d=1/50$ gives an absolute payoff whose reciprocal exceeds
1.40372082. The exact optimum on this family is between 1.40397477 and
1.40397478, at $w=0$, $d=47/2000$. Allowing the visible amplitude to depend on
the remote sample preserves that estimate for the specified sign-symmetric drivers.
With $d=0$ every choice of the mixing weight fails the 1.4023 test on the same
family. These comparisons concern a subset of the phase pairs required by the
finite-matrix transfer.
[Fixed amplitudes](GAUSSIAN_DRIVER_BOUND.md) · [Random amplitudes](RANDOM_AMPLITUDE.md)

A finite triple-product example with shape $\chi=6/5$ has negative signed
fifth energy. The original row's unused payoff can nevertheless absorb that
cost for the two-charge drivers under an explicit weight condition.
[Finite obstruction](FINITE_BLOCK_RESPONSE.md) · [Compensation](GAUSSIAN_DRIVER_COMPENSATION.md)

For arbitrary physical phase pairs, the analytic joint cubic and fifth
estimate retains the actual half-difference cubic energy. In particular,
on $1071/1280\le t\le2151/2560$ and at $d=1/50$, the sufficient condition
$\|Qk\|^2\le.06129$ gives real payoff below $10000/14023$. A phase rotation
used to realize the absolute payoff changes the half-difference. The unrestricted
lower-bound problem requires control of this energy on the remaining phase pairs.
[Physical pair budget and proof](VISIBLE_PAIR_BUDGET.md)

An actual pair close in support value to one of the decoupled cubic drivers
also satisfies the 1.4023 absolute-payoff test. At $d=1/50$ the sufficient
support deficit is $2.18\cdot 10^{-8}$; at $d=47/2000$ it is
$3.03\cdot10^{-8}$. The comparison controls phase changes in both arguments.
[Support deficit and exact Gram estimate](EXPOSED_DRIVER.md)

The two positive shifts of the signed operator also bound the complex absolute
payoff directly using the overlap of the original phases and their two
diagonal values. At $d=1/50$ a phase distance at most .03670465 suffices
for the 1.4023 test, with all chaos sectors free. A product of diagonal values
at most −.25547 suffices for any overlap. [Two-vector proof and exact replay](SPECTRAL_PAIR.md)

Scaling the joint cubic and fifth projection tests strengthens the five-cell
sufficient threshold to .06734 at $d=1/50$. This threshold applies to the
net cubic energy after subtracting the actual first-chaos and complementary
energies of the half-difference. The two narrower bands permit .07151 and
.06940. The unscaled calculation also covers every phase pair above
$t=.88577726$ at the same debit. [Scaled central price](SCALED_VISIBLE.md) ·
[All-sector low and high amplitudes](VISIBLE_PAIR_BUDGET.md)

The controlled driver family also admits unbalanced remote orientations
under its stated constant-energy hypotheses. A separate graded Gaussian
stress test gives numerical payoff .7131189957 at $d=.0235$ on its 192-node
grid, above the target $10000/14023$. It gives .7130938040 at $d=.02$.
These two quadrature values still require error enclosures. A separate disk-valued step pair, certified by exact interval moments and lifted to finite-dimensional unimodular pairs, gives physical payoff at least .7131156728 at $w=0$, $d=.0235$. It excludes $d\ge.0232912$ at $w=0$. For all nonnegative first-chaos mixing weights and fifth debits the two-test reciprocal ceiling is 1.40257113. [Exact physical obstruction](GRADED_STEP.md) [Unbalanced orientations](UNBALANCED_DRIVER.md) ·
[Graded transfer](GRADED_LIFT.md) · [Stress test](GRADED_PAIR_PROBE.md)


At $d=1/50$ the conditional Gaussian response family also permits arbitrary
measurable coefficient vectors with unit total squared norm. Its reciprocal
absolute-payoff cap exceeds 1.40340. [Variable Gaussian coefficients](VARIABLE_GAUSSIAN_PHASES.md)
