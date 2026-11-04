import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1078
import Grothe.UpperChaos.OriginalRow227TriangleData1079
import Grothe.UpperChaos.OriginalRow227TriangleData1080
import Grothe.UpperChaos.OriginalRow227TriangleData1081
import Grothe.UpperChaos.OriginalRow227TriangleData1082
import Grothe.UpperChaos.OriginalRow227TriangleData1083
import Grothe.UpperChaos.OriginalRow227TriangleData1084
import Grothe.UpperChaos.OriginalRow227TriangleData1085
import Grothe.UpperChaos.OriginalRow227TriangleData1086
import Grothe.UpperChaos.OriginalRow227TriangleData1087
import Grothe.UpperChaos.OriginalRow227TriangleData1088

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow078

open ConditionalTableLookup

def values1078 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1078.coefficient78_77,
  OriginalRow227TriangleData1078.coefficient78_78,
  OriginalRow227TriangleData1078.coefficient78_79,
  OriginalRow227TriangleData1078.coefficient78_80,
  OriginalRow227TriangleData1078.coefficient78_81,
  OriginalRow227TriangleData1078.coefficient78_82,
  OriginalRow227TriangleData1078.coefficient78_83,
  OriginalRow227TriangleData1078.coefficient78_84,
  OriginalRow227TriangleData1078.coefficient78_85,
  OriginalRow227TriangleData1078.coefficient78_86,
  OriginalRow227TriangleData1078.coefficient78_87,
  OriginalRow227TriangleData1078.coefficient78_88,
  OriginalRow227TriangleData1078.coefficient78_89,
  OriginalRow227TriangleData1078.coefficient78_90,
  OriginalRow227TriangleData1078.coefficient78_91,
  OriginalRow227TriangleData1078.coefficient78_92,
  OriginalRow227TriangleData1078.coefficient78_93,
  OriginalRow227TriangleData1078.coefficient78_94,
  OriginalRow227TriangleData1078.coefficient78_95,
  OriginalRow227TriangleData1078.coefficient78_96,
  OriginalRow227TriangleData1078.coefficient78_97,
  OriginalRow227TriangleData1078.coefficient78_98,
  OriginalRow227TriangleData1078.coefficient78_99,
  OriginalRow227TriangleData1078.coefficient78_100,
  OriginalRow227TriangleData1078.coefficient78_101,
  OriginalRow227TriangleData1078.coefficient78_102,
  OriginalRow227TriangleData1078.coefficient78_103,
  OriginalRow227TriangleData1078.coefficient78_104,
  OriginalRow227TriangleData1078.coefficient78_105,
  OriginalRow227TriangleData1078.coefficient78_106,
  OriginalRow227TriangleData1078.coefficient78_107,
  OriginalRow227TriangleData1078.coefficient78_108
]

theorem values1078_size : values1078.size = 32 := rfl

def block1078 : ℕ → Option IntervalDyadic := segment 77 values1078

theorem block1078_domain : ExactDomain block1078 77 109 := by
  simpa only [values1078_size] using segment_domain 77 values1078

theorem block1078_get (i : Fin 32) :
    block1078 (77 + i.val) = some (values1078[i.val]'(by rw [values1078_size]; exact i.isLt)) := by
  exact segment_get 77 values1078 ⟨i.val, by rw [values1078_size]; exact i.isLt⟩

def values1079 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1079.coefficient78_109,
  OriginalRow227TriangleData1079.coefficient78_110,
  OriginalRow227TriangleData1079.coefficient78_111,
  OriginalRow227TriangleData1079.coefficient78_112,
  OriginalRow227TriangleData1079.coefficient78_113,
  OriginalRow227TriangleData1079.coefficient78_114,
  OriginalRow227TriangleData1079.coefficient78_115,
  OriginalRow227TriangleData1079.coefficient78_116,
  OriginalRow227TriangleData1079.coefficient78_117,
  OriginalRow227TriangleData1079.coefficient78_118,
  OriginalRow227TriangleData1079.coefficient78_119,
  OriginalRow227TriangleData1079.coefficient78_120,
  OriginalRow227TriangleData1079.coefficient78_121,
  OriginalRow227TriangleData1079.coefficient78_122,
  OriginalRow227TriangleData1079.coefficient78_123,
  OriginalRow227TriangleData1079.coefficient78_124,
  OriginalRow227TriangleData1079.coefficient78_125,
  OriginalRow227TriangleData1079.coefficient78_126,
  OriginalRow227TriangleData1079.coefficient78_127,
  OriginalRow227TriangleData1079.coefficient78_128,
  OriginalRow227TriangleData1079.coefficient78_129,
  OriginalRow227TriangleData1079.coefficient78_130,
  OriginalRow227TriangleData1079.coefficient78_131,
  OriginalRow227TriangleData1079.coefficient78_132,
  OriginalRow227TriangleData1079.coefficient78_133,
  OriginalRow227TriangleData1079.coefficient78_134,
  OriginalRow227TriangleData1079.coefficient78_135,
  OriginalRow227TriangleData1079.coefficient78_136,
  OriginalRow227TriangleData1079.coefficient78_137,
  OriginalRow227TriangleData1079.coefficient78_138,
  OriginalRow227TriangleData1079.coefficient78_139,
  OriginalRow227TriangleData1079.coefficient78_140
]

