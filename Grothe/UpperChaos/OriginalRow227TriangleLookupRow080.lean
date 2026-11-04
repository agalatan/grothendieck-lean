import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1100
import Grothe.UpperChaos.OriginalRow227TriangleData1101
import Grothe.UpperChaos.OriginalRow227TriangleData1102
import Grothe.UpperChaos.OriginalRow227TriangleData1103
import Grothe.UpperChaos.OriginalRow227TriangleData1104
import Grothe.UpperChaos.OriginalRow227TriangleData1105
import Grothe.UpperChaos.OriginalRow227TriangleData1106
import Grothe.UpperChaos.OriginalRow227TriangleData1107
import Grothe.UpperChaos.OriginalRow227TriangleData1108
import Grothe.UpperChaos.OriginalRow227TriangleData1109
import Grothe.UpperChaos.OriginalRow227TriangleData1110

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow080

open ConditionalTableLookup

def values1100 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1100.coefficient80_79,
  OriginalRow227TriangleData1100.coefficient80_80,
  OriginalRow227TriangleData1100.coefficient80_81,
  OriginalRow227TriangleData1100.coefficient80_82,
  OriginalRow227TriangleData1100.coefficient80_83,
  OriginalRow227TriangleData1100.coefficient80_84,
  OriginalRow227TriangleData1100.coefficient80_85,
  OriginalRow227TriangleData1100.coefficient80_86,
  OriginalRow227TriangleData1100.coefficient80_87,
  OriginalRow227TriangleData1100.coefficient80_88,
  OriginalRow227TriangleData1100.coefficient80_89,
  OriginalRow227TriangleData1100.coefficient80_90,
  OriginalRow227TriangleData1100.coefficient80_91,
  OriginalRow227TriangleData1100.coefficient80_92,
  OriginalRow227TriangleData1100.coefficient80_93,
  OriginalRow227TriangleData1100.coefficient80_94,
  OriginalRow227TriangleData1100.coefficient80_95,
  OriginalRow227TriangleData1100.coefficient80_96,
  OriginalRow227TriangleData1100.coefficient80_97,
  OriginalRow227TriangleData1100.coefficient80_98,
  OriginalRow227TriangleData1100.coefficient80_99,
  OriginalRow227TriangleData1100.coefficient80_100,
  OriginalRow227TriangleData1100.coefficient80_101,
  OriginalRow227TriangleData1100.coefficient80_102,
  OriginalRow227TriangleData1100.coefficient80_103,
  OriginalRow227TriangleData1100.coefficient80_104,
  OriginalRow227TriangleData1100.coefficient80_105,
  OriginalRow227TriangleData1100.coefficient80_106,
  OriginalRow227TriangleData1100.coefficient80_107,
  OriginalRow227TriangleData1100.coefficient80_108,
  OriginalRow227TriangleData1100.coefficient80_109,
  OriginalRow227TriangleData1100.coefficient80_110
]

theorem values1100_size : values1100.size = 32 := rfl

def block1100 : ℕ → Option IntervalDyadic := segment 79 values1100

theorem block1100_domain : ExactDomain block1100 79 111 := by
  simpa only [values1100_size] using segment_domain 79 values1100

theorem block1100_get (i : Fin 32) :
    block1100 (79 + i.val) = some (values1100[i.val]'(by rw [values1100_size]; exact i.isLt)) := by
  exact segment_get 79 values1100 ⟨i.val, by rw [values1100_size]; exact i.isLt⟩

def values1101 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1101.coefficient80_111,
  OriginalRow227TriangleData1101.coefficient80_112,
  OriginalRow227TriangleData1101.coefficient80_113,
  OriginalRow227TriangleData1101.coefficient80_114,
  OriginalRow227TriangleData1101.coefficient80_115,
  OriginalRow227TriangleData1101.coefficient80_116,
  OriginalRow227TriangleData1101.coefficient80_117,
  OriginalRow227TriangleData1101.coefficient80_118,
  OriginalRow227TriangleData1101.coefficient80_119,
  OriginalRow227TriangleData1101.coefficient80_120,
  OriginalRow227TriangleData1101.coefficient80_121,
  OriginalRow227TriangleData1101.coefficient80_122,
  OriginalRow227TriangleData1101.coefficient80_123,
  OriginalRow227TriangleData1101.coefficient80_124,
  OriginalRow227TriangleData1101.coefficient80_125,
  OriginalRow227TriangleData1101.coefficient80_126,
  OriginalRow227TriangleData1101.coefficient80_127,
  OriginalRow227TriangleData1101.coefficient80_128,
  OriginalRow227TriangleData1101.coefficient80_129,
  OriginalRow227TriangleData1101.coefficient80_130,
  OriginalRow227TriangleData1101.coefficient80_131,
  OriginalRow227TriangleData1101.coefficient80_132,
  OriginalRow227TriangleData1101.coefficient80_133,
  OriginalRow227TriangleData1101.coefficient80_134,
  OriginalRow227TriangleData1101.coefficient80_135,
  OriginalRow227TriangleData1101.coefficient80_136,
  OriginalRow227TriangleData1101.coefficient80_137,
  OriginalRow227TriangleData1101.coefficient80_138,
  OriginalRow227TriangleData1101.coefficient80_139,
  OriginalRow227TriangleData1101.coefficient80_140,
  OriginalRow227TriangleData1101.coefficient80_141,
  OriginalRow227TriangleData1101.coefficient80_142
]

