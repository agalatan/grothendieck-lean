import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1044
import Grothe.UpperChaos.OriginalRow227TriangleData1045
import Grothe.UpperChaos.OriginalRow227TriangleData1046
import Grothe.UpperChaos.OriginalRow227TriangleData1047
import Grothe.UpperChaos.OriginalRow227TriangleData1048
import Grothe.UpperChaos.OriginalRow227TriangleData1049
import Grothe.UpperChaos.OriginalRow227TriangleData1050
import Grothe.UpperChaos.OriginalRow227TriangleData1051
import Grothe.UpperChaos.OriginalRow227TriangleData1052
import Grothe.UpperChaos.OriginalRow227TriangleData1053
import Grothe.UpperChaos.OriginalRow227TriangleData1054
import Grothe.UpperChaos.OriginalRow227TriangleData1055

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow075

open ConditionalTableLookup

def values1044 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1044.coefficient75_74,
  OriginalRow227TriangleData1044.coefficient75_75,
  OriginalRow227TriangleData1044.coefficient75_76,
  OriginalRow227TriangleData1044.coefficient75_77,
  OriginalRow227TriangleData1044.coefficient75_78,
  OriginalRow227TriangleData1044.coefficient75_79,
  OriginalRow227TriangleData1044.coefficient75_80,
  OriginalRow227TriangleData1044.coefficient75_81,
  OriginalRow227TriangleData1044.coefficient75_82,
  OriginalRow227TriangleData1044.coefficient75_83,
  OriginalRow227TriangleData1044.coefficient75_84,
  OriginalRow227TriangleData1044.coefficient75_85,
  OriginalRow227TriangleData1044.coefficient75_86,
  OriginalRow227TriangleData1044.coefficient75_87,
  OriginalRow227TriangleData1044.coefficient75_88,
  OriginalRow227TriangleData1044.coefficient75_89,
  OriginalRow227TriangleData1044.coefficient75_90,
  OriginalRow227TriangleData1044.coefficient75_91,
  OriginalRow227TriangleData1044.coefficient75_92,
  OriginalRow227TriangleData1044.coefficient75_93,
  OriginalRow227TriangleData1044.coefficient75_94,
  OriginalRow227TriangleData1044.coefficient75_95,
  OriginalRow227TriangleData1044.coefficient75_96,
  OriginalRow227TriangleData1044.coefficient75_97,
  OriginalRow227TriangleData1044.coefficient75_98,
  OriginalRow227TriangleData1044.coefficient75_99,
  OriginalRow227TriangleData1044.coefficient75_100,
  OriginalRow227TriangleData1044.coefficient75_101,
  OriginalRow227TriangleData1044.coefficient75_102,
  OriginalRow227TriangleData1044.coefficient75_103,
  OriginalRow227TriangleData1044.coefficient75_104,
  OriginalRow227TriangleData1044.coefficient75_105
]

theorem values1044_size : values1044.size = 32 := rfl

def block1044 : ℕ → Option IntervalDyadic := segment 74 values1044

theorem block1044_domain : ExactDomain block1044 74 106 := by
  simpa only [values1044_size] using segment_domain 74 values1044

theorem block1044_get (i : Fin 32) :
    block1044 (74 + i.val) = some (values1044[i.val]'(by rw [values1044_size]; exact i.isLt)) := by
  exact segment_get 74 values1044 ⟨i.val, by rw [values1044_size]; exact i.isLt⟩

def values1045 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1045.coefficient75_106,
  OriginalRow227TriangleData1045.coefficient75_107,
  OriginalRow227TriangleData1045.coefficient75_108,
  OriginalRow227TriangleData1045.coefficient75_109,
  OriginalRow227TriangleData1045.coefficient75_110,
  OriginalRow227TriangleData1045.coefficient75_111,
  OriginalRow227TriangleData1045.coefficient75_112,
  OriginalRow227TriangleData1045.coefficient75_113,
  OriginalRow227TriangleData1045.coefficient75_114,
  OriginalRow227TriangleData1045.coefficient75_115,
  OriginalRow227TriangleData1045.coefficient75_116,
  OriginalRow227TriangleData1045.coefficient75_117,
  OriginalRow227TriangleData1045.coefficient75_118,
  OriginalRow227TriangleData1045.coefficient75_119,
  OriginalRow227TriangleData1045.coefficient75_120,
  OriginalRow227TriangleData1045.coefficient75_121,
  OriginalRow227TriangleData1045.coefficient75_122,
  OriginalRow227TriangleData1045.coefficient75_123,
  OriginalRow227TriangleData1045.coefficient75_124,
  OriginalRow227TriangleData1045.coefficient75_125,
  OriginalRow227TriangleData1045.coefficient75_126,
  OriginalRow227TriangleData1045.coefficient75_127,
  OriginalRow227TriangleData1045.coefficient75_128,
  OriginalRow227TriangleData1045.coefficient75_129,
  OriginalRow227TriangleData1045.coefficient75_130,
  OriginalRow227TriangleData1045.coefficient75_131,
  OriginalRow227TriangleData1045.coefficient75_132,
  OriginalRow227TriangleData1045.coefficient75_133,
  OriginalRow227TriangleData1045.coefficient75_134,
  OriginalRow227TriangleData1045.coefficient75_135,
  OriginalRow227TriangleData1045.coefficient75_136,
  OriginalRow227TriangleData1045.coefficient75_137
]