theorem values1079_size : values1079.size = 32 := rfl

def block1079 : ℕ → Option IntervalDyadic := segment 109 values1079

theorem block1079_domain : ExactDomain block1079 109 141 := by
  simpa only [values1079_size] using segment_domain 109 values1079

theorem block1079_get (i : Fin 32) :
    block1079 (109 + i.val) = some (values1079[i.val]'(by rw [values1079_size]; exact i.isLt)) := by
  exact segment_get 109 values1079 ⟨i.val, by rw [values1079_size]; exact i.isLt⟩

def values1080 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1080.coefficient78_141,
  OriginalRow227TriangleData1080.coefficient78_142,
  OriginalRow227TriangleData1080.coefficient78_143,
  OriginalRow227TriangleData1080.coefficient78_144,
  OriginalRow227TriangleData1080.coefficient78_145,
  OriginalRow227TriangleData1080.coefficient78_146,
  OriginalRow227TriangleData1080.coefficient78_147,
  OriginalRow227TriangleData1080.coefficient78_148,
  OriginalRow227TriangleData1080.coefficient78_149,
  OriginalRow227TriangleData1080.coefficient78_150,
  OriginalRow227TriangleData1080.coefficient78_151,
  OriginalRow227TriangleData1080.coefficient78_152,
  OriginalRow227TriangleData1080.coefficient78_153,
  OriginalRow227TriangleData1080.coefficient78_154,
  OriginalRow227TriangleData1080.coefficient78_155,
  OriginalRow227TriangleData1080.coefficient78_156,
  OriginalRow227TriangleData1080.coefficient78_157,
  OriginalRow227TriangleData1080.coefficient78_158,
  OriginalRow227TriangleData1080.coefficient78_159,
  OriginalRow227TriangleData1080.coefficient78_160,
  OriginalRow227TriangleData1080.coefficient78_161,
  OriginalRow227TriangleData1080.coefficient78_162,
  OriginalRow227TriangleData1080.coefficient78_163,
  OriginalRow227TriangleData1080.coefficient78_164,
  OriginalRow227TriangleData1080.coefficient78_165,
  OriginalRow227TriangleData1080.coefficient78_166,
  OriginalRow227TriangleData1080.coefficient78_167,
  OriginalRow227TriangleData1080.coefficient78_168,
  OriginalRow227TriangleData1080.coefficient78_169,
  OriginalRow227TriangleData1080.coefficient78_170,
  OriginalRow227TriangleData1080.coefficient78_171,
  OriginalRow227TriangleData1080.coefficient78_172
]

theorem values1080_size : values1080.size = 32 := rfl

def block1080 : ℕ → Option IntervalDyadic := segment 141 values1080

theorem block1080_domain : ExactDomain block1080 141 173 := by
  simpa only [values1080_size] using segment_domain 141 values1080

