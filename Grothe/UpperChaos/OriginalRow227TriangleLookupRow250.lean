import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2110

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow250

open ConditionalTableLookup

def values2110 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2110.coefficient250_249,
  OriginalRow227TriangleData2110.coefficient250_250,
  OriginalRow227TriangleData2110.coefficient250_251
]

theorem values2110_size : values2110.size = 3 := rfl

def block2110 : ℕ → Option IntervalDyadic := segment 249 values2110

theorem block2110_domain : ExactDomain block2110 249 252 := by
  simpa only [values2110_size] using segment_domain 249 values2110

theorem block2110_get (i : Fin 3) :
    block2110 (249 + i.val) = some (values2110[i.val]'(by rw [values2110_size]; exact i.isLt)) := by
  exact segment_get 249 values2110 ⟨i.val, by rw [values2110_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2110

theorem lookup_domain : ExactDomain lookup 249 252 :=
  block2110_domain

theorem block2110_lookup (i : Fin 3) :
    lookup (249 + i.val) = some (values2110[i.val]'(by rw [values2110_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2110 (249 + i.val) = _
  exact block2110_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow250.block2110_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow250.block2110_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow250.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow250.block2110_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow250
