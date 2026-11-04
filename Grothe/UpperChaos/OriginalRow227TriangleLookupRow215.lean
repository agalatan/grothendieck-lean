import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2049
import Grothe.UpperChaos.OriginalRow227TriangleData2050
import Grothe.UpperChaos.OriginalRow227TriangleData2051

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow215

open ConditionalTableLookup

def values2049 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2049.coefficient215_214,
  OriginalRow227TriangleData2049.coefficient215_215,
  OriginalRow227TriangleData2049.coefficient215_216,
  OriginalRow227TriangleData2049.coefficient215_217,
  OriginalRow227TriangleData2049.coefficient215_218,
  OriginalRow227TriangleData2049.coefficient215_219,
  OriginalRow227TriangleData2049.coefficient215_220,
  OriginalRow227TriangleData2049.coefficient215_221,
  OriginalRow227TriangleData2049.coefficient215_222,
  OriginalRow227TriangleData2049.coefficient215_223,
  OriginalRow227TriangleData2049.coefficient215_224,
  OriginalRow227TriangleData2049.coefficient215_225,
  OriginalRow227TriangleData2049.coefficient215_226,
  OriginalRow227TriangleData2049.coefficient215_227,
  OriginalRow227TriangleData2049.coefficient215_228,
  OriginalRow227TriangleData2049.coefficient215_229,
  OriginalRow227TriangleData2049.coefficient215_230,
  OriginalRow227TriangleData2049.coefficient215_231,
  OriginalRow227TriangleData2049.coefficient215_232,
  OriginalRow227TriangleData2049.coefficient215_233,
  OriginalRow227TriangleData2049.coefficient215_234,
  OriginalRow227TriangleData2049.coefficient215_235,
  OriginalRow227TriangleData2049.coefficient215_236,
  OriginalRow227TriangleData2049.coefficient215_237,
  OriginalRow227TriangleData2049.coefficient215_238,
  OriginalRow227TriangleData2049.coefficient215_239,
  OriginalRow227TriangleData2049.coefficient215_240,
  OriginalRow227TriangleData2049.coefficient215_241,
  OriginalRow227TriangleData2049.coefficient215_242,
  OriginalRow227TriangleData2049.coefficient215_243,
  OriginalRow227TriangleData2049.coefficient215_244,
  OriginalRow227TriangleData2049.coefficient215_245
]

theorem values2049_size : values2049.size = 32 := rfl

def block2049 : ℕ → Option IntervalDyadic := segment 214 values2049

theorem block2049_domain : ExactDomain block2049 214 246 := by
  simpa only [values2049_size] using segment_domain 214 values2049

theorem block2049_get (i : Fin 32) :
    block2049 (214 + i.val) = some (values2049[i.val]'(by rw [values2049_size]; exact i.isLt)) := by
  exact segment_get 214 values2049 ⟨i.val, by rw [values2049_size]; exact i.isLt⟩

def values2050 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2050.coefficient215_246,
  OriginalRow227TriangleData2050.coefficient215_247,
  OriginalRow227TriangleData2050.coefficient215_248,
  OriginalRow227TriangleData2050.coefficient215_249,
  OriginalRow227TriangleData2050.coefficient215_250,
  OriginalRow227TriangleData2050.coefficient215_251,
  OriginalRow227TriangleData2050.coefficient215_252,
  OriginalRow227TriangleData2050.coefficient215_253,
  OriginalRow227TriangleData2050.coefficient215_254,
  OriginalRow227TriangleData2050.coefficient215_255,
  OriginalRow227TriangleData2050.coefficient215_256,
  OriginalRow227TriangleData2050.coefficient215_257,
  OriginalRow227TriangleData2050.coefficient215_258,
  OriginalRow227TriangleData2050.coefficient215_259,
  OriginalRow227TriangleData2050.coefficient215_260,
  OriginalRow227TriangleData2050.coefficient215_261,
  OriginalRow227TriangleData2050.coefficient215_262,
  OriginalRow227TriangleData2050.coefficient215_263,
  OriginalRow227TriangleData2050.coefficient215_264,
  OriginalRow227TriangleData2050.coefficient215_265,
  OriginalRow227TriangleData2050.coefficient215_266,
  OriginalRow227TriangleData2050.coefficient215_267,
  OriginalRow227TriangleData2050.coefficient215_268,
  OriginalRow227TriangleData2050.coefficient215_269,
  OriginalRow227TriangleData2050.coefficient215_270,
  OriginalRow227TriangleData2050.coefficient215_271,
  OriginalRow227TriangleData2050.coefficient215_272,
  OriginalRow227TriangleData2050.coefficient215_273,
  OriginalRow227TriangleData2050.coefficient215_274,
  OriginalRow227TriangleData2050.coefficient215_275,
  OriginalRow227TriangleData2050.coefficient215_276,
  OriginalRow227TriangleData2050.coefficient215_277
]

