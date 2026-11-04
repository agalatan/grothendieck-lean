import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1242
import Grothe.UpperChaos.OriginalRow227TriangleData1243
import Grothe.UpperChaos.OriginalRow227TriangleData1244
import Grothe.UpperChaos.OriginalRow227TriangleData1245
import Grothe.UpperChaos.OriginalRow227TriangleData1246
import Grothe.UpperChaos.OriginalRow227TriangleData1247
import Grothe.UpperChaos.OriginalRow227TriangleData1248
import Grothe.UpperChaos.OriginalRow227TriangleData1249
import Grothe.UpperChaos.OriginalRow227TriangleData1250
import Grothe.UpperChaos.OriginalRow227TriangleData1251

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow093

open ConditionalTableLookup

def values1242 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1242.coefficient93_92,
  OriginalRow227TriangleData1242.coefficient93_93,
  OriginalRow227TriangleData1242.coefficient93_94,
  OriginalRow227TriangleData1242.coefficient93_95,
  OriginalRow227TriangleData1242.coefficient93_96,
  OriginalRow227TriangleData1242.coefficient93_97,
  OriginalRow227TriangleData1242.coefficient93_98,
  OriginalRow227TriangleData1242.coefficient93_99,
  OriginalRow227TriangleData1242.coefficient93_100,
  OriginalRow227TriangleData1242.coefficient93_101,
  OriginalRow227TriangleData1242.coefficient93_102,
  OriginalRow227TriangleData1242.coefficient93_103,
  OriginalRow227TriangleData1242.coefficient93_104,
  OriginalRow227TriangleData1242.coefficient93_105,
  OriginalRow227TriangleData1242.coefficient93_106,
  OriginalRow227TriangleData1242.coefficient93_107,
  OriginalRow227TriangleData1242.coefficient93_108,
  OriginalRow227TriangleData1242.coefficient93_109,
  OriginalRow227TriangleData1242.coefficient93_110,
  OriginalRow227TriangleData1242.coefficient93_111,
  OriginalRow227TriangleData1242.coefficient93_112,
  OriginalRow227TriangleData1242.coefficient93_113,
  OriginalRow227TriangleData1242.coefficient93_114,
  OriginalRow227TriangleData1242.coefficient93_115,
  OriginalRow227TriangleData1242.coefficient93_116,
  OriginalRow227TriangleData1242.coefficient93_117,
  OriginalRow227TriangleData1242.coefficient93_118,
  OriginalRow227TriangleData1242.coefficient93_119,
  OriginalRow227TriangleData1242.coefficient93_120,
  OriginalRow227TriangleData1242.coefficient93_121,
  OriginalRow227TriangleData1242.coefficient93_122,
  OriginalRow227TriangleData1242.coefficient93_123
]

theorem values1242_size : values1242.size = 32 := rfl

def block1242 : ℕ → Option IntervalDyadic := segment 92 values1242

theorem block1242_domain : ExactDomain block1242 92 124 := by
  simpa only [values1242_size] using segment_domain 92 values1242

