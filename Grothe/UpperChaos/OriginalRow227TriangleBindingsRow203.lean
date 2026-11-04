import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow203

theorem block2012_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 203 (202 + i.val) = some (values2012[i.val]'(by rw [values2012_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row203_lookup _).trans (OriginalRow227TriangleLookupRow203.block2012_lookup i)

theorem block2012_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 203 (202 + i.val) = (values2012[i.val]'(by rw [values2012_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2012_lookup i)

theorem block2013_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 203 (234 + i.val) = some (values2013[i.val]'(by rw [values2013_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row203_lookup _).trans (OriginalRow227TriangleLookupRow203.block2013_lookup i)

theorem block2013_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 203 (234 + i.val) = (values2013[i.val]'(by rw [values2013_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2013_lookup i)

theorem block2014_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 203 (266 + i.val) = some (values2014[i.val]'(by rw [values2014_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row203_lookup _).trans (OriginalRow227TriangleLookupRow203.block2014_lookup i)

theorem block2014_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 203 (266 + i.val) = (values2014[i.val]'(by rw [values2014_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2014_lookup i)

theorem block2015_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 203 (298 + i.val) = some (values2015[i.val]'(by rw [values2015_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row203_lookup _).trans (OriginalRow227TriangleLookupRow203.block2015_lookup i)

theorem block2015_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 203 (298 + i.val) = (values2015[i.val]'(by rw [values2015_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2015_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2012_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2012_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2013_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2013_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2014_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2014_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2015_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203.block2015_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203
