import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1446
import Grothe.UpperChaos.OriginalRow227TriangleData1447
import Grothe.UpperChaos.OriginalRow227TriangleData1448
import Grothe.UpperChaos.OriginalRow227TriangleData1449
import Grothe.UpperChaos.OriginalRow227TriangleData1450
import Grothe.UpperChaos.OriginalRow227TriangleData1451
import Grothe.UpperChaos.OriginalRow227TriangleData1452
import Grothe.UpperChaos.OriginalRow227TriangleData1453
import Grothe.UpperChaos.OriginalRow227TriangleData1454

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow114

open ConditionalTableLookup

def values1446 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1446.coefficient114_113,
  OriginalRow227TriangleData1446.coefficient114_114,
  OriginalRow227TriangleData1446.coefficient114_115,
  OriginalRow227TriangleData1446.coefficient114_116,
  OriginalRow227TriangleData1446.coefficient114_117,
  OriginalRow227TriangleData1446.coefficient114_118,
  OriginalRow227TriangleData1446.coefficient114_119,
  OriginalRow227TriangleData1446.coefficient114_120,
  OriginalRow227TriangleData1446.coefficient114_121,
  OriginalRow227TriangleData1446.coefficient114_122,
  OriginalRow227TriangleData1446.coefficient114_123,
  OriginalRow227TriangleData1446.coefficient114_124,
  OriginalRow227TriangleData1446.coefficient114_125,
  OriginalRow227TriangleData1446.coefficient114_126,
  OriginalRow227TriangleData1446.coefficient114_127,
  OriginalRow227TriangleData1446.coefficient114_128,
  OriginalRow227TriangleData1446.coefficient114_129,
  OriginalRow227TriangleData1446.coefficient114_130,
  OriginalRow227TriangleData1446.coefficient114_131,
  OriginalRow227TriangleData1446.coefficient114_132,
  OriginalRow227TriangleData1446.coefficient114_133,
  OriginalRow227TriangleData1446.coefficient114_134,
  OriginalRow227TriangleData1446.coefficient114_135,
  OriginalRow227TriangleData1446.coefficient114_136,
  OriginalRow227TriangleData1446.coefficient114_137,
  OriginalRow227TriangleData1446.coefficient114_138,
  OriginalRow227TriangleData1446.coefficient114_139,
  OriginalRow227TriangleData1446.coefficient114_140,
  OriginalRow227TriangleData1446.coefficient114_141,
  OriginalRow227TriangleData1446.coefficient114_142,
  OriginalRow227TriangleData1446.coefficient114_143,
  OriginalRow227TriangleData1446.coefficient114_144
]

theorem values1446_size : values1446.size = 32 := rfl

def block1446 : ℕ → Option IntervalDyadic := segment 113 values1446

theorem block1446_domain : ExactDomain block1446 113 145 := by
  simpa only [values1446_size] using segment_domain 113 values1446

theorem block1446_get (i : Fin 32) :
    block1446 (113 + i.val) = some (values1446[i.val]'(by rw [values1446_size]; exact i.isLt)) := by
  exact segment_get 113 values1446 ⟨i.val, by rw [values1446_size]; exact i.isLt⟩

def values1447 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1447.coefficient114_145,
  OriginalRow227TriangleData1447.coefficient114_146,
  OriginalRow227TriangleData1447.coefficient114_147,
  OriginalRow227TriangleData1447.coefficient114_148,
  OriginalRow227TriangleData1447.coefficient114_149,
  OriginalRow227TriangleData1447.coefficient114_150,
  OriginalRow227TriangleData1447.coefficient114_151,
  OriginalRow227TriangleData1447.coefficient114_152,
  OriginalRow227TriangleData1447.coefficient114_153,
  OriginalRow227TriangleData1447.coefficient114_154,
  OriginalRow227TriangleData1447.coefficient114_155,
  OriginalRow227TriangleData1447.coefficient114_156,
  OriginalRow227TriangleData1447.coefficient114_157,
  OriginalRow227TriangleData1447.coefficient114_158,
  OriginalRow227TriangleData1447.coefficient114_159,
  OriginalRow227TriangleData1447.coefficient114_160,
  OriginalRow227TriangleData1447.coefficient114_161,
  OriginalRow227TriangleData1447.coefficient114_162,
  OriginalRow227TriangleData1447.coefficient114_163,
  OriginalRow227TriangleData1447.coefficient114_164,
  OriginalRow227TriangleData1447.coefficient114_165,
  OriginalRow227TriangleData1447.coefficient114_166,
  OriginalRow227TriangleData1447.coefficient114_167,
  OriginalRow227TriangleData1447.coefficient114_168,
  OriginalRow227TriangleData1447.coefficient114_169,
  OriginalRow227TriangleData1447.coefficient114_170,
  OriginalRow227TriangleData1447.coefficient114_171,
  OriginalRow227TriangleData1447.coefficient114_172,
  OriginalRow227TriangleData1447.coefficient114_173,
  OriginalRow227TriangleData1447.coefficient114_174,
  OriginalRow227TriangleData1447.coefficient114_175,
  OriginalRow227TriangleData1447.coefficient114_176
]

