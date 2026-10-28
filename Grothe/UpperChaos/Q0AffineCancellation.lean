import Grothe.UpperChaos.LeanCertProductionPanel

/-!
# First-source affine cancellation before Gaussian integration

For the actual first graded mode and a real first coordinate, the real part
of the phase times the affine response has a simple even factor in the
second coordinate. This is pointwise algebra; no quadrature, compressed
coefficient table, sign of the full source or numerical bound is asserted.

Agent-ID: codex-8c4d
-/

open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0AffineCancellation

noncomputable section

open Grothe.UpperChaos.LeanCertProductionPanel

/-- The actual affine coefficient at a real first coordinate. -/
def kappaAtReal (r : ℝ) : ℝ :=
  Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖(r : ℂ)‖ ^ 2)

/-- Before taking Gaussian moments, the real part of the first source times
the affine response discards the odd-in-imaginary-coordinate contribution. -/
theorem q0_source_affine_real (r : ℝ) (w : ℂ) :
    (taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
      basePhaseArgument ((r : ℂ), w)).re =
        -kappaAtReal r * r * w.im * phiT ((r : ℂ), w) := by
  rw [q0_taylor_source]
  simp only [basePhaseArgument, kappaAtReal, Complex.conj_ofReal,
    Complex.mul_re, Complex.mul_im, Complex.add_re, Complex.add_im,
    Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im,
    zero_mul, mul_zero, zero_add, add_zero, sub_zero, one_mul]
  ring

/-- For the actual phase polynomial, the remaining real factor is quadratic
in the imaginary component. -/
theorem phiT_real_first (r : ℝ) (w : ℂ) :
    phiT ((r : ℂ), w) =
      (r * w.im) *
        Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) *
          (‖(r : ℂ)‖ ^ 2 + ‖w‖ ^ 2)) *
        Sphase (‖(r : ℂ)‖ ^ 2) (‖w‖ ^ 2) (conj (r : ℂ) * w).re := by
  unfold phiT
  simp only [Complex.conj_ofReal, Complex.mul_im, Complex.ofReal_re,
    Complex.ofReal_im, zero_mul, add_zero]

/-- The pointwise real part has the actual phase polynomial and damping,
with the odd part cancelled before any Gaussian moment expansion. -/
theorem q0_source_affine_phase_real (r : ℝ) (w : ℂ) :
    (taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
      basePhaseArgument ((r : ℂ), w)).re =
        -kappaAtReal r * r ^ 2 * w.im ^ 2 *
          Real.exp (-(Grothe.Upper.phaseEpsQ : ℝ) *
            (‖(r : ℂ)‖ ^ 2 + ‖w‖ ^ 2)) *
          Sphase (‖(r : ℂ)‖ ^ 2) (‖w‖ ^ 2) (conj (r : ℂ) * w).re := by
  rw [q0_source_affine_real, phiT_real_first]
  ring

/-- The exact Laplace-kernel integrand keeps the same real-part cancellation. -/
theorem q0_laplace_integrand_real (r t : ℝ) (w : ℂ) :
    (taylorInnerSource 1 (gradedHermiteFn 1 q0Coeff) ((r : ℂ), w) *
      Haag.phaseLaplaceKernel (basePhaseArgument ((r : ℂ), w)) t).re =
      (t ^ (-(1 / 2 : ℝ)) *
        Real.exp (-(‖basePhaseArgument ((r : ℂ), w)‖ ^ 2 * t))) *
        (-kappaAtReal r * r * w.im * phiT ((r : ℂ), w)) := by
  unfold Haag.phaseLaplaceKernel
  have h (a b : ℂ) (c : ℝ) : a * ((c : ℂ) * b) = (c : ℂ) * (a * b) := by ring
  rw [h]
  simp only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
  have hr := q0_source_affine_real r w
  simp only [Complex.mul_re] at hr
  rw [hr]

end
end Grothe.UpperChaos.Q0AffineCancellation
