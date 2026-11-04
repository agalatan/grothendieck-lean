import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1272
import Grothe.UpperChaos.OriginalRow227TriangleData1273
import Grothe.UpperChaos.OriginalRow227TriangleData1274
import Grothe.UpperChaos.OriginalRow227TriangleData1275
import Grothe.UpperChaos.OriginalRow227TriangleData1276
import Grothe.UpperChaos.OriginalRow227TriangleData1277
import Grothe.UpperChaos.OriginalRow227TriangleData1278
import Grothe.UpperChaos.OriginalRow227TriangleData1279
import Grothe.UpperChaos.OriginalRow227TriangleData1280
import Grothe.UpperChaos.OriginalRow227TriangleData1281

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow096

open ConditionalTableLookup

def values1272 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1272.coefficient96_95,
  OriginalRow227TriangleData1272.coefficient96_96,
  OriginalRow227TriangleData1272.coefficient96_97,
  OriginalRow227TriangleData1272.coefficient96_98,
  OriginalRow227TriangleData1272.coefficient96_99,
  OriginalRow227TriangleData1272.coefficient96_100,
  OriginalRow227TriangleData1272.coefficient96_101,
  OriginalRow227TriangleData1272.coefficient96_102,
  OriginalRow227TriangleData1272.coefficient96_103,
  OriginalRow227TriangleData1272.coefficient96_104,
  OriginalRow227TriangleData1272.coefficient96_105,
  OriginalRow227TriangleData1272.coefficient96_106,
  OriginalRow227TriangleData1272.coefficient96_107,
  OriginalRow227TriangleData1272.coefficient96_108,
  OriginalRow227TriangleData1272.coefficient96_109,
  OriginalRow227TriangleData1272.coefficient96_110,
  OriginalRow227TriangleData1272.coefficient96_111,
  OriginalRow227TriangleData1272.coefficient96_112,
  OriginalRow227TriangleData1272.coefficient96_113,
  OriginalRow227TriangleData1272.coefficient96_114,
  OriginalRow227TriangleData1272.coefficient96_115,
  OriginalRow227TriangleData1272.coefficient96_116,
  OriginalRow227TriangleData1272.coefficient96_117,
  OriginalRow227TriangleData1272.coefficient96_118,
  OriginalRow227TriangleData1272.coefficient96_119,
  OriginalRow227TriangleData1272.coefficient96_120,
  OriginalRow227TriangleData1272.coefficient96_121,
  OriginalRow227TriangleData1272.coefficient96_122,
  OriginalRow227TriangleData1272.coefficient96_123,
  OriginalRow227TriangleData1272.coefficient96_124,
  OriginalRow227TriangleData1272.coefficient96_125,
  OriginalRow227TriangleData1272.coefficient96_126
]

theorem values1272_size : values1272.size = 32 := rfl

def block1272 : ℕ → Option IntervalDyadic := segment 95 values1272

theorem block1272_domain : ExactDomain block1272 95 127 := by
  simpa only [values1272_size] using segment_domain 95 values1272

