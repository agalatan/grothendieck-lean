import GrotheSign.OrderedFlow
import GrotheSign.CoefficientSplit
import GrotheSign.BinomialCoefficients
import GrotheSign.FlowReindex

/-!
# The ordered labeled sum is the inverse-flow convolution

Finite binomial expansions, weighted coefficient splitting, and grouping subsets by their
cardinality connect the labeled coefficients to the actual power-series convolution. The empty
block is retained, so the identity holds for arbitrary generators, including a nonzero value at
zero, and for every coefficient degree.

Agent-ID: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open Finset PowerSeries

/-- The finite inverse-flow convolution obtained from the two Lagrange coefficient formulas. -/
noncomputable def inverseFlowConvolution (k : ℕ) (L : ℕ → ℝ) (P : PowerSeries ℝ) : ℝ :=
  -((k : ℝ) + 1) * ∑ i ∈ range (k + 1),
    L i / ((2 * (i : ℝ) + 1) * ((i : ℝ) + 1)) *
      coeff i ((1 - P)⁻¹ ^ (2 * i + 1)) *
      coeff (k - i) ((1 - P) ^ (2 * i + 2))

private noncomputable def flowExpansionFactor (L : ℕ → ℝ) (q r i : ℕ) : ℝ :=
  L i / ((2 * (i : ℝ) + 1) * ((i : ℝ) + 1)) *
    (ascPochhammer ℝ q).eval (2 * (i : ℝ) + 1) * (-1 : ℝ) ^ r *
    (descPochhammer ℝ r).eval (2 * (i : ℝ) + 2)

private noncomputable def flowExpansionTerm (k : ℕ) (L : ℕ → ℝ)
    (P : PowerSeries ℝ) (q r i : ℕ) : ℝ :=
  flowExpansionFactor L q r i / ((q.factorial : ℝ) * r.factorial) *
    coeff i (P ^ q) * coeff (k - i) (P ^ r)

private theorem flowExpansion_labeled_sum {ι : Type*} [DecidableEq ι]
    (t : Finset ι) (k : ℕ) (L : ℕ → ℝ) (P : PowerSeries ℝ) :
    (∑ j ∈ finsuppAntidiag t k,
      labeledFlowCoefficient t j L * ∏ a ∈ t, coeff (j a) P) =
      -((k : ℝ) + 1) * ∑ u ∈ t.powerset, ∑ i ∈ range (k + 1),
        flowExpansionFactor L u.card (t.card - u.card) i *
          coeff i (P ^ u.card) * coeff (k - i) (P ^ (t.card - u.card)) := by
  calc
    _ = -((k : ℝ) + 1) * ∑ j ∈ finsuppAntidiag t k, ∑ u ∈ t.powerset,
        flowExpansionFactor L u.card (t.card - u.card) (labelSum j u) *
          ∏ a ∈ t, coeff (j a) P := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      have hs : labelSum j t = k := (Finset.mem_finsuppAntidiag.mp hj).1
      simp only [labeledFlowCoefficient, hs, flowExpansionFactor, Finset.sum_mul, mul_assoc]
    _ = -((k : ℝ) + 1) * ∑ u ∈ t.powerset, ∑ j ∈ finsuppAntidiag t k,
        flowExpansionFactor L u.card (t.card - u.card) (labelSum j u) *
          ∏ a ∈ t, coeff (j a) P := by rw [Finset.sum_comm]
    _ = _ := by
      congr 1
      apply Finset.sum_congr rfl
      intro u hu
      exact coefficient_weighted_split t u (Finset.mem_powerset.mp hu) P
        (flowExpansionFactor L u.card (t.card - u.card)) k

private theorem flowExpansion_subsets_by_card {ι : Type*} (t : Finset ι) (B : ℕ → ℝ) :
    (∑ u ∈ t.powerset, B u.card) =
      ∑ q ∈ range (t.card + 1), (t.card.choose q : ℝ) * B q := by
  rw [Finset.sum_powerset]
  apply Finset.sum_congr rfl
  intro q _
  simpa only [nsmul_eq_mul] using Finset.sum_powersetCard q t B

