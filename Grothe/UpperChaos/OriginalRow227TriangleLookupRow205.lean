import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2019
import Grothe.UpperChaos.OriginalRow227TriangleData2020
import Grothe.UpperChaos.OriginalRow227TriangleData2021

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow205

open ConditionalTableLookup

def values2019 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2019.coefficient205_204,
  OriginalRow227TriangleData2019.coefficient205_205,
  OriginalRow227TriangleData2019.coefficient205_206,
  OriginalRow227TriangleData2019.coefficient205_207,
  OriginalRow227TriangleData2019.coefficient205_208,
  OriginalRow227TriangleData2019.coefficient205_209,
  OriginalRow227TriangleData2019.coefficient205_210,
  OriginalRow227TriangleData2019.coefficient205_211,
  OriginalRow227TriangleData2019.coefficient205_212,
  OriginalRow227TriangleData2019.coefficient205_213,
  OriginalRow227TriangleData2019.coefficient205_214,
  OriginalRow227TriangleData2019.coefficient205_215,
  OriginalRow227TriangleData2019.coefficient205_216,
  OriginalRow227TriangleData2019.coefficient205_217,
  OriginalRow227TriangleData2019.coefficient205_218,
  OriginalRow227TriangleData2019.coefficient205_219,
  OriginalRow227TriangleData2019.coefficient205_220,
  OriginalRow227TriangleData2019.coefficient205_221,
  OriginalRow227TriangleData2019.coefficient205_222,
  OriginalRow227TriangleData2019.coefficient205_223,
  OriginalRow227TriangleData2019.coefficient205_224,
  OriginalRow227TriangleData2019.coefficient205_225,
  OriginalRow227TriangleData2019.coefficient205_226,
  OriginalRow227TriangleData2019.coefficient205_227,
  OriginalRow227TriangleData2019.coefficient205_228,
  OriginalRow227TriangleData2019.coefficient205_229,
  OriginalRow227TriangleData2019.coefficient205_230,
  OriginalRow227TriangleData2019.coefficient205_231,
  OriginalRow227TriangleData2019.coefficient205_232,
  OriginalRow227TriangleData2019.coefficient205_233,
  OriginalRow227TriangleData2019.coefficient205_234,
  OriginalRow227TriangleData2019.coefficient205_235
]

theorem values2019_size : values2019.size = 32 := rfl

def block2019 : ℕ → Option IntervalDyadic := segment 204 values2019

theorem block2019_domain : ExactDomain block2019 204 236 := by
  simpa only [values2019_size] using segment_domain 204 values2019

theorem block2019_get (i : Fin 32) :
    block2019 (204 + i.val) = some (values2019[i.val]'(by rw [values2019_size]; exact i.isLt)) := by
  exact segment_get 204 values2019 ⟨i.val, by rw [values2019_size]; exact i.isLt⟩

def values2020 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2020.coefficient205_236,
  OriginalRow227TriangleData2020.coefficient205_237,
  OriginalRow227TriangleData2020.coefficient205_238,
  OriginalRow227TriangleData2020.coefficient205_239,
  OriginalRow227TriangleData2020.coefficient205_240,
  OriginalRow227TriangleData2020.coefficient205_241,
  OriginalRow227TriangleData2020.coefficient205_242,
  OriginalRow227TriangleData2020.coefficient205_243,
  OriginalRow227TriangleData2020.coefficient205_244,
  OriginalRow227TriangleData2020.coefficient205_245,
  OriginalRow227TriangleData2020.coefficient205_246,
  OriginalRow227TriangleData2020.coefficient205_247,
  OriginalRow227TriangleData2020.coefficient205_248,
  OriginalRow227TriangleData2020.coefficient205_249,
  OriginalRow227TriangleData2020.coefficient205_250,
  OriginalRow227TriangleData2020.coefficient205_251,
  OriginalRow227TriangleData2020.coefficient205_252,
  OriginalRow227TriangleData2020.coefficient205_253,
  OriginalRow227TriangleData2020.coefficient205_254,
  OriginalRow227TriangleData2020.coefficient205_255,
  OriginalRow227TriangleData2020.coefficient205_256,
  OriginalRow227TriangleData2020.coefficient205_257,
  OriginalRow227TriangleData2020.coefficient205_258,
  OriginalRow227TriangleData2020.coefficient205_259,
  OriginalRow227TriangleData2020.coefficient205_260,
  OriginalRow227TriangleData2020.coefficient205_261,
  OriginalRow227TriangleData2020.coefficient205_262,
  OriginalRow227TriangleData2020.coefficient205_263,
  OriginalRow227TriangleData2020.coefficient205_264,
  OriginalRow227TriangleData2020.coefficient205_265,
  OriginalRow227TriangleData2020.coefficient205_266,
  OriginalRow227TriangleData2020.coefficient205_267
]

