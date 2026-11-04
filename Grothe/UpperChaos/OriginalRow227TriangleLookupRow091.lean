import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1221
import Grothe.UpperChaos.OriginalRow227TriangleData1222
import Grothe.UpperChaos.OriginalRow227TriangleData1223
import Grothe.UpperChaos.OriginalRow227TriangleData1224
import Grothe.UpperChaos.OriginalRow227TriangleData1225
import Grothe.UpperChaos.OriginalRow227TriangleData1226
import Grothe.UpperChaos.OriginalRow227TriangleData1227
import Grothe.UpperChaos.OriginalRow227TriangleData1228
import Grothe.UpperChaos.OriginalRow227TriangleData1229
import Grothe.UpperChaos.OriginalRow227TriangleData1230
import Grothe.UpperChaos.OriginalRow227TriangleData1231

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow091

open ConditionalTableLookup

def values1221 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1221.coefficient91_90,
  OriginalRow227TriangleData1221.coefficient91_91,
  OriginalRow227TriangleData1221.coefficient91_92,
  OriginalRow227TriangleData1221.coefficient91_93,
  OriginalRow227TriangleData1221.coefficient91_94,
  OriginalRow227TriangleData1221.coefficient91_95,
  OriginalRow227TriangleData1221.coefficient91_96,
  OriginalRow227TriangleData1221.coefficient91_97,
  OriginalRow227TriangleData1221.coefficient91_98,
  OriginalRow227TriangleData1221.coefficient91_99,
  OriginalRow227TriangleData1221.coefficient91_100,
  OriginalRow227TriangleData1221.coefficient91_101,
  OriginalRow227TriangleData1221.coefficient91_102,
  OriginalRow227TriangleData1221.coefficient91_103,
  OriginalRow227TriangleData1221.coefficient91_104,
  OriginalRow227TriangleData1221.coefficient91_105,
  OriginalRow227TriangleData1221.coefficient91_106,
  OriginalRow227TriangleData1221.coefficient91_107,
  OriginalRow227TriangleData1221.coefficient91_108,
  OriginalRow227TriangleData1221.coefficient91_109,
  OriginalRow227TriangleData1221.coefficient91_110,
  OriginalRow227TriangleData1221.coefficient91_111,
  OriginalRow227TriangleData1221.coefficient91_112,
  OriginalRow227TriangleData1221.coefficient91_113,
  OriginalRow227TriangleData1221.coefficient91_114,
  OriginalRow227TriangleData1221.coefficient91_115,
  OriginalRow227TriangleData1221.coefficient91_116,
  OriginalRow227TriangleData1221.coefficient91_117,
  OriginalRow227TriangleData1221.coefficient91_118,
  OriginalRow227TriangleData1221.coefficient91_119,
  OriginalRow227TriangleData1221.coefficient91_120,
  OriginalRow227TriangleData1221.coefficient91_121
]

theorem values1221_size : values1221.size = 32 := rfl

def block1221 : ℕ → Option IntervalDyadic := segment 90 values1221

theorem block1221_domain : ExactDomain block1221 90 122 := by
  simpa only [values1221_size] using segment_domain 90 values1221

theorem block1221_get (i : Fin 32) :
    block1221 (90 + i.val) = some (values1221[i.val]'(by rw [values1221_size]; exact i.isLt)) := by
  exact segment_get 90 values1221 ⟨i.val, by rw [values1221_size]; exact i.isLt⟩

def values1222 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1222.coefficient91_122,
  OriginalRow227TriangleData1222.coefficient91_123,
  OriginalRow227TriangleData1222.coefficient91_124,
  OriginalRow227TriangleData1222.coefficient91_125,
  OriginalRow227TriangleData1222.coefficient91_126,
  OriginalRow227TriangleData1222.coefficient91_127,
  OriginalRow227TriangleData1222.coefficient91_128,
  OriginalRow227TriangleData1222.coefficient91_129,
  OriginalRow227TriangleData1222.coefficient91_130,
  OriginalRow227TriangleData1222.coefficient91_131,
  OriginalRow227TriangleData1222.coefficient91_132,
  OriginalRow227TriangleData1222.coefficient91_133,
  OriginalRow227TriangleData1222.coefficient91_134,
  OriginalRow227TriangleData1222.coefficient91_135,
  OriginalRow227TriangleData1222.coefficient91_136,
  OriginalRow227TriangleData1222.coefficient91_137,
  OriginalRow227TriangleData1222.coefficient91_138,
  OriginalRow227TriangleData1222.coefficient91_139,
  OriginalRow227TriangleData1222.coefficient91_140,
  OriginalRow227TriangleData1222.coefficient91_141,
  OriginalRow227TriangleData1222.coefficient91_142,
  OriginalRow227TriangleData1222.coefficient91_143,
  OriginalRow227TriangleData1222.coefficient91_144,
  OriginalRow227TriangleData1222.coefficient91_145,
  OriginalRow227TriangleData1222.coefficient91_146,
  OriginalRow227TriangleData1222.coefficient91_147,
  OriginalRow227TriangleData1222.coefficient91_148,
  OriginalRow227TriangleData1222.coefficient91_149,
  OriginalRow227TriangleData1222.coefficient91_150,
  OriginalRow227TriangleData1222.coefficient91_151,
  OriginalRow227TriangleData1222.coefficient91_152,
  OriginalRow227TriangleData1222.coefficient91_153
]

