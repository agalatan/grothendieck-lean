<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent-pushforward-audit/REPORT.md (file dated 2026-11-13). Only this line was added. -->
# Conjecture K: independent audit

**13 November 2026 · Agent codex-a713 · provenance: independent pushforward-quadrature audit**

The numerical content conjecture survives this audit, but the claimed route from a sharpened content constant to full K does not yet constitute a proof. In particular, **0.10 plus the existing separate A/B cost certificates is insufficient as a logical implication**: a joint finite-amplitude theorem is missing. The deterministic two-dimensional candidate is approximately **0.0876025944**, rather than 0.089. Independent diffusion is harmless at the Gaussian endpoint, but this does not settle the supremum over arbitrary dimensions.

This report distinguishes **[P] proved/rederived here**, **[N] numerical checks here**, and **[R] inherited claims or numerical inputs not independently verified**. [P] is a mathematical audit, not Lean formalization. Exact checker replays conditional on stored scalar enclosures are explicitly identified. Floating convergence estimates are not interval certificates.

The requested directory acquired another process's report while this audit was running. That report was preserved. This report and its provenance are separate; unrelated optimization runs and certificate regenerations in the shared directory are not evidence for the conclusions below. Original research files and Lean sources were not edited; no Git mutation or Lean build was performed. This audit performed no optimizer search in dimensions above two.

## 1. What is confirmed, and what is not

### The A-only reduction is valid with the right hypotheses [P]

Use unambiguous notation

\[
\Delta(q)=B(u)-F(q),\quad H(q)=S-\Lambda(q),\quad
H(q)=\Delta(q)+[S-B(u)+u/\epsilon],\qquad u=\|q\|_2^2.
\]

The second bracket is nonnegative by the definition of S. If the A-shell estimate holds on the stated amplitude range,

\[
\Lambda(q+(T-1)U)\le\Lambda(q)+2\Re\langle U,c_A(q)\rangle-k_A\|U\|^2,
\]

then \(\|c_A(q)\|^2\le k_A\Delta(q)\) implies \(\Lambda(q+A)\le B(u)-u/\epsilon\le S\). This is completing the square. The weaker target \(\|c_A\|^2\le k_A(H+\eta)\) suffices for \(K_\eta\); with \(\|U\|\le r\), the exact optimized gain is

\[
\Psi_r(C)=\begin{cases}C^2/k_A,&C\le k_Ar,\\2rC-k_Ar^2,&C>k_Ar.\end{cases}
\]

Thus the same-norm deficit is a stronger, cleaner sufficient target, not interchangeable with the penalized deficit. An approximate remote theorem \(\Lambda(q)\le S+10^{-5}\) does **not** establish \(\Delta(q)\ge0\) or a same-norm content bound. The distinction in [the monograph, §§3.4 and 4](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:145) must remain explicit.

For the full projection,

\[
C(q)^2=\sum_j|E[\bar w_jF_A(q)]|^2
=\sup_{\|X\|_2=1,\ X\in H_{1,0}}|E[\bar XF_A(q)]|^2.
\]

A bound for **every unit linear form**, uniformly for each q, is exactly the full norm bound. A bound separately for each displayed coordinate is not. The certified Gaussian-factor proof chooses the direction of the whole content vector; the one-driver proofs show that all other coefficients vanish by phase symmetry. These family theorems do not omit a sum over directions.

The rectangle R concerns an A-only core, within additional energy/response restrictions. Its closure does not prove raw K for all adversaries. The cutoffs 0.01122, 0.011223 and 0.01125 also need a single exact domain cover. [The monograph, §4b](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:425) correctly acknowledges later assembly layers, contradicting earlier descriptions of the content lemma as the sole remaining statement.

### Certificate implications inspected and exact stages replayed

Detailed derivations, source paths, ranges, and replay limitations are in [the record audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/record_audit.md).

