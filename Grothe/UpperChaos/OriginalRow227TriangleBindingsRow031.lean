import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow031

theorem block0474_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (30 + i.val) = some (values0474[i.val]'(by rw [values0474_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0474_lookup i)

theorem block0474_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (30 + i.val) = (values0474[i.val]'(by rw [values0474_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0474_lookup i)

theorem block0475_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (62 + i.val) = some (values0475[i.val]'(by rw [values0475_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0475_lookup i)

theorem block0475_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (62 + i.val) = (values0475[i.val]'(by rw [values0475_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0475_lookup i)

theorem block0476_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (94 + i.val) = some (values0476[i.val]'(by rw [values0476_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0476_lookup i)

theorem block0476_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (94 + i.val) = (values0476[i.val]'(by rw [values0476_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0476_lookup i)

theorem block0477_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (126 + i.val) = some (values0477[i.val]'(by rw [values0477_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0477_lookup i)

theorem block0477_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (126 + i.val) = (values0477[i.val]'(by rw [values0477_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0477_lookup i)

theorem block0478_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (158 + i.val) = some (values0478[i.val]'(by rw [values0478_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0478_lookup i)

theorem block0478_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (158 + i.val) = (values0478[i.val]'(by rw [values0478_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0478_lookup i)

theorem block0479_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (190 + i.val) = some (values0479[i.val]'(by rw [values0479_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0479_lookup i)

theorem block0479_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (190 + i.val) = (values0479[i.val]'(by rw [values0479_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0479_lookup i)

theorem block0480_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (222 + i.val) = some (values0480[i.val]'(by rw [values0480_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0480_lookup i)

theorem block0480_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (222 + i.val) = (values0480[i.val]'(by rw [values0480_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0480_lookup i)

theorem block0481_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (254 + i.val) = some (values0481[i.val]'(by rw [values0481_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0481_lookup i)

theorem block0481_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (254 + i.val) = (values0481[i.val]'(by rw [values0481_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0481_lookup i)

theorem block0482_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (286 + i.val) = some (values0482[i.val]'(by rw [values0482_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0482_lookup i)

theorem block0482_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (286 + i.val) = (values0482[i.val]'(by rw [values0482_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0482_lookup i)

theorem block0483_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (318 + i.val) = some (values0483[i.val]'(by rw [values0483_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0483_lookup i)

theorem block0483_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (318 + i.val) = (values0483[i.val]'(by rw [values0483_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0483_lookup i)

theorem block0484_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (350 + i.val) = some (values0484[i.val]'(by rw [values0484_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0484_lookup i)

theorem block0484_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (350 + i.val) = (values0484[i.val]'(by rw [values0484_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0484_lookup i)

theorem block0485_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (382 + i.val) = some (values0485[i.val]'(by rw [values0485_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0485_lookup i)

theorem block0485_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (382 + i.val) = (values0485[i.val]'(by rw [values0485_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0485_lookup i)

theorem block0486_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 31 (414 + i.val) = some (values0486[i.val]'(by rw [values0486_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0486_lookup i)

theorem block0486_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 31 (414 + i.val) = (values0486[i.val]'(by rw [values0486_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0486_lookup i)

theorem block0487_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 31 (446 + i.val) = some (values0487[i.val]'(by rw [values0487_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row031_lookup _).trans (OriginalRow227TriangleLookupRow031.block0487_lookup i)

theorem block0487_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 31 (446 + i.val) = (values0487[i.val]'(by rw [values0487_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0487_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0474_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0474_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0475_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0475_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0476_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0476_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0477_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0477_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0478_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0478_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0479_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0479_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0480_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0480_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0481_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0481_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0482_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0482_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0483_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0483_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0484_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0484_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0485_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0485_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0486_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0486_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0487_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031.block0487_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow031
