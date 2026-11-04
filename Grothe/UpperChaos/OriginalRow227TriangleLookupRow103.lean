import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1342
import Grothe.UpperChaos.OriginalRow227TriangleData1343
import Grothe.UpperChaos.OriginalRow227TriangleData1344
import Grothe.UpperChaos.OriginalRow227TriangleData1345
import Grothe.UpperChaos.OriginalRow227TriangleData1346
import Grothe.UpperChaos.OriginalRow227TriangleData1347
import Grothe.UpperChaos.OriginalRow227TriangleData1348
import Grothe.UpperChaos.OriginalRow227TriangleData1349
import Grothe.UpperChaos.OriginalRow227TriangleData1350
import Grothe.UpperChaos.OriginalRow227TriangleData1351

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow103

open ConditionalTableLookup

def values1342 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1342.coefficient103_102,
  OriginalRow227TriangleData1342.coefficient103_103,
  OriginalRow227TriangleData1342.coefficient103_104,
  OriginalRow227TriangleData1342.coefficient103_105,
  OriginalRow227TriangleData1342.coefficient103_106,
  OriginalRow227TriangleData1342.coefficient103_107,
  OriginalRow227TriangleData1342.coefficient103_108,
  OriginalRow227TriangleData1342.coefficient103_109,
  OriginalRow227TriangleData1342.coefficient103_110,
  OriginalRow227TriangleData1342.coefficient103_111,
  OriginalRow227TriangleData1342.coefficient103_112,
  OriginalRow227TriangleData1342.coefficient103_113,
  OriginalRow227TriangleData1342.coefficient103_114,
  OriginalRow227TriangleData1342.coefficient103_115,
  OriginalRow227TriangleData1342.coefficient103_116,
  OriginalRow227TriangleData1342.coefficient103_117,
  OriginalRow227TriangleData1342.coefficient103_118,
  OriginalRow227TriangleData1342.coefficient103_119,
  OriginalRow227TriangleData1342.coefficient103_120,
  OriginalRow227TriangleData1342.coefficient103_121,
  OriginalRow227TriangleData1342.coefficient103_122,
  OriginalRow227TriangleData1342.coefficient103_123,
  OriginalRow227TriangleData1342.coefficient103_124,
  OriginalRow227TriangleData1342.coefficient103_125,
  OriginalRow227TriangleData1342.coefficient103_126,
  OriginalRow227TriangleData1342.coefficient103_127,
  OriginalRow227TriangleData1342.coefficient103_128,
  OriginalRow227TriangleData1342.coefficient103_129,
  OriginalRow227TriangleData1342.coefficient103_130,
  OriginalRow227TriangleData1342.coefficient103_131,
  OriginalRow227TriangleData1342.coefficient103_132,
  OriginalRow227TriangleData1342.coefficient103_133
]

theorem values1342_size : values1342.size = 32 := rfl

def block1342 : ℕ → Option IntervalDyadic := segment 102 values1342

theorem block1342_domain : ExactDomain block1342 102 134 := by
  simpa only [values1342_size] using segment_domain 102 values1342

