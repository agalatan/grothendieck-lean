<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/KERNEL_DERIVATION.md (file dated 2026-11-13). Only this line was added. -->
# Independent kernels, basis, gradients, and deterministic calibrations

Agent ID: codex-a713. Date: 2026-11-13. This note distinguishes algebra proved here from floating computations. No numerical result below is an interval certificate or a global optimization theorem.

## 1. The full space: a correction to the task's dimension

**Proved here.** For standard independent complex Gaussians, put

\[
e_{ijk}(z)=\frac{z_i z_j\overline{z_k}-\delta_{ik}z_j-\delta_{jk}z_i}{\sqrt{1+\delta_{ij}}},\qquad i\le j,\quad1\le k\le n.
\]

These are exactly the normalized complex Hermite polynomials of holomorphic degree two and antiholomorphic degree one. Gaussian Wick pairing gives their orthonormality. Their top-degree monomials are linearly independent and span every polynomial of bidegree (2,1); subtraction of the displayed linear contractions makes each one orthogonal to first chaos. Thus they span the whole Wick chaos, with complex dimension

\[
\dim H_{2,1}(\mathbb C^n)=n\binom{n+1}{2}=n^2(n+1)/2.
\]

The dimensions for n=2,3,4,5,6 are **6,18,40,75,126**. Subtracting n, as in the request, instead gives the dimension of trace-free homogeneous harmonic polynomials. It would omit part of the requested chaos, including the n=1 Wick monomial. Wick subtraction is a change of polynomial, not n linear constraints on its cubic coefficients. With this orthonormal basis, the population norm is exactly \(\|q\|_2^2=\sum|c_{ijk}|^2\); no sample normalization is used.

## 2. Kernels re-derived

Write \(r(t)=\sqrt t(a+bt)\), \(y=\sqrt v\), and

\[
A(r,y)=\frac1{2\pi}\int_0^{2\pi}|r e^{i\theta}+y|\,d\theta.
\]

Let \(M=\max(r,y)\), \(s=\min(r,y)^2/M^2\). The elliptic parameter is s (not its square root). Independently differentiating the angular integral gives

\[
A(r,y)=\frac{2M}{\pi}[2E(s)-(1-s)K(s)],
\]

\[
H(r,v):=A_y(r,y)/y=
\begin{cases}
\dfrac1{2r}\,{}_2F_1(\tfrac12,\tfrac12;2;v/r^2),&y\le r,\\
\dfrac{2}{\pi y}E(r^2/v),&y\ge r.
\end{cases}
\]

The first formula also follows by differentiating \(r\,{}_2F_1(-1/2,-1/2;1;v/r^2)\). For the first branch away from s=0, its hypergeometric factor can be evaluated as \(4[E(s)-(1-s)K(s)]/(\pi s)\). Both branches agree at y=r. These formulas avoid the cancellation in \([A+(v-r^2)K_{\rm inv}]/(2v)\) at small v.

**Proved here:**

\[
\phi(v)=2\int_0^\infty e^{-t}A(r(t),\sqrt v)\,dt,
\quad\phi'(v)=\int_0^\infty e^{-t}H(r(t),v)\,dt,
\quad g(v)=\int_0^\infty e^{-t}(t-1)H(r(t),v)\,dt.
\]

The phase expectation points along the shift, so \(F_A(q)=qg(|q|^2)\). At zero,

\[
\phi(0)=\sqrt\pi(a+3b/2),\quad
I=\frac{\pi}{2\sqrt{ab}}\operatorname{erfcx}(\sqrt{a/b}),\quad
\phi'(0)=I,\quad
g(0)=\frac{\sqrt\pi}{2b}-(1+a/b)I.
\]

The last formula comes from t=s² and splitting \((s^2-1)/(a+bs^2)\). It agrees independently with numerical integration of \(\frac12\mathbb E[(T-1)/r(T)]\).

At the peak row, floating evaluation gives

