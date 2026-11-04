import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1332
import Grothe.UpperChaos.OriginalRow227TriangleData1333
import Grothe.UpperChaos.OriginalRow227TriangleData1334
import Grothe.UpperChaos.OriginalRow227TriangleData1335
import Grothe.UpperChaos.OriginalRow227TriangleData1336
import Grothe.UpperChaos.OriginalRow227TriangleData1337
import Grothe.UpperChaos.OriginalRow227TriangleData1338
import Grothe.UpperChaos.OriginalRow227TriangleData1339
import Grothe.UpperChaos.OriginalRow227TriangleData1340
import Grothe.UpperChaos.OriginalRow227TriangleData1341

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow102

open ConditionalTableLookup

def values1332 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1332.coefficient102_101,
  OriginalRow227TriangleData1332.coefficient102_102,
  OriginalRow227TriangleData1332.coefficient102_103,
  OriginalRow227TriangleData1332.coefficient102_104,
  OriginalRow227TriangleData1332.coefficient102_105,
  OriginalRow227TriangleData1332.coefficient102_106,
  OriginalRow227TriangleData1332.coefficient102_107,
  OriginalRow227TriangleData1332.coefficient102_108,
  OriginalRow227TriangleData1332.coefficient102_109,
  OriginalRow227TriangleData1332.coefficient102_110,
  OriginalRow227TriangleData1332.coefficient102_111,
  OriginalRow227TriangleData1332.coefficient102_112,
  OriginalRow227TriangleData1332.coefficient102_113,
  OriginalRow227TriangleData1332.coefficient102_114,
  OriginalRow227TriangleData1332.coefficient102_115,
  OriginalRow227TriangleData1332.coefficient102_116,
  OriginalRow227TriangleData1332.coefficient102_117,
  OriginalRow227TriangleData1332.coefficient102_118,
  OriginalRow227TriangleData1332.coefficient102_119,
  OriginalRow227TriangleData1332.coefficient102_120,
  OriginalRow227TriangleData1332.coefficient102_121,
  OriginalRow227TriangleData1332.coefficient102_122,
  OriginalRow227TriangleData1332.coefficient102_123,
  OriginalRow227TriangleData1332.coefficient102_124,
  OriginalRow227TriangleData1332.coefficient102_125,
  OriginalRow227TriangleData1332.coefficient102_126,
  OriginalRow227TriangleData1332.coefficient102_127,
  OriginalRow227TriangleData1332.coefficient102_128,
  OriginalRow227TriangleData1332.coefficient102_129,
  OriginalRow227TriangleData1332.coefficient102_130,
  OriginalRow227TriangleData1332.coefficient102_131,
  OriginalRow227TriangleData1332.coefficient102_132
]

theorem values1332_size : values1332.size = 32 := rfl

def block1332 : ℕ → Option IntervalDyadic := segment 101 values1332

theorem block1332_domain : ExactDomain block1332 101 133 := by
  simpa only [values1332_size] using segment_domain 101 values1332

