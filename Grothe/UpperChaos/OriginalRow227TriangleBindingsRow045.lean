import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow045

theorem block0669_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (44 + i.val) = some (values0669[i.val]'(by rw [values0669_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0669_lookup i)

theorem block0669_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (44 + i.val) = (values0669[i.val]'(by rw [values0669_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0669_lookup i)

theorem block0670_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (76 + i.val) = some (values0670[i.val]'(by rw [values0670_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0670_lookup i)

theorem block0670_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (76 + i.val) = (values0670[i.val]'(by rw [values0670_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0670_lookup i)

theorem block0671_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (108 + i.val) = some (values0671[i.val]'(by rw [values0671_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0671_lookup i)

theorem block0671_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (108 + i.val) = (values0671[i.val]'(by rw [values0671_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0671_lookup i)

theorem block0672_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (140 + i.val) = some (values0672[i.val]'(by rw [values0672_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0672_lookup i)

theorem block0672_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (140 + i.val) = (values0672[i.val]'(by rw [values0672_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0672_lookup i)

theorem block0673_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (172 + i.val) = some (values0673[i.val]'(by rw [values0673_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0673_lookup i)

theorem block0673_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (172 + i.val) = (values0673[i.val]'(by rw [values0673_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0673_lookup i)

theorem block0674_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (204 + i.val) = some (values0674[i.val]'(by rw [values0674_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0674_lookup i)

theorem block0674_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (204 + i.val) = (values0674[i.val]'(by rw [values0674_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0674_lookup i)

theorem block0675_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (236 + i.val) = some (values0675[i.val]'(by rw [values0675_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0675_lookup i)

theorem block0675_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (236 + i.val) = (values0675[i.val]'(by rw [values0675_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0675_lookup i)

theorem block0676_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (268 + i.val) = some (values0676[i.val]'(by rw [values0676_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0676_lookup i)

theorem block0676_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (268 + i.val) = (values0676[i.val]'(by rw [values0676_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0676_lookup i)

theorem block0677_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (300 + i.val) = some (values0677[i.val]'(by rw [values0677_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0677_lookup i)

theorem block0677_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (300 + i.val) = (values0677[i.val]'(by rw [values0677_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0677_lookup i)

theorem block0678_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (332 + i.val) = some (values0678[i.val]'(by rw [values0678_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0678_lookup i)

theorem block0678_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (332 + i.val) = (values0678[i.val]'(by rw [values0678_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0678_lookup i)

theorem block0679_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (364 + i.val) = some (values0679[i.val]'(by rw [values0679_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0679_lookup i)

theorem block0679_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (364 + i.val) = (values0679[i.val]'(by rw [values0679_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0679_lookup i)

theorem block0680_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 45 (396 + i.val) = some (values0680[i.val]'(by rw [values0680_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0680_lookup i)

theorem block0680_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 45 (396 + i.val) = (values0680[i.val]'(by rw [values0680_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0680_lookup i)

theorem block0681_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 45 (428 + i.val) = some (values0681[i.val]'(by rw [values0681_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row045_lookup _).trans (OriginalRow227TriangleLookupRow045.block0681_lookup i)

theorem block0681_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 45 (428 + i.val) = (values0681[i.val]'(by rw [values0681_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0681_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0669_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0669_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0670_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0670_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0671_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0671_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0672_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0672_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0673_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0673_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0674_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0674_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0675_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0675_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0676_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0676_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0677_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0677_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0678_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0678_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0679_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0679_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0680_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0680_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0681_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045.block0681_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045
