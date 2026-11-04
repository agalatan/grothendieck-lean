import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1322
import Grothe.UpperChaos.OriginalRow227TriangleData1323
import Grothe.UpperChaos.OriginalRow227TriangleData1324
import Grothe.UpperChaos.OriginalRow227TriangleData1325
import Grothe.UpperChaos.OriginalRow227TriangleData1326
import Grothe.UpperChaos.OriginalRow227TriangleData1327
import Grothe.UpperChaos.OriginalRow227TriangleData1328
import Grothe.UpperChaos.OriginalRow227TriangleData1329
import Grothe.UpperChaos.OriginalRow227TriangleData1330
import Grothe.UpperChaos.OriginalRow227TriangleData1331

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow101

open ConditionalTableLookup

def values1322 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1322.coefficient101_100,
  OriginalRow227TriangleData1322.coefficient101_101,
  OriginalRow227TriangleData1322.coefficient101_102,
  OriginalRow227TriangleData1322.coefficient101_103,
  OriginalRow227TriangleData1322.coefficient101_104,
  OriginalRow227TriangleData1322.coefficient101_105,
  OriginalRow227TriangleData1322.coefficient101_106,
  OriginalRow227TriangleData1322.coefficient101_107,
  OriginalRow227TriangleData1322.coefficient101_108,
  OriginalRow227TriangleData1322.coefficient101_109,
  OriginalRow227TriangleData1322.coefficient101_110,
  OriginalRow227TriangleData1322.coefficient101_111,
  OriginalRow227TriangleData1322.coefficient101_112,
  OriginalRow227TriangleData1322.coefficient101_113,
  OriginalRow227TriangleData1322.coefficient101_114,
  OriginalRow227TriangleData1322.coefficient101_115,
  OriginalRow227TriangleData1322.coefficient101_116,
  OriginalRow227TriangleData1322.coefficient101_117,
  OriginalRow227TriangleData1322.coefficient101_118,
  OriginalRow227TriangleData1322.coefficient101_119,
  OriginalRow227TriangleData1322.coefficient101_120,
  OriginalRow227TriangleData1322.coefficient101_121,
  OriginalRow227TriangleData1322.coefficient101_122,
  OriginalRow227TriangleData1322.coefficient101_123,
  OriginalRow227TriangleData1322.coefficient101_124,
  OriginalRow227TriangleData1322.coefficient101_125,
  OriginalRow227TriangleData1322.coefficient101_126,
  OriginalRow227TriangleData1322.coefficient101_127,
  OriginalRow227TriangleData1322.coefficient101_128,
  OriginalRow227TriangleData1322.coefficient101_129,
  OriginalRow227TriangleData1322.coefficient101_130,
  OriginalRow227TriangleData1322.coefficient101_131
]

theorem values1322_size : values1322.size = 32 := rfl

def block1322 : ℕ → Option IntervalDyadic := segment 100 values1322

theorem block1322_domain : ExactDomain block1322 100 132 := by
  simpa only [values1322_size] using segment_domain 100 values1322

