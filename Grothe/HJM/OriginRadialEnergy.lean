import Grothe.HJM.OriginGreen
import Grothe.HJM.OriginLaguerre
import Grothe.HJM.OriginTruncation

/-!
# From the scalar Green identity to actual Gaussian spectral energy

Agent-ID: codex-aa04.

The substitution `s = r²` identifies the Green pairing with the already
normalized charge-one Hermite coefficient. The Jacobian cancels the factor
two in planar Gaussian polar integration. Consequently the radial differential
expression acts on the actual coefficient with multiplier `2*n+1`, and
charge-one Parseval yields its exact weighted energy.

Square integrability, coefficient-kernel integrability and Green boundary
conditions remain explicit. These analytic theorems assert no numerical
enclosure for the origin response.
-/

open MeasureTheory Filter Set Grothe.LowerAnalytic Grothe.UpperChaos
open scoped Topology ComplexConjugate InnerProductSpace

namespace Grothe.HJM

noncomputable section

/-- The change `s = r²` in the complex-valued Laguerre pairing. This includes
the Jacobian exactly and requires no prior integrability assumption. -/
theorem origin_radial_integral_sq_substitution (P : Polynomial ℝ) (v : ℝ → ℂ) :
    (∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      ((P.eval s : ℝ) : ℂ) * v s) =
    (2 : ℂ) * ∫ r in Ioi (0 : ℝ),
      ((r ^ 2 * Real.exp (-r ^ 2) * P.eval (r ^ 2) : ℝ) : ℂ) * v (r ^ 2) := by
  rw [← integral_comp_rpow_Ioi_of_pos (show (0 : ℝ) < 2 by norm_num),
    ← integral_const_mul]
  refine setIntegral_congr_fun measurableSet_Ioi fun r hr => ?_
  norm_num only [show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one,
    Real.rpow_two, Real.sqrt_sq hr.le, Complex.real_smul]
  push_cast
  ring

/-- Integrability is preserved by the same substitution; the primed
change-of-variables theorem removes the harmless constant Jacobian factor. -/
theorem origin_radial_integrable_sq_iff (P : Polynomial ℝ) (v : ℝ → ℂ) :
    IntegrableOn (fun r : ℝ =>
      ((r ^ 2 * Real.exp (-r ^ 2) * P.eval (r ^ 2) : ℝ) : ℂ) * v (r ^ 2)) (Ioi 0) ↔
    IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      ((P.eval s : ℝ) : ℂ) * v s) (Ioi 0) := by
  conv_rhs =>
    rw [← integrableOn_Ioi_comp_rpow_iff' _ (show (2 : ℝ) ≠ 0 by norm_num)]
  refine integrableOn_congr_fun (fun r hr => ?_) measurableSet_Ioi
  norm_num only [show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one,
    Real.rpow_two, Real.sqrt_sq hr.le, Complex.real_smul]
  push_cast
  ring

/-- The Gaussian coefficient kernel is integrable whenever the actual response
is in `L²`: it is a Hermite polynomial paired with that response. -/
theorem integrable_origin_radial_pairing (n : ℕ) (v : ℝ → ℂ)
    (hF : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC) :
    Integrable (fun z : ℂ =>
      ((‖z‖ * (originRadialPoly n).eval (‖z‖ ^ 2) : ℝ) : ℂ) * v (‖z‖ ^ 2)) gaussC := by
  refine (integrable_conj_ev_mul hF (H (n + 1) n)).congr ?_
  filter_upwards [] with z
  have hp : conj z * Grothe.Haag.ph z = (‖z‖ : ℂ) := by
    simpa [Grothe.Haag.ph] using conj_monomial_mul_div_norm 0 z
  rw [ev_H_charge_one_radial]
  simp only [map_mul, Complex.conj_ofReal]
  calc
    _ = (conj z * Grothe.Haag.ph z) *
        (((originRadialPoly n).eval (‖z‖ ^ 2) : ℝ) : ℂ) * v (‖z‖ ^ 2) := by ring
    _ = _ := by rw [hp]; push_cast; ring

/-- The actual normalized charge-one coefficient in the `s = |z|²` variable.
The raw radial polynomial already includes the signed factorial normalization. -/
theorem chargeOneCoeff_eq_origin_s_integral (n : ℕ) (v : ℝ → ℂ)
    (hv : Measurable v)
    (hS : IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      (((originRadialPoly n).eval s : ℝ) : ℂ) * v s) (Ioi 0))
    (hF : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC) :
    chargeOneCoeff (hF.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))) n =
      (nrm (n + 1) n : ℂ) *
        ∫ s in Ioi (0 : ℝ), ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
          (((originRadialPoly n).eval s : ℝ) : ℂ) * v s := by
  change ⟪hvec (n + 1, n), hF.toLp _⟫_ℂ = _
  rw [inner_charge_one_radial_integral_of_integrable n v hv
    (integrable_origin_radial_pairing n v hF)
    ((origin_radial_integrable_sq_iff _ _).mpr hS) hF,
    origin_radial_integral_sq_substitution]
  push_cast
  ring

