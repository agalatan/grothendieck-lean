import Grothe.UpperReplacement.GradeRegrouping
import Grothe.UpperReplacement.HeadCompute

set_option warningAsError true

/-!
# Polynomial composition of complete signed grades

Agent-ID: codex-a7c4. This identifies the finite same-preprocessor head with the actual
cross-energy kernel, and proves interval Horner evaluation for coefficients of either sign.
-/

namespace Grothe.UpperReplacement

open Finset Polynomial MeasureTheory Upper UpperChaos GrotheKernel

noncomputable section

def gradeEnergy (F G : Lp ℂ 2 mu2) (j : ℕ) : ℝ :=
  ∑ i ∈ cellModeHead j, if i.1.2 + i.2.2 = j then crossCoefficient F G i else 0

theorem gradeEnergy_eq_head {F G : Lp ℂ 2 mu2} {j K : ℕ} (hj : j ≤ K) :
    gradeEnergy F G j =
      ∑ i ∈ cellModeHead K, if i.1.2 + i.2.2 = j then crossCoefficient F G i else 0 := by
  apply sum_subset
  · intro i hi
    rw [mem_cellModeHead_iff] at hi ⊢
    exact ⟨hi.1.trans hj, hi.2⟩
  · intro i hi hnot
    rw [mem_cellModeHead_iff] at hi hnot
    exact ite_eq_right (by omega)

def gradePolynomial (K : ℕ) (P : ℝ[X]) (g : ℕ → ℝ) : ℝ[X] :=
  ∑ j ∈ range (K + 1), C (g j) * (X ^ j * P ^ (2 * j + 1))

theorem gradePolynomial_coeff {F G : Lp ℂ 2 mu2} (hF : ChargeOne F)
    {P : ℝ[X]} (hP : Grothe.l1 P ≤ 1) {n K : ℕ} (hn : n ≤ K) :
    (gradePolynomial K P (gradeEnergy F G)).coeff n =
      bivarKernel P P (pairEnergy F G) n := by
  calc (gradePolynomial K P (gradeEnergy F G)).coeff n
      = ∑ j ∈ range (K + 1), gradeEnergy F G j * (X ^ j * P ^ (2 * j + 1)).coeff n := by
        simp only [gradePolynomial, finsetSum_coeff, coeff_C_mul]
    _ = ∑ j ∈ range (K + 1),
        (∑ i ∈ cellModeHead K, if i.1.2 + i.2.2 = j then crossCoefficient F G i else 0) *
          (X ^ j * P ^ (2 * j + 1)).coeff n := by
        apply sum_congr rfl
        intro j hj
        rw [gradeEnergy_eq_head (by simpa only [mem_range, Nat.lt_succ_iff] using hj)]
    _ = ∑ i ∈ cellModeHead K,
        crossCoefficient F G i *
          (X ^ (i.1.2 + i.2.2) * P ^ (2 * (i.1.2 + i.2.2) + 1)).coeff n := by
        simp_rw [Finset.sum_mul]
        rw [sum_comm]
        apply sum_congr rfl
        intro i hi
        have hg := (mem_cellModeHead_iff.mp hi).1
        rw [sum_eq_single_of_mem (i.1.2 + i.2.2) (mem_range.mpr (by omega))]
        · simp
        · intro j _ hj
          simp [Ne.symm hj]
    _ = bivarKernel P P (pairEnergy F G) n := by
        rw [bivarKernel_pair_eq_finite_head hF hP hP hn]
        apply sum_congr rfl
        intro i hi
        rw [termOf_same_of_charge P i (mem_cellModeHead_iff.mp hi).2]

namespace HeadCompute

def hornerPolynomial (Y : ℝ[X]) : List ℝ → ℝ[X]
  | [] => 0
  | c :: rest => C c + Y * hornerPolynomial Y rest

theorem hornerPolynomial_range (Y : ℝ[X]) (N : ℕ) (g : ℕ → ℝ) :
    hornerPolynomial Y ((List.range N).map g) = ∑ k ∈ range N, C (g k) * Y ^ k := by
  induction N generalizing g with
  | zero => simp [hornerPolynomial]
  | succ N ih =>
    rw [List.range_succ_eq_map, List.map_cons, List.map_map, hornerPolynomial,
      ih, sum_range_succ']
    simp only [Function.comp_apply, pow_zero, mul_one]
    rw [add_comm (∑ k ∈ range N, C (g (k + 1)) * Y ^ (k + 1))]
    congr 1
    rw [Finset.mul_sum]
    apply sum_congr rfl
    intro k _
    rw [pow_succ]
    ring

theorem composePolynomial_eq (P : ℝ[X]) (K : ℕ) (g : ℕ → ℝ) :
    P * hornerPolynomial (X * P ^ 2) ((List.range (K + 1)).map g) =
      gradePolynomial K P g := by
  rw [hornerPolynomial_range, Finset.mul_sum, gradePolynomial]
  apply sum_congr rfl
  intro k _
  rw [mul_pow, ← pow_mul, pow_add, pow_one]
  ring

theorem memB_horner {M : ℕ} {Y : ℝ[X]} {YI : List Ival} (hY : memB M Y YI)
    {cs : List ℝ} {intervals : List Ival} (hc : List.Forall₂ mem cs intervals) :
    memB M (hornerPolynomial Y cs) (horner M YI intervals) := by
  induction hc with
  | nil => simpa [hornerPolynomial, horner] using memB_zero M
  | cons hc _ ih =>
    exact memB_take (memB_add (memB_single hc) (memB_conv hY ih))

theorem memB_compose {M : ℕ} (pl : List ℚ) {cs : List ℝ} {intervals : List Ival}
    (hc : List.Forall₂ mem cs intervals) :
    memB M (ofListQ pl * hornerPolynomial (X * ofListQ pl ^ 2) cs)
      (compose M pl intervals) := by
  have hP := memB_ofListQ pl M
  have hY : memB M (X * ofListQ pl ^ 2) (zeroI :: convI (pl.map ofRatI) (pl.map ofRatI)) := by
    simpa only [shiftX, List.replicate_succ, List.replicate_zero, List.cons_append,
      List.nil_append, pow_one, pow_two] using
      (memB_shiftX (K := M) (k := 1) (memB_mono (memB_conv hP hP) (Nat.sub_le M 1)))
  exact memB_take (memB_conv hP (memB_horner hY hc))

end HeadCompute

end

end Grothe.UpperReplacement
