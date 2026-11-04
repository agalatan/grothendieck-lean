import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1262
import Grothe.UpperChaos.OriginalRow227TriangleData1263
import Grothe.UpperChaos.OriginalRow227TriangleData1264
import Grothe.UpperChaos.OriginalRow227TriangleData1265
import Grothe.UpperChaos.OriginalRow227TriangleData1266
import Grothe.UpperChaos.OriginalRow227TriangleData1267
import Grothe.UpperChaos.OriginalRow227TriangleData1268
import Grothe.UpperChaos.OriginalRow227TriangleData1269
import Grothe.UpperChaos.OriginalRow227TriangleData1270
import Grothe.UpperChaos.OriginalRow227TriangleData1271

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow095

open ConditionalTableLookup

def values1262 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1262.coefficient95_94,
  OriginalRow227TriangleData1262.coefficient95_95,
  OriginalRow227TriangleData1262.coefficient95_96,
  OriginalRow227TriangleData1262.coefficient95_97,
  OriginalRow227TriangleData1262.coefficient95_98,
  OriginalRow227TriangleData1262.coefficient95_99,
  OriginalRow227TriangleData1262.coefficient95_100,
  OriginalRow227TriangleData1262.coefficient95_101,
  OriginalRow227TriangleData1262.coefficient95_102,
  OriginalRow227TriangleData1262.coefficient95_103,
  OriginalRow227TriangleData1262.coefficient95_104,
  OriginalRow227TriangleData1262.coefficient95_105,
  OriginalRow227TriangleData1262.coefficient95_106,
  OriginalRow227TriangleData1262.coefficient95_107,
  OriginalRow227TriangleData1262.coefficient95_108,
  OriginalRow227TriangleData1262.coefficient95_109,
  OriginalRow227TriangleData1262.coefficient95_110,
  OriginalRow227TriangleData1262.coefficient95_111,
  OriginalRow227TriangleData1262.coefficient95_112,
  OriginalRow227TriangleData1262.coefficient95_113,
  OriginalRow227TriangleData1262.coefficient95_114,
  OriginalRow227TriangleData1262.coefficient95_115,
  OriginalRow227TriangleData1262.coefficient95_116,
  OriginalRow227TriangleData1262.coefficient95_117,
  OriginalRow227TriangleData1262.coefficient95_118,
  OriginalRow227TriangleData1262.coefficient95_119,
  OriginalRow227TriangleData1262.coefficient95_120,
  OriginalRow227TriangleData1262.coefficient95_121,
  OriginalRow227TriangleData1262.coefficient95_122,
  OriginalRow227TriangleData1262.coefficient95_123,
  OriginalRow227TriangleData1262.coefficient95_124,
  OriginalRow227TriangleData1262.coefficient95_125
]

theorem values1262_size : values1262.size = 32 := rfl

def block1262 : ℕ → Option IntervalDyadic := segment 94 values1262

theorem block1262_domain : ExactDomain block1262 94 126 := by
  simpa only [values1262_size] using segment_domain 94 values1262

