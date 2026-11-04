import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1401
import Grothe.UpperChaos.OriginalRow227TriangleData1402
import Grothe.UpperChaos.OriginalRow227TriangleData1403
import Grothe.UpperChaos.OriginalRow227TriangleData1404
import Grothe.UpperChaos.OriginalRow227TriangleData1405
import Grothe.UpperChaos.OriginalRow227TriangleData1406
import Grothe.UpperChaos.OriginalRow227TriangleData1407
import Grothe.UpperChaos.OriginalRow227TriangleData1408
import Grothe.UpperChaos.OriginalRow227TriangleData1409

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow109

open ConditionalTableLookup

def values1401 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1401.coefficient109_108,
  OriginalRow227TriangleData1401.coefficient109_109,
  OriginalRow227TriangleData1401.coefficient109_110,
  OriginalRow227TriangleData1401.coefficient109_111,
  OriginalRow227TriangleData1401.coefficient109_112,
  OriginalRow227TriangleData1401.coefficient109_113,
  OriginalRow227TriangleData1401.coefficient109_114,
  OriginalRow227TriangleData1401.coefficient109_115,
  OriginalRow227TriangleData1401.coefficient109_116,
  OriginalRow227TriangleData1401.coefficient109_117,
  OriginalRow227TriangleData1401.coefficient109_118,
  OriginalRow227TriangleData1401.coefficient109_119,
  OriginalRow227TriangleData1401.coefficient109_120,
  OriginalRow227TriangleData1401.coefficient109_121,
  OriginalRow227TriangleData1401.coefficient109_122,
  OriginalRow227TriangleData1401.coefficient109_123,
  OriginalRow227TriangleData1401.coefficient109_124,
  OriginalRow227TriangleData1401.coefficient109_125,
  OriginalRow227TriangleData1401.coefficient109_126,
  OriginalRow227TriangleData1401.coefficient109_127,
  OriginalRow227TriangleData1401.coefficient109_128,
  OriginalRow227TriangleData1401.coefficient109_129,
  OriginalRow227TriangleData1401.coefficient109_130,
  OriginalRow227TriangleData1401.coefficient109_131,
  OriginalRow227TriangleData1401.coefficient109_132,
  OriginalRow227TriangleData1401.coefficient109_133,
  OriginalRow227TriangleData1401.coefficient109_134,
  OriginalRow227TriangleData1401.coefficient109_135,
  OriginalRow227TriangleData1401.coefficient109_136,
  OriginalRow227TriangleData1401.coefficient109_137,
  OriginalRow227TriangleData1401.coefficient109_138,
  OriginalRow227TriangleData1401.coefficient109_139
]

theorem values1401_size : values1401.size = 32 := rfl

def block1401 : ℕ → Option IntervalDyadic := segment 108 values1401

theorem block1401_domain : ExactDomain block1401 108 140 := by
  simpa only [values1401_size] using segment_domain 108 values1401

theorem block1401_get (i : Fin 32) :
    block1401 (108 + i.val) = some (values1401[i.val]'(by rw [values1401_size]; exact i.isLt)) := by
  exact segment_get 108 values1401 ⟨i.val, by rw [values1401_size]; exact i.isLt⟩

def values1402 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1402.coefficient109_140,
  OriginalRow227TriangleData1402.coefficient109_141,
  OriginalRow227TriangleData1402.coefficient109_142,
  OriginalRow227TriangleData1402.coefficient109_143,
  OriginalRow227TriangleData1402.coefficient109_144,
  OriginalRow227TriangleData1402.coefficient109_145,
  OriginalRow227TriangleData1402.coefficient109_146,
  OriginalRow227TriangleData1402.coefficient109_147,
  OriginalRow227TriangleData1402.coefficient109_148,
  OriginalRow227TriangleData1402.coefficient109_149,
  OriginalRow227TriangleData1402.coefficient109_150,
  OriginalRow227TriangleData1402.coefficient109_151,
  OriginalRow227TriangleData1402.coefficient109_152,
  OriginalRow227TriangleData1402.coefficient109_153,
  OriginalRow227TriangleData1402.coefficient109_154,
  OriginalRow227TriangleData1402.coefficient109_155,
  OriginalRow227TriangleData1402.coefficient109_156,
  OriginalRow227TriangleData1402.coefficient109_157,
  OriginalRow227TriangleData1402.coefficient109_158,
  OriginalRow227TriangleData1402.coefficient109_159,
  OriginalRow227TriangleData1402.coefficient109_160,
  OriginalRow227TriangleData1402.coefficient109_161,
  OriginalRow227TriangleData1402.coefficient109_162,
  OriginalRow227TriangleData1402.coefficient109_163,
  OriginalRow227TriangleData1402.coefficient109_164,
  OriginalRow227TriangleData1402.coefficient109_165,
  OriginalRow227TriangleData1402.coefficient109_166,
  OriginalRow227TriangleData1402.coefficient109_167,
  OriginalRow227TriangleData1402.coefficient109_168,
  OriginalRow227TriangleData1402.coefficient109_169,
  OriginalRow227TriangleData1402.coefficient109_170,
  OriginalRow227TriangleData1402.coefficient109_171
]

