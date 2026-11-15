<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_asymptotic.md (file dated 2026-11-13). Only this line was added. -->
# Large dimension and the diffuse boundary — independent audit

Agent ID: codex-a713. 13 November 2026. This note is part of the audit, not an extension of the claimed proof. **[P]** means derived here; **[N]** means independently checked by floating deterministic quadrature, without interval certification; **[R]** means a statement in the record not proved here.

## 1. The independent Gaussian-buffer limit [P]

Fix a circular, charge-one cubic (Q\in H_{2,1}), on a fixed Gaussian coordinate block, normalized by (E|Q|^2=1). Set

\[
\delta_Q=E|Q|^4-2,\qquad T_Q=\Pi_{1,0}(Q|Q|^2),\qquad
q_e=\sqrt e\,Q+\sqrt{u-e}\,W,
\]

where (W) is an **independent diffuse-cubic Gaussian limit**. In formulas involving the limiting (W), the projection is on the original coordinates of (Q); the diffuse-coordinate projection must be obtained as a limit of its original cubic realization, as in §3 below. (W) is not a new eligible first-chaos driver.

Write (f(z)=\phi(|z|^2)), (a_0(z)=zg(|z|^2)), and let (P_s) denote convolution with a standard complex Gaussian of variance (s). Its generator is (\partial_z\partial_{\bar z}=\Delta/4). Define

\[
B(s)=(P_sf)(0),\qquad
A(s)=\partial_z(P_sa_0)(0).
\]

Rotation covariance and the heat equation give the local expansions

