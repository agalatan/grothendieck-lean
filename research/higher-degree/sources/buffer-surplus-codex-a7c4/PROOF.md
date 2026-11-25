# A uniform saving in the degree-five Gaussian-buffer bound

Agent-ID: codex-a7c4. Partial result for #628. Paper argument and rational certificate, author only.

Let $P,Q,J$ be the orthogonal projections to complex Wick chaoses $H_{1,0},H_{2,1},H_{3,2}$ of independent standard complex Gaussians. Write $T=P-\varepsilon Q+\eta J$, $\varepsilon=39/50$, $\eta=779/10000$. For unimodular $f,g$ in any dimension put $t=\|P(f+g)/2\|_2$. Let $\rho$ be either $2287/2500$ or $4571/5000$ and assume the corresponding dimension-free cubic radius bound $\mathbb E|q|\le\rho\|q\|_2$ on $H_{2,1}$. Then
$$
\operatorname{Re}\langle f,Tg\rangle \le (1-\eta)t^2+\varepsilon\rho^2+\frac{\eta^2}{\pi\varepsilon}-\frac{9}{10000}.
$$
At $\rho=2287/2500$ this gives a strict upper bound of $500/701$ for $t\le0.25282$. At $\rho=4571/5000$ it gives the same inequality for $t\le0.25465$. These choices previously gave $0.2508$ and $0.2527$. The new argument and arithmetic are author-checked. The input at $0.9148$ has independent paper and arithmetic review. At $0.9142$ the arithmetic was independently replayed and the paper proof is author-checked. The theorem uses no sector inequality. [Higher-degree ledger, row 4.18](../../STATUS.md)

## The clipped payoff and its majorant

Put $h=(f+g)/2$, $k=(f-g)/2$, $G=\varepsilon Qk$, and $\sigma=\|G\|_2$. Self-adjointness, $\|h\|^2+\|k\|^2=1$, and $\|Jh\|^2\le\|h\|^2-t^2$ give
$$
\operatorname{Re}\langle f,Tg\rangle\le(1-\eta)t^2+
\mathbb E\psi(|G|)-\sigma^2/\varepsilon,\qquad
\psi(r)=2r+(\eta-r)_+^2/\eta.
$$
Indeed $\varepsilon\|Qk\|^2=2\operatorname{Re}\langle G,k\rangle-\|G\|^2/\varepsilon$, and $\eta+2r|k|-\eta|k|^2\le\psi(r)$ for $0\le|k|\le1$.

With $s=\eta/\sqrt\pi$ and $W=X+iY$ an independent standard complex Gaussian, write $H(r)=2\mathbb E|r+sW|$ and $B=\varepsilon\rho^2+s^2/\varepsilon$. Proposition 5 of the cubic radius proof gives
$$
H(r)\ge\psi(r)\quad(r\ge0),\qquad
\mathbb E H(|G|)\le2\rho\sqrt{\sigma^2+s^2}.
$$
For completeness, $H(\sqrt x)$ is concave in $x$. The Laplace representation of the square root expresses it as a positive integral of $1-(1+us^2)^{-1}\exp(-ux/(1+us^2))$. On $[0,\eta^2]$ the affine function $\psi(\sqrt x)=\eta+x/\eta$ is below the chord joining the values of $H(\sqrt x)$ at $0,\eta^2$, since $H(0)=\eta$ and Jensen gives $H(\eta)\ge2\eta$. For $r\ge\eta$, Jensen gives $H(r)\ge2r=\psi(r)$. Rotational invariance and independence of $W$ give $\mathbb E H(|G|)=2\mathbb E|G+sW|$. For the second inequality replace $W$ by a normalized sum of independent variance-one circular Wick cubics on fresh coordinates. Its sum with $G$ after scaling by $s$ has squared norm $\sigma^2+s^2$ in $H_{2,1}$. The two-dimensional central limit theorem gives convergence to an independent $W$, and the common second moment gives uniform integrability for the absolute values. This permits the original radius bound to be applied before passing to the Gaussian limit. [Cubic radius proof, Proposition 5](../../../conjecture-K/sources/complex-radius-2026-11-17-gemini-2762/PROOF.md)

## A quantitative gain above the clipping threshold

For $r\ge\eta$, introduce the tilted probability measure $d\mathbb P_*=2Y^2d\mathbb P$. Here $X$ and $Y$ are independent centered real Gaussians with variance $1/2$. Almost surely the denominator $D=|r+sW|+r+sX$ is positive. Rationalization, followed by Jensen for the reciprocal, gives
$$
H(r)-\psi(r)=2\mathbb E[|r+sW|-(r+sX)]
=s^2\mathbb E_*[1/D]\ge s^2/(\mathbb E_*D).
$$
Symmetry gives $\mathbb E_*X=0$. The Gaussian second and fourth moments give $\mathbb E_*|W|^2=2\mathbb E[Y^2X^2+Y^4]=2$. Thus $\mathbb E_*|r+sW|^2=r^2+2s^2$ and, by Cauchy–Schwarz,
$$
H(r)-\psi(r)\ge L(r):=\frac{s^2}{r+\sqrt{r^2+2s^2}}
=\frac{\sqrt{r^2+2s^2}-r}{2}.
$$
The last expression shows that $L$ is decreasing and convex. For $r<\eta$, including zero, the original majorant gives $H(r)-\psi(r)\ge0$.

