import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1362
import Grothe.UpperChaos.OriginalRow227TriangleData1363
import Grothe.UpperChaos.OriginalRow227TriangleData1364
import Grothe.UpperChaos.OriginalRow227TriangleData1365
import Grothe.UpperChaos.OriginalRow227TriangleData1366
import Grothe.UpperChaos.OriginalRow227TriangleData1367
import Grothe.UpperChaos.OriginalRow227TriangleData1368
import Grothe.UpperChaos.OriginalRow227TriangleData1369
import Grothe.UpperChaos.OriginalRow227TriangleData1370
import Grothe.UpperChaos.OriginalRow227TriangleData1371

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow105

open ConditionalTableLookup

def values1362 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1362.coefficient105_104,
  OriginalRow227TriangleData1362.coefficient105_105,
  OriginalRow227TriangleData1362.coefficient105_106,
  OriginalRow227TriangleData1362.coefficient105_107,
  OriginalRow227TriangleData1362.coefficient105_108,
  OriginalRow227TriangleData1362.coefficient105_109,
  OriginalRow227TriangleData1362.coefficient105_110,
  OriginalRow227TriangleData1362.coefficient105_111,
  OriginalRow227TriangleData1362.coefficient105_112,
  OriginalRow227TriangleData1362.coefficient105_113,
  OriginalRow227TriangleData1362.coefficient105_114,
  OriginalRow227TriangleData1362.coefficient105_115,
  OriginalRow227TriangleData1362.coefficient105_116,
  OriginalRow227TriangleData1362.coefficient105_117,
  OriginalRow227TriangleData1362.coefficient105_118,
  OriginalRow227TriangleData1362.coefficient105_119,
  OriginalRow227TriangleData1362.coefficient105_120,
  OriginalRow227TriangleData1362.coefficient105_121,
  OriginalRow227TriangleData1362.coefficient105_122,
  OriginalRow227TriangleData1362.coefficient105_123,
  OriginalRow227TriangleData1362.coefficient105_124,
  OriginalRow227TriangleData1362.coefficient105_125,
  OriginalRow227TriangleData1362.coefficient105_126,
  OriginalRow227TriangleData1362.coefficient105_127,
  OriginalRow227TriangleData1362.coefficient105_128,
  OriginalRow227TriangleData1362.coefficient105_129,
  OriginalRow227TriangleData1362.coefficient105_130,
  OriginalRow227TriangleData1362.coefficient105_131,
  OriginalRow227TriangleData1362.coefficient105_132,
  OriginalRow227TriangleData1362.coefficient105_133,
  OriginalRow227TriangleData1362.coefficient105_134,
  OriginalRow227TriangleData1362.coefficient105_135
]

theorem values1362_size : values1362.size = 32 := rfl

def block1362 : ℕ → Option IntervalDyadic := segment 104 values1362

theorem block1362_domain : ExactDomain block1362 104 136 := by
  simpa only [values1362_size] using segment_domain 104 values1362

