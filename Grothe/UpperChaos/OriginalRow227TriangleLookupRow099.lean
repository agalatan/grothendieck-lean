import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1302
import Grothe.UpperChaos.OriginalRow227TriangleData1303
import Grothe.UpperChaos.OriginalRow227TriangleData1304
import Grothe.UpperChaos.OriginalRow227TriangleData1305
import Grothe.UpperChaos.OriginalRow227TriangleData1306
import Grothe.UpperChaos.OriginalRow227TriangleData1307
import Grothe.UpperChaos.OriginalRow227TriangleData1308
import Grothe.UpperChaos.OriginalRow227TriangleData1309
import Grothe.UpperChaos.OriginalRow227TriangleData1310
import Grothe.UpperChaos.OriginalRow227TriangleData1311

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow099

open ConditionalTableLookup

def values1302 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1302.coefficient99_98,
  OriginalRow227TriangleData1302.coefficient99_99,
  OriginalRow227TriangleData1302.coefficient99_100,
  OriginalRow227TriangleData1302.coefficient99_101,
  OriginalRow227TriangleData1302.coefficient99_102,
  OriginalRow227TriangleData1302.coefficient99_103,
  OriginalRow227TriangleData1302.coefficient99_104,
  OriginalRow227TriangleData1302.coefficient99_105,
  OriginalRow227TriangleData1302.coefficient99_106,
  OriginalRow227TriangleData1302.coefficient99_107,
  OriginalRow227TriangleData1302.coefficient99_108,
  OriginalRow227TriangleData1302.coefficient99_109,
  OriginalRow227TriangleData1302.coefficient99_110,
  OriginalRow227TriangleData1302.coefficient99_111,
  OriginalRow227TriangleData1302.coefficient99_112,
  OriginalRow227TriangleData1302.coefficient99_113,
  OriginalRow227TriangleData1302.coefficient99_114,
  OriginalRow227TriangleData1302.coefficient99_115,
  OriginalRow227TriangleData1302.coefficient99_116,
  OriginalRow227TriangleData1302.coefficient99_117,
  OriginalRow227TriangleData1302.coefficient99_118,
  OriginalRow227TriangleData1302.coefficient99_119,
  OriginalRow227TriangleData1302.coefficient99_120,
  OriginalRow227TriangleData1302.coefficient99_121,
  OriginalRow227TriangleData1302.coefficient99_122,
  OriginalRow227TriangleData1302.coefficient99_123,
  OriginalRow227TriangleData1302.coefficient99_124,
  OriginalRow227TriangleData1302.coefficient99_125,
  OriginalRow227TriangleData1302.coefficient99_126,
  OriginalRow227TriangleData1302.coefficient99_127,
  OriginalRow227TriangleData1302.coefficient99_128,
  OriginalRow227TriangleData1302.coefficient99_129
]

theorem values1302_size : values1302.size = 32 := rfl

def block1302 : ℕ → Option IntervalDyadic := segment 98 values1302

theorem block1302_domain : ExactDomain block1302 98 130 := by
  simpa only [values1302_size] using segment_domain 98 values1302