theorem block1322_get (i : Fin 32) :
    block1322 (100 + i.val) = some (values1322[i.val]'(by rw [values1322_size]; exact i.isLt)) := by
  exact segment_get 100 values1322 ⟨i.val, by rw [values1322_size]; exact i.isLt⟩

def values1323 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1323.coefficient101_132,
  OriginalRow227TriangleData1323.coefficient101_133,
  OriginalRow227TriangleData1323.coefficient101_134,
  OriginalRow227TriangleData1323.coefficient101_135,
  OriginalRow227TriangleData1323.coefficient101_136,
  OriginalRow227TriangleData1323.coefficient101_137,
  OriginalRow227TriangleData1323.coefficient101_138,
  OriginalRow227TriangleData1323.coefficient101_139,
  OriginalRow227TriangleData1323.coefficient101_140,
  OriginalRow227TriangleData1323.coefficient101_141,
  OriginalRow227TriangleData1323.coefficient101_142,
  OriginalRow227TriangleData1323.coefficient101_143,
  OriginalRow227TriangleData1323.coefficient101_144,
  OriginalRow227TriangleData1323.coefficient101_145,
  OriginalRow227TriangleData1323.coefficient101_146,
  OriginalRow227TriangleData1323.coefficient101_147,
  OriginalRow227TriangleData1323.coefficient101_148,
  OriginalRow227TriangleData1323.coefficient101_149,
  OriginalRow227TriangleData1323.coefficient101_150,
  OriginalRow227TriangleData1323.coefficient101_151,
  OriginalRow227TriangleData1323.coefficient101_152,
  OriginalRow227TriangleData1323.coefficient101_153,
  OriginalRow227TriangleData1323.coefficient101_154,
  OriginalRow227TriangleData1323.coefficient101_155,
  OriginalRow227TriangleData1323.coefficient101_156,
  OriginalRow227TriangleData1323.coefficient101_157,
  OriginalRow227TriangleData1323.coefficient101_158,
  OriginalRow227TriangleData1323.coefficient101_159,
  OriginalRow227TriangleData1323.coefficient101_160,
  OriginalRow227TriangleData1323.coefficient101_161,
  OriginalRow227TriangleData1323.coefficient101_162,
  OriginalRow227TriangleData1323.coefficient101_163
]

theorem values1323_size : values1323.size = 32 := rfl

def block1323 : ℕ → Option IntervalDyadic := segment 132 values1323

theorem block1323_domain : ExactDomain block1323 132 164 := by
  simpa only [values1323_size] using segment_domain 132 values1323

theorem block1323_get (i : Fin 32) :
    block1323 (132 + i.val) = some (values1323[i.val]'(by rw [values1323_size]; exact i.isLt)) := by
  exact segment_get 132 values1323 ⟨i.val, by rw [values1323_size]; exact i.isLt⟩

def values1324 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1324.coefficient101_164,
  OriginalRow227TriangleData1324.coefficient101_165,
  OriginalRow227TriangleData1324.coefficient101_166,
  OriginalRow227TriangleData1324.coefficient101_167,
  OriginalRow227TriangleData1324.coefficient101_168,
  OriginalRow227TriangleData1324.coefficient101_169,
  OriginalRow227TriangleData1324.coefficient101_170,
  OriginalRow227TriangleData1324.coefficient101_171,
  OriginalRow227TriangleData1324.coefficient101_172,
  OriginalRow227TriangleData1324.coefficient101_173,
  OriginalRow227TriangleData1324.coefficient101_174,
  OriginalRow227TriangleData1324.coefficient101_175,
  OriginalRow227TriangleData1324.coefficient101_176,
  OriginalRow227TriangleData1324.coefficient101_177,
  OriginalRow227TriangleData1324.coefficient101_178,
  OriginalRow227TriangleData1324.coefficient101_179,
  OriginalRow227TriangleData1324.coefficient101_180,
  OriginalRow227TriangleData1324.coefficient101_181,
  OriginalRow227TriangleData1324.coefficient101_182,
  OriginalRow227TriangleData1324.coefficient101_183,
  OriginalRow227TriangleData1324.coefficient101_184,
  OriginalRow227TriangleData1324.coefficient101_185,
  OriginalRow227TriangleData1324.coefficient101_186,
  OriginalRow227TriangleData1324.coefficient101_187,
  OriginalRow227TriangleData1324.coefficient101_188,
  OriginalRow227TriangleData1324.coefficient101_189,
  OriginalRow227TriangleData1324.coefficient101_190,
  OriginalRow227TriangleData1324.coefficient101_191,
  OriginalRow227TriangleData1324.coefficient101_192,
  OriginalRow227TriangleData1324.coefficient101_193,
  OriginalRow227TriangleData1324.coefficient101_194,
  OriginalRow227TriangleData1324.coefficient101_195
]

theorem values1324_size : values1324.size = 32 := rfl

def block1324 : ℕ → Option IntervalDyadic := segment 164 values1324

