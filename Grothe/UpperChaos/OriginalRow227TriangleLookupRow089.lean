import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1199
import Grothe.UpperChaos.OriginalRow227TriangleData1200
import Grothe.UpperChaos.OriginalRow227TriangleData1201
import Grothe.UpperChaos.OriginalRow227TriangleData1202
import Grothe.UpperChaos.OriginalRow227TriangleData1203
import Grothe.UpperChaos.OriginalRow227TriangleData1204
import Grothe.UpperChaos.OriginalRow227TriangleData1205
import Grothe.UpperChaos.OriginalRow227TriangleData1206
import Grothe.UpperChaos.OriginalRow227TriangleData1207
import Grothe.UpperChaos.OriginalRow227TriangleData1208
import Grothe.UpperChaos.OriginalRow227TriangleData1209

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow089

open ConditionalTableLookup

def values1199 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1199.coefficient89_88,
  OriginalRow227TriangleData1199.coefficient89_89,
  OriginalRow227TriangleData1199.coefficient89_90,
  OriginalRow227TriangleData1199.coefficient89_91,
  OriginalRow227TriangleData1199.coefficient89_92,
  OriginalRow227TriangleData1199.coefficient89_93,
  OriginalRow227TriangleData1199.coefficient89_94,
  OriginalRow227TriangleData1199.coefficient89_95,
  OriginalRow227TriangleData1199.coefficient89_96,
  OriginalRow227TriangleData1199.coefficient89_97,
  OriginalRow227TriangleData1199.coefficient89_98,
  OriginalRow227TriangleData1199.coefficient89_99,
  OriginalRow227TriangleData1199.coefficient89_100,
  OriginalRow227TriangleData1199.coefficient89_101,
  OriginalRow227TriangleData1199.coefficient89_102,
  OriginalRow227TriangleData1199.coefficient89_103,
  OriginalRow227TriangleData1199.coefficient89_104,
  OriginalRow227TriangleData1199.coefficient89_105,
  OriginalRow227TriangleData1199.coefficient89_106,
  OriginalRow227TriangleData1199.coefficient89_107,
  OriginalRow227TriangleData1199.coefficient89_108,
  OriginalRow227TriangleData1199.coefficient89_109,
  OriginalRow227TriangleData1199.coefficient89_110,
  OriginalRow227TriangleData1199.coefficient89_111,
  OriginalRow227TriangleData1199.coefficient89_112,
  OriginalRow227TriangleData1199.coefficient89_113,
  OriginalRow227TriangleData1199.coefficient89_114,
  OriginalRow227TriangleData1199.coefficient89_115,
  OriginalRow227TriangleData1199.coefficient89_116,
  OriginalRow227TriangleData1199.coefficient89_117,
  OriginalRow227TriangleData1199.coefficient89_118,
  OriginalRow227TriangleData1199.coefficient89_119
]

theorem values1199_size : values1199.size = 32 := rfl

def block1199 : ℕ → Option IntervalDyadic := segment 88 values1199

theorem block1199_domain : ExactDomain block1199 88 120 := by
  simpa only [values1199_size] using segment_domain 88 values1199

theorem block1199_get (i : Fin 32) :
    block1199 (88 + i.val) = some (values1199[i.val]'(by rw [values1199_size]; exact i.isLt)) := by
  exact segment_get 88 values1199 ⟨i.val, by rw [values1199_size]; exact i.isLt⟩

def values1200 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1200.coefficient89_120,
  OriginalRow227TriangleData1200.coefficient89_121,
  OriginalRow227TriangleData1200.coefficient89_122,
  OriginalRow227TriangleData1200.coefficient89_123,
  OriginalRow227TriangleData1200.coefficient89_124,
  OriginalRow227TriangleData1200.coefficient89_125,
  OriginalRow227TriangleData1200.coefficient89_126,
  OriginalRow227TriangleData1200.coefficient89_127,
  OriginalRow227TriangleData1200.coefficient89_128,
  OriginalRow227TriangleData1200.coefficient89_129,
  OriginalRow227TriangleData1200.coefficient89_130,
  OriginalRow227TriangleData1200.coefficient89_131,
  OriginalRow227TriangleData1200.coefficient89_132,
  OriginalRow227TriangleData1200.coefficient89_133,
  OriginalRow227TriangleData1200.coefficient89_134,
  OriginalRow227TriangleData1200.coefficient89_135,
  OriginalRow227TriangleData1200.coefficient89_136,
  OriginalRow227TriangleData1200.coefficient89_137,
  OriginalRow227TriangleData1200.coefficient89_138,
  OriginalRow227TriangleData1200.coefficient89_139,
  OriginalRow227TriangleData1200.coefficient89_140,
  OriginalRow227TriangleData1200.coefficient89_141,
  OriginalRow227TriangleData1200.coefficient89_142,
  OriginalRow227TriangleData1200.coefficient89_143,
  OriginalRow227TriangleData1200.coefficient89_144,
  OriginalRow227TriangleData1200.coefficient89_145,
  OriginalRow227TriangleData1200.coefficient89_146,
  OriginalRow227TriangleData1200.coefficient89_147,
  OriginalRow227TriangleData1200.coefficient89_148,
  OriginalRow227TriangleData1200.coefficient89_149,
  OriginalRow227TriangleData1200.coefficient89_150,
  OriginalRow227TriangleData1200.coefficient89_151
]