theorem block1302_get (i : Fin 32) :
    block1302 (98 + i.val) = some (values1302[i.val]'(by rw [values1302_size]; exact i.isLt)) := by
  exact segment_get 98 values1302 ⟨i.val, by rw [values1302_size]; exact i.isLt⟩

def values1303 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1303.coefficient99_130,
  OriginalRow227TriangleData1303.coefficient99_131,
  OriginalRow227TriangleData1303.coefficient99_132,
  OriginalRow227TriangleData1303.coefficient99_133,
  OriginalRow227TriangleData1303.coefficient99_134,
  OriginalRow227TriangleData1303.coefficient99_135,
  OriginalRow227TriangleData1303.coefficient99_136,
  OriginalRow227TriangleData1303.coefficient99_137,
  OriginalRow227TriangleData1303.coefficient99_138,
  OriginalRow227TriangleData1303.coefficient99_139,
  OriginalRow227TriangleData1303.coefficient99_140,
  OriginalRow227TriangleData1303.coefficient99_141,
  OriginalRow227TriangleData1303.coefficient99_142,
  OriginalRow227TriangleData1303.coefficient99_143,
  OriginalRow227TriangleData1303.coefficient99_144,
  OriginalRow227TriangleData1303.coefficient99_145,
  OriginalRow227TriangleData1303.coefficient99_146,
  OriginalRow227TriangleData1303.coefficient99_147,
  OriginalRow227TriangleData1303.coefficient99_148,
  OriginalRow227TriangleData1303.coefficient99_149,
  OriginalRow227TriangleData1303.coefficient99_150,
  OriginalRow227TriangleData1303.coefficient99_151,
  OriginalRow227TriangleData1303.coefficient99_152,
  OriginalRow227TriangleData1303.coefficient99_153,
  OriginalRow227TriangleData1303.coefficient99_154,
  OriginalRow227TriangleData1303.coefficient99_155,
  OriginalRow227TriangleData1303.coefficient99_156,
  OriginalRow227TriangleData1303.coefficient99_157,
  OriginalRow227TriangleData1303.coefficient99_158,
  OriginalRow227TriangleData1303.coefficient99_159,
  OriginalRow227TriangleData1303.coefficient99_160,
  OriginalRow227TriangleData1303.coefficient99_161
]

theorem values1303_size : values1303.size = 32 := rfl

def block1303 : ℕ → Option IntervalDyadic := segment 130 values1303

theorem block1303_domain : ExactDomain block1303 130 162 := by
  simpa only [values1303_size] using segment_domain 130 values1303

theorem block1303_get (i : Fin 32) :
    block1303 (130 + i.val) = some (values1303[i.val]'(by rw [values1303_size]; exact i.isLt)) := by
  exact segment_get 130 values1303 ⟨i.val, by rw [values1303_size]; exact i.isLt⟩

def values1304 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1304.coefficient99_162,
  OriginalRow227TriangleData1304.coefficient99_163,
  OriginalRow227TriangleData1304.coefficient99_164,
  OriginalRow227TriangleData1304.coefficient99_165,
  OriginalRow227TriangleData1304.coefficient99_166,
  OriginalRow227TriangleData1304.coefficient99_167,
  OriginalRow227TriangleData1304.coefficient99_168,
  OriginalRow227TriangleData1304.coefficient99_169,
  OriginalRow227TriangleData1304.coefficient99_170,
  OriginalRow227TriangleData1304.coefficient99_171,
  OriginalRow227TriangleData1304.coefficient99_172,
  OriginalRow227TriangleData1304.coefficient99_173,
  OriginalRow227TriangleData1304.coefficient99_174,
  OriginalRow227TriangleData1304.coefficient99_175,
  OriginalRow227TriangleData1304.coefficient99_176,
  OriginalRow227TriangleData1304.coefficient99_177,
  OriginalRow227TriangleData1304.coefficient99_178,
  OriginalRow227TriangleData1304.coefficient99_179,
  OriginalRow227TriangleData1304.coefficient99_180,
  OriginalRow227TriangleData1304.coefficient99_181,
  OriginalRow227TriangleData1304.coefficient99_182,
  OriginalRow227TriangleData1304.coefficient99_183,
  OriginalRow227TriangleData1304.coefficient99_184,
  OriginalRow227TriangleData1304.coefficient99_185,
  OriginalRow227TriangleData1304.coefficient99_186,
  OriginalRow227TriangleData1304.coefficient99_187,
  OriginalRow227TriangleData1304.coefficient99_188,
  OriginalRow227TriangleData1304.coefficient99_189,
  OriginalRow227TriangleData1304.coefficient99_190,
  OriginalRow227TriangleData1304.coefficient99_191,
  OriginalRow227TriangleData1304.coefficient99_192,
  OriginalRow227TriangleData1304.coefficient99_193
]

theorem values1304_size : values1304.size = 32 := rfl

def block1304 : ℕ → Option IntervalDyadic := segment 162 values1304

