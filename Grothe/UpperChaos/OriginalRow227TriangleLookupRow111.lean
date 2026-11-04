import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1419
import Grothe.UpperChaos.OriginalRow227TriangleData1420
import Grothe.UpperChaos.OriginalRow227TriangleData1421
import Grothe.UpperChaos.OriginalRow227TriangleData1422
import Grothe.UpperChaos.OriginalRow227TriangleData1423
import Grothe.UpperChaos.OriginalRow227TriangleData1424
import Grothe.UpperChaos.OriginalRow227TriangleData1425
import Grothe.UpperChaos.OriginalRow227TriangleData1426
import Grothe.UpperChaos.OriginalRow227TriangleData1427

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow111

open ConditionalTableLookup

def values1419 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1419.coefficient111_110,
  OriginalRow227TriangleData1419.coefficient111_111,
  OriginalRow227TriangleData1419.coefficient111_112,
  OriginalRow227TriangleData1419.coefficient111_113,
  OriginalRow227TriangleData1419.coefficient111_114,
  OriginalRow227TriangleData1419.coefficient111_115,
  OriginalRow227TriangleData1419.coefficient111_116,
  OriginalRow227TriangleData1419.coefficient111_117,
  OriginalRow227TriangleData1419.coefficient111_118,
  OriginalRow227TriangleData1419.coefficient111_119,
  OriginalRow227TriangleData1419.coefficient111_120,
  OriginalRow227TriangleData1419.coefficient111_121,
  OriginalRow227TriangleData1419.coefficient111_122,
  OriginalRow227TriangleData1419.coefficient111_123,
  OriginalRow227TriangleData1419.coefficient111_124,
  OriginalRow227TriangleData1419.coefficient111_125,
  OriginalRow227TriangleData1419.coefficient111_126,
  OriginalRow227TriangleData1419.coefficient111_127,
  OriginalRow227TriangleData1419.coefficient111_128,
  OriginalRow227TriangleData1419.coefficient111_129,
  OriginalRow227TriangleData1419.coefficient111_130,
  OriginalRow227TriangleData1419.coefficient111_131,
  OriginalRow227TriangleData1419.coefficient111_132,
  OriginalRow227TriangleData1419.coefficient111_133,
  OriginalRow227TriangleData1419.coefficient111_134,
  OriginalRow227TriangleData1419.coefficient111_135,
  OriginalRow227TriangleData1419.coefficient111_136,
  OriginalRow227TriangleData1419.coefficient111_137,
  OriginalRow227TriangleData1419.coefficient111_138,
  OriginalRow227TriangleData1419.coefficient111_139,
  OriginalRow227TriangleData1419.coefficient111_140,
  OriginalRow227TriangleData1419.coefficient111_141
]

theorem values1419_size : values1419.size = 32 := rfl

def block1419 : ℕ → Option IntervalDyadic := segment 110 values1419

theorem block1419_domain : ExactDomain block1419 110 142 := by
  simpa only [values1419_size] using segment_domain 110 values1419

theorem block1419_get (i : Fin 32) :
    block1419 (110 + i.val) = some (values1419[i.val]'(by rw [values1419_size]; exact i.isLt)) := by
  exact segment_get 110 values1419 ⟨i.val, by rw [values1419_size]; exact i.isLt⟩

def values1420 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1420.coefficient111_142,
  OriginalRow227TriangleData1420.coefficient111_143,
  OriginalRow227TriangleData1420.coefficient111_144,
  OriginalRow227TriangleData1420.coefficient111_145,
  OriginalRow227TriangleData1420.coefficient111_146,
  OriginalRow227TriangleData1420.coefficient111_147,
  OriginalRow227TriangleData1420.coefficient111_148,
  OriginalRow227TriangleData1420.coefficient111_149,
  OriginalRow227TriangleData1420.coefficient111_150,
  OriginalRow227TriangleData1420.coefficient111_151,
  OriginalRow227TriangleData1420.coefficient111_152,
  OriginalRow227TriangleData1420.coefficient111_153,
  OriginalRow227TriangleData1420.coefficient111_154,
  OriginalRow227TriangleData1420.coefficient111_155,
  OriginalRow227TriangleData1420.coefficient111_156,
  OriginalRow227TriangleData1420.coefficient111_157,
  OriginalRow227TriangleData1420.coefficient111_158,
  OriginalRow227TriangleData1420.coefficient111_159,
  OriginalRow227TriangleData1420.coefficient111_160,
  OriginalRow227TriangleData1420.coefficient111_161,
  OriginalRow227TriangleData1420.coefficient111_162,
  OriginalRow227TriangleData1420.coefficient111_163,
  OriginalRow227TriangleData1420.coefficient111_164,
  OriginalRow227TriangleData1420.coefficient111_165,
  OriginalRow227TriangleData1420.coefficient111_166,
  OriginalRow227TriangleData1420.coefficient111_167,
  OriginalRow227TriangleData1420.coefficient111_168,
  OriginalRow227TriangleData1420.coefficient111_169,
  OriginalRow227TriangleData1420.coefficient111_170,
  OriginalRow227TriangleData1420.coefficient111_171,
  OriginalRow227TriangleData1420.coefficient111_172,
  OriginalRow227TriangleData1420.coefficient111_173
]

