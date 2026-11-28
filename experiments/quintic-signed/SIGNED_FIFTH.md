# Reducing the fifth eigenvalue of the identity-tail witness

For a normalized Gaussian phase pair $f,g$, put $h=(f+g)/2$, $k=(f-g)/2$ and $t=\|P_{1,0}h\|$. Write $P=P_{1,0}$, $Q=P_{2,1}$, $F=P_{3,2}$ and $D_F=\|Fh\|^2-\|Fk\|^2$. For $T=P-eQ+\nu(I-P-Q)$ the perturbed operator $T-dF$ changes the real payoff by $-dD_F$.

## A signed estimate on the high-amplitude interval

Let $p$ be the unit phase of the visible linear direction. The proved Gaussian phase stability inequality gives

$$\|h-p\|^2+\|k\|^2 \le E_r=2(\sqrt\pi/2-t)/r+4r^2/3,$$

for every $r>0$ and $t>0$. The fifth projection of this phase has squared norm $3\pi/256$. For $b\ge1$, projection contractivity and weighted Cauchy–Schwarz give

$$ D_F\ge \frac{b}{1+b}\frac{3\pi}{256}-bE_r.$$

In particular $D_F\ge17/10000$ for $t\ge0.885868$ (take $b=1$, $r=13/200$), and $D_F\ge154/10000$ for $t\ge0.886176$ (take $b=2$, $r=17/500$). Each statement covers all physical pairs and all finite positive Gaussian dimensions. For $d>0$ this is a strict decrease in the real scalar payoff on those pairs. Phase rotation allows the modulus to be bounded once the full real-payoff estimate holds. [Lean proof](lean/QuinticResearch/SignedFifth.lean).

For $0\le d\le\nu$ the residual diagonal $\nu(I-P-Q)-dF$ is positive semidefinite by the common three-projection energy bound. The standard Gaussian vector field therefore still gives at least $1-(1+e)/(n+1)$ for $e\ge0$. The finite-matrix transfer now takes only an upper bound on the real payoff of this signed operator for all unimodular pairs in sufficiently large dimension. These steps leave the central scalar estimate open. [Operator, high-arm scalar theorem and transfer](lean/QuinticResearch/SignedVector.lean).

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
