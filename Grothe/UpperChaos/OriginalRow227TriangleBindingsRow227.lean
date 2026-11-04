import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow227

theorem block2078_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 227 (226 + i.val) = some (values2078[i.val]'(by rw [values2078_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row227_lookup _).trans (OriginalRow227TriangleLookupRow227.block2078_lookup i)

theorem block2078_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 227 (226 + i.val) = (values2078[i.val]'(by rw [values2078_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2078_lookup i)

theorem block2079_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 227 (258 + i.val) = some (values2079[i.val]'(by rw [values2079_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row227_lookup _).trans (OriginalRow227TriangleLookupRow227.block2079_lookup i)

theorem block2079_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 227 (258 + i.val) = (values2079[i.val]'(by rw [values2079_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2079_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227.block2078_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227.block2078_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227.block2079_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227.block2079_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227
