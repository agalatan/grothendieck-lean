<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/remote-dependence/UNIFORM_LOCAL_K.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- handoff/codex-4d8a-compensated-joint/remote-dependence/UNIFORM_LOCAL_K.md; Agent-ID: codex-4d8a. -->
# Dimension-uniform local Conjecture K with arbitrary shared visible sectors

This is a paper proof, not Lean verification. The positive thresholds below are
existential: no numerical size is claimed. The result concerns genuinely cubic
remote cores and uses no auxiliary Gaussian bath in its conclusion.

## 1. Statement and inherited inputs

At the repository's peak parameters,

    a=699/1250,   b=179/1250,   p=2500/1891,

put L=Z(a+b|Z|²). The Gaussian benchmark

    B(u)=2 E|L+sqrt(u)W|,     f(u)=B(u)-pu

has an interior maximizer v*>0. Put S=f(v*). All Gaussians are standard complex
Gaussians, with E|Z|²=1. Decompose a genuine cubic as

    G=q+h,
    h=(T-1)r_A+Z² conjugate(r_B)/sqrt(2)
        +ZQ+conjugate(Z)P+ν Z(T-2)/sqrt(2),   T=|Z|².

Here q is remote H_(2,1), r_A,r_B are remote holomorphic linear forms,
Q is remote H_(1,1), P is remote H_(2,0), and ν is an arbitrary complex
constant. All remote fields may share all their Gaussian coordinates.
Write

    u=E|q|²,
    δ=E|q|⁴-2u²,
    e=||h||²=||r_A||²+||r_B||²+||Q||²+||P||²+|ν|².

**Theorem.** There are positive constants r,δ₀,e₀,c₁,c₂,c₃, depending on
(a,b,p) but not on dimension or tensor coefficients, such that

    |u-v*|<r,   0<δ<δ₀,   e<e₀

imply

    S-Λ_p(q+h) >= c₁(u-v*)²+c₂δ+c₃e > 0,
    Λ_p(G)=E|L+G|+E|L-G|-p||G||².

The same upper conclusion holds for the retained functional because Λ̂≤Λ.
The complex A/B covariance is unrestricted; both real and imaginary ν directions
are retained. This is a neighbourhood of the diffuse Gaussian boundary in the
coordinates (u,δ,e), not a global proof of K.

We use two analytic inputs already proved in the c7e2 package:

1. **Uniform near-Gaussian remote deficit.** There is a universal χ₀>0 such that
   when 0<δ/u²≤χ₀,

       B(u)-2 E|L+q| >= [-B''(u)]δ/8.

   See `research/conjecture-K/sources/partial-results-2026-11-15-codex-c7e2/remote/NEAR_GAUSSIAN_REMOTE.md`.
   Its external input is Mansanarez–Poly–Swan, arXiv:2510.14002v2, Theorem 1.2;
   its threshold is not evaluated. The inherited complex sixth-moment input is
   supplied by `Circular.tensorFacts` and `Bridge.gaussian_moments`.
2. **Gaussian visible Hessian coercivity.** At a Gaussian remote core of variance
   v*, independent of the remote coefficients in h, the quadratic coefficient
   of Λ_p(sqrt(v*)W+t h) is at most -c_*||h||² for a c_*>0 depending only on
   (a,b,v*). See `all-sector/GAUSSIAN_LOCAL_STABILITY.md`, Sections 1–5.
   Its A/B 2x2 matrix is positive definite; all Q,P,ν coefficients are positive.
   Those coefficients depend continuously on variance, so after shrinking r
   the same bound holds with -c_*e/2 for |u-v*|≤r, at the fixed price p.

The new ingredients proved below are the dimension-uniform third-order content
bound, weighted Hessian decoupling, and uniform unbuffered Taylor remainder.

## 2. A general third-chaos first-chaos projection bound

Use independent real N(0,1) coordinates X. For symmetric real tensors use
the normalization E I_k(f)I_k(g)=k!<f,g>. Let F=I₃(f), and let

    κ=E F⁴-3(E F²)².