/-- Green's scalar identity implies the coefficient identity for the actual
Gaussian responses, with their original chaos degree `2*n+1`. -/
theorem chargeOneCoeff_originRadialDifferential (n : ℕ) {v v1 v2 : ℝ → ℂ}
    (hv : Measurable v) (hD : Measurable (originRadialDifferential v v1 v2))
    (hV : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC)
    (hQ : MemLp (fun z : ℂ =>
      Grothe.Haag.ph z * originRadialDifferential v v1 v2 (‖z‖ ^ 2)) 2 gaussC)
    (hderiv : ∀ s ∈ Ioi (0 : ℝ), HasDerivAt v (v1 s) s)
    (hderiv1 : ∀ s ∈ Ioi (0 : ℝ), HasDerivAt v1 (v2 s) s)
    (hzero : ContinuousWithinAt (originGreenBoundary (originRadialPoly n) v v1) (Ici 0) 0)
    (hinfty : Tendsto (originGreenBoundary (originRadialPoly n) v v1) atTop (𝓝 0))
    (hSV : IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      (((originRadialPoly n).eval s : ℝ) : ℂ) * v s) (Ioi 0))
    (hSQ : IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential v v1 v2 s) (Ioi 0)) :
    chargeOneCoeff (hQ.toLp (fun z : ℂ =>
        Grothe.Haag.ph z * originRadialDifferential v v1 v2 (‖z‖ ^ 2))) n =
      ((2 * (n : ℝ) + 1 : ℝ) : ℂ) *
        chargeOneCoeff (hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))) n := by
  rw [chargeOneCoeff_eq_origin_s_integral n _ hD hSQ hQ,
    chargeOneCoeff_eq_origin_s_integral n v hv hSV hV,
    originGreen_integral (originRadialPoly n) n hderiv hderiv1
      (fun s _hs => originRadialPoly_ode_eval n s) hzero hinfty hSV hSQ]
  push_cast
  ring

private lemma radial_response_charge (v : ℝ → ℂ) (c z : ℂ) (hc : ‖c‖ = 1) :
    Grothe.Haag.ph (c * z) * v (‖c * z‖ ^ 2) =
      c * (Grothe.Haag.ph z * v (‖z‖ ^ 2)) := by
  simp only [Grothe.Haag.ph, norm_mul, hc, one_mul]
  ring