theorem block1342_get (i : Fin 32) :
    block1342 (102 + i.val) = some (values1342[i.val]'(by rw [values1342_size]; exact i.isLt)) := by
  exact segment_get 102 values1342 ⟨i.val, by rw [values1342_size]; exact i.isLt⟩

def values1343 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1343.coefficient103_134,
  OriginalRow227TriangleData1343.coefficient103_135,
  OriginalRow227TriangleData1343.coefficient103_136,
  OriginalRow227TriangleData1343.coefficient103_137,
  OriginalRow227TriangleData1343.coefficient103_138,
  OriginalRow227TriangleData1343.coefficient103_139,
  OriginalRow227TriangleData1343.coefficient103_140,
  OriginalRow227TriangleData1343.coefficient103_141,
  OriginalRow227TriangleData1343.coefficient103_142,
  OriginalRow227TriangleData1343.coefficient103_143,
  OriginalRow227TriangleData1343.coefficient103_144,
  OriginalRow227TriangleData1343.coefficient103_145,
  OriginalRow227TriangleData1343.coefficient103_146,
  OriginalRow227TriangleData1343.coefficient103_147,
  OriginalRow227TriangleData1343.coefficient103_148,
  OriginalRow227TriangleData1343.coefficient103_149,
  OriginalRow227TriangleData1343.coefficient103_150,
  OriginalRow227TriangleData1343.coefficient103_151,
  OriginalRow227TriangleData1343.coefficient103_152,
  OriginalRow227TriangleData1343.coefficient103_153,
  OriginalRow227TriangleData1343.coefficient103_154,
  OriginalRow227TriangleData1343.coefficient103_155,
  OriginalRow227TriangleData1343.coefficient103_156,
  OriginalRow227TriangleData1343.coefficient103_157,
  OriginalRow227TriangleData1343.coefficient103_158,
  OriginalRow227TriangleData1343.coefficient103_159,
  OriginalRow227TriangleData1343.coefficient103_160,
  OriginalRow227TriangleData1343.coefficient103_161,
  OriginalRow227TriangleData1343.coefficient103_162,
  OriginalRow227TriangleData1343.coefficient103_163,
  OriginalRow227TriangleData1343.coefficient103_164,
  OriginalRow227TriangleData1343.coefficient103_165
]

theorem values1343_size : values1343.size = 32 := rfl

def block1343 : ℕ → Option IntervalDyadic := segment 134 values1343

theorem block1343_domain : ExactDomain block1343 134 166 := by
  simpa only [values1343_size] using segment_domain 134 values1343

theorem block1343_get (i : Fin 32) :
    block1343 (134 + i.val) = some (values1343[i.val]'(by rw [values1343_size]; exact i.isLt)) := by
  exact segment_get 134 values1343 ⟨i.val, by rw [values1343_size]; exact i.isLt⟩

def values1344 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1344.coefficient103_166,
  OriginalRow227TriangleData1344.coefficient103_167,
  OriginalRow227TriangleData1344.coefficient103_168,
  OriginalRow227TriangleData1344.coefficient103_169,
  OriginalRow227TriangleData1344.coefficient103_170,
  OriginalRow227TriangleData1344.coefficient103_171,
  OriginalRow227TriangleData1344.coefficient103_172,
  OriginalRow227TriangleData1344.coefficient103_173,
  OriginalRow227TriangleData1344.coefficient103_174,
  OriginalRow227TriangleData1344.coefficient103_175,
  OriginalRow227TriangleData1344.coefficient103_176,
  OriginalRow227TriangleData1344.coefficient103_177,
  OriginalRow227TriangleData1344.coefficient103_178,
  OriginalRow227TriangleData1344.coefficient103_179,
  OriginalRow227TriangleData1344.coefficient103_180,
  OriginalRow227TriangleData1344.coefficient103_181,
  OriginalRow227TriangleData1344.coefficient103_182,
  OriginalRow227TriangleData1344.coefficient103_183,
  OriginalRow227TriangleData1344.coefficient103_184,
  OriginalRow227TriangleData1344.coefficient103_185,
  OriginalRow227TriangleData1344.coefficient103_186,
  OriginalRow227TriangleData1344.coefficient103_187,
  OriginalRow227TriangleData1344.coefficient103_188,
  OriginalRow227TriangleData1344.coefficient103_189,
  OriginalRow227TriangleData1344.coefficient103_190,
  OriginalRow227TriangleData1344.coefficient103_191,
  OriginalRow227TriangleData1344.coefficient103_192,
  OriginalRow227TriangleData1344.coefficient103_193,
  OriginalRow227TriangleData1344.coefficient103_194,
  OriginalRow227TriangleData1344.coefficient103_195,
  OriginalRow227TriangleData1344.coefficient103_196,
  OriginalRow227TriangleData1344.coefficient103_197
]

