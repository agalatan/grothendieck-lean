import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1382
import Grothe.UpperChaos.OriginalRow227TriangleData1383
import Grothe.UpperChaos.OriginalRow227TriangleData1384
import Grothe.UpperChaos.OriginalRow227TriangleData1385
import Grothe.UpperChaos.OriginalRow227TriangleData1386
import Grothe.UpperChaos.OriginalRow227TriangleData1387
import Grothe.UpperChaos.OriginalRow227TriangleData1388
import Grothe.UpperChaos.OriginalRow227TriangleData1389
import Grothe.UpperChaos.OriginalRow227TriangleData1390
import Grothe.UpperChaos.OriginalRow227TriangleData1391

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow107

open ConditionalTableLookup

def values1382 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1382.coefficient107_106,
  OriginalRow227TriangleData1382.coefficient107_107,
  OriginalRow227TriangleData1382.coefficient107_108,
  OriginalRow227TriangleData1382.coefficient107_109,
  OriginalRow227TriangleData1382.coefficient107_110,
  OriginalRow227TriangleData1382.coefficient107_111,
  OriginalRow227TriangleData1382.coefficient107_112,
  OriginalRow227TriangleData1382.coefficient107_113,
  OriginalRow227TriangleData1382.coefficient107_114,
  OriginalRow227TriangleData1382.coefficient107_115,
  OriginalRow227TriangleData1382.coefficient107_116,
  OriginalRow227TriangleData1382.coefficient107_117,
  OriginalRow227TriangleData1382.coefficient107_118,
  OriginalRow227TriangleData1382.coefficient107_119,
  OriginalRow227TriangleData1382.coefficient107_120,
  OriginalRow227TriangleData1382.coefficient107_121,
  OriginalRow227TriangleData1382.coefficient107_122,
  OriginalRow227TriangleData1382.coefficient107_123,
  OriginalRow227TriangleData1382.coefficient107_124,
  OriginalRow227TriangleData1382.coefficient107_125,
  OriginalRow227TriangleData1382.coefficient107_126,
  OriginalRow227TriangleData1382.coefficient107_127,
  OriginalRow227TriangleData1382.coefficient107_128,
  OriginalRow227TriangleData1382.coefficient107_129,
  OriginalRow227TriangleData1382.coefficient107_130,
  OriginalRow227TriangleData1382.coefficient107_131,
  OriginalRow227TriangleData1382.coefficient107_132,
  OriginalRow227TriangleData1382.coefficient107_133,
  OriginalRow227TriangleData1382.coefficient107_134,
  OriginalRow227TriangleData1382.coefficient107_135,
  OriginalRow227TriangleData1382.coefficient107_136,
  OriginalRow227TriangleData1382.coefficient107_137
]

theorem values1382_size : values1382.size = 32 := rfl

def block1382 : ℕ → Option IntervalDyadic := segment 106 values1382

theorem block1382_domain : ExactDomain block1382 106 138 := by
  simpa only [values1382_size] using segment_domain 106 values1382

