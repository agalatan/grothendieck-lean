import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow025

theorem block0387_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (24 + i.val) = some (values0387[i.val]'(by rw [values0387_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0387_lookup i)

theorem block0387_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (24 + i.val) = (values0387[i.val]'(by rw [values0387_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0387_lookup i)

theorem block0388_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (56 + i.val) = some (values0388[i.val]'(by rw [values0388_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0388_lookup i)

theorem block0388_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (56 + i.val) = (values0388[i.val]'(by rw [values0388_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0388_lookup i)

theorem block0389_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (88 + i.val) = some (values0389[i.val]'(by rw [values0389_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0389_lookup i)

theorem block0389_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (88 + i.val) = (values0389[i.val]'(by rw [values0389_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0389_lookup i)

theorem block0390_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (120 + i.val) = some (values0390[i.val]'(by rw [values0390_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0390_lookup i)

theorem block0390_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (120 + i.val) = (values0390[i.val]'(by rw [values0390_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0390_lookup i)

theorem block0391_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (152 + i.val) = some (values0391[i.val]'(by rw [values0391_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0391_lookup i)

theorem block0391_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (152 + i.val) = (values0391[i.val]'(by rw [values0391_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0391_lookup i)

theorem block0392_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (184 + i.val) = some (values0392[i.val]'(by rw [values0392_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0392_lookup i)

theorem block0392_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (184 + i.val) = (values0392[i.val]'(by rw [values0392_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0392_lookup i)

theorem block0393_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (216 + i.val) = some (values0393[i.val]'(by rw [values0393_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0393_lookup i)

theorem block0393_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (216 + i.val) = (values0393[i.val]'(by rw [values0393_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0393_lookup i)

theorem block0394_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (248 + i.val) = some (values0394[i.val]'(by rw [values0394_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0394_lookup i)

theorem block0394_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (248 + i.val) = (values0394[i.val]'(by rw [values0394_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0394_lookup i)

theorem block0395_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (280 + i.val) = some (values0395[i.val]'(by rw [values0395_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0395_lookup i)

theorem block0395_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (280 + i.val) = (values0395[i.val]'(by rw [values0395_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0395_lookup i)

theorem block0396_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (312 + i.val) = some (values0396[i.val]'(by rw [values0396_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0396_lookup i)

theorem block0396_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (312 + i.val) = (values0396[i.val]'(by rw [values0396_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0396_lookup i)

theorem block0397_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (344 + i.val) = some (values0397[i.val]'(by rw [values0397_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0397_lookup i)

theorem block0397_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (344 + i.val) = (values0397[i.val]'(by rw [values0397_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0397_lookup i)

theorem block0398_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (376 + i.val) = some (values0398[i.val]'(by rw [values0398_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0398_lookup i)

theorem block0398_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (376 + i.val) = (values0398[i.val]'(by rw [values0398_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0398_lookup i)

theorem block0399_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (408 + i.val) = some (values0399[i.val]'(by rw [values0399_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0399_lookup i)

theorem block0399_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (408 + i.val) = (values0399[i.val]'(by rw [values0399_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0399_lookup i)

theorem block0400_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 25 (440 + i.val) = some (values0400[i.val]'(by rw [values0400_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0400_lookup i)

theorem block0400_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 25 (440 + i.val) = (values0400[i.val]'(by rw [values0400_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0400_lookup i)

theorem block0401_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 25 (472 + i.val) = some (values0401[i.val]'(by rw [values0401_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row025_lookup _).trans (OriginalRow227TriangleLookupRow025.block0401_lookup i)

theorem block0401_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 25 (472 + i.val) = (values0401[i.val]'(by rw [values0401_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0401_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0387_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0387_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0388_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0388_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0389_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0389_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0390_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0390_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0391_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0391_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0392_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0392_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0393_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0393_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0394_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0394_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0395_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0395_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0396_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0396_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0397_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0397_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0398_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0398_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0399_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0399_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0400_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0400_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0401_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025.block0401_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025
