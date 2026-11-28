import QuinticResearch.GaussianBlockEmbedding
import QuinticResearch.QuinticSignedSupport
import Grothe.LowerAnalytic.Potential

/-!
# Sign selection for a finite real quadratic carrier

For each slope, both signs of a real carrier give a genuine cubic of the same norm.
The larger first absolute moment dominates their average, even when the carrier's
law is asymmetric. The centered squared radius realizes the coefficient `2 / exp 1`.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- A fresh, real, normalized second-chaos field, together with a finite Wick
realization of its product with each old first-chaos field. -/
structure RealCubicCarrier (b : ℕ) where
  field : (Fin (b+b) → ℝ) → ℝ
  measurable : Measurable field
  memLp : MemLp field 2 (stdGaussian (b+b))
  mean : (∫ y, field y ∂(stdGaussian (b+b))) = 0
  second : (∫ y, field y ^ 2 ∂(stdGaussian (b+b))) = 1
  cubic {m : ℕ} {z : L2G m} (hz : z ∈ H10 m) :
    ∃ V : L2G (m+b), V ∈ H21 (m+b) ∧ ⇑V =ᵐ[stdGaussian ((m+b)+(m+b))]
      fun x => z (gaussianBlockSplit m b x).1 * (field (gaussianBlockSplit m b x).2 : ℂ)

