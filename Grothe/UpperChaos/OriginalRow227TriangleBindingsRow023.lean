import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow023

theorem block0357_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (22 + i.val) = some (values0357[i.val]'(by rw [values0357_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0357_lookup i)

theorem block0357_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (22 + i.val) = (values0357[i.val]'(by rw [values0357_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0357_lookup i)

theorem block0358_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (54 + i.val) = some (values0358[i.val]'(by rw [values0358_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0358_lookup i)

theorem block0358_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (54 + i.val) = (values0358[i.val]'(by rw [values0358_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0358_lookup i)

theorem block0359_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (86 + i.val) = some (values0359[i.val]'(by rw [values0359_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0359_lookup i)

theorem block0359_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (86 + i.val) = (values0359[i.val]'(by rw [values0359_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0359_lookup i)

theorem block0360_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (118 + i.val) = some (values0360[i.val]'(by rw [values0360_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0360_lookup i)

theorem block0360_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (118 + i.val) = (values0360[i.val]'(by rw [values0360_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0360_lookup i)

theorem block0361_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (150 + i.val) = some (values0361[i.val]'(by rw [values0361_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0361_lookup i)

theorem block0361_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (150 + i.val) = (values0361[i.val]'(by rw [values0361_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0361_lookup i)

theorem block0362_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (182 + i.val) = some (values0362[i.val]'(by rw [values0362_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0362_lookup i)

theorem block0362_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (182 + i.val) = (values0362[i.val]'(by rw [values0362_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0362_lookup i)

theorem block0363_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (214 + i.val) = some (values0363[i.val]'(by rw [values0363_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0363_lookup i)

theorem block0363_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (214 + i.val) = (values0363[i.val]'(by rw [values0363_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0363_lookup i)

theorem block0364_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (246 + i.val) = some (values0364[i.val]'(by rw [values0364_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0364_lookup i)

theorem block0364_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (246 + i.val) = (values0364[i.val]'(by rw [values0364_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0364_lookup i)

theorem block0365_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (278 + i.val) = some (values0365[i.val]'(by rw [values0365_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0365_lookup i)

theorem block0365_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (278 + i.val) = (values0365[i.val]'(by rw [values0365_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0365_lookup i)

theorem block0366_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (310 + i.val) = some (values0366[i.val]'(by rw [values0366_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0366_lookup i)

theorem block0366_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (310 + i.val) = (values0366[i.val]'(by rw [values0366_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0366_lookup i)

theorem block0367_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (342 + i.val) = some (values0367[i.val]'(by rw [values0367_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0367_lookup i)

theorem block0367_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (342 + i.val) = (values0367[i.val]'(by rw [values0367_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0367_lookup i)

theorem block0368_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (374 + i.val) = some (values0368[i.val]'(by rw [values0368_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0368_lookup i)

theorem block0368_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (374 + i.val) = (values0368[i.val]'(by rw [values0368_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0368_lookup i)

theorem block0369_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (406 + i.val) = some (values0369[i.val]'(by rw [values0369_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0369_lookup i)

theorem block0369_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (406 + i.val) = (values0369[i.val]'(by rw [values0369_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0369_lookup i)

theorem block0370_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 23 (438 + i.val) = some (values0370[i.val]'(by rw [values0370_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0370_lookup i)

theorem block0370_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 23 (438 + i.val) = (values0370[i.val]'(by rw [values0370_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0370_lookup i)

theorem block0371_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 23 (470 + i.val) = some (values0371[i.val]'(by rw [values0371_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row023_lookup _).trans (OriginalRow227TriangleLookupRow023.block0371_lookup i)

theorem block0371_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 23 (470 + i.val) = (values0371[i.val]'(by rw [values0371_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0371_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0357_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0357_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0358_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0358_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0359_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0359_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0360_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0360_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0361_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0361_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0362_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0362_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0363_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0363_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0364_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0364_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0365_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0365_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0366_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0366_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0367_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0367_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0368_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0368_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0369_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0369_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0370_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0370_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0371_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023.block0371_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023
