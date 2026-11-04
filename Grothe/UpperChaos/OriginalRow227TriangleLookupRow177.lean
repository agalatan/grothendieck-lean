import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1897
import Grothe.UpperChaos.OriginalRow227TriangleData1898
import Grothe.UpperChaos.OriginalRow227TriangleData1899
import Grothe.UpperChaos.OriginalRow227TriangleData1900
import Grothe.UpperChaos.OriginalRow227TriangleData1901

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow177

open ConditionalTableLookup

def values1897 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1897.coefficient177_176,
  OriginalRow227TriangleData1897.coefficient177_177,
  OriginalRow227TriangleData1897.coefficient177_178,
  OriginalRow227TriangleData1897.coefficient177_179,
  OriginalRow227TriangleData1897.coefficient177_180,
  OriginalRow227TriangleData1897.coefficient177_181,
  OriginalRow227TriangleData1897.coefficient177_182,
  OriginalRow227TriangleData1897.coefficient177_183,
  OriginalRow227TriangleData1897.coefficient177_184,
  OriginalRow227TriangleData1897.coefficient177_185,
  OriginalRow227TriangleData1897.coefficient177_186,
  OriginalRow227TriangleData1897.coefficient177_187,
  OriginalRow227TriangleData1897.coefficient177_188,
  OriginalRow227TriangleData1897.coefficient177_189,
  OriginalRow227TriangleData1897.coefficient177_190,
  OriginalRow227TriangleData1897.coefficient177_191,
  OriginalRow227TriangleData1897.coefficient177_192,
  OriginalRow227TriangleData1897.coefficient177_193,
  OriginalRow227TriangleData1897.coefficient177_194,
  OriginalRow227TriangleData1897.coefficient177_195,
  OriginalRow227TriangleData1897.coefficient177_196,
  OriginalRow227TriangleData1897.coefficient177_197,
  OriginalRow227TriangleData1897.coefficient177_198,
  OriginalRow227TriangleData1897.coefficient177_199,
  OriginalRow227TriangleData1897.coefficient177_200,
  OriginalRow227TriangleData1897.coefficient177_201,
  OriginalRow227TriangleData1897.coefficient177_202,
  OriginalRow227TriangleData1897.coefficient177_203,
  OriginalRow227TriangleData1897.coefficient177_204,
  OriginalRow227TriangleData1897.coefficient177_205,
  OriginalRow227TriangleData1897.coefficient177_206,
  OriginalRow227TriangleData1897.coefficient177_207
]

theorem values1897_size : values1897.size = 32 := rfl

def block1897 : ℕ → Option IntervalDyadic := segment 176 values1897

theorem block1897_domain : ExactDomain block1897 176 208 := by
  simpa only [values1897_size] using segment_domain 176 values1897

theorem block1897_get (i : Fin 32) :
    block1897 (176 + i.val) = some (values1897[i.val]'(by rw [values1897_size]; exact i.isLt)) := by
  exact segment_get 176 values1897 ⟨i.val, by rw [values1897_size]; exact i.isLt⟩

def values1898 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1898.coefficient177_208,
  OriginalRow227TriangleData1898.coefficient177_209,
  OriginalRow227TriangleData1898.coefficient177_210,
  OriginalRow227TriangleData1898.coefficient177_211,
  OriginalRow227TriangleData1898.coefficient177_212,
  OriginalRow227TriangleData1898.coefficient177_213,
  OriginalRow227TriangleData1898.coefficient177_214,
  OriginalRow227TriangleData1898.coefficient177_215,
  OriginalRow227TriangleData1898.coefficient177_216,
  OriginalRow227TriangleData1898.coefficient177_217,
  OriginalRow227TriangleData1898.coefficient177_218,
  OriginalRow227TriangleData1898.coefficient177_219,
  OriginalRow227TriangleData1898.coefficient177_220,
  OriginalRow227TriangleData1898.coefficient177_221,
  OriginalRow227TriangleData1898.coefficient177_222,
  OriginalRow227TriangleData1898.coefficient177_223,
  OriginalRow227TriangleData1898.coefficient177_224,
  OriginalRow227TriangleData1898.coefficient177_225,
  OriginalRow227TriangleData1898.coefficient177_226,
  OriginalRow227TriangleData1898.coefficient177_227,
  OriginalRow227TriangleData1898.coefficient177_228,
  OriginalRow227TriangleData1898.coefficient177_229,
  OriginalRow227TriangleData1898.coefficient177_230,
  OriginalRow227TriangleData1898.coefficient177_231,
  OriginalRow227TriangleData1898.coefficient177_232,
  OriginalRow227TriangleData1898.coefficient177_233,
  OriginalRow227TriangleData1898.coefficient177_234,
  OriginalRow227TriangleData1898.coefficient177_235,
  OriginalRow227TriangleData1898.coefficient177_236,
  OriginalRow227TriangleData1898.coefficient177_237,
  OriginalRow227TriangleData1898.coefficient177_238,
  OriginalRow227TriangleData1898.coefficient177_239
]

