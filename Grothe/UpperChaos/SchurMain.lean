import Grothe.UpperChaos.SchurIntegrability
import Grothe.UpperChaos.HardyHolo

/-!
# The Gaussian Schur bound for the continued correlation

For a complex symmetric `R` and `j > 0` put `B = A − jI`, `C = RA` (`A = (I − R²)⁻¹`, `Sym2C.Amat`, `Sym2C.Cmat`),
`Z = Re B`, `T = Z − Cr Z⁻¹ Cr`, `E = (Cr Z⁻¹ Cr + Ci Z⁻¹ Ci)/2`, `W = 2T + E`. If `Z ≻ 0` and `T ≻ 0`, then for all
measurable `F, G` with `‖F‖, ‖G‖ ≤ 1`

    ‖HholPair F G R‖² ≤ 1 / (64 j⁴ |det(I − R²)|² det Z det W)        (`norm_HholPair_sq_le`),

the bound (1) of `data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md` (step 3 of the `hardy` plan).

Proof: the kernel factors as `φ^{1/2}(X) L(X, Y) φ^{1/2}(Y)` with `φ` the Gaussian of covariance `(2j)⁻¹ I`
(`kHol_eq`); then `|H| ≤ ∫ ‖f‖ ‖Lg‖`, a parametric AM–GM with `∫ ‖f‖² ≤ 1`, the `L*L` step (`LstarL.lean`),
the exact kernel modulus (`SchurBound.norm_M4`) and the Schur test on `ℝ⁴` (`SchurBound.schur4`).
-/

open MeasureTheory Complex
open scoped Real ComplexConjugate ENNReal

namespace Grothe.UpperChaos.SchurMain

open SchurKernel SchurBound SchurIntegrability Sym2R

variable (R : Sym2C) (j : ℝ)

/-- `B = A − jI`. -/
noncomputable def Bj : Sym2C := ⟨R.Amat.a - j, R.Amat.b, R.Amat.c - j⟩

/-- The kernel constant `c = (2π)⁻⁴ det(I − R²)⁻¹ (π/j)²`. -/
noncomputable def cst : ℂ := (((2 * π) ^ 4 : ℝ) : ℂ)⁻¹ * R.detIm⁻¹ * (((π / j) ^ 2 : ℝ) : ℂ)

lemma exp_factor (K c p q e e2 e3 r1 r2 : ℂ) (h : e = r1 + e2 + e3 + r2) (hK : K = c * p * q) :
    K * cexp e = (p * cexp r1) * (c * (cexp e2 * cexp e3)) * (q * cexp r2) := by
  rw [h, hK, Complex.exp_add, Complex.exp_add, Complex.exp_add]; ring

