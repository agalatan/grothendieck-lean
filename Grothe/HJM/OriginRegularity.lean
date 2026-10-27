import Grothe.HJM.OriginNonvanishing
import Grothe.HJM.OriginGreen
import Mathlib.Analysis.Calculus.ContDiff.Polynomial
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Analysis.InnerProductSpace.Calculus

/-!
# Smoothness of the actual asymmetric radial responses

Agent-ID: codex-aa04.

The certified nonvanishing of the two polynomial numerators makes their
phases smooth as real-parameter functions at every nonnegative radial
parameter, including zero. Endpoint subtraction therefore supplies actual
first and second derivatives and the finite-endpoint continuity required by
the scalar Green identity. Growth, integrability and the boundary at infinity
are separate obligations.
-/

open MeasureTheory Filter Set Grothe.Haag Grothe.Upper
open scoped ComplexConjugate Topology ContDiff

namespace Grothe.HJM.Origin

noncomputable section

private theorem contDiff_realPolynomial (Q : Polynomial ℝ) : ContDiff ℝ ∞ Q.eval := by
  simpa only [Polynomial.coe_aeval_eq_eval] using Q.contDiff_aeval (𝕜 := ℝ) ∞

theorem contDiff_P : ContDiff ℝ ∞ P := by
  unfold P
  exact (Complex.ofRealCLM.contDiff.comp
    (contDiff_realPolynomial (ofListQ OriginData.pReal))).add
    (contDiff_const.mul (Complex.ofRealCLM.contDiff.comp
      (contDiff_realPolynomial (ofListQ OriginData.pImag))))

theorem contDiff_leftNumerator : ContDiff ℝ ∞ leftNumerator := by
  unfold leftNumerator
  exact contDiff_P.mul (Complex.ofRealCLM.contDiff.add contDiff_const)

theorem contDiff_rightNumerator : ContDiff ℝ ∞ rightNumerator := by
  unfold rightNumerator
  exact (contDiff_const.mul (Complex.conjCLE.contDiff.comp contDiff_P)).mul
    (Complex.ofRealCLM.contDiff.add contDiff_const)

private theorem contDiffAt_phase_comp {Q : ℝ → ℂ} {s : ℝ}
    (hQ : ContDiffAt ℝ ∞ Q s) (hne : Q s ≠ 0) :
    ContDiffAt ℝ ∞ (fun t => ph (Q t)) s := by
  have hn : ContDiffAt ℝ ∞ (fun t => ((‖Q t‖ : ℝ) : ℂ)) s :=
    Complex.ofRealCLM.contDiff.contDiffAt.comp s (hQ.norm ℂ hne)
  have hn0 : ((‖Q s‖ : ℝ) : ℂ) ≠ 0 := by
    exact_mod_cast norm_ne_zero_iff.mpr hne
  simpa only [ph, div_eq_mul_inv, Pi.inv_apply] using hQ.mul (hn.inv hn0)

/-- The actual left radial response is smooth at every point of its domain,
in a full real neighborhood even when the point is zero. -/
theorem contDiffAt_f (s : ℝ) (hs : 0 ≤ s) : ContDiffAt ℝ ∞ f s :=
  contDiffAt_phase_comp contDiff_leftNumerator.contDiffAt (leftNumerator_ne_zero s hs)

/-- The actual right radial response has the same real-variable smoothness. -/
theorem contDiffAt_g (s : ℝ) (hs : 0 ≤ s) : ContDiffAt ℝ ∞ g s :=
  contDiffAt_phase_comp contDiff_rightNumerator.contDiffAt (rightNumerator_ne_zero s hs)

theorem contDiffOn_f : ContDiffOn ℝ ∞ f (Ici 0) :=
  fun s hs => (contDiffAt_f s hs).contDiffWithinAt

theorem contDiffOn_g : ContDiffOn ℝ ∞ g (Ici 0) :=
  fun s hs => (contDiffAt_g s hs).contDiffWithinAt

theorem hasDerivAt_f (s : ℝ) (hs : 0 ≤ s) : HasDerivAt f (deriv f s) s :=
  ((contDiffAt_f s hs).differentiableAt (by simp)).hasDerivAt

theorem hasDerivAt_g (s : ℝ) (hs : 0 ≤ s) : HasDerivAt g (deriv g s) s :=
  ((contDiffAt_g s hs).differentiableAt (by simp)).hasDerivAt

theorem contDiffAt_deriv_f (s : ℝ) (hs : 0 ≤ s) : ContDiffAt ℝ ∞ (deriv f) s :=
  (contDiffAt_f s hs).derivWithin (by simp)

theorem contDiffAt_deriv_g (s : ℝ) (hs : 0 ≤ s) : ContDiffAt ℝ ∞ (deriv g) s :=
  (contDiffAt_g s hs).derivWithin (by simp)

theorem hasDerivAt_deriv_f (s : ℝ) (hs : 0 ≤ s) :
    HasDerivAt (deriv f) (deriv (deriv f) s) s :=
  ((contDiffAt_deriv_f s hs).differentiableAt (by simp)).hasDerivAt

theorem hasDerivAt_deriv_g (s : ℝ) (hs : 0 ≤ s) :
    HasDerivAt (deriv g) (deriv (deriv g) s) s :=
  ((contDiffAt_deriv_g s hs).differentiableAt (by simp)).hasDerivAt

