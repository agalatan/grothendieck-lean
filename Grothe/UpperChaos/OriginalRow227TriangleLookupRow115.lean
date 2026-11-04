import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1455
import Grothe.UpperChaos.OriginalRow227TriangleData1456
import Grothe.UpperChaos.OriginalRow227TriangleData1457
import Grothe.UpperChaos.OriginalRow227TriangleData1458
import Grothe.UpperChaos.OriginalRow227TriangleData1459
import Grothe.UpperChaos.OriginalRow227TriangleData1460
import Grothe.UpperChaos.OriginalRow227TriangleData1461
import Grothe.UpperChaos.OriginalRow227TriangleData1462
import Grothe.UpperChaos.OriginalRow227TriangleData1463

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow115

open ConditionalTableLookup

def values1455 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1455.coefficient115_114,
  OriginalRow227TriangleData1455.coefficient115_115,
  OriginalRow227TriangleData1455.coefficient115_116,
  OriginalRow227TriangleData1455.coefficient115_117,
  OriginalRow227TriangleData1455.coefficient115_118,
  OriginalRow227TriangleData1455.coefficient115_119,
  OriginalRow227TriangleData1455.coefficient115_120,
  OriginalRow227TriangleData1455.coefficient115_121,
  OriginalRow227TriangleData1455.coefficient115_122,
  OriginalRow227TriangleData1455.coefficient115_123,
  OriginalRow227TriangleData1455.coefficient115_124,
  OriginalRow227TriangleData1455.coefficient115_125,
  OriginalRow227TriangleData1455.coefficient115_126,
  OriginalRow227TriangleData1455.coefficient115_127,
  OriginalRow227TriangleData1455.coefficient115_128,
  OriginalRow227TriangleData1455.coefficient115_129,
  OriginalRow227TriangleData1455.coefficient115_130,
  OriginalRow227TriangleData1455.coefficient115_131,
  OriginalRow227TriangleData1455.coefficient115_132,
  OriginalRow227TriangleData1455.coefficient115_133,
  OriginalRow227TriangleData1455.coefficient115_134,
  OriginalRow227TriangleData1455.coefficient115_135,
  OriginalRow227TriangleData1455.coefficient115_136,
  OriginalRow227TriangleData1455.coefficient115_137,
  OriginalRow227TriangleData1455.coefficient115_138,
  OriginalRow227TriangleData1455.coefficient115_139,
  OriginalRow227TriangleData1455.coefficient115_140,
  OriginalRow227TriangleData1455.coefficient115_141,
  OriginalRow227TriangleData1455.coefficient115_142,
  OriginalRow227TriangleData1455.coefficient115_143,
  OriginalRow227TriangleData1455.coefficient115_144,
  OriginalRow227TriangleData1455.coefficient115_145
]

theorem values1455_size : values1455.size = 32 := rfl

def block1455 : ℕ → Option IntervalDyadic := segment 114 values1455

theorem block1455_domain : ExactDomain block1455 114 146 := by
  simpa only [values1455_size] using segment_domain 114 values1455

