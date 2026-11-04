import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2103

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow243

open ConditionalTableLookup

def values2103 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2103.coefficient243_242,
  OriginalRow227TriangleData2103.coefficient243_243,
  OriginalRow227TriangleData2103.coefficient243_244,
  OriginalRow227TriangleData2103.coefficient243_245,
  OriginalRow227TriangleData2103.coefficient243_246,
  OriginalRow227TriangleData2103.coefficient243_247,
  OriginalRow227TriangleData2103.coefficient243_248,
  OriginalRow227TriangleData2103.coefficient243_249,
  OriginalRow227TriangleData2103.coefficient243_250,
  OriginalRow227TriangleData2103.coefficient243_251,
  OriginalRow227TriangleData2103.coefficient243_252,
  OriginalRow227TriangleData2103.coefficient243_253,
  OriginalRow227TriangleData2103.coefficient243_254,
  OriginalRow227TriangleData2103.coefficient243_255,
  OriginalRow227TriangleData2103.coefficient243_256,
  OriginalRow227TriangleData2103.coefficient243_257,
  OriginalRow227TriangleData2103.coefficient243_258
]

theorem values2103_size : values2103.size = 17 := rfl

def block2103 : ℕ → Option IntervalDyadic := segment 242 values2103

theorem block2103_domain : ExactDomain block2103 242 259 := by
  simpa only [values2103_size] using segment_domain 242 values2103

theorem block2103_get (i : Fin 17) :
    block2103 (242 + i.val) = some (values2103[i.val]'(by rw [values2103_size]; exact i.isLt)) := by
  exact segment_get 242 values2103 ⟨i.val, by rw [values2103_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2103

theorem lookup_domain : ExactDomain lookup 242 259 :=
  block2103_domain

theorem block2103_lookup (i : Fin 17) :
    lookup (242 + i.val) = some (values2103[i.val]'(by rw [values2103_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2103 (242 + i.val) = _
  exact block2103_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow243.block2103_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow243.block2103_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow243.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow243.block2103_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow243