theorem block1304_domain : ExactDomain block1304 162 194 := by
  simpa only [values1304_size] using segment_domain 162 values1304

theorem block1304_get (i : Fin 32) :
    block1304 (162 + i.val) = some (values1304[i.val]'(by rw [values1304_size]; exact i.isLt)) := by
  exact segment_get 162 values1304 ⟨i.val, by rw [values1304_size]; exact i.isLt⟩

def values1305 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1305.coefficient99_194,
  OriginalRow227TriangleData1305.coefficient99_195,
  OriginalRow227TriangleData1305.coefficient99_196,
  OriginalRow227TriangleData1305.coefficient99_197,
  OriginalRow227TriangleData1305.coefficient99_198,
  OriginalRow227TriangleData1305.coefficient99_199,
  OriginalRow227TriangleData1305.coefficient99_200,
  OriginalRow227TriangleData1305.coefficient99_201,
  OriginalRow227TriangleData1305.coefficient99_202,
  OriginalRow227TriangleData1305.coefficient99_203,
  OriginalRow227TriangleData1305.coefficient99_204,
  OriginalRow227TriangleData1305.coefficient99_205,
  OriginalRow227TriangleData1305.coefficient99_206,
  OriginalRow227TriangleData1305.coefficient99_207,
  OriginalRow227TriangleData1305.coefficient99_208,
  OriginalRow227TriangleData1305.coefficient99_209,
  OriginalRow227TriangleData1305.coefficient99_210,
  OriginalRow227TriangleData1305.coefficient99_211,
  OriginalRow227TriangleData1305.coefficient99_212,
  OriginalRow227TriangleData1305.coefficient99_213,
  OriginalRow227TriangleData1305.coefficient99_214,
  OriginalRow227TriangleData1305.coefficient99_215,
  OriginalRow227TriangleData1305.coefficient99_216,
  OriginalRow227TriangleData1305.coefficient99_217,
  OriginalRow227TriangleData1305.coefficient99_218,
  OriginalRow227TriangleData1305.coefficient99_219,
  OriginalRow227TriangleData1305.coefficient99_220,
  OriginalRow227TriangleData1305.coefficient99_221,
  OriginalRow227TriangleData1305.coefficient99_222,
  OriginalRow227TriangleData1305.coefficient99_223,
  OriginalRow227TriangleData1305.coefficient99_224,
  OriginalRow227TriangleData1305.coefficient99_225
]

theorem values1305_size : values1305.size = 32 := rfl

def block1305 : ℕ → Option IntervalDyadic := segment 194 values1305

theorem block1305_domain : ExactDomain block1305 194 226 := by
  simpa only [values1305_size] using segment_domain 194 values1305

theorem block1305_get (i : Fin 32) :
    block1305 (194 + i.val) = some (values1305[i.val]'(by rw [values1305_size]; exact i.isLt)) := by
  exact segment_get 194 values1305 ⟨i.val, by rw [values1305_size]; exact i.isLt⟩

def values1306 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1306.coefficient99_226,
  OriginalRow227TriangleData1306.coefficient99_227,
  OriginalRow227TriangleData1306.coefficient99_228,
  OriginalRow227TriangleData1306.coefficient99_229,
  OriginalRow227TriangleData1306.coefficient99_230,
  OriginalRow227TriangleData1306.coefficient99_231,
  OriginalRow227TriangleData1306.coefficient99_232,
  OriginalRow227TriangleData1306.coefficient99_233,
  OriginalRow227TriangleData1306.coefficient99_234,
  OriginalRow227TriangleData1306.coefficient99_235,
  OriginalRow227TriangleData1306.coefficient99_236,
  OriginalRow227TriangleData1306.coefficient99_237,
  OriginalRow227TriangleData1306.coefficient99_238,
  OriginalRow227TriangleData1306.coefficient99_239,
  OriginalRow227TriangleData1306.coefficient99_240,
  OriginalRow227TriangleData1306.coefficient99_241,
  OriginalRow227TriangleData1306.coefficient99_242,
  OriginalRow227TriangleData1306.coefficient99_243,
  OriginalRow227TriangleData1306.coefficient99_244,
  OriginalRow227TriangleData1306.coefficient99_245,
  OriginalRow227TriangleData1306.coefficient99_246,
  OriginalRow227TriangleData1306.coefficient99_247,
  OriginalRow227TriangleData1306.coefficient99_248,
  OriginalRow227TriangleData1306.coefficient99_249,
  OriginalRow227TriangleData1306.coefficient99_250,
  OriginalRow227TriangleData1306.coefficient99_251,
  OriginalRow227TriangleData1306.coefficient99_252,
  OriginalRow227TriangleData1306.coefficient99_253,
  OriginalRow227TriangleData1306.coefficient99_254,
  OriginalRow227TriangleData1306.coefficient99_255,
  OriginalRow227TriangleData1306.coefficient99_256,
  OriginalRow227TriangleData1306.coefficient99_257
]

