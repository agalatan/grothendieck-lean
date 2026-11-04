import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1392
import Grothe.UpperChaos.OriginalRow227TriangleData1393
import Grothe.UpperChaos.OriginalRow227TriangleData1394
import Grothe.UpperChaos.OriginalRow227TriangleData1395
import Grothe.UpperChaos.OriginalRow227TriangleData1396
import Grothe.UpperChaos.OriginalRow227TriangleData1397
import Grothe.UpperChaos.OriginalRow227TriangleData1398
import Grothe.UpperChaos.OriginalRow227TriangleData1399
import Grothe.UpperChaos.OriginalRow227TriangleData1400

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow108

open ConditionalTableLookup

def values1392 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1392.coefficient108_107,
  OriginalRow227TriangleData1392.coefficient108_108,
  OriginalRow227TriangleData1392.coefficient108_109,
  OriginalRow227TriangleData1392.coefficient108_110,
  OriginalRow227TriangleData1392.coefficient108_111,
  OriginalRow227TriangleData1392.coefficient108_112,
  OriginalRow227TriangleData1392.coefficient108_113,
  OriginalRow227TriangleData1392.coefficient108_114,
  OriginalRow227TriangleData1392.coefficient108_115,
  OriginalRow227TriangleData1392.coefficient108_116,
  OriginalRow227TriangleData1392.coefficient108_117,
  OriginalRow227TriangleData1392.coefficient108_118,
  OriginalRow227TriangleData1392.coefficient108_119,
  OriginalRow227TriangleData1392.coefficient108_120,
  OriginalRow227TriangleData1392.coefficient108_121,
  OriginalRow227TriangleData1392.coefficient108_122,
  OriginalRow227TriangleData1392.coefficient108_123,
  OriginalRow227TriangleData1392.coefficient108_124,
  OriginalRow227TriangleData1392.coefficient108_125,
  OriginalRow227TriangleData1392.coefficient108_126,
  OriginalRow227TriangleData1392.coefficient108_127,
  OriginalRow227TriangleData1392.coefficient108_128,
  OriginalRow227TriangleData1392.coefficient108_129,
  OriginalRow227TriangleData1392.coefficient108_130,
  OriginalRow227TriangleData1392.coefficient108_131,
  OriginalRow227TriangleData1392.coefficient108_132,
  OriginalRow227TriangleData1392.coefficient108_133,
  OriginalRow227TriangleData1392.coefficient108_134,
  OriginalRow227TriangleData1392.coefficient108_135,
  OriginalRow227TriangleData1392.coefficient108_136,
  OriginalRow227TriangleData1392.coefficient108_137,
  OriginalRow227TriangleData1392.coefficient108_138
]

theorem values1392_size : values1392.size = 32 := rfl

def block1392 : ℕ → Option IntervalDyadic := segment 107 values1392

theorem block1392_domain : ExactDomain block1392 107 139 := by
  simpa only [values1392_size] using segment_domain 107 values1392

theorem block1392_get (i : Fin 32) :
    block1392 (107 + i.val) = some (values1392[i.val]'(by rw [values1392_size]; exact i.isLt)) := by
  exact segment_get 107 values1392 ⟨i.val, by rw [values1392_size]; exact i.isLt⟩

def values1393 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1393.coefficient108_139,
  OriginalRow227TriangleData1393.coefficient108_140,
  OriginalRow227TriangleData1393.coefficient108_141,
  OriginalRow227TriangleData1393.coefficient108_142,
  OriginalRow227TriangleData1393.coefficient108_143,
  OriginalRow227TriangleData1393.coefficient108_144,
  OriginalRow227TriangleData1393.coefficient108_145,
  OriginalRow227TriangleData1393.coefficient108_146,
  OriginalRow227TriangleData1393.coefficient108_147,
  OriginalRow227TriangleData1393.coefficient108_148,
  OriginalRow227TriangleData1393.coefficient108_149,
  OriginalRow227TriangleData1393.coefficient108_150,
  OriginalRow227TriangleData1393.coefficient108_151,
  OriginalRow227TriangleData1393.coefficient108_152,
  OriginalRow227TriangleData1393.coefficient108_153,
  OriginalRow227TriangleData1393.coefficient108_154,
  OriginalRow227TriangleData1393.coefficient108_155,
  OriginalRow227TriangleData1393.coefficient108_156,
  OriginalRow227TriangleData1393.coefficient108_157,
  OriginalRow227TriangleData1393.coefficient108_158,
  OriginalRow227TriangleData1393.coefficient108_159,
  OriginalRow227TriangleData1393.coefficient108_160,
  OriginalRow227TriangleData1393.coefficient108_161,
  OriginalRow227TriangleData1393.coefficient108_162,
  OriginalRow227TriangleData1393.coefficient108_163,
  OriginalRow227TriangleData1393.coefficient108_164,
  OriginalRow227TriangleData1393.coefficient108_165,
  OriginalRow227TriangleData1393.coefficient108_166,
  OriginalRow227TriangleData1393.coefficient108_167,
  OriginalRow227TriangleData1393.coefficient108_168,
  OriginalRow227TriangleData1393.coefficient108_169,
  OriginalRow227TriangleData1393.coefficient108_170
]

