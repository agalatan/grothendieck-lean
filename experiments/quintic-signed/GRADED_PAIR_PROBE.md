# A fixed graded response tests the largest fifth debit

Agent-ID: codex-a7c4. This numerical check tests the proposed payoff cap $10000/14023\simeq .71311417$ in the diffuse cubic Gaussian model of the [primal-dual search](../../research/higher-degree/code/primal-dual/gm.py). It gives evidence against $d=\nu=.0235$ for that target and helps select a smaller debit.

| Grid per coordinate | Payoff at $d=.02$ | Payoff at $d=.0235$ | Reciprocal at $d=.0235$ |
|---:|---:|---:|---:|
| 64 | .7130947408 | .7131199402 | 1.4022886525 |
| 96 | .7130938746 | .7131190595 | 1.4022903843 |
| 128 | .7130938515 | .7131190376 | 1.4022904274 |
| 160 | .7130938372 | .7131190246 | 1.4022904528 |
| 192 | .7130938040 | .7131189957 | 1.4022905097 |

The *same two functions* are evaluated at each resolution and at both debits. Let $Z,W$ be independent standard complex Gaussians, with assigned bidegrees $(1,0),(2,1)$. In the repository's normalized complex Hermite convention, form $A_+$ with coefficients
\[
 (81962,22271,20643,-344,-177,-331)/100000
\]
on the tensors $(H_{10}(Z),W,H_{21}(Z),H_{11}(Z)W,H_{20}(Z)\bar W,H_{32}(Z))$. Set $A_-(Z,W)=A_+(Z,-W)$ and $f_0=\operatorname{ph}(A_+)$. For $j=1,\ldots,18$ define $g_j=\operatorname{ph}(A_-+\nu f_{j-1})$, $f_j=\operatorname{ph}(A_++\nu g_j)$, with $\operatorname{ph}(0)=1$. Use $(f_{18},g_{18})$. The number of updates is part of the pair's definition; convergence of a best-response iteration is unnecessary.

At resolution 192 the aligned first half-sum norm is about $.83931643$ and the signed fifth cross term is $-.00719764$. This explains why increasing $d$ increases its payoff. On this grid its payoff crosses the target at $d\simeq .02283$. A pair below the target at a smaller debit gives no upper bound on the supremum.

The [fixed-pair replay](code/graded_pair_probe.py) uses positive tensor quadrature; it truncates radii and supplies no interval error bound. The [Gaussian lifting argument](GRADED_LIFT.md) transfers any certified graded payoff to the physical supremum. This phase-iteration quadrature remains unenclosed. A separate [certified central step-function pair](GRADED_STEP.md) now proves the obstruction for the physical supremum. The presence of nonlinear visible generators and the alternating phase updates puts the test outside the phase templates with a fresh Gaussian entering linearly.

~~~sh
VECLIB_MAXIMUM_THREADS=1 OPENBLAS_NUM_THREADS=1 python3 -B experiments/quintic-signed/code/graded_pair_probe.py --nodes 64 96 128 160 192
~~~
