import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow126

theorem block1552_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (125 + i.val) = some (values1552[i.val]'(by rw [values1552_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1552_lookup i)

theorem block1552_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (125 + i.val) = (values1552[i.val]'(by rw [values1552_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1552_lookup i)

theorem block1553_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (157 + i.val) = some (values1553[i.val]'(by rw [values1553_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1553_lookup i)

theorem block1553_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (157 + i.val) = (values1553[i.val]'(by rw [values1553_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1553_lookup i)

theorem block1554_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (189 + i.val) = some (values1554[i.val]'(by rw [values1554_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1554_lookup i)

theorem block1554_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (189 + i.val) = (values1554[i.val]'(by rw [values1554_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1554_lookup i)

theorem block1555_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (221 + i.val) = some (values1555[i.val]'(by rw [values1555_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1555_lookup i)

theorem block1555_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (221 + i.val) = (values1555[i.val]'(by rw [values1555_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1555_lookup i)

theorem block1556_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (253 + i.val) = some (values1556[i.val]'(by rw [values1556_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1556_lookup i)

theorem block1556_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (253 + i.val) = (values1556[i.val]'(by rw [values1556_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1556_lookup i)

theorem block1557_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (285 + i.val) = some (values1557[i.val]'(by rw [values1557_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1557_lookup i)

theorem block1557_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (285 + i.val) = (values1557[i.val]'(by rw [values1557_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1557_lookup i)

theorem block1558_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 126 (317 + i.val) = some (values1558[i.val]'(by rw [values1558_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1558_lookup i)

theorem block1558_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 126 (317 + i.val) = (values1558[i.val]'(by rw [values1558_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1558_lookup i)

theorem block1559_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 126 (349 + i.val) = some (values1559[i.val]'(by rw [values1559_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row126_lookup _).trans (OriginalRow227TriangleLookupRow126.block1559_lookup i)

theorem block1559_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 126 (349 + i.val) = (values1559[i.val]'(by rw [values1559_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1559_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1552_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1552_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1553_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1553_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1554_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1554_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1555_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1555_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1556_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1556_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1557_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1557_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1558_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1558_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1559_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126.block1559_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126
