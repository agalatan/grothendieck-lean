import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1282
import Grothe.UpperChaos.OriginalRow227TriangleData1283
import Grothe.UpperChaos.OriginalRow227TriangleData1284
import Grothe.UpperChaos.OriginalRow227TriangleData1285
import Grothe.UpperChaos.OriginalRow227TriangleData1286
import Grothe.UpperChaos.OriginalRow227TriangleData1287
import Grothe.UpperChaos.OriginalRow227TriangleData1288
import Grothe.UpperChaos.OriginalRow227TriangleData1289
import Grothe.UpperChaos.OriginalRow227TriangleData1290
import Grothe.UpperChaos.OriginalRow227TriangleData1291

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow097

open ConditionalTableLookup

def values1282 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1282.coefficient97_96,
  OriginalRow227TriangleData1282.coefficient97_97,
  OriginalRow227TriangleData1282.coefficient97_98,
  OriginalRow227TriangleData1282.coefficient97_99,
  OriginalRow227TriangleData1282.coefficient97_100,
  OriginalRow227TriangleData1282.coefficient97_101,
  OriginalRow227TriangleData1282.coefficient97_102,
  OriginalRow227TriangleData1282.coefficient97_103,
  OriginalRow227TriangleData1282.coefficient97_104,
  OriginalRow227TriangleData1282.coefficient97_105,
  OriginalRow227TriangleData1282.coefficient97_106,
  OriginalRow227TriangleData1282.coefficient97_107,
  OriginalRow227TriangleData1282.coefficient97_108,
  OriginalRow227TriangleData1282.coefficient97_109,
  OriginalRow227TriangleData1282.coefficient97_110,
  OriginalRow227TriangleData1282.coefficient97_111,
  OriginalRow227TriangleData1282.coefficient97_112,
  OriginalRow227TriangleData1282.coefficient97_113,
  OriginalRow227TriangleData1282.coefficient97_114,
  OriginalRow227TriangleData1282.coefficient97_115,
  OriginalRow227TriangleData1282.coefficient97_116,
  OriginalRow227TriangleData1282.coefficient97_117,
  OriginalRow227TriangleData1282.coefficient97_118,
  OriginalRow227TriangleData1282.coefficient97_119,
  OriginalRow227TriangleData1282.coefficient97_120,
  OriginalRow227TriangleData1282.coefficient97_121,
  OriginalRow227TriangleData1282.coefficient97_122,
  OriginalRow227TriangleData1282.coefficient97_123,
  OriginalRow227TriangleData1282.coefficient97_124,
  OriginalRow227TriangleData1282.coefficient97_125,
  OriginalRow227TriangleData1282.coefficient97_126,
  OriginalRow227TriangleData1282.coefficient97_127
]

theorem values1282_size : values1282.size = 32 := rfl

def block1282 : ℕ → Option IntervalDyadic := segment 96 values1282

theorem block1282_domain : ExactDomain block1282 96 128 := by
  simpa only [values1282_size] using segment_domain 96 values1282

