<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/ODD_RADIAL_QUADRATURE.md, 2026-11-15 12:48; Agent-ID: codex-91d4. -->
# Odd-safe visible quadrature with an explicit upper error

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only.** All inequalities below are analytic. The numerical
ceiling in Section 6 follows from coarse rational comparisons displayed
there; no code, interval integration, or new certificate was executed.
This is a reusable visible-variable integration lemma, not an outer
averaged all-sector theorem.

Let `a=699/1250`, `b=179/1250`, `rho=5053/10000`. Conditional on all
remote fields, put

```
F_±(r,theta)=q+(r²-.4)A+.6rho B
 +r exp(i theta)[a+br² ±(Q+nu(r²-2)/sqrt(2)-c)]
 +r² exp(2i theta)conjugate(B)/sqrt(2)
 ±r exp(-i theta)P.
```

Here A=r_A and B=r_B are the remote linear drivers, while c and nu
are global constants. This is exactly `X±(O-cZ)` at the common remote
trial. The visible law is
`dtheta/(2pi) * 2r exp(-r²) dr`.

## 1. Distributional semiconvexity survives norm zeros

For a C² complex curve F, the regularization
`f_epsilon=sqrt(|F|²+epsilon²)` satisfies

```
f_epsilon'' >= -|F''|.
```

Indeed the Hessian of the regularized Euclidean norm is positive
semidefinite, and its gradient has norm at most one. Passing to the
locally uniform limit as epsilon decreases to zero proves
`(|F|)'' >= -|F''|` distributionally. Possible corners at F=0 contribute
positive curvature; they do not invalidate this lower second-derivative
bound. No nonzero-denominator assumption is needed.

For the displayed radial polynomial,

```
F_±''=2A+sqrt(2)exp(2i theta)conjugate(B)
                +6r exp(i theta)(b±nu/sqrt(2)).
```

Therefore each `f_±(r)=|F_±(r,theta)|` has

```
f_±'' >= -[2|A|+sqrt(2)|B|+6r(b+|nu|/sqrt(2))].      (1)
```

The absence of q,Q,P,c in (1) is exact: their radial contributions
are constant or linear. This argument uses no even-sector radial
monotonicity, which would not be valid for arbitrary odd coefficients.

## 2. Positive radial interpolation weights and upper direction

On a cell [l,h], suppose `f''>=-M_i` distributionally. The function
`f(r)+(M_i/2)r²` is convex, hence lies below its endpoint chord. Thus

```
f(r) <= [(h-r)f(l)+(r-l)f(h)]/(h-l)
                         +(M_i/2)(r-l)(h-r).        (2)
```

For either norm one may take

```
M_i=2|A|+sqrt(2)|B|+6h(b+|nu|/sqrt(2)).
```

The endpoint weights obtained by integrating the chord against
`2r exp(-r²)dr` are positive. Explicitly, with delta=h-l,

```
J0=exp(-l²)-exp(-h²),
J1=l exp(-l²)-h exp(-h²)
                         +(sqrt(pi)/2)(erf(h)-erf(l)),
w_left=(h J0-J1)/delta,
w_right=(J1-l J0)/delta.                            (3)
```

They satisfy `w_left+w_right=J0`. Summing cell contributions gives
positive nodal weights whose sum on [0,R] is `1-exp(-R²)`.
**Do not renormalize these truncated weights.** The missing Gaussian
mass is handled by the explicit tail below. Formula (3) is an exact
description; a future implementation must enclose its transcendental
values outward, rather than treating floating weights as exact.

For uniform cell width delta, use `(r-l)(h-r)<=delta²/4` in (2).
For the sum of the two norms the curvature coefficient is

```
4|A|+2sqrt(2)|B|+(12b+6sqrt(2)|nu|)h.
```

Since the cell right endpoint satisfies `h<=r+delta`, averaging over
the remote law and the truncated visible radial law yields the upper
radial interpolation error

```
E_rad <= delta²/8 * {
  4sqrt(E_A)+2sqrt(2)sqrt(E_B)
 +(12b+6sqrt(2)|nu|)(sqrt(pi)/2+delta) }.             (4)
```

The replacement of the truncated radial moments by the full positive
moments only increases this bound. Arbitrary sharing among the remote
fields is harmless: only `E|A|<=sqrt(E_A)` and the corresponding B
bound were used.

## 3. Zero-safe periodic angular trapezoid bound

At fixed r, the same semiconvexity argument applies to theta. One may
bound the sum of the two angular curvature constants by

```
M_theta,sum(r)=2r[a+br²+|Q|+|P|+|c|
                         +|nu||r²-2|/sqrt(2)]
                    +4sqrt(2)r²|B|.                (5)
```

The factor 4 multiplying the B harmonic comes from its frequency 2.
For a periodic mesh of N_theta equally spaced nodes, apply (2) on
each angular interval, including the last interval wrapping around
2pi. The integral of the endpoint chord is the trapezoid rule. Exact
integration of its quadratic error bubble gives

```
angular mean of (|F_+|+|F_-|)
 <= nodal angular mean + pi² M_theta,sum/(3N_theta²). (6)
```

The coefficient is `delta_theta²/12`, not the larger max-bubble
coefficient `delta_theta²/8`. This holds at norm zeros as well.

Using `|T-2|<=T+2`, exponential moments, and remote Cauchy-Schwarz,

```
E M_theta,sum
 <= sqrt(pi)[a+1.5b+|c|+sqrt(E_Q)+sqrt(E_P)
                          +7|nu|/(2sqrt(2))]
                       +4sqrt(2)sqrt(E_B).          (7)
```

