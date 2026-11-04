import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1464
import Grothe.UpperChaos.OriginalRow227TriangleData1465
import Grothe.UpperChaos.OriginalRow227TriangleData1466
import Grothe.UpperChaos.OriginalRow227TriangleData1467
import Grothe.UpperChaos.OriginalRow227TriangleData1468
import Grothe.UpperChaos.OriginalRow227TriangleData1469
import Grothe.UpperChaos.OriginalRow227TriangleData1470
import Grothe.UpperChaos.OriginalRow227TriangleData1471
import Grothe.UpperChaos.OriginalRow227TriangleData1472

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow116

open ConditionalTableLookup

def values1464 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1464.coefficient116_115,
  OriginalRow227TriangleData1464.coefficient116_116,
  OriginalRow227TriangleData1464.coefficient116_117,
  OriginalRow227TriangleData1464.coefficient116_118,
  OriginalRow227TriangleData1464.coefficient116_119,
  OriginalRow227TriangleData1464.coefficient116_120,
  OriginalRow227TriangleData1464.coefficient116_121,
  OriginalRow227TriangleData1464.coefficient116_122,
  OriginalRow227TriangleData1464.coefficient116_123,
  OriginalRow227TriangleData1464.coefficient116_124,
  OriginalRow227TriangleData1464.coefficient116_125,
  OriginalRow227TriangleData1464.coefficient116_126,
  OriginalRow227TriangleData1464.coefficient116_127,
  OriginalRow227TriangleData1464.coefficient116_128,
  OriginalRow227TriangleData1464.coefficient116_129,
  OriginalRow227TriangleData1464.coefficient116_130,
  OriginalRow227TriangleData1464.coefficient116_131,
  OriginalRow227TriangleData1464.coefficient116_132,
  OriginalRow227TriangleData1464.coefficient116_133,
  OriginalRow227TriangleData1464.coefficient116_134,
  OriginalRow227TriangleData1464.coefficient116_135,
  OriginalRow227TriangleData1464.coefficient116_136,
  OriginalRow227TriangleData1464.coefficient116_137,
  OriginalRow227TriangleData1464.coefficient116_138,
  OriginalRow227TriangleData1464.coefficient116_139,
  OriginalRow227TriangleData1464.coefficient116_140,
  OriginalRow227TriangleData1464.coefficient116_141,
  OriginalRow227TriangleData1464.coefficient116_142,
  OriginalRow227TriangleData1464.coefficient116_143,
  OriginalRow227TriangleData1464.coefficient116_144,
  OriginalRow227TriangleData1464.coefficient116_145,
  OriginalRow227TriangleData1464.coefficient116_146
]

theorem values1464_size : values1464.size = 32 := rfl

def block1464 : ℕ → Option IntervalDyadic := segment 115 values1464

theorem block1464_domain : ExactDomain block1464 115 147 := by
  simpa only [values1464_size] using segment_domain 115 values1464

theorem block1464_get (i : Fin 32) :
    block1464 (115 + i.val) = some (values1464[i.val]'(by rw [values1464_size]; exact i.isLt)) := by
  exact segment_get 115 values1464 ⟨i.val, by rw [values1464_size]; exact i.isLt⟩

def values1465 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1465.coefficient116_147,
  OriginalRow227TriangleData1465.coefficient116_148,
  OriginalRow227TriangleData1465.coefficient116_149,
  OriginalRow227TriangleData1465.coefficient116_150,
  OriginalRow227TriangleData1465.coefficient116_151,
  OriginalRow227TriangleData1465.coefficient116_152,
  OriginalRow227TriangleData1465.coefficient116_153,
  OriginalRow227TriangleData1465.coefficient116_154,
  OriginalRow227TriangleData1465.coefficient116_155,
  OriginalRow227TriangleData1465.coefficient116_156,
  OriginalRow227TriangleData1465.coefficient116_157,
  OriginalRow227TriangleData1465.coefficient116_158,
  OriginalRow227TriangleData1465.coefficient116_159,
  OriginalRow227TriangleData1465.coefficient116_160,
  OriginalRow227TriangleData1465.coefficient116_161,
  OriginalRow227TriangleData1465.coefficient116_162,
  OriginalRow227TriangleData1465.coefficient116_163,
  OriginalRow227TriangleData1465.coefficient116_164,
  OriginalRow227TriangleData1465.coefficient116_165,
  OriginalRow227TriangleData1465.coefficient116_166,
  OriginalRow227TriangleData1465.coefficient116_167,
  OriginalRow227TriangleData1465.coefficient116_168,
  OriginalRow227TriangleData1465.coefficient116_169,
  OriginalRow227TriangleData1465.coefficient116_170,
  OriginalRow227TriangleData1465.coefficient116_171,
  OriginalRow227TriangleData1465.coefficient116_172,
  OriginalRow227TriangleData1465.coefficient116_173,
  OriginalRow227TriangleData1465.coefficient116_174,
  OriginalRow227TriangleData1465.coefficient116_175,
  OriginalRow227TriangleData1465.coefficient116_176,
  OriginalRow227TriangleData1465.coefficient116_177,
  OriginalRow227TriangleData1465.coefficient116_178
]

