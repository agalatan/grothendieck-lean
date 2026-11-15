-- Grothe/UpperChaos/GaussianAmplitude.lean
import Grothe.UpperChaos.GaussianPair
import Grothe.UpperChaos.SchurIntegrability

/-!
# Gaussian amplitudes retained in the Schur estimate

The prescribed Gaussian amplitude integrates the positive modulus kernel exactly,
sharpening the unrestricted Schur operator bound used by the production Hardy proof.

Agent-ID: codex-9b17. Refs #380.
-/

namespace Grothe.UpperChaos.GaussianAmplitude

open MeasureTheory Sym2R SchurKernel SchurBound SchurIntegrability
open scoped Real ENNReal

noncomputable section

/-- The one-copy Gaussian amplitude. -/
def weight (j : ℝ) (y : ℝ × ℝ) : ℝ :=
  Real.exp (-j * (y.1 ^ 2 + y.2 ^ 2) / 2)

def weightedP1 (B C : Sym2C) (j : ℝ) (y y' : ℝ × ℝ) : ℝ :=
  P1 B C y y' * weight j y * weight j y'

lemma weightedP1_nonneg (B C : Sym2C) (j : ℝ) (y y' : ℝ × ℝ) :
    0 ≤ weightedP1 B C j y y' := by
  unfold weightedP1 P1 weight
  positivity

lemma weightedP1_eq (B C : Sym2C) (j : ℝ) (y y' : ℝ × ℝ) :
    weightedP1 B C j y y' = Real.pi / √(Z B).det *
      pairGaussian (add (shifted (T B C) j) (E B C)) (E B C) y y' := by
  simp only [weightedP1, P1, weight, pairGaussian, Dr, q_add, shifted_q,
    mul_assoc, ← Real.exp_add]
  congr 2
  ring

theorem integrable_weightedP1 (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    Integrable (fun p : (ℝ × ℝ) × (ℝ × ℝ) => weightedP1 B C j p.1 p.2) := by
  have hV := shifted_PD hT hj.le
  have hE := E_PSD B C hZ
  simp_rw [weightedP1_eq]
  exact (integrable_pairGaussian (add_PD_PSD hV hE) _ (complement_PD hV hE)).const_mul _

/-- The exact Gaussian-amplitude integral of the positive one-copy modulus kernel. -/
theorem integral_P1_gaussian (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    ∫ y, ∫ y', weightedP1 B C j y y' =
      4 * Real.pi ^ 3 / (√(Z B).det *
        √((shifted (T B C) j).det *
          (shifted (add (T B C) (smul 2 (E B C))) j).det)) := by
  have hV := shifted_PD hT hj.le
  have hE := E_PSD B C hZ
  have hA := add_PD_PSD hV hE
  have hS := complement_PD hV hE
  simp_rw [weightedP1_eq, integral_const_mul]
  rw [integral_pairGaussian hA _ hS,
    determinant_complement_add _ _ hA.2.ne']
  have he : add (shifted (T B C) j) (smul 2 (E B C)) =
      shifted (add (T B C) (smul 2 (E B C))) j := by
    simp only [add, shifted, smul]
    congr 1 <;> ring
  rw [he]
  ring

lemma measurable_weightedP1 (B C : Sym2C) (j : ℝ) :
    Measurable (Function.uncurry (weightedP1 B C j)) := by
  apply Continuous.measurable
  unfold Function.uncurry weightedP1 P1 weight q bil
  fun_prop

lemma lintegral_weightedP1 (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    ∫⁻ y, ∫⁻ y', ENNReal.ofReal (weightedP1 B C j y y') =
      ENNReal.ofReal (4 * Real.pi ^ 3 / (√(Z B).det *
        √((shifted (T B C) j).det *
          (shifted (add (T B C) (smul 2 (E B C))) j).det))) := by
  have hm := (measurable_weightedP1 B C j).ennreal_ofReal
  have hi := integrable_weightedP1 B C hj hZ hT
  rw [Measure.volume_eq_prod] at hi
  change Measurable (fun p : (ℝ × ℝ) × (ℝ × ℝ) ↦
    ENNReal.ofReal (weightedP1 B C j p.1 p.2)) at hm
  calc
    (∫⁻ y, ∫⁻ y', ENNReal.ofReal (weightedP1 B C j y y')) =
        ∫⁻ p : (ℝ × ℝ) × (ℝ × ℝ), ENNReal.ofReal (weightedP1 B C j p.1 p.2)
          ∂(volume.prod volume) := (lintegral_prod _ hm.aemeasurable).symm
    _ = ENNReal.ofReal (∫ p : (ℝ × ℝ) × (ℝ × ℝ), weightedP1 B C j p.1 p.2
          ∂(volume.prod volume)) :=
      (ofReal_integral_eq_lintegral_ofReal hi
        (Filter.Eventually.of_forall fun p ↦ weightedP1_nonneg B C j p.1 p.2)).symm
    _ = _ := by rw [integral_prod _ hi, integral_P1_gaussian B C hj hZ hT]

/-- The exact four-dimensional Gaussian-amplitude mass in the `L*L` estimate. -/
def mass (B C : Sym2C) (j : ℝ) : ℝ :=
  16 * j ^ 2 * Real.pi ^ 4 / ((Z B).det * (shifted (T B C) j).det *
    (shifted (add (T B C) (smul 2 (E B C))) j).det)

lemma mass_nonneg (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) : 0 ≤ mass B C j := by
  have hV := shifted_PD hT hj.le
  have hE : (smul 2 (E B C)).PSD := fun y => by
    rw [q_smul]
    exact mul_nonneg (by norm_num) (E_PSD B C hZ y)
  have hU := shifted_PD (add_PD_PSD hT hE) hj.le
  unfold mass
  exact div_nonneg (by positivity) (mul_nonneg (mul_nonneg hZ.2.le hV.2.le) hU.2.le)

lemma phih_factor (j : ℝ) (Y : V) :
    phih j Y = (j / Real.pi) * weight j Y.1 * weight j Y.2 := by
  simp only [phih, weight, mul_assoc, ← Real.exp_add]
  congr 2
  ring

/-- Retaining the actual Gaussian amplitudes evaluates the modulus kernel exactly. -/
theorem lintegral_P4_phih (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    ∫⁻ Y : V, ∫⁻ Y' : V,
      ENNReal.ofReal (phih j Y) * ENNReal.ofReal (phih j Y') * SchurBound.P4 B C Y Y' =
        ENNReal.ofReal (mass B C j) := by
  let k : (ℝ × ℝ) → (ℝ × ℝ) → ℝ≥0∞ :=
    fun y y' => ENNReal.ofReal (weightedP1 B C j y y')
  have hkm : Measurable (Function.uncurry k) :=
    (measurable_weightedP1 B C j).ennreal_ofReal
  have hp (Y Y' : V) :
      ENNReal.ofReal (phih j Y) * ENNReal.ofReal (phih j Y') * SchurBound.P4 B C Y Y' =
        ENNReal.ofReal ((j / Real.pi) ^ 2) * (k Y.1 Y'.1 * k Y.2 Y'.2) := by
    have hw : ∀ y, 0 ≤ weight j y := fun y => (Real.exp_pos _).le
    have hf : ∀ Y, 0 ≤ phih j Y := by
      intro Y
      rw [phih_factor]
      exact mul_nonneg (mul_nonneg (div_pos hj Real.pi_pos).le (hw Y.1)) (hw Y.2)
    have hp : ∀ y y', 0 ≤ P1 B C y y' := P1_nonneg B C
    dsimp [k, SchurBound.P4]
    rw [← ENNReal.ofReal_mul (hf Y),
      ← ENNReal.ofReal_mul (mul_nonneg (hf Y) (hf Y')),
      ← ENNReal.ofReal_mul (weightedP1_nonneg B C j Y.1 Y'.1),
      ← ENNReal.ofReal_mul (sq_nonneg _)]
    congr 1
    rw [phih_factor, phih_factor]
    unfold weightedP1
    ring
  simp_rw [hp]
  simp_rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top]
  rw [lintegral_product_kernel k hkm]
  have hk := lintegral_weightedP1 B C hj hZ hT
  change (∫⁻ y, ∫⁻ y', k y y') = _ at hk
  rw [hk]
  have hV := shifted_PD hT hj.le
  have hE : (smul 2 (E B C)).PSD := fun y => by
    rw [q_smul]
    exact mul_nonneg (by norm_num) (E_PSD B C hZ y)
  have hU := shifted_PD (add_PD_PSD hT hE) hj.le
  rw [← ENNReal.ofReal_pow (by positivity), ← ENNReal.ofReal_mul (sq_nonneg _)]
  congr 1
  simp only [div_pow, mul_pow, Real.sq_sqrt hZ.2.le,
    Real.sq_sqrt (mul_nonneg hV.2.le hU.2.le)]
  unfold mass
  have hZd := hZ.2.ne'
  have hVd := hV.2.ne'
  have hUd := hU.2.ne'
  have hpi := Real.pi_ne_zero
  field_simp
  ring

end

end Grothe.UpperChaos.GaussianAmplitude
