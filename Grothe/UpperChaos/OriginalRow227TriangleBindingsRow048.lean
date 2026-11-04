import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow048

theorem block0708_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (47 + i.val) = some (values0708[i.val]'(by rw [values0708_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0708_lookup i)

theorem block0708_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (47 + i.val) = (values0708[i.val]'(by rw [values0708_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0708_lookup i)

theorem block0709_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (79 + i.val) = some (values0709[i.val]'(by rw [values0709_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0709_lookup i)

theorem block0709_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (79 + i.val) = (values0709[i.val]'(by rw [values0709_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0709_lookup i)

theorem block0710_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (111 + i.val) = some (values0710[i.val]'(by rw [values0710_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0710_lookup i)

theorem block0710_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (111 + i.val) = (values0710[i.val]'(by rw [values0710_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0710_lookup i)

theorem block0711_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (143 + i.val) = some (values0711[i.val]'(by rw [values0711_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0711_lookup i)

theorem block0711_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (143 + i.val) = (values0711[i.val]'(by rw [values0711_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0711_lookup i)

theorem block0712_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (175 + i.val) = some (values0712[i.val]'(by rw [values0712_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0712_lookup i)

theorem block0712_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (175 + i.val) = (values0712[i.val]'(by rw [values0712_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0712_lookup i)

theorem block0713_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (207 + i.val) = some (values0713[i.val]'(by rw [values0713_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0713_lookup i)

theorem block0713_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (207 + i.val) = (values0713[i.val]'(by rw [values0713_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0713_lookup i)

theorem block0714_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (239 + i.val) = some (values0714[i.val]'(by rw [values0714_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0714_lookup i)

theorem block0714_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (239 + i.val) = (values0714[i.val]'(by rw [values0714_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0714_lookup i)

theorem block0715_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (271 + i.val) = some (values0715[i.val]'(by rw [values0715_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0715_lookup i)

theorem block0715_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (271 + i.val) = (values0715[i.val]'(by rw [values0715_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0715_lookup i)

theorem block0716_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (303 + i.val) = some (values0716[i.val]'(by rw [values0716_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0716_lookup i)

theorem block0716_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (303 + i.val) = (values0716[i.val]'(by rw [values0716_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0716_lookup i)

theorem block0717_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (335 + i.val) = some (values0717[i.val]'(by rw [values0717_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0717_lookup i)

theorem block0717_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (335 + i.val) = (values0717[i.val]'(by rw [values0717_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0717_lookup i)

theorem block0718_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (367 + i.val) = some (values0718[i.val]'(by rw [values0718_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0718_lookup i)

theorem block0718_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (367 + i.val) = (values0718[i.val]'(by rw [values0718_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0718_lookup i)

theorem block0719_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 48 (399 + i.val) = some (values0719[i.val]'(by rw [values0719_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0719_lookup i)

theorem block0719_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 48 (399 + i.val) = (values0719[i.val]'(by rw [values0719_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0719_lookup i)

theorem block0720_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 48 (431 + i.val) = some (values0720[i.val]'(by rw [values0720_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row048_lookup _).trans (OriginalRow227TriangleLookupRow048.block0720_lookup i)

theorem block0720_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 48 (431 + i.val) = (values0720[i.val]'(by rw [values0720_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0720_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0708_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0708_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0709_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0709_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0710_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0710_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0711_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0711_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0712_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0712_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0713_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0713_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0714_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0714_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0715_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0715_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0716_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0716_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0717_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0717_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0718_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0718_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0719_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0719_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0720_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048.block0720_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048
