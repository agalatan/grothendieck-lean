import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1292
import Grothe.UpperChaos.OriginalRow227TriangleData1293
import Grothe.UpperChaos.OriginalRow227TriangleData1294
import Grothe.UpperChaos.OriginalRow227TriangleData1295
import Grothe.UpperChaos.OriginalRow227TriangleData1296
import Grothe.UpperChaos.OriginalRow227TriangleData1297
import Grothe.UpperChaos.OriginalRow227TriangleData1298
import Grothe.UpperChaos.OriginalRow227TriangleData1299
import Grothe.UpperChaos.OriginalRow227TriangleData1300
import Grothe.UpperChaos.OriginalRow227TriangleData1301

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow098

open ConditionalTableLookup

def values1292 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1292.coefficient98_97,
  OriginalRow227TriangleData1292.coefficient98_98,
  OriginalRow227TriangleData1292.coefficient98_99,
  OriginalRow227TriangleData1292.coefficient98_100,
  OriginalRow227TriangleData1292.coefficient98_101,
  OriginalRow227TriangleData1292.coefficient98_102,
  OriginalRow227TriangleData1292.coefficient98_103,
  OriginalRow227TriangleData1292.coefficient98_104,
  OriginalRow227TriangleData1292.coefficient98_105,
  OriginalRow227TriangleData1292.coefficient98_106,
  OriginalRow227TriangleData1292.coefficient98_107,
  OriginalRow227TriangleData1292.coefficient98_108,
  OriginalRow227TriangleData1292.coefficient98_109,
  OriginalRow227TriangleData1292.coefficient98_110,
  OriginalRow227TriangleData1292.coefficient98_111,
  OriginalRow227TriangleData1292.coefficient98_112,
  OriginalRow227TriangleData1292.coefficient98_113,
  OriginalRow227TriangleData1292.coefficient98_114,
  OriginalRow227TriangleData1292.coefficient98_115,
  OriginalRow227TriangleData1292.coefficient98_116,
  OriginalRow227TriangleData1292.coefficient98_117,
  OriginalRow227TriangleData1292.coefficient98_118,
  OriginalRow227TriangleData1292.coefficient98_119,
  OriginalRow227TriangleData1292.coefficient98_120,
  OriginalRow227TriangleData1292.coefficient98_121,
  OriginalRow227TriangleData1292.coefficient98_122,
  OriginalRow227TriangleData1292.coefficient98_123,
  OriginalRow227TriangleData1292.coefficient98_124,
  OriginalRow227TriangleData1292.coefficient98_125,
  OriginalRow227TriangleData1292.coefficient98_126,
  OriginalRow227TriangleData1292.coefficient98_127,
  OriginalRow227TriangleData1292.coefficient98_128
]

theorem values1292_size : values1292.size = 32 := rfl

def block1292 : ℕ → Option IntervalDyadic := segment 97 values1292

theorem block1292_domain : ExactDomain block1292 97 129 := by
  simpa only [values1292_size] using segment_domain 97 values1292

