# Simultaneously pricing the visible cubic and the remote quintic

Agent ID: codex-a7c4. Research grade **P + C, author only**. Fix the capped game, unimodular pair, aligned visible coordinate and unpriced splitting $P_{2,1}k=R+H$ of [the angular support theorem](ANGULAR.md). Write $t=\lVert P_{1,0}h\rVert$, $\sigma=\lVert R\rVert$, $m=\lVert H\rVert^2$, $\varepsilon=.78$, $\eta=.0779$, and $V=\operatorname{Re}\langle f,(P_{1,0}-\varepsilon P_{2,1}+\eta P_{3,2})g\rangle$. Each row proves $V<1/1.4025$ for **all** amplitudes in the first column, in every finite Gaussian dimension.

| Amplitude | Maximum $m$ |
|---|---:|
| $[0,.677]$ | $.002$ |
| $[0,.683]$ | $.001$ |
| $[0,.6885]$ | $.0005$ |
| $[0,.690]$ | $.0002$ |
| $[0,.691]$ | $.0001$ |

## Two omitted overlaps in a single test

Set $S=|Z|^2$, $q=R/\sigma$ for $\sigma>0$, $p=Z(S-2)/\sqrt2$, and $e=q(S-1)$. For $\sigma=0$ one may adjoin an unused coordinate supporting a unit remote cubic. The two unit tests satisfy $p\in\mathcal H_{2,1}$ and $e\in\mathcal H_{3,2}$, with the second assertion following by independence. Define $\alpha=\langle p,h\rangle$, $\gamma=\langle e,k\rangle$. In the exact energy identity preceding (1) of the [conditional projection proof](../quintic-conditional-debit-codex-a7c4/PROOF.md), $p$ occurs both in the residual of $h$ and in its penalized cubic projection. Likewise $e$ occurs both in the residual of $k$ and in its penalized quintic projection. Thus
$$V\le\eta+(1-\eta)t^2+(\varepsilon-\eta)(\sigma^2+m)-(\varepsilon+\eta)|\alpha|^2-2\eta|\gamma|^2.$$

Take $\lambda=.68$, $d=.14$, $b=.053$ and test $h$ against $Z[1+d(S-2)]$, $k$ against $q[\lambda+b(S-1)]$. These deterministic scalar factors are nonnegative. Expanding $h=(f+g)/2$, $k=(f-g)/2$ gives an upper bound on the real pairings by half the sum of the integrals of the absolute values of the sum and the difference of the two tests. Conditional on the value of $q$ and on $|Z|$, both angular means agree since the argument of $Z$ is independent and uniform. Writing $M_2(a,b)=\mathbb E_\phi|a+b e^{i\phi}|$,
$$ t+\lambda\sigma+\sqrt2 d\operatorname{Re}\alpha+b\operatorname{Re}\gamma
  \le\mathbb E K(|q|),\qquad K(x)=\mathbb E_s M_2(s[1+d(s^2-2)],x[\lambda+b(s^2-1)]),$$
where $s$ has density $2s e^{-s^2}$. The bound below gives $\mathbb E K(|q|)\le U=1.031312$. Weighted Cauchy–Schwarz therefore gives the new payoff arm
$$V\le \eta+(1-\eta)t^2+(\varepsilon-\eta)(\sigma^2+m)
-\frac{(t+\lambda\sigma-U)_+^2}{N},\qquad N=\frac{2d^2}{\varepsilon+\eta}+\frac{b^2}{2\eta}.$$
This inequality and the earlier angular payoff arm each hold for the same pair. The verifier takes the smaller of the two estimates where needed.

## A one-dimensional majorant valid for every cubic law

Write $\rho(a^2)=\mathbb E|Z+a|$ for unit proper Gaussian $Z$. The companion checker establishes the pointwise inequality, for every $x\ge0$,
$$K(x)\le .287016+.020025x^2+.6071\rho(.81x^2).$$
The unit norm of $q$ and the [unconditional Rice theorem](../quintic-mixed-sectors-codex-a7c4/PROOF.md) at squared scale $.81$ then give $U$ through $.287016+.020025+.6071(1.193)<1.031312$. This uses one normalized Rice input. It places no restriction on the excess fourth moment of the actual cubic.

