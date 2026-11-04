import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow190

theorem block1960_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 190 (189 + i.val) = some (values1960[i.val]'(by rw [values1960_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row190_lookup _).trans (OriginalRow227TriangleLookupRow190.block1960_lookup i)

theorem block1960_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 190 (189 + i.val) = (values1960[i.val]'(by rw [values1960_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1960_lookup i)

theorem block1961_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 190 (221 + i.val) = some (values1961[i.val]'(by rw [values1961_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row190_lookup _).trans (OriginalRow227TriangleLookupRow190.block1961_lookup i)

theorem block1961_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 190 (221 + i.val) = (values1961[i.val]'(by rw [values1961_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1961_lookup i)

theorem block1962_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 190 (253 + i.val) = some (values1962[i.val]'(by rw [values1962_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row190_lookup _).trans (OriginalRow227TriangleLookupRow190.block1962_lookup i)

theorem block1962_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 190 (253 + i.val) = (values1962[i.val]'(by rw [values1962_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1962_lookup i)

theorem block1963_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 190 (285 + i.val) = some (values1963[i.val]'(by rw [values1963_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row190_lookup _).trans (OriginalRow227TriangleLookupRow190.block1963_lookup i)

theorem block1963_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 190 (285 + i.val) = (values1963[i.val]'(by rw [values1963_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1963_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1960_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1960_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1961_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1961_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1962_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1962_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1963_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190.block1963_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190
