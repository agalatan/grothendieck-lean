import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1437
import Grothe.UpperChaos.OriginalRow227TriangleData1438
import Grothe.UpperChaos.OriginalRow227TriangleData1439
import Grothe.UpperChaos.OriginalRow227TriangleData1440
import Grothe.UpperChaos.OriginalRow227TriangleData1441
import Grothe.UpperChaos.OriginalRow227TriangleData1442
import Grothe.UpperChaos.OriginalRow227TriangleData1443
import Grothe.UpperChaos.OriginalRow227TriangleData1444
import Grothe.UpperChaos.OriginalRow227TriangleData1445

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow113

open ConditionalTableLookup

def values1437 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1437.coefficient113_112,
  OriginalRow227TriangleData1437.coefficient113_113,
  OriginalRow227TriangleData1437.coefficient113_114,
  OriginalRow227TriangleData1437.coefficient113_115,
  OriginalRow227TriangleData1437.coefficient113_116,
  OriginalRow227TriangleData1437.coefficient113_117,
  OriginalRow227TriangleData1437.coefficient113_118,
  OriginalRow227TriangleData1437.coefficient113_119,
  OriginalRow227TriangleData1437.coefficient113_120,
  OriginalRow227TriangleData1437.coefficient113_121,
  OriginalRow227TriangleData1437.coefficient113_122,
  OriginalRow227TriangleData1437.coefficient113_123,
  OriginalRow227TriangleData1437.coefficient113_124,
  OriginalRow227TriangleData1437.coefficient113_125,
  OriginalRow227TriangleData1437.coefficient113_126,
  OriginalRow227TriangleData1437.coefficient113_127,
  OriginalRow227TriangleData1437.coefficient113_128,
  OriginalRow227TriangleData1437.coefficient113_129,
  OriginalRow227TriangleData1437.coefficient113_130,
  OriginalRow227TriangleData1437.coefficient113_131,
  OriginalRow227TriangleData1437.coefficient113_132,
  OriginalRow227TriangleData1437.coefficient113_133,
  OriginalRow227TriangleData1437.coefficient113_134,
  OriginalRow227TriangleData1437.coefficient113_135,
  OriginalRow227TriangleData1437.coefficient113_136,
  OriginalRow227TriangleData1437.coefficient113_137,
  OriginalRow227TriangleData1437.coefficient113_138,
  OriginalRow227TriangleData1437.coefficient113_139,
  OriginalRow227TriangleData1437.coefficient113_140,
  OriginalRow227TriangleData1437.coefficient113_141,
  OriginalRow227TriangleData1437.coefficient113_142,
  OriginalRow227TriangleData1437.coefficient113_143
]

theorem values1437_size : values1437.size = 32 := rfl

def block1437 : ℕ → Option IntervalDyadic := segment 112 values1437

theorem block1437_domain : ExactDomain block1437 112 144 := by
  simpa only [values1437_size] using segment_domain 112 values1437

theorem block1437_get (i : Fin 32) :
    block1437 (112 + i.val) = some (values1437[i.val]'(by rw [values1437_size]; exact i.isLt)) := by
  exact segment_get 112 values1437 ⟨i.val, by rw [values1437_size]; exact i.isLt⟩

def values1438 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1438.coefficient113_144,
  OriginalRow227TriangleData1438.coefficient113_145,
  OriginalRow227TriangleData1438.coefficient113_146,
  OriginalRow227TriangleData1438.coefficient113_147,
  OriginalRow227TriangleData1438.coefficient113_148,
  OriginalRow227TriangleData1438.coefficient113_149,
  OriginalRow227TriangleData1438.coefficient113_150,
  OriginalRow227TriangleData1438.coefficient113_151,
  OriginalRow227TriangleData1438.coefficient113_152,
  OriginalRow227TriangleData1438.coefficient113_153,
  OriginalRow227TriangleData1438.coefficient113_154,
  OriginalRow227TriangleData1438.coefficient113_155,
  OriginalRow227TriangleData1438.coefficient113_156,
  OriginalRow227TriangleData1438.coefficient113_157,
  OriginalRow227TriangleData1438.coefficient113_158,
  OriginalRow227TriangleData1438.coefficient113_159,
  OriginalRow227TriangleData1438.coefficient113_160,
  OriginalRow227TriangleData1438.coefficient113_161,
  OriginalRow227TriangleData1438.coefficient113_162,
  OriginalRow227TriangleData1438.coefficient113_163,
  OriginalRow227TriangleData1438.coefficient113_164,
  OriginalRow227TriangleData1438.coefficient113_165,
  OriginalRow227TriangleData1438.coefficient113_166,
  OriginalRow227TriangleData1438.coefficient113_167,
  OriginalRow227TriangleData1438.coefficient113_168,
  OriginalRow227TriangleData1438.coefficient113_169,
  OriginalRow227TriangleData1438.coefficient113_170,
  OriginalRow227TriangleData1438.coefficient113_171,
  OriginalRow227TriangleData1438.coefficient113_172,
  OriginalRow227TriangleData1438.coefficient113_173,
  OriginalRow227TriangleData1438.coefficient113_174,
  OriginalRow227TriangleData1438.coefficient113_175
]

