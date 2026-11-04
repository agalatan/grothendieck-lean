import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1527
import Grothe.UpperChaos.OriginalRow227TriangleData1528
import Grothe.UpperChaos.OriginalRow227TriangleData1529
import Grothe.UpperChaos.OriginalRow227TriangleData1530
import Grothe.UpperChaos.OriginalRow227TriangleData1531
import Grothe.UpperChaos.OriginalRow227TriangleData1532
import Grothe.UpperChaos.OriginalRow227TriangleData1533
import Grothe.UpperChaos.OriginalRow227TriangleData1534
import Grothe.UpperChaos.OriginalRow227TriangleData1535

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow123

open ConditionalTableLookup

def values1527 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1527.coefficient123_122,
  OriginalRow227TriangleData1527.coefficient123_123,
  OriginalRow227TriangleData1527.coefficient123_124,
  OriginalRow227TriangleData1527.coefficient123_125,
  OriginalRow227TriangleData1527.coefficient123_126,
  OriginalRow227TriangleData1527.coefficient123_127,
  OriginalRow227TriangleData1527.coefficient123_128,
  OriginalRow227TriangleData1527.coefficient123_129,
  OriginalRow227TriangleData1527.coefficient123_130,
  OriginalRow227TriangleData1527.coefficient123_131,
  OriginalRow227TriangleData1527.coefficient123_132,
  OriginalRow227TriangleData1527.coefficient123_133,
  OriginalRow227TriangleData1527.coefficient123_134,
  OriginalRow227TriangleData1527.coefficient123_135,
  OriginalRow227TriangleData1527.coefficient123_136,
  OriginalRow227TriangleData1527.coefficient123_137,
  OriginalRow227TriangleData1527.coefficient123_138,
  OriginalRow227TriangleData1527.coefficient123_139,
  OriginalRow227TriangleData1527.coefficient123_140,
  OriginalRow227TriangleData1527.coefficient123_141,
  OriginalRow227TriangleData1527.coefficient123_142,
  OriginalRow227TriangleData1527.coefficient123_143,
  OriginalRow227TriangleData1527.coefficient123_144,
  OriginalRow227TriangleData1527.coefficient123_145,
  OriginalRow227TriangleData1527.coefficient123_146,
  OriginalRow227TriangleData1527.coefficient123_147,
  OriginalRow227TriangleData1527.coefficient123_148,
  OriginalRow227TriangleData1527.coefficient123_149,
  OriginalRow227TriangleData1527.coefficient123_150,
  OriginalRow227TriangleData1527.coefficient123_151,
  OriginalRow227TriangleData1527.coefficient123_152,
  OriginalRow227TriangleData1527.coefficient123_153
]

theorem values1527_size : values1527.size = 32 := rfl

def block1527 : ℕ → Option IntervalDyadic := segment 122 values1527

theorem block1527_domain : ExactDomain block1527 122 154 := by
  simpa only [values1527_size] using segment_domain 122 values1527

