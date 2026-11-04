import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow012

theorem block0192_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (11 + i.val) = some (values0192[i.val]'(by rw [values0192_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0192_lookup i)

theorem block0192_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (11 + i.val) = (values0192[i.val]'(by rw [values0192_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0192_lookup i)

theorem block0193_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (43 + i.val) = some (values0193[i.val]'(by rw [values0193_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0193_lookup i)

theorem block0193_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (43 + i.val) = (values0193[i.val]'(by rw [values0193_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0193_lookup i)

theorem block0194_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (75 + i.val) = some (values0194[i.val]'(by rw [values0194_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0194_lookup i)

theorem block0194_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (75 + i.val) = (values0194[i.val]'(by rw [values0194_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0194_lookup i)

theorem block0195_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (107 + i.val) = some (values0195[i.val]'(by rw [values0195_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0195_lookup i)

theorem block0195_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (107 + i.val) = (values0195[i.val]'(by rw [values0195_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0195_lookup i)

theorem block0196_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (139 + i.val) = some (values0196[i.val]'(by rw [values0196_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0196_lookup i)

theorem block0196_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (139 + i.val) = (values0196[i.val]'(by rw [values0196_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0196_lookup i)

theorem block0197_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (171 + i.val) = some (values0197[i.val]'(by rw [values0197_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0197_lookup i)

theorem block0197_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (171 + i.val) = (values0197[i.val]'(by rw [values0197_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0197_lookup i)

theorem block0198_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (203 + i.val) = some (values0198[i.val]'(by rw [values0198_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0198_lookup i)

theorem block0198_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (203 + i.val) = (values0198[i.val]'(by rw [values0198_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0198_lookup i)

theorem block0199_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (235 + i.val) = some (values0199[i.val]'(by rw [values0199_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0199_lookup i)

theorem block0199_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (235 + i.val) = (values0199[i.val]'(by rw [values0199_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0199_lookup i)

theorem block0200_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (267 + i.val) = some (values0200[i.val]'(by rw [values0200_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0200_lookup i)

theorem block0200_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (267 + i.val) = (values0200[i.val]'(by rw [values0200_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0200_lookup i)

theorem block0201_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (299 + i.val) = some (values0201[i.val]'(by rw [values0201_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0201_lookup i)

theorem block0201_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (299 + i.val) = (values0201[i.val]'(by rw [values0201_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0201_lookup i)

theorem block0202_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (331 + i.val) = some (values0202[i.val]'(by rw [values0202_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0202_lookup i)

theorem block0202_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (331 + i.val) = (values0202[i.val]'(by rw [values0202_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0202_lookup i)

theorem block0203_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (363 + i.val) = some (values0203[i.val]'(by rw [values0203_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0203_lookup i)

theorem block0203_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (363 + i.val) = (values0203[i.val]'(by rw [values0203_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0203_lookup i)

theorem block0204_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (395 + i.val) = some (values0204[i.val]'(by rw [values0204_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0204_lookup i)

theorem block0204_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (395 + i.val) = (values0204[i.val]'(by rw [values0204_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0204_lookup i)

theorem block0205_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 12 (427 + i.val) = some (values0205[i.val]'(by rw [values0205_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0205_lookup i)

theorem block0205_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 12 (427 + i.val) = (values0205[i.val]'(by rw [values0205_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0205_lookup i)

theorem block0206_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 12 (459 + i.val) = some (values0206[i.val]'(by rw [values0206_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row012_lookup _).trans (OriginalRow227TriangleLookupRow012.block0206_lookup i)

theorem block0206_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 12 (459 + i.val) = (values0206[i.val]'(by rw [values0206_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0206_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0192_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0192_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0193_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0193_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0194_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0194_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0195_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0195_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0196_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0196_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0197_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0197_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0198_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0198_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0199_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0199_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0200_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0200_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0201_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0201_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0202_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0202_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0203_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0203_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0204_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0204_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0205_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0205_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0206_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012.block0206_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012