theorem values1420_size : values1420.size = 32 := rfl

def block1420 : ℕ → Option IntervalDyadic := segment 142 values1420

theorem block1420_domain : ExactDomain block1420 142 174 := by
  simpa only [values1420_size] using segment_domain 142 values1420

theorem block1420_get (i : Fin 32) :
    block1420 (142 + i.val) = some (values1420[i.val]'(by rw [values1420_size]; exact i.isLt)) := by
  exact segment_get 142 values1420 ⟨i.val, by rw [values1420_size]; exact i.isLt⟩

def values1421 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1421.coefficient111_174,
  OriginalRow227TriangleData1421.coefficient111_175,
  OriginalRow227TriangleData1421.coefficient111_176,
  OriginalRow227TriangleData1421.coefficient111_177,
  OriginalRow227TriangleData1421.coefficient111_178,
  OriginalRow227TriangleData1421.coefficient111_179,
  OriginalRow227TriangleData1421.coefficient111_180,
  OriginalRow227TriangleData1421.coefficient111_181,
  OriginalRow227TriangleData1421.coefficient111_182,
  OriginalRow227TriangleData1421.coefficient111_183,
  OriginalRow227TriangleData1421.coefficient111_184,
  OriginalRow227TriangleData1421.coefficient111_185,
  OriginalRow227TriangleData1421.coefficient111_186,
  OriginalRow227TriangleData1421.coefficient111_187,
  OriginalRow227TriangleData1421.coefficient111_188,
  OriginalRow227TriangleData1421.coefficient111_189,
  OriginalRow227TriangleData1421.coefficient111_190,
  OriginalRow227TriangleData1421.coefficient111_191,
  OriginalRow227TriangleData1421.coefficient111_192,
  OriginalRow227TriangleData1421.coefficient111_193,
  OriginalRow227TriangleData1421.coefficient111_194,
  OriginalRow227TriangleData1421.coefficient111_195,
  OriginalRow227TriangleData1421.coefficient111_196,
  OriginalRow227TriangleData1421.coefficient111_197,
  OriginalRow227TriangleData1421.coefficient111_198,
  OriginalRow227TriangleData1421.coefficient111_199,
  OriginalRow227TriangleData1421.coefficient111_200,
  OriginalRow227TriangleData1421.coefficient111_201,
  OriginalRow227TriangleData1421.coefficient111_202,
  OriginalRow227TriangleData1421.coefficient111_203,
  OriginalRow227TriangleData1421.coefficient111_204,
  OriginalRow227TriangleData1421.coefficient111_205
]

theorem values1421_size : values1421.size = 32 := rfl

def block1421 : ℕ → Option IntervalDyadic := segment 174 values1421

theorem block1421_domain : ExactDomain block1421 174 206 := by
  simpa only [values1421_size] using segment_domain 174 values1421

