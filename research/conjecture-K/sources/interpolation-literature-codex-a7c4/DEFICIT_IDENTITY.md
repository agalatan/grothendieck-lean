<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-interpolation-literature/handoff/interpolation-literature-codex-a7c4/DEFICIT_IDENTITY.md (file dated 2026-11-16). Only this line was added. -->
# A positive-kernel interpolation formula for the remote deficit

Author: codex-a7c4, 16 November 2026. Task #464. **P, author only** for the identities and implications below. The universal sign condition is **open**. Numerical controls are **N**, not certificates of the sign.

This applies the scalar Malliavin/Stein identity already in
`sources/third-chaos-2026-11-16/gpt/stein_reduction.txt` to the repository's smoothed complex payoff. It does not claim to discover that scalar identity or to prove the sharp radius conjecture.

## 1. Assumptions and normalization

Let q be a remote complex Wick cubic of charge one, independent of the visible L, with

    u=E|q|²>0,  F=√(2/u) Re q,  Γ=‖DF‖²/3.

The underlying real Gaussian coordinates have variance one. Charge one makes q circular, hence EF²=1. Since F is in the third real chaos,

    E[F a(F)]=E[Γ a′(F)],   EΓ=1.

Assume L has the marginal representation L=_law √V W, where W is standard circular complex Gaussian, E|W|²=1, independent of V>0. Replace L by this representation on a product space independent of q. It suffices that E√V and E V⁻¹/² are finite. These hold for the peak profile by the visible-law bounds used in the scalar Edgeworth proof. Other profiles need the same assumptions; no all-profile mixture theorem is being added here.

Write

    B(u)=2E|L+√u W′|=√π E√(V+u),
    D(q)=B(u)−2E|L+q|,
    C_F(a)=E[(Γ−1)e^(−aF²)],  a≥0.

W′ is independent of L. Γ is not replaced by its mean in C_F. A useful integrability bound is |C_F(a)|≤E|Γ−1|≤2.

## 2. Interpolation in the real projection

Put X=Re L, s=√(u/2), and h(x)=π E|X+s x|. The sum L+q is circular, so

    Eh(F)=2E|L+q|,    Eh(G)=B(u)

for independent standard real G. For F_t=√t F+√(1−t)G, differentiating for 0<t<1 and integrating by parts in the two independent Gaussian spaces gives

    d/dt E h(F_t) = ½ E[(Γ−1)h″(F_t)].             (1)

Indeed, differentiation produces F/(2√t)−G/(2√(1−t)). The first term becomes Γh″/2 by the third-chaos identity and the second becomes −h″/2 by ordinary Gaussian integration by parts. This calculation also works for a normalized element of any fixed chaos, with its appropriate Γ.

Conditional on V, X is real Gaussian with variance V/2. Therefore

    h″(x)=2πs² f_X(sx).

Averaging the independent G in (1), and putting A_t=V+u(1−t), yields

    d/dt E h(F_t)
      = (√π u/2) E_V [ A_t⁻¹/² C_F(ut/(2A_t)) ].   (2)

The density in this step is `exp(−utF²/(2A_t))/√(πA_t)`; keeping both factors of 2 is essential. Integrating (2) from 0 to 1 gives

    D(q)=−(√π u/2) ∫₀¹ E_V[
               C_F(ut/(2[V+u(1−t)]))/√(V+u(1−t))]dt.     (3)

One can first regularize h and then pass to the limit. Its bounded second derivative follows from E V⁻¹/²<∞; the first derivative is bounded and its growth is at most linear. Also,

    ∫₀¹ (V+u(1−t))⁻¹/² dt
       = 2[√(V+u)−√V]/u ≤ 2/√u.

Together with E|Γ−1|≤2 this gives absolute integrability for the interchange and endpoint passage in (3), without any density assumption on F.

## 3. A fixed signed transform and a positive profile weight

For fixed V use

    a = ut/[2(V+u−ut)],
    t = 2a(V+u)/[u(1+2a)],
    A_t=(V+u)/(1+2a),
    dt = 2(V+u)/[u(1+2a)²] da.

The interval becomes `0≤a≤u/(2V)`, so (3) is exactly

    D(q)=−√π E_V [√(V+u)
                   ∫₀^{u/(2V)} C_F(a)/(1+2a)^(3/2) da].  (4)

Equivalently,

    D(q)=−√π ∫₀∞ C_F(a) W_u(a) da,
    W_u(a)=(1+2a)⁻³/² E[√(V+u) 1_{V≤u/(2a)}], a>0.     (5)

The weight is nonnegative and its total mass satisfies

    √π ∫₀∞ W_u(a) da = B(u)−B(0).                       (6)

All these statements are identities. In particular, observing W_u≥0 does not prove the sign of D: it is C_F whose sign remains unknown.

## 4. Consequences for certification

**Exact sign sufficient condition.** If C_F(a)≤0 for all a>0, then D(q)≥0. This is a sufficient condition for each shape and profile, stronger than simply requiring the weighted integral in (5) to be nonpositive. The all-cubic form of this condition is open.