theorem block1324_domain : ExactDomain block1324 164 196 := by
  simpa only [values1324_size] using segment_domain 164 values1324

theorem block1324_get (i : Fin 32) :
    block1324 (164 + i.val) = some (values1324[i.val]'(by rw [values1324_size]; exact i.isLt)) := by
  exact segment_get 164 values1324 ⟨i.val, by rw [values1324_size]; exact i.isLt⟩

def values1325 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1325.coefficient101_196,
  OriginalRow227TriangleData1325.coefficient101_197,
  OriginalRow227TriangleData1325.coefficient101_198,
  OriginalRow227TriangleData1325.coefficient101_199,
  OriginalRow227TriangleData1325.coefficient101_200,
  OriginalRow227TriangleData1325.coefficient101_201,
  OriginalRow227TriangleData1325.coefficient101_202,
  OriginalRow227TriangleData1325.coefficient101_203,
  OriginalRow227TriangleData1325.coefficient101_204,
  OriginalRow227TriangleData1325.coefficient101_205,
  OriginalRow227TriangleData1325.coefficient101_206,
  OriginalRow227TriangleData1325.coefficient101_207,
  OriginalRow227TriangleData1325.coefficient101_208,
  OriginalRow227TriangleData1325.coefficient101_209,
  OriginalRow227TriangleData1325.coefficient101_210,
  OriginalRow227TriangleData1325.coefficient101_211,
  OriginalRow227TriangleData1325.coefficient101_212,
  OriginalRow227TriangleData1325.coefficient101_213,
  OriginalRow227TriangleData1325.coefficient101_214,
  OriginalRow227TriangleData1325.coefficient101_215,
  OriginalRow227TriangleData1325.coefficient101_216,
  OriginalRow227TriangleData1325.coefficient101_217,
  OriginalRow227TriangleData1325.coefficient101_218,
  OriginalRow227TriangleData1325.coefficient101_219,
  OriginalRow227TriangleData1325.coefficient101_220,
  OriginalRow227TriangleData1325.coefficient101_221,
  OriginalRow227TriangleData1325.coefficient101_222,
  OriginalRow227TriangleData1325.coefficient101_223,
  OriginalRow227TriangleData1325.coefficient101_224,
  OriginalRow227TriangleData1325.coefficient101_225,
  OriginalRow227TriangleData1325.coefficient101_226,
  OriginalRow227TriangleData1325.coefficient101_227
]

theorem values1325_size : values1325.size = 32 := rfl

def block1325 : ℕ → Option IntervalDyadic := segment 196 values1325

theorem block1325_domain : ExactDomain block1325 196 228 := by
  simpa only [values1325_size] using segment_domain 196 values1325

theorem block1325_get (i : Fin 32) :
    block1325 (196 + i.val) = some (values1325[i.val]'(by rw [values1325_size]; exact i.isLt)) := by
  exact segment_get 196 values1325 ⟨i.val, by rw [values1325_size]; exact i.isLt⟩

def values1326 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1326.coefficient101_228,
  OriginalRow227TriangleData1326.coefficient101_229,
  OriginalRow227TriangleData1326.coefficient101_230,
  OriginalRow227TriangleData1326.coefficient101_231,
  OriginalRow227TriangleData1326.coefficient101_232,
  OriginalRow227TriangleData1326.coefficient101_233,
  OriginalRow227TriangleData1326.coefficient101_234,
  OriginalRow227TriangleData1326.coefficient101_235,
  OriginalRow227TriangleData1326.coefficient101_236,
  OriginalRow227TriangleData1326.coefficient101_237,
  OriginalRow227TriangleData1326.coefficient101_238,
  OriginalRow227TriangleData1326.coefficient101_239,
  OriginalRow227TriangleData1326.coefficient101_240,
  OriginalRow227TriangleData1326.coefficient101_241,
  OriginalRow227TriangleData1326.coefficient101_242,
  OriginalRow227TriangleData1326.coefficient101_243,
  OriginalRow227TriangleData1326.coefficient101_244,
  OriginalRow227TriangleData1326.coefficient101_245,
  OriginalRow227TriangleData1326.coefficient101_246,
  OriginalRow227TriangleData1326.coefficient101_247,
  OriginalRow227TriangleData1326.coefficient101_248,
  OriginalRow227TriangleData1326.coefficient101_249,
  OriginalRow227TriangleData1326.coefficient101_250,
  OriginalRow227TriangleData1326.coefficient101_251,
  OriginalRow227TriangleData1326.coefficient101_252,
  OriginalRow227TriangleData1326.coefficient101_253,
  OriginalRow227TriangleData1326.coefficient101_254,
  OriginalRow227TriangleData1326.coefficient101_255,
  OriginalRow227TriangleData1326.coefficient101_256,
  OriginalRow227TriangleData1326.coefficient101_257,
  OriginalRow227TriangleData1326.coefficient101_258,
  OriginalRow227TriangleData1326.coefficient101_259
]

