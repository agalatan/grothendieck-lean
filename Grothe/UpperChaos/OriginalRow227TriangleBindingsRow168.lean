import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow168

theorem block1848_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 168 (167 + i.val) = some (values1848[i.val]'(by rw [values1848_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row168_lookup _).trans (OriginalRow227TriangleLookupRow168.block1848_lookup i)

theorem block1848_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 168 (167 + i.val) = (values1848[i.val]'(by rw [values1848_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1848_lookup i)

theorem block1849_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 168 (199 + i.val) = some (values1849[i.val]'(by rw [values1849_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row168_lookup _).trans (OriginalRow227TriangleLookupRow168.block1849_lookup i)

theorem block1849_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 168 (199 + i.val) = (values1849[i.val]'(by rw [values1849_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1849_lookup i)

theorem block1850_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 168 (231 + i.val) = some (values1850[i.val]'(by rw [values1850_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row168_lookup _).trans (OriginalRow227TriangleLookupRow168.block1850_lookup i)

theorem block1850_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 168 (231 + i.val) = (values1850[i.val]'(by rw [values1850_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1850_lookup i)

theorem block1851_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 168 (263 + i.val) = some (values1851[i.val]'(by rw [values1851_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row168_lookup _).trans (OriginalRow227TriangleLookupRow168.block1851_lookup i)

theorem block1851_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 168 (263 + i.val) = (values1851[i.val]'(by rw [values1851_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1851_lookup i)

theorem block1852_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 168 (295 + i.val) = some (values1852[i.val]'(by rw [values1852_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row168_lookup _).trans (OriginalRow227TriangleLookupRow168.block1852_lookup i)

theorem block1852_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 168 (295 + i.val) = (values1852[i.val]'(by rw [values1852_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1852_lookup i)

theorem block1853_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 168 (327 + i.val) = some (values1853[i.val]'(by rw [values1853_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row168_lookup _).trans (OriginalRow227TriangleLookupRow168.block1853_lookup i)

theorem block1853_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 168 (327 + i.val) = (values1853[i.val]'(by rw [values1853_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1853_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1848_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1848_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1849_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1849_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1850_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1850_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1851_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1851_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1852_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1852_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1853_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168.block1853_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168
