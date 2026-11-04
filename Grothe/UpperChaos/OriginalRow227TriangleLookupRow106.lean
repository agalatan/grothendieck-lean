import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1372
import Grothe.UpperChaos.OriginalRow227TriangleData1373
import Grothe.UpperChaos.OriginalRow227TriangleData1374
import Grothe.UpperChaos.OriginalRow227TriangleData1375
import Grothe.UpperChaos.OriginalRow227TriangleData1376
import Grothe.UpperChaos.OriginalRow227TriangleData1377
import Grothe.UpperChaos.OriginalRow227TriangleData1378
import Grothe.UpperChaos.OriginalRow227TriangleData1379
import Grothe.UpperChaos.OriginalRow227TriangleData1380
import Grothe.UpperChaos.OriginalRow227TriangleData1381

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow106

open ConditionalTableLookup

def values1372 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1372.coefficient106_105,
  OriginalRow227TriangleData1372.coefficient106_106,
  OriginalRow227TriangleData1372.coefficient106_107,
  OriginalRow227TriangleData1372.coefficient106_108,
  OriginalRow227TriangleData1372.coefficient106_109,
  OriginalRow227TriangleData1372.coefficient106_110,
  OriginalRow227TriangleData1372.coefficient106_111,
  OriginalRow227TriangleData1372.coefficient106_112,
  OriginalRow227TriangleData1372.coefficient106_113,
  OriginalRow227TriangleData1372.coefficient106_114,
  OriginalRow227TriangleData1372.coefficient106_115,
  OriginalRow227TriangleData1372.coefficient106_116,
  OriginalRow227TriangleData1372.coefficient106_117,
  OriginalRow227TriangleData1372.coefficient106_118,
  OriginalRow227TriangleData1372.coefficient106_119,
  OriginalRow227TriangleData1372.coefficient106_120,
  OriginalRow227TriangleData1372.coefficient106_121,
  OriginalRow227TriangleData1372.coefficient106_122,
  OriginalRow227TriangleData1372.coefficient106_123,
  OriginalRow227TriangleData1372.coefficient106_124,
  OriginalRow227TriangleData1372.coefficient106_125,
  OriginalRow227TriangleData1372.coefficient106_126,
  OriginalRow227TriangleData1372.coefficient106_127,
  OriginalRow227TriangleData1372.coefficient106_128,
  OriginalRow227TriangleData1372.coefficient106_129,
  OriginalRow227TriangleData1372.coefficient106_130,
  OriginalRow227TriangleData1372.coefficient106_131,
  OriginalRow227TriangleData1372.coefficient106_132,
  OriginalRow227TriangleData1372.coefficient106_133,
  OriginalRow227TriangleData1372.coefficient106_134,
  OriginalRow227TriangleData1372.coefficient106_135,
  OriginalRow227TriangleData1372.coefficient106_136
]

theorem values1372_size : values1372.size = 32 := rfl

def block1372 : ℕ → Option IntervalDyadic := segment 105 values1372

theorem block1372_domain : ExactDomain block1372 105 137 := by
  simpa only [values1372_size] using segment_domain 105 values1372

