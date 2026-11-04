import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2100

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow240

open ConditionalTableLookup

def values2100 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2100.coefficient240_239,
  OriginalRow227TriangleData2100.coefficient240_240,
  OriginalRow227TriangleData2100.coefficient240_241,
  OriginalRow227TriangleData2100.coefficient240_242,
  OriginalRow227TriangleData2100.coefficient240_243,
  OriginalRow227TriangleData2100.coefficient240_244,
  OriginalRow227TriangleData2100.coefficient240_245,
  OriginalRow227TriangleData2100.coefficient240_246,
  OriginalRow227TriangleData2100.coefficient240_247,
  OriginalRow227TriangleData2100.coefficient240_248,
  OriginalRow227TriangleData2100.coefficient240_249,
  OriginalRow227TriangleData2100.coefficient240_250,
  OriginalRow227TriangleData2100.coefficient240_251,
  OriginalRow227TriangleData2100.coefficient240_252,
  OriginalRow227TriangleData2100.coefficient240_253,
  OriginalRow227TriangleData2100.coefficient240_254,
  OriginalRow227TriangleData2100.coefficient240_255,
  OriginalRow227TriangleData2100.coefficient240_256,
  OriginalRow227TriangleData2100.coefficient240_257,
  OriginalRow227TriangleData2100.coefficient240_258,
  OriginalRow227TriangleData2100.coefficient240_259,
  OriginalRow227TriangleData2100.coefficient240_260,
  OriginalRow227TriangleData2100.coefficient240_261
]

theorem values2100_size : values2100.size = 23 := rfl

def block2100 : ℕ → Option IntervalDyadic := segment 239 values2100

theorem block2100_domain : ExactDomain block2100 239 262 := by
  simpa only [values2100_size] using segment_domain 239 values2100

theorem block2100_get (i : Fin 23) :
    block2100 (239 + i.val) = some (values2100[i.val]'(by rw [values2100_size]; exact i.isLt)) := by
  exact segment_get 239 values2100 ⟨i.val, by rw [values2100_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2100

theorem lookup_domain : ExactDomain lookup 239 262 :=
  block2100_domain

theorem block2100_lookup (i : Fin 23) :
    lookup (239 + i.val) = some (values2100[i.val]'(by rw [values2100_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2100 (239 + i.val) = _
  exact block2100_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow240.block2100_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow240.block2100_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow240.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow240.block2100_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow240
