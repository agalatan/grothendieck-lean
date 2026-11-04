import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1500
import Grothe.UpperChaos.OriginalRow227TriangleData1501
import Grothe.UpperChaos.OriginalRow227TriangleData1502
import Grothe.UpperChaos.OriginalRow227TriangleData1503
import Grothe.UpperChaos.OriginalRow227TriangleData1504
import Grothe.UpperChaos.OriginalRow227TriangleData1505
import Grothe.UpperChaos.OriginalRow227TriangleData1506
import Grothe.UpperChaos.OriginalRow227TriangleData1507
import Grothe.UpperChaos.OriginalRow227TriangleData1508

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow120

open ConditionalTableLookup

def values1500 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1500.coefficient120_119,
  OriginalRow227TriangleData1500.coefficient120_120,
  OriginalRow227TriangleData1500.coefficient120_121,
  OriginalRow227TriangleData1500.coefficient120_122,
  OriginalRow227TriangleData1500.coefficient120_123,
  OriginalRow227TriangleData1500.coefficient120_124,
  OriginalRow227TriangleData1500.coefficient120_125,
  OriginalRow227TriangleData1500.coefficient120_126,
  OriginalRow227TriangleData1500.coefficient120_127,
  OriginalRow227TriangleData1500.coefficient120_128,
  OriginalRow227TriangleData1500.coefficient120_129,
  OriginalRow227TriangleData1500.coefficient120_130,
  OriginalRow227TriangleData1500.coefficient120_131,
  OriginalRow227TriangleData1500.coefficient120_132,
  OriginalRow227TriangleData1500.coefficient120_133,
  OriginalRow227TriangleData1500.coefficient120_134,
  OriginalRow227TriangleData1500.coefficient120_135,
  OriginalRow227TriangleData1500.coefficient120_136,
  OriginalRow227TriangleData1500.coefficient120_137,
  OriginalRow227TriangleData1500.coefficient120_138,
  OriginalRow227TriangleData1500.coefficient120_139,
  OriginalRow227TriangleData1500.coefficient120_140,
  OriginalRow227TriangleData1500.coefficient120_141,
  OriginalRow227TriangleData1500.coefficient120_142,
  OriginalRow227TriangleData1500.coefficient120_143,
  OriginalRow227TriangleData1500.coefficient120_144,
  OriginalRow227TriangleData1500.coefficient120_145,
  OriginalRow227TriangleData1500.coefficient120_146,
  OriginalRow227TriangleData1500.coefficient120_147,
  OriginalRow227TriangleData1500.coefficient120_148,
  OriginalRow227TriangleData1500.coefficient120_149,
  OriginalRow227TriangleData1500.coefficient120_150
]

theorem values1500_size : values1500.size = 32 := rfl

def block1500 : ℕ → Option IntervalDyadic := segment 119 values1500

theorem block1500_domain : ExactDomain block1500 119 151 := by
  simpa only [values1500_size] using segment_domain 119 values1500