/-- The Gaussian `L²` norm of an actual radial response is its exponential
one-dimensional energy. The phase's zero value at the origin causes no gap:
the polar calculation only cancels `r/r` for strictly positive radii. -/
theorem radial_response_norm_sq (v : ℝ → ℂ) (hv : Measurable v)
    (hV : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC) :
    ‖hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))‖ ^ 2 =
      ∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖v s‖ ^ 2 := by
  rw [scalar_norm_toLp_sq]
  calc
    (∫ z : ℂ, ‖Grothe.Haag.ph z * v (‖z‖ ^ 2)‖ ^ 2 ∂gaussC) =
        2 * ∫ r in Ioi (0 : ℝ), r * Real.exp (-r ^ 2) *
          ((r / r) ^ 2 * ‖v (r ^ 2)‖ ^ 2) := by
      simpa only [Grothe.Haag.ph, norm_mul, norm_div, Complex.norm_real,
        norm_norm, mul_pow] using
        integral_gaussC_radial (fun r : ℝ => (r / r) ^ 2 * ‖v (r ^ 2)‖ ^ 2)
          (by fun_prop)
    _ = ∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖v s‖ ^ 2 := by
      conv_rhs =>
        rw [← integral_comp_rpow_Ioi_of_pos (show (0 : ℝ) < 2 by norm_num)]
      rw [← integral_const_mul]
      refine setIntegral_congr_fun measurableSet_Ioi fun r hr => ?_
      have hr0 : 0 < r := hr
      norm_num only [show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one,
        Real.rpow_two, smul_eq_mul, div_self hr0.ne']
      ring

/-- Exact weighted Parseval for an actual radial differential expression.
This upgrades the generic Bessel bound to an equality because every response
`phase(z) * v(|z|²)` has charge one, regardless of boundedness. The resulting
energy is the same one-dimensional integral used by an enclosure certificate. -/
theorem originRadialDifferential_hasSum_energy {v v1 v2 : ℝ → ℂ}
    (hv : Measurable v) (hD : Measurable (originRadialDifferential v v1 v2))
    (hV : MemLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2)) 2 gaussC)
    (hQ : MemLp (fun z : ℂ =>
      Grothe.Haag.ph z * originRadialDifferential v v1 v2 (‖z‖ ^ 2)) 2 gaussC)
    (hderiv : ∀ s ∈ Ioi (0 : ℝ), HasDerivAt v (v1 s) s)
    (hderiv1 : ∀ s ∈ Ioi (0 : ℝ), HasDerivAt v1 (v2 s) s)
    (hzero : ∀ n, ContinuousWithinAt
      (originGreenBoundary (originRadialPoly n) v v1) (Ici 0) 0)
    (hinfty : ∀ n, Tendsto (originGreenBoundary (originRadialPoly n) v v1) atTop (𝓝 0))
    (hSV : ∀ n, IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      (((originRadialPoly n).eval s : ℝ) : ℂ) * v s) (Ioi 0))
    (hSQ : ∀ n, IntegrableOn (fun s : ℝ => ((Real.exp (-s) * Real.sqrt s : ℝ) : ℂ) *
      (((originRadialPoly n).eval s : ℝ) : ℂ) *
        originRadialDifferential v v1 v2 s) (Ioi 0)) :
    HasSum (fun n : ℕ => (2 * (n : ℝ) + 1) ^ 2 *
      ‖chargeOneCoeff (hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))) n‖ ^ 2)
      (∫ s in Ioi (0 : ℝ), Real.exp (-s) *
        ‖originRadialDifferential v v1 v2 s‖ ^ 2) := by
  have heq : (fun n : ℕ => (2 * (n : ℝ) + 1) ^ 2 *
      ‖chargeOneCoeff (hV.toLp (fun z : ℂ => Grothe.Haag.ph z * v (‖z‖ ^ 2))) n‖ ^ 2) =
      (fun n => ‖chargeOneCoeff (hQ.toLp (fun z : ℂ =>
        Grothe.Haag.ph z * originRadialDifferential v v1 v2 (‖z‖ ^ 2))) n‖ ^ 2) := by
    funext n
    rw [chargeOneCoeff_originRadialDifferential n hv hD hV hQ hderiv hderiv1
      (hzero n) (hinfty n) (hSV n) (hSQ n)]
    simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs]
  rw [heq, ← radial_response_norm_sq _ hD hQ]
  exact chargeOneCoeff_hasSum_sq hQ (radial_response_charge _)

end

end Grothe.HJM
