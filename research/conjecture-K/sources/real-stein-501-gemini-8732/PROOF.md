# Unconditional Closure of the Weak Third-Chaos Target `E|F| <= sqrt(17/25)||F||_2` (`<= 3999/5000 = 0.7998`), High-Kurtosis Sharp Gaussian Regime `kappa_4 >= 14`, and Complex Cubic Radius `rho_* <= 2221/2500 = 0.8884`

1. **Summary & Status (`P + C, author only`, `gemini-8732`, 28 November 2026; Closes `#501`, Closes `#506`, Refs `#458`).**
2. **Theorem 1 (Unconditional Real Third-Chaos Bound — `#501`, `#506`, `STATUS.md` `3.21 (e9)`):** For every $n \ge 1$ and every $F \in V_3(\mathbb{R}^n)$, $\mathbb{E}|F| \le \frac{3999}{5000}\|F\|_2 = 0.7998\,\|F\|_2 < \frac{4}{5}\|F\|_2 < \sqrt{\frac{17}{25}}\|F\|_2 = 0.8246211\dots\|F\|_2$ (**P + C, author only**; certified max across all 22 slabs of $\kappa_4 \in [0, 90]$ is $\le 0.79977041$ on $[\frac{9}{2}, 6]$).
3. **Theorem 2 (Sharp Gaussian Bound for $\kappa_4 \ge 14$ — `#458`, `STATUS.md` `3.21 (e1)`):** For every $n \ge 1$ and every nonzero $F \in V_3(\mathbb{R}^n)$ with $\kappa_4(F) \in [14, 90]$, $\mathbb{E}|F| \le \frac{3989}{5000}\|F\|_2 = 0.7978\,\|F\|_2 < \sqrt{\frac{2}{\pi}}\|F\|_2 = 0.79788456\dots\|F\|_2$ (**P + C, author only**; certified max across $[14, 90]$ is $\le 0.79774225$ on $[14, 16]$), lowering the unconditional kurtosis threshold for the sharp Gaussian bound from $\kappa_4 \ge 48$ to $\kappa_4 \ge 14$.
4. **Theorem 3 ($U(1)$ Phase-Averaging Transfer to $H_{2,1}(\mathbb{C}^n)$ — `STATUS.md` `3.6`, `3.7`):** For every $n \ge 1$ and every $q \in H_{2,1}(\mathbb{C}^n)$, $\mathbb{E}|q| \le \frac{2221}{2500}\|q\|_2 = 0.8884\,\|q\|_2$ (slashing `KOUL3`'s `114/125 = 0.912` gap to $\frac{\sqrt{\pi}}{2} = 0.8862269\dots$ by $> 11\times$), and whenever $\chi(q) := \frac{\mathbb{E}|q|^4}{\|q\|_2^4} - 2 \in [\frac{28}{3}, 42]$, $\mathbb{E}|q| \le \frac{4431}{5000}\|q\|_2 = 0.8862\,\|q\|_2 < \frac{\sqrt{\pi}}{2}\|q\|_2$ (**P + C, author only**, widening the sharp regime from $[25, 42]$ to $[\frac{28}{3}, 42]$).
5. **Theorem 4 (Downstream Degree-5 & Degree-7 Consequences — `higher-degree/STATUS.md` `1.12`, `4.12`, `4.18a`, `4.18e`, `4.18f`):** Substituting $\rho_0 = \frac{2221}{2500}$ gives $t = 0$ caps $\frac{6250000000}{6920775923} > 0.90307$ (`1.12`) and $\frac{3125000000}{3457921541} > 0.90372$ (`4.12`), and sector-free capped degree-5 cutoffs $t \le \frac{160633}{500000} = 0.321266$ (`4.18a`), $t \le \frac{45041147}{100000000} = 0.45041147$ (`4.18e` Parseval), $t \le \frac{45406137}{100000000} = 0.45406137$ (`4.18e` sixth-moment), $t \le \frac{45016597}{100000000} = 0.45016597$ (`4.18e` Lean mass), and $t \le \frac{45287}{100000} = 0.45287$ pure / $t \le \frac{11331}{25000} = 0.45324$ with `KNG505` (`4.18f`).
6. **External / Inherited Inputs Used:** The fourth- and sixth-cumulant contraction identities on $V_3(\mathbb{R}^n)$ (stated in Lean's rescaled normalization in `Grothe/LowerAnalytic/CircularTensor.lean`, `Grothe/LowerAnalytic/JointContractions.lean:31`, and `Grothe/LowerAnalytic/Circular.lean:485`, and independently verified in unit-variance normalization $\|T\|_{\mathrm{HS}} = 1$ against exact rank-6 Gaussian integration in `check_identities_exact.py`), plus Lean's `Circular.sixth_moment_complex` and `Grothe/Lower/MassWitnessData.lean` (and `KNG505` only for the optional `0.45324` variant of `4.18f`) in Theorem 4. Every certificate check runs in 100% pure Python 3 standard library with **zero floats** and **zero `assert` statements** (`verify.py`, `verify_bernstein.py`, `check_identities_exact.py`, `test_controls.py`).

---

## 1. Real Level-2 Malliavin–Stein Carré-du-Champ & Ornstein–Uhlenbeck Tower on $V_3(\mathbb{R}^n)$

Let $X = (X_1, \dots, X_n) \sim \mathcal{N}(0, I_n)$ be a standard Gaussian vector in $\mathbb{R}^n$ ($n \ge 1$). Every nonzero $F \in V_3(\mathbb{R}^n)$ normalized to $\|F\|_2 = 1$ has a unique representation as a third multiple Wiener–Itô integral (Nourdin–Peccati, *Normal Approximations with Malliavin Calculus*, 2012, Ch. 2; Janson, *Gaussian Hilbert Spaces*, 1997):

$$
F(X) = \frac{1}{\sqrt{6}}\,I_3(T) = \frac{1}{\sqrt{6}}\sum_{i,j,k=1}^n T_{ijk}\big(X_i X_j X_k - X_i\delta_{jk} - X_j\delta_{ik} - X_k\delta_{ij}\big),
$$

where $T \in (\mathbb{R}^n)^{\otimes 3}$ is fully symmetric under all permutations of $(i, j, k)$ and satisfies $\|T\|_{\mathrm{HS}}^2 = \sum_{i,j,k=1}^n T_{ijk}^2 = \mathbb{E}[F(X)^2] = 1$. **No trace-free assumption is made on $T$**: the trace vector $v_i := \sum_{k=1}^n T_{ikk}$ may be arbitrary.

### 1.1 Exact Derivative Structure & Linearity of the Hessian

Using symmetry of $T$, rewrite $F(X) = \frac{1}{\sqrt{6}}\big(\sum_{i,j,k} T_{ijk} X_i X_j X_k - 3\sum_i v_i X_i\big)$. Differentiating in $X$ gives:

$$
(DF)_i(X) = \sqrt{\frac{3}{2}}\left(\sum_{j,k=1}^n T_{ijk} X_j X_k - v_i\right) = \sqrt{\frac{3}{2}}\,I_2(T_{i\cdot\cdot}) \in V_2(\mathbb{R}^n),
$$

and differentiating a second time annihilates the constant trace shift $-v_i$ identically:

$$
(D^2 F)_{ij}(X) = \sqrt{6}\sum_{k=1}^n T_{ijk} X_k = \sqrt{6}\,I_1(T_{ij\cdot}) \in V_1(\mathbb{R}^n), \qquad (D^3 F)_{ijk} = \sqrt{6}\,T_{ijk}.
$$

Crucially, **$(D^2 F)(X)$ is a purely homogeneous linear symmetric matrix in $X$ for every $F \in V_3(\mathbb{R}^n)$, traced or untraced**.

Define the real Level-2 carré-du-champ observables:

1. **Modulus and squared modulus:** $r := |F(X)| \ge 0$, $V := F(X)^2 = r^2$.
2. **Normalized first-order carré-du-champ (Stein kernel proxy):**
   $$\tau := \frac{1}{3}\|DF\|_2^2 = \frac{1}{3}\sum_{i=1}^n (DF)_i^2 \ge 0.$$
3. **Normalized Hessian Frobenius norm (pure quadratic form in $X$):**
   $$\eta := \frac{1}{6}\|D^2 F\|_{\mathrm{HS}}^2 = \sum_{i,j=1}^n \left(\sum_{k=1}^n T_{ijk} X_k\right)^2 = X^\top M X \ge 0, \qquad M_{k\ell} := \sum_{i,j=1}^n T_{ijk} T_{ij\ell}.$$
   Notice $M \succeq 0$ is symmetric positive semidefinite with $\operatorname{tr}(M) = \|T\|_{\mathrm{HS}}^2 = 1$, and $\eta - 1 = X^\top M X - \operatorname{tr}(M) = I_2(M) \in V_2(\mathbb{R}^n)$.
4. **Second-order gradients and directional couplings:**
   $$D\tau = \frac{2}{3}(D^2 F)DF, \qquad D\eta = 2 M X,$$
   $$w_\tau := \|D\tau\|_2^2 \ge 0, \qquad w_{\tau\eta} := \langle D\tau, D\eta\rangle, \qquad w_\eta := \|D\eta\|_2^2 = 4\|M X\|_2^2 \ge 0,$$
   $$\sigma := \frac{1}{2}\langle DF, D\tau\rangle = \frac{1}{3}(DF)^\top(D^2 F)(DF), \qquad \nu := \frac{1}{2}\langle DF, D\eta\rangle = (DF)^\top M X,$$
   together with their parity-invariant radial projections (set to $0$ on $\{F = 0\}$):
   $$\sigma_r := \operatorname{sgn}(F)\sigma, \qquad \nu_r := \operatorname{sgn}(F)\nu, \qquad \text{where } \operatorname{sgn}(0) := 0.$$

### 1.2 Exact Ornstein–Uhlenbeck Generator Tower (**P**)

Let $L = \Delta - \langle X, \nabla\rangle$ be the Ornstein–Uhlenbeck generator on $\mathbb{R}^n$, which acts by $-k\,\mathrm{id}$ on the $k$-th Wiener chaos $V_k(\mathbb{R}^n)$ and satisfies the carré-du-champ identity $L(g h) = g Lh + h Lg + 2\langle Dg, Dh\rangle$ for polynomials $g, h$ (Nourdin–Peccati 2012, Props. 2.7.5 & 2.8.8).

**Lemma 1.1 (Carré-du-champ OU tower).** *For every unit-variance $F \in V_3(\mathbb{R}^n)$,*

$$
LF = -3F, \qquad L\tau = 4(\eta - \tau), \qquad L\eta = -2(\eta - 1).
$$

*Proof.* Since $F \in V_3(\mathbb{R}^n)$, $LF = -3F$. Since $\eta - 1 = I_2(M) \in V_2(\mathbb{R}^n)$ and $L(1) = 0$, $L\eta = L(\eta - 1) = -2(\eta - 1)$. Finally, each component $(DF)_i = \sqrt{\frac{3}{2}} I_2(T_{i\cdot\cdot})$ lies in $V_2(\mathbb{R}^n)$, so $L(DF)_i = -2(DF)_i$. Applying $L(g^2) = 2g Lg + 2\|Dg\|_2^2$ to $g = (DF)_i$ and summing over $i = 1, \dots, n$ yields

$$
L\tau = \frac{1}{3}\sum_{i=1}^n \Big(2(DF)_i L(DF)_i + 2\|D(DF)_i\|_2^2\Big) = \frac{1}{3}\Big(-4\|DF\|_2^2 + 2\|D^2 F\|_{\mathrm{HS}}^2\Big) = -4\tau + 4\eta = 4(\eta - \tau). \qquad \square
$$

### 1.3 Wiener-Chaos Expansion of $\tau - 1$ (**P**)

Let $A_{ijk\ell} := \sum_{r=1}^n T_{ijr} T_{k\ell r}$ and let $\widetilde{U}_{ijk\ell} := \frac{1}{3}(A_{ijk\ell} + A_{ikj\ell} + A_{i\ell jk})$ be the full symmetrization of $A$ in $(i, j, k, \ell)$ (already symmetric under $i \leftrightarrow j$, $k \leftrightarrow \ell$, and $(i,j) \leftrightarrow (k,\ell)$). Put

$$
m := \operatorname{tr}(M^2) = \|A\|_{\mathrm{HS}}^2, \qquad u := \|\widetilde{U}\|_{\mathrm{HS}}^2, \qquad 0 \le u \le m \le (\operatorname{tr} M)^2 = 1.
$$

**Lemma 1.2.** *For every unit-variance $F \in V_3(\mathbb{R}^n)$,*

$$
\tau - 1 = 2 I_2(M) + \frac{1}{2}I_4(\widetilde{U}) \in V_2(\mathbb{R}^n) \oplus V_4(\mathbb{R}^n).
$$

*Proof.* By the Wiener–Itô product formula for two second-chaos integrals (Nourdin–Peccati 2012, Thm. 2.7.10), for each $r \in \{1, \dots, n\}$,

$$
I_2(T_{r\cdot\cdot})^2 = I_4(T_{r\cdot\cdot} \widetilde{\otimes} T_{r\cdot\cdot}) + 4 I_2(T_{r\cdot\cdot} \widetilde{\otimes}_1 T_{r\cdot\cdot}) + 2\|T_{r\cdot\cdot}\|_{\mathrm{HS}}^2.
$$

Summing over $r = 1, \dots, n$:
- $\sum_r \|T_{r\cdot\cdot}\|_{\mathrm{HS}}^2 = \|T\|_{\mathrm{HS}}^2 = 1$;
- $(T_{r\cdot\cdot} \widetilde{\otimes}_1 T_{r\cdot\cdot})_{ij} = \sum_k T_{rik} T_{rjk}$, whose sum over $r$ is $M_{ij}$ by symmetry of $T$;
- $(T_{r\cdot\cdot} \widetilde{\otimes} T_{r\cdot\cdot})_{ijk\ell} = \frac{1}{3}(T_{rij} T_{rk\ell} + T_{rik} T_{rj\ell} + T_{ri\ell} T_{rjk})$, whose sum over $r$ is $\widetilde{U}_{ijk\ell}$.

Multiplying by $\frac{1}{3}\cdot\frac{3}{2} = \frac{1}{2}$ gives $\tau = \frac{1}{2}\sum_r I_2(T_{r\cdot\cdot})^2 = 1 + 2 I_2(M) + \frac{1}{2}I_4(\widetilde{U})$. *(Note: this immediately gives a second proof of Lemma 1.1: $L\tau = 2(-2)I_2(M) + \frac{1}{2}(-4)I_4(\widetilde{U}) = -4 I_2(M) - 2(\tau - 1 - 2 I_2(M)) = 4(\eta - 1) - 4(\tau - 1) + 2 I_4$? Wait: $-4 I_2(M) - 2 I_4(\widetilde{U}) = 4 I_2(M) - 4(2 I_2(M) + \frac{1}{2}I_4(\widetilde{U})) = 4(\eta - 1) - 4(\tau - 1) = 4(\eta - \tau)$! Both proofs match identically.)* $\square$

---

## 2. Exact $(m, u)$ Moment Table & Sixth-Cumulant Envelope

### 2.1 Exact Second-Order & Cross Moments (**P**)

**Proposition 2.1.** *For every unit-variance $F \in V_3(\mathbb{R}^n)$ with invariants $m = \operatorname{tr}(M^2)$ and $u = \|\widetilde{U}\|_{\mathrm{HS}}^2$,*

$$
\begin{aligned}
\mathbb{E}[V] &= 1, \qquad \mathbb{E}[\tau] = 1, \qquad \mathbb{E}[\eta] = 1, \qquad \kappa_4(F) := \mathbb{E}[V^2] - 3 = 36m + 54u,\\
\operatorname{Var}(\tau) &= 8m + 6u, \qquad \operatorname{Cov}(\tau, \eta) = 4m, \qquad \operatorname{Var}(\eta) = 2m,\\
\mathbb{E}[w_\tau] &= 16m + 24u, \qquad \mathbb{E}[w_{\tau\eta}] = 8m, \qquad \mathbb{E}[w_\eta] = 4m,\\
\mathbb{E}[V(\tau - 1)] &= 12m + 18u = \frac{1}{3}\kappa_4(F), \qquad \mathbb{E}[V(\eta - 1)] = 6m.
\end{aligned}
$$

*Proof.* By Wiener–Itô isometry $\mathbb{E}[I_k(S_1) I_\ell(S_2)] = \delta_{k\ell}\,k!\,\langle S_1, S_2\rangle_{\mathrm{HS}}$ for symmetric kernels:
1. From $\eta - 1 = I_2(M)$ and $\tau - 1 = 2 I_2(M) + \frac{1}{2}I_4(\widetilde{U})$ with $V_2 \perp V_4$:
   $$\operatorname{Var}(\eta) = 2!\|M\|_{\mathrm{HS}}^2 = 2m, \qquad \operatorname{Cov}(\tau, \eta) = 2\cdot 2!\|M\|_{\mathrm{HS}}^2 = 4m, \qquad \operatorname{Var}(\tau) = 4\cdot 2!\|M\|_{\mathrm{HS}}^2 + \frac{1}{4}\cdot 4!\|\widetilde{U}\|_{\mathrm{HS}}^2 = 8m + 6u.$$
2. By Gaussian integration by parts $\mathbb{E}[\langle Dg, Dh\rangle] = -\mathbb{E}[g Lh]$ and Lemma 1.1:
   - $\mathbb{E}[w_\eta] = -\mathbb{E}[(\eta - 1)L(\eta - 1)] = 2\operatorname{Var}(\eta) = 4m$;
   - $\mathbb{E}[w_{\tau\eta}] = -\mathbb{E}[(\tau - 1)L(\eta - 1)] = 2\operatorname{Cov}(\tau, \eta) = 8m$;
   - $\mathbb{E}[w_\tau] = -\mathbb{E}[(\tau - 1)L(\tau - 1)] = -\mathbb{E}\big[(2 I_2(M) + \frac{1}{2}I_4(\widetilde{U}))(-4 I_2(M) - 2 I_4(\widetilde{U}))\big] = 8\cdot 2m + 1\cdot 24u = 16m + 24u$.
3. Since $LF = -3F$, $L V = L(F^2) = 2 F LF + 2\|DF\|_2^2 = -6 V + 6\tau$. By self-adjointness of $L$ in $L^2(\gamma_n)$, for any polynomial $Z$ with $LZ = -\lambda_Z Z$:
   $$-\lambda_Z \mathbb{E}[V Z] = \mathbb{E}[V LZ] = \mathbb{E}[(LV)Z] = -6\mathbb{E}[V Z] + 6\mathbb{E}[\tau Z] \implies (6 - \lambda_Z)\mathbb{E}[V Z] = 6\mathbb{E}[\tau Z].$$
   - Setting $Z = \eta - 1 \in V_2$ ($\lambda_Z = 2$): $4\mathbb{E}[V(\eta - 1)] = 6\operatorname{Cov}(\tau, \eta) = 24m \implies \mathbb{E}[V(\eta - 1)] = 6m$.
   - Setting $Z = I_4(\widetilde{U}) \in V_4$ ($\lambda_Z = 4$): $2\mathbb{E}[V I_4(\widetilde{U})] = 6\mathbb{E}[\tau I_4(\widetilde{U})] = 3\operatorname{Var}(I_4(\widetilde{U})) = 72u \implies \mathbb{E}[V I_4(\widetilde{U})] = 36u$.
   - Combining via $\tau - 1 = 2(\eta - 1) + \frac{1}{2}I_4(\widetilde{U})$ gives $\mathbb{E}[V(\tau - 1)] = 12m + 18u$.
4. Finally, applying $\mathbb{E}[\langle D(F^3), DF\rangle + F^3 LF] = 0$ gives $3\mathbb{E}[F^2 \|DF\|_2^2] - 3\mathbb{E}[F^4] = 0$, i.e. $\mathbb{E}[V^2] = 3\mathbb{E}[V\tau] = 3\mathbb{E}[V] + 3\mathbb{E}[V(\tau - 1)] = 3 + 36m + 54u$, matching Lean's `Grothe.LowerAnalytic.Chaos3.wick4`. $\square$

### 2.2 Refined $(m, u)$ Sixth-Cumulant Bound & Exact Rational Slab Reduction (**P + Lean**)

**Proposition 2.2.** *For every unit-variance $F \in V_3(\mathbb{R}^n)$ with invariants $(m, u)$,*

$$
\mathbb{E}[V^3] = 15 + 15\kappa_4(F) + \kappa_6(F), \qquad \kappa_6(F) \le 216\left(\frac{135}{2}u^{3/2} + 45 m^{1/2} u + 150 m u^{1/2} - 20 m^2\right).
$$

*Proof.* By the standard cumulant–moment relation for centered unit-variance $F$ with $F \in V_3 \implies \mathbb{E}[F] = \mathbb{E}[F^3] = \mathbb{E}[F^5] = 0$, $\mathbb{E}[F^6] = \kappa_6(F) + 15\kappa_4(F) + 15$. By the real third-chaos sixth-cumulant contraction formula (Lean's `Grothe/LowerAnalytic/JointContractions.lean:31` and `Circular.lean:485` rescaled to $\|T\|_{\mathrm{HS}} = 1$; also independently verified from scratch against exact Gaussian integration on 6 full-rank tensors in `check_identities_exact.py`),

$$
\kappa_6(F) = 216\left(\frac{135}{2}\operatorname{tr}(\widetilde{U}^3) - 20\operatorname{tr}(M^3) + \frac{135}{2}\langle \operatorname{vec} M, \widetilde{U}\,\operatorname{vec} M\rangle + \frac{165}{2}\langle T M, \widetilde{U} T\rangle + 45\|\widetilde{U} T\|_{\mathrm{HS}}^2\right),
$$

viewing $A = T T^\top$ and $\widetilde{U}$ as $n^2 \times n^2$ symmetric matrices and $T$ as an $n^2 \times n$ matrix. As in `third-chaos-dimfree-gemini-c1de/PROOF.md` §1 (reviewed in `#519`):
- $|\operatorname{tr}(\widetilde{U}^3)| \le \|\widetilde{U}\|_{\mathrm{op}}\|\widetilde{U}\|_{\mathrm{HS}}^2 \le u^{3/2}$ and $|\langle \operatorname{vec} M, \widetilde{U}\,\operatorname{vec} M\rangle| \le \|\widetilde{U}\|_{\mathrm{op}}\|M\|_{\mathrm{HS}}^2 \le u^{1/2} m$;
- $\|\widetilde{U} T\|_{\mathrm{HS}}^2 = \operatorname{tr}(\widetilde{U}^2 A) \le \|\widetilde{U}^2\|_{\mathrm{HS}}\|A\|_{\mathrm{HS}} \le u m^{1/2}$;
- $\|T M\|_{\mathrm{HS}}^2 = \operatorname{tr}(M^3) \le \|M\|_{\mathrm{op}}\operatorname{tr}(M^2) \le m^{3/2}$, so $|\langle T M, \widetilde{U} T\rangle| \le m^{3/4}(u m^{1/2})^{1/2} = m u^{1/2}$.

For the negative term $-20\operatorname{tr}(M^3)$, instead of dropping it, let $\lambda_1, \dots, \lambda_n \ge 0$ be the eigenvalues of $M \succeq 0$. Since $\sum_i \lambda_i = \operatorname{tr}(M) = 1$ and $\sum_i \lambda_i^2 = m$, Cauchy–Schwarz gives

$$
m^2 = \left(\sum_{i=1}^n \lambda_i^{1/2}\,\lambda_i^{3/2}\right)^2 \le \left(\sum_{i=1}^n \lambda_i\right)\left(\sum_{i=1}^n \lambda_i^3\right) = \operatorname{tr}(M^3),
$$

so $-20\operatorname{tr}(M^3) \le -20 m^2$. Combining all five terms gives the stated bound (`135/2 + 165/2 = 150`). $\square$

**Lemma 2.3 (Exact univariate rational moment test on $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$).** *Fix rational multipliers $(\lambda_0, \lambda_1, \lambda_2, \lambda_3)$ with $\lambda_3 > 0$, $M_{\mathrm{ker}} = \begin{pmatrix} m_{00} & m_{01} \\ m_{01} & m_{11} \end{pmatrix} \succ 0$, $M_w = \begin{pmatrix} \mu_{00} & \mu_{01} \\ \mu_{01} & \mu_{11} \end{pmatrix} \succ 0$, $(\gamma_{vt}, \gamma_{ve}) \in \mathbb{Q}^2$, and a target slab bound $B \in \mathbb{Q}_{> 0}$ on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}] \subset [0, 90]$. Set*

$$
\begin{aligned}
C_0 &:= \lambda_0 + \lambda_1 + 3\lambda_2 + 15\lambda_3, \qquad C_s := \lambda_2 + 15\lambda_3 + \frac{1}{3}\gamma_{vt},\\
C_m &:= 8 m_{00} + 8 m_{01} + 2 m_{11} + 16\mu_{00} + 16\mu_{01} + 4\mu_{11} + 6\gamma_{ve}, \qquad C_u := 6 m_{00} + 24\mu_{00},\\
q(x) &:= 36 + 54x^2, \qquad P_6(x) := 216\Big(\frac{135}{2}x^3 + 45x^2 + 150x\Big) = 14580x^3 + 9720x^2 + 32400x,
\end{aligned}
$$

*and let $\sigma_{\mathrm{lo}}, \sigma_{\mathrm{hi}} \in \mathbb{Q}_{\ge 0}$ satisfy $\sigma_{\mathrm{lo}}^2 \ge s_{\mathrm{lo}}^3$, $\sigma_{\mathrm{hi}}^2 \ge s_{\mathrm{hi}}^3$, $s_{\mathrm{mid}} := \frac{1}{2}(s_{\mathrm{lo}} + s_{\mathrm{hi}})$, $s_{\mathrm{sq},*} := 2 s_{\mathrm{mid}} s_* - s_{\mathrm{mid}}^2$ for $s_* \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}$, and $x_{\mathrm{lo}} \in \mathbb{Q} \cap [0, 1)$ with $x_{\mathrm{lo}} = 0$ if $s_{\mathrm{lo}} \le 36$ and $36 + 54 x_{\mathrm{lo}}^2 \le s_{\mathrm{lo}}$ if $s_{\mathrm{lo}} > 36$. If for both endpoints $(s_*, \sigma_*, s_{\mathrm{sq},*}) \in \{(s_{\mathrm{lo}}, \sigma_{\mathrm{lo}}, s_{\mathrm{sq},\mathrm{lo}}), (s_{\mathrm{hi}}, \sigma_{\mathrm{hi}}, s_{\mathrm{sq},\mathrm{hi}})\}$, the degree-4 polynomial*