theorem values2020_size : values2020.size = 32 := rfl

def block2020 : ℕ → Option IntervalDyadic := segment 236 values2020

theorem block2020_domain : ExactDomain block2020 236 268 := by
  simpa only [values2020_size] using segment_domain 236 values2020

theorem block2020_get (i : Fin 32) :
    block2020 (236 + i.val) = some (values2020[i.val]'(by rw [values2020_size]; exact i.isLt)) := by
  exact segment_get 236 values2020 ⟨i.val, by rw [values2020_size]; exact i.isLt⟩

def values2021 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2021.coefficient205_268,
  OriginalRow227TriangleData2021.coefficient205_269,
  OriginalRow227TriangleData2021.coefficient205_270,
  OriginalRow227TriangleData2021.coefficient205_271,
  OriginalRow227TriangleData2021.coefficient205_272,
  OriginalRow227TriangleData2021.coefficient205_273,
  OriginalRow227TriangleData2021.coefficient205_274,
  OriginalRow227TriangleData2021.coefficient205_275,
  OriginalRow227TriangleData2021.coefficient205_276,
  OriginalRow227TriangleData2021.coefficient205_277,
  OriginalRow227TriangleData2021.coefficient205_278,
  OriginalRow227TriangleData2021.coefficient205_279,
  OriginalRow227TriangleData2021.coefficient205_280,
  OriginalRow227TriangleData2021.coefficient205_281,
  OriginalRow227TriangleData2021.coefficient205_282,
  OriginalRow227TriangleData2021.coefficient205_283,
  OriginalRow227TriangleData2021.coefficient205_284,
  OriginalRow227TriangleData2021.coefficient205_285,
  OriginalRow227TriangleData2021.coefficient205_286,
  OriginalRow227TriangleData2021.coefficient205_287,
  OriginalRow227TriangleData2021.coefficient205_288,
  OriginalRow227TriangleData2021.coefficient205_289,
  OriginalRow227TriangleData2021.coefficient205_290,
  OriginalRow227TriangleData2021.coefficient205_291,
  OriginalRow227TriangleData2021.coefficient205_292,
  OriginalRow227TriangleData2021.coefficient205_293,
  OriginalRow227TriangleData2021.coefficient205_294,
  OriginalRow227TriangleData2021.coefficient205_295,
  OriginalRow227TriangleData2021.coefficient205_296
]

theorem values2021_size : values2021.size = 29 := rfl

def block2021 : ℕ → Option IntervalDyadic := segment 268 values2021

theorem block2021_domain : ExactDomain block2021 268 297 := by
  simpa only [values2021_size] using segment_domain 268 values2021

theorem block2021_get (i : Fin 29) :
    block2021 (268 + i.val) = some (values2021[i.val]'(by rw [values2021_size]; exact i.isLt)) := by
  exact segment_get 268 values2021 ⟨i.val, by rw [values2021_size]; exact i.isLt⟩

def node0236_0297 : ℕ → Option IntervalDyadic := split 268 block2020 block2021

theorem node0236_0297_domain : ExactDomain node0236_0297 236 297 := by
  exact split_domain (by decide) (by decide) block2020_domain block2021_domain

def node0204_0297 : ℕ → Option IntervalDyadic := split 236 block2019 node0236_0297

theorem node0204_0297_domain : ExactDomain node0204_0297 204 297 := by
  exact split_domain (by decide) (by decide) block2019_domain node0236_0297_domain

def lookup : ℕ → Option IntervalDyadic := node0204_0297

theorem lookup_domain : ExactDomain lookup 204 297 :=
  node0204_0297_domain

theorem block2019_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values2019[i.val]'(by rw [values2019_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0204_0297 (204 + i.val) = _
  rw [node0204_0297, split_left 236 block2019 node0236_0297 (by omega)]
  exact block2019_get i

theorem block2020_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values2020[i.val]'(by rw [values2020_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0204_0297 (236 + i.val) = _
  rw [node0204_0297, split_right 236 block2019 node0236_0297 (by omega)]
  rw [node0236_0297, split_left 268 block2020 block2021 (by omega)]
  exact block2020_get i

theorem block2021_lookup (i : Fin 29) :
    lookup (268 + i.val) = some (values2021[i.val]'(by rw [values2021_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0204_0297 (268 + i.val) = _
  rw [node0204_0297, split_right 236 block2019 node0236_0297 (by omega)]
  rw [node0236_0297, split_right 268 block2020 block2021 (by omega)]
  exact block2021_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2019_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2019_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2020_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2020_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2021_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2021_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2019_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2020_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow205.block2021_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow205