theorem values1222_size : values1222.size = 32 := rfl

def block1222 : ℕ → Option IntervalDyadic := segment 122 values1222

theorem block1222_domain : ExactDomain block1222 122 154 := by
  simpa only [values1222_size] using segment_domain 122 values1222

theorem block1222_get (i : Fin 32) :
    block1222 (122 + i.val) = some (values1222[i.val]'(by rw [values1222_size]; exact i.isLt)) := by
  exact segment_get 122 values1222 ⟨i.val, by rw [values1222_size]; exact i.isLt⟩

def values1223 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1223.coefficient91_154,
  OriginalRow227TriangleData1223.coefficient91_155,
  OriginalRow227TriangleData1223.coefficient91_156,
  OriginalRow227TriangleData1223.coefficient91_157,
  OriginalRow227TriangleData1223.coefficient91_158,
  OriginalRow227TriangleData1223.coefficient91_159,
  OriginalRow227TriangleData1223.coefficient91_160,
  OriginalRow227TriangleData1223.coefficient91_161,
  OriginalRow227TriangleData1223.coefficient91_162,
  OriginalRow227TriangleData1223.coefficient91_163,
  OriginalRow227TriangleData1223.coefficient91_164,
  OriginalRow227TriangleData1223.coefficient91_165,
  OriginalRow227TriangleData1223.coefficient91_166,
  OriginalRow227TriangleData1223.coefficient91_167,
  OriginalRow227TriangleData1223.coefficient91_168,
  OriginalRow227TriangleData1223.coefficient91_169,
  OriginalRow227TriangleData1223.coefficient91_170,
  OriginalRow227TriangleData1223.coefficient91_171,
  OriginalRow227TriangleData1223.coefficient91_172,
  OriginalRow227TriangleData1223.coefficient91_173,
  OriginalRow227TriangleData1223.coefficient91_174,
  OriginalRow227TriangleData1223.coefficient91_175,
  OriginalRow227TriangleData1223.coefficient91_176,
  OriginalRow227TriangleData1223.coefficient91_177,
  OriginalRow227TriangleData1223.coefficient91_178,
  OriginalRow227TriangleData1223.coefficient91_179,
  OriginalRow227TriangleData1223.coefficient91_180,
  OriginalRow227TriangleData1223.coefficient91_181,
  OriginalRow227TriangleData1223.coefficient91_182,
  OriginalRow227TriangleData1223.coefficient91_183,
  OriginalRow227TriangleData1223.coefficient91_184,
  OriginalRow227TriangleData1223.coefficient91_185
]

theorem values1223_size : values1223.size = 32 := rfl

def block1223 : ℕ → Option IntervalDyadic := segment 154 values1223

theorem block1223_domain : ExactDomain block1223 154 186 := by
  simpa only [values1223_size] using segment_domain 154 values1223

