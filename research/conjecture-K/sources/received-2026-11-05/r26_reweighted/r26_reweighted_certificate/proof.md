<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/proof.md (file dated 2026-11-05). Only this line was added. -->
# Reweighting the content inequality: a certified 0.22 endpoint and a nonsingular R26 target

5 November 2026. **Partial result toward Conjecture K.**

The pure-P theorem below and the mixed-family tail are proved. A uniform,
but unquantified, neighborhood of the pure-P endpoint follows as well.
The entire small-Wick strip and Conjecture K remain unproved.

## 1. The new endpoint theorem

Use the three visible profiles

| Row | a | b |
|---|---:|---:|
| peak | 699/1250 | 179/1250 |
| flank | 14/25 | 1467/10000 |
| upper | 573/1000 | 19/125 |

Let L=Z(a+b|Z|^2), B(v)=2 E|L+sqrt(v)W|, and F(q)=2 E|L+q|.
All complex Gaussians have second moment one. Put

\[
 F_A(z)=\mathbb E_Z[(|Z|^2-1)\operatorname{ph}(L+z)],
 \qquad
 J(v)=\mathbb E_Z[(|Z|^2-1)\mathbb E_W|L+\sqrt vW|^{-1}].
\]

Let P be a centered complex random variable with finite sixth moment, independent of X, with
u=E|P|^2 in [551/100000,463/10000], and suppose

\[
 \mathbb E|P|^4\ge2u^2,\qquad
 \mathbb E|P|^6\le37u\mathbb E|P|^4-68u^3.
 \tag{1}
\]

For q=XP,

\[
 \boxed{\quad C(q)^2\le\frac{11}{50}\,[B(u)-F(q)].\quad}
 \tag{2}
\]

Here C(q)=|E[bar(X) F_A(q)]|. When P is a function of an independent Gaussian
vector Y, all Y-direction first-chaos coefficients vanish by the X phase
symmetry, so this is also the full remote first-chaos projection norm.

In particular (2) holds for every complex matrix A and
P=Y* A Y-tr A, without normality or a pseudovariance restriction. Such P
satisfies (1), by the supplied R23 moment theorem reproduced in
`quadratic_moment_input.md`. Its exact fourth-moment formula gives the first
inequality; its coupled sixth-moment theorem gives the second.

No fourth-moment upper bound is needed in the new certificate. The theorem
also applies to non-quadratic coefficient laws satisfying the stated moments.

## 2. The weight and the polynomial

Write y=|z|^2/u and define

\[
 w(y)=\frac3{10}+\frac7{10}y,
 \qquad
 Q(y)=\frac{59}{500}(y-1)+b_4(2-y^2)
       +\frac{21}{200000}(y^3-37y^2+68),
 \tag{3}
\]

where b_4=37/1000 at the peak and flank rows, and b_4=7/200 at the upper row.
For Y=|P|^2/u, (1) implies

\[
 \mathbb Ew(Y)=1,\qquad \mathbb EQ(Y)\le0.
 \tag{4}
\]

Set d_u(v)=B(u)+B'(u)(v-u)-B(v). The exact pointwise certificate is

\[
 \boxed{
 \frac{uy[J(uy)-J(u)]^2}{4w(y)}
 \le\frac{11}{50}d_u(uy)+u^2Q(y)
 \quad (y\ge0).
 }
 \tag{5}
\]

This is certified simultaneously for the full u interval, separately at the
three rows. The coefficients are fixed; they are not fitted separately at
each u.

## 3. Why (5) proves the theorem

Conditioning on P and integrating the Gaussian driver gives

\[
 F(XP)=\mathbb EB(|P|^2),\qquad
 \mathcal C(XP)=\tfrac12\mathbb E[P J(|P|^2)].
\]

Since EP=0, subtract J(u)P/2. Apply weighted Cauchy-Schwarz with the weight
w(Y), whose expectation is exactly one:

\[
 \begin{aligned}
 C(XP)^2
 &\le \mathbb E\frac{|P|^2[J(|P|^2)-J(u)]^2}{4w(Y)}\\
 &\le \frac{11}{50}\mathbb E d_u(|P|^2)+u^2\mathbb EQ(Y)\\
 &\le \frac{11}{50}\,[B(u)-F(XP)].
 \end{aligned}
\]

