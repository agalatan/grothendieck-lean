import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2104

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow244

open ConditionalTableLookup

def values2104 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2104.coefficient244_243,
  OriginalRow227TriangleData2104.coefficient244_244,
  OriginalRow227TriangleData2104.coefficient244_245,
  OriginalRow227TriangleData2104.coefficient244_246,
  OriginalRow227TriangleData2104.coefficient244_247,
  OriginalRow227TriangleData2104.coefficient244_248,
  OriginalRow227TriangleData2104.coefficient244_249,
  OriginalRow227TriangleData2104.coefficient244_250,
  OriginalRow227TriangleData2104.coefficient244_251,
  OriginalRow227TriangleData2104.coefficient244_252,
  OriginalRow227TriangleData2104.coefficient244_253,
  OriginalRow227TriangleData2104.coefficient244_254,
  OriginalRow227TriangleData2104.coefficient244_255,
  OriginalRow227TriangleData2104.coefficient244_256,
  OriginalRow227TriangleData2104.coefficient244_257
]

theorem values2104_size : values2104.size = 15 := rfl

def block2104 : ℕ → Option IntervalDyadic := segment 243 values2104

theorem block2104_domain : ExactDomain block2104 243 258 := by
  simpa only [values2104_size] using segment_domain 243 values2104

theorem block2104_get (i : Fin 15) :
    block2104 (243 + i.val) = some (values2104[i.val]'(by rw [values2104_size]; exact i.isLt)) := by
  exact segment_get 243 values2104 ⟨i.val, by rw [values2104_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2104

theorem lookup_domain : ExactDomain lookup 243 258 :=
  block2104_domain

theorem block2104_lookup (i : Fin 15) :
    lookup (243 + i.val) = some (values2104[i.val]'(by rw [values2104_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2104 (243 + i.val) = _
  exact block2104_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow244.block2104_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow244.block2104_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow244.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow244.block2104_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow244
