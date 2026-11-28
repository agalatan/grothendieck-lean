# Fourth-moment bounds from zeros of bilinear maps

Agent-ID: codex-062a. Issue #507. The one-input vector-field bound and its replay
were [independently checked by claude-b9ee](https://github.com/agalatan/grothendieck-lean/pull/926#issuecomment-7238684736).
The two-input bound and its numerical table were [independently checked in #927](https://github.com/agalatan/grothendieck-lean/pull/927#issuecomment-7238818526).
The [tangent-space estimate](TANGENT.md) improves the floors below using the derivative at a zero.

Let $x,y,w$ be independent uniform unit vectors in $\mathbb C^c$. Let $R\ne0$
be any complex trilinear polynomial taking one coordinate from each cluster in
each monomial, with exactly one of the three coordinates conjugated. Set
$\kappa(R)=\mathbb E|R|^4/(\mathbb E|R|^2)^2$ and $\kappa_0=2c/(c+1)$.
Write $n=2c=(2a+1)2^{4d+b}$, with $0\le b\le3$, and put
$\rho(n)=8d+2^b$, $r=\rho(n)+1$, and $D_m=m(m+1)/2$.

**Theorem.** For every $c\ge2$ other than $2,4$,
$$
  \kappa(R)\ \ge\ \kappa_0\frac{N}{N-1}.
$$
Put $k=2^{v_2(n)}$, the largest power of two dividing $n$. Take
$N=D_rD_n$ when $k=n$ and otherwise take
$N=\min\{D_rD_n,D_{k+1}D_{n-k+1}\}$. At $c=2,4$ the sharp value is
$\kappa_0$, attained by the [known examples](../kappa-three-cluster-2026-11-17/NOTE.md).
The exact minimum in the other dimensions remains open.

| Complex dimension $c$ | Real input dimensions used | Gap above $\kappa_0$ | Lower bound for $\kappa$ |
|---:|:---:|---:|---:|
| 3 | $(3,5)$ | $3/178$ | $135/89$ |
| 5 | $(3,9)$ | $5/807$ | $450/269$ |
| 6 | $(5,9)$ | $6/2359$ | $4050/2359$ |
| 7 | $(3,13)$ | $7/2180$ | $1911/1090$ |
| 8 | $(10,16)$ | $16/67311$ | $119680/67311$ |

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

## Restrict one input by the vector-field theorem

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

## Restrict both inputs by the Hopf–Stiefel condition

Fix arbitrary subspaces $U,V\subset\mathbb R^n$ of dimensions $p,q$.
Suppose there is an integer $0<j<n$ with $j<p$, $n-j<q$, and $\binom nj$ odd.
Then $\Phi$ has a zero on $S(U)\times S(V)$. Indeed, a bilinear map with
no such zero induces a continuous map
$\mathbb{RP}^{p-1}\times\mathbb{RP}^{q-1}\to\mathbb{RP}^{n-1}$ by taking
the line through its value. On either input with the other fixed, the
map comes from an injective linear map. Therefore the generator of
$H^1(\mathbb{RP}^{n-1};\mathbb F_2)$ pulls back to $a+b$, the sum of the
two input generators. Its $n$th power vanishes. But in
$\mathbb F_2[a,b]/(a^p,b^q)$ the term $a^j b^{n-j}$ in $(a+b)^n$
has coefficient one and survives. This contradiction is the classical
obstruction. [José Adem, *Construction of some normed maps*, Theorem 8.4](https://www.boletin.math.org.mx/pdf/2/20/BSMM%282%29.20.59-75.pdf).

For $k<n$ this gives $(p,q)=(k+1,n-k+1)$. Indeed,
$(1+t)^n=(1+t^k)^{n/k}$ over $\mathbb F_2$, and $n/k$ is odd.
The first positive exponent with odd coefficient is $k$. By symmetry all
eligible interior exponents $j$ belong to $[k,n-k]$. For a given $j$ the
smallest eligible dimensions are $j+1,n-j+1$. The product of their quadratic
dimensions is
$$
 D_{j+1}D_{n-j+1}
 =\frac{(n+1+j(n-j))(2n+4+j(n-j))}{4}.
$$
It is minimal at $k$ or $n-k$. Thus this choice gives the best evaluation
bound obtainable from an odd coefficient of $(a+b)^n$. If $n$ is a power
of two, the polynomial has only its two endpoint terms.

When $k<n$ and $v_2(n)\le3$, $r=k+1$ and the second restriction strictly
improves the bound. When $v_2(n)\ge4$ the vector-field choice is stronger.
To check the latter comparison for $k<n$, observe that $n\ge3k$ and
$2k\ge3\rho(n)+2$. The second inequality holds at valuation four
($k=16,\rho=9$) and persists as the valuation increases because $k$
doubles and the formula for $\rho$ gives at most a doubling. Consequently
$D_{k+1}/D_r\ge9/4$, while $D_{n-k+1}/D_n>4/9$.

## Convert a zero into an average

Use either pair of dimensions $(p,q)$ just established, taking $(r,n)$
for the vector-field argument. On a real unit sphere in $\mathbb R^m$ the
restrictions of homogeneous quadratic forms have dimension $D_m$. A form
vanishing on the sphere vanishes everywhere by homogeneity. The squared radius
represents the constant function. On $S(U)\times S(V)$ the tensor product of
the two quadratic spaces contains $B$. Its centered subspace has dimension
$D_pD_q-1$. For an orthonormal basis under product probability measure, the
sum of the squares of the centered basis functions is invariant under
$O(p)\times O(q)$. It is constant by transitivity and integrates to
$D_pD_q-1$. Cauchy–Schwarz bounds squared point evaluation of any centered
function in this space by $D_pD_q-1$ times its squared $L^2$ norm.

Write $m_{U,V}$ for the slice mean of $B$. Evaluating $B-m_{U,V}$ at a
zero and rearranging gives
$$
 \mathbb E_{S(U)\times S(V)} B^2
 \ \ge\ m_{U,V}^2\left(1+\frac{1}{D_pD_q-1}\right).
$$
Choose $U,V$ independently with their rotation-invariant Grassmannian laws.
Independent uniform directions in the chosen subspaces then have the
original product law. Hence $\mathbb E m_{U,V}=1$ and
$\mathbb E m_{U,V}^2\ge1$. Averaging proves the stated lower bound for each
pair, so the smaller product of dimensions gives the stronger bound.

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
