import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow067

theorem block0948_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (66 + i.val) = some (values0948[i.val]'(by rw [values0948_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0948_lookup i)

theorem block0948_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (66 + i.val) = (values0948[i.val]'(by rw [values0948_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0948_lookup i)

theorem block0949_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (98 + i.val) = some (values0949[i.val]'(by rw [values0949_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0949_lookup i)

theorem block0949_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (98 + i.val) = (values0949[i.val]'(by rw [values0949_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0949_lookup i)

theorem block0950_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (130 + i.val) = some (values0950[i.val]'(by rw [values0950_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0950_lookup i)

theorem block0950_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (130 + i.val) = (values0950[i.val]'(by rw [values0950_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0950_lookup i)

theorem block0951_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (162 + i.val) = some (values0951[i.val]'(by rw [values0951_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0951_lookup i)

theorem block0951_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (162 + i.val) = (values0951[i.val]'(by rw [values0951_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0951_lookup i)

theorem block0952_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (194 + i.val) = some (values0952[i.val]'(by rw [values0952_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0952_lookup i)

theorem block0952_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (194 + i.val) = (values0952[i.val]'(by rw [values0952_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0952_lookup i)

theorem block0953_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (226 + i.val) = some (values0953[i.val]'(by rw [values0953_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0953_lookup i)

theorem block0953_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (226 + i.val) = (values0953[i.val]'(by rw [values0953_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0953_lookup i)

theorem block0954_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (258 + i.val) = some (values0954[i.val]'(by rw [values0954_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0954_lookup i)

theorem block0954_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (258 + i.val) = (values0954[i.val]'(by rw [values0954_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0954_lookup i)

theorem block0955_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (290 + i.val) = some (values0955[i.val]'(by rw [values0955_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0955_lookup i)

theorem block0955_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (290 + i.val) = (values0955[i.val]'(by rw [values0955_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0955_lookup i)

theorem block0956_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (322 + i.val) = some (values0956[i.val]'(by rw [values0956_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0956_lookup i)

theorem block0956_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (322 + i.val) = (values0956[i.val]'(by rw [values0956_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0956_lookup i)

theorem block0957_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (354 + i.val) = some (values0957[i.val]'(by rw [values0957_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0957_lookup i)

theorem block0957_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (354 + i.val) = (values0957[i.val]'(by rw [values0957_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0957_lookup i)

theorem block0958_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 67 (386 + i.val) = some (values0958[i.val]'(by rw [values0958_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0958_lookup i)

theorem block0958_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 67 (386 + i.val) = (values0958[i.val]'(by rw [values0958_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0958_lookup i)

theorem block0959_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 67 (418 + i.val) = some (values0959[i.val]'(by rw [values0959_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row067_lookup _).trans (OriginalRow227TriangleLookupRow067.block0959_lookup i)

theorem block0959_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 67 (418 + i.val) = (values0959[i.val]'(by rw [values0959_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0959_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0948_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0948_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0949_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0949_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0950_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0950_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0951_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0951_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0952_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0952_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0953_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0953_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0954_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0954_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0955_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0955_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0956_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0956_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0957_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0957_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0958_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0958_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0959_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067.block0959_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067
