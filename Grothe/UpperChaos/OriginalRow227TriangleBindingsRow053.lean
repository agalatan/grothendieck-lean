import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow053

theorem block0773_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (52 + i.val) = some (values0773[i.val]'(by rw [values0773_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0773_lookup i)

theorem block0773_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (52 + i.val) = (values0773[i.val]'(by rw [values0773_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0773_lookup i)

theorem block0774_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (84 + i.val) = some (values0774[i.val]'(by rw [values0774_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0774_lookup i)

theorem block0774_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (84 + i.val) = (values0774[i.val]'(by rw [values0774_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0774_lookup i)

theorem block0775_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (116 + i.val) = some (values0775[i.val]'(by rw [values0775_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0775_lookup i)

theorem block0775_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (116 + i.val) = (values0775[i.val]'(by rw [values0775_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0775_lookup i)

theorem block0776_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (148 + i.val) = some (values0776[i.val]'(by rw [values0776_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0776_lookup i)

theorem block0776_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (148 + i.val) = (values0776[i.val]'(by rw [values0776_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0776_lookup i)

theorem block0777_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (180 + i.val) = some (values0777[i.val]'(by rw [values0777_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0777_lookup i)

theorem block0777_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (180 + i.val) = (values0777[i.val]'(by rw [values0777_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0777_lookup i)

theorem block0778_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (212 + i.val) = some (values0778[i.val]'(by rw [values0778_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0778_lookup i)

theorem block0778_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (212 + i.val) = (values0778[i.val]'(by rw [values0778_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0778_lookup i)

theorem block0779_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (244 + i.val) = some (values0779[i.val]'(by rw [values0779_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0779_lookup i)

theorem block0779_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (244 + i.val) = (values0779[i.val]'(by rw [values0779_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0779_lookup i)

theorem block0780_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (276 + i.val) = some (values0780[i.val]'(by rw [values0780_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0780_lookup i)

theorem block0780_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (276 + i.val) = (values0780[i.val]'(by rw [values0780_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0780_lookup i)

theorem block0781_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (308 + i.val) = some (values0781[i.val]'(by rw [values0781_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0781_lookup i)

theorem block0781_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (308 + i.val) = (values0781[i.val]'(by rw [values0781_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0781_lookup i)

theorem block0782_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (340 + i.val) = some (values0782[i.val]'(by rw [values0782_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0782_lookup i)

theorem block0782_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (340 + i.val) = (values0782[i.val]'(by rw [values0782_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0782_lookup i)

theorem block0783_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (372 + i.val) = some (values0783[i.val]'(by rw [values0783_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0783_lookup i)

theorem block0783_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (372 + i.val) = (values0783[i.val]'(by rw [values0783_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0783_lookup i)

theorem block0784_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 53 (404 + i.val) = some (values0784[i.val]'(by rw [values0784_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0784_lookup i)

theorem block0784_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 53 (404 + i.val) = (values0784[i.val]'(by rw [values0784_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0784_lookup i)

theorem block0785_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 53 (436 + i.val) = some (values0785[i.val]'(by rw [values0785_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row053_lookup _).trans (OriginalRow227TriangleLookupRow053.block0785_lookup i)

theorem block0785_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 53 (436 + i.val) = (values0785[i.val]'(by rw [values0785_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0785_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0773_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0773_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0774_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0774_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0775_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0775_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0776_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0776_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0777_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0777_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0778_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0778_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0779_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0779_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0780_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0780_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0781_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0781_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0782_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0782_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0783_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0783_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0784_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0784_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0785_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053.block0785_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053
