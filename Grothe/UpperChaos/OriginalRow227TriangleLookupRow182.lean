import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1922
import Grothe.UpperChaos.OriginalRow227TriangleData1923
import Grothe.UpperChaos.OriginalRow227TriangleData1924
import Grothe.UpperChaos.OriginalRow227TriangleData1925
import Grothe.UpperChaos.OriginalRow227TriangleData1926

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow182

open ConditionalTableLookup

def values1922 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1922.coefficient182_181,
  OriginalRow227TriangleData1922.coefficient182_182,
  OriginalRow227TriangleData1922.coefficient182_183,
  OriginalRow227TriangleData1922.coefficient182_184,
  OriginalRow227TriangleData1922.coefficient182_185,
  OriginalRow227TriangleData1922.coefficient182_186,
  OriginalRow227TriangleData1922.coefficient182_187,
  OriginalRow227TriangleData1922.coefficient182_188,
  OriginalRow227TriangleData1922.coefficient182_189,
  OriginalRow227TriangleData1922.coefficient182_190,
  OriginalRow227TriangleData1922.coefficient182_191,
  OriginalRow227TriangleData1922.coefficient182_192,
  OriginalRow227TriangleData1922.coefficient182_193,
  OriginalRow227TriangleData1922.coefficient182_194,
  OriginalRow227TriangleData1922.coefficient182_195,
  OriginalRow227TriangleData1922.coefficient182_196,
  OriginalRow227TriangleData1922.coefficient182_197,
  OriginalRow227TriangleData1922.coefficient182_198,
  OriginalRow227TriangleData1922.coefficient182_199,
  OriginalRow227TriangleData1922.coefficient182_200,
  OriginalRow227TriangleData1922.coefficient182_201,
  OriginalRow227TriangleData1922.coefficient182_202,
  OriginalRow227TriangleData1922.coefficient182_203,
  OriginalRow227TriangleData1922.coefficient182_204,
  OriginalRow227TriangleData1922.coefficient182_205,
  OriginalRow227TriangleData1922.coefficient182_206,
  OriginalRow227TriangleData1922.coefficient182_207,
  OriginalRow227TriangleData1922.coefficient182_208,
  OriginalRow227TriangleData1922.coefficient182_209,
  OriginalRow227TriangleData1922.coefficient182_210,
  OriginalRow227TriangleData1922.coefficient182_211,
  OriginalRow227TriangleData1922.coefficient182_212
]

theorem values1922_size : values1922.size = 32 := rfl

def block1922 : ℕ → Option IntervalDyadic := segment 181 values1922

theorem block1922_domain : ExactDomain block1922 181 213 := by
  simpa only [values1922_size] using segment_domain 181 values1922

theorem block1922_get (i : Fin 32) :
    block1922 (181 + i.val) = some (values1922[i.val]'(by rw [values1922_size]; exact i.isLt)) := by
  exact segment_get 181 values1922 ⟨i.val, by rw [values1922_size]; exact i.isLt⟩

def values1923 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1923.coefficient182_213,
  OriginalRow227TriangleData1923.coefficient182_214,
  OriginalRow227TriangleData1923.coefficient182_215,
  OriginalRow227TriangleData1923.coefficient182_216,
  OriginalRow227TriangleData1923.coefficient182_217,
  OriginalRow227TriangleData1923.coefficient182_218,
  OriginalRow227TriangleData1923.coefficient182_219,
  OriginalRow227TriangleData1923.coefficient182_220,
  OriginalRow227TriangleData1923.coefficient182_221,
  OriginalRow227TriangleData1923.coefficient182_222,
  OriginalRow227TriangleData1923.coefficient182_223,
  OriginalRow227TriangleData1923.coefficient182_224,
  OriginalRow227TriangleData1923.coefficient182_225,
  OriginalRow227TriangleData1923.coefficient182_226,
  OriginalRow227TriangleData1923.coefficient182_227,
  OriginalRow227TriangleData1923.coefficient182_228,
  OriginalRow227TriangleData1923.coefficient182_229,
  OriginalRow227TriangleData1923.coefficient182_230,
  OriginalRow227TriangleData1923.coefficient182_231,
  OriginalRow227TriangleData1923.coefficient182_232,
  OriginalRow227TriangleData1923.coefficient182_233,
  OriginalRow227TriangleData1923.coefficient182_234,
  OriginalRow227TriangleData1923.coefficient182_235,
  OriginalRow227TriangleData1923.coefficient182_236,
  OriginalRow227TriangleData1923.coefficient182_237,
  OriginalRow227TriangleData1923.coefficient182_238,
  OriginalRow227TriangleData1923.coefficient182_239,
  OriginalRow227TriangleData1923.coefficient182_240,
  OriginalRow227TriangleData1923.coefficient182_241,
  OriginalRow227TriangleData1923.coefficient182_242,
  OriginalRow227TriangleData1923.coefficient182_243,
  OriginalRow227TriangleData1923.coefficient182_244
]

theorem values1923_size : values1923.size = 32 := rfl

