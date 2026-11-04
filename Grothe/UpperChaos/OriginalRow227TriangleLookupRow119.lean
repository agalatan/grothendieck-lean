import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1491
import Grothe.UpperChaos.OriginalRow227TriangleData1492
import Grothe.UpperChaos.OriginalRow227TriangleData1493
import Grothe.UpperChaos.OriginalRow227TriangleData1494
import Grothe.UpperChaos.OriginalRow227TriangleData1495
import Grothe.UpperChaos.OriginalRow227TriangleData1496
import Grothe.UpperChaos.OriginalRow227TriangleData1497
import Grothe.UpperChaos.OriginalRow227TriangleData1498
import Grothe.UpperChaos.OriginalRow227TriangleData1499

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow119

open ConditionalTableLookup

def values1491 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1491.coefficient119_118,
  OriginalRow227TriangleData1491.coefficient119_119,
  OriginalRow227TriangleData1491.coefficient119_120,
  OriginalRow227TriangleData1491.coefficient119_121,
  OriginalRow227TriangleData1491.coefficient119_122,
  OriginalRow227TriangleData1491.coefficient119_123,
  OriginalRow227TriangleData1491.coefficient119_124,
  OriginalRow227TriangleData1491.coefficient119_125,
  OriginalRow227TriangleData1491.coefficient119_126,
  OriginalRow227TriangleData1491.coefficient119_127,
  OriginalRow227TriangleData1491.coefficient119_128,
  OriginalRow227TriangleData1491.coefficient119_129,
  OriginalRow227TriangleData1491.coefficient119_130,
  OriginalRow227TriangleData1491.coefficient119_131,
  OriginalRow227TriangleData1491.coefficient119_132,
  OriginalRow227TriangleData1491.coefficient119_133,
  OriginalRow227TriangleData1491.coefficient119_134,
  OriginalRow227TriangleData1491.coefficient119_135,
  OriginalRow227TriangleData1491.coefficient119_136,
  OriginalRow227TriangleData1491.coefficient119_137,
  OriginalRow227TriangleData1491.coefficient119_138,
  OriginalRow227TriangleData1491.coefficient119_139,
  OriginalRow227TriangleData1491.coefficient119_140,
  OriginalRow227TriangleData1491.coefficient119_141,
  OriginalRow227TriangleData1491.coefficient119_142,
  OriginalRow227TriangleData1491.coefficient119_143,
  OriginalRow227TriangleData1491.coefficient119_144,
  OriginalRow227TriangleData1491.coefficient119_145,
  OriginalRow227TriangleData1491.coefficient119_146,
  OriginalRow227TriangleData1491.coefficient119_147,
  OriginalRow227TriangleData1491.coefficient119_148,
  OriginalRow227TriangleData1491.coefficient119_149
]

theorem values1491_size : values1491.size = 32 := rfl

def block1491 : ℕ → Option IntervalDyadic := segment 118 values1491

theorem block1491_domain : ExactDomain block1491 118 150 := by
  simpa only [values1491_size] using segment_domain 118 values1491

