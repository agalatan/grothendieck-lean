import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2008
import Grothe.UpperChaos.OriginalRow227TriangleData2009
import Grothe.UpperChaos.OriginalRow227TriangleData2010
import Grothe.UpperChaos.OriginalRow227TriangleData2011

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow202

open ConditionalTableLookup

def values2008 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2008.coefficient202_201,
  OriginalRow227TriangleData2008.coefficient202_202,
  OriginalRow227TriangleData2008.coefficient202_203,
  OriginalRow227TriangleData2008.coefficient202_204,
  OriginalRow227TriangleData2008.coefficient202_205,
  OriginalRow227TriangleData2008.coefficient202_206,
  OriginalRow227TriangleData2008.coefficient202_207,
  OriginalRow227TriangleData2008.coefficient202_208,
  OriginalRow227TriangleData2008.coefficient202_209,
  OriginalRow227TriangleData2008.coefficient202_210,
  OriginalRow227TriangleData2008.coefficient202_211,
  OriginalRow227TriangleData2008.coefficient202_212,
  OriginalRow227TriangleData2008.coefficient202_213,
  OriginalRow227TriangleData2008.coefficient202_214,
  OriginalRow227TriangleData2008.coefficient202_215,
  OriginalRow227TriangleData2008.coefficient202_216,
  OriginalRow227TriangleData2008.coefficient202_217,
  OriginalRow227TriangleData2008.coefficient202_218,
  OriginalRow227TriangleData2008.coefficient202_219,
  OriginalRow227TriangleData2008.coefficient202_220,
  OriginalRow227TriangleData2008.coefficient202_221,
  OriginalRow227TriangleData2008.coefficient202_222,
  OriginalRow227TriangleData2008.coefficient202_223,
  OriginalRow227TriangleData2008.coefficient202_224,
  OriginalRow227TriangleData2008.coefficient202_225,
  OriginalRow227TriangleData2008.coefficient202_226,
  OriginalRow227TriangleData2008.coefficient202_227,
  OriginalRow227TriangleData2008.coefficient202_228,
  OriginalRow227TriangleData2008.coefficient202_229,
  OriginalRow227TriangleData2008.coefficient202_230,
  OriginalRow227TriangleData2008.coefficient202_231,
  OriginalRow227TriangleData2008.coefficient202_232
]

theorem values2008_size : values2008.size = 32 := rfl

def block2008 : ℕ → Option IntervalDyadic := segment 201 values2008

theorem block2008_domain : ExactDomain block2008 201 233 := by
  simpa only [values2008_size] using segment_domain 201 values2008

theorem block2008_get (i : Fin 32) :
    block2008 (201 + i.val) = some (values2008[i.val]'(by rw [values2008_size]; exact i.isLt)) := by
  exact segment_get 201 values2008 ⟨i.val, by rw [values2008_size]; exact i.isLt⟩

def values2009 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2009.coefficient202_233,
  OriginalRow227TriangleData2009.coefficient202_234,
  OriginalRow227TriangleData2009.coefficient202_235,
  OriginalRow227TriangleData2009.coefficient202_236,
  OriginalRow227TriangleData2009.coefficient202_237,
  OriginalRow227TriangleData2009.coefficient202_238,
  OriginalRow227TriangleData2009.coefficient202_239,
  OriginalRow227TriangleData2009.coefficient202_240,
  OriginalRow227TriangleData2009.coefficient202_241,
  OriginalRow227TriangleData2009.coefficient202_242,
  OriginalRow227TriangleData2009.coefficient202_243,
  OriginalRow227TriangleData2009.coefficient202_244,
  OriginalRow227TriangleData2009.coefficient202_245,
  OriginalRow227TriangleData2009.coefficient202_246,
  OriginalRow227TriangleData2009.coefficient202_247,
  OriginalRow227TriangleData2009.coefficient202_248,
  OriginalRow227TriangleData2009.coefficient202_249,
  OriginalRow227TriangleData2009.coefficient202_250,
  OriginalRow227TriangleData2009.coefficient202_251,
  OriginalRow227TriangleData2009.coefficient202_252,
  OriginalRow227TriangleData2009.coefficient202_253,
  OriginalRow227TriangleData2009.coefficient202_254,
  OriginalRow227TriangleData2009.coefficient202_255,
  OriginalRow227TriangleData2009.coefficient202_256,
  OriginalRow227TriangleData2009.coefficient202_257,
  OriginalRow227TriangleData2009.coefficient202_258,
  OriginalRow227TriangleData2009.coefficient202_259,
  OriginalRow227TriangleData2009.coefficient202_260,
  OriginalRow227TriangleData2009.coefficient202_261,
  OriginalRow227TriangleData2009.coefficient202_262,
  OriginalRow227TriangleData2009.coefficient202_263,
  OriginalRow227TriangleData2009.coefficient202_264
]

theorem values2009_size : values2009.size = 32 := rfl

def block2009 : ℕ → Option IntervalDyadic := segment 233 values2009

theorem block2009_domain : ExactDomain block2009 233 265 := by
  simpa only [values2009_size] using segment_domain 233 values2009

