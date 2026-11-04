import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1144
import Grothe.UpperChaos.OriginalRow227TriangleData1145
import Grothe.UpperChaos.OriginalRow227TriangleData1146
import Grothe.UpperChaos.OriginalRow227TriangleData1147
import Grothe.UpperChaos.OriginalRow227TriangleData1148
import Grothe.UpperChaos.OriginalRow227TriangleData1149
import Grothe.UpperChaos.OriginalRow227TriangleData1150
import Grothe.UpperChaos.OriginalRow227TriangleData1151
import Grothe.UpperChaos.OriginalRow227TriangleData1152
import Grothe.UpperChaos.OriginalRow227TriangleData1153
import Grothe.UpperChaos.OriginalRow227TriangleData1154

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow084

open ConditionalTableLookup

def values1144 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1144.coefficient84_83,
  OriginalRow227TriangleData1144.coefficient84_84,
  OriginalRow227TriangleData1144.coefficient84_85,
  OriginalRow227TriangleData1144.coefficient84_86,
  OriginalRow227TriangleData1144.coefficient84_87,
  OriginalRow227TriangleData1144.coefficient84_88,
  OriginalRow227TriangleData1144.coefficient84_89,
  OriginalRow227TriangleData1144.coefficient84_90,
  OriginalRow227TriangleData1144.coefficient84_91,
  OriginalRow227TriangleData1144.coefficient84_92,
  OriginalRow227TriangleData1144.coefficient84_93,
  OriginalRow227TriangleData1144.coefficient84_94,
  OriginalRow227TriangleData1144.coefficient84_95,
  OriginalRow227TriangleData1144.coefficient84_96,
  OriginalRow227TriangleData1144.coefficient84_97,
  OriginalRow227TriangleData1144.coefficient84_98,
  OriginalRow227TriangleData1144.coefficient84_99,
  OriginalRow227TriangleData1144.coefficient84_100,
  OriginalRow227TriangleData1144.coefficient84_101,
  OriginalRow227TriangleData1144.coefficient84_102,
  OriginalRow227TriangleData1144.coefficient84_103,
  OriginalRow227TriangleData1144.coefficient84_104,
  OriginalRow227TriangleData1144.coefficient84_105,
  OriginalRow227TriangleData1144.coefficient84_106,
  OriginalRow227TriangleData1144.coefficient84_107,
  OriginalRow227TriangleData1144.coefficient84_108,
  OriginalRow227TriangleData1144.coefficient84_109,
  OriginalRow227TriangleData1144.coefficient84_110,
  OriginalRow227TriangleData1144.coefficient84_111,
  OriginalRow227TriangleData1144.coefficient84_112,
  OriginalRow227TriangleData1144.coefficient84_113,
  OriginalRow227TriangleData1144.coefficient84_114
]

theorem values1144_size : values1144.size = 32 := rfl

def block1144 : ℕ → Option IntervalDyadic := segment 83 values1144

theorem block1144_domain : ExactDomain block1144 83 115 := by
  simpa only [values1144_size] using segment_domain 83 values1144

theorem block1144_get (i : Fin 32) :
    block1144 (83 + i.val) = some (values1144[i.val]'(by rw [values1144_size]; exact i.isLt)) := by
  exact segment_get 83 values1144 ⟨i.val, by rw [values1144_size]; exact i.isLt⟩

def values1145 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1145.coefficient84_115,
  OriginalRow227TriangleData1145.coefficient84_116,
  OriginalRow227TriangleData1145.coefficient84_117,
  OriginalRow227TriangleData1145.coefficient84_118,
  OriginalRow227TriangleData1145.coefficient84_119,
  OriginalRow227TriangleData1145.coefficient84_120,
  OriginalRow227TriangleData1145.coefficient84_121,
  OriginalRow227TriangleData1145.coefficient84_122,
  OriginalRow227TriangleData1145.coefficient84_123,
  OriginalRow227TriangleData1145.coefficient84_124,
  OriginalRow227TriangleData1145.coefficient84_125,
  OriginalRow227TriangleData1145.coefficient84_126,
  OriginalRow227TriangleData1145.coefficient84_127,
  OriginalRow227TriangleData1145.coefficient84_128,
  OriginalRow227TriangleData1145.coefficient84_129,
  OriginalRow227TriangleData1145.coefficient84_130,
  OriginalRow227TriangleData1145.coefficient84_131,
  OriginalRow227TriangleData1145.coefficient84_132,
  OriginalRow227TriangleData1145.coefficient84_133,
  OriginalRow227TriangleData1145.coefficient84_134,
  OriginalRow227TriangleData1145.coefficient84_135,
  OriginalRow227TriangleData1145.coefficient84_136,
  OriginalRow227TriangleData1145.coefficient84_137,
  OriginalRow227TriangleData1145.coefficient84_138,
  OriginalRow227TriangleData1145.coefficient84_139,
  OriginalRow227TriangleData1145.coefficient84_140,
  OriginalRow227TriangleData1145.coefficient84_141,
  OriginalRow227TriangleData1145.coefficient84_142,
  OriginalRow227TriangleData1145.coefficient84_143,
  OriginalRow227TriangleData1145.coefficient84_144,
  OriginalRow227TriangleData1145.coefficient84_145,
  OriginalRow227TriangleData1145.coefficient84_146
]

