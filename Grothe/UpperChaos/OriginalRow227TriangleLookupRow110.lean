import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1410
import Grothe.UpperChaos.OriginalRow227TriangleData1411
import Grothe.UpperChaos.OriginalRow227TriangleData1412
import Grothe.UpperChaos.OriginalRow227TriangleData1413
import Grothe.UpperChaos.OriginalRow227TriangleData1414
import Grothe.UpperChaos.OriginalRow227TriangleData1415
import Grothe.UpperChaos.OriginalRow227TriangleData1416
import Grothe.UpperChaos.OriginalRow227TriangleData1417
import Grothe.UpperChaos.OriginalRow227TriangleData1418

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow110

open ConditionalTableLookup

def values1410 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1410.coefficient110_109,
  OriginalRow227TriangleData1410.coefficient110_110,
  OriginalRow227TriangleData1410.coefficient110_111,
  OriginalRow227TriangleData1410.coefficient110_112,
  OriginalRow227TriangleData1410.coefficient110_113,
  OriginalRow227TriangleData1410.coefficient110_114,
  OriginalRow227TriangleData1410.coefficient110_115,
  OriginalRow227TriangleData1410.coefficient110_116,
  OriginalRow227TriangleData1410.coefficient110_117,
  OriginalRow227TriangleData1410.coefficient110_118,
  OriginalRow227TriangleData1410.coefficient110_119,
  OriginalRow227TriangleData1410.coefficient110_120,
  OriginalRow227TriangleData1410.coefficient110_121,
  OriginalRow227TriangleData1410.coefficient110_122,
  OriginalRow227TriangleData1410.coefficient110_123,
  OriginalRow227TriangleData1410.coefficient110_124,
  OriginalRow227TriangleData1410.coefficient110_125,
  OriginalRow227TriangleData1410.coefficient110_126,
  OriginalRow227TriangleData1410.coefficient110_127,
  OriginalRow227TriangleData1410.coefficient110_128,
  OriginalRow227TriangleData1410.coefficient110_129,
  OriginalRow227TriangleData1410.coefficient110_130,
  OriginalRow227TriangleData1410.coefficient110_131,
  OriginalRow227TriangleData1410.coefficient110_132,
  OriginalRow227TriangleData1410.coefficient110_133,
  OriginalRow227TriangleData1410.coefficient110_134,
  OriginalRow227TriangleData1410.coefficient110_135,
  OriginalRow227TriangleData1410.coefficient110_136,
  OriginalRow227TriangleData1410.coefficient110_137,
  OriginalRow227TriangleData1410.coefficient110_138,
  OriginalRow227TriangleData1410.coefficient110_139,
  OriginalRow227TriangleData1410.coefficient110_140
]

theorem values1410_size : values1410.size = 32 := rfl

def block1410 : ℕ → Option IntervalDyadic := segment 109 values1410

theorem block1410_domain : ExactDomain block1410 109 141 := by
  simpa only [values1410_size] using segment_domain 109 values1410

theorem block1410_get (i : Fin 32) :
    block1410 (109 + i.val) = some (values1410[i.val]'(by rw [values1410_size]; exact i.isLt)) := by
  exact segment_get 109 values1410 ⟨i.val, by rw [values1410_size]; exact i.isLt⟩

def values1411 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1411.coefficient110_141,
  OriginalRow227TriangleData1411.coefficient110_142,
  OriginalRow227TriangleData1411.coefficient110_143,
  OriginalRow227TriangleData1411.coefficient110_144,
  OriginalRow227TriangleData1411.coefficient110_145,
  OriginalRow227TriangleData1411.coefficient110_146,
  OriginalRow227TriangleData1411.coefficient110_147,
  OriginalRow227TriangleData1411.coefficient110_148,
  OriginalRow227TriangleData1411.coefficient110_149,
  OriginalRow227TriangleData1411.coefficient110_150,
  OriginalRow227TriangleData1411.coefficient110_151,
  OriginalRow227TriangleData1411.coefficient110_152,
  OriginalRow227TriangleData1411.coefficient110_153,
  OriginalRow227TriangleData1411.coefficient110_154,
  OriginalRow227TriangleData1411.coefficient110_155,
  OriginalRow227TriangleData1411.coefficient110_156,
  OriginalRow227TriangleData1411.coefficient110_157,
  OriginalRow227TriangleData1411.coefficient110_158,
  OriginalRow227TriangleData1411.coefficient110_159,
  OriginalRow227TriangleData1411.coefficient110_160,
  OriginalRow227TriangleData1411.coefficient110_161,
  OriginalRow227TriangleData1411.coefficient110_162,
  OriginalRow227TriangleData1411.coefficient110_163,
  OriginalRow227TriangleData1411.coefficient110_164,
  OriginalRow227TriangleData1411.coefficient110_165,
  OriginalRow227TriangleData1411.coefficient110_166,
  OriginalRow227TriangleData1411.coefficient110_167,
  OriginalRow227TriangleData1411.coefficient110_168,
  OriginalRow227TriangleData1411.coefficient110_169,
  OriginalRow227TriangleData1411.coefficient110_170,
  OriginalRow227TriangleData1411.coefficient110_171,
  OriginalRow227TriangleData1411.coefficient110_172
]