theorem block1242_get (i : Fin 32) :
    block1242 (92 + i.val) = some (values1242[i.val]'(by rw [values1242_size]; exact i.isLt)) := by
  exact segment_get 92 values1242 ⟨i.val, by rw [values1242_size]; exact i.isLt⟩

def values1243 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1243.coefficient93_124,
  OriginalRow227TriangleData1243.coefficient93_125,
  OriginalRow227TriangleData1243.coefficient93_126,
  OriginalRow227TriangleData1243.coefficient93_127,
  OriginalRow227TriangleData1243.coefficient93_128,
  OriginalRow227TriangleData1243.coefficient93_129,
  OriginalRow227TriangleData1243.coefficient93_130,
  OriginalRow227TriangleData1243.coefficient93_131,
  OriginalRow227TriangleData1243.coefficient93_132,
  OriginalRow227TriangleData1243.coefficient93_133,
  OriginalRow227TriangleData1243.coefficient93_134,
  OriginalRow227TriangleData1243.coefficient93_135,
  OriginalRow227TriangleData1243.coefficient93_136,
  OriginalRow227TriangleData1243.coefficient93_137,
  OriginalRow227TriangleData1243.coefficient93_138,
  OriginalRow227TriangleData1243.coefficient93_139,
  OriginalRow227TriangleData1243.coefficient93_140,
  OriginalRow227TriangleData1243.coefficient93_141,
  OriginalRow227TriangleData1243.coefficient93_142,
  OriginalRow227TriangleData1243.coefficient93_143,
  OriginalRow227TriangleData1243.coefficient93_144,
  OriginalRow227TriangleData1243.coefficient93_145,
  OriginalRow227TriangleData1243.coefficient93_146,
  OriginalRow227TriangleData1243.coefficient93_147,
  OriginalRow227TriangleData1243.coefficient93_148,
  OriginalRow227TriangleData1243.coefficient93_149,
  OriginalRow227TriangleData1243.coefficient93_150,
  OriginalRow227TriangleData1243.coefficient93_151,
  OriginalRow227TriangleData1243.coefficient93_152,
  OriginalRow227TriangleData1243.coefficient93_153,
  OriginalRow227TriangleData1243.coefficient93_154,
  OriginalRow227TriangleData1243.coefficient93_155
]

theorem values1243_size : values1243.size = 32 := rfl

def block1243 : ℕ → Option IntervalDyadic := segment 124 values1243

theorem block1243_domain : ExactDomain block1243 124 156 := by
  simpa only [values1243_size] using segment_domain 124 values1243

theorem block1243_get (i : Fin 32) :
    block1243 (124 + i.val) = some (values1243[i.val]'(by rw [values1243_size]; exact i.isLt)) := by
  exact segment_get 124 values1243 ⟨i.val, by rw [values1243_size]; exact i.isLt⟩

def values1244 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1244.coefficient93_156,
  OriginalRow227TriangleData1244.coefficient93_157,
  OriginalRow227TriangleData1244.coefficient93_158,
  OriginalRow227TriangleData1244.coefficient93_159,
  OriginalRow227TriangleData1244.coefficient93_160,
  OriginalRow227TriangleData1244.coefficient93_161,
  OriginalRow227TriangleData1244.coefficient93_162,
  OriginalRow227TriangleData1244.coefficient93_163,
  OriginalRow227TriangleData1244.coefficient93_164,
  OriginalRow227TriangleData1244.coefficient93_165,
  OriginalRow227TriangleData1244.coefficient93_166,
  OriginalRow227TriangleData1244.coefficient93_167,
  OriginalRow227TriangleData1244.coefficient93_168,
  OriginalRow227TriangleData1244.coefficient93_169,
  OriginalRow227TriangleData1244.coefficient93_170,
  OriginalRow227TriangleData1244.coefficient93_171,
  OriginalRow227TriangleData1244.coefficient93_172,
  OriginalRow227TriangleData1244.coefficient93_173,
  OriginalRow227TriangleData1244.coefficient93_174,
  OriginalRow227TriangleData1244.coefficient93_175,
  OriginalRow227TriangleData1244.coefficient93_176,
  OriginalRow227TriangleData1244.coefficient93_177,
  OriginalRow227TriangleData1244.coefficient93_178,
  OriginalRow227TriangleData1244.coefficient93_179,
  OriginalRow227TriangleData1244.coefficient93_180,
  OriginalRow227TriangleData1244.coefficient93_181,
  OriginalRow227TriangleData1244.coefficient93_182,
  OriginalRow227TriangleData1244.coefficient93_183,
  OriginalRow227TriangleData1244.coefficient93_184,
  OriginalRow227TriangleData1244.coefficient93_185,
  OriginalRow227TriangleData1244.coefficient93_186,
  OriginalRow227TriangleData1244.coefficient93_187
]

theorem values1244_size : values1244.size = 32 := rfl

def block1244 : ℕ → Option IntervalDyadic := segment 156 values1244

theorem block1244_domain : ExactDomain block1244 156 188 := by
  simpa only [values1244_size] using segment_domain 156 values1244