theorem block1292_get (i : Fin 32) :
    block1292 (97 + i.val) = some (values1292[i.val]'(by rw [values1292_size]; exact i.isLt)) := by
  exact segment_get 97 values1292 ⟨i.val, by rw [values1292_size]; exact i.isLt⟩

def values1293 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1293.coefficient98_129,
  OriginalRow227TriangleData1293.coefficient98_130,
  OriginalRow227TriangleData1293.coefficient98_131,
  OriginalRow227TriangleData1293.coefficient98_132,
  OriginalRow227TriangleData1293.coefficient98_133,
  OriginalRow227TriangleData1293.coefficient98_134,
  OriginalRow227TriangleData1293.coefficient98_135,
  OriginalRow227TriangleData1293.coefficient98_136,
  OriginalRow227TriangleData1293.coefficient98_137,
  OriginalRow227TriangleData1293.coefficient98_138,
  OriginalRow227TriangleData1293.coefficient98_139,
  OriginalRow227TriangleData1293.coefficient98_140,
  OriginalRow227TriangleData1293.coefficient98_141,
  OriginalRow227TriangleData1293.coefficient98_142,
  OriginalRow227TriangleData1293.coefficient98_143,
  OriginalRow227TriangleData1293.coefficient98_144,
  OriginalRow227TriangleData1293.coefficient98_145,
  OriginalRow227TriangleData1293.coefficient98_146,
  OriginalRow227TriangleData1293.coefficient98_147,
  OriginalRow227TriangleData1293.coefficient98_148,
  OriginalRow227TriangleData1293.coefficient98_149,
  OriginalRow227TriangleData1293.coefficient98_150,
  OriginalRow227TriangleData1293.coefficient98_151,
  OriginalRow227TriangleData1293.coefficient98_152,
  OriginalRow227TriangleData1293.coefficient98_153,
  OriginalRow227TriangleData1293.coefficient98_154,
  OriginalRow227TriangleData1293.coefficient98_155,
  OriginalRow227TriangleData1293.coefficient98_156,
  OriginalRow227TriangleData1293.coefficient98_157,
  OriginalRow227TriangleData1293.coefficient98_158,
  OriginalRow227TriangleData1293.coefficient98_159,
  OriginalRow227TriangleData1293.coefficient98_160
]

theorem values1293_size : values1293.size = 32 := rfl

def block1293 : ℕ → Option IntervalDyadic := segment 129 values1293

theorem block1293_domain : ExactDomain block1293 129 161 := by
  simpa only [values1293_size] using segment_domain 129 values1293

theorem block1293_get (i : Fin 32) :
    block1293 (129 + i.val) = some (values1293[i.val]'(by rw [values1293_size]; exact i.isLt)) := by
  exact segment_get 129 values1293 ⟨i.val, by rw [values1293_size]; exact i.isLt⟩

def values1294 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1294.coefficient98_161,
  OriginalRow227TriangleData1294.coefficient98_162,
  OriginalRow227TriangleData1294.coefficient98_163,
  OriginalRow227TriangleData1294.coefficient98_164,
  OriginalRow227TriangleData1294.coefficient98_165,
  OriginalRow227TriangleData1294.coefficient98_166,
  OriginalRow227TriangleData1294.coefficient98_167,
  OriginalRow227TriangleData1294.coefficient98_168,
  OriginalRow227TriangleData1294.coefficient98_169,
  OriginalRow227TriangleData1294.coefficient98_170,
  OriginalRow227TriangleData1294.coefficient98_171,
  OriginalRow227TriangleData1294.coefficient98_172,
  OriginalRow227TriangleData1294.coefficient98_173,
  OriginalRow227TriangleData1294.coefficient98_174,
  OriginalRow227TriangleData1294.coefficient98_175,
  OriginalRow227TriangleData1294.coefficient98_176,
  OriginalRow227TriangleData1294.coefficient98_177,
  OriginalRow227TriangleData1294.coefficient98_178,
  OriginalRow227TriangleData1294.coefficient98_179,
  OriginalRow227TriangleData1294.coefficient98_180,
  OriginalRow227TriangleData1294.coefficient98_181,
  OriginalRow227TriangleData1294.coefficient98_182,
  OriginalRow227TriangleData1294.coefficient98_183,
  OriginalRow227TriangleData1294.coefficient98_184,
  OriginalRow227TriangleData1294.coefficient98_185,
  OriginalRow227TriangleData1294.coefficient98_186,
  OriginalRow227TriangleData1294.coefficient98_187,
  OriginalRow227TriangleData1294.coefficient98_188,
  OriginalRow227TriangleData1294.coefficient98_189,
  OriginalRow227TriangleData1294.coefficient98_190,
  OriginalRow227TriangleData1294.coefficient98_191,
  OriginalRow227TriangleData1294.coefficient98_192
]

theorem values1294_size : values1294.size = 32 := rfl

def block1294 : ℕ → Option IntervalDyadic := segment 161 values1294

theorem block1294_domain : ExactDomain block1294 161 193 := by
  simpa only [values1294_size] using segment_domain 161 values1294

