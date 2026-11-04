import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1473
import Grothe.UpperChaos.OriginalRow227TriangleData1474
import Grothe.UpperChaos.OriginalRow227TriangleData1475
import Grothe.UpperChaos.OriginalRow227TriangleData1476
import Grothe.UpperChaos.OriginalRow227TriangleData1477
import Grothe.UpperChaos.OriginalRow227TriangleData1478
import Grothe.UpperChaos.OriginalRow227TriangleData1479
import Grothe.UpperChaos.OriginalRow227TriangleData1480
import Grothe.UpperChaos.OriginalRow227TriangleData1481

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow117

open ConditionalTableLookup

def values1473 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1473.coefficient117_116,
  OriginalRow227TriangleData1473.coefficient117_117,
  OriginalRow227TriangleData1473.coefficient117_118,
  OriginalRow227TriangleData1473.coefficient117_119,
  OriginalRow227TriangleData1473.coefficient117_120,
  OriginalRow227TriangleData1473.coefficient117_121,
  OriginalRow227TriangleData1473.coefficient117_122,
  OriginalRow227TriangleData1473.coefficient117_123,
  OriginalRow227TriangleData1473.coefficient117_124,
  OriginalRow227TriangleData1473.coefficient117_125,
  OriginalRow227TriangleData1473.coefficient117_126,
  OriginalRow227TriangleData1473.coefficient117_127,
  OriginalRow227TriangleData1473.coefficient117_128,
  OriginalRow227TriangleData1473.coefficient117_129,
  OriginalRow227TriangleData1473.coefficient117_130,
  OriginalRow227TriangleData1473.coefficient117_131,
  OriginalRow227TriangleData1473.coefficient117_132,
  OriginalRow227TriangleData1473.coefficient117_133,
  OriginalRow227TriangleData1473.coefficient117_134,
  OriginalRow227TriangleData1473.coefficient117_135,
  OriginalRow227TriangleData1473.coefficient117_136,
  OriginalRow227TriangleData1473.coefficient117_137,
  OriginalRow227TriangleData1473.coefficient117_138,
  OriginalRow227TriangleData1473.coefficient117_139,
  OriginalRow227TriangleData1473.coefficient117_140,
  OriginalRow227TriangleData1473.coefficient117_141,
  OriginalRow227TriangleData1473.coefficient117_142,
  OriginalRow227TriangleData1473.coefficient117_143,
  OriginalRow227TriangleData1473.coefficient117_144,
  OriginalRow227TriangleData1473.coefficient117_145,
  OriginalRow227TriangleData1473.coefficient117_146,
  OriginalRow227TriangleData1473.coefficient117_147
]

theorem values1473_size : values1473.size = 32 := rfl

def block1473 : ℕ → Option IntervalDyadic := segment 116 values1473

theorem block1473_domain : ExactDomain block1473 116 148 := by
  simpa only [values1473_size] using segment_domain 116 values1473

theorem block1473_get (i : Fin 32) :
    block1473 (116 + i.val) = some (values1473[i.val]'(by rw [values1473_size]; exact i.isLt)) := by
  exact segment_get 116 values1473 ⟨i.val, by rw [values1473_size]; exact i.isLt⟩

def values1474 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1474.coefficient117_148,
  OriginalRow227TriangleData1474.coefficient117_149,
  OriginalRow227TriangleData1474.coefficient117_150,
  OriginalRow227TriangleData1474.coefficient117_151,
  OriginalRow227TriangleData1474.coefficient117_152,
  OriginalRow227TriangleData1474.coefficient117_153,
  OriginalRow227TriangleData1474.coefficient117_154,
  OriginalRow227TriangleData1474.coefficient117_155,
  OriginalRow227TriangleData1474.coefficient117_156,
  OriginalRow227TriangleData1474.coefficient117_157,
  OriginalRow227TriangleData1474.coefficient117_158,
  OriginalRow227TriangleData1474.coefficient117_159,
  OriginalRow227TriangleData1474.coefficient117_160,
  OriginalRow227TriangleData1474.coefficient117_161,
  OriginalRow227TriangleData1474.coefficient117_162,
  OriginalRow227TriangleData1474.coefficient117_163,
  OriginalRow227TriangleData1474.coefficient117_164,
  OriginalRow227TriangleData1474.coefficient117_165,
  OriginalRow227TriangleData1474.coefficient117_166,
  OriginalRow227TriangleData1474.coefficient117_167,
  OriginalRow227TriangleData1474.coefficient117_168,
  OriginalRow227TriangleData1474.coefficient117_169,
  OriginalRow227TriangleData1474.coefficient117_170,
  OriginalRow227TriangleData1474.coefficient117_171,
  OriginalRow227TriangleData1474.coefficient117_172,
  OriginalRow227TriangleData1474.coefficient117_173,
  OriginalRow227TriangleData1474.coefficient117_174,
  OriginalRow227TriangleData1474.coefficient117_175,
  OriginalRow227TriangleData1474.coefficient117_176,
  OriginalRow227TriangleData1474.coefficient117_177,
  OriginalRow227TriangleData1474.coefficient117_178,
  OriginalRow227TriangleData1474.coefficient117_179
]

