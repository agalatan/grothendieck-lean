# A strict obstruction for neutral Gaussian and even ordinary Gaussian auxiliaries

23 October 2026. Status: **paper proof plus replayed directed Arb inequalities**.
This is an obstruction to a restricted rounding class, not a Grothendieck
endpoint. No Lean theorem has been added.

## Statement and exact scope

Let z be standard proper complex Gaussian, and let Y=(Y₁,…,Y_m) consist of any
finite number of independent standard real Gaussians, independent of z. The
same result holds for a countable independent Gaussian family with its product
measure; no claim that an identity-covariance Gaussian lives in ℓ² is needed.
The response functions F(z,Y),G(z,Y) may depend arbitrarily and nonlinearly on
the entire Y family and |z|, are disk-valued, and have charge one in z alone:

    F(e^{iθ}z,Y)=e^{iθ}F(z,Y), likewise for G.

Y is **fixed** under the rotation in this condition. There is no circular
charge assumption on Y, and odd as well as even Y-Hermite degrees are allowed.
For real correlation parameter t use independent pairs with
E[z conj(z')]=t and E[Y_lY'_q]=t²δ_lq. Their covariance is physical for |t|≤1.
Write the resulting odd kernel as H(t)=∑_{n≥0}c_n t^{2n+1}. Then

    Re(c₀)−∑_{n≥1}|c_n|
      ≤ (99993/100000) γ†
      < 0.711908822672080.

**Even ordinary-Gaussian extension.** The identical bound holds if Y is replaced
by any finite or countable family V of independent standard real Gaussians,
independent of z, with physical pair covariance E[V_lV'_q]=tδ_lq, and the
responses satisfy both

    F(e^{iθ}z,V)=e^{iθ}F(z,V),
    F(z,−V)=F(z,V),

and likewise for G. The V sign flip is simultaneous across all auxiliary
coordinates; individual-coordinate evenness is unnecessary. Arbitrary radial
coupling between |z| and V is allowed.

Consequently this covers every response of the form F(z,Q(V)),G(z,Q(V)) meeting
the displayed charge condition, whenever Q(−V)=Q(V). Q may be a vector of
arbitrary jointly dependent quadratic Gaussian expressions, or any other
measurable even Gaussian image. The Q distribution need not be Gaussian, and
different Q components may share all their underlying Gaussian coordinates.
It also covers expressions Q(|z|,V) with radial z dependence when the resulting
response retains the two displayed symmetries. No marginal-law substitution is
used: the proof works in the actual underlying Gaussian V-Hermite expansion.

The same ceiling holds after any probability mixture of these response pairs
and after linear Gaussian contractions within the separate grade-one-z and
grade-two-Y classes. Such contractions are absorbed into the response functions
using Gaussian Markov operators; they preserve the disk and charge-one
condition. No nonlinear final correlation preprocessing is included. It lies strictly
below the project's current transfer score, approximately .71194715. Thus this
independent neutral-Gaussian model cannot supply an improved full residual score
even with arbitrary bounded Y-dependence.

The exact boundary is the two stated response symmetries and the underlying
Gaussian correlation model. General couplings that break either symmetry,
arbitrary correlated auxiliary processes without this Gaussian representation,
and nonlinear final correlation preprocessing remain outside the result. No
claim about the actual value of K_G^C follows from this restricted-class upper
bound on D.

The theorem deliberately bounds a class defined on real t that may include
functions lacking the extra phase-equivariance required by a physical complex
Grothendieck kernel. It therefore bounds the valid complex subset as well.
For ordinary complex auxiliary coordinates, identify them with independent real
Gaussian coordinates. A full complex charge-one response that is also charge
one under z rotation alone is invariant under simultaneous auxiliary U(1)
rotation, and hence satisfies the required global V sign symmetry. Hermitian
quadratics V*AV are examples. This does not infer full complex equivariance
from sign symmetry alone.

An explicit finite-quadratic check illustrates the distinction. Take one real
Gaussian V and F(z,V)=phase(z)exp(ia(V²−1)), with G=F. Direct two-dimensional
Gaussian integration gives the exact kernel

    H(t)=h_phase(t)/sqrt(1+4a²(1−t²)).

The auxiliary factor has only powers t^{2j}. Its alternating j-value is
1/sqrt(1+8a²), whereas simultaneous V-reflection gives 1 because V² is even.
At a=1/5 these are respectively 5/sqrt(33) and 1. Thus the extension uses the
actual even-Hermite operator and does not mistake it for reflection, or replace
the non-Gaussian quadratic law by a Gaussian.

## Admissible coefficient game

Let P_k be the charge-one z-chaos projection of bidegree (k+1,k), and let E_j be
the ordinary real Hermite projection of **total** degree j in the entire Y
family. The correlation kernel
has absolutely summable coefficients

    c_n=∑_{k+j=n} ⟨(P_k⊗E_j)F,(P_k⊗E_j)G⟩.

In the ordinary-Gaussian extension, let E_j instead mean the V-Hermite
projection of total degree **2j**. The global sign symmetry removes all odd
V-Hermite degrees. Correlation t gives degree 2j the factor t^{2j}, exactly the
same physical weight as degree j of the neutral Gaussian Y. Thus the displayed
coefficient formula holds unchanged. Only the dimensions of the E_j spaces
differ between these models.

Absolute summability follows by Cauchy–Schwarz over the mutually orthogonal
projections and ||F||₂,||G||₂≤1. This decomposition includes every Y-Hermite
degree, with no finite-degree closure assumption.

Put ε=1/1000, t₀=1/500 and choose coefficient multipliers

    λ₀=1,
    λ₂=1−ε−2t₀=199/200,
    λ_n=(1−ε)(−1)^n  for n≥1, n≠2.

Every λ_n is in [−1,1]. Therefore

    Re(c₀)−∑_{n≥1}|c_n| ≤ Re ∑ λ_n c_n.

The associated operator is

    T=(1−ε)Γ_z⊗S_aux + ε P₀⊗E₀
       −2t₀(P₂⊗E₀+P₁⊗E₁+P₀⊗E₂),

where Γ_z=∑(-1)^kP_k and S_aux=∑(-1)^jE_j. For the neutral Gaussian Y,
S_aux is simultaneous reflection Y↦−Y. For the globally even ordinary Gaussian
V, it has multiplier (-1)^j on total degree 2j; **it is not reflection V↦−V**,
which is the identity on this even subspace. This definition explains
why the infinite ±1 eigenspaces of Γ_z⊗R_Y do not invalidate the proof: the
factor (1−ε) first moves the unmodified high-Y blocks strictly inside the unit
ball, while finitely many low-Y blocks are controlled separately.

## Radial normalization and the three rank-one fields

Use the notation and proof in `../BILINEAR_HANKEL_OBSTRUCTION.md`:

    μ(r)=2r e^{-r²},
    C(r)=√(π/8)e^{-r²/4}[I₀(r²/4)−I₁(r²/4)],
    V(r)=2r²e^{-r²/2}C(r),   γ†=∫V,
    Q(r,s)=2rs e^{-(r²+s²)/2}J₁(rs)/sqrt(V(r)V(s)),
    h=sqrt(V)/sqrt(γ†).

Q is selfadjoint, Qh=h. The independent replay in `certificate.json` gives
||Q||_HS²<1.660889<7/4. Therefore every nonconstant eigenvalue has squared
absolute value at most ||Q||_HS²−1<3/4, and in particular

    ||Q restricted to h-perp|| ≤ ρ=7/8.

The normalized rank-one image of P_k is u_k u_k*, where

    ψ_k(r)=r L_k^1(r²)/sqrt(k+1),
    u_k(r)=μ(r)ψ_k(r)/sqrt(V(r)).

The Laguerre normalization is exact in L²(μdr). Decompose
u_k=α_k h+v_k, v_k perpendicular to h. For k=0,1,2,

    |α_k|²=e_k/γ†,
    (e₀,e₁,e₂)=(π/4,π/32,3π/256),
    ||u_k||²=ζ_k,
    ||v_k||²=ζ_k−|α_k|².

The three e_k are the first phase-chaos energies; they also follow by exact
integration of ψ_k against μ. Their signs are immaterial below because only
|α_k| appears.

## Directed certificates for the radial norms

The sole extra numerical inputs are

    ζ_k= [2/(k+1)]∫₀∞ r²e^{-3r²/2}[L_k^1(r²)]²/C(r) dr,
    ζ₀<2, ζ₁<2, ζ₂<1.

`fresh_upper_neutral_certificate.py` integrates with upper rectangles of width
1/1000 on [0,6], using exact Arb rational endpoints. On [a,b], C(r)≥C(b),
r²≤b², and e^{-3r²/2}≤e^{-3a²/2}. The polynomial square is bounded by interval
evaluation of L₀¹=1, L₁¹=2−r², L₂¹=3−3r²+r⁴/2. This is an upper sum, so
there is no uncharged quadrature error.

For r>6 use C(r)≥c/(1+r)³, c=√(2/π)e^{-1/2}/3. Replace Laguerre coefficients
by their absolute values, square the resulting positive polynomial, and
integrate its finitely many monomials against e^{-3r²/2}. Directed tail bounds
follow from

    I₀(R)≤e^{-3R²/2}/(3R),
    I₁(R)=e^{-3R²/2}/3,
    I_m(R)=R^{m−1}e^{-3R²/2}/3+(m−1)I_{m−2}(R)/3.

The recorded upper bounds are substantially stronger than needed:

    ζ₀<1.159776120928864,
    ζ₁<0.914751169495842,
    ζ₂<0.782705648644135.

The tail contributions are respectively below 3.11×10⁻²⁰, 2.33×10⁻¹⁷,
6.41×10⁻¹⁵. The operator proof deliberately uses only the simple rational caps
(2,2,1), so these numerical margins are not spent.

## Infinite Hermite-block operator bound

After radial normalization, the Y-Hermite blocks of T are exactly

    T₀=(1−ε)Q+εu₀u₀*−2t₀u₂u₂*,
    T₁=−(1−ε)Q−2t₀u₁u₁*,
    T₂=(1−ε)Q−2t₀u₀u₀*,
    T_j=(1−ε)(−1)^jQ, j≥3.

For m>1 each displayed block is tensored with the identity on the total-degree-j
Y-Hermite eigenspace. Only its multiplicity changes, so all operator norms below
are independent of m. In a countable product the finite-coordinate Hermite
polynomials are dense in L² and give the same orthogonal block decomposition.
Equivalently, conditional expectation onto the first m neutral coordinates
preserves the disk and charge-one condition and converges in L², so the
dimension-uniform bilinear inequality passes to the limit.

For the globally even ordinary-Gaussian V model replace that multiplicity space
by its total-degree-2j Hermite eigenspace. Every displayed T_j, including its
sign and the low-degree rank-one correction, remains identical. Conditional
expectation onto finitely many V coordinates preserves the global sign symmetry
because the remaining Gaussian coordinates have a symmetric law, so the same
countable-product extension applies.

Write q=1−ε and use |α_k|=a_k, ||v_k||≤b_k, where
b_k²=(2,2,1)_k−a_k². Relative to h⊕h-perp, a Hermitian operator with diagonal
bounds A,C and off-diagonal norm at most B has upper norm at most the largest
eigenvalue of [[A,B],[B,C]]. This follows directly from its quadratic form.

For T₀ take

    A₀=q+εa₀²−2t₀a₂²,
    B₀=εa₀b₀+2t₀a₂b₂,
    C₀=qρ+εb₀².

The negative u₂ term on h-perp can be dropped for an upper bound; its
off-diagonal contribution is retained in B₀. The lower bound is
T₀≥−(qρ+2t₀ζ₂)I. Arb certifies

    λ_max(T₀)<0.999924620668427,
    −λ_min(T₀)≤0.878125.

For −T₁=qQ+2t₀u₁u₁* use

    A₁=q+2t₀a₁²,
    B₁=2t₀a₁b₁,
    C₁=qρ+2t₀b₁².

The opposite side satisfies T₁≤qρI. The certified bounds are

    −λ_min(T₁)<0.999586388547392,
    λ_max(T₁)≤0.874125.

Finally T₂≤qI, T₂≥−(qρ+2t₀ζ₀)I, and ||T_j||=q for j≥3. Hence

    ||T₂||≤max(.999,.882125)=.999,
    sup_{j≥3}||T_j||=.999.

All blocks therefore have norm strictly below the rational number
L=99993/100000. There is no truncation in Y: every omitted Hermite degree
belongs to the explicitly bounded j≥3 class.

Writing F(z,Y)=phase(z)f(r,Y) and similarly for G, set U=sqrt(V)f and W=sqrt(V)g
in L²(dr⊗Gaussian_Y). Then ||U||²,||W||²≤γ†, so

    Re∑λ_nc_n = Re⟨U,TW⟩ ≤ L ||U||||W|| ≤ Lγ†.

This proves the stated D ceiling for every finite or countable independent
neutral Gaussian family, including arbitrary nonlinear dependence on many
diffuse neutral drivers, and for the globally even ordinary-Gaussian auxiliary
model, including actual independent finite quadratic drivers.

## Replay and limits

    uv run --with python-flint==0.9.0 python tools/fresh_upper_neutral_certificate.py \
      --output handoff/research-third-decimal/fresh-eyes-20261023/upper/neutral/certificate.json

The default run uses 128 bits; a second run at 160 bits with mesh denominator
1500 is recorded separately. Explicit exceptions guard every certified
inequality under Python -O/-OO. The script regenerates the Hankel bound and
the three radial upper sums, then checks all finite two-by-two envelopes.

The conclusion does not depend on a finite search pool, numerical optimizer,
or a proposed law extremizer. Its Gaussian Hermite decomposition is applied
either directly to independent neutral Y, or to the actual underlying ordinary
V with globally even responses. It does not substitute a Gaussian law for a
finite quadratic image. Nonlinear final preprocessing and response families
breaking the separate charge/even symmetries require a different argument.
