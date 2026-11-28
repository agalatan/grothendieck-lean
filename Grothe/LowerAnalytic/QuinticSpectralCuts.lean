import Grothe.LowerAnalytic.MassRowFrame

/-!
# Shape-dependent mass cuts for the difference of two phases

Each checked spectral witness can be applied at its own scale before maximizing
over the fourth moment. This keeps the dependence on the actual cubic shape in
the degree-five scalar budget.
-/

namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower MvPolynomial

noncomputable section

private theorem phiMass_eq_of_mul_eq {e e' c r r' : ℝ} (he : 0 < e) (he' : 0 < e')
    (h : e * r = e' * r') : phiMass e c r = phiMass e' c r' := by
  simp only [phiMass, le_div_iff₀ he, le_div_iff₀ he', mul_comm r e, mul_comm r' e',
    ← mul_pow, mul_assoc (2 : ℝ), h]

/-- The normalized cubic law and all its checked spectral mass cuts hold simultaneously
for the same pair and the same square root of the fourth excess. -/
theorem exists_shape_quintic_mass_cuts (n : ℕ) (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (hq : 0 < ‖QkOf n f g‖) :
    ∃ (U : (Fin (n + n) → ℝ) → ℝ) (y : ℝ), Moments (stdGaussian (n + n)) U y ∧
      (∀ᵐ x ∂(stdGaussian (n + n)), ‖QkOf n f g x‖ = ‖QkOf n f g‖ * √(U x)) ∧
      ∀ w ∈ massWitnesses, 2 * (ε : ℝ) * (4 / 3 * (w.tau : ℝ)) * ‖QkOf n f g‖ -
        (massC : ℝ) * ‖kOf n f g‖ ^ 2 ≤ w.y.J 0 1 y := by
  obtain ⟨A, B, hA, hc, haa, hrepr⟩ :=
    poly_rep_H21 n hn (p := QkOf n f g) ((H21 n).starProjection_apply_mem (kOf n f g))
  have hM := gaussian_moments A B hA haa hc
  have hS := steinCut_of_inputs (stdGaussian (n + n)) hM (gaussian_gramInputs A B hA haa hc)
  let U := fun x => eval x (radU A B)
  have hnorm : ∀ᵐ x ∂(stdGaussian (n + n)), ‖QkOf n f g x‖ = ‖QkOf n f g‖ * √(U x) := by
    filter_upwards [hrepr] with x hx
    rw [hx, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_norm]
    congr 1
    rw [← Real.sqrt_sq (norm_nonneg _), Complex.sq_norm, Complex.normSq_mk]
    simp only [U, radU, map_add, map_mul]
  refine ⟨U, _, hM, hnorm, ?_⟩
  intro w hw
  have hok := massWitnesses_ok w hw
  have hτ : 0 < (w.tau : ℝ) := by exact_mod_cast (massWitOK_nonneg massMesh w hok).1
  have htb := massWit_tb (stdGaussian (n + n)) hM hS massMesh (by decide +kernel) w hok
  let d : ℝ := (ε : ℝ) * (4 / 3 * (w.tau : ℝ)) / ‖QkOf n f g‖
  have he := epsR_pos
  have hd : 0 < d := by dsimp [d]; positivity
  have hint : Integrable (fun x => massPot ((w.tau : ℝ) * √(U x))) (stdGaussian (n + n)) := by
    apply Integrable.mono' (hM.ih.const_mul (2 * (ε : ℝ) * (4 / 3 * (w.tau : ℝ))))
    · exact ((measurable_phiMass _ _).comp
        (measurable_const.mul (measurable_const.mul (MvPolynomial.continuous_eval _).measurable.sqrt))).aestronglyMeasurable
    · refine Filter.Eventually.of_forall fun x => ?_
      rw [massPot, Real.norm_eq_abs, abs_of_nonneg (phiMass_nonneg epsR_pos massC_pos _)]
      calc _ ≤ _ := phiMass_le epsR_pos massC_pos (by positivity)
           _ = _ := by ring
  have hcongr : (fun x => phiMass d massC ‖QkOf n f g x‖) =ᵐ[stdGaussian (n + n)]
      fun x => massPot ((w.tau : ℝ) * √(U x)) := by
    filter_upwards [hnorm] with x hx
    apply phiMass_eq_of_mul_eq hd epsR_pos
    rw [hx]
    dsimp [d]
    field_simp
  have hdual := twice_normSq_QkOf_le n hd massC_pos hf hg (hint.congr hcongr.symm)
  rw [integral_congr_ae hcongr] at hdual
  have hb := hdual.trans (htb.integral hint)
  convert hb using 1
  dsimp [d]
  field_simp

end

end Grothe.LowerAnalytic