theorem values1145_size : values1145.size = 32 := rfl

def block1145 : ℕ → Option IntervalDyadic := segment 115 values1145

theorem block1145_domain : ExactDomain block1145 115 147 := by
  simpa only [values1145_size] using segment_domain 115 values1145

theorem block1145_get (i : Fin 32) :
    block1145 (115 + i.val) = some (values1145[i.val]'(by rw [values1145_size]; exact i.isLt)) := by
  exact segment_get 115 values1145 ⟨i.val, by rw [values1145_size]; exact i.isLt⟩

def values1146 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1146.coefficient84_147,
  OriginalRow227TriangleData1146.coefficient84_148,
  OriginalRow227TriangleData1146.coefficient84_149,
  OriginalRow227TriangleData1146.coefficient84_150,
  OriginalRow227TriangleData1146.coefficient84_151,
  OriginalRow227TriangleData1146.coefficient84_152,
  OriginalRow227TriangleData1146.coefficient84_153,
  OriginalRow227TriangleData1146.coefficient84_154,
  OriginalRow227TriangleData1146.coefficient84_155,
  OriginalRow227TriangleData1146.coefficient84_156,
  OriginalRow227TriangleData1146.coefficient84_157,
  OriginalRow227TriangleData1146.coefficient84_158,
  OriginalRow227TriangleData1146.coefficient84_159,
  OriginalRow227TriangleData1146.coefficient84_160,
  OriginalRow227TriangleData1146.coefficient84_161,
  OriginalRow227TriangleData1146.coefficient84_162,
  OriginalRow227TriangleData1146.coefficient84_163,
  OriginalRow227TriangleData1146.coefficient84_164,
  OriginalRow227TriangleData1146.coefficient84_165,
  OriginalRow227TriangleData1146.coefficient84_166,
  OriginalRow227TriangleData1146.coefficient84_167,
  OriginalRow227TriangleData1146.coefficient84_168,
  OriginalRow227TriangleData1146.coefficient84_169,
  OriginalRow227TriangleData1146.coefficient84_170,
  OriginalRow227TriangleData1146.coefficient84_171,
  OriginalRow227TriangleData1146.coefficient84_172,
  OriginalRow227TriangleData1146.coefficient84_173,
  OriginalRow227TriangleData1146.coefficient84_174,
  OriginalRow227TriangleData1146.coefficient84_175,
  OriginalRow227TriangleData1146.coefficient84_176,
  OriginalRow227TriangleData1146.coefficient84_177,
  OriginalRow227TriangleData1146.coefficient84_178
]

theorem values1146_size : values1146.size = 32 := rfl

def block1146 : ℕ → Option IntervalDyadic := segment 147 values1146

theorem block1146_domain : ExactDomain block1146 147 179 := by
  simpa only [values1146_size] using segment_domain 147 values1146