theorem values1344_size : values1344.size = 32 := rfl

def block1344 : ℕ → Option IntervalDyadic := segment 166 values1344

theorem block1344_domain : ExactDomain block1344 166 198 := by
  simpa only [values1344_size] using segment_domain 166 values1344

theorem block1344_get (i : Fin 32) :
    block1344 (166 + i.val) = some (values1344[i.val]'(by rw [values1344_size]; exact i.isLt)) := by
  exact segment_get 166 values1344 ⟨i.val, by rw [values1344_size]; exact i.isLt⟩

def values1345 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1345.coefficient103_198,
  OriginalRow227TriangleData1345.coefficient103_199,
  OriginalRow227TriangleData1345.coefficient103_200,
  OriginalRow227TriangleData1345.coefficient103_201,
  OriginalRow227TriangleData1345.coefficient103_202,
  OriginalRow227TriangleData1345.coefficient103_203,
  OriginalRow227TriangleData1345.coefficient103_204,
  OriginalRow227TriangleData1345.coefficient103_205,
  OriginalRow227TriangleData1345.coefficient103_206,
  OriginalRow227TriangleData1345.coefficient103_207,
  OriginalRow227TriangleData1345.coefficient103_208,
  OriginalRow227TriangleData1345.coefficient103_209,
  OriginalRow227TriangleData1345.coefficient103_210,
  OriginalRow227TriangleData1345.coefficient103_211,
  OriginalRow227TriangleData1345.coefficient103_212,
  OriginalRow227TriangleData1345.coefficient103_213,
  OriginalRow227TriangleData1345.coefficient103_214,
  OriginalRow227TriangleData1345.coefficient103_215,
  OriginalRow227TriangleData1345.coefficient103_216,
  OriginalRow227TriangleData1345.coefficient103_217,
  OriginalRow227TriangleData1345.coefficient103_218,
  OriginalRow227TriangleData1345.coefficient103_219,
  OriginalRow227TriangleData1345.coefficient103_220,
  OriginalRow227TriangleData1345.coefficient103_221,
  OriginalRow227TriangleData1345.coefficient103_222,
  OriginalRow227TriangleData1345.coefficient103_223,
  OriginalRow227TriangleData1345.coefficient103_224,
  OriginalRow227TriangleData1345.coefficient103_225,
  OriginalRow227TriangleData1345.coefficient103_226,
  OriginalRow227TriangleData1345.coefficient103_227,
  OriginalRow227TriangleData1345.coefficient103_228,
  OriginalRow227TriangleData1345.coefficient103_229
]

theorem values1345_size : values1345.size = 32 := rfl

def block1345 : ℕ → Option IntervalDyadic := segment 198 values1345

theorem block1345_domain : ExactDomain block1345 198 230 := by
  simpa only [values1345_size] using segment_domain 198 values1345

theorem block1345_get (i : Fin 32) :
    block1345 (198 + i.val) = some (values1345[i.val]'(by rw [values1345_size]; exact i.isLt)) := by
  exact segment_get 198 values1345 ⟨i.val, by rw [values1345_size]; exact i.isLt⟩

def values1346 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1346.coefficient103_230,
  OriginalRow227TriangleData1346.coefficient103_231,
  OriginalRow227TriangleData1346.coefficient103_232,
  OriginalRow227TriangleData1346.coefficient103_233,
  OriginalRow227TriangleData1346.coefficient103_234,
  OriginalRow227TriangleData1346.coefficient103_235,
  OriginalRow227TriangleData1346.coefficient103_236,
  OriginalRow227TriangleData1346.coefficient103_237,
  OriginalRow227TriangleData1346.coefficient103_238,
  OriginalRow227TriangleData1346.coefficient103_239,
  OriginalRow227TriangleData1346.coefficient103_240,
  OriginalRow227TriangleData1346.coefficient103_241,
  OriginalRow227TriangleData1346.coefficient103_242,
  OriginalRow227TriangleData1346.coefficient103_243,
  OriginalRow227TriangleData1346.coefficient103_244,
  OriginalRow227TriangleData1346.coefficient103_245,
  OriginalRow227TriangleData1346.coefficient103_246,
  OriginalRow227TriangleData1346.coefficient103_247,
  OriginalRow227TriangleData1346.coefficient103_248,
  OriginalRow227TriangleData1346.coefficient103_249,
  OriginalRow227TriangleData1346.coefficient103_250,
  OriginalRow227TriangleData1346.coefficient103_251,
  OriginalRow227TriangleData1346.coefficient103_252,
  OriginalRow227TriangleData1346.coefficient103_253,
  OriginalRow227TriangleData1346.coefficient103_254,
  OriginalRow227TriangleData1346.coefficient103_255,
  OriginalRow227TriangleData1346.coefficient103_256,
  OriginalRow227TriangleData1346.coefficient103_257,
  OriginalRow227TriangleData1346.coefficient103_258,
  OriginalRow227TriangleData1346.coefficient103_259,
  OriginalRow227TriangleData1346.coefficient103_260,
  OriginalRow227TriangleData1346.coefficient103_261
]