theorem block1282_get (i : Fin 32) :
    block1282 (96 + i.val) = some (values1282[i.val]'(by rw [values1282_size]; exact i.isLt)) := by
  exact segment_get 96 values1282 ⟨i.val, by rw [values1282_size]; exact i.isLt⟩

def values1283 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1283.coefficient97_128,
  OriginalRow227TriangleData1283.coefficient97_129,
  OriginalRow227TriangleData1283.coefficient97_130,
  OriginalRow227TriangleData1283.coefficient97_131,
  OriginalRow227TriangleData1283.coefficient97_132,
  OriginalRow227TriangleData1283.coefficient97_133,
  OriginalRow227TriangleData1283.coefficient97_134,
  OriginalRow227TriangleData1283.coefficient97_135,
  OriginalRow227TriangleData1283.coefficient97_136,
  OriginalRow227TriangleData1283.coefficient97_137,
  OriginalRow227TriangleData1283.coefficient97_138,
  OriginalRow227TriangleData1283.coefficient97_139,
  OriginalRow227TriangleData1283.coefficient97_140,
  OriginalRow227TriangleData1283.coefficient97_141,
  OriginalRow227TriangleData1283.coefficient97_142,
  OriginalRow227TriangleData1283.coefficient97_143,
  OriginalRow227TriangleData1283.coefficient97_144,
  OriginalRow227TriangleData1283.coefficient97_145,
  OriginalRow227TriangleData1283.coefficient97_146,
  OriginalRow227TriangleData1283.coefficient97_147,
  OriginalRow227TriangleData1283.coefficient97_148,
  OriginalRow227TriangleData1283.coefficient97_149,
  OriginalRow227TriangleData1283.coefficient97_150,
  OriginalRow227TriangleData1283.coefficient97_151,
  OriginalRow227TriangleData1283.coefficient97_152,
  OriginalRow227TriangleData1283.coefficient97_153,
  OriginalRow227TriangleData1283.coefficient97_154,
  OriginalRow227TriangleData1283.coefficient97_155,
  OriginalRow227TriangleData1283.coefficient97_156,
  OriginalRow227TriangleData1283.coefficient97_157,
  OriginalRow227TriangleData1283.coefficient97_158,
  OriginalRow227TriangleData1283.coefficient97_159
]

theorem values1283_size : values1283.size = 32 := rfl

def block1283 : ℕ → Option IntervalDyadic := segment 128 values1283

theorem block1283_domain : ExactDomain block1283 128 160 := by
  simpa only [values1283_size] using segment_domain 128 values1283

theorem block1283_get (i : Fin 32) :
    block1283 (128 + i.val) = some (values1283[i.val]'(by rw [values1283_size]; exact i.isLt)) := by
  exact segment_get 128 values1283 ⟨i.val, by rw [values1283_size]; exact i.isLt⟩

def values1284 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1284.coefficient97_160,
  OriginalRow227TriangleData1284.coefficient97_161,
  OriginalRow227TriangleData1284.coefficient97_162,
  OriginalRow227TriangleData1284.coefficient97_163,
  OriginalRow227TriangleData1284.coefficient97_164,
  OriginalRow227TriangleData1284.coefficient97_165,
  OriginalRow227TriangleData1284.coefficient97_166,
  OriginalRow227TriangleData1284.coefficient97_167,
  OriginalRow227TriangleData1284.coefficient97_168,
  OriginalRow227TriangleData1284.coefficient97_169,
  OriginalRow227TriangleData1284.coefficient97_170,
  OriginalRow227TriangleData1284.coefficient97_171,
  OriginalRow227TriangleData1284.coefficient97_172,
  OriginalRow227TriangleData1284.coefficient97_173,
  OriginalRow227TriangleData1284.coefficient97_174,
  OriginalRow227TriangleData1284.coefficient97_175,
  OriginalRow227TriangleData1284.coefficient97_176,
  OriginalRow227TriangleData1284.coefficient97_177,
  OriginalRow227TriangleData1284.coefficient97_178,
  OriginalRow227TriangleData1284.coefficient97_179,
  OriginalRow227TriangleData1284.coefficient97_180,
  OriginalRow227TriangleData1284.coefficient97_181,
  OriginalRow227TriangleData1284.coefficient97_182,
  OriginalRow227TriangleData1284.coefficient97_183,
  OriginalRow227TriangleData1284.coefficient97_184,
  OriginalRow227TriangleData1284.coefficient97_185,
  OriginalRow227TriangleData1284.coefficient97_186,
  OriginalRow227TriangleData1284.coefficient97_187,
  OriginalRow227TriangleData1284.coefficient97_188,
  OriginalRow227TriangleData1284.coefficient97_189,
  OriginalRow227TriangleData1284.coefficient97_190,
  OriginalRow227TriangleData1284.coefficient97_191
]

theorem values1284_size : values1284.size = 32 := rfl

def block1284 : ℕ → Option IntervalDyadic := segment 160 values1284

