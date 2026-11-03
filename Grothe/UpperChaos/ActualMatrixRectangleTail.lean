import Grothe.UpperChaos.ActualMatrixBandTail
import Mathlib.Tactic.FinCases

/-!
# Actual matrix tails outside the original input rectangle

Agent-ID: codex-2ca4. Complete WIP proof bodies; compilation is pending.

The input rectangle is exactly (500, 500, 251, 250), with inclusive coordinate
inequalities. Its complement is covered by the four corresponding coordinate
exclusions. A checked quartet records the actual gate in each coordinate and
its power, output degree and cutoff; coverage is proved from these definitions.
The union estimate retains the actual matrix entries and all four exact source
norm bounds. Numerical gate selection and operator-norm conversion are separate.
-/

namespace Grothe.UpperChaos.ActualMatrixRectangleTail

open ActualMatrixCutoffTail ActualMatrixBandTail ActualTaylorFiniteCoefficients
open ActualSourceNormEvaluation OriginalHSParameterGates

noncomputable section

/-- The original retained input rectangle, with each endpoint included. -/
def inputRectangle (n : Idx2) : Prop :=
  n.1.1 ≤ 500 ∧ n.1.2 ≤ 500 ∧ n.2.1 ≤ 251 ∧ n.2.2 ≤ 250

/-- The cutoff of coordinate i in the same order as coordinateExponent. -/
def rectangleCutoff (i : Fin 4) : ℕ :=
  if i.val < 2 then 500 else if i.val = 2 then 251 else 250

theorem inputRectangle_iff (n : Idx2) :
    inputRectangle n ↔
      ∀ i : Fin 4, coordinateExponent n i.val ≤ rectangleCutoff i := by
  constructor
  · intro hn i
    fin_cases i
    · simpa [rectangleCutoff, coordinateExponent] using hn.1
    · simpa [rectangleCutoff, coordinateExponent] using hn.2.1
    · simpa [rectangleCutoff, coordinateExponent] using hn.2.2.1
    · simpa [rectangleCutoff, coordinateExponent] using hn.2.2.2
  · intro hn
    exact ⟨by simpa [rectangleCutoff, coordinateExponent] using hn 0,
      by simpa [rectangleCutoff, coordinateExponent] using hn 1,
      by simpa [rectangleCutoff, coordinateExponent] using hn 2,
      by simpa [rectangleCutoff, coordinateExponent] using hn 3⟩

/-- Every input outside the rectangle violates one of the four actual cutoffs. -/
theorem not_inputRectangle_iff (n : Idx2) :
    ¬ inputRectangle n ↔
      ∃ i : Fin 4, rectangleCutoff i < coordinateExponent n i.val := by
  classical
  rw [inputRectangle_iff]
  simp only [not_forall, not_le]

/-- Four actual checked gates, with all index metadata explicit. -/
structure GateQuartet (power degree : ℕ) where
  gate : Fin 4 → Gate
  checked : ∀ i, gateOK (gate i) = true
  power_eq : ∀ i, (gate i).power = power
  degree_eq : ∀ i, (gate i).degree = degree
  coordinate_eq : ∀ i, (gate i).coordinate = i.val
  cutoff_eq : ∀ i, (gate i).cutoff = rectangleCutoff i

/-- The actual matrix energy outside the input rectangle and below output degree D. -/
def rectangleExcludedEnergyTerm (power degree : ℕ) (mn : Idx2 × Idx2) : ℝ := by
  classical
  exact if outputDegree mn.1 ≤ degree ∧ ¬ inputRectangle mn.2 then
    ‖matrixEntry power mn.1 mn.2‖ ^ 2 else 0

theorem rectangleExcludedEnergyTerm_nonneg (power degree : ℕ) (mn : Idx2 × Idx2) :
    0 ≤ rectangleExcludedEnergyTerm power degree mn := by
  classical
  unfold rectangleExcludedEnergyTerm
  split
  · exact sq_nonneg _
  · exact le_rfl

variable {power degree : ℕ}

/-- Pointwise finite union bound; overlapping exclusions may be counted more than once. -/
theorem rectangleExcludedEnergyTerm_le_sum (G : GateQuartet power degree)
    (mn : Idx2 × Idx2) :
    rectangleExcludedEnergyTerm power degree mn ≤
      ∑ i : Fin 4, excludedEnergyTerm (G.gate i) mn := by
  classical
  by_cases h : outputDegree mn.1 ≤ degree ∧ ¬ inputRectangle mn.2
  · obtain ⟨i, hi⟩ := (not_inputRectangle_iff mn.2).1 h.2
    have hm : outputDegree mn.1 ≤ (G.gate i).degree := by
      simpa only [G.degree_eq i] using h.1
    have hn : (G.gate i).cutoff < coordinateExponent mn.2 (G.gate i).coordinate := by
      simpa only [G.cutoff_eq i, G.coordinate_eq i] using hi
    have he : rectangleExcludedEnergyTerm power degree mn =
        excludedEnergyTerm (G.gate i) mn := by
      simp only [rectangleExcludedEnergyTerm, ite_eq_left h, excludedEnergyTerm,
        ite_eq_left (And.intro hm hn), G.power_eq i]
    rw [he]
    exact Finset.single_le_sum (fun j _ => excludedEnergyTerm_nonneg (G.gate j) mn)
      (Finset.mem_univ i)
  · rw [rectangleExcludedEnergyTerm, ite_eq_right h]
    exact Finset.sum_nonneg fun i _ => excludedEnergyTerm_nonneg (G.gate i) mn