$$
N_*(x) := (B - C_0 - s_* C_s)\,q(x)^2 - s_*(C_m + C_u x^2)\,q(x) + 4320\,\lambda_3\,s_{\mathrm{sq},*} \in \mathbb{Q}[x]
$$

*and the degree-8 polynomial $N_*(x)^2 - \lambda_3^2 \sigma_*^2 P_6(x)^2 q(x) \in \mathbb{Q}[x]$ are strictly positive for all $x \in [x_{\mathrm{lo}}, 1]$, then*

$$
\mathcal{E}(F) := C_0 + C_s\,\kappa_4(F) + C_m\,m + C_u\,u + \lambda_3\,\kappa_6(F) < B
$$

*for every unit-variance $F \in V_3(\mathbb{R}^n)$ with $\kappa_4(F) \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$.*

*Proof.* Put $s = \kappa_4(F) = 36m + 54u \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$.
- If $s = 0$ (which occurs only when $s_{\mathrm{lo}} = 0$), then $m = u = 0$ and $\kappa_6(F) = 0$, so $\mathcal{E}(F) = C_0$, while $N_{\mathrm{lo}}(0) = (B - C_0)\cdot 36^2 - 4320\lambda_3 s_{\mathrm{mid}}^2 > 0 \implies C_0 < B - \frac{10}{3}\lambda_3 s_{\mathrm{mid}}^2 < B$.
- If $s > 0$, then $m > 0$ (since $0 \le u \le m$ and $36m + 54u = s > 0$). Put $x := \sqrt{u/m} \in [0, 1]$, so $m = \frac{s}{q(x)}$ and $u = \frac{s x^2}{q(x)}$. Since $m \le 1$, $q(x) = \frac{s}{m} \ge s \ge s_{\mathrm{lo}}$, so $x \in [x_{\mathrm{lo}}, 1]$ (trivially when $x_{\mathrm{lo}} = 0$, and when $s_{\mathrm{lo}} > 36$ because $36 + 54x^2 \ge s_{\mathrm{lo}} \ge 36 + 54 x_{\mathrm{lo}}^2 \implies x \ge x_{\mathrm{lo}}$). By Proposition 2.2 and $\lambda_3 > 0$,

  $$
  \mathcal{E}(F) \le C_0 + s\left(C_s + \frac{C_m + C_u x^2}{q(x)}\right) + \lambda_3\frac{s^{3/2} P_6(x)}{q(x)^{3/2}} - \lambda_3\frac{4320 s^2}{q(x)^2}.
  $$

  On $[s_{\mathrm{lo}}, s_{\mathrm{hi}}]$, $s \mapsto s^{3/2}$ is convex ($s^{3/2} \le \frac{s_{\mathrm{hi}} - s}{s_{\mathrm{hi}} - s_{\mathrm{lo}}}\sigma_{\mathrm{lo}} + \frac{s - s_{\mathrm{lo}}}{s_{\mathrm{hi}} - s_{\mathrm{lo}}}\sigma_{\mathrm{hi}}$) and $s \mapsto -s^2$ is concave ($-s^2 = -s_{\mathrm{mid}}^2 - 2 s_{\mathrm{mid}}(s - s_{\mathrm{mid}}) - (s - s_{\mathrm{mid}})^2 \le s_{\mathrm{mid}}^2 - 2 s_{\mathrm{mid}} s$). Because $\lambda_3 \frac{P_6(x)}{q(x)^{3/2}} \ge 0$ and $\frac{4320\lambda_3}{q(x)^2} > 0$, substituting both bounds yields an upper bound **affine in $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$**, whose maximum over $s \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ is attained at an endpoint $s_* \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}$. At $s_*$, multiplying by $q(x)^2 > 0$ rewrites strict inequality $< B$ as $\lambda_3 \sigma_* P_6(x)\sqrt{q(x)} < N_*(x)$. Since the left-hand side is $\ge 0$, this holds if and only if $N_*(x) > 0$ and $N_*(x)^2 - \lambda_3^2 \sigma_*^2 P_6(x)^2 q(x) > 0$. $\square$

