import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow151

theorem block1741_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 151 (150 + i.val) = some (values1741[i.val]'(by rw [values1741_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1741_lookup i)

theorem block1741_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 151 (150 + i.val) = (values1741[i.val]'(by rw [values1741_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1741_lookup i)

theorem block1742_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 151 (182 + i.val) = some (values1742[i.val]'(by rw [values1742_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1742_lookup i)

theorem block1742_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 151 (182 + i.val) = (values1742[i.val]'(by rw [values1742_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1742_lookup i)

theorem block1743_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 151 (214 + i.val) = some (values1743[i.val]'(by rw [values1743_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1743_lookup i)

theorem block1743_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 151 (214 + i.val) = (values1743[i.val]'(by rw [values1743_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1743_lookup i)

theorem block1744_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 151 (246 + i.val) = some (values1744[i.val]'(by rw [values1744_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1744_lookup i)

theorem block1744_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 151 (246 + i.val) = (values1744[i.val]'(by rw [values1744_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1744_lookup i)

theorem block1745_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 151 (278 + i.val) = some (values1745[i.val]'(by rw [values1745_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1745_lookup i)

theorem block1745_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 151 (278 + i.val) = (values1745[i.val]'(by rw [values1745_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1745_lookup i)

theorem block1746_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 151 (310 + i.val) = some (values1746[i.val]'(by rw [values1746_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1746_lookup i)

theorem block1746_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 151 (310 + i.val) = (values1746[i.val]'(by rw [values1746_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1746_lookup i)

theorem block1747_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 151 (342 + i.val) = some (values1747[i.val]'(by rw [values1747_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row151_lookup _).trans (OriginalRow227TriangleLookupRow151.block1747_lookup i)

theorem block1747_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 151 (342 + i.val) = (values1747[i.val]'(by rw [values1747_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1747_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1741_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1741_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1742_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1742_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1743_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1743_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1744_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1744_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1745_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1745_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1746_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1746_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1747_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151.block1747_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151