theorem block1223_get (i : Fin 32) :
    block1223 (154 + i.val) = some (values1223[i.val]'(by rw [values1223_size]; exact i.isLt)) := by
  exact segment_get 154 values1223 ⟨i.val, by rw [values1223_size]; exact i.isLt⟩

def values1224 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1224.coefficient91_186,
  OriginalRow227TriangleData1224.coefficient91_187,
  OriginalRow227TriangleData1224.coefficient91_188,
  OriginalRow227TriangleData1224.coefficient91_189,
  OriginalRow227TriangleData1224.coefficient91_190,
  OriginalRow227TriangleData1224.coefficient91_191,
  OriginalRow227TriangleData1224.coefficient91_192,
  OriginalRow227TriangleData1224.coefficient91_193,
  OriginalRow227TriangleData1224.coefficient91_194,
  OriginalRow227TriangleData1224.coefficient91_195,
  OriginalRow227TriangleData1224.coefficient91_196,
  OriginalRow227TriangleData1224.coefficient91_197,
  OriginalRow227TriangleData1224.coefficient91_198,
  OriginalRow227TriangleData1224.coefficient91_199,
  OriginalRow227TriangleData1224.coefficient91_200,
  OriginalRow227TriangleData1224.coefficient91_201,
  OriginalRow227TriangleData1224.coefficient91_202,
  OriginalRow227TriangleData1224.coefficient91_203,
  OriginalRow227TriangleData1224.coefficient91_204,
  OriginalRow227TriangleData1224.coefficient91_205,
  OriginalRow227TriangleData1224.coefficient91_206,
  OriginalRow227TriangleData1224.coefficient91_207,
  OriginalRow227TriangleData1224.coefficient91_208,
  OriginalRow227TriangleData1224.coefficient91_209,
  OriginalRow227TriangleData1224.coefficient91_210,
  OriginalRow227TriangleData1224.coefficient91_211,
  OriginalRow227TriangleData1224.coefficient91_212,
  OriginalRow227TriangleData1224.coefficient91_213,
  OriginalRow227TriangleData1224.coefficient91_214,
  OriginalRow227TriangleData1224.coefficient91_215,
  OriginalRow227TriangleData1224.coefficient91_216,
  OriginalRow227TriangleData1224.coefficient91_217
]

theorem values1224_size : values1224.size = 32 := rfl

def block1224 : ℕ → Option IntervalDyadic := segment 186 values1224

theorem block1224_domain : ExactDomain block1224 186 218 := by
  simpa only [values1224_size] using segment_domain 186 values1224

theorem block1224_get (i : Fin 32) :
    block1224 (186 + i.val) = some (values1224[i.val]'(by rw [values1224_size]; exact i.isLt)) := by
  exact segment_get 186 values1224 ⟨i.val, by rw [values1224_size]; exact i.isLt⟩

def values1225 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1225.coefficient91_218,
  OriginalRow227TriangleData1225.coefficient91_219,
  OriginalRow227TriangleData1225.coefficient91_220,
  OriginalRow227TriangleData1225.coefficient91_221,
  OriginalRow227TriangleData1225.coefficient91_222,
  OriginalRow227TriangleData1225.coefficient91_223,
  OriginalRow227TriangleData1225.coefficient91_224,
  OriginalRow227TriangleData1225.coefficient91_225,
  OriginalRow227TriangleData1225.coefficient91_226,
  OriginalRow227TriangleData1225.coefficient91_227,
  OriginalRow227TriangleData1225.coefficient91_228,
  OriginalRow227TriangleData1225.coefficient91_229,
  OriginalRow227TriangleData1225.coefficient91_230,
  OriginalRow227TriangleData1225.coefficient91_231,
  OriginalRow227TriangleData1225.coefficient91_232,
  OriginalRow227TriangleData1225.coefficient91_233,
  OriginalRow227TriangleData1225.coefficient91_234,
  OriginalRow227TriangleData1225.coefficient91_235,
  OriginalRow227TriangleData1225.coefficient91_236,
  OriginalRow227TriangleData1225.coefficient91_237,
  OriginalRow227TriangleData1225.coefficient91_238,
  OriginalRow227TriangleData1225.coefficient91_239,
  OriginalRow227TriangleData1225.coefficient91_240,
  OriginalRow227TriangleData1225.coefficient91_241,
  OriginalRow227TriangleData1225.coefficient91_242,
  OriginalRow227TriangleData1225.coefficient91_243,
  OriginalRow227TriangleData1225.coefficient91_244,
  OriginalRow227TriangleData1225.coefficient91_245,
  OriginalRow227TriangleData1225.coefficient91_246,
  OriginalRow227TriangleData1225.coefficient91_247,
  OriginalRow227TriangleData1225.coefficient91_248,
  OriginalRow227TriangleData1225.coefficient91_249
]

theorem values1225_size : values1225.size = 32 := rfl

