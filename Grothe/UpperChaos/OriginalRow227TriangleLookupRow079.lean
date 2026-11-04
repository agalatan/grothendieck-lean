import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1089
import Grothe.UpperChaos.OriginalRow227TriangleData1090
import Grothe.UpperChaos.OriginalRow227TriangleData1091
import Grothe.UpperChaos.OriginalRow227TriangleData1092
import Grothe.UpperChaos.OriginalRow227TriangleData1093
import Grothe.UpperChaos.OriginalRow227TriangleData1094
import Grothe.UpperChaos.OriginalRow227TriangleData1095
import Grothe.UpperChaos.OriginalRow227TriangleData1096
import Grothe.UpperChaos.OriginalRow227TriangleData1097
import Grothe.UpperChaos.OriginalRow227TriangleData1098
import Grothe.UpperChaos.OriginalRow227TriangleData1099

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow079

open ConditionalTableLookup

def values1089 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1089.coefficient79_78,
  OriginalRow227TriangleData1089.coefficient79_79,
  OriginalRow227TriangleData1089.coefficient79_80,
  OriginalRow227TriangleData1089.coefficient79_81,
  OriginalRow227TriangleData1089.coefficient79_82,
  OriginalRow227TriangleData1089.coefficient79_83,
  OriginalRow227TriangleData1089.coefficient79_84,
  OriginalRow227TriangleData1089.coefficient79_85,
  OriginalRow227TriangleData1089.coefficient79_86,
  OriginalRow227TriangleData1089.coefficient79_87,
  OriginalRow227TriangleData1089.coefficient79_88,
  OriginalRow227TriangleData1089.coefficient79_89,
  OriginalRow227TriangleData1089.coefficient79_90,
  OriginalRow227TriangleData1089.coefficient79_91,
  OriginalRow227TriangleData1089.coefficient79_92,
  OriginalRow227TriangleData1089.coefficient79_93,
  OriginalRow227TriangleData1089.coefficient79_94,
  OriginalRow227TriangleData1089.coefficient79_95,
  OriginalRow227TriangleData1089.coefficient79_96,
  OriginalRow227TriangleData1089.coefficient79_97,
  OriginalRow227TriangleData1089.coefficient79_98,
  OriginalRow227TriangleData1089.coefficient79_99,
  OriginalRow227TriangleData1089.coefficient79_100,
  OriginalRow227TriangleData1089.coefficient79_101,
  OriginalRow227TriangleData1089.coefficient79_102,
  OriginalRow227TriangleData1089.coefficient79_103,
  OriginalRow227TriangleData1089.coefficient79_104,
  OriginalRow227TriangleData1089.coefficient79_105,
  OriginalRow227TriangleData1089.coefficient79_106,
  OriginalRow227TriangleData1089.coefficient79_107,
  OriginalRow227TriangleData1089.coefficient79_108,
  OriginalRow227TriangleData1089.coefficient79_109
]

theorem values1089_size : values1089.size = 32 := rfl

def block1089 : ℕ → Option IntervalDyadic := segment 78 values1089

theorem block1089_domain : ExactDomain block1089 78 110 := by
  simpa only [values1089_size] using segment_domain 78 values1089

theorem block1089_get (i : Fin 32) :
    block1089 (78 + i.val) = some (values1089[i.val]'(by rw [values1089_size]; exact i.isLt)) := by
  exact segment_get 78 values1089 ⟨i.val, by rw [values1089_size]; exact i.isLt⟩

def values1090 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1090.coefficient79_110,
  OriginalRow227TriangleData1090.coefficient79_111,
  OriginalRow227TriangleData1090.coefficient79_112,
  OriginalRow227TriangleData1090.coefficient79_113,
  OriginalRow227TriangleData1090.coefficient79_114,
  OriginalRow227TriangleData1090.coefficient79_115,
  OriginalRow227TriangleData1090.coefficient79_116,
  OriginalRow227TriangleData1090.coefficient79_117,
  OriginalRow227TriangleData1090.coefficient79_118,
  OriginalRow227TriangleData1090.coefficient79_119,
  OriginalRow227TriangleData1090.coefficient79_120,
  OriginalRow227TriangleData1090.coefficient79_121,
  OriginalRow227TriangleData1090.coefficient79_122,
  OriginalRow227TriangleData1090.coefficient79_123,
  OriginalRow227TriangleData1090.coefficient79_124,
  OriginalRow227TriangleData1090.coefficient79_125,
  OriginalRow227TriangleData1090.coefficient79_126,
  OriginalRow227TriangleData1090.coefficient79_127,
  OriginalRow227TriangleData1090.coefficient79_128,
  OriginalRow227TriangleData1090.coefficient79_129,
  OriginalRow227TriangleData1090.coefficient79_130,
  OriginalRow227TriangleData1090.coefficient79_131,
  OriginalRow227TriangleData1090.coefficient79_132,
  OriginalRow227TriangleData1090.coefficient79_133,
  OriginalRow227TriangleData1090.coefficient79_134,
  OriginalRow227TriangleData1090.coefficient79_135,
  OriginalRow227TriangleData1090.coefficient79_136,
  OriginalRow227TriangleData1090.coefficient79_137,
  OriginalRow227TriangleData1090.coefficient79_138,
  OriginalRow227TriangleData1090.coefficient79_139,
  OriginalRow227TriangleData1090.coefficient79_140,
  OriginalRow227TriangleData1090.coefficient79_141
]

