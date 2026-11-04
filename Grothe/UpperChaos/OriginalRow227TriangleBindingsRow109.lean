import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow109

theorem block1401_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (108 + i.val) = some (values1401[i.val]'(by rw [values1401_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1401_lookup i)

theorem block1401_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (108 + i.val) = (values1401[i.val]'(by rw [values1401_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1401_lookup i)

theorem block1402_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (140 + i.val) = some (values1402[i.val]'(by rw [values1402_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1402_lookup i)

theorem block1402_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (140 + i.val) = (values1402[i.val]'(by rw [values1402_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1402_lookup i)

theorem block1403_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (172 + i.val) = some (values1403[i.val]'(by rw [values1403_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1403_lookup i)

theorem block1403_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (172 + i.val) = (values1403[i.val]'(by rw [values1403_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1403_lookup i)

theorem block1404_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (204 + i.val) = some (values1404[i.val]'(by rw [values1404_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1404_lookup i)

theorem block1404_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (204 + i.val) = (values1404[i.val]'(by rw [values1404_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1404_lookup i)

theorem block1405_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (236 + i.val) = some (values1405[i.val]'(by rw [values1405_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1405_lookup i)

theorem block1405_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (236 + i.val) = (values1405[i.val]'(by rw [values1405_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1405_lookup i)

theorem block1406_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (268 + i.val) = some (values1406[i.val]'(by rw [values1406_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1406_lookup i)

theorem block1406_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (268 + i.val) = (values1406[i.val]'(by rw [values1406_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1406_lookup i)

theorem block1407_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (300 + i.val) = some (values1407[i.val]'(by rw [values1407_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1407_lookup i)

theorem block1407_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (300 + i.val) = (values1407[i.val]'(by rw [values1407_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1407_lookup i)

theorem block1408_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 109 (332 + i.val) = some (values1408[i.val]'(by rw [values1408_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1408_lookup i)

theorem block1408_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 109 (332 + i.val) = (values1408[i.val]'(by rw [values1408_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1408_lookup i)

theorem block1409_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 109 (364 + i.val) = some (values1409[i.val]'(by rw [values1409_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row109_lookup _).trans (OriginalRow227TriangleLookupRow109.block1409_lookup i)

theorem block1409_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 109 (364 + i.val) = (values1409[i.val]'(by rw [values1409_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1409_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1401_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1401_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1402_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1402_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1403_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1403_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1404_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1404_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1405_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1405_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1406_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1406_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1407_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1407_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1408_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1408_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1409_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109.block1409_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109
