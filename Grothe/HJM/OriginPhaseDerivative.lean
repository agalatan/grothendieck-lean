import Grothe.Haagerup.Phase
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Analysis.Complex.RealDeriv
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.SpecialFunctions.Sqrt

/-!
# Real-parameter derivatives of complex phase

Agent-ID: codex-aa04.

The squared-norm derivative and positive square root identify the derivative
of the phase denominator. Product and quotient rules give explicit first and
second phase derivatives, including polynomial restrictions to the real axis.
The coarse first-derivative norm bound supports polynomial growth estimates.
No numerical-energy assertion is made.
-/

open scoped InnerProductSpace RealInnerProductSpace Topology

namespace Grothe.HJM.Origin

open Grothe.Haag

noncomputable section

/-- The real differential of phase applied to the velocity `v`. -/
def phaseDerivative (z v : ℂ) : ℂ :=
  v / (‖z‖ : ℂ) - z * (⟪z, v⟫_ℝ : ℂ) / (‖z‖ : ℂ) ^ 3

/-- Derive the denominator derivative via squared norm and positive square root. -/
theorem hasDerivAt_norm_of_ne_zero {F : ℝ → ℂ} {v : ℂ} {s : ℝ}
    (hF : HasDerivAt F v s) (hne : F s ≠ 0) :
    HasDerivAt (fun t => ‖F t‖) (⟪F s, v⟫_ℝ / ‖F s‖) s := by
  have hr : ‖F s‖ ≠ 0 := norm_ne_zero_iff.mpr hne
  have hsq : HasDerivAt (fun t => ‖F t‖ ^ 2) (2 * ⟪F s, v⟫_ℝ) s :=
    hF.norm_sq
  have hsqrt := hsq.sqrt (pow_ne_zero 2 hr)
  have hfun : (fun t => Real.sqrt (‖F t‖ ^ 2)) = (fun t => ‖F t‖) := by
    funext t
    exact Real.sqrt_sq (norm_nonneg (F t))
  have hvalue : (2 * ⟪F s, v⟫_ℝ) / (2 * Real.sqrt (‖F s‖ ^ 2)) =
      ⟪F s, v⟫_ℝ / ‖F s‖ := by
    rw [Real.sqrt_sq (norm_nonneg (F s))]
    ring
  rw [hfun, hvalue] at hsqrt
  exact hsqrt

/-- Match the normalized expression to the usual quotient-rule numerator. -/
theorem phaseDerivative_eq_quotient (z v : ℂ) (hz : z ≠ 0) :
    phaseDerivative z v =
      (v * (‖z‖ : ℂ) - z * ((⟪z, v⟫_ℝ / ‖z‖ : ℝ) : ℂ)) /
        (‖z‖ : ℂ) ^ 2 := by
  have hr : (‖z‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr hz)
  unfold phaseDerivative
  rw [Complex.ofReal_div]
  field_simp [hr]
  ring

/-- Phase differentiates at every nonzero value of a real-parameter function. -/
theorem hasDerivAt_phase {F : ℝ → ℂ} {v : ℂ} {s : ℝ}
    (hF : HasDerivAt F v s) (hne : F s ≠ 0) :
    HasDerivAt (fun t => ph (F t)) (phaseDerivative (F s) v) s := by
  have hnorm := hasDerivAt_norm_of_ne_zero hF hne
  have hnormC : HasDerivAt (fun t => (‖F t‖ : ℂ))
      ((⟪F s, v⟫_ℝ / ‖F s‖ : ℝ) : ℂ) s := hnorm.ofReal_comp
  have hr : (‖F s‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr hne)
  rw [phaseDerivative_eq_quotient (F s) v hne]
  simpa only [ph] using hF.fun_div hnormC hr

theorem deriv_phase {F : ℝ → ℂ} {v : ℂ} {s : ℝ}
    (hF : HasDerivAt F v s) (hne : F s ≠ 0) :
    deriv (fun t => ph (F t)) s = phaseDerivative (F s) v :=
  (hasDerivAt_phase hF hne).deriv