theorem block1421_get (i : Fin 32) :
    block1421 (174 + i.val) = some (values1421[i.val]'(by rw [values1421_size]; exact i.isLt)) := by
  exact segment_get 174 values1421 ⟨i.val, by rw [values1421_size]; exact i.isLt⟩

def values1422 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1422.coefficient111_206,
  OriginalRow227TriangleData1422.coefficient111_207,
  OriginalRow227TriangleData1422.coefficient111_208,
  OriginalRow227TriangleData1422.coefficient111_209,
  OriginalRow227TriangleData1422.coefficient111_210,
  OriginalRow227TriangleData1422.coefficient111_211,
  OriginalRow227TriangleData1422.coefficient111_212,
  OriginalRow227TriangleData1422.coefficient111_213,
  OriginalRow227TriangleData1422.coefficient111_214,
  OriginalRow227TriangleData1422.coefficient111_215,
  OriginalRow227TriangleData1422.coefficient111_216,
  OriginalRow227TriangleData1422.coefficient111_217,
  OriginalRow227TriangleData1422.coefficient111_218,
  OriginalRow227TriangleData1422.coefficient111_219,
  OriginalRow227TriangleData1422.coefficient111_220,
  OriginalRow227TriangleData1422.coefficient111_221,
  OriginalRow227TriangleData1422.coefficient111_222,
  OriginalRow227TriangleData1422.coefficient111_223,
  OriginalRow227TriangleData1422.coefficient111_224,
  OriginalRow227TriangleData1422.coefficient111_225,
  OriginalRow227TriangleData1422.coefficient111_226,
  OriginalRow227TriangleData1422.coefficient111_227,
  OriginalRow227TriangleData1422.coefficient111_228,
  OriginalRow227TriangleData1422.coefficient111_229,
  OriginalRow227TriangleData1422.coefficient111_230,
  OriginalRow227TriangleData1422.coefficient111_231,
  OriginalRow227TriangleData1422.coefficient111_232,
  OriginalRow227TriangleData1422.coefficient111_233,
  OriginalRow227TriangleData1422.coefficient111_234,
  OriginalRow227TriangleData1422.coefficient111_235,
  OriginalRow227TriangleData1422.coefficient111_236,
  OriginalRow227TriangleData1422.coefficient111_237
]

theorem values1422_size : values1422.size = 32 := rfl

def block1422 : ℕ → Option IntervalDyadic := segment 206 values1422

theorem block1422_domain : ExactDomain block1422 206 238 := by
  simpa only [values1422_size] using segment_domain 206 values1422

theorem block1422_get (i : Fin 32) :
    block1422 (206 + i.val) = some (values1422[i.val]'(by rw [values1422_size]; exact i.isLt)) := by
  exact segment_get 206 values1422 ⟨i.val, by rw [values1422_size]; exact i.isLt⟩

def values1423 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1423.coefficient111_238,
  OriginalRow227TriangleData1423.coefficient111_239,
  OriginalRow227TriangleData1423.coefficient111_240,
  OriginalRow227TriangleData1423.coefficient111_241,
  OriginalRow227TriangleData1423.coefficient111_242,
  OriginalRow227TriangleData1423.coefficient111_243,
  OriginalRow227TriangleData1423.coefficient111_244,
  OriginalRow227TriangleData1423.coefficient111_245,
  OriginalRow227TriangleData1423.coefficient111_246,
  OriginalRow227TriangleData1423.coefficient111_247,
  OriginalRow227TriangleData1423.coefficient111_248,
  OriginalRow227TriangleData1423.coefficient111_249,
  OriginalRow227TriangleData1423.coefficient111_250,
  OriginalRow227TriangleData1423.coefficient111_251,
  OriginalRow227TriangleData1423.coefficient111_252,
  OriginalRow227TriangleData1423.coefficient111_253,
  OriginalRow227TriangleData1423.coefficient111_254,
  OriginalRow227TriangleData1423.coefficient111_255,
  OriginalRow227TriangleData1423.coefficient111_256,
  OriginalRow227TriangleData1423.coefficient111_257,
  OriginalRow227TriangleData1423.coefficient111_258,
  OriginalRow227TriangleData1423.coefficient111_259,
  OriginalRow227TriangleData1423.coefficient111_260,
  OriginalRow227TriangleData1423.coefficient111_261,
  OriginalRow227TriangleData1423.coefficient111_262,
  OriginalRow227TriangleData1423.coefficient111_263,
  OriginalRow227TriangleData1423.coefficient111_264,
  OriginalRow227TriangleData1423.coefficient111_265,
  OriginalRow227TriangleData1423.coefficient111_266,
  OriginalRow227TriangleData1423.coefficient111_267,
  OriginalRow227TriangleData1423.coefficient111_268,
  OriginalRow227TriangleData1423.coefficient111_269
]

