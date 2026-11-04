import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2012
import Grothe.UpperChaos.OriginalRow227TriangleData2013
import Grothe.UpperChaos.OriginalRow227TriangleData2014
import Grothe.UpperChaos.OriginalRow227TriangleData2015

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow203

open ConditionalTableLookup

def values2012 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2012.coefficient203_202,
  OriginalRow227TriangleData2012.coefficient203_203,
  OriginalRow227TriangleData2012.coefficient203_204,
  OriginalRow227TriangleData2012.coefficient203_205,
  OriginalRow227TriangleData2012.coefficient203_206,
  OriginalRow227TriangleData2012.coefficient203_207,
  OriginalRow227TriangleData2012.coefficient203_208,
  OriginalRow227TriangleData2012.coefficient203_209,
  OriginalRow227TriangleData2012.coefficient203_210,
  OriginalRow227TriangleData2012.coefficient203_211,
  OriginalRow227TriangleData2012.coefficient203_212,
  OriginalRow227TriangleData2012.coefficient203_213,
  OriginalRow227TriangleData2012.coefficient203_214,
  OriginalRow227TriangleData2012.coefficient203_215,
  OriginalRow227TriangleData2012.coefficient203_216,
  OriginalRow227TriangleData2012.coefficient203_217,
  OriginalRow227TriangleData2012.coefficient203_218,
  OriginalRow227TriangleData2012.coefficient203_219,
  OriginalRow227TriangleData2012.coefficient203_220,
  OriginalRow227TriangleData2012.coefficient203_221,
  OriginalRow227TriangleData2012.coefficient203_222,
  OriginalRow227TriangleData2012.coefficient203_223,
  OriginalRow227TriangleData2012.coefficient203_224,
  OriginalRow227TriangleData2012.coefficient203_225,
  OriginalRow227TriangleData2012.coefficient203_226,
  OriginalRow227TriangleData2012.coefficient203_227,
  OriginalRow227TriangleData2012.coefficient203_228,
  OriginalRow227TriangleData2012.coefficient203_229,
  OriginalRow227TriangleData2012.coefficient203_230,
  OriginalRow227TriangleData2012.coefficient203_231,
  OriginalRow227TriangleData2012.coefficient203_232,
  OriginalRow227TriangleData2012.coefficient203_233
]

theorem values2012_size : values2012.size = 32 := rfl

def block2012 : ℕ → Option IntervalDyadic := segment 202 values2012

theorem block2012_domain : ExactDomain block2012 202 234 := by
  simpa only [values2012_size] using segment_domain 202 values2012

theorem block2012_get (i : Fin 32) :
    block2012 (202 + i.val) = some (values2012[i.val]'(by rw [values2012_size]; exact i.isLt)) := by
  exact segment_get 202 values2012 ⟨i.val, by rw [values2012_size]; exact i.isLt⟩

def values2013 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2013.coefficient203_234,
  OriginalRow227TriangleData2013.coefficient203_235,
  OriginalRow227TriangleData2013.coefficient203_236,
  OriginalRow227TriangleData2013.coefficient203_237,
  OriginalRow227TriangleData2013.coefficient203_238,
  OriginalRow227TriangleData2013.coefficient203_239,
  OriginalRow227TriangleData2013.coefficient203_240,
  OriginalRow227TriangleData2013.coefficient203_241,
  OriginalRow227TriangleData2013.coefficient203_242,
  OriginalRow227TriangleData2013.coefficient203_243,
  OriginalRow227TriangleData2013.coefficient203_244,
  OriginalRow227TriangleData2013.coefficient203_245,
  OriginalRow227TriangleData2013.coefficient203_246,
  OriginalRow227TriangleData2013.coefficient203_247,
  OriginalRow227TriangleData2013.coefficient203_248,
  OriginalRow227TriangleData2013.coefficient203_249,
  OriginalRow227TriangleData2013.coefficient203_250,
  OriginalRow227TriangleData2013.coefficient203_251,
  OriginalRow227TriangleData2013.coefficient203_252,
  OriginalRow227TriangleData2013.coefficient203_253,
  OriginalRow227TriangleData2013.coefficient203_254,
  OriginalRow227TriangleData2013.coefficient203_255,
  OriginalRow227TriangleData2013.coefficient203_256,
  OriginalRow227TriangleData2013.coefficient203_257,
  OriginalRow227TriangleData2013.coefficient203_258,
  OriginalRow227TriangleData2013.coefficient203_259,
  OriginalRow227TriangleData2013.coefficient203_260,
  OriginalRow227TriangleData2013.coefficient203_261,
  OriginalRow227TriangleData2013.coefficient203_262,
  OriginalRow227TriangleData2013.coefficient203_263,
  OriginalRow227TriangleData2013.coefficient203_264,
  OriginalRow227TriangleData2013.coefficient203_265
]

theorem values2013_size : values2013.size = 32 := rfl

def block2013 : ℕ → Option IntervalDyadic := segment 234 values2013

theorem block2013_domain : ExactDomain block2013 234 266 := by
  simpa only [values2013_size] using segment_domain 234 values2013