def block1225 : ℕ → Option IntervalDyadic := segment 218 values1225

theorem block1225_domain : ExactDomain block1225 218 250 := by
  simpa only [values1225_size] using segment_domain 218 values1225

theorem block1225_get (i : Fin 32) :
    block1225 (218 + i.val) = some (values1225[i.val]'(by rw [values1225_size]; exact i.isLt)) := by
  exact segment_get 218 values1225 ⟨i.val, by rw [values1225_size]; exact i.isLt⟩

def values1226 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1226.coefficient91_250,
  OriginalRow227TriangleData1226.coefficient91_251,
  OriginalRow227TriangleData1226.coefficient91_252,
  OriginalRow227TriangleData1226.coefficient91_253,
  OriginalRow227TriangleData1226.coefficient91_254,
  OriginalRow227TriangleData1226.coefficient91_255,
  OriginalRow227TriangleData1226.coefficient91_256,
  OriginalRow227TriangleData1226.coefficient91_257,
  OriginalRow227TriangleData1226.coefficient91_258,
  OriginalRow227TriangleData1226.coefficient91_259,
  OriginalRow227TriangleData1226.coefficient91_260,
  OriginalRow227TriangleData1226.coefficient91_261,
  OriginalRow227TriangleData1226.coefficient91_262,
  OriginalRow227TriangleData1226.coefficient91_263,
  OriginalRow227TriangleData1226.coefficient91_264,
  OriginalRow227TriangleData1226.coefficient91_265,
  OriginalRow227TriangleData1226.coefficient91_266,
  OriginalRow227TriangleData1226.coefficient91_267,
  OriginalRow227TriangleData1226.coefficient91_268,
  OriginalRow227TriangleData1226.coefficient91_269,
  OriginalRow227TriangleData1226.coefficient91_270,
  OriginalRow227TriangleData1226.coefficient91_271,
  OriginalRow227TriangleData1226.coefficient91_272,
  OriginalRow227TriangleData1226.coefficient91_273,
  OriginalRow227TriangleData1226.coefficient91_274,
  OriginalRow227TriangleData1226.coefficient91_275,
  OriginalRow227TriangleData1226.coefficient91_276,
  OriginalRow227TriangleData1226.coefficient91_277,
  OriginalRow227TriangleData1226.coefficient91_278,
  OriginalRow227TriangleData1226.coefficient91_279,
  OriginalRow227TriangleData1226.coefficient91_280,
  OriginalRow227TriangleData1226.coefficient91_281
]

theorem values1226_size : values1226.size = 32 := rfl

def block1226 : ℕ → Option IntervalDyadic := segment 250 values1226

theorem block1226_domain : ExactDomain block1226 250 282 := by
  simpa only [values1226_size] using segment_domain 250 values1226

theorem block1226_get (i : Fin 32) :
    block1226 (250 + i.val) = some (values1226[i.val]'(by rw [values1226_size]; exact i.isLt)) := by
  exact segment_get 250 values1226 ⟨i.val, by rw [values1226_size]; exact i.isLt⟩

def values1227 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1227.coefficient91_282,
  OriginalRow227TriangleData1227.coefficient91_283,
  OriginalRow227TriangleData1227.coefficient91_284,
  OriginalRow227TriangleData1227.coefficient91_285,
  OriginalRow227TriangleData1227.coefficient91_286,
  OriginalRow227TriangleData1227.coefficient91_287,
  OriginalRow227TriangleData1227.coefficient91_288,
  OriginalRow227TriangleData1227.coefficient91_289,
  OriginalRow227TriangleData1227.coefficient91_290,
  OriginalRow227TriangleData1227.coefficient91_291,
  OriginalRow227TriangleData1227.coefficient91_292,
  OriginalRow227TriangleData1227.coefficient91_293,
  OriginalRow227TriangleData1227.coefficient91_294,
  OriginalRow227TriangleData1227.coefficient91_295,
  OriginalRow227TriangleData1227.coefficient91_296,
  OriginalRow227TriangleData1227.coefficient91_297,
  OriginalRow227TriangleData1227.coefficient91_298,
  OriginalRow227TriangleData1227.coefficient91_299,
  OriginalRow227TriangleData1227.coefficient91_300,
  OriginalRow227TriangleData1227.coefficient91_301,
  OriginalRow227TriangleData1227.coefficient91_302,
  OriginalRow227TriangleData1227.coefficient91_303,
  OriginalRow227TriangleData1227.coefficient91_304,
  OriginalRow227TriangleData1227.coefficient91_305,
  OriginalRow227TriangleData1227.coefficient91_306,
  OriginalRow227TriangleData1227.coefficient91_307,
  OriginalRow227TriangleData1227.coefficient91_308,
  OriginalRow227TriangleData1227.coefficient91_309,
  OriginalRow227TriangleData1227.coefficient91_310,
  OriginalRow227TriangleData1227.coefficient91_311,
  OriginalRow227TriangleData1227.coefficient91_312,
  OriginalRow227TriangleData1227.coefficient91_313
]

