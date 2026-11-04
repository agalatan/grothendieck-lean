import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1177
import Grothe.UpperChaos.OriginalRow227TriangleData1178
import Grothe.UpperChaos.OriginalRow227TriangleData1179
import Grothe.UpperChaos.OriginalRow227TriangleData1180
import Grothe.UpperChaos.OriginalRow227TriangleData1181
import Grothe.UpperChaos.OriginalRow227TriangleData1182
import Grothe.UpperChaos.OriginalRow227TriangleData1183
import Grothe.UpperChaos.OriginalRow227TriangleData1184
import Grothe.UpperChaos.OriginalRow227TriangleData1185
import Grothe.UpperChaos.OriginalRow227TriangleData1186
import Grothe.UpperChaos.OriginalRow227TriangleData1187

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow087

open ConditionalTableLookup

def values1177 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1177.coefficient87_86,
  OriginalRow227TriangleData1177.coefficient87_87,
  OriginalRow227TriangleData1177.coefficient87_88,
  OriginalRow227TriangleData1177.coefficient87_89,
  OriginalRow227TriangleData1177.coefficient87_90,
  OriginalRow227TriangleData1177.coefficient87_91,
  OriginalRow227TriangleData1177.coefficient87_92,
  OriginalRow227TriangleData1177.coefficient87_93,
  OriginalRow227TriangleData1177.coefficient87_94,
  OriginalRow227TriangleData1177.coefficient87_95,
  OriginalRow227TriangleData1177.coefficient87_96,
  OriginalRow227TriangleData1177.coefficient87_97,
  OriginalRow227TriangleData1177.coefficient87_98,
  OriginalRow227TriangleData1177.coefficient87_99,
  OriginalRow227TriangleData1177.coefficient87_100,
  OriginalRow227TriangleData1177.coefficient87_101,
  OriginalRow227TriangleData1177.coefficient87_102,
  OriginalRow227TriangleData1177.coefficient87_103,
  OriginalRow227TriangleData1177.coefficient87_104,
  OriginalRow227TriangleData1177.coefficient87_105,
  OriginalRow227TriangleData1177.coefficient87_106,
  OriginalRow227TriangleData1177.coefficient87_107,
  OriginalRow227TriangleData1177.coefficient87_108,
  OriginalRow227TriangleData1177.coefficient87_109,
  OriginalRow227TriangleData1177.coefficient87_110,
  OriginalRow227TriangleData1177.coefficient87_111,
  OriginalRow227TriangleData1177.coefficient87_112,
  OriginalRow227TriangleData1177.coefficient87_113,
  OriginalRow227TriangleData1177.coefficient87_114,
  OriginalRow227TriangleData1177.coefficient87_115,
  OriginalRow227TriangleData1177.coefficient87_116,
  OriginalRow227TriangleData1177.coefficient87_117
]

theorem values1177_size : values1177.size = 32 := rfl

def block1177 : ℕ → Option IntervalDyadic := segment 86 values1177

theorem block1177_domain : ExactDomain block1177 86 118 := by
  simpa only [values1177_size] using segment_domain 86 values1177

theorem block1177_get (i : Fin 32) :
    block1177 (86 + i.val) = some (values1177[i.val]'(by rw [values1177_size]; exact i.isLt)) := by
  exact segment_get 86 values1177 ⟨i.val, by rw [values1177_size]; exact i.isLt⟩

def values1178 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1178.coefficient87_118,
  OriginalRow227TriangleData1178.coefficient87_119,
  OriginalRow227TriangleData1178.coefficient87_120,
  OriginalRow227TriangleData1178.coefficient87_121,
  OriginalRow227TriangleData1178.coefficient87_122,
  OriginalRow227TriangleData1178.coefficient87_123,
  OriginalRow227TriangleData1178.coefficient87_124,
  OriginalRow227TriangleData1178.coefficient87_125,
  OriginalRow227TriangleData1178.coefficient87_126,
  OriginalRow227TriangleData1178.coefficient87_127,
  OriginalRow227TriangleData1178.coefficient87_128,
  OriginalRow227TriangleData1178.coefficient87_129,
  OriginalRow227TriangleData1178.coefficient87_130,
  OriginalRow227TriangleData1178.coefficient87_131,
  OriginalRow227TriangleData1178.coefficient87_132,
  OriginalRow227TriangleData1178.coefficient87_133,
  OriginalRow227TriangleData1178.coefficient87_134,
  OriginalRow227TriangleData1178.coefficient87_135,
  OriginalRow227TriangleData1178.coefficient87_136,
  OriginalRow227TriangleData1178.coefficient87_137,
  OriginalRow227TriangleData1178.coefficient87_138,
  OriginalRow227TriangleData1178.coefficient87_139,
  OriginalRow227TriangleData1178.coefficient87_140,
  OriginalRow227TriangleData1178.coefficient87_141,
  OriginalRow227TriangleData1178.coefficient87_142,
  OriginalRow227TriangleData1178.coefficient87_143,
  OriginalRow227TriangleData1178.coefficient87_144,
  OriginalRow227TriangleData1178.coefficient87_145,
  OriginalRow227TriangleData1178.coefficient87_146,
  OriginalRow227TriangleData1178.coefficient87_147,
  OriginalRow227TriangleData1178.coefficient87_148,
  OriginalRow227TriangleData1178.coefficient87_149
]

