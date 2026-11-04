import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow170

theorem block1860_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 170 (169 + i.val) = some (values1860[i.val]'(by rw [values1860_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row170_lookup _).trans (OriginalRow227TriangleLookupRow170.block1860_lookup i)

theorem block1860_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 170 (169 + i.val) = (values1860[i.val]'(by rw [values1860_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1860_lookup i)

theorem block1861_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 170 (201 + i.val) = some (values1861[i.val]'(by rw [values1861_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row170_lookup _).trans (OriginalRow227TriangleLookupRow170.block1861_lookup i)

theorem block1861_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 170 (201 + i.val) = (values1861[i.val]'(by rw [values1861_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1861_lookup i)

theorem block1862_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 170 (233 + i.val) = some (values1862[i.val]'(by rw [values1862_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row170_lookup _).trans (OriginalRow227TriangleLookupRow170.block1862_lookup i)

theorem block1862_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 170 (233 + i.val) = (values1862[i.val]'(by rw [values1862_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1862_lookup i)

theorem block1863_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 170 (265 + i.val) = some (values1863[i.val]'(by rw [values1863_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row170_lookup _).trans (OriginalRow227TriangleLookupRow170.block1863_lookup i)

theorem block1863_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 170 (265 + i.val) = (values1863[i.val]'(by rw [values1863_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1863_lookup i)

theorem block1864_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 170 (297 + i.val) = some (values1864[i.val]'(by rw [values1864_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row170_lookup _).trans (OriginalRow227TriangleLookupRow170.block1864_lookup i)

theorem block1864_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 170 (297 + i.val) = (values1864[i.val]'(by rw [values1864_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1864_lookup i)

theorem block1865_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 170 (329 + i.val) = some (values1865[i.val]'(by rw [values1865_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row170_lookup _).trans (OriginalRow227TriangleLookupRow170.block1865_lookup i)

theorem block1865_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 170 (329 + i.val) = (values1865[i.val]'(by rw [values1865_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1865_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1860_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1860_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1861_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1861_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1862_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1862_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1863_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1863_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1864_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1864_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1865_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170.block1865_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170