theorem block1455_get (i : Fin 32) :
    block1455 (114 + i.val) = some (values1455[i.val]'(by rw [values1455_size]; exact i.isLt)) := by
  exact segment_get 114 values1455 ⟨i.val, by rw [values1455_size]; exact i.isLt⟩

def values1456 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1456.coefficient115_146,
  OriginalRow227TriangleData1456.coefficient115_147,
  OriginalRow227TriangleData1456.coefficient115_148,
  OriginalRow227TriangleData1456.coefficient115_149,
  OriginalRow227TriangleData1456.coefficient115_150,
  OriginalRow227TriangleData1456.coefficient115_151,
  OriginalRow227TriangleData1456.coefficient115_152,
  OriginalRow227TriangleData1456.coefficient115_153,
  OriginalRow227TriangleData1456.coefficient115_154,
  OriginalRow227TriangleData1456.coefficient115_155,
  OriginalRow227TriangleData1456.coefficient115_156,
  OriginalRow227TriangleData1456.coefficient115_157,
  OriginalRow227TriangleData1456.coefficient115_158,
  OriginalRow227TriangleData1456.coefficient115_159,
  OriginalRow227TriangleData1456.coefficient115_160,
  OriginalRow227TriangleData1456.coefficient115_161,
  OriginalRow227TriangleData1456.coefficient115_162,
  OriginalRow227TriangleData1456.coefficient115_163,
  OriginalRow227TriangleData1456.coefficient115_164,
  OriginalRow227TriangleData1456.coefficient115_165,
  OriginalRow227TriangleData1456.coefficient115_166,
  OriginalRow227TriangleData1456.coefficient115_167,
  OriginalRow227TriangleData1456.coefficient115_168,
  OriginalRow227TriangleData1456.coefficient115_169,
  OriginalRow227TriangleData1456.coefficient115_170,
  OriginalRow227TriangleData1456.coefficient115_171,
  OriginalRow227TriangleData1456.coefficient115_172,
  OriginalRow227TriangleData1456.coefficient115_173,
  OriginalRow227TriangleData1456.coefficient115_174,
  OriginalRow227TriangleData1456.coefficient115_175,
  OriginalRow227TriangleData1456.coefficient115_176,
  OriginalRow227TriangleData1456.coefficient115_177
]

theorem values1456_size : values1456.size = 32 := rfl

def block1456 : ℕ → Option IntervalDyadic := segment 146 values1456

theorem block1456_domain : ExactDomain block1456 146 178 := by
  simpa only [values1456_size] using segment_domain 146 values1456

theorem block1456_get (i : Fin 32) :
    block1456 (146 + i.val) = some (values1456[i.val]'(by rw [values1456_size]; exact i.isLt)) := by
  exact segment_get 146 values1456 ⟨i.val, by rw [values1456_size]; exact i.isLt⟩

def values1457 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1457.coefficient115_178,
  OriginalRow227TriangleData1457.coefficient115_179,
  OriginalRow227TriangleData1457.coefficient115_180,
  OriginalRow227TriangleData1457.coefficient115_181,
  OriginalRow227TriangleData1457.coefficient115_182,
  OriginalRow227TriangleData1457.coefficient115_183,
  OriginalRow227TriangleData1457.coefficient115_184,
  OriginalRow227TriangleData1457.coefficient115_185,
  OriginalRow227TriangleData1457.coefficient115_186,
  OriginalRow227TriangleData1457.coefficient115_187,
  OriginalRow227TriangleData1457.coefficient115_188,
  OriginalRow227TriangleData1457.coefficient115_189,
  OriginalRow227TriangleData1457.coefficient115_190,
  OriginalRow227TriangleData1457.coefficient115_191,
  OriginalRow227TriangleData1457.coefficient115_192,
  OriginalRow227TriangleData1457.coefficient115_193,
  OriginalRow227TriangleData1457.coefficient115_194,
  OriginalRow227TriangleData1457.coefficient115_195,
  OriginalRow227TriangleData1457.coefficient115_196,
  OriginalRow227TriangleData1457.coefficient115_197,
  OriginalRow227TriangleData1457.coefficient115_198,
  OriginalRow227TriangleData1457.coefficient115_199,
  OriginalRow227TriangleData1457.coefficient115_200,
  OriginalRow227TriangleData1457.coefficient115_201,
  OriginalRow227TriangleData1457.coefficient115_202,
  OriginalRow227TriangleData1457.coefficient115_203,
  OriginalRow227TriangleData1457.coefficient115_204,
  OriginalRow227TriangleData1457.coefficient115_205,
  OriginalRow227TriangleData1457.coefficient115_206,
  OriginalRow227TriangleData1457.coefficient115_207,
  OriginalRow227TriangleData1457.coefficient115_208,
  OriginalRow227TriangleData1457.coefficient115_209
]

theorem values1457_size : values1457.size = 32 := rfl

def block1457 : ℕ → Option IntervalDyadic := segment 178 values1457

theorem block1457_domain : ExactDomain block1457 178 210 := by
  simpa only [values1457_size] using segment_domain 178 values1457