theorem block1332_get (i : Fin 32) :
    block1332 (101 + i.val) = some (values1332[i.val]'(by rw [values1332_size]; exact i.isLt)) := by
  exact segment_get 101 values1332 ⟨i.val, by rw [values1332_size]; exact i.isLt⟩

def values1333 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1333.coefficient102_133,
  OriginalRow227TriangleData1333.coefficient102_134,
  OriginalRow227TriangleData1333.coefficient102_135,
  OriginalRow227TriangleData1333.coefficient102_136,
  OriginalRow227TriangleData1333.coefficient102_137,
  OriginalRow227TriangleData1333.coefficient102_138,
  OriginalRow227TriangleData1333.coefficient102_139,
  OriginalRow227TriangleData1333.coefficient102_140,
  OriginalRow227TriangleData1333.coefficient102_141,
  OriginalRow227TriangleData1333.coefficient102_142,
  OriginalRow227TriangleData1333.coefficient102_143,
  OriginalRow227TriangleData1333.coefficient102_144,
  OriginalRow227TriangleData1333.coefficient102_145,
  OriginalRow227TriangleData1333.coefficient102_146,
  OriginalRow227TriangleData1333.coefficient102_147,
  OriginalRow227TriangleData1333.coefficient102_148,
  OriginalRow227TriangleData1333.coefficient102_149,
  OriginalRow227TriangleData1333.coefficient102_150,
  OriginalRow227TriangleData1333.coefficient102_151,
  OriginalRow227TriangleData1333.coefficient102_152,
  OriginalRow227TriangleData1333.coefficient102_153,
  OriginalRow227TriangleData1333.coefficient102_154,
  OriginalRow227TriangleData1333.coefficient102_155,
  OriginalRow227TriangleData1333.coefficient102_156,
  OriginalRow227TriangleData1333.coefficient102_157,
  OriginalRow227TriangleData1333.coefficient102_158,
  OriginalRow227TriangleData1333.coefficient102_159,
  OriginalRow227TriangleData1333.coefficient102_160,
  OriginalRow227TriangleData1333.coefficient102_161,
  OriginalRow227TriangleData1333.coefficient102_162,
  OriginalRow227TriangleData1333.coefficient102_163,
  OriginalRow227TriangleData1333.coefficient102_164
]

theorem values1333_size : values1333.size = 32 := rfl

def block1333 : ℕ → Option IntervalDyadic := segment 133 values1333

theorem block1333_domain : ExactDomain block1333 133 165 := by
  simpa only [values1333_size] using segment_domain 133 values1333

theorem block1333_get (i : Fin 32) :
    block1333 (133 + i.val) = some (values1333[i.val]'(by rw [values1333_size]; exact i.isLt)) := by
  exact segment_get 133 values1333 ⟨i.val, by rw [values1333_size]; exact i.isLt⟩

def values1334 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1334.coefficient102_165,
  OriginalRow227TriangleData1334.coefficient102_166,
  OriginalRow227TriangleData1334.coefficient102_167,
  OriginalRow227TriangleData1334.coefficient102_168,
  OriginalRow227TriangleData1334.coefficient102_169,
  OriginalRow227TriangleData1334.coefficient102_170,
  OriginalRow227TriangleData1334.coefficient102_171,
  OriginalRow227TriangleData1334.coefficient102_172,
  OriginalRow227TriangleData1334.coefficient102_173,
  OriginalRow227TriangleData1334.coefficient102_174,
  OriginalRow227TriangleData1334.coefficient102_175,
  OriginalRow227TriangleData1334.coefficient102_176,
  OriginalRow227TriangleData1334.coefficient102_177,
  OriginalRow227TriangleData1334.coefficient102_178,
  OriginalRow227TriangleData1334.coefficient102_179,
  OriginalRow227TriangleData1334.coefficient102_180,
  OriginalRow227TriangleData1334.coefficient102_181,
  OriginalRow227TriangleData1334.coefficient102_182,
  OriginalRow227TriangleData1334.coefficient102_183,
  OriginalRow227TriangleData1334.coefficient102_184,
  OriginalRow227TriangleData1334.coefficient102_185,
  OriginalRow227TriangleData1334.coefficient102_186,
  OriginalRow227TriangleData1334.coefficient102_187,
  OriginalRow227TriangleData1334.coefficient102_188,
  OriginalRow227TriangleData1334.coefficient102_189,
  OriginalRow227TriangleData1334.coefficient102_190,
  OriginalRow227TriangleData1334.coefficient102_191,
  OriginalRow227TriangleData1334.coefficient102_192,
  OriginalRow227TriangleData1334.coefficient102_193,
  OriginalRow227TriangleData1334.coefficient102_194,
  OriginalRow227TriangleData1334.coefficient102_195,
  OriginalRow227TriangleData1334.coefficient102_196
]

theorem values1334_size : values1334.size = 32 := rfl

def block1334 : ℕ → Option IntervalDyadic := segment 165 values1334

