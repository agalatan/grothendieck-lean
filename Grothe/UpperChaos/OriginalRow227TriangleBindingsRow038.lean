import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow038

theorem block0572_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (37 + i.val) = some (values0572[i.val]'(by rw [values0572_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0572_lookup i)

theorem block0572_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (37 + i.val) = (values0572[i.val]'(by rw [values0572_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0572_lookup i)

theorem block0573_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (69 + i.val) = some (values0573[i.val]'(by rw [values0573_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0573_lookup i)

theorem block0573_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (69 + i.val) = (values0573[i.val]'(by rw [values0573_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0573_lookup i)

theorem block0574_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (101 + i.val) = some (values0574[i.val]'(by rw [values0574_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0574_lookup i)

theorem block0574_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (101 + i.val) = (values0574[i.val]'(by rw [values0574_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0574_lookup i)

theorem block0575_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (133 + i.val) = some (values0575[i.val]'(by rw [values0575_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0575_lookup i)

theorem block0575_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (133 + i.val) = (values0575[i.val]'(by rw [values0575_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0575_lookup i)

theorem block0576_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (165 + i.val) = some (values0576[i.val]'(by rw [values0576_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0576_lookup i)

theorem block0576_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (165 + i.val) = (values0576[i.val]'(by rw [values0576_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0576_lookup i)

theorem block0577_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (197 + i.val) = some (values0577[i.val]'(by rw [values0577_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0577_lookup i)

theorem block0577_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (197 + i.val) = (values0577[i.val]'(by rw [values0577_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0577_lookup i)

theorem block0578_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (229 + i.val) = some (values0578[i.val]'(by rw [values0578_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0578_lookup i)

theorem block0578_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (229 + i.val) = (values0578[i.val]'(by rw [values0578_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0578_lookup i)

theorem block0579_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (261 + i.val) = some (values0579[i.val]'(by rw [values0579_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0579_lookup i)

theorem block0579_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (261 + i.val) = (values0579[i.val]'(by rw [values0579_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0579_lookup i)

theorem block0580_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (293 + i.val) = some (values0580[i.val]'(by rw [values0580_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0580_lookup i)

theorem block0580_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (293 + i.val) = (values0580[i.val]'(by rw [values0580_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0580_lookup i)

theorem block0581_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (325 + i.val) = some (values0581[i.val]'(by rw [values0581_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0581_lookup i)

theorem block0581_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (325 + i.val) = (values0581[i.val]'(by rw [values0581_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0581_lookup i)

theorem block0582_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (357 + i.val) = some (values0582[i.val]'(by rw [values0582_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0582_lookup i)

theorem block0582_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (357 + i.val) = (values0582[i.val]'(by rw [values0582_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0582_lookup i)

theorem block0583_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (389 + i.val) = some (values0583[i.val]'(by rw [values0583_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0583_lookup i)

theorem block0583_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (389 + i.val) = (values0583[i.val]'(by rw [values0583_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0583_lookup i)

theorem block0584_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 38 (421 + i.val) = some (values0584[i.val]'(by rw [values0584_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0584_lookup i)

theorem block0584_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 38 (421 + i.val) = (values0584[i.val]'(by rw [values0584_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0584_lookup i)

theorem block0585_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 38 (453 + i.val) = some (values0585[i.val]'(by rw [values0585_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row038_lookup _).trans (OriginalRow227TriangleLookupRow038.block0585_lookup i)

theorem block0585_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 38 (453 + i.val) = (values0585[i.val]'(by rw [values0585_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0585_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0572_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0572_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0573_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0573_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0574_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0574_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0575_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0575_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0576_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0576_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0577_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0577_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0578_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0578_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0579_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0579_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0580_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0580_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0581_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0581_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0582_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0582_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0583_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0583_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0584_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0584_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0585_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038.block0585_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038
