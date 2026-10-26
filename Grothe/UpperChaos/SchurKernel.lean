import Grothe.UpperChaos.Gauss2
import Grothe.UpperChaos.Sym2R
import Grothe.UpperChaos.HardyKernel

/-!
# The single-copy Gaussian kernel of the Schur bound

For complex symmetric `B, C` (`Sym2C`) let `L₁(x, y) = exp(−xᵀBx/2 − yᵀBy/2 + xᵀCy)` on `ℝ² × ℝ²`, and
`Z = Re B`, `Cr = Re C`, `Ci = Im C`, `Kr = Cr Z⁻¹ Cr`, `Ki = Ci Z⁻¹ Ci`,

    T = Z − Kr,   E = (Kr + Ki)/2,   Dr = T + E = Z − (Kr − Ki)/2,   W = 2T + E.

If `Z ≻ 0`, the `x`-integral `M₁(y, y') = ∫ conj L₁(x, y) L₁(x, y')` has modulus exactly

    ‖M₁(y, y')‖ = π / √det Z · exp(−yᵀDr y/2 − y'ᵀDr y'/2 + yᵀE y')        (`norm_M1`),

the positive kernel `P` of `data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md`. Matrices `S Z⁻¹ S` are
written `sand S (adj Z) / det Z` (`sand S N = S N S` for symmetric `S, N`).
-/

open MeasureTheory Complex
open scoped Real ComplexConjugate

namespace Grothe.UpperChaos.SchurKernel

open Sym2R

/-- `S N S` for symmetric `S, N` (symmetric). -/
def sand (S N : Sym2R) : Sym2R :=
  ⟨N.a * S.a ^ 2 + 2 * N.b * S.a * S.b + N.c * S.b ^ 2,
   N.a * S.a * S.b + N.b * (S.a * S.c + S.b ^ 2) + N.c * S.b * S.c,
   N.a * S.b ^ 2 + 2 * N.b * S.b * S.c + N.c * S.c ^ 2⟩

/-- Real and imaginary parts of a complex symmetric matrix. -/
def re (S : Sym2C) : Sym2R := ⟨S.a.re, S.b.re, S.c.re⟩
def im (S : Sym2C) : Sym2R := ⟨S.a.im, S.b.im, S.c.im⟩

variable (B C : Sym2C)

/-- `Z = Re B`. -/
def Z : Sym2R := re B
/-- `Kr = Cr Z⁻¹ Cr`, `Ki = Ci Z⁻¹ Ci`. -/
noncomputable def Kr : Sym2R := smul (Z B).det⁻¹ (sand (re C) (Z B).adj)
noncomputable def Ki : Sym2R := smul (Z B).det⁻¹ (sand (im C) (Z B).adj)
/-- `T = Z − Kr`, `E = (Kr + Ki)/2`, `Dr = T + E`, `W = 2T + E`. -/
noncomputable def T : Sym2R := add (Z B) (smul (-1) (Kr B C))
noncomputable def E : Sym2R := smul (1 / 2) (add (Kr B C) (Ki B C))
noncomputable def Dr : Sym2R := add (T B C) (E B C)
noncomputable def W : Sym2R := add (smul 2 (T B C)) (E B C)

/-- The single-copy kernel. -/
noncomputable def L1 (x y : ℝ × ℝ) : ℂ := cexp (-(B.form x x) / 2 - B.form y y / 2 + C.form x y)