theorem block1334_domain : ExactDomain block1334 165 197 := by
  simpa only [values1334_size] using segment_domain 165 values1334

theorem block1334_get (i : Fin 32) :
    block1334 (165 + i.val) = some (values1334[i.val]'(by rw [values1334_size]; exact i.isLt)) := by
  exact segment_get 165 values1334 ⟨i.val, by rw [values1334_size]; exact i.isLt⟩

def values1335 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1335.coefficient102_197,
  OriginalRow227TriangleData1335.coefficient102_198,
  OriginalRow227TriangleData1335.coefficient102_199,
  OriginalRow227TriangleData1335.coefficient102_200,
  OriginalRow227TriangleData1335.coefficient102_201,
  OriginalRow227TriangleData1335.coefficient102_202,
  OriginalRow227TriangleData1335.coefficient102_203,
  OriginalRow227TriangleData1335.coefficient102_204,
  OriginalRow227TriangleData1335.coefficient102_205,
  OriginalRow227TriangleData1335.coefficient102_206,
  OriginalRow227TriangleData1335.coefficient102_207,
  OriginalRow227TriangleData1335.coefficient102_208,
  OriginalRow227TriangleData1335.coefficient102_209,
  OriginalRow227TriangleData1335.coefficient102_210,
  OriginalRow227TriangleData1335.coefficient102_211,
  OriginalRow227TriangleData1335.coefficient102_212,
  OriginalRow227TriangleData1335.coefficient102_213,
  OriginalRow227TriangleData1335.coefficient102_214,
  OriginalRow227TriangleData1335.coefficient102_215,
  OriginalRow227TriangleData1335.coefficient102_216,
  OriginalRow227TriangleData1335.coefficient102_217,
  OriginalRow227TriangleData1335.coefficient102_218,
  OriginalRow227TriangleData1335.coefficient102_219,
  OriginalRow227TriangleData1335.coefficient102_220,
  OriginalRow227TriangleData1335.coefficient102_221,
  OriginalRow227TriangleData1335.coefficient102_222,
  OriginalRow227TriangleData1335.coefficient102_223,
  OriginalRow227TriangleData1335.coefficient102_224,
  OriginalRow227TriangleData1335.coefficient102_225,
  OriginalRow227TriangleData1335.coefficient102_226,
  OriginalRow227TriangleData1335.coefficient102_227,
  OriginalRow227TriangleData1335.coefficient102_228
]

theorem values1335_size : values1335.size = 32 := rfl

def block1335 : ℕ → Option IntervalDyadic := segment 197 values1335

theorem block1335_domain : ExactDomain block1335 197 229 := by
  simpa only [values1335_size] using segment_domain 197 values1335

theorem block1335_get (i : Fin 32) :
    block1335 (197 + i.val) = some (values1335[i.val]'(by rw [values1335_size]; exact i.isLt)) := by
  exact segment_get 197 values1335 ⟨i.val, by rw [values1335_size]; exact i.isLt⟩

def values1336 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1336.coefficient102_229,
  OriginalRow227TriangleData1336.coefficient102_230,
  OriginalRow227TriangleData1336.coefficient102_231,
  OriginalRow227TriangleData1336.coefficient102_232,
  OriginalRow227TriangleData1336.coefficient102_233,
  OriginalRow227TriangleData1336.coefficient102_234,
  OriginalRow227TriangleData1336.coefficient102_235,
  OriginalRow227TriangleData1336.coefficient102_236,
  OriginalRow227TriangleData1336.coefficient102_237,
  OriginalRow227TriangleData1336.coefficient102_238,
  OriginalRow227TriangleData1336.coefficient102_239,
  OriginalRow227TriangleData1336.coefficient102_240,
  OriginalRow227TriangleData1336.coefficient102_241,
  OriginalRow227TriangleData1336.coefficient102_242,
  OriginalRow227TriangleData1336.coefficient102_243,
  OriginalRow227TriangleData1336.coefficient102_244,
  OriginalRow227TriangleData1336.coefficient102_245,
  OriginalRow227TriangleData1336.coefficient102_246,
  OriginalRow227TriangleData1336.coefficient102_247,
  OriginalRow227TriangleData1336.coefficient102_248,
  OriginalRow227TriangleData1336.coefficient102_249,
  OriginalRow227TriangleData1336.coefficient102_250,
  OriginalRow227TriangleData1336.coefficient102_251,
  OriginalRow227TriangleData1336.coefficient102_252,
  OriginalRow227TriangleData1336.coefficient102_253,
  OriginalRow227TriangleData1336.coefficient102_254,
  OriginalRow227TriangleData1336.coefficient102_255,
  OriginalRow227TriangleData1336.coefficient102_256,
  OriginalRow227TriangleData1336.coefficient102_257,
  OriginalRow227TriangleData1336.coefficient102_258,
  OriginalRow227TriangleData1336.coefficient102_259,
  OriginalRow227TriangleData1336.coefficient102_260
]

