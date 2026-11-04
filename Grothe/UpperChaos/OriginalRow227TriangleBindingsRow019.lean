import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow019

theorem block0297_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (18 + i.val) = some (values0297[i.val]'(by rw [values0297_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0297_lookup i)

theorem block0297_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (18 + i.val) = (values0297[i.val]'(by rw [values0297_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0297_lookup i)

theorem block0298_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (50 + i.val) = some (values0298[i.val]'(by rw [values0298_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0298_lookup i)

theorem block0298_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (50 + i.val) = (values0298[i.val]'(by rw [values0298_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0298_lookup i)

theorem block0299_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (82 + i.val) = some (values0299[i.val]'(by rw [values0299_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0299_lookup i)

theorem block0299_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (82 + i.val) = (values0299[i.val]'(by rw [values0299_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0299_lookup i)

theorem block0300_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (114 + i.val) = some (values0300[i.val]'(by rw [values0300_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0300_lookup i)

theorem block0300_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (114 + i.val) = (values0300[i.val]'(by rw [values0300_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0300_lookup i)

theorem block0301_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (146 + i.val) = some (values0301[i.val]'(by rw [values0301_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0301_lookup i)

theorem block0301_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (146 + i.val) = (values0301[i.val]'(by rw [values0301_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0301_lookup i)

theorem block0302_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (178 + i.val) = some (values0302[i.val]'(by rw [values0302_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0302_lookup i)

theorem block0302_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (178 + i.val) = (values0302[i.val]'(by rw [values0302_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0302_lookup i)

theorem block0303_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (210 + i.val) = some (values0303[i.val]'(by rw [values0303_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0303_lookup i)

theorem block0303_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (210 + i.val) = (values0303[i.val]'(by rw [values0303_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0303_lookup i)

theorem block0304_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (242 + i.val) = some (values0304[i.val]'(by rw [values0304_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0304_lookup i)

theorem block0304_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (242 + i.val) = (values0304[i.val]'(by rw [values0304_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0304_lookup i)

theorem block0305_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (274 + i.val) = some (values0305[i.val]'(by rw [values0305_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0305_lookup i)

theorem block0305_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (274 + i.val) = (values0305[i.val]'(by rw [values0305_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0305_lookup i)

theorem block0306_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (306 + i.val) = some (values0306[i.val]'(by rw [values0306_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0306_lookup i)

theorem block0306_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (306 + i.val) = (values0306[i.val]'(by rw [values0306_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0306_lookup i)

theorem block0307_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (338 + i.val) = some (values0307[i.val]'(by rw [values0307_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0307_lookup i)

theorem block0307_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (338 + i.val) = (values0307[i.val]'(by rw [values0307_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0307_lookup i)

theorem block0308_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (370 + i.val) = some (values0308[i.val]'(by rw [values0308_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0308_lookup i)

theorem block0308_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (370 + i.val) = (values0308[i.val]'(by rw [values0308_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0308_lookup i)

theorem block0309_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (402 + i.val) = some (values0309[i.val]'(by rw [values0309_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0309_lookup i)

theorem block0309_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (402 + i.val) = (values0309[i.val]'(by rw [values0309_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0309_lookup i)

theorem block0310_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 19 (434 + i.val) = some (values0310[i.val]'(by rw [values0310_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0310_lookup i)

theorem block0310_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 19 (434 + i.val) = (values0310[i.val]'(by rw [values0310_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0310_lookup i)

theorem block0311_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 19 (466 + i.val) = some (values0311[i.val]'(by rw [values0311_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row019_lookup _).trans (OriginalRow227TriangleLookupRow019.block0311_lookup i)

theorem block0311_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 19 (466 + i.val) = (values0311[i.val]'(by rw [values0311_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0311_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0297_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0297_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0298_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0298_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0299_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0299_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0300_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0300_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0301_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0301_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0302_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0302_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0303_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0303_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0304_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0304_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0305_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0305_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0306_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0306_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0307_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0307_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0308_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0308_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0309_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0309_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0310_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0310_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0311_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019.block0311_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019