theorem block1294_get (i : Fin 32) :
    block1294 (161 + i.val) = some (values1294[i.val]'(by rw [values1294_size]; exact i.isLt)) := by
  exact segment_get 161 values1294 ⟨i.val, by rw [values1294_size]; exact i.isLt⟩

def values1295 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1295.coefficient98_193,
  OriginalRow227TriangleData1295.coefficient98_194,
  OriginalRow227TriangleData1295.coefficient98_195,
  OriginalRow227TriangleData1295.coefficient98_196,
  OriginalRow227TriangleData1295.coefficient98_197,
  OriginalRow227TriangleData1295.coefficient98_198,
  OriginalRow227TriangleData1295.coefficient98_199,
  OriginalRow227TriangleData1295.coefficient98_200,
  OriginalRow227TriangleData1295.coefficient98_201,
  OriginalRow227TriangleData1295.coefficient98_202,
  OriginalRow227TriangleData1295.coefficient98_203,
  OriginalRow227TriangleData1295.coefficient98_204,
  OriginalRow227TriangleData1295.coefficient98_205,
  OriginalRow227TriangleData1295.coefficient98_206,
  OriginalRow227TriangleData1295.coefficient98_207,
  OriginalRow227TriangleData1295.coefficient98_208,
  OriginalRow227TriangleData1295.coefficient98_209,
  OriginalRow227TriangleData1295.coefficient98_210,
  OriginalRow227TriangleData1295.coefficient98_211,
  OriginalRow227TriangleData1295.coefficient98_212,
  OriginalRow227TriangleData1295.coefficient98_213,
  OriginalRow227TriangleData1295.coefficient98_214,
  OriginalRow227TriangleData1295.coefficient98_215,
  OriginalRow227TriangleData1295.coefficient98_216,
  OriginalRow227TriangleData1295.coefficient98_217,
  OriginalRow227TriangleData1295.coefficient98_218,
  OriginalRow227TriangleData1295.coefficient98_219,
  OriginalRow227TriangleData1295.coefficient98_220,
  OriginalRow227TriangleData1295.coefficient98_221,
  OriginalRow227TriangleData1295.coefficient98_222,
  OriginalRow227TriangleData1295.coefficient98_223,
  OriginalRow227TriangleData1295.coefficient98_224
]

theorem values1295_size : values1295.size = 32 := rfl

def block1295 : ℕ → Option IntervalDyadic := segment 193 values1295

theorem block1295_domain : ExactDomain block1295 193 225 := by
  simpa only [values1295_size] using segment_domain 193 values1295

theorem block1295_get (i : Fin 32) :
    block1295 (193 + i.val) = some (values1295[i.val]'(by rw [values1295_size]; exact i.isLt)) := by
  exact segment_get 193 values1295 ⟨i.val, by rw [values1295_size]; exact i.isLt⟩

def values1296 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1296.coefficient98_225,
  OriginalRow227TriangleData1296.coefficient98_226,
  OriginalRow227TriangleData1296.coefficient98_227,
  OriginalRow227TriangleData1296.coefficient98_228,
  OriginalRow227TriangleData1296.coefficient98_229,
  OriginalRow227TriangleData1296.coefficient98_230,
  OriginalRow227TriangleData1296.coefficient98_231,
  OriginalRow227TriangleData1296.coefficient98_232,
  OriginalRow227TriangleData1296.coefficient98_233,
  OriginalRow227TriangleData1296.coefficient98_234,
  OriginalRow227TriangleData1296.coefficient98_235,
  OriginalRow227TriangleData1296.coefficient98_236,
  OriginalRow227TriangleData1296.coefficient98_237,
  OriginalRow227TriangleData1296.coefficient98_238,
  OriginalRow227TriangleData1296.coefficient98_239,
  OriginalRow227TriangleData1296.coefficient98_240,
  OriginalRow227TriangleData1296.coefficient98_241,
  OriginalRow227TriangleData1296.coefficient98_242,
  OriginalRow227TriangleData1296.coefficient98_243,
  OriginalRow227TriangleData1296.coefficient98_244,
  OriginalRow227TriangleData1296.coefficient98_245,
  OriginalRow227TriangleData1296.coefficient98_246,
  OriginalRow227TriangleData1296.coefficient98_247,
  OriginalRow227TriangleData1296.coefficient98_248,
  OriginalRow227TriangleData1296.coefficient98_249,
  OriginalRow227TriangleData1296.coefficient98_250,
  OriginalRow227TriangleData1296.coefficient98_251,
  OriginalRow227TriangleData1296.coefficient98_252,
  OriginalRow227TriangleData1296.coefficient98_253,
  OriginalRow227TriangleData1296.coefficient98_254,
  OriginalRow227TriangleData1296.coefficient98_255,
  OriginalRow227TriangleData1296.coefficient98_256
]

