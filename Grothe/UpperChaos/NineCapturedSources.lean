import Grothe.UpperChaos.CapturedSourceBound

/-! # Shared source energy from nine retained bands

Exact phase moments and five, two and two captured-band estimates bound the
remaining source energy over each complete high-degree union. These are
conditional source bounds, not a Grothendieck endpoint.

Agent-ID: codex-239c -/

open MeasureTheory Finset
namespace Grothe.UpperChaos.NineCaptured
noncomputable section
set_option maxRecDepth 4096

def firstModes (i : Fin 5) : Set Idx2 := firstCenterBandModes i.castSucc
def firstLower (i : Fin 5) : ℚ := firstCenterBandLowerQ i.castSucc
def firstError (i : Fin 5) : ℚ := firstCapturedErrorQ i.castSucc

def secondModes (i : Fin 2) : Set Idx2 := secondCenterBandModes i.castSucc.castSucc
def secondLower (i : Fin 2) : ℚ := secondCenterBandLowerQ i.castSucc.castSucc
def secondError (i : Fin 2) : ℚ := secondCapturedErrorQ i.castSucc.castSucc

def thirdModes (i : Fin 2) : Set Idx2 := thirdCenterBandModes i.castSucc.castSucc
def thirdLower (i : Fin 2) : ℚ := thirdCenterBandLowerQ i.castSucc.castSucc
def thirdError (i : Fin 2) : ℚ := thirdCapturedErrorQ i.castSucc.castSucc

def firstCap : ℚ := 7517 / 1000000000
def secondCap : ℚ := 2823 / 1000000000
def thirdCap : ℚ := 2990 / 1000000000

theorem first_budget : capturedTaylorBudgetQ phaseMoment2Q firstLower firstError ≤ firstCap ^ 2 := by
  decide +kernel

theorem second_budget : capturedTaylorBudgetQ phaseMoment4Q secondLower secondError ≤ secondCap ^ 2 := by
  decide +kernel

theorem third_budget : capturedTaylorBudgetQ phaseMoment6Q thirdLower thirdError ≤ thirdCap ^ 2 := by
  decide +kernel

/-- Abstract source cap: the target union need only be disjoint from the retained bands. -/
theorem source_cap {n : ℕ} (A : Fin n → Set Idx2) (B : Set Idx2)
    (hdisj : ∀ i ∈ (univ : Finset (Fin n)), ∀ j ∈ (univ : Finset (Fin n)),
      i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i ∈ (univ : Finset (Fin n)), Disjoint (A i) B)
    (f c : Lp ℂ 2 mu2) (moment cap : ℚ) (lower error : Fin n → ℚ)
    (hlower : ∀ i, (lower i : ℝ) ≤ ‖projOn (A i) c‖)
    (herror : ∀ i, ‖projOn (A i) (f - c)‖ ≤ (error i : ℝ))
    (henergy : ‖f‖ ^ 2 ≤ (moment : ℝ))
    (hbudget : capturedTaylorBudgetQ moment lower error ≤ cap ^ 2)
    (hcap : 0 ≤ cap) : ‖projOn B f‖ ≤ (cap : ℝ) := by
  have hbudgetR : (moment : ℝ) -
      (∑ i : Fin n, (max 0 ((lower i : ℝ) - (error i : ℝ))) ^ 2) ≤ (cap : ℝ) ^ 2 := by
    have h : (capturedTaylorBudgetQ moment lower error : ℝ) ≤ ((cap ^ 2 : ℚ) : ℝ) := by
      exact_mod_cast hbudget
    simpa only [capturedTaylorBudgetQ, Rat.cast_sub, Rat.cast_sum, Rat.cast_pow,
      Rat.cast_max, Rat.cast_zero] using h
  have hcapR : (0 : ℝ) ≤ cap := by exact_mod_cast hcap
  apply norm_projOn_source_le_of_captured_family univ A B hdisj hB f c
    (fun i => (lower i : ℝ)) (fun i => (error i : ℝ))
  · intro i hi; exact hlower i
  · intro i hi; exact herror i
  · exact henergy
  · simpa using hbudgetR
  · exact hcapR


/-- Each high union comprises all of the omitted finite bands and tail. -/
def firstUnion : Set Idx2 := {i | 171 < (bideg i).1 + (bideg i).2}
def secondUnion : Set Idx2 := {i | 71 < (bideg i).1 + (bideg i).2}
def thirdUnion : Set Idx2 := {i | 21 < (bideg i).1 + (bideg i).2}

