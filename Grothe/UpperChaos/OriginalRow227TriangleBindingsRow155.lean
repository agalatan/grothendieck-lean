import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow155

theorem block1769_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 155 (154 + i.val) = some (values1769[i.val]'(by rw [values1769_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1769_lookup i)

theorem block1769_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 155 (154 + i.val) = (values1769[i.val]'(by rw [values1769_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1769_lookup i)

theorem block1770_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 155 (186 + i.val) = some (values1770[i.val]'(by rw [values1770_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1770_lookup i)

theorem block1770_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 155 (186 + i.val) = (values1770[i.val]'(by rw [values1770_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1770_lookup i)

theorem block1771_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 155 (218 + i.val) = some (values1771[i.val]'(by rw [values1771_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1771_lookup i)

theorem block1771_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 155 (218 + i.val) = (values1771[i.val]'(by rw [values1771_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1771_lookup i)

theorem block1772_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 155 (250 + i.val) = some (values1772[i.val]'(by rw [values1772_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1772_lookup i)

theorem block1772_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 155 (250 + i.val) = (values1772[i.val]'(by rw [values1772_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1772_lookup i)

theorem block1773_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 155 (282 + i.val) = some (values1773[i.val]'(by rw [values1773_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1773_lookup i)

theorem block1773_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 155 (282 + i.val) = (values1773[i.val]'(by rw [values1773_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1773_lookup i)

theorem block1774_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 155 (314 + i.val) = some (values1774[i.val]'(by rw [values1774_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1774_lookup i)

theorem block1774_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 155 (314 + i.val) = (values1774[i.val]'(by rw [values1774_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1774_lookup i)

theorem block1775_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 155 (346 + i.val) = some (values1775[i.val]'(by rw [values1775_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row155_lookup _).trans (OriginalRow227TriangleLookupRow155.block1775_lookup i)

theorem block1775_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 155 (346 + i.val) = (values1775[i.val]'(by rw [values1775_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1775_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1769_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1769_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1770_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1770_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1771_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1771_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1772_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1772_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1773_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1773_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1774_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1774_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1775_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155.block1775_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155
