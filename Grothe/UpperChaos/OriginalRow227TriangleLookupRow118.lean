import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1482
import Grothe.UpperChaos.OriginalRow227TriangleData1483
import Grothe.UpperChaos.OriginalRow227TriangleData1484
import Grothe.UpperChaos.OriginalRow227TriangleData1485
import Grothe.UpperChaos.OriginalRow227TriangleData1486
import Grothe.UpperChaos.OriginalRow227TriangleData1487
import Grothe.UpperChaos.OriginalRow227TriangleData1488
import Grothe.UpperChaos.OriginalRow227TriangleData1489
import Grothe.UpperChaos.OriginalRow227TriangleData1490

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow118

open ConditionalTableLookup

def values1482 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1482.coefficient118_117,
  OriginalRow227TriangleData1482.coefficient118_118,
  OriginalRow227TriangleData1482.coefficient118_119,
  OriginalRow227TriangleData1482.coefficient118_120,
  OriginalRow227TriangleData1482.coefficient118_121,
  OriginalRow227TriangleData1482.coefficient118_122,
  OriginalRow227TriangleData1482.coefficient118_123,
  OriginalRow227TriangleData1482.coefficient118_124,
  OriginalRow227TriangleData1482.coefficient118_125,
  OriginalRow227TriangleData1482.coefficient118_126,
  OriginalRow227TriangleData1482.coefficient118_127,
  OriginalRow227TriangleData1482.coefficient118_128,
  OriginalRow227TriangleData1482.coefficient118_129,
  OriginalRow227TriangleData1482.coefficient118_130,
  OriginalRow227TriangleData1482.coefficient118_131,
  OriginalRow227TriangleData1482.coefficient118_132,
  OriginalRow227TriangleData1482.coefficient118_133,
  OriginalRow227TriangleData1482.coefficient118_134,
  OriginalRow227TriangleData1482.coefficient118_135,
  OriginalRow227TriangleData1482.coefficient118_136,
  OriginalRow227TriangleData1482.coefficient118_137,
  OriginalRow227TriangleData1482.coefficient118_138,
  OriginalRow227TriangleData1482.coefficient118_139,
  OriginalRow227TriangleData1482.coefficient118_140,
  OriginalRow227TriangleData1482.coefficient118_141,
  OriginalRow227TriangleData1482.coefficient118_142,
  OriginalRow227TriangleData1482.coefficient118_143,
  OriginalRow227TriangleData1482.coefficient118_144,
  OriginalRow227TriangleData1482.coefficient118_145,
  OriginalRow227TriangleData1482.coefficient118_146,
  OriginalRow227TriangleData1482.coefficient118_147,
  OriginalRow227TriangleData1482.coefficient118_148
]

theorem values1482_size : values1482.size = 32 := rfl

def block1482 : ℕ → Option IntervalDyadic := segment 117 values1482

theorem block1482_domain : ExactDomain block1482 117 149 := by
  simpa only [values1482_size] using segment_domain 117 values1482

