/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Statement
import Haagerup.GammaDagger
import Haagerup.CertCheck

/-!
# The complex Grothendieck constant is strictly below Haagerup's value

The theorems of the package. The last four are Theorem 1.1 of the article; `isBound_cert` is the last assertion of
Theorem 5.1 (six-channel certificate).

Notation (all defined in `Haagerup/Statement.lean`): for a finite complex matrix `A`, `C(A)` is the supremum of
`|∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ|` over unimodular scalars and `V(A)` the supremum of `|∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫|` over unit vectors of
`ℂ^ι`, `ι` any finite type; `IsBound K` says `V(A) ≤ K · C(A)` for every `A`; `complexGrothendieckConstant`
(`K_G^ℂ`) is the infimum of such `K`; `gammaDagger` (`γ†`) is Haagerup's integral `∫₀^{π/2} cos² t / √(1 + sin² t) dt`.

The public theorems, all without hypotheses:

* `Haagerup.isBound_cert : IsBound (1 / (cCertQ - deltaCertQ))` (in `Haagerup/CertCheck.lean`): the value proved by
  the six-channel certificate;
* `Haagerup.certificate_value : 1 / (cCertQ - deltaCertQ) = 10 ^ 24 / 711968053274152967940951`, which is
  `1.4045574031…`;
* `Haagerup.isBound : IsBound (140456 / 100000)`: the same bound, rounded up to `1.40456`;
* `Haagerup.constant_le : complexGrothendieckConstant ≤ 140456 / 100000`;
* `Haagerup.inv_gammaDagger_gt : 140456 / 100000 < 1 / gammaDagger`;
* `Haagerup.constant_lt_inv_gammaDagger : complexGrothendieckConstant < 1 / gammaDagger`, the main theorem:

  `K_G^ℂ ≤ 1.40456 < 1 / γ† = 1.4045759346…`.
-/

set_option warningAsError true

namespace Haagerup

/-- **The value of the certificate** (Computation 7, part 4, of the article). With the centre `c = cCertQ` and the
error budget `δ = deltaCertQ` of `Haagerup/Parameters.lean`, `1 / (c − δ)` is the rational number
`10²⁴ / 711968053274152967940951 = 1.4045574031…`. -/
theorem certificate_value :
    1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ)) = 10 ^ 24 / 711968053274152967940951 := by
  norm_num [cCertQ, deltaCertQ, d12Q]

/-- **The upper bound.** `1.40456` is a complex Grothendieck bound: for every finite complex matrix `A`, the optimum
`V(A)` over unit vectors is at most `1.40456` times the optimum `C(A)` over unimodular scalars. -/
theorem isBound : Statement.IsBound (140456 / 100000 : ℝ) :=
  isBound_cert.mono (by rw [certificate_value]; norm_num)

/-- **The constant.** The complex Grothendieck constant is at most `1.40456`. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ 140456 / 100000 :=
  csInf_le Statement.bounds_bddBelow isBound

/-- **Haagerup's value.** `1.40456` is strictly less than `1 / γ†`, where `γ†` is Haagerup's integral
`∫₀^{π/2} cos² t / √(1 + sin² t) dt` (`1 / γ† = 1.4045759346…`). -/
theorem inv_gammaDagger_gt : (140456 / 100000 : ℝ) < 1 / Statement.gammaDagger := by
  rw [lt_div_iff₀ gammaDagger_pos]
  calc (140456 / 100000 : ℝ) * Statement.gammaDagger
      < (140456 / 100000 : ℝ) * (711958683 / 1000000000) := by
        gcongr; exact gammaDagger_bounds.2
    _ < 1 := by norm_num

/-- **Main theorem.** The complex Grothendieck constant is strictly less than Haagerup's value `1 / γ†`. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Statement.gammaDagger :=
  lt_of_le_of_lt constant_le inv_gammaDagger_gt

end Haagerup
