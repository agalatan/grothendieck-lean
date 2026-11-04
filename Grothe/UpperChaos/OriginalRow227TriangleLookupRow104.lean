import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1352
import Grothe.UpperChaos.OriginalRow227TriangleData1353
import Grothe.UpperChaos.OriginalRow227TriangleData1354
import Grothe.UpperChaos.OriginalRow227TriangleData1355
import Grothe.UpperChaos.OriginalRow227TriangleData1356
import Grothe.UpperChaos.OriginalRow227TriangleData1357
import Grothe.UpperChaos.OriginalRow227TriangleData1358
import Grothe.UpperChaos.OriginalRow227TriangleData1359
import Grothe.UpperChaos.OriginalRow227TriangleData1360
import Grothe.UpperChaos.OriginalRow227TriangleData1361

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow104

open ConditionalTableLookup

def values1352 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1352.coefficient104_103,
  OriginalRow227TriangleData1352.coefficient104_104,
  OriginalRow227TriangleData1352.coefficient104_105,
  OriginalRow227TriangleData1352.coefficient104_106,
  OriginalRow227TriangleData1352.coefficient104_107,
  OriginalRow227TriangleData1352.coefficient104_108,
  OriginalRow227TriangleData1352.coefficient104_109,
  OriginalRow227TriangleData1352.coefficient104_110,
  OriginalRow227TriangleData1352.coefficient104_111,
  OriginalRow227TriangleData1352.coefficient104_112,
  OriginalRow227TriangleData1352.coefficient104_113,
  OriginalRow227TriangleData1352.coefficient104_114,
  OriginalRow227TriangleData1352.coefficient104_115,
  OriginalRow227TriangleData1352.coefficient104_116,
  OriginalRow227TriangleData1352.coefficient104_117,
  OriginalRow227TriangleData1352.coefficient104_118,
  OriginalRow227TriangleData1352.coefficient104_119,
  OriginalRow227TriangleData1352.coefficient104_120,
  OriginalRow227TriangleData1352.coefficient104_121,
  OriginalRow227TriangleData1352.coefficient104_122,
  OriginalRow227TriangleData1352.coefficient104_123,
  OriginalRow227TriangleData1352.coefficient104_124,
  OriginalRow227TriangleData1352.coefficient104_125,
  OriginalRow227TriangleData1352.coefficient104_126,
  OriginalRow227TriangleData1352.coefficient104_127,
  OriginalRow227TriangleData1352.coefficient104_128,
  OriginalRow227TriangleData1352.coefficient104_129,
  OriginalRow227TriangleData1352.coefficient104_130,
  OriginalRow227TriangleData1352.coefficient104_131,
  OriginalRow227TriangleData1352.coefficient104_132,
  OriginalRow227TriangleData1352.coefficient104_133,
  OriginalRow227TriangleData1352.coefficient104_134
]

theorem values1352_size : values1352.size = 32 := rfl

def block1352 : ℕ → Option IntervalDyadic := segment 103 values1352

theorem block1352_domain : ExactDomain block1352 103 135 := by
  simpa only [values1352_size] using segment_domain 103 values1352