/-- Flipping the sign of the carrier if necessary converts the two-sign support test
into a single finite-cubic support lift for the entire, potentially correlated projection. -/
theorem RealCubicCarrier.has_full_lift {b m : ℕ} (C : RealCubicCarrier b) (hm : 0 < m)
    {f g : L2G m} (hf : f ∈ Unimod (stdGaussian (m+m))) (hg : g ∈ Unimod (stdGaussian (m+m))) :
    HasEllipticCubicLift m (∫ y, |C.field y| ∂(stdGaussian (b+b))) f g := by
  obtain ⟨z, hz, hz₁, hP⟩ := exists_frame_vector m hm (hOf m f g)
  obtain ⟨V,hV,hv⟩ := C.cubic hz
  let q := QkOf m f g
  let U : L2G (m+b) := blockLeft q
  let μ := stdGaussian (m+m)
  let ν := stdGaussian (b+b)
  let Φ := gaussianBlockSplit m b
  have mp := measurePreserving_gaussianBlockSplit m b
  have hu : ⇑U =ᵐ[stdGaussian ((m+b)+(m+b))] fun x => q (Φ x).1 := blockLeft_ae q
  have hmz := (Lp.stronglyMeasurable z).measurable
  have hmq := (Lp.stronglyMeasurable q).measurable
  have hmean : (∫ y, (C.field y : ℂ) ∂ν) = 0 := by rw [integral_complex_ofReal, C.mean]; rfl
  have hVnorm : ‖V‖ = 1 := by
    let F (p : (Fin (m+m) → ℝ) × (Fin (b+b) → ℝ)) : ℝ := ‖z p.1‖^2 * C.field p.2 ^ 2
    have hmF : Measurable F := ((hmz.comp measurable_fst).norm.pow_const 2).mul
      ((C.measurable.comp measurable_snd).pow_const 2)
    have hSq : ‖V‖^2 = 1 := by
      rw [norm_sq_eq_integral]
      refine (integral_congr_ae ?_).trans ((mp.hasLaw.integral_comp hmF.aestronglyMeasurable).trans ?_)
      · filter_upwards [hv] with x hx
        rw [hx]
        change ‖z (Φ x).1 * (C.field (Φ x).2 : ℂ)‖^2 = _
        simp only [Function.comp_apply, F, Φ, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs]
      · dsimp only [F]
        rw [integral_prod_mul (fun x => ‖z x‖^2) (fun y => C.field y ^ 2),
          ← norm_sq_eq_integral, hz₁, one_pow, C.second, one_mul]
    nlinarith only [hSq, norm_nonneg V]
  have horth : inner ℂ V U = 0 := by
    let F (p : (Fin (m+m) → ℝ) × (Fin (b+b) → ℝ)) : ℂ :=
      (conj (z p.1) * q p.1) * (C.field p.2 : ℂ)
    have hmF : Measurable F := ((Complex.continuous_conj.measurable.comp (hmz.comp measurable_fst)).mul
      (hmq.comp measurable_fst)).mul (Complex.continuous_ofReal.measurable.comp
        (C.measurable.comp measurable_snd))
    rw [inner_L2]
    refine (integral_congr_ae ?_).trans ((mp.hasLaw.integral_comp hmF.aestronglyMeasurable).trans ?_)
    · filter_upwards [hv,hu] with x hx hy
      rw [hx,hy]
      change conj (z (Φ x).1 * (C.field (Φ x).2 : ℂ)) * q (Φ x).1 = _
      simp only [Function.comp_apply, F, map_mul, Complex.conj_ofReal]
      ring
    · dsimp only [F]
      rw [integral_prod_mul (fun x => conj (z x) * q x) (fun y => (C.field y : ℂ)), hmean, mul_zero]
  have hpz := (H10 m).starProjection_inner_eq_zero (hOf m f g) z hz
  rw [inner_sub_left, hP, inner_smul_left, Complex.conj_ofReal,
    inner_self_eq_one_of_norm_eq_one (𝕜 := ℂ) hz₁, mul_one, sub_eq_zero] at hpz
  intro ℓ hℓ δ hδ
  let F (a : ℝ) (p : (Fin (m+m) → ℝ) × (Fin (b+b) → ℝ)) := ‖z p.1 * ((a * C.field p.2 : ℝ) : ℂ) + q p.1‖
  have intF (a : ℝ) : Integrable (F a) (μ.prod ν) := by
    have hi : Integrable (fun y => ((a * C.field y : ℝ) : ℂ)) ν := ((C.memLp.integrable one_le_two).const_mul a).ofReal
    exact (((((Lp.memLp z).integrable one_le_two).mul_prod hi)).add (((Lp.memLp q).integrable one_le_two).comp_fst ν)).norm
  let G (a : ℝ) (y : Fin (b+b) → ℝ) := carrierSupport z q (a * C.field y)
  have intG (a : ℝ) : Integrable (G a) ν := (intF a).integral_prod_right
  have hpoint (y : Fin (b+b) → ℝ) : ℓ * |C.field y| * (inner ℂ (hOf m f g) z).re + (inner ℂ (kOf m f g) q).re ≤ (G ℓ y + G (-ℓ) y)/2 := by
    simpa only [G, neg_mul, abs_mul, abs_of_nonneg hℓ] using phase_pair_abs_signed hf hg z q (ℓ*C.field y)
  have ih := ((C.memLp.integrable one_le_two).abs.const_mul ℓ).mul_const (inner ℂ (hOf m f g) z).re
  have hpair := integral_mono (ih.add (integrable_const (inner ℂ (kOf m f g) q).re)) (((intG ℓ).add (intG (-ℓ))).div_const 2) hpoint
  simp only [Pi.add_apply] at hpair
  rw [integral_add ih (integrable_const _),integral_mul_const,integral_const_mul,integral_const,probReal_univ,one_smul,
    integral_div,integral_add (intG ℓ) (intG (-ℓ)),hpz,Complex.ofReal_re,
    show (inner ℂ (kOf m f g) q).re = ‖q‖^2 from re_inner_starProjection (H21 m) (kOf m f g)] at hpair
  have he (a : ℝ) : (∫ y, G a y ∂ν) = ∫ x, ‖(((a:ℂ) • V + U : L2G (m+b)) x)‖ ∂(stdGaussian ((m+b)+(m+b))) := by
    refine ((integral_prod_symm _ (intF a)).symm.trans ((mp.hasLaw.integral_comp (intF a).aestronglyMeasurable).symm)).trans (integral_congr_ae ?_)
    filter_upwards [Lp.coeFn_add ((a:ℂ) • V) U, Lp.coeFn_smul (a:ℂ) V, hv, hu] with x ha hs hvx hux
    rw [ha]
    simp only [Pi.add_apply, hs, Pi.smul_apply, hvx, hux, smul_eq_mul, Function.comp_apply, F]
    congr 1
    push_cast
    ring
  have hTU : U ∈ H21 (m+b) := blockLeft_mem_H21 ((H21 m).starProjection_apply_mem _)
  have hUn : ‖U‖ = ‖q‖ := (blockLeft (b := b)).norm_map _
  change ℓ * (∫ y, |C.field y| ∂ν) * tOf m f g + ‖q‖^2 ≤ ((∫ y, G ℓ y ∂ν) + ∫ y, G (-ℓ) y ∂ν)/2 at hpair
  rcases le_total (∫ y, G (-ℓ) y ∂ν) (∫ y, G ℓ y ∂ν) with hp | hn
  · refine ⟨m+b,U,V,hTU,hV,hUn,hVnorm,horth,?_⟩
    rw [← he]
    change ℓ * ((∫ y, |C.field y| ∂ν) * tOf m f g) + ‖q‖^2 - δ ≤ _
    linarith only [hpair,hp,hδ]
  · refine ⟨m+b,U,-V,hTU,(H21 _).neg_mem hV,hUn,(norm_neg V).trans hVnorm,?_,?_⟩
    · rw [inner_neg_left,horth,neg_zero]
    · rw [smul_neg, ← neg_smul, ← Complex.ofReal_neg, ← he]
      change ℓ * ((∫ y, |C.field y| ∂ν) * tOf m f g) + ‖q‖^2 - δ ≤ _
      linarith only [hpair,hn,hδ]