theorem values1296_size : values1296.size = 32 := rfl

def block1296 : ℕ → Option IntervalDyadic := segment 225 values1296

theorem block1296_domain : ExactDomain block1296 225 257 := by
  simpa only [values1296_size] using segment_domain 225 values1296

theorem block1296_get (i : Fin 32) :
    block1296 (225 + i.val) = some (values1296[i.val]'(by rw [values1296_size]; exact i.isLt)) := by
  exact segment_get 225 values1296 ⟨i.val, by rw [values1296_size]; exact i.isLt⟩

def values1297 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1297.coefficient98_257,
  OriginalRow227TriangleData1297.coefficient98_258,
  OriginalRow227TriangleData1297.coefficient98_259,
  OriginalRow227TriangleData1297.coefficient98_260,
  OriginalRow227TriangleData1297.coefficient98_261,
  OriginalRow227TriangleData1297.coefficient98_262,
  OriginalRow227TriangleData1297.coefficient98_263,
  OriginalRow227TriangleData1297.coefficient98_264,
  OriginalRow227TriangleData1297.coefficient98_265,
  OriginalRow227TriangleData1297.coefficient98_266,
  OriginalRow227TriangleData1297.coefficient98_267,
  OriginalRow227TriangleData1297.coefficient98_268,
  OriginalRow227TriangleData1297.coefficient98_269,
  OriginalRow227TriangleData1297.coefficient98_270,
  OriginalRow227TriangleData1297.coefficient98_271,
  OriginalRow227TriangleData1297.coefficient98_272,
  OriginalRow227TriangleData1297.coefficient98_273,
  OriginalRow227TriangleData1297.coefficient98_274,
  OriginalRow227TriangleData1297.coefficient98_275,
  OriginalRow227TriangleData1297.coefficient98_276,
  OriginalRow227TriangleData1297.coefficient98_277,
  OriginalRow227TriangleData1297.coefficient98_278,
  OriginalRow227TriangleData1297.coefficient98_279,
  OriginalRow227TriangleData1297.coefficient98_280,
  OriginalRow227TriangleData1297.coefficient98_281,
  OriginalRow227TriangleData1297.coefficient98_282,
  OriginalRow227TriangleData1297.coefficient98_283,
  OriginalRow227TriangleData1297.coefficient98_284,
  OriginalRow227TriangleData1297.coefficient98_285,
  OriginalRow227TriangleData1297.coefficient98_286,
  OriginalRow227TriangleData1297.coefficient98_287,
  OriginalRow227TriangleData1297.coefficient98_288
]

theorem values1297_size : values1297.size = 32 := rfl

def block1297 : ℕ → Option IntervalDyadic := segment 257 values1297

theorem block1297_domain : ExactDomain block1297 257 289 := by
  simpa only [values1297_size] using segment_domain 257 values1297