theorem block1080_get (i : Fin 32) :
    block1080 (141 + i.val) = some (values1080[i.val]'(by rw [values1080_size]; exact i.isLt)) := by
  exact segment_get 141 values1080 ⟨i.val, by rw [values1080_size]; exact i.isLt⟩

def values1081 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1081.coefficient78_173,
  OriginalRow227TriangleData1081.coefficient78_174,
  OriginalRow227TriangleData1081.coefficient78_175,
  OriginalRow227TriangleData1081.coefficient78_176,
  OriginalRow227TriangleData1081.coefficient78_177,
  OriginalRow227TriangleData1081.coefficient78_178,
  OriginalRow227TriangleData1081.coefficient78_179,
  OriginalRow227TriangleData1081.coefficient78_180,
  OriginalRow227TriangleData1081.coefficient78_181,
  OriginalRow227TriangleData1081.coefficient78_182,
  OriginalRow227TriangleData1081.coefficient78_183,
  OriginalRow227TriangleData1081.coefficient78_184,
  OriginalRow227TriangleData1081.coefficient78_185,
  OriginalRow227TriangleData1081.coefficient78_186,
  OriginalRow227TriangleData1081.coefficient78_187,
  OriginalRow227TriangleData1081.coefficient78_188,
  OriginalRow227TriangleData1081.coefficient78_189,
  OriginalRow227TriangleData1081.coefficient78_190,
  OriginalRow227TriangleData1081.coefficient78_191,
  OriginalRow227TriangleData1081.coefficient78_192,
  OriginalRow227TriangleData1081.coefficient78_193,
  OriginalRow227TriangleData1081.coefficient78_194,
  OriginalRow227TriangleData1081.coefficient78_195,
  OriginalRow227TriangleData1081.coefficient78_196,
  OriginalRow227TriangleData1081.coefficient78_197,
  OriginalRow227TriangleData1081.coefficient78_198,
  OriginalRow227TriangleData1081.coefficient78_199,
  OriginalRow227TriangleData1081.coefficient78_200,
  OriginalRow227TriangleData1081.coefficient78_201,
  OriginalRow227TriangleData1081.coefficient78_202,
  OriginalRow227TriangleData1081.coefficient78_203,
  OriginalRow227TriangleData1081.coefficient78_204
]

theorem values1081_size : values1081.size = 32 := rfl

def block1081 : ℕ → Option IntervalDyadic := segment 173 values1081

theorem block1081_domain : ExactDomain block1081 173 205 := by
  simpa only [values1081_size] using segment_domain 173 values1081

theorem block1081_get (i : Fin 32) :
    block1081 (173 + i.val) = some (values1081[i.val]'(by rw [values1081_size]; exact i.isLt)) := by
  exact segment_get 173 values1081 ⟨i.val, by rw [values1081_size]; exact i.isLt⟩

def values1082 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1082.coefficient78_205,
  OriginalRow227TriangleData1082.coefficient78_206,
  OriginalRow227TriangleData1082.coefficient78_207,
  OriginalRow227TriangleData1082.coefficient78_208,
  OriginalRow227TriangleData1082.coefficient78_209,
  OriginalRow227TriangleData1082.coefficient78_210,
  OriginalRow227TriangleData1082.coefficient78_211,
  OriginalRow227TriangleData1082.coefficient78_212,
  OriginalRow227TriangleData1082.coefficient78_213,
  OriginalRow227TriangleData1082.coefficient78_214,
  OriginalRow227TriangleData1082.coefficient78_215,
  OriginalRow227TriangleData1082.coefficient78_216,
  OriginalRow227TriangleData1082.coefficient78_217,
  OriginalRow227TriangleData1082.coefficient78_218,
  OriginalRow227TriangleData1082.coefficient78_219,
  OriginalRow227TriangleData1082.coefficient78_220,
  OriginalRow227TriangleData1082.coefficient78_221,
  OriginalRow227TriangleData1082.coefficient78_222,
  OriginalRow227TriangleData1082.coefficient78_223,
  OriginalRow227TriangleData1082.coefficient78_224,
  OriginalRow227TriangleData1082.coefficient78_225,
  OriginalRow227TriangleData1082.coefficient78_226,
  OriginalRow227TriangleData1082.coefficient78_227,
  OriginalRow227TriangleData1082.coefficient78_228,
  OriginalRow227TriangleData1082.coefficient78_229,
  OriginalRow227TriangleData1082.coefficient78_230,
  OriginalRow227TriangleData1082.coefficient78_231,
  OriginalRow227TriangleData1082.coefficient78_232,
  OriginalRow227TriangleData1082.coefficient78_233,
  OriginalRow227TriangleData1082.coefficient78_234,
  OriginalRow227TriangleData1082.coefficient78_235,
  OriginalRow227TriangleData1082.coefficient78_236
]

theorem values1082_size : values1082.size = 32 := rfl

def block1082 : ℕ → Option IntervalDyadic := segment 205 values1082

theorem block1082_domain : ExactDomain block1082 205 237 := by
  simpa only [values1082_size] using segment_domain 205 values1082