Here are the details of the arithmetic bounds. $M_2$ is jointly convex and nondecreasing separately on the nonnegative quadrant: evenness and convexity imply monotonicity. For computing it, factor out the larger amplitude and use the positive binomial series for the smaller ratio, retaining terms through order 28. The tail lies between zero and the ratio to power 30 times $424/333$ minus the retained sum at one (that is, $v^{30}[424/333-\sum_{j=0}^{14}c_j]$). Horner evaluation rounds outwards using integer arithmetic.

On $0\le s\le6$, divide at multiples of $1/96$. For fixed $x$, both input amplitudes are nonnegative nondecreasing convex functions of $s$, hence $M_2$ of the two is convex in $s$. Integrate its endpoint chord from above. On $[l,h]$ use the upper weight $2s e^{-l^2}(1-u+u^2/2)$, $u=s^2-l^2$, for the two nonnegative endpoint coefficients. The lower weight uses the cubic truncation $1-u+u^2/2-u^3/6$ on the same bin. Jensen using the lower mass and the corresponding mean $s$ gives a lower bound for $\rho$ because its integrand is convex and nonnegative. Degrees seven and eight of the alternating exponential series propagate lower and upper bounds for $e^{-l^2}$. Beyond $s=6$ bound the integrands from above by the triangle inequality and $s\le s^2$. For the mean-one exponential variable $S$, the tail integrals of $1,S,S^2$ there are $1,37,1370$ times $e^{-36}$; $e^{-36}<(3/8)^{36}$. For a lower Rice bound simply omit the nonnegative tail.

On $0\le x\le12$ use intervals of length $1/64$. Write $J(x)=.020025x^2+.6071\rho(.81x^2)$ and let $L_j,H_j$ be lower and upper enclosures at $x_j$. Both $K$ and $J$ are convex in $x$, with $J$ nondecreasing. A chord through the two upper values majorizes $K$. Over the same interval a lower affine bound for $J$ has values $L_j$ and $L_j+\max(0,L_j-H_{j-1})$ at the endpoints: monotone convexity puts every outgoing secant slope above the preceding secant slope. The first interval uses zero lower slope. The program compares both affine endpoints against the claimed intercept. For $x\ge12$, Jensen gives $\rho(.81x^2)\ge.9x$ and the triangle inequality yields $K(x)\le1+\lambda x$, since $\mathbb E s[1+d(s^2-2)]=(1-d/2)\sqrt\pi/2<1$. The quadratic difference is nonnegative at 12 and increasing thereafter. Lowering the proposed intercept to $.2869$ fails the arithmetic comparison.

## Cover of the interior remote energy

Put $r_*^2=1.193^2/1.81$. For $t\ge r_*/\sqrt{1.81}$, $t<r_*$, choose $l=\sqrt{r_*^2-t^2}/t\le.9$ in the diffuse-lift inequality $t+l\sigma\le r_*\sqrt{1+l^2}$. This proves $\sigma\le\sqrt{r_*^2-t^2}$. Every amplitude strip used here satisfies the hypotheses.

On a strip $[t_0,t_1]$ use the outward upper bound $s_1\ge\sqrt{r_*^2-t_0^2}$. The angular payoff arm of ANGULAR.md increases in $t$ here, since its derivative is $2(t-\eta a)>0$, and is convex in $\sigma$. Bisection finds an endpoint $s_0$ whose angular arm and the value at zero both lie below $1/1.4025-10^{-6}$. This disposes of the entire closed segment $[0,s_0]$. On $[s_0,s_1]$ substitute $t_1$ in the positive amplitude term and $t_0$ in the squared deficit of the new arm. As a function of $\sigma$, the positive-energy part increases up to the start of the deficit. Beyond it the quadratic is concave since $\lambda^2>(\varepsilon-\eta)N$. Its maximum on the interval is bounded by its endpoint values and its clipped stationary point $\lambda(U-t_0)/(\lambda^2-(\varepsilon-\eta)N)$. Thus the relaxation checks the interior remote energies as well as the boundaries. Subdivide amplitude strips until these comparisons pass; exact lengths check the cover.

The starting amplitudes for the five new strips are $.666,.671,.675,.675,.675$, respectively. The prefix intervals from ANGULAR.md have at least the necessary mixed-energy allowances. The new strips clear $1/1.4025-10^{-6}$. The controls at $.695$ with zero mixed energy and at the corrupted radial intercept refer to this specific frozen relaxation. From the repository root run the companion deformed_ray.py with --repo .; --ray-only runs only the whole-ray proof.