theorem block1297_get (i : Fin 32) :
    block1297 (257 + i.val) = some (values1297[i.val]'(by rw [values1297_size]; exact i.isLt)) := by
  exact segment_get 257 values1297 ⟨i.val, by rw [values1297_size]; exact i.isLt⟩

def values1298 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1298.coefficient98_289,
  OriginalRow227TriangleData1298.coefficient98_290,
  OriginalRow227TriangleData1298.coefficient98_291,
  OriginalRow227TriangleData1298.coefficient98_292,
  OriginalRow227TriangleData1298.coefficient98_293,
  OriginalRow227TriangleData1298.coefficient98_294,
  OriginalRow227TriangleData1298.coefficient98_295,
  OriginalRow227TriangleData1298.coefficient98_296,
  OriginalRow227TriangleData1298.coefficient98_297,
  OriginalRow227TriangleData1298.coefficient98_298,
  OriginalRow227TriangleData1298.coefficient98_299,
  OriginalRow227TriangleData1298.coefficient98_300,
  OriginalRow227TriangleData1298.coefficient98_301,
  OriginalRow227TriangleData1298.coefficient98_302,
  OriginalRow227TriangleData1298.coefficient98_303,
  OriginalRow227TriangleData1298.coefficient98_304,
  OriginalRow227TriangleData1298.coefficient98_305,
  OriginalRow227TriangleData1298.coefficient98_306,
  OriginalRow227TriangleData1298.coefficient98_307,
  OriginalRow227TriangleData1298.coefficient98_308,
  OriginalRow227TriangleData1298.coefficient98_309,
  OriginalRow227TriangleData1298.coefficient98_310,
  OriginalRow227TriangleData1298.coefficient98_311,
  OriginalRow227TriangleData1298.coefficient98_312,
  OriginalRow227TriangleData1298.coefficient98_313,
  OriginalRow227TriangleData1298.coefficient98_314,
  OriginalRow227TriangleData1298.coefficient98_315,
  OriginalRow227TriangleData1298.coefficient98_316,
  OriginalRow227TriangleData1298.coefficient98_317,
  OriginalRow227TriangleData1298.coefficient98_318,
  OriginalRow227TriangleData1298.coefficient98_319,
  OriginalRow227TriangleData1298.coefficient98_320
]

theorem values1298_size : values1298.size = 32 := rfl

def block1298 : ℕ → Option IntervalDyadic := segment 289 values1298

theorem block1298_domain : ExactDomain block1298 289 321 := by
  simpa only [values1298_size] using segment_domain 289 values1298

theorem block1298_get (i : Fin 32) :
    block1298 (289 + i.val) = some (values1298[i.val]'(by rw [values1298_size]; exact i.isLt)) := by
  exact segment_get 289 values1298 ⟨i.val, by rw [values1298_size]; exact i.isLt⟩

def values1299 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1299.coefficient98_321,
  OriginalRow227TriangleData1299.coefficient98_322,
  OriginalRow227TriangleData1299.coefficient98_323,
  OriginalRow227TriangleData1299.coefficient98_324,
  OriginalRow227TriangleData1299.coefficient98_325,
  OriginalRow227TriangleData1299.coefficient98_326,
  OriginalRow227TriangleData1299.coefficient98_327,
  OriginalRow227TriangleData1299.coefficient98_328,
  OriginalRow227TriangleData1299.coefficient98_329,
  OriginalRow227TriangleData1299.coefficient98_330,
  OriginalRow227TriangleData1299.coefficient98_331,
  OriginalRow227TriangleData1299.coefficient98_332,
  OriginalRow227TriangleData1299.coefficient98_333,
  OriginalRow227TriangleData1299.coefficient98_334,
  OriginalRow227TriangleData1299.coefficient98_335,
  OriginalRow227TriangleData1299.coefficient98_336,
  OriginalRow227TriangleData1299.coefficient98_337,
  OriginalRow227TriangleData1299.coefficient98_338,
  OriginalRow227TriangleData1299.coefficient98_339,
  OriginalRow227TriangleData1299.coefficient98_340,
  OriginalRow227TriangleData1299.coefficient98_341,
  OriginalRow227TriangleData1299.coefficient98_342,
  OriginalRow227TriangleData1299.coefficient98_343,
  OriginalRow227TriangleData1299.coefficient98_344,
  OriginalRow227TriangleData1299.coefficient98_345,
  OriginalRow227TriangleData1299.coefficient98_346,
  OriginalRow227TriangleData1299.coefficient98_347,
  OriginalRow227TriangleData1299.coefficient98_348,
  OriginalRow227TriangleData1299.coefficient98_349,
  OriginalRow227TriangleData1299.coefficient98_350,
  OriginalRow227TriangleData1299.coefficient98_351,
  OriginalRow227TriangleData1299.coefficient98_352
]

