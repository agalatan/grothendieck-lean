import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2099

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow239

open ConditionalTableLookup

def values2099 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2099.coefficient239_238,
  OriginalRow227TriangleData2099.coefficient239_239,
  OriginalRow227TriangleData2099.coefficient239_240,
  OriginalRow227TriangleData2099.coefficient239_241,
  OriginalRow227TriangleData2099.coefficient239_242,
  OriginalRow227TriangleData2099.coefficient239_243,
  OriginalRow227TriangleData2099.coefficient239_244,
  OriginalRow227TriangleData2099.coefficient239_245,
  OriginalRow227TriangleData2099.coefficient239_246,
  OriginalRow227TriangleData2099.coefficient239_247,
  OriginalRow227TriangleData2099.coefficient239_248,
  OriginalRow227TriangleData2099.coefficient239_249,
  OriginalRow227TriangleData2099.coefficient239_250,
  OriginalRow227TriangleData2099.coefficient239_251,
  OriginalRow227TriangleData2099.coefficient239_252,
  OriginalRow227TriangleData2099.coefficient239_253,
  OriginalRow227TriangleData2099.coefficient239_254,
  OriginalRow227TriangleData2099.coefficient239_255,
  OriginalRow227TriangleData2099.coefficient239_256,
  OriginalRow227TriangleData2099.coefficient239_257,
  OriginalRow227TriangleData2099.coefficient239_258,
  OriginalRow227TriangleData2099.coefficient239_259,
  OriginalRow227TriangleData2099.coefficient239_260,
  OriginalRow227TriangleData2099.coefficient239_261,
  OriginalRow227TriangleData2099.coefficient239_262
]

theorem values2099_size : values2099.size = 25 := rfl

def block2099 : ℕ → Option IntervalDyadic := segment 238 values2099

theorem block2099_domain : ExactDomain block2099 238 263 := by
  simpa only [values2099_size] using segment_domain 238 values2099

theorem block2099_get (i : Fin 25) :
    block2099 (238 + i.val) = some (values2099[i.val]'(by rw [values2099_size]; exact i.isLt)) := by
  exact segment_get 238 values2099 ⟨i.val, by rw [values2099_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2099

theorem lookup_domain : ExactDomain lookup 238 263 :=
  block2099_domain

theorem block2099_lookup (i : Fin 25) :
    lookup (238 + i.val) = some (values2099[i.val]'(by rw [values2099_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2099 (238 + i.val) = _
  exact block2099_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow239.block2099_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow239.block2099_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow239.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow239.block2099_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow239
