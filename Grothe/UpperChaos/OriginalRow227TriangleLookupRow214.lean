import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2046
import Grothe.UpperChaos.OriginalRow227TriangleData2047
import Grothe.UpperChaos.OriginalRow227TriangleData2048

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow214

open ConditionalTableLookup

def values2046 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2046.coefficient214_213,
  OriginalRow227TriangleData2046.coefficient214_214,
  OriginalRow227TriangleData2046.coefficient214_215,
  OriginalRow227TriangleData2046.coefficient214_216,
  OriginalRow227TriangleData2046.coefficient214_217,
  OriginalRow227TriangleData2046.coefficient214_218,
  OriginalRow227TriangleData2046.coefficient214_219,
  OriginalRow227TriangleData2046.coefficient214_220,
  OriginalRow227TriangleData2046.coefficient214_221,
  OriginalRow227TriangleData2046.coefficient214_222,
  OriginalRow227TriangleData2046.coefficient214_223,
  OriginalRow227TriangleData2046.coefficient214_224,
  OriginalRow227TriangleData2046.coefficient214_225,
  OriginalRow227TriangleData2046.coefficient214_226,
  OriginalRow227TriangleData2046.coefficient214_227,
  OriginalRow227TriangleData2046.coefficient214_228,
  OriginalRow227TriangleData2046.coefficient214_229,
  OriginalRow227TriangleData2046.coefficient214_230,
  OriginalRow227TriangleData2046.coefficient214_231,
  OriginalRow227TriangleData2046.coefficient214_232,
  OriginalRow227TriangleData2046.coefficient214_233,
  OriginalRow227TriangleData2046.coefficient214_234,
  OriginalRow227TriangleData2046.coefficient214_235,
  OriginalRow227TriangleData2046.coefficient214_236,
  OriginalRow227TriangleData2046.coefficient214_237,
  OriginalRow227TriangleData2046.coefficient214_238,
  OriginalRow227TriangleData2046.coefficient214_239,
  OriginalRow227TriangleData2046.coefficient214_240,
  OriginalRow227TriangleData2046.coefficient214_241,
  OriginalRow227TriangleData2046.coefficient214_242,
  OriginalRow227TriangleData2046.coefficient214_243,
  OriginalRow227TriangleData2046.coefficient214_244
]

theorem values2046_size : values2046.size = 32 := rfl

def block2046 : ℕ → Option IntervalDyadic := segment 213 values2046

theorem block2046_domain : ExactDomain block2046 213 245 := by
  simpa only [values2046_size] using segment_domain 213 values2046

theorem block2046_get (i : Fin 32) :
    block2046 (213 + i.val) = some (values2046[i.val]'(by rw [values2046_size]; exact i.isLt)) := by
  exact segment_get 213 values2046 ⟨i.val, by rw [values2046_size]; exact i.isLt⟩

def values2047 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2047.coefficient214_245,
  OriginalRow227TriangleData2047.coefficient214_246,
  OriginalRow227TriangleData2047.coefficient214_247,
  OriginalRow227TriangleData2047.coefficient214_248,
  OriginalRow227TriangleData2047.coefficient214_249,
  OriginalRow227TriangleData2047.coefficient214_250,
  OriginalRow227TriangleData2047.coefficient214_251,
  OriginalRow227TriangleData2047.coefficient214_252,
  OriginalRow227TriangleData2047.coefficient214_253,
  OriginalRow227TriangleData2047.coefficient214_254,
  OriginalRow227TriangleData2047.coefficient214_255,
  OriginalRow227TriangleData2047.coefficient214_256,
  OriginalRow227TriangleData2047.coefficient214_257,
  OriginalRow227TriangleData2047.coefficient214_258,
  OriginalRow227TriangleData2047.coefficient214_259,
  OriginalRow227TriangleData2047.coefficient214_260,
  OriginalRow227TriangleData2047.coefficient214_261,
  OriginalRow227TriangleData2047.coefficient214_262,
  OriginalRow227TriangleData2047.coefficient214_263,
  OriginalRow227TriangleData2047.coefficient214_264,
  OriginalRow227TriangleData2047.coefficient214_265,
  OriginalRow227TriangleData2047.coefficient214_266,
  OriginalRow227TriangleData2047.coefficient214_267,
  OriginalRow227TriangleData2047.coefficient214_268,
  OriginalRow227TriangleData2047.coefficient214_269,
  OriginalRow227TriangleData2047.coefficient214_270,
  OriginalRow227TriangleData2047.coefficient214_271,
  OriginalRow227TriangleData2047.coefficient214_272,
  OriginalRow227TriangleData2047.coefficient214_273,
  OriginalRow227TriangleData2047.coefficient214_274,
  OriginalRow227TriangleData2047.coefficient214_275,
  OriginalRow227TriangleData2047.coefficient214_276
]

