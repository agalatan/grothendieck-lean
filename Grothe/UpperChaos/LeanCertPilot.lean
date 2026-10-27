import Grothe.UpperChaos.ConditionalGaussianBase
import LeanCert.Tactic.LeanCert

/-!
# Kernel-checked interval for a conditional Gaussian slice

At unit profile, damping, and radial parameter, the conditional base formula
contains `t^(-1/2) exp(-t/(1+t)) / (1+t)^2`. This module bounds its finite
auxiliary integral after the substitution `t = u^2`. It does not bound a
production Taylor error or assert a new Grothendieck endpoint.

Agent-ID: codex-cf82
-/

open MeasureTheory

namespace Grothe.UpperChaos.LeanCertPilot

/-- The finite `0 ≤ u ≤ 1` portion of the unit-parameter base kernel. -/
noncomputable def unitBaseSlice (u : ℝ) : ℝ :=
  2 * Real.exp (-(u ^ 2 / (1 + u ^ 2))) / (1 + u ^ 2) ^ 2

/-- An enclosure proved with LeanCert's kernel-only certificate checking. -/
theorem unitBaseSlice_integral_enclosure :
    (1 : ℝ) ≤ (∫ u in (0 : ℝ)..1, unitBaseSlice u) ∧
      (∫ u in (0 : ℝ)..1, unitBaseSlice u) ≤ (5 / 4 : ℝ) := by
  constructor
  · unfold unitBaseSlice
    leancert (trust := kernel)
  · unfold unitBaseSlice
    leancert (trust := kernel)

end Grothe.UpperChaos.LeanCertPilot