theorem block1527_get (i : Fin 32) :
    block1527 (122 + i.val) = some (values1527[i.val]'(by rw [values1527_size]; exact i.isLt)) := by
  exact segment_get 122 values1527 ⟨i.val, by rw [values1527_size]; exact i.isLt⟩

def values1528 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1528.coefficient123_154,
  OriginalRow227TriangleData1528.coefficient123_155,
  OriginalRow227TriangleData1528.coefficient123_156,
  OriginalRow227TriangleData1528.coefficient123_157,
  OriginalRow227TriangleData1528.coefficient123_158,
  OriginalRow227TriangleData1528.coefficient123_159,
  OriginalRow227TriangleData1528.coefficient123_160,
  OriginalRow227TriangleData1528.coefficient123_161,
  OriginalRow227TriangleData1528.coefficient123_162,
  OriginalRow227TriangleData1528.coefficient123_163,
  OriginalRow227TriangleData1528.coefficient123_164,
  OriginalRow227TriangleData1528.coefficient123_165,
  OriginalRow227TriangleData1528.coefficient123_166,
  OriginalRow227TriangleData1528.coefficient123_167,
  OriginalRow227TriangleData1528.coefficient123_168,
  OriginalRow227TriangleData1528.coefficient123_169,
  OriginalRow227TriangleData1528.coefficient123_170,
  OriginalRow227TriangleData1528.coefficient123_171,
  OriginalRow227TriangleData1528.coefficient123_172,
  OriginalRow227TriangleData1528.coefficient123_173,
  OriginalRow227TriangleData1528.coefficient123_174,
  OriginalRow227TriangleData1528.coefficient123_175,
  OriginalRow227TriangleData1528.coefficient123_176,
  OriginalRow227TriangleData1528.coefficient123_177,
  OriginalRow227TriangleData1528.coefficient123_178,
  OriginalRow227TriangleData1528.coefficient123_179,
  OriginalRow227TriangleData1528.coefficient123_180,
  OriginalRow227TriangleData1528.coefficient123_181,
  OriginalRow227TriangleData1528.coefficient123_182,
  OriginalRow227TriangleData1528.coefficient123_183,
  OriginalRow227TriangleData1528.coefficient123_184,
  OriginalRow227TriangleData1528.coefficient123_185
]

theorem values1528_size : values1528.size = 32 := rfl

def block1528 : ℕ → Option IntervalDyadic := segment 154 values1528

theorem block1528_domain : ExactDomain block1528 154 186 := by
  simpa only [values1528_size] using segment_domain 154 values1528

theorem block1528_get (i : Fin 32) :
    block1528 (154 + i.val) = some (values1528[i.val]'(by rw [values1528_size]; exact i.isLt)) := by
  exact segment_get 154 values1528 ⟨i.val, by rw [values1528_size]; exact i.isLt⟩

def values1529 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1529.coefficient123_186,
  OriginalRow227TriangleData1529.coefficient123_187,
  OriginalRow227TriangleData1529.coefficient123_188,
  OriginalRow227TriangleData1529.coefficient123_189,
  OriginalRow227TriangleData1529.coefficient123_190,
  OriginalRow227TriangleData1529.coefficient123_191,
  OriginalRow227TriangleData1529.coefficient123_192,
  OriginalRow227TriangleData1529.coefficient123_193,
  OriginalRow227TriangleData1529.coefficient123_194,
  OriginalRow227TriangleData1529.coefficient123_195,
  OriginalRow227TriangleData1529.coefficient123_196,
  OriginalRow227TriangleData1529.coefficient123_197,
  OriginalRow227TriangleData1529.coefficient123_198,
  OriginalRow227TriangleData1529.coefficient123_199,
  OriginalRow227TriangleData1529.coefficient123_200,
  OriginalRow227TriangleData1529.coefficient123_201,
  OriginalRow227TriangleData1529.coefficient123_202,
  OriginalRow227TriangleData1529.coefficient123_203,
  OriginalRow227TriangleData1529.coefficient123_204,
  OriginalRow227TriangleData1529.coefficient123_205,
  OriginalRow227TriangleData1529.coefficient123_206,
  OriginalRow227TriangleData1529.coefficient123_207,
  OriginalRow227TriangleData1529.coefficient123_208,
  OriginalRow227TriangleData1529.coefficient123_209,
  OriginalRow227TriangleData1529.coefficient123_210,
  OriginalRow227TriangleData1529.coefficient123_211,
  OriginalRow227TriangleData1529.coefficient123_212,
  OriginalRow227TriangleData1529.coefficient123_213,
  OriginalRow227TriangleData1529.coefficient123_214,
  OriginalRow227TriangleData1529.coefficient123_215,
  OriginalRow227TriangleData1529.coefficient123_216,
  OriginalRow227TriangleData1529.coefficient123_217
]

theorem values1529_size : values1529.size = 32 := rfl

def block1529 : ℕ → Option IntervalDyadic := segment 186 values1529