theorem values1393_size : values1393.size = 32 := rfl

def block1393 : ℕ → Option IntervalDyadic := segment 139 values1393

theorem block1393_domain : ExactDomain block1393 139 171 := by
  simpa only [values1393_size] using segment_domain 139 values1393

theorem block1393_get (i : Fin 32) :
    block1393 (139 + i.val) = some (values1393[i.val]'(by rw [values1393_size]; exact i.isLt)) := by
  exact segment_get 139 values1393 ⟨i.val, by rw [values1393_size]; exact i.isLt⟩

def values1394 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1394.coefficient108_171,
  OriginalRow227TriangleData1394.coefficient108_172,
  OriginalRow227TriangleData1394.coefficient108_173,
  OriginalRow227TriangleData1394.coefficient108_174,
  OriginalRow227TriangleData1394.coefficient108_175,
  OriginalRow227TriangleData1394.coefficient108_176,
  OriginalRow227TriangleData1394.coefficient108_177,
  OriginalRow227TriangleData1394.coefficient108_178,
  OriginalRow227TriangleData1394.coefficient108_179,
  OriginalRow227TriangleData1394.coefficient108_180,
  OriginalRow227TriangleData1394.coefficient108_181,
  OriginalRow227TriangleData1394.coefficient108_182,
  OriginalRow227TriangleData1394.coefficient108_183,
  OriginalRow227TriangleData1394.coefficient108_184,
  OriginalRow227TriangleData1394.coefficient108_185,
  OriginalRow227TriangleData1394.coefficient108_186,
  OriginalRow227TriangleData1394.coefficient108_187,
  OriginalRow227TriangleData1394.coefficient108_188,
  OriginalRow227TriangleData1394.coefficient108_189,
  OriginalRow227TriangleData1394.coefficient108_190,
  OriginalRow227TriangleData1394.coefficient108_191,
  OriginalRow227TriangleData1394.coefficient108_192,
  OriginalRow227TriangleData1394.coefficient108_193,
  OriginalRow227TriangleData1394.coefficient108_194,
  OriginalRow227TriangleData1394.coefficient108_195,
  OriginalRow227TriangleData1394.coefficient108_196,
  OriginalRow227TriangleData1394.coefficient108_197,
  OriginalRow227TriangleData1394.coefficient108_198,
  OriginalRow227TriangleData1394.coefficient108_199,
  OriginalRow227TriangleData1394.coefficient108_200,
  OriginalRow227TriangleData1394.coefficient108_201,
  OriginalRow227TriangleData1394.coefficient108_202
]

theorem values1394_size : values1394.size = 32 := rfl

def block1394 : ℕ → Option IntervalDyadic := segment 171 values1394

theorem block1394_domain : ExactDomain block1394 171 203 := by
  simpa only [values1394_size] using segment_domain 171 values1394