theorem block1482_get (i : Fin 32) :
    block1482 (117 + i.val) = some (values1482[i.val]'(by rw [values1482_size]; exact i.isLt)) := by
  exact segment_get 117 values1482 ⟨i.val, by rw [values1482_size]; exact i.isLt⟩

def values1483 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1483.coefficient118_149,
  OriginalRow227TriangleData1483.coefficient118_150,
  OriginalRow227TriangleData1483.coefficient118_151,
  OriginalRow227TriangleData1483.coefficient118_152,
  OriginalRow227TriangleData1483.coefficient118_153,
  OriginalRow227TriangleData1483.coefficient118_154,
  OriginalRow227TriangleData1483.coefficient118_155,
  OriginalRow227TriangleData1483.coefficient118_156,
  OriginalRow227TriangleData1483.coefficient118_157,
  OriginalRow227TriangleData1483.coefficient118_158,
  OriginalRow227TriangleData1483.coefficient118_159,
  OriginalRow227TriangleData1483.coefficient118_160,
  OriginalRow227TriangleData1483.coefficient118_161,
  OriginalRow227TriangleData1483.coefficient118_162,
  OriginalRow227TriangleData1483.coefficient118_163,
  OriginalRow227TriangleData1483.coefficient118_164,
  OriginalRow227TriangleData1483.coefficient118_165,
  OriginalRow227TriangleData1483.coefficient118_166,
  OriginalRow227TriangleData1483.coefficient118_167,
  OriginalRow227TriangleData1483.coefficient118_168,
  OriginalRow227TriangleData1483.coefficient118_169,
  OriginalRow227TriangleData1483.coefficient118_170,
  OriginalRow227TriangleData1483.coefficient118_171,
  OriginalRow227TriangleData1483.coefficient118_172,
  OriginalRow227TriangleData1483.coefficient118_173,
  OriginalRow227TriangleData1483.coefficient118_174,
  OriginalRow227TriangleData1483.coefficient118_175,
  OriginalRow227TriangleData1483.coefficient118_176,
  OriginalRow227TriangleData1483.coefficient118_177,
  OriginalRow227TriangleData1483.coefficient118_178,
  OriginalRow227TriangleData1483.coefficient118_179,
  OriginalRow227TriangleData1483.coefficient118_180
]

theorem values1483_size : values1483.size = 32 := rfl

def block1483 : ℕ → Option IntervalDyadic := segment 149 values1483

theorem block1483_domain : ExactDomain block1483 149 181 := by
  simpa only [values1483_size] using segment_domain 149 values1483

theorem block1483_get (i : Fin 32) :
    block1483 (149 + i.val) = some (values1483[i.val]'(by rw [values1483_size]; exact i.isLt)) := by
  exact segment_get 149 values1483 ⟨i.val, by rw [values1483_size]; exact i.isLt⟩

def values1484 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1484.coefficient118_181,
  OriginalRow227TriangleData1484.coefficient118_182,
  OriginalRow227TriangleData1484.coefficient118_183,
  OriginalRow227TriangleData1484.coefficient118_184,
  OriginalRow227TriangleData1484.coefficient118_185,
  OriginalRow227TriangleData1484.coefficient118_186,
  OriginalRow227TriangleData1484.coefficient118_187,
  OriginalRow227TriangleData1484.coefficient118_188,
  OriginalRow227TriangleData1484.coefficient118_189,
  OriginalRow227TriangleData1484.coefficient118_190,
  OriginalRow227TriangleData1484.coefficient118_191,
  OriginalRow227TriangleData1484.coefficient118_192,
  OriginalRow227TriangleData1484.coefficient118_193,
  OriginalRow227TriangleData1484.coefficient118_194,
  OriginalRow227TriangleData1484.coefficient118_195,
  OriginalRow227TriangleData1484.coefficient118_196,
  OriginalRow227TriangleData1484.coefficient118_197,
  OriginalRow227TriangleData1484.coefficient118_198,
  OriginalRow227TriangleData1484.coefficient118_199,
  OriginalRow227TriangleData1484.coefficient118_200,
  OriginalRow227TriangleData1484.coefficient118_201,
  OriginalRow227TriangleData1484.coefficient118_202,
  OriginalRow227TriangleData1484.coefficient118_203,
  OriginalRow227TriangleData1484.coefficient118_204,
  OriginalRow227TriangleData1484.coefficient118_205,
  OriginalRow227TriangleData1484.coefficient118_206,
  OriginalRow227TriangleData1484.coefficient118_207,
  OriginalRow227TriangleData1484.coefficient118_208,
  OriginalRow227TriangleData1484.coefficient118_209,
  OriginalRow227TriangleData1484.coefficient118_210,
  OriginalRow227TriangleData1484.coefficient118_211,
  OriginalRow227TriangleData1484.coefficient118_212
]

theorem values1484_size : values1484.size = 32 := rfl

def block1484 : ℕ → Option IntervalDyadic := segment 181 values1484

theorem block1484_domain : ExactDomain block1484 181 213 := by
  simpa only [values1484_size] using segment_domain 181 values1484