theorem block1272_get (i : Fin 32) :
    block1272 (95 + i.val) = some (values1272[i.val]'(by rw [values1272_size]; exact i.isLt)) := by
  exact segment_get 95 values1272 ⟨i.val, by rw [values1272_size]; exact i.isLt⟩

def values1273 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1273.coefficient96_127,
  OriginalRow227TriangleData1273.coefficient96_128,
  OriginalRow227TriangleData1273.coefficient96_129,
  OriginalRow227TriangleData1273.coefficient96_130,
  OriginalRow227TriangleData1273.coefficient96_131,
  OriginalRow227TriangleData1273.coefficient96_132,
  OriginalRow227TriangleData1273.coefficient96_133,
  OriginalRow227TriangleData1273.coefficient96_134,
  OriginalRow227TriangleData1273.coefficient96_135,
  OriginalRow227TriangleData1273.coefficient96_136,
  OriginalRow227TriangleData1273.coefficient96_137,
  OriginalRow227TriangleData1273.coefficient96_138,
  OriginalRow227TriangleData1273.coefficient96_139,
  OriginalRow227TriangleData1273.coefficient96_140,
  OriginalRow227TriangleData1273.coefficient96_141,
  OriginalRow227TriangleData1273.coefficient96_142,
  OriginalRow227TriangleData1273.coefficient96_143,
  OriginalRow227TriangleData1273.coefficient96_144,
  OriginalRow227TriangleData1273.coefficient96_145,
  OriginalRow227TriangleData1273.coefficient96_146,
  OriginalRow227TriangleData1273.coefficient96_147,
  OriginalRow227TriangleData1273.coefficient96_148,
  OriginalRow227TriangleData1273.coefficient96_149,
  OriginalRow227TriangleData1273.coefficient96_150,
  OriginalRow227TriangleData1273.coefficient96_151,
  OriginalRow227TriangleData1273.coefficient96_152,
  OriginalRow227TriangleData1273.coefficient96_153,
  OriginalRow227TriangleData1273.coefficient96_154,
  OriginalRow227TriangleData1273.coefficient96_155,
  OriginalRow227TriangleData1273.coefficient96_156,
  OriginalRow227TriangleData1273.coefficient96_157,
  OriginalRow227TriangleData1273.coefficient96_158
]

theorem values1273_size : values1273.size = 32 := rfl

def block1273 : ℕ → Option IntervalDyadic := segment 127 values1273

theorem block1273_domain : ExactDomain block1273 127 159 := by
  simpa only [values1273_size] using segment_domain 127 values1273

theorem block1273_get (i : Fin 32) :
    block1273 (127 + i.val) = some (values1273[i.val]'(by rw [values1273_size]; exact i.isLt)) := by
  exact segment_get 127 values1273 ⟨i.val, by rw [values1273_size]; exact i.isLt⟩

def values1274 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1274.coefficient96_159,
  OriginalRow227TriangleData1274.coefficient96_160,
  OriginalRow227TriangleData1274.coefficient96_161,
  OriginalRow227TriangleData1274.coefficient96_162,
  OriginalRow227TriangleData1274.coefficient96_163,
  OriginalRow227TriangleData1274.coefficient96_164,
  OriginalRow227TriangleData1274.coefficient96_165,
  OriginalRow227TriangleData1274.coefficient96_166,
  OriginalRow227TriangleData1274.coefficient96_167,
  OriginalRow227TriangleData1274.coefficient96_168,
  OriginalRow227TriangleData1274.coefficient96_169,
  OriginalRow227TriangleData1274.coefficient96_170,
  OriginalRow227TriangleData1274.coefficient96_171,
  OriginalRow227TriangleData1274.coefficient96_172,
  OriginalRow227TriangleData1274.coefficient96_173,
  OriginalRow227TriangleData1274.coefficient96_174,
  OriginalRow227TriangleData1274.coefficient96_175,
  OriginalRow227TriangleData1274.coefficient96_176,
  OriginalRow227TriangleData1274.coefficient96_177,
  OriginalRow227TriangleData1274.coefficient96_178,
  OriginalRow227TriangleData1274.coefficient96_179,
  OriginalRow227TriangleData1274.coefficient96_180,
  OriginalRow227TriangleData1274.coefficient96_181,
  OriginalRow227TriangleData1274.coefficient96_182,
  OriginalRow227TriangleData1274.coefficient96_183,
  OriginalRow227TriangleData1274.coefficient96_184,
  OriginalRow227TriangleData1274.coefficient96_185,
  OriginalRow227TriangleData1274.coefficient96_186,
  OriginalRow227TriangleData1274.coefficient96_187,
  OriginalRow227TriangleData1274.coefficient96_188,
  OriginalRow227TriangleData1274.coefficient96_189,
  OriginalRow227TriangleData1274.coefficient96_190
]

theorem values1274_size : values1274.size = 32 := rfl

def block1274 : ℕ → Option IntervalDyadic := segment 159 values1274

theorem block1274_domain : ExactDomain block1274 159 191 := by
  simpa only [values1274_size] using segment_domain 159 values1274