For every C³ function φ with bounded φ''' (polynomial growth through lower
orders suffices),

    ||Π₁ φ(F)||₂ <= (5/4)||φ'''||∞ κ^(3/4).                 (2.1)

This includes arbitrary variance and every finite dimension.

### Tensor bookkeeping

Let f_i=f(i,.,.), define A=f⊗₂f as a positive semidefinite matrix, and set
S₄=Sym(f⊗₁f), a symmetric tensor of order four. Let a_f=||A||HS.
View f as the map F_map:H→H⊗H, h↦f_h. Then

    F_map*F_map=A,
    ||F_map||op <= sqrt(a_f),
    ||f⊗₁f||HS=||A||HS=a_f,
    ||S₄||HS<=a_f.                                       (2.2)

The last equality before symmetrization is the equality of the squared
Hilbert–Schmidt norms of the two Gram matrices of F_map.

The Wiener product formula gives

    κ=1296||A||HS²+1944||S₄||HS² >=1296 a_f².             (2.3)

For clarity, F² has chaos components I₆(Sym(f⊗f)), 9I₄(S₄),
18I₂(A), and 6||f||². In the order-six symmetrization there are twenty
choices of the first three slots: two contribute ||f||⁴ and eighteen
contribute ||A||HS². Consequently

    6!||Sym(f⊗f)||²=72||f||⁴+648||A||HS²,

which gives (2.3) by orthogonality.

### Exact integration-by-parts identity

Put Γ=||DF||². Its centered components are

    Γ₂=36 I₂(A),       Γ₄=9 I₄(S₄).

