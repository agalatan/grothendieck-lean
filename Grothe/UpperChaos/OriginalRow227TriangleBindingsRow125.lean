import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow125

theorem block1544_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (124 + i.val) = some (values1544[i.val]'(by rw [values1544_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1544_lookup i)

theorem block1544_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (124 + i.val) = (values1544[i.val]'(by rw [values1544_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1544_lookup i)

theorem block1545_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (156 + i.val) = some (values1545[i.val]'(by rw [values1545_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1545_lookup i)

theorem block1545_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (156 + i.val) = (values1545[i.val]'(by rw [values1545_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1545_lookup i)

theorem block1546_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (188 + i.val) = some (values1546[i.val]'(by rw [values1546_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1546_lookup i)

theorem block1546_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (188 + i.val) = (values1546[i.val]'(by rw [values1546_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1546_lookup i)

theorem block1547_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (220 + i.val) = some (values1547[i.val]'(by rw [values1547_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1547_lookup i)

theorem block1547_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (220 + i.val) = (values1547[i.val]'(by rw [values1547_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1547_lookup i)

theorem block1548_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (252 + i.val) = some (values1548[i.val]'(by rw [values1548_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1548_lookup i)

theorem block1548_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (252 + i.val) = (values1548[i.val]'(by rw [values1548_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1548_lookup i)

theorem block1549_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (284 + i.val) = some (values1549[i.val]'(by rw [values1549_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1549_lookup i)

theorem block1549_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (284 + i.val) = (values1549[i.val]'(by rw [values1549_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1549_lookup i)

theorem block1550_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 125 (316 + i.val) = some (values1550[i.val]'(by rw [values1550_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1550_lookup i)

theorem block1550_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 125 (316 + i.val) = (values1550[i.val]'(by rw [values1550_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1550_lookup i)

theorem block1551_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 125 (348 + i.val) = some (values1551[i.val]'(by rw [values1551_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row125_lookup _).trans (OriginalRow227TriangleLookupRow125.block1551_lookup i)

theorem block1551_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 125 (348 + i.val) = (values1551[i.val]'(by rw [values1551_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1551_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1544_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1544_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1545_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1545_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1546_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1546_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1547_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1547_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1548_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1548_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1549_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1549_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1550_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1550_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1551_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125.block1551_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125
