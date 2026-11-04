import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1428
import Grothe.UpperChaos.OriginalRow227TriangleData1429
import Grothe.UpperChaos.OriginalRow227TriangleData1430
import Grothe.UpperChaos.OriginalRow227TriangleData1431
import Grothe.UpperChaos.OriginalRow227TriangleData1432
import Grothe.UpperChaos.OriginalRow227TriangleData1433
import Grothe.UpperChaos.OriginalRow227TriangleData1434
import Grothe.UpperChaos.OriginalRow227TriangleData1435
import Grothe.UpperChaos.OriginalRow227TriangleData1436

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow112

open ConditionalTableLookup

def values1428 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1428.coefficient112_111,
  OriginalRow227TriangleData1428.coefficient112_112,
  OriginalRow227TriangleData1428.coefficient112_113,
  OriginalRow227TriangleData1428.coefficient112_114,
  OriginalRow227TriangleData1428.coefficient112_115,
  OriginalRow227TriangleData1428.coefficient112_116,
  OriginalRow227TriangleData1428.coefficient112_117,
  OriginalRow227TriangleData1428.coefficient112_118,
  OriginalRow227TriangleData1428.coefficient112_119,
  OriginalRow227TriangleData1428.coefficient112_120,
  OriginalRow227TriangleData1428.coefficient112_121,
  OriginalRow227TriangleData1428.coefficient112_122,
  OriginalRow227TriangleData1428.coefficient112_123,
  OriginalRow227TriangleData1428.coefficient112_124,
  OriginalRow227TriangleData1428.coefficient112_125,
  OriginalRow227TriangleData1428.coefficient112_126,
  OriginalRow227TriangleData1428.coefficient112_127,
  OriginalRow227TriangleData1428.coefficient112_128,
  OriginalRow227TriangleData1428.coefficient112_129,
  OriginalRow227TriangleData1428.coefficient112_130,
  OriginalRow227TriangleData1428.coefficient112_131,
  OriginalRow227TriangleData1428.coefficient112_132,
  OriginalRow227TriangleData1428.coefficient112_133,
  OriginalRow227TriangleData1428.coefficient112_134,
  OriginalRow227TriangleData1428.coefficient112_135,
  OriginalRow227TriangleData1428.coefficient112_136,
  OriginalRow227TriangleData1428.coefficient112_137,
  OriginalRow227TriangleData1428.coefficient112_138,
  OriginalRow227TriangleData1428.coefficient112_139,
  OriginalRow227TriangleData1428.coefficient112_140,
  OriginalRow227TriangleData1428.coefficient112_141,
  OriginalRow227TriangleData1428.coefficient112_142
]

theorem values1428_size : values1428.size = 32 := rfl

def block1428 : ℕ → Option IntervalDyadic := segment 111 values1428

theorem block1428_domain : ExactDomain block1428 111 143 := by
  simpa only [values1428_size] using segment_domain 111 values1428

theorem block1428_get (i : Fin 32) :
    block1428 (111 + i.val) = some (values1428[i.val]'(by rw [values1428_size]; exact i.isLt)) := by
  exact segment_get 111 values1428 ⟨i.val, by rw [values1428_size]; exact i.isLt⟩

def values1429 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1429.coefficient112_143,
  OriginalRow227TriangleData1429.coefficient112_144,
  OriginalRow227TriangleData1429.coefficient112_145,
  OriginalRow227TriangleData1429.coefficient112_146,
  OriginalRow227TriangleData1429.coefficient112_147,
  OriginalRow227TriangleData1429.coefficient112_148,
  OriginalRow227TriangleData1429.coefficient112_149,
  OriginalRow227TriangleData1429.coefficient112_150,
  OriginalRow227TriangleData1429.coefficient112_151,
  OriginalRow227TriangleData1429.coefficient112_152,
  OriginalRow227TriangleData1429.coefficient112_153,
  OriginalRow227TriangleData1429.coefficient112_154,
  OriginalRow227TriangleData1429.coefficient112_155,
  OriginalRow227TriangleData1429.coefficient112_156,
  OriginalRow227TriangleData1429.coefficient112_157,
  OriginalRow227TriangleData1429.coefficient112_158,
  OriginalRow227TriangleData1429.coefficient112_159,
  OriginalRow227TriangleData1429.coefficient112_160,
  OriginalRow227TriangleData1429.coefficient112_161,
  OriginalRow227TriangleData1429.coefficient112_162,
  OriginalRow227TriangleData1429.coefficient112_163,
  OriginalRow227TriangleData1429.coefficient112_164,
  OriginalRow227TriangleData1429.coefficient112_165,
  OriginalRow227TriangleData1429.coefficient112_166,
  OriginalRow227TriangleData1429.coefficient112_167,
  OriginalRow227TriangleData1429.coefficient112_168,
  OriginalRow227TriangleData1429.coefficient112_169,
  OriginalRow227TriangleData1429.coefficient112_170,
  OriginalRow227TriangleData1429.coefficient112_171,
  OriginalRow227TriangleData1429.coefficient112_172,
  OriginalRow227TriangleData1429.coefficient112_173,
  OriginalRow227TriangleData1429.coefficient112_174
]