theorem block1244_get (i : Fin 32) :
    block1244 (156 + i.val) = some (values1244[i.val]'(by rw [values1244_size]; exact i.isLt)) := by
  exact segment_get 156 values1244 ⟨i.val, by rw [values1244_size]; exact i.isLt⟩

def values1245 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1245.coefficient93_188,
  OriginalRow227TriangleData1245.coefficient93_189,
  OriginalRow227TriangleData1245.coefficient93_190,
  OriginalRow227TriangleData1245.coefficient93_191,
  OriginalRow227TriangleData1245.coefficient93_192,
  OriginalRow227TriangleData1245.coefficient93_193,
  OriginalRow227TriangleData1245.coefficient93_194,
  OriginalRow227TriangleData1245.coefficient93_195,
  OriginalRow227TriangleData1245.coefficient93_196,
  OriginalRow227TriangleData1245.coefficient93_197,
  OriginalRow227TriangleData1245.coefficient93_198,
  OriginalRow227TriangleData1245.coefficient93_199,
  OriginalRow227TriangleData1245.coefficient93_200,
  OriginalRow227TriangleData1245.coefficient93_201,
  OriginalRow227TriangleData1245.coefficient93_202,
  OriginalRow227TriangleData1245.coefficient93_203,
  OriginalRow227TriangleData1245.coefficient93_204,
  OriginalRow227TriangleData1245.coefficient93_205,
  OriginalRow227TriangleData1245.coefficient93_206,
  OriginalRow227TriangleData1245.coefficient93_207,
  OriginalRow227TriangleData1245.coefficient93_208,
  OriginalRow227TriangleData1245.coefficient93_209,
  OriginalRow227TriangleData1245.coefficient93_210,
  OriginalRow227TriangleData1245.coefficient93_211,
  OriginalRow227TriangleData1245.coefficient93_212,
  OriginalRow227TriangleData1245.coefficient93_213,
  OriginalRow227TriangleData1245.coefficient93_214,
  OriginalRow227TriangleData1245.coefficient93_215,
  OriginalRow227TriangleData1245.coefficient93_216,
  OriginalRow227TriangleData1245.coefficient93_217,
  OriginalRow227TriangleData1245.coefficient93_218,
  OriginalRow227TriangleData1245.coefficient93_219
]

theorem values1245_size : values1245.size = 32 := rfl

def block1245 : ℕ → Option IntervalDyadic := segment 188 values1245

theorem block1245_domain : ExactDomain block1245 188 220 := by
  simpa only [values1245_size] using segment_domain 188 values1245

theorem block1245_get (i : Fin 32) :
    block1245 (188 + i.val) = some (values1245[i.val]'(by rw [values1245_size]; exact i.isLt)) := by
  exact segment_get 188 values1245 ⟨i.val, by rw [values1245_size]; exact i.isLt⟩

def values1246 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1246.coefficient93_220,
  OriginalRow227TriangleData1246.coefficient93_221,
  OriginalRow227TriangleData1246.coefficient93_222,
  OriginalRow227TriangleData1246.coefficient93_223,
  OriginalRow227TriangleData1246.coefficient93_224,
  OriginalRow227TriangleData1246.coefficient93_225,
  OriginalRow227TriangleData1246.coefficient93_226,
  OriginalRow227TriangleData1246.coefficient93_227,
  OriginalRow227TriangleData1246.coefficient93_228,
  OriginalRow227TriangleData1246.coefficient93_229,
  OriginalRow227TriangleData1246.coefficient93_230,
  OriginalRow227TriangleData1246.coefficient93_231,
  OriginalRow227TriangleData1246.coefficient93_232,
  OriginalRow227TriangleData1246.coefficient93_233,
  OriginalRow227TriangleData1246.coefficient93_234,
  OriginalRow227TriangleData1246.coefficient93_235,
  OriginalRow227TriangleData1246.coefficient93_236,
  OriginalRow227TriangleData1246.coefficient93_237,
  OriginalRow227TriangleData1246.coefficient93_238,
  OriginalRow227TriangleData1246.coefficient93_239,
  OriginalRow227TriangleData1246.coefficient93_240,
  OriginalRow227TriangleData1246.coefficient93_241,
  OriginalRow227TriangleData1246.coefficient93_242,
  OriginalRow227TriangleData1246.coefficient93_243,
  OriginalRow227TriangleData1246.coefficient93_244,
  OriginalRow227TriangleData1246.coefficient93_245,
  OriginalRow227TriangleData1246.coefficient93_246,
  OriginalRow227TriangleData1246.coefficient93_247,
  OriginalRow227TriangleData1246.coefficient93_248,
  OriginalRow227TriangleData1246.coefficient93_249,
  OriginalRow227TriangleData1246.coefficient93_250,
  OriginalRow227TriangleData1246.coefficient93_251
]