theorem values1101_size : values1101.size = 32 := rfl

def block1101 : ℕ → Option IntervalDyadic := segment 111 values1101

theorem block1101_domain : ExactDomain block1101 111 143 := by
  simpa only [values1101_size] using segment_domain 111 values1101

theorem block1101_get (i : Fin 32) :
    block1101 (111 + i.val) = some (values1101[i.val]'(by rw [values1101_size]; exact i.isLt)) := by
  exact segment_get 111 values1101 ⟨i.val, by rw [values1101_size]; exact i.isLt⟩

def values1102 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1102.coefficient80_143,
  OriginalRow227TriangleData1102.coefficient80_144,
  OriginalRow227TriangleData1102.coefficient80_145,
  OriginalRow227TriangleData1102.coefficient80_146,
  OriginalRow227TriangleData1102.coefficient80_147,
  OriginalRow227TriangleData1102.coefficient80_148,
  OriginalRow227TriangleData1102.coefficient80_149,
  OriginalRow227TriangleData1102.coefficient80_150,
  OriginalRow227TriangleData1102.coefficient80_151,
  OriginalRow227TriangleData1102.coefficient80_152,
  OriginalRow227TriangleData1102.coefficient80_153,
  OriginalRow227TriangleData1102.coefficient80_154,
  OriginalRow227TriangleData1102.coefficient80_155,
  OriginalRow227TriangleData1102.coefficient80_156,
  OriginalRow227TriangleData1102.coefficient80_157,
  OriginalRow227TriangleData1102.coefficient80_158,
  OriginalRow227TriangleData1102.coefficient80_159,
  OriginalRow227TriangleData1102.coefficient80_160,
  OriginalRow227TriangleData1102.coefficient80_161,
  OriginalRow227TriangleData1102.coefficient80_162,
  OriginalRow227TriangleData1102.coefficient80_163,
  OriginalRow227TriangleData1102.coefficient80_164,
  OriginalRow227TriangleData1102.coefficient80_165,
  OriginalRow227TriangleData1102.coefficient80_166,
  OriginalRow227TriangleData1102.coefficient80_167,
  OriginalRow227TriangleData1102.coefficient80_168,
  OriginalRow227TriangleData1102.coefficient80_169,
  OriginalRow227TriangleData1102.coefficient80_170,
  OriginalRow227TriangleData1102.coefficient80_171,
  OriginalRow227TriangleData1102.coefficient80_172,
  OriginalRow227TriangleData1102.coefficient80_173,
  OriginalRow227TriangleData1102.coefficient80_174
]

theorem values1102_size : values1102.size = 32 := rfl

def block1102 : ℕ → Option IntervalDyadic := segment 143 values1102

theorem block1102_domain : ExactDomain block1102 143 175 := by
  simpa only [values1102_size] using segment_domain 143 values1102

