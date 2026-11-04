import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1312
import Grothe.UpperChaos.OriginalRow227TriangleData1313
import Grothe.UpperChaos.OriginalRow227TriangleData1314
import Grothe.UpperChaos.OriginalRow227TriangleData1315
import Grothe.UpperChaos.OriginalRow227TriangleData1316
import Grothe.UpperChaos.OriginalRow227TriangleData1317
import Grothe.UpperChaos.OriginalRow227TriangleData1318
import Grothe.UpperChaos.OriginalRow227TriangleData1319
import Grothe.UpperChaos.OriginalRow227TriangleData1320
import Grothe.UpperChaos.OriginalRow227TriangleData1321

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow100

open ConditionalTableLookup

def values1312 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1312.coefficient100_99,
  OriginalRow227TriangleData1312.coefficient100_100,
  OriginalRow227TriangleData1312.coefficient100_101,
  OriginalRow227TriangleData1312.coefficient100_102,
  OriginalRow227TriangleData1312.coefficient100_103,
  OriginalRow227TriangleData1312.coefficient100_104,
  OriginalRow227TriangleData1312.coefficient100_105,
  OriginalRow227TriangleData1312.coefficient100_106,
  OriginalRow227TriangleData1312.coefficient100_107,
  OriginalRow227TriangleData1312.coefficient100_108,
  OriginalRow227TriangleData1312.coefficient100_109,
  OriginalRow227TriangleData1312.coefficient100_110,
  OriginalRow227TriangleData1312.coefficient100_111,
  OriginalRow227TriangleData1312.coefficient100_112,
  OriginalRow227TriangleData1312.coefficient100_113,
  OriginalRow227TriangleData1312.coefficient100_114,
  OriginalRow227TriangleData1312.coefficient100_115,
  OriginalRow227TriangleData1312.coefficient100_116,
  OriginalRow227TriangleData1312.coefficient100_117,
  OriginalRow227TriangleData1312.coefficient100_118,
  OriginalRow227TriangleData1312.coefficient100_119,
  OriginalRow227TriangleData1312.coefficient100_120,
  OriginalRow227TriangleData1312.coefficient100_121,
  OriginalRow227TriangleData1312.coefficient100_122,
  OriginalRow227TriangleData1312.coefficient100_123,
  OriginalRow227TriangleData1312.coefficient100_124,
  OriginalRow227TriangleData1312.coefficient100_125,
  OriginalRow227TriangleData1312.coefficient100_126,
  OriginalRow227TriangleData1312.coefficient100_127,
  OriginalRow227TriangleData1312.coefficient100_128,
  OriginalRow227TriangleData1312.coefficient100_129,
  OriginalRow227TriangleData1312.coefficient100_130
]

theorem values1312_size : values1312.size = 32 := rfl

def block1312 : ℕ → Option IntervalDyadic := segment 99 values1312

theorem block1312_domain : ExactDomain block1312 99 131 := by
  simpa only [values1312_size] using segment_domain 99 values1312

