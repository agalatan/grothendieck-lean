import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow145

theorem block1699_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 145 (144 + i.val) = some (values1699[i.val]'(by rw [values1699_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1699_lookup i)

theorem block1699_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 145 (144 + i.val) = (values1699[i.val]'(by rw [values1699_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1699_lookup i)

theorem block1700_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 145 (176 + i.val) = some (values1700[i.val]'(by rw [values1700_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1700_lookup i)

theorem block1700_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 145 (176 + i.val) = (values1700[i.val]'(by rw [values1700_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1700_lookup i)

theorem block1701_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 145 (208 + i.val) = some (values1701[i.val]'(by rw [values1701_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1701_lookup i)

theorem block1701_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 145 (208 + i.val) = (values1701[i.val]'(by rw [values1701_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1701_lookup i)

theorem block1702_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 145 (240 + i.val) = some (values1702[i.val]'(by rw [values1702_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1702_lookup i)

theorem block1702_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 145 (240 + i.val) = (values1702[i.val]'(by rw [values1702_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1702_lookup i)

theorem block1703_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 145 (272 + i.val) = some (values1703[i.val]'(by rw [values1703_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1703_lookup i)

theorem block1703_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 145 (272 + i.val) = (values1703[i.val]'(by rw [values1703_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1703_lookup i)

theorem block1704_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 145 (304 + i.val) = some (values1704[i.val]'(by rw [values1704_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1704_lookup i)

theorem block1704_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 145 (304 + i.val) = (values1704[i.val]'(by rw [values1704_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1704_lookup i)

theorem block1705_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 145 (336 + i.val) = some (values1705[i.val]'(by rw [values1705_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row145_lookup _).trans (OriginalRow227TriangleLookupRow145.block1705_lookup i)

theorem block1705_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 145 (336 + i.val) = (values1705[i.val]'(by rw [values1705_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1705_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1699_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1699_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1700_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1700_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1701_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1701_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1702_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1702_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1703_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1703_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1704_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1704_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1705_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145.block1705_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145