theorem block1262_get (i : Fin 32) :
    block1262 (94 + i.val) = some (values1262[i.val]'(by rw [values1262_size]; exact i.isLt)) := by
  exact segment_get 94 values1262 ⟨i.val, by rw [values1262_size]; exact i.isLt⟩

def values1263 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1263.coefficient95_126,
  OriginalRow227TriangleData1263.coefficient95_127,
  OriginalRow227TriangleData1263.coefficient95_128,
  OriginalRow227TriangleData1263.coefficient95_129,
  OriginalRow227TriangleData1263.coefficient95_130,
  OriginalRow227TriangleData1263.coefficient95_131,
  OriginalRow227TriangleData1263.coefficient95_132,
  OriginalRow227TriangleData1263.coefficient95_133,
  OriginalRow227TriangleData1263.coefficient95_134,
  OriginalRow227TriangleData1263.coefficient95_135,
  OriginalRow227TriangleData1263.coefficient95_136,
  OriginalRow227TriangleData1263.coefficient95_137,
  OriginalRow227TriangleData1263.coefficient95_138,
  OriginalRow227TriangleData1263.coefficient95_139,
  OriginalRow227TriangleData1263.coefficient95_140,
  OriginalRow227TriangleData1263.coefficient95_141,
  OriginalRow227TriangleData1263.coefficient95_142,
  OriginalRow227TriangleData1263.coefficient95_143,
  OriginalRow227TriangleData1263.coefficient95_144,
  OriginalRow227TriangleData1263.coefficient95_145,
  OriginalRow227TriangleData1263.coefficient95_146,
  OriginalRow227TriangleData1263.coefficient95_147,
  OriginalRow227TriangleData1263.coefficient95_148,
  OriginalRow227TriangleData1263.coefficient95_149,
  OriginalRow227TriangleData1263.coefficient95_150,
  OriginalRow227TriangleData1263.coefficient95_151,
  OriginalRow227TriangleData1263.coefficient95_152,
  OriginalRow227TriangleData1263.coefficient95_153,
  OriginalRow227TriangleData1263.coefficient95_154,
  OriginalRow227TriangleData1263.coefficient95_155,
  OriginalRow227TriangleData1263.coefficient95_156,
  OriginalRow227TriangleData1263.coefficient95_157
]

theorem values1263_size : values1263.size = 32 := rfl

def block1263 : ℕ → Option IntervalDyadic := segment 126 values1263

theorem block1263_domain : ExactDomain block1263 126 158 := by
  simpa only [values1263_size] using segment_domain 126 values1263

theorem block1263_get (i : Fin 32) :
    block1263 (126 + i.val) = some (values1263[i.val]'(by rw [values1263_size]; exact i.isLt)) := by
  exact segment_get 126 values1263 ⟨i.val, by rw [values1263_size]; exact i.isLt⟩

def values1264 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1264.coefficient95_158,
  OriginalRow227TriangleData1264.coefficient95_159,
  OriginalRow227TriangleData1264.coefficient95_160,
  OriginalRow227TriangleData1264.coefficient95_161,
  OriginalRow227TriangleData1264.coefficient95_162,
  OriginalRow227TriangleData1264.coefficient95_163,
  OriginalRow227TriangleData1264.coefficient95_164,
  OriginalRow227TriangleData1264.coefficient95_165,
  OriginalRow227TriangleData1264.coefficient95_166,
  OriginalRow227TriangleData1264.coefficient95_167,
  OriginalRow227TriangleData1264.coefficient95_168,
  OriginalRow227TriangleData1264.coefficient95_169,
  OriginalRow227TriangleData1264.coefficient95_170,
  OriginalRow227TriangleData1264.coefficient95_171,
  OriginalRow227TriangleData1264.coefficient95_172,
  OriginalRow227TriangleData1264.coefficient95_173,
  OriginalRow227TriangleData1264.coefficient95_174,
  OriginalRow227TriangleData1264.coefficient95_175,
  OriginalRow227TriangleData1264.coefficient95_176,
  OriginalRow227TriangleData1264.coefficient95_177,
  OriginalRow227TriangleData1264.coefficient95_178,
  OriginalRow227TriangleData1264.coefficient95_179,
  OriginalRow227TriangleData1264.coefficient95_180,
  OriginalRow227TriangleData1264.coefficient95_181,
  OriginalRow227TriangleData1264.coefficient95_182,
  OriginalRow227TriangleData1264.coefficient95_183,
  OriginalRow227TriangleData1264.coefficient95_184,
  OriginalRow227TriangleData1264.coefficient95_185,
  OriginalRow227TriangleData1264.coefficient95_186,
  OriginalRow227TriangleData1264.coefficient95_187,
  OriginalRow227TriangleData1264.coefficient95_188,
  OriginalRow227TriangleData1264.coefficient95_189
]

theorem values1264_size : values1264.size = 32 := rfl

def block1264 : ℕ → Option IntervalDyadic := segment 158 values1264

theorem block1264_domain : ExactDomain block1264 158 190 := by
  simpa only [values1264_size] using segment_domain 158 values1264