theorem values1423_size : values1423.size = 32 := rfl

def block1423 : ℕ → Option IntervalDyadic := segment 238 values1423

theorem block1423_domain : ExactDomain block1423 238 270 := by
  simpa only [values1423_size] using segment_domain 238 values1423

theorem block1423_get (i : Fin 32) :
    block1423 (238 + i.val) = some (values1423[i.val]'(by rw [values1423_size]; exact i.isLt)) := by
  exact segment_get 238 values1423 ⟨i.val, by rw [values1423_size]; exact i.isLt⟩

def values1424 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1424.coefficient111_270,
  OriginalRow227TriangleData1424.coefficient111_271,
  OriginalRow227TriangleData1424.coefficient111_272,
  OriginalRow227TriangleData1424.coefficient111_273,
  OriginalRow227TriangleData1424.coefficient111_274,
  OriginalRow227TriangleData1424.coefficient111_275,
  OriginalRow227TriangleData1424.coefficient111_276,
  OriginalRow227TriangleData1424.coefficient111_277,
  OriginalRow227TriangleData1424.coefficient111_278,
  OriginalRow227TriangleData1424.coefficient111_279,
  OriginalRow227TriangleData1424.coefficient111_280,
  OriginalRow227TriangleData1424.coefficient111_281,
  OriginalRow227TriangleData1424.coefficient111_282,
  OriginalRow227TriangleData1424.coefficient111_283,
  OriginalRow227TriangleData1424.coefficient111_284,
  OriginalRow227TriangleData1424.coefficient111_285,
  OriginalRow227TriangleData1424.coefficient111_286,
  OriginalRow227TriangleData1424.coefficient111_287,
  OriginalRow227TriangleData1424.coefficient111_288,
  OriginalRow227TriangleData1424.coefficient111_289,
  OriginalRow227TriangleData1424.coefficient111_290,
  OriginalRow227TriangleData1424.coefficient111_291,
  OriginalRow227TriangleData1424.coefficient111_292,
  OriginalRow227TriangleData1424.coefficient111_293,
  OriginalRow227TriangleData1424.coefficient111_294,
  OriginalRow227TriangleData1424.coefficient111_295,
  OriginalRow227TriangleData1424.coefficient111_296,
  OriginalRow227TriangleData1424.coefficient111_297,
  OriginalRow227TriangleData1424.coefficient111_298,
  OriginalRow227TriangleData1424.coefficient111_299,
  OriginalRow227TriangleData1424.coefficient111_300,
  OriginalRow227TriangleData1424.coefficient111_301
]

theorem values1424_size : values1424.size = 32 := rfl

def block1424 : ℕ → Option IntervalDyadic := segment 270 values1424

theorem block1424_domain : ExactDomain block1424 270 302 := by
  simpa only [values1424_size] using segment_domain 270 values1424

