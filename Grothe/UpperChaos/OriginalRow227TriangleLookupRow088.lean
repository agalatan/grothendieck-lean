import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1188
import Grothe.UpperChaos.OriginalRow227TriangleData1189
import Grothe.UpperChaos.OriginalRow227TriangleData1190
import Grothe.UpperChaos.OriginalRow227TriangleData1191
import Grothe.UpperChaos.OriginalRow227TriangleData1192
import Grothe.UpperChaos.OriginalRow227TriangleData1193
import Grothe.UpperChaos.OriginalRow227TriangleData1194
import Grothe.UpperChaos.OriginalRow227TriangleData1195
import Grothe.UpperChaos.OriginalRow227TriangleData1196
import Grothe.UpperChaos.OriginalRow227TriangleData1197
import Grothe.UpperChaos.OriginalRow227TriangleData1198

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow088

open ConditionalTableLookup

def values1188 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1188.coefficient88_87,
  OriginalRow227TriangleData1188.coefficient88_88,
  OriginalRow227TriangleData1188.coefficient88_89,
  OriginalRow227TriangleData1188.coefficient88_90,
  OriginalRow227TriangleData1188.coefficient88_91,
  OriginalRow227TriangleData1188.coefficient88_92,
  OriginalRow227TriangleData1188.coefficient88_93,
  OriginalRow227TriangleData1188.coefficient88_94,
  OriginalRow227TriangleData1188.coefficient88_95,
  OriginalRow227TriangleData1188.coefficient88_96,
  OriginalRow227TriangleData1188.coefficient88_97,
  OriginalRow227TriangleData1188.coefficient88_98,
  OriginalRow227TriangleData1188.coefficient88_99,
  OriginalRow227TriangleData1188.coefficient88_100,
  OriginalRow227TriangleData1188.coefficient88_101,
  OriginalRow227TriangleData1188.coefficient88_102,
  OriginalRow227TriangleData1188.coefficient88_103,
  OriginalRow227TriangleData1188.coefficient88_104,
  OriginalRow227TriangleData1188.coefficient88_105,
  OriginalRow227TriangleData1188.coefficient88_106,
  OriginalRow227TriangleData1188.coefficient88_107,
  OriginalRow227TriangleData1188.coefficient88_108,
  OriginalRow227TriangleData1188.coefficient88_109,
  OriginalRow227TriangleData1188.coefficient88_110,
  OriginalRow227TriangleData1188.coefficient88_111,
  OriginalRow227TriangleData1188.coefficient88_112,
  OriginalRow227TriangleData1188.coefficient88_113,
  OriginalRow227TriangleData1188.coefficient88_114,
  OriginalRow227TriangleData1188.coefficient88_115,
  OriginalRow227TriangleData1188.coefficient88_116,
  OriginalRow227TriangleData1188.coefficient88_117,
  OriginalRow227TriangleData1188.coefficient88_118
]

theorem values1188_size : values1188.size = 32 := rfl

def block1188 : ℕ → Option IntervalDyadic := segment 87 values1188

theorem block1188_domain : ExactDomain block1188 87 119 := by
  simpa only [values1188_size] using segment_domain 87 values1188

theorem block1188_get (i : Fin 32) :
    block1188 (87 + i.val) = some (values1188[i.val]'(by rw [values1188_size]; exact i.isLt)) := by
  exact segment_get 87 values1188 ⟨i.val, by rw [values1188_size]; exact i.isLt⟩

def values1189 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1189.coefficient88_119,
  OriginalRow227TriangleData1189.coefficient88_120,
  OriginalRow227TriangleData1189.coefficient88_121,
  OriginalRow227TriangleData1189.coefficient88_122,
  OriginalRow227TriangleData1189.coefficient88_123,
  OriginalRow227TriangleData1189.coefficient88_124,
  OriginalRow227TriangleData1189.coefficient88_125,
  OriginalRow227TriangleData1189.coefficient88_126,
  OriginalRow227TriangleData1189.coefficient88_127,
  OriginalRow227TriangleData1189.coefficient88_128,
  OriginalRow227TriangleData1189.coefficient88_129,
  OriginalRow227TriangleData1189.coefficient88_130,
  OriginalRow227TriangleData1189.coefficient88_131,
  OriginalRow227TriangleData1189.coefficient88_132,
  OriginalRow227TriangleData1189.coefficient88_133,
  OriginalRow227TriangleData1189.coefficient88_134,
  OriginalRow227TriangleData1189.coefficient88_135,
  OriginalRow227TriangleData1189.coefficient88_136,
  OriginalRow227TriangleData1189.coefficient88_137,
  OriginalRow227TriangleData1189.coefficient88_138,
  OriginalRow227TriangleData1189.coefficient88_139,
  OriginalRow227TriangleData1189.coefficient88_140,
  OriginalRow227TriangleData1189.coefficient88_141,
  OriginalRow227TriangleData1189.coefficient88_142,
  OriginalRow227TriangleData1189.coefficient88_143,
  OriginalRow227TriangleData1189.coefficient88_144,
  OriginalRow227TriangleData1189.coefficient88_145,
  OriginalRow227TriangleData1189.coefficient88_146,
  OriginalRow227TriangleData1189.coefficient88_147,
  OriginalRow227TriangleData1189.coefficient88_148,
  OriginalRow227TriangleData1189.coefficient88_149,
  OriginalRow227TriangleData1189.coefficient88_150
]