theorem block1500_get (i : Fin 32) :
    block1500 (119 + i.val) = some (values1500[i.val]'(by rw [values1500_size]; exact i.isLt)) := by
  exact segment_get 119 values1500 ⟨i.val, by rw [values1500_size]; exact i.isLt⟩

def values1501 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1501.coefficient120_151,
  OriginalRow227TriangleData1501.coefficient120_152,
  OriginalRow227TriangleData1501.coefficient120_153,
  OriginalRow227TriangleData1501.coefficient120_154,
  OriginalRow227TriangleData1501.coefficient120_155,
  OriginalRow227TriangleData1501.coefficient120_156,
  OriginalRow227TriangleData1501.coefficient120_157,
  OriginalRow227TriangleData1501.coefficient120_158,
  OriginalRow227TriangleData1501.coefficient120_159,
  OriginalRow227TriangleData1501.coefficient120_160,
  OriginalRow227TriangleData1501.coefficient120_161,
  OriginalRow227TriangleData1501.coefficient120_162,
  OriginalRow227TriangleData1501.coefficient120_163,
  OriginalRow227TriangleData1501.coefficient120_164,
  OriginalRow227TriangleData1501.coefficient120_165,
  OriginalRow227TriangleData1501.coefficient120_166,
  OriginalRow227TriangleData1501.coefficient120_167,
  OriginalRow227TriangleData1501.coefficient120_168,
  OriginalRow227TriangleData1501.coefficient120_169,
  OriginalRow227TriangleData1501.coefficient120_170,
  OriginalRow227TriangleData1501.coefficient120_171,
  OriginalRow227TriangleData1501.coefficient120_172,
  OriginalRow227TriangleData1501.coefficient120_173,
  OriginalRow227TriangleData1501.coefficient120_174,
  OriginalRow227TriangleData1501.coefficient120_175,
  OriginalRow227TriangleData1501.coefficient120_176,
  OriginalRow227TriangleData1501.coefficient120_177,
  OriginalRow227TriangleData1501.coefficient120_178,
  OriginalRow227TriangleData1501.coefficient120_179,
  OriginalRow227TriangleData1501.coefficient120_180,
  OriginalRow227TriangleData1501.coefficient120_181,
  OriginalRow227TriangleData1501.coefficient120_182
]

theorem values1501_size : values1501.size = 32 := rfl

def block1501 : ℕ → Option IntervalDyadic := segment 151 values1501

theorem block1501_domain : ExactDomain block1501 151 183 := by
  simpa only [values1501_size] using segment_domain 151 values1501

theorem block1501_get (i : Fin 32) :
    block1501 (151 + i.val) = some (values1501[i.val]'(by rw [values1501_size]; exact i.isLt)) := by
  exact segment_get 151 values1501 ⟨i.val, by rw [values1501_size]; exact i.isLt⟩

def values1502 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1502.coefficient120_183,
  OriginalRow227TriangleData1502.coefficient120_184,
  OriginalRow227TriangleData1502.coefficient120_185,
  OriginalRow227TriangleData1502.coefficient120_186,
  OriginalRow227TriangleData1502.coefficient120_187,
  OriginalRow227TriangleData1502.coefficient120_188,
  OriginalRow227TriangleData1502.coefficient120_189,
  OriginalRow227TriangleData1502.coefficient120_190,
  OriginalRow227TriangleData1502.coefficient120_191,
  OriginalRow227TriangleData1502.coefficient120_192,
  OriginalRow227TriangleData1502.coefficient120_193,
  OriginalRow227TriangleData1502.coefficient120_194,
  OriginalRow227TriangleData1502.coefficient120_195,
  OriginalRow227TriangleData1502.coefficient120_196,
  OriginalRow227TriangleData1502.coefficient120_197,
  OriginalRow227TriangleData1502.coefficient120_198,
  OriginalRow227TriangleData1502.coefficient120_199,
  OriginalRow227TriangleData1502.coefficient120_200,
  OriginalRow227TriangleData1502.coefficient120_201,
  OriginalRow227TriangleData1502.coefficient120_202,
  OriginalRow227TriangleData1502.coefficient120_203,
  OriginalRow227TriangleData1502.coefficient120_204,
  OriginalRow227TriangleData1502.coefficient120_205,
  OriginalRow227TriangleData1502.coefficient120_206,
  OriginalRow227TriangleData1502.coefficient120_207,
  OriginalRow227TriangleData1502.coefficient120_208,
  OriginalRow227TriangleData1502.coefficient120_209,
  OriginalRow227TriangleData1502.coefficient120_210,
  OriginalRow227TriangleData1502.coefficient120_211,
  OriginalRow227TriangleData1502.coefficient120_212,
  OriginalRow227TriangleData1502.coefficient120_213,
  OriginalRow227TriangleData1502.coefficient120_214
]

theorem values1502_size : values1502.size = 32 := rfl

def block1502 : ℕ → Option IntervalDyadic := segment 183 values1502

theorem block1502_domain : ExactDomain block1502 183 215 := by
  simpa only [values1502_size] using segment_domain 183 values1502