theorem values1898_size : values1898.size = 32 := rfl

def block1898 : ℕ → Option IntervalDyadic := segment 208 values1898

theorem block1898_domain : ExactDomain block1898 208 240 := by
  simpa only [values1898_size] using segment_domain 208 values1898

theorem block1898_get (i : Fin 32) :
    block1898 (208 + i.val) = some (values1898[i.val]'(by rw [values1898_size]; exact i.isLt)) := by
  exact segment_get 208 values1898 ⟨i.val, by rw [values1898_size]; exact i.isLt⟩

def values1899 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1899.coefficient177_240,
  OriginalRow227TriangleData1899.coefficient177_241,
  OriginalRow227TriangleData1899.coefficient177_242,
  OriginalRow227TriangleData1899.coefficient177_243,
  OriginalRow227TriangleData1899.coefficient177_244,
  OriginalRow227TriangleData1899.coefficient177_245,
  OriginalRow227TriangleData1899.coefficient177_246,
  OriginalRow227TriangleData1899.coefficient177_247,
  OriginalRow227TriangleData1899.coefficient177_248,
  OriginalRow227TriangleData1899.coefficient177_249,
  OriginalRow227TriangleData1899.coefficient177_250,
  OriginalRow227TriangleData1899.coefficient177_251,
  OriginalRow227TriangleData1899.coefficient177_252,
  OriginalRow227TriangleData1899.coefficient177_253,
  OriginalRow227TriangleData1899.coefficient177_254,
  OriginalRow227TriangleData1899.coefficient177_255,
  OriginalRow227TriangleData1899.coefficient177_256,
  OriginalRow227TriangleData1899.coefficient177_257,
  OriginalRow227TriangleData1899.coefficient177_258,
  OriginalRow227TriangleData1899.coefficient177_259,
  OriginalRow227TriangleData1899.coefficient177_260,
  OriginalRow227TriangleData1899.coefficient177_261,
  OriginalRow227TriangleData1899.coefficient177_262,
  OriginalRow227TriangleData1899.coefficient177_263,
  OriginalRow227TriangleData1899.coefficient177_264,
  OriginalRow227TriangleData1899.coefficient177_265,
  OriginalRow227TriangleData1899.coefficient177_266,
  OriginalRow227TriangleData1899.coefficient177_267,
  OriginalRow227TriangleData1899.coefficient177_268,
  OriginalRow227TriangleData1899.coefficient177_269,
  OriginalRow227TriangleData1899.coefficient177_270,
  OriginalRow227TriangleData1899.coefficient177_271
]

theorem values1899_size : values1899.size = 32 := rfl

def block1899 : ℕ → Option IntervalDyadic := segment 240 values1899

theorem block1899_domain : ExactDomain block1899 240 272 := by
  simpa only [values1899_size] using segment_domain 240 values1899