theorem values1189_size : values1189.size = 32 := rfl

def block1189 : ℕ → Option IntervalDyadic := segment 119 values1189

theorem block1189_domain : ExactDomain block1189 119 151 := by
  simpa only [values1189_size] using segment_domain 119 values1189

theorem block1189_get (i : Fin 32) :
    block1189 (119 + i.val) = some (values1189[i.val]'(by rw [values1189_size]; exact i.isLt)) := by
  exact segment_get 119 values1189 ⟨i.val, by rw [values1189_size]; exact i.isLt⟩

def values1190 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1190.coefficient88_151,
  OriginalRow227TriangleData1190.coefficient88_152,
  OriginalRow227TriangleData1190.coefficient88_153,
  OriginalRow227TriangleData1190.coefficient88_154,
  OriginalRow227TriangleData1190.coefficient88_155,
  OriginalRow227TriangleData1190.coefficient88_156,
  OriginalRow227TriangleData1190.coefficient88_157,
  OriginalRow227TriangleData1190.coefficient88_158,
  OriginalRow227TriangleData1190.coefficient88_159,
  OriginalRow227TriangleData1190.coefficient88_160,
  OriginalRow227TriangleData1190.coefficient88_161,
  OriginalRow227TriangleData1190.coefficient88_162,
  OriginalRow227TriangleData1190.coefficient88_163,
  OriginalRow227TriangleData1190.coefficient88_164,
  OriginalRow227TriangleData1190.coefficient88_165,
  OriginalRow227TriangleData1190.coefficient88_166,
  OriginalRow227TriangleData1190.coefficient88_167,
  OriginalRow227TriangleData1190.coefficient88_168,
  OriginalRow227TriangleData1190.coefficient88_169,
  OriginalRow227TriangleData1190.coefficient88_170,
  OriginalRow227TriangleData1190.coefficient88_171,
  OriginalRow227TriangleData1190.coefficient88_172,
  OriginalRow227TriangleData1190.coefficient88_173,
  OriginalRow227TriangleData1190.coefficient88_174,
  OriginalRow227TriangleData1190.coefficient88_175,
  OriginalRow227TriangleData1190.coefficient88_176,
  OriginalRow227TriangleData1190.coefficient88_177,
  OriginalRow227TriangleData1190.coefficient88_178,
  OriginalRow227TriangleData1190.coefficient88_179,
  OriginalRow227TriangleData1190.coefficient88_180,
  OriginalRow227TriangleData1190.coefficient88_181,
  OriginalRow227TriangleData1190.coefficient88_182
]

theorem values1190_size : values1190.size = 32 := rfl

def block1190 : ℕ → Option IntervalDyadic := segment 151 values1190

theorem block1190_domain : ExactDomain block1190 151 183 := by
  simpa only [values1190_size] using segment_domain 151 values1190

