import QuinticResearch.SignedFifth
import Grothe.LowerAnalytic.Fifth.Witness

/-! A finite-matrix corollary of the signed fifth witness. Agent-ID: codex-a7c4 -/

set_option warningAsError true

namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower

/-- An actual improvement in the scalar payoff of each upper-arm physical pair. -/
theorem signedFifth_payoff_high {n : ℕ} {e ν debit : ℝ} (hd : 0 ≤ debit)
    {f g : L2G (n+1)} (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (ht : (886176:ℝ)/1000000 ≤ tOf (n+1) f g) :
    (inner ℂ f (signedFifthWitness (n+1) e ν debit g)).re ≤ VOf (n+1) e ν f g - debit*(154/10000) := by
  rw [signedFifth_payoff]
  exact sub_le_sub_left (mul_le_mul_of_nonneg_left (signed_fifth_at_least_154 hf hg ht) hd) _

end Grothe.LowerAnalytic