theorem values1045_size : values1045.size = 32 := rfl

def block1045 : ℕ → Option IntervalDyadic := segment 106 values1045

theorem block1045_domain : ExactDomain block1045 106 138 := by
  simpa only [values1045_size] using segment_domain 106 values1045

theorem block1045_get (i : Fin 32) :
    block1045 (106 + i.val) = some (values1045[i.val]'(by rw [values1045_size]; exact i.isLt)) := by
  exact segment_get 106 values1045 ⟨i.val, by rw [values1045_size]; exact i.isLt⟩

def values1046 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1046.coefficient75_138,
  OriginalRow227TriangleData1046.coefficient75_139,
  OriginalRow227TriangleData1046.coefficient75_140,
  OriginalRow227TriangleData1046.coefficient75_141,
  OriginalRow227TriangleData1046.coefficient75_142,
  OriginalRow227TriangleData1046.coefficient75_143,
  OriginalRow227TriangleData1046.coefficient75_144,
  OriginalRow227TriangleData1046.coefficient75_145,
  OriginalRow227TriangleData1046.coefficient75_146,
  OriginalRow227TriangleData1046.coefficient75_147,
  OriginalRow227TriangleData1046.coefficient75_148,
  OriginalRow227TriangleData1046.coefficient75_149,
  OriginalRow227TriangleData1046.coefficient75_150,
  OriginalRow227TriangleData1046.coefficient75_151,
  OriginalRow227TriangleData1046.coefficient75_152,
  OriginalRow227TriangleData1046.coefficient75_153,
  OriginalRow227TriangleData1046.coefficient75_154,
  OriginalRow227TriangleData1046.coefficient75_155,
  OriginalRow227TriangleData1046.coefficient75_156,
  OriginalRow227TriangleData1046.coefficient75_157,
  OriginalRow227TriangleData1046.coefficient75_158,
  OriginalRow227TriangleData1046.coefficient75_159,
  OriginalRow227TriangleData1046.coefficient75_160,
  OriginalRow227TriangleData1046.coefficient75_161,
  OriginalRow227TriangleData1046.coefficient75_162,
  OriginalRow227TriangleData1046.coefficient75_163,
  OriginalRow227TriangleData1046.coefficient75_164,
  OriginalRow227TriangleData1046.coefficient75_165,
  OriginalRow227TriangleData1046.coefficient75_166,
  OriginalRow227TriangleData1046.coefficient75_167,
  OriginalRow227TriangleData1046.coefficient75_168,
  OriginalRow227TriangleData1046.coefficient75_169
]

theorem values1046_size : values1046.size = 32 := rfl

def block1046 : ℕ → Option IntervalDyadic := segment 138 values1046

theorem block1046_domain : ExactDomain block1046 138 170 := by
  simpa only [values1046_size] using segment_domain 138 values1046

theorem block1046_get (i : Fin 32) :
    block1046 (138 + i.val) = some (values1046[i.val]'(by rw [values1046_size]; exact i.isLt)) := by
  exact segment_get 138 values1046 ⟨i.val, by rw [values1046_size]; exact i.isLt⟩

def values1047 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1047.coefficient75_170,
  OriginalRow227TriangleData1047.coefficient75_171,
  OriginalRow227TriangleData1047.coefficient75_172,
  OriginalRow227TriangleData1047.coefficient75_173,
  OriginalRow227TriangleData1047.coefficient75_174,
  OriginalRow227TriangleData1047.coefficient75_175,
  OriginalRow227TriangleData1047.coefficient75_176,
  OriginalRow227TriangleData1047.coefficient75_177,
  OriginalRow227TriangleData1047.coefficient75_178,
  OriginalRow227TriangleData1047.coefficient75_179,
  OriginalRow227TriangleData1047.coefficient75_180,
  OriginalRow227TriangleData1047.coefficient75_181,
  OriginalRow227TriangleData1047.coefficient75_182,
  OriginalRow227TriangleData1047.coefficient75_183,
  OriginalRow227TriangleData1047.coefficient75_184,
  OriginalRow227TriangleData1047.coefficient75_185,
  OriginalRow227TriangleData1047.coefficient75_186,
  OriginalRow227TriangleData1047.coefficient75_187,
  OriginalRow227TriangleData1047.coefficient75_188,
  OriginalRow227TriangleData1047.coefficient75_189,
  OriginalRow227TriangleData1047.coefficient75_190,
  OriginalRow227TriangleData1047.coefficient75_191,
  OriginalRow227TriangleData1047.coefficient75_192,
  OriginalRow227TriangleData1047.coefficient75_193,
  OriginalRow227TriangleData1047.coefficient75_194,
  OriginalRow227TriangleData1047.coefficient75_195,
  OriginalRow227TriangleData1047.coefficient75_196,
  OriginalRow227TriangleData1047.coefficient75_197,
  OriginalRow227TriangleData1047.coefficient75_198,
  OriginalRow227TriangleData1047.coefficient75_199,
  OriginalRow227TriangleData1047.coefficient75_200,
  OriginalRow227TriangleData1047.coefficient75_201
]

