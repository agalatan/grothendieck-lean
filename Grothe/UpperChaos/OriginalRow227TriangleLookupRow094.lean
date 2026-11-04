import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1252
import Grothe.UpperChaos.OriginalRow227TriangleData1253
import Grothe.UpperChaos.OriginalRow227TriangleData1254
import Grothe.UpperChaos.OriginalRow227TriangleData1255
import Grothe.UpperChaos.OriginalRow227TriangleData1256
import Grothe.UpperChaos.OriginalRow227TriangleData1257
import Grothe.UpperChaos.OriginalRow227TriangleData1258
import Grothe.UpperChaos.OriginalRow227TriangleData1259
import Grothe.UpperChaos.OriginalRow227TriangleData1260
import Grothe.UpperChaos.OriginalRow227TriangleData1261

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow094

open ConditionalTableLookup

def values1252 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1252.coefficient94_93,
  OriginalRow227TriangleData1252.coefficient94_94,
  OriginalRow227TriangleData1252.coefficient94_95,
  OriginalRow227TriangleData1252.coefficient94_96,
  OriginalRow227TriangleData1252.coefficient94_97,
  OriginalRow227TriangleData1252.coefficient94_98,
  OriginalRow227TriangleData1252.coefficient94_99,
  OriginalRow227TriangleData1252.coefficient94_100,
  OriginalRow227TriangleData1252.coefficient94_101,
  OriginalRow227TriangleData1252.coefficient94_102,
  OriginalRow227TriangleData1252.coefficient94_103,
  OriginalRow227TriangleData1252.coefficient94_104,
  OriginalRow227TriangleData1252.coefficient94_105,
  OriginalRow227TriangleData1252.coefficient94_106,
  OriginalRow227TriangleData1252.coefficient94_107,
  OriginalRow227TriangleData1252.coefficient94_108,
  OriginalRow227TriangleData1252.coefficient94_109,
  OriginalRow227TriangleData1252.coefficient94_110,
  OriginalRow227TriangleData1252.coefficient94_111,
  OriginalRow227TriangleData1252.coefficient94_112,
  OriginalRow227TriangleData1252.coefficient94_113,
  OriginalRow227TriangleData1252.coefficient94_114,
  OriginalRow227TriangleData1252.coefficient94_115,
  OriginalRow227TriangleData1252.coefficient94_116,
  OriginalRow227TriangleData1252.coefficient94_117,
  OriginalRow227TriangleData1252.coefficient94_118,
  OriginalRow227TriangleData1252.coefficient94_119,
  OriginalRow227TriangleData1252.coefficient94_120,
  OriginalRow227TriangleData1252.coefficient94_121,
  OriginalRow227TriangleData1252.coefficient94_122,
  OriginalRow227TriangleData1252.coefficient94_123,
  OriginalRow227TriangleData1252.coefficient94_124
]

theorem values1252_size : values1252.size = 32 := rfl

def block1252 : ℕ → Option IntervalDyadic := segment 93 values1252

theorem block1252_domain : ExactDomain block1252 93 125 := by
  simpa only [values1252_size] using segment_domain 93 values1252