theorem block1502_get (i : Fin 32) :
    block1502 (183 + i.val) = some (values1502[i.val]'(by rw [values1502_size]; exact i.isLt)) := by
  exact segment_get 183 values1502 ⟨i.val, by rw [values1502_size]; exact i.isLt⟩

def values1503 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1503.coefficient120_215,
  OriginalRow227TriangleData1503.coefficient120_216,
  OriginalRow227TriangleData1503.coefficient120_217,
  OriginalRow227TriangleData1503.coefficient120_218,
  OriginalRow227TriangleData1503.coefficient120_219,
  OriginalRow227TriangleData1503.coefficient120_220,
  OriginalRow227TriangleData1503.coefficient120_221,
  OriginalRow227TriangleData1503.coefficient120_222,
  OriginalRow227TriangleData1503.coefficient120_223,
  OriginalRow227TriangleData1503.coefficient120_224,
  OriginalRow227TriangleData1503.coefficient120_225,
  OriginalRow227TriangleData1503.coefficient120_226,
  OriginalRow227TriangleData1503.coefficient120_227,
  OriginalRow227TriangleData1503.coefficient120_228,
  OriginalRow227TriangleData1503.coefficient120_229,
  OriginalRow227TriangleData1503.coefficient120_230,
  OriginalRow227TriangleData1503.coefficient120_231,
  OriginalRow227TriangleData1503.coefficient120_232,
  OriginalRow227TriangleData1503.coefficient120_233,
  OriginalRow227TriangleData1503.coefficient120_234,
  OriginalRow227TriangleData1503.coefficient120_235,
  OriginalRow227TriangleData1503.coefficient120_236,
  OriginalRow227TriangleData1503.coefficient120_237,
  OriginalRow227TriangleData1503.coefficient120_238,
  OriginalRow227TriangleData1503.coefficient120_239,
  OriginalRow227TriangleData1503.coefficient120_240,
  OriginalRow227TriangleData1503.coefficient120_241,
  OriginalRow227TriangleData1503.coefficient120_242,
  OriginalRow227TriangleData1503.coefficient120_243,
  OriginalRow227TriangleData1503.coefficient120_244,
  OriginalRow227TriangleData1503.coefficient120_245,
  OriginalRow227TriangleData1503.coefficient120_246
]

theorem values1503_size : values1503.size = 32 := rfl

def block1503 : ℕ → Option IntervalDyadic := segment 215 values1503

theorem block1503_domain : ExactDomain block1503 215 247 := by
  simpa only [values1503_size] using segment_domain 215 values1503

theorem block1503_get (i : Fin 32) :
    block1503 (215 + i.val) = some (values1503[i.val]'(by rw [values1503_size]; exact i.isLt)) := by
  exact segment_get 215 values1503 ⟨i.val, by rw [values1503_size]; exact i.isLt⟩

def values1504 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1504.coefficient120_247,
  OriginalRow227TriangleData1504.coefficient120_248,
  OriginalRow227TriangleData1504.coefficient120_249,
  OriginalRow227TriangleData1504.coefficient120_250,
  OriginalRow227TriangleData1504.coefficient120_251,
  OriginalRow227TriangleData1504.coefficient120_252,
  OriginalRow227TriangleData1504.coefficient120_253,
  OriginalRow227TriangleData1504.coefficient120_254,
  OriginalRow227TriangleData1504.coefficient120_255,
  OriginalRow227TriangleData1504.coefficient120_256,
  OriginalRow227TriangleData1504.coefficient120_257,
  OriginalRow227TriangleData1504.coefficient120_258,
  OriginalRow227TriangleData1504.coefficient120_259,
  OriginalRow227TriangleData1504.coefficient120_260,
  OriginalRow227TriangleData1504.coefficient120_261,
  OriginalRow227TriangleData1504.coefficient120_262,
  OriginalRow227TriangleData1504.coefficient120_263,
  OriginalRow227TriangleData1504.coefficient120_264,
  OriginalRow227TriangleData1504.coefficient120_265,
  OriginalRow227TriangleData1504.coefficient120_266,
  OriginalRow227TriangleData1504.coefficient120_267,
  OriginalRow227TriangleData1504.coefficient120_268,
  OriginalRow227TriangleData1504.coefficient120_269,
  OriginalRow227TriangleData1504.coefficient120_270,
  OriginalRow227TriangleData1504.coefficient120_271,
  OriginalRow227TriangleData1504.coefficient120_272,
  OriginalRow227TriangleData1504.coefficient120_273,
  OriginalRow227TriangleData1504.coefficient120_274,
  OriginalRow227TriangleData1504.coefficient120_275,
  OriginalRow227TriangleData1504.coefficient120_276,
  OriginalRow227TriangleData1504.coefficient120_277,
  OriginalRow227TriangleData1504.coefficient120_278
]

