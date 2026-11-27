# Hilbert–Schmidt / Influence OU Bounds and Coupled Signed-Circle Commutator Cutoffs on $V_3(\mathbb{R}^n)$

**Author:** `gemini-8732` · **Date:** 25–27 November 2026 · **Tasks:** [#506](https://github.com/agalatan/grothendieck-lean/issues/506), [#501](https://github.com/agalatan/grothendieck-lean/issues/501), [#458](https://github.com/agalatan/grothendieck-lean/issues/458) · **Ledger:** [`STATUS.md`](../../STATUS.md) 3.21 (e1), 3.21 (e4), 3.21 (e9)(iii)–(iv) · **Status:** **P + C, author only** (pure Python 3 standard library, `python3 -I -O`, zero floating-point operations, AST-audited)

## Summary of results

Let $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ ($n \ge 1$ arbitrary) be a nonzero real third-Wiener-chaos polynomial associated with a symmetric cubic tensor $T \in \operatorname{Sym}^3(\mathbb{R}^n)$, with $\|F\|_2 = \|T\|_{\mathrm{HS}}$, influence matrix $M_{ij} = \sum_{k,l=1}^n T_{ikl} T_{jkl} = \frac{1}{3}\mathbb{E}[\partial_i F\,\partial_j F]$ ($\operatorname{tr} M = \|T\|_{\mathrm{HS}}^2$), maximal directional influence $\lambda(T) := \|M\|_{\mathrm{op}}$, Hilbert–Schmidt trace-square $m(T) := \operatorname{tr}(M^2) = \|M\|_{\mathrm{HS}}^2$, rank-one Hermite correlation $a(F) := \max_{\|v\|_2=1} |\mathbb{E}[F\,h_3(\langle v, G\rangle)]|/\|F\|_2 = \max_{\|v\|_2=1} |T(v,v,v)|/\|T\|_{\mathrm{HS}}$, and fourth cumulant $\kappa_4(F) := \mathbb{E}[F^4]/\|F\|_2^4 - 3$.

1. **Universal Hilbert–Schmidt & influence bound from the one-step Ornstein–Uhlenbeck resolvent (Theorem 1.2, `P + C, author only`):**
   Every nonzero $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ satisfies
   $$
   \mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 + \frac{2181}{10000}\,\frac{\operatorname{tr}(M^2)}{\|T\|_{\mathrm{HS}}^4}\right) \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 + \frac{2181}{10000}\,\frac{\|M\|_{\mathrm{op}}}{\|T\|_{\mathrm{HS}}^2}\right).
   $$
   Consequently, the practical target `(T)` ($\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$) holds strictly whenever
   $$
   \frac{\operatorname{tr}(M^2)}{\|T\|_{\mathrm{HS}}^4} \le \frac{3841}{25000} = 0.15364 \quad \left(\text{in particular } \le \frac{96}{625} = 0.1536\right),
   $$
   and hence whenever $\|M\|_{\mathrm{op}}/\|T\|_{\mathrm{HS}}^2 \le \frac{3841}{25000} = 0.15364$. (Using Lemma 1.1 with `KNG505`'s $\operatorname{Var}(\tau) \le \frac{373}{200}$ gives $\operatorname{Var}(\tau) \le 14\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4$ and hence $\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4 \le \frac{373}{2800} \approx 0.13321$, whereas Theorem 1.2's dedicated Schur triple reaches $\frac{3841}{25000} = 0.15364$; [`sources/third-chaos-dimfree-gemini-c1de/PROOF.md`](../third-chaos-dimfree-gemini-c1de/PROOF.md) §4 certifies $\lambda \le \frac{16}{2500} = 0.0064$ via quartic-Huber regression.)
2. **Unconditional `(T)` for all isotropic / irreducibly symmetric third-chaos cubics in every dimension (Corollary 1.3, `P + C, author only`):**
   Whenever $M = \frac{\|T\|_{\mathrm{HS}}^2}{n} I_n$ — in particular, by Schur's lemma, whenever $F$ is invariant up to sign under a subgroup $G \le O(n)$ acting **irreducibly** on $\mathbb{R}^n$ (for example, for $n \ge 2$, the nonzero regular-simplex harmonic cubic $\sum_{j=1}^{n+1} y_j^3$ on the zero-sum hyperplane $\{y \in \mathbb{R}^{n+1} : \sum_{j=1}^{n+1} y_j = 0\} \cong \mathbb{R}^n$ under the standard irreducible representation of $S_{n+1}$; note by contrast that coordinate permutations on $\mathbb{R}^n$ fix the line $\mathbb{R}(1,\dots,1)$ and are reducible, e.g. $T = v^{\otimes 3}$ at $v = (1,\dots,1)/\sqrt{n}$ has $M = v v^\top$ and $\operatorname{tr}(M^2) = 1$) — `(T)` holds in **every** dimension $n \ge 1$: for $n \ge 7$, $\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4 = \frac{1}{n} \le \frac{1}{7} < \frac{96}{625} < \frac{3841}{25000}$, overlapping [`STATUS.md`](../../STATUS.md) 3.21 (e3) ($1 \le n \le 15$) across $7 \le n \le 15$.
