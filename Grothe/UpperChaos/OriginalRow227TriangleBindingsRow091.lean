import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow091

theorem block1221_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (90 + i.val) = some (values1221[i.val]'(by rw [values1221_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1221_lookup i)

theorem block1221_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (90 + i.val) = (values1221[i.val]'(by rw [values1221_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1221_lookup i)

theorem block1222_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (122 + i.val) = some (values1222[i.val]'(by rw [values1222_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1222_lookup i)

theorem block1222_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (122 + i.val) = (values1222[i.val]'(by rw [values1222_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1222_lookup i)

theorem block1223_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (154 + i.val) = some (values1223[i.val]'(by rw [values1223_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1223_lookup i)

theorem block1223_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (154 + i.val) = (values1223[i.val]'(by rw [values1223_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1223_lookup i)

theorem block1224_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (186 + i.val) = some (values1224[i.val]'(by rw [values1224_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1224_lookup i)

theorem block1224_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (186 + i.val) = (values1224[i.val]'(by rw [values1224_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1224_lookup i)

theorem block1225_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (218 + i.val) = some (values1225[i.val]'(by rw [values1225_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1225_lookup i)

theorem block1225_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (218 + i.val) = (values1225[i.val]'(by rw [values1225_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1225_lookup i)

theorem block1226_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (250 + i.val) = some (values1226[i.val]'(by rw [values1226_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1226_lookup i)

theorem block1226_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (250 + i.val) = (values1226[i.val]'(by rw [values1226_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1226_lookup i)

theorem block1227_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (282 + i.val) = some (values1227[i.val]'(by rw [values1227_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1227_lookup i)

theorem block1227_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (282 + i.val) = (values1227[i.val]'(by rw [values1227_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1227_lookup i)

theorem block1228_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (314 + i.val) = some (values1228[i.val]'(by rw [values1228_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1228_lookup i)

theorem block1228_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (314 + i.val) = (values1228[i.val]'(by rw [values1228_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1228_lookup i)

theorem block1229_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (346 + i.val) = some (values1229[i.val]'(by rw [values1229_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1229_lookup i)

theorem block1229_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (346 + i.val) = (values1229[i.val]'(by rw [values1229_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1229_lookup i)

theorem block1230_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 91 (378 + i.val) = some (values1230[i.val]'(by rw [values1230_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1230_lookup i)

theorem block1230_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 91 (378 + i.val) = (values1230[i.val]'(by rw [values1230_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1230_lookup i)

theorem block1231_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 91 (410 + i.val) = some (values1231[i.val]'(by rw [values1231_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row091_lookup _).trans (OriginalRow227TriangleLookupRow091.block1231_lookup i)

theorem block1231_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 91 (410 + i.val) = (values1231[i.val]'(by rw [values1231_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1231_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1221_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1221_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1222_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1222_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1223_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1223_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1224_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1224_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1225_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1225_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1226_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1226_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1227_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1227_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1228_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1228_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1229_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1229_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1230_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1230_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1231_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091.block1231_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091
