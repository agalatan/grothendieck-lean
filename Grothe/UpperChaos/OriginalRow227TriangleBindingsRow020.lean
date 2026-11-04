import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow020

theorem block0312_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (19 + i.val) = some (values0312[i.val]'(by rw [values0312_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0312_lookup i)

theorem block0312_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (19 + i.val) = (values0312[i.val]'(by rw [values0312_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0312_lookup i)

theorem block0313_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (51 + i.val) = some (values0313[i.val]'(by rw [values0313_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0313_lookup i)

theorem block0313_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (51 + i.val) = (values0313[i.val]'(by rw [values0313_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0313_lookup i)

theorem block0314_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (83 + i.val) = some (values0314[i.val]'(by rw [values0314_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0314_lookup i)

theorem block0314_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (83 + i.val) = (values0314[i.val]'(by rw [values0314_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0314_lookup i)

theorem block0315_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (115 + i.val) = some (values0315[i.val]'(by rw [values0315_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0315_lookup i)

theorem block0315_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (115 + i.val) = (values0315[i.val]'(by rw [values0315_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0315_lookup i)

theorem block0316_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (147 + i.val) = some (values0316[i.val]'(by rw [values0316_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0316_lookup i)

theorem block0316_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (147 + i.val) = (values0316[i.val]'(by rw [values0316_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0316_lookup i)

theorem block0317_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (179 + i.val) = some (values0317[i.val]'(by rw [values0317_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0317_lookup i)

theorem block0317_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (179 + i.val) = (values0317[i.val]'(by rw [values0317_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0317_lookup i)

theorem block0318_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (211 + i.val) = some (values0318[i.val]'(by rw [values0318_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0318_lookup i)

theorem block0318_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (211 + i.val) = (values0318[i.val]'(by rw [values0318_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0318_lookup i)

theorem block0319_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (243 + i.val) = some (values0319[i.val]'(by rw [values0319_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0319_lookup i)

theorem block0319_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (243 + i.val) = (values0319[i.val]'(by rw [values0319_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0319_lookup i)

theorem block0320_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (275 + i.val) = some (values0320[i.val]'(by rw [values0320_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0320_lookup i)

theorem block0320_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (275 + i.val) = (values0320[i.val]'(by rw [values0320_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0320_lookup i)

theorem block0321_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (307 + i.val) = some (values0321[i.val]'(by rw [values0321_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0321_lookup i)

theorem block0321_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (307 + i.val) = (values0321[i.val]'(by rw [values0321_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0321_lookup i)

theorem block0322_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (339 + i.val) = some (values0322[i.val]'(by rw [values0322_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0322_lookup i)

theorem block0322_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (339 + i.val) = (values0322[i.val]'(by rw [values0322_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0322_lookup i)

theorem block0323_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (371 + i.val) = some (values0323[i.val]'(by rw [values0323_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0323_lookup i)

theorem block0323_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (371 + i.val) = (values0323[i.val]'(by rw [values0323_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0323_lookup i)

theorem block0324_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (403 + i.val) = some (values0324[i.val]'(by rw [values0324_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0324_lookup i)

theorem block0324_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (403 + i.val) = (values0324[i.val]'(by rw [values0324_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0324_lookup i)

theorem block0325_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 20 (435 + i.val) = some (values0325[i.val]'(by rw [values0325_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0325_lookup i)

theorem block0325_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 20 (435 + i.val) = (values0325[i.val]'(by rw [values0325_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0325_lookup i)

theorem block0326_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 20 (467 + i.val) = some (values0326[i.val]'(by rw [values0326_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row020_lookup _).trans (OriginalRow227TriangleLookupRow020.block0326_lookup i)

theorem block0326_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 20 (467 + i.val) = (values0326[i.val]'(by rw [values0326_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0326_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0312_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0312_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0313_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0313_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0314_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0314_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0315_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0315_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0316_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0316_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0317_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0317_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0318_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0318_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0319_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0319_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0320_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0320_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0321_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0321_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0322_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0322_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0323_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0323_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0324_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0324_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0325_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0325_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0326_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020.block0326_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020