theorem values2047_size : values2047.size = 32 := rfl

def block2047 : ℕ → Option IntervalDyadic := segment 245 values2047

theorem block2047_domain : ExactDomain block2047 245 277 := by
  simpa only [values2047_size] using segment_domain 245 values2047

theorem block2047_get (i : Fin 32) :
    block2047 (245 + i.val) = some (values2047[i.val]'(by rw [values2047_size]; exact i.isLt)) := by
  exact segment_get 245 values2047 ⟨i.val, by rw [values2047_size]; exact i.isLt⟩

def values2048 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2048.coefficient214_277,
  OriginalRow227TriangleData2048.coefficient214_278,
  OriginalRow227TriangleData2048.coefficient214_279,
  OriginalRow227TriangleData2048.coefficient214_280,
  OriginalRow227TriangleData2048.coefficient214_281,
  OriginalRow227TriangleData2048.coefficient214_282,
  OriginalRow227TriangleData2048.coefficient214_283,
  OriginalRow227TriangleData2048.coefficient214_284,
  OriginalRow227TriangleData2048.coefficient214_285,
  OriginalRow227TriangleData2048.coefficient214_286,
  OriginalRow227TriangleData2048.coefficient214_287
]

theorem values2048_size : values2048.size = 11 := rfl

def block2048 : ℕ → Option IntervalDyadic := segment 277 values2048

theorem block2048_domain : ExactDomain block2048 277 288 := by
  simpa only [values2048_size] using segment_domain 277 values2048

theorem block2048_get (i : Fin 11) :
    block2048 (277 + i.val) = some (values2048[i.val]'(by rw [values2048_size]; exact i.isLt)) := by
  exact segment_get 277 values2048 ⟨i.val, by rw [values2048_size]; exact i.isLt⟩

def node0245_0288 : ℕ → Option IntervalDyadic := split 277 block2047 block2048

theorem node0245_0288_domain : ExactDomain node0245_0288 245 288 := by
  exact split_domain (by decide) (by decide) block2047_domain block2048_domain

def node0213_0288 : ℕ → Option IntervalDyadic := split 245 block2046 node0245_0288

theorem node0213_0288_domain : ExactDomain node0213_0288 213 288 := by
  exact split_domain (by decide) (by decide) block2046_domain node0245_0288_domain

def lookup : ℕ → Option IntervalDyadic := node0213_0288

theorem lookup_domain : ExactDomain lookup 213 288 :=
  node0213_0288_domain

theorem block2046_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values2046[i.val]'(by rw [values2046_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0213_0288 (213 + i.val) = _
  rw [node0213_0288, split_left 245 block2046 node0245_0288 (by omega)]
  exact block2046_get i

theorem block2047_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values2047[i.val]'(by rw [values2047_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0213_0288 (245 + i.val) = _
  rw [node0213_0288, split_right 245 block2046 node0245_0288 (by omega)]
  rw [node0245_0288, split_left 277 block2047 block2048 (by omega)]
  exact block2047_get i

theorem block2048_lookup (i : Fin 11) :
    lookup (277 + i.val) = some (values2048[i.val]'(by rw [values2048_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0213_0288 (277 + i.val) = _
  rw [node0213_0288, split_right 245 block2046 node0245_0288 (by omega)]
  rw [node0245_0288, split_right 277 block2047 block2048 (by omega)]
  exact block2048_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2046_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2046_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2047_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2047_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2048_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2048_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2046_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2047_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow214.block2048_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow214
