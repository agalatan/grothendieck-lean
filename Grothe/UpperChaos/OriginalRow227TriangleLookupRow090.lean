import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1210
import Grothe.UpperChaos.OriginalRow227TriangleData1211
import Grothe.UpperChaos.OriginalRow227TriangleData1212
import Grothe.UpperChaos.OriginalRow227TriangleData1213
import Grothe.UpperChaos.OriginalRow227TriangleData1214
import Grothe.UpperChaos.OriginalRow227TriangleData1215
import Grothe.UpperChaos.OriginalRow227TriangleData1216
import Grothe.UpperChaos.OriginalRow227TriangleData1217
import Grothe.UpperChaos.OriginalRow227TriangleData1218
import Grothe.UpperChaos.OriginalRow227TriangleData1219
import Grothe.UpperChaos.OriginalRow227TriangleData1220

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow090

open ConditionalTableLookup

def values1210 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1210.coefficient90_89,
  OriginalRow227TriangleData1210.coefficient90_90,
  OriginalRow227TriangleData1210.coefficient90_91,
  OriginalRow227TriangleData1210.coefficient90_92,
  OriginalRow227TriangleData1210.coefficient90_93,
  OriginalRow227TriangleData1210.coefficient90_94,
  OriginalRow227TriangleData1210.coefficient90_95,
  OriginalRow227TriangleData1210.coefficient90_96,
  OriginalRow227TriangleData1210.coefficient90_97,
  OriginalRow227TriangleData1210.coefficient90_98,
  OriginalRow227TriangleData1210.coefficient90_99,
  OriginalRow227TriangleData1210.coefficient90_100,
  OriginalRow227TriangleData1210.coefficient90_101,
  OriginalRow227TriangleData1210.coefficient90_102,
  OriginalRow227TriangleData1210.coefficient90_103,
  OriginalRow227TriangleData1210.coefficient90_104,
  OriginalRow227TriangleData1210.coefficient90_105,
  OriginalRow227TriangleData1210.coefficient90_106,
  OriginalRow227TriangleData1210.coefficient90_107,
  OriginalRow227TriangleData1210.coefficient90_108,
  OriginalRow227TriangleData1210.coefficient90_109,
  OriginalRow227TriangleData1210.coefficient90_110,
  OriginalRow227TriangleData1210.coefficient90_111,
  OriginalRow227TriangleData1210.coefficient90_112,
  OriginalRow227TriangleData1210.coefficient90_113,
  OriginalRow227TriangleData1210.coefficient90_114,
  OriginalRow227TriangleData1210.coefficient90_115,
  OriginalRow227TriangleData1210.coefficient90_116,
  OriginalRow227TriangleData1210.coefficient90_117,
  OriginalRow227TriangleData1210.coefficient90_118,
  OriginalRow227TriangleData1210.coefficient90_119,
  OriginalRow227TriangleData1210.coefficient90_120
]

theorem values1210_size : values1210.size = 32 := rfl

def block1210 : ℕ → Option IntervalDyadic := segment 89 values1210

theorem block1210_domain : ExactDomain block1210 89 121 := by
  simpa only [values1210_size] using segment_domain 89 values1210

theorem block1210_get (i : Fin 32) :
    block1210 (89 + i.val) = some (values1210[i.val]'(by rw [values1210_size]; exact i.isLt)) := by
  exact segment_get 89 values1210 ⟨i.val, by rw [values1210_size]; exact i.isLt⟩

def values1211 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1211.coefficient90_121,
  OriginalRow227TriangleData1211.coefficient90_122,
  OriginalRow227TriangleData1211.coefficient90_123,
  OriginalRow227TriangleData1211.coefficient90_124,
  OriginalRow227TriangleData1211.coefficient90_125,
  OriginalRow227TriangleData1211.coefficient90_126,
  OriginalRow227TriangleData1211.coefficient90_127,
  OriginalRow227TriangleData1211.coefficient90_128,
  OriginalRow227TriangleData1211.coefficient90_129,
  OriginalRow227TriangleData1211.coefficient90_130,
  OriginalRow227TriangleData1211.coefficient90_131,
  OriginalRow227TriangleData1211.coefficient90_132,
  OriginalRow227TriangleData1211.coefficient90_133,
  OriginalRow227TriangleData1211.coefficient90_134,
  OriginalRow227TriangleData1211.coefficient90_135,
  OriginalRow227TriangleData1211.coefficient90_136,
  OriginalRow227TriangleData1211.coefficient90_137,
  OriginalRow227TriangleData1211.coefficient90_138,
  OriginalRow227TriangleData1211.coefficient90_139,
  OriginalRow227TriangleData1211.coefficient90_140,
  OriginalRow227TriangleData1211.coefficient90_141,
  OriginalRow227TriangleData1211.coefficient90_142,
  OriginalRow227TriangleData1211.coefficient90_143,
  OriginalRow227TriangleData1211.coefficient90_144,
  OriginalRow227TriangleData1211.coefficient90_145,
  OriginalRow227TriangleData1211.coefficient90_146,
  OriginalRow227TriangleData1211.coefficient90_147,
  OriginalRow227TriangleData1211.coefficient90_148,
  OriginalRow227TriangleData1211.coefficient90_149,
  OriginalRow227TriangleData1211.coefficient90_150,
  OriginalRow227TriangleData1211.coefficient90_151,
  OriginalRow227TriangleData1211.coefficient90_152
]