theorem values1438_size : values1438.size = 32 := rfl

def block1438 : ℕ → Option IntervalDyadic := segment 144 values1438

theorem block1438_domain : ExactDomain block1438 144 176 := by
  simpa only [values1438_size] using segment_domain 144 values1438

theorem block1438_get (i : Fin 32) :
    block1438 (144 + i.val) = some (values1438[i.val]'(by rw [values1438_size]; exact i.isLt)) := by
  exact segment_get 144 values1438 ⟨i.val, by rw [values1438_size]; exact i.isLt⟩

def values1439 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1439.coefficient113_176,
  OriginalRow227TriangleData1439.coefficient113_177,
  OriginalRow227TriangleData1439.coefficient113_178,
  OriginalRow227TriangleData1439.coefficient113_179,
  OriginalRow227TriangleData1439.coefficient113_180,
  OriginalRow227TriangleData1439.coefficient113_181,
  OriginalRow227TriangleData1439.coefficient113_182,
  OriginalRow227TriangleData1439.coefficient113_183,
  OriginalRow227TriangleData1439.coefficient113_184,
  OriginalRow227TriangleData1439.coefficient113_185,
  OriginalRow227TriangleData1439.coefficient113_186,
  OriginalRow227TriangleData1439.coefficient113_187,
  OriginalRow227TriangleData1439.coefficient113_188,
  OriginalRow227TriangleData1439.coefficient113_189,
  OriginalRow227TriangleData1439.coefficient113_190,
  OriginalRow227TriangleData1439.coefficient113_191,
  OriginalRow227TriangleData1439.coefficient113_192,
  OriginalRow227TriangleData1439.coefficient113_193,
  OriginalRow227TriangleData1439.coefficient113_194,
  OriginalRow227TriangleData1439.coefficient113_195,
  OriginalRow227TriangleData1439.coefficient113_196,
  OriginalRow227TriangleData1439.coefficient113_197,
  OriginalRow227TriangleData1439.coefficient113_198,
  OriginalRow227TriangleData1439.coefficient113_199,
  OriginalRow227TriangleData1439.coefficient113_200,
  OriginalRow227TriangleData1439.coefficient113_201,
  OriginalRow227TriangleData1439.coefficient113_202,
  OriginalRow227TriangleData1439.coefficient113_203,
  OriginalRow227TriangleData1439.coefficient113_204,
  OriginalRow227TriangleData1439.coefficient113_205,
  OriginalRow227TriangleData1439.coefficient113_206,
  OriginalRow227TriangleData1439.coefficient113_207
]

theorem values1439_size : values1439.size = 32 := rfl

def block1439 : ℕ → Option IntervalDyadic := segment 176 values1439

theorem block1439_domain : ExactDomain block1439 176 208 := by
  simpa only [values1439_size] using segment_domain 176 values1439