theorem block1382_get (i : Fin 32) :
    block1382 (106 + i.val) = some (values1382[i.val]'(by rw [values1382_size]; exact i.isLt)) := by
  exact segment_get 106 values1382 ⟨i.val, by rw [values1382_size]; exact i.isLt⟩

def values1383 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1383.coefficient107_138,
  OriginalRow227TriangleData1383.coefficient107_139,
  OriginalRow227TriangleData1383.coefficient107_140,
  OriginalRow227TriangleData1383.coefficient107_141,
  OriginalRow227TriangleData1383.coefficient107_142,
  OriginalRow227TriangleData1383.coefficient107_143,
  OriginalRow227TriangleData1383.coefficient107_144,
  OriginalRow227TriangleData1383.coefficient107_145,
  OriginalRow227TriangleData1383.coefficient107_146,
  OriginalRow227TriangleData1383.coefficient107_147,
  OriginalRow227TriangleData1383.coefficient107_148,
  OriginalRow227TriangleData1383.coefficient107_149,
  OriginalRow227TriangleData1383.coefficient107_150,
  OriginalRow227TriangleData1383.coefficient107_151,
  OriginalRow227TriangleData1383.coefficient107_152,
  OriginalRow227TriangleData1383.coefficient107_153,
  OriginalRow227TriangleData1383.coefficient107_154,
  OriginalRow227TriangleData1383.coefficient107_155,
  OriginalRow227TriangleData1383.coefficient107_156,
  OriginalRow227TriangleData1383.coefficient107_157,
  OriginalRow227TriangleData1383.coefficient107_158,
  OriginalRow227TriangleData1383.coefficient107_159,
  OriginalRow227TriangleData1383.coefficient107_160,
  OriginalRow227TriangleData1383.coefficient107_161,
  OriginalRow227TriangleData1383.coefficient107_162,
  OriginalRow227TriangleData1383.coefficient107_163,
  OriginalRow227TriangleData1383.coefficient107_164,
  OriginalRow227TriangleData1383.coefficient107_165,
  OriginalRow227TriangleData1383.coefficient107_166,
  OriginalRow227TriangleData1383.coefficient107_167,
  OriginalRow227TriangleData1383.coefficient107_168,
  OriginalRow227TriangleData1383.coefficient107_169
]

theorem values1383_size : values1383.size = 32 := rfl

def block1383 : ℕ → Option IntervalDyadic := segment 138 values1383

theorem block1383_domain : ExactDomain block1383 138 170 := by
  simpa only [values1383_size] using segment_domain 138 values1383

theorem block1383_get (i : Fin 32) :
    block1383 (138 + i.val) = some (values1383[i.val]'(by rw [values1383_size]; exact i.isLt)) := by
  exact segment_get 138 values1383 ⟨i.val, by rw [values1383_size]; exact i.isLt⟩

def values1384 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1384.coefficient107_170,
  OriginalRow227TriangleData1384.coefficient107_171,
  OriginalRow227TriangleData1384.coefficient107_172,
  OriginalRow227TriangleData1384.coefficient107_173,
  OriginalRow227TriangleData1384.coefficient107_174,
  OriginalRow227TriangleData1384.coefficient107_175,
  OriginalRow227TriangleData1384.coefficient107_176,
  OriginalRow227TriangleData1384.coefficient107_177,
  OriginalRow227TriangleData1384.coefficient107_178,
  OriginalRow227TriangleData1384.coefficient107_179,
  OriginalRow227TriangleData1384.coefficient107_180,
  OriginalRow227TriangleData1384.coefficient107_181,
  OriginalRow227TriangleData1384.coefficient107_182,
  OriginalRow227TriangleData1384.coefficient107_183,
  OriginalRow227TriangleData1384.coefficient107_184,
  OriginalRow227TriangleData1384.coefficient107_185,
  OriginalRow227TriangleData1384.coefficient107_186,
  OriginalRow227TriangleData1384.coefficient107_187,
  OriginalRow227TriangleData1384.coefficient107_188,
  OriginalRow227TriangleData1384.coefficient107_189,
  OriginalRow227TriangleData1384.coefficient107_190,
  OriginalRow227TriangleData1384.coefficient107_191,
  OriginalRow227TriangleData1384.coefficient107_192,
  OriginalRow227TriangleData1384.coefficient107_193,
  OriginalRow227TriangleData1384.coefficient107_194,
  OriginalRow227TriangleData1384.coefficient107_195,
  OriginalRow227TriangleData1384.coefficient107_196,
  OriginalRow227TriangleData1384.coefficient107_197,
  OriginalRow227TriangleData1384.coefficient107_198,
  OriginalRow227TriangleData1384.coefficient107_199,
  OriginalRow227TriangleData1384.coefficient107_200,
  OriginalRow227TriangleData1384.coefficient107_201
]