theorem values1211_size : values1211.size = 32 := rfl

def block1211 : ℕ → Option IntervalDyadic := segment 121 values1211

theorem block1211_domain : ExactDomain block1211 121 153 := by
  simpa only [values1211_size] using segment_domain 121 values1211

theorem block1211_get (i : Fin 32) :
    block1211 (121 + i.val) = some (values1211[i.val]'(by rw [values1211_size]; exact i.isLt)) := by
  exact segment_get 121 values1211 ⟨i.val, by rw [values1211_size]; exact i.isLt⟩

def values1212 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1212.coefficient90_153,
  OriginalRow227TriangleData1212.coefficient90_154,
  OriginalRow227TriangleData1212.coefficient90_155,
  OriginalRow227TriangleData1212.coefficient90_156,
  OriginalRow227TriangleData1212.coefficient90_157,
  OriginalRow227TriangleData1212.coefficient90_158,
  OriginalRow227TriangleData1212.coefficient90_159,
  OriginalRow227TriangleData1212.coefficient90_160,
  OriginalRow227TriangleData1212.coefficient90_161,
  OriginalRow227TriangleData1212.coefficient90_162,
  OriginalRow227TriangleData1212.coefficient90_163,
  OriginalRow227TriangleData1212.coefficient90_164,
  OriginalRow227TriangleData1212.coefficient90_165,
  OriginalRow227TriangleData1212.coefficient90_166,
  OriginalRow227TriangleData1212.coefficient90_167,
  OriginalRow227TriangleData1212.coefficient90_168,
  OriginalRow227TriangleData1212.coefficient90_169,
  OriginalRow227TriangleData1212.coefficient90_170,
  OriginalRow227TriangleData1212.coefficient90_171,
  OriginalRow227TriangleData1212.coefficient90_172,
  OriginalRow227TriangleData1212.coefficient90_173,
  OriginalRow227TriangleData1212.coefficient90_174,
  OriginalRow227TriangleData1212.coefficient90_175,
  OriginalRow227TriangleData1212.coefficient90_176,
  OriginalRow227TriangleData1212.coefficient90_177,
  OriginalRow227TriangleData1212.coefficient90_178,
  OriginalRow227TriangleData1212.coefficient90_179,
  OriginalRow227TriangleData1212.coefficient90_180,
  OriginalRow227TriangleData1212.coefficient90_181,
  OriginalRow227TriangleData1212.coefficient90_182,
  OriginalRow227TriangleData1212.coefficient90_183,
  OriginalRow227TriangleData1212.coefficient90_184
]

theorem values1212_size : values1212.size = 32 := rfl

def block1212 : ℕ → Option IntervalDyadic := segment 153 values1212

theorem block1212_domain : ExactDomain block1212 153 185 := by
  simpa only [values1212_size] using segment_domain 153 values1212

