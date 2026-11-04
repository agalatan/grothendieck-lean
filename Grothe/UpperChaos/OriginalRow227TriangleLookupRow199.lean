import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1996
import Grothe.UpperChaos.OriginalRow227TriangleData1997
import Grothe.UpperChaos.OriginalRow227TriangleData1998
import Grothe.UpperChaos.OriginalRow227TriangleData1999

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow199

open ConditionalTableLookup

def values1996 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1996.coefficient199_198,
  OriginalRow227TriangleData1996.coefficient199_199,
  OriginalRow227TriangleData1996.coefficient199_200,
  OriginalRow227TriangleData1996.coefficient199_201,
  OriginalRow227TriangleData1996.coefficient199_202,
  OriginalRow227TriangleData1996.coefficient199_203,
  OriginalRow227TriangleData1996.coefficient199_204,
  OriginalRow227TriangleData1996.coefficient199_205,
  OriginalRow227TriangleData1996.coefficient199_206,
  OriginalRow227TriangleData1996.coefficient199_207,
  OriginalRow227TriangleData1996.coefficient199_208,
  OriginalRow227TriangleData1996.coefficient199_209,
  OriginalRow227TriangleData1996.coefficient199_210,
  OriginalRow227TriangleData1996.coefficient199_211,
  OriginalRow227TriangleData1996.coefficient199_212,
  OriginalRow227TriangleData1996.coefficient199_213,
  OriginalRow227TriangleData1996.coefficient199_214,
  OriginalRow227TriangleData1996.coefficient199_215,
  OriginalRow227TriangleData1996.coefficient199_216,
  OriginalRow227TriangleData1996.coefficient199_217,
  OriginalRow227TriangleData1996.coefficient199_218,
  OriginalRow227TriangleData1996.coefficient199_219,
  OriginalRow227TriangleData1996.coefficient199_220,
  OriginalRow227TriangleData1996.coefficient199_221,
  OriginalRow227TriangleData1996.coefficient199_222,
  OriginalRow227TriangleData1996.coefficient199_223,
  OriginalRow227TriangleData1996.coefficient199_224,
  OriginalRow227TriangleData1996.coefficient199_225,
  OriginalRow227TriangleData1996.coefficient199_226,
  OriginalRow227TriangleData1996.coefficient199_227,
  OriginalRow227TriangleData1996.coefficient199_228,
  OriginalRow227TriangleData1996.coefficient199_229
]

theorem values1996_size : values1996.size = 32 := rfl

def block1996 : ℕ → Option IntervalDyadic := segment 198 values1996

theorem block1996_domain : ExactDomain block1996 198 230 := by
  simpa only [values1996_size] using segment_domain 198 values1996

theorem block1996_get (i : Fin 32) :
    block1996 (198 + i.val) = some (values1996[i.val]'(by rw [values1996_size]; exact i.isLt)) := by
  exact segment_get 198 values1996 ⟨i.val, by rw [values1996_size]; exact i.isLt⟩

def values1997 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1997.coefficient199_230,
  OriginalRow227TriangleData1997.coefficient199_231,
  OriginalRow227TriangleData1997.coefficient199_232,
  OriginalRow227TriangleData1997.coefficient199_233,
  OriginalRow227TriangleData1997.coefficient199_234,
  OriginalRow227TriangleData1997.coefficient199_235,
  OriginalRow227TriangleData1997.coefficient199_236,
  OriginalRow227TriangleData1997.coefficient199_237,
  OriginalRow227TriangleData1997.coefficient199_238,
  OriginalRow227TriangleData1997.coefficient199_239,
  OriginalRow227TriangleData1997.coefficient199_240,
  OriginalRow227TriangleData1997.coefficient199_241,
  OriginalRow227TriangleData1997.coefficient199_242,
  OriginalRow227TriangleData1997.coefficient199_243,
  OriginalRow227TriangleData1997.coefficient199_244,
  OriginalRow227TriangleData1997.coefficient199_245,
  OriginalRow227TriangleData1997.coefficient199_246,
  OriginalRow227TriangleData1997.coefficient199_247,
  OriginalRow227TriangleData1997.coefficient199_248,
  OriginalRow227TriangleData1997.coefficient199_249,
  OriginalRow227TriangleData1997.coefficient199_250,
  OriginalRow227TriangleData1997.coefficient199_251,
  OriginalRow227TriangleData1997.coefficient199_252,
  OriginalRow227TriangleData1997.coefficient199_253,
  OriginalRow227TriangleData1997.coefficient199_254,
  OriginalRow227TriangleData1997.coefficient199_255,
  OriginalRow227TriangleData1997.coefficient199_256,
  OriginalRow227TriangleData1997.coefficient199_257,
  OriginalRow227TriangleData1997.coefficient199_258,
  OriginalRow227TriangleData1997.coefficient199_259,
  OriginalRow227TriangleData1997.coefficient199_260,
  OriginalRow227TriangleData1997.coefficient199_261
]

theorem values1997_size : values1997.size = 32 := rfl

def block1997 : ℕ → Option IntervalDyadic := segment 230 values1997

theorem block1997_domain : ExactDomain block1997 230 262 := by
  simpa only [values1997_size] using segment_domain 230 values1997

