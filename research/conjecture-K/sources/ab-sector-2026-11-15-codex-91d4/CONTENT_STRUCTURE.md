<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/CONTENT_STRUCTURE.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# A global structural bound for the raw B content

Agent-ID: **codex-91d4**. Refs #426. 15 November 2026.

**Status: P, author only, with C, author only for the scalar acceptance.**
This is a new short consequence of two reviewed analytic inputs. It is not
a B-content-versus-deficit theorem, a joint sector bound, or a Lean result.

At the exact peak profile `a=699/1250`, `b=179/1250`, let `q` be any remote
complex Wick cubic of bidegree `(2,1)` in any finite number of standard
complex Gaussian variables. Set

    u = E|q|²,     δ = E|q|⁴ − 2u²,
    F_B(w) = E_Z[(Z²/√2) conjugate(ph(L+w))],
    c_B(q) = Π_(1,0) F_B(q),     L=Z(a+b|Z|²).

Then, at every energy `u≥0`,

    ‖c_B(q)‖² ≤ (436959/3125000) δ < (7/50) δ   if δ>0,        (1)

with the non-strict bound `‖c_B(q)‖²≤(7/50)δ` also when `δ=0`.
There is no restriction on dimension or on sharing with later shell drivers.

## 1. Analytic dependencies and notation

The reviewed note
`research/conjecture-K/sources/third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md`,
sections 3–4, proves

    F_B(w) = −w k_B(|w|²),
    k_B(v) = ∫_[0,∞) exp(−λv) ν_B(dλ),

for a finite positive measure with every nonnegative integer moment finite.
In particular

    M₀ = ∫ν_B = k_B(0),        M₁ = ∫λν_B = −k_B′(0).

Its derivation, based on complete monotonicity and positive Gaussian
integrals, is an analytic input; scalar endpoint values alone do not imply
the positive-measure representation.

The reviewed
`sources/received-2026-11-15-tilted-sector/content_profile_proof.md`, sections
1–3, supplies the trace-sensitive cubic Stein identity and the shifted
Gaussian resolvent. We use them with the new radial vector field `F_B`.
The argument there is independent of the particular A profile. For clarity
the constants and its application here are given in sections 3–4 below.

## 2. A metric Hessian estimate for a Laplace atom

For a real radial equivariant vector field `V(x)=x h(|x|²)` on `R²`, write
at `x=(R,0)`

    A = ∂₁₁V₁,          B = ∂₂₂V₁ = ∂₁₂V₂,
    N_V(R) = max{(3A²−2AB+3B²)/8, B²}.

This is the exact squared operator norm of contraction by `D²V` from
symmetric matrices with squared norm `(tr D)²+2‖D‖_F²` to Euclidean `R²`.
Consequently `sqrt(N)` is a norm on these Hessian tensors; it obeys the
triangle inequality and is rotation invariant.

For `V_λ(x)=x exp(−λ|x|²)`, set `z=λR²`. Direct differentiation gives

    A = λR exp(−z)(−6+4z),      B = −2λR exp(−z),
    N_(V_λ)(R)/λ = z exp(−2z) max{12−16z+6z²,4} ≤ 4/3.     (2)

For `λ=0` the Hessian vanishes and the same bound holds directly.
Here is an elementary proof of the last inequality for `λ>0`:

* On `[0,2/3]` the quadratic branch is the larger one. Subtracting
  `z(12−16z+6z²)` from `(4/3)∑_(j=0)^4 (2z)^j/j!` gives
  `4/3−(28/3)z+(56/3)z²−(38/9)z³+(8/9)z⁴`. Its exact Bernstein
  coefficients are strictly positive on each of the four intervals
  `[j/6,(j+1)/6]`, `j=0,1,2,3`. The checker prints all twenty coefficients.
  The exponential is at least its positive Taylor partial sum.
* On `[2/3,2]` the active branch is `4z exp(−2z)`. It decreases there,
  so it is at most `(8/3)exp(−4/3)<4/3`, since `exp(4/3)>1+4/3>2`.
* On `[2,∞)` the quadratic branch is active and bounded by `6z²`.
  The function `z³exp(−2z)` decreases there. Thus the result is at most
  `48 exp(−4)<4/3`, since the exponential partial sum through degree five
  already gives `exp(4)>36`.

