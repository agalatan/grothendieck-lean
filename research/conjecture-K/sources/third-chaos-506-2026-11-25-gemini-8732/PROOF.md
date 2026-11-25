# Hilbert–Schmidt / Influence OU Bounds and Coupled Signed-Circle Commutator Cutoffs on $V_3(\mathbb{R}^n)$

**Author:** `gemini-8732` · **Date:** 25 November 2026 · **Tasks:** [#506](https://github.com/agalatan/grothendieck-lean/issues/506), [#501](https://github.com/agalatan/grothendieck-lean/issues/501), [#458](https://github.com/agalatan/grothendieck-lean/issues/458) · **Ledger:** [`STATUS.md`](../../STATUS.md) 3.21 (e1), 3.21 (e4), 3.21 (e9)(iii)–(iv) · **Status:** **P + C, author only** (pure Python 3 standard library, `python3 -I -O`, zero floating-point operations, AST-audited)

## Summary of results

Let $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ ($n \ge 1$ arbitrary) be a nonzero real third-Wiener-chaos polynomial associated with a symmetric cubic tensor $T \in \operatorname{Sym}^3(\mathbb{R}^n)$, with $\|F\|_2 = \|T\|_{\mathrm{HS}}$, influence matrix $M_{ij} = \sum_{k,l=1}^n T_{ikl} T_{jkl} = \frac{1}{3}\mathbb{E}[\partial_i F\,\partial_j F]$ ($\operatorname{tr} M = \|T\|_{\mathrm{HS}}^2$), maximal directional influence $\lambda(T) := \|M\|_{\mathrm{op}}$, Hilbert–Schmidt trace-square $m(T) := \operatorname{tr}(M^2) = \|M\|_{\mathrm{HS}}^2$, rank-one Hermite correlation $a(F) := \max_{\|v\|_2=1} |\mathbb{E}[F\,h_3(\langle v, G\rangle)]|/\|F\|_2 = \max_{\|v\|_2=1} |T(v,v,v)|/\|T\|_{\mathrm{HS}}$, and fourth cumulant $\kappa_4(F) := \mathbb{E}[F^4]/\|F\|_2^4 - 3$.

1. **Universal Hilbert–Schmidt & influence bound from the one-step Ornstein–Uhlenbeck resolvent (Theorem 1.2, `P + C, author only`; exact $24\times$ jump on low influence):**
   Every nonzero $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ satisfies
   $$
   \mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 + \frac{2181}{10000}\,\frac{\operatorname{tr}(M^2)}{\|T\|_{\mathrm{HS}}^4}\right) \le \sqrt{\frac{2}{\pi}}\,\|F\|_2\left(1 + \frac{2181}{10000}\,\frac{\|M\|_{\mathrm{op}}}{\|T\|_{\mathrm{HS}}^2}\right).
   $$
   Consequently, the practical target `(T)` ($\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$) holds strictly whenever
   $$
   \frac{\operatorname{tr}(M^2)}{\|T\|_{\mathrm{HS}}^4} \le \frac{96}{625} = 0.1536, \qquad \text{and in particular whenever} \qquad \frac{\|M\|_{\mathrm{op}}}{\|T\|_{\mathrm{HS}}^2} \le \frac{96}{625} = 0.1536,
   $$
   improving the previous low-influence threshold $\lambda \le \frac{16}{2500} = 0.0064$ ([`sources/third-chaos-dimfree-gemini-c1de/PROOF.md`](../third-chaos-dimfree-gemini-c1de/PROOF.md) §4) by an **exact factor of $24$**.
2. **Unconditional `(T)` for all isotropic / irreducibly symmetric third-chaos cubics in every dimension (Corollary 1.3, `P + C, author only`):**
   Whenever $M = \frac{\|T\|_{\mathrm{HS}}^2}{n} I_n$ — in particular, by Schur's lemma, whenever $F$ is invariant up to sign under a subgroup $G \le O(n)$ acting irreducibly on $\mathbb{R}^n$ (such as any coordinate-transitive or vertex-transitive cubic) — `(T)` holds in **every** dimension $n \ge 1$: for $n \ge 7$, $\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4 = \frac{1}{n} \le \frac{1}{7} < \frac{96}{625}$, overlapping [`STATUS.md`](../../STATUS.md) 3.21 (e3) ($1 \le n \le 15$) across $7 \le n \le 15$.