theorem block1252_get (i : Fin 32) :
    block1252 (93 + i.val) = some (values1252[i.val]'(by rw [values1252_size]; exact i.isLt)) := by
  exact segment_get 93 values1252 ⟨i.val, by rw [values1252_size]; exact i.isLt⟩

def values1253 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1253.coefficient94_125,
  OriginalRow227TriangleData1253.coefficient94_126,
  OriginalRow227TriangleData1253.coefficient94_127,
  OriginalRow227TriangleData1253.coefficient94_128,
  OriginalRow227TriangleData1253.coefficient94_129,
  OriginalRow227TriangleData1253.coefficient94_130,
  OriginalRow227TriangleData1253.coefficient94_131,
  OriginalRow227TriangleData1253.coefficient94_132,
  OriginalRow227TriangleData1253.coefficient94_133,
  OriginalRow227TriangleData1253.coefficient94_134,
  OriginalRow227TriangleData1253.coefficient94_135,
  OriginalRow227TriangleData1253.coefficient94_136,
  OriginalRow227TriangleData1253.coefficient94_137,
  OriginalRow227TriangleData1253.coefficient94_138,
  OriginalRow227TriangleData1253.coefficient94_139,
  OriginalRow227TriangleData1253.coefficient94_140,
  OriginalRow227TriangleData1253.coefficient94_141,
  OriginalRow227TriangleData1253.coefficient94_142,
  OriginalRow227TriangleData1253.coefficient94_143,
  OriginalRow227TriangleData1253.coefficient94_144,
  OriginalRow227TriangleData1253.coefficient94_145,
  OriginalRow227TriangleData1253.coefficient94_146,
  OriginalRow227TriangleData1253.coefficient94_147,
  OriginalRow227TriangleData1253.coefficient94_148,
  OriginalRow227TriangleData1253.coefficient94_149,
  OriginalRow227TriangleData1253.coefficient94_150,
  OriginalRow227TriangleData1253.coefficient94_151,
  OriginalRow227TriangleData1253.coefficient94_152,
  OriginalRow227TriangleData1253.coefficient94_153,
  OriginalRow227TriangleData1253.coefficient94_154,
  OriginalRow227TriangleData1253.coefficient94_155,
  OriginalRow227TriangleData1253.coefficient94_156
]

theorem values1253_size : values1253.size = 32 := rfl

def block1253 : ℕ → Option IntervalDyadic := segment 125 values1253

theorem block1253_domain : ExactDomain block1253 125 157 := by
  simpa only [values1253_size] using segment_domain 125 values1253

theorem block1253_get (i : Fin 32) :
    block1253 (125 + i.val) = some (values1253[i.val]'(by rw [values1253_size]; exact i.isLt)) := by
  exact segment_get 125 values1253 ⟨i.val, by rw [values1253_size]; exact i.isLt⟩

def values1254 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1254.coefficient94_157,
  OriginalRow227TriangleData1254.coefficient94_158,
  OriginalRow227TriangleData1254.coefficient94_159,
  OriginalRow227TriangleData1254.coefficient94_160,
  OriginalRow227TriangleData1254.coefficient94_161,
  OriginalRow227TriangleData1254.coefficient94_162,
  OriginalRow227TriangleData1254.coefficient94_163,
  OriginalRow227TriangleData1254.coefficient94_164,
  OriginalRow227TriangleData1254.coefficient94_165,
  OriginalRow227TriangleData1254.coefficient94_166,
  OriginalRow227TriangleData1254.coefficient94_167,
  OriginalRow227TriangleData1254.coefficient94_168,
  OriginalRow227TriangleData1254.coefficient94_169,
  OriginalRow227TriangleData1254.coefficient94_170,
  OriginalRow227TriangleData1254.coefficient94_171,
  OriginalRow227TriangleData1254.coefficient94_172,
  OriginalRow227TriangleData1254.coefficient94_173,
  OriginalRow227TriangleData1254.coefficient94_174,
  OriginalRow227TriangleData1254.coefficient94_175,
  OriginalRow227TriangleData1254.coefficient94_176,
  OriginalRow227TriangleData1254.coefficient94_177,
  OriginalRow227TriangleData1254.coefficient94_178,
  OriginalRow227TriangleData1254.coefficient94_179,
  OriginalRow227TriangleData1254.coefficient94_180,
  OriginalRow227TriangleData1254.coefficient94_181,
  OriginalRow227TriangleData1254.coefficient94_182,
  OriginalRow227TriangleData1254.coefficient94_183,
  OriginalRow227TriangleData1254.coefficient94_184,
  OriginalRow227TriangleData1254.coefficient94_185,
  OriginalRow227TriangleData1254.coefficient94_186,
  OriginalRow227TriangleData1254.coefficient94_187,
  OriginalRow227TriangleData1254.coefficient94_188
]

theorem values1254_size : values1254.size = 32 := rfl

def block1254 : ℕ → Option IntervalDyadic := segment 157 values1254

theorem block1254_domain : ExactDomain block1254 157 189 := by
  simpa only [values1254_size] using segment_domain 157 values1254