theorem values1411_size : values1411.size = 32 := rfl

def block1411 : ℕ → Option IntervalDyadic := segment 141 values1411

theorem block1411_domain : ExactDomain block1411 141 173 := by
  simpa only [values1411_size] using segment_domain 141 values1411

theorem block1411_get (i : Fin 32) :
    block1411 (141 + i.val) = some (values1411[i.val]'(by rw [values1411_size]; exact i.isLt)) := by
  exact segment_get 141 values1411 ⟨i.val, by rw [values1411_size]; exact i.isLt⟩

def values1412 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1412.coefficient110_173,
  OriginalRow227TriangleData1412.coefficient110_174,
  OriginalRow227TriangleData1412.coefficient110_175,
  OriginalRow227TriangleData1412.coefficient110_176,
  OriginalRow227TriangleData1412.coefficient110_177,
  OriginalRow227TriangleData1412.coefficient110_178,
  OriginalRow227TriangleData1412.coefficient110_179,
  OriginalRow227TriangleData1412.coefficient110_180,
  OriginalRow227TriangleData1412.coefficient110_181,
  OriginalRow227TriangleData1412.coefficient110_182,
  OriginalRow227TriangleData1412.coefficient110_183,
  OriginalRow227TriangleData1412.coefficient110_184,
  OriginalRow227TriangleData1412.coefficient110_185,
  OriginalRow227TriangleData1412.coefficient110_186,
  OriginalRow227TriangleData1412.coefficient110_187,
  OriginalRow227TriangleData1412.coefficient110_188,
  OriginalRow227TriangleData1412.coefficient110_189,
  OriginalRow227TriangleData1412.coefficient110_190,
  OriginalRow227TriangleData1412.coefficient110_191,
  OriginalRow227TriangleData1412.coefficient110_192,
  OriginalRow227TriangleData1412.coefficient110_193,
  OriginalRow227TriangleData1412.coefficient110_194,
  OriginalRow227TriangleData1412.coefficient110_195,
  OriginalRow227TriangleData1412.coefficient110_196,
  OriginalRow227TriangleData1412.coefficient110_197,
  OriginalRow227TriangleData1412.coefficient110_198,
  OriginalRow227TriangleData1412.coefficient110_199,
  OriginalRow227TriangleData1412.coefficient110_200,
  OriginalRow227TriangleData1412.coefficient110_201,
  OriginalRow227TriangleData1412.coefficient110_202,
  OriginalRow227TriangleData1412.coefficient110_203,
  OriginalRow227TriangleData1412.coefficient110_204
]

theorem values1412_size : values1412.size = 32 := rfl

def block1412 : ℕ → Option IntervalDyadic := segment 173 values1412

theorem block1412_domain : ExactDomain block1412 173 205 := by
  simpa only [values1412_size] using segment_domain 173 values1412

