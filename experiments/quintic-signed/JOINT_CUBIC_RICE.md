# One Rice budget for all physical cubic projections

Let $f,g$ be disk-valued in any finite complex Gaussian dimension. Set
$h=(f+g)/2$, $k=(f-g)/2$ and choose a standard proper complex Gaussian
coordinate $Z$ along the first projection of $h$. If that projection vanishes,
choose any unit coordinate. Put $t=\operatorname{Re}\langle Z,h\rangle$ and
$\mu=\mathbb E|Z|=\sqrt\pi/2$. Split the cubic projection of $k$ by visible
Hermite degree in $Z$. Write $\tau$ for its norm at degree zero, $\rho_o$ for
the norm in degrees one and three together, and $\rho_e$ for the norm at degree
two. All remaining variables are independent of $Z$. Then
\[
 \boxed{\tau^2+\tfrac{11}{25}\rho_o^2+\tfrac{11}{50}\rho_e^2
                  \le 2\mu(\mu-t).}
\]
The three squares sum to the full cubic energy. For example, the nonremote
energy is at most $(2\mu(\mu-t)-\tau^2)/.22$.
The bound applies to the same pair as the [mixed fifth projection test](FORCED_MIXED_FIFTH.md).

## Odd and even Gaussian probes

Every cubic test splits as $X+V_o+V_e$, with $X$ a fresh cubic, and
\[
 V_o=A Z+B\bar Z+C Z(T-2)/\sqrt2,\qquad
 V_e=U(T-1)+V Z^2/\sqrt2,\quad T=|Z|^2.
\]
Here $A,B$ are fresh quadratics, $C$ is constant, and $U,V$ are fresh
linear or conjugate-linear polynomials. Some spaces can be empty.
These visible Hermites are orthonormal. In particular, integrating over
the fresh variables $Y$ gives
$\mathbb E(\bar X U)=\mathbb E(X V)=0$, by orthogonality of degrees one and
three. Write $b_o^2=|A|^2+|B|^2+|C|^2$ and $b_e^2=|U|^2+|V|^2$.

The disk constraints give
$t+\operatorname{Re}\langle X+V_o+V_e,k\rangle\le
\mathbb E(|Z+X+V_o+V_e|+|Z-X-V_o-V_e|)/2$.
Condition on $Y$ and write $x=X(Y)$. Reflecting $Z$ in the second term gives
the two shifts about $Z+x$ by $V_e+V_o$ and $V_e-V_o$. For $z\ne0$,
\[
 |z+v|\le |z|+\operatorname{Re}(\overline{\operatorname{ph}z}\,v)+|v|^2/(2|z|).
\]
Averaging this inequality cancels the odd first variation and the odd-even
cross term in the quadratic cost. To bound that cost, observe that a
nonnegative density of total mass one bounded by $1/\pi$ satisfies
$\int |z+x|^{-1}p(z)\,dz\le2$. Indeed,
$1/r\le1+(1/r-1)_+$ and integrating the positive part over the unit disk
costs at most one. Applied separately to the normalized densities
$e^{-T}|V_o|^2/(\pi b_o^2)$ and $e^{-T}|V_e|^2/(\pi b_e^2)$, this prices
the quadratic terms by $b_o^2+b_e^2$. Zero coefficient norms contribute zero.

For completeness, Cauchy–Schwarz bounds $|V_o|^2/b_o^2$ by
$2T+T(T-2)^2/2$, and $|V_e|^2/b_e^2$ by $(T-1)^2+T^2/2$.
Both are at most $e^T$. For the even polynomial the third Taylor lower
bound for $e^T$ leaves $T(3-T+T^2/6)\ge0$. For the odd polynomial the
fourth Taylor lower bound leaves
$(1-3T/2+T^2/12)^2+T^2(5T^2-12T+12)/144\ge0$.

## Spending the gap in the shifted Gaussian mean

Set $y=|x|^2$, $m(y)=\mathbb E_Z|Z+x|$, and
$D(y)=\mu(1+y/2)-m(y)$. The following positive measure represents the mean:
\[
 m(y)-\mu=\int_0^1(1-e^{-uy})\,d\sigma(u),\qquad
 d\sigma(u)=\frac{u^{-3/2}(1-u)^{1/2}}{2\sqrt\pi}\,du,\qquad
 \int u\,d\sigma=\mu/2 .
\]
Indeed, integrate $1-e^{-t|Z+x|^2}$ against
$t^{-3/2}dt/(2\sqrt\pi)$, complete the Gaussian square, and substitute
$u=t/(1+t)$. Subtracting the formula at zero gives the displayed expression.
It follows that $D(y)=\int(e^{-uy}-1+uy)d\sigma\ge0$.
Every differentiated integral here is absolutely convergent.
Integration of the derivative of
$u^{1/2}(1-u)^{3/2}e^{-yu}$, whose endpoint values vanish, yields
$y m'''+(2+y)m''+m'/2=0$.

Gaussian translation gives $\mathbb E_Z\operatorname{ph}(Z+x)=2xm'(y)$.
The normalized even Hermite expectations
$\mathbb E_Z[(T-1)\operatorname{ph}(Z+x)]$ and
$\mathbb E_Z[\bar Z^2\operatorname{ph}(Z+x)]/\sqrt2$ equal
$x g(y)$ and $\bar x g(y)/\sqrt2$, respectively. To see this, apply
$\partial_x\partial_{\bar x}$ and $\partial_x^2/\sqrt2$ to $2xm'(y)$:
the derivatives of the translated Gaussian density are its indicated
Hermites, so no derivative of the phase at zero is required. This gives
$g=4m''+2ym'''=-m'-2ym''$. Hence $g(0)=-\mu/2$ and
$g(y)-g(0)=D'(y)+2yD''(y)$.

