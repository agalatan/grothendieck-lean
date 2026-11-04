import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow060

theorem block0864_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (59 + i.val) = some (values0864[i.val]'(by rw [values0864_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0864_lookup i)

theorem block0864_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (59 + i.val) = (values0864[i.val]'(by rw [values0864_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0864_lookup i)

theorem block0865_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (91 + i.val) = some (values0865[i.val]'(by rw [values0865_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0865_lookup i)

theorem block0865_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (91 + i.val) = (values0865[i.val]'(by rw [values0865_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0865_lookup i)

theorem block0866_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (123 + i.val) = some (values0866[i.val]'(by rw [values0866_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0866_lookup i)

theorem block0866_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (123 + i.val) = (values0866[i.val]'(by rw [values0866_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0866_lookup i)

theorem block0867_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (155 + i.val) = some (values0867[i.val]'(by rw [values0867_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0867_lookup i)

theorem block0867_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (155 + i.val) = (values0867[i.val]'(by rw [values0867_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0867_lookup i)

theorem block0868_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (187 + i.val) = some (values0868[i.val]'(by rw [values0868_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0868_lookup i)

theorem block0868_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (187 + i.val) = (values0868[i.val]'(by rw [values0868_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0868_lookup i)

theorem block0869_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (219 + i.val) = some (values0869[i.val]'(by rw [values0869_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0869_lookup i)

theorem block0869_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (219 + i.val) = (values0869[i.val]'(by rw [values0869_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0869_lookup i)

theorem block0870_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (251 + i.val) = some (values0870[i.val]'(by rw [values0870_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0870_lookup i)

theorem block0870_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (251 + i.val) = (values0870[i.val]'(by rw [values0870_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0870_lookup i)

theorem block0871_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (283 + i.val) = some (values0871[i.val]'(by rw [values0871_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0871_lookup i)

theorem block0871_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (283 + i.val) = (values0871[i.val]'(by rw [values0871_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0871_lookup i)

theorem block0872_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (315 + i.val) = some (values0872[i.val]'(by rw [values0872_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0872_lookup i)

theorem block0872_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (315 + i.val) = (values0872[i.val]'(by rw [values0872_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0872_lookup i)

theorem block0873_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (347 + i.val) = some (values0873[i.val]'(by rw [values0873_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0873_lookup i)

theorem block0873_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (347 + i.val) = (values0873[i.val]'(by rw [values0873_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0873_lookup i)

theorem block0874_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 60 (379 + i.val) = some (values0874[i.val]'(by rw [values0874_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0874_lookup i)

theorem block0874_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 60 (379 + i.val) = (values0874[i.val]'(by rw [values0874_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0874_lookup i)

theorem block0875_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 60 (411 + i.val) = some (values0875[i.val]'(by rw [values0875_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row060_lookup _).trans (OriginalRow227TriangleLookupRow060.block0875_lookup i)

theorem block0875_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 60 (411 + i.val) = (values0875[i.val]'(by rw [values0875_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0875_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0864_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0864_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0865_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0865_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0866_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0866_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0867_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0867_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0868_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0868_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0869_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0869_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0870_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0870_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0871_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0871_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0872_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0872_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0873_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0873_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0874_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0874_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0875_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060.block0875_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060