3. **Coupled signed-circle & full Frobenius-commutator 4D tensor cutoffs (Theorem 2.1, `P + C, author only`, pure stdlib):**
   Normalize $\|T\|_{\mathrm{HS}} = 1$. Coupling the full $(n-1)\times(n-1)$ commutator submatrix $([A_p, A_1])_{1q} = (s^2 e_2 e_2^\top + B^2 - x B - s C)_{pq}$ ($p, q \ge 2$), $M_{12} = 0$, symmetrized eigenvalue caps on $B$, and Weyl–Karamata bounds on $\operatorname{tr}(M^2)$ with the **signed** rational 2-plane circle norm inequalities $(m^2 x + 2mk s + k^2 b)^2 + (m^2 s + 2mk b + k^2 d)^2 \le (m^2 + k^2)^2 a_0^2$ and analytic interval tightening on $d = T_{222}$ certifies in zero-float stdlib integer arithmetic:
   - **Sharp Gaussian regime:** if $a(T) \le \frac{349}{500} = 0.698$, then **$\lambda(T) < \frac{27}{40} = 0.675$** (down from $\frac{173}{250} = 0.692$) and **$\kappa_4(F) < 48$** (down from $49$). Hence $\mathbb{E}|F| \le \sqrt{2/\pi}\,\|F\|_2$ holds whenever $\lambda(T) \ge \frac{27}{40} = 0.675$ or $\kappa_4(F) \ge 48$. (Note sharpness proximity: $T_0 = \sqrt{3}\,e_1\odot e_1\odot e_2$ has $\|T_0\|_{\mathrm{HS}} = 1$ and $a(T_0) = \lambda(T_0) = \frac{2}{3} = 0.66\overline{6} < 0.698$, within $0.008\overline{3}$ of $\frac{27}{40}$.)
   - **Practical target `(T)` regime:** if $a(T) \le \frac{321}{500} = 0.642$, then **$\lambda(T) < \frac{33}{50} = 0.66$** (down from $\frac{33251}{50000} = 0.66502$) and **$\kappa_4(F) < \frac{229}{5} = 45.8$** (down from $\frac{233}{5} = 46.6$). Hence `(T)` holds whenever $\lambda(T) \ge \frac{33}{50} = 0.66$ or $\kappa_4(F) \ge \frac{229}{5} = 45.8$.

Together with [`STATUS.md`](../../STATUS.md) 3.21 (e1)–(e6) and [`sources/near-gaussian-505-2026-11-21-gemini-2762/PROOF.md`](../near-gaussian-505-2026-11-21-gemini-2762/PROOF.md) (`KNG505`), any unit-variance counterexample outside (e1)–(e6) is confined to:
- **For `(T)` ($\mathbb{E}|F| \le \sqrt{17/25}\,\|F\|_2$):** $\operatorname{rank}(M) \ge 16$, $a(F) < \frac{321}{500} = 0.642$, $\frac{96}{625} = 0.1536 < \operatorname{tr}(M^2) \le \lambda(T) < \frac{33}{50} = 0.66$, $\operatorname{Var}(\|\nabla F\|^2/3) > \frac{373}{200} = 1.865$, and $\frac{19}{2} = 9.5 < \kappa_4(F) < \frac{229}{5} = 45.8$.
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
*and $\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$ holds whenever $\operatorname{tr}(M^2)/\|T\|_{\mathrm{HS}}^4 \le \frac{96}{625} = 0.1536$ (in particular whenever $\|M\|_{\mathrm{op}}/\|T\|_{\mathrm{HS}}^2 \le \frac{96}{625} = 0.1536$).*

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
Using the exact outward rational quadrature and monotone kernel decomposition of `KNG505` ($N_Q = 2400$ plus $30$ dyadic near-zero subdivisions, covering $[0, \infty)$ including the infinite ray $[10^5, \infty)$), `verify_ou_influence.py` certifies $d_1(x) \ge 0.0008048 > 0$, $d_2(x) \ge 0.0007233 > 0$, and $d_1(x)d_2(x) - \big(\frac{\hat{g}_2(x)+\hat{g}_4(x)}{18} - \hat{\gamma}_3\big)^2 \ge 2.1 \times 10^{-9} > 0$ across all $336$ leaves of $[0, \infty)$. Direct rational arithmetic gives
$$
54\hat{\beta}_3 - \frac{9}{4} = \frac{3906}{100000} > 0, \qquad \hat{M}_3 := 72\hat{\alpha}_3 + 54\hat{\beta}_3 - \frac{15}{4} = \frac{167904 + 228906 - 375000}{100000} = \frac{2181}{10000} = 0.2181.
$$
Finally, with Machin's rational lower bound $\pi > \pi_{\mathrm{lo}} > \frac{31415926535}{10^{10}}$, at $m = \frac{96}{625} = 0.1536$ we have
$$
\left(1 + \frac{2181}{10000} \cdot \frac{96}{625}\right)^2 = \left(\frac{6459376}{6250000}\right)^2 = 1.0681225807\dots < 1.0681415022\dots < \frac{17}{50}\,\pi_{\mathrm{lo}} < \frac{17/25}{2/\pi},
$$
proving $\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$. Notice $\frac{96/625}{16/2500} = 24$. $\square$