In particular Q/nu mixing is not silently cancelled: their absolute
contributions are retained in this universal quadrature-error bound.

## 4. Correct composition order

First apply (6) at each **continuous** r and remote sample, and then
integrate r. Bound its angular error using (7). Next apply the radial
interpolation bound to the norms at the selected angular nodes.
The radial curvature bound is independent of theta, so (4) applies
to their angular average. This establishes

```
E(|F_+|+|F_-|)
 <= E_remote[positive tensor quadrature on [0,R]xS¹]
          +E_rad+E_ang+Tail_R,                      (8)
E_ang = pi²/(3N_theta²) times the right side of (7).
```

This order matters. Applying an angular estimate after radial
discretization would require controlling the angular curvature under
the discrete radial weights; (7) is an expectation under the continuous
Gaussian law. The order above obtains exactly the same positive tensor
rule without making that extra assumption.

## 5. Full Gaussian radial tail

For `R>=sqrt(2)` define

```
I_k(R)=integral_R^infinity 2r^(k+1)exp(-r²)dr.
I_0=exp(-R²),                     I_2=(R²+1)exp(-R²),
I_1=R exp(-R²)+(sqrt(pi)/2)erfc(R),
I_3=(R³+1.5R)exp(-R²)+(3sqrt(pi)/4)erfc(R).
```

Triangle inequality and independence of the visible coordinate give
the following upper bound for the omitted sum of norms:

```
Tail_R <= 2sqrt(u) I_0
 +2sqrt(E_A)(I_2-.4 I_0)
 +sqrt(E_B)[1.2rho I_0+sqrt(2)I_2]
 +2[a+sqrt(E_Q)+sqrt(E_P)+|c|] I_1
 +2b I_3 +sqrt(2)|nu|(I_3-2I_1).                   (9)
```

Both radial differences in (9) are nonnegative on this range of R.
They retain the signs of `T-.4` and `T-2` outside the disk. There is
no assumption of independence between q,A,B,Q,P. For general R the
same triangle argument works with absolute radial differences, or a
split at the roots; (9) specifically uses `R>=sqrt(2)`.

Useful elementary outward bounds are

```
I_1 <= [R+1/(2R)]exp(-R²),
I_3 <= [R³+1.5R+3/(4R)]exp(-R²),
I_3-2I_1 <= [R³-.5R]exp(-R²).                      (10)
```

The first two use the Gaussian Mills inequality; the last follows
directly from the displayed exact formulas and subtracts the positive
erfc term. These bounds avoid any numerical tail integration.

## 6. Universal c=0 ceiling at R=6 and 8192 intervals/angles

Assume only the task's total energy cap
`u+E_A+E_B+E_Q+E_P+|nu|²<=E0=.080051`, and choose c=0.
Let `N_r=8192` denote the number of radial **intervals**, so there are
8193 radial endpoint nodes, `delta=6/8192=3/4096`.
Set `mu=sqrt(pi)/2`.

Cauchy-Schwarz across the sector energies sharpens (4) and (7) to

```
E_rad <= delta²/8 * [12b(mu+delta)
                       +sqrt(E0)sqrt(24+72(mu+delta)²)],
E_ang <= pi²/(3N_theta²) * [sqrt(pi)(a+1.5b)
                             +sqrt(E0)sqrt(32+65pi/8)]. (11)
```

For a deliberately coarse rational check, use

```
sqrt(E0)<.283, mu+delta<.887,
sqrt(24+72(.887)²)<9,
sqrt(pi)<1.773, sqrt(32+65pi/8)<7.6, pi²<9.87.
```

These follow, for example, from `pi<355/113`; for the second one,
`mu<709/800=.88625` and `delta<.00075` suffice. The radial bracket
is below `4.072`, and the angular bracket is below `3.524`. Therefore

```
E_rad <2.74e-7,       E_ang <1.73e-7.               (12)
```

At R=6, (9)-(10) give a fixed visible term `<72 exp(-36)`.
The six coefficients multiplying the square roots of the energy
components `(u,E_A,E_B,E_Q,E_P,|nu|²)` are bounded by

```
(2,74,53,13,13,302).
```

Their squared sum is 99831, below 316². Hence
`Tail_6<(72+.283*316)exp(-36)<162 exp(-36)`.
The finite Taylor sum for exp(3) through degree 8 exceeds 20, so
`exp(-36)<20^(-12)` and consequently

```
Tail_6 <4e-14,
E_rad+E_ang+Tail_6 <4.48e-7.                         (13)
```

This is an additive error for the whole positive two-norm expectation,
not per cell or per norm. If an implementation uses N_r to mean the
number of nodes, it must instead bind `delta=R/(N_r-1)` in its exact
contract; it must not silently use the interval-count formula.

## 7. What this lemma does not certify

The positive quadrature in (8) still contains remote expectations and
the continuum of possible genuine tensors. A finite visible grid does
not prove the outer averaged bound or (P_all). Exact outward evaluation
of the weights and whatever bounds are used at its nodes is still
required in Phase B. A grid this large is not a prescribed brute-force
outer cover; sharper local or adaptive constants may reduce its cost.

The lemma applies directly to the actual trial's positive sum of norms.
It does **not** upper-bound an odd increment after subtracting
`2E|X|` unless that baseline is separately enclosed from below. Likewise
the semiconvexity calculation above does not automatically apply to the
directional Psi majorant, which is a different nonlinear function.
Those distinctions must be preserved when sharing primitives with
a7c4's compact A/B cover.