theorem block1146_get (i : Fin 32) :
    block1146 (147 + i.val) = some (values1146[i.val]'(by rw [values1146_size]; exact i.isLt)) := by
  exact segment_get 147 values1146 ⟨i.val, by rw [values1146_size]; exact i.isLt⟩

def values1147 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1147.coefficient84_179,
  OriginalRow227TriangleData1147.coefficient84_180,
  OriginalRow227TriangleData1147.coefficient84_181,
  OriginalRow227TriangleData1147.coefficient84_182,
  OriginalRow227TriangleData1147.coefficient84_183,
  OriginalRow227TriangleData1147.coefficient84_184,
  OriginalRow227TriangleData1147.coefficient84_185,
  OriginalRow227TriangleData1147.coefficient84_186,
  OriginalRow227TriangleData1147.coefficient84_187,
  OriginalRow227TriangleData1147.coefficient84_188,
  OriginalRow227TriangleData1147.coefficient84_189,
  OriginalRow227TriangleData1147.coefficient84_190,
  OriginalRow227TriangleData1147.coefficient84_191,
  OriginalRow227TriangleData1147.coefficient84_192,
  OriginalRow227TriangleData1147.coefficient84_193,
  OriginalRow227TriangleData1147.coefficient84_194,
  OriginalRow227TriangleData1147.coefficient84_195,
  OriginalRow227TriangleData1147.coefficient84_196,
  OriginalRow227TriangleData1147.coefficient84_197,
  OriginalRow227TriangleData1147.coefficient84_198,
  OriginalRow227TriangleData1147.coefficient84_199,
  OriginalRow227TriangleData1147.coefficient84_200,
  OriginalRow227TriangleData1147.coefficient84_201,
  OriginalRow227TriangleData1147.coefficient84_202,
  OriginalRow227TriangleData1147.coefficient84_203,
  OriginalRow227TriangleData1147.coefficient84_204,
  OriginalRow227TriangleData1147.coefficient84_205,
  OriginalRow227TriangleData1147.coefficient84_206,
  OriginalRow227TriangleData1147.coefficient84_207,
  OriginalRow227TriangleData1147.coefficient84_208,
  OriginalRow227TriangleData1147.coefficient84_209,
  OriginalRow227TriangleData1147.coefficient84_210
]

theorem values1147_size : values1147.size = 32 := rfl

def block1147 : ℕ → Option IntervalDyadic := segment 179 values1147

theorem block1147_domain : ExactDomain block1147 179 211 := by
  simpa only [values1147_size] using segment_domain 179 values1147

theorem block1147_get (i : Fin 32) :
    block1147 (179 + i.val) = some (values1147[i.val]'(by rw [values1147_size]; exact i.isLt)) := by
  exact segment_get 179 values1147 ⟨i.val, by rw [values1147_size]; exact i.isLt⟩

def values1148 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1148.coefficient84_211,
  OriginalRow227TriangleData1148.coefficient84_212,
  OriginalRow227TriangleData1148.coefficient84_213,
  OriginalRow227TriangleData1148.coefficient84_214,
  OriginalRow227TriangleData1148.coefficient84_215,
  OriginalRow227TriangleData1148.coefficient84_216,
  OriginalRow227TriangleData1148.coefficient84_217,
  OriginalRow227TriangleData1148.coefficient84_218,
  OriginalRow227TriangleData1148.coefficient84_219,
  OriginalRow227TriangleData1148.coefficient84_220,
  OriginalRow227TriangleData1148.coefficient84_221,
  OriginalRow227TriangleData1148.coefficient84_222,
  OriginalRow227TriangleData1148.coefficient84_223,
  OriginalRow227TriangleData1148.coefficient84_224,
  OriginalRow227TriangleData1148.coefficient84_225,
  OriginalRow227TriangleData1148.coefficient84_226,
  OriginalRow227TriangleData1148.coefficient84_227,
  OriginalRow227TriangleData1148.coefficient84_228,
  OriginalRow227TriangleData1148.coefficient84_229,
  OriginalRow227TriangleData1148.coefficient84_230,
  OriginalRow227TriangleData1148.coefficient84_231,
  OriginalRow227TriangleData1148.coefficient84_232,
  OriginalRow227TriangleData1148.coefficient84_233,
  OriginalRow227TriangleData1148.coefficient84_234,
  OriginalRow227TriangleData1148.coefficient84_235,
  OriginalRow227TriangleData1148.coefficient84_236,
  OriginalRow227TriangleData1148.coefficient84_237,
  OriginalRow227TriangleData1148.coefficient84_238,
  OriginalRow227TriangleData1148.coefficient84_239,
  OriginalRow227TriangleData1148.coefficient84_240,
  OriginalRow227TriangleData1148.coefficient84_241,
  OriginalRow227TriangleData1148.coefficient84_242
]

theorem values1148_size : values1148.size = 32 := rfl

def block1148 : ℕ → Option IntervalDyadic := segment 211 values1148

theorem block1148_domain : ExactDomain block1148 211 243 := by
  simpa only [values1148_size] using segment_domain 211 values1148

