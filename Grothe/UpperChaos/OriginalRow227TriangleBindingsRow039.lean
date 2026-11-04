import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow039

theorem block0586_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (38 + i.val) = some (values0586[i.val]'(by rw [values0586_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0586_lookup i)

theorem block0586_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (38 + i.val) = (values0586[i.val]'(by rw [values0586_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0586_lookup i)

theorem block0587_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (70 + i.val) = some (values0587[i.val]'(by rw [values0587_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0587_lookup i)

theorem block0587_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (70 + i.val) = (values0587[i.val]'(by rw [values0587_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0587_lookup i)

theorem block0588_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (102 + i.val) = some (values0588[i.val]'(by rw [values0588_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0588_lookup i)

theorem block0588_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (102 + i.val) = (values0588[i.val]'(by rw [values0588_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0588_lookup i)

theorem block0589_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (134 + i.val) = some (values0589[i.val]'(by rw [values0589_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0589_lookup i)

theorem block0589_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (134 + i.val) = (values0589[i.val]'(by rw [values0589_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0589_lookup i)

theorem block0590_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (166 + i.val) = some (values0590[i.val]'(by rw [values0590_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0590_lookup i)

theorem block0590_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (166 + i.val) = (values0590[i.val]'(by rw [values0590_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0590_lookup i)

theorem block0591_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (198 + i.val) = some (values0591[i.val]'(by rw [values0591_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0591_lookup i)

theorem block0591_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (198 + i.val) = (values0591[i.val]'(by rw [values0591_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0591_lookup i)

theorem block0592_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (230 + i.val) = some (values0592[i.val]'(by rw [values0592_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0592_lookup i)

theorem block0592_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (230 + i.val) = (values0592[i.val]'(by rw [values0592_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0592_lookup i)

theorem block0593_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (262 + i.val) = some (values0593[i.val]'(by rw [values0593_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0593_lookup i)

theorem block0593_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (262 + i.val) = (values0593[i.val]'(by rw [values0593_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0593_lookup i)

theorem block0594_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (294 + i.val) = some (values0594[i.val]'(by rw [values0594_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0594_lookup i)

theorem block0594_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (294 + i.val) = (values0594[i.val]'(by rw [values0594_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0594_lookup i)

theorem block0595_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (326 + i.val) = some (values0595[i.val]'(by rw [values0595_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0595_lookup i)

theorem block0595_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (326 + i.val) = (values0595[i.val]'(by rw [values0595_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0595_lookup i)

theorem block0596_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (358 + i.val) = some (values0596[i.val]'(by rw [values0596_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0596_lookup i)

theorem block0596_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (358 + i.val) = (values0596[i.val]'(by rw [values0596_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0596_lookup i)

theorem block0597_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (390 + i.val) = some (values0597[i.val]'(by rw [values0597_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0597_lookup i)

theorem block0597_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (390 + i.val) = (values0597[i.val]'(by rw [values0597_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0597_lookup i)

theorem block0598_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 39 (422 + i.val) = some (values0598[i.val]'(by rw [values0598_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0598_lookup i)

theorem block0598_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 39 (422 + i.val) = (values0598[i.val]'(by rw [values0598_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0598_lookup i)

theorem block0599_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 39 (454 + i.val) = some (values0599[i.val]'(by rw [values0599_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row039_lookup _).trans (OriginalRow227TriangleLookupRow039.block0599_lookup i)

theorem block0599_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 39 (454 + i.val) = (values0599[i.val]'(by rw [values0599_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0599_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0586_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0586_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0587_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0587_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0588_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0588_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0589_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0589_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0590_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0590_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0591_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0591_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0592_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0592_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0593_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0593_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0594_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0594_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0595_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0595_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0596_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0596_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0597_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0597_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0598_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0598_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0599_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039.block0599_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039
