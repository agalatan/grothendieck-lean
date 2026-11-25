import Grothe.UpperSixExact.Head
import Grothe.UpperSixExact.VariableCutoff

/-! # A uniform ceiling on reweighting the six fixed upper-certificate columns

The admissible comparison class fixes the six maps, preprocessors, cutoff lengths, and tail
allowances. Every coefficient in each retained dyadic interval can vary independently. The
common dual vector is the exact rational witness of research PR #678. The inequalities below
use the actual six-channel interval evaluator. This score bound is independent of the root
upper theorem.

Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Haagerup.SixChannelExact

open Finset

/-- Every convex mixture of a fixed finite list of paid channel heads has score at most
the greatest channel score tested by any common dual vector in the coefficient cube. -/
theorem mixture_score_le_dual {k n : ℕ} (w c e : Fin k → ℝ) (h : Fin k → Fin n → ℝ)
    (z : Fin n → ℝ) (hw : ∀ i, 0 ≤ w i) (hs : ∑ i, w i = 1)
    (hz : ∀ j, |z j| ≤ 1) {B : ℝ}
    (hB : ∀ i, c i - e i + ∑ j, z j * h i j ≤ B) :
    (∑ i, w i * c i) - (∑ j, |∑ i, w i * h i j|) - (∑ i, w i * e i) ≤ B := by
  let y (j : Fin n) := ∑ i, w i * h i j
  have hp : -(∑ j, |y j|) ≤ ∑ j, z j * y j := by
    rw [← sum_neg_distrib]
    refine sum_le_sum fun j _ => ?_
    have hab : |z j * y j| ≤ |y j| := by
      rw [abs_mul]
      simpa only [one_mul] using mul_le_mul_of_nonneg_right (hz j) (abs_nonneg (y j))
    exact (neg_le_neg hab).trans (neg_abs_le _)
  have hj : ∑ j, z j * y j = ∑ i, w i * (∑ j, z j * h i j) := by
    simp only [y, mul_sum]
    rw [sum_comm]
    exact sum_congr rfl fun i _ => sum_congr rfl fun j _ => by ring
  have ha : (∑ i, w i * c i) - (∑ i, w i * e i) = ∑ i, w i * (c i - e i) := by
    simp only [mul_sub, sum_sub_distrib]
  calc
    (∑ i, w i * c i) - (∑ j, |∑ i, w i * h i j|) - (∑ i, w i * e i) ≤
        ((∑ i, w i * c i) - (∑ i, w i * e i)) + (∑ j, z j * y j) := by dsimp [y] at *; linarith
    _ = ∑ i, w i * (c i - e i + ∑ j, z j * h i j) := by
      rw [ha, hj]; simp only [mul_add, sum_add_distrib]
    _ ≤ ∑ i, w i * B := sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hB i) (hw i)
    _ = B := by rw [← sum_mul, hs, one_mul]


/-- Integer sign mask for the common dual normal at the 320 nonlinear head grades.
Bit zero corresponds to the first nonlinear coefficient. The five fractional coordinates
are given separately below; every other clear bit denotes −1. -/
def dualSigns : ℕ := 0x92925a5b4b696d2da4b49692d25a4b49692d25a5b496d6d2db4b7f696d2da4b5860

def dualNumerator (j : ℕ) : ℤ :=
  match j with
  | 1 => 989214814
  | 2 => -601911526
  | 3 => -424453287
  | 4 => -333808768
  | 8 => 995448677
  | k => if dualSigns.testBit k then 10^9 else -(10^9)

def dualCoord (j : Fin 320) : ℚ := (dualNumerator j.val : ℚ) / 10^9

private theorem dualNumerator_abs_le (j : ℕ) : |dualNumerator j| ≤ (10 : ℤ)^9 := by
  unfold dualNumerator
  split <;> try norm_num
  split <;> norm_num

theorem dual_coords_feasible (j : Fin 320) : |dualCoord j| ≤ 1 := by
  rw [dualCoord, abs_div, abs_of_pos (by norm_num : (0:ℚ) < 10^9), div_le_one (by norm_num)]
  exact_mod_cast dualNumerator_abs_le j.val

open HaagerupKernel

/-- Upper support of a dyadic head interval at a signed test coordinate. -/
def supportQ (z : ℚ) (I : Ival) : ℚ :=
  max (z * ((I.lo : ℚ) / D)) (z * ((I.hi : ℚ) / D))

private theorem le_support {x : ℝ} {I : Ival} (z : ℚ) (hx : mem x I) :
    (z:ℝ) * x ≤ (supportQ z I : ℝ) := by
  have hD : 0 < (D : ℝ) := by norm_num [HaagerupKernel.D, K]
  have hlo : (I.lo : ℝ) / D ≤ x := (div_le_iff₀ hD).2 hx.1
  have hhi : x ≤ (I.hi : ℝ) / D := (le_div_iff₀ hD).2 hx.2
  simp only [supportQ, Rat.cast_max, Rat.cast_mul, Rat.cast_div, Rat.cast_intCast]
  rcases le_total 0 (z : ℝ) with hz | hz
  · exact (mul_le_mul_of_nonneg_left hhi hz).trans (le_max_right _ _)
  · exact (mul_le_mul_of_nonpos_left hlo hz).trans (le_max_left _ _)

