import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow046

theorem block0682_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (45 + i.val) = some (values0682[i.val]'(by rw [values0682_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0682_lookup i)

theorem block0682_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (45 + i.val) = (values0682[i.val]'(by rw [values0682_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0682_lookup i)

theorem block0683_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (77 + i.val) = some (values0683[i.val]'(by rw [values0683_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0683_lookup i)

theorem block0683_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (77 + i.val) = (values0683[i.val]'(by rw [values0683_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0683_lookup i)

theorem block0684_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (109 + i.val) = some (values0684[i.val]'(by rw [values0684_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0684_lookup i)

theorem block0684_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (109 + i.val) = (values0684[i.val]'(by rw [values0684_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0684_lookup i)

theorem block0685_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (141 + i.val) = some (values0685[i.val]'(by rw [values0685_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0685_lookup i)

theorem block0685_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (141 + i.val) = (values0685[i.val]'(by rw [values0685_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0685_lookup i)

theorem block0686_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (173 + i.val) = some (values0686[i.val]'(by rw [values0686_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0686_lookup i)

theorem block0686_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (173 + i.val) = (values0686[i.val]'(by rw [values0686_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0686_lookup i)

theorem block0687_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (205 + i.val) = some (values0687[i.val]'(by rw [values0687_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0687_lookup i)

theorem block0687_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (205 + i.val) = (values0687[i.val]'(by rw [values0687_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0687_lookup i)

theorem block0688_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (237 + i.val) = some (values0688[i.val]'(by rw [values0688_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0688_lookup i)

theorem block0688_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (237 + i.val) = (values0688[i.val]'(by rw [values0688_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0688_lookup i)

theorem block0689_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (269 + i.val) = some (values0689[i.val]'(by rw [values0689_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0689_lookup i)

theorem block0689_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (269 + i.val) = (values0689[i.val]'(by rw [values0689_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0689_lookup i)

theorem block0690_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (301 + i.val) = some (values0690[i.val]'(by rw [values0690_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0690_lookup i)

theorem block0690_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (301 + i.val) = (values0690[i.val]'(by rw [values0690_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0690_lookup i)

theorem block0691_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (333 + i.val) = some (values0691[i.val]'(by rw [values0691_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0691_lookup i)

theorem block0691_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (333 + i.val) = (values0691[i.val]'(by rw [values0691_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0691_lookup i)

theorem block0692_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (365 + i.val) = some (values0692[i.val]'(by rw [values0692_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0692_lookup i)

theorem block0692_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (365 + i.val) = (values0692[i.val]'(by rw [values0692_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0692_lookup i)

theorem block0693_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 46 (397 + i.val) = some (values0693[i.val]'(by rw [values0693_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0693_lookup i)

theorem block0693_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 46 (397 + i.val) = (values0693[i.val]'(by rw [values0693_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0693_lookup i)

theorem block0694_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 46 (429 + i.val) = some (values0694[i.val]'(by rw [values0694_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row046_lookup _).trans (OriginalRow227TriangleLookupRow046.block0694_lookup i)

theorem block0694_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 46 (429 + i.val) = (values0694[i.val]'(by rw [values0694_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0694_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0682_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0682_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0683_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0683_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0684_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0684_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0685_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0685_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0686_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0686_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0687_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0687_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0688_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0688_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0689_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0689_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0690_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0690_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0691_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0691_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0692_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0692_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0693_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0693_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0694_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046.block0694_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046
