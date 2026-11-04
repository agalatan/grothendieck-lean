import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow201

theorem block2004_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 201 (200 + i.val) = some (values2004[i.val]'(by rw [values2004_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row201_lookup _).trans (OriginalRow227TriangleLookupRow201.block2004_lookup i)

theorem block2004_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 201 (200 + i.val) = (values2004[i.val]'(by rw [values2004_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2004_lookup i)

theorem block2005_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 201 (232 + i.val) = some (values2005[i.val]'(by rw [values2005_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row201_lookup _).trans (OriginalRow227TriangleLookupRow201.block2005_lookup i)

theorem block2005_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 201 (232 + i.val) = (values2005[i.val]'(by rw [values2005_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2005_lookup i)

theorem block2006_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 201 (264 + i.val) = some (values2006[i.val]'(by rw [values2006_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row201_lookup _).trans (OriginalRow227TriangleLookupRow201.block2006_lookup i)

theorem block2006_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 201 (264 + i.val) = (values2006[i.val]'(by rw [values2006_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2006_lookup i)

theorem block2007_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 201 (296 + i.val) = some (values2007[i.val]'(by rw [values2007_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row201_lookup _).trans (OriginalRow227TriangleLookupRow201.block2007_lookup i)

theorem block2007_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 201 (296 + i.val) = (values2007[i.val]'(by rw [values2007_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2007_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2004_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2004_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2005_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2005_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2006_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2006_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2007_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201.block2007_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow201
