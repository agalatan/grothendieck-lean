import Grothe.Statement
import Grothe.UpperSix.Haagerup
import Grothe.UpperSixExact.Bound

set_option warningAsError true

/-!
# The six-channel finite-matrix and constant upper bounds

The six-channel proof (`Grothe/UpperSix/`) has its own copy of the definitions, so that it also builds as the
standalone package `haagerup-article/anc/`. That copy and `Grothe/Statement.lean` quantify over the same finite
matrices, unimodular scalars and complex unit vectors, and agree by reduction; the theorems below are stated with
the definitions of `Grothe/Statement.lean`.

Agent-ID: codex-a7c4
-/

namespace Grothe.UpperSix

/-- **The upper bound for one matrix**: `V(A) ≤ 1.40455741 · C(A)` for every finite complex matrix `A`. -/
theorem bound : Statement.IsBound (140455741 / 100000000 : ℝ) :=
  Haagerup.isBound_cert

/-- **The upper bound**: `K_G^ℂ ≤ 1.40455741`. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ (140455741 / 100000000 : ℝ) :=
  csInf_le Haagerup.Statement.bounds_bddBelow Haagerup.isBound_cert

/-- `K_G^ℂ < 1/γ†`: the constant is strictly below Haagerup's value. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger :=
  Haagerup.constant_lt_inv_gammaDagger

/-- Finite-matrix upper bound after subtracting the six certified linear energies. -/
theorem bound_exact : Statement.IsBound ((10 : ℝ) ^ 27 / 711968557929438692542239077) :=
  Haagerup.SixChannelExact.isBound_exact

/-- The stronger root certificate gives an upper bound of 1.404556407530439478… . -/
theorem constant_le_exact :
    Statement.complexGrothendieckConstant ≤ (10 : ℝ) ^ 27 / 711968557929438692542239077 :=
  csInf_le Haagerup.Statement.bounds_bddBelow bound_exact

/-- Admissibility for every finite matrix with the phase head extended through index 320. -/
theorem bound_phase : Statement.IsBound ((10 : ℝ) ^ 27 / 711968558203721328194311213) :=
  Haagerup.SixChannelExact.isBound_phase

/-- The unequal phase cutoff gives the exact upper endpoint 1.404556406989340536… . -/
theorem constant_le_phase :
    Statement.complexGrothendieckConstant ≤ (10 : ℝ) ^ 27 / 711968558203721328194311213 :=
  csInf_le Haagerup.Statement.bounds_bddBelow bound_phase

end Grothe.UpperSix