For $a\ge0$ one has
\[
 a(1-e^{-a}+2ae^{-a})^2\le6(e^{-a}-1+a).
\]
For $a\le1/8$ use $1-e^{-a}+2ae^{-a}\le3a$ and
$e^{-a}-1+a\ge a^2/2-a^3/6$. For $a\ge8$ use
$ae^{-a}\le8e^{-8}$ and $a-1\ge7a/8$. The
[exact derivative check](code/joint_cubic_rice.py) covers the closed middle
interval in cells of width $1/256$ by monotone exponential bounds.
Weighted Cauchy–Schwarz with weights $u\,d\sigma(u)$ now gives
\[
 y(D'(y)+2yD''(y))^2\le
 \Big(\int u\,d\sigma\Big)\int uy(1-e^{-uy}+2uy e^{-uy})^2d\sigma
 \le 3\mu D(y).
\]
The terms of the even first variation involving $g(0)$ integrate to zero by
the fresh linear-cubic orthogonality above. For the remainder the
squared norm of the two coefficients is
$3y(g(y)-g(0))^2/2\le9\mu D(y)/2$.
Thus its real pairing with $(U,V)$ costs at most
$D(y)+(9\mu/8)b_e^2$ by the scalar square inequality. Combined with $m(y)$,
this leaves $\mu(1+|x|^2/2)$.

Integrating over $Y$ proves, for every test,
\[
 t+\operatorname{Re}\langle X+V_o+V_e,k\rangle
 \le \mu+\frac\mu2\|X\|^2+\|V_o\|^2+(1+9\mu/8)\|V_e\|^2.
\]
Optimize the three scalings independently in the three true projection
directions. The exact weights in the boxed bound are available up to
$\mu/2$ on $\rho_o^2$ and $\mu/(2+9\mu/4)$ on $\rho_e^2$. They exceed
$.44$ and $.22$. The argument also covers a vanishing projection.

## Signed fifth transfer

In the [tilted radial estimate](BERNSTEIN_TILTED_ENDPOINT.md), write
$\beta=e+\nu$. Pay $\gamma$ of the remote cubic energy in its angular block.
The joint estimate pays for the remaining coefficients by replacing $\beta$
in the ordinary odd and even trace numerators with
$\beta-.44(\beta-\gamma)$ and $\beta-.22(\beta-\gamma)$. The same even
coefficient multiplies the squared shift in the visible $(1,0)$ row.
The conditional Gaussian fifth test and the remaining fifth-only blocks are
retained. With $s=.273$, $\gamma=.3655$, $u=1$, and effective fifth debit
at most $.0001$, the five 128-chord trace ceilings are
$.80019364,.68781680,.99842245,.98061174,.99948787$.
The residual for the true all-amplitude price becomes $\beta-\gamma-s=.149$.

The earlier crossover uses the physical fifth floor $.023$ for $t\ge .88575$.
Indeed [the visible fifth tangent and phase clip](lean/QuinticResearch/SignedRadial.lean)
with clipping radius $7/50$ give
\[
 \Delta_5\ge3\pi/256-(\mu/4)\{(61/2)(\mu-t)+199/177000\}
                  -(100/7)(\mu-t)-49/15000.
\]
Substitution of $\mu<.886227$ and $\pi>3.141592$ gives the stated floor.

With first-chaos weight $.0000733823$ and fifth debit $10^{-8}$, the complete
57-piece scalar cap is $7132537799728/10^{13}$, giving a signed reciprocal
**greater than 1.40202551753**. Both zero-debit scalar prices at that weight
exceed the signed cap at $t=.885773796896554$. At weight $.0000733496$
the retuned zero-debit cap is $7132537778673/10^{13}$, giving the stronger
**1.40202552167**. These numbers compare the certificates. The all-amplitude
joint projection bound and this transfer have analytic proofs and rational
replays. The joint physical proof still requires a Lean implementation.

At $t\ge.83835$ and $\tau\ge.285$, the total nonremote cubic energy is
below $.0166$ and the full cubic energy is below $.0979$. For the full energy
bound use $2\mu(\mu-t)/.22-(1-.22)\tau^2/.22$, which decreases with $\tau$.
These estimates hold simultaneously with the forced mixed fifth
energy on the same pair.

[Repricing the central sparse intervals](REPRICED_SIGNED_ENDPOINT.md) independently gives a stronger global signed certificate on a different schedule.

Run the following command from the repository root.

```sh
python3 -IB -O experiments/quintic-signed/code/joint_cubic_schedule.py
```

Agent-ID: codex-a7c4
