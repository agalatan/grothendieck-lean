import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow026

theorem block0402_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (25 + i.val) = some (values0402[i.val]'(by rw [values0402_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0402_lookup i)

theorem block0402_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (25 + i.val) = (values0402[i.val]'(by rw [values0402_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0402_lookup i)

theorem block0403_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (57 + i.val) = some (values0403[i.val]'(by rw [values0403_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0403_lookup i)

theorem block0403_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (57 + i.val) = (values0403[i.val]'(by rw [values0403_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0403_lookup i)

theorem block0404_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (89 + i.val) = some (values0404[i.val]'(by rw [values0404_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0404_lookup i)

theorem block0404_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (89 + i.val) = (values0404[i.val]'(by rw [values0404_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0404_lookup i)

theorem block0405_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (121 + i.val) = some (values0405[i.val]'(by rw [values0405_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0405_lookup i)

theorem block0405_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (121 + i.val) = (values0405[i.val]'(by rw [values0405_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0405_lookup i)

theorem block0406_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (153 + i.val) = some (values0406[i.val]'(by rw [values0406_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0406_lookup i)

theorem block0406_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (153 + i.val) = (values0406[i.val]'(by rw [values0406_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0406_lookup i)

theorem block0407_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (185 + i.val) = some (values0407[i.val]'(by rw [values0407_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0407_lookup i)

theorem block0407_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (185 + i.val) = (values0407[i.val]'(by rw [values0407_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0407_lookup i)

theorem block0408_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (217 + i.val) = some (values0408[i.val]'(by rw [values0408_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0408_lookup i)

theorem block0408_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (217 + i.val) = (values0408[i.val]'(by rw [values0408_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0408_lookup i)

theorem block0409_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (249 + i.val) = some (values0409[i.val]'(by rw [values0409_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0409_lookup i)

theorem block0409_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (249 + i.val) = (values0409[i.val]'(by rw [values0409_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0409_lookup i)

theorem block0410_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (281 + i.val) = some (values0410[i.val]'(by rw [values0410_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0410_lookup i)

theorem block0410_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (281 + i.val) = (values0410[i.val]'(by rw [values0410_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0410_lookup i)

theorem block0411_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (313 + i.val) = some (values0411[i.val]'(by rw [values0411_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0411_lookup i)

theorem block0411_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (313 + i.val) = (values0411[i.val]'(by rw [values0411_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0411_lookup i)

theorem block0412_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (345 + i.val) = some (values0412[i.val]'(by rw [values0412_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0412_lookup i)

theorem block0412_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (345 + i.val) = (values0412[i.val]'(by rw [values0412_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0412_lookup i)

theorem block0413_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (377 + i.val) = some (values0413[i.val]'(by rw [values0413_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0413_lookup i)

theorem block0413_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (377 + i.val) = (values0413[i.val]'(by rw [values0413_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0413_lookup i)

theorem block0414_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (409 + i.val) = some (values0414[i.val]'(by rw [values0414_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0414_lookup i)

theorem block0414_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (409 + i.val) = (values0414[i.val]'(by rw [values0414_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0414_lookup i)

theorem block0415_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 26 (441 + i.val) = some (values0415[i.val]'(by rw [values0415_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0415_lookup i)

theorem block0415_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 26 (441 + i.val) = (values0415[i.val]'(by rw [values0415_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0415_lookup i)

theorem block0416_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 26 (473 + i.val) = some (values0416[i.val]'(by rw [values0416_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row026_lookup _).trans (OriginalRow227TriangleLookupRow026.block0416_lookup i)

theorem block0416_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 26 (473 + i.val) = (values0416[i.val]'(by rw [values0416_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0416_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0402_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0402_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0403_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0403_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0404_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0404_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0405_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0405_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0406_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0406_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0407_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0407_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0408_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0408_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0409_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0409_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0410_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0410_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0411_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0411_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0412_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0412_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0413_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0413_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0414_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0414_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0415_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0415_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0416_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026.block0416_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026