theorem block1484_get (i : Fin 32) :
    block1484 (181 + i.val) = some (values1484[i.val]'(by rw [values1484_size]; exact i.isLt)) := by
  exact segment_get 181 values1484 ⟨i.val, by rw [values1484_size]; exact i.isLt⟩

def values1485 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1485.coefficient118_213,
  OriginalRow227TriangleData1485.coefficient118_214,
  OriginalRow227TriangleData1485.coefficient118_215,
  OriginalRow227TriangleData1485.coefficient118_216,
  OriginalRow227TriangleData1485.coefficient118_217,
  OriginalRow227TriangleData1485.coefficient118_218,
  OriginalRow227TriangleData1485.coefficient118_219,
  OriginalRow227TriangleData1485.coefficient118_220,
  OriginalRow227TriangleData1485.coefficient118_221,
  OriginalRow227TriangleData1485.coefficient118_222,
  OriginalRow227TriangleData1485.coefficient118_223,
  OriginalRow227TriangleData1485.coefficient118_224,
  OriginalRow227TriangleData1485.coefficient118_225,
  OriginalRow227TriangleData1485.coefficient118_226,
  OriginalRow227TriangleData1485.coefficient118_227,
  OriginalRow227TriangleData1485.coefficient118_228,
  OriginalRow227TriangleData1485.coefficient118_229,
  OriginalRow227TriangleData1485.coefficient118_230,
  OriginalRow227TriangleData1485.coefficient118_231,
  OriginalRow227TriangleData1485.coefficient118_232,
  OriginalRow227TriangleData1485.coefficient118_233,
  OriginalRow227TriangleData1485.coefficient118_234,
  OriginalRow227TriangleData1485.coefficient118_235,
  OriginalRow227TriangleData1485.coefficient118_236,
  OriginalRow227TriangleData1485.coefficient118_237,
  OriginalRow227TriangleData1485.coefficient118_238,
  OriginalRow227TriangleData1485.coefficient118_239,
  OriginalRow227TriangleData1485.coefficient118_240,
  OriginalRow227TriangleData1485.coefficient118_241,
  OriginalRow227TriangleData1485.coefficient118_242,
  OriginalRow227TriangleData1485.coefficient118_243,
  OriginalRow227TriangleData1485.coefficient118_244
]

theorem values1485_size : values1485.size = 32 := rfl

def block1485 : ℕ → Option IntervalDyadic := segment 213 values1485

theorem block1485_domain : ExactDomain block1485 213 245 := by
  simpa only [values1485_size] using segment_domain 213 values1485

theorem block1485_get (i : Fin 32) :
    block1485 (213 + i.val) = some (values1485[i.val]'(by rw [values1485_size]; exact i.isLt)) := by
  exact segment_get 213 values1485 ⟨i.val, by rw [values1485_size]; exact i.isLt⟩

def values1486 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1486.coefficient118_245,
  OriginalRow227TriangleData1486.coefficient118_246,
  OriginalRow227TriangleData1486.coefficient118_247,
  OriginalRow227TriangleData1486.coefficient118_248,
  OriginalRow227TriangleData1486.coefficient118_249,
  OriginalRow227TriangleData1486.coefficient118_250,
  OriginalRow227TriangleData1486.coefficient118_251,
  OriginalRow227TriangleData1486.coefficient118_252,
  OriginalRow227TriangleData1486.coefficient118_253,
  OriginalRow227TriangleData1486.coefficient118_254,
  OriginalRow227TriangleData1486.coefficient118_255,
  OriginalRow227TriangleData1486.coefficient118_256,
  OriginalRow227TriangleData1486.coefficient118_257,
  OriginalRow227TriangleData1486.coefficient118_258,
  OriginalRow227TriangleData1486.coefficient118_259,
  OriginalRow227TriangleData1486.coefficient118_260,
  OriginalRow227TriangleData1486.coefficient118_261,
  OriginalRow227TriangleData1486.coefficient118_262,
  OriginalRow227TriangleData1486.coefficient118_263,
  OriginalRow227TriangleData1486.coefficient118_264,
  OriginalRow227TriangleData1486.coefficient118_265,
  OriginalRow227TriangleData1486.coefficient118_266,
  OriginalRow227TriangleData1486.coefficient118_267,
  OriginalRow227TriangleData1486.coefficient118_268,
  OriginalRow227TriangleData1486.coefficient118_269,
  OriginalRow227TriangleData1486.coefficient118_270,
  OriginalRow227TriangleData1486.coefficient118_271,
  OriginalRow227TriangleData1486.coefficient118_272,
  OriginalRow227TriangleData1486.coefficient118_273,
  OriginalRow227TriangleData1486.coefficient118_274,
  OriginalRow227TriangleData1486.coefficient118_275,
  OriginalRow227TriangleData1486.coefficient118_276
]

