# Unconditional Symmetrised Spiked Cubic Radius $\rho_s < \sqrt{9\pi/32}$ and Angle-Dependent Envelope

Agent-ID: gemini-4c4c. Addresses issue `#628` (`ATK P7`, `research/higher-degree/STATUS.md` row `4.48`).
Labels: **P, author only** (proofs in §§1–6) and **C, author only** (zero-float Python 3 standard-library verifier `verify.py`, exact polynomial identity checker `check_identities_exact.py`, and adversarial control suite `test_controls.py` in `research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/`).

---

## 0. Summary of Main Results and External Inputs

Let $z = (z_1, \dots, z_n)$ be independent standard complex Gaussians on $\mathbb{C}^n$ (density $\pi^{-1} e^{-|z_j|^2}$, $\mathbb{E}|z_j|^2 = 1$, $\mathbb{E}[z_j^2] = 0$), and let $H_{a,b}(\mathbb{C}^n)$ denote the complex Wick chaos of bidegree $(a, b)$ with orthogonal projection $P_{a,b}$. For $\ell \ge 0$ and $G \in H_{2,1}(\mathbb{C}^n)$ (which may depend arbitrarily on $z_1$), define the symmetrised spiked cubic functional and its universal constant:
$$
\phi(\ell, G) := \frac{1}{2}\bigl(\mathbb{E}|\ell z_1 + G| + \mathbb{E}|\ell z_1 - G|\bigr), \qquad
\rho_s := \sup_{\substack{n \ge 1,\;\ell \ge 0,\;G \in H_{2,1}(\mathbb{C}^n) \\ (\ell, G) \ne (0, 0)}} \frac{\phi(\ell, G)}{\sqrt{\ell^2 + \|G\|_2^2}}.
$$
Without $\pm G$ symmetrisation, the two-chaos $L^1/L^2$ ratio on $H_{1,0} \oplus H_{2,1}$ is at least $\sqrt{9\pi/32} = 0.9399856\dots > 0.93998$ (and exceeds $0.9429$ already on $F(z_1) = z_1(1 - (|z_1|^2 - 2)/4)$; §7 and `test_controls.py`).

### Theorem 1 (Global Symmetrised Spiked Cubic Radius)
For every $n \ge 1$, every $\ell \ge 0$, and every $G \in H_{2,1}(\mathbb{C}^n)$,
$$
\frac{1}{2}\bigl(\mathbb{E}|\ell z_1 + G| + \mathbb{E}|\ell z_1 - G|\bigr) \le r_1 \sqrt{\ell^2 + \|G\|_2^2}, \qquad r_1 = \frac{939}{1000} = 0.939 < \frac{46999}{50000} = 0.93998 < \sqrt{\frac{9\pi}{32}} < 0.94
$$
(with certified polygon supremum $\sup \sqrt{\|P_{1,0} h\|_2^2 + \|P_{2,1} k\|_2^2} \le 0.9389788947 < \frac{939}{1000}$). Equivalently, for every dimension $n \ge 1$ and every pair of measurable unimodular functions $f, g : \mathbb{C}^n \to \{w \in \mathbb{C} : |w| = 1\}$ with $h = \frac{1}{2}(f + g)$ and $k = \frac{1}{2}(f - g)$,
$$
\|P_{1,0} h\|_2^2 + \|P_{2,1} k\|_2^2 \le \Bigl(\frac{939}{1000}\Bigr)^2.
$$

### Theorem 2 (Angle-Dependent Pythagorean-Ray Envelope and Sector-Free Degree-5 Cutoff)
1. **Certified half-planes.** For each of the 11 primitive Pythagorean triples $(a_j, b_j, c_j) \in \mathbb{Z}_{>0}^3$ ($a_j^2 + b_j^2 = c_j^2$, $\ell_j = a_j/c_j$, $m_j = b_j/c_j$, $p_j = a_j^2/c_j^2$) recorded in §6 Table 1, every unimodular pair $(f, g)$ in every dimension $n \ge 1$ satisfies
   $$
   \frac{a_j}{c_j}\,\|P_{1,0} h\|_2 + \frac{b_j}{c_j}\,\|P_{2,1} k\|_2 \le R_j.
   $$
   In particular, at $(a_0, b_0, c_0) = (84, 187, 205)$ ($p_0 = \frac{7056}{42025} \approx 0.16790$), $\frac{84}{205}\|P_{1,0} h\|_2 + \frac{187}{205}\|P_{2,1} k\|_2 \le \frac{582}{625} = 0.9312$.
2. **Sector-free mid-$t$ consequence for the capped degree-5 game.** Let $T = P_{1,0} - \frac{39}{50} P_{2,1} + \frac{779}{10000} P_{3,2}$ and $V = \operatorname{Re}\langle f, T g\rangle$, $t = \|P_{1,0} h\|_2$. Combining the elliptic lift of `STATUS.md` row `4.18e` on $[0, 0.35859076]$ (using only the independently reviewed cubic radius $\rho_0 = 2287/2500$ and the Lean mass inequality `integral_phiMass_QkOf_le`) with ray $j = 0$ on $[0.35859076, t_*]$ gives $V < \frac{500}{701}$ unconditionally (no sector hypothesis and no `libm` assumption) for all
   $$
   0 \le t \le \frac{9190839}{25000000} = 0.36763356
   $$
   (where this 11-ray + Lean-mass upper envelope crosses $\frac{500}{701}$ on the next $10^{-8}$ grid point $t = 0.36763357$, establishing sharpness for this envelope while the cutoff for the physical game could extend further; improving `0.35859076` of `4.18e` and `0.36495` of `4.18f` at the reviewed radius $\frac{2287}{2500}$, and also exceeding `0.36733` of `4.18f` at the unreviewed radius $\frac{4571}{5000}$; by Parseval alone without the mass inequality, `4.18e` already gives $0 \le t \le 0.34554022$ because the Stieltjes ellipsoid $B_{00}(c)(1-p) + B_T(c)p$ loosens for $p < 0.14$).

