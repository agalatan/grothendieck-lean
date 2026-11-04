import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow136

theorem block1632_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (135 + i.val) = some (values1632[i.val]'(by rw [values1632_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1632_lookup i)

theorem block1632_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (135 + i.val) = (values1632[i.val]'(by rw [values1632_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1632_lookup i)

theorem block1633_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (167 + i.val) = some (values1633[i.val]'(by rw [values1633_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1633_lookup i)

theorem block1633_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (167 + i.val) = (values1633[i.val]'(by rw [values1633_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1633_lookup i)

theorem block1634_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (199 + i.val) = some (values1634[i.val]'(by rw [values1634_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1634_lookup i)

theorem block1634_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (199 + i.val) = (values1634[i.val]'(by rw [values1634_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1634_lookup i)

theorem block1635_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (231 + i.val) = some (values1635[i.val]'(by rw [values1635_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1635_lookup i)

theorem block1635_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (231 + i.val) = (values1635[i.val]'(by rw [values1635_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1635_lookup i)

theorem block1636_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (263 + i.val) = some (values1636[i.val]'(by rw [values1636_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1636_lookup i)

theorem block1636_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (263 + i.val) = (values1636[i.val]'(by rw [values1636_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1636_lookup i)

theorem block1637_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (295 + i.val) = some (values1637[i.val]'(by rw [values1637_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1637_lookup i)

theorem block1637_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (295 + i.val) = (values1637[i.val]'(by rw [values1637_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1637_lookup i)

theorem block1638_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 136 (327 + i.val) = some (values1638[i.val]'(by rw [values1638_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1638_lookup i)

theorem block1638_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 136 (327 + i.val) = (values1638[i.val]'(by rw [values1638_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1638_lookup i)

theorem block1639_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 136 (359 + i.val) = some (values1639[i.val]'(by rw [values1639_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row136_lookup _).trans (OriginalRow227TriangleLookupRow136.block1639_lookup i)

theorem block1639_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 136 (359 + i.val) = (values1639[i.val]'(by rw [values1639_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1639_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1632_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1632_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1633_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1633_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1634_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1634_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1635_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1635_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1636_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1636_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1637_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1637_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1638_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1638_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1639_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136.block1639_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136