theorem values1047_size : values1047.size = 32 := rfl

def block1047 : ℕ → Option IntervalDyadic := segment 170 values1047

theorem block1047_domain : ExactDomain block1047 170 202 := by
  simpa only [values1047_size] using segment_domain 170 values1047

theorem block1047_get (i : Fin 32) :
    block1047 (170 + i.val) = some (values1047[i.val]'(by rw [values1047_size]; exact i.isLt)) := by
  exact segment_get 170 values1047 ⟨i.val, by rw [values1047_size]; exact i.isLt⟩

def values1048 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1048.coefficient75_202,
  OriginalRow227TriangleData1048.coefficient75_203,
  OriginalRow227TriangleData1048.coefficient75_204,
  OriginalRow227TriangleData1048.coefficient75_205,
  OriginalRow227TriangleData1048.coefficient75_206,
  OriginalRow227TriangleData1048.coefficient75_207,
  OriginalRow227TriangleData1048.coefficient75_208,
  OriginalRow227TriangleData1048.coefficient75_209,
  OriginalRow227TriangleData1048.coefficient75_210,
  OriginalRow227TriangleData1048.coefficient75_211,
  OriginalRow227TriangleData1048.coefficient75_212,
  OriginalRow227TriangleData1048.coefficient75_213,
  OriginalRow227TriangleData1048.coefficient75_214,
  OriginalRow227TriangleData1048.coefficient75_215,
  OriginalRow227TriangleData1048.coefficient75_216,
  OriginalRow227TriangleData1048.coefficient75_217,
  OriginalRow227TriangleData1048.coefficient75_218,
  OriginalRow227TriangleData1048.coefficient75_219,
  OriginalRow227TriangleData1048.coefficient75_220,
  OriginalRow227TriangleData1048.coefficient75_221,
  OriginalRow227TriangleData1048.coefficient75_222,
  OriginalRow227TriangleData1048.coefficient75_223,
  OriginalRow227TriangleData1048.coefficient75_224,
  OriginalRow227TriangleData1048.coefficient75_225,
  OriginalRow227TriangleData1048.coefficient75_226,
  OriginalRow227TriangleData1048.coefficient75_227,
  OriginalRow227TriangleData1048.coefficient75_228,
  OriginalRow227TriangleData1048.coefficient75_229,
  OriginalRow227TriangleData1048.coefficient75_230,
  OriginalRow227TriangleData1048.coefficient75_231,
  OriginalRow227TriangleData1048.coefficient75_232,
  OriginalRow227TriangleData1048.coefficient75_233
]

theorem values1048_size : values1048.size = 32 := rfl

def block1048 : ℕ → Option IntervalDyadic := segment 202 values1048

theorem block1048_domain : ExactDomain block1048 202 234 := by
  simpa only [values1048_size] using segment_domain 202 values1048