theorem block1352_get (i : Fin 32) :
    block1352 (103 + i.val) = some (values1352[i.val]'(by rw [values1352_size]; exact i.isLt)) := by
  exact segment_get 103 values1352 ⟨i.val, by rw [values1352_size]; exact i.isLt⟩

def values1353 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1353.coefficient104_135,
  OriginalRow227TriangleData1353.coefficient104_136,
  OriginalRow227TriangleData1353.coefficient104_137,
  OriginalRow227TriangleData1353.coefficient104_138,
  OriginalRow227TriangleData1353.coefficient104_139,
  OriginalRow227TriangleData1353.coefficient104_140,
  OriginalRow227TriangleData1353.coefficient104_141,
  OriginalRow227TriangleData1353.coefficient104_142,
  OriginalRow227TriangleData1353.coefficient104_143,
  OriginalRow227TriangleData1353.coefficient104_144,
  OriginalRow227TriangleData1353.coefficient104_145,
  OriginalRow227TriangleData1353.coefficient104_146,
  OriginalRow227TriangleData1353.coefficient104_147,
  OriginalRow227TriangleData1353.coefficient104_148,
  OriginalRow227TriangleData1353.coefficient104_149,
  OriginalRow227TriangleData1353.coefficient104_150,
  OriginalRow227TriangleData1353.coefficient104_151,
  OriginalRow227TriangleData1353.coefficient104_152,
  OriginalRow227TriangleData1353.coefficient104_153,
  OriginalRow227TriangleData1353.coefficient104_154,
  OriginalRow227TriangleData1353.coefficient104_155,
  OriginalRow227TriangleData1353.coefficient104_156,
  OriginalRow227TriangleData1353.coefficient104_157,
  OriginalRow227TriangleData1353.coefficient104_158,
  OriginalRow227TriangleData1353.coefficient104_159,
  OriginalRow227TriangleData1353.coefficient104_160,
  OriginalRow227TriangleData1353.coefficient104_161,
  OriginalRow227TriangleData1353.coefficient104_162,
  OriginalRow227TriangleData1353.coefficient104_163,
  OriginalRow227TriangleData1353.coefficient104_164,
  OriginalRow227TriangleData1353.coefficient104_165,
  OriginalRow227TriangleData1353.coefficient104_166
]

theorem values1353_size : values1353.size = 32 := rfl

def block1353 : ℕ → Option IntervalDyadic := segment 135 values1353

theorem block1353_domain : ExactDomain block1353 135 167 := by
  simpa only [values1353_size] using segment_domain 135 values1353

theorem block1353_get (i : Fin 32) :
    block1353 (135 + i.val) = some (values1353[i.val]'(by rw [values1353_size]; exact i.isLt)) := by
  exact segment_get 135 values1353 ⟨i.val, by rw [values1353_size]; exact i.isLt⟩

def values1354 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1354.coefficient104_167,
  OriginalRow227TriangleData1354.coefficient104_168,
  OriginalRow227TriangleData1354.coefficient104_169,
  OriginalRow227TriangleData1354.coefficient104_170,
  OriginalRow227TriangleData1354.coefficient104_171,
  OriginalRow227TriangleData1354.coefficient104_172,
  OriginalRow227TriangleData1354.coefficient104_173,
  OriginalRow227TriangleData1354.coefficient104_174,
  OriginalRow227TriangleData1354.coefficient104_175,
  OriginalRow227TriangleData1354.coefficient104_176,
  OriginalRow227TriangleData1354.coefficient104_177,
  OriginalRow227TriangleData1354.coefficient104_178,
  OriginalRow227TriangleData1354.coefficient104_179,
  OriginalRow227TriangleData1354.coefficient104_180,
  OriginalRow227TriangleData1354.coefficient104_181,
  OriginalRow227TriangleData1354.coefficient104_182,
  OriginalRow227TriangleData1354.coefficient104_183,
  OriginalRow227TriangleData1354.coefficient104_184,
  OriginalRow227TriangleData1354.coefficient104_185,
  OriginalRow227TriangleData1354.coefficient104_186,
  OriginalRow227TriangleData1354.coefficient104_187,
  OriginalRow227TriangleData1354.coefficient104_188,
  OriginalRow227TriangleData1354.coefficient104_189,
  OriginalRow227TriangleData1354.coefficient104_190,
  OriginalRow227TriangleData1354.coefficient104_191,
  OriginalRow227TriangleData1354.coefficient104_192,
  OriginalRow227TriangleData1354.coefficient104_193,
  OriginalRow227TriangleData1354.coefficient104_194,
  OriginalRow227TriangleData1354.coefficient104_195,
  OriginalRow227TriangleData1354.coefficient104_196,
  OriginalRow227TriangleData1354.coefficient104_197,
  OriginalRow227TriangleData1354.coefficient104_198
]