theorem values1090_size : values1090.size = 32 := rfl

def block1090 : ℕ → Option IntervalDyadic := segment 110 values1090

theorem block1090_domain : ExactDomain block1090 110 142 := by
  simpa only [values1090_size] using segment_domain 110 values1090

theorem block1090_get (i : Fin 32) :
    block1090 (110 + i.val) = some (values1090[i.val]'(by rw [values1090_size]; exact i.isLt)) := by
  exact segment_get 110 values1090 ⟨i.val, by rw [values1090_size]; exact i.isLt⟩

def values1091 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1091.coefficient79_142,
  OriginalRow227TriangleData1091.coefficient79_143,
  OriginalRow227TriangleData1091.coefficient79_144,
  OriginalRow227TriangleData1091.coefficient79_145,
  OriginalRow227TriangleData1091.coefficient79_146,
  OriginalRow227TriangleData1091.coefficient79_147,
  OriginalRow227TriangleData1091.coefficient79_148,
  OriginalRow227TriangleData1091.coefficient79_149,
  OriginalRow227TriangleData1091.coefficient79_150,
  OriginalRow227TriangleData1091.coefficient79_151,
  OriginalRow227TriangleData1091.coefficient79_152,
  OriginalRow227TriangleData1091.coefficient79_153,
  OriginalRow227TriangleData1091.coefficient79_154,
  OriginalRow227TriangleData1091.coefficient79_155,
  OriginalRow227TriangleData1091.coefficient79_156,
  OriginalRow227TriangleData1091.coefficient79_157,
  OriginalRow227TriangleData1091.coefficient79_158,
  OriginalRow227TriangleData1091.coefficient79_159,
  OriginalRow227TriangleData1091.coefficient79_160,
  OriginalRow227TriangleData1091.coefficient79_161,
  OriginalRow227TriangleData1091.coefficient79_162,
  OriginalRow227TriangleData1091.coefficient79_163,
  OriginalRow227TriangleData1091.coefficient79_164,
  OriginalRow227TriangleData1091.coefficient79_165,
  OriginalRow227TriangleData1091.coefficient79_166,
  OriginalRow227TriangleData1091.coefficient79_167,
  OriginalRow227TriangleData1091.coefficient79_168,
  OriginalRow227TriangleData1091.coefficient79_169,
  OriginalRow227TriangleData1091.coefficient79_170,
  OriginalRow227TriangleData1091.coefficient79_171,
  OriginalRow227TriangleData1091.coefficient79_172,
  OriginalRow227TriangleData1091.coefficient79_173
]

theorem values1091_size : values1091.size = 32 := rfl

def block1091 : ℕ → Option IntervalDyadic := segment 142 values1091

theorem block1091_domain : ExactDomain block1091 142 174 := by
  simpa only [values1091_size] using segment_domain 142 values1091

