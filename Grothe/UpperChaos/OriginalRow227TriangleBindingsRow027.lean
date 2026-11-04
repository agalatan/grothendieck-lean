import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow027

theorem block0417_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (26 + i.val) = some (values0417[i.val]'(by rw [values0417_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0417_lookup i)

theorem block0417_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (26 + i.val) = (values0417[i.val]'(by rw [values0417_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0417_lookup i)

theorem block0418_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (58 + i.val) = some (values0418[i.val]'(by rw [values0418_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0418_lookup i)

theorem block0418_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (58 + i.val) = (values0418[i.val]'(by rw [values0418_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0418_lookup i)

theorem block0419_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (90 + i.val) = some (values0419[i.val]'(by rw [values0419_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0419_lookup i)

theorem block0419_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (90 + i.val) = (values0419[i.val]'(by rw [values0419_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0419_lookup i)

theorem block0420_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (122 + i.val) = some (values0420[i.val]'(by rw [values0420_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0420_lookup i)

theorem block0420_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (122 + i.val) = (values0420[i.val]'(by rw [values0420_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0420_lookup i)

theorem block0421_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (154 + i.val) = some (values0421[i.val]'(by rw [values0421_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0421_lookup i)

theorem block0421_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (154 + i.val) = (values0421[i.val]'(by rw [values0421_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0421_lookup i)

theorem block0422_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (186 + i.val) = some (values0422[i.val]'(by rw [values0422_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0422_lookup i)

theorem block0422_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (186 + i.val) = (values0422[i.val]'(by rw [values0422_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0422_lookup i)

theorem block0423_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (218 + i.val) = some (values0423[i.val]'(by rw [values0423_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0423_lookup i)

theorem block0423_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (218 + i.val) = (values0423[i.val]'(by rw [values0423_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0423_lookup i)

theorem block0424_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (250 + i.val) = some (values0424[i.val]'(by rw [values0424_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0424_lookup i)

theorem block0424_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (250 + i.val) = (values0424[i.val]'(by rw [values0424_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0424_lookup i)

theorem block0425_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (282 + i.val) = some (values0425[i.val]'(by rw [values0425_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0425_lookup i)

theorem block0425_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (282 + i.val) = (values0425[i.val]'(by rw [values0425_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0425_lookup i)

theorem block0426_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (314 + i.val) = some (values0426[i.val]'(by rw [values0426_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0426_lookup i)

theorem block0426_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (314 + i.val) = (values0426[i.val]'(by rw [values0426_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0426_lookup i)

theorem block0427_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (346 + i.val) = some (values0427[i.val]'(by rw [values0427_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0427_lookup i)

theorem block0427_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (346 + i.val) = (values0427[i.val]'(by rw [values0427_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0427_lookup i)

theorem block0428_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (378 + i.val) = some (values0428[i.val]'(by rw [values0428_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0428_lookup i)

theorem block0428_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (378 + i.val) = (values0428[i.val]'(by rw [values0428_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0428_lookup i)

theorem block0429_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (410 + i.val) = some (values0429[i.val]'(by rw [values0429_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0429_lookup i)

theorem block0429_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (410 + i.val) = (values0429[i.val]'(by rw [values0429_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0429_lookup i)

theorem block0430_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 27 (442 + i.val) = some (values0430[i.val]'(by rw [values0430_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0430_lookup i)

theorem block0430_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 27 (442 + i.val) = (values0430[i.val]'(by rw [values0430_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0430_lookup i)

theorem block0431_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 27 (474 + i.val) = some (values0431[i.val]'(by rw [values0431_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row027_lookup _).trans (OriginalRow227TriangleLookupRow027.block0431_lookup i)

theorem block0431_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 27 (474 + i.val) = (values0431[i.val]'(by rw [values0431_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0431_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0417_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0417_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0418_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0418_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0419_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0419_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0420_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0420_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0421_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0421_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0422_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0422_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0423_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0423_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0424_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0424_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0425_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0425_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0426_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0426_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0427_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0427_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0428_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0428_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0429_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0429_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0430_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0430_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0431_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027.block0431_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027