theorem block1190_get (i : Fin 32) :
    block1190 (151 + i.val) = some (values1190[i.val]'(by rw [values1190_size]; exact i.isLt)) := by
  exact segment_get 151 values1190 ⟨i.val, by rw [values1190_size]; exact i.isLt⟩

def values1191 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1191.coefficient88_183,
  OriginalRow227TriangleData1191.coefficient88_184,
  OriginalRow227TriangleData1191.coefficient88_185,
  OriginalRow227TriangleData1191.coefficient88_186,
  OriginalRow227TriangleData1191.coefficient88_187,
  OriginalRow227TriangleData1191.coefficient88_188,
  OriginalRow227TriangleData1191.coefficient88_189,
  OriginalRow227TriangleData1191.coefficient88_190,
  OriginalRow227TriangleData1191.coefficient88_191,
  OriginalRow227TriangleData1191.coefficient88_192,
  OriginalRow227TriangleData1191.coefficient88_193,
  OriginalRow227TriangleData1191.coefficient88_194,
  OriginalRow227TriangleData1191.coefficient88_195,
  OriginalRow227TriangleData1191.coefficient88_196,
  OriginalRow227TriangleData1191.coefficient88_197,
  OriginalRow227TriangleData1191.coefficient88_198,
  OriginalRow227TriangleData1191.coefficient88_199,
  OriginalRow227TriangleData1191.coefficient88_200,
  OriginalRow227TriangleData1191.coefficient88_201,
  OriginalRow227TriangleData1191.coefficient88_202,
  OriginalRow227TriangleData1191.coefficient88_203,
  OriginalRow227TriangleData1191.coefficient88_204,
  OriginalRow227TriangleData1191.coefficient88_205,
  OriginalRow227TriangleData1191.coefficient88_206,
  OriginalRow227TriangleData1191.coefficient88_207,
  OriginalRow227TriangleData1191.coefficient88_208,
  OriginalRow227TriangleData1191.coefficient88_209,
  OriginalRow227TriangleData1191.coefficient88_210,
  OriginalRow227TriangleData1191.coefficient88_211,
  OriginalRow227TriangleData1191.coefficient88_212,
  OriginalRow227TriangleData1191.coefficient88_213,
  OriginalRow227TriangleData1191.coefficient88_214
]

theorem values1191_size : values1191.size = 32 := rfl

def block1191 : ℕ → Option IntervalDyadic := segment 183 values1191

theorem block1191_domain : ExactDomain block1191 183 215 := by
  simpa only [values1191_size] using segment_domain 183 values1191

theorem block1191_get (i : Fin 32) :
    block1191 (183 + i.val) = some (values1191[i.val]'(by rw [values1191_size]; exact i.isLt)) := by
  exact segment_get 183 values1191 ⟨i.val, by rw [values1191_size]; exact i.isLt⟩

def values1192 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1192.coefficient88_215,
  OriginalRow227TriangleData1192.coefficient88_216,
  OriginalRow227TriangleData1192.coefficient88_217,
  OriginalRow227TriangleData1192.coefficient88_218,
  OriginalRow227TriangleData1192.coefficient88_219,
  OriginalRow227TriangleData1192.coefficient88_220,
  OriginalRow227TriangleData1192.coefficient88_221,
  OriginalRow227TriangleData1192.coefficient88_222,
  OriginalRow227TriangleData1192.coefficient88_223,
  OriginalRow227TriangleData1192.coefficient88_224,
  OriginalRow227TriangleData1192.coefficient88_225,
  OriginalRow227TriangleData1192.coefficient88_226,
  OriginalRow227TriangleData1192.coefficient88_227,
  OriginalRow227TriangleData1192.coefficient88_228,
  OriginalRow227TriangleData1192.coefficient88_229,
  OriginalRow227TriangleData1192.coefficient88_230,
  OriginalRow227TriangleData1192.coefficient88_231,
  OriginalRow227TriangleData1192.coefficient88_232,
  OriginalRow227TriangleData1192.coefficient88_233,
  OriginalRow227TriangleData1192.coefficient88_234,
  OriginalRow227TriangleData1192.coefficient88_235,
  OriginalRow227TriangleData1192.coefficient88_236,
  OriginalRow227TriangleData1192.coefficient88_237,
  OriginalRow227TriangleData1192.coefficient88_238,
  OriginalRow227TriangleData1192.coefficient88_239,
  OriginalRow227TriangleData1192.coefficient88_240,
  OriginalRow227TriangleData1192.coefficient88_241,
  OriginalRow227TriangleData1192.coefficient88_242,
  OriginalRow227TriangleData1192.coefficient88_243,
  OriginalRow227TriangleData1192.coefficient88_244,
  OriginalRow227TriangleData1192.coefficient88_245,
  OriginalRow227TriangleData1192.coefficient88_246
]

theorem values1192_size : values1192.size = 32 := rfl

def block1192 : ℕ → Option IntervalDyadic := segment 215 values1192