theorem values1200_size : values1200.size = 32 := rfl

def block1200 : ℕ → Option IntervalDyadic := segment 120 values1200

theorem block1200_domain : ExactDomain block1200 120 152 := by
  simpa only [values1200_size] using segment_domain 120 values1200

theorem block1200_get (i : Fin 32) :
    block1200 (120 + i.val) = some (values1200[i.val]'(by rw [values1200_size]; exact i.isLt)) := by
  exact segment_get 120 values1200 ⟨i.val, by rw [values1200_size]; exact i.isLt⟩

def values1201 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1201.coefficient89_152,
  OriginalRow227TriangleData1201.coefficient89_153,
  OriginalRow227TriangleData1201.coefficient89_154,
  OriginalRow227TriangleData1201.coefficient89_155,
  OriginalRow227TriangleData1201.coefficient89_156,
  OriginalRow227TriangleData1201.coefficient89_157,
  OriginalRow227TriangleData1201.coefficient89_158,
  OriginalRow227TriangleData1201.coefficient89_159,
  OriginalRow227TriangleData1201.coefficient89_160,
  OriginalRow227TriangleData1201.coefficient89_161,
  OriginalRow227TriangleData1201.coefficient89_162,
  OriginalRow227TriangleData1201.coefficient89_163,
  OriginalRow227TriangleData1201.coefficient89_164,
  OriginalRow227TriangleData1201.coefficient89_165,
  OriginalRow227TriangleData1201.coefficient89_166,
  OriginalRow227TriangleData1201.coefficient89_167,
  OriginalRow227TriangleData1201.coefficient89_168,
  OriginalRow227TriangleData1201.coefficient89_169,
  OriginalRow227TriangleData1201.coefficient89_170,
  OriginalRow227TriangleData1201.coefficient89_171,
  OriginalRow227TriangleData1201.coefficient89_172,
  OriginalRow227TriangleData1201.coefficient89_173,
  OriginalRow227TriangleData1201.coefficient89_174,
  OriginalRow227TriangleData1201.coefficient89_175,
  OriginalRow227TriangleData1201.coefficient89_176,
  OriginalRow227TriangleData1201.coefficient89_177,
  OriginalRow227TriangleData1201.coefficient89_178,
  OriginalRow227TriangleData1201.coefficient89_179,
  OriginalRow227TriangleData1201.coefficient89_180,
  OriginalRow227TriangleData1201.coefficient89_181,
  OriginalRow227TriangleData1201.coefficient89_182,
  OriginalRow227TriangleData1201.coefficient89_183
]

theorem values1201_size : values1201.size = 32 := rfl

def block1201 : ℕ → Option IntervalDyadic := segment 152 values1201

theorem block1201_domain : ExactDomain block1201 152 184 := by
  simpa only [values1201_size] using segment_domain 152 values1201

