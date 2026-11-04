import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow137

theorem block1640_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (136 + i.val) = some (values1640[i.val]'(by rw [values1640_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1640_lookup i)

theorem block1640_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (136 + i.val) = (values1640[i.val]'(by rw [values1640_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1640_lookup i)

theorem block1641_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (168 + i.val) = some (values1641[i.val]'(by rw [values1641_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1641_lookup i)

theorem block1641_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (168 + i.val) = (values1641[i.val]'(by rw [values1641_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1641_lookup i)

theorem block1642_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (200 + i.val) = some (values1642[i.val]'(by rw [values1642_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1642_lookup i)

theorem block1642_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (200 + i.val) = (values1642[i.val]'(by rw [values1642_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1642_lookup i)

theorem block1643_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (232 + i.val) = some (values1643[i.val]'(by rw [values1643_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1643_lookup i)

theorem block1643_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (232 + i.val) = (values1643[i.val]'(by rw [values1643_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1643_lookup i)

theorem block1644_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (264 + i.val) = some (values1644[i.val]'(by rw [values1644_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1644_lookup i)

theorem block1644_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (264 + i.val) = (values1644[i.val]'(by rw [values1644_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1644_lookup i)

theorem block1645_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (296 + i.val) = some (values1645[i.val]'(by rw [values1645_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1645_lookup i)

theorem block1645_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (296 + i.val) = (values1645[i.val]'(by rw [values1645_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1645_lookup i)

theorem block1646_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 137 (328 + i.val) = some (values1646[i.val]'(by rw [values1646_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1646_lookup i)

theorem block1646_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 137 (328 + i.val) = (values1646[i.val]'(by rw [values1646_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1646_lookup i)

theorem block1647_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 137 (360 + i.val) = some (values1647[i.val]'(by rw [values1647_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row137_lookup _).trans (OriginalRow227TriangleLookupRow137.block1647_lookup i)

theorem block1647_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 137 (360 + i.val) = (values1647[i.val]'(by rw [values1647_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1647_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1640_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1640_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1641_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1641_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1642_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1642_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1643_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1643_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1644_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1644_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1645_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1645_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1646_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1646_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1647_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137.block1647_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137