theorem block1362_get (i : Fin 32) :
    block1362 (104 + i.val) = some (values1362[i.val]'(by rw [values1362_size]; exact i.isLt)) := by
  exact segment_get 104 values1362 ⟨i.val, by rw [values1362_size]; exact i.isLt⟩

def values1363 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1363.coefficient105_136,
  OriginalRow227TriangleData1363.coefficient105_137,
  OriginalRow227TriangleData1363.coefficient105_138,
  OriginalRow227TriangleData1363.coefficient105_139,
  OriginalRow227TriangleData1363.coefficient105_140,
  OriginalRow227TriangleData1363.coefficient105_141,
  OriginalRow227TriangleData1363.coefficient105_142,
  OriginalRow227TriangleData1363.coefficient105_143,
  OriginalRow227TriangleData1363.coefficient105_144,
  OriginalRow227TriangleData1363.coefficient105_145,
  OriginalRow227TriangleData1363.coefficient105_146,
  OriginalRow227TriangleData1363.coefficient105_147,
  OriginalRow227TriangleData1363.coefficient105_148,
  OriginalRow227TriangleData1363.coefficient105_149,
  OriginalRow227TriangleData1363.coefficient105_150,
  OriginalRow227TriangleData1363.coefficient105_151,
  OriginalRow227TriangleData1363.coefficient105_152,
  OriginalRow227TriangleData1363.coefficient105_153,
  OriginalRow227TriangleData1363.coefficient105_154,
  OriginalRow227TriangleData1363.coefficient105_155,
  OriginalRow227TriangleData1363.coefficient105_156,
  OriginalRow227TriangleData1363.coefficient105_157,
  OriginalRow227TriangleData1363.coefficient105_158,
  OriginalRow227TriangleData1363.coefficient105_159,
  OriginalRow227TriangleData1363.coefficient105_160,
  OriginalRow227TriangleData1363.coefficient105_161,
  OriginalRow227TriangleData1363.coefficient105_162,
  OriginalRow227TriangleData1363.coefficient105_163,
  OriginalRow227TriangleData1363.coefficient105_164,
  OriginalRow227TriangleData1363.coefficient105_165,
  OriginalRow227TriangleData1363.coefficient105_166,
  OriginalRow227TriangleData1363.coefficient105_167
]

theorem values1363_size : values1363.size = 32 := rfl

def block1363 : ℕ → Option IntervalDyadic := segment 136 values1363

theorem block1363_domain : ExactDomain block1363 136 168 := by
  simpa only [values1363_size] using segment_domain 136 values1363

theorem block1363_get (i : Fin 32) :
    block1363 (136 + i.val) = some (values1363[i.val]'(by rw [values1363_size]; exact i.isLt)) := by
  exact segment_get 136 values1363 ⟨i.val, by rw [values1363_size]; exact i.isLt⟩

def values1364 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1364.coefficient105_168,
  OriginalRow227TriangleData1364.coefficient105_169,
  OriginalRow227TriangleData1364.coefficient105_170,
  OriginalRow227TriangleData1364.coefficient105_171,
  OriginalRow227TriangleData1364.coefficient105_172,
  OriginalRow227TriangleData1364.coefficient105_173,
  OriginalRow227TriangleData1364.coefficient105_174,
  OriginalRow227TriangleData1364.coefficient105_175,
  OriginalRow227TriangleData1364.coefficient105_176,
  OriginalRow227TriangleData1364.coefficient105_177,
  OriginalRow227TriangleData1364.coefficient105_178,
  OriginalRow227TriangleData1364.coefficient105_179,
  OriginalRow227TriangleData1364.coefficient105_180,
  OriginalRow227TriangleData1364.coefficient105_181,
  OriginalRow227TriangleData1364.coefficient105_182,
  OriginalRow227TriangleData1364.coefficient105_183,
  OriginalRow227TriangleData1364.coefficient105_184,
  OriginalRow227TriangleData1364.coefficient105_185,
  OriginalRow227TriangleData1364.coefficient105_186,
  OriginalRow227TriangleData1364.coefficient105_187,
  OriginalRow227TriangleData1364.coefficient105_188,
  OriginalRow227TriangleData1364.coefficient105_189,
  OriginalRow227TriangleData1364.coefficient105_190,
  OriginalRow227TriangleData1364.coefficient105_191,
  OriginalRow227TriangleData1364.coefficient105_192,
  OriginalRow227TriangleData1364.coefficient105_193,
  OriginalRow227TriangleData1364.coefficient105_194,
  OriginalRow227TriangleData1364.coefficient105_195,
  OriginalRow227TriangleData1364.coefficient105_196,
  OriginalRow227TriangleData1364.coefficient105_197,
  OriginalRow227TriangleData1364.coefficient105_198,
  OriginalRow227TriangleData1364.coefficient105_199
]

theorem values1364_size : values1364.size = 32 := rfl

