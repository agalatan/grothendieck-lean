import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.Prod

/-!
# The weighted Schur test, in bilinear form

For a symmetric kernel `P ≥ 0` and a weight `0 < w < ∞` with `∫ P(x, z) w(z) dz ≤ L w(x)` for every `x`,

    ∫∫ a(x) a(z) P(x, z) ≤ L ∫ a²       for every measurable `a ≥ 0`.

Stated with lower Lebesgue integrals (values in `ℝ≥0∞`), so no integrability hypotheses are needed. Proof:
`2 a(x) a(z) ≤ a(x)² w(z)/w(x) + a(z)² w(x)/w(z)` (AM–GM), integrate, swap the variables in the second term
(Tonelli) and use the symmetry of `P`. This is step 3 of the `hardy` plan
(`data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md`, "the weighted Schur test").
-/

open MeasureTheory
open scoped ENNReal

namespace Grothe.UpperChaos.SchurTest

/-- AM–GM with a positive finite ratio `t`: `2pq ≤ p² t + q² / t`. -/
lemma two_mul_le (p q t : ℝ≥0∞) (ht0 : t ≠ 0) (htt : t ≠ ∞) :
    2 * (p * q) ≤ p ^ 2 * t + q ^ 2 * t⁻¹ := by
  by_cases hp : p = ∞
  · by_cases hq : q = 0
    · simp [hq]
    · have : p ^ 2 * t = ∞ := by simp [hp, ht0]
      simp [this]
  by_cases hq : q = ∞
  · by_cases hp0 : p = 0
    · simp [hp0]
    · have : q ^ 2 * t⁻¹ = ∞ := by simp [hq, htt]
      simp [this]
  lift p to NNReal using hp
  lift q to NNReal using hq
  lift t to NNReal using htt
  have ht : (0 : ℝ) < t := by
    have : t ≠ 0 := by exact_mod_cast ht0
    exact_mod_cast pos_iff_ne_zero.2 this
  rw [← ENNReal.coe_inv (by exact_mod_cast ht0)]
  norm_cast
  rw [← NNReal.coe_le_coe]
  push_cast [NNReal.coe_inv]
  have key : (p : ℝ) ^ 2 * t + q ^ 2 * (t : ℝ)⁻¹ - 2 * (p * q) = ((p : ℝ) * t - q) ^ 2 / t := by
    field_simp; ring
  have : 0 ≤ ((p : ℝ) * t - q) ^ 2 / t := by positivity
  linarith

variable {X : Type*} [MeasurableSpace X] {μ : Measure X} [SFinite μ]

