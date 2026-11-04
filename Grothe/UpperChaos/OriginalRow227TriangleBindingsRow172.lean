import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow172

theorem block1872_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 172 (171 + i.val) = some (values1872[i.val]'(by rw [values1872_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row172_lookup _).trans (OriginalRow227TriangleLookupRow172.block1872_lookup i)

theorem block1872_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 172 (171 + i.val) = (values1872[i.val]'(by rw [values1872_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1872_lookup i)

theorem block1873_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 172 (203 + i.val) = some (values1873[i.val]'(by rw [values1873_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row172_lookup _).trans (OriginalRow227TriangleLookupRow172.block1873_lookup i)

theorem block1873_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 172 (203 + i.val) = (values1873[i.val]'(by rw [values1873_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1873_lookup i)

theorem block1874_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 172 (235 + i.val) = some (values1874[i.val]'(by rw [values1874_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row172_lookup _).trans (OriginalRow227TriangleLookupRow172.block1874_lookup i)

theorem block1874_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 172 (235 + i.val) = (values1874[i.val]'(by rw [values1874_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1874_lookup i)

theorem block1875_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 172 (267 + i.val) = some (values1875[i.val]'(by rw [values1875_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row172_lookup _).trans (OriginalRow227TriangleLookupRow172.block1875_lookup i)

theorem block1875_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 172 (267 + i.val) = (values1875[i.val]'(by rw [values1875_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1875_lookup i)

theorem block1876_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 172 (299 + i.val) = some (values1876[i.val]'(by rw [values1876_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row172_lookup _).trans (OriginalRow227TriangleLookupRow172.block1876_lookup i)

theorem block1876_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 172 (299 + i.val) = (values1876[i.val]'(by rw [values1876_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1876_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1872_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1872_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1873_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1873_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1874_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1874_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1875_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1875_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1876_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172.block1876_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172