theorem block1048_get (i : Fin 32) :
    block1048 (202 + i.val) = some (values1048[i.val]'(by rw [values1048_size]; exact i.isLt)) := by
  exact segment_get 202 values1048 ⟨i.val, by rw [values1048_size]; exact i.isLt⟩

def values1049 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1049.coefficient75_234,
  OriginalRow227TriangleData1049.coefficient75_235,
  OriginalRow227TriangleData1049.coefficient75_236,
  OriginalRow227TriangleData1049.coefficient75_237,
  OriginalRow227TriangleData1049.coefficient75_238,
  OriginalRow227TriangleData1049.coefficient75_239,
  OriginalRow227TriangleData1049.coefficient75_240,
  OriginalRow227TriangleData1049.coefficient75_241,
  OriginalRow227TriangleData1049.coefficient75_242,
  OriginalRow227TriangleData1049.coefficient75_243,
  OriginalRow227TriangleData1049.coefficient75_244,
  OriginalRow227TriangleData1049.coefficient75_245,
  OriginalRow227TriangleData1049.coefficient75_246,
  OriginalRow227TriangleData1049.coefficient75_247,
  OriginalRow227TriangleData1049.coefficient75_248,
  OriginalRow227TriangleData1049.coefficient75_249,
  OriginalRow227TriangleData1049.coefficient75_250,
  OriginalRow227TriangleData1049.coefficient75_251,
  OriginalRow227TriangleData1049.coefficient75_252,
  OriginalRow227TriangleData1049.coefficient75_253,
  OriginalRow227TriangleData1049.coefficient75_254,
  OriginalRow227TriangleData1049.coefficient75_255,
  OriginalRow227TriangleData1049.coefficient75_256,
  OriginalRow227TriangleData1049.coefficient75_257,
  OriginalRow227TriangleData1049.coefficient75_258,
  OriginalRow227TriangleData1049.coefficient75_259,
  OriginalRow227TriangleData1049.coefficient75_260,
  OriginalRow227TriangleData1049.coefficient75_261,
  OriginalRow227TriangleData1049.coefficient75_262,
  OriginalRow227TriangleData1049.coefficient75_263,
  OriginalRow227TriangleData1049.coefficient75_264,
  OriginalRow227TriangleData1049.coefficient75_265
]

theorem values1049_size : values1049.size = 32 := rfl

def block1049 : ℕ → Option IntervalDyadic := segment 234 values1049

theorem block1049_domain : ExactDomain block1049 234 266 := by
  simpa only [values1049_size] using segment_domain 234 values1049

theorem block1049_get (i : Fin 32) :
    block1049 (234 + i.val) = some (values1049[i.val]'(by rw [values1049_size]; exact i.isLt)) := by
  exact segment_get 234 values1049 ⟨i.val, by rw [values1049_size]; exact i.isLt⟩

def values1050 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1050.coefficient75_266,
  OriginalRow227TriangleData1050.coefficient75_267,
  OriginalRow227TriangleData1050.coefficient75_268,
  OriginalRow227TriangleData1050.coefficient75_269,
  OriginalRow227TriangleData1050.coefficient75_270,
  OriginalRow227TriangleData1050.coefficient75_271,
  OriginalRow227TriangleData1050.coefficient75_272,
  OriginalRow227TriangleData1050.coefficient75_273,
  OriginalRow227TriangleData1050.coefficient75_274,
  OriginalRow227TriangleData1050.coefficient75_275,
  OriginalRow227TriangleData1050.coefficient75_276,
  OriginalRow227TriangleData1050.coefficient75_277,
  OriginalRow227TriangleData1050.coefficient75_278,
  OriginalRow227TriangleData1050.coefficient75_279,
  OriginalRow227TriangleData1050.coefficient75_280,
  OriginalRow227TriangleData1050.coefficient75_281,
  OriginalRow227TriangleData1050.coefficient75_282,
  OriginalRow227TriangleData1050.coefficient75_283,
  OriginalRow227TriangleData1050.coefficient75_284,
  OriginalRow227TriangleData1050.coefficient75_285,
  OriginalRow227TriangleData1050.coefficient75_286,
  OriginalRow227TriangleData1050.coefficient75_287,
  OriginalRow227TriangleData1050.coefficient75_288,
  OriginalRow227TriangleData1050.coefficient75_289,
  OriginalRow227TriangleData1050.coefficient75_290,
  OriginalRow227TriangleData1050.coefficient75_291,
  OriginalRow227TriangleData1050.coefficient75_292,
  OriginalRow227TriangleData1050.coefficient75_293,
  OriginalRow227TriangleData1050.coefficient75_294,
  OriginalRow227TriangleData1050.coefficient75_295,
  OriginalRow227TriangleData1050.coefficient75_296,
  OriginalRow227TriangleData1050.coefficient75_297
]

theorem values1050_size : values1050.size = 32 := rfl

def block1050 : ℕ → Option IntervalDyadic := segment 266 values1050

theorem block1050_domain : ExactDomain block1050 266 298 := by
  simpa only [values1050_size] using segment_domain 266 values1050