theorem values1465_size : values1465.size = 32 := rfl

def block1465 : ℕ → Option IntervalDyadic := segment 147 values1465

theorem block1465_domain : ExactDomain block1465 147 179 := by
  simpa only [values1465_size] using segment_domain 147 values1465

theorem block1465_get (i : Fin 32) :
    block1465 (147 + i.val) = some (values1465[i.val]'(by rw [values1465_size]; exact i.isLt)) := by
  exact segment_get 147 values1465 ⟨i.val, by rw [values1465_size]; exact i.isLt⟩

def values1466 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1466.coefficient116_179,
  OriginalRow227TriangleData1466.coefficient116_180,
  OriginalRow227TriangleData1466.coefficient116_181,
  OriginalRow227TriangleData1466.coefficient116_182,
  OriginalRow227TriangleData1466.coefficient116_183,
  OriginalRow227TriangleData1466.coefficient116_184,
  OriginalRow227TriangleData1466.coefficient116_185,
  OriginalRow227TriangleData1466.coefficient116_186,
  OriginalRow227TriangleData1466.coefficient116_187,
  OriginalRow227TriangleData1466.coefficient116_188,
  OriginalRow227TriangleData1466.coefficient116_189,
  OriginalRow227TriangleData1466.coefficient116_190,
  OriginalRow227TriangleData1466.coefficient116_191,
  OriginalRow227TriangleData1466.coefficient116_192,
  OriginalRow227TriangleData1466.coefficient116_193,
  OriginalRow227TriangleData1466.coefficient116_194,
  OriginalRow227TriangleData1466.coefficient116_195,
  OriginalRow227TriangleData1466.coefficient116_196,
  OriginalRow227TriangleData1466.coefficient116_197,
  OriginalRow227TriangleData1466.coefficient116_198,
  OriginalRow227TriangleData1466.coefficient116_199,
  OriginalRow227TriangleData1466.coefficient116_200,
  OriginalRow227TriangleData1466.coefficient116_201,
  OriginalRow227TriangleData1466.coefficient116_202,
  OriginalRow227TriangleData1466.coefficient116_203,
  OriginalRow227TriangleData1466.coefficient116_204,
  OriginalRow227TriangleData1466.coefficient116_205,
  OriginalRow227TriangleData1466.coefficient116_206,
  OriginalRow227TriangleData1466.coefficient116_207,
  OriginalRow227TriangleData1466.coefficient116_208,
  OriginalRow227TriangleData1466.coefficient116_209,
  OriginalRow227TriangleData1466.coefficient116_210
]

theorem values1466_size : values1466.size = 32 := rfl

def block1466 : ℕ → Option IntervalDyadic := segment 179 values1466

theorem block1466_domain : ExactDomain block1466 179 211 := by
  simpa only [values1466_size] using segment_domain 179 values1466

