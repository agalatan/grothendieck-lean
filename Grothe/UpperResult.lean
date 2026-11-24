import Grothe.Statement
import Grothe.UpperSix.Haagerup

set_option warningAsError true

/-!
# The upper bound `K_G^ℂ ≤ 1.40455742 < 1/γ†`, from the six-channel proof

The six-channel proof (`Grothe/UpperSix/`) has its own copy of the definitions, so that it also builds as the
standalone package `haagerup-article/anc/`. That copy and `Grothe/Statement.lean` quantify over the same finite
matrices, unimodular scalars and complex unit vectors, and agree by reduction; the theorems below are stated with
the definitions of `Grothe/Statement.lean`.

Agent-ID: codex-a7c4
-/

namespace Grothe.UpperSix

/-- The bound in the form of the certificate's own statement file: the certificate proves `1 / (c − δ)`
(`Haagerup.isBound_cert_exact`, `1.4045574123…`), and `140455742 / 100000000` is that value rounded up. -/
private theorem certBound : Haagerup.Statement.IsBound (140455742 / 100000000 : ℝ) := by
  have hle : 1 / ((Haagerup.cCertQ : ℝ) - (Haagerup.deltaCertQ : ℝ)) ≤ (140455742 / 100000000 : ℝ) := by
    norm_num [Haagerup.cCertQ, Haagerup.deltaCertQ, Haagerup.d12Q]
  exact fun m n A => (Haagerup.isBound_cert_exact m n A).trans
    (mul_le_mul_of_nonneg_right hle (Real.sSup_nonneg fun r ⟨_, _, _, _, hr⟩ => hr ▸ norm_nonneg _))

/-- **The upper bound for one matrix**: `V(A) ≤ 1.40455742 · C(A)` for every finite complex matrix `A`. -/
theorem bound : Statement.IsBound (140455742 / 100000000 : ℝ) :=
  certBound

/-- **The upper bound**: `K_G^ℂ ≤ 1.40455742`. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ (140455742 / 100000000 : ℝ) :=
  csInf_le Haagerup.Statement.bounds_bddBelow certBound

/-- `K_G^ℂ < 1/γ†`: the constant is strictly below Haagerup's value. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger :=
  Haagerup.constant_lt_inv_gammaDagger

end Grothe.UpperSix
