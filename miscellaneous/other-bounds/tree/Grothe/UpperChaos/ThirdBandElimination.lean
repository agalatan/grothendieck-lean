import Grothe.UpperChaos.ThirteenBandUpper

/-!
# Bounding the third Taylor source from three captured bands

The exact sixth phase moment controls the remaining source energy. The
last finite-band residual uses a triangle bound for the exact center; the
tail uses the center's exact support. No new Gaussian estimate is assumed.

Agent-ID: codex-239c
-/

open MeasureTheory Finset
namespace Grothe.UpperChaos

noncomputable section

def thirdThreeModes (i : Fin 3) : Set Idx2 := thirdCenterBandModes i.castSucc
def thirdThreeLower (i : Fin 3) : ℚ := thirdCenterBandLowerQ i.castSucc
def thirdThreeError (i : Fin 3) : ℚ := thirdCapturedErrorQ i.castSucc
def thirdResidualCapQ : ℚ := 2627 / 1000000000

/-- Exact sixth moment minus the three retained captured-band norms. -/
theorem thirdThree_budget :
    phaseMoment6Q - (∑ i : Fin 3, (max 0 (thirdThreeLower i - thirdThreeError i)) ^ 2) ≤
      thirdResidualCapQ ^ 2 := by
  decide +kernel

theorem third_source_le_of_three_bands (B : Set Idx2)
    (hdisj : ∀ i ∈ (univ : Finset (Fin 3)), ∀ j ∈ (univ : Finset (Fin 3)),
      i ≠ j → Disjoint (thirdThreeModes i) (thirdThreeModes j))
    (hB : ∀ i ∈ (univ : Finset (Fin 3)), Disjoint (thirdThreeModes i) B)
    (hthird : ∀ i : Fin 3,
      ‖projOn (thirdThreeModes i) (thirdTaylorL2 - thirdCenter)‖ ≤
        (thirdThreeError i : ℝ)) :
    ‖projOn B thirdTaylorL2‖ ≤ (thirdResidualCapQ : ℝ) := by
  have henergy : ‖thirdTaylorL2‖ ^ 2 ≤ (phaseMoment6Q : ℝ) := by
    exact le_of_eq norm_hpow_three_sq
  have hbudget : (phaseMoment6Q : ℝ) -
      (∑ i : Fin 3, (max 0 ((thirdThreeLower i : ℝ) - (thirdThreeError i : ℝ))) ^ 2) ≤
      (thirdResidualCapQ : ℝ) ^ 2 := by
    have hq : ((phaseMoment6Q - ∑ i : Fin 3,
        (max 0 (thirdThreeLower i - thirdThreeError i)) ^ 2 : ℚ) : ℝ) ≤
        ((thirdResidualCapQ ^ 2 : ℚ) : ℝ) := by exact_mod_cast thirdThree_budget
    simpa only [Rat.cast_sub, Rat.cast_sum, Rat.cast_pow, Rat.cast_max, Rat.cast_zero] using hq
  apply norm_projOn_source_le_of_captured_family univ thirdThreeModes B hdisj hB
    thirdTaylorL2 thirdCenter (fun i => (thirdThreeLower i : ℝ))
    (fun i => (thirdThreeError i : ℝ))
  · intro i hi
    exact thirdCenterBand_norm_lower i.castSucc
  · intro i hi
    exact hthird i
  · exact henergy
  · simpa using hbudget
  · norm_num [thirdResidualCapQ]

theorem thirdThree_disjoint :
    ∀ i ∈ (univ : Finset (Fin 3)), ∀ j ∈ (univ : Finset (Fin 3)),
      i ≠ j → Disjoint (thirdThreeModes i) (thirdThreeModes j) := by
  intro i hi j hj hij
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;> fin_cases j <;>
    simp_all [thirdThreeModes, thirdCenterBandModes, thirdCenterBandLo, thirdCenterBandHi] <;>
    omega

theorem thirdThree_disjoint_last :
    ∀ i ∈ (univ : Finset (Fin 3)), Disjoint (thirdThreeModes i) (thirdCenterBandModes 3) := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [thirdThreeModes, thirdCenterBandModes, thirdCenterBandLo, thirdCenterBandHi] <;>
    omega

theorem thirdThree_disjoint_tail :
    ∀ i ∈ (univ : Finset (Fin 3)),
      Disjoint (thirdThreeModes i) {x : Idx2 | 51 < (bideg x).1 + (bideg x).2} := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [thirdThreeModes, thirdCenterBandModes, thirdCenterBandLo, thirdCenterBandHi] <;>
    omega

theorem third_last_band_error_of_source
    (hsource : ‖projOn (thirdCenterBandModes 3) thirdTaylorL2‖ ≤
      (thirdResidualCapQ : ℝ)) :
    ‖projOn (thirdCenterBandModes 3) (thirdTaylorL2 - thirdCenter)‖ ≤
      (4315 / 1000000000 : ℝ) := by
  have hc := thirdCenterBand_norm_upper 3
  have hq : thirdResidualCapQ + thirdCenterBandUpperQ 3 ≤ 4315 / 1000000000 := by
    decide +kernel
  have hr : (thirdResidualCapQ : ℝ) + (thirdCenterBandUpperQ 3 : ℝ) ≤
      (4315 / 1000000000 : ℝ) := by
    have hcast : ((thirdResidualCapQ + thirdCenterBandUpperQ 3 : ℚ) : ℝ) ≤
        ((4315 / 1000000000 : ℚ) : ℝ) := Rat.cast_le.mpr hq
    simpa only [Rat.cast_add, Rat.cast_div, Rat.cast_ofNat] using hcast
  rw [map_sub]
  exact (norm_sub_le _ _).trans (add_le_add hsource hc |>.trans hr)

theorem third_tail_error_of_source
    (hsource : ‖projOn {i : Idx2 | 51 < (bideg i).1 + (bideg i).2} thirdTaylorL2‖ ≤
      (thirdResidualCapQ : ℝ)) :
    ‖projOn {i : Idx2 | 51 < (bideg i).1 + (bideg i).2}
      (thirdTaylorL2 - thirdCenter)‖ ≤ (thirdResidualCapQ : ℝ) := by
  rw [map_sub, thirdCenter_tail_zero, sub_zero]
  exact hsource

theorem third_last_and_tail_of_three
    (hthird : ∀ i : Fin 3,
      ‖projOn (thirdThreeModes i) (thirdTaylorL2 - thirdCenter)‖ ≤
        (thirdThreeError i : ℝ)) :
    ‖projOn (thirdCenterBandModes 3) (thirdTaylorL2 - thirdCenter)‖ ≤
        (4315 / 1000000000 : ℝ) ∧
      ‖projOn {i : Idx2 | 51 < (bideg i).1 + (bideg i).2}
        (thirdTaylorL2 - thirdCenter)‖ ≤ (thirdResidualCapQ : ℝ) := by
  constructor
  · apply third_last_band_error_of_source
    exact third_source_le_of_three_bands _ thirdThree_disjoint thirdThree_disjoint_last hthird
  · apply third_tail_error_of_source
    exact third_source_le_of_three_bands _ thirdThree_disjoint thirdThree_disjoint_tail hthird

end
end Grothe.UpperChaos