theorem values1178_size : values1178.size = 32 := rfl

def block1178 : ℕ → Option IntervalDyadic := segment 118 values1178

theorem block1178_domain : ExactDomain block1178 118 150 := by
  simpa only [values1178_size] using segment_domain 118 values1178

theorem block1178_get (i : Fin 32) :
    block1178 (118 + i.val) = some (values1178[i.val]'(by rw [values1178_size]; exact i.isLt)) := by
  exact segment_get 118 values1178 ⟨i.val, by rw [values1178_size]; exact i.isLt⟩

def values1179 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1179.coefficient87_150,
  OriginalRow227TriangleData1179.coefficient87_151,
  OriginalRow227TriangleData1179.coefficient87_152,
  OriginalRow227TriangleData1179.coefficient87_153,
  OriginalRow227TriangleData1179.coefficient87_154,
  OriginalRow227TriangleData1179.coefficient87_155,
  OriginalRow227TriangleData1179.coefficient87_156,
  OriginalRow227TriangleData1179.coefficient87_157,
  OriginalRow227TriangleData1179.coefficient87_158,
  OriginalRow227TriangleData1179.coefficient87_159,
  OriginalRow227TriangleData1179.coefficient87_160,
  OriginalRow227TriangleData1179.coefficient87_161,
  OriginalRow227TriangleData1179.coefficient87_162,
  OriginalRow227TriangleData1179.coefficient87_163,
  OriginalRow227TriangleData1179.coefficient87_164,
  OriginalRow227TriangleData1179.coefficient87_165,
  OriginalRow227TriangleData1179.coefficient87_166,
  OriginalRow227TriangleData1179.coefficient87_167,
  OriginalRow227TriangleData1179.coefficient87_168,
  OriginalRow227TriangleData1179.coefficient87_169,
  OriginalRow227TriangleData1179.coefficient87_170,
  OriginalRow227TriangleData1179.coefficient87_171,
  OriginalRow227TriangleData1179.coefficient87_172,
  OriginalRow227TriangleData1179.coefficient87_173,
  OriginalRow227TriangleData1179.coefficient87_174,
  OriginalRow227TriangleData1179.coefficient87_175,
  OriginalRow227TriangleData1179.coefficient87_176,
  OriginalRow227TriangleData1179.coefficient87_177,
  OriginalRow227TriangleData1179.coefficient87_178,
  OriginalRow227TriangleData1179.coefficient87_179,
  OriginalRow227TriangleData1179.coefficient87_180,
  OriginalRow227TriangleData1179.coefficient87_181
]

theorem values1179_size : values1179.size = 32 := rfl

def block1179 : ℕ → Option IntervalDyadic := segment 150 values1179

theorem block1179_domain : ExactDomain block1179 150 182 := by
  simpa only [values1179_size] using segment_domain 150 values1179