theorem block1082_get (i : Fin 32) :
    block1082 (205 + i.val) = some (values1082[i.val]'(by rw [values1082_size]; exact i.isLt)) := by
  exact segment_get 205 values1082 ⟨i.val, by rw [values1082_size]; exact i.isLt⟩

def values1083 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1083.coefficient78_237,
  OriginalRow227TriangleData1083.coefficient78_238,
  OriginalRow227TriangleData1083.coefficient78_239,
  OriginalRow227TriangleData1083.coefficient78_240,
  OriginalRow227TriangleData1083.coefficient78_241,
  OriginalRow227TriangleData1083.coefficient78_242,
  OriginalRow227TriangleData1083.coefficient78_243,
  OriginalRow227TriangleData1083.coefficient78_244,
  OriginalRow227TriangleData1083.coefficient78_245,
  OriginalRow227TriangleData1083.coefficient78_246,
  OriginalRow227TriangleData1083.coefficient78_247,
  OriginalRow227TriangleData1083.coefficient78_248,
  OriginalRow227TriangleData1083.coefficient78_249,
  OriginalRow227TriangleData1083.coefficient78_250,
  OriginalRow227TriangleData1083.coefficient78_251,
  OriginalRow227TriangleData1083.coefficient78_252,
  OriginalRow227TriangleData1083.coefficient78_253,
  OriginalRow227TriangleData1083.coefficient78_254,
  OriginalRow227TriangleData1083.coefficient78_255,
  OriginalRow227TriangleData1083.coefficient78_256,
  OriginalRow227TriangleData1083.coefficient78_257,
  OriginalRow227TriangleData1083.coefficient78_258,
  OriginalRow227TriangleData1083.coefficient78_259,
  OriginalRow227TriangleData1083.coefficient78_260,
  OriginalRow227TriangleData1083.coefficient78_261,
  OriginalRow227TriangleData1083.coefficient78_262,
  OriginalRow227TriangleData1083.coefficient78_263,
  OriginalRow227TriangleData1083.coefficient78_264,
  OriginalRow227TriangleData1083.coefficient78_265,
  OriginalRow227TriangleData1083.coefficient78_266,
  OriginalRow227TriangleData1083.coefficient78_267,
  OriginalRow227TriangleData1083.coefficient78_268
]

theorem values1083_size : values1083.size = 32 := rfl

def block1083 : ℕ → Option IntervalDyadic := segment 237 values1083

theorem block1083_domain : ExactDomain block1083 237 269 := by
  simpa only [values1083_size] using segment_domain 237 values1083

theorem block1083_get (i : Fin 32) :
    block1083 (237 + i.val) = some (values1083[i.val]'(by rw [values1083_size]; exact i.isLt)) := by
  exact segment_get 237 values1083 ⟨i.val, by rw [values1083_size]; exact i.isLt⟩

def values1084 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1084.coefficient78_269,
  OriginalRow227TriangleData1084.coefficient78_270,
  OriginalRow227TriangleData1084.coefficient78_271,
  OriginalRow227TriangleData1084.coefficient78_272,
  OriginalRow227TriangleData1084.coefficient78_273,
  OriginalRow227TriangleData1084.coefficient78_274,
  OriginalRow227TriangleData1084.coefficient78_275,
  OriginalRow227TriangleData1084.coefficient78_276,
  OriginalRow227TriangleData1084.coefficient78_277,
  OriginalRow227TriangleData1084.coefficient78_278,
  OriginalRow227TriangleData1084.coefficient78_279,
  OriginalRow227TriangleData1084.coefficient78_280,
  OriginalRow227TriangleData1084.coefficient78_281,
  OriginalRow227TriangleData1084.coefficient78_282,
  OriginalRow227TriangleData1084.coefficient78_283,
  OriginalRow227TriangleData1084.coefficient78_284,
  OriginalRow227TriangleData1084.coefficient78_285,
  OriginalRow227TriangleData1084.coefficient78_286,
  OriginalRow227TriangleData1084.coefficient78_287,
  OriginalRow227TriangleData1084.coefficient78_288,
  OriginalRow227TriangleData1084.coefficient78_289,
  OriginalRow227TriangleData1084.coefficient78_290,
  OriginalRow227TriangleData1084.coefficient78_291,
  OriginalRow227TriangleData1084.coefficient78_292,
  OriginalRow227TriangleData1084.coefficient78_293,
  OriginalRow227TriangleData1084.coefficient78_294,
  OriginalRow227TriangleData1084.coefficient78_295,
  OriginalRow227TriangleData1084.coefficient78_296,
  OriginalRow227TriangleData1084.coefficient78_297,
  OriginalRow227TriangleData1084.coefficient78_298,
  OriginalRow227TriangleData1084.coefficient78_299,
  OriginalRow227TriangleData1084.coefficient78_300
]

theorem values1084_size : values1084.size = 32 := rfl

def block1084 : ℕ → Option IntervalDyadic := segment 269 values1084