theorem block1312_get (i : Fin 32) :
    block1312 (99 + i.val) = some (values1312[i.val]'(by rw [values1312_size]; exact i.isLt)) := by
  exact segment_get 99 values1312 ⟨i.val, by rw [values1312_size]; exact i.isLt⟩

def values1313 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1313.coefficient100_131,
  OriginalRow227TriangleData1313.coefficient100_132,
  OriginalRow227TriangleData1313.coefficient100_133,
  OriginalRow227TriangleData1313.coefficient100_134,
  OriginalRow227TriangleData1313.coefficient100_135,
  OriginalRow227TriangleData1313.coefficient100_136,
  OriginalRow227TriangleData1313.coefficient100_137,
  OriginalRow227TriangleData1313.coefficient100_138,
  OriginalRow227TriangleData1313.coefficient100_139,
  OriginalRow227TriangleData1313.coefficient100_140,
  OriginalRow227TriangleData1313.coefficient100_141,
  OriginalRow227TriangleData1313.coefficient100_142,
  OriginalRow227TriangleData1313.coefficient100_143,
  OriginalRow227TriangleData1313.coefficient100_144,
  OriginalRow227TriangleData1313.coefficient100_145,
  OriginalRow227TriangleData1313.coefficient100_146,
  OriginalRow227TriangleData1313.coefficient100_147,
  OriginalRow227TriangleData1313.coefficient100_148,
  OriginalRow227TriangleData1313.coefficient100_149,
  OriginalRow227TriangleData1313.coefficient100_150,
  OriginalRow227TriangleData1313.coefficient100_151,
  OriginalRow227TriangleData1313.coefficient100_152,
  OriginalRow227TriangleData1313.coefficient100_153,
  OriginalRow227TriangleData1313.coefficient100_154,
  OriginalRow227TriangleData1313.coefficient100_155,
  OriginalRow227TriangleData1313.coefficient100_156,
  OriginalRow227TriangleData1313.coefficient100_157,
  OriginalRow227TriangleData1313.coefficient100_158,
  OriginalRow227TriangleData1313.coefficient100_159,
  OriginalRow227TriangleData1313.coefficient100_160,
  OriginalRow227TriangleData1313.coefficient100_161,
  OriginalRow227TriangleData1313.coefficient100_162
]

theorem values1313_size : values1313.size = 32 := rfl

def block1313 : ℕ → Option IntervalDyadic := segment 131 values1313

theorem block1313_domain : ExactDomain block1313 131 163 := by
  simpa only [values1313_size] using segment_domain 131 values1313

theorem block1313_get (i : Fin 32) :
    block1313 (131 + i.val) = some (values1313[i.val]'(by rw [values1313_size]; exact i.isLt)) := by
  exact segment_get 131 values1313 ⟨i.val, by rw [values1313_size]; exact i.isLt⟩

def values1314 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1314.coefficient100_163,
  OriginalRow227TriangleData1314.coefficient100_164,
  OriginalRow227TriangleData1314.coefficient100_165,
  OriginalRow227TriangleData1314.coefficient100_166,
  OriginalRow227TriangleData1314.coefficient100_167,
  OriginalRow227TriangleData1314.coefficient100_168,
  OriginalRow227TriangleData1314.coefficient100_169,
  OriginalRow227TriangleData1314.coefficient100_170,
  OriginalRow227TriangleData1314.coefficient100_171,
  OriginalRow227TriangleData1314.coefficient100_172,
  OriginalRow227TriangleData1314.coefficient100_173,
  OriginalRow227TriangleData1314.coefficient100_174,
  OriginalRow227TriangleData1314.coefficient100_175,
  OriginalRow227TriangleData1314.coefficient100_176,
  OriginalRow227TriangleData1314.coefficient100_177,
  OriginalRow227TriangleData1314.coefficient100_178,
  OriginalRow227TriangleData1314.coefficient100_179,
  OriginalRow227TriangleData1314.coefficient100_180,
  OriginalRow227TriangleData1314.coefficient100_181,
  OriginalRow227TriangleData1314.coefficient100_182,
  OriginalRow227TriangleData1314.coefficient100_183,
  OriginalRow227TriangleData1314.coefficient100_184,
  OriginalRow227TriangleData1314.coefficient100_185,
  OriginalRow227TriangleData1314.coefficient100_186,
  OriginalRow227TriangleData1314.coefficient100_187,
  OriginalRow227TriangleData1314.coefficient100_188,
  OriginalRow227TriangleData1314.coefficient100_189,
  OriginalRow227TriangleData1314.coefficient100_190,
  OriginalRow227TriangleData1314.coefficient100_191,
  OriginalRow227TriangleData1314.coefficient100_192,
  OriginalRow227TriangleData1314.coefficient100_193,
  OriginalRow227TriangleData1314.coefficient100_194
]

theorem values1314_size : values1314.size = 32 := rfl

def block1314 : ℕ → Option IntervalDyadic := segment 163 values1314

