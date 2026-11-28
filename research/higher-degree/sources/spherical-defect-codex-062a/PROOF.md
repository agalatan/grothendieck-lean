# An explicit fourth-moment gap from vector fields on spheres

Agent-ID: codex-062a. Issue #507. The general inequality is **P, author only**.
The example fractions and normalization checks are **C, author only**.

Let $x,y,w$ be independent uniform unit vectors in $\mathbb C^c$. Let $R\ne0$
be any complex trilinear polynomial taking one coordinate from each cluster in
each monomial, with exactly one of the three coordinates conjugated. Set
$\kappa(R)=\mathbb E|R|^4/(\mathbb E|R|^2)^2$ and $\kappa_0=2c/(c+1)$.
Write $n=2c=(2a+1)2^{4d+b}$, with $0\le b\le3$, and put
$\rho(n)=8d+2^b$, $r=\rho(n)+1$, and $D_m=m(m+1)/2$.

**Theorem.** For every $c\ge2$ other than $2,4$,
$$
  \kappa(R)\ \ge\ \kappa_0\left(1+\frac{1}{D_r D_n-1}\right).
$$
For $c=2,4$ the sharp value is $\kappa_0$, attained by the
[known examples](../kappa-three-cluster-2026-11-17/NOTE.md).
The exact minimum in the other dimensions remains open.

| Complex dimension $c$ | Restricted real dimension $r$ | Gap above $\kappa_0$ | Lower bound for $\kappa$ |
|---:|---:|---:|---:|
| 3 | 3 | $3/250$ | $189/125$ |
| 5 | 3 | $5/987$ | $550/329$ |
| 6 | 5 | $12/8183$ | $14040/8183$ |
| 7 | 3 | $7/2516$ | $2205/1258$ |
| 8 | 10 | $16/67311$ | $119680/67311$ |

## Reduce the defect to one real bilinear map

Simultaneous multiplication of the three inputs by $e^{it}$ sends $R$ to
$e^{it}R$ and preserves the input law. Averaging the real part over this phase
gives $\mathbb E(\operatorname{Re}R)^2=\mathbb E|R|^2/2$ and
$\mathbb E(\operatorname{Re}R)^4=3\mathbb E|R|^4/8$.
Identify each cluster with $\mathbb R^n$. Real trilinearity gives
$\operatorname{Re}R=\langle x,\Phi(y,w)\rangle$ for a real bilinear map
$\Phi:\mathbb R^n\times\mathbb R^n\to\mathbb R^n$. Write
$B(y,w)=\|\Phi(y,w)\|^2/\mathbb E\|\Phi(y,w)\|^2$. The denominator is
positive by the second-moment phase identity. For a real unit sphere with
probability measure, the second and fourth moments of $\langle x,v\rangle$
are $\|v\|^2/n$ and $3\|v\|^4/[n(n+2)]$. Conditioning on $y,w$ thus gives
$$
  \kappa(R)=\frac{2n}{n+2}\,\mathbb E B^2
           =\kappa_0(1+\operatorname{Var} B).
$$
The phase average is over all inputs. The conditional law in the $x$-cluster
may have unequal real and imaginary variances.

## Every restricted map has a zero

In the stated dimensions $\rho(n)<n$. Indeed, if $d=0$, $\rho(n)=2^b$
and equality requires the odd factor to be one. If $d\ge1$, then
$8d+2^b<2^{4d+b}$, first at $d=1$ and then by induction.
Fix any $r$-dimensional subspace $U\subset\mathbb R^n$ and an orthonormal
basis $u_1,\ldots,u_r$. Put $A_j w=\Phi(u_j,w)$.
Suppose $\Phi(y,w)\ne0$ for all unit vectors $y\in U,w\in\mathbb R^n$.
Then every nonzero linear combination of the $A_j$ is invertible.
Consequently $v,A_2 A_1^{-1}v,\ldots,A_r A_1^{-1}v$ are linearly independent
for every unit $v$. Project the last $r-1$ vectors orthogonally onto
$v^\perp$. They stay independent and vary continuously with $v$, producing
$\rho(n)$ everywhere independent tangent vector fields on $S^{n-1}$.
Adams' theorem rules this out. Thus $B=0$ at some point of
$S(U)\times S^{n-1}$. [J. F. Adams, *Vector Fields on Spheres*, Theorem 1.1](https://www.math.ens.psl.eu/~benoist/refs/Adams.pdf).

## Convert a zero into an average

On the unit sphere in $\mathbb R^m$, the restrictions of homogeneous real
quadratic forms have dimension $D_m$. A form vanishing on the sphere
vanishes everywhere by homogeneity, and the constant function is represented
by the squared radius. On $S(U)\times S^{n-1}$ the tensor product of
these two spaces contains $B$. Under the product probability measure its
mean-zero subspace has dimension $D_rD_n-1$. For an orthonormal basis of
this subspace, the sum of squared basis functions is independent of the
basis and invariant under $O(r)\times O(n)$. Transitivity makes it a
constant, and integration identifies the constant with $D_rD_n-1$.
Cauchy–Schwarz therefore bounds the squared value at any point of a centered
function by $D_rD_n-1$ times its squared $L^2$ norm.

Let $a_U$ be the mean of $B$ on this product. Evaluate $B-a_U$ at a
point where $B=0$. The preceding inequality gives
$$
 \mathbb E_{S(U),w} B^2
   \ \ge\ a_U^2\left(1+\frac{1}{D_rD_n-1}\right).
$$
Choose $U$ with the rotation-invariant probability measure on the Grassmannian.
A uniform unit vector in a uniform $U$ is uniform on $S^{n-1}$. Hence
$\mathbb E_U a_U=1$ and $\mathbb E_U a_U^2\ge1$. Averaging the last display
and applying the real-part identity proves the theorem.

For odd $c\ge3$, $r=3$ and $D_rD_n=6c(2c+1)$. The resulting gap exceeds
the [elementary odd-dimensional gap](../kappa-spheres-2026-11-24-gemini-21d5/PROOF.md)
$1/[1014(c+1)^3]$, since $2028c(c+1)^2>6c(2c+1)-1$. The elementary proof
is independent of the topological input.

The [arithmetic replay](../../code/spherical-defect-codex-062a/verify.py) checks
the table, the exceptional dimensions, the phase normalization on a mixed form,
and the centered quadratic evaluation constant. Run from the repository root.

```sh
python3 -IBO research/higher-degree/code/spherical-defect-codex-062a/verify.py
```
