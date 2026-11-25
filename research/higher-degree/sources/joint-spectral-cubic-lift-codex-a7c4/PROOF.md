# Fourth excess and spectral mass for the same cubic response

Agent-ID: codex-a7c4. Paper proof and rational replay, author only. This addresses [P3, issue #628](https://github.com/agalatan/grothendieck-lean/issues/628).

For $S=P_{1,0}-eP_{2,1}+\eta P_{3,2}$ with $e=39/50$ and $\eta=779/10000$, write $V=\operatorname{Re}\langle f,Sg\rangle$, $h=(f+g)/2$, $k=(f-g)/2$, $t=\|P_{1,0}h\|_2$. In every finite complex Gaussian dimension, every unimodular pair satisfies $V<500/701$ in the following ranges.

| Cubic radius input | Restriction on the fourth excess of $P_{2,1}k$ | Certified $t$ through |
|---|---|---:|
| $2287/2500$ | All cubics | $0.36495$ |
| $4571/5000$ | All cubics | $0.36733$ |
| $2287/2500$ | $s\le4$ | $0.40$ |
| $2287/2500$ | $s\le 9/4$ | $0.42$ |
| $2287/2500$ | $s\le1$ | $0.44$ |
| $2287/2500$ | $s\le1/4$ | $0.45$ |

The first radius has an independent paper and arithmetic review. The ledger labels the stronger radius author-checked on paper with independently replayed arithmetic. All rows here use the elliptic support inequality of #660. The global mass inequality alone combined with that lift reached $0.35859076$ and $0.36096350$. This proof keeps the fourth excess of the actual projected cubic in both the lifted radius and the mass bound. There is no assumption on the Gaussian coordinates it shares with $P_{1,0}h$. [Cubic radius and linear excess estimate, ledger 3.7](../../../conjecture-K/STATUS.md) · [Elliptic support proof at the checked revision](../cubic-carrier-ellipse-codex-a7c4/ELLIPTIC.md)

## The fourth moment of the lifted field

Rotate coordinates so $P_{1,0}h=tz$, where $z$ is a standard complex Gaussian. Write $U=P_{2,1}k$, $A=\|U\|_2^2$ and $K=\|k\|_2^2$. When $A>0$, set $Q=U/\sqrt A$, $s=\mathbb E|Q|^4-2$ and $y=\sqrt s$. The cubic moment bounds give $0\le s\le42$. The case $A=0$ is covered by the small-energy estimate below.

Let $a=179/200$, $b=\sqrt{1-a^2}$ and $M=aX+ibY$ with $X,Y$ independent real standard normals, independent of the original coordinates. Write $r=\mathbb E M^2=2a^2-1$, so $\mathbb E|M|^2=1$ and $\mathbb E|M|^4=2+r^2$. The elliptic support inequality with $c=431/500$ gives, at $d=ct$,

$$ A+d^2\le\mathbb E|W|,\qquad W=U+d zM,\qquad\mathbb E|W|^2=A+d^2. \tag{1}$$

Indeed its pointwise inequality is $c\operatorname{Re}(\bar Z h)+\operatorname{Re}(\bar Gk)\le\mathbb E_M|ZM+G|$; take $Z=dz$, $G=U$ and integrate. We may apply both the global cubic radius and the linear fourth-excess estimate to $W$. To verify this for the fourth moment, replace $X,Y$ by independent copies of $(2n)^{-1/2}\sum_{j=1}^n(|v_j|^2-|w_j|^2)$ on fresh complex Gaussians. Multiplying each such charge-zero quadratic by $z$ gives an actual $H_{2,1}$ cubic. These real quadratics have variance one and fourth moment $3+3/n$ by expanding independent centered Laplace summands. Their joint law converges to $(X,Y)$ and the fixed second moment of the resulting field gives uniform integrability for its first absolute moment. Its fourth moment converges by expansion and independence, since the auxiliary moments through order four converge. The variance does not change. Applying the cubic bounds before taking this limit proves

$$ A+d^2\le\min\big\{\rho^2,\; (\pi/4)(1+\gamma s_W)^2\big\},\qquad \gamma=26449/5000000,\qquad s_W=\frac{\mathbb E|W|^4}{(A+d^2)^2}-2. \tag{2}$$

The dependence of $s_W$ on the original cubic can be controlled with two second-chaos projections. Write $u=\|\Pi_2(|Q|^2-1)\|_2$, $v=\|\Pi_2(Q^2)\|_2$, where $\Pi_2$ projects onto total real Gaussian degree two (extended complex-linearly). The circular cubic quartic identity implies $4u^2+2v^2\le3s$. Since $|z|^2-1$ and $z^2$ belong to this chaos and have norms $1$ and $\sqrt 2$, respectively,

$$ \mathbb E[(|z|^2-1)|Q|^2]\le u,\qquad |\mathbb E[z^2\overline Q^2]|\le\sqrt2\,v. $$

The linear combination of these pairings in the expansion of $|W|^4$ is bounded by $4u+2r\sqrt2\,v\le2\sqrt{3(1+r^2)}\,y$ by Cauchy–Schwarz. More explicitly, the mixed numerator in the fourth excess is $Ad^2\{4\mathbb E[(|z|^2-1)|Q|^2]+2r\operatorname{Re}\mathbb E[z^2\overline Q^2]\}$. The odd powers of $M$ integrate to zero by symmetry. Using $\mathbb E|z|^4=2$ and $w=d^2/(A+d^2)$, this gives

$$ s_W\le (1-w)^2y^2+2\sqrt{3(1+r^2)}\,y\,w(1-w)+2(1+r^2)w^2. \tag{3}$$

This calculation needs no independence between $Q$ and $z$. [Lean quartic identity and influence inequality](../../../../Grothe/LowerAnalytic/Influence.lean)

## The spectral mass inequalities before taking a supremum

Use the existing mass parameters $\hat e=25/31$ and $m=2141/3906$. For each of the 24 checked witnesses $j$ let $p_j=4\tau_j/3$ and let $(a_0,0,a_2,a_4,a_6)$ be its stored polynomial coefficients. The Lean witness theorem gives

$$\mathbb E\phi_m(p_j|Q|)\le J_j(y)=a_0+a_2+a_4(2+y^2)+a_6(6+9y^2+C_6y^3),\qquad C_6=4045313/100000.$$

Here $\phi_m(R)=\max_{0\le b\le1}(2\hat e Rb-m b^2)$. For the actual normalized projection $Q$, the law of $|Q|^2$ satisfies the required moment and Stein hypotheses by `gaussian_moments`, `gaussian_gramInputs` and `steinCut_of_inputs`, as in the [Gaussian mass-row reduction](../../../../Grothe/LowerAnalytic/MassRowFrame.lean). Thus each individual checked witness applies to this law. The witness's source cell identifies where it was chosen for the global cover. Its theorem `massWit_tb` has no hypothesis restricting $y$ to that cell. `massPot` in the Lean theorem scales its argument by $4/3$, accounting for the factor in $p_j$. All 24 witnesses have zero linear coefficient and nonnegative $a_6$. [Witness theorem](../../../../Grothe/Lower/MassWitness.lean) · [Kernel-checked witnesses](../../../../Grothe/Lower/Cert/MassWitnesses.lean) · [Witness data](../../../../Grothe/Lower/MassWitnessData.lean) · [Mass potential](../../../../Grothe/Lower/MassPotential.lean) · [Polynomial expectation](../../../../Grothe/Lower/Moment.lean)

Since $|k|\le1$ and $\operatorname{Re}\langle Q,k\rangle=\sqrt A$, the defining supremum gives

$$ mK\ge 2\hat e p_j\sqrt A-J_j(y)\qquad\text{for every }j. \tag{4}$$

The same $y$ appears in (3) and every inequality (4). Orthogonal projection and $\|h\|^2+K=1$ give $\|P_{3,2}h\|^2\le1-K-t^2$. Dropping the three nonpositive terms of $\langle h,Sh\rangle-\langle k,Sk\rangle$ gives

$$ V\le\eta+(1-\eta)t^2+eA-\eta K. \tag{5}$$

The argument takes the largest applicable lower bound (4) on $K$. The radius of the lifted field separately constrains $A$ through (2) and (3).

## Rational cover and controls

Run from the repository root:

```sh
python3 -IB research/higher-degree/code/joint-spectral-cubic-lift-codex-a7c4/verify.py
```

The replay reads the witness scales and polynomial coefficients directly from the checked Lean data. On the initial interval it checks the existing elliptic bound from (2) with the global mass inequality $\hat e A-mK\le S_{\rm mass}$. For $A\le11/20$, (5) and $K\ge A$ already suffice at every stated endpoint. The remaining two-dimensional cover uses $t\in[t_0,t_1]$, $y\in[y_0,y_1]$ with $A\ge11/20$. Starting with $A\le A_1=\rho^2-c^2t_0^2$, bound $w$ between $c^2t_0^2/(A_1+c^2t_0^2)$ and $c^2t_1^2/(11/20+c^2t_1^2)$. The right side of (3) increases in $y\ge0$ at fixed $w\in[0,1]$. Its maximum as a quadratic in $w$ at $y_1$ follows from its endpoints and any interior maximum. Inserting this in (2) gives a tighter $A_1$ whenever the fourth-excess bound helps.

For (4) the maximum of $J_j$ on a $y$ interval occurs at an endpoint: the nonconstant terms are $B y^2+D y^3$, $D\ge0$, so an interior critical point at $y>0$ can only be a minimum. For $A\ge11/20$, $eA-(\eta/m)2\hat e p_j\sqrt A$ increases in $A$ for every stored scale, as the verifier checks. The payoff upper bound thus uses $A_1,t_1$ and the largest applicable lower bound on $K$ at that energy. A box whose bound is too large is bisected; both closed children must pass. Directed square roots and every comparison use integers or rational numbers. The full range $y\le\sqrt{42}$ is covered by $[0,13/2]$.

Two negative controls use $t=0.36$, $A=0.7405$. At $y=1.27$, $K=0.790$ the global ellipse and all 24 spectral cuts pass, while (5) exceeds the target. At $y=3$, $K=0.788$ the global mass cut and the fourth-excess cut pass, while (5) again exceeds it. These are obstructions to dropping one of the two restrictions in this relaxation. Neither control asserts that an actual pair realizes its four scalar inputs.

The unrestricted middle of P3 above the stated endpoints is open. These payoff estimates do not change the formal bounds for the Grothendieck constant.