theorem values1346_size : values1346.size = 32 := rfl

def block1346 : ℕ → Option IntervalDyadic := segment 230 values1346

theorem block1346_domain : ExactDomain block1346 230 262 := by
  simpa only [values1346_size] using segment_domain 230 values1346

theorem block1346_get (i : Fin 32) :
    block1346 (230 + i.val) = some (values1346[i.val]'(by rw [values1346_size]; exact i.isLt)) := by
  exact segment_get 230 values1346 ⟨i.val, by rw [values1346_size]; exact i.isLt⟩

def values1347 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1347.coefficient103_262,
  OriginalRow227TriangleData1347.coefficient103_263,
  OriginalRow227TriangleData1347.coefficient103_264,
  OriginalRow227TriangleData1347.coefficient103_265,
  OriginalRow227TriangleData1347.coefficient103_266,
  OriginalRow227TriangleData1347.coefficient103_267,
  OriginalRow227TriangleData1347.coefficient103_268,
  OriginalRow227TriangleData1347.coefficient103_269,
  OriginalRow227TriangleData1347.coefficient103_270,
  OriginalRow227TriangleData1347.coefficient103_271,
  OriginalRow227TriangleData1347.coefficient103_272,
  OriginalRow227TriangleData1347.coefficient103_273,
  OriginalRow227TriangleData1347.coefficient103_274,
  OriginalRow227TriangleData1347.coefficient103_275,
  OriginalRow227TriangleData1347.coefficient103_276,
  OriginalRow227TriangleData1347.coefficient103_277,
  OriginalRow227TriangleData1347.coefficient103_278,
  OriginalRow227TriangleData1347.coefficient103_279,
  OriginalRow227TriangleData1347.coefficient103_280,
  OriginalRow227TriangleData1347.coefficient103_281,
  OriginalRow227TriangleData1347.coefficient103_282,
  OriginalRow227TriangleData1347.coefficient103_283,
  OriginalRow227TriangleData1347.coefficient103_284,
  OriginalRow227TriangleData1347.coefficient103_285,
  OriginalRow227TriangleData1347.coefficient103_286,
  OriginalRow227TriangleData1347.coefficient103_287,
  OriginalRow227TriangleData1347.coefficient103_288,
  OriginalRow227TriangleData1347.coefficient103_289,
  OriginalRow227TriangleData1347.coefficient103_290,
  OriginalRow227TriangleData1347.coefficient103_291,
  OriginalRow227TriangleData1347.coefficient103_292,
  OriginalRow227TriangleData1347.coefficient103_293
]

theorem values1347_size : values1347.size = 32 := rfl

def block1347 : ℕ → Option IntervalDyadic := segment 262 values1347

theorem block1347_domain : ExactDomain block1347 262 294 := by
  simpa only [values1347_size] using segment_domain 262 values1347

