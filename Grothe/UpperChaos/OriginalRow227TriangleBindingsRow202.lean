import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow202

theorem block2008_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 202 (201 + i.val) = some (values2008[i.val]'(by rw [values2008_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row202_lookup _).trans (OriginalRow227TriangleLookupRow202.block2008_lookup i)

theorem block2008_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 202 (201 + i.val) = (values2008[i.val]'(by rw [values2008_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2008_lookup i)

theorem block2009_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 202 (233 + i.val) = some (values2009[i.val]'(by rw [values2009_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row202_lookup _).trans (OriginalRow227TriangleLookupRow202.block2009_lookup i)

theorem block2009_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 202 (233 + i.val) = (values2009[i.val]'(by rw [values2009_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2009_lookup i)

theorem block2010_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 202 (265 + i.val) = some (values2010[i.val]'(by rw [values2010_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row202_lookup _).trans (OriginalRow227TriangleLookupRow202.block2010_lookup i)

theorem block2010_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 202 (265 + i.val) = (values2010[i.val]'(by rw [values2010_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2010_lookup i)

theorem block2011_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 202 (297 + i.val) = some (values2011[i.val]'(by rw [values2011_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row202_lookup _).trans (OriginalRow227TriangleLookupRow202.block2011_lookup i)

theorem block2011_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 202 (297 + i.val) = (values2011[i.val]'(by rw [values2011_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2011_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2008_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2008_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2009_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2009_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2010_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2010_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2011_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202.block2011_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow202
