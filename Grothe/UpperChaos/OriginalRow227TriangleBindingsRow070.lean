import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow070

theorem block0984_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (69 + i.val) = some (values0984[i.val]'(by rw [values0984_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0984_lookup i)

theorem block0984_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (69 + i.val) = (values0984[i.val]'(by rw [values0984_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0984_lookup i)

theorem block0985_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (101 + i.val) = some (values0985[i.val]'(by rw [values0985_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0985_lookup i)

theorem block0985_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (101 + i.val) = (values0985[i.val]'(by rw [values0985_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0985_lookup i)

theorem block0986_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (133 + i.val) = some (values0986[i.val]'(by rw [values0986_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0986_lookup i)

theorem block0986_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (133 + i.val) = (values0986[i.val]'(by rw [values0986_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0986_lookup i)

theorem block0987_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (165 + i.val) = some (values0987[i.val]'(by rw [values0987_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0987_lookup i)

theorem block0987_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (165 + i.val) = (values0987[i.val]'(by rw [values0987_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0987_lookup i)

theorem block0988_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (197 + i.val) = some (values0988[i.val]'(by rw [values0988_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0988_lookup i)

theorem block0988_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (197 + i.val) = (values0988[i.val]'(by rw [values0988_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0988_lookup i)

theorem block0989_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (229 + i.val) = some (values0989[i.val]'(by rw [values0989_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0989_lookup i)

theorem block0989_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (229 + i.val) = (values0989[i.val]'(by rw [values0989_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0989_lookup i)

theorem block0990_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (261 + i.val) = some (values0990[i.val]'(by rw [values0990_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0990_lookup i)

theorem block0990_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (261 + i.val) = (values0990[i.val]'(by rw [values0990_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0990_lookup i)

theorem block0991_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (293 + i.val) = some (values0991[i.val]'(by rw [values0991_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0991_lookup i)

theorem block0991_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (293 + i.val) = (values0991[i.val]'(by rw [values0991_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0991_lookup i)

theorem block0992_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (325 + i.val) = some (values0992[i.val]'(by rw [values0992_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0992_lookup i)

theorem block0992_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (325 + i.val) = (values0992[i.val]'(by rw [values0992_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0992_lookup i)

theorem block0993_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (357 + i.val) = some (values0993[i.val]'(by rw [values0993_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0993_lookup i)

theorem block0993_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (357 + i.val) = (values0993[i.val]'(by rw [values0993_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0993_lookup i)

theorem block0994_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 70 (389 + i.val) = some (values0994[i.val]'(by rw [values0994_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0994_lookup i)

theorem block0994_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 70 (389 + i.val) = (values0994[i.val]'(by rw [values0994_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0994_lookup i)

theorem block0995_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 70 (421 + i.val) = some (values0995[i.val]'(by rw [values0995_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row070_lookup _).trans (OriginalRow227TriangleLookupRow070.block0995_lookup i)

theorem block0995_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 70 (421 + i.val) = (values0995[i.val]'(by rw [values0995_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0995_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0984_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0984_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0985_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0985_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0986_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0986_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0987_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0987_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0988_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0988_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0989_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0989_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0990_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0990_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0991_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0991_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0992_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0992_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0993_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0993_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0994_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0994_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0995_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070.block0995_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070