theorem block1284_domain : ExactDomain block1284 160 192 := by
  simpa only [values1284_size] using segment_domain 160 values1284

theorem block1284_get (i : Fin 32) :
    block1284 (160 + i.val) = some (values1284[i.val]'(by rw [values1284_size]; exact i.isLt)) := by
  exact segment_get 160 values1284 ⟨i.val, by rw [values1284_size]; exact i.isLt⟩

def values1285 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1285.coefficient97_192,
  OriginalRow227TriangleData1285.coefficient97_193,
  OriginalRow227TriangleData1285.coefficient97_194,
  OriginalRow227TriangleData1285.coefficient97_195,
  OriginalRow227TriangleData1285.coefficient97_196,
  OriginalRow227TriangleData1285.coefficient97_197,
  OriginalRow227TriangleData1285.coefficient97_198,
  OriginalRow227TriangleData1285.coefficient97_199,
  OriginalRow227TriangleData1285.coefficient97_200,
  OriginalRow227TriangleData1285.coefficient97_201,
  OriginalRow227TriangleData1285.coefficient97_202,
  OriginalRow227TriangleData1285.coefficient97_203,
  OriginalRow227TriangleData1285.coefficient97_204,
  OriginalRow227TriangleData1285.coefficient97_205,
  OriginalRow227TriangleData1285.coefficient97_206,
  OriginalRow227TriangleData1285.coefficient97_207,
  OriginalRow227TriangleData1285.coefficient97_208,
  OriginalRow227TriangleData1285.coefficient97_209,
  OriginalRow227TriangleData1285.coefficient97_210,
  OriginalRow227TriangleData1285.coefficient97_211,
  OriginalRow227TriangleData1285.coefficient97_212,
  OriginalRow227TriangleData1285.coefficient97_213,
  OriginalRow227TriangleData1285.coefficient97_214,
  OriginalRow227TriangleData1285.coefficient97_215,
  OriginalRow227TriangleData1285.coefficient97_216,
  OriginalRow227TriangleData1285.coefficient97_217,
  OriginalRow227TriangleData1285.coefficient97_218,
  OriginalRow227TriangleData1285.coefficient97_219,
  OriginalRow227TriangleData1285.coefficient97_220,
  OriginalRow227TriangleData1285.coefficient97_221,
  OriginalRow227TriangleData1285.coefficient97_222,
  OriginalRow227TriangleData1285.coefficient97_223
]

theorem values1285_size : values1285.size = 32 := rfl

def block1285 : ℕ → Option IntervalDyadic := segment 192 values1285

theorem block1285_domain : ExactDomain block1285 192 224 := by
  simpa only [values1285_size] using segment_domain 192 values1285

theorem block1285_get (i : Fin 32) :
    block1285 (192 + i.val) = some (values1285[i.val]'(by rw [values1285_size]; exact i.isLt)) := by
  exact segment_get 192 values1285 ⟨i.val, by rw [values1285_size]; exact i.isLt⟩

def values1286 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1286.coefficient97_224,
  OriginalRow227TriangleData1286.coefficient97_225,
  OriginalRow227TriangleData1286.coefficient97_226,
  OriginalRow227TriangleData1286.coefficient97_227,
  OriginalRow227TriangleData1286.coefficient97_228,
  OriginalRow227TriangleData1286.coefficient97_229,
  OriginalRow227TriangleData1286.coefficient97_230,
  OriginalRow227TriangleData1286.coefficient97_231,
  OriginalRow227TriangleData1286.coefficient97_232,
  OriginalRow227TriangleData1286.coefficient97_233,
  OriginalRow227TriangleData1286.coefficient97_234,
  OriginalRow227TriangleData1286.coefficient97_235,
  OriginalRow227TriangleData1286.coefficient97_236,
  OriginalRow227TriangleData1286.coefficient97_237,
  OriginalRow227TriangleData1286.coefficient97_238,
  OriginalRow227TriangleData1286.coefficient97_239,
  OriginalRow227TriangleData1286.coefficient97_240,
  OriginalRow227TriangleData1286.coefficient97_241,
  OriginalRow227TriangleData1286.coefficient97_242,
  OriginalRow227TriangleData1286.coefficient97_243,
  OriginalRow227TriangleData1286.coefficient97_244,
  OriginalRow227TriangleData1286.coefficient97_245,
  OriginalRow227TriangleData1286.coefficient97_246,
  OriginalRow227TriangleData1286.coefficient97_247,
  OriginalRow227TriangleData1286.coefficient97_248,
  OriginalRow227TriangleData1286.coefficient97_249,
  OriginalRow227TriangleData1286.coefficient97_250,
  OriginalRow227TriangleData1286.coefficient97_251,
  OriginalRow227TriangleData1286.coefficient97_252,
  OriginalRow227TriangleData1286.coefficient97_253,
  OriginalRow227TriangleData1286.coefficient97_254,
  OriginalRow227TriangleData1286.coefficient97_255
]

