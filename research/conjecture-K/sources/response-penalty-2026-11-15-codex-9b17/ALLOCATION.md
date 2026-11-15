<!-- Original: research/conjecture-K/MONOGRAPH.md allocation extension, working proof of codex-9b17, 2026-11-15. Read status through STATUS.md 2.12d. -->
#### Splitting the squares for a retained consumer

The allocation can be made explicit. For s,k ≥ 0 put
Σ_(s,k) = s‖P₁,₀k_response‖² + kε‖P₂,₁h+(√2β/ε)H‖².
For λ > 0 the same proof gives Σ_(s,k) ≥ J_(s,k,λ), where

    a_s(λ) = 2(2s+λ)/(4s+3λ),       n_s(λ) = 8(s+λ)/(6s+7λ),
    J_(s,k,λ) = (λ/ε²)[E_q/2+a_s(λ)E_A+4E_B/3+E_Q+E_P+n_s(λ)E_ν]
                −λ(π/4−t²)
                + [kελ/(2(3kε+4λ))](t−4β/ε)².

Here k_response denotes the response half-difference, to distinguish it from
the scalar square allocation k. With allocations in [0,1], a support dual
may spend precisely the complementary fractions 1−s and 1−k. The remaining
row then subtracts max(0,J_(s,k,λ)). The square completion and this safe
composition are formalized in `Grothe/Lower/ResponsePenalty.lean`; the actual
Gaussian witness-row interface is `LowerAnalytic.VOf_frame_with_penalty` in
`Lower/RowReduction.lean`. These are Lean algebraic/interface results with
explicit Gram, allocated-square and support-bound premises. They do not
formalize the Gaussian Gram instantiation, create a support certificate, or
alter the hypotheses or endpoint of `main_bounds`.

In particular **s=0, k=1 is compatible with the retained functional Λ̂**,
which has already spent the whole first-chaos square. Define the ordinary
weighted sector energy

    D = E_q/2 + 2E_A/3 + 4E_B/3 + E_Q + E_P + 8E_ν/7.

Then, for every actual response and every λ > 0,

    ε‖P₂,₁h+(√2β/ε)H‖²
      ≥ λ[D/ε² − (π/4−t²)]
        + [ελ/(2(3ε+4λ))](t−4β/ε)².                     (H)

Consequently the exact row is bounded by its retained-functional expression
minus the nonnegative part of (H). This spends the h-square once and does
not spend the first-chaos square again. At the peak ε,β, the single rational
choice λ=1/4 proves the **entire region t≥.8456, D≥.04** pays more than 10⁻⁴
in the h-square. The scalar regional implication is kernel-checked by
`ResponsePenalty.peak_h_only_region`, using Mathlib's rigorous π bound;
the Gaussian interpretation still uses the author-only Gram proof. This is
a regional response cut, not a uniform 10⁻⁴ reduction of a global cap.

The gap to the production certificate is specific. The current cover uses
ε=149/200 and variables (t,τ,x) for a remote residual law and gate; it has
already absorbed the first-chaos square into its fibre potentials and does
not retain D or the six actual sector energies. Thus its saved scalar caps
cannot simply be reduced by J_(1,1,λ). A full implementation must establish
the Gaussian weighted-Gram premise in Lean and carry compatible energy
information through the fibre reduction and the finite cover, or produce
new support certificates with the allocated squares. Neither obligation is
hidden in the new Lean consumer, and the current numerical lower endpoint
remains unchanged.