theorem values1246_size : values1246.size = 32 := rfl

def block1246 : ℕ → Option IntervalDyadic := segment 220 values1246

theorem block1246_domain : ExactDomain block1246 220 252 := by
  simpa only [values1246_size] using segment_domain 220 values1246

theorem block1246_get (i : Fin 32) :
    block1246 (220 + i.val) = some (values1246[i.val]'(by rw [values1246_size]; exact i.isLt)) := by
  exact segment_get 220 values1246 ⟨i.val, by rw [values1246_size]; exact i.isLt⟩

def values1247 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1247.coefficient93_252,
  OriginalRow227TriangleData1247.coefficient93_253,
  OriginalRow227TriangleData1247.coefficient93_254,
  OriginalRow227TriangleData1247.coefficient93_255,
  OriginalRow227TriangleData1247.coefficient93_256,
  OriginalRow227TriangleData1247.coefficient93_257,
  OriginalRow227TriangleData1247.coefficient93_258,
  OriginalRow227TriangleData1247.coefficient93_259,
  OriginalRow227TriangleData1247.coefficient93_260,
  OriginalRow227TriangleData1247.coefficient93_261,
  OriginalRow227TriangleData1247.coefficient93_262,
  OriginalRow227TriangleData1247.coefficient93_263,
  OriginalRow227TriangleData1247.coefficient93_264,
  OriginalRow227TriangleData1247.coefficient93_265,
  OriginalRow227TriangleData1247.coefficient93_266,
  OriginalRow227TriangleData1247.coefficient93_267,
  OriginalRow227TriangleData1247.coefficient93_268,
  OriginalRow227TriangleData1247.coefficient93_269,
  OriginalRow227TriangleData1247.coefficient93_270,
  OriginalRow227TriangleData1247.coefficient93_271,
  OriginalRow227TriangleData1247.coefficient93_272,
  OriginalRow227TriangleData1247.coefficient93_273,
  OriginalRow227TriangleData1247.coefficient93_274,
  OriginalRow227TriangleData1247.coefficient93_275,
  OriginalRow227TriangleData1247.coefficient93_276,
  OriginalRow227TriangleData1247.coefficient93_277,
  OriginalRow227TriangleData1247.coefficient93_278,
  OriginalRow227TriangleData1247.coefficient93_279,
  OriginalRow227TriangleData1247.coefficient93_280,
  OriginalRow227TriangleData1247.coefficient93_281,
  OriginalRow227TriangleData1247.coefficient93_282,
  OriginalRow227TriangleData1247.coefficient93_283
]

theorem values1247_size : values1247.size = 32 := rfl

def block1247 : ℕ → Option IntervalDyadic := segment 252 values1247

theorem block1247_domain : ExactDomain block1247 252 284 := by
  simpa only [values1247_size] using segment_domain 252 values1247

