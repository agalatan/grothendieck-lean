import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow022

theorem block0342_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (21 + i.val) = some (values0342[i.val]'(by rw [values0342_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0342_lookup i)

theorem block0342_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (21 + i.val) = (values0342[i.val]'(by rw [values0342_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0342_lookup i)

theorem block0343_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (53 + i.val) = some (values0343[i.val]'(by rw [values0343_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0343_lookup i)

theorem block0343_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (53 + i.val) = (values0343[i.val]'(by rw [values0343_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0343_lookup i)

theorem block0344_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (85 + i.val) = some (values0344[i.val]'(by rw [values0344_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0344_lookup i)

theorem block0344_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (85 + i.val) = (values0344[i.val]'(by rw [values0344_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0344_lookup i)

theorem block0345_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (117 + i.val) = some (values0345[i.val]'(by rw [values0345_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0345_lookup i)

theorem block0345_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (117 + i.val) = (values0345[i.val]'(by rw [values0345_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0345_lookup i)

theorem block0346_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (149 + i.val) = some (values0346[i.val]'(by rw [values0346_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0346_lookup i)

theorem block0346_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (149 + i.val) = (values0346[i.val]'(by rw [values0346_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0346_lookup i)

theorem block0347_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (181 + i.val) = some (values0347[i.val]'(by rw [values0347_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0347_lookup i)

theorem block0347_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (181 + i.val) = (values0347[i.val]'(by rw [values0347_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0347_lookup i)

theorem block0348_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (213 + i.val) = some (values0348[i.val]'(by rw [values0348_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0348_lookup i)

theorem block0348_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (213 + i.val) = (values0348[i.val]'(by rw [values0348_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0348_lookup i)

theorem block0349_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (245 + i.val) = some (values0349[i.val]'(by rw [values0349_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0349_lookup i)

theorem block0349_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (245 + i.val) = (values0349[i.val]'(by rw [values0349_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0349_lookup i)

theorem block0350_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (277 + i.val) = some (values0350[i.val]'(by rw [values0350_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0350_lookup i)

theorem block0350_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (277 + i.val) = (values0350[i.val]'(by rw [values0350_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0350_lookup i)

theorem block0351_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (309 + i.val) = some (values0351[i.val]'(by rw [values0351_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0351_lookup i)

theorem block0351_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (309 + i.val) = (values0351[i.val]'(by rw [values0351_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0351_lookup i)

theorem block0352_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (341 + i.val) = some (values0352[i.val]'(by rw [values0352_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0352_lookup i)

theorem block0352_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (341 + i.val) = (values0352[i.val]'(by rw [values0352_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0352_lookup i)

theorem block0353_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (373 + i.val) = some (values0353[i.val]'(by rw [values0353_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0353_lookup i)

theorem block0353_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (373 + i.val) = (values0353[i.val]'(by rw [values0353_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0353_lookup i)

theorem block0354_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (405 + i.val) = some (values0354[i.val]'(by rw [values0354_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0354_lookup i)

theorem block0354_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (405 + i.val) = (values0354[i.val]'(by rw [values0354_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0354_lookup i)

theorem block0355_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 22 (437 + i.val) = some (values0355[i.val]'(by rw [values0355_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0355_lookup i)

theorem block0355_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 22 (437 + i.val) = (values0355[i.val]'(by rw [values0355_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0355_lookup i)

theorem block0356_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 22 (469 + i.val) = some (values0356[i.val]'(by rw [values0356_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row022_lookup _).trans (OriginalRow227TriangleLookupRow022.block0356_lookup i)

theorem block0356_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 22 (469 + i.val) = (values0356[i.val]'(by rw [values0356_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0356_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0342_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0342_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0343_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0343_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0344_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0344_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0345_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0345_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0346_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0346_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0347_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0347_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0348_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0348_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0349_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0349_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0350_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0350_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0351_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0351_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0352_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0352_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0353_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0353_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0354_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0354_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0355_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0355_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0356_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022.block0356_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022
