<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-energy-slack-2026-11-15/analytic/GAUSSIAN_MIXTURE_CONTROL.md, 2026-11-15 12:19; Agent-ID: codex-91d4. -->
# Exact Gaussian-mixture negative control

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
The concavity, symmetry, and assembly arguments below are **P, author
only**, independently derived here. The odd costs are inherited from
reviewed STATUS 7.2.7 / PR #428 (**P+C**); they are not recertified here.
No numerical computation is needed for this negative control.

## Concavity of the scalar benchmark

Let Z,W be independent proper standard complex Gaussians,
`L=Z(a+b|Z|^2)`, with a>0 and b>=0, and

```
B(u)=2 E|L+sqrt(u)W|,                         u>=0.
```

**B is concave on [0,infinity).** Here is an elementary proof which
does not require the stronger inherited Gaussian-mixture representation
of L (STATUS 2.7).

Write `R=r(a+br^2)`. The plane density of L at radius R is

```
f_L(R)=exp(-r^2)/[pi(a+br^2)(a+3br^2)].        (1)
```

The change of variables has Jacobian `(a+br^2)(a+3br^2)`.
Since R increases with r, (1) is radial decreasing. It is bounded at
zero and has total mass one. Consequently

```
h(w)=E[1/|L+w|]
```

is finite and radial decreasing. To justify the last assertion directly,
apply layer cake to f_L and to `1/|x|`: the convolution becomes a
nonnegative integral of intersection areas of two disks, each
nonincreasing in the separation of their centers. Truncation followed
by monotone convergence handles the unbounded kernel. Finiteness at
zero follows from bounded density near zero and `1/|x|<=1` outside
the unit disk; radial monotonicity then bounds h everywhere.

The proper-complex Gaussian heat kernel has generator `(1/4)Delta`.
Since distributionally `Delta|x|=1/|x|` in the plane, with no point
mass at zero, heat differentiation gives for u>0

```
B'(u)=(1/2) E[1/|L+sqrt(u)W|]
     =(1/2) E[h(sqrt(u)W)].                    (2)
```

This can also be justified by smoothing `|x|`, then taking the limit;
the integrable inverse-distance kernel and the bounded potential h
control the limit. As u increases, the integrand on the right side
of (2) decreases for each fixed W. Thus B' is nonincreasing.
Continuity at u=0 follows from the triangle inequality, so concavity
extends to the closed half-line.

The stronger inherited representation `L= sqrt(V_L)W_L` provides the
same conclusion immediately: `B(u)=sqrt(pi) E sqrt(V_L+u)`.
The proof above avoids making that representation a new dependency.

## Genuine finite triple blocks

Take mutually independent proper Gaussian coordinates X_j,Y_j,Z_j,
independent of the visible coordinate, and

```
q=sqrt(u/m) sum_(j=1)^m X_j Y_j conjugate(Z_j).
```

Every summand is a genuine normalized H_(2,1) cubic on three distinct
coordinates. Conditional on all X_j,Y_j, q is exactly a proper complex
Gaussian with variance

```
V=(u/m) sum_j |X_j Y_j|^2,       E V=u.        (3)
```

This retains the actual finite-m distribution through the random V;
it is not a Gaussian approximation with deterministic variance u.
Independence from L and conditional circularity give

```
Lambda(q)=E B(V)-pu <= B(u)-pu = S-sigma(u).   (4)
```

The inequality is Jensen for the concave B. Its expectations exist:
`B(v)<=B(0)+sqrt(pi)*sqrt(v)` and E V<infinity. In particular the
signed raw deficit D is nonnegative for this specific family, with
no remote-error allowance required.

## Full retention and the explicit zero trial

For q alone, in fact `LambdaHat(q)=Lambda(q)`. In each triple block,
the pairwise sign flips `(X_j,Y_j)`, `(X_j,Z_j)`, and `(Y_j,Z_j)` leave
the product cubic unchanged. Averaging the first-chaos coefficient
vector over this finite symmetry group kills every remote coefficient.
The convex trial objective therefore cannot increase when those
coefficients are set to zero. The remaining visible coefficient is
also zero at the minimum, by the canonical even-core parity and
convexity. Strict convexity supplies uniqueness. This argument is
about the full first chaos of the actual coordinates.

Now let Q in H_(1,1) and P in H_(2,0) use a Gaussian block disjoint
from all q blocks, and let nu be constant. Set

```
O=Zvisible Q+conjugate(Zvisible)P
  +nu Zvisible(|Zvisible|^2-2)/sqrt(2),
C_odd=(1/100)(||Q||^2+||P||^2)+(11/50)|nu|^2.
```

Reviewed STATUS 7.2.7 gives both raw and retained bounds. Combining
its raw form with (4), and its retained form with the exact baseline,
yields

```
Lambda(q+O)       <= S-sigma(u)-C_odd,          (5)
LambdaHat(q+O)   <= S-sigma(u)-C_odd,
LambdaHat(q+O)-LambdaHat(q) <= -C_odd.         (6)
```

Equation (5) also controls the **explicit full trial xi=0**. Thus the
disjoint A=B=0 triple-block tests are rigorous negative controls for
both the absolute target and the odd-increment target, at every finite
m, energy, and amplitude. A positive numerical absolute residual in
this class cannot be a mathematical counterexample to those bounds.
No numerical optimizer or strengthened response penalty is needed.
These statements do not extend to A/B shells or arbitrary shared
simultaneous odd tensors.

## Scope of the new Rice refinement

I also statically reviewed `multivariate/mixture_refine.py`. In the
shared example its active remote coordinate is X_1 and
`Q=d(|X_1|^2-1)`, `P=e X_1^2/sqrt(2)`. Conditional on that coordinate
and the other first two factors, (3) becomes

```
V=(u/m)(|X_1|^2 |Y_1|^2
        +sum_(j>=2)|X_jY_j|^2).
```

The code's shared/disjoint exponential-coordinate counts match these
formulas. The pairwise sign flips still preserve this O, since Q and
P are even in X_1. They therefore still remove **all** remote retained
coefficients, not just the active coefficient. For the disjoint
one-coordinate odd block its sign flip removes that extra coefficient
as well. In these particular families, the remaining full retained
optimization is exactly over one global complex visible c.

Conditioning gives Rice norm means with the actual random variance V;
the code's Rice mean, averaged phase derivative, and visible gradient
have the correct normalizations. Replacing the sampled baseline by
`E[B(V)-pV]` is an exact expectation identity, since E V=u, and is a
legitimate control variate. Cubic-spline interpolation and Sobol
averages remain N rather than outward certificates.

For the shared case, O and V are dependent. The disjoint odd theorem
cannot be applied to that case, and Jensen for B controls only its
remote baseline. The Rice formula is nevertheless an exact model
reduction, so its subsequent numerical refinement is valid N evidence.

## Inherited source

`research/conjecture-K/sources/progress-2026-11-15-codex-a7c4/ODD_CONTROL.md`,
especially Sections 1, 3, and 4, gives the simultaneous disjoint raw
and retained theorem. Its original header predates review; master
STATUS 7.2.7 records claude-b9ee's rederivation and replay at PR #428.
No new replay or external review is asserted here.