theorem values1402_size : values1402.size = 32 := rfl

def block1402 : ℕ → Option IntervalDyadic := segment 140 values1402

theorem block1402_domain : ExactDomain block1402 140 172 := by
  simpa only [values1402_size] using segment_domain 140 values1402

theorem block1402_get (i : Fin 32) :
    block1402 (140 + i.val) = some (values1402[i.val]'(by rw [values1402_size]; exact i.isLt)) := by
  exact segment_get 140 values1402 ⟨i.val, by rw [values1402_size]; exact i.isLt⟩

def values1403 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1403.coefficient109_172,
  OriginalRow227TriangleData1403.coefficient109_173,
  OriginalRow227TriangleData1403.coefficient109_174,
  OriginalRow227TriangleData1403.coefficient109_175,
  OriginalRow227TriangleData1403.coefficient109_176,
  OriginalRow227TriangleData1403.coefficient109_177,
  OriginalRow227TriangleData1403.coefficient109_178,
  OriginalRow227TriangleData1403.coefficient109_179,
  OriginalRow227TriangleData1403.coefficient109_180,
  OriginalRow227TriangleData1403.coefficient109_181,
  OriginalRow227TriangleData1403.coefficient109_182,
  OriginalRow227TriangleData1403.coefficient109_183,
  OriginalRow227TriangleData1403.coefficient109_184,
  OriginalRow227TriangleData1403.coefficient109_185,
  OriginalRow227TriangleData1403.coefficient109_186,
  OriginalRow227TriangleData1403.coefficient109_187,
  OriginalRow227TriangleData1403.coefficient109_188,
  OriginalRow227TriangleData1403.coefficient109_189,
  OriginalRow227TriangleData1403.coefficient109_190,
  OriginalRow227TriangleData1403.coefficient109_191,
  OriginalRow227TriangleData1403.coefficient109_192,
  OriginalRow227TriangleData1403.coefficient109_193,
  OriginalRow227TriangleData1403.coefficient109_194,
  OriginalRow227TriangleData1403.coefficient109_195,
  OriginalRow227TriangleData1403.coefficient109_196,
  OriginalRow227TriangleData1403.coefficient109_197,
  OriginalRow227TriangleData1403.coefficient109_198,
  OriginalRow227TriangleData1403.coefficient109_199,
  OriginalRow227TriangleData1403.coefficient109_200,
  OriginalRow227TriangleData1403.coefficient109_201,
  OriginalRow227TriangleData1403.coefficient109_202,
  OriginalRow227TriangleData1403.coefficient109_203
]

theorem values1403_size : values1403.size = 32 := rfl

def block1403 : ℕ → Option IntervalDyadic := segment 172 values1403

theorem block1403_domain : ExactDomain block1403 172 204 := by
  simpa only [values1403_size] using segment_domain 172 values1403