theorem values1306_size : values1306.size = 32 := rfl

def block1306 : ℕ → Option IntervalDyadic := segment 226 values1306

theorem block1306_domain : ExactDomain block1306 226 258 := by
  simpa only [values1306_size] using segment_domain 226 values1306

theorem block1306_get (i : Fin 32) :
    block1306 (226 + i.val) = some (values1306[i.val]'(by rw [values1306_size]; exact i.isLt)) := by
  exact segment_get 226 values1306 ⟨i.val, by rw [values1306_size]; exact i.isLt⟩

def values1307 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1307.coefficient99_258,
  OriginalRow227TriangleData1307.coefficient99_259,
  OriginalRow227TriangleData1307.coefficient99_260,
  OriginalRow227TriangleData1307.coefficient99_261,
  OriginalRow227TriangleData1307.coefficient99_262,
  OriginalRow227TriangleData1307.coefficient99_263,
  OriginalRow227TriangleData1307.coefficient99_264,
  OriginalRow227TriangleData1307.coefficient99_265,
  OriginalRow227TriangleData1307.coefficient99_266,
  OriginalRow227TriangleData1307.coefficient99_267,
  OriginalRow227TriangleData1307.coefficient99_268,
  OriginalRow227TriangleData1307.coefficient99_269,
  OriginalRow227TriangleData1307.coefficient99_270,
  OriginalRow227TriangleData1307.coefficient99_271,
  OriginalRow227TriangleData1307.coefficient99_272,
  OriginalRow227TriangleData1307.coefficient99_273,
  OriginalRow227TriangleData1307.coefficient99_274,
  OriginalRow227TriangleData1307.coefficient99_275,
  OriginalRow227TriangleData1307.coefficient99_276,
  OriginalRow227TriangleData1307.coefficient99_277,
  OriginalRow227TriangleData1307.coefficient99_278,
  OriginalRow227TriangleData1307.coefficient99_279,
  OriginalRow227TriangleData1307.coefficient99_280,
  OriginalRow227TriangleData1307.coefficient99_281,
  OriginalRow227TriangleData1307.coefficient99_282,
  OriginalRow227TriangleData1307.coefficient99_283,
  OriginalRow227TriangleData1307.coefficient99_284,
  OriginalRow227TriangleData1307.coefficient99_285,
  OriginalRow227TriangleData1307.coefficient99_286,
  OriginalRow227TriangleData1307.coefficient99_287,
  OriginalRow227TriangleData1307.coefficient99_288,
  OriginalRow227TriangleData1307.coefficient99_289
]

theorem values1307_size : values1307.size = 32 := rfl

def block1307 : ℕ → Option IntervalDyadic := segment 258 values1307

theorem block1307_domain : ExactDomain block1307 258 290 := by
  simpa only [values1307_size] using segment_domain 258 values1307