theorem block1347_get (i : Fin 32) :
    block1347 (262 + i.val) = some (values1347[i.val]'(by rw [values1347_size]; exact i.isLt)) := by
  exact segment_get 262 values1347 ⟨i.val, by rw [values1347_size]; exact i.isLt⟩

def values1348 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1348.coefficient103_294,
  OriginalRow227TriangleData1348.coefficient103_295,
  OriginalRow227TriangleData1348.coefficient103_296,
  OriginalRow227TriangleData1348.coefficient103_297,
  OriginalRow227TriangleData1348.coefficient103_298,
  OriginalRow227TriangleData1348.coefficient103_299,
  OriginalRow227TriangleData1348.coefficient103_300,
  OriginalRow227TriangleData1348.coefficient103_301,
  OriginalRow227TriangleData1348.coefficient103_302,
  OriginalRow227TriangleData1348.coefficient103_303,
  OriginalRow227TriangleData1348.coefficient103_304,
  OriginalRow227TriangleData1348.coefficient103_305,
  OriginalRow227TriangleData1348.coefficient103_306,
  OriginalRow227TriangleData1348.coefficient103_307,
  OriginalRow227TriangleData1348.coefficient103_308,
  OriginalRow227TriangleData1348.coefficient103_309,
  OriginalRow227TriangleData1348.coefficient103_310,
  OriginalRow227TriangleData1348.coefficient103_311,
  OriginalRow227TriangleData1348.coefficient103_312,
  OriginalRow227TriangleData1348.coefficient103_313,
  OriginalRow227TriangleData1348.coefficient103_314,
  OriginalRow227TriangleData1348.coefficient103_315,
  OriginalRow227TriangleData1348.coefficient103_316,
  OriginalRow227TriangleData1348.coefficient103_317,
  OriginalRow227TriangleData1348.coefficient103_318,
  OriginalRow227TriangleData1348.coefficient103_319,
  OriginalRow227TriangleData1348.coefficient103_320,
  OriginalRow227TriangleData1348.coefficient103_321,
  OriginalRow227TriangleData1348.coefficient103_322,
  OriginalRow227TriangleData1348.coefficient103_323,
  OriginalRow227TriangleData1348.coefficient103_324,
  OriginalRow227TriangleData1348.coefficient103_325
]

theorem values1348_size : values1348.size = 32 := rfl

def block1348 : ℕ → Option IntervalDyadic := segment 294 values1348

theorem block1348_domain : ExactDomain block1348 294 326 := by
  simpa only [values1348_size] using segment_domain 294 values1348

theorem block1348_get (i : Fin 32) :
    block1348 (294 + i.val) = some (values1348[i.val]'(by rw [values1348_size]; exact i.isLt)) := by
  exact segment_get 294 values1348 ⟨i.val, by rw [values1348_size]; exact i.isLt⟩

def values1349 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1349.coefficient103_326,
  OriginalRow227TriangleData1349.coefficient103_327,
  OriginalRow227TriangleData1349.coefficient103_328,
  OriginalRow227TriangleData1349.coefficient103_329,
  OriginalRow227TriangleData1349.coefficient103_330,
  OriginalRow227TriangleData1349.coefficient103_331,
  OriginalRow227TriangleData1349.coefficient103_332,
  OriginalRow227TriangleData1349.coefficient103_333,
  OriginalRow227TriangleData1349.coefficient103_334,
  OriginalRow227TriangleData1349.coefficient103_335,
  OriginalRow227TriangleData1349.coefficient103_336,
  OriginalRow227TriangleData1349.coefficient103_337,
  OriginalRow227TriangleData1349.coefficient103_338,
  OriginalRow227TriangleData1349.coefficient103_339,
  OriginalRow227TriangleData1349.coefficient103_340,
  OriginalRow227TriangleData1349.coefficient103_341,
  OriginalRow227TriangleData1349.coefficient103_342,
  OriginalRow227TriangleData1349.coefficient103_343,
  OriginalRow227TriangleData1349.coefficient103_344,
  OriginalRow227TriangleData1349.coefficient103_345,
  OriginalRow227TriangleData1349.coefficient103_346,
  OriginalRow227TriangleData1349.coefficient103_347,
  OriginalRow227TriangleData1349.coefficient103_348,
  OriginalRow227TriangleData1349.coefficient103_349,
  OriginalRow227TriangleData1349.coefficient103_350,
  OriginalRow227TriangleData1349.coefficient103_351,
  OriginalRow227TriangleData1349.coefficient103_352,
  OriginalRow227TriangleData1349.coefficient103_353,
  OriginalRow227TriangleData1349.coefficient103_354,
  OriginalRow227TriangleData1349.coefficient103_355,
  OriginalRow227TriangleData1349.coefficient103_356,
  OriginalRow227TriangleData1349.coefficient103_357
]