theorem block1247_get (i : Fin 32) :
    block1247 (252 + i.val) = some (values1247[i.val]'(by rw [values1247_size]; exact i.isLt)) := by
  exact segment_get 252 values1247 ⟨i.val, by rw [values1247_size]; exact i.isLt⟩

def values1248 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1248.coefficient93_284,
  OriginalRow227TriangleData1248.coefficient93_285,
  OriginalRow227TriangleData1248.coefficient93_286,
  OriginalRow227TriangleData1248.coefficient93_287,
  OriginalRow227TriangleData1248.coefficient93_288,
  OriginalRow227TriangleData1248.coefficient93_289,
  OriginalRow227TriangleData1248.coefficient93_290,
  OriginalRow227TriangleData1248.coefficient93_291,
  OriginalRow227TriangleData1248.coefficient93_292,
  OriginalRow227TriangleData1248.coefficient93_293,
  OriginalRow227TriangleData1248.coefficient93_294,
  OriginalRow227TriangleData1248.coefficient93_295,
  OriginalRow227TriangleData1248.coefficient93_296,
  OriginalRow227TriangleData1248.coefficient93_297,
  OriginalRow227TriangleData1248.coefficient93_298,
  OriginalRow227TriangleData1248.coefficient93_299,
  OriginalRow227TriangleData1248.coefficient93_300,
  OriginalRow227TriangleData1248.coefficient93_301,
  OriginalRow227TriangleData1248.coefficient93_302,
  OriginalRow227TriangleData1248.coefficient93_303,
  OriginalRow227TriangleData1248.coefficient93_304,
  OriginalRow227TriangleData1248.coefficient93_305,
  OriginalRow227TriangleData1248.coefficient93_306,
  OriginalRow227TriangleData1248.coefficient93_307,
  OriginalRow227TriangleData1248.coefficient93_308,
  OriginalRow227TriangleData1248.coefficient93_309,
  OriginalRow227TriangleData1248.coefficient93_310,
  OriginalRow227TriangleData1248.coefficient93_311,
  OriginalRow227TriangleData1248.coefficient93_312,
  OriginalRow227TriangleData1248.coefficient93_313,
  OriginalRow227TriangleData1248.coefficient93_314,
  OriginalRow227TriangleData1248.coefficient93_315
]

theorem values1248_size : values1248.size = 32 := rfl

def block1248 : ℕ → Option IntervalDyadic := segment 284 values1248

theorem block1248_domain : ExactDomain block1248 284 316 := by
  simpa only [values1248_size] using segment_domain 284 values1248

theorem block1248_get (i : Fin 32) :
    block1248 (284 + i.val) = some (values1248[i.val]'(by rw [values1248_size]; exact i.isLt)) := by
  exact segment_get 284 values1248 ⟨i.val, by rw [values1248_size]; exact i.isLt⟩

def values1249 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1249.coefficient93_316,
  OriginalRow227TriangleData1249.coefficient93_317,
  OriginalRow227TriangleData1249.coefficient93_318,
  OriginalRow227TriangleData1249.coefficient93_319,
  OriginalRow227TriangleData1249.coefficient93_320,
  OriginalRow227TriangleData1249.coefficient93_321,
  OriginalRow227TriangleData1249.coefficient93_322,
  OriginalRow227TriangleData1249.coefficient93_323,
  OriginalRow227TriangleData1249.coefficient93_324,
  OriginalRow227TriangleData1249.coefficient93_325,
  OriginalRow227TriangleData1249.coefficient93_326,
  OriginalRow227TriangleData1249.coefficient93_327,
  OriginalRow227TriangleData1249.coefficient93_328,
  OriginalRow227TriangleData1249.coefficient93_329,
  OriginalRow227TriangleData1249.coefficient93_330,
  OriginalRow227TriangleData1249.coefficient93_331,
  OriginalRow227TriangleData1249.coefficient93_332,
  OriginalRow227TriangleData1249.coefficient93_333,
  OriginalRow227TriangleData1249.coefficient93_334,
  OriginalRow227TriangleData1249.coefficient93_335,
  OriginalRow227TriangleData1249.coefficient93_336,
  OriginalRow227TriangleData1249.coefficient93_337,
  OriginalRow227TriangleData1249.coefficient93_338,
  OriginalRow227TriangleData1249.coefficient93_339,
  OriginalRow227TriangleData1249.coefficient93_340,
  OriginalRow227TriangleData1249.coefficient93_341,
  OriginalRow227TriangleData1249.coefficient93_342,
  OriginalRow227TriangleData1249.coefficient93_343,
  OriginalRow227TriangleData1249.coefficient93_344,
  OriginalRow227TriangleData1249.coefficient93_345,
  OriginalRow227TriangleData1249.coefficient93_346,
  OriginalRow227TriangleData1249.coefficient93_347
]

theorem values1249_size : values1249.size = 32 := rfl

def block1249 : ℕ → Option IntervalDyadic := segment 316 values1249