theorem block1466_get (i : Fin 32) :
    block1466 (179 + i.val) = some (values1466[i.val]'(by rw [values1466_size]; exact i.isLt)) := by
  exact segment_get 179 values1466 ⟨i.val, by rw [values1466_size]; exact i.isLt⟩

def values1467 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1467.coefficient116_211,
  OriginalRow227TriangleData1467.coefficient116_212,
  OriginalRow227TriangleData1467.coefficient116_213,
  OriginalRow227TriangleData1467.coefficient116_214,
  OriginalRow227TriangleData1467.coefficient116_215,
  OriginalRow227TriangleData1467.coefficient116_216,
  OriginalRow227TriangleData1467.coefficient116_217,
  OriginalRow227TriangleData1467.coefficient116_218,
  OriginalRow227TriangleData1467.coefficient116_219,
  OriginalRow227TriangleData1467.coefficient116_220,
  OriginalRow227TriangleData1467.coefficient116_221,
  OriginalRow227TriangleData1467.coefficient116_222,
  OriginalRow227TriangleData1467.coefficient116_223,
  OriginalRow227TriangleData1467.coefficient116_224,
  OriginalRow227TriangleData1467.coefficient116_225,
  OriginalRow227TriangleData1467.coefficient116_226,
  OriginalRow227TriangleData1467.coefficient116_227,
  OriginalRow227TriangleData1467.coefficient116_228,
  OriginalRow227TriangleData1467.coefficient116_229,
  OriginalRow227TriangleData1467.coefficient116_230,
  OriginalRow227TriangleData1467.coefficient116_231,
  OriginalRow227TriangleData1467.coefficient116_232,
  OriginalRow227TriangleData1467.coefficient116_233,
  OriginalRow227TriangleData1467.coefficient116_234,
  OriginalRow227TriangleData1467.coefficient116_235,
  OriginalRow227TriangleData1467.coefficient116_236,
  OriginalRow227TriangleData1467.coefficient116_237,
  OriginalRow227TriangleData1467.coefficient116_238,
  OriginalRow227TriangleData1467.coefficient116_239,
  OriginalRow227TriangleData1467.coefficient116_240,
  OriginalRow227TriangleData1467.coefficient116_241,
  OriginalRow227TriangleData1467.coefficient116_242
]

theorem values1467_size : values1467.size = 32 := rfl

def block1467 : ℕ → Option IntervalDyadic := segment 211 values1467

theorem block1467_domain : ExactDomain block1467 211 243 := by
  simpa only [values1467_size] using segment_domain 211 values1467

theorem block1467_get (i : Fin 32) :
    block1467 (211 + i.val) = some (values1467[i.val]'(by rw [values1467_size]; exact i.isLt)) := by
  exact segment_get 211 values1467 ⟨i.val, by rw [values1467_size]; exact i.isLt⟩

def values1468 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1468.coefficient116_243,
  OriginalRow227TriangleData1468.coefficient116_244,
  OriginalRow227TriangleData1468.coefficient116_245,
  OriginalRow227TriangleData1468.coefficient116_246,
  OriginalRow227TriangleData1468.coefficient116_247,
  OriginalRow227TriangleData1468.coefficient116_248,
  OriginalRow227TriangleData1468.coefficient116_249,
  OriginalRow227TriangleData1468.coefficient116_250,
  OriginalRow227TriangleData1468.coefficient116_251,
  OriginalRow227TriangleData1468.coefficient116_252,
  OriginalRow227TriangleData1468.coefficient116_253,
  OriginalRow227TriangleData1468.coefficient116_254,
  OriginalRow227TriangleData1468.coefficient116_255,
  OriginalRow227TriangleData1468.coefficient116_256,
  OriginalRow227TriangleData1468.coefficient116_257,
  OriginalRow227TriangleData1468.coefficient116_258,
  OriginalRow227TriangleData1468.coefficient116_259,
  OriginalRow227TriangleData1468.coefficient116_260,
  OriginalRow227TriangleData1468.coefficient116_261,
  OriginalRow227TriangleData1468.coefficient116_262,
  OriginalRow227TriangleData1468.coefficient116_263,
  OriginalRow227TriangleData1468.coefficient116_264,
  OriginalRow227TriangleData1468.coefficient116_265,
  OriginalRow227TriangleData1468.coefficient116_266,
  OriginalRow227TriangleData1468.coefficient116_267,
  OriginalRow227TriangleData1468.coefficient116_268,
  OriginalRow227TriangleData1468.coefficient116_269,
  OriginalRow227TriangleData1468.coefficient116_270,
  OriginalRow227TriangleData1468.coefficient116_271,
  OriginalRow227TriangleData1468.coefficient116_272,
  OriginalRow227TriangleData1468.coefficient116_273,
  OriginalRow227TriangleData1468.coefficient116_274
]

