import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow037

theorem block0558_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (36 + i.val) = some (values0558[i.val]'(by rw [values0558_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0558_lookup i)

theorem block0558_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (36 + i.val) = (values0558[i.val]'(by rw [values0558_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0558_lookup i)

theorem block0559_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (68 + i.val) = some (values0559[i.val]'(by rw [values0559_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0559_lookup i)

theorem block0559_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (68 + i.val) = (values0559[i.val]'(by rw [values0559_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0559_lookup i)

theorem block0560_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (100 + i.val) = some (values0560[i.val]'(by rw [values0560_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0560_lookup i)

theorem block0560_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (100 + i.val) = (values0560[i.val]'(by rw [values0560_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0560_lookup i)

theorem block0561_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (132 + i.val) = some (values0561[i.val]'(by rw [values0561_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0561_lookup i)

theorem block0561_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (132 + i.val) = (values0561[i.val]'(by rw [values0561_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0561_lookup i)

theorem block0562_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (164 + i.val) = some (values0562[i.val]'(by rw [values0562_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0562_lookup i)

theorem block0562_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (164 + i.val) = (values0562[i.val]'(by rw [values0562_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0562_lookup i)

theorem block0563_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (196 + i.val) = some (values0563[i.val]'(by rw [values0563_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0563_lookup i)

theorem block0563_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (196 + i.val) = (values0563[i.val]'(by rw [values0563_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0563_lookup i)

theorem block0564_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (228 + i.val) = some (values0564[i.val]'(by rw [values0564_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0564_lookup i)

theorem block0564_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (228 + i.val) = (values0564[i.val]'(by rw [values0564_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0564_lookup i)

theorem block0565_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (260 + i.val) = some (values0565[i.val]'(by rw [values0565_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0565_lookup i)

theorem block0565_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (260 + i.val) = (values0565[i.val]'(by rw [values0565_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0565_lookup i)

theorem block0566_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (292 + i.val) = some (values0566[i.val]'(by rw [values0566_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0566_lookup i)

theorem block0566_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (292 + i.val) = (values0566[i.val]'(by rw [values0566_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0566_lookup i)

theorem block0567_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (324 + i.val) = some (values0567[i.val]'(by rw [values0567_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0567_lookup i)

theorem block0567_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (324 + i.val) = (values0567[i.val]'(by rw [values0567_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0567_lookup i)

theorem block0568_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (356 + i.val) = some (values0568[i.val]'(by rw [values0568_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0568_lookup i)

theorem block0568_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (356 + i.val) = (values0568[i.val]'(by rw [values0568_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0568_lookup i)

theorem block0569_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (388 + i.val) = some (values0569[i.val]'(by rw [values0569_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0569_lookup i)

theorem block0569_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (388 + i.val) = (values0569[i.val]'(by rw [values0569_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0569_lookup i)

theorem block0570_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 37 (420 + i.val) = some (values0570[i.val]'(by rw [values0570_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0570_lookup i)

theorem block0570_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 37 (420 + i.val) = (values0570[i.val]'(by rw [values0570_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0570_lookup i)

theorem block0571_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 37 (452 + i.val) = some (values0571[i.val]'(by rw [values0571_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row037_lookup _).trans (OriginalRow227TriangleLookupRow037.block0571_lookup i)

theorem block0571_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 37 (452 + i.val) = (values0571[i.val]'(by rw [values0571_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0571_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0558_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0558_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0559_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0559_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0560_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0560_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0561_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0561_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0562_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0562_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0563_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0563_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0564_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0564_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0565_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0565_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0566_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0566_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0567_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0567_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0568_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0568_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0569_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0569_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0570_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0570_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0571_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037.block0571_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow037