theorem block1192_domain : ExactDomain block1192 215 247 := by
  simpa only [values1192_size] using segment_domain 215 values1192

theorem block1192_get (i : Fin 32) :
    block1192 (215 + i.val) = some (values1192[i.val]'(by rw [values1192_size]; exact i.isLt)) := by
  exact segment_get 215 values1192 ⟨i.val, by rw [values1192_size]; exact i.isLt⟩

def values1193 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1193.coefficient88_247,
  OriginalRow227TriangleData1193.coefficient88_248,
  OriginalRow227TriangleData1193.coefficient88_249,
  OriginalRow227TriangleData1193.coefficient88_250,
  OriginalRow227TriangleData1193.coefficient88_251,
  OriginalRow227TriangleData1193.coefficient88_252,
  OriginalRow227TriangleData1193.coefficient88_253,
  OriginalRow227TriangleData1193.coefficient88_254,
  OriginalRow227TriangleData1193.coefficient88_255,
  OriginalRow227TriangleData1193.coefficient88_256,
  OriginalRow227TriangleData1193.coefficient88_257,
  OriginalRow227TriangleData1193.coefficient88_258,
  OriginalRow227TriangleData1193.coefficient88_259,
  OriginalRow227TriangleData1193.coefficient88_260,
  OriginalRow227TriangleData1193.coefficient88_261,
  OriginalRow227TriangleData1193.coefficient88_262,
  OriginalRow227TriangleData1193.coefficient88_263,
  OriginalRow227TriangleData1193.coefficient88_264,
  OriginalRow227TriangleData1193.coefficient88_265,
  OriginalRow227TriangleData1193.coefficient88_266,
  OriginalRow227TriangleData1193.coefficient88_267,
  OriginalRow227TriangleData1193.coefficient88_268,
  OriginalRow227TriangleData1193.coefficient88_269,
  OriginalRow227TriangleData1193.coefficient88_270,
  OriginalRow227TriangleData1193.coefficient88_271,
  OriginalRow227TriangleData1193.coefficient88_272,
  OriginalRow227TriangleData1193.coefficient88_273,
  OriginalRow227TriangleData1193.coefficient88_274,
  OriginalRow227TriangleData1193.coefficient88_275,
  OriginalRow227TriangleData1193.coefficient88_276,
  OriginalRow227TriangleData1193.coefficient88_277,
  OriginalRow227TriangleData1193.coefficient88_278
]

theorem values1193_size : values1193.size = 32 := rfl

def block1193 : ℕ → Option IntervalDyadic := segment 247 values1193

theorem block1193_domain : ExactDomain block1193 247 279 := by
  simpa only [values1193_size] using segment_domain 247 values1193

theorem block1193_get (i : Fin 32) :
    block1193 (247 + i.val) = some (values1193[i.val]'(by rw [values1193_size]; exact i.isLt)) := by
  exact segment_get 247 values1193 ⟨i.val, by rw [values1193_size]; exact i.isLt⟩

def values1194 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1194.coefficient88_279,
  OriginalRow227TriangleData1194.coefficient88_280,
  OriginalRow227TriangleData1194.coefficient88_281,
  OriginalRow227TriangleData1194.coefficient88_282,
  OriginalRow227TriangleData1194.coefficient88_283,
  OriginalRow227TriangleData1194.coefficient88_284,
  OriginalRow227TriangleData1194.coefficient88_285,
  OriginalRow227TriangleData1194.coefficient88_286,
  OriginalRow227TriangleData1194.coefficient88_287,
  OriginalRow227TriangleData1194.coefficient88_288,
  OriginalRow227TriangleData1194.coefficient88_289,
  OriginalRow227TriangleData1194.coefficient88_290,
  OriginalRow227TriangleData1194.coefficient88_291,
  OriginalRow227TriangleData1194.coefficient88_292,
  OriginalRow227TriangleData1194.coefficient88_293,
  OriginalRow227TriangleData1194.coefficient88_294,
  OriginalRow227TriangleData1194.coefficient88_295,
  OriginalRow227TriangleData1194.coefficient88_296,
  OriginalRow227TriangleData1194.coefficient88_297,
  OriginalRow227TriangleData1194.coefficient88_298,
  OriginalRow227TriangleData1194.coefficient88_299,
  OriginalRow227TriangleData1194.coefficient88_300,
  OriginalRow227TriangleData1194.coefficient88_301,
  OriginalRow227TriangleData1194.coefficient88_302,
  OriginalRow227TriangleData1194.coefficient88_303,
  OriginalRow227TriangleData1194.coefficient88_304,
  OriginalRow227TriangleData1194.coefficient88_305,
  OriginalRow227TriangleData1194.coefficient88_306,
  OriginalRow227TriangleData1194.coefficient88_307,
  OriginalRow227TriangleData1194.coefficient88_308,
  OriginalRow227TriangleData1194.coefficient88_309,
  OriginalRow227TriangleData1194.coefficient88_310
]