For X_h=<h,X>, Gaussian integration by parts followed by the chaos eigenvalue
identity gives

    E[X_h φ(F)] = E[φ'(F)D_hF]
       = (1/4)E[φ''(F)D_hΓ]
       = E[φ'''(F) P_h],                                (2.4)

where

    P_h=(1/4)<DF,D D_hΓ₂>+(1/12)<DF,D D_hΓ₄>
       =54 I₂(f_(Ah))+27 Σ_j I₂(f_j) I₂((S₄)_(h,j)).      (2.5)

To check the factors: D_hF has chaos order two, so
2E[φ'(F)D_hF]=E[φ''(F)<DF,D D_hF>]
=(1/2)E[φ''(F)D_hΓ]. Also D_hΓ₂ and D_hΓ₄ have orders
one and three, respectively, giving the denominators 4 and 12.

Set U_h=Sym(f⊗₁(S₄)_h), V_h=Sym(f⊗₂(S₄)_h),
and c_h=<f,(S₄)_h>. Expanding the product in (2.5),

    P_h=27I₄(U_h)+I₂(54f_(Ah)+108V_h)+54c_h.             (2.6)

The operator estimate (2.2), applied to the one or two contracted slots,
gives

    ||U_h||, ||V_h||, ||f_(Ah)|| <= a_f^(3/2)||h||.

The scalar term needs its structure, not a crude bound by ||f||||S₄||:
full symmetry yields c_h=<A,f_h>, and therefore

    |c_h|<=a_f ||F_map||op ||h||<=a_f^(3/2)||h||.

Orthogonality of orders zero, two and four now proves

    ||P_h||₂² <= [24·27²+2·162²+54²]a_f³||h||²
               =270² a_f³||h||².

Using (2.3), 270a_f^(3/2)≤(5/4)κ^(3/4). Apply (2.4),
Cauchy–Schwarz, and take the supremum over ||h||=1. This proves (2.1).

All identities are first valid for smooth test functions with sufficient
integrability; cutoff approximation gives the stated C³ class. F and its
derivatives have every finite moment, and the derivatives of φ have at most
cubic, quadratic, linear and constant growth, respectively.

## 3. The actual A/B first variation is O(δ^(3/4)sqrt(e))

Let η=Re q and ℓ_Z=Re L. Circularity gives

    κ(η)=3δ/8.

Define the real scalar functions

    m_A(s)=E_Z[(T-1)sign(ℓ_Z+s)],
    m_B(s)=E_Z[(Re Z²/sqrt(2))sign(ℓ_Z+s)].

Both have bounded third derivatives. Here is a direct regularity argument
which will also be used below. The map Z↦L(Z) is a smooth global radial
diffeomorphism of R², with radial and tangential eigenvalues a+3bT and a+bT.
For every real polynomial w(Z), its pushforward weighted density is

    ρ_w(l)=w(Z(l)) exp(-|Z(l)|²)
                /[π(a+b|Z(l)|²)(a+3b|Z(l)|²)].           (3.1)

This density is smooth; all its derivatives are bounded and integrable.
At infinity they are polynomially bounded factors times exp(-c|l|^(2/3));
near zero smoothness follows from a>0 and the inverse function theorem.
Its one-dimensional marginals have the same regularity. Since m_w'(s)
is twice the weighted marginal density at -s, m_w''' is bounded.

Global charge-one circularity and the identity E|U|=(π/2)E|Re U| give
the derivative of the norm part at q in an even visible perturbation h_E:

    d/dt [E|L+q+t h_E|+E|L-q-t h_E|]_(t=0)
      =π E[sign(ℓ_Z+η) Re h_E].

For h_E=(T-1)r_A+Z² conjugate(r_B)/sqrt(2), reflection
Im Z↦-Im Z removes the Im Z² term. Thus the complete linear coefficient is

    J(q,h)=π E[(Re r_A)m_A(η)+(Re r_B)m_B(η)].             (3.2)

The ZQ, conjugate(Z)P and νZ(T-2)/sqrt(2) directions have zero first
variation exactly: under Z↦-Z the two norm derivatives cancel. No conditional
centering in q, Q or P is required. The energy penalty has zero first
variation because q and h are orthogonal.

Applying (2.1) and ||Re r||=||r||/sqrt(2) proves

    |J(q,h)| <= C_lin δ^(3/4)sqrt(e),                    (3.3)
    C_lin=(5π/(4sqrt(2)))(3/8)^(3/4)
                    sqrt(||m_A'''||∞²+||m_B'''||∞²).

This bound is uniform over arbitrary dependence of the remote fields.

## 4. Quantitative decoupling from first and second chaoses

We record the estimates needed to replace q by an independent Gaussian inside
the visible Hessian. For real F=I₃(f), let κ be as above and set

    Γ_F,V=(1/3)<DF,DV>.

If V is in the first chaos, the product formula and (2.2)–(2.3) give

    ||Γ_F,V||₂ <= κ^(1/4)||V||₂/(3sqrt(2)).              (4.1)

Indeed Γ_F,V=I₂(f_v), where ||v||=||V||₂.
If V=I₂(g) is in the second chaos, then

    Γ_F,V=2I₃(Sym(f⊗₁g))+4I₁(f⊗₂g),

and each tensor contraction has norm at most ||F_map||op||g||.
Since ||V||₂²=2||g||²,

    ||Γ_F,V||₂² <=20 a_f ||V||₂²
                 <=(5/9)sqrt(κ)||V||₂².                (4.2)

Constants have zero cross Γ. These estimates require no independence.

Write Q=(Re q,Im q) and Σ=(u/2)I₂. Put Γ_ab=<DQ_a,DQ_b>/3.
For a real third chaos the spectral expansion of F² implies

    Var(<DF,DF>/3) <= (2/9)κ(F).

Apply this to Re q, Im q and their sum and difference. Circularity and
polarization show, for every a,b,

    ||Γ_ab-Σ_ab||₂ <= sqrt(δ/12).                       (4.3)

Let V=(V₁,...,V_M), each V_i a real first-chaos variable, second-chaos
variable, or constant. Here M is fixed (we use M=10 below). Let K:R²→R
have bounded first and second derivatives, and let N be independent
N(0,Σ), also independent of all V. Then

    |E[K(Q)V_iV_j]-E[K(N)]E[V_iV_j]|
       <= C_K (δ^(1/4)+sqrt(δ)) ||V_i||₂||V_j||₂.       (4.4)

The constant may depend on M and the derivative bounds, but not dimension.
The same assertion holds for a finite matrix of such K's after summation.

**Proof.** Interpolate Q_t=sqrt(t)Q+sqrt(1-t)N and apply Gaussian
integration by parts in N and the order-three identity in Q. For any smooth Φ,

    d/dt E Φ(Q_t,V)
      =(1/2)Σ_ab E[(Γ_ab-Σ_ab) Φ_ab(Q_t,V)]
       +(1/(2sqrt(t)))Σ_ai E[Γ_(Q_a,V_i) Φ_(a,i)(Q_t,V)]. (4.5)

Take Φ(x,V)=K(x)V_iV_j. The first derivatives in V are linear in V;
the x-Hessian is K_ab(x)V_iV_j. Cauchy–Schwarz, (4.1)–(4.3), and

    ||V_iV_j||₂ <= sqrt(15)||V_i||₂||V_j||₂

prove (4.4), since ∫₀¹dt/(2sqrt(t))=1. The elementary moment bound
||V||₄≤15^(1/4)||V||₂ holds for each permitted V: for a real centered
Gaussian quadratic V=Σλ_k(X_k²-1),
EV⁴=3(EV²)²+48Σλ_k⁴≤15(EV²)²; first-chaos variables and constants
satisfy the same bound. There is no dimension-dependent moment estimate.
Cutoff approximation justifies (4.5) with the quadratic V growth.

## 5. Applying decoupling to the full visible Hessian

Use the ten real coefficients consisting of real and imaginary parts of
r_A,r_B,Q,P,ν as V. They satisfy

    Σ_i ||V_i||₂²=e.

There are fixed real polynomial vector fields b_i(Z) such that
h(Z,Y)=Σ_i b_i(Z)V_i(Y), interpreting complex values as real vectors.
The quadratic coefficient of the norm part at q is therefore

    H_q(h)=Σ_ij E[K_ij(q)V_iV_j],

where

    K_ij(y)=(1/2)E_Z[
      Hess|.|(L+y)[b_i,b_j]+Hess|.|(L-y)[b_i,b_j]].       (5.1)

Each scalar component of these kernels is C_b². In fact the Hessian
components of |l| are locally integrable, bounded by C/|l|; after (3.1),
(5.1) is a sum of convolutions of these components with the weighted
densities ρ_(b_i^α b_j^β). Derivatives can be moved to these smooth
densities. A bounded integrable density ψ satisfies

    sup_y ∫ |ψ(l)|/|l-y| dl <=2π||ψ||∞+||ψ||₁.

The same estimate for the first two derivatives of ψ proves the claim.
Distributional differentiation and decay justify integration by parts;
no differentiation of the singular norm kernel is needed.

Applying (4.4) to the finite matrix yields

    |H_q(h)-H_N(h)| <= C_dec(δ^(1/4)+sqrt(δ))e.          (5.2)

Here H_N is exactly the Hessian averaged against an independent circular
Gaussian of variance u; all joint covariances among the V_i remain unchanged.
Consequently inherited Gaussian coercivity, at fixed p and u near v*, gives

    H_q(h)-pe <= -c_*e/2
                   +C_dec(δ^(1/4)+sqrt(δ))e.           (5.3)

In particular this step does not set the A/B covariance to zero, and it does
not drop the shared Q/ν terms: all entries are included in (5.1) and bounded
in (5.2). They vanish only in the comparison Hessian where independence and
EQ=0 actually justify it.

## 6. Uniform Taylor remainder without a Gaussian bath

For x≠0 in R² and every z, the norm satisfies

    ||x+z|-|x|-D|.|(x)[z]-(1/2)Hess|.|(x)[z,z]|
       <= C |z|^(5/2)/|x|^(3/2).                       (6.1)

For |z|≤|x|/2 this follows from the third derivative bound C/|x|²;
for |z|>|x|/2 use the triangle inequality and the first two derivative
bounds. These two cases give one absolute constant.

There is a fixed polynomial-growth function w(Z)≤C(1+|Z|³) such that

    |h(Z,Y)| <= w(Z) A(Y),      A(Y)=Σ_i|V_i(Y)|.

The pushforward density of w(Z)^(5/2) under Z↦L(Z) is bounded and
integrable. Splitting |l-y|<1 and its complement gives

    sup_y E_Z[w(Z)^(5/2)/|L(Z)±y|^(3/2)]<∞,             (6.2)

because ∫_(|l|<1)|l|^(-3/2)dl=4π. This is precisely why the
unbuffered argument uses a fractional Taylor remainder instead of an
absolute third derivative integral, whose |l|^(-2) singularity is critical.

Use (6.1) with x=L±q after conditioning on all remote variables, then
(6.2). By the dimension-free fourth moment estimate in Section 4 and
Minkowski, ||A||_(5/2)≤||A||₄≤15^(1/4)sqrt(M)sqrt(e). Thus

    Λ_p(q+h)=Λ_p(q)+J(q,h)+H_q(h)-pe+R(q,h),
    |R(q,h)|<=C_rem e^(5/4).                            (6.3)

Every constant in (6.2)–(6.3) depends only on the fixed visible profile and
the fixed list of visible sectors. The estimate holds for all q, all remote
sharing and all dimensions. In particular no uniform small-ball property
of q and no independent smoothing bath is assumed.

## 7. Absorption and conclusion

Choose a closed variance interval I around v*, contained in (0,∞), on
which Gaussian visible coercivity (5.3) holds. The scale-mixture formula

    B(u)=sqrt(π)E sqrt(V+u),
    B''(u)=-(sqrt(π)/4)E(V+u)^(-3/2)<0

gives constants d,c_var>0 such that

    -B''(u)/8≥d,       S-f(u)≥c_var(u-v*)²,    u∈I.

Take δ₀≤χ₀(min I)², so the remote deficit input applies. Combine
(3.3), (5.3) and (6.3):

    Λ_p(q+h) <=Λ_p(q)+C_lin δ^(3/4)sqrt(e)-c_*e/2
          +C_dec(δ^(1/4)+sqrt(δ))e+C_rem e^(5/4).

First choose δ₀ and e₀ sufficiently small that the last two terms together
are at most c_*e/4. Then Young's inequality gives

    C_lin δ^(3/4)sqrt(e)
       <=c_*e/8+(2 C_lin²/c_*)δ^(3/2).

Shrink δ₀ again until (2 C_lin²/c_*)sqrt(δ₀)≤d/2. We obtain

    Λ_p(q+h) <=Λ_p(q)+(d/2)δ-(c_*/8)e
              <=f(u)-(d/2)δ-(c_*/8)e,

which proves the theorem with c₁=c_var, c₂=d/2 and c₃=c_*/8.

For a nonzero finite-dimensional third-chaos q, δ>0 follows from (2.3)
and circularity. The theorem therefore proves strict inequality at every
genuine cubic in its stated region; equality remains a diffuse limiting
phenomenon. No effective threshold, coverage of the rest of the response
region, or improved numerical Grothendieck endpoint is asserted.

The same argument applies to any fixed a,b,p>0 for which the remote-deficit
input and strictly positive Gaussian visible-sector Hessian margin in
Section 1 have been established, and whose Gaussian optimum is interior.
An interior optimum alone is not being used as a substitute for that
visible-sector coercivity hypothesis.

## Verification status

The contraction identity, constants and finite polynomial checks are recorded
in `verify_content.mjs`. Those checks test the formulas on explicit integer
tensors and polynomial test functions; they do not replace the proof above
or certify the existential thresholds. The external Edgeworth theorem and
the inherited Gaussian-coercivity theorem remain explicit inputs.
