import Grothe.UpperChaos.GroupedRounder

/-!
# Capturing a second Taylor source with three bands

This module derives a weaker bound for the fourth second-order band and the
>91 tail using only the first three Gaussian band-error hypotheses. The
retained error hypotheses and all geometry are explicit. It does not prove a
Gaussian estimate or a Grothendieck endpoint.
-/

open MeasureTheory Finset
namespace Grothe.UpperChaos

noncomputable section

/-- Variant of captured-energy subtraction that bounds the source itself on B;
there is no false assumption that the approximant vanishes on B. -/
theorem norm_projOn_source_le_of_captured_family {ι : Type*} (s : Finset ι)
    (A : ι → Set Idx2) (B : Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i ∈ s, Disjoint (A i) B) (f c : Lp ℂ 2 mu2)
    (lower error : ι → ℝ) (hlower : ∀ i ∈ s, lower i ≤ ‖projOn (A i) c‖)
    (herror : ∀ i ∈ s, ‖projOn (A i) (f - c)‖ ≤ error i)
    {energy cap : ℝ} (henergy : ‖f‖ ^ 2 ≤ energy)
    (hbudget : energy - (∑ i ∈ s, (max 0 (lower i - error i)) ^ 2) ≤ cap ^ 2)
    (hcap : 0 ≤ cap) : ‖projOn B f‖ ≤ cap := by
  have hc : (∑ i ∈ s, (max 0 (lower i - error i)) ^ 2) ≤
      ∑ i ∈ s, ‖projOn (A i) f‖ ^ 2 := by
    apply sum_le_sum
    intro i hi
    have htri := norm_le_norm_add_norm_sub (projOn (A i) f) (projOn (A i) c)
    rw [← map_sub] at htri
    have hlow : max 0 (lower i - error i) ≤ ‖projOn (A i) f‖ :=
      max_le (norm_nonneg _) (by have := hlower i hi; have := herror i hi; linarith)
    exact pow_le_pow_left₀ (le_max_left 0 (lower i - error i)) hlow 2
  have hs := sum_norm_projOn_sq_add_le_of_disjoint s A B hdisj hB f
  nlinarith [norm_nonneg (projOn B f)]

def secondThreeModes (i : Fin 3) : Set Idx2 := secondCenterBandModes i.castSucc

def secondThreeLower (i : Fin 3) : ℚ := secondCenterBandLowerQ i.castSucc

def secondThreeError (i : Fin 3) : ℚ := secondCapturedErrorQ i.castSucc

def secondResidualCapQ : ℚ := 2452 / 1000000000

/-- Rational arithmetic only: the exact fourth moment minus three captured bands. -/
theorem secondThree_budget :
    phaseMoment4Q - (∑ i : Fin 3, (max 0 (secondThreeLower i - secondThreeError i)) ^ 2) ≤
      secondResidualCapQ ^ 2 := by
  decide +kernel

/-- The fourth band plus the tail can each use the remaining source energy.
The caller proves B disjoint from the three concrete low bands. -/
theorem second_source_le_of_three_bands (B : Set Idx2)
    (hdisj : ∀ i ∈ (univ : Finset (Fin 3)), ∀ j ∈ (univ : Finset (Fin 3)),
      i ≠ j → Disjoint (secondThreeModes i) (secondThreeModes j))
    (hB : ∀ i ∈ (univ : Finset (Fin 3)), Disjoint (secondThreeModes i) B)
    (hsecond : ∀ i : Fin 3,
      ‖projOn (secondThreeModes i) (secondTaylorL2 - secondCenter)‖ ≤
        (secondThreeError i : ℝ)) :
    ‖projOn B secondTaylorL2‖ ≤ (secondResidualCapQ : ℝ) := by
  have henergy : ‖secondTaylorL2‖ ^ 2 ≤ (phaseMoment4Q : ℝ) := by
    exact le_of_eq norm_hpow_two_sq
  have hbudget : (phaseMoment4Q : ℝ) -
      (∑ i : Fin 3, (max 0 ((secondThreeLower i : ℝ) - (secondThreeError i : ℝ))) ^ 2) ≤
      (secondResidualCapQ : ℝ) ^ 2 := by
    have hq : ((phaseMoment4Q - ∑ i : Fin 3,
        (max 0 (secondThreeLower i - secondThreeError i)) ^ 2 : ℚ) : ℝ) ≤
        ((secondResidualCapQ ^ 2 : ℚ) : ℝ) := by exact_mod_cast secondThree_budget
    simpa only [Rat.cast_sub, Rat.cast_sum, Rat.cast_pow, Rat.cast_max, Rat.cast_zero] using hq
  apply norm_projOn_source_le_of_captured_family univ secondThreeModes B hdisj hB
    secondTaylorL2 secondCenter (fun i => (secondThreeLower i : ℝ))
    (fun i => (secondThreeError i : ℝ))
  · intro i hi
    exact secondCenterBand_norm_lower i.castSucc
  · intro i hi
    exact hsecond i
  · exact henergy
  · simpa using hbudget
  · norm_num [secondResidualCapQ]