## Uniformity in the cubic scale

Let $\delta=9/10000=0.00090$. We show $\mathbb E\psi(|G|)-\sigma^2/\varepsilon\le B-\delta$.

1. For every $\sigma\ge0$, completing the square in the Gaussian majorant gives $B-(\sqrt{\sigma^2+s^2}-\varepsilon\rho)^2/\varepsilon$. If $\sigma\le17/25=0.68$, then $\sqrt{\sigma^2+s^2}<0.682$ by $\pi>3$. If $\sigma\ge371/500=0.742$, that square root is at least $0.742$. In both cases its distance from $\varepsilon\rho$ exceeds $0.027$, and $(0.027)^2/\varepsilon>\delta$. This includes $G=0$ before any normalization.
2. In the remaining interval set $R=|G|/\sigma$ and $m=\mathbb E R\le\rho$. Then $\mathbb E R^2=1$. Suppose $m\le181/200=0.905$. Because $\sigma\ge\eta m$, one has $(\eta-\sigma R)_+^2\le\eta^2(1-mR)^2$. Indeed, on $R\le\eta/\sigma$ both sides are squares of nonnegative quantities, with $\eta-\sigma R\le\eta(1-mR)$; outside that event the left side is zero. Taking expectations gives
$$
\mathbb E\psi(|G|)-\sigma^2/\varepsilon
\le 2\sigma m-\sigma^2/\varepsilon+\eta(1-m^2)
\le (\varepsilon-\eta)m^2+\eta.
$$
At $m=0.905$ this is already smaller than $\varepsilon\rho^2+(7/22)\eta^2/\varepsilon-\delta$ for either radius, hence smaller than $B-\delta$.
3. Now $m>181/200$ and $\eta/\sigma<\eta/(17/25)<181/200$. Cantelli's inequality with variance $1-m^2$ gives
$$
p=\mathbb P(\sigma R\ge\eta)
\ge\frac{(m-\eta/\sigma)^2}{1-m^2+(m-\eta/\sigma)^2}>\frac{31}{40}.
$$
For the last comparison, bound the squared difference from below using $181/200-\eta/(17/25)$ and the variance from above by $1-(181/200)^2$. Let $A=\{\sigma R\ge\eta\}$ and $p_0=31/40$. Cauchy–Schwarz gives $\mathbb E[\sigma R\mid A]\le\sigma/\sqrt p$. Conditional Jensen for the convex decreasing $L$ then gives
$$
\mathbb E[H(\sigma R)-\psi(\sigma R)]
\ge p L(\sigma/\sqrt p)\ge p_0 L(\sigma/\sqrt{p_0})
=\frac{s^2p_0^{3/2}}{\sigma+\sqrt{\sigma^2+2s^2p_0}} .
$$
The middle inequality follows because both positive factors in $pL(\sigma/\sqrt p)$ increase with $p$. The last expression decreases with $\sigma$.

For $0.68\le\sigma\le0.728$, use $\sqrt{p_0}>22/25$, $s^2>(7/22)\eta^2$, and $\sqrt{0.728^2+2s^2p_0}<0.7301$. These imply that the averaged surplus exceeds $18812071/20830000000>\delta$. For $0.728\le\sigma\le0.742$ use $\sqrt{0.742^2+2s^2p_0}<0.7441$ to obtain $18812071/21230000000$ as its strict lower bound. In this last interval, $\sqrt{\sigma^2+s^2}\ge0.728>\varepsilon(0.915)>\varepsilon\rho$. The square from step 1 contributes at least $(0.728-\varepsilon(0.915))^2/\varepsilon$. This square plus the displayed lower bound exceeds $\delta$. The square-root ceilings follow by squaring and using $\pi>333/106$.

For the displayed cutoffs use $\pi>333/106$ to bound $B$ from above. The resulting exact positive slacks below $500/701$ are respectively $329119931276213/227597175000000000000$ and $39742622896877/36415548000000000000$. The verifier brackets $\pi$ by the alternating Machin series and checks all scale and mean regimes. The cutoffs $0.25283$ and $0.25466$ fail the respective rational comparison. Further negative controls check the event probability, the claimed saving, and the upper central calculation with its square removed.

Run the exact comparisons from the repository root.

```sh
python3 -I -O research/higher-degree/code/buffer-surplus-codex-a7c4/verify.py
```
