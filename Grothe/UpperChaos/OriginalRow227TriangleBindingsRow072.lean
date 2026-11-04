import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow072

theorem block1008_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (71 + i.val) = some (values1008[i.val]'(by rw [values1008_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1008_lookup i)

theorem block1008_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (71 + i.val) = (values1008[i.val]'(by rw [values1008_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1008_lookup i)

theorem block1009_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (103 + i.val) = some (values1009[i.val]'(by rw [values1009_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1009_lookup i)

theorem block1009_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (103 + i.val) = (values1009[i.val]'(by rw [values1009_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1009_lookup i)

theorem block1010_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (135 + i.val) = some (values1010[i.val]'(by rw [values1010_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1010_lookup i)

theorem block1010_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (135 + i.val) = (values1010[i.val]'(by rw [values1010_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1010_lookup i)

theorem block1011_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (167 + i.val) = some (values1011[i.val]'(by rw [values1011_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1011_lookup i)

theorem block1011_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (167 + i.val) = (values1011[i.val]'(by rw [values1011_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1011_lookup i)

theorem block1012_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (199 + i.val) = some (values1012[i.val]'(by rw [values1012_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1012_lookup i)

theorem block1012_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (199 + i.val) = (values1012[i.val]'(by rw [values1012_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1012_lookup i)

theorem block1013_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (231 + i.val) = some (values1013[i.val]'(by rw [values1013_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1013_lookup i)

theorem block1013_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (231 + i.val) = (values1013[i.val]'(by rw [values1013_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1013_lookup i)

theorem block1014_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (263 + i.val) = some (values1014[i.val]'(by rw [values1014_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1014_lookup i)

theorem block1014_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (263 + i.val) = (values1014[i.val]'(by rw [values1014_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1014_lookup i)

theorem block1015_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (295 + i.val) = some (values1015[i.val]'(by rw [values1015_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1015_lookup i)

theorem block1015_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (295 + i.val) = (values1015[i.val]'(by rw [values1015_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1015_lookup i)

theorem block1016_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (327 + i.val) = some (values1016[i.val]'(by rw [values1016_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1016_lookup i)

theorem block1016_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (327 + i.val) = (values1016[i.val]'(by rw [values1016_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1016_lookup i)

theorem block1017_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (359 + i.val) = some (values1017[i.val]'(by rw [values1017_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1017_lookup i)

theorem block1017_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (359 + i.val) = (values1017[i.val]'(by rw [values1017_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1017_lookup i)

theorem block1018_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 72 (391 + i.val) = some (values1018[i.val]'(by rw [values1018_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1018_lookup i)

theorem block1018_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 72 (391 + i.val) = (values1018[i.val]'(by rw [values1018_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1018_lookup i)

theorem block1019_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 72 (423 + i.val) = some (values1019[i.val]'(by rw [values1019_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row072_lookup _).trans (OriginalRow227TriangleLookupRow072.block1019_lookup i)

theorem block1019_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 72 (423 + i.val) = (values1019[i.val]'(by rw [values1019_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1019_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1008_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1008_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1009_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1009_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1010_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1010_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1011_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1011_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1012_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1012_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1013_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1013_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1014_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1014_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1015_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1015_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1016_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1016_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1017_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1017_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1018_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1018_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1019_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072.block1019_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072