/-- The evaluator accepts a rational ceiling common to all six columns. -/
def columnDual (head : List Ival) (e : ℚ) : ℚ :=
  supportQ 1 (head.getD 0 zeroI) - e +
    ∑ j : Fin 320, supportQ (dualCoord j) (head.getD (j.val + 1) zeroI)

/-- The dual certificate also handles arbitrary independent choices of coefficients within
their enclosures. Zero padding implements the established finite-head and paid-tail score. -/
theorem six_score_le_dual {head : Fin 6 → List Ival} {cap : Fin 6 → ℚ} {B : ℚ}
    (hB : ∀ i, columnDual (head i) (cap i) ≤ B) {h : Fin 6 → ℕ → ℝ}
    (hm : ∀ i n, n ≤ 320 → mem (h i n) ((head i).getD n zeroI))
    (w : Fin 6 → ℝ) (hw : ∀ i, 0 ≤ w i) (hs : ∑ i, w i = 1) :
    (∑ i, w i * h i 0) - (∑ j : Fin 320, |∑ i, w i * h i (j.val+1)|) -
      (∑ i, w i * (cap i : ℝ)) ≤ (B : ℝ) := by
  apply mixture_score_le_dual w (fun i => h i 0) (fun i => (cap i : ℝ))
    (fun i (j : Fin 320) => h i (j.val+1)) (fun j => (dualCoord j : ℝ)) hw hs
  · intro j; exact_mod_cast dual_coords_feasible j
  · intro i
    have h0 := le_support (1 : ℚ) (hm i 0 (by decide))
    simp only [Rat.cast_one, one_mul] at h0
    have hq : (columnDual (head i) (cap i) : ℝ) ≤ (B : ℝ) := by exact_mod_cast hB i
    apply le_trans _ hq
    simp only [columnDual, Rat.cast_add, Rat.cast_sub, Rat.cast_sum]
    exact add_le_add (sub_le_sub_right h0 _) (sum_le_sum fun j _ => le_support _ (hm i _ (Nat.succ_le_of_lt j.isLt)))

def sixScoreCeiling : ℚ := 7119685648573 / 10^13

set_option maxRecDepth 10000 in
/-- Check the support bound and nonempty coefficient intervals for each of the six real heads. -/
theorem sixDual_check : ∀ i : Fin 6, let L := headIntervals i
    columnDual L (phaseTailCap i) ≤ sixScoreCeiling ∧
      ∀ j : Fin 321, (L.getD j.val zeroI).lo ≤ (L.getD j.val zeroI).hi := by native_decide

/-- The intervals over which the six-column score is bounded admit a simultaneous assignment. -/
theorem exists_paid_six_values :
    ∃ h : Fin 6 → ℕ → ℝ, ∀ i n, n ≤ 320 → mem (h i n) ((headIntervals i).getD n zeroI) := by
  refine ⟨fun i n => (((headIntervals i).getD n zeroI).lo : ℝ) / D, ?_⟩
  intro i n hn
  have hv := (sixDual_check i).2 ⟨n, Nat.lt_succ_of_le hn⟩
  simp only [mem, div_mul_cancel₀ _ (by norm_num [HaagerupKernel.D, K] : (D : ℝ) ≠ 0),
    le_refl, true_and]
  exact_mod_cast hv

/-- The numerical common dual bounds the finite paid score for all real convex weights. -/
theorem paid_six_score_le (w : Fin 6 → ℝ) (hw : ∀ i, 0 ≤ w i) (hw1 : ∑ i, w i = 1)
    (h : Fin 6 → ℕ → ℝ)
    (hm : ∀ i n, n ≤ 320 → mem (h i n) ((headIntervals i).getD n zeroI)) :
    (∑ i, w i * h i 0) - (∑ j : Fin 320, |∑ i, w i * h i (j.val+1)|) -
      (∑ i, w i * (phaseTailCap i : ℝ)) ≤ (sixScoreCeiling : ℝ) :=
  six_score_le_dual (fun i => (sixDual_check i).1) hm w hw hw1

/-- With the same six preprocessors, head cutoffs and paid tail caps, no choice of
convex weights attains the transfer slope of the new seven-column witness. -/
theorem paid_six_score_lt_seven (w : Fin 6 → ℝ) (hw : ∀ i, 0 ≤ w i) (hw1 : ∑ i, w i = 1)
    (h : Fin 6 → ℕ → ℝ)
    (hm : ∀ i n, n ≤ 320 → mem (h i n) ((headIntervals i).getD n zeroI)) :
    (∑ i, w i * h i 0) - (∑ j : Fin 320, |∑ i, w i * h i (j.val+1)|) -
      (∑ i, w i * (phaseTailCap i : ℝ)) < 711968565817136711740669035/10^27 := by
  exact (paid_six_score_le w hw hw1 h hm).trans_lt (by norm_num [sixScoreCeiling])

end Haagerup.SixChannelExact
