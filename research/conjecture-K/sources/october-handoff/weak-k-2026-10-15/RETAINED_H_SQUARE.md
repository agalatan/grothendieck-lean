<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/weak-k-20261015/package/penalty/RETAINED_H_SQUARE.md (file dated 2026-10-15). Only this line was added. -->
# A weaker target retaining both discarded squares

15 October 2026. This is an exact, dimension-independent inequality and dual certificate format. It does not establish a uniform bound on the resulting functional and does not itself improve a Grothendieck endpoint.

## 1. The additional square

Use the real pairing Re E[conj(x)y]. Let P and Q be orthogonal first- and third-chaos projections, f,g unimodular, h=(f+g)/2, k=(f-g)/2, Ph=tZ, B in ran Q, L=ell Z+B, and G=epsilon Qk. Then the row identity, before either negative square is discarded, is

    Re<f,(P-epsilon Q)g>
      = t²-2 ell t+||B||²/epsilon
        + Re E[conj(L+G)f+conj(L-G)g]-||G||²/epsilon
        - ||Pk||² - epsilon ||Qh+B/epsilon||².             (1)

Indeed -epsilon||Qh||²=2 Re<B,h>+||B||²/epsilon-epsilon||Qh+B/epsilon||², and epsilon||Qk||²=2 Re<G,k>-||G||²/epsilon. These are equalities. The previous K-prime functional kept only the Pk square. The Qh square is a second independent source of improvement.

Write R(G) for the supremum of the last two lines of (1), with |f|=|g|=1 and Qk=G/epsilon. We may drop Ph=tZ for an upper bound. For any M, the assertion

    sup_G R(G) <= M                                      (2)

is sufficient for the row, and is weaker than both K and the previous K-prime target at the same M. All G, including shared A/B terms, are included. It is not necessary to prove Gaussian domination of the unpenalized payoff.

## 2. Full dual with a common cubic shift

For arbitrary a in ran P and b,C in ran Q, define

    D_G(a,b,C) = E|L+G-a-b-C| + E|L-G+a+b-C|
       + ||a||² + ||C||²/epsilon
       - 2 Re<C,B>/epsilon + 2 Re<b,G>/epsilon
       - ||G||²/epsilon.                                (3)

Then R(G)<=D_G(a,b,C). In fixed finite Gaussian dimension there is equality after taking the infimum over a,b,C. The equality proof is the same finite-dimensional purification plus convex duality argument as for the earlier K-prime dual: preserve all moments against bases of P,Q and L±G, replace disk-valued f,g by unimodular ones, then apply minimax to the quadratic penalties and the linear Qk constraint. The upper-bound direction requires neither attainment, nonatomicity, nor finite-dimensionality; it is just two completed squares and the support function of the unit disk.

C shifts both channels in the same direction, whereas a+b shifts them oppositely. At a smooth minimizing response they satisfy

    a=Pk,   C=epsilon Qh+B,   Qk=G/epsilon.

There is also an exact gap identity. If f0=phase(w+) and g0=phase(w-), with arbitrary unit choices at zeros, then

    R(G)=Lambda(G)-inf { (1/2)E[|w+||f-f0|²+|w-||g-g0|²]
                         +||Pk||²+epsilon||Qh+B/epsilon||² },

where the infimum retains unimodularity and Qk=G/epsilon. Thus the retained cost is a tradeoff between moving the responses and leaving their moments nonzero. This identity covers zeros without inverse-modulus terms.

They must be optimized together. Subtracting the old response's squares from Lambda(G) is not an upper bound, because the maximizing response may readjust. Even a scalar disk example shows this (realizable on two equal atoms with P=0, Q the constant projection, G=0, and opposite signs of k): max_{|h|<=1} 0.4 Re h-|h|²=0.04, whereas subtracting the square at the unpenalized maximizer h=1 gives -0.6.

## 3. A nonsingular, finite Gram certificate

Fix tau>0. Put w±=L±G, rho±=max(|w±|,tau),

    k_tau=(w+/rho+ - w-/rho-)/2,
    h_tau=(w+/rho+ + w-/rho-)/2,
    B_tau=E[(tau-|w+|)_+²+(tau-|w-|)_+²]/(2 tau).

Use any finite trial spaces E_P subset ran P, E_k subset ran Q and E_h subset ran Q. They need not span their full chaoses. For v=(a,b,C), with e=a+b, let

    H(v,v)=||a||²+||C||²/epsilon
      + (1/2) E[|e+C|²/rho+ + |e-C|²/rho-],

and let r be the vector of pairings with

    P k_tau,  Q k_tau-G/epsilon,  Q h_tau+B/epsilon

