import Grothe.UpperChaos.PointwiseGeometricEnclosure
import LeanCert.Engine.TaylorModel.ExpLog

/-!
# Centered exponential series with a representation-independent remainder

The approximation may be an evaluation of any polynomial representation,
including a rational bivariate polynomial. The exponential series remainder
is LeanCert's proved `expRemainderBound`; the center and approximation range
are explicitly supplied as rational intervals.

Agent-ID: codex-8c4d
-/

open LeanCert.Core LeanCert.Engine

namespace Grothe.UpperChaos.PointwiseCenteredExpEnclosure

open Grothe.UpperChaos.PointwiseGeometricEnclosure

noncomputable section

/-- The pointwise error of LeanCert's exponential series is contained in its
explicit symmetric `expRemainderBound` interval. -/
theorem exp_sub_taylor_mem (J : IntervalRat) (n : ℕ) {δ : ℝ} (hδ : δ ∈ J) :
    Real.exp δ - Polynomial.aeval δ (TaylorModel.expTaylorPoly n) ∈
      errorInterval (TaylorModel.expRemainderBound J n)
        (TaylorModel.expRemainderBound_nonneg J n) := by
  have h := TaylorModel.tmExp_correct J n δ hδ
  simp only [TaylorModel.evalSet, Set.mem_ofPred_eq] at h
  obtain ⟨r, hr, hvalue⟩ := h
  change r ∈ errorInterval (TaylorModel.expRemainderBound J n)
    (TaylorModel.expRemainderBound_nonneg J n) at hr
  simp only [TaylorModel.tmExp, Rat.cast_zero, sub_zero] at hvalue
  have heq : Real.exp δ - Polynomial.aeval δ (TaylorModel.expTaylorPoly n) = r := by
    rw [hvalue]
    ring
  rw [heq]
  exact hr

end
end Grothe.UpperChaos.PointwiseCenteredExpEnclosure