theorem block1457_get (i : Fin 32) :
    block1457 (178 + i.val) = some (values1457[i.val]'(by rw [values1457_size]; exact i.isLt)) := by
  exact segment_get 178 values1457 ⟨i.val, by rw [values1457_size]; exact i.isLt⟩

def values1458 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1458.coefficient115_210,
  OriginalRow227TriangleData1458.coefficient115_211,
  OriginalRow227TriangleData1458.coefficient115_212,
  OriginalRow227TriangleData1458.coefficient115_213,
  OriginalRow227TriangleData1458.coefficient115_214,
  OriginalRow227TriangleData1458.coefficient115_215,
  OriginalRow227TriangleData1458.coefficient115_216,
  OriginalRow227TriangleData1458.coefficient115_217,
  OriginalRow227TriangleData1458.coefficient115_218,
  OriginalRow227TriangleData1458.coefficient115_219,
  OriginalRow227TriangleData1458.coefficient115_220,
  OriginalRow227TriangleData1458.coefficient115_221,
  OriginalRow227TriangleData1458.coefficient115_222,
  OriginalRow227TriangleData1458.coefficient115_223,
  OriginalRow227TriangleData1458.coefficient115_224,
  OriginalRow227TriangleData1458.coefficient115_225,
  OriginalRow227TriangleData1458.coefficient115_226,
  OriginalRow227TriangleData1458.coefficient115_227,
  OriginalRow227TriangleData1458.coefficient115_228,
  OriginalRow227TriangleData1458.coefficient115_229,
  OriginalRow227TriangleData1458.coefficient115_230,
  OriginalRow227TriangleData1458.coefficient115_231,
  OriginalRow227TriangleData1458.coefficient115_232,
  OriginalRow227TriangleData1458.coefficient115_233,
  OriginalRow227TriangleData1458.coefficient115_234,
  OriginalRow227TriangleData1458.coefficient115_235,
  OriginalRow227TriangleData1458.coefficient115_236,
  OriginalRow227TriangleData1458.coefficient115_237,
  OriginalRow227TriangleData1458.coefficient115_238,
  OriginalRow227TriangleData1458.coefficient115_239,
  OriginalRow227TriangleData1458.coefficient115_240,
  OriginalRow227TriangleData1458.coefficient115_241
]

theorem values1458_size : values1458.size = 32 := rfl

def block1458 : ℕ → Option IntervalDyadic := segment 210 values1458

theorem block1458_domain : ExactDomain block1458 210 242 := by
  simpa only [values1458_size] using segment_domain 210 values1458

theorem block1458_get (i : Fin 32) :
    block1458 (210 + i.val) = some (values1458[i.val]'(by rw [values1458_size]; exact i.isLt)) := by
  exact segment_get 210 values1458 ⟨i.val, by rw [values1458_size]; exact i.isLt⟩

def values1459 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1459.coefficient115_242,
  OriginalRow227TriangleData1459.coefficient115_243,
  OriginalRow227TriangleData1459.coefficient115_244,
  OriginalRow227TriangleData1459.coefficient115_245,
  OriginalRow227TriangleData1459.coefficient115_246,
  OriginalRow227TriangleData1459.coefficient115_247,
  OriginalRow227TriangleData1459.coefficient115_248,
  OriginalRow227TriangleData1459.coefficient115_249,
  OriginalRow227TriangleData1459.coefficient115_250,
  OriginalRow227TriangleData1459.coefficient115_251,
  OriginalRow227TriangleData1459.coefficient115_252,
  OriginalRow227TriangleData1459.coefficient115_253,
  OriginalRow227TriangleData1459.coefficient115_254,
  OriginalRow227TriangleData1459.coefficient115_255,
  OriginalRow227TriangleData1459.coefficient115_256,
  OriginalRow227TriangleData1459.coefficient115_257,
  OriginalRow227TriangleData1459.coefficient115_258,
  OriginalRow227TriangleData1459.coefficient115_259,
  OriginalRow227TriangleData1459.coefficient115_260,
  OriginalRow227TriangleData1459.coefficient115_261,
  OriginalRow227TriangleData1459.coefficient115_262,
  OriginalRow227TriangleData1459.coefficient115_263,
  OriginalRow227TriangleData1459.coefficient115_264,
  OriginalRow227TriangleData1459.coefficient115_265,
  OriginalRow227TriangleData1459.coefficient115_266,
  OriginalRow227TriangleData1459.coefficient115_267,
  OriginalRow227TriangleData1459.coefficient115_268,
  OriginalRow227TriangleData1459.coefficient115_269,
  OriginalRow227TriangleData1459.coefficient115_270,
  OriginalRow227TriangleData1459.coefficient115_271,
  OriginalRow227TriangleData1459.coefficient115_272,
  OriginalRow227TriangleData1459.coefficient115_273
]

