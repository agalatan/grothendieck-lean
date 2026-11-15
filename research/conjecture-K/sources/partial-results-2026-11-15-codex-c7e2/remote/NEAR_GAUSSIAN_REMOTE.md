<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/remote/NEAR_GAUSSIAN_REMOTE.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- codex-c7e2-research/remote/NEAR_GAUSSIAN_REMOTE.md; Agent-ID: codex-c7e2. -->
# Exact remote domination in a uniform near-Gaussian cone

This is a paper proof using an external theorem, not a Lean formalization.
The threshold below is positive and dimension independent but is not numerically
evaluated. It does not prove full Conjecture K.

Baseline: `agalatan/grothendieck-lean`, commit
`6bb44599190397f806d2db89b25df4e6785b758e`.

## External input and normalization

Use Theorem 1.2, with chaos order 3 and expansion order 2, of
Mansanarez--Poly--Swan, *Edgeworth expansion on Wiener chaos*,
https://arxiv.org/html/2510.14002v2 . It provides a dimension-independent
constant C such that the total variation error of the signed Hermite expansion
through degree seven is bounded by C Var(Gamma(F,F))^(3/2), for every
variance-one F in the real third chaos.

For such F, the standard spectral identity gives
Var(||DF||^2) <= 2 kappa_4(F). In fact, writing
F^2=1+U_2+U_4+U_6 and Gamma_1=||DF||^2/3, one has
Gamma_1-1=(2/3)U_2+(1/3)U_4. Thus
Var(Gamma_1) <= (2/3) E[(Gamma_1-1)F^2]
= (2/9) kappa_4(F), using E[Gamma_1 F^2]=E[F^4]/3.

Consequently there is a finite dimension-independent A such that, for every
bounded Borel h and every symmetric variance-one third-chaos F,

    |E h(F) - E[h(N)(1 + kappa H_4(N)/24 + kappa_6 H_6(N)/720)]|
        <= A ||h||_infinity kappa^(3/2),                 (1)

where N is standard real Gaussian and kappa=kappa_4(F). Odd Hermite
coefficients vanish by symmetry; E H_4(F)=kappa and E H_6(F)=kappa_6.
The constant A absorbs the source's normalization of Gamma and the choice
of total-variation convention. Only the existence of a finite universal A
is used. The application below uses a bounded continuous test function.

Only for real projections of complex H_(2,1) cubics, use the repository's
proved sixth-cumulant bound

    kappa_6 <= C6 * 10/(3 sqrt(6)) * kappa^(3/2)
             < 56 kappa^(3/2),
    C6=4045313/100000.                                (2)

The source theorems are `SixthMoment.cumulant_bound`, instantiated without
tensor hypotheses in `Circular.lean`. An arbitrary pair of real third-chaos
variables is not covered by this sixth-cumulant input.

## Truncated absolute value removes the smoothness obstruction

Put c=sqrt(2/pi), phi(x)=exp(-x^2/2)/sqrt(2pi), and
h_R(x)=min(|x|,R). Gaussian integration by parts in distributions gives

    A_4(R) := E[h_R(N) H_4(N)]
            = -c - 2 phi(R)(R^2-1),
    A_6(R) := E[h_R(N) H_6(N)]
            = 3c - 2 phi(R)(R^4-6R^2+3).              (3)

Indeed h_R''=2 delta_0-delta_R-delta_(-R), and
E[h_R(N)H_(2m)(N)] is its pairing with phi H_(2m-2).
For R>=3,

    A_4(R)<=-c,           0<A_6(R)<=3c.              (4)

For the second assertion, H_4(R)>0 for R>=3. Also
e^(-R^2/2)H_4(R)<3: for R>=3 it is at most
e^(-R^2/2)R^4 <= 81e^(-9/2)<3, since the last function is decreasing
there and e^(9/2)>27. This last exponential inequality follows already
from the first five terms of its Taylor series.

Suppose 0<kappa<=1/81 and choose R=kappa^(-1/4)>=3.
Symmetry and (2) imply

    E F^6 = 15+15kappa+kappa_6
           <=15+15/81+56/729 <16.

