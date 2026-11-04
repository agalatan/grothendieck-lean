import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2097

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow237

open ConditionalTableLookup

def values2097 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2097.coefficient237_236,
  OriginalRow227TriangleData2097.coefficient237_237,
  OriginalRow227TriangleData2097.coefficient237_238,
  OriginalRow227TriangleData2097.coefficient237_239,
  OriginalRow227TriangleData2097.coefficient237_240,
  OriginalRow227TriangleData2097.coefficient237_241,
  OriginalRow227TriangleData2097.coefficient237_242,
  OriginalRow227TriangleData2097.coefficient237_243,
  OriginalRow227TriangleData2097.coefficient237_244,
  OriginalRow227TriangleData2097.coefficient237_245,
  OriginalRow227TriangleData2097.coefficient237_246,
  OriginalRow227TriangleData2097.coefficient237_247,
  OriginalRow227TriangleData2097.coefficient237_248,
  OriginalRow227TriangleData2097.coefficient237_249,
  OriginalRow227TriangleData2097.coefficient237_250,
  OriginalRow227TriangleData2097.coefficient237_251,
  OriginalRow227TriangleData2097.coefficient237_252,
  OriginalRow227TriangleData2097.coefficient237_253,
  OriginalRow227TriangleData2097.coefficient237_254,
  OriginalRow227TriangleData2097.coefficient237_255,
  OriginalRow227TriangleData2097.coefficient237_256,
  OriginalRow227TriangleData2097.coefficient237_257,
  OriginalRow227TriangleData2097.coefficient237_258,
  OriginalRow227TriangleData2097.coefficient237_259,
  OriginalRow227TriangleData2097.coefficient237_260,
  OriginalRow227TriangleData2097.coefficient237_261,
  OriginalRow227TriangleData2097.coefficient237_262,
  OriginalRow227TriangleData2097.coefficient237_263,
  OriginalRow227TriangleData2097.coefficient237_264
]

theorem values2097_size : values2097.size = 29 := rfl

def block2097 : ℕ → Option IntervalDyadic := segment 236 values2097

theorem block2097_domain : ExactDomain block2097 236 265 := by
  simpa only [values2097_size] using segment_domain 236 values2097

theorem block2097_get (i : Fin 29) :
    block2097 (236 + i.val) = some (values2097[i.val]'(by rw [values2097_size]; exact i.isLt)) := by
  exact segment_get 236 values2097 ⟨i.val, by rw [values2097_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2097

theorem lookup_domain : ExactDomain lookup 236 265 :=
  block2097_domain

theorem block2097_lookup (i : Fin 29) :
    lookup (236 + i.val) = some (values2097[i.val]'(by rw [values2097_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2097 (236 + i.val) = _
  exact block2097_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow237.block2097_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow237.block2097_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow237.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow237.block2097_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow237