theorem block1201_get (i : Fin 32) :
    block1201 (152 + i.val) = some (values1201[i.val]'(by rw [values1201_size]; exact i.isLt)) := by
  exact segment_get 152 values1201 ⟨i.val, by rw [values1201_size]; exact i.isLt⟩

def values1202 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1202.coefficient89_184,
  OriginalRow227TriangleData1202.coefficient89_185,
  OriginalRow227TriangleData1202.coefficient89_186,
  OriginalRow227TriangleData1202.coefficient89_187,
  OriginalRow227TriangleData1202.coefficient89_188,
  OriginalRow227TriangleData1202.coefficient89_189,
  OriginalRow227TriangleData1202.coefficient89_190,
  OriginalRow227TriangleData1202.coefficient89_191,
  OriginalRow227TriangleData1202.coefficient89_192,
  OriginalRow227TriangleData1202.coefficient89_193,
  OriginalRow227TriangleData1202.coefficient89_194,
  OriginalRow227TriangleData1202.coefficient89_195,
  OriginalRow227TriangleData1202.coefficient89_196,
  OriginalRow227TriangleData1202.coefficient89_197,
  OriginalRow227TriangleData1202.coefficient89_198,
  OriginalRow227TriangleData1202.coefficient89_199,
  OriginalRow227TriangleData1202.coefficient89_200,
  OriginalRow227TriangleData1202.coefficient89_201,
  OriginalRow227TriangleData1202.coefficient89_202,
  OriginalRow227TriangleData1202.coefficient89_203,
  OriginalRow227TriangleData1202.coefficient89_204,
  OriginalRow227TriangleData1202.coefficient89_205,
  OriginalRow227TriangleData1202.coefficient89_206,
  OriginalRow227TriangleData1202.coefficient89_207,
  OriginalRow227TriangleData1202.coefficient89_208,
  OriginalRow227TriangleData1202.coefficient89_209,
  OriginalRow227TriangleData1202.coefficient89_210,
  OriginalRow227TriangleData1202.coefficient89_211,
  OriginalRow227TriangleData1202.coefficient89_212,
  OriginalRow227TriangleData1202.coefficient89_213,
  OriginalRow227TriangleData1202.coefficient89_214,
  OriginalRow227TriangleData1202.coefficient89_215
]

theorem values1202_size : values1202.size = 32 := rfl

def block1202 : ℕ → Option IntervalDyadic := segment 184 values1202

theorem block1202_domain : ExactDomain block1202 184 216 := by
  simpa only [values1202_size] using segment_domain 184 values1202

theorem block1202_get (i : Fin 32) :
    block1202 (184 + i.val) = some (values1202[i.val]'(by rw [values1202_size]; exact i.isLt)) := by
  exact segment_get 184 values1202 ⟨i.val, by rw [values1202_size]; exact i.isLt⟩

def values1203 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1203.coefficient89_216,
  OriginalRow227TriangleData1203.coefficient89_217,
  OriginalRow227TriangleData1203.coefficient89_218,
  OriginalRow227TriangleData1203.coefficient89_219,
  OriginalRow227TriangleData1203.coefficient89_220,
  OriginalRow227TriangleData1203.coefficient89_221,
  OriginalRow227TriangleData1203.coefficient89_222,
  OriginalRow227TriangleData1203.coefficient89_223,
  OriginalRow227TriangleData1203.coefficient89_224,
  OriginalRow227TriangleData1203.coefficient89_225,
  OriginalRow227TriangleData1203.coefficient89_226,
  OriginalRow227TriangleData1203.coefficient89_227,
  OriginalRow227TriangleData1203.coefficient89_228,
  OriginalRow227TriangleData1203.coefficient89_229,
  OriginalRow227TriangleData1203.coefficient89_230,
  OriginalRow227TriangleData1203.coefficient89_231,
  OriginalRow227TriangleData1203.coefficient89_232,
  OriginalRow227TriangleData1203.coefficient89_233,
  OriginalRow227TriangleData1203.coefficient89_234,
  OriginalRow227TriangleData1203.coefficient89_235,
  OriginalRow227TriangleData1203.coefficient89_236,
  OriginalRow227TriangleData1203.coefficient89_237,
  OriginalRow227TriangleData1203.coefficient89_238,
  OriginalRow227TriangleData1203.coefficient89_239,
  OriginalRow227TriangleData1203.coefficient89_240,
  OriginalRow227TriangleData1203.coefficient89_241,
  OriginalRow227TriangleData1203.coefficient89_242,
  OriginalRow227TriangleData1203.coefficient89_243,
  OriginalRow227TriangleData1203.coefficient89_244,
  OriginalRow227TriangleData1203.coefficient89_245,
  OriginalRow227TriangleData1203.coefficient89_246,
  OriginalRow227TriangleData1203.coefficient89_247
]

theorem values1203_size : values1203.size = 32 := rfl

def block1203 : ℕ → Option IntervalDyadic := segment 216 values1203