theorem values1326_size : values1326.size = 32 := rfl

def block1326 : ℕ → Option IntervalDyadic := segment 228 values1326

theorem block1326_domain : ExactDomain block1326 228 260 := by
  simpa only [values1326_size] using segment_domain 228 values1326

theorem block1326_get (i : Fin 32) :
    block1326 (228 + i.val) = some (values1326[i.val]'(by rw [values1326_size]; exact i.isLt)) := by
  exact segment_get 228 values1326 ⟨i.val, by rw [values1326_size]; exact i.isLt⟩

def values1327 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1327.coefficient101_260,
  OriginalRow227TriangleData1327.coefficient101_261,
  OriginalRow227TriangleData1327.coefficient101_262,
  OriginalRow227TriangleData1327.coefficient101_263,
  OriginalRow227TriangleData1327.coefficient101_264,
  OriginalRow227TriangleData1327.coefficient101_265,
  OriginalRow227TriangleData1327.coefficient101_266,
  OriginalRow227TriangleData1327.coefficient101_267,
  OriginalRow227TriangleData1327.coefficient101_268,
  OriginalRow227TriangleData1327.coefficient101_269,
  OriginalRow227TriangleData1327.coefficient101_270,
  OriginalRow227TriangleData1327.coefficient101_271,
  OriginalRow227TriangleData1327.coefficient101_272,
  OriginalRow227TriangleData1327.coefficient101_273,
  OriginalRow227TriangleData1327.coefficient101_274,
  OriginalRow227TriangleData1327.coefficient101_275,
  OriginalRow227TriangleData1327.coefficient101_276,
  OriginalRow227TriangleData1327.coefficient101_277,
  OriginalRow227TriangleData1327.coefficient101_278,
  OriginalRow227TriangleData1327.coefficient101_279,
  OriginalRow227TriangleData1327.coefficient101_280,
  OriginalRow227TriangleData1327.coefficient101_281,
  OriginalRow227TriangleData1327.coefficient101_282,
  OriginalRow227TriangleData1327.coefficient101_283,
  OriginalRow227TriangleData1327.coefficient101_284,
  OriginalRow227TriangleData1327.coefficient101_285,
  OriginalRow227TriangleData1327.coefficient101_286,
  OriginalRow227TriangleData1327.coefficient101_287,
  OriginalRow227TriangleData1327.coefficient101_288,
  OriginalRow227TriangleData1327.coefficient101_289,
  OriginalRow227TriangleData1327.coefficient101_290,
  OriginalRow227TriangleData1327.coefficient101_291
]

theorem values1327_size : values1327.size = 32 := rfl

def block1327 : ℕ → Option IntervalDyadic := segment 260 values1327

theorem block1327_domain : ExactDomain block1327 260 292 := by
  simpa only [values1327_size] using segment_domain 260 values1327