theorem values1459_size : values1459.size = 32 := rfl

def block1459 : ℕ → Option IntervalDyadic := segment 242 values1459

theorem block1459_domain : ExactDomain block1459 242 274 := by
  simpa only [values1459_size] using segment_domain 242 values1459

theorem block1459_get (i : Fin 32) :
    block1459 (242 + i.val) = some (values1459[i.val]'(by rw [values1459_size]; exact i.isLt)) := by
  exact segment_get 242 values1459 ⟨i.val, by rw [values1459_size]; exact i.isLt⟩

def values1460 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1460.coefficient115_274,
  OriginalRow227TriangleData1460.coefficient115_275,
  OriginalRow227TriangleData1460.coefficient115_276,
  OriginalRow227TriangleData1460.coefficient115_277,
  OriginalRow227TriangleData1460.coefficient115_278,
  OriginalRow227TriangleData1460.coefficient115_279,
  OriginalRow227TriangleData1460.coefficient115_280,
  OriginalRow227TriangleData1460.coefficient115_281,
  OriginalRow227TriangleData1460.coefficient115_282,
  OriginalRow227TriangleData1460.coefficient115_283,
  OriginalRow227TriangleData1460.coefficient115_284,
  OriginalRow227TriangleData1460.coefficient115_285,
  OriginalRow227TriangleData1460.coefficient115_286,
  OriginalRow227TriangleData1460.coefficient115_287,
  OriginalRow227TriangleData1460.coefficient115_288,
  OriginalRow227TriangleData1460.coefficient115_289,
  OriginalRow227TriangleData1460.coefficient115_290,
  OriginalRow227TriangleData1460.coefficient115_291,
  OriginalRow227TriangleData1460.coefficient115_292,
  OriginalRow227TriangleData1460.coefficient115_293,
  OriginalRow227TriangleData1460.coefficient115_294,
  OriginalRow227TriangleData1460.coefficient115_295,
  OriginalRow227TriangleData1460.coefficient115_296,
  OriginalRow227TriangleData1460.coefficient115_297,
  OriginalRow227TriangleData1460.coefficient115_298,
  OriginalRow227TriangleData1460.coefficient115_299,
  OriginalRow227TriangleData1460.coefficient115_300,
  OriginalRow227TriangleData1460.coefficient115_301,
  OriginalRow227TriangleData1460.coefficient115_302,
  OriginalRow227TriangleData1460.coefficient115_303,
  OriginalRow227TriangleData1460.coefficient115_304,
  OriginalRow227TriangleData1460.coefficient115_305
]

theorem values1460_size : values1460.size = 32 := rfl

def block1460 : ℕ → Option IntervalDyadic := segment 274 values1460

theorem block1460_domain : ExactDomain block1460 274 306 := by
  simpa only [values1460_size] using segment_domain 274 values1460