theorem block1372_get (i : Fin 32) :
    block1372 (105 + i.val) = some (values1372[i.val]'(by rw [values1372_size]; exact i.isLt)) := by
  exact segment_get 105 values1372 ⟨i.val, by rw [values1372_size]; exact i.isLt⟩

def values1373 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1373.coefficient106_137,
  OriginalRow227TriangleData1373.coefficient106_138,
  OriginalRow227TriangleData1373.coefficient106_139,
  OriginalRow227TriangleData1373.coefficient106_140,
  OriginalRow227TriangleData1373.coefficient106_141,
  OriginalRow227TriangleData1373.coefficient106_142,
  OriginalRow227TriangleData1373.coefficient106_143,
  OriginalRow227TriangleData1373.coefficient106_144,
  OriginalRow227TriangleData1373.coefficient106_145,
  OriginalRow227TriangleData1373.coefficient106_146,
  OriginalRow227TriangleData1373.coefficient106_147,
  OriginalRow227TriangleData1373.coefficient106_148,
  OriginalRow227TriangleData1373.coefficient106_149,
  OriginalRow227TriangleData1373.coefficient106_150,
  OriginalRow227TriangleData1373.coefficient106_151,
  OriginalRow227TriangleData1373.coefficient106_152,
  OriginalRow227TriangleData1373.coefficient106_153,
  OriginalRow227TriangleData1373.coefficient106_154,
  OriginalRow227TriangleData1373.coefficient106_155,
  OriginalRow227TriangleData1373.coefficient106_156,
  OriginalRow227TriangleData1373.coefficient106_157,
  OriginalRow227TriangleData1373.coefficient106_158,
  OriginalRow227TriangleData1373.coefficient106_159,
  OriginalRow227TriangleData1373.coefficient106_160,
  OriginalRow227TriangleData1373.coefficient106_161,
  OriginalRow227TriangleData1373.coefficient106_162,
  OriginalRow227TriangleData1373.coefficient106_163,
  OriginalRow227TriangleData1373.coefficient106_164,
  OriginalRow227TriangleData1373.coefficient106_165,
  OriginalRow227TriangleData1373.coefficient106_166,
  OriginalRow227TriangleData1373.coefficient106_167,
  OriginalRow227TriangleData1373.coefficient106_168
]

theorem values1373_size : values1373.size = 32 := rfl

def block1373 : ℕ → Option IntervalDyadic := segment 137 values1373

theorem block1373_domain : ExactDomain block1373 137 169 := by
  simpa only [values1373_size] using segment_domain 137 values1373

theorem block1373_get (i : Fin 32) :
    block1373 (137 + i.val) = some (values1373[i.val]'(by rw [values1373_size]; exact i.isLt)) := by
  exact segment_get 137 values1373 ⟨i.val, by rw [values1373_size]; exact i.isLt⟩

def values1374 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1374.coefficient106_169,
  OriginalRow227TriangleData1374.coefficient106_170,
  OriginalRow227TriangleData1374.coefficient106_171,
  OriginalRow227TriangleData1374.coefficient106_172,
  OriginalRow227TriangleData1374.coefficient106_173,
  OriginalRow227TriangleData1374.coefficient106_174,
  OriginalRow227TriangleData1374.coefficient106_175,
  OriginalRow227TriangleData1374.coefficient106_176,
  OriginalRow227TriangleData1374.coefficient106_177,
  OriginalRow227TriangleData1374.coefficient106_178,
  OriginalRow227TriangleData1374.coefficient106_179,
  OriginalRow227TriangleData1374.coefficient106_180,
  OriginalRow227TriangleData1374.coefficient106_181,
  OriginalRow227TriangleData1374.coefficient106_182,
  OriginalRow227TriangleData1374.coefficient106_183,
  OriginalRow227TriangleData1374.coefficient106_184,
  OriginalRow227TriangleData1374.coefficient106_185,
  OriginalRow227TriangleData1374.coefficient106_186,
  OriginalRow227TriangleData1374.coefficient106_187,
  OriginalRow227TriangleData1374.coefficient106_188,
  OriginalRow227TriangleData1374.coefficient106_189,
  OriginalRow227TriangleData1374.coefficient106_190,
  OriginalRow227TriangleData1374.coefficient106_191,
  OriginalRow227TriangleData1374.coefficient106_192,
  OriginalRow227TriangleData1374.coefficient106_193,
  OriginalRow227TriangleData1374.coefficient106_194,
  OriginalRow227TriangleData1374.coefficient106_195,
  OriginalRow227TriangleData1374.coefficient106_196,
  OriginalRow227TriangleData1374.coefficient106_197,
  OriginalRow227TriangleData1374.coefficient106_198,
  OriginalRow227TriangleData1374.coefficient106_199,
  OriginalRow227TriangleData1374.coefficient106_200
]