theorem values1286_size : values1286.size = 32 := rfl

def block1286 : ℕ → Option IntervalDyadic := segment 224 values1286

theorem block1286_domain : ExactDomain block1286 224 256 := by
  simpa only [values1286_size] using segment_domain 224 values1286

theorem block1286_get (i : Fin 32) :
    block1286 (224 + i.val) = some (values1286[i.val]'(by rw [values1286_size]; exact i.isLt)) := by
  exact segment_get 224 values1286 ⟨i.val, by rw [values1286_size]; exact i.isLt⟩

def values1287 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1287.coefficient97_256,
  OriginalRow227TriangleData1287.coefficient97_257,
  OriginalRow227TriangleData1287.coefficient97_258,
  OriginalRow227TriangleData1287.coefficient97_259,
  OriginalRow227TriangleData1287.coefficient97_260,
  OriginalRow227TriangleData1287.coefficient97_261,
  OriginalRow227TriangleData1287.coefficient97_262,
  OriginalRow227TriangleData1287.coefficient97_263,
  OriginalRow227TriangleData1287.coefficient97_264,
  OriginalRow227TriangleData1287.coefficient97_265,
  OriginalRow227TriangleData1287.coefficient97_266,
  OriginalRow227TriangleData1287.coefficient97_267,
  OriginalRow227TriangleData1287.coefficient97_268,
  OriginalRow227TriangleData1287.coefficient97_269,
  OriginalRow227TriangleData1287.coefficient97_270,
  OriginalRow227TriangleData1287.coefficient97_271,
  OriginalRow227TriangleData1287.coefficient97_272,
  OriginalRow227TriangleData1287.coefficient97_273,
  OriginalRow227TriangleData1287.coefficient97_274,
  OriginalRow227TriangleData1287.coefficient97_275,
  OriginalRow227TriangleData1287.coefficient97_276,
  OriginalRow227TriangleData1287.coefficient97_277,
  OriginalRow227TriangleData1287.coefficient97_278,
  OriginalRow227TriangleData1287.coefficient97_279,
  OriginalRow227TriangleData1287.coefficient97_280,
  OriginalRow227TriangleData1287.coefficient97_281,
  OriginalRow227TriangleData1287.coefficient97_282,
  OriginalRow227TriangleData1287.coefficient97_283,
  OriginalRow227TriangleData1287.coefficient97_284,
  OriginalRow227TriangleData1287.coefficient97_285,
  OriginalRow227TriangleData1287.coefficient97_286,
  OriginalRow227TriangleData1287.coefficient97_287
]

theorem values1287_size : values1287.size = 32 := rfl

def block1287 : ℕ → Option IntervalDyadic := segment 256 values1287

theorem block1287_domain : ExactDomain block1287 256 288 := by
  simpa only [values1287_size] using segment_domain 256 values1287