theorem block1314_domain : ExactDomain block1314 163 195 := by
  simpa only [values1314_size] using segment_domain 163 values1314

theorem block1314_get (i : Fin 32) :
    block1314 (163 + i.val) = some (values1314[i.val]'(by rw [values1314_size]; exact i.isLt)) := by
  exact segment_get 163 values1314 ⟨i.val, by rw [values1314_size]; exact i.isLt⟩

def values1315 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1315.coefficient100_195,
  OriginalRow227TriangleData1315.coefficient100_196,
  OriginalRow227TriangleData1315.coefficient100_197,
  OriginalRow227TriangleData1315.coefficient100_198,
  OriginalRow227TriangleData1315.coefficient100_199,
  OriginalRow227TriangleData1315.coefficient100_200,
  OriginalRow227TriangleData1315.coefficient100_201,
  OriginalRow227TriangleData1315.coefficient100_202,
  OriginalRow227TriangleData1315.coefficient100_203,
  OriginalRow227TriangleData1315.coefficient100_204,
  OriginalRow227TriangleData1315.coefficient100_205,
  OriginalRow227TriangleData1315.coefficient100_206,
  OriginalRow227TriangleData1315.coefficient100_207,
  OriginalRow227TriangleData1315.coefficient100_208,
  OriginalRow227TriangleData1315.coefficient100_209,
  OriginalRow227TriangleData1315.coefficient100_210,
  OriginalRow227TriangleData1315.coefficient100_211,
  OriginalRow227TriangleData1315.coefficient100_212,
  OriginalRow227TriangleData1315.coefficient100_213,
  OriginalRow227TriangleData1315.coefficient100_214,
  OriginalRow227TriangleData1315.coefficient100_215,
  OriginalRow227TriangleData1315.coefficient100_216,
  OriginalRow227TriangleData1315.coefficient100_217,
  OriginalRow227TriangleData1315.coefficient100_218,
  OriginalRow227TriangleData1315.coefficient100_219,
  OriginalRow227TriangleData1315.coefficient100_220,
  OriginalRow227TriangleData1315.coefficient100_221,
  OriginalRow227TriangleData1315.coefficient100_222,
  OriginalRow227TriangleData1315.coefficient100_223,
  OriginalRow227TriangleData1315.coefficient100_224,
  OriginalRow227TriangleData1315.coefficient100_225,
  OriginalRow227TriangleData1315.coefficient100_226
]

theorem values1315_size : values1315.size = 32 := rfl

def block1315 : ℕ → Option IntervalDyadic := segment 195 values1315

theorem block1315_domain : ExactDomain block1315 195 227 := by
  simpa only [values1315_size] using segment_domain 195 values1315

theorem block1315_get (i : Fin 32) :
    block1315 (195 + i.val) = some (values1315[i.val]'(by rw [values1315_size]; exact i.isLt)) := by
  exact segment_get 195 values1315 ⟨i.val, by rw [values1315_size]; exact i.isLt⟩

def values1316 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1316.coefficient100_227,
  OriginalRow227TriangleData1316.coefficient100_228,
  OriginalRow227TriangleData1316.coefficient100_229,
  OriginalRow227TriangleData1316.coefficient100_230,
  OriginalRow227TriangleData1316.coefficient100_231,
  OriginalRow227TriangleData1316.coefficient100_232,
  OriginalRow227TriangleData1316.coefficient100_233,
  OriginalRow227TriangleData1316.coefficient100_234,
  OriginalRow227TriangleData1316.coefficient100_235,
  OriginalRow227TriangleData1316.coefficient100_236,
  OriginalRow227TriangleData1316.coefficient100_237,
  OriginalRow227TriangleData1316.coefficient100_238,
  OriginalRow227TriangleData1316.coefficient100_239,
  OriginalRow227TriangleData1316.coefficient100_240,
  OriginalRow227TriangleData1316.coefficient100_241,
  OriginalRow227TriangleData1316.coefficient100_242,
  OriginalRow227TriangleData1316.coefficient100_243,
  OriginalRow227TriangleData1316.coefficient100_244,
  OriginalRow227TriangleData1316.coefficient100_245,
  OriginalRow227TriangleData1316.coefficient100_246,
  OriginalRow227TriangleData1316.coefficient100_247,
  OriginalRow227TriangleData1316.coefficient100_248,
  OriginalRow227TriangleData1316.coefficient100_249,
  OriginalRow227TriangleData1316.coefficient100_250,
  OriginalRow227TriangleData1316.coefficient100_251,
  OriginalRow227TriangleData1316.coefficient100_252,
  OriginalRow227TriangleData1316.coefficient100_253,
  OriginalRow227TriangleData1316.coefficient100_254,
  OriginalRow227TriangleData1316.coefficient100_255,
  OriginalRow227TriangleData1316.coefficient100_256,
  OriginalRow227TriangleData1316.coefficient100_257,
  OriginalRow227TriangleData1316.coefficient100_258
]