Let `Φ(x)=−x k_B(|x|²)`. Integrating (2) against `ν_B`, using the Hessian
norm triangle inequality and then Cauchy–Schwarz, gives

    sup_R sqrt(N_Φ(R)) ≤ sqrt(4/3) ∫sqrt(λ)ν_B(dλ),
    sup_R N_Φ(R) ≤ (4/3) M₀M₁.                              (3)

The derivative interchanges follow from the finite endpoint moments.
The sign of `Φ` has no effect on these norm estimates. The vector field
is odd and globally Lipschitz, so it has the required growth and regularity
for the following resolvent step.

## 3. The shifted resolvent, including every factor

Write `Q=(Re q,Im q)` in standard real Gaussian coordinates. If
`Γ_ab=∇Q_a·∇Q_b` and `𝒟=Γ−(3u/2)I₂`, the cubic identity from the cited
tilted-content proof is

    E[(tr 𝒟)²+2‖𝒟‖_F²] ≤ 6δ.                              (4)

For `u>0`, let `P_t` be the planar OU semigroup with stationary covariance
`u I₂/2` and generator `T_u=(u/2)Δ−x·∇`. Set

    Ψ = ∫_0^∞ exp(t/3) P_t Φ dt.

Oddness, Lipschitz continuity and Gaussian symmetry give convergence.
The same chaos-three integration by parts as in the cited proof gives

    Π_(real,1) Φ(Q) = Π_(real,1)[(1/3) 𝒟:D²Ψ(Q)].           (5)

Global complex rotation makes the antiholomorphic first-chaos component
vanish, so the left side is exactly the holomorphic content norm in (1).
Projection contraction, (4), and the metric norm imply

    ‖c_B(q)‖² ≤ (2/3)δ sup_R N_Ψ(R).

Since `D²P_tΦ=exp(−2t)P_tD²Φ`, the triangle inequality and averaging in
the invariant Hessian norm give

    sup sqrt(N_Ψ) ≤ ∫_0^∞exp(−5t/3)dt · sup sqrt(N_Φ)
                  = (3/5) sup sqrt(N_Φ).

Combining with (3) proves the profile-dependent statement

    ‖c_B(q)‖² ≤ (6/25)δ sup N_Φ ≤ (8/25)M₀M₁ δ.           (6)

If `u=0`, then `q=0` almost surely and its content and cumulant vanish.
Thus this case requires no degenerate Gaussian resolvent.

## 4. Fresh exact scalar acceptance

The replay uses the already reviewed 220-bit outward rational interval
implementation in `code/audit-2026-11-15-codex-a7c4/odd_cost_check.py`.
It recomputes the endpoint integrals, rather than trusting saved decimals.
Let

    I_k = ∫_0^∞ exp(−r²)/(a+br²)^k dr,
    J₁ = ∫_0^∞ t^(1/2) exp(−t)/(a+bt) dt.

The inherited exact erf/exp representation gives `I₁` and `J₁`.
Integration by parts gives

    I_(k+1) = [(2k−1−2a/b)I_k+(2/b)I_(k−1)]/(2ka).

The B-kernel endpoint identities are

    M₀ = J₁/(2√2),           M₁ = 3I₃/(8√2).

The new replay encloses them in

    .422028097139578340 < M₀ < .422028097139578341,
    1.032202342636649222 < M₁ < 1.032202342636649223.

In particular `M₀<423/1000`, `M₁<1033/1000`, and

    (8/25)(423/1000)(1033/1000)
      =436959/3125000=.13982688 <7/50.

This establishes (1) from (6). The checker also verifies the rational
Bernstein coefficients and the exponential tail comparisons used in (2).

Run from this delivery directory:

    python3 -I content_structure_exact.py

The log is `content_structure_exact.log`; it records the input SHA-256
hashes and a runtime of about 0.02 seconds on the author's machine. The
script uses verbatim copies of both inputs in the bundled `inputs/`
directory, verifies their recorded SHA-256 hashes, and needs no external
repository or Python packages. The script accepts `--scalar-helper PATH`
and `--dual-witness PATH` to locate those same hashed inputs elsewhere.
The dual-witness file is used only for the separate budget diagnostic.
`inputs/PROVENANCE.md` records their original locations.

## 5. Scope

This is a uniform **δ bound** for the raw B content. No lower bound on the
same-variance deficit `D(q)` follows from it, and it does not establish
`‖c_B‖²≤.06D₊+4·10⁻⁶`. The bound is deliberately simple and is not claimed
optimal. Energy-dependent resolvent barriers, the tensor third-order
bound, and an exhaustive deficit cover remain possible improvements.