theorem block1287_get (i : Fin 32) :
    block1287 (256 + i.val) = some (values1287[i.val]'(by rw [values1287_size]; exact i.isLt)) := by
  exact segment_get 256 values1287 ⟨i.val, by rw [values1287_size]; exact i.isLt⟩

def values1288 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1288.coefficient97_288,
  OriginalRow227TriangleData1288.coefficient97_289,
  OriginalRow227TriangleData1288.coefficient97_290,
  OriginalRow227TriangleData1288.coefficient97_291,
  OriginalRow227TriangleData1288.coefficient97_292,
  OriginalRow227TriangleData1288.coefficient97_293,
  OriginalRow227TriangleData1288.coefficient97_294,
  OriginalRow227TriangleData1288.coefficient97_295,
  OriginalRow227TriangleData1288.coefficient97_296,
  OriginalRow227TriangleData1288.coefficient97_297,
  OriginalRow227TriangleData1288.coefficient97_298,
  OriginalRow227TriangleData1288.coefficient97_299,
  OriginalRow227TriangleData1288.coefficient97_300,
  OriginalRow227TriangleData1288.coefficient97_301,
  OriginalRow227TriangleData1288.coefficient97_302,
  OriginalRow227TriangleData1288.coefficient97_303,
  OriginalRow227TriangleData1288.coefficient97_304,
  OriginalRow227TriangleData1288.coefficient97_305,
  OriginalRow227TriangleData1288.coefficient97_306,
  OriginalRow227TriangleData1288.coefficient97_307,
  OriginalRow227TriangleData1288.coefficient97_308,
  OriginalRow227TriangleData1288.coefficient97_309,
  OriginalRow227TriangleData1288.coefficient97_310,
  OriginalRow227TriangleData1288.coefficient97_311,
  OriginalRow227TriangleData1288.coefficient97_312,
  OriginalRow227TriangleData1288.coefficient97_313,
  OriginalRow227TriangleData1288.coefficient97_314,
  OriginalRow227TriangleData1288.coefficient97_315,
  OriginalRow227TriangleData1288.coefficient97_316,
  OriginalRow227TriangleData1288.coefficient97_317,
  OriginalRow227TriangleData1288.coefficient97_318,
  OriginalRow227TriangleData1288.coefficient97_319
]

theorem values1288_size : values1288.size = 32 := rfl

def block1288 : ℕ → Option IntervalDyadic := segment 288 values1288

theorem block1288_domain : ExactDomain block1288 288 320 := by
  simpa only [values1288_size] using segment_domain 288 values1288

theorem block1288_get (i : Fin 32) :
    block1288 (288 + i.val) = some (values1288[i.val]'(by rw [values1288_size]; exact i.isLt)) := by
  exact segment_get 288 values1288 ⟨i.val, by rw [values1288_size]; exact i.isLt⟩

def values1289 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1289.coefficient97_320,
  OriginalRow227TriangleData1289.coefficient97_321,
  OriginalRow227TriangleData1289.coefficient97_322,
  OriginalRow227TriangleData1289.coefficient97_323,
  OriginalRow227TriangleData1289.coefficient97_324,
  OriginalRow227TriangleData1289.coefficient97_325,
  OriginalRow227TriangleData1289.coefficient97_326,
  OriginalRow227TriangleData1289.coefficient97_327,
  OriginalRow227TriangleData1289.coefficient97_328,
  OriginalRow227TriangleData1289.coefficient97_329,
  OriginalRow227TriangleData1289.coefficient97_330,
  OriginalRow227TriangleData1289.coefficient97_331,
  OriginalRow227TriangleData1289.coefficient97_332,
  OriginalRow227TriangleData1289.coefficient97_333,
  OriginalRow227TriangleData1289.coefficient97_334,
  OriginalRow227TriangleData1289.coefficient97_335,
  OriginalRow227TriangleData1289.coefficient97_336,
  OriginalRow227TriangleData1289.coefficient97_337,
  OriginalRow227TriangleData1289.coefficient97_338,
  OriginalRow227TriangleData1289.coefficient97_339,
  OriginalRow227TriangleData1289.coefficient97_340,
  OriginalRow227TriangleData1289.coefficient97_341,
  OriginalRow227TriangleData1289.coefficient97_342,
  OriginalRow227TriangleData1289.coefficient97_343,
  OriginalRow227TriangleData1289.coefficient97_344,
  OriginalRow227TriangleData1289.coefficient97_345,
  OriginalRow227TriangleData1289.coefficient97_346,
  OriginalRow227TriangleData1289.coefficient97_347,
  OriginalRow227TriangleData1289.coefficient97_348,
  OriginalRow227TriangleData1289.coefficient97_349,
  OriginalRow227TriangleData1289.coefficient97_350,
  OriginalRow227TriangleData1289.coefficient97_351
]