theorem block1254_get (i : Fin 32) :
    block1254 (157 + i.val) = some (values1254[i.val]'(by rw [values1254_size]; exact i.isLt)) := by
  exact segment_get 157 values1254 ⟨i.val, by rw [values1254_size]; exact i.isLt⟩

def values1255 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1255.coefficient94_189,
  OriginalRow227TriangleData1255.coefficient94_190,
  OriginalRow227TriangleData1255.coefficient94_191,
  OriginalRow227TriangleData1255.coefficient94_192,
  OriginalRow227TriangleData1255.coefficient94_193,
  OriginalRow227TriangleData1255.coefficient94_194,
  OriginalRow227TriangleData1255.coefficient94_195,
  OriginalRow227TriangleData1255.coefficient94_196,
  OriginalRow227TriangleData1255.coefficient94_197,
  OriginalRow227TriangleData1255.coefficient94_198,
  OriginalRow227TriangleData1255.coefficient94_199,
  OriginalRow227TriangleData1255.coefficient94_200,
  OriginalRow227TriangleData1255.coefficient94_201,
  OriginalRow227TriangleData1255.coefficient94_202,
  OriginalRow227TriangleData1255.coefficient94_203,
  OriginalRow227TriangleData1255.coefficient94_204,
  OriginalRow227TriangleData1255.coefficient94_205,
  OriginalRow227TriangleData1255.coefficient94_206,
  OriginalRow227TriangleData1255.coefficient94_207,
  OriginalRow227TriangleData1255.coefficient94_208,
  OriginalRow227TriangleData1255.coefficient94_209,
  OriginalRow227TriangleData1255.coefficient94_210,
  OriginalRow227TriangleData1255.coefficient94_211,
  OriginalRow227TriangleData1255.coefficient94_212,
  OriginalRow227TriangleData1255.coefficient94_213,
  OriginalRow227TriangleData1255.coefficient94_214,
  OriginalRow227TriangleData1255.coefficient94_215,
  OriginalRow227TriangleData1255.coefficient94_216,
  OriginalRow227TriangleData1255.coefficient94_217,
  OriginalRow227TriangleData1255.coefficient94_218,
  OriginalRow227TriangleData1255.coefficient94_219,
  OriginalRow227TriangleData1255.coefficient94_220
]

theorem values1255_size : values1255.size = 32 := rfl

def block1255 : ℕ → Option IntervalDyadic := segment 189 values1255

theorem block1255_domain : ExactDomain block1255 189 221 := by
  simpa only [values1255_size] using segment_domain 189 values1255

theorem block1255_get (i : Fin 32) :
    block1255 (189 + i.val) = some (values1255[i.val]'(by rw [values1255_size]; exact i.isLt)) := by
  exact segment_get 189 values1255 ⟨i.val, by rw [values1255_size]; exact i.isLt⟩

def values1256 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1256.coefficient94_221,
  OriginalRow227TriangleData1256.coefficient94_222,
  OriginalRow227TriangleData1256.coefficient94_223,
  OriginalRow227TriangleData1256.coefficient94_224,
  OriginalRow227TriangleData1256.coefficient94_225,
  OriginalRow227TriangleData1256.coefficient94_226,
  OriginalRow227TriangleData1256.coefficient94_227,
  OriginalRow227TriangleData1256.coefficient94_228,
  OriginalRow227TriangleData1256.coefficient94_229,
  OriginalRow227TriangleData1256.coefficient94_230,
  OriginalRow227TriangleData1256.coefficient94_231,
  OriginalRow227TriangleData1256.coefficient94_232,
  OriginalRow227TriangleData1256.coefficient94_233,
  OriginalRow227TriangleData1256.coefficient94_234,
  OriginalRow227TriangleData1256.coefficient94_235,
  OriginalRow227TriangleData1256.coefficient94_236,
  OriginalRow227TriangleData1256.coefficient94_237,
  OriginalRow227TriangleData1256.coefficient94_238,
  OriginalRow227TriangleData1256.coefficient94_239,
  OriginalRow227TriangleData1256.coefficient94_240,
  OriginalRow227TriangleData1256.coefficient94_241,
  OriginalRow227TriangleData1256.coefficient94_242,
  OriginalRow227TriangleData1256.coefficient94_243,
  OriginalRow227TriangleData1256.coefficient94_244,
  OriginalRow227TriangleData1256.coefficient94_245,
  OriginalRow227TriangleData1256.coefficient94_246,
  OriginalRow227TriangleData1256.coefficient94_247,
  OriginalRow227TriangleData1256.coefficient94_248,
  OriginalRow227TriangleData1256.coefficient94_249,
  OriginalRow227TriangleData1256.coefficient94_250,
  OriginalRow227TriangleData1256.coefficient94_251,
  OriginalRow227TriangleData1256.coefficient94_252
]

