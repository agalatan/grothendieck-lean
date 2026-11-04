import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow035

theorem block0530_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (34 + i.val) = some (values0530[i.val]'(by rw [values0530_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0530_lookup i)

theorem block0530_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (34 + i.val) = (values0530[i.val]'(by rw [values0530_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0530_lookup i)

theorem block0531_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (66 + i.val) = some (values0531[i.val]'(by rw [values0531_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0531_lookup i)

theorem block0531_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (66 + i.val) = (values0531[i.val]'(by rw [values0531_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0531_lookup i)

theorem block0532_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (98 + i.val) = some (values0532[i.val]'(by rw [values0532_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0532_lookup i)

theorem block0532_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (98 + i.val) = (values0532[i.val]'(by rw [values0532_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0532_lookup i)

theorem block0533_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (130 + i.val) = some (values0533[i.val]'(by rw [values0533_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0533_lookup i)

theorem block0533_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (130 + i.val) = (values0533[i.val]'(by rw [values0533_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0533_lookup i)

theorem block0534_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (162 + i.val) = some (values0534[i.val]'(by rw [values0534_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0534_lookup i)

theorem block0534_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (162 + i.val) = (values0534[i.val]'(by rw [values0534_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0534_lookup i)

theorem block0535_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (194 + i.val) = some (values0535[i.val]'(by rw [values0535_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0535_lookup i)

theorem block0535_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (194 + i.val) = (values0535[i.val]'(by rw [values0535_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0535_lookup i)

theorem block0536_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (226 + i.val) = some (values0536[i.val]'(by rw [values0536_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0536_lookup i)

theorem block0536_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (226 + i.val) = (values0536[i.val]'(by rw [values0536_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0536_lookup i)

theorem block0537_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (258 + i.val) = some (values0537[i.val]'(by rw [values0537_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0537_lookup i)

theorem block0537_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (258 + i.val) = (values0537[i.val]'(by rw [values0537_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0537_lookup i)

theorem block0538_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (290 + i.val) = some (values0538[i.val]'(by rw [values0538_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0538_lookup i)

theorem block0538_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (290 + i.val) = (values0538[i.val]'(by rw [values0538_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0538_lookup i)

theorem block0539_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (322 + i.val) = some (values0539[i.val]'(by rw [values0539_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0539_lookup i)

theorem block0539_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (322 + i.val) = (values0539[i.val]'(by rw [values0539_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0539_lookup i)

theorem block0540_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (354 + i.val) = some (values0540[i.val]'(by rw [values0540_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0540_lookup i)

theorem block0540_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (354 + i.val) = (values0540[i.val]'(by rw [values0540_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0540_lookup i)

theorem block0541_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (386 + i.val) = some (values0541[i.val]'(by rw [values0541_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0541_lookup i)

theorem block0541_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (386 + i.val) = (values0541[i.val]'(by rw [values0541_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0541_lookup i)

theorem block0542_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 35 (418 + i.val) = some (values0542[i.val]'(by rw [values0542_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0542_lookup i)

theorem block0542_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 35 (418 + i.val) = (values0542[i.val]'(by rw [values0542_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0542_lookup i)

theorem block0543_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 35 (450 + i.val) = some (values0543[i.val]'(by rw [values0543_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row035_lookup _).trans (OriginalRow227TriangleLookupRow035.block0543_lookup i)

theorem block0543_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 35 (450 + i.val) = (values0543[i.val]'(by rw [values0543_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0543_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0530_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0530_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0531_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0531_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0532_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0532_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0533_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0533_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0534_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0534_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0535_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0535_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0536_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0536_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0537_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0537_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0538_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0538_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0539_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0539_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0540_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0540_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0541_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0541_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0542_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0542_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0543_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035.block0543_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035