3. **Coupled signed-circle & full Frobenius-commutator 4D tensor cutoffs (Theorem 2.1, `P + C, author only`, pure stdlib):**
   Normalize $\|T\|_{\mathrm{HS}} = 1$. Coupling the full $(n-1)\times(n-1)$ commutator submatrix $([A_p, A_1])_{1q} = (s^2 e_2 e_2^\top + B^2 - x B - s C)_{pq}$ ($p, q \ge 2$), $M_{12} = 0$, $M_{22} \le \lambda$, symmetrized eigenvalue caps on $B$, and Weyl–Karamata bounds on $\operatorname{tr}(M^2)$ with the **signed** rational 2-plane circle norm inequalities $(m^2 x + 2mk s + k^2 b)^2 + (m^2 s + 2mk b + k^2 d)^2 \le (m^2 + k^2)^2 a_0^2$ and analytic interval tightening on $d = T_{222}$ certifies in zero-float stdlib integer arithmetic:
   - **Sharp Gaussian regime:** if $a(T) \le \frac{349}{500} = 0.698$, then **$\lambda(T) < \frac{27}{40} = 0.675$** and **$\kappa_4(F) < 48$**. Hence $\mathbb{E}|F| \le \sqrt{2/\pi}\,\|F\|_2$ holds whenever $\lambda(T) \ge \frac{27}{40} = 0.675$ or $\kappa_4(F) \ge 48$. (An explicit rational planar witness $\widetilde{T}_1$ at $(x, s, b, d) = (\frac{37}{125}, \frac{53}{100}, -\frac{3}{20}, -\frac{4}{125})$ verified by Sturm sequence has $a(\widetilde{T}_1) < 0.698$ and $\lambda(\widetilde{T}_1) = 0.672717\dots > \frac{672}{1000}$, within $0.0023$ of $\frac{27}{40}$.)
   - **Practical target `(T)` regime:** if $a(T) \le \frac{321}{500} = 0.642$, then **$\lambda(T) < \frac{33}{50} = 0.66$** and **$\kappa_4(F) < \frac{229}{5} = 45.8$**. Hence `(T)` holds whenever $\lambda(T) \ge \frac{33}{50} = 0.66$ or $\kappa_4(F) \ge \frac{229}{5} = 45.8$.

Together with [`STATUS.md`](../../STATUS.md) 3.21 (e1)–(e6) and [`sources/near-gaussian-505-2026-11-21-gemini-2762/PROOF.md`](../near-gaussian-505-2026-11-21-gemini-2762/PROOF.md) (`KNG505`), any unit-variance counterexample outside (e1)–(e6) is confined (`open`) to:
- **For `(T)` ($\mathbb{E}|F| \le \sqrt{17/25}\,\|F\|_2$):** $\operatorname{rank}(M) \ge 16$, $a(F) < \frac{321}{500} = 0.642$, $\frac{3841}{25000} = 0.15364 < \operatorname{tr}(M^2) \le \lambda(T) < \frac{33}{50} = 0.66$, $\operatorname{Var}(\|\nabla F\|^2/3) > \frac{373}{200} = 1.865$, and $\frac{19}{2} = 9.5 < \kappa_4(F) < \frac{229}{5} = 45.8$.
- **For the sharp Gaussian bound ($\mathbb{E}|F| \le \sqrt{2/\pi}\,\|F\|_2$):** $\operatorname{rank}(M) \ge 12$, $a(F) < \frac{349}{500} = 0.698$, $\lambda(T) < \frac{27}{40} = 0.675$, and $\frac{1}{12250} < \kappa_4(F) < 48$.

---

## 1. Hilbert–Schmidt and influence bounds from the one-step OU resolvent