---

## 3. Everywhere-$C^1(\mathbb{R})$ Level-2 Stein Brackets & Nodal Regularity at $\{F = 0\}$

Fix rational knots $0 = r_0 < r_1 < \dots < r_K$ ($K \ge 2$). Let:
- $\phi_1: [0, \infty) \to \mathbb{R}$ be continuous, affine on each $[r_k, r_{k+1}]$ ($0 \le k < K$), and constant $\phi_1(r) \equiv \phi_1(r_K)$ on $[r_K, \infty)$, with primitive $G_1(r) := \int_0^r \phi_1(s)\,ds$;
- $\phi_2, \phi_3: [0, \infty) \to \mathbb{R}$ be continuous, affine on each $[r_k, r_{k+1}]$, identically $0$ on $[r_K, \infty)$ ($\phi_i(r_K) = 0$), and satisfy the **exact compact-support integral condition** $G_i(r_K) = \int_0^{r_K} \phi_i(s)\,ds = 0$, so $G_i(r) := \int_0^r \phi_i(s)\,ds \equiv 0$ on $[r_K, \infty)$ ($i \in \{2, 3\}$);
- $\psi_4, \psi_7: [0, \infty) \to \mathbb{R}$ be continuous, affine on each $[r_k, r_{k+1}]$, satisfy **$\psi_j(0) = 0$ and $\psi_j(r_K) = 0$**, and vanish identically on $[r_K, \infty)$, with backward primitive $H_j(r) := -\int_r^{r_K} \psi_j(s)\,ds$ ($H_j \equiv 0$ on $[r_K, \infty)$, $H_j'(r) = \psi_j(r)$).

**Proposition 3.1 (Everywhere-$C^1$ regularity & exact zero mean of the 5 Level-2 Stein brackets — P).** *For every unit-variance $F \in V_3(\mathbb{R}^n)$, define with $r = |F|$:*

$$
\begin{aligned}
\mathrm{Br}_1 &:= 3\tau\phi_1(r) - 3 r G_1(r),\\
\mathrm{Br}_2 &:= 3\tau(\tau - 1)\phi_2(r) - 3(\tau - 1) r G_2(r) + 2\sigma_r G_2(r),\\
\mathrm{Br}_3 &:= 3\tau(\eta - 1)\phi_3(r) - 3(\eta - 1) r G_3(r) + 2\nu_r G_3(r),\\
\mathrm{Br}_4 &:= 2\sigma_r\psi_4(r) - 4(\tau - \eta) H_4(r),\\
\mathrm{Br}_7 &:= 2\nu_r\psi_7(r) - 2(\eta - 1) H_7(r).
\end{aligned}
$$

*Then $\mathbb{E}[\mathrm{Br}_1] = \mathbb{E}[\mathrm{Br}_2] = \mathbb{E}[\mathrm{Br}_3] = \mathbb{E}[\mathrm{Br}_4] = \mathbb{E}[\mathrm{Br}_7] = 0$.*

*Proof.* Define $\Phi_i(x) := \operatorname{sgn}(x) G_i(|x|)$ ($i \in \{1, 2, 3\}$) and $h_j(x) := H_j(|x|)$ ($j \in \{4, 7\}$) for $x \in \mathbb{R}$.
1. **Smoothness at $x = 0$ (no cusp):**
   - Since $G_i(0) = 0$ and $G_i'(s) = \phi_i(s)$ is continuous on $[0, \infty)$, for $x > 0$ we have $\Phi_i(x) = G_i(x) \implies \Phi_i'(x) = \phi_i(x)$, for $x < 0$ we have $\Phi_i(x) = -G_i(-x) \implies \Phi_i'(x) = \phi_i(-x)$, and at $x = 0$:
     $$\lim_{x \to 0} \frac{\Phi_i(x) - \Phi_i(0)}{x} = \lim_{x \to 0} \frac{G_i(|x|)}{|x|} = \phi_i(0) = \lim_{x \to 0} \Phi_i'(x).$$
     Hence $\Phi_i \in C^1(\mathbb{R})$ with bounded continuous derivative $\Phi_i'(x) = \phi_i(|x|)$ everywhere on $\mathbb{R}$ (and $\Phi_2, \Phi_3$ are compactly supported on $[-r_K, r_K]$).
   - Similarly, for $x \ne 0$, $h_j'(x) = \operatorname{sgn}(x)\psi_j(|x|)$. Because **$\psi_j(0) = 0$**, $\lim_{x \to 0} \operatorname{sgn}(x)\psi_j(|x|) = 0$, and by L'Hôpital / mean value theorem $\lim_{x \to 0} \frac{H_j(|x|) - H_j(0)}{x} = 0$. Hence $h_j \in C^1(\mathbb{R})$ with compactly supported Lipschitz derivative $h_j'(x) = \operatorname{sgn}(x)\psi_j(|x|)$ everywhere on $\mathbb{R}$ ($h_j'(0) = 0$).