theorem block1394_get (i : Fin 32) :
    block1394 (171 + i.val) = some (values1394[i.val]'(by rw [values1394_size]; exact i.isLt)) := by
  exact segment_get 171 values1394 ⟨i.val, by rw [values1394_size]; exact i.isLt⟩

def values1395 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1395.coefficient108_203,
  OriginalRow227TriangleData1395.coefficient108_204,
  OriginalRow227TriangleData1395.coefficient108_205,
  OriginalRow227TriangleData1395.coefficient108_206,
  OriginalRow227TriangleData1395.coefficient108_207,
  OriginalRow227TriangleData1395.coefficient108_208,
  OriginalRow227TriangleData1395.coefficient108_209,
  OriginalRow227TriangleData1395.coefficient108_210,
  OriginalRow227TriangleData1395.coefficient108_211,
  OriginalRow227TriangleData1395.coefficient108_212,
  OriginalRow227TriangleData1395.coefficient108_213,
  OriginalRow227TriangleData1395.coefficient108_214,
  OriginalRow227TriangleData1395.coefficient108_215,
  OriginalRow227TriangleData1395.coefficient108_216,
  OriginalRow227TriangleData1395.coefficient108_217,
  OriginalRow227TriangleData1395.coefficient108_218,
  OriginalRow227TriangleData1395.coefficient108_219,
  OriginalRow227TriangleData1395.coefficient108_220,
  OriginalRow227TriangleData1395.coefficient108_221,
  OriginalRow227TriangleData1395.coefficient108_222,
  OriginalRow227TriangleData1395.coefficient108_223,
  OriginalRow227TriangleData1395.coefficient108_224,
  OriginalRow227TriangleData1395.coefficient108_225,
  OriginalRow227TriangleData1395.coefficient108_226,
  OriginalRow227TriangleData1395.coefficient108_227,
  OriginalRow227TriangleData1395.coefficient108_228,
  OriginalRow227TriangleData1395.coefficient108_229,
  OriginalRow227TriangleData1395.coefficient108_230,
  OriginalRow227TriangleData1395.coefficient108_231,
  OriginalRow227TriangleData1395.coefficient108_232,
  OriginalRow227TriangleData1395.coefficient108_233,
  OriginalRow227TriangleData1395.coefficient108_234
]

theorem values1395_size : values1395.size = 32 := rfl

def block1395 : ℕ → Option IntervalDyadic := segment 203 values1395

theorem block1395_domain : ExactDomain block1395 203 235 := by
  simpa only [values1395_size] using segment_domain 203 values1395

theorem block1395_get (i : Fin 32) :
    block1395 (203 + i.val) = some (values1395[i.val]'(by rw [values1395_size]; exact i.isLt)) := by
  exact segment_get 203 values1395 ⟨i.val, by rw [values1395_size]; exact i.isLt⟩

def values1396 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1396.coefficient108_235,
  OriginalRow227TriangleData1396.coefficient108_236,
  OriginalRow227TriangleData1396.coefficient108_237,
  OriginalRow227TriangleData1396.coefficient108_238,
  OriginalRow227TriangleData1396.coefficient108_239,
  OriginalRow227TriangleData1396.coefficient108_240,
  OriginalRow227TriangleData1396.coefficient108_241,
  OriginalRow227TriangleData1396.coefficient108_242,
  OriginalRow227TriangleData1396.coefficient108_243,
  OriginalRow227TriangleData1396.coefficient108_244,
  OriginalRow227TriangleData1396.coefficient108_245,
  OriginalRow227TriangleData1396.coefficient108_246,
  OriginalRow227TriangleData1396.coefficient108_247,
  OriginalRow227TriangleData1396.coefficient108_248,
  OriginalRow227TriangleData1396.coefficient108_249,
  OriginalRow227TriangleData1396.coefficient108_250,
  OriginalRow227TriangleData1396.coefficient108_251,
  OriginalRow227TriangleData1396.coefficient108_252,
  OriginalRow227TriangleData1396.coefficient108_253,
  OriginalRow227TriangleData1396.coefficient108_254,
  OriginalRow227TriangleData1396.coefficient108_255,
  OriginalRow227TriangleData1396.coefficient108_256,
  OriginalRow227TriangleData1396.coefficient108_257,
  OriginalRow227TriangleData1396.coefficient108_258,
  OriginalRow227TriangleData1396.coefficient108_259,
  OriginalRow227TriangleData1396.coefficient108_260,
  OriginalRow227TriangleData1396.coefficient108_261,
  OriginalRow227TriangleData1396.coefficient108_262,
  OriginalRow227TriangleData1396.coefficient108_263,
  OriginalRow227TriangleData1396.coefficient108_264,
  OriginalRow227TriangleData1396.coefficient108_265,
  OriginalRow227TriangleData1396.coefficient108_266
]

