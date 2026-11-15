<!-- New sixth-audit note. Agent-ID: codex-a7c4. Refs #415. -->
# A finite-dimensional retained diffuse limit

Agent-ID: **codex-a7c4**. Baseline merged #413, `adb96a5a2`.
New arguments: **P by author, not externally reviewed**. The moment and
rational comparisons in §5 are **C** with `diffuse_retained_exact.py`.
No statement here proves Conjecture K or its response-constrained version.

## 1. The gap in the abbreviated diffuse argument

The historical manuscript `ch7-conjectureK.tex`, “Side experiments of
15 October”, says the diffuse first-chaos penalty vanishes because the
phase response is odd in the Gaussian limit W and W is orthogonal to the
original first chaos. The digest repeats that parenthetical explanation.
That is not by itself a proof: orthogonality of q to a linear coordinate
does not imply orthogonality of nonlinear functions of q to that coordinate.
The strict genuine-cubic example in the fifth audit makes this concrete.

The 13-November `diffuse_asymptotic.md` §3 already analyzes the **A-content**
of independent cubic blocks and proves asymptotic order N⁻² for its squared
norm. This note does not claim to discover independent diffusion or its
vanishing-content mechanism. It supplies an explicit **finite-N retained
penalty bound**, on the full first chaos of the actual coordinates, and
uses it to justify the Gaussian benchmark limit for Λ̂. No auxiliary
first-chaos coordinate is added, and no infimum is interchanged with a CLT.

The distinction matters: the Gaussian limit has a different coordinate
realization from the cubics approximating it. If W itself were inserted
as an admissible first-chaos coordinate, its multiplier would generally
lower the Gaussian value. Neither that artificial problem nor the
response constraint εP₂,₁k=G is used below.

## 2. A global third-derivative bound for the visible phase average

Fix a>0, b≥0, p>0 and standard complex Gaussian Z. Put

    L=Z(a+b|Z|²),   F(w)=E_Z ph(L+w).

All derivatives in this note are real derivatives on ℂ≃ℝ², with the
Euclidean norm |w|. The reviewed visible-density mixture from A15T
`CONTENT_KERNELS.md` and A15V `FOUNDATIONS.md` gives

    ρ_L(w)=f(|w|²)/π,
    f(v)=∫ exp(−λv) μ_D(dλ),
    ∫λ⁻¹ μ_D(dλ)=1,
    m₀:=∫μ_D(dλ)=a⁻²,
    m₁:=∫λ μ_D(dλ)=a⁻⁴+4ba⁻⁵.                    (1)

Here μ_D is positive on (0,∞); λ⁻¹μ_D is the probability measure
mixing centered circular Gaussians with density λ exp(−λ|y|²)/π.
The endpoint formula for m₁ can also be read directly from

    f(t(a+bt)²)=e⁻ᵗ/[(a+bt)(a+3bt)]

by differentiating at t=0. The existence of the positive mixture is an
inherited reviewed input; the new derivative estimate below is elementary.

For a unit real direction e, the third derivative of a Gaussian density
along e has L¹ norm at most

    (2λ)^(3/2) E|G³−3G| ≤ sqrt(48) λ^(3/2),         (2)

where G is a real N(0,1), since E(G³−3G)²=6. Convolve the bounded
function ph with that density. Its modulus is at most one, so (2) bounds
the third directional derivative of its phase average, uniformly in w.
Integrating the mixture and applying Cauchy–Schwarz gives

    |D³F(w)[h,h,h]| ≤ M₃ |h|³,
    M₃:=4sqrt(3m₀m₁),
    M₃²=48a⁻⁶(1+4b/a).                            (3)

Differentiation through the mixture is legitimate: the derivative L¹
norms through order three are dominated by the corresponding Gaussian
scores, whose mixture moments are finite by (1) and Cauchy–Schwarz.
These bounds are uniform in w. In particular F is C³ and Taylor’s
formula on any line gives

    |F(w+h)−F(w)−DF(w)[h]−D²F(w)[h,h]/2|
      ≤(M₃/6)|h|³.                                (4)

