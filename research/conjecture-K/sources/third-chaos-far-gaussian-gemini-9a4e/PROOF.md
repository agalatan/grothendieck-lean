# Sharp Spectral Comparison, Slice-Commutator Cumulants, and Decoupled Circle Majorants on the Real Third Wiener Chaos

Agent-ID: gemini-9a4e. Tasks [#506](https://github.com/agalatan/grothendieck-lean/issues/506),
[#501](https://github.com/agalatan/grothendieck-lean/issues/501), and
[#458](https://github.com/agalatan/grothendieck-lean/issues/458).

Let $G$ be a standard Gaussian vector in $\mathbb R^n$, and let $F = I_3(T)/\sqrt{6}$ be a normalized
real third-chaos polynomial associated with a symmetric cubic tensor $T = (T_{ijk})_{1\le i,j,k\le n}$
satisfying $\|T\|_{\mathrm{HS}}^2 = \sum_{i,j,k=1}^n T_{ijk}^2 = 1$, so $\mathbb E[F^2] = 1$. Write

$$
a(T) := \max_{\|v\|_2=1} |T(v,v,v)| = \max_{\|v\|_2=1} \big|\mathbb E[F\,h_3(G\cdot v)]\big|,\qquad
M_{ij} := \sum_{k,l=1}^n T_{ikl}T_{jkl},\qquad
\lambda(T) := \|M\|_{\mathrm{op}},\qquad
\kappa_4(F) := \mathbb E[F^4] - 3,
$$

where $h_3(x) = (x^3 - 3x)/\sqrt{6}$. Write $C_{\mathrm{tar}} := \sqrt{17/25}$ for the dimension-free
practical target `(T)` ($\mathbb E|F| \le \sqrt{17/25}$, which yields complex radius $\pi\sqrt{17/200} < 0.916$
on $\mathcal H_{2,1}$ by phase averaging) and $c := \sqrt{2/\pi}$ for the sharp Gaussian bound
($\mathbb E|F| \le \sqrt{2/\pi}$, giving $\mathbb E|q| \le (\sqrt{\pi}/2)\|q\|_2$ on $\mathcal H_{2,1}$).

In [#500](https://github.com/agalatan/grothendieck-lean/pull/500)
([`sources/third-chaos-dual-slice-codex-6d92/PROOF.md`](../third-chaos-dual-slice-codex-6d92/PROOF.md)),
conditioning on a maximizing direction together with the rational comparison
$3\lambda - 1 \le \frac{20788}{8019}a^2$ and $\kappa_4 \le 90\operatorname{tr}(M^2)$ proved:
- `(T)` for $a \ge 0.662$ or $\kappa_4 \ge 53.0920$, and
- the Gaussian bound for $a \ge 0.711$ or $\kappa_4 \ge 58.1377$.

This note proves three dimension-free results that sharpen all three components of that chain, using only
standard-library Python (`python3 -I`) checkers with exact `Fraction`, exact $\mathbb Q(\sqrt{2})$, and
outward-rounded integer interval arithmetic:

1. **Decoupled orthogonal-complement + Gaussian-circle slice (§1, `certify_circle_slice.py`):**
   - `(T)` ($\mathbb E|F| \le \sqrt{17/25}$) holds whenever $a(T) \ge \frac{129}{200} = 0.645$ (lowering $0.662 \to 0.645$).
   - The Gaussian bound ($\mathbb E|F| \le \sqrt{2/\pi}$) holds whenever $a(T) \ge \frac{349}{500} = 0.698$ (lowering $0.711 \to 0.698$).
2. **Exact sharp spectral-to-injective tensor inequality (§2, computer-free + `certify_spectral_sharp.py`):**
   For every $n \ge 1$ and every unit-Hilbert–Schmidt symmetric cubic tensor $T$ on $\mathbb R^n$,
   $$
   3\lambda(T) - 1 \le (1 + \sqrt{2})\,a(T)^2,
   $$
   improving $\frac{20788}{8019} = 2.592343\dots$ to $1 + \sqrt{2} = 2.41421356\dots$, with **exact equality**
   already in $n = 2$ at
   $$
   T_* = \frac{-3\cos(\pi/8)\,e_1 \odot e_1 \odot e_2 + \sin(\pi/8)\,e_2^{\otimes 3}}{\sqrt{2 + \sqrt{2}/2}}.
   $$
3. **Exact slice-commutator fourth-cumulant identity and 4D rational certificates (§3, `certify_spectral_sharp.py`):**
   Writing $(A_r)_{ij} = T_{rij}$ ($1 \le r \le n$), one has $\sum_{r=1}^n A_r^2 = M$ and the exact identity
   $$
   \kappa_4\!\left(\frac{I_3(T)}{\sqrt{6}}\right)
   = 90\operatorname{tr}(M^2) - 18\sum_{r,s=1}^n \|A_r A_s - A_s A_r\|_F^2.
   $$
   Retaining the single off-diagonal commutator entry $(A_2 A_1 - A_1 A_2)_{12} = s^2 + b^2 + u - x b - s d$
   in the top-$M$-eigenvector frame certifies strict upper bounds on $\kappa_4(F)$ when $a(T) \le a_0$, lowering
   #500's cumulant thresholds within this packet to:
   - `(T)` whenever $\kappa_4(F) \ge \frac{473}{10} = 47.3$ ($a(T) \le 0.645 \implies \kappa_4(F) < 47.3$; already $\kappa_4 \ge 48$ from #500's $a \ge 0.662$ alone), and
   - the Gaussian bound whenever $\kappa_4(F) \ge \frac{991}{20} = 49.55$ ($a(T) \le 0.698 \implies \kappa_4(F) < 49.55$; already $\kappa_4 \ge 50.3$ from #500's $a \ge 0.711$ alone).

**Comparison with [#519](https://github.com/agalatan/grothendieck-lean/pull/519)
([`sources/third-chaos-dimfree-gemini-c1de/PROOF.md`](../third-chaos-dimfree-gemini-c1de/PROOF.md)).**
Independently, #519 used degree-six majorants with $|\kappa_6| \le 67\kappa_4^{3/2}$ and full matrix-block defect
bounds to prove `(T)` for $a \ge \frac{321}{500} = 0.642$, $\lambda \ge 0.668$, or $\kappa_4 \ge 46.6$ (plus
$\lambda \le 0.0064$ and $\kappa_4 \le 0.182$), and the Gaussian bound for $a \ge 0.700$, $\lambda \ge 0.692$, or
$\kappa_4 \ge 49$. Combining both packets:
- For the sharp Gaussian bound, §1's $a \ge \frac{349}{500} = 0.698$ (which uses only $\mathbb E[R^2]$) sharpens
  #519's $a \ge 0.700$, while #519's $\lambda \ge 0.692$ and $\kappa_4 \ge 49$ are stronger than $49.55$.
- For `(T)`, #519's $a \ge 0.642$ and $\kappa_4 \ge 46.6$ are stronger than $0.645$ and $47.3$, while applying
  Theorem 2.1 ($3\lambda - 1 \le (1 + \sqrt{2})a^2$) at #519's threshold $a = \frac{321}{500} = 0.642$ sharpens
  #519's $\lambda \ge 0.668$ to $\lambda \ge \frac{1 + (1+\sqrt{2})(321/500)^2}{3} = 0.66501887\dots$ (in particular
  $\lambda \ge \frac{33251}{50000} = 0.66502$). Note also that #519's slot-counting bound $\lambda \le \frac{1 + a^2}{2}$
  improves on Theorem 2.1 only for $a > \sqrt{\frac{2\sqrt{2} + 1}{7}} = 0.739539\dots$, and that Theorem 3.1's
  $18\sum_{r,s}\|[A_r, A_s]\|_F^2$ equals #519's $54\|U - \widetilde U\|_{\mathrm{HS}}^2$.

All terminating decimals used as proof inputs below denote exact rationals.

---

## 1. Decoupled piecewise-linear + Gaussian-circle slice on the orthogonal complement

Let $v \in S^{n-1}$ attain $a = a(T) \ge a_0 > 0$; replacing $T$ by $-T$ if needed (which preserves $|F|$),
assume $T(v,v,v) = a$. Stationarity of $w \mapsto T(w,w,w)$ on $S^{n-1}$ at $w = v$ gives $T(v,v,w) = 0$ for
every $w \perp v$. Decomposing $G = X v + Y$ with $X = G \cdot v \sim \mathcal N(0,1)$ independent of the
orthogonal standard Gaussian $Y \perp v$ gives

$$
F = a\,h_3(X) + X Q(Y) + R(Y),\qquad
\mathbb E[Q(Y)] = 0,\qquad
\mathbb E[Q(Y)^2] + \mathbb E[R(Y)^2] = 1 - a^2,
$$

where $Q(Y)$ belongs to the second Wiener chaos of $Y$ and $R(Y)$ belongs to the third Wiener chaos $V_3(Y)$.
For $(q, b) \in \mathbb R^2$, write $\Psi(q, b) := \mathbb E_X|h_3(X) + q X + b|$, so that
$\mathbb E|F| = a\,\mathbb E_Y[\Psi(Q(Y)/a, R(Y)/a)]$.

Instead of bounding $\Psi(q, b)$ by a single isotropic quadratic in $(q, b)$, we decouple $q$ from $b$ via an
even, convex, $1$-Lipschitz piecewise-linear majorant $\Phi(b)$ and then integrate $\Phi(R(Y)/a)$ along
Gaussian great circles in $V_3(Y)$.

### 1.1 Stage 1: Exact reduction of $\mathbb R^2$ to 22 one-dimensional knot checks

Fix the $K = 22$ rational knots

$$
(b_0, b_1, \dots, b_{21})
= (0, 0.10, 0.20, 0.30, 0.40, 0.50, 0.58, 0.64, 0.69, 0.73, 0.76, 0.78, 0.81, 0.85, 0.91, 1.00, 1.15, 1.40, 1.80, 2.40, 3.40, 5.00),
$$

and rational knot values $(\phi_0, \dots, \phi_{21})$ satisfying $\phi_j > b_j$ for all $0 \le j \le 21$ and
strictly increasing slopes

$$
0 < s_0 < s_1 < \dots < s_{20} < s_{21} := 1,\qquad
s_j := \frac{\phi_{j+1} - \phi_j}{b_{j+1} - b_j}\quad (0 \le j \le 20),\qquad
u_j := \phi_j - s_j b_j\quad (0 \le j \le 21).
$$

Define $\Phi : \mathbb R \to \mathbb R$ by

$$
\Phi(b) := \max_{0 \le j \le 21} \big(u_j + s_j |b|\big).
$$

Because $0 < s_0 < \dots < s_{21} = 1$, $\Phi$ is even, convex, and $1$-Lipschitz on $\mathbb R$, interpolates
$\Phi(b_k) = \phi_k$ linearly on each segment $[b_k, b_{k+1}]$ ($0 \le k \le 20$), and satisfies
$\Phi(b) = \phi_{21} + (b - 5) > b$ on $[5, \infty)$ (hence $\Phi(b) > |b|$ on all of $\mathbb R$).

**Lemma 1.1 (Exact 1D knot reduction).** *For every $q \in \mathbb R$,*

$$
\sup_{b \in \mathbb R} \big(\Psi(q, b) - \Phi(b)\big) = \max_{0 \le k \le 21} \big(\Psi(q, b_k) - \phi_k\big).
$$

*Proof.* Since $X \stackrel{d}{=} -X$, $\Psi(q, -b) = \Psi(q, b)$ and $\Phi(-b) = \Phi(b)$, so we restrict to
$b \ge 0$.
1. On each segment $[b_k, b_{k+1}]$ ($0 \le k \le 20$), $b \mapsto \Psi(q, b)$ is convex while $\Phi(b) = u_k + s_k b$
   is affine, so $b \mapsto \Psi(q, b) - \Phi(b)$ is convex on $[b_k, b_{k+1}]$ and attains its maximum at an
   endpoint $b \in \{b_k, b_{k+1}\}$.
2. On $[5, \infty)$, let $Z = h_3(X) + q X$. Since $\mathbb E[Z] = 0$ and $|Z + b| - b = Z + 2(-Z - b)_+$,
   taking expectations gives
   $$
   \Psi(q, b) - b = 2\,\mathbb E\big[(-h_3(X) - q X - b)_+\big],
   $$
   which is nonincreasing in $b \in \mathbb R$. Because $\Phi(b) - b \equiv \phi_{21} - 5$ is constant on
   $[5, \infty)$, $\Psi(q, b) - \Phi(b) \le \Psi(q, 5) - \phi_{21}$ for all $b \ge 5$. $\square$

Consequently, proving $\Psi(q, b) \le \Phi(b) + \ell q + \alpha q^2$ on **all of $\mathbb R^2$** reduces
without approximation to checking $\Psi(q, b_k) \le \phi_k + \ell q + \alpha q^2$ for $k = 0, \dots, 21$:
- For $|q| \ge 5$: $\Psi(q, b_k) - \phi_k \le \Psi(q, b_k) - \Phi(b_k) \le \mathbb E|h_3(X)| + c|q| + b_k - \phi_k \le \mathbb E|h_3(X)| - (\phi_{21} - 5) + c|q|$
  (since $b \mapsto \Phi(b) - b$ has nonpositive slope $s_j - 1 \le 0$ on $[0, 5]$, so $\phi_k - b_k \ge \phi_{21} - 5 > 0$).
  When $10\alpha > c + |\ell|$ and $\mathbb E|h_3(X)| - (\phi_{21} - 5) + 5(c + |\ell|) - 25\alpha < 0$, this is
  strictly negative for all $|q| \ge 5$.
- For $|q| \le 5$: on each subinterval $[q_0, q_1] \subseteq [-5, 5]$ of half-width $h_q = (q_1 - q_0)/2$,
  convexity of $q \mapsto \Psi(q, b_k)$ gives
  $$
  \Psi(q, b_k) - \phi_k - \ell q - \alpha q^2
  \le \max_{q_c \in \{q_0, q_1\}} \big(\Psi(q_c, b_k) - \phi_k - \ell q_c - \alpha q_c^2\big) + \alpha h_q^2.
  $$
  At rational $q_c \in [-5, 5]$, `certify_circle_slice.py` encloses $\Psi(q_c, b_k)$ using the exact primitive
  $((1 - x^2)/\sqrt{6} - q_c)\phi(x) + b_k \Phi_{\mathcal N}(x)$ on intervals of certified sign inside $[-8, 8]$,
  verified tail signs on $(-\infty, -8]$ and $[8, \infty)$, and narrow-interval remainder $|p|\phi(0)\Delta x$
  at depth $18$.

### 1.2 Stage 2: Gaussian-circle Mehler moments on $V_3(Y)$

Averaging Stage 1 over $Y$ (using $\mathbb E[Q(Y)] = 0$) gives

$$
\frac{\mathbb E|F|}{a} \le \mathbb E_Y\!\left[\Phi\!\left(\frac{R(Y)}{a}\right)\right] + \alpha\,\frac{\mathbb E[Q(Y)^2]}{a^2}.
$$

Let $U, V$ be independent standard Gaussian vectors in $v^\perp$, and set $Y_\theta := U\cos\theta + V\sin\theta$.
Since $Y_\theta \stackrel{d}{=} Y$ for every $\theta$ and $R \in V_3(Y)$ is an odd cubic polynomial
($R(-y) = -R(y)$) while $\Phi$ is even, $R(Y_\theta)/a = A_1\cos\theta + B_1\sin\theta + A_3\cos 3\theta + B_3\sin 3\theta$
has $\pi$-periodic $\Phi$-composition:

$$
\mathbb E_Y\!\left[\Phi\!\left(\frac{R(Y)}{a}\right)\right]
= \mathbb E_{U,V}\!\left[\frac{1}{\pi}\int_0^\pi \Phi\!\left(\frac{R(Y_\theta)}{a}\right)d\theta\right].
$$

For each $(U, V)$, shifting $\theta \mapsto \theta + \theta_0$ aligns $(A_1, B_1)$ with $(r_1, 0)$ where
$r_1 = \sqrt{A_1^2 + B_1^2} \ge 0$, and reflecting $\theta \mapsto \pm\theta$ arranges $t_3 \ge 0$ in
$r_3\cos 3\theta + t_3\sin 3\theta$ with $r_3^2 + t_3^2 = A_3^2 + B_3^2$. Both operations preserve the mean
over $[0, \pi]$, so the inner integral equals

$$
\mathcal I_\Phi(r_1, r_3, t_3) := \frac{1}{\pi}\int_0^\pi \Phi\big(r_1\cos\theta + r_3\cos 3\theta + t_3\sin 3\theta\big)\,d\theta.
$$

By Mehler's identity on the third Wiener chaos $V_3(Y)$, for all $\theta, \varphi \in \mathbb R$,

$$
\mathbb E_{U,V}\!\left[\frac{R(Y_\theta)}{a}\,\frac{R(Y_\varphi)}{a}\right]
= \frac{\mathbb E[R^2]}{a^2}\cos^3(\theta - \varphi)
= \frac{\mathbb E[R^2]}{a^2}\left(\frac{3}{4}\cos(\theta - \varphi) + \frac{1}{4}\cos 3(\theta - \varphi)\right).
$$

Comparing with $\mathbb E[g(\theta)g(\varphi)]$ via Fourier orthogonality on $[0, 2\pi]$ gives the exact circle
mode variances

$$
\mathbb E_{U,V}[r_1^2] = \frac{3}{2}\,\frac{\mathbb E[R^2]}{a^2},\qquad
\mathbb E_{U,V}[r_3^2 + t_3^2] = \frac{1}{2}\,\frac{\mathbb E[R^2]}{a^2}.
$$

Therefore, whenever $\mathcal I_\Phi(r_1, r_3, t_3) \le C_0 + \mu_1 r_1^2 + \mu_3(r_3^2 + t_3^2)$ holds across all
$(r_1, r_3, t_3) \in [0, \infty) \times \mathbb R \times [0, \infty)$, taking expectations over $(U, V)$ and setting
$\mu := \max\!\big(\alpha,\; \frac{3}{2}\mu_1 + \frac{1}{2}\mu_3\big) > 0$ yields for every $a \in [a_0, 1]$:

$$
\mathbb E|F|
\le a C_0 + \mu\,\frac{1 - a^2}{a}
\le \max\!\left(C_0,\; a_0 C_0 + \mu\,\frac{1 - a_0^2}{a_0}\right),
$$

by convexity of $a \mapsto (C_0 - \mu)a + \mu/a$ on $[a_0, 1]$.

To certify $\mathcal I_\Phi(r_1, r_3, t_3) \le C_0 + \mu_1 r_1^2 + \mu_3(r_3^2 + t_3^2)$ across
$[0, \infty) \times \mathbb R \times [0, \infty)$:
- **Analytic exterior $S := r_1^2 + r_3^2 + t_3^2 \ge 16$:** By $1$-Lipschitzness $\Phi(z) \le \phi_0 + |z|$ and
  Cauchy–Schwarz, $\mathcal I_\Phi \le \phi_0 + \sqrt{S/2}$. Since $C_0 \ge \phi_0$ and
  $\min(\mu_1, \mu_3)^2 \cdot 16 > \frac{1}{2}$, we have $\min(\mu_1, \mu_3) S > \sqrt{S/2}$ for all $S \ge 16$.
- **Compact domain $S < 16$ inside $[0, 4] \times [-4, 4] \times [0, 4]$:** Since $\Phi$ is convex,
  $\mathcal I_\Phi$ is convex on $\mathbb R^3$, so on any sub-box of half-widths $(h_1, h_3, k_3)$ its excess over
  $C_0 + \mu_1 r_1^2 + \mu_3(r_3^2 + t_3^2)$ is at most the maximum over the $8$ corners plus
  $\mu_1 h_1^2 + \mu_3(h_3^2 + k_3^2)$. At each grid vertex, let $\theta_m = m\pi / N_\theta$ ($N_\theta = 1024$,
  $h = \pi / N_\theta$) and let $\tilde g_m$ linearly interpolate $g(\theta) = r_1\cos\theta + r_3\cos 3\theta + t_3\sin 3\theta$
  on $[\theta_m, \theta_{m+1}]$. Convexity of $\Phi$ and $\Phi(g(\pi)) = \Phi(-g(0)) = \Phi(g(0))$ bound the
  chord average by $N_\theta^{-1}\sum_{m=0}^{N_\theta - 1}\Phi(g(\theta_m))$, and $1$-Lipschitzness with
  $|g''(\theta)| \le r_1 + 9\sqrt{r_3^2 + t_3^2}$ bounds the chord error by
  $\frac{h^2}{12}(r_1 + 9\sqrt{r_3^2 + t_3^2})$.

### 1.3 Certified parameters

`certify_circle_slice.py` verifies the two parameter sets below (with knot tables `PHI_PRACTICAL` and
`PHI_GAUSSIAN` recorded in the script; note $\frac{3}{2}\mu_1 + \frac{1}{2}\mu_3 = \alpha$ identically in both rows):

| Regime | $a_0$ | $\ell$ | $\alpha$ | $C_0$ | $\mu_1$ | $\mu_3$ | $\mu$ | Bound on $\mathbb E|F|$ for $a \ge a_0$ | Target |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Practical `(T)` | $129/200 = .645$ | $-12/125$ | $183/500$ | $.76450$ | $.18440$ | $.17880$ | $.366$ | $< 16491/20000 = .82455$ | $\sqrt{17/25} \approx .824621$ |
| Gaussian $c$ | $349/500 = .698$ | $-27/200$ | $201/500$ | $.71996$ | $.20250$ | $.19650$ | $.402$ | $< 19947/25000 = .79788$ | $\sqrt{2/\pi} \approx .797885$ |

---

## 2. Exact sharp spectral-to-injective bound $3\lambda(T) - 1 \le (1 + \sqrt{2})\,a(T)^2$

**Theorem 2.1.** *For every $n \ge 1$ and every symmetric cubic tensor $T$ on $\mathbb R^n$ with
$\|T\|_{\mathrm{HS}} = 1$,*

$$
3\lambda(T) - 1 \le (1 + \sqrt{2})\,a(T)^2.
$$

*Moreover, equality holds in $n = 2$ for*

$$
T_* = \frac{-3\cos(\pi/8)\,e_1 \odot e_1 \odot e_2 + \sin(\pi/8)\,e_2^{\otimes 3}}{\sqrt{2 + \sqrt{2}/2}}.
$$

*Proof.* For $n = 1$, $\|T\|_{\mathrm{HS}} = 1$ gives $\lambda(T) = a(T) = 1$ and $2 < 1 + \sqrt{2}$. Assume
$n \ge 2$, let $e_1$ be a top unit eigenvector of $M$ ($\lambda(T) = M_{11}$), write $x = T_{111}$, and choose a
unit vector $e_2 \perp e_1$ so that the component of $T(e_1, e_1, \cdot)$ orthogonal to $e_1$ equals $s e_2$ with
$s \ge 0$ (so $T_{11k} = 0$ for all $k \ge 3$). Set $b = T_{122}$, $d = T_{222}$, and let $\widetilde T$ be the
restriction of all three slots of $T$ to $W := \operatorname{span}(e_1, e_2) \cong \mathbb R^2$.

Counting occurrences of index $1$ in $\|T\|_{\mathrm{HS}}^2 = 1$ gives
$1 = x^2 + 3s^2 + 3\sum_{j,k\ge 2} T_{1jk}^2 + \|T|_{e_1^\perp}\|_{\mathrm{HS}}^2$ while
$\lambda(T) = x^2 + 2s^2 + \sum_{j,k\ge 2} T_{1jk}^2$, hence
$3\lambda(T) - 1 = 2x^2 + 3s^2 - \|T|_{e_1^\perp}\|_{\mathrm{HS}}^2 \le 2x^2 + 3s^2 - d^2$.
Meanwhile, on $W$, $\|\widetilde T\|_{\mathrm{HS}}^2 = x^2 + 3s^2 + 3b^2 + d^2$ and
$M(\widetilde T)_{11} = x^2 + 2s^2 + b^2$, so

$$
3\lambda(T) - 1
\le 2x^2 + 3s^2 - d^2
= 3 M(\widetilde T)_{11} - \|\widetilde T\|_{\mathrm{HS}}^2
\le 3\lambda(\widetilde T) - \|\widetilde T\|_{\mathrm{HS}}^2.
$$

If $a(\widetilde T) = 0$ then $\widetilde T = 0$ and $3\lambda(T) - 1 \le 0$. Otherwise $0 < a(\widetilde T) \le a(T)$.
Since $\lambda(\widetilde T)$, $\|\widetilde T\|_{\mathrm{HS}}^2$, and $a(\widetilde T)$ are $O(2)$-invariant on
$\mathbb R^2$ and homogeneous of degree $2$ in $\widetilde T$ (after squaring $a(\widetilde T)$), rescaling by
$1/a(\widetilde T)$ reduces the theorem to proving $3\lambda(\widetilde T) - \|\widetilde T\|_{\mathrm{HS}}^2 \le 1 + \sqrt{2}$
for every symmetric cubic $\widetilde T$ on $\mathbb R^2$ with $a(\widetilde T) = 1$.

Choose an orthonormal basis $(\tilde e_1, \tilde e_2)$ of $\mathbb R^2$ in which $|\widetilde T(w,w,w)|$ attains its
maximum $1$ at $\tilde e_1$ with $\widetilde T_{111} = 1$, and orient $\tilde e_2$ so $\tilde d := \widetilde T_{222} \ge 0$.
Write $\tilde b := \widetilde T_{122}$ and $p(\theta) := \widetilde T((\cos\theta\,\tilde e_1 + \sin\theta\,\tilde e_2)^{\otimes 3})$.
Since $p(\theta) \le 1 = p(0)$ for all $\theta$:
1. $0 = p'(0) = 3\widetilde T_{112}$, so $\widetilde T_{112} = 0$;
2. $0 \ge p''(0) = -3 + 6\tilde b$, so $\tilde b \le \frac{1}{2}$;
3. $\|\widetilde T(\tilde e_2, \tilde e_2, \cdot)\|_2 \le a(\widetilde T) = 1$ (by the circle zero-counting lemma of
   `sources/third-chaos-dual-slice-codex-6d92/PROOF.md` §2) gives $\tilde b^2 + \tilde d^2 \le 1$, so
   $\tilde b \in [-1, \frac{1}{2}]$ and $D := \tilde d^2 \in [0, 1 - \tilde b^2]$;
4. testing $|p(\theta)| \le 1$ at $\cos\theta = u := \sqrt{2} - 1 > 0$, $\sin\theta = \pm v$ with
   $v := \sqrt{2(\sqrt{2} - 1)} > 0$ ($u^2 + v^2 = 1$) gives
   $$
   v^3\sqrt{D} \le 1 + u^3 + 3 u v^2 \tilde b \qquad\text{and}\qquad
   v^3\sqrt{D} \le 1 - u^3 - 3 u v^2 \tilde b.
   $$

Drop tildes on $(b, d)$. Since $\widetilde T_{111} = 1$ and $\widetilde T_{112} = 0$, we have
$\|\widetilde T\|_{\mathrm{HS}}^2 = 1 + 3b^2 + D$ and
$M(\widetilde T) = \begin{pmatrix} 1 + b^2 & b d \\ b d & 2b^2 + D \end{pmatrix}$, so

$$
3\lambda(\widetilde T) - \|\widetilde T\|_{\mathrm{HS}}^2
= f(b, D) := \frac{1 + 3b^2 + D + 3\sqrt{R(D)}}{2},\qquad
R(D) := (1 - b^2 - D)^2 + 4b^2 D = (D + 3b^2 - 1)^2 + 4b^2(1 - 2b^2).
$$

Observe how $D \mapsto f(b, D)$ behaves on $[0, \infty)$ for fixed $b \in [-1, \frac{1}{2}]$:
- If $|b| \le 1/\sqrt{2}$, then $4b^2(1 - 2b^2) \ge 0$, so $D \mapsto \sqrt{R(D)}$ and hence $D \mapsto f(b, D)$ is
  **convex** on $[0, \infty)$, with $f(b, 0) = \frac{1}{2}(1 + 3b^2 + 3(1 - b^2)) = 2 < 1 + \sqrt{2}$.
- If $1/\sqrt{2} < |b| \le 1$, then $R'(D) = 2(D + 3b^2 - 1) > 0$ for every $D \ge 0$, so $D \mapsto f(b, D)$ is
  **strictly increasing** on $[0, \infty)$.

In both cases, whenever $0 \le D \le D_{\mathrm{ub}}(b)$, we have
$f(b, D) \le \max\{2, f(b, D_{\mathrm{ub}}(b))\}$. Cover $[-1, \frac{1}{2}]$ by four intervals:
1. **$b \in [-1, -995/1000]$:** Use $D_{\mathrm{ub}} = 1 - b^2$, where $R(1 - b^2) = 4b^2(1 - b^2)$ and
   $1 - b^2 \le \frac{9975}{10^6} < \frac{1}{100}$, giving
   $f(b, 1 - b^2) = 1 + b^2 + 3|b|\sqrt{1 - b^2} < 2 + \frac{3}{10} = \frac{23}{10} < 1 + \sqrt{2}$.
2. **$b \in [-995/1000, -2/5]$:** Here $1 + u^3 + 3u v^2 b > 0$ at both endpoints, so $D \le D_2(b) := (1 + u^3 + 3u v^2 b)^2 / v^6$.
   The concave quadratic $\mathrm{LHS}(b) := 2(1 + \sqrt{2}) - (1 + 3b^2 + D_2(b))$ is strictly positive at both
   endpoints, and in $\mathbb Q(\sqrt{2})[b]$ one has the exact polynomial factorization
   $$
   \mathrm{LHS}(b)^2 - 9 R\big(D_2(b)\big)
   = (270 - 108\sqrt{2})\!\left(b + \frac{\sqrt{2}}{2}\right)^{\!2}
     \!\left(-b^2 - \left(\frac{4}{51} + \frac{13\sqrt{2}}{17}\right)b + \frac{\sqrt{2}}{17} - \frac{19}{102}\right) \ge 0,
   $$
   since the concave quadratic factor is strictly positive at $b = -995/1000$ and $b = -2/5$.
3. **$b \in [-9/20, 9/20]$:** Use $D_{\mathrm{ub}} = 1 - b^2$: since $t(1 - t)$ increases on $[0, 81/400]$,
   $f(b, 1 - b^2) = 1 + b^2 + 3|b|\sqrt{1 - b^2} \le \frac{481 + 27\sqrt{319}}{400} < 1 + \sqrt{2}$ because
   $(400\sqrt{2} - 81)^2 = 326561 - 64800\sqrt{2} > 232551 = 729 \cdot 319$.
4. **$b \in [9/20, 1/2]$:** Here $0 < 1 - u^3 - 3u v^2 b \le 1 - u^3 - \frac{27}{20}u v^2$, giving
   $D \le (1 - u^3 - \frac{27}{20}u v^2)^2 / v^6 < \frac{2}{5} =: D_{\mathrm{ub}}$. On $[9/20, 1/2]$,
   $1 + 3b^2 + \frac{2}{5} \le \frac{43}{20}$, $|1 - b^2 - \frac{2}{5}| = |\frac{3}{5} - b^2| \le \frac{159}{400}$,
   and $4b^2 \cdot \frac{2}{5} \le \frac{2}{5}$, so
   $f(b, \frac{2}{5}) \le \frac{1}{2}\!\big(\frac{43}{20} + 3\sqrt{(159/400)^2 + 2/5}\big) < 1 + \sqrt{2}$.

Finally, for $T_*$, $N := 3\cos^2(\pi/8) + \sin^2(\pi/8) = 2 + \frac{\sqrt{2}}{2}$, $M(T_*) = \operatorname{diag}(2\cos^2(\pi/8)/N, (\cos^2(\pi/8)+\sin^2(\pi/8))/N)$
has $\lambda(T_*) = 2\cos^2(\pi/8)/N$, so $3\lambda(T_*) - 1 = (1 + \sqrt{2})/N$. On $u^2 + v^2 = 1$ with $t = v^2 \in [0, 1]$,
$1 - t\big(-3\cos(\pi/8)(1-t) + \sin(\pi/8)t\big)^2 = \big(t - (1 - \frac{\sqrt{2}}{2})\big)^2\!\big(6 + 4\sqrt{2} - (5 + \frac{7\sqrt{2}}{2})t\big) \ge 0$
(since the linear factor equals $6 + 4\sqrt{2} > 0$ at $t = 0$ and $1 + \frac{\sqrt{2}}{2} > 0$ at $t = 1$)
with equality at $t_* = 1 - \frac{\sqrt{2}}{2}$, proving $a(T_*)^2 = 1/N$ and $(3\lambda(T_*) - 1)/a(T_*)^2 = 1 + \sqrt{2}$. $\square$

---

## 3. Exact slice-commutator identity for $\kappa_4$ and 4D rational certificates

For a symmetric cubic tensor $T$ on $\mathbb R^n$ with $\|T\|_{\mathrm{HS}} = 1$, define its $n$ symmetric matrix
slices $(A_r)_{ij} := T_{rij}$ ($1 \le r \le n$).

**Theorem 3.1 (Slice-commutator fourth-cumulant identity).** *We have $\sum_{r=1}^n A_r^2 = M$, and for
$F = I_3(T)/\sqrt{6}$,*

$$
\kappa_4(F)
= 54\operatorname{tr}(M^2) + 36\sum_{r,s=1}^n \operatorname{tr}\big((A_r A_s)^2\big)
= 90\operatorname{tr}(M^2) - 18\sum_{r,s=1}^n \|A_r A_s - A_s A_r\|_F^2.
$$

*Proof.* By symmetry of $T$, $(\sum_r A_r^2)_{ij} = \sum_{r,k} T_{rik} T_{rkj} = \sum_{r,k} T_{irk} T_{jrk} = M_{ij}$.
As recorded in `sources/third-chaos-dual-slice-codex-6d92/PROOF.md` §4,
$\kappa_4(F) = 36\|M\|_{\mathrm{HS}}^2 + 54\|\widetilde U\|_{\mathrm{HS}}^2$, where
$U_{abcd} = \sum_r T_{rab} T_{rcd} = \sum_r (A_r)_{ab}(A_r)_{cd}$ and $\widetilde U$ is the full symmetrization of
$U$ over $(a,b,c,d)$. Since $U$ is already symmetric in $(a,b)$ and in $(c,d)$ and symmetric under swapping
$(a,b) \leftrightarrow (c,d)$, the $24$ permutations of $(a,b,c,d)$ partition into $8$ that preserve
$\{\{a,b\},\{c,d\}\}$ (giving contraction $\sum_{a,b,c,d} U_{abcd}^2 = \sum_{r,s} (\operatorname{tr}(A_r A_s))^2$;
note $\operatorname{tr}(A_r A_s) = \sum_{a,b} T_{rab} T_{sab} = M_{rs}$, so this equals $\operatorname{tr}(M^2)$!)
and $16$ that pair $a$ with $c$ or $d$ (each giving $\sum_{a,b,c,d} U_{abcd} U_{acbd} = \sum_{r,s} \operatorname{tr}(A_r A_s A_r A_s)$).
Hence

$$
\|\widetilde U\|_{\mathrm{HS}}^2
= \langle U, \widetilde U \rangle
= \frac{1}{3}\operatorname{tr}(M^2) + \frac{2}{3}\sum_{r,s=1}^n \operatorname{tr}\big((A_r A_s)^2\big),
$$

which gives $\kappa_4(F) = 36\operatorname{tr}(M^2) + 54\big(\frac{1}{3}\operatorname{tr}(M^2) + \frac{2}{3}\sum_{r,s}\operatorname{tr}((A_r A_s)^2)\big) = 54\operatorname{tr}(M^2) + 36\sum_{r,s}\operatorname{tr}((A_r A_s)^2)$.
Finally, since $A_r$ and $A_s$ are symmetric,

$$
\|A_r A_s - A_s A_r\|_F^2
= \operatorname{tr}\big((A_r A_s - A_s A_r)^\top (A_r A_s - A_s A_r)\big)
= 2\operatorname{tr}(A_r^2 A_s^2) - 2\operatorname{tr}\big((A_r A_s)^2\big).
$$

Summing over $r, s$ and using $\sum_{r,s}\operatorname{tr}(A_r^2 A_s^2) = \operatorname{tr}\big((\sum_r A_r^2)^2\big) = \operatorname{tr}(M^2)$
gives $\sum_{r,s}\operatorname{tr}((A_r A_s)^2) = \operatorname{tr}(M^2) - \frac{1}{2}\sum_{r,s}\|[A_r, A_s]\|_F^2$,
completing the proof. $\square$

### 3.1 Four-parameter commutator bound in the $(e_1, e_2)$ frame

Suppose $a(T) \le a_0$ (with $n \ge 2$; for $n = 1$, $a(T) = 1 > a_0$). In the orthonormal frame $(e_1, e_2, \dots, e_n)$
of §2 (flipped so $x = T_{111} \ge 0$, with $s = T_{112} \ge 0$, $T_{11k} = 0$ for $k \ge 3$, $b = T_{122}$, $d = T_{222}$),
compute the $(1, 2)$ entry of $[A_2, A_1] = A_2 A_1 - A_1 A_2$:
- $(A_2 A_1)_{12} = \sum_{k=1}^n T_{21k} T_{1k2} = \sum_{k=1}^n T_{12k}^2 = s^2 + b^2 + u$, where $u := \sum_{k\ge 3} T_{12k}^2 \ge 0$.
- $(A_1 A_2)_{12} = \sum_{k=1}^n T_{11k} T_{2k2} = x b + s d$ (since $T_{11k} = 0$ for $k \ge 3$).

Hence $(A_2 A_1 - A_1 A_2)_{12} = s^2 + b^2 + u - x b - s d$. Since $A_1$ and $A_2$ are symmetric,
$[A_2, A_1]^\top = A_1 A_2 - A_2 A_1 = -[A_2, A_1]$ is skew-symmetric.
Thus $(A_2 A_1 - A_1 A_2)_{21} = -(A_2 A_1 - A_1 A_2)_{12}$, and both pairs $(r, s) = (2, 1)$ and $(r, s) = (1, 2)$
contribute $2(A_2 A_1 - A_1 A_2)_{12}^2$ to $\sum_{r,s}\|[A_r, A_s]\|_F^2$, yielding

$$
18\sum_{r,s=1}^n \|A_r A_s - A_s A_r\|_F^2
\ge 72\big(s^2 + b^2 + u - x b - s d\big)^2
\ge 72\big(\max\{0,\; s^2 + b^2 - x b - s d\}\big)^2,
$$

where the last step uses $u \ge 0$.

Meanwhile, write $\Delta := 3\lambda - 1 \le \min(2x^2 + 3s^2,\; 2a_0^2 + s^2) - d^2$ (using $x^2 + s^2 \le a_0^2$).
If $\lambda \le \frac{1}{2}$ (i.e., $\Delta \le \frac{1}{2}$), then $\operatorname{tr}(M^2) \le \lambda \le \frac{1}{2}$,
giving $\kappa_4(F) \le 45$. If $\lambda > \frac{1}{2}$ (i.e., $\Delta > \frac{1}{2}$), then
$90\operatorname{tr}(M^2) \le 90(\lambda^2 + (1 - \lambda)^2) = 50 + 20\Delta(\Delta - 1)$, which increases in
$\Delta > \frac{1}{2}$. Finally, for every $(m, k) \in \mathbb Z^2 \setminus \{(0,0)\}$, applying
$\|T(w, w, \cdot)\|_2 \le a(T) \le a_0$ to $w = (m e_1 + k e_2)/\sqrt{m^2 + k^2}$ gives

$$
(m^2 x + 2mk s + k^2 b)^2 + (m^2 s + 2mk b + k^2 d)^2 \le (m^2 + k^2)^2 a_0^2,
$$

together with $x^2 + 3s^2 + 3b^2 + d^2 \le 1$. Subdividing $[0, a_0]^2 \times [-a_0, a_0]^2$ in exact
`fractions.Fraction` arithmetic with strict box acceptance (`< k4_cap`), `certify_spectral_sharp.py` verifies:
- at `#500`'s reviewed thresholds alone: $a(T) \le \frac{331}{500} = 0.662 \implies \kappa_4(F) < 48$ ($1{,}542$ boxes)
  and $a(T) \le \frac{711}{1000} = 0.711 \implies \kappa_4(F) < \frac{503}{10} = 50.3$ ($2{,}966$ boxes);
- combined with §1: $a(T) \le \frac{129}{200} = 0.645 \implies \kappa_4(F) < \frac{473}{10} = 47.3$ ($1{,}767$ boxes)
  and $a(T) \le \frac{349}{500} = 0.698 \implies \kappa_4(F) < \frac{991}{20} = 49.55$ ($3{,}528$ boxes);
- paper-only (using Theorem 2.1 without 4D subdivision): $\kappa_4(F) < 50.09$ at $a_0 = 0.645$ ($\lambda < 0.668125$),
  $\kappa_4(F) < 54.15$ at $a_0 = 0.698$ ($\lambda < 0.725405$), and at #519's $a_0 = \frac{321}{500} = 0.642$,
  $\lambda(T) \le \frac{1 + (1 + \sqrt{2})(321/500)^2}{3} < \frac{33251}{50000} = 0.66502$.

Combining this note with [`sources/third-chaos-dual-slice-codex-6d92/PROOF.md`](../third-chaos-dual-slice-codex-6d92/PROOF.md)
and [`sources/third-chaos-dimfree-gemini-c1de/PROOF.md`](../third-chaos-dimfree-gemini-c1de/PROOF.md) (#519), any
counterexample outside the structured classes is confined to:
- for `(T)`: $\operatorname{rank}(M) \ge 16$, $a(T) < 0.642$, $0.0064 < \lambda(T) < 0.66502$,
  $\operatorname{Var}(\|\nabla F\|^2/3) > \frac{89}{2250}$, and $0.182 < \kappa_4(F) < 46.6$;
- for the sharp Gaussian bound $\sqrt{2/\pi}$: $\operatorname{rank}(M) \ge 12$, $a(T) < 0.698$, $\lambda(T) < 0.692$,
  and $\kappa_4(F) < 49$.

---

## Replay

Both checkers use **only the Python 3 standard library** (`python3 -I`; no `flint` or `numpy` required), run in
about 24 seconds total (~8 s + ~16 s), and exit nonzero on any failed assertion. Run from the repository root:

```sh
cert_dir=research/conjecture-K/code/third-chaos-far-gaussian-gemini-9a4e
python3 -I "$cert_dir/certify_spectral_sharp.py"
python3 -I "$cert_dir/certify_circle_slice.py"
```
