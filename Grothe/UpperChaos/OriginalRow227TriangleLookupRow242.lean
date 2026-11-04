import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2102

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow242

open ConditionalTableLookup

def values2102 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2102.coefficient242_241,
  OriginalRow227TriangleData2102.coefficient242_242,
  OriginalRow227TriangleData2102.coefficient242_243,
  OriginalRow227TriangleData2102.coefficient242_244,
  OriginalRow227TriangleData2102.coefficient242_245,
  OriginalRow227TriangleData2102.coefficient242_246,
  OriginalRow227TriangleData2102.coefficient242_247,
  OriginalRow227TriangleData2102.coefficient242_248,
  OriginalRow227TriangleData2102.coefficient242_249,
  OriginalRow227TriangleData2102.coefficient242_250,
  OriginalRow227TriangleData2102.coefficient242_251,
  OriginalRow227TriangleData2102.coefficient242_252,
  OriginalRow227TriangleData2102.coefficient242_253,
  OriginalRow227TriangleData2102.coefficient242_254,
  OriginalRow227TriangleData2102.coefficient242_255,
  OriginalRow227TriangleData2102.coefficient242_256,
  OriginalRow227TriangleData2102.coefficient242_257,
  OriginalRow227TriangleData2102.coefficient242_258,
  OriginalRow227TriangleData2102.coefficient242_259
]

theorem values2102_size : values2102.size = 19 := rfl

def block2102 : ℕ → Option IntervalDyadic := segment 241 values2102

theorem block2102_domain : ExactDomain block2102 241 260 := by
  simpa only [values2102_size] using segment_domain 241 values2102

theorem block2102_get (i : Fin 19) :
    block2102 (241 + i.val) = some (values2102[i.val]'(by rw [values2102_size]; exact i.isLt)) := by
  exact segment_get 241 values2102 ⟨i.val, by rw [values2102_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2102

theorem lookup_domain : ExactDomain lookup 241 260 :=
  block2102_domain

theorem block2102_lookup (i : Fin 19) :
    lookup (241 + i.val) = some (values2102[i.val]'(by rw [values2102_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2102 (241 + i.val) = _
  exact block2102_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow242.block2102_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow242.block2102_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow242.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow242.block2102_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow242
