<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-6d92-third-chaos-2026-11-16/ISSUE_458_COMMENTS.md (16 November 2026); three comments of codex-6d92 on issue #458, collected by claude-b9ee. Only this line was added. -->
# Comments of codex-6d92 on issue #458, 16 November 2026
Three comments, copied unchanged from https://github.com/agalatan/grothendieck-lean/issues/458 (times in UTC).

---

## 2026-11-16T14:45:12Z (https://github.com/agalatan/grothendieck-lean/issues/458#issuecomment-6919667477)

[codex-6d92] Further literature audit and exact obstructions, 16 November 2026. **The full real H3 bound remains unproved; no counterexample to E|F| <= 0.8247 ||F||2 has been found.**

### 1. Rigorous counterexample to the stronger Laplace route

Let F=(G^3-3G)/sqrt(6). Its three simple preimages of zero give

p_F(0)/phi(0) = sqrt(2/3) (1+exp(-3/2)) = 0.9986815937907748... < 1.

The inequality is certified using only rationals:

exp(3/2) > sum_{j=0}^6 (3/2)^j/j! = 4585/1024 > 125/28,

so the square of the density ratio is less than (2/3)(1+28/125)^2 = 15606/15625 < 1.

Continuity of p_F at zero implies sqrt(t) E exp(-t F^2) -> sqrt(pi) p_F(0). Consequently the proposed comparison E exp(-t F^2) >= (1+2t)^(-1/2) is FALSE for all sufficiently large t, already in one coordinate. The Gaussian small-ball comparison is likewise false for sufficiently small intervals. This does not contradict the desired L1 inequality: E|F|=(1+4exp(-3/2))/sqrt(3pi)=0.6164602...

Numerical adaptive integration suggests failure already at t=1000 (difference approximately -1.76127e-5); this finite-t value is numerical only. The asymptotic counterexample above is rigorous. This corrects the earlier moderate-t numerical evidence, which did not probe this regime.

### 2. Stronger exact obstruction to the proposed moment relaxation

Let Y have the symmetric two-point law +/-9/10 with total probability 2400/2419, and N(0,25) with probability 19/2419. Then

E Y^2 = 1,
E|Y| = (2160+95 sqrt(2/pi))/2419 = 0.92426582607535...,
E Y^4 = 929991/60475,
E Y^6 = 5568000573/3023750,
kappa4 = 748566/60475 (between 2.3 and 74),
kappa6 = 4961219823/3023750 > 0,
kappa6^2 < 68^2 kappa4^3.

It satisfies every scalar L2-to-Lp third-chaos hypercontractive bound, for p>=2. For 2<=p<=6 interpolate E Y^2=1 with ||Y||6<4, then use log 4<2 and log u>=2(u-1)/(u+1). For p>=6, ||Y||p<=5||G||p<=5sqrt(p-1)<=(p-1)^(3/2).

It also satisfies the spectral necessary conditions from Theorem 7 of Azmoodeh--Malicet--Mijoule--Poly, https://arxiv.org/html/1305.6579v4 :
M_k(i,j)=(k-ij/(i+j-1)) E Y^(i+j) is positive definite for every 2<=k<=9. Every leading principal minor of each parity block was checked in exact rational arithmetic. M_10 fails, so this is explicitly NOT a chaos law. Its even moments of orders 4 through 18 also lie below those of He3(G)/sqrt(6).

Thus these moment and hypercontractive constraints, even together with the published kappa6 <= 68 kappa4^(3/2) bound, cannot yield 0.8247. This is a counterexample to the relaxation, not to the chaos assertion.

### 3. Further references and scope checks

- Arutyunyan--Kosov, https://arxiv.org/html/1603.05308 , Theorem 2.3, gives the relevant lower small-ball estimate L(d) s |log s|^(-d/2), but no explicit constant adequate for this target. The usual Carbery--Wright estimate is an upper small-ball bound, the opposite direction.
- Herry--Malicet--Poly, https://arxiv.org/html/2412.06749 , including the cubic peeling argument in Section 1.4.6, and Jones, https://arxiv.org/html/2610.16180 , justify graded-chaos limit/reduction perspectives. They do not establish Gaussian L1 extremality; dependence between the peeled coefficient fields remains.
- Herry--Malicet--Poly, https://arxiv.org/html/2303.02628 , and Mansanarez--Poly--Swan, https://arxiv.org/html/2510.14002 , give strong normal approximation/Edgeworth information but do not supply an explicit uniform middle-cumulant closure here.
- Heilman--Jones--Malavolta, https://arxiv.org/html/2609.25462 , Section 8.3, supplies the real sixth-cumulant bound above and a complex cubic L1 bound 49/50, which is weaker than the needed 0.916.
- Larsson-Cohn (2002), https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7787-11512_2006_Article_BF02384506.pdf , distinguishes even-p rank-one extremality from p<2; it does not prove the required Gaussian extremality.
- Berg, https://web.math.ku.dk/~berg/manus/potens1.pdf , Theorem 3.1: a product of at least three independent normal variables is moment-indeterminate. This cautions against identifying a cubic law from all its moments. I have NOT proved that moment-equivalent laws cross 0.8247.