theorem values1256_size : values1256.size = 32 := rfl

def block1256 : ℕ → Option IntervalDyadic := segment 221 values1256

theorem block1256_domain : ExactDomain block1256 221 253 := by
  simpa only [values1256_size] using segment_domain 221 values1256

theorem block1256_get (i : Fin 32) :
    block1256 (221 + i.val) = some (values1256[i.val]'(by rw [values1256_size]; exact i.isLt)) := by
  exact segment_get 221 values1256 ⟨i.val, by rw [values1256_size]; exact i.isLt⟩

def values1257 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1257.coefficient94_253,
  OriginalRow227TriangleData1257.coefficient94_254,
  OriginalRow227TriangleData1257.coefficient94_255,
  OriginalRow227TriangleData1257.coefficient94_256,
  OriginalRow227TriangleData1257.coefficient94_257,
  OriginalRow227TriangleData1257.coefficient94_258,
  OriginalRow227TriangleData1257.coefficient94_259,
  OriginalRow227TriangleData1257.coefficient94_260,
  OriginalRow227TriangleData1257.coefficient94_261,
  OriginalRow227TriangleData1257.coefficient94_262,
  OriginalRow227TriangleData1257.coefficient94_263,
  OriginalRow227TriangleData1257.coefficient94_264,
  OriginalRow227TriangleData1257.coefficient94_265,
  OriginalRow227TriangleData1257.coefficient94_266,
  OriginalRow227TriangleData1257.coefficient94_267,
  OriginalRow227TriangleData1257.coefficient94_268,
  OriginalRow227TriangleData1257.coefficient94_269,
  OriginalRow227TriangleData1257.coefficient94_270,
  OriginalRow227TriangleData1257.coefficient94_271,
  OriginalRow227TriangleData1257.coefficient94_272,
  OriginalRow227TriangleData1257.coefficient94_273,
  OriginalRow227TriangleData1257.coefficient94_274,
  OriginalRow227TriangleData1257.coefficient94_275,
  OriginalRow227TriangleData1257.coefficient94_276,
  OriginalRow227TriangleData1257.coefficient94_277,
  OriginalRow227TriangleData1257.coefficient94_278,
  OriginalRow227TriangleData1257.coefficient94_279,
  OriginalRow227TriangleData1257.coefficient94_280,
  OriginalRow227TriangleData1257.coefficient94_281,
  OriginalRow227TriangleData1257.coefficient94_282,
  OriginalRow227TriangleData1257.coefficient94_283,
  OriginalRow227TriangleData1257.coefficient94_284
]

theorem values1257_size : values1257.size = 32 := rfl

def block1257 : ℕ → Option IntervalDyadic := segment 253 values1257

theorem block1257_domain : ExactDomain block1257 253 285 := by
  simpa only [values1257_size] using segment_domain 253 values1257