theorem values1374_size : values1374.size = 32 := rfl

def block1374 : ℕ → Option IntervalDyadic := segment 169 values1374

theorem block1374_domain : ExactDomain block1374 169 201 := by
  simpa only [values1374_size] using segment_domain 169 values1374

theorem block1374_get (i : Fin 32) :
    block1374 (169 + i.val) = some (values1374[i.val]'(by rw [values1374_size]; exact i.isLt)) := by
  exact segment_get 169 values1374 ⟨i.val, by rw [values1374_size]; exact i.isLt⟩

def values1375 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1375.coefficient106_201,
  OriginalRow227TriangleData1375.coefficient106_202,
  OriginalRow227TriangleData1375.coefficient106_203,
  OriginalRow227TriangleData1375.coefficient106_204,
  OriginalRow227TriangleData1375.coefficient106_205,
  OriginalRow227TriangleData1375.coefficient106_206,
  OriginalRow227TriangleData1375.coefficient106_207,
  OriginalRow227TriangleData1375.coefficient106_208,
  OriginalRow227TriangleData1375.coefficient106_209,
  OriginalRow227TriangleData1375.coefficient106_210,
  OriginalRow227TriangleData1375.coefficient106_211,
  OriginalRow227TriangleData1375.coefficient106_212,
  OriginalRow227TriangleData1375.coefficient106_213,
  OriginalRow227TriangleData1375.coefficient106_214,
  OriginalRow227TriangleData1375.coefficient106_215,
  OriginalRow227TriangleData1375.coefficient106_216,
  OriginalRow227TriangleData1375.coefficient106_217,
  OriginalRow227TriangleData1375.coefficient106_218,
  OriginalRow227TriangleData1375.coefficient106_219,
  OriginalRow227TriangleData1375.coefficient106_220,
  OriginalRow227TriangleData1375.coefficient106_221,
  OriginalRow227TriangleData1375.coefficient106_222,
  OriginalRow227TriangleData1375.coefficient106_223,
  OriginalRow227TriangleData1375.coefficient106_224,
  OriginalRow227TriangleData1375.coefficient106_225,
  OriginalRow227TriangleData1375.coefficient106_226,
  OriginalRow227TriangleData1375.coefficient106_227,
  OriginalRow227TriangleData1375.coefficient106_228,
  OriginalRow227TriangleData1375.coefficient106_229,
  OriginalRow227TriangleData1375.coefficient106_230,
  OriginalRow227TriangleData1375.coefficient106_231,
  OriginalRow227TriangleData1375.coefficient106_232
]

theorem values1375_size : values1375.size = 32 := rfl

def block1375 : ℕ → Option IntervalDyadic := segment 201 values1375

theorem block1375_domain : ExactDomain block1375 201 233 := by
  simpa only [values1375_size] using segment_domain 201 values1375