theorem values1429_size : values1429.size = 32 := rfl

def block1429 : ℕ → Option IntervalDyadic := segment 143 values1429

theorem block1429_domain : ExactDomain block1429 143 175 := by
  simpa only [values1429_size] using segment_domain 143 values1429

theorem block1429_get (i : Fin 32) :
    block1429 (143 + i.val) = some (values1429[i.val]'(by rw [values1429_size]; exact i.isLt)) := by
  exact segment_get 143 values1429 ⟨i.val, by rw [values1429_size]; exact i.isLt⟩

def values1430 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1430.coefficient112_175,
  OriginalRow227TriangleData1430.coefficient112_176,
  OriginalRow227TriangleData1430.coefficient112_177,
  OriginalRow227TriangleData1430.coefficient112_178,
  OriginalRow227TriangleData1430.coefficient112_179,
  OriginalRow227TriangleData1430.coefficient112_180,
  OriginalRow227TriangleData1430.coefficient112_181,
  OriginalRow227TriangleData1430.coefficient112_182,
  OriginalRow227TriangleData1430.coefficient112_183,
  OriginalRow227TriangleData1430.coefficient112_184,
  OriginalRow227TriangleData1430.coefficient112_185,
  OriginalRow227TriangleData1430.coefficient112_186,
  OriginalRow227TriangleData1430.coefficient112_187,
  OriginalRow227TriangleData1430.coefficient112_188,
  OriginalRow227TriangleData1430.coefficient112_189,
  OriginalRow227TriangleData1430.coefficient112_190,
  OriginalRow227TriangleData1430.coefficient112_191,
  OriginalRow227TriangleData1430.coefficient112_192,
  OriginalRow227TriangleData1430.coefficient112_193,
  OriginalRow227TriangleData1430.coefficient112_194,
  OriginalRow227TriangleData1430.coefficient112_195,
  OriginalRow227TriangleData1430.coefficient112_196,
  OriginalRow227TriangleData1430.coefficient112_197,
  OriginalRow227TriangleData1430.coefficient112_198,
  OriginalRow227TriangleData1430.coefficient112_199,
  OriginalRow227TriangleData1430.coefficient112_200,
  OriginalRow227TriangleData1430.coefficient112_201,
  OriginalRow227TriangleData1430.coefficient112_202,
  OriginalRow227TriangleData1430.coefficient112_203,
  OriginalRow227TriangleData1430.coefficient112_204,
  OriginalRow227TriangleData1430.coefficient112_205,
  OriginalRow227TriangleData1430.coefficient112_206
]

theorem values1430_size : values1430.size = 32 := rfl

def block1430 : ℕ → Option IntervalDyadic := segment 175 values1430

theorem block1430_domain : ExactDomain block1430 175 207 := by
  simpa only [values1430_size] using segment_domain 175 values1430