theorem block1179_get (i : Fin 32) :
    block1179 (150 + i.val) = some (values1179[i.val]'(by rw [values1179_size]; exact i.isLt)) := by
  exact segment_get 150 values1179 ⟨i.val, by rw [values1179_size]; exact i.isLt⟩

def values1180 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1180.coefficient87_182,
  OriginalRow227TriangleData1180.coefficient87_183,
  OriginalRow227TriangleData1180.coefficient87_184,
  OriginalRow227TriangleData1180.coefficient87_185,
  OriginalRow227TriangleData1180.coefficient87_186,
  OriginalRow227TriangleData1180.coefficient87_187,
  OriginalRow227TriangleData1180.coefficient87_188,
  OriginalRow227TriangleData1180.coefficient87_189,
  OriginalRow227TriangleData1180.coefficient87_190,
  OriginalRow227TriangleData1180.coefficient87_191,
  OriginalRow227TriangleData1180.coefficient87_192,
  OriginalRow227TriangleData1180.coefficient87_193,
  OriginalRow227TriangleData1180.coefficient87_194,
  OriginalRow227TriangleData1180.coefficient87_195,
  OriginalRow227TriangleData1180.coefficient87_196,
  OriginalRow227TriangleData1180.coefficient87_197,
  OriginalRow227TriangleData1180.coefficient87_198,
  OriginalRow227TriangleData1180.coefficient87_199,
  OriginalRow227TriangleData1180.coefficient87_200,
  OriginalRow227TriangleData1180.coefficient87_201,
  OriginalRow227TriangleData1180.coefficient87_202,
  OriginalRow227TriangleData1180.coefficient87_203,
  OriginalRow227TriangleData1180.coefficient87_204,
  OriginalRow227TriangleData1180.coefficient87_205,
  OriginalRow227TriangleData1180.coefficient87_206,
  OriginalRow227TriangleData1180.coefficient87_207,
  OriginalRow227TriangleData1180.coefficient87_208,
  OriginalRow227TriangleData1180.coefficient87_209,
  OriginalRow227TriangleData1180.coefficient87_210,
  OriginalRow227TriangleData1180.coefficient87_211,
  OriginalRow227TriangleData1180.coefficient87_212,
  OriginalRow227TriangleData1180.coefficient87_213
]

theorem values1180_size : values1180.size = 32 := rfl

def block1180 : ℕ → Option IntervalDyadic := segment 182 values1180

theorem block1180_domain : ExactDomain block1180 182 214 := by
  simpa only [values1180_size] using segment_domain 182 values1180

theorem block1180_get (i : Fin 32) :
    block1180 (182 + i.val) = some (values1180[i.val]'(by rw [values1180_size]; exact i.isLt)) := by
  exact segment_get 182 values1180 ⟨i.val, by rw [values1180_size]; exact i.isLt⟩

def values1181 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1181.coefficient87_214,
  OriginalRow227TriangleData1181.coefficient87_215,
  OriginalRow227TriangleData1181.coefficient87_216,
  OriginalRow227TriangleData1181.coefficient87_217,
  OriginalRow227TriangleData1181.coefficient87_218,
  OriginalRow227TriangleData1181.coefficient87_219,
  OriginalRow227TriangleData1181.coefficient87_220,
  OriginalRow227TriangleData1181.coefficient87_221,
  OriginalRow227TriangleData1181.coefficient87_222,
  OriginalRow227TriangleData1181.coefficient87_223,
  OriginalRow227TriangleData1181.coefficient87_224,
  OriginalRow227TriangleData1181.coefficient87_225,
  OriginalRow227TriangleData1181.coefficient87_226,
  OriginalRow227TriangleData1181.coefficient87_227,
  OriginalRow227TriangleData1181.coefficient87_228,
  OriginalRow227TriangleData1181.coefficient87_229,
  OriginalRow227TriangleData1181.coefficient87_230,
  OriginalRow227TriangleData1181.coefficient87_231,
  OriginalRow227TriangleData1181.coefficient87_232,
  OriginalRow227TriangleData1181.coefficient87_233,
  OriginalRow227TriangleData1181.coefficient87_234,
  OriginalRow227TriangleData1181.coefficient87_235,
  OriginalRow227TriangleData1181.coefficient87_236,
  OriginalRow227TriangleData1181.coefficient87_237,
  OriginalRow227TriangleData1181.coefficient87_238,
  OriginalRow227TriangleData1181.coefficient87_239,
  OriginalRow227TriangleData1181.coefficient87_240,
  OriginalRow227TriangleData1181.coefficient87_241,
  OriginalRow227TriangleData1181.coefficient87_242,
  OriginalRow227TriangleData1181.coefficient87_243,
  OriginalRow227TriangleData1181.coefficient87_244,
  OriginalRow227TriangleData1181.coefficient87_245
]

theorem values1181_size : values1181.size = 32 := rfl

def block1181 : ℕ → Option IntervalDyadic := segment 214 values1181

theorem block1181_domain : ExactDomain block1181 214 246 := by
  simpa only [values1181_size] using segment_domain 214 values1181

