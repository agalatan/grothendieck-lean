import Grothe.UpperSelector.Column
import Grothe.UpperSelector.Grades

/-! # Certified dyadic head of the realized angular selector -/

set_option warningAsError true

namespace Haagerup.AngularSelector.Certificate

/-- Compute a signed physical selector column. All cutoffs are exclusive, including the
number of grades `K` and the retained head length `H`. -/
def selectorColumn (F K J M H : ℕ) : Column :=
  buildColumn (grades F K J M) K (J + M) H

@[simp] theorem selectorColumn_head_size (F K J M H : ℕ) :
    (selectorColumn F K J M H).head.size = H := by
  simp [selectorColumn, buildColumn]

/-- A full Wiener error estimate for the physically realized selector at angle 17/100 with
preprocessor 23/25 − (2/25)X. Every coefficient and its error budget are computed in Lean. -/
theorem selectorColumn_sound {F K J M H : ℕ} (hF : F ≤ 220) (hJ : J ≤ 1600) :
    let c := selectorColumn F K J M H
    WienerBound (fun n => selectorCoeff linearPreprocessor (17/100) n - (c.head.getD n 0 : ℝ)/2^89)
      ((c.allowance : ℝ)/2^89) :=
  buildColumn_sound (grades F K J M) K (J+M) H haagCoeff
    (preprocessedRow linearPreprocessor (17/100)) phaseMass_summable phaseMass_le_one phaseMass_nonneg
    (preprocessedRow_wiener linearPreprocessor linearPreprocessor_l1.le _)
    (fun _ hk => (grades_row_size hk).le)
    (fun _ hk => (grades_sound hk hF hJ).1) (fun _ hk => (grades_sound hk hF hJ).2)

/-- The seven-channel checkpoint uses 1201 scalar grades, 60 folded frequencies, 300
radial powers and 257 preprocessor powers. Its signed interval head has 251 entries. -/
def production : Column := selectorColumn 60 1201 300 257 251

@[simp] theorem production_head_size : production.head.size = 251 :=
  selectorColumn_head_size _ _ _ _ _

theorem production_sound :
    WienerBound (fun n => selectorCoeff linearPreprocessor (17/100) n - (production.head.getD n 0 : ℝ)/2^89)
      ((production.allowance : ℝ)/2^89) :=
  selectorColumn_sound (by decide : 60 ≤ 220) (by decide : 300 ≤ 1600)

end Haagerup.AngularSelector.Certificate