theorem values1299_size : values1299.size = 32 := rfl

def block1299 : ℕ → Option IntervalDyadic := segment 321 values1299

theorem block1299_domain : ExactDomain block1299 321 353 := by
  simpa only [values1299_size] using segment_domain 321 values1299

theorem block1299_get (i : Fin 32) :
    block1299 (321 + i.val) = some (values1299[i.val]'(by rw [values1299_size]; exact i.isLt)) := by
  exact segment_get 321 values1299 ⟨i.val, by rw [values1299_size]; exact i.isLt⟩

def values1300 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1300.coefficient98_353,
  OriginalRow227TriangleData1300.coefficient98_354,
  OriginalRow227TriangleData1300.coefficient98_355,
  OriginalRow227TriangleData1300.coefficient98_356,
  OriginalRow227TriangleData1300.coefficient98_357,
  OriginalRow227TriangleData1300.coefficient98_358,
  OriginalRow227TriangleData1300.coefficient98_359,
  OriginalRow227TriangleData1300.coefficient98_360,
  OriginalRow227TriangleData1300.coefficient98_361,
  OriginalRow227TriangleData1300.coefficient98_362,
  OriginalRow227TriangleData1300.coefficient98_363,
  OriginalRow227TriangleData1300.coefficient98_364,
  OriginalRow227TriangleData1300.coefficient98_365,
  OriginalRow227TriangleData1300.coefficient98_366,
  OriginalRow227TriangleData1300.coefficient98_367,
  OriginalRow227TriangleData1300.coefficient98_368,
  OriginalRow227TriangleData1300.coefficient98_369,
  OriginalRow227TriangleData1300.coefficient98_370,
  OriginalRow227TriangleData1300.coefficient98_371,
  OriginalRow227TriangleData1300.coefficient98_372,
  OriginalRow227TriangleData1300.coefficient98_373,
  OriginalRow227TriangleData1300.coefficient98_374,
  OriginalRow227TriangleData1300.coefficient98_375,
  OriginalRow227TriangleData1300.coefficient98_376,
  OriginalRow227TriangleData1300.coefficient98_377,
  OriginalRow227TriangleData1300.coefficient98_378,
  OriginalRow227TriangleData1300.coefficient98_379,
  OriginalRow227TriangleData1300.coefficient98_380,
  OriginalRow227TriangleData1300.coefficient98_381,
  OriginalRow227TriangleData1300.coefficient98_382,
  OriginalRow227TriangleData1300.coefficient98_383,
  OriginalRow227TriangleData1300.coefficient98_384
]

theorem values1300_size : values1300.size = 32 := rfl

def block1300 : ℕ → Option IntervalDyadic := segment 353 values1300

theorem block1300_domain : ExactDomain block1300 353 385 := by
  simpa only [values1300_size] using segment_domain 353 values1300

theorem block1300_get (i : Fin 32) :
    block1300 (353 + i.val) = some (values1300[i.val]'(by rw [values1300_size]; exact i.isLt)) := by
  exact segment_get 353 values1300 ⟨i.val, by rw [values1300_size]; exact i.isLt⟩

def values1301 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1301.coefficient98_385,
  OriginalRow227TriangleData1301.coefficient98_386,
  OriginalRow227TriangleData1301.coefficient98_387,
  OriginalRow227TriangleData1301.coefficient98_388,
  OriginalRow227TriangleData1301.coefficient98_389,
  OriginalRow227TriangleData1301.coefficient98_390,
  OriginalRow227TriangleData1301.coefficient98_391,
  OriginalRow227TriangleData1301.coefficient98_392,
  OriginalRow227TriangleData1301.coefficient98_393,
  OriginalRow227TriangleData1301.coefficient98_394,
  OriginalRow227TriangleData1301.coefficient98_395,
  OriginalRow227TriangleData1301.coefficient98_396,
  OriginalRow227TriangleData1301.coefficient98_397,
  OriginalRow227TriangleData1301.coefficient98_398,
  OriginalRow227TriangleData1301.coefficient98_399,
  OriginalRow227TriangleData1301.coefficient98_400,
  OriginalRow227TriangleData1301.coefficient98_401,
  OriginalRow227TriangleData1301.coefficient98_402,
  OriginalRow227TriangleData1301.coefficient98_403
]