theorem values1336_size : values1336.size = 32 := rfl

def block1336 : ℕ → Option IntervalDyadic := segment 229 values1336

theorem block1336_domain : ExactDomain block1336 229 261 := by
  simpa only [values1336_size] using segment_domain 229 values1336

theorem block1336_get (i : Fin 32) :
    block1336 (229 + i.val) = some (values1336[i.val]'(by rw [values1336_size]; exact i.isLt)) := by
  exact segment_get 229 values1336 ⟨i.val, by rw [values1336_size]; exact i.isLt⟩

def values1337 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1337.coefficient102_261,
  OriginalRow227TriangleData1337.coefficient102_262,
  OriginalRow227TriangleData1337.coefficient102_263,
  OriginalRow227TriangleData1337.coefficient102_264,
  OriginalRow227TriangleData1337.coefficient102_265,
  OriginalRow227TriangleData1337.coefficient102_266,
  OriginalRow227TriangleData1337.coefficient102_267,
  OriginalRow227TriangleData1337.coefficient102_268,
  OriginalRow227TriangleData1337.coefficient102_269,
  OriginalRow227TriangleData1337.coefficient102_270,
  OriginalRow227TriangleData1337.coefficient102_271,
  OriginalRow227TriangleData1337.coefficient102_272,
  OriginalRow227TriangleData1337.coefficient102_273,
  OriginalRow227TriangleData1337.coefficient102_274,
  OriginalRow227TriangleData1337.coefficient102_275,
  OriginalRow227TriangleData1337.coefficient102_276,
  OriginalRow227TriangleData1337.coefficient102_277,
  OriginalRow227TriangleData1337.coefficient102_278,
  OriginalRow227TriangleData1337.coefficient102_279,
  OriginalRow227TriangleData1337.coefficient102_280,
  OriginalRow227TriangleData1337.coefficient102_281,
  OriginalRow227TriangleData1337.coefficient102_282,
  OriginalRow227TriangleData1337.coefficient102_283,
  OriginalRow227TriangleData1337.coefficient102_284,
  OriginalRow227TriangleData1337.coefficient102_285,
  OriginalRow227TriangleData1337.coefficient102_286,
  OriginalRow227TriangleData1337.coefficient102_287,
  OriginalRow227TriangleData1337.coefficient102_288,
  OriginalRow227TriangleData1337.coefficient102_289,
  OriginalRow227TriangleData1337.coefficient102_290,
  OriginalRow227TriangleData1337.coefficient102_291,
  OriginalRow227TriangleData1337.coefficient102_292
]

theorem values1337_size : values1337.size = 32 := rfl

def block1337 : ℕ → Option IntervalDyadic := segment 261 values1337

theorem block1337_domain : ExactDomain block1337 261 293 := by
  simpa only [values1337_size] using segment_domain 261 values1337