theorem block1439_get (i : Fin 32) :
    block1439 (176 + i.val) = some (values1439[i.val]'(by rw [values1439_size]; exact i.isLt)) := by
  exact segment_get 176 values1439 ⟨i.val, by rw [values1439_size]; exact i.isLt⟩

def values1440 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1440.coefficient113_208,
  OriginalRow227TriangleData1440.coefficient113_209,
  OriginalRow227TriangleData1440.coefficient113_210,
  OriginalRow227TriangleData1440.coefficient113_211,
  OriginalRow227TriangleData1440.coefficient113_212,
  OriginalRow227TriangleData1440.coefficient113_213,
  OriginalRow227TriangleData1440.coefficient113_214,
  OriginalRow227TriangleData1440.coefficient113_215,
  OriginalRow227TriangleData1440.coefficient113_216,
  OriginalRow227TriangleData1440.coefficient113_217,
  OriginalRow227TriangleData1440.coefficient113_218,
  OriginalRow227TriangleData1440.coefficient113_219,
  OriginalRow227TriangleData1440.coefficient113_220,
  OriginalRow227TriangleData1440.coefficient113_221,
  OriginalRow227TriangleData1440.coefficient113_222,
  OriginalRow227TriangleData1440.coefficient113_223,
  OriginalRow227TriangleData1440.coefficient113_224,
  OriginalRow227TriangleData1440.coefficient113_225,
  OriginalRow227TriangleData1440.coefficient113_226,
  OriginalRow227TriangleData1440.coefficient113_227,
  OriginalRow227TriangleData1440.coefficient113_228,
  OriginalRow227TriangleData1440.coefficient113_229,
  OriginalRow227TriangleData1440.coefficient113_230,
  OriginalRow227TriangleData1440.coefficient113_231,
  OriginalRow227TriangleData1440.coefficient113_232,
  OriginalRow227TriangleData1440.coefficient113_233,
  OriginalRow227TriangleData1440.coefficient113_234,
  OriginalRow227TriangleData1440.coefficient113_235,
  OriginalRow227TriangleData1440.coefficient113_236,
  OriginalRow227TriangleData1440.coefficient113_237,
  OriginalRow227TriangleData1440.coefficient113_238,
  OriginalRow227TriangleData1440.coefficient113_239
]

theorem values1440_size : values1440.size = 32 := rfl

def block1440 : ℕ → Option IntervalDyadic := segment 208 values1440

theorem block1440_domain : ExactDomain block1440 208 240 := by
  simpa only [values1440_size] using segment_domain 208 values1440

theorem block1440_get (i : Fin 32) :
    block1440 (208 + i.val) = some (values1440[i.val]'(by rw [values1440_size]; exact i.isLt)) := by
  exact segment_get 208 values1440 ⟨i.val, by rw [values1440_size]; exact i.isLt⟩

def values1441 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1441.coefficient113_240,
  OriginalRow227TriangleData1441.coefficient113_241,
  OriginalRow227TriangleData1441.coefficient113_242,
  OriginalRow227TriangleData1441.coefficient113_243,
  OriginalRow227TriangleData1441.coefficient113_244,
  OriginalRow227TriangleData1441.coefficient113_245,
  OriginalRow227TriangleData1441.coefficient113_246,
  OriginalRow227TriangleData1441.coefficient113_247,
  OriginalRow227TriangleData1441.coefficient113_248,
  OriginalRow227TriangleData1441.coefficient113_249,
  OriginalRow227TriangleData1441.coefficient113_250,
  OriginalRow227TriangleData1441.coefficient113_251,
  OriginalRow227TriangleData1441.coefficient113_252,
  OriginalRow227TriangleData1441.coefficient113_253,
  OriginalRow227TriangleData1441.coefficient113_254,
  OriginalRow227TriangleData1441.coefficient113_255,
  OriginalRow227TriangleData1441.coefficient113_256,
  OriginalRow227TriangleData1441.coefficient113_257,
  OriginalRow227TriangleData1441.coefficient113_258,
  OriginalRow227TriangleData1441.coefficient113_259,
  OriginalRow227TriangleData1441.coefficient113_260,
  OriginalRow227TriangleData1441.coefficient113_261,
  OriginalRow227TriangleData1441.coefficient113_262,
  OriginalRow227TriangleData1441.coefficient113_263,
  OriginalRow227TriangleData1441.coefficient113_264,
  OriginalRow227TriangleData1441.coefficient113_265,
  OriginalRow227TriangleData1441.coefficient113_266,
  OriginalRow227TriangleData1441.coefficient113_267,
  OriginalRow227TriangleData1441.coefficient113_268,
  OriginalRow227TriangleData1441.coefficient113_269,
  OriginalRow227TriangleData1441.coefficient113_270,
  OriginalRow227TriangleData1441.coefficient113_271
]

