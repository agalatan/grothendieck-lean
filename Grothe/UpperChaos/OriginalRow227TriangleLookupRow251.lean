import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2111

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow251

open ConditionalTableLookup

def values2111 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2111.coefficient251_250
]

theorem values2111_size : values2111.size = 1 := rfl

def block2111 : ℕ → Option IntervalDyadic := segment 250 values2111

theorem block2111_domain : ExactDomain block2111 250 251 := by
  simpa only [values2111_size] using segment_domain 250 values2111

theorem block2111_get (i : Fin 1) :
    block2111 (250 + i.val) = some (values2111[i.val]'(by rw [values2111_size]; exact i.isLt)) := by
  exact segment_get 250 values2111 ⟨i.val, by rw [values2111_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2111

theorem lookup_domain : ExactDomain lookup 250 251 :=
  block2111_domain

theorem block2111_lookup (i : Fin 1) :
    lookup (250 + i.val) = some (values2111[i.val]'(by rw [values2111_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2111 (250 + i.val) = _
  exact block2111_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow251.block2111_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow251.block2111_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow251.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow251.block2111_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow251