* \(\phi(0)=1.3718792806008693\),
* \(g(0)=-0.83513593261413\),
* \(\phi'(0)=1.4319737912914317\).

## 3. Implementation and measured accuracy

Implementation: [kernels.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/kernels.py). Interface: `Kernels(row='peak').eval(v)` returns phi, phi_prime, g, g_prime; `.B(u)` returns the Gaussian benchmark. Rows peak, flank, upper are parameterized, though the deterministic checks in this note concern peak.

The adaptive scalar integrals use t=s², the exact solution of s(a+bs²)=sqrt(v), and geometrically spaced breakpoints outward from that solution. The latter matters at tiny v: supplying only the singular radius to adaptive quadrature produced erroneous reference checks at v=1e-10, because it missed a thin adjacent region. That reference-integration issue was fixed; the production table already agreed with the correct origin limit.

The production table has 4,097 equally spaced points in x=log(1+v/0.05), with v in [0,10000]. It uses cubic interpolation and differentiates the interpolating cubic analytically. Evaluation outside the tabulated range raises an exception; it is never clipped. The s-integrals stop at 10 (t=100), whose exponential tail is negligible at the displayed floating precision. All numerical work here uses double precision, not directed rounding.

**Numerically checked here:**

* Against 51 independent adaptive checks, maximum observed errors were 1.24e-12 for phi, 5.36e-14 for g, and 4.50e-9 for phi'. The largest derivative discrepancy was the spline endpoint derivative.
* Comparing 4,097- and 8,193-node tables at 10,001 test points gave maximum differences 2.34e-12 for phi, 1.18e-10 for g, 3.94e-9 for phi', and 2.90e-9 for g'. These are observed discrepancies, not supremum error certificates.
* An independent Rice formula for B, \(\sqrt{\pi u}\,\mathbb E_T[(1+2x)I_{0e}(x)+2xI_{1e}(x)]\), x=r(T)²/(2u), agreed with the interpolated-phi benchmark within 6.0e-15 at u=.00551,.02,.03,.0463.

Evidence: [kernel_checks_peak_4097.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/kernel_checks_peak_4097.json), [kernel_calibration.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/kernel_calibration.json), [benchmark_independent.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/benchmark_independent.json). Reproduction scripts: [calibrate_kernels.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/calibrate_kernels.py), [check_benchmark.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/check_benchmark.py).

## 4. Deterministic calibration and saddle check

For q=sqrt(u/2)X(R−2), R=|X|², the exact one-dimensional radial reductions are

\[
F=\int e^{-r}\phi((u/2)r(r-2)^2)dr,\quad
C_X=\sqrt{u/2}\int e^{-r}r(r-2)g((u/2)r(r-2)^2)dr.
\]

All other content coordinates vanish by phase symmetry. For q=sqrt(u)X(S−1), S=|Y|², integrate also over the independent exponential R. Those reductions are **proved here**. Their following values are **numerically checked here**:

|u|Wick monomial ratio|XP template ratio|Wick plus imaginary perturbation tau=.1|
|---:|---:|---:|---:|
|.02|.0691430805504|.0330203996545|.0691036604326|
|.03|.0785798985064|.0374898338660|.0785623165818|
|.0463|.0875653042342|.0409951189163|.0875763291754|

The third column after u uses q=sqrt(u/(2+tau²)) X[(R−2)+i tau(S−1)]. Two-dimensional Gauss–Legendre integration on [0,40]² at 128,256,512 nodes per coordinate agreed in these ratios within 3.2e-11. At u=.0463 the Wick monomial has C²=.001056337220974 and D=.01206342203926. Thus the request's approximate .088–.089 calibration is in the right range, while the accurate value is about .0875653. The imaginary perturbation raises it by .00001102494, a relative increase .00012590. This independently confirms a finite perturbation violating exact monomial extremality; no general maximum follows.

## 5. Analytic gradients and control variates

Let q=Bc denote the sampled basis evaluation and let m=E[conj(z)qg(|q|²)]. Exact Wick orthogonality allows g to be replaced by h=g−g(0) in m. For any fixed scalar slope s, exact norm u gives

\[
D=B(u)-\phi(0)-su-E[\phi(v)-\phi(0)-sv].
\]

These are expectation identities, not empirical renormalizations. Put p(z)=sum_j m_j z_j, N=||m||², R=N/D. Differentiation under the smooth kernel expectation gives the real differential

\[
dR=2\operatorname{Re}\langle\gamma,dc\rangle,\qquad
\gamma=E\left[B^*\left(\frac{p(h+vg')+\overline p q^2g'}D+\frac N{D^2}q(\phi'-s)\right)\right].
\]

The equivalent expression inside the numerator is \(hp+[2g'\operatorname{Re}(\overline p q)+R(\phi'-s)]q\). Real and imaginary coefficient gradients are 2 Re gamma and 2 Im gamma; on the sphere project out \(c\operatorname{Re}\langle c,\gamma\rangle/u\). These formulas are **proved here**. The code differentiates the same interpolant that it evaluates, so the objective and gradient are internally consistent. Accuracy relative to the true kernel is assessed separately above.

## 6. Exact Gaussian fourth moment and tensor structure

[moments.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/moments.py) computes the fourth moment by expanding q² in the complex Hermite basis. The product formula is

\[
H_{\alpha,\beta}H_{\gamma,\delta}
=\sum_{i\le\alpha\wedge\delta\atop j\le\beta\wedge\gamma}
\binom\alpha i\binom\delta i i!\binom\beta j\binom\gamma j j!
H_{\alpha+\gamma-i-j,\beta+\delta-i-j}.
\]

Here beta and delta are unit multiindices, so each basis-pair product has at most four contraction terms. After accumulation, orthogonality gives \(E|q|^4=\sum|d_{\alpha\beta}|^2\alpha!\beta!\). This is an exact Gaussian moment identity **proved here**, evaluated numerically in float64. It avoids the high sampling error of empirical fourth moments. Checks gave fourth excess 42 for pure and arbitrarily rotated Wick monomials and 16 for the XP template.

The module also searches the compact family of rotated Wick monomials for maximum squared overlap and rotates the tensor to that driver's coordinate system before reporting energy in the six one-driver shells. A best overlap found numerically is not certified to be globally best. The tensor rotation itself is exact algebra, evaluated in floating point.

## 7. Independent validation protocol

[validate.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validate.py) evaluates every saved candidate with eight independent Sobol scrambles of 2^19 points each (2^22 total). Its seed family is disjoint from training. For each candidate it retains every replicate's D and complex content vector. The reported ratio uses the pooled vector and pooled deficit; the standard error comes from the replicate delta-method influence

\[
2\operatorname{Re}\langle\bar m,m_r-\bar m\rangle/\bar D
-\|\bar m\|^2(D_r-\bar D)/\bar D^2.
\]

It also records the t(7)-based 95% halfwidth. This is randomized-QMC sampling uncertainty, not a rigorous quadrature bound and not a confidence bound on the global supremum. Choosing the largest of many validation values introduces selection bias; a fresh larger validation of selected winners is therefore appropriate. The validator resumes by tensor path plus coefficient SHA256 and stores complete replicate checkpoints. For larger samples it limits basis allocation to 2^19 points per chunk.