theorem block1491_get (i : Fin 32) :
    block1491 (118 + i.val) = some (values1491[i.val]'(by rw [values1491_size]; exact i.isLt)) := by
  exact segment_get 118 values1491 ⟨i.val, by rw [values1491_size]; exact i.isLt⟩

def values1492 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1492.coefficient119_150,
  OriginalRow227TriangleData1492.coefficient119_151,
  OriginalRow227TriangleData1492.coefficient119_152,
  OriginalRow227TriangleData1492.coefficient119_153,
  OriginalRow227TriangleData1492.coefficient119_154,
  OriginalRow227TriangleData1492.coefficient119_155,
  OriginalRow227TriangleData1492.coefficient119_156,
  OriginalRow227TriangleData1492.coefficient119_157,
  OriginalRow227TriangleData1492.coefficient119_158,
  OriginalRow227TriangleData1492.coefficient119_159,
  OriginalRow227TriangleData1492.coefficient119_160,
  OriginalRow227TriangleData1492.coefficient119_161,
  OriginalRow227TriangleData1492.coefficient119_162,
  OriginalRow227TriangleData1492.coefficient119_163,
  OriginalRow227TriangleData1492.coefficient119_164,
  OriginalRow227TriangleData1492.coefficient119_165,
  OriginalRow227TriangleData1492.coefficient119_166,
  OriginalRow227TriangleData1492.coefficient119_167,
  OriginalRow227TriangleData1492.coefficient119_168,
  OriginalRow227TriangleData1492.coefficient119_169,
  OriginalRow227TriangleData1492.coefficient119_170,
  OriginalRow227TriangleData1492.coefficient119_171,
  OriginalRow227TriangleData1492.coefficient119_172,
  OriginalRow227TriangleData1492.coefficient119_173,
  OriginalRow227TriangleData1492.coefficient119_174,
  OriginalRow227TriangleData1492.coefficient119_175,
  OriginalRow227TriangleData1492.coefficient119_176,
  OriginalRow227TriangleData1492.coefficient119_177,
  OriginalRow227TriangleData1492.coefficient119_178,
  OriginalRow227TriangleData1492.coefficient119_179,
  OriginalRow227TriangleData1492.coefficient119_180,
  OriginalRow227TriangleData1492.coefficient119_181
]

theorem values1492_size : values1492.size = 32 := rfl

def block1492 : ℕ → Option IntervalDyadic := segment 150 values1492

theorem block1492_domain : ExactDomain block1492 150 182 := by
  simpa only [values1492_size] using segment_domain 150 values1492

theorem block1492_get (i : Fin 32) :
    block1492 (150 + i.val) = some (values1492[i.val]'(by rw [values1492_size]; exact i.isLt)) := by
  exact segment_get 150 values1492 ⟨i.val, by rw [values1492_size]; exact i.isLt⟩

def values1493 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1493.coefficient119_182,
  OriginalRow227TriangleData1493.coefficient119_183,
  OriginalRow227TriangleData1493.coefficient119_184,
  OriginalRow227TriangleData1493.coefficient119_185,
  OriginalRow227TriangleData1493.coefficient119_186,
  OriginalRow227TriangleData1493.coefficient119_187,
  OriginalRow227TriangleData1493.coefficient119_188,
  OriginalRow227TriangleData1493.coefficient119_189,
  OriginalRow227TriangleData1493.coefficient119_190,
  OriginalRow227TriangleData1493.coefficient119_191,
  OriginalRow227TriangleData1493.coefficient119_192,
  OriginalRow227TriangleData1493.coefficient119_193,
  OriginalRow227TriangleData1493.coefficient119_194,
  OriginalRow227TriangleData1493.coefficient119_195,
  OriginalRow227TriangleData1493.coefficient119_196,
  OriginalRow227TriangleData1493.coefficient119_197,
  OriginalRow227TriangleData1493.coefficient119_198,
  OriginalRow227TriangleData1493.coefficient119_199,
  OriginalRow227TriangleData1493.coefficient119_200,
  OriginalRow227TriangleData1493.coefficient119_201,
  OriginalRow227TriangleData1493.coefficient119_202,
  OriginalRow227TriangleData1493.coefficient119_203,
  OriginalRow227TriangleData1493.coefficient119_204,
  OriginalRow227TriangleData1493.coefficient119_205,
  OriginalRow227TriangleData1493.coefficient119_206,
  OriginalRow227TriangleData1493.coefficient119_207,
  OriginalRow227TriangleData1493.coefficient119_208,
  OriginalRow227TriangleData1493.coefficient119_209,
  OriginalRow227TriangleData1493.coefficient119_210,
  OriginalRow227TriangleData1493.coefficient119_211,
  OriginalRow227TriangleData1493.coefficient119_212,
  OriginalRow227TriangleData1493.coefficient119_213
]

theorem values1493_size : values1493.size = 32 := rfl

def block1493 : ℕ → Option IntervalDyadic := segment 182 values1493

theorem block1493_domain : ExactDomain block1493 182 214 := by
  simpa only [values1493_size] using segment_domain 182 values1493