theorem block1529_domain : ExactDomain block1529 186 218 := by
  simpa only [values1529_size] using segment_domain 186 values1529

theorem block1529_get (i : Fin 32) :
    block1529 (186 + i.val) = some (values1529[i.val]'(by rw [values1529_size]; exact i.isLt)) := by
  exact segment_get 186 values1529 ⟨i.val, by rw [values1529_size]; exact i.isLt⟩

def values1530 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1530.coefficient123_218,
  OriginalRow227TriangleData1530.coefficient123_219,
  OriginalRow227TriangleData1530.coefficient123_220,
  OriginalRow227TriangleData1530.coefficient123_221,
  OriginalRow227TriangleData1530.coefficient123_222,
  OriginalRow227TriangleData1530.coefficient123_223,
  OriginalRow227TriangleData1530.coefficient123_224,
  OriginalRow227TriangleData1530.coefficient123_225,
  OriginalRow227TriangleData1530.coefficient123_226,
  OriginalRow227TriangleData1530.coefficient123_227,
  OriginalRow227TriangleData1530.coefficient123_228,
  OriginalRow227TriangleData1530.coefficient123_229,
  OriginalRow227TriangleData1530.coefficient123_230,
  OriginalRow227TriangleData1530.coefficient123_231,
  OriginalRow227TriangleData1530.coefficient123_232,
  OriginalRow227TriangleData1530.coefficient123_233,
  OriginalRow227TriangleData1530.coefficient123_234,
  OriginalRow227TriangleData1530.coefficient123_235,
  OriginalRow227TriangleData1530.coefficient123_236,
  OriginalRow227TriangleData1530.coefficient123_237,
  OriginalRow227TriangleData1530.coefficient123_238,
  OriginalRow227TriangleData1530.coefficient123_239,
  OriginalRow227TriangleData1530.coefficient123_240,
  OriginalRow227TriangleData1530.coefficient123_241,
  OriginalRow227TriangleData1530.coefficient123_242,
  OriginalRow227TriangleData1530.coefficient123_243,
  OriginalRow227TriangleData1530.coefficient123_244,
  OriginalRow227TriangleData1530.coefficient123_245,
  OriginalRow227TriangleData1530.coefficient123_246,
  OriginalRow227TriangleData1530.coefficient123_247,
  OriginalRow227TriangleData1530.coefficient123_248,
  OriginalRow227TriangleData1530.coefficient123_249
]

theorem values1530_size : values1530.size = 32 := rfl

def block1530 : ℕ → Option IntervalDyadic := segment 218 values1530

theorem block1530_domain : ExactDomain block1530 218 250 := by
  simpa only [values1530_size] using segment_domain 218 values1530

theorem block1530_get (i : Fin 32) :
    block1530 (218 + i.val) = some (values1530[i.val]'(by rw [values1530_size]; exact i.isLt)) := by
  exact segment_get 218 values1530 ⟨i.val, by rw [values1530_size]; exact i.isLt⟩

def values1531 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1531.coefficient123_250,
  OriginalRow227TriangleData1531.coefficient123_251,
  OriginalRow227TriangleData1531.coefficient123_252,
  OriginalRow227TriangleData1531.coefficient123_253,
  OriginalRow227TriangleData1531.coefficient123_254,
  OriginalRow227TriangleData1531.coefficient123_255,
  OriginalRow227TriangleData1531.coefficient123_256,
  OriginalRow227TriangleData1531.coefficient123_257,
  OriginalRow227TriangleData1531.coefficient123_258,
  OriginalRow227TriangleData1531.coefficient123_259,
  OriginalRow227TriangleData1531.coefficient123_260,
  OriginalRow227TriangleData1531.coefficient123_261,
  OriginalRow227TriangleData1531.coefficient123_262,
  OriginalRow227TriangleData1531.coefficient123_263,
  OriginalRow227TriangleData1531.coefficient123_264,
  OriginalRow227TriangleData1531.coefficient123_265,
  OriginalRow227TriangleData1531.coefficient123_266,
  OriginalRow227TriangleData1531.coefficient123_267,
  OriginalRow227TriangleData1531.coefficient123_268,
  OriginalRow227TriangleData1531.coefficient123_269,
  OriginalRow227TriangleData1531.coefficient123_270,
  OriginalRow227TriangleData1531.coefficient123_271,
  OriginalRow227TriangleData1531.coefficient123_272,
  OriginalRow227TriangleData1531.coefficient123_273,
  OriginalRow227TriangleData1531.coefficient123_274,
  OriginalRow227TriangleData1531.coefficient123_275,
  OriginalRow227TriangleData1531.coefficient123_276,
  OriginalRow227TriangleData1531.coefficient123_277,
  OriginalRow227TriangleData1531.coefficient123_278,
  OriginalRow227TriangleData1531.coefficient123_279,
  OriginalRow227TriangleData1531.coefficient123_280,
  OriginalRow227TriangleData1531.coefficient123_281
]