No small-amplitude restriction occurs in (4).

## 3. Independent blocks: all original first-chaos directions at once

Let q₁,…,q_N be charge-one Wick cubics, each using its own finite block
of independent remote standard complex Gaussian coordinates. The blocks
are mutually independent and independent of Z. Set q=Σ_j q_j, and let
P_j denote projection onto the complex first chaos of the j-th block.
Let μ=P₁,rem F(q). Then

    ‖μ‖² ≤ (M₃²/36) Σ_j E|q_j|⁶
          = (4/3)m₀m₁ Σ_j E|q_j|⁶.                (5)

To prove it, fix block j and condition on R_j=Σ_{k≠j}q_k. Apply (4)
at w=R_j and h=q_j. The first three Taylor terms have zero projection
onto the first chaos of block j:

* F(R_j) is independent of that block.
* DF(R_j)[q_j] is a complex-linear combination of q_j and conjugate(q_j),
  which are orthogonal to its first chaos.
* The quadratic term is a combination of q_j², |q_j|² and conjugate(q_j)².
  Under simultaneous rotation of the block coordinates their characters
  are 2, 0 and −2, whereas every holomorphic first-chaos coordinate has
  character 1. Averaging the rotation kills each pairing.

Conditioning the coefficients does not change these cancellations.
Projection is an L² contraction, so (4) gives
‖P_jF(q)‖≤(M₃/6)(E|q_j|⁶)^(1/2). Different block first chaoses are
orthogonal; summing their squared norms proves (5). Extra unused remote
coordinates have zero coefficients by independence. This proves the
bound on the **entire** remote projection, not on one selected driver.

If v_j=E|q_j|², the already-reviewed sixth-moment theorem and fourth
moment cap give, for every such cubic,

    E|q_j|⁶ ≤ [6+9·42+(4045313/100000)42^(3/2)]v_j³
             <11400 v_j³.                          (6)

The zero cubic is immediate; otherwise use δ≤42v_j² in the inherited
sixth-moment theorem. The displayed rational constant is checked in §5.
Consequently

    ‖μ‖² ≤15200 a⁻⁶(1+4b/a) Σ_j v_j³.             (7)

This constant is independent of the number and dimensions of the blocks.
It is deliberately coarse; it is an explicit finite bound, not an
asymptotic assertion uniform only in a fixed block type.

## 4. A sharper bound for independent one-coordinate Wick blocks

For H(X)=X(|X|²−2)/sqrt(2), E|H|²=1. Let

    q=Σ_j c_j H(X_j),  v_j=|c_j|²,

with independent standard remote complex Gaussians X_j. Instead of
bounding the L² norm of the Taylor remainder, pair it directly with X_j.
The same constant, linear and quadratic cancellations as above give

    |E[conjugate(X_j)F(q)]|
      ≤(M₃/6)|c_j|³ E[|X_j||H(X_j)|³]
      <2M₃ |c_j|³.                                (8)

Indeed, with T=|X_j|² exponential of mean one,

    E[|X_j||H(X_j)|³]
      =E[T²|T−2|³]/(2sqrt(2))
      =(−16+240e⁻²)/sqrt(2)<12.                    (9)

The equality follows by splitting at T=2 and integrating the degree-five
polynomial against e⁻ᵀ. For the strict bound, e²>300/41 follows from
the first seven terms of its positive Taylor series, and sqrt(2)>7/5.
Thus −16+240e⁻²<84/5<12sqrt(2). This uses no quadrature.

Summing every coordinate in (8) yields the stronger explicit bound

    ‖μ‖² ≤192 a⁻⁶(1+4b/a) Σ_j v_j³.               (10)

The strict estimate can be retained for nonzero blocks; the weak form
also covers all c_j=0. At the peak the coefficient is

    345458984375000000000000 / 27178092692831571633
      <12711.                                     (11)