theorem block1274_get (i : Fin 32) :
    block1274 (159 + i.val) = some (values1274[i.val]'(by rw [values1274_size]; exact i.isLt)) := by
  exact segment_get 159 values1274 ⟨i.val, by rw [values1274_size]; exact i.isLt⟩

def values1275 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1275.coefficient96_191,
  OriginalRow227TriangleData1275.coefficient96_192,
  OriginalRow227TriangleData1275.coefficient96_193,
  OriginalRow227TriangleData1275.coefficient96_194,
  OriginalRow227TriangleData1275.coefficient96_195,
  OriginalRow227TriangleData1275.coefficient96_196,
  OriginalRow227TriangleData1275.coefficient96_197,
  OriginalRow227TriangleData1275.coefficient96_198,
  OriginalRow227TriangleData1275.coefficient96_199,
  OriginalRow227TriangleData1275.coefficient96_200,
  OriginalRow227TriangleData1275.coefficient96_201,
  OriginalRow227TriangleData1275.coefficient96_202,
  OriginalRow227TriangleData1275.coefficient96_203,
  OriginalRow227TriangleData1275.coefficient96_204,
  OriginalRow227TriangleData1275.coefficient96_205,
  OriginalRow227TriangleData1275.coefficient96_206,
  OriginalRow227TriangleData1275.coefficient96_207,
  OriginalRow227TriangleData1275.coefficient96_208,
  OriginalRow227TriangleData1275.coefficient96_209,
  OriginalRow227TriangleData1275.coefficient96_210,
  OriginalRow227TriangleData1275.coefficient96_211,
  OriginalRow227TriangleData1275.coefficient96_212,
  OriginalRow227TriangleData1275.coefficient96_213,
  OriginalRow227TriangleData1275.coefficient96_214,
  OriginalRow227TriangleData1275.coefficient96_215,
  OriginalRow227TriangleData1275.coefficient96_216,
  OriginalRow227TriangleData1275.coefficient96_217,
  OriginalRow227TriangleData1275.coefficient96_218,
  OriginalRow227TriangleData1275.coefficient96_219,
  OriginalRow227TriangleData1275.coefficient96_220,
  OriginalRow227TriangleData1275.coefficient96_221,
  OriginalRow227TriangleData1275.coefficient96_222
]

theorem values1275_size : values1275.size = 32 := rfl

def block1275 : ℕ → Option IntervalDyadic := segment 191 values1275

theorem block1275_domain : ExactDomain block1275 191 223 := by
  simpa only [values1275_size] using segment_domain 191 values1275

theorem block1275_get (i : Fin 32) :
    block1275 (191 + i.val) = some (values1275[i.val]'(by rw [values1275_size]; exact i.isLt)) := by
  exact segment_get 191 values1275 ⟨i.val, by rw [values1275_size]; exact i.isLt⟩

def values1276 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1276.coefficient96_223,
  OriginalRow227TriangleData1276.coefficient96_224,
  OriginalRow227TriangleData1276.coefficient96_225,
  OriginalRow227TriangleData1276.coefficient96_226,
  OriginalRow227TriangleData1276.coefficient96_227,
  OriginalRow227TriangleData1276.coefficient96_228,
  OriginalRow227TriangleData1276.coefficient96_229,
  OriginalRow227TriangleData1276.coefficient96_230,
  OriginalRow227TriangleData1276.coefficient96_231,
  OriginalRow227TriangleData1276.coefficient96_232,
  OriginalRow227TriangleData1276.coefficient96_233,
  OriginalRow227TriangleData1276.coefficient96_234,
  OriginalRow227TriangleData1276.coefficient96_235,
  OriginalRow227TriangleData1276.coefficient96_236,
  OriginalRow227TriangleData1276.coefficient96_237,
  OriginalRow227TriangleData1276.coefficient96_238,
  OriginalRow227TriangleData1276.coefficient96_239,
  OriginalRow227TriangleData1276.coefficient96_240,
  OriginalRow227TriangleData1276.coefficient96_241,
  OriginalRow227TriangleData1276.coefficient96_242,
  OriginalRow227TriangleData1276.coefficient96_243,
  OriginalRow227TriangleData1276.coefficient96_244,
  OriginalRow227TriangleData1276.coefficient96_245,
  OriginalRow227TriangleData1276.coefficient96_246,
  OriginalRow227TriangleData1276.coefficient96_247,
  OriginalRow227TriangleData1276.coefficient96_248,
  OriginalRow227TriangleData1276.coefficient96_249,
  OriginalRow227TriangleData1276.coefficient96_250,
  OriginalRow227TriangleData1276.coefficient96_251,
  OriginalRow227TriangleData1276.coefficient96_252,
  OriginalRow227TriangleData1276.coefficient96_253,
  OriginalRow227TriangleData1276.coefficient96_254
]

