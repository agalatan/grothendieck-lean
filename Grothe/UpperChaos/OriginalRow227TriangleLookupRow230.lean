import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2084
import Grothe.UpperChaos.OriginalRow227TriangleData2085

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow230

open ConditionalTableLookup

def values2084 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2084.coefficient230_229,
  OriginalRow227TriangleData2084.coefficient230_230,
  OriginalRow227TriangleData2084.coefficient230_231,
  OriginalRow227TriangleData2084.coefficient230_232,
  OriginalRow227TriangleData2084.coefficient230_233,
  OriginalRow227TriangleData2084.coefficient230_234,
  OriginalRow227TriangleData2084.coefficient230_235,
  OriginalRow227TriangleData2084.coefficient230_236,
  OriginalRow227TriangleData2084.coefficient230_237,
  OriginalRow227TriangleData2084.coefficient230_238,
  OriginalRow227TriangleData2084.coefficient230_239,
  OriginalRow227TriangleData2084.coefficient230_240,
  OriginalRow227TriangleData2084.coefficient230_241,
  OriginalRow227TriangleData2084.coefficient230_242,
  OriginalRow227TriangleData2084.coefficient230_243,
  OriginalRow227TriangleData2084.coefficient230_244,
  OriginalRow227TriangleData2084.coefficient230_245,
  OriginalRow227TriangleData2084.coefficient230_246,
  OriginalRow227TriangleData2084.coefficient230_247,
  OriginalRow227TriangleData2084.coefficient230_248,
  OriginalRow227TriangleData2084.coefficient230_249,
  OriginalRow227TriangleData2084.coefficient230_250,
  OriginalRow227TriangleData2084.coefficient230_251,
  OriginalRow227TriangleData2084.coefficient230_252,
  OriginalRow227TriangleData2084.coefficient230_253,
  OriginalRow227TriangleData2084.coefficient230_254,
  OriginalRow227TriangleData2084.coefficient230_255,
  OriginalRow227TriangleData2084.coefficient230_256,
  OriginalRow227TriangleData2084.coefficient230_257,
  OriginalRow227TriangleData2084.coefficient230_258,
  OriginalRow227TriangleData2084.coefficient230_259,
  OriginalRow227TriangleData2084.coefficient230_260
]

theorem values2084_size : values2084.size = 32 := rfl

def block2084 : ℕ → Option IntervalDyadic := segment 229 values2084

theorem block2084_domain : ExactDomain block2084 229 261 := by
  simpa only [values2084_size] using segment_domain 229 values2084

theorem block2084_get (i : Fin 32) :
    block2084 (229 + i.val) = some (values2084[i.val]'(by rw [values2084_size]; exact i.isLt)) := by
  exact segment_get 229 values2084 ⟨i.val, by rw [values2084_size]; exact i.isLt⟩

def values2085 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2085.coefficient230_261,
  OriginalRow227TriangleData2085.coefficient230_262,
  OriginalRow227TriangleData2085.coefficient230_263,
  OriginalRow227TriangleData2085.coefficient230_264,
  OriginalRow227TriangleData2085.coefficient230_265,
  OriginalRow227TriangleData2085.coefficient230_266,
  OriginalRow227TriangleData2085.coefficient230_267,
  OriginalRow227TriangleData2085.coefficient230_268,
  OriginalRow227TriangleData2085.coefficient230_269,
  OriginalRow227TriangleData2085.coefficient230_270,
  OriginalRow227TriangleData2085.coefficient230_271
]

theorem values2085_size : values2085.size = 11 := rfl

def block2085 : ℕ → Option IntervalDyadic := segment 261 values2085

theorem block2085_domain : ExactDomain block2085 261 272 := by
  simpa only [values2085_size] using segment_domain 261 values2085

theorem block2085_get (i : Fin 11) :
    block2085 (261 + i.val) = some (values2085[i.val]'(by rw [values2085_size]; exact i.isLt)) := by
  exact segment_get 261 values2085 ⟨i.val, by rw [values2085_size]; exact i.isLt⟩

def node0229_0272 : ℕ → Option IntervalDyadic := split 261 block2084 block2085

theorem node0229_0272_domain : ExactDomain node0229_0272 229 272 := by
  exact split_domain (by decide) (by decide) block2084_domain block2085_domain

def lookup : ℕ → Option IntervalDyadic := node0229_0272

theorem lookup_domain : ExactDomain lookup 229 272 :=
  node0229_0272_domain

theorem block2084_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values2084[i.val]'(by rw [values2084_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0229_0272 (229 + i.val) = _
  rw [node0229_0272, split_left 261 block2084 block2085 (by omega)]
  exact block2084_get i

theorem block2085_lookup (i : Fin 11) :
    lookup (261 + i.val) = some (values2085[i.val]'(by rw [values2085_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0229_0272 (261 + i.val) = _
  rw [node0229_0272, split_right 261 block2084 block2085 (by omega)]
  exact block2085_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.block2084_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.block2084_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.block2085_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.block2085_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.block2084_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow230.block2085_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow230
