import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow055

theorem block0799_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (54 + i.val) = some (values0799[i.val]'(by rw [values0799_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0799_lookup i)

theorem block0799_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (54 + i.val) = (values0799[i.val]'(by rw [values0799_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0799_lookup i)

theorem block0800_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (86 + i.val) = some (values0800[i.val]'(by rw [values0800_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0800_lookup i)

theorem block0800_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (86 + i.val) = (values0800[i.val]'(by rw [values0800_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0800_lookup i)

theorem block0801_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (118 + i.val) = some (values0801[i.val]'(by rw [values0801_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0801_lookup i)

theorem block0801_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (118 + i.val) = (values0801[i.val]'(by rw [values0801_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0801_lookup i)

theorem block0802_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (150 + i.val) = some (values0802[i.val]'(by rw [values0802_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0802_lookup i)

theorem block0802_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (150 + i.val) = (values0802[i.val]'(by rw [values0802_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0802_lookup i)

theorem block0803_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (182 + i.val) = some (values0803[i.val]'(by rw [values0803_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0803_lookup i)

theorem block0803_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (182 + i.val) = (values0803[i.val]'(by rw [values0803_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0803_lookup i)

theorem block0804_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (214 + i.val) = some (values0804[i.val]'(by rw [values0804_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0804_lookup i)

theorem block0804_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (214 + i.val) = (values0804[i.val]'(by rw [values0804_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0804_lookup i)

theorem block0805_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (246 + i.val) = some (values0805[i.val]'(by rw [values0805_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0805_lookup i)

theorem block0805_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (246 + i.val) = (values0805[i.val]'(by rw [values0805_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0805_lookup i)

theorem block0806_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (278 + i.val) = some (values0806[i.val]'(by rw [values0806_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0806_lookup i)

theorem block0806_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (278 + i.val) = (values0806[i.val]'(by rw [values0806_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0806_lookup i)

theorem block0807_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (310 + i.val) = some (values0807[i.val]'(by rw [values0807_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0807_lookup i)

theorem block0807_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (310 + i.val) = (values0807[i.val]'(by rw [values0807_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0807_lookup i)

theorem block0808_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (342 + i.val) = some (values0808[i.val]'(by rw [values0808_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0808_lookup i)

theorem block0808_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (342 + i.val) = (values0808[i.val]'(by rw [values0808_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0808_lookup i)

theorem block0809_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (374 + i.val) = some (values0809[i.val]'(by rw [values0809_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0809_lookup i)

theorem block0809_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (374 + i.val) = (values0809[i.val]'(by rw [values0809_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0809_lookup i)

theorem block0810_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 55 (406 + i.val) = some (values0810[i.val]'(by rw [values0810_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0810_lookup i)

theorem block0810_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 55 (406 + i.val) = (values0810[i.val]'(by rw [values0810_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0810_lookup i)

theorem block0811_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 55 (438 + i.val) = some (values0811[i.val]'(by rw [values0811_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row055_lookup _).trans (OriginalRow227TriangleLookupRow055.block0811_lookup i)

theorem block0811_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 55 (438 + i.val) = (values0811[i.val]'(by rw [values0811_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0811_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0799_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0799_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0800_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0800_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0801_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0801_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0802_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0802_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0803_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0803_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0804_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0804_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0805_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0805_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0806_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0806_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0807_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0807_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0808_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0808_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0809_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0809_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0810_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0810_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0811_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055.block0811_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055
