import LeanCert.Validity.Dyadic

/-! A kernel-checked exponential certificate for the finite auxiliary domain
of the production phase integral. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos

open LeanCert.Core LeanCert.Validity

private def cutoffExpr : Expr := .exp (.const (-40))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem cutoff_checked :
    checkUpperBoundDyadicChecked cutoffExpr 0 0 (by norm_num)
      (1 / 10 ^ 17) (-100) 20 = true := by
  decide +kernel

/-- The auxiliary cutoff consumes at most `10⁻¹⁷` of the response error.
The domain check and the dyadic enclosure are both reduced in the Lean kernel. -/
theorem exp_neg_forty_le : Real.exp (-40) ≤ (1 / 10 ^ 17 : ℝ) := by
  have h := verify_upper_bound_dyadic_checked cutoffExpr 0 0 (by norm_num)
    (1 / 10 ^ 17) (-100) 20 (by norm_num) cutoff_checked 0 (by norm_num)
  simpa [cutoffExpr, Expr.eval] using h

end Grothe.UpperChaos
