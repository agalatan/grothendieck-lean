import Grothe.UpperQuad.GaussRemainderEllipse

/-!
# The closed Bernstein ellipse of a panel and its cover by real-centred disks

`ellipsePt_re_im_le`: the points `ellipsePt l h w` with `ρ⁻¹ ≤ |w| ≤ ρ` (the closed ellipse
`E_ρ` of the panel) satisfy `|Re z − c| ≤ r(ρ+ρ⁻¹)/2` and `|Im z| ≤ r(ρ−ρ⁻¹)/2`
(`c = (l+h)/2`, `r = (h−l)/2`).  `exists_disk_cover`: the rectangle `|Re z − c| ≤ A`,
`|Im z| ≤ B` is covered by the `m` disks of radius `R ≥ √((A/m)² + B²)` centred at the real points
`c − A + (2A/m)(j + ½)`.  The analytic bounds of the integrand are checked on these disks.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.Remainder

open Complex

noncomputable section

lemma ellipsePt_re (l h : ℝ) (w : ℂ) :
    (ellipsePt l h w).re = (l + h) / 2 + (h - l) / 2 * ((w.re + w.re / Complex.normSq w) / 2) := by
  simp only [ellipsePt, Complex.add_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.div_ofNat_im, Complex.div_ofNat_re, Complex.inv_im, Complex.add_re, Complex.inv_re,
    Complex.mul_re]
  ring

lemma ellipsePt_im (l h : ℝ) (w : ℂ) :
    (ellipsePt l h w).im = (h - l) / 2 * ((w.im - w.im / Complex.normSq w) / 2) := by
  simp only [ellipsePt, Complex.add_im, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.div_ofNat_im, Complex.div_ofNat_re, Complex.inv_im, Complex.add_re, Complex.inv_re]
  ring

/-- **The closed ellipse lies in its bounding rectangle.** -/
theorem ellipsePt_re_im_le {l h : ℝ} (hlh : l ≤ h) {ρ : ℝ} (hρ : 1 < ρ) {w : ℂ}
    (h1 : ρ⁻¹ ≤ ‖w‖) (h2 : ‖w‖ ≤ ρ) :
    |(ellipsePt l h w).re - (l + h) / 2| ≤ (h - l) / 2 * ((ρ + ρ⁻¹) / 2) ∧
      |(ellipsePt l h w).im| ≤ (h - l) / 2 * ((ρ - ρ⁻¹) / 2) := by
  have hr : 0 ≤ (h - l) / 2 := by linarith
  have hρ0 : 0 < ρ := by linarith
  set t := ‖w‖ with ht
  have ht0 : 0 < t := lt_of_lt_of_le (inv_pos.mpr hρ0) h1
  have hn : Complex.normSq w = t ^ 2 := by rw [Complex.normSq_eq_norm_sq]
  have hre : |w.re| ≤ t := Complex.abs_re_le_norm w
  have him : |w.im| ≤ t := Complex.abs_im_le_norm w
  -- `t + 1/t ≤ ρ + 1/ρ` and `|t − 1/t| ≤ ρ − 1/ρ` on `[1/ρ, ρ]`
  have hsum : t + t⁻¹ ≤ ρ + ρ⁻¹ := by
    have : (t - ρ⁻¹) * (t - ρ) ≤ 0 := by
      apply mul_nonpos_of_nonneg_of_nonpos <;> linarith
    have hti : t * t⁻¹ = 1 := mul_inv_cancel₀ ht0.ne'
    have hρi : ρ * ρ⁻¹ = 1 := mul_inv_cancel₀ hρ0.ne'
    have : t * (t + t⁻¹) ≤ t * (ρ + ρ⁻¹) := by nlinarith
    exact le_of_mul_le_mul_left this ht0
  have hdiff : |t - t⁻¹| ≤ ρ - ρ⁻¹ := by
    have h1' : t⁻¹ ≤ ρ := (inv_le_comm₀ ht0 hρ0).mpr h1
    have h2' : ρ⁻¹ ≤ t⁻¹ := inv_anti₀ ht0 h2
    rw [abs_le]; constructor <;> linarith
  constructor
  · rw [ellipsePt_re, hn, add_sub_cancel_left, abs_mul, abs_of_nonneg hr]
    apply mul_le_mul_of_nonneg_left _ hr
    rw [abs_div, abs_two]
    apply div_le_div_of_nonneg_right _ (by norm_num)
    have : w.re + w.re / t ^ 2 = w.re * (1 + 1 / t ^ 2) := by ring
    rw [this, abs_mul, abs_of_pos (by positivity : (0 : ℝ) < 1 + 1 / t ^ 2)]
    calc |w.re| * (1 + 1 / t ^ 2) ≤ t * (1 + 1 / t ^ 2) :=
          mul_le_mul_of_nonneg_right hre (by positivity)
      _ = t + t⁻¹ := by field_simp
      _ ≤ _ := hsum
  · rw [ellipsePt_im, hn, abs_mul, abs_of_nonneg hr]
    apply mul_le_mul_of_nonneg_left _ hr
    rw [abs_div, abs_two]
    apply div_le_div_of_nonneg_right _ (by norm_num)
    have : w.im - w.im / t ^ 2 = w.im * (1 - 1 / t ^ 2) := by ring
    rw [this, abs_mul]
    calc |w.im| * |1 - 1 / t ^ 2| ≤ t * |1 - 1 / t ^ 2| :=
          mul_le_mul_of_nonneg_right him (abs_nonneg _)
      _ = |t - t⁻¹| := by
          rw [← abs_of_pos ht0, ← abs_mul, abs_of_pos ht0]
          congr 1; field_simp
      _ ≤ _ := hdiff

