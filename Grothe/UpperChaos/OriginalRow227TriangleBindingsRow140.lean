import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow140

theorem block1664_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 140 (139 + i.val) = some (values1664[i.val]'(by rw [values1664_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1664_lookup i)

theorem block1664_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 140 (139 + i.val) = (values1664[i.val]'(by rw [values1664_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1664_lookup i)

theorem block1665_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 140 (171 + i.val) = some (values1665[i.val]'(by rw [values1665_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1665_lookup i)

theorem block1665_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 140 (171 + i.val) = (values1665[i.val]'(by rw [values1665_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1665_lookup i)

theorem block1666_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 140 (203 + i.val) = some (values1666[i.val]'(by rw [values1666_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1666_lookup i)

theorem block1666_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 140 (203 + i.val) = (values1666[i.val]'(by rw [values1666_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1666_lookup i)

theorem block1667_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 140 (235 + i.val) = some (values1667[i.val]'(by rw [values1667_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1667_lookup i)

theorem block1667_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 140 (235 + i.val) = (values1667[i.val]'(by rw [values1667_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1667_lookup i)

theorem block1668_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 140 (267 + i.val) = some (values1668[i.val]'(by rw [values1668_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1668_lookup i)

theorem block1668_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 140 (267 + i.val) = (values1668[i.val]'(by rw [values1668_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1668_lookup i)

theorem block1669_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 140 (299 + i.val) = some (values1669[i.val]'(by rw [values1669_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1669_lookup i)

theorem block1669_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 140 (299 + i.val) = (values1669[i.val]'(by rw [values1669_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1669_lookup i)

theorem block1670_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 140 (331 + i.val) = some (values1670[i.val]'(by rw [values1670_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row140_lookup _).trans (OriginalRow227TriangleLookupRow140.block1670_lookup i)

theorem block1670_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 140 (331 + i.val) = (values1670[i.val]'(by rw [values1670_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1670_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1664_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1664_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1665_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1665_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1666_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1666_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1667_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1667_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1668_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1668_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1669_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1669_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1670_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140.block1670_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140
