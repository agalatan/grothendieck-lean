import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1960
import Grothe.UpperChaos.OriginalRow227TriangleData1961
import Grothe.UpperChaos.OriginalRow227TriangleData1962
import Grothe.UpperChaos.OriginalRow227TriangleData1963

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow190

open ConditionalTableLookup

def values1960 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1960.coefficient190_189,
  OriginalRow227TriangleData1960.coefficient190_190,
  OriginalRow227TriangleData1960.coefficient190_191,
  OriginalRow227TriangleData1960.coefficient190_192,
  OriginalRow227TriangleData1960.coefficient190_193,
  OriginalRow227TriangleData1960.coefficient190_194,
  OriginalRow227TriangleData1960.coefficient190_195,
  OriginalRow227TriangleData1960.coefficient190_196,
  OriginalRow227TriangleData1960.coefficient190_197,
  OriginalRow227TriangleData1960.coefficient190_198,
  OriginalRow227TriangleData1960.coefficient190_199,
  OriginalRow227TriangleData1960.coefficient190_200,
  OriginalRow227TriangleData1960.coefficient190_201,
  OriginalRow227TriangleData1960.coefficient190_202,
  OriginalRow227TriangleData1960.coefficient190_203,
  OriginalRow227TriangleData1960.coefficient190_204,
  OriginalRow227TriangleData1960.coefficient190_205,
  OriginalRow227TriangleData1960.coefficient190_206,
  OriginalRow227TriangleData1960.coefficient190_207,
  OriginalRow227TriangleData1960.coefficient190_208,
  OriginalRow227TriangleData1960.coefficient190_209,
  OriginalRow227TriangleData1960.coefficient190_210,
  OriginalRow227TriangleData1960.coefficient190_211,
  OriginalRow227TriangleData1960.coefficient190_212,
  OriginalRow227TriangleData1960.coefficient190_213,
  OriginalRow227TriangleData1960.coefficient190_214,
  OriginalRow227TriangleData1960.coefficient190_215,
  OriginalRow227TriangleData1960.coefficient190_216,
  OriginalRow227TriangleData1960.coefficient190_217,
  OriginalRow227TriangleData1960.coefficient190_218,
  OriginalRow227TriangleData1960.coefficient190_219,
  OriginalRow227TriangleData1960.coefficient190_220
]

theorem values1960_size : values1960.size = 32 := rfl

def block1960 : ℕ → Option IntervalDyadic := segment 189 values1960

theorem block1960_domain : ExactDomain block1960 189 221 := by
  simpa only [values1960_size] using segment_domain 189 values1960

theorem block1960_get (i : Fin 32) :
    block1960 (189 + i.val) = some (values1960[i.val]'(by rw [values1960_size]; exact i.isLt)) := by
  exact segment_get 189 values1960 ⟨i.val, by rw [values1960_size]; exact i.isLt⟩

def values1961 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1961.coefficient190_221,
  OriginalRow227TriangleData1961.coefficient190_222,
  OriginalRow227TriangleData1961.coefficient190_223,
  OriginalRow227TriangleData1961.coefficient190_224,
  OriginalRow227TriangleData1961.coefficient190_225,
  OriginalRow227TriangleData1961.coefficient190_226,
  OriginalRow227TriangleData1961.coefficient190_227,
  OriginalRow227TriangleData1961.coefficient190_228,
  OriginalRow227TriangleData1961.coefficient190_229,
  OriginalRow227TriangleData1961.coefficient190_230,
  OriginalRow227TriangleData1961.coefficient190_231,
  OriginalRow227TriangleData1961.coefficient190_232,
  OriginalRow227TriangleData1961.coefficient190_233,
  OriginalRow227TriangleData1961.coefficient190_234,
  OriginalRow227TriangleData1961.coefficient190_235,
  OriginalRow227TriangleData1961.coefficient190_236,
  OriginalRow227TriangleData1961.coefficient190_237,
  OriginalRow227TriangleData1961.coefficient190_238,
  OriginalRow227TriangleData1961.coefficient190_239,
  OriginalRow227TriangleData1961.coefficient190_240,
  OriginalRow227TriangleData1961.coefficient190_241,
  OriginalRow227TriangleData1961.coefficient190_242,
  OriginalRow227TriangleData1961.coefficient190_243,
  OriginalRow227TriangleData1961.coefficient190_244,
  OriginalRow227TriangleData1961.coefficient190_245,
  OriginalRow227TriangleData1961.coefficient190_246,
  OriginalRow227TriangleData1961.coefficient190_247,
  OriginalRow227TriangleData1961.coefficient190_248,
  OriginalRow227TriangleData1961.coefficient190_249,
  OriginalRow227TriangleData1961.coefficient190_250,
  OriginalRow227TriangleData1961.coefficient190_251,
  OriginalRow227TriangleData1961.coefficient190_252
]