theorem block1337_get (i : Fin 32) :
    block1337 (261 + i.val) = some (values1337[i.val]'(by rw [values1337_size]; exact i.isLt)) := by
  exact segment_get 261 values1337 ⟨i.val, by rw [values1337_size]; exact i.isLt⟩

def values1338 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1338.coefficient102_293,
  OriginalRow227TriangleData1338.coefficient102_294,
  OriginalRow227TriangleData1338.coefficient102_295,
  OriginalRow227TriangleData1338.coefficient102_296,
  OriginalRow227TriangleData1338.coefficient102_297,
  OriginalRow227TriangleData1338.coefficient102_298,
  OriginalRow227TriangleData1338.coefficient102_299,
  OriginalRow227TriangleData1338.coefficient102_300,
  OriginalRow227TriangleData1338.coefficient102_301,
  OriginalRow227TriangleData1338.coefficient102_302,
  OriginalRow227TriangleData1338.coefficient102_303,
  OriginalRow227TriangleData1338.coefficient102_304,
  OriginalRow227TriangleData1338.coefficient102_305,
  OriginalRow227TriangleData1338.coefficient102_306,
  OriginalRow227TriangleData1338.coefficient102_307,
  OriginalRow227TriangleData1338.coefficient102_308,
  OriginalRow227TriangleData1338.coefficient102_309,
  OriginalRow227TriangleData1338.coefficient102_310,
  OriginalRow227TriangleData1338.coefficient102_311,
  OriginalRow227TriangleData1338.coefficient102_312,
  OriginalRow227TriangleData1338.coefficient102_313,
  OriginalRow227TriangleData1338.coefficient102_314,
  OriginalRow227TriangleData1338.coefficient102_315,
  OriginalRow227TriangleData1338.coefficient102_316,
  OriginalRow227TriangleData1338.coefficient102_317,
  OriginalRow227TriangleData1338.coefficient102_318,
  OriginalRow227TriangleData1338.coefficient102_319,
  OriginalRow227TriangleData1338.coefficient102_320,
  OriginalRow227TriangleData1338.coefficient102_321,
  OriginalRow227TriangleData1338.coefficient102_322,
  OriginalRow227TriangleData1338.coefficient102_323,
  OriginalRow227TriangleData1338.coefficient102_324
]

theorem values1338_size : values1338.size = 32 := rfl

def block1338 : ℕ → Option IntervalDyadic := segment 293 values1338

theorem block1338_domain : ExactDomain block1338 293 325 := by
  simpa only [values1338_size] using segment_domain 293 values1338

theorem block1338_get (i : Fin 32) :
    block1338 (293 + i.val) = some (values1338[i.val]'(by rw [values1338_size]; exact i.isLt)) := by
  exact segment_get 293 values1338 ⟨i.val, by rw [values1338_size]; exact i.isLt⟩

def values1339 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1339.coefficient102_325,
  OriginalRow227TriangleData1339.coefficient102_326,
  OriginalRow227TriangleData1339.coefficient102_327,
  OriginalRow227TriangleData1339.coefficient102_328,
  OriginalRow227TriangleData1339.coefficient102_329,
  OriginalRow227TriangleData1339.coefficient102_330,
  OriginalRow227TriangleData1339.coefficient102_331,
  OriginalRow227TriangleData1339.coefficient102_332,
  OriginalRow227TriangleData1339.coefficient102_333,
  OriginalRow227TriangleData1339.coefficient102_334,
  OriginalRow227TriangleData1339.coefficient102_335,
  OriginalRow227TriangleData1339.coefficient102_336,
  OriginalRow227TriangleData1339.coefficient102_337,
  OriginalRow227TriangleData1339.coefficient102_338,
  OriginalRow227TriangleData1339.coefficient102_339,
  OriginalRow227TriangleData1339.coefficient102_340,
  OriginalRow227TriangleData1339.coefficient102_341,
  OriginalRow227TriangleData1339.coefficient102_342,
  OriginalRow227TriangleData1339.coefficient102_343,
  OriginalRow227TriangleData1339.coefficient102_344,
  OriginalRow227TriangleData1339.coefficient102_345,
  OriginalRow227TriangleData1339.coefficient102_346,
  OriginalRow227TriangleData1339.coefficient102_347,
  OriginalRow227TriangleData1339.coefficient102_348,
  OriginalRow227TriangleData1339.coefficient102_349,
  OriginalRow227TriangleData1339.coefficient102_350,
  OriginalRow227TriangleData1339.coefficient102_351,
  OriginalRow227TriangleData1339.coefficient102_352,
  OriginalRow227TriangleData1339.coefficient102_353,
  OriginalRow227TriangleData1339.coefficient102_354,
  OriginalRow227TriangleData1339.coefficient102_355,
  OriginalRow227TriangleData1339.coefficient102_356
]