**Corollary 1.3 (Isotropic and irreducibly symmetric third-chaos cubics).** *Let $n \ge 1$ and $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ satisfy $\mathbb{E}[\nabla F(\nabla F)^\top] = \frac{3}{n}\|F\|_2^2 I_n$ (equivalently $M = \frac{\|T\|_{\mathrm{HS}}^2}{n} I_n$). In particular, this holds by Schur's lemma whenever $F(g x) = \chi(g) F(x)$ ($\chi(g) \in \{\pm 1\}$) for every $g$ in a subgroup $G \le O(n)$ acting irreducibly on $\mathbb{R}^n$. Then $\mathbb{E}|F| \le \sqrt{17/25}\,\|F\|_2$ (strictly if $F \ne 0$).*

*Proof.* Assume $F \ne 0$ and normalize $\|T\|_{\mathrm{HS}} = 1$. If $1 \le n \le 15$, `(T)` holds on all of $V_3(\mathbb{R}^n)$ by [`STATUS.md`](../../STATUS.md) 3.21 (e3). If $n \ge 7$, $M = \frac{1}{n} I_n$ has $\operatorname{tr}(M^2) = \frac{1}{n} \le \frac{1}{7} = \frac{625}{4375} < \frac{672}{4375} = \frac{96}{625}$, so Theorem 1.2 gives $\mathbb{E}|F| < \sqrt{17/25}$. (The two arguments overlap across $7 \le n \le 15$.) $\square$

---

## 2. Coupled signed-circle & Frobenius-commutator 4D tensor cutoffs

Let $T \in \operatorname{Sym}^3(\mathbb{R}^n)$ ($n \ge 2$; for $n = 1$, $a(T) = 1$) satisfy $\|T\|_{\mathrm{HS}} = 1$ and $a(T) \le a_0 < 1$. Choose an orthonormal basis $(e_1, e_2, \dots, e_n)$ of $\mathbb{R}^n$ as in [`sources/third-chaos-dimfree-gemini-c1de/PROOF.md`](../third-chaos-dimfree-gemini-c1de/PROOF.md) §2 and [`sources/third-chaos-far-gaussian-gemini-9a4e/PROOF.md`](../third-chaos-far-gaussian-gemini-9a4e/PROOF.md) §§2–3:
- $e_1$ is a top unit eigenvector of $M$ ($M e_1 = \lambda e_1$, so $M_{11} = \lambda$ and $M_{1j} = 0$ for $j \ge 2$);
- $e_2 \perp e_1$ aligns with the component of $T(e_1, e_1, \cdot)$ in $e_1^\perp$, so $s := T_{112} \ge 0$ and $T_{11k} = 0$ for all $k \ge 3$;
- replacing $(T, e_2)$ by $(-T, -e_2)$ if needed preserves $s \ge 0$ and enforces $x := T_{111} \ge 0$.