theorem block1493_get (i : Fin 32) :
    block1493 (182 + i.val) = some (values1493[i.val]'(by rw [values1493_size]; exact i.isLt)) := by
  exact segment_get 182 values1493 ⟨i.val, by rw [values1493_size]; exact i.isLt⟩

def values1494 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1494.coefficient119_214,
  OriginalRow227TriangleData1494.coefficient119_215,
  OriginalRow227TriangleData1494.coefficient119_216,
  OriginalRow227TriangleData1494.coefficient119_217,
  OriginalRow227TriangleData1494.coefficient119_218,
  OriginalRow227TriangleData1494.coefficient119_219,
  OriginalRow227TriangleData1494.coefficient119_220,
  OriginalRow227TriangleData1494.coefficient119_221,
  OriginalRow227TriangleData1494.coefficient119_222,
  OriginalRow227TriangleData1494.coefficient119_223,
  OriginalRow227TriangleData1494.coefficient119_224,
  OriginalRow227TriangleData1494.coefficient119_225,
  OriginalRow227TriangleData1494.coefficient119_226,
  OriginalRow227TriangleData1494.coefficient119_227,
  OriginalRow227TriangleData1494.coefficient119_228,
  OriginalRow227TriangleData1494.coefficient119_229,
  OriginalRow227TriangleData1494.coefficient119_230,
  OriginalRow227TriangleData1494.coefficient119_231,
  OriginalRow227TriangleData1494.coefficient119_232,
  OriginalRow227TriangleData1494.coefficient119_233,
  OriginalRow227TriangleData1494.coefficient119_234,
  OriginalRow227TriangleData1494.coefficient119_235,
  OriginalRow227TriangleData1494.coefficient119_236,
  OriginalRow227TriangleData1494.coefficient119_237,
  OriginalRow227TriangleData1494.coefficient119_238,
  OriginalRow227TriangleData1494.coefficient119_239,
  OriginalRow227TriangleData1494.coefficient119_240,
  OriginalRow227TriangleData1494.coefficient119_241,
  OriginalRow227TriangleData1494.coefficient119_242,
  OriginalRow227TriangleData1494.coefficient119_243,
  OriginalRow227TriangleData1494.coefficient119_244,
  OriginalRow227TriangleData1494.coefficient119_245
]

theorem values1494_size : values1494.size = 32 := rfl

def block1494 : ℕ → Option IntervalDyadic := segment 214 values1494

theorem block1494_domain : ExactDomain block1494 214 246 := by
  simpa only [values1494_size] using segment_domain 214 values1494

theorem block1494_get (i : Fin 32) :
    block1494 (214 + i.val) = some (values1494[i.val]'(by rw [values1494_size]; exact i.isLt)) := by
  exact segment_get 214 values1494 ⟨i.val, by rw [values1494_size]; exact i.isLt⟩

def values1495 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1495.coefficient119_246,
  OriginalRow227TriangleData1495.coefficient119_247,
  OriginalRow227TriangleData1495.coefficient119_248,
  OriginalRow227TriangleData1495.coefficient119_249,
  OriginalRow227TriangleData1495.coefficient119_250,
  OriginalRow227TriangleData1495.coefficient119_251,
  OriginalRow227TriangleData1495.coefficient119_252,
  OriginalRow227TriangleData1495.coefficient119_253,
  OriginalRow227TriangleData1495.coefficient119_254,
  OriginalRow227TriangleData1495.coefficient119_255,
  OriginalRow227TriangleData1495.coefficient119_256,
  OriginalRow227TriangleData1495.coefficient119_257,
  OriginalRow227TriangleData1495.coefficient119_258,
  OriginalRow227TriangleData1495.coefficient119_259,
  OriginalRow227TriangleData1495.coefficient119_260,
  OriginalRow227TriangleData1495.coefficient119_261,
  OriginalRow227TriangleData1495.coefficient119_262,
  OriginalRow227TriangleData1495.coefficient119_263,
  OriginalRow227TriangleData1495.coefficient119_264,
  OriginalRow227TriangleData1495.coefficient119_265,
  OriginalRow227TriangleData1495.coefficient119_266,
  OriginalRow227TriangleData1495.coefficient119_267,
  OriginalRow227TriangleData1495.coefficient119_268,
  OriginalRow227TriangleData1495.coefficient119_269,
  OriginalRow227TriangleData1495.coefficient119_270,
  OriginalRow227TriangleData1495.coefficient119_271,
  OriginalRow227TriangleData1495.coefficient119_272,
  OriginalRow227TriangleData1495.coefficient119_273,
  OriginalRow227TriangleData1495.coefficient119_274,
  OriginalRow227TriangleData1495.coefficient119_275,
  OriginalRow227TriangleData1495.coefficient119_276,
  OriginalRow227TriangleData1495.coefficient119_277
]