- **A-shell cost, 0.24 for \(w\le0.0113\): [P], exact replay passed.** The real-projection density bound, its Gaussian averaging and tail estimate imply the claimed cost. The checker verifies the required inequality against \(1/\epsilon-0.24\), rather than an unrelated numerical condition. It also verifies the restricted tensor inequality and the zero-leading-tensor/fifth-moment example. Sources: [the projected-cost derivation](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-shared_driver_rectangle.tex:249), [the strengthened checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread2-verify_content_extension.mjs:1). Evidence: [replay log](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/a_cost_tensor_replay.log).
- **B-shell global cost: [P], exact replay passed at all three rows.** Pushing the measure weighted by \(T^2/2\) through L yields a unit-mass planar density. If that density is at most \(M/\pi\), its inverse-distance potential is at most \(2\sqrt M\); the checker bounds M and verifies \(4M\le(1/\epsilon-k_B)^2\). The theorem requires a remote base, independent of the visible coordinate. Sources: [proof, §§1–3](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/PROOF.md), [checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/verify_b_cost.mjs). Evidence: [replay log](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/b_cost_replay.log).
- **One driver \(XP(Y)\), arbitrary complex quadratic form: implication [P]; inherited scalar enclosures [R].** Conditional Gaussian integration gives \(F=EB(|P|^2)\) and \(C=|E[PJ(|P|^2)]|/2\). The weighted Cauchy–Schwarz step, directional moment constraint, nonnegative polynomial envelope, sixth-moment bound and exact expectation cap genuinely imply 0.239. The improvement to 0.22 has a valid reweighted implication too. Exact Wick moment contractions were replayed. The full scalar envelope and its Arb nodes were not regenerated here. Sources: [R23 proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/proof.md), [R23 checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/verify.py), [0.22 proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/proof.md). Evidence: [moment replay](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r23_moments_replay.log).
- **Whole Gaussian-factor class: implication [P]; scalar certification inputs [R].** Applying the scalar Hermitian sixth-moment inequality to a real Gaussian linear combination of all real and imaginary coefficient forms gives the stated vector inequality. The covariance is the real covariance of that coefficient vector. Choosing the real direction aligned with the full complex content norm yields the checker's constraint and its 0.239 cap, independently of dimension. Sources: [proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/proof.md), [checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/verify.py).
- **Real self-interaction plus Hermitian quadratic form: exact dual stage checked, conditional on stored scalar enclosures.** All three rows passed 18,513 moment duals and 27,214,110 exact polynomial comparisons each. The majorant controls the joint expression \(F+2\ell C\); the allowed \(\ell\)-range contains \(C/0.23\), so its conclusion really is \(C^2\le0.23(\Delta-1/40000)\), for \(u\in[0.03,0.0463]\). Scalar integration and Arb kernel data were not regenerated. Sources: [proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/proof.md), [exact dual checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/verify_duals.cpp). Evidence: [peak](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_peak_duals_replay.log), [flank](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_flank_duals_replay.log), [upper](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_upper_duals_replay.log).
- **Monomial saddle: [P] variation formula, [N] positive variation independently reproduced.** The exact algebra/Taylor-constant checker passed; the stored Arb kernel inputs to the interval proof were not regenerated. The source certificate establishes a local counterexample to extremality, not a global maximum. Sources: [proof, §2](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/proof.md), [checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/verify.py); evidence: [algebra replay](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/saddle_algebra_replay.log) and §3 below.

The old Lean/native K-a statement, all outside-R exclusions, the complete original norm-bound proof, and all remaining interval packages were **not** re-audited end to end. They remain [R]. This audit does not convert all labels in the record into independently confirmed theorems.

### The certified families do not combine into a general cubic [P]

For a selected driver X, a general cubic contains six sectors:

\[
cX(|X|^2-2)+XP+\bar XB+(|X|^2-1)V+X^2\bar W+R_0.
\]

