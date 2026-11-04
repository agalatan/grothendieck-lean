import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow113

theorem block1437_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (112 + i.val) = some (values1437[i.val]'(by rw [values1437_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1437_lookup i)

theorem block1437_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (112 + i.val) = (values1437[i.val]'(by rw [values1437_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1437_lookup i)

theorem block1438_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (144 + i.val) = some (values1438[i.val]'(by rw [values1438_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1438_lookup i)

theorem block1438_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (144 + i.val) = (values1438[i.val]'(by rw [values1438_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1438_lookup i)

theorem block1439_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (176 + i.val) = some (values1439[i.val]'(by rw [values1439_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1439_lookup i)

theorem block1439_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (176 + i.val) = (values1439[i.val]'(by rw [values1439_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1439_lookup i)

theorem block1440_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (208 + i.val) = some (values1440[i.val]'(by rw [values1440_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1440_lookup i)

theorem block1440_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (208 + i.val) = (values1440[i.val]'(by rw [values1440_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1440_lookup i)

theorem block1441_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (240 + i.val) = some (values1441[i.val]'(by rw [values1441_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1441_lookup i)

theorem block1441_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (240 + i.val) = (values1441[i.val]'(by rw [values1441_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1441_lookup i)

theorem block1442_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (272 + i.val) = some (values1442[i.val]'(by rw [values1442_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1442_lookup i)

theorem block1442_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (272 + i.val) = (values1442[i.val]'(by rw [values1442_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1442_lookup i)

theorem block1443_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (304 + i.val) = some (values1443[i.val]'(by rw [values1443_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1443_lookup i)

theorem block1443_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (304 + i.val) = (values1443[i.val]'(by rw [values1443_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1443_lookup i)

theorem block1444_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 113 (336 + i.val) = some (values1444[i.val]'(by rw [values1444_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1444_lookup i)

theorem block1444_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 113 (336 + i.val) = (values1444[i.val]'(by rw [values1444_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1444_lookup i)

theorem block1445_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 113 (368 + i.val) = some (values1445[i.val]'(by rw [values1445_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row113_lookup _).trans (OriginalRow227TriangleLookupRow113.block1445_lookup i)

theorem block1445_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 113 (368 + i.val) = (values1445[i.val]'(by rw [values1445_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1445_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1437_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1437_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1438_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1438_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1439_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1439_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1440_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1440_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1441_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1441_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1442_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1442_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1443_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1443_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1444_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1444_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1445_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113.block1445_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113