set_option maxHeartbeats 800000 in
private theorem orderedFlowTerm_eq_expansion (k m : ℕ) (L : ℕ → ℝ)
    (P : PowerSeries ℝ) :
    orderedFlowTerm k m L P =
      -((k : ℝ) + 1) * ∑ q ∈ range (m + 1), ∑ i ∈ range (k + 1),
        flowExpansionTerm k L P q (m - q) i := by
  rw [orderedFlowTerm, flowExpansion_labeled_sum]
  simp only [Finset.card_range]
  rw [flowExpansion_subsets_by_card (range m) (fun q ↦ ∑ i ∈ range (k + 1),
    flowExpansionFactor L q (m - q) i *
      coeff i (P ^ q) * coeff (k - i) (P ^ (m - q)))]
  simp only [Finset.card_range]
  calc
    _ = -((k : ℝ) + 1) * ∑ q ∈ range (m + 1), ∑ i ∈ range (k + 1),
        ((m.choose q : ℝ) / m.factorial) *
          (flowExpansionFactor L q (m - q) i *
            coeff i (P ^ q) * coeff (k - i) (P ^ (m - q))) := by
      simp only [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro q _
      apply Finset.sum_congr rfl
      intro i _
      ring
    _ = _ := by
      congr 1
      apply Finset.sum_congr rfl
      intro q hq
      have hqm : q ≤ m := by simpa only [Finset.mem_range, Nat.lt_succ_iff] using hq
      rw [choose_div_factorial m q hqm]
      apply Finset.sum_congr rfl
      intro i _
      unfold flowExpansionTerm
      ring

set_option maxHeartbeats 800000 in
private theorem inverseFlowConvolution_eq_rectangle (k : ℕ) (L : ℕ → ℝ)
    (P : PowerSeries ℝ) (hP : constantCoeff P = 0) :
    inverseFlowConvolution k L P =
      -((k : ℝ) + 1) * ∑ i ∈ range (k + 1), ∑ q ∈ range (k + 1),
        ∑ r ∈ range (k + 1), flowExpansionTerm k L P q r i := by
  unfold inverseFlowConvolution
  congr 1
  apply Finset.sum_congr rfl
  intro i hi
  have hik : i ≤ k := by simpa only [Finset.mem_range, Nat.lt_succ_iff] using hi
  rw [coeff_one_sub_inv_pow P hP, coeff_one_sub_pow P hP]
  rw [sum_coeff_pow_extend P hP _ i k hik,
    sum_coeff_pow_extend P hP _ (k - i) k (Nat.sub_le k i)]
  simp only [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat, Nat.cast_one]
  rw [mul_assoc, Finset.sum_mul_sum]
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  apply Finset.sum_congr rfl
  intro r _
  unfold flowExpansionTerm flowExpansionFactor
  ring

set_option maxHeartbeats 1000000 in
/-- The finite ordered-label expression equals the inverse-flow convolution at every degree.
The generator may have a nonzero value at zero; no sign assumption is used in this identity. -/
theorem inverseFlowConvolution_eq_orderedFlow (k : ℕ) (L : ℕ → ℝ)
    (P : PowerSeries ℝ) (hP : constantCoeff P = 0) :
    inverseFlowConvolution k L P = orderedFlow k L P := by
  calc
    _ = -((k : ℝ) + 1) * ∑ i ∈ range (k + 1), ∑ q ∈ range (k + 1),
        ∑ r ∈ range (k + 1), flowExpansionTerm k L P q r i :=
      inverseFlowConvolution_eq_rectangle k L P hP
    _ = -((k : ℝ) + 1) * ∑ i ∈ range (k + 1), ∑ m ∈ range (k + 1),
        ∑ q ∈ range (m + 1), flowExpansionTerm k L P q (m - q) i := by
      congr 1
      apply Finset.sum_congr rfl
      intro i hi
      apply sum_rectangle_eq_triangle
      intro q r hqr
      have hik : i ≤ k := by simpa only [Finset.mem_range, Nat.lt_succ_iff] using hi
      have hz := coeff_pow_mul_coeff_pow_eq_zero P hP k i q r hik hqr
      unfold flowExpansionTerm
      rw [mul_assoc, hz, mul_zero]
    _ = -((k : ℝ) + 1) * ∑ m ∈ range (k + 1), ∑ q ∈ range (m + 1),
        ∑ i ∈ range (k + 1), flowExpansionTerm k L P q (m - q) i := by
      rw [Finset.sum_comm]
      congr 1
      apply Finset.sum_congr rfl
      intro m _
      rw [Finset.sum_comm]
    _ = orderedFlow k L P := by
      rw [Finset.mul_sum, orderedFlow]
      apply Finset.sum_congr rfl
      intro m _
      exact (orderedFlowTerm_eq_expansion k m L P).symm

end GrotheSign