theorem values1474_size : values1474.size = 32 := rfl

def block1474 : ℕ → Option IntervalDyadic := segment 148 values1474

theorem block1474_domain : ExactDomain block1474 148 180 := by
  simpa only [values1474_size] using segment_domain 148 values1474

theorem block1474_get (i : Fin 32) :
    block1474 (148 + i.val) = some (values1474[i.val]'(by rw [values1474_size]; exact i.isLt)) := by
  exact segment_get 148 values1474 ⟨i.val, by rw [values1474_size]; exact i.isLt⟩

def values1475 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1475.coefficient117_180,
  OriginalRow227TriangleData1475.coefficient117_181,
  OriginalRow227TriangleData1475.coefficient117_182,
  OriginalRow227TriangleData1475.coefficient117_183,
  OriginalRow227TriangleData1475.coefficient117_184,
  OriginalRow227TriangleData1475.coefficient117_185,
  OriginalRow227TriangleData1475.coefficient117_186,
  OriginalRow227TriangleData1475.coefficient117_187,
  OriginalRow227TriangleData1475.coefficient117_188,
  OriginalRow227TriangleData1475.coefficient117_189,
  OriginalRow227TriangleData1475.coefficient117_190,
  OriginalRow227TriangleData1475.coefficient117_191,
  OriginalRow227TriangleData1475.coefficient117_192,
  OriginalRow227TriangleData1475.coefficient117_193,
  OriginalRow227TriangleData1475.coefficient117_194,
  OriginalRow227TriangleData1475.coefficient117_195,
  OriginalRow227TriangleData1475.coefficient117_196,
  OriginalRow227TriangleData1475.coefficient117_197,
  OriginalRow227TriangleData1475.coefficient117_198,
  OriginalRow227TriangleData1475.coefficient117_199,
  OriginalRow227TriangleData1475.coefficient117_200,
  OriginalRow227TriangleData1475.coefficient117_201,
  OriginalRow227TriangleData1475.coefficient117_202,
  OriginalRow227TriangleData1475.coefficient117_203,
  OriginalRow227TriangleData1475.coefficient117_204,
  OriginalRow227TriangleData1475.coefficient117_205,
  OriginalRow227TriangleData1475.coefficient117_206,
  OriginalRow227TriangleData1475.coefficient117_207,
  OriginalRow227TriangleData1475.coefficient117_208,
  OriginalRow227TriangleData1475.coefficient117_209,
  OriginalRow227TriangleData1475.coefficient117_210,
  OriginalRow227TriangleData1475.coefficient117_211
]

theorem values1475_size : values1475.size = 32 := rfl

def block1475 : ℕ → Option IntervalDyadic := segment 180 values1475

theorem block1475_domain : ExactDomain block1475 180 212 := by
  simpa only [values1475_size] using segment_domain 180 values1475