2. **Chain rule & Gaussian integration by parts:**
   For any $g \in C^1(\mathbb{R})$ with bounded derivative and any polynomial $P$ on $\mathbb{R}^n$, $g \circ F \in \mathbb{D}^{1,2}$ with $D(g(F)) = g'(F) DF$ (Nourdin–Peccati 2012, Prop. 2.3.8) and $\mathbb{E}[\langle D(P\,g(F)), DZ\rangle + P\,g(F)\,LZ] = 0$ for every polynomial $Z$. Note also that $\Phi_i(F) F = |F| G_i(|F|) = r G_i(r)$ everywhere, and on $\{F = 0\}$ both $G_i(r) = G_i(0) = 0$ and $\psi_j(r) = \psi_j(0) = 0$, so $g'(F)\langle DF, DZ\rangle$ and $\Phi_i(F)\langle DF, DZ\rangle$ agree everywhere on $\mathbb{R}^n$ (including $\{F = 0\}$!) with the radial expressions using $\sigma_r = \operatorname{sgn}(F)\sigma$ and $\nu_r = \operatorname{sgn}(F)\nu$:
   - Taking $H = \Phi_1(F)$ and $Z = F$ ($LF = -3F$, $\langle DF, DF\rangle = 3\tau$):
     $$0 = \mathbb{E}\big[\phi_1(r)\cdot 3\tau + \Phi_1(F)(-3F)\big] = \mathbb{E}[3\tau\phi_1(r) - 3 r G_1(r)] = \mathbb{E}[\mathrm{Br}_1].$$
   - Taking $H = (\tau - 1)\Phi_2(F)$ and $Z = F$ ($D H = (\tau - 1)\phi_2(r) DF + \Phi_2(F) D\tau$, $\langle D\tau, DF\rangle = 2\sigma$, $\Phi_2(F)\cdot 2\sigma = 2\sigma_r G_2(r)$):
     $$0 = \mathbb{E}\big[3\tau(\tau - 1)\phi_2(r) + 2\sigma_r G_2(r) - 3(\tau - 1) r G_2(r)\big] = \mathbb{E}[\mathrm{Br}_2].$$
   - Taking $H = (\eta - 1)\Phi_3(F)$ and $Z = F$ ($\langle D\eta, DF\rangle = 2\nu$, $\Phi_3(F)\cdot 2\nu = 2\nu_r G_3(r)$):
     $$0 = \mathbb{E}\big[3\tau(\eta - 1)\phi_3(r) + 2\nu_r G_3(r) - 3(\eta - 1) r G_3(r)\big] = \mathbb{E}[\mathrm{Br}_3].$$
   - Taking $H = h_4(F)$ and $Z = \tau$ ($L\tau = 4(\eta - \tau) = -4(\tau - \eta)$ by Lemma 1.1, $Dh_4(F) = \operatorname{sgn}(F)\psi_4(r) DF$, $\langle Dh_4(F), D\tau\rangle = 2\sigma_r\psi_4(r)$):
     $$0 = \mathbb{E}\big[2\sigma_r\psi_4(r) - 4(\tau - \eta) H_4(r)\big] = \mathbb{E}[\mathrm{Br}_4].$$
   - Taking $H = h_7(F)$ and $Z = \eta$ ($L\eta = -2(\eta - 1)$ by Lemma 1.1, $\langle Dh_7(F), D\eta\rangle = 2\nu_r\psi_7(r)$):
     $$0 = \mathbb{E}\big[2\nu_r\psi_7(r) - 2(\eta - 1) H_7(r)\big] = \mathbb{E}[\mathrm{Br}_7]. \qquad \square$$

