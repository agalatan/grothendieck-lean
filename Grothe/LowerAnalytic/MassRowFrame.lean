import Grothe.LowerAnalytic.RowGaussian
import Grothe.LowerAnalytic.FibreIntegral
import Grothe.Lower.MassFacts

/-!
# The mass row of the identity-tail certificate in the frame

The mass row `λ = 1/2` replaces the crude row of the cover (certificate worker, `PROGRESS.md` §7(e)). For a unimodular
pair `f, g`, with `h = (f + g)/2`, `k = (f − g)/2`, `t = ‖P₁,₀ h‖`, `q = P₂,₁ k`, the hat weight `ε̂ = 25/31` and the hat tail
`ν̂` with `c = 2ν̂ + λ`:

* `normSq_kOf_le` (fact 1): `‖k‖² ≤ 1 − t²`, from `‖h‖² + ‖k‖² = 1` and `t ≤ ‖h‖`;
* `twice_normSq_QkOf_le` (fact 2): `2ε̂‖q‖² − c‖k‖² ≤ E φ_c(|q|)`, from `‖q‖² = Re⟪k, q⟫`, `|k| ≤ 1` and the scalar
  inequality `2ε̂ry − cy² ≤ φ_c(r)` (`phiMass_ge`);
* `integral_phiMass_QkOf_le` (fact 3 in the frame): `E φ_c(|q|) − ε̂‖q‖² ≤ S`, the law-level bound of the mass row
  (`mass_law_bound`) for the law of `U = |q|²/‖q‖²`: `q = ‖q‖(A + iB)` with a circular cubic `(A, B)` (`poly_rep_H21`),
  whose law has the moments and the Stein cuts (`gaussian_moments`, `gaussian_gramInputs`, `steinCut_of_inputs`), and
  `‖q‖ ≤ ρ` (`normQk_le_rho`);
* `massRow_frame`: `V̂ ≤ (1 − λ)t² + λ + S − ε̂‖Qh‖²`.

Since `(1 − λ)t² ≤ t² − 2ℓt + ℓ²/λ` for every `ℓ`, the bound is the ordinary row `(ℓ, 0, λ + S + ℓ²/λ)` with the retained
square untouched, for every `ℓ`; it mixes like any row.
-/

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable (m : ℕ)

/-- **Fact 1**: `‖k‖² ≤ 1 − t²` for a unimodular pair. -/
lemma normSq_kOf_le {f g : L2G m} (hf : f ∈ Unimod (stdGaussian (m + m)))
    (hg : g ∈ Unimod (stdGaussian (m + m))) : ‖kOf m f g‖ ^ 2 ≤ 1 - tOf m f g ^ 2 := by
  have h1 := normSq_hOf_add_normSq_kOf m hf hg
  have ht : tOf m f g ≤ ‖hOf m f g‖ := (H10 m).norm_starProjection_apply_le (hOf m f g)
  have ht0 : 0 ≤ tOf m f g := norm_nonneg _
  nlinarith [pow_le_pow_left₀ ht0 ht 2]

/-- **Fact 2**: `2ε‖q‖² − c‖k‖² ≤ E φ_c(|q|)` for `q = P₂,₁ k` and a unimodular pair (`ε, c > 0`). -/
lemma twice_normSq_QkOf_le {e c : ℝ} (he : 0 < e) (hc : 0 < c) {f g : L2G m}
    (hf : f ∈ Unimod (stdGaussian (m + m))) (hg : g ∈ Unimod (stdGaussian (m + m)))
    (hi : Integrable (fun x => phiMass e c ‖QkOf m f g x‖) (stdGaussian (m + m))) :
    2 * e * ‖QkOf m f g‖ ^ 2 - c * ‖kOf m f g‖ ^ 2
      ≤ ∫ x, phiMass e c ‖QkOf m f g x‖ ∂(stdGaussian (m + m)) := by
  have hq : ‖QkOf m f g‖ ^ 2 = ∫ x, hre (kOf m f g x) (QkOf m f g x) ∂(stdGaussian (m + m)) := by
    rw [← re_inner_eq_integral (kOf m f g) (QkOf m f g)]
    exact (re_inner_starProjection (H21 m) (kOf m f g)).symm
  have hk : ‖kOf m f g‖ ^ 2 = ∫ x, ‖kOf m f g x‖ ^ 2 ∂(stdGaussian (m + m)) := norm_sq_eq_integral _
  have iq : Integrable (fun x => hre (kOf m f g x) (QkOf m f g x)) (stdGaussian (m + m)) := by
    have hi : Integrable (fun y => conj (kOf m f g y) * QkOf m f g y) (stdGaussian (m + m)) :=
      (L2.integrable_inner (𝕜 := ℂ) (kOf m f g) (QkOf m f g)).congr
        (Filter.Eventually.of_forall fun y => RCLike.inner_apply' _ _)
    simpa only [hre, RCLike.re_to_complex] using hi.re
  have ik : Integrable (fun x => ‖kOf m f g x‖ ^ 2) (stdGaussian (m + m)) :=
    (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable _)).1 (Lp.memLp _)
  rw [hq, hk, ← integral_const_mul, ← integral_const_mul,
    ← integral_sub (iq.const_mul _) (ik.const_mul _)]
  refine integral_mono_ae ((iq.const_mul _).sub (ik.const_mul _)) hi ?_
  filter_upwards [norm_kOf_le m hf hg] with x hx
  have h1 : hre (kOf m f g x) (QkOf m f g x) ≤ ‖kOf m f g x‖ * ‖QkOf m f g x‖ := by
    calc hre (kOf m f g x) (QkOf m f g x) ≤ ‖conj (kOf m f g x) * QkOf m f g x‖ := Complex.re_le_norm _
      _ = ‖kOf m f g x‖ * ‖QkOf m f g x‖ := by rw [norm_mul, Complex.norm_conj]
  have h2 := phiMass_ge (r := ‖QkOf m f g x‖) he hc hx
  nlinarith [mul_le_mul_of_nonneg_left h1 (mul_nonneg zero_le_two he.le)]