theorem values1495_size : values1495.size = 32 := rfl

def block1495 : ℕ → Option IntervalDyadic := segment 246 values1495

theorem block1495_domain : ExactDomain block1495 246 278 := by
  simpa only [values1495_size] using segment_domain 246 values1495

theorem block1495_get (i : Fin 32) :
    block1495 (246 + i.val) = some (values1495[i.val]'(by rw [values1495_size]; exact i.isLt)) := by
  exact segment_get 246 values1495 ⟨i.val, by rw [values1495_size]; exact i.isLt⟩

def values1496 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1496.coefficient119_278,
  OriginalRow227TriangleData1496.coefficient119_279,
  OriginalRow227TriangleData1496.coefficient119_280,
  OriginalRow227TriangleData1496.coefficient119_281,
  OriginalRow227TriangleData1496.coefficient119_282,
  OriginalRow227TriangleData1496.coefficient119_283,
  OriginalRow227TriangleData1496.coefficient119_284,
  OriginalRow227TriangleData1496.coefficient119_285,
  OriginalRow227TriangleData1496.coefficient119_286,
  OriginalRow227TriangleData1496.coefficient119_287,
  OriginalRow227TriangleData1496.coefficient119_288,
  OriginalRow227TriangleData1496.coefficient119_289,
  OriginalRow227TriangleData1496.coefficient119_290,
  OriginalRow227TriangleData1496.coefficient119_291,
  OriginalRow227TriangleData1496.coefficient119_292,
  OriginalRow227TriangleData1496.coefficient119_293,
  OriginalRow227TriangleData1496.coefficient119_294,
  OriginalRow227TriangleData1496.coefficient119_295,
  OriginalRow227TriangleData1496.coefficient119_296,
  OriginalRow227TriangleData1496.coefficient119_297,
  OriginalRow227TriangleData1496.coefficient119_298,
  OriginalRow227TriangleData1496.coefficient119_299,
  OriginalRow227TriangleData1496.coefficient119_300,
  OriginalRow227TriangleData1496.coefficient119_301,
  OriginalRow227TriangleData1496.coefficient119_302,
  OriginalRow227TriangleData1496.coefficient119_303,
  OriginalRow227TriangleData1496.coefficient119_304,
  OriginalRow227TriangleData1496.coefficient119_305,
  OriginalRow227TriangleData1496.coefficient119_306,
  OriginalRow227TriangleData1496.coefficient119_307,
  OriginalRow227TriangleData1496.coefficient119_308,
  OriginalRow227TriangleData1496.coefficient119_309
]

theorem values1496_size : values1496.size = 32 := rfl

def block1496 : ℕ → Option IntervalDyadic := segment 278 values1496

theorem block1496_domain : ExactDomain block1496 278 310 := by
  simpa only [values1496_size] using segment_domain 278 values1496

