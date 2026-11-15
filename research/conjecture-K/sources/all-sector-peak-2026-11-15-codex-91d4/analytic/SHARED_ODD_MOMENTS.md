<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/SHARED_ODD_MOMENTS.md, 2026-11-15 12:41; Agent-ID: codex-91d4. -->
# Shared-chaos moment toolkit for the averaged odd extension

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only.** These dimension-free moment inequalities are proved
below. They do not prove the averaged odd premise or the all-sector cap.
No numerical certificate is needed for these identities.

Let q in H_(2,1), Q in H_(1,1), P in H_(2,0), and holomorphic linear
forms r_j use the same finite proper-complex Gaussian space. Set

```
u=||q||², x=||Q||², y=||P||², n=|nu|²,
S_r=sum_j |r_j|², V=E S_r, W=x+y+n.
```

All sharing is arbitrary. The visible Z is independent of that remote
space, T=|Z|², and
`O=ZQ+conjugate(Z)P+nu Z(T-2)/sqrt(2)`.

## 1. Dimension-free product bounds, including their proof

Use normalized complex multiple integrals I_(p,q)(f), with
`||I_(p,q)(f)||²=p!q!||f||²`, separately symmetric holomorphic and
antiholomorphic tensor slots. The complex Wick product formula has a
term for each r contractions from the first holomorphic slots to the
second antiholomorphic slots and s contractions in the other direction.
Its unnormalized coefficient is

```
r! s! binom(p,r) binom(q',r) binom(q,s) binom(p',s).
```

For completeness this product identity follows by comparing coefficients
in the Wick generating exponential
`exp(<t,Y>+<s,conjugate(Y)>-<t,s>)`: multiplying two such exponentials
introduces exactly the cross factors
`exp(<t,s'>+<t',s>)`. Selecting r and s cross factors gives the displayed
contractions and factorials.

Each contraction has tensor norm at most the product of input tensor
norms, by Cauchy-Schwarz; symmetrization is an orthogonal projection and
cannot increase norm. Multiplying the displayed coefficient by

```
sqrt((p+p'-r-s)! (q+q'-r-s)! / (p!q!p'!q'!))
```

therefore bounds that chaos term relative to the product of input L2
norms. Terms of different resulting bidegrees are orthogonal. Terms
within the same bidegree are added by the triangle inequality.

The resulting table lists the resulting bidegrees and the bounds for
their norms, in units of the product of input L2 norms:

| product | bidegrees | norm coefficients | squared-norm bound |
|---|---|---|---:|
| qQ | (3,2), (2,1), (1,0) | sqrt(6), 2+1, sqrt(2) | 17 |
| qP | (4,1), (3,0) | sqrt(6), sqrt(6) | 12 |
| rQ | (2,1), (1,0) | sqrt(2), 1 | 3 |
| rP | (3,0) | sqrt(3) | 3 |
| QP | (3,1), (2,0) | sqrt(3), 2 | 7 |
| Q² | (2,2), (1,1), (0,0) | 2, 1+1, 1 | 9 |
| P² | (4,0) | sqrt(6) | 6 |
| q² | (4,2), (3,1), (2,0) | sqrt(12), sqrt(6)+sqrt(6), 2sqrt(2) | 44 |

This proves, in every dimension,

```
E|q|²|Q|² <=17ux,       E|q|²|P|² <=12uy,
E S_r|Q|² <=3Vx,        E S_r|P|² <=3Vy,
E|Q|²|P|² <=7xy,
E|Q|⁴ <=9x²,            E|P|⁴ <=6y²,
E|q|⁴ <=44u².                                      (1)
```

For the S_r claims, apply the corresponding linear-form inequality to
each r_j and sum. No independence is used. All constants in (1) are
sharp: the matching one-coordinate forms are
`q=sqrt(u) Y(|Y|²-2)/sqrt(2)`, `Q=sqrt(x)(|Y|²-1)`,
`P=sqrt(y)Y²/sqrt(2)`, with all r_j proportional to Y.
The equality examples are checks on the constants; the tensor argument
above, rather than those examples, establishes the dimension-free bound.

Two useful projection bounds follow from the same table:

```
|E[|Q|² Q]| <=2 x^(3/2),
|E[Q |P|²]| <=2 sqrt(x)y,      |E Q²|<=x.             (2)
```

Indeed only the (1,1) projection of Q² contributes to
`E[Q² conjugate(Q)]`; its norm is at most 2x. Only the (2,0)
projection of QP contributes to `E[(QP)conjugate(P)]`; its norm is at
most `2sqrt(xy)`. Cauchy-Schwarz gives the last assertion.

For comparison, the inherited JOINT_TARGET Section 2 proves
`E|q|² S_r<=4uV` and `E S_r²<=2V²`. Those bounds concern linear
drivers. Formula (1) supplies their genuine quadratic-driver analogues;
one cannot simply reuse the coefficient 4 for Q or P.

## 2. Exact visible averaging and a sharp odd fourth-moment envelope

