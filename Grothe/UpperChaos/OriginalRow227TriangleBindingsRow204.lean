import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow204

theorem block2016_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 204 (203 + i.val) = some (values2016[i.val]'(by rw [values2016_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row204_lookup _).trans (OriginalRow227TriangleLookupRow204.block2016_lookup i)

theorem block2016_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 204 (203 + i.val) = (values2016[i.val]'(by rw [values2016_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2016_lookup i)

theorem block2017_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 204 (235 + i.val) = some (values2017[i.val]'(by rw [values2017_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row204_lookup _).trans (OriginalRow227TriangleLookupRow204.block2017_lookup i)

theorem block2017_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 204 (235 + i.val) = (values2017[i.val]'(by rw [values2017_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2017_lookup i)

theorem block2018_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 204 (267 + i.val) = some (values2018[i.val]'(by rw [values2018_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row204_lookup _).trans (OriginalRow227TriangleLookupRow204.block2018_lookup i)

theorem block2018_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 204 (267 + i.val) = (values2018[i.val]'(by rw [values2018_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2018_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204.block2016_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204.block2016_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204.block2017_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204.block2017_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204.block2018_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204.block2018_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204
