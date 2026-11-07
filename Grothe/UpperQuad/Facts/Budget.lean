import Grothe.UpperQuad.Facts.Common
import Grothe.UpperQuad.SeedAnalytic
import Grothe.UpperQuad.OmittedTotal
import Grothe.UpperQuad.Facts.OmittedDefs

/-!
# The numeric instantiation of the block facts

The constants: `ρ₀ = 1.55·10⁻¹²` (the inherited quadrature constant of `hQuad`), `δ₀ = 2.2·10⁻¹²`,
`Δ₀ = 2.3·10⁻¹²`; with `epsBlock = 5·10⁶⁴`, `bndBlock = 2¹⁰⁰` (scale `2²⁵⁶`) the three budget
inequalities of `hclose_of_blockFacts` hold (`budget_width`, `budget_smoothing`, `budget_energy`,
by `norm_num`).  `hclose_of_blockFacts_numeric` applies `hclose_of_blockFacts` with these constants,
with S2 discharged at every node by `mem_seedJ0I_moment` (from the Watson remainder `WatsonHyp 70`)
and the quadrature hypothesis `QuadHyp` with `ρ = ρ₀`; its conclusion is literally the hypothesis
`hclose` of `upper_of_three_low_three_whole`.  The thirteen native facts are its only other inputs
(`Grothe/UpperQuad/Facts/Final.lean` supplies them).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Facts

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.Upper
  Grothe.UpperChaos.F0ConditionalEvaluator

/-- The inherited quadrature constant `ρ₀ = 1.55·10⁻¹²`. -/
def rhoQ : ℚ := 155 / 10 ^ 14

/-- `δ₀ = 2.2·10⁻¹²` (the raw-error radius). -/
def deltaQ : ℚ := 22 / 10 ^ 13

/-- `Δ₀ = 2.3·10⁻¹²` (the smoothed radius). -/
def DeltaQ : ℚ := 23 / 10 ^ 13

lemma budget_width :
    2 * ((rhoQ : ℝ)) ^ 2 + 2 * (((12 * bndBlock : ℤ) : ℝ) / 2 ^ (2 * KFix)) ≤ ((deltaQ : ℝ)) ^ 2 := by
  norm_num [rhoQ, deltaQ, bndBlock, KFix]

lemma budget_smoothing :
    (deltaQ : ℝ) + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + (deltaQ : ℝ)) ≤ (DeltaQ : ℝ) := by
  norm_num [deltaQ, DeltaQ]

lemma budget_energy :
    (2 * (501 / 500 : ℝ) + 3 * (DeltaQ : ℝ)) * (DeltaQ : ℝ) +
      (((12 * epsBlock : ℤ) : ℝ)) / 2 ^ (2 * KFix) ≤ (energyErrQ : ℝ) := by
  norm_num [DeltaQ, epsBlock, KFix, energyErrQ]

/-- **The quadrature hypothesis with the inherited constant**: the exact Gauss–Legendre sums of the
committed partition approximate the F0 coefficients in ℓ² within `ρ₀` (obligations S6b, S6c and the
cutoffs; `docs/QUAD_CHECKER.md` §12). -/
def QuadHyp : Prop :=
  ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    ‖FixedChaosSmoothing.baseGradedCoefficient q c d -
      ((gaussCoeff partitionSpecs rootOf q c d : ℝ) : ℂ)‖ ^ 2 ≤ ((rhoQ : ℝ)) ^ 2

/-- S2 at a node of the partition accepted by the loop: the seed `J₀(A²)` of the node lies in the
kernel's enclosure, by `mem_seedJ0I_moment` (the shift `A` is enclosed by the kernel's `aI`). -/
lemma seed_of_shift (hW : WatsonHyp 70) (hpv : profileValid P0 piI profile = true) (nd : NodeSpec)
    {neg : Bool} {aI : Ival} (hshift : nodeShift P0 piI profile nd = some (neg, aI))
    (hvalid : nodeValid P0 nd aI = true) (hx : mem (rootOf nd) nd.bracket.toIval) :
    mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (rootOf nd)) ^ 2))
      (seedJ0I P0 piI (sqI P0 aI)) := by
  obtain ⟨-, hlo, hhi, -, -, hspos, -, -, -, -, -⟩ := nodeValid_unpack P0 nd aI hvalid
  have hn : ∀ j, j < profile.coeffs.size → 0 < (nrmHalfI P0 (sqrtI P0 piI) j).lo := by
    intro j hj
    unfold profileValid at hpv
    simp only [List.all_eq_true, List.mem_range] at hpv
    exact lo_pos_of_isPos (hpv j hj)
  have hs := mem_nodeS P0 (by decide) nd hx hlo hhi
  have hs0 : 0 < specNode nd (rootOf nd) := pos_of_isPos hspos hs
  unfold nodeShift at hshift
  split at hshift
  · exact absurd hshift (by simp)
  · rename_i v neg' aI' hps
    simp only [Option.some.injEq, Prod.mk.injEq] at hshift
    obtain ⟨rfl, rfl⟩ := hshift
    obtain ⟨-, -, hA⟩ := profileShiftI_sound P0 (by decide) mem_piI profile_agrees hs0.le hs hn hps
    have hsq := mem_sqI P0 hA
    rw [← sq] at hsq
    exact mem_seedJ0I_moment P0 (by decide) mem_piI (sq_nonneg _) hsq hW

