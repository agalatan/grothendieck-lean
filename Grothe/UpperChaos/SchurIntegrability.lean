import Grothe.UpperChaos.SchurBound

/-!
# Integrability for the Schur bound

The `L*L` step (`LstarL.lean`) needs the triple product `conj(L(X, Y) g(Y)) L(X, Y') g(Y')` to be integrable on
`ℝ⁴ × ℝ⁴ × ℝ⁴`. Integrating `X` first, the single-copy integral

    I₁(y, y') = ∫ₓ ‖L₁(x, y)‖ ‖L₁(x, y')‖ = π/√det Z · exp(−yᵀZy/2 − y'ᵀZy'/2 + (y+y')ᵀKr(y+y')/4)

is at most `π/√det Z · w₁(y) w₁(y') ≤ π/√det Z` (`Kr ⪰ 0` and the parallelogram law, `T ⪰ 0`), so the
`X`-integral is dominated by a product of Gaussians in `Y` and `Y'`.
-/

open MeasureTheory Complex
open scoped Real ComplexConjugate

namespace Grothe.UpperChaos.SchurIntegrability

open SchurKernel SchurBound Sym2R

variable (B C : Sym2C)

lemma norm_L1 (x y : ℝ × ℝ) :
    ‖L1 B C x y‖ = Real.exp (-(Z B).q x / 2 - (Z B).q y / 2 + (re C).bil x y) := by
  rw [L1, Complex.norm_exp]
  congr 1
  simp only [Sym2C.form, Complex.add_re, Complex.sub_re, Complex.neg_re, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im, Complex.div_ofNat_re, Z, SchurKernel.re, q, bil, Complex.add_im,
    Complex.mul_im]
  ring

/-- `‖L₁(x, y)‖ ‖L₁(x, y')‖` as a Gaussian in `x` with quadratic part `2Z`. -/
lemma norm_L1_mul_eq (y y' x : ℝ × ℝ) :
    ‖L1 B C x y‖ * ‖L1 B C x y'‖ = Real.exp (-(Z B).q y / 2 - (Z B).q y' / 2) *
      Gauss2.gR (2 * (Z B).a) (2 * (Z B).b) (2 * (Z B).c)
        ((re C).app (y.1 + y'.1, y.2 + y'.2)).1 ((re C).app (y.1 + y'.1, y.2 + y'.2)).2 x := by
  rw [norm_L1, norm_L1, ← Real.exp_add, Gauss2.gR, ← Real.exp_add]
  congr 1
  simp only [q, bil, app]
  ring