theorem block1102_get (i : Fin 32) :
    block1102 (143 + i.val) = some (values1102[i.val]'(by rw [values1102_size]; exact i.isLt)) := by
  exact segment_get 143 values1102 ⟨i.val, by rw [values1102_size]; exact i.isLt⟩

def values1103 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1103.coefficient80_175,
  OriginalRow227TriangleData1103.coefficient80_176,
  OriginalRow227TriangleData1103.coefficient80_177,
  OriginalRow227TriangleData1103.coefficient80_178,
  OriginalRow227TriangleData1103.coefficient80_179,
  OriginalRow227TriangleData1103.coefficient80_180,
  OriginalRow227TriangleData1103.coefficient80_181,
  OriginalRow227TriangleData1103.coefficient80_182,
  OriginalRow227TriangleData1103.coefficient80_183,
  OriginalRow227TriangleData1103.coefficient80_184,
  OriginalRow227TriangleData1103.coefficient80_185,
  OriginalRow227TriangleData1103.coefficient80_186,
  OriginalRow227TriangleData1103.coefficient80_187,
  OriginalRow227TriangleData1103.coefficient80_188,
  OriginalRow227TriangleData1103.coefficient80_189,
  OriginalRow227TriangleData1103.coefficient80_190,
  OriginalRow227TriangleData1103.coefficient80_191,
  OriginalRow227TriangleData1103.coefficient80_192,
  OriginalRow227TriangleData1103.coefficient80_193,
  OriginalRow227TriangleData1103.coefficient80_194,
  OriginalRow227TriangleData1103.coefficient80_195,
  OriginalRow227TriangleData1103.coefficient80_196,
  OriginalRow227TriangleData1103.coefficient80_197,
  OriginalRow227TriangleData1103.coefficient80_198,
  OriginalRow227TriangleData1103.coefficient80_199,
  OriginalRow227TriangleData1103.coefficient80_200,
  OriginalRow227TriangleData1103.coefficient80_201,
  OriginalRow227TriangleData1103.coefficient80_202,
  OriginalRow227TriangleData1103.coefficient80_203,
  OriginalRow227TriangleData1103.coefficient80_204,
  OriginalRow227TriangleData1103.coefficient80_205,
  OriginalRow227TriangleData1103.coefficient80_206
]

theorem values1103_size : values1103.size = 32 := rfl

def block1103 : ℕ → Option IntervalDyadic := segment 175 values1103

theorem block1103_domain : ExactDomain block1103 175 207 := by
  simpa only [values1103_size] using segment_domain 175 values1103

theorem block1103_get (i : Fin 32) :
    block1103 (175 + i.val) = some (values1103[i.val]'(by rw [values1103_size]; exact i.isLt)) := by
  exact segment_get 175 values1103 ⟨i.val, by rw [values1103_size]; exact i.isLt⟩

def values1104 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1104.coefficient80_207,
  OriginalRow227TriangleData1104.coefficient80_208,
  OriginalRow227TriangleData1104.coefficient80_209,
  OriginalRow227TriangleData1104.coefficient80_210,
  OriginalRow227TriangleData1104.coefficient80_211,
  OriginalRow227TriangleData1104.coefficient80_212,
  OriginalRow227TriangleData1104.coefficient80_213,
  OriginalRow227TriangleData1104.coefficient80_214,
  OriginalRow227TriangleData1104.coefficient80_215,
  OriginalRow227TriangleData1104.coefficient80_216,
  OriginalRow227TriangleData1104.coefficient80_217,
  OriginalRow227TriangleData1104.coefficient80_218,
  OriginalRow227TriangleData1104.coefficient80_219,
  OriginalRow227TriangleData1104.coefficient80_220,
  OriginalRow227TriangleData1104.coefficient80_221,
  OriginalRow227TriangleData1104.coefficient80_222,
  OriginalRow227TriangleData1104.coefficient80_223,
  OriginalRow227TriangleData1104.coefficient80_224,
  OriginalRow227TriangleData1104.coefficient80_225,
  OriginalRow227TriangleData1104.coefficient80_226,
  OriginalRow227TriangleData1104.coefficient80_227,
  OriginalRow227TriangleData1104.coefficient80_228,
  OriginalRow227TriangleData1104.coefficient80_229,
  OriginalRow227TriangleData1104.coefficient80_230,
  OriginalRow227TriangleData1104.coefficient80_231,
  OriginalRow227TriangleData1104.coefficient80_232,
  OriginalRow227TriangleData1104.coefficient80_233,
  OriginalRow227TriangleData1104.coefficient80_234,
  OriginalRow227TriangleData1104.coefficient80_235,
  OriginalRow227TriangleData1104.coefficient80_236,
  OriginalRow227TriangleData1104.coefficient80_237,
  OriginalRow227TriangleData1104.coefficient80_238
]

theorem values1104_size : values1104.size = 32 := rfl

def block1104 : ℕ → Option IntervalDyadic := segment 207 values1104

theorem block1104_domain : ExactDomain block1104 207 239 := by
  simpa only [values1104_size] using segment_domain 207 values1104