theorem block1496_get (i : Fin 32) :
    block1496 (278 + i.val) = some (values1496[i.val]'(by rw [values1496_size]; exact i.isLt)) := by
  exact segment_get 278 values1496 ⟨i.val, by rw [values1496_size]; exact i.isLt⟩

def values1497 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1497.coefficient119_310,
  OriginalRow227TriangleData1497.coefficient119_311,
  OriginalRow227TriangleData1497.coefficient119_312,
  OriginalRow227TriangleData1497.coefficient119_313,
  OriginalRow227TriangleData1497.coefficient119_314,
  OriginalRow227TriangleData1497.coefficient119_315,
  OriginalRow227TriangleData1497.coefficient119_316,
  OriginalRow227TriangleData1497.coefficient119_317,
  OriginalRow227TriangleData1497.coefficient119_318,
  OriginalRow227TriangleData1497.coefficient119_319,
  OriginalRow227TriangleData1497.coefficient119_320,
  OriginalRow227TriangleData1497.coefficient119_321,
  OriginalRow227TriangleData1497.coefficient119_322,
  OriginalRow227TriangleData1497.coefficient119_323,
  OriginalRow227TriangleData1497.coefficient119_324,
  OriginalRow227TriangleData1497.coefficient119_325,
  OriginalRow227TriangleData1497.coefficient119_326,
  OriginalRow227TriangleData1497.coefficient119_327,
  OriginalRow227TriangleData1497.coefficient119_328,
  OriginalRow227TriangleData1497.coefficient119_329,
  OriginalRow227TriangleData1497.coefficient119_330,
  OriginalRow227TriangleData1497.coefficient119_331,
  OriginalRow227TriangleData1497.coefficient119_332,
  OriginalRow227TriangleData1497.coefficient119_333,
  OriginalRow227TriangleData1497.coefficient119_334,
  OriginalRow227TriangleData1497.coefficient119_335,
  OriginalRow227TriangleData1497.coefficient119_336,
  OriginalRow227TriangleData1497.coefficient119_337,
  OriginalRow227TriangleData1497.coefficient119_338,
  OriginalRow227TriangleData1497.coefficient119_339,
  OriginalRow227TriangleData1497.coefficient119_340,
  OriginalRow227TriangleData1497.coefficient119_341
]

theorem values1497_size : values1497.size = 32 := rfl

def block1497 : ℕ → Option IntervalDyadic := segment 310 values1497

theorem block1497_domain : ExactDomain block1497 310 342 := by
  simpa only [values1497_size] using segment_domain 310 values1497

theorem block1497_get (i : Fin 32) :
    block1497 (310 + i.val) = some (values1497[i.val]'(by rw [values1497_size]; exact i.isLt)) := by
  exact segment_get 310 values1497 ⟨i.val, by rw [values1497_size]; exact i.isLt⟩

def values1498 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1498.coefficient119_342,
  OriginalRow227TriangleData1498.coefficient119_343,
  OriginalRow227TriangleData1498.coefficient119_344,
  OriginalRow227TriangleData1498.coefficient119_345,
  OriginalRow227TriangleData1498.coefficient119_346,
  OriginalRow227TriangleData1498.coefficient119_347,
  OriginalRow227TriangleData1498.coefficient119_348,
  OriginalRow227TriangleData1498.coefficient119_349,
  OriginalRow227TriangleData1498.coefficient119_350,
  OriginalRow227TriangleData1498.coefficient119_351,
  OriginalRow227TriangleData1498.coefficient119_352,
  OriginalRow227TriangleData1498.coefficient119_353,
  OriginalRow227TriangleData1498.coefficient119_354,
  OriginalRow227TriangleData1498.coefficient119_355,
  OriginalRow227TriangleData1498.coefficient119_356,
  OriginalRow227TriangleData1498.coefficient119_357,
  OriginalRow227TriangleData1498.coefficient119_358,
  OriginalRow227TriangleData1498.coefficient119_359,
  OriginalRow227TriangleData1498.coefficient119_360,
  OriginalRow227TriangleData1498.coefficient119_361,
  OriginalRow227TriangleData1498.coefficient119_362,
  OriginalRow227TriangleData1498.coefficient119_363,
  OriginalRow227TriangleData1498.coefficient119_364,
  OriginalRow227TriangleData1498.coefficient119_365,
  OriginalRow227TriangleData1498.coefficient119_366,
  OriginalRow227TriangleData1498.coefficient119_367,
  OriginalRow227TriangleData1498.coefficient119_368,
  OriginalRow227TriangleData1498.coefficient119_369,
  OriginalRow227TriangleData1498.coefficient119_370,
  OriginalRow227TriangleData1498.coefficient119_371,
  OriginalRow227TriangleData1498.coefficient119_372,
  OriginalRow227TriangleData1498.coefficient119_373
]

