import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow099

theorem block1302_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (98 + i.val) = some (values1302[i.val]'(by rw [values1302_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1302_lookup i)

theorem block1302_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (98 + i.val) = (values1302[i.val]'(by rw [values1302_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1302_lookup i)

theorem block1303_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (130 + i.val) = some (values1303[i.val]'(by rw [values1303_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1303_lookup i)

theorem block1303_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (130 + i.val) = (values1303[i.val]'(by rw [values1303_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1303_lookup i)

theorem block1304_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (162 + i.val) = some (values1304[i.val]'(by rw [values1304_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1304_lookup i)

theorem block1304_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (162 + i.val) = (values1304[i.val]'(by rw [values1304_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1304_lookup i)

theorem block1305_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (194 + i.val) = some (values1305[i.val]'(by rw [values1305_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1305_lookup i)

theorem block1305_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (194 + i.val) = (values1305[i.val]'(by rw [values1305_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1305_lookup i)

theorem block1306_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (226 + i.val) = some (values1306[i.val]'(by rw [values1306_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1306_lookup i)

theorem block1306_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (226 + i.val) = (values1306[i.val]'(by rw [values1306_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1306_lookup i)

theorem block1307_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (258 + i.val) = some (values1307[i.val]'(by rw [values1307_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1307_lookup i)

theorem block1307_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (258 + i.val) = (values1307[i.val]'(by rw [values1307_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1307_lookup i)

theorem block1308_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (290 + i.val) = some (values1308[i.val]'(by rw [values1308_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1308_lookup i)

theorem block1308_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (290 + i.val) = (values1308[i.val]'(by rw [values1308_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1308_lookup i)

theorem block1309_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (322 + i.val) = some (values1309[i.val]'(by rw [values1309_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1309_lookup i)

theorem block1309_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (322 + i.val) = (values1309[i.val]'(by rw [values1309_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1309_lookup i)

theorem block1310_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 99 (354 + i.val) = some (values1310[i.val]'(by rw [values1310_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1310_lookup i)

theorem block1310_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 99 (354 + i.val) = (values1310[i.val]'(by rw [values1310_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1310_lookup i)

theorem block1311_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 99 (386 + i.val) = some (values1311[i.val]'(by rw [values1311_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row099_lookup _).trans (OriginalRow227TriangleLookupRow099.block1311_lookup i)

theorem block1311_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 99 (386 + i.val) = (values1311[i.val]'(by rw [values1311_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1311_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1302_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1302_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1303_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1303_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1304_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1304_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1305_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1305_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1306_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1306_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1307_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1307_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1308_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1308_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1309_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1309_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1310_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1310_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1311_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099.block1311_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099