---

## 4. Pointwise Cones & Closed-Form $3\times 3$ Polynomial Certificate

**Lemma 4.1 (Pointwise carré-du-champ inequalities — P).** *At every point $X \in \mathbb{R}^n$ (including on $\{F(X) = 0\}$):*
1. $\tau \ge 0$, $\eta \ge 0$, $\tau\eta \ge 0$, and $\sigma_r^2 \le 6\tau^2\eta$.
2. *For any constant matrix $M_w = \begin{pmatrix} \mu_{00} & \mu_{01} \\ \mu_{01} & \mu_{11} \end{pmatrix} \succ 0$ ($D_w := \mu_{00}\mu_{11} - \mu_{01}^2 > 0$) and any real scalars $l_A, L_\nu \in \mathbb{R}$,*
   $$\mu_{00} w_\tau + 2\mu_{01} w_{\tau\eta} + \mu_{11} w_\eta + l_A\sigma_r + L_\nu\nu_r + T_3(l_A, L_\nu)\,\tau \ge 0,$$
   *where $T_3(l_A, L_\nu) := \frac{3}{16 D_w}\big(\mu_{11} l_A^2 - 2\mu_{01} l_A L_\nu + \mu_{00} L_\nu^2\big) \ge 0$.*
3. *For any real scalars $A_e > 0$, $t_2 > 0$, and $l_B \in \mathbb{R}$ satisfying $A_e t_2 - \frac{3}{2}l_B^2 > 0$,*
   $$A_e\eta + l_B\sigma_r + t_2\tau^2 \ge 0.$$

