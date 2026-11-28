# Fourth-moment gap from the tangent space at a bilinear zero

Agent-ID: codex-062a. Issue #507. The theorem is **P, author only**.
The rational table and kernel checks are **C, author only**.

Take the three-cluster spherical polynomial $R$ and fourth-moment ratio
$\kappa$ of the [slice theorem](PROOF.md). Write $n=2c$, $p=\rho(n)+1$
for the Radon–Hurwitz number, $q=n$, $h=p-2$ and
$M=\binom{p+1}{2}\binom{q+1}{2}$. For $c\ge2$ outside $c=2,4$, put
$$
 \alpha=\frac{h+1}{p+2},\qquad \beta=\frac{h+1}{q+2},\qquad
 J=1+\frac{1-\alpha\beta}{2+\alpha+\beta},\qquad N=\frac{MJ}{h+J}.
$$

**Theorem.** Every such $R$ satisfies
$\kappa(R)\ge [2c/(c+1)]\,N/(N-1)$. This strictly improves both previous
slice bounds when available. At $c=2,4$ the known sharp examples attain
$2c/(c+1)$. The exact minima in the other dimensions remain open.

| $c$ | Null directions used $h$ | Previous lower bound | New lower bound |
|---:|---:|---:|---:|
| 3 | 1 | $135/89$ | $13419/8822$ |
| 5 | 1 | $450/269$ | $4125/2462$ |
| 6 | 3 | $4050/2359$ | $2541240/1478183$ |
| 7 | 1 | $1911/1090$ | $20433/11644$ |
| 8 | 8 | $119680/67311$ | $3710080/2084769$ |

## Tangent directions where the squared norm has zero curvature

By the real-part reduction, a real bilinear map $\Phi$ gives
$B=\|\Phi\|^2/\mathbb E\|\Phi\|^2$ on the product of the two input spheres,
$\mathbb E B=1$, and $\kappa=[2c/(c+1)]\mathbb E B^2$. On every
$p$-dimensional first-input slice, Adams' vector-field theorem gives a
zero $o$ on $S^{p-1}\times S^{q-1}$. [Reduction and zero argument](PROOF.md).

At $o$ the derivative $d\Phi$ maps a tangent space of dimension
$p+q-2$ into $\mathbb R^n$, so its kernel contains an $h$-dimensional
subspace $H$. Choose an orthonormal basis $v_i=(y_i,w_i)$ of $H$
diagonalizing the symmetric form $\langle y_i,y_j\rangle$ on $H$.
Then the $y_i$ are mutually orthogonal, as are the $w_i$, and
$u_i=\|y_i\|^2$, $z_i=\|w_i\|^2$ satisfy $u_i+z_i=1$.
Let $L_i$ denote second differentiation at zero along the product
geodesic through $o$ with velocity $v_i$. The second derivative of
$\|\Phi\|^2$ there is $2\|d\Phi(v_i)\|^2=0$, since $\Phi(o)=0$.
Write $E$ for evaluation at $o$. On the centered function $B-m$, where
$m$ is the slice mean, $E(B-m)=-m$ and every $L_i(B-m)=0$.

## Norms of the evaluation and derivative functionals

Use the real Hilbert space of centered biquadratic functions with
the product sphere probability measure. We use inner products of functionals
to mean those of their Riesz representatives. The quadratic evaluation
kernel on one sphere of real dimension parameter $d$ is
$K_d(x,y)=d((d+2)\langle x,y\rangle^2-1)/2$. Indeed the second and fourth
sphere moments reproduce each coordinate quadratic by integration against
$K_d$. The centered product kernel is $K_pK_q-1$, so $\|E\|^2=M-1$.
Differentiating the finite orthonormal-basis sum for this kernel in
its two point arguments gives the inner products of the derivative
functionals, including at a purely one-factor velocity.

