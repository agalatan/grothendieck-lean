import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow058

theorem block0838_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (57 + i.val) = some (values0838[i.val]'(by rw [values0838_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0838_lookup i)

theorem block0838_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (57 + i.val) = (values0838[i.val]'(by rw [values0838_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0838_lookup i)

theorem block0839_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (89 + i.val) = some (values0839[i.val]'(by rw [values0839_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0839_lookup i)

theorem block0839_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (89 + i.val) = (values0839[i.val]'(by rw [values0839_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0839_lookup i)

theorem block0840_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (121 + i.val) = some (values0840[i.val]'(by rw [values0840_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0840_lookup i)

theorem block0840_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (121 + i.val) = (values0840[i.val]'(by rw [values0840_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0840_lookup i)

theorem block0841_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (153 + i.val) = some (values0841[i.val]'(by rw [values0841_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0841_lookup i)

theorem block0841_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (153 + i.val) = (values0841[i.val]'(by rw [values0841_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0841_lookup i)

theorem block0842_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (185 + i.val) = some (values0842[i.val]'(by rw [values0842_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0842_lookup i)

theorem block0842_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (185 + i.val) = (values0842[i.val]'(by rw [values0842_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0842_lookup i)

theorem block0843_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (217 + i.val) = some (values0843[i.val]'(by rw [values0843_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0843_lookup i)

theorem block0843_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (217 + i.val) = (values0843[i.val]'(by rw [values0843_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0843_lookup i)

theorem block0844_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (249 + i.val) = some (values0844[i.val]'(by rw [values0844_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0844_lookup i)

theorem block0844_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (249 + i.val) = (values0844[i.val]'(by rw [values0844_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0844_lookup i)

theorem block0845_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (281 + i.val) = some (values0845[i.val]'(by rw [values0845_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0845_lookup i)

theorem block0845_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (281 + i.val) = (values0845[i.val]'(by rw [values0845_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0845_lookup i)

theorem block0846_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (313 + i.val) = some (values0846[i.val]'(by rw [values0846_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0846_lookup i)

theorem block0846_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (313 + i.val) = (values0846[i.val]'(by rw [values0846_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0846_lookup i)

theorem block0847_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (345 + i.val) = some (values0847[i.val]'(by rw [values0847_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0847_lookup i)

theorem block0847_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (345 + i.val) = (values0847[i.val]'(by rw [values0847_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0847_lookup i)

theorem block0848_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (377 + i.val) = some (values0848[i.val]'(by rw [values0848_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0848_lookup i)

theorem block0848_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (377 + i.val) = (values0848[i.val]'(by rw [values0848_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0848_lookup i)

theorem block0849_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 58 (409 + i.val) = some (values0849[i.val]'(by rw [values0849_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0849_lookup i)

theorem block0849_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 58 (409 + i.val) = (values0849[i.val]'(by rw [values0849_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0849_lookup i)

theorem block0850_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 58 (441 + i.val) = some (values0850[i.val]'(by rw [values0850_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row058_lookup _).trans (OriginalRow227TriangleLookupRow058.block0850_lookup i)

theorem block0850_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 58 (441 + i.val) = (values0850[i.val]'(by rw [values0850_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0850_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0838_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0838_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0839_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0839_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0840_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0840_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0841_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0841_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0842_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0842_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0843_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0843_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0844_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0844_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0845_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0845_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0846_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0846_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0847_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0847_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0848_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0848_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0849_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0849_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0850_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058.block0850_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058
