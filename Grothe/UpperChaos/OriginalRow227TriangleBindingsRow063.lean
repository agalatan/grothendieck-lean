import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow063

theorem block0900_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (62 + i.val) = some (values0900[i.val]'(by rw [values0900_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0900_lookup i)

theorem block0900_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (62 + i.val) = (values0900[i.val]'(by rw [values0900_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0900_lookup i)

theorem block0901_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (94 + i.val) = some (values0901[i.val]'(by rw [values0901_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0901_lookup i)

theorem block0901_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (94 + i.val) = (values0901[i.val]'(by rw [values0901_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0901_lookup i)

theorem block0902_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (126 + i.val) = some (values0902[i.val]'(by rw [values0902_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0902_lookup i)

theorem block0902_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (126 + i.val) = (values0902[i.val]'(by rw [values0902_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0902_lookup i)

theorem block0903_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (158 + i.val) = some (values0903[i.val]'(by rw [values0903_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0903_lookup i)

theorem block0903_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (158 + i.val) = (values0903[i.val]'(by rw [values0903_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0903_lookup i)

theorem block0904_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (190 + i.val) = some (values0904[i.val]'(by rw [values0904_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0904_lookup i)

theorem block0904_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (190 + i.val) = (values0904[i.val]'(by rw [values0904_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0904_lookup i)

theorem block0905_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (222 + i.val) = some (values0905[i.val]'(by rw [values0905_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0905_lookup i)

theorem block0905_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (222 + i.val) = (values0905[i.val]'(by rw [values0905_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0905_lookup i)

theorem block0906_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (254 + i.val) = some (values0906[i.val]'(by rw [values0906_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0906_lookup i)

theorem block0906_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (254 + i.val) = (values0906[i.val]'(by rw [values0906_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0906_lookup i)

theorem block0907_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (286 + i.val) = some (values0907[i.val]'(by rw [values0907_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0907_lookup i)

theorem block0907_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (286 + i.val) = (values0907[i.val]'(by rw [values0907_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0907_lookup i)

theorem block0908_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (318 + i.val) = some (values0908[i.val]'(by rw [values0908_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0908_lookup i)

theorem block0908_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (318 + i.val) = (values0908[i.val]'(by rw [values0908_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0908_lookup i)

theorem block0909_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (350 + i.val) = some (values0909[i.val]'(by rw [values0909_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0909_lookup i)

theorem block0909_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (350 + i.val) = (values0909[i.val]'(by rw [values0909_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0909_lookup i)

theorem block0910_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 63 (382 + i.val) = some (values0910[i.val]'(by rw [values0910_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0910_lookup i)

theorem block0910_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 63 (382 + i.val) = (values0910[i.val]'(by rw [values0910_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0910_lookup i)

theorem block0911_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 63 (414 + i.val) = some (values0911[i.val]'(by rw [values0911_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row063_lookup _).trans (OriginalRow227TriangleLookupRow063.block0911_lookup i)

theorem block0911_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 63 (414 + i.val) = (values0911[i.val]'(by rw [values0911_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0911_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0900_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0900_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0901_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0901_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0902_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0902_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0903_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0903_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0904_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0904_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0905_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0905_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0906_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0906_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0907_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0907_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0908_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0908_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0909_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0909_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0910_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0910_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0911_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063.block0911_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063
