import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow234

theorem block2092_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 234 (233 + i.val) = some (values2092[i.val]'(by rw [values2092_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row234_lookup _).trans (OriginalRow227TriangleLookupRow234.block2092_lookup i)

theorem block2092_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 234 (233 + i.val) = (values2092[i.val]'(by rw [values2092_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2092_lookup i)

theorem block2093_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 234 (265 + i.val) = some (values2093[i.val]'(by rw [values2093_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row234_lookup _).trans (OriginalRow227TriangleLookupRow234.block2093_lookup i)

theorem block2093_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 234 (265 + i.val) = (values2093[i.val]'(by rw [values2093_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2093_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234.block2092_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234.block2092_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234.block2093_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234.block2093_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234