theorem block1264_get (i : Fin 32) :
    block1264 (158 + i.val) = some (values1264[i.val]'(by rw [values1264_size]; exact i.isLt)) := by
  exact segment_get 158 values1264 ⟨i.val, by rw [values1264_size]; exact i.isLt⟩

def values1265 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1265.coefficient95_190,
  OriginalRow227TriangleData1265.coefficient95_191,
  OriginalRow227TriangleData1265.coefficient95_192,
  OriginalRow227TriangleData1265.coefficient95_193,
  OriginalRow227TriangleData1265.coefficient95_194,
  OriginalRow227TriangleData1265.coefficient95_195,
  OriginalRow227TriangleData1265.coefficient95_196,
  OriginalRow227TriangleData1265.coefficient95_197,
  OriginalRow227TriangleData1265.coefficient95_198,
  OriginalRow227TriangleData1265.coefficient95_199,
  OriginalRow227TriangleData1265.coefficient95_200,
  OriginalRow227TriangleData1265.coefficient95_201,
  OriginalRow227TriangleData1265.coefficient95_202,
  OriginalRow227TriangleData1265.coefficient95_203,
  OriginalRow227TriangleData1265.coefficient95_204,
  OriginalRow227TriangleData1265.coefficient95_205,
  OriginalRow227TriangleData1265.coefficient95_206,
  OriginalRow227TriangleData1265.coefficient95_207,
  OriginalRow227TriangleData1265.coefficient95_208,
  OriginalRow227TriangleData1265.coefficient95_209,
  OriginalRow227TriangleData1265.coefficient95_210,
  OriginalRow227TriangleData1265.coefficient95_211,
  OriginalRow227TriangleData1265.coefficient95_212,
  OriginalRow227TriangleData1265.coefficient95_213,
  OriginalRow227TriangleData1265.coefficient95_214,
  OriginalRow227TriangleData1265.coefficient95_215,
  OriginalRow227TriangleData1265.coefficient95_216,
  OriginalRow227TriangleData1265.coefficient95_217,
  OriginalRow227TriangleData1265.coefficient95_218,
  OriginalRow227TriangleData1265.coefficient95_219,
  OriginalRow227TriangleData1265.coefficient95_220,
  OriginalRow227TriangleData1265.coefficient95_221
]

theorem values1265_size : values1265.size = 32 := rfl

def block1265 : ℕ → Option IntervalDyadic := segment 190 values1265

theorem block1265_domain : ExactDomain block1265 190 222 := by
  simpa only [values1265_size] using segment_domain 190 values1265

theorem block1265_get (i : Fin 32) :
    block1265 (190 + i.val) = some (values1265[i.val]'(by rw [values1265_size]; exact i.isLt)) := by
  exact segment_get 190 values1265 ⟨i.val, by rw [values1265_size]; exact i.isLt⟩

def values1266 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1266.coefficient95_222,
  OriginalRow227TriangleData1266.coefficient95_223,
  OriginalRow227TriangleData1266.coefficient95_224,
  OriginalRow227TriangleData1266.coefficient95_225,
  OriginalRow227TriangleData1266.coefficient95_226,
  OriginalRow227TriangleData1266.coefficient95_227,
  OriginalRow227TriangleData1266.coefficient95_228,
  OriginalRow227TriangleData1266.coefficient95_229,
  OriginalRow227TriangleData1266.coefficient95_230,
  OriginalRow227TriangleData1266.coefficient95_231,
  OriginalRow227TriangleData1266.coefficient95_232,
  OriginalRow227TriangleData1266.coefficient95_233,
  OriginalRow227TriangleData1266.coefficient95_234,
  OriginalRow227TriangleData1266.coefficient95_235,
  OriginalRow227TriangleData1266.coefficient95_236,
  OriginalRow227TriangleData1266.coefficient95_237,
  OriginalRow227TriangleData1266.coefficient95_238,
  OriginalRow227TriangleData1266.coefficient95_239,
  OriginalRow227TriangleData1266.coefficient95_240,
  OriginalRow227TriangleData1266.coefficient95_241,
  OriginalRow227TriangleData1266.coefficient95_242,
  OriginalRow227TriangleData1266.coefficient95_243,
  OriginalRow227TriangleData1266.coefficient95_244,
  OriginalRow227TriangleData1266.coefficient95_245,
  OriginalRow227TriangleData1266.coefficient95_246,
  OriginalRow227TriangleData1266.coefficient95_247,
  OriginalRow227TriangleData1266.coefficient95_248,
  OriginalRow227TriangleData1266.coefficient95_249,
  OriginalRow227TriangleData1266.coefficient95_250,
  OriginalRow227TriangleData1266.coefficient95_251,
  OriginalRow227TriangleData1266.coefficient95_252,
  OriginalRow227TriangleData1266.coefficient95_253
]

