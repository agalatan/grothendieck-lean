<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/variational/EXPLICIT_SMOOTH_EDGEWORTH.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended path: handoff/codex-c7e2-round2/variational/EXPLICIT_SMOOTH_EDGEWORTH.md -->
# Explicit smooth Edgeworth estimate for the actual remote profile

Agent-ID: codex-c7e2. 2026-11-15. The stronger final result in Section 5
proves the requested explicit remainder of order kappa^(3/2). Sections
1-4 retain an independently useful five-tensor derivation. Neither result
proves global Conjecture K.

The strongest conclusion is

    |E m(X)-E m(N_v)-(kappa/24)E m''''(N_v)|
        <=6 ||m^(6)||_infinity kappa^(3/2),

uniformly in the variance and dimension. Its full proof uses only the
Gaussian product formula, integration by parts, and a six-vertex matching
lemma proved below; no external Edgeworth theorem is used.

## 1. Smooth real cubic theorem

Let X be in the third real Gaussian Wiener chaos, with variance v,
kappa=E[X^4]-3v^2, and let N_v be Gaussian with variance v. Let m be C^6
with bounded derivatives of orders 1 through 6 (m itself can grow linearly).
Put M_j=||m^(j)||_infinity. Then

    | E m(X)-E m(N_v)-(kappa/24) E m''''(N_v) |
       <= (12/5) M_5 kappa^(5/4)
          +(sqrt(2)/216) M_6 kappa^(3/2).                   (1)

This is uniform in v and dimension. In particular there is no inverse
power of v or unspecified asymptotic constant.

### An elementary five-tensor contraction lemma

For symmetric real f of order three, each admissible iterated symmetrized
contraction kernel containing five copies of f in the expansion of
Gamma_4(I_3(f)) has Hilbert norm at most

    C^(5/2),  C=max_(r=1,2) ||f tensor_r f||.                (2)

Here is a self-contained proof of this specific bound. Expanding each
symmetrization as an average, it suffices to bound an unsymmetrized kernel.
Represent its five copies of f by vertices, contracted indices by edges,
and uncontracted indices by open legs. The internal graph is connected,
loopless, and subcubic: every vertex has three indices in total, and every
new tensor in an iterated contraction attaches along at least one edge.
There are no triple edges, since their two endpoints would form an isolated
component. Every edge multiplicity is therefore at most two.

We first prove that such a graph on five vertices has a matching covering
every vertex of degree three. Write S for its degree-three vertices.

* If |S|=0 or 1, the claim is immediate.
* If |S|=2, match them to each other if adjacent. Otherwise each has at
  least two distinct neighbors, because all neighbors have degree at most
  two. Choose different neighbors for the two vertices.
* If |S|=3, the other two vertices have total degree three: they have
  degrees one and two, by connectedness and parity. It suffices to find
  an edge between two vertices of S whose third vertex has a neighbor
  outside S. If this were impossible, the induced simple graph on S
  cannot be a triangle, since then none of S could connect to its
  complement. It cannot be a two-edge path, since both endpoints would
  then send all three of their edges to the middle vertex. A single
  edge leaves its third vertex isolated, and no edges would require
  degree at least nine in the complement. All cases are impossible.
* If |S|=4, the fifth vertex has degree two by parity. If the graph
  induced on S has no matching of size two, its edges form a star or
  a triangle (possibly with missing edges). In the star case, the three
  noncentral vertices in S have total degree nine, but their edges can
  only end at the center or the fifth vertex, whose total degree is five.
  In the triangle case the remaining vertex in S would send three edges
  to the fifth vertex of degree two. Both are impossible.
* |S|=5 is excluded by parity of the degree sum.

Now square the norm of the kernel. Its tensor graph consists of two
copies of the internal graph, with corresponding open legs joined
between copies. Use the preceding matching inside both copies. Every
unmatched vertex has at least one open leg, so match it to its counterpart.
This gives a perfect matching on the ten-vertex graph. Contract all edges
between each matched pair; there are either one or two such edges, so
each resulting tensor is a permutation of f tensor_r f, r=1 or 2.