theorem block1460_get (i : Fin 32) :
    block1460 (274 + i.val) = some (values1460[i.val]'(by rw [values1460_size]; exact i.isLt)) := by
  exact segment_get 274 values1460 ⟨i.val, by rw [values1460_size]; exact i.isLt⟩

def values1461 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1461.coefficient115_306,
  OriginalRow227TriangleData1461.coefficient115_307,
  OriginalRow227TriangleData1461.coefficient115_308,
  OriginalRow227TriangleData1461.coefficient115_309,
  OriginalRow227TriangleData1461.coefficient115_310,
  OriginalRow227TriangleData1461.coefficient115_311,
  OriginalRow227TriangleData1461.coefficient115_312,
  OriginalRow227TriangleData1461.coefficient115_313,
  OriginalRow227TriangleData1461.coefficient115_314,
  OriginalRow227TriangleData1461.coefficient115_315,
  OriginalRow227TriangleData1461.coefficient115_316,
  OriginalRow227TriangleData1461.coefficient115_317,
  OriginalRow227TriangleData1461.coefficient115_318,
  OriginalRow227TriangleData1461.coefficient115_319,
  OriginalRow227TriangleData1461.coefficient115_320,
  OriginalRow227TriangleData1461.coefficient115_321,
  OriginalRow227TriangleData1461.coefficient115_322,
  OriginalRow227TriangleData1461.coefficient115_323,
  OriginalRow227TriangleData1461.coefficient115_324,
  OriginalRow227TriangleData1461.coefficient115_325,
  OriginalRow227TriangleData1461.coefficient115_326,
  OriginalRow227TriangleData1461.coefficient115_327,
  OriginalRow227TriangleData1461.coefficient115_328,
  OriginalRow227TriangleData1461.coefficient115_329,
  OriginalRow227TriangleData1461.coefficient115_330,
  OriginalRow227TriangleData1461.coefficient115_331,
  OriginalRow227TriangleData1461.coefficient115_332,
  OriginalRow227TriangleData1461.coefficient115_333,
  OriginalRow227TriangleData1461.coefficient115_334,
  OriginalRow227TriangleData1461.coefficient115_335,
  OriginalRow227TriangleData1461.coefficient115_336,
  OriginalRow227TriangleData1461.coefficient115_337
]

theorem values1461_size : values1461.size = 32 := rfl

def block1461 : ℕ → Option IntervalDyadic := segment 306 values1461

theorem block1461_domain : ExactDomain block1461 306 338 := by
  simpa only [values1461_size] using segment_domain 306 values1461

theorem block1461_get (i : Fin 32) :
    block1461 (306 + i.val) = some (values1461[i.val]'(by rw [values1461_size]; exact i.isLt)) := by
  exact segment_get 306 values1461 ⟨i.val, by rw [values1461_size]; exact i.isLt⟩

def values1462 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1462.coefficient115_338,
  OriginalRow227TriangleData1462.coefficient115_339,
  OriginalRow227TriangleData1462.coefficient115_340,
  OriginalRow227TriangleData1462.coefficient115_341,
  OriginalRow227TriangleData1462.coefficient115_342,
  OriginalRow227TriangleData1462.coefficient115_343,
  OriginalRow227TriangleData1462.coefficient115_344,
  OriginalRow227TriangleData1462.coefficient115_345,
  OriginalRow227TriangleData1462.coefficient115_346,
  OriginalRow227TriangleData1462.coefficient115_347,
  OriginalRow227TriangleData1462.coefficient115_348,
  OriginalRow227TriangleData1462.coefficient115_349,
  OriginalRow227TriangleData1462.coefficient115_350,
  OriginalRow227TriangleData1462.coefficient115_351,
  OriginalRow227TriangleData1462.coefficient115_352,
  OriginalRow227TriangleData1462.coefficient115_353,
  OriginalRow227TriangleData1462.coefficient115_354,
  OriginalRow227TriangleData1462.coefficient115_355,
  OriginalRow227TriangleData1462.coefficient115_356,
  OriginalRow227TriangleData1462.coefficient115_357,
  OriginalRow227TriangleData1462.coefficient115_358,
  OriginalRow227TriangleData1462.coefficient115_359,
  OriginalRow227TriangleData1462.coefficient115_360,
  OriginalRow227TriangleData1462.coefficient115_361,
  OriginalRow227TriangleData1462.coefficient115_362,
  OriginalRow227TriangleData1462.coefficient115_363,
  OriginalRow227TriangleData1462.coefficient115_364,
  OriginalRow227TriangleData1462.coefficient115_365,
  OriginalRow227TriangleData1462.coefficient115_366,
  OriginalRow227TriangleData1462.coefficient115_367,
  OriginalRow227TriangleData1462.coefficient115_368,
  OriginalRow227TriangleData1462.coefficient115_369
]