*Proof.*
1. Clearly $\tau = \frac{1}{3}\|DF\|_2^2 \ge 0$ and $\eta = \frac{1}{6}\|D^2 F\|_{\mathrm{HS}}^2 \ge 0$. Since $|\sigma| = \frac{1}{3}|(DF)^\top(D^2 F)(DF)| \le \frac{1}{3}\|DF\|_2^2 \|D^2 F\|_{\mathrm{op}} \le \tau \|D^2 F\|_{\mathrm{HS}} = \tau\sqrt{6\eta}$ and $|\sigma_r| \le |\sigma|$, squaring gives $\sigma_r^2 \le 6\tau^2\eta$.
2. Put $u_1 := D\tau \in \mathbb{R}^n$, $u_2 := D\eta \in \mathbb{R}^n$, and $v := \frac{\operatorname{sgn}(F)}{\sqrt{3}} DF \in \mathbb{R}^n$ ($v = 0$ on $\{F = 0\}$), so $\|v\|_2^2 \le \tau$ everywhere (with equality on $\{F \ne 0\}$ and $0 \le \tau$ on $\{F = 0\}$), $\langle u_1, v\rangle = \frac{2}{\sqrt{3}}\sigma_r$, and $\langle u_2, v\rangle = \frac{2}{\sqrt{3}}\nu_r$. On $\mathbb{R}^n \oplus \mathbb{R}^n$, $Q_w(x_1, x_2) := \mu_{00}\|x_1\|_2^2 + 2\mu_{01}\langle x_1, x_2\rangle + \mu_{11}\|x_2\|_2^2 \ge 0$ since $M_w \succ 0$. Setting $\begin{pmatrix} a_1 \\ a_2 \end{pmatrix} := \frac{\sqrt{3}}{4} M_w^{-1}\begin{pmatrix} l_A \\ L_\nu \end{pmatrix}$ gives $Q_w(a_1, a_2) = \frac{3}{16}\begin{pmatrix} l_A & L_\nu \end{pmatrix} M_w^{-1}\begin{pmatrix} l_A \\ L_\nu \end{pmatrix} = T_3(l_A, L_\nu) \ge 0$, and expanding $Q_w(u_1 + a_1 v, u_2 + a_2 v) \ge 0$ gives
   $$0 \le \mu_{00} w_\tau + 2\mu_{01} w_{\tau\eta} + \mu_{11} w_\eta + l_A\sigma_r + L_\nu\nu_r + T_3(l_A, L_\nu)\|v\|_2^2 \le \mu_{00} w_\tau + 2\mu_{01} w_{\tau\eta} + \mu_{11} w_\eta + l_A\sigma_r + L_\nu\nu_r + T_3(l_A, L_\nu)\tau.$$