theorem block1181_get (i : Fin 32) :
    block1181 (214 + i.val) = some (values1181[i.val]'(by rw [values1181_size]; exact i.isLt)) := by
  exact segment_get 214 values1181 ⟨i.val, by rw [values1181_size]; exact i.isLt⟩

def values1182 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1182.coefficient87_246,
  OriginalRow227TriangleData1182.coefficient87_247,
  OriginalRow227TriangleData1182.coefficient87_248,
  OriginalRow227TriangleData1182.coefficient87_249,
  OriginalRow227TriangleData1182.coefficient87_250,
  OriginalRow227TriangleData1182.coefficient87_251,
  OriginalRow227TriangleData1182.coefficient87_252,
  OriginalRow227TriangleData1182.coefficient87_253,
  OriginalRow227TriangleData1182.coefficient87_254,
  OriginalRow227TriangleData1182.coefficient87_255,
  OriginalRow227TriangleData1182.coefficient87_256,
  OriginalRow227TriangleData1182.coefficient87_257,
  OriginalRow227TriangleData1182.coefficient87_258,
  OriginalRow227TriangleData1182.coefficient87_259,
  OriginalRow227TriangleData1182.coefficient87_260,
  OriginalRow227TriangleData1182.coefficient87_261,
  OriginalRow227TriangleData1182.coefficient87_262,
  OriginalRow227TriangleData1182.coefficient87_263,
  OriginalRow227TriangleData1182.coefficient87_264,
  OriginalRow227TriangleData1182.coefficient87_265,
  OriginalRow227TriangleData1182.coefficient87_266,
  OriginalRow227TriangleData1182.coefficient87_267,
  OriginalRow227TriangleData1182.coefficient87_268,
  OriginalRow227TriangleData1182.coefficient87_269,
  OriginalRow227TriangleData1182.coefficient87_270,
  OriginalRow227TriangleData1182.coefficient87_271,
  OriginalRow227TriangleData1182.coefficient87_272,
  OriginalRow227TriangleData1182.coefficient87_273,
  OriginalRow227TriangleData1182.coefficient87_274,
  OriginalRow227TriangleData1182.coefficient87_275,
  OriginalRow227TriangleData1182.coefficient87_276,
  OriginalRow227TriangleData1182.coefficient87_277
]

theorem values1182_size : values1182.size = 32 := rfl

def block1182 : ℕ → Option IntervalDyadic := segment 246 values1182

theorem block1182_domain : ExactDomain block1182 246 278 := by
  simpa only [values1182_size] using segment_domain 246 values1182

theorem block1182_get (i : Fin 32) :
    block1182 (246 + i.val) = some (values1182[i.val]'(by rw [values1182_size]; exact i.isLt)) := by
  exact segment_get 246 values1182 ⟨i.val, by rw [values1182_size]; exact i.isLt⟩

def values1183 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1183.coefficient87_278,
  OriginalRow227TriangleData1183.coefficient87_279,
  OriginalRow227TriangleData1183.coefficient87_280,
  OriginalRow227TriangleData1183.coefficient87_281,
  OriginalRow227TriangleData1183.coefficient87_282,
  OriginalRow227TriangleData1183.coefficient87_283,
  OriginalRow227TriangleData1183.coefficient87_284,
  OriginalRow227TriangleData1183.coefficient87_285,
  OriginalRow227TriangleData1183.coefficient87_286,
  OriginalRow227TriangleData1183.coefficient87_287,
  OriginalRow227TriangleData1183.coefficient87_288,
  OriginalRow227TriangleData1183.coefficient87_289,
  OriginalRow227TriangleData1183.coefficient87_290,
  OriginalRow227TriangleData1183.coefficient87_291,
  OriginalRow227TriangleData1183.coefficient87_292,
  OriginalRow227TriangleData1183.coefficient87_293,
  OriginalRow227TriangleData1183.coefficient87_294,
  OriginalRow227TriangleData1183.coefficient87_295,
  OriginalRow227TriangleData1183.coefficient87_296,
  OriginalRow227TriangleData1183.coefficient87_297,
  OriginalRow227TriangleData1183.coefficient87_298,
  OriginalRow227TriangleData1183.coefficient87_299,
  OriginalRow227TriangleData1183.coefficient87_300,
  OriginalRow227TriangleData1183.coefficient87_301,
  OriginalRow227TriangleData1183.coefficient87_302,
  OriginalRow227TriangleData1183.coefficient87_303,
  OriginalRow227TriangleData1183.coefficient87_304,
  OriginalRow227TriangleData1183.coefficient87_305,
  OriginalRow227TriangleData1183.coefficient87_306,
  OriginalRow227TriangleData1183.coefficient87_307,
  OriginalRow227TriangleData1183.coefficient87_308,
  OriginalRow227TriangleData1183.coefficient87_309
]