Their nonlinear content and deficit are not additive. For example,
\(q=\bar XY^2+(|X|^2-1)Y\) has \(E[\bar Xq|q|^2]=6\); phase averaging does not erase the mixed contribution. This exact witness was replayed from [R25's checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/check_shells.mjs), with [this log](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r25_shells_replay.log). The claim that several self-interacting drivers follow “driver by driver” is unsupported: other components remain inside \(g(|q|^2)\). A general tensor argument, or a proved reduction controlling all these terms, remains necessary.

## 2. The A+B constant and budget

### The additional hypotheses must be stated [P]

Suppose there is a **joint finite-amplitude** cost estimate with matrix

\[
M=\begin{pmatrix}k_A&m\\m&k_B\end{pmatrix}>0,
\quad
\Lambda(q+A+B)\le\Lambda(q)+2\Re\langle a,c_A\rangle+2\Re\langle b,c_B\rangle
-k_A\|a\|^2-k_B\|b\|^2-2m\Re\langle a,b\rangle.
\]

Also suppose \(\|c_A\|^2\le\kappa\Delta\) and the **global** comparison
\(\|c_B-\rho c_A\|\le e\), with \(\rho=0.5053\), \(e=0.007\sqrt u\). Neither the required finite-amplitude joint estimate nor the final global common-center scalar comparison was established by the cited record. The latter would follow from
\(|g_B(v)-0.5053g(v)|\le0.007\) for all v by **L² projection contraction**. The L¹ projection bound written in [assessment §33](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1228) is invalid for unbounded Gaussian linear forms.

Completing the joint square gives the gain

\[
\frac{\|c_A\|^2}{k_A}+\frac{\|c_B-(m/k_A)c_A\|^2}{k_B-m^2/k_A}.
\]

With \(s=k_B-m^2/k_A\), \(h=|\rho-m/k_A|\), and \(z=\sqrt\Delta\), the excess over S is bounded by

\[
\left(\kappa/k_A-1+\kappa h^2/s\right)z^2
+\left(2h\sqrt\kappa e/s\right)z+e^2/s.
\]

Maximize over \(0\le z\le\sqrt{1.6u}\). In [assessment §44](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1428), substituting the upper bound for Δ into a **negative** term produced false uniform negative margins.

At \(u=0.0463\), \(k_A=0.24,k_B=0.26\), the corrected conditional figures are:

| Content κ | Assumed joint cost | Uniform excess bound over S |
|---|---|---:|
| 0.24 | signed m=+0.118 | 0.00005470475 |
| 0.24 | signed m=+0.115 | 0.00012156483 |
| 0.15 | genuine joint diagonal bound, m=0 | 0.00001437080 |
| 0.10 | adverse mixed bound of magnitude 0.118 | 0.00007180979 |

These are [N] arithmetic evaluations of the [P] formula, not proofs of the analytic hypotheses. The first two agree with the record's fragile-budget calculation. The last two replace its claimed negative margins of about 0.016 and 0.0055. The corrected conditional conclusion still fits \(10^{-4}\), but with much less reserve.

For the adverse matrix and this comparison error, the exact threshold for the bounding quadratic to stay within \(10^{-4}\) is

\[
\kappa\le\frac{4889900}{47482107}=0.102984056710\ldots.
\]

This is a threshold for the specified sufficient assumptions, not the unknown sharp constant required by K. The 0.15 route needs an actual joint diagonal/sign restriction. A positive mixed *coefficient* alone does not make \(\Re\langle a,b\rangle\) nonnegative. The 0.10 route still needs a quantitative adverse bound; “no statement about m at all” is false. The separate certified Gaussian-factor B-content constant 0.1195 is not a replacement for alignment: combined with A=0.10 and the adverse matrix it gives gain/Δ about 1.660, which fails.

The crucial logical gap persists in [assessment §45](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1441): it correctly notes that the B theorem cannot be applied at q+A, then recommends using “the certified diagonal costs” as if they supplied a joint theorem. They do not. [The J3 exact obstruction](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/verify_algebra.mjs) was replayed successfully in [this audit log](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/j3_algebra_replay.log). All corrected arithmetic is reproducible in [the budget script](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/budget_audit.py).

## 3. Optimizer audit and independent numerical results

### Formulas and statistical interpretation

**[P] The main formulas are correct.** Let M be the angular mean norm, J the angular mean inverse norm and \(m=4ry/(r+y)^2\). Then

\[
M=\frac2\pi(r+y)E(m),\quad J=\frac2{\pi(r+y)}K(m),\quad
M_y=\frac{M+(y^2-r^2)J}{2y}.
\]

The last identity follows directly from \(2y(y+r\cos\theta)=|re^{i\theta}+y|^2+y^2-r^2\). SciPy uses the elliptic parameter m, matching [the table code](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables.py:9). The substitution \(T=s^2\) correctly supplies \(2se^{-s^2}ds\); both divisions by y in g are required. At zero,
\(g(0)=\int_0^\infty e^{-s^2}(s^2-1)/(a+bs^2)\,ds\).

The Wick basis in [the optimizer](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:16) is orthonormal and spans the full space of dimension \(n^2(n+1)/2\). All remote projection directions are included. Writing c for the sampled content vector and \(s=Wc\), direct differentiation yields its complex representation of the real gradient:

\[
\frac{2E^*}{ND}\{\bar s q^2g'+s(g+|q|^2g')-R(\kappa_0-\phi')q\}.
\]

Its tangent projection and normalization derivative are correct. A small 4096-sample test agreed with central differences to approximately \(10^{-12}\), away from the special cases below. Here \(\kappa_0=\phi'(u)\) is the control-variate coefficient, not the conjectured content constant.

The denominator control variate is unbiased for a fixed vector with exact population norm u. The equal-batch delete-one jackknife formula is also correct. It estimates a standard error from only eight groups; it is not a confidence interval, does not remove ratio bias, and does not account for selecting the largest validation result across restarts.

Actual implementation limitations, with exact source locations:

- [Optimizer lines 12–13](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:12) clip \(|q|\) at 20, but retain nonzero derivatives of those now constant values. No uniform tail correction is supplied.
- [Optimizer lines 9–13](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:9) use unconstrained splines whose slopes at zero are nonzero, then substitute different derivatives near zero. The gradient is not exactly the derivative of the returned objective there.
- [Optimizer line 34](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:34) returns a flat zero objective/gradient when the sampled deficit is nonpositive. This is especially problematic close to a Gaussian law, where the denominator is small.
- Squaring the estimated projection introduces \(\operatorname{tr}\operatorname{Cov}(\bar Wqg)/N\) positive numerator bias; division adds ratio bias. Fresh samples alone do not remove either.
- [Optimizer lines 63–67](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:63) do not save optimizer success, termination reason or gradient norm.

None of the checked kernel/interpolation errors explains a ratio near 0.089: substituting the original splines at the deterministic local optimum changes the ratio by only about \(1.7\cdot10^{-11}\). Source node and midpoint checks, derivations and statistical details are in [the optimizer audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimizer_audit.md).

### Two independent deterministic implementations [N]

The primary implementation here uses neither elliptic integrals nor source tables. Push L to the plane:

\[
\rho_L(y)=\frac{e^{-t}}{\pi(a+bt)(a+3bt)},\qquad |y|^2=t(a+bt)^2.
\]

In polar coordinates centered at the shifted origin, \(L+y=Re^{i\theta}\), integrate \(2R^2\rho_L(Re^{i\theta}-y)\) for φ, and \(R\cos\theta(t-1)\rho_L(Re^{i\theta}-y)/y\) for g. The inverse radial map is evaluated explicitly with a hyperbolic sine. These integrands are smooth; no moving inverse-distance singularity remains. Composite Gauss–Legendre rules integrate the visible variables and the independent exponential remote radii. The second implementation uses fresh smooth Abel-transform kernels and Gauss–Laguerre/trapezoid integration of the entire six-complex-coefficient space in two dimensions.

The two methods agree on the ratios below to approximately \(10^{-12}\); refinements of the visible kernel grid and remote rules are similarly stable. We conservatively attach **empirical numerical accuracy of about \(2\cdot10^{-9}\)** to these ratios, not rigorous interval bounds. Optimizing parameters are less precise, about a few \(10^{-6}\).

At \(u=0.0463\), with \(R=|X|^2,S_Y=|Y|^2\):

| Normalized cubic | \(C^2/\Delta\) |
|---|---:|
| \(\sqrt{u/2}X(R-2)\) | 0.087565304234 |
| \(\sqrt u X(S_Y-1)\) | 0.040995118921 |
| Imaginary family at τ=0.1 | 0.087576329182 |
| Imaginary family maximum on [0,0.3] | 0.087578181523 |
| Best full-space two-dimensional local candidate found | 0.087602594357 |

For the imaginary family, the maximum is at **τ≈0.1276075**. Its relative excess over the monomial is **\(1.4706\cdot10^{-4}\)**; at τ=0.1 the relative excess is **\(1.2591\cdot10^{-4}\)**. The older record's “about \(1.3\cdot10^{-4}\) near 0.1” therefore describes the correct small effect. It is not evidence for a 1–2% gain.

The better two-dimensional local candidate, up to unitary changes of coordinates and a common phase, is

\[
q=\sqrt{\frac{0.0463}{2+|z|^2}}X[(R-2)+z(S_Y-1)],\qquad
z\simeq0.0528353+0.2212267i.
\]

Its deterministic fourth excess is approximately **40.0488**; reported Monte Carlo fourth moments near 38 require their own sampling-error assessment. The full six-complex-coefficient numerical Hessian supports a local maximum modulo symmetries; structured and random starts returned its unitary orbit. **This is not a proof of the global maximum in \(\mathbb C^2\)**. No supplied coefficient log identifies the alleged 0.0892 candidate, so it cannot be directly refuted or replayed. The deterministic evidence supports approximately 0.087603, and supplies no evidence for a larger extremum.

The source control variate actually increases noise near these candidates. Integrating the ratio's influence-function variance gives an asymptotic SE at \(N=2^{23}\) of **0.000679** for the monomial and **0.000683** for the local maximum. Removing the control variate gives about 0.000439 and 0.000445; the ratio-optimal coefficient gives about 0.000204. Thus 0.0892 is only about **2.34 single-candidate standard errors** above 0.087603, before selecting the best restart. With only eight jackknife groups, a reported SE of 0.0004–0.0005 can substantially underestimate the asymptotic sampling standard error. Winner selection is a plausible explanation; a supplied candidate and a prespecified independent evaluation would be needed to establish otherwise.

Primary reproducibility: [independent script](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_quadrature.py), [fine family results](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_families_64.json), [complex-family refinement](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_complex_64.json). Second method: [full-space script](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_deterministic.py), [coefficients, moments and SE calculations](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_family_summary.json).

## 4. What happens at large dimension

### Independent Gaussian buffering: a genuine endpoint result [P]

Fix a unit circular cubic Q on a fixed coordinate block, let \(\delta_Q=E|Q|^4-2\), \(T_Q=\Pi_{1,0}(Q|Q|^2)\), and consider

\[
q_e=\sqrt e Q+\sqrt{u-e}W,
\]

where W is an independent **diffuse-cubic Gaussian limit**. It is not an additional eligible first-chaos coordinate. Let \(P_s\) denote Gaussian convolution of variance s, \(f(z)=\phi(|z|^2)\), \(a_0(z)=zg(|z|^2)\), and \(A(s)=\partial_z(P_sa_0)(0)\). The complex heat generator is \(\partial_z\partial_{\bar z}\), giving

\[
P_sf(z)=B(s)+B'(s)|z|^2+\tfrac14B''(s)|z|^4+O(|z|^6),
\]
\[
P_sa_0(z)=z[A(s)+\tfrac12A'(s)|z|^2+O(|z|^4)].
\]

At fixed total variance, the second-moment terms cancel; first-chaos orthogonality removes the linear content. Consequently,

\[
\Delta(q_e)=-\tfrac14B''(u)\delta_Qe^2+O(e^3),\qquad
C(q_e)^2=\tfrac14A'(u)^2\|T_Q\|^2e^3+O(e^4).
\]

For \(\delta_Q>0\),

\[
\frac{C(q_e)^2}{\Delta(q_e)}
=e\frac{A'(u)^2\|T_Q\|^2}{-B''(u)\delta_Q}+O(e^2)\longrightarrow0.
\]

The remainders here are for fixed Q, with smoothing variance bounded below. If \(T_Q=0\), the decay is faster: \(C^2=O(e^5)\). The derivation and derivative justification are in [the diffuse-limit audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_asymptotic.md).

Independent Rice/Bessel quadrature gives [N], with approximately \(10^{-10}\) empirical accuracy,

\[
B''(0.0463)=-2.166224491753,\qquad A'(0.0463)=2.487804817942.
\]

For the unit Wick monomial, exact moments give \(\delta_Q=42\), \(\|T_Q\|^2=128\), so

\[
\Delta\sim22.74535716e^2,\quad C^2\sim198.05352999e^3,\quad C^2/\Delta\sim8.707426688e.
\]

This is a boundary slope, not a bound at arbitrary structured share. Limited deterministic checks at structured shares 0.1, 0.5 and 0.8 give 0.02263543, 0.05851577 and 0.07630310, respectively; they do not prove monotonicity.

### All diffuse directions must be counted [P]

For iid independent cubic blocks \(q_N=\sqrt{u/N}\sum_{j=1}^NQ_j\), a fourth-order replacement expansion gives

\[
\Delta(q_N)\sim-\tfrac14B''(u)\delta_Q\,u^2/N,
\quad
C(q_N)^2\sim\tfrac14A'(u)^2\|T_Q\|^2\,u^3/N^2.
\]

Each block's content is order \(N^{-3/2}\); summing its squared norm over **all N blocks** produces \(N^{-2}\). Thus the iid Wick ratio is **\(0.403153856/N+o(N^{-1})\)**. Unequal independent small blocks similarly give a ratio proportional to \(\sum v_j^3/\sum v_j^2\le\max v_j\), tending to zero. There is no hidden positive boundary ratio from the projection sum.

### This does not settle all dimensions

Many small coefficients need not yield an independent Gaussian buffer. The cubic

\[
X\,N^{-1/2}\sum_{j=1}^N(|Y_j|^2-1)
\]

converges to \(XZ\) with Z real Gaussian, independent of X. Its fourth moment tends to six, not two: the shared X survives. Adding self-interaction produces a high-dimensional shared-driver regime outside the independent-noise argument.

Therefore **the supremum over all dimensions can still exceed the values found in the finite-dimensional searches; neither the scans nor this endpoint calculation exclude it**. This audit gives no counterexample doing so. Proving it cannot happen requires a uniform fixed-chaos argument or a structural theorem covering shared/mixed Gaussian limits. The assertion in [the monograph, §4](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:349) that every spreading mechanism lowers content faster than deficit is unsupported as a general theorem.

## 5. L5, L6, and definite record corrections

**L5 remains open in two substantial places.** First, a joint finite-amplitude A+B cost must be proved. An all-shift Hessian bound at a remote base does not integrate automatically along \(q+s(A+B)\), whose base now depends on the visible coordinate. Second, odd-sector nonincrease must hold uniformly over the nonzero even core and all allowed sectors. The parity identity \(\Lambda(H+O)=\Lambda(H-O)\) proves absence of odd first variation and mixed even/odd Hessian; it does not prove nonincrease. The zero-core theorem, a certificate on one nonzero core and the failure of one inverse-norm sufficient condition do not fill that gap. See [the monograph, §4b](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:425) and [assessment §§34–43](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1256).

**L6 is more than writing a theorem name.** It needs the exact K/K′ hypothesis, the correct witness ε, certified scalar S values, a row envelope covering the whole response parameter, energies outside R, and a total error ledger. Rows with different ε cannot silently be minimized as if they bounded the same witness operator. A finite set of fixed profiles may suffice, but the domain cover must be proved. Read-only searches found no consumer under `lower_of_K`, `KHyp`, `ConjectureK` or `K_eta`, consistent with [the monograph, §5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:515). This is not a Lean build or proof-dependency audit.

Definite stale/incorrect statements include:

1. [Monograph §3.1](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:97): “sup Λ=1.3649” is impossible at the peak, since G=0 already gives \(\Lambda(0)=\sqrt\pi(a+3b/2)=1.371879280600870\). [P]
2. [Monograph §3.5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:216) still describes the monomial as the worst case despite its later certified saddle; its blanket statements about mixtures are false. [N/P]
3. [Monograph §4](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:353): “zero-tensor ... examples have no content at all” confuses vanishing leading tensor with vanishing nonlinear content. Its own exact fifth-order example contradicts this. [P]
4. [Monograph §4b](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:464) retains a ratio interval refuted at other rows in [assessment §45](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1441). Its table also retains the obsolete directional-envelope candidate despite the later obstruction. [R inconsistency]
5. [Monograph §§0 and 5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:515): \(B\le0.713267\) does not imply \(1/B>1.402\). Its reciprocal is 1.4019995317; the required strict cap is \(B<500/701=0.7132667618\). For 1.4022 the cap is \(B<0.7131650264\). Starting from the displayed exact-K cap 0.713160 would leave only about \(5.03\cdot10^{-6}\), not \(10^{-4}\). Display rounding must not enter the consumer as an exact premise. [P/N; underlying proposed cap R]

## 6. One-page verdict

**The content inequality is credible, but the claimed proof distance is understated.** The 0.24 and 0.15 targets are consistent with the independent checks and have substantial room over the two-dimensional candidate. The 0.10 target is also plausible, with numerical margin about 14%, but has not been validated uniformly over dimension, all mixed sectors or all required rows. The independent Gaussian endpoint is safe: deficit is second order in structured energy and squared content is third order. That useful result does not eliminate shared-driver high-dimensional limits or prove finite-amplitude monotonicity.

The older saddle claim is essentially right. The pure imaginary perturbation raises the ratio by only about 0.015%, and allowing a real component raises it by about 0.043%. The reported Monte Carlo value near 0.089 is not established as a genuine improvement. The source kernel and gradient formulas are largely sound, but its inefficient control variate and eight-group error estimate make winner noise a plausible explanation. A global two-dimensional optimum has not been proved here.

There are at least **three mathematical obligations** between the current record and full K: a general dimension-uniform content/deficit theorem, finite-amplitude joint A+B control, and uniform control of the odd sectors over a nonzero core. The scalar comparison and exact domain/error cover must also be certified. The family certificates are genuine progress where their inputs are trusted, but their union is not a general theorem. A sharpened 0.10 family certificate does not by itself complete the A+B argument. The Lean consumer and its row envelope then remain a separate verification task. Moreover, \(K_{10^{-4}}\) targets roughly 1.402; the full advertised gain of about +0.0005 to 1.4022 requires a tighter error ledger.

**I would continue only with a bounded feasibility stage, not on the assumption that one more family certificate finishes the programme.** The next single statement I would attack is the finite-amplitude joint estimate

\[
\Lambda(q+A+B)-\Lambda(q)-2\Re\langle a,c_A\rangle-2\Re\langle b,c_B\rangle
\le-0.24\|a\|^2-0.26\|b\|^2+0.236\|a\|\|b\|,
\]

on the precise intended energy domain, with arbitrary shared cubic q and linear drivers. This is the missing premise that makes a 0.10 content target meaningful. I would first try to falsify it using deterministic quadrature on explicitly parameterized shared-driver families, then seek a certificate for the **segment-integrated, Gaussian-averaged** curvature with rigorous tails. The pointwise intermediate-base Hessian is the wrong target, as the record already found. If this joint estimate fails, the required content constant and the programme's payoff must be reassessed before investing further in sharper family envelopes. If it survives, its exact formulation provides a stable target for interval arithmetic and, eventually, the consumer.

## Reproduction and provenance

Numerical Python computations used `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I` and single-thread numerical-library settings; the standard-library budget script used default `python3 -I`. Exact checker replays used Node and the compiled C++ dual checker. The default Homebrew Python lacked SciPy; the existing framework interpreter supplied it. This audit installed nothing. Only small deterministic dimension-two searches and one small gradient Monte Carlo check were used.

Primary numerical reproduction, executed sequentially:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_quadrature.py kernels --step .001 --order 48 --angles 320
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_quadrature.py families --table /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_kernels_0.001_48_320.npz --order 64
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_quadrature.py complex --table /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_kernels_0.001_48_320.npz --order 64
```

Supporting reports: [record and certificate audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/record_audit.md), [optimizer audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimizer_audit.md), [diffuse asymptotics](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_asymptotic.md). These and the individually linked logs are this audit's evidence. Other concurrently created files in the enclosing directory were neither adopted nor overwritten as part of this report.