/-! ### The omitted pairs (part (C) of `hQuad`) -/

/-- The `ℓ²` distance between the exact Gauss sums with and without the cutoffs, from the omitted-pair
fact (S2 from the Watson remainder, the roots from block 0). -/
theorem omitted_l2_of_fact (hf0 : blockFact 0 epsBlock bndBlock = true) (hW : WatsonHyp 70)
    (hO : omittedFact = true) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (gaussCoeffFull partitionSpecs rootOf q c d - gaussCoeff partitionSpecs rootOf q c d) ^ 2 ≤
      ((omittedBoundNum : ℝ) / (2 : ℝ) ^ (2 * KFix)) ^ 2 := by
  obtain ⟨hpv, R0, hR0, -, -⟩ := blockFact_spec hf0
  have hvalid := accumulateSpecs_valid P0 piI profile (bounds 0) (bounds 1) partitionSpecs rawZero R0 hR0
  have hx : ∀ nd ∈ partitionSpecs, mem (rootOf nd) nd.bracket.toIval :=
    rootOf_mem_of_accepted P0 piI profile (bounds 0) (bounds 1) partitionSpecs R0 hR0
  have hJ : ∀ nd ∈ partitionSpecs, ∀ neg aI, nodeShift P0 piI profile nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (rootOf nd)) ^ 2))
        (seedJ0I P0 piI (sqI P0 aI)) := by
    intro nd hnd neg aI hshift
    obtain ⟨neg', aI', hshift', hv⟩ := hvalid nd hnd
    rw [hshift] at hshift'
    simp only [Option.some.injEq, Prod.mk.injEq] at hshift'
    obtain ⟨rfl, rfl⟩ := hshift'
    exact seed_of_shift hW hpv nd hshift hv (hx nd hnd)
  exact omittedOK_sound P0 (by decide) mem_piI profile_agrees hpv partitionSpecs rootOf hx hJ hO

/-- **`hclose` from the twelve block facts and the even fact, with the numeric constants**, S2 from
the Watson remainder and the quadrature hypothesis `QuadHyp`. -/
theorem hclose_of_blockFacts_numeric
    (hf : ∀ b, b < 12 → blockFact b epsBlock bndBlock = true) (hEven : evenFact = true)
    (hW : WatsonHyp 70) (hQuad : QuadHyp) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) := by
  have hsum12 : ∀ z : ℤ, (∑ _b ∈ Finset.range 12, z) = 12 * z := by
    intro z; simp [Finset.sum_const, Finset.card_range]
  -- every node of the partition is accepted by the loop of block 0
  obtain ⟨hpv, R0, hR0, -, -⟩ := blockFact_spec (hf 0 (by norm_num))
  have hvalid := accumulateSpecs_valid P0 piI profile (bounds 0) (bounds 1) partitionSpecs rawZero R0 hR0
  have hx : ∀ nd ∈ partitionSpecs, mem (rootOf nd) nd.bracket.toIval :=
    rootOf_mem_of_accepted P0 piI profile (bounds 0) (bounds 1) partitionSpecs R0 hR0
  have hJ : ∀ nd ∈ partitionSpecs, ∀ neg aI, nodeShift P0 piI profile nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (rootOf nd)) ^ 2))
        (seedJ0I P0 piI (sqI P0 aI)) := by
    intro nd hnd neg aI hshift
    obtain ⟨neg', aI', hshift', hv⟩ := hvalid nd hnd
    rw [hshift] at hshift'
    simp only [Option.some.injEq, Prod.mk.injEq] at hshift'
    obtain ⟨rfl, rfl⟩ := hshift'
    exact seed_of_shift hW hpv nd hshift hv (hx nd hnd)
  apply hclose_of_blockFacts (fun _ => epsBlock) (fun _ => bndBlock) hf (evenFact_spec hEven) hJ hQuad
    (by norm_num [deltaQ] : (0 : ℝ) ≤ (deltaQ : ℝ))
  · rw [hsum12]; exact budget_width
  · exact budget_smoothing
  · rw [hsum12, add_zero]; exact budget_energy

end Grothe.UpperQuad.Facts