on the three trial spaces. In orthonormal coordinates H is positive definite. Then

    R(G) <= Lambda(G)+B_tau-r* H^{-1} r.                 (4)

The smaller of this expression and Lambda(G) is also valid. For implementation a certified lower bound on r*H^{-1}r suffices: for every explicit trial vector v,

    r*H^{-1}r >= 2 Re(v*r)-v*Hv.

Consequently no matrix inversion is needed by an exact checker. Rational trial coefficients and enclosures of finitely many integrals suffice.

Proof: for any complex z,v and rho>0,

    |z-v| <= |z|+(rho-|z|)²/(2rho)
                 - Re(conj(z)v)/rho+|v|²/(2rho).

Apply it to the two moduli of (3), then minimize the resulting positive quadratic. This accounts for arbitrary response readjustment and retains the cross block between the symmetric and antisymmetric shifts. Ignoring that cross block generally changes the result.

Everything is integrable: rho±>=tau, the trial functions belong to L², and the clipped responses have modulus at most one. The clipping error is not optional. Always B_tau<=tau, and

    B_tau <= (tau/2) E[exp(-|w+|²/tau²)+exp(-|w-|²/tau²)].

For remote-only G independent of L=Z(a+b|Z|²), a>0,b>=0, the density bound gives B_tau<=tau³/(6a²). This density shortcut is not asserted when G contains visible A/B terms.

A cheap dimension-free corollary, obtained from H<=diag(1+1/tau,1/tau,1/epsilon+1/tau), is

    R(G) <= Lambda(G)+B_tau
      - tau/(1+tau)||P_E k_tau||²
      - tau||Q_E k_tau-G_E/epsilon||²
      - epsilon*tau/(epsilon+tau)||Q_F h_tau+B_F/epsilon||². (5)

The matrix certificate (4) is substantially sharper, but (5) requires no reciprocal-modulus Gram integrals.

## 4. The useful weaker conjecture

Let Q be the visible-independent part of G, and let D=G-Q contain all visible sectors. The following is enough:

    Lambda(G)+B_tau-r*H^{-1}r <= Lambda(Q)+eta_AB.         (6)

It replaces the content-vs-deficit conjecture by a statement involving both response channels and cubic consistency. Combined with the already certified remote bound Lambda(Q)<S+1e-5, a uniform eta_AB<=9e-5 fits the central-row 1.402 budget. Other rows and a common witness still need their own cover. Even a weaker quantitative eta_AB that beats the current gated envelope could give a smaller endpoint improvement.

Equation (6) remains open. Unlike a raw penalty comparison, it is a mathematically sufficient target and has a fully rigorous left-side upper bound. The finite Gram matrix may be chosen adaptively from G; a global theorem must justify the choice and certify its integrals uniformly.

## 5. What the diagnostic actually says

The supplied probe_h_square.py uses Sobol samples; it is not a certificate. It optimizes the A/B coefficients for nine Wick-junta-plus-Gaussian residuals, then uses a single joint dual trial from a clipped Gram solve, with tau=.01. In all nine stored points the decrease from that valid dual trial exceeds the A/B gain. For example:

    sigma=.20, junta weight=1:
      raw mixed gain              0.0016455133
      h-only dual reduction       0.0009870439
      joint h/Pk dual reduction   0.0029192966.

Thus the h-only correction does not always pay for the gain, while the combined one did in these tests. This is evidence for (6), not a proof. The calculation evaluates the actual shifted moduli after choosing the trial, so clipping affects the chosen trial but is not silently dropped from a claimed quadratic bound. It currently omits the b cubic-consistency multiplier; adding b can only lower the exact dual.

The finite-sum checker proves neither Gaussian integration nor the uniform comparison. It verifies the row identity, common/antisymmetric signs, completion squares, and the clipped-Gram certificate on an exhaustive finite rational test set; the proof above supplies the general algebra.

### Additional full-dual diagnostic

`probe_full_dual.py` adds the cubic-consistency multiplier b to all seven available cubic basis directions. The independent Gaussian buffer is treated as a grade-three limiting direction, not as an ordinary first-chaos direction. `full_dual_py312_FLOAT.log` records a new Sobol run (2^17 points, seed 321). Every full-dual trial improves the h/Pk-only trial. At sigma=.20 and junta weight 1 it reduces the raw payoff by .0073513, against mixed gain .0016472; at weight .3 it reduces by 7.45e-5, against gain 7.91e-6. Those numbers still are not certificates. Much of the extra reduction at nonoptimal sigma comes from cubic stationarity, as expected, so one must not extrapolate them uniformly to an optimized adversary.
