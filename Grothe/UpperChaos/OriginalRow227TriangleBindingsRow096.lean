import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow096

theorem block1272_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (95 + i.val) = some (values1272[i.val]'(by rw [values1272_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1272_lookup i)

theorem block1272_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (95 + i.val) = (values1272[i.val]'(by rw [values1272_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1272_lookup i)

theorem block1273_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (127 + i.val) = some (values1273[i.val]'(by rw [values1273_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1273_lookup i)

theorem block1273_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (127 + i.val) = (values1273[i.val]'(by rw [values1273_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1273_lookup i)

theorem block1274_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (159 + i.val) = some (values1274[i.val]'(by rw [values1274_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1274_lookup i)

theorem block1274_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (159 + i.val) = (values1274[i.val]'(by rw [values1274_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1274_lookup i)

theorem block1275_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (191 + i.val) = some (values1275[i.val]'(by rw [values1275_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1275_lookup i)

theorem block1275_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (191 + i.val) = (values1275[i.val]'(by rw [values1275_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1275_lookup i)

theorem block1276_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (223 + i.val) = some (values1276[i.val]'(by rw [values1276_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1276_lookup i)

theorem block1276_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (223 + i.val) = (values1276[i.val]'(by rw [values1276_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1276_lookup i)

theorem block1277_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (255 + i.val) = some (values1277[i.val]'(by rw [values1277_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1277_lookup i)

theorem block1277_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (255 + i.val) = (values1277[i.val]'(by rw [values1277_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1277_lookup i)

theorem block1278_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (287 + i.val) = some (values1278[i.val]'(by rw [values1278_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1278_lookup i)

theorem block1278_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (287 + i.val) = (values1278[i.val]'(by rw [values1278_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1278_lookup i)

theorem block1279_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (319 + i.val) = some (values1279[i.val]'(by rw [values1279_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1279_lookup i)

theorem block1279_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (319 + i.val) = (values1279[i.val]'(by rw [values1279_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1279_lookup i)

theorem block1280_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 96 (351 + i.val) = some (values1280[i.val]'(by rw [values1280_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1280_lookup i)

theorem block1280_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 96 (351 + i.val) = (values1280[i.val]'(by rw [values1280_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1280_lookup i)

theorem block1281_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 96 (383 + i.val) = some (values1281[i.val]'(by rw [values1281_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row096_lookup _).trans (OriginalRow227TriangleLookupRow096.block1281_lookup i)

theorem block1281_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 96 (383 + i.val) = (values1281[i.val]'(by rw [values1281_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1281_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1272_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1272_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1273_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1273_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1274_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1274_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1275_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1275_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1276_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1276_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1277_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1277_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1278_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1278_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1279_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1279_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1280_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1280_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1281_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096.block1281_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096
