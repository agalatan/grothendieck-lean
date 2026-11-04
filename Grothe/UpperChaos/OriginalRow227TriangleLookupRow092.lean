import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1232
import Grothe.UpperChaos.OriginalRow227TriangleData1233
import Grothe.UpperChaos.OriginalRow227TriangleData1234
import Grothe.UpperChaos.OriginalRow227TriangleData1235
import Grothe.UpperChaos.OriginalRow227TriangleData1236
import Grothe.UpperChaos.OriginalRow227TriangleData1237
import Grothe.UpperChaos.OriginalRow227TriangleData1238
import Grothe.UpperChaos.OriginalRow227TriangleData1239
import Grothe.UpperChaos.OriginalRow227TriangleData1240
import Grothe.UpperChaos.OriginalRow227TriangleData1241

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow092

open ConditionalTableLookup

def values1232 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1232.coefficient92_91,
  OriginalRow227TriangleData1232.coefficient92_92,
  OriginalRow227TriangleData1232.coefficient92_93,
  OriginalRow227TriangleData1232.coefficient92_94,
  OriginalRow227TriangleData1232.coefficient92_95,
  OriginalRow227TriangleData1232.coefficient92_96,
  OriginalRow227TriangleData1232.coefficient92_97,
  OriginalRow227TriangleData1232.coefficient92_98,
  OriginalRow227TriangleData1232.coefficient92_99,
  OriginalRow227TriangleData1232.coefficient92_100,
  OriginalRow227TriangleData1232.coefficient92_101,
  OriginalRow227TriangleData1232.coefficient92_102,
  OriginalRow227TriangleData1232.coefficient92_103,
  OriginalRow227TriangleData1232.coefficient92_104,
  OriginalRow227TriangleData1232.coefficient92_105,
  OriginalRow227TriangleData1232.coefficient92_106,
  OriginalRow227TriangleData1232.coefficient92_107,
  OriginalRow227TriangleData1232.coefficient92_108,
  OriginalRow227TriangleData1232.coefficient92_109,
  OriginalRow227TriangleData1232.coefficient92_110,
  OriginalRow227TriangleData1232.coefficient92_111,
  OriginalRow227TriangleData1232.coefficient92_112,
  OriginalRow227TriangleData1232.coefficient92_113,
  OriginalRow227TriangleData1232.coefficient92_114,
  OriginalRow227TriangleData1232.coefficient92_115,
  OriginalRow227TriangleData1232.coefficient92_116,
  OriginalRow227TriangleData1232.coefficient92_117,
  OriginalRow227TriangleData1232.coefficient92_118,
  OriginalRow227TriangleData1232.coefficient92_119,
  OriginalRow227TriangleData1232.coefficient92_120,
  OriginalRow227TriangleData1232.coefficient92_121,
  OriginalRow227TriangleData1232.coefficient92_122
]

theorem values1232_size : values1232.size = 32 := rfl

def block1232 : ℕ → Option IntervalDyadic := segment 91 values1232

theorem block1232_domain : ExactDomain block1232 91 123 := by
  simpa only [values1232_size] using segment_domain 91 values1232

