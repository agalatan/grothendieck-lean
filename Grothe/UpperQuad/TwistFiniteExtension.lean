import Grothe.UpperQuad.TwistMatrixCoefficient
import Grothe.UpperQuad.TwistSourceIdentity
import Grothe.UpperQuad.PolynomialPhaseTilt

/-!
# The finite entire extension of the twisted conditional coefficient

The source has auxiliary degree at most `c + d + 35*j`. Its finite Hermite expansion therefore
defines an entire function of the radial parameter and phase shift. On the real slice this is
the actual Gaussian integral, with the phase shift kept signed and no additional factorial.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorization

open MeasureTheory Grothe.LowerAnalytic Grothe.UpperChaos
open PolynomialHermite PolynomialPhase Explicit
open scoped ComplexConjugate

noncomputable section

/-- The finite entire continuation of the bare twisted conditional coefficient. -/
def Jext (j : ℕ) (r A : ℂ) (c d : ℕ) : ℂ :=
  ∑ gh ∈ indices (c + d + 35 * j), matrixCoefficient j r c d gh.1 gh.2 *
    Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A)

/-- The matrix sum is one rescaled polynomial phase extension. -/
theorem Jext_eq_phaseExtension (j : ℕ) (r A : ℂ) (c d : ℕ) :
    Jext j r A c d =
      (rate j : ℂ)⁻¹ * Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
        phaseExtension (c + d + 35 * j) (sourcePolynomial j r c d)
          ((Real.sqrt (rate j) : ℂ) * A) := by
  simp only [Jext, phaseExtension, matrixCoefficient, Finset.mul_sum, mul_assoc]

/-- The finite continuation is jointly entire in the radial parameter and signed shift. -/
theorem differentiable_Jext (j c d : ℕ) :
    Differentiable ℂ (fun z : ℂ × ℂ ↦ Jext j z.1 z.2 c d) := by
  unfold Jext
  apply Differentiable.fun_sum
  intro gh _
  exact ((differentiable_matrixCoefficient j c d gh.1 gh.2).comp differentiable_fst).mul
    ((QuadRem.differentiable_Uext gh.1 gh.2).comp
      ((differentiable_const _).mul differentiable_snd))

/-- At a fixed radial parameter, the continuation is entire in the signed shift. -/
theorem analyticAt_Jext_shift (j c d : ℕ) (r A : ℂ) :
    AnalyticAt ℂ (fun z ↦ Jext j r z c d) A :=
  ((differentiable_Jext j c d).comp
    ((differentiable_const r).prodMk differentiable_id)).analyticAt A

/-- At a fixed signed shift, the continuation is entire in the radial parameter. -/
theorem analyticAt_Jext_radial (j c d : ℕ) (r A : ℂ) :
    AnalyticAt ℂ (fun z ↦ Jext j z A c d) r :=
  ((differentiable_Jext j c d).comp
    (differentiable_id.prodMk (differentiable_const A))).analyticAt r

/-- At real parameters and a nonzero shift, the continuation equals the literal source integral. -/
theorem Jext_real (j c d : ℕ) (r A : ℝ) (hA : A ≠ 0) :
    Jext j (r : ℂ) (A : ℂ) c d =
      ∫ w, conj (hfun (c, d) w) * (Complex.I * (phiT ((r : ℂ), w) : ℂ)) ^ j *
        Grothe.Haag.ph ((A : ℂ) + w) ∂gaussC := by
  let P : CPoly := (nrm c d : ℂ) • (H d c * TwistFactorPolynomial.Q (r : ℂ) ^ j)
  have hP : P.totalDegree ≤ c + d + 35 * j :=
    totalDegree_normalized_source_le j (r : ℂ) c d
  have htilt := integral_damped_phase_eq_extension (rate j) (rate_pos j) A hA P hP
  have hrate : rate j - 1 = (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) := by
    simp only [rate, add_sub_cancel_left]
  have hpoly : PolynomialRescale.rescale (Real.sqrt (rate j)) P =
      sourcePolynomial j (r : ℂ) c d := rescale_normalized_source j (r : ℂ) c d
  rw [hrate, hpoly] at htilt
  have hsource :
      (∫ w, conj (hfun (c, d) w) * (Complex.I * (phiT ((r : ℂ), w) : ℂ)) ^ j *
        Grothe.Haag.ph ((A : ℂ) + w) ∂gaussC) =
      (Real.exp (-((j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) * r ^ 2) : ℂ) *
        ∫ w, (Real.exp (-((j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) *
          Complex.normSq w) : ℂ) * (ev w P * Grothe.Haag.ph ((A : ℂ) + w)) ∂gaussC := by
    rw [← integral_const_mul]
    apply integral_congr_ae
    filter_upwards with w
    rw [TwistSourceIdentity.source_eq_damped_polynomial]
    dsimp only [P]
    ring
  rw [hsource, htilt, Jext_eq_phaseExtension, Complex.ofReal_exp]
  push_cast
  ring_nf

/-- The finite continuation is bounded by its matrix columns and canonical coefficients. -/
theorem norm_Jext_le (j : ℕ) (r A : ℂ) (c d : ℕ) :
    ‖Jext j r A c d‖ ≤ ∑ gh ∈ indices (c + d + 35 * j),
      ‖matrixCoefficient j r c d gh.1 gh.2‖ *
        ‖Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A)‖ := by
  simpa only [Jext, norm_mul] using norm_sum_le (indices (c + d + 35 * j))
    (fun gh ↦ matrixCoefficient j r c d gh.1 gh.2 *
      Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A))

end

end Grothe.UpperQuad.TwistFactorization