theorem block1257_get (i : Fin 32) :
    block1257 (253 + i.val) = some (values1257[i.val]'(by rw [values1257_size]; exact i.isLt)) := by
  exact segment_get 253 values1257 ⟨i.val, by rw [values1257_size]; exact i.isLt⟩

def values1258 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1258.coefficient94_285,
  OriginalRow227TriangleData1258.coefficient94_286,
  OriginalRow227TriangleData1258.coefficient94_287,
  OriginalRow227TriangleData1258.coefficient94_288,
  OriginalRow227TriangleData1258.coefficient94_289,
  OriginalRow227TriangleData1258.coefficient94_290,
  OriginalRow227TriangleData1258.coefficient94_291,
  OriginalRow227TriangleData1258.coefficient94_292,
  OriginalRow227TriangleData1258.coefficient94_293,
  OriginalRow227TriangleData1258.coefficient94_294,
  OriginalRow227TriangleData1258.coefficient94_295,
  OriginalRow227TriangleData1258.coefficient94_296,
  OriginalRow227TriangleData1258.coefficient94_297,
  OriginalRow227TriangleData1258.coefficient94_298,
  OriginalRow227TriangleData1258.coefficient94_299,
  OriginalRow227TriangleData1258.coefficient94_300,
  OriginalRow227TriangleData1258.coefficient94_301,
  OriginalRow227TriangleData1258.coefficient94_302,
  OriginalRow227TriangleData1258.coefficient94_303,
  OriginalRow227TriangleData1258.coefficient94_304,
  OriginalRow227TriangleData1258.coefficient94_305,
  OriginalRow227TriangleData1258.coefficient94_306,
  OriginalRow227TriangleData1258.coefficient94_307,
  OriginalRow227TriangleData1258.coefficient94_308,
  OriginalRow227TriangleData1258.coefficient94_309,
  OriginalRow227TriangleData1258.coefficient94_310,
  OriginalRow227TriangleData1258.coefficient94_311,
  OriginalRow227TriangleData1258.coefficient94_312,
  OriginalRow227TriangleData1258.coefficient94_313,
  OriginalRow227TriangleData1258.coefficient94_314,
  OriginalRow227TriangleData1258.coefficient94_315,
  OriginalRow227TriangleData1258.coefficient94_316
]

theorem values1258_size : values1258.size = 32 := rfl

def block1258 : ℕ → Option IntervalDyadic := segment 285 values1258

theorem block1258_domain : ExactDomain block1258 285 317 := by
  simpa only [values1258_size] using segment_domain 285 values1258

theorem block1258_get (i : Fin 32) :
    block1258 (285 + i.val) = some (values1258[i.val]'(by rw [values1258_size]; exact i.isLt)) := by
  exact segment_get 285 values1258 ⟨i.val, by rw [values1258_size]; exact i.isLt⟩

def values1259 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1259.coefficient94_317,
  OriginalRow227TriangleData1259.coefficient94_318,
  OriginalRow227TriangleData1259.coefficient94_319,
  OriginalRow227TriangleData1259.coefficient94_320,
  OriginalRow227TriangleData1259.coefficient94_321,
  OriginalRow227TriangleData1259.coefficient94_322,
  OriginalRow227TriangleData1259.coefficient94_323,
  OriginalRow227TriangleData1259.coefficient94_324,
  OriginalRow227TriangleData1259.coefficient94_325,
  OriginalRow227TriangleData1259.coefficient94_326,
  OriginalRow227TriangleData1259.coefficient94_327,
  OriginalRow227TriangleData1259.coefficient94_328,
  OriginalRow227TriangleData1259.coefficient94_329,
  OriginalRow227TriangleData1259.coefficient94_330,
  OriginalRow227TriangleData1259.coefficient94_331,
  OriginalRow227TriangleData1259.coefficient94_332,
  OriginalRow227TriangleData1259.coefficient94_333,
  OriginalRow227TriangleData1259.coefficient94_334,
  OriginalRow227TriangleData1259.coefficient94_335,
  OriginalRow227TriangleData1259.coefficient94_336,
  OriginalRow227TriangleData1259.coefficient94_337,
  OriginalRow227TriangleData1259.coefficient94_338,
  OriginalRow227TriangleData1259.coefficient94_339,
  OriginalRow227TriangleData1259.coefficient94_340,
  OriginalRow227TriangleData1259.coefficient94_341,
  OriginalRow227TriangleData1259.coefficient94_342,
  OriginalRow227TriangleData1259.coefficient94_343,
  OriginalRow227TriangleData1259.coefficient94_344,
  OriginalRow227TriangleData1259.coefficient94_345,
  OriginalRow227TriangleData1259.coefficient94_346,
  OriginalRow227TriangleData1259.coefficient94_347,
  OriginalRow227TriangleData1259.coefficient94_348
]

theorem values1259_size : values1259.size = 32 := rfl

