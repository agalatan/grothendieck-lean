import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow010

theorem block0160_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (9 + i.val) = some (values0160[i.val]'(by rw [values0160_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0160_lookup i)

theorem block0160_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (9 + i.val) = (values0160[i.val]'(by rw [values0160_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0160_lookup i)

theorem block0161_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (41 + i.val) = some (values0161[i.val]'(by rw [values0161_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0161_lookup i)

theorem block0161_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (41 + i.val) = (values0161[i.val]'(by rw [values0161_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0161_lookup i)

theorem block0162_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (73 + i.val) = some (values0162[i.val]'(by rw [values0162_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0162_lookup i)

theorem block0162_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (73 + i.val) = (values0162[i.val]'(by rw [values0162_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0162_lookup i)

theorem block0163_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (105 + i.val) = some (values0163[i.val]'(by rw [values0163_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0163_lookup i)

theorem block0163_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (105 + i.val) = (values0163[i.val]'(by rw [values0163_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0163_lookup i)

theorem block0164_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (137 + i.val) = some (values0164[i.val]'(by rw [values0164_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0164_lookup i)

theorem block0164_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (137 + i.val) = (values0164[i.val]'(by rw [values0164_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0164_lookup i)

theorem block0165_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (169 + i.val) = some (values0165[i.val]'(by rw [values0165_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0165_lookup i)

theorem block0165_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (169 + i.val) = (values0165[i.val]'(by rw [values0165_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0165_lookup i)

theorem block0166_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (201 + i.val) = some (values0166[i.val]'(by rw [values0166_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0166_lookup i)

theorem block0166_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (201 + i.val) = (values0166[i.val]'(by rw [values0166_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0166_lookup i)

theorem block0167_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (233 + i.val) = some (values0167[i.val]'(by rw [values0167_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0167_lookup i)

theorem block0167_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (233 + i.val) = (values0167[i.val]'(by rw [values0167_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0167_lookup i)

theorem block0168_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (265 + i.val) = some (values0168[i.val]'(by rw [values0168_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0168_lookup i)

theorem block0168_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (265 + i.val) = (values0168[i.val]'(by rw [values0168_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0168_lookup i)

theorem block0169_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (297 + i.val) = some (values0169[i.val]'(by rw [values0169_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0169_lookup i)

theorem block0169_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (297 + i.val) = (values0169[i.val]'(by rw [values0169_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0169_lookup i)

theorem block0170_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (329 + i.val) = some (values0170[i.val]'(by rw [values0170_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0170_lookup i)

theorem block0170_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (329 + i.val) = (values0170[i.val]'(by rw [values0170_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0170_lookup i)

theorem block0171_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (361 + i.val) = some (values0171[i.val]'(by rw [values0171_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0171_lookup i)

theorem block0171_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (361 + i.val) = (values0171[i.val]'(by rw [values0171_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0171_lookup i)

theorem block0172_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (393 + i.val) = some (values0172[i.val]'(by rw [values0172_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0172_lookup i)

theorem block0172_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (393 + i.val) = (values0172[i.val]'(by rw [values0172_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0172_lookup i)

theorem block0173_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (425 + i.val) = some (values0173[i.val]'(by rw [values0173_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0173_lookup i)

theorem block0173_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (425 + i.val) = (values0173[i.val]'(by rw [values0173_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0173_lookup i)

theorem block0174_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 10 (457 + i.val) = some (values0174[i.val]'(by rw [values0174_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0174_lookup i)

theorem block0174_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 10 (457 + i.val) = (values0174[i.val]'(by rw [values0174_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0174_lookup i)

theorem block0175_lookup (i : Fin 3) :
    OriginalRow227TriangleLookup.lookup 10 (489 + i.val) = some (values0175[i.val]'(by rw [values0175_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row010_lookup _).trans (OriginalRow227TriangleLookupRow010.block0175_lookup i)

theorem block0175_value (i : Fin 3) :
    OriginalRow227TriangleLookup.T 10 (489 + i.val) = (values0175[i.val]'(by rw [values0175_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0175_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0160_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0160_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0161_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0161_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0162_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0162_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0163_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0163_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0164_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0164_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0165_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0165_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0166_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0166_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0167_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0167_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0168_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0168_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0169_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0169_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0170_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0170_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0171_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0171_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0172_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0172_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0173_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0173_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0174_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0174_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0175_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010.block0175_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010
