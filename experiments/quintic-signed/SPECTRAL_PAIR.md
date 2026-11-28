# An overlap test for arbitrary pairs of phases

Let $S$ be the signed Hermitian witness with $e=191/250$, $\nu=47/2000$
and $0\le d\le\nu$. For arbitrary unimodular $f,g$ in any finite positive
Gaussian dimension put
\[
  a=\langle f,Sf\rangle,\quad b=\langle g,Sg\rangle,\quad
  z=\langle f,Sg\rangle,\quad c=\langle f,g\rangle .
\]
The diagonal values $a,b$ are real. All four scalars are computed from the actual
pair. They satisfy
\[
               |z|^2\le ab+e(1-|c|^2).
\]
In particular $ab\le-.25547$ suffices to give $|z|<10000/14023$, at every
overlap and for every allowed $d$.

With the uniform [diagonal bound](VISIBLE_PAIR_BUDGET.md), the following
two independent tests at each debit suffice for the same absolute-payoff
target. The phase distance is $r=\min_{|\theta|=1}\|f-\theta g\|_2$.

| Debit $d$ | Sufficient $|c|$ | Sufficient phase distance $r$ |
|---|---:|---:|
| $1/50$ | $\ge .99932639$ | $\le .03670465$ |
| $47/2000$ | $\ge .99920616$ | $\le .03984579$ |

The tests apply to arbitrary phases, regardless of the distribution of the
half-difference among the chaos sectors. Pairs outside the overlap and
diagonal-product criteria still enter the global lower-bound problem.

## Proof

The spectrum of $S$ on the first, cubic, fifth and remaining subspaces is
$1,-e,\nu-d,\nu$, respectively. Thus $S+eI$ and $I-S$ are positive.
Cauchy–Schwarz for their positive semidefinite forms gives
\[
 |z+ec|^2\le(a+e)(b+e),\qquad
 |c-z|^2\le(1-a)(1-b).
\]
Add $e$ times the second inequality to the first. The terms involving
$\operatorname{Re}(\bar zc)$ cancel. Dividing by $1+e$ gives the claim.
For $S=\operatorname{diag}(1,-e)$ on a two-dimensional Hilbert space both shifted forms have rank one, so equality holds. For vectors of arbitrary norms the last factor becomes
$\|f\|^2\|g\|^2-|\langle f,g\rangle|^2$.

The one-coordinate radial flip in the diagonal estimate makes $B_d$ a strict
lower estimate for the diagonal supremum when $d>0$. The safe upper estimate
is $C_d=B_d+3\cdot10^{-52}$. Then $ab\le C_d^2$, so it suffices that
$1-|c|^2<[(10000/14023)^2-C_d^2]/e$. Finally $r^2=2(1-|c|)$ for unit
vectors, so $1-|c|^2=r^2(1-r^2/4)$. The [exact arithmetic replay](code/spectral_pair_overlap.py)
checks each rounded sufficient threshold and the adjoining distance.

## A signed bound using the cubic cross term

For the half-sum $h$ and half-difference $k$, let $C=I-P-Q$ and put
$H=\|Ch\|^2$, $K=\|Ck\|^2$ and
\[
 J=\langle Ch,Ck\rangle=
   \langle h,k\rangle-\langle Ph,Pk\rangle-\langle Qh,Qk\rangle.
\]
The signed fifth cost $\Delta=\|Fh\|^2-\|Fk\|^2$ satisfies
\[
    |J|^2\le(K+\Delta)(H-\Delta).
\]
To prove it, put $p=\|Fh\|^2$, $q=\|(C-F)k\|^2$. Orthogonality and
Cauchy–Schwarz in the two summands give
$|J|\le\sqrt{p(K-q)}+\sqrt{(H-p)q}$. Cauchy–Schwarz in two real dimensions
then gives $|J|^2\le(p+q)(H+K-p-q)$; substitute $p+q=K+\Delta$.
It follows for $H+K>0$ that
\[
 \Delta\ge\frac{H-K-\sqrt{(H+K)^2-4|J|^2}}2
       \ge-K+\frac{|J|^2}{H+K}.
\]
For the zero residual both sides of the polynomial estimate vanish. When $J=0$,
the lower endpoint returns the Bessel estimate $-K$. If $|J|^2=HK$, as for
collinear residuals, the lower endpoint becomes $\min(0,H-K)$. All these
estimates hold for unrestricted physical pairs.
For a target lower floor $-\varepsilon$ the quadratic suffices if
$H-K+2\varepsilon\ge0$ and
$|J|^2\ge(K-\varepsilon)(H+\varepsilon)$, by monotonicity on its lower
branch. On a unimodular pair $\operatorname{Re}\langle h,k\rangle=0$, so
$|J|\ge\max(0,|\operatorname{Re}\langle Qh,Qk\rangle|-t\|Pk\|)$.
A phase symmetry that makes $J=0$ removes this source of gain.

~~~sh
python3 -IB -O experiments/quintic-signed/code/spectral_pair_overlap.py
~~~

Agent-ID: codex-a7c4