theorem values1468_size : values1468.size = 32 := rfl

def block1468 : ℕ → Option IntervalDyadic := segment 243 values1468

theorem block1468_domain : ExactDomain block1468 243 275 := by
  simpa only [values1468_size] using segment_domain 243 values1468

theorem block1468_get (i : Fin 32) :
    block1468 (243 + i.val) = some (values1468[i.val]'(by rw [values1468_size]; exact i.isLt)) := by
  exact segment_get 243 values1468 ⟨i.val, by rw [values1468_size]; exact i.isLt⟩

def values1469 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1469.coefficient116_275,
  OriginalRow227TriangleData1469.coefficient116_276,
  OriginalRow227TriangleData1469.coefficient116_277,
  OriginalRow227TriangleData1469.coefficient116_278,
  OriginalRow227TriangleData1469.coefficient116_279,
  OriginalRow227TriangleData1469.coefficient116_280,
  OriginalRow227TriangleData1469.coefficient116_281,
  OriginalRow227TriangleData1469.coefficient116_282,
  OriginalRow227TriangleData1469.coefficient116_283,
  OriginalRow227TriangleData1469.coefficient116_284,
  OriginalRow227TriangleData1469.coefficient116_285,
  OriginalRow227TriangleData1469.coefficient116_286,
  OriginalRow227TriangleData1469.coefficient116_287,
  OriginalRow227TriangleData1469.coefficient116_288,
  OriginalRow227TriangleData1469.coefficient116_289,
  OriginalRow227TriangleData1469.coefficient116_290,
  OriginalRow227TriangleData1469.coefficient116_291,
  OriginalRow227TriangleData1469.coefficient116_292,
  OriginalRow227TriangleData1469.coefficient116_293,
  OriginalRow227TriangleData1469.coefficient116_294,
  OriginalRow227TriangleData1469.coefficient116_295,
  OriginalRow227TriangleData1469.coefficient116_296,
  OriginalRow227TriangleData1469.coefficient116_297,
  OriginalRow227TriangleData1469.coefficient116_298,
  OriginalRow227TriangleData1469.coefficient116_299,
  OriginalRow227TriangleData1469.coefficient116_300,
  OriginalRow227TriangleData1469.coefficient116_301,
  OriginalRow227TriangleData1469.coefficient116_302,
  OriginalRow227TriangleData1469.coefficient116_303,
  OriginalRow227TriangleData1469.coefficient116_304,
  OriginalRow227TriangleData1469.coefficient116_305,
  OriginalRow227TriangleData1469.coefficient116_306
]

theorem values1469_size : values1469.size = 32 := rfl

def block1469 : ℕ → Option IntervalDyadic := segment 275 values1469

theorem block1469_domain : ExactDomain block1469 275 307 := by
  simpa only [values1469_size] using segment_domain 275 values1469