theorem block1104_get (i : Fin 32) :
    block1104 (207 + i.val) = some (values1104[i.val]'(by rw [values1104_size]; exact i.isLt)) := by
  exact segment_get 207 values1104 ⟨i.val, by rw [values1104_size]; exact i.isLt⟩

def values1105 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1105.coefficient80_239,
  OriginalRow227TriangleData1105.coefficient80_240,
  OriginalRow227TriangleData1105.coefficient80_241,
  OriginalRow227TriangleData1105.coefficient80_242,
  OriginalRow227TriangleData1105.coefficient80_243,
  OriginalRow227TriangleData1105.coefficient80_244,
  OriginalRow227TriangleData1105.coefficient80_245,
  OriginalRow227TriangleData1105.coefficient80_246,
  OriginalRow227TriangleData1105.coefficient80_247,
  OriginalRow227TriangleData1105.coefficient80_248,
  OriginalRow227TriangleData1105.coefficient80_249,
  OriginalRow227TriangleData1105.coefficient80_250,
  OriginalRow227TriangleData1105.coefficient80_251,
  OriginalRow227TriangleData1105.coefficient80_252,
  OriginalRow227TriangleData1105.coefficient80_253,
  OriginalRow227TriangleData1105.coefficient80_254,
  OriginalRow227TriangleData1105.coefficient80_255,
  OriginalRow227TriangleData1105.coefficient80_256,
  OriginalRow227TriangleData1105.coefficient80_257,
  OriginalRow227TriangleData1105.coefficient80_258,
  OriginalRow227TriangleData1105.coefficient80_259,
  OriginalRow227TriangleData1105.coefficient80_260,
  OriginalRow227TriangleData1105.coefficient80_261,
  OriginalRow227TriangleData1105.coefficient80_262,
  OriginalRow227TriangleData1105.coefficient80_263,
  OriginalRow227TriangleData1105.coefficient80_264,
  OriginalRow227TriangleData1105.coefficient80_265,
  OriginalRow227TriangleData1105.coefficient80_266,
  OriginalRow227TriangleData1105.coefficient80_267,
  OriginalRow227TriangleData1105.coefficient80_268,
  OriginalRow227TriangleData1105.coefficient80_269,
  OriginalRow227TriangleData1105.coefficient80_270
]

theorem values1105_size : values1105.size = 32 := rfl

def block1105 : ℕ → Option IntervalDyadic := segment 239 values1105

theorem block1105_domain : ExactDomain block1105 239 271 := by
  simpa only [values1105_size] using segment_domain 239 values1105

theorem block1105_get (i : Fin 32) :
    block1105 (239 + i.val) = some (values1105[i.val]'(by rw [values1105_size]; exact i.isLt)) := by
  exact segment_get 239 values1105 ⟨i.val, by rw [values1105_size]; exact i.isLt⟩

def values1106 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1106.coefficient80_271,
  OriginalRow227TriangleData1106.coefficient80_272,
  OriginalRow227TriangleData1106.coefficient80_273,
  OriginalRow227TriangleData1106.coefficient80_274,
  OriginalRow227TriangleData1106.coefficient80_275,
  OriginalRow227TriangleData1106.coefficient80_276,
  OriginalRow227TriangleData1106.coefficient80_277,
  OriginalRow227TriangleData1106.coefficient80_278,
  OriginalRow227TriangleData1106.coefficient80_279,
  OriginalRow227TriangleData1106.coefficient80_280,
  OriginalRow227TriangleData1106.coefficient80_281,
  OriginalRow227TriangleData1106.coefficient80_282,
  OriginalRow227TriangleData1106.coefficient80_283,
  OriginalRow227TriangleData1106.coefficient80_284,
  OriginalRow227TriangleData1106.coefficient80_285,
  OriginalRow227TriangleData1106.coefficient80_286,
  OriginalRow227TriangleData1106.coefficient80_287,
  OriginalRow227TriangleData1106.coefficient80_288,
  OriginalRow227TriangleData1106.coefficient80_289,
  OriginalRow227TriangleData1106.coefficient80_290,
  OriginalRow227TriangleData1106.coefficient80_291,
  OriginalRow227TriangleData1106.coefficient80_292,
  OriginalRow227TriangleData1106.coefficient80_293,
  OriginalRow227TriangleData1106.coefficient80_294,
  OriginalRow227TriangleData1106.coefficient80_295,
  OriginalRow227TriangleData1106.coefficient80_296,
  OriginalRow227TriangleData1106.coefficient80_297,
  OriginalRow227TriangleData1106.coefficient80_298,
  OriginalRow227TriangleData1106.coefficient80_299,
  OriginalRow227TriangleData1106.coefficient80_300,
  OriginalRow227TriangleData1106.coefficient80_301,
  OriginalRow227TriangleData1106.coefficient80_302
]

