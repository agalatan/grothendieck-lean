import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow167

theorem block1842_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 167 (166 + i.val) = some (values1842[i.val]'(by rw [values1842_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row167_lookup _).trans (OriginalRow227TriangleLookupRow167.block1842_lookup i)

theorem block1842_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 167 (166 + i.val) = (values1842[i.val]'(by rw [values1842_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1842_lookup i)

theorem block1843_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 167 (198 + i.val) = some (values1843[i.val]'(by rw [values1843_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row167_lookup _).trans (OriginalRow227TriangleLookupRow167.block1843_lookup i)

theorem block1843_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 167 (198 + i.val) = (values1843[i.val]'(by rw [values1843_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1843_lookup i)

theorem block1844_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 167 (230 + i.val) = some (values1844[i.val]'(by rw [values1844_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row167_lookup _).trans (OriginalRow227TriangleLookupRow167.block1844_lookup i)

theorem block1844_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 167 (230 + i.val) = (values1844[i.val]'(by rw [values1844_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1844_lookup i)

theorem block1845_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 167 (262 + i.val) = some (values1845[i.val]'(by rw [values1845_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row167_lookup _).trans (OriginalRow227TriangleLookupRow167.block1845_lookup i)

theorem block1845_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 167 (262 + i.val) = (values1845[i.val]'(by rw [values1845_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1845_lookup i)

theorem block1846_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 167 (294 + i.val) = some (values1846[i.val]'(by rw [values1846_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row167_lookup _).trans (OriginalRow227TriangleLookupRow167.block1846_lookup i)

theorem block1846_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 167 (294 + i.val) = (values1846[i.val]'(by rw [values1846_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1846_lookup i)

theorem block1847_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 167 (326 + i.val) = some (values1847[i.val]'(by rw [values1847_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row167_lookup _).trans (OriginalRow227TriangleLookupRow167.block1847_lookup i)

theorem block1847_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 167 (326 + i.val) = (values1847[i.val]'(by rw [values1847_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1847_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1842_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1842_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1843_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1843_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1844_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1844_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1845_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1845_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1846_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1846_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1847_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167.block1847_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167