theorem values1316_size : values1316.size = 32 := rfl

def block1316 : ℕ → Option IntervalDyadic := segment 227 values1316

theorem block1316_domain : ExactDomain block1316 227 259 := by
  simpa only [values1316_size] using segment_domain 227 values1316

theorem block1316_get (i : Fin 32) :
    block1316 (227 + i.val) = some (values1316[i.val]'(by rw [values1316_size]; exact i.isLt)) := by
  exact segment_get 227 values1316 ⟨i.val, by rw [values1316_size]; exact i.isLt⟩

def values1317 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1317.coefficient100_259,
  OriginalRow227TriangleData1317.coefficient100_260,
  OriginalRow227TriangleData1317.coefficient100_261,
  OriginalRow227TriangleData1317.coefficient100_262,
  OriginalRow227TriangleData1317.coefficient100_263,
  OriginalRow227TriangleData1317.coefficient100_264,
  OriginalRow227TriangleData1317.coefficient100_265,
  OriginalRow227TriangleData1317.coefficient100_266,
  OriginalRow227TriangleData1317.coefficient100_267,
  OriginalRow227TriangleData1317.coefficient100_268,
  OriginalRow227TriangleData1317.coefficient100_269,
  OriginalRow227TriangleData1317.coefficient100_270,
  OriginalRow227TriangleData1317.coefficient100_271,
  OriginalRow227TriangleData1317.coefficient100_272,
  OriginalRow227TriangleData1317.coefficient100_273,
  OriginalRow227TriangleData1317.coefficient100_274,
  OriginalRow227TriangleData1317.coefficient100_275,
  OriginalRow227TriangleData1317.coefficient100_276,
  OriginalRow227TriangleData1317.coefficient100_277,
  OriginalRow227TriangleData1317.coefficient100_278,
  OriginalRow227TriangleData1317.coefficient100_279,
  OriginalRow227TriangleData1317.coefficient100_280,
  OriginalRow227TriangleData1317.coefficient100_281,
  OriginalRow227TriangleData1317.coefficient100_282,
  OriginalRow227TriangleData1317.coefficient100_283,
  OriginalRow227TriangleData1317.coefficient100_284,
  OriginalRow227TriangleData1317.coefficient100_285,
  OriginalRow227TriangleData1317.coefficient100_286,
  OriginalRow227TriangleData1317.coefficient100_287,
  OriginalRow227TriangleData1317.coefficient100_288,
  OriginalRow227TriangleData1317.coefficient100_289,
  OriginalRow227TriangleData1317.coefficient100_290
]

theorem values1317_size : values1317.size = 32 := rfl

def block1317 : ℕ → Option IntervalDyadic := segment 259 values1317

theorem block1317_domain : ExactDomain block1317 259 291 := by
  simpa only [values1317_size] using segment_domain 259 values1317

