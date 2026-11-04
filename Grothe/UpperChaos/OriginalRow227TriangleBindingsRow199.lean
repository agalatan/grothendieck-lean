import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow199

theorem block1996_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 199 (198 + i.val) = some (values1996[i.val]'(by rw [values1996_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row199_lookup _).trans (OriginalRow227TriangleLookupRow199.block1996_lookup i)

theorem block1996_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 199 (198 + i.val) = (values1996[i.val]'(by rw [values1996_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1996_lookup i)

theorem block1997_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 199 (230 + i.val) = some (values1997[i.val]'(by rw [values1997_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row199_lookup _).trans (OriginalRow227TriangleLookupRow199.block1997_lookup i)

theorem block1997_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 199 (230 + i.val) = (values1997[i.val]'(by rw [values1997_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1997_lookup i)

theorem block1998_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 199 (262 + i.val) = some (values1998[i.val]'(by rw [values1998_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row199_lookup _).trans (OriginalRow227TriangleLookupRow199.block1998_lookup i)

theorem block1998_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 199 (262 + i.val) = (values1998[i.val]'(by rw [values1998_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1998_lookup i)

theorem block1999_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 199 (294 + i.val) = some (values1999[i.val]'(by rw [values1999_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row199_lookup _).trans (OriginalRow227TriangleLookupRow199.block1999_lookup i)

theorem block1999_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 199 (294 + i.val) = (values1999[i.val]'(by rw [values1999_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1999_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1996_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1996_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1997_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1997_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1998_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1998_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1999_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199.block1999_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow199