Normalize $\|F\|_2 = \|T\|_{\mathrm{HS}} = 1$, so $\operatorname{tr} M = 1$. Recall from [`sources/third-chaos-dual-slice-codex-6d92/PROOF.md`](../third-chaos-dual-slice-codex-6d92/PROOF.md) §4 and [`sources/near-gaussian-505-2026-11-21-gemini-2762/PROOF.md`](../near-gaussian-505-2026-11-21-gemini-2762/PROOF.md) §§2, 4 (`KNG505`, independently reviewed in [#551](https://github.com/agalatan/grothendieck-lean/pull/551#issuecomment-7055075448)) that
$$
U := \|\nabla F\|^2 - 3 = 6\,I_2(M) + \frac{3}{2}\,I_4(\widetilde{U}) = U_2 + U_4 \in V_2 \oplus V_4,
$$
where $U_{abcd} := \sum_{r=1}^n T_{rab} T_{rcd}$ and $\widetilde{U} = \operatorname{Sym}(U)$ is the full symmetrization of $U$ over $(a,b,c,d)$, with
$$
A^2 := \|U_2\|_2^2 = 36 \cdot 2! \,\|M\|_{\mathrm{HS}}^2 = 72\,m, \qquad C^2 := \|U_4\|_2^2 = \frac{9}{4} \cdot 4! \,\|\widetilde{U}\|_{\mathrm{HS}}^2 = 54\,u, \qquad \kappa_4(F) = \frac{1}{2}A^2 + C^2 = 36\,m + 54\,u,
$$
for $m := \operatorname{tr}(M^2) = \|M\|_{\mathrm{HS}}^2$ and $u := \|\widetilde{U}\|_{\mathrm{HS}}^2$.

**Lemma 1.1 (Contraction domination).** *For every symmetric cubic tensor $T \in \operatorname{Sym}^3(\mathbb{R}^n)$ with $\|T\|_{\mathrm{HS}} = 1$,*
$$
0 \le u \le m \le \lambda(T).
$$

*Proof.* Since $\operatorname{Sym}$ is an orthogonal projection on $(\mathbb{R}^n)^{\otimes 4}$ with respect to the Hilbert–Schmidt inner product, $0 \le u = \|\operatorname{Sym}(U)\|_{\mathrm{HS}}^2 \le \|U\|_{\mathrm{HS}}^2$. Expanding $\|U\|_{\mathrm{HS}}^2$ directly gives
$$
\|U\|_{\mathrm{HS}}^2 = \sum_{a,b,c,d=1}^n \left(\sum_{r=1}^n T_{rab} T_{rcd}\right)^2 = \sum_{r,s=1}^n \left(\sum_{a,b=1}^n T_{rab} T_{sab}\right)\left(\sum_{c,d=1}^n T_{rcd} T_{scd}\right) = \sum_{r,s=1}^n M_{rs}^2 = \operatorname{tr}(M^2) = m,
$$
using symmetry of $T$ in $\sum_{a,b} T_{rab} T_{sab} = M_{rs}$. Finally, $M \succeq 0$ with eigenvalues $\mu_1, \dots, \mu_n \in [0, \lambda(T)]$ summing to $\operatorname{tr} M = 1$ gives $m = \sum_{i=1}^n \mu_i^2 \le \lambda(T)\sum_{i=1}^n \mu_i = \lambda(T)$. $\square$

**Theorem 1.2 (Universal Hilbert–Schmidt and influence bound).** *With $c := \sqrt{2/\pi}$, every unit-variance $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ satisfies*
$$
\frac{\mathbb{E}|F|}{c} - 1 \le \frac{2181}{10000}\,m \le \frac{2181}{10000}\,\lambda(T).
$$
*Consequently, by homogeneity, every nonzero $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ satisfies*
$$
\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 + \frac{2181}{10000}\,\frac{\operatorname{tr}(M^2)}{\|T\|_{\mathrm{HS}}^4}\right) \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 + \frac{2181}{10000}\,\frac{\|M\|_{\mathrm{op}}}{\|T\|_{\mathrm{HS}}^2}\right),
$$
*and $\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$ holds whenever $\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4 \le \frac{3841}{25000} = 0.15364$ (in particular whenever $\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4 \le \frac{96}{625} = 0.1536$, or $\|M\|_{\mathrm{op}}/\|T\|_{\mathrm{HS}}^2 \le \frac{3841}{25000} = 0.15364$).*