theorem block1469_get (i : Fin 32) :
    block1469 (275 + i.val) = some (values1469[i.val]'(by rw [values1469_size]; exact i.isLt)) := by
  exact segment_get 275 values1469 ⟨i.val, by rw [values1469_size]; exact i.isLt⟩

def values1470 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1470.coefficient116_307,
  OriginalRow227TriangleData1470.coefficient116_308,
  OriginalRow227TriangleData1470.coefficient116_309,
  OriginalRow227TriangleData1470.coefficient116_310,
  OriginalRow227TriangleData1470.coefficient116_311,
  OriginalRow227TriangleData1470.coefficient116_312,
  OriginalRow227TriangleData1470.coefficient116_313,
  OriginalRow227TriangleData1470.coefficient116_314,
  OriginalRow227TriangleData1470.coefficient116_315,
  OriginalRow227TriangleData1470.coefficient116_316,
  OriginalRow227TriangleData1470.coefficient116_317,
  OriginalRow227TriangleData1470.coefficient116_318,
  OriginalRow227TriangleData1470.coefficient116_319,
  OriginalRow227TriangleData1470.coefficient116_320,
  OriginalRow227TriangleData1470.coefficient116_321,
  OriginalRow227TriangleData1470.coefficient116_322,
  OriginalRow227TriangleData1470.coefficient116_323,
  OriginalRow227TriangleData1470.coefficient116_324,
  OriginalRow227TriangleData1470.coefficient116_325,
  OriginalRow227TriangleData1470.coefficient116_326,
  OriginalRow227TriangleData1470.coefficient116_327,
  OriginalRow227TriangleData1470.coefficient116_328,
  OriginalRow227TriangleData1470.coefficient116_329,
  OriginalRow227TriangleData1470.coefficient116_330,
  OriginalRow227TriangleData1470.coefficient116_331,
  OriginalRow227TriangleData1470.coefficient116_332,
  OriginalRow227TriangleData1470.coefficient116_333,
  OriginalRow227TriangleData1470.coefficient116_334,
  OriginalRow227TriangleData1470.coefficient116_335,
  OriginalRow227TriangleData1470.coefficient116_336,
  OriginalRow227TriangleData1470.coefficient116_337,
  OriginalRow227TriangleData1470.coefficient116_338
]

theorem values1470_size : values1470.size = 32 := rfl

def block1470 : ℕ → Option IntervalDyadic := segment 307 values1470

theorem block1470_domain : ExactDomain block1470 307 339 := by
  simpa only [values1470_size] using segment_domain 307 values1470

theorem block1470_get (i : Fin 32) :
    block1470 (307 + i.val) = some (values1470[i.val]'(by rw [values1470_size]; exact i.isLt)) := by
  exact segment_get 307 values1470 ⟨i.val, by rw [values1470_size]; exact i.isLt⟩

def values1471 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1471.coefficient116_339,
  OriginalRow227TriangleData1471.coefficient116_340,
  OriginalRow227TriangleData1471.coefficient116_341,
  OriginalRow227TriangleData1471.coefficient116_342,
  OriginalRow227TriangleData1471.coefficient116_343,
  OriginalRow227TriangleData1471.coefficient116_344,
  OriginalRow227TriangleData1471.coefficient116_345,
  OriginalRow227TriangleData1471.coefficient116_346,
  OriginalRow227TriangleData1471.coefficient116_347,
  OriginalRow227TriangleData1471.coefficient116_348,
  OriginalRow227TriangleData1471.coefficient116_349,
  OriginalRow227TriangleData1471.coefficient116_350,
  OriginalRow227TriangleData1471.coefficient116_351,
  OriginalRow227TriangleData1471.coefficient116_352,
  OriginalRow227TriangleData1471.coefficient116_353,
  OriginalRow227TriangleData1471.coefficient116_354,
  OriginalRow227TriangleData1471.coefficient116_355,
  OriginalRow227TriangleData1471.coefficient116_356,
  OriginalRow227TriangleData1471.coefficient116_357,
  OriginalRow227TriangleData1471.coefficient116_358,
  OriginalRow227TriangleData1471.coefficient116_359,
  OriginalRow227TriangleData1471.coefficient116_360,
  OriginalRow227TriangleData1471.coefficient116_361,
  OriginalRow227TriangleData1471.coefficient116_362,
  OriginalRow227TriangleData1471.coefficient116_363,
  OriginalRow227TriangleData1471.coefficient116_364,
  OriginalRow227TriangleData1471.coefficient116_365,
  OriginalRow227TriangleData1471.coefficient116_366,
  OriginalRow227TriangleData1471.coefficient116_367,
  OriginalRow227TriangleData1471.coefficient116_368,
  OriginalRow227TriangleData1471.coefficient116_369,
  OriginalRow227TriangleData1471.coefficient116_370
]