theorem block1327_get (i : Fin 32) :
    block1327 (260 + i.val) = some (values1327[i.val]'(by rw [values1327_size]; exact i.isLt)) := by
  exact segment_get 260 values1327 ⟨i.val, by rw [values1327_size]; exact i.isLt⟩

def values1328 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1328.coefficient101_292,
  OriginalRow227TriangleData1328.coefficient101_293,
  OriginalRow227TriangleData1328.coefficient101_294,
  OriginalRow227TriangleData1328.coefficient101_295,
  OriginalRow227TriangleData1328.coefficient101_296,
  OriginalRow227TriangleData1328.coefficient101_297,
  OriginalRow227TriangleData1328.coefficient101_298,
  OriginalRow227TriangleData1328.coefficient101_299,
  OriginalRow227TriangleData1328.coefficient101_300,
  OriginalRow227TriangleData1328.coefficient101_301,
  OriginalRow227TriangleData1328.coefficient101_302,
  OriginalRow227TriangleData1328.coefficient101_303,
  OriginalRow227TriangleData1328.coefficient101_304,
  OriginalRow227TriangleData1328.coefficient101_305,
  OriginalRow227TriangleData1328.coefficient101_306,
  OriginalRow227TriangleData1328.coefficient101_307,
  OriginalRow227TriangleData1328.coefficient101_308,
  OriginalRow227TriangleData1328.coefficient101_309,
  OriginalRow227TriangleData1328.coefficient101_310,
  OriginalRow227TriangleData1328.coefficient101_311,
  OriginalRow227TriangleData1328.coefficient101_312,
  OriginalRow227TriangleData1328.coefficient101_313,
  OriginalRow227TriangleData1328.coefficient101_314,
  OriginalRow227TriangleData1328.coefficient101_315,
  OriginalRow227TriangleData1328.coefficient101_316,
  OriginalRow227TriangleData1328.coefficient101_317,
  OriginalRow227TriangleData1328.coefficient101_318,
  OriginalRow227TriangleData1328.coefficient101_319,
  OriginalRow227TriangleData1328.coefficient101_320,
  OriginalRow227TriangleData1328.coefficient101_321,
  OriginalRow227TriangleData1328.coefficient101_322,
  OriginalRow227TriangleData1328.coefficient101_323
]

theorem values1328_size : values1328.size = 32 := rfl

def block1328 : ℕ → Option IntervalDyadic := segment 292 values1328

theorem block1328_domain : ExactDomain block1328 292 324 := by
  simpa only [values1328_size] using segment_domain 292 values1328

theorem block1328_get (i : Fin 32) :
    block1328 (292 + i.val) = some (values1328[i.val]'(by rw [values1328_size]; exact i.isLt)) := by
  exact segment_get 292 values1328 ⟨i.val, by rw [values1328_size]; exact i.isLt⟩

def values1329 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1329.coefficient101_324,
  OriginalRow227TriangleData1329.coefficient101_325,
  OriginalRow227TriangleData1329.coefficient101_326,
  OriginalRow227TriangleData1329.coefficient101_327,
  OriginalRow227TriangleData1329.coefficient101_328,
  OriginalRow227TriangleData1329.coefficient101_329,
  OriginalRow227TriangleData1329.coefficient101_330,
  OriginalRow227TriangleData1329.coefficient101_331,
  OriginalRow227TriangleData1329.coefficient101_332,
  OriginalRow227TriangleData1329.coefficient101_333,
  OriginalRow227TriangleData1329.coefficient101_334,
  OriginalRow227TriangleData1329.coefficient101_335,
  OriginalRow227TriangleData1329.coefficient101_336,
  OriginalRow227TriangleData1329.coefficient101_337,
  OriginalRow227TriangleData1329.coefficient101_338,
  OriginalRow227TriangleData1329.coefficient101_339,
  OriginalRow227TriangleData1329.coefficient101_340,
  OriginalRow227TriangleData1329.coefficient101_341,
  OriginalRow227TriangleData1329.coefficient101_342,
  OriginalRow227TriangleData1329.coefficient101_343,
  OriginalRow227TriangleData1329.coefficient101_344,
  OriginalRow227TriangleData1329.coefficient101_345,
  OriginalRow227TriangleData1329.coefficient101_346,
  OriginalRow227TriangleData1329.coefficient101_347,
  OriginalRow227TriangleData1329.coefficient101_348,
  OriginalRow227TriangleData1329.coefficient101_349,
  OriginalRow227TriangleData1329.coefficient101_350,
  OriginalRow227TriangleData1329.coefficient101_351,
  OriginalRow227TriangleData1329.coefficient101_352,
  OriginalRow227TriangleData1329.coefficient101_353,
  OriginalRow227TriangleData1329.coefficient101_354,
  OriginalRow227TriangleData1329.coefficient101_355
]