def block1364 : ℕ → Option IntervalDyadic := segment 168 values1364

theorem block1364_domain : ExactDomain block1364 168 200 := by
  simpa only [values1364_size] using segment_domain 168 values1364

theorem block1364_get (i : Fin 32) :
    block1364 (168 + i.val) = some (values1364[i.val]'(by rw [values1364_size]; exact i.isLt)) := by
  exact segment_get 168 values1364 ⟨i.val, by rw [values1364_size]; exact i.isLt⟩

def values1365 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1365.coefficient105_200,
  OriginalRow227TriangleData1365.coefficient105_201,
  OriginalRow227TriangleData1365.coefficient105_202,
  OriginalRow227TriangleData1365.coefficient105_203,
  OriginalRow227TriangleData1365.coefficient105_204,
  OriginalRow227TriangleData1365.coefficient105_205,
  OriginalRow227TriangleData1365.coefficient105_206,
  OriginalRow227TriangleData1365.coefficient105_207,
  OriginalRow227TriangleData1365.coefficient105_208,
  OriginalRow227TriangleData1365.coefficient105_209,
  OriginalRow227TriangleData1365.coefficient105_210,
  OriginalRow227TriangleData1365.coefficient105_211,
  OriginalRow227TriangleData1365.coefficient105_212,
  OriginalRow227TriangleData1365.coefficient105_213,
  OriginalRow227TriangleData1365.coefficient105_214,
  OriginalRow227TriangleData1365.coefficient105_215,
  OriginalRow227TriangleData1365.coefficient105_216,
  OriginalRow227TriangleData1365.coefficient105_217,
  OriginalRow227TriangleData1365.coefficient105_218,
  OriginalRow227TriangleData1365.coefficient105_219,
  OriginalRow227TriangleData1365.coefficient105_220,
  OriginalRow227TriangleData1365.coefficient105_221,
  OriginalRow227TriangleData1365.coefficient105_222,
  OriginalRow227TriangleData1365.coefficient105_223,
  OriginalRow227TriangleData1365.coefficient105_224,
  OriginalRow227TriangleData1365.coefficient105_225,
  OriginalRow227TriangleData1365.coefficient105_226,
  OriginalRow227TriangleData1365.coefficient105_227,
  OriginalRow227TriangleData1365.coefficient105_228,
  OriginalRow227TriangleData1365.coefficient105_229,
  OriginalRow227TriangleData1365.coefficient105_230,
  OriginalRow227TriangleData1365.coefficient105_231
]

theorem values1365_size : values1365.size = 32 := rfl

def block1365 : ℕ → Option IntervalDyadic := segment 200 values1365

theorem block1365_domain : ExactDomain block1365 200 232 := by
  simpa only [values1365_size] using segment_domain 200 values1365

theorem block1365_get (i : Fin 32) :
    block1365 (200 + i.val) = some (values1365[i.val]'(by rw [values1365_size]; exact i.isLt)) := by
  exact segment_get 200 values1365 ⟨i.val, by rw [values1365_size]; exact i.isLt⟩

def values1366 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1366.coefficient105_232,
  OriginalRow227TriangleData1366.coefficient105_233,
  OriginalRow227TriangleData1366.coefficient105_234,
  OriginalRow227TriangleData1366.coefficient105_235,
  OriginalRow227TriangleData1366.coefficient105_236,
  OriginalRow227TriangleData1366.coefficient105_237,
  OriginalRow227TriangleData1366.coefficient105_238,
  OriginalRow227TriangleData1366.coefficient105_239,
  OriginalRow227TriangleData1366.coefficient105_240,
  OriginalRow227TriangleData1366.coefficient105_241,
  OriginalRow227TriangleData1366.coefficient105_242,
  OriginalRow227TriangleData1366.coefficient105_243,
  OriginalRow227TriangleData1366.coefficient105_244,
  OriginalRow227TriangleData1366.coefficient105_245,
  OriginalRow227TriangleData1366.coefficient105_246,
  OriginalRow227TriangleData1366.coefficient105_247,
  OriginalRow227TriangleData1366.coefficient105_248,
  OriginalRow227TriangleData1366.coefficient105_249,
  OriginalRow227TriangleData1366.coefficient105_250,
  OriginalRow227TriangleData1366.coefficient105_251,
  OriginalRow227TriangleData1366.coefficient105_252,
  OriginalRow227TriangleData1366.coefficient105_253,
  OriginalRow227TriangleData1366.coefficient105_254,
  OriginalRow227TriangleData1366.coefficient105_255,
  OriginalRow227TriangleData1366.coefficient105_256,
  OriginalRow227TriangleData1366.coefficient105_257,
  OriginalRow227TriangleData1366.coefficient105_258,
  OriginalRow227TriangleData1366.coefficient105_259,
  OriginalRow227TriangleData1366.coefficient105_260,
  OriginalRow227TriangleData1366.coefficient105_261,
  OriginalRow227TriangleData1366.coefficient105_262,
  OriginalRow227TriangleData1366.coefficient105_263
]