theorem values1504_size : values1504.size = 32 := rfl

def block1504 : ℕ → Option IntervalDyadic := segment 247 values1504

theorem block1504_domain : ExactDomain block1504 247 279 := by
  simpa only [values1504_size] using segment_domain 247 values1504

theorem block1504_get (i : Fin 32) :
    block1504 (247 + i.val) = some (values1504[i.val]'(by rw [values1504_size]; exact i.isLt)) := by
  exact segment_get 247 values1504 ⟨i.val, by rw [values1504_size]; exact i.isLt⟩

def values1505 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1505.coefficient120_279,
  OriginalRow227TriangleData1505.coefficient120_280,
  OriginalRow227TriangleData1505.coefficient120_281,
  OriginalRow227TriangleData1505.coefficient120_282,
  OriginalRow227TriangleData1505.coefficient120_283,
  OriginalRow227TriangleData1505.coefficient120_284,
  OriginalRow227TriangleData1505.coefficient120_285,
  OriginalRow227TriangleData1505.coefficient120_286,
  OriginalRow227TriangleData1505.coefficient120_287,
  OriginalRow227TriangleData1505.coefficient120_288,
  OriginalRow227TriangleData1505.coefficient120_289,
  OriginalRow227TriangleData1505.coefficient120_290,
  OriginalRow227TriangleData1505.coefficient120_291,
  OriginalRow227TriangleData1505.coefficient120_292,
  OriginalRow227TriangleData1505.coefficient120_293,
  OriginalRow227TriangleData1505.coefficient120_294,
  OriginalRow227TriangleData1505.coefficient120_295,
  OriginalRow227TriangleData1505.coefficient120_296,
  OriginalRow227TriangleData1505.coefficient120_297,
  OriginalRow227TriangleData1505.coefficient120_298,
  OriginalRow227TriangleData1505.coefficient120_299,
  OriginalRow227TriangleData1505.coefficient120_300,
  OriginalRow227TriangleData1505.coefficient120_301,
  OriginalRow227TriangleData1505.coefficient120_302,
  OriginalRow227TriangleData1505.coefficient120_303,
  OriginalRow227TriangleData1505.coefficient120_304,
  OriginalRow227TriangleData1505.coefficient120_305,
  OriginalRow227TriangleData1505.coefficient120_306,
  OriginalRow227TriangleData1505.coefficient120_307,
  OriginalRow227TriangleData1505.coefficient120_308,
  OriginalRow227TriangleData1505.coefficient120_309,
  OriginalRow227TriangleData1505.coefficient120_310
]

theorem values1505_size : values1505.size = 32 := rfl

def block1505 : ℕ → Option IntervalDyadic := segment 279 values1505

theorem block1505_domain : ExactDomain block1505 279 311 := by
  simpa only [values1505_size] using segment_domain 279 values1505

