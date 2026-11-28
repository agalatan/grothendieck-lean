# Four upper bounds for the full fifth-energy difference on a physical pair

Let $h=(f+g)/2$, $k=(f-g)/2$ for disk-valued responses on a finite complex Gaussian space. Align a visible standard coordinate $Z$ with the first projection of $h$, put $t=\operatorname{Re}\langle Z,h\rangle$, and let $\tau>0$ be the norm of the purely remote cubic projection of $k$. Write $q$ for its unit direction. Set $F=P_{3,2}$ and $\Delta=\|Fh\|^2-\|Fk\|^2$. For $s=.83835-t+.34(.28898-\tau)$ the following four estimates hold simultaneously:
$$
 \Delta\ \le\ \min\{- .0002883+145.50s,\quad
 .0015237+76.22s,\quad .0062598+41.57s,\quad .0162549+24.25s\}.
$$
In particular, $t\ge.83835$ and $\tau\ge.28898$ force $\Delta<-.00028$. At $t\ge.83835$, $\tau\ge.287$ the bound is $\Delta<.03259$. These estimates include all fifth components of the half-sum and half-difference. They apply to the positive fifth increment, whose added payoff is its coefficient times $\Delta$.

The relaxed slice has physical examples. Take $q_N$ to be the normalized sum of $N$ independent products $A_i B_i\bar C_i$ of three independent standard Gaussian coordinates. It tends in law to a standard proper complex Gaussian $W$. With $a=137/400$ use the two phases of $Z\pm a q_N$. The visible correlation and the correlation with $q_N$ converge to $\mu/\sqrt{1+a^2}$ and $a\mu/\sqrt{1+a^2}$, where $\mu=\sqrt\pi/2$. Both exceed their respective thresholds $.83835$ and $.287$ strictly. The limit follows by conditioning in the jointly Gaussian pair and convergence of the phase pairings. The zero sets have measure zero and the uniformly bounded second moments give uniform integrability. Independent phase rotations within each product fix $q_N$ and kill every individual remote first projection, so $Z$ is the aligned coordinate. The remote cubic projection norm dominates the tested correlation. The [sixth-moment Rice upper bound](SIXTH_RICE_SUPPORT.md) proves the narrower negative-sign slice empty, since the physical remote norm is below $.287364$ there. The relaxed slice and the global affine estimates remain applicable.

## A support deficit controls the entire fifth projection

Fix $\lambda=.34$, put $M_\pm=Z\pm\lambda q$, and use the two corresponding phases as an exposed pair $f_*,g_*$. Write $h_*,k_*$ for their half-sum and half-difference. With $y=|q|$ and $m(a)=\mathbb E|Z+a|$, the disk support deficit equals
$$
 D=\mathbb E m(\lambda y)-t-\lambda\tau\ge0 .
$$
Its [shifted fifth projection estimate](SHIFTED_FIFTH_STABILITY.md) bounds the sum of both squared projection errors by $4\sqrt3D$. Let $J$ be the span of $(|Z|^2-1)q$ and $Z^2\bar q/\sqrt2$; these are orthonormal physical fifth modes. If $H\ge\|Fh_*\|^2$ and $L\le\|P_Jk_*\|^2$, Young's inequality on the cross terms gives, for $0<\eta<1$,
$$
 \Delta\le(1+\eta)H-(1-\eta)L+4\sqrt3(1+1/\eta)D.
$$
Here one expands the two squared norms using $Fh$ and $P_Jk$ before discarding the remaining negative terms of $Fk$.

## Conditional Hermite coefficients

For a real shift $a\ge0$, let $c_{ij}(a)$ be the coefficient of $\mathrm{ph}(Z+a)$ on the normalized visible Hermite $H_{ij}/\sqrt{i!j!}$. For complex shifts it acquires the angular factor $\exp(i(1+j-i)\arg a)$. Writing $x=|a|^2$ gives
$$
 \mathbb E\mathrm{ph}(Z+a)=aG(x),\qquad
 G(x)=\pi^{-1/2}\int_0^1 v^{-1/2}(1-v)^{1/2}e^{-xv}\,dv .