theorem block1997_get (i : Fin 32) :
    block1997 (230 + i.val) = some (values1997[i.val]'(by rw [values1997_size]; exact i.isLt)) := by
  exact segment_get 230 values1997 ⟨i.val, by rw [values1997_size]; exact i.isLt⟩

def values1998 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1998.coefficient199_262,
  OriginalRow227TriangleData1998.coefficient199_263,
  OriginalRow227TriangleData1998.coefficient199_264,
  OriginalRow227TriangleData1998.coefficient199_265,
  OriginalRow227TriangleData1998.coefficient199_266,
  OriginalRow227TriangleData1998.coefficient199_267,
  OriginalRow227TriangleData1998.coefficient199_268,
  OriginalRow227TriangleData1998.coefficient199_269,
  OriginalRow227TriangleData1998.coefficient199_270,
  OriginalRow227TriangleData1998.coefficient199_271,
  OriginalRow227TriangleData1998.coefficient199_272,
  OriginalRow227TriangleData1998.coefficient199_273,
  OriginalRow227TriangleData1998.coefficient199_274,
  OriginalRow227TriangleData1998.coefficient199_275,
  OriginalRow227TriangleData1998.coefficient199_276,
  OriginalRow227TriangleData1998.coefficient199_277,
  OriginalRow227TriangleData1998.coefficient199_278,
  OriginalRow227TriangleData1998.coefficient199_279,
  OriginalRow227TriangleData1998.coefficient199_280,
  OriginalRow227TriangleData1998.coefficient199_281,
  OriginalRow227TriangleData1998.coefficient199_282,
  OriginalRow227TriangleData1998.coefficient199_283,
  OriginalRow227TriangleData1998.coefficient199_284,
  OriginalRow227TriangleData1998.coefficient199_285,
  OriginalRow227TriangleData1998.coefficient199_286,
  OriginalRow227TriangleData1998.coefficient199_287,
  OriginalRow227TriangleData1998.coefficient199_288,
  OriginalRow227TriangleData1998.coefficient199_289,
  OriginalRow227TriangleData1998.coefficient199_290,
  OriginalRow227TriangleData1998.coefficient199_291,
  OriginalRow227TriangleData1998.coefficient199_292,
  OriginalRow227TriangleData1998.coefficient199_293
]

theorem values1998_size : values1998.size = 32 := rfl

def block1998 : ℕ → Option IntervalDyadic := segment 262 values1998

theorem block1998_domain : ExactDomain block1998 262 294 := by
  simpa only [values1998_size] using segment_domain 262 values1998

theorem block1998_get (i : Fin 32) :
    block1998 (262 + i.val) = some (values1998[i.val]'(by rw [values1998_size]; exact i.isLt)) := by
  exact segment_get 262 values1998 ⟨i.val, by rw [values1998_size]; exact i.isLt⟩

def values1999 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1999.coefficient199_294,
  OriginalRow227TriangleData1999.coefficient199_295,
  OriginalRow227TriangleData1999.coefficient199_296,
  OriginalRow227TriangleData1999.coefficient199_297,
  OriginalRow227TriangleData1999.coefficient199_298,
  OriginalRow227TriangleData1999.coefficient199_299,
  OriginalRow227TriangleData1999.coefficient199_300,
  OriginalRow227TriangleData1999.coefficient199_301,
  OriginalRow227TriangleData1999.coefficient199_302
]

theorem values1999_size : values1999.size = 9 := rfl

def block1999 : ℕ → Option IntervalDyadic := segment 294 values1999

theorem block1999_domain : ExactDomain block1999 294 303 := by
  simpa only [values1999_size] using segment_domain 294 values1999

theorem block1999_get (i : Fin 9) :
    block1999 (294 + i.val) = some (values1999[i.val]'(by rw [values1999_size]; exact i.isLt)) := by
  exact segment_get 294 values1999 ⟨i.val, by rw [values1999_size]; exact i.isLt⟩

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block1996 block1997

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block1996_domain block1997_domain

def node0262_0303 : ℕ → Option IntervalDyadic := split 294 block1998 block1999

theorem node0262_0303_domain : ExactDomain node0262_0303 262 303 := by
  exact split_domain (by decide) (by decide) block1998_domain block1999_domain

def node0198_0303 : ℕ → Option IntervalDyadic := split 262 node0198_0262 node0262_0303

theorem node0198_0303_domain : ExactDomain node0198_0303 198 303 := by
  exact split_domain (by decide) (by decide) node0198_0262_domain node0262_0303_domain

def lookup : ℕ → Option IntervalDyadic := node0198_0303

theorem lookup_domain : ExactDomain lookup 198 303 :=
  node0198_0303_domain

theorem block1996_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values1996[i.val]'(by rw [values1996_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0198_0303 (198 + i.val) = _
  rw [node0198_0303, split_left 262 node0198_0262 node0262_0303 (by omega)]
  rw [node0198_0262, split_left 230 block1996 block1997 (by omega)]
  exact block1996_get i

theorem block1997_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values1997[i.val]'(by rw [values1997_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0198_0303 (230 + i.val) = _
  rw [node0198_0303, split_left 262 node0198_0262 node0262_0303 (by omega)]
  rw [node0198_0262, split_right 230 block1996 block1997 (by omega)]
  exact block1997_get i

theorem block1998_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values1998[i.val]'(by rw [values1998_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0198_0303 (262 + i.val) = _
  rw [node0198_0303, split_right 262 node0198_0262 node0262_0303 (by omega)]
  rw [node0262_0303, split_left 294 block1998 block1999 (by omega)]
  exact block1998_get i

theorem block1999_lookup (i : Fin 9) :
    lookup (294 + i.val) = some (values1999[i.val]'(by rw [values1999_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0198_0303 (294 + i.val) = _
  rw [node0198_0303, split_right 262 node0198_0262 node0262_0303 (by omega)]
  rw [node0262_0303, split_right 294 block1998 block1999 (by omega)]
  exact block1999_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1996_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1996_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1997_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1997_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1998_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1998_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1999_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1999_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1996_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1997_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1998_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow199.block1999_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow199