theorem values1227_size : values1227.size = 32 := rfl

def block1227 : ℕ → Option IntervalDyadic := segment 282 values1227

theorem block1227_domain : ExactDomain block1227 282 314 := by
  simpa only [values1227_size] using segment_domain 282 values1227

theorem block1227_get (i : Fin 32) :
    block1227 (282 + i.val) = some (values1227[i.val]'(by rw [values1227_size]; exact i.isLt)) := by
  exact segment_get 282 values1227 ⟨i.val, by rw [values1227_size]; exact i.isLt⟩

def values1228 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1228.coefficient91_314,
  OriginalRow227TriangleData1228.coefficient91_315,
  OriginalRow227TriangleData1228.coefficient91_316,
  OriginalRow227TriangleData1228.coefficient91_317,
  OriginalRow227TriangleData1228.coefficient91_318,
  OriginalRow227TriangleData1228.coefficient91_319,
  OriginalRow227TriangleData1228.coefficient91_320,
  OriginalRow227TriangleData1228.coefficient91_321,
  OriginalRow227TriangleData1228.coefficient91_322,
  OriginalRow227TriangleData1228.coefficient91_323,
  OriginalRow227TriangleData1228.coefficient91_324,
  OriginalRow227TriangleData1228.coefficient91_325,
  OriginalRow227TriangleData1228.coefficient91_326,
  OriginalRow227TriangleData1228.coefficient91_327,
  OriginalRow227TriangleData1228.coefficient91_328,
  OriginalRow227TriangleData1228.coefficient91_329,
  OriginalRow227TriangleData1228.coefficient91_330,
  OriginalRow227TriangleData1228.coefficient91_331,
  OriginalRow227TriangleData1228.coefficient91_332,
  OriginalRow227TriangleData1228.coefficient91_333,
  OriginalRow227TriangleData1228.coefficient91_334,
  OriginalRow227TriangleData1228.coefficient91_335,
  OriginalRow227TriangleData1228.coefficient91_336,
  OriginalRow227TriangleData1228.coefficient91_337,
  OriginalRow227TriangleData1228.coefficient91_338,
  OriginalRow227TriangleData1228.coefficient91_339,
  OriginalRow227TriangleData1228.coefficient91_340,
  OriginalRow227TriangleData1228.coefficient91_341,
  OriginalRow227TriangleData1228.coefficient91_342,
  OriginalRow227TriangleData1228.coefficient91_343,
  OriginalRow227TriangleData1228.coefficient91_344,
  OriginalRow227TriangleData1228.coefficient91_345
]

theorem values1228_size : values1228.size = 32 := rfl

def block1228 : ℕ → Option IntervalDyadic := segment 314 values1228

theorem block1228_domain : ExactDomain block1228 314 346 := by
  simpa only [values1228_size] using segment_domain 314 values1228