theorem values1266_size : values1266.size = 32 := rfl

def block1266 : ℕ → Option IntervalDyadic := segment 222 values1266

theorem block1266_domain : ExactDomain block1266 222 254 := by
  simpa only [values1266_size] using segment_domain 222 values1266

theorem block1266_get (i : Fin 32) :
    block1266 (222 + i.val) = some (values1266[i.val]'(by rw [values1266_size]; exact i.isLt)) := by
  exact segment_get 222 values1266 ⟨i.val, by rw [values1266_size]; exact i.isLt⟩

def values1267 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1267.coefficient95_254,
  OriginalRow227TriangleData1267.coefficient95_255,
  OriginalRow227TriangleData1267.coefficient95_256,
  OriginalRow227TriangleData1267.coefficient95_257,
  OriginalRow227TriangleData1267.coefficient95_258,
  OriginalRow227TriangleData1267.coefficient95_259,
  OriginalRow227TriangleData1267.coefficient95_260,
  OriginalRow227TriangleData1267.coefficient95_261,
  OriginalRow227TriangleData1267.coefficient95_262,
  OriginalRow227TriangleData1267.coefficient95_263,
  OriginalRow227TriangleData1267.coefficient95_264,
  OriginalRow227TriangleData1267.coefficient95_265,
  OriginalRow227TriangleData1267.coefficient95_266,
  OriginalRow227TriangleData1267.coefficient95_267,
  OriginalRow227TriangleData1267.coefficient95_268,
  OriginalRow227TriangleData1267.coefficient95_269,
  OriginalRow227TriangleData1267.coefficient95_270,
  OriginalRow227TriangleData1267.coefficient95_271,
  OriginalRow227TriangleData1267.coefficient95_272,
  OriginalRow227TriangleData1267.coefficient95_273,
  OriginalRow227TriangleData1267.coefficient95_274,
  OriginalRow227TriangleData1267.coefficient95_275,
  OriginalRow227TriangleData1267.coefficient95_276,
  OriginalRow227TriangleData1267.coefficient95_277,
  OriginalRow227TriangleData1267.coefficient95_278,
  OriginalRow227TriangleData1267.coefficient95_279,
  OriginalRow227TriangleData1267.coefficient95_280,
  OriginalRow227TriangleData1267.coefficient95_281,
  OriginalRow227TriangleData1267.coefficient95_282,
  OriginalRow227TriangleData1267.coefficient95_283,
  OriginalRow227TriangleData1267.coefficient95_284,
  OriginalRow227TriangleData1267.coefficient95_285
]

theorem values1267_size : values1267.size = 32 := rfl

def block1267 : ℕ → Option IntervalDyadic := segment 254 values1267

theorem block1267_domain : ExactDomain block1267 254 286 := by
  simpa only [values1267_size] using segment_domain 254 values1267