*Proof.* By Lemma 4.1 of [`sources/near-gaussian-505-2026-11-21-gemini-2762/PROOF.md`](../near-gaussian-505-2026-11-21-gemini-2762/PROOF.md) (`KNG505`), for any constants $(\hat{\alpha}, \hat{\beta}, \hat{\gamma}) \in \mathbb{R}^3$ satisfying the $2\times 2$ Schur-complement conditions across all $x \ge 0$,
$$
d_1(x) := \hat{\alpha} + \frac{\hat{g}_2(x)}{9} > 0, \qquad d_2(x) := \hat{\beta} + \frac{\hat{g}_4(x)}{9} > 0, \qquad d_1(x)\,d_2(x) \ge \left(\frac{\hat{g}_2(x) + \hat{g}_4(x)}{18} - \hat{\gamma}\right)^2,
$$
integration of the one-step Ornstein–Uhlenbeck resolvent identity $\frac{\mathbb{E}|F|}{c} - 1 = -\frac{\kappa_4(F)}{24} - \frac{1}{9}\mathbb{E}[\hat{g}_2(F)U U_2 + \hat{g}_4(F)U U_4]$ against $\mathbb{E}[2\hat{\gamma} U_2 U_4] = 0$ ($U_2 \perp U_4$) gives
$$
\frac{\mathbb{E}|F|}{c} - 1 \le -\frac{36 m + 54 u}{24} + 72\hat{\alpha}\,m + 54\hat{\beta}\,u = \left(72\hat{\alpha} - \frac{3}{2}\right)m + \left(54\hat{\beta} - \frac{9}{4}\right)u.
$$
As $x \to \infty$, $\hat{g}_4(x) \to -\frac{3}{8}$, so $d_2(\infty) = \hat{\beta} - \frac{1}{24} > 0$, whence $54\hat{\beta} - \frac{9}{4} > 0$. By Lemma 1.1 ($0 \le u \le m \le \lambda(T)$), whenever $72\hat{\alpha} + 54\hat{\beta} - \frac{15}{4} > 0$,
$$
\left(72\hat{\alpha} - \frac{3}{2}\right)m + \left(54\hat{\beta} - \frac{9}{4}\right)u \le \left(72\hat{\alpha} + 54\hat{\beta} - \frac{15}{4}\right)m \le \left(72\hat{\alpha} + 54\hat{\beta} - \frac{15}{4}\right)\lambda(T).
$$
Take the rational triple
$$
(\hat{\alpha}_3, \hat{\beta}_3, \hat{\gamma}_3) := \left(\frac{583}{25000},\; \frac{4239}{100000},\; -\frac{1497}{50000}\right).
$$
Using the exact outward rational quadrature and monotone kernel decomposition of `KNG505` ($N_Q = 2400$ plus $30$ dyadic near-zero subdivisions, covering $[0, \infty)$ including the infinite ray $[10^5, \infty)$ at `max_depth = 12`), `verify_ou_influence.py` certifies $d_1(x) \ge 0.0008048 > 0$, $d_2(x) \ge 0.0007233 > 0$, and $d_1(x)d_2(x) - \big(\frac{\hat{g}_2(x)+\hat{g}_4(x)}{18} - \hat{\gamma}_3\big)^2 \ge 2.1 \times 10^{-9} > 0$ across all $336$ leaves of $[0, \infty)$. Direct rational arithmetic gives
$$
72\hat{\alpha}_3 - \frac{3}{2} = \frac{1119}{6250} > 0, \qquad 54\hat{\beta}_3 - \frac{9}{4} = \frac{1953}{50000} > 0, \qquad \hat{M}_3 := \frac{1119}{6250} + \frac{1953}{50000} = \frac{2181}{10000} = 0.2181.
$$
Finally, with Machin's rational lower bound $\pi > \pi_{\mathrm{lo}} > \frac{31415926535}{10^{10}}$, at $m = \frac{3841}{25000} = 0.15364$ (and hence also at $m = \frac{96}{625} = 0.1536$) we have
$$
\left(1 + \frac{2181}{10000} \cdot \frac{3841}{25000}\right)^2 = \left(\frac{258377221}{250000000}\right)^2 = 1.0681406133\dots < 1.0681415022\dots < \frac{17}{50}\,\pi_{\mathrm{lo}} < \frac{17/25}{2/\pi},
$$
proving $\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$. $\square$

