import Grothe.UpperChaos.RectangleExpModel
import Grothe.UpperChaos.ExponentialHorner

/-! Reusable exponential certificates for rectangle models. A finite transcript
checks the shifted Taylor polynomial and all rounding; LeanCert supplies its
proved analytic remainder. The center exponential has its own independently
proved interval certificate. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.RectangleExpCertificate

open LeanCert.Core LeanCert.Engine RectangleCoefficientArithmetic RectangleModelCheck
open RectangleHornerTrace RectangleExpModel PointwiseGeometricEnclosure

structure Certificate where
  center : ℚ
  degree : ℕ
  error : ℚ
  error_nonneg : 0 ≤ error
  delta : Model
  series : Model
  centered : Model
  centerInterval : IntervalRat
  centerApprox : ℚ
  centerValue : Model
  output : Model
  trace : Trace
  deltaBudget : ℚ
  seriesBudget : ℚ
  productBudget : ℚ

/-- These checks use only exact rational arithmetic and finite lists. -/
def Verified (input : Model) (c : Certificate) : Prop :=
  addOK input (constant (-c.center)) c.delta c.deltaBudget = true ∧
  c.trace.check c.delta ((ExponentialHorner.coefficients c.degree).map constant) = true ∧
  scaleOK (1 / (c.degree.factorial : ℚ)) c.trace.output c.series c.seriesBudget = true ∧
  TaylorModel.expRemainderBound (range c.delta) c.degree ≤ c.error ∧
  roundOK c.series.coefficients
    (IntervalRat.add c.series.remainder (errorInterval c.error c.error_nonneg))
    c.centered 0 = true ∧
  intervalInputOK c.centerInterval c.centerApprox c.centerValue 0 = true ∧
  mulOK c.centered c.centerValue c.output c.productBudget = true

noncomputable instance (input : Model) (c : Certificate) : Decidable (Verified input c) := by
  unfold Verified
  infer_instance

/-- Numerical applications discharge `hcenter` with LeanCert's scalar
exponential checker and `hc` by kernel reduction of the finite transcript. -/
theorem sound (input : Model) (c : Certificate) (hc : Verified input c)
    (hcenter : Real.exp (c.center : ℝ) ∈ c.centerInterval)
    {x y f : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hf : Contains input x y f) :
    Contains c.output x y (Real.exp f) := by
  rcases hc with ⟨hd, ht, hs, he, hr, hv, hp⟩
  have hd0 := add_sound input (constant (-c.center)) c.delta c.deltaBudget hd hx hy hf
    (contains_constant (-c.center) x y)
  have hdelta : Contains c.delta x y (f - (c.center : ℝ)) := by
    simpa only [Rat.cast_neg, sub_eq_add_neg] using hd0
  have htrace := c.trace.rational_sound c.delta (ExponentialHorner.coefficients c.degree)
    ht hx hy hdelta
  have hseries := scale_sound (1 / (c.degree.factorial : ℚ)) c.trace.output c.series
    c.seriesBudget hs hx hy htrace
  have hid : ((1 / (c.degree.factorial : ℚ) : ℚ) : ℝ) *
      eval1 (ExponentialHorner.coefficients c.degree) (f - (c.center : ℝ)) =
      Polynomial.aeval (f - (c.center : ℝ)) (TaylorModel.expTaylorPoly c.degree) := by
    simpa only [one_div, Rat.cast_inv, Rat.cast_natCast, eval1] using
      ExponentialHorner.scaled_horner c.degree (f - (c.center : ℝ))
  rw [hid] at hseries
  have hcentered := centered_exp_model c.series c.centered (range c.delta) c.degree
    c.error c.error_nonneg he hr hx hy (mem_range hx hy hdelta) hseries
  have hvalue := intervalInput_sound c.centerInterval c.centerApprox c.centerValue 0
    hv hx hy hcenter
  have hout := mul_sound c.centered c.centerValue c.output c.productBudget hp hx hy
    hcentered hvalue
  have hexp : Real.exp (f - (c.center : ℝ)) * Real.exp (c.center : ℝ) = Real.exp f := by
    rw [← Real.exp_add, sub_add_cancel]
  rwa [hexp] at hout

/-- A far-negative exponential can use a single scalar upper certificate.
This avoids expanding around a tiny center value when its relative variation
is large. The lower endpoint zero follows from positivity, not numerics. -/
theorem upper_model (input out : Model) (upper center budget : ℚ)
    (hupper : 0 ≤ upper)
    (hscalar : Real.exp ((range input).hi : ℝ) ≤ (upper : ℝ))
    (hcheck : intervalInputOK ⟨0, upper, hupper⟩ center out budget = true)
    {x y f : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hf : Contains input x y f) :
    Contains out x y (Real.exp f) := by
  apply intervalInput_sound ⟨0, upper, hupper⟩ center out budget hcheck hx hy
  constructor
  · simpa only [Rat.cast_zero] using (Real.exp_pos f).le
  · exact (Real.exp_le_exp.mpr (mem_range hx hy hf).2).trans hscalar

end Grothe.UpperChaos.RectangleExpCertificate