theorem values1354_size : values1354.size = 32 := rfl

def block1354 : ℕ → Option IntervalDyadic := segment 167 values1354

theorem block1354_domain : ExactDomain block1354 167 199 := by
  simpa only [values1354_size] using segment_domain 167 values1354

theorem block1354_get (i : Fin 32) :
    block1354 (167 + i.val) = some (values1354[i.val]'(by rw [values1354_size]; exact i.isLt)) := by
  exact segment_get 167 values1354 ⟨i.val, by rw [values1354_size]; exact i.isLt⟩

def values1355 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1355.coefficient104_199,
  OriginalRow227TriangleData1355.coefficient104_200,
  OriginalRow227TriangleData1355.coefficient104_201,
  OriginalRow227TriangleData1355.coefficient104_202,
  OriginalRow227TriangleData1355.coefficient104_203,
  OriginalRow227TriangleData1355.coefficient104_204,
  OriginalRow227TriangleData1355.coefficient104_205,
  OriginalRow227TriangleData1355.coefficient104_206,
  OriginalRow227TriangleData1355.coefficient104_207,
  OriginalRow227TriangleData1355.coefficient104_208,
  OriginalRow227TriangleData1355.coefficient104_209,
  OriginalRow227TriangleData1355.coefficient104_210,
  OriginalRow227TriangleData1355.coefficient104_211,
  OriginalRow227TriangleData1355.coefficient104_212,
  OriginalRow227TriangleData1355.coefficient104_213,
  OriginalRow227TriangleData1355.coefficient104_214,
  OriginalRow227TriangleData1355.coefficient104_215,
  OriginalRow227TriangleData1355.coefficient104_216,
  OriginalRow227TriangleData1355.coefficient104_217,
  OriginalRow227TriangleData1355.coefficient104_218,
  OriginalRow227TriangleData1355.coefficient104_219,
  OriginalRow227TriangleData1355.coefficient104_220,
  OriginalRow227TriangleData1355.coefficient104_221,
  OriginalRow227TriangleData1355.coefficient104_222,
  OriginalRow227TriangleData1355.coefficient104_223,
  OriginalRow227TriangleData1355.coefficient104_224,
  OriginalRow227TriangleData1355.coefficient104_225,
  OriginalRow227TriangleData1355.coefficient104_226,
  OriginalRow227TriangleData1355.coefficient104_227,
  OriginalRow227TriangleData1355.coefficient104_228,
  OriginalRow227TriangleData1355.coefficient104_229,
  OriginalRow227TriangleData1355.coefficient104_230
]

theorem values1355_size : values1355.size = 32 := rfl

def block1355 : ℕ → Option IntervalDyadic := segment 199 values1355

theorem block1355_domain : ExactDomain block1355 199 231 := by
  simpa only [values1355_size] using segment_domain 199 values1355