theorem values1183_size : values1183.size = 32 := rfl

def block1183 : ℕ → Option IntervalDyadic := segment 278 values1183

theorem block1183_domain : ExactDomain block1183 278 310 := by
  simpa only [values1183_size] using segment_domain 278 values1183

theorem block1183_get (i : Fin 32) :
    block1183 (278 + i.val) = some (values1183[i.val]'(by rw [values1183_size]; exact i.isLt)) := by
  exact segment_get 278 values1183 ⟨i.val, by rw [values1183_size]; exact i.isLt⟩

def values1184 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1184.coefficient87_310,
  OriginalRow227TriangleData1184.coefficient87_311,
  OriginalRow227TriangleData1184.coefficient87_312,
  OriginalRow227TriangleData1184.coefficient87_313,
  OriginalRow227TriangleData1184.coefficient87_314,
  OriginalRow227TriangleData1184.coefficient87_315,
  OriginalRow227TriangleData1184.coefficient87_316,
  OriginalRow227TriangleData1184.coefficient87_317,
  OriginalRow227TriangleData1184.coefficient87_318,
  OriginalRow227TriangleData1184.coefficient87_319,
  OriginalRow227TriangleData1184.coefficient87_320,
  OriginalRow227TriangleData1184.coefficient87_321,
  OriginalRow227TriangleData1184.coefficient87_322,
  OriginalRow227TriangleData1184.coefficient87_323,
  OriginalRow227TriangleData1184.coefficient87_324,
  OriginalRow227TriangleData1184.coefficient87_325,
  OriginalRow227TriangleData1184.coefficient87_326,
  OriginalRow227TriangleData1184.coefficient87_327,
  OriginalRow227TriangleData1184.coefficient87_328,
  OriginalRow227TriangleData1184.coefficient87_329,
  OriginalRow227TriangleData1184.coefficient87_330,
  OriginalRow227TriangleData1184.coefficient87_331,
  OriginalRow227TriangleData1184.coefficient87_332,
  OriginalRow227TriangleData1184.coefficient87_333,
  OriginalRow227TriangleData1184.coefficient87_334,
  OriginalRow227TriangleData1184.coefficient87_335,
  OriginalRow227TriangleData1184.coefficient87_336,
  OriginalRow227TriangleData1184.coefficient87_337,
  OriginalRow227TriangleData1184.coefficient87_338,
  OriginalRow227TriangleData1184.coefficient87_339,
  OriginalRow227TriangleData1184.coefficient87_340,
  OriginalRow227TriangleData1184.coefficient87_341
]

theorem values1184_size : values1184.size = 32 := rfl

def block1184 : ℕ → Option IntervalDyadic := segment 310 values1184

theorem block1184_domain : ExactDomain block1184 310 342 := by
  simpa only [values1184_size] using segment_domain 310 values1184

theorem block1184_get (i : Fin 32) :
    block1184 (310 + i.val) = some (values1184[i.val]'(by rw [values1184_size]; exact i.isLt)) := by
  exact segment_get 310 values1184 ⟨i.val, by rw [values1184_size]; exact i.isLt⟩

def values1185 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1185.coefficient87_342,
  OriginalRow227TriangleData1185.coefficient87_343,
  OriginalRow227TriangleData1185.coefficient87_344,
  OriginalRow227TriangleData1185.coefficient87_345,
  OriginalRow227TriangleData1185.coefficient87_346,
  OriginalRow227TriangleData1185.coefficient87_347,
  OriginalRow227TriangleData1185.coefficient87_348,
  OriginalRow227TriangleData1185.coefficient87_349,
  OriginalRow227TriangleData1185.coefficient87_350,
  OriginalRow227TriangleData1185.coefficient87_351,
  OriginalRow227TriangleData1185.coefficient87_352,
  OriginalRow227TriangleData1185.coefficient87_353,
  OriginalRow227TriangleData1185.coefficient87_354,
  OriginalRow227TriangleData1185.coefficient87_355,
  OriginalRow227TriangleData1185.coefficient87_356,
  OriginalRow227TriangleData1185.coefficient87_357,
  OriginalRow227TriangleData1185.coefficient87_358,
  OriginalRow227TriangleData1185.coefficient87_359,
  OriginalRow227TriangleData1185.coefficient87_360,
  OriginalRow227TriangleData1185.coefficient87_361,
  OriginalRow227TriangleData1185.coefficient87_362,
  OriginalRow227TriangleData1185.coefficient87_363,
  OriginalRow227TriangleData1185.coefficient87_364,
  OriginalRow227TriangleData1185.coefficient87_365,
  OriginalRow227TriangleData1185.coefficient87_366,
  OriginalRow227TriangleData1185.coefficient87_367,
  OriginalRow227TriangleData1185.coefficient87_368,
  OriginalRow227TriangleData1185.coefficient87_369,
  OriginalRow227TriangleData1185.coefficient87_370,
  OriginalRow227TriangleData1185.coefficient87_371,
  OriginalRow227TriangleData1185.coefficient87_372,
  OriginalRow227TriangleData1185.coefficient87_373
]