theorem block1232_get (i : Fin 32) :
    block1232 (91 + i.val) = some (values1232[i.val]'(by rw [values1232_size]; exact i.isLt)) := by
  exact segment_get 91 values1232 ⟨i.val, by rw [values1232_size]; exact i.isLt⟩

def values1233 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1233.coefficient92_123,
  OriginalRow227TriangleData1233.coefficient92_124,
  OriginalRow227TriangleData1233.coefficient92_125,
  OriginalRow227TriangleData1233.coefficient92_126,
  OriginalRow227TriangleData1233.coefficient92_127,
  OriginalRow227TriangleData1233.coefficient92_128,
  OriginalRow227TriangleData1233.coefficient92_129,
  OriginalRow227TriangleData1233.coefficient92_130,
  OriginalRow227TriangleData1233.coefficient92_131,
  OriginalRow227TriangleData1233.coefficient92_132,
  OriginalRow227TriangleData1233.coefficient92_133,
  OriginalRow227TriangleData1233.coefficient92_134,
  OriginalRow227TriangleData1233.coefficient92_135,
  OriginalRow227TriangleData1233.coefficient92_136,
  OriginalRow227TriangleData1233.coefficient92_137,
  OriginalRow227TriangleData1233.coefficient92_138,
  OriginalRow227TriangleData1233.coefficient92_139,
  OriginalRow227TriangleData1233.coefficient92_140,
  OriginalRow227TriangleData1233.coefficient92_141,
  OriginalRow227TriangleData1233.coefficient92_142,
  OriginalRow227TriangleData1233.coefficient92_143,
  OriginalRow227TriangleData1233.coefficient92_144,
  OriginalRow227TriangleData1233.coefficient92_145,
  OriginalRow227TriangleData1233.coefficient92_146,
  OriginalRow227TriangleData1233.coefficient92_147,
  OriginalRow227TriangleData1233.coefficient92_148,
  OriginalRow227TriangleData1233.coefficient92_149,
  OriginalRow227TriangleData1233.coefficient92_150,
  OriginalRow227TriangleData1233.coefficient92_151,
  OriginalRow227TriangleData1233.coefficient92_152,
  OriginalRow227TriangleData1233.coefficient92_153,
  OriginalRow227TriangleData1233.coefficient92_154
]

theorem values1233_size : values1233.size = 32 := rfl

def block1233 : ℕ → Option IntervalDyadic := segment 123 values1233

theorem block1233_domain : ExactDomain block1233 123 155 := by
  simpa only [values1233_size] using segment_domain 123 values1233

theorem block1233_get (i : Fin 32) :
    block1233 (123 + i.val) = some (values1233[i.val]'(by rw [values1233_size]; exact i.isLt)) := by
  exact segment_get 123 values1233 ⟨i.val, by rw [values1233_size]; exact i.isLt⟩

def values1234 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1234.coefficient92_155,
  OriginalRow227TriangleData1234.coefficient92_156,
  OriginalRow227TriangleData1234.coefficient92_157,
  OriginalRow227TriangleData1234.coefficient92_158,
  OriginalRow227TriangleData1234.coefficient92_159,
  OriginalRow227TriangleData1234.coefficient92_160,
  OriginalRow227TriangleData1234.coefficient92_161,
  OriginalRow227TriangleData1234.coefficient92_162,
  OriginalRow227TriangleData1234.coefficient92_163,
  OriginalRow227TriangleData1234.coefficient92_164,
  OriginalRow227TriangleData1234.coefficient92_165,
  OriginalRow227TriangleData1234.coefficient92_166,
  OriginalRow227TriangleData1234.coefficient92_167,
  OriginalRow227TriangleData1234.coefficient92_168,
  OriginalRow227TriangleData1234.coefficient92_169,
  OriginalRow227TriangleData1234.coefficient92_170,
  OriginalRow227TriangleData1234.coefficient92_171,
  OriginalRow227TriangleData1234.coefficient92_172,
  OriginalRow227TriangleData1234.coefficient92_173,
  OriginalRow227TriangleData1234.coefficient92_174,
  OriginalRow227TriangleData1234.coefficient92_175,
  OriginalRow227TriangleData1234.coefficient92_176,
  OriginalRow227TriangleData1234.coefficient92_177,
  OriginalRow227TriangleData1234.coefficient92_178,
  OriginalRow227TriangleData1234.coefficient92_179,
  OriginalRow227TriangleData1234.coefficient92_180,
  OriginalRow227TriangleData1234.coefficient92_181,
  OriginalRow227TriangleData1234.coefficient92_182,
  OriginalRow227TriangleData1234.coefficient92_183,
  OriginalRow227TriangleData1234.coefficient92_184,
  OriginalRow227TriangleData1234.coefficient92_185,
  OriginalRow227TriangleData1234.coefficient92_186
]

theorem values1234_size : values1234.size = 32 := rfl

def block1234 : ℕ → Option IntervalDyadic := segment 155 values1234

theorem block1234_domain : ExactDomain block1234 155 187 := by
  simpa only [values1234_size] using segment_domain 155 values1234