The key change is the Cauchy-Schwarz weight. It is the fixed affine function
w, rather than the vanishing pointwise deficit d. The earlier certified
0.2468 obstruction concerned a majorant of |N|^2/d with prescribed radial
moments; it does not apply to (5). No contradiction with that obstruction is
claimed. The old obstruction measure has E Y^2 about 2.71756, so even the
additional lower bound E Y^2>=2 would not remove that obstruction for the old
weight. The reweighting changes the functional being bounded.

One can equivalently view (5) as redistributing the deficit by u^2Q/kappa.
That correction has nonpositive expectation, and its value at y=1 is
b_4+32(21/200000)>0. Thus the corrected pointwise deficit has no contact-circle
zero obstructing uniform continuation.

Using the inherited A-shell cost kappa_A=0.24, (2) improves the shared-A
consequence for this family to

\[
 \Lambda(XP+(|Z|^2-1)U)
 \le B(u)-u/\epsilon-\frac1{12}[B(u)-F(XP)]\le S
\]

where that shell-cost theorem applies. This does not enlarge the allowed
visible-shell class or prove the mixed-shell problem.

## 4. Exact certification of (5)

The inherited scalar kernels are

\[
 A(v)=-B''(v)>0,\qquad H(v)=J'(v)>0.
\]

Both are decreasing and convex. Their positive integral representations and
tail bounds are documented in `kernel_proof.md`. This file is inherited
background: its older Hermitian theorem is not the new theorem above.

Define the cancellation-free averages

\[
 a(u,y)=\int_0^1(1-t)A(u[1+t(y-1)])\,dt,
 \qquad
 h(u,y)=\int_0^1H(u[1+t(y-1)])\,dt.
\]

Then d_u(uy)=u^2(y-1)^2 a(u,y) and
J(uy)-J(u)=u(y-1)h(u,y). The checker proves

\[
 (y-1)^2\left[\frac{11}{50}a(u,y)
       -\frac{uy\,h(u,y)^2}{4w(y)}\right]+Q(y)\ge0.
 \tag{6}
\]

On 0<=y<=400 it uses rational piecewise-linear lower bounds for A and upper
bounds for H, integrated exactly. Convex chords give the upper bounds;
adjacent secants and a rigorously bounded chord error give the lower bounds.
Their construction is in `kernel_enclosures.py`, inherited from the exact
R23 checker.

For a rectangle [u0,u1] x [y0,y1], monotonicity gives
a(u,y)>=a_lower(u1,y1) and h(u,y)<=h_upper(u0,y0).
The code bounds the bracket in (6) from below, choosing the appropriate
endpoint bound for (y-1)^2 according to the bracket's sign. No y rectangle
crosses 1. A cubic Bernstein bound handles Q. Every acceptance comparison is
between exact rationals. Floating values are used only as lookup guesses;
exact comparisons validate the selected kernel cell.

For y>=400, complete monotonicity of -J gives
|J(uy)-J(u)|<=|J(0)|<17/10, and w(y)>=7y/10. Consequently the left side of
(5), divided by u^2, is at most 289/(280u). The checker proves
Q(400)>289/(280u_min), Q'(400)>0 and Q''(400)>0. Since Q''' is positive, this
proves the whole unbounded tail, discarding the nonnegative d term.

The formula for J(0) is evaluated with Arb to check its strict bound at
each row. The kernel tables were extended from their inherited endpoint
near 3.53 to an endpoint above 23.73. All 441 stored nodes were independently
recomputed at 160-bit precision, including the 60 additional nodes; every
new enclosure was contained in its stored rational interval.

The exact rectangle checks passed:

| Row | Rectangles visited | Accepted leaves | Maximum depth |
|---|---:|---:|---:|
| peak | 5306 | 2654 | 24 |
| flank | 5376 | 2689 | 23 |
| upper | 1664 | 833 | 18 |

These counts cover the continuum, not just sampled points. There is no Lean
formalization in this package.

## 5. The new small-Wick target

For q=X[c(R-2)+P], let p=E|P|^2, u=2|c|^2+p, f=2|c|^2/u. Rotate c to be
nonnegative real. Keep the exact integrated quantities from R26:

\[
 T_c(z)=\int_0^\infty re^{-r}[c(r-2)+z]g(r|c(r-2)+z|^2)\,dr,
\]

\[
 H_{c,u}(z)=B(u)-B_0-I_c(z)+B'(u)(|z|^2-p)
               +2uB''(u)\Re(\bar c z),
\]

where I_c(z)=integral exp(-r) Phi(r|c(r-2)+z|^2) dr and
Phi(s)=2E|L+sqrt(s)|-B0. The established identities are
E T_c(P)=the full content coefficient, E H_{c,u}(P)=Delta, and H_{c,u}>=0.
Let lambda(u)=J(u)/2.