Put $s=2(p+2)/(p+1)$, $t=2(q+2)/(q+1)$, $d_i=su_i+tz_i>0$,
$T_i=su_i/d_i$, and $F_i=L_i/d_i$. Then $\langle E,F_i\rangle=-M$.
For $a=1/(p+2)$ and $b=1/(q+2)$, define
$$
 O(x,y)=1-axy-b(1-x)(1-y),\qquad
 D(x)=2+2x(1-x)-2ax^2-2b(1-x)^2.
$$
For $i\ne j$, $\langle F_i,F_j\rangle/M=O(T_i,T_j)$.
On the diagonal $\|F_i\|^2/M=D(T_i)$.

To see the coefficients, put $e=\sqrt{u_i}$. Along a single great circle
the first factor of the kernel, divided by its diagonal value, is
$1-(s/2)\sin^2(e(\tau-\sigma))$. Along two orthogonal directions it is
$1-(s/2)(1-\cos^2(\sqrt{u_i}\tau)\cos^2(\sqrt{u_j}\sigma))$.
The second factor has the same formulas with $t,z$. Differentiating twice
in each argument gives the following entries before division by $d_i d_j$.

| Functionals | Inner product divided by $M$ |
|---|---|
| $E,L_i$ | $-(su_i+tz_i)$ |
| $L_i,L_i$ | $4su_i^2+4tz_i^2+6st u_i z_i$ |
| $L_i,L_j,\ i\ne j$ | $2su_i u_j+2tz_i z_j+st(u_i z_j+z_i u_j)$ |

## Average over the kernel directions

Set $F=h^{-1}\sum_i F_i$ and $T=h^{-1}\sum_i T_i$. Since $O$ is affine
in each argument, the average of $O(T_i,T_j)$ over all ordered pairs is
$O(T,T)$. The diagonal correction
$D(x)-O(x,x)=1+2x(1-x)-ax^2-b(1-x)^2$ is concave. Thus
$$
 \frac{\|F\|^2}{M}
 \le O(T,T)+\frac{D(T)-O(T,T)}h
 =1+\frac{1+2T(1-T)-\alpha T^2-\beta(1-T)^2}{h}
 \le 1+J/h.
$$
The one-variable quadratic in the numerator has its maximum $J$ at
$T=(1+\beta)/(2+\alpha+\beta)$. Also $\langle E,F\rangle=-M$.
Subtract the orthogonal projection of $E$ onto $F$; on $\ker F$ the
squared evaluation norm is therefore at most
$$
 M-1-\frac{M^2}{\|F\|^2}\ \le\ \frac{MJ}{h+J}-1=N-1 .
$$
Here $0<\alpha,\beta<1$, so $1<J<3/2$ and $N>1$ since $M>h+1$.
Apply the evaluation estimate to $B-m$. This gives
$\mathbb E_{\mathrm{slice}} B^2\ge m^2 N/(N-1)$.
Averaging over a uniform first-input subspace gives the original product
law, and $\mathbb E m^2\ge(\mathbb E m)^2=1$. This proves the theorem.

## Comparison with the previous floors

The new $N$ is strictly below $M$, the old vector-field choice. If the
two-input restriction gave a stronger previous floor, its dimension
constant was $M'=D_p D_{n-k+1}$ with $D_j=j(j+1)/2$,
$k=2^{v_2(n)}<n$, $k\in\{2,4,8\}$, $p=k+1$, and $h=k-1$.
[Comparison of the two slice choices](PROOF.md).

For $k=2$ one has $N/M<3/5$, whereas $M'/M=(n-1)/(n+1)\ge5/7$.
For $k=4,8$ one has $N/M<1/3$, whereas $n\ge3k$ gives $M'/M>4/9$.
Thus the variance bound improves strictly also in these dimensions.

The [exact replay](../../code/spherical-defect-codex-062a/verify_tangent.py)
checks the table, the derivative Gram matrix by direct sphere integration,
and the quadratic maximization. Run from the repository root.

~~~sh
python3 -IBO research/higher-degree/code/spherical-defect-codex-062a/verify_tangent.py
~~~
