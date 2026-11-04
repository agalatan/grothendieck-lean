import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow115

theorem block1455_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (114 + i.val) = some (values1455[i.val]'(by rw [values1455_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1455_lookup i)

theorem block1455_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (114 + i.val) = (values1455[i.val]'(by rw [values1455_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1455_lookup i)

theorem block1456_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (146 + i.val) = some (values1456[i.val]'(by rw [values1456_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1456_lookup i)

theorem block1456_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (146 + i.val) = (values1456[i.val]'(by rw [values1456_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1456_lookup i)

theorem block1457_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (178 + i.val) = some (values1457[i.val]'(by rw [values1457_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1457_lookup i)

theorem block1457_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (178 + i.val) = (values1457[i.val]'(by rw [values1457_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1457_lookup i)

theorem block1458_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (210 + i.val) = some (values1458[i.val]'(by rw [values1458_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1458_lookup i)

theorem block1458_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (210 + i.val) = (values1458[i.val]'(by rw [values1458_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1458_lookup i)

theorem block1459_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (242 + i.val) = some (values1459[i.val]'(by rw [values1459_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1459_lookup i)

theorem block1459_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (242 + i.val) = (values1459[i.val]'(by rw [values1459_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1459_lookup i)

theorem block1460_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (274 + i.val) = some (values1460[i.val]'(by rw [values1460_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1460_lookup i)

theorem block1460_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (274 + i.val) = (values1460[i.val]'(by rw [values1460_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1460_lookup i)

theorem block1461_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (306 + i.val) = some (values1461[i.val]'(by rw [values1461_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1461_lookup i)

theorem block1461_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (306 + i.val) = (values1461[i.val]'(by rw [values1461_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1461_lookup i)

theorem block1462_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 115 (338 + i.val) = some (values1462[i.val]'(by rw [values1462_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1462_lookup i)

theorem block1462_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 115 (338 + i.val) = (values1462[i.val]'(by rw [values1462_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1462_lookup i)

theorem block1463_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 115 (370 + i.val) = some (values1463[i.val]'(by rw [values1463_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row115_lookup _).trans (OriginalRow227TriangleLookupRow115.block1463_lookup i)

theorem block1463_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 115 (370 + i.val) = (values1463[i.val]'(by rw [values1463_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1463_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1455_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1455_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1456_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1456_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1457_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1457_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1458_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1458_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1459_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1459_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1460_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1460_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1461_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1461_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1462_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1462_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1463_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115.block1463_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115
