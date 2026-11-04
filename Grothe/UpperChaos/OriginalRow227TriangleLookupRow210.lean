import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2034
import Grothe.UpperChaos.OriginalRow227TriangleData2035
import Grothe.UpperChaos.OriginalRow227TriangleData2036

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow210

open ConditionalTableLookup

def values2034 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2034.coefficient210_209,
  OriginalRow227TriangleData2034.coefficient210_210,
  OriginalRow227TriangleData2034.coefficient210_211,
  OriginalRow227TriangleData2034.coefficient210_212,
  OriginalRow227TriangleData2034.coefficient210_213,
  OriginalRow227TriangleData2034.coefficient210_214,
  OriginalRow227TriangleData2034.coefficient210_215,
  OriginalRow227TriangleData2034.coefficient210_216,
  OriginalRow227TriangleData2034.coefficient210_217,
  OriginalRow227TriangleData2034.coefficient210_218,
  OriginalRow227TriangleData2034.coefficient210_219,
  OriginalRow227TriangleData2034.coefficient210_220,
  OriginalRow227TriangleData2034.coefficient210_221,
  OriginalRow227TriangleData2034.coefficient210_222,
  OriginalRow227TriangleData2034.coefficient210_223,
  OriginalRow227TriangleData2034.coefficient210_224,
  OriginalRow227TriangleData2034.coefficient210_225,
  OriginalRow227TriangleData2034.coefficient210_226,
  OriginalRow227TriangleData2034.coefficient210_227,
  OriginalRow227TriangleData2034.coefficient210_228,
  OriginalRow227TriangleData2034.coefficient210_229,
  OriginalRow227TriangleData2034.coefficient210_230,
  OriginalRow227TriangleData2034.coefficient210_231,
  OriginalRow227TriangleData2034.coefficient210_232,
  OriginalRow227TriangleData2034.coefficient210_233,
  OriginalRow227TriangleData2034.coefficient210_234,
  OriginalRow227TriangleData2034.coefficient210_235,
  OriginalRow227TriangleData2034.coefficient210_236,
  OriginalRow227TriangleData2034.coefficient210_237,
  OriginalRow227TriangleData2034.coefficient210_238,
  OriginalRow227TriangleData2034.coefficient210_239,
  OriginalRow227TriangleData2034.coefficient210_240
]

theorem values2034_size : values2034.size = 32 := rfl

def block2034 : ℕ → Option IntervalDyadic := segment 209 values2034

theorem block2034_domain : ExactDomain block2034 209 241 := by
  simpa only [values2034_size] using segment_domain 209 values2034

theorem block2034_get (i : Fin 32) :
    block2034 (209 + i.val) = some (values2034[i.val]'(by rw [values2034_size]; exact i.isLt)) := by
  exact segment_get 209 values2034 ⟨i.val, by rw [values2034_size]; exact i.isLt⟩

def values2035 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2035.coefficient210_241,
  OriginalRow227TriangleData2035.coefficient210_242,
  OriginalRow227TriangleData2035.coefficient210_243,
  OriginalRow227TriangleData2035.coefficient210_244,
  OriginalRow227TriangleData2035.coefficient210_245,
  OriginalRow227TriangleData2035.coefficient210_246,
  OriginalRow227TriangleData2035.coefficient210_247,
  OriginalRow227TriangleData2035.coefficient210_248,
  OriginalRow227TriangleData2035.coefficient210_249,
  OriginalRow227TriangleData2035.coefficient210_250,
  OriginalRow227TriangleData2035.coefficient210_251,
  OriginalRow227TriangleData2035.coefficient210_252,
  OriginalRow227TriangleData2035.coefficient210_253,
  OriginalRow227TriangleData2035.coefficient210_254,
  OriginalRow227TriangleData2035.coefficient210_255,
  OriginalRow227TriangleData2035.coefficient210_256,
  OriginalRow227TriangleData2035.coefficient210_257,
  OriginalRow227TriangleData2035.coefficient210_258,
  OriginalRow227TriangleData2035.coefficient210_259,
  OriginalRow227TriangleData2035.coefficient210_260,
  OriginalRow227TriangleData2035.coefficient210_261,
  OriginalRow227TriangleData2035.coefficient210_262,
  OriginalRow227TriangleData2035.coefficient210_263,
  OriginalRow227TriangleData2035.coefficient210_264,
  OriginalRow227TriangleData2035.coefficient210_265,
  OriginalRow227TriangleData2035.coefficient210_266,
  OriginalRow227TriangleData2035.coefficient210_267,
  OriginalRow227TriangleData2035.coefficient210_268,
  OriginalRow227TriangleData2035.coefficient210_269,
  OriginalRow227TriangleData2035.coefficient210_270,
  OriginalRow227TriangleData2035.coefficient210_271,
  OriginalRow227TriangleData2035.coefficient210_272
]