theorem block2009_get (i : Fin 32) :
    block2009 (233 + i.val) = some (values2009[i.val]'(by rw [values2009_size]; exact i.isLt)) := by
  exact segment_get 233 values2009 ⟨i.val, by rw [values2009_size]; exact i.isLt⟩

def values2010 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2010.coefficient202_265,
  OriginalRow227TriangleData2010.coefficient202_266,
  OriginalRow227TriangleData2010.coefficient202_267,
  OriginalRow227TriangleData2010.coefficient202_268,
  OriginalRow227TriangleData2010.coefficient202_269,
  OriginalRow227TriangleData2010.coefficient202_270,
  OriginalRow227TriangleData2010.coefficient202_271,
  OriginalRow227TriangleData2010.coefficient202_272,
  OriginalRow227TriangleData2010.coefficient202_273,
  OriginalRow227TriangleData2010.coefficient202_274,
  OriginalRow227TriangleData2010.coefficient202_275,
  OriginalRow227TriangleData2010.coefficient202_276,
  OriginalRow227TriangleData2010.coefficient202_277,
  OriginalRow227TriangleData2010.coefficient202_278,
  OriginalRow227TriangleData2010.coefficient202_279,
  OriginalRow227TriangleData2010.coefficient202_280,
  OriginalRow227TriangleData2010.coefficient202_281,
  OriginalRow227TriangleData2010.coefficient202_282,
  OriginalRow227TriangleData2010.coefficient202_283,
  OriginalRow227TriangleData2010.coefficient202_284,
  OriginalRow227TriangleData2010.coefficient202_285,
  OriginalRow227TriangleData2010.coefficient202_286,
  OriginalRow227TriangleData2010.coefficient202_287,
  OriginalRow227TriangleData2010.coefficient202_288,
  OriginalRow227TriangleData2010.coefficient202_289,
  OriginalRow227TriangleData2010.coefficient202_290,
  OriginalRow227TriangleData2010.coefficient202_291,
  OriginalRow227TriangleData2010.coefficient202_292,
  OriginalRow227TriangleData2010.coefficient202_293,
  OriginalRow227TriangleData2010.coefficient202_294,
  OriginalRow227TriangleData2010.coefficient202_295,
  OriginalRow227TriangleData2010.coefficient202_296
]

theorem values2010_size : values2010.size = 32 := rfl

def block2010 : ℕ → Option IntervalDyadic := segment 265 values2010

theorem block2010_domain : ExactDomain block2010 265 297 := by
  simpa only [values2010_size] using segment_domain 265 values2010

theorem block2010_get (i : Fin 32) :
    block2010 (265 + i.val) = some (values2010[i.val]'(by rw [values2010_size]; exact i.isLt)) := by
  exact segment_get 265 values2010 ⟨i.val, by rw [values2010_size]; exact i.isLt⟩

def values2011 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2011.coefficient202_297,
  OriginalRow227TriangleData2011.coefficient202_298,
  OriginalRow227TriangleData2011.coefficient202_299
]

theorem values2011_size : values2011.size = 3 := rfl

def block2011 : ℕ → Option IntervalDyadic := segment 297 values2011

theorem block2011_domain : ExactDomain block2011 297 300 := by
  simpa only [values2011_size] using segment_domain 297 values2011

theorem block2011_get (i : Fin 3) :
    block2011 (297 + i.val) = some (values2011[i.val]'(by rw [values2011_size]; exact i.isLt)) := by
  exact segment_get 297 values2011 ⟨i.val, by rw [values2011_size]; exact i.isLt⟩

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block2008 block2009

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block2008_domain block2009_domain

def node0265_0300 : ℕ → Option IntervalDyadic := split 297 block2010 block2011

theorem node0265_0300_domain : ExactDomain node0265_0300 265 300 := by
  exact split_domain (by decide) (by decide) block2010_domain block2011_domain

def node0201_0300 : ℕ → Option IntervalDyadic := split 265 node0201_0265 node0265_0300

theorem node0201_0300_domain : ExactDomain node0201_0300 201 300 := by
  exact split_domain (by decide) (by decide) node0201_0265_domain node0265_0300_domain

def lookup : ℕ → Option IntervalDyadic := node0201_0300

theorem lookup_domain : ExactDomain lookup 201 300 :=
  node0201_0300_domain

theorem block2008_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values2008[i.val]'(by rw [values2008_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0201_0300 (201 + i.val) = _
  rw [node0201_0300, split_left 265 node0201_0265 node0265_0300 (by omega)]
  rw [node0201_0265, split_left 233 block2008 block2009 (by omega)]
  exact block2008_get i

theorem block2009_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values2009[i.val]'(by rw [values2009_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0201_0300 (233 + i.val) = _
  rw [node0201_0300, split_left 265 node0201_0265 node0265_0300 (by omega)]
  rw [node0201_0265, split_right 233 block2008 block2009 (by omega)]
  exact block2009_get i

theorem block2010_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values2010[i.val]'(by rw [values2010_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0201_0300 (265 + i.val) = _
  rw [node0201_0300, split_right 265 node0201_0265 node0265_0300 (by omega)]
  rw [node0265_0300, split_left 297 block2010 block2011 (by omega)]
  exact block2010_get i

theorem block2011_lookup (i : Fin 3) :
    lookup (297 + i.val) = some (values2011[i.val]'(by rw [values2011_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0201_0300 (297 + i.val) = _
  rw [node0201_0300, split_right 265 node0201_0265 node0265_0300 (by omega)]
  rw [node0265_0300, split_right 297 block2010 block2011 (by omega)]
  exact block2011_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2008_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2008_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2009_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2009_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2010_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2010_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2011_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2011_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2008_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2009_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2010_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow202.block2011_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow202