**Corollary 1.3 (Isotropic and irreducibly symmetric third-chaos cubics).** *Let $n \ge 1$ and $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ satisfy $\mathbb{E}[\nabla F(\nabla F)^\top] = \frac{3}{n}\|F\|_2^2 I_n$ (equivalently $M = \frac{\|T\|_{\mathrm{HS}}^2}{n} I_n$). In particular, this holds by Schur's lemma whenever $F(g x) = \chi(g) F(x)$ ($\chi(g) \in \{\pm 1\}$) for every $g$ in a subgroup $G \le O(n)$ acting irreducibly on $\mathbb{R}^n$ (for example, for $n \ge 2$, the nonzero regular-simplex cubic $\sum_{j=1}^{n+1} y_j^3$ on $\{y \in \mathbb{R}^{n+1} : \sum_{j=1}^{n+1} y_j = 0\} \cong \mathbb{R}^n$ under $S_{n+1}$). Then $\mathbb{E}|F| \le \sqrt{17/25}\,\|F\|_2$ (strictly if $F \ne 0$).*

*Proof.* If $g \in O(n)$ satisfies $F(g x) = \pm F(x)$, the chain rule $\nabla F(x) = \pm g^\top \nabla F(g x)$ and $O(n)$-invariance of the standard Gaussian law give $M = \frac{1}{3}\mathbb{E}[\nabla F(\nabla F)^\top] = g^\top M g$, so every eigenspace of the symmetric matrix $M$ is $G$-invariant; irreducibility of $G$ on $\mathbb{R}^n$ forces $M = \frac{\operatorname{tr} M}{n} I_n = \frac{\|T\|_{\mathrm{HS}}^2}{n} I_n$. Assume $F \ne 0$ and normalize $\|T\|_{\mathrm{HS}} = 1$. If $1 \le n \le 15$, `(T)` holds on all of $V_3(\mathbb{R}^n)$ by [`STATUS.md`](../../STATUS.md) 3.21 (e3). If $n \ge 7$, $\operatorname{tr}(M^2) = \frac{1}{n} \le \frac{1}{7} < \frac{96}{625} < \frac{3841}{25000}$, so Theorem 1.2 gives $\mathbb{E}|F| < \sqrt{17/25}$. (The two ranges overlap across $7 \le n \le 15$.) $\square$

---

## 2. Coupled signed-circle & Frobenius-commutator 4D tensor cutoffs

Let $T \in \operatorname{Sym}^3(\mathbb{R}^n)$ ($n \ge 2$; for $n = 1$, $a(T) = 1$) satisfy $\|T\|_{\mathrm{HS}} = 1$ and $a(T) \le a_0 < 1$. Choose an orthonormal basis $(e_1, e_2, \dots, e_n)$ of $\mathbb{R}^n$ as in [`sources/third-chaos-dimfree-gemini-c1de/PROOF.md`](../third-chaos-dimfree-gemini-c1de/PROOF.md) §2 and [`sources/third-chaos-far-gaussian-gemini-9a4e/PROOF.md`](../third-chaos-far-gaussian-gemini-9a4e/PROOF.md) §§2–3:
- $e_1$ is a top unit eigenvector of $M$ ($M e_1 = \lambda e_1$, so $M_{11} = \lambda$ and $M_{1j} = 0$ for $j \ge 2$);
- $e_2 \perp e_1$ aligns with the component of $T(e_1, e_1, \cdot)$ in $e_1^\perp$, so $s := T_{112} \ge 0$ and $T_{11k} = 0$ for all $k \ge 3$;
- replacing $(T, e_2)$ by $(-T, -e_2)$ if needed preserves $s \ge 0$ and enforces $x := T_{111} \ge 0$.

Put $B := T(e_1, \cdot, \cdot)|_{e_1^\perp}$ ($b := B_{22} = T_{122}$, $P := \|B\|_{\mathrm{HS}}^2 = p_+ + p_-$ where $p_+, p_-$ sum the squared positive and negative eigenvalues of $B$, $u := \sum_{k=3}^n B_{2k}^2 \ge 0$, $w_B := P - b^2 \ge 2u$), $C := T(e_2, \cdot, \cdot)|_{e_1^\perp}$ ($d := C_{22} = T_{222}$), and $T_\perp := T|_{e_1^\perp}$ ($\|T_\perp\|_{\mathrm{HS}}^2 = 1 - x^2 - 3s^2 - 3P \ge d^2$). Let $(A_r)_{ij} := T_{rij}$ ($1 \le r \le n$) be the symmetric matrix slices of $T$.

### Coupling signed 2-plane circle norms with the full commutator block

