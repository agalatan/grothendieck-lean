import Grothe.HJM.OriginAnalytic

/-!
# Integrability of the origin energy densities

Agent-ID: codex-aa04. The polynomial envelope for each actual energy
amplitude implies integrability of its squared modulus against the radial
Gaussian weight. This provides the whole half-line integrability needed for
partitioning the energy integral; it asserts no numerical energy bound.
-/

open MeasureTheory Set

namespace Grothe.HJM.Origin

noncomputable section

/-- A continuous complex amplitude with polynomial growth has an integrable
weighted squared norm on the nonnegative radial half-line. -/
theorem integrable_energyDensity_of_envelope {E : ℝ → ℂ}
    (hc : ContinuousOn E (Ici 0)) (hE : PolynomialEnvelope E) :
    IntegrableOn (fun s : ℝ => Real.exp (-s) * ‖E s‖ ^ 2) (Ioi 0) := by
  let F : ℝ → ℂ := fun s => ((‖E s‖ ^ 2 : ℝ) : ℂ)
  have hcont : ContinuousOn F (Ici 0) := by
    exact Complex.continuous_ofReal.comp_continuousOn (hc.norm.pow 2)
  have henv : PolynomialEnvelope F := by
    rcases hE with ⟨C, hC, d, hbound⟩
    refine ⟨C ^ 2, sq_nonneg C, 2 * d, ?_⟩
    intro s hs
    have hb := hbound s hs
    have hsq := (sq_le_sq₀ (norm_nonneg (E s))
      (mul_nonneg hC (pow_nonneg (by linarith : 0 ≤ 1 + s) d))).mpr hb
    dsimp only [F]
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
    simpa only [mul_pow, ← pow_mul, Nat.mul_comm] using hsq
  have hi := (PolynomialEnvelope.exp_mul_integrable hcont henv).re
  simpa only [F, RCLike.re_to_complex, Complex.mul_re, Complex.ofReal_re,
    Complex.ofReal_im, mul_zero, sub_zero] using hi

/-- The actual left origin energy density is integrable on the full radial
half-line. -/
theorem integrableOn_fEnergyDensity_all :
    IntegrableOn (fun s : ℝ => Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) (Ioi 0) :=
  integrable_energyDensity_of_envelope continuousOn_fEnergyAmplitude
    fEnergyAmplitude_polynomialEnvelope

/-- The actual right origin energy density is integrable on the full radial
half-line. -/
theorem integrableOn_gEnergyDensity_all :
    IntegrableOn (fun s : ℝ => Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) (Ioi 0) :=
  integrable_energyDensity_of_envelope continuousOn_gEnergyAmplitude
    gEnergyAmplitude_polynomialEnvelope

end

end Grothe.HJM.Origin