theorem values1471_size : values1471.size = 32 := rfl

def block1471 : ℕ → Option IntervalDyadic := segment 339 values1471

theorem block1471_domain : ExactDomain block1471 339 371 := by
  simpa only [values1471_size] using segment_domain 339 values1471

theorem block1471_get (i : Fin 32) :
    block1471 (339 + i.val) = some (values1471[i.val]'(by rw [values1471_size]; exact i.isLt)) := by
  exact segment_get 339 values1471 ⟨i.val, by rw [values1471_size]; exact i.isLt⟩

def values1472 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1472.coefficient116_371,
  OriginalRow227TriangleData1472.coefficient116_372,
  OriginalRow227TriangleData1472.coefficient116_373,
  OriginalRow227TriangleData1472.coefficient116_374,
  OriginalRow227TriangleData1472.coefficient116_375,
  OriginalRow227TriangleData1472.coefficient116_376,
  OriginalRow227TriangleData1472.coefficient116_377,
  OriginalRow227TriangleData1472.coefficient116_378,
  OriginalRow227TriangleData1472.coefficient116_379,
  OriginalRow227TriangleData1472.coefficient116_380,
  OriginalRow227TriangleData1472.coefficient116_381,
  OriginalRow227TriangleData1472.coefficient116_382,
  OriginalRow227TriangleData1472.coefficient116_383,
  OriginalRow227TriangleData1472.coefficient116_384,
  OriginalRow227TriangleData1472.coefficient116_385
]

theorem values1472_size : values1472.size = 15 := rfl

def block1472 : ℕ → Option IntervalDyadic := segment 371 values1472

theorem block1472_domain : ExactDomain block1472 371 386 := by
  simpa only [values1472_size] using segment_domain 371 values1472

