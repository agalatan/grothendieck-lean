import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow066

theorem block0936_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (65 + i.val) = some (values0936[i.val]'(by rw [values0936_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0936_lookup i)

theorem block0936_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (65 + i.val) = (values0936[i.val]'(by rw [values0936_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0936_lookup i)

theorem block0937_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (97 + i.val) = some (values0937[i.val]'(by rw [values0937_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0937_lookup i)

theorem block0937_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (97 + i.val) = (values0937[i.val]'(by rw [values0937_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0937_lookup i)

theorem block0938_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (129 + i.val) = some (values0938[i.val]'(by rw [values0938_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0938_lookup i)

theorem block0938_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (129 + i.val) = (values0938[i.val]'(by rw [values0938_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0938_lookup i)

theorem block0939_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (161 + i.val) = some (values0939[i.val]'(by rw [values0939_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0939_lookup i)

theorem block0939_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (161 + i.val) = (values0939[i.val]'(by rw [values0939_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0939_lookup i)

theorem block0940_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (193 + i.val) = some (values0940[i.val]'(by rw [values0940_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0940_lookup i)

theorem block0940_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (193 + i.val) = (values0940[i.val]'(by rw [values0940_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0940_lookup i)

theorem block0941_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (225 + i.val) = some (values0941[i.val]'(by rw [values0941_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0941_lookup i)

theorem block0941_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (225 + i.val) = (values0941[i.val]'(by rw [values0941_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0941_lookup i)

theorem block0942_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (257 + i.val) = some (values0942[i.val]'(by rw [values0942_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0942_lookup i)

theorem block0942_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (257 + i.val) = (values0942[i.val]'(by rw [values0942_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0942_lookup i)

theorem block0943_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (289 + i.val) = some (values0943[i.val]'(by rw [values0943_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0943_lookup i)

theorem block0943_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (289 + i.val) = (values0943[i.val]'(by rw [values0943_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0943_lookup i)

theorem block0944_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (321 + i.val) = some (values0944[i.val]'(by rw [values0944_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0944_lookup i)

theorem block0944_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (321 + i.val) = (values0944[i.val]'(by rw [values0944_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0944_lookup i)

theorem block0945_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (353 + i.val) = some (values0945[i.val]'(by rw [values0945_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0945_lookup i)

theorem block0945_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (353 + i.val) = (values0945[i.val]'(by rw [values0945_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0945_lookup i)

theorem block0946_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 66 (385 + i.val) = some (values0946[i.val]'(by rw [values0946_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0946_lookup i)

theorem block0946_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 66 (385 + i.val) = (values0946[i.val]'(by rw [values0946_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0946_lookup i)

theorem block0947_lookup (i : Fin 19) :
    OriginalRow227TriangleLookup.lookup 66 (417 + i.val) = some (values0947[i.val]'(by rw [values0947_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row066_lookup _).trans (OriginalRow227TriangleLookupRow066.block0947_lookup i)

theorem block0947_value (i : Fin 19) :
    OriginalRow227TriangleLookup.T 66 (417 + i.val) = (values0947[i.val]'(by rw [values0947_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0947_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0936_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0936_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0937_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0937_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0938_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0938_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0939_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0939_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0940_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0940_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0941_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0941_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0942_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0942_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0943_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0943_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0944_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0944_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0945_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0945_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0946_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0946_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0947_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066.block0947_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066
