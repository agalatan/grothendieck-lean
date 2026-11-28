# Stage 0 (`#751`) Sector Resolution: Antisymmetric Slice-Gram Inequality, Retained-Defender Dual Rows, and Certified All-Dimension Sharing Bounds on `g83`, `g84`, and `gA`

**Author:** `gemini-4c4c`  
**Date:** 28 November 2026  
**Ledger tag:** `S0RG` (`research/higher-degree/STATUS.md` row `4.57`)  
**Issues:** `#849` (refs `#751`, `#453`)  
**Verifier:** `python3 -IB research/higher-degree/code/stage0-retained-gram-gemini-4c4c/verify.py` (and `python3 -IB -O ...`), zero `float`, zero `assert`, zero external dependencies

---

## 0. Context, Main Results, and Scope

In Stage 0 (`#751`, `sources/degree5-stage0-2026-11-28/REPORT.md`), two questions were tested to decide whether any degree-5 Hermite projection game $T_5 = P_{1,0} - \varepsilon_1 P_{2,1} + \eta P_{3,2}$ can certify a lower bound $K_G^{\mathbb{C}} > 1.403$:

1. **Part (a) (small-$t$ law layer):** In the enriched law class `E3` (carrying the global cubic radius $\rho_0 = 114/125 = 0.912$ of `KOUL3`), the high-weight games `g83` $= (1, -83/100, 2241/10000)$ ($1/N_5 \approx 1.403493$), `g84` $= (1, -21/25, 319/1250)$ ($1/N_5 \approx 1.403584 > 1.4035$), and the free optimum `gA` $= (1, -8493/10000, 2827/10000)$ ($1/N_5 \approx 1.403646$) clear the $1/1.403 = 1000/1403$ threshold across every sampled point $t \in [0, 0.55]$.
2. **Part (b) (the sector gate on the binding band $t \in [0.70, 0.86]$):** Using the `spike2.py` gate of `4.16` (which discards all non-visible components of the negative-definite operator $-\varepsilon_1 P_{2,1}$ on $h = \frac{f+g}{2}$), Stage 0 measured one-spike quintic shell shares $\kappa_h = 0.522, 0.673, 0.842 > 0.35 = 7/20$ at $t = 0.80$ ($c = 0.1$) on `g83`, `g84`, `gA`, and total one-spike sharing ratios exceeding $1$ ($\theta > 0$) on `g84` for $t \ge 0.84$ and `gA` for $t \ge 0.82$. Under the `#751` stop rule ($\kappa_h \le 0.35$ at $t = 0.80$ and $\theta \le 0$ across the band), Stage 0 concluded that degree 5 stops unless a structural modification changes the sector budget (`REPORT.md` §9).

This note resolves both questions raised by Stage 0 Part (b) and `REPORT.md` §9, with self-contained proofs and a zero-float Python 3 standard-library interval certificate:

- **Negative resolution of `REPORT.md` §9 Idea 1 (Theorem 2(b)):** Re-optimising the scalar visible quintic multiplier $\nu_5 e_{3,2}(z_1)$ per remote cubic $q_c = \sigma(c B(y) + \sqrt{1 - c^2} W)$ has an **identically zero** $O(c^2)$ linear gradient because $\mathbb{E}_y[\lvert B(y)\rvert^2 - 1] = 0$. Its optimal shift is $\Delta \nu_5 = O(c^4)$, which changes the saddle value by $O(c^8) = O(D(q_c)^2)$ and therefore contributes **$0$** to the $c \to 0^+$ sharing constant.
- **Theorem 1 (4-channel slice-Gram decomposition, antisymmetric involution inequality $C_{--} \succeq 0$, and three sharp dimension-free chaos bounds):** In the exact contraction algebra of `Grothe/LowerAnalytic/GramTensor.lean` (`ctN, ctH, ctB, ctW, ctC`) and `Grothe/LowerAnalytic/GramBudget.lean` (`u_2, u_4, v_2, v_4, \chi`), the 4-tensor $C_{ij;kl} = \sum_a t_{iak}\overline{t_{laj}}$ decomposes orthogonally under the commuting pair-swap involutions $J_1, J_2$ into four channels satisfying $\|C_{++}\|^2 + \|C_{--}\|^2 + \|C_{+-}\|^2 + \|C_{-+}\|^2 = n$, where the complementary antisymmetric channel satisfies
  $$
  4\,\|C_{--}\|_{\mathrm{HS}}^2 \;=\; n + b - (3y - z) \;\ge\; 0.
  $$
  Combining $4\|C_{--}\|_{\mathrm{HS}}^2 \ge 0$ with $b \le n$, $y \le z$, and $\|N - H^\top\|_{\mathrm{HS}}^2 = n + h - 2z \ge 0$ proves **three sharp universal inequalities** valid in every dimension $d \ge 1$ for every unit $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$, all attained with equality at $B(y) = e_{2,1}(y_1)$:
  $$
  \|P_{2,2}(|B|^2)\|_2^2 \;\le\; \frac{25}{9}\,\|P_{1,1}(|B|^2)\|_2^2,
  \qquad
  \|P_{3,1}(B^2)\|_2^2 \;\le\; \frac{8}{3}\,\|P_{1,1}(|B|^2)\|_2^2,
  \qquad
  \|P_{1,1}(|B|^2)\|_2^2 \;\ge\; \frac{3}{14}\,\chi(B).
  $$
  Explicit rational 5-tuples $(\frac{9}{16}, 1, \frac{9}{16}, \frac{3}{4}, \frac{3}{4})$ (giving $u_4/u_2 = 14/5 > 25/9$) and $(\frac{1}{4}, 1, \frac{1}{4}, \frac{1}{2}, \frac{1}{2})$ (giving $v_4/u_2 = 3 > 8/3$) satisfy every inequality of the 5-scalar `Gram.lean` cone (`b <= n`, `y <= z`, `z^2 <= n h`, `n + b + 3y - z >= 0`, `(3y - z)^2 <= h(n + b + 3y - z)`), proving that $C_{--} \succeq 0$ is strictly stronger than the previously formalised 5-scalar cone.
- **Theorem 2(a) & Theorem 3 (Retained-defender dual rows and exact all-dimension collapse onto $e_{2,1}$):** Retaining the two coordinate-free cubic $h$-defender modes
  $$
  D_{3,h}^{\mathrm{univ}}(z_1, q) \;=\; \xi_{1,1}\,z_1 P_{1,1}(|q|^2) + \xi_{2,0}\,\bar{z}_1 P_{2,0}(q^2) \;\in\; \mathcal{H}_{2,1}(\mathbb{C}^n) \ominus \mathbb{C}\,e_{2,1}(z_1)
  $$
  inside $-\varepsilon_1 \|P_{2,1} h\|_2^2$ is valid in every dimension $n \ge 2$ by weak minimax duality ($\sup_{f,g}\inf_\xi \le \inf_\xi \sup_{f,g}$). Along the diffuse-spike family $q_c = \sigma(c B(y) + \sqrt{1 - c^2} W)$ for **any** dimension $d \ge 1$ and **any** unit $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$, the Bargmann generating function gives an exact $O(c^4)$ minimax saddle value over the entire infinite-dimensional complex Hilbert space of all remote quintic shells ($\mathcal{H}_{2,2} \oplus \mathcal{H}_{1,1} \oplus \mathcal{H}_{3,1} \oplus \mathcal{H}_{2,0} \oplus \mathcal{H}_{0,2}$, including imaginary parts and orthogonal chaos complements):
  $$
  \lim_{c \to 0^+} \frac{\operatorname{gain}_{\mathrm{ret}}(q_c)}{D(q_c)}
  \;=\; \frac{C_{22} u_4(B) + C_{11}^{\mathrm{ret}} u_2(B) + C_{31} v_4(B) + C_{20}^{\mathrm{ret}} v_2(B)}{\kappa_D(\sigma)\,\chi(B)}.
  $$
  Furthermore, an exact 4-term sum-of-squares polynomial identity expresses $N_{\mathrm{tot}}\chi(B) - 42(C_{22} u_4 + C_{11}^{\mathrm{ret}} u_2 + C_{31} v_4 + C_{20}^{\mathrm{ret}} v_2)$ as a linear combination of $4\|C_{--}\|^2$, $n - b$, $z - y$, and $\|N - H^\top\|^2$ with explicit multipliers $\lambda_1, \lambda_2, \lambda_3, \lambda_4$. Whenever $\lambda_1, \dots, \lambda_4 \ge 0$, **the supremum over all dimensions $d \ge 1$ and all unit $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$ equals the one-variable $e_{2,1}$ value $N_{\mathrm{tot}}/(42 \kappa_D)$ identically.**
- **Theorem 4 (Zero-`erf` Radon shifted-polar intervals across `gC`, `g83`, `g84`, `gA`):** A full-line Radon / shifted-polar transformation $(t, \varphi) \in (-\infty, \infty) \times [0, \pi/2]$ with $w = \tan(\varphi/2) \in [0, 1]$ eliminates `erf`/`erfc` and trigonometric calls completely. Across all 9 rationalised Stage 0 benchmark rows, `verify.py` certifies $\kappa_D > 0$, all 14 real and imaginary complex concavity margins $> +1.28$, and $\lambda_1, \dots, \lambda_4 > 0$, proving across **all dimensions $d \ge 1$**:
  - **`gC` ($t = 0.80$):** $\sup_{d, B} \in [-0.17990, -0.13827] < 0$ (strictly negative sharing constant across all dimensions, vs plain $[+0.1176, +0.1474]$);
  - **`g83` ($t = 0.80, 0.85$):** $\sup_{d, B} \in [+0.08385, +0.14477]$ and $[+0.11249, +0.17383]$, both strictly $< 7/20 = 0.35$ (vs plain $> 0.531$ and $> 0.764$);
  - **`g84` ($t = 0.70, 0.80, 0.84, 0.85$):** $\sup_{d, B} < 0.15596, 0.27983, 0.31813, 0.32834$, **every row strictly $< 7/20 = 0.35$ and $\theta < 0$ across all dimensions $d \ge 1$** (overturning plain $> 0.451, > 0.680$, and plain $> 1.034, > 1.183$ where $\theta > 0$ on $0.84, 0.85$);
  - **`gA` ($t = 0.80, 0.85$):** at $t = 0.80$, **$\sup_{d, B} \in [+0.33474, +0.34506] < 7/20 = 0.35$** across all dimensions (overturning both plain $[+1.0147, +1.0399] > 1$ and the 5-scalar `Gram.lean` cone without $C_{--} \succeq 0$, which satisfies $[+0.3716, +0.3828] > 7/20$!); at $t = 0.85$, $\sup_{d, B} \in [+0.44926, +0.68411] < 7/10 < 1$ ($\theta < 0$ across all dimensions, overturning plain $> 1.449 > 1$).