theorem values1447_size : values1447.size = 32 := rfl

def block1447 : ℕ → Option IntervalDyadic := segment 145 values1447

theorem block1447_domain : ExactDomain block1447 145 177 := by
  simpa only [values1447_size] using segment_domain 145 values1447

theorem block1447_get (i : Fin 32) :
    block1447 (145 + i.val) = some (values1447[i.val]'(by rw [values1447_size]; exact i.isLt)) := by
  exact segment_get 145 values1447 ⟨i.val, by rw [values1447_size]; exact i.isLt⟩

def values1448 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1448.coefficient114_177,
  OriginalRow227TriangleData1448.coefficient114_178,
  OriginalRow227TriangleData1448.coefficient114_179,
  OriginalRow227TriangleData1448.coefficient114_180,
  OriginalRow227TriangleData1448.coefficient114_181,
  OriginalRow227TriangleData1448.coefficient114_182,
  OriginalRow227TriangleData1448.coefficient114_183,
  OriginalRow227TriangleData1448.coefficient114_184,
  OriginalRow227TriangleData1448.coefficient114_185,
  OriginalRow227TriangleData1448.coefficient114_186,
  OriginalRow227TriangleData1448.coefficient114_187,
  OriginalRow227TriangleData1448.coefficient114_188,
  OriginalRow227TriangleData1448.coefficient114_189,
  OriginalRow227TriangleData1448.coefficient114_190,
  OriginalRow227TriangleData1448.coefficient114_191,
  OriginalRow227TriangleData1448.coefficient114_192,
  OriginalRow227TriangleData1448.coefficient114_193,
  OriginalRow227TriangleData1448.coefficient114_194,
  OriginalRow227TriangleData1448.coefficient114_195,
  OriginalRow227TriangleData1448.coefficient114_196,
  OriginalRow227TriangleData1448.coefficient114_197,
  OriginalRow227TriangleData1448.coefficient114_198,
  OriginalRow227TriangleData1448.coefficient114_199,
  OriginalRow227TriangleData1448.coefficient114_200,
  OriginalRow227TriangleData1448.coefficient114_201,
  OriginalRow227TriangleData1448.coefficient114_202,
  OriginalRow227TriangleData1448.coefficient114_203,
  OriginalRow227TriangleData1448.coefficient114_204,
  OriginalRow227TriangleData1448.coefficient114_205,
  OriginalRow227TriangleData1448.coefficient114_206,
  OriginalRow227TriangleData1448.coefficient114_207,
  OriginalRow227TriangleData1448.coefficient114_208
]

theorem values1448_size : values1448.size = 32 := rfl

def block1448 : ℕ → Option IntervalDyadic := segment 177 values1448

theorem block1448_domain : ExactDomain block1448 177 209 := by
  simpa only [values1448_size] using segment_domain 177 values1448

