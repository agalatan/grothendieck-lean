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

/-- The explicit error from a rational center approximation, a source model's
remainder, and LeanCert's centered exponential-series remainder. -/
def centeredExpRemainder (centerBound approxBound modelRemainder J : IntervalRat)
    (centerApprox : ℚ) (n : ℕ) : IntervalRat :=
  IntervalRat.add
    (IntervalRat.mul (IntervalRat.sub centerBound (IntervalRat.singleton centerApprox))
      approxBound)
    (IntervalRat.mul centerBound
      (IntervalRat.add modelRemainder
        (errorInterval (TaylorModel.expRemainderBound J n)
          (TaylorModel.expRemainderBound_nonneg J n))))

/-- A model of the centered exponential series yields a model of the actual
exponential. The new approximation is the old one multiplied by the rational
`centerApprox`; the stated interval explicitly accounts for its discrepancy
from `exp c`, the model remainder, and LeanCert's series remainder. -/
theorem encloses_exp_of_centered_series {α : Type*} (domain : Set α)
    (approx arg : α → ℝ) (c : ℝ) (centerApprox : ℚ)
    (centerBound approxBound modelRemainder J : IntervalRat) (n : ℕ)
    (hcenter : Real.exp c ∈ centerBound)
    (hdelta : ∀ x ∈ domain, arg x - c ∈ J)
    (happrox : ∀ x ∈ domain, approx x ∈ approxBound)
    (hmodel : Encloses domain approx
      (fun x => Polynomial.aeval (arg x - c) (TaylorModel.expTaylorPoly n))
      modelRemainder) :
    Encloses domain (fun x => (centerApprox : ℝ) * approx x)
      (fun x => Real.exp (arg x))
      (centeredExpRemainder centerBound approxBound modelRemainder J centerApprox n) := by
  intro x hx
  have htail := exp_sub_taylor_mem J n (hdelta x hx)
  have hsum := IntervalRat.mem_add (hmodel x hx) htail
  have hdeltaExp : Real.exp (arg x - c) - approx x ∈
      IntervalRat.add modelRemainder
        (errorInterval (TaylorModel.expRemainderBound J n)
          (TaylorModel.expRemainderBound_nonneg J n)) := by
    have heq : Real.exp (arg x - c) - approx x =
        (Polynomial.aeval (arg x - c) (TaylorModel.expTaylorPoly n) - approx x) +
          (Real.exp (arg x - c) -
            Polynomial.aeval (arg x - c) (TaylorModel.expTaylorPoly n)) := by ring
    rw [heq]
    exact hsum
  have hcenterErr : Real.exp c - (centerApprox : ℝ) ∈
      IntervalRat.sub centerBound (IntervalRat.singleton centerApprox) :=
    IntervalRat.mem_sub hcenter (IntervalRat.mem_singleton centerApprox)
  have hleft := IntervalRat.mem_mul hcenterErr (happrox x hx)
  have hright := IntervalRat.mem_mul hcenter hdeltaExp
  have htotal := IntervalRat.mem_add hleft hright
  have hexp : Real.exp (arg x) = Real.exp c * Real.exp (arg x - c) := by
    rw [← Real.exp_add]
    congr 1
    ring
  have heq : Real.exp (arg x) - (centerApprox : ℝ) * approx x =
      (Real.exp c - (centerApprox : ℝ)) * approx x +
        Real.exp c * (Real.exp (arg x - c) - approx x) := by
    rw [hexp]
    ring
  rw [heq]
  exact htotal

end
end Grothe.UpperChaos.PointwiseCenteredExpEnclosure