theorem block1050_get (i : Fin 32) :
    block1050 (266 + i.val) = some (values1050[i.val]'(by rw [values1050_size]; exact i.isLt)) := by
  exact segment_get 266 values1050 ⟨i.val, by rw [values1050_size]; exact i.isLt⟩

def values1051 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1051.coefficient75_298,
  OriginalRow227TriangleData1051.coefficient75_299,
  OriginalRow227TriangleData1051.coefficient75_300,
  OriginalRow227TriangleData1051.coefficient75_301,
  OriginalRow227TriangleData1051.coefficient75_302,
  OriginalRow227TriangleData1051.coefficient75_303,
  OriginalRow227TriangleData1051.coefficient75_304,
  OriginalRow227TriangleData1051.coefficient75_305,
  OriginalRow227TriangleData1051.coefficient75_306,
  OriginalRow227TriangleData1051.coefficient75_307,
  OriginalRow227TriangleData1051.coefficient75_308,
  OriginalRow227TriangleData1051.coefficient75_309,
  OriginalRow227TriangleData1051.coefficient75_310,
  OriginalRow227TriangleData1051.coefficient75_311,
  OriginalRow227TriangleData1051.coefficient75_312,
  OriginalRow227TriangleData1051.coefficient75_313,
  OriginalRow227TriangleData1051.coefficient75_314,
  OriginalRow227TriangleData1051.coefficient75_315,
  OriginalRow227TriangleData1051.coefficient75_316,
  OriginalRow227TriangleData1051.coefficient75_317,
  OriginalRow227TriangleData1051.coefficient75_318,
  OriginalRow227TriangleData1051.coefficient75_319,
  OriginalRow227TriangleData1051.coefficient75_320,
  OriginalRow227TriangleData1051.coefficient75_321,
  OriginalRow227TriangleData1051.coefficient75_322,
  OriginalRow227TriangleData1051.coefficient75_323,
  OriginalRow227TriangleData1051.coefficient75_324,
  OriginalRow227TriangleData1051.coefficient75_325,
  OriginalRow227TriangleData1051.coefficient75_326,
  OriginalRow227TriangleData1051.coefficient75_327,
  OriginalRow227TriangleData1051.coefficient75_328,
  OriginalRow227TriangleData1051.coefficient75_329
]

theorem values1051_size : values1051.size = 32 := rfl

def block1051 : ℕ → Option IntervalDyadic := segment 298 values1051

theorem block1051_domain : ExactDomain block1051 298 330 := by
  simpa only [values1051_size] using segment_domain 298 values1051

theorem block1051_get (i : Fin 32) :
    block1051 (298 + i.val) = some (values1051[i.val]'(by rw [values1051_size]; exact i.isLt)) := by
  exact segment_get 298 values1051 ⟨i.val, by rw [values1051_size]; exact i.isLt⟩

def values1052 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1052.coefficient75_330,
  OriginalRow227TriangleData1052.coefficient75_331,
  OriginalRow227TriangleData1052.coefficient75_332,
  OriginalRow227TriangleData1052.coefficient75_333,
  OriginalRow227TriangleData1052.coefficient75_334,
  OriginalRow227TriangleData1052.coefficient75_335,
  OriginalRow227TriangleData1052.coefficient75_336,
  OriginalRow227TriangleData1052.coefficient75_337,
  OriginalRow227TriangleData1052.coefficient75_338,
  OriginalRow227TriangleData1052.coefficient75_339,
  OriginalRow227TriangleData1052.coefficient75_340,
  OriginalRow227TriangleData1052.coefficient75_341,
  OriginalRow227TriangleData1052.coefficient75_342,
  OriginalRow227TriangleData1052.coefficient75_343,
  OriginalRow227TriangleData1052.coefficient75_344,
  OriginalRow227TriangleData1052.coefficient75_345,
  OriginalRow227TriangleData1052.coefficient75_346,
  OriginalRow227TriangleData1052.coefficient75_347,
  OriginalRow227TriangleData1052.coefficient75_348,
  OriginalRow227TriangleData1052.coefficient75_349,
  OriginalRow227TriangleData1052.coefficient75_350,
  OriginalRow227TriangleData1052.coefficient75_351,
  OriginalRow227TriangleData1052.coefficient75_352,
  OriginalRow227TriangleData1052.coefficient75_353,
  OriginalRow227TriangleData1052.coefficient75_354,
  OriginalRow227TriangleData1052.coefficient75_355,
  OriginalRow227TriangleData1052.coefficient75_356,
  OriginalRow227TriangleData1052.coefficient75_357,
  OriginalRow227TriangleData1052.coefficient75_358,
  OriginalRow227TriangleData1052.coefficient75_359,
  OriginalRow227TriangleData1052.coefficient75_360,
  OriginalRow227TriangleData1052.coefficient75_361
]

theorem values1052_size : values1052.size = 32 := rfl

def block1052 : ℕ → Option IntervalDyadic := segment 330 values1052

theorem block1052_domain : ExactDomain block1052 330 362 := by
  simpa only [values1052_size] using segment_domain 330 values1052