def block1923 : ℕ → Option IntervalDyadic := segment 213 values1923

theorem block1923_domain : ExactDomain block1923 213 245 := by
  simpa only [values1923_size] using segment_domain 213 values1923

theorem block1923_get (i : Fin 32) :
    block1923 (213 + i.val) = some (values1923[i.val]'(by rw [values1923_size]; exact i.isLt)) := by
  exact segment_get 213 values1923 ⟨i.val, by rw [values1923_size]; exact i.isLt⟩

def values1924 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1924.coefficient182_245,
  OriginalRow227TriangleData1924.coefficient182_246,
  OriginalRow227TriangleData1924.coefficient182_247,
  OriginalRow227TriangleData1924.coefficient182_248,
  OriginalRow227TriangleData1924.coefficient182_249,
  OriginalRow227TriangleData1924.coefficient182_250,
  OriginalRow227TriangleData1924.coefficient182_251,
  OriginalRow227TriangleData1924.coefficient182_252,
  OriginalRow227TriangleData1924.coefficient182_253,
  OriginalRow227TriangleData1924.coefficient182_254,
  OriginalRow227TriangleData1924.coefficient182_255,
  OriginalRow227TriangleData1924.coefficient182_256,
  OriginalRow227TriangleData1924.coefficient182_257,
  OriginalRow227TriangleData1924.coefficient182_258,
  OriginalRow227TriangleData1924.coefficient182_259,
  OriginalRow227TriangleData1924.coefficient182_260,
  OriginalRow227TriangleData1924.coefficient182_261,
  OriginalRow227TriangleData1924.coefficient182_262,
  OriginalRow227TriangleData1924.coefficient182_263,
  OriginalRow227TriangleData1924.coefficient182_264,
  OriginalRow227TriangleData1924.coefficient182_265,
  OriginalRow227TriangleData1924.coefficient182_266,
  OriginalRow227TriangleData1924.coefficient182_267,
  OriginalRow227TriangleData1924.coefficient182_268,
  OriginalRow227TriangleData1924.coefficient182_269,
  OriginalRow227TriangleData1924.coefficient182_270,
  OriginalRow227TriangleData1924.coefficient182_271,
  OriginalRow227TriangleData1924.coefficient182_272,
  OriginalRow227TriangleData1924.coefficient182_273,
  OriginalRow227TriangleData1924.coefficient182_274,
  OriginalRow227TriangleData1924.coefficient182_275,
  OriginalRow227TriangleData1924.coefficient182_276
]

theorem values1924_size : values1924.size = 32 := rfl

def block1924 : ℕ → Option IntervalDyadic := segment 245 values1924

theorem block1924_domain : ExactDomain block1924 245 277 := by
  simpa only [values1924_size] using segment_domain 245 values1924

theorem block1924_get (i : Fin 32) :
    block1924 (245 + i.val) = some (values1924[i.val]'(by rw [values1924_size]; exact i.isLt)) := by
  exact segment_get 245 values1924 ⟨i.val, by rw [values1924_size]; exact i.isLt⟩

def values1925 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1925.coefficient182_277,
  OriginalRow227TriangleData1925.coefficient182_278,
  OriginalRow227TriangleData1925.coefficient182_279,
  OriginalRow227TriangleData1925.coefficient182_280,
  OriginalRow227TriangleData1925.coefficient182_281,
  OriginalRow227TriangleData1925.coefficient182_282,
  OriginalRow227TriangleData1925.coefficient182_283,
  OriginalRow227TriangleData1925.coefficient182_284,
  OriginalRow227TriangleData1925.coefficient182_285,
  OriginalRow227TriangleData1925.coefficient182_286,
  OriginalRow227TriangleData1925.coefficient182_287,
  OriginalRow227TriangleData1925.coefficient182_288,
  OriginalRow227TriangleData1925.coefficient182_289,
  OriginalRow227TriangleData1925.coefficient182_290,
  OriginalRow227TriangleData1925.coefficient182_291,
  OriginalRow227TriangleData1925.coefficient182_292,
  OriginalRow227TriangleData1925.coefficient182_293,
  OriginalRow227TriangleData1925.coefficient182_294,
  OriginalRow227TriangleData1925.coefficient182_295,
  OriginalRow227TriangleData1925.coefficient182_296,
  OriginalRow227TriangleData1925.coefficient182_297,
  OriginalRow227TriangleData1925.coefficient182_298,
  OriginalRow227TriangleData1925.coefficient182_299,
  OriginalRow227TriangleData1925.coefficient182_300,
  OriginalRow227TriangleData1925.coefficient182_301,
  OriginalRow227TriangleData1925.coefficient182_302,
  OriginalRow227TriangleData1925.coefficient182_303,
  OriginalRow227TriangleData1925.coefficient182_304,
  OriginalRow227TriangleData1925.coefficient182_305,
  OriginalRow227TriangleData1925.coefficient182_306,
  OriginalRow227TriangleData1925.coefficient182_307,
  OriginalRow227TriangleData1925.coefficient182_308
]

theorem values1925_size : values1925.size = 32 := rfl