theorem values1106_size : values1106.size = 32 := rfl

def block1106 : ℕ → Option IntervalDyadic := segment 271 values1106

theorem block1106_domain : ExactDomain block1106 271 303 := by
  simpa only [values1106_size] using segment_domain 271 values1106

theorem block1106_get (i : Fin 32) :
    block1106 (271 + i.val) = some (values1106[i.val]'(by rw [values1106_size]; exact i.isLt)) := by
  exact segment_get 271 values1106 ⟨i.val, by rw [values1106_size]; exact i.isLt⟩

def values1107 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1107.coefficient80_303,
  OriginalRow227TriangleData1107.coefficient80_304,
  OriginalRow227TriangleData1107.coefficient80_305,
  OriginalRow227TriangleData1107.coefficient80_306,
  OriginalRow227TriangleData1107.coefficient80_307,
  OriginalRow227TriangleData1107.coefficient80_308,
  OriginalRow227TriangleData1107.coefficient80_309,
  OriginalRow227TriangleData1107.coefficient80_310,
  OriginalRow227TriangleData1107.coefficient80_311,
  OriginalRow227TriangleData1107.coefficient80_312,
  OriginalRow227TriangleData1107.coefficient80_313,
  OriginalRow227TriangleData1107.coefficient80_314,
  OriginalRow227TriangleData1107.coefficient80_315,
  OriginalRow227TriangleData1107.coefficient80_316,
  OriginalRow227TriangleData1107.coefficient80_317,
  OriginalRow227TriangleData1107.coefficient80_318,
  OriginalRow227TriangleData1107.coefficient80_319,
  OriginalRow227TriangleData1107.coefficient80_320,
  OriginalRow227TriangleData1107.coefficient80_321,
  OriginalRow227TriangleData1107.coefficient80_322,
  OriginalRow227TriangleData1107.coefficient80_323,
  OriginalRow227TriangleData1107.coefficient80_324,
  OriginalRow227TriangleData1107.coefficient80_325,
  OriginalRow227TriangleData1107.coefficient80_326,
  OriginalRow227TriangleData1107.coefficient80_327,
  OriginalRow227TriangleData1107.coefficient80_328,
  OriginalRow227TriangleData1107.coefficient80_329,
  OriginalRow227TriangleData1107.coefficient80_330,
  OriginalRow227TriangleData1107.coefficient80_331,
  OriginalRow227TriangleData1107.coefficient80_332,
  OriginalRow227TriangleData1107.coefficient80_333,
  OriginalRow227TriangleData1107.coefficient80_334
]

theorem values1107_size : values1107.size = 32 := rfl

def block1107 : ℕ → Option IntervalDyadic := segment 303 values1107

theorem block1107_domain : ExactDomain block1107 303 335 := by
  simpa only [values1107_size] using segment_domain 303 values1107

theorem block1107_get (i : Fin 32) :
    block1107 (303 + i.val) = some (values1107[i.val]'(by rw [values1107_size]; exact i.isLt)) := by
  exact segment_get 303 values1107 ⟨i.val, by rw [values1107_size]; exact i.isLt⟩

def values1108 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1108.coefficient80_335,
  OriginalRow227TriangleData1108.coefficient80_336,
  OriginalRow227TriangleData1108.coefficient80_337,
  OriginalRow227TriangleData1108.coefficient80_338,
  OriginalRow227TriangleData1108.coefficient80_339,
  OriginalRow227TriangleData1108.coefficient80_340,
  OriginalRow227TriangleData1108.coefficient80_341,
  OriginalRow227TriangleData1108.coefficient80_342,
  OriginalRow227TriangleData1108.coefficient80_343,
  OriginalRow227TriangleData1108.coefficient80_344,
  OriginalRow227TriangleData1108.coefficient80_345,
  OriginalRow227TriangleData1108.coefficient80_346,
  OriginalRow227TriangleData1108.coefficient80_347,
  OriginalRow227TriangleData1108.coefficient80_348,
  OriginalRow227TriangleData1108.coefficient80_349,
  OriginalRow227TriangleData1108.coefficient80_350,
  OriginalRow227TriangleData1108.coefficient80_351,
  OriginalRow227TriangleData1108.coefficient80_352,
  OriginalRow227TriangleData1108.coefficient80_353,
  OriginalRow227TriangleData1108.coefficient80_354,
  OriginalRow227TriangleData1108.coefficient80_355,
  OriginalRow227TriangleData1108.coefficient80_356,
  OriginalRow227TriangleData1108.coefficient80_357,
  OriginalRow227TriangleData1108.coefficient80_358,
  OriginalRow227TriangleData1108.coefficient80_359,
  OriginalRow227TriangleData1108.coefficient80_360,
  OriginalRow227TriangleData1108.coefficient80_361,
  OriginalRow227TriangleData1108.coefficient80_362,
  OriginalRow227TriangleData1108.coefficient80_363,
  OriginalRow227TriangleData1108.coefficient80_364,
  OriginalRow227TriangleData1108.coefficient80_365,
  OriginalRow227TriangleData1108.coefficient80_366
]