theorem values1289_size : values1289.size = 32 := rfl

def block1289 : ℕ → Option IntervalDyadic := segment 320 values1289

theorem block1289_domain : ExactDomain block1289 320 352 := by
  simpa only [values1289_size] using segment_domain 320 values1289

theorem block1289_get (i : Fin 32) :
    block1289 (320 + i.val) = some (values1289[i.val]'(by rw [values1289_size]; exact i.isLt)) := by
  exact segment_get 320 values1289 ⟨i.val, by rw [values1289_size]; exact i.isLt⟩

def values1290 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1290.coefficient97_352,
  OriginalRow227TriangleData1290.coefficient97_353,
  OriginalRow227TriangleData1290.coefficient97_354,
  OriginalRow227TriangleData1290.coefficient97_355,
  OriginalRow227TriangleData1290.coefficient97_356,
  OriginalRow227TriangleData1290.coefficient97_357,
  OriginalRow227TriangleData1290.coefficient97_358,
  OriginalRow227TriangleData1290.coefficient97_359,
  OriginalRow227TriangleData1290.coefficient97_360,
  OriginalRow227TriangleData1290.coefficient97_361,
  OriginalRow227TriangleData1290.coefficient97_362,
  OriginalRow227TriangleData1290.coefficient97_363,
  OriginalRow227TriangleData1290.coefficient97_364,
  OriginalRow227TriangleData1290.coefficient97_365,
  OriginalRow227TriangleData1290.coefficient97_366,
  OriginalRow227TriangleData1290.coefficient97_367,
  OriginalRow227TriangleData1290.coefficient97_368,
  OriginalRow227TriangleData1290.coefficient97_369,
  OriginalRow227TriangleData1290.coefficient97_370,
  OriginalRow227TriangleData1290.coefficient97_371,
  OriginalRow227TriangleData1290.coefficient97_372,
  OriginalRow227TriangleData1290.coefficient97_373,
  OriginalRow227TriangleData1290.coefficient97_374,
  OriginalRow227TriangleData1290.coefficient97_375,
  OriginalRow227TriangleData1290.coefficient97_376,
  OriginalRow227TriangleData1290.coefficient97_377,
  OriginalRow227TriangleData1290.coefficient97_378,
  OriginalRow227TriangleData1290.coefficient97_379,
  OriginalRow227TriangleData1290.coefficient97_380,
  OriginalRow227TriangleData1290.coefficient97_381,
  OriginalRow227TriangleData1290.coefficient97_382,
  OriginalRow227TriangleData1290.coefficient97_383
]

theorem values1290_size : values1290.size = 32 := rfl

def block1290 : ℕ → Option IntervalDyadic := segment 352 values1290

theorem block1290_domain : ExactDomain block1290 352 384 := by
  simpa only [values1290_size] using segment_domain 352 values1290