1. **Signed 2-plane circle norms (`#520` vs `#519`):** In [`code/third-chaos-dimfree-gemini-c1de/certify_tensor.py`](../../code/third-chaos-dimfree-gemini-c1de/certify_tensor.py) (line 201), $\|T(w,w,\cdot)\|_2^2 \le a_0^2$ on $\operatorname{span}(e_1, e_2)$ was averaged over $\pm\sin\theta$, discarding the constructive signed $2 m k$ cross terms in
   $$
   (m^2 x + 2 m k s + k^2 b)^2 + (m^2 s + 2 m k b + k^2 d)^2 \le (m^2 + k^2)^2 a_0^2 \qquad \big((m, k) \in \mathbb{Z}^2 \setminus \{(0,0)\}\big).
   $$
2. **Unit-HS constraint and full commutator block (`#519` vs `#520`):** In [`sources/third-chaos-far-gaussian-gemini-9a4e/PROOF.md`](../third-chaos-far-gaussian-gemini-9a4e/PROOF.md) §§2–3, Theorem 2.1 rescaled $\widetilde{T} = T|_{\operatorname{span}(e_1, e_2)}$ by $1/a(\widetilde{T})$, dropping $\|\widetilde{T}\|_{\mathrm{HS}}^2 \le \|T\|_{\mathrm{HS}}^2 = 1$ (which strictly binds whenever $a_0 > a(T_*) = (2 + \sqrt{2}/2)^{-1/2} \approx 0.6078$), and §3 kept only $([A_2, A_1])_{12}$ and $\lambda^2 + (1-\lambda)^2$. Retaining all $p, q \in \{2, \dots, n\}$,
   $$
   ([A_p, A_1])_{1q} = \sum_{k=1}^n T_{p1k} T_{1kq} - \sum_{k=1}^n T_{11k} T_{pkq} = \big(s^2 e_2 e_2^\top + B^2 - x B - s C\big)_{pq} =: D_{pq}.
   $$
   By skew-symmetry of $[A_p, A_1]$ and disjointness of $\{(p, 1), (1, p) : p \ge 2\}$ in $\sum_{r,s=1}^n \|[A_r, A_s]\|_F^2$,
   $$
   90\operatorname{tr}(M^2) - \kappa_4(F) = 18\sum_{r,s=1}^n \|[A_r, A_s]\|_F^2 \ge 18 \cdot 4\sum_{p,q=2}^n D_{pq}^2 = 72\,\|D\|_F^2.
   $$

### Stepwise inequalities of the 4D cover

In addition to the slot identities $1 = x^2 + 3s^2 + 3P + \|T_\perp\|_{\mathrm{HS}}^2$ and $\lambda = x^2 + 2s^2 + P$ (hence $3\lambda - 1 = 2x^2 + 3s^2 - \|T_\perp\|_{\mathrm{HS}}^2 \le 2x^2 + 3s^2 - d^2$), every box $X \times S_v \times B_v \times P_v \subset [0, a_0]^2 \times [-a_0, a_0] \times [0, \frac{1}{3}]$ uses the following exact inequalities:

1. **Symmetrized directional eigenvalue caps on $B$:** For any unit $w \in e_1^\perp$ and $c \in (0, 1)$, $\frac{1}{2}\big(T((ce_1 + \sqrt{1-c^2}w)^{\otimes 3}) + T((ce_1 - \sqrt{1-c^2}w)^{\otimes 3})\big) = c^3 x + 3c(1-c^2)\langle w, Bw\rangle \in [-a_0, a_0]$, so every eigenvalue $\beta_i$ of $B$ satisfies $-m_-(x) \le \beta_i \le m_+(x)$ where $m_\pm(x) := \inf_{c\in(0,1)} \frac{a_0/c \mp x c^2}{3(1-c^2)}$. In particular $-m_-(x) \le b \le m_+(x)$ and $\|B\|_{\mathrm{op}}^2 \le \max\big(\min(p_+, m_+(x)^2),\, \min(p_-, m_-(x)^2)\big)$.
2. **Diagonal cap $M_{22} \le \lambda$ on $2u + d^2$:** Expanding $M_{22} = \sum_{k,l=1}^n T_{2kl}^2 = s^2 + 2b^2 + 2u + \sum_{k,l\ge 3\text{ or }k=l=2} T_{2kl}^2 \ge s^2 + 2b^2 + 2u + d^2$ and comparing with $\lambda = x^2 + 2s^2 + P$ yields
   $$
   2u + d^2 \le x^2 + s^2 + P - 2b^2, \qquad \text{hence} \qquad 0 \le u \le \min\!\left(\frac{P - b^2}{2},\; \frac{x^2 + s^2 + P - 2b^2 - d^2}{2}\right).
   $$