theorem block1424_get (i : Fin 32) :
    block1424 (270 + i.val) = some (values1424[i.val]'(by rw [values1424_size]; exact i.isLt)) := by
  exact segment_get 270 values1424 ⟨i.val, by rw [values1424_size]; exact i.isLt⟩

def values1425 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1425.coefficient111_302,
  OriginalRow227TriangleData1425.coefficient111_303,
  OriginalRow227TriangleData1425.coefficient111_304,
  OriginalRow227TriangleData1425.coefficient111_305,
  OriginalRow227TriangleData1425.coefficient111_306,
  OriginalRow227TriangleData1425.coefficient111_307,
  OriginalRow227TriangleData1425.coefficient111_308,
  OriginalRow227TriangleData1425.coefficient111_309,
  OriginalRow227TriangleData1425.coefficient111_310,
  OriginalRow227TriangleData1425.coefficient111_311,
  OriginalRow227TriangleData1425.coefficient111_312,
  OriginalRow227TriangleData1425.coefficient111_313,
  OriginalRow227TriangleData1425.coefficient111_314,
  OriginalRow227TriangleData1425.coefficient111_315,
  OriginalRow227TriangleData1425.coefficient111_316,
  OriginalRow227TriangleData1425.coefficient111_317,
  OriginalRow227TriangleData1425.coefficient111_318,
  OriginalRow227TriangleData1425.coefficient111_319,
  OriginalRow227TriangleData1425.coefficient111_320,
  OriginalRow227TriangleData1425.coefficient111_321,
  OriginalRow227TriangleData1425.coefficient111_322,
  OriginalRow227TriangleData1425.coefficient111_323,
  OriginalRow227TriangleData1425.coefficient111_324,
  OriginalRow227TriangleData1425.coefficient111_325,
  OriginalRow227TriangleData1425.coefficient111_326,
  OriginalRow227TriangleData1425.coefficient111_327,
  OriginalRow227TriangleData1425.coefficient111_328,
  OriginalRow227TriangleData1425.coefficient111_329,
  OriginalRow227TriangleData1425.coefficient111_330,
  OriginalRow227TriangleData1425.coefficient111_331,
  OriginalRow227TriangleData1425.coefficient111_332,
  OriginalRow227TriangleData1425.coefficient111_333
]

theorem values1425_size : values1425.size = 32 := rfl

def block1425 : ℕ → Option IntervalDyadic := segment 302 values1425

theorem block1425_domain : ExactDomain block1425 302 334 := by
  simpa only [values1425_size] using segment_domain 302 values1425

theorem block1425_get (i : Fin 32) :
    block1425 (302 + i.val) = some (values1425[i.val]'(by rw [values1425_size]; exact i.isLt)) := by
  exact segment_get 302 values1425 ⟨i.val, by rw [values1425_size]; exact i.isLt⟩

def values1426 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1426.coefficient111_334,
  OriginalRow227TriangleData1426.coefficient111_335,
  OriginalRow227TriangleData1426.coefficient111_336,
  OriginalRow227TriangleData1426.coefficient111_337,
  OriginalRow227TriangleData1426.coefficient111_338,
  OriginalRow227TriangleData1426.coefficient111_339,
  OriginalRow227TriangleData1426.coefficient111_340,
  OriginalRow227TriangleData1426.coefficient111_341,
  OriginalRow227TriangleData1426.coefficient111_342,
  OriginalRow227TriangleData1426.coefficient111_343,
  OriginalRow227TriangleData1426.coefficient111_344,
  OriginalRow227TriangleData1426.coefficient111_345,
  OriginalRow227TriangleData1426.coefficient111_346,
  OriginalRow227TriangleData1426.coefficient111_347,
  OriginalRow227TriangleData1426.coefficient111_348,
  OriginalRow227TriangleData1426.coefficient111_349,
  OriginalRow227TriangleData1426.coefficient111_350,
  OriginalRow227TriangleData1426.coefficient111_351,
  OriginalRow227TriangleData1426.coefficient111_352,
  OriginalRow227TriangleData1426.coefficient111_353,
  OriginalRow227TriangleData1426.coefficient111_354,
  OriginalRow227TriangleData1426.coefficient111_355,
  OriginalRow227TriangleData1426.coefficient111_356,
  OriginalRow227TriangleData1426.coefficient111_357,
  OriginalRow227TriangleData1426.coefficient111_358,
  OriginalRow227TriangleData1426.coefficient111_359,
  OriginalRow227TriangleData1426.coefficient111_360,
  OriginalRow227TriangleData1426.coefficient111_361,
  OriginalRow227TriangleData1426.coefficient111_362,
  OriginalRow227TriangleData1426.coefficient111_363,
  OriginalRow227TriangleData1426.coefficient111_364,
  OriginalRow227TriangleData1426.coefficient111_365
]

theorem values1426_size : values1426.size = 32 := rfl

def block1426 : ℕ → Option IntervalDyadic := segment 334 values1426

theorem block1426_domain : ExactDomain block1426 334 366 := by
  simpa only [values1426_size] using segment_domain 334 values1426