theorem block1212_get (i : Fin 32) :
    block1212 (153 + i.val) = some (values1212[i.val]'(by rw [values1212_size]; exact i.isLt)) := by
  exact segment_get 153 values1212 ⟨i.val, by rw [values1212_size]; exact i.isLt⟩

def values1213 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1213.coefficient90_185,
  OriginalRow227TriangleData1213.coefficient90_186,
  OriginalRow227TriangleData1213.coefficient90_187,
  OriginalRow227TriangleData1213.coefficient90_188,
  OriginalRow227TriangleData1213.coefficient90_189,
  OriginalRow227TriangleData1213.coefficient90_190,
  OriginalRow227TriangleData1213.coefficient90_191,
  OriginalRow227TriangleData1213.coefficient90_192,
  OriginalRow227TriangleData1213.coefficient90_193,
  OriginalRow227TriangleData1213.coefficient90_194,
  OriginalRow227TriangleData1213.coefficient90_195,
  OriginalRow227TriangleData1213.coefficient90_196,
  OriginalRow227TriangleData1213.coefficient90_197,
  OriginalRow227TriangleData1213.coefficient90_198,
  OriginalRow227TriangleData1213.coefficient90_199,
  OriginalRow227TriangleData1213.coefficient90_200,
  OriginalRow227TriangleData1213.coefficient90_201,
  OriginalRow227TriangleData1213.coefficient90_202,
  OriginalRow227TriangleData1213.coefficient90_203,
  OriginalRow227TriangleData1213.coefficient90_204,
  OriginalRow227TriangleData1213.coefficient90_205,
  OriginalRow227TriangleData1213.coefficient90_206,
  OriginalRow227TriangleData1213.coefficient90_207,
  OriginalRow227TriangleData1213.coefficient90_208,
  OriginalRow227TriangleData1213.coefficient90_209,
  OriginalRow227TriangleData1213.coefficient90_210,
  OriginalRow227TriangleData1213.coefficient90_211,
  OriginalRow227TriangleData1213.coefficient90_212,
  OriginalRow227TriangleData1213.coefficient90_213,
  OriginalRow227TriangleData1213.coefficient90_214,
  OriginalRow227TriangleData1213.coefficient90_215,
  OriginalRow227TriangleData1213.coefficient90_216
]

theorem values1213_size : values1213.size = 32 := rfl

def block1213 : ℕ → Option IntervalDyadic := segment 185 values1213

theorem block1213_domain : ExactDomain block1213 185 217 := by
  simpa only [values1213_size] using segment_domain 185 values1213

theorem block1213_get (i : Fin 32) :
    block1213 (185 + i.val) = some (values1213[i.val]'(by rw [values1213_size]; exact i.isLt)) := by
  exact segment_get 185 values1213 ⟨i.val, by rw [values1213_size]; exact i.isLt⟩

def values1214 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1214.coefficient90_217,
  OriginalRow227TriangleData1214.coefficient90_218,
  OriginalRow227TriangleData1214.coefficient90_219,
  OriginalRow227TriangleData1214.coefficient90_220,
  OriginalRow227TriangleData1214.coefficient90_221,
  OriginalRow227TriangleData1214.coefficient90_222,
  OriginalRow227TriangleData1214.coefficient90_223,
  OriginalRow227TriangleData1214.coefficient90_224,
  OriginalRow227TriangleData1214.coefficient90_225,
  OriginalRow227TriangleData1214.coefficient90_226,
  OriginalRow227TriangleData1214.coefficient90_227,
  OriginalRow227TriangleData1214.coefficient90_228,
  OriginalRow227TriangleData1214.coefficient90_229,
  OriginalRow227TriangleData1214.coefficient90_230,
  OriginalRow227TriangleData1214.coefficient90_231,
  OriginalRow227TriangleData1214.coefficient90_232,
  OriginalRow227TriangleData1214.coefficient90_233,
  OriginalRow227TriangleData1214.coefficient90_234,
  OriginalRow227TriangleData1214.coefficient90_235,
  OriginalRow227TriangleData1214.coefficient90_236,
  OriginalRow227TriangleData1214.coefficient90_237,
  OriginalRow227TriangleData1214.coefficient90_238,
  OriginalRow227TriangleData1214.coefficient90_239,
  OriginalRow227TriangleData1214.coefficient90_240,
  OriginalRow227TriangleData1214.coefficient90_241,
  OriginalRow227TriangleData1214.coefficient90_242,
  OriginalRow227TriangleData1214.coefficient90_243,
  OriginalRow227TriangleData1214.coefficient90_244,
  OriginalRow227TriangleData1214.coefficient90_245,
  OriginalRow227TriangleData1214.coefficient90_246,
  OriginalRow227TriangleData1214.coefficient90_247,
  OriginalRow227TriangleData1214.coefficient90_248
]

theorem values1214_size : values1214.size = 32 := rfl