theorem values1108_size : values1108.size = 32 := rfl

def block1108 : ℕ → Option IntervalDyadic := segment 335 values1108

theorem block1108_domain : ExactDomain block1108 335 367 := by
  simpa only [values1108_size] using segment_domain 335 values1108

theorem block1108_get (i : Fin 32) :
    block1108 (335 + i.val) = some (values1108[i.val]'(by rw [values1108_size]; exact i.isLt)) := by
  exact segment_get 335 values1108 ⟨i.val, by rw [values1108_size]; exact i.isLt⟩

def values1109 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1109.coefficient80_367,
  OriginalRow227TriangleData1109.coefficient80_368,
  OriginalRow227TriangleData1109.coefficient80_369,
  OriginalRow227TriangleData1109.coefficient80_370,
  OriginalRow227TriangleData1109.coefficient80_371,
  OriginalRow227TriangleData1109.coefficient80_372,
  OriginalRow227TriangleData1109.coefficient80_373,
  OriginalRow227TriangleData1109.coefficient80_374,
  OriginalRow227TriangleData1109.coefficient80_375,
  OriginalRow227TriangleData1109.coefficient80_376,
  OriginalRow227TriangleData1109.coefficient80_377,
  OriginalRow227TriangleData1109.coefficient80_378,
  OriginalRow227TriangleData1109.coefficient80_379,
  OriginalRow227TriangleData1109.coefficient80_380,
  OriginalRow227TriangleData1109.coefficient80_381,
  OriginalRow227TriangleData1109.coefficient80_382,
  OriginalRow227TriangleData1109.coefficient80_383,
  OriginalRow227TriangleData1109.coefficient80_384,
  OriginalRow227TriangleData1109.coefficient80_385,
  OriginalRow227TriangleData1109.coefficient80_386,
  OriginalRow227TriangleData1109.coefficient80_387,
  OriginalRow227TriangleData1109.coefficient80_388,
  OriginalRow227TriangleData1109.coefficient80_389,
  OriginalRow227TriangleData1109.coefficient80_390,
  OriginalRow227TriangleData1109.coefficient80_391,
  OriginalRow227TriangleData1109.coefficient80_392,
  OriginalRow227TriangleData1109.coefficient80_393,
  OriginalRow227TriangleData1109.coefficient80_394,
  OriginalRow227TriangleData1109.coefficient80_395,
  OriginalRow227TriangleData1109.coefficient80_396,
  OriginalRow227TriangleData1109.coefficient80_397,
  OriginalRow227TriangleData1109.coefficient80_398
]

theorem values1109_size : values1109.size = 32 := rfl

def block1109 : ℕ → Option IntervalDyadic := segment 367 values1109

theorem block1109_domain : ExactDomain block1109 367 399 := by
  simpa only [values1109_size] using segment_domain 367 values1109

theorem block1109_get (i : Fin 32) :
    block1109 (367 + i.val) = some (values1109[i.val]'(by rw [values1109_size]; exact i.isLt)) := by
  exact segment_get 367 values1109 ⟨i.val, by rw [values1109_size]; exact i.isLt⟩

def values1110 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1110.coefficient80_399,
  OriginalRow227TriangleData1110.coefficient80_400,
  OriginalRow227TriangleData1110.coefficient80_401,
  OriginalRow227TriangleData1110.coefficient80_402,
  OriginalRow227TriangleData1110.coefficient80_403,
  OriginalRow227TriangleData1110.coefficient80_404,
  OriginalRow227TriangleData1110.coefficient80_405,
  OriginalRow227TriangleData1110.coefficient80_406,
  OriginalRow227TriangleData1110.coefficient80_407,
  OriginalRow227TriangleData1110.coefficient80_408,
  OriginalRow227TriangleData1110.coefficient80_409,
  OriginalRow227TriangleData1110.coefficient80_410,
  OriginalRow227TriangleData1110.coefficient80_411,
  OriginalRow227TriangleData1110.coefficient80_412,
  OriginalRow227TriangleData1110.coefficient80_413,
  OriginalRow227TriangleData1110.coefficient80_414,
  OriginalRow227TriangleData1110.coefficient80_415,
  OriginalRow227TriangleData1110.coefficient80_416,
  OriginalRow227TriangleData1110.coefficient80_417,
  OriginalRow227TriangleData1110.coefficient80_418,
  OriginalRow227TriangleData1110.coefficient80_419,
  OriginalRow227TriangleData1110.coefficient80_420,
  OriginalRow227TriangleData1110.coefficient80_421
]

