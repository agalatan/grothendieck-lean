import Grothe.UpperQuad.TwistMatrixCoefficient
import Grothe.UpperQuad.PolynomialPhaseExpansion
import Grothe.UpperChaos.DampedMoments

/-!
# Integral representation and Bessel bound for the twisted coefficient matrix

Each matrix entry is a Hermite coefficient of one damped, dilated column source. The Gaussian
change of scale accounts for the inverse rate already present in `matrixCoefficient`; Bessel's
inequality therefore introduces no further Jacobian.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorization

open MeasureTheory Complex MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open PolynomialHermite PolynomialRescale PolynomialDilationNorm
open scoped ComplexConjugate InnerProductSpace

noncomputable section

local notation "ε" => (Grothe.Upper.phaseEpsQ : ℝ)

private lemma ev_smul (w a : ℂ) (P : CPoly) : ev w (a • P) = a * ev w P :=
  smul_eval _ _ _

private lemma ev_mul (w : ℂ) (P R : CPoly) : ev w (P * R) = ev w P * ev w R :=
  map_mul (eval (zv w)) P R

private lemma ev_pow (w : ℂ) (P : CPoly) (j : ℕ) : ev w (P ^ j) = ev w P ^ j :=
  map_pow (eval (zv w)) P j

/-- The complex radial continuation of the Taylor multiplier, including Gaussian damping. -/
def multiplier (j : ℕ) (r w : ℂ) : ℂ :=
  Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
    (Real.exp (-(j : ℝ) * ε * normSq w) : ℂ) * ev w (TwistFactorPolynomial.Q r) ^ j

/-- One damped Hermite column at the enlarged Gaussian scale. -/
def columnSource (j : ℕ) (r : ℂ) (g h : ℕ) (w : ℂ) : ℂ :=
  multiplier j r w * hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)

lemma ev_sourcePolynomial (j : ℕ) (r : ℂ) (c d : ℕ) (w : ℂ) :
    ev w (sourcePolynomial j r c d) =
      conj (hfun (c, d) ((Real.sqrt (rate j) : ℂ)⁻¹ * w)) *
        ev ((Real.sqrt (rate j) : ℂ)⁻¹ * w) (TwistFactorPolynomial.Q r) ^ j := by
  rw [sourcePolynomial, ev_smul, ev_rescale]
  simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap]
  simp only [ev_mul, ev_pow]
  ring

private lemma continuous_hfun (p q : ℕ) : Continuous (hfun (p, q)) :=
  continuous_const.mul (continuous_ev _)

/-- The explicit coefficient equals the Hermite integral of its actual damped column. -/
theorem matrixCoefficient_eq_integral (j : ℕ) (r : ℂ) (c d g h : ℕ) :
    matrixCoefficient j r c d g h =
      ∫ w, conj (hfun (c, d) w) * columnSource j r g h w ∂gaussC := by
  let F : ℂ → ℂ := fun w ↦ conj (hfun (c, d) w) *
    ev w (TwistFactorPolynomial.Q r) ^ j *
      hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)
  have hF : Measurable F :=
    (((Complex.continuous_conj.comp (continuous_hfun c d)).mul
      ((continuous_ev _).pow j)).mul
      ((continuous_hfun g h).comp (continuous_const.mul continuous_id))).measurable
  have ht := integral_gaussC_tilt F hF (rate_pos j)
  have hrate : rate j - 1 = (j : ℝ) * ε := by unfold rate; ring
  have hs : (Real.sqrt (rate j) : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.mpr (rate_pos j)).ne'
  have hscaled (w : ℂ) :
      F ((Real.sqrt (rate j))⁻¹ • w) =
        conj (hfun (h, g) w) * ev w (sourcePolynomial j r c d) := by
    simp only [F, Complex.real_smul, Complex.ofReal_inv]
    rw [← mul_assoc, mul_inv_cancel₀ hs, one_mul,
      PolynomialPhase.hfun_conj_swap h g w, ev_sourcePolynomial]
    ring
  rw [hrate] at ht
  simp_rw [hscaled] at ht
  rw [← hermiteCoeff_eq_integral] at ht
  simp only [Complex.real_smul, Complex.ofReal_inv] at ht
  calc
    matrixCoefficient j r c d g h =
        Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
          ((rate j : ℂ)⁻¹ * hermiteCoeff (sourcePolynomial j r c d) (h, g)) := by
      unfold matrixCoefficient
      ring
    _ = Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
        ∫ w, (Real.exp (-((j : ℝ) * ε) * normSq w) : ℂ) * F w ∂gaussC := by
      rw [ht]
    _ = ∫ w, conj (hfun (c, d) w) * columnSource j r g h w ∂gaussC := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      filter_upwards with w
      simp only [columnSource, multiplier, F]
      push_cast
      simp only [neg_mul]
      ring

