import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow061

theorem block0876_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (60 + i.val) = some (values0876[i.val]'(by rw [values0876_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0876_lookup i)

theorem block0876_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (60 + i.val) = (values0876[i.val]'(by rw [values0876_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0876_lookup i)

theorem block0877_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (92 + i.val) = some (values0877[i.val]'(by rw [values0877_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0877_lookup i)

theorem block0877_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (92 + i.val) = (values0877[i.val]'(by rw [values0877_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0877_lookup i)

theorem block0878_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (124 + i.val) = some (values0878[i.val]'(by rw [values0878_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0878_lookup i)

theorem block0878_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (124 + i.val) = (values0878[i.val]'(by rw [values0878_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0878_lookup i)

theorem block0879_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (156 + i.val) = some (values0879[i.val]'(by rw [values0879_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0879_lookup i)

theorem block0879_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (156 + i.val) = (values0879[i.val]'(by rw [values0879_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0879_lookup i)

theorem block0880_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (188 + i.val) = some (values0880[i.val]'(by rw [values0880_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0880_lookup i)

theorem block0880_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (188 + i.val) = (values0880[i.val]'(by rw [values0880_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0880_lookup i)

theorem block0881_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (220 + i.val) = some (values0881[i.val]'(by rw [values0881_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0881_lookup i)

theorem block0881_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (220 + i.val) = (values0881[i.val]'(by rw [values0881_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0881_lookup i)

theorem block0882_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (252 + i.val) = some (values0882[i.val]'(by rw [values0882_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0882_lookup i)

theorem block0882_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (252 + i.val) = (values0882[i.val]'(by rw [values0882_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0882_lookup i)

theorem block0883_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (284 + i.val) = some (values0883[i.val]'(by rw [values0883_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0883_lookup i)

theorem block0883_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (284 + i.val) = (values0883[i.val]'(by rw [values0883_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0883_lookup i)

theorem block0884_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (316 + i.val) = some (values0884[i.val]'(by rw [values0884_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0884_lookup i)

theorem block0884_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (316 + i.val) = (values0884[i.val]'(by rw [values0884_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0884_lookup i)

theorem block0885_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (348 + i.val) = some (values0885[i.val]'(by rw [values0885_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0885_lookup i)

theorem block0885_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (348 + i.val) = (values0885[i.val]'(by rw [values0885_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0885_lookup i)

theorem block0886_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 61 (380 + i.val) = some (values0886[i.val]'(by rw [values0886_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0886_lookup i)

theorem block0886_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 61 (380 + i.val) = (values0886[i.val]'(by rw [values0886_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0886_lookup i)

theorem block0887_lookup (i : Fin 29) :
    OriginalRow227TriangleLookup.lookup 61 (412 + i.val) = some (values0887[i.val]'(by rw [values0887_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row061_lookup _).trans (OriginalRow227TriangleLookupRow061.block0887_lookup i)

theorem block0887_value (i : Fin 29) :
    OriginalRow227TriangleLookup.T 61 (412 + i.val) = (values0887[i.val]'(by rw [values0887_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0887_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0876_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0876_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0877_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0877_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0878_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0878_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0879_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0879_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0880_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0880_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0881_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0881_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0882_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0882_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0883_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0883_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0884_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0884_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0885_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0885_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0886_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0886_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0887_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061.block0887_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061
