import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow034

theorem block0516_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (33 + i.val) = some (values0516[i.val]'(by rw [values0516_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0516_lookup i)

theorem block0516_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (33 + i.val) = (values0516[i.val]'(by rw [values0516_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0516_lookup i)

theorem block0517_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (65 + i.val) = some (values0517[i.val]'(by rw [values0517_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0517_lookup i)

theorem block0517_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (65 + i.val) = (values0517[i.val]'(by rw [values0517_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0517_lookup i)

theorem block0518_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (97 + i.val) = some (values0518[i.val]'(by rw [values0518_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0518_lookup i)

theorem block0518_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (97 + i.val) = (values0518[i.val]'(by rw [values0518_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0518_lookup i)

theorem block0519_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (129 + i.val) = some (values0519[i.val]'(by rw [values0519_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0519_lookup i)

theorem block0519_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (129 + i.val) = (values0519[i.val]'(by rw [values0519_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0519_lookup i)

theorem block0520_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (161 + i.val) = some (values0520[i.val]'(by rw [values0520_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0520_lookup i)

theorem block0520_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (161 + i.val) = (values0520[i.val]'(by rw [values0520_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0520_lookup i)

theorem block0521_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (193 + i.val) = some (values0521[i.val]'(by rw [values0521_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0521_lookup i)

theorem block0521_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (193 + i.val) = (values0521[i.val]'(by rw [values0521_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0521_lookup i)

theorem block0522_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (225 + i.val) = some (values0522[i.val]'(by rw [values0522_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0522_lookup i)

theorem block0522_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (225 + i.val) = (values0522[i.val]'(by rw [values0522_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0522_lookup i)

theorem block0523_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (257 + i.val) = some (values0523[i.val]'(by rw [values0523_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0523_lookup i)

theorem block0523_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (257 + i.val) = (values0523[i.val]'(by rw [values0523_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0523_lookup i)

theorem block0524_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (289 + i.val) = some (values0524[i.val]'(by rw [values0524_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0524_lookup i)

theorem block0524_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (289 + i.val) = (values0524[i.val]'(by rw [values0524_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0524_lookup i)

theorem block0525_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (321 + i.val) = some (values0525[i.val]'(by rw [values0525_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0525_lookup i)

theorem block0525_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (321 + i.val) = (values0525[i.val]'(by rw [values0525_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0525_lookup i)

theorem block0526_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (353 + i.val) = some (values0526[i.val]'(by rw [values0526_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0526_lookup i)

theorem block0526_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (353 + i.val) = (values0526[i.val]'(by rw [values0526_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0526_lookup i)

theorem block0527_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (385 + i.val) = some (values0527[i.val]'(by rw [values0527_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0527_lookup i)

theorem block0527_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (385 + i.val) = (values0527[i.val]'(by rw [values0527_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0527_lookup i)

theorem block0528_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 34 (417 + i.val) = some (values0528[i.val]'(by rw [values0528_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0528_lookup i)

theorem block0528_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 34 (417 + i.val) = (values0528[i.val]'(by rw [values0528_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0528_lookup i)

theorem block0529_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 34 (449 + i.val) = some (values0529[i.val]'(by rw [values0529_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row034_lookup _).trans (OriginalRow227TriangleLookupRow034.block0529_lookup i)

theorem block0529_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 34 (449 + i.val) = (values0529[i.val]'(by rw [values0529_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0529_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0516_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0516_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0517_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0517_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0518_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0518_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0519_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0519_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0520_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0520_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0521_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0521_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0522_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0522_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0523_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0523_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0524_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0524_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0525_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0525_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0526_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0526_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0527_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0527_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0528_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0528_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0529_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034.block0529_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034
