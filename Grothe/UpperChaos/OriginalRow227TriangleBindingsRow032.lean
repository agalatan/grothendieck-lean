import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow032

theorem block0488_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (31 + i.val) = some (values0488[i.val]'(by rw [values0488_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0488_lookup i)

theorem block0488_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (31 + i.val) = (values0488[i.val]'(by rw [values0488_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0488_lookup i)

theorem block0489_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (63 + i.val) = some (values0489[i.val]'(by rw [values0489_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0489_lookup i)

theorem block0489_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (63 + i.val) = (values0489[i.val]'(by rw [values0489_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0489_lookup i)

theorem block0490_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (95 + i.val) = some (values0490[i.val]'(by rw [values0490_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0490_lookup i)

theorem block0490_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (95 + i.val) = (values0490[i.val]'(by rw [values0490_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0490_lookup i)

theorem block0491_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (127 + i.val) = some (values0491[i.val]'(by rw [values0491_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0491_lookup i)

theorem block0491_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (127 + i.val) = (values0491[i.val]'(by rw [values0491_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0491_lookup i)

theorem block0492_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (159 + i.val) = some (values0492[i.val]'(by rw [values0492_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0492_lookup i)

theorem block0492_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (159 + i.val) = (values0492[i.val]'(by rw [values0492_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0492_lookup i)

theorem block0493_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (191 + i.val) = some (values0493[i.val]'(by rw [values0493_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0493_lookup i)

theorem block0493_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (191 + i.val) = (values0493[i.val]'(by rw [values0493_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0493_lookup i)

theorem block0494_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (223 + i.val) = some (values0494[i.val]'(by rw [values0494_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0494_lookup i)

theorem block0494_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (223 + i.val) = (values0494[i.val]'(by rw [values0494_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0494_lookup i)

theorem block0495_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (255 + i.val) = some (values0495[i.val]'(by rw [values0495_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0495_lookup i)

theorem block0495_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (255 + i.val) = (values0495[i.val]'(by rw [values0495_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0495_lookup i)

theorem block0496_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (287 + i.val) = some (values0496[i.val]'(by rw [values0496_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0496_lookup i)

theorem block0496_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (287 + i.val) = (values0496[i.val]'(by rw [values0496_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0496_lookup i)

theorem block0497_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (319 + i.val) = some (values0497[i.val]'(by rw [values0497_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0497_lookup i)

theorem block0497_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (319 + i.val) = (values0497[i.val]'(by rw [values0497_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0497_lookup i)

theorem block0498_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (351 + i.val) = some (values0498[i.val]'(by rw [values0498_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0498_lookup i)

theorem block0498_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (351 + i.val) = (values0498[i.val]'(by rw [values0498_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0498_lookup i)

theorem block0499_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (383 + i.val) = some (values0499[i.val]'(by rw [values0499_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0499_lookup i)

theorem block0499_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (383 + i.val) = (values0499[i.val]'(by rw [values0499_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0499_lookup i)

theorem block0500_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 32 (415 + i.val) = some (values0500[i.val]'(by rw [values0500_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0500_lookup i)

theorem block0500_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 32 (415 + i.val) = (values0500[i.val]'(by rw [values0500_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0500_lookup i)

theorem block0501_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 32 (447 + i.val) = some (values0501[i.val]'(by rw [values0501_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row032_lookup _).trans (OriginalRow227TriangleLookupRow032.block0501_lookup i)

theorem block0501_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 32 (447 + i.val) = (values0501[i.val]'(by rw [values0501_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0501_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0488_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0488_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0489_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0489_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0490_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0490_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0491_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0491_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0492_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0492_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0493_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0493_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0494_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0494_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0495_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0495_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0496_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0496_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0497_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0497_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0498_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0498_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0499_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0499_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0500_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0500_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0501_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032.block0501_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032