theorem block1084_domain : ExactDomain block1084 269 301 := by
  simpa only [values1084_size] using segment_domain 269 values1084

theorem block1084_get (i : Fin 32) :
    block1084 (269 + i.val) = some (values1084[i.val]'(by rw [values1084_size]; exact i.isLt)) := by
  exact segment_get 269 values1084 ⟨i.val, by rw [values1084_size]; exact i.isLt⟩

def values1085 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1085.coefficient78_301,
  OriginalRow227TriangleData1085.coefficient78_302,
  OriginalRow227TriangleData1085.coefficient78_303,
  OriginalRow227TriangleData1085.coefficient78_304,
  OriginalRow227TriangleData1085.coefficient78_305,
  OriginalRow227TriangleData1085.coefficient78_306,
  OriginalRow227TriangleData1085.coefficient78_307,
  OriginalRow227TriangleData1085.coefficient78_308,
  OriginalRow227TriangleData1085.coefficient78_309,
  OriginalRow227TriangleData1085.coefficient78_310,
  OriginalRow227TriangleData1085.coefficient78_311,
  OriginalRow227TriangleData1085.coefficient78_312,
  OriginalRow227TriangleData1085.coefficient78_313,
  OriginalRow227TriangleData1085.coefficient78_314,
  OriginalRow227TriangleData1085.coefficient78_315,
  OriginalRow227TriangleData1085.coefficient78_316,
  OriginalRow227TriangleData1085.coefficient78_317,
  OriginalRow227TriangleData1085.coefficient78_318,
  OriginalRow227TriangleData1085.coefficient78_319,
  OriginalRow227TriangleData1085.coefficient78_320,
  OriginalRow227TriangleData1085.coefficient78_321,
  OriginalRow227TriangleData1085.coefficient78_322,
  OriginalRow227TriangleData1085.coefficient78_323,
  OriginalRow227TriangleData1085.coefficient78_324,
  OriginalRow227TriangleData1085.coefficient78_325,
  OriginalRow227TriangleData1085.coefficient78_326,
  OriginalRow227TriangleData1085.coefficient78_327,
  OriginalRow227TriangleData1085.coefficient78_328,
  OriginalRow227TriangleData1085.coefficient78_329,
  OriginalRow227TriangleData1085.coefficient78_330,
  OriginalRow227TriangleData1085.coefficient78_331,
  OriginalRow227TriangleData1085.coefficient78_332
]

theorem values1085_size : values1085.size = 32 := rfl

def block1085 : ℕ → Option IntervalDyadic := segment 301 values1085

theorem block1085_domain : ExactDomain block1085 301 333 := by
  simpa only [values1085_size] using segment_domain 301 values1085

theorem block1085_get (i : Fin 32) :
    block1085 (301 + i.val) = some (values1085[i.val]'(by rw [values1085_size]; exact i.isLt)) := by
  exact segment_get 301 values1085 ⟨i.val, by rw [values1085_size]; exact i.isLt⟩

def values1086 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1086.coefficient78_333,
  OriginalRow227TriangleData1086.coefficient78_334,
  OriginalRow227TriangleData1086.coefficient78_335,
  OriginalRow227TriangleData1086.coefficient78_336,
  OriginalRow227TriangleData1086.coefficient78_337,
  OriginalRow227TriangleData1086.coefficient78_338,
  OriginalRow227TriangleData1086.coefficient78_339,
  OriginalRow227TriangleData1086.coefficient78_340,
  OriginalRow227TriangleData1086.coefficient78_341,
  OriginalRow227TriangleData1086.coefficient78_342,
  OriginalRow227TriangleData1086.coefficient78_343,
  OriginalRow227TriangleData1086.coefficient78_344,
  OriginalRow227TriangleData1086.coefficient78_345,
  OriginalRow227TriangleData1086.coefficient78_346,
  OriginalRow227TriangleData1086.coefficient78_347,
  OriginalRow227TriangleData1086.coefficient78_348,
  OriginalRow227TriangleData1086.coefficient78_349,
  OriginalRow227TriangleData1086.coefficient78_350,
  OriginalRow227TriangleData1086.coefficient78_351,
  OriginalRow227TriangleData1086.coefficient78_352,
  OriginalRow227TriangleData1086.coefficient78_353,
  OriginalRow227TriangleData1086.coefficient78_354,
  OriginalRow227TriangleData1086.coefficient78_355,
  OriginalRow227TriangleData1086.coefficient78_356,
  OriginalRow227TriangleData1086.coefficient78_357,
  OriginalRow227TriangleData1086.coefficient78_358,
  OriginalRow227TriangleData1086.coefficient78_359,
  OriginalRow227TriangleData1086.coefficient78_360,
  OriginalRow227TriangleData1086.coefficient78_361,
  OriginalRow227TriangleData1086.coefficient78_362,
  OriginalRow227TriangleData1086.coefficient78_363,
  OriginalRow227TriangleData1086.coefficient78_364
]

