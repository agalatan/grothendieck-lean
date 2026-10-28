import Grothe.UpperChaos.SoftTaylorWick
import Mathlib.MeasureTheory.Integral.IntegralEqImproper

/-!
# Removing the auxiliary square-root singularity of the production Wick integral

The substitution `t = u²` cancels the factor `t⁻¹ᐟ²` exactly. The resulting
finite evaluator retains the actual profile, phase polynomial and Hermite center.
Its Gaussian denominators are positive for every auxiliary parameter, including
zero. No numerical integration estimate is assumed.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

/-- The finite production evaluator after the exact substitution `t = u²`.
Unlike `taylorConditionalWick`, this expression has no negative half power. -/
def taylorRegularWick (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (u : ℝ) (z : ℂ) : ℂ :=
  let ε : ℝ := Grothe.Upper.phaseEpsQ
  let α : ℝ := 1 + (j : ℝ) * ε
  let κ : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2)
  let β : ℝ := α + κ ^ 2 * u ^ 2
  let μ : ℂ := -((κ * u ^ 2 / β : ℝ) : ℂ) * z
  let P : CPoly := taylorSourceSlice phaseTerms j N a z
  2 * (Real.exp (-(j : ℝ) * ε * Complex.normSq z) : ℂ) *
    (Real.exp (-(α * u ^ 2 * Complex.normSq z / β)) : ℂ) *
      ∑ s ∈ P.support, P.coeff s *
        (z * shiftedDampedMoment β μ (s 0) (s 1) +
          (κ : ℂ) * shiftedDampedMoment β μ (s 0 + 1) (s 1))

/-- Every reciprocal in the regular evaluator has a denominator at least one. -/
theorem taylorRegularWick_rate_ge_one (j : ℕ) (u : ℝ) (z : ℂ) :
    1 ≤ 1 + (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) +
      (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2)) ^ 2 * u ^ 2 := by
  have hε : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  have hj : 0 ≤ (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) := mul_nonneg (Nat.cast_nonneg j) hε
  have hs := mul_nonneg
    (sq_nonneg (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2)))
    (sq_nonneg u)
  linarith

/-- The Jacobian cancels the auxiliary singularity exactly on the positive axis. -/
theorem taylorRegularWick_eq (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (u : ℝ) (hu : 0 < u) (z : ℂ) :
    taylorRegularWick j N a u z =
      (2 * u : ℂ) * taylorConditionalWick j N a (u ^ 2) z := by
  have hrpow : (u ^ 2) ^ (-(1 / 2 : ℝ)) = u⁻¹ := by
    rw [Real.rpow_neg (sq_nonneg u), ← Real.sqrt_eq_rpow,
      Real.sqrt_sq_eq_abs, abs_of_pos hu]
  have huC : (u : ℂ) ≠ 0 := by exact_mod_cast hu.ne'
  have cancel (A B S : ℂ) :
      2 * A * B * S = (2 * (u : ℂ)) * (A * (((u : ℂ)⁻¹ * B) * S)) := by
    calc
      _ = ((u : ℂ) * (u : ℂ)⁻¹) * (2 * A * B * S) := by
        rw [mul_inv_cancel₀ huC, one_mul]
      _ = _ := by ring
  simp only [taylorRegularWick, taylorConditionalWick, hrpow]
  simp only [Complex.ofReal_mul, Complex.ofReal_inv]
  exact cancel _ _ _

/-- Exact square substitution for arbitrary complex-valued auxiliary integrals. -/
theorem integral_auxiliary_square (f : ℝ → ℂ) :
    (∫ t : ℝ in Ioi 0, f t) =
      ∫ u : ℝ in Ioi 0, (2 * u : ℂ) * f (u ^ 2) := by
  have h := integral_comp_rpow_Ioi_of_pos (g := f) (show (0 : ℝ) < 2 by norm_num)
  simpa only [show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one,
    Real.rpow_two, Complex.real_smul, Complex.ofReal_mul, Complex.ofReal_ofNat] using h.symm

/-- The actual softened Taylor pairing is an integral of the regular finite evaluator. -/
theorem inner_gradedHermite_softHpow_eq_regular (η : ℝ) (hη : 0 < η)
    (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a, (softHpow_memLp η hη j).toLp (softHpow η j)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ u : ℝ in Ioi 0,
        (Real.exp (-(η ^ 2 * u ^ 2)) : ℂ) *
          ∫ z, taylorRegularWick j N a u z ∂gaussC := by
  rw [inner_gradedHermite_softHpow_eq_wick η hη j N a, integral_auxiliary_square]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro u hu
  have he : (∫ z, taylorRegularWick j N a u z ∂gaussC) =
      (2 * u : ℂ) * ∫ z, taylorConditionalWick j N a (u ^ 2) z ∂gaussC := by
    simp_rw [taylorRegularWick_eq j N a u hu]
    rw [integral_const_mul]
  dsimp only
  rw [he]
  ring

end
end Grothe.UpperChaos
