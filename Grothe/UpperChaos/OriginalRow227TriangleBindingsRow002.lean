import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow002

theorem block0032_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (1 + i.val) = some (values0032[i.val]'(by rw [values0032_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0032_lookup i)

theorem block0032_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (1 + i.val) = (values0032[i.val]'(by rw [values0032_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0032_lookup i)

theorem block0033_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (33 + i.val) = some (values0033[i.val]'(by rw [values0033_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0033_lookup i)

theorem block0033_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (33 + i.val) = (values0033[i.val]'(by rw [values0033_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0033_lookup i)

theorem block0034_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (65 + i.val) = some (values0034[i.val]'(by rw [values0034_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0034_lookup i)

theorem block0034_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (65 + i.val) = (values0034[i.val]'(by rw [values0034_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0034_lookup i)

theorem block0035_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (97 + i.val) = some (values0035[i.val]'(by rw [values0035_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0035_lookup i)

theorem block0035_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (97 + i.val) = (values0035[i.val]'(by rw [values0035_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0035_lookup i)

theorem block0036_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (129 + i.val) = some (values0036[i.val]'(by rw [values0036_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0036_lookup i)

theorem block0036_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (129 + i.val) = (values0036[i.val]'(by rw [values0036_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0036_lookup i)

theorem block0037_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (161 + i.val) = some (values0037[i.val]'(by rw [values0037_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0037_lookup i)

theorem block0037_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (161 + i.val) = (values0037[i.val]'(by rw [values0037_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0037_lookup i)

theorem block0038_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (193 + i.val) = some (values0038[i.val]'(by rw [values0038_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0038_lookup i)

theorem block0038_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (193 + i.val) = (values0038[i.val]'(by rw [values0038_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0038_lookup i)

theorem block0039_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (225 + i.val) = some (values0039[i.val]'(by rw [values0039_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0039_lookup i)

theorem block0039_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (225 + i.val) = (values0039[i.val]'(by rw [values0039_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0039_lookup i)

theorem block0040_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (257 + i.val) = some (values0040[i.val]'(by rw [values0040_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0040_lookup i)

theorem block0040_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (257 + i.val) = (values0040[i.val]'(by rw [values0040_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0040_lookup i)

theorem block0041_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (289 + i.val) = some (values0041[i.val]'(by rw [values0041_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0041_lookup i)

theorem block0041_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (289 + i.val) = (values0041[i.val]'(by rw [values0041_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0041_lookup i)

theorem block0042_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (321 + i.val) = some (values0042[i.val]'(by rw [values0042_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0042_lookup i)

theorem block0042_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (321 + i.val) = (values0042[i.val]'(by rw [values0042_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0042_lookup i)

theorem block0043_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (353 + i.val) = some (values0043[i.val]'(by rw [values0043_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0043_lookup i)

theorem block0043_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (353 + i.val) = (values0043[i.val]'(by rw [values0043_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0043_lookup i)

theorem block0044_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (385 + i.val) = some (values0044[i.val]'(by rw [values0044_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0044_lookup i)

theorem block0044_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (385 + i.val) = (values0044[i.val]'(by rw [values0044_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0044_lookup i)

theorem block0045_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (417 + i.val) = some (values0045[i.val]'(by rw [values0045_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0045_lookup i)

theorem block0045_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (417 + i.val) = (values0045[i.val]'(by rw [values0045_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0045_lookup i)

theorem block0046_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 2 (449 + i.val) = some (values0046[i.val]'(by rw [values0046_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0046_lookup i)

theorem block0046_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 2 (449 + i.val) = (values0046[i.val]'(by rw [values0046_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0046_lookup i)

theorem block0047_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 2 (481 + i.val) = some (values0047[i.val]'(by rw [values0047_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row002_lookup _).trans (OriginalRow227TriangleLookupRow002.block0047_lookup i)

theorem block0047_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 2 (481 + i.val) = (values0047[i.val]'(by rw [values0047_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0047_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0032_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0032_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0033_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0033_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0034_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0034_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0035_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0035_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0036_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0036_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0037_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0037_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0038_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0038_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0039_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0039_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0040_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0040_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0041_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0041_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0042_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0042_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0043_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0043_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0044_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0044_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0045_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0045_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0046_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0046_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0047_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002.block0047_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002
