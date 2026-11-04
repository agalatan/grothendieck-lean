import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow057

theorem block0825_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (56 + i.val) = some (values0825[i.val]'(by rw [values0825_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0825_lookup i)

theorem block0825_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (56 + i.val) = (values0825[i.val]'(by rw [values0825_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0825_lookup i)

theorem block0826_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (88 + i.val) = some (values0826[i.val]'(by rw [values0826_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0826_lookup i)

theorem block0826_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (88 + i.val) = (values0826[i.val]'(by rw [values0826_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0826_lookup i)

theorem block0827_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (120 + i.val) = some (values0827[i.val]'(by rw [values0827_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0827_lookup i)

theorem block0827_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (120 + i.val) = (values0827[i.val]'(by rw [values0827_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0827_lookup i)

theorem block0828_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (152 + i.val) = some (values0828[i.val]'(by rw [values0828_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0828_lookup i)

theorem block0828_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (152 + i.val) = (values0828[i.val]'(by rw [values0828_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0828_lookup i)

theorem block0829_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (184 + i.val) = some (values0829[i.val]'(by rw [values0829_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0829_lookup i)

theorem block0829_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (184 + i.val) = (values0829[i.val]'(by rw [values0829_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0829_lookup i)

theorem block0830_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (216 + i.val) = some (values0830[i.val]'(by rw [values0830_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0830_lookup i)

theorem block0830_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (216 + i.val) = (values0830[i.val]'(by rw [values0830_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0830_lookup i)

theorem block0831_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (248 + i.val) = some (values0831[i.val]'(by rw [values0831_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0831_lookup i)

theorem block0831_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (248 + i.val) = (values0831[i.val]'(by rw [values0831_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0831_lookup i)

theorem block0832_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (280 + i.val) = some (values0832[i.val]'(by rw [values0832_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0832_lookup i)

theorem block0832_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (280 + i.val) = (values0832[i.val]'(by rw [values0832_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0832_lookup i)

theorem block0833_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (312 + i.val) = some (values0833[i.val]'(by rw [values0833_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0833_lookup i)

theorem block0833_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (312 + i.val) = (values0833[i.val]'(by rw [values0833_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0833_lookup i)

theorem block0834_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (344 + i.val) = some (values0834[i.val]'(by rw [values0834_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0834_lookup i)

theorem block0834_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (344 + i.val) = (values0834[i.val]'(by rw [values0834_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0834_lookup i)

theorem block0835_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (376 + i.val) = some (values0835[i.val]'(by rw [values0835_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0835_lookup i)

theorem block0835_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (376 + i.val) = (values0835[i.val]'(by rw [values0835_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0835_lookup i)

theorem block0836_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 57 (408 + i.val) = some (values0836[i.val]'(by rw [values0836_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0836_lookup i)

theorem block0836_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 57 (408 + i.val) = (values0836[i.val]'(by rw [values0836_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0836_lookup i)

theorem block0837_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 57 (440 + i.val) = some (values0837[i.val]'(by rw [values0837_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row057_lookup _).trans (OriginalRow227TriangleLookupRow057.block0837_lookup i)

theorem block0837_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 57 (440 + i.val) = (values0837[i.val]'(by rw [values0837_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0837_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0825_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0825_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0826_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0826_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0827_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0827_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0828_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0828_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0829_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0829_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0830_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0830_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0831_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0831_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0832_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0832_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0833_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0833_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0834_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0834_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0835_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0835_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0836_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0836_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0837_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057.block0837_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057