theorem block1412_get (i : Fin 32) :
    block1412 (173 + i.val) = some (values1412[i.val]'(by rw [values1412_size]; exact i.isLt)) := by
  exact segment_get 173 values1412 ⟨i.val, by rw [values1412_size]; exact i.isLt⟩

def values1413 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1413.coefficient110_205,
  OriginalRow227TriangleData1413.coefficient110_206,
  OriginalRow227TriangleData1413.coefficient110_207,
  OriginalRow227TriangleData1413.coefficient110_208,
  OriginalRow227TriangleData1413.coefficient110_209,
  OriginalRow227TriangleData1413.coefficient110_210,
  OriginalRow227TriangleData1413.coefficient110_211,
  OriginalRow227TriangleData1413.coefficient110_212,
  OriginalRow227TriangleData1413.coefficient110_213,
  OriginalRow227TriangleData1413.coefficient110_214,
  OriginalRow227TriangleData1413.coefficient110_215,
  OriginalRow227TriangleData1413.coefficient110_216,
  OriginalRow227TriangleData1413.coefficient110_217,
  OriginalRow227TriangleData1413.coefficient110_218,
  OriginalRow227TriangleData1413.coefficient110_219,
  OriginalRow227TriangleData1413.coefficient110_220,
  OriginalRow227TriangleData1413.coefficient110_221,
  OriginalRow227TriangleData1413.coefficient110_222,
  OriginalRow227TriangleData1413.coefficient110_223,
  OriginalRow227TriangleData1413.coefficient110_224,
  OriginalRow227TriangleData1413.coefficient110_225,
  OriginalRow227TriangleData1413.coefficient110_226,
  OriginalRow227TriangleData1413.coefficient110_227,
  OriginalRow227TriangleData1413.coefficient110_228,
  OriginalRow227TriangleData1413.coefficient110_229,
  OriginalRow227TriangleData1413.coefficient110_230,
  OriginalRow227TriangleData1413.coefficient110_231,
  OriginalRow227TriangleData1413.coefficient110_232,
  OriginalRow227TriangleData1413.coefficient110_233,
  OriginalRow227TriangleData1413.coefficient110_234,
  OriginalRow227TriangleData1413.coefficient110_235,
  OriginalRow227TriangleData1413.coefficient110_236
]

theorem values1413_size : values1413.size = 32 := rfl

def block1413 : ℕ → Option IntervalDyadic := segment 205 values1413

theorem block1413_domain : ExactDomain block1413 205 237 := by
  simpa only [values1413_size] using segment_domain 205 values1413

theorem block1413_get (i : Fin 32) :
    block1413 (205 + i.val) = some (values1413[i.val]'(by rw [values1413_size]; exact i.isLt)) := by
  exact segment_get 205 values1413 ⟨i.val, by rw [values1413_size]; exact i.isLt⟩

def values1414 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1414.coefficient110_237,
  OriginalRow227TriangleData1414.coefficient110_238,
  OriginalRow227TriangleData1414.coefficient110_239,
  OriginalRow227TriangleData1414.coefficient110_240,
  OriginalRow227TriangleData1414.coefficient110_241,
  OriginalRow227TriangleData1414.coefficient110_242,
  OriginalRow227TriangleData1414.coefficient110_243,
  OriginalRow227TriangleData1414.coefficient110_244,
  OriginalRow227TriangleData1414.coefficient110_245,
  OriginalRow227TriangleData1414.coefficient110_246,
  OriginalRow227TriangleData1414.coefficient110_247,
  OriginalRow227TriangleData1414.coefficient110_248,
  OriginalRow227TriangleData1414.coefficient110_249,
  OriginalRow227TriangleData1414.coefficient110_250,
  OriginalRow227TriangleData1414.coefficient110_251,
  OriginalRow227TriangleData1414.coefficient110_252,
  OriginalRow227TriangleData1414.coefficient110_253,
  OriginalRow227TriangleData1414.coefficient110_254,
  OriginalRow227TriangleData1414.coefficient110_255,
  OriginalRow227TriangleData1414.coefficient110_256,
  OriginalRow227TriangleData1414.coefficient110_257,
  OriginalRow227TriangleData1414.coefficient110_258,
  OriginalRow227TriangleData1414.coefficient110_259,
  OriginalRow227TriangleData1414.coefficient110_260,
  OriginalRow227TriangleData1414.coefficient110_261,
  OriginalRow227TriangleData1414.coefficient110_262,
  OriginalRow227TriangleData1414.coefficient110_263,
  OriginalRow227TriangleData1414.coefficient110_264,
  OriginalRow227TriangleData1414.coefficient110_265,
  OriginalRow227TriangleData1414.coefficient110_266,
  OriginalRow227TriangleData1414.coefficient110_267,
  OriginalRow227TriangleData1414.coefficient110_268
]