theorem values1366_size : values1366.size = 32 := rfl

def block1366 : ℕ → Option IntervalDyadic := segment 232 values1366

theorem block1366_domain : ExactDomain block1366 232 264 := by
  simpa only [values1366_size] using segment_domain 232 values1366

theorem block1366_get (i : Fin 32) :
    block1366 (232 + i.val) = some (values1366[i.val]'(by rw [values1366_size]; exact i.isLt)) := by
  exact segment_get 232 values1366 ⟨i.val, by rw [values1366_size]; exact i.isLt⟩

def values1367 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1367.coefficient105_264,
  OriginalRow227TriangleData1367.coefficient105_265,
  OriginalRow227TriangleData1367.coefficient105_266,
  OriginalRow227TriangleData1367.coefficient105_267,
  OriginalRow227TriangleData1367.coefficient105_268,
  OriginalRow227TriangleData1367.coefficient105_269,
  OriginalRow227TriangleData1367.coefficient105_270,
  OriginalRow227TriangleData1367.coefficient105_271,
  OriginalRow227TriangleData1367.coefficient105_272,
  OriginalRow227TriangleData1367.coefficient105_273,
  OriginalRow227TriangleData1367.coefficient105_274,
  OriginalRow227TriangleData1367.coefficient105_275,
  OriginalRow227TriangleData1367.coefficient105_276,
  OriginalRow227TriangleData1367.coefficient105_277,
  OriginalRow227TriangleData1367.coefficient105_278,
  OriginalRow227TriangleData1367.coefficient105_279,
  OriginalRow227TriangleData1367.coefficient105_280,
  OriginalRow227TriangleData1367.coefficient105_281,
  OriginalRow227TriangleData1367.coefficient105_282,
  OriginalRow227TriangleData1367.coefficient105_283,
  OriginalRow227TriangleData1367.coefficient105_284,
  OriginalRow227TriangleData1367.coefficient105_285,
  OriginalRow227TriangleData1367.coefficient105_286,
  OriginalRow227TriangleData1367.coefficient105_287,
  OriginalRow227TriangleData1367.coefficient105_288,
  OriginalRow227TriangleData1367.coefficient105_289,
  OriginalRow227TriangleData1367.coefficient105_290,
  OriginalRow227TriangleData1367.coefficient105_291,
  OriginalRow227TriangleData1367.coefficient105_292,
  OriginalRow227TriangleData1367.coefficient105_293,
  OriginalRow227TriangleData1367.coefficient105_294,
  OriginalRow227TriangleData1367.coefficient105_295
]

theorem values1367_size : values1367.size = 32 := rfl

def block1367 : ℕ → Option IntervalDyadic := segment 264 values1367

theorem block1367_domain : ExactDomain block1367 264 296 := by
  simpa only [values1367_size] using segment_domain 264 values1367