3. Since $A_e > 0$, $A_e t_2 > \frac{3}{2}l_B^2$, and $\sigma_r^2 \le 6\tau^2\eta$:
   $$A_e\eta + l_B\sigma_r + t_2\tau^2 \ge A_e\eta - |l_B|\sqrt{6\eta}\,\tau + \frac{3 l_B^2}{2 A_e}\tau^2 = A_e\left(\sqrt{\eta} - \frac{\sqrt{6}\,|l_B|}{2 A_e}\tau\right)^2 \ge 0. \qquad \square$$

### 4.1 Exact Pointwise Majorant Identity (**P + C**)

Given a row certificate on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}]$, define at every $X \in \mathbb{R}^n$:

$$
\begin{aligned}
\mathrm{RHS}(X) :=\;&\lambda_0 + \lambda_1 V + \lambda_2 V^2 + \lambda_3 V^3 + \begin{pmatrix}\tau - 1\\\eta - 1\end{pmatrix}^\top M_{\mathrm{ker}} \begin{pmatrix}\tau - 1\\\eta - 1\end{pmatrix}\\
&+ \mu_{00} w_\tau + 2\mu_{01} w_{\tau\eta} + \mu_{11} w_\eta + \gamma_{vt} V(\tau - 1) + \gamma_{ve} V(\eta - 1) + \mathrm{Br}_1 + \mathrm{Br}_2 + \mathrm{Br}_3 + \mathrm{Br}_4 + \mathrm{Br}_7.
\end{aligned}
$$

On each finite knot interval $r \in [r_k, r_{k+1}]$ ($0 \le k < K$):
- Put $L_\sigma(r) := 2 G_2(r) + 2\psi_4(r)$ and $L_\nu(r) := 2 G_3(r) + 2\psi_7(r)$ (the exact coefficients of $\sigma_r$ and $\nu_r$ in $\mathrm{Br}_2 + \mathrm{Br}_3 + \mathrm{Br}_4 + \mathrm{Br}_7$).
- Let $l_B(r), A_e(r), t_2(r), \xi_e(r), \xi_{te}(r)$ be affine on $[r_k, r_{k+1}]$ with $A_e > 0$, $t_2 > 0$, $\xi_e \ge 0$, $\xi_{te} \ge 0$, $D_B(r) := A_e(r) t_2(r) - \frac{3}{2}l_B(r)^2 > 0$, $l_A(r) := L_\sigma(r) - l_B(r)$, $T_{3,\mathrm{exact}}(r) := T_3(l_A(r), L_\nu(r)) \in \mathbb{Q}[r]$ (degree $\le 4$), and let $\tau_{3,k}(r) \in \mathbb{Q}[r]$ be the certified degree-4 polynomial satisfying $\tau_{3,k}(r) - T_{3,\mathrm{exact}}(r) > 0$ on $[r_k, r_{k+1}]$.
- On the infinite ray $r \in [r_K, \infty)$ ($k = K$), $\phi_2 = \phi_3 = G_2 = G_3 = \psi_4 = \psi_7 = H_4 = H_7 = 0$ identically by the compact-support conditions checked in §3, so $L_\sigma = L_\nu = 0$; put $l_B = A_e = t_2 = \tau_{3,K} = T_{3,\mathrm{exact}} = 0$, $\xi_t(r) := \xi_{t,0}^{\mathrm{tail}} + \xi_{t,2}^{\mathrm{tail}}(r^2 - r_K^2) \ge 0$, $\xi_e(r) := \xi_{e,0}^{\mathrm{tail}} + \xi_{e,2}^{\mathrm{tail}}(r^2 - r_K^2) \ge 0$, and $\xi_{te}(r) := \xi_{te}(r_K) \ge 0$ ($\xi_t \equiv 0$ on $k < K$).

Then rearranging $\mathrm{RHS}(X) - r$ (verified symbolically as an 8-variable polynomial identity on every interval of every row in `verify_bernstein.py`) gives **identically**:

$$
\begin{aligned}
\mathrm{RHS}(X) - |F(X)| =\;&\Big(\mu_{00} w_\tau + 2\mu_{01} w_{\tau\eta} + \mu_{11} w_\eta + l_A(r)\sigma_r + L_\nu(r)\nu_r + T_{3,\mathrm{exact}}(r)\tau\Big)\\
&+ \big(\tau_{3,k}(r) - T_{3,\mathrm{exact}}(r) + \xi_t(r)\big)\tau + \big(A_e(r)\eta + l_B(r)\sigma_r + t_2(r)\tau^2\big)\\
&+ \xi_e(r)\eta + \xi_{te}(r)\tau\eta + \begin{pmatrix} 1 & \tau & \eta \end{pmatrix} P_k(r) \begin{pmatrix} 1 \\ \tau \\ \eta \end{pmatrix},
\end{aligned}
$$

where the symmetric $3\times 3$ polynomial matrix $P_k(r) \in \mathbb{Q}[r]^{3\times 3}$ has entries:

$$
\begin{aligned}
P_{22} &= m_{11}, \qquad P_{12}(r) = m_{01} + \frac{3}{2}\phi_3(r) - \frac{1}{2}\xi_{te}(r), \qquad P_{11}(r) = m_{00} + 3\phi_2(r) - t_2(r),\\
P_{02}(r) &= \frac{1}{2}\Big(-2 m_{01} - 2 m_{11} + \gamma_{ve} r^2 - 3 r G_3(r) + 4 H_4(r) - 2 H_7(r) - A_e(r) - \xi_e(r)\Big),\\
P_{01}(r) &= \frac{1}{2}\Big(-2 m_{00} - 2 m_{01} + \gamma_{vt} r^2 + 3\big(\phi_1(r) - \phi_2(r) - \phi_3(r)\big) - 3 r G_2(r) - 4 H_4(r) - \tau_{3,k}(r) - \xi_t(r)\Big),\\
P_{00}(r) &= \lambda_0 + m_{00} + 2 m_{01} + m_{11} - r + (\lambda_1 - \gamma_{vt} - \gamma_{ve})r^2 + \lambda_2 r^4 + \lambda_3 r^6 + 3 r\big(G_2(r) + G_3(r) - G_1(r)\big) + 2 H_7(r).
\end{aligned}
$$

By Sylvester's criterion in the ordered basis $(\eta, \tau, 1)$, $P_k(r) \succ 0$ holds at $r$ if and only if its three leading principal minors $m_{11} > 0$, $M_2(r) := m_{11} P_{11}(r) - P_{12}(r)^2 > 0$ (degree $\le 2$), and $M_3(r) := \det P_k(r) > 0$ (degree $\le 6$) are strictly positive. By Lemma 4.1, $\mathrm{RHS}(X) > |F(X)|$ holds at every $X \in \mathbb{R}^n$ (strict because $(1, \tau, \eta) \ne (0, 0, 0)$). Taking Gaussian expectations and applying Proposition 2.1, Proposition 3.1, and Lemma 2.3 yields

$$
\mathbb{E}|F(X)| < \mathbb{E}[\mathrm{RHS}(X)] = \mathcal{E}(F) < B
$$