theorem block1472_get (i : Fin 15) :
    block1472 (371 + i.val) = some (values1472[i.val]'(by rw [values1472_size]; exact i.isLt)) := by
  exact segment_get 371 values1472 ⟨i.val, by rw [values1472_size]; exact i.isLt⟩

def node0115_0179 : ℕ → Option IntervalDyadic := split 147 block1464 block1465

theorem node0115_0179_domain : ExactDomain node0115_0179 115 179 := by
  exact split_domain (by decide) (by decide) block1464_domain block1465_domain

def node0179_0243 : ℕ → Option IntervalDyadic := split 211 block1466 block1467

theorem node0179_0243_domain : ExactDomain node0179_0243 179 243 := by
  exact split_domain (by decide) (by decide) block1466_domain block1467_domain

def node0115_0243 : ℕ → Option IntervalDyadic := split 179 node0115_0179 node0179_0243

theorem node0115_0243_domain : ExactDomain node0115_0243 115 243 := by
  exact split_domain (by decide) (by decide) node0115_0179_domain node0179_0243_domain

def node0243_0307 : ℕ → Option IntervalDyadic := split 275 block1468 block1469

theorem node0243_0307_domain : ExactDomain node0243_0307 243 307 := by
  exact split_domain (by decide) (by decide) block1468_domain block1469_domain

def node0339_0386 : ℕ → Option IntervalDyadic := split 371 block1471 block1472

theorem node0339_0386_domain : ExactDomain node0339_0386 339 386 := by
  exact split_domain (by decide) (by decide) block1471_domain block1472_domain

def node0307_0386 : ℕ → Option IntervalDyadic := split 339 block1470 node0339_0386

theorem node0307_0386_domain : ExactDomain node0307_0386 307 386 := by
  exact split_domain (by decide) (by decide) block1470_domain node0339_0386_domain

def node0243_0386 : ℕ → Option IntervalDyadic := split 307 node0243_0307 node0307_0386

theorem node0243_0386_domain : ExactDomain node0243_0386 243 386 := by
  exact split_domain (by decide) (by decide) node0243_0307_domain node0307_0386_domain

def node0115_0386 : ℕ → Option IntervalDyadic := split 243 node0115_0243 node0243_0386

theorem node0115_0386_domain : ExactDomain node0115_0386 115 386 := by
  exact split_domain (by decide) (by decide) node0115_0243_domain node0243_0386_domain

def lookup : ℕ → Option IntervalDyadic := node0115_0386

theorem lookup_domain : ExactDomain lookup 115 386 :=
  node0115_0386_domain

theorem block1464_lookup (i : Fin 32) :
    lookup (115 + i.val) = some (values1464[i.val]'(by rw [values1464_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (115 + i.val) = _
  rw [node0115_0386, split_left 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0115_0243, split_left 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0115_0179, split_left 147 block1464 block1465 (by omega)]
  exact block1464_get i

theorem block1465_lookup (i : Fin 32) :
    lookup (147 + i.val) = some (values1465[i.val]'(by rw [values1465_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (147 + i.val) = _
  rw [node0115_0386, split_left 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0115_0243, split_left 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0115_0179, split_right 147 block1464 block1465 (by omega)]
  exact block1465_get i

theorem block1466_lookup (i : Fin 32) :
    lookup (179 + i.val) = some (values1466[i.val]'(by rw [values1466_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (179 + i.val) = _
  rw [node0115_0386, split_left 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0115_0243, split_right 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0179_0243, split_left 211 block1466 block1467 (by omega)]
  exact block1466_get i

theorem block1467_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values1467[i.val]'(by rw [values1467_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (211 + i.val) = _
  rw [node0115_0386, split_left 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0115_0243, split_right 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0179_0243, split_right 211 block1466 block1467 (by omega)]
  exact block1467_get i

theorem block1468_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values1468[i.val]'(by rw [values1468_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (243 + i.val) = _
  rw [node0115_0386, split_right 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0243_0386, split_left 307 node0243_0307 node0307_0386 (by omega)]
  rw [node0243_0307, split_left 275 block1468 block1469 (by omega)]
  exact block1468_get i

theorem block1469_lookup (i : Fin 32) :
    lookup (275 + i.val) = some (values1469[i.val]'(by rw [values1469_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (275 + i.val) = _
  rw [node0115_0386, split_right 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0243_0386, split_left 307 node0243_0307 node0307_0386 (by omega)]
  rw [node0243_0307, split_right 275 block1468 block1469 (by omega)]
  exact block1469_get i

theorem block1470_lookup (i : Fin 32) :
    lookup (307 + i.val) = some (values1470[i.val]'(by rw [values1470_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (307 + i.val) = _
  rw [node0115_0386, split_right 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0243_0386, split_right 307 node0243_0307 node0307_0386 (by omega)]
  rw [node0307_0386, split_left 339 block1470 node0339_0386 (by omega)]
  exact block1470_get i

theorem block1471_lookup (i : Fin 32) :
    lookup (339 + i.val) = some (values1471[i.val]'(by rw [values1471_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (339 + i.val) = _
  rw [node0115_0386, split_right 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0243_0386, split_right 307 node0243_0307 node0307_0386 (by omega)]
  rw [node0307_0386, split_right 339 block1470 node0339_0386 (by omega)]
  rw [node0339_0386, split_left 371 block1471 block1472 (by omega)]
  exact block1471_get i

theorem block1472_lookup (i : Fin 15) :
    lookup (371 + i.val) = some (values1472[i.val]'(by rw [values1472_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0115_0386 (371 + i.val) = _
  rw [node0115_0386, split_right 243 node0115_0243 node0243_0386 (by omega)]
  rw [node0243_0386, split_right 307 node0243_0307 node0307_0386 (by omega)]
  rw [node0307_0386, split_right 339 block1470 node0339_0386 (by omega)]
  rw [node0339_0386, split_right 371 block1471 block1472 (by omega)]
  exact block1472_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1464_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1464_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1465_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1465_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1466_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1466_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1467_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1467_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1468_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1468_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1469_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1469_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1470_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1470_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1471_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1471_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1472_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1472_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1464_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1465_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1466_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1467_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1468_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1469_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1470_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1471_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow116.block1472_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow116