theorem block1430_get (i : Fin 32) :
    block1430 (175 + i.val) = some (values1430[i.val]'(by rw [values1430_size]; exact i.isLt)) := by
  exact segment_get 175 values1430 ⟨i.val, by rw [values1430_size]; exact i.isLt⟩

def values1431 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1431.coefficient112_207,
  OriginalRow227TriangleData1431.coefficient112_208,
  OriginalRow227TriangleData1431.coefficient112_209,
  OriginalRow227TriangleData1431.coefficient112_210,
  OriginalRow227TriangleData1431.coefficient112_211,
  OriginalRow227TriangleData1431.coefficient112_212,
  OriginalRow227TriangleData1431.coefficient112_213,
  OriginalRow227TriangleData1431.coefficient112_214,
  OriginalRow227TriangleData1431.coefficient112_215,
  OriginalRow227TriangleData1431.coefficient112_216,
  OriginalRow227TriangleData1431.coefficient112_217,
  OriginalRow227TriangleData1431.coefficient112_218,
  OriginalRow227TriangleData1431.coefficient112_219,
  OriginalRow227TriangleData1431.coefficient112_220,
  OriginalRow227TriangleData1431.coefficient112_221,
  OriginalRow227TriangleData1431.coefficient112_222,
  OriginalRow227TriangleData1431.coefficient112_223,
  OriginalRow227TriangleData1431.coefficient112_224,
  OriginalRow227TriangleData1431.coefficient112_225,
  OriginalRow227TriangleData1431.coefficient112_226,
  OriginalRow227TriangleData1431.coefficient112_227,
  OriginalRow227TriangleData1431.coefficient112_228,
  OriginalRow227TriangleData1431.coefficient112_229,
  OriginalRow227TriangleData1431.coefficient112_230,
  OriginalRow227TriangleData1431.coefficient112_231,
  OriginalRow227TriangleData1431.coefficient112_232,
  OriginalRow227TriangleData1431.coefficient112_233,
  OriginalRow227TriangleData1431.coefficient112_234,
  OriginalRow227TriangleData1431.coefficient112_235,
  OriginalRow227TriangleData1431.coefficient112_236,
  OriginalRow227TriangleData1431.coefficient112_237,
  OriginalRow227TriangleData1431.coefficient112_238
]

theorem values1431_size : values1431.size = 32 := rfl

def block1431 : ℕ → Option IntervalDyadic := segment 207 values1431

theorem block1431_domain : ExactDomain block1431 207 239 := by
  simpa only [values1431_size] using segment_domain 207 values1431

theorem block1431_get (i : Fin 32) :
    block1431 (207 + i.val) = some (values1431[i.val]'(by rw [values1431_size]; exact i.isLt)) := by
  exact segment_get 207 values1431 ⟨i.val, by rw [values1431_size]; exact i.isLt⟩

def values1432 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1432.coefficient112_239,
  OriginalRow227TriangleData1432.coefficient112_240,
  OriginalRow227TriangleData1432.coefficient112_241,
  OriginalRow227TriangleData1432.coefficient112_242,
  OriginalRow227TriangleData1432.coefficient112_243,
  OriginalRow227TriangleData1432.coefficient112_244,
  OriginalRow227TriangleData1432.coefficient112_245,
  OriginalRow227TriangleData1432.coefficient112_246,
  OriginalRow227TriangleData1432.coefficient112_247,
  OriginalRow227TriangleData1432.coefficient112_248,
  OriginalRow227TriangleData1432.coefficient112_249,
  OriginalRow227TriangleData1432.coefficient112_250,
  OriginalRow227TriangleData1432.coefficient112_251,
  OriginalRow227TriangleData1432.coefficient112_252,
  OriginalRow227TriangleData1432.coefficient112_253,
  OriginalRow227TriangleData1432.coefficient112_254,
  OriginalRow227TriangleData1432.coefficient112_255,
  OriginalRow227TriangleData1432.coefficient112_256,
  OriginalRow227TriangleData1432.coefficient112_257,
  OriginalRow227TriangleData1432.coefficient112_258,
  OriginalRow227TriangleData1432.coefficient112_259,
  OriginalRow227TriangleData1432.coefficient112_260,
  OriginalRow227TriangleData1432.coefficient112_261,
  OriginalRow227TriangleData1432.coefficient112_262,
  OriginalRow227TriangleData1432.coefficient112_263,
  OriginalRow227TriangleData1432.coefficient112_264,
  OriginalRow227TriangleData1432.coefficient112_265,
  OriginalRow227TriangleData1432.coefficient112_266,
  OriginalRow227TriangleData1432.coefficient112_267,
  OriginalRow227TriangleData1432.coefficient112_268,
  OriginalRow227TriangleData1432.coefficient112_269,
  OriginalRow227TriangleData1432.coefficient112_270
]

