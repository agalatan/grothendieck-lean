import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2105

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow245

open ConditionalTableLookup

def values2105 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2105.coefficient245_244,
  OriginalRow227TriangleData2105.coefficient245_245,
  OriginalRow227TriangleData2105.coefficient245_246,
  OriginalRow227TriangleData2105.coefficient245_247,
  OriginalRow227TriangleData2105.coefficient245_248,
  OriginalRow227TriangleData2105.coefficient245_249,
  OriginalRow227TriangleData2105.coefficient245_250,
  OriginalRow227TriangleData2105.coefficient245_251,
  OriginalRow227TriangleData2105.coefficient245_252,
  OriginalRow227TriangleData2105.coefficient245_253,
  OriginalRow227TriangleData2105.coefficient245_254,
  OriginalRow227TriangleData2105.coefficient245_255,
  OriginalRow227TriangleData2105.coefficient245_256
]

theorem values2105_size : values2105.size = 13 := rfl

def block2105 : ℕ → Option IntervalDyadic := segment 244 values2105

theorem block2105_domain : ExactDomain block2105 244 257 := by
  simpa only [values2105_size] using segment_domain 244 values2105

theorem block2105_get (i : Fin 13) :
    block2105 (244 + i.val) = some (values2105[i.val]'(by rw [values2105_size]; exact i.isLt)) := by
  exact segment_get 244 values2105 ⟨i.val, by rw [values2105_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2105

theorem lookup_domain : ExactDomain lookup 244 257 :=
  block2105_domain

theorem block2105_lookup (i : Fin 13) :
    lookup (244 + i.val) = some (values2105[i.val]'(by rw [values2105_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2105 (244 + i.val) = _
  exact block2105_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow245.block2105_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow245.block2105_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow245.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow245.block2105_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow245
