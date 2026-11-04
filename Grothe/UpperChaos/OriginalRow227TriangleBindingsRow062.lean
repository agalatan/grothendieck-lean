import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow062

theorem block0888_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (61 + i.val) = some (values0888[i.val]'(by rw [values0888_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0888_lookup i)

theorem block0888_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (61 + i.val) = (values0888[i.val]'(by rw [values0888_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0888_lookup i)

theorem block0889_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (93 + i.val) = some (values0889[i.val]'(by rw [values0889_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0889_lookup i)

theorem block0889_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (93 + i.val) = (values0889[i.val]'(by rw [values0889_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0889_lookup i)

theorem block0890_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (125 + i.val) = some (values0890[i.val]'(by rw [values0890_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0890_lookup i)

theorem block0890_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (125 + i.val) = (values0890[i.val]'(by rw [values0890_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0890_lookup i)

theorem block0891_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (157 + i.val) = some (values0891[i.val]'(by rw [values0891_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0891_lookup i)

theorem block0891_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (157 + i.val) = (values0891[i.val]'(by rw [values0891_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0891_lookup i)

theorem block0892_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (189 + i.val) = some (values0892[i.val]'(by rw [values0892_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0892_lookup i)

theorem block0892_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (189 + i.val) = (values0892[i.val]'(by rw [values0892_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0892_lookup i)

theorem block0893_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (221 + i.val) = some (values0893[i.val]'(by rw [values0893_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0893_lookup i)

theorem block0893_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (221 + i.val) = (values0893[i.val]'(by rw [values0893_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0893_lookup i)

theorem block0894_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (253 + i.val) = some (values0894[i.val]'(by rw [values0894_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0894_lookup i)

theorem block0894_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (253 + i.val) = (values0894[i.val]'(by rw [values0894_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0894_lookup i)

theorem block0895_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (285 + i.val) = some (values0895[i.val]'(by rw [values0895_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0895_lookup i)

theorem block0895_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (285 + i.val) = (values0895[i.val]'(by rw [values0895_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0895_lookup i)

theorem block0896_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (317 + i.val) = some (values0896[i.val]'(by rw [values0896_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0896_lookup i)

theorem block0896_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (317 + i.val) = (values0896[i.val]'(by rw [values0896_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0896_lookup i)

theorem block0897_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (349 + i.val) = some (values0897[i.val]'(by rw [values0897_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0897_lookup i)

theorem block0897_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (349 + i.val) = (values0897[i.val]'(by rw [values0897_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0897_lookup i)

theorem block0898_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 62 (381 + i.val) = some (values0898[i.val]'(by rw [values0898_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0898_lookup i)

theorem block0898_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 62 (381 + i.val) = (values0898[i.val]'(by rw [values0898_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0898_lookup i)

theorem block0899_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 62 (413 + i.val) = some (values0899[i.val]'(by rw [values0899_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row062_lookup _).trans (OriginalRow227TriangleLookupRow062.block0899_lookup i)

theorem block0899_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 62 (413 + i.val) = (values0899[i.val]'(by rw [values0899_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0899_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0888_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0888_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0889_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0889_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0890_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0890_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0891_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0891_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0892_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0892_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0893_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0893_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0894_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0894_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0895_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0895_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0896_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0896_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0897_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0897_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0898_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0898_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0899_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062.block0899_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062
