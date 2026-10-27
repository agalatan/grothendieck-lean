import Grothe.LowerAnalytic.Fibre

/-!
# Rotation invariance of the standard complex Gaussian (L4, S5′)

`map_rot_gaussC : gaussC.map (c • ·) = gaussC` for `|c| = 1` (from `integral_two_linear`, the
rotation invariance of the planar Gaussian, and the extensionality of finite Borel measures by
bounded continuous functions), with the integral form `integral_rot_gaussC`.

Consequence for the potential: the rotated responses `rot c f = conj(c) f(c·)` multiply `ξ` by
`conj c` and fix `ζ`, `|d|`, `KᵀMK` and `∫ conj(L) h₀` (`coefFib_rot`, `quad_rot`, `integral_L_rot`),
so the fibre expression at a complex coupling `u` is the real one at `|u|` (`fibreExprC_le_pot`:
`fibreExprC … u ≤ Ψ_r(|u|)`), which is the form the row reduction needs (`u = δ p(w)`).
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The fibre bound with a complex coupling -/

/-- The rotated response `z ↦ conj(c) f(cz)`. -/
def rot (c : ℂ) (f : ℂ → ℂ) (z : ℂ) : ℂ := conj c * f (c * z)

section rotc

variable {c : ℂ} (hc : ‖c‖ = 1)
include hc