theorem block1367_get (i : Fin 32) :
    block1367 (264 + i.val) = some (values1367[i.val]'(by rw [values1367_size]; exact i.isLt)) := by
  exact segment_get 264 values1367 ⟨i.val, by rw [values1367_size]; exact i.isLt⟩

def values1368 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1368.coefficient105_296,
  OriginalRow227TriangleData1368.coefficient105_297,
  OriginalRow227TriangleData1368.coefficient105_298,
  OriginalRow227TriangleData1368.coefficient105_299,
  OriginalRow227TriangleData1368.coefficient105_300,
  OriginalRow227TriangleData1368.coefficient105_301,
  OriginalRow227TriangleData1368.coefficient105_302,
  OriginalRow227TriangleData1368.coefficient105_303,
  OriginalRow227TriangleData1368.coefficient105_304,
  OriginalRow227TriangleData1368.coefficient105_305,
  OriginalRow227TriangleData1368.coefficient105_306,
  OriginalRow227TriangleData1368.coefficient105_307,
  OriginalRow227TriangleData1368.coefficient105_308,
  OriginalRow227TriangleData1368.coefficient105_309,
  OriginalRow227TriangleData1368.coefficient105_310,
  OriginalRow227TriangleData1368.coefficient105_311,
  OriginalRow227TriangleData1368.coefficient105_312,
  OriginalRow227TriangleData1368.coefficient105_313,
  OriginalRow227TriangleData1368.coefficient105_314,
  OriginalRow227TriangleData1368.coefficient105_315,
  OriginalRow227TriangleData1368.coefficient105_316,
  OriginalRow227TriangleData1368.coefficient105_317,
  OriginalRow227TriangleData1368.coefficient105_318,
  OriginalRow227TriangleData1368.coefficient105_319,
  OriginalRow227TriangleData1368.coefficient105_320,
  OriginalRow227TriangleData1368.coefficient105_321,
  OriginalRow227TriangleData1368.coefficient105_322,
  OriginalRow227TriangleData1368.coefficient105_323,
  OriginalRow227TriangleData1368.coefficient105_324,
  OriginalRow227TriangleData1368.coefficient105_325,
  OriginalRow227TriangleData1368.coefficient105_326,
  OriginalRow227TriangleData1368.coefficient105_327
]

theorem values1368_size : values1368.size = 32 := rfl

def block1368 : ℕ → Option IntervalDyadic := segment 296 values1368

theorem block1368_domain : ExactDomain block1368 296 328 := by
  simpa only [values1368_size] using segment_domain 296 values1368

theorem block1368_get (i : Fin 32) :
    block1368 (296 + i.val) = some (values1368[i.val]'(by rw [values1368_size]; exact i.isLt)) := by
  exact segment_get 296 values1368 ⟨i.val, by rw [values1368_size]; exact i.isLt⟩

def values1369 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1369.coefficient105_328,
  OriginalRow227TriangleData1369.coefficient105_329,
  OriginalRow227TriangleData1369.coefficient105_330,
  OriginalRow227TriangleData1369.coefficient105_331,
  OriginalRow227TriangleData1369.coefficient105_332,
  OriginalRow227TriangleData1369.coefficient105_333,
  OriginalRow227TriangleData1369.coefficient105_334,
  OriginalRow227TriangleData1369.coefficient105_335,
  OriginalRow227TriangleData1369.coefficient105_336,
  OriginalRow227TriangleData1369.coefficient105_337,
  OriginalRow227TriangleData1369.coefficient105_338,
  OriginalRow227TriangleData1369.coefficient105_339,
  OriginalRow227TriangleData1369.coefficient105_340,
  OriginalRow227TriangleData1369.coefficient105_341,
  OriginalRow227TriangleData1369.coefficient105_342,
  OriginalRow227TriangleData1369.coefficient105_343,
  OriginalRow227TriangleData1369.coefficient105_344,
  OriginalRow227TriangleData1369.coefficient105_345,
  OriginalRow227TriangleData1369.coefficient105_346,
  OriginalRow227TriangleData1369.coefficient105_347,
  OriginalRow227TriangleData1369.coefficient105_348,
  OriginalRow227TriangleData1369.coefficient105_349,
  OriginalRow227TriangleData1369.coefficient105_350,
  OriginalRow227TriangleData1369.coefficient105_351,
  OriginalRow227TriangleData1369.coefficient105_352,
  OriginalRow227TriangleData1369.coefficient105_353,
  OriginalRow227TriangleData1369.coefficient105_354,
  OriginalRow227TriangleData1369.coefficient105_355,
  OriginalRow227TriangleData1369.coefficient105_356,
  OriginalRow227TriangleData1369.coefficient105_357,
  OriginalRow227TriangleData1369.coefficient105_358,
  OriginalRow227TriangleData1369.coefficient105_359
]

