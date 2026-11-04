import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2058
import Grothe.UpperChaos.OriginalRow227TriangleData2059
import Grothe.UpperChaos.OriginalRow227TriangleData2060

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow218

open ConditionalTableLookup

def values2058 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2058.coefficient218_217,
  OriginalRow227TriangleData2058.coefficient218_218,
  OriginalRow227TriangleData2058.coefficient218_219,
  OriginalRow227TriangleData2058.coefficient218_220,
  OriginalRow227TriangleData2058.coefficient218_221,
  OriginalRow227TriangleData2058.coefficient218_222,
  OriginalRow227TriangleData2058.coefficient218_223,
  OriginalRow227TriangleData2058.coefficient218_224,
  OriginalRow227TriangleData2058.coefficient218_225,
  OriginalRow227TriangleData2058.coefficient218_226,
  OriginalRow227TriangleData2058.coefficient218_227,
  OriginalRow227TriangleData2058.coefficient218_228,
  OriginalRow227TriangleData2058.coefficient218_229,
  OriginalRow227TriangleData2058.coefficient218_230,
  OriginalRow227TriangleData2058.coefficient218_231,
  OriginalRow227TriangleData2058.coefficient218_232,
  OriginalRow227TriangleData2058.coefficient218_233,
  OriginalRow227TriangleData2058.coefficient218_234,
  OriginalRow227TriangleData2058.coefficient218_235,
  OriginalRow227TriangleData2058.coefficient218_236,
  OriginalRow227TriangleData2058.coefficient218_237,
  OriginalRow227TriangleData2058.coefficient218_238,
  OriginalRow227TriangleData2058.coefficient218_239,
  OriginalRow227TriangleData2058.coefficient218_240,
  OriginalRow227TriangleData2058.coefficient218_241,
  OriginalRow227TriangleData2058.coefficient218_242,
  OriginalRow227TriangleData2058.coefficient218_243,
  OriginalRow227TriangleData2058.coefficient218_244,
  OriginalRow227TriangleData2058.coefficient218_245,
  OriginalRow227TriangleData2058.coefficient218_246,
  OriginalRow227TriangleData2058.coefficient218_247,
  OriginalRow227TriangleData2058.coefficient218_248
]

theorem values2058_size : values2058.size = 32 := rfl

def block2058 : ℕ → Option IntervalDyadic := segment 217 values2058

theorem block2058_domain : ExactDomain block2058 217 249 := by
  simpa only [values2058_size] using segment_domain 217 values2058

theorem block2058_get (i : Fin 32) :
    block2058 (217 + i.val) = some (values2058[i.val]'(by rw [values2058_size]; exact i.isLt)) := by
  exact segment_get 217 values2058 ⟨i.val, by rw [values2058_size]; exact i.isLt⟩

def values2059 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2059.coefficient218_249,
  OriginalRow227TriangleData2059.coefficient218_250,
  OriginalRow227TriangleData2059.coefficient218_251,
  OriginalRow227TriangleData2059.coefficient218_252,
  OriginalRow227TriangleData2059.coefficient218_253,
  OriginalRow227TriangleData2059.coefficient218_254,
  OriginalRow227TriangleData2059.coefficient218_255,
  OriginalRow227TriangleData2059.coefficient218_256,
  OriginalRow227TriangleData2059.coefficient218_257,
  OriginalRow227TriangleData2059.coefficient218_258,
  OriginalRow227TriangleData2059.coefficient218_259,
  OriginalRow227TriangleData2059.coefficient218_260,
  OriginalRow227TriangleData2059.coefficient218_261,
  OriginalRow227TriangleData2059.coefficient218_262,
  OriginalRow227TriangleData2059.coefficient218_263,
  OriginalRow227TriangleData2059.coefficient218_264,
  OriginalRow227TriangleData2059.coefficient218_265,
  OriginalRow227TriangleData2059.coefficient218_266,
  OriginalRow227TriangleData2059.coefficient218_267,
  OriginalRow227TriangleData2059.coefficient218_268,
  OriginalRow227TriangleData2059.coefficient218_269,
  OriginalRow227TriangleData2059.coefficient218_270,
  OriginalRow227TriangleData2059.coefficient218_271,
  OriginalRow227TriangleData2059.coefficient218_272,
  OriginalRow227TriangleData2059.coefficient218_273,
  OriginalRow227TriangleData2059.coefficient218_274,
  OriginalRow227TriangleData2059.coefficient218_275,
  OriginalRow227TriangleData2059.coefficient218_276,
  OriginalRow227TriangleData2059.coefficient218_277,
  OriginalRow227TriangleData2059.coefficient218_278,
  OriginalRow227TriangleData2059.coefficient218_279,
  OriginalRow227TriangleData2059.coefficient218_280
]

theorem values2059_size : values2059.size = 32 := rfl

def block2059 : ℕ → Option IntervalDyadic := segment 249 values2059

theorem block2059_domain : ExactDomain block2059 249 281 := by
  simpa only [values2059_size] using segment_domain 249 values2059

theorem block2059_get (i : Fin 32) :
    block2059 (249 + i.val) = some (values2059[i.val]'(by rw [values2059_size]; exact i.isLt)) := by
  exact segment_get 249 values2059 ⟨i.val, by rw [values2059_size]; exact i.isLt⟩

def values2060 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2060.coefficient218_281,
  OriginalRow227TriangleData2060.coefficient218_282,
  OriginalRow227TriangleData2060.coefficient218_283
]

theorem values2060_size : values2060.size = 3 := rfl

def block2060 : ℕ → Option IntervalDyadic := segment 281 values2060

theorem block2060_domain : ExactDomain block2060 281 284 := by
  simpa only [values2060_size] using segment_domain 281 values2060

theorem block2060_get (i : Fin 3) :
    block2060 (281 + i.val) = some (values2060[i.val]'(by rw [values2060_size]; exact i.isLt)) := by
  exact segment_get 281 values2060 ⟨i.val, by rw [values2060_size]; exact i.isLt⟩

def node0249_0284 : ℕ → Option IntervalDyadic := split 281 block2059 block2060

theorem node0249_0284_domain : ExactDomain node0249_0284 249 284 := by
  exact split_domain (by decide) (by decide) block2059_domain block2060_domain

def node0217_0284 : ℕ → Option IntervalDyadic := split 249 block2058 node0249_0284

theorem node0217_0284_domain : ExactDomain node0217_0284 217 284 := by
  exact split_domain (by decide) (by decide) block2058_domain node0249_0284_domain

def lookup : ℕ → Option IntervalDyadic := node0217_0284

theorem lookup_domain : ExactDomain lookup 217 284 :=
  node0217_0284_domain

theorem block2058_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values2058[i.val]'(by rw [values2058_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0217_0284 (217 + i.val) = _
  rw [node0217_0284, split_left 249 block2058 node0249_0284 (by omega)]
  exact block2058_get i

theorem block2059_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values2059[i.val]'(by rw [values2059_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0217_0284 (249 + i.val) = _
  rw [node0217_0284, split_right 249 block2058 node0249_0284 (by omega)]
  rw [node0249_0284, split_left 281 block2059 block2060 (by omega)]
  exact block2059_get i

theorem block2060_lookup (i : Fin 3) :
    lookup (281 + i.val) = some (values2060[i.val]'(by rw [values2060_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0217_0284 (281 + i.val) = _
  rw [node0217_0284, split_right 249 block2058 node0249_0284 (by omega)]
  rw [node0249_0284, split_right 281 block2059 block2060 (by omega)]
  exact block2060_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2058_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2058_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2059_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2059_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2060_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2060_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2058_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2059_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow218.block2060_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow218