theorem values1329_size : values1329.size = 32 := rfl

def block1329 : ℕ → Option IntervalDyadic := segment 324 values1329

theorem block1329_domain : ExactDomain block1329 324 356 := by
  simpa only [values1329_size] using segment_domain 324 values1329

theorem block1329_get (i : Fin 32) :
    block1329 (324 + i.val) = some (values1329[i.val]'(by rw [values1329_size]; exact i.isLt)) := by
  exact segment_get 324 values1329 ⟨i.val, by rw [values1329_size]; exact i.isLt⟩

def values1330 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1330.coefficient101_356,
  OriginalRow227TriangleData1330.coefficient101_357,
  OriginalRow227TriangleData1330.coefficient101_358,
  OriginalRow227TriangleData1330.coefficient101_359,
  OriginalRow227TriangleData1330.coefficient101_360,
  OriginalRow227TriangleData1330.coefficient101_361,
  OriginalRow227TriangleData1330.coefficient101_362,
  OriginalRow227TriangleData1330.coefficient101_363,
  OriginalRow227TriangleData1330.coefficient101_364,
  OriginalRow227TriangleData1330.coefficient101_365,
  OriginalRow227TriangleData1330.coefficient101_366,
  OriginalRow227TriangleData1330.coefficient101_367,
  OriginalRow227TriangleData1330.coefficient101_368,
  OriginalRow227TriangleData1330.coefficient101_369,
  OriginalRow227TriangleData1330.coefficient101_370,
  OriginalRow227TriangleData1330.coefficient101_371,
  OriginalRow227TriangleData1330.coefficient101_372,
  OriginalRow227TriangleData1330.coefficient101_373,
  OriginalRow227TriangleData1330.coefficient101_374,
  OriginalRow227TriangleData1330.coefficient101_375,
  OriginalRow227TriangleData1330.coefficient101_376,
  OriginalRow227TriangleData1330.coefficient101_377,
  OriginalRow227TriangleData1330.coefficient101_378,
  OriginalRow227TriangleData1330.coefficient101_379,
  OriginalRow227TriangleData1330.coefficient101_380,
  OriginalRow227TriangleData1330.coefficient101_381,
  OriginalRow227TriangleData1330.coefficient101_382,
  OriginalRow227TriangleData1330.coefficient101_383,
  OriginalRow227TriangleData1330.coefficient101_384,
  OriginalRow227TriangleData1330.coefficient101_385,
  OriginalRow227TriangleData1330.coefficient101_386,
  OriginalRow227TriangleData1330.coefficient101_387
]

theorem values1330_size : values1330.size = 32 := rfl

def block1330 : ℕ → Option IntervalDyadic := segment 356 values1330

theorem block1330_domain : ExactDomain block1330 356 388 := by
  simpa only [values1330_size] using segment_domain 356 values1330

