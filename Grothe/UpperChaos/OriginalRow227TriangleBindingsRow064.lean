import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow064

theorem block0912_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (63 + i.val) = some (values0912[i.val]'(by rw [values0912_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0912_lookup i)

theorem block0912_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (63 + i.val) = (values0912[i.val]'(by rw [values0912_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0912_lookup i)

theorem block0913_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (95 + i.val) = some (values0913[i.val]'(by rw [values0913_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0913_lookup i)

theorem block0913_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (95 + i.val) = (values0913[i.val]'(by rw [values0913_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0913_lookup i)

theorem block0914_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (127 + i.val) = some (values0914[i.val]'(by rw [values0914_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0914_lookup i)

theorem block0914_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (127 + i.val) = (values0914[i.val]'(by rw [values0914_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0914_lookup i)

theorem block0915_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (159 + i.val) = some (values0915[i.val]'(by rw [values0915_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0915_lookup i)

theorem block0915_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (159 + i.val) = (values0915[i.val]'(by rw [values0915_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0915_lookup i)

theorem block0916_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (191 + i.val) = some (values0916[i.val]'(by rw [values0916_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0916_lookup i)

theorem block0916_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (191 + i.val) = (values0916[i.val]'(by rw [values0916_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0916_lookup i)

theorem block0917_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (223 + i.val) = some (values0917[i.val]'(by rw [values0917_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0917_lookup i)

theorem block0917_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (223 + i.val) = (values0917[i.val]'(by rw [values0917_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0917_lookup i)

theorem block0918_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (255 + i.val) = some (values0918[i.val]'(by rw [values0918_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0918_lookup i)

theorem block0918_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (255 + i.val) = (values0918[i.val]'(by rw [values0918_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0918_lookup i)

theorem block0919_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (287 + i.val) = some (values0919[i.val]'(by rw [values0919_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0919_lookup i)

theorem block0919_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (287 + i.val) = (values0919[i.val]'(by rw [values0919_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0919_lookup i)

theorem block0920_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (319 + i.val) = some (values0920[i.val]'(by rw [values0920_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0920_lookup i)

theorem block0920_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (319 + i.val) = (values0920[i.val]'(by rw [values0920_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0920_lookup i)

theorem block0921_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (351 + i.val) = some (values0921[i.val]'(by rw [values0921_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0921_lookup i)

theorem block0921_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (351 + i.val) = (values0921[i.val]'(by rw [values0921_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0921_lookup i)

theorem block0922_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 64 (383 + i.val) = some (values0922[i.val]'(by rw [values0922_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0922_lookup i)

theorem block0922_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 64 (383 + i.val) = (values0922[i.val]'(by rw [values0922_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0922_lookup i)

theorem block0923_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 64 (415 + i.val) = some (values0923[i.val]'(by rw [values0923_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row064_lookup _).trans (OriginalRow227TriangleLookupRow064.block0923_lookup i)

theorem block0923_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 64 (415 + i.val) = (values0923[i.val]'(by rw [values0923_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0923_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0912_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0912_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0913_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0913_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0914_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0914_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0915_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0915_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0916_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0916_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0917_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0917_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0918_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0918_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0919_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0919_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0920_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0920_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0921_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0921_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0922_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0922_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0923_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064.block0923_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064