theorem block1317_get (i : Fin 32) :
    block1317 (259 + i.val) = some (values1317[i.val]'(by rw [values1317_size]; exact i.isLt)) := by
  exact segment_get 259 values1317 ⟨i.val, by rw [values1317_size]; exact i.isLt⟩

def values1318 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1318.coefficient100_291,
  OriginalRow227TriangleData1318.coefficient100_292,
  OriginalRow227TriangleData1318.coefficient100_293,
  OriginalRow227TriangleData1318.coefficient100_294,
  OriginalRow227TriangleData1318.coefficient100_295,
  OriginalRow227TriangleData1318.coefficient100_296,
  OriginalRow227TriangleData1318.coefficient100_297,
  OriginalRow227TriangleData1318.coefficient100_298,
  OriginalRow227TriangleData1318.coefficient100_299,
  OriginalRow227TriangleData1318.coefficient100_300,
  OriginalRow227TriangleData1318.coefficient100_301,
  OriginalRow227TriangleData1318.coefficient100_302,
  OriginalRow227TriangleData1318.coefficient100_303,
  OriginalRow227TriangleData1318.coefficient100_304,
  OriginalRow227TriangleData1318.coefficient100_305,
  OriginalRow227TriangleData1318.coefficient100_306,
  OriginalRow227TriangleData1318.coefficient100_307,
  OriginalRow227TriangleData1318.coefficient100_308,
  OriginalRow227TriangleData1318.coefficient100_309,
  OriginalRow227TriangleData1318.coefficient100_310,
  OriginalRow227TriangleData1318.coefficient100_311,
  OriginalRow227TriangleData1318.coefficient100_312,
  OriginalRow227TriangleData1318.coefficient100_313,
  OriginalRow227TriangleData1318.coefficient100_314,
  OriginalRow227TriangleData1318.coefficient100_315,
  OriginalRow227TriangleData1318.coefficient100_316,
  OriginalRow227TriangleData1318.coefficient100_317,
  OriginalRow227TriangleData1318.coefficient100_318,
  OriginalRow227TriangleData1318.coefficient100_319,
  OriginalRow227TriangleData1318.coefficient100_320,
  OriginalRow227TriangleData1318.coefficient100_321,
  OriginalRow227TriangleData1318.coefficient100_322
]

theorem values1318_size : values1318.size = 32 := rfl

def block1318 : ℕ → Option IntervalDyadic := segment 291 values1318

theorem block1318_domain : ExactDomain block1318 291 323 := by
  simpa only [values1318_size] using segment_domain 291 values1318

theorem block1318_get (i : Fin 32) :
    block1318 (291 + i.val) = some (values1318[i.val]'(by rw [values1318_size]; exact i.isLt)) := by
  exact segment_get 291 values1318 ⟨i.val, by rw [values1318_size]; exact i.isLt⟩

def values1319 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1319.coefficient100_323,
  OriginalRow227TriangleData1319.coefficient100_324,
  OriginalRow227TriangleData1319.coefficient100_325,
  OriginalRow227TriangleData1319.coefficient100_326,
  OriginalRow227TriangleData1319.coefficient100_327,
  OriginalRow227TriangleData1319.coefficient100_328,
  OriginalRow227TriangleData1319.coefficient100_329,
  OriginalRow227TriangleData1319.coefficient100_330,
  OriginalRow227TriangleData1319.coefficient100_331,
  OriginalRow227TriangleData1319.coefficient100_332,
  OriginalRow227TriangleData1319.coefficient100_333,
  OriginalRow227TriangleData1319.coefficient100_334,
  OriginalRow227TriangleData1319.coefficient100_335,
  OriginalRow227TriangleData1319.coefficient100_336,
  OriginalRow227TriangleData1319.coefficient100_337,
  OriginalRow227TriangleData1319.coefficient100_338,
  OriginalRow227TriangleData1319.coefficient100_339,
  OriginalRow227TriangleData1319.coefficient100_340,
  OriginalRow227TriangleData1319.coefficient100_341,
  OriginalRow227TriangleData1319.coefficient100_342,
  OriginalRow227TriangleData1319.coefficient100_343,
  OriginalRow227TriangleData1319.coefficient100_344,
  OriginalRow227TriangleData1319.coefficient100_345,
  OriginalRow227TriangleData1319.coefficient100_346,
  OriginalRow227TriangleData1319.coefficient100_347,
  OriginalRow227TriangleData1319.coefficient100_348,
  OriginalRow227TriangleData1319.coefficient100_349,
  OriginalRow227TriangleData1319.coefficient100_350,
  OriginalRow227TriangleData1319.coefficient100_351,
  OriginalRow227TriangleData1319.coefficient100_352,
  OriginalRow227TriangleData1319.coefficient100_353,
  OriginalRow227TriangleData1319.coefficient100_354
]

