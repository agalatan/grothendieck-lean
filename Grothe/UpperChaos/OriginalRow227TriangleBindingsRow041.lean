import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow041

theorem block0614_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (40 + i.val) = some (values0614[i.val]'(by rw [values0614_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0614_lookup i)

theorem block0614_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (40 + i.val) = (values0614[i.val]'(by rw [values0614_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0614_lookup i)

theorem block0615_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (72 + i.val) = some (values0615[i.val]'(by rw [values0615_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0615_lookup i)

theorem block0615_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (72 + i.val) = (values0615[i.val]'(by rw [values0615_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0615_lookup i)

theorem block0616_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (104 + i.val) = some (values0616[i.val]'(by rw [values0616_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0616_lookup i)

theorem block0616_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (104 + i.val) = (values0616[i.val]'(by rw [values0616_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0616_lookup i)

theorem block0617_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (136 + i.val) = some (values0617[i.val]'(by rw [values0617_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0617_lookup i)

theorem block0617_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (136 + i.val) = (values0617[i.val]'(by rw [values0617_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0617_lookup i)

theorem block0618_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (168 + i.val) = some (values0618[i.val]'(by rw [values0618_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0618_lookup i)

theorem block0618_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (168 + i.val) = (values0618[i.val]'(by rw [values0618_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0618_lookup i)

theorem block0619_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (200 + i.val) = some (values0619[i.val]'(by rw [values0619_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0619_lookup i)

theorem block0619_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (200 + i.val) = (values0619[i.val]'(by rw [values0619_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0619_lookup i)

theorem block0620_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (232 + i.val) = some (values0620[i.val]'(by rw [values0620_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0620_lookup i)

theorem block0620_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (232 + i.val) = (values0620[i.val]'(by rw [values0620_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0620_lookup i)

theorem block0621_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (264 + i.val) = some (values0621[i.val]'(by rw [values0621_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0621_lookup i)

theorem block0621_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (264 + i.val) = (values0621[i.val]'(by rw [values0621_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0621_lookup i)

theorem block0622_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (296 + i.val) = some (values0622[i.val]'(by rw [values0622_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0622_lookup i)

theorem block0622_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (296 + i.val) = (values0622[i.val]'(by rw [values0622_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0622_lookup i)

theorem block0623_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (328 + i.val) = some (values0623[i.val]'(by rw [values0623_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0623_lookup i)

theorem block0623_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (328 + i.val) = (values0623[i.val]'(by rw [values0623_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0623_lookup i)

theorem block0624_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (360 + i.val) = some (values0624[i.val]'(by rw [values0624_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0624_lookup i)

theorem block0624_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (360 + i.val) = (values0624[i.val]'(by rw [values0624_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0624_lookup i)

theorem block0625_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (392 + i.val) = some (values0625[i.val]'(by rw [values0625_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0625_lookup i)

theorem block0625_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (392 + i.val) = (values0625[i.val]'(by rw [values0625_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0625_lookup i)

theorem block0626_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 41 (424 + i.val) = some (values0626[i.val]'(by rw [values0626_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0626_lookup i)

theorem block0626_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 41 (424 + i.val) = (values0626[i.val]'(by rw [values0626_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0626_lookup i)

theorem block0627_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 41 (456 + i.val) = some (values0627[i.val]'(by rw [values0627_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row041_lookup _).trans (OriginalRow227TriangleLookupRow041.block0627_lookup i)

theorem block0627_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 41 (456 + i.val) = (values0627[i.val]'(by rw [values0627_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0627_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0614_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0614_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0615_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0615_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0616_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0616_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0617_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0617_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0618_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0618_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0619_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0619_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0620_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0620_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0621_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0621_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0622_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0622_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0623_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0623_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0624_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0624_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0625_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0625_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0626_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0626_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0627_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041.block0627_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041
