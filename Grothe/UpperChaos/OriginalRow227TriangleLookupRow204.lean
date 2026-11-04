import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2016
import Grothe.UpperChaos.OriginalRow227TriangleData2017
import Grothe.UpperChaos.OriginalRow227TriangleData2018

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow204

open ConditionalTableLookup

def values2016 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2016.coefficient204_203,
  OriginalRow227TriangleData2016.coefficient204_204,
  OriginalRow227TriangleData2016.coefficient204_205,
  OriginalRow227TriangleData2016.coefficient204_206,
  OriginalRow227TriangleData2016.coefficient204_207,
  OriginalRow227TriangleData2016.coefficient204_208,
  OriginalRow227TriangleData2016.coefficient204_209,
  OriginalRow227TriangleData2016.coefficient204_210,
  OriginalRow227TriangleData2016.coefficient204_211,
  OriginalRow227TriangleData2016.coefficient204_212,
  OriginalRow227TriangleData2016.coefficient204_213,
  OriginalRow227TriangleData2016.coefficient204_214,
  OriginalRow227TriangleData2016.coefficient204_215,
  OriginalRow227TriangleData2016.coefficient204_216,
  OriginalRow227TriangleData2016.coefficient204_217,
  OriginalRow227TriangleData2016.coefficient204_218,
  OriginalRow227TriangleData2016.coefficient204_219,
  OriginalRow227TriangleData2016.coefficient204_220,
  OriginalRow227TriangleData2016.coefficient204_221,
  OriginalRow227TriangleData2016.coefficient204_222,
  OriginalRow227TriangleData2016.coefficient204_223,
  OriginalRow227TriangleData2016.coefficient204_224,
  OriginalRow227TriangleData2016.coefficient204_225,
  OriginalRow227TriangleData2016.coefficient204_226,
  OriginalRow227TriangleData2016.coefficient204_227,
  OriginalRow227TriangleData2016.coefficient204_228,
  OriginalRow227TriangleData2016.coefficient204_229,
  OriginalRow227TriangleData2016.coefficient204_230,
  OriginalRow227TriangleData2016.coefficient204_231,
  OriginalRow227TriangleData2016.coefficient204_232,
  OriginalRow227TriangleData2016.coefficient204_233,
  OriginalRow227TriangleData2016.coefficient204_234
]

theorem values2016_size : values2016.size = 32 := rfl

def block2016 : ℕ → Option IntervalDyadic := segment 203 values2016

theorem block2016_domain : ExactDomain block2016 203 235 := by
  simpa only [values2016_size] using segment_domain 203 values2016

theorem block2016_get (i : Fin 32) :
    block2016 (203 + i.val) = some (values2016[i.val]'(by rw [values2016_size]; exact i.isLt)) := by
  exact segment_get 203 values2016 ⟨i.val, by rw [values2016_size]; exact i.isLt⟩

def values2017 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2017.coefficient204_235,
  OriginalRow227TriangleData2017.coefficient204_236,
  OriginalRow227TriangleData2017.coefficient204_237,
  OriginalRow227TriangleData2017.coefficient204_238,
  OriginalRow227TriangleData2017.coefficient204_239,
  OriginalRow227TriangleData2017.coefficient204_240,
  OriginalRow227TriangleData2017.coefficient204_241,
  OriginalRow227TriangleData2017.coefficient204_242,
  OriginalRow227TriangleData2017.coefficient204_243,
  OriginalRow227TriangleData2017.coefficient204_244,
  OriginalRow227TriangleData2017.coefficient204_245,
  OriginalRow227TriangleData2017.coefficient204_246,
  OriginalRow227TriangleData2017.coefficient204_247,
  OriginalRow227TriangleData2017.coefficient204_248,
  OriginalRow227TriangleData2017.coefficient204_249,
  OriginalRow227TriangleData2017.coefficient204_250,
  OriginalRow227TriangleData2017.coefficient204_251,
  OriginalRow227TriangleData2017.coefficient204_252,
  OriginalRow227TriangleData2017.coefficient204_253,
  OriginalRow227TriangleData2017.coefficient204_254,
  OriginalRow227TriangleData2017.coefficient204_255,
  OriginalRow227TriangleData2017.coefficient204_256,
  OriginalRow227TriangleData2017.coefficient204_257,
  OriginalRow227TriangleData2017.coefficient204_258,
  OriginalRow227TriangleData2017.coefficient204_259,
  OriginalRow227TriangleData2017.coefficient204_260,
  OriginalRow227TriangleData2017.coefficient204_261,
  OriginalRow227TriangleData2017.coefficient204_262,
  OriginalRow227TriangleData2017.coefficient204_263,
  OriginalRow227TriangleData2017.coefficient204_264,
  OriginalRow227TriangleData2017.coefficient204_265,
  OriginalRow227TriangleData2017.coefficient204_266
]

