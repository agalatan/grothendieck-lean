import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow028

theorem block0432_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (27 + i.val) = some (values0432[i.val]'(by rw [values0432_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0432_lookup i)

theorem block0432_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (27 + i.val) = (values0432[i.val]'(by rw [values0432_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0432_lookup i)

theorem block0433_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (59 + i.val) = some (values0433[i.val]'(by rw [values0433_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0433_lookup i)

theorem block0433_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (59 + i.val) = (values0433[i.val]'(by rw [values0433_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0433_lookup i)

theorem block0434_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (91 + i.val) = some (values0434[i.val]'(by rw [values0434_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0434_lookup i)

theorem block0434_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (91 + i.val) = (values0434[i.val]'(by rw [values0434_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0434_lookup i)

theorem block0435_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (123 + i.val) = some (values0435[i.val]'(by rw [values0435_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0435_lookup i)

theorem block0435_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (123 + i.val) = (values0435[i.val]'(by rw [values0435_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0435_lookup i)

theorem block0436_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (155 + i.val) = some (values0436[i.val]'(by rw [values0436_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0436_lookup i)

theorem block0436_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (155 + i.val) = (values0436[i.val]'(by rw [values0436_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0436_lookup i)

theorem block0437_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (187 + i.val) = some (values0437[i.val]'(by rw [values0437_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0437_lookup i)

theorem block0437_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (187 + i.val) = (values0437[i.val]'(by rw [values0437_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0437_lookup i)

theorem block0438_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (219 + i.val) = some (values0438[i.val]'(by rw [values0438_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0438_lookup i)

theorem block0438_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (219 + i.val) = (values0438[i.val]'(by rw [values0438_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0438_lookup i)

theorem block0439_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (251 + i.val) = some (values0439[i.val]'(by rw [values0439_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0439_lookup i)

theorem block0439_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (251 + i.val) = (values0439[i.val]'(by rw [values0439_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0439_lookup i)

theorem block0440_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (283 + i.val) = some (values0440[i.val]'(by rw [values0440_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0440_lookup i)

theorem block0440_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (283 + i.val) = (values0440[i.val]'(by rw [values0440_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0440_lookup i)

theorem block0441_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (315 + i.val) = some (values0441[i.val]'(by rw [values0441_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0441_lookup i)

theorem block0441_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (315 + i.val) = (values0441[i.val]'(by rw [values0441_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0441_lookup i)

theorem block0442_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (347 + i.val) = some (values0442[i.val]'(by rw [values0442_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0442_lookup i)

theorem block0442_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (347 + i.val) = (values0442[i.val]'(by rw [values0442_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0442_lookup i)

theorem block0443_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (379 + i.val) = some (values0443[i.val]'(by rw [values0443_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0443_lookup i)

theorem block0443_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (379 + i.val) = (values0443[i.val]'(by rw [values0443_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0443_lookup i)

theorem block0444_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 28 (411 + i.val) = some (values0444[i.val]'(by rw [values0444_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0444_lookup i)

theorem block0444_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 28 (411 + i.val) = (values0444[i.val]'(by rw [values0444_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0444_lookup i)

theorem block0445_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 28 (443 + i.val) = some (values0445[i.val]'(by rw [values0445_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row028_lookup _).trans (OriginalRow227TriangleLookupRow028.block0445_lookup i)

theorem block0445_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 28 (443 + i.val) = (values0445[i.val]'(by rw [values0445_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0445_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0432_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0432_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0433_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0433_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0434_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0434_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0435_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0435_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0436_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0436_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0437_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0437_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0438_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0438_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0439_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0439_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0440_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0440_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0441_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0441_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0442_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0442_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0443_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0443_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0444_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0444_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0445_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028.block0445_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028
