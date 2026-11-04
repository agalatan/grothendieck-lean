import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow056

theorem block0812_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (55 + i.val) = some (values0812[i.val]'(by rw [values0812_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0812_lookup i)

theorem block0812_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (55 + i.val) = (values0812[i.val]'(by rw [values0812_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0812_lookup i)

theorem block0813_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (87 + i.val) = some (values0813[i.val]'(by rw [values0813_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0813_lookup i)

theorem block0813_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (87 + i.val) = (values0813[i.val]'(by rw [values0813_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0813_lookup i)

theorem block0814_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (119 + i.val) = some (values0814[i.val]'(by rw [values0814_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0814_lookup i)

theorem block0814_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (119 + i.val) = (values0814[i.val]'(by rw [values0814_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0814_lookup i)

theorem block0815_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (151 + i.val) = some (values0815[i.val]'(by rw [values0815_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0815_lookup i)

theorem block0815_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (151 + i.val) = (values0815[i.val]'(by rw [values0815_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0815_lookup i)

theorem block0816_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (183 + i.val) = some (values0816[i.val]'(by rw [values0816_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0816_lookup i)

theorem block0816_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (183 + i.val) = (values0816[i.val]'(by rw [values0816_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0816_lookup i)

theorem block0817_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (215 + i.val) = some (values0817[i.val]'(by rw [values0817_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0817_lookup i)

theorem block0817_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (215 + i.val) = (values0817[i.val]'(by rw [values0817_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0817_lookup i)

theorem block0818_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (247 + i.val) = some (values0818[i.val]'(by rw [values0818_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0818_lookup i)

theorem block0818_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (247 + i.val) = (values0818[i.val]'(by rw [values0818_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0818_lookup i)

theorem block0819_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (279 + i.val) = some (values0819[i.val]'(by rw [values0819_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0819_lookup i)

theorem block0819_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (279 + i.val) = (values0819[i.val]'(by rw [values0819_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0819_lookup i)

theorem block0820_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (311 + i.val) = some (values0820[i.val]'(by rw [values0820_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0820_lookup i)

theorem block0820_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (311 + i.val) = (values0820[i.val]'(by rw [values0820_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0820_lookup i)

theorem block0821_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (343 + i.val) = some (values0821[i.val]'(by rw [values0821_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0821_lookup i)

theorem block0821_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (343 + i.val) = (values0821[i.val]'(by rw [values0821_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0821_lookup i)

theorem block0822_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (375 + i.val) = some (values0822[i.val]'(by rw [values0822_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0822_lookup i)

theorem block0822_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (375 + i.val) = (values0822[i.val]'(by rw [values0822_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0822_lookup i)

theorem block0823_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 56 (407 + i.val) = some (values0823[i.val]'(by rw [values0823_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0823_lookup i)

theorem block0823_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 56 (407 + i.val) = (values0823[i.val]'(by rw [values0823_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0823_lookup i)

theorem block0824_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 56 (439 + i.val) = some (values0824[i.val]'(by rw [values0824_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row056_lookup _).trans (OriginalRow227TriangleLookupRow056.block0824_lookup i)

theorem block0824_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 56 (439 + i.val) = (values0824[i.val]'(by rw [values0824_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0824_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0812_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0812_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0813_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0813_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0814_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0814_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0815_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0815_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0816_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0816_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0817_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0817_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0818_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0818_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0819_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0819_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0820_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0820_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0821_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0821_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0822_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0822_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0823_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0823_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0824_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056.block0824_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056