theorem values1414_size : values1414.size = 32 := rfl

def block1414 : ℕ → Option IntervalDyadic := segment 237 values1414

theorem block1414_domain : ExactDomain block1414 237 269 := by
  simpa only [values1414_size] using segment_domain 237 values1414

theorem block1414_get (i : Fin 32) :
    block1414 (237 + i.val) = some (values1414[i.val]'(by rw [values1414_size]; exact i.isLt)) := by
  exact segment_get 237 values1414 ⟨i.val, by rw [values1414_size]; exact i.isLt⟩

def values1415 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1415.coefficient110_269,
  OriginalRow227TriangleData1415.coefficient110_270,
  OriginalRow227TriangleData1415.coefficient110_271,
  OriginalRow227TriangleData1415.coefficient110_272,
  OriginalRow227TriangleData1415.coefficient110_273,
  OriginalRow227TriangleData1415.coefficient110_274,
  OriginalRow227TriangleData1415.coefficient110_275,
  OriginalRow227TriangleData1415.coefficient110_276,
  OriginalRow227TriangleData1415.coefficient110_277,
  OriginalRow227TriangleData1415.coefficient110_278,
  OriginalRow227TriangleData1415.coefficient110_279,
  OriginalRow227TriangleData1415.coefficient110_280,
  OriginalRow227TriangleData1415.coefficient110_281,
  OriginalRow227TriangleData1415.coefficient110_282,
  OriginalRow227TriangleData1415.coefficient110_283,
  OriginalRow227TriangleData1415.coefficient110_284,
  OriginalRow227TriangleData1415.coefficient110_285,
  OriginalRow227TriangleData1415.coefficient110_286,
  OriginalRow227TriangleData1415.coefficient110_287,
  OriginalRow227TriangleData1415.coefficient110_288,
  OriginalRow227TriangleData1415.coefficient110_289,
  OriginalRow227TriangleData1415.coefficient110_290,
  OriginalRow227TriangleData1415.coefficient110_291,
  OriginalRow227TriangleData1415.coefficient110_292,
  OriginalRow227TriangleData1415.coefficient110_293,
  OriginalRow227TriangleData1415.coefficient110_294,
  OriginalRow227TriangleData1415.coefficient110_295,
  OriginalRow227TriangleData1415.coefficient110_296,
  OriginalRow227TriangleData1415.coefficient110_297,
  OriginalRow227TriangleData1415.coefficient110_298,
  OriginalRow227TriangleData1415.coefficient110_299,
  OriginalRow227TriangleData1415.coefficient110_300
]

theorem values1415_size : values1415.size = 32 := rfl

def block1415 : ℕ → Option IntervalDyadic := segment 269 values1415

theorem block1415_domain : ExactDomain block1415 269 301 := by
  simpa only [values1415_size] using segment_domain 269 values1415