theorem values1396_size : values1396.size = 32 := rfl

def block1396 : ℕ → Option IntervalDyadic := segment 235 values1396

theorem block1396_domain : ExactDomain block1396 235 267 := by
  simpa only [values1396_size] using segment_domain 235 values1396

theorem block1396_get (i : Fin 32) :
    block1396 (235 + i.val) = some (values1396[i.val]'(by rw [values1396_size]; exact i.isLt)) := by
  exact segment_get 235 values1396 ⟨i.val, by rw [values1396_size]; exact i.isLt⟩

def values1397 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1397.coefficient108_267,
  OriginalRow227TriangleData1397.coefficient108_268,
  OriginalRow227TriangleData1397.coefficient108_269,
  OriginalRow227TriangleData1397.coefficient108_270,
  OriginalRow227TriangleData1397.coefficient108_271,
  OriginalRow227TriangleData1397.coefficient108_272,
  OriginalRow227TriangleData1397.coefficient108_273,
  OriginalRow227TriangleData1397.coefficient108_274,
  OriginalRow227TriangleData1397.coefficient108_275,
  OriginalRow227TriangleData1397.coefficient108_276,
  OriginalRow227TriangleData1397.coefficient108_277,
  OriginalRow227TriangleData1397.coefficient108_278,
  OriginalRow227TriangleData1397.coefficient108_279,
  OriginalRow227TriangleData1397.coefficient108_280,
  OriginalRow227TriangleData1397.coefficient108_281,
  OriginalRow227TriangleData1397.coefficient108_282,
  OriginalRow227TriangleData1397.coefficient108_283,
  OriginalRow227TriangleData1397.coefficient108_284,
  OriginalRow227TriangleData1397.coefficient108_285,
  OriginalRow227TriangleData1397.coefficient108_286,
  OriginalRow227TriangleData1397.coefficient108_287,
  OriginalRow227TriangleData1397.coefficient108_288,
  OriginalRow227TriangleData1397.coefficient108_289,
  OriginalRow227TriangleData1397.coefficient108_290,
  OriginalRow227TriangleData1397.coefficient108_291,
  OriginalRow227TriangleData1397.coefficient108_292,
  OriginalRow227TriangleData1397.coefficient108_293,
  OriginalRow227TriangleData1397.coefficient108_294,
  OriginalRow227TriangleData1397.coefficient108_295,
  OriginalRow227TriangleData1397.coefficient108_296,
  OriginalRow227TriangleData1397.coefficient108_297,
  OriginalRow227TriangleData1397.coefficient108_298
]

theorem values1397_size : values1397.size = 32 := rfl

def block1397 : ℕ → Option IntervalDyadic := segment 267 values1397

theorem block1397_domain : ExactDomain block1397 267 299 := by
  simpa only [values1397_size] using segment_domain 267 values1397

theorem block1397_get (i : Fin 32) :
    block1397 (267 + i.val) = some (values1397[i.val]'(by rw [values1397_size]; exact i.isLt)) := by
  exact segment_get 267 values1397 ⟨i.val, by rw [values1397_size]; exact i.isLt⟩

def values1398 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1398.coefficient108_299,
  OriginalRow227TriangleData1398.coefficient108_300,
  OriginalRow227TriangleData1398.coefficient108_301,
  OriginalRow227TriangleData1398.coefficient108_302,
  OriginalRow227TriangleData1398.coefficient108_303,
  OriginalRow227TriangleData1398.coefficient108_304,
  OriginalRow227TriangleData1398.coefficient108_305,
  OriginalRow227TriangleData1398.coefficient108_306,
  OriginalRow227TriangleData1398.coefficient108_307,
  OriginalRow227TriangleData1398.coefficient108_308,
  OriginalRow227TriangleData1398.coefficient108_309,
  OriginalRow227TriangleData1398.coefficient108_310,
  OriginalRow227TriangleData1398.coefficient108_311,
  OriginalRow227TriangleData1398.coefficient108_312,
  OriginalRow227TriangleData1398.coefficient108_313,
  OriginalRow227TriangleData1398.coefficient108_314,
  OriginalRow227TriangleData1398.coefficient108_315,
  OriginalRow227TriangleData1398.coefficient108_316,
  OriginalRow227TriangleData1398.coefficient108_317,
  OriginalRow227TriangleData1398.coefficient108_318,
  OriginalRow227TriangleData1398.coefficient108_319,
  OriginalRow227TriangleData1398.coefficient108_320,
  OriginalRow227TriangleData1398.coefficient108_321,
  OriginalRow227TriangleData1398.coefficient108_322,
  OriginalRow227TriangleData1398.coefficient108_323,
  OriginalRow227TriangleData1398.coefficient108_324,
  OriginalRow227TriangleData1398.coefficient108_325,
  OriginalRow227TriangleData1398.coefficient108_326,
  OriginalRow227TriangleData1398.coefficient108_327,
  OriginalRow227TriangleData1398.coefficient108_328,
  OriginalRow227TriangleData1398.coefficient108_329,
  OriginalRow227TriangleData1398.coefficient108_330
]