theorem values1498_size : values1498.size = 32 := rfl

def block1498 : ℕ → Option IntervalDyadic := segment 342 values1498

theorem block1498_domain : ExactDomain block1498 342 374 := by
  simpa only [values1498_size] using segment_domain 342 values1498

theorem block1498_get (i : Fin 32) :
    block1498 (342 + i.val) = some (values1498[i.val]'(by rw [values1498_size]; exact i.isLt)) := by
  exact segment_get 342 values1498 ⟨i.val, by rw [values1498_size]; exact i.isLt⟩

def values1499 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1499.coefficient119_374,
  OriginalRow227TriangleData1499.coefficient119_375,
  OriginalRow227TriangleData1499.coefficient119_376,
  OriginalRow227TriangleData1499.coefficient119_377,
  OriginalRow227TriangleData1499.coefficient119_378,
  OriginalRow227TriangleData1499.coefficient119_379,
  OriginalRow227TriangleData1499.coefficient119_380,
  OriginalRow227TriangleData1499.coefficient119_381,
  OriginalRow227TriangleData1499.coefficient119_382
]

theorem values1499_size : values1499.size = 9 := rfl

def block1499 : ℕ → Option IntervalDyadic := segment 374 values1499

theorem block1499_domain : ExactDomain block1499 374 383 := by
  simpa only [values1499_size] using segment_domain 374 values1499