theorem block1426_get (i : Fin 32) :
    block1426 (334 + i.val) = some (values1426[i.val]'(by rw [values1426_size]; exact i.isLt)) := by
  exact segment_get 334 values1426 ⟨i.val, by rw [values1426_size]; exact i.isLt⟩

def values1427 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1427.coefficient111_366,
  OriginalRow227TriangleData1427.coefficient111_367,
  OriginalRow227TriangleData1427.coefficient111_368,
  OriginalRow227TriangleData1427.coefficient111_369,
  OriginalRow227TriangleData1427.coefficient111_370,
  OriginalRow227TriangleData1427.coefficient111_371,
  OriginalRow227TriangleData1427.coefficient111_372,
  OriginalRow227TriangleData1427.coefficient111_373,
  OriginalRow227TriangleData1427.coefficient111_374,
  OriginalRow227TriangleData1427.coefficient111_375,
  OriginalRow227TriangleData1427.coefficient111_376,
  OriginalRow227TriangleData1427.coefficient111_377,
  OriginalRow227TriangleData1427.coefficient111_378,
  OriginalRow227TriangleData1427.coefficient111_379,
  OriginalRow227TriangleData1427.coefficient111_380,
  OriginalRow227TriangleData1427.coefficient111_381,
  OriginalRow227TriangleData1427.coefficient111_382,
  OriginalRow227TriangleData1427.coefficient111_383,
  OriginalRow227TriangleData1427.coefficient111_384,
  OriginalRow227TriangleData1427.coefficient111_385,
  OriginalRow227TriangleData1427.coefficient111_386,
  OriginalRow227TriangleData1427.coefficient111_387,
  OriginalRow227TriangleData1427.coefficient111_388,
  OriginalRow227TriangleData1427.coefficient111_389,
  OriginalRow227TriangleData1427.coefficient111_390
]

theorem values1427_size : values1427.size = 25 := rfl

def block1427 : ℕ → Option IntervalDyadic := segment 366 values1427

theorem block1427_domain : ExactDomain block1427 366 391 := by
  simpa only [values1427_size] using segment_domain 366 values1427