theorem values1441_size : values1441.size = 32 := rfl

def block1441 : ℕ → Option IntervalDyadic := segment 240 values1441

theorem block1441_domain : ExactDomain block1441 240 272 := by
  simpa only [values1441_size] using segment_domain 240 values1441

theorem block1441_get (i : Fin 32) :
    block1441 (240 + i.val) = some (values1441[i.val]'(by rw [values1441_size]; exact i.isLt)) := by
  exact segment_get 240 values1441 ⟨i.val, by rw [values1441_size]; exact i.isLt⟩

def values1442 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1442.coefficient113_272,
  OriginalRow227TriangleData1442.coefficient113_273,
  OriginalRow227TriangleData1442.coefficient113_274,
  OriginalRow227TriangleData1442.coefficient113_275,
  OriginalRow227TriangleData1442.coefficient113_276,
  OriginalRow227TriangleData1442.coefficient113_277,
  OriginalRow227TriangleData1442.coefficient113_278,
  OriginalRow227TriangleData1442.coefficient113_279,
  OriginalRow227TriangleData1442.coefficient113_280,
  OriginalRow227TriangleData1442.coefficient113_281,
  OriginalRow227TriangleData1442.coefficient113_282,
  OriginalRow227TriangleData1442.coefficient113_283,
  OriginalRow227TriangleData1442.coefficient113_284,
  OriginalRow227TriangleData1442.coefficient113_285,
  OriginalRow227TriangleData1442.coefficient113_286,
  OriginalRow227TriangleData1442.coefficient113_287,
  OriginalRow227TriangleData1442.coefficient113_288,
  OriginalRow227TriangleData1442.coefficient113_289,
  OriginalRow227TriangleData1442.coefficient113_290,
  OriginalRow227TriangleData1442.coefficient113_291,
  OriginalRow227TriangleData1442.coefficient113_292,
  OriginalRow227TriangleData1442.coefficient113_293,
  OriginalRow227TriangleData1442.coefficient113_294,
  OriginalRow227TriangleData1442.coefficient113_295,
  OriginalRow227TriangleData1442.coefficient113_296,
  OriginalRow227TriangleData1442.coefficient113_297,
  OriginalRow227TriangleData1442.coefficient113_298,
  OriginalRow227TriangleData1442.coefficient113_299,
  OriginalRow227TriangleData1442.coefficient113_300,
  OriginalRow227TriangleData1442.coefficient113_301,
  OriginalRow227TriangleData1442.coefficient113_302,
  OriginalRow227TriangleData1442.coefficient113_303
]

theorem values1442_size : values1442.size = 32 := rfl

def block1442 : ℕ → Option IntervalDyadic := segment 272 values1442

theorem block1442_domain : ExactDomain block1442 272 304 := by
  simpa only [values1442_size] using segment_domain 272 values1442

