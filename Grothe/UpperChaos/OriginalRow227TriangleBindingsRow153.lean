import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow153

theorem block1755_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 153 (152 + i.val) = some (values1755[i.val]'(by rw [values1755_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1755_lookup i)

theorem block1755_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 153 (152 + i.val) = (values1755[i.val]'(by rw [values1755_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1755_lookup i)

theorem block1756_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 153 (184 + i.val) = some (values1756[i.val]'(by rw [values1756_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1756_lookup i)

theorem block1756_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 153 (184 + i.val) = (values1756[i.val]'(by rw [values1756_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1756_lookup i)

theorem block1757_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 153 (216 + i.val) = some (values1757[i.val]'(by rw [values1757_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1757_lookup i)

theorem block1757_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 153 (216 + i.val) = (values1757[i.val]'(by rw [values1757_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1757_lookup i)

theorem block1758_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 153 (248 + i.val) = some (values1758[i.val]'(by rw [values1758_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1758_lookup i)

theorem block1758_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 153 (248 + i.val) = (values1758[i.val]'(by rw [values1758_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1758_lookup i)

theorem block1759_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 153 (280 + i.val) = some (values1759[i.val]'(by rw [values1759_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1759_lookup i)

theorem block1759_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 153 (280 + i.val) = (values1759[i.val]'(by rw [values1759_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1759_lookup i)

theorem block1760_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 153 (312 + i.val) = some (values1760[i.val]'(by rw [values1760_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1760_lookup i)

theorem block1760_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 153 (312 + i.val) = (values1760[i.val]'(by rw [values1760_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1760_lookup i)

theorem block1761_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 153 (344 + i.val) = some (values1761[i.val]'(by rw [values1761_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row153_lookup _).trans (OriginalRow227TriangleLookupRow153.block1761_lookup i)

theorem block1761_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 153 (344 + i.val) = (values1761[i.val]'(by rw [values1761_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1761_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1755_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1755_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1756_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1756_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1757_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1757_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1758_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1758_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1759_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1759_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1760_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1760_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1761_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153.block1761_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153