theorem values1432_size : values1432.size = 32 := rfl

def block1432 : ℕ → Option IntervalDyadic := segment 239 values1432

theorem block1432_domain : ExactDomain block1432 239 271 := by
  simpa only [values1432_size] using segment_domain 239 values1432

theorem block1432_get (i : Fin 32) :
    block1432 (239 + i.val) = some (values1432[i.val]'(by rw [values1432_size]; exact i.isLt)) := by
  exact segment_get 239 values1432 ⟨i.val, by rw [values1432_size]; exact i.isLt⟩

def values1433 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1433.coefficient112_271,
  OriginalRow227TriangleData1433.coefficient112_272,
  OriginalRow227TriangleData1433.coefficient112_273,
  OriginalRow227TriangleData1433.coefficient112_274,
  OriginalRow227TriangleData1433.coefficient112_275,
  OriginalRow227TriangleData1433.coefficient112_276,
  OriginalRow227TriangleData1433.coefficient112_277,
  OriginalRow227TriangleData1433.coefficient112_278,
  OriginalRow227TriangleData1433.coefficient112_279,
  OriginalRow227TriangleData1433.coefficient112_280,
  OriginalRow227TriangleData1433.coefficient112_281,
  OriginalRow227TriangleData1433.coefficient112_282,
  OriginalRow227TriangleData1433.coefficient112_283,
  OriginalRow227TriangleData1433.coefficient112_284,
  OriginalRow227TriangleData1433.coefficient112_285,
  OriginalRow227TriangleData1433.coefficient112_286,
  OriginalRow227TriangleData1433.coefficient112_287,
  OriginalRow227TriangleData1433.coefficient112_288,
  OriginalRow227TriangleData1433.coefficient112_289,
  OriginalRow227TriangleData1433.coefficient112_290,
  OriginalRow227TriangleData1433.coefficient112_291,
  OriginalRow227TriangleData1433.coefficient112_292,
  OriginalRow227TriangleData1433.coefficient112_293,
  OriginalRow227TriangleData1433.coefficient112_294,
  OriginalRow227TriangleData1433.coefficient112_295,
  OriginalRow227TriangleData1433.coefficient112_296,
  OriginalRow227TriangleData1433.coefficient112_297,
  OriginalRow227TriangleData1433.coefficient112_298,
  OriginalRow227TriangleData1433.coefficient112_299,
  OriginalRow227TriangleData1433.coefficient112_300,
  OriginalRow227TriangleData1433.coefficient112_301,
  OriginalRow227TriangleData1433.coefficient112_302
]

theorem values1433_size : values1433.size = 32 := rfl

def block1433 : ℕ → Option IntervalDyadic := segment 271 values1433

theorem block1433_domain : ExactDomain block1433 271 303 := by
  simpa only [values1433_size] using segment_domain 271 values1433

