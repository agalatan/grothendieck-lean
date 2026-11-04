import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow142

theorem block1678_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 142 (141 + i.val) = some (values1678[i.val]'(by rw [values1678_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1678_lookup i)

theorem block1678_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 142 (141 + i.val) = (values1678[i.val]'(by rw [values1678_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1678_lookup i)

theorem block1679_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 142 (173 + i.val) = some (values1679[i.val]'(by rw [values1679_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1679_lookup i)

theorem block1679_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 142 (173 + i.val) = (values1679[i.val]'(by rw [values1679_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1679_lookup i)

theorem block1680_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 142 (205 + i.val) = some (values1680[i.val]'(by rw [values1680_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1680_lookup i)

theorem block1680_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 142 (205 + i.val) = (values1680[i.val]'(by rw [values1680_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1680_lookup i)

theorem block1681_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 142 (237 + i.val) = some (values1681[i.val]'(by rw [values1681_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1681_lookup i)

theorem block1681_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 142 (237 + i.val) = (values1681[i.val]'(by rw [values1681_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1681_lookup i)

theorem block1682_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 142 (269 + i.val) = some (values1682[i.val]'(by rw [values1682_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1682_lookup i)

theorem block1682_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 142 (269 + i.val) = (values1682[i.val]'(by rw [values1682_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1682_lookup i)

theorem block1683_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 142 (301 + i.val) = some (values1683[i.val]'(by rw [values1683_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1683_lookup i)

theorem block1683_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 142 (301 + i.val) = (values1683[i.val]'(by rw [values1683_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1683_lookup i)

theorem block1684_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 142 (333 + i.val) = some (values1684[i.val]'(by rw [values1684_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row142_lookup _).trans (OriginalRow227TriangleLookupRow142.block1684_lookup i)

theorem block1684_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 142 (333 + i.val) = (values1684[i.val]'(by rw [values1684_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1684_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1678_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1678_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1679_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1679_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1680_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1680_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1681_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1681_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1682_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1682_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1683_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1683_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1684_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142.block1684_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142