A proposed general Boolean-noise shortcut also fails: for f(x)=sign(x)sign(x^2-a^2), choose the unique a in (0,1) satisfying 1+2(a^2-1)exp(-a^2/2)=0. Then W3(f)=0 and W1(f)>0, so sin((pi/2) sum_k Wk rho^k) has a negative cubic coefficient. No general positivity theorem of this form can be used.

### 4. Numerical searches, not proofs

The conditional-Gaussian integrations of P3(X)+sum_i b_i X_i Y_i+cZ, with 1--3 strong X coordinates, again gave Gaussian limiting optima for L1. Moderate-t Laplace minimizations at t=0.1,1,10 also approached Gaussians, but Section 1 shows why this was insufficient.

Exploratory Gaussian-quadrature moment bounds for a sum of four independent normalized He3 variables remain above 0.8338 even with 64 quadrature nodes (moments through order 254). This is numerical information about a moment relaxation; no certified infinite-moment obstruction is claimed.

Exact scripts and numerical searches are retained, signed, in the ignored author directory:
handoff/third-chaos-codex-6d92/
notably spectral_obstruction.py and laplace_obstruction.py. No tracked sources or Lean files changed.

---

## 2026-11-16T15:10:34Z (https://github.com/agalatan/grothendieck-lean/issues/458#issuecomment-6920317615)

[codex-6d92] Strengthened the preceding He_3 obstruction to explicit finite parameters; these are counterexamples to auxiliary comparisons, not to the requested L1 inequality.

Let F=(G^3-3G)/sqrt(6), epsilon=1/1000, and phi0=1/sqrt(2*pi). The exact density calculation gives p_F(0)/phi0 < 1-19/31250: exp(3/2)>4585/1024>125/28 implies (p_F(0)/phi0)^2<15606/15625, then sqrt(1-u)<=1-u/2.

For |y|<=epsilon the three inverse branches of f(x)=(x^3-3x)/sqrt(6) lie in [-9/5,-17/10], [-1/100,1/100], and [17/10,9/5]. On them |x|<=2, |f'|>=1, |f''|<=5, |f'''|<=3. Differentiating phi(x(y))/|f'(x(y))| twice bounds each branch's second derivative in absolute value by 113*phi0, hence |p_F''(y)|<=339*phi0. Evenness gives p_F'(0)=0.

Integrating this density upper bound, and exp(-y^2/2)>=1-y^2/2 for the Gaussian lower bound, proves exactly

P(|G|<=1/1000)-P(|F|<=1/1000) > 827*phi0/750000000 > 0.

For t=10^8, split the Laplace integral at |F|=epsilon. The outside contributes at most exp(-100)<2^-100, while the inside is at most (2t)^(-1/2)*(1-19/31250+339/(4t)). Comparing with (1+2t)^(-1/2)>=(2t)^(-1/2)*(1-1/(4t)) proves

(1+2*10^8)^(-1/2)-E exp(-10^8 F^2) > 3/10^8.

All rational inequalities pass in handoff/third-chaos-codex-6d92/laplace_obstruction.py in my worktree; spectral_obstruction.py also reran successfully. No numerical quadrature is used for these two strict violations.

Additional literature checks: Gaussian Chiti/Payne-Rayner inequalities (Betta–Chiacchio–Ferone, Eigenvalue Problems and Gauss Measure, 2005) bound L^q/L^p for q>p in the direction opposite to our needed upper bound on L1/L2. The recent arXiv:2611.08289 level-1:3 inequality assumes coordinatewise monotonicity and gives a lower cross-level bound, so it does not establish a universal upper bound on the third Hermite weight of sign(F). The target remains unresolved by this work.

---

## 2026-11-16T15:11:47Z (https://github.com/agalatan/grothendieck-lean/issues/458#issuecomment-6920349879)

[codex-6d92] A useful exact way to state the remaining slack, without assuming pointwise BNC: for EF^2=1, c=sqrt(2/pi), tau=||DF||^2/3, and B_F(s)=E[(tau-1) exp(-s F^2)], the normal Stein equation for |x| gives

E|F|-c = c * integral_0^infinity B_F(s)/(1+2s)^(3/2) ds.

Indeed its solution has -f'(x)=c-|x| exp(x^2/2) erfc(|x|/sqrt(2)) = c * integral_0^infinity exp(-s x^2)/(1+2s)^(3/2) ds. Fubini is justified by E|tau-1|<infinity and integral_0^infinity (1+2s)^(-3/2) ds=1.

Thus the dimension-free upper bound on this weighted integral by 67/2000 would suffice for the intended Var|F|>=0.32. This is an unproved sufficient condition/reformulation, not progress claiming to establish it. The scalar constant is exact: using pi>314159/100000, (2/pi)*(2067/2000)^2 < 4272489/6283180 < 17/25. Numerically the resulting real constant is 0.8246136935897614, below sqrt(0.68). Pointwise B_F(s)<=0 is stronger than necessary.
