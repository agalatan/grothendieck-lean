import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow014

theorem block0222_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (13 + i.val) = some (values0222[i.val]'(by rw [values0222_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0222_lookup i)

theorem block0222_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (13 + i.val) = (values0222[i.val]'(by rw [values0222_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0222_lookup i)

theorem block0223_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (45 + i.val) = some (values0223[i.val]'(by rw [values0223_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0223_lookup i)

theorem block0223_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (45 + i.val) = (values0223[i.val]'(by rw [values0223_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0223_lookup i)

theorem block0224_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (77 + i.val) = some (values0224[i.val]'(by rw [values0224_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0224_lookup i)

theorem block0224_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (77 + i.val) = (values0224[i.val]'(by rw [values0224_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0224_lookup i)

theorem block0225_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (109 + i.val) = some (values0225[i.val]'(by rw [values0225_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0225_lookup i)

theorem block0225_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (109 + i.val) = (values0225[i.val]'(by rw [values0225_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0225_lookup i)

theorem block0226_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (141 + i.val) = some (values0226[i.val]'(by rw [values0226_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0226_lookup i)

theorem block0226_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (141 + i.val) = (values0226[i.val]'(by rw [values0226_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0226_lookup i)

theorem block0227_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (173 + i.val) = some (values0227[i.val]'(by rw [values0227_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0227_lookup i)

theorem block0227_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (173 + i.val) = (values0227[i.val]'(by rw [values0227_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0227_lookup i)

theorem block0228_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (205 + i.val) = some (values0228[i.val]'(by rw [values0228_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0228_lookup i)

theorem block0228_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (205 + i.val) = (values0228[i.val]'(by rw [values0228_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0228_lookup i)

theorem block0229_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (237 + i.val) = some (values0229[i.val]'(by rw [values0229_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0229_lookup i)

theorem block0229_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (237 + i.val) = (values0229[i.val]'(by rw [values0229_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0229_lookup i)

theorem block0230_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (269 + i.val) = some (values0230[i.val]'(by rw [values0230_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0230_lookup i)

theorem block0230_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (269 + i.val) = (values0230[i.val]'(by rw [values0230_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0230_lookup i)

theorem block0231_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (301 + i.val) = some (values0231[i.val]'(by rw [values0231_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0231_lookup i)

theorem block0231_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (301 + i.val) = (values0231[i.val]'(by rw [values0231_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0231_lookup i)

theorem block0232_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (333 + i.val) = some (values0232[i.val]'(by rw [values0232_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0232_lookup i)

theorem block0232_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (333 + i.val) = (values0232[i.val]'(by rw [values0232_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0232_lookup i)

theorem block0233_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (365 + i.val) = some (values0233[i.val]'(by rw [values0233_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0233_lookup i)

theorem block0233_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (365 + i.val) = (values0233[i.val]'(by rw [values0233_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0233_lookup i)

theorem block0234_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (397 + i.val) = some (values0234[i.val]'(by rw [values0234_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0234_lookup i)

theorem block0234_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (397 + i.val) = (values0234[i.val]'(by rw [values0234_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0234_lookup i)

theorem block0235_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 14 (429 + i.val) = some (values0235[i.val]'(by rw [values0235_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0235_lookup i)

theorem block0235_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 14 (429 + i.val) = (values0235[i.val]'(by rw [values0235_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0235_lookup i)

theorem block0236_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 14 (461 + i.val) = some (values0236[i.val]'(by rw [values0236_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row014_lookup _).trans (OriginalRow227TriangleLookupRow014.block0236_lookup i)

theorem block0236_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 14 (461 + i.val) = (values0236[i.val]'(by rw [values0236_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0236_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0222_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0222_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0223_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0223_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0224_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0224_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0225_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0225_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0226_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0226_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0227_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0227_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0228_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0228_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0229_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0229_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0230_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0230_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0231_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0231_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0232_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0232_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0233_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0233_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0234_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0234_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0235_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0235_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0236_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014.block0236_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014
