import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2080
import Grothe.UpperChaos.OriginalRow227TriangleData2081

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow228

open ConditionalTableLookup

def values2080 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2080.coefficient228_227,
  OriginalRow227TriangleData2080.coefficient228_228,
  OriginalRow227TriangleData2080.coefficient228_229,
  OriginalRow227TriangleData2080.coefficient228_230,
  OriginalRow227TriangleData2080.coefficient228_231,
  OriginalRow227TriangleData2080.coefficient228_232,
  OriginalRow227TriangleData2080.coefficient228_233,
  OriginalRow227TriangleData2080.coefficient228_234,
  OriginalRow227TriangleData2080.coefficient228_235,
  OriginalRow227TriangleData2080.coefficient228_236,
  OriginalRow227TriangleData2080.coefficient228_237,
  OriginalRow227TriangleData2080.coefficient228_238,
  OriginalRow227TriangleData2080.coefficient228_239,
  OriginalRow227TriangleData2080.coefficient228_240,
  OriginalRow227TriangleData2080.coefficient228_241,
  OriginalRow227TriangleData2080.coefficient228_242,
  OriginalRow227TriangleData2080.coefficient228_243,
  OriginalRow227TriangleData2080.coefficient228_244,
  OriginalRow227TriangleData2080.coefficient228_245,
  OriginalRow227TriangleData2080.coefficient228_246,
  OriginalRow227TriangleData2080.coefficient228_247,
  OriginalRow227TriangleData2080.coefficient228_248,
  OriginalRow227TriangleData2080.coefficient228_249,
  OriginalRow227TriangleData2080.coefficient228_250,
  OriginalRow227TriangleData2080.coefficient228_251,
  OriginalRow227TriangleData2080.coefficient228_252,
  OriginalRow227TriangleData2080.coefficient228_253,
  OriginalRow227TriangleData2080.coefficient228_254,
  OriginalRow227TriangleData2080.coefficient228_255,
  OriginalRow227TriangleData2080.coefficient228_256,
  OriginalRow227TriangleData2080.coefficient228_257,
  OriginalRow227TriangleData2080.coefficient228_258
]

theorem values2080_size : values2080.size = 32 := rfl

def block2080 : ℕ → Option IntervalDyadic := segment 227 values2080

theorem block2080_domain : ExactDomain block2080 227 259 := by
  simpa only [values2080_size] using segment_domain 227 values2080

theorem block2080_get (i : Fin 32) :
    block2080 (227 + i.val) = some (values2080[i.val]'(by rw [values2080_size]; exact i.isLt)) := by
  exact segment_get 227 values2080 ⟨i.val, by rw [values2080_size]; exact i.isLt⟩

def values2081 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2081.coefficient228_259,
  OriginalRow227TriangleData2081.coefficient228_260,
  OriginalRow227TriangleData2081.coefficient228_261,
  OriginalRow227TriangleData2081.coefficient228_262,
  OriginalRow227TriangleData2081.coefficient228_263,
  OriginalRow227TriangleData2081.coefficient228_264,
  OriginalRow227TriangleData2081.coefficient228_265,
  OriginalRow227TriangleData2081.coefficient228_266,
  OriginalRow227TriangleData2081.coefficient228_267,
  OriginalRow227TriangleData2081.coefficient228_268,
  OriginalRow227TriangleData2081.coefficient228_269,
  OriginalRow227TriangleData2081.coefficient228_270,
  OriginalRow227TriangleData2081.coefficient228_271,
  OriginalRow227TriangleData2081.coefficient228_272,
  OriginalRow227TriangleData2081.coefficient228_273
]

theorem values2081_size : values2081.size = 15 := rfl

def block2081 : ℕ → Option IntervalDyadic := segment 259 values2081

theorem block2081_domain : ExactDomain block2081 259 274 := by
  simpa only [values2081_size] using segment_domain 259 values2081

theorem block2081_get (i : Fin 15) :
    block2081 (259 + i.val) = some (values2081[i.val]'(by rw [values2081_size]; exact i.isLt)) := by
  exact segment_get 259 values2081 ⟨i.val, by rw [values2081_size]; exact i.isLt⟩

def node0227_0274 : ℕ → Option IntervalDyadic := split 259 block2080 block2081

theorem node0227_0274_domain : ExactDomain node0227_0274 227 274 := by
  exact split_domain (by decide) (by decide) block2080_domain block2081_domain

def lookup : ℕ → Option IntervalDyadic := node0227_0274

theorem lookup_domain : ExactDomain lookup 227 274 :=
  node0227_0274_domain

theorem block2080_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values2080[i.val]'(by rw [values2080_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0227_0274 (227 + i.val) = _
  rw [node0227_0274, split_left 259 block2080 block2081 (by omega)]
  exact block2080_get i

theorem block2081_lookup (i : Fin 15) :
    lookup (259 + i.val) = some (values2081[i.val]'(by rw [values2081_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0227_0274 (259 + i.val) = _
  rw [node0227_0274, split_right 259 block2080 block2081 (by omega)]
  exact block2081_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.block2080_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.block2080_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.block2081_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.block2081_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.block2080_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow228.block2081_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow228