theorem values1301_size : values1301.size = 19 := rfl

def block1301 : ℕ → Option IntervalDyadic := segment 385 values1301

theorem block1301_domain : ExactDomain block1301 385 404 := by
  simpa only [values1301_size] using segment_domain 385 values1301

theorem block1301_get (i : Fin 19) :
    block1301 (385 + i.val) = some (values1301[i.val]'(by rw [values1301_size]; exact i.isLt)) := by
  exact segment_get 385 values1301 ⟨i.val, by rw [values1301_size]; exact i.isLt⟩

def node0097_0161 : ℕ → Option IntervalDyadic := split 129 block1292 block1293

theorem node0097_0161_domain : ExactDomain node0097_0161 97 161 := by
  exact split_domain (by decide) (by decide) block1292_domain block1293_domain

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block1295 block1296

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block1295_domain block1296_domain

def node0161_0257 : ℕ → Option IntervalDyadic := split 193 block1294 node0193_0257

theorem node0161_0257_domain : ExactDomain node0161_0257 161 257 := by
  exact split_domain (by decide) (by decide) block1294_domain node0193_0257_domain

def node0097_0257 : ℕ → Option IntervalDyadic := split 161 node0097_0161 node0161_0257

theorem node0097_0257_domain : ExactDomain node0097_0257 97 257 := by
  exact split_domain (by decide) (by decide) node0097_0161_domain node0161_0257_domain

def node0257_0321 : ℕ → Option IntervalDyadic := split 289 block1297 block1298

theorem node0257_0321_domain : ExactDomain node0257_0321 257 321 := by
  exact split_domain (by decide) (by decide) block1297_domain block1298_domain

def node0353_0404 : ℕ → Option IntervalDyadic := split 385 block1300 block1301

theorem node0353_0404_domain : ExactDomain node0353_0404 353 404 := by
  exact split_domain (by decide) (by decide) block1300_domain block1301_domain

def node0321_0404 : ℕ → Option IntervalDyadic := split 353 block1299 node0353_0404

theorem node0321_0404_domain : ExactDomain node0321_0404 321 404 := by
  exact split_domain (by decide) (by decide) block1299_domain node0353_0404_domain

def node0257_0404 : ℕ → Option IntervalDyadic := split 321 node0257_0321 node0321_0404

theorem node0257_0404_domain : ExactDomain node0257_0404 257 404 := by
  exact split_domain (by decide) (by decide) node0257_0321_domain node0321_0404_domain

def node0097_0404 : ℕ → Option IntervalDyadic := split 257 node0097_0257 node0257_0404

theorem node0097_0404_domain : ExactDomain node0097_0404 97 404 := by
  exact split_domain (by decide) (by decide) node0097_0257_domain node0257_0404_domain

def lookup : ℕ → Option IntervalDyadic := node0097_0404

theorem lookup_domain : ExactDomain lookup 97 404 :=
  node0097_0404_domain

theorem block1292_lookup (i : Fin 32) :
    lookup (97 + i.val) = some (values1292[i.val]'(by rw [values1292_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (97 + i.val) = _
  rw [node0097_0404, split_left 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0097_0257, split_left 161 node0097_0161 node0161_0257 (by omega)]
  rw [node0097_0161, split_left 129 block1292 block1293 (by omega)]
  exact block1292_get i

theorem block1293_lookup (i : Fin 32) :
    lookup (129 + i.val) = some (values1293[i.val]'(by rw [values1293_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (129 + i.val) = _
  rw [node0097_0404, split_left 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0097_0257, split_left 161 node0097_0161 node0161_0257 (by omega)]
  rw [node0097_0161, split_right 129 block1292 block1293 (by omega)]
  exact block1293_get i

theorem block1294_lookup (i : Fin 32) :
    lookup (161 + i.val) = some (values1294[i.val]'(by rw [values1294_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (161 + i.val) = _
  rw [node0097_0404, split_left 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0097_0257, split_right 161 node0097_0161 node0161_0257 (by omega)]
  rw [node0161_0257, split_left 193 block1294 node0193_0257 (by omega)]
  exact block1294_get i

theorem block1295_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values1295[i.val]'(by rw [values1295_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (193 + i.val) = _
  rw [node0097_0404, split_left 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0097_0257, split_right 161 node0097_0161 node0161_0257 (by omega)]
  rw [node0161_0257, split_right 193 block1294 node0193_0257 (by omega)]
  rw [node0193_0257, split_left 225 block1295 block1296 (by omega)]
  exact block1295_get i

theorem block1296_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values1296[i.val]'(by rw [values1296_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (225 + i.val) = _
  rw [node0097_0404, split_left 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0097_0257, split_right 161 node0097_0161 node0161_0257 (by omega)]
  rw [node0161_0257, split_right 193 block1294 node0193_0257 (by omega)]
  rw [node0193_0257, split_right 225 block1295 block1296 (by omega)]
  exact block1296_get i

theorem block1297_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values1297[i.val]'(by rw [values1297_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (257 + i.val) = _
  rw [node0097_0404, split_right 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0257_0404, split_left 321 node0257_0321 node0321_0404 (by omega)]
  rw [node0257_0321, split_left 289 block1297 block1298 (by omega)]
  exact block1297_get i

theorem block1298_lookup (i : Fin 32) :
    lookup (289 + i.val) = some (values1298[i.val]'(by rw [values1298_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (289 + i.val) = _
  rw [node0097_0404, split_right 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0257_0404, split_left 321 node0257_0321 node0321_0404 (by omega)]
  rw [node0257_0321, split_right 289 block1297 block1298 (by omega)]
  exact block1298_get i

theorem block1299_lookup (i : Fin 32) :
    lookup (321 + i.val) = some (values1299[i.val]'(by rw [values1299_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (321 + i.val) = _
  rw [node0097_0404, split_right 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0257_0404, split_right 321 node0257_0321 node0321_0404 (by omega)]
  rw [node0321_0404, split_left 353 block1299 node0353_0404 (by omega)]
  exact block1299_get i

theorem block1300_lookup (i : Fin 32) :
    lookup (353 + i.val) = some (values1300[i.val]'(by rw [values1300_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (353 + i.val) = _
  rw [node0097_0404, split_right 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0257_0404, split_right 321 node0257_0321 node0321_0404 (by omega)]
  rw [node0321_0404, split_right 353 block1299 node0353_0404 (by omega)]
  rw [node0353_0404, split_left 385 block1300 block1301 (by omega)]
  exact block1300_get i

theorem block1301_lookup (i : Fin 19) :
    lookup (385 + i.val) = some (values1301[i.val]'(by rw [values1301_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0097_0404 (385 + i.val) = _
  rw [node0097_0404, split_right 257 node0097_0257 node0257_0404 (by omega)]
  rw [node0257_0404, split_right 321 node0257_0321 node0321_0404 (by omega)]
  rw [node0321_0404, split_right 353 block1299 node0353_0404 (by omega)]
  rw [node0353_0404, split_right 385 block1300 block1301 (by omega)]
  exact block1301_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1292_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1292_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1293_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1293_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1294_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1294_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1295_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1295_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1296_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1296_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1297_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1297_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1298_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1298_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1299_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1299_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1300_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1300_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1301_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1301_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1292_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1293_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1294_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1295_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1296_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1297_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1298_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1299_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1300_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow098.block1301_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow098
