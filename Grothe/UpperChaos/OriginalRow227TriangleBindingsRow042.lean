import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow042

theorem block0628_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (41 + i.val) = some (values0628[i.val]'(by rw [values0628_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0628_lookup i)

theorem block0628_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (41 + i.val) = (values0628[i.val]'(by rw [values0628_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0628_lookup i)

theorem block0629_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (73 + i.val) = some (values0629[i.val]'(by rw [values0629_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0629_lookup i)

theorem block0629_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (73 + i.val) = (values0629[i.val]'(by rw [values0629_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0629_lookup i)

theorem block0630_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (105 + i.val) = some (values0630[i.val]'(by rw [values0630_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0630_lookup i)

theorem block0630_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (105 + i.val) = (values0630[i.val]'(by rw [values0630_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0630_lookup i)

theorem block0631_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (137 + i.val) = some (values0631[i.val]'(by rw [values0631_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0631_lookup i)

theorem block0631_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (137 + i.val) = (values0631[i.val]'(by rw [values0631_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0631_lookup i)

theorem block0632_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (169 + i.val) = some (values0632[i.val]'(by rw [values0632_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0632_lookup i)

theorem block0632_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (169 + i.val) = (values0632[i.val]'(by rw [values0632_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0632_lookup i)

theorem block0633_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (201 + i.val) = some (values0633[i.val]'(by rw [values0633_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0633_lookup i)

theorem block0633_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (201 + i.val) = (values0633[i.val]'(by rw [values0633_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0633_lookup i)

theorem block0634_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (233 + i.val) = some (values0634[i.val]'(by rw [values0634_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0634_lookup i)

theorem block0634_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (233 + i.val) = (values0634[i.val]'(by rw [values0634_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0634_lookup i)

theorem block0635_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (265 + i.val) = some (values0635[i.val]'(by rw [values0635_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0635_lookup i)

theorem block0635_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (265 + i.val) = (values0635[i.val]'(by rw [values0635_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0635_lookup i)

theorem block0636_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (297 + i.val) = some (values0636[i.val]'(by rw [values0636_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0636_lookup i)

theorem block0636_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (297 + i.val) = (values0636[i.val]'(by rw [values0636_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0636_lookup i)

theorem block0637_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (329 + i.val) = some (values0637[i.val]'(by rw [values0637_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0637_lookup i)

theorem block0637_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (329 + i.val) = (values0637[i.val]'(by rw [values0637_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0637_lookup i)

theorem block0638_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (361 + i.val) = some (values0638[i.val]'(by rw [values0638_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0638_lookup i)

theorem block0638_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (361 + i.val) = (values0638[i.val]'(by rw [values0638_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0638_lookup i)

theorem block0639_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (393 + i.val) = some (values0639[i.val]'(by rw [values0639_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0639_lookup i)

theorem block0639_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (393 + i.val) = (values0639[i.val]'(by rw [values0639_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0639_lookup i)

theorem block0640_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 42 (425 + i.val) = some (values0640[i.val]'(by rw [values0640_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0640_lookup i)

theorem block0640_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 42 (425 + i.val) = (values0640[i.val]'(by rw [values0640_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0640_lookup i)

theorem block0641_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 42 (457 + i.val) = some (values0641[i.val]'(by rw [values0641_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row042_lookup _).trans (OriginalRow227TriangleLookupRow042.block0641_lookup i)

theorem block0641_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 42 (457 + i.val) = (values0641[i.val]'(by rw [values0641_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0641_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0628_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0628_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0629_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0629_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0630_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0630_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0631_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0631_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0632_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0632_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0633_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0633_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0634_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0634_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0635_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0635_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0636_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0636_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0637_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0637_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0638_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0638_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0639_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0639_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0640_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0640_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0641_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042.block0641_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042
