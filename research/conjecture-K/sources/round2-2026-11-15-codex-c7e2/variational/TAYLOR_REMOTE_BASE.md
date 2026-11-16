<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/variational/TAYLOR_REMOTE_BASE.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended path: handoff/codex-c7e2-round2/variational/TAYLOR_REMOTE_BASE.md -->
# Uniform second-order expansion at every remote core

Agent-ID: codex-c7e2. 2026-11-15. This is a proved analytic estimate, not a proof of Conjecture K.

Let Z be standard proper complex Gaussian, T=|Z|^2, and
L=Z(a+bT), a>0, b>=0. Let Y be an independent remote Gaussian vector
of any finite dimension, and q=q(Y) any measurable complex random variable.
Consider the genuine visible cubic perturbation

    H=(T-1)r_A(Y)+Z^2 conjugate(r_B(Y))/sqrt(2)
       +Z Q(Y)+conjugate(Z) P(Y)+d Z(T-2)/sqrt(2).              (1)

The remote coefficient vector has degree at most two: r_A,r_B are linear,
Q,P quadratic, d constant. Write tau=||H||_2. No independence between
these coefficients, or between them and q, is required.

For A=L+q, define

    D_A(H)=Re(conjugate(A)H)/|A|,
    K_A(H)=(Im(conjugate(A)H))^2/|A|^3.

The zero set A=0 has probability zero; arbitrary values there have no effect.
Then all displayed expectations exist and

    |E|A+H|-E|A|-E D_A(H)-(1/2)E K_A(H)|
       <= C a^(-3/2) tau^(5/2),                              (2)

where

    C=52*5^(1/4)*(3/2)^(5/2) < 215.

In particular this estimate is uniform in the dimension, q, its energy,
and all sharing of the coefficient fields. If q is not integrable, (2) is
interpreted as the expectation of the pointwise difference; to use the
separated terms E|A+H| and E|A| assume q is integrable. For K, q is L2.

For the paired functional, apply (2) to (L+q,H) and (L-q,-H).
The total remainder is at most 430 a^(-3/2) tau^(5/2); the quadratic
energy penalty has no remainder. Thus the averaged expansion has a
dimension-uniform o(tau^2) error even though individual conditional
Hessians at nonremote even cores can be singular.

## 1. A pointwise interpolation remainder

For nonzero A and arbitrary H let

    R=|A+H|-|A|-D_A(H)-(1/2)K_A(H).

The supporting-plane inequality and the arithmetic-geometric mean bound
give

    0 <= |A+H|-|A|-D_A(H) <= |H|^2/(2|A|).

Also 0<=(1/2)K_A(H)<=|H|^2/(2|A|). Consequently

    |R| <= |H|^2/(2|A|).                                    (3)

If |H|<=|A|/2, the function f(t)=|A+tH| has
|f'''(t)|<=3|H|^3/|A+tH|^2<=12|H|^3/|A|^2 on [0,1],
and Taylor's integral remainder gives |R|<=2|H|^3/|A|^2.
If |H|>|A|/2, (3) gives the stronger |R|<|H|^3/|A|^2.
Thus the cubic estimate holds everywhere. Taking the geometric mean
of the quadratic and cubic bounds proves

    |R| <= |H|^(5/2)/|A|^(3/2).                              (4)

## 2. Weighted density control in the visible coordinate

Set

    S(Y)=|r_A|^2+|r_B|^2+|Q|^2+|P|^2+|d|^2,
    B(T)^2=(T-1)^2+T^2/2+2T+T(T-2)^2/2
          =1+2T-T^2/2+T^3/2 <= (1+T)^3.

Cauchy-Schwarz in (1) gives |H|<=B(T)sqrt(S). The five visible
basis functions in (1) are orthonormal for the complex Gaussian law,
so E S=E|H|^2=tau^2, regardless of remote sharing.

The map z -> z(a+b|z|^2) is a C1 diffeomorphism with real Jacobian
(a+b|z|^2)(a+3b|z|^2)>=a^2. The weighted measure

    nu(E)=E_Z[B(T)^(5/2) 1{L(Z) in E}]

therefore has density at most

    (pi a^2)^(-1) sup_{t>=0} e^(-t)(1+t)^(15/4)
      <= (pi a^2)^(-1) sup e^(-t)(1+t)^4
      =256/(e^3 pi a^2) <13/(pi a^2).

Its total mass is at most E(1+T)^4=65. For any finite measure of
mass m and density at most M on the plane, rearrangement/layer cake gives

    integral |w-x|^(-s) dnu(w)
      <= [2/(2-s)](pi M)^(s/2)m^(1-s/2),  0<s<2.             (5)

Indeed nu(B(x,r))<=min(m,pi M r^2), and integration of these two
bounds at r=sqrt(m/(pi M)) proves (5). Use s=3/2, m<=65,
M<=13/(pi a^2) to obtain, uniformly in every shift x,

    E_Z[B(T)^(5/2)/|L(Z)-x|^(3/2)]
       <=52*5^(1/4) a^(-3/2).                               (6)

No condition on x, hence no condition on q(Y), is used.

## 3. Low-degree coefficient hypercontractivity

The Gaussian hypercontractive inequality for degree-at-most-two
polynomials says ||F||_(5/2)<=(3/2)||F||_2. For a complex vector of
such polynomials the same bound holds: apply scalar hypercontractivity
to its real coordinates and Minkowski to the sum of their squares in
L^(5/4). Therefore

    E S^(5/4) <= (3/2)^(5/2) (E S)^(5/4)
              = (3/2)^(5/2) tau^(5/2).                      (7)

Conditioning (4) on Y and using (6), then (7), proves (2).

The linear term is integrable by |D_A(H)|<=|H|. The quadratic term
is integrable by the same weighted-density argument at exponent one
and the coefficient second moment (or ordinary Holder using the bounded
density of A and Gaussian moments of H).

## 4. Scope

This supplies the uniform finite-amplitude remainder needed to pass from
a proved Hessian estimate at remote q to a sufficiently small visible
perturbation. It does not establish the sign of that Hessian, or a uniform
joint Gaussian approximation with all coefficient fields. Those are
separate mathematical obligations. The visible-coordinate independence
of q is essential to the proof; it does not claim the same bound for an
arbitrary even base containing A/B sectors.