theorem values1276_size : values1276.size = 32 := rfl

def block1276 : ℕ → Option IntervalDyadic := segment 223 values1276

theorem block1276_domain : ExactDomain block1276 223 255 := by
  simpa only [values1276_size] using segment_domain 223 values1276

theorem block1276_get (i : Fin 32) :
    block1276 (223 + i.val) = some (values1276[i.val]'(by rw [values1276_size]; exact i.isLt)) := by
  exact segment_get 223 values1276 ⟨i.val, by rw [values1276_size]; exact i.isLt⟩

def values1277 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1277.coefficient96_255,
  OriginalRow227TriangleData1277.coefficient96_256,
  OriginalRow227TriangleData1277.coefficient96_257,
  OriginalRow227TriangleData1277.coefficient96_258,
  OriginalRow227TriangleData1277.coefficient96_259,
  OriginalRow227TriangleData1277.coefficient96_260,
  OriginalRow227TriangleData1277.coefficient96_261,
  OriginalRow227TriangleData1277.coefficient96_262,
  OriginalRow227TriangleData1277.coefficient96_263,
  OriginalRow227TriangleData1277.coefficient96_264,
  OriginalRow227TriangleData1277.coefficient96_265,
  OriginalRow227TriangleData1277.coefficient96_266,
  OriginalRow227TriangleData1277.coefficient96_267,
  OriginalRow227TriangleData1277.coefficient96_268,
  OriginalRow227TriangleData1277.coefficient96_269,
  OriginalRow227TriangleData1277.coefficient96_270,
  OriginalRow227TriangleData1277.coefficient96_271,
  OriginalRow227TriangleData1277.coefficient96_272,
  OriginalRow227TriangleData1277.coefficient96_273,
  OriginalRow227TriangleData1277.coefficient96_274,
  OriginalRow227TriangleData1277.coefficient96_275,
  OriginalRow227TriangleData1277.coefficient96_276,
  OriginalRow227TriangleData1277.coefficient96_277,
  OriginalRow227TriangleData1277.coefficient96_278,
  OriginalRow227TriangleData1277.coefficient96_279,
  OriginalRow227TriangleData1277.coefficient96_280,
  OriginalRow227TriangleData1277.coefficient96_281,
  OriginalRow227TriangleData1277.coefficient96_282,
  OriginalRow227TriangleData1277.coefficient96_283,
  OriginalRow227TriangleData1277.coefficient96_284,
  OriginalRow227TriangleData1277.coefficient96_285,
  OriginalRow227TriangleData1277.coefficient96_286
]

theorem values1277_size : values1277.size = 32 := rfl

def block1277 : ℕ → Option IntervalDyadic := segment 255 values1277

theorem block1277_domain : ExactDomain block1277 255 287 := by
  simpa only [values1277_size] using segment_domain 255 values1277

