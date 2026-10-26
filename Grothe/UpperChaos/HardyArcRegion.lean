import Grothe.UpperChaos.HardyArcSound
import GrotheKernel.HardyArc

/-!
# The region of holomorphy from the gates `Re (I ∓ R)⁻¹ ≻ 0`

`KerPos R l` (the positivity behind the holomorphy of the continued correlation, `HardyHolo.lean`) follows from the
gates `det(I ∓ R) ≠ 0` and `Re (I ∓ R)⁻¹ ≻ 0`, because

    A(x, x) + A(y, y) − 2 C(x, y) = ½ [(I − R)⁻¹(x − y, x − y) + (I + R)⁻¹(x + y, x + y)]

(`A ± C = (I ∓ R)⁻¹`), and a positive definite 2×2 form satisfies `vᵀSv ≥ (det S / tr S) |v|²` by the
square-root-free identity `(a + c) vᵀSv − det S |v|² = (a v₁ + b v₂)² + (b v₁ + c v₂)²` (`kerPos_of_gates`).
Step 4 of the `hardy` plan (the region input of `hardy_of_pair_inputs`).
-/

namespace Grothe.UpperChaos.HardyArcRegion

open Sym2R SchurKernel HardyArcSound

/-- The smallest-eigenvalue bound without square roots. -/
lemma q_ge_of_PD {S : Sym2R} (h : S.PD) (v : ℝ × ℝ) :
    S.det / (S.a + S.c) * (v.1 ^ 2 + v.2 ^ 2) ≤ S.q v := by
  obtain ⟨ha, hd⟩ := h
  have hc : 0 < S.c := by
    simp only [det] at hd; nlinarith [sq_nonneg S.b]
  have hid : (S.a + S.c) * S.q v - S.det * (v.1 ^ 2 + v.2 ^ 2) =
      (S.a * v.1 + S.b * v.2) ^ 2 + (S.b * v.1 + S.c * v.2) ^ 2 := by
    simp only [q, bil, det]; ring
  rw [div_mul_eq_mul_div, div_le_iff₀ (by linarith)]
  nlinarith [sq_nonneg (S.a * v.1 + S.b * v.2), sq_nonneg (S.b * v.1 + S.c * v.2)]

lemma re_form (S : Sym2C) (v : ℝ × ℝ) : (S.form v v).re = (SchurKernel.re S).q v := by
  simp only [Sym2C.form, SchurKernel.re, q, bil, Complex.add_re, Complex.mul_re, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.add_im, mul_zero, zero_mul, add_zero, sub_zero]

/-- **`KerPos` from the gates.** -/
theorem kerPos_of_gates {R : Sym2C} (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0)
    (hP : (SchurKernel.re (invIm R 1)).PD) (hM : (SchurKernel.re (invIm R (-1))).PD) :
    ∃ l > 0, KerPos R l := by
  set Sp := SchurKernel.re (invIm R 1)
  set Sm := SchurKernel.re (invIm R (-1))
  have hμp : 0 < Sp.det / (Sp.a + Sp.c) := by
    have hc : 0 < Sp.c := by have := hP.2; simp only [det] at this; nlinarith [sq_nonneg Sp.b, hP.1]
    exact div_pos hP.2 (by linarith [hP.1])
  have hμm : 0 < Sm.det / (Sm.a + Sm.c) := by
    have hc : 0 < Sm.c := by have := hM.2; simp only [det] at this; nlinarith [sq_nonneg Sm.b, hM.1]
    exact div_pos hM.2 (by linarith [hM.1])
  refine ⟨min (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c)), lt_min hμp hμm, fun x y => ?_⟩
  -- the identity A(x,x) + A(y,y) − 2C(x,y) = ½[(I − R)⁻¹(x − y) + (I + R)⁻¹(x + y)]
  have hid : R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y =
      ((invIm R 1).form (x.1 - y.1, x.2 - y.2) (x.1 - y.1, x.2 - y.2) +
        (invIm R (-1)).form (x.1 + y.1, x.2 + y.2) (x.1 + y.1, x.2 + y.2)) / 2 := by
    rw [Amat_eq R hp hm, Cmat_eq R hp hm]
    simp only [Sym2C.form]; push_cast; ring
  rw [hid, Complex.div_ofNat_re, Complex.add_re, re_form, re_form]
  have h1 := q_ge_of_PD hP (x.1 - y.1, x.2 - y.2)
  have h2 := q_ge_of_PD hM (x.1 + y.1, x.2 + y.2)
  have m1 := min_le_left (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c))
  have m2 := min_le_right (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c))
  simp only at h1 h2
  nlinarith [sq_nonneg (x.1 - y.1), sq_nonneg (x.2 - y.2), sq_nonneg (x.1 + y.1), sq_nonneg (x.2 + y.2)]

/-! ### The disc cover -/

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper

/-- The gates on a box of `R(t)` give `KerPos` at `t`. -/
lemma kerPos_of_kerGates {t : ℂ} {T : CI} (ht : memC t T) (hg : kerGates (Rbox hardyData T) = true) :
    ∃ l > 0, KerPos (Rt t) l := by
  simp only [kerGates, Bool.and_eq_true] at hg
  obtain ⟨⟨⟨hp1, hp2⟩, hP⟩, hM⟩ := hg
  have hR := memSC_Rbox ht
  have hdp := memC_dpm hR false
  have hdm := memC_dpm hR true
  rw [sig_false] at hdp
  rw [sig_true] at hdm
  have hdp0 : dpm (Rt t) 1 ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdp) hp1; simp [h0] at this
  have hdm0 : dpm (Rt t) (-1) ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdm) hp2; simp [h0] at this
  have hIp := memSC_invIm hR false hp1
  have hIm := memSC_invIm hR true hp2
  rw [sig_false] at hIp
  rw [sig_true] at hIm
  exact kerPos_of_gates hdp0 hdm0 (PD_of_gate (memSR_re hIp) hP) (PD_of_gate (memSR_re hIm) hM)

/-- A box passing the outside test has no point with `|t|² < r2/D`. -/
lemma outside_sound {r2 : ℤ} {x y : Ival} (h : outsideDisc r2 x y = true) {t : ℂ} (hx : mem t.re x) (hy : mem t.im y) :
    (r2 : ℝ) / D ≤ Complex.normSq t := by
  have hlo := (mem_add (mem_mul hx hx) (mem_mul hy hy)).1
  have h2 : r2 ≤ (addI (mulI x x) (mulI y y)).lo := by simpa [outsideDisc] using h
  have h3 : (r2 : ℝ) ≤ (addI (mulI x x) (mulI y y)).lo := by exact_mod_cast h2
  rw [div_le_iff₀ D_pos, Complex.normSq_apply]
  linarith

/-- **The quadtree**: every point of a covered box inside the disc has `KerPos`. -/
theorem discCover_sound {r2 : ℤ} :
    ∀ (depth : ℕ) (xlo xhi ylo yhi : ℤ), discCover hardyData r2 depth xlo xhi ylo yhi = true →
      ∀ t : ℂ, mem t.re ⟨xlo, xhi⟩ → mem t.im ⟨ylo, yhi⟩ → Complex.normSq t < (r2 : ℝ) / D →
        ∃ l > 0, KerPos (Rt t) l := by
  intro depth
  induction depth with
  | zero =>
    intro xlo xhi ylo yhi h t hx hy hr
    simp only [discCover, Bool.or_eq_true, Bool.or_false] at h
    rcases h with h | h
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact kerPos_of_kerGates ⟨hx, hy⟩ h
  | succ d ih =>
    intro xlo xhi ylo yhi h t hx hy hr
    simp only [discCover, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with (h | h) | ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact kerPos_of_kerGates ⟨hx, hy⟩ h
    · set xm := (xlo + xhi) / 2
      set ym := (ylo + yhi) / 2
      rcases le_total (t.re * D) xm with hxl | hxl <;> rcases le_total (t.im * D) ym with hyl | hyl
      · exact ih _ _ _ _ h1 t ⟨hx.1, hxl⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h3 t ⟨hx.1, hxl⟩ ⟨hyl, hy.2⟩ hr
      · exact ih _ _ _ _ h2 t ⟨hxl, hx.2⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h4 t ⟨hxl, hx.2⟩ ⟨hyl, hy.2⟩ hr

/-- The radius of the region. -/
def regionR : ℚ := 51863 / 50000

/-- **The region of holomorphy** from the disc check: `KerPos (R(t))` on the open disc of radius `51863/50000`. -/
theorem kerPos_on_ball (h : discCheck hardyData (ofRatHi (regionR ^ 2)) = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (regionR : ℝ), ∃ l > 0, KerPos (Rt t) l := by
  intro t ht
  have hD := D_pos
  rw [Metric.mem_ball, dist_zero_right] at ht
  have hr : (0 : ℝ) < regionR := by norm_num [regionR]
  have hnorm : ‖t‖ < 2 := ht.trans (by norm_num [regionR])
  have hre : |t.re| < 2 := (Complex.abs_re_le_norm t).trans_lt hnorm
  have him : |t.im| < 2 := (Complex.abs_im_le_norm t).trans_lt hnorm
  have hx : mem t.re ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 hre
    constructor <;> push_cast <;> nlinarith
  have hy : mem t.im ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 him
    constructor <;> push_cast <;> nlinarith
  refine discCover_sound 30 _ _ _ _ h t hx hy ?_
  -- |t|² < r² ≤ ofRatHi(r²)/D
  have h1 : Complex.normSq t < (regionR : ℝ) ^ 2 := by
    rw [Complex.normSq_eq_norm_sq]; exact pow_lt_pow_left₀ ht (norm_nonneg _) (by norm_num)
  have h2 : ((regionR ^ 2 : ℚ) : ℝ) * D ≤ (ofRatHi (regionR ^ 2) : ℝ) := le_ofRatHi _
  rw [lt_div_iff₀ hD]
  push_cast at h2
  nlinarith

end Grothe.UpperChaos.HardyArcRegion