theorem block1375_get (i : Fin 32) :
    block1375 (201 + i.val) = some (values1375[i.val]'(by rw [values1375_size]; exact i.isLt)) := by
  exact segment_get 201 values1375 ⟨i.val, by rw [values1375_size]; exact i.isLt⟩

def values1376 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1376.coefficient106_233,
  OriginalRow227TriangleData1376.coefficient106_234,
  OriginalRow227TriangleData1376.coefficient106_235,
  OriginalRow227TriangleData1376.coefficient106_236,
  OriginalRow227TriangleData1376.coefficient106_237,
  OriginalRow227TriangleData1376.coefficient106_238,
  OriginalRow227TriangleData1376.coefficient106_239,
  OriginalRow227TriangleData1376.coefficient106_240,
  OriginalRow227TriangleData1376.coefficient106_241,
  OriginalRow227TriangleData1376.coefficient106_242,
  OriginalRow227TriangleData1376.coefficient106_243,
  OriginalRow227TriangleData1376.coefficient106_244,
  OriginalRow227TriangleData1376.coefficient106_245,
  OriginalRow227TriangleData1376.coefficient106_246,
  OriginalRow227TriangleData1376.coefficient106_247,
  OriginalRow227TriangleData1376.coefficient106_248,
  OriginalRow227TriangleData1376.coefficient106_249,
  OriginalRow227TriangleData1376.coefficient106_250,
  OriginalRow227TriangleData1376.coefficient106_251,
  OriginalRow227TriangleData1376.coefficient106_252,
  OriginalRow227TriangleData1376.coefficient106_253,
  OriginalRow227TriangleData1376.coefficient106_254,
  OriginalRow227TriangleData1376.coefficient106_255,
  OriginalRow227TriangleData1376.coefficient106_256,
  OriginalRow227TriangleData1376.coefficient106_257,
  OriginalRow227TriangleData1376.coefficient106_258,
  OriginalRow227TriangleData1376.coefficient106_259,
  OriginalRow227TriangleData1376.coefficient106_260,
  OriginalRow227TriangleData1376.coefficient106_261,
  OriginalRow227TriangleData1376.coefficient106_262,
  OriginalRow227TriangleData1376.coefficient106_263,
  OriginalRow227TriangleData1376.coefficient106_264
]

theorem values1376_size : values1376.size = 32 := rfl

def block1376 : ℕ → Option IntervalDyadic := segment 233 values1376

theorem block1376_domain : ExactDomain block1376 233 265 := by
  simpa only [values1376_size] using segment_domain 233 values1376

theorem block1376_get (i : Fin 32) :
    block1376 (233 + i.val) = some (values1376[i.val]'(by rw [values1376_size]; exact i.isLt)) := by
  exact segment_get 233 values1376 ⟨i.val, by rw [values1376_size]; exact i.isLt⟩

def values1377 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1377.coefficient106_265,
  OriginalRow227TriangleData1377.coefficient106_266,
  OriginalRow227TriangleData1377.coefficient106_267,
  OriginalRow227TriangleData1377.coefficient106_268,
  OriginalRow227TriangleData1377.coefficient106_269,
  OriginalRow227TriangleData1377.coefficient106_270,
  OriginalRow227TriangleData1377.coefficient106_271,
  OriginalRow227TriangleData1377.coefficient106_272,
  OriginalRow227TriangleData1377.coefficient106_273,
  OriginalRow227TriangleData1377.coefficient106_274,
  OriginalRow227TriangleData1377.coefficient106_275,
  OriginalRow227TriangleData1377.coefficient106_276,
  OriginalRow227TriangleData1377.coefficient106_277,
  OriginalRow227TriangleData1377.coefficient106_278,
  OriginalRow227TriangleData1377.coefficient106_279,
  OriginalRow227TriangleData1377.coefficient106_280,
  OriginalRow227TriangleData1377.coefficient106_281,
  OriginalRow227TriangleData1377.coefficient106_282,
  OriginalRow227TriangleData1377.coefficient106_283,
  OriginalRow227TriangleData1377.coefficient106_284,
  OriginalRow227TriangleData1377.coefficient106_285,
  OriginalRow227TriangleData1377.coefficient106_286,
  OriginalRow227TriangleData1377.coefficient106_287,
  OriginalRow227TriangleData1377.coefficient106_288,
  OriginalRow227TriangleData1377.coefficient106_289,
  OriginalRow227TriangleData1377.coefficient106_290,
  OriginalRow227TriangleData1377.coefficient106_291,
  OriginalRow227TriangleData1377.coefficient106_292,
  OriginalRow227TriangleData1377.coefficient106_293,
  OriginalRow227TriangleData1377.coefficient106_294,
  OriginalRow227TriangleData1377.coefficient106_295,
  OriginalRow227TriangleData1377.coefficient106_296
]

theorem values1377_size : values1377.size = 32 := rfl

def block1377 : ℕ → Option IntervalDyadic := segment 265 values1377