theorem block1091_get (i : Fin 32) :
    block1091 (142 + i.val) = some (values1091[i.val]'(by rw [values1091_size]; exact i.isLt)) := by
  exact segment_get 142 values1091 ⟨i.val, by rw [values1091_size]; exact i.isLt⟩

def values1092 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1092.coefficient79_174,
  OriginalRow227TriangleData1092.coefficient79_175,
  OriginalRow227TriangleData1092.coefficient79_176,
  OriginalRow227TriangleData1092.coefficient79_177,
  OriginalRow227TriangleData1092.coefficient79_178,
  OriginalRow227TriangleData1092.coefficient79_179,
  OriginalRow227TriangleData1092.coefficient79_180,
  OriginalRow227TriangleData1092.coefficient79_181,
  OriginalRow227TriangleData1092.coefficient79_182,
  OriginalRow227TriangleData1092.coefficient79_183,
  OriginalRow227TriangleData1092.coefficient79_184,
  OriginalRow227TriangleData1092.coefficient79_185,
  OriginalRow227TriangleData1092.coefficient79_186,
  OriginalRow227TriangleData1092.coefficient79_187,
  OriginalRow227TriangleData1092.coefficient79_188,
  OriginalRow227TriangleData1092.coefficient79_189,
  OriginalRow227TriangleData1092.coefficient79_190,
  OriginalRow227TriangleData1092.coefficient79_191,
  OriginalRow227TriangleData1092.coefficient79_192,
  OriginalRow227TriangleData1092.coefficient79_193,
  OriginalRow227TriangleData1092.coefficient79_194,
  OriginalRow227TriangleData1092.coefficient79_195,
  OriginalRow227TriangleData1092.coefficient79_196,
  OriginalRow227TriangleData1092.coefficient79_197,
  OriginalRow227TriangleData1092.coefficient79_198,
  OriginalRow227TriangleData1092.coefficient79_199,
  OriginalRow227TriangleData1092.coefficient79_200,
  OriginalRow227TriangleData1092.coefficient79_201,
  OriginalRow227TriangleData1092.coefficient79_202,
  OriginalRow227TriangleData1092.coefficient79_203,
  OriginalRow227TriangleData1092.coefficient79_204,
  OriginalRow227TriangleData1092.coefficient79_205
]

theorem values1092_size : values1092.size = 32 := rfl

def block1092 : ℕ → Option IntervalDyadic := segment 174 values1092

theorem block1092_domain : ExactDomain block1092 174 206 := by
  simpa only [values1092_size] using segment_domain 174 values1092

theorem block1092_get (i : Fin 32) :
    block1092 (174 + i.val) = some (values1092[i.val]'(by rw [values1092_size]; exact i.isLt)) := by
  exact segment_get 174 values1092 ⟨i.val, by rw [values1092_size]; exact i.isLt⟩

def values1093 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1093.coefficient79_206,
  OriginalRow227TriangleData1093.coefficient79_207,
  OriginalRow227TriangleData1093.coefficient79_208,
  OriginalRow227TriangleData1093.coefficient79_209,
  OriginalRow227TriangleData1093.coefficient79_210,
  OriginalRow227TriangleData1093.coefficient79_211,
  OriginalRow227TriangleData1093.coefficient79_212,
  OriginalRow227TriangleData1093.coefficient79_213,
  OriginalRow227TriangleData1093.coefficient79_214,
  OriginalRow227TriangleData1093.coefficient79_215,
  OriginalRow227TriangleData1093.coefficient79_216,
  OriginalRow227TriangleData1093.coefficient79_217,
  OriginalRow227TriangleData1093.coefficient79_218,
  OriginalRow227TriangleData1093.coefficient79_219,
  OriginalRow227TriangleData1093.coefficient79_220,
  OriginalRow227TriangleData1093.coefficient79_221,
  OriginalRow227TriangleData1093.coefficient79_222,
  OriginalRow227TriangleData1093.coefficient79_223,
  OriginalRow227TriangleData1093.coefficient79_224,
  OriginalRow227TriangleData1093.coefficient79_225,
  OriginalRow227TriangleData1093.coefficient79_226,
  OriginalRow227TriangleData1093.coefficient79_227,
  OriginalRow227TriangleData1093.coefficient79_228,
  OriginalRow227TriangleData1093.coefficient79_229,
  OriginalRow227TriangleData1093.coefficient79_230,
  OriginalRow227TriangleData1093.coefficient79_231,
  OriginalRow227TriangleData1093.coefficient79_232,
  OriginalRow227TriangleData1093.coefficient79_233,
  OriginalRow227TriangleData1093.coefficient79_234,
  OriginalRow227TriangleData1093.coefficient79_235,
  OriginalRow227TriangleData1093.coefficient79_236,
  OriginalRow227TriangleData1093.coefficient79_237
]

theorem values1093_size : values1093.size = 32 := rfl

def block1093 : ℕ → Option IntervalDyadic := segment 206 values1093

theorem block1093_domain : ExactDomain block1093 206 238 := by
  simpa only [values1093_size] using segment_domain 206 values1093

