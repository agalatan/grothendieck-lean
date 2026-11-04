import Grothe.UpperChaos.Q0GaussNodeMass
import Grothe.UpperChaos.Q0GaussFullSchedule
import Grothe.UpperChaos.Q0GaussSourceAddress
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! The saved ordinal ledger and source panel/rule addresses are equivalent.
This is a finite address identity; Gauss quadrature and its integration
remainder remain separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussOrdinalEquiv

open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussNodeMass

/-- The source panel selected by the unique ledger row at this ordinal. -/
noncomputable def rowSource (i : Fin 21577) : Fin sourcePanels.length :=
  Classical.choose (Grothe.UpperChaos.Q0GaussFullSchedule.row_address
    (rowAt i) (rowAt_spec i).1)

theorem rowSource_spec (i : Fin 21577) :
    (rowAt i).panel = (rowSource i).val ∧
    (rowAt i).rule < (sourcePanels.get (rowSource i)).order ∧
    (rowAt i).index = (sourcePanels.get (rowSource i)).offset + (rowAt i).rule :=
  Classical.choose_spec (Grothe.UpperChaos.Q0GaussFullSchedule.row_address
    (rowAt i) (rowAt_spec i).1)

/-- Recover the source panel and rule index for a saved ordinal. -/
noncomputable def toAddress (i : Fin 21577) : Address :=
  ⟨rowSource i, ⟨(rowAt i).rule, (rowSource_spec i).2.1⟩⟩

/-- The saved row and its recovered address have the same index and panel. -/
theorem toAddress_spec (i : Fin 21577) :
    (rowAt i).panel = (toAddress i).1.val ∧
    (rowAt i).rule = (toAddress i).2.val ∧
    (rowAt i).index = (sourcePanels.get (toAddress i).1).offset + (toAddress i).2.val := by
  exact ⟨(rowSource_spec i).1, rfl, (rowSource_spec i).2.2⟩

/-- Going from an ordinal to its source address and back preserves it. -/
theorem from_to (i : Fin 21577) : fromAddress (toAddress i) = i := by
  apply Fin.ext
  change (sourcePanels.get (rowSource i)).offset + (rowAt i).rule = i.val
  exact (rowSource_spec i).2.2.symm.trans (rowAt_spec i).2

/-- Going from a source address to its ordinal and back preserves both
its panel and its rule index. -/
theorem to_from (a : Address) : toAddress (fromAddress a) = a := by
  let i := fromAddress a
  have hs := rowSource_spec i
  have hr := rowAt_spec i
  have heq : (sourcePanels.get (rowSource i)).offset + (rowAt i).rule =
      (sourcePanels.get a.1).offset + a.2.val := by
    calc
      _ = (rowAt i).index := hs.2.2.symm
      _ = i.val := hr.2
      _ = (sourcePanels.get a.1).offset + a.2.val := rfl
  have hu := scanned_address_unique sourcePanels 0 21577 complete_scan
    (rowSource i) a.1 (rowAt i).rule a.2.val hs.2.1 a.2.isLt heq
  change (⟨rowSource i, ⟨(rowAt i).rule, hs.2.1⟩⟩ : Address) = a
  apply Sigma.ext hu.1
  apply (Fin.heq_ext_iff (congrArg (fun p => (sourcePanels.get p).order) hu.1)).2
  exact hu.2

/-- No source address is omitted or duplicated when passing to the saved
ordinal ledger. -/
noncomputable def ordinalEquiv : Fin 21577 ≃ Address where
  toFun := toAddress
  invFun := fromAddress
  left_inv := from_to
  right_inv := to_from

/-- The inverse is exactly the source panel's cumulative offset plus rule. -/
theorem inverse_ordinal (a : Address) :
    ((ordinalEquiv.symm a : Fin 21577) : ℕ) =
      (sourcePanels.get a.1).offset + a.2.val := rfl

/-- The recovered source panel's order is supported by the selected rules. -/
theorem source_order_bounds (a : Address) :
    1 ≤ (sourcePanels.get a.1).order ∧ (sourcePanels.get a.1).order ≤ 64 :=
  scan_member_order_bounds sourcePanels 0 21577 complete_scan
    (sourcePanels.get a.1) (List.get_mem sourcePanels a.1)

end Grothe.UpperChaos.Q0GaussOrdinalEquiv

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.Q0GaussOrdinalEquiv.scan_member_order_bounds,
    ``Grothe.UpperChaos.Q0GaussOrdinalEquiv.from_to,
    ``Grothe.UpperChaos.Q0GaussOrdinalEquiv.to_from,
    ``Grothe.UpperChaos.Q0GaussOrdinalEquiv.ordinalEquiv,
    ``Grothe.UpperChaos.Q0GaussOrdinalEquiv.inverse_ordinal,
    ``Grothe.UpperChaos.Q0GaussOrdinalEquiv.source_order_bounds]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Gauss ordinal equivalence audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
