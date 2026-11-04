import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow004

theorem block0064_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (3 + i.val) = some (values0064[i.val]'(by rw [values0064_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0064_lookup i)

theorem block0064_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (3 + i.val) = (values0064[i.val]'(by rw [values0064_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0064_lookup i)

theorem block0065_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (35 + i.val) = some (values0065[i.val]'(by rw [values0065_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0065_lookup i)

theorem block0065_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (35 + i.val) = (values0065[i.val]'(by rw [values0065_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0065_lookup i)

theorem block0066_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (67 + i.val) = some (values0066[i.val]'(by rw [values0066_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0066_lookup i)

theorem block0066_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (67 + i.val) = (values0066[i.val]'(by rw [values0066_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0066_lookup i)

theorem block0067_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (99 + i.val) = some (values0067[i.val]'(by rw [values0067_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0067_lookup i)

theorem block0067_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (99 + i.val) = (values0067[i.val]'(by rw [values0067_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0067_lookup i)

theorem block0068_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (131 + i.val) = some (values0068[i.val]'(by rw [values0068_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0068_lookup i)

theorem block0068_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (131 + i.val) = (values0068[i.val]'(by rw [values0068_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0068_lookup i)

theorem block0069_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (163 + i.val) = some (values0069[i.val]'(by rw [values0069_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0069_lookup i)

theorem block0069_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (163 + i.val) = (values0069[i.val]'(by rw [values0069_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0069_lookup i)

theorem block0070_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (195 + i.val) = some (values0070[i.val]'(by rw [values0070_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0070_lookup i)

theorem block0070_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (195 + i.val) = (values0070[i.val]'(by rw [values0070_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0070_lookup i)

theorem block0071_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (227 + i.val) = some (values0071[i.val]'(by rw [values0071_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0071_lookup i)

theorem block0071_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (227 + i.val) = (values0071[i.val]'(by rw [values0071_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0071_lookup i)

theorem block0072_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (259 + i.val) = some (values0072[i.val]'(by rw [values0072_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0072_lookup i)

theorem block0072_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (259 + i.val) = (values0072[i.val]'(by rw [values0072_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0072_lookup i)

theorem block0073_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (291 + i.val) = some (values0073[i.val]'(by rw [values0073_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0073_lookup i)

theorem block0073_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (291 + i.val) = (values0073[i.val]'(by rw [values0073_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0073_lookup i)

theorem block0074_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (323 + i.val) = some (values0074[i.val]'(by rw [values0074_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0074_lookup i)

theorem block0074_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (323 + i.val) = (values0074[i.val]'(by rw [values0074_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0074_lookup i)

theorem block0075_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (355 + i.val) = some (values0075[i.val]'(by rw [values0075_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0075_lookup i)

theorem block0075_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (355 + i.val) = (values0075[i.val]'(by rw [values0075_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0075_lookup i)

theorem block0076_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (387 + i.val) = some (values0076[i.val]'(by rw [values0076_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0076_lookup i)

theorem block0076_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (387 + i.val) = (values0076[i.val]'(by rw [values0076_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0076_lookup i)

theorem block0077_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (419 + i.val) = some (values0077[i.val]'(by rw [values0077_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0077_lookup i)

theorem block0077_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (419 + i.val) = (values0077[i.val]'(by rw [values0077_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0077_lookup i)

theorem block0078_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 4 (451 + i.val) = some (values0078[i.val]'(by rw [values0078_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0078_lookup i)

theorem block0078_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 4 (451 + i.val) = (values0078[i.val]'(by rw [values0078_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0078_lookup i)

theorem block0079_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 4 (483 + i.val) = some (values0079[i.val]'(by rw [values0079_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row004_lookup _).trans (OriginalRow227TriangleLookupRow004.block0079_lookup i)

theorem block0079_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 4 (483 + i.val) = (values0079[i.val]'(by rw [values0079_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0079_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0064_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0064_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0065_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0065_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0066_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0066_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0067_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0067_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0068_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0068_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0069_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0069_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0070_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0070_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0071_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0071_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0072_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0072_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0073_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0073_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0074_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0074_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0075_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0075_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0076_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0076_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0077_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0077_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0078_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0078_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0079_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004.block0079_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004
