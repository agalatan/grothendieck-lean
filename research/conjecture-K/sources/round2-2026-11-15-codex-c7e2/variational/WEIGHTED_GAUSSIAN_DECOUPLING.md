<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/variational/WEIGHTED_GAUSSIAN_DECOUPLING.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended path: handoff/codex-c7e2-round2/variational/WEIGHTED_GAUSSIAN_DECOUPLING.md -->
# Quantitative weighted Gaussian decoupling for a remote cubic

Agent-ID: codex-c7e2. 2026-11-15. This is an analytic lemma, not a proof of Conjecture K.

Let q=q_1+i q_2 be circular, with q_1,q_2 in the third real Gaussian
Wiener chaos over an arbitrary real Gaussian Hilbert space. Put

    u=E|q|^2,  kappa=E|q|^4-2u^2.

Let G be an independent proper complex Gaussian of variance u. Let C,D
be any real Gaussian polynomials of degree at most two, defined on the
same Gaussian space as q, and let K:R^2 -> R be bounded, with bounded
continuous derivatives through order two. Write

    M_1=max_l ||partial_l K||_infinity,
    M_2=max_l,k ||partial_l partial_k K||_infinity.

Then kappa>=0 and

    | E[CD K(q)] - E[CD] E[K(G)] |
      <= [3 sqrt(3) M_2 sqrt(kappa)
          +(4 sqrt(5)/3)(3/8)^(1/4) M_1 kappa^(1/4)]
         ||C||_2 ||D||_2.                                  (1)

All constants are dimension-free. No statistical independence of q,C,D
is assumed. Constants and mixed first/second-chaos polynomials are allowed
as C,D. In particular this applies to the products of remote coefficient
fields occurring in the full visible Hessian of Conjecture K.

## 1. The exact third-chaos contraction bounds

Use the convention E[I_m(f)^2]=m! ||f||^2 and put X=I_3(f), with f
symmetric. The Gaussian multiplication formula gives

    cum_4(X)
      =1944 ||sym(f tensor_1 f)||^2
       +1296 ||f tensor_2 f||^2.                            (2)

Indeed the fourth moment follows by squaring

    X^2=I_6(sym(f tensor f))+9 I_4(sym(f tensor_1 f))
          +18 I_2(f tensor_2 f)+6||f||^2,

and using

    6! ||sym(f tensor f)||^2
      =72||f||^4+648||f tensor_2 f||^2.

If DX is the Malliavin gradient, the same multiplication formula gives

    Var(||DX||^2)
      =1944 ||sym(f tensor_1 f)||^2
       +2592 ||f tensor_2 f||^2
      <=2 cum_4(X).                                        (3)

There is also the following mixed bound, valid for every real
degree-at-most-two polynomial H:

    ||<DX,DH>||_2 <= sqrt(5) cum_4(X)^(1/4) ||H||_2.          (4)

For its proof, write H=c+I_1(g)+I_2(h). The first-chaos contribution is

    <DX,D I_1(g)>=3 I_2(f tensor_1 g),

with squared norm 18||f tensor_1 g||^2. The second-chaos contribution is

    <DX,D I_2(h)>
       =6 I_3(sym(f tensor_1 h))+12 I_1(f tensor_2 h),

with squared norm at most

    216||f tensor_1 h||^2+144||f tensor_2 h||^2.

Each of the three unsymmetrized squared contraction norms is bounded
by ||f tensor_2 f|| times the squared norm of g or h, as appropriate.
For example, regarding f as an operator from the underlying Hilbert
space into its symmetric square, its squared operator norm is
||f tensor_2 f||_op <= ||f tensor_2 f||_HS. The remaining contraction
estimate is the Hilbert-Schmidt trace inequality for h h^*.
By (2), ||f tensor_2 f|| <= sqrt(cum_4(X))/36. Thus the two squared
contributions are bounded by

    (1/2) sqrt(cum_4(X)) ||I_1(g)||_2^2,
    5 sqrt(cum_4(X)) ||I_2(h)||_2^2.

They are orthogonal, lying respectively in chaos 2 and chaoses 1+3.
Adding proves (4).

