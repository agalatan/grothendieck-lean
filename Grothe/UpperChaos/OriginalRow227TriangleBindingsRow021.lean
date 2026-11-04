import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow021

theorem block0327_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (20 + i.val) = some (values0327[i.val]'(by rw [values0327_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0327_lookup i)

theorem block0327_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (20 + i.val) = (values0327[i.val]'(by rw [values0327_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0327_lookup i)

theorem block0328_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (52 + i.val) = some (values0328[i.val]'(by rw [values0328_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0328_lookup i)

theorem block0328_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (52 + i.val) = (values0328[i.val]'(by rw [values0328_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0328_lookup i)

theorem block0329_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (84 + i.val) = some (values0329[i.val]'(by rw [values0329_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0329_lookup i)

theorem block0329_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (84 + i.val) = (values0329[i.val]'(by rw [values0329_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0329_lookup i)

theorem block0330_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (116 + i.val) = some (values0330[i.val]'(by rw [values0330_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0330_lookup i)

theorem block0330_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (116 + i.val) = (values0330[i.val]'(by rw [values0330_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0330_lookup i)

theorem block0331_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (148 + i.val) = some (values0331[i.val]'(by rw [values0331_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0331_lookup i)

theorem block0331_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (148 + i.val) = (values0331[i.val]'(by rw [values0331_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0331_lookup i)

theorem block0332_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (180 + i.val) = some (values0332[i.val]'(by rw [values0332_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0332_lookup i)

theorem block0332_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (180 + i.val) = (values0332[i.val]'(by rw [values0332_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0332_lookup i)

theorem block0333_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (212 + i.val) = some (values0333[i.val]'(by rw [values0333_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0333_lookup i)

theorem block0333_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (212 + i.val) = (values0333[i.val]'(by rw [values0333_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0333_lookup i)

theorem block0334_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (244 + i.val) = some (values0334[i.val]'(by rw [values0334_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0334_lookup i)

theorem block0334_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (244 + i.val) = (values0334[i.val]'(by rw [values0334_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0334_lookup i)

theorem block0335_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (276 + i.val) = some (values0335[i.val]'(by rw [values0335_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0335_lookup i)

theorem block0335_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (276 + i.val) = (values0335[i.val]'(by rw [values0335_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0335_lookup i)

theorem block0336_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (308 + i.val) = some (values0336[i.val]'(by rw [values0336_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0336_lookup i)

theorem block0336_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (308 + i.val) = (values0336[i.val]'(by rw [values0336_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0336_lookup i)

theorem block0337_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (340 + i.val) = some (values0337[i.val]'(by rw [values0337_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0337_lookup i)

theorem block0337_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (340 + i.val) = (values0337[i.val]'(by rw [values0337_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0337_lookup i)

theorem block0338_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (372 + i.val) = some (values0338[i.val]'(by rw [values0338_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0338_lookup i)

theorem block0338_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (372 + i.val) = (values0338[i.val]'(by rw [values0338_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0338_lookup i)

theorem block0339_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (404 + i.val) = some (values0339[i.val]'(by rw [values0339_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0339_lookup i)

theorem block0339_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (404 + i.val) = (values0339[i.val]'(by rw [values0339_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0339_lookup i)

theorem block0340_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 21 (436 + i.val) = some (values0340[i.val]'(by rw [values0340_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0340_lookup i)

theorem block0340_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 21 (436 + i.val) = (values0340[i.val]'(by rw [values0340_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0340_lookup i)

theorem block0341_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 21 (468 + i.val) = some (values0341[i.val]'(by rw [values0341_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row021_lookup _).trans (OriginalRow227TriangleLookupRow021.block0341_lookup i)

theorem block0341_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 21 (468 + i.val) = (values0341[i.val]'(by rw [values0341_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0341_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0327_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0327_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0328_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0328_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0329_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0329_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0330_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0330_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0331_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0331_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0332_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0332_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0333_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0333_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0334_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0334_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0335_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0335_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0336_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0336_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0337_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0337_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0338_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0338_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0339_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0339_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0340_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0340_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0341_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021.block0341_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021
