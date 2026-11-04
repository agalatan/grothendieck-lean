import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow029

theorem block0446_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (28 + i.val) = some (values0446[i.val]'(by rw [values0446_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0446_lookup i)

theorem block0446_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (28 + i.val) = (values0446[i.val]'(by rw [values0446_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0446_lookup i)

theorem block0447_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (60 + i.val) = some (values0447[i.val]'(by rw [values0447_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0447_lookup i)

theorem block0447_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (60 + i.val) = (values0447[i.val]'(by rw [values0447_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0447_lookup i)

theorem block0448_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (92 + i.val) = some (values0448[i.val]'(by rw [values0448_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0448_lookup i)

theorem block0448_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (92 + i.val) = (values0448[i.val]'(by rw [values0448_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0448_lookup i)

theorem block0449_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (124 + i.val) = some (values0449[i.val]'(by rw [values0449_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0449_lookup i)

theorem block0449_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (124 + i.val) = (values0449[i.val]'(by rw [values0449_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0449_lookup i)

theorem block0450_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (156 + i.val) = some (values0450[i.val]'(by rw [values0450_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0450_lookup i)

theorem block0450_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (156 + i.val) = (values0450[i.val]'(by rw [values0450_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0450_lookup i)

theorem block0451_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (188 + i.val) = some (values0451[i.val]'(by rw [values0451_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0451_lookup i)

theorem block0451_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (188 + i.val) = (values0451[i.val]'(by rw [values0451_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0451_lookup i)

theorem block0452_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (220 + i.val) = some (values0452[i.val]'(by rw [values0452_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0452_lookup i)

theorem block0452_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (220 + i.val) = (values0452[i.val]'(by rw [values0452_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0452_lookup i)

theorem block0453_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (252 + i.val) = some (values0453[i.val]'(by rw [values0453_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0453_lookup i)

theorem block0453_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (252 + i.val) = (values0453[i.val]'(by rw [values0453_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0453_lookup i)

theorem block0454_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (284 + i.val) = some (values0454[i.val]'(by rw [values0454_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0454_lookup i)

theorem block0454_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (284 + i.val) = (values0454[i.val]'(by rw [values0454_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0454_lookup i)

theorem block0455_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (316 + i.val) = some (values0455[i.val]'(by rw [values0455_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0455_lookup i)

theorem block0455_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (316 + i.val) = (values0455[i.val]'(by rw [values0455_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0455_lookup i)

theorem block0456_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (348 + i.val) = some (values0456[i.val]'(by rw [values0456_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0456_lookup i)

theorem block0456_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (348 + i.val) = (values0456[i.val]'(by rw [values0456_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0456_lookup i)

theorem block0457_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (380 + i.val) = some (values0457[i.val]'(by rw [values0457_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0457_lookup i)

theorem block0457_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (380 + i.val) = (values0457[i.val]'(by rw [values0457_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0457_lookup i)

theorem block0458_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 29 (412 + i.val) = some (values0458[i.val]'(by rw [values0458_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0458_lookup i)

theorem block0458_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 29 (412 + i.val) = (values0458[i.val]'(by rw [values0458_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0458_lookup i)

theorem block0459_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 29 (444 + i.val) = some (values0459[i.val]'(by rw [values0459_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row029_lookup _).trans (OriginalRow227TriangleLookupRow029.block0459_lookup i)

theorem block0459_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 29 (444 + i.val) = (values0459[i.val]'(by rw [values0459_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0459_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0446_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0446_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0447_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0447_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0448_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0448_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0449_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0449_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0450_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0450_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0451_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0451_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0452_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0452_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0453_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0453_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0454_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0454_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0455_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0455_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0456_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0456_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0457_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0457_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0458_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0458_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0459_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029.block0459_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029
