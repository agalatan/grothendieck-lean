import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow059

theorem block0851_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (58 + i.val) = some (values0851[i.val]'(by rw [values0851_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0851_lookup i)

theorem block0851_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (58 + i.val) = (values0851[i.val]'(by rw [values0851_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0851_lookup i)

theorem block0852_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (90 + i.val) = some (values0852[i.val]'(by rw [values0852_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0852_lookup i)

theorem block0852_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (90 + i.val) = (values0852[i.val]'(by rw [values0852_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0852_lookup i)

theorem block0853_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (122 + i.val) = some (values0853[i.val]'(by rw [values0853_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0853_lookup i)

theorem block0853_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (122 + i.val) = (values0853[i.val]'(by rw [values0853_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0853_lookup i)

theorem block0854_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (154 + i.val) = some (values0854[i.val]'(by rw [values0854_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0854_lookup i)

theorem block0854_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (154 + i.val) = (values0854[i.val]'(by rw [values0854_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0854_lookup i)

theorem block0855_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (186 + i.val) = some (values0855[i.val]'(by rw [values0855_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0855_lookup i)

theorem block0855_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (186 + i.val) = (values0855[i.val]'(by rw [values0855_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0855_lookup i)

theorem block0856_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (218 + i.val) = some (values0856[i.val]'(by rw [values0856_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0856_lookup i)

theorem block0856_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (218 + i.val) = (values0856[i.val]'(by rw [values0856_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0856_lookup i)

theorem block0857_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (250 + i.val) = some (values0857[i.val]'(by rw [values0857_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0857_lookup i)

theorem block0857_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (250 + i.val) = (values0857[i.val]'(by rw [values0857_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0857_lookup i)

theorem block0858_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (282 + i.val) = some (values0858[i.val]'(by rw [values0858_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0858_lookup i)

theorem block0858_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (282 + i.val) = (values0858[i.val]'(by rw [values0858_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0858_lookup i)

theorem block0859_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (314 + i.val) = some (values0859[i.val]'(by rw [values0859_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0859_lookup i)

theorem block0859_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (314 + i.val) = (values0859[i.val]'(by rw [values0859_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0859_lookup i)

theorem block0860_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (346 + i.val) = some (values0860[i.val]'(by rw [values0860_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0860_lookup i)

theorem block0860_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (346 + i.val) = (values0860[i.val]'(by rw [values0860_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0860_lookup i)

theorem block0861_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (378 + i.val) = some (values0861[i.val]'(by rw [values0861_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0861_lookup i)

theorem block0861_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (378 + i.val) = (values0861[i.val]'(by rw [values0861_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0861_lookup i)

theorem block0862_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 59 (410 + i.val) = some (values0862[i.val]'(by rw [values0862_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0862_lookup i)

theorem block0862_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 59 (410 + i.val) = (values0862[i.val]'(by rw [values0862_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0862_lookup i)

theorem block0863_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 59 (442 + i.val) = some (values0863[i.val]'(by rw [values0863_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row059_lookup _).trans (OriginalRow227TriangleLookupRow059.block0863_lookup i)

theorem block0863_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 59 (442 + i.val) = (values0863[i.val]'(by rw [values0863_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0863_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0851_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0851_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0852_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0852_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0853_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0853_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0854_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0854_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0855_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0855_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0856_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0856_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0857_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0857_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0858_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0858_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0859_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0859_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0860_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0860_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0861_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0861_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0862_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0862_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0863_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059.block0863_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059