theorem block1475_get (i : Fin 32) :
    block1475 (180 + i.val) = some (values1475[i.val]'(by rw [values1475_size]; exact i.isLt)) := by
  exact segment_get 180 values1475 ⟨i.val, by rw [values1475_size]; exact i.isLt⟩

def values1476 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1476.coefficient117_212,
  OriginalRow227TriangleData1476.coefficient117_213,
  OriginalRow227TriangleData1476.coefficient117_214,
  OriginalRow227TriangleData1476.coefficient117_215,
  OriginalRow227TriangleData1476.coefficient117_216,
  OriginalRow227TriangleData1476.coefficient117_217,
  OriginalRow227TriangleData1476.coefficient117_218,
  OriginalRow227TriangleData1476.coefficient117_219,
  OriginalRow227TriangleData1476.coefficient117_220,
  OriginalRow227TriangleData1476.coefficient117_221,
  OriginalRow227TriangleData1476.coefficient117_222,
  OriginalRow227TriangleData1476.coefficient117_223,
  OriginalRow227TriangleData1476.coefficient117_224,
  OriginalRow227TriangleData1476.coefficient117_225,
  OriginalRow227TriangleData1476.coefficient117_226,
  OriginalRow227TriangleData1476.coefficient117_227,
  OriginalRow227TriangleData1476.coefficient117_228,
  OriginalRow227TriangleData1476.coefficient117_229,
  OriginalRow227TriangleData1476.coefficient117_230,
  OriginalRow227TriangleData1476.coefficient117_231,
  OriginalRow227TriangleData1476.coefficient117_232,
  OriginalRow227TriangleData1476.coefficient117_233,
  OriginalRow227TriangleData1476.coefficient117_234,
  OriginalRow227TriangleData1476.coefficient117_235,
  OriginalRow227TriangleData1476.coefficient117_236,
  OriginalRow227TriangleData1476.coefficient117_237,
  OriginalRow227TriangleData1476.coefficient117_238,
  OriginalRow227TriangleData1476.coefficient117_239,
  OriginalRow227TriangleData1476.coefficient117_240,
  OriginalRow227TriangleData1476.coefficient117_241,
  OriginalRow227TriangleData1476.coefficient117_242,
  OriginalRow227TriangleData1476.coefficient117_243
]

theorem values1476_size : values1476.size = 32 := rfl

def block1476 : ℕ → Option IntervalDyadic := segment 212 values1476

theorem block1476_domain : ExactDomain block1476 212 244 := by
  simpa only [values1476_size] using segment_domain 212 values1476

theorem block1476_get (i : Fin 32) :
    block1476 (212 + i.val) = some (values1476[i.val]'(by rw [values1476_size]; exact i.isLt)) := by
  exact segment_get 212 values1476 ⟨i.val, by rw [values1476_size]; exact i.isLt⟩

def values1477 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1477.coefficient117_244,
  OriginalRow227TriangleData1477.coefficient117_245,
  OriginalRow227TriangleData1477.coefficient117_246,
  OriginalRow227TriangleData1477.coefficient117_247,
  OriginalRow227TriangleData1477.coefficient117_248,
  OriginalRow227TriangleData1477.coefficient117_249,
  OriginalRow227TriangleData1477.coefficient117_250,
  OriginalRow227TriangleData1477.coefficient117_251,
  OriginalRow227TriangleData1477.coefficient117_252,
  OriginalRow227TriangleData1477.coefficient117_253,
  OriginalRow227TriangleData1477.coefficient117_254,
  OriginalRow227TriangleData1477.coefficient117_255,
  OriginalRow227TriangleData1477.coefficient117_256,
  OriginalRow227TriangleData1477.coefficient117_257,
  OriginalRow227TriangleData1477.coefficient117_258,
  OriginalRow227TriangleData1477.coefficient117_259,
  OriginalRow227TriangleData1477.coefficient117_260,
  OriginalRow227TriangleData1477.coefficient117_261,
  OriginalRow227TriangleData1477.coefficient117_262,
  OriginalRow227TriangleData1477.coefficient117_263,
  OriginalRow227TriangleData1477.coefficient117_264,
  OriginalRow227TriangleData1477.coefficient117_265,
  OriginalRow227TriangleData1477.coefficient117_266,
  OriginalRow227TriangleData1477.coefficient117_267,
  OriginalRow227TriangleData1477.coefficient117_268,
  OriginalRow227TriangleData1477.coefficient117_269,
  OriginalRow227TriangleData1477.coefficient117_270,
  OriginalRow227TriangleData1477.coefficient117_271,
  OriginalRow227TriangleData1477.coefficient117_272,
  OriginalRow227TriangleData1477.coefficient117_273,
  OriginalRow227TriangleData1477.coefficient117_274,
  OriginalRow227TriangleData1477.coefficient117_275
]

