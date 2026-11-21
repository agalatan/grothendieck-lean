# One-step Ornstein–Uhlenbeck resolvent and $V_2 \perp V_4$ cross-multiplier bounds for the weak target `(T)` near the Gaussian (Issue #505)

*Author: `gemini-2762` (21 November 2026). Tasks: [#505](https://github.com/agalatan/grothendieck-lean/issues/505), part of [#501](https://github.com/agalatan/grothendieck-lean/issues/501).*
*Ledger status of all new claims in this note: **`P + C, author only`** (pure Python 3 standard-library exact rational verifier [`verify_near_gaussian_505.py`](../../code/near-gaussian-505-gemini-2762/verify_near_gaussian_505.py) with zero floating-point operations; replay output in [`REPLAY.log`](../../code/near-gaussian-505-gemini-2762/REPLAY.log)).*

---

## 0. Summary of results

Let $\gamma_n$ denote the standard Gaussian measure on $\mathbb{R}^n$ ($n \ge 1$), let $V_k(\mathbb{R}^n)$ denote the $k$-th real Wiener chaos, and let $c := \sqrt{2/\pi} = \mathbb{E}|G|$ ($G \sim N(0, 1)$). For any nonzero $F \in V_3(\mathbb{R}^n)$ normalized to $\mathbb{E}[F^2] = 1$, write:
$$\kappa_4(F) := \mathbb{E}[F^4] - 3 \ge 0, \qquad \tau := \frac{\|\nabla F\|^2}{3}, \qquad U := \|\nabla F\|^2 - 3 = 3(\tau - 1) = U_2 + U_4 \in V_2(\mathbb{R}^n) \oplus V_4(\mathbb{R}^n).$$

Previously (`STATUS.md` `3.21 (e9)(iv)`), the weak real third-chaos target
$$\mathbb{E}|F| \le \sqrt{\frac{17}{25}}\,\|F\|_2 \tag{T}$$
near the Gaussian was proved for $\kappa_4(F) \le \frac{91}{500} = 0.182$ and $\operatorname{Var}(\tau) \le \frac{89}{2250} \approx 0.03956$. Issue [#505](https://github.com/agalatan/grothendieck-lean/issues/505) asked whether `(T)` can be pushed across $0.182 < \kappa_4(F) \le 2$, noting that one-step Stein quadratic regression combined with Cauchy–Schwarz stalls near $\kappa_4 \approx 0.82$ because $\|\tau - 1\|_2 = O(\sqrt{\kappa_4})$.

We resolve Issue #505 with a $>4.7\times$ margin over its $\kappa_4 \le 2$ target — and push the $\operatorname{Var}(\tau)$ cone by $47.1\times$ — by combining two exact mechanisms:
1. **Exact one-step Ornstein–Uhlenbeck resolvent identity on $P_\varepsilon|\cdot|$ (§2):** Instead of applying Cauchy–Schwarz to $\mathbb{E}[R_\varepsilon(F) U]$ (which scales as $O(\sqrt{\kappa_4})$), we invert the 1D Ornstein–Uhlenbeck operator $\ell - \frac{k}{3}$ separately on $U_2 \in V_2$ and $U_4 \in V_4$, integrate by parts once in the semigroup parameter $\tau' \in (0, e^{-2\varepsilon}]$ (where both boundary terms vanish identically for every $\varepsilon > 0$ and $x \in \mathbb{R}$), and let $\varepsilon \downarrow 0$ by Dominated Convergence. This expresses $\frac{\mathbb{E}|F|}{c} - 1 + \frac{\kappa_4(F)}{24}$ as an exact quadratic expectation $-\frac{1}{9}\mathbb{E}[\hat{g}_2(F) U U_2 + \hat{g}_4(F) U U_4]$ with uniformly bounded kernels $\hat{g}_2, \hat{g}_4 : \mathbb{R} \to \mathbb{R}$ whose sum $\hat{g}_2 + \hat{g}_4$ is proved strictly decreasing on $[0, \infty)$ by an exact degree-5 sum-of-squares polynomial identity (§3).
2. **Wiener-chaos orthogonality cross-multiplier $2\hat{\gamma} U_2 U_4$ (§4):** Because $U_2 \in V_2(\mathbb{R}^n)$ and $U_4 \in V_4(\mathbb{R}^n)$ are orthogonal in $L^2(\gamma_n)$, $\mathbb{E}[2\hat{\gamma} U_2 U_4] = 0$ for every constant $\hat{\gamma} \in \mathbb{R}$. Subtracting $2\hat{\gamma} U_2 U_4$ inside the pointwise $2 \times 2$ quadratic form on $(U_2, U_4)$ cancels the off-diagonal coupling $\frac{\hat{g}_2(x) + \hat{g}_4(x)}{18}$ near the global minimum of $\hat{g}_2$ ($x \approx 3.43$), shrinking the universal linear $\kappa_4$ slope by a factor of $6.8\times$ down to $\frac{26449}{7500000} \approx 0.00352653$.

### Main Theorems (`P + C, author only`)

- **Theorem 1 (Universal linear $\kappa_4$ bound and `(T)` for $\kappa_4 \le \frac{19}{2} = 9.5$).** For every $n \ge 1$ and every $F \in V_3(\mathbb{R}^n)$,
  $$\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\,\|F\|_2 \left(1 + \frac{26449}{7500000}\,\kappa_4(F)\right), \qquad \kappa_4(F) = \frac{\mathbb{E}[F^4]}{\|F\|_2^4} - 3.$$
  Consequently, for every nonzero $F \in V_3(\mathbb{R}^n)$ with $0 \le \kappa_4(F) \le \frac{19}{2} = 9.5$,
  $$\mathbb{E}|F| < \sqrt{\frac{17}{25}}\,\|F\|_2.$$
  This expands the certified near-Gaussian $\kappa_4$ window for `(T)` by $52.2\times$ (from $\frac{91}{500} = 0.182$ to $\frac{19}{2} = 9.5$), resolving Issue #505 ($\kappa_4 \le 2$) and narrowing the open kurtosis window of [#501](https://github.com/agalatan/grothendieck-lean/issues/501) outside `3.21 (e1)`–`(e6)` from $0.182 < \kappa_4 < 46.6$ to $9.5 < \kappa_4 < 46.6$.

- **Theorem 2 (Universal linear $\operatorname{Var}(\tau)$ bound and `(T)` for $\operatorname{Var}(\tau) \le \frac{373}{200} = 1.865$ at unit variance).** For every $n \ge 1$ and every nonzero $F \in V_3(\mathbb{R}^n)$ normalized to $\|F\|_2 = 1$, with $\tau = \|\nabla F\|^2 / 3$,
  $$\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}} \left(1 + \frac{717}{40000}\,\operatorname{Var}(\tau)\right)$$
  (equivalently, $\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\,\|F\|_2 \left(1 + \frac{717}{40000}\,\frac{\operatorname{Var}(\|\nabla F\|^2/3)}{\|F\|_2^4}\right)$ for every nonzero $F \in V_3(\mathbb{R}^n)$). Consequently, for $\|F\|_2 = 1$, $\mathbb{E}|F| < \sqrt{\frac{17}{25}}$ whenever $0 \le \operatorname{Var}(\tau) \le \frac{373}{200} = 1.865$ (in particular whenever $\operatorname{Var}(\tau) \le \frac{93}{50} = 1.86$, a $47.1\times$ expansion over $\frac{89}{2250} \approx 0.03956$).

