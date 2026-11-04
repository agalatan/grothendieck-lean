import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow024

theorem block0372_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (23 + i.val) = some (values0372[i.val]'(by rw [values0372_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0372_lookup i)

theorem block0372_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (23 + i.val) = (values0372[i.val]'(by rw [values0372_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0372_lookup i)

theorem block0373_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (55 + i.val) = some (values0373[i.val]'(by rw [values0373_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0373_lookup i)

theorem block0373_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (55 + i.val) = (values0373[i.val]'(by rw [values0373_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0373_lookup i)

theorem block0374_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (87 + i.val) = some (values0374[i.val]'(by rw [values0374_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0374_lookup i)

theorem block0374_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (87 + i.val) = (values0374[i.val]'(by rw [values0374_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0374_lookup i)

theorem block0375_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (119 + i.val) = some (values0375[i.val]'(by rw [values0375_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0375_lookup i)

theorem block0375_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (119 + i.val) = (values0375[i.val]'(by rw [values0375_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0375_lookup i)

theorem block0376_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (151 + i.val) = some (values0376[i.val]'(by rw [values0376_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0376_lookup i)

theorem block0376_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (151 + i.val) = (values0376[i.val]'(by rw [values0376_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0376_lookup i)

theorem block0377_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (183 + i.val) = some (values0377[i.val]'(by rw [values0377_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0377_lookup i)

theorem block0377_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (183 + i.val) = (values0377[i.val]'(by rw [values0377_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0377_lookup i)

theorem block0378_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (215 + i.val) = some (values0378[i.val]'(by rw [values0378_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0378_lookup i)

theorem block0378_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (215 + i.val) = (values0378[i.val]'(by rw [values0378_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0378_lookup i)

theorem block0379_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (247 + i.val) = some (values0379[i.val]'(by rw [values0379_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0379_lookup i)

theorem block0379_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (247 + i.val) = (values0379[i.val]'(by rw [values0379_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0379_lookup i)

theorem block0380_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (279 + i.val) = some (values0380[i.val]'(by rw [values0380_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0380_lookup i)

theorem block0380_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (279 + i.val) = (values0380[i.val]'(by rw [values0380_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0380_lookup i)

theorem block0381_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (311 + i.val) = some (values0381[i.val]'(by rw [values0381_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0381_lookup i)

theorem block0381_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (311 + i.val) = (values0381[i.val]'(by rw [values0381_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0381_lookup i)

theorem block0382_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (343 + i.val) = some (values0382[i.val]'(by rw [values0382_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0382_lookup i)

theorem block0382_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (343 + i.val) = (values0382[i.val]'(by rw [values0382_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0382_lookup i)

theorem block0383_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (375 + i.val) = some (values0383[i.val]'(by rw [values0383_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0383_lookup i)

theorem block0383_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (375 + i.val) = (values0383[i.val]'(by rw [values0383_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0383_lookup i)

theorem block0384_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (407 + i.val) = some (values0384[i.val]'(by rw [values0384_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0384_lookup i)

theorem block0384_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (407 + i.val) = (values0384[i.val]'(by rw [values0384_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0384_lookup i)

theorem block0385_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 24 (439 + i.val) = some (values0385[i.val]'(by rw [values0385_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0385_lookup i)

theorem block0385_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 24 (439 + i.val) = (values0385[i.val]'(by rw [values0385_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0385_lookup i)

theorem block0386_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 24 (471 + i.val) = some (values0386[i.val]'(by rw [values0386_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row024_lookup _).trans (OriginalRow227TriangleLookupRow024.block0386_lookup i)

theorem block0386_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 24 (471 + i.val) = (values0386[i.val]'(by rw [values0386_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0386_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0372_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0372_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0373_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0373_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0374_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0374_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0375_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0375_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0376_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0376_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0377_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0377_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0378_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0378_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0379_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0379_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0380_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0380_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0381_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0381_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0382_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0382_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0383_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0383_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0384_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0384_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0385_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0385_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0386_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024.block0386_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024