theorem block1249_domain : ExactDomain block1249 316 348 := by
  simpa only [values1249_size] using segment_domain 316 values1249

theorem block1249_get (i : Fin 32) :
    block1249 (316 + i.val) = some (values1249[i.val]'(by rw [values1249_size]; exact i.isLt)) := by
  exact segment_get 316 values1249 ⟨i.val, by rw [values1249_size]; exact i.isLt⟩

def values1250 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1250.coefficient93_348,
  OriginalRow227TriangleData1250.coefficient93_349,
  OriginalRow227TriangleData1250.coefficient93_350,
  OriginalRow227TriangleData1250.coefficient93_351,
  OriginalRow227TriangleData1250.coefficient93_352,
  OriginalRow227TriangleData1250.coefficient93_353,
  OriginalRow227TriangleData1250.coefficient93_354,
  OriginalRow227TriangleData1250.coefficient93_355,
  OriginalRow227TriangleData1250.coefficient93_356,
  OriginalRow227TriangleData1250.coefficient93_357,
  OriginalRow227TriangleData1250.coefficient93_358,
  OriginalRow227TriangleData1250.coefficient93_359,
  OriginalRow227TriangleData1250.coefficient93_360,
  OriginalRow227TriangleData1250.coefficient93_361,
  OriginalRow227TriangleData1250.coefficient93_362,
  OriginalRow227TriangleData1250.coefficient93_363,
  OriginalRow227TriangleData1250.coefficient93_364,
  OriginalRow227TriangleData1250.coefficient93_365,
  OriginalRow227TriangleData1250.coefficient93_366,
  OriginalRow227TriangleData1250.coefficient93_367,
  OriginalRow227TriangleData1250.coefficient93_368,
  OriginalRow227TriangleData1250.coefficient93_369,
  OriginalRow227TriangleData1250.coefficient93_370,
  OriginalRow227TriangleData1250.coefficient93_371,
  OriginalRow227TriangleData1250.coefficient93_372,
  OriginalRow227TriangleData1250.coefficient93_373,
  OriginalRow227TriangleData1250.coefficient93_374,
  OriginalRow227TriangleData1250.coefficient93_375,
  OriginalRow227TriangleData1250.coefficient93_376,
  OriginalRow227TriangleData1250.coefficient93_377,
  OriginalRow227TriangleData1250.coefficient93_378,
  OriginalRow227TriangleData1250.coefficient93_379
]

theorem values1250_size : values1250.size = 32 := rfl

def block1250 : ℕ → Option IntervalDyadic := segment 348 values1250

theorem block1250_domain : ExactDomain block1250 348 380 := by
  simpa only [values1250_size] using segment_domain 348 values1250

theorem block1250_get (i : Fin 32) :
    block1250 (348 + i.val) = some (values1250[i.val]'(by rw [values1250_size]; exact i.isLt)) := by
  exact segment_get 348 values1250 ⟨i.val, by rw [values1250_size]; exact i.isLt⟩

def values1251 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1251.coefficient93_380,
  OriginalRow227TriangleData1251.coefficient93_381,
  OriginalRow227TriangleData1251.coefficient93_382,
  OriginalRow227TriangleData1251.coefficient93_383,
  OriginalRow227TriangleData1251.coefficient93_384,
  OriginalRow227TriangleData1251.coefficient93_385,
  OriginalRow227TriangleData1251.coefficient93_386,
  OriginalRow227TriangleData1251.coefficient93_387,
  OriginalRow227TriangleData1251.coefficient93_388,
  OriginalRow227TriangleData1251.coefficient93_389,
  OriginalRow227TriangleData1251.coefficient93_390,
  OriginalRow227TriangleData1251.coefficient93_391,
  OriginalRow227TriangleData1251.coefficient93_392,
  OriginalRow227TriangleData1251.coefficient93_393,
  OriginalRow227TriangleData1251.coefficient93_394,
  OriginalRow227TriangleData1251.coefficient93_395,
  OriginalRow227TriangleData1251.coefficient93_396,
  OriginalRow227TriangleData1251.coefficient93_397,
  OriginalRow227TriangleData1251.coefficient93_398,
  OriginalRow227TriangleData1251.coefficient93_399,
  OriginalRow227TriangleData1251.coefficient93_400,
  OriginalRow227TriangleData1251.coefficient93_401,
  OriginalRow227TriangleData1251.coefficient93_402,
  OriginalRow227TriangleData1251.coefficient93_403,
  OriginalRow227TriangleData1251.coefficient93_404,
  OriginalRow227TriangleData1251.coefficient93_405,
  OriginalRow227TriangleData1251.coefficient93_406,
  OriginalRow227TriangleData1251.coefficient93_407,
  OriginalRow227TriangleData1251.coefficient93_408
]