theorem values1110_size : values1110.size = 23 := rfl

def block1110 : ℕ → Option IntervalDyadic := segment 399 values1110

theorem block1110_domain : ExactDomain block1110 399 422 := by
  simpa only [values1110_size] using segment_domain 399 values1110

theorem block1110_get (i : Fin 23) :
    block1110 (399 + i.val) = some (values1110[i.val]'(by rw [values1110_size]; exact i.isLt)) := by
  exact segment_get 399 values1110 ⟨i.val, by rw [values1110_size]; exact i.isLt⟩

def node0079_0143 : ℕ → Option IntervalDyadic := split 111 block1100 block1101

theorem node0079_0143_domain : ExactDomain node0079_0143 79 143 := by
  exact split_domain (by decide) (by decide) block1100_domain block1101_domain

def node0175_0239 : ℕ → Option IntervalDyadic := split 207 block1103 block1104

theorem node0175_0239_domain : ExactDomain node0175_0239 175 239 := by
  exact split_domain (by decide) (by decide) block1103_domain block1104_domain

def node0143_0239 : ℕ → Option IntervalDyadic := split 175 block1102 node0175_0239

theorem node0143_0239_domain : ExactDomain node0143_0239 143 239 := by
  exact split_domain (by decide) (by decide) block1102_domain node0175_0239_domain

def node0079_0239 : ℕ → Option IntervalDyadic := split 143 node0079_0143 node0143_0239

theorem node0079_0239_domain : ExactDomain node0079_0239 79 239 := by
  exact split_domain (by decide) (by decide) node0079_0143_domain node0143_0239_domain

def node0271_0335 : ℕ → Option IntervalDyadic := split 303 block1106 block1107

theorem node0271_0335_domain : ExactDomain node0271_0335 271 335 := by
  exact split_domain (by decide) (by decide) block1106_domain block1107_domain

def node0239_0335 : ℕ → Option IntervalDyadic := split 271 block1105 node0271_0335

theorem node0239_0335_domain : ExactDomain node0239_0335 239 335 := by
  exact split_domain (by decide) (by decide) block1105_domain node0271_0335_domain

def node0367_0422 : ℕ → Option IntervalDyadic := split 399 block1109 block1110

theorem node0367_0422_domain : ExactDomain node0367_0422 367 422 := by
  exact split_domain (by decide) (by decide) block1109_domain block1110_domain

def node0335_0422 : ℕ → Option IntervalDyadic := split 367 block1108 node0367_0422

theorem node0335_0422_domain : ExactDomain node0335_0422 335 422 := by
  exact split_domain (by decide) (by decide) block1108_domain node0367_0422_domain

def node0239_0422 : ℕ → Option IntervalDyadic := split 335 node0239_0335 node0335_0422

theorem node0239_0422_domain : ExactDomain node0239_0422 239 422 := by
  exact split_domain (by decide) (by decide) node0239_0335_domain node0335_0422_domain

def node0079_0422 : ℕ → Option IntervalDyadic := split 239 node0079_0239 node0239_0422

theorem node0079_0422_domain : ExactDomain node0079_0422 79 422 := by
  exact split_domain (by decide) (by decide) node0079_0239_domain node0239_0422_domain

def lookup : ℕ → Option IntervalDyadic := node0079_0422

theorem lookup_domain : ExactDomain lookup 79 422 :=
  node0079_0422_domain

theorem block1100_lookup (i : Fin 32) :
    lookup (79 + i.val) = some (values1100[i.val]'(by rw [values1100_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (79 + i.val) = _
  rw [node0079_0422, split_left 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0079_0239, split_left 143 node0079_0143 node0143_0239 (by omega)]
  rw [node0079_0143, split_left 111 block1100 block1101 (by omega)]
  exact block1100_get i

theorem block1101_lookup (i : Fin 32) :
    lookup (111 + i.val) = some (values1101[i.val]'(by rw [values1101_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (111 + i.val) = _
  rw [node0079_0422, split_left 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0079_0239, split_left 143 node0079_0143 node0143_0239 (by omega)]
  rw [node0079_0143, split_right 111 block1100 block1101 (by omega)]
  exact block1101_get i

theorem block1102_lookup (i : Fin 32) :
    lookup (143 + i.val) = some (values1102[i.val]'(by rw [values1102_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (143 + i.val) = _
  rw [node0079_0422, split_left 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0079_0239, split_right 143 node0079_0143 node0143_0239 (by omega)]
  rw [node0143_0239, split_left 175 block1102 node0175_0239 (by omega)]
  exact block1102_get i

theorem block1103_lookup (i : Fin 32) :
    lookup (175 + i.val) = some (values1103[i.val]'(by rw [values1103_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (175 + i.val) = _
  rw [node0079_0422, split_left 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0079_0239, split_right 143 node0079_0143 node0143_0239 (by omega)]
  rw [node0143_0239, split_right 175 block1102 node0175_0239 (by omega)]
  rw [node0175_0239, split_left 207 block1103 block1104 (by omega)]
  exact block1103_get i

theorem block1104_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values1104[i.val]'(by rw [values1104_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (207 + i.val) = _
  rw [node0079_0422, split_left 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0079_0239, split_right 143 node0079_0143 node0143_0239 (by omega)]
  rw [node0143_0239, split_right 175 block1102 node0175_0239 (by omega)]
  rw [node0175_0239, split_right 207 block1103 block1104 (by omega)]
  exact block1104_get i

theorem block1105_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values1105[i.val]'(by rw [values1105_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (239 + i.val) = _
  rw [node0079_0422, split_right 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0239_0422, split_left 335 node0239_0335 node0335_0422 (by omega)]
  rw [node0239_0335, split_left 271 block1105 node0271_0335 (by omega)]
  exact block1105_get i

theorem block1106_lookup (i : Fin 32) :
    lookup (271 + i.val) = some (values1106[i.val]'(by rw [values1106_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (271 + i.val) = _
  rw [node0079_0422, split_right 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0239_0422, split_left 335 node0239_0335 node0335_0422 (by omega)]
  rw [node0239_0335, split_right 271 block1105 node0271_0335 (by omega)]
  rw [node0271_0335, split_left 303 block1106 block1107 (by omega)]
  exact block1106_get i

theorem block1107_lookup (i : Fin 32) :
    lookup (303 + i.val) = some (values1107[i.val]'(by rw [values1107_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (303 + i.val) = _
  rw [node0079_0422, split_right 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0239_0422, split_left 335 node0239_0335 node0335_0422 (by omega)]
  rw [node0239_0335, split_right 271 block1105 node0271_0335 (by omega)]
  rw [node0271_0335, split_right 303 block1106 block1107 (by omega)]
  exact block1107_get i

theorem block1108_lookup (i : Fin 32) :
    lookup (335 + i.val) = some (values1108[i.val]'(by rw [values1108_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (335 + i.val) = _
  rw [node0079_0422, split_right 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0239_0422, split_right 335 node0239_0335 node0335_0422 (by omega)]
  rw [node0335_0422, split_left 367 block1108 node0367_0422 (by omega)]
  exact block1108_get i

theorem block1109_lookup (i : Fin 32) :
    lookup (367 + i.val) = some (values1109[i.val]'(by rw [values1109_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (367 + i.val) = _
  rw [node0079_0422, split_right 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0239_0422, split_right 335 node0239_0335 node0335_0422 (by omega)]
  rw [node0335_0422, split_right 367 block1108 node0367_0422 (by omega)]
  rw [node0367_0422, split_left 399 block1109 block1110 (by omega)]
  exact block1109_get i

theorem block1110_lookup (i : Fin 23) :
    lookup (399 + i.val) = some (values1110[i.val]'(by rw [values1110_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0079_0422 (399 + i.val) = _
  rw [node0079_0422, split_right 239 node0079_0239 node0239_0422 (by omega)]
  rw [node0239_0422, split_right 335 node0239_0335 node0335_0422 (by omega)]
  rw [node0335_0422, split_right 367 block1108 node0367_0422 (by omega)]
  rw [node0367_0422, split_right 399 block1109 block1110 (by omega)]
  exact block1110_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1100_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1100_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1101_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1101_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1102_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1102_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1103_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1103_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1104_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1104_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1105_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1105_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1106_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1106_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1107_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1107_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1108_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1108_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1109_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1109_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1110_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1110_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1100_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1101_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1102_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1103_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1104_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1105_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1106_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1107_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1108_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1109_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow080.block1110_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow080
