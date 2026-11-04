import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow009

theorem block0144_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (8 + i.val) = some (values0144[i.val]'(by rw [values0144_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0144_lookup i)

theorem block0144_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (8 + i.val) = (values0144[i.val]'(by rw [values0144_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0144_lookup i)

theorem block0145_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (40 + i.val) = some (values0145[i.val]'(by rw [values0145_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0145_lookup i)

theorem block0145_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (40 + i.val) = (values0145[i.val]'(by rw [values0145_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0145_lookup i)

theorem block0146_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (72 + i.val) = some (values0146[i.val]'(by rw [values0146_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0146_lookup i)

theorem block0146_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (72 + i.val) = (values0146[i.val]'(by rw [values0146_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0146_lookup i)

theorem block0147_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (104 + i.val) = some (values0147[i.val]'(by rw [values0147_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0147_lookup i)

theorem block0147_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (104 + i.val) = (values0147[i.val]'(by rw [values0147_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0147_lookup i)

theorem block0148_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (136 + i.val) = some (values0148[i.val]'(by rw [values0148_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0148_lookup i)

theorem block0148_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (136 + i.val) = (values0148[i.val]'(by rw [values0148_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0148_lookup i)

theorem block0149_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (168 + i.val) = some (values0149[i.val]'(by rw [values0149_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0149_lookup i)

theorem block0149_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (168 + i.val) = (values0149[i.val]'(by rw [values0149_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0149_lookup i)

theorem block0150_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (200 + i.val) = some (values0150[i.val]'(by rw [values0150_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0150_lookup i)

theorem block0150_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (200 + i.val) = (values0150[i.val]'(by rw [values0150_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0150_lookup i)

theorem block0151_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (232 + i.val) = some (values0151[i.val]'(by rw [values0151_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0151_lookup i)

theorem block0151_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (232 + i.val) = (values0151[i.val]'(by rw [values0151_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0151_lookup i)

theorem block0152_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (264 + i.val) = some (values0152[i.val]'(by rw [values0152_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0152_lookup i)

theorem block0152_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (264 + i.val) = (values0152[i.val]'(by rw [values0152_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0152_lookup i)

theorem block0153_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (296 + i.val) = some (values0153[i.val]'(by rw [values0153_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0153_lookup i)

theorem block0153_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (296 + i.val) = (values0153[i.val]'(by rw [values0153_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0153_lookup i)

theorem block0154_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (328 + i.val) = some (values0154[i.val]'(by rw [values0154_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0154_lookup i)

theorem block0154_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (328 + i.val) = (values0154[i.val]'(by rw [values0154_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0154_lookup i)

theorem block0155_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (360 + i.val) = some (values0155[i.val]'(by rw [values0155_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0155_lookup i)

theorem block0155_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (360 + i.val) = (values0155[i.val]'(by rw [values0155_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0155_lookup i)

theorem block0156_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (392 + i.val) = some (values0156[i.val]'(by rw [values0156_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0156_lookup i)

theorem block0156_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (392 + i.val) = (values0156[i.val]'(by rw [values0156_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0156_lookup i)

theorem block0157_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (424 + i.val) = some (values0157[i.val]'(by rw [values0157_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0157_lookup i)

theorem block0157_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (424 + i.val) = (values0157[i.val]'(by rw [values0157_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0157_lookup i)

theorem block0158_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 9 (456 + i.val) = some (values0158[i.val]'(by rw [values0158_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0158_lookup i)

theorem block0158_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 9 (456 + i.val) = (values0158[i.val]'(by rw [values0158_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0158_lookup i)

theorem block0159_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 9 (488 + i.val) = some (values0159[i.val]'(by rw [values0159_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row009_lookup _).trans (OriginalRow227TriangleLookupRow009.block0159_lookup i)

theorem block0159_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 9 (488 + i.val) = (values0159[i.val]'(by rw [values0159_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0159_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0144_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0144_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0145_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0145_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0146_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0146_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0147_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0147_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0148_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0148_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0149_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0149_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0150_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0150_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0151_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0151_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0152_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0152_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0153_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0153_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0154_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0154_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0155_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0155_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0156_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0156_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0157_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0157_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0158_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0158_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0159_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009.block0159_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009
