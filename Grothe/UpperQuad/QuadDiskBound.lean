import Grothe.UpperQuad.QuadIntegrandBound
import Grothe.UpperQuad.QuadUpsilon
import Grothe.UpperQuad.QuadShiftGeom

/-!
# The bound of the extended integrand on a real-centred disk (part (Q) of `hQuad`)

* `vC_taylor`: `v(x + h) = Σ_k t_k(x) h^k` with `t_k(x) = Σ_i C(i+k,k) v_{i+k} x^i` (real `x`), so
  `|v(z) − v(x)| ≤ Σ_{k≥1} |t_k(x)| R^k` on `D(x, R)` (`norm_vC_sub_le`).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open Complex Grothe.UpperChaos Grothe.UpperQuad.Mehler Grothe.UpperQuad.Explicit
open Grothe.UpperQuad.TaylorShift

noncomputable section

/-- The Taylor coefficients of the profile at a real point. -/
def tcoef (k : ℕ) (x : ℝ) : ℝ :=
  ∑ i ∈ Finset.range (12 - k), ((i + k).choose k : ℝ) * vcoef (i + k) * x ^ i

lemma vC_taylor (x : ℝ) (h : ℂ) :
    vC ((x : ℂ) + h) = ∑ k ∈ Finset.range 12, (tcoef k x : ℂ) * h ^ k := by
  unfold vC tcoef
  -- expand each power and extend the binomial sums to `range 12`
  have hexp : ∀ i ∈ Finset.range 12, (vcoef i : ℂ) * ((x : ℂ) + h) ^ i =
      ∑ k ∈ Finset.range 12, (vcoef i : ℂ) * ((i.choose k : ℂ) * (x : ℂ) ^ (i - k) * h ^ k) := by
    intro i hi
    have hi12 : i + 1 ≤ 12 := Finset.mem_range.mp hi
    rw [add_comm (x : ℂ) h, add_pow, Finset.mul_sum, ← Finset.sum_range_add_sum_Ico _ hi12]
    rw [Finset.sum_eq_zero (s := Finset.Ico (i + 1) 12) (fun k hk => by
      rw [Nat.choose_eq_zero_of_lt (by have := (Finset.mem_Ico.mp hk).1; omega)]; simp), add_zero]
    apply Finset.sum_congr rfl
    intro k _
    ring
  rw [Finset.sum_congr rfl hexp, Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro k hk
  have hk12 : k ≤ 12 := by have := Finset.mem_range.mp hk; omega
  push_cast
  rw [Finset.sum_mul]
  -- the terms `i < k` vanish; reindex `i = k + i'`
  rw [show (12 : ℕ) = k + (12 - k) by omega, Finset.sum_range_add]
  rw [Finset.sum_eq_zero (s := Finset.range k) (fun i hi => by
    rw [Nat.choose_eq_zero_of_lt (Finset.mem_range.mp hi)]; simp), zero_add]
  rw [show k + (12 - k) - k = 12 - k by omega]
  apply Finset.sum_congr rfl
  intro i _
  rw [show k + i - k = i by omega, add_comm k i]
  ring

/-- The deviation majorant `Σ_{1 ≤ k ≤ 11} |t_k(x)| R^k`. -/
def devR (x R : ℝ) : ℝ := ∑ k ∈ Finset.range 11, |tcoef (k + 1) x| * R ^ (k + 1)

lemma norm_vC_sub_le (x : ℝ) {R : ℝ} (_hR : 0 ≤ R) {z : ℂ} (hz : ‖z - x‖ ≤ R) :
    ‖vC z - (tcoef 0 x : ℂ)‖ ≤ devR x R := by
  have h := vC_taylor x (z - x)
  rw [add_sub_cancel] at h
  rw [h, Finset.sum_range_succ', pow_zero, mul_one, add_sub_cancel_right]
  unfold devR
  refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun k _ => ?_)
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_pow]
  exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (norm_nonneg _) hz _) (abs_nonneg _)

