import Grothe.UpperReplacement.TableSupport
import Grothe.Upper.ThreeBandBudget
import Grothe.UpperTightBudget
import Grothe.UpperChaos.Structural
import Grothe.UpperChaos.PhiBound

/-! Generic GT channel interface, before the closed comparison. Agent-ID: codex-a7c4.
The finite head comparison remains an explicit premise here. Keeping it separate lets the
mixture and contour proofs build independently of the large production source certificates. -/

set_option warningAsError true

namespace Grothe.UpperReplacement.GTComparison

open MeasureTheory Finset Polynomial Grothe.Upper Grothe.UpperChaos GrotheKernel

/-- Unweighted mass ceilings (`⌈10¹² √(mass_j + energyErrQ)⌉ / 10¹²`) for the seven bands. -/
def univThreeBandMassQ : Fin 7 → ℚ
  | 0 => 999411428628 / 10 ^ 12
  | 1 => 995201080567 / 10 ^ 12
  | 2 => 91640672869 / 10 ^ 12
  | 3 => 995201080567 / 10 ^ 12
  | 4 => 91640672869 / 10 ^ 12
  | 5 => 979402692536 / 10 ^ 12
  | _ => 198981329621 / 10 ^ 12

theorem univThreeBandMassQ_nonneg (j : Fin 7) : 0 ≤ univThreeBandMassQ j := by
  have h : ∀ j : Fin 7, 0 ≤ univThreeBandMassQ j := by decide +kernel
  exact h j

noncomputable section

/-- Unweighted three-band comparison budget valid for any `(P, Q)` with `‖P‖_𝒜, ‖Q‖_𝒜 ≤ 1`. -/
def univGTCompareQ : ℚ :=
  2 * ∑ j : Fin 7, univThreeBandMassQ j * tightThreeBandErrorQ j + tightThreeBandQuadraticQ

/-- Combined unweighted `GT` head comparison + finite energy-table allowance. -/
def univGTHeadErrQ : ℚ := univGTCompareQ + energyErrQ

/-- Energies of the production two-coordinate rounding `G_T`. -/
def actualEG : ℕ × ℕ → ℝ := energy ((memLp_GT phiBound).toLp GT)

/-- Structural and head-approximation bundle for any admissible `GT` channel `(P, Q)`. -/
theorem gt_channel_props {P Q : ℝ[X]}
    (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) (hQ0 : Q.coeff 0 = 0)
    (herr_tab : ∑ p ∈ headIdx 501, |actualEG p - (energyTable p : ℝ)| ≤ (univGTHeadErrQ : ℝ)) :
    DominatedKernel (radialKernel (bivarKernel P Q actualEG)) ∧
      (Summable fun n => |bivarKernel P Q actualEG n|) ∧
      ∑ n ∈ range 251, |bivarKernel P Q actualEG n - (tabPoly P Q energyRows).coeff n| ≤
        (univGTHeadErrQ : ℝ) := by
  have hdom : DominatedKernel (radialKernel (bivarKernel P Q actualEG)) :=
    (rounding_diskKernel measurable_GT (norm_GT_le phiBound)
      (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound) hP hQ).dominated
  have hsum : Summable fun n => |bivarKernel P Q actualEG n| :=
    summable_abs_bivarKernel P Q hP hQ actualEG (summable_abs_energy _)
  have hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → actualEG p = 0 :=
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc => GT_rot2 hc u)
  have hpert := head_perturbation_weighted P Q (headIdx 501) actualEG
    (fun p => (energyTable p : ℝ)) 251 (fun _ => 1)
    (fun p _ => (Grothe.sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le_one hP hQ p))
  have hhead : ∑ n ∈ range 251, |bivarKernel P Q actualEG n - (tabPoly P Q energyRows).coeff n| ≤
      (univGTHeadErrQ : ℝ) := by
    calc ∑ n ∈ range 251, |bivarKernel P Q actualEG n - (tabPoly P Q energyRows).coeff n|
        = ∑ n ∈ range 251, |∑ p ∈ headIdx 501, actualEG p * (termOf P Q p).coeff n -
            ∑ p ∈ headIdx 501, (energyTable p : ℝ) * (termOf P Q p).coeff n| := by
          refine sum_congr rfl fun n hn => ?_
          rw [bivarKernel_eq_head P Q hQ0 actualEG hpar (N := 501)
            (by have := mem_range.1 hn; omega),
            tabPoly_coeff P Q table_within n]
          rfl
      _ ≤ ∑ p ∈ headIdx 501, (1 : ℝ) * |actualEG p - (energyTable p : ℝ)| := hpert
      _ = ∑ p ∈ headIdx 501, |actualEG p - (energyTable p : ℝ)| :=
          sum_congr rfl fun p _ => one_mul _
      _ ≤ (univGTHeadErrQ : ℝ) := herr_tab
  exact ⟨hdom, hsum, hhead⟩

end

end Grothe.UpperReplacement.GTComparison