def block1214 : ℕ → Option IntervalDyadic := segment 217 values1214

theorem block1214_domain : ExactDomain block1214 217 249 := by
  simpa only [values1214_size] using segment_domain 217 values1214

theorem block1214_get (i : Fin 32) :
    block1214 (217 + i.val) = some (values1214[i.val]'(by rw [values1214_size]; exact i.isLt)) := by
  exact segment_get 217 values1214 ⟨i.val, by rw [values1214_size]; exact i.isLt⟩

def values1215 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1215.coefficient90_249,
  OriginalRow227TriangleData1215.coefficient90_250,
  OriginalRow227TriangleData1215.coefficient90_251,
  OriginalRow227TriangleData1215.coefficient90_252,
  OriginalRow227TriangleData1215.coefficient90_253,
  OriginalRow227TriangleData1215.coefficient90_254,
  OriginalRow227TriangleData1215.coefficient90_255,
  OriginalRow227TriangleData1215.coefficient90_256,
  OriginalRow227TriangleData1215.coefficient90_257,
  OriginalRow227TriangleData1215.coefficient90_258,
  OriginalRow227TriangleData1215.coefficient90_259,
  OriginalRow227TriangleData1215.coefficient90_260,
  OriginalRow227TriangleData1215.coefficient90_261,
  OriginalRow227TriangleData1215.coefficient90_262,
  OriginalRow227TriangleData1215.coefficient90_263,
  OriginalRow227TriangleData1215.coefficient90_264,
  OriginalRow227TriangleData1215.coefficient90_265,
  OriginalRow227TriangleData1215.coefficient90_266,
  OriginalRow227TriangleData1215.coefficient90_267,
  OriginalRow227TriangleData1215.coefficient90_268,
  OriginalRow227TriangleData1215.coefficient90_269,
  OriginalRow227TriangleData1215.coefficient90_270,
  OriginalRow227TriangleData1215.coefficient90_271,
  OriginalRow227TriangleData1215.coefficient90_272,
  OriginalRow227TriangleData1215.coefficient90_273,
  OriginalRow227TriangleData1215.coefficient90_274,
  OriginalRow227TriangleData1215.coefficient90_275,
  OriginalRow227TriangleData1215.coefficient90_276,
  OriginalRow227TriangleData1215.coefficient90_277,
  OriginalRow227TriangleData1215.coefficient90_278,
  OriginalRow227TriangleData1215.coefficient90_279,
  OriginalRow227TriangleData1215.coefficient90_280
]

theorem values1215_size : values1215.size = 32 := rfl

def block1215 : ℕ → Option IntervalDyadic := segment 249 values1215

theorem block1215_domain : ExactDomain block1215 249 281 := by
  simpa only [values1215_size] using segment_domain 249 values1215

theorem block1215_get (i : Fin 32) :
    block1215 (249 + i.val) = some (values1215[i.val]'(by rw [values1215_size]; exact i.isLt)) := by
  exact segment_get 249 values1215 ⟨i.val, by rw [values1215_size]; exact i.isLt⟩

def values1216 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1216.coefficient90_281,
  OriginalRow227TriangleData1216.coefficient90_282,
  OriginalRow227TriangleData1216.coefficient90_283,
  OriginalRow227TriangleData1216.coefficient90_284,
  OriginalRow227TriangleData1216.coefficient90_285,
  OriginalRow227TriangleData1216.coefficient90_286,
  OriginalRow227TriangleData1216.coefficient90_287,
  OriginalRow227TriangleData1216.coefficient90_288,
  OriginalRow227TriangleData1216.coefficient90_289,
  OriginalRow227TriangleData1216.coefficient90_290,
  OriginalRow227TriangleData1216.coefficient90_291,
  OriginalRow227TriangleData1216.coefficient90_292,
  OriginalRow227TriangleData1216.coefficient90_293,
  OriginalRow227TriangleData1216.coefficient90_294,
  OriginalRow227TriangleData1216.coefficient90_295,
  OriginalRow227TriangleData1216.coefficient90_296,
  OriginalRow227TriangleData1216.coefficient90_297,
  OriginalRow227TriangleData1216.coefficient90_298,
  OriginalRow227TriangleData1216.coefficient90_299,
  OriginalRow227TriangleData1216.coefficient90_300,
  OriginalRow227TriangleData1216.coefficient90_301,
  OriginalRow227TriangleData1216.coefficient90_302,
  OriginalRow227TriangleData1216.coefficient90_303,
  OriginalRow227TriangleData1216.coefficient90_304,
  OriginalRow227TriangleData1216.coefficient90_305,
  OriginalRow227TriangleData1216.coefficient90_306,
  OriginalRow227TriangleData1216.coefficient90_307,
  OriginalRow227TriangleData1216.coefficient90_308,
  OriginalRow227TriangleData1216.coefficient90_309,
  OriginalRow227TriangleData1216.coefficient90_310,
  OriginalRow227TriangleData1216.coefficient90_311,
  OriginalRow227TriangleData1216.coefficient90_312
]

