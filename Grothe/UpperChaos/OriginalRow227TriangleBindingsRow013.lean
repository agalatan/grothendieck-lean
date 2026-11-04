import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow013

theorem block0207_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (12 + i.val) = some (values0207[i.val]'(by rw [values0207_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0207_lookup i)

theorem block0207_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (12 + i.val) = (values0207[i.val]'(by rw [values0207_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0207_lookup i)

theorem block0208_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (44 + i.val) = some (values0208[i.val]'(by rw [values0208_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0208_lookup i)

theorem block0208_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (44 + i.val) = (values0208[i.val]'(by rw [values0208_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0208_lookup i)

theorem block0209_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (76 + i.val) = some (values0209[i.val]'(by rw [values0209_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0209_lookup i)

theorem block0209_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (76 + i.val) = (values0209[i.val]'(by rw [values0209_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0209_lookup i)

theorem block0210_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (108 + i.val) = some (values0210[i.val]'(by rw [values0210_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0210_lookup i)

theorem block0210_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (108 + i.val) = (values0210[i.val]'(by rw [values0210_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0210_lookup i)

theorem block0211_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (140 + i.val) = some (values0211[i.val]'(by rw [values0211_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0211_lookup i)

theorem block0211_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (140 + i.val) = (values0211[i.val]'(by rw [values0211_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0211_lookup i)

theorem block0212_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (172 + i.val) = some (values0212[i.val]'(by rw [values0212_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0212_lookup i)

theorem block0212_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (172 + i.val) = (values0212[i.val]'(by rw [values0212_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0212_lookup i)

theorem block0213_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (204 + i.val) = some (values0213[i.val]'(by rw [values0213_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0213_lookup i)

theorem block0213_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (204 + i.val) = (values0213[i.val]'(by rw [values0213_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0213_lookup i)

theorem block0214_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (236 + i.val) = some (values0214[i.val]'(by rw [values0214_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0214_lookup i)

theorem block0214_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (236 + i.val) = (values0214[i.val]'(by rw [values0214_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0214_lookup i)

theorem block0215_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (268 + i.val) = some (values0215[i.val]'(by rw [values0215_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0215_lookup i)

theorem block0215_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (268 + i.val) = (values0215[i.val]'(by rw [values0215_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0215_lookup i)

theorem block0216_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (300 + i.val) = some (values0216[i.val]'(by rw [values0216_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0216_lookup i)

theorem block0216_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (300 + i.val) = (values0216[i.val]'(by rw [values0216_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0216_lookup i)

theorem block0217_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (332 + i.val) = some (values0217[i.val]'(by rw [values0217_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0217_lookup i)

theorem block0217_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (332 + i.val) = (values0217[i.val]'(by rw [values0217_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0217_lookup i)

theorem block0218_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (364 + i.val) = some (values0218[i.val]'(by rw [values0218_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0218_lookup i)

theorem block0218_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (364 + i.val) = (values0218[i.val]'(by rw [values0218_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0218_lookup i)

theorem block0219_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (396 + i.val) = some (values0219[i.val]'(by rw [values0219_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0219_lookup i)

theorem block0219_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (396 + i.val) = (values0219[i.val]'(by rw [values0219_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0219_lookup i)

theorem block0220_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 13 (428 + i.val) = some (values0220[i.val]'(by rw [values0220_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0220_lookup i)

theorem block0220_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 13 (428 + i.val) = (values0220[i.val]'(by rw [values0220_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0220_lookup i)

theorem block0221_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 13 (460 + i.val) = some (values0221[i.val]'(by rw [values0221_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row013_lookup _).trans (OriginalRow227TriangleLookupRow013.block0221_lookup i)

theorem block0221_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 13 (460 + i.val) = (values0221[i.val]'(by rw [values0221_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0221_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0207_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0207_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0208_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0208_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0209_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0209_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0210_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0210_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0211_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0211_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0212_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0212_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0213_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0213_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0214_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0214_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0215_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0215_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0216_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0216_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0217_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0217_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0218_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0218_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0219_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0219_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0220_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0220_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0221_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013.block0221_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013