theorem block1148_get (i : Fin 32) :
    block1148 (211 + i.val) = some (values1148[i.val]'(by rw [values1148_size]; exact i.isLt)) := by
  exact segment_get 211 values1148 ⟨i.val, by rw [values1148_size]; exact i.isLt⟩

def values1149 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1149.coefficient84_243,
  OriginalRow227TriangleData1149.coefficient84_244,
  OriginalRow227TriangleData1149.coefficient84_245,
  OriginalRow227TriangleData1149.coefficient84_246,
  OriginalRow227TriangleData1149.coefficient84_247,
  OriginalRow227TriangleData1149.coefficient84_248,
  OriginalRow227TriangleData1149.coefficient84_249,
  OriginalRow227TriangleData1149.coefficient84_250,
  OriginalRow227TriangleData1149.coefficient84_251,
  OriginalRow227TriangleData1149.coefficient84_252,
  OriginalRow227TriangleData1149.coefficient84_253,
  OriginalRow227TriangleData1149.coefficient84_254,
  OriginalRow227TriangleData1149.coefficient84_255,
  OriginalRow227TriangleData1149.coefficient84_256,
  OriginalRow227TriangleData1149.coefficient84_257,
  OriginalRow227TriangleData1149.coefficient84_258,
  OriginalRow227TriangleData1149.coefficient84_259,
  OriginalRow227TriangleData1149.coefficient84_260,
  OriginalRow227TriangleData1149.coefficient84_261,
  OriginalRow227TriangleData1149.coefficient84_262,
  OriginalRow227TriangleData1149.coefficient84_263,
  OriginalRow227TriangleData1149.coefficient84_264,
  OriginalRow227TriangleData1149.coefficient84_265,
  OriginalRow227TriangleData1149.coefficient84_266,
  OriginalRow227TriangleData1149.coefficient84_267,
  OriginalRow227TriangleData1149.coefficient84_268,
  OriginalRow227TriangleData1149.coefficient84_269,
  OriginalRow227TriangleData1149.coefficient84_270,
  OriginalRow227TriangleData1149.coefficient84_271,
  OriginalRow227TriangleData1149.coefficient84_272,
  OriginalRow227TriangleData1149.coefficient84_273,
  OriginalRow227TriangleData1149.coefficient84_274
]

theorem values1149_size : values1149.size = 32 := rfl

def block1149 : ℕ → Option IntervalDyadic := segment 243 values1149

theorem block1149_domain : ExactDomain block1149 243 275 := by
  simpa only [values1149_size] using segment_domain 243 values1149

theorem block1149_get (i : Fin 32) :
    block1149 (243 + i.val) = some (values1149[i.val]'(by rw [values1149_size]; exact i.isLt)) := by
  exact segment_get 243 values1149 ⟨i.val, by rw [values1149_size]; exact i.isLt⟩

def values1150 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1150.coefficient84_275,
  OriginalRow227TriangleData1150.coefficient84_276,
  OriginalRow227TriangleData1150.coefficient84_277,
  OriginalRow227TriangleData1150.coefficient84_278,
  OriginalRow227TriangleData1150.coefficient84_279,
  OriginalRow227TriangleData1150.coefficient84_280,
  OriginalRow227TriangleData1150.coefficient84_281,
  OriginalRow227TriangleData1150.coefficient84_282,
  OriginalRow227TriangleData1150.coefficient84_283,
  OriginalRow227TriangleData1150.coefficient84_284,
  OriginalRow227TriangleData1150.coefficient84_285,
  OriginalRow227TriangleData1150.coefficient84_286,
  OriginalRow227TriangleData1150.coefficient84_287,
  OriginalRow227TriangleData1150.coefficient84_288,
  OriginalRow227TriangleData1150.coefficient84_289,
  OriginalRow227TriangleData1150.coefficient84_290,
  OriginalRow227TriangleData1150.coefficient84_291,
  OriginalRow227TriangleData1150.coefficient84_292,
  OriginalRow227TriangleData1150.coefficient84_293,
  OriginalRow227TriangleData1150.coefficient84_294,
  OriginalRow227TriangleData1150.coefficient84_295,
  OriginalRow227TriangleData1150.coefficient84_296,
  OriginalRow227TriangleData1150.coefficient84_297,
  OriginalRow227TriangleData1150.coefficient84_298,
  OriginalRow227TriangleData1150.coefficient84_299,
  OriginalRow227TriangleData1150.coefficient84_300,
  OriginalRow227TriangleData1150.coefficient84_301,
  OriginalRow227TriangleData1150.coefficient84_302,
  OriginalRow227TriangleData1150.coefficient84_303,
  OriginalRow227TriangleData1150.coefficient84_304,
  OriginalRow227TriangleData1150.coefficient84_305,
  OriginalRow227TriangleData1150.coefficient84_306
]

