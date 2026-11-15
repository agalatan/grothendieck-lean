-- Grothe/UpperChaos/SchurMainGaussian.lean
import Grothe.UpperChaos.GaussianAmplitude
import Grothe.UpperChaos.SchurMain

/-!
# The Schur bound with the prescribed Gaussian amplitude

The weighted response satisfies a pointwise Gaussian envelope. Retaining that
envelope in the positive `L*L` kernel gives an explicit determinant bound for the
continued correlation. This is the estimate used by the improved Hardy budget.

Agent-ID: codex-9b17. Refs #380.
-/

open MeasureTheory Complex
open scoped Real ComplexConjugate ENNReal

namespace Grothe.UpperChaos.SchurMainGaussian

open SchurKernel SchurBound SchurIntegrability Sym2R SchurMain GaussianAmplitude

section main

variable {R : Sym2C} {j : ℝ}
variable (hj : 0 < j) (hZ : (Z (Bj R j)).PD) (hT : (T (Bj R j) R.Cmat).PD)
  {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
  (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
include hj hZ hT hGm hG

/-- The `L*L` energy bound retains the Gaussian amplitude of the input. -/
lemma integral_norm_Lg_sq_le :
    ∫ X : V, ‖∫ Y : V, L4 (Bj R j) R.Cmat (cst R j) X Y * gw j G Y‖ ^ 2 ≤
      ‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j := by
  set B := Bj R j
  set C := R.Cmat
  set c := cst R j
  have hint := integrable_tri B C j hZ hT hj hGm hG c
  refine (LstarL.integral_norm_sq_le (L4 B C c) (gw j G) hint).trans ?_
  simp_rw [norm_M4 B C hZ c]
  set a : V → ℝ≥0∞ := fun Y => ENNReal.ofReal ‖gw j G Y‖
  have hgm := measurable_gw j hGm
  have ham : Measurable a := hgm.norm.ennreal_ofReal
  have hΦm : Measurable fun q : V × V => ‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)) := by
    have : Continuous fun q : V × V => P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2 := by
      simp only [P1, q, bil]
      fun_prop
    exact ((hgm.comp measurable_fst).norm.mul (hgm.comp measurable_snd).norm).mul
      (measurable_const.mul this.measurable)
  have hΦ0 : ∀ q : V × V, 0 ≤ ‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)) := fun q => by
    have := P1_nonneg B C q.1.1 q.2.1
    have := P1_nonneg B C q.1.2 q.2.2
    positivity
  rw [integral_eq_lintegral_of_nonneg_ae (Filter.Eventually.of_forall hΦ0)
    hΦm.aestronglyMeasurable]
  have hP : Measurable fun q : V × V => SchurBound.P4 B C q.1 q.2 := measurable_P4 B C
  have hmeas : Measurable fun q : V × V => a q.1 * a q.2 * SchurBound.P4 B C q.1 q.2 :=
    ((ham.comp measurable_fst).mul (ham.comp measurable_snd)).mul hP
  have hpt : ∀ q : V × V, ENNReal.ofReal (‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)))
      = ENNReal.ofReal (‖c‖ ^ 2) * (a q.1 * a q.2 * SchurBound.P4 B C q.1 q.2) := by
    intro q
    have h1 := P1_nonneg B C q.1.1 q.2.1
    have h2 := P1_nonneg B C q.1.2 q.2.2
    simp only [a, SchurBound.P4]
    rw [← ENNReal.ofReal_mul (norm_nonneg _), ← ENNReal.ofReal_mul (by positivity),
      ← ENNReal.ofReal_mul (by positivity)]
    congr 1
    ring
  have hlin : ∫⁻ q : V × V, ENNReal.ofReal (‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2))) ∂(volume.prod volume)
      = ENNReal.ofReal (‖c‖ ^ 2) *
        ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' := by
    simp_rw [hpt]
    rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top,
      lintegral_prod _ hmeas.aemeasurable]
  rw [hlin]
  have hmass : ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' ≤
      ENNReal.ofReal (mass B C j) := by
    rw [← lintegral_P4_phih B C hj hZ hT]
    refine lintegral_mono fun Y => lintegral_mono fun Y' => ?_
    exact mul_le_mul_right' (mul_le_mul' (ENNReal.ofReal_le_ofReal (norm_gw_le j hG hj Y))
      (ENNReal.ofReal_le_ofReal (norm_gw_le j hG hj Y'))) _
  have hfin : ENNReal.ofReal (‖c‖ ^ 2) *
      ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' ≤
      ENNReal.ofReal (‖c‖ ^ 2 * mass B C j) := by
    rw [ENNReal.ofReal_mul (sq_nonneg _)]
    exact mul_le_mul_left' hmass _
  exact ENNReal.toReal_le_of_le_ofReal
    (mul_nonneg (sq_nonneg _) (mass_nonneg B C hj hZ hT)) hfin

include hFm hF in
/-- The correlation norm is controlled by the exact Gaussian-amplitude energy. -/
theorem norm_HholPair_le :
    ‖HholPair F G R‖ ≤ √(‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j) := by
  set B := Bj R j
  set C := R.Cmat
  set c := cst R j
  have hK : 0 ≤ ‖c‖ ^ 2 * mass B C j :=
    mul_nonneg (sq_nonneg _) (mass_nonneg B C hj hZ hT)
  rw [HholPair_eq R j hj]
  set f := gw j F
  set g := gw j G
  by_cases hint : Integrable
      (fun q : V × V => conj (f q.1) * (L4 B C c q.1 q.2 * g q.2))
  swap
  · rw [integral_undef hint, norm_zero]
    positivity
  rw [Measure.volume_eq_prod] at hint ⊢
  rw [integral_prod _ hint]
  simp_rw [integral_const_mul]
  refine (norm_integral_le_integral_norm _).trans ?_
  simp_rw [norm_mul, Complex.norm_conj]
  have hf2 : Integrable fun X : V => ‖f X‖ ^ 2 := by
    refine (integrable_phih_sq j hj).mono'
      ((measurable_gw j hFm).norm.pow_const 2).aestronglyMeasurable
      (Filter.Eventually.of_forall fun X => ?_)
    rw [Real.norm_of_nonneg (sq_nonneg _)]
    exact pow_le_pow_left₀ (norm_nonneg _) (norm_gw_le j hF hj X) 2
  have hint3 := integrable_tri B C j hZ hT hj hGm hG c
  have hLg2 : Integrable fun X : V => ‖∫ Y : V, L4 B C c X Y * g Y‖ ^ 2 := by
    refine (hint3.integral_prod_left.re).congr (Filter.Eventually.of_forall fun X => ?_)
    simp only [RCLike.re_to_complex]
    exact (LstarL.norm_integral_sq (fun Y => L4 B C c X Y * g Y)).symm
  have hA : ∫ X : V, ‖f X‖ ^ 2 ≤ 1 := by
    rw [← integral_phih_sq j hj]
    exact integral_mono hf2 (integrable_phih_sq j hj) fun X =>
      pow_le_pow_left₀ (norm_nonneg _) (norm_gw_le j hF hj X) 2
  have hB := integral_norm_Lg_sq_le hj hZ hT hGm hG
  refine le_sqrt_of_amgm hA hB hK fun t ht => ?_
  calc ∫ X : V, ‖f X‖ * ‖∫ Y : V, L4 B C c X Y * g Y‖
      ≤ ∫ X : V, (t * ‖f X‖ ^ 2 + ‖∫ Y : V, L4 B C c X Y * g Y‖ ^ 2 / t) / 2 :=
        integral_mono_of_nonneg (Filter.Eventually.of_forall fun X => by positivity)
          (((hf2.const_mul t).add (hLg2.div_const t)).div_const 2)
          (Filter.Eventually.of_forall fun X => mul_le_amgm ht)
    _ = ((t * ∫ X : V, ‖f X‖ ^ 2) +
        (∫ X : V, ‖∫ Y : V, L4 B C c X Y * g Y‖ ^ 2) / t) / 2 := by
      rw [integral_div, integral_add (hf2.const_mul t) (hLg2.div_const t),
        integral_const_mul, integral_div]

end main

/-- The determinant form of the Gaussian-amplitude bound. -/
theorem norm_HholPair_sq_le (R : Sym2C) (j : ℝ) (hj : 0 < j)
    (hZ : (Z (Bj R j)).PD) (hT : (T (Bj R j) R.Cmat).PD)
    {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1) :
    ‖HholPair F G R‖ ^ 2 ≤
      1 / (16 * j ^ 2 * ‖R.detIm‖ ^ 2 * (Z (Bj R j)).det *
        (shifted (T (Bj R j) R.Cmat) j).det *
        (shifted (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det) := by
  have h := norm_HholPair_le hj hZ hT hFm hGm hF hG
  have hK : 0 ≤ ‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j :=
    mul_nonneg (sq_nonneg _) (mass_nonneg _ _ hj hZ hT)
  have hzd := hZ.2
  have hvd := (shifted_PD hT hj.le).2
  have hE : (smul 2 (E (Bj R j) R.Cmat)).PSD := fun y => by
    rw [q_smul]
    exact mul_nonneg (by norm_num) (E_PSD _ _ hZ y)
  have hud := (shifted_PD (add_PD_PSD hT hE) hj.le).2
  have hn : ‖cst R j‖ = ((2 * π) ^ 4)⁻¹ * ‖R.detIm‖⁻¹ * (π / j) ^ 2 := by
    simp only [cst, norm_mul, norm_inv,
      Complex.norm_of_nonneg (by positivity : (0 : ℝ) ≤ (2 * π) ^ 4),
      Complex.norm_of_nonneg (by positivity : (0 : ℝ) ≤ (π / j) ^ 2)]
  calc ‖HholPair F G R‖ ^ 2 ≤ (√(‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j)) ^ 2 :=
      pow_le_pow_left₀ (norm_nonneg _) h 2
    _ = 1 / (16 * j ^ 2 * ‖R.detIm‖ ^ 2 * (Z (Bj R j)).det *
        (shifted (T (Bj R j) R.Cmat) j).det *
        (shifted (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det) := by
      rw [Real.sq_sqrt hK, hn, mass]
      rcases eq_or_ne ‖R.detIm‖ 0 with h0 | h0
      · simp [h0]
      · have : j ≠ 0 := hj.ne'
        have : π ≠ 0 := Real.pi_ne_zero
        field_simp
        ring

end Grothe.UpperChaos.SchurMainGaussian