theorem block1427_get (i : Fin 25) :
    block1427 (366 + i.val) = some (values1427[i.val]'(by rw [values1427_size]; exact i.isLt)) := by
  exact segment_get 366 values1427 ⟨i.val, by rw [values1427_size]; exact i.isLt⟩

def node0110_0174 : ℕ → Option IntervalDyadic := split 142 block1419 block1420

theorem node0110_0174_domain : ExactDomain node0110_0174 110 174 := by
  exact split_domain (by decide) (by decide) block1419_domain block1420_domain

def node0174_0238 : ℕ → Option IntervalDyadic := split 206 block1421 block1422

theorem node0174_0238_domain : ExactDomain node0174_0238 174 238 := by
  exact split_domain (by decide) (by decide) block1421_domain block1422_domain

def node0110_0238 : ℕ → Option IntervalDyadic := split 174 node0110_0174 node0174_0238

theorem node0110_0238_domain : ExactDomain node0110_0238 110 238 := by
  exact split_domain (by decide) (by decide) node0110_0174_domain node0174_0238_domain

def node0238_0302 : ℕ → Option IntervalDyadic := split 270 block1423 block1424

theorem node0238_0302_domain : ExactDomain node0238_0302 238 302 := by
  exact split_domain (by decide) (by decide) block1423_domain block1424_domain

def node0334_0391 : ℕ → Option IntervalDyadic := split 366 block1426 block1427

theorem node0334_0391_domain : ExactDomain node0334_0391 334 391 := by
  exact split_domain (by decide) (by decide) block1426_domain block1427_domain

def node0302_0391 : ℕ → Option IntervalDyadic := split 334 block1425 node0334_0391

theorem node0302_0391_domain : ExactDomain node0302_0391 302 391 := by
  exact split_domain (by decide) (by decide) block1425_domain node0334_0391_domain

def node0238_0391 : ℕ → Option IntervalDyadic := split 302 node0238_0302 node0302_0391

theorem node0238_0391_domain : ExactDomain node0238_0391 238 391 := by
  exact split_domain (by decide) (by decide) node0238_0302_domain node0302_0391_domain

def node0110_0391 : ℕ → Option IntervalDyadic := split 238 node0110_0238 node0238_0391

theorem node0110_0391_domain : ExactDomain node0110_0391 110 391 := by
  exact split_domain (by decide) (by decide) node0110_0238_domain node0238_0391_domain

def lookup : ℕ → Option IntervalDyadic := node0110_0391

theorem lookup_domain : ExactDomain lookup 110 391 :=
  node0110_0391_domain

theorem block1419_lookup (i : Fin 32) :
    lookup (110 + i.val) = some (values1419[i.val]'(by rw [values1419_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (110 + i.val) = _
  rw [node0110_0391, split_left 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0110_0238, split_left 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0110_0174, split_left 142 block1419 block1420 (by omega)]
  exact block1419_get i

theorem block1420_lookup (i : Fin 32) :
    lookup (142 + i.val) = some (values1420[i.val]'(by rw [values1420_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (142 + i.val) = _
  rw [node0110_0391, split_left 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0110_0238, split_left 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0110_0174, split_right 142 block1419 block1420 (by omega)]
  exact block1420_get i

theorem block1421_lookup (i : Fin 32) :
    lookup (174 + i.val) = some (values1421[i.val]'(by rw [values1421_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (174 + i.val) = _
  rw [node0110_0391, split_left 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0110_0238, split_right 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0174_0238, split_left 206 block1421 block1422 (by omega)]
  exact block1421_get i

theorem block1422_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values1422[i.val]'(by rw [values1422_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (206 + i.val) = _
  rw [node0110_0391, split_left 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0110_0238, split_right 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0174_0238, split_right 206 block1421 block1422 (by omega)]
  exact block1422_get i

theorem block1423_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values1423[i.val]'(by rw [values1423_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (238 + i.val) = _
  rw [node0110_0391, split_right 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0238_0391, split_left 302 node0238_0302 node0302_0391 (by omega)]
  rw [node0238_0302, split_left 270 block1423 block1424 (by omega)]
  exact block1423_get i

theorem block1424_lookup (i : Fin 32) :
    lookup (270 + i.val) = some (values1424[i.val]'(by rw [values1424_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (270 + i.val) = _
  rw [node0110_0391, split_right 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0238_0391, split_left 302 node0238_0302 node0302_0391 (by omega)]
  rw [node0238_0302, split_right 270 block1423 block1424 (by omega)]
  exact block1424_get i

theorem block1425_lookup (i : Fin 32) :
    lookup (302 + i.val) = some (values1425[i.val]'(by rw [values1425_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (302 + i.val) = _
  rw [node0110_0391, split_right 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0238_0391, split_right 302 node0238_0302 node0302_0391 (by omega)]
  rw [node0302_0391, split_left 334 block1425 node0334_0391 (by omega)]
  exact block1425_get i

theorem block1426_lookup (i : Fin 32) :
    lookup (334 + i.val) = some (values1426[i.val]'(by rw [values1426_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (334 + i.val) = _
  rw [node0110_0391, split_right 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0238_0391, split_right 302 node0238_0302 node0302_0391 (by omega)]
  rw [node0302_0391, split_right 334 block1425 node0334_0391 (by omega)]
  rw [node0334_0391, split_left 366 block1426 block1427 (by omega)]
  exact block1426_get i

theorem block1427_lookup (i : Fin 25) :
    lookup (366 + i.val) = some (values1427[i.val]'(by rw [values1427_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0110_0391 (366 + i.val) = _
  rw [node0110_0391, split_right 238 node0110_0238 node0238_0391 (by omega)]
  rw [node0238_0391, split_right 302 node0238_0302 node0302_0391 (by omega)]
  rw [node0302_0391, split_right 334 block1425 node0334_0391 (by omega)]
  rw [node0334_0391, split_right 366 block1426 block1427 (by omega)]
  exact block1427_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1419_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1419_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1420_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1420_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1421_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1421_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1422_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1422_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1423_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1423_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1424_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1424_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1425_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1425_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1426_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1426_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1427_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1427_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1419_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1420_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1421_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1422_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1423_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1424_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1425_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1426_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow111.block1427_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow111
