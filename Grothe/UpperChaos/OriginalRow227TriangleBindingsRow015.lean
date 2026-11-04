import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow015

theorem block0237_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (14 + i.val) = some (values0237[i.val]'(by rw [values0237_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0237_lookup i)

theorem block0237_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (14 + i.val) = (values0237[i.val]'(by rw [values0237_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0237_lookup i)

theorem block0238_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (46 + i.val) = some (values0238[i.val]'(by rw [values0238_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0238_lookup i)

theorem block0238_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (46 + i.val) = (values0238[i.val]'(by rw [values0238_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0238_lookup i)

theorem block0239_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (78 + i.val) = some (values0239[i.val]'(by rw [values0239_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0239_lookup i)

theorem block0239_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (78 + i.val) = (values0239[i.val]'(by rw [values0239_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0239_lookup i)

theorem block0240_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (110 + i.val) = some (values0240[i.val]'(by rw [values0240_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0240_lookup i)

theorem block0240_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (110 + i.val) = (values0240[i.val]'(by rw [values0240_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0240_lookup i)

theorem block0241_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (142 + i.val) = some (values0241[i.val]'(by rw [values0241_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0241_lookup i)

theorem block0241_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (142 + i.val) = (values0241[i.val]'(by rw [values0241_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0241_lookup i)

theorem block0242_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (174 + i.val) = some (values0242[i.val]'(by rw [values0242_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0242_lookup i)

theorem block0242_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (174 + i.val) = (values0242[i.val]'(by rw [values0242_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0242_lookup i)

theorem block0243_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (206 + i.val) = some (values0243[i.val]'(by rw [values0243_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0243_lookup i)

theorem block0243_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (206 + i.val) = (values0243[i.val]'(by rw [values0243_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0243_lookup i)

theorem block0244_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (238 + i.val) = some (values0244[i.val]'(by rw [values0244_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0244_lookup i)

theorem block0244_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (238 + i.val) = (values0244[i.val]'(by rw [values0244_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0244_lookup i)

theorem block0245_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (270 + i.val) = some (values0245[i.val]'(by rw [values0245_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0245_lookup i)

theorem block0245_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (270 + i.val) = (values0245[i.val]'(by rw [values0245_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0245_lookup i)

theorem block0246_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (302 + i.val) = some (values0246[i.val]'(by rw [values0246_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0246_lookup i)

theorem block0246_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (302 + i.val) = (values0246[i.val]'(by rw [values0246_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0246_lookup i)

theorem block0247_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (334 + i.val) = some (values0247[i.val]'(by rw [values0247_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0247_lookup i)

theorem block0247_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (334 + i.val) = (values0247[i.val]'(by rw [values0247_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0247_lookup i)

theorem block0248_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (366 + i.val) = some (values0248[i.val]'(by rw [values0248_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0248_lookup i)

theorem block0248_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (366 + i.val) = (values0248[i.val]'(by rw [values0248_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0248_lookup i)

theorem block0249_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (398 + i.val) = some (values0249[i.val]'(by rw [values0249_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0249_lookup i)

theorem block0249_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (398 + i.val) = (values0249[i.val]'(by rw [values0249_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0249_lookup i)

theorem block0250_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 15 (430 + i.val) = some (values0250[i.val]'(by rw [values0250_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0250_lookup i)

theorem block0250_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 15 (430 + i.val) = (values0250[i.val]'(by rw [values0250_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0250_lookup i)

theorem block0251_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 15 (462 + i.val) = some (values0251[i.val]'(by rw [values0251_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row015_lookup _).trans (OriginalRow227TriangleLookupRow015.block0251_lookup i)

theorem block0251_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 15 (462 + i.val) = (values0251[i.val]'(by rw [values0251_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0251_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0237_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0237_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0238_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0238_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0239_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0239_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0240_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0240_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0241_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0241_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0242_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0242_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0243_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0243_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0244_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0244_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0245_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0245_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0246_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0246_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0247_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0247_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0248_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0248_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0249_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0249_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0250_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0250_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0251_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015.block0251_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015
