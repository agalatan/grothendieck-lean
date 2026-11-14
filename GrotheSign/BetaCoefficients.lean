import GrotheSign.FlowCoefficients
import GrotheSign.BetaResolvent

/-!
# Positivity of the finite harmonic-generator coefficients

At each labeled degree the beta generator is a convergent positive combination of Euler
resolvents. The exchange with its alternating expression is only a finite sum.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset

variable {ι : Type*} [DecidableEq ι]

/-- The labeled coefficient of the harmonic generator is the sum of resolvent coefficients. -/
theorem hasSum_betaGeneratorCoefficient (t : Finset ι) (j : ι → ℕ) {c : ℝ}
    (hc : 0 < c) (ht : 2 ≤ t.card) :
    HasSum (fun q : ℕ ↦ 1 / (c + q) * resolventCoefficient t j (c + q))
      (generatorCoefficient t j (fun k ↦ harmonicGenerator k c)) := by
  have hsum : HasSum
      (fun q ↦ generatorCoefficient t j (fun k ↦ betaResolventTerm k c q))
      (generatorCoefficient t j (fun k ↦ harmonicGenerator k c)) := by
    unfold generatorCoefficient
    exact (hasSum_sum fun u (_hu : u ∈ t.powerset) ↦
      ((hasSum_betaResolventTerm (labelSum j u) hc).mul_left
        ((-1 : ℝ) ^ (t.card - u.card))).mul_right
          ((descPochhammer ℝ (t.card - 2)).eval
            (2 * (labelSum j u : ℝ) + u.card))).mul_left
              (-2 * ((labelSum j t : ℝ) + 1))
  have heq (q : ℕ) :
      generatorCoefficient t j (fun k ↦ betaResolventTerm k c q) =
        1 / (c + q) * resolventCoefficient t j (c + q) := by
    unfold betaResolventTerm
    rw [generatorCoefficient_mul, generatorCoefficient_resolvent t j (by positivity) ht]
  simpa only [heq] using hsum

/-- Every nonlinear labeled coefficient of the beta generator is strictly positive. -/
theorem betaGeneratorCoefficient_pos (t : Finset ι) (j : ι → ℕ) {c : ℝ}
    (hc : 0 < c) (ht : 2 ≤ t.card) (hj : ∀ a ∈ t, 0 < j a) :
    0 < generatorCoefficient t j (fun k ↦ harmonicGenerator k c) := by
  have hs := hasSum_betaGeneratorCoefficient t j hc ht
  rw [← hs.tsum_eq]
  have hp (q : ℕ) : 0 < 1 / (c + q) * resolventCoefficient t j (c + q) :=
    mul_pos (by positivity) (resolventCoefficient_pos t j (by positivity) ht hj)
  exact hs.summable.tsum_pos (fun q ↦ (hp q).le) 0 (hp 0)

end GrotheSign