theorem values1384_size : values1384.size = 32 := rfl

def block1384 : ℕ → Option IntervalDyadic := segment 170 values1384

theorem block1384_domain : ExactDomain block1384 170 202 := by
  simpa only [values1384_size] using segment_domain 170 values1384

theorem block1384_get (i : Fin 32) :
    block1384 (170 + i.val) = some (values1384[i.val]'(by rw [values1384_size]; exact i.isLt)) := by
  exact segment_get 170 values1384 ⟨i.val, by rw [values1384_size]; exact i.isLt⟩

def values1385 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1385.coefficient107_202,
  OriginalRow227TriangleData1385.coefficient107_203,
  OriginalRow227TriangleData1385.coefficient107_204,
  OriginalRow227TriangleData1385.coefficient107_205,
  OriginalRow227TriangleData1385.coefficient107_206,
  OriginalRow227TriangleData1385.coefficient107_207,
  OriginalRow227TriangleData1385.coefficient107_208,
  OriginalRow227TriangleData1385.coefficient107_209,
  OriginalRow227TriangleData1385.coefficient107_210,
  OriginalRow227TriangleData1385.coefficient107_211,
  OriginalRow227TriangleData1385.coefficient107_212,
  OriginalRow227TriangleData1385.coefficient107_213,
  OriginalRow227TriangleData1385.coefficient107_214,
  OriginalRow227TriangleData1385.coefficient107_215,
  OriginalRow227TriangleData1385.coefficient107_216,
  OriginalRow227TriangleData1385.coefficient107_217,
  OriginalRow227TriangleData1385.coefficient107_218,
  OriginalRow227TriangleData1385.coefficient107_219,
  OriginalRow227TriangleData1385.coefficient107_220,
  OriginalRow227TriangleData1385.coefficient107_221,
  OriginalRow227TriangleData1385.coefficient107_222,
  OriginalRow227TriangleData1385.coefficient107_223,
  OriginalRow227TriangleData1385.coefficient107_224,
  OriginalRow227TriangleData1385.coefficient107_225,
  OriginalRow227TriangleData1385.coefficient107_226,
  OriginalRow227TriangleData1385.coefficient107_227,
  OriginalRow227TriangleData1385.coefficient107_228,
  OriginalRow227TriangleData1385.coefficient107_229,
  OriginalRow227TriangleData1385.coefficient107_230,
  OriginalRow227TriangleData1385.coefficient107_231,
  OriginalRow227TriangleData1385.coefficient107_232,
  OriginalRow227TriangleData1385.coefficient107_233
]

theorem values1385_size : values1385.size = 32 := rfl

def block1385 : ℕ → Option IntervalDyadic := segment 202 values1385

theorem block1385_domain : ExactDomain block1385 202 234 := by
  simpa only [values1385_size] using segment_domain 202 values1385

