import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow051

theorem block0747_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (50 + i.val) = some (values0747[i.val]'(by rw [values0747_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0747_lookup i)

theorem block0747_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (50 + i.val) = (values0747[i.val]'(by rw [values0747_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0747_lookup i)

theorem block0748_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (82 + i.val) = some (values0748[i.val]'(by rw [values0748_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0748_lookup i)

theorem block0748_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (82 + i.val) = (values0748[i.val]'(by rw [values0748_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0748_lookup i)

theorem block0749_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (114 + i.val) = some (values0749[i.val]'(by rw [values0749_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0749_lookup i)

theorem block0749_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (114 + i.val) = (values0749[i.val]'(by rw [values0749_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0749_lookup i)

theorem block0750_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (146 + i.val) = some (values0750[i.val]'(by rw [values0750_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0750_lookup i)

theorem block0750_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (146 + i.val) = (values0750[i.val]'(by rw [values0750_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0750_lookup i)

theorem block0751_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (178 + i.val) = some (values0751[i.val]'(by rw [values0751_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0751_lookup i)

theorem block0751_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (178 + i.val) = (values0751[i.val]'(by rw [values0751_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0751_lookup i)

theorem block0752_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (210 + i.val) = some (values0752[i.val]'(by rw [values0752_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0752_lookup i)

theorem block0752_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (210 + i.val) = (values0752[i.val]'(by rw [values0752_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0752_lookup i)

theorem block0753_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (242 + i.val) = some (values0753[i.val]'(by rw [values0753_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0753_lookup i)

theorem block0753_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (242 + i.val) = (values0753[i.val]'(by rw [values0753_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0753_lookup i)

theorem block0754_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (274 + i.val) = some (values0754[i.val]'(by rw [values0754_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0754_lookup i)

theorem block0754_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (274 + i.val) = (values0754[i.val]'(by rw [values0754_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0754_lookup i)

theorem block0755_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (306 + i.val) = some (values0755[i.val]'(by rw [values0755_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0755_lookup i)

theorem block0755_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (306 + i.val) = (values0755[i.val]'(by rw [values0755_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0755_lookup i)

theorem block0756_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (338 + i.val) = some (values0756[i.val]'(by rw [values0756_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0756_lookup i)

theorem block0756_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (338 + i.val) = (values0756[i.val]'(by rw [values0756_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0756_lookup i)

theorem block0757_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (370 + i.val) = some (values0757[i.val]'(by rw [values0757_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0757_lookup i)

theorem block0757_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (370 + i.val) = (values0757[i.val]'(by rw [values0757_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0757_lookup i)

theorem block0758_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 51 (402 + i.val) = some (values0758[i.val]'(by rw [values0758_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0758_lookup i)

theorem block0758_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 51 (402 + i.val) = (values0758[i.val]'(by rw [values0758_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0758_lookup i)

theorem block0759_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 51 (434 + i.val) = some (values0759[i.val]'(by rw [values0759_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row051_lookup _).trans (OriginalRow227TriangleLookupRow051.block0759_lookup i)

theorem block0759_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 51 (434 + i.val) = (values0759[i.val]'(by rw [values0759_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0759_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0747_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0747_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0748_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0748_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0749_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0749_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0750_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0750_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0751_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0751_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0752_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0752_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0753_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0753_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0754_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0754_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0755_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0755_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0756_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0756_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0757_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0757_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0758_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0758_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0759_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051.block0759_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051