/-- A deliberately coarse bound, sufficient for polynomial growth. -/
theorem norm_phaseDerivative_le_two (z v : ℂ) (hz : z ≠ 0) :
    ‖phaseDerivative z v‖ ≤ 2 * ‖v‖ / ‖z‖ := by
  have hr : 0 < ‖z‖ := norm_pos_iff.mpr hz
  have ha : |⟪z, v⟫_ℝ| ≤ ‖z‖ * ‖v‖ := abs_real_inner_le_norm z v
  calc
    ‖phaseDerivative z v‖ ≤
        ‖v / (‖z‖ : ℂ)‖ + ‖z * (⟪z, v⟫_ℝ : ℂ) / (‖z‖ : ℂ) ^ 3‖ :=
      norm_sub_le _ _
    _ = ‖v‖ / ‖z‖ + ‖z‖ * |⟪z, v⟫_ℝ| / ‖z‖ ^ 3 := by
      simp only [norm_div, norm_mul, norm_pow, Complex.norm_real,
        Real.norm_eq_abs, abs_of_nonneg (norm_nonneg z)]
    _ ≤ ‖v‖ / ‖z‖ + ‖z‖ * (‖z‖ * ‖v‖) / ‖z‖ ^ 3 := by
      apply add_le_add_left
      exact div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left ha hr.le)
        (pow_nonneg hr.le 3)
    _ = 2 * ‖v‖ / ‖z‖ := by
      field_simp [hr.ne']
      ring

theorem norm_deriv_phase_le_two {F : ℝ → ℂ} {v : ℂ} {s : ℝ}
    (hF : HasDerivAt F v s) (hne : F s ≠ 0) :
    ‖deriv (fun t => ph (F t)) s‖ ≤ 2 * ‖v‖ / ‖F s‖ := by
  rw [deriv_phase hF hne]
  exact norm_phaseDerivative_le_two (F s) v hne

/-- The second real derivative, expressed without differentiation operators. -/
def phaseSecondDerivative (z v w : ℂ) : ℂ :=
  let a : ℝ := ⟪z, v⟫_ℝ
  let b : ℝ := ‖v‖ ^ 2 + ⟪z, w⟫_ℝ
  w / (‖z‖ : ℂ) - 2 * v * (a : ℂ) / (‖z‖ : ℂ) ^ 3 -
    z * (b : ℂ) / (‖z‖ : ℂ) ^ 3 +
    3 * z * (a : ℂ) ^ 2 / (‖z‖ : ℂ) ^ 5

/-- Differentiate the explicit first derivative using two pointwise derivative data.
This statement does not identify `F1` with `deriv F` on a neighborhood. -/
theorem hasDerivAt_phaseDerivative {F F1 : ℝ → ℂ} {w : ℂ} {s : ℝ}
    (hF : HasDerivAt F (F1 s) s) (hF1 : HasDerivAt F1 w s)
    (hne : F s ≠ 0) :
    HasDerivAt (fun t => phaseDerivative (F t) (F1 t))
      (phaseSecondDerivative (F s) (F1 s) w) s := by
  have hnormC : HasDerivAt (fun t => (‖F t‖ : ℂ))
      ((⟪F s, F1 s⟫_ℝ / ‖F s‖ : ℝ) : ℂ) s :=
    (hasDerivAt_norm_of_ne_zero hF hne).ofReal_comp
  have ha : HasDerivAt (fun t => ⟪F t, F1 t⟫_ℝ)
      (‖F1 s‖ ^ 2 + ⟪F s, w⟫_ℝ) s := by
    simpa only [real_inner_self_eq_norm_sq, add_comm] using hF.inner ℝ hF1
  have haC : HasDerivAt (fun t => (⟪F t, F1 t⟫_ℝ : ℂ))
      ((‖F1 s‖ ^ 2 + ⟪F s, w⟫_ℝ : ℝ) : ℂ) s := ha.ofReal_comp
  have hr : (‖F s‖ : ℂ) ≠ 0 := by
    exact_mod_cast (norm_ne_zero_iff.mpr hne)
  have hfirst := hF1.fun_div hnormC hr
  have hsecond := (hF.fun_mul haC).fun_div (hnormC.fun_pow 3) (pow_ne_zero 3 hr)
  change HasDerivAt
    (fun t => F1 t / (‖F t‖ : ℂ) -
      F t * (⟪F t, F1 t⟫_ℝ : ℂ) / (‖F t‖ : ℂ) ^ 3)
    (phaseSecondDerivative (F s) (F1 s) w) s
  refine (hfirst.sub hsecond).congr_deriv ?_
  simp only [phaseSecondDerivative, Complex.ofReal_div]
  field_simp [hr]
  ring

/-- Restrict the complex polynomial derivative to the real parameter. -/
theorem hasDerivAt_realAxisPolynomial (p : Polynomial ℂ) (s : ℝ) :
    HasDerivAt (fun t : ℝ => p.eval (t : ℂ))
      (p.derivative.eval (s : ℂ)) s :=
  (p.hasDerivAt (s : ℂ)).comp_ofReal

theorem hasDerivAt_polynomialPhase (p : Polynomial ℂ) (s : ℝ)
    (hp : p.eval (s : ℂ) ≠ 0) :
    HasDerivAt (fun t : ℝ => ph (p.eval (t : ℂ)))
      (phaseDerivative (p.eval (s : ℂ)) (p.derivative.eval (s : ℂ))) s :=
  hasDerivAt_phase (hasDerivAt_realAxisPolynomial p s) hp

theorem norm_deriv_polynomialPhase_le_two (p : Polynomial ℂ) (s : ℝ)
    (hp : p.eval (s : ℂ) ≠ 0) :
    ‖deriv (fun t : ℝ => ph (p.eval (t : ℂ))) s‖ ≤
      2 * ‖p.derivative.eval (s : ℂ)‖ / ‖p.eval (s : ℂ)‖ :=
  norm_deriv_phase_le_two (hasDerivAt_realAxisPolynomial p s) hp

/-- The actual derivative function agrees locally with the explicit expression,
so its derivative is the displayed second phase derivative. -/
theorem hasDerivAt_deriv_polynomialPhase (p : Polynomial ℂ) (s : ℝ)
    (hp : p.eval (s : ℂ) ≠ 0) :
    HasDerivAt (deriv (fun t : ℝ => ph (p.eval (t : ℂ))))
      (phaseSecondDerivative (p.eval (s : ℂ)) (p.derivative.eval (s : ℂ))
        (p.derivative.derivative.eval (s : ℂ))) s := by
  have hne : ∀ᶠ t : ℝ in 𝓝 s, p.eval (t : ℂ) ≠ 0 :=
    (hasDerivAt_realAxisPolynomial p s).continuousAt.eventually_ne hp
  have heq : deriv (fun t : ℝ => ph (p.eval (t : ℂ))) =ᶠ[𝓝 s]
      (fun t : ℝ => phaseDerivative (p.eval (t : ℂ)) (p.derivative.eval (t : ℂ))) := by
    filter_upwards [hne] with t ht
    exact (hasDerivAt_polynomialPhase p t ht).deriv
  have hsecond : HasDerivAt
      (fun t : ℝ => phaseDerivative (p.eval (t : ℂ)) (p.derivative.eval (t : ℂ)))
      (phaseSecondDerivative (p.eval (s : ℂ)) (p.derivative.eval (s : ℂ))
        (p.derivative.derivative.eval (s : ℂ))) s :=
    hasDerivAt_phaseDerivative
      (hasDerivAt_realAxisPolynomial p s)
      (hasDerivAt_realAxisPolynomial p.derivative s) hp
  exact hsecond.congr_of_eventuallyEq heq

theorem deriv_deriv_polynomialPhase (p : Polynomial ℂ) (s : ℝ)
    (hp : p.eval (s : ℂ) ≠ 0) :
    deriv (deriv (fun t : ℝ => ph (p.eval (t : ℂ)))) s =
      phaseSecondDerivative (p.eval (s : ℂ)) (p.derivative.eval (s : ℂ))
        (p.derivative.derivative.eval (s : ℂ)) :=
  (hasDerivAt_deriv_polynomialPhase p s hp).deriv

end

end Grothe.HJM.Origin