theorem block1307_get (i : Fin 32) :
    block1307 (258 + i.val) = some (values1307[i.val]'(by rw [values1307_size]; exact i.isLt)) := by
  exact segment_get 258 values1307 ⟨i.val, by rw [values1307_size]; exact i.isLt⟩

def values1308 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1308.coefficient99_290,
  OriginalRow227TriangleData1308.coefficient99_291,
  OriginalRow227TriangleData1308.coefficient99_292,
  OriginalRow227TriangleData1308.coefficient99_293,
  OriginalRow227TriangleData1308.coefficient99_294,
  OriginalRow227TriangleData1308.coefficient99_295,
  OriginalRow227TriangleData1308.coefficient99_296,
  OriginalRow227TriangleData1308.coefficient99_297,
  OriginalRow227TriangleData1308.coefficient99_298,
  OriginalRow227TriangleData1308.coefficient99_299,
  OriginalRow227TriangleData1308.coefficient99_300,
  OriginalRow227TriangleData1308.coefficient99_301,
  OriginalRow227TriangleData1308.coefficient99_302,
  OriginalRow227TriangleData1308.coefficient99_303,
  OriginalRow227TriangleData1308.coefficient99_304,
  OriginalRow227TriangleData1308.coefficient99_305,
  OriginalRow227TriangleData1308.coefficient99_306,
  OriginalRow227TriangleData1308.coefficient99_307,
  OriginalRow227TriangleData1308.coefficient99_308,
  OriginalRow227TriangleData1308.coefficient99_309,
  OriginalRow227TriangleData1308.coefficient99_310,
  OriginalRow227TriangleData1308.coefficient99_311,
  OriginalRow227TriangleData1308.coefficient99_312,
  OriginalRow227TriangleData1308.coefficient99_313,
  OriginalRow227TriangleData1308.coefficient99_314,
  OriginalRow227TriangleData1308.coefficient99_315,
  OriginalRow227TriangleData1308.coefficient99_316,
  OriginalRow227TriangleData1308.coefficient99_317,
  OriginalRow227TriangleData1308.coefficient99_318,
  OriginalRow227TriangleData1308.coefficient99_319,
  OriginalRow227TriangleData1308.coefficient99_320,
  OriginalRow227TriangleData1308.coefficient99_321
]

theorem values1308_size : values1308.size = 32 := rfl

def block1308 : ℕ → Option IntervalDyadic := segment 290 values1308

theorem block1308_domain : ExactDomain block1308 290 322 := by
  simpa only [values1308_size] using segment_domain 290 values1308

theorem block1308_get (i : Fin 32) :
    block1308 (290 + i.val) = some (values1308[i.val]'(by rw [values1308_size]; exact i.isLt)) := by
  exact segment_get 290 values1308 ⟨i.val, by rw [values1308_size]; exact i.isLt⟩

def values1309 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1309.coefficient99_322,
  OriginalRow227TriangleData1309.coefficient99_323,
  OriginalRow227TriangleData1309.coefficient99_324,
  OriginalRow227TriangleData1309.coefficient99_325,
  OriginalRow227TriangleData1309.coefficient99_326,
  OriginalRow227TriangleData1309.coefficient99_327,
  OriginalRow227TriangleData1309.coefficient99_328,
  OriginalRow227TriangleData1309.coefficient99_329,
  OriginalRow227TriangleData1309.coefficient99_330,
  OriginalRow227TriangleData1309.coefficient99_331,
  OriginalRow227TriangleData1309.coefficient99_332,
  OriginalRow227TriangleData1309.coefficient99_333,
  OriginalRow227TriangleData1309.coefficient99_334,
  OriginalRow227TriangleData1309.coefficient99_335,
  OriginalRow227TriangleData1309.coefficient99_336,
  OriginalRow227TriangleData1309.coefficient99_337,
  OriginalRow227TriangleData1309.coefficient99_338,
  OriginalRow227TriangleData1309.coefficient99_339,
  OriginalRow227TriangleData1309.coefficient99_340,
  OriginalRow227TriangleData1309.coefficient99_341,
  OriginalRow227TriangleData1309.coefficient99_342,
  OriginalRow227TriangleData1309.coefficient99_343,
  OriginalRow227TriangleData1309.coefficient99_344,
  OriginalRow227TriangleData1309.coefficient99_345,
  OriginalRow227TriangleData1309.coefficient99_346,
  OriginalRow227TriangleData1309.coefficient99_347,
  OriginalRow227TriangleData1309.coefficient99_348,
  OriginalRow227TriangleData1309.coefficient99_349,
  OriginalRow227TriangleData1309.coefficient99_350,
  OriginalRow227TriangleData1309.coefficient99_351,
  OriginalRow227TriangleData1309.coefficient99_352,
  OriginalRow227TriangleData1309.coefficient99_353
]