theorem values1486_size : values1486.size = 32 := rfl

def block1486 : ℕ → Option IntervalDyadic := segment 245 values1486

theorem block1486_domain : ExactDomain block1486 245 277 := by
  simpa only [values1486_size] using segment_domain 245 values1486

theorem block1486_get (i : Fin 32) :
    block1486 (245 + i.val) = some (values1486[i.val]'(by rw [values1486_size]; exact i.isLt)) := by
  exact segment_get 245 values1486 ⟨i.val, by rw [values1486_size]; exact i.isLt⟩

def values1487 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1487.coefficient118_277,
  OriginalRow227TriangleData1487.coefficient118_278,
  OriginalRow227TriangleData1487.coefficient118_279,
  OriginalRow227TriangleData1487.coefficient118_280,
  OriginalRow227TriangleData1487.coefficient118_281,
  OriginalRow227TriangleData1487.coefficient118_282,
  OriginalRow227TriangleData1487.coefficient118_283,
  OriginalRow227TriangleData1487.coefficient118_284,
  OriginalRow227TriangleData1487.coefficient118_285,
  OriginalRow227TriangleData1487.coefficient118_286,
  OriginalRow227TriangleData1487.coefficient118_287,
  OriginalRow227TriangleData1487.coefficient118_288,
  OriginalRow227TriangleData1487.coefficient118_289,
  OriginalRow227TriangleData1487.coefficient118_290,
  OriginalRow227TriangleData1487.coefficient118_291,
  OriginalRow227TriangleData1487.coefficient118_292,
  OriginalRow227TriangleData1487.coefficient118_293,
  OriginalRow227TriangleData1487.coefficient118_294,
  OriginalRow227TriangleData1487.coefficient118_295,
  OriginalRow227TriangleData1487.coefficient118_296,
  OriginalRow227TriangleData1487.coefficient118_297,
  OriginalRow227TriangleData1487.coefficient118_298,
  OriginalRow227TriangleData1487.coefficient118_299,
  OriginalRow227TriangleData1487.coefficient118_300,
  OriginalRow227TriangleData1487.coefficient118_301,
  OriginalRow227TriangleData1487.coefficient118_302,
  OriginalRow227TriangleData1487.coefficient118_303,
  OriginalRow227TriangleData1487.coefficient118_304,
  OriginalRow227TriangleData1487.coefficient118_305,
  OriginalRow227TriangleData1487.coefficient118_306,
  OriginalRow227TriangleData1487.coefficient118_307,
  OriginalRow227TriangleData1487.coefficient118_308
]

theorem values1487_size : values1487.size = 32 := rfl

def block1487 : ℕ → Option IntervalDyadic := segment 277 values1487

theorem block1487_domain : ExactDomain block1487 277 309 := by
  simpa only [values1487_size] using segment_domain 277 values1487

