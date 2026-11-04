import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow141

theorem block1671_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 141 (140 + i.val) = some (values1671[i.val]'(by rw [values1671_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1671_lookup i)

theorem block1671_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 141 (140 + i.val) = (values1671[i.val]'(by rw [values1671_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1671_lookup i)

theorem block1672_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 141 (172 + i.val) = some (values1672[i.val]'(by rw [values1672_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1672_lookup i)

theorem block1672_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 141 (172 + i.val) = (values1672[i.val]'(by rw [values1672_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1672_lookup i)

theorem block1673_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 141 (204 + i.val) = some (values1673[i.val]'(by rw [values1673_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1673_lookup i)

theorem block1673_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 141 (204 + i.val) = (values1673[i.val]'(by rw [values1673_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1673_lookup i)

theorem block1674_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 141 (236 + i.val) = some (values1674[i.val]'(by rw [values1674_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1674_lookup i)

theorem block1674_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 141 (236 + i.val) = (values1674[i.val]'(by rw [values1674_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1674_lookup i)

theorem block1675_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 141 (268 + i.val) = some (values1675[i.val]'(by rw [values1675_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1675_lookup i)

theorem block1675_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 141 (268 + i.val) = (values1675[i.val]'(by rw [values1675_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1675_lookup i)

theorem block1676_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 141 (300 + i.val) = some (values1676[i.val]'(by rw [values1676_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1676_lookup i)

theorem block1676_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 141 (300 + i.val) = (values1676[i.val]'(by rw [values1676_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1676_lookup i)

theorem block1677_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 141 (332 + i.val) = some (values1677[i.val]'(by rw [values1677_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row141_lookup _).trans (OriginalRow227TriangleLookupRow141.block1677_lookup i)

theorem block1677_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 141 (332 + i.val) = (values1677[i.val]'(by rw [values1677_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1677_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1671_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1671_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1672_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1672_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1673_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1673_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1674_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1674_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1675_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1675_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1676_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1676_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1677_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141.block1677_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141