theorem values1339_size : values1339.size = 32 := rfl

def block1339 : ℕ → Option IntervalDyadic := segment 325 values1339

theorem block1339_domain : ExactDomain block1339 325 357 := by
  simpa only [values1339_size] using segment_domain 325 values1339

theorem block1339_get (i : Fin 32) :
    block1339 (325 + i.val) = some (values1339[i.val]'(by rw [values1339_size]; exact i.isLt)) := by
  exact segment_get 325 values1339 ⟨i.val, by rw [values1339_size]; exact i.isLt⟩

def values1340 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1340.coefficient102_357,
  OriginalRow227TriangleData1340.coefficient102_358,
  OriginalRow227TriangleData1340.coefficient102_359,
  OriginalRow227TriangleData1340.coefficient102_360,
  OriginalRow227TriangleData1340.coefficient102_361,
  OriginalRow227TriangleData1340.coefficient102_362,
  OriginalRow227TriangleData1340.coefficient102_363,
  OriginalRow227TriangleData1340.coefficient102_364,
  OriginalRow227TriangleData1340.coefficient102_365,
  OriginalRow227TriangleData1340.coefficient102_366,
  OriginalRow227TriangleData1340.coefficient102_367,
  OriginalRow227TriangleData1340.coefficient102_368,
  OriginalRow227TriangleData1340.coefficient102_369,
  OriginalRow227TriangleData1340.coefficient102_370,
  OriginalRow227TriangleData1340.coefficient102_371,
  OriginalRow227TriangleData1340.coefficient102_372,
  OriginalRow227TriangleData1340.coefficient102_373,
  OriginalRow227TriangleData1340.coefficient102_374,
  OriginalRow227TriangleData1340.coefficient102_375,
  OriginalRow227TriangleData1340.coefficient102_376,
  OriginalRow227TriangleData1340.coefficient102_377,
  OriginalRow227TriangleData1340.coefficient102_378,
  OriginalRow227TriangleData1340.coefficient102_379,
  OriginalRow227TriangleData1340.coefficient102_380,
  OriginalRow227TriangleData1340.coefficient102_381,
  OriginalRow227TriangleData1340.coefficient102_382,
  OriginalRow227TriangleData1340.coefficient102_383,
  OriginalRow227TriangleData1340.coefficient102_384,
  OriginalRow227TriangleData1340.coefficient102_385,
  OriginalRow227TriangleData1340.coefficient102_386,
  OriginalRow227TriangleData1340.coefficient102_387,
  OriginalRow227TriangleData1340.coefficient102_388
]

theorem values1340_size : values1340.size = 32 := rfl

def block1340 : ℕ → Option IntervalDyadic := segment 357 values1340

theorem block1340_domain : ExactDomain block1340 357 389 := by
  simpa only [values1340_size] using segment_domain 357 values1340