theorem block1385_get (i : Fin 32) :
    block1385 (202 + i.val) = some (values1385[i.val]'(by rw [values1385_size]; exact i.isLt)) := by
  exact segment_get 202 values1385 ⟨i.val, by rw [values1385_size]; exact i.isLt⟩

def values1386 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1386.coefficient107_234,
  OriginalRow227TriangleData1386.coefficient107_235,
  OriginalRow227TriangleData1386.coefficient107_236,
  OriginalRow227TriangleData1386.coefficient107_237,
  OriginalRow227TriangleData1386.coefficient107_238,
  OriginalRow227TriangleData1386.coefficient107_239,
  OriginalRow227TriangleData1386.coefficient107_240,
  OriginalRow227TriangleData1386.coefficient107_241,
  OriginalRow227TriangleData1386.coefficient107_242,
  OriginalRow227TriangleData1386.coefficient107_243,
  OriginalRow227TriangleData1386.coefficient107_244,
  OriginalRow227TriangleData1386.coefficient107_245,
  OriginalRow227TriangleData1386.coefficient107_246,
  OriginalRow227TriangleData1386.coefficient107_247,
  OriginalRow227TriangleData1386.coefficient107_248,
  OriginalRow227TriangleData1386.coefficient107_249,
  OriginalRow227TriangleData1386.coefficient107_250,
  OriginalRow227TriangleData1386.coefficient107_251,
  OriginalRow227TriangleData1386.coefficient107_252,
  OriginalRow227TriangleData1386.coefficient107_253,
  OriginalRow227TriangleData1386.coefficient107_254,
  OriginalRow227TriangleData1386.coefficient107_255,
  OriginalRow227TriangleData1386.coefficient107_256,
  OriginalRow227TriangleData1386.coefficient107_257,
  OriginalRow227TriangleData1386.coefficient107_258,
  OriginalRow227TriangleData1386.coefficient107_259,
  OriginalRow227TriangleData1386.coefficient107_260,
  OriginalRow227TriangleData1386.coefficient107_261,
  OriginalRow227TriangleData1386.coefficient107_262,
  OriginalRow227TriangleData1386.coefficient107_263,
  OriginalRow227TriangleData1386.coefficient107_264,
  OriginalRow227TriangleData1386.coefficient107_265
]

theorem values1386_size : values1386.size = 32 := rfl

def block1386 : ℕ → Option IntervalDyadic := segment 234 values1386

theorem block1386_domain : ExactDomain block1386 234 266 := by
  simpa only [values1386_size] using segment_domain 234 values1386

theorem block1386_get (i : Fin 32) :
    block1386 (234 + i.val) = some (values1386[i.val]'(by rw [values1386_size]; exact i.isLt)) := by
  exact segment_get 234 values1386 ⟨i.val, by rw [values1386_size]; exact i.isLt⟩

def values1387 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1387.coefficient107_266,
  OriginalRow227TriangleData1387.coefficient107_267,
  OriginalRow227TriangleData1387.coefficient107_268,
  OriginalRow227TriangleData1387.coefficient107_269,
  OriginalRow227TriangleData1387.coefficient107_270,
  OriginalRow227TriangleData1387.coefficient107_271,
  OriginalRow227TriangleData1387.coefficient107_272,
  OriginalRow227TriangleData1387.coefficient107_273,
  OriginalRow227TriangleData1387.coefficient107_274,
  OriginalRow227TriangleData1387.coefficient107_275,
  OriginalRow227TriangleData1387.coefficient107_276,
  OriginalRow227TriangleData1387.coefficient107_277,
  OriginalRow227TriangleData1387.coefficient107_278,
  OriginalRow227TriangleData1387.coefficient107_279,
  OriginalRow227TriangleData1387.coefficient107_280,
  OriginalRow227TriangleData1387.coefficient107_281,
  OriginalRow227TriangleData1387.coefficient107_282,
  OriginalRow227TriangleData1387.coefficient107_283,
  OriginalRow227TriangleData1387.coefficient107_284,
  OriginalRow227TriangleData1387.coefficient107_285,
  OriginalRow227TriangleData1387.coefficient107_286,
  OriginalRow227TriangleData1387.coefficient107_287,
  OriginalRow227TriangleData1387.coefficient107_288,
  OriginalRow227TriangleData1387.coefficient107_289,
  OriginalRow227TriangleData1387.coefficient107_290,
  OriginalRow227TriangleData1387.coefficient107_291,
  OriginalRow227TriangleData1387.coefficient107_292,
  OriginalRow227TriangleData1387.coefficient107_293,
  OriginalRow227TriangleData1387.coefficient107_294,
  OriginalRow227TriangleData1387.coefficient107_295,
  OriginalRow227TriangleData1387.coefficient107_296,
  OriginalRow227TriangleData1387.coefficient107_297
]

theorem values1387_size : values1387.size = 32 := rfl

