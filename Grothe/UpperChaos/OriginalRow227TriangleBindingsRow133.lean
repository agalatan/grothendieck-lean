import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow133

theorem block1608_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (132 + i.val) = some (values1608[i.val]'(by rw [values1608_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1608_lookup i)

theorem block1608_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (132 + i.val) = (values1608[i.val]'(by rw [values1608_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1608_lookup i)

theorem block1609_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (164 + i.val) = some (values1609[i.val]'(by rw [values1609_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1609_lookup i)

theorem block1609_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (164 + i.val) = (values1609[i.val]'(by rw [values1609_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1609_lookup i)

theorem block1610_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (196 + i.val) = some (values1610[i.val]'(by rw [values1610_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1610_lookup i)

theorem block1610_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (196 + i.val) = (values1610[i.val]'(by rw [values1610_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1610_lookup i)

theorem block1611_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (228 + i.val) = some (values1611[i.val]'(by rw [values1611_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1611_lookup i)

theorem block1611_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (228 + i.val) = (values1611[i.val]'(by rw [values1611_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1611_lookup i)

theorem block1612_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (260 + i.val) = some (values1612[i.val]'(by rw [values1612_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1612_lookup i)

theorem block1612_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (260 + i.val) = (values1612[i.val]'(by rw [values1612_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1612_lookup i)

theorem block1613_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (292 + i.val) = some (values1613[i.val]'(by rw [values1613_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1613_lookup i)

theorem block1613_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (292 + i.val) = (values1613[i.val]'(by rw [values1613_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1613_lookup i)

theorem block1614_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 133 (324 + i.val) = some (values1614[i.val]'(by rw [values1614_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1614_lookup i)

theorem block1614_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 133 (324 + i.val) = (values1614[i.val]'(by rw [values1614_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1614_lookup i)

theorem block1615_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 133 (356 + i.val) = some (values1615[i.val]'(by rw [values1615_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row133_lookup _).trans (OriginalRow227TriangleLookupRow133.block1615_lookup i)

theorem block1615_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 133 (356 + i.val) = (values1615[i.val]'(by rw [values1615_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1615_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1608_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1608_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1609_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1609_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1610_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1610_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1611_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1611_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1612_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1612_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1613_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1613_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1614_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1614_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1615_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133.block1615_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133
