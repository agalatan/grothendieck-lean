import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow007

theorem block0112_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (6 + i.val) = some (values0112[i.val]'(by rw [values0112_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0112_lookup i)

theorem block0112_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (6 + i.val) = (values0112[i.val]'(by rw [values0112_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0112_lookup i)

theorem block0113_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (38 + i.val) = some (values0113[i.val]'(by rw [values0113_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0113_lookup i)

theorem block0113_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (38 + i.val) = (values0113[i.val]'(by rw [values0113_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0113_lookup i)

theorem block0114_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (70 + i.val) = some (values0114[i.val]'(by rw [values0114_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0114_lookup i)

theorem block0114_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (70 + i.val) = (values0114[i.val]'(by rw [values0114_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0114_lookup i)

theorem block0115_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (102 + i.val) = some (values0115[i.val]'(by rw [values0115_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0115_lookup i)

theorem block0115_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (102 + i.val) = (values0115[i.val]'(by rw [values0115_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0115_lookup i)

theorem block0116_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (134 + i.val) = some (values0116[i.val]'(by rw [values0116_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0116_lookup i)

theorem block0116_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (134 + i.val) = (values0116[i.val]'(by rw [values0116_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0116_lookup i)

theorem block0117_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (166 + i.val) = some (values0117[i.val]'(by rw [values0117_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0117_lookup i)

theorem block0117_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (166 + i.val) = (values0117[i.val]'(by rw [values0117_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0117_lookup i)

theorem block0118_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (198 + i.val) = some (values0118[i.val]'(by rw [values0118_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0118_lookup i)

theorem block0118_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (198 + i.val) = (values0118[i.val]'(by rw [values0118_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0118_lookup i)

theorem block0119_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (230 + i.val) = some (values0119[i.val]'(by rw [values0119_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0119_lookup i)

theorem block0119_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (230 + i.val) = (values0119[i.val]'(by rw [values0119_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0119_lookup i)

theorem block0120_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (262 + i.val) = some (values0120[i.val]'(by rw [values0120_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0120_lookup i)

theorem block0120_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (262 + i.val) = (values0120[i.val]'(by rw [values0120_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0120_lookup i)

theorem block0121_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (294 + i.val) = some (values0121[i.val]'(by rw [values0121_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0121_lookup i)

theorem block0121_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (294 + i.val) = (values0121[i.val]'(by rw [values0121_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0121_lookup i)

theorem block0122_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (326 + i.val) = some (values0122[i.val]'(by rw [values0122_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0122_lookup i)

theorem block0122_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (326 + i.val) = (values0122[i.val]'(by rw [values0122_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0122_lookup i)

theorem block0123_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (358 + i.val) = some (values0123[i.val]'(by rw [values0123_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0123_lookup i)

theorem block0123_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (358 + i.val) = (values0123[i.val]'(by rw [values0123_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0123_lookup i)

theorem block0124_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (390 + i.val) = some (values0124[i.val]'(by rw [values0124_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0124_lookup i)

theorem block0124_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (390 + i.val) = (values0124[i.val]'(by rw [values0124_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0124_lookup i)

theorem block0125_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (422 + i.val) = some (values0125[i.val]'(by rw [values0125_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0125_lookup i)

theorem block0125_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (422 + i.val) = (values0125[i.val]'(by rw [values0125_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0125_lookup i)

theorem block0126_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 7 (454 + i.val) = some (values0126[i.val]'(by rw [values0126_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0126_lookup i)

theorem block0126_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 7 (454 + i.val) = (values0126[i.val]'(by rw [values0126_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0126_lookup i)

theorem block0127_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 7 (486 + i.val) = some (values0127[i.val]'(by rw [values0127_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row007_lookup _).trans (OriginalRow227TriangleLookupRow007.block0127_lookup i)

theorem block0127_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 7 (486 + i.val) = (values0127[i.val]'(by rw [values0127_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0127_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0112_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0112_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0113_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0113_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0114_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0114_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0115_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0115_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0116_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0116_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0117_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0117_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0118_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0118_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0119_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0119_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0120_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0120_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0121_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0121_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0122_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0122_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0123_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0123_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0124_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0124_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0125_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0125_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0126_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0126_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0127_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007.block0127_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007