theorem values1961_size : values1961.size = 32 := rfl

def block1961 : ℕ → Option IntervalDyadic := segment 221 values1961

theorem block1961_domain : ExactDomain block1961 221 253 := by
  simpa only [values1961_size] using segment_domain 221 values1961

theorem block1961_get (i : Fin 32) :
    block1961 (221 + i.val) = some (values1961[i.val]'(by rw [values1961_size]; exact i.isLt)) := by
  exact segment_get 221 values1961 ⟨i.val, by rw [values1961_size]; exact i.isLt⟩

def values1962 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1962.coefficient190_253,
  OriginalRow227TriangleData1962.coefficient190_254,
  OriginalRow227TriangleData1962.coefficient190_255,
  OriginalRow227TriangleData1962.coefficient190_256,
  OriginalRow227TriangleData1962.coefficient190_257,
  OriginalRow227TriangleData1962.coefficient190_258,
  OriginalRow227TriangleData1962.coefficient190_259,
  OriginalRow227TriangleData1962.coefficient190_260,
  OriginalRow227TriangleData1962.coefficient190_261,
  OriginalRow227TriangleData1962.coefficient190_262,
  OriginalRow227TriangleData1962.coefficient190_263,
  OriginalRow227TriangleData1962.coefficient190_264,
  OriginalRow227TriangleData1962.coefficient190_265,
  OriginalRow227TriangleData1962.coefficient190_266,
  OriginalRow227TriangleData1962.coefficient190_267,
  OriginalRow227TriangleData1962.coefficient190_268,
  OriginalRow227TriangleData1962.coefficient190_269,
  OriginalRow227TriangleData1962.coefficient190_270,
  OriginalRow227TriangleData1962.coefficient190_271,
  OriginalRow227TriangleData1962.coefficient190_272,
  OriginalRow227TriangleData1962.coefficient190_273,
  OriginalRow227TriangleData1962.coefficient190_274,
  OriginalRow227TriangleData1962.coefficient190_275,
  OriginalRow227TriangleData1962.coefficient190_276,
  OriginalRow227TriangleData1962.coefficient190_277,
  OriginalRow227TriangleData1962.coefficient190_278,
  OriginalRow227TriangleData1962.coefficient190_279,
  OriginalRow227TriangleData1962.coefficient190_280,
  OriginalRow227TriangleData1962.coefficient190_281,
  OriginalRow227TriangleData1962.coefficient190_282,
  OriginalRow227TriangleData1962.coefficient190_283,
  OriginalRow227TriangleData1962.coefficient190_284
]

theorem values1962_size : values1962.size = 32 := rfl

def block1962 : ℕ → Option IntervalDyadic := segment 253 values1962

theorem block1962_domain : ExactDomain block1962 253 285 := by
  simpa only [values1962_size] using segment_domain 253 values1962

