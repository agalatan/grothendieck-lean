import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1932
import Grothe.UpperChaos.OriginalRow227TriangleData1933
import Grothe.UpperChaos.OriginalRow227TriangleData1934
import Grothe.UpperChaos.OriginalRow227TriangleData1935
import Grothe.UpperChaos.OriginalRow227TriangleData1936

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow184

open ConditionalTableLookup

def values1932 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1932.coefficient184_183,
  OriginalRow227TriangleData1932.coefficient184_184,
  OriginalRow227TriangleData1932.coefficient184_185,
  OriginalRow227TriangleData1932.coefficient184_186,
  OriginalRow227TriangleData1932.coefficient184_187,
  OriginalRow227TriangleData1932.coefficient184_188,
  OriginalRow227TriangleData1932.coefficient184_189,
  OriginalRow227TriangleData1932.coefficient184_190,
  OriginalRow227TriangleData1932.coefficient184_191,
  OriginalRow227TriangleData1932.coefficient184_192,
  OriginalRow227TriangleData1932.coefficient184_193,
  OriginalRow227TriangleData1932.coefficient184_194,
  OriginalRow227TriangleData1932.coefficient184_195,
  OriginalRow227TriangleData1932.coefficient184_196,
  OriginalRow227TriangleData1932.coefficient184_197,
  OriginalRow227TriangleData1932.coefficient184_198,
  OriginalRow227TriangleData1932.coefficient184_199,
  OriginalRow227TriangleData1932.coefficient184_200,
  OriginalRow227TriangleData1932.coefficient184_201,
  OriginalRow227TriangleData1932.coefficient184_202,
  OriginalRow227TriangleData1932.coefficient184_203,
  OriginalRow227TriangleData1932.coefficient184_204,
  OriginalRow227TriangleData1932.coefficient184_205,
  OriginalRow227TriangleData1932.coefficient184_206,
  OriginalRow227TriangleData1932.coefficient184_207,
  OriginalRow227TriangleData1932.coefficient184_208,
  OriginalRow227TriangleData1932.coefficient184_209,
  OriginalRow227TriangleData1932.coefficient184_210,
  OriginalRow227TriangleData1932.coefficient184_211,
  OriginalRow227TriangleData1932.coefficient184_212,
  OriginalRow227TriangleData1932.coefficient184_213,
  OriginalRow227TriangleData1932.coefficient184_214
]

theorem values1932_size : values1932.size = 32 := rfl

def block1932 : ℕ → Option IntervalDyadic := segment 183 values1932

theorem block1932_domain : ExactDomain block1932 183 215 := by
  simpa only [values1932_size] using segment_domain 183 values1932

theorem block1932_get (i : Fin 32) :
    block1932 (183 + i.val) = some (values1932[i.val]'(by rw [values1932_size]; exact i.isLt)) := by
  exact segment_get 183 values1932 ⟨i.val, by rw [values1932_size]; exact i.isLt⟩

def values1933 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1933.coefficient184_215,
  OriginalRow227TriangleData1933.coefficient184_216,
  OriginalRow227TriangleData1933.coefficient184_217,
  OriginalRow227TriangleData1933.coefficient184_218,
  OriginalRow227TriangleData1933.coefficient184_219,
  OriginalRow227TriangleData1933.coefficient184_220,
  OriginalRow227TriangleData1933.coefficient184_221,
  OriginalRow227TriangleData1933.coefficient184_222,
  OriginalRow227TriangleData1933.coefficient184_223,
  OriginalRow227TriangleData1933.coefficient184_224,
  OriginalRow227TriangleData1933.coefficient184_225,
  OriginalRow227TriangleData1933.coefficient184_226,
  OriginalRow227TriangleData1933.coefficient184_227,
  OriginalRow227TriangleData1933.coefficient184_228,
  OriginalRow227TriangleData1933.coefficient184_229,
  OriginalRow227TriangleData1933.coefficient184_230,
  OriginalRow227TriangleData1933.coefficient184_231,
  OriginalRow227TriangleData1933.coefficient184_232,
  OriginalRow227TriangleData1933.coefficient184_233,
  OriginalRow227TriangleData1933.coefficient184_234,
  OriginalRow227TriangleData1933.coefficient184_235,
  OriginalRow227TriangleData1933.coefficient184_236,
  OriginalRow227TriangleData1933.coefficient184_237,
  OriginalRow227TriangleData1933.coefficient184_238,
  OriginalRow227TriangleData1933.coefficient184_239,
  OriginalRow227TriangleData1933.coefficient184_240,
  OriginalRow227TriangleData1933.coefficient184_241,
  OriginalRow227TriangleData1933.coefficient184_242,
  OriginalRow227TriangleData1933.coefficient184_243,
  OriginalRow227TriangleData1933.coefficient184_244,
  OriginalRow227TriangleData1933.coefficient184_245,
  OriginalRow227TriangleData1933.coefficient184_246
]

theorem values1933_size : values1933.size = 32 := rfl

