import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow108

theorem block1392_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (107 + i.val) = some (values1392[i.val]'(by rw [values1392_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1392_lookup i)

theorem block1392_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (107 + i.val) = (values1392[i.val]'(by rw [values1392_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1392_lookup i)

theorem block1393_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (139 + i.val) = some (values1393[i.val]'(by rw [values1393_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1393_lookup i)

theorem block1393_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (139 + i.val) = (values1393[i.val]'(by rw [values1393_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1393_lookup i)

theorem block1394_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (171 + i.val) = some (values1394[i.val]'(by rw [values1394_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1394_lookup i)

theorem block1394_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (171 + i.val) = (values1394[i.val]'(by rw [values1394_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1394_lookup i)

theorem block1395_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (203 + i.val) = some (values1395[i.val]'(by rw [values1395_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1395_lookup i)

theorem block1395_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (203 + i.val) = (values1395[i.val]'(by rw [values1395_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1395_lookup i)

theorem block1396_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (235 + i.val) = some (values1396[i.val]'(by rw [values1396_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1396_lookup i)

theorem block1396_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (235 + i.val) = (values1396[i.val]'(by rw [values1396_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1396_lookup i)

theorem block1397_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (267 + i.val) = some (values1397[i.val]'(by rw [values1397_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1397_lookup i)

theorem block1397_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (267 + i.val) = (values1397[i.val]'(by rw [values1397_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1397_lookup i)

theorem block1398_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (299 + i.val) = some (values1398[i.val]'(by rw [values1398_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1398_lookup i)

theorem block1398_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (299 + i.val) = (values1398[i.val]'(by rw [values1398_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1398_lookup i)

theorem block1399_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 108 (331 + i.val) = some (values1399[i.val]'(by rw [values1399_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1399_lookup i)

theorem block1399_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 108 (331 + i.val) = (values1399[i.val]'(by rw [values1399_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1399_lookup i)

theorem block1400_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 108 (363 + i.val) = some (values1400[i.val]'(by rw [values1400_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row108_lookup _).trans (OriginalRow227TriangleLookupRow108.block1400_lookup i)

theorem block1400_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 108 (363 + i.val) = (values1400[i.val]'(by rw [values1400_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1400_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1392_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1392_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1393_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1393_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1394_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1394_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1395_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1395_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1396_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1396_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1397_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1397_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1398_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1398_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1399_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1399_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1400_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108.block1400_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108