theorem block1267_get (i : Fin 32) :
    block1267 (254 + i.val) = some (values1267[i.val]'(by rw [values1267_size]; exact i.isLt)) := by
  exact segment_get 254 values1267 ⟨i.val, by rw [values1267_size]; exact i.isLt⟩

def values1268 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1268.coefficient95_286,
  OriginalRow227TriangleData1268.coefficient95_287,
  OriginalRow227TriangleData1268.coefficient95_288,
  OriginalRow227TriangleData1268.coefficient95_289,
  OriginalRow227TriangleData1268.coefficient95_290,
  OriginalRow227TriangleData1268.coefficient95_291,
  OriginalRow227TriangleData1268.coefficient95_292,
  OriginalRow227TriangleData1268.coefficient95_293,
  OriginalRow227TriangleData1268.coefficient95_294,
  OriginalRow227TriangleData1268.coefficient95_295,
  OriginalRow227TriangleData1268.coefficient95_296,
  OriginalRow227TriangleData1268.coefficient95_297,
  OriginalRow227TriangleData1268.coefficient95_298,
  OriginalRow227TriangleData1268.coefficient95_299,
  OriginalRow227TriangleData1268.coefficient95_300,
  OriginalRow227TriangleData1268.coefficient95_301,
  OriginalRow227TriangleData1268.coefficient95_302,
  OriginalRow227TriangleData1268.coefficient95_303,
  OriginalRow227TriangleData1268.coefficient95_304,
  OriginalRow227TriangleData1268.coefficient95_305,
  OriginalRow227TriangleData1268.coefficient95_306,
  OriginalRow227TriangleData1268.coefficient95_307,
  OriginalRow227TriangleData1268.coefficient95_308,
  OriginalRow227TriangleData1268.coefficient95_309,
  OriginalRow227TriangleData1268.coefficient95_310,
  OriginalRow227TriangleData1268.coefficient95_311,
  OriginalRow227TriangleData1268.coefficient95_312,
  OriginalRow227TriangleData1268.coefficient95_313,
  OriginalRow227TriangleData1268.coefficient95_314,
  OriginalRow227TriangleData1268.coefficient95_315,
  OriginalRow227TriangleData1268.coefficient95_316,
  OriginalRow227TriangleData1268.coefficient95_317
]

theorem values1268_size : values1268.size = 32 := rfl

def block1268 : ℕ → Option IntervalDyadic := segment 286 values1268

theorem block1268_domain : ExactDomain block1268 286 318 := by
  simpa only [values1268_size] using segment_domain 286 values1268

theorem block1268_get (i : Fin 32) :
    block1268 (286 + i.val) = some (values1268[i.val]'(by rw [values1268_size]; exact i.isLt)) := by
  exact segment_get 286 values1268 ⟨i.val, by rw [values1268_size]; exact i.isLt⟩

def values1269 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1269.coefficient95_318,
  OriginalRow227TriangleData1269.coefficient95_319,
  OriginalRow227TriangleData1269.coefficient95_320,
  OriginalRow227TriangleData1269.coefficient95_321,
  OriginalRow227TriangleData1269.coefficient95_322,
  OriginalRow227TriangleData1269.coefficient95_323,
  OriginalRow227TriangleData1269.coefficient95_324,
  OriginalRow227TriangleData1269.coefficient95_325,
  OriginalRow227TriangleData1269.coefficient95_326,
  OriginalRow227TriangleData1269.coefficient95_327,
  OriginalRow227TriangleData1269.coefficient95_328,
  OriginalRow227TriangleData1269.coefficient95_329,
  OriginalRow227TriangleData1269.coefficient95_330,
  OriginalRow227TriangleData1269.coefficient95_331,
  OriginalRow227TriangleData1269.coefficient95_332,
  OriginalRow227TriangleData1269.coefficient95_333,
  OriginalRow227TriangleData1269.coefficient95_334,
  OriginalRow227TriangleData1269.coefficient95_335,
  OriginalRow227TriangleData1269.coefficient95_336,
  OriginalRow227TriangleData1269.coefficient95_337,
  OriginalRow227TriangleData1269.coefficient95_338,
  OriginalRow227TriangleData1269.coefficient95_339,
  OriginalRow227TriangleData1269.coefficient95_340,
  OriginalRow227TriangleData1269.coefficient95_341,
  OriginalRow227TriangleData1269.coefficient95_342,
  OriginalRow227TriangleData1269.coefficient95_343,
  OriginalRow227TriangleData1269.coefficient95_344,
  OriginalRow227TriangleData1269.coefficient95_345,
  OriginalRow227TriangleData1269.coefficient95_346,
  OriginalRow227TriangleData1269.coefficient95_347,
  OriginalRow227TriangleData1269.coefficient95_348,
  OriginalRow227TriangleData1269.coefficient95_349
]

theorem values1269_size : values1269.size = 32 := rfl