- **Corollary 3 (Cartan's isoparametric cubics).** All four Cartan isoparametric harmonic cubics (dimensions $n \in \{5, 8, 14, 26\}$, where $\|\nabla F(x)\|^2 = \frac{3\|x\|^4}{n(n+2)}$ on $\mathbb{R}^n$ after unit-$L^2(\gamma_n)$ normalization) satisfy $\kappa_4(F) = \frac{36(n+4)}{n(n+2)} \in \left\{\frac{324}{35}, \frac{27}{5}, \frac{81}{28}, \frac{135}{91}\right\} \subset (0, \frac{19}{2})$ and $\operatorname{Var}(\tau) = \frac{8(n+3)}{n(n+2)} \in \left\{\frac{64}{35}, \frac{11}{10}, \frac{17}{28}, \frac{29}{91}\right\} \subset (0, \frac{93}{50})$, so all four lie strictly inside both Theorem 1 and Theorem 2 (including $n = 26$, which lies outside the $n \le 15$ harmonic slicing regime of `3.21 (e3)`).

- **Theorem 4 (Complex cubic chaos $H_{2,1}(\mathbb{C}^n)$ phase-averaging bound and sharper global radius $\rho_* \le \frac{4571}{5000} = 0.9142$).** For every $n \ge 1$ and every nonzero $q \in H_{2,1}(\mathbb{C}^n)$ with fourth-cumulant ratio $\chi(q) := \frac{\mathbb{E}|q|^4}{\|q\|_2^4} - 2 \ge 0$,
  $$\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\,\|q\|_2 \left(1 + \frac{26449}{5000000}\,\chi(q)\right).$$
  In particular:
  1. $\mathbb{E}|q| < \frac{9074}{10000}\,\|q\|_2$ for all $\chi(q) \in [0, \frac{9}{2}]$, and $\mathbb{E}|q| < \frac{9121}{10000}\,\|q\|_2$ for all $\chi(q) \in [0, \frac{11}{2}]$ — completely bypassing the binding peak rows of both `cert_915.json` ($\chi \in [\frac{15}{4}, \frac{9}{2}]$) and `cert_916.json` ($\chi \in [4, \frac{17}{4}]$) without any radial spline or higher-order Stein hierarchy.
  2. Combining $\chi \in [0, \frac{11}{2}]$ ($< 0.9121$) with Row 7 ($\chi \in [\frac{11}{2}, 7]$, $\le 0.9141874875$) and Rows 8–13 ($\chi \in [7, 42]$, $\le 0.9140797709$) of `cert_915.json` (`KSR`; or equivalently Rows 17–22 of `cert_916.json` on $[7, 42]$, $\le 0.9141151244$) sharpens the global unconditional radius on $H_{2,1}(\mathbb{C}^n)$ from $\frac{1829}{2000} = 0.9145$ to
     $$\mathbb{E}|q| \le \frac{4571}{5000}\,\|q\|_2 = 0.9142\,\|q\|_2 \qquad \forall\, q \in H_{2,1}(\mathbb{C}^n)$$
     (strict when $q \ne 0$). For the degree-5 programme (`../higher-degree/STATUS.md` `4.12`, `4.18 (a)`), since $\rho_* \le \rho_0 = \frac{4571}{5000}$ implies $\frac{500/701}{\rho_0^2} \le \frac{500/701}{\rho_*^2}$, every cubic weight $\lambda_1 \le \frac{500/701}{(4571/5000)^2} = \frac{12500000000}{14646722741} > 0.85343$ is certified to pass the necessary $t = 0$ radius test $\lambda_1 \rho_*^2 \le \frac{500}{701}$, and the unconditional Gaussian-buffer bound for the capped game $(1, -\frac{39}{50}, \frac{779}{10000})$ extends to $t \le \frac{2527}{10000} = 0.2527$.
  3. Even without `cert_915.json` (using only Theorem 4 on $\chi \in [0, 6]$, where $\frac{\sqrt{\pi}}{2}(1 + \frac{26449}{5000000}\cdot 6) < 0.914355$, together with the independently reviewed Level-2 flank Rows 16–22 of `cert_916.json` on $\chi \in [6, 42]$, where the maximum is $\le 0.9147094457$), one already obtains $\mathbb{E}|q| \le \frac{4574}{5000}\,\|q\|_2 = 0.9148\,\|q\|_2$.

---

## 1. Malliavin contractions and $V_2 \oplus V_4$ norms on $V_3(\mathbb{R}^n)$

Write a unit-variance element $F \in V_3(\mathbb{R}^n)$ as a symmetric multiple Wiener–Itô integral $F = \frac{1}{\sqrt{6}}\,I_3(T)$, where $T \in (\mathbb{R}^n)^{\otimes 3}$ is fully symmetric with $\|T\|_{\mathrm{HS}}^2 = \sum_{i,j,k=1}^n T_{ijk}^2 = 1$. Let $(T_r)_{ab} := T_{rab}$ ($1 \le r \le n$) denote the $r$-th symmetric $n \times n$ slice matrix, let $M := \sum_{r=1}^n T_r^2 = T \otimes_2 T$ ($\operatorname{Tr} M = \|T\|_{\mathrm{HS}}^2 = 1$), and put
$$m := \operatorname{Tr}(M^2) = \|T \otimes_2 T\|_{\mathrm{HS}}^2, \qquad u := \|T \tilde{\otimes}_1 T\|_{\mathrm{HS}}^2,$$
where $(T \otimes_1 T)_{abcd} = \sum_{r=1}^n T_{rab} T_{rcd}$ has $\|T \otimes_1 T\|_{\mathrm{HS}}^2 = \sum_{a,b,c,d} (\sum_r T_{rab} T_{rcd})^2 = \operatorname{Tr}(M^2) = m$, and $T \tilde{\otimes}_1 T$ is its orthogonal projection onto fully symmetric 4-tensors in $(\mathbb{R}^n)^{\otimes 4}$. Since orthogonal projection is a contraction in Hilbert–Schmidt norm,
$$0 \le u \le m. \tag{1.1}$$

**Lemma 1.1 (Exact chaos decomposition of $\|\nabla F\|^2 - 3$).** *For every unit $F = \frac{1}{\sqrt{6}}\,I_3(T) \in V_3(\mathbb{R}^n)$,*
$$U := \|\nabla F\|^2 - 3 = U_2 + U_4, \qquad U_2 = 6\,I_2(M) \in V_2(\mathbb{R}^n), \qquad U_4 = \frac{3}{2}\,I_4(T \tilde{\otimes}_1 T) \in V_4(\mathbb{R}^n). \tag{1.2}$$
*With $A := \|U_2\|_2$ and $C := \|U_4\|_2$, one has $\mathbb{E}[U_2 U_4] = 0$ and:*
$$A^2 = 72 m, \quad C^2 = 54 u, \quad \kappa_4(F) = 36 m + 54 u = \frac{1}{2} A^2 + C^2, \quad \operatorname{Var}(\tau) = 8 m + 6 u = \frac{A^2 + C^2}{9}, \quad 0 \le C^2 \le \frac{3}{4} A^2. \tag{1.3}$$

*Proof.* Since $\partial_r F = \frac{3}{\sqrt{6}}\,I_2(T_r) = \sqrt{\frac{3}{2}}\,I_2(T_r)$, the Wiener–Itô product formula for symmetric 2-tensors gives
$$I_2(T_r)^2 = 2\|T_r\|_{\mathrm{HS}}^2 + 4\,I_2(T_r \tilde{\otimes}_1 T_r) + I_4(T_r \tilde{\otimes}_0 T_r),$$
where $(T_r \tilde{\otimes}_1 T_r)_{ab} = (T_r^2)_{ab}$ (already symmetric since $T_r$ is symmetric) and $\sum_{r=1}^n T_r \tilde{\otimes}_0 T_r = T \tilde{\otimes}_1 T$. Multiplying by $\frac{3}{2}$ and summing over $r = 1, \dots, n$ yields $\|\nabla F\|^2 = 3\|T\|_{\mathrm{HS}}^2 + 6\,I_2(M) + \frac{3}{2}\,I_4(T \tilde{\otimes}_1 T) = 3 + U_2 + U_4$, proving (1.2). By Wiener-chaos orthogonality ($V_2 \perp V_4$) and the isometry $\mathbb{E}[I_k(S)^2] = k!\,\|S\|_{\mathrm{HS}}^2$ for symmetric $k$-tensors,
$$A^2 = 36 \cdot 2!\,\|M\|_{\mathrm{HS}}^2 = 72 m, \qquad C^2 = \frac{9}{4} \cdot 4!\,\|T \tilde{\otimes}_1 T\|_{\mathrm{HS}}^2 = 54 u, \qquad \operatorname{Var}(\tau) = \frac{\mathbb{E}[U^2]}{9} = \frac{A^2 + C^2}{9} = 8 m + 6 u.$$
Similarly, expanding $I_3(T)^2 = \sum_{p=0}^3 p!\binom{3}{p}^2 I_{6-2p}(T \tilde{\otimes}_p T)$ and dividing by $6$ gives
$$F^2 - 1 = 3\,I_2(M) + \frac{3}{2}\,I_4(T \tilde{\otimes}_1 T) + \frac{1}{6}\,I_6(T \tilde{\otimes}_0 T) = \frac{1}{2}U_2 + U_4 + \frac{1}{6}\,I_6(T \tilde{\otimes}_0 T).$$
Since $\mathbb{E}[F^4] = \frac{1}{3}\mathbb{E}[3 F^2 \|\nabla F\|^2] = 3 + \mathbb{E}[(F^2 - 1)U]$ and $V_6(\mathbb{R}^n) \perp V_2(\mathbb{R}^n) \oplus V_4(\mathbb{R}^n)$, taking the inner product with $U = U_2 + U_4$ immediately yields
$$\kappa_4(F) = \mathbb{E}[(F^2 - 1)(U_2 + U_4)] = \frac{1}{2}\|U_2\|_2^2 + \|U_4\|_2^2 = \frac{1}{2}A^2 + C^2 = 36 m + 54 u.$$
Finally, (1.1) gives $0 \le C^2 = 54 u \le 54 m = \frac{3}{4}(72 m) = \frac{3}{4} A^2$. $\square$

---

## 2. Exact one-step Ornstein–Uhlenbeck resolvent identity

Let $L = \Delta - x \cdot \nabla$ denote the Ornstein–Uhlenbeck generator on $\mathbb{R}^n$ with semigroup $(P_t)_{t \ge 0}$, and let $\ell := -\partial_x^2 + x \partial_x = -L_1$ denote the positive 1D Ornstein–Uhlenbeck operator ($\ell \operatorname{He}_r = r \operatorname{He}_r$).

**Lemma 2.1 (One-step OU resolvent on $V_3$).** *Let $F \in V_3(\mathbb{R}^n)$ satisfy $\mathbb{E}[F^2] = 1$, let $U = \|\nabla F\|^2 - 3$, and let $W_k \in V_k(\mathbb{R}^n)$ ($k \ge 1$). For every $f \in C^2(\mathbb{R})$ such that $f, f', f''$ have polynomial growth,*
$$\mathbb{E}\!\left[\left(\ell f - \frac{k}{3} f\right)(F)\, W_k\right] = \frac{1}{3}\,\mathbb{E}\big[f''(F)\, U\, W_k\big]. \tag{2.1}$$

*Proof.* By the chain rule and $LF = -3F$,
$$L(f(F)) = f''(F)\|\nabla F\|^2 + f'(F)LF = f''(F)(3 + U) - 3 F f'(F) = -3(\ell f)(F) + f''(F) U.$$
Since $W_k \in V_k(\mathbb{R}^n)$ satisfies $LW_k = -k W_k$ and $L$ is symmetric in $L^2(\gamma_n)$ on smooth functions of polynomial growth,
$$-k\,\mathbb{E}[f(F) W_k] = \mathbb{E}[f(F) LW_k] = \mathbb{E}[L(f(F)) W_k] = -3\,\mathbb{E}[(\ell f)(F) W_k] + \mathbb{E}[f''(F) U W_k].$$
Rearranging and dividing by $3$ gives (2.1). $\square$

**Proposition 2.2 (Exact unsmoothed one-step identity for $\mathbb{E}|F|$).** *For every $n \ge 1$ and every $F \in V_3(\mathbb{R}^n)$ with $\mathbb{E}[F^2] = 1$,*
$$\frac{\mathbb{E}|F|}{c} - 1 = -\frac{\kappa_4(F)}{24} - \frac{1}{9}\,\mathbb{E}\big[\hat{g}_2(F) U U_2 + \hat{g}_4(F) U U_4\big], \qquad c = \sqrt{\frac{2}{\pi}}, \tag{2.2}$$
*where for all $x \in \mathbb{R}$,*
$$\hat{g}_2(x) := -\frac{3}{16} + \int_0^1 \frac{9w - w^{-1/3}}{16}\,(1 - w)^{-1/2} e^{-\frac{w x^2}{2(1 - w)}}\,dw, \tag{2.3}$$
$$\hat{g}_4(x) := -\frac{3}{8} + \int_0^1 \frac{9w + w^{-2/3}}{20}\,(1 - w)^{-1/2} e^{-\frac{w x^2}{2(1 - w)}}\,dw. \tag{2.4}$$

*Proof.* Fix $\varepsilon > 0$, put $\psi_\varepsilon := P_\varepsilon|\cdot| \in C^\infty(\mathbb{R})$, and set $\theta_\varepsilon := e^{-2\varepsilon} \in (0, 1)$. By $\gamma_1$-invariance of $P_\varepsilon$, $\mathbb{E}[\psi_\varepsilon(G)] = \mathbb{E}|G| = c$. Since $\Psi_\varepsilon(x) := \int_0^\infty (P_t \psi_\varepsilon(x) - c)\,dt = \int_\varepsilon^\infty (P_r|\cdot|(x) - c)\,dr$ solves $\ell \Psi_\varepsilon = \psi_\varepsilon - c$, the smooth function $\Phi_\varepsilon := -\Psi_\varepsilon'$ solves the 1D Stein equation $\Phi_\varepsilon'(x) - x\Phi_\varepsilon(x) = \psi_\varepsilon(x) - c$. Using $\partial_x^2(P_r|\cdot|)(x) = c\,\frac{e^{-2r}}{\sqrt{1 - e^{-2r}}} e^{-\frac{e^{-2r}x^2}{2(1 - e^{-2r})}}$ and substituting $\theta = e^{-2r}$ ($e^{-2r}\,dr = \frac{1}{2}\,d\theta$),
$$K_\varepsilon(x) := -\frac{\Phi_\varepsilon'(x)}{c} = \frac{1}{2} \int_0^{\theta_\varepsilon} (1 - \theta)^{-1/2} e^{-\frac{\theta x^2}{2(1 - \theta)}}\,d\theta.$$
On $V_3(\mathbb{R}^n)$, Gaussian integration by parts ($\mathbb{E}[F \Phi_\varepsilon(F)] = \frac{1}{3}\mathbb{E}[\Phi_\varepsilon'(F)\|\nabla F\|^2]$) gives
$$\frac{\mathbb{E}[\psi_\varepsilon(F)]}{c} - 1 = \frac{1}{c}\,\mathbb{E}\!\left[\Phi_\varepsilon'(F)\left(1 - \frac{\|\nabla F\|^2}{3}\right)\right] = \frac{1}{3}\,\mathbb{E}[K_\varepsilon(F) U]. \tag{2.5}$$

Now expand the Mehler kernel in Hermite polynomials:
$$(1 - \theta)^{-1/2} e^{-\frac{\theta x^2}{2(1 - \theta)}} = \sum_{m=0}^\infty \frac{(-\theta)^m}{2^m m!}\,\operatorname{He}_{2m}(x) \qquad (\theta \in [0, 1)).$$
Isolating the $m = 0$ and $m = 1$ terms ($\operatorname{He}_0(x) = 1$, $\operatorname{He}_2(x) = x^2 - 1$) defines the Hermite-rank $\ge 4$ integrand
$$H(\theta, x) := (1 - \theta)^{-1/2} e^{-\frac{\theta x^2}{2(1 - \theta)}} - 1 + \frac{\theta}{2}(x^2 - 1) = \sum_{m=2}^\infty \frac{(-\theta)^m}{2^m m!}\,\operatorname{He}_{2m}(x),$$
and $R_\varepsilon(x) := \frac{1}{2}\int_0^{\theta_\varepsilon} H(\theta, x)\,d\theta$. Since $\mathbb{E}[U] = 0$, $\mathbb{E}[(F^2 - 1)U] = \kappa_4(F)$ (§1), and $\frac{1}{3}\cdot\frac{1}{2}\int_0^{\theta_\varepsilon}(-\frac{\theta}{2})\,d\theta = -\frac{\theta_\varepsilon^2}{24}$, (2.5) becomes
$$\frac{\mathbb{E}[\psi_\varepsilon(F)]}{c} - 1 = -\frac{\theta_\varepsilon^2}{24}\,\kappa_4(F) + \frac{1}{3}\,\mathbb{E}[R_\varepsilon(F)(U_2 + U_4)]. \tag{2.6}$$

Next, for $k \in \{2, 4\}$, define on $\mathbb{R}$:
$$f_{k,\varepsilon}(x) := \frac{3}{2(6 + k)} \int_0^{\theta_\varepsilon} \left[\left(\frac{\tau'}{\theta_\varepsilon}\right)^{-1 - k/6} - 1\right] H(\tau', x)\,d\tau'. \tag{2.7}$$
Because $H(\tau', x) = O(\tau'^2(1 + x^4))$ uniformly on compact subsets of $[0, \theta_\varepsilon] \times \mathbb{R}$ and $-1 - \frac{k}{6} \in \{-\frac{4}{3}, -\frac{5}{3}\} > -2$, the integrand of (2.7) and its $x$-derivatives are bounded by $C_r \tau'^{1 - k/6}(1 + |x|^{4+r})$ ($1 - \frac{k}{6} \in \{\frac{2}{3}, \frac{1}{3}\} > 0$). Hence $f_{k,\varepsilon} \in C^\infty(\mathbb{R})$ with polynomial growth. Moreover, for each $m \ge 2$,
$$\frac{3}{2(6 + k)} \int_0^{\theta_\varepsilon} \left[\left(\frac{\tau'}{\theta_\varepsilon}\right)^{-1 - k/6} - 1\right] \tau'^m\,d\tau' = \frac{3\theta_\varepsilon^{m+1}}{2(6 + k)}\left(\frac{1}{m - k/6} - \frac{1}{m + 1}\right) = \frac{1}{2m - k/3}\cdot\frac{\theta_\varepsilon^{m+1}}{2(m + 1)}.$$
Since $(\ell - \frac{k}{3})\operatorname{He}_{2m} = (2m - \frac{k}{3})\operatorname{He}_{2m}$ and the Hermite series of $H(\tau', x)$ converges absolutely on $[0, \theta_\varepsilon]$ ($\theta_\varepsilon < 1$), we obtain $(\ell - \frac{k}{3})f_{k,\varepsilon} = R_\varepsilon$ pointwise on $\mathbb{R}$. Applying Lemma 2.1 to $W_k = U_k$ ($k \in \{2, 4\}$) in (2.6) gives
$$\frac{\mathbb{E}[\psi_\varepsilon(F)]}{c} - 1 = -\frac{\theta_\varepsilon^2}{24}\,\kappa_4(F) + \frac{1}{9}\,\mathbb{E}\big[f_{2,\varepsilon}''(F) U U_2 + f_{4,\varepsilon}''(F) U U_4\big]. \tag{2.8}$$

We now compute $f_{k,\varepsilon}''(x)$ explicitly by a single integration by parts in $\tau'$. Differentiating $H(\tau', x)$ twice in $x$ gives
$$\partial_x^2 H(\tau', x) = \tau' - \tau'(1 - \tau')^{-3/2}\left(1 - \frac{\tau' x^2}{1 - \tau'}\right) e^{-\frac{\tau' x^2}{2(1 - \tau')}}.$$
Putting $B(\tau', x) := 2\tau'^{1/2}(1 - \tau')^{-1/2} e^{-\frac{\tau' x^2}{2(1 - \tau')}}$, direct differentiation in $\tau'$ yields
$$\partial_{\tau'} B(\tau', x) = \tau'^{-1/2}(1 - \tau')^{-3/2}\left(1 - \frac{\tau' x^2}{1 - \tau'}\right) e^{-\frac{\tau' x^2}{2(1 - \tau')}},$$
so $\partial_x^2 H(\tau', x) = \tau' - \tau'^{3/2} \partial_{\tau'} B(\tau', x)$. Substituting into $f_{k,\varepsilon}''(x)$:
1. The linear $\tau'$ term integrates directly to
   $$\frac{3}{2(6 + k)} \int_0^{\theta_\varepsilon} \left[\left(\frac{\tau'}{\theta_\varepsilon}\right)^{-1 - k/6} - 1\right] \tau'\,d\tau' = \frac{3\theta_\varepsilon^2}{2(6 + k)}\left(\frac{1}{1 - k/6} - \frac{1}{2}\right) = \frac{3\theta_\varepsilon^2}{4(6 - k)}.$$
2. For the $-\tau'^{3/2}\partial_{\tau'} B(\tau', x)$ term, write $M_k(\tau') := \theta_\varepsilon^{1 + k/6}\tau'^{1/2 - k/6} - \tau'^{3/2}$. At $\tau' \downarrow 0$, $M_k(\tau') B(\tau', x) = O(\tau'^{1 - k/6}) \to 0$ since $1 - \frac{k}{6} > 0$; at $\tau' = \theta_\varepsilon < 1$, $M_k(\theta_\varepsilon) = 0$ while $B(\theta_\varepsilon, x)$ is finite. Thus **both boundary terms vanish identically** for every $\varepsilon > 0$ and every $x \in \mathbb{R}$, and integration by parts gives
   $$-\int_0^{\theta_\varepsilon} M_k(\tau') \partial_{\tau'} B(\tau', x)\,d\tau' = \int_0^{\theta_\varepsilon} M_k'(\tau') B(\tau', x)\,d\tau' = \int_0^{\theta_\varepsilon} \left[\frac{3 - k}{3}\theta_\varepsilon^{1 + k/6}\tau'^{-k/6} - 3\tau'\right] (1 - \tau')^{-1/2} e^{-\frac{\tau' x^2}{2(1 - \tau')}}\,d\tau'.$$

Changing variables to $w = \tau'/\theta_\varepsilon \in (0, 1)$ multiplies both terms inside the bracket by $\theta_\varepsilon^2$, giving for all $\varepsilon > 0$ and $x \in \mathbb{R}$:
$$-f_{k,\varepsilon}''(x) = -\frac{3\theta_\varepsilon^2}{4(6 - k)} + \frac{\theta_\varepsilon^2}{2(6 + k)} \int_0^1 \big(9w - (3 - k)w^{-k/6}\big)(1 - \theta_\varepsilon w)^{-1/2} e^{-\frac{\theta_\varepsilon w x^2}{2(1 - \theta_\varepsilon w)}}\,dw. \tag{2.9}$$
Setting $k = 2$ and $k = 4$ at $\theta_\varepsilon = 1$ matches $\hat{g}_2(x)$ in (2.3) and $\hat{g}_4(x)$ in (2.4). Moreover, since $\theta_\varepsilon \in (0, 1)$, $(1 - \theta_\varepsilon w)^{-1/2} \le (1 - w)^{-1/2}$ and $e^{-\frac{\theta_\varepsilon w x^2}{2(1 - \theta_\varepsilon w)}} \in (0, 1]$, the integrand of (2.9) is uniformly dominated for all $\varepsilon > 0$ and $x \in \mathbb{R}$ by the $L^1((0, 1), dw)$ function $\frac{|9w - (3 - k)w^{-k/6}|}{2(6 + k)}(1 - w)^{-1/2}$. Thus $\sup_{\varepsilon > 0,\, x \in \mathbb{R}} |f_{k,\varepsilon}''(x)| < \infty$ and $-f_{k,\varepsilon}''(x) \to \hat{g}_k(x)$ pointwise for every $x \in \mathbb{R}$ (including $x = 0$) as $\varepsilon \downarrow 0$. Since $\psi_\varepsilon(F) \to |F|$ in $L^1(\gamma_n)$ and $U U_k \in L^1(\gamma_n)$, Dominated Convergence in (2.8) proves (2.2). $\square$

*(Independent rational cross-check: Part 4 of `verify_near_gaussian_505.py` encloses the 1D integral on the right-hand side of (2.2) for $F = \operatorname{He}_3(Z)/\sqrt{6}$, where $\kappa_4 = 90$, $U_2(z) = 6(z^2 - 1)$ and $U_4(z) = \frac{3}{2}(z^4 - 6z^2 + 3)$, and verifies overlap with the exact closed form $\frac{\mathbb{E}|F|}{c} - (1 - \frac{90}{24}) = \frac{1 + 4e^{-3/2}}{\sqrt{6}} + \frac{11}{4} \approx 3.522618316$, while rejecting a flipped sign in Negative Control 10.)*

---

## 3. Singularity-free coordinates and exact SOS monotonicity of $\hat{g}_2 + \hat{g}_4$

Both $\hat{g}_2(x)$ and $\hat{g}_4(x)$ are even functions of $x$, so it suffices to analyze $x \ge 0$. Split the integral over $w \in (0, 1)$ at $w = \frac{1}{2}$:
- On $w \in (0, \frac{1}{2}]$, substitute $w = u^3$ ($u \in (0, 2^{-1/3}]$, $dw = 3 u^2\,du$), removing all fractional powers $w^{-1/3} = u^{-1}$ and $w^{-2/3} = u^{-2}$:
  $$\frac{9w - w^{-1/3}}{16}\,dw = \frac{3}{16}\,u(9u^4 - 1)\,du, \qquad \frac{9w + w^{-2/3}}{20}\,dw = \frac{3}{20}(1 + 9u^5)\,du.$$
- On $w \in [\frac{1}{2}, 1)$, substitute $1 - w = v^2$ ($v \in (0, 2^{-1/2}]$, $(1 - w)^{-1/2}\,dw = -2\,dv$), removing the $(1 - w)^{-1/2}$ endpoint singularity. Notice that on $w \in [\frac{1}{2}, 1)$, $9w - w^{-1/3} \ge \frac{9}{2} - 2^{1/3} > 3 > 0$, so **the $\hat{g}_2$ kernel is strictly positive throughout $[\frac{1}{2}, 1)$**.

**Lemma 3.1 (Exact SOS positivity and monotonicity of $\hat{g}_4$ and $\hat{g}_2 + \hat{g}_4$).** *For all $w \in (0, 1)$, put $u := w^{1/3} \in (0, 1)$. The sum of the integrand weights of $\hat{g}_2$ and $\hat{g}_4$ satisfies the exact polynomial sum-of-squares identity:*
$$\frac{9w - w^{-1/3}}{16} + \frac{9w + w^{-2/3}}{20} = u^{-2}\left(\frac{1}{20} - \frac{u}{16} + \frac{81}{80}u^5\right) = u^{-2}\left[\frac{1}{30} + \frac{1}{80}(3u - 1)^2\left(9u^3 + 6u^2 + 3u + \frac{4}{3}\right)\right] \ge \frac{1}{30}\,w^{-2/3} > 0. \tag{3.1}$$
*Consequently:*
1. $\hat{g}_4(x) = -\frac{3}{8} + G_4(x)$ and $\hat{g}_2(x) + \hat{g}_4(x) = -\frac{9}{16} + G_{\mathrm{sum}}(x)$, where $G_4(x) > 0$ and $G_{\mathrm{sum}}(x) > 0$ are **strictly decreasing** functions of $x \in [0, \infty)$ with $\lim_{x \to \infty} G_4(x) = \lim_{x \to \infty} G_{\mathrm{sum}}(x) = 0$.
2. $\hat{g}_2(x) = -\frac{3}{16} - G_{2,\mathrm{neg}}(x) + G_{2,\mathrm{pos}}(x)$, where $G_{2,\mathrm{neg}}(x) := \int_0^{9^{-1/4}} \frac{3}{16}u(1 - 9u^4)(1 - u^3)^{-1/2} e^{-\frac{u^3 x^2}{2(1 - u^3)}}\,du > 0$ and $G_{2,\mathrm{pos}}(x) > 0$ are **both strictly decreasing** functions of $x \in [0, \infty)$ vanishing as $x \to \infty$.

*Proof.* Expanding the right-hand side of $80(\frac{1}{20} - \frac{u}{16} + \frac{81}{80}u^5 - \frac{1}{30}) = \frac{4}{3} - 5u + 81u^5$ and $(9u^2 - 6u + 1)(9u^3 + 6u^2 + 3u + \frac{4}{3}) = 81u^5 + (54 - 54)u^4 + (27 - 36 + 9)u^3 + (12 - 18 + 6)u^2 + (-8 + 3)u + \frac{4}{3} = 81u^5 - 5u + \frac{4}{3}$ proves (3.1) identically (checked at 6 rational nodes in `verify_foundations()`). Since $x \mapsto e^{-\frac{w x^2}{2(1 - w)}}$ is strictly decreasing on $[0, \infty)$ for every $w \in (0, 1)$ and every integrand in $G_4, G_{\mathrm{sum}}, G_{2,\mathrm{neg}}, G_{2,\mathrm{pos}}$ is nonnegative and nonzero, monotonicity and the $x \to \infty$ limits follow by Monotone/Dominated Convergence. $\square$

Lemma 3.1 eliminates interval-subtraction cancellation in $\hat{g}_2 + \hat{g}_4$ and reduces bounding $(\hat{g}_2, \hat{g}_4, \hat{g}_2 + \hat{g}_4)$ across any interval $[x_a, x_b] \subset [0, \infty]$ ($x_b$ possibly $+\infty$, where $G_*(\infty) = 0$) to endpoint evaluations of monotone functions:
$$\hat{g}_2(x) \ge -\frac{3}{16} - G_{2,\mathrm{neg}}(x_a) + G_{2,\mathrm{pos}}(x_b), \qquad \hat{g}_4(x) \ge -\frac{3}{8} + G_4(x_b), \qquad -\frac{9}{16} + G_{\mathrm{sum}}(x_b) \le \hat{g}_2(x) + \hat{g}_4(x) \le -\frac{9}{16} + G_{\mathrm{sum}}(x_a). \tag{3.2}$$

---

## 4. Wiener-chaos orthogonality cross-multiplier and $2 \times 2$ Schur-complement certification

**Lemma 4.1 ($2 \times 2$ Schur-complement envelope with $U_2 \perp U_4$ cross-multiplier).** *Suppose real constants $(\hat{\alpha}, \hat{\beta}, \hat{\gamma})$ satisfy, for all $x \ge 0$,*
$$d_1(x) := \hat{\alpha} + \frac{\hat{g}_2(x)}{9} > 0, \qquad d_2(x) := \hat{\beta} + \frac{\hat{g}_4(x)}{9} > 0, \qquad d_1(x)\,d_2(x) \ge \left(\frac{\hat{g}_2(x) + \hat{g}_4(x)}{18} - \hat{\gamma}\right)^2. \tag{4.1}$$
*Then for every $n \ge 1$ and every $F \in V_3(\mathbb{R}^n)$ with $\mathbb{E}[F^2] = 1$,*
$$\frac{\mathbb{E}|F|}{c} - 1 \le -\frac{\kappa_4(F)}{24} + \hat{\alpha} A^2 + \hat{\beta} C^2. \tag{4.2}$$

*Proof.* Expanding $U = U_2 + U_4$, for any real numbers $(u_2, u_4)$ and $x \in \mathbb{R}$,
$$\hat{\alpha} u_2^2 + \hat{\beta} u_4^2 + \frac{1}{9}\big(\hat{g}_2(x)(u_2 + u_4)u_2 + \hat{g}_4(x)(u_2 + u_4)u_4\big) - 2\hat{\gamma} u_2 u_4 = d_1(|x|) u_2^2 + 2\left(\frac{\hat{g}_2(|x|) + \hat{g}_4(|x|)}{18} - \hat{\gamma}\right) u_2 u_4 + d_2(|x|) u_4^2 \ge 0$$
by the $2 \times 2$ positive-semidefiniteness condition (4.1) and evenness of $\hat{g}_2, \hat{g}_4$. Evaluating at $(x, u_2, u_4) = (F, U_2, U_4)$, taking expectations under $\gamma_n$, and using $\mathbb{E}[U_2 U_4] = 0$ (since $U_2 \in V_2(\mathbb{R}^n) \perp V_4(\mathbb{R}^n) \ni U_4$) yields
$$-\frac{1}{9}\,\mathbb{E}\big[\hat{g}_2(F) U U_2 + \hat{g}_4(F) U U_4\big] = -\frac{1}{9}\,\mathbb{E}\big[\hat{g}_2(F) U U_2 + \hat{g}_4(F) U U_4\big] + 2\hat{\gamma}\,\mathbb{E}[U_2 U_4] \le \hat{\alpha}\,\mathbb{E}[U_2^2] + \hat{\beta}\,\mathbb{E}[U_4^2] = \hat{\alpha} A^2 + \hat{\beta} C^2.$$
Substituting this bound into Proposition 2.2 gives (4.2). $\square$

*(Why $\hat{\gamma} \ne 0$ is decisive: near $x \approx 3.43$, $\hat{g}_2(x)/9$ reaches its global minimum $\approx -0.022446$, while $(\hat{g}_2(x) + \hat{g}_4(x))/18 \approx -0.0288$. With $\hat{\gamma} = 0$, forcing $d_1(x) d_2(x) \ge (0.0288)^2$ inflates $\hat{\alpha}$ and $\hat{\beta}$, limiting $\kappa_4$ to $\approx 1.4$; setting $\hat{\gamma} \approx -0.02877$ zeroes out the off-diagonal coupling right where $d_1(x)$ is smallest while keeping $|-\frac{1}{32} - \hat{\gamma}| \approx 0.00248$ tiny as $x \to \infty$. Negative Control 1 in `verify_near_gaussian_505.py` confirms that setting $\hat{\gamma} = 0$ fails immediately.)*

### Exact outward fixed-point certification (`verify_near_gaussian_505.py`)

To certify (4.1) across the entire half-line $[0, \infty)$ with **zero floating-point arithmetic**:
1. Set integer fixed-point scale $S = 10^{15}$. Every exponential $e^{-z}$ ($z = z_{\mathrm{num}}/z_{\mathrm{den}} \ge 0$) is enclosed in `[lo/S, hi/S]` by halving $z = 2^k y$ until $y \in (0, \frac{1}{16}]$, evaluating the alternating Leibniz partial sums $S_9(y) \le e^{-y} \le S_8(y)$ with outward integer floor/ceiling arithmetic at intermediate scale $S_2 = 10^{20}$, and squaring $k$ times outward; for $z \ge 42$, `0 <= exp(-z) <= 1/S` is certified from $e^{42} = (e^{42/256})^{256} \ge (\frac{149}{128})^{256} > 10^{15}$.
2. On $w \in (0, 1)$, let $u_{\mathrm{top}} = \lfloor S \cdot 2^{-1/3} \rfloor / S$ and $v_{\mathrm{top}} = \lfloor S \cdot 2^{-1/2} \rfloor / S$ via exact integer binary-search cube root `icbrt_floor` and `math.isqrt`. Partition $[0, u_{\mathrm{top}}]$ into $N_Q = 2200$ segments with the first segment `[0, u_top/N_Q]` dyadically subdivided $30$ times down to $2^{-29} u_{\mathrm{top}}/N_Q$ (giving resolution $< 10^{-12}$ as $x \to \infty$), partition $[0, v_{\mathrm{top}}]$ into $N_Q = 2200$ segments, and pad the tiny midpoint gap $[u_{\mathrm{top}}^3, 1 - v_{\mathrm{top}}^2] \subset (\frac{1}{4}, \frac{3}{4})$ (width $\Delta w_1 + \Delta w_2 < 2 \times 10^{-14}$) upward by `gap_pad = int(2*(dw1 + dw2)*S) + 5` (since $G_{2,\mathrm{neg}} \equiv 0$ and each positive integrand is $< 2$ on $[\frac{1}{4}, \frac{3}{4}]$). On every segment, all polynomial/radical weights and $e^{-k x^2}$ factors are rounded strictly outward.
3. Partition $[0, \infty)$ into contiguous rational knots `0, 1/4, 2/4, ..., 6, 7, 8, 10, 12, 18, 30, 60, 150, 500, 2000, 10000, 100000, oo` and recursively bisect any cell $[x_a, x_b]$ until (3.2) certifies $d_{1,\mathrm{lo}} > 0$, $d_{2,\mathrm{lo}} > 0$, and
   $$d_{1,\mathrm{lo}}\,d_{2,\mathrm{lo}} - \max\!\big((\mathrm{off}_{\mathrm{lo}})^2, (\mathrm{off}_{\mathrm{hi}})^2\big) \ge 0.$$
4. Enclose $\pi \in [\pi_{\mathrm{lo}}, \pi_{\mathrm{hi}}] \subset (3.1415926535, 3.1415926536)$ via alternating Leibniz bounds on Machin's formula $\pi = 16\arctan(\frac{1}{5}) - 4\arctan(\frac{1}{239})$.

### Proof of Theorem 1 ($\kappa_4 \le \frac{19}{2} = 9.5$)

Take **Triple 1**:
$$(\hat{\alpha}_1, \hat{\beta}_1, \hat{\gamma}_1) = \left(\frac{5649}{250000},\; \frac{22597}{500000},\; -\frac{5753}{200000}\right).$$
`certify_cover` verifies (4.1) across $[0, \infty)$ in $217$ leaves with $\min d_{1,\mathrm{lo}} > 9.92 \times 10^{-5} > 0$ and minimum Schur determinant margin $> 3.0 \times 10^{-10} > 0$. By Lemma 4.1 and Lemma 1.1 ($0 \le C^2 \le \frac{3}{4} A^2$ and $\kappa_4 = \frac{1}{2} A^2 + C^2$), for any $F$ with $\kappa_4(F) > 0$, setting $y^2 := C^2/A^2 \in [0, \frac{3}{4}]$ gives a fractional-linear ratio $\frac{\hat{\alpha}_1 + \hat{\beta}_1 y^2}{1/2 + y^2}$, which is monotone in $y^2$ and therefore bounded above by the maximum of its two endpoints $y^2 = 0$ and $y^2 = \frac{3}{4}$:
$$\frac{\hat{\alpha}_1 A^2 + \hat{\beta}_1 C^2}{\kappa_4(F)} - \frac{1}{24} \le \max\!\left(2\hat{\alpha}_1 - \frac{1}{24},\; \frac{4\hat{\alpha}_1 + 3\hat{\beta}_1}{5} - \frac{1}{24}\right) = \max\!\left(\frac{2644}{750000},\; \frac{26449}{7500000}\right) = \frac{26449}{7500000} =: \hat{S}_1.$$
(When $\kappa_4(F) = 0$, $A = C = 0$ so (4.2) gives $\mathbb{E}|F| \le c$.) By 1-homogeneity of $\|F\|_1 / \|F\|_2$, $\mathbb{E}|F| \le \sqrt{2/\pi}\,\|F\|_2\big(1 + \frac{26449}{7500000}\kappa_4(F)\big)$ for all $F \in V_3(\mathbb{R}^n)$. Finally, for $0 \le \kappa_4(F) \le \frac{19}{2}$, exact rational arithmetic verifies:
$$\left(1 + \frac{26449}{7500000} \cdot \frac{19}{2}\right)^2 = \left(\frac{15502531}{15000000}\right)^2 \approx 1.06812652 < 1.06814150 < \frac{17}{50}\,\pi_{\mathrm{lo}} \le \frac{17\pi}{50} = \frac{17/25}{2/\pi},$$
proving $\mathbb{E}|F| < \sqrt{17/25}\,\|F\|_2$. $\square$

### Proof of Theorem 2 ($\operatorname{Var}(\tau) \le \frac{373}{200} = 1.865$)

Take **Triple 2**:
$$(\hat{\alpha}_2, \hat{\beta}_2, \hat{\gamma}_2) = \left(\frac{913}{40000},\; \frac{5239}{120000},\; -\frac{2927}{100000}\right),$$
chosen with the exact alignment $\hat{\beta}_2 - \frac{1}{24} = \hat{\alpha}_2 - \frac{1}{48} = \frac{239}{120000}$ (and $|-\frac{1}{32} - \hat{\gamma}_2| = \frac{99}{50000} = \frac{237.6}{120000} < \frac{239}{120000}$ at $x = \infty$). `certify_cover` verifies (4.1) across $[0, \infty)$ in $257$ leaves with $\min d_{1,\mathrm{lo}} > 3.09 \times 10^{-4} > 0$ and minimum Schur determinant margin $> 2.5 \times 10^{-10} > 0$. Substituting $\kappa_4(F) = \frac{1}{2}A^2 + C^2$ into (4.2) cancels the differing weights on $A^2$ and $C^2$ identically:
$$-\frac{\kappa_4(F)}{24} + \hat{\alpha}_2 A^2 + \hat{\beta}_2 C^2 = \left(\hat{\alpha}_2 - \frac{1}{48}\right) A^2 + \left(\hat{\beta}_2 - \frac{1}{24}\right) C^2 = \frac{239}{120000}(A^2 + C^2) = \frac{717}{40000}\,\operatorname{Var}(\tau).$$
For $0 \le \operatorname{Var}(\tau) \le \frac{373}{200} = 1.865$, exact rational arithmetic verifies:
$$\left(1 + \frac{717}{40000} \cdot \frac{373}{200}\right)^2 = \left(\frac{8267441}{8000000}\right)^2 \approx 1.06797782 < 1.06814150 < \frac{17}{50}\,\pi_{\mathrm{lo}},$$
proving $\mathbb{E}|F| < \sqrt{17/25}$ throughout $0 \le \operatorname{Var}(\tau) \le \frac{373}{200}$ (hence $\le \frac{93}{50} = 1.86$). $\square$

### Proof of Corollary 3 (Cartan's isoparametric cubics)

Let $P \in V_3(\mathbb{R}^n)$ ($n \in \{5, 8, 14, 26\}$, corresponding to division-algebra dimensions $d \in \{1, 2, 4, 8\}$ with $n = 3d + 2$) be a Cartan harmonic isoparametric cubic normalized to $\mathbb{E}[P^2] = 1$. Because $P$ is homogeneous of degree $3$, harmonic ($\Delta P = 0$), and satisfies the eikonal/isoparametric identity $\|\nabla P(x)\|^2 = c_n \|x\|^4$ on $\mathbb{R}^n$:
1. From $\mathbb{E}[\|\nabla P\|^2] = 3\,\mathbb{E}[P^2] = 3$ and $\mathbb{E}[\|X\|^4] = n(n + 2)$ ($X \sim \gamma_n$), we get $c_n = \frac{3}{n(n + 2)}$, so $\tau(X) = \frac{\|\nabla P(X)\|^2}{3} = \frac{\|X\|^4}{n(n + 2)}$.
2. Since $\mathbb{E}[\|X\|^8] = n(n + 2)(n + 4)(n + 6)$, we have
   $$\operatorname{Var}(\tau) = \frac{(n + 4)(n + 6)}{n(n + 2)} - 1 = \frac{8(n + 3)}{n(n + 2)}.$$
3. By $O(n)$-isotropy of $\mathbb{E}[\nabla P \nabla P^\top] = \frac{3}{n} I_n$, $M = \frac{1}{n} I_n$ has $m = \operatorname{Tr}(M^2) = \frac{1}{n}$. Solving $8 m + 6 u = \operatorname{Var}(\tau) = \frac{8(n + 3)}{n(n + 2)}$ gives $u = \frac{4}{3n(n + 2)}$, and Lemma 1.1 gives
   $$\kappa_4(P) = 36 m + 54 u = \frac{36}{n} + \frac{72}{n(n + 2)} = \frac{36(n + 4)}{n(n + 2)}.$$
Evaluating at $n = 5, 8, 14, 26$ gives $\kappa_4(P) = \frac{324}{35} \approx 9.257, \frac{27}{5} = 5.4, \frac{81}{28} \approx 2.893, \frac{135}{91} \approx 1.484$ (all strictly $< \frac{19}{2} = 9.5$) and $\operatorname{Var}(\tau) = \frac{64}{35} \approx 1.829, \frac{11}{10} = 1.1, \frac{17}{28} \approx 0.607, \frac{29}{91} \approx 0.319$ (all strictly $< \frac{93}{50} = 1.86$). $\square$

---

## 5. Complex $H_{2,1}(\mathbb{C}^n)$ phase-averaging corollary (Theorem 4)

Let $q \in H_{2,1}(\mathbb{C}^n)$ satisfy $\mathbb{E}|q|^2 = 1$, and put $\chi(q) := \mathbb{E}|q|^4 - 2 \ge 0$. Identifying $\mathbb{C}^n \cong \mathbb{R}^{2n}$ with standard complex Gaussian $Z = (X + iY)/\sqrt{2}$ ($(X, Y) \sim \gamma_{2n}$), for each $\theta \in [0, 2\pi)$ the real polynomial $F_\theta := \sqrt{2}\,\operatorname{Re}(e^{-i\theta} q)$ lies in $V_3(\mathbb{R}^{2n})$. By $U(1)$-invariance of the complex Gaussian law (equivalently $\mathbb{E}[q^2] = \mathbb{E}[q^3] = \mathbb{E}[q^3 \bar{q}] = \mathbb{E}[q^4] = 0$ on $H_{2,1}$):
- $\mathbb{E}[F_\theta^2] = \frac{1}{2}\mathbb{E}[(e^{-i\theta}q + e^{i\theta}\bar{q})^2] = \mathbb{E}|q|^2 = 1$,
- $\mathbb{E}[F_\theta^4] = \frac{1}{4}\binom{4}{2}\mathbb{E}|q|^4 = \frac{3}{2}(\chi(q) + 2) = 3 + \frac{3}{2}\chi(q)$, so $\kappa_4(F_\theta) = \frac{3}{2}\chi(q)$ for every $\theta$,
- $\frac{1}{2\pi}\int_0^{2\pi} |F_\theta|\,d\theta = \frac{\sqrt{2}}{2\pi}\left(\int_0^{2\pi}|\cos\theta|\,d\theta\right)|q| = \frac{2\sqrt{2}}{\pi}|q|$.

Applying Theorem 1 to $F_\theta$ and averaging over $\theta \in [0, 2\pi)$ yields
$$\mathbb{E}|q| = \frac{\pi}{2\sqrt{2}}\,\frac{1}{2\pi}\int_0^{2\pi} \mathbb{E}|F_\theta|\,d\theta \le \frac{\pi}{2\sqrt{2}}\sqrt{\frac{2}{\pi}}\left(1 + \frac{26449}{7500000}\cdot\frac{3}{2}\chi(q)\right) = \frac{\sqrt{\pi}}{2}\left(1 + \frac{26449}{5000000}\,\chi(q)\right).$$
Exact rational checks in `verify_near_gaussian_505.py` (using $\pi < \pi_{\mathrm{hi}}$) verify:
- At $\chi \le \frac{9}{2}$: $\frac{\pi_{\mathrm{hi}}}{4}\left(1 + \frac{26449}{5000000}\cdot\frac{9}{2}\right)^2 < \left(\frac{9074}{10000}\right)^2$, so $\mathbb{E}|q| < 0.9074\,\|q\|_2$.
- At $\chi \le \frac{11}{2}$: $\frac{\pi_{\mathrm{hi}}}{4}\left(1 + \frac{26449}{5000000}\cdot\frac{11}{2}\right)^2 < \left(\frac{9121}{10000}\right)^2 < \left(\frac{4571}{5000}\right)^2$, so $\mathbb{E}|q| < 0.9121\,\|q\|_2 < 0.9142\,\|q\|_2$.
- On $\chi \in [\frac{11}{2}, 42]$ (which covers all of $H_{2,1}(\mathbb{C}^n)$ since $0 \le \chi(q) \le 42$ by `Circular.gaussian_fourth_moment_le_44`), Rows 7–13 of `cert_915.json` (`KSR`, dual-verified in exact arithmetic by Sturm sequences and Bernstein subdivision) certify $\mathbb{E}|q|/\|q\|_2 \le 0.9141874875 < \frac{4571}{5000} = 0.9142$ (with Row 7 on $[\frac{11}{2}, 7]$ giving $\le 0.9141874875$, and Rows 8–13 on $[7, 42]$ giving $\le 0.9140797709$; note that on $[7, 42]$, the independently reviewed Level-2 Rows 17–22 of `cert_916.json` also already certify $\le 0.9141151244 < 0.9142$).
- Finally, for the capped degree-5 witness $T = P_{1,0} - \frac{39}{50}P_{2,1} + \frac{779}{10000}P_{3,2}$ (`../higher-degree/STATUS.md` `4.18 (a)`), substituting $\rho_0 = \frac{4571}{5000}$ and $\pi > \pi_{\mathrm{lo}}$ into $(1 - \eta)t^2 + \varepsilon\rho_0^2 + \frac{\eta^2}{\pi\varepsilon} < \frac{500}{701}$ holds in exact rationals at $t = \frac{2527}{10000} = 0.2527$. $\square$

---

## 6. Replay instructions and what remains open

### Exact replay (pure Python 3 stdlib, isolated `-I -O`, zero floats)

From any empty directory:
```sh
python3 -I -O research/conjecture-K/code/near-gaussian-505-gemini-2762/verify_near_gaussian_505.py
```
The script imports only `ast, fractions, math, pathlib, sys, time`, runs in ~55 seconds, verifies the SOS polynomial identity, $e^{-42} < 10^{-15}$, Machin $\pi$ bounds, Triple 1 ($217$ leaves), Triple 2 ($257$ leaves), all four Cartan cubics, the $\operatorname{He}_3(Z)/\sqrt{6}$ closed-form overlap, the $H_{2,1}(\mathbb{C}^n)$ phase-averaging bounds and degree-5 small-$t$ arithmetic, 12 adversarial negative controls, and an AST self-audit confirming zero `float` literals or calls anywhere in the source.

To replay the companion high-kurtosis rows 7–13 ($\chi \in [\frac{11}{2}, 42]$, max $\le 0.9141874875$) of [`cert_915.json`](../../code/sharp-radius-gemini-2762/cert_915.json) (`KSR`, logged in [`code/sharp-radius-gemini-2762/REPLAY.log`](../../code/sharp-radius-gemini-2762/REPLAY.log)) used in Theorem 4(2):
```sh
python3 -I -O research/conjecture-K/code/sharp-radius-gemini-2762/verify_bernstein_level3.py research/conjecture-K/code/sharp-radius-gemini-2762/cert_915.json
python3 -I -O research/conjecture-K/code/sharp-radius-gemini-2762/verify_cert_level3.py research/conjecture-K/code/sharp-radius-gemini-2762/cert_915.json
```

### What remains open for [#501](https://github.com/agalatan/grothendieck-lean/issues/501)

With Theorems 1 and 2 (`P + C, author only`) adjoined to the independently reviewed bounds of `STATUS.md` `3.21 (e9)(i)`–`(iv)`, any counterexample to the weak target `(T)` ($\mathbb{E}|F| \le \sqrt{17/25}\,\|F\|_2$) on $V_3(\mathbb{R}^n)$ outside the sharp classes `(e1)`–`(e6)` must simultaneously satisfy:
$$\operatorname{rank}(M) \ge 16, \qquad a < 0.642, \qquad 0.0064 < \lambda < 0.66502, \qquad \operatorname{Var}(\tau) > \frac{373}{200} = 1.865, \qquad \frac{19}{2} = 9.5 < \kappa_4(F) < 46.6.$$
Closing the remaining intermediate-kurtosis window $9.5 < \kappa_4(F) < 46.6$ on $V_3(\mathbb{R}^n)$ remains open under [#501](https://github.com/agalatan/grothendieck-lean/issues/501).