theorem block1277_get (i : Fin 32) :
    block1277 (255 + i.val) = some (values1277[i.val]'(by rw [values1277_size]; exact i.isLt)) := by
  exact segment_get 255 values1277 ⟨i.val, by rw [values1277_size]; exact i.isLt⟩

def values1278 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1278.coefficient96_287,
  OriginalRow227TriangleData1278.coefficient96_288,
  OriginalRow227TriangleData1278.coefficient96_289,
  OriginalRow227TriangleData1278.coefficient96_290,
  OriginalRow227TriangleData1278.coefficient96_291,
  OriginalRow227TriangleData1278.coefficient96_292,
  OriginalRow227TriangleData1278.coefficient96_293,
  OriginalRow227TriangleData1278.coefficient96_294,
  OriginalRow227TriangleData1278.coefficient96_295,
  OriginalRow227TriangleData1278.coefficient96_296,
  OriginalRow227TriangleData1278.coefficient96_297,
  OriginalRow227TriangleData1278.coefficient96_298,
  OriginalRow227TriangleData1278.coefficient96_299,
  OriginalRow227TriangleData1278.coefficient96_300,
  OriginalRow227TriangleData1278.coefficient96_301,
  OriginalRow227TriangleData1278.coefficient96_302,
  OriginalRow227TriangleData1278.coefficient96_303,
  OriginalRow227TriangleData1278.coefficient96_304,
  OriginalRow227TriangleData1278.coefficient96_305,
  OriginalRow227TriangleData1278.coefficient96_306,
  OriginalRow227TriangleData1278.coefficient96_307,
  OriginalRow227TriangleData1278.coefficient96_308,
  OriginalRow227TriangleData1278.coefficient96_309,
  OriginalRow227TriangleData1278.coefficient96_310,
  OriginalRow227TriangleData1278.coefficient96_311,
  OriginalRow227TriangleData1278.coefficient96_312,
  OriginalRow227TriangleData1278.coefficient96_313,
  OriginalRow227TriangleData1278.coefficient96_314,
  OriginalRow227TriangleData1278.coefficient96_315,
  OriginalRow227TriangleData1278.coefficient96_316,
  OriginalRow227TriangleData1278.coefficient96_317,
  OriginalRow227TriangleData1278.coefficient96_318
]

theorem values1278_size : values1278.size = 32 := rfl

def block1278 : ℕ → Option IntervalDyadic := segment 287 values1278

theorem block1278_domain : ExactDomain block1278 287 319 := by
  simpa only [values1278_size] using segment_domain 287 values1278

theorem block1278_get (i : Fin 32) :
    block1278 (287 + i.val) = some (values1278[i.val]'(by rw [values1278_size]; exact i.isLt)) := by
  exact segment_get 287 values1278 ⟨i.val, by rw [values1278_size]; exact i.isLt⟩

def values1279 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1279.coefficient96_319,
  OriginalRow227TriangleData1279.coefficient96_320,
  OriginalRow227TriangleData1279.coefficient96_321,
  OriginalRow227TriangleData1279.coefficient96_322,
  OriginalRow227TriangleData1279.coefficient96_323,
  OriginalRow227TriangleData1279.coefficient96_324,
  OriginalRow227TriangleData1279.coefficient96_325,
  OriginalRow227TriangleData1279.coefficient96_326,
  OriginalRow227TriangleData1279.coefficient96_327,
  OriginalRow227TriangleData1279.coefficient96_328,
  OriginalRow227TriangleData1279.coefficient96_329,
  OriginalRow227TriangleData1279.coefficient96_330,
  OriginalRow227TriangleData1279.coefficient96_331,
  OriginalRow227TriangleData1279.coefficient96_332,
  OriginalRow227TriangleData1279.coefficient96_333,
  OriginalRow227TriangleData1279.coefficient96_334,
  OriginalRow227TriangleData1279.coefficient96_335,
  OriginalRow227TriangleData1279.coefficient96_336,
  OriginalRow227TriangleData1279.coefficient96_337,
  OriginalRow227TriangleData1279.coefficient96_338,
  OriginalRow227TriangleData1279.coefficient96_339,
  OriginalRow227TriangleData1279.coefficient96_340,
  OriginalRow227TriangleData1279.coefficient96_341,
  OriginalRow227TriangleData1279.coefficient96_342,
  OriginalRow227TriangleData1279.coefficient96_343,
  OriginalRow227TriangleData1279.coefficient96_344,
  OriginalRow227TriangleData1279.coefficient96_345,
  OriginalRow227TriangleData1279.coefficient96_346,
  OriginalRow227TriangleData1279.coefficient96_347,
  OriginalRow227TriangleData1279.coefficient96_348,
  OriginalRow227TriangleData1279.coefficient96_349,
  OriginalRow227TriangleData1279.coefficient96_350
]