/-- The first three named bands are pairwise disjoint. -/
theorem secondThree_disjoint :
    ∀ i ∈ (univ : Finset (Fin 3)), ∀ j ∈ (univ : Finset (Fin 3)),
      i ≠ j → Disjoint (secondThreeModes i) (secondThreeModes j) := by
  intro i hi j hj hij
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;> fin_cases j <;>
    simp_all [secondThreeModes, secondCenterBandModes, secondCenterBandLo, secondCenterBandHi] <;>
    omega

/-- The remaining finite band is disjoint from the first three bands. -/
theorem secondThree_disjoint_last :
    ∀ i ∈ (univ : Finset (Fin 3)), Disjoint (secondThreeModes i) (secondCenterBandModes 3) := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [secondThreeModes, secondCenterBandModes, secondCenterBandLo, secondCenterBandHi] <;>
    omega

/-- The degree tail is disjoint from the first three bands. -/
theorem secondThree_disjoint_tail :
    ∀ i ∈ (univ : Finset (Fin 3)),
      Disjoint (secondThreeModes i) {x : Idx2 | 91 < (bideg x).1 + (bideg x).2} := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [secondThreeModes, secondCenterBandModes, secondCenterBandLo, secondCenterBandHi] <;>
    omega

/-- From an upper bound on the source on band 3, the triangle inequality
bounds the actual approximation error. No sign or correlation claim is used. -/
theorem second_last_band_error_of_source
    (hsource : ‖projOn (secondCenterBandModes 3) secondTaylorL2‖ ≤
      (secondResidualCapQ : ℝ)) :
    ‖projOn (secondCenterBandModes 3) (secondTaylorL2 - secondCenter)‖ ≤
      (3474 / 1000000000 : ℝ) := by
  have hc := secondCenterBand_norm_upper 3
  have hq : secondResidualCapQ + secondCenterBandUpperQ 3 ≤ 3474 / 1000000000 := by
    decide +kernel
  have hr : (secondResidualCapQ : ℝ) + (secondCenterBandUpperQ 3 : ℝ) ≤
      (3474 / 1000000000 : ℝ) := by
    have hcast : ((secondResidualCapQ + secondCenterBandUpperQ 3 : ℚ) : ℝ) ≤
        ((3474 / 1000000000 : ℚ) : ℝ) := Rat.cast_le.mpr hq
    simpa only [Rat.cast_add, Rat.cast_div, Rat.cast_ofNat] using hcast
  rw [map_sub]
  exact (norm_sub_le _ _).trans (add_le_add hsource hc |>.trans hr)

/-- On the >91 tail, the center vanishes exactly. -/
theorem second_tail_error_of_source
    (hsource : ‖projOn {i : Idx2 | 91 < (bideg i).1 + (bideg i).2} secondTaylorL2‖ ≤
      (secondResidualCapQ : ℝ)) :
    ‖projOn {i : Idx2 | 91 < (bideg i).1 + (bideg i).2}
      (secondTaylorL2 - secondCenter)‖ ≤ (secondResidualCapQ : ℝ) := by
  rw [map_sub, secondCenter_tail_zero, sub_zero]
  exact hsource

/-- The two replacement bounds from only three second-source error premises. -/
theorem second_last_and_tail_of_three
    (hsecond : ∀ i : Fin 3,
      ‖projOn (secondThreeModes i) (secondTaylorL2 - secondCenter)‖ ≤
        (secondThreeError i : ℝ)) :
    ‖projOn (secondCenterBandModes 3) (secondTaylorL2 - secondCenter)‖ ≤
        (3474 / 1000000000 : ℝ) ∧
      ‖projOn {i : Idx2 | 91 < (bideg i).1 + (bideg i).2}
        (secondTaylorL2 - secondCenter)‖ ≤ (secondResidualCapQ : ℝ) := by
  constructor
  · apply second_last_band_error_of_source
    exact second_source_le_of_three_bands _ secondThree_disjoint secondThree_disjoint_last hsecond
  · apply second_tail_error_of_source
    exact second_source_le_of_three_bands _ secondThree_disjoint secondThree_disjoint_tail hsecond

end
end Grothe.UpperChaos