theorem values1150_size : values1150.size = 32 := rfl

def block1150 : ℕ → Option IntervalDyadic := segment 275 values1150

theorem block1150_domain : ExactDomain block1150 275 307 := by
  simpa only [values1150_size] using segment_domain 275 values1150

theorem block1150_get (i : Fin 32) :
    block1150 (275 + i.val) = some (values1150[i.val]'(by rw [values1150_size]; exact i.isLt)) := by
  exact segment_get 275 values1150 ⟨i.val, by rw [values1150_size]; exact i.isLt⟩

def values1151 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1151.coefficient84_307,
  OriginalRow227TriangleData1151.coefficient84_308,
  OriginalRow227TriangleData1151.coefficient84_309,
  OriginalRow227TriangleData1151.coefficient84_310,
  OriginalRow227TriangleData1151.coefficient84_311,
  OriginalRow227TriangleData1151.coefficient84_312,
  OriginalRow227TriangleData1151.coefficient84_313,
  OriginalRow227TriangleData1151.coefficient84_314,
  OriginalRow227TriangleData1151.coefficient84_315,
  OriginalRow227TriangleData1151.coefficient84_316,
  OriginalRow227TriangleData1151.coefficient84_317,
  OriginalRow227TriangleData1151.coefficient84_318,
  OriginalRow227TriangleData1151.coefficient84_319,
  OriginalRow227TriangleData1151.coefficient84_320,
  OriginalRow227TriangleData1151.coefficient84_321,
  OriginalRow227TriangleData1151.coefficient84_322,
  OriginalRow227TriangleData1151.coefficient84_323,
  OriginalRow227TriangleData1151.coefficient84_324,
  OriginalRow227TriangleData1151.coefficient84_325,
  OriginalRow227TriangleData1151.coefficient84_326,
  OriginalRow227TriangleData1151.coefficient84_327,
  OriginalRow227TriangleData1151.coefficient84_328,
  OriginalRow227TriangleData1151.coefficient84_329,
  OriginalRow227TriangleData1151.coefficient84_330,
  OriginalRow227TriangleData1151.coefficient84_331,
  OriginalRow227TriangleData1151.coefficient84_332,
  OriginalRow227TriangleData1151.coefficient84_333,
  OriginalRow227TriangleData1151.coefficient84_334,
  OriginalRow227TriangleData1151.coefficient84_335,
  OriginalRow227TriangleData1151.coefficient84_336,
  OriginalRow227TriangleData1151.coefficient84_337,
  OriginalRow227TriangleData1151.coefficient84_338
]

theorem values1151_size : values1151.size = 32 := rfl

def block1151 : ℕ → Option IntervalDyadic := segment 307 values1151

theorem block1151_domain : ExactDomain block1151 307 339 := by
  simpa only [values1151_size] using segment_domain 307 values1151

theorem block1151_get (i : Fin 32) :
    block1151 (307 + i.val) = some (values1151[i.val]'(by rw [values1151_size]; exact i.isLt)) := by
  exact segment_get 307 values1151 ⟨i.val, by rw [values1151_size]; exact i.isLt⟩

def values1152 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1152.coefficient84_339,
  OriginalRow227TriangleData1152.coefficient84_340,
  OriginalRow227TriangleData1152.coefficient84_341,
  OriginalRow227TriangleData1152.coefficient84_342,
  OriginalRow227TriangleData1152.coefficient84_343,
  OriginalRow227TriangleData1152.coefficient84_344,
  OriginalRow227TriangleData1152.coefficient84_345,
  OriginalRow227TriangleData1152.coefficient84_346,
  OriginalRow227TriangleData1152.coefficient84_347,
  OriginalRow227TriangleData1152.coefficient84_348,
  OriginalRow227TriangleData1152.coefficient84_349,
  OriginalRow227TriangleData1152.coefficient84_350,
  OriginalRow227TriangleData1152.coefficient84_351,
  OriginalRow227TriangleData1152.coefficient84_352,
  OriginalRow227TriangleData1152.coefficient84_353,
  OriginalRow227TriangleData1152.coefficient84_354,
  OriginalRow227TriangleData1152.coefficient84_355,
  OriginalRow227TriangleData1152.coefficient84_356,
  OriginalRow227TriangleData1152.coefficient84_357,
  OriginalRow227TriangleData1152.coefficient84_358,
  OriginalRow227TriangleData1152.coefficient84_359,
  OriginalRow227TriangleData1152.coefficient84_360,
  OriginalRow227TriangleData1152.coefficient84_361,
  OriginalRow227TriangleData1152.coefficient84_362,
  OriginalRow227TriangleData1152.coefficient84_363,
  OriginalRow227TriangleData1152.coefficient84_364,
  OriginalRow227TriangleData1152.coefficient84_365,
  OriginalRow227TriangleData1152.coefficient84_366,
  OriginalRow227TriangleData1152.coefficient84_367,
  OriginalRow227TriangleData1152.coefficient84_368,
  OriginalRow227TriangleData1152.coefficient84_369,
  OriginalRow227TriangleData1152.coefficient84_370
]