theorem values1086_size : values1086.size = 32 := rfl

def block1086 : ℕ → Option IntervalDyadic := segment 333 values1086

theorem block1086_domain : ExactDomain block1086 333 365 := by
  simpa only [values1086_size] using segment_domain 333 values1086

theorem block1086_get (i : Fin 32) :
    block1086 (333 + i.val) = some (values1086[i.val]'(by rw [values1086_size]; exact i.isLt)) := by
  exact segment_get 333 values1086 ⟨i.val, by rw [values1086_size]; exact i.isLt⟩

def values1087 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1087.coefficient78_365,
  OriginalRow227TriangleData1087.coefficient78_366,
  OriginalRow227TriangleData1087.coefficient78_367,
  OriginalRow227TriangleData1087.coefficient78_368,
  OriginalRow227TriangleData1087.coefficient78_369,
  OriginalRow227TriangleData1087.coefficient78_370,
  OriginalRow227TriangleData1087.coefficient78_371,
  OriginalRow227TriangleData1087.coefficient78_372,
  OriginalRow227TriangleData1087.coefficient78_373,
  OriginalRow227TriangleData1087.coefficient78_374,
  OriginalRow227TriangleData1087.coefficient78_375,
  OriginalRow227TriangleData1087.coefficient78_376,
  OriginalRow227TriangleData1087.coefficient78_377,
  OriginalRow227TriangleData1087.coefficient78_378,
  OriginalRow227TriangleData1087.coefficient78_379,
  OriginalRow227TriangleData1087.coefficient78_380,
  OriginalRow227TriangleData1087.coefficient78_381,
  OriginalRow227TriangleData1087.coefficient78_382,
  OriginalRow227TriangleData1087.coefficient78_383,
  OriginalRow227TriangleData1087.coefficient78_384,
  OriginalRow227TriangleData1087.coefficient78_385,
  OriginalRow227TriangleData1087.coefficient78_386,
  OriginalRow227TriangleData1087.coefficient78_387,
  OriginalRow227TriangleData1087.coefficient78_388,
  OriginalRow227TriangleData1087.coefficient78_389,
  OriginalRow227TriangleData1087.coefficient78_390,
  OriginalRow227TriangleData1087.coefficient78_391,
  OriginalRow227TriangleData1087.coefficient78_392,
  OriginalRow227TriangleData1087.coefficient78_393,
  OriginalRow227TriangleData1087.coefficient78_394,
  OriginalRow227TriangleData1087.coefficient78_395,
  OriginalRow227TriangleData1087.coefficient78_396
]

theorem values1087_size : values1087.size = 32 := rfl

def block1087 : ℕ → Option IntervalDyadic := segment 365 values1087

theorem block1087_domain : ExactDomain block1087 365 397 := by
  simpa only [values1087_size] using segment_domain 365 values1087

theorem block1087_get (i : Fin 32) :
    block1087 (365 + i.val) = some (values1087[i.val]'(by rw [values1087_size]; exact i.isLt)) := by
  exact segment_get 365 values1087 ⟨i.val, by rw [values1087_size]; exact i.isLt⟩

def values1088 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1088.coefficient78_397,
  OriginalRow227TriangleData1088.coefficient78_398,
  OriginalRow227TriangleData1088.coefficient78_399,
  OriginalRow227TriangleData1088.coefficient78_400,
  OriginalRow227TriangleData1088.coefficient78_401,
  OriginalRow227TriangleData1088.coefficient78_402,
  OriginalRow227TriangleData1088.coefficient78_403,
  OriginalRow227TriangleData1088.coefficient78_404,
  OriginalRow227TriangleData1088.coefficient78_405,
  OriginalRow227TriangleData1088.coefficient78_406,
  OriginalRow227TriangleData1088.coefficient78_407,
  OriginalRow227TriangleData1088.coefficient78_408,
  OriginalRow227TriangleData1088.coefficient78_409,
  OriginalRow227TriangleData1088.coefficient78_410,
  OriginalRow227TriangleData1088.coefficient78_411,
  OriginalRow227TriangleData1088.coefficient78_412,
  OriginalRow227TriangleData1088.coefficient78_413,
  OriginalRow227TriangleData1088.coefficient78_414,
  OriginalRow227TriangleData1088.coefficient78_415,
  OriginalRow227TriangleData1088.coefficient78_416,
  OriginalRow227TriangleData1088.coefficient78_417,
  OriginalRow227TriangleData1088.coefficient78_418,
  OriginalRow227TriangleData1088.coefficient78_419,
  OriginalRow227TriangleData1088.coefficient78_420,
  OriginalRow227TriangleData1088.coefficient78_421,
  OriginalRow227TriangleData1088.coefficient78_422,
  OriginalRow227TriangleData1088.coefficient78_423
]