theorem block1448_get (i : Fin 32) :
    block1448 (177 + i.val) = some (values1448[i.val]'(by rw [values1448_size]; exact i.isLt)) := by
  exact segment_get 177 values1448 ⟨i.val, by rw [values1448_size]; exact i.isLt⟩

def values1449 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1449.coefficient114_209,
  OriginalRow227TriangleData1449.coefficient114_210,
  OriginalRow227TriangleData1449.coefficient114_211,
  OriginalRow227TriangleData1449.coefficient114_212,
  OriginalRow227TriangleData1449.coefficient114_213,
  OriginalRow227TriangleData1449.coefficient114_214,
  OriginalRow227TriangleData1449.coefficient114_215,
  OriginalRow227TriangleData1449.coefficient114_216,
  OriginalRow227TriangleData1449.coefficient114_217,
  OriginalRow227TriangleData1449.coefficient114_218,
  OriginalRow227TriangleData1449.coefficient114_219,
  OriginalRow227TriangleData1449.coefficient114_220,
  OriginalRow227TriangleData1449.coefficient114_221,
  OriginalRow227TriangleData1449.coefficient114_222,
  OriginalRow227TriangleData1449.coefficient114_223,
  OriginalRow227TriangleData1449.coefficient114_224,
  OriginalRow227TriangleData1449.coefficient114_225,
  OriginalRow227TriangleData1449.coefficient114_226,
  OriginalRow227TriangleData1449.coefficient114_227,
  OriginalRow227TriangleData1449.coefficient114_228,
  OriginalRow227TriangleData1449.coefficient114_229,
  OriginalRow227TriangleData1449.coefficient114_230,
  OriginalRow227TriangleData1449.coefficient114_231,
  OriginalRow227TriangleData1449.coefficient114_232,
  OriginalRow227TriangleData1449.coefficient114_233,
  OriginalRow227TriangleData1449.coefficient114_234,
  OriginalRow227TriangleData1449.coefficient114_235,
  OriginalRow227TriangleData1449.coefficient114_236,
  OriginalRow227TriangleData1449.coefficient114_237,
  OriginalRow227TriangleData1449.coefficient114_238,
  OriginalRow227TriangleData1449.coefficient114_239,
  OriginalRow227TriangleData1449.coefficient114_240
]

theorem values1449_size : values1449.size = 32 := rfl

def block1449 : ℕ → Option IntervalDyadic := segment 209 values1449

theorem block1449_domain : ExactDomain block1449 209 241 := by
  simpa only [values1449_size] using segment_domain 209 values1449

theorem block1449_get (i : Fin 32) :
    block1449 (209 + i.val) = some (values1449[i.val]'(by rw [values1449_size]; exact i.isLt)) := by
  exact segment_get 209 values1449 ⟨i.val, by rw [values1449_size]; exact i.isLt⟩

def values1450 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1450.coefficient114_241,
  OriginalRow227TriangleData1450.coefficient114_242,
  OriginalRow227TriangleData1450.coefficient114_243,
  OriginalRow227TriangleData1450.coefficient114_244,
  OriginalRow227TriangleData1450.coefficient114_245,
  OriginalRow227TriangleData1450.coefficient114_246,
  OriginalRow227TriangleData1450.coefficient114_247,
  OriginalRow227TriangleData1450.coefficient114_248,
  OriginalRow227TriangleData1450.coefficient114_249,
  OriginalRow227TriangleData1450.coefficient114_250,
  OriginalRow227TriangleData1450.coefficient114_251,
  OriginalRow227TriangleData1450.coefficient114_252,
  OriginalRow227TriangleData1450.coefficient114_253,
  OriginalRow227TriangleData1450.coefficient114_254,
  OriginalRow227TriangleData1450.coefficient114_255,
  OriginalRow227TriangleData1450.coefficient114_256,
  OriginalRow227TriangleData1450.coefficient114_257,
  OriginalRow227TriangleData1450.coefficient114_258,
  OriginalRow227TriangleData1450.coefficient114_259,
  OriginalRow227TriangleData1450.coefficient114_260,
  OriginalRow227TriangleData1450.coefficient114_261,
  OriginalRow227TriangleData1450.coefficient114_262,
  OriginalRow227TriangleData1450.coefficient114_263,
  OriginalRow227TriangleData1450.coefficient114_264,
  OriginalRow227TriangleData1450.coefficient114_265,
  OriginalRow227TriangleData1450.coefficient114_266,
  OriginalRow227TriangleData1450.coefficient114_267,
  OriginalRow227TriangleData1450.coefficient114_268,
  OriginalRow227TriangleData1450.coefficient114_269,
  OriginalRow227TriangleData1450.coefficient114_270,
  OriginalRow227TriangleData1450.coefficient114_271,
  OriginalRow227TriangleData1450.coefficient114_272
]

