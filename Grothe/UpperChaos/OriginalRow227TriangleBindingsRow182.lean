import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow182

theorem block1922_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 182 (181 + i.val) = some (values1922[i.val]'(by rw [values1922_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row182_lookup _).trans (OriginalRow227TriangleLookupRow182.block1922_lookup i)

theorem block1922_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 182 (181 + i.val) = (values1922[i.val]'(by rw [values1922_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1922_lookup i)

theorem block1923_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 182 (213 + i.val) = some (values1923[i.val]'(by rw [values1923_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row182_lookup _).trans (OriginalRow227TriangleLookupRow182.block1923_lookup i)

theorem block1923_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 182 (213 + i.val) = (values1923[i.val]'(by rw [values1923_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1923_lookup i)

theorem block1924_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 182 (245 + i.val) = some (values1924[i.val]'(by rw [values1924_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row182_lookup _).trans (OriginalRow227TriangleLookupRow182.block1924_lookup i)

theorem block1924_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 182 (245 + i.val) = (values1924[i.val]'(by rw [values1924_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1924_lookup i)

theorem block1925_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 182 (277 + i.val) = some (values1925[i.val]'(by rw [values1925_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row182_lookup _).trans (OriginalRow227TriangleLookupRow182.block1925_lookup i)

theorem block1925_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 182 (277 + i.val) = (values1925[i.val]'(by rw [values1925_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1925_lookup i)

theorem block1926_lookup (i : Fin 11) :
    OriginalRow227TriangleLookup.lookup 182 (309 + i.val) = some (values1926[i.val]'(by rw [values1926_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row182_lookup _).trans (OriginalRow227TriangleLookupRow182.block1926_lookup i)

theorem block1926_value (i : Fin 11) :
    OriginalRow227TriangleLookup.T 182 (309 + i.val) = (values1926[i.val]'(by rw [values1926_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1926_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1922_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1922_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1923_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1923_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1924_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1924_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1925_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1925_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1926_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182.block1926_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182
