import Mathlib

/-!
# Endpoint arithmetic for the lower bound

`B = 3569353321/5000000000` is the certified operator-norm cap; any admissible Grothendieck
bound `K` satisfies `K ≥ 1/B`, hence `K > 1400813971/10⁹` because `1 − L·B > 0` exactly.
The limit skeleton `operator_bound_limit` records how `1 ≤ K·B` follows from the vector test
`E‖Tₙgₙ‖ ≤ K·B` and `E‖Tₙgₙ‖ → 1`.
-/

namespace Grothe.LowerAnalytic

open Filter Topology

noncomputable section

/-- The operator-norm cap. -/
def Bcap : ℝ := 3569353321 / 5000000000

/-- The advertised strict lower endpoint. -/
def Lend : ℝ := 1400813971 / 1000000000

theorem one_sub_LB_pos : 0 < 1 - Lend * Bcap := by unfold Lend Bcap; norm_num

/-- `K ≥ 1/B` implies the strict endpoint `L < K`. -/
theorem endpoint_of_reciprocal (K : ℝ) (hK : 1 / Bcap ≤ K) : Lend < K := by
  have hB : 0 < Bcap := by unfold Bcap; norm_num
  have : Lend < 1 / Bcap := by rw [lt_div_iff₀ hB]; linarith [one_sub_LB_pos]
  exact this.trans_le hK

/-- From a sequence of test values `u n ≤ K·B` with `u n → 1` conclude `1 ≤ K·B`, hence `K ≥ 1/B`. -/
theorem operator_bound_limit (K B : ℝ) (hB : 0 < B) (u : ℕ → ℝ) (hu : ∀ n, u n ≤ K * B)
    (hlim : Tendsto u atTop (𝓝 1)) : 1 / B ≤ K := by
  have h1 : 1 ≤ K * B := le_of_tendsto' hlim hu
  rw [div_le_iff₀ hB]; exact h1

end

end Grothe.LowerAnalytic