theorem values2050_size : values2050.size = 32 := rfl

def block2050 : ℕ → Option IntervalDyadic := segment 246 values2050

theorem block2050_domain : ExactDomain block2050 246 278 := by
  simpa only [values2050_size] using segment_domain 246 values2050

theorem block2050_get (i : Fin 32) :
    block2050 (246 + i.val) = some (values2050[i.val]'(by rw [values2050_size]; exact i.isLt)) := by
  exact segment_get 246 values2050 ⟨i.val, by rw [values2050_size]; exact i.isLt⟩

def values2051 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2051.coefficient215_278,
  OriginalRow227TriangleData2051.coefficient215_279,
  OriginalRow227TriangleData2051.coefficient215_280,
  OriginalRow227TriangleData2051.coefficient215_281,
  OriginalRow227TriangleData2051.coefficient215_282,
  OriginalRow227TriangleData2051.coefficient215_283,
  OriginalRow227TriangleData2051.coefficient215_284,
  OriginalRow227TriangleData2051.coefficient215_285,
  OriginalRow227TriangleData2051.coefficient215_286
]

theorem values2051_size : values2051.size = 9 := rfl

def block2051 : ℕ → Option IntervalDyadic := segment 278 values2051

theorem block2051_domain : ExactDomain block2051 278 287 := by
  simpa only [values2051_size] using segment_domain 278 values2051

theorem block2051_get (i : Fin 9) :
    block2051 (278 + i.val) = some (values2051[i.val]'(by rw [values2051_size]; exact i.isLt)) := by
  exact segment_get 278 values2051 ⟨i.val, by rw [values2051_size]; exact i.isLt⟩

def node0246_0287 : ℕ → Option IntervalDyadic := split 278 block2050 block2051

theorem node0246_0287_domain : ExactDomain node0246_0287 246 287 := by
  exact split_domain (by decide) (by decide) block2050_domain block2051_domain

def node0214_0287 : ℕ → Option IntervalDyadic := split 246 block2049 node0246_0287

theorem node0214_0287_domain : ExactDomain node0214_0287 214 287 := by
  exact split_domain (by decide) (by decide) block2049_domain node0246_0287_domain

def lookup : ℕ → Option IntervalDyadic := node0214_0287

theorem lookup_domain : ExactDomain lookup 214 287 :=
  node0214_0287_domain

theorem block2049_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values2049[i.val]'(by rw [values2049_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0214_0287 (214 + i.val) = _
  rw [node0214_0287, split_left 246 block2049 node0246_0287 (by omega)]
  exact block2049_get i

theorem block2050_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values2050[i.val]'(by rw [values2050_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0214_0287 (246 + i.val) = _
  rw [node0214_0287, split_right 246 block2049 node0246_0287 (by omega)]
  rw [node0246_0287, split_left 278 block2050 block2051 (by omega)]
  exact block2050_get i

theorem block2051_lookup (i : Fin 9) :
    lookup (278 + i.val) = some (values2051[i.val]'(by rw [values2051_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0214_0287 (278 + i.val) = _
  rw [node0214_0287, split_right 246 block2049 node0246_0287 (by omega)]
  rw [node0246_0287, split_right 278 block2050 block2051 (by omega)]
  exact block2051_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2049_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2049_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2050_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2050_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2051_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2051_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2049_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2050_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow215.block2051_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow215
