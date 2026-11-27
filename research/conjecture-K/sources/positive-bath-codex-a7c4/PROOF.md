# Signed content and the two raw shells for positive bath degree

Agent-ID: codex-a7c4. Rows 6.3.46 and 7.4.19. **P + C, author only.** Task #752 continues #509 and #748. The retained six-sector replay in #747 proves a different statement.

Fix the peak visible profile, with $a=699/1250$, $b=179/1250$ and price $p_*=2500/1891$. Use the energy $u$, normalized fourth excess $\chi$, same-variance deficit $D$, raw A-content $C$, and the four disjoint-block hypotheses of [6.3.44](../strong-content-blocks-codex-a7c4/PROOF.md). Write $p(X)=\sum_j p_j(X_j)$ for such a core, with $u=E|p|^2$, $\delta_j=E|p_j|^4-2(E|p_j|^2)^2$ and $\chi=\sum_j\delta_j/u^2$ for $u>0$. Take $u\chi=0$ when $u=0$. Let $Y$ be any independent standard complex Gaussian block. Let $h(X,Y)$ be **any** pure $(2,1)$ cubic with $E[h\mid X]=0$. Equivalently $p=E[p+h\mid X]$ and the $Y$-degree of every residual Wick term is positive. Put $e=E|h|^2$ and $e_1=E|h_1|^2$, where $h_1$ is the component of $Y$-degree one. The total remote energy is $v=u+e$.

For $v\le0.0463$, the single condition
\[
 16000e+11000e_1\le u\chi
\]
implies $C(p+h)^2\le(6/25)D(p+h)$ and **exact two-shell peak Conjecture K**, $\Lambda(p+h+A+B)\le S$. Both shell drivers are arbitrary remote holomorphic Gaussian linear forms with arbitrary amplitudes and sharing. The three odd shells are zero. For $u=0$ the hypothesis means $h=0$. On the original fourteen numerical rectangles of 6.3.44, the condition can be replaced by $n_0e+(n_1-n_0)e_1\le u\chi$ with the following divisors.

| Core family | $n_0$ | $n_1$ |
|---|---:|---:|
| Each block carries at most $u/41$ | 3700 | 6000 |
| $28(\sum_j\delta_j^{3/2})^2\le(\sum_j\delta_j)^3$ | 12000 | 27000 |
| $0.65\le\chi\le1.4$, $s\le0.21\chi$ | 1150 | 2200 |
| $1\le\chi\le1.4$, $s\le0.22\chi$ | 900 | 1800 |

Here $s=\sum_j\delta_j^{3/2}/u^3$. The local cases require $u\ge0.008$ and, for the first two rows, $\chi\ge0.0784$. For $e_1=0$ these statements preserve the original energy allowances and extend the [two-shell conclusion](../shared-bath-perturbation-codex-a7c4/PROOF.md) across the critical energy band. For a purely bath-linear perturbation the full-band allowance is $e\le u\chi/27000$.

## The surviving derivative is perpendicular to the core content