theorem block1499_get (i : Fin 9) :
    block1499 (374 + i.val) = some (values1499[i.val]'(by rw [values1499_size]; exact i.isLt)) := by
  exact segment_get 374 values1499 ⟨i.val, by rw [values1499_size]; exact i.isLt⟩

def node0118_0182 : ℕ → Option IntervalDyadic := split 150 block1491 block1492

theorem node0118_0182_domain : ExactDomain node0118_0182 118 182 := by
  exact split_domain (by decide) (by decide) block1491_domain block1492_domain

def node0182_0246 : ℕ → Option IntervalDyadic := split 214 block1493 block1494

theorem node0182_0246_domain : ExactDomain node0182_0246 182 246 := by
  exact split_domain (by decide) (by decide) block1493_domain block1494_domain

def node0118_0246 : ℕ → Option IntervalDyadic := split 182 node0118_0182 node0182_0246

theorem node0118_0246_domain : ExactDomain node0118_0246 118 246 := by
  exact split_domain (by decide) (by decide) node0118_0182_domain node0182_0246_domain

def node0246_0310 : ℕ → Option IntervalDyadic := split 278 block1495 block1496

theorem node0246_0310_domain : ExactDomain node0246_0310 246 310 := by
  exact split_domain (by decide) (by decide) block1495_domain block1496_domain

def node0342_0383 : ℕ → Option IntervalDyadic := split 374 block1498 block1499

theorem node0342_0383_domain : ExactDomain node0342_0383 342 383 := by
  exact split_domain (by decide) (by decide) block1498_domain block1499_domain

def node0310_0383 : ℕ → Option IntervalDyadic := split 342 block1497 node0342_0383

theorem node0310_0383_domain : ExactDomain node0310_0383 310 383 := by
  exact split_domain (by decide) (by decide) block1497_domain node0342_0383_domain

def node0246_0383 : ℕ → Option IntervalDyadic := split 310 node0246_0310 node0310_0383

theorem node0246_0383_domain : ExactDomain node0246_0383 246 383 := by
  exact split_domain (by decide) (by decide) node0246_0310_domain node0310_0383_domain

def node0118_0383 : ℕ → Option IntervalDyadic := split 246 node0118_0246 node0246_0383

theorem node0118_0383_domain : ExactDomain node0118_0383 118 383 := by
  exact split_domain (by decide) (by decide) node0118_0246_domain node0246_0383_domain

def lookup : ℕ → Option IntervalDyadic := node0118_0383

theorem lookup_domain : ExactDomain lookup 118 383 :=
  node0118_0383_domain

theorem block1491_lookup (i : Fin 32) :
    lookup (118 + i.val) = some (values1491[i.val]'(by rw [values1491_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (118 + i.val) = _
  rw [node0118_0383, split_left 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0118_0246, split_left 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0118_0182, split_left 150 block1491 block1492 (by omega)]
  exact block1491_get i

theorem block1492_lookup (i : Fin 32) :
    lookup (150 + i.val) = some (values1492[i.val]'(by rw [values1492_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (150 + i.val) = _
  rw [node0118_0383, split_left 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0118_0246, split_left 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0118_0182, split_right 150 block1491 block1492 (by omega)]
  exact block1492_get i

theorem block1493_lookup (i : Fin 32) :
    lookup (182 + i.val) = some (values1493[i.val]'(by rw [values1493_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (182 + i.val) = _
  rw [node0118_0383, split_left 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0118_0246, split_right 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0182_0246, split_left 214 block1493 block1494 (by omega)]
  exact block1493_get i

theorem block1494_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values1494[i.val]'(by rw [values1494_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (214 + i.val) = _
  rw [node0118_0383, split_left 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0118_0246, split_right 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0182_0246, split_right 214 block1493 block1494 (by omega)]
  exact block1494_get i

theorem block1495_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values1495[i.val]'(by rw [values1495_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (246 + i.val) = _
  rw [node0118_0383, split_right 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0246_0383, split_left 310 node0246_0310 node0310_0383 (by omega)]
  rw [node0246_0310, split_left 278 block1495 block1496 (by omega)]
  exact block1495_get i

theorem block1496_lookup (i : Fin 32) :
    lookup (278 + i.val) = some (values1496[i.val]'(by rw [values1496_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (278 + i.val) = _
  rw [node0118_0383, split_right 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0246_0383, split_left 310 node0246_0310 node0310_0383 (by omega)]
  rw [node0246_0310, split_right 278 block1495 block1496 (by omega)]
  exact block1496_get i

theorem block1497_lookup (i : Fin 32) :
    lookup (310 + i.val) = some (values1497[i.val]'(by rw [values1497_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (310 + i.val) = _
  rw [node0118_0383, split_right 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0246_0383, split_right 310 node0246_0310 node0310_0383 (by omega)]
  rw [node0310_0383, split_left 342 block1497 node0342_0383 (by omega)]
  exact block1497_get i

theorem block1498_lookup (i : Fin 32) :
    lookup (342 + i.val) = some (values1498[i.val]'(by rw [values1498_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (342 + i.val) = _
  rw [node0118_0383, split_right 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0246_0383, split_right 310 node0246_0310 node0310_0383 (by omega)]
  rw [node0310_0383, split_right 342 block1497 node0342_0383 (by omega)]
  rw [node0342_0383, split_left 374 block1498 block1499 (by omega)]
  exact block1498_get i

theorem block1499_lookup (i : Fin 9) :
    lookup (374 + i.val) = some (values1499[i.val]'(by rw [values1499_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0118_0383 (374 + i.val) = _
  rw [node0118_0383, split_right 246 node0118_0246 node0246_0383 (by omega)]
  rw [node0246_0383, split_right 310 node0246_0310 node0310_0383 (by omega)]
  rw [node0310_0383, split_right 342 block1497 node0342_0383 (by omega)]
  rw [node0342_0383, split_right 374 block1498 block1499 (by omega)]
  exact block1499_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1491_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1491_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1492_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1492_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1493_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1493_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1494_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1494_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1495_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1495_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1496_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1496_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1497_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1497_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1498_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1498_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1499_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1499_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1491_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1492_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1493_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1494_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1495_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1496_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1497_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1498_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow119.block1499_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow119