def block1269 : ℕ → Option IntervalDyadic := segment 318 values1269

theorem block1269_domain : ExactDomain block1269 318 350 := by
  simpa only [values1269_size] using segment_domain 318 values1269

theorem block1269_get (i : Fin 32) :
    block1269 (318 + i.val) = some (values1269[i.val]'(by rw [values1269_size]; exact i.isLt)) := by
  exact segment_get 318 values1269 ⟨i.val, by rw [values1269_size]; exact i.isLt⟩

def values1270 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1270.coefficient95_350,
  OriginalRow227TriangleData1270.coefficient95_351,
  OriginalRow227TriangleData1270.coefficient95_352,
  OriginalRow227TriangleData1270.coefficient95_353,
  OriginalRow227TriangleData1270.coefficient95_354,
  OriginalRow227TriangleData1270.coefficient95_355,
  OriginalRow227TriangleData1270.coefficient95_356,
  OriginalRow227TriangleData1270.coefficient95_357,
  OriginalRow227TriangleData1270.coefficient95_358,
  OriginalRow227TriangleData1270.coefficient95_359,
  OriginalRow227TriangleData1270.coefficient95_360,
  OriginalRow227TriangleData1270.coefficient95_361,
  OriginalRow227TriangleData1270.coefficient95_362,
  OriginalRow227TriangleData1270.coefficient95_363,
  OriginalRow227TriangleData1270.coefficient95_364,
  OriginalRow227TriangleData1270.coefficient95_365,
  OriginalRow227TriangleData1270.coefficient95_366,
  OriginalRow227TriangleData1270.coefficient95_367,
  OriginalRow227TriangleData1270.coefficient95_368,
  OriginalRow227TriangleData1270.coefficient95_369,
  OriginalRow227TriangleData1270.coefficient95_370,
  OriginalRow227TriangleData1270.coefficient95_371,
  OriginalRow227TriangleData1270.coefficient95_372,
  OriginalRow227TriangleData1270.coefficient95_373,
  OriginalRow227TriangleData1270.coefficient95_374,
  OriginalRow227TriangleData1270.coefficient95_375,
  OriginalRow227TriangleData1270.coefficient95_376,
  OriginalRow227TriangleData1270.coefficient95_377,
  OriginalRow227TriangleData1270.coefficient95_378,
  OriginalRow227TriangleData1270.coefficient95_379,
  OriginalRow227TriangleData1270.coefficient95_380,
  OriginalRow227TriangleData1270.coefficient95_381
]

theorem values1270_size : values1270.size = 32 := rfl

def block1270 : ℕ → Option IntervalDyadic := segment 350 values1270

theorem block1270_domain : ExactDomain block1270 350 382 := by
  simpa only [values1270_size] using segment_domain 350 values1270

theorem block1270_get (i : Fin 32) :
    block1270 (350 + i.val) = some (values1270[i.val]'(by rw [values1270_size]; exact i.isLt)) := by
  exact segment_get 350 values1270 ⟨i.val, by rw [values1270_size]; exact i.isLt⟩

def values1271 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1271.coefficient95_382,
  OriginalRow227TriangleData1271.coefficient95_383,
  OriginalRow227TriangleData1271.coefficient95_384,
  OriginalRow227TriangleData1271.coefficient95_385,
  OriginalRow227TriangleData1271.coefficient95_386,
  OriginalRow227TriangleData1271.coefficient95_387,
  OriginalRow227TriangleData1271.coefficient95_388,
  OriginalRow227TriangleData1271.coefficient95_389,
  OriginalRow227TriangleData1271.coefficient95_390,
  OriginalRow227TriangleData1271.coefficient95_391,
  OriginalRow227TriangleData1271.coefficient95_392,
  OriginalRow227TriangleData1271.coefficient95_393,
  OriginalRow227TriangleData1271.coefficient95_394,
  OriginalRow227TriangleData1271.coefficient95_395,
  OriginalRow227TriangleData1271.coefficient95_396,
  OriginalRow227TriangleData1271.coefficient95_397,
  OriginalRow227TriangleData1271.coefficient95_398,
  OriginalRow227TriangleData1271.coefficient95_399,
  OriginalRow227TriangleData1271.coefficient95_400,
  OriginalRow227TriangleData1271.coefficient95_401,
  OriginalRow227TriangleData1271.coefficient95_402,
  OriginalRow227TriangleData1271.coefficient95_403,
  OriginalRow227TriangleData1271.coefficient95_404,
  OriginalRow227TriangleData1271.coefficient95_405,
  OriginalRow227TriangleData1271.coefficient95_406
]