omit hc in
lemma conj_mul_self_of_norm (hc' : ‖c‖ = 1) : conj c * c = 1 := by
  rw [Complex.conj_mul', hc']; simp

lemma normSq_mul_c (z : ℂ) : Complex.normSq (c * z) = Complex.normSq z := by
  rw [map_mul, Complex.normSq_eq_norm_sq c, hc]; simp

lemma fB1_rot (z : ℂ) : fB1 (c * z) = fB1 z := by
  unfold fB1; rw [normSq_mul_c hc]

omit hc in
lemma fB2_rot (z : ℂ) : fB2 (c * z) = c ^ 2 * fB2 z := by
  unfold fB2; ring

lemma fB4_rot (z : ℂ) : fB4 (c * z) = c * fB4 z := by
  unfold fB4; rw [normSq_mul_c hc]; ring

lemma Lf_rot (ℓ β : ℝ) (z : ℂ) : Lf ℓ β (c * z) = c * Lf ℓ β z := by
  unfold Lf; rw [normSq_mul_c hc]; ring

lemma integral_rot' (F : ℂ → ℂ) : ∫ z, F (c * z) ∂gaussC = ∫ z, F z ∂gaussC :=
  integral_rot_gaussC c hc F

lemma coefFib_rot (k : ℂ → ℂ) :
    coefFib (rot c k) = ⟨conj c * (coefFib k).e1, conj c * (coefFib k).e2, conj c * (coefFib k).e3,
      (coefFib k).z1, (coefFib k).z2, conj c * conj c * (coefFib k).d⟩ := by
  have h1 := conj_mul_self_of_norm hc
  simp only [coefFib, rot]
  congr 1
  · rw [integral_const_mul, integral_rot' hc (fun z => k z)]
  · rw [← integral_rot' hc (fun z => conj (fB1 z) * k z), ← integral_const_mul]
    congr 1; funext z; rw [fB1_rot hc]; ring
  · rw [← integral_rot' hc (fun z => conj (fB2 z) * k z)]
    have : ∫ z, conj (fB2 z) * (conj c * k (c * z)) ∂gaussC
        = c * ∫ z, conj (fB2 (c * z)) * k (c * z) ∂gaussC := by
      rw [← integral_const_mul]
      congr 1; funext z
      rw [fB2_rot, map_mul, map_pow]
      have : c * (conj c) ^ 2 = conj c := by rw [sq, ← mul_assoc, mul_comm c, h1, one_mul]
      linear_combination (-(conj (fB2 z) * k (c * z))) * this
    rw [this, map_mul]
  · rw [← integral_rot' hc (fun z => conj z * k z)]
    congr 1; funext z; rw [map_mul]; ring
  · rw [← integral_rot' hc (fun z => conj (fB4 z) * k z)]
    congr 1; funext z; rw [fB4_rot hc, map_mul]; ring
  · rw [← integral_rot' hc (fun z => z * k z), ← integral_const_mul]
    congr 1; funext z
    linear_combination (-(z * conj c * k (c * z))) * h1

lemma hre_conj_mul (a b : ℂ) : hre (conj c * a) (conj c * b) = hre a b := by
  have h1 := conj_mul_self_of_norm hc
  have h2 : c * conj c = 1 := by rw [mul_comm]; exact h1
  unfold hre
  rw [show conj (conj c * a) * (conj c * b) = (c * conj c) * (conj a * b) by
    rw [map_mul, Complex.conj_conj]; ring, h2, one_mul]

lemma quad_rot (E : Sym3) (R : Sym2) (K : Fib) :
    Fib.quad E R ⟨conj c * K.e1, conj c * K.e2, conj c * K.e3, K.z1, K.z2, conj c * conj c * K.d⟩
      = Fib.quad E R K := by
  have hn : ‖conj c * conj c * K.d‖ = ‖K.d‖ := by
    rw [norm_mul, norm_mul, Complex.norm_conj, hc]; ring
  simp only [Fib.quad, Sym3.form, hre_conj_mul hc, hn]

lemma integral_L_rot (ℓ β : ℝ) (h : ℂ → ℂ) :
    ∫ z, conj (Lf ℓ β z) * rot c h z ∂gaussC = ∫ z, conj (Lf ℓ β z) * h z ∂gaussC := by
  rw [← integral_rot' hc (fun z => conj (Lf ℓ β z) * h z)]
  congr 1; funext z
  rw [rot, Lf_rot hc, map_mul]; ring

end rotc

/-- **The fibre expression with a complex coupling** `u` (the residual value `q(w)` of the row
reduction): `KᵀMK + 2 Re ∫ conj(L) h₀ + 2 Re(conj(u) (a·ξ))`, `ξ = (K.e1, K.e2, K.e3) = (c₁, c_A, conj c_B)`. -/
def fibreExprC (E : Sym3) (R : Sym2) (ℓ β b1 b2 b3 : ℝ) (f g : ℂ → ℂ) (u : ℂ) : ℝ :=
  Fib.quad E R (coefFib fun z => (f z - g z) / 2)
    + 2 * (∫ z, conj (Lf ℓ β z) * ((f z + g z) / 2) ∂gaussC).re
    + 2 * (conj u * (((1 + b1 : ℝ) : ℂ) * (coefFib fun z => (f z - g z) / 2).e1
      + (b2 : ℂ) * (coefFib fun z => (f z - g z) / 2).e2
      + (b3 : ℂ) * (coefFib fun z => (f z - g z) / 2).e3)).re

lemma ip_aFib (b1 b2 b3 : ℝ) (K : Fib) :
    Fib.ip (aFib b1 b2 b3) K = (((1 + b1 : ℝ) : ℂ) * K.e1 + (b2 : ℂ) * K.e2 + (b3 : ℂ) * K.e3).re := by
  simp only [Fib.ip, aFib, hre_eq, Complex.add_re, Complex.mul_re, Complex.ofReal_re,
    Complex.ofReal_im, Complex.zero_re, Complex.zero_im]
  ring

/-- **The fibre bound at a complex coupling** (S5 with S5′): for measurable responses with
`|f₀|, |g₀| ≤ 1`, the fibre expression at coupling `u` is at most `Ψ_r(|u|)`; the phase of `u` is
removed by the rotation `z ↦ (u/|u|) z` of the fibre. -/
theorem fibreExprC_le_pot (E : Sym3) (R : Sym2) (ℓ β b1 b2 b3 : ℝ) (hE : E.psdOK = true)
    (hR : R.psdOK = true) {f g : ℂ → ℂ} (hfm : Measurable f) (hgm : Measurable g)
    (hfb : ∀ z, ‖f z‖ ≤ 1) (hgb : ∀ z, ‖g z‖ ≤ 1) (u : ℂ) :
    fibreExprC E R ℓ β b1 b2 b3 f g u ≤ pot E R ℓ β (aFib b1 b2 b3) ‖u‖ := by
  by_cases hu : u = 0
  · subst hu
    have := fibreExpr_le_pot E R ℓ β (aFib b1 b2 b3) hE hR hfm.aestronglyMeasurable
      hgm.aestronglyMeasurable hfb hgb 0
    simpa [fibreExpr, fibreExprC] using this
  have hn : (‖u‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 hu
  set c := u / (‖u‖ : ℂ) with hcdef
  have hc : ‖c‖ = 1 := by
    rw [hcdef, norm_div, Complex.norm_real, Real.norm_eq_abs, abs_norm,
      div_self (norm_ne_zero_iff.2 hu)]
  have hm : Measurable fun z : ℂ => c * z := measurable_const.mul measurable_id
  have hfm' : Measurable (rot c f) := measurable_const.mul (hfm.comp hm)
  have hgm' : Measurable (rot c g) := measurable_const.mul (hgm.comp hm)
  have hfb' : ∀ z, ‖rot c f z‖ ≤ 1 := fun z => by
    rw [rot, norm_mul, Complex.norm_conj, hc, one_mul]; exact hfb _
  have hgb' : ∀ z, ‖rot c g z‖ ≤ 1 := fun z => by
    rw [rot, norm_mul, Complex.norm_conj, hc, one_mul]; exact hgb _
  have h := fibreExpr_le_pot E R ℓ β (aFib b1 b2 b3) hE hR hfm'.aestronglyMeasurable
    hgm'.aestronglyMeasurable hfb' hgb' ‖u‖
  refine le_of_eq_of_le ?_ h
  have ek : (fun z => (rot c f z - rot c g z) / 2) = rot c (fun z => (f z - g z) / 2) := by
    funext z; simp only [rot]; ring
  have eL : ∫ z, conj (Lf ℓ β z) * ((rot c f z + rot c g z) / 2) ∂gaussC
      = ∫ z, conj (Lf ℓ β z) * ((f z + g z) / 2) ∂gaussC := by
    rw [← integral_L_rot hc ℓ β (fun z => (f z + g z) / 2)]
    congr 1; funext z; simp only [rot]; ring
  have hu' : conj u = (‖u‖ : ℂ) * conj c := by
    rw [hcdef, map_div₀, Complex.conj_ofReal]; field_simp
  unfold fibreExpr fibreExprC
  rw [ek, eL, coefFib_rot hc, quad_rot hc, ip_aFib, hu']
  congr 1
  rw [show ((‖u‖ : ℂ) * conj c * (((1 + b1 : ℝ) : ℂ) * (coefFib fun z => (f z - g z) / 2).e1
      + (b2 : ℂ) * (coefFib fun z => (f z - g z) / 2).e2
      + (b3 : ℂ) * (coefFib fun z => (f z - g z) / 2).e3))
      = (‖u‖ : ℂ) * (((1 + b1 : ℝ) : ℂ) * (conj c * (coefFib fun z => (f z - g z) / 2).e1)
      + (b2 : ℂ) * (conj c * (coefFib fun z => (f z - g z) / 2).e2)
      + (b3 : ℂ) * (conj c * (coefFib fun z => (f z - g z) / 2).e3)) by ring,
    Complex.re_ofReal_mul]
  ring


end

end Grothe.LowerAnalytic
