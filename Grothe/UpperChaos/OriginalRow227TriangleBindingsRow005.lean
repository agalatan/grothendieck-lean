import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow005

theorem block0080_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (4 + i.val) = some (values0080[i.val]'(by rw [values0080_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0080_lookup i)

theorem block0080_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (4 + i.val) = (values0080[i.val]'(by rw [values0080_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0080_lookup i)

theorem block0081_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (36 + i.val) = some (values0081[i.val]'(by rw [values0081_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0081_lookup i)

theorem block0081_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (36 + i.val) = (values0081[i.val]'(by rw [values0081_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0081_lookup i)

theorem block0082_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (68 + i.val) = some (values0082[i.val]'(by rw [values0082_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0082_lookup i)

theorem block0082_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (68 + i.val) = (values0082[i.val]'(by rw [values0082_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0082_lookup i)

theorem block0083_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (100 + i.val) = some (values0083[i.val]'(by rw [values0083_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0083_lookup i)

theorem block0083_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (100 + i.val) = (values0083[i.val]'(by rw [values0083_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0083_lookup i)

theorem block0084_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (132 + i.val) = some (values0084[i.val]'(by rw [values0084_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0084_lookup i)

theorem block0084_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (132 + i.val) = (values0084[i.val]'(by rw [values0084_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0084_lookup i)

theorem block0085_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (164 + i.val) = some (values0085[i.val]'(by rw [values0085_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0085_lookup i)

theorem block0085_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (164 + i.val) = (values0085[i.val]'(by rw [values0085_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0085_lookup i)

theorem block0086_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (196 + i.val) = some (values0086[i.val]'(by rw [values0086_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0086_lookup i)

theorem block0086_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (196 + i.val) = (values0086[i.val]'(by rw [values0086_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0086_lookup i)

theorem block0087_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (228 + i.val) = some (values0087[i.val]'(by rw [values0087_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0087_lookup i)

theorem block0087_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (228 + i.val) = (values0087[i.val]'(by rw [values0087_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0087_lookup i)

theorem block0088_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (260 + i.val) = some (values0088[i.val]'(by rw [values0088_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0088_lookup i)

theorem block0088_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (260 + i.val) = (values0088[i.val]'(by rw [values0088_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0088_lookup i)

theorem block0089_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (292 + i.val) = some (values0089[i.val]'(by rw [values0089_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0089_lookup i)

theorem block0089_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (292 + i.val) = (values0089[i.val]'(by rw [values0089_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0089_lookup i)

theorem block0090_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (324 + i.val) = some (values0090[i.val]'(by rw [values0090_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0090_lookup i)

theorem block0090_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (324 + i.val) = (values0090[i.val]'(by rw [values0090_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0090_lookup i)

theorem block0091_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (356 + i.val) = some (values0091[i.val]'(by rw [values0091_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0091_lookup i)

theorem block0091_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (356 + i.val) = (values0091[i.val]'(by rw [values0091_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0091_lookup i)

theorem block0092_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (388 + i.val) = some (values0092[i.val]'(by rw [values0092_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0092_lookup i)

theorem block0092_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (388 + i.val) = (values0092[i.val]'(by rw [values0092_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0092_lookup i)

theorem block0093_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (420 + i.val) = some (values0093[i.val]'(by rw [values0093_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0093_lookup i)

theorem block0093_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (420 + i.val) = (values0093[i.val]'(by rw [values0093_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0093_lookup i)

theorem block0094_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 5 (452 + i.val) = some (values0094[i.val]'(by rw [values0094_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0094_lookup i)

theorem block0094_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 5 (452 + i.val) = (values0094[i.val]'(by rw [values0094_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0094_lookup i)

theorem block0095_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 5 (484 + i.val) = some (values0095[i.val]'(by rw [values0095_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row005_lookup _).trans (OriginalRow227TriangleLookupRow005.block0095_lookup i)

theorem block0095_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 5 (484 + i.val) = (values0095[i.val]'(by rw [values0095_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0095_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0080_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0080_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0081_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0081_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0082_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0082_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0083_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0083_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0084_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0084_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0085_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0085_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0086_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0086_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0087_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0087_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0088_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0088_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0089_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0089_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0090_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0090_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0091_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0091_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0092_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0092_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0093_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0093_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0094_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0094_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0095_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005.block0095_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005