def block1933 : ℕ → Option IntervalDyadic := segment 215 values1933

theorem block1933_domain : ExactDomain block1933 215 247 := by
  simpa only [values1933_size] using segment_domain 215 values1933

theorem block1933_get (i : Fin 32) :
    block1933 (215 + i.val) = some (values1933[i.val]'(by rw [values1933_size]; exact i.isLt)) := by
  exact segment_get 215 values1933 ⟨i.val, by rw [values1933_size]; exact i.isLt⟩

def values1934 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1934.coefficient184_247,
  OriginalRow227TriangleData1934.coefficient184_248,
  OriginalRow227TriangleData1934.coefficient184_249,
  OriginalRow227TriangleData1934.coefficient184_250,
  OriginalRow227TriangleData1934.coefficient184_251,
  OriginalRow227TriangleData1934.coefficient184_252,
  OriginalRow227TriangleData1934.coefficient184_253,
  OriginalRow227TriangleData1934.coefficient184_254,
  OriginalRow227TriangleData1934.coefficient184_255,
  OriginalRow227TriangleData1934.coefficient184_256,
  OriginalRow227TriangleData1934.coefficient184_257,
  OriginalRow227TriangleData1934.coefficient184_258,
  OriginalRow227TriangleData1934.coefficient184_259,
  OriginalRow227TriangleData1934.coefficient184_260,
  OriginalRow227TriangleData1934.coefficient184_261,
  OriginalRow227TriangleData1934.coefficient184_262,
  OriginalRow227TriangleData1934.coefficient184_263,
  OriginalRow227TriangleData1934.coefficient184_264,
  OriginalRow227TriangleData1934.coefficient184_265,
  OriginalRow227TriangleData1934.coefficient184_266,
  OriginalRow227TriangleData1934.coefficient184_267,
  OriginalRow227TriangleData1934.coefficient184_268,
  OriginalRow227TriangleData1934.coefficient184_269,
  OriginalRow227TriangleData1934.coefficient184_270,
  OriginalRow227TriangleData1934.coefficient184_271,
  OriginalRow227TriangleData1934.coefficient184_272,
  OriginalRow227TriangleData1934.coefficient184_273,
  OriginalRow227TriangleData1934.coefficient184_274,
  OriginalRow227TriangleData1934.coefficient184_275,
  OriginalRow227TriangleData1934.coefficient184_276,
  OriginalRow227TriangleData1934.coefficient184_277,
  OriginalRow227TriangleData1934.coefficient184_278
]

theorem values1934_size : values1934.size = 32 := rfl

def block1934 : ℕ → Option IntervalDyadic := segment 247 values1934

theorem block1934_domain : ExactDomain block1934 247 279 := by
  simpa only [values1934_size] using segment_domain 247 values1934

theorem block1934_get (i : Fin 32) :
    block1934 (247 + i.val) = some (values1934[i.val]'(by rw [values1934_size]; exact i.isLt)) := by
  exact segment_get 247 values1934 ⟨i.val, by rw [values1934_size]; exact i.isLt⟩

def values1935 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1935.coefficient184_279,
  OriginalRow227TriangleData1935.coefficient184_280,
  OriginalRow227TriangleData1935.coefficient184_281,
  OriginalRow227TriangleData1935.coefficient184_282,
  OriginalRow227TriangleData1935.coefficient184_283,
  OriginalRow227TriangleData1935.coefficient184_284,
  OriginalRow227TriangleData1935.coefficient184_285,
  OriginalRow227TriangleData1935.coefficient184_286,
  OriginalRow227TriangleData1935.coefficient184_287,
  OriginalRow227TriangleData1935.coefficient184_288,
  OriginalRow227TriangleData1935.coefficient184_289,
  OriginalRow227TriangleData1935.coefficient184_290,
  OriginalRow227TriangleData1935.coefficient184_291,
  OriginalRow227TriangleData1935.coefficient184_292,
  OriginalRow227TriangleData1935.coefficient184_293,
  OriginalRow227TriangleData1935.coefficient184_294,
  OriginalRow227TriangleData1935.coefficient184_295,
  OriginalRow227TriangleData1935.coefficient184_296,
  OriginalRow227TriangleData1935.coefficient184_297,
  OriginalRow227TriangleData1935.coefficient184_298,
  OriginalRow227TriangleData1935.coefficient184_299,
  OriginalRow227TriangleData1935.coefficient184_300,
  OriginalRow227TriangleData1935.coefficient184_301,
  OriginalRow227TriangleData1935.coefficient184_302,
  OriginalRow227TriangleData1935.coefficient184_303,
  OriginalRow227TriangleData1935.coefficient184_304,
  OriginalRow227TriangleData1935.coefficient184_305,
  OriginalRow227TriangleData1935.coefficient184_306,
  OriginalRow227TriangleData1935.coefficient184_307,
  OriginalRow227TriangleData1935.coefficient184_308,
  OriginalRow227TriangleData1935.coefficient184_309,
  OriginalRow227TriangleData1935.coefficient184_310
]