theorem block1415_get (i : Fin 32) :
    block1415 (269 + i.val) = some (values1415[i.val]'(by rw [values1415_size]; exact i.isLt)) := by
  exact segment_get 269 values1415 ⟨i.val, by rw [values1415_size]; exact i.isLt⟩

def values1416 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1416.coefficient110_301,
  OriginalRow227TriangleData1416.coefficient110_302,
  OriginalRow227TriangleData1416.coefficient110_303,
  OriginalRow227TriangleData1416.coefficient110_304,
  OriginalRow227TriangleData1416.coefficient110_305,
  OriginalRow227TriangleData1416.coefficient110_306,
  OriginalRow227TriangleData1416.coefficient110_307,
  OriginalRow227TriangleData1416.coefficient110_308,
  OriginalRow227TriangleData1416.coefficient110_309,
  OriginalRow227TriangleData1416.coefficient110_310,
  OriginalRow227TriangleData1416.coefficient110_311,
  OriginalRow227TriangleData1416.coefficient110_312,
  OriginalRow227TriangleData1416.coefficient110_313,
  OriginalRow227TriangleData1416.coefficient110_314,
  OriginalRow227TriangleData1416.coefficient110_315,
  OriginalRow227TriangleData1416.coefficient110_316,
  OriginalRow227TriangleData1416.coefficient110_317,
  OriginalRow227TriangleData1416.coefficient110_318,
  OriginalRow227TriangleData1416.coefficient110_319,
  OriginalRow227TriangleData1416.coefficient110_320,
  OriginalRow227TriangleData1416.coefficient110_321,
  OriginalRow227TriangleData1416.coefficient110_322,
  OriginalRow227TriangleData1416.coefficient110_323,
  OriginalRow227TriangleData1416.coefficient110_324,
  OriginalRow227TriangleData1416.coefficient110_325,
  OriginalRow227TriangleData1416.coefficient110_326,
  OriginalRow227TriangleData1416.coefficient110_327,
  OriginalRow227TriangleData1416.coefficient110_328,
  OriginalRow227TriangleData1416.coefficient110_329,
  OriginalRow227TriangleData1416.coefficient110_330,
  OriginalRow227TriangleData1416.coefficient110_331,
  OriginalRow227TriangleData1416.coefficient110_332
]

theorem values1416_size : values1416.size = 32 := rfl

def block1416 : ℕ → Option IntervalDyadic := segment 301 values1416

theorem block1416_domain : ExactDomain block1416 301 333 := by
  simpa only [values1416_size] using segment_domain 301 values1416

theorem block1416_get (i : Fin 32) :
    block1416 (301 + i.val) = some (values1416[i.val]'(by rw [values1416_size]; exact i.isLt)) := by
  exact segment_get 301 values1416 ⟨i.val, by rw [values1416_size]; exact i.isLt⟩

def values1417 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1417.coefficient110_333,
  OriginalRow227TriangleData1417.coefficient110_334,
  OriginalRow227TriangleData1417.coefficient110_335,
  OriginalRow227TriangleData1417.coefficient110_336,
  OriginalRow227TriangleData1417.coefficient110_337,
  OriginalRow227TriangleData1417.coefficient110_338,
  OriginalRow227TriangleData1417.coefficient110_339,
  OriginalRow227TriangleData1417.coefficient110_340,
  OriginalRow227TriangleData1417.coefficient110_341,
  OriginalRow227TriangleData1417.coefficient110_342,
  OriginalRow227TriangleData1417.coefficient110_343,
  OriginalRow227TriangleData1417.coefficient110_344,
  OriginalRow227TriangleData1417.coefficient110_345,
  OriginalRow227TriangleData1417.coefficient110_346,
  OriginalRow227TriangleData1417.coefficient110_347,
  OriginalRow227TriangleData1417.coefficient110_348,
  OriginalRow227TriangleData1417.coefficient110_349,
  OriginalRow227TriangleData1417.coefficient110_350,
  OriginalRow227TriangleData1417.coefficient110_351,
  OriginalRow227TriangleData1417.coefficient110_352,
  OriginalRow227TriangleData1417.coefficient110_353,
  OriginalRow227TriangleData1417.coefficient110_354,
  OriginalRow227TriangleData1417.coefficient110_355,
  OriginalRow227TriangleData1417.coefficient110_356,
  OriginalRow227TriangleData1417.coefficient110_357,
  OriginalRow227TriangleData1417.coefficient110_358,
  OriginalRow227TriangleData1417.coefficient110_359,
  OriginalRow227TriangleData1417.coefficient110_360,
  OriginalRow227TriangleData1417.coefficient110_361,
  OriginalRow227TriangleData1417.coefficient110_362,
  OriginalRow227TriangleData1417.coefficient110_363,
  OriginalRow227TriangleData1417.coefficient110_364
]

theorem values1417_size : values1417.size = 32 := rfl

def block1417 : ℕ → Option IntervalDyadic := segment 333 values1417

theorem block1417_domain : ExactDomain block1417 333 365 := by
  simpa only [values1417_size] using segment_domain 333 values1417