theorem values1216_size : values1216.size = 32 := rfl

def block1216 : ℕ → Option IntervalDyadic := segment 281 values1216

theorem block1216_domain : ExactDomain block1216 281 313 := by
  simpa only [values1216_size] using segment_domain 281 values1216

theorem block1216_get (i : Fin 32) :
    block1216 (281 + i.val) = some (values1216[i.val]'(by rw [values1216_size]; exact i.isLt)) := by
  exact segment_get 281 values1216 ⟨i.val, by rw [values1216_size]; exact i.isLt⟩

def values1217 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1217.coefficient90_313,
  OriginalRow227TriangleData1217.coefficient90_314,
  OriginalRow227TriangleData1217.coefficient90_315,
  OriginalRow227TriangleData1217.coefficient90_316,
  OriginalRow227TriangleData1217.coefficient90_317,
  OriginalRow227TriangleData1217.coefficient90_318,
  OriginalRow227TriangleData1217.coefficient90_319,
  OriginalRow227TriangleData1217.coefficient90_320,
  OriginalRow227TriangleData1217.coefficient90_321,
  OriginalRow227TriangleData1217.coefficient90_322,
  OriginalRow227TriangleData1217.coefficient90_323,
  OriginalRow227TriangleData1217.coefficient90_324,
  OriginalRow227TriangleData1217.coefficient90_325,
  OriginalRow227TriangleData1217.coefficient90_326,
  OriginalRow227TriangleData1217.coefficient90_327,
  OriginalRow227TriangleData1217.coefficient90_328,
  OriginalRow227TriangleData1217.coefficient90_329,
  OriginalRow227TriangleData1217.coefficient90_330,
  OriginalRow227TriangleData1217.coefficient90_331,
  OriginalRow227TriangleData1217.coefficient90_332,
  OriginalRow227TriangleData1217.coefficient90_333,
  OriginalRow227TriangleData1217.coefficient90_334,
  OriginalRow227TriangleData1217.coefficient90_335,
  OriginalRow227TriangleData1217.coefficient90_336,
  OriginalRow227TriangleData1217.coefficient90_337,
  OriginalRow227TriangleData1217.coefficient90_338,
  OriginalRow227TriangleData1217.coefficient90_339,
  OriginalRow227TriangleData1217.coefficient90_340,
  OriginalRow227TriangleData1217.coefficient90_341,
  OriginalRow227TriangleData1217.coefficient90_342,
  OriginalRow227TriangleData1217.coefficient90_343,
  OriginalRow227TriangleData1217.coefficient90_344
]

theorem values1217_size : values1217.size = 32 := rfl

def block1217 : ℕ → Option IntervalDyadic := segment 313 values1217

theorem block1217_domain : ExactDomain block1217 313 345 := by
  simpa only [values1217_size] using segment_domain 313 values1217

