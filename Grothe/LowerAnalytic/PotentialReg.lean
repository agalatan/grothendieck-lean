import Grothe.LowerAnalytic.FibreSup

/-!
# Regularity of the fibre potential (L4, S4.5)

`Ψ_r(−s) = Ψ_r(s)` (`pot_neg`, substituting `y ↦ −y`), hence `Ψ_r` is nondecreasing on `[0, ∞)`
(`pot_mono`), `smax`-Lipschitz there in both directions, and `s ↦ Ψ_r(|s|)` is continuous
(`continuous_pot_abs`); `Ψ_r(δ|p|)` is integrable for `p ∈ L²` (`integrable_pot_comp`).
-/

open MeasureTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable (E : Sym3) (R : Sym2) (ℓ β : ℝ) (a : Fib)

lemma fn_M_smul (y : Fib) (c : ℝ) (z : ℂ) :
    (Fib.M E R (y.smul c)).fn z = (c : ℂ) * (Fib.M E R y).fn z := by
  simp only [Fib.fn, Fib.M, Fib.smul, map_add, map_mul, Complex.conj_ofReal, map_ratCast]
  ring

lemma quad_smul_neg (y : Fib) : Fib.quad E R (y.smul (-1)) = Fib.quad E R y := by
  simp only [Fib.quad, Fib.smul, Sym3.form, Sym2.form, hre_eq, Complex.mul_re, Complex.mul_im,
    Complex.ofReal_re, Complex.ofReal_im, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  norm_num

lemma Jpot_neg (y : Fib) (s : ℝ) : Jpot E R ℓ β a (y.smul (-1)) (-s) = Jpot E R ℓ β a y s := by
  have hp : ∀ z, pfn E R a (y.smul (-1)) (-s) z = -pfn E R a y s z := fun z => by
    rw [pfn_eq, pfn_eq, fn_M_smul]; push_cast; ring
  unfold Jpot
  rw [quad_smul_neg]
  congr 1
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  simp only [hp, sub_neg_eq_add, ← sub_eq_add_neg]
  ring

/-- **`Ψ_r` is even.** -/
theorem pot_neg (hE : E.psdOK = true) (hR : R.psdOK = true) (s : ℝ) :
    pot E R ℓ β a (-s) = pot E R ℓ β a s := by
  refine le_antisymm (ciSup_le fun y => ?_) (ciSup_le fun y => ?_)
  · have := Jpot_neg E R ℓ β a (y.smul (-1)) s
    have e : (y.smul (-1)).smul (-1) = y := by cases y; simp [Fib.smul]
    rw [e] at this
    rw [this]; exact Jpot_le_pot E R ℓ β a hE hR _ s
  · rw [← Jpot_neg]; exact Jpot_le_pot E R ℓ β a hE hR _ _

variable {E R ℓ β a}

/-- **`Ψ_r` is nondecreasing on `[0, ∞)`.** -/
theorem pot_mono (hE : E.psdOK = true) (hR : R.psdOK = true) {s t : ℝ} (hs : 0 ≤ s) (hst : s ≤ t) :
    pot E R ℓ β a s ≤ pot E R ℓ β a t := by
  have ht : 0 ≤ t := hs.trans hst
  rcases ht.eq_or_lt with h0 | h0
  · have : s = t := le_antisymm hst (h0 ▸ hs); rw [this]
  set θ := (t + s) / (2 * t) with hθ
  have hθ0 : 0 ≤ θ := by positivity
  have hθ1 : θ ≤ 1 := by rw [hθ, div_le_one (by positivity)]; linarith
  have hconv := (pot_convexOn E R ℓ β a hE hR).2 (mem_univ t) (mem_univ (-t)) hθ0 (by linarith : 0 ≤ 1 - θ)
    (by ring)
  simp only [smul_eq_mul, pot_neg E R ℓ β a hE hR] at hconv
  have e : θ * t + (1 - θ) * -t = s := by rw [hθ]; field_simp; ring
  rw [e] at hconv
  linarith

/-- The Lipschitz constant `2 E|B·a|`. -/
def lipC (a : Fib) : ℝ := 2 * ∫ z, ‖a.fn z‖ ∂gaussC

lemma lipC_nonneg : 0 ≤ lipC a := by
  unfold lipC; exact mul_nonneg two_pos.le (integral_nonneg fun _ => norm_nonneg _)

lemma pot_abs_dist (hE : E.psdOK = true) (hR : R.psdOK = true) (x y : ℝ) :
    abs (pot E R ℓ β a |x| - pot E R ℓ β a |y|) ≤ lipC a * |x - y| := by
  have key : ∀ s t : ℝ, 0 ≤ s → s ≤ t →
      |pot E R ℓ β a t - pot E R ℓ β a s| ≤ lipC a * (t - s) := by
    intro s t hs hst
    have h1 := pot_lip E R ℓ β a hE hR s t hst
    have h2 := pot_mono (E := E) (R := R) (ℓ := ℓ) (β := β) (a := a) hE hR hs hst
    rw [abs_of_nonneg (by linarith)]
    unfold lipC; linarith
  have hab : |(|x| - |y|)| ≤ |x - y| := abs_abs_sub_abs_le_abs_sub x y
  rcases le_total |x| |y| with h | h
  · have := key |x| |y| (abs_nonneg x) h
    rw [abs_sub_comm]
    refine this.trans (mul_le_mul_of_nonneg_left ?_ lipC_nonneg)
    rw [abs_sub_comm] at hab
    exact (le_abs_self _).trans hab
  · have := key |y| |x| (abs_nonneg y) h
    refine this.trans (mul_le_mul_of_nonneg_left ((le_abs_self _).trans hab) lipC_nonneg)

/-- `s ↦ Ψ_r(|s|)` is continuous. -/
theorem continuous_pot_abs (hE : E.psdOK = true) (hR : R.psdOK = true) :
    Continuous fun s : ℝ => pot E R ℓ β a |s| := by
  refine (LipschitzWith.of_dist_le_mul (K := ⟨lipC a, lipC_nonneg⟩) fun x y => ?_).continuous
  simp only [Real.dist_eq, NNReal.coe_mk]
  exact pot_abs_dist hE hR x y

/-- **Integrability of `Ψ_r(δ|P|)`** for an integrable `|P|`. -/
theorem integrable_pot_comp (hE : E.psdOK = true) (hR : R.psdOK = true) {Ω : Type*}
    [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {P : Ω → ℂ}
    (hP : AEStronglyMeasurable P μ) (hPi : Integrable (fun ω => ‖P ω‖) μ) (δ : ℝ) (hδ : 0 ≤ δ) :
    Integrable (fun ω => pot E R ℓ β a (δ * ‖P ω‖)) μ := by
  have e : (fun ω => pot E R ℓ β a (δ * ‖P ω‖)) = fun ω => pot E R ℓ β a |δ * ‖P ω‖| := by
    funext ω; rw [abs_of_nonneg (mul_nonneg hδ (norm_nonneg _))]
  rw [e]
  have hm : AEStronglyMeasurable (fun ω => pot E R ℓ β a |δ * ‖P ω‖|) μ :=
    (continuous_pot_abs hE hR).comp_aestronglyMeasurable (hP.norm.const_mul δ)
  refine ((integrable_const |pot E R ℓ β a 0|).add ((hPi.const_mul δ).const_mul (lipC a))).mono'
    hm (Filter.Eventually.of_forall fun ω => ?_)
  have h := pot_abs_dist (E := E) (R := R) (ℓ := ℓ) (β := β) (a := a) hE hR (δ * ‖P ω‖) 0
  simp only [abs_zero, sub_zero] at h
  show ‖pot E R ℓ β a |δ * ‖P ω‖|‖ ≤ |pot E R ℓ β a 0| + lipC a * (δ * ‖P ω‖)
  rw [Real.norm_eq_abs]
  have h2 : |δ * ‖P ω‖| = δ * ‖P ω‖ := abs_of_nonneg (mul_nonneg hδ (norm_nonneg _))
  rw [h2] at h ⊢
  have := abs_sub_abs_le_abs_sub (pot E R ℓ β a (δ * ‖P ω‖)) (pot E R ℓ β a 0)
  linarith

end

end Grothe.LowerAnalytic