theorem block1203_domain : ExactDomain block1203 216 248 := by
  simpa only [values1203_size] using segment_domain 216 values1203

theorem block1203_get (i : Fin 32) :
    block1203 (216 + i.val) = some (values1203[i.val]'(by rw [values1203_size]; exact i.isLt)) := by
  exact segment_get 216 values1203 ⟨i.val, by rw [values1203_size]; exact i.isLt⟩

def values1204 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1204.coefficient89_248,
  OriginalRow227TriangleData1204.coefficient89_249,
  OriginalRow227TriangleData1204.coefficient89_250,
  OriginalRow227TriangleData1204.coefficient89_251,
  OriginalRow227TriangleData1204.coefficient89_252,
  OriginalRow227TriangleData1204.coefficient89_253,
  OriginalRow227TriangleData1204.coefficient89_254,
  OriginalRow227TriangleData1204.coefficient89_255,
  OriginalRow227TriangleData1204.coefficient89_256,
  OriginalRow227TriangleData1204.coefficient89_257,
  OriginalRow227TriangleData1204.coefficient89_258,
  OriginalRow227TriangleData1204.coefficient89_259,
  OriginalRow227TriangleData1204.coefficient89_260,
  OriginalRow227TriangleData1204.coefficient89_261,
  OriginalRow227TriangleData1204.coefficient89_262,
  OriginalRow227TriangleData1204.coefficient89_263,
  OriginalRow227TriangleData1204.coefficient89_264,
  OriginalRow227TriangleData1204.coefficient89_265,
  OriginalRow227TriangleData1204.coefficient89_266,
  OriginalRow227TriangleData1204.coefficient89_267,
  OriginalRow227TriangleData1204.coefficient89_268,
  OriginalRow227TriangleData1204.coefficient89_269,
  OriginalRow227TriangleData1204.coefficient89_270,
  OriginalRow227TriangleData1204.coefficient89_271,
  OriginalRow227TriangleData1204.coefficient89_272,
  OriginalRow227TriangleData1204.coefficient89_273,
  OriginalRow227TriangleData1204.coefficient89_274,
  OriginalRow227TriangleData1204.coefficient89_275,
  OriginalRow227TriangleData1204.coefficient89_276,
  OriginalRow227TriangleData1204.coefficient89_277,
  OriginalRow227TriangleData1204.coefficient89_278,
  OriginalRow227TriangleData1204.coefficient89_279
]

theorem values1204_size : values1204.size = 32 := rfl

def block1204 : ℕ → Option IntervalDyadic := segment 248 values1204

theorem block1204_domain : ExactDomain block1204 248 280 := by
  simpa only [values1204_size] using segment_domain 248 values1204

theorem block1204_get (i : Fin 32) :
    block1204 (248 + i.val) = some (values1204[i.val]'(by rw [values1204_size]; exact i.isLt)) := by
  exact segment_get 248 values1204 ⟨i.val, by rw [values1204_size]; exact i.isLt⟩

def values1205 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1205.coefficient89_280,
  OriginalRow227TriangleData1205.coefficient89_281,
  OriginalRow227TriangleData1205.coefficient89_282,
  OriginalRow227TriangleData1205.coefficient89_283,
  OriginalRow227TriangleData1205.coefficient89_284,
  OriginalRow227TriangleData1205.coefficient89_285,
  OriginalRow227TriangleData1205.coefficient89_286,
  OriginalRow227TriangleData1205.coefficient89_287,
  OriginalRow227TriangleData1205.coefficient89_288,
  OriginalRow227TriangleData1205.coefficient89_289,
  OriginalRow227TriangleData1205.coefficient89_290,
  OriginalRow227TriangleData1205.coefficient89_291,
  OriginalRow227TriangleData1205.coefficient89_292,
  OriginalRow227TriangleData1205.coefficient89_293,
  OriginalRow227TriangleData1205.coefficient89_294,
  OriginalRow227TriangleData1205.coefficient89_295,
  OriginalRow227TriangleData1205.coefficient89_296,
  OriginalRow227TriangleData1205.coefficient89_297,
  OriginalRow227TriangleData1205.coefficient89_298,
  OriginalRow227TriangleData1205.coefficient89_299,
  OriginalRow227TriangleData1205.coefficient89_300,
  OriginalRow227TriangleData1205.coefficient89_301,
  OriginalRow227TriangleData1205.coefficient89_302,
  OriginalRow227TriangleData1205.coefficient89_303,
  OriginalRow227TriangleData1205.coefficient89_304,
  OriginalRow227TriangleData1205.coefficient89_305,
  OriginalRow227TriangleData1205.coefficient89_306,
  OriginalRow227TriangleData1205.coefficient89_307,
  OriginalRow227TriangleData1205.coefficient89_308,
  OriginalRow227TriangleData1205.coefficient89_309,
  OriginalRow227TriangleData1205.coefficient89_310,
  OriginalRow227TriangleData1205.coefficient89_311
]