theorem block1403_get (i : Fin 32) :
    block1403 (172 + i.val) = some (values1403[i.val]'(by rw [values1403_size]; exact i.isLt)) := by
  exact segment_get 172 values1403 ⟨i.val, by rw [values1403_size]; exact i.isLt⟩

def values1404 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1404.coefficient109_204,
  OriginalRow227TriangleData1404.coefficient109_205,
  OriginalRow227TriangleData1404.coefficient109_206,
  OriginalRow227TriangleData1404.coefficient109_207,
  OriginalRow227TriangleData1404.coefficient109_208,
  OriginalRow227TriangleData1404.coefficient109_209,
  OriginalRow227TriangleData1404.coefficient109_210,
  OriginalRow227TriangleData1404.coefficient109_211,
  OriginalRow227TriangleData1404.coefficient109_212,
  OriginalRow227TriangleData1404.coefficient109_213,
  OriginalRow227TriangleData1404.coefficient109_214,
  OriginalRow227TriangleData1404.coefficient109_215,
  OriginalRow227TriangleData1404.coefficient109_216,
  OriginalRow227TriangleData1404.coefficient109_217,
  OriginalRow227TriangleData1404.coefficient109_218,
  OriginalRow227TriangleData1404.coefficient109_219,
  OriginalRow227TriangleData1404.coefficient109_220,
  OriginalRow227TriangleData1404.coefficient109_221,
  OriginalRow227TriangleData1404.coefficient109_222,
  OriginalRow227TriangleData1404.coefficient109_223,
  OriginalRow227TriangleData1404.coefficient109_224,
  OriginalRow227TriangleData1404.coefficient109_225,
  OriginalRow227TriangleData1404.coefficient109_226,
  OriginalRow227TriangleData1404.coefficient109_227,
  OriginalRow227TriangleData1404.coefficient109_228,
  OriginalRow227TriangleData1404.coefficient109_229,
  OriginalRow227TriangleData1404.coefficient109_230,
  OriginalRow227TriangleData1404.coefficient109_231,
  OriginalRow227TriangleData1404.coefficient109_232,
  OriginalRow227TriangleData1404.coefficient109_233,
  OriginalRow227TriangleData1404.coefficient109_234,
  OriginalRow227TriangleData1404.coefficient109_235
]

theorem values1404_size : values1404.size = 32 := rfl

def block1404 : ℕ → Option IntervalDyadic := segment 204 values1404

theorem block1404_domain : ExactDomain block1404 204 236 := by
  simpa only [values1404_size] using segment_domain 204 values1404

theorem block1404_get (i : Fin 32) :
    block1404 (204 + i.val) = some (values1404[i.val]'(by rw [values1404_size]; exact i.isLt)) := by
  exact segment_get 204 values1404 ⟨i.val, by rw [values1404_size]; exact i.isLt⟩

def values1405 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1405.coefficient109_236,
  OriginalRow227TriangleData1405.coefficient109_237,
  OriginalRow227TriangleData1405.coefficient109_238,
  OriginalRow227TriangleData1405.coefficient109_239,
  OriginalRow227TriangleData1405.coefficient109_240,
  OriginalRow227TriangleData1405.coefficient109_241,
  OriginalRow227TriangleData1405.coefficient109_242,
  OriginalRow227TriangleData1405.coefficient109_243,
  OriginalRow227TriangleData1405.coefficient109_244,
  OriginalRow227TriangleData1405.coefficient109_245,
  OriginalRow227TriangleData1405.coefficient109_246,
  OriginalRow227TriangleData1405.coefficient109_247,
  OriginalRow227TriangleData1405.coefficient109_248,
  OriginalRow227TriangleData1405.coefficient109_249,
  OriginalRow227TriangleData1405.coefficient109_250,
  OriginalRow227TriangleData1405.coefficient109_251,
  OriginalRow227TriangleData1405.coefficient109_252,
  OriginalRow227TriangleData1405.coefficient109_253,
  OriginalRow227TriangleData1405.coefficient109_254,
  OriginalRow227TriangleData1405.coefficient109_255,
  OriginalRow227TriangleData1405.coefficient109_256,
  OriginalRow227TriangleData1405.coefficient109_257,
  OriginalRow227TriangleData1405.coefficient109_258,
  OriginalRow227TriangleData1405.coefficient109_259,
  OriginalRow227TriangleData1405.coefficient109_260,
  OriginalRow227TriangleData1405.coefficient109_261,
  OriginalRow227TriangleData1405.coefficient109_262,
  OriginalRow227TriangleData1405.coefficient109_263,
  OriginalRow227TriangleData1405.coefficient109_264,
  OriginalRow227TriangleData1405.coefficient109_265,
  OriginalRow227TriangleData1405.coefficient109_266,
  OriginalRow227TriangleData1405.coefficient109_267
]