theorem values1279_size : values1279.size = 32 := rfl

def block1279 : ℕ → Option IntervalDyadic := segment 319 values1279

theorem block1279_domain : ExactDomain block1279 319 351 := by
  simpa only [values1279_size] using segment_domain 319 values1279

theorem block1279_get (i : Fin 32) :
    block1279 (319 + i.val) = some (values1279[i.val]'(by rw [values1279_size]; exact i.isLt)) := by
  exact segment_get 319 values1279 ⟨i.val, by rw [values1279_size]; exact i.isLt⟩

def values1280 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1280.coefficient96_351,
  OriginalRow227TriangleData1280.coefficient96_352,
  OriginalRow227TriangleData1280.coefficient96_353,
  OriginalRow227TriangleData1280.coefficient96_354,
  OriginalRow227TriangleData1280.coefficient96_355,
  OriginalRow227TriangleData1280.coefficient96_356,
  OriginalRow227TriangleData1280.coefficient96_357,
  OriginalRow227TriangleData1280.coefficient96_358,
  OriginalRow227TriangleData1280.coefficient96_359,
  OriginalRow227TriangleData1280.coefficient96_360,
  OriginalRow227TriangleData1280.coefficient96_361,
  OriginalRow227TriangleData1280.coefficient96_362,
  OriginalRow227TriangleData1280.coefficient96_363,
  OriginalRow227TriangleData1280.coefficient96_364,
  OriginalRow227TriangleData1280.coefficient96_365,
  OriginalRow227TriangleData1280.coefficient96_366,
  OriginalRow227TriangleData1280.coefficient96_367,
  OriginalRow227TriangleData1280.coefficient96_368,
  OriginalRow227TriangleData1280.coefficient96_369,
  OriginalRow227TriangleData1280.coefficient96_370,
  OriginalRow227TriangleData1280.coefficient96_371,
  OriginalRow227TriangleData1280.coefficient96_372,
  OriginalRow227TriangleData1280.coefficient96_373,
  OriginalRow227TriangleData1280.coefficient96_374,
  OriginalRow227TriangleData1280.coefficient96_375,
  OriginalRow227TriangleData1280.coefficient96_376,
  OriginalRow227TriangleData1280.coefficient96_377,
  OriginalRow227TriangleData1280.coefficient96_378,
  OriginalRow227TriangleData1280.coefficient96_379,
  OriginalRow227TriangleData1280.coefficient96_380,
  OriginalRow227TriangleData1280.coefficient96_381,
  OriginalRow227TriangleData1280.coefficient96_382
]

theorem values1280_size : values1280.size = 32 := rfl

def block1280 : ℕ → Option IntervalDyadic := segment 351 values1280

theorem block1280_domain : ExactDomain block1280 351 383 := by
  simpa only [values1280_size] using segment_domain 351 values1280

theorem block1280_get (i : Fin 32) :
    block1280 (351 + i.val) = some (values1280[i.val]'(by rw [values1280_size]; exact i.isLt)) := by
  exact segment_get 351 values1280 ⟨i.val, by rw [values1280_size]; exact i.isLt⟩

def values1281 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1281.coefficient96_383,
  OriginalRow227TriangleData1281.coefficient96_384,
  OriginalRow227TriangleData1281.coefficient96_385,
  OriginalRow227TriangleData1281.coefficient96_386,
  OriginalRow227TriangleData1281.coefficient96_387,
  OriginalRow227TriangleData1281.coefficient96_388,
  OriginalRow227TriangleData1281.coefficient96_389,
  OriginalRow227TriangleData1281.coefficient96_390,
  OriginalRow227TriangleData1281.coefficient96_391,
  OriginalRow227TriangleData1281.coefficient96_392,
  OriginalRow227TriangleData1281.coefficient96_393,
  OriginalRow227TriangleData1281.coefficient96_394,
  OriginalRow227TriangleData1281.coefficient96_395,
  OriginalRow227TriangleData1281.coefficient96_396,
  OriginalRow227TriangleData1281.coefficient96_397,
  OriginalRow227TriangleData1281.coefficient96_398,
  OriginalRow227TriangleData1281.coefficient96_399,
  OriginalRow227TriangleData1281.coefficient96_400,
  OriginalRow227TriangleData1281.coefficient96_401,
  OriginalRow227TriangleData1281.coefficient96_402,
  OriginalRow227TriangleData1281.coefficient96_403,
  OriginalRow227TriangleData1281.coefficient96_404,
  OriginalRow227TriangleData1281.coefficient96_405
]