theorem block1217_get (i : Fin 32) :
    block1217 (313 + i.val) = some (values1217[i.val]'(by rw [values1217_size]; exact i.isLt)) := by
  exact segment_get 313 values1217 ⟨i.val, by rw [values1217_size]; exact i.isLt⟩

def values1218 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1218.coefficient90_345,
  OriginalRow227TriangleData1218.coefficient90_346,
  OriginalRow227TriangleData1218.coefficient90_347,
  OriginalRow227TriangleData1218.coefficient90_348,
  OriginalRow227TriangleData1218.coefficient90_349,
  OriginalRow227TriangleData1218.coefficient90_350,
  OriginalRow227TriangleData1218.coefficient90_351,
  OriginalRow227TriangleData1218.coefficient90_352,
  OriginalRow227TriangleData1218.coefficient90_353,
  OriginalRow227TriangleData1218.coefficient90_354,
  OriginalRow227TriangleData1218.coefficient90_355,
  OriginalRow227TriangleData1218.coefficient90_356,
  OriginalRow227TriangleData1218.coefficient90_357,
  OriginalRow227TriangleData1218.coefficient90_358,
  OriginalRow227TriangleData1218.coefficient90_359,
  OriginalRow227TriangleData1218.coefficient90_360,
  OriginalRow227TriangleData1218.coefficient90_361,
  OriginalRow227TriangleData1218.coefficient90_362,
  OriginalRow227TriangleData1218.coefficient90_363,
  OriginalRow227TriangleData1218.coefficient90_364,
  OriginalRow227TriangleData1218.coefficient90_365,
  OriginalRow227TriangleData1218.coefficient90_366,
  OriginalRow227TriangleData1218.coefficient90_367,
  OriginalRow227TriangleData1218.coefficient90_368,
  OriginalRow227TriangleData1218.coefficient90_369,
  OriginalRow227TriangleData1218.coefficient90_370,
  OriginalRow227TriangleData1218.coefficient90_371,
  OriginalRow227TriangleData1218.coefficient90_372,
  OriginalRow227TriangleData1218.coefficient90_373,
  OriginalRow227TriangleData1218.coefficient90_374,
  OriginalRow227TriangleData1218.coefficient90_375,
  OriginalRow227TriangleData1218.coefficient90_376
]

theorem values1218_size : values1218.size = 32 := rfl

def block1218 : ℕ → Option IntervalDyadic := segment 345 values1218

theorem block1218_domain : ExactDomain block1218 345 377 := by
  simpa only [values1218_size] using segment_domain 345 values1218

theorem block1218_get (i : Fin 32) :
    block1218 (345 + i.val) = some (values1218[i.val]'(by rw [values1218_size]; exact i.isLt)) := by
  exact segment_get 345 values1218 ⟨i.val, by rw [values1218_size]; exact i.isLt⟩

def values1219 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1219.coefficient90_377,
  OriginalRow227TriangleData1219.coefficient90_378,
  OriginalRow227TriangleData1219.coefficient90_379,
  OriginalRow227TriangleData1219.coefficient90_380,
  OriginalRow227TriangleData1219.coefficient90_381,
  OriginalRow227TriangleData1219.coefficient90_382,
  OriginalRow227TriangleData1219.coefficient90_383,
  OriginalRow227TriangleData1219.coefficient90_384,
  OriginalRow227TriangleData1219.coefficient90_385,
  OriginalRow227TriangleData1219.coefficient90_386,
  OriginalRow227TriangleData1219.coefficient90_387,
  OriginalRow227TriangleData1219.coefficient90_388,
  OriginalRow227TriangleData1219.coefficient90_389,
  OriginalRow227TriangleData1219.coefficient90_390,
  OriginalRow227TriangleData1219.coefficient90_391,
  OriginalRow227TriangleData1219.coefficient90_392,
  OriginalRow227TriangleData1219.coefficient90_393,
  OriginalRow227TriangleData1219.coefficient90_394,
  OriginalRow227TriangleData1219.coefficient90_395,
  OriginalRow227TriangleData1219.coefficient90_396,
  OriginalRow227TriangleData1219.coefficient90_397,
  OriginalRow227TriangleData1219.coefficient90_398,
  OriginalRow227TriangleData1219.coefficient90_399,
  OriginalRow227TriangleData1219.coefficient90_400,
  OriginalRow227TriangleData1219.coefficient90_401,
  OriginalRow227TriangleData1219.coefficient90_402,
  OriginalRow227TriangleData1219.coefficient90_403,
  OriginalRow227TriangleData1219.coefficient90_404,
  OriginalRow227TriangleData1219.coefficient90_405,
  OriginalRow227TriangleData1219.coefficient90_406,
  OriginalRow227TriangleData1219.coefficient90_407,
  OriginalRow227TriangleData1219.coefficient90_408
]

theorem values1219_size : values1219.size = 32 := rfl

def block1219 : ℕ → Option IntervalDyadic := segment 377 values1219

theorem block1219_domain : ExactDomain block1219 377 409 := by
  simpa only [values1219_size] using segment_domain 377 values1219

theorem block1219_get (i : Fin 32) :
    block1219 (377 + i.val) = some (values1219[i.val]'(by rw [values1219_size]; exact i.isLt)) := by
  exact segment_get 377 values1219 ⟨i.val, by rw [values1219_size]; exact i.isLt⟩

def values1220 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1220.coefficient90_409,
  OriginalRow227TriangleData1220.coefficient90_410,
  OriginalRow227TriangleData1220.coefficient90_411
]

