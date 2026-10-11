import Grothe.Lower.Endpoint

/-!
# From the vector test to the strict lower endpoint

The lower-bound argument tests the Gaussian operator `Tₙ` against the phase function
`gₙ(z) = z/‖z‖`: for every admissible Grothendieck bound `K`, `E‖Tₙgₙ‖ ≤ K·B` where `B` is the
certified operator-norm cap, while `E‖Tₙgₙ‖ → 1`.  Hence `1 ≤ K·B`, i.e. `K ≥ 1/B`, and the
exact comparison in `Grothe.Lower.Endpoint` gives `K > 1.40160592`.
-/

namespace Grothe.LowerAnalytic

open Filter Topology

/-- From test values `u n ≤ K·B` with `u n → 1` conclude `1 ≤ K·B`, hence `K ≥ 1/B`. -/
theorem operator_bound_limit (K B : ℝ) (hB : 0 < B) (u : ℕ → ℝ) (hu : ∀ n, u n ≤ K * B)
    (hlim : Tendsto u atTop (𝓝 1)) : 1 / B ≤ K := by
  have h1 : 1 ≤ K * B := le_of_tendsto' hlim hu
  rw [div_le_iff₀ hB]; exact h1

/-- **The strict lower endpoint from the vector test**: if the test values are bounded by
`K · B` with the certified cap `B` and tend to `1`, then `K > 140160592/10⁸`. -/
theorem lower_bound_of_tests (K : ℝ) (u : ℕ → ℝ) (hu : ∀ n, u n ≤ K * (Lower.Bcap : ℝ))
    (hlim : Tendsto u atTop (𝓝 1)) : (Lower.Llow : ℝ) < K :=
  Lower.lower_endpoint K (operator_bound_limit K _ (by norm_num [Lower.Bcap]) u hu hlim)

end Grothe.LowerAnalytic
