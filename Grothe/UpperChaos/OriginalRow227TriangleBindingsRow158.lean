import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow158

theorem block1788_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 158 (157 + i.val) = some (values1788[i.val]'(by rw [values1788_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row158_lookup _).trans (OriginalRow227TriangleLookupRow158.block1788_lookup i)

theorem block1788_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 158 (157 + i.val) = (values1788[i.val]'(by rw [values1788_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1788_lookup i)

theorem block1789_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 158 (189 + i.val) = some (values1789[i.val]'(by rw [values1789_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row158_lookup _).trans (OriginalRow227TriangleLookupRow158.block1789_lookup i)

theorem block1789_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 158 (189 + i.val) = (values1789[i.val]'(by rw [values1789_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1789_lookup i)

theorem block1790_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 158 (221 + i.val) = some (values1790[i.val]'(by rw [values1790_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row158_lookup _).trans (OriginalRow227TriangleLookupRow158.block1790_lookup i)

theorem block1790_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 158 (221 + i.val) = (values1790[i.val]'(by rw [values1790_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1790_lookup i)

theorem block1791_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 158 (253 + i.val) = some (values1791[i.val]'(by rw [values1791_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row158_lookup _).trans (OriginalRow227TriangleLookupRow158.block1791_lookup i)

theorem block1791_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 158 (253 + i.val) = (values1791[i.val]'(by rw [values1791_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1791_lookup i)

theorem block1792_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 158 (285 + i.val) = some (values1792[i.val]'(by rw [values1792_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row158_lookup _).trans (OriginalRow227TriangleLookupRow158.block1792_lookup i)

theorem block1792_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 158 (285 + i.val) = (values1792[i.val]'(by rw [values1792_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1792_lookup i)

theorem block1793_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 158 (317 + i.val) = some (values1793[i.val]'(by rw [values1793_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row158_lookup _).trans (OriginalRow227TriangleLookupRow158.block1793_lookup i)

theorem block1793_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 158 (317 + i.val) = (values1793[i.val]'(by rw [values1793_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1793_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1788_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1788_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1789_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1789_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1790_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1790_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1791_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1791_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1792_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1792_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1793_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158.block1793_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158