/-- The actual endpoint-subtracted radial amplitudes. -/
def fResidual (s : ℝ) : ℂ := f s - f 0

def gResidual (s : ℝ) : ℂ := g s - g 0

@[simp] theorem fResidual_zero : fResidual 0 = 0 := sub_self _

@[simp] theorem gResidual_zero : gResidual 0 = 0 := sub_self _

theorem contDiffAt_fResidual (s : ℝ) (hs : 0 ≤ s) : ContDiffAt ℝ ∞ fResidual s :=
  (contDiffAt_f s hs).sub contDiffAt_const

theorem contDiffAt_gResidual (s : ℝ) (hs : 0 ≤ s) : ContDiffAt ℝ ∞ gResidual s :=
  (contDiffAt_g s hs).sub contDiffAt_const

theorem continuousOn_fResidual : ContinuousOn fResidual (Ici 0) :=
  fun s hs => (contDiffAt_fResidual s hs).continuousAt.continuousWithinAt

theorem continuousOn_gResidual : ContinuousOn gResidual (Ici 0) :=
  fun s hs => (contDiffAt_gResidual s hs).continuousAt.continuousWithinAt

theorem hasDerivAt_fResidual (s : ℝ) (hs : 0 ≤ s) :
    HasDerivAt fResidual (deriv f s) s :=
  (hasDerivAt_f s hs).sub_const (f 0)

theorem hasDerivAt_gResidual (s : ℝ) (hs : 0 ≤ s) :
    HasDerivAt gResidual (deriv g s) s :=
  (hasDerivAt_g s hs).sub_const (g 0)

@[simp] theorem deriv_fResidual : deriv fResidual = deriv f :=
  deriv_sub_const_fun (f 0)

@[simp] theorem deriv_gResidual : deriv gResidual = deriv g :=
  deriv_sub_const_fun (g 0)

/-- The finite-endpoint boundary condition in the Green identity holds for the
actual left response, for every polynomial test mode. -/
theorem continuousWithinAt_fResidual_greenBoundary (Q : Polynomial ℝ) :
    ContinuousWithinAt (originGreenBoundary Q fResidual (deriv f)) (Ici 0) 0 := by
  have hv : ContinuousAt fResidual 0 := (contDiffAt_fResidual 0 le_rfl).continuousAt
  have hv1 : ContinuousAt (deriv f) 0 := (contDiffAt_deriv_f 0 le_rfl).continuousAt
  apply ContinuousAt.continuousWithinAt
  unfold originGreenBoundary
  fun_prop

/-- The same finite-endpoint boundary condition for the actual right response. -/
theorem continuousWithinAt_gResidual_greenBoundary (Q : Polynomial ℝ) :
    ContinuousWithinAt (originGreenBoundary Q gResidual (deriv g)) (Ici 0) 0 := by
  have hv : ContinuousAt gResidual 0 := (contDiffAt_gResidual 0 le_rfl).continuousAt
  have hv1 : ContinuousAt (deriv g) 0 := (contDiffAt_deriv_g 0 le_rfl).continuousAt
  apply ContinuousAt.continuousWithinAt
  unfold originGreenBoundary
  fun_prop

/-- The actual left residual satisfies the Green pairing once the infinity
boundary and the two scalar integrability obligations are supplied. -/
theorem fResidual_green_integral (n : ℕ)
    (hinfty : Tendsto (originGreenBoundary (originRadialPoly n) fResidual (deriv f))
      atTop (𝓝 0))
    (hR : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) * fResidual s) (Ioi 0))
    (hQ : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential fResidual (deriv f) (deriv (deriv f)) s) (Ioi 0)) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential fResidual (deriv f) (deriv (deriv f)) s) =
      (2 * (n : ℂ) + 1) * ∫ s in Ioi (0 : ℝ),
        ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * fResidual s :=
  originGreen_integral (originRadialPoly n) n
    (fun s hs => hasDerivAt_fResidual s hs.le)
    (fun s hs => hasDerivAt_deriv_f s hs.le)
    (fun s _ => originRadialPoly_ode_eval n s)
    (continuousWithinAt_fResidual_greenBoundary (originRadialPoly n)) hinfty hR hQ

/-- The corresponding Green pairing for the actual right residual. -/
theorem gResidual_green_integral (n : ℕ)
    (hinfty : Tendsto (originGreenBoundary (originRadialPoly n) gResidual (deriv g))
      atTop (𝓝 0))
    (hR : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) * gResidual s) (Ioi 0))
    (hQ : IntegrableOn (fun s : ℝ =>
      ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential gResidual (deriv g) (deriv (deriv g)) s) (Ioi 0)) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
        (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential gResidual (deriv g) (deriv (deriv g)) s) =
      (2 * (n : ℂ) + 1) * ∫ s in Ioi (0 : ℝ),
        ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * gResidual s :=
  originGreen_integral (originRadialPoly n) n
    (fun s hs => hasDerivAt_gResidual s hs.le)
    (fun s hs => hasDerivAt_deriv_g s hs.le)
    (fun s _ => originRadialPoly_ode_eval n s)
    (continuousWithinAt_gResidual_greenBoundary (originRadialPoly n)) hinfty hR hQ

end

end Grothe.HJM.Origin
