import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2107

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow247

open ConditionalTableLookup

def values2107 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2107.coefficient247_246,
  OriginalRow227TriangleData2107.coefficient247_247,
  OriginalRow227TriangleData2107.coefficient247_248,
  OriginalRow227TriangleData2107.coefficient247_249,
  OriginalRow227TriangleData2107.coefficient247_250,
  OriginalRow227TriangleData2107.coefficient247_251,
  OriginalRow227TriangleData2107.coefficient247_252,
  OriginalRow227TriangleData2107.coefficient247_253,
  OriginalRow227TriangleData2107.coefficient247_254
]

theorem values2107_size : values2107.size = 9 := rfl

def block2107 : ℕ → Option IntervalDyadic := segment 246 values2107

theorem block2107_domain : ExactDomain block2107 246 255 := by
  simpa only [values2107_size] using segment_domain 246 values2107

theorem block2107_get (i : Fin 9) :
    block2107 (246 + i.val) = some (values2107[i.val]'(by rw [values2107_size]; exact i.isLt)) := by
  exact segment_get 246 values2107 ⟨i.val, by rw [values2107_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2107

theorem lookup_domain : ExactDomain lookup 246 255 :=
  block2107_domain

theorem block2107_lookup (i : Fin 9) :
    lookup (246 + i.val) = some (values2107[i.val]'(by rw [values2107_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2107 (246 + i.val) = _
  exact block2107_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow247.block2107_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow247.block2107_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow247.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow247.block2107_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow247