Hence E(|F|-R)_+ <= E|F|^6/R^5 <=16 kappa^(5/4).
Apply (1) to h_R, then (2)--(4). The sign in (4) means that only the
upper bound on kappa_6 is needed, not an absolute sixth-cumulant bound:

    E|F| <= c - c kappa/24
              + (56c/240) kappa^(3/2)
              + A kappa^(5/4) +16 kappa^(5/4)
          <= c - c kappa/24 +(A+17) kappa^(5/4).     (5)

Define

    kappa_0 = min{1/81, [c/(48(A+17))]^4} >0.

For every admissible F with 0<kappa<=kappa_0, (5) gives

    E|F| <= c(1-kappa/48).                           (6)

This uses no smooth test-function approximation to |x| and no bounded
inverse Malliavin derivative. The unbounded tail is controlled by a sixth
moment already available in this repository.

## Complex radius theorem and Gaussian buffers

Let q be any nonzero H_(2,1) cubic in any finite dimension. Set

    u=E|q|^2, delta=E|q|^4-2u^2, chi=delta/u^2,
    F=sqrt(2/u) Re q, chi_0=2kappa_0/3.

Circularity gives Var(F)=1, symmetry, kappa_4(F)=3chi/2, and
E|q|=(pi/2)sqrt(u/2) E|F|. Therefore (6) proves

    E|q| <= (sqrt(pi)/2)sqrt(u)(1-chi/32)
                      whenever 0<chi<=chi_0.         (7)

For an independent standard complex Gaussian W and v>=0 the same argument
gives a quantitative buffer extension:

    E|q+sqrt(v)W|
       <= (sqrt(pi)/2)sqrt(u+v)
             [1-delta/(32(u+v)^2)].                 (8)

Here is the closure argument, including the threshold issue. On fresh
coordinates take H(X)=X(|X|^2-2)/sqrt(2) and
q_N=q+sqrt(v/N) sum_(j<=N) H(X_j). Then q_N remains in H_(2,1), its
energy is u+v, and its fourth excess is delta+42v^2/N. If v>0 and
chi<=chi_0, the normalized excess of q_N is below chi_0 for all sufficiently
large N, because delta/(u+v)^2 <chi_0. Apply (7) and let N tend to
infinity. The two-dimensional CLT and uniform L2 bounds justify convergence
of absolute moments. For v=0, (8) is simply (7).

## Exact same-variance remote comparison, all scales and profiles

Take any independent circular Gaussian scale mixture L=sqrt(V)W_0 with
V>0 and E sqrt(V)<infinity. This includes every visible profile
L=Z(a+b|Z|^2), a>0,b>=0, by the previously proved mixture representation.
Write B(u)=2E|L+sqrt(u)W|=sqrt(pi) E sqrt(V+u).
Conditioning (8) on V yields

    D(q):= B(u)-2E|L+q|
          >= sqrt(pi) delta/32 E(V+u)^(-3/2)
           = [-B''(u)] delta/8 >0                    (9)

for every nonzero q with 0<chi<=chi_0. The derivative formula is valid
at every u>0 by domination by u^(-3/2). Thus

    Lambda_p(q) <= B(u)-pu-[-B''(u)]delta/8 <= S_p,
    S_p=sup_(v>=0)[B(v)-pv],                         (10)

for every p>0, every u>0, every finite dimension, and every such profile.
The zero cubic gives equality with B(0) before optimizing the benchmark.

## Scope and novelty boundary

This proves a universal near-Gaussian cone for the remote problem, with
an actual strictly positive deficit and without an additive numerical
allowance. It requires no independent-block structure in q; the blocks
enter only to realize a Gaussian buffer while retaining the cubic chaos.
It does not give a usable numerical value of chi_0 until an explicit
constant in the external TV theorem is evaluated. It says nothing about
general chi or cubics coupled to the visible coordinate. It therefore
does not establish Conjecture K or a new Grothendieck endpoint.

The current record already has fixed-block asymptotics and an older
smooth Edgeworth claim marked unreconstructed. The proof above instead
uses the dimension-uniform TV theorem to reach the nonsmooth unbuffered
radius, and then obtains every Gaussian buffer and every positive visible
profile at once.