theorem block1899_get (i : Fin 32) :
    block1899 (240 + i.val) = some (values1899[i.val]'(by rw [values1899_size]; exact i.isLt)) := by
  exact segment_get 240 values1899 ⟨i.val, by rw [values1899_size]; exact i.isLt⟩

def values1900 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1900.coefficient177_272,
  OriginalRow227TriangleData1900.coefficient177_273,
  OriginalRow227TriangleData1900.coefficient177_274,
  OriginalRow227TriangleData1900.coefficient177_275,
  OriginalRow227TriangleData1900.coefficient177_276,
  OriginalRow227TriangleData1900.coefficient177_277,
  OriginalRow227TriangleData1900.coefficient177_278,
  OriginalRow227TriangleData1900.coefficient177_279,
  OriginalRow227TriangleData1900.coefficient177_280,
  OriginalRow227TriangleData1900.coefficient177_281,
  OriginalRow227TriangleData1900.coefficient177_282,
  OriginalRow227TriangleData1900.coefficient177_283,
  OriginalRow227TriangleData1900.coefficient177_284,
  OriginalRow227TriangleData1900.coefficient177_285,
  OriginalRow227TriangleData1900.coefficient177_286,
  OriginalRow227TriangleData1900.coefficient177_287,
  OriginalRow227TriangleData1900.coefficient177_288,
  OriginalRow227TriangleData1900.coefficient177_289,
  OriginalRow227TriangleData1900.coefficient177_290,
  OriginalRow227TriangleData1900.coefficient177_291,
  OriginalRow227TriangleData1900.coefficient177_292,
  OriginalRow227TriangleData1900.coefficient177_293,
  OriginalRow227TriangleData1900.coefficient177_294,
  OriginalRow227TriangleData1900.coefficient177_295,
  OriginalRow227TriangleData1900.coefficient177_296,
  OriginalRow227TriangleData1900.coefficient177_297,
  OriginalRow227TriangleData1900.coefficient177_298,
  OriginalRow227TriangleData1900.coefficient177_299,
  OriginalRow227TriangleData1900.coefficient177_300,
  OriginalRow227TriangleData1900.coefficient177_301,
  OriginalRow227TriangleData1900.coefficient177_302,
  OriginalRow227TriangleData1900.coefficient177_303
]

theorem values1900_size : values1900.size = 32 := rfl

def block1900 : ℕ → Option IntervalDyadic := segment 272 values1900

theorem block1900_domain : ExactDomain block1900 272 304 := by
  simpa only [values1900_size] using segment_domain 272 values1900

theorem block1900_get (i : Fin 32) :
    block1900 (272 + i.val) = some (values1900[i.val]'(by rw [values1900_size]; exact i.isLt)) := by
  exact segment_get 272 values1900 ⟨i.val, by rw [values1900_size]; exact i.isLt⟩

def values1901 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1901.coefficient177_304,
  OriginalRow227TriangleData1901.coefficient177_305,
  OriginalRow227TriangleData1901.coefficient177_306,
  OriginalRow227TriangleData1901.coefficient177_307,
  OriginalRow227TriangleData1901.coefficient177_308,
  OriginalRow227TriangleData1901.coefficient177_309,
  OriginalRow227TriangleData1901.coefficient177_310,
  OriginalRow227TriangleData1901.coefficient177_311,
  OriginalRow227TriangleData1901.coefficient177_312,
  OriginalRow227TriangleData1901.coefficient177_313,
  OriginalRow227TriangleData1901.coefficient177_314,
  OriginalRow227TriangleData1901.coefficient177_315,
  OriginalRow227TriangleData1901.coefficient177_316,
  OriginalRow227TriangleData1901.coefficient177_317,
  OriginalRow227TriangleData1901.coefficient177_318,
  OriginalRow227TriangleData1901.coefficient177_319,
  OriginalRow227TriangleData1901.coefficient177_320,
  OriginalRow227TriangleData1901.coefficient177_321,
  OriginalRow227TriangleData1901.coefficient177_322,
  OriginalRow227TriangleData1901.coefficient177_323,
  OriginalRow227TriangleData1901.coefficient177_324
]