/-- **Fact 3 in the frame**: `E φ_c(|q|) − ε̂‖q‖² ≤ S` for the mass row (`ε̂ = 25/31`, `c = 2ν̂ + 1/2`). -/
theorem integral_phiMass_QkOf_le (hm : 0 < m) {f g : L2G m} (hf : f ∈ Unimod (stdGaussian (m + m)))
    (hg : g ∈ Unimod (stdGaussian (m + m))) :
    Integrable (fun x => phiMass ε massC ‖QkOf m f g x‖) (stdGaussian (m + m)) ∧
      ∫ x, phiMass ε massC ‖QkOf m f g x‖ ∂(stdGaussian (m + m))
        - (ε : ℝ) * ‖QkOf m f g‖ ^ 2 ≤ massS := by
  obtain ⟨A, B, hA, hc, haa, hq⟩ :=
    poly_rep_H21 m hm (p := QkOf m f g) ((H21 m).starProjection_apply_mem (kOf m f g))
  have hM := gaussian_moments A B hA haa hc
  have hS := steinCut_of_inputs (stdGaussian (m + m)) hM (gaussian_gramInputs A B hA haa hc)
  have hnq : ∀ᵐ x ∂(stdGaussian (m + m)), ‖QkOf m f g x‖ = ‖QkOf m f g‖ * √(eval x (radU A B)) := by
    filter_upwards [hq] with x hx
    rw [hx, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_norm]
    congr 1
    rw [← Real.sqrt_sq (norm_nonneg _), Complex.sq_norm, Complex.normSq_mk, radU]
    simp only [map_add, map_mul]
  have hU : Measurable fun x => eval x (radU A B) := (MvPolynomial.continuous_eval _).measurable
  have hint : Integrable (fun x => phiMass ε massC (‖QkOf m f g‖ * √(eval x (radU A B))))
      (stdGaussian (m + m)) := by
    refine Integrable.mono' ((hM.ih.const_mul (2 * (ε : ℝ) * ‖QkOf m f g‖))) ?_ ?_
    · exact ((measurable_phiMass _ _).comp (measurable_const.mul hU.sqrt)).aestronglyMeasurable
    · refine Filter.Eventually.of_forall fun x => ?_
      rw [Real.norm_eq_abs, abs_of_nonneg (phiMass_nonneg epsR_pos massC_pos _)]
      have := phiMass_le epsR_pos massC_pos (mul_nonneg (norm_nonneg (QkOf m f g)) (Real.sqrt_nonneg (eval x (radU A B))))
      linarith
  have hcongr : (fun x => phiMass ε massC ‖QkOf m f g x‖) =ᵐ[stdGaussian (m + m)]
      fun x => phiMass ε massC (‖QkOf m f g‖ * √(eval x (radU A B))) := by
    filter_upwards [hnq] with x hx
    rw [hx]
  refine ⟨hint.congr hcongr.symm, ?_⟩
  rw [integral_congr_ae hcongr]
  exact mass_law_bound hM hS (norm_nonneg _) (normQk_le_rho m hf hg) hint

/-- **The mass row** `λ = 1/2` for a unimodular pair: `V̂ ≤ (1 − λ)t² + λ + S − ε̂‖Qh‖²`, for a witness whose hat weight is
`ε̂ = 25/31` and whose hat tail `ν̂` has `2ν̂ + λ = c`. -/
theorem massRow_frame (hm : 0 < m) {e ν : ℝ} (he : epsHat e ν = (ε : ℝ))
    (hν : 2 * nuHat ν + 1 / 2 = (massC : ℝ)) {f g : L2G m}
    (hf : f ∈ Unimod (stdGaussian (m + m))) (hg : g ∈ Unimod (stdGaussian (m + m))) :
    VhatOf m e ν f g
      ≤ (1 - 1 / 2) * tOf m f g ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖QhOf m f g‖ ^ 2 := by
  obtain ⟨hi, h3⟩ := integral_phiMass_QkOf_le m hm hf hg
  have h1 := normSq_kOf_le m hf hg
  have h2 := twice_normSq_QkOf_le m epsR_pos massC_pos hf hg hi
  have hν' : 2 * nuHat ν = (massC : ℝ) - 1 / 2 := by linarith
  rw [VhatOf, he, hν']
  nlinarith [sq_nonneg ‖PkOf m f g‖]

end

end Grothe.LowerAnalytic