lemma tcoef_zero (x : ℝ) : (tcoef 0 x : ℂ) = vC (x : ℂ) := by
  have h := vC_taylor x 0
  rw [add_zero] at h
  rw [h, Finset.sum_range_succ', pow_zero, mul_one]
  simp

/-! ### The disk quantities -/

/-- The upper bound of `|Re √z|²` on `D(x, R)`. -/
def X2 (x R : ℝ) : ℝ := (|x| + R + (x + R)) / 2

/-- The upper bound of `|Im √z|²` on `D(x, R)`. -/
def Y2 (x R : ℝ) : ℝ := if R < x then R ^ 2 / (2 * (x - R)) else (|x| + R - (x - R)) / 2

lemma kappa_pos : 0 < kappa := by unfold kappa; exact Real.sqrt_pos.mpr (by positivity)

/-- The disk facts: `|z − x| ≤ R`, a square root `ζ` of `z`, the panel sign `ε`, and the profile
keeps the sign `ε` on the disk (`devR x R < ε t₀(x)`). -/
structure DiskPoint (ε x R : ℝ) (z ζ : ℂ) : Prop where
  hR : 0 ≤ R
  hz : ‖z - x‖ ≤ R
  hζ : ζ ^ 2 = z
  hε : ε = 1 ∨ ε = -1
  hsgn : devR x R < ε * tcoef 0 x

namespace DiskPoint

variable {ε x R : ℝ} {z ζ : ℂ} (h : DiskPoint ε x R z ζ)
include h

lemma abs_eps : |ε| = 1 := by rcases h.hε with h | h <;> simp [h]

lemma eps_sq : ε ^ 2 = 1 := by rcases h.hε with h | h <;> simp [h]

lemma abs_t0 : |tcoef 0 x| = ε * tcoef 0 x := by
  have hd : 0 ≤ devR x R := by
    unfold devR; exact Finset.sum_nonneg fun k _ => mul_nonneg (abs_nonneg _) (pow_nonneg h.hR _)
  have hpos : 0 < ε * tcoef 0 x := lt_of_le_of_lt hd h.hsgn
  rcases h.hε with he | he <;> subst he
  · rw [one_mul] at hpos ⊢; exact abs_of_pos hpos
  · rw [neg_one_mul] at hpos ⊢; exact abs_of_neg (by linarith)

lemma re_ge : x - R ≤ z.re := by
  have h1 := Complex.abs_re_le_norm (z - x)
  simp only [Complex.sub_re, Complex.ofReal_re] at h1
  have := abs_le.mp (h1.trans h.hz); linarith

lemma re_le : z.re ≤ x + R := by
  have h1 := Complex.abs_re_le_norm (z - x)
  simp only [Complex.sub_re, Complex.ofReal_re] at h1
  have := abs_le.mp (h1.trans h.hz); linarith

lemma im_sq_le : z.im ^ 2 ≤ R ^ 2 := by
  have h1 := Complex.abs_im_le_norm (z - x)
  simp only [Complex.sub_im, Complex.ofReal_im, sub_zero] at h1
  rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) (h1.trans h.hz) 2

lemma norm_le : ‖z‖ ≤ |x| + R := by
  have : z = (x : ℂ) + (z - x) := by ring
  calc ‖z‖ = ‖(x : ℂ) + (z - x)‖ := by rw [← this]
    _ ≤ ‖(x : ℂ)‖ + ‖z - x‖ := norm_add_le _ _
    _ ≤ |x| + R := by rw [Complex.norm_real, Real.norm_eq_abs]; linarith [h.hz]

lemma norm_ge : max 0 (|x| - R) ≤ ‖z‖ := by
  apply max_le (norm_nonneg _)
  have := norm_sub_norm_le (x : ℂ) z
  rw [Complex.norm_real, Real.norm_eq_abs, norm_sub_rev] at this
  linarith [h.hz]

