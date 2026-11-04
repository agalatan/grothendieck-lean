import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow111

theorem block1419_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (110 + i.val) = some (values1419[i.val]'(by rw [values1419_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1419_lookup i)

theorem block1419_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (110 + i.val) = (values1419[i.val]'(by rw [values1419_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1419_lookup i)

theorem block1420_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (142 + i.val) = some (values1420[i.val]'(by rw [values1420_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1420_lookup i)

theorem block1420_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (142 + i.val) = (values1420[i.val]'(by rw [values1420_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1420_lookup i)

theorem block1421_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (174 + i.val) = some (values1421[i.val]'(by rw [values1421_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1421_lookup i)

theorem block1421_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (174 + i.val) = (values1421[i.val]'(by rw [values1421_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1421_lookup i)

theorem block1422_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (206 + i.val) = some (values1422[i.val]'(by rw [values1422_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1422_lookup i)

theorem block1422_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (206 + i.val) = (values1422[i.val]'(by rw [values1422_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1422_lookup i)

theorem block1423_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (238 + i.val) = some (values1423[i.val]'(by rw [values1423_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1423_lookup i)

theorem block1423_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (238 + i.val) = (values1423[i.val]'(by rw [values1423_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1423_lookup i)

theorem block1424_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (270 + i.val) = some (values1424[i.val]'(by rw [values1424_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1424_lookup i)

theorem block1424_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (270 + i.val) = (values1424[i.val]'(by rw [values1424_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1424_lookup i)

theorem block1425_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (302 + i.val) = some (values1425[i.val]'(by rw [values1425_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1425_lookup i)

theorem block1425_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (302 + i.val) = (values1425[i.val]'(by rw [values1425_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1425_lookup i)

theorem block1426_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 111 (334 + i.val) = some (values1426[i.val]'(by rw [values1426_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1426_lookup i)

theorem block1426_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 111 (334 + i.val) = (values1426[i.val]'(by rw [values1426_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1426_lookup i)

theorem block1427_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 111 (366 + i.val) = some (values1427[i.val]'(by rw [values1427_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row111_lookup _).trans (OriginalRow227TriangleLookupRow111.block1427_lookup i)

theorem block1427_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 111 (366 + i.val) = (values1427[i.val]'(by rw [values1427_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1427_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1419_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1419_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1420_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1420_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1421_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1421_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1422_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1422_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1423_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1423_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1424_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1424_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1425_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1425_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1426_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1426_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1427_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111.block1427_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111