The remaining closed tensor network has five factors, each of Hilbert
norm at most C. Repeated Cauchy-Schwarz bounds its absolute value by C^5:
merge connected tensor factors, contracting all their common indices at
each merge, and use the Hilbert norm bound for partial contraction.
Thus the squared norm of the original kernel is at most C^5, proving (2).
The triangle inequality returns the same bound after averaging the
symmetrizations. Approximation extends the finite-dimensional argument
to every real Gaussian Hilbert space.

The companion checker also enumerates every connected loopless subcubic
multigraph on five labeled vertices: all 1432 admit the stated matching.
This checks the combinatorics independently of the preceding proof.

For comparison, (2) is the q=3 specialization of the more general
five-factor inequality (4.50) in Bierme, Bonami, Nourdin, and Peccati,
*Optimal Berry-Esseen rates on the Wiener space: the barrier of third
and fourth cumulants*, arXiv:1109.1546v1, pp. 15-18:
https://arxiv.org/pdf/1109.1546 . The argument above does not require that
external result, or any generic bound on higher cumulants.

### Exact Gamma_4 bound

Write X=I_3(f), with E I_m(g)^2=m!||g||^2, and define the classical
iterated Gamma operators by

    Gamma_0=X,
    Gamma_(j+1)=<DX,-D L^(-1) Gamma_j>.

The inverse L^(-1) annihilates constants. The exact cubic cumulant identity is

    kappa=1944||sym(f tensor_1 f)||^2
                 +1296||f tensor_2 f||^2.                  (3)

Moreover ||f tensor_1 f||=||f tensor_2 f||. Hence the right side of
(2) is at most kappa^(5/4)/36^(5/2)=kappa^(5/4)/7776.

For a term c I_m(g), the next Gamma operation produces, for
1<=r<=min(3,m), a term with degree m+3-2r and coefficient

    c * 3 * (r-1)! * binom(2,r-1) * binom(m-1,r-1).          (4)

Start with degree 3 and coefficient 1, iterate four times, and discard
degree-zero terms before every subsequent step. The 22 resulting terms
have the following aggregate coefficients:

| Output chaos degree | Sum of coefficients |
| --- | ---: |
| 1 | 19440 |
| 3 | 15714 |
| 5 | 2268 |
| 7 | 81 |

By (2), the triangle inequality, and the chaos isometry,

    ||Gamma_4||_1 <= ||Gamma_4||_2
      <= [19440+15714sqrt(6)+2268sqrt(120)+81sqrt(5040)]
          * kappa^(5/4)/7776
      <12 kappa^(5/4).                                     (5)

The last inequality follows already from sqrt(6)<5/2,
sqrt(120)<11, sqrt(5040)<71: the resulting numerator is 89424,
whereas 12*7776=93312. The companion exact-integer checker verifies
the complete recursion, the counts, and this strict inequality.

### Stein calculation

Let f_m solve the Gaussian Stein equation

    v f_m'(x)-x f_m(x)=m(x)-E m(N_v).

The Ornstein-Uhlenbeck semigroup representation is

    f_m(x)=-integral_0^infinity e^(-t)
       E m'(e^(-t)x+sqrt(v(1-e^(-2t))) N_1) dt.

Consequently, for 0<=j<=5,

    ||f_m^(j)||_infinity <= M_(j+1)/(j+1),
    E f_m'''(N_v)=-(1/4) E m''''(N_v).                      (6)

Third chaos is symmetric, so its third cumulant vanishes. Repeated
Gaussian integration by parts, with E Gamma_j=kappa_(j+1)/j!, yields
the exact identity

    E m(X)-E m(N_v)
      =-(kappa/6) E f_m'''(X)-E[Gamma_4 f_m''''(X)].           (7)

There is no truncation hidden in (7). To bound the last term, combine
(5) with ||f_m''''||_infinity<=M_5/5.

For the replacement of X by N_v in the first term, note that

    Var(Gamma_1)
      =[1944||sym(f tensor_1 f)||^2
          +2592||f tensor_2 f||^2]/9
      <= (2/9)kappa.                                       (8)

Apply the Stein equation once to g=f_m'''. Its Stein solution h satisfies
||h'||_infinity<=||g''||_infinity/2<=M_6/12, independently of v. Thus

    |E f_m'''(X)-E f_m'''(N_v)|
      <= (sqrt(2)/36) M_6 sqrt(kappa).                       (9)