Let $r=|p|^2$, $g=g_A$, and $\Psi(w)=w g(|w|^2)$. Here $C(p)=\|\Pi\Psi(p)\|_2$, where $\Pi$ is orthogonal projection onto remote holomorphic Gaussian linear forms in $X,Y$. The linear-bath component has the form
\[
 h_1=\sum_j\big(Y_j U_j(X)+\bar Y_j V_j(X)\big),\qquad
 e_1=\sum_j(\|U_j\|_2^2+\|V_j\|_2^2),
\]
where the $U_j$ are centered $(1,1)$ quadratics and the $V_j$ are holomorphic $(2,0)$ quadratics. The real derivative of $\Psi$ applied to $h$ equals $\alpha(r)h+p^2g'(r)\bar h$, with $\alpha(r)=g(r)+r g'(r)$. Its first-chaos projection in the $X$ coordinates vanishes by conditional expectation. Integrating against $\bar Y_j$ leaves the coefficient
\[
 d_j=E[\alpha(r)U_j+p^2g'(r)\overline{V_j}].
\]
Higher bath degrees give zero here. Thus the projected derivative lies in the $Y$ subspace, perpendicular to $\Pi\Psi(p)$.

By the [positive Laplace representation](../raw-content-2026-11-17-gemini-5331/PROOF.md), $g(r)=-\int e^{-sr}\nu(ds)$ with $M=g'(0)>0$. Then $0\le g'(r)\le M$ and $|\alpha'(r)|\le2M$ since $|(2-x)e^{-x}|\le2$ on $x\ge0$. For an independent copy $r'$ the identity $2\operatorname{Var}(\alpha(r))=E|\alpha(r)-\alpha(r')|^2$ gives $\operatorname{Var}(\alpha(r))\le4M^2\operatorname{Var}(r)$. Subtract $E\alpha(r)$ in the centered $U_j$ pairing. Cauchy–Schwarz in the direct sum of the two coefficient spaces and summation over $j$ now give
\[
 \|d\|^2\le M^2\big(4\operatorname{Var}(r)+E r^2\big)e_1
       =M^2(6+5\chi)u^2 e_1 .
\]
The published inequality $(3\sqrt6/4)M^2<5353/625$ gives $M^2<4.67$. As an explicit example, let $T_j=|X_j|^2$, $p=\varepsilon\sum_{j=1}^{41}X_j(T_j-2)$ and $h=Y\sum_{j=1}^{41}(T_j-1)$. The $Y$ coefficient of the derivative is $12\cdot41\,M\varepsilon^2+O(\varepsilon^4)$ for real $\varepsilon\to0$. Indeed $E[(T-1)T(T-2)^2]=4!-5\cdot3!+8\cdot2!-4\cdot1!=6$, and all cross terms vanish by independence or angular symmetry. The quadratic Taylor error for $\alpha$ follows from its finite second Laplace moment and the finite Wick moments. Scaling $h$ separately meets any of the positive energy allowances. All 41 core blocks interact with the same bath coordinate in this example.

## Paying the first variation and Taylor remainder together

Use $\beta=6/25$, $c=0.3$, $H=2.2$, $R=1.225$, and $m=4.67$. The proof of 6.3.45 bounds the projected Taylor remainder by $(11/(16a^2))e<He$ using the global Hessian estimate and the six Wick occupancy weights. That step is independent of bath degree. Its [deficit-loss estimate](../shared-bath-perturbation-codex-a7c4/PROOF.md) $D(p+h)\ge D(p)-3.346(u+e)e$ uses only $E[h\mid X]=0$. The bounds $C(p)\le cu\sqrt\chi$, $\chi\le1.5$, and $\sqrt\chi\le R$ apply to all four families. The projected-value and projected-derivative terms are perpendicular, giving
\[
 C(p+h)\le \sqrt{C(p)^2+\|d\|^2}+He .
\]
When $u\chi>0$ put $k=e/(u\chi)$, $k_1=e_1/(u\chi)$ and $k_0=1/n_0$. Then
\[
 \sqrt{C(p)^2+\|d\|^2}
 \le u\sqrt\chi\left(c+\frac{m(6+5\chi)u k_1}{2c}\right)
\]
by the tangent inequality for the square root. The loss of $D-C^2/\beta$ is therefore at most $u^2L_2+u^3L_3$, where
\[
 L_2=k\chi\left[3.346(1+1.5 k_0)+\frac{2cHR+1.5H^2 k_0}{\beta}\right],
 \qquad
 L_3=k_1\chi\,\frac{m(6+5\chi)}{\beta}
       \left(1+\frac{HR k_0}{c}\right).
\]
The $u^3$ term contains both $\|d\|^2/\beta$ and the cost of pairing the square-root bound with the Taylor remainder. These expressions use $k^2\le k_0 k$ and $kk_1\le k_0 k_1$. They are affine in $(k,k_1)$ and nonnegative. The admissible energy triangle has vertices $(0,0)$, $(k_0,0)$ and $(1/n_1,1/n_1)$. It is sufficient to check the last two vertices. The extra price is convex in $\chi$, so the endpoints of each shape interval suffice. Add $L_2,L_3$ to the quadratic and cubic coefficients of the original 6.3.44 moment envelope. The exact Bernstein test verifies both vertices over all fourteen original rectangles and all fourteen expanded rectangles (lower energy 0.00798, lower excess 0.077 for the first two families). For smaller energy or excess the fourth-moment transfer in 6.3.45 needs only $E[h\mid X]=0$ and $e/(u\chi)\le1/16000$. It gives $\chi'\le\chi+77e/u$ for the perturbed shape, placing the total cubic in the general strong-content staircase or the small-excess region. The constrained cases $u=0$ or $\chi=0$ have $e=0$.

## Exact raw A+B including critical energy

Write $\Phi(v)=B(v)-p_*v$ for the Gaussian payoff. The [signed Schur bound](../raw-joint-ab-gemini-4c4c/PROOF.md) gives
\[
 \Lambda(p+h+A+B)\le\Phi(v)-[D(p+h)-C(p+h)^2/\beta]+3241/1186575200 .
\]
Since the signed content bound gives $D(p+h)-C(p+h)^2/\beta\ge0$, for $v\notin[0.03875,0.04194]$ the [Gaussian buffer](../gemini-plan-audit-2026-11-17/NOTE.md) pays the last term, using monotonicity below 0.00551. Suppose $v$ lies in the critical interval. For the full-band case $u\ge0.03875/(1+1.5/16000)>0.03874$ and $u\le0.04194$. If $\chi\le0.077$, the perturbed excess satisfies $\chi'\le0.0784$, so the [two-score smoothing estimate](../strong-content-blocks-codex-a7c4/JOINT.md) gives $\Lambda\le\Phi(v)-(3/200)D(p+h)\le S$. Here $D(p+h)\ge0$ follows from the established strong bound. On all other shapes, restrict the expanded Bernstein rectangles to $[0.03874,0.04194]$. The smallest certified value of $D(p+h)-C(p+h)^2/\beta$ exceeds $8475839/10^{12}$, which pays the Schur fee even at $v=u_*$. For the local cases $u\ge0.03875/(1+1.5/900)>0.03868$ and all shapes already belong to the local numerical rectangles. The restricted verification gives a minimum exceeding $8589410/10^{12}$. This completes the full-band and local conclusions.

Run `python3 -IB research/conjecture-K/code/positive-bath-codex-a7c4/verify.py` at the repository root. Optimized Python is rejected by the inherited KRAW verifier because its source checks use assertions. The verifier checks the global radial majorants, both energy vertices, all 28 full/local rectangles and 18 critical restrictions, both lower edges, and four corruption controls. The unweighted allowance $e\le u\chi/16000$ for purely bath-linear perturbations already fails this particular full-cover margin test. The test measures the certificate, so it supplies no counterexample to the inequality at that allowance. The full band and critical-band tests have strictly positive margins before rounding. It uses the public radial envelopes, cubic-moment inequalities, and analytic two-shell bounds as inputs. [Exact checker](../../code/positive-bath-codex-a7c4/verify.py)

The conclusion concerns the raw peak row with its three odd sectors set to zero. General shared-bath energy and profiles outside the peak remain open. [Public input hashes](../../code/positive-bath-codex-a7c4/PUBLIC_INPUTS.sha256)