theorem values1531_size : values1531.size = 32 := rfl

def block1531 : ℕ → Option IntervalDyadic := segment 250 values1531

theorem block1531_domain : ExactDomain block1531 250 282 := by
  simpa only [values1531_size] using segment_domain 250 values1531

theorem block1531_get (i : Fin 32) :
    block1531 (250 + i.val) = some (values1531[i.val]'(by rw [values1531_size]; exact i.isLt)) := by
  exact segment_get 250 values1531 ⟨i.val, by rw [values1531_size]; exact i.isLt⟩

def values1532 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1532.coefficient123_282,
  OriginalRow227TriangleData1532.coefficient123_283,
  OriginalRow227TriangleData1532.coefficient123_284,
  OriginalRow227TriangleData1532.coefficient123_285,
  OriginalRow227TriangleData1532.coefficient123_286,
  OriginalRow227TriangleData1532.coefficient123_287,
  OriginalRow227TriangleData1532.coefficient123_288,
  OriginalRow227TriangleData1532.coefficient123_289,
  OriginalRow227TriangleData1532.coefficient123_290,
  OriginalRow227TriangleData1532.coefficient123_291,
  OriginalRow227TriangleData1532.coefficient123_292,
  OriginalRow227TriangleData1532.coefficient123_293,
  OriginalRow227TriangleData1532.coefficient123_294,
  OriginalRow227TriangleData1532.coefficient123_295,
  OriginalRow227TriangleData1532.coefficient123_296,
  OriginalRow227TriangleData1532.coefficient123_297,
  OriginalRow227TriangleData1532.coefficient123_298,
  OriginalRow227TriangleData1532.coefficient123_299,
  OriginalRow227TriangleData1532.coefficient123_300,
  OriginalRow227TriangleData1532.coefficient123_301,
  OriginalRow227TriangleData1532.coefficient123_302,
  OriginalRow227TriangleData1532.coefficient123_303,
  OriginalRow227TriangleData1532.coefficient123_304,
  OriginalRow227TriangleData1532.coefficient123_305,
  OriginalRow227TriangleData1532.coefficient123_306,
  OriginalRow227TriangleData1532.coefficient123_307,
  OriginalRow227TriangleData1532.coefficient123_308,
  OriginalRow227TriangleData1532.coefficient123_309,
  OriginalRow227TriangleData1532.coefficient123_310,
  OriginalRow227TriangleData1532.coefficient123_311,
  OriginalRow227TriangleData1532.coefficient123_312,
  OriginalRow227TriangleData1532.coefficient123_313
]

theorem values1532_size : values1532.size = 32 := rfl

def block1532 : ℕ → Option IntervalDyadic := segment 282 values1532

theorem block1532_domain : ExactDomain block1532 282 314 := by
  simpa only [values1532_size] using segment_domain 282 values1532