Equations (6)-(9) prove (1). All integrations are justified by Gaussian
polynomial moments and the bounded derivatives. The case v=0 is trivial.

## 2. Actual circular remote profile

Let Z be standard proper complex Gaussian, independent of circular
q in H_(2,1), and set

    L=Z(a+b|Z|^2),  a>0, b>=0,
    u=E|q|^2,
    delta=E|q|^4-2u^2,
    B(u)=2 E|L+sqrt(u) W|,

where W is standard proper complex Gaussian independent of Z. Define

    V=Re L,
    m(x)=pi E|V+x|.

Circularity, together with E_theta |cos(theta)|=2/pi, gives

    2E|L+q|=E m(Re q),
    B(u)=E m(N_(u/2)),
    kappa_4(Re q)=(3/8)delta.                               (10)

The Gaussian heat equation gives B''(u)=(1/16)E m''''(N_(u/2)).
Consequently (1) becomes

    |2E|L+q|-B(u)-(delta/4)B''(u)|
       <= A(a,b) delta^(5/4)+D(a,b) delta^(3/2),              (11)

where entirely explicit constants are

    A=(12/5)(3/8)^(5/4) M_5,
    D=(sqrt(2)/216)(3/8)^(3/2) M_6.                          (12)

Here M_5,M_6 can be bounded explicitly as below. The same-energy quadratic
penalty cancels, so (11) applies directly to the remote Conjecture K gap.

## 3. Explicit derivative bounds for m

Write Z=x+iy, whose joint density is pi^(-1)exp(-x^2-y^2).
For each fixed y, the map x -> x(a+b(x^2+y^2)) is increasing, with

    J=a+by^2+3bx^2 >=a.

The density rho_V and its derivatives are obtained by integrating

    [(J^(-1)partial_x)^k (exp(-x^2)/J)]

against pi^(-1)exp(-y^2)dy and evaluating x at the inverse map.
For a term c exp(-x^2)x^d b^j J^(-s), one application of J^(-1)partial_x
produces the three terms with triples and coefficients

    (d+1,j,s+1): -2c,
    (d-1,j,s+1): dc,
    (d+1,j+1,s+2): -6sc.                                   (13)

Starting at (d,j,s)=(0,0,1), iterations three and four have d<=4.
Use exp(-x^2)|x|^d<=1 for 0<=d<=4, J>=a, and
integral exp(-y^2)dy=sqrt(pi). Since
||m^(k+2)||_infinity=2pi||rho_V^(k)||_infinity, this yields

    M_5 <=2sqrt(pi)[20/a^4+264b/a^5
                         +1440b^2/a^6+3240b^3/a^7],         (14)

    M_6 <=2sqrt(pi)[76/a^5+1560b/a^6+14400b^2/a^7
                         +68040b^3/a^8+136080b^4/a^9].      (15)

The companion checker verifies the polynomial recursions giving every
coefficient in (14)-(15). The same reasoning at higher orders also proves
smoothness; the low orders used here have explicit displayed bounds.

## 4. A completely explicit near-Gaussian remote cone

Suppose an independently established bound on a parameter/energy box is

    -B''(u)/4 >= c >0.

Let A_*,D_* bound (12) uniformly on that box, using its minimum a and
maximum b in (14)-(15). Define

    delta_0=min(1,[c/(2(A_*+D_*))]^4).                       (16)

For 0<delta<=delta_0, equations (11)-(16) give

    2E|L+q| <= B(u)-(c/2)delta.                             (17)

Thus the existence of the remote near-Gaussian cone no longer depends
on an unspecified constant in a total-variation Edgeworth theorem. The
displayed cone can be numerically tiny; optimizing these constants is a
separate task. This argument does not claim control outside that cone.

## 5. Stronger six-tensor estimate: the requested exponent 3/2

The matching argument has a useful strengthening on six vertices.
Every connected loopless subcubic multigraph on six vertices admits a
matching covering all its vertices of degree three. Here is a short proof
from the classical perfect-matching criterion of Tutte.

Write S for the degree-three vertices and T for the others. Add every
missing edge between vertices of T, obtaining a connected graph G'. A
perfect matching in G' restricts to a matching in the original graph
covering S. Conversely, any matching covering S can be completed using
the added clique edges, since the number of unmatched vertices is even.

If G' had no perfect matching, Tutte's criterion would give a set A such
that G'-A has more than |A| odd components. The excess is positive and
even. Connectedness excludes |A|=0, and cardinality excludes |A|>=3.

* If |A|=1, at least three odd components remain. All vertices of T outside
  A lie in one component, so at least two odd components contain only
  vertices of S. Each such component has at least three vertices: an
  isolated vertex of S would send all three of its original edges to
  the single vertex of A; if that vertex were in T it has degree at
  most two, and if in S these two vertices would form an isolated
  component of the original connected graph. Thus at least six vertices
  would remain after deleting one from six, a contradiction.
* If |A|=2, the four remaining vertices must all be singleton components.
  At most one can be in T, since T is a clique in G'. Therefore at least
  three vertices of S send all their original edges into A, requiring
  at least nine incident edges there. The two vertices in A have total
  original degree at most six, again a contradiction.

This proves the matching lemma. As before, doubling any six-factor
contraction kernel and matching inside both copies, with unmatched
vertices matched to their counterparts, gives six pair contractions.
Each pair uses one or two edges. For a pair within one copy, three
parallel edges would isolate its two vertices in the original graph.
For a pair across copies, three parallel edges would mean that the
original vertex had three open legs and internal degree zero, again
excluded by connectedness. Repeated Cauchy-Schwarz yields

    ||six-factor kernel|| <= C^3
                         <=kappa^(3/2)/36^3.               (18)

Closed kernels, with no open legs, cause no exception: then S is all six
vertices, and the matching exists entirely within each copy.

One more application of recursion (4) yields 50 terms in Gamma_5 with
the following aggregate coefficients:

| Output chaos degree | Sum of coefficients |
| --- | ---: |
| 0 | 94284 |
| 2 | 328536 |
| 4 | 108864 |
| 6 | 9720 |
| 8 | 243 |

Therefore

    ||Gamma_5||_1 <= ||Gamma_5||_2
       <=[94284+328536sqrt(2)+108864sqrt(24)
                    +9720sqrt(720)+243sqrt(40320)]
                     *kappa^(3/2)/46656
       <31 kappa^(3/2).                                   (19)

For an exact rational check, use sqrt(2)<3/2, sqrt(24)<5,
sqrt(720)<27, sqrt(40320)<201. The resulting numerator is 1442691,
whereas 31*46656=1446336, leaving a positive reserve of 3645.

Since X is symmetric, E Gamma_4=kappa_5(X)/24=0. One further integration
by parts turns (7) into

    E m(X)-E m(N_v)
       =-(kappa/6)E f_m'''(X)-E[Gamma_5 f_m'''''(X)].          (20)

Combine (19), ||f_m'''''||_infinity<=M_6/6, and the already proved
replacement bound (9). This proves the stronger estimate

    |E m(X)-E m(N_v)-(kappa/24)E m''''(N_v)|
       <=[31/6+sqrt(2)/216]M_6 kappa^(3/2)
       <6 M_6 kappa^(3/2).                                 (21)

Consequently the actual circular profile satisfies

    |2E|L+q|-B(u)-(delta/4)B''(u)|
       <=6(3/8)^(3/2)M_6 delta^(3/2),                       (22)

with the fully explicit M_6 from (15). If -B''(u)/4>=c>0 on the
chosen parameter/energy box, write

    E_*=6(3/8)^(3/2) sup_box M_6,
    delta_0=[c/(2E_*)]^2.                                  (23)

Then 0<delta<=delta_0 gives the definite remote loss (c/2)delta.
Unlike (16), this stronger cutoff requires no additional delta<=1
condition. The checker verifies every aggregate coefficient, both strict
constant bounds, the derivative recursions, and the matching property
for all 1432 five-vertex and 23590 six-vertex graphs in question.