theorem block1377_domain : ExactDomain block1377 265 297 := by
  simpa only [values1377_size] using segment_domain 265 values1377

theorem block1377_get (i : Fin 32) :
    block1377 (265 + i.val) = some (values1377[i.val]'(by rw [values1377_size]; exact i.isLt)) := by
  exact segment_get 265 values1377 ⟨i.val, by rw [values1377_size]; exact i.isLt⟩

def values1378 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1378.coefficient106_297,
  OriginalRow227TriangleData1378.coefficient106_298,
  OriginalRow227TriangleData1378.coefficient106_299,
  OriginalRow227TriangleData1378.coefficient106_300,
  OriginalRow227TriangleData1378.coefficient106_301,
  OriginalRow227TriangleData1378.coefficient106_302,
  OriginalRow227TriangleData1378.coefficient106_303,
  OriginalRow227TriangleData1378.coefficient106_304,
  OriginalRow227TriangleData1378.coefficient106_305,
  OriginalRow227TriangleData1378.coefficient106_306,
  OriginalRow227TriangleData1378.coefficient106_307,
  OriginalRow227TriangleData1378.coefficient106_308,
  OriginalRow227TriangleData1378.coefficient106_309,
  OriginalRow227TriangleData1378.coefficient106_310,
  OriginalRow227TriangleData1378.coefficient106_311,
  OriginalRow227TriangleData1378.coefficient106_312,
  OriginalRow227TriangleData1378.coefficient106_313,
  OriginalRow227TriangleData1378.coefficient106_314,
  OriginalRow227TriangleData1378.coefficient106_315,
  OriginalRow227TriangleData1378.coefficient106_316,
  OriginalRow227TriangleData1378.coefficient106_317,
  OriginalRow227TriangleData1378.coefficient106_318,
  OriginalRow227TriangleData1378.coefficient106_319,
  OriginalRow227TriangleData1378.coefficient106_320,
  OriginalRow227TriangleData1378.coefficient106_321,
  OriginalRow227TriangleData1378.coefficient106_322,
  OriginalRow227TriangleData1378.coefficient106_323,
  OriginalRow227TriangleData1378.coefficient106_324,
  OriginalRow227TriangleData1378.coefficient106_325,
  OriginalRow227TriangleData1378.coefficient106_326,
  OriginalRow227TriangleData1378.coefficient106_327,
  OriginalRow227TriangleData1378.coefficient106_328
]

theorem values1378_size : values1378.size = 32 := rfl

def block1378 : ℕ → Option IntervalDyadic := segment 297 values1378

theorem block1378_domain : ExactDomain block1378 297 329 := by
  simpa only [values1378_size] using segment_domain 297 values1378

theorem block1378_get (i : Fin 32) :
    block1378 (297 + i.val) = some (values1378[i.val]'(by rw [values1378_size]; exact i.isLt)) := by
  exact segment_get 297 values1378 ⟨i.val, by rw [values1378_size]; exact i.isLt⟩

def values1379 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1379.coefficient106_329,
  OriginalRow227TriangleData1379.coefficient106_330,
  OriginalRow227TriangleData1379.coefficient106_331,
  OriginalRow227TriangleData1379.coefficient106_332,
  OriginalRow227TriangleData1379.coefficient106_333,
  OriginalRow227TriangleData1379.coefficient106_334,
  OriginalRow227TriangleData1379.coefficient106_335,
  OriginalRow227TriangleData1379.coefficient106_336,
  OriginalRow227TriangleData1379.coefficient106_337,
  OriginalRow227TriangleData1379.coefficient106_338,
  OriginalRow227TriangleData1379.coefficient106_339,
  OriginalRow227TriangleData1379.coefficient106_340,
  OriginalRow227TriangleData1379.coefficient106_341,
  OriginalRow227TriangleData1379.coefficient106_342,
  OriginalRow227TriangleData1379.coefficient106_343,
  OriginalRow227TriangleData1379.coefficient106_344,
  OriginalRow227TriangleData1379.coefficient106_345,
  OriginalRow227TriangleData1379.coefficient106_346,
  OriginalRow227TriangleData1379.coefficient106_347,
  OriginalRow227TriangleData1379.coefficient106_348,
  OriginalRow227TriangleData1379.coefficient106_349,
  OriginalRow227TriangleData1379.coefficient106_350,
  OriginalRow227TriangleData1379.coefficient106_351,
  OriginalRow227TriangleData1379.coefficient106_352,
  OriginalRow227TriangleData1379.coefficient106_353,
  OriginalRow227TriangleData1379.coefficient106_354,
  OriginalRow227TriangleData1379.coefficient106_355,
  OriginalRow227TriangleData1379.coefficient106_356,
  OriginalRow227TriangleData1379.coefficient106_357,
  OriginalRow227TriangleData1379.coefficient106_358,
  OriginalRow227TriangleData1379.coefficient106_359,
  OriginalRow227TriangleData1379.coefficient106_360
]