The new fixed candidate is

\[
 \boxed{
 \frac{|T_c(z)-\lambda(u)z|^2}{w(|z|^2/p)}
 \le \frac{47}{200}H_{c,u}(z)+p^2Q(|z|^2/p).
 }
 \tag{7}
\]

If (7) holds on 0<=f<=1/16, the same weighted Cauchy-Schwarz argument proves
C(q)^2<=0.235 Delta on the entire small-Wick strip, using only (1) for P.
There is no pseudovariance parameter and no target-content angle. The phase
of z still must be retained. The compact certificate has four real parameters:
u, c/sqrt(p), |z|/sqrt(p), arg(z).

### Proved tail of (7)

For y=|z|^2/p>=500, the inequality is proved uniformly for
u_min<=u<=u_max and 0<=f<=1/16. Indeed p>=p_min=(15/16)u_min, and the
inherited bounds give

\[
 |T_c(z)|\le\sqrt\pi/e<2/3,\qquad
 |\lambda(u)|<17/20.
\]

Therefore

\[
 \frac{|T_c(z)-\lambda z|^2}{w(y)}
 \le\frac{80}{63y}+\frac{289}{140}p.
\]

`verify_tail.mjs` checks, with BigInt rational arithmetic, that

\[
 Q(500)>\frac{80}{63\cdot500\,p_{\min}^2}
                 +\frac{289}{140p_{\min}},
\]

and that Q is increasing thereafter. The peak/flank Q is the smaller of
the two Q polynomials for y>=500. Thus p^2Q alone bounds the numerator;
the nonnegative H term is not needed. This proves the tail, not the compact
part of (7).

### Proved uniform, unquantified endpoint neighborhood

The `--bridge` mode of the exact checker proves the stronger pure-endpoint
statement

\[
 \frac{47}{200}d_u(uy)+u^2Q(y)
 -\frac{uy[J(uy)-J(u)]^2}{4w(y)}\ge\frac{u^2}{500}
 \tag{8}
\]

for every u in the full interval and every y>=0, at all three rows.
Its bounded-domain checks and unbounded tail are exact.

On the compact set u in the given interval, 0<=y<=500, 0<=arg z<=2pi, the
left side of (7), moved to the right, is continuous in f (or more smoothly
in c/sqrt(p)). At f=0 its minimum is at least u_min^2/500>0 by (8).
Uniform continuity and the proved tail therefore give an epsilon_0>0,
independent of P and its dimension, such that (7) holds for every
0<=f<=epsilon_0 at all three rows.

This is a genuine existence theorem for a uniform neighborhood of the
Gaussian-factor endpoint. **It does not establish epsilon_0=1/16 or provide
a useful numerical width.** No compactness argument over the coefficient
laws is being used; the compactness is only in the displayed pointwise
parameters, before averaging over P.

### Floating evidence for the whole small-Wick strip

The fixed candidate, with no coefficient optimization per point, was scanned
at five energies, nine fractions in [0,1/16], a radius grid extending to
y=500 and 49 phases in [0,pi]. Six continuous local optimization starts per
row then searched over u, c/sqrt(p), y and phase. They found these largest
required constants among those searches:

| Row | Largest observed required constant |
|---|---:|
| peak | 0.230627079 |
| flank | 0.229397171 |
| upper | 0.224506034 |

The peak candidate maximum is near u=0.0463, f=0.00335792, y=0.414962,
arg z=pi. Adaptive integration in the Wick radius changes that value by
about 1.4e-9, but reuses the same approximate scalar interpolation tables.
This is a radial quadrature cross-check, not independent certification of
the kernels or a global optimization proof.

**The continuum compact-region certificate for (7) is still missing.**
The observed values are not rigorous upper bounds. The larger margin and
absence of the contact-circle singularity make (7) a concrete alternative
to the earlier directional candidate near 0.2393.

## 6. What remains for R26 and K

The existing p<=u/5 theorem is accepted from the updated research record;
its newer archive was not included in this upload. This package does not
reprove it. The uploaded Gaussian-factor archive was byte-for-byte identical
to the corresponding archive already read.

To close the one-driver family, certify the compact part of (7) for
0<=f<=1/16, and the middle envelope on 1/16<=f<=4/5. Mixed shells and several
self-interacting drivers remain separate unresolved problems. Neither (2)
nor the numerical evidence proves general Conjecture K or a new unconditional
Grothendieck bound.