def block1925 : ℕ → Option IntervalDyadic := segment 277 values1925

theorem block1925_domain : ExactDomain block1925 277 309 := by
  simpa only [values1925_size] using segment_domain 277 values1925

theorem block1925_get (i : Fin 32) :
    block1925 (277 + i.val) = some (values1925[i.val]'(by rw [values1925_size]; exact i.isLt)) := by
  exact segment_get 277 values1925 ⟨i.val, by rw [values1925_size]; exact i.isLt⟩

def values1926 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1926.coefficient182_309,
  OriginalRow227TriangleData1926.coefficient182_310,
  OriginalRow227TriangleData1926.coefficient182_311,
  OriginalRow227TriangleData1926.coefficient182_312,
  OriginalRow227TriangleData1926.coefficient182_313,
  OriginalRow227TriangleData1926.coefficient182_314,
  OriginalRow227TriangleData1926.coefficient182_315,
  OriginalRow227TriangleData1926.coefficient182_316,
  OriginalRow227TriangleData1926.coefficient182_317,
  OriginalRow227TriangleData1926.coefficient182_318,
  OriginalRow227TriangleData1926.coefficient182_319
]

theorem values1926_size : values1926.size = 11 := rfl

def block1926 : ℕ → Option IntervalDyadic := segment 309 values1926

theorem block1926_domain : ExactDomain block1926 309 320 := by
  simpa only [values1926_size] using segment_domain 309 values1926

theorem block1926_get (i : Fin 11) :
    block1926 (309 + i.val) = some (values1926[i.val]'(by rw [values1926_size]; exact i.isLt)) := by
  exact segment_get 309 values1926 ⟨i.val, by rw [values1926_size]; exact i.isLt⟩

def node0181_0245 : ℕ → Option IntervalDyadic := split 213 block1922 block1923

theorem node0181_0245_domain : ExactDomain node0181_0245 181 245 := by
  exact split_domain (by decide) (by decide) block1922_domain block1923_domain

def node0277_0320 : ℕ → Option IntervalDyadic := split 309 block1925 block1926

theorem node0277_0320_domain : ExactDomain node0277_0320 277 320 := by
  exact split_domain (by decide) (by decide) block1925_domain block1926_domain

def node0245_0320 : ℕ → Option IntervalDyadic := split 277 block1924 node0277_0320

theorem node0245_0320_domain : ExactDomain node0245_0320 245 320 := by
  exact split_domain (by decide) (by decide) block1924_domain node0277_0320_domain

def node0181_0320 : ℕ → Option IntervalDyadic := split 245 node0181_0245 node0245_0320

theorem node0181_0320_domain : ExactDomain node0181_0320 181 320 := by
  exact split_domain (by decide) (by decide) node0181_0245_domain node0245_0320_domain

def lookup : ℕ → Option IntervalDyadic := node0181_0320

theorem lookup_domain : ExactDomain lookup 181 320 :=
  node0181_0320_domain

theorem block1922_lookup (i : Fin 32) :
    lookup (181 + i.val) = some (values1922[i.val]'(by rw [values1922_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0181_0320 (181 + i.val) = _
  rw [node0181_0320, split_left 245 node0181_0245 node0245_0320 (by omega)]
  rw [node0181_0245, split_left 213 block1922 block1923 (by omega)]
  exact block1922_get i

theorem block1923_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values1923[i.val]'(by rw [values1923_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0181_0320 (213 + i.val) = _
  rw [node0181_0320, split_left 245 node0181_0245 node0245_0320 (by omega)]
  rw [node0181_0245, split_right 213 block1922 block1923 (by omega)]
  exact block1923_get i

theorem block1924_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values1924[i.val]'(by rw [values1924_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0181_0320 (245 + i.val) = _
  rw [node0181_0320, split_right 245 node0181_0245 node0245_0320 (by omega)]
  rw [node0245_0320, split_left 277 block1924 node0277_0320 (by omega)]
  exact block1924_get i

theorem block1925_lookup (i : Fin 32) :
    lookup (277 + i.val) = some (values1925[i.val]'(by rw [values1925_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0181_0320 (277 + i.val) = _
  rw [node0181_0320, split_right 245 node0181_0245 node0245_0320 (by omega)]
  rw [node0245_0320, split_right 277 block1924 node0277_0320 (by omega)]
  rw [node0277_0320, split_left 309 block1925 block1926 (by omega)]
  exact block1925_get i

theorem block1926_lookup (i : Fin 11) :
    lookup (309 + i.val) = some (values1926[i.val]'(by rw [values1926_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0181_0320 (309 + i.val) = _
  rw [node0181_0320, split_right 245 node0181_0245 node0245_0320 (by omega)]
  rw [node0245_0320, split_right 277 block1924 node0277_0320 (by omega)]
  rw [node0277_0320, split_right 309 block1925 block1926 (by omega)]
  exact block1926_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1922_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1922_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1923_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1923_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1924_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1924_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1925_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1925_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1926_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1926_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1922_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1923_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1924_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1925_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow182.block1926_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow182