theorem values1185_size : values1185.size = 32 := rfl

def block1185 : ℕ → Option IntervalDyadic := segment 342 values1185

theorem block1185_domain : ExactDomain block1185 342 374 := by
  simpa only [values1185_size] using segment_domain 342 values1185

theorem block1185_get (i : Fin 32) :
    block1185 (342 + i.val) = some (values1185[i.val]'(by rw [values1185_size]; exact i.isLt)) := by
  exact segment_get 342 values1185 ⟨i.val, by rw [values1185_size]; exact i.isLt⟩

def values1186 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1186.coefficient87_374,
  OriginalRow227TriangleData1186.coefficient87_375,
  OriginalRow227TriangleData1186.coefficient87_376,
  OriginalRow227TriangleData1186.coefficient87_377,
  OriginalRow227TriangleData1186.coefficient87_378,
  OriginalRow227TriangleData1186.coefficient87_379,
  OriginalRow227TriangleData1186.coefficient87_380,
  OriginalRow227TriangleData1186.coefficient87_381,
  OriginalRow227TriangleData1186.coefficient87_382,
  OriginalRow227TriangleData1186.coefficient87_383,
  OriginalRow227TriangleData1186.coefficient87_384,
  OriginalRow227TriangleData1186.coefficient87_385,
  OriginalRow227TriangleData1186.coefficient87_386,
  OriginalRow227TriangleData1186.coefficient87_387,
  OriginalRow227TriangleData1186.coefficient87_388,
  OriginalRow227TriangleData1186.coefficient87_389,
  OriginalRow227TriangleData1186.coefficient87_390,
  OriginalRow227TriangleData1186.coefficient87_391,
  OriginalRow227TriangleData1186.coefficient87_392,
  OriginalRow227TriangleData1186.coefficient87_393,
  OriginalRow227TriangleData1186.coefficient87_394,
  OriginalRow227TriangleData1186.coefficient87_395,
  OriginalRow227TriangleData1186.coefficient87_396,
  OriginalRow227TriangleData1186.coefficient87_397,
  OriginalRow227TriangleData1186.coefficient87_398,
  OriginalRow227TriangleData1186.coefficient87_399,
  OriginalRow227TriangleData1186.coefficient87_400,
  OriginalRow227TriangleData1186.coefficient87_401,
  OriginalRow227TriangleData1186.coefficient87_402,
  OriginalRow227TriangleData1186.coefficient87_403,
  OriginalRow227TriangleData1186.coefficient87_404,
  OriginalRow227TriangleData1186.coefficient87_405
]

theorem values1186_size : values1186.size = 32 := rfl

def block1186 : ℕ → Option IntervalDyadic := segment 374 values1186

theorem block1186_domain : ExactDomain block1186 374 406 := by
  simpa only [values1186_size] using segment_domain 374 values1186

theorem block1186_get (i : Fin 32) :
    block1186 (374 + i.val) = some (values1186[i.val]'(by rw [values1186_size]; exact i.isLt)) := by
  exact segment_get 374 values1186 ⟨i.val, by rw [values1186_size]; exact i.isLt⟩

def values1187 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1187.coefficient87_406,
  OriginalRow227TriangleData1187.coefficient87_407,
  OriginalRow227TriangleData1187.coefficient87_408,
  OriginalRow227TriangleData1187.coefficient87_409,
  OriginalRow227TriangleData1187.coefficient87_410,
  OriginalRow227TriangleData1187.coefficient87_411,
  OriginalRow227TriangleData1187.coefficient87_412,
  OriginalRow227TriangleData1187.coefficient87_413,
  OriginalRow227TriangleData1187.coefficient87_414
]