theorem block1442_get (i : Fin 32) :
    block1442 (272 + i.val) = some (values1442[i.val]'(by rw [values1442_size]; exact i.isLt)) := by
  exact segment_get 272 values1442 ⟨i.val, by rw [values1442_size]; exact i.isLt⟩

def values1443 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1443.coefficient113_304,
  OriginalRow227TriangleData1443.coefficient113_305,
  OriginalRow227TriangleData1443.coefficient113_306,
  OriginalRow227TriangleData1443.coefficient113_307,
  OriginalRow227TriangleData1443.coefficient113_308,
  OriginalRow227TriangleData1443.coefficient113_309,
  OriginalRow227TriangleData1443.coefficient113_310,
  OriginalRow227TriangleData1443.coefficient113_311,
  OriginalRow227TriangleData1443.coefficient113_312,
  OriginalRow227TriangleData1443.coefficient113_313,
  OriginalRow227TriangleData1443.coefficient113_314,
  OriginalRow227TriangleData1443.coefficient113_315,
  OriginalRow227TriangleData1443.coefficient113_316,
  OriginalRow227TriangleData1443.coefficient113_317,
  OriginalRow227TriangleData1443.coefficient113_318,
  OriginalRow227TriangleData1443.coefficient113_319,
  OriginalRow227TriangleData1443.coefficient113_320,
  OriginalRow227TriangleData1443.coefficient113_321,
  OriginalRow227TriangleData1443.coefficient113_322,
  OriginalRow227TriangleData1443.coefficient113_323,
  OriginalRow227TriangleData1443.coefficient113_324,
  OriginalRow227TriangleData1443.coefficient113_325,
  OriginalRow227TriangleData1443.coefficient113_326,
  OriginalRow227TriangleData1443.coefficient113_327,
  OriginalRow227TriangleData1443.coefficient113_328,
  OriginalRow227TriangleData1443.coefficient113_329,
  OriginalRow227TriangleData1443.coefficient113_330,
  OriginalRow227TriangleData1443.coefficient113_331,
  OriginalRow227TriangleData1443.coefficient113_332,
  OriginalRow227TriangleData1443.coefficient113_333,
  OriginalRow227TriangleData1443.coefficient113_334,
  OriginalRow227TriangleData1443.coefficient113_335
]

theorem values1443_size : values1443.size = 32 := rfl

def block1443 : ℕ → Option IntervalDyadic := segment 304 values1443

theorem block1443_domain : ExactDomain block1443 304 336 := by
  simpa only [values1443_size] using segment_domain 304 values1443

theorem block1443_get (i : Fin 32) :
    block1443 (304 + i.val) = some (values1443[i.val]'(by rw [values1443_size]; exact i.isLt)) := by
  exact segment_get 304 values1443 ⟨i.val, by rw [values1443_size]; exact i.isLt⟩

def values1444 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1444.coefficient113_336,
  OriginalRow227TriangleData1444.coefficient113_337,
  OriginalRow227TriangleData1444.coefficient113_338,
  OriginalRow227TriangleData1444.coefficient113_339,
  OriginalRow227TriangleData1444.coefficient113_340,
  OriginalRow227TriangleData1444.coefficient113_341,
  OriginalRow227TriangleData1444.coefficient113_342,
  OriginalRow227TriangleData1444.coefficient113_343,
  OriginalRow227TriangleData1444.coefficient113_344,
  OriginalRow227TriangleData1444.coefficient113_345,
  OriginalRow227TriangleData1444.coefficient113_346,
  OriginalRow227TriangleData1444.coefficient113_347,
  OriginalRow227TriangleData1444.coefficient113_348,
  OriginalRow227TriangleData1444.coefficient113_349,
  OriginalRow227TriangleData1444.coefficient113_350,
  OriginalRow227TriangleData1444.coefficient113_351,
  OriginalRow227TriangleData1444.coefficient113_352,
  OriginalRow227TriangleData1444.coefficient113_353,
  OriginalRow227TriangleData1444.coefficient113_354,
  OriginalRow227TriangleData1444.coefficient113_355,
  OriginalRow227TriangleData1444.coefficient113_356,
  OriginalRow227TriangleData1444.coefficient113_357,
  OriginalRow227TriangleData1444.coefficient113_358,
  OriginalRow227TriangleData1444.coefficient113_359,
  OriginalRow227TriangleData1444.coefficient113_360,
  OriginalRow227TriangleData1444.coefficient113_361,
  OriginalRow227TriangleData1444.coefficient113_362,
  OriginalRow227TriangleData1444.coefficient113_363,
  OriginalRow227TriangleData1444.coefficient113_364,
  OriginalRow227TriangleData1444.coefficient113_365,
  OriginalRow227TriangleData1444.coefficient113_366,
  OriginalRow227TriangleData1444.coefficient113_367
]

theorem values1444_size : values1444.size = 32 := rfl

def block1444 : ℕ → Option IntervalDyadic := segment 336 values1444