theorem values1088_size : values1088.size = 27 := rfl

def block1088 : ℕ → Option IntervalDyadic := segment 397 values1088

theorem block1088_domain : ExactDomain block1088 397 424 := by
  simpa only [values1088_size] using segment_domain 397 values1088

theorem block1088_get (i : Fin 27) :
    block1088 (397 + i.val) = some (values1088[i.val]'(by rw [values1088_size]; exact i.isLt)) := by
  exact segment_get 397 values1088 ⟨i.val, by rw [values1088_size]; exact i.isLt⟩

def node0077_0141 : ℕ → Option IntervalDyadic := split 109 block1078 block1079

theorem node0077_0141_domain : ExactDomain node0077_0141 77 141 := by
  exact split_domain (by decide) (by decide) block1078_domain block1079_domain

def node0173_0237 : ℕ → Option IntervalDyadic := split 205 block1081 block1082

theorem node0173_0237_domain : ExactDomain node0173_0237 173 237 := by
  exact split_domain (by decide) (by decide) block1081_domain block1082_domain

def node0141_0237 : ℕ → Option IntervalDyadic := split 173 block1080 node0173_0237

theorem node0141_0237_domain : ExactDomain node0141_0237 141 237 := by
  exact split_domain (by decide) (by decide) block1080_domain node0173_0237_domain

def node0077_0237 : ℕ → Option IntervalDyadic := split 141 node0077_0141 node0141_0237

theorem node0077_0237_domain : ExactDomain node0077_0237 77 237 := by
  exact split_domain (by decide) (by decide) node0077_0141_domain node0141_0237_domain

def node0269_0333 : ℕ → Option IntervalDyadic := split 301 block1084 block1085

theorem node0269_0333_domain : ExactDomain node0269_0333 269 333 := by
  exact split_domain (by decide) (by decide) block1084_domain block1085_domain

def node0237_0333 : ℕ → Option IntervalDyadic := split 269 block1083 node0269_0333

theorem node0237_0333_domain : ExactDomain node0237_0333 237 333 := by
  exact split_domain (by decide) (by decide) block1083_domain node0269_0333_domain

def node0365_0424 : ℕ → Option IntervalDyadic := split 397 block1087 block1088

theorem node0365_0424_domain : ExactDomain node0365_0424 365 424 := by
  exact split_domain (by decide) (by decide) block1087_domain block1088_domain

def node0333_0424 : ℕ → Option IntervalDyadic := split 365 block1086 node0365_0424

theorem node0333_0424_domain : ExactDomain node0333_0424 333 424 := by
  exact split_domain (by decide) (by decide) block1086_domain node0365_0424_domain

def node0237_0424 : ℕ → Option IntervalDyadic := split 333 node0237_0333 node0333_0424

theorem node0237_0424_domain : ExactDomain node0237_0424 237 424 := by
  exact split_domain (by decide) (by decide) node0237_0333_domain node0333_0424_domain

def node0077_0424 : ℕ → Option IntervalDyadic := split 237 node0077_0237 node0237_0424

theorem node0077_0424_domain : ExactDomain node0077_0424 77 424 := by
  exact split_domain (by decide) (by decide) node0077_0237_domain node0237_0424_domain

def lookup : ℕ → Option IntervalDyadic := node0077_0424

theorem lookup_domain : ExactDomain lookup 77 424 :=
  node0077_0424_domain

theorem block1078_lookup (i : Fin 32) :
    lookup (77 + i.val) = some (values1078[i.val]'(by rw [values1078_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (77 + i.val) = _
  rw [node0077_0424, split_left 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0077_0237, split_left 141 node0077_0141 node0141_0237 (by omega)]
  rw [node0077_0141, split_left 109 block1078 block1079 (by omega)]
  exact block1078_get i

theorem block1079_lookup (i : Fin 32) :
    lookup (109 + i.val) = some (values1079[i.val]'(by rw [values1079_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (109 + i.val) = _
  rw [node0077_0424, split_left 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0077_0237, split_left 141 node0077_0141 node0141_0237 (by omega)]
  rw [node0077_0141, split_right 109 block1078 block1079 (by omega)]
  exact block1079_get i

theorem block1080_lookup (i : Fin 32) :
    lookup (141 + i.val) = some (values1080[i.val]'(by rw [values1080_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (141 + i.val) = _
  rw [node0077_0424, split_left 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0077_0237, split_right 141 node0077_0141 node0141_0237 (by omega)]
  rw [node0141_0237, split_left 173 block1080 node0173_0237 (by omega)]
  exact block1080_get i

theorem block1081_lookup (i : Fin 32) :
    lookup (173 + i.val) = some (values1081[i.val]'(by rw [values1081_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (173 + i.val) = _
  rw [node0077_0424, split_left 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0077_0237, split_right 141 node0077_0141 node0141_0237 (by omega)]
  rw [node0141_0237, split_right 173 block1080 node0173_0237 (by omega)]
  rw [node0173_0237, split_left 205 block1081 block1082 (by omega)]
  exact block1081_get i

theorem block1082_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values1082[i.val]'(by rw [values1082_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (205 + i.val) = _
  rw [node0077_0424, split_left 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0077_0237, split_right 141 node0077_0141 node0141_0237 (by omega)]
  rw [node0141_0237, split_right 173 block1080 node0173_0237 (by omega)]
  rw [node0173_0237, split_right 205 block1081 block1082 (by omega)]
  exact block1082_get i

theorem block1083_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values1083[i.val]'(by rw [values1083_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (237 + i.val) = _
  rw [node0077_0424, split_right 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0237_0424, split_left 333 node0237_0333 node0333_0424 (by omega)]
  rw [node0237_0333, split_left 269 block1083 node0269_0333 (by omega)]
  exact block1083_get i

theorem block1084_lookup (i : Fin 32) :
    lookup (269 + i.val) = some (values1084[i.val]'(by rw [values1084_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (269 + i.val) = _
  rw [node0077_0424, split_right 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0237_0424, split_left 333 node0237_0333 node0333_0424 (by omega)]
  rw [node0237_0333, split_right 269 block1083 node0269_0333 (by omega)]
  rw [node0269_0333, split_left 301 block1084 block1085 (by omega)]
  exact block1084_get i

theorem block1085_lookup (i : Fin 32) :
    lookup (301 + i.val) = some (values1085[i.val]'(by rw [values1085_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (301 + i.val) = _
  rw [node0077_0424, split_right 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0237_0424, split_left 333 node0237_0333 node0333_0424 (by omega)]
  rw [node0237_0333, split_right 269 block1083 node0269_0333 (by omega)]
  rw [node0269_0333, split_right 301 block1084 block1085 (by omega)]
  exact block1085_get i

theorem block1086_lookup (i : Fin 32) :
    lookup (333 + i.val) = some (values1086[i.val]'(by rw [values1086_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (333 + i.val) = _
  rw [node0077_0424, split_right 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0237_0424, split_right 333 node0237_0333 node0333_0424 (by omega)]
  rw [node0333_0424, split_left 365 block1086 node0365_0424 (by omega)]
  exact block1086_get i

theorem block1087_lookup (i : Fin 32) :
    lookup (365 + i.val) = some (values1087[i.val]'(by rw [values1087_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (365 + i.val) = _
  rw [node0077_0424, split_right 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0237_0424, split_right 333 node0237_0333 node0333_0424 (by omega)]
  rw [node0333_0424, split_right 365 block1086 node0365_0424 (by omega)]
  rw [node0365_0424, split_left 397 block1087 block1088 (by omega)]
  exact block1087_get i

theorem block1088_lookup (i : Fin 27) :
    lookup (397 + i.val) = some (values1088[i.val]'(by rw [values1088_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0077_0424 (397 + i.val) = _
  rw [node0077_0424, split_right 237 node0077_0237 node0237_0424 (by omega)]
  rw [node0237_0424, split_right 333 node0237_0333 node0333_0424 (by omega)]
  rw [node0333_0424, split_right 365 block1086 node0365_0424 (by omega)]
  rw [node0365_0424, split_right 397 block1087 block1088 (by omega)]
  exact block1088_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1078_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1078_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1079_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1079_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1080_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1080_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1081_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1081_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1082_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1082_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1083_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1083_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1084_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1084_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1085_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1085_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1086_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1086_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1087_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1087_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1088_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1088_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1078_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1079_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1080_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1081_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1082_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1083_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1084_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1085_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1086_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1087_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow078.block1088_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow078