theorem block1234_get (i : Fin 32) :
    block1234 (155 + i.val) = some (values1234[i.val]'(by rw [values1234_size]; exact i.isLt)) := by
  exact segment_get 155 values1234 ⟨i.val, by rw [values1234_size]; exact i.isLt⟩

def values1235 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1235.coefficient92_187,
  OriginalRow227TriangleData1235.coefficient92_188,
  OriginalRow227TriangleData1235.coefficient92_189,
  OriginalRow227TriangleData1235.coefficient92_190,
  OriginalRow227TriangleData1235.coefficient92_191,
  OriginalRow227TriangleData1235.coefficient92_192,
  OriginalRow227TriangleData1235.coefficient92_193,
  OriginalRow227TriangleData1235.coefficient92_194,
  OriginalRow227TriangleData1235.coefficient92_195,
  OriginalRow227TriangleData1235.coefficient92_196,
  OriginalRow227TriangleData1235.coefficient92_197,
  OriginalRow227TriangleData1235.coefficient92_198,
  OriginalRow227TriangleData1235.coefficient92_199,
  OriginalRow227TriangleData1235.coefficient92_200,
  OriginalRow227TriangleData1235.coefficient92_201,
  OriginalRow227TriangleData1235.coefficient92_202,
  OriginalRow227TriangleData1235.coefficient92_203,
  OriginalRow227TriangleData1235.coefficient92_204,
  OriginalRow227TriangleData1235.coefficient92_205,
  OriginalRow227TriangleData1235.coefficient92_206,
  OriginalRow227TriangleData1235.coefficient92_207,
  OriginalRow227TriangleData1235.coefficient92_208,
  OriginalRow227TriangleData1235.coefficient92_209,
  OriginalRow227TriangleData1235.coefficient92_210,
  OriginalRow227TriangleData1235.coefficient92_211,
  OriginalRow227TriangleData1235.coefficient92_212,
  OriginalRow227TriangleData1235.coefficient92_213,
  OriginalRow227TriangleData1235.coefficient92_214,
  OriginalRow227TriangleData1235.coefficient92_215,
  OriginalRow227TriangleData1235.coefficient92_216,
  OriginalRow227TriangleData1235.coefficient92_217,
  OriginalRow227TriangleData1235.coefficient92_218
]

theorem values1235_size : values1235.size = 32 := rfl

def block1235 : ℕ → Option IntervalDyadic := segment 187 values1235

theorem block1235_domain : ExactDomain block1235 187 219 := by
  simpa only [values1235_size] using segment_domain 187 values1235

theorem block1235_get (i : Fin 32) :
    block1235 (187 + i.val) = some (values1235[i.val]'(by rw [values1235_size]; exact i.isLt)) := by
  exact segment_get 187 values1235 ⟨i.val, by rw [values1235_size]; exact i.isLt⟩

def values1236 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1236.coefficient92_219,
  OriginalRow227TriangleData1236.coefficient92_220,
  OriginalRow227TriangleData1236.coefficient92_221,
  OriginalRow227TriangleData1236.coefficient92_222,
  OriginalRow227TriangleData1236.coefficient92_223,
  OriginalRow227TriangleData1236.coefficient92_224,
  OriginalRow227TriangleData1236.coefficient92_225,
  OriginalRow227TriangleData1236.coefficient92_226,
  OriginalRow227TriangleData1236.coefficient92_227,
  OriginalRow227TriangleData1236.coefficient92_228,
  OriginalRow227TriangleData1236.coefficient92_229,
  OriginalRow227TriangleData1236.coefficient92_230,
  OriginalRow227TriangleData1236.coefficient92_231,
  OriginalRow227TriangleData1236.coefficient92_232,
  OriginalRow227TriangleData1236.coefficient92_233,
  OriginalRow227TriangleData1236.coefficient92_234,
  OriginalRow227TriangleData1236.coefficient92_235,
  OriginalRow227TriangleData1236.coefficient92_236,
  OriginalRow227TriangleData1236.coefficient92_237,
  OriginalRow227TriangleData1236.coefficient92_238,
  OriginalRow227TriangleData1236.coefficient92_239,
  OriginalRow227TriangleData1236.coefficient92_240,
  OriginalRow227TriangleData1236.coefficient92_241,
  OriginalRow227TriangleData1236.coefficient92_242,
  OriginalRow227TriangleData1236.coefficient92_243,
  OriginalRow227TriangleData1236.coefficient92_244,
  OriginalRow227TriangleData1236.coefficient92_245,
  OriginalRow227TriangleData1236.coefficient92_246,
  OriginalRow227TriangleData1236.coefficient92_247,
  OriginalRow227TriangleData1236.coefficient92_248,
  OriginalRow227TriangleData1236.coefficient92_249,
  OriginalRow227TriangleData1236.coefficient92_250
]