The bound is not intended as an efficient numerical approximation of the
actual penalty. Its purpose is an explicit estimate uniform in N and in
all coefficients. For q_N=sqrt(u/N)Σ_{j=1}^N H(X_j), it gives

    ‖μ_N‖² ≤192 a⁻⁶(1+4b/a) u³/N².                (12)

## 5. From small projection to the retained value

The fifth audit re-derived, for every remote L² q,

    0≤Λ(q)−Λ̂(q)≤‖P₁,rem F(q)‖².                 (13)

For clarity, this upper bound does not come from a trial multiplier.
Visible parity eliminates the visible multiplier, and convexity gives

    J(v)−J(0)≥‖v‖²−2Re⟨v,μ⟩,
    J(v)=‖v‖²+2E|L+q−v|.

The right side is at least −‖μ‖², proving (13) after minimizing. This
argument applies to the full first chaos in each finite dimension.
Combining (10) with (13) gives the completed finite-dimensional theorem

    0≤Λ(q)−Λ̂(q)≤192 a⁻⁶(1+4b/a) Σ_j v_j³.         (14)

The general-block version follows from (7), with coefficient 15200.
The exact checker recomputes E|H|²=1, E|H|⁴=44, E|H|⁶=11352, the
Hermite score moment 6, the polynomial split in (9), the exponential and
square-root rational budgets, the universal bound (6), and (11).
These scalar checks do not replace the analytic proof of (3)–(14).

## 6. Gaussian benchmark sharpness for the retained dual

For fixed u≥0, define q_N as in (12). These are actual finite-dimensional
H₂,₁ cubics with E|q_N|²=u. By the two-dimensional central limit theorem,
q_N converges in law to sqrt(u)W, where W is a standard circular complex
Gaussian independent of Z. The payoff has linear growth and the second
moments are uniformly bounded, so uniform integrability gives

    Λ(q_N) → 2E|L+sqrt(u)W|−pu.

Equation (14) makes the difference between raw and retained values tend
to zero at the explicit rate O(u³/N²). Therefore

    Λ̂(q_N) → 2E|L+sqrt(u)W|−pu.                   (15)

Only the raw-versus-retained difference has this rate here. No rate for
the full CLT payoff error is claimed. In particular

    sup over all finite-dimensional cubics G of Λ̂(G) ≥ S(a,b,p).

If the retained inequality Λ̂(G)≤S is eventually proved, its constant S
is therefore sharp. This does not establish the upper inequality, attain
the benchmark in a fixed finite dimension, or prove the analogous lower
bound for the response-constrained Λ′. The latter has the extra cubic
consistency requirement εP₂,₁k=G; it cannot be removed from this argument.

The proof keeps all finite-dimensional multipliers until after (14).
There is no need to invent a first-chaos coordinate for W or to exchange
the minimum defining Λ̂ with weak convergence.

## 7. Bounded audit coverage

For MONOGRAPH §§0–2 and STATUS 2, this pass freshly checks the distinction
between Λ, Λ′ and Λ̂, the finite-dimensional projection in (13), and the
diffuse benchmark argument. The gate-free row and response energy
ellipsoid retain their prior reviews; no new complete consumer follows.
For §§3.1–3.6, the independence and chaos hypotheses remain essential:
(5) cannot be applied to dependent blocks or arbitrary Gaussian-marginal
residuals. The older shared-driver examples do not become independent by
having many coefficients. The existing family and scalar certificate
labels are not raised by this note. For §§4–5, retained A-only results
do not imply B/odd-sector or full response coverage. Section 6 literature
claims and section 7 archived checkers are inherited rather than freshly
replayed here. New source material about the tilted lemma is handled in
the accompanying REMOTE audit, not assumed in this proof.

Reproduction, standard library only, read-only by default:

```sh
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/diffuse_retained_exact.py
```