lemma integrable_norm_L1_mul (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    Integrable fun x : ℝ × ℝ => ‖L1 B C x y‖ * ‖L1 B C x y'‖ := by
  obtain ⟨ha, hd⟩ := hZ
  simp_rw [norm_L1_mul_eq]
  refine (Gauss2.integrable_gR (by linarith) ?_ _ _).const_mul _
  simp only [det] at hd; nlinarith

/-- The closed form of `I₁`. -/
lemma integral_norm_L1_mul (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    ∫ x : ℝ × ℝ, ‖L1 B C x y‖ * ‖L1 B C x y'‖ =
      π / √(Z B).det * Real.exp (-(Z B).q y / 2 - (Z B).q y' / 2 +
        (Kr B C).q (y.1 + y'.1, y.2 + y'.2) / 4) := by
  have hd := hZ.2
  have ha := hZ.1
  simp_rw [norm_L1_mul_eq]
  rw [integral_const_mul, Gauss2.integral_gR (by linarith) (by simp only [det] at hd; nlinarith)]
  have h4 : 2 * (Z B).a * (2 * (Z B).c) - (2 * (Z B).b) ^ 2 = 4 * (Z B).det := by simp only [det]; ring
  rw [h4, show √(4 * (Z B).det) = 2 * √(Z B).det by
    rw [Real.sqrt_mul (by norm_num), show √(4 : ℝ) = 2 by
      rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]]
  have hs : 0 < √(Z B).det := Real.sqrt_pos.2 hd
  rw [Real.exp_add]
  have hK : (Kr B C).q (y.1 + y'.1, y.2 + y'.2) = (Z B).det⁻¹ *
      ((Z B).c * ((re C).app (y.1 + y'.1, y.2 + y'.2)).1 ^ 2
        - 2 * (Z B).b * ((re C).app (y.1 + y'.1, y.2 + y'.2)).1 * ((re C).app (y.1 + y'.1, y.2 + y'.2)).2
        + (Z B).a * ((re C).app (y.1 + y'.1, y.2 + y'.2)).2 ^ 2) := by
    simp only [Kr]; rw [q_smul, q_sand]; simp only [adj, q, bil]; ring
  rw [hK]
  field_simp

lemma Kr_PSD (hZ : (Z B).PD) : (Kr B C).PSD := fun y => by
  simp only [Kr]
  rw [q_smul, q_sand]
  exact mul_nonneg (inv_pos.2 hZ.2).le (q_nonneg_of_PD (adj_PD hZ) _)

/-- `I₁(y, y') ≤ π/√det Z`. -/
lemma integral_norm_L1_mul_le (hZ : (Z B).PD) (hT : (T B C).PD) (y y' : ℝ × ℝ) :
    ∫ x : ℝ × ℝ, ‖L1 B C x y‖ * ‖L1 B C x y'‖ ≤ π / √(Z B).det := by
  rw [integral_norm_L1_mul B C hZ]
  have hpar : (Kr B C).q (y.1 + y'.1, y.2 + y'.2) + (Kr B C).q (y.1 - y'.1, y.2 - y'.2)
      = 2 * (Kr B C).q y + 2 * (Kr B C).q y' := by simp only [q, bil]; ring
  have h1 := Kr_PSD B C hZ (y.1 - y'.1, y.2 - y'.2)
  have hTq : ∀ v, (T B C).q v = (Z B).q v - (Kr B C).q v := fun v => by
    simp only [T]; rw [q_add, q_smul]; ring
  have h2 := hTq y
  have h3 := hTq y'
  have h4 := q_nonneg_of_PD hT y
  have h5 := q_nonneg_of_PD hT y'
  calc π / √(Z B).det * Real.exp (-(Z B).q y / 2 - (Z B).q y' / 2 + (Kr B C).q (y.1 + y'.1, y.2 + y'.2) / 4)
      ≤ π / √(Z B).det * Real.exp 0 := by gcongr; linarith
    _ = π / √(Z B).det := by simp

variable (j : ℝ)

/-- The square root of the reference Gaussian density of covariance `(2j)⁻¹ I` on `ℝ⁴`. -/
noncomputable def phih (Y : V) : ℝ := j / π * Real.exp (-(j * (Y.1.1 ^ 2 + Y.1.2 ^ 2 + Y.2.1 ^ 2 + Y.2.2 ^ 2)) / 2)

lemma phih_nonneg (hj : 0 < j) (Y : V) : 0 ≤ phih j Y := by unfold phih; positivity

lemma continuous_phih : Continuous (phih j) := by unfold phih; fun_prop

lemma integrable_phih (hj : 0 < j) : Integrable (phih j) (volume : Measure V) := by
  have g := Gauss2.integrable_gR (a := j) (b := 0) (c := j) hj (by nlinarith) 0 0
  have h := (g.mul_prod g).const_mul (j / π)
  rw [Measure.volume_eq_prod]
  refine h.congr (Filter.Eventually.of_forall fun Y => ?_)
  simp only [phih, Gauss2.gR]
  rw [mul_assoc, ← Real.exp_add]
  congr 2; ring

/-- The weighted response `g(Y) = G(Y) φ^{1/2}(Y)`. -/
noncomputable def gw (G : ℂ × ℂ → ℂ) (Y : V) : ℂ := G (toC2 Y.1 Y.2) * (phih j Y : ℂ)

lemma norm_gw_le {G : ℂ × ℂ → ℂ} (hG : ∀ u, ‖G u‖ ≤ 1) (hj : 0 < j) (Y : V) : ‖gw j G Y‖ ≤ phih j Y := by
  rw [gw, norm_mul, Complex.norm_of_nonneg (phih_nonneg j hj Y)]
  exact mul_le_of_le_one_left (phih_nonneg j hj Y) (hG _)

lemma continuous_L1 : Continuous fun p : (ℝ × ℝ) × (ℝ × ℝ) => L1 B C p.1 p.2 := by
  unfold L1; simp only [Sym2C.form]; fun_prop

lemma norm_tri (c : ℂ) (G : ℂ × ℂ → ℂ) (X : V) (q : V × V) :
    ‖LstarL.tri (L4 B C c) (gw j G) (X, q)‖ = ‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖) *
      ((‖L1 B C X.1 q.1.1‖ * ‖L1 B C X.1 q.2.1‖) * (‖L1 B C X.2 q.1.2‖ * ‖L1 B C X.2 q.2.2‖)) := by
  simp only [LstarL.tri, L4, norm_mul, Complex.norm_conj]
  ring

/-- **Integrability of the triple product** (gates `Z ≻ 0`, `T ≻ 0`, any `j > 0`, measurable `‖G‖ ≤ 1`). -/
theorem integrable_tri (hZ : (Z B).PD) (hT : (T B C).PD) (hj : 0 < j) {G : ℂ × ℂ → ℂ}
    (hGm : Measurable G) (hG : ∀ u, ‖G u‖ ≤ 1) (c : ℂ) :
    Integrable (LstarL.tri (L4 B C c) (gw j G)) ((volume : Measure V).prod ((volume : Measure V).prod volume)) := by
  have hL := continuous_L1 B C
  have hgm : Measurable (gw j G) := by
    unfold gw
    exact (hGm.comp (by unfold toC2; fun_prop : Continuous fun Y : V => toC2 Y.1 Y.2).measurable).mul
      (Complex.measurable_ofReal.comp (continuous_phih j).measurable)
  have hL4 : Measurable fun p : V × V => L4 B C c p.1 p.2 := by
    unfold L4
    exact (measurable_const.mul ((hL.comp (by fun_prop : Continuous fun p : V × V => (p.1.1, p.2.1))).mul
      (hL.comp (by fun_prop : Continuous fun p : V × V => (p.1.2, p.2.2)))).measurable)
  have htm : Measurable (LstarL.tri (L4 B C c) (gw j G)) := by
    unfold LstarL.tri
    exact (Complex.continuous_conj.measurable.comp ((hL4.comp (measurable_fst.prodMk
        (measurable_fst.comp measurable_snd))).mul (hgm.comp (measurable_fst.comp measurable_snd)))).mul
      ((hL4.comp (measurable_fst.prodMk (measurable_snd.comp measurable_snd))).mul
        (hgm.comp (measurable_snd.comp measurable_snd)))
  refine (integrable_prod_iff' htm.aestronglyMeasurable).2 ⟨Filter.Eventually.of_forall fun q => ?_, ?_⟩
  · -- the `X`-integrability: a product of two two-dimensional Gaussians
    have hx := (integrable_norm_L1_mul B C hZ q.1.1 q.2.1).mul_prod (integrable_norm_L1_mul B C hZ q.1.2 q.2.2)
    rw [← Measure.volume_eq_prod] at hx
    refine Integrable.mono' (hx.const_mul (‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖)))
      (htm.comp (measurable_id.prodMk measurable_const)).aestronglyMeasurable
      (Filter.Eventually.of_forall fun X => le_of_eq (norm_tri B C j c G X q))
  · -- the `X`-integral of the norm is dominated by `‖c‖² (π/√det Z)² φ(Y) φ(Y')`
    have hφ := (integrable_phih j hj).mul_prod (integrable_phih j hj)
    rw [← Measure.volume_eq_prod] at hφ
    refine Integrable.mono' (hφ.const_mul (‖c‖ ^ 2 * (π / √(Z B).det) ^ 2))
      (htm.norm.stronglyMeasurable.integral_prod_left'.aestronglyMeasurable) (Filter.Eventually.of_forall fun q => ?_)
    have e : ∫ X : V, ‖LstarL.tri (L4 B C c) (gw j G) (X, q)‖ = ‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖) *
        ((∫ x : ℝ × ℝ, ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖) * ∫ ξ : ℝ × ℝ, ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖) := by
      simp_rw [norm_tri]
      rw [integral_const_mul, Measure.volume_eq_prod, integral_prod_mul
        (fun x : ℝ × ℝ => ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖) (fun ξ : ℝ × ℝ => ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖)]
    rw [Real.norm_of_nonneg (integral_nonneg fun X => norm_nonneg _), e]
    have hI1 := integral_norm_L1_mul_le B C hZ hT q.1.1 q.2.1
    have hI2 := integral_norm_L1_mul_le B C hZ hT q.1.2 q.2.2
    have hI1n : 0 ≤ ∫ x : ℝ × ℝ, ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖ := integral_nonneg fun x => by positivity
    have hI2n : 0 ≤ ∫ ξ : ℝ × ℝ, ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖ := integral_nonneg fun x => by positivity
    have hg1 := norm_gw_le j hG hj q.1
    have hg2 := norm_gw_le j hG hj q.2
    calc ‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖) *
          ((∫ x : ℝ × ℝ, ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖) * ∫ ξ : ℝ × ℝ, ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖)
        ≤ ‖c‖ ^ 2 * (phih j q.1 * phih j q.2) * ((π / √(Z B).det) * (π / √(Z B).det)) := by
          have hp1 := phih_nonneg j hj q.1
          have hp2 := phih_nonneg j hj q.2
          gcongr
      _ = ‖c‖ ^ 2 * (π / √(Z B).det) ^ 2 * (phih j q.1 * phih j q.2) := by ring

end Grothe.UpperChaos.SchurIntegrability
