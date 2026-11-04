import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow036

theorem block0544_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (35 + i.val) = some (values0544[i.val]'(by rw [values0544_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0544_lookup i)

theorem block0544_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (35 + i.val) = (values0544[i.val]'(by rw [values0544_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0544_lookup i)

theorem block0545_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (67 + i.val) = some (values0545[i.val]'(by rw [values0545_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0545_lookup i)

theorem block0545_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (67 + i.val) = (values0545[i.val]'(by rw [values0545_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0545_lookup i)

theorem block0546_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (99 + i.val) = some (values0546[i.val]'(by rw [values0546_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0546_lookup i)

theorem block0546_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (99 + i.val) = (values0546[i.val]'(by rw [values0546_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0546_lookup i)

theorem block0547_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (131 + i.val) = some (values0547[i.val]'(by rw [values0547_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0547_lookup i)

theorem block0547_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (131 + i.val) = (values0547[i.val]'(by rw [values0547_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0547_lookup i)

theorem block0548_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (163 + i.val) = some (values0548[i.val]'(by rw [values0548_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0548_lookup i)

theorem block0548_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (163 + i.val) = (values0548[i.val]'(by rw [values0548_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0548_lookup i)

theorem block0549_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (195 + i.val) = some (values0549[i.val]'(by rw [values0549_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0549_lookup i)

theorem block0549_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (195 + i.val) = (values0549[i.val]'(by rw [values0549_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0549_lookup i)

theorem block0550_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (227 + i.val) = some (values0550[i.val]'(by rw [values0550_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0550_lookup i)

theorem block0550_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (227 + i.val) = (values0550[i.val]'(by rw [values0550_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0550_lookup i)

theorem block0551_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (259 + i.val) = some (values0551[i.val]'(by rw [values0551_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0551_lookup i)

theorem block0551_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (259 + i.val) = (values0551[i.val]'(by rw [values0551_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0551_lookup i)

theorem block0552_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (291 + i.val) = some (values0552[i.val]'(by rw [values0552_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0552_lookup i)

theorem block0552_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (291 + i.val) = (values0552[i.val]'(by rw [values0552_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0552_lookup i)

theorem block0553_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (323 + i.val) = some (values0553[i.val]'(by rw [values0553_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0553_lookup i)

theorem block0553_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (323 + i.val) = (values0553[i.val]'(by rw [values0553_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0553_lookup i)

theorem block0554_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (355 + i.val) = some (values0554[i.val]'(by rw [values0554_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0554_lookup i)

theorem block0554_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (355 + i.val) = (values0554[i.val]'(by rw [values0554_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0554_lookup i)

theorem block0555_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (387 + i.val) = some (values0555[i.val]'(by rw [values0555_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0555_lookup i)

theorem block0555_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (387 + i.val) = (values0555[i.val]'(by rw [values0555_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0555_lookup i)

theorem block0556_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 36 (419 + i.val) = some (values0556[i.val]'(by rw [values0556_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0556_lookup i)

theorem block0556_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 36 (419 + i.val) = (values0556[i.val]'(by rw [values0556_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0556_lookup i)

theorem block0557_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 36 (451 + i.val) = some (values0557[i.val]'(by rw [values0557_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row036_lookup _).trans (OriginalRow227TriangleLookupRow036.block0557_lookup i)

theorem block0557_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 36 (451 + i.val) = (values0557[i.val]'(by rw [values0557_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0557_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0544_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0544_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0545_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0545_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0546_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0546_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0547_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0547_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0548_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0548_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0549_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0549_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0550_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0550_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0551_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0551_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0552_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0552_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0553_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0553_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0554_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0554_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0555_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0555_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0556_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0556_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0557_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036.block0557_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036