theorem values1251_size : values1251.size = 29 := rfl

def block1251 : ℕ → Option IntervalDyadic := segment 380 values1251

theorem block1251_domain : ExactDomain block1251 380 409 := by
  simpa only [values1251_size] using segment_domain 380 values1251

theorem block1251_get (i : Fin 29) :
    block1251 (380 + i.val) = some (values1251[i.val]'(by rw [values1251_size]; exact i.isLt)) := by
  exact segment_get 380 values1251 ⟨i.val, by rw [values1251_size]; exact i.isLt⟩

def node0092_0156 : ℕ → Option IntervalDyadic := split 124 block1242 block1243

theorem node0092_0156_domain : ExactDomain node0092_0156 92 156 := by
  exact split_domain (by decide) (by decide) block1242_domain block1243_domain

def node0188_0252 : ℕ → Option IntervalDyadic := split 220 block1245 block1246

theorem node0188_0252_domain : ExactDomain node0188_0252 188 252 := by
  exact split_domain (by decide) (by decide) block1245_domain block1246_domain

def node0156_0252 : ℕ → Option IntervalDyadic := split 188 block1244 node0188_0252

theorem node0156_0252_domain : ExactDomain node0156_0252 156 252 := by
  exact split_domain (by decide) (by decide) block1244_domain node0188_0252_domain

def node0092_0252 : ℕ → Option IntervalDyadic := split 156 node0092_0156 node0156_0252

theorem node0092_0252_domain : ExactDomain node0092_0252 92 252 := by
  exact split_domain (by decide) (by decide) node0092_0156_domain node0156_0252_domain

def node0252_0316 : ℕ → Option IntervalDyadic := split 284 block1247 block1248

theorem node0252_0316_domain : ExactDomain node0252_0316 252 316 := by
  exact split_domain (by decide) (by decide) block1247_domain block1248_domain

def node0348_0409 : ℕ → Option IntervalDyadic := split 380 block1250 block1251

theorem node0348_0409_domain : ExactDomain node0348_0409 348 409 := by
  exact split_domain (by decide) (by decide) block1250_domain block1251_domain

def node0316_0409 : ℕ → Option IntervalDyadic := split 348 block1249 node0348_0409

theorem node0316_0409_domain : ExactDomain node0316_0409 316 409 := by
  exact split_domain (by decide) (by decide) block1249_domain node0348_0409_domain

def node0252_0409 : ℕ → Option IntervalDyadic := split 316 node0252_0316 node0316_0409

theorem node0252_0409_domain : ExactDomain node0252_0409 252 409 := by
  exact split_domain (by decide) (by decide) node0252_0316_domain node0316_0409_domain

def node0092_0409 : ℕ → Option IntervalDyadic := split 252 node0092_0252 node0252_0409

theorem node0092_0409_domain : ExactDomain node0092_0409 92 409 := by
  exact split_domain (by decide) (by decide) node0092_0252_domain node0252_0409_domain

def lookup : ℕ → Option IntervalDyadic := node0092_0409

theorem lookup_domain : ExactDomain lookup 92 409 :=
  node0092_0409_domain

theorem block1242_lookup (i : Fin 32) :
    lookup (92 + i.val) = some (values1242[i.val]'(by rw [values1242_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (92 + i.val) = _
  rw [node0092_0409, split_left 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0092_0252, split_left 156 node0092_0156 node0156_0252 (by omega)]
  rw [node0092_0156, split_left 124 block1242 block1243 (by omega)]
  exact block1242_get i

theorem block1243_lookup (i : Fin 32) :
    lookup (124 + i.val) = some (values1243[i.val]'(by rw [values1243_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (124 + i.val) = _
  rw [node0092_0409, split_left 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0092_0252, split_left 156 node0092_0156 node0156_0252 (by omega)]
  rw [node0092_0156, split_right 124 block1242 block1243 (by omega)]
  exact block1243_get i

theorem block1244_lookup (i : Fin 32) :
    lookup (156 + i.val) = some (values1244[i.val]'(by rw [values1244_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (156 + i.val) = _
  rw [node0092_0409, split_left 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0092_0252, split_right 156 node0092_0156 node0156_0252 (by omega)]
  rw [node0156_0252, split_left 188 block1244 node0188_0252 (by omega)]
  exact block1244_get i

theorem block1245_lookup (i : Fin 32) :
    lookup (188 + i.val) = some (values1245[i.val]'(by rw [values1245_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (188 + i.val) = _
  rw [node0092_0409, split_left 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0092_0252, split_right 156 node0092_0156 node0156_0252 (by omega)]
  rw [node0156_0252, split_right 188 block1244 node0188_0252 (by omega)]
  rw [node0188_0252, split_left 220 block1245 block1246 (by omega)]
  exact block1245_get i

theorem block1246_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values1246[i.val]'(by rw [values1246_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (220 + i.val) = _
  rw [node0092_0409, split_left 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0092_0252, split_right 156 node0092_0156 node0156_0252 (by omega)]
  rw [node0156_0252, split_right 188 block1244 node0188_0252 (by omega)]
  rw [node0188_0252, split_right 220 block1245 block1246 (by omega)]
  exact block1246_get i

theorem block1247_lookup (i : Fin 32) :
    lookup (252 + i.val) = some (values1247[i.val]'(by rw [values1247_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (252 + i.val) = _
  rw [node0092_0409, split_right 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0252_0409, split_left 316 node0252_0316 node0316_0409 (by omega)]
  rw [node0252_0316, split_left 284 block1247 block1248 (by omega)]
  exact block1247_get i

theorem block1248_lookup (i : Fin 32) :
    lookup (284 + i.val) = some (values1248[i.val]'(by rw [values1248_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (284 + i.val) = _
  rw [node0092_0409, split_right 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0252_0409, split_left 316 node0252_0316 node0316_0409 (by omega)]
  rw [node0252_0316, split_right 284 block1247 block1248 (by omega)]
  exact block1248_get i

theorem block1249_lookup (i : Fin 32) :
    lookup (316 + i.val) = some (values1249[i.val]'(by rw [values1249_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (316 + i.val) = _
  rw [node0092_0409, split_right 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0252_0409, split_right 316 node0252_0316 node0316_0409 (by omega)]
  rw [node0316_0409, split_left 348 block1249 node0348_0409 (by omega)]
  exact block1249_get i

theorem block1250_lookup (i : Fin 32) :
    lookup (348 + i.val) = some (values1250[i.val]'(by rw [values1250_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (348 + i.val) = _
  rw [node0092_0409, split_right 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0252_0409, split_right 316 node0252_0316 node0316_0409 (by omega)]
  rw [node0316_0409, split_right 348 block1249 node0348_0409 (by omega)]
  rw [node0348_0409, split_left 380 block1250 block1251 (by omega)]
  exact block1250_get i

theorem block1251_lookup (i : Fin 29) :
    lookup (380 + i.val) = some (values1251[i.val]'(by rw [values1251_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0092_0409 (380 + i.val) = _
  rw [node0092_0409, split_right 252 node0092_0252 node0252_0409 (by omega)]
  rw [node0252_0409, split_right 316 node0252_0316 node0316_0409 (by omega)]
  rw [node0316_0409, split_right 348 block1249 node0348_0409 (by omega)]
  rw [node0348_0409, split_right 380 block1250 block1251 (by omega)]
  exact block1251_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1242_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1242_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1243_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1243_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1244_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1244_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1245_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1245_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1246_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1246_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1247_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1247_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1248_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1248_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1249_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1249_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1250_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1250_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1251_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1251_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1242_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1243_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1244_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1245_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1246_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1247_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1248_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1249_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1250_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow093.block1251_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow093