Put $B := T(e_1, \cdot, \cdot)|_{e_1^\perp}$ ($b := B_{22} = T_{122}$, $P := \|B\|_{\mathrm{HS}}^2 = p_+ + p_-$, $u := \sum_{k=3}^n B_{2k}^2 \ge 0$, $w_B := P - b^2 \ge 2u$), $C := T(e_2, \cdot, \cdot)|_{e_1^\perp}$ ($d := C_{22} = T_{222}$), and $T_\perp := T|_{e_1^\perp}$ ($\|T_\perp\|_{\mathrm{HS}}^2 = 1 - x^2 - 3s^2 - 3P \ge d^2$). Let $(A_r)_{ij} := T_{rij}$ ($1 \le r \le n$) be the symmetric matrix slices of $T$.

### Why combining `#519` and `#520` strictly beats both

1. **Why `#519` left $\lambda$ and $\kappa_4$ slack:** In [`code/third-chaos-dimfree-gemini-c1de/certify_tensor.py`](../../code/third-chaos-dimfree-gemini-c1de/certify_tensor.py) (line 201), the 2-plane circle norm $\|T(w,w,\cdot)\|_2^2 \le a_0^2$ on $\operatorname{span}(e_1, e_2)$ was averaged over $\pm\sin\theta$, discarding the constructive signed $2 m k$ cross terms in
   $$
   (m^2 x + 2 m k s + k^2 b)^2 + (m^2 s + 2 m k b + k^2 d)^2 \le (m^2 + k^2)^2 a_0^2 \qquad \big((m, k) \in \mathbb{Z}^2 \setminus \{(0,0)\}\big).
   $$
2. **Why `#520` left $\lambda$ and $\kappa_4$ slack:** In [`sources/third-chaos-far-gaussian-gemini-9a4e/PROOF.md`](../third-chaos-far-gaussian-gemini-9a4e/PROOF.md) §§2–3, Theorem 2.1 rescaled $\widetilde{T} = T|_{\operatorname{span}(e_1, e_2)}$ by $1/a(\widetilde{T})$, dropping the unit-norm constraint $\|\widetilde{T}\|_{\mathrm{HS}}^2 \le \|T\|_{\mathrm{HS}}^2 = 1$. Because the planar extremizer $T_*$ of $(3\lambda - 1)/a^2 = 1 + \sqrt{2}$ has $a(T_*) = (2 + \sqrt{2}/2)^{-1/2} \approx 0.6078$, whenever $a_0 > a(T_*)$ (which holds for both $0.642$ and $0.698$) $T_*$ cannot be scaled up to $a = a_0$ under $\|T\|_{\mathrm{HS}} = 1$. Moreover, `#520` §3 retained only the single scalar commutator entry $([A_2, A_1])_{12}$ and the two-eigenvalue bound $\lambda^2 + (1-\lambda)^2$, whereas for every $p, q \in \{2, \dots, n\}$:
   $$
   ([A_p, A_1])_{1q} = \sum_{k=1}^n T_{p1k} T_{1kq} - \sum_{k=1}^n T_{11k} T_{pkq} = \big(s^2 e_2 e_2^\top + B^2 - x B - s C\big)_{pq} =: D_{pq}.
   $$
   By skew-symmetry of $[A_p, A_1]$ and disjointness of the index pairs $\{(p, 1), (1, p) : p \ge 2\}$ in $\sum_{r,s=1}^n \|[A_r, A_s]\|_F^2$,
   $$
   90\operatorname{tr}(M^2) - \kappa_4(F) = 18\sum_{r,s=1}^n \|[A_r, A_s]\|_F^2 \ge 18 \cdot 4\sum_{p,q=2}^n D_{pq}^2 = 72\,\|D\|_F^2.
   $$

### Analytic $d$-tightening and 4D certification