theorem values1450_size : values1450.size = 32 := rfl

def block1450 : ℕ → Option IntervalDyadic := segment 241 values1450

theorem block1450_domain : ExactDomain block1450 241 273 := by
  simpa only [values1450_size] using segment_domain 241 values1450

theorem block1450_get (i : Fin 32) :
    block1450 (241 + i.val) = some (values1450[i.val]'(by rw [values1450_size]; exact i.isLt)) := by
  exact segment_get 241 values1450 ⟨i.val, by rw [values1450_size]; exact i.isLt⟩

def values1451 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1451.coefficient114_273,
  OriginalRow227TriangleData1451.coefficient114_274,
  OriginalRow227TriangleData1451.coefficient114_275,
  OriginalRow227TriangleData1451.coefficient114_276,
  OriginalRow227TriangleData1451.coefficient114_277,
  OriginalRow227TriangleData1451.coefficient114_278,
  OriginalRow227TriangleData1451.coefficient114_279,
  OriginalRow227TriangleData1451.coefficient114_280,
  OriginalRow227TriangleData1451.coefficient114_281,
  OriginalRow227TriangleData1451.coefficient114_282,
  OriginalRow227TriangleData1451.coefficient114_283,
  OriginalRow227TriangleData1451.coefficient114_284,
  OriginalRow227TriangleData1451.coefficient114_285,
  OriginalRow227TriangleData1451.coefficient114_286,
  OriginalRow227TriangleData1451.coefficient114_287,
  OriginalRow227TriangleData1451.coefficient114_288,
  OriginalRow227TriangleData1451.coefficient114_289,
  OriginalRow227TriangleData1451.coefficient114_290,
  OriginalRow227TriangleData1451.coefficient114_291,
  OriginalRow227TriangleData1451.coefficient114_292,
  OriginalRow227TriangleData1451.coefficient114_293,
  OriginalRow227TriangleData1451.coefficient114_294,
  OriginalRow227TriangleData1451.coefficient114_295,
  OriginalRow227TriangleData1451.coefficient114_296,
  OriginalRow227TriangleData1451.coefficient114_297,
  OriginalRow227TriangleData1451.coefficient114_298,
  OriginalRow227TriangleData1451.coefficient114_299,
  OriginalRow227TriangleData1451.coefficient114_300,
  OriginalRow227TriangleData1451.coefficient114_301,
  OriginalRow227TriangleData1451.coefficient114_302,
  OriginalRow227TriangleData1451.coefficient114_303,
  OriginalRow227TriangleData1451.coefficient114_304
]

theorem values1451_size : values1451.size = 32 := rfl

def block1451 : ℕ → Option IntervalDyadic := segment 273 values1451

theorem block1451_domain : ExactDomain block1451 273 305 := by
  simpa only [values1451_size] using segment_domain 273 values1451