theorem block2013_get (i : Fin 32) :
    block2013 (234 + i.val) = some (values2013[i.val]'(by rw [values2013_size]; exact i.isLt)) := by
  exact segment_get 234 values2013 ⟨i.val, by rw [values2013_size]; exact i.isLt⟩

def values2014 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2014.coefficient203_266,
  OriginalRow227TriangleData2014.coefficient203_267,
  OriginalRow227TriangleData2014.coefficient203_268,
  OriginalRow227TriangleData2014.coefficient203_269,
  OriginalRow227TriangleData2014.coefficient203_270,
  OriginalRow227TriangleData2014.coefficient203_271,
  OriginalRow227TriangleData2014.coefficient203_272,
  OriginalRow227TriangleData2014.coefficient203_273,
  OriginalRow227TriangleData2014.coefficient203_274,
  OriginalRow227TriangleData2014.coefficient203_275,
  OriginalRow227TriangleData2014.coefficient203_276,
  OriginalRow227TriangleData2014.coefficient203_277,
  OriginalRow227TriangleData2014.coefficient203_278,
  OriginalRow227TriangleData2014.coefficient203_279,
  OriginalRow227TriangleData2014.coefficient203_280,
  OriginalRow227TriangleData2014.coefficient203_281,
  OriginalRow227TriangleData2014.coefficient203_282,
  OriginalRow227TriangleData2014.coefficient203_283,
  OriginalRow227TriangleData2014.coefficient203_284,
  OriginalRow227TriangleData2014.coefficient203_285,
  OriginalRow227TriangleData2014.coefficient203_286,
  OriginalRow227TriangleData2014.coefficient203_287,
  OriginalRow227TriangleData2014.coefficient203_288,
  OriginalRow227TriangleData2014.coefficient203_289,
  OriginalRow227TriangleData2014.coefficient203_290,
  OriginalRow227TriangleData2014.coefficient203_291,
  OriginalRow227TriangleData2014.coefficient203_292,
  OriginalRow227TriangleData2014.coefficient203_293,
  OriginalRow227TriangleData2014.coefficient203_294,
  OriginalRow227TriangleData2014.coefficient203_295,
  OriginalRow227TriangleData2014.coefficient203_296,
  OriginalRow227TriangleData2014.coefficient203_297
]

theorem values2014_size : values2014.size = 32 := rfl

def block2014 : ℕ → Option IntervalDyadic := segment 266 values2014

theorem block2014_domain : ExactDomain block2014 266 298 := by
  simpa only [values2014_size] using segment_domain 266 values2014

theorem block2014_get (i : Fin 32) :
    block2014 (266 + i.val) = some (values2014[i.val]'(by rw [values2014_size]; exact i.isLt)) := by
  exact segment_get 266 values2014 ⟨i.val, by rw [values2014_size]; exact i.isLt⟩

def values2015 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2015.coefficient203_298
]

theorem values2015_size : values2015.size = 1 := rfl

def block2015 : ℕ → Option IntervalDyadic := segment 298 values2015

theorem block2015_domain : ExactDomain block2015 298 299 := by
  simpa only [values2015_size] using segment_domain 298 values2015

theorem block2015_get (i : Fin 1) :
    block2015 (298 + i.val) = some (values2015[i.val]'(by rw [values2015_size]; exact i.isLt)) := by
  exact segment_get 298 values2015 ⟨i.val, by rw [values2015_size]; exact i.isLt⟩

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block2012 block2013

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block2012_domain block2013_domain

def node0266_0299 : ℕ → Option IntervalDyadic := split 298 block2014 block2015

theorem node0266_0299_domain : ExactDomain node0266_0299 266 299 := by
  exact split_domain (by decide) (by decide) block2014_domain block2015_domain

def node0202_0299 : ℕ → Option IntervalDyadic := split 266 node0202_0266 node0266_0299

theorem node0202_0299_domain : ExactDomain node0202_0299 202 299 := by
  exact split_domain (by decide) (by decide) node0202_0266_domain node0266_0299_domain

def lookup : ℕ → Option IntervalDyadic := node0202_0299

theorem lookup_domain : ExactDomain lookup 202 299 :=
  node0202_0299_domain

theorem block2012_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values2012[i.val]'(by rw [values2012_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0202_0299 (202 + i.val) = _
  rw [node0202_0299, split_left 266 node0202_0266 node0266_0299 (by omega)]
  rw [node0202_0266, split_left 234 block2012 block2013 (by omega)]
  exact block2012_get i

theorem block2013_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values2013[i.val]'(by rw [values2013_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0202_0299 (234 + i.val) = _
  rw [node0202_0299, split_left 266 node0202_0266 node0266_0299 (by omega)]
  rw [node0202_0266, split_right 234 block2012 block2013 (by omega)]
  exact block2013_get i

theorem block2014_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values2014[i.val]'(by rw [values2014_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0202_0299 (266 + i.val) = _
  rw [node0202_0299, split_right 266 node0202_0266 node0266_0299 (by omega)]
  rw [node0266_0299, split_left 298 block2014 block2015 (by omega)]
  exact block2014_get i

theorem block2015_lookup (i : Fin 1) :
    lookup (298 + i.val) = some (values2015[i.val]'(by rw [values2015_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0202_0299 (298 + i.val) = _
  rw [node0202_0299, split_right 266 node0202_0266 node0266_0299 (by omega)]
  rw [node0266_0299, split_right 298 block2014 block2015 (by omega)]
  exact block2015_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2012_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2012_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2013_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2013_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2014_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2014_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2015_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2015_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2012_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2013_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2014_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow203.block2015_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow203