theorem values1379_size : values1379.size = 32 := rfl

def block1379 : ℕ → Option IntervalDyadic := segment 329 values1379

theorem block1379_domain : ExactDomain block1379 329 361 := by
  simpa only [values1379_size] using segment_domain 329 values1379

theorem block1379_get (i : Fin 32) :
    block1379 (329 + i.val) = some (values1379[i.val]'(by rw [values1379_size]; exact i.isLt)) := by
  exact segment_get 329 values1379 ⟨i.val, by rw [values1379_size]; exact i.isLt⟩

def values1380 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1380.coefficient106_361,
  OriginalRow227TriangleData1380.coefficient106_362,
  OriginalRow227TriangleData1380.coefficient106_363,
  OriginalRow227TriangleData1380.coefficient106_364,
  OriginalRow227TriangleData1380.coefficient106_365,
  OriginalRow227TriangleData1380.coefficient106_366,
  OriginalRow227TriangleData1380.coefficient106_367,
  OriginalRow227TriangleData1380.coefficient106_368,
  OriginalRow227TriangleData1380.coefficient106_369,
  OriginalRow227TriangleData1380.coefficient106_370,
  OriginalRow227TriangleData1380.coefficient106_371,
  OriginalRow227TriangleData1380.coefficient106_372,
  OriginalRow227TriangleData1380.coefficient106_373,
  OriginalRow227TriangleData1380.coefficient106_374,
  OriginalRow227TriangleData1380.coefficient106_375,
  OriginalRow227TriangleData1380.coefficient106_376,
  OriginalRow227TriangleData1380.coefficient106_377,
  OriginalRow227TriangleData1380.coefficient106_378,
  OriginalRow227TriangleData1380.coefficient106_379,
  OriginalRow227TriangleData1380.coefficient106_380,
  OriginalRow227TriangleData1380.coefficient106_381,
  OriginalRow227TriangleData1380.coefficient106_382,
  OriginalRow227TriangleData1380.coefficient106_383,
  OriginalRow227TriangleData1380.coefficient106_384,
  OriginalRow227TriangleData1380.coefficient106_385,
  OriginalRow227TriangleData1380.coefficient106_386,
  OriginalRow227TriangleData1380.coefficient106_387,
  OriginalRow227TriangleData1380.coefficient106_388,
  OriginalRow227TriangleData1380.coefficient106_389,
  OriginalRow227TriangleData1380.coefficient106_390,
  OriginalRow227TriangleData1380.coefficient106_391,
  OriginalRow227TriangleData1380.coefficient106_392
]

theorem values1380_size : values1380.size = 32 := rfl

def block1380 : ℕ → Option IntervalDyadic := segment 361 values1380

theorem block1380_domain : ExactDomain block1380 361 393 := by
  simpa only [values1380_size] using segment_domain 361 values1380