theorem values1477_size : values1477.size = 32 := rfl

def block1477 : ℕ → Option IntervalDyadic := segment 244 values1477

theorem block1477_domain : ExactDomain block1477 244 276 := by
  simpa only [values1477_size] using segment_domain 244 values1477

theorem block1477_get (i : Fin 32) :
    block1477 (244 + i.val) = some (values1477[i.val]'(by rw [values1477_size]; exact i.isLt)) := by
  exact segment_get 244 values1477 ⟨i.val, by rw [values1477_size]; exact i.isLt⟩

def values1478 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1478.coefficient117_276,
  OriginalRow227TriangleData1478.coefficient117_277,
  OriginalRow227TriangleData1478.coefficient117_278,
  OriginalRow227TriangleData1478.coefficient117_279,
  OriginalRow227TriangleData1478.coefficient117_280,
  OriginalRow227TriangleData1478.coefficient117_281,
  OriginalRow227TriangleData1478.coefficient117_282,
  OriginalRow227TriangleData1478.coefficient117_283,
  OriginalRow227TriangleData1478.coefficient117_284,
  OriginalRow227TriangleData1478.coefficient117_285,
  OriginalRow227TriangleData1478.coefficient117_286,
  OriginalRow227TriangleData1478.coefficient117_287,
  OriginalRow227TriangleData1478.coefficient117_288,
  OriginalRow227TriangleData1478.coefficient117_289,
  OriginalRow227TriangleData1478.coefficient117_290,
  OriginalRow227TriangleData1478.coefficient117_291,
  OriginalRow227TriangleData1478.coefficient117_292,
  OriginalRow227TriangleData1478.coefficient117_293,
  OriginalRow227TriangleData1478.coefficient117_294,
  OriginalRow227TriangleData1478.coefficient117_295,
  OriginalRow227TriangleData1478.coefficient117_296,
  OriginalRow227TriangleData1478.coefficient117_297,
  OriginalRow227TriangleData1478.coefficient117_298,
  OriginalRow227TriangleData1478.coefficient117_299,
  OriginalRow227TriangleData1478.coefficient117_300,
  OriginalRow227TriangleData1478.coefficient117_301,
  OriginalRow227TriangleData1478.coefficient117_302,
  OriginalRow227TriangleData1478.coefficient117_303,
  OriginalRow227TriangleData1478.coefficient117_304,
  OriginalRow227TriangleData1478.coefficient117_305,
  OriginalRow227TriangleData1478.coefficient117_306,
  OriginalRow227TriangleData1478.coefficient117_307
]

theorem values1478_size : values1478.size = 32 := rfl

def block1478 : ℕ → Option IntervalDyadic := segment 276 values1478

theorem block1478_domain : ExactDomain block1478 276 308 := by
  simpa only [values1478_size] using segment_domain 276 values1478