theorem values1220_size : values1220.size = 3 := rfl

def block1220 : ℕ → Option IntervalDyadic := segment 409 values1220

theorem block1220_domain : ExactDomain block1220 409 412 := by
  simpa only [values1220_size] using segment_domain 409 values1220

theorem block1220_get (i : Fin 3) :
    block1220 (409 + i.val) = some (values1220[i.val]'(by rw [values1220_size]; exact i.isLt)) := by
  exact segment_get 409 values1220 ⟨i.val, by rw [values1220_size]; exact i.isLt⟩

def node0089_0153 : ℕ → Option IntervalDyadic := split 121 block1210 block1211

theorem node0089_0153_domain : ExactDomain node0089_0153 89 153 := by
  exact split_domain (by decide) (by decide) block1210_domain block1211_domain

def node0185_0249 : ℕ → Option IntervalDyadic := split 217 block1213 block1214

theorem node0185_0249_domain : ExactDomain node0185_0249 185 249 := by
  exact split_domain (by decide) (by decide) block1213_domain block1214_domain

def node0153_0249 : ℕ → Option IntervalDyadic := split 185 block1212 node0185_0249

theorem node0153_0249_domain : ExactDomain node0153_0249 153 249 := by
  exact split_domain (by decide) (by decide) block1212_domain node0185_0249_domain

def node0089_0249 : ℕ → Option IntervalDyadic := split 153 node0089_0153 node0153_0249

theorem node0089_0249_domain : ExactDomain node0089_0249 89 249 := by
  exact split_domain (by decide) (by decide) node0089_0153_domain node0153_0249_domain

def node0281_0345 : ℕ → Option IntervalDyadic := split 313 block1216 block1217

theorem node0281_0345_domain : ExactDomain node0281_0345 281 345 := by
  exact split_domain (by decide) (by decide) block1216_domain block1217_domain

def node0249_0345 : ℕ → Option IntervalDyadic := split 281 block1215 node0281_0345

theorem node0249_0345_domain : ExactDomain node0249_0345 249 345 := by
  exact split_domain (by decide) (by decide) block1215_domain node0281_0345_domain

def node0377_0412 : ℕ → Option IntervalDyadic := split 409 block1219 block1220

theorem node0377_0412_domain : ExactDomain node0377_0412 377 412 := by
  exact split_domain (by decide) (by decide) block1219_domain block1220_domain

def node0345_0412 : ℕ → Option IntervalDyadic := split 377 block1218 node0377_0412

theorem node0345_0412_domain : ExactDomain node0345_0412 345 412 := by
  exact split_domain (by decide) (by decide) block1218_domain node0377_0412_domain

def node0249_0412 : ℕ → Option IntervalDyadic := split 345 node0249_0345 node0345_0412

theorem node0249_0412_domain : ExactDomain node0249_0412 249 412 := by
  exact split_domain (by decide) (by decide) node0249_0345_domain node0345_0412_domain

def node0089_0412 : ℕ → Option IntervalDyadic := split 249 node0089_0249 node0249_0412

theorem node0089_0412_domain : ExactDomain node0089_0412 89 412 := by
  exact split_domain (by decide) (by decide) node0089_0249_domain node0249_0412_domain

def lookup : ℕ → Option IntervalDyadic := node0089_0412

theorem lookup_domain : ExactDomain lookup 89 412 :=
  node0089_0412_domain

theorem block1210_lookup (i : Fin 32) :
    lookup (89 + i.val) = some (values1210[i.val]'(by rw [values1210_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (89 + i.val) = _
  rw [node0089_0412, split_left 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0089_0249, split_left 153 node0089_0153 node0153_0249 (by omega)]
  rw [node0089_0153, split_left 121 block1210 block1211 (by omega)]
  exact block1210_get i

theorem block1211_lookup (i : Fin 32) :
    lookup (121 + i.val) = some (values1211[i.val]'(by rw [values1211_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (121 + i.val) = _
  rw [node0089_0412, split_left 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0089_0249, split_left 153 node0089_0153 node0153_0249 (by omega)]
  rw [node0089_0153, split_right 121 block1210 block1211 (by omega)]
  exact block1211_get i

theorem block1212_lookup (i : Fin 32) :
    lookup (153 + i.val) = some (values1212[i.val]'(by rw [values1212_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (153 + i.val) = _
  rw [node0089_0412, split_left 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0089_0249, split_right 153 node0089_0153 node0153_0249 (by omega)]
  rw [node0153_0249, split_left 185 block1212 node0185_0249 (by omega)]
  exact block1212_get i

theorem block1213_lookup (i : Fin 32) :
    lookup (185 + i.val) = some (values1213[i.val]'(by rw [values1213_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (185 + i.val) = _
  rw [node0089_0412, split_left 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0089_0249, split_right 153 node0089_0153 node0153_0249 (by omega)]
  rw [node0153_0249, split_right 185 block1212 node0185_0249 (by omega)]
  rw [node0185_0249, split_left 217 block1213 block1214 (by omega)]
  exact block1213_get i

theorem block1214_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values1214[i.val]'(by rw [values1214_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (217 + i.val) = _
  rw [node0089_0412, split_left 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0089_0249, split_right 153 node0089_0153 node0153_0249 (by omega)]
  rw [node0153_0249, split_right 185 block1212 node0185_0249 (by omega)]
  rw [node0185_0249, split_right 217 block1213 block1214 (by omega)]
  exact block1214_get i

theorem block1215_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values1215[i.val]'(by rw [values1215_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (249 + i.val) = _
  rw [node0089_0412, split_right 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0249_0412, split_left 345 node0249_0345 node0345_0412 (by omega)]
  rw [node0249_0345, split_left 281 block1215 node0281_0345 (by omega)]
  exact block1215_get i

theorem block1216_lookup (i : Fin 32) :
    lookup (281 + i.val) = some (values1216[i.val]'(by rw [values1216_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (281 + i.val) = _
  rw [node0089_0412, split_right 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0249_0412, split_left 345 node0249_0345 node0345_0412 (by omega)]
  rw [node0249_0345, split_right 281 block1215 node0281_0345 (by omega)]
  rw [node0281_0345, split_left 313 block1216 block1217 (by omega)]
  exact block1216_get i

theorem block1217_lookup (i : Fin 32) :
    lookup (313 + i.val) = some (values1217[i.val]'(by rw [values1217_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (313 + i.val) = _
  rw [node0089_0412, split_right 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0249_0412, split_left 345 node0249_0345 node0345_0412 (by omega)]
  rw [node0249_0345, split_right 281 block1215 node0281_0345 (by omega)]
  rw [node0281_0345, split_right 313 block1216 block1217 (by omega)]
  exact block1217_get i

theorem block1218_lookup (i : Fin 32) :
    lookup (345 + i.val) = some (values1218[i.val]'(by rw [values1218_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (345 + i.val) = _
  rw [node0089_0412, split_right 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0249_0412, split_right 345 node0249_0345 node0345_0412 (by omega)]
  rw [node0345_0412, split_left 377 block1218 node0377_0412 (by omega)]
  exact block1218_get i

theorem block1219_lookup (i : Fin 32) :
    lookup (377 + i.val) = some (values1219[i.val]'(by rw [values1219_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (377 + i.val) = _
  rw [node0089_0412, split_right 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0249_0412, split_right 345 node0249_0345 node0345_0412 (by omega)]
  rw [node0345_0412, split_right 377 block1218 node0377_0412 (by omega)]
  rw [node0377_0412, split_left 409 block1219 block1220 (by omega)]
  exact block1219_get i

theorem block1220_lookup (i : Fin 3) :
    lookup (409 + i.val) = some (values1220[i.val]'(by rw [values1220_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0089_0412 (409 + i.val) = _
  rw [node0089_0412, split_right 249 node0089_0249 node0249_0412 (by omega)]
  rw [node0249_0412, split_right 345 node0249_0345 node0345_0412 (by omega)]
  rw [node0345_0412, split_right 377 block1218 node0377_0412 (by omega)]
  rw [node0377_0412, split_right 409 block1219 block1220 (by omega)]
  exact block1220_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1210_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1210_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1211_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1211_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1212_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1212_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1213_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1213_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1214_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1214_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1215_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1215_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1216_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1216_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1217_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1217_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1218_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1218_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1219_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1219_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1220_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1220_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1210_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1211_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1212_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1213_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1214_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1215_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1216_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1217_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1218_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1219_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow090.block1220_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow090
