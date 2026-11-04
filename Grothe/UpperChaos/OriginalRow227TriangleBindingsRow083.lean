import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow083

theorem block1133_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (82 + i.val) = some (values1133[i.val]'(by rw [values1133_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1133_lookup i)

theorem block1133_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (82 + i.val) = (values1133[i.val]'(by rw [values1133_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1133_lookup i)

theorem block1134_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (114 + i.val) = some (values1134[i.val]'(by rw [values1134_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1134_lookup i)

theorem block1134_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (114 + i.val) = (values1134[i.val]'(by rw [values1134_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1134_lookup i)

theorem block1135_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (146 + i.val) = some (values1135[i.val]'(by rw [values1135_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1135_lookup i)

theorem block1135_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (146 + i.val) = (values1135[i.val]'(by rw [values1135_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1135_lookup i)

theorem block1136_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (178 + i.val) = some (values1136[i.val]'(by rw [values1136_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1136_lookup i)

theorem block1136_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (178 + i.val) = (values1136[i.val]'(by rw [values1136_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1136_lookup i)

theorem block1137_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (210 + i.val) = some (values1137[i.val]'(by rw [values1137_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1137_lookup i)

theorem block1137_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (210 + i.val) = (values1137[i.val]'(by rw [values1137_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1137_lookup i)

theorem block1138_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (242 + i.val) = some (values1138[i.val]'(by rw [values1138_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1138_lookup i)

theorem block1138_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (242 + i.val) = (values1138[i.val]'(by rw [values1138_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1138_lookup i)

theorem block1139_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (274 + i.val) = some (values1139[i.val]'(by rw [values1139_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1139_lookup i)

theorem block1139_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (274 + i.val) = (values1139[i.val]'(by rw [values1139_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1139_lookup i)

theorem block1140_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (306 + i.val) = some (values1140[i.val]'(by rw [values1140_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1140_lookup i)

theorem block1140_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (306 + i.val) = (values1140[i.val]'(by rw [values1140_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1140_lookup i)

theorem block1141_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (338 + i.val) = some (values1141[i.val]'(by rw [values1141_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1141_lookup i)

theorem block1141_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (338 + i.val) = (values1141[i.val]'(by rw [values1141_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1141_lookup i)

theorem block1142_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 83 (370 + i.val) = some (values1142[i.val]'(by rw [values1142_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1142_lookup i)

theorem block1142_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 83 (370 + i.val) = (values1142[i.val]'(by rw [values1142_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1142_lookup i)

theorem block1143_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 83 (402 + i.val) = some (values1143[i.val]'(by rw [values1143_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row083_lookup _).trans (OriginalRow227TriangleLookupRow083.block1143_lookup i)

theorem block1143_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 83 (402 + i.val) = (values1143[i.val]'(by rw [values1143_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1143_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1133_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1133_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1134_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1134_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1135_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1135_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1136_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1136_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1137_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1137_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1138_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1138_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1139_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1139_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1140_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1140_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1141_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1141_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1142_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1142_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1143_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083.block1143_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083