theorem block1444_domain : ExactDomain block1444 336 368 := by
  simpa only [values1444_size] using segment_domain 336 values1444

theorem block1444_get (i : Fin 32) :
    block1444 (336 + i.val) = some (values1444[i.val]'(by rw [values1444_size]; exact i.isLt)) := by
  exact segment_get 336 values1444 ⟨i.val, by rw [values1444_size]; exact i.isLt⟩

def values1445 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1445.coefficient113_368,
  OriginalRow227TriangleData1445.coefficient113_369,
  OriginalRow227TriangleData1445.coefficient113_370,
  OriginalRow227TriangleData1445.coefficient113_371,
  OriginalRow227TriangleData1445.coefficient113_372,
  OriginalRow227TriangleData1445.coefficient113_373,
  OriginalRow227TriangleData1445.coefficient113_374,
  OriginalRow227TriangleData1445.coefficient113_375,
  OriginalRow227TriangleData1445.coefficient113_376,
  OriginalRow227TriangleData1445.coefficient113_377,
  OriginalRow227TriangleData1445.coefficient113_378,
  OriginalRow227TriangleData1445.coefficient113_379,
  OriginalRow227TriangleData1445.coefficient113_380,
  OriginalRow227TriangleData1445.coefficient113_381,
  OriginalRow227TriangleData1445.coefficient113_382,
  OriginalRow227TriangleData1445.coefficient113_383,
  OriginalRow227TriangleData1445.coefficient113_384,
  OriginalRow227TriangleData1445.coefficient113_385,
  OriginalRow227TriangleData1445.coefficient113_386,
  OriginalRow227TriangleData1445.coefficient113_387,
  OriginalRow227TriangleData1445.coefficient113_388
]

theorem values1445_size : values1445.size = 21 := rfl

def block1445 : ℕ → Option IntervalDyadic := segment 368 values1445

theorem block1445_domain : ExactDomain block1445 368 389 := by
  simpa only [values1445_size] using segment_domain 368 values1445