theorem values1405_size : values1405.size = 32 := rfl

def block1405 : ℕ → Option IntervalDyadic := segment 236 values1405

theorem block1405_domain : ExactDomain block1405 236 268 := by
  simpa only [values1405_size] using segment_domain 236 values1405

theorem block1405_get (i : Fin 32) :
    block1405 (236 + i.val) = some (values1405[i.val]'(by rw [values1405_size]; exact i.isLt)) := by
  exact segment_get 236 values1405 ⟨i.val, by rw [values1405_size]; exact i.isLt⟩

def values1406 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1406.coefficient109_268,
  OriginalRow227TriangleData1406.coefficient109_269,
  OriginalRow227TriangleData1406.coefficient109_270,
  OriginalRow227TriangleData1406.coefficient109_271,
  OriginalRow227TriangleData1406.coefficient109_272,
  OriginalRow227TriangleData1406.coefficient109_273,
  OriginalRow227TriangleData1406.coefficient109_274,
  OriginalRow227TriangleData1406.coefficient109_275,
  OriginalRow227TriangleData1406.coefficient109_276,
  OriginalRow227TriangleData1406.coefficient109_277,
  OriginalRow227TriangleData1406.coefficient109_278,
  OriginalRow227TriangleData1406.coefficient109_279,
  OriginalRow227TriangleData1406.coefficient109_280,
  OriginalRow227TriangleData1406.coefficient109_281,
  OriginalRow227TriangleData1406.coefficient109_282,
  OriginalRow227TriangleData1406.coefficient109_283,
  OriginalRow227TriangleData1406.coefficient109_284,
  OriginalRow227TriangleData1406.coefficient109_285,
  OriginalRow227TriangleData1406.coefficient109_286,
  OriginalRow227TriangleData1406.coefficient109_287,
  OriginalRow227TriangleData1406.coefficient109_288,
  OriginalRow227TriangleData1406.coefficient109_289,
  OriginalRow227TriangleData1406.coefficient109_290,
  OriginalRow227TriangleData1406.coefficient109_291,
  OriginalRow227TriangleData1406.coefficient109_292,
  OriginalRow227TriangleData1406.coefficient109_293,
  OriginalRow227TriangleData1406.coefficient109_294,
  OriginalRow227TriangleData1406.coefficient109_295,
  OriginalRow227TriangleData1406.coefficient109_296,
  OriginalRow227TriangleData1406.coefficient109_297,
  OriginalRow227TriangleData1406.coefficient109_298,
  OriginalRow227TriangleData1406.coefficient109_299
]

theorem values1406_size : values1406.size = 32 := rfl

def block1406 : ℕ → Option IntervalDyadic := segment 268 values1406

theorem block1406_domain : ExactDomain block1406 268 300 := by
  simpa only [values1406_size] using segment_domain 268 values1406

