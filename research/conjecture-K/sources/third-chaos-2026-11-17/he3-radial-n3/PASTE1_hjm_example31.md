<!-- Verbatim as pasted by the user on 17 November 2026: a text of a session of another assistant, reviewed in REVIEW_claude-b9ee.md beside it. Kept also in /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/he3-radial-n3-2026-11-17/. Only this line was added. -->
In Section 3 (**Example 3.1**) of Heilman, Jones, and Malavolta ([arXiv:2610.10477v1](https://arxiv.org/html/2610.10477v1#S3)), $\Pi_d^{(n)}$ denotes the orthogonal projection on Gaussian space $L^2(\gamma_n)$ ($\gamma_n = \mathcal{N}(0, I_n)$) onto the $d$-th homogeneous Hermite chaos
$$\mathcal{H}_d^{(n)} = \operatorname{span}\!\big\{\psi_\alpha(X) : |\alpha| = d\big\}, \qquad \psi_\alpha(X) = \prod_{i=1}^n \psi_{\alpha_i}(X_i), \quad \psi_k(x) = \frac{\operatorname{He}_k(x)}{\sqrt{k!}}.$$
For any self-adjoint positive semidefinite (PSD) operator $Q \succeq 0$ on $L^2(\gamma_n)$, the Boolean ($\infty$-to-$1$) optimum and its SDP relaxation are
$$\operatorname{OPT}(Q) = \sup_{f,g : \mathbb{R}^n \to \{\pm 1\}} \langle f, Q g \rangle_{L^2(\gamma_n)}, \qquad \operatorname{SDP}(Q) = \sup_{k \ge 1} \sup_{u,v : \mathbb{R}^n \to S^{k-1}} \mathbb{E}_{X \sim \gamma_n}\!\big[\langle u(X), (Q \otimes I_k)v(X) \rangle\big].$$
(Discretizing $\gamma_n$ by empirical sampling or quadrature turns any such $Q \succeq 0$ into finite symmetric PSD matrices $A_M \succeq 0$ with the same asymptotic ratio $\operatorname{SDP}/\operatorname{OPT}$.)

When we unpack Example 3.1 for $d = 3$, there is an important **directional subtlety**:
* Evaluating Eq. (3.1) gives $\operatorname{OPT}(\Pi_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$, which together with $\operatorname{SDP}(\Pi_3^{(n)}) \le 1$ only proves the **upper bound** $\frac{\operatorname{SDP}(\Pi_3^{(n)})}{\operatorname{OPT}(\Pi_3^{(n)})} \le \frac{\pi}{2} + o_n(1)$ (already guaranteed for all PSD operators by the little Grothendieck inequality).
* To prove that the integrality gap *actually equals* $\frac{\pi}{2} - o_n(1)$, one needs $\operatorname{SDP}(\Pi_3^{(n)}) = 1 - o_n(1)$ **and** the **upper bound** $\operatorname{OPT}(\Pi_3^{(n)}) \le \frac{2}{\pi} + o_n(1)$ (asserted without proof in Example 3.1 as *"It can be shown that $f,g$ in Eq. (3.1) are asymptotic optimizers of $\operatorname{OPT}(Q)$"*).

Below we:
1. Prove $\operatorname{SDP}(\Pi_3^{(n)}) = 1 - O(1/n)$ and $\operatorname{OPT}(\Pi_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$ directly for $\Pi_3^{(n)}$ (and explain why $n=1$ falls strictly short for $d=3$).
2. Give a **complete, self-contained proof** of the $\frac{\pi}{2} - o_n(1)$ gap for the **tripartite degree-$3$ Hermite projection** $\widetilde{\Pi}_3^{(n)} = (\Pi_1^{(n)})^{\otimes 3} \subset \Pi_3^{(3n)}$ (which already yields a pure degree-$3$ PSD construction achieving the $\frac{\pi}{2}$ gap, and generalizes to arbitrary $d$).
3. Show why the upper bound $\operatorname{OPT}(\Pi_3^{(n)}) \le \frac{2}{\pi} + o_n(1)$ for the **full** projection $\Pi_3^{(n)}$ is equivalent to a sharp $L^1\text{--}L^2$ inequality on the third Wiener chaos, and derive its exact Malliavin–Stein deficit representation.

---

### 1. Exact SDP Value and Lower Bound on $\operatorname{OPT}(\Pi_3^{(n)})$

Let $\psi_3(x) = \frac{x^3 - 3x}{\sqrt{6}}$ be the normalized degree-$3$ probabilists' Hermite polynomial, so $\mathbb{E}[\psi_3(G)] = 0$ and $\mathbb{E}[\psi_3(G)^2] = 1$ for $G \sim \mathcal{N}(0,1)$.

#### Lemma 1 ($\operatorname{SDP}(\Pi_3^{(n)}) = 1 - O(1/n)$)
For every $n \ge 1$,
$$1 - \frac{92}{n} \;\le\; \operatorname{SDP}(\Pi_3^{(n)}) \;\le\; 1.$$

**Proof.**
* *Upper bound:* Since $\Pi_3^{(n)}$ is an orthogonal projection, $\|\Pi_3^{(n)}\|_{\mathrm{op}} = 1$. For any $u,v : \mathbb{R}^n \to S^{k-1}$, $\|u\|_{L^2} = \|v\|_{L^2} = 1$, so $\langle u, (\Pi_3^{(n)} \otimes I_k)v \rangle \le \|(\Pi_3^{(n)} \otimes I_k)u\|_{L^2}\|v\|_{L^2} \le 1$.
* *Lower bound:* Define $w : \mathbb{R}^n \to \mathbb{R}^n$ by
  $$w(X) = \frac{1}{\sqrt{n}}\big(\psi_3(X_1), \dots, \psi_3(X_n)\big), \qquad R_n(X) := \|w(X)\|_2 = \sqrt{\frac{1}{n}\sum_{i=1}^n \psi_3(X_i)^2},$$
  and set $u(X) = v(X) := w(X)/R_n(X) \in S^{n-1}$ (defining $u(X) = e_1$ on the measure-zero set $\{R_n = 0\}$). Each coordinate of $w$ lies in $\mathcal{H}_3^{(n)}$, so $(\Pi_3^{(n)} \otimes I_n)w = w$ and $\|w\|_{L^2}^2 = \mathbb{E}[R_n^2] = 1$. By Cauchy–Schwarz and self-adjointness of $\Pi_3^{(n)}$,
  $$\|(\Pi_3^{(n)} \otimes I_n)u\|_{L^2} = \|(\Pi_3^{(n)} \otimes I_n)u\|_{L^2}\|w\|_{L^2} \;\ge\; \big\langle (\Pi_3^{(n)} \otimes I_n)u, w \big\rangle = \langle u, w \rangle = \mathbb{E}[R_n].$$
  Since $R_n \ge 0$, we have $1 + R_n \ge 1$ everywhere, hence $(1 - R_n)^2 \le (1 - R_n)^2(1 + R_n)^2 = (1 - R_n^2)^2$. Taking expectations using $\mathbb{E}[R_n^2] = 1$ gives
  $$2\big(1 - \mathbb{E}[R_n]\big) = \mathbb{E}\big[(1 - R_n)^2\big] \le \mathbb{E}\big[(1 - R_n^2)^2\big] = \operatorname{Var}(R_n^2) = \frac{\operatorname{Var}(\psi_3(G)^2)}{n}.$$
  Expanding $(G^3 - 3G)^4$ against Gaussian moments $\mathbb{E}[G^{2k}] = (2k-1)!!$ gives $\mathbb{E}[\psi_3(G)^4] = \frac{3348}{36} = 93$, so $\operatorname{Var}(\psi_3(G)^2) = 92$. Thus $\mathbb{E}[R_n] \ge 1 - \frac{46}{n}$, and
  $$\operatorname{SDP}(\Pi_3^{(n)}) \ge \|(\Pi_3^{(n)} \otimes I_n)u\|_{L^2}^2 \ge \big(\mathbb{E}[R_n]\big)^2 \ge 1 - \frac{92}{n}. \qquad \square$$
*(Replacing $92$ by $\operatorname{Var}(\psi_d(G)^2)$ proves $\operatorname{SDP}(\Pi_d^{(n)}) = 1 - O(1/n)$ for arbitrary $d \ge 1$.)*

#### Lemma 2 ($\operatorname{OPT}(\Pi_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$, while $n=1$ is strictly smaller)
1. For $n \ge 1$, testing Eq. (3.1),
   $$f_n(X) = g_n(X) = \operatorname{sign}\big(S_n(X)\big), \qquad S_n(X) := \frac{1}{\sqrt{n}}\sum_{i=1}^n \psi_3(X_i),$$
   yields $\operatorname{OPT}(\Pi_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$.
2. By contrast, at $n = 1$, $\operatorname{OPT}(\Pi_3^{(1)}) = \frac{2}{\pi}\cdot\frac{(1 + 4e^{-3/2})^2}{6} \approx 0.5969\cdot\frac{2}{\pi} < \frac{2}{\pi}$.

**Proof.**
Since $\Pi_3^{(n)}$ is an orthogonal projection, $\langle f, \Pi_3^{(n)} g \rangle \le \|\Pi_3^{(n)} f\|_{L^2}\|\Pi_3^{(n)} g\|_{L^2}$, so $\operatorname{OPT}(\Pi_3^{(n)}) = \sup_{f:\mathbb{R}^n \to \{\pm 1\}} \|\Pi_3^{(n)} f\|_{L^2}^2$.
1. Because $S_n \in \mathcal{H}_3^{(n)}$ with $\|S_n\|_{L^2} = 1$, Cauchy–Schwarz gives
   $$\|\Pi_3^{(n)} f_n\|_{L^2} \ge \langle \Pi_3^{(n)} f_n, S_n \rangle_{L^2} = \langle f_n, S_n \rangle_{L^2} = \mathbb{E}\big[|S_n|\big].$$
   By the Central Limit Theorem, $S_n \xrightarrow{d} Z \sim \mathcal{N}(0,1)$; since $\mathbb{E}[S_n^2] = 1$ for all $n$, $\{|S_n|\}_{n\ge 1}$ is uniformly integrable, so $\mathbb{E}[|S_n|] \to \mathbb{E}[|Z|] = \sqrt{\frac{2}{\pi}}$ and $\operatorname{OPT}(\Pi_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$.
2. At $n = 1$, $\mathcal{H}_3^{(1)} = \operatorname{span}\{\psi_3(X_1)\}$, so $\|\Pi_3^{(1)} f\|_{L^2} = |\mathbb{E}[f(X_1)\psi_3(X_1)]| \le \mathbb{E}[|\psi_3(X_1)|]$, achieved by $f(x) = \operatorname{sign}(\psi_3(x))$. Using $\frac{d}{dx}\big((x^2 - 1)\phi(x)\big) = (3x - x^3)\phi(x)$ for $\phi(x) = \frac{1}{\sqrt{2\pi}}e^{-x^2/2}$ and the positive root $\sqrt{3}$ of $x^3 - 3x$,
   $$\mathbb{E}\big[|X_1^3 - 3X_1|\big] = 2\int_0^{\sqrt{3}}(3x-x^3)\phi(x)\,dx + 2\int_{\sqrt{3}}^\infty (x^3-3x)\phi(x)\,dx = \sqrt{\frac{2}{\pi}}\big(1 + 4e^{-3/2}\big),$$
   giving $\operatorname{OPT}(\Pi_3^{(1)}) = \big(\mathbb{E}[|\psi_3(X_1)|]\big)^2 = \frac{2}{\pi}\cdot\frac{(1+4e^{-3/2})^2}{6} < \frac{2}{\pi}$. $\square$

---

### 2. Complete Proof of the $\frac{\pi}{2}$ Gap for the Tripartite Degree-$3$ Projection $\widetilde{\Pi}_3^{(n)}$

If our goal is to exhibit a PSD Hermite operator supported **purely in degree $d = 3$** whose integrality gap is unconditionally $\frac{\pi}{2} - o_n(1)$, we can take the tripartite degree-$3$ Hermite projection on $(\mathbb{R}^n)^3$ equipped with $\gamma_{3n}$:
$$\widetilde{\Pi}_3^{(n)} := \Pi_1^{(n)} \otimes \Pi_1^{(n)} \otimes \Pi_1^{(n)},$$
which projects orthogonally onto $\mathcal{V}_3^{(n)} := \operatorname{span}\!\big\{X_i Y_j Z_k : 1 \le i,j,k \le n\big\} \subset \mathcal{H}_3^{(3n)}$.

#### Theorem 3 (Unconditional $\frac{\pi}{2}$ gap at $d = 3$)
As $n \to \infty$,
$$\frac{\operatorname{SDP}(\widetilde{\Pi}_3^{(n)})}{\operatorname{OPT}(\widetilde{\Pi}_3^{(n)})} = \frac{\pi}{2} - o_n(1).$$

**Proof.**
1. **SDP value:** Clearly $\operatorname{SDP}(\widetilde{\Pi}_3^{(n)}) \le \|\widetilde{\Pi}_3^{(n)}\|_{\mathrm{op}} = 1$. For the lower bound, set
   $$u(X,Y,Z) = v(X,Y,Z) := \frac{X}{\|X\|_2} \otimes \frac{Y}{\|Y\|_2} \otimes \frac{Z}{\|Z\|_2} \in S^{n^3 - 1}.$$
   Because $X, Y, Z \sim \mathcal{N}(0, I_n)$ are independent, the projection factors across the three tensor slots:
   $$\operatorname{SDP}(\widetilde{\Pi}_3^{(n)}) \ge \big\|(\widetilde{\Pi}_3^{(n)} \otimes I_{n^3})u\big\|_{L^2(\gamma_{3n})}^2 = \Big(\big\|(\Pi_1^{(n)} \otimes I_n)(X/\|X\|_2)\big\|_{L^2(\gamma_n)}^2\Big)^3 = \left(\frac{(\mathbb{E}\|X\|_2)^2}{n}\right)^3 = \left(1 - O\!\left(\frac{1}{n}\right)\right)^3 = 1 - O\!\left(\frac{1}{n}\right).$$

2. **Lower bound on $\operatorname{OPT}$:** Taking $f_n(X,Y,Z) = \operatorname{sign}\!\left(\frac{1}{\sqrt{n}}\sum_{i=1}^n X_i Y_i Z_i\right)$ gives $\operatorname{OPT}(\widetilde{\Pi}_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$ by the CLT exactly as in Lemma 2.

3. **Sharp upper bound $\operatorname{OPT}(\widetilde{\Pi}_3^{(n)}) \le \frac{2}{\pi}$ for all $n \ge 1$:** By $L^2$ duality,
   $$\sqrt{\operatorname{OPT}(\widetilde{\Pi}_3^{(n)})} = \sup_{f : \mathbb{R}^{3n} \to \{\pm 1\}} \|\widetilde{\Pi}_3^{(n)} f\|_{L^2} = \sup_{\substack{H \in \mathcal{V}_3^{(n)} \\ \|H\|_{L^2} = 1}} \sup_{f : \mathbb{R}^{3n} \to \{\pm 1\}} \mathbb{E}[f \cdot H] = \sup_{\substack{H \in \mathcal{V}_3^{(n)} \\ \|H\|_{L^2} = 1}} \mathbb{E}\big[|H(X,Y,Z)|\big].$$
   Write any unit-norm $H \in \mathcal{V}_3^{(n)}$ as $H(X,Y,Z) = \sum_{i,j,k=1}^n T_{ijk} X_i Y_j Z_k$ with $\sum_{i,j,k} T_{ijk}^2 = 1$. Conditioned on $(X, Y)$, $H(X, Y, Z) = \sum_{k=1}^n \big(\sum_{i,j} T_{ijk} X_i Y_j\big) Z_k$ is a **centered Gaussian** random variable with conditional variance
   $$\sigma^2(X,Y) = \sum_{k=1}^n \left(\sum_{i,j=1}^n T_{ijk} X_i Y_j\right)^2.$$
   Using $\mathbb{E}[|\mathcal{N}(0,\sigma^2)|] = \sqrt{\frac{2}{\pi}}\,\sigma$ and Cauchy–Schwarz over $(X,Y)$,
   $$\mathbb{E}\big[|H(X,Y,Z)|\big] = \mathbb{E}_{X,Y}\!\Big[\mathbb{E}_Z\big[|H(X,Y,Z)| \;\big|\; X,Y\big]\Big] = \sqrt{\frac{2}{\pi}}\,\mathbb{E}_{X,Y}\big[\sigma(X,Y)\big] \le \sqrt{\frac{2}{\pi}}\sqrt{\mathbb{E}_{X,Y}\big[\sigma^2(X,Y)\big]} = \sqrt{\frac{2}{\pi}}\left(\sum_{i,j,k} T_{ijk}^2\right)^{1/2} = \sqrt{\frac{2}{\pi}}.$$
   Squaring gives $\operatorname{OPT}(\widetilde{\Pi}_3^{(n)}) \le \frac{2}{\pi}$ for every $n \ge 1$. Combining Steps 1–3 yields $\operatorname{SDP}(\widetilde{\Pi}_3^{(n)}) / \operatorname{OPT}(\widetilde{\Pi}_3^{(n)}) = \frac{\pi}{2} - o_n(1)$. $\square$

*(Remark: Replacing $3$ by any $d \ge 1$ in $\widetilde{\Pi}_d^{(n)} = (\Pi_1^{(n)})^{\otimes d}$ proves the exact same $\frac{\pi}{2} - o_n(1)$ gap for arbitrary $d$, conditioning on the first $d-1$ blocks.)*

---

### 3. What Remains for the Full Projection $\Pi_3^{(n)}$ of Example 3.1

For the **full** degree-$3$ Hermite projection $\Pi_3^{(n)}$ on $L^2(\gamma_n)$ (which includes all of $\mathcal{H}_3^{(n)}$, not just tripartite monomials), Lemmas 1 and 2 already establish $\operatorname{SDP}(\Pi_3^{(n)}) = 1 - O(1/n)$ and $\operatorname{OPT}(\Pi_3^{(n)}) \ge \frac{2}{\pi} - o_n(1)$. Let us record the exact analytical statement equivalent to the remaining inequality $\operatorname{OPT}(\Pi_3^{(n)}) \le \frac{2}{\pi} + o_n(1)$:

1. **Equivalence to a sharp $L^1\text{--}L^2$ Wiener chaos bound:**
   Because embedding $f : \mathbb{R}^n \to \{\pm 1\}$ into $\mathbb{R}^{n+1}$ preserves $\|\Pi_3^{(n)} f\|_{L^2}$, $\operatorname{OPT}(\Pi_3^{(n)})$ is non-decreasing in $n$. Thus $\operatorname{OPT}(\Pi_3^{(n)}) \le \frac{2}{\pi} + o_n(1)$ as $n \to \infty$ holds **if and only if** $\operatorname{OPT}(\Pi_3^{(n)}) \le \frac{2}{\pi}$ for *every* $n \ge 1$, which by $L^2$ duality (as in Step 3 above) is equivalent to:
   $$\|F\|_{L^1(\gamma_n)} \;\le\; \sqrt{\frac{2}{\pi}}\,\|F\|_{L^2(\gamma_n)} \qquad \forall n \ge 1,\ \forall F \in \mathcal{H}_3^{(n)}. \tag{$\star$}$$
   Moreover, splitting $X = \frac{1}{\sqrt{M}}\sum_{r=1}^M G^{(r)}$ with $G^{(1)},\dots,G^{(M)} \stackrel{\text{i.i.d.}}{\sim} \mathcal{N}(0,I_n)$ and sending $M \to \infty$ kills all repeated-block Hermite terms in $L^2$ (their total $L^2$ mass is $1 - \frac{M(M-1)(M-2)}{M^3} = O(1/M)$), reducing $(\star)$ to **multilinear (square-free) homogeneous cubics** $F(Z_1,\dots,Z_N) = \sum_{1 \le i < j < k \le N} c_{ijk} Z_i Z_j Z_k$ (symmetric rather than tripartite).

2. **Exact Malliavin–Stein / heat-flow deficit identity:**
   Fix $F \in \mathcal{H}_3^{(n)}$ with $\|F\|_{L^2(\gamma_n)} = 1$ and an independent $Z \sim \mathcal{N}(0,1)$, and interpolate via $\Psi(\rho) := \mathbb{E}\big[|\rho F + \sqrt{1-\rho^2}\,Z|\big]$ for $\rho \in [0,1]$, so $\Psi(0) = \sqrt{\frac{2}{\pi}}$ and $\Psi(1) = \|F\|_{L^1(\gamma_n)}$. Writing $g_\sigma(y) = \mathbb{E}[|y + \sigma Z|]$ ($\sigma = \sqrt{1-\rho^2}$), which satisfies $\partial_{\sigma^2} g_\sigma = \frac{1}{2}g_\sigma''$ and $g_\sigma''(y) = \sqrt{\frac{2}{\pi\sigma^2}}\,e^{-y^2/(2\sigma^2)}$, differentiation gives
   $$\Psi'(\rho) = \mathbb{E}\big[F g_\sigma'(\rho F) - \rho g_\sigma''(\rho F)\big].$$
   Since $F \in \mathcal{H}_3^{(n)}$ is an eigenfunction of the Ornstein–Uhlenbeck generator $L = \Delta - X\cdot\nabla$ with $LF = -3F$, Gaussian integration by parts yields $\mathbb{E}[F g_\sigma'(\rho F)] = \frac{1}{3}\mathbb{E}[(-LF)g_\sigma'(\rho F)] = \frac{\rho}{3}\mathbb{E}[g_\sigma''(\rho F)\|\nabla F\|_2^2]$. Substituting $s = \rho/\sqrt{1-\rho^2} \in (0,\infty)$ gives the exact identity
   $$\sqrt{\frac{2}{\pi}} - \|F\|_{L^1(\gamma_n)} = \sqrt{\frac{2}{\pi}} \int_0^\infty \frac{s}{(1+s^2)^{3/2}}\,\mathbb{E}\!\left[e^{-s^2 F^2/2}\left(1 - \frac{1}{3}\|\nabla F\|_2^2\right)\right] ds.$$
   * Near the Gaussian regime $F_\varepsilon = \sqrt{1-\varepsilon^2}\,Z' + \varepsilon H$ ($H \in \mathcal{H}_3^{(n)}$ independent of $Z' \sim \mathcal{N}(0,1)$, $\|H\|_{L^2}=1$), the integrand evaluates to $\frac{\varepsilon^4}{6} s^2(1+s^2)^{-3/2}\big(\mathbb{E}[H^4]-3\big) + O(\varepsilon^6) > 0$ for every non-Gaussian $H$ by the Nualart–Peccati fourth-moment theorem ($\mathbb{E}[H^4] > 3$), confirming that the Gaussian limit of Eq. (3.1) is a strict local maximizer of $\|F\|_{L^1}$ in every chaos direction.
   * Closing $(\star)$ globally for the full $\Pi_3^{(n)}$ (as opposed to the tripartite $\widetilde{\Pi}_3^{(n)}$ proved in Theorem 3) amounts to proving that the right-hand side integral above is non-negative for *every* normalized $F \in \mathcal{H}_3^{(n)}$ — a nontrivial sharp Wiener-chaos inequality that Example 3.1 leaves implicit behind *"It can be shown that $f,g$ in Eq. (3.1) are asymptotic optimizers."*