/-- `conj L₁(x, y) · L₁(x, y')` as a two-dimensional Gaussian in `x` (quadratic part `2Z`). -/
lemma integrand_eq (y y' : ℝ × ℝ) (x : ℝ × ℝ) :
    conj (L1 B C x y) * L1 B C x y' =
      Gauss2.g (2 * B.a.re) (2 * B.b.re) (2 * B.c.re)
        (conj C.a * y.1 + conj C.b * y.2 + C.a * y'.1 + C.b * y'.2)
        (conj C.b * y.1 + conj C.c * y.2 + C.b * y'.1 + C.c * y'.2) x *
      cexp (-(conj (B.form y y)) / 2 - B.form y' y' / 2) := by
  simp only [L1, Gauss2.g, ← Complex.exp_conj, ← Complex.exp_add, Sym2C.form]
  congr 1
  simp only [map_add, map_sub, map_neg, map_mul, map_div₀, Complex.conj_ofReal, map_ofNat]
  have ha : (B.a : ℂ) + conj B.a = 2 * (B.a.re : ℂ) := by
    rw [Complex.add_conj]; push_cast; ring
  have hb : (B.b : ℂ) + conj B.b = 2 * (B.b.re : ℂ) := by
    rw [Complex.add_conj]; push_cast; ring
  have hc : (B.c : ℂ) + conj B.c = 2 * (B.c.re : ℂ) := by
    rw [Complex.add_conj]; push_cast; ring
  push_cast
  linear_combination (-(x.1 : ℂ) ^ 2 / 2) * ha + (-(x.1 : ℂ) * x.2) * hb + (-(x.2 : ℂ) ^ 2 / 2) * hc

/-- The Gaussian integral `M₁(y, y')` (for `Z ≻ 0`). -/
theorem integral_M1 (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    ∫ x : ℝ × ℝ, conj (L1 B C x y) * L1 B C x y' =
      ((π / √(Z B).det : ℝ) : ℂ) *
        (cexp ((2 * B.c.re * (conj C.a * y.1 + conj C.b * y.2 + C.a * y'.1 + C.b * y'.2) ^ 2
          - 2 * (2 * B.b.re) * (conj C.a * y.1 + conj C.b * y.2 + C.a * y'.1 + C.b * y'.2)
            * (conj C.b * y.1 + conj C.c * y.2 + C.b * y'.1 + C.c * y'.2)
          + 2 * B.a.re * (conj C.b * y.1 + conj C.c * y.2 + C.b * y'.1 + C.c * y'.2) ^ 2)
            / (2 * (4 * (Z B).det))) *
         cexp (-(conj (B.form y y)) / 2 - B.form y' y' / 2)) := by
  obtain ⟨ha, hd⟩ := hZ
  simp only [Z, re, det] at ha hd
  simp_rw [integrand_eq]
  rw [integral_mul_const, Gauss2.integral_g (by linarith) (by nlinarith)]
  have h4 : (2 * B.a.re) * (2 * B.c.re) - (2 * B.b.re) ^ 2 = 4 * (Z B).det := by
    simp only [Z, re, det]; ring
  rw [h4, show √(4 * (Z B).det) = 2 * √(Z B).det by
    rw [Real.sqrt_mul (by norm_num), show √(4 : ℝ) = 2 by
      rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]]
  have hs : 0 < √(Z B).det := Real.sqrt_pos.2 (by simp only [Z, re, det]; linarith)
  rw [mul_assoc]
  congr 1
  · congr 1; field_simp
  · congr 2; simp only [Z, re, det]; push_cast; ring

/-- **The modulus of `M₁`**: the positive Gaussian kernel `P` of the Schur bound. -/
theorem norm_M1 (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    ‖∫ x : ℝ × ℝ, conj (L1 B C x y) * L1 B C x y'‖ =
      π / √(Z B).det * Real.exp (-(Dr B C).q y / 2 - (Dr B C).q y' / 2 + (E B C).bil y y') := by
  have hd : (Z B).det ≠ 0 := hZ.2.ne'
  rw [integral_M1 B C hZ, norm_mul, norm_mul, Complex.norm_of_nonneg (by positivity),
    Complex.norm_exp, Complex.norm_exp, ← Real.exp_add]
  congr 2
  rw [show (2 : ℂ) * (4 * ((Z B).det : ℂ)) = ((8 * (Z B).det : ℝ) : ℂ) by push_cast; ring,
    Complex.div_ofReal_re]
  simp only [Complex.add_re, Complex.sub_re, Complex.mul_re, Complex.mul_im, Complex.add_im,
    Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im, sq,
    Complex.neg_re, Complex.div_ofNat_re, Complex.re_ofNat, Complex.im_ofNat, Sym2C.form]
  simp only [Dr, T, E, Kr, Ki, Z, re, im, sand, smul, add, q, bil, det, adj] at hd ⊢
  field_simp
  ring

end Grothe.UpperChaos.SchurKernel
