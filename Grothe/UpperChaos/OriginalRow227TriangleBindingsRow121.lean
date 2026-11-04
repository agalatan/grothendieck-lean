import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow121

theorem block1509_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (120 + i.val) = some (values1509[i.val]'(by rw [values1509_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1509_lookup i)

theorem block1509_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (120 + i.val) = (values1509[i.val]'(by rw [values1509_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1509_lookup i)

theorem block1510_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (152 + i.val) = some (values1510[i.val]'(by rw [values1510_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1510_lookup i)

theorem block1510_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (152 + i.val) = (values1510[i.val]'(by rw [values1510_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1510_lookup i)

theorem block1511_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (184 + i.val) = some (values1511[i.val]'(by rw [values1511_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1511_lookup i)

theorem block1511_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (184 + i.val) = (values1511[i.val]'(by rw [values1511_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1511_lookup i)

theorem block1512_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (216 + i.val) = some (values1512[i.val]'(by rw [values1512_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1512_lookup i)

theorem block1512_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (216 + i.val) = (values1512[i.val]'(by rw [values1512_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1512_lookup i)

theorem block1513_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (248 + i.val) = some (values1513[i.val]'(by rw [values1513_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1513_lookup i)

theorem block1513_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (248 + i.val) = (values1513[i.val]'(by rw [values1513_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1513_lookup i)

theorem block1514_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (280 + i.val) = some (values1514[i.val]'(by rw [values1514_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1514_lookup i)

theorem block1514_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (280 + i.val) = (values1514[i.val]'(by rw [values1514_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1514_lookup i)

theorem block1515_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (312 + i.val) = some (values1515[i.val]'(by rw [values1515_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1515_lookup i)

theorem block1515_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (312 + i.val) = (values1515[i.val]'(by rw [values1515_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1515_lookup i)

theorem block1516_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 121 (344 + i.val) = some (values1516[i.val]'(by rw [values1516_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1516_lookup i)

theorem block1516_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 121 (344 + i.val) = (values1516[i.val]'(by rw [values1516_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1516_lookup i)

theorem block1517_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 121 (376 + i.val) = some (values1517[i.val]'(by rw [values1517_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row121_lookup _).trans (OriginalRow227TriangleLookupRow121.block1517_lookup i)

theorem block1517_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 121 (376 + i.val) = (values1517[i.val]'(by rw [values1517_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1517_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1509_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1509_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1510_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1510_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1511_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1511_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1512_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1512_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1513_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1513_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1514_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1514_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1515_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1515_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1516_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1516_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1517_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121.block1517_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121
