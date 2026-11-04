import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow198

theorem block1992_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 198 (197 + i.val) = some (values1992[i.val]'(by rw [values1992_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row198_lookup _).trans (OriginalRow227TriangleLookupRow198.block1992_lookup i)

theorem block1992_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 198 (197 + i.val) = (values1992[i.val]'(by rw [values1992_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1992_lookup i)

theorem block1993_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 198 (229 + i.val) = some (values1993[i.val]'(by rw [values1993_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row198_lookup _).trans (OriginalRow227TriangleLookupRow198.block1993_lookup i)

theorem block1993_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 198 (229 + i.val) = (values1993[i.val]'(by rw [values1993_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1993_lookup i)

theorem block1994_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 198 (261 + i.val) = some (values1994[i.val]'(by rw [values1994_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row198_lookup _).trans (OriginalRow227TriangleLookupRow198.block1994_lookup i)

theorem block1994_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 198 (261 + i.val) = (values1994[i.val]'(by rw [values1994_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1994_lookup i)

theorem block1995_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 198 (293 + i.val) = some (values1995[i.val]'(by rw [values1995_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row198_lookup _).trans (OriginalRow227TriangleLookupRow198.block1995_lookup i)

theorem block1995_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 198 (293 + i.val) = (values1995[i.val]'(by rw [values1995_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1995_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1992_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1992_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1993_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1993_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1994_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1994_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1995_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198.block1995_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow198
