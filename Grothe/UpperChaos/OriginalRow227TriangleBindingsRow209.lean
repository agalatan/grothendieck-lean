import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow209

theorem block2031_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 209 (208 + i.val) = some (values2031[i.val]'(by rw [values2031_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row209_lookup _).trans (OriginalRow227TriangleLookupRow209.block2031_lookup i)

theorem block2031_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 209 (208 + i.val) = (values2031[i.val]'(by rw [values2031_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2031_lookup i)

theorem block2032_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 209 (240 + i.val) = some (values2032[i.val]'(by rw [values2032_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row209_lookup _).trans (OriginalRow227TriangleLookupRow209.block2032_lookup i)

theorem block2032_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 209 (240 + i.val) = (values2032[i.val]'(by rw [values2032_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2032_lookup i)

theorem block2033_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 209 (272 + i.val) = some (values2033[i.val]'(by rw [values2033_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row209_lookup _).trans (OriginalRow227TriangleLookupRow209.block2033_lookup i)

theorem block2033_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 209 (272 + i.val) = (values2033[i.val]'(by rw [values2033_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2033_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209.block2031_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209.block2031_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209.block2032_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209.block2032_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209.block2033_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209.block2033_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow209