theorem block1290_get (i : Fin 32) :
    block1290 (352 + i.val) = some (values1290[i.val]'(by rw [values1290_size]; exact i.isLt)) := by
  exact segment_get 352 values1290 ⟨i.val, by rw [values1290_size]; exact i.isLt⟩

def values1291 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1291.coefficient97_384,
  OriginalRow227TriangleData1291.coefficient97_385,
  OriginalRow227TriangleData1291.coefficient97_386,
  OriginalRow227TriangleData1291.coefficient97_387,
  OriginalRow227TriangleData1291.coefficient97_388,
  OriginalRow227TriangleData1291.coefficient97_389,
  OriginalRow227TriangleData1291.coefficient97_390,
  OriginalRow227TriangleData1291.coefficient97_391,
  OriginalRow227TriangleData1291.coefficient97_392,
  OriginalRow227TriangleData1291.coefficient97_393,
  OriginalRow227TriangleData1291.coefficient97_394,
  OriginalRow227TriangleData1291.coefficient97_395,
  OriginalRow227TriangleData1291.coefficient97_396,
  OriginalRow227TriangleData1291.coefficient97_397,
  OriginalRow227TriangleData1291.coefficient97_398,
  OriginalRow227TriangleData1291.coefficient97_399,
  OriginalRow227TriangleData1291.coefficient97_400,
  OriginalRow227TriangleData1291.coefficient97_401,
  OriginalRow227TriangleData1291.coefficient97_402,
  OriginalRow227TriangleData1291.coefficient97_403,
  OriginalRow227TriangleData1291.coefficient97_404
]

theorem values1291_size : values1291.size = 21 := rfl

def block1291 : ℕ → Option IntervalDyadic := segment 384 values1291

theorem block1291_domain : ExactDomain block1291 384 405 := by
  simpa only [values1291_size] using segment_domain 384 values1291

