import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow047

theorem block0695_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (46 + i.val) = some (values0695[i.val]'(by rw [values0695_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0695_lookup i)

theorem block0695_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (46 + i.val) = (values0695[i.val]'(by rw [values0695_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0695_lookup i)

theorem block0696_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (78 + i.val) = some (values0696[i.val]'(by rw [values0696_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0696_lookup i)

theorem block0696_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (78 + i.val) = (values0696[i.val]'(by rw [values0696_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0696_lookup i)

theorem block0697_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (110 + i.val) = some (values0697[i.val]'(by rw [values0697_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0697_lookup i)

theorem block0697_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (110 + i.val) = (values0697[i.val]'(by rw [values0697_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0697_lookup i)

theorem block0698_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (142 + i.val) = some (values0698[i.val]'(by rw [values0698_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0698_lookup i)

theorem block0698_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (142 + i.val) = (values0698[i.val]'(by rw [values0698_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0698_lookup i)

theorem block0699_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (174 + i.val) = some (values0699[i.val]'(by rw [values0699_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0699_lookup i)

theorem block0699_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (174 + i.val) = (values0699[i.val]'(by rw [values0699_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0699_lookup i)

theorem block0700_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (206 + i.val) = some (values0700[i.val]'(by rw [values0700_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0700_lookup i)

theorem block0700_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (206 + i.val) = (values0700[i.val]'(by rw [values0700_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0700_lookup i)

theorem block0701_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (238 + i.val) = some (values0701[i.val]'(by rw [values0701_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0701_lookup i)

theorem block0701_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (238 + i.val) = (values0701[i.val]'(by rw [values0701_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0701_lookup i)

theorem block0702_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (270 + i.val) = some (values0702[i.val]'(by rw [values0702_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0702_lookup i)

theorem block0702_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (270 + i.val) = (values0702[i.val]'(by rw [values0702_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0702_lookup i)

theorem block0703_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (302 + i.val) = some (values0703[i.val]'(by rw [values0703_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0703_lookup i)

theorem block0703_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (302 + i.val) = (values0703[i.val]'(by rw [values0703_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0703_lookup i)

theorem block0704_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (334 + i.val) = some (values0704[i.val]'(by rw [values0704_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0704_lookup i)

theorem block0704_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (334 + i.val) = (values0704[i.val]'(by rw [values0704_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0704_lookup i)

theorem block0705_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (366 + i.val) = some (values0705[i.val]'(by rw [values0705_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0705_lookup i)

theorem block0705_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (366 + i.val) = (values0705[i.val]'(by rw [values0705_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0705_lookup i)

theorem block0706_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 47 (398 + i.val) = some (values0706[i.val]'(by rw [values0706_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0706_lookup i)

theorem block0706_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 47 (398 + i.val) = (values0706[i.val]'(by rw [values0706_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0706_lookup i)

theorem block0707_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 47 (430 + i.val) = some (values0707[i.val]'(by rw [values0707_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row047_lookup _).trans (OriginalRow227TriangleLookupRow047.block0707_lookup i)

theorem block0707_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 47 (430 + i.val) = (values0707[i.val]'(by rw [values0707_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0707_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0695_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0695_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0696_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0696_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0697_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0697_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0698_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0698_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0699_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0699_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0700_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0700_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0701_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0701_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0702_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0702_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0703_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0703_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0704_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0704_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0705_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0705_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0706_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0706_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0707_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047.block0707_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047