**Explicit scope qualification.** This package proves the dimension-free chaos inequalities of Theorem 1 for every $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$, the retained-defender dual row inequality of Theorem 2(a) for every unimodular pair in every dimension $n \ge 2$, and certifies the exact $c \to 0^+$ diffuse-spike minimax sharing constant $\sup_{d \ge 1, \|B\|_2 = 1} \lim_{c \to 0^+} \operatorname{gain}_{\mathrm{ret}}(q_c)/D(q_c)$ at the 9 denominator-$10^{10}$ rationalised Stage 0 band rows. It does **not** by itself prove $K_G^{\mathbb{C}} > 1.403$: finite-amplitude multi-spike / arbitrary-sharing assembly (`H8`), finite-amplitude A/B secant margins (`H5`), per-cell first-chaos content bounds (`H6`–`H7`), and continuous small-$t$ `E3` covers (`H2`–`H4`) remain open.

---

## 1. Theorem 1: 4-Channel Slice-Gram Decomposition, $C_{--} \succeq 0$, and Sharp Universal Chaos Bounds

Let $d \ge 1$ and let $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$ be written in the orthonormal complex Wick basis (`Grothe/LowerAnalytic/GramBudget.lean`) with symmetric coefficient 3-tensor $t_{ijk} = t_{jik} \in \mathbb{C}$ ($1 \le i, j, k \le d$):
$$
B(y) \;=\; 2\sqrt{2}\sum_{i, j, k = 1}^d t_{ijk}\bigl(y_i y_j \bar{y}_k - (\delta_{ik} y_j + \delta_{jk} y_i)\bigr),
\qquad
\|B\|_2^2 \;=\; 16 \sum_{i, j, k = 1}^d |t_{ijk}|^2.
$$
Following `Grothe/LowerAnalytic/GramTensor.lean` verbatim, define the matrices $N, H, B_{\mathrm{mat}} \in \mathbb{C}^{d \times d}$ (`ctN, ctH, ctB`) and 4-tensors $W, C \in \mathbb{C}^{d^4}$ (`ctW, ctC`):
$$
N_{ab} = \sum_{i, j} t_{iaj}\overline{t_{ibj}}, \qquad
H_{ab} = \sum_{i, j} t_{ija}\overline{t_{ijb}}, \qquad
(B_{\mathrm{mat}})_{ab} = \sum_{i, j} t_{iaj} t_{jbi},
$$
$$
W_{ij;kl} = \sum_a t_{ija} t_{akl}, \qquad
C_{ij;kl} = \sum_a t_{iak}\overline{t_{laj}},
$$
together with the five real fourth-moment contraction invariants $(n, h, b, y, z)$ (`gramN, gramH, gramB, gramY, gramZ`) and $T = \operatorname{Re}\langle W^{(23)}, W \rangle$ (`gramT0`):
$$
n = \|N\|_{\mathrm{HS}}^2, \quad
h = \|H\|_{\mathrm{HS}}^2, \quad
b = \|B_{\mathrm{mat}}\|_{\mathrm{HS}}^2, \quad
z = \operatorname{Re}\sum_{a, b} N_{ab} H_{ab} = \operatorname{Re}\operatorname{Tr}(N H^\top), \quad
y = \frac{z + 2T}{3} \ge 0.
$$
Note that $N$ and $H$ are Hermitian positive semidefinite, so $\overline{H_{ab}} = H_{ba} = (H^\top)_{ab}$, whence
$$
\|N - H^\top\|_{\mathrm{HS}}^2 \;=\; \|N\|_{\mathrm{HS}}^2 + \|H^\top\|_{\mathrm{HS}}^2 - 2\operatorname{Re}\sum_{a,b} N_{ab}\overline{(H^\top)_{ab}} \;=\; n + h - 2z \;\ge\; 0.
$$
By `GramBudget.lean` (`u2_eq`, `u4_eq`, `v2_eq`, `v4_eq`, `excess_eq`) for unit $\|B\|_2 = 1$ ($\sum |t_{ijk}|^2 = 1/16$):
$$
\begin{aligned}
u_2(B) &:= \|P_{1,1}(|B|^2)\|_2^2 = 16 n + 4 h + 16 z, &
v_2(B) &:= \|P_{2,0}(B^2)\|_2^2 = 32 b, \\
u_4(B) &:= \|P_{2,2}(|B|^2)\|_2^2 = 16 n + 4 h + 16 b + 96 y - 32 z, &
v_4(B) &:= \|P_{3,1}(B^2)\|_2^2 = 96 y,
\end{aligned}
$$
and $\chi(B) := \mathbb{E}|B|^4 - 2 = u_2(B) + u_4(B) + \frac{1}{2}v_2(B) = 32 n + 8 h + 32 b + 96 y$. (Here $P_{p,q}(F)$ denotes the $L^2(\gamma_d)$-orthogonal projection onto $\mathcal{H}_{p,q}(\mathbb{C}^d)$; note $\operatorname{Re}/\operatorname{Im}$ total variance `specV2, specV4` in `GramTensor.lean` equals $\|P_{2,0}(B^2)\|_2^2$ and $\|P_{3,1}(B^2)\|_2^2$ because $B^2$ is holomorphic in $\mathcal{H}_{p,q}$ with $p - q = 2$, so $\|P_{2,0}(B^2)\|_2^2 = \mathbb{E}|(B^2)_2|^2 = 32 b$ and $\|P_{3,1}(B^2)\|_2^2 = 96 y$.)

### Theorem 1 (4-Channel Slice-Gram Decomposition and Sharp Chaos Inequalities)

Let $\langle X, Y \rangle = \sum_{i,j,k,l} X_{ij;kl}\overline{Y_{ij;kl}}$ be the Hermitian inner product on $\mathbb{C}^{d^4}$, and let $J_1, J_2 : \mathbb{C}^{d^4} \to \mathbb{C}^{d^4}$ be the commuting unitary self-adjoint pair-swap involutions
$$
(J_1 X)_{ij;kl} := X_{ji;kl}, \qquad (J_2 X)_{ij;kl} := X_{ij;lk}.
$$
Define the four mutually orthogonal projections $P_{\sigma_1, \sigma_2} := \frac{1}{4}(I + \sigma_1 J_1)(I + \sigma_2 J_2)$ for $\sigma_1, \sigma_2 \in \{+, -\}$ and set $C_{\sigma_1 \sigma_2} := P_{\sigma_1, \sigma_2} C$.

**(a) Exact 4-channel identities and antisymmetric positivity.** For every $d \ge 1$ and every symmetric tensor $t_{ijk} = t_{jik}$:
$$
4\,\|C_{++}\|_{\mathrm{HS}}^2 = n + b + (3y - z) \ge 0, \qquad
4\,\|C_{--}\|_{\mathrm{HS}}^2 = n + b - (3y - z) \ge 0,
$$
$$
4\,\|C_{+-}\|_{\mathrm{HS}}^2 = 4\,\|C_{-+}\|_{\mathrm{HS}}^2 = n - b \ge 0, \qquad
\|C_{++}\|_{\mathrm{HS}}^2 + \|C_{--}\|_{\mathrm{HS}}^2 + \|C_{+-}\|_{\mathrm{HS}}^2 + \|C_{-+}\|_{\mathrm{HS}}^2 = n.
$$

**(b) Three sharp dimension-free spectral chaos bounds.** For every $d \ge 1$ and every $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$:
1. $25\,u_2(B) - 9\,u_4(B) \;=\; 96\,\|C_{--}\|_{\mathrm{HS}}^2 + 168(n - b) + 792(z - y) + 64\,\|N - H^\top\|_{\mathrm{HS}}^2 \;\ge\; 0$, hence $\|P_{2,2}(|B|^2)\|_2^2 \le \frac{25}{9}\|P_{1,1}(|B|^2)\|_2^2$.
2. $8\,u_2(B) - 3\,v_4(B) \;=\; 192\,\|C_{--}\|_{\mathrm{HS}}^2 + 48(n - b) + 144(z - y) + 32\,\|N - H^\top\|_{\mathrm{HS}}^2 \;\ge\; 0$, hence $\|P_{3,1}(B^2)\|_2^2 \le \frac{8}{3}\|P_{1,1}(|B|^2)\|_2^2$.
3. $14\,u_2(B) - 3\,\chi(B) \;=\; 96(n - b) + 288(z - y) + 32\,\|N - H^\top\|_{\mathrm{HS}}^2 \;\ge\; 0$, hence $\|P_{1,1}(|B|^2)\|_2^2 \ge \frac{3}{14}\chi(B)$ (when $\|B\|_2 = 1$; homogeneously $\|P_{1,1}(|B|^2)\|_2^2 \ge \frac{3}{14}(\mathbb{E}|B|^4 - 2\|B\|_2^4)$).

All three inequalities hold with equality at $B(y) = e_{2,1}(y_1) = \frac{1}{\sqrt{2}}y_1(|y_1|^2 - 2)$, where $(n, h, b, y, z) = \frac{1}{256}(1, 1, 1, 1, 1)$ (or under unit-tensor normalisation $\sum |t|^2 = 1$, $(1, 1, 1, 1, 1)$ gives $u_2 = 36, u_4 = 100, v_2 = 32, v_4 = 96, \chi = 168$, i.e. $\frac{1}{4}(36, 100, 32, 96, 168) = (9, 25, 8, 24, 42)$).

**(c) Strict separation from the 5-scalar `Gram.lean` cone.** Without $4\|C_{--}\|_{\mathrm{HS}}^2 = n + b - (3y - z) \ge 0$, the 5-scalar cone $\mathcal{K}_{\mathrm{old}} = \{n, h, b, y, z \ge 0 : b \le n,\, y \le z,\, z^2 \le n h,\, n + b + 3y - z \ge 0,\, (3y - z)^2 \le h(n + b + 3y - z)\}$ contains:
- $(n, h, b, y, z) = \bigl(\frac{9}{16}, 1, \frac{9}{16}, \frac{3}{4}, \frac{3}{4}\bigr)$, where $3y - z = \frac{3}{2}$, $n + b + 3y - z = \frac{21}{8} \ge \frac{9}{4} = (3y - z)^2/h$, $u_2 = 25, u_4 = 70, v_2 = 18, v_4 = 72, \chi = 116$, giving $u_4 / u_2 = \frac{14}{5} = 2.80 > \frac{25}{9}$ while $n + b - (3y - z) = -\frac{3}{8} < 0$;
- $(n, h, b, y, z) = \bigl(\frac{1}{4}, 1, \frac{1}{4}, \frac{1}{2}, \frac{1}{2}\bigr)$, where $3y - z = 1$, $n + b + 3y - z = \frac{3}{2} \ge 1 = (3y - z)^2/h$, $u_2 = 16, v_4 = 48$, giving $v_4 / u_2 = 3 > \frac{8}{3}$ while $n + b - (3y - z) = -\frac{1}{2} < 0$.