theorem values1309_size : values1309.size = 32 := rfl

def block1309 : ℕ → Option IntervalDyadic := segment 322 values1309

theorem block1309_domain : ExactDomain block1309 322 354 := by
  simpa only [values1309_size] using segment_domain 322 values1309

theorem block1309_get (i : Fin 32) :
    block1309 (322 + i.val) = some (values1309[i.val]'(by rw [values1309_size]; exact i.isLt)) := by
  exact segment_get 322 values1309 ⟨i.val, by rw [values1309_size]; exact i.isLt⟩

def values1310 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1310.coefficient99_354,
  OriginalRow227TriangleData1310.coefficient99_355,
  OriginalRow227TriangleData1310.coefficient99_356,
  OriginalRow227TriangleData1310.coefficient99_357,
  OriginalRow227TriangleData1310.coefficient99_358,
  OriginalRow227TriangleData1310.coefficient99_359,
  OriginalRow227TriangleData1310.coefficient99_360,
  OriginalRow227TriangleData1310.coefficient99_361,
  OriginalRow227TriangleData1310.coefficient99_362,
  OriginalRow227TriangleData1310.coefficient99_363,
  OriginalRow227TriangleData1310.coefficient99_364,
  OriginalRow227TriangleData1310.coefficient99_365,
  OriginalRow227TriangleData1310.coefficient99_366,
  OriginalRow227TriangleData1310.coefficient99_367,
  OriginalRow227TriangleData1310.coefficient99_368,
  OriginalRow227TriangleData1310.coefficient99_369,
  OriginalRow227TriangleData1310.coefficient99_370,
  OriginalRow227TriangleData1310.coefficient99_371,
  OriginalRow227TriangleData1310.coefficient99_372,
  OriginalRow227TriangleData1310.coefficient99_373,
  OriginalRow227TriangleData1310.coefficient99_374,
  OriginalRow227TriangleData1310.coefficient99_375,
  OriginalRow227TriangleData1310.coefficient99_376,
  OriginalRow227TriangleData1310.coefficient99_377,
  OriginalRow227TriangleData1310.coefficient99_378,
  OriginalRow227TriangleData1310.coefficient99_379,
  OriginalRow227TriangleData1310.coefficient99_380,
  OriginalRow227TriangleData1310.coefficient99_381,
  OriginalRow227TriangleData1310.coefficient99_382,
  OriginalRow227TriangleData1310.coefficient99_383,
  OriginalRow227TriangleData1310.coefficient99_384,
  OriginalRow227TriangleData1310.coefficient99_385
]

theorem values1310_size : values1310.size = 32 := rfl

def block1310 : ℕ → Option IntervalDyadic := segment 354 values1310

theorem block1310_domain : ExactDomain block1310 354 386 := by
  simpa only [values1310_size] using segment_domain 354 values1310

theorem block1310_get (i : Fin 32) :
    block1310 (354 + i.val) = some (values1310[i.val]'(by rw [values1310_size]; exact i.isLt)) := by
  exact segment_get 354 values1310 ⟨i.val, by rw [values1310_size]; exact i.isLt⟩

def values1311 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1311.coefficient99_386,
  OriginalRow227TriangleData1311.coefficient99_387,
  OriginalRow227TriangleData1311.coefficient99_388,
  OriginalRow227TriangleData1311.coefficient99_389,
  OriginalRow227TriangleData1311.coefficient99_390,
  OriginalRow227TriangleData1311.coefficient99_391,
  OriginalRow227TriangleData1311.coefficient99_392,
  OriginalRow227TriangleData1311.coefficient99_393,
  OriginalRow227TriangleData1311.coefficient99_394,
  OriginalRow227TriangleData1311.coefficient99_395,
  OriginalRow227TriangleData1311.coefficient99_396,
  OriginalRow227TriangleData1311.coefficient99_397,
  OriginalRow227TriangleData1311.coefficient99_398,
  OriginalRow227TriangleData1311.coefficient99_399,
  OriginalRow227TriangleData1311.coefficient99_400,
  OriginalRow227TriangleData1311.coefficient99_401,
  OriginalRow227TriangleData1311.coefficient99_402
]

