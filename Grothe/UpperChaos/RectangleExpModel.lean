import Grothe.UpperChaos.RectangleHornerTrace
import Grothe.UpperChaos.PointwiseCenteredExpEnclosure

/-! A finite exponential-series model plus LeanCert's proved Taylor remainder.
All interval and rounding witnesses are supplied to the existing exact checker.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.RectangleExpModel

open LeanCert.Core LeanCert.Engine RectangleCoefficientArithmetic RectangleModelCheck
open PointwiseGeometricEnclosure PointwiseCenteredExpEnclosure

/-- Integer Horner coefficients followed by one division represent the exact
degree-six exponential polynomial used by LeanCert. -/
theorem exp6_horner (z : ℝ) :
    (1 / 720 : ℝ) * eval1 [720, 720, 360, 120, 30, 6, 1] z =
      Polynomial.aeval z (TaylorModel.expTaylorPoly 6) := by
  norm_num [eval1, evalG, TaylorModel.expTaylorPoly,
    Finset.sum_range_succ, Polynomial.aeval_def]
  ring

/-- Add the proved analytic exponential remainder to a checked polynomial
series model, including any further outward rounding of its coefficients. -/
theorem centered_exp_model (series out : Model) (J : IntervalRat) (n : ℕ)
    (budget : ℚ) (hbudget : 0 ≤ budget)
    (htail : TaylorModel.expRemainderBound J n ≤ budget)
    (hcheck : roundOK series.coefficients
      (IntervalRat.add series.remainder (errorInterval budget hbudget)) out 0 = true)
    {x y z : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hz : z ∈ J)
    (hs : Contains series x y (Polynomial.aeval z (TaylorModel.expTaylorPoly n))) :
    Contains out x y (Real.exp z) := by
  have ht := exp_sub_taylor_mem J n hz
  have hle : (TaylorModel.expRemainderBound J n : ℝ) ≤ (budget : ℝ) :=
    Rat.cast_le.mpr htail
  have he : Real.exp z - Polynomial.aeval z (TaylorModel.expTaylorPoly n) ∈
      errorInterval budget hbudget := by
    have ht' : -(TaylorModel.expRemainderBound J n : ℝ) ≤
        Real.exp z - Polynomial.aeval z (TaylorModel.expTaylorPoly n) ∧
        Real.exp z - Polynomial.aeval z (TaylorModel.expTaylorPoly n) ≤
          (TaylorModel.expRemainderBound J n : ℝ) := by
      simpa only [errorInterval, IntervalRat.mem_def, Rat.cast_neg] using ht
    simpa only [errorInterval, IntervalRat.mem_def, Rat.cast_neg] using
      And.intro ((neg_le_neg hle).trans ht'.1) (ht'.2.trans hle)
  apply round_sound _ _ out 0 hcheck hx hy
  have h := IntervalRat.mem_add hs he
  have hid : Real.exp z - eval2 series.coefficients x y =
      (Polynomial.aeval z (TaylorModel.expTaylorPoly n) - eval2 series.coefficients x y) +
        (Real.exp z - Polynomial.aeval z (TaylorModel.expTaylorPoly n)) := by ring
  rw [hid]
  exact h

end Grothe.UpperChaos.RectangleExpModel