theorem values2017_size : values2017.size = 32 := rfl

def block2017 : ℕ → Option IntervalDyadic := segment 235 values2017

theorem block2017_domain : ExactDomain block2017 235 267 := by
  simpa only [values2017_size] using segment_domain 235 values2017

theorem block2017_get (i : Fin 32) :
    block2017 (235 + i.val) = some (values2017[i.val]'(by rw [values2017_size]; exact i.isLt)) := by
  exact segment_get 235 values2017 ⟨i.val, by rw [values2017_size]; exact i.isLt⟩

def values2018 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2018.coefficient204_267,
  OriginalRow227TriangleData2018.coefficient204_268,
  OriginalRow227TriangleData2018.coefficient204_269,
  OriginalRow227TriangleData2018.coefficient204_270,
  OriginalRow227TriangleData2018.coefficient204_271,
  OriginalRow227TriangleData2018.coefficient204_272,
  OriginalRow227TriangleData2018.coefficient204_273,
  OriginalRow227TriangleData2018.coefficient204_274,
  OriginalRow227TriangleData2018.coefficient204_275,
  OriginalRow227TriangleData2018.coefficient204_276,
  OriginalRow227TriangleData2018.coefficient204_277,
  OriginalRow227TriangleData2018.coefficient204_278,
  OriginalRow227TriangleData2018.coefficient204_279,
  OriginalRow227TriangleData2018.coefficient204_280,
  OriginalRow227TriangleData2018.coefficient204_281,
  OriginalRow227TriangleData2018.coefficient204_282,
  OriginalRow227TriangleData2018.coefficient204_283,
  OriginalRow227TriangleData2018.coefficient204_284,
  OriginalRow227TriangleData2018.coefficient204_285,
  OriginalRow227TriangleData2018.coefficient204_286,
  OriginalRow227TriangleData2018.coefficient204_287,
  OriginalRow227TriangleData2018.coefficient204_288,
  OriginalRow227TriangleData2018.coefficient204_289,
  OriginalRow227TriangleData2018.coefficient204_290,
  OriginalRow227TriangleData2018.coefficient204_291,
  OriginalRow227TriangleData2018.coefficient204_292,
  OriginalRow227TriangleData2018.coefficient204_293,
  OriginalRow227TriangleData2018.coefficient204_294,
  OriginalRow227TriangleData2018.coefficient204_295,
  OriginalRow227TriangleData2018.coefficient204_296,
  OriginalRow227TriangleData2018.coefficient204_297
]

theorem values2018_size : values2018.size = 31 := rfl

def block2018 : ℕ → Option IntervalDyadic := segment 267 values2018

theorem block2018_domain : ExactDomain block2018 267 298 := by
  simpa only [values2018_size] using segment_domain 267 values2018

theorem block2018_get (i : Fin 31) :
    block2018 (267 + i.val) = some (values2018[i.val]'(by rw [values2018_size]; exact i.isLt)) := by
  exact segment_get 267 values2018 ⟨i.val, by rw [values2018_size]; exact i.isLt⟩

def node0235_0298 : ℕ → Option IntervalDyadic := split 267 block2017 block2018

theorem node0235_0298_domain : ExactDomain node0235_0298 235 298 := by
  exact split_domain (by decide) (by decide) block2017_domain block2018_domain

def node0203_0298 : ℕ → Option IntervalDyadic := split 235 block2016 node0235_0298

theorem node0203_0298_domain : ExactDomain node0203_0298 203 298 := by
  exact split_domain (by decide) (by decide) block2016_domain node0235_0298_domain

def lookup : ℕ → Option IntervalDyadic := node0203_0298

theorem lookup_domain : ExactDomain lookup 203 298 :=
  node0203_0298_domain

theorem block2016_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values2016[i.val]'(by rw [values2016_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0203_0298 (203 + i.val) = _
  rw [node0203_0298, split_left 235 block2016 node0235_0298 (by omega)]
  exact block2016_get i

theorem block2017_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values2017[i.val]'(by rw [values2017_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0203_0298 (235 + i.val) = _
  rw [node0203_0298, split_right 235 block2016 node0235_0298 (by omega)]
  rw [node0235_0298, split_left 267 block2017 block2018 (by omega)]
  exact block2017_get i

theorem block2018_lookup (i : Fin 31) :
    lookup (267 + i.val) = some (values2018[i.val]'(by rw [values2018_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0203_0298 (267 + i.val) = _
  rw [node0203_0298, split_right 235 block2016 node0235_0298 (by omega)]
  rw [node0235_0298, split_right 267 block2017 block2018 (by omega)]
  exact block2018_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2016_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2016_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2017_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2017_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2018_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2018_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2016_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2017_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow204.block2018_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow204
