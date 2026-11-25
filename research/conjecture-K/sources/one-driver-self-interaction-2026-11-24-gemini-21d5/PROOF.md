# Complete Closure of the One-Driver Self-Interaction Family in Conjecture K (Layer L4)

- **Agent-ID:** `gemini-21d5`
- **Date:** 25 November 2026
- **Status:** **`P + C, author only`** (awaiting independent cross-family re-derivation and replay)
- **Refs:** [#509](https://github.com/agalatan/grothendieck-lean/issues/509) (`STATUS.md` rows `6.3.5`, `6.3.6`, `6.3.7`, `6.3.13`, `6.3.14`, `6.3.15`; `MONOGRAPH.md` §2.5, §3 item 6)
- **Code & Certificate:** [`../../code/one-driver-self-interaction-gemini-21d5/`](../../code/one-driver-self-interaction-gemini-21d5/) (`certify_one_driver.cpp`, `result.json`, `verify_one_driver.py`)

---

## 1. Main Theorem and Summary of Results

Let $X \sim \mathcal{CN}(0, 1)$ be a standard proper complex Gaussian driver and $Y \sim \mathcal{CN}(0, I_d)$ ($d \ge 1$) be an independent remote Gaussian vector. Consider the general **one-driver self-interaction family** in $H_{2,1}(\mathbb{C}^{1+d})$:
$$q(X, Y) = X\Big(c\big(|X|^2 - 2\big) + P(Y)\Big), \qquad c \in \mathbb{C},\quad \mathbb{E}[P] = 0,$$
with total energy and Wick share
$$u := \mathbb{E}|q|^2 = 2|c|^2 + p, \qquad p := \mathbb{E}|P|^2 \ge 0, \qquad f := \frac{2|c|^2}{u} \in [0, 1].$$

For a visible profile $(a, b)$ ($a > 0, b > 0$) with $L(z_1) = z_1(a + b|z_1|^2)$ ($z_1 \sim \mathcal{CN}(0, 1)$ independent of $(X, Y)$), recall the radial potential, Gaussian benchmark, deficit, and raw A-sector content (`STATUS.md` §0, §6.2–6.3):
$$F_0(w) = 2\,\mathbb{E}_{z_1}\big|L(z_1) + w\big| = B_0 + \Phi(|w|^2), \qquad B_0 = F_0(0) = \sqrt{\pi}\left(a + \frac{3}{2}b\right),$$
$$B(u) = B_0 + \mathbb{E}_{R \sim \mathrm{Exp}(1)}\big[\Phi(uR)\big], \qquad D(q) = B(u) - \mathbb{E}\big[F_0(q)\big],$$
$$F_A(w) = \mathbb{E}_{z_1}\Big[(|z_1|^2 - 1)\,\mathrm{ph}\big(L(z_1) + w\big)\Big] = w\,g(|w|^2), \qquad C(q) = \big\|\Pi_{1,0}\big[F_A(q)\big]\big\|_2 = \big|\mathbb{E}\big[\overline{X}\,F_A(q)\big]\big|.$$
The three visible profile rows of the monograph (`STATUS.md` §0, §6.3) are:
- **`peak`:** $\varepsilon = \frac{1891}{2500}$, $a = \frac{699}{1250}$, $b = \frac{179}{1250}$ (fourth-moment parameter $b_4 = \frac{37}{1000}$),
- **`flank`:** $\varepsilon = \frac{149}{200}$, $a = \frac{14}{25}$, $b = \frac{1467}{10000}$ ($b_4 = \frac{37}{1000}$),
- **`upper`:** $\varepsilon = \frac{1891}{2500}$, $a = \frac{573}{1000}$, $b = \frac{19}{125}$ ($b_4 = \frac{7}{200}$).

Every row satisfies $3b < a$ and $a^2 > \frac{5}{16}$.

### Theorem 1.1 (Complete Closure of the One-Driver Self-Interaction Family)
Across the entire Layer L4 energy band
$$u \in \left[\frac{551}{100000},\ \frac{463}{10000}\right] = [0.00551,\ 0.0463],$$
at **all three** visible profile rows (`peak`, `flank`, `upper`), for every $c \in \mathbb{C}$ (arbitrary complex phase relative to $P$):

1. **Size-Biased Bregman Identity and Strictly Positive Wick Curvature (`6.3.7`, Gate 1):**
   Setting $w_c(R, z) = c(R - 2) + z$ and $I_c(z) = \mathbb{E}_{R \sim \mathrm{Exp}(1)}[\Phi(R|w_c(R, z)|^2)]$, the deficit decomposes for every centred $P \in L^2$ with $\mathbb{E}|P|^2 = u - 2|c|^2$ as
   $$D(q) = \mathbb{E}_P\big[H_{c,u}(P)\big], \qquad H_{c,u}(z) := B(u) - B_0 - I_c(z) + B'(u)\big(|z|^2 + 2|c|^2 - u\big) + 2uB''(u)\,\mathrm{Re}(\bar c z).$$
   Moreover, for every $z \in \mathbb{C}$,
   $$H_{c,u}(z) = \int_0^\infty e^{-R}\,d_{\Phi, uR}\big(R|w_c(R, z)|^2\big)\,dR + |c|^2\,\mathcal{K}(u) \ge |c|^2\,\mathcal{K}(u) \ge 0,$$
   where $d_{\Phi, s}(v) = \Phi(s) + \Phi'(s)(v - s) - \Phi(v) \ge 0$ is the concave Bregman divergence of $\Phi$, and
   $$\mathcal{K}(u) = \int_0^\infty R\big(2 - (R - 2)^2\big)e^{-R}\Phi'(uR)\,dR > \frac{3}{200} > 0$$
   throughout $u \in [0.00551, 0.0463]$ at all three rows. At `peak`, $\mathcal{K}(0.0463) \in (0.166781, 0.166783)$.

2. **Direct Wick Perturbation Certificate (`6.3.6`, $f \in [4/5, 1]$, i.e. $p \le u/5$, Gate 2):**
   Both scalar numerical premises of `CERT §5` / `6.3.6` hold rigorously across all three rows, proving directly that for every centred $P \in L^2$ independent of $X$ with $p = \mathbb{E}|P|^2 \le u/5$,
   $$C(q)^2 \le \frac{9}{40}\,D(q) \qquad \left(\frac{9}{40} = 0.225 < \frac{6}{25} = 0.24\right).$$

3. **Unified and Original Pointwise Envelopes on Moderate-to-Full Wick Share (`6.3.13` & `6.3.15`, Gates 3 & 4):**
   Let $T_c(z) = \mathbb{E}_{R \sim \mathrm{Exp}(1)}[R\,w_c(R, z)\,g(R|w_c(R, z)|^2)]$ and $\lambda(u) = \int_0^\infty R e^{-R} g(uR)\,dR$, so that $C(q) = |\mathbb{E}_P[T_c(P) - \lambda(u)P]|$.
   - **(Unified envelope $(\star_u)$ across all $f \in [1/16, 1]$, Gate 3):** For all $u \in [0.00551, 0.0463]$, all $c \in \mathbb{C}$ with $f = 2|c|^2/u \in [1/16, 1]$, and all $z \in \mathbb{C}$,
     $$\big|T_c(z) - \lambda(u)z\big|^2 \le H_{c,u}(z)\left(\frac{3}{50} + \frac{4}{25}\,\frac{2|c|^2 + |z|^2}{u} - \frac{1}{10}\,\frac{\mathrm{Re}(\bar c z)}{u}\right). \tag{$\star_u$}$$
     Notice $(\star_u)$ has **no $1/p$ singularity** as $p \to 0$ ($f \to 1$). For **every** centred $P \in L^2$ independent of $X$ with $\mathbb{E}|P|^2 = u - 2|c|^2$, Cauchy–Schwarz gives
     $$C(q)^2 \le \frac{11}{50}\,D(q) \qquad \left(\frac{11}{50} = 0.22 < \frac{9}{40} < \frac{6}{25}\right).$$
   - **(Original envelope $(\star)$ of `6.3.13` on $f \in [1/16, 4/5]$, Gate 4):** On $f \in [1/16, 4/5]$, the original pointwise inequality
     $$\big|T_c(z) - \lambda(u)z\big|^2 \le H_{c,u}(z)\left(\frac{9}{100} + \frac{13}{100}\,\frac{|z|^2}{p}\right) \tag{$\star$}$$
     also holds for all $z \in \mathbb{C}$ across the **entire** band $u \in [0.00551, 0.0463]$ (closing both `6.3.13` and `6.3.15`), likewise yielding $C(q)^2 \le \frac{11}{50}\,D(q)$ for every centred $P \in L^2$.

4. **Small-Wick Strip (`6.3.14`, $f \in [0, 1/16]$, Gate 5):**
   With affine weight $w(y) = \frac{3}{10} + \frac{7}{10}y$ and sixth-moment multiplier polynomial
   $$Q(y) = \frac{59}{500}(y - 1) + b_4(2 - y^2) + \frac{21}{200000}(y^3 - 37y^2 + 68),$$
   the pointwise inequality
   $$\frac{\big|T_c(z) - \lambda(u)z\big|^2}{w(|z|^2/p)} \le \frac{47}{200}\,H_{c,u}(z) + p^2 Q(|z|^2/p) \tag{$\dagger$}$$
   holds for all $u \in [0.00551, 0.0463]$, all $c \in \mathbb{C}$ with $f = 2|c|^2/u \in [0, 1/16]$ ($p = u - 2|c|^2 \ge \frac{15}{16}u > 0$), and all $z \in \mathbb{C}$. For every centred $P$ satisfying the moment bounds $\mathbb{E}|P|^4 \ge 2p^2$ and $\mathbb{E}|P|^6 \le 37p\,\mathbb{E}|P|^4 - 68p^3$ of `6.3.1`—in particular, **every** complex quadratic $P(Y) = Y^* A Y - \mathrm{tr}\,A$ ($A \in \mathbb{C}^{d \times d}$ arbitrary, non-Hermitian)—$\mathbb{E}[p^2 Q(|P|^2/p)] \le 0$ and $\mathbb{E}[w(|P|^2/p)] = 1$, giving
   $$C(q)^2 \le \frac{47}{200}\,D(q) \qquad \left(\frac{47}{200} = 0.235 < \frac{6}{25} = 0.24\right).$$

5. **Global Corollary Across All Shares $f \in [0, 1]$ (`6.3.5` Superseded & `6.3.9b` Core Premise Extended):**
   Combining $(\star_u)$ on $f \in [1/16, 1]$ ($\kappa = \frac{11}{50}$) and $(\dagger)$ on $f \in [0, 1/16]$ ($\kappa = \frac{47}{200}$), **every** one-driver self-interacting cubic $q = X(c(|X|^2 - 2) + Y^* A Y - \mathrm{tr}\,A)$ with arbitrary $c \in \mathbb{C}$, arbitrary non-Hermitian $A \in \mathbb{C}^{d \times d}$, arbitrary $d \ge 1$, and $u \in [0.00551, 0.0463]$ satisfies
   $$C(q)^2 \le \frac{47}{200}\,D(q) < \frac{6}{25}\,D(q)$$
   at all three rows (`peak`, `flank`, `upper`), with $D(q) > 0$ for all $q \ne 0$. This removes the real-$c$, Hermitian-$A$, $u \ge 0.03$, and $1/40000$ reserve restrictions of `6.3.5`. Moreover, at the `peak` row on $H_{2,1}$, for $f \in [1/16, 1]$ we have $C(q)^2 \le \frac{11}{50}D(q) < \frac{9}{40}D(q)$, so the mixed-character perturbation theorem `6.3.9b` applies at the `peak` row to perturbations in $H_{2,1}$ around every one-driver core with $f \in [1/16, 1]$ across the full energy band.

---

## 2. Phase Reduction and Complete Monotonicity of the Nonsingular $(y, \beta)$ Kernels

### 2.1 Reduction to real $c \ge 0$ and $\mathrm{Im}\,z \ge 0$
If $c = |c|e^{i\alpha}$, write $P = e^{i\alpha}\widetilde{P}$ and $q = e^{i\alpha} X(|c|(|X|^2 - 2) + \widetilde{P})$. Since $F_0(e^{i\alpha}w) = F_0(w)$, $F_A(e^{i\alpha}w) = e^{i\alpha}F_A(w)$, and the moment conditions of `6.3.1` are $U(1)$-invariant, $D(q)$, $C(q)$, $H_{c,u}(z)$, and $|T_c(z) - \lambda(u)z|$ are invariant under $(c, z) \mapsto (|c|, e^{-i\alpha}z)$. Furthermore, for $c \ge 0$, $w_c(R, \bar z) = \overline{w_c(R, z)}$, so $I_c(\bar z) = I_c(z)$, $H_{c,u}(\bar z) = H_{c,u}(z)$, and $T_c(\bar z) = \overline{T_c(z)}$. All pointwise inequalities therefore reduce without loss of generality to
$$c \ge 0, \qquad z = z_1 + i z_2 \in \mathbb{C} \quad\text{with}\quad z_1 \in \mathbb{R},\ z_2 \ge 0.$$

### 2.2 Nonsingular $(y, \beta)$ integral representations and complete monotonicity
Let $s(t) := t(a + bt)^2$ for $t \ge 0$. Since $s'(t) = (a + bt)(a + 3bt) > 0$ on $[0, \infty)$, $s : [0, \infty) \to [0, \infty)$ has a smooth inverse $\iota : [0, \infty) \to [0, \infty)$ satisfying $\iota(0) = 0$ and $\iota'(0) = 1/a^2$.

**Lemma 2.1 (Complete monotonicity and nonsingular $(y, \beta)$ kernels).**
For every $a > 0$ and $b > 0$:
1. The functions $f_0(\sigma) := e^{-\iota(\sigma)}$, $-f_0'(\sigma) = \frac{e^{-\iota(\sigma)}}{(a + b\iota(\sigma))(a + 3b\iota(\sigma))}$, and $h_0(\sigma) := \frac{e^{-\iota(\sigma)}}{(a + b\iota(\sigma))^2}$ are **completely monotone** on $[0, \infty)$: $(-1)^m f_0^{(m)}(\sigma) > 0$, $(-1)^m (-f_0')^{(m)}(\sigma) > 0$, and $(-1)^m h_0^{(m)}(\sigma) > 0$ for all $m \ge 0$.
2. Setting for $s \ge 0$
   $$J_m(s) := \int_0^\infty (-1)^m h_0^{(m)}(y^2 + s)\,dy > 0, \qquad L_m(s) := \int_0^\infty (-1)^m (-f_0')^{(m)}(y^2 + s)\,dy > 0,$$
   we have $J_m'(s) = -J_{m+1}(s)$ and $L_m'(s) = -L_{m+1}(s)$, and for every $v \ge 0$ and $m \ge 0$:
   $$(-1)^{m+1} g^{(m)}(v) = \frac{2}{\pi}\int_0^{\pi/2} \sin^{2m+2}\beta\,J_m(v\sin^2\beta)\,d\beta > 0,$$
   $$(-1)^m \Phi^{(m+1)}(v) = \frac{4}{\pi}\int_0^{\pi/2} \cos^2\beta\sin^{2m}\beta\,L_m(v\sin^2\beta)\,d\beta > 0.$$
   In particular, $-g(v)$, $g'(v)$, $\Phi'(v)$, and $-\Phi''(v)$ are positive, strictly decreasing, and strictly convex on $[0, \infty)$, while $\Phi(v)$ is strictly increasing and strictly concave on $[0, \infty)$ with
   $$2\sqrt{v} - B_0 \le \Phi(v) \le \min\!\left(2\sqrt{v},\ 2\sqrt{v} - B_0 + \frac{\mathbb{E}|L|^2}{\sqrt{v}}\right) \qquad \forall v > 0,$$
   where $\mathbb{E}|L|^2 = a^2 + 4ab + 6b^2$.

*Proof.*
On $\mathbb{C} \setminus (-\infty, 0]$, $s'(t) = 0$ occurs only at $t = -a/b < 0$ and $t = -a/(3b) < 0$, with critical values $s(-a/b) = 0$ and $s(-a/(3b)) = -\frac{4a^3}{27b} < 0$. On the upper half-plane $\mathbb{H} = \{\mathrm{Im}\,\sigma > 0\}$, $\iota(\sigma)$ cannot cross $(0, \infty)$ (where $s(r) > 0$) or $(-\infty, 0]$ (where $s(-x) = -x(a - bx)^2 \le 0$). By continuity from $\sigma = i\varepsilon$ ($\iota(i\varepsilon) \sim i\varepsilon/a^2 \in \mathbb{H}$), $\iota$ maps $\mathbb{H}$ into $\mathbb{H}$ and is positive on $(0, \infty)$, so $\iota$ is a positive Pick/Bernstein function on $(0, \infty)$. Since $t \mapsto e^{-t}$ is completely monotone and $\iota$ is Bernstein, $f_0(\sigma) = e^{-\iota(\sigma)}$ and $-f_0'(\sigma)$ are completely monotone; likewise $1 + (b/a)\iota(\sigma)$ is Bernstein, so $(a + b\iota(\sigma))^{-2} = a^{-2}(1 + (b/a)\iota(\sigma))^{-2}$ is completely monotone, and therefore the product $h_0(\sigma) = e^{-\iota(\sigma)}(a + b\iota(\sigma))^{-2}$ is completely monotone. (Positivity of $(-1)^m h_0^{(m)}$ and $(-1)^m(-f_0')^{(m)}$ for $m = 0 \dots 5$ is also checked mechanically on all $6144$ panels in `certify_one_driver.cpp`.)

The $(y, \beta)$ integral representations for $m = 0$ are the standard radial-ridge transforms (`STATUS.md` `2.7`, `A15T`), and differentiating $m$ times under the integral sign gives (2) for all $m \ge 0$. Finally, for $\Phi(v) = 2\,\mathbb{E}_{z_1}|L + \sqrt{v}| - B_0$:
- By convexity of $|\cdot|$ and $\mathbb{E}[L] = 0$, $2\,\mathbb{E}|L + \sqrt{v}| \ge 2|\mathbb{E}[L + \sqrt{v}]| = 2\sqrt{v}$, giving $\Phi(v) \ge 2\sqrt{v} - B_0$.
- By the triangle inequality $|L + \sqrt{v}| - |L| \le \sqrt{v}$, taking $2\,\mathbb{E}_{z_1}$ gives $\Phi(v) \le 2\sqrt{v}$.
- By concavity of $\sqrt{\cdot}$ on $[0, \infty)$, $\sqrt{x} \le \sqrt{v} + \frac{x - v}{2\sqrt{v}}$ applied to $x = |L + \sqrt{v}|^2 = v + 2\sqrt{v}\,\mathrm{Re}\,L + |L|^2 \ge 0$ yields $|L + \sqrt{v}| \le \sqrt{v} + \mathrm{Re}\,L + \frac{|L|^2}{2\sqrt{v}}$; multiplying by $2$ and taking $\mathbb{E}_{z_1}$ ($\mathbb{E}[\mathrm{Re}\,L] = 0$) gives $\Phi(v) \le 2\sqrt{v} - B_0 + \frac{\mathbb{E}|L|^2}{\sqrt{v}}$. $\square$

---

## 3. Exact Size-Biased Bregman Identity (`6.3.7`) and Gate 1

Write $R = |X|^2 \sim \mathrm{Exp}(1)$. Conditional on $Y$, $F_0(q(X, Y)) = B_0 + \Phi(R|w_c(R, P(Y))|^2)$, so $\mathbb{E}[F_0(q)] = B_0 + \mathbb{E}_P[I_c(P)]$. Since $\mathbb{E}[|P|^2 + 2|c|^2 - u] = 0$ and $\mathbb{E}[P] = 0$, adding $B'(u)(|P|^2 + 2|c|^2 - u) + 2uB''(u)\,\mathrm{Re}(\bar c P)$ leaves the expectation unchanged: $D(q) = \mathbb{E}_P[H_{c,u}(P)]$.

**Proposition 3.1 (Proof of `6.3.7`).**
For every $u > 0$, $c \in \mathbb{C}$, and $z \in \mathbb{C}$,
$$H_{c,u}(z) = \int_0^\infty e^{-R}\Big[\Phi(uR) + \Phi'(uR)\big(R|w_c(R, z)|^2 - uR\big) - \Phi\big(R|w_c(R, z)|^2\big)\Big]dR + |c|^2\mathcal{K}(u).$$

*Proof.*
The $\Phi(uR) - \Phi(R|w_c|^2)$ terms integrate to $B(u) - B_0 - I_c(z)$. Expanding $|w_c(R, z)|^2 = |c|^2(R - 2)^2 + 2(R - 2)\,\mathrm{Re}(\bar c z) + |z|^2$ in the linear term gives
$$\int_0^\infty R e^{-R}\Phi'(uR)\Big(|z|^2 - u + 2(R - 2)\,\mathrm{Re}(\bar c z) + |c|^2(R - 2)^2\Big)dR.$$
Here $\int_0^\infty R e^{-R}\Phi'(uR)\,dR = B'(u)$, while integrating $uB''(u) = \int_0^\infty R e^{-R}\,uR\Phi''(uR)\,dR = \int_0^\infty R^2 e^{-R}\frac{d}{dR}[\Phi'(uR)]\,dR$ by parts gives $\int_0^\infty R(R - 2)e^{-R}\Phi'(uR)\,dR = uB''(u)$. Collecting the $|c|^2$ coefficient leaves $2B'(u) - \int_0^\infty R(R - 2)^2 e^{-R}\Phi'(uR)\,dR = \mathcal{K}(u)$. Strict concavity of $\Phi$ gives $d_{\Phi, uR}(v) \ge 0$ pointwise (with equality iff $v = uR$), so $H_{c,u}(z) \ge |c|^2\mathcal{K}(u)$. In particular, for $q \ne 0$ ($u > 0$) on the quadratic class $P = Y^* A Y - \mathrm{tr}\,A$, we have $D(q) > 0$: if $c \ne 0$, $D(q) \ge |c|^2\mathcal{K}(u) > 0$ by `Gate 1`; if $c = 0$, then $p = u > 0$, and $D(q) = 0$ would force $d_{\Phi, uR}(R|P|^2) = 0$ a.e., hence $R|P|^2 = Ru$ a.s. and $|P|^2 = p$ a.s. since $R > 0$ a.s., contradicting $\mathbb{E}|P|^4 \ge 2p^2 > p^2$ (`6.3.1`). $\square$

Furthermore, differentiating $\mathcal{K}(u)$ under the integral sign gives $\mathcal{K}'(u) = \int_0^\infty R^2(2 - (R - 2)^2)e^{-R}\Phi''(uR)\,dR$. Since $|2 - (R - 2)^2| \le 2 + (R - 2)^2 = R^2 - 4R + 6$ for all $R \ge 0$ and $|\Phi''(uR)| \le -\Phi''(0)$, we obtain the exact global Lipschitz constant
$$\big|\mathcal{K}'(u)\big| \le (-\Phi''(0))\int_0^\infty (R^4 - 4R^3 + 6R^2)e^{-R}\,dR = (24 - 24 + 12)(-\Phi''(0)) = 12(-\Phi''(0)),$$
which `Gate 1` uses across $256$ slabs of $[0.00551, 0.0463]$ to certify $\mathcal{K}(u) > \frac{3}{200} > 0$ on the entire band at all three rows.

---

## 4. Exact $\sqrt{\pi}$-Cancelling Quadratic Taylor Sandwiches on 4D Boxes

### Proposition 4.1 (Exact Quadratic Taylor Sandwiches for $I_c(z)$ and $T_c(z)$)
Let $(c_0, z_0) \in \mathbb{R} \times \mathbb{C}$ and $(c, z) = (c_0 + \delta c, z_0 + \delta z)$ with $\delta c \in \mathbb{R}$ and $\delta z = \delta z_1 + i\,\delta z_2 \in \mathbb{C}$. Then:
1. **Convexity sandwich for $I_c(z)$:**
   $$0 \le I_c(z) - \Big(I_{c_0}(z_0) + \partial_c I_{c_0}(z_0)\,\delta c + \nabla_z I_{c_0}(z_0)\cdot \delta z\Big) \le \Phi'(0)\Big(2(\delta c)^2 + |\delta z|^2\Big).$$
2. **Exact Hessian remainder for $T_c(z)$:**
   $$\Big|T_c(z) - \Big(T_{c_0}(z_0) + \partial_c T_{c_0}(z_0)\,\delta c + D_z T_{c_0}(z_0)[\delta z]\Big)\Big| \le \frac{1}{2a^2}\left(\frac{11}{4}(\delta c)^2 + |\delta c|\,|\delta z_1| + |\delta z|^2\right).$$

*Proof.*
1. Write $\psi(w) := \Phi(|w|^2) = 2\,\mathbb{E}_{z_1}|L(z_1) + w| - B_0$ on $\mathbb{R}^2$. Since $w \mapsto |L(z_1) + w|$ is convex, $D^2_w\psi(w) \succeq 0$. Its radial and angular eigenvalues $2\Phi'(|w|^2) + 4|w|^2\Phi''(|w|^2)$ and $2\Phi'(|w|^2)$ both lie in $[0, 2\Phi'(0)]$ because $\Phi' > 0$ is decreasing and $\Phi'' < 0$. Integrating $\frac{1}{2}\cdot 2\Phi'(0)\,R|\delta c(R - 2) + \delta z|^2$ against $e^{-R}\,dR$ with $\mathbb{E}[R] = 1$, $\mathbb{E}[R(R - 2)] = 0$, $\mathbb{E}[R(R - 2)^2] = 2$ gives (1).

2. For $f(w) = F_A(w) = w g(|w|^2)$ at $w = r e^{i\alpha}$ and any unit $h = (h_\parallel + i h_\perp)e^{i\alpha}$ ($h_\parallel, h_\perp \in \mathbb{R}$, $h_\parallel^2 + h_\perp^2 = 1$), expanding $f(w + th) = e^{i\alpha}(r + th_\parallel + ith_\perp)g(r^2 + 2trh_\parallel + t^2)$ to order $t^2$ gives
   $$D^2_w f(w)[h, h] = e^{i\alpha}\Big[\big((2 + 4h_\parallel^2)r g'(r^2) + 4h_\parallel^2 r^3 g''(r^2)\big) + 4i h_\parallel h_\perp r g'(r^2)\Big].$$
   By Lemma 2.1, $h_0(\sigma) = \int_0^\infty e^{-\lambda\sigma}\,\mu_h(d\lambda)$ ($\mu_h \ge 0$) with $\int_0^\infty \mu_h(d\lambda) = h_0(0) = \frac{1}{a^2}$. Integrating over $y \in (0, \infty)$ and $\beta \in (0, \pi/2)$ expresses $-g(s) = \int_0^\infty e^{-\tau s}\,\nu_A(d\tau)$ ($\nu_A \ge 0$) with half-moment
   $$\int_0^\infty \sqrt{\tau}\,\nu_A(d\tau) = \frac{2}{\pi}\int_0^{\pi/2}\sin^3\beta\,d\beta \int_0^\infty \frac{\sqrt{\pi}}{2}\,\mu_h(d\lambda) = \frac{2}{\pi}\cdot\frac{2}{3}\cdot\frac{\sqrt{\pi}}{2a^2} = \frac{2}{3\sqrt{\pi}\,a^2}.$$
   For each Laplace atom $f_\tau(w) := w e^{-\tau |w|^2}$ ($\tau > 0$), putting $s = \tau r^2 \ge 0$ and $t = h_\parallel^2 \in [0, 1]$ ($h_\parallel^2 h_\perp^2 = t(1 - t)$) gives
   $$\frac{|D^2_w f_\tau(w)[h, h]|^2}{\tau} = 4s e^{-2s}\Big[\big(-1 + 2(s - 1)t\big)^2 + 4t(1 - t)\Big] = 4s e^{-2s}\Big[1 + 4(2 - s)t - 4s(2 - s)t^2\Big] =: Q_s(t).$$
   We bound $Q_s(t) \le 4$ on $t \in [0, 1]$ for all $s \ge 0$:
   - For $0 \le s < \frac{1}{2}$, $Q_s'(t) = 16s e^{-2s}(2 - s)(1 - 2st) \ge 0$ on $[0, 1]$, so $Q_s(t) \le Q_s(1) = 4s(3 - 2s)^2 e^{-2s} < 4$ (for $s \ge 0$, the critical points of $s(3 - 2s)^2 e^{-2s}$ are $s = \frac{3 \pm \sqrt{6}}{2}$, giving $12(3 - \sqrt{6})e^{\sqrt{6} - 3} \approx 3.8095 < 4$ and $12(3 + \sqrt{6})e^{-3 - \sqrt{6}} \approx 0.281 < 4$).
   - For $\frac{1}{2} \le s \le 2$, $s(2 - s) \ge 0$, so $Q_s$ is concave on $[0, 1]$ with unconstrained maximum at $t_* = \frac{1}{2s} \in [\frac{1}{4}, 1]$ equal to $Q_s(t_*) = 8e^{-2s} \le \frac{8}{e} < 4$.
   - For $s > 2$, $-4s(2 - s) = 4s(s - 2) > 0$, so $Q_s$ is convex on $[0, 1]$ and bounded by $\max(Q_s(0), Q_s(1)) = \max(4s e^{-2s},\, 4s(2s - 3)^2 e^{-2s}) < 4$ (since $4s e^{-2s} \le 8e^{-4} < 4$ on $[2, \infty)$ and $Q_s(1) < 4$ for all $s \ge 0$).
   Hence $\sup_{|h|=1}|D^2_w f_\tau(w)[h, h]| \le 2\sqrt{\tau}$ for every $w \in \mathbb{C}$ and every complex unit direction $h \in \mathbb{C}$, and integrating against $\nu_A(d\tau) \ge 0$ gives $\sup_{|h|=1}|D^2_w F_A(w)[h, h]| \le 2\int_0^\infty \sqrt{\tau}\,\nu_A(d\tau) = \frac{4}{3\sqrt{\pi}\,a^2}$.
   Integrating $\frac{1}{2}\cdot\frac{4}{3\sqrt{\pi}\,a^2}\,R^{3/2}|\delta c(R - 2) + \delta z|^2$ against $e^{-R}\,dR$ with $\mathbb{E}[R^{3/2}] = \frac{3\sqrt{\pi}}{4}$, $\mathbb{E}[R^{3/2}(R - 2)] = \frac{3\sqrt{\pi}}{8}$, and $\mathbb{E}[R^{3/2}(R - 2)^2] = \frac{33\sqrt{\pi}}{16}$ cancels $\sqrt{\pi}$ identically and gives (2). $\square$

### 4.2 Direct Perturbation Proof of `6.3.6` (`Gate 2`)
Setting $c_0 = c$, $z_0 = 0$, $\delta c = 0$, $\delta z = P$ in Proposition 4.1(2) and using $\mathbb{E}[P] = 0$ and $a^2 > \frac{5}{16}$ gives $C(q) \le C(q_0) + \frac{p}{2a^2} \le C(q_0) + \frac{8}{5}p$ for every centred $P \in L^2$ (`CERT §5`). Together with the audited beta/gamma concavity reduction of `CERT §5` (`Gate 2A`: $I_A(v + t) - \frac{3}{4}\widehat{\mathbb{E}}_R[I_A(\frac{2}{3}R(\frac{v}{2}(R - 2)^2 + t))] \le v$ on $v \in [\frac{11}{2500}, \frac{463}{10000}], 0 \le t \le v/4$, where $I_A(s) = \Phi'(0) - B'(s)$) and the $512$-cell 1D enclosure $(C_h + \frac{8}{5}p_h)^2 / (D_l - v_h p_h) < \frac{9}{40}$ (`Gate 2B`), this certifies `6.3.6` directly across all three rows—independently of the stronger bound $\frac{11}{50} < \frac{9}{40}$ established by `Gate 3`.

### 4.3 Centered 1st-Order 4D Taylor Models (`Aff4`) for Gates 3, 4, 5
On any 4D box $B = [u_0, u_1] \times [c_0 - \delta c, c_0 + \delta c] \times [z_{10} - \delta z_1, z_{10} + \delta z_1] \times [z_{20} - \delta z_2, z_{20} + \delta z_2]$ with midpoint $(u_m, c_0, z_0)$:
1. Evaluating denominator-cleared margins via separated interval subtractions would incur $O(h)$ dependency error across 4 dimensions. Instead, `certify_one_driver.cpp` represents smooth scalar quantities on $B$ by centered 1st-order Taylor models `Aff4` $(a_0, g_u, g_c, g_{z_1}, g_{z_2}; r_A)$ encoding
   $$\big|A(u, c, z_1, z_2) - \big(a_0 + g_u(u - u_m) + g_c(c - c_0) + g_{z_1}(z_1 - z_{10}) + g_{z_2}(z_2 - z_{20})\big)\big| \le r_A,$$
   with exact outward-rounded algebra (`add_a`, `sub_a`, `scl_a`, `mul_a`, `sq_a`, `inv_pos_a`). For products $A B$, $r_{AB} = |a_0|r_B + |b_0|r_A + \mathrm{dev}(A)\,\mathrm{dev}(B)$ cancels all 1st-order slopes simultaneously, leaving pure $O(h^2)$ remainder.
2. The 1D $u$-primitives $B(u) - B_0$, $B'(u)$, $u B''(u)$, and $\lambda(u)$ are seeded from a $512$-slab precomputed node table using exact 2nd-order Lagrange remainders: $|B''(\xi)| \le A_{0,\max}$, $|B'''(\xi)| \le 6\Phi'''(0)$, $|(uB''(u))''| = |\int_0^\infty R^3(R - 2)e^{-R}\Phi'''(uR)\,dR| \le 36\Phi'''(0)$, and $|\lambda''(\xi)| \le 6(-g)''(0)$.
3. The 3D $(c, z_1, z_2)$-primitives $I_c(z)$ and $T_c(z)$ are seeded directly from Proposition 4.1's exact quadratic Taylor sandwiches around $(c_0, z_0)$ (shifting the midpoint of $I_c$ by $+\frac{1}{2}M_I$ so its remainder is $\pm \frac{1}{2}M_I$), with deterministic thread-local `MidMemo` reuse across all $u$-slabs and across Gates 3 and 4, and intersected with Proposition 3.1's Bregman floor $H_{c,u}(z) \ge c_{\min}^2 \mathcal{K}_{\min} > 0$.
4. Gates 3, 4, and 5 certify strict positivity of the denominator-cleared margin functions
   $$\mathcal{M}_3 = H_{c,u}(z)\left(\frac{3}{50}u + \frac{4}{25}(2c^2 + |z|^2) - \frac{1}{10}c z_1\right) - u|N_{c,u}(z)|^2 > 0,$$
   $$\mathcal{M}_4 = H_{c,u}(z)\left(\frac{9}{100}p + \frac{13}{100}|z|^2\right) - p|N_{c,u}(z)|^2 > 0,$$
   $$\mathcal{M}_5 = \left(\frac{3}{10}p + \frac{7}{10}|z|^2\right)\big(\tfrac{47}{200}H_{c,u}(z) + F_Q(p, |z|^2)\big) - p|N_{c,u}(z)|^2 > 0,$$
   where $p = u - 2c^2 > 0$ and $F_Q(p, Z) = p^2 Q(Z/p)$.

---

## 5. Exact Analytic and Rational Tails (`|z| >= 4` and `y >= 500`)

All unbounded complements of the 4D compact boxes are closed by pure rational arithmetic (`verify_one_driver.py`, zero floats), using Cauchy–Schwarz on $\mathrm{Exp}(1)$ moments ($\mathbb{E}[R] = 1$, $\mathbb{E}[R^2] = 2$, $\mathbb{E}[(R - 2)^2] = 2 \implies \mathbb{E}[\sqrt{R}] \le 1$, $\mathbb{E}[\sqrt{R}|R - 2|] \le \sqrt{2} < \frac{3}{2}$, $\mathbb{E}[R|R - 2|] \le 2$) together with the Gate 1 scalar bounds $B'(u) > 1$, $\Phi'(0) < \frac{3}{2}$, $A_0(u) = -B''(u) \in (0, 7)$, $|\lambda(u)| < \frac{17}{20}$, and $-g(0) < \frac{17}{20}$ on $u \in [\frac{551}{100000}, \frac{463}{10000}]$ at all three rows:

### 5.1 Tail $|z| \ge 4$ for $(\star_u)$ ($f \in [1/16, 1]$) and $(\star)$ ($f \in [1/16, 4/5]$)
Let $r = |z| \ge 4$, $u \le \frac{463}{10000}$, and $c = \sqrt{fu/2} \le \sqrt{u_{\max}/2} < \frac{4}{25}$.
1. **Lower bound on $H_{c,u}(z)$:**
   By Lemma 2.1, $\Phi(v) \le 2\sqrt{v}$ for all $v \ge 0$, so $I_c(z) \le 2\,\mathbb{E}_R[\sqrt{R}(r + c|R - 2|)] < 2r + 3c < 2r + \frac{12}{25}$. Using $B(u) - B_0 \ge 0$, $B'(u) > 1$, $(u - 2c^2)B'(u) \le u_{\max}\Phi'(0) < \frac{7}{100}$, and $|2uB''(u)\,\mathrm{Re}(\bar c z)| \le 14 u_{\max} c r < \frac{11}{100}r$:
   $$H_{c,u}(z) > r^2 - \frac{211}{100}r - \frac{11}{20} > \frac{2}{5}r^2 > 0 \qquad \forall r \ge 4.$$
2. **Upper bound on $|N_{c,u}(z)|^2$:**
   Since $|g(v)| \le -g(0) < \frac{17}{20}$ and $\mathbb{E}_R[R|R - 2|] \le 2$, $|T_c(z)| \le \frac{17}{20}(r + 2c)$ and $|\lambda(u)z| < \frac{17}{20}r$, so $|N_{c,u}(z)| < \frac{17}{10}(r + c) \le \frac{17}{10}\cdot\frac{26}{25}r < \frac{9}{5}r$ for $r \ge 4$, giving $|N_{c,u}(z)|^2 / H_{c,u}(z) < \frac{81/25}{2/5} = \frac{81}{10}$.
3. **Envelope comparison:**
   For $r \ge 4$ and $u \le \frac{463}{10000}$, $(\star_u)$ exceeds $\frac{3}{50} + (\frac{4}{25} - \frac{1}{250})\frac{16}{u_{\max}} = \frac{1249389}{23150} > 53.96 > \frac{81}{10}$, and $(\star)$ exceeds $\frac{9}{100} + \frac{13}{100}\frac{16}{u_{\max}} = \frac{2084167}{46300} > 45.01 > \frac{81}{10}$.

### 5.2 Tail $y = |z|^2/p \ge 500$ for $(\dagger)$ ($f \in [0, 1/16]$)
For $f = 2c^2/u \in [0, 1/16]$, we have $p = (1 - f)u \in [\frac{15}{16}u, u] \subset [\frac{1653}{320000}, \frac{463}{10000}]$ and $c \le \sqrt{p/30}$. Put $r = |z| = \sqrt{py}$ with $y \ge 500$.
1. Expanding $Q(500 + t)$ ($t \ge 0$) in exact rational arithmetic (`verify_one_driver.py`) shows that all four Taylor coefficients at $y = 500$ are strictly positive at both $b_4 = \frac{37}{1000}$ and $b_4 = \frac{7}{200}$, with $Q(y) \ge Q(500) > 2900$ for all $y \ge 500$.
2. By Proposition 3.1 and Gate 1 ($\mathcal{K}(u) > 0$), $H_{c,u}(z) \ge 0$ identically for **all** $z \in \mathbb{C}$, so $\frac{47}{200}H_{c,u}(z) + p^2 Q(y) \ge p^2 Q(y)$.
3. Meanwhile $c/r \le 1/\sqrt{15000} < \frac{1}{120}$, so $|N_{c,u}(z)| < \frac{17}{10}(r + c) < \frac{17}{10}\cdot\frac{121}{120}\sqrt{py} < \frac{9}{5}\sqrt{py}$, and $w(y) = \frac{3}{10} + \frac{7}{10}y > \frac{7}{10}y$, giving
   $$\frac{|N_{c,u}(z)|^2}{w(y)} < \frac{\frac{81}{25}py}{\frac{7}{10}y} = \frac{162}{35}\,p < \frac{1653}{320000}\cdot 2900\,p \le p^2 Q(y) \le \frac{47}{200}H_{c,u}(z) + p^2 Q(y).$$

---

## 6. Certified Results Summary and Replay

| Profile row | $\mathcal{K}_{\min}$ on band (`Gate 1`) | $\mathcal{K}(0.0463)$ (`Gate 1`) | Max ratio on $p \le u/5$ (`Gate 2`, $< \frac{9}{40}$) | `Gate 3` $(\star_u)$ leaves ($f \in [\frac{1}{16}, 1]$, $\frac{11}{50}$) | `Gate 4` $(\star)$ leaves ($f \in [\frac{1}{16}, \frac{4}{5}]$, $\frac{11}{50}$) | `Gate 5` $(\dagger)$ leaves ($f \in [0, \frac{1}{16}]$, $\frac{47}{200}$) |
|---|---|---|---|---|---|---|
| `peak` | $0.0327952$ | $[0.16678146,\ 0.16678220]$ | $0.206276 < 0.225$ | $797{,}669$ (`margin >= +1.50e-8`) | $809{,}858$ (`margin >= +9.45e-8`) | $2{,}117{,}123$ (`norm_margin >= +2.27e-8`) |
| `flank` | $0.0327743$ | $[0.16610542,\ 0.16610617]$ | $0.206264 < 0.225$ | $791{,}166$ (`margin >= +4.38e-8`) | $800{,}748$ (`margin >= +9.82e-9`) | $2{,}090{,}330$ (`norm_margin >= +1.66e-9`) |
| `upper` | $0.0307870$ | $[0.15826682,\ 0.15826749]$ | $0.204838 < 0.225$ | $788{,}510$ (`margin >= +5.92e-8`) | $787{,}028$ (`margin >= +7.57e-8`) | $2{,}088{,}340$ (`norm_margin >= +2.61e-11`) |

- **`certify_one_driver.cpp`:** Zero external dependencies (C++17 standard library only, compiled with `-O2 -ffp-contract=off -pthread -Wall -Wextra -Werror`). Every floating-point operation is rounded outward by 1 ULP in exact IEEE-754 binary64 bit arithmetic (`dn`/`up`, verified at startup against `std::nextafter`), and `sqrti`, `expneg`, `sin_i`, `cos_i`, `verified_pi`, and `iota_i` are self-verified from alternating Taylor series and bracket checks. Emits `result.json` (~6.5 KB) with exact IEEE-754 `std::hexfloat` interval endpoints and embedded FIPS 180-4 SHA-256 digest of `certify_one_driver.cpp` (~7.9 min on Apple Silicon across 3 threads).
- **`verify_one_driver.py`:** Pure-stdlib Python 3 exact rational (`fractions.Fraction`) auditor (`python3 -I` and `python3 -I -O`; explicit `require(...)`, zero bare `assert`s). Parses every `std::hexfloat` endpoint into an exact `Fraction`, verifies all rational parameters, benchmarks, Machin $\pi$ bounds, exact tail polynomials (`|z| >= 4` and `y >= 500`), all 5 gate thresholds across all 3 rows, and 10 adversarial negative/mutation controls.

```bash
# Fast exact rational audit of saved certificate + tails + 10 negative controls (< 1 s):
python3 -I research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py
python3 -I -O research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py

# Full C++17 outward-rounded interval regeneration + bit-for-bit verification (~8 min):
python3 -I -O research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py --replay-cpp
```