theorem first_disjoint :
    ∀ i ∈ (univ : Finset (Fin 5)), ∀ j ∈ (univ : Finset (Fin 5)),
      i ≠ j → Disjoint (firstModes i) (firstModes j) := by
  intro i hi j hj hij
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;> fin_cases j <;>
    simp_all [firstModes, firstCenterBandModes, firstCenterBandLo, firstCenterBandHi] <;>
    omega

theorem first_disjoint_union :
    ∀ i ∈ (univ : Finset (Fin 5)), Disjoint (firstModes i) firstUnion := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [firstModes, firstUnion, firstCenterBandModes, firstCenterBandLo, firstCenterBandHi] <;>
    omega

theorem first_union_source
    (hband : ∀ i : Fin 5, ‖projOn (firstModes i) (firstTaylorL2 - firstCenter)‖ ≤
      (firstError i : ℝ)) :
    ‖projOn firstUnion firstTaylorL2‖ ≤ (firstCap : ℝ) := by
  apply source_cap firstModes firstUnion first_disjoint first_disjoint_union
    firstTaylorL2 firstCenter phaseMoment2Q firstCap firstLower firstError
  · intro i; exact firstCenterBand_norm_lower i.castSucc
  · exact hband
  · exact le_of_eq norm_hpow_one_sq
  · exact first_budget
  · norm_num [firstCap]

theorem second_disjoint :
    ∀ i ∈ (univ : Finset (Fin 2)), ∀ j ∈ (univ : Finset (Fin 2)),
      i ≠ j → Disjoint (secondModes i) (secondModes j) := by
  intro i hi j hj hij
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;> fin_cases j <;>
    simp_all [secondModes, secondCenterBandModes, secondCenterBandLo, secondCenterBandHi] <;>
    omega

theorem second_disjoint_union :
    ∀ i ∈ (univ : Finset (Fin 2)), Disjoint (secondModes i) secondUnion := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [secondModes, secondUnion, secondCenterBandModes, secondCenterBandLo, secondCenterBandHi] <;>
    omega

theorem second_union_source
    (hband : ∀ i : Fin 2, ‖projOn (secondModes i) (secondTaylorL2 - secondCenter)‖ ≤
      (secondError i : ℝ)) :
    ‖projOn secondUnion secondTaylorL2‖ ≤ (secondCap : ℝ) := by
  apply source_cap secondModes secondUnion second_disjoint second_disjoint_union
    secondTaylorL2 secondCenter phaseMoment4Q secondCap secondLower secondError
  · intro i; exact secondCenterBand_norm_lower i.castSucc.castSucc
  · exact hband
  · exact le_of_eq norm_hpow_two_sq
  · exact second_budget
  · norm_num [secondCap]

theorem third_disjoint :
    ∀ i ∈ (univ : Finset (Fin 2)), ∀ j ∈ (univ : Finset (Fin 2)),
      i ≠ j → Disjoint (thirdModes i) (thirdModes j) := by
  intro i hi j hj hij
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;> fin_cases j <;>
    simp_all [thirdModes, thirdCenterBandModes, thirdCenterBandLo, thirdCenterBandHi] <;>
    omega

theorem third_disjoint_union :
    ∀ i ∈ (univ : Finset (Fin 2)), Disjoint (thirdModes i) thirdUnion := by
  intro i hi
  rw [Set.disjoint_left]
  intro x hx hy
  fin_cases i <;>
    simp_all [thirdModes, thirdUnion, thirdCenterBandModes, thirdCenterBandLo, thirdCenterBandHi] <;>
    omega

theorem third_union_source
    (hband : ∀ i : Fin 2, ‖projOn (thirdModes i) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdError i : ℝ)) :
    ‖projOn thirdUnion thirdTaylorL2‖ ≤ (thirdCap : ℝ) := by
  apply source_cap thirdModes thirdUnion third_disjoint third_disjoint_union
    thirdTaylorL2 thirdCenter phaseMoment6Q thirdCap thirdLower thirdError
  · intro i; exact thirdCenterBand_norm_lower i.castSucc.castSucc
  · exact hband
  · exact le_of_eq norm_hpow_three_sq
  · exact third_budget
  · norm_num [thirdCap]

end
end Grothe.UpperChaos.NineCaptured