theorem values1398_size : values1398.size = 32 := rfl

def block1398 : ℕ → Option IntervalDyadic := segment 299 values1398

theorem block1398_domain : ExactDomain block1398 299 331 := by
  simpa only [values1398_size] using segment_domain 299 values1398

theorem block1398_get (i : Fin 32) :
    block1398 (299 + i.val) = some (values1398[i.val]'(by rw [values1398_size]; exact i.isLt)) := by
  exact segment_get 299 values1398 ⟨i.val, by rw [values1398_size]; exact i.isLt⟩

def values1399 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1399.coefficient108_331,
  OriginalRow227TriangleData1399.coefficient108_332,
  OriginalRow227TriangleData1399.coefficient108_333,
  OriginalRow227TriangleData1399.coefficient108_334,
  OriginalRow227TriangleData1399.coefficient108_335,
  OriginalRow227TriangleData1399.coefficient108_336,
  OriginalRow227TriangleData1399.coefficient108_337,
  OriginalRow227TriangleData1399.coefficient108_338,
  OriginalRow227TriangleData1399.coefficient108_339,
  OriginalRow227TriangleData1399.coefficient108_340,
  OriginalRow227TriangleData1399.coefficient108_341,
  OriginalRow227TriangleData1399.coefficient108_342,
  OriginalRow227TriangleData1399.coefficient108_343,
  OriginalRow227TriangleData1399.coefficient108_344,
  OriginalRow227TriangleData1399.coefficient108_345,
  OriginalRow227TriangleData1399.coefficient108_346,
  OriginalRow227TriangleData1399.coefficient108_347,
  OriginalRow227TriangleData1399.coefficient108_348,
  OriginalRow227TriangleData1399.coefficient108_349,
  OriginalRow227TriangleData1399.coefficient108_350,
  OriginalRow227TriangleData1399.coefficient108_351,
  OriginalRow227TriangleData1399.coefficient108_352,
  OriginalRow227TriangleData1399.coefficient108_353,
  OriginalRow227TriangleData1399.coefficient108_354,
  OriginalRow227TriangleData1399.coefficient108_355,
  OriginalRow227TriangleData1399.coefficient108_356,
  OriginalRow227TriangleData1399.coefficient108_357,
  OriginalRow227TriangleData1399.coefficient108_358,
  OriginalRow227TriangleData1399.coefficient108_359,
  OriginalRow227TriangleData1399.coefficient108_360,
  OriginalRow227TriangleData1399.coefficient108_361,
  OriginalRow227TriangleData1399.coefficient108_362
]

theorem values1399_size : values1399.size = 32 := rfl

def block1399 : ℕ → Option IntervalDyadic := segment 331 values1399

theorem block1399_domain : ExactDomain block1399 331 363 := by
  simpa only [values1399_size] using segment_domain 331 values1399