theorem values1194_size : values1194.size = 32 := rfl

def block1194 : ℕ → Option IntervalDyadic := segment 279 values1194

theorem block1194_domain : ExactDomain block1194 279 311 := by
  simpa only [values1194_size] using segment_domain 279 values1194

theorem block1194_get (i : Fin 32) :
    block1194 (279 + i.val) = some (values1194[i.val]'(by rw [values1194_size]; exact i.isLt)) := by
  exact segment_get 279 values1194 ⟨i.val, by rw [values1194_size]; exact i.isLt⟩

def values1195 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1195.coefficient88_311,
  OriginalRow227TriangleData1195.coefficient88_312,
  OriginalRow227TriangleData1195.coefficient88_313,
  OriginalRow227TriangleData1195.coefficient88_314,
  OriginalRow227TriangleData1195.coefficient88_315,
  OriginalRow227TriangleData1195.coefficient88_316,
  OriginalRow227TriangleData1195.coefficient88_317,
  OriginalRow227TriangleData1195.coefficient88_318,
  OriginalRow227TriangleData1195.coefficient88_319,
  OriginalRow227TriangleData1195.coefficient88_320,
  OriginalRow227TriangleData1195.coefficient88_321,
  OriginalRow227TriangleData1195.coefficient88_322,
  OriginalRow227TriangleData1195.coefficient88_323,
  OriginalRow227TriangleData1195.coefficient88_324,
  OriginalRow227TriangleData1195.coefficient88_325,
  OriginalRow227TriangleData1195.coefficient88_326,
  OriginalRow227TriangleData1195.coefficient88_327,
  OriginalRow227TriangleData1195.coefficient88_328,
  OriginalRow227TriangleData1195.coefficient88_329,
  OriginalRow227TriangleData1195.coefficient88_330,
  OriginalRow227TriangleData1195.coefficient88_331,
  OriginalRow227TriangleData1195.coefficient88_332,
  OriginalRow227TriangleData1195.coefficient88_333,
  OriginalRow227TriangleData1195.coefficient88_334,
  OriginalRow227TriangleData1195.coefficient88_335,
  OriginalRow227TriangleData1195.coefficient88_336,
  OriginalRow227TriangleData1195.coefficient88_337,
  OriginalRow227TriangleData1195.coefficient88_338,
  OriginalRow227TriangleData1195.coefficient88_339,
  OriginalRow227TriangleData1195.coefficient88_340,
  OriginalRow227TriangleData1195.coefficient88_341,
  OriginalRow227TriangleData1195.coefficient88_342
]

theorem values1195_size : values1195.size = 32 := rfl

def block1195 : ℕ → Option IntervalDyadic := segment 311 values1195

theorem block1195_domain : ExactDomain block1195 311 343 := by
  simpa only [values1195_size] using segment_domain 311 values1195