theorem values1205_size : values1205.size = 32 := rfl

def block1205 : ℕ → Option IntervalDyadic := segment 280 values1205

theorem block1205_domain : ExactDomain block1205 280 312 := by
  simpa only [values1205_size] using segment_domain 280 values1205

theorem block1205_get (i : Fin 32) :
    block1205 (280 + i.val) = some (values1205[i.val]'(by rw [values1205_size]; exact i.isLt)) := by
  exact segment_get 280 values1205 ⟨i.val, by rw [values1205_size]; exact i.isLt⟩

def values1206 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1206.coefficient89_312,
  OriginalRow227TriangleData1206.coefficient89_313,
  OriginalRow227TriangleData1206.coefficient89_314,
  OriginalRow227TriangleData1206.coefficient89_315,
  OriginalRow227TriangleData1206.coefficient89_316,
  OriginalRow227TriangleData1206.coefficient89_317,
  OriginalRow227TriangleData1206.coefficient89_318,
  OriginalRow227TriangleData1206.coefficient89_319,
  OriginalRow227TriangleData1206.coefficient89_320,
  OriginalRow227TriangleData1206.coefficient89_321,
  OriginalRow227TriangleData1206.coefficient89_322,
  OriginalRow227TriangleData1206.coefficient89_323,
  OriginalRow227TriangleData1206.coefficient89_324,
  OriginalRow227TriangleData1206.coefficient89_325,
  OriginalRow227TriangleData1206.coefficient89_326,
  OriginalRow227TriangleData1206.coefficient89_327,
  OriginalRow227TriangleData1206.coefficient89_328,
  OriginalRow227TriangleData1206.coefficient89_329,
  OriginalRow227TriangleData1206.coefficient89_330,
  OriginalRow227TriangleData1206.coefficient89_331,
  OriginalRow227TriangleData1206.coefficient89_332,
  OriginalRow227TriangleData1206.coefficient89_333,
  OriginalRow227TriangleData1206.coefficient89_334,
  OriginalRow227TriangleData1206.coefficient89_335,
  OriginalRow227TriangleData1206.coefficient89_336,
  OriginalRow227TriangleData1206.coefficient89_337,
  OriginalRow227TriangleData1206.coefficient89_338,
  OriginalRow227TriangleData1206.coefficient89_339,
  OriginalRow227TriangleData1206.coefficient89_340,
  OriginalRow227TriangleData1206.coefficient89_341,
  OriginalRow227TriangleData1206.coefficient89_342,
  OriginalRow227TriangleData1206.coefficient89_343
]

theorem values1206_size : values1206.size = 32 := rfl

def block1206 : ℕ → Option IntervalDyadic := segment 312 values1206

theorem block1206_domain : ExactDomain block1206 312 344 := by
  simpa only [values1206_size] using segment_domain 312 values1206

