import Grothe.UpperChaos.RectangleModelCheck

/-!
# Checked Horner transcripts for rectangle models

The transcript supplies rounded products and sums. Its checker verifies every
local residual and remainder inclusion. It works on the existing coefficient
order, with a single shared variable model; no source polynomial is recompiled.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.RectangleHornerTrace

open GrotheKernel RectangleCoefficientArithmetic RectangleModelCheck

inductive Trace where
  | nil
  | cons (product result : Model) (mulBudget addBudget : ℚ) (tail : Trace)

def Trace.output : Trace → Model
  | .nil => constant 0
  | .cons _ result _ _ _ => result

def Trace.check (argumentModel : Model) : List Model → Trace → Bool
  | [], .nil => true
  | a :: inputs, .cons product result mulBudget addBudget tail =>
      tail.check argumentModel inputs &&
        (mulOK tail.output argumentModel product mulBudget &&
          addOK product a result addBudget)
  | _, _ => false

/-- Every accepted transcript encloses the real Horner evaluation of the
enclosed input coefficients, throughout the normalized square. -/
theorem Trace.sound (argumentModel : Model) {x y v : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hv : Contains argumentModel x y v)
    (inputs : List Model) (values : List ℝ)
    (hinputs : List.Forall₂ (fun m a => Contains m x y a) inputs values)
    (trace : Trace) (hc : trace.check argumentModel inputs = true) :
    Contains trace.output x y (evalG id values v) := by
  induction hinputs generalizing trace with
  | nil =>
    cases trace with
    | nil => simpa [Trace.output] using contains_constant 0 x y
    | cons product result mulBudget addBudget tail =>
      simp [Trace.check] at hc
  | @cons a b inputs values ha hinputs ih =>
    cases trace with
    | nil => simp [Trace.check] at hc
    | cons product result mulBudget addBudget tail =>
      simp only [Trace.check, Bool.and_eq_true] at hc
      have ht := ih tail hc.1
      have hm := mul_sound tail.output argumentModel product mulBudget hc.2.1 hx hy ht hv
      have hs := add_sound product a result addBudget hc.2.2 hx hy hm ha
      simpa only [Trace.output, evalG_cons, id_eq, add_comm, mul_comm] using hs

/-- Rational leaves are exact constants, so the numerical transcript does not
need any additional leaf hypotheses. -/
theorem Trace.rational_sound (argumentModel : Model) (values : List ℚ) (trace : Trace)
    (hc : trace.check argumentModel (values.map constant) = true)
    {x y v : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hv : Contains argumentModel x y v) :
    Contains trace.output x y (eval1 values v) := by
  have hi : List.Forall₂ (fun m a => Contains m x y a)
      (values.map constant) (values.map fun c : ℚ => (c : ℝ)) := by
    clear hc
    induction values with
    | nil => exact .nil
    | cons c values ih => exact .cons (contains_constant c x y) ih
  have h := trace.sound argumentModel hx hy hv _ _ hi hc
  rw [evalG_map (fun c : ℚ => (c : ℝ)) id (fun c : ℚ => (c : ℝ))
    (fun _ => rfl)] at h
  exact h

end Grothe.UpperChaos.RectangleHornerTrace