theorem block1399_get (i : Fin 32) :
    block1399 (331 + i.val) = some (values1399[i.val]'(by rw [values1399_size]; exact i.isLt)) := by
  exact segment_get 331 values1399 ⟨i.val, by rw [values1399_size]; exact i.isLt⟩

def values1400 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1400.coefficient108_363,
  OriginalRow227TriangleData1400.coefficient108_364,
  OriginalRow227TriangleData1400.coefficient108_365,
  OriginalRow227TriangleData1400.coefficient108_366,
  OriginalRow227TriangleData1400.coefficient108_367,
  OriginalRow227TriangleData1400.coefficient108_368,
  OriginalRow227TriangleData1400.coefficient108_369,
  OriginalRow227TriangleData1400.coefficient108_370,
  OriginalRow227TriangleData1400.coefficient108_371,
  OriginalRow227TriangleData1400.coefficient108_372,
  OriginalRow227TriangleData1400.coefficient108_373,
  OriginalRow227TriangleData1400.coefficient108_374,
  OriginalRow227TriangleData1400.coefficient108_375,
  OriginalRow227TriangleData1400.coefficient108_376,
  OriginalRow227TriangleData1400.coefficient108_377,
  OriginalRow227TriangleData1400.coefficient108_378,
  OriginalRow227TriangleData1400.coefficient108_379,
  OriginalRow227TriangleData1400.coefficient108_380,
  OriginalRow227TriangleData1400.coefficient108_381,
  OriginalRow227TriangleData1400.coefficient108_382,
  OriginalRow227TriangleData1400.coefficient108_383,
  OriginalRow227TriangleData1400.coefficient108_384,
  OriginalRow227TriangleData1400.coefficient108_385,
  OriginalRow227TriangleData1400.coefficient108_386,
  OriginalRow227TriangleData1400.coefficient108_387,
  OriginalRow227TriangleData1400.coefficient108_388,
  OriginalRow227TriangleData1400.coefficient108_389,
  OriginalRow227TriangleData1400.coefficient108_390,
  OriginalRow227TriangleData1400.coefficient108_391,
  OriginalRow227TriangleData1400.coefficient108_392,
  OriginalRow227TriangleData1400.coefficient108_393
]

theorem values1400_size : values1400.size = 31 := rfl

def block1400 : ℕ → Option IntervalDyadic := segment 363 values1400

theorem block1400_domain : ExactDomain block1400 363 394 := by
  simpa only [values1400_size] using segment_domain 363 values1400