theorem values1236_size : values1236.size = 32 := rfl

def block1236 : ℕ → Option IntervalDyadic := segment 219 values1236

theorem block1236_domain : ExactDomain block1236 219 251 := by
  simpa only [values1236_size] using segment_domain 219 values1236

theorem block1236_get (i : Fin 32) :
    block1236 (219 + i.val) = some (values1236[i.val]'(by rw [values1236_size]; exact i.isLt)) := by
  exact segment_get 219 values1236 ⟨i.val, by rw [values1236_size]; exact i.isLt⟩

def values1237 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1237.coefficient92_251,
  OriginalRow227TriangleData1237.coefficient92_252,
  OriginalRow227TriangleData1237.coefficient92_253,
  OriginalRow227TriangleData1237.coefficient92_254,
  OriginalRow227TriangleData1237.coefficient92_255,
  OriginalRow227TriangleData1237.coefficient92_256,
  OriginalRow227TriangleData1237.coefficient92_257,
  OriginalRow227TriangleData1237.coefficient92_258,
  OriginalRow227TriangleData1237.coefficient92_259,
  OriginalRow227TriangleData1237.coefficient92_260,
  OriginalRow227TriangleData1237.coefficient92_261,
  OriginalRow227TriangleData1237.coefficient92_262,
  OriginalRow227TriangleData1237.coefficient92_263,
  OriginalRow227TriangleData1237.coefficient92_264,
  OriginalRow227TriangleData1237.coefficient92_265,
  OriginalRow227TriangleData1237.coefficient92_266,
  OriginalRow227TriangleData1237.coefficient92_267,
  OriginalRow227TriangleData1237.coefficient92_268,
  OriginalRow227TriangleData1237.coefficient92_269,
  OriginalRow227TriangleData1237.coefficient92_270,
  OriginalRow227TriangleData1237.coefficient92_271,
  OriginalRow227TriangleData1237.coefficient92_272,
  OriginalRow227TriangleData1237.coefficient92_273,
  OriginalRow227TriangleData1237.coefficient92_274,
  OriginalRow227TriangleData1237.coefficient92_275,
  OriginalRow227TriangleData1237.coefficient92_276,
  OriginalRow227TriangleData1237.coefficient92_277,
  OriginalRow227TriangleData1237.coefficient92_278,
  OriginalRow227TriangleData1237.coefficient92_279,
  OriginalRow227TriangleData1237.coefficient92_280,
  OriginalRow227TriangleData1237.coefficient92_281,
  OriginalRow227TriangleData1237.coefficient92_282
]

theorem values1237_size : values1237.size = 32 := rfl

def block1237 : ℕ → Option IntervalDyadic := segment 251 values1237

theorem block1237_domain : ExactDomain block1237 251 283 := by
  simpa only [values1237_size] using segment_domain 251 values1237