theorem values1369_size : values1369.size = 32 := rfl

def block1369 : ℕ → Option IntervalDyadic := segment 328 values1369

theorem block1369_domain : ExactDomain block1369 328 360 := by
  simpa only [values1369_size] using segment_domain 328 values1369

theorem block1369_get (i : Fin 32) :
    block1369 (328 + i.val) = some (values1369[i.val]'(by rw [values1369_size]; exact i.isLt)) := by
  exact segment_get 328 values1369 ⟨i.val, by rw [values1369_size]; exact i.isLt⟩

def values1370 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1370.coefficient105_360,
  OriginalRow227TriangleData1370.coefficient105_361,
  OriginalRow227TriangleData1370.coefficient105_362,
  OriginalRow227TriangleData1370.coefficient105_363,
  OriginalRow227TriangleData1370.coefficient105_364,
  OriginalRow227TriangleData1370.coefficient105_365,
  OriginalRow227TriangleData1370.coefficient105_366,
  OriginalRow227TriangleData1370.coefficient105_367,
  OriginalRow227TriangleData1370.coefficient105_368,
  OriginalRow227TriangleData1370.coefficient105_369,
  OriginalRow227TriangleData1370.coefficient105_370,
  OriginalRow227TriangleData1370.coefficient105_371,
  OriginalRow227TriangleData1370.coefficient105_372,
  OriginalRow227TriangleData1370.coefficient105_373,
  OriginalRow227TriangleData1370.coefficient105_374,
  OriginalRow227TriangleData1370.coefficient105_375,
  OriginalRow227TriangleData1370.coefficient105_376,
  OriginalRow227TriangleData1370.coefficient105_377,
  OriginalRow227TriangleData1370.coefficient105_378,
  OriginalRow227TriangleData1370.coefficient105_379,
  OriginalRow227TriangleData1370.coefficient105_380,
  OriginalRow227TriangleData1370.coefficient105_381,
  OriginalRow227TriangleData1370.coefficient105_382,
  OriginalRow227TriangleData1370.coefficient105_383,
  OriginalRow227TriangleData1370.coefficient105_384,
  OriginalRow227TriangleData1370.coefficient105_385,
  OriginalRow227TriangleData1370.coefficient105_386,
  OriginalRow227TriangleData1370.coefficient105_387,
  OriginalRow227TriangleData1370.coefficient105_388,
  OriginalRow227TriangleData1370.coefficient105_389,
  OriginalRow227TriangleData1370.coefficient105_390,
  OriginalRow227TriangleData1370.coefficient105_391
]

theorem values1370_size : values1370.size = 32 := rfl

def block1370 : ℕ → Option IntervalDyadic := segment 360 values1370

theorem block1370_domain : ExactDomain block1370 360 392 := by
  simpa only [values1370_size] using segment_domain 360 values1370

