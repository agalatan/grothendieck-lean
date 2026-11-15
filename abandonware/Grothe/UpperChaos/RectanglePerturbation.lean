import Grothe.UpperChaos.RectangleModelCheck
import Grothe.UpperChaos.ReciprocalDamping

/-!
# Analytic perturbations of rectangle models

Enlarge only the remainder when an analytic error bound is available. In
particular, reciprocal damping can be charged after its Jacobian factor is
included, without evaluating a model of the inverse auxiliary coordinate.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.RectanglePerturbation

open LeanCert.Core RectangleModelCheck RectangleCoefficientArithmetic
  PointwiseGeometricEnclosure

/-- The absolute value makes inflation well-defined for any rational budget. -/
def inflate (m : Model) (ε : ℚ) : Model :=
  ⟨m.coefficients, IntervalRat.add m.remainder (errorInterval |ε| (abs_nonneg _))⟩

/-- A pointwise analytic error may be added to the existing model remainder. -/
theorem inflate_sound {m : Model} {x y f g : ℝ} (ε : ℚ)
    (hg : Contains m x y g) (herror : |f - g| ≤ (ε : ℝ)) :
    Contains (inflate m ε) x y f := by
  have hε : (ε : ℝ) ≤ ((|ε| : ℚ) : ℝ) := by exact_mod_cast le_abs_self ε
  have he : f - g ∈ errorInterval |ε| (abs_nonneg _) := by
    simpa only [errorInterval, IntervalRat.mem_def, Rat.cast_neg] using
      abs_le.mp (herror.trans hε)
  have hs := IntervalRat.mem_add hg he
  change f - eval2 m.coefficients x y ∈ _
  have hid : f - eval2 m.coefficients x y =
      (g - eval2 m.coefficients x y) + (f - g) := by ring
  rw [hid]
  exact hs

/-- The generated remainder may round the analytic radius outward. Both its
coefficient preservation and interval containment are checked exactly. -/
def inflateOK (m out : Model) (ε : ℚ) : Bool :=
  decide (m.coefficients = out.coefficients) &&
    intervalSubset (inflate m ε).remainder out.remainder

theorem contains_of_inflateOK {m out : Model} {x y f : ℝ} (ε : ℚ)
    (hc : inflateOK m out ε = true)
    (hm : Contains (inflate m ε) x y f) :
    Contains out x y f := by
  simp only [inflateOK, Bool.and_eq_true, decide_eq_true_eq] at hc
  change f - eval2 m.coefficients x y ∈ (inflate m ε).remainder at hm
  unfold Contains
  rw [← hc.1]
  exact mem_of_intervalSubset hc.2 hm

theorem inflate_output_sound {m out : Model} {x y f g : ℝ} (ε : ℚ)
    (hc : inflateOK m out ε = true)
    (hg : Contains m x y g) (herror : |f - g| ≤ (ε : ℝ)) :
    Contains out x y f :=
  contains_of_inflateOK ε hc (inflate_sound ε hg herror)

/-- An executable absolute bound on the whole model range. -/
def rangeAbs (m : Model) : ℚ := max |(range m).lo| |(range m).hi|

theorem abs_le_rangeAbs {m : Model} {x y f : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hf : Contains m x y f) :
    |f| ≤ (rangeAbs m : ℝ) := by
  have hm := mem_range hx hy hf
  have hlo : |((range m).lo : ℝ)| ≤ (rangeAbs m : ℝ) := by
    exact_mod_cast le_max_left |(range m).lo| |(range m).hi|
  have hhi : |((range m).hi : ℝ)| ≤ (rangeAbs m : ℝ) := by
    exact_mod_cast le_max_right |(range m).lo| |(range m).hi|
  apply abs_le.mpr
  exact ⟨(neg_le_neg hlo).trans ((neg_abs_le _).trans hm.1),
    hm.2.trans ((le_abs_self _).trans hhi)⟩

/-- Uniform reciprocal damping reserve from a nonnegative factor bound.
The coordinate `v` may be zero: the existing weighted-error theorem includes
that algebraic endpoint and does not divide its error bound by `v`. -/
theorem reciprocal_damping_sound {m : Model} {x y v A : ℝ} (η K : ℚ)
    (hA : 0 ≤ A) (hAK : A ≤ (K : ℝ))
    (hm : Contains m x y (v^2 * A)) :
    Contains (inflate m (η^2 * K)) x y
      (v^2 * Real.exp (-((η : ℝ)^2 / v^2)) * A) := by
  apply inflate_sound _ hm
  calc
    _ ≤ (η : ℝ)^2 * A := ReciprocalDamping.weighted_error η v A hA
    _ ≤ (η : ℝ)^2 * (K : ℝ) :=
      mul_le_mul_of_nonneg_left hAK (sq_nonneg _)
    _ = ((η^2 * K : ℚ) : ℝ) := by push_cast; rfl

/-- The factor bound is obtained directly from its proved rectangle model. -/
theorem reciprocal_damping_of_model {m factor : Model} {x y v A : ℝ} (η : ℚ)
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hA : 0 ≤ A)
    (hfactor : Contains factor x y A) (hm : Contains m x y (v^2 * A)) :
    Contains (inflate m (η^2 * rangeAbs factor)) x y
      (v^2 * Real.exp (-((η : ℝ)^2 / v^2)) * A) := by
  apply reciprocal_damping_sound η _ hA _ hm
  exact (le_abs_self A).trans (abs_le_rangeAbs hx hy hfactor)

/-- A certificate may retain a dyadically rounded output remainder rather
than the exact rational inflation, provided the finite containment check passes. -/
theorem reciprocal_damping_output_of_model {m factor out : Model}
    {x y v A : ℝ} (η : ℚ)
    (hc : inflateOK m out (η^2 * rangeAbs factor) = true)
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hA : 0 ≤ A)
    (hfactor : Contains factor x y A) (hm : Contains m x y (v^2 * A)) :
    Contains out x y (v^2 * Real.exp (-((η : ℝ)^2 / v^2)) * A) :=
  contains_of_inflateOK _ hc (reciprocal_damping_of_model η hx hy hA hfactor hm)

end Grothe.UpperChaos.RectanglePerturbation