**Proof of Theorem 1.**
For part (a), $J_1^2 = J_2^2 = I$, $J_1^* = J_1$, $J_2^* = J_2$, and $J_1 J_2 = J_2 J_1$, so $P_{\sigma_1, \sigma_2}^* = P_{\sigma_1, \sigma_2}$, $P_{\sigma_1, \sigma_2}^2 = P_{\sigma_1, \sigma_2}$, and $\sum_{\sigma_1, \sigma_2} P_{\sigma_1, \sigma_2} = I$. Hence for every $(\sigma_1, \sigma_2) \in \{+, -\}^2$,
$$
4\,\|C_{\sigma_1 \sigma_2}\|_{\mathrm{HS}}^2 \;=\; 4\,\langle P_{\sigma_1, \sigma_2} C, C \rangle \;=\; \langle C, C \rangle + \sigma_1 \langle J_1 C, C \rangle + \sigma_2 \langle J_2 C, C \rangle + \sigma_1 \sigma_2 \langle J_1 J_2 C, C \rangle.
$$
Compute each of the four inner products directly from $t_{ijk} = t_{jik}$ (matching `hipC_C`, `hipC1234_C`, `hipC12_C`, `hipC34_C` in `Grothe/LowerAnalytic/GramTensor.lean`):
1. $\langle C, C \rangle = \sum_{i,j,k,l} \bigl(\sum_a t_{iak}\overline{t_{laj}}\bigr)\bigl(\sum_b \overline{t_{ibk}} t_{lbj}\bigr) = \sum_{a,b} \bigl(\sum_{i,k} t_{iak}\overline{t_{ibk}}\bigr)\bigl(\sum_{l,j} \overline{t_{laj}} t_{lbj}\bigr) = \sum_{a,b} |N_{ab}|^2 = n$.
2. $\langle J_1 J_2 C, C \rangle = \sum_{i,j,k,l} \bigl(\sum_a t_{jak}\overline{t_{kai}}\bigr)\bigl(\sum_b \overline{t_{ibk}} t_{lbj}\bigr) = \sum_{a,b}\bigl(\sum_{j,l} t_{jal} t_{lbj}\bigr)\bigl(\sum_{k,i} \overline{t_{kai} t_{ibk}}\bigr) = \sum_{a,b} |(B_{\mathrm{mat}})_{ab}|^2 = b$.
3. $\langle J_1 C, C \rangle = \sum_{i,j,k,l}\bigl(\sum_a t_{jak}\overline{t_{lai}}\bigr)\bigl(\sum_b \overline{t_{ibk}} t_{lbj}\bigr) = \sum_{a,b,k,l}\bigl(\sum_j t_{jak} t_{lbj}\bigr)\bigl(\sum_i \overline{t_{lai} t_{ibk}}\bigr) = \sum_{a,b,k,l} W_{lb;ak}\overline{W_{la;bk}} = \langle W, W^{(23)} \rangle = T$, where $t_{jak} = t_{ajk}$ and $t_{ibk} = t_{bik}$ were used.
4. $\langle J_2 C, C \rangle = \sum_{i,j,k,l}\bigl(\sum_a t_{ial}\overline{t_{kaj}}\bigr)\bigl(\sum_b \overline{t_{ibk}} t_{lbj}\bigr) = \sum_{a,b,i,j}\bigl(\sum_l t_{ial} t_{lbj}\bigr)\bigl(\sum_k \overline{t_{kaj} t_{ibk}}\bigr) = \sum_{a,b,i,j} W_{ia;bj}\overline{W_{ib;aj}} = \langle W, W^{(23)} \rangle = T$.

Since $2T = 3y - z$ by definition of $y = (z + 2T)/3$, substituting into $4\|C_{\sigma_1 \sigma_2}\|_{\mathrm{HS}}^2$ yields all four identities of part (a) (and $b \le n$ follows immediately from $4\|C_{+-}\|_{\mathrm{HS}}^2 = n - b \ge 0$).

Also recall $z - y \ge 0$: letting $Y_{ij;k;l} = \frac{1}{3}(W_{ij;kl} + W_{ik;jl} + W_{jk;il})$ be the symmetrisation of $W$ in its first three indices, $t_{ijk} = t_{jik}$ gives $\langle Y, W \rangle = \frac{1}{3}(z + T + T) = y = \|Y\|_{\mathrm{HS}}^2$, hence $0 \le \|W - Y\|_{\mathrm{HS}}^2 = z - y$.

For part (b), expand the right-hand sides directly in $(n, h, b, y, z)$:
- $24(n + b - 3y + z) + 168(n - b) + 792(z - y) + 64(n + h - 2z) = (24 + 168 + 64)n + 64 h + (24 - 168)b + (-72 - 792)y + (24 + 792 - 128)z = 256 n + 64 h - 144 b - 864 y + 688 z = 25(16 n + 4 h + 16 z) - 9(16 n + 4 h + 16 b + 96 y - 32 z) = 25 u_2 - 9 u_4$.
- $48(n + b - 3y + z) + 48(n - b) + 144(z - y) + 32(n + h - 2z) = 128 n + 32 h - 288 y + 128 z = 8(16 n + 4 h + 16 z) - 3(96 y) = 8 u_2 - 3 v_4$.
- $96(n - b) + 288(z - y) + 32(n + h - 2z) = 128 n + 32 h - 96 b - 288 y + 224 z = 14(16 n + 4 h + 16 z) - 3(32 n + 8 h + 32 b + 96 y) = 14 u_2 - 3 \chi$.

At $B(y) = e_{2,1}(y_1)$, only $t_{111} \ne 0$, so $N = H = B_{\mathrm{mat}}$ is rank-$1$ real diagonal, giving $n = h = b = y = z$ and $4\|C_{--}\|^2 = 1 + 1 - 2 = 0$, $n - b = 0$, $z - y = 0$, $\|N - H^\top\|^2 = 0$, so all three inequalities hold with equality. Part (c) is immediate arithmetic verified in `verify.py`. $\square$

---

## 2. Theorem 2: Retained-Defender Dual Row Inequality Across All $n \ge 2$ and `STAGE0` §9 Idea 1

Let $n \ge 2$, let $(f, g)$ be any measurable unimodular pair on $(\mathbb{C}^n, \gamma_n)$ ($|f| = |g| = 1$ a.e.), and set $h = \frac{f + g}{2}$, $k = \frac{f - g}{2}$, so $\|h(z)\|^2 + \|k(z)\|^2 = 1$ pointwise and for $T_5 = P_{1,0} - \varepsilon_1 P_{2,1} + \eta P_{3,2}$ ($0 < \eta < \varepsilon_1 < 1$):
$$
V(f, g) := \operatorname{Re}\langle f, T_5 g \rangle \;=\; \|P_{1,0} h\|_2^2 - \|P_{1,0} k\|_2^2 - \varepsilon_1\bigl(\|P_{2,1} h\|_2^2 - \|P_{2,1} k\|_2^2\bigr) + \eta\bigl(\|P_{3,2} h\|_2^2 - \|P_{3,2} k\|_2^2\bigr).
$$
Rotate coordinates so $\langle z_j, h \rangle = 0$ for $j \ge 2$ and $\langle z_1, h \rangle = t \ge 0$ (`\|P_{1,0} h\|_2 = t`). Decompose $P_{2,1} k = \nu_3 e_{2,1}(z_1) + q_{\mathrm{vis}\perp} + q$, where $q \in \mathcal{H}_{2,1}(\mathbb{C}^{n-1})$ is the purely remote cubic component of $k$ in the coordinates $y = (z_2, \dots, z_n)$ (`Grothe` graded notation).

In the standard KSIDE §6 row (`STATUS.md` 4.1), $-\varepsilon_1 \|P_{2,1} h\|_2^2$ is bounded above by $-\varepsilon_1 |\langle e_{2,1}(z_1), h \rangle|^2 \le 2\beta \operatorname{Re}\langle e_{2,1}(z_1), h \rangle + \beta^2/\varepsilon_1$, discarding the entire orthogonal complement $\mathcal{H}_{2,1}(\mathbb{C}^n) \ominus \mathbb{C} e_{2,1}(z_1)$. However, the two subspaces
$$
\mathcal{V}_{1,1} := z_1 \otimes \mathcal{H}_{1,1}(\mathbb{C}^{n-1}), \qquad
\mathcal{V}_{2,0} := \bar{z}_1 \otimes \mathcal{H}_{2,0}(\mathbb{C}^{n-1})
$$
are **mutually orthogonal subspaces of $\mathcal{H}_{2,1}(\mathbb{C}^n) \ominus \mathbb{C} e_{2,1}(z_1)$** (in $\mathbb{C} \oplus \mathbb{C}^{n-1}$, $z_1$ has bidegree $(1, 0)$ so $z_1 \mathcal{H}_{1,1}(\mathbb{C}^{n-1}) \subset \mathcal{H}_{2,1}(\mathbb{C}^n)$, and $\bar{z}_1$ has bidegree $(0, 1)$ so $\bar{z}_1 \mathcal{H}_{2,0}(\mathbb{C}^{n-1}) \subset \mathcal{H}_{2,1}(\mathbb{C}^n)$; they are orthogonal to $e_{2,1}(z_1)$ and to each other by $(z_1, y)$-bidegree).

### Theorem 2 (Retained-Defender Gate-Free Dual Row & Vanishing of Scalar $\nu_5$ Re-Optimisation)

**(a) Retained-defender dual row inequality across all $n \ge 2$.** For any real row parameters $(\ell, \beta, b_A, b_B, \nu_5)$ and any pair $(f, g)$ on $\mathbb{C}^n$ ($n \ge 2$) with visible linear norm $t = \|P_{1,0} h\|_2$ and remote cubic $q = P_{2,1}^{\mathrm{rem}} k \in \mathcal{H}_{2,1}(\mathbb{C}^{n-1})$, let $U_2(q) := P_{1,1}(|q|^2) \in \mathcal{H}_{1,1}(\mathbb{C}^{n-1})$ and $V_2(q) := P_{2,0}(q^2) \in \mathcal{H}_{2,0}(\mathbb{C}^{n-1})$. Then for **every** choice of multipliers $\xi_1 \in \mathcal{H}_{1,1}(\mathbb{C}^{n-1})$ and $\xi_2 \in \mathcal{H}_{2,0}(\mathbb{C}^{n-1})$ (in particular $\xi_1 = \alpha_1 U_2(q)$ and $\xi_2 = \alpha_2 V_2(q)$ with $\alpha_1, \alpha_2 \in \mathbb{R}$):
$$
\begin{aligned}
-\varepsilon_1 \|P_{2,1} h\|_2^2
&\;\le\; -\varepsilon_1\Bigl(|\langle e_{2,1}(z_1), h \rangle|^2 + \|P_{\mathcal{V}_{1,1}} h\|_2^2 + \|P_{\mathcal{V}_{2,0}} h\|_2^2\Bigr) \\
&\;=\; \inf_{\beta_0 \in \mathbb{R},\, \xi_1 \in \mathcal{H}_{1,1},\, \xi_2 \in \mathcal{H}_{2,0}}
\Bigl\{ 2\operatorname{Re}\bigl\langle \beta_0 e_{2,1}(z_1) + z_1 \xi_1(y) + \bar{z}_1 \xi_2(y),\, h \bigr\rangle
+ \frac{\beta_0^2 + \|\xi_1\|_2^2 + \|\xi_2\|_2^2}{\varepsilon_1} \Bigr\}.
\end{aligned}
$$
Consequently, in the gate-free row bound (`STATUS.md` 4.1) $V(f, g) \le t^2 - 2\ell t + \frac{2\beta^2}{\varepsilon_1} + \frac{(b_A^2 + b_B^2)\|q\|_2^2}{\eta} + \Lambda_5^{\mathrm{ret}}(q)$ (dropping $-\|P_{1,0} k\|_2^2 - \eta\|P_{3,2} k\|_2^2 \le 0$ and pairing $\varepsilon_1\|P_{2,1} k\|_2^2$ and $\eta\|P_{3,2} h\|_2^2$ by Fenchel–Young exactly as in KSIDE §6), the adversarial row supremum $\Lambda_5^{\mathrm{ret}}(q)$ is bounded above by the minimax value in which the defender chooses $(\xi_1, \xi_2) \in \mathcal{H}_{1,1}(\mathbb{C}^{n-1}) \oplus \mathcal{H}_{2,0}(\mathbb{C}^{n-1})$ against the adversary's $(f, g)$ at cost $+\frac{1}{\varepsilon_1}(\|\xi_1\|_2^2 + \|\xi_2\|_2^2)$.