theorem values1271_size : values1271.size = 25 := rfl

def block1271 : ℕ → Option IntervalDyadic := segment 382 values1271

theorem block1271_domain : ExactDomain block1271 382 407 := by
  simpa only [values1271_size] using segment_domain 382 values1271

theorem block1271_get (i : Fin 25) :
    block1271 (382 + i.val) = some (values1271[i.val]'(by rw [values1271_size]; exact i.isLt)) := by
  exact segment_get 382 values1271 ⟨i.val, by rw [values1271_size]; exact i.isLt⟩

def node0094_0158 : ℕ → Option IntervalDyadic := split 126 block1262 block1263

theorem node0094_0158_domain : ExactDomain node0094_0158 94 158 := by
  exact split_domain (by decide) (by decide) block1262_domain block1263_domain

def node0190_0254 : ℕ → Option IntervalDyadic := split 222 block1265 block1266

theorem node0190_0254_domain : ExactDomain node0190_0254 190 254 := by
  exact split_domain (by decide) (by decide) block1265_domain block1266_domain

def node0158_0254 : ℕ → Option IntervalDyadic := split 190 block1264 node0190_0254

theorem node0158_0254_domain : ExactDomain node0158_0254 158 254 := by
  exact split_domain (by decide) (by decide) block1264_domain node0190_0254_domain

def node0094_0254 : ℕ → Option IntervalDyadic := split 158 node0094_0158 node0158_0254

theorem node0094_0254_domain : ExactDomain node0094_0254 94 254 := by
  exact split_domain (by decide) (by decide) node0094_0158_domain node0158_0254_domain

def node0254_0318 : ℕ → Option IntervalDyadic := split 286 block1267 block1268

theorem node0254_0318_domain : ExactDomain node0254_0318 254 318 := by
  exact split_domain (by decide) (by decide) block1267_domain block1268_domain

def node0350_0407 : ℕ → Option IntervalDyadic := split 382 block1270 block1271

theorem node0350_0407_domain : ExactDomain node0350_0407 350 407 := by
  exact split_domain (by decide) (by decide) block1270_domain block1271_domain

def node0318_0407 : ℕ → Option IntervalDyadic := split 350 block1269 node0350_0407

theorem node0318_0407_domain : ExactDomain node0318_0407 318 407 := by
  exact split_domain (by decide) (by decide) block1269_domain node0350_0407_domain

def node0254_0407 : ℕ → Option IntervalDyadic := split 318 node0254_0318 node0318_0407

theorem node0254_0407_domain : ExactDomain node0254_0407 254 407 := by
  exact split_domain (by decide) (by decide) node0254_0318_domain node0318_0407_domain

def node0094_0407 : ℕ → Option IntervalDyadic := split 254 node0094_0254 node0254_0407

theorem node0094_0407_domain : ExactDomain node0094_0407 94 407 := by
  exact split_domain (by decide) (by decide) node0094_0254_domain node0254_0407_domain

def lookup : ℕ → Option IntervalDyadic := node0094_0407

theorem lookup_domain : ExactDomain lookup 94 407 :=
  node0094_0407_domain

theorem block1262_lookup (i : Fin 32) :
    lookup (94 + i.val) = some (values1262[i.val]'(by rw [values1262_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (94 + i.val) = _
  rw [node0094_0407, split_left 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0094_0254, split_left 158 node0094_0158 node0158_0254 (by omega)]
  rw [node0094_0158, split_left 126 block1262 block1263 (by omega)]
  exact block1262_get i

theorem block1263_lookup (i : Fin 32) :
    lookup (126 + i.val) = some (values1263[i.val]'(by rw [values1263_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (126 + i.val) = _
  rw [node0094_0407, split_left 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0094_0254, split_left 158 node0094_0158 node0158_0254 (by omega)]
  rw [node0094_0158, split_right 126 block1262 block1263 (by omega)]
  exact block1263_get i

theorem block1264_lookup (i : Fin 32) :
    lookup (158 + i.val) = some (values1264[i.val]'(by rw [values1264_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (158 + i.val) = _
  rw [node0094_0407, split_left 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0094_0254, split_right 158 node0094_0158 node0158_0254 (by omega)]
  rw [node0158_0254, split_left 190 block1264 node0190_0254 (by omega)]
  exact block1264_get i

theorem block1265_lookup (i : Fin 32) :
    lookup (190 + i.val) = some (values1265[i.val]'(by rw [values1265_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (190 + i.val) = _
  rw [node0094_0407, split_left 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0094_0254, split_right 158 node0094_0158 node0158_0254 (by omega)]
  rw [node0158_0254, split_right 190 block1264 node0190_0254 (by omega)]
  rw [node0190_0254, split_left 222 block1265 block1266 (by omega)]
  exact block1265_get i

theorem block1266_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values1266[i.val]'(by rw [values1266_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (222 + i.val) = _
  rw [node0094_0407, split_left 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0094_0254, split_right 158 node0094_0158 node0158_0254 (by omega)]
  rw [node0158_0254, split_right 190 block1264 node0190_0254 (by omega)]
  rw [node0190_0254, split_right 222 block1265 block1266 (by omega)]
  exact block1266_get i

theorem block1267_lookup (i : Fin 32) :
    lookup (254 + i.val) = some (values1267[i.val]'(by rw [values1267_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (254 + i.val) = _
  rw [node0094_0407, split_right 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0254_0407, split_left 318 node0254_0318 node0318_0407 (by omega)]
  rw [node0254_0318, split_left 286 block1267 block1268 (by omega)]
  exact block1267_get i

theorem block1268_lookup (i : Fin 32) :
    lookup (286 + i.val) = some (values1268[i.val]'(by rw [values1268_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (286 + i.val) = _
  rw [node0094_0407, split_right 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0254_0407, split_left 318 node0254_0318 node0318_0407 (by omega)]
  rw [node0254_0318, split_right 286 block1267 block1268 (by omega)]
  exact block1268_get i

theorem block1269_lookup (i : Fin 32) :
    lookup (318 + i.val) = some (values1269[i.val]'(by rw [values1269_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (318 + i.val) = _
  rw [node0094_0407, split_right 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0254_0407, split_right 318 node0254_0318 node0318_0407 (by omega)]
  rw [node0318_0407, split_left 350 block1269 node0350_0407 (by omega)]
  exact block1269_get i

theorem block1270_lookup (i : Fin 32) :
    lookup (350 + i.val) = some (values1270[i.val]'(by rw [values1270_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (350 + i.val) = _
  rw [node0094_0407, split_right 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0254_0407, split_right 318 node0254_0318 node0318_0407 (by omega)]
  rw [node0318_0407, split_right 350 block1269 node0350_0407 (by omega)]
  rw [node0350_0407, split_left 382 block1270 block1271 (by omega)]
  exact block1270_get i

theorem block1271_lookup (i : Fin 25) :
    lookup (382 + i.val) = some (values1271[i.val]'(by rw [values1271_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0094_0407 (382 + i.val) = _
  rw [node0094_0407, split_right 254 node0094_0254 node0254_0407 (by omega)]
  rw [node0254_0407, split_right 318 node0254_0318 node0318_0407 (by omega)]
  rw [node0318_0407, split_right 350 block1269 node0350_0407 (by omega)]
  rw [node0350_0407, split_right 382 block1270 block1271 (by omega)]
  exact block1271_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1262_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1262_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1263_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1263_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1264_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1264_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1265_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1265_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1266_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1266_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1267_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1267_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1268_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1268_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1269_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1269_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1270_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1270_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1271_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1271_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1262_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1263_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1264_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1265_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1266_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1267_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1268_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1269_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1270_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow095.block1271_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow095