theorem block1237_get (i : Fin 32) :
    block1237 (251 + i.val) = some (values1237[i.val]'(by rw [values1237_size]; exact i.isLt)) := by
  exact segment_get 251 values1237 ⟨i.val, by rw [values1237_size]; exact i.isLt⟩

def values1238 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1238.coefficient92_283,
  OriginalRow227TriangleData1238.coefficient92_284,
  OriginalRow227TriangleData1238.coefficient92_285,
  OriginalRow227TriangleData1238.coefficient92_286,
  OriginalRow227TriangleData1238.coefficient92_287,
  OriginalRow227TriangleData1238.coefficient92_288,
  OriginalRow227TriangleData1238.coefficient92_289,
  OriginalRow227TriangleData1238.coefficient92_290,
  OriginalRow227TriangleData1238.coefficient92_291,
  OriginalRow227TriangleData1238.coefficient92_292,
  OriginalRow227TriangleData1238.coefficient92_293,
  OriginalRow227TriangleData1238.coefficient92_294,
  OriginalRow227TriangleData1238.coefficient92_295,
  OriginalRow227TriangleData1238.coefficient92_296,
  OriginalRow227TriangleData1238.coefficient92_297,
  OriginalRow227TriangleData1238.coefficient92_298,
  OriginalRow227TriangleData1238.coefficient92_299,
  OriginalRow227TriangleData1238.coefficient92_300,
  OriginalRow227TriangleData1238.coefficient92_301,
  OriginalRow227TriangleData1238.coefficient92_302,
  OriginalRow227TriangleData1238.coefficient92_303,
  OriginalRow227TriangleData1238.coefficient92_304,
  OriginalRow227TriangleData1238.coefficient92_305,
  OriginalRow227TriangleData1238.coefficient92_306,
  OriginalRow227TriangleData1238.coefficient92_307,
  OriginalRow227TriangleData1238.coefficient92_308,
  OriginalRow227TriangleData1238.coefficient92_309,
  OriginalRow227TriangleData1238.coefficient92_310,
  OriginalRow227TriangleData1238.coefficient92_311,
  OriginalRow227TriangleData1238.coefficient92_312,
  OriginalRow227TriangleData1238.coefficient92_313,
  OriginalRow227TriangleData1238.coefficient92_314
]

theorem values1238_size : values1238.size = 32 := rfl

def block1238 : ℕ → Option IntervalDyadic := segment 283 values1238

theorem block1238_domain : ExactDomain block1238 283 315 := by
  simpa only [values1238_size] using segment_domain 283 values1238

theorem block1238_get (i : Fin 32) :
    block1238 (283 + i.val) = some (values1238[i.val]'(by rw [values1238_size]; exact i.isLt)) := by
  exact segment_get 283 values1238 ⟨i.val, by rw [values1238_size]; exact i.isLt⟩

def values1239 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1239.coefficient92_315,
  OriginalRow227TriangleData1239.coefficient92_316,
  OriginalRow227TriangleData1239.coefficient92_317,
  OriginalRow227TriangleData1239.coefficient92_318,
  OriginalRow227TriangleData1239.coefficient92_319,
  OriginalRow227TriangleData1239.coefficient92_320,
  OriginalRow227TriangleData1239.coefficient92_321,
  OriginalRow227TriangleData1239.coefficient92_322,
  OriginalRow227TriangleData1239.coefficient92_323,
  OriginalRow227TriangleData1239.coefficient92_324,
  OriginalRow227TriangleData1239.coefficient92_325,
  OriginalRow227TriangleData1239.coefficient92_326,
  OriginalRow227TriangleData1239.coefficient92_327,
  OriginalRow227TriangleData1239.coefficient92_328,
  OriginalRow227TriangleData1239.coefficient92_329,
  OriginalRow227TriangleData1239.coefficient92_330,
  OriginalRow227TriangleData1239.coefficient92_331,
  OriginalRow227TriangleData1239.coefficient92_332,
  OriginalRow227TriangleData1239.coefficient92_333,
  OriginalRow227TriangleData1239.coefficient92_334,
  OriginalRow227TriangleData1239.coefficient92_335,
  OriginalRow227TriangleData1239.coefficient92_336,
  OriginalRow227TriangleData1239.coefficient92_337,
  OriginalRow227TriangleData1239.coefficient92_338,
  OriginalRow227TriangleData1239.coefficient92_339,
  OriginalRow227TriangleData1239.coefficient92_340,
  OriginalRow227TriangleData1239.coefficient92_341,
  OriginalRow227TriangleData1239.coefficient92_342,
  OriginalRow227TriangleData1239.coefficient92_343,
  OriginalRow227TriangleData1239.coefficient92_344,
  OriginalRow227TriangleData1239.coefficient92_345,
  OriginalRow227TriangleData1239.coefficient92_346
]

theorem values1239_size : values1239.size = 32 := rfl

def block1239 : ℕ → Option IntervalDyadic := segment 315 values1239

theorem block1239_domain : ExactDomain block1239 315 347 := by
  simpa only [values1239_size] using segment_domain 315 values1239

