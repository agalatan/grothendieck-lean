import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow156

theorem block1776_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 156 (155 + i.val) = some (values1776[i.val]'(by rw [values1776_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row156_lookup _).trans (OriginalRow227TriangleLookupRow156.block1776_lookup i)

theorem block1776_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 156 (155 + i.val) = (values1776[i.val]'(by rw [values1776_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1776_lookup i)

theorem block1777_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 156 (187 + i.val) = some (values1777[i.val]'(by rw [values1777_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row156_lookup _).trans (OriginalRow227TriangleLookupRow156.block1777_lookup i)

theorem block1777_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 156 (187 + i.val) = (values1777[i.val]'(by rw [values1777_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1777_lookup i)

theorem block1778_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 156 (219 + i.val) = some (values1778[i.val]'(by rw [values1778_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row156_lookup _).trans (OriginalRow227TriangleLookupRow156.block1778_lookup i)

theorem block1778_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 156 (219 + i.val) = (values1778[i.val]'(by rw [values1778_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1778_lookup i)

theorem block1779_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 156 (251 + i.val) = some (values1779[i.val]'(by rw [values1779_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row156_lookup _).trans (OriginalRow227TriangleLookupRow156.block1779_lookup i)

theorem block1779_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 156 (251 + i.val) = (values1779[i.val]'(by rw [values1779_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1779_lookup i)

theorem block1780_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 156 (283 + i.val) = some (values1780[i.val]'(by rw [values1780_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row156_lookup _).trans (OriginalRow227TriangleLookupRow156.block1780_lookup i)

theorem block1780_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 156 (283 + i.val) = (values1780[i.val]'(by rw [values1780_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1780_lookup i)

theorem block1781_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 156 (315 + i.val) = some (values1781[i.val]'(by rw [values1781_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row156_lookup _).trans (OriginalRow227TriangleLookupRow156.block1781_lookup i)

theorem block1781_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 156 (315 + i.val) = (values1781[i.val]'(by rw [values1781_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1781_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1776_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1776_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1777_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1777_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1778_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1778_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1779_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1779_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1780_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1780_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1781_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156.block1781_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156
