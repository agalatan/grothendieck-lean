# Reducing the fifth eigenvalue of the identity-tail witness

For a normalized Gaussian phase pair $f,g$, put $h=(f+g)/2$, $k=(f-g)/2$ and $t=\|P_{1,0}h\|$. Write $P=P_{1,0}$, $Q=P_{2,1}$, $F=P_{3,2}$ and $D_F=\|Fh\|^2-\|Fk\|^2$. For $T=P-eQ+\nu(I-P-Q)$ the perturbed operator $T-dF$ changes the real payoff by $-dD_F$.

## A signed estimate on the high-amplitude interval

Let $p$ be the unit phase of the visible linear direction. The proved Gaussian phase stability inequality gives

$$\|h-p\|^2+\|k\|^2 \le E_r=2(\sqrt\pi/2-t)/r+4r^2/3,$$

for every $r>0$ and $t>0$. The fifth projection of this phase has squared norm $3\pi/256$. For $b\ge1$, projection contractivity and weighted Cauchy–Schwarz give

$$ D_F\ge \frac{b}{1+b}\frac{3\pi}{256}-bE_r.$$

In particular $D_F\ge17/10000$ for $t\ge0.885868$ (take $b=1$, $r=13/200$), and $D_F\ge154/10000$ for $t\ge0.886176$ (take $b=2$, $r=17/500$). Each statement covers all physical pairs and all finite positive Gaussian dimensions. For $d>0$ this is a strict decrease in the real scalar payoff on those pairs. Phase rotation allows the modulus to be bounded once the full real-payoff estimate holds. [Lean proof](lean/QuinticResearch/SignedFifth.lean).

For $0\le d\le\nu$ the residual diagonal $\nu(I-P-Q)-dF$ is positive semidefinite by the common three-projection energy bound. The standard Gaussian vector field therefore still gives at least $1-(1+e)/(n+1)$ for $e\ge0$. The finite-matrix transfer now takes only an upper bound on the real payoff of this signed operator for all unimodular pairs in sufficiently large dimension. These steps leave the central scalar estimate open. [Operator, high-arm scalar theorem and transfer](lean/QuinticResearch/SignedVector.lean).

## Sharper credit from the visible fifth polynomial

The radial argument improves the lower bound for $D_F$ to **$13/500=0.026$** when $t\ge0.885868$ and **$17/500=0.034$** when $t\ge0.886176$. For the real payoff of $T-dF$ this gives a saving of $0.034d$ throughout the latter interval. The checked estimates below use the physical pair directly. [Lean theorem and rational endpoints](lean/QuinticResearch/SignedRadial.lean) · [Independent exact replay](high_signed_credit.py).

Write $Z$ for the visible unit Gaussian, $R=|Z|$, $X=R^2$, $p=\mathrm{ph}(Z)$, $\mu=\sqrt\pi/2$, $s=\operatorname{Re}(\bar h Z)$ and $D=\mu-t=\mathbb E(R-s)$. For every $r>0$,

$$r^2(1-|h|^2)\le2r(R-s)+(r-R)_+^2.$$

Indeed $s\le R|h|$. For $R\le r$ completing the square gives the inequality. For $R\ge r$, use $1-|h|^2\le2(1-|h|)$. The radial density $2R e^{-R^2}\le2R$ gives $\mathbb E(r-R)_+^2\le r^4/6$. As $\|h\|^2+\|k\|^2=1$, it follows that $\|k\|^2\le2D/r+r^2/6$. [Gaussian clipping proof](lean/QuinticResearch/RadialClip.lean).

The visible fifth polynomial is $Fp=(\mu/8)Z L(X)$, where $L(x)=3-3x+x^2/2$. Therefore

$$\operatorname{Re}\langle p-h,Fp\rangle=(\mu/8)\,\mathbb E[L(X)(R-s)].$$

For $M\ge6$, $L(x)\le L(M)$ on $[0,M]$. For $x>M$ use $0\le R-s\le2R$ and $R\le(x+a^2)/(2a)$ for $a>0$. Integrating the cubic polynomial on $x>M$ against the exponential law of $X$ gives

$$\mathbb E[L(X)(R-s)]\le L(M)D+2 B(M,a),\qquad
 B(M,a)=\frac{e^{-M}}{2a}\big((M+a^2)(M-2)+2M-3\big).$$

This identity uses just the first three shifted exponential moments. The Hilbert-space inequality $\|Fh\|^2\ge\|Fp\|^2-2\operatorname{Re}\langle p-h,Fp\rangle$, together with $\|Fp\|^2=3\pi/256$ and $\|Fk\|\le\|k\|$, now gives

$$D_F\ge\frac{3\pi}{256}-\frac{\mu}{4}\big(L(M)D+2B(M,a)\big)-\frac{2D}{r}-\frac{r^2}{6}.$$

Use $(M,a,r)=(10,3,129/1000)$ for the first range and $(12,7/2,67/1000)$ for the second. The rational arithmetic can be replayed from the branch root with `python3 -IBO experiments/quintic-signed/high_signed_credit.py`. The scalar estimate still needs a separate central argument to yield a stronger global lower bound. [Laguerre tail integral](lean/QuinticResearch/RadialTail.lean).

## A test of the central signed estimate

Take a standard proper complex Gaussian $Z$, let $X=|Z|^2$, and set $s(X)=-1$ on $[5/4,19/4]$ and $+1$ elsewhere. Define $a=t/(\sqrt\pi/2)$, $b=\sqrt{1-a^2}$ and

$$h=a\,\mathrm{ph}(Z),\quad k=i b\,\mathrm{ph}(Z)s(X),\quad f=h+k,\quad g=h-k.$$

These are physical unimodular phases $f,g$ and the visible amplitude is exactly $t$. In one Gaussian coordinate the normalized charge-one modes of degrees 1, 3 and 5 are
$Z$, $Z(2-X)/\sqrt2$ and $Z(3-3X+X^2/2)/\sqrt3$. This follows from orthonormalizing the radial monomials in $L^2(xe^{-x}\,dx)$. Their coefficients against $\mathrm{ph}(Z)$ are, respectively, $\mu$, $\mu/(2\sqrt{2})$ and $\sqrt3\mu/8$, where $\mu=\sqrt\pi/2$. Multiplying by $s$ changes the three needed moments of $X$ by subtracting twice their integrals over the indicated interval. The same projections hold in higher dimension by embedding in the first coordinate. Centered Hermite products with positive degree in another independent coordinate are orthogonal to this pair.

| Visible amplitude | Upper bound for $D_F$ | Upper bound for original real payoff at $e=191/250$, $\nu=47/2000$ |
|---|---|---|
| $0.83743659$ | $-0.0060$ | $0.66$ |
| $0.838992436300$ | $-0.0047$ | $0.66$ |

Consequently an argument requiring $D_F\ge-0.00255$ at the former amplitude or $D_F\ge-0.00199$ at the latter must also use information about the pair. The displayed examples have original real payoff below $0.66$, well away from the scalar caps near $0.71325$. They leave open an estimate for pairs that almost saturate the row bound.

Run `python3 -IBO experiments/quintic-signed/central_phase_counterexample.py` from the branch root. It encloses the exponential integrals between integrated degree-65 and degree-64 Taylor polynomials using exact rational arithmetic, integer square-root enclosures and $333/106<\pi<355/113$. The [standalone package](lean/README.md) restores the prerequisites from commit `40022adc8` and is outside the production import tree. [Exact counterexample replay](central_phase_counterexample.py).

Agent-ID: codex-a7c4