theorem block1228_get (i : Fin 32) :
    block1228 (314 + i.val) = some (values1228[i.val]'(by rw [values1228_size]; exact i.isLt)) := by
  exact segment_get 314 values1228 ⟨i.val, by rw [values1228_size]; exact i.isLt⟩

def values1229 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1229.coefficient91_346,
  OriginalRow227TriangleData1229.coefficient91_347,
  OriginalRow227TriangleData1229.coefficient91_348,
  OriginalRow227TriangleData1229.coefficient91_349,
  OriginalRow227TriangleData1229.coefficient91_350,
  OriginalRow227TriangleData1229.coefficient91_351,
  OriginalRow227TriangleData1229.coefficient91_352,
  OriginalRow227TriangleData1229.coefficient91_353,
  OriginalRow227TriangleData1229.coefficient91_354,
  OriginalRow227TriangleData1229.coefficient91_355,
  OriginalRow227TriangleData1229.coefficient91_356,
  OriginalRow227TriangleData1229.coefficient91_357,
  OriginalRow227TriangleData1229.coefficient91_358,
  OriginalRow227TriangleData1229.coefficient91_359,
  OriginalRow227TriangleData1229.coefficient91_360,
  OriginalRow227TriangleData1229.coefficient91_361,
  OriginalRow227TriangleData1229.coefficient91_362,
  OriginalRow227TriangleData1229.coefficient91_363,
  OriginalRow227TriangleData1229.coefficient91_364,
  OriginalRow227TriangleData1229.coefficient91_365,
  OriginalRow227TriangleData1229.coefficient91_366,
  OriginalRow227TriangleData1229.coefficient91_367,
  OriginalRow227TriangleData1229.coefficient91_368,
  OriginalRow227TriangleData1229.coefficient91_369,
  OriginalRow227TriangleData1229.coefficient91_370,
  OriginalRow227TriangleData1229.coefficient91_371,
  OriginalRow227TriangleData1229.coefficient91_372,
  OriginalRow227TriangleData1229.coefficient91_373,
  OriginalRow227TriangleData1229.coefficient91_374,
  OriginalRow227TriangleData1229.coefficient91_375,
  OriginalRow227TriangleData1229.coefficient91_376,
  OriginalRow227TriangleData1229.coefficient91_377
]

theorem values1229_size : values1229.size = 32 := rfl

def block1229 : ℕ → Option IntervalDyadic := segment 346 values1229

theorem block1229_domain : ExactDomain block1229 346 378 := by
  simpa only [values1229_size] using segment_domain 346 values1229

theorem block1229_get (i : Fin 32) :
    block1229 (346 + i.val) = some (values1229[i.val]'(by rw [values1229_size]; exact i.isLt)) := by
  exact segment_get 346 values1229 ⟨i.val, by rw [values1229_size]; exact i.isLt⟩

def values1230 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1230.coefficient91_378,
  OriginalRow227TriangleData1230.coefficient91_379,
  OriginalRow227TriangleData1230.coefficient91_380,
  OriginalRow227TriangleData1230.coefficient91_381,
  OriginalRow227TriangleData1230.coefficient91_382,
  OriginalRow227TriangleData1230.coefficient91_383,
  OriginalRow227TriangleData1230.coefficient91_384,
  OriginalRow227TriangleData1230.coefficient91_385,
  OriginalRow227TriangleData1230.coefficient91_386,
  OriginalRow227TriangleData1230.coefficient91_387,
  OriginalRow227TriangleData1230.coefficient91_388,
  OriginalRow227TriangleData1230.coefficient91_389,
  OriginalRow227TriangleData1230.coefficient91_390,
  OriginalRow227TriangleData1230.coefficient91_391,
  OriginalRow227TriangleData1230.coefficient91_392,
  OriginalRow227TriangleData1230.coefficient91_393,
  OriginalRow227TriangleData1230.coefficient91_394,
  OriginalRow227TriangleData1230.coefficient91_395,
  OriginalRow227TriangleData1230.coefficient91_396,
  OriginalRow227TriangleData1230.coefficient91_397,
  OriginalRow227TriangleData1230.coefficient91_398,
  OriginalRow227TriangleData1230.coefficient91_399,
  OriginalRow227TriangleData1230.coefficient91_400,
  OriginalRow227TriangleData1230.coefficient91_401,
  OriginalRow227TriangleData1230.coefficient91_402,
  OriginalRow227TriangleData1230.coefficient91_403,
  OriginalRow227TriangleData1230.coefficient91_404,
  OriginalRow227TriangleData1230.coefficient91_405,
  OriginalRow227TriangleData1230.coefficient91_406,
  OriginalRow227TriangleData1230.coefficient91_407,
  OriginalRow227TriangleData1230.coefficient91_408,
  OriginalRow227TriangleData1230.coefficient91_409
]

theorem values1230_size : values1230.size = 32 := rfl

def block1230 : ℕ → Option IntervalDyadic := segment 378 values1230

theorem block1230_domain : ExactDomain block1230 378 410 := by
  simpa only [values1230_size] using segment_domain 378 values1230

