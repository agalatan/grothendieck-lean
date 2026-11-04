import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow093

theorem block1242_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (92 + i.val) = some (values1242[i.val]'(by rw [values1242_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1242_lookup i)

theorem block1242_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (92 + i.val) = (values1242[i.val]'(by rw [values1242_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1242_lookup i)

theorem block1243_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (124 + i.val) = some (values1243[i.val]'(by rw [values1243_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1243_lookup i)

theorem block1243_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (124 + i.val) = (values1243[i.val]'(by rw [values1243_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1243_lookup i)

theorem block1244_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (156 + i.val) = some (values1244[i.val]'(by rw [values1244_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1244_lookup i)

theorem block1244_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (156 + i.val) = (values1244[i.val]'(by rw [values1244_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1244_lookup i)

theorem block1245_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (188 + i.val) = some (values1245[i.val]'(by rw [values1245_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1245_lookup i)

theorem block1245_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (188 + i.val) = (values1245[i.val]'(by rw [values1245_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1245_lookup i)

theorem block1246_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (220 + i.val) = some (values1246[i.val]'(by rw [values1246_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1246_lookup i)

theorem block1246_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (220 + i.val) = (values1246[i.val]'(by rw [values1246_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1246_lookup i)

theorem block1247_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (252 + i.val) = some (values1247[i.val]'(by rw [values1247_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1247_lookup i)

theorem block1247_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (252 + i.val) = (values1247[i.val]'(by rw [values1247_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1247_lookup i)

theorem block1248_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (284 + i.val) = some (values1248[i.val]'(by rw [values1248_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1248_lookup i)

theorem block1248_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (284 + i.val) = (values1248[i.val]'(by rw [values1248_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1248_lookup i)

theorem block1249_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (316 + i.val) = some (values1249[i.val]'(by rw [values1249_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1249_lookup i)

theorem block1249_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (316 + i.val) = (values1249[i.val]'(by rw [values1249_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1249_lookup i)

theorem block1250_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 93 (348 + i.val) = some (values1250[i.val]'(by rw [values1250_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1250_lookup i)

theorem block1250_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 93 (348 + i.val) = (values1250[i.val]'(by rw [values1250_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1250_lookup i)

theorem block1251_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 93 (380 + i.val) = some (values1251[i.val]'(by rw [values1251_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row093_lookup _).trans (OriginalRow227TriangleLookupRow093.block1251_lookup i)

theorem block1251_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 93 (380 + i.val) = (values1251[i.val]'(by rw [values1251_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1251_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1242_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1242_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1243_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1243_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1244_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1244_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1245_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1245_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1246_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1246_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1247_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1247_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1248_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1248_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1249_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1249_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1250_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1250_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1251_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093.block1251_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093