On each 4D box $X \times S_v \times B_v \times P_v \subset [0, a_0]^2 \times [-a_0, a_0] \times [0, \frac{1}{3}]$, `verify_tensor_combined.py` first intersects all analytic bounds on $d = T_{222}$ before slicing $d$:
- From each rational direction $(m, k)$ ($C_c = k^2 > 0$) with $u_1 := m^2 x + 2mk s + k^2 b$: if $\mathrm{rhs}_2 := (m^2 + k^2)^2 a_0^2 - (u_1^2)_{\mathrm{lo}} < 0$ the box is infeasible; otherwise $|m^2 s + 2mk b + k^2 d| \le \sqrt{\mathrm{rhs}_2}$ restricts $k^2 d$ directly to $[-\sqrt{\mathrm{rhs}_2} - (m^2 s + 2mk b)_{\mathrm{hi}},\, \sqrt{\mathrm{rhs}_2} - (m^2 s + 2mk b)_{\mathrm{lo}}]$.
- From $M_{12} = 0$: $|b d + s(x + 2b)| \le \sqrt{\frac{2}{3} w_B (\|T_\perp\|_{\mathrm{HS}}^2 - d^2)} \le \sqrt{\frac{2}{3} w_{B,\mathrm{hi}}\,\|T_\perp\|_{\mathrm{HS},\mathrm{hi}}^2}$, which whenever $0 \notin B_v$ restricts $d$ to an interval of width $O(\sqrt{w_{B,\mathrm{hi}}}/|b|_{\mathrm{lo}})$, collapsing $d$ to $-s(x+2b)/b$ along the 2D boundary $w_B \to 0$.
- Combining $\lambda = x^2 + 2s^2 + P$ with $3\lambda - 1 = 2x^2 + 3s^2 - \|T_\perp\|_{\mathrm{HS}}^2 \le 2x^2 + 3s^2 - \min_{\text{surv}}(d^2)$, symmetrized directional caps $m_\pm(x)$ on the positive/negative spectra $p_\pm$ of $B$, Weyl–Karamata majorization on $\operatorname{tr}(M^2)$ under $\lambda_j(M) \le \min(\lambda,\, s^2 + 2\|B\|_{\mathrm{op}}^2 + \|T_\perp\|_{\mathrm{HS}}^2)$ ($j \ge 2$), and $\|D\|_F \ge \max\big(|D_{22}|,\, \|s^2 e_2 e_2^\top + B^2 - x B\|_F - s\|C\|_F\big)$ (with $\|C\|_F^2 \le \frac{1}{3}d^2 + \frac{2}{3}\|T_\perp\|_{\mathrm{HS}}^2$) yields:

**Theorem 2.1.** *For every $n \ge 1$ and every symmetric cubic tensor $T \in \operatorname{Sym}^3(\mathbb{R}^n)$ with $\|T\|_{\mathrm{HS}} = 1$ and $F = I_3(T)/\sqrt{6}$:*
1. *If $a(T) \le \frac{349}{500} = 0.698$, then $\lambda(T) < \frac{27}{40} = 0.675$ and $\kappa_4(F) < 48$ ($32{,}515$ accepted leaves, $15{,}054$ pruned).*
2. *If $a(T) \le \frac{321}{500} = 0.642$, then $\lambda(T) < \frac{33}{50} = 0.66$ and $\kappa_4(F) < \frac{229}{5} = 45.8$ ($14{,}955$ accepted leaves, $4{,}376$ pruned).*

*Remark 2.2 (Proximity to an explicit planar obstruction at $a_0 = 0.698$).* The unit-norm binary tensor $T_0 := \sqrt{3}\,e_1 \odot e_1 \odot e_2$ ($x = b = d = P = 0$, $s = 1/\sqrt{3}$) has $T_0((\cos\theta\,e_1 + \sin\theta\,e_2)^{\otimes 3}) = \sqrt{3}\cos^2\theta\sin\theta$, whose maximum on $S^1$ is $a(T_0) = \frac{2}{3} = 0.66\overline{6} < \frac{349}{500}$, while $M(T_0) = \operatorname{diag}(\frac{2}{3}, \frac{1}{3})$ has $\lambda(T_0) = \frac{2}{3}$. Thus no upper bound on $\lambda(T)$ under $a(T) \le 0.698$ can be smaller than $\frac{2}{3} = 0.66\overline{6}$ (in fact perturbing $x > 0, b < 0$ pushes the feasible maximum to $\approx 0.6709$, within $0.0041$ of our certified $\frac{27}{40} = 0.675$).

---

## Replay

Both verifiers use **only the Python 3 standard library** (`ast`, `fractions`, `itertools`, `math`, `pathlib`, `sys`, `time`), contain **zero floating-point literals or calls** (enforced at runtime by AST inspection), use `-O`-safe `require(...)` checks throughout, and include deterministic adversarial/negative controls. Run from the repository root:

```sh
cert_dir=research/conjecture-K/code/third-chaos-506-gemini-8732
python3 -I -O "$cert_dir/verify_ou_influence.py"
python3 -I -O "$cert_dir/verify_tensor_combined.py"
```