private def freshOne (x : Fin (1+1) → ℝ) := properCoords 1 x 0

private theorem freshOne_mp : MeasurePreserving freshOne (stdGaussian (1+1)) gaussC :=
  (measurePreserving_eval (fun _ : Fin 1 => gaussC) 0).comp (measurePreserving_properCoords 1)

/-- The centered squared radius on a single fresh complex coordinate. -/
def centeredRadius (x : Fin (1+1) → ℝ) : ℝ := Complex.normSq (freshOne x) - 1

private theorem centeredRadius_cubic {m : ℕ} {z : L2G m} (hz : z ∈ H10 m) :
    ∃ V : L2G (m+1), V ∈ H21 (m+1) ∧ ⇑V =ᵐ[stdGaussian ((m+1)+(m+1))]
      fun x => z (gaussianBlockSplit m 1 x).1 * (centeredRadius (gaussianBlockSplit m 1 x).2 : ℂ) := by
  obtain ⟨c, rfl⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).mp hz
  let j (i : Fin m) := Fin.castAdd 1 i
  let y := Fin.natAdd m (0 : Fin 1)
  let F (i : Fin m) := c i • (2:ℂ)⁻¹ • wickL (m+1) (j i) y y
  refine ⟨∑ i, F i, (H21 _).sum_mem (fun i _ => (H21 _).smul_mem _ ((H21 _).smul_mem _
    (wickL_mem_H21 _ (j i) y y))), ?_⟩
  let μ := stdGaussian ((m+1)+(m+1))
  have ht (i : Fin m) : ⇑(F i) =ᵐ[μ] fun x => c i * ((2:ℂ)⁻¹ * wickFn (m+1) (j i) y y x) := by
    exact (Lp.coeFn_smul (c i) _).trans (((Lp.coeFn_smul ((2:ℂ)⁻¹) _).trans
      ((wickL_ae' _ _ _ _).const_smul ((2:ℂ)⁻¹))).const_smul (c i))
  have mp := measurePreserving_fst.comp (measurePreserving_gaussianBlockSplit m 1)
  filter_upwards [coeFn_finset_sum (m+1) Finset.univ F, ae_all_iff.mpr ht,
    mp.quasiMeasurePreserving.ae_eq_comp (linL_ae m c)] with x hsum hF hlin
  rw [hsum, show (∑ i, c i • zL m i : L2G m) (gaussianBlockSplit m 1 x).1 =
    linC m c (gaussianBlockSplit m 1 x).1 from hlin]
  unfold linC
  rw [Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [hF i]
  have hiy : j i ≠ y := by intro h; have hh := congrArg Fin.val h; simp [j,y] at hh; omega
  simp only [wickFn, wc, hiy, ↓reduceIte, zero_mul, sub_zero]
  dsimp only [centeredRadius, freshOne, j, y]
  simp only [properCoords_eq, zc_gaussianBlockSplit_snd, zc_gaussianBlockSplit_fst]
  have hns (v : ℂ) : ((Complex.normSq (v/(√2 : ℝ)) : ℝ) : ℂ) = conj v * v / 2 := by
    rw [Complex.normSq_eq_conj_mul_self, map_div₀, Complex.conj_ofReal, div_mul_div_comm]
    have hs : (↑(√2) : ℂ) * ↑(√2) = 2 := by norm_cast; exact Real.mul_self_sqrt (by norm_num)
    rw [hs]
  rw [Complex.ofReal_sub, hns, Complex.ofReal_one]
  ring

/-- The centered squared radius is an actual finite cubic carrier with one fresh complex coordinate. -/
def centeredRadiusCarrier : RealCubicCarrier 1 where
  field := centeredRadius
  measurable := (Complex.continuous_normSq.measurable.comp freshOne_mp.measurable).sub measurable_const
  memLp := by
    have h : MemLp Complex.normSq 2 gaussC := (memLp_two_iff_integrable_sq Complex.continuous_normSq.aestronglyMeasurable).mpr
      (integrable_normSq_pow 2 (by norm_num))
    exact (h.sub (memLp_const 1)).comp_measurePreserving freshOne_mp
  mean := by
    have hi : Integrable Complex.normSq gaussC := by simpa using integrable_normSq_pow 1 (by decide)
    rw [show (∫ y, centeredRadius y ∂stdGaussian (1+1)) = (∫ z, Complex.normSq z - 1 ∂gaussC) from
      freshOne_mp.hasLaw.integral_comp (hi.sub (integrable_const 1)).aestronglyMeasurable,
      integral_sub hi (integrable_const 1), integral_normSq_gaussC, integral_const, probReal_univ, one_smul, sub_self]
  second := by
    have hi : Integrable Complex.normSq gaussC := by simpa using integrable_normSq_pow 1 (by decide)
    have hi₂ := integrable_normSq_pow 2 (by decide)
    have he (z : ℂ) : (Complex.normSq z - 1)^2 = Complex.normSq z ^ 2 - 2*Complex.normSq z + 1 := by ring
    rw [show (∫ y, centeredRadius y ^ 2 ∂stdGaussian (1+1)) = (∫ z, (Complex.normSq z-1)^2 ∂gaussC) from
      freshOne_mp.hasLaw.integral_comp (by fun_prop : AEStronglyMeasurable (fun z : ℂ => (Complex.normSq z-1)^2) gaussC)]
    simp_rw [he]
    have hiSub : Integrable (fun z => Complex.normSq z ^ 2 - 2 * Complex.normSq z) gaussC := hi₂.sub (hi.const_mul 2)
    rw [integral_add hiSub (integrable_const 1), integral_sub hi₂ (hi.const_mul 2),
      integral_const_mul, integral_normSq_pow_two, integral_normSq_gaussC, integral_const, probReal_univ, one_smul]
    norm_num
  cubic := centeredRadius_cubic

/-- A correlated full cubic lift with coefficient `2 / e`, realized with one extra coordinate. -/
theorem has_full_centeredRadius_lift {m : ℕ} (hm : 0 < m) {f g : L2G m}
    (hf : f ∈ Unimod (stdGaussian (m+m))) (hg : g ∈ Unimod (stdGaussian (m+m))) :
    HasEllipticCubicLift m (2 / Real.exp 1) f g := by
  have h := centeredRadiusCarrier.has_full_lift hm hf hg
  have he : (∫ y, |centeredRadiusCarrier.field y| ∂stdGaussian (1+1)) = 2 / Real.exp 1 :=
    (freshOne_mp.hasLaw.integral_comp (by fun_prop : AEStronglyMeasurable (fun z : ℂ => |Complex.normSq z-1|) gaussC)).trans integral_abs_normSq_sub_one
  rwa [he] at h

/-- The full physical cubic energy obeys the centered-exponential ellipse. -/
theorem cubic_energy_centeredRadius_ellipse {m : ℕ} (hm : 0 < m) {f g : L2G m}
    (hf : f ∈ Unimod (stdGaussian (m+m))) (hg : g ∈ Unimod (stdGaussian (m+m)))
    {r : ℝ} (hr₀ : 0 ≤ r) (hr : CubicFirstMomentRadius r) :
    ‖QkOf m f g‖^2 + (2 / Real.exp 1 * tOf m f g)^2 ≤ r^2 :=
  cubic_energy_ellipse_of_lift (by positivity) hr₀ (has_full_centeredRadius_lift hm hf hg) hr

/-- The whole phase-pair region through `t=0.25373041` meets the 1.4023 witness budget. -/
theorem quinticPayoff_le_centeredRadius_25373041 {m : ℕ} (hm : 0 < m) {f g : L2G m}
    (hf : f ∈ Unimod (stdGaussian (m+m))) (hg : g ∈ Unimod (stdGaussian (m+m)))
    (ht : tOf m f g ≤ 25373041/100000000) :
    quinticPayoff m (39/50) (779/10000) f g ≤ 10000/14023-1/100000 := by
  have h := cubic_energy_centeredRadius_ellipse hm hf hg (by norm_num) cubicFirstMomentRadius_93
  have hc : (73575888/100000000:ℝ) ≤ 2 / Real.exp 1 := (le_div_iff₀ (Real.exp_pos _)).mpr (by linarith only [Real.exp_one_lt_d9])
  have ht₀ : 0 ≤ tOf m f g := norm_nonneg _
  have hcT := pow_le_pow_left₀ (mul_nonneg (by norm_num : 0 ≤ (73575888/100000000:ℝ)) ht₀) (mul_le_mul_of_nonneg_right hc ht₀) 2
  have hE : ‖QkOf m f g‖^2 + (73575888/100000000 * tOf m f g)^2 ≤ (93/100:ℝ)^2 := by linarith only [h,hcT]
  have hp := quinticPayoff_le_of_cubic_energy_ellipse hm hf hg _ _ hE
  have ht₂ := pow_le_pow_left₀ ht₀ ht 2
  norm_num [ε,massS,massC] at hp ht₂
  linarith only [hp,ht₂]

end
end Grothe.LowerAnalytic

namespace Grothe.Statement

open Grothe.LowerAnalytic Grothe.Lower

/-- The remaining scalar test for the strict finite-matrix lower bound 1.4023
only concerns amplitudes above 0.25373041 and physical cubic energies inside
the centered-radius ellipse that still exceed the existing energy budget. -/
theorem lower_14023_of_remaining_centeredRadius
    (hcap : ∀ n, 0 < n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 25373041 / 100000000 < tOf n f g →
      ‖QkOf n f g‖^2 + (2 / Real.exp 1 * tOf n f g)^2 ≤ (93 / 100:ℝ)^2 →
      10000 / 14023 - 1 / 100000 < 779 / 10000 + (1-779 / 10000)*tOf n f g^2 +
        (39 / 50-779 / 10000)*‖QkOf n f g‖^2 →
      quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000)
    (hne : ∃ K, IsBound K) : 14023 / 10000 < complexGrothendieckConstant := by
  apply lower_14023_of_quintic_largeAmplitude _ hne
  intro n hn f g hf hg _ hE
  rcases le_or_gt (tOf n f g) (25373041 / 100000000) with hs | hl
  · exact quinticPayoff_le_centeredRadius_25373041 hn hf hg hs
  · exact hcap n hn f g hf hg hl (cubic_energy_centeredRadius_ellipse hn hf hg (by norm_num) cubicFirstMomentRadius_93) hE

end Grothe.Statement