theorem block1433_get (i : Fin 32) :
    block1433 (271 + i.val) = some (values1433[i.val]'(by rw [values1433_size]; exact i.isLt)) := by
  exact segment_get 271 values1433 ⟨i.val, by rw [values1433_size]; exact i.isLt⟩

def values1434 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1434.coefficient112_303,
  OriginalRow227TriangleData1434.coefficient112_304,
  OriginalRow227TriangleData1434.coefficient112_305,
  OriginalRow227TriangleData1434.coefficient112_306,
  OriginalRow227TriangleData1434.coefficient112_307,
  OriginalRow227TriangleData1434.coefficient112_308,
  OriginalRow227TriangleData1434.coefficient112_309,
  OriginalRow227TriangleData1434.coefficient112_310,
  OriginalRow227TriangleData1434.coefficient112_311,
  OriginalRow227TriangleData1434.coefficient112_312,
  OriginalRow227TriangleData1434.coefficient112_313,
  OriginalRow227TriangleData1434.coefficient112_314,
  OriginalRow227TriangleData1434.coefficient112_315,
  OriginalRow227TriangleData1434.coefficient112_316,
  OriginalRow227TriangleData1434.coefficient112_317,
  OriginalRow227TriangleData1434.coefficient112_318,
  OriginalRow227TriangleData1434.coefficient112_319,
  OriginalRow227TriangleData1434.coefficient112_320,
  OriginalRow227TriangleData1434.coefficient112_321,
  OriginalRow227TriangleData1434.coefficient112_322,
  OriginalRow227TriangleData1434.coefficient112_323,
  OriginalRow227TriangleData1434.coefficient112_324,
  OriginalRow227TriangleData1434.coefficient112_325,
  OriginalRow227TriangleData1434.coefficient112_326,
  OriginalRow227TriangleData1434.coefficient112_327,
  OriginalRow227TriangleData1434.coefficient112_328,
  OriginalRow227TriangleData1434.coefficient112_329,
  OriginalRow227TriangleData1434.coefficient112_330,
  OriginalRow227TriangleData1434.coefficient112_331,
  OriginalRow227TriangleData1434.coefficient112_332,
  OriginalRow227TriangleData1434.coefficient112_333,
  OriginalRow227TriangleData1434.coefficient112_334
]

theorem values1434_size : values1434.size = 32 := rfl

def block1434 : ℕ → Option IntervalDyadic := segment 303 values1434

theorem block1434_domain : ExactDomain block1434 303 335 := by
  simpa only [values1434_size] using segment_domain 303 values1434

theorem block1434_get (i : Fin 32) :
    block1434 (303 + i.val) = some (values1434[i.val]'(by rw [values1434_size]; exact i.isLt)) := by
  exact segment_get 303 values1434 ⟨i.val, by rw [values1434_size]; exact i.isLt⟩

def values1435 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1435.coefficient112_335,
  OriginalRow227TriangleData1435.coefficient112_336,
  OriginalRow227TriangleData1435.coefficient112_337,
  OriginalRow227TriangleData1435.coefficient112_338,
  OriginalRow227TriangleData1435.coefficient112_339,
  OriginalRow227TriangleData1435.coefficient112_340,
  OriginalRow227TriangleData1435.coefficient112_341,
  OriginalRow227TriangleData1435.coefficient112_342,
  OriginalRow227TriangleData1435.coefficient112_343,
  OriginalRow227TriangleData1435.coefficient112_344,
  OriginalRow227TriangleData1435.coefficient112_345,
  OriginalRow227TriangleData1435.coefficient112_346,
  OriginalRow227TriangleData1435.coefficient112_347,
  OriginalRow227TriangleData1435.coefficient112_348,
  OriginalRow227TriangleData1435.coefficient112_349,
  OriginalRow227TriangleData1435.coefficient112_350,
  OriginalRow227TriangleData1435.coefficient112_351,
  OriginalRow227TriangleData1435.coefficient112_352,
  OriginalRow227TriangleData1435.coefficient112_353,
  OriginalRow227TriangleData1435.coefficient112_354,
  OriginalRow227TriangleData1435.coefficient112_355,
  OriginalRow227TriangleData1435.coefficient112_356,
  OriginalRow227TriangleData1435.coefficient112_357,
  OriginalRow227TriangleData1435.coefficient112_358,
  OriginalRow227TriangleData1435.coefficient112_359,
  OriginalRow227TriangleData1435.coefficient112_360,
  OriginalRow227TriangleData1435.coefficient112_361,
  OriginalRow227TriangleData1435.coefficient112_362,
  OriginalRow227TriangleData1435.coefficient112_363,
  OriginalRow227TriangleData1435.coefficient112_364,
  OriginalRow227TriangleData1435.coefficient112_365,
  OriginalRow227TriangleData1435.coefficient112_366
]

theorem values1435_size : values1435.size = 32 := rfl

def block1435 : ℕ → Option IntervalDyadic := segment 335 values1435

theorem block1435_domain : ExactDomain block1435 335 367 := by
  simpa only [values1435_size] using segment_domain 335 values1435