theorem values1462_size : values1462.size = 32 := rfl

def block1462 : ℕ → Option IntervalDyadic := segment 338 values1462

theorem block1462_domain : ExactDomain block1462 338 370 := by
  simpa only [values1462_size] using segment_domain 338 values1462

theorem block1462_get (i : Fin 32) :
    block1462 (338 + i.val) = some (values1462[i.val]'(by rw [values1462_size]; exact i.isLt)) := by
  exact segment_get 338 values1462 ⟨i.val, by rw [values1462_size]; exact i.isLt⟩

def values1463 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1463.coefficient115_370,
  OriginalRow227TriangleData1463.coefficient115_371,
  OriginalRow227TriangleData1463.coefficient115_372,
  OriginalRow227TriangleData1463.coefficient115_373,
  OriginalRow227TriangleData1463.coefficient115_374,
  OriginalRow227TriangleData1463.coefficient115_375,
  OriginalRow227TriangleData1463.coefficient115_376,
  OriginalRow227TriangleData1463.coefficient115_377,
  OriginalRow227TriangleData1463.coefficient115_378,
  OriginalRow227TriangleData1463.coefficient115_379,
  OriginalRow227TriangleData1463.coefficient115_380,
  OriginalRow227TriangleData1463.coefficient115_381,
  OriginalRow227TriangleData1463.coefficient115_382,
  OriginalRow227TriangleData1463.coefficient115_383,
  OriginalRow227TriangleData1463.coefficient115_384,
  OriginalRow227TriangleData1463.coefficient115_385,
  OriginalRow227TriangleData1463.coefficient115_386
]

theorem values1463_size : values1463.size = 17 := rfl

def block1463 : ℕ → Option IntervalDyadic := segment 370 values1463

theorem block1463_domain : ExactDomain block1463 370 387 := by
  simpa only [values1463_size] using segment_domain 370 values1463

