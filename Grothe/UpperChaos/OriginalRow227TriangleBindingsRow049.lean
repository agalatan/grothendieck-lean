import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow049

theorem block0721_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (48 + i.val) = some (values0721[i.val]'(by rw [values0721_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0721_lookup i)

theorem block0721_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (48 + i.val) = (values0721[i.val]'(by rw [values0721_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0721_lookup i)

theorem block0722_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (80 + i.val) = some (values0722[i.val]'(by rw [values0722_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0722_lookup i)

theorem block0722_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (80 + i.val) = (values0722[i.val]'(by rw [values0722_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0722_lookup i)

theorem block0723_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (112 + i.val) = some (values0723[i.val]'(by rw [values0723_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0723_lookup i)

theorem block0723_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (112 + i.val) = (values0723[i.val]'(by rw [values0723_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0723_lookup i)

theorem block0724_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (144 + i.val) = some (values0724[i.val]'(by rw [values0724_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0724_lookup i)

theorem block0724_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (144 + i.val) = (values0724[i.val]'(by rw [values0724_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0724_lookup i)

theorem block0725_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (176 + i.val) = some (values0725[i.val]'(by rw [values0725_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0725_lookup i)

theorem block0725_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (176 + i.val) = (values0725[i.val]'(by rw [values0725_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0725_lookup i)

theorem block0726_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (208 + i.val) = some (values0726[i.val]'(by rw [values0726_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0726_lookup i)

theorem block0726_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (208 + i.val) = (values0726[i.val]'(by rw [values0726_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0726_lookup i)

theorem block0727_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (240 + i.val) = some (values0727[i.val]'(by rw [values0727_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0727_lookup i)

theorem block0727_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (240 + i.val) = (values0727[i.val]'(by rw [values0727_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0727_lookup i)

theorem block0728_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (272 + i.val) = some (values0728[i.val]'(by rw [values0728_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0728_lookup i)

theorem block0728_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (272 + i.val) = (values0728[i.val]'(by rw [values0728_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0728_lookup i)

theorem block0729_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (304 + i.val) = some (values0729[i.val]'(by rw [values0729_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0729_lookup i)

theorem block0729_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (304 + i.val) = (values0729[i.val]'(by rw [values0729_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0729_lookup i)

theorem block0730_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (336 + i.val) = some (values0730[i.val]'(by rw [values0730_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0730_lookup i)

theorem block0730_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (336 + i.val) = (values0730[i.val]'(by rw [values0730_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0730_lookup i)

theorem block0731_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (368 + i.val) = some (values0731[i.val]'(by rw [values0731_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0731_lookup i)

theorem block0731_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (368 + i.val) = (values0731[i.val]'(by rw [values0731_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0731_lookup i)

theorem block0732_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 49 (400 + i.val) = some (values0732[i.val]'(by rw [values0732_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0732_lookup i)

theorem block0732_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 49 (400 + i.val) = (values0732[i.val]'(by rw [values0732_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0732_lookup i)

theorem block0733_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 49 (432 + i.val) = some (values0733[i.val]'(by rw [values0733_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row049_lookup _).trans (OriginalRow227TriangleLookupRow049.block0733_lookup i)

theorem block0733_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 49 (432 + i.val) = (values0733[i.val]'(by rw [values0733_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0733_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0721_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0721_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0722_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0722_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0723_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0723_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0724_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0724_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0725_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0725_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0726_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0726_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0727_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0727_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0728_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0728_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0729_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0729_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0730_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0730_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0731_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0731_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0732_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0732_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0733_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049.block0733_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049
