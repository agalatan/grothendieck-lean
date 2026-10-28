import Grothe.UpperChaos.TaylorRadialIntegral
import Grothe.UpperChaos.TaylorSqrtKernel

/-!
# The actual production pairing as a regular two-variable integral

Both changes of variables are exact. The error against the original phase
source is bounded by the proved Gaussian softening estimate, multiplied by
the norm of the finite Hermite center. Thus a numerical enclosure of this
explicit integral has a direct interpretation in the original Gaussian L² space.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

/-- Exact Gaussian radial integration of the regular production evaluator. -/
theorem integral_taylorRegularWick_eq_sq_radial (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (u : ℝ) (hu : 0 < u) :
    (∫ z, taylorRegularWick j N a u z ∂gaussC) =
      ∫ s : ℝ in Ioi 0, (Real.exp (-s) : ℂ) *
        taylorRegularWick j N a u (Real.sqrt s : ℂ) := by
  simp_rw [taylorRegularWick_eq j N a u hu]
  rw [integral_const_mul, integral_taylorConditionalWick_eq_sq_radial j N a
    (u ^ 2) (sq_pos_of_pos hu), ← integral_const_mul]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro s _hs
  ring

/-- The regular quadrature integrand uses only two real variables and the exact data. -/
def taylorQuadratureKernel (η : ℝ) (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (u s : ℝ) : ℂ :=
  (Real.exp (-(η ^ 2 * u ^ 2)) : ℂ) * (Real.exp (-s) : ℂ) *
    taylorRegularWick j N a u (Real.sqrt s : ℂ)

/-- The two-dimensional integral to be enclosed by numerical certificates. -/
def taylorQuadratureValue (η : ℝ) (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) : ℂ :=
  (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ u : ℝ in Ioi 0,
    ∫ s : ℝ in Ioi 0, taylorQuadratureKernel η j N a u s

/-- The two-real-variable integral is exactly the softened production pairing. -/
theorem inner_gradedHermite_softHpow_eq_quadrature (η : ℝ) (hη : 0 < η)
    (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a, (softHpow_memLp η hη j).toLp (softHpow η j)⟫_ℂ =
      taylorQuadratureValue η j N a := by
  rw [inner_gradedHermite_softHpow_eq_regular η hη j N a]
  unfold taylorQuadratureValue
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro u hu
  dsimp only
  rw [integral_taylorRegularWick_eq_sq_radial j N a u hu, ← integral_const_mul]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro s _hs
  unfold taylorQuadratureKernel
  ring

/-- The numerical integral approximates the actual unsmoothed Taylor coefficient
with a proved error; no Gaussian approximation premise is supplied by the caller. -/
theorem norm_inner_hpow_sub_quadrature_le (η : ℝ) (hη : 0 < η)
    (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ‖⟪gradedHermite N a, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ -
        taylorQuadratureValue η j N a‖ ≤
      ‖gradedHermite N a‖ * ((10 / 3 : ℝ) * η) := by
  rw [← inner_gradedHermite_softHpow_eq_quadrature η hη j N a,
    ← inner_sub_right, ← toLp_softTaylorError η hη j]
  exact (norm_inner_le_norm _ _).trans
    (mul_le_mul_of_nonneg_left (norm_softTaylorError_le η hη j) (norm_nonneg _))

end
end Grothe.UpperChaos
