import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow165

theorem block1830_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 165 (164 + i.val) = some (values1830[i.val]'(by rw [values1830_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row165_lookup _).trans (OriginalRow227TriangleLookupRow165.block1830_lookup i)

theorem block1830_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 165 (164 + i.val) = (values1830[i.val]'(by rw [values1830_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1830_lookup i)

theorem block1831_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 165 (196 + i.val) = some (values1831[i.val]'(by rw [values1831_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row165_lookup _).trans (OriginalRow227TriangleLookupRow165.block1831_lookup i)

theorem block1831_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 165 (196 + i.val) = (values1831[i.val]'(by rw [values1831_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1831_lookup i)

theorem block1832_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 165 (228 + i.val) = some (values1832[i.val]'(by rw [values1832_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row165_lookup _).trans (OriginalRow227TriangleLookupRow165.block1832_lookup i)

theorem block1832_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 165 (228 + i.val) = (values1832[i.val]'(by rw [values1832_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1832_lookup i)

theorem block1833_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 165 (260 + i.val) = some (values1833[i.val]'(by rw [values1833_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row165_lookup _).trans (OriginalRow227TriangleLookupRow165.block1833_lookup i)

theorem block1833_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 165 (260 + i.val) = (values1833[i.val]'(by rw [values1833_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1833_lookup i)

theorem block1834_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 165 (292 + i.val) = some (values1834[i.val]'(by rw [values1834_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row165_lookup _).trans (OriginalRow227TriangleLookupRow165.block1834_lookup i)

theorem block1834_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 165 (292 + i.val) = (values1834[i.val]'(by rw [values1834_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1834_lookup i)

theorem block1835_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 165 (324 + i.val) = some (values1835[i.val]'(by rw [values1835_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row165_lookup _).trans (OriginalRow227TriangleLookupRow165.block1835_lookup i)

theorem block1835_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 165 (324 + i.val) = (values1835[i.val]'(by rw [values1835_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1835_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1830_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1830_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1831_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1831_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1832_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1832_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1833_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1833_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1834_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1834_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1835_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165.block1835_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165