theorem values1152_size : values1152.size = 32 := rfl

def block1152 : ℕ → Option IntervalDyadic := segment 339 values1152

theorem block1152_domain : ExactDomain block1152 339 371 := by
  simpa only [values1152_size] using segment_domain 339 values1152

theorem block1152_get (i : Fin 32) :
    block1152 (339 + i.val) = some (values1152[i.val]'(by rw [values1152_size]; exact i.isLt)) := by
  exact segment_get 339 values1152 ⟨i.val, by rw [values1152_size]; exact i.isLt⟩

def values1153 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1153.coefficient84_371,
  OriginalRow227TriangleData1153.coefficient84_372,
  OriginalRow227TriangleData1153.coefficient84_373,
  OriginalRow227TriangleData1153.coefficient84_374,
  OriginalRow227TriangleData1153.coefficient84_375,
  OriginalRow227TriangleData1153.coefficient84_376,
  OriginalRow227TriangleData1153.coefficient84_377,
  OriginalRow227TriangleData1153.coefficient84_378,
  OriginalRow227TriangleData1153.coefficient84_379,
  OriginalRow227TriangleData1153.coefficient84_380,
  OriginalRow227TriangleData1153.coefficient84_381,
  OriginalRow227TriangleData1153.coefficient84_382,
  OriginalRow227TriangleData1153.coefficient84_383,
  OriginalRow227TriangleData1153.coefficient84_384,
  OriginalRow227TriangleData1153.coefficient84_385,
  OriginalRow227TriangleData1153.coefficient84_386,
  OriginalRow227TriangleData1153.coefficient84_387,
  OriginalRow227TriangleData1153.coefficient84_388,
  OriginalRow227TriangleData1153.coefficient84_389,
  OriginalRow227TriangleData1153.coefficient84_390,
  OriginalRow227TriangleData1153.coefficient84_391,
  OriginalRow227TriangleData1153.coefficient84_392,
  OriginalRow227TriangleData1153.coefficient84_393,
  OriginalRow227TriangleData1153.coefficient84_394,
  OriginalRow227TriangleData1153.coefficient84_395,
  OriginalRow227TriangleData1153.coefficient84_396,
  OriginalRow227TriangleData1153.coefficient84_397,
  OriginalRow227TriangleData1153.coefficient84_398,
  OriginalRow227TriangleData1153.coefficient84_399,
  OriginalRow227TriangleData1153.coefficient84_400,
  OriginalRow227TriangleData1153.coefficient84_401,
  OriginalRow227TriangleData1153.coefficient84_402
]

theorem values1153_size : values1153.size = 32 := rfl

def block1153 : ℕ → Option IntervalDyadic := segment 371 values1153

theorem block1153_domain : ExactDomain block1153 371 403 := by
  simpa only [values1153_size] using segment_domain 371 values1153

theorem block1153_get (i : Fin 32) :
    block1153 (371 + i.val) = some (values1153[i.val]'(by rw [values1153_size]; exact i.isLt)) := by
  exact segment_get 371 values1153 ⟨i.val, by rw [values1153_size]; exact i.isLt⟩

def values1154 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1154.coefficient84_403,
  OriginalRow227TriangleData1154.coefficient84_404,
  OriginalRow227TriangleData1154.coefficient84_405,
  OriginalRow227TriangleData1154.coefficient84_406,
  OriginalRow227TriangleData1154.coefficient84_407,
  OriginalRow227TriangleData1154.coefficient84_408,
  OriginalRow227TriangleData1154.coefficient84_409,
  OriginalRow227TriangleData1154.coefficient84_410,
  OriginalRow227TriangleData1154.coefficient84_411,
  OriginalRow227TriangleData1154.coefficient84_412,
  OriginalRow227TriangleData1154.coefficient84_413,
  OriginalRow227TriangleData1154.coefficient84_414,
  OriginalRow227TriangleData1154.coefficient84_415,
  OriginalRow227TriangleData1154.coefficient84_416,
  OriginalRow227TriangleData1154.coefficient84_417
]