lemma norm_zeta_sq : ‖ζ‖ ^ 2 = ‖z‖ := by rw [← norm_pow, h.hζ]

lemma zeta_re_sq_le : ζ.re ^ 2 ≤ X2 x R := by
  rw [re_sq_eq, h.norm_zeta_sq, h.hζ]
  unfold X2
  linarith [h.norm_le, h.re_le]

lemma zeta_im_sq_le : ζ.im ^ 2 ≤ Y2 x R := by
  rw [im_sq_eq, h.norm_zeta_sq, h.hζ]
  unfold Y2
  split_ifs with hx
  · -- `‖z‖ − Re z = (Im z)² / (‖z‖ + Re z)` with `‖z‖ + Re z ≥ 2 (x − R) > 0`
    have hre := h.re_ge
    have hpos : 0 < ‖z‖ + z.re := by
      have := Complex.re_le_norm z; linarith
    have hn : ‖z‖ ^ 2 = z.re ^ 2 + z.im ^ 2 := by
      rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
    have hdiff : ‖z‖ - z.re = z.im ^ 2 / (‖z‖ + z.re) := by
      field_simp; nlinarith [hn]
    rw [hdiff]
    have him := h.im_sq_le
    have h2 : 2 * (x - R) ≤ ‖z‖ + z.re := by
      have := Complex.re_le_norm z; linarith
    have hxR : 0 < 2 * (x - R) := by linarith
    calc z.im ^ 2 / (‖z‖ + z.re) / 2 ≤ R ^ 2 / (2 * (x - R)) / 2 := by
          apply div_le_div_of_nonneg_right _ (by norm_num)
          exact div_le_div₀ (sq_nonneg _) him hxR h2
      _ ≤ R ^ 2 / (2 * (x - R)) := by
          have : 0 ≤ R ^ 2 / (2 * (x - R)) := by positivity
          linarith
  · linarith [h.norm_le, h.re_ge]

lemma norm_vC_ge : ε * tcoef 0 x - devR x R ≤ ‖vC z‖ := by
  have hd := norm_vC_sub_le x h.hR h.hz
  have := norm_sub_norm_le (tcoef 0 x : ℂ) (vC z)
  rw [norm_sub_rev] at this
  rw [Complex.norm_real, Real.norm_eq_abs, h.abs_t0] at this
  linarith

lemma norm_vC_le : ‖vC z‖ ≤ ε * tcoef 0 x + devR x R := by
  have hd := norm_vC_sub_le x h.hR h.hz
  have := norm_sub_norm_le (vC z) (tcoef 0 x : ℂ)
  rw [Complex.norm_real, Real.norm_eq_abs, h.abs_t0] at this
  linarith

lemma norm_wC : ‖wC ε z‖ = kappa * ‖vC z‖ := by
  unfold wC
  rw [norm_mul, norm_mul, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
    Real.norm_eq_abs, h.abs_eps, abs_of_pos kappa_pos, mul_one]

/-- The shift `A = ζ / w(z)`. -/
lemma norm_shift_sq : ‖ζ / wC ε z‖ ^ 2 = ‖z‖ / (kappa ^ 2 * ‖vC z‖ ^ 2) := by
  rw [norm_div, div_pow, h.norm_zeta_sq, h.norm_wC, mul_pow]

lemma norm_shift_sq_le :
    ‖ζ / wC ε z‖ ^ 2 ≤ (|x| + R) / (kappa ^ 2 * (ε * tcoef 0 x - devR x R) ^ 2) := by
  rw [h.norm_shift_sq]
  have hv0 : 0 < ε * tcoef 0 x - devR x R := by linarith [h.hsgn]
  have hk := kappa_pos
  apply div_le_div₀ (add_nonneg (abs_nonneg _) h.hR) h.norm_le
    (mul_pos (pow_pos hk 2) (pow_pos hv0 2))
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  exact pow_le_pow_left₀ hv0.le h.norm_vC_ge 2

