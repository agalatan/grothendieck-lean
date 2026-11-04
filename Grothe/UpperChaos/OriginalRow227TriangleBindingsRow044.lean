import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow044

theorem block0656_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (43 + i.val) = some (values0656[i.val]'(by rw [values0656_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0656_lookup i)

theorem block0656_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (43 + i.val) = (values0656[i.val]'(by rw [values0656_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0656_lookup i)

theorem block0657_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (75 + i.val) = some (values0657[i.val]'(by rw [values0657_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0657_lookup i)

theorem block0657_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (75 + i.val) = (values0657[i.val]'(by rw [values0657_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0657_lookup i)

theorem block0658_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (107 + i.val) = some (values0658[i.val]'(by rw [values0658_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0658_lookup i)

theorem block0658_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (107 + i.val) = (values0658[i.val]'(by rw [values0658_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0658_lookup i)

theorem block0659_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (139 + i.val) = some (values0659[i.val]'(by rw [values0659_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0659_lookup i)

theorem block0659_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (139 + i.val) = (values0659[i.val]'(by rw [values0659_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0659_lookup i)

theorem block0660_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (171 + i.val) = some (values0660[i.val]'(by rw [values0660_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0660_lookup i)

theorem block0660_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (171 + i.val) = (values0660[i.val]'(by rw [values0660_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0660_lookup i)

theorem block0661_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (203 + i.val) = some (values0661[i.val]'(by rw [values0661_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0661_lookup i)

theorem block0661_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (203 + i.val) = (values0661[i.val]'(by rw [values0661_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0661_lookup i)

theorem block0662_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (235 + i.val) = some (values0662[i.val]'(by rw [values0662_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0662_lookup i)

theorem block0662_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (235 + i.val) = (values0662[i.val]'(by rw [values0662_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0662_lookup i)

theorem block0663_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (267 + i.val) = some (values0663[i.val]'(by rw [values0663_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0663_lookup i)

theorem block0663_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (267 + i.val) = (values0663[i.val]'(by rw [values0663_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0663_lookup i)

theorem block0664_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (299 + i.val) = some (values0664[i.val]'(by rw [values0664_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0664_lookup i)

theorem block0664_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (299 + i.val) = (values0664[i.val]'(by rw [values0664_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0664_lookup i)

theorem block0665_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (331 + i.val) = some (values0665[i.val]'(by rw [values0665_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0665_lookup i)

theorem block0665_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (331 + i.val) = (values0665[i.val]'(by rw [values0665_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0665_lookup i)

theorem block0666_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (363 + i.val) = some (values0666[i.val]'(by rw [values0666_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0666_lookup i)

theorem block0666_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (363 + i.val) = (values0666[i.val]'(by rw [values0666_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0666_lookup i)

theorem block0667_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 44 (395 + i.val) = some (values0667[i.val]'(by rw [values0667_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0667_lookup i)

theorem block0667_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 44 (395 + i.val) = (values0667[i.val]'(by rw [values0667_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0667_lookup i)

theorem block0668_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 44 (427 + i.val) = some (values0668[i.val]'(by rw [values0668_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row044_lookup _).trans (OriginalRow227TriangleLookupRow044.block0668_lookup i)

theorem block0668_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 44 (427 + i.val) = (values0668[i.val]'(by rw [values0668_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0668_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0656_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0656_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0657_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0657_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0658_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0658_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0659_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0659_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0660_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0660_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0661_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0661_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0662_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0662_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0663_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0663_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0664_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0664_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0665_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0665_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0666_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0666_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0667_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0667_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0668_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044.block0668_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044