/-- Every finite rectangle-complement block is bounded by four exact source norms. -/
theorem finite_rectangleExcludedEnergy_le (G : GateQuartet power degree)
    (s : Finset (Idx2 × Idx2)) :
    (∑ mn ∈ s, rectangleExcludedEnergyTerm power degree mn) ≤
      ∑ i : Fin 4, (sourceNormValue (G.gate i)).re / cutoffWeight (G.gate i) := by
  classical
  calc
    _ ≤ ∑ mn ∈ s, ∑ i : Fin 4, excludedEnergyTerm (G.gate i) mn :=
      Finset.sum_le_sum fun mn _ => rectangleExcludedEnergyTerm_le_sum G mn
    _ = ∑ i : Fin 4, ∑ mn ∈ s, excludedEnergyTerm (G.gate i) mn :=
      Finset.sum_comm
    _ ≤ _ := Finset.sum_le_sum fun i _ =>
      finite_excludedEnergy_le (G.gate i) (G.checked i) s

/-- Genuine summability follows from nonnegativity and the finite union bound. -/
theorem summable_rectangleExcludedEnergyTerm (G : GateQuartet power degree) :
    Summable (rectangleExcludedEnergyTerm power degree) := by
  exact summable_of_sum_le (rectangleExcludedEnergyTerm_nonneg power degree)
    (finite_rectangleExcludedEnergy_le G)

/-- The full rectangle-complement energy has the same four-coordinate bound. -/
theorem tsum_rectangleExcludedEnergy_le (G : GateQuartet power degree) :
    (∑' mn : Idx2 × Idx2, rectangleExcludedEnergyTerm power degree mn) ≤
      ∑ i : Fin 4, (sourceNormValue (G.gate i)).re / cutoffWeight (G.gate i) := by
  exact Real.tsum_le_of_sum_le (rectangleExcludedEnergyTerm_nonneg power degree)
    (finite_rectangleExcludedEnergy_le G)

/-- The same true rectangle complement, with the existing comparison-band restriction. -/
def bandRectangleExcludedEnergyTerm (power : ℕ) (b : GrotheKernel.ComparisonBand)
    (mn : Idx2 × Idx2) : ℝ := by
  classical
  exact if mn.1 ∈ bandModes b ∧ ¬ inputRectangle mn.2 then
    ‖matrixEntry power mn.1 mn.2‖ ^ 2 else 0

theorem bandRectangleExcludedEnergyTerm_nonneg (power : ℕ)
    (b : GrotheKernel.ComparisonBand) (mn : Idx2 × Idx2) :
    0 ≤ bandRectangleExcludedEnergyTerm power b mn := by
  classical
  unfold bandRectangleExcludedEnergyTerm
  split
  · exact sq_nonneg _
  · exact le_rfl

theorem bandRectangleExcludedEnergyTerm_le (power degree : ℕ)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ degree)
    (mn : Idx2 × Idx2) :
    bandRectangleExcludedEnergyTerm power b mn ≤
      rectangleExcludedEnergyTerm power degree mn := by
  classical
  by_cases h : mn.1 ∈ bandModes b ∧ ¬ inputRectangle mn.2
  · have hm : outputDegree mn.1 ≤ degree :=
      (outputDegree_le_of_mem_bandModes b hhi mn.1 h.1).trans hD
    simp only [bandRectangleExcludedEnergyTerm, ite_eq_left h, rectangleExcludedEnergyTerm,
      ite_eq_left (And.intro hm h.2)]
    exact le_rfl
  · simpa only [bandRectangleExcludedEnergyTerm, ite_eq_right h] using
      rectangleExcludedEnergyTerm_nonneg power degree mn

theorem finite_bandRectangleExcludedEnergy_le (G : GateQuartet power degree)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ degree)
    (s : Finset (Idx2 × Idx2)) :
    (∑ mn ∈ s, bandRectangleExcludedEnergyTerm power b mn) ≤
      ∑ i : Fin 4, (sourceNormValue (G.gate i)).re / cutoffWeight (G.gate i) := by
  exact (Finset.sum_le_sum fun mn _ =>
    bandRectangleExcludedEnergyTerm_le power degree b hhi hD mn).trans
      (finite_rectangleExcludedEnergy_le G s)

theorem summable_bandRectangleExcludedEnergyTerm (G : GateQuartet power degree)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ degree) :
    Summable (bandRectangleExcludedEnergyTerm power b) := by
  exact summable_of_sum_le (bandRectangleExcludedEnergyTerm_nonneg power b)
    (finite_bandRectangleExcludedEnergy_le G b hhi hD)

theorem tsum_bandRectangleExcludedEnergy_le (G : GateQuartet power degree)
    (b : GrotheKernel.ComparisonBand) (hhi : b.hi ≠ 0) (hD : b.hi ≤ degree) :
    (∑' mn : Idx2 × Idx2, bandRectangleExcludedEnergyTerm power b mn) ≤
      ∑ i : Fin 4, (sourceNormValue (G.gate i)).re / cutoffWeight (G.gate i) := by
  exact Real.tsum_le_of_sum_le (bandRectangleExcludedEnergyTerm_nonneg power b)
    (finite_bandRectangleExcludedEnergy_le G b hhi hD)

end
end Grothe.UpperChaos.ActualMatrixRectangleTail