**(b) Resolution of `STAGE0` §9 Idea 1.** Let $q_c = \sigma(c B(y) + \sqrt{1 - c^2} W)$ with $\|B\|_2 = 1$ in $\mathcal{H}_{2,1}(\mathbb{C}^d)$ and $W \sim \mathcal{CN}(0, 1)$ independent of $(z_1, y)$. At the row's Gaussian-optimal scalar quintic parameter $\nu_5^*$ satisfying $\nu_5^*/\eta = \mathbb{E}_{z_1, W}\operatorname{Re}[\overline{e_{3,2}(z_1)}\operatorname{ph}(A_+^0(z_1, \sigma W))]$, re-optimising $\nu_5 \in \mathbb{C}$ as a function of $c$ produces an optimal shift $\Delta \nu_5(c) = O(c^4)$ and changes the row value by $O(c^8) = O(D(q_c)^2)$. Thus
$$
\lim_{c \to 0^+} \frac{\Lambda_5^{\text{re-opt }\nu_5}(q_c) - \Lambda_5^{\text{fixed }\nu_5^*}(q_c)}{D(q_c)} \;=\; 0.
$$

**Proof of Theorem 2.**
Part (a) is immediate from Bessel's inequality $\|P_{2,1} h\|_2^2 \ge |\langle e_{2,1}(z_1), h \rangle|^2 + \|P_{\mathcal{V}_{1,1}} h\|_2^2 + \|P_{\mathcal{V}_{2,0}} h\|_2^2$ on the three mutually orthogonal subspaces $\mathbb{C} e_{2,1}(z_1) \perp \mathcal{V}_{1,1} \perp \mathcal{V}_{2,0}$ of $\mathcal{H}_{2,1}(\mathbb{C}^n)$ together with $\|z_1 \xi_1\|_2^2 = \mathbb{E}|z_1|^2 \|\xi_1\|_2^2 = \|\xi_1\|_2^2$, $\|\bar{z}_1 \xi_2\|_2^2 = \|\xi_2\|_2^2$, and $-\varepsilon_1 \|v\|_2^2 = \inf_\xi \{2\operatorname{Re}\langle \xi, v \rangle + \|\xi\|_2^2/\varepsilon_1\}$ (`-\varepsilon_1 \|v + \xi/\varepsilon_1\|_2^2 \le 0`). Swapping $\sup_{(f,g)} \inf_{(\xi_1, \xi_2)} \le \inf_{(\xi_1, \xi_2)} \sup_{(f,g)}$ holds unconditionally without topological assumptions (weak duality).

For part (b), let $w_c = \sqrt{1 - c^2} W + c B(y)$. We first record the **Bargmann generating-function identity** used throughout §2–§3: for the orthonormal complex Hermite–Laguerre basis $e_{p,q}(w)$ of $L^2(\mathbb{C}, \gamma_1)$, the exponential generating function $\sum_{p,q \ge 0} \frac{u^p v^q}{\sqrt{p! q!}} e_{p,q}(w) = \exp(u w + v \bar{w} - u v)$ (up to phase convention $(-1)^{\min(p,q)}$, which cancels identically on both sides) satisfies, conditional on $B = B(y)$,
$$
\begin{aligned}
\mathbb{E}_W\!\left[\exp\bigl(u(\sqrt{1 - c^2} W + c B) + v(\sqrt{1 - c^2}\bar{W} + c\bar{B}) - u v\bigr)\right]
&=\; \exp\bigl(c u B + c v \bar{B} - u v + (1 - c^2) u v\bigr) \\
&=\; \exp\bigl((c u) B + (c v)\bar{B} - (c u)(c v)\bigr).
\end{aligned}
$$
Comparing coefficients of $u^p v^q$ proves **for every $p, q \ge 0$ and every $c \in [0, 1]$**:
$$
\mathbb{E}_W\!\left[e_{p,q}\bigl(\sqrt{1 - c^2} W + c B\bigr)\right] \;=\; c^{p+q}\,e_{p,q}(B). \tag{2.1}
$$
Now expand the $\mathrm{U}(1)$-invariant radial profile $G_{3,2}(\sigma |w|) := \mathbb{E}_{z_1}\operatorname{Re}[\overline{e_{3,2}(z_1)}(\operatorname{ph}(A_+^0(z_1, \sigma w)) + \operatorname{ph}(A_-^0(z_1, \sigma w)))]/2$ in the radial Laguerre basis $e_{k,k}(w)$ of $L^2(\gamma_1)$: $G_{3,2}(\sigma |w|) = \sum_{k \ge 0} g_{32, k} e_{k,k}(w)$. Applying (2.1) and taking $\mathbb{E}_y$ over $B(y)$ with $\mathbb{E}_y|B(y)|^2 = 1$ and $\mathbb{E}_y|B(y)|^4 = 2 + \chi(B)$ gives
$$
\mathbb{E}_{z_1, y, W}\operatorname{Re}\bigl[\overline{e_{3,2}(z_1)}\operatorname{ph}(A_+^0(z_1, q_c))\bigr]
\;=\; g_{32, 0} + g_{32, 1} c^2 \underbrace{\mathbb{E}_y\bigl[|B(y)|^2 - 1\bigr]}_{=\,0}
+ g_{32, 2} c^4 \underbrace{\mathbb{E}_y\Bigl[\frac{|B(y)|^4 - 4|B(y)|^2 + 2}{2}\Bigr]}_{=\,\chi(B)/2} + O(c^6).
$$
Since $g_{32, 0} = \nu_5^*/\eta$, the linear gradient with respect to $\Delta\nu_5 = \nu_5 - \nu_5^*$ at $(q_c, \nu_5^*)$ is $O(c^4)$ (its $O(c^2)$ coefficient vanishes identically!). Because the scalar $\nu_5$ Hessian at $c = 0$ is strictly negative definite ($-\frac{2}{\eta} + P_{32,32} < 0$), the optimal shift is $\Delta \nu_5(c) = O(c^4)$ and the quadratic gain $\frac{1}{2} M_{\nu_5}^{-1} |\Delta\nu_5(c)|^2 = O(c^8) = O(D(q_c)^2)$. $\square$

---

## 3. Theorem 3: Exact Bargmann–Laguerre Diffuse-Spike Saddle Across All $d \ge 1$ and 4-Term SOS Collapse to $e_{2,1}$

Fix a row $(\ell, \beta, b_A, b_B, \nu_5, \sigma)$ of $T_5 = P_{1,0} - \varepsilon_1 P_{2,1} + \eta P_{3,2}$ with $\sigma > 0$, let $d \ge 1$, let $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$ have $\|B\|_2 = 1$ and $\chi(B) = \mathbb{E}|B|^4 - 2 > 0$, and set $q_c = \sigma(\sqrt{1 - c^2} W + c B(y))$ with $W \sim \mathcal{CN}(0, 1)$ (representing a diffuse bath in $\mathcal{H}_{2,1}(\mathbb{C}^m)$, $m \to \infty$, whose higher Laguerre polynomials have $\mathcal{H}_{3,2}(\mathbb{C}^m)$-projection $O(m^{-1/2}) \to 0$). Write
$$
A_\pm(z_1, q) \;:=\; L(z_1) \pm q\,D(z_1),
\qquad
L(z_1) = z_1\bigl(\ell + \beta(|z_1|^2 - 2)\bigr) + \nu_5 e_{3,2}(z_1),
\qquad
D(z_1) = 1 - b_A(|z_1|^2 - 1) - b_B \frac{z_1^2}{\sqrt{2}}.
$$
At $q_c$, the base phase pair is $f_0 = \operatorname{ph}(A_+(z_1, q_c))$, $g_0 = \operatorname{ph}(A_-(z_1, q_c))$, and the $q$-only deficit is $D(q_c) := B_5(\sigma^2) - \mathbb{E}_{z_1, y, W}\bigl[|A_+(z_1, q_c)| + |A_-(z_1, q_c)|\bigr]$.

### Parity and $\mathrm{U}(1)$-Charge Decoupling of All Remote Sectors at $O(c^4)$

