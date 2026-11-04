import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow147

theorem block1713_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 147 (146 + i.val) = some (values1713[i.val]'(by rw [values1713_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1713_lookup i)

theorem block1713_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 147 (146 + i.val) = (values1713[i.val]'(by rw [values1713_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1713_lookup i)

theorem block1714_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 147 (178 + i.val) = some (values1714[i.val]'(by rw [values1714_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1714_lookup i)

theorem block1714_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 147 (178 + i.val) = (values1714[i.val]'(by rw [values1714_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1714_lookup i)

theorem block1715_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 147 (210 + i.val) = some (values1715[i.val]'(by rw [values1715_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1715_lookup i)

theorem block1715_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 147 (210 + i.val) = (values1715[i.val]'(by rw [values1715_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1715_lookup i)

theorem block1716_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 147 (242 + i.val) = some (values1716[i.val]'(by rw [values1716_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1716_lookup i)

theorem block1716_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 147 (242 + i.val) = (values1716[i.val]'(by rw [values1716_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1716_lookup i)

theorem block1717_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 147 (274 + i.val) = some (values1717[i.val]'(by rw [values1717_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1717_lookup i)

theorem block1717_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 147 (274 + i.val) = (values1717[i.val]'(by rw [values1717_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1717_lookup i)

theorem block1718_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 147 (306 + i.val) = some (values1718[i.val]'(by rw [values1718_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1718_lookup i)

theorem block1718_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 147 (306 + i.val) = (values1718[i.val]'(by rw [values1718_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1718_lookup i)

theorem block1719_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 147 (338 + i.val) = some (values1719[i.val]'(by rw [values1719_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row147_lookup _).trans (OriginalRow227TriangleLookupRow147.block1719_lookup i)

theorem block1719_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 147 (338 + i.val) = (values1719[i.val]'(by rw [values1719_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1719_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1713_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1713_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1714_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1714_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1715_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1715_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1716_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1716_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1717_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1717_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1718_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1718_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1719_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147.block1719_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147