theorem block1093_get (i : Fin 32) :
    block1093 (206 + i.val) = some (values1093[i.val]'(by rw [values1093_size]; exact i.isLt)) := by
  exact segment_get 206 values1093 ⟨i.val, by rw [values1093_size]; exact i.isLt⟩

def values1094 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1094.coefficient79_238,
  OriginalRow227TriangleData1094.coefficient79_239,
  OriginalRow227TriangleData1094.coefficient79_240,
  OriginalRow227TriangleData1094.coefficient79_241,
  OriginalRow227TriangleData1094.coefficient79_242,
  OriginalRow227TriangleData1094.coefficient79_243,
  OriginalRow227TriangleData1094.coefficient79_244,
  OriginalRow227TriangleData1094.coefficient79_245,
  OriginalRow227TriangleData1094.coefficient79_246,
  OriginalRow227TriangleData1094.coefficient79_247,
  OriginalRow227TriangleData1094.coefficient79_248,
  OriginalRow227TriangleData1094.coefficient79_249,
  OriginalRow227TriangleData1094.coefficient79_250,
  OriginalRow227TriangleData1094.coefficient79_251,
  OriginalRow227TriangleData1094.coefficient79_252,
  OriginalRow227TriangleData1094.coefficient79_253,
  OriginalRow227TriangleData1094.coefficient79_254,
  OriginalRow227TriangleData1094.coefficient79_255,
  OriginalRow227TriangleData1094.coefficient79_256,
  OriginalRow227TriangleData1094.coefficient79_257,
  OriginalRow227TriangleData1094.coefficient79_258,
  OriginalRow227TriangleData1094.coefficient79_259,
  OriginalRow227TriangleData1094.coefficient79_260,
  OriginalRow227TriangleData1094.coefficient79_261,
  OriginalRow227TriangleData1094.coefficient79_262,
  OriginalRow227TriangleData1094.coefficient79_263,
  OriginalRow227TriangleData1094.coefficient79_264,
  OriginalRow227TriangleData1094.coefficient79_265,
  OriginalRow227TriangleData1094.coefficient79_266,
  OriginalRow227TriangleData1094.coefficient79_267,
  OriginalRow227TriangleData1094.coefficient79_268,
  OriginalRow227TriangleData1094.coefficient79_269
]

theorem values1094_size : values1094.size = 32 := rfl

def block1094 : ℕ → Option IntervalDyadic := segment 238 values1094

theorem block1094_domain : ExactDomain block1094 238 270 := by
  simpa only [values1094_size] using segment_domain 238 values1094

theorem block1094_get (i : Fin 32) :
    block1094 (238 + i.val) = some (values1094[i.val]'(by rw [values1094_size]; exact i.isLt)) := by
  exact segment_get 238 values1094 ⟨i.val, by rw [values1094_size]; exact i.isLt⟩

def values1095 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1095.coefficient79_270,
  OriginalRow227TriangleData1095.coefficient79_271,
  OriginalRow227TriangleData1095.coefficient79_272,
  OriginalRow227TriangleData1095.coefficient79_273,
  OriginalRow227TriangleData1095.coefficient79_274,
  OriginalRow227TriangleData1095.coefficient79_275,
  OriginalRow227TriangleData1095.coefficient79_276,
  OriginalRow227TriangleData1095.coefficient79_277,
  OriginalRow227TriangleData1095.coefficient79_278,
  OriginalRow227TriangleData1095.coefficient79_279,
  OriginalRow227TriangleData1095.coefficient79_280,
  OriginalRow227TriangleData1095.coefficient79_281,
  OriginalRow227TriangleData1095.coefficient79_282,
  OriginalRow227TriangleData1095.coefficient79_283,
  OriginalRow227TriangleData1095.coefficient79_284,
  OriginalRow227TriangleData1095.coefficient79_285,
  OriginalRow227TriangleData1095.coefficient79_286,
  OriginalRow227TriangleData1095.coefficient79_287,
  OriginalRow227TriangleData1095.coefficient79_288,
  OriginalRow227TriangleData1095.coefficient79_289,
  OriginalRow227TriangleData1095.coefficient79_290,
  OriginalRow227TriangleData1095.coefficient79_291,
  OriginalRow227TriangleData1095.coefficient79_292,
  OriginalRow227TriangleData1095.coefficient79_293,
  OriginalRow227TriangleData1095.coefficient79_294,
  OriginalRow227TriangleData1095.coefficient79_295,
  OriginalRow227TriangleData1095.coefficient79_296,
  OriginalRow227TriangleData1095.coefficient79_297,
  OriginalRow227TriangleData1095.coefficient79_298,
  OriginalRow227TriangleData1095.coefficient79_299,
  OriginalRow227TriangleData1095.coefficient79_300,
  OriginalRow227TriangleData1095.coefficient79_301
]

theorem values1095_size : values1095.size = 32 := rfl