theorem values1319_size : values1319.size = 32 := rfl

def block1319 : ℕ → Option IntervalDyadic := segment 323 values1319

theorem block1319_domain : ExactDomain block1319 323 355 := by
  simpa only [values1319_size] using segment_domain 323 values1319

theorem block1319_get (i : Fin 32) :
    block1319 (323 + i.val) = some (values1319[i.val]'(by rw [values1319_size]; exact i.isLt)) := by
  exact segment_get 323 values1319 ⟨i.val, by rw [values1319_size]; exact i.isLt⟩

def values1320 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1320.coefficient100_355,
  OriginalRow227TriangleData1320.coefficient100_356,
  OriginalRow227TriangleData1320.coefficient100_357,
  OriginalRow227TriangleData1320.coefficient100_358,
  OriginalRow227TriangleData1320.coefficient100_359,
  OriginalRow227TriangleData1320.coefficient100_360,
  OriginalRow227TriangleData1320.coefficient100_361,
  OriginalRow227TriangleData1320.coefficient100_362,
  OriginalRow227TriangleData1320.coefficient100_363,
  OriginalRow227TriangleData1320.coefficient100_364,
  OriginalRow227TriangleData1320.coefficient100_365,
  OriginalRow227TriangleData1320.coefficient100_366,
  OriginalRow227TriangleData1320.coefficient100_367,
  OriginalRow227TriangleData1320.coefficient100_368,
  OriginalRow227TriangleData1320.coefficient100_369,
  OriginalRow227TriangleData1320.coefficient100_370,
  OriginalRow227TriangleData1320.coefficient100_371,
  OriginalRow227TriangleData1320.coefficient100_372,
  OriginalRow227TriangleData1320.coefficient100_373,
  OriginalRow227TriangleData1320.coefficient100_374,
  OriginalRow227TriangleData1320.coefficient100_375,
  OriginalRow227TriangleData1320.coefficient100_376,
  OriginalRow227TriangleData1320.coefficient100_377,
  OriginalRow227TriangleData1320.coefficient100_378,
  OriginalRow227TriangleData1320.coefficient100_379,
  OriginalRow227TriangleData1320.coefficient100_380,
  OriginalRow227TriangleData1320.coefficient100_381,
  OriginalRow227TriangleData1320.coefficient100_382,
  OriginalRow227TriangleData1320.coefficient100_383,
  OriginalRow227TriangleData1320.coefficient100_384,
  OriginalRow227TriangleData1320.coefficient100_385,
  OriginalRow227TriangleData1320.coefficient100_386
]

theorem values1320_size : values1320.size = 32 := rfl

def block1320 : ℕ → Option IntervalDyadic := segment 355 values1320

theorem block1320_domain : ExactDomain block1320 355 387 := by
  simpa only [values1320_size] using segment_domain 355 values1320

theorem block1320_get (i : Fin 32) :
    block1320 (355 + i.val) = some (values1320[i.val]'(by rw [values1320_size]; exact i.isLt)) := by
  exact segment_get 355 values1320 ⟨i.val, by rw [values1320_size]; exact i.isLt⟩

def values1321 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1321.coefficient100_387,
  OriginalRow227TriangleData1321.coefficient100_388,
  OriginalRow227TriangleData1321.coefficient100_389,
  OriginalRow227TriangleData1321.coefficient100_390,
  OriginalRow227TriangleData1321.coefficient100_391,
  OriginalRow227TriangleData1321.coefficient100_392,
  OriginalRow227TriangleData1321.coefficient100_393,
  OriginalRow227TriangleData1321.coefficient100_394,
  OriginalRow227TriangleData1321.coefficient100_395,
  OriginalRow227TriangleData1321.coefficient100_396,
  OriginalRow227TriangleData1321.coefficient100_397,
  OriginalRow227TriangleData1321.coefficient100_398,
  OriginalRow227TriangleData1321.coefficient100_399,
  OriginalRow227TriangleData1321.coefficient100_400,
  OriginalRow227TriangleData1321.coefficient100_401
]

