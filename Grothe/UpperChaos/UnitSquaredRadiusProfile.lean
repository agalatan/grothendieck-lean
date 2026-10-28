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

/-- The squared-radius profile has a continuous extension to all real `s`. -/
theorem continuous_unitSquaredKappa : Continuous unitSquaredKappa := by
  unfold unitSquaredKappa
  exact continuous_const.mul continuous_vprof

/-- The squared-radius rate is globally continuous in `(s,u)`. -/
theorem continuous_unitSquaredBeta (j : ℕ) :
    Continuous (Function.uncurry (unitSquaredBeta j)) := by
  change Continuous (fun v : ℝ × ℝ =>
    unitAlpha j + unitSquaredKappa v.1 ^ 2 * v.2 ^ 2)
  exact continuous_const.add
    (((continuous_unitSquaredKappa.comp continuous_fst).pow 2).mul (continuous_snd.pow 2))

/-- The squared-radius rate is strictly positive for every real `s,u`. -/
theorem unitSquaredBeta_pos (j : ℕ) (s u : ℝ) : 0 < unitSquaredBeta j s u := by
  unfold unitSquaredBeta
  exact add_pos_of_pos_of_nonneg (unitAlpha_pos j)
    (mul_nonneg (sq_nonneg _) (sq_nonneg _))

/-- Its reciprocal is globally continuous, including at `u = 0`. -/
theorem continuous_unitSquaredBeta_inv (j : ℕ) :
    Continuous (fun v : ℝ × ℝ => (unitSquaredBeta j v.1 v.2)⁻¹) := by
  exact (continuous_unitSquaredBeta j).inv₀ (fun v => (unitSquaredBeta_pos j v.1 v.2).ne')

/-- The scalar shift ratio `κ(s) u² / β(s,u)` is globally continuous. -/
theorem continuous_unitSquaredShiftRatio (j : ℕ) :
    Continuous (fun v : ℝ × ℝ =>
      unitSquaredKappa v.1 * v.2 ^ 2 / unitSquaredBeta j v.1 v.2) := by
  have hk : Continuous (fun v : ℝ × ℝ => unitSquaredKappa v.1) :=
    continuous_unitSquaredKappa.comp continuous_fst
  exact (hk.mul (continuous_snd.pow 2)).div₀ (continuous_unitSquaredBeta j)
    (fun v => (unitSquaredBeta_pos j v.1 v.2).ne')

end
end Grothe.UpperChaos.UnitSquaredRadiusProfile