1. **Deficit at $O(c^4)$ and global $\mathrm{U}(1)$ covariance:** Set
   $$
   M(z_1, w) \;:=\; w\bigl(1 - b_A(|z_1|^2 - 1)\bigr) - \bar{w}\,b_B \frac{z_1^2}{\sqrt{2}},
   \qquad
   A_\pm(z_1, w) \;=\; L(z_1) \pm M(z_1, w).
   $$
   Notice that $q(|z_1|^2 - 1)$ has $(z_1, y)$-bidegree $(1, 1) + (2, 1) = (3, 2)$ and $\bar{q}\,z_1^2/\sqrt{2}$ has bidegree $(2, 0) + (1, 2) = (3, 2)$, so both multiplier terms lie in $\mathcal{H}_{3,2}(\mathbb{C} \oplus \mathbb{C}^d)$. Writing $w = |w| e^{i\omega}$ and rotating $z_1 = e^{i\omega} z_1'$ gives
   $$
   L(e^{i\omega} z_1') \pm M(e^{i\omega} z_1', |w| e^{i\omega}) \;=\; e^{i\omega}\Bigl(L(z_1') \pm |w|\,D(z_1')\Bigr), \tag{3.1}
   $$
   so $\Psi(|w|) := \mathbb{E}_{z_1}\bigl[|L(z_1) + M(z_1, w)| + |L(z_1) - M(z_1, w)|\bigr] = \mathbb{E}_{z_1'}\bigl[|L(z_1') + |w| D(z_1')| + |L(z_1') - |w| D(z_1')|\bigr]$ depends **solely on $|w|$**.
   Equivalently, at fixed $z_1 = r e^{i\theta}$, setting $\widetilde{w} := e^{-i\theta} w = \widetilde{w}_x + i \widetilde{w}_y$ gives
   $$
   e^{-i\theta} A_+(r e^{i\theta}, e^{i\theta}\widetilde{w})
   \;=\; \mu(r) + \widetilde{w}\bigl(1 - b_A(r^2 - 1)\bigr) - \overline{\widetilde{w}}\,\frac{b_B}{\sqrt{2}} r^2
   \;=\; \bigl(\mu(r) + \alpha_x(r)\widetilde{w}_x\bigr) + i\,\alpha_y(r)\widetilde{w}_y, \tag{3.2}
   $$
   where $\mu(r) = r(\ell + \beta(r^2 - 2)) + \nu_5 \frac{r(r^4 - 6r^2 + 6)}{2\sqrt{3}}$ and
   $$
   \alpha_x(r) = \sigma\Bigl(1 - b_A(r^2 - 1) - \frac{b_B}{\sqrt{2}} r^2\Bigr), \qquad
   \alpha_y(r) = \sigma\Bigl(1 - b_A(r^2 - 1) + \frac{b_B}{\sqrt{2}} r^2\Bigr).
   $$
   Applying (2.1) to $\Psi(\sigma |w|) = \sum_{k \ge 0} \psi_k e_{k,k}(w)$ with $e_{2,2}(w) = (|w|^4 - 4|w|^2 + 2)/2$ and $\mathbb{E}_y[e_{1,1}(B)] = 0$, $\mathbb{E}_y[e_{2,2}(B)] = \chi(B)/2$ yields
   $$
   D(q_c) \;=\; \kappa_D(\sigma)\,\chi(B)\,c^4 + O(c^6),
   \qquad
   \kappa_D(\sigma) \;:=\; -\frac{1}{4}\int_0^\infty \Psi(\sigma\sqrt{u})\,(u^2 - 4u + 2)\,e^{-u}\,du. \tag{3.3}
   $$

2. **Exact $z_1$-parity elimination of even-$z_1$ quintic sectors and odd-$z_1$ $k$-sectors:**
   By $L(-z_1) = -L(z_1)$ and $M(-z_1, w) = +M(z_1, w)$, for **every** $w \in \mathbb{C}$ we have $A_+(-z_1, w) = -A_-(z_1, w)$. Hence:
   - $\operatorname{ph}(A_+(z_1, w)) + \operatorname{ph}(A_-(z_1, w))$ is **strictly odd in $z_1$** for every $w$, so every $h$-sector with $a_z + b_z$ even (`(2,0)`, `(1,1)`, `(0,2)`, `(0,0)` visible) has **identically zero** inner product with the base pair at all orders in $c$.
   - $\operatorname{ph}(A_+(z_1, w)) - \operatorname{ph}(A_-(z_1, w))$ is **strictly even in $z_1$** for every $w$, while its first-order ($O(c)$) remote sectors are the A/B shells ($\mathcal{H}_{1,0}(\mathbb{C}^d), \mathcal{H}_{0,1}(\mathbb{C}^d)$), onto which $e_{p,q}(B(y))$ has zero projection for $p + q \le 2$ (its leading projection is $p + q = 3$, i.e. $O(c^3)$ in amplitude and $O(c^6)$ in energy), and its odd-$z_1$ cubic sectors (`(1,0)` and `(0,1)` visible on $k$) have **identically zero** gradient by $z_1$-parity and decouple from $h$-sectors in the $c = 0$ Hessian because $|A_+(-z_1, w)|^{-1} - |A_-( -z_1, w)|^{-1} = |A_-(z_1, w)|^{-1} - |A_+(z_1, w)|^{-1}$ integrates to $0$.

3. **Surviving $O(c^2)$-gradient sectors (5 adversary quintic shells + 2 retained cubic $h$-defenders):**
   Every odd-$z_1$ sector in $\mathcal{H}_{3,2}(\mathbb{C} \oplus \mathbb{C}^d) \ominus \mathbb{C} e_{3,2}(z_1)$ or $\mathcal{V}_{1,1} \oplus \mathcal{V}_{2,0}$ has $a_z + b_z \in \{1, 3\}$ and remote bidegree $(a_y, b_y)$ with $a_y + b_y \in \{2, 4\}$:
   - **Charge $0$ in $w$ ($a_z - b_z = +1$, $a_y = b_y$):**
     - Index $0$ (`p10`, adversary, cost $1/\eta$): $e_{1,0}(z_1) \otimes \mathcal{H}_{2,2}(\mathbb{C}^d)$, excited along $P_{2,2}(|B|^2)$ (norm $\sqrt{u_4(B)}$);
     - Index $1$ (`p21`, adversary, cost $1/\eta$): $e_{2,1}(z_1) \otimes \mathcal{H}_{1,1}(\mathbb{C}^d)$, excited along $P_{1,1}(|B|^2)$ (norm $\sqrt{u_2(B)}$);
     - Index $2$ (`dh10_11`, defender, cost $1/\varepsilon_1$): $e_{1,0}(z_1) \otimes \mathcal{H}_{1,1}(\mathbb{C}^d)$, paired with the same real polynomial $P_{1,1}(|B|^2)$ (norm $\sqrt{u_2(B)}$).
   - **Charge $\pm 2$ in $w$ ($a_z - b_z \in \{-1, +3\}$, $a_y - b_y = \pm 2$):**
     - Index $3$ (`p01`, adversary, cost $1/\eta$, $w$-charge $+2$): $e_{0,1}(z_1) \otimes \mathcal{H}_{3,1}(\mathbb{C}^d)$, excited along $P_{3,1}(B^2)$ (norm $\sqrt{v_4(B)}$);
     - Index $4$ (`p12`, adversary, cost $1/\eta$, $w$-charge $+2$): $e_{1,2}(z_1) \otimes \mathcal{H}_{2,0}(\mathbb{C}^d)$, excited along $P_{2,0}(B^2)$ (norm $\sqrt{v_2(B)}$);
     - Index $5$ (`p30`, adversary, cost $1/\eta$, $w$-charge $-2$): $e_{3,0}(z_1) \otimes \mathcal{H}_{0,2}(\mathbb{C}^d)$, excited along $P_{0,2}(\bar{B}^2) = \overline{P_{2,0}(B^2)}$ (norm $\sqrt{v_2(B)}$);
     - Index $6$ (`dh01_20`, defender, cost $1/\varepsilon_1$, $w$-charge $+2$): $e_{0,1}(z_1) \otimes \mathcal{H}_{2,0}(\mathbb{C}^d)$, paired with $P_{2,0}(B^2)$ (norm $\sqrt{v_2(B)}$).

   Let $E_j(z_1)$ ($j = 0, \dots, 6$) be the visible basis functions above (`(1,0), (2,1), (1,0), (0,1), (1,2), (3,0), (0,1)`) with $w$-charges $\mathrm{ch} = (0, 0, 0, +2, +2, -2, +2)$. Under (3.1), at $w = s e^{i\omega}$ ($s = \sigma\sqrt{u}$), $\mathbb{E}_{z_1}\bigl[\overline{E_j(z_1)}(\operatorname{ph}(A_+(z_1, w)) + \operatorname{ph}(A_-(z_1, w)))\bigr] = e^{i\,\mathrm{ch}_j\,\omega} G_j(s)$ where $G_j(s) = \mathbb{E}_{z_1}\operatorname{Re}\bigl[\overline{E_j(z_1)}(\operatorname{ph}(L + s D) + \operatorname{ph}(L - s D))\bigr]$ is real. Applying (2.1) at $p + q = 2$ (`e_{1,1}(B) = |B|^2 - 1` for $\mathrm{ch}_j = 0$; `e_{2,0}(B) = B^2/\sqrt{2}` for $\mathrm{ch}_j = +2$; `e_{0,2}(B) = \bar{B}^2/\sqrt{2}` for $\mathrm{ch}_j = -2$) gives the exact $O(c^2)$ linear gradient coefficients
   $$
   g_{1, j} \;:=\; \int_0^\infty G_j(\sigma\sqrt{u})\,(u - 1)\,e^{-u}\,du \quad (j \in \{0, 1, 2\};\; g_{1,2} = g_{1,0}),
   $$
   $$
   m_{2, k} \;:=\; \frac{1}{2}\int_0^\infty G_{k+3}(\sigma\sqrt{u})\,u\,e^{-u}\,du \quad (k \in \{0, 1, 2, 3\};\; m_{2,3} = m_{2,0}).
   $$
   Similarly, at $c = 0$ ($q_0 = \sigma W$), define the real symmetric $7 \times 7$ radial-Gaussian matrices $P_{jk}, Q_{jk}$ by
   $$
   P_{jk} := \int_0^\infty \mathbb{E}_{z_1}\operatorname{Re}\!\left[E_j \overline{E_k}\Bigl(\frac{1}{2|A_+^0|} + \frac{1}{2|A_-^0|}\Bigr)\right] e^{-u}\,du,
   \qquad
   Q_{jk} := \int_0^\infty \mathbb{E}_{z_1}\operatorname{Re}\!\left[E_j E_k\Bigl(\frac{\overline{\operatorname{ph}(A_+^0)}^2}{2|A_+^0|} + \frac{\overline{\operatorname{ph}(A_-^0)}^2}{2|A_-^0|}\Bigr)\right] e^{-u}\,du,
   $$
   where $A_\pm^0 = L(z_1) \pm \sigma\sqrt{u}\,D(z_1)$. Note that all distinct pairs of radial factors $|E_j(r)| |E_k(r)|$ lie in the 6-element list $(\eta_0^2, \eta_0 \eta_1, \eta_1^2, \eta_2^2, \eta_0 \eta_2, \eta_1 \eta_2)$ where $\eta_0(r) = r$, $\eta_1(r) = \frac{r(r^2 - 2)}{\sqrt{2}}$, $\eta_2(r) = \frac{r^3}{\sqrt{6}}$; we denote the corresponding 6 distinct entries of $P$ and $Q$ by $(P_{00}, P_{01}, P_{11}, P_{22}, P_{02}, P_{12})$ and $(Q_{00}, Q_{01}, Q_{11}, Q_{22}, Q_{02}, Q_{12})$.

4. **Complete complex Hilbert-space saddle across all 4 blocks (including imaginary parts & orthogonal complements):**
   At $c = 0$, the second variation of $\mathbb{E}[|A_+ + \delta h| + |A_- + \delta h|] = \dots + \frac{1}{2}\mathbb{E}\bigl[\frac{(\operatorname{Im}(\overline{\operatorname{ph} A_+}\delta h))^2}{|A_+|} + \frac{(\operatorname{Im}(\overline{\operatorname{ph} A_-}\delta h))^2}{|A_-|}\bigr]$ has quadratic form $\frac{1}{2}(\langle \delta h, P\,\delta h \rangle - \operatorname{Re}\langle \overline{\delta h}, Q\,\delta h \rangle)$. By rotational invariance of $W \sim \mathcal{CN}(0, 1)$, $P$-couplings vanish unless $\mathrm{ch}_j = \mathrm{ch}_k$ and the remote chaos factors agree, while $Q$-couplings vanish unless $\mathrm{ch}_j + \mathrm{ch}_k = 0$ and the remote chaos factors are complex conjugates! Specifically:
   - **Block 1 ($\mathcal{H}_{2,2}$, `p10`):** $\Phi_{2,2} = P_{2,2}(|B|^2)/\sqrt{u_4}$ is real ($\overline{\Phi_{2,2}} = \Phi_{2,2}$). On $z_0 = x_0 + i y_0 \in \mathbb{C}$ (and on every orthogonal real/imaginary direction in $\mathcal{H}_{2,2} \ominus \mathbb{R}\Phi_{2,2}$, where the gradient vanishes), the quadratic form is $-M_{22,\mathrm{re}} x_0^2 - M_{22,\mathrm{im}} y_0^2$ with
     $$
     M_{22,\mathrm{re}} = \frac{1}{\eta} - \frac{P_{00} - Q_{00}}{2} > 0, \qquad
     M_{22,\mathrm{im}} = \frac{1}{\eta} - \frac{P_{00} + Q_{00}}{2} > 0, \qquad
     C_{22} := \frac{g_{1,0}^2}{4 M_{22,\mathrm{re}}}.
     $$
   - **Block 2 ($\mathcal{H}_{1,1}$, `p21` adversary + `dh10_11` defender):** $\Phi_{1,1} = P_{1,1}(|B|^2)/\sqrt{u_2}$ is real. Setting the defender's imaginary part and $\Phi_{1,1}^\perp$ components to $0$, every imaginary/orthogonal adversary component sees negative-definite curvature $-K_{11,\mathrm{aa,neg}} = -(\frac{1}{\eta} - \frac{P_{11} - Q_{11}}{2}) < 0$ and $-M_{11,\mathrm{im}} = -(\frac{1}{\eta} - \frac{P_{11} + Q_{11}}{2}) < 0$ with zero linear gradient, while on the real $(\mathrm{adv}, \mathrm{def})$ plane along $\Phi_{1,1}$,
     $$
     K_{11,\mathrm{dd}} = \frac{1}{\varepsilon_1} + \frac{P_{00} - Q_{00}}{2} > 0, \quad
     K_{11,\mathrm{ad}} = \frac{P_{01} - Q_{01}}{2}, \quad
     M_{11,\mathrm{schur}} = K_{11,\mathrm{aa,neg}} + \frac{K_{11,\mathrm{ad}}^2}{K_{11,\mathrm{dd}}} > 0,
     $$
     giving plain vs retained saddle weights
     $$
     C_{11}^{\mathrm{plain}} = \frac{g_{1,1}^2}{4 K_{11,\mathrm{aa,neg}}}, \qquad
     C_{11}^{\mathrm{ret}} = \frac{\bigl(g_{1,1} - K_{11,\mathrm{ad}} g_{1,0}/K_{11,\mathrm{dd}}\bigr)^2}{4 M_{11,\mathrm{schur}}} - \frac{g_{1,0}^2}{4 K_{11,\mathrm{dd}}}.
     $$
   - **Block 3 ($\mathcal{H}_{3,1}$, `p01`):** Since $\mathrm{ch}_3 + \mathrm{ch}_3 = +4 \ne 0$ (and $\mathbb{E}[\Phi_{3,1}^2] = 0$ for every $\Phi_{3,1} \in \mathcal{H}_{3,1}$), $Q$ vanishes identically on both real and imaginary parts:
     $$
     M_{31} = \frac{1}{\eta} - \frac{P_{00}}{2} > 0, \qquad C_{31} := \frac{m_{2,0}^2}{4 M_{31}}.
     $$
   - **Block 4 ($\mathcal{H}_{2,0} \oplus \mathcal{H}_{0,2}$, `p12` + `p30` adversary + `dh01_20` defender):** Because $\Phi_{0,2} = \overline{\Phi_{2,0}}$ and $\mathrm{ch}_4 + \mathrm{ch}_5 = (+2) + (-2) = 0$, `p12` and `dh01_20` couple to `p30` via $\Phi_{2,0}\Phi_{0,2} = |\Phi_{2,0}|^2$ in the $Q$-term. Choosing the positive-at-$\infty$ radial basis functions $E_4(r e^{i\theta}) = e^{-i\theta}\eta_1(r)$, $E_5(r e^{i\theta}) = e^{+3i\theta}\eta_2(r)$, and $E_6(r e^{i\theta}) = e^{-i\theta}\eta_0(r)$ (replacing any $E_j$ by $-E_j$ flips $m_{2, j-3}$ and row/column $j$ of $P, Q$ simultaneously, leaving the saddle values $C_{20}^{\mathrm{plain}}$ and $C_{20}^{\mathrm{ret}}$ invariant; note $e^{-i\theta} E_4 = e^{-2i\theta}\eta_1$ and $e^{-i\theta} E_5 = e^{+2i\theta}\eta_2$, so in the shifted-polar coordinates of §4.1 `p12`/`dh01_20` carry $\operatorname{Re}(e^{+i\varphi}\widetilde{W}^2)$ while `p30` carries $\operatorname{Re}(e^{+i\varphi}\overline{\widetilde{W}}^2)$, and in $-\frac{1}{2}(P - Q)$ the `p12`–`p30` off-diagonal entry of $-K_{\mathrm{adv}}$ is $+\frac{1}{2}Q_{12}$ while the `p30`–`dh01_20` entry of $+K_{\mathrm{re}}$ is $-\frac{1}{2}Q_{02}$), put $A_{00} = \frac{1}{\eta} - \frac{1}{2}P_{11}$, $A_{11} = \frac{1}{\eta} - \frac{1}{2}P_{22}$, $A_{01} = \frac{1}{2}Q_{12}$, $D_{22} = \frac{1}{\varepsilon_1} + \frac{1}{2}P_{00}$, $B_0 = \frac{1}{2}P_{01}$, $B_1 = -\frac{1}{2}Q_{02}$:
     - On imaginary parts $(y_4, y_5)$ (and on every orthogonal pair $(\Psi_{2,0}, \overline{\Psi_{2,0}}) \perp \Phi_{2,0}$, with defender $= 0$), $\operatorname{Re}((x_4 + i y_4)(x_5 + i y_5)) = x_4 x_5 - y_4 y_5$ flips $A_{01} \mapsto -A_{01}$, leaving the determinant $\det A = A_{00} A_{11} - A_{01}^2 > 0$ **identical**! Hence $A_{00} > 0, A_{11} > 0, \det A > 0$ certifies strict concavity on all imaginary and orthogonal directions.
     - On the real $(\mathrm{adv}_4, \mathrm{adv}_5, \mathrm{def}_6)$ block, eliminating $\mathrm{def}_6$ via $D_{22} > 0$ gives the $2 \times 2$ Schur-complement matrix $M_{ij} = A_{ij} + B_i B_j / D_{22}$ ($\det M = M_{00} M_{11} - M_{01}^2 > 0$), effective gradient $l_i = m_{2, i+1} - B_i m_{2,0}/D_{22}$ ($i = 0, 1$), and
       $$
       C_{20}^{\mathrm{plain}} = \frac{A_{11} m_{2,1}^2 + A_{00} m_{2,2}^2 - 2 A_{01} m_{2,1} m_{2,2}}{4 \det A},
       \qquad
       C_{20}^{\mathrm{ret}} = \frac{M_{11} l_0^2 + M_{00} l_1^2 - 2 M_{01} l_0 l_1}{4 \det M} - \frac{m_{2,0}^2}{4 D_{22}}.
       $$

### Theorem 3 (Exact 4-Term SOS Collapse of the All-Dimension Supremum onto $e_{2,1}$)

Let $C_{22}, C_{11}^{\mathrm{ret}}, C_{31}, C_{20}^{\mathrm{ret}}$ be the four block constants above, suppose $\kappa_D(\sigma) > 0$ and all 14 concavity margins above are strictly positive, and set
$$
N_{\mathrm{tot}} \;:=\; 25 C_{22} + 9 C_{11}^{\mathrm{ret}} + 24 C_{31} + 8 C_{20}^{\mathrm{ret}},
$$
$$
\begin{aligned}
\lambda_1 &:= 112 C_{22} + 672 C_{31} - 448 C_{20}^{\mathrm{ret}}, &
\lambda_2 &:= -16 C_{22} - 288 C_{11}^{\mathrm{ret}} - 96 C_{31} + 640 C_{20}^{\mathrm{ret}}, \\
\lambda_3 &:= 1296 C_{22} - 864 C_{11}^{\mathrm{ret}} - 288 C_{31} + 576 C_{20}^{\mathrm{ret}}, &
\lambda_4 &:= 32 C_{22} - 96 C_{11}^{\mathrm{ret}} + 192 C_{31} + 64 C_{20}^{\mathrm{ret}}.
\end{aligned}
$$
Then for **every** dimension $d \ge 1$ and **every** unit $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$:
$$
N_{\mathrm{tot}}\,\chi(B) - 42\bigl(C_{22} u_4(B) + C_{11}^{\mathrm{ret}} u_2(B) + C_{31} v_4(B) + C_{20}^{\mathrm{ret}} v_2(B)\bigr)
\;=\; 4\lambda_1 \|C_{--}\|_{\mathrm{HS}}^2 + \lambda_2(n - b) + \lambda_3(z - y) + \lambda_4 \|N - H^\top\|_{\mathrm{HS}}^2.
$$
In particular, whenever $\lambda_1, \lambda_2, \lambda_3, \lambda_4 \ge 0$, every non-Gaussian unit $B \in \mathcal{H}_{2,1}(\mathbb{C}^d)$ ($\chi(B) > 0$) satisfies
$$
\lim_{c \to 0^+} \frac{\operatorname{gain}_{\mathrm{ret}}(q_c)}{D(q_c)}
\;\le\; \frac{N_{\mathrm{tot}}}{42\,\kappa_D(\sigma)},
$$
with equality at $B(y) = e_{2,1}(y_1)$ in every dimension $d \ge 1$.

**Proof of Theorem 3.**
Substitute $u_2 = 16n + 4h + 16z$, $u_4 = 16n + 4h + 16b + 96y - 32z$, $v_2 = 32b$, $v_4 = 96y$, $\chi = 32n + 8h + 32b + 96y$, and $4\|C_{--}\|^2 = n + b - 3y + z$ into both sides and compare coefficients of $(n, h, b, y, z)$ for each of $(C_{22}, C_{11}^{\mathrm{ret}}, C_{31}, C_{20}^{\mathrm{ret}})$:
- Coefficient of $C_{22}$: LHS is $25(32n + 8h + 32b + 96y) - 42(16n + 4h + 16b + 96y - 32z) = 128n + 32h + 128b - 1632y + 1344z$; RHS is $112(n + b - 3y + z) - 16(n - b) + 1296(z - y) + 32(n + h - 2z) = 128n + 32h + 128b - 1632y + 1344z$.
- Coefficient of $C_{11}^{\mathrm{ret}}$: LHS is $9(32n + 8h + 32b + 96y) - 42(16n + 4h + 16z) = -384n - 96h + 288b + 864y - 672z$; RHS is $-288(n - b) - 864(z - y) - 96(n + h - 2z) = -384n - 96h + 288b + 864y - 672z$.
- Coefficient of $C_{31}$: LHS is $24(32n + 8h + 32b + 96y) - 42(96y) = 768n + 192h + 768b - 1728y$; RHS is $672(n + b - 3y + z) - 96(n - b) - 288(z - y) + 192(n + h - 2z) = 768n + 192h + 768b - 1728y$.
- Coefficient of $C_{20}^{\mathrm{ret}}$: LHS is $8(32n + 8h + 32b + 96y) - 42(32b) = 256n + 64h - 1088b + 768y$; RHS is $-448(n + b - 3y + z) + 640(n - b) + 576(z - y) + 64(n + h - 2z) = 256n + 64h - 1088b + 768y$.

Since $\|C_{--}\|_{\mathrm{HS}}^2 \ge 0$, $n - b \ge 0$, $z - y \ge 0$, and $\|N - H^\top\|_{\mathrm{HS}}^2 \ge 0$ by Theorem 1, $\lambda_1, \dots, \lambda_4 \ge 0$ implies the right-hand side is $\ge 0$, and equality holds at $e_{2,1}(y_1)$ where all four non-negative invariants vanish and $\chi(e_{2,1}) = 42 > 0$. $\square$

---

## 4. Theorem 4: Zero-`erf` Shifted-Polar Reduction, Iterated `Jet2` Enclosure, Analytic Tails, and Certified Results

### 4.1 Exact Full-Line Radon Shifted-Polar Reduction (Zero `erf`, Zero Trig)

Suppose $\sigma > 0$, $1 + b_A > 0$, and $-b_A > |b_B|/\sqrt{2}$ (verified in exact rational arithmetic on every row by `verify.py`). Then for all $r \ge 0$:
$$
\alpha_x(r) = \sigma\Bigl((1 + b_A) + \bigl(-b_A - \tfrac{b_B}{\sqrt{2}}\bigr)r^2\Bigr) \;\ge\; (1 + b_A)\sigma > 0,
\qquad
\alpha_y(r) = \sigma\Bigl((1 + b_A) + \bigl(-b_A + \tfrac{b_B}{\sqrt{2}}\bigr)r^2\Bigr) \;\ge\; (1 + b_A)\sigma > 0.
$$
By (3.2) and $A_-(z_1, w) = A_+(z_1, -w)$, at fixed $z_1 = r e^{i\theta}$ the rotated Gaussian $\widetilde{W} = e^{-i\theta} W = \widetilde{W}_x + i\widetilde{W}_y$ has standard density $\frac{1}{\pi}e^{-(\widetilde{W}_x^2 + \widetilde{W}_y^2)}\,d\widetilde{W}_x\,d\widetilde{W}_y$, and $Z_+ := (\mu(r) + \alpha_x(r)\widetilde{W}_x) + i\alpha_y(r)\widetilde{W}_y$ spans $\mathbb{R}^2$ smoothly as $(\widetilde{W}_x, \widetilde{W}_y)$ varies over $\mathbb{R}^2$.

Parametrise $Z_+ = t e^{i\varphi}$ by **full lines** $t \in (-\infty, +\infty)$ and $\varphi \in [0, \pi)$: this covers $\mathbb{R}^2 \setminus \{0\}$ bijectively up to measure zero ($t > 0$ gives $\arg Z_+ = \varphi \in [0, \pi)$; $t < 0$ gives $\arg Z_+ = \varphi + \pi \in [\pi, 2\pi)$) with Jacobian $d\widetilde{W}_x\,d\widetilde{W}_y = \frac{|t|}{\alpha_x(r)\alpha_y(r)}\,dt\,d\varphi$. By $\widetilde{W}_y \mapsto -\widetilde{W}_y$ reflection symmetry ($\varphi \mapsto \pi - \varphi$, $t \mapsto -t$), every integrand is invariant between $[0, \pi/2]$ and $[\pi/2, \pi]$, giving factor $2$ on $\varphi \in [0, \pi/2]$:
$$
\frac{1}{\pi}\,d\widetilde{W}_x\,d\widetilde{W}_y \;=\; \frac{2}{\pi\,\alpha_x(r)\alpha_y(r)}\,|t|\,dt\,d\varphi, \qquad \varphi \in [0, \pi/2],\; t \in (-\infty, +\infty).
$$
Write $\widetilde{W}_x = \frac{t\cos\varphi - \mu(r)}{\alpha_x(r)}$ and $\widetilde{W}_y = \frac{t\sin\varphi}{\alpha_y(r)}$. Completing the square in $t$ gives
$$
U(t) \;:=\; \widetilde{W}_x^2 + \widetilde{W}_y^2 \;=\; A t^2 - 2 B t + C_0 \;=\; \bigl(\sqrt{A}\,t - s\bigr)^2 + D_0 \;=\; v^2 + D_0,
$$
where $v = \sqrt{A}\,t - s \in (-\infty, +\infty)$ ($dt = dv/\sqrt{A}$) and
$$
A = \frac{\cos^2\varphi}{\alpha_x^2} + \frac{\sin^2\varphi}{\alpha_y^2} > 0, \qquad
s = \frac{\mu\cos\varphi}{\alpha_x^2 \sqrt{A}}, \qquad
D_0 = \frac{\mu^2 \sin^2\varphi}{\alpha_x^2 \alpha_y^2 A} \ge 0.
$$
Crucially, across $t = 0$, the singularities and sign jumps cancel identically against the Jacobian $|t|$:
1. **For $P, Q$:** $\frac{1}{|Z_+|} \cdot |t|\,dt = \frac{1}{|t|}|t|\,dt = dt = \frac{dv}{\sqrt{A}}$, and $\operatorname{Re}(e^{-2i\arg Z_+}) = \cos(2\varphi)$ for both $t > 0$ and $t < 0$. Using $\int_{-\infty}^\infty e^{-v^2}\,dv = \sqrt{\pi}$ gives exact rational integrands in $(\cos\varphi, \sin\varphi, \sqrt{A})$ times $e^{-D_0}$.
2. **For $\kappa_D$:** $|Z_+| \cdot |t|\,dt = t^2\,dt = \frac{(v + s)^2}{A^{3/2}}\,dv$. Using odd-moment cancellation and $\frac{1}{\sqrt{\pi}}\int_{-\infty}^\infty (1, v^2, v^4, v^6) e^{-v^2}\,dv = (1, \frac{1}{2}, \frac{3}{4}, \frac{15}{8})$, one checks algebraically:
   $$
   \frac{1}{\sqrt{\pi}}\int_{-\infty}^\infty (v^2 + s^2)\bigl((v^2 + D_0)^2 - 4(v^2 + D_0) + 2\bigr) e^{-v^2}\,dv
   \;=\; \Bigl(\frac{(D_0 - \tfrac{1}{2})^2}{2} - \frac{1}{4}\Bigr) + s^2\Bigl(\bigl(D_0 - \tfrac{3}{2}\bigr)^2 - \frac{3}{2}\Bigr).
   $$
3. **For $g_1$:** $\operatorname{Re}(\operatorname{ph}(Z_+))\cdot |t|\,dt = (\operatorname{sgn}(t)\cos\varphi)|t|\,dt = t\cos\varphi\,dt = \frac{(v + s)\cos\varphi}{A}\,dv$, and $\frac{1}{\sqrt{\pi}}\int_{-\infty}^\infty (v + s)(v^2 + D_0 - 1)e^{-v^2}\,dv = s\bigl(D_0 - \frac{1}{2}\bigr)$.
4. **For $m_2$:** $\operatorname{ph}(Z_+) \cdot |t|\,dt = t e^{i\varphi}\,dt$, while $\widetilde{W}_x = a_x v + b_x$ and $\widetilde{W}_y = a_y v + b_y$ ($a_x = \frac{\cos\varphi}{\alpha_x\sqrt{A}}$, $b_x = -\frac{\mu\sin^2\varphi}{\alpha_x\alpha_y^2 A}$, $a_y = \frac{\sin\varphi}{\alpha_y\sqrt{A}}$, $b_y = \frac{s\sin\varphi}{\alpha_y\sqrt{A}}$) are linear in $v$, so $\frac{1}{\sqrt{\pi}}\int_{-\infty}^\infty (v + s)(p_2 v^2 + p_1 v + p_0)e^{-v^2}\,dv = \frac{1}{2}p_1 + s(\frac{1}{2}p_2 + p_0)$.

Finally, the Weierstrass substitution $w = \tan(\varphi/2) \in [0, 1]$ gives $\cos\varphi = \frac{1 - w^2}{1 + w^2}$, $\sin\varphi = \frac{2w}{1 + w^2}$, $d\varphi = \frac{2\,dw}{1 + w^2}$. Together with radial measure $2r e^{-r^2}\,dr$ ($\frac{2}{\pi}\sqrt{\pi}\cdot 2r = \frac{4}{\sqrt{\pi}} r$), every one of the 18 integrals is an integral over $(r, w) \in [0, \infty) \times [0, 1]$ of an algebraic expression times $e^{-(r^2 + D_0)}$, with **zero `erf`, zero `erfc`, and zero trigonometric calls**.

### 4.2 Flipped Iterated 1D Midpoint Rule, Monotone $\cot\varphi$ Tail Box, and $r \ge 5$ Analytic Tails

- **Flipped iterated 1D midpoint enclosure (zero mixed derivatives):** On any rectangle $I_r \times I_w$ subdivided into $K_r \times K_w$ equal subcells of half-widths $h_r = |I_r|/(2 K_r)$ and $h_w = |I_w|/(2 K_w)$ with midpoints $(r_a, w_b)$, for every $C^2$ integrand $F$ whose univariate Taylor second-derivative coefficients $F_{2,r} = \frac{1}{2}\partial_r^2 F$ and $F_{2,w} = \frac{1}{2}\partial_w^2 F$ satisfy $|F_{2,r}| \le M_r$ on $I_r \times I_w$ and $|F_{2,w}(r_a, w)| \le M_w$ for all $w \in I_w$ and $a \in \{1, \dots, K_r\}$:
  $$
  \left|\int_{I_r \times I_w} F(r, w)\,dr\,dw - \frac{|I_r||I_w|}{K_r K_w}\sum_{a=1}^{K_r}\sum_{b=1}^{K_w} F(r_a, w_b)\right|
  \;\le\; |I_r||I_w|\Bigl(\frac{h_r^2}{3}\,M_r + \frac{h_w^2}{3}\,M_w\Bigr).
  $$
  *Proof:* By Taylor's theorem with Lagrange remainder at the midpoint $m$ of $[m - h, m + h]$, $g(m + t) = g(m) + g'(m) t + g_2(\xi_t)\,t^2$ where $g_2(\xi) = \frac{1}{2}g''(\xi)$, so
  $$
  \left|\int_{-h}^{+h} g(m + t)\,dt - 2h\,g(m)\right| \;\le\; \sup_{|\xi - m| \le h} |g_2(\xi)| \int_{-h}^{+h} t^2\,dt \;=\; (2h)\cdot \frac{h^2}{3}\,\sup_{[m-h, m+h]} |g_2|.
  $$
  Applying this first in $r$ on each subinterval of half-width $h_r$ at every $w \in I_w$ and integrating over $w \in I_w$ contributes $|I_r||I_w|\frac{h_r^2}{3} M_r$; applying it next in $w$ on each subinterval of half-width $h_w$ to the average $\frac{1}{K_r}\sum_{a=1}^{K_r} F(r_a, w)$ contributes $|I_r||I_w|\frac{h_w^2}{3} M_w$, with no mixed derivative $\partial_r\partial_w F$ and with $F_{2,w}(r_a, I_w)$ evaluated on 1D intervals $I_w$ at scalar points $r_a$.

- **Monotone $\cot\varphi$ tail enclosure on $[w_{\mathrm{top}}, 1]$:** Writing $\cot\varphi = \frac{1 - w^2}{2w}$ (strictly decreasing on $(0, 1]$), $D_0(r, w) = \frac{\mu(r)^2}{\alpha_x(r)^2 + \alpha_y(r)^2 \cot^2\varphi}$ has a single occurrence of $w$, and since $\cos^2\varphi + \sin^2\varphi = 1$, $A \in [\min(\alpha_x^{-2}, \alpha_y^{-2}), \max(\alpha_x^{-2}, \alpha_y^{-2})]$. Whenever $D_{0,\mathrm{lo}} \ge 3$ (specifically $r_{\mathrm{lo}}^2 + D_{0,\mathrm{lo}} \ge 28$), $(x^2 e^{-x})' = x(2 - x)e^{-x} < 0$ and $(x e^{-x})' = (1 - x)e^{-x} < 0$ on $[3, \infty)$ give $D_0^2 e^{-D_0} \le D_{0,\mathrm{lo}}^2 e^{-D_{0,\mathrm{lo}}}$ and $D_0 e^{-D_0} \le D_{0,\mathrm{lo}} e^{-D_{0,\mathrm{lo}}}$.

- **Analytic $r \ge 5$ Gaussian tails:** Return to the original $(z_1, u)$ integral ($u = |W|^2 \sim \operatorname{Exp}(1)$, $v = r^2 \ge 25$, $2r e^{-r^2}\,dr = e^{-v}\,dv$), with $\int_{25}^\infty (1, v, v^2, v^3)e^{-v}\,dv = (1, 26, 677, 17631)e^{-25}$. On every row, $|\ell| \le 1, |\beta| \le \frac{1}{5}, |\nu_5| \le \frac{1}{20}, \sigma \le \frac{1}{2}, |b_A| \le \frac{1}{5}, |b_B| \le \frac{1}{5}$ (`verify.py`):
  1. **For $\kappa_D$:** On $v \ge 25$, $r \le \frac{1}{5}v$, $|e_{3,2}(z_1)| < \frac{r v^2}{3}$, $|L(z_1)| \le r(1 + \frac{1}{5}v + \frac{1}{60}v^2) < \frac{1}{180}v^3$, and $|M(z_1, \sigma W)| \le \frac{1}{2}\sqrt{u}(\frac{4}{5} + \frac{2}{5}v) \le \frac{1}{4}\sqrt{u}\,v$, so $\Psi(\sigma\sqrt{u}; r) \le \frac{1}{90}v^3 + \frac{1}{2}\sqrt{u}\,v$. Since $\|e_{2,2}\|_2 = 1$ and $\mathbb{E}[u] = 1$, Cauchy–Schwarz in $u$ bounds the $r \ge 5$ tail of $\kappa_D$ by $\frac{1}{2}\int_{25}^\infty (\frac{1}{90}v^3 + \frac{1}{2}v)e^{-v}\,dv = (\frac{17631}{180} + \frac{13}{2})e^{-25} < 105\,e^{-25} < 35314\,e^{-25}$.
  2. **For $g_1, m_2$:** $|G_j(s; r)| \le 2|E_j(r)| \le \sqrt{2}\,r v \le \frac{\sqrt{2}}{5}v^2$ on $v \ge 25$, and $\int_0^\infty |u - 1|e^{-u}\,du = \frac{2}{e} < 1$, $\frac{1}{2}\int_0^\infty u e^{-u}\,du = \frac{1}{2} < 1$, giving tail magnitude $< \frac{\sqrt{2}}{5}\cdot 677 e^{-25} < 200\,e^{-25} < 4000\,e^{-25}$.
  3. **For $P_{jk}, Q_{jk}$:** $|E_j(r)E_k(r)| \le \frac{1}{2}v^3$ on $v \ge 25$, $\alpha_x \alpha_y \sqrt{A} \ge \alpha_{\min} := (1 + b_A)\sigma > 0$, $e^{-D_0} \le 1$, and $\int_0^{\pi/2}\frac{2}{\sqrt{\pi}}\,d\varphi = \sqrt{\pi}$, giving tail magnitude $\le \frac{\sqrt{\pi}}{\alpha_{\min}}\int_{25}^\infty \frac{1}{2}v^3 e^{-v}\,dv < \frac{17631\sqrt{\pi}}{\alpha_{\min}}\,e^{-25}$.

### 4.3 Certified Outward-Rounded Benchmark Table (`cert_stage0_gram.json`)

All 9 benchmark rows are rationalised to exact denominator dividing $10^{10}$ within $\le \frac{1}{2}\cdot 10^{-10}$ of `code/degree5-stage0/results/b/{gC,g83,g84,gA}/rows_all.lines` (bound by SHA-256 in `verify.py`). Every interval below is outward-rounded and certified in pure integer arithmetic (`S = 10^{15}`, zero `float`):

| Row ID | Game $(1, -\varepsilon_1, \eta)$ | $t$ | Plain $e_{2,1}$ share | 5-scalar cone (no $C_{--}$) | **Retained all-dim $\sup_{d \ge 1, B}$** | Cap | $\min_{j \le 4}\lambda_j$ | $\min$ concav. |
|---|---|---:|---|---|---|---:|---:|---:|
| `gC_0.80` | $(1, -\frac{39}{50}, \frac{779}{10000})$ | $0.80$ | $[+0.1176, +0.1474]$ | $[-0.1698, -0.1307]$ | **$[-0.17990, -0.13827]$** | $< 0$ | $> +0.267$ | $> +1.508$ |
| `g83_0.80` | $(1, -\frac{83}{100}, \frac{2241}{10000})$ | $0.80$ | $[+0.5314, +0.7456]$ | $[+0.1046, +0.1733]$ | **$[+0.08385, +0.14477]$** | $< \frac{7}{20}$ | $> +0.273$ | $> +1.433$ |
| `g83_0.85` | $(1, -\frac{83}{100}, \frac{2241}{10000})$ | $0.85$ | $[+0.7643, +0.9980]$ | $[+0.1403, +0.2092]$ | **$[+0.11249, +0.17383]$** | $< \frac{7}{20}$ | $> +0.074$ | $> +1.307$ |
| `g84_0.70` | $(1, -\frac{21}{25}, \frac{319}{1250})$ | $0.70$ | $[+0.4513, +0.4767]$ | $[+0.1606, +0.1755]$ | **$[+0.14223, +0.15596]$** | $< \frac{7}{20}$ | $> +0.997$ | $> +1.636$ |
| `g84_0.80` | $(1, -\frac{21}{25}, \frac{319}{1250})$ | $0.80$ | $[+0.6800, +0.9925]$ | $[+0.1970, +0.3166]$ | **$[+0.17161, +0.27983]$** | $< \frac{7}{20}$ | $> +0.241$ | $> +1.420$ |
| `g84_0.84` | $(1, -\frac{21}{25}, \frac{319}{1250})$ | $0.84$ | $[+1.0345, +1.2191]$ | $[+0.2936, +0.3606]$ | **$[+0.25694, +0.31813]$** | $< \frac{7}{20}$ | $> +0.115$ | $> +1.321$ |
| `g84_0.85` | $(1, -\frac{21}{25}, \frac{319}{1250})$ | $0.85$ | $[+1.1832, +1.2862]$ | $[+0.3375, +0.3726]$ | **$[+0.29638, +0.32834]$** | $< \frac{7}{20}$ | $> +0.083$ | $> +1.296$ |
| `gA_0.80` | $(1, -\frac{8493}{10000}, \frac{2827}{10000})$ | $0.80$ | $[+1.0147, +1.0399]$ | $[+0.3716, +0.3828] > \frac{7}{20}$ | **$[+0.33474, +0.34506]$** | $< \frac{7}{20}$ | $> +0.383$ | $> +1.414$ |
| `gA_0.85` | $(1, -\frac{8493}{10000}, \frac{2827}{10000})$ | $0.85$ | $[+1.4497, +2.1107]$ | $[+0.4987, +0.7545]$ | **$[+0.44926, +0.68411]$** | $< \frac{7}{10}$ | $> +0.061$ | $> +1.281$ |

*(Exact outward integer endpoints at scale $S = 10^{15}$ are stored in `cert_stage0_gram.json` and printed to 5–6 decimals by `verify.py`.)*

---

## 5. Consequences for `#751` / `#453` and Remaining Open Steps

1. **Why `g84` $(1, -21/25, 319/1250)$ ($1/N_5 \approx 1.403584 > 1.4035$) is re-opened as the leading $1.403+$ degree-5 candidate:**
   In Stage 0 (`REPORT.md`), `g84` cleared `< 1/1.403` across $t \in [0, 0.55]$ in `E3`, and failed **solely** on the Part (b) sector gate ($\kappa_h = 0.673 > 0.35$ at $t = 0.80$ and $\theta > 0$ on $t \ge 0.84$). Retaining the two coordinate-free cubic $h$-defenders $D_{3,h}^{\mathrm{univ}}$ and applying the antisymmetric slice-Gram inequality $C_{--} \succeq 0$ lowers the all-dimension diffuse-spike sharing constant on `g84` below $7/20 = 0.35$ across `0.70`–`0.85` simultaneously ($\approx 0.149$ at $0.70$, $\approx 0.218$ at $0.80$, $\approx 0.286$ at $0.84$, $\approx 0.312$ at $0.85$), leaving $> 65\%$ of the deficit $D(q)$ to fund the first-chaos A/B content law.
2. **Both new ingredients are necessary:**
   - Without the retained cubic $h$-defenders (`eval_mode = "plain_e21"`), every `g83`, `g84`, `gA` benchmark row exceeds $7/20 = 0.35$, and `g84` ($0.84, 0.85$) and `gA` ($0.80, 0.85$) exceed $1$ ($\theta > 0$).
   - Without $4\|C_{--}\|_{\mathrm{HS}}^2 = n + b - (3y - z) \ge 0$ (`eval_mode = "no_cmm_5sc"`), the 5-scalar `Gram.lean` cone exceeds $7/20 = 0.35$ on `gA` ($t = 0.80$, certified $[+0.3716, +0.3828] > 0.35$) while the full cone with $C_{--} \succeq 0$ is certified strictly $< 0.35$ ($[+0.33474, +0.34506]$).
3. **What remains open to prove $K_G^{\mathbb{C}} > 1.403$ from `g84`:**
   - Finite-amplitude multi-spike / arbitrary-sharing sector bound (`H8` of `4.45`) with the retained defenders $D_{3,h}^{\mathrm{univ}}$ in place (extending `4.16c`–`4.16d` to all sectors and arbitrary remote cubics $q$);
   - Certified finite-amplitude A/B secant margins (`H5`) and per-cell first-chaos content bounds (`H6`–`H7`, extending `CONTCELL` `4.56`) on the `g84` band rows;
   - Certified continuous-in-$t$ `E3` covers (`H2`–`H4`, extending `LAWREP` and `4.18k`–`4.18p`) across small and intermediate $t$.