def block1387 : ℕ → Option IntervalDyadic := segment 266 values1387

theorem block1387_domain : ExactDomain block1387 266 298 := by
  simpa only [values1387_size] using segment_domain 266 values1387

theorem block1387_get (i : Fin 32) :
    block1387 (266 + i.val) = some (values1387[i.val]'(by rw [values1387_size]; exact i.isLt)) := by
  exact segment_get 266 values1387 ⟨i.val, by rw [values1387_size]; exact i.isLt⟩

def values1388 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1388.coefficient107_298,
  OriginalRow227TriangleData1388.coefficient107_299,
  OriginalRow227TriangleData1388.coefficient107_300,
  OriginalRow227TriangleData1388.coefficient107_301,
  OriginalRow227TriangleData1388.coefficient107_302,
  OriginalRow227TriangleData1388.coefficient107_303,
  OriginalRow227TriangleData1388.coefficient107_304,
  OriginalRow227TriangleData1388.coefficient107_305,
  OriginalRow227TriangleData1388.coefficient107_306,
  OriginalRow227TriangleData1388.coefficient107_307,
  OriginalRow227TriangleData1388.coefficient107_308,
  OriginalRow227TriangleData1388.coefficient107_309,
  OriginalRow227TriangleData1388.coefficient107_310,
  OriginalRow227TriangleData1388.coefficient107_311,
  OriginalRow227TriangleData1388.coefficient107_312,
  OriginalRow227TriangleData1388.coefficient107_313,
  OriginalRow227TriangleData1388.coefficient107_314,
  OriginalRow227TriangleData1388.coefficient107_315,
  OriginalRow227TriangleData1388.coefficient107_316,
  OriginalRow227TriangleData1388.coefficient107_317,
  OriginalRow227TriangleData1388.coefficient107_318,
  OriginalRow227TriangleData1388.coefficient107_319,
  OriginalRow227TriangleData1388.coefficient107_320,
  OriginalRow227TriangleData1388.coefficient107_321,
  OriginalRow227TriangleData1388.coefficient107_322,
  OriginalRow227TriangleData1388.coefficient107_323,
  OriginalRow227TriangleData1388.coefficient107_324,
  OriginalRow227TriangleData1388.coefficient107_325,
  OriginalRow227TriangleData1388.coefficient107_326,
  OriginalRow227TriangleData1388.coefficient107_327,
  OriginalRow227TriangleData1388.coefficient107_328,
  OriginalRow227TriangleData1388.coefficient107_329
]

theorem values1388_size : values1388.size = 32 := rfl

def block1388 : ℕ → Option IntervalDyadic := segment 298 values1388

theorem block1388_domain : ExactDomain block1388 298 330 := by
  simpa only [values1388_size] using segment_domain 298 values1388

theorem block1388_get (i : Fin 32) :
    block1388 (298 + i.val) = some (values1388[i.val]'(by rw [values1388_size]; exact i.isLt)) := by
  exact segment_get 298 values1388 ⟨i.val, by rw [values1388_size]; exact i.isLt⟩

def values1389 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1389.coefficient107_330,
  OriginalRow227TriangleData1389.coefficient107_331,
  OriginalRow227TriangleData1389.coefficient107_332,
  OriginalRow227TriangleData1389.coefficient107_333,
  OriginalRow227TriangleData1389.coefficient107_334,
  OriginalRow227TriangleData1389.coefficient107_335,
  OriginalRow227TriangleData1389.coefficient107_336,
  OriginalRow227TriangleData1389.coefficient107_337,
  OriginalRow227TriangleData1389.coefficient107_338,
  OriginalRow227TriangleData1389.coefficient107_339,
  OriginalRow227TriangleData1389.coefficient107_340,
  OriginalRow227TriangleData1389.coefficient107_341,
  OriginalRow227TriangleData1389.coefficient107_342,
  OriginalRow227TriangleData1389.coefficient107_343,
  OriginalRow227TriangleData1389.coefficient107_344,
  OriginalRow227TriangleData1389.coefficient107_345,
  OriginalRow227TriangleData1389.coefficient107_346,
  OriginalRow227TriangleData1389.coefficient107_347,
  OriginalRow227TriangleData1389.coefficient107_348,
  OriginalRow227TriangleData1389.coefficient107_349,
  OriginalRow227TriangleData1389.coefficient107_350,
  OriginalRow227TriangleData1389.coefficient107_351,
  OriginalRow227TriangleData1389.coefficient107_352,
  OriginalRow227TriangleData1389.coefficient107_353,
  OriginalRow227TriangleData1389.coefficient107_354,
  OriginalRow227TriangleData1389.coefficient107_355,
  OriginalRow227TriangleData1389.coefficient107_356,
  OriginalRow227TriangleData1389.coefficient107_357,
  OriginalRow227TriangleData1389.coefficient107_358,
  OriginalRow227TriangleData1389.coefficient107_359,
  OriginalRow227TriangleData1389.coefficient107_360,
  OriginalRow227TriangleData1389.coefficient107_361
]