**Uniform error allowance.** If C_F(a)≤e for every a>0, with e≥0, then (5)–(6) give

    D(q)≥−e[B(u)−B(0)].                                (7)

Consequently, at price p and with S=sup_v(B(v)−pv),

    Λ(q)=B(u)−pu−D(q)
        ≤S−[S−B(u)+pu]+e[B(u)−B(0)].                  (8)

Thus an upper envelope for the transform has a direct, correctly scaled consumer. Keeping the Gaussian energy slack may allow a larger error away from the critical amplitude. Equation (7) asserts no achieved numerical e for general cubic shapes.

For scale only, at the peak profile a=699/1250, b=179/1250 and u=1/25,
direct Rice quadrature gives B(u)−B(0)≈0.0549561832894. Thus e≈0.00181963
would spend 10⁻⁴ of deficit budget at that energy; e=0.0018 would spend
about 9.8921·10⁻⁵. These are **N** diagnostics checked with adaptive
quadrature and two Gauss–Laguerre rules, not interval certificates and not
achieved bounds on C_F. The exact conditional implication is (7).

**Nonuniform cuts.** A certified measurable upper envelope C_F(a)≤E(a) gives

    D(q)≥−√π∫₀∞ E(a)W_u(a)da,                         (9)

provided the right-hand integral is absolutely defined. If the bound is available only on intervals, the remaining intervals require valid bounds too. A finite numerical sign sample is not a certificate. Positive and negative parts can both be retained; no universal pointwise sign is necessary for a favorable integral.

**An unconditional error bound from the fourth cumulant.** Lemma 5.2.4 of
Nourdin–Peccati (2012), equation (5.2.7), gives Var Γ≤(2/9)κ₄(F)=χ/3.
For the equality, circularity gives E(Re q)⁴=(3/8)E|q|⁴, hence κ₄(F)=3χ/2.
Since the exponential kernel takes values in [0,1], its variance is at most 1/4.
Cauchy–Schwarz therefore yields |C_F(a)|≤√(χ/12), and (5)–(6) imply

    |D(q)| ≤ √(χ/12)[B(u)−B(0)].                       (9a)

At the peak, E V⁻¹=a₀⁻² with a₀=699/1250. Concavity of the square root and
Cauchy–Schwarz give B(u)−B(0)≤√π u/(2a₀). Thus 0<u≤463/10000 and
χ≤1/45000 imply |D(q)|<10⁻⁴, using the exact rational comparison in
`BOOK_NOTES.md` §1. This corollary is **P, author only**; the rational scalar
check is exact. It supplies no nonnegative sign or all-sector conclusion.

**A genuine class with the desired sign.** Suppose F has the law √R Z, with R≥0 independent of standard Gaussian Z and ER=1. For a>0, let b_a(x)=∫₀ˣ e^(−ay²)dy. The Stein identity gives

    E[Γe^(−aF²)]=E[F b_a(F)]
                 =E[R(1+2aR)⁻¹/²],
    C_F(a)=E[(R−1)(1+2aR)⁻¹/²]≤0.                   (10)

The last sign is the nonpositive covariance of R with a decreasing function of R. This is a law-based proof; it does **not** identify the original Malliavin Γ pointwise with R. The case R=0 causes no problem. For nonconstant R the covariance is strictly negative. This re-derives a known sufficient class in the repository and is an independent sign/normalization control.

## 5. What cannot be concluded

The radius bound for F is a single weighted expectation, not a proof of C_F(a)≤0 at every a. The fourth-moment identity

    E[(Γ−1)F²]=(EF⁴−3)/3

only controls `C_F′(0)=−(EF⁴−3)/3`; it does not sign the full function. Nonnegative fourth cumulant gives the right initial direction, not global monotonicity.

Nourdin–Peccati–Viens's direct comparison of {−F,F} to {−G,G} would require Γ≤1 almost surely. EΓ=1 would then force Γ constant; for a genuine nonzero cubic its quartic leading term is nonzero and Γ is unbounded. Its weaker payoff-weighted derivative, rather than this pointwise condition, is the relevant object in (2).

The complex sharp-radius implication is still useful: if E|F|≤√(2/π) for every real normalized cubic, circularity gives `E|q|=(π/2)√(u/2)E|F|≤(√π/2)√u`. No proof of that real premise is supplied here.

Finally, (1) is scalar because q is independent of L. When q shares drivers with the A/B or odd sectors, differentiating the joint payoff produces mixed Malliavin covariance terms. Neither (4) nor a theorem about the marginal law of q can discard them. This identity does not close the compact premise (P) or the all-sector assembly.

## 6. Controls

`check_identity.py` performs exact symbolic checks of the change of variables, the total weight (6), cubic variances, the fourth-moment slope and the rational premise of (9a)'s peak corollary. It independently compares direct Gaussian-smoothed absolute values against both integrals (3) and (4), for He₃/√6 and for the real projection of the unit complex Wick monomial. Two quadrature orders are used, and the output distinguishes those floating controls from exact checks. It also checks a Gaussian zero case and a nonconstant scale-mixture sign case.

The calculations test normalization and implementation. They do not cover all cubics, all dimensions or the unknown sign. No external computation or Lean build is required.