/-- **The kernel factorization** `k_R(X, Y) = φ^{1/2}(X) L(X, Y) φ^{1/2}(Y)`. -/
lemma kHol_eq (hj : 0 < j) (X Y : V) :
    kHol R X.1 X.2 Y.1 Y.2 = (phih j X : ℂ) * L4 (Bj R j) R.Cmat (cst R j) X Y * (phih j Y : ℂ) := by
  have hj' : (j : ℂ) ≠ 0 := by exact_mod_cast hj.ne'
  have hπ : (π : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  simp only [kHol, L4, L1, phih, cst, Bj, kExp, Sym2C.form]
  push_cast
  refine exp_factor _ _ ((j : ℂ) / π) ((j : ℂ) / π) _ _ _ _ _ ?_ ?_
  · ring
  · field_simp

/-- The continued correlation in operator form, `∫∫ conj f(X) L(X, Y) g(Y)`. -/
lemma HholPair_eq (hj : 0 < j) (F G : ℂ × ℂ → ℂ) :
    HholPair F G R = ∫ q : V × V, conj (gw j F q.1) * (L4 (Bj R j) R.Cmat (cst R j) q.1 q.2 * gw j G q.2) := by
  unfold HholPair
  congr 1; ext q
  rw [kHol_eq R j hj q.1 q.2]
  simp only [gw, map_mul, Complex.conj_ofReal]
  ring

lemma phih_sq (Y : V) : phih j Y ^ 2 = (j / π) ^ 2 *
    (Gauss2.gR (2 * j) 0 (2 * j) 0 0 Y.1 * Gauss2.gR (2 * j) 0 (2 * j) 0 0 Y.2) := by
  simp only [phih, Gauss2.gR, mul_pow, ← Real.exp_add, ← Real.exp_nat_mul]
  congr 2; push_cast; ring

lemma integrable_phih_sq (hj : 0 < j) : Integrable (fun Y : V => phih j Y ^ 2) := by
  have g := Gauss2.integrable_gR (a := 2 * j) (b := 0) (c := 2 * j) (by linarith) (by nlinarith) 0 0
  have h := (g.mul_prod g).const_mul ((j / π) ^ 2)
  rw [← Measure.volume_eq_prod] at h
  exact h.congr (Filter.Eventually.of_forall fun Y => (phih_sq j Y).symm)

lemma integral_phih_sq (hj : 0 < j) : ∫ Y : V, phih j Y ^ 2 = 1 := by
  simp_rw [phih_sq]
  rw [integral_const_mul, Measure.volume_eq_prod, integral_prod_mul (fun y : ℝ × ℝ => Gauss2.gR (2 * j) 0 (2 * j) 0 0 y)
    (fun y : ℝ × ℝ => Gauss2.gR (2 * j) 0 (2 * j) 0 0 y), Gauss2.integral_gR (by linarith) (by nlinarith)]
  have h4 : 2 * j * (2 * j) - (0 : ℝ) ^ 2 = (2 * j) ^ 2 := by ring
  rw [h4, Real.sqrt_sq (by linarith)]
  have hπ : (π : ℝ) ≠ 0 := Real.pi_ne_zero
  have : j ≠ 0 := hj.ne'
  simp
  field_simp

/-- If `x ≤ (t A + B / t)/2` for every `t > 0`, `A ≤ 1` and `B ≤ K`, then `x ≤ √K`. -/
lemma le_sqrt_of_amgm {x A Bv K : ℝ} (hA : A ≤ 1) (hB : Bv ≤ K) (hK : 0 ≤ K)
    (h : ∀ t : ℝ, 0 < t → x ≤ (t * A + Bv / t) / 2) : x ≤ √K := by
  rcases hK.lt_or_eq with hK | hK
  · have hs : 0 < √K := Real.sqrt_pos.2 hK
    refine (h _ hs).trans ?_
    have : Bv / √K ≤ K / √K := div_le_div_of_nonneg_right hB hs.le
    have hKs : K / √K = √K := by rw [div_eq_iff hs.ne', Real.mul_self_sqrt hK.le]
    nlinarith
  · subst hK
    simp only [Real.sqrt_zero]
    refine le_of_forall_pos_lt_add fun ε hε => ?_
    have := h ε hε
    have : Bv / ε ≤ 0 := div_nonpos_of_nonpos_of_nonneg hB hε.le
    nlinarith

/-- Pointwise AM–GM `ab ≤ (t a² + b²/t)/2`. -/
lemma mul_le_amgm {a b t : ℝ} (ht : 0 < t) : a * b ≤ (t * a ^ 2 + b ^ 2 / t) / 2 := by
  have : t * a ^ 2 + b ^ 2 / t - 2 * (a * b) = (t * a - b) ^ 2 / t := by field_simp; ring
  have : 0 ≤ (t * a - b) ^ 2 / t := by positivity
  linarith

section main

variable {R j}
variable (hj : 0 < j) (hZ : (Z (Bj R j)).PD) (hT : (T (Bj R j) R.Cmat).PD)
  {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
include hj hZ hT hGm hG

/-- `∫ ‖Lg‖² ≤ ‖c‖² λ₁²` (the `L*L` step, the exact kernel modulus and the Schur test). -/
lemma integral_norm_Lg_sq_le :
    ∫ X : V, ‖∫ Y : V, L4 (Bj R j) R.Cmat (cst R j) X Y * gw j G Y‖ ^ 2 ≤
      ‖cst R j‖ ^ 2 * lam1 (Bj R j) R.Cmat ^ 2 := by
  set B := Bj R j
  set C := R.Cmat
  set c := cst R j
  have hint := integrable_tri B C j hZ hT hj hGm hG c
  refine (LstarL.integral_norm_sq_le (L4 B C c) (gw j G) hint).trans ?_
  simp_rw [norm_M4 B C hZ c]
  -- the integrand as an `ℝ≥0∞` product
  set a : V → ℝ≥0∞ := fun Y => ENNReal.ofReal ‖gw j G Y‖
  have hgm : Measurable (gw j G) := by
    unfold gw
    exact (hGm.comp (by unfold toC2; fun_prop : Continuous fun Y : V => toC2 Y.1 Y.2).measurable).mul
      (Complex.measurable_ofReal.comp (continuous_phih j).measurable)
  have ham : Measurable a := hgm.norm.ennreal_ofReal
  have hP1c := continuous_P1 B C
  have hΦm : Measurable fun q : V × V => ‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)) := by
    have : Continuous fun q : V × V => P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2 := by
      simp only [P1, q, bil]; fun_prop
    exact ((hgm.comp measurable_fst).norm.mul (hgm.comp measurable_snd).norm).mul
      (measurable_const.mul this.measurable)
  have hΦ0 : ∀ q : V × V, 0 ≤ ‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)) := fun q => by
    have := P1_nonneg B C q.1.1 q.2.1; have := P1_nonneg B C q.1.2 q.2.2; positivity
  rw [integral_eq_lintegral_of_nonneg_ae (Filter.Eventually.of_forall hΦ0) hΦm.aestronglyMeasurable]
  have hP : Measurable fun q : V × V => SchurBound.P4 B C q.1 q.2 := measurable_P4 B C
  have hmeas : Measurable fun q : V × V => a q.1 * a q.2 * SchurBound.P4 B C q.1 q.2 :=
    ((ham.comp measurable_fst).mul (ham.comp measurable_snd)).mul hP
  have hpt : ∀ q : V × V, ENNReal.ofReal (‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)))
      = ENNReal.ofReal (‖c‖ ^ 2) * (a q.1 * a q.2 * SchurBound.P4 B C q.1 q.2) := by
    intro q
    have h1 := P1_nonneg B C q.1.1 q.2.1
    have h2 := P1_nonneg B C q.1.2 q.2.2
    simp only [a, SchurBound.P4]
    rw [← ENNReal.ofReal_mul (norm_nonneg _), ← ENNReal.ofReal_mul (by positivity),
      ← ENNReal.ofReal_mul (by positivity)]
    congr 1; ring
  have hlin : ∫⁻ q : V × V, ENNReal.ofReal (‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2))) ∂(volume.prod volume)
      = ENNReal.ofReal (‖c‖ ^ 2) * ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' := by
    simp_rw [hpt]
    rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top, lintegral_prod _ hmeas.aemeasurable]
  rw [hlin]
  have ha2 : ∫⁻ Y : V, a Y ^ 2 ≤ 1 := by
    calc ∫⁻ Y : V, a Y ^ 2 ≤ ∫⁻ Y : V, ENNReal.ofReal (phih j Y ^ 2) := by
          refine lintegral_mono fun Y => ?_
          simp only [a]
          rw [← ENNReal.ofReal_pow (norm_nonneg _)]
          exact ENNReal.ofReal_le_ofReal (pow_le_pow_left₀ (norm_nonneg _) (norm_gw_le j hG hj Y) 2)
      _ = ENNReal.ofReal (∫ Y : V, phih j Y ^ 2) :=
          (ofReal_integral_eq_lintegral_ofReal (integrable_phih_sq j hj)
            (Filter.Eventually.of_forall fun Y => sq_nonneg _)).symm
      _ = 1 := by rw [integral_phih_sq j hj, ENNReal.ofReal_one]
  have hS := schur4 B C hZ hT a ham
  have hfin : ENNReal.ofReal (‖c‖ ^ 2) * ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y'
      ≤ ENNReal.ofReal (‖c‖ ^ 2 * lam1 B C ^ 2) := by
    calc ENNReal.ofReal (‖c‖ ^ 2) * ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y'
        ≤ ENNReal.ofReal (‖c‖ ^ 2) * (ENNReal.ofReal (lam1 B C ^ 2) * 1) := by
          gcongr; exact hS.trans (by gcongr)
      _ = ENNReal.ofReal (‖c‖ ^ 2 * lam1 B C ^ 2) := by
          rw [mul_one, ← ENNReal.ofReal_mul (by positivity)]
  exact ENNReal.toReal_le_of_le_ofReal (by positivity) hfin

end main

end Grothe.UpperChaos.SchurMain
