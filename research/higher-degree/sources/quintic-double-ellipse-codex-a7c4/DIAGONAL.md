# A sharp obstruction for Gaussian coordinate blocks

Agent-ID: codex-a7c4.

Let \(Z_i\) be independent standard proper complex Gaussians. In \(H_{2,1}\) consider the normalized diagonal cubic
\[
 Q=\sum_{i=1}^n w_i\,Z_i(|Z_i|^2-2)/\sqrt2,\qquad \sum_i|w_i|^2=1 .
\]
For every complex orthogonal block projection \(P\) on the coordinate space, let \(b(P)\) be the fraction of cubic energy with exactly one holomorphic occurrence and zero antiholomorphic occurrences in that block. Then **\(b(P)\le1/2\)**. This constant is sharp, including for arbitrarily small fourth excess.

In the normalized complex Wick tensor isometry the tensor of \(Q\) is \(\sum_i w_i e_i\otimes e_i\otimes\bar e_i\). The two holomorphic slots are symmetric. Put \(P'=I-P\). The retained projection is
\[
 (P\otimes P'+P'\otimes P)\otimes\bar P'.
\]
Dropping the last projection increases its expectation. The norm factor for bidegree $(2,1)$ is $2!1!$ before normalization. [Complex Itô isometry, equations (1.7)–(1.8)](https://arxiv.org/abs/1412.1877) Tracing out that slot kills the \(i\ne j\) terms, so the two-holomorphic marginal is the mixture of the orthogonal product vectors \(e_i\otimes e_i\) with probabilities \(|w_i|^2\). Writing \(p_i=\langle e_i,P e_i\rangle\), the probability of exactly one holomorphic occurrence is therefore \(2\sum_i |w_i|^2p_i(1-p_i)\le1/2\).

For equal positive weights and any even \(n\), group the coordinates into pairs. On each pair project onto \(u=(e_1+e_2)/\sqrt2\), and write \(v=(e_1-e_2)/\sqrt2\). The two terms of the normalized diagonal tensor with exactly one holomorphic \(u\) are \(u\otimes v\otimes\bar v/2\) and \(v\otimes u\otimes\bar v/2\). They both survive the antiholomorphic restriction and their squared norms sum to \(1/2\). Direct sums give equality for every even \(n\). The [exact checker](../../code/quintic-double-ellipse-codex-a7c4/diagonal.py) also tests a genuinely complex block \(u=(e_1+i e_2)/\sqrt2\), with diagonal weights \((1,i)/\sqrt2\). Its energy is \(1/2\); omitting the conjugation on the last slot gives zero.

To compute the shape write \(T=|Z|^2\), which is unit exponential. The variance is \(\mathbb E[T(T-2)^2]/2=1\), and the fourth moment is \(\mathbb E[T^2(T-2)^4]/4=44\). Independent centered circular variables have additive unnormalized fourth excess \(\mathbb E|Q|^4-2(\mathbb E|Q|^2)^2\); the cross term in the fourth moment is \(4\mathbb E|Q_1|^2\mathbb E|Q_2|^2\). Therefore
\[
 \chi(Q)=42\sum_i|w_i|^4.
\]
For equal weights this gives \(42/n\). At \(n=90\), \(\chi=7/15\) and at least half of the physical squared norm remains outside every block, including blocks required to contain a particular visible direction.

For an arbitrary symmetric normalized cubic tensor, write \(D_h\) for a one-holomorphic marginal and \(D_a\) for the conjugate-space one-antiholomorphic marginal. They are positive with trace one. Set \(a=\operatorname{tr}(P D_h)\) and \(a'=\operatorname{tr}(\bar P D_a)=\operatorname{tr}(P\bar D_a)\). The latter identity uses reality of the trace of a product of Hermitian matrices. The events of one holomorphic hit and no antiholomorphic hit give \(b\le\min(2a,1-a')\). Since the trace-zero Hermitian difference has positive trace part \(\|D_h-\bar D_a\|_1/2\),
\[
 b\le\min(2a,1-a+\|D_h-\bar D_a\|_1/2)
 \le 2/3+\|D_h-\bar D_a\|_1/3.
\]
Here partial traces have unit trace; the unnormalized derivative influence matrices use different conventions.

## The same obstruction at the mixed relaxation tuple

In the [two-sector test](GAUSSIAN_BLOCK.md) at \(t=.47\), replace the original remote cubic by eighty-four equal independent diagonal terms with total physical energy .56. Its normalized excess is \(42/84=1/2\), exactly the original value. Keep the fresh mixed term \(\sqrt{.06}\,ZY\bar W\); its normalized excess is 6. The components are independent and circular, and their normalized sum has excess \(446/961\). For every choice of separate sector and elliptic carrier coefficients the corresponding second and fourth moments are therefore identical to those used in the two-sector obstruction. The 24 mass cuts, both radial Gram estimates, and all its KRS501 and KNG505 radius tests continue to pass at the same scalar tuple.

The remote and mixed cubic terms use orthogonal antiholomorphic labels. Their cross term disappears on tracing out that slot, even when the candidate block mixes remote and visible coordinates. Dropping the antiholomorphic restriction gives the upper bound \(.56/2+.06=.34\) on retained physical energy, so at least \(.28\) of the total \(.62\) lies outside every such block. This places the same scalar example outside the coordinate-block projection tube with allowed discarded energy .005 at \(t=.47\). The argument concerns projections defined by Gaussian coordinate blocks. More general conditional Gaussian representations may use other sigma-fields. The [direct spiked support estimate](DIRECT.md) rules out the displayed scalar tuple without projecting onto a block. The cubic energy and shape example is finite-dimensional. Feasibility of those scalar inequalities does not construct a pair of actual phase responses.

From the repository root run `python3 -IB -O research/higher-degree/code/quintic-double-ellipse-codex-a7c4/diagonal.py`.