theorem block1230_get (i : Fin 32) :
    block1230 (378 + i.val) = some (values1230[i.val]'(by rw [values1230_size]; exact i.isLt)) := by
  exact segment_get 378 values1230 ⟨i.val, by rw [values1230_size]; exact i.isLt⟩

def values1231 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1231.coefficient91_410
]

theorem values1231_size : values1231.size = 1 := rfl

def block1231 : ℕ → Option IntervalDyadic := segment 410 values1231

theorem block1231_domain : ExactDomain block1231 410 411 := by
  simpa only [values1231_size] using segment_domain 410 values1231

theorem block1231_get (i : Fin 1) :
    block1231 (410 + i.val) = some (values1231[i.val]'(by rw [values1231_size]; exact i.isLt)) := by
  exact segment_get 410 values1231 ⟨i.val, by rw [values1231_size]; exact i.isLt⟩

def node0090_0154 : ℕ → Option IntervalDyadic := split 122 block1221 block1222

theorem node0090_0154_domain : ExactDomain node0090_0154 90 154 := by
  exact split_domain (by decide) (by decide) block1221_domain block1222_domain

def node0186_0250 : ℕ → Option IntervalDyadic := split 218 block1224 block1225

theorem node0186_0250_domain : ExactDomain node0186_0250 186 250 := by
  exact split_domain (by decide) (by decide) block1224_domain block1225_domain

def node0154_0250 : ℕ → Option IntervalDyadic := split 186 block1223 node0186_0250

theorem node0154_0250_domain : ExactDomain node0154_0250 154 250 := by
  exact split_domain (by decide) (by decide) block1223_domain node0186_0250_domain

def node0090_0250 : ℕ → Option IntervalDyadic := split 154 node0090_0154 node0154_0250

theorem node0090_0250_domain : ExactDomain node0090_0250 90 250 := by
  exact split_domain (by decide) (by decide) node0090_0154_domain node0154_0250_domain

def node0282_0346 : ℕ → Option IntervalDyadic := split 314 block1227 block1228

theorem node0282_0346_domain : ExactDomain node0282_0346 282 346 := by
  exact split_domain (by decide) (by decide) block1227_domain block1228_domain

def node0250_0346 : ℕ → Option IntervalDyadic := split 282 block1226 node0282_0346

theorem node0250_0346_domain : ExactDomain node0250_0346 250 346 := by
  exact split_domain (by decide) (by decide) block1226_domain node0282_0346_domain

def node0378_0411 : ℕ → Option IntervalDyadic := split 410 block1230 block1231

theorem node0378_0411_domain : ExactDomain node0378_0411 378 411 := by
  exact split_domain (by decide) (by decide) block1230_domain block1231_domain

def node0346_0411 : ℕ → Option IntervalDyadic := split 378 block1229 node0378_0411

theorem node0346_0411_domain : ExactDomain node0346_0411 346 411 := by
  exact split_domain (by decide) (by decide) block1229_domain node0378_0411_domain

def node0250_0411 : ℕ → Option IntervalDyadic := split 346 node0250_0346 node0346_0411

theorem node0250_0411_domain : ExactDomain node0250_0411 250 411 := by
  exact split_domain (by decide) (by decide) node0250_0346_domain node0346_0411_domain

def node0090_0411 : ℕ → Option IntervalDyadic := split 250 node0090_0250 node0250_0411

theorem node0090_0411_domain : ExactDomain node0090_0411 90 411 := by
  exact split_domain (by decide) (by decide) node0090_0250_domain node0250_0411_domain

def lookup : ℕ → Option IntervalDyadic := node0090_0411

theorem lookup_domain : ExactDomain lookup 90 411 :=
  node0090_0411_domain

theorem block1221_lookup (i : Fin 32) :
    lookup (90 + i.val) = some (values1221[i.val]'(by rw [values1221_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (90 + i.val) = _
  rw [node0090_0411, split_left 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0090_0250, split_left 154 node0090_0154 node0154_0250 (by omega)]
  rw [node0090_0154, split_left 122 block1221 block1222 (by omega)]
  exact block1221_get i

theorem block1222_lookup (i : Fin 32) :
    lookup (122 + i.val) = some (values1222[i.val]'(by rw [values1222_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (122 + i.val) = _
  rw [node0090_0411, split_left 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0090_0250, split_left 154 node0090_0154 node0154_0250 (by omega)]
  rw [node0090_0154, split_right 122 block1221 block1222 (by omega)]
  exact block1222_get i

theorem block1223_lookup (i : Fin 32) :
    lookup (154 + i.val) = some (values1223[i.val]'(by rw [values1223_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (154 + i.val) = _
  rw [node0090_0411, split_left 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0090_0250, split_right 154 node0090_0154 node0154_0250 (by omega)]
  rw [node0154_0250, split_left 186 block1223 node0186_0250 (by omega)]
  exact block1223_get i

theorem block1224_lookup (i : Fin 32) :
    lookup (186 + i.val) = some (values1224[i.val]'(by rw [values1224_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (186 + i.val) = _
  rw [node0090_0411, split_left 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0090_0250, split_right 154 node0090_0154 node0154_0250 (by omega)]
  rw [node0154_0250, split_right 186 block1223 node0186_0250 (by omega)]
  rw [node0186_0250, split_left 218 block1224 block1225 (by omega)]
  exact block1224_get i

theorem block1225_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values1225[i.val]'(by rw [values1225_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (218 + i.val) = _
  rw [node0090_0411, split_left 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0090_0250, split_right 154 node0090_0154 node0154_0250 (by omega)]
  rw [node0154_0250, split_right 186 block1223 node0186_0250 (by omega)]
  rw [node0186_0250, split_right 218 block1224 block1225 (by omega)]
  exact block1225_get i

theorem block1226_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values1226[i.val]'(by rw [values1226_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (250 + i.val) = _
  rw [node0090_0411, split_right 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0250_0411, split_left 346 node0250_0346 node0346_0411 (by omega)]
  rw [node0250_0346, split_left 282 block1226 node0282_0346 (by omega)]
  exact block1226_get i

theorem block1227_lookup (i : Fin 32) :
    lookup (282 + i.val) = some (values1227[i.val]'(by rw [values1227_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (282 + i.val) = _
  rw [node0090_0411, split_right 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0250_0411, split_left 346 node0250_0346 node0346_0411 (by omega)]
  rw [node0250_0346, split_right 282 block1226 node0282_0346 (by omega)]
  rw [node0282_0346, split_left 314 block1227 block1228 (by omega)]
  exact block1227_get i

theorem block1228_lookup (i : Fin 32) :
    lookup (314 + i.val) = some (values1228[i.val]'(by rw [values1228_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (314 + i.val) = _
  rw [node0090_0411, split_right 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0250_0411, split_left 346 node0250_0346 node0346_0411 (by omega)]
  rw [node0250_0346, split_right 282 block1226 node0282_0346 (by omega)]
  rw [node0282_0346, split_right 314 block1227 block1228 (by omega)]
  exact block1228_get i

theorem block1229_lookup (i : Fin 32) :
    lookup (346 + i.val) = some (values1229[i.val]'(by rw [values1229_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (346 + i.val) = _
  rw [node0090_0411, split_right 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0250_0411, split_right 346 node0250_0346 node0346_0411 (by omega)]
  rw [node0346_0411, split_left 378 block1229 node0378_0411 (by omega)]
  exact block1229_get i

theorem block1230_lookup (i : Fin 32) :
    lookup (378 + i.val) = some (values1230[i.val]'(by rw [values1230_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (378 + i.val) = _
  rw [node0090_0411, split_right 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0250_0411, split_right 346 node0250_0346 node0346_0411 (by omega)]
  rw [node0346_0411, split_right 378 block1229 node0378_0411 (by omega)]
  rw [node0378_0411, split_left 410 block1230 block1231 (by omega)]
  exact block1230_get i

theorem block1231_lookup (i : Fin 1) :
    lookup (410 + i.val) = some (values1231[i.val]'(by rw [values1231_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0090_0411 (410 + i.val) = _
  rw [node0090_0411, split_right 250 node0090_0250 node0250_0411 (by omega)]
  rw [node0250_0411, split_right 346 node0250_0346 node0346_0411 (by omega)]
  rw [node0346_0411, split_right 378 block1229 node0378_0411 (by omega)]
  rw [node0378_0411, split_right 410 block1230 block1231 (by omega)]
  exact block1231_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1221_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1221_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1222_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1222_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1223_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1223_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1224_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1224_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1225_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1225_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1226_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1226_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1227_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1227_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1228_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1228_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1229_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1229_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1230_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1230_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1231_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1231_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1221_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1222_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1223_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1224_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1225_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1226_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1227_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1228_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1229_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1230_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow091.block1231_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow091