theorem block1435_get (i : Fin 32) :
    block1435 (335 + i.val) = some (values1435[i.val]'(by rw [values1435_size]; exact i.isLt)) := by
  exact segment_get 335 values1435 ⟨i.val, by rw [values1435_size]; exact i.isLt⟩

def values1436 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1436.coefficient112_367,
  OriginalRow227TriangleData1436.coefficient112_368,
  OriginalRow227TriangleData1436.coefficient112_369,
  OriginalRow227TriangleData1436.coefficient112_370,
  OriginalRow227TriangleData1436.coefficient112_371,
  OriginalRow227TriangleData1436.coefficient112_372,
  OriginalRow227TriangleData1436.coefficient112_373,
  OriginalRow227TriangleData1436.coefficient112_374,
  OriginalRow227TriangleData1436.coefficient112_375,
  OriginalRow227TriangleData1436.coefficient112_376,
  OriginalRow227TriangleData1436.coefficient112_377,
  OriginalRow227TriangleData1436.coefficient112_378,
  OriginalRow227TriangleData1436.coefficient112_379,
  OriginalRow227TriangleData1436.coefficient112_380,
  OriginalRow227TriangleData1436.coefficient112_381,
  OriginalRow227TriangleData1436.coefficient112_382,
  OriginalRow227TriangleData1436.coefficient112_383,
  OriginalRow227TriangleData1436.coefficient112_384,
  OriginalRow227TriangleData1436.coefficient112_385,
  OriginalRow227TriangleData1436.coefficient112_386,
  OriginalRow227TriangleData1436.coefficient112_387,
  OriginalRow227TriangleData1436.coefficient112_388,
  OriginalRow227TriangleData1436.coefficient112_389
]

theorem values1436_size : values1436.size = 23 := rfl

def block1436 : ℕ → Option IntervalDyadic := segment 367 values1436

theorem block1436_domain : ExactDomain block1436 367 390 := by
  simpa only [values1436_size] using segment_domain 367 values1436