theorem block1487_get (i : Fin 32) :
    block1487 (277 + i.val) = some (values1487[i.val]'(by rw [values1487_size]; exact i.isLt)) := by
  exact segment_get 277 values1487 ⟨i.val, by rw [values1487_size]; exact i.isLt⟩

def values1488 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1488.coefficient118_309,
  OriginalRow227TriangleData1488.coefficient118_310,
  OriginalRow227TriangleData1488.coefficient118_311,
  OriginalRow227TriangleData1488.coefficient118_312,
  OriginalRow227TriangleData1488.coefficient118_313,
  OriginalRow227TriangleData1488.coefficient118_314,
  OriginalRow227TriangleData1488.coefficient118_315,
  OriginalRow227TriangleData1488.coefficient118_316,
  OriginalRow227TriangleData1488.coefficient118_317,
  OriginalRow227TriangleData1488.coefficient118_318,
  OriginalRow227TriangleData1488.coefficient118_319,
  OriginalRow227TriangleData1488.coefficient118_320,
  OriginalRow227TriangleData1488.coefficient118_321,
  OriginalRow227TriangleData1488.coefficient118_322,
  OriginalRow227TriangleData1488.coefficient118_323,
  OriginalRow227TriangleData1488.coefficient118_324,
  OriginalRow227TriangleData1488.coefficient118_325,
  OriginalRow227TriangleData1488.coefficient118_326,
  OriginalRow227TriangleData1488.coefficient118_327,
  OriginalRow227TriangleData1488.coefficient118_328,
  OriginalRow227TriangleData1488.coefficient118_329,
  OriginalRow227TriangleData1488.coefficient118_330,
  OriginalRow227TriangleData1488.coefficient118_331,
  OriginalRow227TriangleData1488.coefficient118_332,
  OriginalRow227TriangleData1488.coefficient118_333,
  OriginalRow227TriangleData1488.coefficient118_334,
  OriginalRow227TriangleData1488.coefficient118_335,
  OriginalRow227TriangleData1488.coefficient118_336,
  OriginalRow227TriangleData1488.coefficient118_337,
  OriginalRow227TriangleData1488.coefficient118_338,
  OriginalRow227TriangleData1488.coefficient118_339,
  OriginalRow227TriangleData1488.coefficient118_340
]

theorem values1488_size : values1488.size = 32 := rfl

def block1488 : ℕ → Option IntervalDyadic := segment 309 values1488

theorem block1488_domain : ExactDomain block1488 309 341 := by
  simpa only [values1488_size] using segment_domain 309 values1488

theorem block1488_get (i : Fin 32) :
    block1488 (309 + i.val) = some (values1488[i.val]'(by rw [values1488_size]; exact i.isLt)) := by
  exact segment_get 309 values1488 ⟨i.val, by rw [values1488_size]; exact i.isLt⟩

def values1489 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1489.coefficient118_341,
  OriginalRow227TriangleData1489.coefficient118_342,
  OriginalRow227TriangleData1489.coefficient118_343,
  OriginalRow227TriangleData1489.coefficient118_344,
  OriginalRow227TriangleData1489.coefficient118_345,
  OriginalRow227TriangleData1489.coefficient118_346,
  OriginalRow227TriangleData1489.coefficient118_347,
  OriginalRow227TriangleData1489.coefficient118_348,
  OriginalRow227TriangleData1489.coefficient118_349,
  OriginalRow227TriangleData1489.coefficient118_350,
  OriginalRow227TriangleData1489.coefficient118_351,
  OriginalRow227TriangleData1489.coefficient118_352,
  OriginalRow227TriangleData1489.coefficient118_353,
  OriginalRow227TriangleData1489.coefficient118_354,
  OriginalRow227TriangleData1489.coefficient118_355,
  OriginalRow227TriangleData1489.coefficient118_356,
  OriginalRow227TriangleData1489.coefficient118_357,
  OriginalRow227TriangleData1489.coefficient118_358,
  OriginalRow227TriangleData1489.coefficient118_359,
  OriginalRow227TriangleData1489.coefficient118_360,
  OriginalRow227TriangleData1489.coefficient118_361,
  OriginalRow227TriangleData1489.coefficient118_362,
  OriginalRow227TriangleData1489.coefficient118_363,
  OriginalRow227TriangleData1489.coefficient118_364,
  OriginalRow227TriangleData1489.coefficient118_365,
  OriginalRow227TriangleData1489.coefficient118_366,
  OriginalRow227TriangleData1489.coefficient118_367,
  OriginalRow227TriangleData1489.coefficient118_368,
  OriginalRow227TriangleData1489.coefficient118_369,
  OriginalRow227TriangleData1489.coefficient118_370,
  OriginalRow227TriangleData1489.coefficient118_371,
  OriginalRow227TriangleData1489.coefficient118_372
]