theorem block1355_get (i : Fin 32) :
    block1355 (199 + i.val) = some (values1355[i.val]'(by rw [values1355_size]; exact i.isLt)) := by
  exact segment_get 199 values1355 ⟨i.val, by rw [values1355_size]; exact i.isLt⟩

def values1356 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1356.coefficient104_231,
  OriginalRow227TriangleData1356.coefficient104_232,
  OriginalRow227TriangleData1356.coefficient104_233,
  OriginalRow227TriangleData1356.coefficient104_234,
  OriginalRow227TriangleData1356.coefficient104_235,
  OriginalRow227TriangleData1356.coefficient104_236,
  OriginalRow227TriangleData1356.coefficient104_237,
  OriginalRow227TriangleData1356.coefficient104_238,
  OriginalRow227TriangleData1356.coefficient104_239,
  OriginalRow227TriangleData1356.coefficient104_240,
  OriginalRow227TriangleData1356.coefficient104_241,
  OriginalRow227TriangleData1356.coefficient104_242,
  OriginalRow227TriangleData1356.coefficient104_243,
  OriginalRow227TriangleData1356.coefficient104_244,
  OriginalRow227TriangleData1356.coefficient104_245,
  OriginalRow227TriangleData1356.coefficient104_246,
  OriginalRow227TriangleData1356.coefficient104_247,
  OriginalRow227TriangleData1356.coefficient104_248,
  OriginalRow227TriangleData1356.coefficient104_249,
  OriginalRow227TriangleData1356.coefficient104_250,
  OriginalRow227TriangleData1356.coefficient104_251,
  OriginalRow227TriangleData1356.coefficient104_252,
  OriginalRow227TriangleData1356.coefficient104_253,
  OriginalRow227TriangleData1356.coefficient104_254,
  OriginalRow227TriangleData1356.coefficient104_255,
  OriginalRow227TriangleData1356.coefficient104_256,
  OriginalRow227TriangleData1356.coefficient104_257,
  OriginalRow227TriangleData1356.coefficient104_258,
  OriginalRow227TriangleData1356.coefficient104_259,
  OriginalRow227TriangleData1356.coefficient104_260,
  OriginalRow227TriangleData1356.coefficient104_261,
  OriginalRow227TriangleData1356.coefficient104_262
]

theorem values1356_size : values1356.size = 32 := rfl

def block1356 : ℕ → Option IntervalDyadic := segment 231 values1356

theorem block1356_domain : ExactDomain block1356 231 263 := by
  simpa only [values1356_size] using segment_domain 231 values1356

theorem block1356_get (i : Fin 32) :
    block1356 (231 + i.val) = some (values1356[i.val]'(by rw [values1356_size]; exact i.isLt)) := by
  exact segment_get 231 values1356 ⟨i.val, by rw [values1356_size]; exact i.isLt⟩

def values1357 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1357.coefficient104_263,
  OriginalRow227TriangleData1357.coefficient104_264,
  OriginalRow227TriangleData1357.coefficient104_265,
  OriginalRow227TriangleData1357.coefficient104_266,
  OriginalRow227TriangleData1357.coefficient104_267,
  OriginalRow227TriangleData1357.coefficient104_268,
  OriginalRow227TriangleData1357.coefficient104_269,
  OriginalRow227TriangleData1357.coefficient104_270,
  OriginalRow227TriangleData1357.coefficient104_271,
  OriginalRow227TriangleData1357.coefficient104_272,
  OriginalRow227TriangleData1357.coefficient104_273,
  OriginalRow227TriangleData1357.coefficient104_274,
  OriginalRow227TriangleData1357.coefficient104_275,
  OriginalRow227TriangleData1357.coefficient104_276,
  OriginalRow227TriangleData1357.coefficient104_277,
  OriginalRow227TriangleData1357.coefficient104_278,
  OriginalRow227TriangleData1357.coefficient104_279,
  OriginalRow227TriangleData1357.coefficient104_280,
  OriginalRow227TriangleData1357.coefficient104_281,
  OriginalRow227TriangleData1357.coefficient104_282,
  OriginalRow227TriangleData1357.coefficient104_283,
  OriginalRow227TriangleData1357.coefficient104_284,
  OriginalRow227TriangleData1357.coefficient104_285,
  OriginalRow227TriangleData1357.coefficient104_286,
  OriginalRow227TriangleData1357.coefficient104_287,
  OriginalRow227TriangleData1357.coefficient104_288,
  OriginalRow227TriangleData1357.coefficient104_289,
  OriginalRow227TriangleData1357.coefficient104_290,
  OriginalRow227TriangleData1357.coefficient104_291,
  OriginalRow227TriangleData1357.coefficient104_292,
  OriginalRow227TriangleData1357.coefficient104_293,
  OriginalRow227TriangleData1357.coefficient104_294
]

theorem values1357_size : values1357.size = 32 := rfl

def block1357 : ℕ → Option IntervalDyadic := segment 263 values1357

theorem block1357_domain : ExactDomain block1357 263 295 := by
  simpa only [values1357_size] using segment_domain 263 values1357

