import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow073

theorem block1020_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (72 + i.val) = some (values1020[i.val]'(by rw [values1020_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1020_lookup i)

theorem block1020_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (72 + i.val) = (values1020[i.val]'(by rw [values1020_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1020_lookup i)

theorem block1021_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (104 + i.val) = some (values1021[i.val]'(by rw [values1021_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1021_lookup i)

theorem block1021_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (104 + i.val) = (values1021[i.val]'(by rw [values1021_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1021_lookup i)

theorem block1022_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (136 + i.val) = some (values1022[i.val]'(by rw [values1022_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1022_lookup i)

theorem block1022_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (136 + i.val) = (values1022[i.val]'(by rw [values1022_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1022_lookup i)

theorem block1023_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (168 + i.val) = some (values1023[i.val]'(by rw [values1023_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1023_lookup i)

theorem block1023_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (168 + i.val) = (values1023[i.val]'(by rw [values1023_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1023_lookup i)

theorem block1024_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (200 + i.val) = some (values1024[i.val]'(by rw [values1024_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1024_lookup i)

theorem block1024_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (200 + i.val) = (values1024[i.val]'(by rw [values1024_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1024_lookup i)

theorem block1025_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (232 + i.val) = some (values1025[i.val]'(by rw [values1025_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1025_lookup i)

theorem block1025_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (232 + i.val) = (values1025[i.val]'(by rw [values1025_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1025_lookup i)

theorem block1026_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (264 + i.val) = some (values1026[i.val]'(by rw [values1026_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1026_lookup i)

theorem block1026_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (264 + i.val) = (values1026[i.val]'(by rw [values1026_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1026_lookup i)

theorem block1027_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (296 + i.val) = some (values1027[i.val]'(by rw [values1027_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1027_lookup i)

theorem block1027_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (296 + i.val) = (values1027[i.val]'(by rw [values1027_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1027_lookup i)

theorem block1028_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (328 + i.val) = some (values1028[i.val]'(by rw [values1028_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1028_lookup i)

theorem block1028_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (328 + i.val) = (values1028[i.val]'(by rw [values1028_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1028_lookup i)

theorem block1029_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (360 + i.val) = some (values1029[i.val]'(by rw [values1029_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1029_lookup i)

theorem block1029_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (360 + i.val) = (values1029[i.val]'(by rw [values1029_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1029_lookup i)

theorem block1030_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 73 (392 + i.val) = some (values1030[i.val]'(by rw [values1030_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1030_lookup i)

theorem block1030_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 73 (392 + i.val) = (values1030[i.val]'(by rw [values1030_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1030_lookup i)

theorem block1031_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 73 (424 + i.val) = some (values1031[i.val]'(by rw [values1031_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row073_lookup _).trans (OriginalRow227TriangleLookupRow073.block1031_lookup i)

theorem block1031_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 73 (424 + i.val) = (values1031[i.val]'(by rw [values1031_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1031_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1020_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1020_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1021_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1021_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1022_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1022_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1023_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1023_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1024_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1024_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1025_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1025_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1026_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1026_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1027_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1027_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1028_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1028_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1029_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1029_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1030_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1030_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1031_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073.block1031_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073