theorem values1489_size : values1489.size = 32 := rfl

def block1489 : ℕ → Option IntervalDyadic := segment 341 values1489

theorem block1489_domain : ExactDomain block1489 341 373 := by
  simpa only [values1489_size] using segment_domain 341 values1489

theorem block1489_get (i : Fin 32) :
    block1489 (341 + i.val) = some (values1489[i.val]'(by rw [values1489_size]; exact i.isLt)) := by
  exact segment_get 341 values1489 ⟨i.val, by rw [values1489_size]; exact i.isLt⟩

def values1490 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1490.coefficient118_373,
  OriginalRow227TriangleData1490.coefficient118_374,
  OriginalRow227TriangleData1490.coefficient118_375,
  OriginalRow227TriangleData1490.coefficient118_376,
  OriginalRow227TriangleData1490.coefficient118_377,
  OriginalRow227TriangleData1490.coefficient118_378,
  OriginalRow227TriangleData1490.coefficient118_379,
  OriginalRow227TriangleData1490.coefficient118_380,
  OriginalRow227TriangleData1490.coefficient118_381,
  OriginalRow227TriangleData1490.coefficient118_382,
  OriginalRow227TriangleData1490.coefficient118_383
]

theorem values1490_size : values1490.size = 11 := rfl

def block1490 : ℕ → Option IntervalDyadic := segment 373 values1490

theorem block1490_domain : ExactDomain block1490 373 384 := by
  simpa only [values1490_size] using segment_domain 373 values1490

