import Mathlib.Analysis.Complex.Norm
import Mathlib.Tactic

/-!
# Algebra for the genuine cubic's two-replica state

If R,R' are the two X radii and C their complex cross inner product, then the
holomorphic quadratic probes have Gram entries R², R'² and C². The following
construction realizes this Gram using two scalar Y coordinates. These are the
exact algebraic steps of the paper's fixed-size replica reduction; the Gaussian
conditioning and invariant-space classification remain paper proofs.
-/

namespace Grothe.LowerAnalytic.ReplicaState

noncomputable def firstCoeff (R : ℝ) (C : ℂ) : ℂ := star C ^ 2 / (R : ℂ)

noncomputable def residual (R Rp : ℝ) (C : ℂ) : ℝ :=
  Rp^2-(Complex.normSq C)^2/R^2

theorem firstCoeff_normSq (R : ℝ) (C : ℂ) :
    Complex.normSq (firstCoeff R C) = (Complex.normSq C)^2/R^2 := by
  simp [firstCoeff, Complex.normSq_conj,
    Complex.normSq_ofReal, pow_two]

theorem firstCoeff_cross (R : ℝ) (C : ℂ) (hR : R ≠ 0) :
    (R : ℂ)*star (firstCoeff R C) = C^2 := by
  have hRc : (R : ℂ) ≠ 0 := by exact_mod_cast hR
  simp only [firstCoeff, star_div₀, star_pow, Complex.star_def,
    Complex.conj_ofReal, starRingEnd_self_apply]
  field_simp

theorem residual_nonneg (R Rp : ℝ) (C : ℂ) (hR : 0 < R) (hRp : 0 ≤ Rp)
    (hC : Complex.normSq C ≤ R*Rp) : 0 ≤ residual R Rp C := by
  have hn := Complex.normSq_nonneg C
  have hp := mul_nonneg (sub_nonneg.mpr hC) (add_nonneg (mul_nonneg hR.le hRp) hn)
  have hsq : (Complex.normSq C)^2 ≤ Rp^2*R^2 := by nlinarith
  have hd : 0 < R^2 := sq_pos_of_pos hR
  have hdiv : (Complex.normSq C)^2/R^2 ≤ Rp^2 := (div_le_iff₀ hd).mpr hsq
  unfold residual
  linarith

theorem variance_identity (R Rp : ℝ) (C : ℂ) :
    Complex.normSq (firstCoeff R C)+residual R Rp C = Rp^2 := by
  rw [firstCoeff_normSq]
  unfold residual
  ring

theorem sqrt_variance_identity (R Rp : ℝ) (C : ℂ) (hR : 0 < R) (hRp : 0 ≤ Rp)
    (hC : Complex.normSq C ≤ R*Rp) :
    Complex.normSq (firstCoeff R C)+(Real.sqrt (residual R Rp C))^2 = Rp^2 := by
  rw [Real.sq_sqrt (residual_nonneg R Rp C hR hRp hC)]
  exact variance_identity R Rp C

/-- Giving the scalar joint-law coordinate G first-chaos noise changes the
kernel even though the one-point cubic law is exact. -/
theorem scalar_surrogate_gap (m r : ℝ) (hm : m + 1 ≠ 0) :
    (m * r + r ^ 3) / (m + 1) - r ^ 3 = m * r * (1 - r ^ 2) / (m + 1) := by
  field_simp [hm]
  ring

theorem scalar_surrogate_strict (m r : ℝ) (hm : 0 < m) (hr : 0 < r) (hr1 : r < 1) :
    r ^ 3 < (m * r + r ^ 3) / (m + 1) := by
  have hd : 0 < m + 1 := by linarith
  have hh := scalar_surrogate_gap m r (ne_of_gt hd)
  have hrr : 0 < 1 - r ^ 2 := by nlinarith
  have hp : 0 < m * r * (1 - r ^ 2) / (m + 1) :=
    div_pos (mul_pos (mul_pos hm hr) hrr) hd
  linarith

end Grothe.LowerAnalytic.ReplicaState