theorem values1389_size : values1389.size = 32 := rfl

def block1389 : ℕ → Option IntervalDyadic := segment 330 values1389

theorem block1389_domain : ExactDomain block1389 330 362 := by
  simpa only [values1389_size] using segment_domain 330 values1389

theorem block1389_get (i : Fin 32) :
    block1389 (330 + i.val) = some (values1389[i.val]'(by rw [values1389_size]; exact i.isLt)) := by
  exact segment_get 330 values1389 ⟨i.val, by rw [values1389_size]; exact i.isLt⟩

def values1390 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1390.coefficient107_362,
  OriginalRow227TriangleData1390.coefficient107_363,
  OriginalRow227TriangleData1390.coefficient107_364,
  OriginalRow227TriangleData1390.coefficient107_365,
  OriginalRow227TriangleData1390.coefficient107_366,
  OriginalRow227TriangleData1390.coefficient107_367,
  OriginalRow227TriangleData1390.coefficient107_368,
  OriginalRow227TriangleData1390.coefficient107_369,
  OriginalRow227TriangleData1390.coefficient107_370,
  OriginalRow227TriangleData1390.coefficient107_371,
  OriginalRow227TriangleData1390.coefficient107_372,
  OriginalRow227TriangleData1390.coefficient107_373,
  OriginalRow227TriangleData1390.coefficient107_374,
  OriginalRow227TriangleData1390.coefficient107_375,
  OriginalRow227TriangleData1390.coefficient107_376,
  OriginalRow227TriangleData1390.coefficient107_377,
  OriginalRow227TriangleData1390.coefficient107_378,
  OriginalRow227TriangleData1390.coefficient107_379,
  OriginalRow227TriangleData1390.coefficient107_380,
  OriginalRow227TriangleData1390.coefficient107_381,
  OriginalRow227TriangleData1390.coefficient107_382,
  OriginalRow227TriangleData1390.coefficient107_383,
  OriginalRow227TriangleData1390.coefficient107_384,
  OriginalRow227TriangleData1390.coefficient107_385,
  OriginalRow227TriangleData1390.coefficient107_386,
  OriginalRow227TriangleData1390.coefficient107_387,
  OriginalRow227TriangleData1390.coefficient107_388,
  OriginalRow227TriangleData1390.coefficient107_389,
  OriginalRow227TriangleData1390.coefficient107_390,
  OriginalRow227TriangleData1390.coefficient107_391,
  OriginalRow227TriangleData1390.coefficient107_392,
  OriginalRow227TriangleData1390.coefficient107_393
]

theorem values1390_size : values1390.size = 32 := rfl

def block1390 : ℕ → Option IntervalDyadic := segment 362 values1390

theorem block1390_domain : ExactDomain block1390 362 394 := by
  simpa only [values1390_size] using segment_domain 362 values1390