theorem values1349_size : values1349.size = 32 := rfl

def block1349 : ℕ → Option IntervalDyadic := segment 326 values1349

theorem block1349_domain : ExactDomain block1349 326 358 := by
  simpa only [values1349_size] using segment_domain 326 values1349

theorem block1349_get (i : Fin 32) :
    block1349 (326 + i.val) = some (values1349[i.val]'(by rw [values1349_size]; exact i.isLt)) := by
  exact segment_get 326 values1349 ⟨i.val, by rw [values1349_size]; exact i.isLt⟩

def values1350 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1350.coefficient103_358,
  OriginalRow227TriangleData1350.coefficient103_359,
  OriginalRow227TriangleData1350.coefficient103_360,
  OriginalRow227TriangleData1350.coefficient103_361,
  OriginalRow227TriangleData1350.coefficient103_362,
  OriginalRow227TriangleData1350.coefficient103_363,
  OriginalRow227TriangleData1350.coefficient103_364,
  OriginalRow227TriangleData1350.coefficient103_365,
  OriginalRow227TriangleData1350.coefficient103_366,
  OriginalRow227TriangleData1350.coefficient103_367,
  OriginalRow227TriangleData1350.coefficient103_368,
  OriginalRow227TriangleData1350.coefficient103_369,
  OriginalRow227TriangleData1350.coefficient103_370,
  OriginalRow227TriangleData1350.coefficient103_371,
  OriginalRow227TriangleData1350.coefficient103_372,
  OriginalRow227TriangleData1350.coefficient103_373,
  OriginalRow227TriangleData1350.coefficient103_374,
  OriginalRow227TriangleData1350.coefficient103_375,
  OriginalRow227TriangleData1350.coefficient103_376,
  OriginalRow227TriangleData1350.coefficient103_377,
  OriginalRow227TriangleData1350.coefficient103_378,
  OriginalRow227TriangleData1350.coefficient103_379,
  OriginalRow227TriangleData1350.coefficient103_380,
  OriginalRow227TriangleData1350.coefficient103_381,
  OriginalRow227TriangleData1350.coefficient103_382,
  OriginalRow227TriangleData1350.coefficient103_383,
  OriginalRow227TriangleData1350.coefficient103_384,
  OriginalRow227TriangleData1350.coefficient103_385,
  OriginalRow227TriangleData1350.coefficient103_386,
  OriginalRow227TriangleData1350.coefficient103_387,
  OriginalRow227TriangleData1350.coefficient103_388,
  OriginalRow227TriangleData1350.coefficient103_389
]

theorem values1350_size : values1350.size = 32 := rfl

def block1350 : ℕ → Option IntervalDyadic := segment 358 values1350

theorem block1350_domain : ExactDomain block1350 358 390 := by
  simpa only [values1350_size] using segment_domain 358 values1350