theorem values1321_size : values1321.size = 15 := rfl

def block1321 : ℕ → Option IntervalDyadic := segment 387 values1321

theorem block1321_domain : ExactDomain block1321 387 402 := by
  simpa only [values1321_size] using segment_domain 387 values1321

theorem block1321_get (i : Fin 15) :
    block1321 (387 + i.val) = some (values1321[i.val]'(by rw [values1321_size]; exact i.isLt)) := by
  exact segment_get 387 values1321 ⟨i.val, by rw [values1321_size]; exact i.isLt⟩

def node0099_0163 : ℕ → Option IntervalDyadic := split 131 block1312 block1313

theorem node0099_0163_domain : ExactDomain node0099_0163 99 163 := by
  exact split_domain (by decide) (by decide) block1312_domain block1313_domain

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block1315 block1316

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block1315_domain block1316_domain

def node0163_0259 : ℕ → Option IntervalDyadic := split 195 block1314 node0195_0259

theorem node0163_0259_domain : ExactDomain node0163_0259 163 259 := by
  exact split_domain (by decide) (by decide) block1314_domain node0195_0259_domain

def node0099_0259 : ℕ → Option IntervalDyadic := split 163 node0099_0163 node0163_0259

theorem node0099_0259_domain : ExactDomain node0099_0259 99 259 := by
  exact split_domain (by decide) (by decide) node0099_0163_domain node0163_0259_domain

def node0259_0323 : ℕ → Option IntervalDyadic := split 291 block1317 block1318

theorem node0259_0323_domain : ExactDomain node0259_0323 259 323 := by
  exact split_domain (by decide) (by decide) block1317_domain block1318_domain

def node0355_0402 : ℕ → Option IntervalDyadic := split 387 block1320 block1321

theorem node0355_0402_domain : ExactDomain node0355_0402 355 402 := by
  exact split_domain (by decide) (by decide) block1320_domain block1321_domain

def node0323_0402 : ℕ → Option IntervalDyadic := split 355 block1319 node0355_0402

theorem node0323_0402_domain : ExactDomain node0323_0402 323 402 := by
  exact split_domain (by decide) (by decide) block1319_domain node0355_0402_domain

def node0259_0402 : ℕ → Option IntervalDyadic := split 323 node0259_0323 node0323_0402

theorem node0259_0402_domain : ExactDomain node0259_0402 259 402 := by
  exact split_domain (by decide) (by decide) node0259_0323_domain node0323_0402_domain

def node0099_0402 : ℕ → Option IntervalDyadic := split 259 node0099_0259 node0259_0402

theorem node0099_0402_domain : ExactDomain node0099_0402 99 402 := by
  exact split_domain (by decide) (by decide) node0099_0259_domain node0259_0402_domain

def lookup : ℕ → Option IntervalDyadic := node0099_0402

theorem lookup_domain : ExactDomain lookup 99 402 :=
  node0099_0402_domain

theorem block1312_lookup (i : Fin 32) :
    lookup (99 + i.val) = some (values1312[i.val]'(by rw [values1312_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (99 + i.val) = _
  rw [node0099_0402, split_left 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0099_0259, split_left 163 node0099_0163 node0163_0259 (by omega)]
  rw [node0099_0163, split_left 131 block1312 block1313 (by omega)]
  exact block1312_get i

theorem block1313_lookup (i : Fin 32) :
    lookup (131 + i.val) = some (values1313[i.val]'(by rw [values1313_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (131 + i.val) = _
  rw [node0099_0402, split_left 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0099_0259, split_left 163 node0099_0163 node0163_0259 (by omega)]
  rw [node0099_0163, split_right 131 block1312 block1313 (by omega)]
  exact block1313_get i

theorem block1314_lookup (i : Fin 32) :
    lookup (163 + i.val) = some (values1314[i.val]'(by rw [values1314_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (163 + i.val) = _
  rw [node0099_0402, split_left 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0099_0259, split_right 163 node0099_0163 node0163_0259 (by omega)]
  rw [node0163_0259, split_left 195 block1314 node0195_0259 (by omega)]
  exact block1314_get i

theorem block1315_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values1315[i.val]'(by rw [values1315_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (195 + i.val) = _
  rw [node0099_0402, split_left 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0099_0259, split_right 163 node0099_0163 node0163_0259 (by omega)]
  rw [node0163_0259, split_right 195 block1314 node0195_0259 (by omega)]
  rw [node0195_0259, split_left 227 block1315 block1316 (by omega)]
  exact block1315_get i

theorem block1316_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values1316[i.val]'(by rw [values1316_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (227 + i.val) = _
  rw [node0099_0402, split_left 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0099_0259, split_right 163 node0099_0163 node0163_0259 (by omega)]
  rw [node0163_0259, split_right 195 block1314 node0195_0259 (by omega)]
  rw [node0195_0259, split_right 227 block1315 block1316 (by omega)]
  exact block1316_get i

theorem block1317_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values1317[i.val]'(by rw [values1317_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (259 + i.val) = _
  rw [node0099_0402, split_right 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0259_0402, split_left 323 node0259_0323 node0323_0402 (by omega)]
  rw [node0259_0323, split_left 291 block1317 block1318 (by omega)]
  exact block1317_get i

theorem block1318_lookup (i : Fin 32) :
    lookup (291 + i.val) = some (values1318[i.val]'(by rw [values1318_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (291 + i.val) = _
  rw [node0099_0402, split_right 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0259_0402, split_left 323 node0259_0323 node0323_0402 (by omega)]
  rw [node0259_0323, split_right 291 block1317 block1318 (by omega)]
  exact block1318_get i

theorem block1319_lookup (i : Fin 32) :
    lookup (323 + i.val) = some (values1319[i.val]'(by rw [values1319_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (323 + i.val) = _
  rw [node0099_0402, split_right 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0259_0402, split_right 323 node0259_0323 node0323_0402 (by omega)]
  rw [node0323_0402, split_left 355 block1319 node0355_0402 (by omega)]
  exact block1319_get i

theorem block1320_lookup (i : Fin 32) :
    lookup (355 + i.val) = some (values1320[i.val]'(by rw [values1320_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (355 + i.val) = _
  rw [node0099_0402, split_right 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0259_0402, split_right 323 node0259_0323 node0323_0402 (by omega)]
  rw [node0323_0402, split_right 355 block1319 node0355_0402 (by omega)]
  rw [node0355_0402, split_left 387 block1320 block1321 (by omega)]
  exact block1320_get i

theorem block1321_lookup (i : Fin 15) :
    lookup (387 + i.val) = some (values1321[i.val]'(by rw [values1321_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0099_0402 (387 + i.val) = _
  rw [node0099_0402, split_right 259 node0099_0259 node0259_0402 (by omega)]
  rw [node0259_0402, split_right 323 node0259_0323 node0323_0402 (by omega)]
  rw [node0323_0402, split_right 355 block1319 node0355_0402 (by omega)]
  rw [node0355_0402, split_right 387 block1320 block1321 (by omega)]
  exact block1321_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1312_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1312_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1313_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1313_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1314_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1314_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1315_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1315_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1316_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1316_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1317_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1317_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1318_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1318_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1319_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1319_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1320_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1320_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1321_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1321_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1312_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1313_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1314_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1315_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1316_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1317_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1318_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1319_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1320_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow100.block1321_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow100