Circularity implies that every unit real projection q_theta has

    E q_theta^2=u/2,
    cum_4(q_theta)=(3/8)kappa =: kappa_0.                    (5)

Set Gamma_lk=<Dq_l,Dq_k>. From (3), and polarization into the two
orthogonal unit projections at angles pi/4 and -pi/4 for the off-diagonal
entry, we obtain for every l,k in {1,2}

    ||Gamma_lk-3(u/2) delta_lk||_2 <= sqrt(2 kappa_0).         (6)

Equation (4) gives

    ||<Dq_l,DC>||_2 <= sqrt(5) kappa_0^(1/4) ||C||_2.         (7)

## 2. Interpolation with a fixed polynomial weight

Let V=CD, and q_t=sqrt(t)q+sqrt(1-t)G for 0<t<1. The auxiliary
Gaussian G is independent of q,C,D throughout. Gaussian integration
by parts in G and third-chaos integration by parts in q give exactly

    d/dt E[V K(q_t)]
      =(1/6) sum_l,k E[V (Gamma_lk-3(u/2)delta_lk) K_lk(q_t)]
       +(1/(6sqrt(t))) sum_l E[<Dq_l,DV> K_l(q_t)].           (8)

To verify the coefficient in the first term, use
E[q_l F]=(1/3)E< Dq_l,DF >. Differentiating K(q_t) contributes
sqrt(t); the independent-Gaussian term contributes
-(1/2)sum_l,k (u/2)delta_lk E[V K_lk(q_t)].

Degree-two Gaussian hypercontractivity gives

    ||V||_2 <= ||C||_4 ||D||_4 <=9||C||_2||D||_2.            (9)

The product rule, Cauchy-Schwarz, and (7) give

    E|<Dq_l,DV>|
       <=2sqrt(5) kappa_0^(1/4)||C||_2||D||_2.               (10)

The first term of (8), summed over four pairs and integrated over
t in [0,1], is therefore at most

    6 sqrt(2 kappa_0) M_2 ||C||_2||D||_2.

The second term, summed over two coordinates and using
integral_0^1 t^(-1/2) dt=2, is at most

    (4sqrt(5)/3) kappa_0^(1/4) M_1 ||C||_2||D||_2.

Insert (5). Since q_0=G is independent of V and q_1=q, this is (1).
The endpoint limiting and differentiation steps are justified by the
bounded first and second derivatives, Gaussian moments of the polynomial
weights, and the displayed integrable t^(-1/2) bound. Approximation proves
the same result for K in C_b^2 without higher differentiability.

## 3. Why the visible Hessian supplies the required smooth test

Let Z be independent standard proper complex Gaussian and
L(Z)=Z(a+b|Z|^2), with a>0 and b>=0. Each visible Hessian entry after
integrating Z has the form

    K(q)=integral Hess(|.|)_alpha,beta(w+q) rho(w) dw,         (11)

where rho is the pushforward under L of a polynomial in Re Z,Im Z of
degree at most six times the Gaussian density. The polynomial may be
signed. The inverse radial map and its derivatives have polynomial growth;
its real Jacobian is (a+b|Z|^2)(a+3b|Z|^2)>0. Consequently rho is Schwartz.
These bounds are uniform when (a,b) ranges over a compact set with a>0.

The entries of Hess(|.|)(w) are bounded in absolute value by 1/|w|.
Move derivatives in (11) to rho. For each multi-index alpha,

    ||partial^alpha K||_infinity
       <= 2pi ||partial^alpha rho||_infinity
             +||partial^alpha rho||_1 < infinity.            (12)

The two terms arise from |w+q|<1 and its complement, respectively.
Thus K belongs to C_b^infinity with locally uniform bounds in a,b.

Expanding the visible perturbation into its ten real coefficient fields
and applying (1) to their pairwise products proves a dimension-uniform
Hessian comparison of order

    O(kappa^(1/4)+sqrt(kappa)) ||H||_2^2.                    (13)

This comparison treats all coefficient sharing. Combined with the separate
uniform remainder in TAYLOR_REMOTE_BASE.md, it rigorously passes a Gaussian
remote Hessian estimate to a small-cumulant remote cubic and then to small
finite visible perturbations. It does not by itself control the linear
term or establish the global sign required by full Conjecture K.
