import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow040

theorem block0600_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (39 + i.val) = some (values0600[i.val]'(by rw [values0600_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0600_lookup i)

theorem block0600_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (39 + i.val) = (values0600[i.val]'(by rw [values0600_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0600_lookup i)

theorem block0601_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (71 + i.val) = some (values0601[i.val]'(by rw [values0601_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0601_lookup i)

theorem block0601_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (71 + i.val) = (values0601[i.val]'(by rw [values0601_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0601_lookup i)

theorem block0602_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (103 + i.val) = some (values0602[i.val]'(by rw [values0602_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0602_lookup i)

theorem block0602_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (103 + i.val) = (values0602[i.val]'(by rw [values0602_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0602_lookup i)

theorem block0603_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (135 + i.val) = some (values0603[i.val]'(by rw [values0603_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0603_lookup i)

theorem block0603_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (135 + i.val) = (values0603[i.val]'(by rw [values0603_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0603_lookup i)

theorem block0604_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (167 + i.val) = some (values0604[i.val]'(by rw [values0604_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0604_lookup i)

theorem block0604_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (167 + i.val) = (values0604[i.val]'(by rw [values0604_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0604_lookup i)

theorem block0605_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (199 + i.val) = some (values0605[i.val]'(by rw [values0605_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0605_lookup i)

theorem block0605_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (199 + i.val) = (values0605[i.val]'(by rw [values0605_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0605_lookup i)

theorem block0606_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (231 + i.val) = some (values0606[i.val]'(by rw [values0606_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0606_lookup i)

theorem block0606_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (231 + i.val) = (values0606[i.val]'(by rw [values0606_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0606_lookup i)

theorem block0607_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (263 + i.val) = some (values0607[i.val]'(by rw [values0607_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0607_lookup i)

theorem block0607_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (263 + i.val) = (values0607[i.val]'(by rw [values0607_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0607_lookup i)

theorem block0608_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (295 + i.val) = some (values0608[i.val]'(by rw [values0608_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0608_lookup i)

theorem block0608_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (295 + i.val) = (values0608[i.val]'(by rw [values0608_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0608_lookup i)

theorem block0609_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (327 + i.val) = some (values0609[i.val]'(by rw [values0609_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0609_lookup i)

theorem block0609_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (327 + i.val) = (values0609[i.val]'(by rw [values0609_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0609_lookup i)

theorem block0610_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (359 + i.val) = some (values0610[i.val]'(by rw [values0610_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0610_lookup i)

theorem block0610_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (359 + i.val) = (values0610[i.val]'(by rw [values0610_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0610_lookup i)

theorem block0611_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (391 + i.val) = some (values0611[i.val]'(by rw [values0611_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0611_lookup i)

theorem block0611_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (391 + i.val) = (values0611[i.val]'(by rw [values0611_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0611_lookup i)

theorem block0612_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 40 (423 + i.val) = some (values0612[i.val]'(by rw [values0612_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0612_lookup i)

theorem block0612_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 40 (423 + i.val) = (values0612[i.val]'(by rw [values0612_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0612_lookup i)

theorem block0613_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 40 (455 + i.val) = some (values0613[i.val]'(by rw [values0613_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row040_lookup _).trans (OriginalRow227TriangleLookupRow040.block0613_lookup i)

theorem block0613_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 40 (455 + i.val) = (values0613[i.val]'(by rw [values0613_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0613_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0600_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0600_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0601_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0601_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0602_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0602_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0603_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0603_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0604_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0604_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0605_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0605_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0606_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0606_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0607_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0607_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0608_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0608_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0609_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0609_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0610_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0610_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0611_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0611_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0612_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0612_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0613_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040.block0613_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040
