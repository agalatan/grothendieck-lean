import Grothe.UpperChaos.TaylorRadialIntegral

/-!
# Compatibility interfaces for the Taylor Wick radial integral

The radial Gaussian integration and measurability theorems are provided by
`TaylorRadialIntegral`. This module retains the interfaces used by the q0 and
finite-mixture developments without redeclaring those shared results.

Agent-ID: codex-8c4d
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The squared-radius substitution for a complex-valued radial integral. -/
theorem integral_radial_sq_substitution (f : ℝ → ℂ) :
    (∫ r in Ioi (0 : ℝ), ((2 * r * Real.exp (-r ^ 2) : ℝ) : ℂ) * f r) =
      ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) * f (Real.sqrt s) := by
  conv_rhs => rw [← integral_comp_rpow_Ioi_of_pos (show (0 : ℝ) < 2 by norm_num)]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro r hr
  norm_num only [show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one,
    Real.rpow_two, Real.sqrt_sq hr.le, Complex.real_smul]
  push_cast
  ring

/-- Compatibility name for the squared-radius conditional Wick integral. -/
theorem integral_taylorConditionalWick_radial (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) :
    (∫ z, taylorConditionalWick j N a t z ∂gaussC) =
      ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) *
        taylorConditionalWick j N a t (Real.sqrt s : ℂ) :=
  integral_taylorConditionalWick_eq_sq_radial j N a t ht

/-- The production Taylor inner product as an auxiliary integral of explicit
one-dimensional squared-radius Wick integrals. -/
theorem inner_gradedHermite_hpow_eq_radial_wick (hφ : PhiBound) (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a, (chargeFn_hpow hφ j).memLp.toLp (hpow j)⟫_ℂ =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        ∫ s : ℝ in Ioi 0, (Real.exp (-s) : ℂ) *
          taylorConditionalWick j N a t (Real.sqrt s : ℂ) := by
  rw [inner_gradedHermite_hpow_eq_wick hφ j N a]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  exact integral_taylorConditionalWick_eq_sq_radial j N a t ht

end
end Grothe.UpperChaos
