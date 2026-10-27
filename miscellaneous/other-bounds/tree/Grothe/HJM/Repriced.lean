/- Intended path: Grothe/HJM/Repriced.lean -/
import Grothe.HJM.MixtureHead
import Grothe.HJM.OriginSymmetricTailBudget
import Grothe.HJM.HeadCheck

/-!
# Reprice the HJM ledger using the sharper origin tail

The existing origin residual-energy estimate is strictly below the tail
budget in the published ledger. Use that estimate directly in the finite-head
mixture theorem, keeping the head and energy enclosures as explicit inputs.
No origin integral or coefficient table is asserted here.
-/

open MeasureTheory Set Finset GrotheKernel Grothe.Upper

namespace Grothe.HJM

noncomputable section

/-- Weighted origin tail supplied by the existing residual-energy estimate. -/
def repricedOriginTail : ℚ := (397752354801503847 / 10 ^ 21) * (6457 / 25000000)

/-- Simple rational ceilings for the already proved scalar branch tails. -/
def scalarTailBudget : ℚ := 101718 / 10 ^ 16 + ScalarTailRefinement.finite67Upper +
  142728 / 10 ^ 15

/-- Branch-tail budget with the sharper origin estimate. -/
def repricedTail : ℚ := scalarTailBudget + repricedOriginTail

def repricedScore : ℚ := ScalarTailRefinement.slopeLower -
  ScalarTailRefinement.prefixUpper - repricedTail

/-- The exact selector mass divided by the repriced score. -/
def repricedClaim : ℚ := ScalarTailRefinement.selectorMass / repricedScore

theorem repricedScore_pos : 0 < repricedScore := by
  norm_num [repricedScore, repricedTail, scalarTailBudget, repricedOriginTail,
    ScalarTailRefinement.slopeLower, ScalarTailRefinement.prefixUpper,
    ScalarTailRefinement.finite67Upper]

theorem repricedClaim_lt : (repricedClaim : ℝ) < 1.4048984278 := by
  norm_num [repricedClaim, repricedScore, repricedTail, scalarTailBudget, repricedOriginTail,
    ScalarTailRefinement.selectorMass, ScalarTailRefinement.slopeLower,
    ScalarTailRefinement.prefixUpper, ScalarTailRefinement.finite67Upper]

private theorem outerReserve_le :
    ScalarTailRefinement.outerReserve ≤ (142728 / 10 ^ 15 : ℚ) := by
  norm_num [ScalarTailRefinement.outerReserve, ScalarTailRefinement.branch5Weight,
    ScalarTailRefinement.weightedOuterBound]

