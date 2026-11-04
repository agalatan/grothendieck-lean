import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow131

theorem block1592_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (130 + i.val) = some (values1592[i.val]'(by rw [values1592_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1592_lookup i)

theorem block1592_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (130 + i.val) = (values1592[i.val]'(by rw [values1592_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1592_lookup i)

theorem block1593_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (162 + i.val) = some (values1593[i.val]'(by rw [values1593_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1593_lookup i)

theorem block1593_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (162 + i.val) = (values1593[i.val]'(by rw [values1593_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1593_lookup i)

theorem block1594_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (194 + i.val) = some (values1594[i.val]'(by rw [values1594_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1594_lookup i)

theorem block1594_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (194 + i.val) = (values1594[i.val]'(by rw [values1594_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1594_lookup i)

theorem block1595_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (226 + i.val) = some (values1595[i.val]'(by rw [values1595_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1595_lookup i)

theorem block1595_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (226 + i.val) = (values1595[i.val]'(by rw [values1595_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1595_lookup i)

theorem block1596_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (258 + i.val) = some (values1596[i.val]'(by rw [values1596_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1596_lookup i)

theorem block1596_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (258 + i.val) = (values1596[i.val]'(by rw [values1596_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1596_lookup i)

theorem block1597_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (290 + i.val) = some (values1597[i.val]'(by rw [values1597_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1597_lookup i)

theorem block1597_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (290 + i.val) = (values1597[i.val]'(by rw [values1597_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1597_lookup i)

theorem block1598_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 131 (322 + i.val) = some (values1598[i.val]'(by rw [values1598_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1598_lookup i)

theorem block1598_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 131 (322 + i.val) = (values1598[i.val]'(by rw [values1598_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1598_lookup i)

theorem block1599_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 131 (354 + i.val) = some (values1599[i.val]'(by rw [values1599_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row131_lookup _).trans (OriginalRow227TriangleLookupRow131.block1599_lookup i)

theorem block1599_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 131 (354 + i.val) = (values1599[i.val]'(by rw [values1599_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1599_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1592_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1592_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1593_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1593_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1594_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1594_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1595_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1595_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1596_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1596_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1597_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1597_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1598_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1598_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1599_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131.block1599_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131