theorem block1505_get (i : Fin 32) :
    block1505 (279 + i.val) = some (values1505[i.val]'(by rw [values1505_size]; exact i.isLt)) := by
  exact segment_get 279 values1505 ⟨i.val, by rw [values1505_size]; exact i.isLt⟩

def values1506 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1506.coefficient120_311,
  OriginalRow227TriangleData1506.coefficient120_312,
  OriginalRow227TriangleData1506.coefficient120_313,
  OriginalRow227TriangleData1506.coefficient120_314,
  OriginalRow227TriangleData1506.coefficient120_315,
  OriginalRow227TriangleData1506.coefficient120_316,
  OriginalRow227TriangleData1506.coefficient120_317,
  OriginalRow227TriangleData1506.coefficient120_318,
  OriginalRow227TriangleData1506.coefficient120_319,
  OriginalRow227TriangleData1506.coefficient120_320,
  OriginalRow227TriangleData1506.coefficient120_321,
  OriginalRow227TriangleData1506.coefficient120_322,
  OriginalRow227TriangleData1506.coefficient120_323,
  OriginalRow227TriangleData1506.coefficient120_324,
  OriginalRow227TriangleData1506.coefficient120_325,
  OriginalRow227TriangleData1506.coefficient120_326,
  OriginalRow227TriangleData1506.coefficient120_327,
  OriginalRow227TriangleData1506.coefficient120_328,
  OriginalRow227TriangleData1506.coefficient120_329,
  OriginalRow227TriangleData1506.coefficient120_330,
  OriginalRow227TriangleData1506.coefficient120_331,
  OriginalRow227TriangleData1506.coefficient120_332,
  OriginalRow227TriangleData1506.coefficient120_333,
  OriginalRow227TriangleData1506.coefficient120_334,
  OriginalRow227TriangleData1506.coefficient120_335,
  OriginalRow227TriangleData1506.coefficient120_336,
  OriginalRow227TriangleData1506.coefficient120_337,
  OriginalRow227TriangleData1506.coefficient120_338,
  OriginalRow227TriangleData1506.coefficient120_339,
  OriginalRow227TriangleData1506.coefficient120_340,
  OriginalRow227TriangleData1506.coefficient120_341,
  OriginalRow227TriangleData1506.coefficient120_342
]

theorem values1506_size : values1506.size = 32 := rfl

def block1506 : ℕ → Option IntervalDyadic := segment 311 values1506

theorem block1506_domain : ExactDomain block1506 311 343 := by
  simpa only [values1506_size] using segment_domain 311 values1506

theorem block1506_get (i : Fin 32) :
    block1506 (311 + i.val) = some (values1506[i.val]'(by rw [values1506_size]; exact i.isLt)) := by
  exact segment_get 311 values1506 ⟨i.val, by rw [values1506_size]; exact i.isLt⟩

def values1507 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1507.coefficient120_343,
  OriginalRow227TriangleData1507.coefficient120_344,
  OriginalRow227TriangleData1507.coefficient120_345,
  OriginalRow227TriangleData1507.coefficient120_346,
  OriginalRow227TriangleData1507.coefficient120_347,
  OriginalRow227TriangleData1507.coefficient120_348,
  OriginalRow227TriangleData1507.coefficient120_349,
  OriginalRow227TriangleData1507.coefficient120_350,
  OriginalRow227TriangleData1507.coefficient120_351,
  OriginalRow227TriangleData1507.coefficient120_352,
  OriginalRow227TriangleData1507.coefficient120_353,
  OriginalRow227TriangleData1507.coefficient120_354,
  OriginalRow227TriangleData1507.coefficient120_355,
  OriginalRow227TriangleData1507.coefficient120_356,
  OriginalRow227TriangleData1507.coefficient120_357,
  OriginalRow227TriangleData1507.coefficient120_358,
  OriginalRow227TriangleData1507.coefficient120_359,
  OriginalRow227TriangleData1507.coefficient120_360,
  OriginalRow227TriangleData1507.coefficient120_361,
  OriginalRow227TriangleData1507.coefficient120_362,
  OriginalRow227TriangleData1507.coefficient120_363,
  OriginalRow227TriangleData1507.coefficient120_364,
  OriginalRow227TriangleData1507.coefficient120_365,
  OriginalRow227TriangleData1507.coefficient120_366,
  OriginalRow227TriangleData1507.coefficient120_367,
  OriginalRow227TriangleData1507.coefficient120_368,
  OriginalRow227TriangleData1507.coefficient120_369,
  OriginalRow227TriangleData1507.coefficient120_370,
  OriginalRow227TriangleData1507.coefficient120_371,
  OriginalRow227TriangleData1507.coefficient120_372,
  OriginalRow227TriangleData1507.coefficient120_373,
  OriginalRow227TriangleData1507.coefficient120_374
]