theorem values1901_size : values1901.size = 21 := rfl

def block1901 : ℕ → Option IntervalDyadic := segment 304 values1901

theorem block1901_domain : ExactDomain block1901 304 325 := by
  simpa only [values1901_size] using segment_domain 304 values1901

theorem block1901_get (i : Fin 21) :
    block1901 (304 + i.val) = some (values1901[i.val]'(by rw [values1901_size]; exact i.isLt)) := by
  exact segment_get 304 values1901 ⟨i.val, by rw [values1901_size]; exact i.isLt⟩

def node0176_0240 : ℕ → Option IntervalDyadic := split 208 block1897 block1898

theorem node0176_0240_domain : ExactDomain node0176_0240 176 240 := by
  exact split_domain (by decide) (by decide) block1897_domain block1898_domain

def node0272_0325 : ℕ → Option IntervalDyadic := split 304 block1900 block1901

theorem node0272_0325_domain : ExactDomain node0272_0325 272 325 := by
  exact split_domain (by decide) (by decide) block1900_domain block1901_domain

def node0240_0325 : ℕ → Option IntervalDyadic := split 272 block1899 node0272_0325

theorem node0240_0325_domain : ExactDomain node0240_0325 240 325 := by
  exact split_domain (by decide) (by decide) block1899_domain node0272_0325_domain

def node0176_0325 : ℕ → Option IntervalDyadic := split 240 node0176_0240 node0240_0325

theorem node0176_0325_domain : ExactDomain node0176_0325 176 325 := by
  exact split_domain (by decide) (by decide) node0176_0240_domain node0240_0325_domain

def lookup : ℕ → Option IntervalDyadic := node0176_0325

theorem lookup_domain : ExactDomain lookup 176 325 :=
  node0176_0325_domain

theorem block1897_lookup (i : Fin 32) :
    lookup (176 + i.val) = some (values1897[i.val]'(by rw [values1897_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0176_0325 (176 + i.val) = _
  rw [node0176_0325, split_left 240 node0176_0240 node0240_0325 (by omega)]
  rw [node0176_0240, split_left 208 block1897 block1898 (by omega)]
  exact block1897_get i

theorem block1898_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values1898[i.val]'(by rw [values1898_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0176_0325 (208 + i.val) = _
  rw [node0176_0325, split_left 240 node0176_0240 node0240_0325 (by omega)]
  rw [node0176_0240, split_right 208 block1897 block1898 (by omega)]
  exact block1898_get i

theorem block1899_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values1899[i.val]'(by rw [values1899_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0176_0325 (240 + i.val) = _
  rw [node0176_0325, split_right 240 node0176_0240 node0240_0325 (by omega)]
  rw [node0240_0325, split_left 272 block1899 node0272_0325 (by omega)]
  exact block1899_get i

theorem block1900_lookup (i : Fin 32) :
    lookup (272 + i.val) = some (values1900[i.val]'(by rw [values1900_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0176_0325 (272 + i.val) = _
  rw [node0176_0325, split_right 240 node0176_0240 node0240_0325 (by omega)]
  rw [node0240_0325, split_right 272 block1899 node0272_0325 (by omega)]
  rw [node0272_0325, split_left 304 block1900 block1901 (by omega)]
  exact block1900_get i

theorem block1901_lookup (i : Fin 21) :
    lookup (304 + i.val) = some (values1901[i.val]'(by rw [values1901_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0176_0325 (304 + i.val) = _
  rw [node0176_0325, split_right 240 node0176_0240 node0240_0325 (by omega)]
  rw [node0240_0325, split_right 272 block1899 node0272_0325 (by omega)]
  rw [node0272_0325, split_right 304 block1900 block1901 (by omega)]
  exact block1901_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1897_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1897_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1898_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1898_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1899_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1899_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1900_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1900_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1901_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1901_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1897_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1898_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1899_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1900_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow177.block1901_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow177
