import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2106

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow246

open ConditionalTableLookup

def values2106 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2106.coefficient246_245,
  OriginalRow227TriangleData2106.coefficient246_246,
  OriginalRow227TriangleData2106.coefficient246_247,
  OriginalRow227TriangleData2106.coefficient246_248,
  OriginalRow227TriangleData2106.coefficient246_249,
  OriginalRow227TriangleData2106.coefficient246_250,
  OriginalRow227TriangleData2106.coefficient246_251,
  OriginalRow227TriangleData2106.coefficient246_252,
  OriginalRow227TriangleData2106.coefficient246_253,
  OriginalRow227TriangleData2106.coefficient246_254,
  OriginalRow227TriangleData2106.coefficient246_255
]

theorem values2106_size : values2106.size = 11 := rfl

def block2106 : ℕ → Option IntervalDyadic := segment 245 values2106

theorem block2106_domain : ExactDomain block2106 245 256 := by
  simpa only [values2106_size] using segment_domain 245 values2106

theorem block2106_get (i : Fin 11) :
    block2106 (245 + i.val) = some (values2106[i.val]'(by rw [values2106_size]; exact i.isLt)) := by
  exact segment_get 245 values2106 ⟨i.val, by rw [values2106_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2106

theorem lookup_domain : ExactDomain lookup 245 256 :=
  block2106_domain

theorem block2106_lookup (i : Fin 11) :
    lookup (245 + i.val) = some (values2106[i.val]'(by rw [values2106_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2106 (245 + i.val) = _
  exact block2106_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow246.block2106_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow246.block2106_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow246.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow246.block2106_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow246
