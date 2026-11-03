import Grothe.UpperChaos.Q0GaussOrdinalEquiv
import Grothe.UpperChaos.Q0OrdinalSum

/-! Reindex the saved finite ledger by source panel and rule index. This
is separate from identifying the formulas with the production quadrature.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussMassReindex

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussNodeMass

/-- The ledger sum and the full source panel/rule sum have the same terms. -/
theorem ledger_sum_eq_source_sum :
    (Grothe.UpperChaos.Q0NodeMassAll.rows.map
      (fun r => weight r.index * Real.exp (-(node r.index)))).sum =
    ∑ p : Fin sourcePanels.length, ∑ j : Fin (sourcePanels.get p).order,
      weight ((sourcePanels.get p).offset + j.val) *
        Real.exp (-(node ((sourcePanels.get p).offset + j.val))) := by
  let f : ℕ → ℝ := fun i => weight i * Real.exp (-(node i))
  have h := Grothe.UpperChaos.Q0OrdinalSum.rows_sum_equiv
    Grothe.UpperChaos.Q0NodeMassCheck.Row.index Grothe.UpperChaos.Q0NodeMassAll.rows
    21577 Grothe.UpperChaos.Q0NodeMassAll.indices ordinalEquiv f
    (fun a : Address => f (fromAddress a).val) (by
      intro i
      change f i.val = f ((ordinalEquiv.symm (ordinalEquiv i)).val)
      rw [Equiv.symm_apply_apply])
  simpa only [f, Fintype.sum_sigma, fromAddress] using h

end Grothe.UpperChaos.Q0GaussMassReindex