theorem block1052_get (i : Fin 32) :
    block1052 (330 + i.val) = some (values1052[i.val]'(by rw [values1052_size]; exact i.isLt)) := by
  exact segment_get 330 values1052 ⟨i.val, by rw [values1052_size]; exact i.isLt⟩

def values1053 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1053.coefficient75_362,
  OriginalRow227TriangleData1053.coefficient75_363,
  OriginalRow227TriangleData1053.coefficient75_364,
  OriginalRow227TriangleData1053.coefficient75_365,
  OriginalRow227TriangleData1053.coefficient75_366,
  OriginalRow227TriangleData1053.coefficient75_367,
  OriginalRow227TriangleData1053.coefficient75_368,
  OriginalRow227TriangleData1053.coefficient75_369,
  OriginalRow227TriangleData1053.coefficient75_370,
  OriginalRow227TriangleData1053.coefficient75_371,
  OriginalRow227TriangleData1053.coefficient75_372,
  OriginalRow227TriangleData1053.coefficient75_373,
  OriginalRow227TriangleData1053.coefficient75_374,
  OriginalRow227TriangleData1053.coefficient75_375,
  OriginalRow227TriangleData1053.coefficient75_376,
  OriginalRow227TriangleData1053.coefficient75_377,
  OriginalRow227TriangleData1053.coefficient75_378,
  OriginalRow227TriangleData1053.coefficient75_379,
  OriginalRow227TriangleData1053.coefficient75_380,
  OriginalRow227TriangleData1053.coefficient75_381,
  OriginalRow227TriangleData1053.coefficient75_382,
  OriginalRow227TriangleData1053.coefficient75_383,
  OriginalRow227TriangleData1053.coefficient75_384,
  OriginalRow227TriangleData1053.coefficient75_385,
  OriginalRow227TriangleData1053.coefficient75_386,
  OriginalRow227TriangleData1053.coefficient75_387,
  OriginalRow227TriangleData1053.coefficient75_388,
  OriginalRow227TriangleData1053.coefficient75_389,
  OriginalRow227TriangleData1053.coefficient75_390,
  OriginalRow227TriangleData1053.coefficient75_391,
  OriginalRow227TriangleData1053.coefficient75_392,
  OriginalRow227TriangleData1053.coefficient75_393
]

theorem values1053_size : values1053.size = 32 := rfl

def block1053 : ℕ → Option IntervalDyadic := segment 362 values1053

theorem block1053_domain : ExactDomain block1053 362 394 := by
  simpa only [values1053_size] using segment_domain 362 values1053

theorem block1053_get (i : Fin 32) :
    block1053 (362 + i.val) = some (values1053[i.val]'(by rw [values1053_size]; exact i.isLt)) := by
  exact segment_get 362 values1053 ⟨i.val, by rw [values1053_size]; exact i.isLt⟩

def values1054 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1054.coefficient75_394,
  OriginalRow227TriangleData1054.coefficient75_395,
  OriginalRow227TriangleData1054.coefficient75_396,
  OriginalRow227TriangleData1054.coefficient75_397,
  OriginalRow227TriangleData1054.coefficient75_398,
  OriginalRow227TriangleData1054.coefficient75_399,
  OriginalRow227TriangleData1054.coefficient75_400,
  OriginalRow227TriangleData1054.coefficient75_401,
  OriginalRow227TriangleData1054.coefficient75_402,
  OriginalRow227TriangleData1054.coefficient75_403,
  OriginalRow227TriangleData1054.coefficient75_404,
  OriginalRow227TriangleData1054.coefficient75_405,
  OriginalRow227TriangleData1054.coefficient75_406,
  OriginalRow227TriangleData1054.coefficient75_407,
  OriginalRow227TriangleData1054.coefficient75_408,
  OriginalRow227TriangleData1054.coefficient75_409,
  OriginalRow227TriangleData1054.coefficient75_410,
  OriginalRow227TriangleData1054.coefficient75_411,
  OriginalRow227TriangleData1054.coefficient75_412,
  OriginalRow227TriangleData1054.coefficient75_413,
  OriginalRow227TriangleData1054.coefficient75_414,
  OriginalRow227TriangleData1054.coefficient75_415,
  OriginalRow227TriangleData1054.coefficient75_416,
  OriginalRow227TriangleData1054.coefficient75_417,
  OriginalRow227TriangleData1054.coefficient75_418,
  OriginalRow227TriangleData1054.coefficient75_419,
  OriginalRow227TriangleData1054.coefficient75_420,
  OriginalRow227TriangleData1054.coefficient75_421,
  OriginalRow227TriangleData1054.coefficient75_422,
  OriginalRow227TriangleData1054.coefficient75_423,
  OriginalRow227TriangleData1054.coefficient75_424,
  OriginalRow227TriangleData1054.coefficient75_425
]

theorem values1054_size : values1054.size = 32 := rfl

def block1054 : ℕ → Option IntervalDyadic := segment 394 values1054

theorem block1054_domain : ExactDomain block1054 394 426 := by
  simpa only [values1054_size] using segment_domain 394 values1054

