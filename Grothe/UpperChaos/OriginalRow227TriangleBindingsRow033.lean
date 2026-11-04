import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow033

theorem block0502_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (32 + i.val) = some (values0502[i.val]'(by rw [values0502_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0502_lookup i)

theorem block0502_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (32 + i.val) = (values0502[i.val]'(by rw [values0502_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0502_lookup i)

theorem block0503_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (64 + i.val) = some (values0503[i.val]'(by rw [values0503_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0503_lookup i)

theorem block0503_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (64 + i.val) = (values0503[i.val]'(by rw [values0503_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0503_lookup i)

theorem block0504_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (96 + i.val) = some (values0504[i.val]'(by rw [values0504_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0504_lookup i)

theorem block0504_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (96 + i.val) = (values0504[i.val]'(by rw [values0504_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0504_lookup i)

theorem block0505_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (128 + i.val) = some (values0505[i.val]'(by rw [values0505_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0505_lookup i)

theorem block0505_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (128 + i.val) = (values0505[i.val]'(by rw [values0505_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0505_lookup i)

theorem block0506_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (160 + i.val) = some (values0506[i.val]'(by rw [values0506_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0506_lookup i)

theorem block0506_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (160 + i.val) = (values0506[i.val]'(by rw [values0506_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0506_lookup i)

theorem block0507_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (192 + i.val) = some (values0507[i.val]'(by rw [values0507_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0507_lookup i)

theorem block0507_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (192 + i.val) = (values0507[i.val]'(by rw [values0507_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0507_lookup i)

theorem block0508_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (224 + i.val) = some (values0508[i.val]'(by rw [values0508_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0508_lookup i)

theorem block0508_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (224 + i.val) = (values0508[i.val]'(by rw [values0508_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0508_lookup i)

theorem block0509_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (256 + i.val) = some (values0509[i.val]'(by rw [values0509_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0509_lookup i)

theorem block0509_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (256 + i.val) = (values0509[i.val]'(by rw [values0509_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0509_lookup i)

theorem block0510_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (288 + i.val) = some (values0510[i.val]'(by rw [values0510_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0510_lookup i)

theorem block0510_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (288 + i.val) = (values0510[i.val]'(by rw [values0510_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0510_lookup i)

theorem block0511_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (320 + i.val) = some (values0511[i.val]'(by rw [values0511_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0511_lookup i)

theorem block0511_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (320 + i.val) = (values0511[i.val]'(by rw [values0511_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0511_lookup i)

theorem block0512_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (352 + i.val) = some (values0512[i.val]'(by rw [values0512_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0512_lookup i)

theorem block0512_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (352 + i.val) = (values0512[i.val]'(by rw [values0512_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0512_lookup i)

theorem block0513_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (384 + i.val) = some (values0513[i.val]'(by rw [values0513_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0513_lookup i)

theorem block0513_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (384 + i.val) = (values0513[i.val]'(by rw [values0513_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0513_lookup i)

theorem block0514_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 33 (416 + i.val) = some (values0514[i.val]'(by rw [values0514_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0514_lookup i)

theorem block0514_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 33 (416 + i.val) = (values0514[i.val]'(by rw [values0514_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0514_lookup i)

theorem block0515_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 33 (448 + i.val) = some (values0515[i.val]'(by rw [values0515_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row033_lookup _).trans (OriginalRow227TriangleLookupRow033.block0515_lookup i)

theorem block0515_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 33 (448 + i.val) = (values0515[i.val]'(by rw [values0515_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0515_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0502_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0502_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0503_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0503_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0504_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0504_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0505_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0505_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0506_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0506_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0507_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0507_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0508_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0508_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0509_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0509_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0510_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0510_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0511_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0511_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0512_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0512_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0513_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0513_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0514_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0514_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0515_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033.block0515_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033