/-- The published head and any weighted origin-tail cap give the corresponding
exact ledger endpoint, with the scalar branch tails already priced. -/
theorem hjm_bound_of_head_origin_tail
    (originTail : ℝ)
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (h6 : |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ originTail)
    (hden : 0 < (ScalarTailRefinement.slopeLower : ℝ) -
      ScalarTailRefinement.prefixUpper - ((scalarTailBudget : ℝ) + originTail)) :
    IsGrothendieckBound ((ScalarTailRefinement.selectorMass : ℝ) /
      ((ScalarTailRefinement.slopeLower : ℝ) - ScalarTailRefinement.prefixUpper -
        ((scalarTailBudget : ℝ) + originTail))) := by
  let T : Fin 6 → ℝ := fun r => |wt r| * ∑' n, |hc r (n + 120)|
  have hcauchy : T 0 + T 1 + T 2 + T 3 ≤ (Cauchy.cauchyBudget : ℝ) := Cauchy.weighted_tails
  have h5 : T 4 ≤ (ScalarTailRefinement.finite67Upper : ℝ) +
      (ScalarTailRefinement.outerReserve : ℝ) := by
    dsimp [T]
    rw [wt_four]
    exact branch5_tail
  have hcauchyQ : (Cauchy.cauchyBudget : ℝ) ≤ (101718 / 10 ^ 16 : ℝ) := by
    have h : (Cauchy.cauchyBudget : ℝ) ≤ (((101718 / 10 ^ 16 : ℚ) : ℝ)) :=
      Rat.cast_le.mpr Cauchy.cauchyBudget_lt.le
    norm_num at h ⊢
    exact h
  have houterQ : (ScalarTailRefinement.outerReserve : ℝ) ≤ (142728 / 10 ^ 15 : ℝ) := by
    have h : (ScalarTailRefinement.outerReserve : ℝ) ≤ (((142728 / 10 ^ 15 : ℚ) : ℝ)) :=
      Rat.cast_le.mpr outerReserve_le
    norm_num at h ⊢
    exact h
  have htail : (∑ r, |wt r| * ∑' n, |hc r (n + (119 + 1))|) ≤
      (scalarTailBudget : ℝ) + originTail := by
    simp only [show (119 : ℕ) + 1 = 120 by norm_num, Fin.sum_univ_six]
    change T 0 + T 1 + T 2 + T 3 + T 4 + T 5 ≤ (scalarTailBudget : ℝ) + originTail
    have h6' : T 5 ≤ originTail := h6
    have he : (scalarTailBudget : ℝ) = (101718 / 10 ^ 16 : ℝ) +
        (ScalarTailRefinement.finite67Upper : ℝ) + 142728 / 10 ^ 15 := by
      simp [scalarTailBudget]
    rw [he]
    linarith
  have hscore : (∑ n ∈ range 119, |qhat (n + 1)|) + ((scalarTailBudget : ℝ) + originTail) <
      (ScalarTailRefinement.slopeLower : ℝ) := by linarith
  have hmass : (0 : ℝ) < ScalarTailRefinement.selectorMass := by
    norm_num [ScalarTailRefinement.selectorMass]
  have hmixed := mixture_bound_of_finite_head Finset.univ wt hc
    (fun r _ => summable_hc r) (fun r _ => dominated_hc r)
    hmass (le_of_eq weights_mass) 119 (ScalarTailRefinement.slopeLower : ℝ)
    ((scalarTailBudget : ℝ) + originTail) (by simpa only [qhat] using hslope) htail
    (by simpa only [qhat] using hscore)
  have hprefix' : (∑ n ∈ range 119, |∑ r, wt r * hc r (n + 1)|) ≤
      (ScalarTailRefinement.prefixUpper : ℝ) := by
    simpa only [qhat] using hprefix
  exact hmixed.mono (div_le_div_of_nonneg_left hmass.le hden (by linarith [hprefix']))

/-- The published head hypotheses and the sharper weighted origin-tail cap
give a smaller conditional endpoint. -/
theorem repriced_hjm_bound_of_head
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (h6 : |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (repricedOriginTail : ℝ)) :
    IsGrothendieckBound (repricedClaim : ℝ) := by
  have hden : 0 < (ScalarTailRefinement.slopeLower : ℝ) -
      ScalarTailRefinement.prefixUpper - ((scalarTailBudget : ℝ) + repricedOriginTail) := by
    have h : (0 : ℝ) < (repricedScore : ℝ) := by exact_mod_cast repricedScore_pos
    simpa only [repricedScore, repricedTail, Rat.cast_sub, Rat.cast_add] using h
  have h := hjm_bound_of_head_origin_tail (repricedOriginTail : ℝ) hslope hprefix h6 hden
  simpa only [repricedClaim, repricedScore, repricedTail, Rat.cast_div, Rat.cast_sub,
    Rat.cast_add] using h

/-- The existing two residual-energy caps supply the sharpened origin tail. -/
theorem repriced_hjm_bound_of_residual_caps
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (hEL : Origin.leftTailEnergy 120 ≤ (1174 / 1000 : ℝ))
    (hER : Origin.rightTailEnergy 120 ≤ (1176 / 1000 : ℝ)) :
    IsGrothendieckBound (repricedClaim : ℝ) := by
  apply repriced_hjm_bound_of_head hslope hprefix
  change |wt 5| * (∑' n, |Origin.coeff (n + 120)|) ≤ (repricedOriginTail : ℝ)
  rw [wt_five]
  have h := mul_le_mul_of_nonneg_left
    (Origin.coeff_tail_at_120_le_of_residual_caps hEL hER)
    (show (0 : ℝ) ≤ ((397752354801503847 / 10 ^ 21 : ℚ) : ℝ) by norm_num)
  norm_num only [repricedOriginTail, Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] at h ⊢
  exact h

/-- The same total-energy and visible-energy inputs already used by the
origin-tail certificate imply the repriced endpoint. -/
theorem repriced_hjm_bound_of_visible
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.fEnergyAmplitude s‖ ^ 2) ≤
      (12671 / 1000 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.gEnergyAmplitude s‖ ^ 2) ≤
      (6337 / 500 : ℝ))
    (hVL : (11497 / 1000 : ℝ) ≤ ∑ n ∈ range 120, Origin.leftEnergyTerm n)
    (hVR : (5749 / 500 : ℝ) ≤ ∑ n ∈ range 120, Origin.rightEnergyTerm n) :
    IsGrothendieckBound (repricedClaim : ℝ) := by
  apply repriced_hjm_bound_of_residual_caps hslope hprefix
  · have h := Origin.leftTailEnergy_le_of_visible 120 _ _ hCL hVL
    norm_num at h ⊢
    exact h
  · have h := Origin.rightTailEnergy_le_of_visible 120 _ _ hCR hVR
    norm_num at h ⊢
    exact h

/-- An accepted, actually enclosed origin coefficient table and the four
energy inequalities imply the repriced endpoint. -/
theorem repriced_hjm_bound_of_tables_visible {K6 : List Ival}
    (K6mem : ∀ n < 120, mem (Origin.coeff n) (K6.getD n zeroI))
    (hhead : headOK K6 = true)
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.fEnergyAmplitude s‖ ^ 2) ≤
      (12671 / 1000 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.gEnergyAmplitude s‖ ^ 2) ≤
      (6337 / 500 : ℝ))
    (hVL : (11497 / 1000 : ℝ) ≤ ∑ n ∈ range 120, Origin.leftEnergyTerm n)
    (hVR : (5749 / 500 : ℝ) ≤ ∑ n ∈ range 120, Origin.rightEnergyTerm n) :
    IsGrothendieckBound (repricedClaim : ℝ) :=
  repriced_hjm_bound_of_visible (head_of_check K6mem hhead).1
    (head_of_check K6mem hhead).2 hCL hCR hVL hVR

/-- The same ledger using the newer symmetric residual-energy targets. -/
def symmetricOriginTail : ℚ := (397752354801503847 / 10 ^ 21) * (2613 / 10000000)

def symmetricScore : ℚ := ScalarTailRefinement.slopeLower - ScalarTailRefinement.prefixUpper -
  (scalarTailBudget + symmetricOriginTail)

def symmetricClaim : ℚ := ScalarTailRefinement.selectorMass / symmetricScore

theorem symmetricClaim_lt : (symmetricClaim : ℝ) < 1.4048984302 := by
  norm_num [symmetricClaim, symmetricScore, scalarTailBudget, symmetricOriginTail,
    ScalarTailRefinement.selectorMass, ScalarTailRefinement.slopeLower,
    ScalarTailRefinement.prefixUpper, ScalarTailRefinement.finite67Upper]

/-- The common residual-energy targets `1.2` give a slightly smaller endpoint
than the original HJM ledger, with no stronger energy inputs. -/
theorem symmetric_hjm_bound_of_residual_caps
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (hL : Origin.leftTailEnergy 120 ≤ (6 / 5 : ℝ))
    (hR : Origin.rightTailEnergy 120 ≤ (6 / 5 : ℝ)) :
    IsGrothendieckBound (symmetricClaim : ℝ) := by
  have htail := Origin.coeff_tail_le_of_residual_caps 120 (by norm_num) (6 / 5) (6 / 5) hL hR
  have hsqrt : Real.sqrt ((6 / 5 : ℝ) * (6 / 5)) = 6 / 5 := by
    rw [← pow_two, Real.sqrt_sq (by norm_num)]
  rw [hsqrt] at htail
  have hcap : (∑' n, |Origin.coeff (n + 120)|) ≤ (2613 / 10000000 : ℝ) :=
    htail.trans (by nlinarith [origin_symmetric_tail_arithmetic])
  have h6 : |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (symmetricOriginTail : ℝ) := by
    change |wt 5| * (∑' n, |Origin.coeff (n + 120)|) ≤ (symmetricOriginTail : ℝ)
    rw [wt_five]
    have h := mul_le_mul_of_nonneg_left hcap
      (show (0 : ℝ) ≤ ((397752354801503847 / 10 ^ 21 : ℚ) : ℝ) by norm_num)
    norm_num only [symmetricOriginTail, Rat.cast_mul, Rat.cast_div, Rat.cast_pow,
      Rat.cast_ofNat] at h ⊢
    exact h
  have hden : 0 < (ScalarTailRefinement.slopeLower : ℝ) -
      ScalarTailRefinement.prefixUpper - ((scalarTailBudget : ℝ) + symmetricOriginTail) := by
    norm_num [scalarTailBudget, symmetricOriginTail, ScalarTailRefinement.slopeLower,
      ScalarTailRefinement.prefixUpper, ScalarTailRefinement.finite67Upper]
  have h := hjm_bound_of_head_origin_tail (symmetricOriginTail : ℝ) hslope hprefix h6 hden
  simpa only [symmetricClaim, symmetricScore, Rat.cast_div, Rat.cast_sub, Rat.cast_add] using h

/-- The symmetric total and visible energy targets give the same repriced
endpoint once the published head is enclosed. -/
theorem symmetric_hjm_bound_of_visible
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.fEnergyAmplitude s‖ ^ 2) ≤
      (127 / 10 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.gEnergyAmplitude s‖ ^ 2) ≤
      (127 / 10 : ℝ))
    (hVL : (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, Origin.leftEnergyTerm n)
    (hVR : (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, Origin.rightEnergyTerm n) :
    IsGrothendieckBound (symmetricClaim : ℝ) := by
  apply symmetric_hjm_bound_of_residual_caps hslope hprefix
  · have h := Origin.leftTailEnergy_le_of_visible 120 _ _ hCL hVL
    norm_num at h ⊢
    exact h
  · have h := Origin.rightTailEnergy_le_of_visible 120 _ _ hCR hVR
    norm_num at h ⊢
    exact h

/-- The symmetric targets and an accepted actual coefficient table give the
repriced endpoint without a separate infinite-tail hypothesis. -/
theorem symmetric_hjm_bound_of_tables_visible {K6 : List Ival}
    (K6mem : ∀ n < 120, mem (Origin.coeff n) (K6.getD n zeroI))
    (hhead : headOK K6 = true)
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.fEnergyAmplitude s‖ ^ 2) ≤
      (127 / 10 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.gEnergyAmplitude s‖ ^ 2) ≤
      (127 / 10 : ℝ))
    (hVL : (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, Origin.leftEnergyTerm n)
    (hVR : (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, Origin.rightEnergyTerm n) :
    IsGrothendieckBound (symmetricClaim : ℝ) :=
  symmetric_hjm_bound_of_visible (head_of_check K6mem hhead).1
    (head_of_check K6mem hhead).2 hCL hCR hVL hVR

end
end Grothe.HJM