theorem block1478_get (i : Fin 32) :
    block1478 (276 + i.val) = some (values1478[i.val]'(by rw [values1478_size]; exact i.isLt)) := by
  exact segment_get 276 values1478 ⟨i.val, by rw [values1478_size]; exact i.isLt⟩

def values1479 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1479.coefficient117_308,
  OriginalRow227TriangleData1479.coefficient117_309,
  OriginalRow227TriangleData1479.coefficient117_310,
  OriginalRow227TriangleData1479.coefficient117_311,
  OriginalRow227TriangleData1479.coefficient117_312,
  OriginalRow227TriangleData1479.coefficient117_313,
  OriginalRow227TriangleData1479.coefficient117_314,
  OriginalRow227TriangleData1479.coefficient117_315,
  OriginalRow227TriangleData1479.coefficient117_316,
  OriginalRow227TriangleData1479.coefficient117_317,
  OriginalRow227TriangleData1479.coefficient117_318,
  OriginalRow227TriangleData1479.coefficient117_319,
  OriginalRow227TriangleData1479.coefficient117_320,
  OriginalRow227TriangleData1479.coefficient117_321,
  OriginalRow227TriangleData1479.coefficient117_322,
  OriginalRow227TriangleData1479.coefficient117_323,
  OriginalRow227TriangleData1479.coefficient117_324,
  OriginalRow227TriangleData1479.coefficient117_325,
  OriginalRow227TriangleData1479.coefficient117_326,
  OriginalRow227TriangleData1479.coefficient117_327,
  OriginalRow227TriangleData1479.coefficient117_328,
  OriginalRow227TriangleData1479.coefficient117_329,
  OriginalRow227TriangleData1479.coefficient117_330,
  OriginalRow227TriangleData1479.coefficient117_331,
  OriginalRow227TriangleData1479.coefficient117_332,
  OriginalRow227TriangleData1479.coefficient117_333,
  OriginalRow227TriangleData1479.coefficient117_334,
  OriginalRow227TriangleData1479.coefficient117_335,
  OriginalRow227TriangleData1479.coefficient117_336,
  OriginalRow227TriangleData1479.coefficient117_337,
  OriginalRow227TriangleData1479.coefficient117_338,
  OriginalRow227TriangleData1479.coefficient117_339
]

theorem values1479_size : values1479.size = 32 := rfl

def block1479 : ℕ → Option IntervalDyadic := segment 308 values1479

theorem block1479_domain : ExactDomain block1479 308 340 := by
  simpa only [values1479_size] using segment_domain 308 values1479

theorem block1479_get (i : Fin 32) :
    block1479 (308 + i.val) = some (values1479[i.val]'(by rw [values1479_size]; exact i.isLt)) := by
  exact segment_get 308 values1479 ⟨i.val, by rw [values1479_size]; exact i.isLt⟩

def values1480 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1480.coefficient117_340,
  OriginalRow227TriangleData1480.coefficient117_341,
  OriginalRow227TriangleData1480.coefficient117_342,
  OriginalRow227TriangleData1480.coefficient117_343,
  OriginalRow227TriangleData1480.coefficient117_344,
  OriginalRow227TriangleData1480.coefficient117_345,
  OriginalRow227TriangleData1480.coefficient117_346,
  OriginalRow227TriangleData1480.coefficient117_347,
  OriginalRow227TriangleData1480.coefficient117_348,
  OriginalRow227TriangleData1480.coefficient117_349,
  OriginalRow227TriangleData1480.coefficient117_350,
  OriginalRow227TriangleData1480.coefficient117_351,
  OriginalRow227TriangleData1480.coefficient117_352,
  OriginalRow227TriangleData1480.coefficient117_353,
  OriginalRow227TriangleData1480.coefficient117_354,
  OriginalRow227TriangleData1480.coefficient117_355,
  OriginalRow227TriangleData1480.coefficient117_356,
  OriginalRow227TriangleData1480.coefficient117_357,
  OriginalRow227TriangleData1480.coefficient117_358,
  OriginalRow227TriangleData1480.coefficient117_359,
  OriginalRow227TriangleData1480.coefficient117_360,
  OriginalRow227TriangleData1480.coefficient117_361,
  OriginalRow227TriangleData1480.coefficient117_362,
  OriginalRow227TriangleData1480.coefficient117_363,
  OriginalRow227TriangleData1480.coefficient117_364,
  OriginalRow227TriangleData1480.coefficient117_365,
  OriginalRow227TriangleData1480.coefficient117_366,
  OriginalRow227TriangleData1480.coefficient117_367,
  OriginalRow227TriangleData1480.coefficient117_368,
  OriginalRow227TriangleData1480.coefficient117_369,
  OriginalRow227TriangleData1480.coefficient117_370,
  OriginalRow227TriangleData1480.coefficient117_371
]

