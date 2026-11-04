import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow017

theorem block0267_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (16 + i.val) = some (values0267[i.val]'(by rw [values0267_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0267_lookup i)

theorem block0267_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (16 + i.val) = (values0267[i.val]'(by rw [values0267_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0267_lookup i)

theorem block0268_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (48 + i.val) = some (values0268[i.val]'(by rw [values0268_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0268_lookup i)

theorem block0268_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (48 + i.val) = (values0268[i.val]'(by rw [values0268_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0268_lookup i)

theorem block0269_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (80 + i.val) = some (values0269[i.val]'(by rw [values0269_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0269_lookup i)

theorem block0269_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (80 + i.val) = (values0269[i.val]'(by rw [values0269_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0269_lookup i)

theorem block0270_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (112 + i.val) = some (values0270[i.val]'(by rw [values0270_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0270_lookup i)

theorem block0270_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (112 + i.val) = (values0270[i.val]'(by rw [values0270_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0270_lookup i)

theorem block0271_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (144 + i.val) = some (values0271[i.val]'(by rw [values0271_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0271_lookup i)

theorem block0271_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (144 + i.val) = (values0271[i.val]'(by rw [values0271_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0271_lookup i)

theorem block0272_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (176 + i.val) = some (values0272[i.val]'(by rw [values0272_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0272_lookup i)

theorem block0272_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (176 + i.val) = (values0272[i.val]'(by rw [values0272_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0272_lookup i)

theorem block0273_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (208 + i.val) = some (values0273[i.val]'(by rw [values0273_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0273_lookup i)

theorem block0273_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (208 + i.val) = (values0273[i.val]'(by rw [values0273_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0273_lookup i)

theorem block0274_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (240 + i.val) = some (values0274[i.val]'(by rw [values0274_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0274_lookup i)

theorem block0274_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (240 + i.val) = (values0274[i.val]'(by rw [values0274_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0274_lookup i)

theorem block0275_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (272 + i.val) = some (values0275[i.val]'(by rw [values0275_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0275_lookup i)

theorem block0275_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (272 + i.val) = (values0275[i.val]'(by rw [values0275_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0275_lookup i)

theorem block0276_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (304 + i.val) = some (values0276[i.val]'(by rw [values0276_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0276_lookup i)

theorem block0276_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (304 + i.val) = (values0276[i.val]'(by rw [values0276_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0276_lookup i)

theorem block0277_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (336 + i.val) = some (values0277[i.val]'(by rw [values0277_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0277_lookup i)

theorem block0277_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (336 + i.val) = (values0277[i.val]'(by rw [values0277_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0277_lookup i)

theorem block0278_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (368 + i.val) = some (values0278[i.val]'(by rw [values0278_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0278_lookup i)

theorem block0278_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (368 + i.val) = (values0278[i.val]'(by rw [values0278_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0278_lookup i)

theorem block0279_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (400 + i.val) = some (values0279[i.val]'(by rw [values0279_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0279_lookup i)

theorem block0279_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (400 + i.val) = (values0279[i.val]'(by rw [values0279_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0279_lookup i)

theorem block0280_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 17 (432 + i.val) = some (values0280[i.val]'(by rw [values0280_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0280_lookup i)

theorem block0280_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 17 (432 + i.val) = (values0280[i.val]'(by rw [values0280_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0280_lookup i)

theorem block0281_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 17 (464 + i.val) = some (values0281[i.val]'(by rw [values0281_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row017_lookup _).trans (OriginalRow227TriangleLookupRow017.block0281_lookup i)

theorem block0281_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 17 (464 + i.val) = (values0281[i.val]'(by rw [values0281_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0281_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0267_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0267_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0268_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0268_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0269_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0269_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0270_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0270_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0271_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0271_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0272_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0272_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0273_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0273_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0274_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0274_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0275_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0275_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0276_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0276_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0277_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0277_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0278_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0278_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0279_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0279_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0280_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0280_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0281_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017.block0281_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017