theorem block1400_get (i : Fin 31) :
    block1400 (363 + i.val) = some (values1400[i.val]'(by rw [values1400_size]; exact i.isLt)) := by
  exact segment_get 363 values1400 ⟨i.val, by rw [values1400_size]; exact i.isLt⟩

def node0107_0171 : ℕ → Option IntervalDyadic := split 139 block1392 block1393

theorem node0107_0171_domain : ExactDomain node0107_0171 107 171 := by
  exact split_domain (by decide) (by decide) block1392_domain block1393_domain

def node0171_0235 : ℕ → Option IntervalDyadic := split 203 block1394 block1395

theorem node0171_0235_domain : ExactDomain node0171_0235 171 235 := by
  exact split_domain (by decide) (by decide) block1394_domain block1395_domain

def node0107_0235 : ℕ → Option IntervalDyadic := split 171 node0107_0171 node0171_0235

theorem node0107_0235_domain : ExactDomain node0107_0235 107 235 := by
  exact split_domain (by decide) (by decide) node0107_0171_domain node0171_0235_domain

def node0235_0299 : ℕ → Option IntervalDyadic := split 267 block1396 block1397

theorem node0235_0299_domain : ExactDomain node0235_0299 235 299 := by
  exact split_domain (by decide) (by decide) block1396_domain block1397_domain

def node0331_0394 : ℕ → Option IntervalDyadic := split 363 block1399 block1400

theorem node0331_0394_domain : ExactDomain node0331_0394 331 394 := by
  exact split_domain (by decide) (by decide) block1399_domain block1400_domain

def node0299_0394 : ℕ → Option IntervalDyadic := split 331 block1398 node0331_0394

theorem node0299_0394_domain : ExactDomain node0299_0394 299 394 := by
  exact split_domain (by decide) (by decide) block1398_domain node0331_0394_domain

def node0235_0394 : ℕ → Option IntervalDyadic := split 299 node0235_0299 node0299_0394

theorem node0235_0394_domain : ExactDomain node0235_0394 235 394 := by
  exact split_domain (by decide) (by decide) node0235_0299_domain node0299_0394_domain

def node0107_0394 : ℕ → Option IntervalDyadic := split 235 node0107_0235 node0235_0394

theorem node0107_0394_domain : ExactDomain node0107_0394 107 394 := by
  exact split_domain (by decide) (by decide) node0107_0235_domain node0235_0394_domain

def lookup : ℕ → Option IntervalDyadic := node0107_0394

theorem lookup_domain : ExactDomain lookup 107 394 :=
  node0107_0394_domain

theorem block1392_lookup (i : Fin 32) :
    lookup (107 + i.val) = some (values1392[i.val]'(by rw [values1392_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (107 + i.val) = _
  rw [node0107_0394, split_left 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0107_0235, split_left 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0107_0171, split_left 139 block1392 block1393 (by omega)]
  exact block1392_get i

theorem block1393_lookup (i : Fin 32) :
    lookup (139 + i.val) = some (values1393[i.val]'(by rw [values1393_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (139 + i.val) = _
  rw [node0107_0394, split_left 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0107_0235, split_left 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0107_0171, split_right 139 block1392 block1393 (by omega)]
  exact block1393_get i

theorem block1394_lookup (i : Fin 32) :
    lookup (171 + i.val) = some (values1394[i.val]'(by rw [values1394_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (171 + i.val) = _
  rw [node0107_0394, split_left 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0107_0235, split_right 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0171_0235, split_left 203 block1394 block1395 (by omega)]
  exact block1394_get i

theorem block1395_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values1395[i.val]'(by rw [values1395_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (203 + i.val) = _
  rw [node0107_0394, split_left 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0107_0235, split_right 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0171_0235, split_right 203 block1394 block1395 (by omega)]
  exact block1395_get i

theorem block1396_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values1396[i.val]'(by rw [values1396_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (235 + i.val) = _
  rw [node0107_0394, split_right 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0235_0394, split_left 299 node0235_0299 node0299_0394 (by omega)]
  rw [node0235_0299, split_left 267 block1396 block1397 (by omega)]
  exact block1396_get i

theorem block1397_lookup (i : Fin 32) :
    lookup (267 + i.val) = some (values1397[i.val]'(by rw [values1397_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (267 + i.val) = _
  rw [node0107_0394, split_right 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0235_0394, split_left 299 node0235_0299 node0299_0394 (by omega)]
  rw [node0235_0299, split_right 267 block1396 block1397 (by omega)]
  exact block1397_get i

theorem block1398_lookup (i : Fin 32) :
    lookup (299 + i.val) = some (values1398[i.val]'(by rw [values1398_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (299 + i.val) = _
  rw [node0107_0394, split_right 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0235_0394, split_right 299 node0235_0299 node0299_0394 (by omega)]
  rw [node0299_0394, split_left 331 block1398 node0331_0394 (by omega)]
  exact block1398_get i

theorem block1399_lookup (i : Fin 32) :
    lookup (331 + i.val) = some (values1399[i.val]'(by rw [values1399_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (331 + i.val) = _
  rw [node0107_0394, split_right 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0235_0394, split_right 299 node0235_0299 node0299_0394 (by omega)]
  rw [node0299_0394, split_right 331 block1398 node0331_0394 (by omega)]
  rw [node0331_0394, split_left 363 block1399 block1400 (by omega)]
  exact block1399_get i

theorem block1400_lookup (i : Fin 31) :
    lookup (363 + i.val) = some (values1400[i.val]'(by rw [values1400_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0107_0394 (363 + i.val) = _
  rw [node0107_0394, split_right 235 node0107_0235 node0235_0394 (by omega)]
  rw [node0235_0394, split_right 299 node0235_0299 node0299_0394 (by omega)]
  rw [node0299_0394, split_right 331 block1398 node0331_0394 (by omega)]
  rw [node0331_0394, split_right 363 block1399 block1400 (by omega)]
  exact block1400_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1392_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1392_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1393_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1393_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1394_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1394_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1395_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1395_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1396_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1396_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1397_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1397_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1398_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1398_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1399_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1399_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1400_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1400_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1392_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1393_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1394_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1395_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1396_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1397_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1398_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1399_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow108.block1400_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow108
