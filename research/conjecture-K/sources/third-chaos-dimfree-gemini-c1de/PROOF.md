# Dimension-free sharpenings for the real third Wiener chaos

Agent-ID: gemini-c1de. Tasks [#501](https://github.com/agalatan/grothendieck-lean/issues/501) and
[#458](https://github.com/agalatan/grothendieck-lean/issues/458).

Let $G \sim \mathcal{N}(0, I_n)$ be a standard Gaussian vector in $\mathbb{R}^n$ ($n \ge 1$ arbitrary)
and let $F = I_3(T)/\sqrt{6} \in V_3(\mathbb{R}^n)$ be a real third-chaos polynomial normalized by
$\|T\|_{\mathrm{HS}} = 1$, so $\mathbb{E}[F^2] = 1$. Write $C_{\mathrm{tar}} = \sqrt{17/25} = 0.8246211\dots$
for the practical dimension-free target (which gives the complex cubic chaos radius
$\frac{\pi}{2\sqrt{2}} C_{\mathrm{tar}} = \pi\sqrt{17/200} = 0.9159247\dots < 0.916$ by phase averaging)
and $c_0 = \sqrt{2/\pi} = 0.7978845\dots$ for the sharp Gaussian limit. Put

$$
\begin{aligned}
h_3(x) &= \frac{x^3 - 3x}{\sqrt{6}}, &
a = a(F) &= \max_{\|v\|=1} |\mathbb{E}[F h_3(\langle v, G\rangle)]| = \max_{\|v\|=1} |T(v,v,v)|,\\
M_{ij} &= \sum_{k,\ell} T_{ik\ell} T_{jk\ell}, &
\lambda &= \|M\|_{\mathrm{op}}, \qquad r = \operatorname{rank}(M), \qquad m = \operatorname{tr}(M^2),\\
A_{ijk\ell} &= \sum_s T_{ijs} T_{k\ell s}, &
\widetilde{U}_{ijk\ell} &= \frac{A_{ijk\ell} + A_{ikj\ell} + A_{i\ell jk}}{3}, \qquad u = \|\widetilde{U}\|_{\mathrm{HS}}^2,\\
\tau &= \frac{\|\nabla F\|^2}{3}, &
\kappa_4 &= \mathbb{E}[F^4] - 3 = 36m + 54u, \qquad \kappa_6 = \mathbb{E}[F^6] - 15\mathbb{E}[F^4] + 30.
\end{aligned}
$$

## Summary by status label

All new proofs and certificates below carry **P + C, author only** (`gemini-c1de`) until independently
re-derived and replayed. All terminating decimals used as proof inputs denote exact rationals.

- **Proved and certified (`P + C, author only`)**:
  1. **Universal sixth-cumulant bound (§1, `certify_sixth.py`)**: for every unit $F \in V_3(\mathbb{R}^n)$ and every $n \ge 1$,
     $$|\kappa_6(F)| \le 67\,\kappa_4(F)^{3/2}, \qquad \mathbb{E}[F^6] \le 15 + 15\kappa_4(F) + 67\,\kappa_4(F)^{3/2}.$$
  2. **Eigenvector-coupled tensor and fourth-cumulant defect bounds (§2, `certify_tensor.py`)**:
     - Closed-form universal inequality: $\lambda \le \frac{1 + a(F)^2}{2}$ in every dimension.
     - Coupled invariant bounds:
       $$a(F) \le \frac{321}{500} = 0.642 \implies \lambda < \frac{167}{250} = 0.668 \text{ and } \kappa_4(F) < \frac{233}{5} = 46.6;$$
       $$a(F) \le \frac{7}{10} = 0.700 \implies \lambda < \frac{173}{250} = 0.692 \text{ and } \kappa_4(F) < 49.$$
  3. **Rank-one correlation and high-kurtosis bounds (§3, `certify_rank_slice.py`)**:
     - **Sharp Gaussian bound** $\mathbb{E}|F| \le \sqrt{2/\pi}\|F\|_2$ holds in every dimension whenever
       $$a(F) \ge \frac{7}{10} = 0.700, \quad \text{or} \quad \lambda \ge \frac{173}{250} = 0.692, \quad \text{or} \quad \kappa_4(F) \ge 49$$
       (sharpening $a \ge 0.711$, $\lambda \ge 0.7702$, and $\kappa_4 \ge 58.1377$ of [#500](https://github.com/agalatan/grothendieck-lean/pull/500)).
     - **Practical bound** $\mathbb{E}|F| \le \sqrt{17/25}\|F\|_2$ holds in every dimension whenever
       $$a(F) \ge \frac{321}{500} = 0.642, \quad \text{or} \quad \lambda \ge \frac{167}{250} = 0.668, \quad \text{or} \quad \kappa_4(F) \ge \frac{233}{5} = 46.6$$
       (sharpening $a \ge 0.662$, $\lambda \ge 0.7121$, and $\kappa_4 \ge 53.0920$ of #500).
  4. **Small-influence bound via quartic-Huber majorant and $D_1$ integration by parts (§4, `certify_stein_quartic.py`)**:
     $\mathbb{E}|F| < \sqrt{17/25}\|F\|_2$ holds standalone for all $\lambda \le \frac{16}{2500} = 0.0064$
     (expanding $\lambda \le 0.0049067$ of #500 by $+30.4\%$).
  5. **Small-cumulant bound via sixth-moment spline Stein regression (§5, `certify_regression_sixth.py`)**:
     $\mathbb{E}|F| < \sqrt{17/25}\|F\|_2$ holds for all $\kappa_4(F) \le \frac{91}{500} = 0.182$
     (expanding $\kappa_4 \le 89/500 = 0.178$ of #500; the kurtosis-free variance criterion $\operatorname{Var}\tau \le 89/2250$ remains as in #500 §5).
  6. **Unrestricted dimension-free bound (§6, `certify_circle_211.py`)**: every nonzero $F \in V_3(\mathbb{R}^n)$ satisfies
     $$\mathbb{E}|F| < \frac{44357}{50000}\|F\|_2 = 0.88714\,\|F\|_2$$
     (certified upper bound $< 0.8871354\,\|F\|_2$, sharpening $17743/20000 = 0.88715$ of #500).
- **Open**:
  - Unrestricted $\mathbb{E}|F| \le \sqrt{17/25}\|F\|_2$ and $\mathbb{E}|F| \le \sqrt{2/\pi}\|F\|_2$ in every dimension. Outside the proved structured classes, a counterexample to the practical target must simultaneously have $\operatorname{rank}(M) \ge 16$ (and $n \ge 18$ once five-plane slicing is recorded), $a(F) < 0.642$, $0.0064 < \lambda < 0.668$, $\operatorname{Var}\tau > 89/2250$, and $0.182 < \kappa_4(F) < 46.6$. A counterexample to the sharp Gaussian bound outside the proved structured classes must have $\operatorname{rank}(M) \ge 12$, $a(F) < 0.700$, $\lambda < 0.692$, and $\kappa_4(F) < 49$.

---

## 1. Universal sixth-cumulant bound on the real third chaos

View $A$ and $\widetilde{U}$ as $n^2 \times n^2$ matrices indexed by $(i, j) \times (k, \ell)$, and view $T$ as an
$n^2 \times n$ matrix indexed by $(i, j) \times k$. Since $A_{(ij),(k\ell)} = \sum_r T_{ijr} T_{k\ell r} = (T T^\top)_{(ij),(k\ell)}$,
$A \succeq 0$ and $\|A\|_{\mathrm{HS}}^2 = \operatorname{tr}((T^\top T)^2) = \operatorname{tr}(M^2) = m$. Since $\widetilde{U}$ is the
orthogonal projection of $A$ onto an index-permutation subspace (averaging the three pairings of four indices), $\widetilde{U}$ is symmetric on
$\mathbb{R}^{n^2}$ and $0 \le u = \|\widetilde{U}\|_{\mathrm{HS}}^2 \le \|A\|_{\mathrm{HS}}^2 = m$.

Expanding $\mathbb{E}[I_3(T)^6]/6^3 - 15\mathbb{E}[I_3(T)^4]/6^2 + 30$ over connected $3$-regular Wick multigraphs on six vertices
(see also `Grothe/LowerAnalytic/SixthMoment.lean` for the complex counterpart, and `certify_sixth.py` for exact multivariate
Gaussian verification on four 3-variable tensors including a generic ten-parameter tensor) gives

$$
\kappa_6(F) = 216\Big(\frac{135}{2}\operatorname{tr}(\widetilde{U}^3) - 20\operatorname{tr}(M^3)
+ \frac{135}{2}\langle \operatorname{vec}M, \widetilde{U}\operatorname{vec}M\rangle
+ \frac{165}{2}\langle T M, \widetilde{U} T\rangle + 45\|\widetilde{U} T\|_{\mathrm{HS}}^2\Big).
$$

Bound the five invariants in terms of $m$ and $u$:

1. Since $M = T^\top T \succeq 0$ with $\operatorname{tr}(M^2) = m$, $0 \le \operatorname{tr}(M^3) \le \|M\|_{\mathrm{op}}\operatorname{tr}(M^2) \le m^{3/2}$.
2. Since $\widetilde{U}$ is symmetric with $\|\widetilde{U}\|_{\mathrm{HS}}^2 = u$, $|\operatorname{tr}(\widetilde{U}^3)| \le \|\widetilde{U}\|_{\mathrm{op}}\|\widetilde{U}\|_{\mathrm{HS}}^2 \le u^{3/2}$, and
   $|\langle \operatorname{vec}M, \widetilde{U}\operatorname{vec}M\rangle| \le \|\widetilde{U}\|_{\mathrm{op}}\|\operatorname{vec}M\|_2^2 \le u^{1/2} m$.
3. Since $T T^\top = A$,
   $$\|\widetilde{U} T\|_{\mathrm{HS}}^2 = \operatorname{tr}(T^\top \widetilde{U}^2 T) = \operatorname{tr}(\widetilde{U}^2 A) \le \|\widetilde{U}^2\|_{\mathrm{HS}}\|A\|_{\mathrm{HS}} \le u m^{1/2},$$
   and $45\|\widetilde{U} T\|_{\mathrm{HS}}^2 \ge 0$.
4. Similarly $\|T M\|_{\mathrm{HS}}^2 = \operatorname{tr}(M T^\top T M) = \operatorname{tr}(M^3) \le m^{3/2}$, so Cauchy–Schwarz gives
   $$|\langle T M, \widetilde{U} T\rangle| \le \|T M\|_{\mathrm{HS}}\|\widetilde{U} T\|_{\mathrm{HS}} \le m^{3/4}(u m^{1/2})^{1/2} = m u^{1/2}.$$

If $m = 0$ then $T = 0$, contradicted by $\|T\|_{\mathrm{HS}} = 1$. Writing $x = \sqrt{u/m} \in [0, 1]$, we have
$\kappa_4(F) = m(36 + 54x^2)$, while (dropping $-20\operatorname{tr}(M^3) \le 0$ above and $+45\|\widetilde{U}T\|_{\mathrm{HS}}^2 \ge 0$ below)

$$
\begin{aligned}
\kappa_6(F) &\le 216\,m^{3/2}\Big(\frac{135}{2}x^3 + 45x^2 + 150x\Big),\\
-\kappa_6(F) &\le 216\,m^{3/2}\Big(\frac{135}{2}x^3 + 150x + 20\Big).
\end{aligned}
$$

On $[0, 1]$ the script `certify_sixth.py` bisects in exact rational arithmetic (638 and 37 subintervals) to certify
that $216^2(\frac{135}{2}x^3 + 45x^2 + 150x)^2 < 67^2(36 + 54x^2)^3$ and
$216^2(\frac{135}{2}x^3 + 150x + 20)^2 < 67^2(36 + 54x^2)^3$ throughout $[0, 1]$ (at $x = 1$, corresponding to $h_3(X_1)$,
$\kappa_4 = 90$ and $\kappa_6 = 52380 = 61.345\dots \times 90^{3/2} < 67 \times 90^{3/2}$). Since $\mathbb{E}[F^2] = 1$,
$\mathbb{E}[F^6] = 15 + 15\kappa_4 + \kappa_6 \le 15 + 15\kappa_4 + 67\kappa_4^{3/2}$.

---

## 2. Eigenvector-coupled tensor and fourth-cumulant defect bounds

Assume $n \ge 2$ (for $n = 1$, $a = \lambda = 1$ and $\kappa_4 = 90$). Let $e_1$ be a unit eigenvector of $M$ with
$M e_1 = \lambda e_1$. Choose a unit vector $e_2 \perp e_1$ along the component of $T(e_1, e_1, \cdot)$ orthogonal to $e_1$
(if that component vanishes, pick any unit $e_2 \perp e_1$), and complete $(e_1, e_2)$ to an orthonormal basis $(e_1, \dots, e_n)$.
Then $T_{112} = s \ge 0$ and $T_{11j} = 0$ for $j \ge 3$. Replacing $(T, e_2)$ by $(-T, -e_2)$ if $T_{111} < 0$ preserves
$s = T_{112} \ge 0$ and achieves $x = T_{111} \ge 0$.

Let $B = (T_{1pq})_{p,q \ge 2}$ and $C = (T_{2pq})_{p,q \ge 2}$ be the $(n-1) \times (n-1)$ symmetric slices on $e_1^\perp$,
and put $b = B_{22} = T_{122}$, $d = C_{22} = T_{222}$, $P = \|B\|_{\mathrm{HS}}^2$, and
$\|T|_{e_1^\perp}\|_{\mathrm{HS}}^2 = \sum_{i,j,k \ge 2} T_{ijk}^2 = d^2 + \Delta_\perp$ ($\Delta_\perp \ge 0$).

### 2.1 Slot identities and the closed-form bound $\lambda \le (1 + a^2)/2$

Partitioning the index triples of $T$ by the number of $1$'s gives

$$
1 = \|T\|_{\mathrm{HS}}^2 = x^2 + 3s^2 + 3P + d^2 + \Delta_\perp, \qquad
\lambda = M_{11} = x^2 + 2s^2 + P.
$$

Therefore $P \le 1/3$, $d^2 + \Delta_\perp = 1 - x^2 - 3s^2 - 3P \ge 0$, and

$$
2\lambda - 1 = x^2 + s^2 - P - (d^2 + \Delta_\perp) \le x^2 + s^2 = \|T(e_1, e_1, \cdot)\|_2^2 \le a^2,
$$

using $\|T(w, w, \cdot)\|_2 \le a$ from van der Corput–Schaake (#500 §2). Thus $\lambda \le \frac{1 + a^2}{2}$ in every dimension.

### 2.2 Orthogonal-slice couplings, Weyl–Karamata spectrum, and Frobenius defect

When $a \le a_0$, the variables $(x, s, b, P)$ satisfy five coupled constraints:

1. **Two-plane constraints on $(e_1, e_2)$**: $x^2 + s^2 \le a_0^2$, $b^2 + d^2 = \|T(e_2, e_2, \cdot)|_{\operatorname{span}(e_1,e_2)}\|_2^2 \le a_0^2$,
   $|x c^3 + 3s c^2 s' + 3b c s'^2 + d s'^3| \le a_0$ for every $(c, s')$ on the unit circle, and
   $D_{p,q} = (px + qb)^2 + 4pq s^2 + (ps + qd)^2 + 4pq b^2 \le a_0^2$ for every $p, q \ge 0$ with $p + q = 1$ (#500 §2).
2. **Eigenvector orthogonality $M_{12} = 0$ and diagonal dominance $M_{22} \le \lambda$**:
   write $u_2 = \sum_{q \ge 3} B_{2q}^2 \ge 0$ and $w_B = \sum_{p,q \ge 3} B_{pq}^2 \ge 0$, so $P - b^2 = 2u_2 + w_B$.
   In $\Delta_\perp = \sum_{(i,j,k) \in \{2,\dots,n\}^3 \setminus \{(2,2,2)\}} T_{ijk}^2$, each entry $C_{2q} = T_{22q}$ ($q \ge 3$)
   appears with multiplicity $3$ (versus $2$ in $\sum_{(p,q) \ne (2,2)} C_{pq}^2$) and each entry $C_{pq} = T_{2pq}$ ($p, q \ge 3$)
   appears with multiplicity $3$ on the diagonal $p = q$ and $6$ off-diagonal (versus $1$ and $2$ in $\sum_{(p,q) \ne (2,2)} C_{pq}^2$).
   Hence

   $$
   \sum_{(p,q) \ne (2,2)} C_{pq}^2 \le \frac{2}{3}\Delta_\perp, \qquad
   \|C\|_{\mathrm{HS}}^2 = d^2 + \sum_{(p,q) \ne (2,2)} C_{pq}^2 \le d^2 + \frac{2}{3}\Delta_\perp = \frac{1}{3}d^2 + \frac{2}{3}(d^2 + \Delta_\perp).
   $$

   Since $0 = M_{12} = x s + 2 s b + \langle B, C\rangle = s(x + 2b) + b d + \sum_{(p,q) \ne (2,2)} B_{pq} C_{pq}$, Cauchy–Schwarz yields

   $$
   \big(s(x + 2b) + b d\big)^2 \le (P - b^2)\sum_{(p,q) \ne (2,2)} C_{pq}^2 \le \frac{2}{3}(P - b^2)\Delta_\perp.
   $$

   Moreover, $\lambda \ge M_{22} = s^2 + 2b^2 + 2u_2 + \|C\|_{\mathrm{HS}}^2 \ge s^2 + 2b^2 + 2u_2 + d^2$, giving
   $2u_2 + d^2 \le \lambda - s^2 - 2b^2 = x^2 + s^2 + P - 2b^2$.
3. **Symmetrized directional eigenvalues of $B$**: for any unit $w \perp e_1$ and $c \in (0, 1)$, averaging
   $T((c e_1 \pm \sqrt{1 - c^2}\,w)^{\otimes 3}) \in [-a_0, a_0]$ cancels odd powers of $\sqrt{1 - c^2}$ and gives
   $|x c^3 + 3 c(1 - c^2) B(w, w)| \le a_0$. Thus $-\mu_-(x, a_0) I_{e_1^\perp} \preceq B \preceq \mu_+(x, a_0) I_{e_1^\perp}$, where

   $$
   \mu_+(x, a_0) = \inf_{c \in (0,1)} \frac{a_0/c - x c^2}{3(1 - c^2)}, \qquad
   \mu_-(x, a_0) = \inf_{c \in (0,1)} \frac{a_0/c + x c^2}{3(1 - c^2)}.
   $$

   Split $B = B_+ - B_-$ into positive and negative parts ($B_\pm \succeq 0$, $B_+ B_- = 0$) and put $p_\pm = \|B_\pm\|_{\mathrm{HS}}^2$,
   so $p_+ + p_- = P$. Since $b = \langle e_2, B e_2\rangle = \langle e_2, B_+ e_2\rangle - \langle e_2, B_- e_2\rangle$,
   we have $b \le \min(\sqrt{p_+}, \mu_+)$ and $-b \le \min(\sqrt{p_-}, \mu_-)$, hence $p_+ \ge \max(0, b)^2$ and $p_- \ge \max(0, -b)^2$.
4. **Weyl and Karamata upper bound on $\operatorname{tr}(M^2)$**: since $M e_1 = \lambda e_1$, $M$ is block-diagonal across
   $\mathbb{R}e_1 \oplus e_1^\perp$. For every unit $w \perp e_1$,

   $$
   \langle w, M w\rangle = |T(e_1, e_1, w)|^2 + 2\|B w\|_2^2 + \sum_{k,\ell \ge 2} T(w, e_k, e_\ell)^2
   \le s^2 + 2\|B\|_{\mathrm{op}}^2 + (d^2 + \Delta_\perp),
   $$

   with $\|B\|_{\mathrm{op}}^2 \le \max\big(\min(p_+, \mu_+^2), \min(p_-, \mu_-^2)\big)$. Thus every eigenvalue of $M|_{e_1^\perp}$ lies in
   $[0, L_2]$, where $L_2 = \min\big(\lambda, s^2 + 2\max(\min(p_+, \mu_+^2), \min(p_-, \mu_-^2)) + d^2 + \Delta_\perp\big)$,
   and their sum is $\operatorname{tr}(M|_{e_1^\perp}) = 1 - \lambda$. By Karamata's majorization inequality for $t \mapsto t^2$,
   for fixed $(\lambda, L_2)$ with $L_2 > 0$, $\operatorname{tr}(M^2) = \lambda^2 + \sum_{j \ge 2} \lambda_j(M)^2$ is bounded above by packing
   $q = \lfloor(1 - \lambda)/L_2\rfloor$ eigenvalues at $L_2$ and one remainder eigenvalue at $1 - \lambda - q L_2$.
   On an interval $[\lambda_{\mathrm{lo}}, \lambda_{\mathrm{hi}}]$ for $\lambda$ at fixed upper bound $L_{\max} \ge L_2$,
   the piecewise-convex function $\lambda \mapsto \lambda^2 + q(\lambda) L_{\max}^2 + (1 - \lambda - q(\lambda) L_{\max})^2$
   is convex on each slab where $q(\lambda)$ is constant, so its maximum over $[\lambda_{\mathrm{lo}}, \lambda_{\mathrm{hi}}]$
   is attained at $\lambda_{\mathrm{lo}}$, $\lambda_{\mathrm{hi}}$, or an interior breakpoint $\lambda = 1 - m L_{\max}$ ($m \in \mathbb{Z}_{\ge 1}$).
5. **Fourth-cumulant Frobenius defect**: since $\|A\|_{\mathrm{HS}}^2 = m = \operatorname{tr}(M^2)$ and $\widetilde{U}$ is an orthogonal projection of $A$,
   $90\operatorname{tr}(M^2) - \kappa_4 = 54(m - u) = 54\|A - \widetilde{U}\|_{\mathrm{HS}}^2$.
   Restrict this sum of squares to the index tuples $(i, j, k, \ell)$ containing two $1$'s and two indices in $\{2, \dots, n\}$.
   For each ordered pair $(p, q) \in \{2, \dots, n\}^2$, put $H_{pq} = A_{11pq} = x B_{pq} + s C_{pq}$ and
   $G_{pq} = A_{1p1q} = s^2 \delta_{p2}\delta_{q2} + (B^2)_{pq}$. Among the six index placements of the two $1$'s,
   $(1, 1, p, q)$ and $(p, q, 1, 1)$ give $A = H_{pq}$ while $(1, p, 1, q), (1, q, 1, p), (p, 1, q, 1), (q, 1, p, 1)$ give $A = G_{pq}$,
   so $\widetilde{U} = \frac{1}{3}(H_{pq} + 2 G_{pq})$ on all six. Summing $(A - \widetilde{U})^2$ over these disjoint orbits yields

   $$
   54\|A - \widetilde{U}\|_{\mathrm{HS}}^2
   \ge 54 \sum_{p,q=2}^n \Big(2 \cdot \frac{4}{9}(G_{pq} - H_{pq})^2 + 4 \cdot \frac{1}{9}(G_{pq} - H_{pq})^2\Big)
   = 72\|s^2 e_2 e_2^\top + B^2 - x B - s C\|_{\mathrm{HS}}^2.
   $$

   Let $D_{\mathrm{mat}} = s^2 e_2 e_2^\top + B^2 - x B - s C$. Its $(2, 2)$ entry gives
   $\|D_{\mathrm{mat}}\|_{\mathrm{HS}} \ge |s^2 + b^2 + u_2 - x b - s d|$. Simultaneously, the triangle inequality gives
   $\|D_{\mathrm{mat}}\|_{\mathrm{HS}} \ge \max\big(0, \|s^2 e_2 e_2^\top + B^2 - x B\|_{\mathrm{HS}} - s\|C\|_{\mathrm{HS}}\big)$, where

   $$
   \|s^2 e_2 e_2^\top + B^2 - x B\|_{\mathrm{HS}}^2
   = \operatorname{tr}\big(B^2(B - x I)^2\big) + 2s^2(b^2 + u_2 - x b) + s^4
   \ge p_- x^2 + p_+ \max(0, x - \mu_+)^2 + 2s^2(b^2 + u_2 - x b) + s^4,
   $$

   since every negative eigenvalue $\beta$ of $B$ satisfies $(\beta - x)^2 \ge x^2$ ($x \ge 0$) and every positive eigenvalue
   $\beta \in (0, \mu_+]$ satisfies $(\beta - x)^2 \ge \max(0, x - \mu_+)^2$.

The script `certify_tensor.py` checks the slot and Frobenius-defect identities on explicit tensors in $\mathbb{R}^4$, then
runs 128-bit outward-rounded Arb branch-and-bound on $(x, s, b, P) \in [0, a_0]^2 \times [-a_0, a_0] \times [0, 1/3]$
with six analytical slices on $d$ and four on $p_+$, certifying:
- for $a_0 = 321/500 = 0.642$: $\lambda < 167/250 = 0.668$ and $\kappa_4 < 233/5 = 46.6$ (6,225 leaves, 5,044 pruned);
- for $a_0 = 7/10 = 0.700$: $\lambda < 173/250 = 0.692$ and $\kappa_4 < 49$ (6,715 leaves, 6,786 pruned).

---

## 3. Orthogonal-complement slice with remainder moments and dimension induction

Let $v$ attain $a = a(F) = T(v, v, v) \ge a_0 > 0$, write $X = \langle v, G\rangle$, and let $Y \sim \mathcal{N}(0, I_{n-1})$
be the Gaussian coordinates in $v^\perp$. Stationarity of $w \mapsto T(w, w, w)$ on $S^{n-1}$ gives $T(v, v, w) = 0$
for all $w \perp v$, so

$$
F = a h_3(X) + X Q(Y) + R(Y), \qquad \mathbb{E}[Q] = 0, \qquad \mathbb{E}[Q^2] + \mathbb{E}[R^2] = 1 - a^2,
$$

with $Q \in V_2(\mathbb{R}^{n-1})$ and $R \in V_3(\mathbb{R}^{n-1})$ (#500 §1). Write $u_r = \mathbb{E}[R^2] = s(1 - a^2)$ with
$s \in [0, 1]$, and when $u_r > 0$ write $R = \sqrt{u_r}\,\widehat{R}$ ($\mathbb{E}[\widehat{R}^2] = 1$, $\kappa_R = \kappa_4(\widehat{R}) \in [0, 90]$;
when $u_r = 0$, set $\widehat{R} = 0$ and $\kappa_R = 0$). Put $\sigma_q^2 = \frac{(1 - a^2)(1 - s)}{a^2}$ and $\sigma_r^2 = \frac{(1 - a^2)s}{a^2}$, so
$\mathbb{E}[(Q/a)^2] = \sigma_q^2$, $\mathbb{E}[(R/a)^2] = \sigma_r^2$, $\mathbb{E}[(R/a)^4] = (3 + \kappa_R)\sigma_r^4$, and by §1,

$$
\mathbb{E}[(R/a)^6] \le \big(15 + 15\kappa_R + 67\kappa_R^{3/2}\big)\sigma_r^6.
$$

For real $(q, b)$, put $\Psi(q, b) = \mathbb{E}_X|h_3(X) + q X + b| = \Psi(q, -b)$, which is convex on $\mathbb{R}^2$.
Consider a rational majorant on $\mathbb{R} \times [0, \infty)$ of the form

$$
M(q, b) = C + \ell q + \mu_q q^2 + \alpha b + \mu_{b,2} b^2 - \mu_{b,4} b^4 + \mu_{b,6} b^6,
\qquad \mu_q > 0,\ \alpha \in [0, 1],\ \mu_{b,2} > 0,\ \mu_{b,4} \ge 0,\ \mu_{b,6} > 0.
$$

If $\Psi(q, b) \le M(q, b)$ for all $(q, b) \in \mathbb{R} \times [0, \infty)$, substituting $(Q(Y)/a, |R(Y)|/a)$ and taking
expectation over $Y$ (noting $\mathbb{E}[Q] = 0$) gives

$$
\mathbb{E}|F| = a\,\mathbb{E}_Y\Psi\big(Q/a, |R|/a\big)
\le a\Big(C + \mu_q \sigma_q^2 + \alpha\,\mathbb{E}|\widehat{R}|\,\sigma_r + \mu_{b,2}\sigma_r^2
- \mu_{b,4}(3 + \kappa_R)\sigma_r^4 + \mu_{b,6}(15 + 15\kappa_R + 67\kappa_R^{3/2})\sigma_r^6\Big).
$$

### 3.1 Global certification of $\Psi(q, b) \le M(q, b)$

1. **Compact rectangle $[-9/2, 9/2] \times [0, 9/2]$**: on any subrectangle $[q_0, q_1] \times [b_0, b_1]$ of widths
   $\Delta_q = q_1 - q_0$ and $\Delta_b = b_1 - b_0$, $\Psi$ is convex, so $\Psi(q, b)$ is bounded above by bilinear interpolation
   of its four corner values (enclosed via exact Gaussian primitives on intervals of certified sign of $h_3(x) + q x + b$ on $[-9, 9]$
   plus the analytic tails $|x| \ge 9$, as in #500 §1). For the separable polynomial $M(q, b)$, linear interpolation of $\mu_q q^2$ on
   $[q_0, q_1]$ exceeds $\mu_q q^2$ by at most $\frac{1}{4}\mu_q \Delta_q^2$, and linear interpolation of
   $g_b(b) = \alpha b + \mu_{b,2}b^2 - \mu_{b,4}b^4 + \mu_{b,6}b^6$ on $[b_0, b_1]$ exceeds $g_b(b)$ by at most
   $\frac{1}{8}\Delta_b^2 \max\big(0, \sup_{b \in [b_0,b_1]} g_b''(b)\big)$, where
   $g_b''(b) = 2\mu_{b,2} - 12\mu_{b,4}b^2 + 30\mu_{b,6}b^4$. Thus $\max_{\text{4 corners}}(\Psi - M) + \frac{1}{4}\mu_q\Delta_q^2 + \frac{1}{8}\Delta_b^2 \max(0, \sup g_b'') < 0$
   certifies $\Psi < M$ on the subrectangle.
2. **Exterior $|q| \ge 9/2$ or $b \ge 9/2$**: the triangle inequality gives
   $\Psi(q, b) \le h_0 + c_0|q| + b$, where $h_0 = \mathbb{E}|h_3(X)| = \frac{1 + 4e^{-3/2}}{\sqrt{3\pi}}$.
   Thus $\Psi(q, b) - M(q, b) \le (h_0 - C) + E_q(q) + E_b(b)$ with
   $E_q(q) = (c_0 + |\ell|)|q| - \mu_q q^2$ and $E_b(b) = (1 - \alpha)b - \mu_{b,2}b^2 + \mu_{b,4}b^4 - \mu_{b,6}b^6$.
   For $|q| \ge B_q = 9/2$ with $2\mu_q B_q > c_0 + |\ell|$, $E_q(q) \le E_q(B_q)$, while $\sup_{q \in \mathbb{R}} E_q(q) = \frac{(c_0 + |\ell|)^2}{4\mu_q}$.
   For $E_b$, at $B_{\mathrm{far}} = 110$ the script verifies $6\mu_{b,6}B_{\mathrm{far}}^2 > 4\mu_{b,4}$ and
   $B_{\mathrm{far}}^3(6\mu_{b,6}B_{\mathrm{far}}^2 - 4\mu_{b,4}) > 1 - \alpha$, so $E_b'(b) < 0$ for all $b \ge 110$.
   Completing the square $\mu_{b,2}y - \mu_{b,4}y^2 + \mu_{b,6}y^3 = y\big[\mu_{b,6}(y - y_*)^2 + (\mu_{b,2} - \mu_{b,4}^2/(4\mu_{b,6}))\big]$
   in $y = b^2$ encloses $\sup_{[0, 9/2]} E_b$ and $\sup_{[9/2, 110]} E_b$ without interval dependency cancellation.

### 3.2 Sharp bound ($a \ge 0.700$) and practical bound ($a \ge 0.642$)

- **Sharp Gaussian regime ($a \ge 7/10 = 0.700$)**: all 15 rational majorants in `SHARP_MAJS` (`certify_rank_slice.py`) have $\alpha = 0$,
  so $\mathbb{E}|\widehat{R}|$ drops out completely and no dimension induction is needed. On $[7/10, 1] \times [0, 1] \times [0, 90]$,
  `certify_rank_slice.py` certifies 1,740 $\Psi$-rectangles and 92,805 $(a, s, \kappa_R)$-cells strictly below $c_0 = \sqrt{2/\pi}$.
  Combined with §2 ($a \le 0.700 \implies \lambda < 0.692,\ \kappa_4 < 49$), the sharp bound holds whenever $a \ge 0.700$,
  $\lambda \ge 0.692$, or $\kappa_4 \ge 49$.
- **Practical regime ($a \ge 321/500 = 0.642$)**: argue by induction on the ambient dimension $n \ge 1$.
  For $n = 1$, $F = \pm h_3(X_1)$ has $\mathbb{E}|F| = h_0 = 0.61646\dots < c_0 < C_{\mathrm{tar}}$.
  For $n \ge 2$, $\widehat{R} \in V_3(\mathbb{R}^{n-1})$:
  - If $\kappa_R \ge 233/5 = 46.6$, then §2 gives $a(\widehat{R}) > 321/500$, so the induction hypothesis in dimension $n - 1$ gives
    $\mathbb{E}|\widehat{R}| \le C_{\mathrm{tar}}$.
  - If $0 \le \kappa_R < 46.6$, §6 gives $\mathbb{E}|\widehat{R}| < 44357/50000$, and #500 §5 gives for **every** $\kappa_R \ge 0$
    and $g = \sqrt{\operatorname{Var}\tau(\widehat{R})} \in [0, \sqrt{2\kappa_R/9}]$:
    $$\mathbb{E}|\widehat{R}| \le c_0\Big(1 - \frac{\kappa_R}{24} + g\sqrt{\frac{23}{32} - \log 2 + \frac{\kappa_R}{64} + \frac{7}{100}g}\Big),$$
    whose right-hand side is strictly increasing in $g \ge 0$ and therefore maximized at $g = \sqrt{2\kappa_R/9}$.
  With 19 rational majorants (`PRAC_MAJS`), `certify_rank_slice.py` certifies 2,089 $\Psi$-rectangles and 199,625 $(a, s, \kappa_R)$-cells
  strictly below $\sqrt{17/25}$. Combined with §2, $(T)$ holds whenever $a \ge 0.642$, $\lambda \ge 0.668$, or $\kappa_4 \ge 46.6$.

---

## 4. Quartic-Huber second-order Stein bound with $D_1$ integration by parts ($\lambda \le 0.0064$)

For $\delta = 6/25 = 0.24$, define the even $C^2(\mathbb{R})$ quartic-Huber majorant of $|x|$:

$$
Q_\delta(x) =
\begin{cases}
\dfrac{3\delta}{8} + \dfrac{3x^2}{4\delta} - \dfrac{x^4}{8\delta^3}, & |x| \le \delta,\\[6pt]
|x|, & |x| \ge \delta.
\end{cases}
$$

At $x = \delta$, $Q_\delta(\delta) = \delta$, $Q_\delta'(\delta) = 1$, and $Q_\delta''(\delta) = 0$. On $[0, \delta]$,
$(Q_\delta(x) - x)' = -\frac{(\delta - x)^2(2\delta + x)}{2\delta^3} \le 0$ with $Q_\delta(\delta) - \delta = 0$, so $|x| \le Q_\delta(x)$
for all $x \in \mathbb{R}$. Also $Q_\delta'(x) = \frac{x(3\delta^2 - x^2)}{2\delta^3}$ and
$Q_\delta''(x) = \frac{3(\delta^2 - x^2)}{2\delta^3} \ge 0$ on $[0, \delta]$, so $Q_\delta$ and $Q_\delta'$ are increasing and $Q_\delta''$ is
decreasing on $[0, \delta]$.

Let $g_\delta = \mathbb{E}[Q_\delta(Z)]$ ($Z \sim \mathcal{N}(0, 1)$). Since $Q_\delta - g_\delta \in C^2(\mathbb{R})$ is even with zero Gaussian mean,

$$
\psi_\delta(x) = e^{x^2/2}\int_x^\infty (Q_\delta(t) - g_\delta)e^{-t^2/2}\,dt
$$

is **odd** and belongs to $C^3(\mathbb{R})$ across $x = 0$, solving $\psi_\delta'(x) - x\psi_\delta(x) = -(Q_\delta(x) - g_\delta)$.
With $L = \Delta - x \cdot \nabla$, $W = I_2(M) + \frac{1}{8}I_4(\widetilde{U})$ ($-LW = \tau - 1$), and $D = \langle \nabla F, \nabla W\rangle$ (#500 §4),
two Gaussian integrations by parts give, without mollification,

$$
\mathbb{E}|F| \le \mathbb{E}[Q_\delta(F)] = g_\delta + \mathbb{E}[(\tau - 1)\psi_\delta'(F)] = g_\delta + \mathbb{E}[\psi_\delta''(F) D]
= g_\delta - c_0\,\mathbb{E}[\chi_\delta(F) D],
$$

where $\chi_\delta(x) = -\psi_\delta''(x)/c_0 = \operatorname{sgn}(x) b_\delta(|x|) \in C^1(\mathbb{R})$ is odd ($\chi_\delta'(x) = b_\delta'(|x|) \in C^0(\mathbb{R})$ is even),
and for $x \ge 0$, writing $f_\delta'(x) = -\psi_\delta(x)$,

$$
\begin{aligned}
b_\delta(x) &= \frac{(1 + x^2)f_\delta'(x) + x(Q_\delta(x) - g_\delta) + Q_\delta'(x)}{c_0},\\
b_\delta'(x) &= \frac{(3x + x^3)f_\delta'(x) + (2 + x^2)(Q_\delta(x) - g_\delta) + x Q_\delta'(x) + Q_\delta''(x)}{c_0}.
\end{aligned}
$$

For $x \ge \delta$, $Q_\delta(t) = t$ on $[x, \infty)$, so $\int_x^\infty (t - g_\delta)e^{-t^2/2}\,dt = e^{-x^2/2} - g_\delta B(x)$
with $B(x) = e^{x^2/2}\int_x^\infty e^{-t^2/2}\,dt$. Substituting $f_\delta'(x) = -1 + g_\delta B(x)$, $Q_\delta(x) = x$, $Q_\delta'(x) = 1$,
and $Q_\delta''(x) = 0$ cancels the polynomial terms identically and yields

$$
b_\delta(x) = \frac{g_\delta}{c_0} b_0(x), \qquad b_\delta'(x) = \frac{g_\delta}{c_0} b_0'(x) \qquad (\forall\, x \ge \delta),
$$

where $b_0(x) = (1 + x^2)B(x) - x = \int_0^\infty t^2 e^{-xt - t^2/2}\,dt > 0$ and $-b_0'(x) = \int_0^\infty t^3 e^{-xt - t^2/2}\,dt > 0$
are strictly decreasing on $[0, \infty)$ with $0 \le b_0(x) \le 2/x^3$ and $0 \le -b_0'(x) \le 6/x^4$ for $x > 0$.

### 4.1 Chaos decomposition of $D$, optimal $D_3$ Cauchy–Schwarz, and $D_1$ integration by parts

Recall from #500 §4 that $D = D_1 + D_3 + D_5 \in V_1 \oplus V_3 \oplus V_5$ with orthogonal components

$$
D_1 = \frac{7}{2}\sqrt{6}\,\langle V, G\rangle, \qquad
D_3 = \sqrt{6}\,I_3\big(\operatorname{sym}(C + \tfrac{3}{2}E)\big), \qquad
D_5 = \sqrt{\frac{3}{8}}\,I_5(\operatorname{sym}J),
$$

where $\|V\|_2^2 \le \lambda m$, $\|C\|_{\mathrm{HS}}^2 \le \lambda m$, $\|E\|_{\mathrm{HS}}^2 \le \lambda u$, and $\|J\|_{\mathrm{HS}}^2 \le \lambda u$.
Write $x_m = m/\lambda \in [0, 1]$ and $x_u = u/\lambda \in [0, x_m]$, so $\kappa_4 = \lambda(36x_m + 54x_u)$ and
$\operatorname{Var}\tau = \lambda(8x_m + 6x_u)$.

1. **Optimal $D_3$ Cauchy–Schwarz**: since $\|\operatorname{sym}H\|_{\mathrm{HS}} \le \|H\|_{\mathrm{HS}}$,
   $\mathbb{E}[D_3^2] = 6 \cdot 3!\,\|\operatorname{sym}(C + \frac{3}{2}E)\|_{\mathrm{HS}}^2 \le 36(\|C\|_{\mathrm{HS}} + \frac{3}{2}\|E\|_{\mathrm{HS}})^2 \le \lambda^2(6\sqrt{x_m} + 9\sqrt{x_u})^2 = \lambda^2(36x_m + 81x_u + 108\sqrt{x_m x_u})$.
   Combined with $\mathbb{E}[D_1^2] \le \frac{147}{2}\lambda^2 x_m$ and $\mathbb{E}[D_5^2] \le \frac{3}{8}\cdot 5!\,\lambda^2 x_u = 45\lambda^2 x_u$,
   we obtain both
   $$\mathbb{E}[(D_3 + D_5)^2] \le \lambda^2\big(36x_m + 126x_u + 108\sqrt{x_m x_u}\big), \qquad
   \mathbb{E}[D^2] \le \lambda^2\Big(\frac{219}{2}x_m + 126x_u + 108\sqrt{x_m x_u}\Big).$$
   (For $F = h_3(X_1)$, $x_m = x_u = \lambda = 1$, and all three bounds are attained: $73.5 + 225 + 45 = 343.5$.)
2. **$D_1$ Malliavin integration by parts**: since $\chi_\delta \in C^1(\mathbb{R})$ with bounded derivative, Gaussian integration by parts against
   $D_1 = \frac{7}{2}\sqrt{6}\langle V, G\rangle$ gives
   $$|\mathbb{E}[\chi_\delta(F) D_1]| = \frac{7}{2}\sqrt{6}\,\big|\mathbb{E}\big[\chi_\delta'(F)\langle V, \nabla F\rangle\big]\big|
   \le \frac{7}{2}\sqrt{6}\,\|\chi_\delta'(F)\|_2\,\|\langle V, \nabla F\rangle\|_2.$$
   Since $\partial_i F = \sqrt{\frac{3}{2}}I_2(T_{i\cdot\cdot})$, Wiener-chaos inner products give
   $$\mathbb{E}[\langle V, \nabla F\rangle^2] = \frac{3}{2}\cdot 2!\,\Big\|\sum_i V_i T_{i\cdot\cdot}\Big\|_{\mathrm{HS}}^2
   = 3\sum_{k,\ell}\Big(\sum_i V_i T_{ik\ell}\Big)^2 = 3\langle V, M V\rangle \le 3\lambda\|V\|_2^2 \le 3\lambda^2 m = 3\lambda^3 x_m.$$
   Hence $|\mathbb{E}[\chi_\delta(F) D_1]| \le \frac{21}{\sqrt{2}}\|\chi_\delta'(F)\|_2 \sqrt{x_m}\,\lambda^{3/2}$.
3. **Orthogonal projection onto $F$**: since $F \in V_3$ is orthogonal to $D_1 \in V_1$, $\mathbb{E}[F(D_3 + D_5)] = \mathbb{E}[F D] = \kappa_4/6$.
   For $\alpha = 6/25$, both $D - \frac{\kappa_4}{6}F$ and $D_3 + D_5 - \frac{\kappa_4}{6}F$ are orthogonal to $F$, yielding the two simultaneous upper bounds:
   $$\mathbb{E}|F| \le g_\delta + c_0\left(\frac{21}{\sqrt{2}}\|\chi_\delta'(F)\|_2\sqrt{x_m}\,\lambda^{3/2}
   + \lambda\Big(\|\chi_\delta(F) - \alpha F\|_2 \sqrt{36x_m + 126x_u + 108\sqrt{x_m x_u} - \tfrac{S^2}{36}} - \frac{S}{6}\mathbb{E}[F\chi_\delta(F)]\Big)\right)$$
   and
   $$\mathbb{E}|F| \le g_\delta + c_0\lambda\Big(\|\chi_\delta(F) - \alpha F\|_2 \sqrt{\tfrac{219}{2}x_m + 126x_u + 108\sqrt{x_m x_u} - \tfrac{S^2}{36}} - \frac{S}{6}\mathbb{E}[F\chi_\delta(F)]\Big),$$
   where $S = 36x_m + 54x_u$.

### 4.2 Gaussian Stein enclosures of the three test moments

To enclose $\mathbb{E}[F\chi_\delta(F)]$, $\mathbb{E}[(\chi_\delta(F) - \alpha F)^2]$, and $\mathbb{E}[\chi_\delta'(F)^2]$ around their Gaussian values without
carrying unboundable fourth moments of $F$ in the second test, subtract $\alpha^2 He_2(x)$ (which has $\mathbb{E}[\alpha^2 He_2(F)] = \alpha^2(\mathbb{E}[F^2] - 1) = 0$!):
define the three even functions (for $x \ge 0$)

$$
\phi_1(x) = x b_\delta(x), \qquad
\phi_2(x) = (b_\delta(x) - \alpha x)^2 - \alpha^2(x^2 - 1) = \alpha^2 + b_\delta(x)^2 - 2\alpha x b_\delta(x), \qquad
\phi_3(x) = b_\delta'(x)^2,
$$

with asymptotic limits $h_{\infty,1} = 0$, $h_{\infty,2} = \alpha^2$, $h_{\infty,3} = 0$ and rapidly decaying remainders
$r_i(x) = \phi_i(x) - h_{\infty,i} = O(x^{-2})$. For each $i \in \{1, 2, 3\}$, let $m_i = \mathbb{E}[\phi_i(|Z|)] = h_{\infty,i} + \mathbb{E}[r_i(|Z|)]$.
The even Stein derivative $f_{\phi_i}'(x)$ satisfies the identity (free of $e^{x^2/2}\mathbb{E}[r_i(|Z|)]$)

$$
f_{\phi_i}'(x) = r_i(x) - x e^{x^2/2}\int_x^\infty r_i(t)e^{-t^2/2}\,dt - \mathbb{E}[r_i(|Z|)]\,\big(1 - x B(x)\big) \qquad (x \ge 0).
$$

If $\ell_i \le f_{\phi_i}'(x) \le u_i$ for all $x \in \mathbb{R}$, centering at $\frac{1}{2}(\ell_i + u_i)$ gives
$|\mathbb{E}[\phi_i(|F|)] - m_i| = |\mathbb{E}[(\tau - 1)(f_{\phi_i}'(F) - \tfrac{\ell_i + u_i}{2})]| \le \mathrm{sp}_i\sqrt{\operatorname{Var}\tau}$
with $\mathrm{sp}_i = \frac{1}{2}(u_i - \ell_i)$! On $[0, 10]$ (with tail accumulation from $12$ on $30,000$ cells of width $1/2500$) and $[10, \infty)$
(via $|f_{\phi_i}'(x)| \le |\mathbb{E}[r_i(|Z|)]|/(1 + 10^2) + 2\sup_{t \ge 10}|r_i(t)|$), `certify_stein_quartic.py` encloses
$g_\delta \in [0.802470, 0.802471]$, $m_1 \in [0.2452, 0.2463]$ ($\mathrm{sp}_1 \le 0.15190$),
$m_2 \in [0.1955, 0.1969]$ ($\mathrm{sp}_2 \le 0.35104$), and $m_3 \in [3.75, 3.78]$ ($\mathrm{sp}_3 \le 17.9075$),
then covers the entire 3D domain $0 \le x_u \le x_m \le 1$, $0 \le \lambda \le 16/2500 = 0.0064$ across $3,505$ boxes
strictly below $\sqrt{17/25}$ without invoking #500 §5.

---

## 5. Small-cumulant bound by sixth-moment spline Stein regression ($\kappa_4 \le 91/500$)

Fix knot $M = 33/10 = 3.3$, $\beta = 7/50$, and $\gamma = 7/2000$. Define the even $C^1(\mathbb{R})$ quadratic-tail $He_4$ spline

$$
\phi_M(x) =
\begin{cases}
He_4(x) = x^4 - 6x^2 + 3, & |x| \le M,\\
A_0 + A_2 x^2, & |x| \ge M,
\end{cases}
\qquad A_2 = 2M^2 - 6 = \frac{789}{50}, \quad A_0 = 3 - M^4 = -\frac{1155921}{10000}.
$$

Let $\Phi_M(x) = \int_0^x \phi_M(t)\,dt$ and $\Psi_M(x) = \int_0^x \Phi_M(t)\,dt \in C^3(\mathbb{R})$. Since $\Psi_M$ has quartic growth,
$0 = \frac{1}{3}\mathbb{E}[L(\Psi_M(F))] = \mathbb{E}[\tau \phi_M(F) - F \Phi_M(F)]$, hence
$\mathbb{E}[(\tau - 1)\phi_M(F)] = \mathbb{E}[W_M(F)]$ with $W_M(x) = x\Phi_M(x) - \phi_M(x)$ even.
For $|x| \le M$, $W_M(x) = \frac{x^6}{5} - 3x^4 + 9x^2 - 3 = \frac{1}{5}He_6(x)$. For $x \ge M$,
$\Phi_M(x) = \frac{8}{15}M^5 + A_0 x + \frac{A_2}{3}x^3$, so $W_M(x) = -A_0 + \frac{8}{15}M^5 x + (A_0 - A_2)x^2 + \frac{A_2}{3}x^4$.
Substituting $x = M/u$ ($u \in (0, 1]$), `certify_regression_sixth.py` certifies in exact rational arithmetic (69,553 subintervals) that

$$
W_M(x) \le \frac{1}{5}He_6(x) + \frac{33}{20000}x^6 \qquad (\forall\, x \in \mathbb{R}).
$$

Now subtract $\frac{1}{2} - \beta He_2(F) + \gamma\phi_M(F)$ inside $\frac{\mathbb{E}|F|}{c_0} - 1 = \mathbb{E}[(\tau - 1)K(F)]$, where
$K(x) = 1 - |x|B(|x|)$ and $\mathbb{E}[(\tau - 1)He_2(F)] = \kappa_4/3$:

$$
\frac{\mathbb{E}|F|}{c_0} - 1
= -\frac{\beta}{3}\kappa_4 + \gamma\,\mathbb{E}[W_M(F)] + \mathbb{E}[(\tau - 1)R_M(F)]
\le -\frac{\beta}{3}\kappa_4 + \gamma\Big(\frac{\kappa_6}{5} + \frac{33}{20000}\mathbb{E}[F^6]\Big) + \sqrt{\operatorname{Var}\tau}\,\sqrt{\mathbb{E}[R_M(F)^2]},
$$

where $R_M(x) = K(x) - \frac{1}{2} + \beta He_2(x) - \gamma\phi_M(x)$, since $\mathbb{E}[He_6(F)] = \kappa_6(F)$.
For $x \ge M$, $\phi_M(x) = (A_0 + A_2) + A_2 He_2(x)$, so $R_M(x) = K(x) + c_\infty + q_{\mathrm{lead}}He_2(x)$ with
$q_{\mathrm{lead}} = \beta - \gamma A_2$ and $c_\infty = -\frac{1}{2} - \gamma(A_0 + A_2)$.
Subtracting the quadratic and quartic pieces (which evaluate exactly via $\mathbb{E}[He_2(F)] = 0$ and $\mathbb{E}[He_2(F)^2] = 2 + \kappa_4$) leaves

$$
h_{\mathrm{rem}}(x) = R_M(x)^2 - q_{\mathrm{lead}}^2 He_2(x)^2 - 2 q_{\mathrm{lead}} c_\infty He_2(x),
\qquad \mathbb{E}[R_M(F)^2] = \mathbb{E}[h_{\mathrm{rem}}(F)] + q_{\mathrm{lead}}^2(2 + \kappa_4).
$$

Notice two algebraic simplifications that eliminate interval dependency blowup:
- On $[0, M]$, writing $R_M(x) = g_{\mathrm{sm}}(x) + q_{\mathrm{lead}}He_2(x)$ gives
  $g_{\mathrm{sm}}(x) = K(x) - \frac{1}{2} + \gamma\big(M^4 - (M^2 - x^2)^2 - (2M^2 - 3)\big)$, whose polynomial part is strictly increasing on $[0, M]$,
  and $h_{\mathrm{rem}}(x) = g_{\mathrm{sm}}(x)^2 + 2 q_{\mathrm{lead}}He_2(x)(g_{\mathrm{sm}}(x) - c_\infty)$.
- On $[M, \infty)$, $h_{\mathrm{rem}}(x) - h_\infty = K(x)^2 + 2(c_\infty - q_{\mathrm{lead}})K(x) + 2 q_{\mathrm{lead}}(x^2 K(x) - 1)$
  with $h_\infty = c_\infty^2 + 2 q_{\mathrm{lead}}$, decaying as $O(x^{-2})$ since $0 \le K(x) \le x^{-2}$ and $-3x^{-2} \le x^2 K(x) - 1 \le 0$.

Using 150-bit outward-rounded Arb integration on $[0, 12]$ ($35,000$ cells of width $1/2500$ from $14$, analytic Mills bounds above $12$),
`certify_regression_sixth.py` encloses $m_{h,\mathrm{rem}} + 2 q_{\mathrm{lead}}^2 \in [0.0228, 0.0232]$ and $\mathrm{sp}_r \le 0.05873$, and
combines $\kappa_6 \le 67\kappa_4^{3/2}$ (§1) with $\operatorname{Var}\tau \le \frac{2}{9}\kappa_4$ across 11 subintervals of $[0, 91/500]$
to certify $\mathbb{E}|F| < \sqrt{17/25}$ for all $\kappa_4 \le 91/500 = 0.182$.

---

## 6. Unrestricted universal bound from $N = 211$ circle samples

Follow the Mehler circle-duality setup of #500 §6 (`codex-6d92`, `audit_pdfs`). For $f = \operatorname{sgn}F$ with $j$-th Hermite
projection norm squared $w_j$, $(\mathbb{E}|F|)^2 \le w_3$. On a Gaussian circle $U\cos\theta + V\sin\theta$, $F$ almost surely has $1$ or $3$
sign changes per half-turn, so its signs $\sigma_r \in \{\pm 1\}$ on $N = 211$ equally spaced half-circle points (with antiperiodic continuation
$\sigma_{r+211} = -\sigma_r$) have $1$ or $3$ transitions. Placing a transition on the wrap-around edge leaves $1 + \binom{210}{2} = 21,946$
canonical patterns.

With lags $(41, 42, 92)$ and integer weights $(15, -14, -1)$, `certify_circle_211.py` evaluates

$$
\sum_{r=0}^{210} \sigma_r\big(15\sigma_{r+41} - 14\sigma_{r+42} - \sigma_{r+92}\big)
$$

across all $21,946$ patterns and obtains the exact maximum $130$. Setting
$A = \cos(41\pi/211) > B = \cos(42\pi/211) > C = \cos(92\pi/211) > 0$, each odd-degree Mehler weight
$15A^j - 14B^j - C^j = 14(A^j - B^j) + (A^j - C^j)$ is strictly positive. Retaining $j = 3$ and enclosing $\pi$ and the cosines by
Machin's formula and alternating rational Taylor series gives

$$
(\mathbb{E}|F|)^2 \le \frac{130/211}{15A^3 - 14B^3 - C^3} < \left(\frac{44357}{50000}\right)^2,
$$

certifying $\mathbb{E}|F|/\|F\|_2 < 44357/50000 = 0.88714$ (actual certified square root $0.8871353\dots$).

---

## 7. Complex phase-averaging consequence and remaining open window

For $q \in \mathcal{H}_{2,1}(\mathbb{C}^d)$, each phase slice $F_\theta = \operatorname{Re}(e^{i\theta}q)$ belongs to the real third chaos
$V_3(\mathbb{R}^{2d})$ with $\mathbb{E}_\theta\|F_\theta\|_2^2 = \frac{1}{2}\|q\|_2^2$. Whenever a real constant $C$ bounds
$\mathbb{E}|F_\theta|/\|F_\theta\|_2$ for all $\theta$, Cauchy–Schwarz on the phase circle gives
$\mathbb{E}|q| \le \frac{\pi C}{2\sqrt{2}}\|q\|_2$ (#500 §7). In particular:

- Every $q \in \mathcal{H}_{2,1}(\mathbb{C}^d)$ whose nonzero phase slices satisfy any of the broadened practical criteria
  ($\operatorname{rank} M(F_\theta) \le 15$, $a(F_\theta) \ge 0.642$, $\lambda(F_\theta) \le 0.0064$, $\lambda(F_\theta) \ge 0.668$,
  $\operatorname{Var}\tau(F_\theta) \le 89/2250$, $\kappa_4(F_\theta) \le 0.182$, or $\kappa_4(F_\theta) \ge 46.6$) satisfies
  $\mathbb{E}|q| \le \pi\sqrt{17/200}\,\|q\|_2 < 0.916\,\|q\|_2$.
- Every $q \in \mathcal{H}_{2,1}(\mathbb{C}^d)$ whose nonzero phase slices satisfy $a(F_\theta) \ge 0.700$, $\lambda(F_\theta) \ge 0.692$,
  or $\kappa_4(F_\theta) \ge 49$ satisfies the sharp Gaussian radius bound $\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\|q\|_2$.

On the real third chaos $V_3(\mathbb{R}^n)$ itself, the dimension-free criteria of §§1–6 together with #500 leave open only cubics
outside the proved structured classes with

$$
\operatorname{rank}(M) \ge 16, \qquad
a(F) < \frac{321}{500} = 0.642, \qquad
\frac{16}{2500} = 0.0064 < \lambda < \frac{167}{250} = 0.668, \qquad
\operatorname{Var}\tau > \frac{89}{2250}, \qquad
\frac{91}{500} = 0.182 < \kappa_4(F) < \frac{233}{5} = 46.6
$$

for the practical target $\mathbb{E}|F| \le \sqrt{17/25}\|F\|_2$, and $\operatorname{rank}(M) \ge 12$, $a(F) < 0.700$,
$\lambda < 0.692$, $\kappa_4(F) < 49$ for the sharp Gaussian bound $\mathbb{E}|F| \le \sqrt{2/\pi}\|F\|_2$.

---

## Replay

Run all six checkers from the repository root with Python 3.12 and `python-flint` 0.9.0 (`certify_sixth.py` and
`certify_circle_211.py` use only the Python standard library). Each script rejects `-O` and exits nonzero on any failed assertion.

```sh
cert_dir=research/conjecture-K/code/third-chaos-dimfree-gemini-c1de
python3 -I "$cert_dir/certify_sixth.py"
python3 -I "$cert_dir/certify_circle_211.py"
python3 -B "$cert_dir/certify_stein_quartic.py"
python3 -B "$cert_dir/certify_regression_sixth.py"
python3 -B "$cert_dir/certify_rank_slice.py"
python3 -B "$cert_dir/certify_tensor.py"
```