theorem block1239_get (i : Fin 32) :
    block1239 (315 + i.val) = some (values1239[i.val]'(by rw [values1239_size]; exact i.isLt)) := by
  exact segment_get 315 values1239 ⟨i.val, by rw [values1239_size]; exact i.isLt⟩

def values1240 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1240.coefficient92_347,
  OriginalRow227TriangleData1240.coefficient92_348,
  OriginalRow227TriangleData1240.coefficient92_349,
  OriginalRow227TriangleData1240.coefficient92_350,
  OriginalRow227TriangleData1240.coefficient92_351,
  OriginalRow227TriangleData1240.coefficient92_352,
  OriginalRow227TriangleData1240.coefficient92_353,
  OriginalRow227TriangleData1240.coefficient92_354,
  OriginalRow227TriangleData1240.coefficient92_355,
  OriginalRow227TriangleData1240.coefficient92_356,
  OriginalRow227TriangleData1240.coefficient92_357,
  OriginalRow227TriangleData1240.coefficient92_358,
  OriginalRow227TriangleData1240.coefficient92_359,
  OriginalRow227TriangleData1240.coefficient92_360,
  OriginalRow227TriangleData1240.coefficient92_361,
  OriginalRow227TriangleData1240.coefficient92_362,
  OriginalRow227TriangleData1240.coefficient92_363,
  OriginalRow227TriangleData1240.coefficient92_364,
  OriginalRow227TriangleData1240.coefficient92_365,
  OriginalRow227TriangleData1240.coefficient92_366,
  OriginalRow227TriangleData1240.coefficient92_367,
  OriginalRow227TriangleData1240.coefficient92_368,
  OriginalRow227TriangleData1240.coefficient92_369,
  OriginalRow227TriangleData1240.coefficient92_370,
  OriginalRow227TriangleData1240.coefficient92_371,
  OriginalRow227TriangleData1240.coefficient92_372,
  OriginalRow227TriangleData1240.coefficient92_373,
  OriginalRow227TriangleData1240.coefficient92_374,
  OriginalRow227TriangleData1240.coefficient92_375,
  OriginalRow227TriangleData1240.coefficient92_376,
  OriginalRow227TriangleData1240.coefficient92_377,
  OriginalRow227TriangleData1240.coefficient92_378
]

theorem values1240_size : values1240.size = 32 := rfl

def block1240 : ℕ → Option IntervalDyadic := segment 347 values1240

theorem block1240_domain : ExactDomain block1240 347 379 := by
  simpa only [values1240_size] using segment_domain 347 values1240

theorem block1240_get (i : Fin 32) :
    block1240 (347 + i.val) = some (values1240[i.val]'(by rw [values1240_size]; exact i.isLt)) := by
  exact segment_get 347 values1240 ⟨i.val, by rw [values1240_size]; exact i.isLt⟩

def values1241 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1241.coefficient92_379,
  OriginalRow227TriangleData1241.coefficient92_380,
  OriginalRow227TriangleData1241.coefficient92_381,
  OriginalRow227TriangleData1241.coefficient92_382,
  OriginalRow227TriangleData1241.coefficient92_383,
  OriginalRow227TriangleData1241.coefficient92_384,
  OriginalRow227TriangleData1241.coefficient92_385,
  OriginalRow227TriangleData1241.coefficient92_386,
  OriginalRow227TriangleData1241.coefficient92_387,
  OriginalRow227TriangleData1241.coefficient92_388,
  OriginalRow227TriangleData1241.coefficient92_389,
  OriginalRow227TriangleData1241.coefficient92_390,
  OriginalRow227TriangleData1241.coefficient92_391,
  OriginalRow227TriangleData1241.coefficient92_392,
  OriginalRow227TriangleData1241.coefficient92_393,
  OriginalRow227TriangleData1241.coefficient92_394,
  OriginalRow227TriangleData1241.coefficient92_395,
  OriginalRow227TriangleData1241.coefficient92_396,
  OriginalRow227TriangleData1241.coefficient92_397,
  OriginalRow227TriangleData1241.coefficient92_398,
  OriginalRow227TriangleData1241.coefficient92_399,
  OriginalRow227TriangleData1241.coefficient92_400,
  OriginalRow227TriangleData1241.coefficient92_401,
  OriginalRow227TriangleData1241.coefficient92_402,
  OriginalRow227TriangleData1241.coefficient92_403,
  OriginalRow227TriangleData1241.coefficient92_404,
  OriginalRow227TriangleData1241.coefficient92_405,
  OriginalRow227TriangleData1241.coefficient92_406,
  OriginalRow227TriangleData1241.coefficient92_407,
  OriginalRow227TriangleData1241.coefficient92_408,
  OriginalRow227TriangleData1241.coefficient92_409
]