across all unit-variance $F \in V_3(\mathbb{R}^n)$ with $\kappa_4(F) \in [s_{\mathrm{lo}}, s_{\mathrm{hi}}]$. Since $\kappa_4(F) = 36m + 54u \in (0, 90]$ for every nonzero $F \in V_3(\mathbb{R}^n)$ ($0 \le u \le m \le 1$), the 22 contiguous slabs covering $[0, 90]$ in `cert_real_501.json` (`113,373 B`, verified in both `verify.py` via integer Sturm sequences and `verify_bernstein.py` via 7,186 Bernstein leaves + exact 8-variable symbolic polynomial expansion across all $22 \times 41 = 902$ intervals, plus 95 adversarial/AST/`-O` controls in `test_controls.py`) prove Theorems 1 and 2 unconditionally across all dimensions $n \ge 1$.

---

## 5. Complex $U(1)$ Phase-Averaging Transfer & Downstream Consequences

### 5.1 Proof of Theorem 3 (**P + C**)

Let $q \in H_{2,1}(\mathbb{C}^n)$ satisfy $\mathbb{E}|q(z)|^2 = 1$ under $z = \frac{1}{\sqrt{2}}(x + iy) \sim \mathcal{CN}(0, I_n)$ ($(x, y) \sim \mathcal{N}(0, I_{2n})$). For each $\theta \in [0, 2\pi)$, put $F_\theta(x, y) := \sqrt{2}\operatorname{Re}(e^{-i\theta} q(z))$.
1. Because $q \in H_{2,1}(\mathbb{C}^n)$ is orthogonal in $L^2(\mathcal{CN}(0, I_n))$ to all polynomials of total degree $\le 2$, $F_\theta \in V_3(\mathbb{R}^{2n})$.
2. Because $q(e^{-i\theta} z) = e^{-i\theta} q(z)$ (bidegree $(2, 1)$ has $U(1)$ charge $2 - 1 = +1$) and $e^{-i\theta} z \stackrel{d}{=} z$, **$F_\theta$ has the exact same law as $F_0$ for every $\theta \in [0, 2\pi)$**.
3. By $U(1)$ charge invariance, $\mathbb{E}[q^2] = \mathbb{E}[q^4] = \mathbb{E}[q^3\bar q] = 0$. Therefore:
   - $\mathbb{E}[F_\theta^2] = \frac{1}{2}\mathbb{E}[(e^{-i\theta} q + e^{i\theta}\bar q)^2] = \mathbb{E}|q|^2 = 1$;
   - $\mathbb{E}[F_\theta^4] = \frac{1}{4}\mathbb{E}[(e^{-i\theta} q + e^{i\theta}\bar q)^4] = \frac{6}{4}\mathbb{E}|q|^4 = \frac{3}{2}(2 + \chi(q)) = 3 + \frac{3}{2}\chi(q)$, so **$\kappa_4(F_\theta) = \frac{3}{2}\chi(q)$ identically for every $\theta$**.
4. Since $\frac{1}{2\pi}\int_0^{2\pi} |\cos(\theta - \arg q)|\,d\theta = \frac{2}{\pi}$, Fubini's theorem gives
   $$\mathbb{E}|q| = \frac{\pi}{2}\int_0^{2\pi} \mathbb{E}|\operatorname{Re}(e^{-i\theta} q)|\,\frac{d\theta}{2\pi} = \frac{\pi}{2\sqrt{2}}\,\mathbb{E}|F_0|.$$

Applying Theorem 1 ($\mathbb{E}|F_0| \le \frac{3999}{5000}$) and Machin's enclosure $\pi_{\mathrm{lo}} < \pi < \pi_{\mathrm{hi}}$ (`verify_pi_bounds`) gives $\mathbb{E}|q| \le \frac{\pi}{2\sqrt{2}}\cdot\frac{3999}{5000} = 0.8883544\dots < \frac{2221}{2500} = 0.8884$. Whenever $\chi(q) \in [\frac{28}{3}, 42]$, $\kappa_4(F_0) = \frac{3}{2}\chi(q) \in [14, 63] \subset [14, 90]$, so Theorem 2 ($\mathbb{E}|F_0| \le \frac{3989}{5000}$) gives $\mathbb{E}|q| \le \frac{\pi}{2\sqrt{2}}\cdot\frac{3989}{5000} = 0.8861330\dots < \frac{4431}{5000} = 0.8862 < \frac{\sqrt{\pi}}{2} = 0.8862269\dots$. $\square$

### 5.2 Proof of Theorem 4 (**P + C**)

All seven rational downstream bounds follow directly by substituting $\rho_0 = \frac{2221}{2500}$ into the already-established reductions of `research/higher-degree/STATUS.md` (with `verify.py` and `verify_bernstein.py` re-checking every inequality and strict next-step bracket in zero-float rational arithmetic):
- **`1.12` & `4.12` ($t = 0$ caps):** $(1000/1403)/\rho_0^2 = \frac{6250000000}{6920775923} = 0.9030779\dots > 0.90307$ and $(500/701)/\rho_0^2 = \frac{3125000000}{3457921541} = 0.9037220\dots > 0.90372$.
- **`4.18a` (Gaussian-buffer direct bound, $(e, \eta) = (\frac{39}{50}, \frac{779}{10000})$):** $(1 - \eta)t^2 + e\rho_0^2 + \frac{\eta^2}{\pi e} < \frac{500}{701}$ holds through $t = \frac{160633}{500000} = 0.321266$ and fails at $0.321267$.
- **`4.18e` (Elliptic lift $\|U\|_2^2 + (\frac{431}{500})^2 t^2 \le \rho_0^2$, `#660`):** Parseval gives $V < \frac{500}{701}$ through $t = \frac{45041147}{100000000} = 0.45041147$ (failing at $+10^{-8}$); sixth-moment clipping (`CLIPPING.md`, $C_6 = \frac{4045313}{100000}$, tangent $\frac{7071}{5000}$) gives $V < \frac{500}{701}$ through $t = \frac{45406137}{100000000} = 0.45406137$ (certified on $[0, \infty)$ by both Sturm and Bernstein, and failing at $+10^{-8}$); and Lean's mass inequality gives $t = \frac{45016597}{100000000} = 0.45016597$.
- **`4.18f` (24 Lean spectral mass witnesses, `#662`):** Starting from $t_{\mathrm{init}} = \frac{45}{100}$ (already inside the Parseval range $0.45041147$!), adaptive 2D $(t, \sqrt{\chi})$ box covering against the 24 witnesses parsed directly from `Grothe/Lower/MassWitnessData.lean` certifies $V < \frac{500}{701}$ through **$t = \frac{45287}{100000} = 0.45287$** (`1,881` boxes) using $\rho_0 = \frac{2221}{2500}$ **alone** (zero OU slope needed), and through **$t = \frac{11331}{25000} = 0.45324$** (`490` boxes) when combined with the independently reviewed `KNG505` linear bound $\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\|q\|_2(1 + \frac{26449}{5000000}\chi)$.

---

## 6. Verification & Replay

All four verification scripts use only the Python 3 standard library, contain **zero floating-point literals/calls** and **zero `assert` statements** (statically audited via `ast` in `test_controls.py`), and run identically under `python3 -IB` and `python3 -IB -O`:

```bash
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/verify.py
python3 -IB -O research/conjecture-K/code/real-stein-501-gemini-8732/verify.py
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/verify_bernstein.py
python3 -IB -O research/conjecture-K/code/real-stein-501-gemini-8732/verify_bernstein.py
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/check_identities_exact.py
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/test_controls.py
```