3. **Off-diagonal $M_{12} = 0$ Cauchy–Schwarz and $\|C\|_F$ bound:** Since $T_{11k} = 0$ ($k \ge 3$), $0 = M_{12} = s(x + 2b) + bd + 2\sum_{k\ge 3} T_{12k}T_{22k} + \sum_{k,l\ge 3} T_{1kl}T_{2kl}$, while $w_B = P - b^2 = 2\sum_{k\ge 3} T_{12k}^2 + \sum_{k,l\ge 3} T_{1kl}^2$ and $\|T_\perp\|_{\mathrm{HS}}^2 - d^2 \ge 3\sum_{k\ge 3} T_{22k}^2 + 3\sum_{k,l\ge 3} T_{2kl}^2$. By Cauchy–Schwarz, $\big(s(x+2b) + bd\big)^2 \le \frac{2}{3} w_B(\|T_\perp\|_{\mathrm{HS}}^2 - d^2)$, and $\|C\|_F^2 = d^2 + 2\sum_{k\ge 3} T_{22k}^2 + \sum_{k,l\ge 3} T_{2kl}^2 \le \frac{1}{3}d^2 + \frac{2}{3}\|T_\perp\|_{\mathrm{HS}}^2$.
4. **Analytic $d$-tightening:** Before slicing $d$, `verify_tensor_combined.py` intersects $d^2 \le \min(a_0^2 - b^2, \|T_\perp\|_{\mathrm{HS}}^2, x^2 + s^2 + P - 2b^2)$ with (i) $|m^2 s + 2mk b + k^2 d| \le \sqrt{(m^2+k^2)^2 a_0^2 - (m^2 x + 2mk s + k^2 b)^2_{\mathrm{lo}}}$ across every rational direction $(m, k)$ with $k \ne 0$, and (ii) $|bd + s(x+2b)| \le \sqrt{\frac{2}{3} w_{B,\mathrm{hi}} \|T_\perp\|_{\mathrm{HS},\mathrm{hi}}^2}$ whenever $0 \notin B_v$.
5. **Residual spectrum cap $L_{\max}$ and Weyl–Karamata $\operatorname{tr}(M^2)$:** For every unit $w \in e_1^\perp$, $\langle w, Mw\rangle = \sum_{k,l=1}^n T(w, e_k, e_l)^2 = T(w, e_1, e_1)^2 + 2\|Bw\|_2^2 + \|T_\perp(w, \cdot, \cdot)\|_{\mathrm{HS}}^2 \le s^2 + 2\|B\|_{\mathrm{op}}^2 + \|T_\perp\|_{\mathrm{HS}}^2$ (using $T(w, e_1, e_1) = s\langle w, e_2\rangle \le s$). By the Courant–Fischer min-max theorem on $e_1^\perp$ (where $M$ preserves $e_1^\perp$ because $M e_1 = \lambda e_1$), every remaining eigenvalue ($j \ge 2$) satisfies $\lambda_j(M) \le L_{\max} := \min\big(\lambda,\, s^2 + 2\|B\|_{\mathrm{op}}^2 + \|T_\perp\|_{\mathrm{HS}}^2\big)$. By convexity of $t \mapsto t^2$ and Karamata's inequality on $\sum_{j\ge 2}\lambda_j = 1 - \lambda$ with $0 \le \lambda_j \le L_{\max}$, $\operatorname{tr}(M^2) \le \lambda^2 + q L_{\max}^2 + (1 - \lambda - q L_{\max})^2$ where $q = \lfloor (1-\lambda)/L_{\max}\rfloor$.
6. **Lower bound on $\|D\|_F$:** On the one hand $\|D\|_F \ge |D_{22}| = |s^2 + b^2 + u - xb - sd|$. On the other hand, expanding $\|s^2 e_2 e_2^\top + B^2 - x B\|_F^2 = \|B^2 - x B\|_F^2 + 2s^2\langle e_2, (B^2 - x B)e_2\rangle + s^4$ in an orthonormal eigenbasis $(\beta_i)$ of $B$ (where $(B^2)_{22} = b^2 + u$, $(\beta_i - x)^2 \ge x^2$ for $\beta_i \le 0$, and $(\beta_i - x)^2 \ge (x - m_+(x))_+^2$ for $0 < \beta_i \le m_+(x)$) gives
   $$
   \|s^2 e_2 e_2^\top + B^2 - x B\|_F^2 = \sum_i \beta_i^2(\beta_i - x)^2 + 2s^2(b^2 + u - x b) + s^4 \ge p_- x^2 + p_+(x - m_+(x))_+^2 + 2s^2(b^2 + u - x b) + s^4,
   $$
   and the triangle inequality gives $\|D\|_F \ge \big(\|s^2 e_2 e_2^\top + B^2 - x B\|_F - s\|C\|_F\big)_+$.