theorem block1330_get (i : Fin 32) :
    block1330 (356 + i.val) = some (values1330[i.val]'(by rw [values1330_size]; exact i.isLt)) := by
  exact segment_get 356 values1330 ⟨i.val, by rw [values1330_size]; exact i.isLt⟩

def values1331 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1331.coefficient101_388,
  OriginalRow227TriangleData1331.coefficient101_389,
  OriginalRow227TriangleData1331.coefficient101_390,
  OriginalRow227TriangleData1331.coefficient101_391,
  OriginalRow227TriangleData1331.coefficient101_392,
  OriginalRow227TriangleData1331.coefficient101_393,
  OriginalRow227TriangleData1331.coefficient101_394,
  OriginalRow227TriangleData1331.coefficient101_395,
  OriginalRow227TriangleData1331.coefficient101_396,
  OriginalRow227TriangleData1331.coefficient101_397,
  OriginalRow227TriangleData1331.coefficient101_398,
  OriginalRow227TriangleData1331.coefficient101_399,
  OriginalRow227TriangleData1331.coefficient101_400
]

theorem values1331_size : values1331.size = 13 := rfl

def block1331 : ℕ → Option IntervalDyadic := segment 388 values1331

theorem block1331_domain : ExactDomain block1331 388 401 := by
  simpa only [values1331_size] using segment_domain 388 values1331

