import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow050

theorem block0734_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (49 + i.val) = some (values0734[i.val]'(by rw [values0734_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0734_lookup i)

theorem block0734_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (49 + i.val) = (values0734[i.val]'(by rw [values0734_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0734_lookup i)

theorem block0735_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (81 + i.val) = some (values0735[i.val]'(by rw [values0735_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0735_lookup i)

theorem block0735_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (81 + i.val) = (values0735[i.val]'(by rw [values0735_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0735_lookup i)

theorem block0736_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (113 + i.val) = some (values0736[i.val]'(by rw [values0736_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0736_lookup i)

theorem block0736_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (113 + i.val) = (values0736[i.val]'(by rw [values0736_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0736_lookup i)

theorem block0737_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (145 + i.val) = some (values0737[i.val]'(by rw [values0737_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0737_lookup i)

theorem block0737_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (145 + i.val) = (values0737[i.val]'(by rw [values0737_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0737_lookup i)

theorem block0738_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (177 + i.val) = some (values0738[i.val]'(by rw [values0738_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0738_lookup i)

theorem block0738_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (177 + i.val) = (values0738[i.val]'(by rw [values0738_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0738_lookup i)

theorem block0739_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (209 + i.val) = some (values0739[i.val]'(by rw [values0739_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0739_lookup i)

theorem block0739_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (209 + i.val) = (values0739[i.val]'(by rw [values0739_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0739_lookup i)

theorem block0740_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (241 + i.val) = some (values0740[i.val]'(by rw [values0740_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0740_lookup i)

theorem block0740_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (241 + i.val) = (values0740[i.val]'(by rw [values0740_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0740_lookup i)

theorem block0741_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (273 + i.val) = some (values0741[i.val]'(by rw [values0741_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0741_lookup i)

theorem block0741_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (273 + i.val) = (values0741[i.val]'(by rw [values0741_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0741_lookup i)

theorem block0742_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (305 + i.val) = some (values0742[i.val]'(by rw [values0742_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0742_lookup i)

theorem block0742_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (305 + i.val) = (values0742[i.val]'(by rw [values0742_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0742_lookup i)

theorem block0743_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (337 + i.val) = some (values0743[i.val]'(by rw [values0743_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0743_lookup i)

theorem block0743_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (337 + i.val) = (values0743[i.val]'(by rw [values0743_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0743_lookup i)

theorem block0744_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (369 + i.val) = some (values0744[i.val]'(by rw [values0744_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0744_lookup i)

theorem block0744_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (369 + i.val) = (values0744[i.val]'(by rw [values0744_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0744_lookup i)

theorem block0745_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 50 (401 + i.val) = some (values0745[i.val]'(by rw [values0745_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0745_lookup i)

theorem block0745_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 50 (401 + i.val) = (values0745[i.val]'(by rw [values0745_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0745_lookup i)

theorem block0746_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 50 (433 + i.val) = some (values0746[i.val]'(by rw [values0746_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row050_lookup _).trans (OriginalRow227TriangleLookupRow050.block0746_lookup i)

theorem block0746_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 50 (433 + i.val) = (values0746[i.val]'(by rw [values0746_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0746_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0734_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0734_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0735_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0735_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0736_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0736_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0737_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0737_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0738_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0738_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0739_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0739_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0740_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0740_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0741_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0741_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0742_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0742_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0743_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0743_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0744_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0744_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0745_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0745_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0746_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050.block0746_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050
