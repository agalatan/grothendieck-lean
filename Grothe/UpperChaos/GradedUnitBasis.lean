import Grothe.UpperChaos.GradedHermiteFn
import Grothe.UpperChaos.TaylorInnerLaplace
import Grothe.UpperChaos.HermiteConjugation

/-! A unit graded coefficient is the corresponding normalized Hermite mode.
Its Taylor source uses the conjugated coordinate indices.
Agent-ID: codex-cf82. -/
open scoped ComplexConjugate
namespace Grothe.UpperChaos
noncomputable section

def gradedUnitCoeff {N : ℕ} (i : GradedIdx N) (q c d : ℕ) : ℚ :=
  if q = i.1.val ∧ c = i.2.1.val ∧ d = i.2.2.val then 1 else 0

/-- A graded unit coefficient denotes the normalized tensor basis mode. -/
theorem gradedHermiteFn_unit {N : ℕ} (i : GradedIdx N) :
    gradedHermiteFn N (gradedUnitCoeff i) = hfun2 (gradedIdx i) := by
  have coords (v : GradedIdx N) :
      (v.1.val = i.1.val ∧ v.2.1.val = i.2.1.val ∧ v.2.2.val = i.2.2.val) ↔ v = i := by
    constructor
    · rintro ⟨hq, hc, hd⟩
      apply gradedIdx_injective N
      simp only [gradedIdx, gradedMode]
      simp only [hq, hc, hd]
    · rintro rfl
      exact ⟨rfl, rfl, rfl⟩
  have coeff (v : GradedIdx N) :
      gradedHermiteCoeff (gradedUnitCoeff i) (gradedIdx v) = if v = i then 1 else 0 := by
    rw [gradedHermiteCoeff_gradedIdx]
    simp only [gradedUnitCoeff, coords]
  have coeffC (v : GradedIdx N) :
      (gradedHermiteCoeff (gradedUnitCoeff i) (gradedIdx v) : ℂ) =
        if v = i then 1 else 0 := by
    rw [coeff]
    split_ifs <;> norm_num
  funext u
  unfold gradedHermiteFn gradedSupport
  rw [Finset.sum_map]
  change (∑ v : GradedIdx N, (gradedHermiteCoeff (gradedUnitCoeff i) (gradedIdx v) : ℂ) *
    hfun2 (gradedIdx v) u) = hfun2 (gradedIdx i) u
  simp only [coeffC, ite_mul, one_mul, zero_mul]
  simp

/-- The Wick source uses the conjugate of each normalized basis factor. -/
theorem gradedUnit_taylorInnerSource {N : ℕ} (i : GradedIdx N) (j : ℕ) (z w : ℂ) :
    taylorInnerSource j (gradedHermiteFn N (gradedUnitCoeff i)) (z,w) =
      (nrm2 (gradedIdx i) : ℂ) *
        conj (ev z (H (i.1.val + 1 - i.2.1.val) (i.1.val - i.2.2.val))) *
        conj (ev w (H i.2.1.val i.2.2.val)) * taylorPhasePower j (z,w) := by
  rw [gradedHermiteFn_unit]
  simp only [taylorInnerSource, hfun2, H2, gradedIdx, gradedMode,
    map_mul, Complex.conj_ofReal]
  ring

/-- Conjugation swaps each pair of Hermite indices in the unit Taylor source. -/
theorem gradedUnit_taylorInnerSource_swapped {N : ℕ} (i : GradedIdx N) (j : ℕ) (z w : ℂ) :
    taylorInnerSource j (gradedHermiteFn N (gradedUnitCoeff i)) (z,w) =
      (nrm2 (gradedIdx i) : ℂ) *
        ev z (H (i.1.val - i.2.2.val) (i.1.val + 1 - i.2.1.val)) *
        ev w (H i.2.2.val i.2.1.val) * taylorPhasePower j (z,w) := by
  rw [gradedUnit_taylorInnerSource, conj_ev_H_swap, conj_ev_H_swap]

end
end Grothe.UpperChaos
