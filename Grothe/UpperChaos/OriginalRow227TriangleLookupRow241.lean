import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2101

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow241

open ConditionalTableLookup

def values2101 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2101.coefficient241_240,
  OriginalRow227TriangleData2101.coefficient241_241,
  OriginalRow227TriangleData2101.coefficient241_242,
  OriginalRow227TriangleData2101.coefficient241_243,
  OriginalRow227TriangleData2101.coefficient241_244,
  OriginalRow227TriangleData2101.coefficient241_245,
  OriginalRow227TriangleData2101.coefficient241_246,
  OriginalRow227TriangleData2101.coefficient241_247,
  OriginalRow227TriangleData2101.coefficient241_248,
  OriginalRow227TriangleData2101.coefficient241_249,
  OriginalRow227TriangleData2101.coefficient241_250,
  OriginalRow227TriangleData2101.coefficient241_251,
  OriginalRow227TriangleData2101.coefficient241_252,
  OriginalRow227TriangleData2101.coefficient241_253,
  OriginalRow227TriangleData2101.coefficient241_254,
  OriginalRow227TriangleData2101.coefficient241_255,
  OriginalRow227TriangleData2101.coefficient241_256,
  OriginalRow227TriangleData2101.coefficient241_257,
  OriginalRow227TriangleData2101.coefficient241_258,
  OriginalRow227TriangleData2101.coefficient241_259,
  OriginalRow227TriangleData2101.coefficient241_260
]

theorem values2101_size : values2101.size = 21 := rfl

def block2101 : ℕ → Option IntervalDyadic := segment 240 values2101

theorem block2101_domain : ExactDomain block2101 240 261 := by
  simpa only [values2101_size] using segment_domain 240 values2101

theorem block2101_get (i : Fin 21) :
    block2101 (240 + i.val) = some (values2101[i.val]'(by rw [values2101_size]; exact i.isLt)) := by
  exact segment_get 240 values2101 ⟨i.val, by rw [values2101_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2101

theorem lookup_domain : ExactDomain lookup 240 261 :=
  block2101_domain

theorem block2101_lookup (i : Fin 21) :
    lookup (240 + i.val) = some (values2101[i.val]'(by rw [values2101_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2101 (240 + i.val) = _
  exact block2101_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow241.block2101_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow241.block2101_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow241.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow241.block2101_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow241