theorem block1370_get (i : Fin 32) :
    block1370 (360 + i.val) = some (values1370[i.val]'(by rw [values1370_size]; exact i.isLt)) := by
  exact segment_get 360 values1370 ⟨i.val, by rw [values1370_size]; exact i.isLt⟩

def values1371 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1371.coefficient105_392,
  OriginalRow227TriangleData1371.coefficient105_393,
  OriginalRow227TriangleData1371.coefficient105_394,
  OriginalRow227TriangleData1371.coefficient105_395,
  OriginalRow227TriangleData1371.coefficient105_396
]

theorem values1371_size : values1371.size = 5 := rfl

def block1371 : ℕ → Option IntervalDyadic := segment 392 values1371

theorem block1371_domain : ExactDomain block1371 392 397 := by
  simpa only [values1371_size] using segment_domain 392 values1371

theorem block1371_get (i : Fin 5) :
    block1371 (392 + i.val) = some (values1371[i.val]'(by rw [values1371_size]; exact i.isLt)) := by
  exact segment_get 392 values1371 ⟨i.val, by rw [values1371_size]; exact i.isLt⟩

def node0104_0168 : ℕ → Option IntervalDyadic := split 136 block1362 block1363

theorem node0104_0168_domain : ExactDomain node0104_0168 104 168 := by
  exact split_domain (by decide) (by decide) block1362_domain block1363_domain

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block1365 block1366

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block1365_domain block1366_domain

def node0168_0264 : ℕ → Option IntervalDyadic := split 200 block1364 node0200_0264

theorem node0168_0264_domain : ExactDomain node0168_0264 168 264 := by
  exact split_domain (by decide) (by decide) block1364_domain node0200_0264_domain

def node0104_0264 : ℕ → Option IntervalDyadic := split 168 node0104_0168 node0168_0264

theorem node0104_0264_domain : ExactDomain node0104_0264 104 264 := by
  exact split_domain (by decide) (by decide) node0104_0168_domain node0168_0264_domain

def node0264_0328 : ℕ → Option IntervalDyadic := split 296 block1367 block1368

theorem node0264_0328_domain : ExactDomain node0264_0328 264 328 := by
  exact split_domain (by decide) (by decide) block1367_domain block1368_domain

def node0360_0397 : ℕ → Option IntervalDyadic := split 392 block1370 block1371

theorem node0360_0397_domain : ExactDomain node0360_0397 360 397 := by
  exact split_domain (by decide) (by decide) block1370_domain block1371_domain

def node0328_0397 : ℕ → Option IntervalDyadic := split 360 block1369 node0360_0397

theorem node0328_0397_domain : ExactDomain node0328_0397 328 397 := by
  exact split_domain (by decide) (by decide) block1369_domain node0360_0397_domain

def node0264_0397 : ℕ → Option IntervalDyadic := split 328 node0264_0328 node0328_0397

theorem node0264_0397_domain : ExactDomain node0264_0397 264 397 := by
  exact split_domain (by decide) (by decide) node0264_0328_domain node0328_0397_domain

def node0104_0397 : ℕ → Option IntervalDyadic := split 264 node0104_0264 node0264_0397

theorem node0104_0397_domain : ExactDomain node0104_0397 104 397 := by
  exact split_domain (by decide) (by decide) node0104_0264_domain node0264_0397_domain

def lookup : ℕ → Option IntervalDyadic := node0104_0397

theorem lookup_domain : ExactDomain lookup 104 397 :=
  node0104_0397_domain

theorem block1362_lookup (i : Fin 32) :
    lookup (104 + i.val) = some (values1362[i.val]'(by rw [values1362_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (104 + i.val) = _
  rw [node0104_0397, split_left 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0104_0264, split_left 168 node0104_0168 node0168_0264 (by omega)]
  rw [node0104_0168, split_left 136 block1362 block1363 (by omega)]
  exact block1362_get i

theorem block1363_lookup (i : Fin 32) :
    lookup (136 + i.val) = some (values1363[i.val]'(by rw [values1363_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (136 + i.val) = _
  rw [node0104_0397, split_left 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0104_0264, split_left 168 node0104_0168 node0168_0264 (by omega)]
  rw [node0104_0168, split_right 136 block1362 block1363 (by omega)]
  exact block1363_get i

theorem block1364_lookup (i : Fin 32) :
    lookup (168 + i.val) = some (values1364[i.val]'(by rw [values1364_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (168 + i.val) = _
  rw [node0104_0397, split_left 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0104_0264, split_right 168 node0104_0168 node0168_0264 (by omega)]
  rw [node0168_0264, split_left 200 block1364 node0200_0264 (by omega)]
  exact block1364_get i

theorem block1365_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values1365[i.val]'(by rw [values1365_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (200 + i.val) = _
  rw [node0104_0397, split_left 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0104_0264, split_right 168 node0104_0168 node0168_0264 (by omega)]
  rw [node0168_0264, split_right 200 block1364 node0200_0264 (by omega)]
  rw [node0200_0264, split_left 232 block1365 block1366 (by omega)]
  exact block1365_get i

theorem block1366_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values1366[i.val]'(by rw [values1366_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (232 + i.val) = _
  rw [node0104_0397, split_left 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0104_0264, split_right 168 node0104_0168 node0168_0264 (by omega)]
  rw [node0168_0264, split_right 200 block1364 node0200_0264 (by omega)]
  rw [node0200_0264, split_right 232 block1365 block1366 (by omega)]
  exact block1366_get i

theorem block1367_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values1367[i.val]'(by rw [values1367_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (264 + i.val) = _
  rw [node0104_0397, split_right 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0264_0397, split_left 328 node0264_0328 node0328_0397 (by omega)]
  rw [node0264_0328, split_left 296 block1367 block1368 (by omega)]
  exact block1367_get i

theorem block1368_lookup (i : Fin 32) :
    lookup (296 + i.val) = some (values1368[i.val]'(by rw [values1368_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (296 + i.val) = _
  rw [node0104_0397, split_right 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0264_0397, split_left 328 node0264_0328 node0328_0397 (by omega)]
  rw [node0264_0328, split_right 296 block1367 block1368 (by omega)]
  exact block1368_get i

theorem block1369_lookup (i : Fin 32) :
    lookup (328 + i.val) = some (values1369[i.val]'(by rw [values1369_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (328 + i.val) = _
  rw [node0104_0397, split_right 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0264_0397, split_right 328 node0264_0328 node0328_0397 (by omega)]
  rw [node0328_0397, split_left 360 block1369 node0360_0397 (by omega)]
  exact block1369_get i

theorem block1370_lookup (i : Fin 32) :
    lookup (360 + i.val) = some (values1370[i.val]'(by rw [values1370_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (360 + i.val) = _
  rw [node0104_0397, split_right 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0264_0397, split_right 328 node0264_0328 node0328_0397 (by omega)]
  rw [node0328_0397, split_right 360 block1369 node0360_0397 (by omega)]
  rw [node0360_0397, split_left 392 block1370 block1371 (by omega)]
  exact block1370_get i

theorem block1371_lookup (i : Fin 5) :
    lookup (392 + i.val) = some (values1371[i.val]'(by rw [values1371_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0104_0397 (392 + i.val) = _
  rw [node0104_0397, split_right 264 node0104_0264 node0264_0397 (by omega)]
  rw [node0264_0397, split_right 328 node0264_0328 node0328_0397 (by omega)]
  rw [node0328_0397, split_right 360 block1369 node0360_0397 (by omega)]
  rw [node0360_0397, split_right 392 block1370 block1371 (by omega)]
  exact block1371_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1362_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1362_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1363_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1363_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1364_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1364_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1365_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1365_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1366_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1366_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1367_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1367_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1368_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1368_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1369_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1369_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1370_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1370_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1371_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1371_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1362_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1363_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1364_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1365_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1366_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1367_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1368_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1369_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1370_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow105.block1371_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow105
