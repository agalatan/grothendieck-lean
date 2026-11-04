import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow144

theorem block1692_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 144 (143 + i.val) = some (values1692[i.val]'(by rw [values1692_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1692_lookup i)

theorem block1692_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 144 (143 + i.val) = (values1692[i.val]'(by rw [values1692_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1692_lookup i)

theorem block1693_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 144 (175 + i.val) = some (values1693[i.val]'(by rw [values1693_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1693_lookup i)

theorem block1693_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 144 (175 + i.val) = (values1693[i.val]'(by rw [values1693_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1693_lookup i)

theorem block1694_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 144 (207 + i.val) = some (values1694[i.val]'(by rw [values1694_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1694_lookup i)

theorem block1694_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 144 (207 + i.val) = (values1694[i.val]'(by rw [values1694_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1694_lookup i)

theorem block1695_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 144 (239 + i.val) = some (values1695[i.val]'(by rw [values1695_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1695_lookup i)

theorem block1695_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 144 (239 + i.val) = (values1695[i.val]'(by rw [values1695_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1695_lookup i)

theorem block1696_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 144 (271 + i.val) = some (values1696[i.val]'(by rw [values1696_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1696_lookup i)

theorem block1696_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 144 (271 + i.val) = (values1696[i.val]'(by rw [values1696_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1696_lookup i)

theorem block1697_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 144 (303 + i.val) = some (values1697[i.val]'(by rw [values1697_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1697_lookup i)

theorem block1697_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 144 (303 + i.val) = (values1697[i.val]'(by rw [values1697_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1697_lookup i)

theorem block1698_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 144 (335 + i.val) = some (values1698[i.val]'(by rw [values1698_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row144_lookup _).trans (OriginalRow227TriangleLookupRow144.block1698_lookup i)

theorem block1698_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 144 (335 + i.val) = (values1698[i.val]'(by rw [values1698_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1698_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1692_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1692_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1693_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1693_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1694_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1694_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1695_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1695_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1696_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1696_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1697_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1697_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1698_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144.block1698_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144
