import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow120

theorem block1500_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (119 + i.val) = some (values1500[i.val]'(by rw [values1500_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1500_lookup i)

theorem block1500_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (119 + i.val) = (values1500[i.val]'(by rw [values1500_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1500_lookup i)

theorem block1501_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (151 + i.val) = some (values1501[i.val]'(by rw [values1501_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1501_lookup i)

theorem block1501_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (151 + i.val) = (values1501[i.val]'(by rw [values1501_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1501_lookup i)

theorem block1502_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (183 + i.val) = some (values1502[i.val]'(by rw [values1502_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1502_lookup i)

theorem block1502_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (183 + i.val) = (values1502[i.val]'(by rw [values1502_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1502_lookup i)

theorem block1503_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (215 + i.val) = some (values1503[i.val]'(by rw [values1503_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1503_lookup i)

theorem block1503_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (215 + i.val) = (values1503[i.val]'(by rw [values1503_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1503_lookup i)

theorem block1504_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (247 + i.val) = some (values1504[i.val]'(by rw [values1504_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1504_lookup i)

theorem block1504_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (247 + i.val) = (values1504[i.val]'(by rw [values1504_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1504_lookup i)

theorem block1505_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (279 + i.val) = some (values1505[i.val]'(by rw [values1505_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1505_lookup i)

theorem block1505_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (279 + i.val) = (values1505[i.val]'(by rw [values1505_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1505_lookup i)

theorem block1506_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (311 + i.val) = some (values1506[i.val]'(by rw [values1506_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1506_lookup i)

theorem block1506_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (311 + i.val) = (values1506[i.val]'(by rw [values1506_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1506_lookup i)

theorem block1507_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 120 (343 + i.val) = some (values1507[i.val]'(by rw [values1507_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1507_lookup i)

theorem block1507_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 120 (343 + i.val) = (values1507[i.val]'(by rw [values1507_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1507_lookup i)

theorem block1508_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 120 (375 + i.val) = some (values1508[i.val]'(by rw [values1508_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row120_lookup _).trans (OriginalRow227TriangleLookupRow120.block1508_lookup i)

theorem block1508_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 120 (375 + i.val) = (values1508[i.val]'(by rw [values1508_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1508_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1500_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1500_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1501_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1501_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1502_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1502_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1503_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1503_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1504_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1504_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1505_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1505_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1506_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1506_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1507_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1507_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1508_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120.block1508_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120