theorem block1357_get (i : Fin 32) :
    block1357 (263 + i.val) = some (values1357[i.val]'(by rw [values1357_size]; exact i.isLt)) := by
  exact segment_get 263 values1357 ⟨i.val, by rw [values1357_size]; exact i.isLt⟩

def values1358 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1358.coefficient104_295,
  OriginalRow227TriangleData1358.coefficient104_296,
  OriginalRow227TriangleData1358.coefficient104_297,
  OriginalRow227TriangleData1358.coefficient104_298,
  OriginalRow227TriangleData1358.coefficient104_299,
  OriginalRow227TriangleData1358.coefficient104_300,
  OriginalRow227TriangleData1358.coefficient104_301,
  OriginalRow227TriangleData1358.coefficient104_302,
  OriginalRow227TriangleData1358.coefficient104_303,
  OriginalRow227TriangleData1358.coefficient104_304,
  OriginalRow227TriangleData1358.coefficient104_305,
  OriginalRow227TriangleData1358.coefficient104_306,
  OriginalRow227TriangleData1358.coefficient104_307,
  OriginalRow227TriangleData1358.coefficient104_308,
  OriginalRow227TriangleData1358.coefficient104_309,
  OriginalRow227TriangleData1358.coefficient104_310,
  OriginalRow227TriangleData1358.coefficient104_311,
  OriginalRow227TriangleData1358.coefficient104_312,
  OriginalRow227TriangleData1358.coefficient104_313,
  OriginalRow227TriangleData1358.coefficient104_314,
  OriginalRow227TriangleData1358.coefficient104_315,
  OriginalRow227TriangleData1358.coefficient104_316,
  OriginalRow227TriangleData1358.coefficient104_317,
  OriginalRow227TriangleData1358.coefficient104_318,
  OriginalRow227TriangleData1358.coefficient104_319,
  OriginalRow227TriangleData1358.coefficient104_320,
  OriginalRow227TriangleData1358.coefficient104_321,
  OriginalRow227TriangleData1358.coefficient104_322,
  OriginalRow227TriangleData1358.coefficient104_323,
  OriginalRow227TriangleData1358.coefficient104_324,
  OriginalRow227TriangleData1358.coefficient104_325,
  OriginalRow227TriangleData1358.coefficient104_326
]

theorem values1358_size : values1358.size = 32 := rfl

def block1358 : ℕ → Option IntervalDyadic := segment 295 values1358

theorem block1358_domain : ExactDomain block1358 295 327 := by
  simpa only [values1358_size] using segment_domain 295 values1358

theorem block1358_get (i : Fin 32) :
    block1358 (295 + i.val) = some (values1358[i.val]'(by rw [values1358_size]; exact i.isLt)) := by
  exact segment_get 295 values1358 ⟨i.val, by rw [values1358_size]; exact i.isLt⟩

def values1359 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1359.coefficient104_327,
  OriginalRow227TriangleData1359.coefficient104_328,
  OriginalRow227TriangleData1359.coefficient104_329,
  OriginalRow227TriangleData1359.coefficient104_330,
  OriginalRow227TriangleData1359.coefficient104_331,
  OriginalRow227TriangleData1359.coefficient104_332,
  OriginalRow227TriangleData1359.coefficient104_333,
  OriginalRow227TriangleData1359.coefficient104_334,
  OriginalRow227TriangleData1359.coefficient104_335,
  OriginalRow227TriangleData1359.coefficient104_336,
  OriginalRow227TriangleData1359.coefficient104_337,
  OriginalRow227TriangleData1359.coefficient104_338,
  OriginalRow227TriangleData1359.coefficient104_339,
  OriginalRow227TriangleData1359.coefficient104_340,
  OriginalRow227TriangleData1359.coefficient104_341,
  OriginalRow227TriangleData1359.coefficient104_342,
  OriginalRow227TriangleData1359.coefficient104_343,
  OriginalRow227TriangleData1359.coefficient104_344,
  OriginalRow227TriangleData1359.coefficient104_345,
  OriginalRow227TriangleData1359.coefficient104_346,
  OriginalRow227TriangleData1359.coefficient104_347,
  OriginalRow227TriangleData1359.coefficient104_348,
  OriginalRow227TriangleData1359.coefficient104_349,
  OriginalRow227TriangleData1359.coefficient104_350,
  OriginalRow227TriangleData1359.coefficient104_351,
  OriginalRow227TriangleData1359.coefficient104_352,
  OriginalRow227TriangleData1359.coefficient104_353,
  OriginalRow227TriangleData1359.coefficient104_354,
  OriginalRow227TriangleData1359.coefficient104_355,
  OriginalRow227TriangleData1359.coefficient104_356,
  OriginalRow227TriangleData1359.coefficient104_357,
  OriginalRow227TriangleData1359.coefficient104_358
]

