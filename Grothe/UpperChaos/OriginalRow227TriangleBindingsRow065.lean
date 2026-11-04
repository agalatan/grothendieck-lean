import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow065

theorem block0924_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (64 + i.val) = some (values0924[i.val]'(by rw [values0924_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0924_lookup i)

theorem block0924_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (64 + i.val) = (values0924[i.val]'(by rw [values0924_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0924_lookup i)

theorem block0925_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (96 + i.val) = some (values0925[i.val]'(by rw [values0925_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0925_lookup i)

theorem block0925_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (96 + i.val) = (values0925[i.val]'(by rw [values0925_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0925_lookup i)

theorem block0926_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (128 + i.val) = some (values0926[i.val]'(by rw [values0926_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0926_lookup i)

theorem block0926_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (128 + i.val) = (values0926[i.val]'(by rw [values0926_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0926_lookup i)

theorem block0927_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (160 + i.val) = some (values0927[i.val]'(by rw [values0927_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0927_lookup i)

theorem block0927_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (160 + i.val) = (values0927[i.val]'(by rw [values0927_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0927_lookup i)

theorem block0928_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (192 + i.val) = some (values0928[i.val]'(by rw [values0928_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0928_lookup i)

theorem block0928_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (192 + i.val) = (values0928[i.val]'(by rw [values0928_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0928_lookup i)

theorem block0929_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (224 + i.val) = some (values0929[i.val]'(by rw [values0929_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0929_lookup i)

theorem block0929_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (224 + i.val) = (values0929[i.val]'(by rw [values0929_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0929_lookup i)

theorem block0930_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (256 + i.val) = some (values0930[i.val]'(by rw [values0930_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0930_lookup i)

theorem block0930_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (256 + i.val) = (values0930[i.val]'(by rw [values0930_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0930_lookup i)

theorem block0931_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (288 + i.val) = some (values0931[i.val]'(by rw [values0931_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0931_lookup i)

theorem block0931_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (288 + i.val) = (values0931[i.val]'(by rw [values0931_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0931_lookup i)

theorem block0932_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (320 + i.val) = some (values0932[i.val]'(by rw [values0932_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0932_lookup i)

theorem block0932_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (320 + i.val) = (values0932[i.val]'(by rw [values0932_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0932_lookup i)

theorem block0933_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (352 + i.val) = some (values0933[i.val]'(by rw [values0933_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0933_lookup i)

theorem block0933_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (352 + i.val) = (values0933[i.val]'(by rw [values0933_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0933_lookup i)

theorem block0934_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 65 (384 + i.val) = some (values0934[i.val]'(by rw [values0934_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0934_lookup i)

theorem block0934_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 65 (384 + i.val) = (values0934[i.val]'(by rw [values0934_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0934_lookup i)

theorem block0935_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 65 (416 + i.val) = some (values0935[i.val]'(by rw [values0935_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row065_lookup _).trans (OriginalRow227TriangleLookupRow065.block0935_lookup i)

theorem block0935_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 65 (416 + i.val) = (values0935[i.val]'(by rw [values0935_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0935_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0924_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0924_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0925_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0925_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0926_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0926_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0927_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0927_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0928_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0928_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0929_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0929_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0930_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0930_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0931_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0931_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0932_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0932_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0933_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0933_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0934_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0934_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0935_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065.block0935_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065