theorem values1480_size : values1480.size = 32 := rfl

def block1480 : ℕ → Option IntervalDyadic := segment 340 values1480

theorem block1480_domain : ExactDomain block1480 340 372 := by
  simpa only [values1480_size] using segment_domain 340 values1480

theorem block1480_get (i : Fin 32) :
    block1480 (340 + i.val) = some (values1480[i.val]'(by rw [values1480_size]; exact i.isLt)) := by
  exact segment_get 340 values1480 ⟨i.val, by rw [values1480_size]; exact i.isLt⟩

def values1481 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1481.coefficient117_372,
  OriginalRow227TriangleData1481.coefficient117_373,
  OriginalRow227TriangleData1481.coefficient117_374,
  OriginalRow227TriangleData1481.coefficient117_375,
  OriginalRow227TriangleData1481.coefficient117_376,
  OriginalRow227TriangleData1481.coefficient117_377,
  OriginalRow227TriangleData1481.coefficient117_378,
  OriginalRow227TriangleData1481.coefficient117_379,
  OriginalRow227TriangleData1481.coefficient117_380,
  OriginalRow227TriangleData1481.coefficient117_381,
  OriginalRow227TriangleData1481.coefficient117_382,
  OriginalRow227TriangleData1481.coefficient117_383,
  OriginalRow227TriangleData1481.coefficient117_384
]

theorem values1481_size : values1481.size = 13 := rfl

def block1481 : ℕ → Option IntervalDyadic := segment 372 values1481

theorem block1481_domain : ExactDomain block1481 372 385 := by
  simpa only [values1481_size] using segment_domain 372 values1481