theorem block1451_get (i : Fin 32) :
    block1451 (273 + i.val) = some (values1451[i.val]'(by rw [values1451_size]; exact i.isLt)) := by
  exact segment_get 273 values1451 ⟨i.val, by rw [values1451_size]; exact i.isLt⟩

def values1452 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1452.coefficient114_305,
  OriginalRow227TriangleData1452.coefficient114_306,
  OriginalRow227TriangleData1452.coefficient114_307,
  OriginalRow227TriangleData1452.coefficient114_308,
  OriginalRow227TriangleData1452.coefficient114_309,
  OriginalRow227TriangleData1452.coefficient114_310,
  OriginalRow227TriangleData1452.coefficient114_311,
  OriginalRow227TriangleData1452.coefficient114_312,
  OriginalRow227TriangleData1452.coefficient114_313,
  OriginalRow227TriangleData1452.coefficient114_314,
  OriginalRow227TriangleData1452.coefficient114_315,
  OriginalRow227TriangleData1452.coefficient114_316,
  OriginalRow227TriangleData1452.coefficient114_317,
  OriginalRow227TriangleData1452.coefficient114_318,
  OriginalRow227TriangleData1452.coefficient114_319,
  OriginalRow227TriangleData1452.coefficient114_320,
  OriginalRow227TriangleData1452.coefficient114_321,
  OriginalRow227TriangleData1452.coefficient114_322,
  OriginalRow227TriangleData1452.coefficient114_323,
  OriginalRow227TriangleData1452.coefficient114_324,
  OriginalRow227TriangleData1452.coefficient114_325,
  OriginalRow227TriangleData1452.coefficient114_326,
  OriginalRow227TriangleData1452.coefficient114_327,
  OriginalRow227TriangleData1452.coefficient114_328,
  OriginalRow227TriangleData1452.coefficient114_329,
  OriginalRow227TriangleData1452.coefficient114_330,
  OriginalRow227TriangleData1452.coefficient114_331,
  OriginalRow227TriangleData1452.coefficient114_332,
  OriginalRow227TriangleData1452.coefficient114_333,
  OriginalRow227TriangleData1452.coefficient114_334,
  OriginalRow227TriangleData1452.coefficient114_335,
  OriginalRow227TriangleData1452.coefficient114_336
]

theorem values1452_size : values1452.size = 32 := rfl

def block1452 : ℕ → Option IntervalDyadic := segment 305 values1452

theorem block1452_domain : ExactDomain block1452 305 337 := by
  simpa only [values1452_size] using segment_domain 305 values1452

theorem block1452_get (i : Fin 32) :
    block1452 (305 + i.val) = some (values1452[i.val]'(by rw [values1452_size]; exact i.isLt)) := by
  exact segment_get 305 values1452 ⟨i.val, by rw [values1452_size]; exact i.isLt⟩

def values1453 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1453.coefficient114_337,
  OriginalRow227TriangleData1453.coefficient114_338,
  OriginalRow227TriangleData1453.coefficient114_339,
  OriginalRow227TriangleData1453.coefficient114_340,
  OriginalRow227TriangleData1453.coefficient114_341,
  OriginalRow227TriangleData1453.coefficient114_342,
  OriginalRow227TriangleData1453.coefficient114_343,
  OriginalRow227TriangleData1453.coefficient114_344,
  OriginalRow227TriangleData1453.coefficient114_345,
  OriginalRow227TriangleData1453.coefficient114_346,
  OriginalRow227TriangleData1453.coefficient114_347,
  OriginalRow227TriangleData1453.coefficient114_348,
  OriginalRow227TriangleData1453.coefficient114_349,
  OriginalRow227TriangleData1453.coefficient114_350,
  OriginalRow227TriangleData1453.coefficient114_351,
  OriginalRow227TriangleData1453.coefficient114_352,
  OriginalRow227TriangleData1453.coefficient114_353,
  OriginalRow227TriangleData1453.coefficient114_354,
  OriginalRow227TriangleData1453.coefficient114_355,
  OriginalRow227TriangleData1453.coefficient114_356,
  OriginalRow227TriangleData1453.coefficient114_357,
  OriginalRow227TriangleData1453.coefficient114_358,
  OriginalRow227TriangleData1453.coefficient114_359,
  OriginalRow227TriangleData1453.coefficient114_360,
  OriginalRow227TriangleData1453.coefficient114_361,
  OriginalRow227TriangleData1453.coefficient114_362,
  OriginalRow227TriangleData1453.coefficient114_363,
  OriginalRow227TriangleData1453.coefficient114_364,
  OriginalRow227TriangleData1453.coefficient114_365,
  OriginalRow227TriangleData1453.coefficient114_366,
  OriginalRow227TriangleData1453.coefficient114_367,
  OriginalRow227TriangleData1453.coefficient114_368
]

theorem values1453_size : values1453.size = 32 := rfl