theorem block1390_get (i : Fin 32) :
    block1390 (362 + i.val) = some (values1390[i.val]'(by rw [values1390_size]; exact i.isLt)) := by
  exact segment_get 362 values1390 ⟨i.val, by rw [values1390_size]; exact i.isLt⟩

def values1391 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1391.coefficient107_394
]

theorem values1391_size : values1391.size = 1 := rfl

def block1391 : ℕ → Option IntervalDyadic := segment 394 values1391

theorem block1391_domain : ExactDomain block1391 394 395 := by
  simpa only [values1391_size] using segment_domain 394 values1391

theorem block1391_get (i : Fin 1) :
    block1391 (394 + i.val) = some (values1391[i.val]'(by rw [values1391_size]; exact i.isLt)) := by
  exact segment_get 394 values1391 ⟨i.val, by rw [values1391_size]; exact i.isLt⟩

def node0106_0170 : ℕ → Option IntervalDyadic := split 138 block1382 block1383

theorem node0106_0170_domain : ExactDomain node0106_0170 106 170 := by
  exact split_domain (by decide) (by decide) block1382_domain block1383_domain

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block1385 block1386

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block1385_domain block1386_domain

def node0170_0266 : ℕ → Option IntervalDyadic := split 202 block1384 node0202_0266

theorem node0170_0266_domain : ExactDomain node0170_0266 170 266 := by
  exact split_domain (by decide) (by decide) block1384_domain node0202_0266_domain

def node0106_0266 : ℕ → Option IntervalDyadic := split 170 node0106_0170 node0170_0266

theorem node0106_0266_domain : ExactDomain node0106_0266 106 266 := by
  exact split_domain (by decide) (by decide) node0106_0170_domain node0170_0266_domain

def node0266_0330 : ℕ → Option IntervalDyadic := split 298 block1387 block1388

theorem node0266_0330_domain : ExactDomain node0266_0330 266 330 := by
  exact split_domain (by decide) (by decide) block1387_domain block1388_domain

def node0362_0395 : ℕ → Option IntervalDyadic := split 394 block1390 block1391

theorem node0362_0395_domain : ExactDomain node0362_0395 362 395 := by
  exact split_domain (by decide) (by decide) block1390_domain block1391_domain

def node0330_0395 : ℕ → Option IntervalDyadic := split 362 block1389 node0362_0395

theorem node0330_0395_domain : ExactDomain node0330_0395 330 395 := by
  exact split_domain (by decide) (by decide) block1389_domain node0362_0395_domain

def node0266_0395 : ℕ → Option IntervalDyadic := split 330 node0266_0330 node0330_0395

theorem node0266_0395_domain : ExactDomain node0266_0395 266 395 := by
  exact split_domain (by decide) (by decide) node0266_0330_domain node0330_0395_domain

def node0106_0395 : ℕ → Option IntervalDyadic := split 266 node0106_0266 node0266_0395

theorem node0106_0395_domain : ExactDomain node0106_0395 106 395 := by
  exact split_domain (by decide) (by decide) node0106_0266_domain node0266_0395_domain

def lookup : ℕ → Option IntervalDyadic := node0106_0395

theorem lookup_domain : ExactDomain lookup 106 395 :=
  node0106_0395_domain

theorem block1382_lookup (i : Fin 32) :
    lookup (106 + i.val) = some (values1382[i.val]'(by rw [values1382_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (106 + i.val) = _
  rw [node0106_0395, split_left 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0106_0266, split_left 170 node0106_0170 node0170_0266 (by omega)]
  rw [node0106_0170, split_left 138 block1382 block1383 (by omega)]
  exact block1382_get i

theorem block1383_lookup (i : Fin 32) :
    lookup (138 + i.val) = some (values1383[i.val]'(by rw [values1383_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (138 + i.val) = _
  rw [node0106_0395, split_left 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0106_0266, split_left 170 node0106_0170 node0170_0266 (by omega)]
  rw [node0106_0170, split_right 138 block1382 block1383 (by omega)]
  exact block1383_get i

theorem block1384_lookup (i : Fin 32) :
    lookup (170 + i.val) = some (values1384[i.val]'(by rw [values1384_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (170 + i.val) = _
  rw [node0106_0395, split_left 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0106_0266, split_right 170 node0106_0170 node0170_0266 (by omega)]
  rw [node0170_0266, split_left 202 block1384 node0202_0266 (by omega)]
  exact block1384_get i

theorem block1385_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values1385[i.val]'(by rw [values1385_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (202 + i.val) = _
  rw [node0106_0395, split_left 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0106_0266, split_right 170 node0106_0170 node0170_0266 (by omega)]
  rw [node0170_0266, split_right 202 block1384 node0202_0266 (by omega)]
  rw [node0202_0266, split_left 234 block1385 block1386 (by omega)]
  exact block1385_get i

theorem block1386_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values1386[i.val]'(by rw [values1386_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (234 + i.val) = _
  rw [node0106_0395, split_left 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0106_0266, split_right 170 node0106_0170 node0170_0266 (by omega)]
  rw [node0170_0266, split_right 202 block1384 node0202_0266 (by omega)]
  rw [node0202_0266, split_right 234 block1385 block1386 (by omega)]
  exact block1386_get i

theorem block1387_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values1387[i.val]'(by rw [values1387_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (266 + i.val) = _
  rw [node0106_0395, split_right 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0266_0395, split_left 330 node0266_0330 node0330_0395 (by omega)]
  rw [node0266_0330, split_left 298 block1387 block1388 (by omega)]
  exact block1387_get i

theorem block1388_lookup (i : Fin 32) :
    lookup (298 + i.val) = some (values1388[i.val]'(by rw [values1388_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (298 + i.val) = _
  rw [node0106_0395, split_right 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0266_0395, split_left 330 node0266_0330 node0330_0395 (by omega)]
  rw [node0266_0330, split_right 298 block1387 block1388 (by omega)]
  exact block1388_get i

theorem block1389_lookup (i : Fin 32) :
    lookup (330 + i.val) = some (values1389[i.val]'(by rw [values1389_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (330 + i.val) = _
  rw [node0106_0395, split_right 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0266_0395, split_right 330 node0266_0330 node0330_0395 (by omega)]
  rw [node0330_0395, split_left 362 block1389 node0362_0395 (by omega)]
  exact block1389_get i

theorem block1390_lookup (i : Fin 32) :
    lookup (362 + i.val) = some (values1390[i.val]'(by rw [values1390_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (362 + i.val) = _
  rw [node0106_0395, split_right 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0266_0395, split_right 330 node0266_0330 node0330_0395 (by omega)]
  rw [node0330_0395, split_right 362 block1389 node0362_0395 (by omega)]
  rw [node0362_0395, split_left 394 block1390 block1391 (by omega)]
  exact block1390_get i

theorem block1391_lookup (i : Fin 1) :
    lookup (394 + i.val) = some (values1391[i.val]'(by rw [values1391_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0106_0395 (394 + i.val) = _
  rw [node0106_0395, split_right 266 node0106_0266 node0266_0395 (by omega)]
  rw [node0266_0395, split_right 330 node0266_0330 node0330_0395 (by omega)]
  rw [node0330_0395, split_right 362 block1389 node0362_0395 (by omega)]
  rw [node0362_0395, split_right 394 block1390 block1391 (by omega)]
  exact block1391_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1382_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1382_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1383_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1383_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1384_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1384_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1385_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1385_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1386_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1386_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1387_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1387_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1388_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1388_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1389_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1389_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1390_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1390_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1391_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1391_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1382_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1383_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1384_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1385_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1386_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1387_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1388_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1389_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1390_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow107.block1391_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow107
