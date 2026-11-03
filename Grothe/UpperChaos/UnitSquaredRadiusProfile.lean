import Grothe.UpperChaos.RationalUnitWickProduction

/-!
# The unit-mode profile at squared radius

These identities isolate the profile and positive Gaussian rate after the
substitution `r = sqrt s`, `t = u²`. They do not assume a parity theorem for
the Wick polynomial and do not assert a numerical bound.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.UnitSquaredRadiusProfile

open Grothe.UpperChaos.RationalUnitWickProduction

noncomputable section

/-- The actual affine profile, viewed as a function of squared radius. -/
def unitSquaredKappa (s : ℝ) : ℝ :=
  Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s

/-- The conditional rate at squared radius and regular auxiliary coordinate. -/
def unitSquaredBeta (j : ℕ) (s u : ℝ) : ℝ :=
  unitAlpha j + unitSquaredKappa s ^ 2 * u ^ 2

/-- The radius profile equals the squared-radius profile for `s ≥ 0`. -/
theorem unitKappa_sqrt_eq_squared (s : ℝ) (hs : 0 ≤ s) :
    unitKappa (Real.sqrt s) = unitSquaredKappa s := by
  have hz : ‖(Real.sqrt s : ℂ)‖ ^ 2 = s := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_ofReal]
    exact Real.mul_self_sqrt hs
  unfold unitKappa unitSquaredKappa
  rw [hz]

/-- The rate retains the exact production profile after both substitutions. -/
theorem unitBeta_sqrt_square_eq_squared (j : ℕ) (s u : ℝ) (hs : 0 ≤ s) :
    unitBeta j (Real.sqrt s) (u ^ 2) = unitSquaredBeta j s u := by
  unfold unitBeta unitSquaredBeta
  rw [unitKappa_sqrt_eq_squared s hs]

end
end Grothe.UpperChaos.UnitSquaredRadiusProfile
