import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow003

theorem block0048_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (2 + i.val) = some (values0048[i.val]'(by rw [values0048_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0048_lookup i)

theorem block0048_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (2 + i.val) = (values0048[i.val]'(by rw [values0048_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0048_lookup i)

theorem block0049_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (34 + i.val) = some (values0049[i.val]'(by rw [values0049_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0049_lookup i)

theorem block0049_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (34 + i.val) = (values0049[i.val]'(by rw [values0049_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0049_lookup i)

theorem block0050_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (66 + i.val) = some (values0050[i.val]'(by rw [values0050_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0050_lookup i)

theorem block0050_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (66 + i.val) = (values0050[i.val]'(by rw [values0050_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0050_lookup i)

theorem block0051_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (98 + i.val) = some (values0051[i.val]'(by rw [values0051_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0051_lookup i)

theorem block0051_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (98 + i.val) = (values0051[i.val]'(by rw [values0051_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0051_lookup i)

theorem block0052_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (130 + i.val) = some (values0052[i.val]'(by rw [values0052_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0052_lookup i)

theorem block0052_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (130 + i.val) = (values0052[i.val]'(by rw [values0052_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0052_lookup i)

theorem block0053_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (162 + i.val) = some (values0053[i.val]'(by rw [values0053_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0053_lookup i)

theorem block0053_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (162 + i.val) = (values0053[i.val]'(by rw [values0053_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0053_lookup i)

theorem block0054_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (194 + i.val) = some (values0054[i.val]'(by rw [values0054_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0054_lookup i)

theorem block0054_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (194 + i.val) = (values0054[i.val]'(by rw [values0054_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0054_lookup i)

theorem block0055_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (226 + i.val) = some (values0055[i.val]'(by rw [values0055_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0055_lookup i)

theorem block0055_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (226 + i.val) = (values0055[i.val]'(by rw [values0055_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0055_lookup i)

theorem block0056_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (258 + i.val) = some (values0056[i.val]'(by rw [values0056_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0056_lookup i)

theorem block0056_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (258 + i.val) = (values0056[i.val]'(by rw [values0056_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0056_lookup i)

theorem block0057_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (290 + i.val) = some (values0057[i.val]'(by rw [values0057_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0057_lookup i)

theorem block0057_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (290 + i.val) = (values0057[i.val]'(by rw [values0057_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0057_lookup i)

theorem block0058_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (322 + i.val) = some (values0058[i.val]'(by rw [values0058_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0058_lookup i)

theorem block0058_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (322 + i.val) = (values0058[i.val]'(by rw [values0058_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0058_lookup i)

theorem block0059_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (354 + i.val) = some (values0059[i.val]'(by rw [values0059_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0059_lookup i)

theorem block0059_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (354 + i.val) = (values0059[i.val]'(by rw [values0059_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0059_lookup i)

theorem block0060_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (386 + i.val) = some (values0060[i.val]'(by rw [values0060_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0060_lookup i)

theorem block0060_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (386 + i.val) = (values0060[i.val]'(by rw [values0060_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0060_lookup i)

theorem block0061_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (418 + i.val) = some (values0061[i.val]'(by rw [values0061_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0061_lookup i)

theorem block0061_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (418 + i.val) = (values0061[i.val]'(by rw [values0061_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0061_lookup i)

theorem block0062_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 3 (450 + i.val) = some (values0062[i.val]'(by rw [values0062_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0062_lookup i)

theorem block0062_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 3 (450 + i.val) = (values0062[i.val]'(by rw [values0062_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0062_lookup i)

theorem block0063_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 3 (482 + i.val) = some (values0063[i.val]'(by rw [values0063_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row003_lookup _).trans (OriginalRow227TriangleLookupRow003.block0063_lookup i)

theorem block0063_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 3 (482 + i.val) = (values0063[i.val]'(by rw [values0063_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0063_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0048_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0048_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0049_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0049_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0050_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0050_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0051_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0051_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0052_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0052_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0053_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0053_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0054_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0054_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0055_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0055_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0056_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0056_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0057_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0057_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0058_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0058_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0059_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0059_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0060_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0060_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0061_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0061_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0062_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0062_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0063_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003.block0063_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003
