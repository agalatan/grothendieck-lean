import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2028
import Grothe.UpperChaos.OriginalRow227TriangleData2029
import Grothe.UpperChaos.OriginalRow227TriangleData2030

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow208

open ConditionalTableLookup

def values2028 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2028.coefficient208_207,
  OriginalRow227TriangleData2028.coefficient208_208,
  OriginalRow227TriangleData2028.coefficient208_209,
  OriginalRow227TriangleData2028.coefficient208_210,
  OriginalRow227TriangleData2028.coefficient208_211,
  OriginalRow227TriangleData2028.coefficient208_212,
  OriginalRow227TriangleData2028.coefficient208_213,
  OriginalRow227TriangleData2028.coefficient208_214,
  OriginalRow227TriangleData2028.coefficient208_215,
  OriginalRow227TriangleData2028.coefficient208_216,
  OriginalRow227TriangleData2028.coefficient208_217,
  OriginalRow227TriangleData2028.coefficient208_218,
  OriginalRow227TriangleData2028.coefficient208_219,
  OriginalRow227TriangleData2028.coefficient208_220,
  OriginalRow227TriangleData2028.coefficient208_221,
  OriginalRow227TriangleData2028.coefficient208_222,
  OriginalRow227TriangleData2028.coefficient208_223,
  OriginalRow227TriangleData2028.coefficient208_224,
  OriginalRow227TriangleData2028.coefficient208_225,
  OriginalRow227TriangleData2028.coefficient208_226,
  OriginalRow227TriangleData2028.coefficient208_227,
  OriginalRow227TriangleData2028.coefficient208_228,
  OriginalRow227TriangleData2028.coefficient208_229,
  OriginalRow227TriangleData2028.coefficient208_230,
  OriginalRow227TriangleData2028.coefficient208_231,
  OriginalRow227TriangleData2028.coefficient208_232,
  OriginalRow227TriangleData2028.coefficient208_233,
  OriginalRow227TriangleData2028.coefficient208_234,
  OriginalRow227TriangleData2028.coefficient208_235,
  OriginalRow227TriangleData2028.coefficient208_236,
  OriginalRow227TriangleData2028.coefficient208_237,
  OriginalRow227TriangleData2028.coefficient208_238
]

theorem values2028_size : values2028.size = 32 := rfl

def block2028 : ℕ → Option IntervalDyadic := segment 207 values2028

theorem block2028_domain : ExactDomain block2028 207 239 := by
  simpa only [values2028_size] using segment_domain 207 values2028

theorem block2028_get (i : Fin 32) :
    block2028 (207 + i.val) = some (values2028[i.val]'(by rw [values2028_size]; exact i.isLt)) := by
  exact segment_get 207 values2028 ⟨i.val, by rw [values2028_size]; exact i.isLt⟩

def values2029 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2029.coefficient208_239,
  OriginalRow227TriangleData2029.coefficient208_240,
  OriginalRow227TriangleData2029.coefficient208_241,
  OriginalRow227TriangleData2029.coefficient208_242,
  OriginalRow227TriangleData2029.coefficient208_243,
  OriginalRow227TriangleData2029.coefficient208_244,
  OriginalRow227TriangleData2029.coefficient208_245,
  OriginalRow227TriangleData2029.coefficient208_246,
  OriginalRow227TriangleData2029.coefficient208_247,
  OriginalRow227TriangleData2029.coefficient208_248,
  OriginalRow227TriangleData2029.coefficient208_249,
  OriginalRow227TriangleData2029.coefficient208_250,
  OriginalRow227TriangleData2029.coefficient208_251,
  OriginalRow227TriangleData2029.coefficient208_252,
  OriginalRow227TriangleData2029.coefficient208_253,
  OriginalRow227TriangleData2029.coefficient208_254,
  OriginalRow227TriangleData2029.coefficient208_255,
  OriginalRow227TriangleData2029.coefficient208_256,
  OriginalRow227TriangleData2029.coefficient208_257,
  OriginalRow227TriangleData2029.coefficient208_258,
  OriginalRow227TriangleData2029.coefficient208_259,
  OriginalRow227TriangleData2029.coefficient208_260,
  OriginalRow227TriangleData2029.coefficient208_261,
  OriginalRow227TriangleData2029.coefficient208_262,
  OriginalRow227TriangleData2029.coefficient208_263,
  OriginalRow227TriangleData2029.coefficient208_264,
  OriginalRow227TriangleData2029.coefficient208_265,
  OriginalRow227TriangleData2029.coefficient208_266,
  OriginalRow227TriangleData2029.coefficient208_267,
  OriginalRow227TriangleData2029.coefficient208_268,
  OriginalRow227TriangleData2029.coefficient208_269,
  OriginalRow227TriangleData2029.coefficient208_270
]