theorem block1195_get (i : Fin 32) :
    block1195 (311 + i.val) = some (values1195[i.val]'(by rw [values1195_size]; exact i.isLt)) := by
  exact segment_get 311 values1195 ⟨i.val, by rw [values1195_size]; exact i.isLt⟩

def values1196 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1196.coefficient88_343,
  OriginalRow227TriangleData1196.coefficient88_344,
  OriginalRow227TriangleData1196.coefficient88_345,
  OriginalRow227TriangleData1196.coefficient88_346,
  OriginalRow227TriangleData1196.coefficient88_347,
  OriginalRow227TriangleData1196.coefficient88_348,
  OriginalRow227TriangleData1196.coefficient88_349,
  OriginalRow227TriangleData1196.coefficient88_350,
  OriginalRow227TriangleData1196.coefficient88_351,
  OriginalRow227TriangleData1196.coefficient88_352,
  OriginalRow227TriangleData1196.coefficient88_353,
  OriginalRow227TriangleData1196.coefficient88_354,
  OriginalRow227TriangleData1196.coefficient88_355,
  OriginalRow227TriangleData1196.coefficient88_356,
  OriginalRow227TriangleData1196.coefficient88_357,
  OriginalRow227TriangleData1196.coefficient88_358,
  OriginalRow227TriangleData1196.coefficient88_359,
  OriginalRow227TriangleData1196.coefficient88_360,
  OriginalRow227TriangleData1196.coefficient88_361,
  OriginalRow227TriangleData1196.coefficient88_362,
  OriginalRow227TriangleData1196.coefficient88_363,
  OriginalRow227TriangleData1196.coefficient88_364,
  OriginalRow227TriangleData1196.coefficient88_365,
  OriginalRow227TriangleData1196.coefficient88_366,
  OriginalRow227TriangleData1196.coefficient88_367,
  OriginalRow227TriangleData1196.coefficient88_368,
  OriginalRow227TriangleData1196.coefficient88_369,
  OriginalRow227TriangleData1196.coefficient88_370,
  OriginalRow227TriangleData1196.coefficient88_371,
  OriginalRow227TriangleData1196.coefficient88_372,
  OriginalRow227TriangleData1196.coefficient88_373,
  OriginalRow227TriangleData1196.coefficient88_374
]

theorem values1196_size : values1196.size = 32 := rfl

def block1196 : ℕ → Option IntervalDyadic := segment 343 values1196

theorem block1196_domain : ExactDomain block1196 343 375 := by
  simpa only [values1196_size] using segment_domain 343 values1196

theorem block1196_get (i : Fin 32) :
    block1196 (343 + i.val) = some (values1196[i.val]'(by rw [values1196_size]; exact i.isLt)) := by
  exact segment_get 343 values1196 ⟨i.val, by rw [values1196_size]; exact i.isLt⟩

def values1197 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1197.coefficient88_375,
  OriginalRow227TriangleData1197.coefficient88_376,
  OriginalRow227TriangleData1197.coefficient88_377,
  OriginalRow227TriangleData1197.coefficient88_378,
  OriginalRow227TriangleData1197.coefficient88_379,
  OriginalRow227TriangleData1197.coefficient88_380,
  OriginalRow227TriangleData1197.coefficient88_381,
  OriginalRow227TriangleData1197.coefficient88_382,
  OriginalRow227TriangleData1197.coefficient88_383,
  OriginalRow227TriangleData1197.coefficient88_384,
  OriginalRow227TriangleData1197.coefficient88_385,
  OriginalRow227TriangleData1197.coefficient88_386,
  OriginalRow227TriangleData1197.coefficient88_387,
  OriginalRow227TriangleData1197.coefficient88_388,
  OriginalRow227TriangleData1197.coefficient88_389,
  OriginalRow227TriangleData1197.coefficient88_390,
  OriginalRow227TriangleData1197.coefficient88_391,
  OriginalRow227TriangleData1197.coefficient88_392,
  OriginalRow227TriangleData1197.coefficient88_393,
  OriginalRow227TriangleData1197.coefficient88_394,
  OriginalRow227TriangleData1197.coefficient88_395,
  OriginalRow227TriangleData1197.coefficient88_396,
  OriginalRow227TriangleData1197.coefficient88_397,
  OriginalRow227TriangleData1197.coefficient88_398,
  OriginalRow227TriangleData1197.coefficient88_399,
  OriginalRow227TriangleData1197.coefficient88_400,
  OriginalRow227TriangleData1197.coefficient88_401,
  OriginalRow227TriangleData1197.coefficient88_402,
  OriginalRow227TriangleData1197.coefficient88_403,
  OriginalRow227TriangleData1197.coefficient88_404,
  OriginalRow227TriangleData1197.coefficient88_405,
  OriginalRow227TriangleData1197.coefficient88_406
]

theorem values1197_size : values1197.size = 32 := rfl

def block1197 : ℕ → Option IntervalDyadic := segment 375 values1197

theorem block1197_domain : ExactDomain block1197 375 407 := by
  simpa only [values1197_size] using segment_domain 375 values1197

theorem block1197_get (i : Fin 32) :
    block1197 (375 + i.val) = some (values1197[i.val]'(by rw [values1197_size]; exact i.isLt)) := by
  exact segment_get 375 values1197 ⟨i.val, by rw [values1197_size]; exact i.isLt⟩

def values1198 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1198.coefficient88_407,
  OriginalRow227TriangleData1198.coefficient88_408,
  OriginalRow227TriangleData1198.coefficient88_409,
  OriginalRow227TriangleData1198.coefficient88_410,
  OriginalRow227TriangleData1198.coefficient88_411,
  OriginalRow227TriangleData1198.coefficient88_412,
  OriginalRow227TriangleData1198.coefficient88_413
]