theorem block1206_get (i : Fin 32) :
    block1206 (312 + i.val) = some (values1206[i.val]'(by rw [values1206_size]; exact i.isLt)) := by
  exact segment_get 312 values1206 ⟨i.val, by rw [values1206_size]; exact i.isLt⟩

def values1207 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1207.coefficient89_344,
  OriginalRow227TriangleData1207.coefficient89_345,
  OriginalRow227TriangleData1207.coefficient89_346,
  OriginalRow227TriangleData1207.coefficient89_347,
  OriginalRow227TriangleData1207.coefficient89_348,
  OriginalRow227TriangleData1207.coefficient89_349,
  OriginalRow227TriangleData1207.coefficient89_350,
  OriginalRow227TriangleData1207.coefficient89_351,
  OriginalRow227TriangleData1207.coefficient89_352,
  OriginalRow227TriangleData1207.coefficient89_353,
  OriginalRow227TriangleData1207.coefficient89_354,
  OriginalRow227TriangleData1207.coefficient89_355,
  OriginalRow227TriangleData1207.coefficient89_356,
  OriginalRow227TriangleData1207.coefficient89_357,
  OriginalRow227TriangleData1207.coefficient89_358,
  OriginalRow227TriangleData1207.coefficient89_359,
  OriginalRow227TriangleData1207.coefficient89_360,
  OriginalRow227TriangleData1207.coefficient89_361,
  OriginalRow227TriangleData1207.coefficient89_362,
  OriginalRow227TriangleData1207.coefficient89_363,
  OriginalRow227TriangleData1207.coefficient89_364,
  OriginalRow227TriangleData1207.coefficient89_365,
  OriginalRow227TriangleData1207.coefficient89_366,
  OriginalRow227TriangleData1207.coefficient89_367,
  OriginalRow227TriangleData1207.coefficient89_368,
  OriginalRow227TriangleData1207.coefficient89_369,
  OriginalRow227TriangleData1207.coefficient89_370,
  OriginalRow227TriangleData1207.coefficient89_371,
  OriginalRow227TriangleData1207.coefficient89_372,
  OriginalRow227TriangleData1207.coefficient89_373,
  OriginalRow227TriangleData1207.coefficient89_374,
  OriginalRow227TriangleData1207.coefficient89_375
]

theorem values1207_size : values1207.size = 32 := rfl

def block1207 : ℕ → Option IntervalDyadic := segment 344 values1207

theorem block1207_domain : ExactDomain block1207 344 376 := by
  simpa only [values1207_size] using segment_domain 344 values1207

theorem block1207_get (i : Fin 32) :
    block1207 (344 + i.val) = some (values1207[i.val]'(by rw [values1207_size]; exact i.isLt)) := by
  exact segment_get 344 values1207 ⟨i.val, by rw [values1207_size]; exact i.isLt⟩

def values1208 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1208.coefficient89_376,
  OriginalRow227TriangleData1208.coefficient89_377,
  OriginalRow227TriangleData1208.coefficient89_378,
  OriginalRow227TriangleData1208.coefficient89_379,
  OriginalRow227TriangleData1208.coefficient89_380,
  OriginalRow227TriangleData1208.coefficient89_381,
  OriginalRow227TriangleData1208.coefficient89_382,
  OriginalRow227TriangleData1208.coefficient89_383,
  OriginalRow227TriangleData1208.coefficient89_384,
  OriginalRow227TriangleData1208.coefficient89_385,
  OriginalRow227TriangleData1208.coefficient89_386,
  OriginalRow227TriangleData1208.coefficient89_387,
  OriginalRow227TriangleData1208.coefficient89_388,
  OriginalRow227TriangleData1208.coefficient89_389,
  OriginalRow227TriangleData1208.coefficient89_390,
  OriginalRow227TriangleData1208.coefficient89_391,
  OriginalRow227TriangleData1208.coefficient89_392,
  OriginalRow227TriangleData1208.coefficient89_393,
  OriginalRow227TriangleData1208.coefficient89_394,
  OriginalRow227TriangleData1208.coefficient89_395,
  OriginalRow227TriangleData1208.coefficient89_396,
  OriginalRow227TriangleData1208.coefficient89_397,
  OriginalRow227TriangleData1208.coefficient89_398,
  OriginalRow227TriangleData1208.coefficient89_399,
  OriginalRow227TriangleData1208.coefficient89_400,
  OriginalRow227TriangleData1208.coefficient89_401,
  OriginalRow227TriangleData1208.coefficient89_402,
  OriginalRow227TriangleData1208.coefficient89_403,
  OriginalRow227TriangleData1208.coefficient89_404,
  OriginalRow227TriangleData1208.coefficient89_405,
  OriginalRow227TriangleData1208.coefficient89_406,
  OriginalRow227TriangleData1208.coefficient89_407
]

theorem values1208_size : values1208.size = 32 := rfl

def block1208 : ℕ → Option IntervalDyadic := segment 376 values1208

theorem block1208_domain : ExactDomain block1208 376 408 := by
  simpa only [values1208_size] using segment_domain 376 values1208

theorem block1208_get (i : Fin 32) :
    block1208 (376 + i.val) = some (values1208[i.val]'(by rw [values1208_size]; exact i.isLt)) := by
  exact segment_get 376 values1208 ⟨i.val, by rw [values1208_size]; exact i.isLt⟩

def values1209 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1209.coefficient89_408,
  OriginalRow227TriangleData1209.coefficient89_409,
  OriginalRow227TriangleData1209.coefficient89_410,
  OriginalRow227TriangleData1209.coefficient89_411,
  OriginalRow227TriangleData1209.coefficient89_412
]