### Dependency Inventory
Every external input used in this proof is either a Lean theorem on `master` or an independently reviewed **P + C** result on `master`:
1. **Lean theorems (`Grothe/LowerAnalytic/{GramTensor,GramSpectral,MassRowFrame}.lean`, `Grothe/Lower/MassNodes.lean`):**
   - Pure cubic fourth-moment contractions $s_G = \mathbb{E}|\tilde{G}|^4 - 2 = 32n + 8h + 32b + 96y \le 42$ (`Circular.fourth_moment_contractions`, `gaussian_fourth_moment_le_44`),
   - Spectral/contraction inequalities on $\pi = (n, h, b, y, z)$ (`AB_eq`, `radR_sq_le`, `N_eq`),
   - Pure cubic sixth-moment bounds $\mathbb{E}|\tilde{G}|^6 \le 6 + 9 s_G + C_6 s_G^{3/2}$ ($C_6 = \frac{4045313}{100000}$, `Circular.gaussian_sixth`) and the two joint sixth-moment bounds (`Circular.joint_sixth`),
   - Mass inequality $\frac{25}{31}\|P_{2,1} k\|_2^2 - \frac{2141}{3906}\|k\|_2^2 \le S$ (`integral_phiMass_QkOf_le`, used only in Theorem 2(2)'s second cutoff).
2. **Independently reviewed P + C results on `master`:**
   - Pure cubic chaos radius $\rho^* \le \rho_0 := \frac{2287}{2500} = 0.9148$ (`conjecture-K/STATUS.md` row `3.7`, **P + C**),
   - Elliptic quadratic lift $\bigl(\frac{431}{500}\bigr)^2 \|P_{1,0} h\|_2^2 + \|P_{2,1} k\|_2^2 \le \rho_0^2$ (`higher-degree/STATUS.md` row `4.18e`, `sources/cubic-carrier-ellipse-codex-a7c4/ELLIPTIC.md`, **P + C**, reviewed in `#660`),
   - Visible-sector radial envelope $\phi(\ell, G) \le F(d)$ and weighted Stieltjes-Laguerre response bounds $\phi(\ell, G)^2 \le \sum_{i,j} B_{ij}(c) E_{ij} + B_T(c) p$ (`higher-degree/STATUS.md` row `4.18g`, `sources/spiked-radius-sectors-codex-a7c4/PROOF.md`, **P + C**, reviewed in `#663`).

---

## 1. Duality Equivalence and the Pythagorean-Ray Support-Polygon Cover

### Lemma 1.1 (Unimodular Pair Equivalence and Ray Half-Planes)
1. For all $\ell \ge 0$ and $G \in H_{2,1}(\mathbb{C}^n)$,
   $$
   \phi(\ell, G) = \sup\bigl\{\ell\operatorname{Re}\langle z_1, h\rangle + \operatorname{Re}\langle G, k\rangle : f, g\text{ unimodular},\; h = \tfrac{1}{2}(f+g),\; k = \tfrac{1}{2}(f-g)\bigr\}.
   $$
   Consequently $\rho_s \le r_1$ if and only if $\|P_{1,0} h\|_2^2 + \|P_{2,1} k\|_2^2 \le r_1^2$ for every unimodular pair $(f, g)$ in every dimension $n \ge 1$.
2. Let $(a, b, c) \in \mathbb{Z}_{>0}^3$ satisfy $a^2 + b^2 = c^2$, and set $\ell = a/c$, $m = b/c$, $p = \ell^2$, $u = m^2 = 1 - p$. Suppose $\phi(\ell, G) \le R$ holds for every $n \ge 1$ and every $G \in H_{2,1}(\mathbb{C}^n)$ with $\|G\|_2^2 = u$. Then every unimodular pair $(f, g)$ in every dimension $N \ge 1$, with $t := \|P_{1,0} h\|_2$ and $s := \|P_{2,1} k\|_2$, satisfies
   $$
   \ell t + m s \le R.
   $$

**Proof.**
(1) Pointwise, $\frac{1}{2}(|\ell z_1 + G| + |\ell z_1 - G|) = \sup_{|f|=|g|=1} \frac{1}{2}\operatorname{Re}\bigl(\overline{f}(\ell z_1 + G) + \overline{g}(\ell z_1 - G)\bigr) = \sup_{|f|=|g|=1} \operatorname{Re}\bigl(\overline{h}\,\ell z_1 + \overline{k}\,G\bigr)$, attained at $f = \operatorname{ph}(\ell z_1 + G)$, $g = \operatorname{ph}(\ell z_1 - G)$ (taking $1$ at zeros). Integrating gives the variational formula. If $t^2 + s^2 \le r_1^2$ for all pairs, Cauchy–Schwarz gives $\ell\operatorname{Re}\langle z_1, h\rangle + \operatorname{Re}\langle G, k\rangle \le \ell t + \|G\|_2 s \le \sqrt{\ell^2 + \|G\|_2^2}\,r_1$. Conversely, given $(f, g)$ on $\mathbb{C}^n$, choose a unitary rotation on $\mathbb{C}^n$ so that $P_{1,0} h = t z_1$; testing $\ell = t$ and $G = P_{2,1} k$ yields $t^2 + s^2 \le \phi(t, P_{2,1} k) \le \rho_s \sqrt{t^2 + s^2}$.

(2) Given $(f, g)$ on $\mathbb{C}^N$, rotate coordinates so that $P_{1,0} h = t z_1$.
- If $s > 0$, set $G := m \frac{P_{2,1} k}{s} \in H_{2,1}(\mathbb{C}^N)$. Then $\|G\|_2^2 = m^2 = u$, so by (1),
  $$
  \ell t + m s = \ell\operatorname{Re}\langle z_1, h\rangle + \operatorname{Re}\langle G, k\rangle \le \phi(\ell, G) \le R.
  $$
- If $s = 0$, adjoin one independent coordinate $z_{N+1}$ and set $G := m\,e_{21}(z_{N+1}) \in H_{2,1}(\mathbb{C}^{N+1})$, where $e_{21}(w) = w(|w|^2 - 2)/\sqrt{2}$ has $\|e_{21}\|_2 = 1$ and $\mathbb{E}[e_{21}(z_{N+1})] = 0$. Then $\|G\|_2^2 = m^2 = u$. Since $|h| \le 1$ pointwise, $t = \|P_{1,0} h\|_2 = |\langle z_1, h\rangle| \le \mathbb{E}|z_1| = \frac{\sqrt{\pi}}{2}$. By Jensen's inequality in $z_{N+1}$ at fixed $z_1$,
  $$
  \ell t + m s = \ell t \le \ell\,\mathbb{E}|z_1| = \mathbb{E}_{z_1}\bigl|\ell z_1 + \mathbb{E}_{z_{N+1}}[G]\bigr| \le \mathbb{E}|\ell z_1 + G| = \phi(\ell, G) \le R. \qquad \square
  $$

### Lemma 1.2 (Exact Convex-Quadratic Slab Cover)
Let $r_1 > 0$, and suppose:
1. $t_{\mathrm{left}} \in \mathbb{Q}_{>0}$ satisfies $\rho_0^2 + \bigl(1 - c_{\mathrm{ell}}^2\bigr) t_{\mathrm{left}}^2 < r_1^2$, where $c_{\mathrm{ell}} = \frac{431}{500}$ and $\rho_0 = \frac{2287}{2500}$;
2. $t_{\mathrm{right}} \in \mathbb{Q}_{>0}$ satisfies $t_{\mathrm{right}}^2 \ge \frac{\pi}{4}$;
3. $(\ell_j, m_j, R_j)_{j=0}^{M-1}$ are certified half-planes $\ell_j t + m_j s \le R_j$ ($\ell_j, m_j > 0$), and $t_{\mathrm{left}} = \tau_0 \le \tau_1 \le \dots \le \tau_M = t_{\mathrm{right}}$ are rationals such that at every slab endpoint $t_e \in \{\tau_j, \tau_{j+1}\}$ ($0 \le j < M$),
   $$
   \Phi_j(t_e) := t_e^2 + \max\Bigl(0,\, \frac{R_j - \ell_j t_e}{m_j}\Bigr)^2 < r_1^2.
   $$
Then every unimodular pair $(f, g)$ in every dimension satisfies $t^2 + s^2 < r_1^2$; since $r_1 > 0$, taking square roots gives $\sqrt{t^2 + s^2} < r_1$, hence $\rho_s \le r_1$ by Lemma 1.1(1).

**Proof.**
For any unimodular pair, $|h| \le 1$ pointwise and $P_{1,0} h = t\zeta$ for a unit linear form $\zeta \sim \mathcal{CN}(0, 1)$ give $t = |\langle \zeta, h\rangle| \le \mathbb{E}|\zeta| = \frac{\sqrt{\pi}}{2} \le t_{\mathrm{right}}$, so $t \in [0, t_{\mathrm{right}}]$.
- If $t \in [0, t_{\mathrm{left}}]$, Theorem `4.18e` (`ELLIPTIC.md` eq. (5)) gives $c_{\mathrm{ell}}^2 t^2 + s^2 \le \rho_0^2$, so $t^2 + s^2 \le \rho_0^2 + (1 - c_{\mathrm{ell}}^2) t_{\mathrm{left}}^2 < r_1^2$.
- Otherwise $t \in [\tau_j, \tau_{j+1}]$ for some $0 \le j < M$. Since $s \ge 0$ and $\ell_j t + m_j s \le R_j$ with $m_j > 0$, we have $0 \le s \le \max\bigl(0, (R_j - \ell_j t)/m_j\bigr)$, hence $t^2 + s^2 \le \Phi_j(t)$. The function $x \mapsto \max(0, x)^2$ is convex on $\mathbb{R}$ (its derivative $2\max(0, x)$ is continuous and nondecreasing), so its composition with the affine map $t \mapsto (R_j - \ell_j t)/m_j$ is convex on $\mathbb{R}$. Adding the strictly convex function $t^2$ shows that $\Phi_j$ is strictly convex on $[\tau_j, \tau_{j+1}]$, hence $\Phi_j(t) \le \max\bigl(\Phi_j(\tau_j), \Phi_j(\tau_{j+1})\bigr) < r_1^2$. Since $r_1 > 0$, $\sqrt{t^2 + s^2} < r_1$, and Lemma 1.1(1) yields $\rho_s \le r_1$. $\square$

---

## 2. Visible-Sector Polytope Reduction on a Fixed Ray (`4.18g`)

Fix a Pythagorean ray $(\ell, m) = (a/c, b/c)$ with $p = \ell^2 \in (0, 1)$, $u = m^2 = 1 - p$, and a target rational $R_{\mathrm{ray}} > \frac{\sqrt{\pi}}{2}$. Let $G \in H_{2,1}(\mathbb{C}^n)$ satisfy $\|G\|_2^2 = u$. Writing $z = (z_1, y)$ with $y = (z_2, \dots, z_n)$ and $T = |z_1|^2$, $G$ admits the unique $L^2$-orthogonal decomposition (`4.18g` §1):
$$
G(z_1, y) = G_{00}(y) + (T - 1) G_{11}(y) + \frac{z_1^2}{\sqrt{2}} G_{20}(y) + z_1 G_{10}(y) + \bar{z}_1 G_{01}(y) + \frac{z_1(T - 2)}{\sqrt{2}} G_{21},
$$
where $G_{00} \in H_{2,1}(y)$, $G_{11} \in H_{1,0}(y)$, $G_{20} \in H_{0,1}(y)$, $G_{10} \in H_{1,1}(y)$, $G_{01} \in H_{2,0}(y)$, and $G_{21} \in \mathbb{C}$. Let $E_{ij} := \|e_{ij}(z_1) G_{ij}(y)\|_2^2 = \|G_{ij}\|_2^2 \ge 0$, so $E_{00} + E_{11} + E_{20} + E_{10} + E_{01} + E_{21} = u = 1 - p$.

By `4.18g` §2 (`spiked-radius-sectors-codex-a7c4/PROOF.md`):
1. **Radial envelope $F(d)$.** Put $d := E_{00} + \frac{1}{2} E_{11} - \frac{1}{4} E_{20} - \frac{1}{8} E_{21} = 1 - p - \bigl(\frac{1}{2} E_{11} + \frac{5}{4} E_{20} + E_{10} + E_{01} + \frac{9}{8} E_{21}\bigr) \le 1 - p$. Then $\phi(\ell, G) \le F(\max(0, d))$, where $F(d) = \int_0^\infty e^{-t}\sqrt{d + (1-d)t}\,dt$ is strictly increasing on $[0, 1]$ with $F(0) = \frac{\sqrt{\pi}}{2}$.
   - **Right analytical closure (`analytic_418g` rays):** If $1 - p < \frac{1}{2}$ and `envelope(1 - p)[1] <= R_ray`, then $\phi(\ell, G) \le F(\max(0, d)) \le F(1 - p) \le R_{\mathrm{ray}}$ holds unconditionally for all $G$ on this ray.
   - **Interior Stein rays:** Let $d_{\mathrm{cut}} \in [0, 1 - p)$ satisfy $F(d_{\mathrm{cut}}) \le R_{\mathrm{ray}}$ (certified via `envelope(d_cut)[1] <= R_ray`, or `PI_HI / 4 <= R_ray^2` when $d_{\mathrm{cut}} = 0$). Whenever $d \le d_{\mathrm{cut}}$, $\phi(\ell, G) \le R_{\mathrm{ray}}$ is already proved.
2. **Weighted Stieltjes-Laguerre ellipsoids.** For every rational $c > 0$, let $J(c) = \int_0^\infty \frac{e^{-t}}{t + c}\,dt$ be bracketed in exact rationals by the positive-definite Laguerre Schur complements of `4.18g` (`stieltjes_lower(c, 0, 48) < J(c) < (1 - stieltjes_lower(c, 1, 48)) / c`), and let $B_{00}^{\mathrm{hi}}(c), B_T^{\mathrm{hi}}(c), B_{11}^{\mathrm{hi}}(c), B_{20}^{\mathrm{hi}}(c), B_{21}^{\mathrm{hi}}(c) \in \mathbb{Q}$ be the resulting exact upper bounds on the five sector integrals (`sector_B_upper(c)` in `verify.py`, with $B_{10}^{\mathrm{hi}}(c) = B_{01}^{\mathrm{hi}}(c) = B_T^{\mathrm{hi}}(c)$). Since $E_{00}, p, E_S \ge 0$, `4.18g` §2 gives
   $$
   \phi(\ell, G)^2 \le B_{00}^{\mathrm{hi}}(c) E_{00} + B_T^{\mathrm{hi}}(c) p + \sum_{S \in \{11,20,10,01,21\}} B_S^{\mathrm{hi}}(c) E_S
   = B_{00}^{\mathrm{hi}}(c)(1 - p) + B_T^{\mathrm{hi}}(c) p - \sum_S \bigl(B_{00}^{\mathrm{hi}}(c) - B_S^{\mathrm{hi}}(c)\bigr) E_S.
   $$
   Whenever the right-hand side is $\le R_{\mathrm{ray}}^2$, $\phi(\ell, G) \le R_{\mathrm{ray}}$ is already proved.

Consequently, to prove $\phi(\ell, G) \le R_{\mathrm{ray}}$ on an interior Stein ray, it suffices to prove $\phi(\ell, G) < R_{\mathrm{ray}}$ for all $G \in H_{2,1}(\mathbb{C}^n)$ with $\|G\|_2^2 = u$ whose visible-sector vector $E = (E_{11}, E_{20}, E_{10}, E_{01}, E_{21}) \in \mathbb{R}_{\ge 0}^5$ lies in the rational polytope $\mathcal{E}_{\mathrm{sec}}(p, R_{\mathrm{ray}}) := \{E \ge 0 : A_{\mathrm{sec}} E \le b_{\mathrm{sec}}\}$ defined by:
$$
\frac{1}{2} E_{11} + \frac{5}{4} E_{20} + E_{10} + E_{01} + \frac{9}{8} E_{21} \le 1 - p - d_{\mathrm{cut}}, \qquad
\sum_S E_S \le 1 - p,
$$
and for each $c \in C_{\mathrm{BANK}} = \bigl\{\frac{1}{10}, \frac{1}{5}, \frac{7}{20}, \frac{1}{2}, \frac{18}{25}, 1, \frac{3}{2}, \frac{5}{2}, 4\bigr\}$,
$$
\sum_S \bigl(B_{00}^{\mathrm{hi}}(c) - B_S^{\mathrm{hi}}(c)\bigr) E_S \le B_{00}^{\mathrm{hi}}(c)(1 - p) + B_T^{\mathrm{hi}}(c) p - R_{\mathrm{ray}}^2.
$$

---

## 3. Spiked Stein Identities `(I')`–`(IV')` and Zero-Mean $\pm G$ Symmetrisation

Fix $\ell \ge 0$ ($p = \ell^2$), $G \in H_{2,1}(\mathbb{C}^n)$ with $u = \|G\|_2^2$, and $\sigma \in \{+1, -1\}$. Write $\partial_j = \partial/\partial z_j$, $\bar{\partial}_j = \partial/\partial\bar{z}_j$, and define:
$$
Q_\sigma := \ell z_1 + \sigma G, \qquad V_\sigma := |Q_\sigma|^2, \qquad F_k := \bar{\partial}_k G \in H_{2,0}(\mathbb{C}^n), \qquad W_k := \sum_{j=1}^n F_j\,\partial_j F_k \in H_{3,0}(\mathbb{C}^n),
$$
$$
k_1 := \sum_{j=1}^n |\partial_j G|^2, \qquad c_2 := \sum_{k=1}^n |F_k|^2, \qquad w_G := \sum_{k=1}^n |W_k|^2, \qquad a(G) := \sum_{j=1}^n (\partial_j G) F_j, \qquad b_{\mathrm{loc}} := \sum_{k=1}^n \overline{F_k} W_k,
$$
$$
\delta_\Delta(z, \sigma) := 4\sigma\ell\operatorname{Re}(\partial_1 G), \qquad
\tilde{k}_1 := |\partial_1 G + 2\sigma\ell|^2 + \sum_{j=2}^n |\partial_j G|^2 = k_1 + 4p + \delta_\Delta(z, \sigma),
$$
$$
a_{1,\sigma} := a(G) + 2\sigma\ell F_1 = \sum_{j=1}^n (\partial_j G + 2\sigma\ell\delta_{j1}) F_j, \qquad
\alpha_{2,\sigma} := |a_{1,\sigma}|^2, \qquad
\rho_\sigma := \begin{cases} \operatorname{Re}\bigl(\overline{Q}_\sigma^2 a_{1,\sigma}\bigr) / V_\sigma & \text{if }V_\sigma > 0, \\ 0 & \text{if }V_\sigma = 0, \end{cases}
$$
$$
\tilde{\beta}_{3,\sigma} := \operatorname{Re}\bigl(\overline{Q}_\sigma(\sigma b_{\mathrm{loc}} + \ell\,\bar{\partial}_1 c_2)\bigr), \qquad
\tilde{\beta}_{4,\sigma} := \operatorname{Re}\bigl(\overline{Q}_\sigma\,\sigma b_{\mathrm{loc}}\bigr).
$$
Notice that each $F_j = \bar{\partial}_j G \in H_{2,0}(\mathbb{C}^n)$ is holomorphic ($\bar{\partial}_m F_j = 0$), while commuting $\bar{\partial}_m$ with $\partial_j$ gives $\bar{\partial}_m(\partial_j G) = \partial_j(\bar{\partial}_m G) = \partial_j F_m$; hence differentiating $a(G) = \sum_{j=1}^n (\partial_j G) F_j$ directly yields $\bar{\partial}_m a(G) = \sum_{j=1}^n F_j\,\partial_j F_m = W_m$ (note that in general $\partial_j F_m \ne \partial_m F_j$, e.g. for $G = z_1^2 \bar{z}_2$; verified symbolically in `check_identities_exact.py`).

### Lemma 3.1 (Spiked Stein Identities `(I')`–`(IV')`)
Let $g_i \in C^1([0, \infty), \mathbb{R})$ ($i = 1, 2, 3, 4$) have polynomial growth together with $g_i'$, and set $G_i(v) := v g_i(v)$, $\phi_i(v) := G_i'(v) = g_i(v) + v g_i'(v)$, and $Y_i(v) := \phi_i(v) - g_i(v) = v g_i'(v)$. Then for each sign $\sigma \in \{+1, -1\}$:
$$
\begin{aligned}
\text{(I')}\quad & \mathbb{E}\Bigl[G_1(V_\sigma) - \bigl(c_2 + p + \tfrac{1}{4}\delta_\Delta\bigr)\phi_1(V_\sigma) - \rho_\sigma Y_1(V_\sigma)\Bigr] = 0, \\
\text{(II')}\quad & \mathbb{E}\Bigl[G_2(V_\sigma) - \bigl(\tfrac{1}{2} k_1 + p + \tfrac{3}{8}\delta_\Delta\bigr)\phi_2(V_\sigma) - \tfrac{1}{2}\rho_\sigma Y_2(V_\sigma)\Bigr] = 0, \\
\text{(III')}\quad & \mathbb{E}\Bigl[(c_2 - u)\bigl(c_2 + p + \tfrac{1}{4}\delta_\Delta\bigr)\phi_3(V_\sigma) - (c_2 - u) G_3(V_\sigma) + (c_2 - u)\rho_\sigma Y_3(V_\sigma) + \tilde{\beta}_{3,\sigma} g_3(V_\sigma)\Bigr] = 0, \\
\text{(IV')}\quad & \mathbb{E}\Bigl[\alpha_{2,\sigma}\phi_4(V_\sigma) - \rho_\sigma G_4(V_\sigma) + c_2\rho_\sigma Y_4(V_\sigma) + \tilde{\beta}_{4,\sigma} g_4(V_\sigma) + \operatorname{Re}\bigl(\ell z_1 Q_\sigma \overline{a}_{1,\sigma}\bigr) g_4(V_\sigma) - \operatorname{Re}\bigl(\sigma\ell F_1 \overline{a}_{1,\sigma}\bigr)\phi_4(V_\sigma)\Bigr] = 0.
\end{aligned}
$$

**Proof.**
Recall the three Gaussian integration-by-parts rules on $\mathbb{C}^n$ for $H \in C^1$ of polynomial growth and $G \in H_{2,1}(\mathbb{C}^n)$ (`sources/antiholomorphic-stein-2026-11-16/NOTE.md` Lemma 1):
$$
\mathbb{E}[z_1 H] = \mathbb{E}[\bar{\partial}_1 H], \qquad
\mathbb{E}[G H] = \sum_{j=1}^n \mathbb{E}[(\partial_j H) F_j], \qquad
\mathbb{E}[G H] = \frac{1}{2}\sum_{j=1}^n \mathbb{E}[(\bar{\partial}_j H)\,\partial_j G].
$$
Note $\partial_j Q_\sigma = \ell\delta_{j1} + \sigma\partial_j G$, $\bar{\partial}_j Q_\sigma = \sigma F_j$, $\partial_j V_\sigma = \overline{Q}_\sigma(\ell\delta_{j1} + \sigma\partial_j G) + Q_\sigma\sigma\overline{F}_j$, and $\bar{\partial}_j V_\sigma = \overline{\partial_j V_\sigma}$.

1. **Identity `(I')`:** Apply the first two rules to $G_1(V_\sigma) = Q_\sigma\,\overline{Q}_\sigma g_1(V_\sigma) = \ell z_1 \overline{Q}_\sigma g_1(V_\sigma) + \sigma G\,\overline{Q}_\sigma g_1(V_\sigma)$ with $H = \overline{Q}_\sigma g_1(V_\sigma)$:
   - $\bar{\partial}_1(\overline{Q}_\sigma g_1(V_\sigma)) = (\ell + \sigma\overline{\partial_1 G}) g_1(V_\sigma) + \overline{Q}_\sigma g_1'(V_\sigma)\bigl[Q_\sigma(\ell + \sigma\overline{\partial_1 G}) + \overline{Q}_\sigma \sigma F_1\bigr]$. Multiplying by $\ell$ and taking real parts yields $\bigl(p + \frac{1}{4}\delta_\Delta\bigr)\phi_1(V_\sigma) + \operatorname{Re}\bigl(\overline{Q}_\sigma^2\,\sigma\ell F_1\bigr) g_1'(V_\sigma)$.
   - $\sum_j \partial_j(\overline{Q}_\sigma g_1(V_\sigma))\,\sigma F_j = \sum_j |F_j|^2 \phi_1(V_\sigma) + \overline{Q}_\sigma^2 g_1'(V_\sigma)\sum_j (\ell\delta_{j1} + \sigma\partial_j G)\sigma F_j = c_2 \phi_1(V_\sigma) + \overline{Q}_\sigma^2 g_1'(V_\sigma)\bigl(a(G) + \sigma\ell F_1\bigr)$.
   Adding the real parts gives $\bigl(c_2 + p + \frac{1}{4}\delta_\Delta\bigr)\phi_1(V_\sigma) + \operatorname{Re}\bigl(\overline{Q}_\sigma^2(a(G) + 2\sigma\ell F_1)\bigr) g_1'(V_\sigma) = \bigl(c_2 + p + \frac{1}{4}\delta_\Delta\bigr)\phi_1(V_\sigma) + \rho_\sigma Y_1(V_\sigma)$ (including on $\{V_\sigma = 0\}$, where $\overline{Q}_\sigma^2 = 0$ and $\rho_\sigma = 0$).

2. **Identity `(II')`:** Apply the first and third rules to $G_2(V_\sigma) = \ell z_1 \overline{Q}_\sigma g_2(V_\sigma) + \sigma G\,\overline{Q}_\sigma g_2(V_\sigma)$:
   - The $\ell z_1$ term gives $\bigl(p + \frac{1}{4}\delta_\Delta\bigr)\phi_2(V_\sigma) + \operatorname{Re}\bigl(\overline{Q}_\sigma^2\,\sigma\ell F_1\bigr) g_2'(V_\sigma)$ as above.
   - $\frac{1}{2}\sum_j \bar{\partial}_j(\overline{Q}_\sigma g_2(V_\sigma))\,\sigma\partial_j G = \frac{1}{2}\sum_j (\ell\delta_{j1} + \sigma\overline{\partial_j G})\sigma\partial_j G\,\phi_2(V_\sigma) + \frac{1}{2}\overline{Q}_\sigma^2 g_2'(V_\sigma)\sum_j F_j \partial_j G$, whose real part is $\bigl(\frac{1}{2}k_1 + \frac{1}{8}\delta_\Delta\bigr)\phi_2(V_\sigma) + \frac{1}{2}\operatorname{Re}\bigl(\overline{Q}_\sigma^2 a(G)\bigr) g_2'(V_\sigma)$.
   Adding both pieces gives $\bigl(\frac{1}{2}k_1 + p + \frac{3}{8}\delta_\Delta\bigr)\phi_2(V_\sigma) + \frac{1}{2}\rho_\sigma Y_2(V_\sigma)$.

3. **Identity `(III')`:** Write $(c_2 - u) G_3(V_\sigma) = Q_\sigma\,H_3$ with $H_3 := (c_2 - u)\overline{Q}_\sigma g_3(V_\sigma)$, and apply $\mathbb{E}[\ell z_1 H_3] = \ell\mathbb{E}[\bar{\partial}_1 H_3]$ and $\mathbb{E}[\sigma G H_3] = \sigma\sum_j \mathbb{E}[(\partial_j H_3) F_j]$. By the product rule:
   - When the derivatives hit $\overline{Q}_\sigma g_3(V_\sigma)$, step 1 gives $(c_2 - u)\bigl[\bigl(c_2 + p + \frac{1}{4}\delta_\Delta\bigr)\phi_3(V_\sigma) + \rho_\sigma Y_3(V_\sigma)\bigr]$.
   - When $\bar{\partial}_1$ hits $c_2 - u$, we get $\ell(\bar{\partial}_1 c_2)\overline{Q}_\sigma g_3(V_\sigma)$.
   - When $\partial_j$ hits $c_2 - u = \sum_k F_k \overline{F}_k - u$, holomorphy $\partial_j \overline{F}_k = 0$ gives $\sum_j (\partial_j c_2)\sigma F_j = \sigma\sum_{j,k} (\partial_j F_k)\overline{F}_k F_j = \sigma\sum_k \overline{F}_k W_k = \sigma b_{\mathrm{loc}}$, contributing $\sigma b_{\mathrm{loc}}\overline{Q}_\sigma g_3(V_\sigma)$.
   Taking real parts gives `(III')`.

4. **Identity `(IV')`:** Apply $\mathbb{E}[\sigma G H_4] = \sigma\sum_j \mathbb{E}[(\partial_j H_4) F_j]$ to $H_4 := Q_\sigma \overline{a}_{1,\sigma} g_4(V_\sigma)$, noting $\sigma G H_4 = (Q_\sigma - \ell z_1)\overline{a}_{1,\sigma} Q_\sigma g_4(V_\sigma) = Q_\sigma^2 \overline{a}_{1,\sigma} g_4(V_\sigma) - \ell z_1 Q_\sigma \overline{a}_{1,\sigma} g_4(V_\sigma)$, whose real part is $\rho_\sigma G_4(V_\sigma) - \operatorname{Re}(\ell z_1 Q_\sigma \overline{a}_{1,\sigma}) g_4(V_\sigma)$. Since $F_1$ is holomorphic, $\partial_j \overline{a}_{1,\sigma} = \overline{\bar{\partial}_j(a(G) + 2\sigma\ell F_1)} = \overline{W}_j$, so multiplying $\partial_j H_4$ by $\sigma F_j$ and summing over $j$ gives three terms:
     - hitting $\overline{a}_{1,\sigma}$ gives $Q_\sigma g_4(V_\sigma)\sum_j \overline{W}_j \sigma F_j = \overline{\overline{Q}_\sigma \sigma b_{\mathrm{loc}}}\,g_4(V_\sigma)$, whose real part is $+\tilde{\beta}_{4,\sigma} g_4(V_\sigma)$;
     - hitting $Q_\sigma$ gives $\overline{a}_{1,\sigma} g_4(V_\sigma)\sum_j (\ell\delta_{j1} + \sigma\partial_j G)\sigma F_j = \overline{a}_{1,\sigma}\bigl(a_{1,\sigma} - \sigma\ell F_1\bigr) g_4(V_\sigma)$;
     - hitting $g_4(V_\sigma)$ gives $Q_\sigma \overline{a}_{1,\sigma} g_4'(V_\sigma)\sum_j \bigl[\overline{Q}_\sigma(\ell\delta_{j1} + \sigma\partial_j G) + Q_\sigma\sigma\overline{F}_j\bigr]\sigma F_j = V_\sigma \overline{a}_{1,\sigma}(a_{1,\sigma} - \sigma\ell F_1) g_4'(V_\sigma) + Q_\sigma^2 \overline{a}_{1,\sigma} c_2 g_4'(V_\sigma)$.
   Summing the real parts of the three terms gives $\alpha_{2,\sigma}\phi_4(V_\sigma) - \operatorname{Re}(\sigma\ell F_1 \overline{a}_{1,\sigma})\phi_4(V_\sigma) + c_2 \rho_\sigma Y_4(V_\sigma) + \tilde{\beta}_{4,\sigma} g_4(V_\sigma)$, proving `(IV')`. $\square$

### Regularity of the Piecewise-Linear Spline Family
In every certificate row on knots $0 = u_0 < u_1 < \dots < u_K$ ($u_k = e_k^2$), $\phi_i(v)$ is continuous and piecewise linear on $[0, u_K]$, constant on $[u_K, \infty)$ for $i = 3, 4$ with $\phi_3(u_K) = \phi_4(u_K) = 0$, and equal to $\phi_i(u_K) + \mathrm{slope}_i\cdot(v - u_K)$ on $[u_K, \infty)$ for $i = 1, 2$ (specifically $\phi_i(v) = \hat{\phi}_i(v) + \mathrm{slope}_i\cdot v$ on all of $[0, \infty)$, with $\hat{\phi}_i(v) \equiv \hat{\phi}_i(u_K)$ constant on $[u_K, \infty)$). Thus $G_i(v) = \int_0^v \phi_i(t)\,dt$ is $C^2$ off the knots and $C^1$ across every knot; on $[0, u_1]$, $\phi_i(v) = \alpha_i + \beta_i v$ gives $g_i(v) = G_i(v)/v = \alpha_i + \frac{1}{2}\beta_i v \in C^\infty([0, u_1])$, and for $v > 0$, $g_i'(v) = Y_i(v)/v$ is continuous across every knot $u_k > 0$. Hence $g_i \in C^1([0, \infty))$ with polynomial growth, and on $[u_K, \infty)$ both $G_3(v) \equiv G_3(u_K)$ and $G_4(v) \equiv G_4(u_K)$ are exact constants.

### Lemma 3.2 (Pointwise Zero-Mean $\pm G$ Symmetrisation)
For any $q_0, q_1, q_2 \in \mathbb{R}$ and every $z \in \mathbb{C}^n$, since $c_2(z)$ and $k_1(z)$ are even in $G$ while $\delta_\Delta(z, -1) = -\delta_\Delta(z, +1)$,
$$
\frac{1}{2}\sum_{\sigma \in \{+1, -1\}} \bigl(q_0 + 2 q_2 c_2(z) + 2 q_1 k_1(z)\bigr)\,\delta_\Delta(z, \sigma) = 0.
$$

---

## 4. Pointwise Cones, Unimodular Basis Shift, and Exact Sturm Certificate

### Lemma 4.1 (Pointwise Cone Inequalities)
At every $z \in \mathbb{C}^n$ and $\sigma \in \{+1, -1\}$ with $v = V_\sigma(z) = r^2 \ge 0$:
1. $c_2 \ge 0$, $k_1 \ge 0$, $\tilde{k}_1 = k_1 + 4p + \delta_\Delta \ge 0$, and
   $$
   16 p k_1 - \delta_\Delta^2 = 16 p\bigl(|\partial_1 G|^2 - (\operatorname{Re}\partial_1 G)^2\bigr) + 16 p \sum_{j=2}^n |\partial_j G|^2 = 16 p\,(\operatorname{Im}\partial_1 G)^2 + 16 p \sum_{j=2}^n |\partial_j G|^2 \ge 0.
   $$
2. By Cauchy–Schwarz on $a_{1,\sigma} = \sum_{j=1}^n (\partial_j G + 2\sigma\ell\delta_{j1}) F_j$ and $|\operatorname{Re}(\overline{Q}_\sigma^2 a_{1,\sigma})| \le V_\sigma |a_{1,\sigma}|$,
   $$
   \rho_\sigma^2 \le \alpha_{2,\sigma} \le \tilde{k}_1 c_2.
   $$
   In particular, for any $\xi_2(v) \ge 0$, $\xi_{t1}(v) \ge 0$, $\xi_{k1}(v) \ge 0$ with $\xi_a(v)^2 \le 4\xi_2(v)\xi_{t1}(v)$,
   $$
   \xi_2(v) c_2 + \xi_{t1}(v)\tilde{k}_1 + \xi_a(v)\rho_\sigma \ge 0 \qquad\text{and}\qquad \xi_{k1}(v) k_1 \ge 0.
   $$
3. **Split Young inequality on $(g_3 \tilde{\beta}_{3,\sigma} + g_4 \tilde{\beta}_{4,\sigma})$.** Expanding $g_3 \tilde{\beta}_{3,\sigma} + g_4 \tilde{\beta}_{4,\sigma} = (g_3 + g_4)\operatorname{Re}(\overline{Q}_\sigma \sigma b_{\mathrm{loc}}) + g_3 \ell\operatorname{Re}(\overline{Q}_\sigma \bar{\partial}_1 c_2)$ and applying the triangle inequality and Cauchy–Schwarz separately to the two original terms — using $|b_{\mathrm{loc}}| = \bigl|\sum_{k=1}^n \overline{F}_k W_k\bigr| \le \sqrt{c_2 w_G}$ on the first and $|\bar{\partial}_1 c_2| = \bigl|\sum_{k=1}^n F_k \overline{\partial_1 F_k}\bigr| \le \sqrt{c_2 \sum_{k=1}^n |\partial_1 F_k|^2}$ on the second — gives
   $$
   |g_3 \tilde{\beta}_{3,\sigma} + g_4 \tilde{\beta}_{4,\sigma}| \le |g_3 + g_4|\sqrt{v c_2 w_G} + |g_3|\sqrt{v c_2\,p\sum_{k=1}^n |\partial_1 F_k|^2}.
   $$
   Applying Young's inequality to each product (noting $v g_i(v)^2 = G_i(v)^2 / v$ for $v > 0$, while at $v = 0$ both sides vanish since $Q_\sigma = 0$ and $G_3(0) = G_4(0) = 0$) gives, for any $\mu_w > 0$, $\mu_{w1} > 0$:
   $$
   \mu_w w_G + \mu_{w1} p\sum_{k=1}^n |\partial_1 F_k|^2 - \bigl(g_3(v)\tilde{\beta}_{3,\sigma} + g_4(v)\tilde{\beta}_{4,\sigma}\bigr)
   \ge -\Bigl(\frac{(G_3(v) + G_4(v))^2}{4\mu_w v} + \frac{G_3(v)^2}{4\mu_{w1} v}\Bigr) c_2.
   $$
4. **Young inequalities on the $p$-terms of `(IV')`.** For any $\mu_T > 0$ and $\mu_{F_4} > 0$:
   $$
   -\operatorname{Re}\bigl(\ell z_1 Q_\sigma \overline{a}_{1,\sigma}\bigr) g_4(v) \ge -\frac{1}{2}\mu_T p |z_1|^2 - \frac{G_4(v)^2}{2\mu_T v}\alpha_{2,\sigma}, \qquad
   \operatorname{Re}\bigl(\sigma\ell F_1 \overline{a}_{1,\sigma}\bigr)\phi_4(v) \ge -\frac{1}{2}\mu_{F_4} p |F_1|^2 - \frac{\phi_4(v)^2}{2\mu_{F_4}}\alpha_{2,\sigma}.
   $$
   Consequently, whenever $\psi_a(v) \ge 0$ and $A_4(v) := \mu_a + \psi_a(v) - \phi_4(v) - \frac{\phi_4(v)^2}{2\mu_{F_4}} - \frac{G_4(v)^2}{2\mu_T v} \ge 0$,
   $$
   \Bigl(\mu_a - \phi_4(v) - \frac{\phi_4(v)^2}{2\mu_{F_4}} - \frac{G_4(v)^2}{2\mu_T v}\Bigr)\alpha_{2,\sigma} + \mu_\rho \rho_\sigma^2
   = \bigl(A_4(v) - \psi_a(v)\bigr)\alpha_{2,\sigma} + \mu_\rho \rho_\sigma^2
   \ge \bigl(\mu_\rho + A_4(v)\bigr)\rho_\sigma^2 - \psi_a(v)\tilde{k}_1 c_2.
   $$

### Lemma 4.2 (Unimodular Shifted-Basis Matrix $P_{\mathrm{sh}}(r)$ and Sylvester/Sturm Positivity)
Define the pointwise majorant
$$
\begin{aligned}
\mathrm{RHS}_\sigma &:= \lambda_0 + \lambda_1 V_\sigma + \lambda_2 V_\sigma^2 + \lambda_3 V_\sigma^3 + \mathrm{Br}_{1,\sigma} + \mathrm{Br}_{2,\sigma} - \mathrm{Br}_{3,\sigma} - \mathrm{Br}_{4,\sigma} \\
&\quad + (q_0 + 2 q_2 c_2 + 2 q_1 k_1)\delta_\Delta + \sigma_{\mathrm{vr}} V_\sigma \rho_\sigma
+ \begin{pmatrix} c_2 - u \\ k_1 - 2u \end{pmatrix}^\top \begin{pmatrix} m_{00} & m_{01} \\ m_{01} & m_{11} \end{pmatrix} \begin{pmatrix} c_2 - u \\ k_1 - 2u \end{pmatrix} \\
&\quad + m_\Delta \delta_\Delta^2 + \mu_a \alpha_{2,\sigma} + \mu_\rho \rho_\sigma^2 + \mu_w w_G + \mu_{w1} p\sum_{k=1}^n |\partial_1 F_k|^2 + \frac{1}{2}\mu_T p |z_1|^2 + \frac{1}{2}\mu_{F_4} p |F_1|^2,
\end{aligned}
$$
where $\mathrm{Br}_{1,\sigma}, \dots, \mathrm{Br}_{4,\sigma}$ are the four integrands of Lemma 3.1. Subtracting $r = \sqrt{V_\sigma} = |\ell z_1 + \sigma G|$ together with the nonnegative quantities $\psi_\Delta(v)(16 p k_1 - \delta_\Delta^2)$, $\xi_2(v) c_2 + \xi_{t1}(v)\tilde{k}_1 + \xi_a(v)\rho_\sigma$, and $\xi_{k1}(v) k_1$, applying Lemma 4.1(3)–(4), and substituting $\tilde{k}_1 = k_1 + 4p + \delta_\Delta$ (a unimodular congruence $z = U_p w$ with $\det U_p = 1$) expresses the lower bound in the shifted basis $w = (c_2, \delta_\Delta, k_1, \rho_\sigma, 1)^\top$ as
$$
\mathrm{RHS}_\sigma - |\ell z_1 + \sigma G| \ge w^\top P_{\mathrm{sh}}(r)\,w, \qquad
P_{\mathrm{sh}}(r) = \begin{pmatrix} M(v) & b(v) \\ b(v)^\top & q_1(v) - r \end{pmatrix} \quad (v = r^2),
$$
where $M(v)$ has entries $M_{00} = m_{00} - \phi_3(v)$, $M_{01} = q_2 - \frac{1}{8}\phi_3(v) - \frac{1}{2}\psi_a(v)$, $M_{11} = m_\Delta + \psi_\Delta(v)$, $M_{02} = m_{01} - \frac{1}{2}\psi_a(v)$, $M_{12} = q_1$, $M_{22} = m_{11}$, $M_{03} = -\frac{1}{2}(Y_3(v) + Y_4(v))$, $M_{13} = M_{23} = 0$, $M_{33} = \mu_\rho + A_4(v)$, and $b(v), q_1(v)$ are given explicitly in `verify.py` lines 318–395 (and verified identically against both $z^\top P_{\mathrm{orig}}(r) z$ and the 120-term $5 \times 5$ Leibniz determinant over $\mathbb{Q}$ in `check_identities_exact.py`).

Because $M_{13} = M_{23} = 0$, Laplace expansion along row/column 3 gives $\det M(v) = M_{33}(v) D_3(v) - M_{03}(v)^2\bigl(m_{11} M_{11}(v) - q_1^2\bigr)$, and similarly expresses $b(v)^\top \operatorname{adj}(M(v))\,b(v)$ in terms of the $3 \times 3$ cofactors $C_{ij}(v)$ of $M_{0..2,0..2}(v)$. By Sylvester's criterion, strict positivity on every knot interval $[u_k, u_{k+1}]$ and $[u_K, \infty)$ of $D_1(v) = M_{00}(v)$, $D_2(v) = C_{22}(v)$, $D_3(v)$, $\det M(v)$ (together with $A_4(v) > 0$), and strict positivity on $[e_k, e_{k+1}]$ and $[e_K, \infty)$ of $\det P_{\mathrm{sh}}(r) = (q_1(r^2) - r)\det M(r^2) - b(r^2)^\top \operatorname{adj}(M(r^2))\,b(r^2)$ (certified by exact integer Sturm chains in `(C1)`–`(C2)` of `verify.py`) imply $P_{\mathrm{sh}}(r) \succ 0$ for all $r \ge 0$, hence $|\ell z_1 + \sigma G| \le \mathrm{RHS}_\sigma$ pointwise on $\mathbb{C}^n$.

---

## 5. Exact Spiked Moments, Cross-Sector $\Delta_d$, and Integration-by-Parts Hölder `(4/3, 4)` Bound

Let $\tilde{G} := G / \sqrt{u}$ be the unit-norm rescaling of $G$, with Lean contraction scalars $\pi = (n, h, b, y, z)$ and excess fourth moment $s_G = \mathbb{E}|\tilde{G}|^4 - 2 = 32n + 8h + 32b + 96y \in [0, 42]$. Write $\mathbb{E}_{\sigma, z}[\cdot] := \frac{1}{2}\sum_{\sigma \in \{\pm 1\}} \mathbb{E}[\cdot]$.

### Lemma 5.1 (Exact $\pm G$-Averaged Moments and Cross-Sector Bound on $\Delta_d$)
1. $\mathbb{E}_{\sigma, z}[V_\sigma] = p + u = 1$, and
   $$
   \mathbb{E}_{\sigma, z}[V_\sigma^2] = 2 + u^2 s_G + \Delta_d + \Delta_F,
   $$
   where $\Delta_F := 4p\,\mathbb{E}|F_1|^2 = 4p(E_{11} + E_{01} + E_{21})$ and $\Delta_d := 4p\bigl(\mathbb{E}|\partial_1 G|^2 + \operatorname{Re}\mathbb{E}[(\partial_1 G)^2]\bigr) \ge 0$. Moreover, $\mathbb{E}_{\sigma, z}[\delta_\Delta^2] = 16p\,\mathbb{E}[(\operatorname{Re}\partial_1 G)^2] = 8p\bigl(\mathbb{E}|\partial_1 G|^2 + \operatorname{Re}\mathbb{E}[(\partial_1 G)^2]\bigr) = 2\Delta_d$.
2. Differentiating the orthogonal decomposition of §2 gives $\partial_1 G = \bar{z}_1 G_{11}(y) + \sqrt{2} z_1 G_{20}(y) + G_{10}(y) + \sqrt{2}(T - 1) G_{21}$, hence:
   $$
   \mathbb{E}|\partial_1 G|^2 = \sum_{k=1}^n \mathbb{E}|\partial_1 F_k|^2 = E_{11} + 2 E_{20} + E_{10} + 2 E_{21}, \qquad
   \mathbb{E}\bigl[(\partial_1 G)^2\bigr] = \mathbb{E}[G_{10}^2] + 2 G_{21}^2 + 2\sqrt{2}\,\mathbb{E}[G_{11} G_{20}].
   $$
   Using $|\operatorname{Re}\mathbb{E}[G_{10}^2]| \le E_{10}$, $\operatorname{Re}(G_{21}^2) \le E_{21}$, and $2\sqrt{2}\,|\mathbb{E}[G_{11} G_{20}]| \le \theta_{12} E_{11} + \frac{2}{\theta_{12}} E_{20}$ for **every** rational $\theta_{12} > 0$ yields
   $$
   0 \le \Delta_d \le p\Bigl(4(1 + \theta_{12}) E_{11} + 8\Bigl(1 + \frac{1}{\theta_{12}}\Bigr) E_{20} + 8 E_{10} + 16 E_{21}\Bigr).
   $$
3. Homogeneous Pure-Cubic and Cross Moments:
   - $\mathbb{E}[(c_2 - u)^2] = u^2(16n + 4h)$, $2\mathbb{E}[(c_2 - u)(k_1 - 2u)] = u^2(32n + 48y + 16z)$, $\mathbb{E}[(k_1 - 2u)^2] = u^2(32n + 16h + 16b + 48y + 16z)$, and $\mathbb{E}[w_G] = 24 u^2 y$ (`verify_cert.py` `(F3)` scaled by $u^2$).
   - $\mathbb{E}_{\sigma, z}[\alpha_{2,\sigma}] = \mathbb{E}|a(G)|^2 + 4p\,\mathbb{E}|F_1|^2 = u^2(32b + 24y) + \Delta_F$, and $\mathbb{E}_{\sigma, z}[\rho_\sigma^2] \le \mathbb{E}_{\sigma, z}[\alpha_{2,\sigma}]$.
   - Expanding $\overline{Q}_\sigma^2 a_{1,\sigma} = (\ell^2 \bar{z}_1^2 + 2\sigma\ell\bar{z}_1\overline{G} + \overline{G}^2)(a(G) + 2\sigma\ell F_1)$ and averaging over $\sigma \in \{\pm 1\}$ gives
     $$
     \mathbb{E}_{\sigma, z}[V_\sigma \rho_\sigma] = \operatorname{Re}\mathbb{E}\bigl[\overline{G}^2 a(G)\bigr] + 4p\operatorname{Re}\mathbb{E}\bigl[\bar{z}_1 \overline{G} F_1\bigr] + p\operatorname{Re}\mathbb{E}\bigl[\bar{z}_1^2 a(G)\bigr] = u^2(32b + 48y) + \Delta_F + p\operatorname{Re}\mathbb{E}\bigl[\bar{z}_1^2 a(G)\bigr],
     $$
     since $\mathbb{E}[\bar{z}_1 \overline{G} F_1] = \mathbb{E}[\partial_1(\overline{G} F_1)] = \mathbb{E}[|F_1|^2 + \overline{G}\,\partial_1 F_1] = \mathbb{E}|F_1|^2$ (because $\partial_1 F_1 \in H_{1,0}$ is orthogonal in $L^2$ to $G \in H_{2,1}$, so $\mathbb{E}[\overline{G}\,\partial_1 F_1] = 0$).
   - By Cauchy–Schwarz and $\mathbb{E}|z_1|^4 = 2$, $|\mathbb{E}[\bar{z}_1^2 a(G)]|^2 \le 2\,\mathbb{E}|a(G)|^2 = 2 u^2(32b + 24y)$. Thus for any $\sigma_{\mathrm{vr}} \in \mathbb{R}$ and $\mu_{\mathrm{vr}} > 0, \tau_{\mathrm{vr}} \ge 0$ with $\mu_{\mathrm{vr}}\tau_{\mathrm{vr}} \ge \sigma_{\mathrm{vr}}^2$,
     $$
     \sigma_{\mathrm{vr}}\,p\operatorname{Re}\mathbb{E}\bigl[\bar{z}_1^2 a(G)\bigr] \le \frac{1}{2}\mu_{\mathrm{vr}} p^2 + \frac{\sigma_{\mathrm{vr}}^2}{\mu_{\mathrm{vr}}}\,\mathbb{E}|a(G)|^2 \le \frac{1}{2}\mu_{\mathrm{vr}} p^2 + \tau_{\mathrm{vr}} u^2(32b + 24y).
     $$

### Lemma 5.2 (Exact $z_1$ Integration by Parts and Hölder `(4/3, 4)` Spiked Sixth-Moment Bound)
1. **Spiked sixth-moment expansion.** Averaging $V_\sigma^3 = (\ell^2 T + |G|^2 + 2\sigma\ell\operatorname{Re}(\bar{z}_1 G))^3$ over $\sigma \in \{\pm 1\}$ cancels odd powers of $\sigma$:
   $$
   \mathbb{E}_{\sigma, z}[V_\sigma^3] = \ell^6 \mathbb{E}[T^3] + 3\ell^4 \mathbb{E}[T^2 |G|^2] + 3\ell^2 \mathbb{E}[T |G|^4] + \mathbb{E}|G|^6 + 12\ell^4 \mathbb{E}\bigl[T(\operatorname{Re}\bar{z}_1 G)^2\bigr] + 12\ell^2 \mathbb{E}\bigl[|G|^2(\operatorname{Re}\bar{z}_1 G)^2\bigr].
   $$
   Since $(\operatorname{Re}\bar{z}_1 G)^2 \le T |G|^2$, the sum is bounded for all $(\ell, G)$ by
   $$
   \mathbb{E}_{\sigma, z}[V_\sigma^3] \le 6 p^3 + 15 p^2 \mathbb{E}[T^2 |G|^2] + 15 p\,\mathbb{E}[T |G|^4] + \mathbb{E}|G|^6.
   $$
   Using $\mathbb{E}[T^k] = k!$ on the orthogonal visible sectors of §2 gives the exact identity
   $$
   \mathbb{E}[T^2 |G|^2] = 2 u + 12 E_{11} + 10 E_{20} + 4 E_{10} + 4 E_{01} + 22 E_{21}.
   $$
2. **Exact $z_1$ integration by parts for $\mathbb{E}[T |G|^4]$.** Applying $\mathbb{E}[\bar{z}_1 H] = \mathbb{E}[\partial_1 H]$ to $H = z_1 |G|^4$ (or $\mathbb{E}[z_1 H] = \mathbb{E}[\bar{\partial}_1 H]$ to $\bar{z}_1 |G|^4$) gives
   $$
   \mathbb{E}[T |G|^4] = \mathbb{E}\bigl[\partial_1(z_1 |G|^4)\bigr] = \mathbb{E}|G|^4 + 2\operatorname{Re}\mathbb{E}\Bigl[|G|^2 \overline{G}\,\bigl(z_1\partial_1 G + \bar{z}_1 F_1\bigr)\Bigr].
   $$
3. **Exact visible-sector $L^4$ norms.** Decomposing $D_1 := z_1\partial_1 G + \bar{z}_1 F_1$ via §2 eliminates $G_{00}(y)$ completely:
   $$
   D_1 = 2 T G_{11}(y) + \sqrt{2} z_1^2 G_{20}(y) + z_1 G_{10}(y) + \bar{z}_1 G_{01}(y) + \frac{z_1(3T - 2)}{\sqrt{2}} G_{21}.
   $$
   Each of the five summands has an elementary exact fourth-moment bound in $(z_1, y)$:
   - **Sector `(1, 1)`:** $G_{11} \in H_{1,0}(y)$ is circular complex Gaussian ($\mathbb{E}|G_{11}|^4 = 2 E_{11}^2$) independent of $T \sim \operatorname{Exp}(1)$ ($\mathbb{E}[T^4] = 24$), so $\mathbb{E}|2 T G_{11}|^4 = 16 \cdot 24 \cdot 2 E_{11}^2 = 768 E_{11}^2$.
   - **Sector `(2, 0)`:** $G_{20} \in H_{0,1}(y)$ is circular antilinear Gaussian ($\mathbb{E}|G_{20}|^4 = 2 E_{20}^2$), so $\mathbb{E}|\sqrt{2} z_1^2 G_{20}|^4 = 4 \cdot 24 \cdot 2 E_{20}^2 = 192 E_{20}^2$.
   - **Sector `(1, 0)`:** Any real-valued $X \in H_{1,1}^{\mathbb{R}}(y)$ has the form $X = y^* H y - \operatorname{tr} H$ ($H = H^*$); diagonalising $H$ by a unitary rotation writes $X = \sum_j \mu_j(|w_j|^2 - 1)$ with $\mu_j \in \mathbb{R}$ and i.i.d. $|w_j|^2 \sim \operatorname{Exp}(1)$ ($\mathbb{E}[(|w_j|^2 - 1)^4] = 9$), giving $\mathbb{E}[X^4] = 6\sum_j \mu_j^4 + 3(\sum_j \mu_j^2)^2 \le 9\|X\|_2^4$. Writing $G_{10} = X_1 + i X_2$ with $X_1, X_2 \in H_{1,1}^{\mathbb{R}}(y)$ ($E_{10} = \|X_1\|_2^2 + \|X_2\|_2^2$) and applying Cauchy–Schwarz $\mathbb{E}[X_1^2 X_2^2] \le \sqrt{\mathbb{E}[X_1^4]\mathbb{E}[X_2^4]} \le 9\|X_1\|_2^2\|X_2\|_2^2$ gives $\mathbb{E}|G_{10}|^4 \le 9 E_{10}^2$, hence $\mathbb{E}|z_1 G_{10}|^4 = \mathbb{E}[T^2]\mathbb{E}|G_{10}|^4 \le 18 E_{10}^2$.
   - **Sector `(0, 1)`:** Any $G_{01} \in H_{2,0}(y)$ is a complex symmetric quadratic form $y^\top S y$ ($S^\top = S$). By Autonne–Takagi factorisation $S = U^\top \operatorname{diag}(\sigma_1, \dots, \sigma_{n-1}) U$ ($\sigma_j \ge 0$, $U$ unitary), $G_{01} = \sum_j \sigma_j \zeta_j^2$ in i.i.d. $\zeta_j \sim \mathcal{CN}(0, 1)$, with $E_{01} = 2\sum_j \sigma_j^2$. Phase invariance $\zeta_j \mapsto e^{i\theta_j}\zeta_j$ leaves only $j=k=l=r$ ($\mathbb{E}|\zeta_j|^8 = 24$) and $j \ne k$, $\{l, r\} = \{j, k\}$ ($2 \cdot 2 \cdot 2 = 8$), giving $\mathbb{E}|G_{01}|^4 = 16\sum_j \sigma_j^4 + 8(\sum_j \sigma_j^2)^2 \le 24(\sum_j \sigma_j^2)^2 = 6 E_{01}^2$, hence $\mathbb{E}|\bar{z}_1 G_{01}|^4 \le 12 E_{01}^2$.
   - **Sector `(2, 1)`:** $\mathbb{E}\bigl|\frac{z_1(3T - 2)}{\sqrt{2}} G_{21}\bigr|^4 = \frac{1}{4}\mathbb{E}[T^2(3T - 2)^4] E_{21}^2 = \frac{1}{4}(81\cdot 720 - 216\cdot 120 + 216\cdot 24 - 96\cdot 6 + 16\cdot 2) E_{21}^2 = 9260 E_{21}^2$.
4. **Hölder `(4/3, 4)` + 4-variable AM-GM concavity.** By Hölder's inequality with exponents $(4/3, 4)$ and the triangle inequality in $L^4$,
   $$
   \bigl|\mathbb{E}[|G|^2 \overline{G} D_1]\bigr| \le \bigl(\mathbb{E}|G|^4\bigr)^{3/4}\,\|D_1\|_4 \le \bigl(u^2(2 + s_G)\bigr)^{3/4} \sum_{S \in \{11,20,10,01,21\}} \kappa_S \sqrt{E_S},
   $$
   where $\kappa = \bigl(768^{1/4}, 192^{1/4}, 18^{1/4}, 12^{1/4}, 9260^{1/4}\bigr) \le \kappa^{\mathrm{hi}}$. On a Pythagorean ray $(\ell, m) = (a/c, b/c)$, $(u^2)^{3/4} = m^3 = (b/c)^3 \in \mathbb{Q}$ is exact. For any slab $[s_{\mathrm{lo}}, s_{\mathrm{hi}}] \subset [0, 42]$ with midpoint $s_{\mathrm{mid}} = \frac{1}{2}(s_{\mathrm{lo}} + s_{\mathrm{hi}})$ and rational $0 < q_{\mathrm{mid}} \le (2 + s_{\mathrm{mid}})^{1/4}$ (`q_mid**4 <= 2 + s_mid`), four-variable AM-GM on $(2 + s_G, 2 + s_G, 2 + s_G, 2 + s_{\mathrm{mid}})$ gives, for **every** $s_G \ge 0$,
   $$
   (2 + s_G)^{3/4} = \frac{\bigl((2 + s_G)^3(2 + s_{\mathrm{mid}})\bigr)^{1/4}}{(2 + s_{\mathrm{mid}})^{1/4}} \le \frac{3(2 + s_G) + (2 + s_{\mathrm{mid}})}{4 q_{\mathrm{mid}}} = \frac{8 + s_{\mathrm{mid}} + 3 s_G}{4 q_{\mathrm{mid}}},
   $$
   which is **affine in $s_G$**. Combining Lemmas 4.2, 5.1, and 5.2 shows that for every fixed $G$ (fixing $\hat{\pi} = \pi/s_G \in \mathcal{P}_1$ and $E \in \mathcal{E}_{\mathrm{sec}}$), $\phi(\ell, G)$ is bounded on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}]$ by $H_G(s_G) = F_{\mathrm{conv},\hat{\pi}}(s_G) + F_{\mathrm{aff},E}(s_G)$, where $F_{\mathrm{conv},\hat{\pi}}$ is convex in $s_G$ (since $l_3 \ge 0$ and $s_0, h_0 \ge 0$ on $\mathcal{P}_1$) and $F_{\mathrm{aff},E}$ is affine in $s_G$. Thus $H_G$ is convex on $[s_{\mathrm{lo}}, s_{\mathrm{hi}}]$, so $H_G(s_G) \le \max\bigl(H_G(s_{\mathrm{lo}}), H_G(s_{\mathrm{hi}})\bigr) \le \max_{s_e \in \{s_{\mathrm{lo}}, s_{\mathrm{hi}}\}}\bigl(B_{\mathrm{par}}(s_e) + B_{\mathrm{sec}}(s_e)\bigr)$, certified by exact rational LP/AM-GM duals in `(C3)` of `verify.py` (including $\kappa_S^{\mathrm{hi}} c_S \sqrt{E_S} \le a_{\mathrm{hol}, S} E_S + \frac{(\kappa_S^{\mathrm{hi}} c_S)^2}{4 a_{\mathrm{hol}, S}}$ for $a_{\mathrm{hol}, S} > 0$). $\square$

---

## 6. Certified Ray Table and Sector-Free Degree-5 Payoff Cutoff

The certificate `research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/cert_spiked.json` (`261,727` bytes, SHA-256 `85ee61e46e4a4d3cc54a1ea4fa2b043c8e1f79ae25ff3fa7cdbf3778b55fb960`) partitions $t = \|P_{1,0} h\|_2 \in [0, t_{\mathrm{right}}]$ at $t_{\mathrm{left}} = \frac{7}{20} = 0.35$ and $t_{\mathrm{right}} = \frac{221556731363189503412271}{250000000000000000000000} > \frac{\sqrt{\pi}}{2}$:
- On $[0, \frac{7}{20}]$, Theorem `4.18e` (`c_ell = 431/500`, `rho_0 = 2287/2500`) certifies $\sqrt{t^2 + s^2} \le 0.9318455613 < \frac{939}{1000}$.
- On $[\frac{7}{20}, t_{\mathrm{right}}]$, 11 strictly active primitive Pythagorean rays (`7` interior Stein + `4.18g` rays, `8` $s_G$-slabs each = `56` Sturm-certified rows over $s_G \in [0, 42]$, followed by `4` right-analytical `4.18g` rays) cover every sub-slab $[\tau_j, \tau_{j+1}]$ via Lemma 1.2 with global maximum $\sup \sqrt{t^2 + s^2} \le 0.9389788947 < \frac{939}{1000} < \sqrt{9\pi/32}$:

### Table 1: Certified Pythagorean Half-Planes $\frac{a_j}{c_j} t + \frac{b_j}{c_j} s \le R_j$

| $j$ | Kind | $(a_j, b_j, c_j)$ | $p_j = a_j^2/c_j^2$ | Max Stein bound | Certified $R_j$ | $d_{\mathrm{cut}, j}$ | Active $t$-slab $[\tau_j, \tau_{j+1}]$ |
|---:|---|---|---|---|---|---|---|
| 0 | `stein` | `(84, 187, 205)` | `7056/42025` (`0.16790`) | `0.9311991966` | `582/625` (`0.93120`) | `88913/500000` | `[7/20, 1165597/2500000]` |
| 1 | `stein` | `(28, 45, 53)` | `784/2809` (`0.27910`) | `0.9352326959` | `23381/25000` (`0.93524`) | `199943/1000000` | `[1165597/2500000, 5384943/10000000]` |
| 2 | `stein` | `(3, 4, 5)` | `9/25` (`0.36000`) | `0.9362422350` | `749/800` (`0.93625`) | `51413/250000` | `[5384943/10000000, 3094891/5000000]` |
| 3 | `stein` | `(20, 21, 29)` | `400/841` (`0.47562`) | `0.9381787257` | `46909/50000` (`0.93818`) | `21677/100000` | `[3094891/5000000, 3363767/5000000]` |
| 4 | `stein` | `(72, 65, 97)` | `5184/9409` (`0.55096`) | `0.9381888348` | `93819/100000` (`0.93819`) | `54207/250000` | `[3363767/5000000, 716323/1000000]` |
| 5 | `stein` | `(4, 3, 5)` | `16/25` (`0.64000`) | `0.9370116039` | `46851/50000` (`0.93702`) | `42011/200000` | `[716323/1000000, 7627583/10000000]` |
| 6 | `stein` | `(56, 33, 65)` | `3136/4225` (`0.74225`) | `0.9336741920` | `11671/12500` (`0.93368`) | `47817/250000` | `[7627583/10000000, 101051/125000]` |
| 7 | `analytic_418g` | `(35, 12, 37)` | `1225/1369` (`0.89481`) | `0.9162415843` (`F`) | `458121/500000` (`0.91624`) | — | `[101051/125000, 8292959/10000000]` |
| 8 | `analytic_418g` | `(24, 7, 25)` | `576/625` (`0.92160`) | `0.9098873254` (`F`) | `14217/15625` (`0.90989`) | — | `[8292959/10000000, 338341/400000]` |
| 9 | `analytic_418g` | `(40, 9, 41)` | `1600/1681` (`0.95181`) | `0.9019487328` (`F`) | `901949/1000000` (`0.90195`) | — | `[338341/400000, 8627263/10000000]` |
| 10 | `analytic_418g` | `(84, 13, 85)` | `7056/7225` (`0.97661`) | `0.8945648253` (`F`) | `178913/200000` (`0.89457`) | — | `[8627263/10000000, 221556731363189503412271/250000000000000000000000]` |

### Proof of Theorem 2(2) (Sector-Free Degree-5 Payoff Cutoffs)
For $T = P_{1,0} - e P_{2,1} + \eta P_{3,2}$ with $e = \frac{39}{50}$, $\eta = \frac{779}{10000}$, target $\tau = \frac{500}{701}$, $t = \|P_{1,0} h\|_2$, $A = s^2 = \|P_{2,1} k\|_2^2$, and $K = \|k\|_2^2$, `ELLIPTIC.md` §3 (`STATUS.md` row `4.18e`, **P + C**) establishes:
- **Parseval regime ($K \ge A$):** $V \le \eta + (1 - \eta) t^2 + (e - \eta) s^2$, which is strictly $< \frac{500}{701}$ on $[0, 0.34554022]$ at $\rho_0 = \frac{2287}{2500}$.
- **Lean mass regime ($\frac{25}{31} A - \frac{2141}{3906} K \le S$):** $V \le \eta(1 + S/m) + (1 - \eta) t^2 + \bigl(e - \eta\frac{\hat{e}}{m}\bigr) s^2$, which is strictly $< \frac{500}{701}$ on $[0, 0.35859076]$ at $\rho_0 = \frac{2287}{2500}$.

Both upper bounds have the form $V \le \alpha_0 + \alpha_2 t^2 + \beta_2 s^2$ with $\alpha_2, \beta_2 > 0$. On any sub-interval $[t_A, t_B]$ where a certified ray $(\ell_j, m_j, R_j)$ applies, $0 \le s \le \max\bigl(0, (R_j - \ell_j t)/m_j\bigr)$ implies
$$
V \le Q_j(t) := \alpha_0 + \alpha_2 t^2 + \beta_2 \max\Bigl(0,\, \frac{R_j - \ell_j t}{m_j}\Bigr)^2,
$$
which is convex in $t$ on $\mathbb{R}$ by the same convexity argument as Lemma 1.2. Therefore $\max_{t \in [t_A, t_B]} Q_j(t) = \max\bigl(Q_j(t_A), Q_j(t_B)\bigr)$. Checking $Q_j(t_A) < \frac{500}{701}$ and $Q_j(t_B) < \frac{500}{701}$ on the contiguous rational sub-segments from $t_{\mathrm{ell}}$ to $t_*$ in `verify.py` §4 proves $V < \frac{500}{701}$ for all $t \in [0, t_*]$, while $\min_j Q_j(t_* + 10^{-8}) > \frac{500}{701}$ confirms that this 11-ray + Lean-mass upper envelope crosses $\frac{500}{701}$ on the next $10^{-8}$ grid step. $\square$

---

## 7. Verification Commands and Negative Controls

From the repository root, all three verification scripts run under isolated Python 3 (`python3 -I`, standard library only, zero floating-point literals or calls, enforced via `ast` inspection in `test_controls.py`). By default `verify.py` binds both Theorem 1 (`0 < r_1 <= 939/1000` and `worst_poly_sq < (939/1000)^2`) and Theorem 2(2) (requiring `degree5_midt.lean_mass` coverage through $\frac{9190839}{25000000}$); passing `--radius-only` (or calling `verify_radius_only`) ignores `degree5_midt` and reports whatever generic positive radius bound the certificate establishes:

```sh
python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/verify.py
python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/verify.py --radius-only
python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/check_identities_exact.py
python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/test_controls.py
```

### Mandatory and Adversarial Controls Verified in `test_controls.py`
1. **AST zero-float & stdlib-only audit (`Control 1`):** Parses `verify.py`, `check_identities_exact.py`, and `test_controls.py` via `ast` and rejects any `float` literal, `float(...)` call, or non-stdlib import.
2. **Impossible claim below diffuse Gaussian limit, sign controls, and Theorem 1 target binding (`Controls 2a–2d`, `P7` §6):** Proves $(22/25)^2 < \pi/4$ in exact rationals (corresponding to the diffuse equality family $f = \operatorname{ph}(z_1 + c W)$, $g = \operatorname{ph}(z_1 - c W)$) and verifies that mutating `claim` to `"22/25"` (`0.88`), mutating `claim` to `"-939/1000"` (rejected before squaring), negating a ray radius `R_0`, or weakening `claim` to `"9399/10000"` with `t_slabs[3] = "3101391/5000000"` is rejected by `verify.py` in theorem mode.
3. **Unsymmetrised two-chaos barrier and $\pm G$ symmetrisation necessity (`Control 3a–3c`, `P7` §6 & §7 item 5):**
   - For $F(z_1) = z_1\bigl(1 - \frac{T - 2}{4}\bigr) \in H_{1,0} \oplus H_{2,1}$ ($T = |z_1|^2$, $\|F\|_2^2 = \frac{9}{8}$), using $|6 - T| = (6 - T) + 2(T - 6)\mathbf{1}_{T > 6}$ and $\sqrt{T} \ge \sqrt{6} + (\sqrt{7} - \sqrt{6})\mathbf{1}_{T \ge 7}$ on $[6, \infty)$ gives
     $$
     \mathbb{E}|F| = \frac{9}{16}\sqrt{\pi} + \frac{1}{2}\int_6^\infty e^{-T}\sqrt{T}(T - 6)\,dT \ge \frac{9}{16}\sqrt{\pi} + \frac{\sqrt{6}}{2} e^{-6} + (\sqrt{7} - \sqrt{6}) e^{-7},
     $$
     certifying in exact `Fraction` arithmetic that $\mathbb{E}|F|/\|F\|_2 > 0.9430 > \sqrt{9\pi/32} > 0.93998$.
   - Verifies that `verify.py` rejects `claim = "47/50"` (`0.94 > \sqrt{9\pi/32}`) and rejects `cert_spiked.json` when the odd-in-$G$ symmetrisation multipliers `q_sym = (q_0, q_1, q_2)` are zeroed.
4. **Structural corruption and Theorem 2(2) binding controls (`Controls 4–8f`):** Verifies rejection upon truncating the $s_G$ cover to $[0, 41] < 42$, making $\phi_4[K] \ne 0$ on $[u_K, \infty)$, perturbing an interior Sturm spline knot (`phi1[4]`), shrinking $t_{\mathrm{right}}$ below $\sqrt{\pi}/2$, inflating the degree-5 mid-$t$ cutoff by $+10^{-7}$ past the envelope crossing, deleting `degree5_midt.lean_mass` or `degree5_midt` (while confirming `verify_radius_only` ignores an invalid `degree5_midt` block and certifies the generic radius claim `9399/10000`), or lowering `lean_mass.t_cutoff` below $\frac{9190839}{25000000}$.