theorem block1054_get (i : Fin 32) :
    block1054 (394 + i.val) = some (values1054[i.val]'(by rw [values1054_size]; exact i.isLt)) := by
  exact segment_get 394 values1054 ⟨i.val, by rw [values1054_size]; exact i.isLt⟩

def values1055 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1055.coefficient75_426
]

theorem values1055_size : values1055.size = 1 := rfl

def block1055 : ℕ → Option IntervalDyadic := segment 426 values1055

theorem block1055_domain : ExactDomain block1055 426 427 := by
  simpa only [values1055_size] using segment_domain 426 values1055

theorem block1055_get (i : Fin 1) :
    block1055 (426 + i.val) = some (values1055[i.val]'(by rw [values1055_size]; exact i.isLt)) := by
  exact segment_get 426 values1055 ⟨i.val, by rw [values1055_size]; exact i.isLt⟩

def node0106_0170 : ℕ → Option IntervalDyadic := split 138 block1045 block1046

theorem node0106_0170_domain : ExactDomain node0106_0170 106 170 := by
  exact split_domain (by decide) (by decide) block1045_domain block1046_domain

def node0074_0170 : ℕ → Option IntervalDyadic := split 106 block1044 node0106_0170

theorem node0074_0170_domain : ExactDomain node0074_0170 74 170 := by
  exact split_domain (by decide) (by decide) block1044_domain node0106_0170_domain

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block1048 block1049

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block1048_domain block1049_domain

def node0170_0266 : ℕ → Option IntervalDyadic := split 202 block1047 node0202_0266

theorem node0170_0266_domain : ExactDomain node0170_0266 170 266 := by
  exact split_domain (by decide) (by decide) block1047_domain node0202_0266_domain

def node0074_0266 : ℕ → Option IntervalDyadic := split 170 node0074_0170 node0170_0266

theorem node0074_0266_domain : ExactDomain node0074_0266 74 266 := by
  exact split_domain (by decide) (by decide) node0074_0170_domain node0170_0266_domain

def node0298_0362 : ℕ → Option IntervalDyadic := split 330 block1051 block1052

theorem node0298_0362_domain : ExactDomain node0298_0362 298 362 := by
  exact split_domain (by decide) (by decide) block1051_domain block1052_domain

def node0266_0362 : ℕ → Option IntervalDyadic := split 298 block1050 node0298_0362

theorem node0266_0362_domain : ExactDomain node0266_0362 266 362 := by
  exact split_domain (by decide) (by decide) block1050_domain node0298_0362_domain

def node0394_0427 : ℕ → Option IntervalDyadic := split 426 block1054 block1055

theorem node0394_0427_domain : ExactDomain node0394_0427 394 427 := by
  exact split_domain (by decide) (by decide) block1054_domain block1055_domain

def node0362_0427 : ℕ → Option IntervalDyadic := split 394 block1053 node0394_0427

theorem node0362_0427_domain : ExactDomain node0362_0427 362 427 := by
  exact split_domain (by decide) (by decide) block1053_domain node0394_0427_domain

def node0266_0427 : ℕ → Option IntervalDyadic := split 362 node0266_0362 node0362_0427

theorem node0266_0427_domain : ExactDomain node0266_0427 266 427 := by
  exact split_domain (by decide) (by decide) node0266_0362_domain node0362_0427_domain

def node0074_0427 : ℕ → Option IntervalDyadic := split 266 node0074_0266 node0266_0427

theorem node0074_0427_domain : ExactDomain node0074_0427 74 427 := by
  exact split_domain (by decide) (by decide) node0074_0266_domain node0266_0427_domain

def lookup : ℕ → Option IntervalDyadic := node0074_0427

theorem lookup_domain : ExactDomain lookup 74 427 :=
  node0074_0427_domain

theorem block1044_lookup (i : Fin 32) :
    lookup (74 + i.val) = some (values1044[i.val]'(by rw [values1044_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (74 + i.val) = _
  rw [node0074_0427, split_left 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0074_0266, split_left 170 node0074_0170 node0170_0266 (by omega)]
  rw [node0074_0170, split_left 106 block1044 node0106_0170 (by omega)]
  exact block1044_get i

theorem block1045_lookup (i : Fin 32) :
    lookup (106 + i.val) = some (values1045[i.val]'(by rw [values1045_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (106 + i.val) = _
  rw [node0074_0427, split_left 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0074_0266, split_left 170 node0074_0170 node0170_0266 (by omega)]
  rw [node0074_0170, split_right 106 block1044 node0106_0170 (by omega)]
  rw [node0106_0170, split_left 138 block1045 block1046 (by omega)]
  exact block1045_get i

theorem block1046_lookup (i : Fin 32) :
    lookup (138 + i.val) = some (values1046[i.val]'(by rw [values1046_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (138 + i.val) = _
  rw [node0074_0427, split_left 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0074_0266, split_left 170 node0074_0170 node0170_0266 (by omega)]
  rw [node0074_0170, split_right 106 block1044 node0106_0170 (by omega)]
  rw [node0106_0170, split_right 138 block1045 block1046 (by omega)]
  exact block1046_get i

theorem block1047_lookup (i : Fin 32) :
    lookup (170 + i.val) = some (values1047[i.val]'(by rw [values1047_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (170 + i.val) = _
  rw [node0074_0427, split_left 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0074_0266, split_right 170 node0074_0170 node0170_0266 (by omega)]
  rw [node0170_0266, split_left 202 block1047 node0202_0266 (by omega)]
  exact block1047_get i

theorem block1048_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values1048[i.val]'(by rw [values1048_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (202 + i.val) = _
  rw [node0074_0427, split_left 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0074_0266, split_right 170 node0074_0170 node0170_0266 (by omega)]
  rw [node0170_0266, split_right 202 block1047 node0202_0266 (by omega)]
  rw [node0202_0266, split_left 234 block1048 block1049 (by omega)]
  exact block1048_get i

theorem block1049_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values1049[i.val]'(by rw [values1049_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (234 + i.val) = _
  rw [node0074_0427, split_left 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0074_0266, split_right 170 node0074_0170 node0170_0266 (by omega)]
  rw [node0170_0266, split_right 202 block1047 node0202_0266 (by omega)]
  rw [node0202_0266, split_right 234 block1048 block1049 (by omega)]
  exact block1049_get i

theorem block1050_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values1050[i.val]'(by rw [values1050_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (266 + i.val) = _
  rw [node0074_0427, split_right 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0266_0427, split_left 362 node0266_0362 node0362_0427 (by omega)]
  rw [node0266_0362, split_left 298 block1050 node0298_0362 (by omega)]
  exact block1050_get i

theorem block1051_lookup (i : Fin 32) :
    lookup (298 + i.val) = some (values1051[i.val]'(by rw [values1051_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (298 + i.val) = _
  rw [node0074_0427, split_right 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0266_0427, split_left 362 node0266_0362 node0362_0427 (by omega)]
  rw [node0266_0362, split_right 298 block1050 node0298_0362 (by omega)]
  rw [node0298_0362, split_left 330 block1051 block1052 (by omega)]
  exact block1051_get i

theorem block1052_lookup (i : Fin 32) :
    lookup (330 + i.val) = some (values1052[i.val]'(by rw [values1052_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (330 + i.val) = _
  rw [node0074_0427, split_right 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0266_0427, split_left 362 node0266_0362 node0362_0427 (by omega)]
  rw [node0266_0362, split_right 298 block1050 node0298_0362 (by omega)]
  rw [node0298_0362, split_right 330 block1051 block1052 (by omega)]
  exact block1052_get i

theorem block1053_lookup (i : Fin 32) :
    lookup (362 + i.val) = some (values1053[i.val]'(by rw [values1053_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (362 + i.val) = _
  rw [node0074_0427, split_right 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0266_0427, split_right 362 node0266_0362 node0362_0427 (by omega)]
  rw [node0362_0427, split_left 394 block1053 node0394_0427 (by omega)]
  exact block1053_get i

theorem block1054_lookup (i : Fin 32) :
    lookup (394 + i.val) = some (values1054[i.val]'(by rw [values1054_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (394 + i.val) = _
  rw [node0074_0427, split_right 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0266_0427, split_right 362 node0266_0362 node0362_0427 (by omega)]
  rw [node0362_0427, split_right 394 block1053 node0394_0427 (by omega)]
  rw [node0394_0427, split_left 426 block1054 block1055 (by omega)]
  exact block1054_get i

theorem block1055_lookup (i : Fin 1) :
    lookup (426 + i.val) = some (values1055[i.val]'(by rw [values1055_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0074_0427 (426 + i.val) = _
  rw [node0074_0427, split_right 266 node0074_0266 node0266_0427 (by omega)]
  rw [node0266_0427, split_right 362 node0266_0362 node0362_0427 (by omega)]
  rw [node0362_0427, split_right 394 block1053 node0394_0427 (by omega)]
  rw [node0394_0427, split_right 426 block1054 block1055 (by omega)]
  exact block1055_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1044_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1044_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1045_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1045_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1046_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1046_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1047_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1047_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1048_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1048_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1049_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1049_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1050_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1050_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1051_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1051_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1052_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1052_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1053_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1053_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1054_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1054_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1055_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1055_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1044_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1045_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1046_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1047_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1048_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1049_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1050_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1051_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1052_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1053_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1054_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow075.block1055_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow075
