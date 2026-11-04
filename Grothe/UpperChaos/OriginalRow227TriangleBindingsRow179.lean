import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow179

theorem block1907_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 179 (178 + i.val) = some (values1907[i.val]'(by rw [values1907_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row179_lookup _).trans (OriginalRow227TriangleLookupRow179.block1907_lookup i)

theorem block1907_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 179 (178 + i.val) = (values1907[i.val]'(by rw [values1907_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1907_lookup i)

theorem block1908_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 179 (210 + i.val) = some (values1908[i.val]'(by rw [values1908_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row179_lookup _).trans (OriginalRow227TriangleLookupRow179.block1908_lookup i)

theorem block1908_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 179 (210 + i.val) = (values1908[i.val]'(by rw [values1908_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1908_lookup i)

theorem block1909_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 179 (242 + i.val) = some (values1909[i.val]'(by rw [values1909_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row179_lookup _).trans (OriginalRow227TriangleLookupRow179.block1909_lookup i)

theorem block1909_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 179 (242 + i.val) = (values1909[i.val]'(by rw [values1909_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1909_lookup i)

theorem block1910_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 179 (274 + i.val) = some (values1910[i.val]'(by rw [values1910_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row179_lookup _).trans (OriginalRow227TriangleLookupRow179.block1910_lookup i)

theorem block1910_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 179 (274 + i.val) = (values1910[i.val]'(by rw [values1910_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1910_lookup i)

theorem block1911_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 179 (306 + i.val) = some (values1911[i.val]'(by rw [values1911_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row179_lookup _).trans (OriginalRow227TriangleLookupRow179.block1911_lookup i)

theorem block1911_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 179 (306 + i.val) = (values1911[i.val]'(by rw [values1911_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1911_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1907_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1907_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1908_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1908_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1909_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1909_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1910_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1910_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1911_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179.block1911_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179
