import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow082

theorem block1122_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (81 + i.val) = some (values1122[i.val]'(by rw [values1122_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1122_lookup i)

theorem block1122_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (81 + i.val) = (values1122[i.val]'(by rw [values1122_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1122_lookup i)

theorem block1123_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (113 + i.val) = some (values1123[i.val]'(by rw [values1123_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1123_lookup i)

theorem block1123_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (113 + i.val) = (values1123[i.val]'(by rw [values1123_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1123_lookup i)

theorem block1124_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (145 + i.val) = some (values1124[i.val]'(by rw [values1124_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1124_lookup i)

theorem block1124_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (145 + i.val) = (values1124[i.val]'(by rw [values1124_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1124_lookup i)

theorem block1125_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (177 + i.val) = some (values1125[i.val]'(by rw [values1125_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1125_lookup i)

theorem block1125_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (177 + i.val) = (values1125[i.val]'(by rw [values1125_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1125_lookup i)

theorem block1126_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (209 + i.val) = some (values1126[i.val]'(by rw [values1126_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1126_lookup i)

theorem block1126_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (209 + i.val) = (values1126[i.val]'(by rw [values1126_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1126_lookup i)

theorem block1127_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (241 + i.val) = some (values1127[i.val]'(by rw [values1127_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1127_lookup i)

theorem block1127_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (241 + i.val) = (values1127[i.val]'(by rw [values1127_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1127_lookup i)

theorem block1128_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (273 + i.val) = some (values1128[i.val]'(by rw [values1128_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1128_lookup i)

theorem block1128_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (273 + i.val) = (values1128[i.val]'(by rw [values1128_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1128_lookup i)

theorem block1129_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (305 + i.val) = some (values1129[i.val]'(by rw [values1129_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1129_lookup i)

theorem block1129_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (305 + i.val) = (values1129[i.val]'(by rw [values1129_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1129_lookup i)

theorem block1130_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (337 + i.val) = some (values1130[i.val]'(by rw [values1130_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1130_lookup i)

theorem block1130_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (337 + i.val) = (values1130[i.val]'(by rw [values1130_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1130_lookup i)

theorem block1131_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 82 (369 + i.val) = some (values1131[i.val]'(by rw [values1131_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1131_lookup i)

theorem block1131_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 82 (369 + i.val) = (values1131[i.val]'(by rw [values1131_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1131_lookup i)

theorem block1132_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 82 (401 + i.val) = some (values1132[i.val]'(by rw [values1132_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row082_lookup _).trans (OriginalRow227TriangleLookupRow082.block1132_lookup i)

theorem block1132_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 82 (401 + i.val) = (values1132[i.val]'(by rw [values1132_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1132_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1122_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1122_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1123_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1123_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1124_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1124_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1125_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1125_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1126_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1126_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1127_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1127_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1128_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1128_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1129_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1129_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1130_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1130_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1131_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1131_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1132_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082.block1132_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082