def block1095 : ℕ → Option IntervalDyadic := segment 270 values1095

theorem block1095_domain : ExactDomain block1095 270 302 := by
  simpa only [values1095_size] using segment_domain 270 values1095

theorem block1095_get (i : Fin 32) :
    block1095 (270 + i.val) = some (values1095[i.val]'(by rw [values1095_size]; exact i.isLt)) := by
  exact segment_get 270 values1095 ⟨i.val, by rw [values1095_size]; exact i.isLt⟩

def values1096 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1096.coefficient79_302,
  OriginalRow227TriangleData1096.coefficient79_303,
  OriginalRow227TriangleData1096.coefficient79_304,
  OriginalRow227TriangleData1096.coefficient79_305,
  OriginalRow227TriangleData1096.coefficient79_306,
  OriginalRow227TriangleData1096.coefficient79_307,
  OriginalRow227TriangleData1096.coefficient79_308,
  OriginalRow227TriangleData1096.coefficient79_309,
  OriginalRow227TriangleData1096.coefficient79_310,
  OriginalRow227TriangleData1096.coefficient79_311,
  OriginalRow227TriangleData1096.coefficient79_312,
  OriginalRow227TriangleData1096.coefficient79_313,
  OriginalRow227TriangleData1096.coefficient79_314,
  OriginalRow227TriangleData1096.coefficient79_315,
  OriginalRow227TriangleData1096.coefficient79_316,
  OriginalRow227TriangleData1096.coefficient79_317,
  OriginalRow227TriangleData1096.coefficient79_318,
  OriginalRow227TriangleData1096.coefficient79_319,
  OriginalRow227TriangleData1096.coefficient79_320,
  OriginalRow227TriangleData1096.coefficient79_321,
  OriginalRow227TriangleData1096.coefficient79_322,
  OriginalRow227TriangleData1096.coefficient79_323,
  OriginalRow227TriangleData1096.coefficient79_324,
  OriginalRow227TriangleData1096.coefficient79_325,
  OriginalRow227TriangleData1096.coefficient79_326,
  OriginalRow227TriangleData1096.coefficient79_327,
  OriginalRow227TriangleData1096.coefficient79_328,
  OriginalRow227TriangleData1096.coefficient79_329,
  OriginalRow227TriangleData1096.coefficient79_330,
  OriginalRow227TriangleData1096.coefficient79_331,
  OriginalRow227TriangleData1096.coefficient79_332,
  OriginalRow227TriangleData1096.coefficient79_333
]

theorem values1096_size : values1096.size = 32 := rfl

def block1096 : ℕ → Option IntervalDyadic := segment 302 values1096

theorem block1096_domain : ExactDomain block1096 302 334 := by
  simpa only [values1096_size] using segment_domain 302 values1096

theorem block1096_get (i : Fin 32) :
    block1096 (302 + i.val) = some (values1096[i.val]'(by rw [values1096_size]; exact i.isLt)) := by
  exact segment_get 302 values1096 ⟨i.val, by rw [values1096_size]; exact i.isLt⟩

def values1097 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1097.coefficient79_334,
  OriginalRow227TriangleData1097.coefficient79_335,
  OriginalRow227TriangleData1097.coefficient79_336,
  OriginalRow227TriangleData1097.coefficient79_337,
  OriginalRow227TriangleData1097.coefficient79_338,
  OriginalRow227TriangleData1097.coefficient79_339,
  OriginalRow227TriangleData1097.coefficient79_340,
  OriginalRow227TriangleData1097.coefficient79_341,
  OriginalRow227TriangleData1097.coefficient79_342,
  OriginalRow227TriangleData1097.coefficient79_343,
  OriginalRow227TriangleData1097.coefficient79_344,
  OriginalRow227TriangleData1097.coefficient79_345,
  OriginalRow227TriangleData1097.coefficient79_346,
  OriginalRow227TriangleData1097.coefficient79_347,
  OriginalRow227TriangleData1097.coefficient79_348,
  OriginalRow227TriangleData1097.coefficient79_349,
  OriginalRow227TriangleData1097.coefficient79_350,
  OriginalRow227TriangleData1097.coefficient79_351,
  OriginalRow227TriangleData1097.coefficient79_352,
  OriginalRow227TriangleData1097.coefficient79_353,
  OriginalRow227TriangleData1097.coefficient79_354,
  OriginalRow227TriangleData1097.coefficient79_355,
  OriginalRow227TriangleData1097.coefficient79_356,
  OriginalRow227TriangleData1097.coefficient79_357,
  OriginalRow227TriangleData1097.coefficient79_358,
  OriginalRow227TriangleData1097.coefficient79_359,
  OriginalRow227TriangleData1097.coefficient79_360,
  OriginalRow227TriangleData1097.coefficient79_361,
  OriginalRow227TriangleData1097.coefficient79_362,
  OriginalRow227TriangleData1097.coefficient79_363,
  OriginalRow227TriangleData1097.coefficient79_364,
  OriginalRow227TriangleData1097.coefficient79_365
]