theorem block1532_get (i : Fin 32) :
    block1532 (282 + i.val) = some (values1532[i.val]'(by rw [values1532_size]; exact i.isLt)) := by
  exact segment_get 282 values1532 ⟨i.val, by rw [values1532_size]; exact i.isLt⟩

def values1533 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1533.coefficient123_314,
  OriginalRow227TriangleData1533.coefficient123_315,
  OriginalRow227TriangleData1533.coefficient123_316,
  OriginalRow227TriangleData1533.coefficient123_317,
  OriginalRow227TriangleData1533.coefficient123_318,
  OriginalRow227TriangleData1533.coefficient123_319,
  OriginalRow227TriangleData1533.coefficient123_320,
  OriginalRow227TriangleData1533.coefficient123_321,
  OriginalRow227TriangleData1533.coefficient123_322,
  OriginalRow227TriangleData1533.coefficient123_323,
  OriginalRow227TriangleData1533.coefficient123_324,
  OriginalRow227TriangleData1533.coefficient123_325,
  OriginalRow227TriangleData1533.coefficient123_326,
  OriginalRow227TriangleData1533.coefficient123_327,
  OriginalRow227TriangleData1533.coefficient123_328,
  OriginalRow227TriangleData1533.coefficient123_329,
  OriginalRow227TriangleData1533.coefficient123_330,
  OriginalRow227TriangleData1533.coefficient123_331,
  OriginalRow227TriangleData1533.coefficient123_332,
  OriginalRow227TriangleData1533.coefficient123_333,
  OriginalRow227TriangleData1533.coefficient123_334,
  OriginalRow227TriangleData1533.coefficient123_335,
  OriginalRow227TriangleData1533.coefficient123_336,
  OriginalRow227TriangleData1533.coefficient123_337,
  OriginalRow227TriangleData1533.coefficient123_338,
  OriginalRow227TriangleData1533.coefficient123_339,
  OriginalRow227TriangleData1533.coefficient123_340,
  OriginalRow227TriangleData1533.coefficient123_341,
  OriginalRow227TriangleData1533.coefficient123_342,
  OriginalRow227TriangleData1533.coefficient123_343,
  OriginalRow227TriangleData1533.coefficient123_344,
  OriginalRow227TriangleData1533.coefficient123_345
]

theorem values1533_size : values1533.size = 32 := rfl

def block1533 : ℕ → Option IntervalDyadic := segment 314 values1533

theorem block1533_domain : ExactDomain block1533 314 346 := by
  simpa only [values1533_size] using segment_domain 314 values1533

theorem block1533_get (i : Fin 32) :
    block1533 (314 + i.val) = some (values1533[i.val]'(by rw [values1533_size]; exact i.isLt)) := by
  exact segment_get 314 values1533 ⟨i.val, by rw [values1533_size]; exact i.isLt⟩

def values1534 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1534.coefficient123_346,
  OriginalRow227TriangleData1534.coefficient123_347,
  OriginalRow227TriangleData1534.coefficient123_348,
  OriginalRow227TriangleData1534.coefficient123_349,
  OriginalRow227TriangleData1534.coefficient123_350,
  OriginalRow227TriangleData1534.coefficient123_351,
  OriginalRow227TriangleData1534.coefficient123_352,
  OriginalRow227TriangleData1534.coefficient123_353,
  OriginalRow227TriangleData1534.coefficient123_354,
  OriginalRow227TriangleData1534.coefficient123_355,
  OriginalRow227TriangleData1534.coefficient123_356,
  OriginalRow227TriangleData1534.coefficient123_357,
  OriginalRow227TriangleData1534.coefficient123_358,
  OriginalRow227TriangleData1534.coefficient123_359,
  OriginalRow227TriangleData1534.coefficient123_360,
  OriginalRow227TriangleData1534.coefficient123_361,
  OriginalRow227TriangleData1534.coefficient123_362,
  OriginalRow227TriangleData1534.coefficient123_363,
  OriginalRow227TriangleData1534.coefficient123_364,
  OriginalRow227TriangleData1534.coefficient123_365,
  OriginalRow227TriangleData1534.coefficient123_366,
  OriginalRow227TriangleData1534.coefficient123_367,
  OriginalRow227TriangleData1534.coefficient123_368,
  OriginalRow227TriangleData1534.coefficient123_369,
  OriginalRow227TriangleData1534.coefficient123_370,
  OriginalRow227TriangleData1534.coefficient123_371,
  OriginalRow227TriangleData1534.coefficient123_372,
  OriginalRow227TriangleData1534.coefficient123_373,
  OriginalRow227TriangleData1534.coefficient123_374,
  OriginalRow227TriangleData1534.coefficient123_375,
  OriginalRow227TriangleData1534.coefficient123_376,
  OriginalRow227TriangleData1534.coefficient123_377
]