theorem block1436_get (i : Fin 23) :
    block1436 (367 + i.val) = some (values1436[i.val]'(by rw [values1436_size]; exact i.isLt)) := by
  exact segment_get 367 values1436 ⟨i.val, by rw [values1436_size]; exact i.isLt⟩

def node0111_0175 : ℕ → Option IntervalDyadic := split 143 block1428 block1429

theorem node0111_0175_domain : ExactDomain node0111_0175 111 175 := by
  exact split_domain (by decide) (by decide) block1428_domain block1429_domain

def node0175_0239 : ℕ → Option IntervalDyadic := split 207 block1430 block1431

theorem node0175_0239_domain : ExactDomain node0175_0239 175 239 := by
  exact split_domain (by decide) (by decide) block1430_domain block1431_domain

def node0111_0239 : ℕ → Option IntervalDyadic := split 175 node0111_0175 node0175_0239

theorem node0111_0239_domain : ExactDomain node0111_0239 111 239 := by
  exact split_domain (by decide) (by decide) node0111_0175_domain node0175_0239_domain

def node0239_0303 : ℕ → Option IntervalDyadic := split 271 block1432 block1433

theorem node0239_0303_domain : ExactDomain node0239_0303 239 303 := by
  exact split_domain (by decide) (by decide) block1432_domain block1433_domain

def node0335_0390 : ℕ → Option IntervalDyadic := split 367 block1435 block1436

theorem node0335_0390_domain : ExactDomain node0335_0390 335 390 := by
  exact split_domain (by decide) (by decide) block1435_domain block1436_domain

def node0303_0390 : ℕ → Option IntervalDyadic := split 335 block1434 node0335_0390

theorem node0303_0390_domain : ExactDomain node0303_0390 303 390 := by
  exact split_domain (by decide) (by decide) block1434_domain node0335_0390_domain

def node0239_0390 : ℕ → Option IntervalDyadic := split 303 node0239_0303 node0303_0390

theorem node0239_0390_domain : ExactDomain node0239_0390 239 390 := by
  exact split_domain (by decide) (by decide) node0239_0303_domain node0303_0390_domain

def node0111_0390 : ℕ → Option IntervalDyadic := split 239 node0111_0239 node0239_0390

theorem node0111_0390_domain : ExactDomain node0111_0390 111 390 := by
  exact split_domain (by decide) (by decide) node0111_0239_domain node0239_0390_domain

def lookup : ℕ → Option IntervalDyadic := node0111_0390

theorem lookup_domain : ExactDomain lookup 111 390 :=
  node0111_0390_domain

theorem block1428_lookup (i : Fin 32) :
    lookup (111 + i.val) = some (values1428[i.val]'(by rw [values1428_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (111 + i.val) = _
  rw [node0111_0390, split_left 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0111_0239, split_left 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0111_0175, split_left 143 block1428 block1429 (by omega)]
  exact block1428_get i

theorem block1429_lookup (i : Fin 32) :
    lookup (143 + i.val) = some (values1429[i.val]'(by rw [values1429_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (143 + i.val) = _
  rw [node0111_0390, split_left 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0111_0239, split_left 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0111_0175, split_right 143 block1428 block1429 (by omega)]
  exact block1429_get i

theorem block1430_lookup (i : Fin 32) :
    lookup (175 + i.val) = some (values1430[i.val]'(by rw [values1430_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (175 + i.val) = _
  rw [node0111_0390, split_left 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0111_0239, split_right 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0175_0239, split_left 207 block1430 block1431 (by omega)]
  exact block1430_get i

theorem block1431_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values1431[i.val]'(by rw [values1431_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (207 + i.val) = _
  rw [node0111_0390, split_left 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0111_0239, split_right 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0175_0239, split_right 207 block1430 block1431 (by omega)]
  exact block1431_get i

theorem block1432_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values1432[i.val]'(by rw [values1432_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (239 + i.val) = _
  rw [node0111_0390, split_right 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0239_0390, split_left 303 node0239_0303 node0303_0390 (by omega)]
  rw [node0239_0303, split_left 271 block1432 block1433 (by omega)]
  exact block1432_get i

theorem block1433_lookup (i : Fin 32) :
    lookup (271 + i.val) = some (values1433[i.val]'(by rw [values1433_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (271 + i.val) = _
  rw [node0111_0390, split_right 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0239_0390, split_left 303 node0239_0303 node0303_0390 (by omega)]
  rw [node0239_0303, split_right 271 block1432 block1433 (by omega)]
  exact block1433_get i

theorem block1434_lookup (i : Fin 32) :
    lookup (303 + i.val) = some (values1434[i.val]'(by rw [values1434_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (303 + i.val) = _
  rw [node0111_0390, split_right 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0239_0390, split_right 303 node0239_0303 node0303_0390 (by omega)]
  rw [node0303_0390, split_left 335 block1434 node0335_0390 (by omega)]
  exact block1434_get i

theorem block1435_lookup (i : Fin 32) :
    lookup (335 + i.val) = some (values1435[i.val]'(by rw [values1435_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (335 + i.val) = _
  rw [node0111_0390, split_right 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0239_0390, split_right 303 node0239_0303 node0303_0390 (by omega)]
  rw [node0303_0390, split_right 335 block1434 node0335_0390 (by omega)]
  rw [node0335_0390, split_left 367 block1435 block1436 (by omega)]
  exact block1435_get i

theorem block1436_lookup (i : Fin 23) :
    lookup (367 + i.val) = some (values1436[i.val]'(by rw [values1436_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0111_0390 (367 + i.val) = _
  rw [node0111_0390, split_right 239 node0111_0239 node0239_0390 (by omega)]
  rw [node0239_0390, split_right 303 node0239_0303 node0303_0390 (by omega)]
  rw [node0303_0390, split_right 335 block1434 node0335_0390 (by omega)]
  rw [node0335_0390, split_right 367 block1435 block1436 (by omega)]
  exact block1436_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1428_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1428_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1429_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1429_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1430_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1430_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1431_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1431_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1432_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1432_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1433_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1433_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1434_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1434_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1435_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1435_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1436_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1436_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1428_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1429_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1430_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1431_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1432_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1433_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1434_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1435_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow112.block1436_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow112
