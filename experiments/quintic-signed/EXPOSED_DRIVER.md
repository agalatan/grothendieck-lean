# Physical pairs close to an exposed decoupled cubic response

Agent-ID: codex-a7c4. Consider an arbitrary pair of unimodular responses $f,g$ on a finite complex Gaussian space. Choose independent standard Gaussian blocks $Z,A,B,C$, with $Z$ scalar, a decoupled cubic $q=\sum_i A_i B^\top T_i\bar C$, and $\lambda\ge0$. Other Gaussian coordinates may be present and $f,g$ may depend on all of them. Write $M_\pm=Z\pm\lambda q$ and define the real support deficit
\[
 D=\tfrac12\mathbb E[|M_+|-\operatorname{Re}(\bar M_+ f)+|M_-|-\operatorname{Re}(\bar M_-g)] .
\]
This is nonnegative. For $h=(f+g)/2$ and $k=(f-g)/2$, it equals $\mathbb E|Z+\lambda q|-\operatorname{Re}\langle Z,h\rangle-\lambda\operatorname{Re}\langle q,k\rangle$. No independence of the responses, bound on their other chaos sectors, or Gaussian approximation for $q$ is required.

For $e=191/250$, $\nu=47/2000$, $S=P-eQ+\nu(I-P-Q)-dF$, and $0\le d\le\nu$, one has
\[
 |\langle f,Sg\rangle|\le B_d +4.878\sqrt D,\qquad
 B_d=\nu+(1-\nu)\pi/4-(e+\nu)\pi/32-d\,3\pi/256 .
\]
In particular the actual absolute payoff is strictly below $10000/14023$ at $d=1/50$ whenever $D\le2.18\cdot10^{-8}$, or at $d=\nu$ whenever $D\le3.03\cdot10^{-8}$. The condition is a support deficit against the specified cubic. The estimate applies even if the unpriced squared-energy gap of the remote cubic is large. A universal bound still needs to cover pairs with a larger deficit against every such support. [Exact replay](code/exposed_driver.py)

## Inverse-radius cost of an arbitrary degree-five polynomial

For a standard complex Gaussian $W$ and a complex-valued polynomial $P$ in $W,\bar W$ of total degree at most five one has
\[
 \mathbb E[|P(W)|^2/|W|]\le 1.696\sqrt\pi\,\mathbb E|P(W)|^2 .
\]
Separate the angular harmonics $m=-5,\ldots,5$. For $m\ge0$ use the basis $W^m L_j^{(m)}(|W|^2)$, $0\le j\le\lfloor(5-m)/2\rfloor$; use its conjugate for negative $m$. Relative to the exponential law of $T=|W|^2$, the unweighted Gram matrix is diagonal with entries $(m+j)!/j!$. The matrix weighted by $1/(\sqrt\pi|W|)$ has entries
\[
 H_{ij}=\sum_{k,l}[T^k]L_i^{(m)}\;[T^l]L_j^{(m)}\,
       \frac{\Gamma(m+k+l+1/2)}{\sqrt\pi} .
\]
Both matrices are rational. The verifier constructs all six blocks, of sizes $3,3,2,2,1,1$, and checks every leading principal minor of $1.696\,\mathrm{diag}((m+j)!/j!)-H$ is positive. A principal minor in the radial block is negative at $1.695$, giving a check on normalization and sharpness. Positivity applies to complex coefficient vectors by Hermitian symmetry.

Given the remote coordinates, $M_\pm$ is a linear functional of the fresh independent Gaussian vector $(Z,A)$, with norm $s=(1+\lambda^2\sum_i|B^\top T_i\bar C|^2)^{1/2}\ge1$. Rotate the fresh vector at each fixed remote sample to make $M_\pm=sW$. This rotation is used only within the conditional integral. Fixing the remaining fresh coordinates makes every ambient polynomial of degree at most five a polynomial of degree at most five in $W,\bar W$. Fubini therefore gives the same inequality with denominator $|M_\pm|$. For a unimodular function the corresponding integral is bounded by $\sqrt\pi$ since $\mathbb E[1/|W|]=\sqrt\pi$.

## From support deficit to payoff

For any unimodular $v$, $Sv=\nu v+Lv$ with $L=(1-\nu)P-(e+\nu)Q-dF$. The second term is a polynomial of degree at most five and $\|L\|\le1-\nu$ by orthogonality of the three projections. The triangle inequality in the inverse-radius weighted $L^2$ norm gives
\[
 (\mathbb E[|Sv|^2/|M_\pm|])^{1/2}\le \pi^{1/4}[\nu+\sqrt{1.696}(1-\nu)] = C .
\]
Set $f_*=\operatorname{ph}M_+$ and $g_*=\operatorname{ph}M_-$. The exact phase identity gives
\[
 \mathbb E[|M_+|\,|f-f_*|^2+|M_-|\,|g-g_*|^2]=4D.
\]
Telescope the pairings as $\langle f-f_*,Sg\rangle+\langle Sf_*,g-g_*\rangle$. Each term is bounded by weighted Cauchy–Schwarz and the preceding estimate. The sum of the two weighted error norms is at most $\sqrt{8D}$, so the absolute perturbation is at most $C\sqrt{8D}$. The [random-amplitude theorem](RANDOM_AMPLITUDE.md) bounds the template payoff by $B_d$. The replay certifies $\sqrt8 C<4.878$ and both stated cutoffs.

~~~sh
python3 -IB -O experiments/quintic-signed/code/exposed_driver.py
~~~