theorem block1490_get (i : Fin 11) :
    block1490 (373 + i.val) = some (values1490[i.val]'(by rw [values1490_size]; exact i.isLt)) := by
  exact segment_get 373 values1490 ⟨i.val, by rw [values1490_size]; exact i.isLt⟩

def node0117_0181 : ℕ → Option IntervalDyadic := split 149 block1482 block1483

theorem node0117_0181_domain : ExactDomain node0117_0181 117 181 := by
  exact split_domain (by decide) (by decide) block1482_domain block1483_domain

def node0181_0245 : ℕ → Option IntervalDyadic := split 213 block1484 block1485

theorem node0181_0245_domain : ExactDomain node0181_0245 181 245 := by
  exact split_domain (by decide) (by decide) block1484_domain block1485_domain

def node0117_0245 : ℕ → Option IntervalDyadic := split 181 node0117_0181 node0181_0245

theorem node0117_0245_domain : ExactDomain node0117_0245 117 245 := by
  exact split_domain (by decide) (by decide) node0117_0181_domain node0181_0245_domain

def node0245_0309 : ℕ → Option IntervalDyadic := split 277 block1486 block1487

theorem node0245_0309_domain : ExactDomain node0245_0309 245 309 := by
  exact split_domain (by decide) (by decide) block1486_domain block1487_domain

def node0341_0384 : ℕ → Option IntervalDyadic := split 373 block1489 block1490

theorem node0341_0384_domain : ExactDomain node0341_0384 341 384 := by
  exact split_domain (by decide) (by decide) block1489_domain block1490_domain

def node0309_0384 : ℕ → Option IntervalDyadic := split 341 block1488 node0341_0384

theorem node0309_0384_domain : ExactDomain node0309_0384 309 384 := by
  exact split_domain (by decide) (by decide) block1488_domain node0341_0384_domain

def node0245_0384 : ℕ → Option IntervalDyadic := split 309 node0245_0309 node0309_0384

theorem node0245_0384_domain : ExactDomain node0245_0384 245 384 := by
  exact split_domain (by decide) (by decide) node0245_0309_domain node0309_0384_domain

def node0117_0384 : ℕ → Option IntervalDyadic := split 245 node0117_0245 node0245_0384

theorem node0117_0384_domain : ExactDomain node0117_0384 117 384 := by
  exact split_domain (by decide) (by decide) node0117_0245_domain node0245_0384_domain

def lookup : ℕ → Option IntervalDyadic := node0117_0384

theorem lookup_domain : ExactDomain lookup 117 384 :=
  node0117_0384_domain

theorem block1482_lookup (i : Fin 32) :
    lookup (117 + i.val) = some (values1482[i.val]'(by rw [values1482_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (117 + i.val) = _
  rw [node0117_0384, split_left 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0117_0245, split_left 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0117_0181, split_left 149 block1482 block1483 (by omega)]
  exact block1482_get i

theorem block1483_lookup (i : Fin 32) :
    lookup (149 + i.val) = some (values1483[i.val]'(by rw [values1483_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (149 + i.val) = _
  rw [node0117_0384, split_left 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0117_0245, split_left 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0117_0181, split_right 149 block1482 block1483 (by omega)]
  exact block1483_get i

theorem block1484_lookup (i : Fin 32) :
    lookup (181 + i.val) = some (values1484[i.val]'(by rw [values1484_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (181 + i.val) = _
  rw [node0117_0384, split_left 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0117_0245, split_right 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0181_0245, split_left 213 block1484 block1485 (by omega)]
  exact block1484_get i

theorem block1485_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values1485[i.val]'(by rw [values1485_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (213 + i.val) = _
  rw [node0117_0384, split_left 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0117_0245, split_right 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0181_0245, split_right 213 block1484 block1485 (by omega)]
  exact block1485_get i

theorem block1486_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values1486[i.val]'(by rw [values1486_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (245 + i.val) = _
  rw [node0117_0384, split_right 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0245_0384, split_left 309 node0245_0309 node0309_0384 (by omega)]
  rw [node0245_0309, split_left 277 block1486 block1487 (by omega)]
  exact block1486_get i

theorem block1487_lookup (i : Fin 32) :
    lookup (277 + i.val) = some (values1487[i.val]'(by rw [values1487_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (277 + i.val) = _
  rw [node0117_0384, split_right 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0245_0384, split_left 309 node0245_0309 node0309_0384 (by omega)]
  rw [node0245_0309, split_right 277 block1486 block1487 (by omega)]
  exact block1487_get i

theorem block1488_lookup (i : Fin 32) :
    lookup (309 + i.val) = some (values1488[i.val]'(by rw [values1488_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (309 + i.val) = _
  rw [node0117_0384, split_right 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0245_0384, split_right 309 node0245_0309 node0309_0384 (by omega)]
  rw [node0309_0384, split_left 341 block1488 node0341_0384 (by omega)]
  exact block1488_get i

theorem block1489_lookup (i : Fin 32) :
    lookup (341 + i.val) = some (values1489[i.val]'(by rw [values1489_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (341 + i.val) = _
  rw [node0117_0384, split_right 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0245_0384, split_right 309 node0245_0309 node0309_0384 (by omega)]
  rw [node0309_0384, split_right 341 block1488 node0341_0384 (by omega)]
  rw [node0341_0384, split_left 373 block1489 block1490 (by omega)]
  exact block1489_get i

theorem block1490_lookup (i : Fin 11) :
    lookup (373 + i.val) = some (values1490[i.val]'(by rw [values1490_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0117_0384 (373 + i.val) = _
  rw [node0117_0384, split_right 245 node0117_0245 node0245_0384 (by omega)]
  rw [node0245_0384, split_right 309 node0245_0309 node0309_0384 (by omega)]
  rw [node0309_0384, split_right 341 block1488 node0341_0384 (by omega)]
  rw [node0341_0384, split_right 373 block1489 block1490 (by omega)]
  exact block1490_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1482_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1482_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1483_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1483_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1484_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1484_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1485_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1485_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1486_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1486_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1487_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1487_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1488_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1488_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1489_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1489_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1490_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1490_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1482_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1483_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1484_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1485_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1486_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1487_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1488_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1489_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow118.block1490_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow118
