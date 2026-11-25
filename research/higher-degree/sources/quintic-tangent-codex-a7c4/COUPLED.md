# A sharp simultaneous tangent for the cubic and quintic fields

Agent-ID: codex-a7c4. Paper proof and rational replay, author only.

For the capped game $S=P_{1,0}-eP_{2,1}+\eta P_{3,2}$, $e=39/50$, $\eta=779/10000$, every unimodular pair with $0.88425210\le t=\|P_{1,0}((f+g)/2)\|_2\le\sqrt\pi/2$ satisfies $\operatorname{Re}\langle f,Sg\rangle<500/701$. The estimate is uniform in dimension and allows arbitrary remote cubic energy. It extends the endpoint $0.88477644$ in [the first tangent proof](PROOF.md). The interior near $t=0.848$ remains open.

## A simultaneous pointwise bound

Let $X,H,G$ be complex numbers, $r=|X|>0$, $p=X/r$, $A\ge1$ and $a=A/(2A-1)$. Then

$$
 |X+H+G|+|X+H-G|
 \le 2r+2\operatorname{Re}(H\bar p)
 +\frac{A|H|^2+a(\operatorname{Re}(G\bar p))^2+(\operatorname{Im}(G\bar p))^2}{r}. \tag{1}
$$

After rotating and scaling take $X=1$. Dualize the moduli with two unit complex numbers $v_+,v_-$, and set $h=(v_++v_-)/2$, $k=(v_+-v_-)/2$. This gives $h=s e^{i\theta}$ and $k=\pm i\sqrt{1-s^2} e^{i\theta}$ with $0\le s\le1$, including the endpoints by choosing the phase appropriately. Put $x=\cos\theta$. The supremum over $H$ of $2\operatorname{Re}\big((\bar h-1)H\big)-A|H|^2$ is $|1-h|^2/A$. Maximizing separately over the real and imaginary parts of $G$ contributes $(\operatorname{Re}k)^2/a+(\operatorname{Im}k)^2$. The desired inequality is now

$$2(\operatorname{Re}h-1)+|1-h|^2/A+(\operatorname{Re}k)^2/a+(\operatorname{Im}k)^2\le0.$$

Its left side equals $(1-1/A)[(1-s^2)(1-x^2)-(1+s^2-2sx)]$. The negative of the bracket is $(s-x)^2+s^2(1-x^2)\ge0$. This proves (1). At fixed $A$ the two coefficients for $G$ are separately best possible. With $h=0$, $k=1$, the dual inequality forces $1/a\le 2-1/A$. With $h=s$, $k=i\sqrt{1-s^2}$ and $s\uparrow1$, the coefficient on $(\operatorname{Im}G)^2$ must be at least one. Thus (1) accounts directly for the pointwise relation between the half-sum and half-difference of two phases.

## Application to the game

Use the first proof's weighted estimate and square-completion reduction, retaining its tilted quintic multiplier. Write $T=|z|^2$, $\mu=\sqrt\pi/2$, $c=\eta\mu/16$, $g(T)=\ell-2\beta+6c+(\beta-6c)T+cT^2$, $X=zg(T)$, $H=G_5-G_*$ and $q=\mathbb E[G_3\mid y]$. Take

$$\ell=1.28353,\qquad\beta=0.171585,\qquad A=7.4564,\qquad b_A=-0.05314,\qquad b=-0.00687.$$

In the notation of [the first proof](PROOF.md), choose $b_B=\sqrt2 b$ and $\xi=0$, so $C=b_A(T-1)q+bz^2\bar q$ and $\|C\|^2=(b_A^2+2b^2)\|q\|^2$. In (1) insert $G=G_3-C$ and $r=\sqrt T\,g(T)$. Both the constant and the term linear in $H$ are exactly those in the first proof, so the latter cancels the cross term in the quintic penalty. The squared quintic form now has coefficient $A$. Put $w=1/r$ and $q'=q\overline{\operatorname{ph}(z)}$. The tilted remote-cubic component, after rotation by $\overline{\operatorname{ph}(z)}$, is

$$ [1+b_A-b_A T] q'-bT\overline{q'}.$$

The two real components have multipliers $1+b_A+(-b_A-b)T$ and $1+b_A+(-b_A+b)T$. Each cross term of this field with the other visible cubic components integrates to zero. Indeed $q$ and $\bar q$ have remote total degree three, while all those components and their conjugates have remote degree at most two. The uniform angle of $z$, independent of $q$ and $T$, gives equal squared real and imaginary expectations $\|q\|^2/2$. Defining $I(v_0,v_1)=\mathbb E[w(v_0+v_1 T)^2]$, the coefficient on $\|q\|^2$, including the penalty for $C$, is exactly

$$Q_{\mathrm{remote}}=\tfrac12\{aI(1+b_A,-b_A-b)+I(1+b_A,-b_A+b)\}+(b_A^2+2b^2)/\eta.$$

For the other cubic components the anisotropic form is at most the isotropic one since $a\le1$. Remote bidegree orthogonality then diagonalizes it as in the first proof. Let $Q_{\mathrm{other}}$ be the largest diagonal $\mathbb E[w|e_{ij}|^2]$ on these components and $Q_5$ the largest diagonal in the quintic rectangle.

The replay gives

$$ \eta A Q_5<0.99999,\qquad eQ_{\mathrm{remote}}<0.99998,\qquad eQ_{\mathrm{other}}<0.957.$$

Consequently the negative quintic and cubic penalties absorb all the quadratic terms. For clarity, the common enclosure for each diagonal and tilted square uses $g(T)\ge m+dT>0$. Take $m=\ell-2\beta+3\eta\mu_{\rm lo}/8$ and $d=\beta-3\eta\mu_{\rm hi}/8$ with directed rational bounds for $\mu$. For any of the nonnegative polynomial factors $F=|e_{ij}|^2$ or $F=(v_0+v_1T)^2$, write $M_j=\mathbb E[FT^{j-1/2}]/\sqrt\pi$. Under the measure $FT^{-1/2}\,d\mathbb P$ Cauchy–Schwarz gives

$$\mathbb E[w F]\le {2\mu_{\rm hi}\over m}\left(M_0-\frac{d M_1^2}{m M_1+d M_2}\right).$$

For example the subtracted term follows from $(\int T)^2\le(\int T/(m+dT))(\int T(m+dT))$ under that measure. All $M_j$ are rational for the chosen factors. The remaining payoff is bounded by

$$ t^2-2\ell t+2\beta^2/e+2\mu(\ell-\beta/2)+3\eta\mu^2/64.$$

It decreases in $t$ on its physical interval because $\ell>\mu$, and its crossing of $500/701$ is strictly between $0.88425209$ and $0.88425210$. The replay also checks that deleting either the tilt or the real-direction improvement causes the corresponding upper coefficient to exceed the cubic absorption budget on this row. These tests concern the row estimate.

```sh
python3 -IB research/higher-degree/code/quintic-tangent-codex-a7c4/verify_coupled.py
```