theorem block1463_get (i : Fin 17) :
    block1463 (370 + i.val) = some (values1463[i.val]'(by rw [values1463_size]; exact i.isLt)) := by
  exact segment_get 370 values1463 ⟨i.val, by rw [values1463_size]; exact i.isLt⟩

def node0114_0178 : ℕ → Option IntervalDyadic := split 146 block1455 block1456

theorem node0114_0178_domain : ExactDomain node0114_0178 114 178 := by
  exact split_domain (by decide) (by decide) block1455_domain block1456_domain

def node0178_0242 : ℕ → Option IntervalDyadic := split 210 block1457 block1458

theorem node0178_0242_domain : ExactDomain node0178_0242 178 242 := by
  exact split_domain (by decide) (by decide) block1457_domain block1458_domain

def node0114_0242 : ℕ → Option IntervalDyadic := split 178 node0114_0178 node0178_0242

theorem node0114_0242_domain : ExactDomain node0114_0242 114 242 := by
  exact split_domain (by decide) (by decide) node0114_0178_domain node0178_0242_domain

def node0242_0306 : ℕ → Option IntervalDyadic := split 274 block1459 block1460

theorem node0242_0306_domain : ExactDomain node0242_0306 242 306 := by
  exact split_domain (by decide) (by decide) block1459_domain block1460_domain

def node0338_0387 : ℕ → Option IntervalDyadic := split 370 block1462 block1463

theorem node0338_0387_domain : ExactDomain node0338_0387 338 387 := by
  exact split_domain (by decide) (by decide) block1462_domain block1463_domain

def node0306_0387 : ℕ → Option IntervalDyadic := split 338 block1461 node0338_0387

theorem node0306_0387_domain : ExactDomain node0306_0387 306 387 := by
  exact split_domain (by decide) (by decide) block1461_domain node0338_0387_domain

def node0242_0387 : ℕ → Option IntervalDyadic := split 306 node0242_0306 node0306_0387

theorem node0242_0387_domain : ExactDomain node0242_0387 242 387 := by
  exact split_domain (by decide) (by decide) node0242_0306_domain node0306_0387_domain

def node0114_0387 : ℕ → Option IntervalDyadic := split 242 node0114_0242 node0242_0387

theorem node0114_0387_domain : ExactDomain node0114_0387 114 387 := by
  exact split_domain (by decide) (by decide) node0114_0242_domain node0242_0387_domain

def lookup : ℕ → Option IntervalDyadic := node0114_0387

theorem lookup_domain : ExactDomain lookup 114 387 :=
  node0114_0387_domain

theorem block1455_lookup (i : Fin 32) :
    lookup (114 + i.val) = some (values1455[i.val]'(by rw [values1455_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (114 + i.val) = _
  rw [node0114_0387, split_left 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0114_0242, split_left 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0114_0178, split_left 146 block1455 block1456 (by omega)]
  exact block1455_get i

theorem block1456_lookup (i : Fin 32) :
    lookup (146 + i.val) = some (values1456[i.val]'(by rw [values1456_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (146 + i.val) = _
  rw [node0114_0387, split_left 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0114_0242, split_left 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0114_0178, split_right 146 block1455 block1456 (by omega)]
  exact block1456_get i

theorem block1457_lookup (i : Fin 32) :
    lookup (178 + i.val) = some (values1457[i.val]'(by rw [values1457_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (178 + i.val) = _
  rw [node0114_0387, split_left 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0114_0242, split_right 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0178_0242, split_left 210 block1457 block1458 (by omega)]
  exact block1457_get i

theorem block1458_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values1458[i.val]'(by rw [values1458_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (210 + i.val) = _
  rw [node0114_0387, split_left 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0114_0242, split_right 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0178_0242, split_right 210 block1457 block1458 (by omega)]
  exact block1458_get i

theorem block1459_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values1459[i.val]'(by rw [values1459_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (242 + i.val) = _
  rw [node0114_0387, split_right 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0242_0387, split_left 306 node0242_0306 node0306_0387 (by omega)]
  rw [node0242_0306, split_left 274 block1459 block1460 (by omega)]
  exact block1459_get i

theorem block1460_lookup (i : Fin 32) :
    lookup (274 + i.val) = some (values1460[i.val]'(by rw [values1460_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (274 + i.val) = _
  rw [node0114_0387, split_right 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0242_0387, split_left 306 node0242_0306 node0306_0387 (by omega)]
  rw [node0242_0306, split_right 274 block1459 block1460 (by omega)]
  exact block1460_get i

theorem block1461_lookup (i : Fin 32) :
    lookup (306 + i.val) = some (values1461[i.val]'(by rw [values1461_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (306 + i.val) = _
  rw [node0114_0387, split_right 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0242_0387, split_right 306 node0242_0306 node0306_0387 (by omega)]
  rw [node0306_0387, split_left 338 block1461 node0338_0387 (by omega)]
  exact block1461_get i

theorem block1462_lookup (i : Fin 32) :
    lookup (338 + i.val) = some (values1462[i.val]'(by rw [values1462_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (338 + i.val) = _
  rw [node0114_0387, split_right 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0242_0387, split_right 306 node0242_0306 node0306_0387 (by omega)]
  rw [node0306_0387, split_right 338 block1461 node0338_0387 (by omega)]
  rw [node0338_0387, split_left 370 block1462 block1463 (by omega)]
  exact block1462_get i

theorem block1463_lookup (i : Fin 17) :
    lookup (370 + i.val) = some (values1463[i.val]'(by rw [values1463_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0114_0387 (370 + i.val) = _
  rw [node0114_0387, split_right 242 node0114_0242 node0242_0387 (by omega)]
  rw [node0242_0387, split_right 306 node0242_0306 node0306_0387 (by omega)]
  rw [node0306_0387, split_right 338 block1461 node0338_0387 (by omega)]
  rw [node0338_0387, split_right 370 block1462 block1463 (by omega)]
  exact block1463_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1455_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1455_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1456_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1456_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1457_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1457_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1458_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1458_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1459_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1459_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1460_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1460_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1461_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1461_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1462_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1462_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1463_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1463_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1455_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1456_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1457_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1458_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1459_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1460_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1461_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1462_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow115.block1463_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow115