**Theorem 2.1.** *For every $n \ge 1$ and every symmetric cubic tensor $T \in \operatorname{Sym}^3(\mathbb{R}^n)$ with $\|T\|_{\mathrm{HS}} = 1$ and $F = I_3(T)/\sqrt{6}$:*
1. *If $a(T) \le \frac{349}{500} = 0.698$, then $\lambda(T) < \frac{27}{40} = 0.675$ and $\kappa_4(F) < 48$ ($32{,}515$ accepted leaves, $15{,}054$ pruned).*
2. *If $a(T) \le \frac{321}{500} = 0.642$, then $\lambda(T) < \frac{33}{50} = 0.66$ and $\kappa_4(F) < \frac{229}{5} = 45.8$ ($14{,}955$ accepted leaves, $4{,}376$ pruned).*

*Remark 2.2 (Explicit Sturm-verified rational planar witnesses and full-depth negative controls).* For any binary cubic $\widetilde{T} = x e_1^{\otimes 3} + 3s e_1\odot e_1\odot e_2 + 3b e_1\odot e_2\odot e_2 + d e_2^{\otimes 3}$ on $\mathbb{R}^2$ with $(x,s,b,d) \in \mathbb{Q}^4$, setting $t = \tan\theta \in \mathbb{R}$ reduces $\|\widetilde{T}(w,w,\cdot)\|_2 / \|\widetilde{T}\|_{\mathrm{HS}} < a_0$ on $S^1$ to positivity of the quartic polynomial $P_4(t) = a_0^2\|\widetilde{T}\|_{\mathrm{HS}}^2(1+t^2)^2 - (x + 2st + bt^2)^2 - (s + 2bt + dt^2)^2 \in \mathbb{Q}[t]$ (plus $b^2 + d^2 < a_0^2\|\widetilde{T}\|_{\mathrm{HS}}^2$ at $\cos\theta = 0$). Using exact Sturm sequences on $\mathbb{R}$, `verify_tensor_combined.py` verifies four explicit rational planar witnesses showing mathematically that the tested false bounds fail on $\operatorname{Sym}^3(\mathbb{R}^2)$, and confirms that `certify_4d_combined` rejects those false claims at the **full production depth `max_depth = 46`** (by exhausting the recursion budget on uncertified boxes, which tests rejection of false claims rather than tightness of the cover):
- $(x, s, b, d) = (\frac{37}{125}, \frac{53}{100}, -\frac{3}{20}, -\frac{4}{125})$: $a(\widetilde{T}) < \frac{349}{500} = 0.698$ and $\lambda(\widetilde{T}) = 0.672717\dots > \frac{672}{1000}$ (within $0.0023$ of $\frac{27}{40} = 0.675$);
- $(x, s, b, d) = (0, \frac{57}{100}, 0, -\frac{3}{20})$: $a(\widetilde{T}) < \frac{321}{500} = 0.642$ and $\lambda(\widetilde{T}) = 0.651625\dots > \frac{13}{20} = 0.650$;
- $(x, s, b, d) = (1, \frac{1}{2}, -\frac{1}{2}, \frac{3}{5})$: $a(\widetilde{T}) < \frac{349}{500} = 0.698$ and $\kappa_4(\widetilde{T}) = 44.9207\dots > 44$;
- $(x, s, b, d) = (1, \frac{1}{20}, -\frac{3}{5}, -\frac{3}{5})$: $a(\widetilde{T}) < \frac{321}{500} = 0.642$ and $\kappa_4(\widetilde{T}) = 37.4405\dots > 37$.

---

## Replay

Both verifiers use **only the Python 3 standard library** (`ast`, `fractions`, `itertools`, `math`, `pathlib`, `sys`, `time`), contain **zero floating-point literals or calls** (enforced at runtime by AST inspection), use `-O`-safe `require(...)` checks throughout, and run all negative controls at the full production recursion depths (`max_depth = 12` and `max_depth = 46`). Run from the repository root:

```sh
cert_dir=research/conjecture-K/code/third-chaos-506-gemini-8732
python3 -I -O "$cert_dir/verify_ou_influence.py"
python3 -I -O "$cert_dir/verify_tensor_combined.py"
```
