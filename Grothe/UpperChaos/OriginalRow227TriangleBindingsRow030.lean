import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow030

theorem block0460_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (29 + i.val) = some (values0460[i.val]'(by rw [values0460_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0460_lookup i)

theorem block0460_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (29 + i.val) = (values0460[i.val]'(by rw [values0460_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0460_lookup i)

theorem block0461_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (61 + i.val) = some (values0461[i.val]'(by rw [values0461_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0461_lookup i)

theorem block0461_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (61 + i.val) = (values0461[i.val]'(by rw [values0461_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0461_lookup i)

theorem block0462_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (93 + i.val) = some (values0462[i.val]'(by rw [values0462_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0462_lookup i)

theorem block0462_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (93 + i.val) = (values0462[i.val]'(by rw [values0462_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0462_lookup i)

theorem block0463_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (125 + i.val) = some (values0463[i.val]'(by rw [values0463_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0463_lookup i)

theorem block0463_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (125 + i.val) = (values0463[i.val]'(by rw [values0463_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0463_lookup i)

theorem block0464_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (157 + i.val) = some (values0464[i.val]'(by rw [values0464_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0464_lookup i)

theorem block0464_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (157 + i.val) = (values0464[i.val]'(by rw [values0464_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0464_lookup i)

theorem block0465_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (189 + i.val) = some (values0465[i.val]'(by rw [values0465_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0465_lookup i)

theorem block0465_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (189 + i.val) = (values0465[i.val]'(by rw [values0465_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0465_lookup i)

theorem block0466_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (221 + i.val) = some (values0466[i.val]'(by rw [values0466_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0466_lookup i)

theorem block0466_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (221 + i.val) = (values0466[i.val]'(by rw [values0466_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0466_lookup i)

theorem block0467_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (253 + i.val) = some (values0467[i.val]'(by rw [values0467_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0467_lookup i)

theorem block0467_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (253 + i.val) = (values0467[i.val]'(by rw [values0467_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0467_lookup i)

theorem block0468_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (285 + i.val) = some (values0468[i.val]'(by rw [values0468_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0468_lookup i)

theorem block0468_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (285 + i.val) = (values0468[i.val]'(by rw [values0468_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0468_lookup i)

theorem block0469_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (317 + i.val) = some (values0469[i.val]'(by rw [values0469_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0469_lookup i)

theorem block0469_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (317 + i.val) = (values0469[i.val]'(by rw [values0469_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0469_lookup i)

theorem block0470_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (349 + i.val) = some (values0470[i.val]'(by rw [values0470_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0470_lookup i)

theorem block0470_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (349 + i.val) = (values0470[i.val]'(by rw [values0470_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0470_lookup i)

theorem block0471_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (381 + i.val) = some (values0471[i.val]'(by rw [values0471_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0471_lookup i)

theorem block0471_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (381 + i.val) = (values0471[i.val]'(by rw [values0471_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0471_lookup i)

theorem block0472_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 30 (413 + i.val) = some (values0472[i.val]'(by rw [values0472_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0472_lookup i)

theorem block0472_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 30 (413 + i.val) = (values0472[i.val]'(by rw [values0472_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0472_lookup i)

theorem block0473_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 30 (445 + i.val) = some (values0473[i.val]'(by rw [values0473_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row030_lookup _).trans (OriginalRow227TriangleLookupRow030.block0473_lookup i)

theorem block0473_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 30 (445 + i.val) = (values0473[i.val]'(by rw [values0473_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0473_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0460_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0460_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0461_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0461_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0462_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0462_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0463_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0463_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0464_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0464_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0465_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0465_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0466_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0466_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0467_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0467_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0468_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0468_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0469_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0469_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0470_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0470_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0471_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0471_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0472_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0472_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0473_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030.block0473_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030