theorem values1241_size : values1241.size = 31 := rfl

def block1241 : ℕ → Option IntervalDyadic := segment 379 values1241

theorem block1241_domain : ExactDomain block1241 379 410 := by
  simpa only [values1241_size] using segment_domain 379 values1241

theorem block1241_get (i : Fin 31) :
    block1241 (379 + i.val) = some (values1241[i.val]'(by rw [values1241_size]; exact i.isLt)) := by
  exact segment_get 379 values1241 ⟨i.val, by rw [values1241_size]; exact i.isLt⟩

def node0091_0155 : ℕ → Option IntervalDyadic := split 123 block1232 block1233

theorem node0091_0155_domain : ExactDomain node0091_0155 91 155 := by
  exact split_domain (by decide) (by decide) block1232_domain block1233_domain

def node0187_0251 : ℕ → Option IntervalDyadic := split 219 block1235 block1236

theorem node0187_0251_domain : ExactDomain node0187_0251 187 251 := by
  exact split_domain (by decide) (by decide) block1235_domain block1236_domain

def node0155_0251 : ℕ → Option IntervalDyadic := split 187 block1234 node0187_0251

theorem node0155_0251_domain : ExactDomain node0155_0251 155 251 := by
  exact split_domain (by decide) (by decide) block1234_domain node0187_0251_domain

def node0091_0251 : ℕ → Option IntervalDyadic := split 155 node0091_0155 node0155_0251

theorem node0091_0251_domain : ExactDomain node0091_0251 91 251 := by
  exact split_domain (by decide) (by decide) node0091_0155_domain node0155_0251_domain

def node0251_0315 : ℕ → Option IntervalDyadic := split 283 block1237 block1238

theorem node0251_0315_domain : ExactDomain node0251_0315 251 315 := by
  exact split_domain (by decide) (by decide) block1237_domain block1238_domain

def node0347_0410 : ℕ → Option IntervalDyadic := split 379 block1240 block1241

theorem node0347_0410_domain : ExactDomain node0347_0410 347 410 := by
  exact split_domain (by decide) (by decide) block1240_domain block1241_domain

def node0315_0410 : ℕ → Option IntervalDyadic := split 347 block1239 node0347_0410

theorem node0315_0410_domain : ExactDomain node0315_0410 315 410 := by
  exact split_domain (by decide) (by decide) block1239_domain node0347_0410_domain

def node0251_0410 : ℕ → Option IntervalDyadic := split 315 node0251_0315 node0315_0410

theorem node0251_0410_domain : ExactDomain node0251_0410 251 410 := by
  exact split_domain (by decide) (by decide) node0251_0315_domain node0315_0410_domain

def node0091_0410 : ℕ → Option IntervalDyadic := split 251 node0091_0251 node0251_0410

theorem node0091_0410_domain : ExactDomain node0091_0410 91 410 := by
  exact split_domain (by decide) (by decide) node0091_0251_domain node0251_0410_domain

def lookup : ℕ → Option IntervalDyadic := node0091_0410

theorem lookup_domain : ExactDomain lookup 91 410 :=
  node0091_0410_domain

theorem block1232_lookup (i : Fin 32) :
    lookup (91 + i.val) = some (values1232[i.val]'(by rw [values1232_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (91 + i.val) = _
  rw [node0091_0410, split_left 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0091_0251, split_left 155 node0091_0155 node0155_0251 (by omega)]
  rw [node0091_0155, split_left 123 block1232 block1233 (by omega)]
  exact block1232_get i

theorem block1233_lookup (i : Fin 32) :
    lookup (123 + i.val) = some (values1233[i.val]'(by rw [values1233_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (123 + i.val) = _
  rw [node0091_0410, split_left 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0091_0251, split_left 155 node0091_0155 node0155_0251 (by omega)]
  rw [node0091_0155, split_right 123 block1232 block1233 (by omega)]
  exact block1233_get i

theorem block1234_lookup (i : Fin 32) :
    lookup (155 + i.val) = some (values1234[i.val]'(by rw [values1234_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (155 + i.val) = _
  rw [node0091_0410, split_left 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0091_0251, split_right 155 node0091_0155 node0155_0251 (by omega)]
  rw [node0155_0251, split_left 187 block1234 node0187_0251 (by omega)]
  exact block1234_get i

theorem block1235_lookup (i : Fin 32) :
    lookup (187 + i.val) = some (values1235[i.val]'(by rw [values1235_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (187 + i.val) = _
  rw [node0091_0410, split_left 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0091_0251, split_right 155 node0091_0155 node0155_0251 (by omega)]
  rw [node0155_0251, split_right 187 block1234 node0187_0251 (by omega)]
  rw [node0187_0251, split_left 219 block1235 block1236 (by omega)]
  exact block1235_get i

theorem block1236_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values1236[i.val]'(by rw [values1236_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (219 + i.val) = _
  rw [node0091_0410, split_left 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0091_0251, split_right 155 node0091_0155 node0155_0251 (by omega)]
  rw [node0155_0251, split_right 187 block1234 node0187_0251 (by omega)]
  rw [node0187_0251, split_right 219 block1235 block1236 (by omega)]
  exact block1236_get i

theorem block1237_lookup (i : Fin 32) :
    lookup (251 + i.val) = some (values1237[i.val]'(by rw [values1237_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (251 + i.val) = _
  rw [node0091_0410, split_right 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0251_0410, split_left 315 node0251_0315 node0315_0410 (by omega)]
  rw [node0251_0315, split_left 283 block1237 block1238 (by omega)]
  exact block1237_get i

theorem block1238_lookup (i : Fin 32) :
    lookup (283 + i.val) = some (values1238[i.val]'(by rw [values1238_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (283 + i.val) = _
  rw [node0091_0410, split_right 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0251_0410, split_left 315 node0251_0315 node0315_0410 (by omega)]
  rw [node0251_0315, split_right 283 block1237 block1238 (by omega)]
  exact block1238_get i

theorem block1239_lookup (i : Fin 32) :
    lookup (315 + i.val) = some (values1239[i.val]'(by rw [values1239_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (315 + i.val) = _
  rw [node0091_0410, split_right 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0251_0410, split_right 315 node0251_0315 node0315_0410 (by omega)]
  rw [node0315_0410, split_left 347 block1239 node0347_0410 (by omega)]
  exact block1239_get i

theorem block1240_lookup (i : Fin 32) :
    lookup (347 + i.val) = some (values1240[i.val]'(by rw [values1240_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (347 + i.val) = _
  rw [node0091_0410, split_right 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0251_0410, split_right 315 node0251_0315 node0315_0410 (by omega)]
  rw [node0315_0410, split_right 347 block1239 node0347_0410 (by omega)]
  rw [node0347_0410, split_left 379 block1240 block1241 (by omega)]
  exact block1240_get i

theorem block1241_lookup (i : Fin 31) :
    lookup (379 + i.val) = some (values1241[i.val]'(by rw [values1241_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0091_0410 (379 + i.val) = _
  rw [node0091_0410, split_right 251 node0091_0251 node0251_0410 (by omega)]
  rw [node0251_0410, split_right 315 node0251_0315 node0315_0410 (by omega)]
  rw [node0315_0410, split_right 347 block1239 node0347_0410 (by omega)]
  rw [node0347_0410, split_right 379 block1240 block1241 (by omega)]
  exact block1241_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1232_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1232_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1233_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1233_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1234_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1234_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1235_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1235_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1236_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1236_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1237_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1237_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1238_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1238_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1239_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1239_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1240_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1240_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1241_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1241_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1232_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1233_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1234_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1235_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1236_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1237_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1238_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1239_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1240_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow092.block1241_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow092
