import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow052

theorem block0760_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (51 + i.val) = some (values0760[i.val]'(by rw [values0760_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0760_lookup i)

theorem block0760_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (51 + i.val) = (values0760[i.val]'(by rw [values0760_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0760_lookup i)

theorem block0761_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (83 + i.val) = some (values0761[i.val]'(by rw [values0761_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0761_lookup i)

theorem block0761_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (83 + i.val) = (values0761[i.val]'(by rw [values0761_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0761_lookup i)

theorem block0762_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (115 + i.val) = some (values0762[i.val]'(by rw [values0762_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0762_lookup i)

theorem block0762_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (115 + i.val) = (values0762[i.val]'(by rw [values0762_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0762_lookup i)

theorem block0763_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (147 + i.val) = some (values0763[i.val]'(by rw [values0763_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0763_lookup i)

theorem block0763_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (147 + i.val) = (values0763[i.val]'(by rw [values0763_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0763_lookup i)

theorem block0764_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (179 + i.val) = some (values0764[i.val]'(by rw [values0764_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0764_lookup i)

theorem block0764_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (179 + i.val) = (values0764[i.val]'(by rw [values0764_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0764_lookup i)

theorem block0765_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (211 + i.val) = some (values0765[i.val]'(by rw [values0765_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0765_lookup i)

theorem block0765_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (211 + i.val) = (values0765[i.val]'(by rw [values0765_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0765_lookup i)

theorem block0766_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (243 + i.val) = some (values0766[i.val]'(by rw [values0766_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0766_lookup i)

theorem block0766_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (243 + i.val) = (values0766[i.val]'(by rw [values0766_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0766_lookup i)

theorem block0767_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (275 + i.val) = some (values0767[i.val]'(by rw [values0767_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0767_lookup i)

theorem block0767_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (275 + i.val) = (values0767[i.val]'(by rw [values0767_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0767_lookup i)

theorem block0768_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (307 + i.val) = some (values0768[i.val]'(by rw [values0768_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0768_lookup i)

theorem block0768_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (307 + i.val) = (values0768[i.val]'(by rw [values0768_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0768_lookup i)

theorem block0769_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (339 + i.val) = some (values0769[i.val]'(by rw [values0769_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0769_lookup i)

theorem block0769_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (339 + i.val) = (values0769[i.val]'(by rw [values0769_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0769_lookup i)

theorem block0770_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (371 + i.val) = some (values0770[i.val]'(by rw [values0770_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0770_lookup i)

theorem block0770_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (371 + i.val) = (values0770[i.val]'(by rw [values0770_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0770_lookup i)

theorem block0771_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 52 (403 + i.val) = some (values0771[i.val]'(by rw [values0771_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0771_lookup i)

theorem block0771_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 52 (403 + i.val) = (values0771[i.val]'(by rw [values0771_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0771_lookup i)

theorem block0772_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 52 (435 + i.val) = some (values0772[i.val]'(by rw [values0772_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row052_lookup _).trans (OriginalRow227TriangleLookupRow052.block0772_lookup i)

theorem block0772_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 52 (435 + i.val) = (values0772[i.val]'(by rw [values0772_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0772_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0760_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0760_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0761_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0761_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0762_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0762_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0763_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0763_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0764_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0764_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0765_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0765_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0766_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0766_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0767_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0767_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0768_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0768_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0769_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0769_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0770_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0770_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0771_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0771_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0772_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052.block0772_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052
