import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow086

theorem block1166_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (85 + i.val) = some (values1166[i.val]'(by rw [values1166_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1166_lookup i)

theorem block1166_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (85 + i.val) = (values1166[i.val]'(by rw [values1166_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1166_lookup i)

theorem block1167_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (117 + i.val) = some (values1167[i.val]'(by rw [values1167_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1167_lookup i)

theorem block1167_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (117 + i.val) = (values1167[i.val]'(by rw [values1167_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1167_lookup i)

theorem block1168_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (149 + i.val) = some (values1168[i.val]'(by rw [values1168_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1168_lookup i)

theorem block1168_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (149 + i.val) = (values1168[i.val]'(by rw [values1168_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1168_lookup i)

theorem block1169_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (181 + i.val) = some (values1169[i.val]'(by rw [values1169_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1169_lookup i)

theorem block1169_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (181 + i.val) = (values1169[i.val]'(by rw [values1169_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1169_lookup i)

theorem block1170_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (213 + i.val) = some (values1170[i.val]'(by rw [values1170_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1170_lookup i)

theorem block1170_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (213 + i.val) = (values1170[i.val]'(by rw [values1170_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1170_lookup i)

theorem block1171_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (245 + i.val) = some (values1171[i.val]'(by rw [values1171_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1171_lookup i)

theorem block1171_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (245 + i.val) = (values1171[i.val]'(by rw [values1171_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1171_lookup i)

theorem block1172_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (277 + i.val) = some (values1172[i.val]'(by rw [values1172_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1172_lookup i)

theorem block1172_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (277 + i.val) = (values1172[i.val]'(by rw [values1172_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1172_lookup i)

theorem block1173_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (309 + i.val) = some (values1173[i.val]'(by rw [values1173_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1173_lookup i)

theorem block1173_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (309 + i.val) = (values1173[i.val]'(by rw [values1173_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1173_lookup i)

theorem block1174_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (341 + i.val) = some (values1174[i.val]'(by rw [values1174_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1174_lookup i)

theorem block1174_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (341 + i.val) = (values1174[i.val]'(by rw [values1174_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1174_lookup i)

theorem block1175_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 86 (373 + i.val) = some (values1175[i.val]'(by rw [values1175_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1175_lookup i)

theorem block1175_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 86 (373 + i.val) = (values1175[i.val]'(by rw [values1175_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1175_lookup i)

theorem block1176_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 86 (405 + i.val) = some (values1176[i.val]'(by rw [values1176_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row086_lookup _).trans (OriginalRow227TriangleLookupRow086.block1176_lookup i)

theorem block1176_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 86 (405 + i.val) = (values1176[i.val]'(by rw [values1176_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1176_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1166_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1166_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1167_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1167_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1168_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1168_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1169_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1169_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1170_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1170_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1171_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1171_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1172_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1172_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1173_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1173_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1174_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1174_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1175_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1175_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1176_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086.block1176_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086