theorem values2029_size : values2029.size = 32 := rfl

def block2029 : ℕ → Option IntervalDyadic := segment 239 values2029

theorem block2029_domain : ExactDomain block2029 239 271 := by
  simpa only [values2029_size] using segment_domain 239 values2029

theorem block2029_get (i : Fin 32) :
    block2029 (239 + i.val) = some (values2029[i.val]'(by rw [values2029_size]; exact i.isLt)) := by
  exact segment_get 239 values2029 ⟨i.val, by rw [values2029_size]; exact i.isLt⟩

def values2030 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2030.coefficient208_271,
  OriginalRow227TriangleData2030.coefficient208_272,
  OriginalRow227TriangleData2030.coefficient208_273,
  OriginalRow227TriangleData2030.coefficient208_274,
  OriginalRow227TriangleData2030.coefficient208_275,
  OriginalRow227TriangleData2030.coefficient208_276,
  OriginalRow227TriangleData2030.coefficient208_277,
  OriginalRow227TriangleData2030.coefficient208_278,
  OriginalRow227TriangleData2030.coefficient208_279,
  OriginalRow227TriangleData2030.coefficient208_280,
  OriginalRow227TriangleData2030.coefficient208_281,
  OriginalRow227TriangleData2030.coefficient208_282,
  OriginalRow227TriangleData2030.coefficient208_283,
  OriginalRow227TriangleData2030.coefficient208_284,
  OriginalRow227TriangleData2030.coefficient208_285,
  OriginalRow227TriangleData2030.coefficient208_286,
  OriginalRow227TriangleData2030.coefficient208_287,
  OriginalRow227TriangleData2030.coefficient208_288,
  OriginalRow227TriangleData2030.coefficient208_289,
  OriginalRow227TriangleData2030.coefficient208_290,
  OriginalRow227TriangleData2030.coefficient208_291,
  OriginalRow227TriangleData2030.coefficient208_292,
  OriginalRow227TriangleData2030.coefficient208_293
]

theorem values2030_size : values2030.size = 23 := rfl

def block2030 : ℕ → Option IntervalDyadic := segment 271 values2030

theorem block2030_domain : ExactDomain block2030 271 294 := by
  simpa only [values2030_size] using segment_domain 271 values2030

theorem block2030_get (i : Fin 23) :
    block2030 (271 + i.val) = some (values2030[i.val]'(by rw [values2030_size]; exact i.isLt)) := by
  exact segment_get 271 values2030 ⟨i.val, by rw [values2030_size]; exact i.isLt⟩

def node0239_0294 : ℕ → Option IntervalDyadic := split 271 block2029 block2030

theorem node0239_0294_domain : ExactDomain node0239_0294 239 294 := by
  exact split_domain (by decide) (by decide) block2029_domain block2030_domain

def node0207_0294 : ℕ → Option IntervalDyadic := split 239 block2028 node0239_0294

theorem node0207_0294_domain : ExactDomain node0207_0294 207 294 := by
  exact split_domain (by decide) (by decide) block2028_domain node0239_0294_domain

def lookup : ℕ → Option IntervalDyadic := node0207_0294

theorem lookup_domain : ExactDomain lookup 207 294 :=
  node0207_0294_domain

theorem block2028_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values2028[i.val]'(by rw [values2028_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0207_0294 (207 + i.val) = _
  rw [node0207_0294, split_left 239 block2028 node0239_0294 (by omega)]
  exact block2028_get i

theorem block2029_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values2029[i.val]'(by rw [values2029_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0207_0294 (239 + i.val) = _
  rw [node0207_0294, split_right 239 block2028 node0239_0294 (by omega)]
  rw [node0239_0294, split_left 271 block2029 block2030 (by omega)]
  exact block2029_get i

theorem block2030_lookup (i : Fin 23) :
    lookup (271 + i.val) = some (values2030[i.val]'(by rw [values2030_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0207_0294 (271 + i.val) = _
  rw [node0207_0294, split_right 239 block2028 node0239_0294 (by omega)]
  rw [node0239_0294, split_right 271 block2029 block2030 (by omega)]
  exact block2030_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2028_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2028_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2029_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2029_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2030_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2030_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2028_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2029_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow208.block2030_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow208