lemma norm_shift_sq_ge :
    max 0 (|x| - R) / (kappa ^ 2 * (ε * tcoef 0 x + devR x R) ^ 2) ≤ ‖ζ / wC ε z‖ ^ 2 := by
  rw [h.norm_shift_sq]
  have hv0 : 0 < ε * tcoef 0 x - devR x R := by linarith [h.hsgn]
  have hk := kappa_pos
  have hvz : 0 < ‖vC z‖ := lt_of_lt_of_le hv0 h.norm_vC_ge
  apply div_le_div₀ (norm_nonneg _) h.norm_ge (mul_pos (pow_pos hk 2) (pow_pos hvz 2))
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  exact pow_le_pow_left₀ (norm_nonneg _) h.norm_vC_le 2

/-- The angle defect of the shift (for `R < x`). -/
def kp (ε x R : ℝ) : ℝ :=
  (R / x + devR x R / (ε * tcoef 0 x) * (2 + devR x R / (ε * tcoef 0 x))) /
    (1 - devR x R / (ε * tcoef 0 x)) ^ 2

/-- **The angle of the shift**: `(Im A)² ≤ |A|² κ'²/2` and `|A|²/Re A² ≤ 1/√(1 − κ'²)`. -/
theorem shift_angle (hxR : R < x) (hk : kp ε x R < 1) :
    (ζ / wC ε z).im ^ 2 ≤ ‖ζ / wC ε z‖ ^ 2 * kp ε x R ^ 2 / 2 ∧
      0 < ((ζ / wC ε z) ^ 2).re ∧
      ‖ζ / wC ε z‖ ^ 2 / ((ζ / wC ε z) ^ 2).re ≤ 1 / Real.sqrt (1 - kp ε x R ^ 2) := by
  set t0 := tcoef 0 x with ht0
  set dev := devR x R with hdev
  have hd0 : 0 ≤ dev := by
    rw [hdev]; unfold devR
    exact Finset.sum_nonneg fun k _ => mul_nonneg (abs_nonneg _) (pow_nonneg h.hR _)
  have he0 : 0 < ε * t0 := lt_of_le_of_lt hd0 h.hsgn
  have hx0 : 0 < x := lt_of_le_of_lt h.hR hxR
  have ht0ne : t0 ≠ 0 := by rintro h0; rw [h0, mul_zero] at he0; exact lt_irrefl _ he0
  set r2 := dev / (ε * t0) with hr2
  have hr2lt : r2 < 1 := by rw [hr2, div_lt_one he0]; exact h.hsgn
  -- the two relative perturbations
  set δ₁ : ℂ := (z - x) / x with hδ₁
  set δ₂ : ℂ := (vC z - t0) / t0 with hδ₂
  have h1 : ‖δ₁‖ ≤ R / x := by
    rw [hδ₁, norm_div, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hx0]
    exact div_le_div_of_nonneg_right h.hz hx0.le
  have h2 : ‖δ₂‖ ≤ r2 := by
    rw [hδ₂, norm_div, Complex.norm_real, Real.norm_eq_abs, h.abs_t0, hr2]
    exact div_le_div_of_nonneg_right (norm_vC_sub_le x h.hR h.hz) he0.le
  have hu := ratio_defect h1 h2 hr2lt
  have hkp : kp ε x R = (R / x + r2 * (2 + r2)) / (1 - r2) ^ 2 := rfl
  rw [← hkp] at hu
  obtain ⟨him, hre⟩ := angle_defect hk (by simpa using hu)
  simp only [add_sub_cancel] at him hre
  set u := (1 + δ₁) / (1 + δ₂) ^ 2 with hu_def
  -- `A² = c u` with `c = x/(κ² t₀²) > 0`
  set c : ℝ := x / (kappa ^ 2 * t0 ^ 2) with hc
  have hcpos : 0 < c := by have := kappa_pos; positivity
  have hA2 : (ζ / wC ε z) ^ 2 = (c : ℂ) * u := by
    have hxC : (x : ℂ) ≠ 0 := by exact_mod_cast hx0.ne'
    have htC : (t0 : ℂ) ≠ 0 := by exact_mod_cast ht0ne
    have hz : z = (x : ℂ) * (1 + δ₁) := by
      rw [hδ₁, mul_add, mul_one, mul_div_cancel₀ _ hxC]; ring
    have hv : vC z = (t0 : ℂ) * (1 + δ₂) := by
      rw [hδ₂, mul_add, mul_one, mul_div_cancel₀ _ htC]; ring
    have hne2 : (1 + δ₂) ≠ 0 := by
      intro h0
      have : ‖δ₂‖ = 1 := by
        have : δ₂ = -1 := by linear_combination h0
        rw [this, norm_neg, norm_one]
      linarith
    rw [div_pow, h.hζ, wC, mul_pow, mul_pow, hv, mul_pow]
    have hε2 : ((ε : ℂ)) ^ 2 = 1 := by exact_mod_cast h.eps_sq
    rw [hε2, hc, hu_def]
    push_cast
    rw [hz]
    have hk0 : (kappa : ℂ) ≠ 0 := by exact_mod_cast kappa_pos.ne'
    have ht : (t0 : ℂ) ≠ 0 := by exact_mod_cast ht0ne
    field_simp
  have hn2 : ‖ζ / wC ε z‖ ^ 2 = c * ‖u‖ := by
    rw [← norm_pow, hA2, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hcpos]
  have hre2 : ((ζ / wC ε z) ^ 2).re = c * u.re := by
    rw [hA2, Complex.re_ofReal_mul]
  have hk0 : 0 ≤ kp ε x R := by
    rw [hkp]; apply div_nonneg _ (sq_nonneg _)
    have : 0 ≤ r2 := div_nonneg hd0 he0.le
    exact add_nonneg (div_nonneg h.hR hx0.le) (mul_nonneg this (by linarith))
  have hsq : 0 < Real.sqrt (1 - kp ε x R ^ 2) := Real.sqrt_pos.mpr (by nlinarith)
  have hupos : 0 < ‖u‖ := by
    rcases (norm_nonneg u).lt_or_eq with h0 | h0
    · exact h0
    · exfalso
      have : u = 0 := norm_eq_zero.mp h0.symm
      rw [this] at hu; simp at hu; linarith
  have hurepos : 0 < u.re := lt_of_lt_of_le (mul_pos hsq hupos) hre
  refine ⟨?_, ?_, ?_⟩
  · rw [im_sq_eq, hn2, hre2]
    -- `c(|u| − Re u)/2 ≤ c|u| k²/2` since `Re u ≥ √(1−k²)|u| ≥ (1 − k²)|u|`
    have hroot : 1 - kp ε x R ^ 2 ≤ Real.sqrt (1 - kp ε x R ^ 2) := by
      have h01 : 0 ≤ 1 - kp ε x R ^ 2 := by nlinarith
      have h11 : 1 - kp ε x R ^ 2 ≤ 1 := by nlinarith
      calc 1 - kp ε x R ^ 2 = Real.sqrt ((1 - kp ε x R ^ 2) ^ 2) := (Real.sqrt_sq h01).symm
        _ ≤ Real.sqrt (1 - kp ε x R ^ 2) := Real.sqrt_le_sqrt (by nlinarith)
    have : ‖u‖ - u.re ≤ ‖u‖ * kp ε x R ^ 2 := by
      nlinarith [mul_le_mul_of_nonneg_right hroot hupos.le]
    nlinarith [mul_le_mul_of_nonneg_left this hcpos.le]
  · rw [hre2]; exact mul_pos hcpos hurepos
  · rw [hn2, hre2, mul_div_mul_left _ _ hcpos.ne', div_le_div_iff₀ hurepos hsq, one_mul]
    linarith [hre]

end DiskPoint

/-! ### The two disk bounds -/

/-- The Mehler factor of a disk. -/
def mehB (τ x R : ℝ) : ℝ :=
  τ⁻¹ ^ 501 * ((1 - τ ^ 2)⁻¹ *
    Real.exp (2 * τ * X2 x R / (1 + τ) + 2 * τ * Y2 x R / (1 - τ)))

/-- The large-`|A|` majorant `θ Σ_{m ≤ 501} m! T_m (θ²/a)^m`. -/
def kB (θ a : ℝ) : ℝ :=
  θ * ∑ m ∈ Finset.range 502, (m.factorial : ℝ) * Tm m * (θ ^ 2 / a) ^ m

lemma Tm_nonneg (m : ℕ) : 0 ≤ Tm m := by
  unfold Tm; split_ifs
  · exact zero_le_one
  · exact Finset.sum_nonneg fun c _ => by positivity

lemma kB_mono {θ θ' a a' : ℝ} (hθ : 0 ≤ θ) (hθθ : θ ≤ θ') (ha : 0 < a) (haa : a ≤ a') :
    kB θ a' ≤ kB θ' a := by
  unfold kB
  apply mul_le_mul hθθ _ (Finset.sum_nonneg fun m _ => mul_nonneg (mul_nonneg (Nat.cast_nonneg _)
    (Tm_nonneg m)) (pow_nonneg (div_nonneg (sq_nonneg _) (ha.le.trans haa)) _)) (hθ.trans hθθ)
  apply Finset.sum_le_sum
  intro m _
  apply mul_le_mul_of_nonneg_left _ (mul_nonneg (by positivity) (Tm_nonneg m))
  apply pow_le_pow_left₀ (div_nonneg (sq_nonneg _) (ha.le.trans haa))
  exact div_le_div₀ (sq_nonneg _) (pow_le_pow_left₀ hθ hθθ 2) ha haa

lemma mehB_nonneg {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1) (x R : ℝ) : 0 ≤ mehB τ x R := by
  have h1τ : 0 < 1 - τ ^ 2 := by nlinarith
  unfold mehB
  exact mul_nonneg (pow_nonneg (inv_nonneg.mpr hτ0.le) _)
    (mul_nonneg (inv_nonneg.mpr h1τ.le) (Real.exp_pos _).le)

section

variable {ε x R : ℝ} {z ζ : ℂ}

lemma norm_FextV_sq_le_meh (h : DiskPoint ε x R z ζ) {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1) :
    ‖FextV ε z‖ ^ 2 ≤ Real.exp (-2 * (x - R)) * mehB τ x R *
      sqSum 501 (fun c d => Uext c d (ζ / wC ε z)) := by
  refine (norm_FextV_sq_le ε h.abs_eps h.hζ hτ0 hτ1).trans ?_
  have hsq := sqSum_nonneg 501 (fun c d => Uext c d (ζ / wC ε z))
  apply mul_le_mul_of_nonneg_right _ hsq
  have he : ‖Complex.exp (-z)‖ ^ 2 ≤ Real.exp (-2 * (x - R)) := by
    rw [Complex.norm_exp, ← Real.exp_nat_mul]
    apply Real.exp_le_exp.mpr
    simp only [Complex.neg_re]; push_cast; linarith [h.re_ge]
  have hm : τ⁻¹ ^ 501 * ((1 - τ ^ 2)⁻¹ * Real.exp (mehlerExp τ ζ ζ).re) ≤ mehB τ x R := by
    have h1τ : 0 < 1 - τ ^ 2 := by nlinarith
    unfold mehB
    apply mul_le_mul_of_nonneg_left _ (pow_nonneg (inv_nonneg.mpr hτ0.le) _)
    apply mul_le_mul_of_nonneg_left _ (inv_nonneg.mpr h1τ.le)
    apply Real.exp_le_exp.mpr
    rw [mehlerExp_diag_re τ hτ1 hτ0.le]
    have h1 : 0 < 1 + τ := by linarith
    have h2 : 0 < 1 - τ := by linarith
    apply add_le_add
    · apply div_le_div_of_nonneg_right _ h1.le
      exact mul_le_mul_of_nonneg_left h.zeta_re_sq_le (by positivity)
    · apply div_le_div_of_nonneg_right _ h2.le
      exact mul_le_mul_of_nonneg_left h.zeta_im_sq_le (by positivity)
  have h1τ : 0 < 1 - τ ^ 2 := by nlinarith
  exact mul_le_mul he hm (mul_nonneg (pow_nonneg (inv_nonneg.mpr hτ0.le) _)
    (mul_nonneg (inv_nonneg.mpr h1τ.le) (Real.exp_pos _).le)) (Real.exp_pos _).le

/-- **The disk bound with the off-axis majorant.** -/
theorem disk_bound_Y (h : DiskPoint ε x R z ζ) {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1) {δ : ℝ}
    (hδ : 0 < δ) {b2 : ℝ} (hb2 : (ζ / wC ε z).im ^ 2 ≤ b2) :
    ‖FextV ε z‖ ^ 2 ≤ Real.exp (-2 * (x - R)) * mehB τ x R *
      (∑' r, shiftTerm 501 (Real.sqrt b2 + δ) r) ^ 2 := by
  refine (norm_FextV_sq_le_meh h hτ0 hτ1).trans ?_
  apply mul_le_mul_of_nonneg_left _ (mul_nonneg (Real.exp_pos _).le (mehB_nonneg hτ0 hτ1 x R))
  refine (sqSum_Uext_le_shift _ hδ 501).trans ?_
  have hs0 : 0 ≤ |(ζ / wC ε z).im| + δ := add_nonneg (abs_nonneg _) hδ.le
  have ht0 : 0 ≤ Real.sqrt b2 + δ := add_nonneg (Real.sqrt_nonneg _) hδ.le
  apply pow_le_pow_left₀ (tsum_nonneg fun r => shiftTerm_nonneg _ hs0 r)
  have him : |(ζ / wC ε z).im| ≤ Real.sqrt b2 := by
    rw [← Real.sqrt_sq_eq_abs]; exact Real.sqrt_le_sqrt hb2
  exact Summable.tsum_le_tsum (fun r => shiftTerm_mono 501 r hs0 (by linarith))
    (summable_shiftTerm 501 hs0) (summable_shiftTerm 501 ht0)

/-- **The disk bound with the large-`|A|` majorant.** -/
theorem disk_bound_K (h : DiskPoint ε x R z ζ) {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1)
    (hxR : R < x) (hk : DiskPoint.kp ε x R < 1) {alo : ℝ} (halo : 0 < alo)
    (hle : alo ≤ ‖ζ / wC ε z‖ ^ 2) :
    ‖FextV ε z‖ ^ 2 ≤ Real.exp (-2 * (x - R)) * mehB τ x R *
      kB (1 / Real.sqrt (1 - DiskPoint.kp ε x R ^ 2)) alo := by
  refine (norm_FextV_sq_le_meh h hτ0 hτ1).trans ?_
  apply mul_le_mul_of_nonneg_left _ (mul_nonneg (Real.exp_pos _).le (mehB_nonneg hτ0 hτ1 x R))
  obtain ⟨-, hre, hθ⟩ := h.shift_angle hxR hk
  refine (sqSum_Uext_le_large hre 501).trans ?_
  have hθ0 : 0 ≤ ‖ζ / wC ε z‖ ^ 2 / ((ζ / wC ε z) ^ 2).re := div_nonneg (sq_nonneg _) hre.le
  exact kB_mono hθ0 hθ halo hle

end

end

end Grothe.UpperQuad.QuadRem