theorem block1417_get (i : Fin 32) :
    block1417 (333 + i.val) = some (values1417[i.val]'(by rw [values1417_size]; exact i.isLt)) := by
  exact segment_get 333 values1417 ⟨i.val, by rw [values1417_size]; exact i.isLt⟩

def values1418 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1418.coefficient110_365,
  OriginalRow227TriangleData1418.coefficient110_366,
  OriginalRow227TriangleData1418.coefficient110_367,
  OriginalRow227TriangleData1418.coefficient110_368,
  OriginalRow227TriangleData1418.coefficient110_369,
  OriginalRow227TriangleData1418.coefficient110_370,
  OriginalRow227TriangleData1418.coefficient110_371,
  OriginalRow227TriangleData1418.coefficient110_372,
  OriginalRow227TriangleData1418.coefficient110_373,
  OriginalRow227TriangleData1418.coefficient110_374,
  OriginalRow227TriangleData1418.coefficient110_375,
  OriginalRow227TriangleData1418.coefficient110_376,
  OriginalRow227TriangleData1418.coefficient110_377,
  OriginalRow227TriangleData1418.coefficient110_378,
  OriginalRow227TriangleData1418.coefficient110_379,
  OriginalRow227TriangleData1418.coefficient110_380,
  OriginalRow227TriangleData1418.coefficient110_381,
  OriginalRow227TriangleData1418.coefficient110_382,
  OriginalRow227TriangleData1418.coefficient110_383,
  OriginalRow227TriangleData1418.coefficient110_384,
  OriginalRow227TriangleData1418.coefficient110_385,
  OriginalRow227TriangleData1418.coefficient110_386,
  OriginalRow227TriangleData1418.coefficient110_387,
  OriginalRow227TriangleData1418.coefficient110_388,
  OriginalRow227TriangleData1418.coefficient110_389,
  OriginalRow227TriangleData1418.coefficient110_390,
  OriginalRow227TriangleData1418.coefficient110_391
]

theorem values1418_size : values1418.size = 27 := rfl

def block1418 : ℕ → Option IntervalDyadic := segment 365 values1418

theorem block1418_domain : ExactDomain block1418 365 392 := by
  simpa only [values1418_size] using segment_domain 365 values1418