def block1259 : ℕ → Option IntervalDyadic := segment 317 values1259

theorem block1259_domain : ExactDomain block1259 317 349 := by
  simpa only [values1259_size] using segment_domain 317 values1259

theorem block1259_get (i : Fin 32) :
    block1259 (317 + i.val) = some (values1259[i.val]'(by rw [values1259_size]; exact i.isLt)) := by
  exact segment_get 317 values1259 ⟨i.val, by rw [values1259_size]; exact i.isLt⟩

def values1260 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1260.coefficient94_349,
  OriginalRow227TriangleData1260.coefficient94_350,
  OriginalRow227TriangleData1260.coefficient94_351,
  OriginalRow227TriangleData1260.coefficient94_352,
  OriginalRow227TriangleData1260.coefficient94_353,
  OriginalRow227TriangleData1260.coefficient94_354,
  OriginalRow227TriangleData1260.coefficient94_355,
  OriginalRow227TriangleData1260.coefficient94_356,
  OriginalRow227TriangleData1260.coefficient94_357,
  OriginalRow227TriangleData1260.coefficient94_358,
  OriginalRow227TriangleData1260.coefficient94_359,
  OriginalRow227TriangleData1260.coefficient94_360,
  OriginalRow227TriangleData1260.coefficient94_361,
  OriginalRow227TriangleData1260.coefficient94_362,
  OriginalRow227TriangleData1260.coefficient94_363,
  OriginalRow227TriangleData1260.coefficient94_364,
  OriginalRow227TriangleData1260.coefficient94_365,
  OriginalRow227TriangleData1260.coefficient94_366,
  OriginalRow227TriangleData1260.coefficient94_367,
  OriginalRow227TriangleData1260.coefficient94_368,
  OriginalRow227TriangleData1260.coefficient94_369,
  OriginalRow227TriangleData1260.coefficient94_370,
  OriginalRow227TriangleData1260.coefficient94_371,
  OriginalRow227TriangleData1260.coefficient94_372,
  OriginalRow227TriangleData1260.coefficient94_373,
  OriginalRow227TriangleData1260.coefficient94_374,
  OriginalRow227TriangleData1260.coefficient94_375,
  OriginalRow227TriangleData1260.coefficient94_376,
  OriginalRow227TriangleData1260.coefficient94_377,
  OriginalRow227TriangleData1260.coefficient94_378,
  OriginalRow227TriangleData1260.coefficient94_379,
  OriginalRow227TriangleData1260.coefficient94_380
]

theorem values1260_size : values1260.size = 32 := rfl

def block1260 : ℕ → Option IntervalDyadic := segment 349 values1260

theorem block1260_domain : ExactDomain block1260 349 381 := by
  simpa only [values1260_size] using segment_domain 349 values1260

theorem block1260_get (i : Fin 32) :
    block1260 (349 + i.val) = some (values1260[i.val]'(by rw [values1260_size]; exact i.isLt)) := by
  exact segment_get 349 values1260 ⟨i.val, by rw [values1260_size]; exact i.isLt⟩

def values1261 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1261.coefficient94_381,
  OriginalRow227TriangleData1261.coefficient94_382,
  OriginalRow227TriangleData1261.coefficient94_383,
  OriginalRow227TriangleData1261.coefficient94_384,
  OriginalRow227TriangleData1261.coefficient94_385,
  OriginalRow227TriangleData1261.coefficient94_386,
  OriginalRow227TriangleData1261.coefficient94_387,
  OriginalRow227TriangleData1261.coefficient94_388,
  OriginalRow227TriangleData1261.coefficient94_389,
  OriginalRow227TriangleData1261.coefficient94_390,
  OriginalRow227TriangleData1261.coefficient94_391,
  OriginalRow227TriangleData1261.coefficient94_392,
  OriginalRow227TriangleData1261.coefficient94_393,
  OriginalRow227TriangleData1261.coefficient94_394,
  OriginalRow227TriangleData1261.coefficient94_395,
  OriginalRow227TriangleData1261.coefficient94_396,
  OriginalRow227TriangleData1261.coefficient94_397,
  OriginalRow227TriangleData1261.coefficient94_398,
  OriginalRow227TriangleData1261.coefficient94_399,
  OriginalRow227TriangleData1261.coefficient94_400,
  OriginalRow227TriangleData1261.coefficient94_401,
  OriginalRow227TriangleData1261.coefficient94_402,
  OriginalRow227TriangleData1261.coefficient94_403,
  OriginalRow227TriangleData1261.coefficient94_404,
  OriginalRow227TriangleData1261.coefficient94_405,
  OriginalRow227TriangleData1261.coefficient94_406,
  OriginalRow227TriangleData1261.coefficient94_407
]

