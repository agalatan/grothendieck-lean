import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow180

theorem block1912_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 180 (179 + i.val) = some (values1912[i.val]'(by rw [values1912_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row180_lookup _).trans (OriginalRow227TriangleLookupRow180.block1912_lookup i)

theorem block1912_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 180 (179 + i.val) = (values1912[i.val]'(by rw [values1912_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1912_lookup i)

theorem block1913_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 180 (211 + i.val) = some (values1913[i.val]'(by rw [values1913_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row180_lookup _).trans (OriginalRow227TriangleLookupRow180.block1913_lookup i)

theorem block1913_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 180 (211 + i.val) = (values1913[i.val]'(by rw [values1913_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1913_lookup i)

theorem block1914_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 180 (243 + i.val) = some (values1914[i.val]'(by rw [values1914_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row180_lookup _).trans (OriginalRow227TriangleLookupRow180.block1914_lookup i)

theorem block1914_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 180 (243 + i.val) = (values1914[i.val]'(by rw [values1914_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1914_lookup i)

theorem block1915_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 180 (275 + i.val) = some (values1915[i.val]'(by rw [values1915_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row180_lookup _).trans (OriginalRow227TriangleLookupRow180.block1915_lookup i)

theorem block1915_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 180 (275 + i.val) = (values1915[i.val]'(by rw [values1915_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1915_lookup i)

theorem block1916_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 180 (307 + i.val) = some (values1916[i.val]'(by rw [values1916_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row180_lookup _).trans (OriginalRow227TriangleLookupRow180.block1916_lookup i)

theorem block1916_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 180 (307 + i.val) = (values1916[i.val]'(by rw [values1916_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1916_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1912_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1912_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1913_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1913_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1914_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1914_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1915_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1915_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1916_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180.block1916_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180