theorem block1380_get (i : Fin 32) :
    block1380 (361 + i.val) = some (values1380[i.val]'(by rw [values1380_size]; exact i.isLt)) := by
  exact segment_get 361 values1380 ⟨i.val, by rw [values1380_size]; exact i.isLt⟩

def values1381 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1381.coefficient106_393,
  OriginalRow227TriangleData1381.coefficient106_394,
  OriginalRow227TriangleData1381.coefficient106_395
]

theorem values1381_size : values1381.size = 3 := rfl

def block1381 : ℕ → Option IntervalDyadic := segment 393 values1381

theorem block1381_domain : ExactDomain block1381 393 396 := by
  simpa only [values1381_size] using segment_domain 393 values1381

theorem block1381_get (i : Fin 3) :
    block1381 (393 + i.val) = some (values1381[i.val]'(by rw [values1381_size]; exact i.isLt)) := by
  exact segment_get 393 values1381 ⟨i.val, by rw [values1381_size]; exact i.isLt⟩

def node0105_0169 : ℕ → Option IntervalDyadic := split 137 block1372 block1373

theorem node0105_0169_domain : ExactDomain node0105_0169 105 169 := by
  exact split_domain (by decide) (by decide) block1372_domain block1373_domain

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block1375 block1376

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block1375_domain block1376_domain

def node0169_0265 : ℕ → Option IntervalDyadic := split 201 block1374 node0201_0265

theorem node0169_0265_domain : ExactDomain node0169_0265 169 265 := by
  exact split_domain (by decide) (by decide) block1374_domain node0201_0265_domain

def node0105_0265 : ℕ → Option IntervalDyadic := split 169 node0105_0169 node0169_0265

theorem node0105_0265_domain : ExactDomain node0105_0265 105 265 := by
  exact split_domain (by decide) (by decide) node0105_0169_domain node0169_0265_domain

def node0265_0329 : ℕ → Option IntervalDyadic := split 297 block1377 block1378

theorem node0265_0329_domain : ExactDomain node0265_0329 265 329 := by
  exact split_domain (by decide) (by decide) block1377_domain block1378_domain

def node0361_0396 : ℕ → Option IntervalDyadic := split 393 block1380 block1381

theorem node0361_0396_domain : ExactDomain node0361_0396 361 396 := by
  exact split_domain (by decide) (by decide) block1380_domain block1381_domain

def node0329_0396 : ℕ → Option IntervalDyadic := split 361 block1379 node0361_0396

theorem node0329_0396_domain : ExactDomain node0329_0396 329 396 := by
  exact split_domain (by decide) (by decide) block1379_domain node0361_0396_domain

def node0265_0396 : ℕ → Option IntervalDyadic := split 329 node0265_0329 node0329_0396

theorem node0265_0396_domain : ExactDomain node0265_0396 265 396 := by
  exact split_domain (by decide) (by decide) node0265_0329_domain node0329_0396_domain

def node0105_0396 : ℕ → Option IntervalDyadic := split 265 node0105_0265 node0265_0396

theorem node0105_0396_domain : ExactDomain node0105_0396 105 396 := by
  exact split_domain (by decide) (by decide) node0105_0265_domain node0265_0396_domain

def lookup : ℕ → Option IntervalDyadic := node0105_0396

theorem lookup_domain : ExactDomain lookup 105 396 :=
  node0105_0396_domain

theorem block1372_lookup (i : Fin 32) :
    lookup (105 + i.val) = some (values1372[i.val]'(by rw [values1372_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (105 + i.val) = _
  rw [node0105_0396, split_left 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0105_0265, split_left 169 node0105_0169 node0169_0265 (by omega)]
  rw [node0105_0169, split_left 137 block1372 block1373 (by omega)]
  exact block1372_get i

theorem block1373_lookup (i : Fin 32) :
    lookup (137 + i.val) = some (values1373[i.val]'(by rw [values1373_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (137 + i.val) = _
  rw [node0105_0396, split_left 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0105_0265, split_left 169 node0105_0169 node0169_0265 (by omega)]
  rw [node0105_0169, split_right 137 block1372 block1373 (by omega)]
  exact block1373_get i

theorem block1374_lookup (i : Fin 32) :
    lookup (169 + i.val) = some (values1374[i.val]'(by rw [values1374_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (169 + i.val) = _
  rw [node0105_0396, split_left 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0105_0265, split_right 169 node0105_0169 node0169_0265 (by omega)]
  rw [node0169_0265, split_left 201 block1374 node0201_0265 (by omega)]
  exact block1374_get i

theorem block1375_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values1375[i.val]'(by rw [values1375_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (201 + i.val) = _
  rw [node0105_0396, split_left 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0105_0265, split_right 169 node0105_0169 node0169_0265 (by omega)]
  rw [node0169_0265, split_right 201 block1374 node0201_0265 (by omega)]
  rw [node0201_0265, split_left 233 block1375 block1376 (by omega)]
  exact block1375_get i

theorem block1376_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values1376[i.val]'(by rw [values1376_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (233 + i.val) = _
  rw [node0105_0396, split_left 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0105_0265, split_right 169 node0105_0169 node0169_0265 (by omega)]
  rw [node0169_0265, split_right 201 block1374 node0201_0265 (by omega)]
  rw [node0201_0265, split_right 233 block1375 block1376 (by omega)]
  exact block1376_get i

theorem block1377_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values1377[i.val]'(by rw [values1377_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (265 + i.val) = _
  rw [node0105_0396, split_right 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0265_0396, split_left 329 node0265_0329 node0329_0396 (by omega)]
  rw [node0265_0329, split_left 297 block1377 block1378 (by omega)]
  exact block1377_get i

theorem block1378_lookup (i : Fin 32) :
    lookup (297 + i.val) = some (values1378[i.val]'(by rw [values1378_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (297 + i.val) = _
  rw [node0105_0396, split_right 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0265_0396, split_left 329 node0265_0329 node0329_0396 (by omega)]
  rw [node0265_0329, split_right 297 block1377 block1378 (by omega)]
  exact block1378_get i

theorem block1379_lookup (i : Fin 32) :
    lookup (329 + i.val) = some (values1379[i.val]'(by rw [values1379_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (329 + i.val) = _
  rw [node0105_0396, split_right 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0265_0396, split_right 329 node0265_0329 node0329_0396 (by omega)]
  rw [node0329_0396, split_left 361 block1379 node0361_0396 (by omega)]
  exact block1379_get i

theorem block1380_lookup (i : Fin 32) :
    lookup (361 + i.val) = some (values1380[i.val]'(by rw [values1380_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (361 + i.val) = _
  rw [node0105_0396, split_right 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0265_0396, split_right 329 node0265_0329 node0329_0396 (by omega)]
  rw [node0329_0396, split_right 361 block1379 node0361_0396 (by omega)]
  rw [node0361_0396, split_left 393 block1380 block1381 (by omega)]
  exact block1380_get i

theorem block1381_lookup (i : Fin 3) :
    lookup (393 + i.val) = some (values1381[i.val]'(by rw [values1381_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0105_0396 (393 + i.val) = _
  rw [node0105_0396, split_right 265 node0105_0265 node0265_0396 (by omega)]
  rw [node0265_0396, split_right 329 node0265_0329 node0329_0396 (by omega)]
  rw [node0329_0396, split_right 361 block1379 node0361_0396 (by omega)]
  rw [node0361_0396, split_right 393 block1380 block1381 (by omega)]
  exact block1381_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1372_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1372_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1373_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1373_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1374_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1374_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1375_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1375_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1376_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1376_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1377_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1377_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1378_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1378_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1379_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1379_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1380_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1380_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1381_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1381_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1372_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1373_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1374_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1375_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1376_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1377_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1378_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1379_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1380_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow106.block1381_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow106
