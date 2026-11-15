<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-edgeworth/PROOF.md (2026-11-15). Only this line was added. -->
# An explicit scalar Edgeworth deficit

Agent-ID: codex-a7c4. Refs #446. Author-only paper derivation and exact
arithmetic check; independent mathematical review is pending. This is a
scalar remote result. It assumes neither the compact joint inequality (P)
nor the odd-sector premise, and proves neither of them.

## Statement

Use a=699/1250, b=179/1250, L=Z(a+b|Z|²), with Z a standard proper
complex Gaussian. Let q be any remote H₂,₁ cubic, independent of Z, with

    u=E|q|², delta=E|q|⁴-2u², chi=delta/u²,
    kappa6c=E|q|⁶-6u³-9u delta,
    B(u)=2E|L+sqrt(u)W|, D(q)=B(u)-2E|L+q|.

W is a further independent standard proper complex Gaussian. For
0<u<=463/10000, the following explicit expansion holds:

    2E|L+q| = B(u)+(delta/4) B''(u)
                        +(kappa6c/36) B'''(u)+R,
    |R| <= 1920000 delta^(3/2).                         (1)

In particular, uniformly over dimension and all such cubics,

    3/100<=u<=463/10000 and chi<=10^-14
        imply D(q)>=(7/50)delta.                       (2)

The cutoff is intentionally very small. This supplies a dimension-free
quantitative neighborhood of the Gaussian limit, not a useful global
Grothendieck endpoint by itself. The reviewed content bound
||c_(3/5)(q)||²<=(3/80)delta on this energy interval then implies

    ||c_(3/5)(q)||² <= (3/10)D(q)                      (3)

on this neighborhood, without the additive 6*10^-6 in the global
content-deficit estimate. All other chi remain outside this new claim.

## 1. Relation to the Edgeworth literature

Mansanarez, Poly and Swan, *Edgeworth expansion on Wiener chaos*,
arXiv:2510.14002v2 (27 October 2025), Theorem 1.2, give signed Gaussian
Hermite expansions with a remainder controlled by powers of the variance
of the carré du champ. Their second expansion has the fourth and sixth
Hermite corrections when the law is symmetric. The proof below uses
their integration-by-parts strategy, specialized to an even, smoothed
payoff and real third chaos. Keeping the two nonconstant chaos
projections of the carré du champ makes every constant explicit.

Primary source: https://arxiv.org/html/2510.14002v2

The normalization used here is Gamma(F)=||DF||², E Gamma(F)=3 when
E F²=1. The factorless variance comparison in that paper's introduction
must not be used with this normalization. We use the independently
reviewed real-third-chaos comparison Var Gamma(F)<=2 kappa4(F), recorded
in `sources/received-2026-11-15-tilted-sector/content_tensor_next.md`,
equation (3), and its `REVIEW.md`. No numerical constant is inferred from
an unspecified asymptotic O-term.

## 2. A smooth-test remainder with explicit constants

Let F be a real third-chaos element with E F²=1, and let h be an even
smooth function of at most linear growth, with bounded first through
seventh derivatives. Write N for a standard real Gaussian, ell for the
one-dimensional Ornstein-Uhlenbeck operator, and Lcal for the operator
on the original Gaussian space. Put

    U=Gamma(F)-3=U₂+U₄, sigma²=E U².

The summands are orthogonal real-chaos projections. The Stein solution is

    phi_h(x)=-integral_0^infinity e^-t (P_t h')(x) dt,
    phi'_h(x)-x phi_h(x)=h(x)-E h(N).

Differentiation of the semigroup representation gives

    M:=||phi_h^(6)||_infinity <= ||h^(7)||_infinity/7.  (4)

The solution is odd, so its derivative is even. Subtract its Hermite
components of orders 0, 2 and 4:

    psi=phi'_h-sum_(j=0,2,4) E[phi'_h(N)H_j(N)] H_j/j!.

Then psi has Hermite rank at least 6. Gaussian integration by parts
four times gives

    v:=psi''''=phi_h^(5)-E phi_h^(5)(N),
    E v(N)=0, Lip(v)<=M.                              (5)