theorem values1261_size : values1261.size = 27 := rfl

def block1261 : ℕ → Option IntervalDyadic := segment 381 values1261

theorem block1261_domain : ExactDomain block1261 381 408 := by
  simpa only [values1261_size] using segment_domain 381 values1261

theorem block1261_get (i : Fin 27) :
    block1261 (381 + i.val) = some (values1261[i.val]'(by rw [values1261_size]; exact i.isLt)) := by
  exact segment_get 381 values1261 ⟨i.val, by rw [values1261_size]; exact i.isLt⟩

def node0093_0157 : ℕ → Option IntervalDyadic := split 125 block1252 block1253

theorem node0093_0157_domain : ExactDomain node0093_0157 93 157 := by
  exact split_domain (by decide) (by decide) block1252_domain block1253_domain

def node0189_0253 : ℕ → Option IntervalDyadic := split 221 block1255 block1256

theorem node0189_0253_domain : ExactDomain node0189_0253 189 253 := by
  exact split_domain (by decide) (by decide) block1255_domain block1256_domain

def node0157_0253 : ℕ → Option IntervalDyadic := split 189 block1254 node0189_0253

theorem node0157_0253_domain : ExactDomain node0157_0253 157 253 := by
  exact split_domain (by decide) (by decide) block1254_domain node0189_0253_domain

def node0093_0253 : ℕ → Option IntervalDyadic := split 157 node0093_0157 node0157_0253

theorem node0093_0253_domain : ExactDomain node0093_0253 93 253 := by
  exact split_domain (by decide) (by decide) node0093_0157_domain node0157_0253_domain

def node0253_0317 : ℕ → Option IntervalDyadic := split 285 block1257 block1258

theorem node0253_0317_domain : ExactDomain node0253_0317 253 317 := by
  exact split_domain (by decide) (by decide) block1257_domain block1258_domain

def node0349_0408 : ℕ → Option IntervalDyadic := split 381 block1260 block1261

theorem node0349_0408_domain : ExactDomain node0349_0408 349 408 := by
  exact split_domain (by decide) (by decide) block1260_domain block1261_domain

def node0317_0408 : ℕ → Option IntervalDyadic := split 349 block1259 node0349_0408

theorem node0317_0408_domain : ExactDomain node0317_0408 317 408 := by
  exact split_domain (by decide) (by decide) block1259_domain node0349_0408_domain

def node0253_0408 : ℕ → Option IntervalDyadic := split 317 node0253_0317 node0317_0408

theorem node0253_0408_domain : ExactDomain node0253_0408 253 408 := by
  exact split_domain (by decide) (by decide) node0253_0317_domain node0317_0408_domain

def node0093_0408 : ℕ → Option IntervalDyadic := split 253 node0093_0253 node0253_0408

theorem node0093_0408_domain : ExactDomain node0093_0408 93 408 := by
  exact split_domain (by decide) (by decide) node0093_0253_domain node0253_0408_domain

def lookup : ℕ → Option IntervalDyadic := node0093_0408

theorem lookup_domain : ExactDomain lookup 93 408 :=
  node0093_0408_domain

theorem block1252_lookup (i : Fin 32) :
    lookup (93 + i.val) = some (values1252[i.val]'(by rw [values1252_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (93 + i.val) = _
  rw [node0093_0408, split_left 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0093_0253, split_left 157 node0093_0157 node0157_0253 (by omega)]
  rw [node0093_0157, split_left 125 block1252 block1253 (by omega)]
  exact block1252_get i

theorem block1253_lookup (i : Fin 32) :
    lookup (125 + i.val) = some (values1253[i.val]'(by rw [values1253_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (125 + i.val) = _
  rw [node0093_0408, split_left 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0093_0253, split_left 157 node0093_0157 node0157_0253 (by omega)]
  rw [node0093_0157, split_right 125 block1252 block1253 (by omega)]
  exact block1253_get i

theorem block1254_lookup (i : Fin 32) :
    lookup (157 + i.val) = some (values1254[i.val]'(by rw [values1254_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (157 + i.val) = _
  rw [node0093_0408, split_left 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0093_0253, split_right 157 node0093_0157 node0157_0253 (by omega)]
  rw [node0157_0253, split_left 189 block1254 node0189_0253 (by omega)]
  exact block1254_get i

theorem block1255_lookup (i : Fin 32) :
    lookup (189 + i.val) = some (values1255[i.val]'(by rw [values1255_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (189 + i.val) = _
  rw [node0093_0408, split_left 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0093_0253, split_right 157 node0093_0157 node0157_0253 (by omega)]
  rw [node0157_0253, split_right 189 block1254 node0189_0253 (by omega)]
  rw [node0189_0253, split_left 221 block1255 block1256 (by omega)]
  exact block1255_get i

theorem block1256_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values1256[i.val]'(by rw [values1256_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (221 + i.val) = _
  rw [node0093_0408, split_left 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0093_0253, split_right 157 node0093_0157 node0157_0253 (by omega)]
  rw [node0157_0253, split_right 189 block1254 node0189_0253 (by omega)]
  rw [node0189_0253, split_right 221 block1255 block1256 (by omega)]
  exact block1256_get i

theorem block1257_lookup (i : Fin 32) :
    lookup (253 + i.val) = some (values1257[i.val]'(by rw [values1257_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (253 + i.val) = _
  rw [node0093_0408, split_right 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0253_0408, split_left 317 node0253_0317 node0317_0408 (by omega)]
  rw [node0253_0317, split_left 285 block1257 block1258 (by omega)]
  exact block1257_get i

theorem block1258_lookup (i : Fin 32) :
    lookup (285 + i.val) = some (values1258[i.val]'(by rw [values1258_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (285 + i.val) = _
  rw [node0093_0408, split_right 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0253_0408, split_left 317 node0253_0317 node0317_0408 (by omega)]
  rw [node0253_0317, split_right 285 block1257 block1258 (by omega)]
  exact block1258_get i

theorem block1259_lookup (i : Fin 32) :
    lookup (317 + i.val) = some (values1259[i.val]'(by rw [values1259_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (317 + i.val) = _
  rw [node0093_0408, split_right 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0253_0408, split_right 317 node0253_0317 node0317_0408 (by omega)]
  rw [node0317_0408, split_left 349 block1259 node0349_0408 (by omega)]
  exact block1259_get i

theorem block1260_lookup (i : Fin 32) :
    lookup (349 + i.val) = some (values1260[i.val]'(by rw [values1260_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (349 + i.val) = _
  rw [node0093_0408, split_right 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0253_0408, split_right 317 node0253_0317 node0317_0408 (by omega)]
  rw [node0317_0408, split_right 349 block1259 node0349_0408 (by omega)]
  rw [node0349_0408, split_left 381 block1260 block1261 (by omega)]
  exact block1260_get i

theorem block1261_lookup (i : Fin 27) :
    lookup (381 + i.val) = some (values1261[i.val]'(by rw [values1261_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0093_0408 (381 + i.val) = _
  rw [node0093_0408, split_right 253 node0093_0253 node0253_0408 (by omega)]
  rw [node0253_0408, split_right 317 node0253_0317 node0317_0408 (by omega)]
  rw [node0317_0408, split_right 349 block1259 node0349_0408 (by omega)]
  rw [node0349_0408, split_right 381 block1260 block1261 (by omega)]
  exact block1261_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1252_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1252_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1253_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1253_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1254_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1254_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1255_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1255_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1256_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1256_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1257_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1257_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1258_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1258_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1259_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1259_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1260_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1260_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1261_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1261_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1252_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1253_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1254_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1255_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1256_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1257_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1258_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1259_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1260_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow094.block1261_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow094