theorem values1154_size : values1154.size = 15 := rfl

def block1154 : ℕ → Option IntervalDyadic := segment 403 values1154

theorem block1154_domain : ExactDomain block1154 403 418 := by
  simpa only [values1154_size] using segment_domain 403 values1154

theorem block1154_get (i : Fin 15) :
    block1154 (403 + i.val) = some (values1154[i.val]'(by rw [values1154_size]; exact i.isLt)) := by
  exact segment_get 403 values1154 ⟨i.val, by rw [values1154_size]; exact i.isLt⟩

def node0083_0147 : ℕ → Option IntervalDyadic := split 115 block1144 block1145

theorem node0083_0147_domain : ExactDomain node0083_0147 83 147 := by
  exact split_domain (by decide) (by decide) block1144_domain block1145_domain

def node0179_0243 : ℕ → Option IntervalDyadic := split 211 block1147 block1148

theorem node0179_0243_domain : ExactDomain node0179_0243 179 243 := by
  exact split_domain (by decide) (by decide) block1147_domain block1148_domain

def node0147_0243 : ℕ → Option IntervalDyadic := split 179 block1146 node0179_0243

theorem node0147_0243_domain : ExactDomain node0147_0243 147 243 := by
  exact split_domain (by decide) (by decide) block1146_domain node0179_0243_domain

def node0083_0243 : ℕ → Option IntervalDyadic := split 147 node0083_0147 node0147_0243

theorem node0083_0243_domain : ExactDomain node0083_0243 83 243 := by
  exact split_domain (by decide) (by decide) node0083_0147_domain node0147_0243_domain

def node0275_0339 : ℕ → Option IntervalDyadic := split 307 block1150 block1151

theorem node0275_0339_domain : ExactDomain node0275_0339 275 339 := by
  exact split_domain (by decide) (by decide) block1150_domain block1151_domain

def node0243_0339 : ℕ → Option IntervalDyadic := split 275 block1149 node0275_0339

theorem node0243_0339_domain : ExactDomain node0243_0339 243 339 := by
  exact split_domain (by decide) (by decide) block1149_domain node0275_0339_domain

def node0371_0418 : ℕ → Option IntervalDyadic := split 403 block1153 block1154

theorem node0371_0418_domain : ExactDomain node0371_0418 371 418 := by
  exact split_domain (by decide) (by decide) block1153_domain block1154_domain

def node0339_0418 : ℕ → Option IntervalDyadic := split 371 block1152 node0371_0418

theorem node0339_0418_domain : ExactDomain node0339_0418 339 418 := by
  exact split_domain (by decide) (by decide) block1152_domain node0371_0418_domain

def node0243_0418 : ℕ → Option IntervalDyadic := split 339 node0243_0339 node0339_0418

theorem node0243_0418_domain : ExactDomain node0243_0418 243 418 := by
  exact split_domain (by decide) (by decide) node0243_0339_domain node0339_0418_domain

def node0083_0418 : ℕ → Option IntervalDyadic := split 243 node0083_0243 node0243_0418

theorem node0083_0418_domain : ExactDomain node0083_0418 83 418 := by
  exact split_domain (by decide) (by decide) node0083_0243_domain node0243_0418_domain

def lookup : ℕ → Option IntervalDyadic := node0083_0418

theorem lookup_domain : ExactDomain lookup 83 418 :=
  node0083_0418_domain

theorem block1144_lookup (i : Fin 32) :
    lookup (83 + i.val) = some (values1144[i.val]'(by rw [values1144_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (83 + i.val) = _
  rw [node0083_0418, split_left 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0083_0243, split_left 147 node0083_0147 node0147_0243 (by omega)]
  rw [node0083_0147, split_left 115 block1144 block1145 (by omega)]
  exact block1144_get i

theorem block1145_lookup (i : Fin 32) :
    lookup (115 + i.val) = some (values1145[i.val]'(by rw [values1145_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (115 + i.val) = _
  rw [node0083_0418, split_left 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0083_0243, split_left 147 node0083_0147 node0147_0243 (by omega)]
  rw [node0083_0147, split_right 115 block1144 block1145 (by omega)]
  exact block1145_get i

theorem block1146_lookup (i : Fin 32) :
    lookup (147 + i.val) = some (values1146[i.val]'(by rw [values1146_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (147 + i.val) = _
  rw [node0083_0418, split_left 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0083_0243, split_right 147 node0083_0147 node0147_0243 (by omega)]
  rw [node0147_0243, split_left 179 block1146 node0179_0243 (by omega)]
  exact block1146_get i

theorem block1147_lookup (i : Fin 32) :
    lookup (179 + i.val) = some (values1147[i.val]'(by rw [values1147_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (179 + i.val) = _
  rw [node0083_0418, split_left 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0083_0243, split_right 147 node0083_0147 node0147_0243 (by omega)]
  rw [node0147_0243, split_right 179 block1146 node0179_0243 (by omega)]
  rw [node0179_0243, split_left 211 block1147 block1148 (by omega)]
  exact block1147_get i

theorem block1148_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values1148[i.val]'(by rw [values1148_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (211 + i.val) = _
  rw [node0083_0418, split_left 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0083_0243, split_right 147 node0083_0147 node0147_0243 (by omega)]
  rw [node0147_0243, split_right 179 block1146 node0179_0243 (by omega)]
  rw [node0179_0243, split_right 211 block1147 block1148 (by omega)]
  exact block1148_get i

theorem block1149_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values1149[i.val]'(by rw [values1149_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (243 + i.val) = _
  rw [node0083_0418, split_right 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0243_0418, split_left 339 node0243_0339 node0339_0418 (by omega)]
  rw [node0243_0339, split_left 275 block1149 node0275_0339 (by omega)]
  exact block1149_get i

theorem block1150_lookup (i : Fin 32) :
    lookup (275 + i.val) = some (values1150[i.val]'(by rw [values1150_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (275 + i.val) = _
  rw [node0083_0418, split_right 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0243_0418, split_left 339 node0243_0339 node0339_0418 (by omega)]
  rw [node0243_0339, split_right 275 block1149 node0275_0339 (by omega)]
  rw [node0275_0339, split_left 307 block1150 block1151 (by omega)]
  exact block1150_get i

theorem block1151_lookup (i : Fin 32) :
    lookup (307 + i.val) = some (values1151[i.val]'(by rw [values1151_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (307 + i.val) = _
  rw [node0083_0418, split_right 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0243_0418, split_left 339 node0243_0339 node0339_0418 (by omega)]
  rw [node0243_0339, split_right 275 block1149 node0275_0339 (by omega)]
  rw [node0275_0339, split_right 307 block1150 block1151 (by omega)]
  exact block1151_get i

theorem block1152_lookup (i : Fin 32) :
    lookup (339 + i.val) = some (values1152[i.val]'(by rw [values1152_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (339 + i.val) = _
  rw [node0083_0418, split_right 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0243_0418, split_right 339 node0243_0339 node0339_0418 (by omega)]
  rw [node0339_0418, split_left 371 block1152 node0371_0418 (by omega)]
  exact block1152_get i

theorem block1153_lookup (i : Fin 32) :
    lookup (371 + i.val) = some (values1153[i.val]'(by rw [values1153_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (371 + i.val) = _
  rw [node0083_0418, split_right 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0243_0418, split_right 339 node0243_0339 node0339_0418 (by omega)]
  rw [node0339_0418, split_right 371 block1152 node0371_0418 (by omega)]
  rw [node0371_0418, split_left 403 block1153 block1154 (by omega)]
  exact block1153_get i

theorem block1154_lookup (i : Fin 15) :
    lookup (403 + i.val) = some (values1154[i.val]'(by rw [values1154_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0083_0418 (403 + i.val) = _
  rw [node0083_0418, split_right 243 node0083_0243 node0243_0418 (by omega)]
  rw [node0243_0418, split_right 339 node0243_0339 node0339_0418 (by omega)]
  rw [node0339_0418, split_right 371 block1152 node0371_0418 (by omega)]
  rw [node0371_0418, split_right 403 block1153 block1154 (by omega)]
  exact block1154_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1144_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1144_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1145_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1145_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1146_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1146_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1147_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1147_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1148_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1148_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1149_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1149_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1150_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1150_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1151_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1151_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1152_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1152_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1153_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1153_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1154_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1154_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1144_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1145_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1146_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1147_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1148_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1149_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1150_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1151_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1152_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1153_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow084.block1154_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow084