theorem block1481_get (i : Fin 13) :
    block1481 (372 + i.val) = some (values1481[i.val]'(by rw [values1481_size]; exact i.isLt)) := by
  exact segment_get 372 values1481 ⟨i.val, by rw [values1481_size]; exact i.isLt⟩

def node0116_0180 : ℕ → Option IntervalDyadic := split 148 block1473 block1474

theorem node0116_0180_domain : ExactDomain node0116_0180 116 180 := by
  exact split_domain (by decide) (by decide) block1473_domain block1474_domain

def node0180_0244 : ℕ → Option IntervalDyadic := split 212 block1475 block1476

theorem node0180_0244_domain : ExactDomain node0180_0244 180 244 := by
  exact split_domain (by decide) (by decide) block1475_domain block1476_domain

def node0116_0244 : ℕ → Option IntervalDyadic := split 180 node0116_0180 node0180_0244

theorem node0116_0244_domain : ExactDomain node0116_0244 116 244 := by
  exact split_domain (by decide) (by decide) node0116_0180_domain node0180_0244_domain

def node0244_0308 : ℕ → Option IntervalDyadic := split 276 block1477 block1478

theorem node0244_0308_domain : ExactDomain node0244_0308 244 308 := by
  exact split_domain (by decide) (by decide) block1477_domain block1478_domain

def node0340_0385 : ℕ → Option IntervalDyadic := split 372 block1480 block1481

theorem node0340_0385_domain : ExactDomain node0340_0385 340 385 := by
  exact split_domain (by decide) (by decide) block1480_domain block1481_domain

def node0308_0385 : ℕ → Option IntervalDyadic := split 340 block1479 node0340_0385

theorem node0308_0385_domain : ExactDomain node0308_0385 308 385 := by
  exact split_domain (by decide) (by decide) block1479_domain node0340_0385_domain

def node0244_0385 : ℕ → Option IntervalDyadic := split 308 node0244_0308 node0308_0385

theorem node0244_0385_domain : ExactDomain node0244_0385 244 385 := by
  exact split_domain (by decide) (by decide) node0244_0308_domain node0308_0385_domain

def node0116_0385 : ℕ → Option IntervalDyadic := split 244 node0116_0244 node0244_0385

theorem node0116_0385_domain : ExactDomain node0116_0385 116 385 := by
  exact split_domain (by decide) (by decide) node0116_0244_domain node0244_0385_domain

def lookup : ℕ → Option IntervalDyadic := node0116_0385

theorem lookup_domain : ExactDomain lookup 116 385 :=
  node0116_0385_domain

theorem block1473_lookup (i : Fin 32) :
    lookup (116 + i.val) = some (values1473[i.val]'(by rw [values1473_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (116 + i.val) = _
  rw [node0116_0385, split_left 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0116_0244, split_left 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0116_0180, split_left 148 block1473 block1474 (by omega)]
  exact block1473_get i

theorem block1474_lookup (i : Fin 32) :
    lookup (148 + i.val) = some (values1474[i.val]'(by rw [values1474_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (148 + i.val) = _
  rw [node0116_0385, split_left 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0116_0244, split_left 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0116_0180, split_right 148 block1473 block1474 (by omega)]
  exact block1474_get i

theorem block1475_lookup (i : Fin 32) :
    lookup (180 + i.val) = some (values1475[i.val]'(by rw [values1475_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (180 + i.val) = _
  rw [node0116_0385, split_left 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0116_0244, split_right 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0180_0244, split_left 212 block1475 block1476 (by omega)]
  exact block1475_get i

theorem block1476_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values1476[i.val]'(by rw [values1476_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (212 + i.val) = _
  rw [node0116_0385, split_left 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0116_0244, split_right 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0180_0244, split_right 212 block1475 block1476 (by omega)]
  exact block1476_get i

theorem block1477_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values1477[i.val]'(by rw [values1477_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (244 + i.val) = _
  rw [node0116_0385, split_right 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0244_0385, split_left 308 node0244_0308 node0308_0385 (by omega)]
  rw [node0244_0308, split_left 276 block1477 block1478 (by omega)]
  exact block1477_get i

theorem block1478_lookup (i : Fin 32) :
    lookup (276 + i.val) = some (values1478[i.val]'(by rw [values1478_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (276 + i.val) = _
  rw [node0116_0385, split_right 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0244_0385, split_left 308 node0244_0308 node0308_0385 (by omega)]
  rw [node0244_0308, split_right 276 block1477 block1478 (by omega)]
  exact block1478_get i

theorem block1479_lookup (i : Fin 32) :
    lookup (308 + i.val) = some (values1479[i.val]'(by rw [values1479_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (308 + i.val) = _
  rw [node0116_0385, split_right 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0244_0385, split_right 308 node0244_0308 node0308_0385 (by omega)]
  rw [node0308_0385, split_left 340 block1479 node0340_0385 (by omega)]
  exact block1479_get i

theorem block1480_lookup (i : Fin 32) :
    lookup (340 + i.val) = some (values1480[i.val]'(by rw [values1480_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (340 + i.val) = _
  rw [node0116_0385, split_right 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0244_0385, split_right 308 node0244_0308 node0308_0385 (by omega)]
  rw [node0308_0385, split_right 340 block1479 node0340_0385 (by omega)]
  rw [node0340_0385, split_left 372 block1480 block1481 (by omega)]
  exact block1480_get i

theorem block1481_lookup (i : Fin 13) :
    lookup (372 + i.val) = some (values1481[i.val]'(by rw [values1481_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0116_0385 (372 + i.val) = _
  rw [node0116_0385, split_right 244 node0116_0244 node0244_0385 (by omega)]
  rw [node0244_0385, split_right 308 node0244_0308 node0308_0385 (by omega)]
  rw [node0308_0385, split_right 340 block1479 node0340_0385 (by omega)]
  rw [node0340_0385, split_right 372 block1480 block1481 (by omega)]
  exact block1481_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1473_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1473_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1474_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1474_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1475_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1475_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1476_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1476_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1477_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1477_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1478_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1478_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1479_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1479_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1480_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1480_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1481_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1481_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1473_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1474_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1475_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1476_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1477_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1478_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1479_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1480_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow117.block1481_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow117