theorem block1331_get (i : Fin 13) :
    block1331 (388 + i.val) = some (values1331[i.val]'(by rw [values1331_size]; exact i.isLt)) := by
  exact segment_get 388 values1331 ⟨i.val, by rw [values1331_size]; exact i.isLt⟩

def node0100_0164 : ℕ → Option IntervalDyadic := split 132 block1322 block1323

theorem node0100_0164_domain : ExactDomain node0100_0164 100 164 := by
  exact split_domain (by decide) (by decide) block1322_domain block1323_domain

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block1325 block1326

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block1325_domain block1326_domain

def node0164_0260 : ℕ → Option IntervalDyadic := split 196 block1324 node0196_0260

theorem node0164_0260_domain : ExactDomain node0164_0260 164 260 := by
  exact split_domain (by decide) (by decide) block1324_domain node0196_0260_domain

def node0100_0260 : ℕ → Option IntervalDyadic := split 164 node0100_0164 node0164_0260

theorem node0100_0260_domain : ExactDomain node0100_0260 100 260 := by
  exact split_domain (by decide) (by decide) node0100_0164_domain node0164_0260_domain

def node0260_0324 : ℕ → Option IntervalDyadic := split 292 block1327 block1328

theorem node0260_0324_domain : ExactDomain node0260_0324 260 324 := by
  exact split_domain (by decide) (by decide) block1327_domain block1328_domain

def node0356_0401 : ℕ → Option IntervalDyadic := split 388 block1330 block1331

theorem node0356_0401_domain : ExactDomain node0356_0401 356 401 := by
  exact split_domain (by decide) (by decide) block1330_domain block1331_domain

def node0324_0401 : ℕ → Option IntervalDyadic := split 356 block1329 node0356_0401

theorem node0324_0401_domain : ExactDomain node0324_0401 324 401 := by
  exact split_domain (by decide) (by decide) block1329_domain node0356_0401_domain

def node0260_0401 : ℕ → Option IntervalDyadic := split 324 node0260_0324 node0324_0401

theorem node0260_0401_domain : ExactDomain node0260_0401 260 401 := by
  exact split_domain (by decide) (by decide) node0260_0324_domain node0324_0401_domain

def node0100_0401 : ℕ → Option IntervalDyadic := split 260 node0100_0260 node0260_0401

theorem node0100_0401_domain : ExactDomain node0100_0401 100 401 := by
  exact split_domain (by decide) (by decide) node0100_0260_domain node0260_0401_domain

def lookup : ℕ → Option IntervalDyadic := node0100_0401

theorem lookup_domain : ExactDomain lookup 100 401 :=
  node0100_0401_domain

theorem block1322_lookup (i : Fin 32) :
    lookup (100 + i.val) = some (values1322[i.val]'(by rw [values1322_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (100 + i.val) = _
  rw [node0100_0401, split_left 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0100_0260, split_left 164 node0100_0164 node0164_0260 (by omega)]
  rw [node0100_0164, split_left 132 block1322 block1323 (by omega)]
  exact block1322_get i

theorem block1323_lookup (i : Fin 32) :
    lookup (132 + i.val) = some (values1323[i.val]'(by rw [values1323_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (132 + i.val) = _
  rw [node0100_0401, split_left 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0100_0260, split_left 164 node0100_0164 node0164_0260 (by omega)]
  rw [node0100_0164, split_right 132 block1322 block1323 (by omega)]
  exact block1323_get i

theorem block1324_lookup (i : Fin 32) :
    lookup (164 + i.val) = some (values1324[i.val]'(by rw [values1324_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (164 + i.val) = _
  rw [node0100_0401, split_left 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0100_0260, split_right 164 node0100_0164 node0164_0260 (by omega)]
  rw [node0164_0260, split_left 196 block1324 node0196_0260 (by omega)]
  exact block1324_get i

theorem block1325_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values1325[i.val]'(by rw [values1325_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (196 + i.val) = _
  rw [node0100_0401, split_left 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0100_0260, split_right 164 node0100_0164 node0164_0260 (by omega)]
  rw [node0164_0260, split_right 196 block1324 node0196_0260 (by omega)]
  rw [node0196_0260, split_left 228 block1325 block1326 (by omega)]
  exact block1325_get i

theorem block1326_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values1326[i.val]'(by rw [values1326_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (228 + i.val) = _
  rw [node0100_0401, split_left 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0100_0260, split_right 164 node0100_0164 node0164_0260 (by omega)]
  rw [node0164_0260, split_right 196 block1324 node0196_0260 (by omega)]
  rw [node0196_0260, split_right 228 block1325 block1326 (by omega)]
  exact block1326_get i

theorem block1327_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values1327[i.val]'(by rw [values1327_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (260 + i.val) = _
  rw [node0100_0401, split_right 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0260_0401, split_left 324 node0260_0324 node0324_0401 (by omega)]
  rw [node0260_0324, split_left 292 block1327 block1328 (by omega)]
  exact block1327_get i

theorem block1328_lookup (i : Fin 32) :
    lookup (292 + i.val) = some (values1328[i.val]'(by rw [values1328_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (292 + i.val) = _
  rw [node0100_0401, split_right 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0260_0401, split_left 324 node0260_0324 node0324_0401 (by omega)]
  rw [node0260_0324, split_right 292 block1327 block1328 (by omega)]
  exact block1328_get i

theorem block1329_lookup (i : Fin 32) :
    lookup (324 + i.val) = some (values1329[i.val]'(by rw [values1329_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (324 + i.val) = _
  rw [node0100_0401, split_right 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0260_0401, split_right 324 node0260_0324 node0324_0401 (by omega)]
  rw [node0324_0401, split_left 356 block1329 node0356_0401 (by omega)]
  exact block1329_get i

theorem block1330_lookup (i : Fin 32) :
    lookup (356 + i.val) = some (values1330[i.val]'(by rw [values1330_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (356 + i.val) = _
  rw [node0100_0401, split_right 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0260_0401, split_right 324 node0260_0324 node0324_0401 (by omega)]
  rw [node0324_0401, split_right 356 block1329 node0356_0401 (by omega)]
  rw [node0356_0401, split_left 388 block1330 block1331 (by omega)]
  exact block1330_get i

theorem block1331_lookup (i : Fin 13) :
    lookup (388 + i.val) = some (values1331[i.val]'(by rw [values1331_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0100_0401 (388 + i.val) = _
  rw [node0100_0401, split_right 260 node0100_0260 node0260_0401 (by omega)]
  rw [node0260_0401, split_right 324 node0260_0324 node0324_0401 (by omega)]
  rw [node0324_0401, split_right 356 block1329 node0356_0401 (by omega)]
  rw [node0356_0401, split_right 388 block1330 block1331 (by omega)]
  exact block1331_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1322_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1322_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1323_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1323_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1324_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1324_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1325_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1325_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1326_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1326_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1327_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1327_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1328_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1328_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1329_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1329_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1330_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1330_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1331_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1331_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1322_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1323_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1324_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1325_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1326_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1327_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1328_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1329_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1330_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow101.block1331_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow101