theorem values1359_size : values1359.size = 32 := rfl

def block1359 : ℕ → Option IntervalDyadic := segment 327 values1359

theorem block1359_domain : ExactDomain block1359 327 359 := by
  simpa only [values1359_size] using segment_domain 327 values1359

theorem block1359_get (i : Fin 32) :
    block1359 (327 + i.val) = some (values1359[i.val]'(by rw [values1359_size]; exact i.isLt)) := by
  exact segment_get 327 values1359 ⟨i.val, by rw [values1359_size]; exact i.isLt⟩

def values1360 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1360.coefficient104_359,
  OriginalRow227TriangleData1360.coefficient104_360,
  OriginalRow227TriangleData1360.coefficient104_361,
  OriginalRow227TriangleData1360.coefficient104_362,
  OriginalRow227TriangleData1360.coefficient104_363,
  OriginalRow227TriangleData1360.coefficient104_364,
  OriginalRow227TriangleData1360.coefficient104_365,
  OriginalRow227TriangleData1360.coefficient104_366,
  OriginalRow227TriangleData1360.coefficient104_367,
  OriginalRow227TriangleData1360.coefficient104_368,
  OriginalRow227TriangleData1360.coefficient104_369,
  OriginalRow227TriangleData1360.coefficient104_370,
  OriginalRow227TriangleData1360.coefficient104_371,
  OriginalRow227TriangleData1360.coefficient104_372,
  OriginalRow227TriangleData1360.coefficient104_373,
  OriginalRow227TriangleData1360.coefficient104_374,
  OriginalRow227TriangleData1360.coefficient104_375,
  OriginalRow227TriangleData1360.coefficient104_376,
  OriginalRow227TriangleData1360.coefficient104_377,
  OriginalRow227TriangleData1360.coefficient104_378,
  OriginalRow227TriangleData1360.coefficient104_379,
  OriginalRow227TriangleData1360.coefficient104_380,
  OriginalRow227TriangleData1360.coefficient104_381,
  OriginalRow227TriangleData1360.coefficient104_382,
  OriginalRow227TriangleData1360.coefficient104_383,
  OriginalRow227TriangleData1360.coefficient104_384,
  OriginalRow227TriangleData1360.coefficient104_385,
  OriginalRow227TriangleData1360.coefficient104_386,
  OriginalRow227TriangleData1360.coefficient104_387,
  OriginalRow227TriangleData1360.coefficient104_388,
  OriginalRow227TriangleData1360.coefficient104_389,
  OriginalRow227TriangleData1360.coefficient104_390
]

theorem values1360_size : values1360.size = 32 := rfl

def block1360 : ℕ → Option IntervalDyadic := segment 359 values1360

theorem block1360_domain : ExactDomain block1360 359 391 := by
  simpa only [values1360_size] using segment_domain 359 values1360

