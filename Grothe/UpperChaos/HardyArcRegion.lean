import Grothe.UpperChaos.HardyArcSound

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

end Grothe.UpperChaos.HardyArcRegion
