import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow043

theorem block0642_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (42 + i.val) = some (values0642[i.val]'(by rw [values0642_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0642_lookup i)

theorem block0642_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (42 + i.val) = (values0642[i.val]'(by rw [values0642_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0642_lookup i)

theorem block0643_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (74 + i.val) = some (values0643[i.val]'(by rw [values0643_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0643_lookup i)

theorem block0643_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (74 + i.val) = (values0643[i.val]'(by rw [values0643_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0643_lookup i)

theorem block0644_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (106 + i.val) = some (values0644[i.val]'(by rw [values0644_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0644_lookup i)

theorem block0644_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (106 + i.val) = (values0644[i.val]'(by rw [values0644_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0644_lookup i)

theorem block0645_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (138 + i.val) = some (values0645[i.val]'(by rw [values0645_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0645_lookup i)

theorem block0645_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (138 + i.val) = (values0645[i.val]'(by rw [values0645_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0645_lookup i)

theorem block0646_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (170 + i.val) = some (values0646[i.val]'(by rw [values0646_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0646_lookup i)

theorem block0646_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (170 + i.val) = (values0646[i.val]'(by rw [values0646_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0646_lookup i)

theorem block0647_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (202 + i.val) = some (values0647[i.val]'(by rw [values0647_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0647_lookup i)

theorem block0647_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (202 + i.val) = (values0647[i.val]'(by rw [values0647_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0647_lookup i)

theorem block0648_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (234 + i.val) = some (values0648[i.val]'(by rw [values0648_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0648_lookup i)

theorem block0648_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (234 + i.val) = (values0648[i.val]'(by rw [values0648_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0648_lookup i)

theorem block0649_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (266 + i.val) = some (values0649[i.val]'(by rw [values0649_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0649_lookup i)

theorem block0649_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (266 + i.val) = (values0649[i.val]'(by rw [values0649_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0649_lookup i)

theorem block0650_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (298 + i.val) = some (values0650[i.val]'(by rw [values0650_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0650_lookup i)

theorem block0650_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (298 + i.val) = (values0650[i.val]'(by rw [values0650_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0650_lookup i)

theorem block0651_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (330 + i.val) = some (values0651[i.val]'(by rw [values0651_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0651_lookup i)

theorem block0651_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (330 + i.val) = (values0651[i.val]'(by rw [values0651_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0651_lookup i)

theorem block0652_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (362 + i.val) = some (values0652[i.val]'(by rw [values0652_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0652_lookup i)

theorem block0652_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (362 + i.val) = (values0652[i.val]'(by rw [values0652_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0652_lookup i)

theorem block0653_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (394 + i.val) = some (values0653[i.val]'(by rw [values0653_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0653_lookup i)

theorem block0653_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (394 + i.val) = (values0653[i.val]'(by rw [values0653_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0653_lookup i)

theorem block0654_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 43 (426 + i.val) = some (values0654[i.val]'(by rw [values0654_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0654_lookup i)

theorem block0654_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 43 (426 + i.val) = (values0654[i.val]'(by rw [values0654_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0654_lookup i)

theorem block0655_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 43 (458 + i.val) = some (values0655[i.val]'(by rw [values0655_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row043_lookup _).trans (OriginalRow227TriangleLookupRow043.block0655_lookup i)

theorem block0655_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 43 (458 + i.val) = (values0655[i.val]'(by rw [values0655_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0655_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0642_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0642_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0643_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0643_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0644_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0644_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0645_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0645_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0646_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0646_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0647_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0647_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0648_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0648_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0649_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0649_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0650_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0650_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0651_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0651_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0652_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0652_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0653_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0653_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0654_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0654_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0655_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043.block0655_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043
