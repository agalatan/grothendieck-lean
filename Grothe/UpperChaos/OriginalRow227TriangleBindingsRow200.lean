import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow200

theorem block2000_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 200 (199 + i.val) = some (values2000[i.val]'(by rw [values2000_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row200_lookup _).trans (OriginalRow227TriangleLookupRow200.block2000_lookup i)

theorem block2000_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 200 (199 + i.val) = (values2000[i.val]'(by rw [values2000_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2000_lookup i)

theorem block2001_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 200 (231 + i.val) = some (values2001[i.val]'(by rw [values2001_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row200_lookup _).trans (OriginalRow227TriangleLookupRow200.block2001_lookup i)

theorem block2001_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 200 (231 + i.val) = (values2001[i.val]'(by rw [values2001_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2001_lookup i)

theorem block2002_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 200 (263 + i.val) = some (values2002[i.val]'(by rw [values2002_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row200_lookup _).trans (OriginalRow227TriangleLookupRow200.block2002_lookup i)

theorem block2002_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 200 (263 + i.val) = (values2002[i.val]'(by rw [values2002_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2002_lookup i)

theorem block2003_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 200 (295 + i.val) = some (values2003[i.val]'(by rw [values2003_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row200_lookup _).trans (OriginalRow227TriangleLookupRow200.block2003_lookup i)

theorem block2003_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 200 (295 + i.val) = (values2003[i.val]'(by rw [values2003_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block2003_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2000_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2000_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2001_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2001_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2002_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2002_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2003_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200.block2003_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow200