Put `k=(T-2)/sqrt(2)`. Visible angular integration gives exactly

```
E_theta |O|⁴ = T²[|Q+k nu|⁴+|P|⁴+4|Q+k nu|²|P|²].   (3)
```

The five needed exponential moments are

```
E[T² k^j], j=0,1,2,3,4:  2, sqrt(2), 4, 8sqrt(2), 44.
```

Expand (3), use EQ=0, and apply (1)-(2). This proves

```
E|O|⁴ <= M4(x,y,n)
 :=18x²+12y²+44n²+56xy+24xn+16yn
   +8sqrt(2)x^(3/2)sqrt(n)+16sqrt(2)sqrt(x)y sqrt(n). (4)
```

For explicit checking, the terms before their last bounds are

```
2E|Q|⁴ +2E|P|⁴ +8E|Q|²|P|² +44n² +16ny
 +8xn +16 E[Re(Q conjugate(nu))²]
 +4sqrt(2) Re(conjugate(nu) E[|Q|²Q])
 +8sqrt(2) Re(conjugate(nu) E[Q|P|²]).                (5)
```

Since `E Re(Q conjugate(nu))²<=xn`, (5) gives (4).
All inequalities are simultaneously equalities for the one-coordinate
Q,P above and `nu=sqrt(n)` real nonnegative. Thus (4) is the sharp
upper envelope given these three sector energies, not just a generic
hypercontractive bound.

Visible integration also gives

```
E|O|²=W,
E|q|²|O|² <=u(17x+12y+n),
E S_r|O|² <=V(3x+3y+n).                              (6)
```

Here the Q/nu radial cross term vanishes because `E T(T-2)=0`;
the Q/P and P/nu terms vanish under the visible angular integral.
These cancellations require this unweighted visible integration.
They cannot be used after inserting a denominator depending on X.

## 3. One global visible trial

For `H=O-cZ`, with one deterministic complex c,

```
E|H|²=W+|c|²,
(E|H|⁴)^(1/4) <= M4(x,y,n)^(1/4)+2^(1/4)|c|,
E|q|²|H|² <=u[(sqrt(17x)+|c|)²+12y+n],
E S_r|H|² <=V[(sqrt(3x)+|c|)²+3y+n].                 (7)
```

The first uses exact orthogonality of O to Z. The second is Minkowski.
The weighted inequalities follow by visible integration and then
Cauchy-Schwarz on the Q-c term. In particular replacing Q by Q-c
does not leave it in centered H_(1,1), and (4) cannot be applied to
Q-c as if that were still a centered chaos. For the first certification
candidate, c=0 preserves the sharper formulas (1)-(6). The exact
reduction keeps c general.

## 4. What these moments buy for exceptional sets

For any event A in the full Gaussian space and b=Pr(A), Hölder gives

```
E[2|H| 1_A] <= min(2sqrt((W+|c|²)b),
                       2(E|H|⁴)^(1/4)b^(3/4)).     (8)
```

The central norm secant is at most 2|H|, so (8) controls its omitted
piece without an inverse norm or an independence assumption. For the
inherited compact/exterior split `K=|q|²/2+S_r`, Markov and the moments
above give

```
Pr(K>=k0) <= min(1, (u/2+V)/k0,
                      (11u²+4uV+2V²)/k0²).         (9)
```

In particular one can substitute the inherited threshold
`k0=891/500`. This is a valid coarse tail estimate, but it is generally
far too large for a 50-micro-unit allowance. It is not a replacement for
the sharper inherited exterior analysis or a singular-region estimate.

Positive moments alone do not control the event `|X|<tau` sharply:
the conditional quadratic-zero examples remain possible. A lower bound
on the full differential norm is also not a Jacobian lower bound.
The regularized secant interface in P_ALL_REDUCTION.md therefore keeps
its small-ball allocation explicit rather than treating (1)-(9) as a
finished small-ball theorem.

## 5. Keep the mixed nu terms in directional estimates

At a fixed sample,

```
|H|²=T(|Q-c+k nu|²+|P|²)
      +2Re[Z²(Q-c+k nu)conjugate(P)],
(Re(X conjugate(H)))²
  =(|X|²|H|²+Re[X² conjugate(H)²])/2.                (10)
```

Thus a directional majorant has both Hermitian and complex-bilinear
pairings. The Q/nu interaction itself can have distinct real and
imaginary channels; P/nu and Q/P interactions remain as well. Replacing
them by a single `Re E[Q conjugate(nu)]` or deleting them using EQ=0
is invalid when the weight depends on q,A,B or on the visible sample.
Formula (10) is the safe full expression for the regularized candidate.

Sources: normalized complex-Hermite multiplication is used explicitly
in bundled inputs/JOINT_TARGET.md Section 2. The mixed-sector warning
and remote-only cross terms are in repository
`research/conjecture-K/sources/progress-2026-11-15-codex-a7c4/ODD_CONTROL.md`
Section 3; the two Q/nu channels are recorded in master STATUS 7.2.5.