theorem values1281_size : values1281.size = 23 := rfl

def block1281 : ℕ → Option IntervalDyadic := segment 383 values1281

theorem block1281_domain : ExactDomain block1281 383 406 := by
  simpa only [values1281_size] using segment_domain 383 values1281

theorem block1281_get (i : Fin 23) :
    block1281 (383 + i.val) = some (values1281[i.val]'(by rw [values1281_size]; exact i.isLt)) := by
  exact segment_get 383 values1281 ⟨i.val, by rw [values1281_size]; exact i.isLt⟩

def node0095_0159 : ℕ → Option IntervalDyadic := split 127 block1272 block1273

theorem node0095_0159_domain : ExactDomain node0095_0159 95 159 := by
  exact split_domain (by decide) (by decide) block1272_domain block1273_domain

def node0191_0255 : ℕ → Option IntervalDyadic := split 223 block1275 block1276

theorem node0191_0255_domain : ExactDomain node0191_0255 191 255 := by
  exact split_domain (by decide) (by decide) block1275_domain block1276_domain

def node0159_0255 : ℕ → Option IntervalDyadic := split 191 block1274 node0191_0255

theorem node0159_0255_domain : ExactDomain node0159_0255 159 255 := by
  exact split_domain (by decide) (by decide) block1274_domain node0191_0255_domain

def node0095_0255 : ℕ → Option IntervalDyadic := split 159 node0095_0159 node0159_0255

theorem node0095_0255_domain : ExactDomain node0095_0255 95 255 := by
  exact split_domain (by decide) (by decide) node0095_0159_domain node0159_0255_domain

def node0255_0319 : ℕ → Option IntervalDyadic := split 287 block1277 block1278

theorem node0255_0319_domain : ExactDomain node0255_0319 255 319 := by
  exact split_domain (by decide) (by decide) block1277_domain block1278_domain

def node0351_0406 : ℕ → Option IntervalDyadic := split 383 block1280 block1281

theorem node0351_0406_domain : ExactDomain node0351_0406 351 406 := by
  exact split_domain (by decide) (by decide) block1280_domain block1281_domain

def node0319_0406 : ℕ → Option IntervalDyadic := split 351 block1279 node0351_0406

theorem node0319_0406_domain : ExactDomain node0319_0406 319 406 := by
  exact split_domain (by decide) (by decide) block1279_domain node0351_0406_domain

def node0255_0406 : ℕ → Option IntervalDyadic := split 319 node0255_0319 node0319_0406

theorem node0255_0406_domain : ExactDomain node0255_0406 255 406 := by
  exact split_domain (by decide) (by decide) node0255_0319_domain node0319_0406_domain

def node0095_0406 : ℕ → Option IntervalDyadic := split 255 node0095_0255 node0255_0406

theorem node0095_0406_domain : ExactDomain node0095_0406 95 406 := by
  exact split_domain (by decide) (by decide) node0095_0255_domain node0255_0406_domain

def lookup : ℕ → Option IntervalDyadic := node0095_0406

theorem lookup_domain : ExactDomain lookup 95 406 :=
  node0095_0406_domain

theorem block1272_lookup (i : Fin 32) :
    lookup (95 + i.val) = some (values1272[i.val]'(by rw [values1272_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (95 + i.val) = _
  rw [node0095_0406, split_left 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0095_0255, split_left 159 node0095_0159 node0159_0255 (by omega)]
  rw [node0095_0159, split_left 127 block1272 block1273 (by omega)]
  exact block1272_get i

theorem block1273_lookup (i : Fin 32) :
    lookup (127 + i.val) = some (values1273[i.val]'(by rw [values1273_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (127 + i.val) = _
  rw [node0095_0406, split_left 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0095_0255, split_left 159 node0095_0159 node0159_0255 (by omega)]
  rw [node0095_0159, split_right 127 block1272 block1273 (by omega)]
  exact block1273_get i

theorem block1274_lookup (i : Fin 32) :
    lookup (159 + i.val) = some (values1274[i.val]'(by rw [values1274_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (159 + i.val) = _
  rw [node0095_0406, split_left 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0095_0255, split_right 159 node0095_0159 node0159_0255 (by omega)]
  rw [node0159_0255, split_left 191 block1274 node0191_0255 (by omega)]
  exact block1274_get i

theorem block1275_lookup (i : Fin 32) :
    lookup (191 + i.val) = some (values1275[i.val]'(by rw [values1275_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (191 + i.val) = _
  rw [node0095_0406, split_left 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0095_0255, split_right 159 node0095_0159 node0159_0255 (by omega)]
  rw [node0159_0255, split_right 191 block1274 node0191_0255 (by omega)]
  rw [node0191_0255, split_left 223 block1275 block1276 (by omega)]
  exact block1275_get i

theorem block1276_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values1276[i.val]'(by rw [values1276_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (223 + i.val) = _
  rw [node0095_0406, split_left 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0095_0255, split_right 159 node0095_0159 node0159_0255 (by omega)]
  rw [node0159_0255, split_right 191 block1274 node0191_0255 (by omega)]
  rw [node0191_0255, split_right 223 block1275 block1276 (by omega)]
  exact block1276_get i

theorem block1277_lookup (i : Fin 32) :
    lookup (255 + i.val) = some (values1277[i.val]'(by rw [values1277_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (255 + i.val) = _
  rw [node0095_0406, split_right 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0255_0406, split_left 319 node0255_0319 node0319_0406 (by omega)]
  rw [node0255_0319, split_left 287 block1277 block1278 (by omega)]
  exact block1277_get i

theorem block1278_lookup (i : Fin 32) :
    lookup (287 + i.val) = some (values1278[i.val]'(by rw [values1278_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (287 + i.val) = _
  rw [node0095_0406, split_right 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0255_0406, split_left 319 node0255_0319 node0319_0406 (by omega)]
  rw [node0255_0319, split_right 287 block1277 block1278 (by omega)]
  exact block1278_get i

theorem block1279_lookup (i : Fin 32) :
    lookup (319 + i.val) = some (values1279[i.val]'(by rw [values1279_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (319 + i.val) = _
  rw [node0095_0406, split_right 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0255_0406, split_right 319 node0255_0319 node0319_0406 (by omega)]
  rw [node0319_0406, split_left 351 block1279 node0351_0406 (by omega)]
  exact block1279_get i

theorem block1280_lookup (i : Fin 32) :
    lookup (351 + i.val) = some (values1280[i.val]'(by rw [values1280_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (351 + i.val) = _
  rw [node0095_0406, split_right 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0255_0406, split_right 319 node0255_0319 node0319_0406 (by omega)]
  rw [node0319_0406, split_right 351 block1279 node0351_0406 (by omega)]
  rw [node0351_0406, split_left 383 block1280 block1281 (by omega)]
  exact block1280_get i

theorem block1281_lookup (i : Fin 23) :
    lookup (383 + i.val) = some (values1281[i.val]'(by rw [values1281_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0095_0406 (383 + i.val) = _
  rw [node0095_0406, split_right 255 node0095_0255 node0255_0406 (by omega)]
  rw [node0255_0406, split_right 319 node0255_0319 node0319_0406 (by omega)]
  rw [node0319_0406, split_right 351 block1279 node0351_0406 (by omega)]
  rw [node0351_0406, split_right 383 block1280 block1281 (by omega)]
  exact block1281_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1272_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1272_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1273_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1273_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1274_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1274_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1275_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1275_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1276_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1276_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1277_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1277_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1278_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1278_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1279_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1279_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1280_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1280_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1281_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1281_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1272_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1273_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1274_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1275_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1276_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1277_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1278_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1279_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1280_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow096.block1281_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow096