theorem block1406_get (i : Fin 32) :
    block1406 (268 + i.val) = some (values1406[i.val]'(by rw [values1406_size]; exact i.isLt)) := by
  exact segment_get 268 values1406 ⟨i.val, by rw [values1406_size]; exact i.isLt⟩

def values1407 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1407.coefficient109_300,
  OriginalRow227TriangleData1407.coefficient109_301,
  OriginalRow227TriangleData1407.coefficient109_302,
  OriginalRow227TriangleData1407.coefficient109_303,
  OriginalRow227TriangleData1407.coefficient109_304,
  OriginalRow227TriangleData1407.coefficient109_305,
  OriginalRow227TriangleData1407.coefficient109_306,
  OriginalRow227TriangleData1407.coefficient109_307,
  OriginalRow227TriangleData1407.coefficient109_308,
  OriginalRow227TriangleData1407.coefficient109_309,
  OriginalRow227TriangleData1407.coefficient109_310,
  OriginalRow227TriangleData1407.coefficient109_311,
  OriginalRow227TriangleData1407.coefficient109_312,
  OriginalRow227TriangleData1407.coefficient109_313,
  OriginalRow227TriangleData1407.coefficient109_314,
  OriginalRow227TriangleData1407.coefficient109_315,
  OriginalRow227TriangleData1407.coefficient109_316,
  OriginalRow227TriangleData1407.coefficient109_317,
  OriginalRow227TriangleData1407.coefficient109_318,
  OriginalRow227TriangleData1407.coefficient109_319,
  OriginalRow227TriangleData1407.coefficient109_320,
  OriginalRow227TriangleData1407.coefficient109_321,
  OriginalRow227TriangleData1407.coefficient109_322,
  OriginalRow227TriangleData1407.coefficient109_323,
  OriginalRow227TriangleData1407.coefficient109_324,
  OriginalRow227TriangleData1407.coefficient109_325,
  OriginalRow227TriangleData1407.coefficient109_326,
  OriginalRow227TriangleData1407.coefficient109_327,
  OriginalRow227TriangleData1407.coefficient109_328,
  OriginalRow227TriangleData1407.coefficient109_329,
  OriginalRow227TriangleData1407.coefficient109_330,
  OriginalRow227TriangleData1407.coefficient109_331
]

theorem values1407_size : values1407.size = 32 := rfl

def block1407 : ℕ → Option IntervalDyadic := segment 300 values1407

theorem block1407_domain : ExactDomain block1407 300 332 := by
  simpa only [values1407_size] using segment_domain 300 values1407

theorem block1407_get (i : Fin 32) :
    block1407 (300 + i.val) = some (values1407[i.val]'(by rw [values1407_size]; exact i.isLt)) := by
  exact segment_get 300 values1407 ⟨i.val, by rw [values1407_size]; exact i.isLt⟩

def values1408 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1408.coefficient109_332,
  OriginalRow227TriangleData1408.coefficient109_333,
  OriginalRow227TriangleData1408.coefficient109_334,
  OriginalRow227TriangleData1408.coefficient109_335,
  OriginalRow227TriangleData1408.coefficient109_336,
  OriginalRow227TriangleData1408.coefficient109_337,
  OriginalRow227TriangleData1408.coefficient109_338,
  OriginalRow227TriangleData1408.coefficient109_339,
  OriginalRow227TriangleData1408.coefficient109_340,
  OriginalRow227TriangleData1408.coefficient109_341,
  OriginalRow227TriangleData1408.coefficient109_342,
  OriginalRow227TriangleData1408.coefficient109_343,
  OriginalRow227TriangleData1408.coefficient109_344,
  OriginalRow227TriangleData1408.coefficient109_345,
  OriginalRow227TriangleData1408.coefficient109_346,
  OriginalRow227TriangleData1408.coefficient109_347,
  OriginalRow227TriangleData1408.coefficient109_348,
  OriginalRow227TriangleData1408.coefficient109_349,
  OriginalRow227TriangleData1408.coefficient109_350,
  OriginalRow227TriangleData1408.coefficient109_351,
  OriginalRow227TriangleData1408.coefficient109_352,
  OriginalRow227TriangleData1408.coefficient109_353,
  OriginalRow227TriangleData1408.coefficient109_354,
  OriginalRow227TriangleData1408.coefficient109_355,
  OriginalRow227TriangleData1408.coefficient109_356,
  OriginalRow227TriangleData1408.coefficient109_357,
  OriginalRow227TriangleData1408.coefficient109_358,
  OriginalRow227TriangleData1408.coefficient109_359,
  OriginalRow227TriangleData1408.coefficient109_360,
  OriginalRow227TriangleData1408.coefficient109_361,
  OriginalRow227TriangleData1408.coefficient109_362,
  OriginalRow227TriangleData1408.coefficient109_363
]

theorem values1408_size : values1408.size = 32 := rfl

def block1408 : ℕ → Option IntervalDyadic := segment 332 values1408

theorem block1408_domain : ExactDomain block1408 332 364 := by
  simpa only [values1408_size] using segment_domain 332 values1408