theorem values1507_size : values1507.size = 32 := rfl

def block1507 : ℕ → Option IntervalDyadic := segment 343 values1507

theorem block1507_domain : ExactDomain block1507 343 375 := by
  simpa only [values1507_size] using segment_domain 343 values1507

theorem block1507_get (i : Fin 32) :
    block1507 (343 + i.val) = some (values1507[i.val]'(by rw [values1507_size]; exact i.isLt)) := by
  exact segment_get 343 values1507 ⟨i.val, by rw [values1507_size]; exact i.isLt⟩

def values1508 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1508.coefficient120_375,
  OriginalRow227TriangleData1508.coefficient120_376,
  OriginalRow227TriangleData1508.coefficient120_377,
  OriginalRow227TriangleData1508.coefficient120_378,
  OriginalRow227TriangleData1508.coefficient120_379,
  OriginalRow227TriangleData1508.coefficient120_380,
  OriginalRow227TriangleData1508.coefficient120_381
]

theorem values1508_size : values1508.size = 7 := rfl

def block1508 : ℕ → Option IntervalDyadic := segment 375 values1508

theorem block1508_domain : ExactDomain block1508 375 382 := by
  simpa only [values1508_size] using segment_domain 375 values1508

theorem block1508_get (i : Fin 7) :
    block1508 (375 + i.val) = some (values1508[i.val]'(by rw [values1508_size]; exact i.isLt)) := by
  exact segment_get 375 values1508 ⟨i.val, by rw [values1508_size]; exact i.isLt⟩

def node0119_0183 : ℕ → Option IntervalDyadic := split 151 block1500 block1501

theorem node0119_0183_domain : ExactDomain node0119_0183 119 183 := by
  exact split_domain (by decide) (by decide) block1500_domain block1501_domain

def node0183_0247 : ℕ → Option IntervalDyadic := split 215 block1502 block1503

theorem node0183_0247_domain : ExactDomain node0183_0247 183 247 := by
  exact split_domain (by decide) (by decide) block1502_domain block1503_domain

def node0119_0247 : ℕ → Option IntervalDyadic := split 183 node0119_0183 node0183_0247

theorem node0119_0247_domain : ExactDomain node0119_0247 119 247 := by
  exact split_domain (by decide) (by decide) node0119_0183_domain node0183_0247_domain

def node0247_0311 : ℕ → Option IntervalDyadic := split 279 block1504 block1505

theorem node0247_0311_domain : ExactDomain node0247_0311 247 311 := by
  exact split_domain (by decide) (by decide) block1504_domain block1505_domain

def node0343_0382 : ℕ → Option IntervalDyadic := split 375 block1507 block1508

theorem node0343_0382_domain : ExactDomain node0343_0382 343 382 := by
  exact split_domain (by decide) (by decide) block1507_domain block1508_domain

def node0311_0382 : ℕ → Option IntervalDyadic := split 343 block1506 node0343_0382

theorem node0311_0382_domain : ExactDomain node0311_0382 311 382 := by
  exact split_domain (by decide) (by decide) block1506_domain node0343_0382_domain

def node0247_0382 : ℕ → Option IntervalDyadic := split 311 node0247_0311 node0311_0382

theorem node0247_0382_domain : ExactDomain node0247_0382 247 382 := by
  exact split_domain (by decide) (by decide) node0247_0311_domain node0311_0382_domain

def node0119_0382 : ℕ → Option IntervalDyadic := split 247 node0119_0247 node0247_0382

theorem node0119_0382_domain : ExactDomain node0119_0382 119 382 := by
  exact split_domain (by decide) (by decide) node0119_0247_domain node0247_0382_domain

def lookup : ℕ → Option IntervalDyadic := node0119_0382

theorem lookup_domain : ExactDomain lookup 119 382 :=
  node0119_0382_domain

theorem block1500_lookup (i : Fin 32) :
    lookup (119 + i.val) = some (values1500[i.val]'(by rw [values1500_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (119 + i.val) = _
  rw [node0119_0382, split_left 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0119_0247, split_left 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0119_0183, split_left 151 block1500 block1501 (by omega)]
  exact block1500_get i

theorem block1501_lookup (i : Fin 32) :
    lookup (151 + i.val) = some (values1501[i.val]'(by rw [values1501_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (151 + i.val) = _
  rw [node0119_0382, split_left 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0119_0247, split_left 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0119_0183, split_right 151 block1500 block1501 (by omega)]
  exact block1501_get i

theorem block1502_lookup (i : Fin 32) :
    lookup (183 + i.val) = some (values1502[i.val]'(by rw [values1502_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (183 + i.val) = _
  rw [node0119_0382, split_left 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0119_0247, split_right 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0183_0247, split_left 215 block1502 block1503 (by omega)]
  exact block1502_get i

theorem block1503_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values1503[i.val]'(by rw [values1503_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (215 + i.val) = _
  rw [node0119_0382, split_left 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0119_0247, split_right 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0183_0247, split_right 215 block1502 block1503 (by omega)]
  exact block1503_get i

theorem block1504_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values1504[i.val]'(by rw [values1504_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (247 + i.val) = _
  rw [node0119_0382, split_right 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0247_0382, split_left 311 node0247_0311 node0311_0382 (by omega)]
  rw [node0247_0311, split_left 279 block1504 block1505 (by omega)]
  exact block1504_get i

theorem block1505_lookup (i : Fin 32) :
    lookup (279 + i.val) = some (values1505[i.val]'(by rw [values1505_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (279 + i.val) = _
  rw [node0119_0382, split_right 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0247_0382, split_left 311 node0247_0311 node0311_0382 (by omega)]
  rw [node0247_0311, split_right 279 block1504 block1505 (by omega)]
  exact block1505_get i

theorem block1506_lookup (i : Fin 32) :
    lookup (311 + i.val) = some (values1506[i.val]'(by rw [values1506_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (311 + i.val) = _
  rw [node0119_0382, split_right 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0247_0382, split_right 311 node0247_0311 node0311_0382 (by omega)]
  rw [node0311_0382, split_left 343 block1506 node0343_0382 (by omega)]
  exact block1506_get i

theorem block1507_lookup (i : Fin 32) :
    lookup (343 + i.val) = some (values1507[i.val]'(by rw [values1507_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (343 + i.val) = _
  rw [node0119_0382, split_right 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0247_0382, split_right 311 node0247_0311 node0311_0382 (by omega)]
  rw [node0311_0382, split_right 343 block1506 node0343_0382 (by omega)]
  rw [node0343_0382, split_left 375 block1507 block1508 (by omega)]
  exact block1507_get i

theorem block1508_lookup (i : Fin 7) :
    lookup (375 + i.val) = some (values1508[i.val]'(by rw [values1508_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0119_0382 (375 + i.val) = _
  rw [node0119_0382, split_right 247 node0119_0247 node0247_0382 (by omega)]
  rw [node0247_0382, split_right 311 node0247_0311 node0311_0382 (by omega)]
  rw [node0311_0382, split_right 343 block1506 node0343_0382 (by omega)]
  rw [node0343_0382, split_right 375 block1507 block1508 (by omega)]
  exact block1508_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1500_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1500_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1501_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1501_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1502_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1502_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1503_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1503_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1504_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1504_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1505_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1505_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1506_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1506_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1507_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1507_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1508_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1508_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1500_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1501_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1502_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1503_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1504_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1505_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1506_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1507_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow120.block1508_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow120