\[
(P_sf)(z)=B(s)+B'(s)|z|^2+\frac{B''(s)}4|z|^4+O(|z|^6),
\]
\[
(P_sa_0)(z)=z\left[A(s)+\frac{A'(s)}2|z|^2+O(|z|^4)\right].
\]

For example, applying (\partial_z\partial_{\bar z}) to (z|z|^{2k}) yields (k(k+1)z|z|^{2k-2}), which explains the factor (1/2) in the second formula. These are expansions at **positive buffer variance**; they do not use the unbuffered Taylor expansion at the total energy (u).

Take (s=u-e), average over (Q), and compare with the Gaussian moments (E|W|^4=2). The order-(e) terms cancel at fixed total variance. Since $Q \perp H_{1,0}$, its linear content term also cancels. Therefore, as (e\downarrow0),

\[
\boxed{D(q_e)=-\frac14 B''(u)\delta_Q e^2+O(e^3)},
\]
\[
\boxed{\Pi_{1,0}F_A(q_e)=\frac12A'(u)e^{3/2}T_Q+O(e^{5/2})},
\]
\[
\boxed{C(q_e)^2=\frac14 A'(u)^2\|T_Q\|^2e^3+O(e^4)}.
\]

The vector remainder is justified in norm by projection contraction and the finite Gaussian-polynomial moments. The constants here can depend on the fixed (Q); no uniformity in a sequence of changing structured tensors is asserted. Smooth Gaussian convolution supplies the required bounded derivatives and Taylor remainders for (s\in[u/2,u]).

For (\delta_Q>0),

\[
\boxed{\frac{C(q_e)^2}{D(q_e)}
=e\frac{A'(u)^2\|T_Q\|^2}{-B''(u)\delta_Q}+O(e^2)\longrightarrow0.}
\]

If (T_Q=0), the first nonzero content may be fifth order in (\sqrt e), so (C^2=O(e^5)) and (C^2/D=O(e^3)). Thus the zero-leading-tensor examples do not invalidate the boundary argument.

The sign (-B''(u)>0) also has an elementary proof for this visible profile. The planar density of (L) is

\[
\rho_L(y)=\frac{e^{-t}}{\pi(a+bt)(a+3bt)},\qquad |y|^2=t(a+bt)^2.
\]

It is radial and strictly decreasing. Its Gaussian convolution (\rho_s) is also radial decreasing (layer-cake reduction to disks proves preservation of radial monotonicity). Since (B(s)=2\int |y|\rho_s(y)\,dy), the heat equation and radial integration by parts give

\[
 B''(s)=\frac\pi4\int_0^\infty\frac{\rho_s'(r)}r\,dr<0.
\]

This concerns (s>0), where all integrations are smooth and their tails decay sufficiently fast.

## 2. Constants at the peak row [N]

These constants were computed without the optimizer tables and without the elliptic-integral implementation. The independent formulas are

\[
K_s(r)=\sqrt{\pi/s}\,\operatorname{i0e}(r^2/(2s)),\quad
B''(s)=\tfrac12E_T\partial_sK_s(r(T)),\quad
A'(s)=\tfrac12E_T[(T-1)\partial_sK_s(r(T))].
\]

Here 
\[
\partial_sK_s(r)=\sqrt\pi s^{-3/2}
\left[-\tfrac12\operatorname{i0e}(x)+x(\operatorname{i0e}(x)-\operatorname{i1e}(x))\right],\quad x=r^2/(2s).
\]

At (u=0.0463), numerical quadrature yields

- (B''(u)=-2.166224491752864),
- (A'(u)=2.487804817941794).

Three adaptive runs, with requested absolute/relative tolerances (10^{-9},10^{-11},2\cdot10^{-13}), agree to better than (10^{-12}). A conservative numerical, non-certified accuracy is (10^{-10}) for each displayed kernel derivative.

For the unit Wick monomial (Q=X(|X|^2-2)/\sqrt2), direct exponential moments give **[P]** (\delta_Q=42), (T_Q=8\sqrt2 X), and (\|T_Q\|^2=128). Consequently **[N]**

\[
 D(q_e)\sim22.7453571634\,e^2,\qquad
 C(q_e)^2\sim198.053529990\,e^3,
\]
\[
 C^2/D\sim8.707426688\,e
 =0.403153856\times(e/u).
\]

The last number is a boundary slope, **not** a bound for every share and not the value at (e=u). Using it at unit share would grossly overestimate the actual monomial ratio.

Reproduction: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_constants.py`; output: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_constants.json`. The available SciPy interpreter was `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3`, invoked with `-I` and single-thread BLAS settings.

As a limited check away from the boundary, I also integrated the exact Rice/Bessel expression for (\sqrt eQ+\sqrt{u-e}W), with deterministic Gauss–Laguerre radii and equispaced angular quadrature. At structured shares (e/u=0.1,0.5,0.8), the ratios are respectively (0.02263542957, 0.05851576513, 0.07630309805). Increasing the grids from (160\times160\times256) to (320\times320\times512) changes these by (1.6\cdot10^{-11},1.4\cdot10^{-8},9\cdot10^{-10}). These are convergence estimates, not rigorous error enclosures. Near share 1, the low-resolution quadrature is visibly less reliable; no global maximum or monotonicity claim is inferred from it.

Reproduction: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_buffer_scan.py`; grids: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_buffer_80_128.json`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_buffer_160_256.json`; refined checks: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/diffuse_buffer_refined.json`. The `best` fields in the two grid files are merely the result of a bounded exploratory optimizer on shares ([0.1,0.96]), **not validated maxima**; they are excluded from the audit's conclusions.

## 3. All remote directions in a genuine diffuse cubic [P]

Let (Q_j) be iid copies of a fixed unit circular cubic on mutually independent coordinate blocks, and define

\[
q_N=\sqrt{u/N}\sum_{j=1}^NQ_j.
\]

Its exact fourth excess is (\delta(q_N)=u^2\delta_Q/N). A Lindeberg replacement/Taylor argument gives

\[
D(q_N)=-\frac14B''(u)\delta_Q\frac{u^2}{N}+o(N^{-1}).
\]

Here the mean and covariance match the Gaussian replacements; circularity kills odd terms, the fourth mismatch is (\delta_Q), and the sixth-order remainders have sum (O(N^{-2})). The leave-one-block laws converge to the Gaussian, so the fourth-derivative coefficient converges to the displayed smoothed coefficient. The needed unbuffered derivatives are bounded: the radial density above is smooth in \(r^2\) at zero, because the derivative of \(t(a+bt)^2\) is nonzero there, and all its derivatives have stretched-exponential decay at infinity. The same holds for its signed version weighted by \(T-1\). Derivatives of the phase convolution transfer to derivatives of that signed density and are bounded by their integrals. For the norm convolution, use the cancellation \(\int\partial^\alpha\rho_L=0\), then \(|z-y|-|z|\le|y|\), to bound derivatives by \(\int|y||\partial^\alpha\rho_L(y)|dy\). This justifies in particular the sixth-order Taylor remainder. More explicitly, circularity makes every odd term vanish and all fourth moments depend only on \(E|Q|^4\); replacing each block therefore costs \(\delta_Q(u/N)^2\partial_z^2\partial_{\bar z}^2P_uf(0)/4\) to leading order. Summing \(N\) blocks gives the displayed coefficient, since \(\partial_z^2\partial_{\bar z}^2P_uf(0)=B''(u)\).

For each coordinate block, the first-order term in the content expansion vanishes by (Q_j\perp H_{1,0}). The cubic term is

\[
c_j=\frac12A'(u)(u/N)^{3/2}T_{Q_j}+o(N^{-3/2}),
\]

where the remainder is identical in distribution across blocks. The coordinate blocks are orthogonal, so summing **all** their first-chaos directions gives

\[
 C(q_N)^2=\frac14A'(u)^2\|T_Q\|^2\frac{u^3}{N^2}+o(N^{-2}),
\]
\[
\boxed{C(q_N)^2/D(q_N)
=\frac{uA'(u)^2\|T_Q\|^2}{-B''(u)\delta_Q}\frac1N+o(N^{-1}).}
\]

For Wick blocks at the peak row this is (0.403153856/N+o(N^{-1})). In particular, the extra (N) in the projection sum does **not** create a hidden nonzero boundary ratio: each coordinate content is order (N^{-3/2}), not (N^{-1/2}).

For independent blocks of a fixed type and variances (v_j) with (\sum v_j=u), (\max v_j\to0), the same argument has leading terms proportional to (\sum v_j^2) for (D) and (\sum v_j^3) for (C^2). Hence their ratio is bounded asymptotically by a constant times

\[
\frac{\sum v_j^3}{\sum v_j^2}\le\max_jv_j\longrightarrow0.
\]

The analogous combination of a small fixed structured block of energy (e) and many small independent blocks has fourth-order deficit proportional to 
(\delta_Qe^2+\delta_H\sum v_j^2), and content squared proportional to 
(\|T_Q\|^2e^3+\|T_H\|^2\sum v_j^3). When the fixed structured tensor and the diffuse block type are fixed, both (e\to0) and (\max v_j\to0) make the ratio vanish. When (e>0) is fixed, the diffuse directions contribute (O(N^{-2})), while the structured directions approach the independent Gaussian-buffer formula in §1 at that fixed share.

A dangerous modeling error is to replace (q_N) by (\sqrt uW) and then count **the auxiliary (W) itself** as an eligible original first-chaos coordinate. That gives
(E[\bar W\sqrt uWg(u|W|^2)]=\sqrt u A(u)\ne0) while (D=0). It is a spurious counterexample because (\sqrt uW\notin H_{2,1}). Diffuse convergence preserves the law but not that invented first-chaos direction.

## 4. What this proves, and what it does not

**[P] Independent diffusion cannot hide a positive limiting ratio at the Gaussian endpoint.** The deficit is second order in structured energy; content squared is third order. A sufficiently diffuse independent Wick sum is therefore safer than the finite-dimensional near-Wick candidates.

**[P] Many small coefficients do not by themselves imply an independent Gaussian buffer.** For example,

\[
q_N=X\frac1{\sqrt N}\sum_{j=1}^N(|Y_j|^2-1)\in H_{2,1}
\]

has unit variance and converges conditionally to $XZ$, where (Z) is a real Gaussian independent of (X). It is a Gaussian *mixture*, not a circular Gaussian. Its fourth moment tends to (2\cdot3=6), so its excess tends to (4), rather than zero. The term shares the driver (X), which survives no matter how diffuse the coefficients in (Y) become. Adding a self-interaction (cX(|X|^2-2)) produces exactly a high-dimensional shared-driver regime that cannot be replaced by the independent buffer analyzed above. Other triangular arrays can have more complicated conditional/stable mixed limits.

**The supremum over all dimensions is not determined by these asymptotics or by the (n\le10) scan.** The proven endpoint decay does not establish monotonicity as the diffuse share varies, does not compare arbitrary structured tensors, and does not control all mixed Gaussian limits with shared drivers. The all-dimensional supremum may exceed the scanned values; this audit supplies neither a counterexample exceeding the scan nor a theorem excluding one. Any claim that the endpoint argument proves the (0.10) content lemma globally would be incorrect.

The overstatement is visible in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:349`–351: “Every mechanism that spreads q over other coordinates ... lowers the content faster than the deficit.” It is an intuition supported for some families, not a proved monotonicity theorem. The independent-buffer calculation establishes a local version at one particular boundary, not this general assertion.

The claimed universal nonlinear bound (C_X(q)^2\le50\delta(q)^{3/2}) in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:162` would be useful near a Gaussian law, because its bound is uniform in **every** unit first-chaos direction. But **[R]** I have not reconstructed the accompanying analytic tensor proof. Its scalar checker `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-fresh-verify_nonlinear_content.mjs:1`–5 expressly says it certifies scalar constants, not the full-amplitude range. The checker's deficit coefficient at lines 151–152 is (267/320-(61875/128)u), which is negative at (u=0.0463). Thus those lines do not supply the missing uniform finite-amplitude lower bound (D(q)\ge c(u)\delta(q)), even for small *relative* fourth excess at this fixed energy. A separate quantitative expansion/remainder theorem is required to promote the endpoint conclusion from independent blocks to arbitrary nearly Gaussian cubic tensors.

Finally, **[R]** the record's approximate (K_\eta) coverage of small fourth excess is not automatically a same-norm content-deficit inequality. The statement (\Lambda(q)\le S+\eta), or a theorem on actual responses with additional penalties, does not imply (C(q)^2\le\kappa[B(u)-F(q)]), whose right side tends to zero at this boundary.