theorem values1187_size : values1187.size = 9 := rfl

def block1187 : ℕ → Option IntervalDyadic := segment 406 values1187

theorem block1187_domain : ExactDomain block1187 406 415 := by
  simpa only [values1187_size] using segment_domain 406 values1187

theorem block1187_get (i : Fin 9) :
    block1187 (406 + i.val) = some (values1187[i.val]'(by rw [values1187_size]; exact i.isLt)) := by
  exact segment_get 406 values1187 ⟨i.val, by rw [values1187_size]; exact i.isLt⟩

def node0086_0150 : ℕ → Option IntervalDyadic := split 118 block1177 block1178

theorem node0086_0150_domain : ExactDomain node0086_0150 86 150 := by
  exact split_domain (by decide) (by decide) block1177_domain block1178_domain

def node0182_0246 : ℕ → Option IntervalDyadic := split 214 block1180 block1181

theorem node0182_0246_domain : ExactDomain node0182_0246 182 246 := by
  exact split_domain (by decide) (by decide) block1180_domain block1181_domain

def node0150_0246 : ℕ → Option IntervalDyadic := split 182 block1179 node0182_0246

theorem node0150_0246_domain : ExactDomain node0150_0246 150 246 := by
  exact split_domain (by decide) (by decide) block1179_domain node0182_0246_domain

def node0086_0246 : ℕ → Option IntervalDyadic := split 150 node0086_0150 node0150_0246

theorem node0086_0246_domain : ExactDomain node0086_0246 86 246 := by
  exact split_domain (by decide) (by decide) node0086_0150_domain node0150_0246_domain

def node0278_0342 : ℕ → Option IntervalDyadic := split 310 block1183 block1184

theorem node0278_0342_domain : ExactDomain node0278_0342 278 342 := by
  exact split_domain (by decide) (by decide) block1183_domain block1184_domain

def node0246_0342 : ℕ → Option IntervalDyadic := split 278 block1182 node0278_0342

theorem node0246_0342_domain : ExactDomain node0246_0342 246 342 := by
  exact split_domain (by decide) (by decide) block1182_domain node0278_0342_domain

def node0374_0415 : ℕ → Option IntervalDyadic := split 406 block1186 block1187

theorem node0374_0415_domain : ExactDomain node0374_0415 374 415 := by
  exact split_domain (by decide) (by decide) block1186_domain block1187_domain

def node0342_0415 : ℕ → Option IntervalDyadic := split 374 block1185 node0374_0415

theorem node0342_0415_domain : ExactDomain node0342_0415 342 415 := by
  exact split_domain (by decide) (by decide) block1185_domain node0374_0415_domain

def node0246_0415 : ℕ → Option IntervalDyadic := split 342 node0246_0342 node0342_0415

theorem node0246_0415_domain : ExactDomain node0246_0415 246 415 := by
  exact split_domain (by decide) (by decide) node0246_0342_domain node0342_0415_domain

def node0086_0415 : ℕ → Option IntervalDyadic := split 246 node0086_0246 node0246_0415

theorem node0086_0415_domain : ExactDomain node0086_0415 86 415 := by
  exact split_domain (by decide) (by decide) node0086_0246_domain node0246_0415_domain

def lookup : ℕ → Option IntervalDyadic := node0086_0415

theorem lookup_domain : ExactDomain lookup 86 415 :=
  node0086_0415_domain

theorem block1177_lookup (i : Fin 32) :
    lookup (86 + i.val) = some (values1177[i.val]'(by rw [values1177_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (86 + i.val) = _
  rw [node0086_0415, split_left 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0086_0246, split_left 150 node0086_0150 node0150_0246 (by omega)]
  rw [node0086_0150, split_left 118 block1177 block1178 (by omega)]
  exact block1177_get i

theorem block1178_lookup (i : Fin 32) :
    lookup (118 + i.val) = some (values1178[i.val]'(by rw [values1178_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (118 + i.val) = _
  rw [node0086_0415, split_left 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0086_0246, split_left 150 node0086_0150 node0150_0246 (by omega)]
  rw [node0086_0150, split_right 118 block1177 block1178 (by omega)]
  exact block1178_get i

theorem block1179_lookup (i : Fin 32) :
    lookup (150 + i.val) = some (values1179[i.val]'(by rw [values1179_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (150 + i.val) = _
  rw [node0086_0415, split_left 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0086_0246, split_right 150 node0086_0150 node0150_0246 (by omega)]
  rw [node0150_0246, split_left 182 block1179 node0182_0246 (by omega)]
  exact block1179_get i

theorem block1180_lookup (i : Fin 32) :
    lookup (182 + i.val) = some (values1180[i.val]'(by rw [values1180_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (182 + i.val) = _
  rw [node0086_0415, split_left 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0086_0246, split_right 150 node0086_0150 node0150_0246 (by omega)]
  rw [node0150_0246, split_right 182 block1179 node0182_0246 (by omega)]
  rw [node0182_0246, split_left 214 block1180 block1181 (by omega)]
  exact block1180_get i

theorem block1181_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values1181[i.val]'(by rw [values1181_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (214 + i.val) = _
  rw [node0086_0415, split_left 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0086_0246, split_right 150 node0086_0150 node0150_0246 (by omega)]
  rw [node0150_0246, split_right 182 block1179 node0182_0246 (by omega)]
  rw [node0182_0246, split_right 214 block1180 block1181 (by omega)]
  exact block1181_get i

theorem block1182_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values1182[i.val]'(by rw [values1182_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (246 + i.val) = _
  rw [node0086_0415, split_right 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0246_0415, split_left 342 node0246_0342 node0342_0415 (by omega)]
  rw [node0246_0342, split_left 278 block1182 node0278_0342 (by omega)]
  exact block1182_get i

theorem block1183_lookup (i : Fin 32) :
    lookup (278 + i.val) = some (values1183[i.val]'(by rw [values1183_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (278 + i.val) = _
  rw [node0086_0415, split_right 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0246_0415, split_left 342 node0246_0342 node0342_0415 (by omega)]
  rw [node0246_0342, split_right 278 block1182 node0278_0342 (by omega)]
  rw [node0278_0342, split_left 310 block1183 block1184 (by omega)]
  exact block1183_get i

theorem block1184_lookup (i : Fin 32) :
    lookup (310 + i.val) = some (values1184[i.val]'(by rw [values1184_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (310 + i.val) = _
  rw [node0086_0415, split_right 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0246_0415, split_left 342 node0246_0342 node0342_0415 (by omega)]
  rw [node0246_0342, split_right 278 block1182 node0278_0342 (by omega)]
  rw [node0278_0342, split_right 310 block1183 block1184 (by omega)]
  exact block1184_get i

theorem block1185_lookup (i : Fin 32) :
    lookup (342 + i.val) = some (values1185[i.val]'(by rw [values1185_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (342 + i.val) = _
  rw [node0086_0415, split_right 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0246_0415, split_right 342 node0246_0342 node0342_0415 (by omega)]
  rw [node0342_0415, split_left 374 block1185 node0374_0415 (by omega)]
  exact block1185_get i

theorem block1186_lookup (i : Fin 32) :
    lookup (374 + i.val) = some (values1186[i.val]'(by rw [values1186_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (374 + i.val) = _
  rw [node0086_0415, split_right 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0246_0415, split_right 342 node0246_0342 node0342_0415 (by omega)]
  rw [node0342_0415, split_right 374 block1185 node0374_0415 (by omega)]
  rw [node0374_0415, split_left 406 block1186 block1187 (by omega)]
  exact block1186_get i

theorem block1187_lookup (i : Fin 9) :
    lookup (406 + i.val) = some (values1187[i.val]'(by rw [values1187_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0086_0415 (406 + i.val) = _
  rw [node0086_0415, split_right 246 node0086_0246 node0246_0415 (by omega)]
  rw [node0246_0415, split_right 342 node0246_0342 node0342_0415 (by omega)]
  rw [node0342_0415, split_right 374 block1185 node0374_0415 (by omega)]
  rw [node0374_0415, split_right 406 block1186 block1187 (by omega)]
  exact block1187_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1177_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1177_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1178_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1178_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1179_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1179_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1180_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1180_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1181_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1181_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1182_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1182_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1183_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1183_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1184_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1184_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1185_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1185_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1186_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1186_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1187_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1187_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1177_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1178_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1179_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1180_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1181_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1182_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1183_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1184_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1185_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1186_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow087.block1187_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow087