theorem values1097_size : values1097.size = 32 := rfl

def block1097 : ℕ → Option IntervalDyadic := segment 334 values1097

theorem block1097_domain : ExactDomain block1097 334 366 := by
  simpa only [values1097_size] using segment_domain 334 values1097

theorem block1097_get (i : Fin 32) :
    block1097 (334 + i.val) = some (values1097[i.val]'(by rw [values1097_size]; exact i.isLt)) := by
  exact segment_get 334 values1097 ⟨i.val, by rw [values1097_size]; exact i.isLt⟩

def values1098 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1098.coefficient79_366,
  OriginalRow227TriangleData1098.coefficient79_367,
  OriginalRow227TriangleData1098.coefficient79_368,
  OriginalRow227TriangleData1098.coefficient79_369,
  OriginalRow227TriangleData1098.coefficient79_370,
  OriginalRow227TriangleData1098.coefficient79_371,
  OriginalRow227TriangleData1098.coefficient79_372,
  OriginalRow227TriangleData1098.coefficient79_373,
  OriginalRow227TriangleData1098.coefficient79_374,
  OriginalRow227TriangleData1098.coefficient79_375,
  OriginalRow227TriangleData1098.coefficient79_376,
  OriginalRow227TriangleData1098.coefficient79_377,
  OriginalRow227TriangleData1098.coefficient79_378,
  OriginalRow227TriangleData1098.coefficient79_379,
  OriginalRow227TriangleData1098.coefficient79_380,
  OriginalRow227TriangleData1098.coefficient79_381,
  OriginalRow227TriangleData1098.coefficient79_382,
  OriginalRow227TriangleData1098.coefficient79_383,
  OriginalRow227TriangleData1098.coefficient79_384,
  OriginalRow227TriangleData1098.coefficient79_385,
  OriginalRow227TriangleData1098.coefficient79_386,
  OriginalRow227TriangleData1098.coefficient79_387,
  OriginalRow227TriangleData1098.coefficient79_388,
  OriginalRow227TriangleData1098.coefficient79_389,
  OriginalRow227TriangleData1098.coefficient79_390,
  OriginalRow227TriangleData1098.coefficient79_391,
  OriginalRow227TriangleData1098.coefficient79_392,
  OriginalRow227TriangleData1098.coefficient79_393,
  OriginalRow227TriangleData1098.coefficient79_394,
  OriginalRow227TriangleData1098.coefficient79_395,
  OriginalRow227TriangleData1098.coefficient79_396,
  OriginalRow227TriangleData1098.coefficient79_397
]

theorem values1098_size : values1098.size = 32 := rfl

def block1098 : ℕ → Option IntervalDyadic := segment 366 values1098

theorem block1098_domain : ExactDomain block1098 366 398 := by
  simpa only [values1098_size] using segment_domain 366 values1098

theorem block1098_get (i : Fin 32) :
    block1098 (366 + i.val) = some (values1098[i.val]'(by rw [values1098_size]; exact i.isLt)) := by
  exact segment_get 366 values1098 ⟨i.val, by rw [values1098_size]; exact i.isLt⟩

def values1099 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1099.coefficient79_398,
  OriginalRow227TriangleData1099.coefficient79_399,
  OriginalRow227TriangleData1099.coefficient79_400,
  OriginalRow227TriangleData1099.coefficient79_401,
  OriginalRow227TriangleData1099.coefficient79_402,
  OriginalRow227TriangleData1099.coefficient79_403,
  OriginalRow227TriangleData1099.coefficient79_404,
  OriginalRow227TriangleData1099.coefficient79_405,
  OriginalRow227TriangleData1099.coefficient79_406,
  OriginalRow227TriangleData1099.coefficient79_407,
  OriginalRow227TriangleData1099.coefficient79_408,
  OriginalRow227TriangleData1099.coefficient79_409,
  OriginalRow227TriangleData1099.coefficient79_410,
  OriginalRow227TriangleData1099.coefficient79_411,
  OriginalRow227TriangleData1099.coefficient79_412,
  OriginalRow227TriangleData1099.coefficient79_413,
  OriginalRow227TriangleData1099.coefficient79_414,
  OriginalRow227TriangleData1099.coefficient79_415,
  OriginalRow227TriangleData1099.coefficient79_416,
  OriginalRow227TriangleData1099.coefficient79_417,
  OriginalRow227TriangleData1099.coefficient79_418,
  OriginalRow227TriangleData1099.coefficient79_419,
  OriginalRow227TriangleData1099.coefficient79_420,
  OriginalRow227TriangleData1099.coefficient79_421,
  OriginalRow227TriangleData1099.coefficient79_422
]