theorem block1350_get (i : Fin 32) :
    block1350 (358 + i.val) = some (values1350[i.val]'(by rw [values1350_size]; exact i.isLt)) := by
  exact segment_get 358 values1350 ⟨i.val, by rw [values1350_size]; exact i.isLt⟩

def values1351 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1351.coefficient103_390,
  OriginalRow227TriangleData1351.coefficient103_391,
  OriginalRow227TriangleData1351.coefficient103_392,
  OriginalRow227TriangleData1351.coefficient103_393,
  OriginalRow227TriangleData1351.coefficient103_394,
  OriginalRow227TriangleData1351.coefficient103_395,
  OriginalRow227TriangleData1351.coefficient103_396,
  OriginalRow227TriangleData1351.coefficient103_397,
  OriginalRow227TriangleData1351.coefficient103_398
]

theorem values1351_size : values1351.size = 9 := rfl

def block1351 : ℕ → Option IntervalDyadic := segment 390 values1351

theorem block1351_domain : ExactDomain block1351 390 399 := by
  simpa only [values1351_size] using segment_domain 390 values1351

theorem block1351_get (i : Fin 9) :
    block1351 (390 + i.val) = some (values1351[i.val]'(by rw [values1351_size]; exact i.isLt)) := by
  exact segment_get 390 values1351 ⟨i.val, by rw [values1351_size]; exact i.isLt⟩

def node0102_0166 : ℕ → Option IntervalDyadic := split 134 block1342 block1343

theorem node0102_0166_domain : ExactDomain node0102_0166 102 166 := by
  exact split_domain (by decide) (by decide) block1342_domain block1343_domain

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block1345 block1346

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block1345_domain block1346_domain

def node0166_0262 : ℕ → Option IntervalDyadic := split 198 block1344 node0198_0262

theorem node0166_0262_domain : ExactDomain node0166_0262 166 262 := by
  exact split_domain (by decide) (by decide) block1344_domain node0198_0262_domain

def node0102_0262 : ℕ → Option IntervalDyadic := split 166 node0102_0166 node0166_0262

theorem node0102_0262_domain : ExactDomain node0102_0262 102 262 := by
  exact split_domain (by decide) (by decide) node0102_0166_domain node0166_0262_domain

def node0262_0326 : ℕ → Option IntervalDyadic := split 294 block1347 block1348

theorem node0262_0326_domain : ExactDomain node0262_0326 262 326 := by
  exact split_domain (by decide) (by decide) block1347_domain block1348_domain

def node0358_0399 : ℕ → Option IntervalDyadic := split 390 block1350 block1351

theorem node0358_0399_domain : ExactDomain node0358_0399 358 399 := by
  exact split_domain (by decide) (by decide) block1350_domain block1351_domain

def node0326_0399 : ℕ → Option IntervalDyadic := split 358 block1349 node0358_0399

theorem node0326_0399_domain : ExactDomain node0326_0399 326 399 := by
  exact split_domain (by decide) (by decide) block1349_domain node0358_0399_domain

def node0262_0399 : ℕ → Option IntervalDyadic := split 326 node0262_0326 node0326_0399

theorem node0262_0399_domain : ExactDomain node0262_0399 262 399 := by
  exact split_domain (by decide) (by decide) node0262_0326_domain node0326_0399_domain

def node0102_0399 : ℕ → Option IntervalDyadic := split 262 node0102_0262 node0262_0399

theorem node0102_0399_domain : ExactDomain node0102_0399 102 399 := by
  exact split_domain (by decide) (by decide) node0102_0262_domain node0262_0399_domain

def lookup : ℕ → Option IntervalDyadic := node0102_0399

theorem lookup_domain : ExactDomain lookup 102 399 :=
  node0102_0399_domain

theorem block1342_lookup (i : Fin 32) :
    lookup (102 + i.val) = some (values1342[i.val]'(by rw [values1342_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (102 + i.val) = _
  rw [node0102_0399, split_left 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0102_0262, split_left 166 node0102_0166 node0166_0262 (by omega)]
  rw [node0102_0166, split_left 134 block1342 block1343 (by omega)]
  exact block1342_get i

theorem block1343_lookup (i : Fin 32) :
    lookup (134 + i.val) = some (values1343[i.val]'(by rw [values1343_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (134 + i.val) = _
  rw [node0102_0399, split_left 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0102_0262, split_left 166 node0102_0166 node0166_0262 (by omega)]
  rw [node0102_0166, split_right 134 block1342 block1343 (by omega)]
  exact block1343_get i

theorem block1344_lookup (i : Fin 32) :
    lookup (166 + i.val) = some (values1344[i.val]'(by rw [values1344_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (166 + i.val) = _
  rw [node0102_0399, split_left 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0102_0262, split_right 166 node0102_0166 node0166_0262 (by omega)]
  rw [node0166_0262, split_left 198 block1344 node0198_0262 (by omega)]
  exact block1344_get i

theorem block1345_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values1345[i.val]'(by rw [values1345_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (198 + i.val) = _
  rw [node0102_0399, split_left 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0102_0262, split_right 166 node0102_0166 node0166_0262 (by omega)]
  rw [node0166_0262, split_right 198 block1344 node0198_0262 (by omega)]
  rw [node0198_0262, split_left 230 block1345 block1346 (by omega)]
  exact block1345_get i

theorem block1346_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values1346[i.val]'(by rw [values1346_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (230 + i.val) = _
  rw [node0102_0399, split_left 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0102_0262, split_right 166 node0102_0166 node0166_0262 (by omega)]
  rw [node0166_0262, split_right 198 block1344 node0198_0262 (by omega)]
  rw [node0198_0262, split_right 230 block1345 block1346 (by omega)]
  exact block1346_get i

theorem block1347_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values1347[i.val]'(by rw [values1347_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (262 + i.val) = _
  rw [node0102_0399, split_right 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0262_0399, split_left 326 node0262_0326 node0326_0399 (by omega)]
  rw [node0262_0326, split_left 294 block1347 block1348 (by omega)]
  exact block1347_get i

theorem block1348_lookup (i : Fin 32) :
    lookup (294 + i.val) = some (values1348[i.val]'(by rw [values1348_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (294 + i.val) = _
  rw [node0102_0399, split_right 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0262_0399, split_left 326 node0262_0326 node0326_0399 (by omega)]
  rw [node0262_0326, split_right 294 block1347 block1348 (by omega)]
  exact block1348_get i

theorem block1349_lookup (i : Fin 32) :
    lookup (326 + i.val) = some (values1349[i.val]'(by rw [values1349_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (326 + i.val) = _
  rw [node0102_0399, split_right 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0262_0399, split_right 326 node0262_0326 node0326_0399 (by omega)]
  rw [node0326_0399, split_left 358 block1349 node0358_0399 (by omega)]
  exact block1349_get i

theorem block1350_lookup (i : Fin 32) :
    lookup (358 + i.val) = some (values1350[i.val]'(by rw [values1350_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (358 + i.val) = _
  rw [node0102_0399, split_right 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0262_0399, split_right 326 node0262_0326 node0326_0399 (by omega)]
  rw [node0326_0399, split_right 358 block1349 node0358_0399 (by omega)]
  rw [node0358_0399, split_left 390 block1350 block1351 (by omega)]
  exact block1350_get i

theorem block1351_lookup (i : Fin 9) :
    lookup (390 + i.val) = some (values1351[i.val]'(by rw [values1351_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0102_0399 (390 + i.val) = _
  rw [node0102_0399, split_right 262 node0102_0262 node0262_0399 (by omega)]
  rw [node0262_0399, split_right 326 node0262_0326 node0326_0399 (by omega)]
  rw [node0326_0399, split_right 358 block1349 node0358_0399 (by omega)]
  rw [node0358_0399, split_right 390 block1350 block1351 (by omega)]
  exact block1351_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1342_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1342_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1343_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1343_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1344_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1344_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1345_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1345_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1346_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1346_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1347_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1347_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1348_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1348_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1349_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1349_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1350_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1350_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1351_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1351_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1342_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1343_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1344_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1345_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1346_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1347_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1348_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1349_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1350_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow103.block1351_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow103