/-- **The weighted Schur test** (bilinear form, lower integrals). -/
theorem lintegral_le (P : X → X → ℝ≥0∞) (hPm : Measurable (Function.uncurry P))
    (hsym : ∀ x z, P x z = P z x) (w : X → ℝ≥0∞) (hwm : Measurable w)
    (hw0 : ∀ x, w x ≠ 0) (hwt : ∀ x, w x ≠ ∞) (L : ℝ≥0∞)
    (hL : ∀ x, ∫⁻ z, P x z * w z ∂μ ≤ L * w x) (a : X → ℝ≥0∞) (ham : Measurable a) :
    ∫⁻ x, ∫⁻ z, a x * a z * P x z ∂μ ∂μ ≤ L * ∫⁻ x, a x ^ 2 ∂μ := by
  -- the weighted half `A = ∫∫ a(x)² (w z / w x) P(x, z)`
  set A := ∫⁻ x, ∫⁻ z, a x ^ 2 * (w z * (w x)⁻¹) * P x z ∂μ ∂μ with hA
  have hPx : ∀ x, Measurable (P x) := fun x => hPm.comp (measurable_prodMk_left (x := x))
  have hPm' : Measurable fun p : X × X => P p.1 p.2 := hPm
  have hAle : A ≤ L * ∫⁻ x, a x ^ 2 ∂μ := by
    rw [← lintegral_const_mul _ (ham.pow_const 2)]
    refine lintegral_mono fun x => ?_
    have e : ∫⁻ z, a x ^ 2 * (w z * (w x)⁻¹) * P x z ∂μ
        = a x ^ 2 * (w x)⁻¹ * ∫⁻ z, P x z * w z ∂μ := by
      have hm : Measurable fun z => P x z * w z := (hPx x).mul hwm
      rw [← lintegral_const_mul _ hm]
      congr 1; ext z; ring
    rw [e]
    calc a x ^ 2 * (w x)⁻¹ * ∫⁻ z, P x z * w z ∂μ ≤ a x ^ 2 * (w x)⁻¹ * (L * w x) := by gcongr; exact hL x
      _ = L * a x ^ 2 * ((w x)⁻¹ * w x) := by ring
      _ = L * a x ^ 2 := by rw [ENNReal.inv_mul_cancel (hw0 x) (hwt x), mul_one]
  -- the other half equals `A` (swap the variables, symmetry of `P`)
  have hB : ∫⁻ x, ∫⁻ z, a z ^ 2 * (w x * (w z)⁻¹) * P x z ∂μ ∂μ = A := by
    rw [lintegral_lintegral_swap]
    · simp_rw [hsym]; rfl
    · exact (((ham.comp measurable_snd).pow_const 2).mul ((hwm.comp measurable_fst).mul
        ((hwm.comp measurable_snd).inv))).mul hPm |>.aemeasurable
  -- pointwise AM–GM
  have hpt : ∀ x z, 2 * (a x * a z * P x z) ≤
      a x ^ 2 * (w z * (w x)⁻¹) * P x z + a z ^ 2 * (w x * (w z)⁻¹) * P x z := by
    intro x z
    have h := two_mul_le (a x) (a z) (w z * (w x)⁻¹)
      (by simp [hw0, hwt]) (ENNReal.mul_ne_top (hwt z) (by simp [hw0]))
    have hinv : (w z * (w x)⁻¹)⁻¹ = w x * (w z)⁻¹ := by
      rw [ENNReal.mul_inv (Or.inl (hw0 z)) (Or.inl (hwt z)), inv_inv, mul_comm]
    rw [hinv] at h
    calc 2 * (a x * a z * P x z) = 2 * (a x * a z) * P x z := by ring
      _ ≤ (a x ^ 2 * (w z * (w x)⁻¹) + a z ^ 2 * (w x * (w z)⁻¹)) * P x z := by gcongr
      _ = _ := by ring
  have h2 : 2 * ∫⁻ x, ∫⁻ z, a x * a z * P x z ∂μ ∂μ ≤ 2 * A := by
    calc 2 * ∫⁻ x, ∫⁻ z, a x * a z * P x z ∂μ ∂μ
        = ∫⁻ x, ∫⁻ z, 2 * (a x * a z * P x z) ∂μ ∂μ := by
          rw [← lintegral_const_mul' _ _ (by simp)]
          congr 1; ext x
          rw [← lintegral_const_mul' _ _ (by simp)]
      _ ≤ ∫⁻ x, ∫⁻ z, (a x ^ 2 * (w z * (w x)⁻¹) * P x z + a z ^ 2 * (w x * (w z)⁻¹) * P x z) ∂μ ∂μ := by
          gcongr with x z; exact hpt x z
      _ = A + ∫⁻ x, ∫⁻ z, a z ^ 2 * (w x * (w z)⁻¹) * P x z ∂μ ∂μ := by
          rw [hA, ← lintegral_add_left (by fun_prop)]
          congr 1; ext x
          have := hPx x
          rw [lintegral_add_left (by fun_prop)]
      _ = A + A := by rw [hB]
      _ = 2 * A := by ring
  have : ∫⁻ x, ∫⁻ z, a x * a z * P x z ∂μ ∂μ ≤ A :=
    (ENNReal.mul_le_mul_iff_right (by norm_num) (by simp)).1 h2
  exact this.trans hAle

end Grothe.UpperChaos.SchurTest
