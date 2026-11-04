import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow068

theorem block0960_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (67 + i.val) = some (values0960[i.val]'(by rw [values0960_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0960_lookup i)

theorem block0960_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (67 + i.val) = (values0960[i.val]'(by rw [values0960_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0960_lookup i)

theorem block0961_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (99 + i.val) = some (values0961[i.val]'(by rw [values0961_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0961_lookup i)

theorem block0961_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (99 + i.val) = (values0961[i.val]'(by rw [values0961_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0961_lookup i)

theorem block0962_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (131 + i.val) = some (values0962[i.val]'(by rw [values0962_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0962_lookup i)

theorem block0962_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (131 + i.val) = (values0962[i.val]'(by rw [values0962_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0962_lookup i)

theorem block0963_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (163 + i.val) = some (values0963[i.val]'(by rw [values0963_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0963_lookup i)

theorem block0963_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (163 + i.val) = (values0963[i.val]'(by rw [values0963_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0963_lookup i)

theorem block0964_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (195 + i.val) = some (values0964[i.val]'(by rw [values0964_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0964_lookup i)

theorem block0964_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (195 + i.val) = (values0964[i.val]'(by rw [values0964_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0964_lookup i)

theorem block0965_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (227 + i.val) = some (values0965[i.val]'(by rw [values0965_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0965_lookup i)

theorem block0965_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (227 + i.val) = (values0965[i.val]'(by rw [values0965_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0965_lookup i)

theorem block0966_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (259 + i.val) = some (values0966[i.val]'(by rw [values0966_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0966_lookup i)

theorem block0966_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (259 + i.val) = (values0966[i.val]'(by rw [values0966_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0966_lookup i)

theorem block0967_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (291 + i.val) = some (values0967[i.val]'(by rw [values0967_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0967_lookup i)

theorem block0967_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (291 + i.val) = (values0967[i.val]'(by rw [values0967_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0967_lookup i)

theorem block0968_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (323 + i.val) = some (values0968[i.val]'(by rw [values0968_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0968_lookup i)

theorem block0968_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (323 + i.val) = (values0968[i.val]'(by rw [values0968_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0968_lookup i)

theorem block0969_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (355 + i.val) = some (values0969[i.val]'(by rw [values0969_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0969_lookup i)

theorem block0969_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (355 + i.val) = (values0969[i.val]'(by rw [values0969_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0969_lookup i)

theorem block0970_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 68 (387 + i.val) = some (values0970[i.val]'(by rw [values0970_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0970_lookup i)

theorem block0970_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 68 (387 + i.val) = (values0970[i.val]'(by rw [values0970_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0970_lookup i)

theorem block0971_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 68 (419 + i.val) = some (values0971[i.val]'(by rw [values0971_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row068_lookup _).trans (OriginalRow227TriangleLookupRow068.block0971_lookup i)

theorem block0971_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 68 (419 + i.val) = (values0971[i.val]'(by rw [values0971_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0971_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0960_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0960_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0961_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0961_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0962_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0962_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0963_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0963_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0964_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0964_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0965_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0965_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0966_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0966_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0967_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0967_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0968_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0968_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0969_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0969_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0970_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0970_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0971_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068.block0971_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068