theorem values1311_size : values1311.size = 17 := rfl

def block1311 : ℕ → Option IntervalDyadic := segment 386 values1311

theorem block1311_domain : ExactDomain block1311 386 403 := by
  simpa only [values1311_size] using segment_domain 386 values1311

theorem block1311_get (i : Fin 17) :
    block1311 (386 + i.val) = some (values1311[i.val]'(by rw [values1311_size]; exact i.isLt)) := by
  exact segment_get 386 values1311 ⟨i.val, by rw [values1311_size]; exact i.isLt⟩

def node0098_0162 : ℕ → Option IntervalDyadic := split 130 block1302 block1303

theorem node0098_0162_domain : ExactDomain node0098_0162 98 162 := by
  exact split_domain (by decide) (by decide) block1302_domain block1303_domain

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block1305 block1306

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block1305_domain block1306_domain

def node0162_0258 : ℕ → Option IntervalDyadic := split 194 block1304 node0194_0258

theorem node0162_0258_domain : ExactDomain node0162_0258 162 258 := by
  exact split_domain (by decide) (by decide) block1304_domain node0194_0258_domain

def node0098_0258 : ℕ → Option IntervalDyadic := split 162 node0098_0162 node0162_0258

theorem node0098_0258_domain : ExactDomain node0098_0258 98 258 := by
  exact split_domain (by decide) (by decide) node0098_0162_domain node0162_0258_domain

def node0258_0322 : ℕ → Option IntervalDyadic := split 290 block1307 block1308

theorem node0258_0322_domain : ExactDomain node0258_0322 258 322 := by
  exact split_domain (by decide) (by decide) block1307_domain block1308_domain

def node0354_0403 : ℕ → Option IntervalDyadic := split 386 block1310 block1311

theorem node0354_0403_domain : ExactDomain node0354_0403 354 403 := by
  exact split_domain (by decide) (by decide) block1310_domain block1311_domain

def node0322_0403 : ℕ → Option IntervalDyadic := split 354 block1309 node0354_0403

theorem node0322_0403_domain : ExactDomain node0322_0403 322 403 := by
  exact split_domain (by decide) (by decide) block1309_domain node0354_0403_domain

def node0258_0403 : ℕ → Option IntervalDyadic := split 322 node0258_0322 node0322_0403

theorem node0258_0403_domain : ExactDomain node0258_0403 258 403 := by
  exact split_domain (by decide) (by decide) node0258_0322_domain node0322_0403_domain

def node0098_0403 : ℕ → Option IntervalDyadic := split 258 node0098_0258 node0258_0403

theorem node0098_0403_domain : ExactDomain node0098_0403 98 403 := by
  exact split_domain (by decide) (by decide) node0098_0258_domain node0258_0403_domain

def lookup : ℕ → Option IntervalDyadic := node0098_0403

theorem lookup_domain : ExactDomain lookup 98 403 :=
  node0098_0403_domain

theorem block1302_lookup (i : Fin 32) :
    lookup (98 + i.val) = some (values1302[i.val]'(by rw [values1302_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (98 + i.val) = _
  rw [node0098_0403, split_left 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0098_0258, split_left 162 node0098_0162 node0162_0258 (by omega)]
  rw [node0098_0162, split_left 130 block1302 block1303 (by omega)]
  exact block1302_get i

theorem block1303_lookup (i : Fin 32) :
    lookup (130 + i.val) = some (values1303[i.val]'(by rw [values1303_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (130 + i.val) = _
  rw [node0098_0403, split_left 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0098_0258, split_left 162 node0098_0162 node0162_0258 (by omega)]
  rw [node0098_0162, split_right 130 block1302 block1303 (by omega)]
  exact block1303_get i

theorem block1304_lookup (i : Fin 32) :
    lookup (162 + i.val) = some (values1304[i.val]'(by rw [values1304_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (162 + i.val) = _
  rw [node0098_0403, split_left 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0098_0258, split_right 162 node0098_0162 node0162_0258 (by omega)]
  rw [node0162_0258, split_left 194 block1304 node0194_0258 (by omega)]
  exact block1304_get i

theorem block1305_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values1305[i.val]'(by rw [values1305_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (194 + i.val) = _
  rw [node0098_0403, split_left 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0098_0258, split_right 162 node0098_0162 node0162_0258 (by omega)]
  rw [node0162_0258, split_right 194 block1304 node0194_0258 (by omega)]
  rw [node0194_0258, split_left 226 block1305 block1306 (by omega)]
  exact block1305_get i

theorem block1306_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values1306[i.val]'(by rw [values1306_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (226 + i.val) = _
  rw [node0098_0403, split_left 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0098_0258, split_right 162 node0098_0162 node0162_0258 (by omega)]
  rw [node0162_0258, split_right 194 block1304 node0194_0258 (by omega)]
  rw [node0194_0258, split_right 226 block1305 block1306 (by omega)]
  exact block1306_get i

theorem block1307_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values1307[i.val]'(by rw [values1307_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (258 + i.val) = _
  rw [node0098_0403, split_right 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0258_0403, split_left 322 node0258_0322 node0322_0403 (by omega)]
  rw [node0258_0322, split_left 290 block1307 block1308 (by omega)]
  exact block1307_get i

theorem block1308_lookup (i : Fin 32) :
    lookup (290 + i.val) = some (values1308[i.val]'(by rw [values1308_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (290 + i.val) = _
  rw [node0098_0403, split_right 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0258_0403, split_left 322 node0258_0322 node0322_0403 (by omega)]
  rw [node0258_0322, split_right 290 block1307 block1308 (by omega)]
  exact block1308_get i

theorem block1309_lookup (i : Fin 32) :
    lookup (322 + i.val) = some (values1309[i.val]'(by rw [values1309_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (322 + i.val) = _
  rw [node0098_0403, split_right 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0258_0403, split_right 322 node0258_0322 node0322_0403 (by omega)]
  rw [node0322_0403, split_left 354 block1309 node0354_0403 (by omega)]
  exact block1309_get i

theorem block1310_lookup (i : Fin 32) :
    lookup (354 + i.val) = some (values1310[i.val]'(by rw [values1310_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (354 + i.val) = _
  rw [node0098_0403, split_right 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0258_0403, split_right 322 node0258_0322 node0322_0403 (by omega)]
  rw [node0322_0403, split_right 354 block1309 node0354_0403 (by omega)]
  rw [node0354_0403, split_left 386 block1310 block1311 (by omega)]
  exact block1310_get i

theorem block1311_lookup (i : Fin 17) :
    lookup (386 + i.val) = some (values1311[i.val]'(by rw [values1311_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0098_0403 (386 + i.val) = _
  rw [node0098_0403, split_right 258 node0098_0258 node0258_0403 (by omega)]
  rw [node0258_0403, split_right 322 node0258_0322 node0322_0403 (by omega)]
  rw [node0322_0403, split_right 354 block1309 node0354_0403 (by omega)]
  rw [node0354_0403, split_right 386 block1310 block1311 (by omega)]
  exact block1311_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1302_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1302_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1303_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1303_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1304_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1304_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1305_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1305_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1306_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1306_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1307_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1307_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1308_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1308_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1309_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1309_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1310_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1310_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1311_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1311_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1302_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1303_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1304_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1305_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1306_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1307_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1308_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1309_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1310_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow099.block1311_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow099
