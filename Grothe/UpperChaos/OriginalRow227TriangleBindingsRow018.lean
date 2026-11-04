import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow018

theorem block0282_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (17 + i.val) = some (values0282[i.val]'(by rw [values0282_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0282_lookup i)

theorem block0282_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (17 + i.val) = (values0282[i.val]'(by rw [values0282_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0282_lookup i)

theorem block0283_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (49 + i.val) = some (values0283[i.val]'(by rw [values0283_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0283_lookup i)

theorem block0283_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (49 + i.val) = (values0283[i.val]'(by rw [values0283_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0283_lookup i)

theorem block0284_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (81 + i.val) = some (values0284[i.val]'(by rw [values0284_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0284_lookup i)

theorem block0284_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (81 + i.val) = (values0284[i.val]'(by rw [values0284_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0284_lookup i)

theorem block0285_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (113 + i.val) = some (values0285[i.val]'(by rw [values0285_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0285_lookup i)

theorem block0285_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (113 + i.val) = (values0285[i.val]'(by rw [values0285_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0285_lookup i)

theorem block0286_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (145 + i.val) = some (values0286[i.val]'(by rw [values0286_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0286_lookup i)

theorem block0286_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (145 + i.val) = (values0286[i.val]'(by rw [values0286_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0286_lookup i)

theorem block0287_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (177 + i.val) = some (values0287[i.val]'(by rw [values0287_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0287_lookup i)

theorem block0287_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (177 + i.val) = (values0287[i.val]'(by rw [values0287_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0287_lookup i)

theorem block0288_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (209 + i.val) = some (values0288[i.val]'(by rw [values0288_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0288_lookup i)

theorem block0288_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (209 + i.val) = (values0288[i.val]'(by rw [values0288_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0288_lookup i)

theorem block0289_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (241 + i.val) = some (values0289[i.val]'(by rw [values0289_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0289_lookup i)

theorem block0289_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (241 + i.val) = (values0289[i.val]'(by rw [values0289_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0289_lookup i)

theorem block0290_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (273 + i.val) = some (values0290[i.val]'(by rw [values0290_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0290_lookup i)

theorem block0290_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (273 + i.val) = (values0290[i.val]'(by rw [values0290_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0290_lookup i)

theorem block0291_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (305 + i.val) = some (values0291[i.val]'(by rw [values0291_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0291_lookup i)

theorem block0291_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (305 + i.val) = (values0291[i.val]'(by rw [values0291_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0291_lookup i)

theorem block0292_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (337 + i.val) = some (values0292[i.val]'(by rw [values0292_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0292_lookup i)

theorem block0292_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (337 + i.val) = (values0292[i.val]'(by rw [values0292_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0292_lookup i)

theorem block0293_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (369 + i.val) = some (values0293[i.val]'(by rw [values0293_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0293_lookup i)

theorem block0293_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (369 + i.val) = (values0293[i.val]'(by rw [values0293_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0293_lookup i)

theorem block0294_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (401 + i.val) = some (values0294[i.val]'(by rw [values0294_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0294_lookup i)

theorem block0294_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (401 + i.val) = (values0294[i.val]'(by rw [values0294_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0294_lookup i)

theorem block0295_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 18 (433 + i.val) = some (values0295[i.val]'(by rw [values0295_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0295_lookup i)

theorem block0295_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 18 (433 + i.val) = (values0295[i.val]'(by rw [values0295_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0295_lookup i)

theorem block0296_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 18 (465 + i.val) = some (values0296[i.val]'(by rw [values0296_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row018_lookup _).trans (OriginalRow227TriangleLookupRow018.block0296_lookup i)

theorem block0296_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 18 (465 + i.val) = (values0296[i.val]'(by rw [values0296_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0296_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0282_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0282_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0283_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0283_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0284_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0284_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0285_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0285_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0286_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0286_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0287_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0287_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0288_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0288_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0289_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0289_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0290_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0290_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0291_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0291_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0292_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0292_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0293_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0293_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0294_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0294_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0295_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0295_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0296_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018.block0296_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018