theorem values2035_size : values2035.size = 32 := rfl

def block2035 : ℕ → Option IntervalDyadic := segment 241 values2035

theorem block2035_domain : ExactDomain block2035 241 273 := by
  simpa only [values2035_size] using segment_domain 241 values2035

theorem block2035_get (i : Fin 32) :
    block2035 (241 + i.val) = some (values2035[i.val]'(by rw [values2035_size]; exact i.isLt)) := by
  exact segment_get 241 values2035 ⟨i.val, by rw [values2035_size]; exact i.isLt⟩

def values2036 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2036.coefficient210_273,
  OriginalRow227TriangleData2036.coefficient210_274,
  OriginalRow227TriangleData2036.coefficient210_275,
  OriginalRow227TriangleData2036.coefficient210_276,
  OriginalRow227TriangleData2036.coefficient210_277,
  OriginalRow227TriangleData2036.coefficient210_278,
  OriginalRow227TriangleData2036.coefficient210_279,
  OriginalRow227TriangleData2036.coefficient210_280,
  OriginalRow227TriangleData2036.coefficient210_281,
  OriginalRow227TriangleData2036.coefficient210_282,
  OriginalRow227TriangleData2036.coefficient210_283,
  OriginalRow227TriangleData2036.coefficient210_284,
  OriginalRow227TriangleData2036.coefficient210_285,
  OriginalRow227TriangleData2036.coefficient210_286,
  OriginalRow227TriangleData2036.coefficient210_287,
  OriginalRow227TriangleData2036.coefficient210_288,
  OriginalRow227TriangleData2036.coefficient210_289,
  OriginalRow227TriangleData2036.coefficient210_290,
  OriginalRow227TriangleData2036.coefficient210_291
]

theorem values2036_size : values2036.size = 19 := rfl

def block2036 : ℕ → Option IntervalDyadic := segment 273 values2036

theorem block2036_domain : ExactDomain block2036 273 292 := by
  simpa only [values2036_size] using segment_domain 273 values2036

theorem block2036_get (i : Fin 19) :
    block2036 (273 + i.val) = some (values2036[i.val]'(by rw [values2036_size]; exact i.isLt)) := by
  exact segment_get 273 values2036 ⟨i.val, by rw [values2036_size]; exact i.isLt⟩

def node0241_0292 : ℕ → Option IntervalDyadic := split 273 block2035 block2036

theorem node0241_0292_domain : ExactDomain node0241_0292 241 292 := by
  exact split_domain (by decide) (by decide) block2035_domain block2036_domain

def node0209_0292 : ℕ → Option IntervalDyadic := split 241 block2034 node0241_0292

theorem node0209_0292_domain : ExactDomain node0209_0292 209 292 := by
  exact split_domain (by decide) (by decide) block2034_domain node0241_0292_domain

def lookup : ℕ → Option IntervalDyadic := node0209_0292

theorem lookup_domain : ExactDomain lookup 209 292 :=
  node0209_0292_domain

theorem block2034_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values2034[i.val]'(by rw [values2034_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0209_0292 (209 + i.val) = _
  rw [node0209_0292, split_left 241 block2034 node0241_0292 (by omega)]
  exact block2034_get i

theorem block2035_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values2035[i.val]'(by rw [values2035_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0209_0292 (241 + i.val) = _
  rw [node0209_0292, split_right 241 block2034 node0241_0292 (by omega)]
  rw [node0241_0292, split_left 273 block2035 block2036 (by omega)]
  exact block2035_get i

theorem block2036_lookup (i : Fin 19) :
    lookup (273 + i.val) = some (values2036[i.val]'(by rw [values2036_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0209_0292 (273 + i.val) = _
  rw [node0209_0292, split_right 241 block2034 node0241_0292 (by omega)]
  rw [node0241_0292, split_right 273 block2035 block2036 (by omega)]
  exact block2036_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2034_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2034_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2035_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2035_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2036_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2036_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2034_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2035_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow210.block2036_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow210