theorem block1418_get (i : Fin 27) :
    block1418 (365 + i.val) = some (values1418[i.val]'(by rw [values1418_size]; exact i.isLt)) := by
  exact segment_get 365 values1418 ⟨i.val, by rw [values1418_size]; exact i.isLt⟩

def node0109_0173 : ℕ → Option IntervalDyadic := split 141 block1410 block1411

theorem node0109_0173_domain : ExactDomain node0109_0173 109 173 := by
  exact split_domain (by decide) (by decide) block1410_domain block1411_domain

def node0173_0237 : ℕ → Option IntervalDyadic := split 205 block1412 block1413

theorem node0173_0237_domain : ExactDomain node0173_0237 173 237 := by
  exact split_domain (by decide) (by decide) block1412_domain block1413_domain

def node0109_0237 : ℕ → Option IntervalDyadic := split 173 node0109_0173 node0173_0237

theorem node0109_0237_domain : ExactDomain node0109_0237 109 237 := by
  exact split_domain (by decide) (by decide) node0109_0173_domain node0173_0237_domain

def node0237_0301 : ℕ → Option IntervalDyadic := split 269 block1414 block1415

theorem node0237_0301_domain : ExactDomain node0237_0301 237 301 := by
  exact split_domain (by decide) (by decide) block1414_domain block1415_domain

def node0333_0392 : ℕ → Option IntervalDyadic := split 365 block1417 block1418

theorem node0333_0392_domain : ExactDomain node0333_0392 333 392 := by
  exact split_domain (by decide) (by decide) block1417_domain block1418_domain

def node0301_0392 : ℕ → Option IntervalDyadic := split 333 block1416 node0333_0392

theorem node0301_0392_domain : ExactDomain node0301_0392 301 392 := by
  exact split_domain (by decide) (by decide) block1416_domain node0333_0392_domain

def node0237_0392 : ℕ → Option IntervalDyadic := split 301 node0237_0301 node0301_0392

theorem node0237_0392_domain : ExactDomain node0237_0392 237 392 := by
  exact split_domain (by decide) (by decide) node0237_0301_domain node0301_0392_domain

def node0109_0392 : ℕ → Option IntervalDyadic := split 237 node0109_0237 node0237_0392

theorem node0109_0392_domain : ExactDomain node0109_0392 109 392 := by
  exact split_domain (by decide) (by decide) node0109_0237_domain node0237_0392_domain

def lookup : ℕ → Option IntervalDyadic := node0109_0392

theorem lookup_domain : ExactDomain lookup 109 392 :=
  node0109_0392_domain

theorem block1410_lookup (i : Fin 32) :
    lookup (109 + i.val) = some (values1410[i.val]'(by rw [values1410_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (109 + i.val) = _
  rw [node0109_0392, split_left 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0109_0237, split_left 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0109_0173, split_left 141 block1410 block1411 (by omega)]
  exact block1410_get i

theorem block1411_lookup (i : Fin 32) :
    lookup (141 + i.val) = some (values1411[i.val]'(by rw [values1411_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (141 + i.val) = _
  rw [node0109_0392, split_left 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0109_0237, split_left 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0109_0173, split_right 141 block1410 block1411 (by omega)]
  exact block1411_get i

theorem block1412_lookup (i : Fin 32) :
    lookup (173 + i.val) = some (values1412[i.val]'(by rw [values1412_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (173 + i.val) = _
  rw [node0109_0392, split_left 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0109_0237, split_right 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0173_0237, split_left 205 block1412 block1413 (by omega)]
  exact block1412_get i

theorem block1413_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values1413[i.val]'(by rw [values1413_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (205 + i.val) = _
  rw [node0109_0392, split_left 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0109_0237, split_right 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0173_0237, split_right 205 block1412 block1413 (by omega)]
  exact block1413_get i

theorem block1414_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values1414[i.val]'(by rw [values1414_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (237 + i.val) = _
  rw [node0109_0392, split_right 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0237_0392, split_left 301 node0237_0301 node0301_0392 (by omega)]
  rw [node0237_0301, split_left 269 block1414 block1415 (by omega)]
  exact block1414_get i

theorem block1415_lookup (i : Fin 32) :
    lookup (269 + i.val) = some (values1415[i.val]'(by rw [values1415_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (269 + i.val) = _
  rw [node0109_0392, split_right 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0237_0392, split_left 301 node0237_0301 node0301_0392 (by omega)]
  rw [node0237_0301, split_right 269 block1414 block1415 (by omega)]
  exact block1415_get i

theorem block1416_lookup (i : Fin 32) :
    lookup (301 + i.val) = some (values1416[i.val]'(by rw [values1416_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (301 + i.val) = _
  rw [node0109_0392, split_right 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0237_0392, split_right 301 node0237_0301 node0301_0392 (by omega)]
  rw [node0301_0392, split_left 333 block1416 node0333_0392 (by omega)]
  exact block1416_get i

theorem block1417_lookup (i : Fin 32) :
    lookup (333 + i.val) = some (values1417[i.val]'(by rw [values1417_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (333 + i.val) = _
  rw [node0109_0392, split_right 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0237_0392, split_right 301 node0237_0301 node0301_0392 (by omega)]
  rw [node0301_0392, split_right 333 block1416 node0333_0392 (by omega)]
  rw [node0333_0392, split_left 365 block1417 block1418 (by omega)]
  exact block1417_get i

theorem block1418_lookup (i : Fin 27) :
    lookup (365 + i.val) = some (values1418[i.val]'(by rw [values1418_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0109_0392 (365 + i.val) = _
  rw [node0109_0392, split_right 237 node0109_0237 node0237_0392 (by omega)]
  rw [node0237_0392, split_right 301 node0237_0301 node0301_0392 (by omega)]
  rw [node0301_0392, split_right 333 block1416 node0333_0392 (by omega)]
  rw [node0333_0392, split_right 365 block1417 block1418 (by omega)]
  exact block1418_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1410_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1410_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1411_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1411_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1412_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1412_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1413_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1413_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1414_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1414_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1415_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1415_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1416_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1416_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1417_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1417_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1418_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1418_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1410_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1411_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1412_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1413_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1414_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1415_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1416_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1417_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow110.block1418_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow110