theorem block1408_get (i : Fin 32) :
    block1408 (332 + i.val) = some (values1408[i.val]'(by rw [values1408_size]; exact i.isLt)) := by
  exact segment_get 332 values1408 ⟨i.val, by rw [values1408_size]; exact i.isLt⟩

def values1409 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1409.coefficient109_364,
  OriginalRow227TriangleData1409.coefficient109_365,
  OriginalRow227TriangleData1409.coefficient109_366,
  OriginalRow227TriangleData1409.coefficient109_367,
  OriginalRow227TriangleData1409.coefficient109_368,
  OriginalRow227TriangleData1409.coefficient109_369,
  OriginalRow227TriangleData1409.coefficient109_370,
  OriginalRow227TriangleData1409.coefficient109_371,
  OriginalRow227TriangleData1409.coefficient109_372,
  OriginalRow227TriangleData1409.coefficient109_373,
  OriginalRow227TriangleData1409.coefficient109_374,
  OriginalRow227TriangleData1409.coefficient109_375,
  OriginalRow227TriangleData1409.coefficient109_376,
  OriginalRow227TriangleData1409.coefficient109_377,
  OriginalRow227TriangleData1409.coefficient109_378,
  OriginalRow227TriangleData1409.coefficient109_379,
  OriginalRow227TriangleData1409.coefficient109_380,
  OriginalRow227TriangleData1409.coefficient109_381,
  OriginalRow227TriangleData1409.coefficient109_382,
  OriginalRow227TriangleData1409.coefficient109_383,
  OriginalRow227TriangleData1409.coefficient109_384,
  OriginalRow227TriangleData1409.coefficient109_385,
  OriginalRow227TriangleData1409.coefficient109_386,
  OriginalRow227TriangleData1409.coefficient109_387,
  OriginalRow227TriangleData1409.coefficient109_388,
  OriginalRow227TriangleData1409.coefficient109_389,
  OriginalRow227TriangleData1409.coefficient109_390,
  OriginalRow227TriangleData1409.coefficient109_391,
  OriginalRow227TriangleData1409.coefficient109_392
]

theorem values1409_size : values1409.size = 29 := rfl

def block1409 : ℕ → Option IntervalDyadic := segment 364 values1409

theorem block1409_domain : ExactDomain block1409 364 393 := by
  simpa only [values1409_size] using segment_domain 364 values1409

