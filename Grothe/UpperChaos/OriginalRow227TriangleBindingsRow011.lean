import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow011

theorem block0176_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (10 + i.val) = some (values0176[i.val]'(by rw [values0176_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0176_lookup i)

theorem block0176_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (10 + i.val) = (values0176[i.val]'(by rw [values0176_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0176_lookup i)

theorem block0177_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (42 + i.val) = some (values0177[i.val]'(by rw [values0177_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0177_lookup i)

theorem block0177_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (42 + i.val) = (values0177[i.val]'(by rw [values0177_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0177_lookup i)

theorem block0178_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (74 + i.val) = some (values0178[i.val]'(by rw [values0178_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0178_lookup i)

theorem block0178_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (74 + i.val) = (values0178[i.val]'(by rw [values0178_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0178_lookup i)

theorem block0179_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (106 + i.val) = some (values0179[i.val]'(by rw [values0179_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0179_lookup i)

theorem block0179_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (106 + i.val) = (values0179[i.val]'(by rw [values0179_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0179_lookup i)

theorem block0180_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (138 + i.val) = some (values0180[i.val]'(by rw [values0180_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0180_lookup i)

theorem block0180_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (138 + i.val) = (values0180[i.val]'(by rw [values0180_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0180_lookup i)

theorem block0181_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (170 + i.val) = some (values0181[i.val]'(by rw [values0181_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0181_lookup i)

theorem block0181_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (170 + i.val) = (values0181[i.val]'(by rw [values0181_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0181_lookup i)

theorem block0182_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (202 + i.val) = some (values0182[i.val]'(by rw [values0182_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0182_lookup i)

theorem block0182_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (202 + i.val) = (values0182[i.val]'(by rw [values0182_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0182_lookup i)

theorem block0183_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (234 + i.val) = some (values0183[i.val]'(by rw [values0183_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0183_lookup i)

theorem block0183_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (234 + i.val) = (values0183[i.val]'(by rw [values0183_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0183_lookup i)

theorem block0184_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (266 + i.val) = some (values0184[i.val]'(by rw [values0184_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0184_lookup i)

theorem block0184_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (266 + i.val) = (values0184[i.val]'(by rw [values0184_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0184_lookup i)

theorem block0185_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (298 + i.val) = some (values0185[i.val]'(by rw [values0185_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0185_lookup i)

theorem block0185_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (298 + i.val) = (values0185[i.val]'(by rw [values0185_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0185_lookup i)

theorem block0186_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (330 + i.val) = some (values0186[i.val]'(by rw [values0186_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0186_lookup i)

theorem block0186_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (330 + i.val) = (values0186[i.val]'(by rw [values0186_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0186_lookup i)

theorem block0187_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (362 + i.val) = some (values0187[i.val]'(by rw [values0187_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0187_lookup i)

theorem block0187_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (362 + i.val) = (values0187[i.val]'(by rw [values0187_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0187_lookup i)

theorem block0188_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (394 + i.val) = some (values0188[i.val]'(by rw [values0188_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0188_lookup i)

theorem block0188_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (394 + i.val) = (values0188[i.val]'(by rw [values0188_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0188_lookup i)

theorem block0189_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (426 + i.val) = some (values0189[i.val]'(by rw [values0189_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0189_lookup i)

theorem block0189_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (426 + i.val) = (values0189[i.val]'(by rw [values0189_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0189_lookup i)

theorem block0190_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 11 (458 + i.val) = some (values0190[i.val]'(by rw [values0190_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0190_lookup i)

theorem block0190_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 11 (458 + i.val) = (values0190[i.val]'(by rw [values0190_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0190_lookup i)

theorem block0191_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 11 (490 + i.val) = some (values0191[i.val]'(by rw [values0191_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row011_lookup _).trans (OriginalRow227TriangleLookupRow011.block0191_lookup i)

theorem block0191_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 11 (490 + i.val) = (values0191[i.val]'(by rw [values0191_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0191_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0176_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0176_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0177_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0177_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0178_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0178_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0179_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0179_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0180_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0180_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0181_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0181_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0182_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0182_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0183_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0183_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0184_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0184_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0185_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0185_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0186_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0186_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0187_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0187_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0188_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0188_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0189_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0189_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0190_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0190_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0191_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011.block0191_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011