theorem block1962_get (i : Fin 32) :
    block1962 (253 + i.val) = some (values1962[i.val]'(by rw [values1962_size]; exact i.isLt)) := by
  exact segment_get 253 values1962 ⟨i.val, by rw [values1962_size]; exact i.isLt⟩

def values1963 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1963.coefficient190_285,
  OriginalRow227TriangleData1963.coefficient190_286,
  OriginalRow227TriangleData1963.coefficient190_287,
  OriginalRow227TriangleData1963.coefficient190_288,
  OriginalRow227TriangleData1963.coefficient190_289,
  OriginalRow227TriangleData1963.coefficient190_290,
  OriginalRow227TriangleData1963.coefficient190_291,
  OriginalRow227TriangleData1963.coefficient190_292,
  OriginalRow227TriangleData1963.coefficient190_293,
  OriginalRow227TriangleData1963.coefficient190_294,
  OriginalRow227TriangleData1963.coefficient190_295,
  OriginalRow227TriangleData1963.coefficient190_296,
  OriginalRow227TriangleData1963.coefficient190_297,
  OriginalRow227TriangleData1963.coefficient190_298,
  OriginalRow227TriangleData1963.coefficient190_299,
  OriginalRow227TriangleData1963.coefficient190_300,
  OriginalRow227TriangleData1963.coefficient190_301,
  OriginalRow227TriangleData1963.coefficient190_302,
  OriginalRow227TriangleData1963.coefficient190_303,
  OriginalRow227TriangleData1963.coefficient190_304,
  OriginalRow227TriangleData1963.coefficient190_305,
  OriginalRow227TriangleData1963.coefficient190_306,
  OriginalRow227TriangleData1963.coefficient190_307,
  OriginalRow227TriangleData1963.coefficient190_308,
  OriginalRow227TriangleData1963.coefficient190_309,
  OriginalRow227TriangleData1963.coefficient190_310,
  OriginalRow227TriangleData1963.coefficient190_311
]

theorem values1963_size : values1963.size = 27 := rfl

def block1963 : ℕ → Option IntervalDyadic := segment 285 values1963

theorem block1963_domain : ExactDomain block1963 285 312 := by
  simpa only [values1963_size] using segment_domain 285 values1963

theorem block1963_get (i : Fin 27) :
    block1963 (285 + i.val) = some (values1963[i.val]'(by rw [values1963_size]; exact i.isLt)) := by
  exact segment_get 285 values1963 ⟨i.val, by rw [values1963_size]; exact i.isLt⟩

def node0189_0253 : ℕ → Option IntervalDyadic := split 221 block1960 block1961

theorem node0189_0253_domain : ExactDomain node0189_0253 189 253 := by
  exact split_domain (by decide) (by decide) block1960_domain block1961_domain

def node0253_0312 : ℕ → Option IntervalDyadic := split 285 block1962 block1963

theorem node0253_0312_domain : ExactDomain node0253_0312 253 312 := by
  exact split_domain (by decide) (by decide) block1962_domain block1963_domain

def node0189_0312 : ℕ → Option IntervalDyadic := split 253 node0189_0253 node0253_0312

theorem node0189_0312_domain : ExactDomain node0189_0312 189 312 := by
  exact split_domain (by decide) (by decide) node0189_0253_domain node0253_0312_domain

def lookup : ℕ → Option IntervalDyadic := node0189_0312

theorem lookup_domain : ExactDomain lookup 189 312 :=
  node0189_0312_domain

theorem block1960_lookup (i : Fin 32) :
    lookup (189 + i.val) = some (values1960[i.val]'(by rw [values1960_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0189_0312 (189 + i.val) = _
  rw [node0189_0312, split_left 253 node0189_0253 node0253_0312 (by omega)]
  rw [node0189_0253, split_left 221 block1960 block1961 (by omega)]
  exact block1960_get i

theorem block1961_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values1961[i.val]'(by rw [values1961_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0189_0312 (221 + i.val) = _
  rw [node0189_0312, split_left 253 node0189_0253 node0253_0312 (by omega)]
  rw [node0189_0253, split_right 221 block1960 block1961 (by omega)]
  exact block1961_get i

theorem block1962_lookup (i : Fin 32) :
    lookup (253 + i.val) = some (values1962[i.val]'(by rw [values1962_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0189_0312 (253 + i.val) = _
  rw [node0189_0312, split_right 253 node0189_0253 node0253_0312 (by omega)]
  rw [node0253_0312, split_left 285 block1962 block1963 (by omega)]
  exact block1962_get i

theorem block1963_lookup (i : Fin 27) :
    lookup (285 + i.val) = some (values1963[i.val]'(by rw [values1963_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0189_0312 (285 + i.val) = _
  rw [node0189_0312, split_right 253 node0189_0253 node0253_0312 (by omega)]
  rw [node0253_0312, split_right 285 block1962 block1963 (by omega)]
  exact block1963_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1960_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1960_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1961_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1961_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1962_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1962_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1963_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1963_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1960_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1961_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1962_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow190.block1963_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow190