$$
This integral follows by writing $1/r$ as the Laplace integral of $e^{-u r^2}/\sqrt{\pi u}$, completing the Gaussian square, and substituting $v=u/(1+u)$. Differentiation of the shifted Gaussian density gives $c_{ij}=\partial_a^i\partial_{\bar a}^j(aG)/\sqrt{i!j!}$. Thus on the positive real axis
$$
 c_{ij}(a)=\frac{1}{\sqrt{i!j!}}\sum_{k=0}^{\min(i,j+1)}
 {i\choose k}\frac{(j+1)!}{(j+1-k)!}\,
 a^{i+j+1-2k} G^{(i+j-k)}(a^2).
$$
In particular $m(a)=(1+x)G(x)+xG'(x)$, obtained by pairing $\mathrm{ph}(Z+a)$ with $Z+a$.

Only odd visible total degrees occur in $h_*$. Project each visible coefficient onto its complementary remote chaos. For $(1,0)$ and $(2,1)$ that chaos is orthogonal to constants, so subtract the respective constants $M_1=.83748$, $M_3=-.26331$ before bounding the projection by the coefficient norm. Define
$$
 U(y)=|c_{01}|^2+|c_{12}|^2+|c_{30}|^2+|c_{32}|^2+
       |c_{10}-M_1|^2+|c_{21}-M_3|^2 ,
$$
with all coefficients evaluated at $a=\lambda y$. Orthogonality then gives $H=\mathbb E U(y)$. For $k_*$ the visible degrees are even. Since $c_{20}=c_{11}/\sqrt2$ on the positive ray and their angular factors are conjugate, the two coefficients tested against $q$ and $\bar q$ give
$$
 \|P_J k_*\|^2=\tfrac32(\mathbb E[-y c_{11}(\lambda y)])^2
 \ge\mathbb E V(y),\qquad
 V(y)=\tfrac32(2M_K[-y c_{11}(\lambda y)]-M_K^2),\quad M_K=.13637.
$$

## Exact scalar check

For $t_0=.83835$, $\tau_0=.28898$ and each row of the table, the replay checks for every $y\ge0$
$$
 (1+\eta)U(y)-(1-\eta)V(y)+K[m(\lambda y)-t_0-\lambda\tau_0]
       \le A+B y+C y^2 .
$$

| $\eta$ | $K$ | $A$ | $B$ | $C$ |
|---:|---:|---:|---:|---:|
| .05 | 145.50 | −7.25897 | .21969 | 7.05437 |
| .10 | 76.22 | −3.76822 | .09709 | 3.67945 |
| .20 | 41.57 | −2.02130 | .03486 | 1.99514 |
| .40 | 24.25 | −1.14602 | .00193 | 1.16048 |

Each $K$ rounds the coefficient of $D$ upward. The normalized circular remote cubic has $\mathbb E y^2=1$ and $\mathbb E y\le .93$ by the repository's cubic radius theorem. Taking expectations proves the four prices.

For $0\le y\le8$, use the $1/256$ mesh. The integral formula for $G^{(j)}$ and alternating exponential Taylor polynomials through orders 48 and 49 give upper and lower enclosures at each node. All rounding is outward. Between nodes the absolute second derivative of the difference of the two sides is at most 160. Indeed $|c_{ij}|\le1$ by Bessel, and a real shift differentiates $c_{ij}$ into $\sqrt{i+1}c_{i+1,j}+\sqrt{j+1}c_{i,j+1}$. For $i\le3$, $j\le2$ this gives first and second bounds of $4\lambda$ and $16\lambda^2$ in $y$. Also $|m''(a)|\le\mathbb E|Z+a|^{-1}\le2$ by the same disk-density bound applied to the constant function. The norm's distributional second derivative is locally integrable in two dimensions, so convolution with the Gaussian justifies this derivative at every shift. The replay verifies the resulting second-derivative budgets and the $160/(8\cdot256^2)$ interpolation margin explicitly. For $y\ge8$, Bessel on the six coefficients gives $U(y)\le(1+\sqrt{M_1^2+M_3^2})^2\le4$. The other terms use $|c_{11}|\le1$ and $m(\lambda y)\le\mu+\lambda y$. Each quadratic dominates this affine upper bound at 8 and has larger slope thereafter.

From the repository root run `python3 -IB -O experiments/quintic-signed/code/full_fifth_planes.py`.

Agent-ID: codex-a7c4