theorem block1291_get (i : Fin 21) :
    block1291 (384 + i.val) = some (values1291[i.val]'(by rw [values1291_size]; exact i.isLt)) := by
  exact segment_get 384 values1291 ⟨i.val, by rw [values1291_size]; exact i.isLt⟩

def node0096_0160 : ℕ → Option IntervalDyadic := split 128 block1282 block1283

theorem node0096_0160_domain : ExactDomain node0096_0160 96 160 := by
  exact split_domain (by decide) (by decide) block1282_domain block1283_domain

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block1285 block1286

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block1285_domain block1286_domain

def node0160_0256 : ℕ → Option IntervalDyadic := split 192 block1284 node0192_0256

theorem node0160_0256_domain : ExactDomain node0160_0256 160 256 := by
  exact split_domain (by decide) (by decide) block1284_domain node0192_0256_domain

def node0096_0256 : ℕ → Option IntervalDyadic := split 160 node0096_0160 node0160_0256

theorem node0096_0256_domain : ExactDomain node0096_0256 96 256 := by
  exact split_domain (by decide) (by decide) node0096_0160_domain node0160_0256_domain

def node0256_0320 : ℕ → Option IntervalDyadic := split 288 block1287 block1288

theorem node0256_0320_domain : ExactDomain node0256_0320 256 320 := by
  exact split_domain (by decide) (by decide) block1287_domain block1288_domain

def node0352_0405 : ℕ → Option IntervalDyadic := split 384 block1290 block1291

theorem node0352_0405_domain : ExactDomain node0352_0405 352 405 := by
  exact split_domain (by decide) (by decide) block1290_domain block1291_domain

def node0320_0405 : ℕ → Option IntervalDyadic := split 352 block1289 node0352_0405

theorem node0320_0405_domain : ExactDomain node0320_0405 320 405 := by
  exact split_domain (by decide) (by decide) block1289_domain node0352_0405_domain

def node0256_0405 : ℕ → Option IntervalDyadic := split 320 node0256_0320 node0320_0405

theorem node0256_0405_domain : ExactDomain node0256_0405 256 405 := by
  exact split_domain (by decide) (by decide) node0256_0320_domain node0320_0405_domain

def node0096_0405 : ℕ → Option IntervalDyadic := split 256 node0096_0256 node0256_0405

theorem node0096_0405_domain : ExactDomain node0096_0405 96 405 := by
  exact split_domain (by decide) (by decide) node0096_0256_domain node0256_0405_domain

def lookup : ℕ → Option IntervalDyadic := node0096_0405

theorem lookup_domain : ExactDomain lookup 96 405 :=
  node0096_0405_domain

theorem block1282_lookup (i : Fin 32) :
    lookup (96 + i.val) = some (values1282[i.val]'(by rw [values1282_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (96 + i.val) = _
  rw [node0096_0405, split_left 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0096_0256, split_left 160 node0096_0160 node0160_0256 (by omega)]
  rw [node0096_0160, split_left 128 block1282 block1283 (by omega)]
  exact block1282_get i

theorem block1283_lookup (i : Fin 32) :
    lookup (128 + i.val) = some (values1283[i.val]'(by rw [values1283_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (128 + i.val) = _
  rw [node0096_0405, split_left 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0096_0256, split_left 160 node0096_0160 node0160_0256 (by omega)]
  rw [node0096_0160, split_right 128 block1282 block1283 (by omega)]
  exact block1283_get i

theorem block1284_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values1284[i.val]'(by rw [values1284_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (160 + i.val) = _
  rw [node0096_0405, split_left 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0096_0256, split_right 160 node0096_0160 node0160_0256 (by omega)]
  rw [node0160_0256, split_left 192 block1284 node0192_0256 (by omega)]
  exact block1284_get i

theorem block1285_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values1285[i.val]'(by rw [values1285_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (192 + i.val) = _
  rw [node0096_0405, split_left 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0096_0256, split_right 160 node0096_0160 node0160_0256 (by omega)]
  rw [node0160_0256, split_right 192 block1284 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block1285 block1286 (by omega)]
  exact block1285_get i

theorem block1286_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values1286[i.val]'(by rw [values1286_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (224 + i.val) = _
  rw [node0096_0405, split_left 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0096_0256, split_right 160 node0096_0160 node0160_0256 (by omega)]
  rw [node0160_0256, split_right 192 block1284 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block1285 block1286 (by omega)]
  exact block1286_get i

theorem block1287_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values1287[i.val]'(by rw [values1287_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (256 + i.val) = _
  rw [node0096_0405, split_right 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0256_0405, split_left 320 node0256_0320 node0320_0405 (by omega)]
  rw [node0256_0320, split_left 288 block1287 block1288 (by omega)]
  exact block1287_get i

theorem block1288_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values1288[i.val]'(by rw [values1288_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (288 + i.val) = _
  rw [node0096_0405, split_right 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0256_0405, split_left 320 node0256_0320 node0320_0405 (by omega)]
  rw [node0256_0320, split_right 288 block1287 block1288 (by omega)]
  exact block1288_get i

theorem block1289_lookup (i : Fin 32) :
    lookup (320 + i.val) = some (values1289[i.val]'(by rw [values1289_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (320 + i.val) = _
  rw [node0096_0405, split_right 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0256_0405, split_right 320 node0256_0320 node0320_0405 (by omega)]
  rw [node0320_0405, split_left 352 block1289 node0352_0405 (by omega)]
  exact block1289_get i

theorem block1290_lookup (i : Fin 32) :
    lookup (352 + i.val) = some (values1290[i.val]'(by rw [values1290_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (352 + i.val) = _
  rw [node0096_0405, split_right 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0256_0405, split_right 320 node0256_0320 node0320_0405 (by omega)]
  rw [node0320_0405, split_right 352 block1289 node0352_0405 (by omega)]
  rw [node0352_0405, split_left 384 block1290 block1291 (by omega)]
  exact block1290_get i

theorem block1291_lookup (i : Fin 21) :
    lookup (384 + i.val) = some (values1291[i.val]'(by rw [values1291_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0096_0405 (384 + i.val) = _
  rw [node0096_0405, split_right 256 node0096_0256 node0256_0405 (by omega)]
  rw [node0256_0405, split_right 320 node0256_0320 node0320_0405 (by omega)]
  rw [node0320_0405, split_right 352 block1289 node0352_0405 (by omega)]
  rw [node0352_0405, split_right 384 block1290 block1291 (by omega)]
  exact block1291_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1282_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1282_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1283_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1283_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1284_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1284_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1285_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1285_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1286_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1286_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1287_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1287_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1288_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1288_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1289_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1289_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1290_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1290_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1291_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1291_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1282_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1283_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1284_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1285_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1286_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1287_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1288_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1289_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1290_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow097.block1291_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow097