theorem block1445_get (i : Fin 21) :
    block1445 (368 + i.val) = some (values1445[i.val]'(by rw [values1445_size]; exact i.isLt)) := by
  exact segment_get 368 values1445 ⟨i.val, by rw [values1445_size]; exact i.isLt⟩

def node0112_0176 : ℕ → Option IntervalDyadic := split 144 block1437 block1438

theorem node0112_0176_domain : ExactDomain node0112_0176 112 176 := by
  exact split_domain (by decide) (by decide) block1437_domain block1438_domain

def node0176_0240 : ℕ → Option IntervalDyadic := split 208 block1439 block1440

theorem node0176_0240_domain : ExactDomain node0176_0240 176 240 := by
  exact split_domain (by decide) (by decide) block1439_domain block1440_domain

def node0112_0240 : ℕ → Option IntervalDyadic := split 176 node0112_0176 node0176_0240

theorem node0112_0240_domain : ExactDomain node0112_0240 112 240 := by
  exact split_domain (by decide) (by decide) node0112_0176_domain node0176_0240_domain

def node0240_0304 : ℕ → Option IntervalDyadic := split 272 block1441 block1442

theorem node0240_0304_domain : ExactDomain node0240_0304 240 304 := by
  exact split_domain (by decide) (by decide) block1441_domain block1442_domain

def node0336_0389 : ℕ → Option IntervalDyadic := split 368 block1444 block1445

theorem node0336_0389_domain : ExactDomain node0336_0389 336 389 := by
  exact split_domain (by decide) (by decide) block1444_domain block1445_domain

def node0304_0389 : ℕ → Option IntervalDyadic := split 336 block1443 node0336_0389

theorem node0304_0389_domain : ExactDomain node0304_0389 304 389 := by
  exact split_domain (by decide) (by decide) block1443_domain node0336_0389_domain

def node0240_0389 : ℕ → Option IntervalDyadic := split 304 node0240_0304 node0304_0389

theorem node0240_0389_domain : ExactDomain node0240_0389 240 389 := by
  exact split_domain (by decide) (by decide) node0240_0304_domain node0304_0389_domain

def node0112_0389 : ℕ → Option IntervalDyadic := split 240 node0112_0240 node0240_0389

theorem node0112_0389_domain : ExactDomain node0112_0389 112 389 := by
  exact split_domain (by decide) (by decide) node0112_0240_domain node0240_0389_domain

def lookup : ℕ → Option IntervalDyadic := node0112_0389

theorem lookup_domain : ExactDomain lookup 112 389 :=
  node0112_0389_domain

theorem block1437_lookup (i : Fin 32) :
    lookup (112 + i.val) = some (values1437[i.val]'(by rw [values1437_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (112 + i.val) = _
  rw [node0112_0389, split_left 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0112_0240, split_left 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0112_0176, split_left 144 block1437 block1438 (by omega)]
  exact block1437_get i

theorem block1438_lookup (i : Fin 32) :
    lookup (144 + i.val) = some (values1438[i.val]'(by rw [values1438_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (144 + i.val) = _
  rw [node0112_0389, split_left 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0112_0240, split_left 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0112_0176, split_right 144 block1437 block1438 (by omega)]
  exact block1438_get i

theorem block1439_lookup (i : Fin 32) :
    lookup (176 + i.val) = some (values1439[i.val]'(by rw [values1439_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (176 + i.val) = _
  rw [node0112_0389, split_left 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0112_0240, split_right 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0176_0240, split_left 208 block1439 block1440 (by omega)]
  exact block1439_get i

theorem block1440_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values1440[i.val]'(by rw [values1440_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (208 + i.val) = _
  rw [node0112_0389, split_left 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0112_0240, split_right 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0176_0240, split_right 208 block1439 block1440 (by omega)]
  exact block1440_get i

theorem block1441_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values1441[i.val]'(by rw [values1441_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (240 + i.val) = _
  rw [node0112_0389, split_right 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0240_0389, split_left 304 node0240_0304 node0304_0389 (by omega)]
  rw [node0240_0304, split_left 272 block1441 block1442 (by omega)]
  exact block1441_get i

theorem block1442_lookup (i : Fin 32) :
    lookup (272 + i.val) = some (values1442[i.val]'(by rw [values1442_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (272 + i.val) = _
  rw [node0112_0389, split_right 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0240_0389, split_left 304 node0240_0304 node0304_0389 (by omega)]
  rw [node0240_0304, split_right 272 block1441 block1442 (by omega)]
  exact block1442_get i

theorem block1443_lookup (i : Fin 32) :
    lookup (304 + i.val) = some (values1443[i.val]'(by rw [values1443_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (304 + i.val) = _
  rw [node0112_0389, split_right 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0240_0389, split_right 304 node0240_0304 node0304_0389 (by omega)]
  rw [node0304_0389, split_left 336 block1443 node0336_0389 (by omega)]
  exact block1443_get i

theorem block1444_lookup (i : Fin 32) :
    lookup (336 + i.val) = some (values1444[i.val]'(by rw [values1444_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (336 + i.val) = _
  rw [node0112_0389, split_right 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0240_0389, split_right 304 node0240_0304 node0304_0389 (by omega)]
  rw [node0304_0389, split_right 336 block1443 node0336_0389 (by omega)]
  rw [node0336_0389, split_left 368 block1444 block1445 (by omega)]
  exact block1444_get i

theorem block1445_lookup (i : Fin 21) :
    lookup (368 + i.val) = some (values1445[i.val]'(by rw [values1445_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0112_0389 (368 + i.val) = _
  rw [node0112_0389, split_right 240 node0112_0240 node0240_0389 (by omega)]
  rw [node0240_0389, split_right 304 node0240_0304 node0304_0389 (by omega)]
  rw [node0304_0389, split_right 336 block1443 node0336_0389 (by omega)]
  rw [node0336_0389, split_right 368 block1444 block1445 (by omega)]
  exact block1445_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1437_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1437_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1438_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1438_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1439_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1439_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1440_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1440_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1441_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1441_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1442_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1442_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1443_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1443_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1444_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1444_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1445_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1445_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1437_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1438_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1439_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1440_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1441_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1442_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1443_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1444_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow113.block1445_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow113