/-- The undamped part of one column is a polynomial on the Gaussian plane. -/
def columnPolynomial (j : ℕ) (r : ℂ) (g h : ℕ) : CPoly :=
  TwistFactorPolynomial.Q r ^ j * dilate (rate j) ((nrm g h : ℂ) • H g h)

lemma ev_columnPolynomial (j : ℕ) (r : ℂ) (g h : ℕ) (w : ℂ) :
    ev w (columnPolynomial j r g h) = ev w (TwistFactorPolynomial.Q r) ^ j *
      hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w) := by
  simp only [columnPolynomial, ev_mul, ev_pow, ev_dilate, ev_smul, hfun]

lemma columnSource_eq (j : ℕ) (r : ℂ) (g h : ℕ) (w : ℂ) :
    columnSource j r g h w =
      Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
        (Real.exp (-(j : ℝ) * ε * normSq w) : ℂ) *
          ev w (columnPolynomial j r g h) := by
  rw [ev_columnPolynomial]
  simp only [columnSource, multiplier]
  ring

lemma continuous_columnSource (j : ℕ) (r : ℂ) (g h : ℕ) :
    Continuous (columnSource j r g h) := by
  simp_rw [show columnSource j r g h = fun w ↦
    Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
      (Real.exp (-(j : ℝ) * ε * normSq w) : ℂ) *
        ev w (columnPolynomial j r g h) from funext (columnSource_eq j r g h)]
  apply Continuous.mul _ (continuous_ev _)
  fun_prop

lemma norm_damping_le_one (j : ℕ) (w : ℂ) :
    ‖(Real.exp (-(j : ℝ) * ε * normSq w) : ℂ)‖ ≤ 1 := by
  rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _),
    Real.exp_le_one_iff]
  have hε : 0 ≤ ε := by norm_num [Grothe.Upper.phaseEpsQ]
  have hprod : 0 ≤ (j : ℝ) * ε * normSq w :=
    mul_nonneg (mul_nonneg (Nat.cast_nonneg j) hε) (Complex.normSq_nonneg w)
  nlinarith

/-- Every complex radial parameter gives a square-integrable column source. -/
theorem memLp_columnSource (j : ℕ) (r : ℂ) (g h : ℕ) :
    MemLp (columnSource j r g h) 2 gaussC := by
  apply (memLp_ev (columnPolynomial j r g h)).of_le_mul
    (continuous_columnSource j r g h).aestronglyMeasurable
    (c := ‖Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2)‖)
  exact Filter.Eventually.of_forall fun w ↦ by
    rw [columnSource_eq, norm_mul, norm_mul]
    exact mul_le_mul_of_nonneg_right
      (by simpa only [mul_one] using
        mul_le_mul_of_nonneg_left (norm_damping_le_one j w) (norm_nonneg _))
      (norm_nonneg _)

/-- Each matrix entry is an inner product against the same column's Gaussian `L²` vector. -/
theorem matrixCoefficient_eq_inner (j : ℕ) (r : ℂ) (c d g h : ℕ) :
    matrixCoefficient j r c d g h =
      ⟪hvec (c, d), (memLp_columnSource j r g h).toLp (columnSource j r g h)⟫_ℂ := by
  rw [hvec, Grothe.UpperChaos.inner_toLp, matrixCoefficient_eq_integral]

/-- Finite Bessel columns carry no additional Gaussian change-of-scale factor. -/
theorem sum_norm_matrixCoefficient_sq_le (S : Finset (ℕ × ℕ))
    (j : ℕ) (r : ℂ) (g h : ℕ) :
    ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 g h‖ ^ 2 ≤
      ∫ w, ‖columnSource j r g h w‖ ^ 2 ∂gaussC := by
  simp_rw [matrixCoefficient_eq_inner]
  rw [← GaussianGrowth.norm_toLp_sq (memLp_columnSource j r g h)]
  exact orthonormal_hvec.sum_inner_products_le _

end

end Grothe.UpperQuad.TwistFactorization