/-- **The disk cover of a rectangle.** -/
theorem exists_disk_cover {c A B R : ℝ} (hA : 0 < A) {m : ℕ} (hm : 0 < m)
    (hR : (A / m) ^ 2 + B ^ 2 ≤ R ^ 2) (hR0 : 0 ≤ R) {z : ℂ}
    (hre : |z.re - c| ≤ A) (him : |z.im| ≤ B) :
    ∃ j : ℕ, j < m ∧ ‖z - ((c - A + 2 * A / m * (j + 1 / 2) : ℝ) : ℂ)‖ ≤ R := by
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  set u := (z.re - (c - A)) / (2 * A / m) with hu
  have hu0 : 0 ≤ u := by
    rw [hu]; apply div_nonneg _ (by positivity); rw [abs_le] at hre; linarith
  have hum : u ≤ m := by
    rw [hu, div_le_iff₀ (by positivity)]
    rw [abs_le] at hre
    field_simp
    nlinarith
  -- the index
  set j := min (⌊u⌋₊) (m - 1) with hj
  have hjm : j < m := by rw [hj]; omega
  refine ⟨j, hjm, ?_⟩
  have hjr : (j : ℝ) ≤ u ∧ u ≤ j + 1 := by
    by_cases hfl : ⌊u⌋₊ ≤ m - 1
    · have : j = ⌊u⌋₊ := by rw [hj]; exact min_eq_left hfl
      rw [this]
      exact ⟨Nat.floor_le hu0, (Nat.lt_floor_add_one u).le⟩
    · push Not at hfl
      have : j = m - 1 := by rw [hj]; exact min_eq_right hfl.le
      rw [this]
      have hm1 : ((m - 1 : ℕ) : ℝ) = (m : ℝ) - 1 := by
        rw [Nat.cast_sub (by omega)]; simp
      rw [hm1]
      constructor
      · have h1 : ((m - 1 : ℕ) : ℝ) < ⌊u⌋₊ := by exact_mod_cast hfl
        rw [hm1] at h1
        exact h1.le.trans (Nat.floor_le hu0)
      · linarith
  have hdx : |z.re - (c - A + 2 * A / m * (j + 1 / 2))| ≤ A / m := by
    have hz : z.re = (c - A) + 2 * A / m * u := by
      rw [hu]; field_simp; ring
    have hh : 0 < 2 * A / m := by positivity
    have e : (c - A) + 2 * A / m * u - (c - A + 2 * A / m * (j + 1 / 2)) =
        2 * A / m * (u - j - 1 / 2) := by ring
    rw [hz, e, abs_mul, abs_of_pos hh]
    have hab : |u - j - 1 / 2| ≤ 1 / 2 := by rw [abs_le]; constructor <;> linarith [hjr.1, hjr.2]
    calc 2 * A / m * |u - j - 1 / 2| ≤ 2 * A / m * (1 / 2) := mul_le_mul_of_nonneg_left hab hh.le
      _ = A / m := by ring
  have hsq : ‖z - ((c - A + 2 * A / m * (j + 1 / 2) : ℝ) : ℂ)‖ ^ 2 ≤ R ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
    simp only [Complex.sub_re, Complex.ofReal_re, Complex.sub_im, Complex.ofReal_im, sub_zero]
    have h1 : (z.re - (c - A + 2 * A / m * (j + 1 / 2))) ^ 2 ≤ (A / m) ^ 2 := by
      rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) hdx 2
    have h2 : z.im ^ 2 ≤ B ^ 2 := by
      rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) him 2
    nlinarith
  exact (pow_le_pow_iff_left₀ (norm_nonneg _) hR0 two_ne_zero).mp hsq

end

end Grothe.UpperQuad.Remainder