theorem values1198_size : values1198.size = 7 := rfl

def block1198 : ℕ → Option IntervalDyadic := segment 407 values1198

theorem block1198_domain : ExactDomain block1198 407 414 := by
  simpa only [values1198_size] using segment_domain 407 values1198

theorem block1198_get (i : Fin 7) :
    block1198 (407 + i.val) = some (values1198[i.val]'(by rw [values1198_size]; exact i.isLt)) := by
  exact segment_get 407 values1198 ⟨i.val, by rw [values1198_size]; exact i.isLt⟩

def node0087_0151 : ℕ → Option IntervalDyadic := split 119 block1188 block1189

theorem node0087_0151_domain : ExactDomain node0087_0151 87 151 := by
  exact split_domain (by decide) (by decide) block1188_domain block1189_domain

def node0183_0247 : ℕ → Option IntervalDyadic := split 215 block1191 block1192

theorem node0183_0247_domain : ExactDomain node0183_0247 183 247 := by
  exact split_domain (by decide) (by decide) block1191_domain block1192_domain

def node0151_0247 : ℕ → Option IntervalDyadic := split 183 block1190 node0183_0247

theorem node0151_0247_domain : ExactDomain node0151_0247 151 247 := by
  exact split_domain (by decide) (by decide) block1190_domain node0183_0247_domain

def node0087_0247 : ℕ → Option IntervalDyadic := split 151 node0087_0151 node0151_0247

theorem node0087_0247_domain : ExactDomain node0087_0247 87 247 := by
  exact split_domain (by decide) (by decide) node0087_0151_domain node0151_0247_domain

def node0279_0343 : ℕ → Option IntervalDyadic := split 311 block1194 block1195

theorem node0279_0343_domain : ExactDomain node0279_0343 279 343 := by
  exact split_domain (by decide) (by decide) block1194_domain block1195_domain

def node0247_0343 : ℕ → Option IntervalDyadic := split 279 block1193 node0279_0343

theorem node0247_0343_domain : ExactDomain node0247_0343 247 343 := by
  exact split_domain (by decide) (by decide) block1193_domain node0279_0343_domain

def node0375_0414 : ℕ → Option IntervalDyadic := split 407 block1197 block1198

theorem node0375_0414_domain : ExactDomain node0375_0414 375 414 := by
  exact split_domain (by decide) (by decide) block1197_domain block1198_domain

def node0343_0414 : ℕ → Option IntervalDyadic := split 375 block1196 node0375_0414

theorem node0343_0414_domain : ExactDomain node0343_0414 343 414 := by
  exact split_domain (by decide) (by decide) block1196_domain node0375_0414_domain

def node0247_0414 : ℕ → Option IntervalDyadic := split 343 node0247_0343 node0343_0414

theorem node0247_0414_domain : ExactDomain node0247_0414 247 414 := by
  exact split_domain (by decide) (by decide) node0247_0343_domain node0343_0414_domain

def node0087_0414 : ℕ → Option IntervalDyadic := split 247 node0087_0247 node0247_0414

theorem node0087_0414_domain : ExactDomain node0087_0414 87 414 := by
  exact split_domain (by decide) (by decide) node0087_0247_domain node0247_0414_domain

def lookup : ℕ → Option IntervalDyadic := node0087_0414

theorem lookup_domain : ExactDomain lookup 87 414 :=
  node0087_0414_domain

theorem block1188_lookup (i : Fin 32) :
    lookup (87 + i.val) = some (values1188[i.val]'(by rw [values1188_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (87 + i.val) = _
  rw [node0087_0414, split_left 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0087_0247, split_left 151 node0087_0151 node0151_0247 (by omega)]
  rw [node0087_0151, split_left 119 block1188 block1189 (by omega)]
  exact block1188_get i

theorem block1189_lookup (i : Fin 32) :
    lookup (119 + i.val) = some (values1189[i.val]'(by rw [values1189_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (119 + i.val) = _
  rw [node0087_0414, split_left 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0087_0247, split_left 151 node0087_0151 node0151_0247 (by omega)]
  rw [node0087_0151, split_right 119 block1188 block1189 (by omega)]
  exact block1189_get i

theorem block1190_lookup (i : Fin 32) :
    lookup (151 + i.val) = some (values1190[i.val]'(by rw [values1190_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (151 + i.val) = _
  rw [node0087_0414, split_left 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0087_0247, split_right 151 node0087_0151 node0151_0247 (by omega)]
  rw [node0151_0247, split_left 183 block1190 node0183_0247 (by omega)]
  exact block1190_get i

theorem block1191_lookup (i : Fin 32) :
    lookup (183 + i.val) = some (values1191[i.val]'(by rw [values1191_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (183 + i.val) = _
  rw [node0087_0414, split_left 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0087_0247, split_right 151 node0087_0151 node0151_0247 (by omega)]
  rw [node0151_0247, split_right 183 block1190 node0183_0247 (by omega)]
  rw [node0183_0247, split_left 215 block1191 block1192 (by omega)]
  exact block1191_get i

theorem block1192_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values1192[i.val]'(by rw [values1192_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (215 + i.val) = _
  rw [node0087_0414, split_left 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0087_0247, split_right 151 node0087_0151 node0151_0247 (by omega)]
  rw [node0151_0247, split_right 183 block1190 node0183_0247 (by omega)]
  rw [node0183_0247, split_right 215 block1191 block1192 (by omega)]
  exact block1192_get i

theorem block1193_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values1193[i.val]'(by rw [values1193_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (247 + i.val) = _
  rw [node0087_0414, split_right 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0247_0414, split_left 343 node0247_0343 node0343_0414 (by omega)]
  rw [node0247_0343, split_left 279 block1193 node0279_0343 (by omega)]
  exact block1193_get i

theorem block1194_lookup (i : Fin 32) :
    lookup (279 + i.val) = some (values1194[i.val]'(by rw [values1194_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (279 + i.val) = _
  rw [node0087_0414, split_right 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0247_0414, split_left 343 node0247_0343 node0343_0414 (by omega)]
  rw [node0247_0343, split_right 279 block1193 node0279_0343 (by omega)]
  rw [node0279_0343, split_left 311 block1194 block1195 (by omega)]
  exact block1194_get i

theorem block1195_lookup (i : Fin 32) :
    lookup (311 + i.val) = some (values1195[i.val]'(by rw [values1195_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (311 + i.val) = _
  rw [node0087_0414, split_right 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0247_0414, split_left 343 node0247_0343 node0343_0414 (by omega)]
  rw [node0247_0343, split_right 279 block1193 node0279_0343 (by omega)]
  rw [node0279_0343, split_right 311 block1194 block1195 (by omega)]
  exact block1195_get i

theorem block1196_lookup (i : Fin 32) :
    lookup (343 + i.val) = some (values1196[i.val]'(by rw [values1196_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (343 + i.val) = _
  rw [node0087_0414, split_right 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0247_0414, split_right 343 node0247_0343 node0343_0414 (by omega)]
  rw [node0343_0414, split_left 375 block1196 node0375_0414 (by omega)]
  exact block1196_get i

theorem block1197_lookup (i : Fin 32) :
    lookup (375 + i.val) = some (values1197[i.val]'(by rw [values1197_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (375 + i.val) = _
  rw [node0087_0414, split_right 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0247_0414, split_right 343 node0247_0343 node0343_0414 (by omega)]
  rw [node0343_0414, split_right 375 block1196 node0375_0414 (by omega)]
  rw [node0375_0414, split_left 407 block1197 block1198 (by omega)]
  exact block1197_get i

theorem block1198_lookup (i : Fin 7) :
    lookup (407 + i.val) = some (values1198[i.val]'(by rw [values1198_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0087_0414 (407 + i.val) = _
  rw [node0087_0414, split_right 247 node0087_0247 node0247_0414 (by omega)]
  rw [node0247_0414, split_right 343 node0247_0343 node0343_0414 (by omega)]
  rw [node0343_0414, split_right 375 block1196 node0375_0414 (by omega)]
  rw [node0375_0414, split_right 407 block1197 block1198 (by omega)]
  exact block1198_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1188_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1188_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1189_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1189_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1190_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1190_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1191_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1191_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1192_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1192_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1193_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1193_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1194_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1194_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1195_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1195_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1196_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1196_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1197_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1197_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1198_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1198_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1188_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1189_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1190_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1191_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1192_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1193_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1194_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1195_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1196_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1197_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow088.block1198_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow088