theorem block1340_get (i : Fin 32) :
    block1340 (357 + i.val) = some (values1340[i.val]'(by rw [values1340_size]; exact i.isLt)) := by
  exact segment_get 357 values1340 ⟨i.val, by rw [values1340_size]; exact i.isLt⟩

def values1341 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1341.coefficient102_389,
  OriginalRow227TriangleData1341.coefficient102_390,
  OriginalRow227TriangleData1341.coefficient102_391,
  OriginalRow227TriangleData1341.coefficient102_392,
  OriginalRow227TriangleData1341.coefficient102_393,
  OriginalRow227TriangleData1341.coefficient102_394,
  OriginalRow227TriangleData1341.coefficient102_395,
  OriginalRow227TriangleData1341.coefficient102_396,
  OriginalRow227TriangleData1341.coefficient102_397,
  OriginalRow227TriangleData1341.coefficient102_398,
  OriginalRow227TriangleData1341.coefficient102_399
]

theorem values1341_size : values1341.size = 11 := rfl

def block1341 : ℕ → Option IntervalDyadic := segment 389 values1341

theorem block1341_domain : ExactDomain block1341 389 400 := by
  simpa only [values1341_size] using segment_domain 389 values1341

theorem block1341_get (i : Fin 11) :
    block1341 (389 + i.val) = some (values1341[i.val]'(by rw [values1341_size]; exact i.isLt)) := by
  exact segment_get 389 values1341 ⟨i.val, by rw [values1341_size]; exact i.isLt⟩

def node0101_0165 : ℕ → Option IntervalDyadic := split 133 block1332 block1333

theorem node0101_0165_domain : ExactDomain node0101_0165 101 165 := by
  exact split_domain (by decide) (by decide) block1332_domain block1333_domain

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block1335 block1336

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block1335_domain block1336_domain

def node0165_0261 : ℕ → Option IntervalDyadic := split 197 block1334 node0197_0261

theorem node0165_0261_domain : ExactDomain node0165_0261 165 261 := by
  exact split_domain (by decide) (by decide) block1334_domain node0197_0261_domain

def node0101_0261 : ℕ → Option IntervalDyadic := split 165 node0101_0165 node0165_0261

theorem node0101_0261_domain : ExactDomain node0101_0261 101 261 := by
  exact split_domain (by decide) (by decide) node0101_0165_domain node0165_0261_domain

def node0261_0325 : ℕ → Option IntervalDyadic := split 293 block1337 block1338

theorem node0261_0325_domain : ExactDomain node0261_0325 261 325 := by
  exact split_domain (by decide) (by decide) block1337_domain block1338_domain

def node0357_0400 : ℕ → Option IntervalDyadic := split 389 block1340 block1341

theorem node0357_0400_domain : ExactDomain node0357_0400 357 400 := by
  exact split_domain (by decide) (by decide) block1340_domain block1341_domain

def node0325_0400 : ℕ → Option IntervalDyadic := split 357 block1339 node0357_0400

theorem node0325_0400_domain : ExactDomain node0325_0400 325 400 := by
  exact split_domain (by decide) (by decide) block1339_domain node0357_0400_domain

def node0261_0400 : ℕ → Option IntervalDyadic := split 325 node0261_0325 node0325_0400

theorem node0261_0400_domain : ExactDomain node0261_0400 261 400 := by
  exact split_domain (by decide) (by decide) node0261_0325_domain node0325_0400_domain

def node0101_0400 : ℕ → Option IntervalDyadic := split 261 node0101_0261 node0261_0400

theorem node0101_0400_domain : ExactDomain node0101_0400 101 400 := by
  exact split_domain (by decide) (by decide) node0101_0261_domain node0261_0400_domain

def lookup : ℕ → Option IntervalDyadic := node0101_0400

theorem lookup_domain : ExactDomain lookup 101 400 :=
  node0101_0400_domain

theorem block1332_lookup (i : Fin 32) :
    lookup (101 + i.val) = some (values1332[i.val]'(by rw [values1332_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (101 + i.val) = _
  rw [node0101_0400, split_left 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0101_0261, split_left 165 node0101_0165 node0165_0261 (by omega)]
  rw [node0101_0165, split_left 133 block1332 block1333 (by omega)]
  exact block1332_get i

theorem block1333_lookup (i : Fin 32) :
    lookup (133 + i.val) = some (values1333[i.val]'(by rw [values1333_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (133 + i.val) = _
  rw [node0101_0400, split_left 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0101_0261, split_left 165 node0101_0165 node0165_0261 (by omega)]
  rw [node0101_0165, split_right 133 block1332 block1333 (by omega)]
  exact block1333_get i

theorem block1334_lookup (i : Fin 32) :
    lookup (165 + i.val) = some (values1334[i.val]'(by rw [values1334_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (165 + i.val) = _
  rw [node0101_0400, split_left 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0101_0261, split_right 165 node0101_0165 node0165_0261 (by omega)]
  rw [node0165_0261, split_left 197 block1334 node0197_0261 (by omega)]
  exact block1334_get i

theorem block1335_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values1335[i.val]'(by rw [values1335_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (197 + i.val) = _
  rw [node0101_0400, split_left 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0101_0261, split_right 165 node0101_0165 node0165_0261 (by omega)]
  rw [node0165_0261, split_right 197 block1334 node0197_0261 (by omega)]
  rw [node0197_0261, split_left 229 block1335 block1336 (by omega)]
  exact block1335_get i

theorem block1336_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values1336[i.val]'(by rw [values1336_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (229 + i.val) = _
  rw [node0101_0400, split_left 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0101_0261, split_right 165 node0101_0165 node0165_0261 (by omega)]
  rw [node0165_0261, split_right 197 block1334 node0197_0261 (by omega)]
  rw [node0197_0261, split_right 229 block1335 block1336 (by omega)]
  exact block1336_get i

theorem block1337_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values1337[i.val]'(by rw [values1337_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (261 + i.val) = _
  rw [node0101_0400, split_right 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0261_0400, split_left 325 node0261_0325 node0325_0400 (by omega)]
  rw [node0261_0325, split_left 293 block1337 block1338 (by omega)]
  exact block1337_get i

theorem block1338_lookup (i : Fin 32) :
    lookup (293 + i.val) = some (values1338[i.val]'(by rw [values1338_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (293 + i.val) = _
  rw [node0101_0400, split_right 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0261_0400, split_left 325 node0261_0325 node0325_0400 (by omega)]
  rw [node0261_0325, split_right 293 block1337 block1338 (by omega)]
  exact block1338_get i

theorem block1339_lookup (i : Fin 32) :
    lookup (325 + i.val) = some (values1339[i.val]'(by rw [values1339_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (325 + i.val) = _
  rw [node0101_0400, split_right 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0261_0400, split_right 325 node0261_0325 node0325_0400 (by omega)]
  rw [node0325_0400, split_left 357 block1339 node0357_0400 (by omega)]
  exact block1339_get i

theorem block1340_lookup (i : Fin 32) :
    lookup (357 + i.val) = some (values1340[i.val]'(by rw [values1340_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (357 + i.val) = _
  rw [node0101_0400, split_right 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0261_0400, split_right 325 node0261_0325 node0325_0400 (by omega)]
  rw [node0325_0400, split_right 357 block1339 node0357_0400 (by omega)]
  rw [node0357_0400, split_left 389 block1340 block1341 (by omega)]
  exact block1340_get i

theorem block1341_lookup (i : Fin 11) :
    lookup (389 + i.val) = some (values1341[i.val]'(by rw [values1341_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0101_0400 (389 + i.val) = _
  rw [node0101_0400, split_right 261 node0101_0261 node0261_0400 (by omega)]
  rw [node0261_0400, split_right 325 node0261_0325 node0325_0400 (by omega)]
  rw [node0325_0400, split_right 357 block1339 node0357_0400 (by omega)]
  rw [node0357_0400, split_right 389 block1340 block1341 (by omega)]
  exact block1341_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1332_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1332_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1333_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1333_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1334_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1334_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1335_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1335_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1336_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1336_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1337_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1337_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1338_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1338_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1339_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1339_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1340_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1340_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1341_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1341_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1332_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1333_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1334_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1335_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1336_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1337_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1338_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1339_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1340_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow102.block1341_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow102