theorem values1209_size : values1209.size = 5 := rfl

def block1209 : ℕ → Option IntervalDyadic := segment 408 values1209

theorem block1209_domain : ExactDomain block1209 408 413 := by
  simpa only [values1209_size] using segment_domain 408 values1209

theorem block1209_get (i : Fin 5) :
    block1209 (408 + i.val) = some (values1209[i.val]'(by rw [values1209_size]; exact i.isLt)) := by
  exact segment_get 408 values1209 ⟨i.val, by rw [values1209_size]; exact i.isLt⟩

def node0088_0152 : ℕ → Option IntervalDyadic := split 120 block1199 block1200

theorem node0088_0152_domain : ExactDomain node0088_0152 88 152 := by
  exact split_domain (by decide) (by decide) block1199_domain block1200_domain

def node0184_0248 : ℕ → Option IntervalDyadic := split 216 block1202 block1203

theorem node0184_0248_domain : ExactDomain node0184_0248 184 248 := by
  exact split_domain (by decide) (by decide) block1202_domain block1203_domain

def node0152_0248 : ℕ → Option IntervalDyadic := split 184 block1201 node0184_0248

theorem node0152_0248_domain : ExactDomain node0152_0248 152 248 := by
  exact split_domain (by decide) (by decide) block1201_domain node0184_0248_domain

def node0088_0248 : ℕ → Option IntervalDyadic := split 152 node0088_0152 node0152_0248

theorem node0088_0248_domain : ExactDomain node0088_0248 88 248 := by
  exact split_domain (by decide) (by decide) node0088_0152_domain node0152_0248_domain

def node0280_0344 : ℕ → Option IntervalDyadic := split 312 block1205 block1206

theorem node0280_0344_domain : ExactDomain node0280_0344 280 344 := by
  exact split_domain (by decide) (by decide) block1205_domain block1206_domain

def node0248_0344 : ℕ → Option IntervalDyadic := split 280 block1204 node0280_0344

theorem node0248_0344_domain : ExactDomain node0248_0344 248 344 := by
  exact split_domain (by decide) (by decide) block1204_domain node0280_0344_domain

def node0376_0413 : ℕ → Option IntervalDyadic := split 408 block1208 block1209

theorem node0376_0413_domain : ExactDomain node0376_0413 376 413 := by
  exact split_domain (by decide) (by decide) block1208_domain block1209_domain

def node0344_0413 : ℕ → Option IntervalDyadic := split 376 block1207 node0376_0413

theorem node0344_0413_domain : ExactDomain node0344_0413 344 413 := by
  exact split_domain (by decide) (by decide) block1207_domain node0376_0413_domain

def node0248_0413 : ℕ → Option IntervalDyadic := split 344 node0248_0344 node0344_0413

theorem node0248_0413_domain : ExactDomain node0248_0413 248 413 := by
  exact split_domain (by decide) (by decide) node0248_0344_domain node0344_0413_domain

def node0088_0413 : ℕ → Option IntervalDyadic := split 248 node0088_0248 node0248_0413

theorem node0088_0413_domain : ExactDomain node0088_0413 88 413 := by
  exact split_domain (by decide) (by decide) node0088_0248_domain node0248_0413_domain

def lookup : ℕ → Option IntervalDyadic := node0088_0413

theorem lookup_domain : ExactDomain lookup 88 413 :=
  node0088_0413_domain

theorem block1199_lookup (i : Fin 32) :
    lookup (88 + i.val) = some (values1199[i.val]'(by rw [values1199_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (88 + i.val) = _
  rw [node0088_0413, split_left 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0088_0248, split_left 152 node0088_0152 node0152_0248 (by omega)]
  rw [node0088_0152, split_left 120 block1199 block1200 (by omega)]
  exact block1199_get i

theorem block1200_lookup (i : Fin 32) :
    lookup (120 + i.val) = some (values1200[i.val]'(by rw [values1200_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (120 + i.val) = _
  rw [node0088_0413, split_left 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0088_0248, split_left 152 node0088_0152 node0152_0248 (by omega)]
  rw [node0088_0152, split_right 120 block1199 block1200 (by omega)]
  exact block1200_get i

theorem block1201_lookup (i : Fin 32) :
    lookup (152 + i.val) = some (values1201[i.val]'(by rw [values1201_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (152 + i.val) = _
  rw [node0088_0413, split_left 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0088_0248, split_right 152 node0088_0152 node0152_0248 (by omega)]
  rw [node0152_0248, split_left 184 block1201 node0184_0248 (by omega)]
  exact block1201_get i

theorem block1202_lookup (i : Fin 32) :
    lookup (184 + i.val) = some (values1202[i.val]'(by rw [values1202_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (184 + i.val) = _
  rw [node0088_0413, split_left 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0088_0248, split_right 152 node0088_0152 node0152_0248 (by omega)]
  rw [node0152_0248, split_right 184 block1201 node0184_0248 (by omega)]
  rw [node0184_0248, split_left 216 block1202 block1203 (by omega)]
  exact block1202_get i

theorem block1203_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values1203[i.val]'(by rw [values1203_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (216 + i.val) = _
  rw [node0088_0413, split_left 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0088_0248, split_right 152 node0088_0152 node0152_0248 (by omega)]
  rw [node0152_0248, split_right 184 block1201 node0184_0248 (by omega)]
  rw [node0184_0248, split_right 216 block1202 block1203 (by omega)]
  exact block1203_get i

theorem block1204_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values1204[i.val]'(by rw [values1204_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (248 + i.val) = _
  rw [node0088_0413, split_right 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0248_0413, split_left 344 node0248_0344 node0344_0413 (by omega)]
  rw [node0248_0344, split_left 280 block1204 node0280_0344 (by omega)]
  exact block1204_get i

theorem block1205_lookup (i : Fin 32) :
    lookup (280 + i.val) = some (values1205[i.val]'(by rw [values1205_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (280 + i.val) = _
  rw [node0088_0413, split_right 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0248_0413, split_left 344 node0248_0344 node0344_0413 (by omega)]
  rw [node0248_0344, split_right 280 block1204 node0280_0344 (by omega)]
  rw [node0280_0344, split_left 312 block1205 block1206 (by omega)]
  exact block1205_get i

theorem block1206_lookup (i : Fin 32) :
    lookup (312 + i.val) = some (values1206[i.val]'(by rw [values1206_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (312 + i.val) = _
  rw [node0088_0413, split_right 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0248_0413, split_left 344 node0248_0344 node0344_0413 (by omega)]
  rw [node0248_0344, split_right 280 block1204 node0280_0344 (by omega)]
  rw [node0280_0344, split_right 312 block1205 block1206 (by omega)]
  exact block1206_get i

theorem block1207_lookup (i : Fin 32) :
    lookup (344 + i.val) = some (values1207[i.val]'(by rw [values1207_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (344 + i.val) = _
  rw [node0088_0413, split_right 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0248_0413, split_right 344 node0248_0344 node0344_0413 (by omega)]
  rw [node0344_0413, split_left 376 block1207 node0376_0413 (by omega)]
  exact block1207_get i

theorem block1208_lookup (i : Fin 32) :
    lookup (376 + i.val) = some (values1208[i.val]'(by rw [values1208_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (376 + i.val) = _
  rw [node0088_0413, split_right 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0248_0413, split_right 344 node0248_0344 node0344_0413 (by omega)]
  rw [node0344_0413, split_right 376 block1207 node0376_0413 (by omega)]
  rw [node0376_0413, split_left 408 block1208 block1209 (by omega)]
  exact block1208_get i

theorem block1209_lookup (i : Fin 5) :
    lookup (408 + i.val) = some (values1209[i.val]'(by rw [values1209_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0088_0413 (408 + i.val) = _
  rw [node0088_0413, split_right 248 node0088_0248 node0248_0413 (by omega)]
  rw [node0248_0413, split_right 344 node0248_0344 node0344_0413 (by omega)]
  rw [node0344_0413, split_right 376 block1207 node0376_0413 (by omega)]
  rw [node0376_0413, split_right 408 block1208 block1209 (by omega)]
  exact block1209_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1199_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1199_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1200_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1200_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1201_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1201_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1202_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1202_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1203_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1203_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1204_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1204_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1205_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1205_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1206_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1206_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1207_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1207_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1208_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1208_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1209_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1209_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1199_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1200_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1201_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1202_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1203_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1204_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1205_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1206_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1207_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1208_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow089.block1209_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow089
