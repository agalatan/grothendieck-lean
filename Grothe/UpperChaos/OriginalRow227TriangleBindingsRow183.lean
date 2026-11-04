import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow183

theorem block1927_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 183 (182 + i.val) = some (values1927[i.val]'(by rw [values1927_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row183_lookup _).trans (OriginalRow227TriangleLookupRow183.block1927_lookup i)

theorem block1927_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 183 (182 + i.val) = (values1927[i.val]'(by rw [values1927_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1927_lookup i)

theorem block1928_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 183 (214 + i.val) = some (values1928[i.val]'(by rw [values1928_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row183_lookup _).trans (OriginalRow227TriangleLookupRow183.block1928_lookup i)

theorem block1928_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 183 (214 + i.val) = (values1928[i.val]'(by rw [values1928_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1928_lookup i)

theorem block1929_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 183 (246 + i.val) = some (values1929[i.val]'(by rw [values1929_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row183_lookup _).trans (OriginalRow227TriangleLookupRow183.block1929_lookup i)

theorem block1929_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 183 (246 + i.val) = (values1929[i.val]'(by rw [values1929_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1929_lookup i)

theorem block1930_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 183 (278 + i.val) = some (values1930[i.val]'(by rw [values1930_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row183_lookup _).trans (OriginalRow227TriangleLookupRow183.block1930_lookup i)

theorem block1930_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 183 (278 + i.val) = (values1930[i.val]'(by rw [values1930_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1930_lookup i)

theorem block1931_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 183 (310 + i.val) = some (values1931[i.val]'(by rw [values1931_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row183_lookup _).trans (OriginalRow227TriangleLookupRow183.block1931_lookup i)

theorem block1931_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 183 (310 + i.val) = (values1931[i.val]'(by rw [values1931_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1931_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1927_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1927_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1928_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1928_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1929_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1929_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1930_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1930_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1931_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183.block1931_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183
