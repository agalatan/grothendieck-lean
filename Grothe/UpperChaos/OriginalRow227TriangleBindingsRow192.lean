import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow192

theorem block1968_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 192 (191 + i.val) = some (values1968[i.val]'(by rw [values1968_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row192_lookup _).trans (OriginalRow227TriangleLookupRow192.block1968_lookup i)

theorem block1968_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 192 (191 + i.val) = (values1968[i.val]'(by rw [values1968_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1968_lookup i)

theorem block1969_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 192 (223 + i.val) = some (values1969[i.val]'(by rw [values1969_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row192_lookup _).trans (OriginalRow227TriangleLookupRow192.block1969_lookup i)

theorem block1969_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 192 (223 + i.val) = (values1969[i.val]'(by rw [values1969_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1969_lookup i)

theorem block1970_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 192 (255 + i.val) = some (values1970[i.val]'(by rw [values1970_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row192_lookup _).trans (OriginalRow227TriangleLookupRow192.block1970_lookup i)

theorem block1970_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 192 (255 + i.val) = (values1970[i.val]'(by rw [values1970_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1970_lookup i)

theorem block1971_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 192 (287 + i.val) = some (values1971[i.val]'(by rw [values1971_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row192_lookup _).trans (OriginalRow227TriangleLookupRow192.block1971_lookup i)

theorem block1971_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 192 (287 + i.val) = (values1971[i.val]'(by rw [values1971_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1971_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1968_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1968_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1969_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1969_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1970_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1970_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1971_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192.block1971_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192
