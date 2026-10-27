import Grothe.Lower.Gram

/-!
# Reserved contraction-Gram budgets

A node must pay for all constraints using the same tensor. `Reserve` records an arbitrary
signed linear functional of the five contraction invariants. `reserveCert` subtracts it from
the five coefficient remainders before accepting the existing PSD proof. Soundness retains
this functional on the left side of the law budget. No componentwise sign condition on the
reserve is imposed: useful nonnegative tensor functionals can have negative coefficients.
-/

namespace Grothe.Lower

/-- Extend a joint moment estimate only to a checked upper endpoint of its kurtosis range. -/
theorem joint_moment_range {m2 m3 x xmax J : ℝ} (hx : x ≤ xmax) (hJ : 0 ≤ J)
    (hm : m3 ≤ 6 + 9 * (m2 - 2) + x * J) :
    m3 ≤ 6 + 9 * (m2 - 2) + xmax * J := by
  nlinarith [mul_le_mul_of_nonneg_right hx hJ]

/-- The moment slack cancels exactly the reserved budget in the corrected radial cut.
`budget` is the old cut expectation after its two nonnegative completion squares. -/
theorem reserved_moment_cut {m2 m3 xmax J weight budget : ℝ} (hw : 0 ≤ weight)
    (hm : m3 ≤ 6 + 9 * (m2 - 2) + xmax * J)
    (hb : weight * xmax * J ≤ budget) :
    0 ≤ budget + weight * (-m3 + 9 * m2 - 12) := by
  nlinarith [mul_nonneg hw (show 0 ≤ 6 + 9 * (m2 - 2) + xmax * J - m3 by linarith)]

end Grothe.Lower