theorem block1360_get (i : Fin 32) :
    block1360 (359 + i.val) = some (values1360[i.val]'(by rw [values1360_size]; exact i.isLt)) := by
  exact segment_get 359 values1360 ⟨i.val, by rw [values1360_size]; exact i.isLt⟩

def values1361 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1361.coefficient104_391,
  OriginalRow227TriangleData1361.coefficient104_392,
  OriginalRow227TriangleData1361.coefficient104_393,
  OriginalRow227TriangleData1361.coefficient104_394,
  OriginalRow227TriangleData1361.coefficient104_395,
  OriginalRow227TriangleData1361.coefficient104_396,
  OriginalRow227TriangleData1361.coefficient104_397
]

theorem values1361_size : values1361.size = 7 := rfl

def block1361 : ℕ → Option IntervalDyadic := segment 391 values1361

theorem block1361_domain : ExactDomain block1361 391 398 := by
  simpa only [values1361_size] using segment_domain 391 values1361

theorem block1361_get (i : Fin 7) :
    block1361 (391 + i.val) = some (values1361[i.val]'(by rw [values1361_size]; exact i.isLt)) := by
  exact segment_get 391 values1361 ⟨i.val, by rw [values1361_size]; exact i.isLt⟩

def node0103_0167 : ℕ → Option IntervalDyadic := split 135 block1352 block1353

theorem node0103_0167_domain : ExactDomain node0103_0167 103 167 := by
  exact split_domain (by decide) (by decide) block1352_domain block1353_domain

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block1355 block1356

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block1355_domain block1356_domain

def node0167_0263 : ℕ → Option IntervalDyadic := split 199 block1354 node0199_0263

theorem node0167_0263_domain : ExactDomain node0167_0263 167 263 := by
  exact split_domain (by decide) (by decide) block1354_domain node0199_0263_domain

def node0103_0263 : ℕ → Option IntervalDyadic := split 167 node0103_0167 node0167_0263

theorem node0103_0263_domain : ExactDomain node0103_0263 103 263 := by
  exact split_domain (by decide) (by decide) node0103_0167_domain node0167_0263_domain

def node0263_0327 : ℕ → Option IntervalDyadic := split 295 block1357 block1358

theorem node0263_0327_domain : ExactDomain node0263_0327 263 327 := by
  exact split_domain (by decide) (by decide) block1357_domain block1358_domain

def node0359_0398 : ℕ → Option IntervalDyadic := split 391 block1360 block1361

theorem node0359_0398_domain : ExactDomain node0359_0398 359 398 := by
  exact split_domain (by decide) (by decide) block1360_domain block1361_domain

def node0327_0398 : ℕ → Option IntervalDyadic := split 359 block1359 node0359_0398

theorem node0327_0398_domain : ExactDomain node0327_0398 327 398 := by
  exact split_domain (by decide) (by decide) block1359_domain node0359_0398_domain

def node0263_0398 : ℕ → Option IntervalDyadic := split 327 node0263_0327 node0327_0398

theorem node0263_0398_domain : ExactDomain node0263_0398 263 398 := by
  exact split_domain (by decide) (by decide) node0263_0327_domain node0327_0398_domain

def node0103_0398 : ℕ → Option IntervalDyadic := split 263 node0103_0263 node0263_0398

theorem node0103_0398_domain : ExactDomain node0103_0398 103 398 := by
  exact split_domain (by decide) (by decide) node0103_0263_domain node0263_0398_domain

def lookup : ℕ → Option IntervalDyadic := node0103_0398

theorem lookup_domain : ExactDomain lookup 103 398 :=
  node0103_0398_domain

theorem block1352_lookup (i : Fin 32) :
    lookup (103 + i.val) = some (values1352[i.val]'(by rw [values1352_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (103 + i.val) = _
  rw [node0103_0398, split_left 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0103_0263, split_left 167 node0103_0167 node0167_0263 (by omega)]
  rw [node0103_0167, split_left 135 block1352 block1353 (by omega)]
  exact block1352_get i

theorem block1353_lookup (i : Fin 32) :
    lookup (135 + i.val) = some (values1353[i.val]'(by rw [values1353_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (135 + i.val) = _
  rw [node0103_0398, split_left 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0103_0263, split_left 167 node0103_0167 node0167_0263 (by omega)]
  rw [node0103_0167, split_right 135 block1352 block1353 (by omega)]
  exact block1353_get i

theorem block1354_lookup (i : Fin 32) :
    lookup (167 + i.val) = some (values1354[i.val]'(by rw [values1354_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (167 + i.val) = _
  rw [node0103_0398, split_left 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0103_0263, split_right 167 node0103_0167 node0167_0263 (by omega)]
  rw [node0167_0263, split_left 199 block1354 node0199_0263 (by omega)]
  exact block1354_get i

theorem block1355_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values1355[i.val]'(by rw [values1355_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (199 + i.val) = _
  rw [node0103_0398, split_left 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0103_0263, split_right 167 node0103_0167 node0167_0263 (by omega)]
  rw [node0167_0263, split_right 199 block1354 node0199_0263 (by omega)]
  rw [node0199_0263, split_left 231 block1355 block1356 (by omega)]
  exact block1355_get i

theorem block1356_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values1356[i.val]'(by rw [values1356_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (231 + i.val) = _
  rw [node0103_0398, split_left 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0103_0263, split_right 167 node0103_0167 node0167_0263 (by omega)]
  rw [node0167_0263, split_right 199 block1354 node0199_0263 (by omega)]
  rw [node0199_0263, split_right 231 block1355 block1356 (by omega)]
  exact block1356_get i

theorem block1357_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values1357[i.val]'(by rw [values1357_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (263 + i.val) = _
  rw [node0103_0398, split_right 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0263_0398, split_left 327 node0263_0327 node0327_0398 (by omega)]
  rw [node0263_0327, split_left 295 block1357 block1358 (by omega)]
  exact block1357_get i

theorem block1358_lookup (i : Fin 32) :
    lookup (295 + i.val) = some (values1358[i.val]'(by rw [values1358_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (295 + i.val) = _
  rw [node0103_0398, split_right 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0263_0398, split_left 327 node0263_0327 node0327_0398 (by omega)]
  rw [node0263_0327, split_right 295 block1357 block1358 (by omega)]
  exact block1358_get i

theorem block1359_lookup (i : Fin 32) :
    lookup (327 + i.val) = some (values1359[i.val]'(by rw [values1359_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (327 + i.val) = _
  rw [node0103_0398, split_right 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0263_0398, split_right 327 node0263_0327 node0327_0398 (by omega)]
  rw [node0327_0398, split_left 359 block1359 node0359_0398 (by omega)]
  exact block1359_get i

theorem block1360_lookup (i : Fin 32) :
    lookup (359 + i.val) = some (values1360[i.val]'(by rw [values1360_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (359 + i.val) = _
  rw [node0103_0398, split_right 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0263_0398, split_right 327 node0263_0327 node0327_0398 (by omega)]
  rw [node0327_0398, split_right 359 block1359 node0359_0398 (by omega)]
  rw [node0359_0398, split_left 391 block1360 block1361 (by omega)]
  exact block1360_get i

theorem block1361_lookup (i : Fin 7) :
    lookup (391 + i.val) = some (values1361[i.val]'(by rw [values1361_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0103_0398 (391 + i.val) = _
  rw [node0103_0398, split_right 263 node0103_0263 node0263_0398 (by omega)]
  rw [node0263_0398, split_right 327 node0263_0327 node0327_0398 (by omega)]
  rw [node0327_0398, split_right 359 block1359 node0359_0398 (by omega)]
  rw [node0359_0398, split_right 391 block1360 block1361 (by omega)]
  exact block1361_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1352_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1352_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1353_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1353_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1354_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1354_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1355_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1355_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1356_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1356_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1357_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1357_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1358_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1358_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1359_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1359_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1360_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1360_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1361_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1361_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1352_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1353_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1354_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1355_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1356_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1357_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1358_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1359_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1360_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow104.block1361_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow104