theorem values1534_size : values1534.size = 32 := rfl

def block1534 : ℕ → Option IntervalDyadic := segment 346 values1534

theorem block1534_domain : ExactDomain block1534 346 378 := by
  simpa only [values1534_size] using segment_domain 346 values1534

theorem block1534_get (i : Fin 32) :
    block1534 (346 + i.val) = some (values1534[i.val]'(by rw [values1534_size]; exact i.isLt)) := by
  exact segment_get 346 values1534 ⟨i.val, by rw [values1534_size]; exact i.isLt⟩

def values1535 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1535.coefficient123_378
]

theorem values1535_size : values1535.size = 1 := rfl

def block1535 : ℕ → Option IntervalDyadic := segment 378 values1535

theorem block1535_domain : ExactDomain block1535 378 379 := by
  simpa only [values1535_size] using segment_domain 378 values1535

theorem block1535_get (i : Fin 1) :
    block1535 (378 + i.val) = some (values1535[i.val]'(by rw [values1535_size]; exact i.isLt)) := by
  exact segment_get 378 values1535 ⟨i.val, by rw [values1535_size]; exact i.isLt⟩

def node0122_0186 : ℕ → Option IntervalDyadic := split 154 block1527 block1528

theorem node0122_0186_domain : ExactDomain node0122_0186 122 186 := by
  exact split_domain (by decide) (by decide) block1527_domain block1528_domain

def node0186_0250 : ℕ → Option IntervalDyadic := split 218 block1529 block1530

theorem node0186_0250_domain : ExactDomain node0186_0250 186 250 := by
  exact split_domain (by decide) (by decide) block1529_domain block1530_domain

def node0122_0250 : ℕ → Option IntervalDyadic := split 186 node0122_0186 node0186_0250

theorem node0122_0250_domain : ExactDomain node0122_0250 122 250 := by
  exact split_domain (by decide) (by decide) node0122_0186_domain node0186_0250_domain

def node0250_0314 : ℕ → Option IntervalDyadic := split 282 block1531 block1532

theorem node0250_0314_domain : ExactDomain node0250_0314 250 314 := by
  exact split_domain (by decide) (by decide) block1531_domain block1532_domain

def node0346_0379 : ℕ → Option IntervalDyadic := split 378 block1534 block1535

theorem node0346_0379_domain : ExactDomain node0346_0379 346 379 := by
  exact split_domain (by decide) (by decide) block1534_domain block1535_domain

def node0314_0379 : ℕ → Option IntervalDyadic := split 346 block1533 node0346_0379

theorem node0314_0379_domain : ExactDomain node0314_0379 314 379 := by
  exact split_domain (by decide) (by decide) block1533_domain node0346_0379_domain

def node0250_0379 : ℕ → Option IntervalDyadic := split 314 node0250_0314 node0314_0379

theorem node0250_0379_domain : ExactDomain node0250_0379 250 379 := by
  exact split_domain (by decide) (by decide) node0250_0314_domain node0314_0379_domain

def node0122_0379 : ℕ → Option IntervalDyadic := split 250 node0122_0250 node0250_0379

theorem node0122_0379_domain : ExactDomain node0122_0379 122 379 := by
  exact split_domain (by decide) (by decide) node0122_0250_domain node0250_0379_domain

def lookup : ℕ → Option IntervalDyadic := node0122_0379

theorem lookup_domain : ExactDomain lookup 122 379 :=
  node0122_0379_domain

theorem block1527_lookup (i : Fin 32) :
    lookup (122 + i.val) = some (values1527[i.val]'(by rw [values1527_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (122 + i.val) = _
  rw [node0122_0379, split_left 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0122_0250, split_left 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0122_0186, split_left 154 block1527 block1528 (by omega)]
  exact block1527_get i

theorem block1528_lookup (i : Fin 32) :
    lookup (154 + i.val) = some (values1528[i.val]'(by rw [values1528_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (154 + i.val) = _
  rw [node0122_0379, split_left 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0122_0250, split_left 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0122_0186, split_right 154 block1527 block1528 (by omega)]
  exact block1528_get i

theorem block1529_lookup (i : Fin 32) :
    lookup (186 + i.val) = some (values1529[i.val]'(by rw [values1529_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (186 + i.val) = _
  rw [node0122_0379, split_left 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0122_0250, split_right 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0186_0250, split_left 218 block1529 block1530 (by omega)]
  exact block1529_get i

theorem block1530_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values1530[i.val]'(by rw [values1530_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (218 + i.val) = _
  rw [node0122_0379, split_left 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0122_0250, split_right 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0186_0250, split_right 218 block1529 block1530 (by omega)]
  exact block1530_get i

theorem block1531_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values1531[i.val]'(by rw [values1531_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (250 + i.val) = _
  rw [node0122_0379, split_right 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0250_0379, split_left 314 node0250_0314 node0314_0379 (by omega)]
  rw [node0250_0314, split_left 282 block1531 block1532 (by omega)]
  exact block1531_get i

theorem block1532_lookup (i : Fin 32) :
    lookup (282 + i.val) = some (values1532[i.val]'(by rw [values1532_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (282 + i.val) = _
  rw [node0122_0379, split_right 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0250_0379, split_left 314 node0250_0314 node0314_0379 (by omega)]
  rw [node0250_0314, split_right 282 block1531 block1532 (by omega)]
  exact block1532_get i

theorem block1533_lookup (i : Fin 32) :
    lookup (314 + i.val) = some (values1533[i.val]'(by rw [values1533_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (314 + i.val) = _
  rw [node0122_0379, split_right 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0250_0379, split_right 314 node0250_0314 node0314_0379 (by omega)]
  rw [node0314_0379, split_left 346 block1533 node0346_0379 (by omega)]
  exact block1533_get i

theorem block1534_lookup (i : Fin 32) :
    lookup (346 + i.val) = some (values1534[i.val]'(by rw [values1534_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (346 + i.val) = _
  rw [node0122_0379, split_right 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0250_0379, split_right 314 node0250_0314 node0314_0379 (by omega)]
  rw [node0314_0379, split_right 346 block1533 node0346_0379 (by omega)]
  rw [node0346_0379, split_left 378 block1534 block1535 (by omega)]
  exact block1534_get i

theorem block1535_lookup (i : Fin 1) :
    lookup (378 + i.val) = some (values1535[i.val]'(by rw [values1535_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0122_0379 (378 + i.val) = _
  rw [node0122_0379, split_right 250 node0122_0250 node0250_0379 (by omega)]
  rw [node0250_0379, split_right 314 node0250_0314 node0314_0379 (by omega)]
  rw [node0314_0379, split_right 346 block1533 node0346_0379 (by omega)]
  rw [node0346_0379, split_right 378 block1534 block1535 (by omega)]
  exact block1535_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1527_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1527_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1528_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1528_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1529_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1529_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1530_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1530_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1531_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1531_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1532_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1532_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1533_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1533_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1534_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1534_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1535_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1535_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1527_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1528_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1529_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1530_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1531_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1532_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1533_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1534_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow123.block1535_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow123
