import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1992
import Grothe.UpperChaos.OriginalRow227TriangleData1993
import Grothe.UpperChaos.OriginalRow227TriangleData1994
import Grothe.UpperChaos.OriginalRow227TriangleData1995

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow198

open ConditionalTableLookup

def values1992 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1992.coefficient198_197,
  OriginalRow227TriangleData1992.coefficient198_198,
  OriginalRow227TriangleData1992.coefficient198_199,
  OriginalRow227TriangleData1992.coefficient198_200,
  OriginalRow227TriangleData1992.coefficient198_201,
  OriginalRow227TriangleData1992.coefficient198_202,
  OriginalRow227TriangleData1992.coefficient198_203,
  OriginalRow227TriangleData1992.coefficient198_204,
  OriginalRow227TriangleData1992.coefficient198_205,
  OriginalRow227TriangleData1992.coefficient198_206,
  OriginalRow227TriangleData1992.coefficient198_207,
  OriginalRow227TriangleData1992.coefficient198_208,
  OriginalRow227TriangleData1992.coefficient198_209,
  OriginalRow227TriangleData1992.coefficient198_210,
  OriginalRow227TriangleData1992.coefficient198_211,
  OriginalRow227TriangleData1992.coefficient198_212,
  OriginalRow227TriangleData1992.coefficient198_213,
  OriginalRow227TriangleData1992.coefficient198_214,
  OriginalRow227TriangleData1992.coefficient198_215,
  OriginalRow227TriangleData1992.coefficient198_216,
  OriginalRow227TriangleData1992.coefficient198_217,
  OriginalRow227TriangleData1992.coefficient198_218,
  OriginalRow227TriangleData1992.coefficient198_219,
  OriginalRow227TriangleData1992.coefficient198_220,
  OriginalRow227TriangleData1992.coefficient198_221,
  OriginalRow227TriangleData1992.coefficient198_222,
  OriginalRow227TriangleData1992.coefficient198_223,
  OriginalRow227TriangleData1992.coefficient198_224,
  OriginalRow227TriangleData1992.coefficient198_225,
  OriginalRow227TriangleData1992.coefficient198_226,
  OriginalRow227TriangleData1992.coefficient198_227,
  OriginalRow227TriangleData1992.coefficient198_228
]

theorem values1992_size : values1992.size = 32 := rfl

def block1992 : ℕ → Option IntervalDyadic := segment 197 values1992

theorem block1992_domain : ExactDomain block1992 197 229 := by
  simpa only [values1992_size] using segment_domain 197 values1992

theorem block1992_get (i : Fin 32) :
    block1992 (197 + i.val) = some (values1992[i.val]'(by rw [values1992_size]; exact i.isLt)) := by
  exact segment_get 197 values1992 ⟨i.val, by rw [values1992_size]; exact i.isLt⟩

def values1993 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1993.coefficient198_229,
  OriginalRow227TriangleData1993.coefficient198_230,
  OriginalRow227TriangleData1993.coefficient198_231,
  OriginalRow227TriangleData1993.coefficient198_232,
  OriginalRow227TriangleData1993.coefficient198_233,
  OriginalRow227TriangleData1993.coefficient198_234,
  OriginalRow227TriangleData1993.coefficient198_235,
  OriginalRow227TriangleData1993.coefficient198_236,
  OriginalRow227TriangleData1993.coefficient198_237,
  OriginalRow227TriangleData1993.coefficient198_238,
  OriginalRow227TriangleData1993.coefficient198_239,
  OriginalRow227TriangleData1993.coefficient198_240,
  OriginalRow227TriangleData1993.coefficient198_241,
  OriginalRow227TriangleData1993.coefficient198_242,
  OriginalRow227TriangleData1993.coefficient198_243,
  OriginalRow227TriangleData1993.coefficient198_244,
  OriginalRow227TriangleData1993.coefficient198_245,
  OriginalRow227TriangleData1993.coefficient198_246,
  OriginalRow227TriangleData1993.coefficient198_247,
  OriginalRow227TriangleData1993.coefficient198_248,
  OriginalRow227TriangleData1993.coefficient198_249,
  OriginalRow227TriangleData1993.coefficient198_250,
  OriginalRow227TriangleData1993.coefficient198_251,
  OriginalRow227TriangleData1993.coefficient198_252,
  OriginalRow227TriangleData1993.coefficient198_253,
  OriginalRow227TriangleData1993.coefficient198_254,
  OriginalRow227TriangleData1993.coefficient198_255,
  OriginalRow227TriangleData1993.coefficient198_256,
  OriginalRow227TriangleData1993.coefficient198_257,
  OriginalRow227TriangleData1993.coefficient198_258,
  OriginalRow227TriangleData1993.coefficient198_259,
  OriginalRow227TriangleData1993.coefficient198_260
]

theorem values1993_size : values1993.size = 32 := rfl

def block1993 : ℕ → Option IntervalDyadic := segment 229 values1993

theorem block1993_domain : ExactDomain block1993 229 261 := by
  simpa only [values1993_size] using segment_domain 229 values1993