The usual Stein identity and H_j'=j H_(j-1) give the exact remainder
identity

    E h(F)-E h(N)-E H₄(F) E[h(N)H₄(N)]/24
                       -E H₆(F) E[h(N)H₆(N)]/720
        =-(1/3) E[psi(F)U].                           (6)

One can obtain (6) without an infinite Hermite expansion: insert the
three subtracted polynomials in the Stein identity and use
E[H_j(F)U]=3 E H_(j+2)(F)/(j+1), and
E[phi'_h(N)H_j(N)]=-E[h(N)H_(j+2)(N)]/(j+2).
Odd Hermite moments vanish; E H₂(F)=0. The growth assumptions allow
these integrations by parts directly.

For lambda>-1 and a centered Lipschitz v, define

    R_lambda v=-integral_0^infinity e^(-lambda t) P_t v dt.

This is (ell-lambda)^-1 v. Coupling the Mehler kernels started at x
and an independent stationary N shows

    |P_t v(x)|<=Lip(v)e^-t(|x|+E|N|).

Consequently the integral converges, its Gaussian mean is zero, and

    Lip(R_lambda v)<=Lip(v)/(1+lambda).                (7)

Now let W_k be in the kth real chaos. The chain rule and symmetry of
Lcal imply, for suitable f,

    E[((ell+k/3)f)(F) W_k]=-(1/3)E[f''(F)U W_k].     (8)

Apply (8) first to U_k, k=2,4, with
f=(ell+k/3)^-1 psi. The inverse exists on Hermite rank at least 6.
Decompose the resulting product U U_k into its orthogonal projections
W_(k,l) with l=0,2,4,6,8. Apply (8) again, now on rank at least 4.
Since l/3<=8/3<4, this second inverse exists. Commuting two derivatives
through each inverse yields exactly

    E[psi(F)U]=(1/9) sum_(k=2,4) sum_(l=0,2,4,6,8)
        E[(R_(2-l/3) R_(4-k/3) v)(F) U W_(k,l)].      (9)

All final resolvent parameters in (9) exceed -1. The derivatives reduce
Hermite rank by two at each step, so no forbidden eigenfunction is
inverted. Formula (9) can also be derived first for Hermite polynomials
and then by smooth semigroup approximation with polynomial growth.

By (7), centering, E F²=1 and E|N|<1, the L² norm of the test factor in
(9) is at most

    2M/[(3-l/3)(5-k/3)].                              (10)

Hypercontractivity gives ||U||₄<=9 sigma and
||W_(k,l)||₄<=3^(l/2)||W_(k,l)||₂. Therefore

    ||U W_(k,l)||₂<=9 sigma 3^(l/2)||W_(k,l)||₂,
    ||U U_k||₂<=9 sigma 3^(k/2)||U_k||₂.

Use Cauchy-Schwarz first over l, exploiting the orthogonality of the
W_(k,l), then over k, exploiting ||U₂||₂²+||U₄||₂²=sigma². Equations
(6), (9) and (10) give the explicit smooth-test remainder bound

    |remainder| <= 6 M sqrt(S_K S_L) sigma³,
    S_K=sum_(k=2,4) 3^k/(5-k/3)²=133002/20449,
    S_L=sum_(l=0,2,4,6,8) 3^l/(3-l/3)²=659393389/11025,
    sqrt(S_K S_L)<625.                               (11)

No density or nondegeneracy assumption on F was used.

## 3. Smoothing from the visible Gaussian scale mixture

The reviewed visible-law identity is L =_law sqrt(V)W with V>0,
independent of W; ledger 2.7. Write H(t)=t(a+bt)² and tau=H^-1.
The density of |L|² is

    k(s)=exp(-tau(s))tau'(s)=E[V^-1 exp(-s/V)].

At zero, inverse-series substitution gives

    tau(s)=s/a²-2b s²/a⁵+7b² s³/a⁸+O(s⁴),
    E V^-3=k''(0)=a^-6+12b a^-7+42b² a^-8<224.        (12)

The passage from k''(s) to E V^-3 as s decreases to zero follows from
monotone convergence for the positive mixture. Analyticity of tau near
zero supplies the finite right limit. The same argument gives all finite
inverse moments if needed for smooth approximations.

Let X=Re L. Its characteristic function is E exp(-V t²/4). Fourier
inversion and (12) give

    ||f_X^(5)||_infinity
      <=(1/pi) E integral_0^infinity t⁵ exp(-Vt²/4) dt
      =(64/pi) E V^-3.

For s=sqrt(u/2), take the even, smoothed payoff

    h(x)=g_u(x)=pi E|X+s x|.

Since the second distributional derivative of absolute value is twice
the Dirac mass, differentiating the convolution gives

    ||g_u^(7)||_infinity <=2pi s⁷ ||f_X^(5)||_infinity
                         <=128 s⁷ E V^-3.            (13)

All lower derivatives have the required bounds. The payoff has at most
linear growth. Its Gaussian Stein solution therefore satisfies (4).

## 4. Circular projection and the correction coefficients

For F=Re q/sqrt(u/2), circularity and cubic parity give

    E F²=1, E H₄(F)=3delta/(2u²),
    E H₆(F)=5kappa6c/(2u³),
    Var Gamma(F)<=2 kappa4(F)=3delta/u².              (14)

The elementary angular identity E|Re C|=(2/pi)E|C| for a circular
complex C, and independence from L, imply

    E g_u(F)=2E|L+q|, E g_u(N)=B(u).

The Gaussian heat equation, with variance u/2, gives

    E g_u^(2j)(N)=2^j u^j B^(j)(u).

Using Gaussian integration by parts in the fourth and sixth corrections
in (6) proves the coefficients delta/4 and kappa6c/36 in (1). They can
also be checked on the radial fourth and sixth moment tests: their
Gaussian values are 2u² and 6u³, and the corrections give respectively
delta and 9u delta+kappa6c.

Combining (4), (11), (13) and (14), the remainder coefficient multiplying
delta^(3/2) is at most

    6*625*(128/7)*224 * [3^(3/2)/2^(7/2)] * sqrt(u).

Since u<=.0463<1/16 and 27/128<1/4, this is strictly below

    6*625*(128/7)*224*(1/2)*(1/4)=1920000.             (15)

This proves (1), including its actual numerical constant.

## 5. Signed deficit and the explicit neighborhood

The visible mixture also gives B(u)=sqrt(pi)E sqrt(V+u), with
E V=a²+4ab+6b²=1181331/1562500. On the stated central energy interval,
E V+u<81/100. Jensen's inequality, sqrt(pi)>7/4 and sqrt(pi)<9/5 give

    -B''(u)/4 > (7/4)/(16(9/10)³)>3/20,
    0<B'''(u)=3sqrt(pi)/8 E(V+u)^(-5/2)<4400.

The last estimate uses u>=3/100 and sqrt(3/100)>173/1000.
The reviewed cubic sixth-moment inequality gives
kappa6c<=(4045313/100000)delta^(3/2), so the sixth correction is at most
5000delta^(3/2). Its sign need not be assumed. Thus (1) implies

    D(q)>=(3/20)delta-1925000delta^(3/2).             (16)

If chi<=10^-14, then sqrt(delta)=u sqrt(chi)<=463/(10000*10^7), and

    3/20-1925000*463/(10000*10^7)>7/50.

This proves (2). Finally 3/80 < (3/10)(7/50), proving (3) from the
reviewed content estimate. The exact rational checks, inverse series and
Hermite normalizations are replayed by `code/edgeworth-codex-a7c4/verify.py`.
That script checks the arithmetic in this paper argument; it is not a
Lean proof of the analytic argument and is not run by repository CI.