def block1453 : ℕ → Option IntervalDyadic := segment 337 values1453

theorem block1453_domain : ExactDomain block1453 337 369 := by
  simpa only [values1453_size] using segment_domain 337 values1453

theorem block1453_get (i : Fin 32) :
    block1453 (337 + i.val) = some (values1453[i.val]'(by rw [values1453_size]; exact i.isLt)) := by
  exact segment_get 337 values1453 ⟨i.val, by rw [values1453_size]; exact i.isLt⟩

def values1454 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1454.coefficient114_369,
  OriginalRow227TriangleData1454.coefficient114_370,
  OriginalRow227TriangleData1454.coefficient114_371,
  OriginalRow227TriangleData1454.coefficient114_372,
  OriginalRow227TriangleData1454.coefficient114_373,
  OriginalRow227TriangleData1454.coefficient114_374,
  OriginalRow227TriangleData1454.coefficient114_375,
  OriginalRow227TriangleData1454.coefficient114_376,
  OriginalRow227TriangleData1454.coefficient114_377,
  OriginalRow227TriangleData1454.coefficient114_378,
  OriginalRow227TriangleData1454.coefficient114_379,
  OriginalRow227TriangleData1454.coefficient114_380,
  OriginalRow227TriangleData1454.coefficient114_381,
  OriginalRow227TriangleData1454.coefficient114_382,
  OriginalRow227TriangleData1454.coefficient114_383,
  OriginalRow227TriangleData1454.coefficient114_384,
  OriginalRow227TriangleData1454.coefficient114_385,
  OriginalRow227TriangleData1454.coefficient114_386,
  OriginalRow227TriangleData1454.coefficient114_387
]

theorem values1454_size : values1454.size = 19 := rfl

def block1454 : ℕ → Option IntervalDyadic := segment 369 values1454

theorem block1454_domain : ExactDomain block1454 369 388 := by
  simpa only [values1454_size] using segment_domain 369 values1454

