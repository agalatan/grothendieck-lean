import Grothe.Statement
import Grothe.UpperSix.Haagerup.GammaDagger
import Grothe.UpperSixExact.Bound

set_option warningAsError true

/-!
# The upper bound: `K_G^ℂ ≤ 1.404556407 < 1/γ†`

The six-channel proof (`Grothe/UpperSixExact/Bound.lean`, on the library `Grothe/UpperSix/`) gives, for every finite
complex matrix `A`, `V(A) ≤ (10^27 / 711968558203721328194311213) · C(A)`; the factor is `1.4045564069893…`.

* `bound`: that inequality, as `IsBound` at the certificate's exact value;
* `constant_le`: `K_G^ℂ ≤ 1.404556407` (`1404556407 / 1000000000`), the exact value rounded up to nine decimals;
* `constant_lt_inv_gammaDagger`: `K_G^ℂ < 1/γ†`, Haagerup's value, from `constant_le` and `γ† < 0.711958683`.

The six-channel library has its own copy of the definitions (`Haagerup.Statement`,
`Grothe/UpperSix/Haagerup/Statement.lean`). That copy and `Grothe/Statement.lean` quantify over the same finite
matrices, unimodular scalars and complex unit vectors, and agree by reduction; the theorems below are stated with
the definitions of `Grothe/Statement.lean`.
-/

namespace Grothe.UpperSix

/-- **The upper bound for one matrix**: `V(A) ≤ 1.4045564069893… · C(A)` for every finite complex matrix `A`; the
factor is the certificate's exact value `10^27 / 711968558203721328194311213`. -/
theorem bound : Statement.IsBound ((10 : ℝ) ^ 27 / 711968558203721328194311213) :=
  Haagerup.SixChannelExact.isBound

/-- **The upper bound**: `K_G^ℂ ≤ 1.404556407`, the exact value of `bound` rounded up to nine decimals. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ 1404556407 / 1000000000 := by
  have h : Statement.complexGrothendieckConstant ≤ (10 : ℝ) ^ 27 / 711968558203721328194311213 :=
    csInf_le Haagerup.Statement.bounds_bddBelow bound
  exact h.trans (by norm_num)

/-- `K_G^ℂ < 1/γ†`: the constant is strictly below Haagerup's value. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger := by
  refine constant_le.trans_lt ?_
  rw [lt_div_iff₀ Haagerup.gammaDagger_pos]
  calc (1404556407 / 1000000000 : ℝ) * Haagerup.Statement.gammaDagger
      < (1404556407 / 1000000000 : ℝ) * (711958683 / 1000000000) := by
        gcongr; exact Haagerup.gammaDagger_bounds.2
    _ < 1 := by norm_num

end Grothe.UpperSix