theorem values1935_size : values1935.size = 32 := rfl

def block1935 : ℕ → Option IntervalDyadic := segment 279 values1935

theorem block1935_domain : ExactDomain block1935 279 311 := by
  simpa only [values1935_size] using segment_domain 279 values1935

theorem block1935_get (i : Fin 32) :
    block1935 (279 + i.val) = some (values1935[i.val]'(by rw [values1935_size]; exact i.isLt)) := by
  exact segment_get 279 values1935 ⟨i.val, by rw [values1935_size]; exact i.isLt⟩

def values1936 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1936.coefficient184_311,
  OriginalRow227TriangleData1936.coefficient184_312,
  OriginalRow227TriangleData1936.coefficient184_313,
  OriginalRow227TriangleData1936.coefficient184_314,
  OriginalRow227TriangleData1936.coefficient184_315,
  OriginalRow227TriangleData1936.coefficient184_316,
  OriginalRow227TriangleData1936.coefficient184_317
]

theorem values1936_size : values1936.size = 7 := rfl

def block1936 : ℕ → Option IntervalDyadic := segment 311 values1936

theorem block1936_domain : ExactDomain block1936 311 318 := by
  simpa only [values1936_size] using segment_domain 311 values1936

theorem block1936_get (i : Fin 7) :
    block1936 (311 + i.val) = some (values1936[i.val]'(by rw [values1936_size]; exact i.isLt)) := by
  exact segment_get 311 values1936 ⟨i.val, by rw [values1936_size]; exact i.isLt⟩

def node0183_0247 : ℕ → Option IntervalDyadic := split 215 block1932 block1933

theorem node0183_0247_domain : ExactDomain node0183_0247 183 247 := by
  exact split_domain (by decide) (by decide) block1932_domain block1933_domain

def node0279_0318 : ℕ → Option IntervalDyadic := split 311 block1935 block1936

theorem node0279_0318_domain : ExactDomain node0279_0318 279 318 := by
  exact split_domain (by decide) (by decide) block1935_domain block1936_domain

def node0247_0318 : ℕ → Option IntervalDyadic := split 279 block1934 node0279_0318

theorem node0247_0318_domain : ExactDomain node0247_0318 247 318 := by
  exact split_domain (by decide) (by decide) block1934_domain node0279_0318_domain

def node0183_0318 : ℕ → Option IntervalDyadic := split 247 node0183_0247 node0247_0318

theorem node0183_0318_domain : ExactDomain node0183_0318 183 318 := by
  exact split_domain (by decide) (by decide) node0183_0247_domain node0247_0318_domain

def lookup : ℕ → Option IntervalDyadic := node0183_0318

theorem lookup_domain : ExactDomain lookup 183 318 :=
  node0183_0318_domain

theorem block1932_lookup (i : Fin 32) :
    lookup (183 + i.val) = some (values1932[i.val]'(by rw [values1932_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0183_0318 (183 + i.val) = _
  rw [node0183_0318, split_left 247 node0183_0247 node0247_0318 (by omega)]
  rw [node0183_0247, split_left 215 block1932 block1933 (by omega)]
  exact block1932_get i

theorem block1933_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values1933[i.val]'(by rw [values1933_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0183_0318 (215 + i.val) = _
  rw [node0183_0318, split_left 247 node0183_0247 node0247_0318 (by omega)]
  rw [node0183_0247, split_right 215 block1932 block1933 (by omega)]
  exact block1933_get i

theorem block1934_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values1934[i.val]'(by rw [values1934_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0183_0318 (247 + i.val) = _
  rw [node0183_0318, split_right 247 node0183_0247 node0247_0318 (by omega)]
  rw [node0247_0318, split_left 279 block1934 node0279_0318 (by omega)]
  exact block1934_get i

theorem block1935_lookup (i : Fin 32) :
    lookup (279 + i.val) = some (values1935[i.val]'(by rw [values1935_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0183_0318 (279 + i.val) = _
  rw [node0183_0318, split_right 247 node0183_0247 node0247_0318 (by omega)]
  rw [node0247_0318, split_right 279 block1934 node0279_0318 (by omega)]
  rw [node0279_0318, split_left 311 block1935 block1936 (by omega)]
  exact block1935_get i

theorem block1936_lookup (i : Fin 7) :
    lookup (311 + i.val) = some (values1936[i.val]'(by rw [values1936_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0183_0318 (311 + i.val) = _
  rw [node0183_0318, split_right 247 node0183_0247 node0247_0318 (by omega)]
  rw [node0247_0318, split_right 279 block1934 node0279_0318 (by omega)]
  rw [node0279_0318, split_right 311 block1935 block1936 (by omega)]
  exact block1936_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1932_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1932_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1933_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1933_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1934_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1934_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1935_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1935_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1936_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1936_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1932_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1933_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1934_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1935_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow184.block1936_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow184