theorem values1099_size : values1099.size = 25 := rfl

def block1099 : ℕ → Option IntervalDyadic := segment 398 values1099

theorem block1099_domain : ExactDomain block1099 398 423 := by
  simpa only [values1099_size] using segment_domain 398 values1099

theorem block1099_get (i : Fin 25) :
    block1099 (398 + i.val) = some (values1099[i.val]'(by rw [values1099_size]; exact i.isLt)) := by
  exact segment_get 398 values1099 ⟨i.val, by rw [values1099_size]; exact i.isLt⟩

def node0078_0142 : ℕ → Option IntervalDyadic := split 110 block1089 block1090

theorem node0078_0142_domain : ExactDomain node0078_0142 78 142 := by
  exact split_domain (by decide) (by decide) block1089_domain block1090_domain

def node0174_0238 : ℕ → Option IntervalDyadic := split 206 block1092 block1093

theorem node0174_0238_domain : ExactDomain node0174_0238 174 238 := by
  exact split_domain (by decide) (by decide) block1092_domain block1093_domain

def node0142_0238 : ℕ → Option IntervalDyadic := split 174 block1091 node0174_0238

theorem node0142_0238_domain : ExactDomain node0142_0238 142 238 := by
  exact split_domain (by decide) (by decide) block1091_domain node0174_0238_domain

def node0078_0238 : ℕ → Option IntervalDyadic := split 142 node0078_0142 node0142_0238

theorem node0078_0238_domain : ExactDomain node0078_0238 78 238 := by
  exact split_domain (by decide) (by decide) node0078_0142_domain node0142_0238_domain

def node0270_0334 : ℕ → Option IntervalDyadic := split 302 block1095 block1096

theorem node0270_0334_domain : ExactDomain node0270_0334 270 334 := by
  exact split_domain (by decide) (by decide) block1095_domain block1096_domain

def node0238_0334 : ℕ → Option IntervalDyadic := split 270 block1094 node0270_0334

theorem node0238_0334_domain : ExactDomain node0238_0334 238 334 := by
  exact split_domain (by decide) (by decide) block1094_domain node0270_0334_domain

def node0366_0423 : ℕ → Option IntervalDyadic := split 398 block1098 block1099

theorem node0366_0423_domain : ExactDomain node0366_0423 366 423 := by
  exact split_domain (by decide) (by decide) block1098_domain block1099_domain

def node0334_0423 : ℕ → Option IntervalDyadic := split 366 block1097 node0366_0423

theorem node0334_0423_domain : ExactDomain node0334_0423 334 423 := by
  exact split_domain (by decide) (by decide) block1097_domain node0366_0423_domain

def node0238_0423 : ℕ → Option IntervalDyadic := split 334 node0238_0334 node0334_0423

theorem node0238_0423_domain : ExactDomain node0238_0423 238 423 := by
  exact split_domain (by decide) (by decide) node0238_0334_domain node0334_0423_domain

def node0078_0423 : ℕ → Option IntervalDyadic := split 238 node0078_0238 node0238_0423

theorem node0078_0423_domain : ExactDomain node0078_0423 78 423 := by
  exact split_domain (by decide) (by decide) node0078_0238_domain node0238_0423_domain

def lookup : ℕ → Option IntervalDyadic := node0078_0423

theorem lookup_domain : ExactDomain lookup 78 423 :=
  node0078_0423_domain

theorem block1089_lookup (i : Fin 32) :
    lookup (78 + i.val) = some (values1089[i.val]'(by rw [values1089_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (78 + i.val) = _
  rw [node0078_0423, split_left 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0078_0238, split_left 142 node0078_0142 node0142_0238 (by omega)]
  rw [node0078_0142, split_left 110 block1089 block1090 (by omega)]
  exact block1089_get i

theorem block1090_lookup (i : Fin 32) :
    lookup (110 + i.val) = some (values1090[i.val]'(by rw [values1090_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (110 + i.val) = _
  rw [node0078_0423, split_left 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0078_0238, split_left 142 node0078_0142 node0142_0238 (by omega)]
  rw [node0078_0142, split_right 110 block1089 block1090 (by omega)]
  exact block1090_get i

theorem block1091_lookup (i : Fin 32) :
    lookup (142 + i.val) = some (values1091[i.val]'(by rw [values1091_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (142 + i.val) = _
  rw [node0078_0423, split_left 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0078_0238, split_right 142 node0078_0142 node0142_0238 (by omega)]
  rw [node0142_0238, split_left 174 block1091 node0174_0238 (by omega)]
  exact block1091_get i

theorem block1092_lookup (i : Fin 32) :
    lookup (174 + i.val) = some (values1092[i.val]'(by rw [values1092_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (174 + i.val) = _
  rw [node0078_0423, split_left 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0078_0238, split_right 142 node0078_0142 node0142_0238 (by omega)]
  rw [node0142_0238, split_right 174 block1091 node0174_0238 (by omega)]
  rw [node0174_0238, split_left 206 block1092 block1093 (by omega)]
  exact block1092_get i

theorem block1093_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values1093[i.val]'(by rw [values1093_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (206 + i.val) = _
  rw [node0078_0423, split_left 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0078_0238, split_right 142 node0078_0142 node0142_0238 (by omega)]
  rw [node0142_0238, split_right 174 block1091 node0174_0238 (by omega)]
  rw [node0174_0238, split_right 206 block1092 block1093 (by omega)]
  exact block1093_get i

theorem block1094_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values1094[i.val]'(by rw [values1094_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (238 + i.val) = _
  rw [node0078_0423, split_right 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0238_0423, split_left 334 node0238_0334 node0334_0423 (by omega)]
  rw [node0238_0334, split_left 270 block1094 node0270_0334 (by omega)]
  exact block1094_get i

theorem block1095_lookup (i : Fin 32) :
    lookup (270 + i.val) = some (values1095[i.val]'(by rw [values1095_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (270 + i.val) = _
  rw [node0078_0423, split_right 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0238_0423, split_left 334 node0238_0334 node0334_0423 (by omega)]
  rw [node0238_0334, split_right 270 block1094 node0270_0334 (by omega)]
  rw [node0270_0334, split_left 302 block1095 block1096 (by omega)]
  exact block1095_get i

theorem block1096_lookup (i : Fin 32) :
    lookup (302 + i.val) = some (values1096[i.val]'(by rw [values1096_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (302 + i.val) = _
  rw [node0078_0423, split_right 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0238_0423, split_left 334 node0238_0334 node0334_0423 (by omega)]
  rw [node0238_0334, split_right 270 block1094 node0270_0334 (by omega)]
  rw [node0270_0334, split_right 302 block1095 block1096 (by omega)]
  exact block1096_get i

theorem block1097_lookup (i : Fin 32) :
    lookup (334 + i.val) = some (values1097[i.val]'(by rw [values1097_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (334 + i.val) = _
  rw [node0078_0423, split_right 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0238_0423, split_right 334 node0238_0334 node0334_0423 (by omega)]
  rw [node0334_0423, split_left 366 block1097 node0366_0423 (by omega)]
  exact block1097_get i

theorem block1098_lookup (i : Fin 32) :
    lookup (366 + i.val) = some (values1098[i.val]'(by rw [values1098_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (366 + i.val) = _
  rw [node0078_0423, split_right 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0238_0423, split_right 334 node0238_0334 node0334_0423 (by omega)]
  rw [node0334_0423, split_right 366 block1097 node0366_0423 (by omega)]
  rw [node0366_0423, split_left 398 block1098 block1099 (by omega)]
  exact block1098_get i

theorem block1099_lookup (i : Fin 25) :
    lookup (398 + i.val) = some (values1099[i.val]'(by rw [values1099_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0078_0423 (398 + i.val) = _
  rw [node0078_0423, split_right 238 node0078_0238 node0238_0423 (by omega)]
  rw [node0238_0423, split_right 334 node0238_0334 node0334_0423 (by omega)]
  rw [node0334_0423, split_right 366 block1097 node0366_0423 (by omega)]
  rw [node0366_0423, split_right 398 block1098 block1099 (by omega)]
  exact block1099_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1089_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1089_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1090_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1090_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1091_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1091_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1092_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1092_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1093_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1093_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1094_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1094_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1095_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1095_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1096_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1096_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1097_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1097_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1098_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1098_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1099_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1099_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1089_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1090_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1091_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1092_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1093_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1094_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1095_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1096_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1097_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1098_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow079.block1099_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow079