theorem block1454_get (i : Fin 19) :
    block1454 (369 + i.val) = some (values1454[i.val]'(by rw [values1454_size]; exact i.isLt)) := by
  exact segment_get 369 values1454 ⟨i.val, by rw [values1454_size]; exact i.isLt⟩

def node0113_0177 : ℕ → Option IntervalDyadic := split 145 block1446 block1447

theorem node0113_0177_domain : ExactDomain node0113_0177 113 177 := by
  exact split_domain (by decide) (by decide) block1446_domain block1447_domain

def node0177_0241 : ℕ → Option IntervalDyadic := split 209 block1448 block1449

theorem node0177_0241_domain : ExactDomain node0177_0241 177 241 := by
  exact split_domain (by decide) (by decide) block1448_domain block1449_domain

def node0113_0241 : ℕ → Option IntervalDyadic := split 177 node0113_0177 node0177_0241

theorem node0113_0241_domain : ExactDomain node0113_0241 113 241 := by
  exact split_domain (by decide) (by decide) node0113_0177_domain node0177_0241_domain

def node0241_0305 : ℕ → Option IntervalDyadic := split 273 block1450 block1451

theorem node0241_0305_domain : ExactDomain node0241_0305 241 305 := by
  exact split_domain (by decide) (by decide) block1450_domain block1451_domain

def node0337_0388 : ℕ → Option IntervalDyadic := split 369 block1453 block1454

theorem node0337_0388_domain : ExactDomain node0337_0388 337 388 := by
  exact split_domain (by decide) (by decide) block1453_domain block1454_domain

def node0305_0388 : ℕ → Option IntervalDyadic := split 337 block1452 node0337_0388

theorem node0305_0388_domain : ExactDomain node0305_0388 305 388 := by
  exact split_domain (by decide) (by decide) block1452_domain node0337_0388_domain

def node0241_0388 : ℕ → Option IntervalDyadic := split 305 node0241_0305 node0305_0388

theorem node0241_0388_domain : ExactDomain node0241_0388 241 388 := by
  exact split_domain (by decide) (by decide) node0241_0305_domain node0305_0388_domain

def node0113_0388 : ℕ → Option IntervalDyadic := split 241 node0113_0241 node0241_0388

theorem node0113_0388_domain : ExactDomain node0113_0388 113 388 := by
  exact split_domain (by decide) (by decide) node0113_0241_domain node0241_0388_domain

def lookup : ℕ → Option IntervalDyadic := node0113_0388

theorem lookup_domain : ExactDomain lookup 113 388 :=
  node0113_0388_domain

theorem block1446_lookup (i : Fin 32) :
    lookup (113 + i.val) = some (values1446[i.val]'(by rw [values1446_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (113 + i.val) = _
  rw [node0113_0388, split_left 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0113_0241, split_left 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0113_0177, split_left 145 block1446 block1447 (by omega)]
  exact block1446_get i

theorem block1447_lookup (i : Fin 32) :
    lookup (145 + i.val) = some (values1447[i.val]'(by rw [values1447_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (145 + i.val) = _
  rw [node0113_0388, split_left 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0113_0241, split_left 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0113_0177, split_right 145 block1446 block1447 (by omega)]
  exact block1447_get i

theorem block1448_lookup (i : Fin 32) :
    lookup (177 + i.val) = some (values1448[i.val]'(by rw [values1448_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (177 + i.val) = _
  rw [node0113_0388, split_left 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0113_0241, split_right 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0177_0241, split_left 209 block1448 block1449 (by omega)]
  exact block1448_get i

theorem block1449_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values1449[i.val]'(by rw [values1449_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (209 + i.val) = _
  rw [node0113_0388, split_left 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0113_0241, split_right 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0177_0241, split_right 209 block1448 block1449 (by omega)]
  exact block1449_get i

theorem block1450_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values1450[i.val]'(by rw [values1450_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (241 + i.val) = _
  rw [node0113_0388, split_right 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0241_0388, split_left 305 node0241_0305 node0305_0388 (by omega)]
  rw [node0241_0305, split_left 273 block1450 block1451 (by omega)]
  exact block1450_get i

theorem block1451_lookup (i : Fin 32) :
    lookup (273 + i.val) = some (values1451[i.val]'(by rw [values1451_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (273 + i.val) = _
  rw [node0113_0388, split_right 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0241_0388, split_left 305 node0241_0305 node0305_0388 (by omega)]
  rw [node0241_0305, split_right 273 block1450 block1451 (by omega)]
  exact block1451_get i

theorem block1452_lookup (i : Fin 32) :
    lookup (305 + i.val) = some (values1452[i.val]'(by rw [values1452_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (305 + i.val) = _
  rw [node0113_0388, split_right 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0241_0388, split_right 305 node0241_0305 node0305_0388 (by omega)]
  rw [node0305_0388, split_left 337 block1452 node0337_0388 (by omega)]
  exact block1452_get i

theorem block1453_lookup (i : Fin 32) :
    lookup (337 + i.val) = some (values1453[i.val]'(by rw [values1453_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (337 + i.val) = _
  rw [node0113_0388, split_right 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0241_0388, split_right 305 node0241_0305 node0305_0388 (by omega)]
  rw [node0305_0388, split_right 337 block1452 node0337_0388 (by omega)]
  rw [node0337_0388, split_left 369 block1453 block1454 (by omega)]
  exact block1453_get i

theorem block1454_lookup (i : Fin 19) :
    lookup (369 + i.val) = some (values1454[i.val]'(by rw [values1454_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0113_0388 (369 + i.val) = _
  rw [node0113_0388, split_right 241 node0113_0241 node0241_0388 (by omega)]
  rw [node0241_0388, split_right 305 node0241_0305 node0305_0388 (by omega)]
  rw [node0305_0388, split_right 337 block1452 node0337_0388 (by omega)]
  rw [node0337_0388, split_right 369 block1453 block1454 (by omega)]
  exact block1454_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1446_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1446_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1447_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1447_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1448_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1448_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1449_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1449_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1450_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1450_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1451_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1451_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1452_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1452_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1453_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1453_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1454_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1454_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1446_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1447_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1448_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1449_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1450_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1451_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1452_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1453_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow114.block1454_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow114