theorem block1409_get (i : Fin 29) :
    block1409 (364 + i.val) = some (values1409[i.val]'(by rw [values1409_size]; exact i.isLt)) := by
  exact segment_get 364 values1409 ⟨i.val, by rw [values1409_size]; exact i.isLt⟩

def node0108_0172 : ℕ → Option IntervalDyadic := split 140 block1401 block1402

theorem node0108_0172_domain : ExactDomain node0108_0172 108 172 := by
  exact split_domain (by decide) (by decide) block1401_domain block1402_domain

def node0172_0236 : ℕ → Option IntervalDyadic := split 204 block1403 block1404

theorem node0172_0236_domain : ExactDomain node0172_0236 172 236 := by
  exact split_domain (by decide) (by decide) block1403_domain block1404_domain

def node0108_0236 : ℕ → Option IntervalDyadic := split 172 node0108_0172 node0172_0236

theorem node0108_0236_domain : ExactDomain node0108_0236 108 236 := by
  exact split_domain (by decide) (by decide) node0108_0172_domain node0172_0236_domain

def node0236_0300 : ℕ → Option IntervalDyadic := split 268 block1405 block1406

theorem node0236_0300_domain : ExactDomain node0236_0300 236 300 := by
  exact split_domain (by decide) (by decide) block1405_domain block1406_domain

def node0332_0393 : ℕ → Option IntervalDyadic := split 364 block1408 block1409

theorem node0332_0393_domain : ExactDomain node0332_0393 332 393 := by
  exact split_domain (by decide) (by decide) block1408_domain block1409_domain

def node0300_0393 : ℕ → Option IntervalDyadic := split 332 block1407 node0332_0393

theorem node0300_0393_domain : ExactDomain node0300_0393 300 393 := by
  exact split_domain (by decide) (by decide) block1407_domain node0332_0393_domain

def node0236_0393 : ℕ → Option IntervalDyadic := split 300 node0236_0300 node0300_0393

theorem node0236_0393_domain : ExactDomain node0236_0393 236 393 := by
  exact split_domain (by decide) (by decide) node0236_0300_domain node0300_0393_domain

def node0108_0393 : ℕ → Option IntervalDyadic := split 236 node0108_0236 node0236_0393

theorem node0108_0393_domain : ExactDomain node0108_0393 108 393 := by
  exact split_domain (by decide) (by decide) node0108_0236_domain node0236_0393_domain

def lookup : ℕ → Option IntervalDyadic := node0108_0393

theorem lookup_domain : ExactDomain lookup 108 393 :=
  node0108_0393_domain

theorem block1401_lookup (i : Fin 32) :
    lookup (108 + i.val) = some (values1401[i.val]'(by rw [values1401_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (108 + i.val) = _
  rw [node0108_0393, split_left 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0108_0236, split_left 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0108_0172, split_left 140 block1401 block1402 (by omega)]
  exact block1401_get i

theorem block1402_lookup (i : Fin 32) :
    lookup (140 + i.val) = some (values1402[i.val]'(by rw [values1402_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (140 + i.val) = _
  rw [node0108_0393, split_left 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0108_0236, split_left 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0108_0172, split_right 140 block1401 block1402 (by omega)]
  exact block1402_get i

theorem block1403_lookup (i : Fin 32) :
    lookup (172 + i.val) = some (values1403[i.val]'(by rw [values1403_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (172 + i.val) = _
  rw [node0108_0393, split_left 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0108_0236, split_right 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0172_0236, split_left 204 block1403 block1404 (by omega)]
  exact block1403_get i

theorem block1404_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values1404[i.val]'(by rw [values1404_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (204 + i.val) = _
  rw [node0108_0393, split_left 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0108_0236, split_right 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0172_0236, split_right 204 block1403 block1404 (by omega)]
  exact block1404_get i

theorem block1405_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values1405[i.val]'(by rw [values1405_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (236 + i.val) = _
  rw [node0108_0393, split_right 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0236_0393, split_left 300 node0236_0300 node0300_0393 (by omega)]
  rw [node0236_0300, split_left 268 block1405 block1406 (by omega)]
  exact block1405_get i

theorem block1406_lookup (i : Fin 32) :
    lookup (268 + i.val) = some (values1406[i.val]'(by rw [values1406_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (268 + i.val) = _
  rw [node0108_0393, split_right 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0236_0393, split_left 300 node0236_0300 node0300_0393 (by omega)]
  rw [node0236_0300, split_right 268 block1405 block1406 (by omega)]
  exact block1406_get i

theorem block1407_lookup (i : Fin 32) :
    lookup (300 + i.val) = some (values1407[i.val]'(by rw [values1407_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (300 + i.val) = _
  rw [node0108_0393, split_right 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0236_0393, split_right 300 node0236_0300 node0300_0393 (by omega)]
  rw [node0300_0393, split_left 332 block1407 node0332_0393 (by omega)]
  exact block1407_get i

theorem block1408_lookup (i : Fin 32) :
    lookup (332 + i.val) = some (values1408[i.val]'(by rw [values1408_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (332 + i.val) = _
  rw [node0108_0393, split_right 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0236_0393, split_right 300 node0236_0300 node0300_0393 (by omega)]
  rw [node0300_0393, split_right 332 block1407 node0332_0393 (by omega)]
  rw [node0332_0393, split_left 364 block1408 block1409 (by omega)]
  exact block1408_get i

theorem block1409_lookup (i : Fin 29) :
    lookup (364 + i.val) = some (values1409[i.val]'(by rw [values1409_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0108_0393 (364 + i.val) = _
  rw [node0108_0393, split_right 236 node0108_0236 node0236_0393 (by omega)]
  rw [node0236_0393, split_right 300 node0236_0300 node0300_0393 (by omega)]
  rw [node0300_0393, split_right 332 block1407 node0332_0393 (by omega)]
  rw [node0332_0393, split_right 364 block1408 block1409 (by omega)]
  exact block1409_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1401_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1401_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1402_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1402_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1403_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1403_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1404_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1404_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1405_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1405_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1406_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1406_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1407_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1407_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1408_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1408_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1409_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1409_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1401_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1402_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1403_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1404_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1405_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1406_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1407_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1408_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow109.block1409_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow109