theorem block1993_get (i : Fin 32) :
    block1993 (229 + i.val) = some (values1993[i.val]'(by rw [values1993_size]; exact i.isLt)) := by
  exact segment_get 229 values1993 ⟨i.val, by rw [values1993_size]; exact i.isLt⟩

def values1994 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1994.coefficient198_261,
  OriginalRow227TriangleData1994.coefficient198_262,
  OriginalRow227TriangleData1994.coefficient198_263,
  OriginalRow227TriangleData1994.coefficient198_264,
  OriginalRow227TriangleData1994.coefficient198_265,
  OriginalRow227TriangleData1994.coefficient198_266,
  OriginalRow227TriangleData1994.coefficient198_267,
  OriginalRow227TriangleData1994.coefficient198_268,
  OriginalRow227TriangleData1994.coefficient198_269,
  OriginalRow227TriangleData1994.coefficient198_270,
  OriginalRow227TriangleData1994.coefficient198_271,
  OriginalRow227TriangleData1994.coefficient198_272,
  OriginalRow227TriangleData1994.coefficient198_273,
  OriginalRow227TriangleData1994.coefficient198_274,
  OriginalRow227TriangleData1994.coefficient198_275,
  OriginalRow227TriangleData1994.coefficient198_276,
  OriginalRow227TriangleData1994.coefficient198_277,
  OriginalRow227TriangleData1994.coefficient198_278,
  OriginalRow227TriangleData1994.coefficient198_279,
  OriginalRow227TriangleData1994.coefficient198_280,
  OriginalRow227TriangleData1994.coefficient198_281,
  OriginalRow227TriangleData1994.coefficient198_282,
  OriginalRow227TriangleData1994.coefficient198_283,
  OriginalRow227TriangleData1994.coefficient198_284,
  OriginalRow227TriangleData1994.coefficient198_285,
  OriginalRow227TriangleData1994.coefficient198_286,
  OriginalRow227TriangleData1994.coefficient198_287,
  OriginalRow227TriangleData1994.coefficient198_288,
  OriginalRow227TriangleData1994.coefficient198_289,
  OriginalRow227TriangleData1994.coefficient198_290,
  OriginalRow227TriangleData1994.coefficient198_291,
  OriginalRow227TriangleData1994.coefficient198_292
]

theorem values1994_size : values1994.size = 32 := rfl

def block1994 : ℕ → Option IntervalDyadic := segment 261 values1994

theorem block1994_domain : ExactDomain block1994 261 293 := by
  simpa only [values1994_size] using segment_domain 261 values1994

theorem block1994_get (i : Fin 32) :
    block1994 (261 + i.val) = some (values1994[i.val]'(by rw [values1994_size]; exact i.isLt)) := by
  exact segment_get 261 values1994 ⟨i.val, by rw [values1994_size]; exact i.isLt⟩

def values1995 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1995.coefficient198_293,
  OriginalRow227TriangleData1995.coefficient198_294,
  OriginalRow227TriangleData1995.coefficient198_295,
  OriginalRow227TriangleData1995.coefficient198_296,
  OriginalRow227TriangleData1995.coefficient198_297,
  OriginalRow227TriangleData1995.coefficient198_298,
  OriginalRow227TriangleData1995.coefficient198_299,
  OriginalRow227TriangleData1995.coefficient198_300,
  OriginalRow227TriangleData1995.coefficient198_301,
  OriginalRow227TriangleData1995.coefficient198_302,
  OriginalRow227TriangleData1995.coefficient198_303
]

theorem values1995_size : values1995.size = 11 := rfl

def block1995 : ℕ → Option IntervalDyadic := segment 293 values1995

theorem block1995_domain : ExactDomain block1995 293 304 := by
  simpa only [values1995_size] using segment_domain 293 values1995

theorem block1995_get (i : Fin 11) :
    block1995 (293 + i.val) = some (values1995[i.val]'(by rw [values1995_size]; exact i.isLt)) := by
  exact segment_get 293 values1995 ⟨i.val, by rw [values1995_size]; exact i.isLt⟩

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block1992 block1993

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block1992_domain block1993_domain

def node0261_0304 : ℕ → Option IntervalDyadic := split 293 block1994 block1995

theorem node0261_0304_domain : ExactDomain node0261_0304 261 304 := by
  exact split_domain (by decide) (by decide) block1994_domain block1995_domain

def node0197_0304 : ℕ → Option IntervalDyadic := split 261 node0197_0261 node0261_0304

theorem node0197_0304_domain : ExactDomain node0197_0304 197 304 := by
  exact split_domain (by decide) (by decide) node0197_0261_domain node0261_0304_domain

def lookup : ℕ → Option IntervalDyadic := node0197_0304

theorem lookup_domain : ExactDomain lookup 197 304 :=
  node0197_0304_domain

theorem block1992_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values1992[i.val]'(by rw [values1992_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0197_0304 (197 + i.val) = _
  rw [node0197_0304, split_left 261 node0197_0261 node0261_0304 (by omega)]
  rw [node0197_0261, split_left 229 block1992 block1993 (by omega)]
  exact block1992_get i

theorem block1993_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values1993[i.val]'(by rw [values1993_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0197_0304 (229 + i.val) = _
  rw [node0197_0304, split_left 261 node0197_0261 node0261_0304 (by omega)]
  rw [node0197_0261, split_right 229 block1992 block1993 (by omega)]
  exact block1993_get i

theorem block1994_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values1994[i.val]'(by rw [values1994_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0197_0304 (261 + i.val) = _
  rw [node0197_0304, split_right 261 node0197_0261 node0261_0304 (by omega)]
  rw [node0261_0304, split_left 293 block1994 block1995 (by omega)]
  exact block1994_get i

theorem block1995_lookup (i : Fin 11) :
    lookup (293 + i.val) = some (values1995[i.val]'(by rw [values1995_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0197_0304 (293 + i.val) = _
  rw [node0197_0304, split_right 261 node0197_0261 node0261_0304 (by omega)]
  rw [node0261_0304, split_right 293 block1994 block1995 (by omega)]
  exact block1995_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1992_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1992_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1993_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1993_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1994_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1994_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1995_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1995_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1992_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1993_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1994_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow198.block1995_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow198
