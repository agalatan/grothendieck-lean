import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1111
import Grothe.UpperChaos.OriginalRow227TriangleData1112
import Grothe.UpperChaos.OriginalRow227TriangleData1113
import Grothe.UpperChaos.OriginalRow227TriangleData1114
import Grothe.UpperChaos.OriginalRow227TriangleData1115
import Grothe.UpperChaos.OriginalRow227TriangleData1116
import Grothe.UpperChaos.OriginalRow227TriangleData1117
import Grothe.UpperChaos.OriginalRow227TriangleData1118
import Grothe.UpperChaos.OriginalRow227TriangleData1119
import Grothe.UpperChaos.OriginalRow227TriangleData1120
import Grothe.UpperChaos.OriginalRow227TriangleData1121

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow081

open ConditionalTableLookup

def values1111 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1111.coefficient81_80,
  OriginalRow227TriangleData1111.coefficient81_81,
  OriginalRow227TriangleData1111.coefficient81_82,
  OriginalRow227TriangleData1111.coefficient81_83,
  OriginalRow227TriangleData1111.coefficient81_84,
  OriginalRow227TriangleData1111.coefficient81_85,
  OriginalRow227TriangleData1111.coefficient81_86,
  OriginalRow227TriangleData1111.coefficient81_87,
  OriginalRow227TriangleData1111.coefficient81_88,
  OriginalRow227TriangleData1111.coefficient81_89,
  OriginalRow227TriangleData1111.coefficient81_90,
  OriginalRow227TriangleData1111.coefficient81_91,
  OriginalRow227TriangleData1111.coefficient81_92,
  OriginalRow227TriangleData1111.coefficient81_93,
  OriginalRow227TriangleData1111.coefficient81_94,
  OriginalRow227TriangleData1111.coefficient81_95,
  OriginalRow227TriangleData1111.coefficient81_96,
  OriginalRow227TriangleData1111.coefficient81_97,
  OriginalRow227TriangleData1111.coefficient81_98,
  OriginalRow227TriangleData1111.coefficient81_99,
  OriginalRow227TriangleData1111.coefficient81_100,
  OriginalRow227TriangleData1111.coefficient81_101,
  OriginalRow227TriangleData1111.coefficient81_102,
  OriginalRow227TriangleData1111.coefficient81_103,
  OriginalRow227TriangleData1111.coefficient81_104,
  OriginalRow227TriangleData1111.coefficient81_105,
  OriginalRow227TriangleData1111.coefficient81_106,
  OriginalRow227TriangleData1111.coefficient81_107,
  OriginalRow227TriangleData1111.coefficient81_108,
  OriginalRow227TriangleData1111.coefficient81_109,
  OriginalRow227TriangleData1111.coefficient81_110,
  OriginalRow227TriangleData1111.coefficient81_111
]

theorem values1111_size : values1111.size = 32 := rfl

def block1111 : ℕ → Option IntervalDyadic := segment 80 values1111

theorem block1111_domain : ExactDomain block1111 80 112 := by
  simpa only [values1111_size] using segment_domain 80 values1111

theorem block1111_get (i : Fin 32) :
    block1111 (80 + i.val) = some (values1111[i.val]'(by rw [values1111_size]; exact i.isLt)) := by
  exact segment_get 80 values1111 ⟨i.val, by rw [values1111_size]; exact i.isLt⟩

def values1112 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1112.coefficient81_112,
  OriginalRow227TriangleData1112.coefficient81_113,
  OriginalRow227TriangleData1112.coefficient81_114,
  OriginalRow227TriangleData1112.coefficient81_115,
  OriginalRow227TriangleData1112.coefficient81_116,
  OriginalRow227TriangleData1112.coefficient81_117,
  OriginalRow227TriangleData1112.coefficient81_118,
  OriginalRow227TriangleData1112.coefficient81_119,
  OriginalRow227TriangleData1112.coefficient81_120,
  OriginalRow227TriangleData1112.coefficient81_121,
  OriginalRow227TriangleData1112.coefficient81_122,
  OriginalRow227TriangleData1112.coefficient81_123,
  OriginalRow227TriangleData1112.coefficient81_124,
  OriginalRow227TriangleData1112.coefficient81_125,
  OriginalRow227TriangleData1112.coefficient81_126,
  OriginalRow227TriangleData1112.coefficient81_127,
  OriginalRow227TriangleData1112.coefficient81_128,
  OriginalRow227TriangleData1112.coefficient81_129,
  OriginalRow227TriangleData1112.coefficient81_130,
  OriginalRow227TriangleData1112.coefficient81_131,
  OriginalRow227TriangleData1112.coefficient81_132,
  OriginalRow227TriangleData1112.coefficient81_133,
  OriginalRow227TriangleData1112.coefficient81_134,
  OriginalRow227TriangleData1112.coefficient81_135,
  OriginalRow227TriangleData1112.coefficient81_136,
  OriginalRow227TriangleData1112.coefficient81_137,
  OriginalRow227TriangleData1112.coefficient81_138,
  OriginalRow227TriangleData1112.coefficient81_139,
  OriginalRow227TriangleData1112.coefficient81_140,
  OriginalRow227TriangleData1112.coefficient81_141,
  OriginalRow227TriangleData1112.coefficient81_142,
  OriginalRow227TriangleData1112.coefficient81_143
]

theorem values1112_size : values1112.size = 32 := rfl

def block1112 : ℕ → Option IntervalDyadic := segment 112 values1112

theorem block1112_domain : ExactDomain block1112 112 144 := by
  simpa only [values1112_size] using segment_domain 112 values1112

theorem block1112_get (i : Fin 32) :
    block1112 (112 + i.val) = some (values1112[i.val]'(by rw [values1112_size]; exact i.isLt)) := by
  exact segment_get 112 values1112 ⟨i.val, by rw [values1112_size]; exact i.isLt⟩

def values1113 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1113.coefficient81_144,
  OriginalRow227TriangleData1113.coefficient81_145,
  OriginalRow227TriangleData1113.coefficient81_146,
  OriginalRow227TriangleData1113.coefficient81_147,
  OriginalRow227TriangleData1113.coefficient81_148,
  OriginalRow227TriangleData1113.coefficient81_149,
  OriginalRow227TriangleData1113.coefficient81_150,
  OriginalRow227TriangleData1113.coefficient81_151,
  OriginalRow227TriangleData1113.coefficient81_152,
  OriginalRow227TriangleData1113.coefficient81_153,
  OriginalRow227TriangleData1113.coefficient81_154,
  OriginalRow227TriangleData1113.coefficient81_155,
  OriginalRow227TriangleData1113.coefficient81_156,
  OriginalRow227TriangleData1113.coefficient81_157,
  OriginalRow227TriangleData1113.coefficient81_158,
  OriginalRow227TriangleData1113.coefficient81_159,
  OriginalRow227TriangleData1113.coefficient81_160,
  OriginalRow227TriangleData1113.coefficient81_161,
  OriginalRow227TriangleData1113.coefficient81_162,
  OriginalRow227TriangleData1113.coefficient81_163,
  OriginalRow227TriangleData1113.coefficient81_164,
  OriginalRow227TriangleData1113.coefficient81_165,
  OriginalRow227TriangleData1113.coefficient81_166,
  OriginalRow227TriangleData1113.coefficient81_167,
  OriginalRow227TriangleData1113.coefficient81_168,
  OriginalRow227TriangleData1113.coefficient81_169,
  OriginalRow227TriangleData1113.coefficient81_170,
  OriginalRow227TriangleData1113.coefficient81_171,
  OriginalRow227TriangleData1113.coefficient81_172,
  OriginalRow227TriangleData1113.coefficient81_173,
  OriginalRow227TriangleData1113.coefficient81_174,
  OriginalRow227TriangleData1113.coefficient81_175
]

theorem values1113_size : values1113.size = 32 := rfl

def block1113 : ℕ → Option IntervalDyadic := segment 144 values1113

theorem block1113_domain : ExactDomain block1113 144 176 := by
  simpa only [values1113_size] using segment_domain 144 values1113

theorem block1113_get (i : Fin 32) :
    block1113 (144 + i.val) = some (values1113[i.val]'(by rw [values1113_size]; exact i.isLt)) := by
  exact segment_get 144 values1113 ⟨i.val, by rw [values1113_size]; exact i.isLt⟩

def values1114 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1114.coefficient81_176,
  OriginalRow227TriangleData1114.coefficient81_177,
  OriginalRow227TriangleData1114.coefficient81_178,
  OriginalRow227TriangleData1114.coefficient81_179,
  OriginalRow227TriangleData1114.coefficient81_180,
  OriginalRow227TriangleData1114.coefficient81_181,
  OriginalRow227TriangleData1114.coefficient81_182,
  OriginalRow227TriangleData1114.coefficient81_183,
  OriginalRow227TriangleData1114.coefficient81_184,
  OriginalRow227TriangleData1114.coefficient81_185,
  OriginalRow227TriangleData1114.coefficient81_186,
  OriginalRow227TriangleData1114.coefficient81_187,
  OriginalRow227TriangleData1114.coefficient81_188,
  OriginalRow227TriangleData1114.coefficient81_189,
  OriginalRow227TriangleData1114.coefficient81_190,
  OriginalRow227TriangleData1114.coefficient81_191,
  OriginalRow227TriangleData1114.coefficient81_192,
  OriginalRow227TriangleData1114.coefficient81_193,
  OriginalRow227TriangleData1114.coefficient81_194,
  OriginalRow227TriangleData1114.coefficient81_195,
  OriginalRow227TriangleData1114.coefficient81_196,
  OriginalRow227TriangleData1114.coefficient81_197,
  OriginalRow227TriangleData1114.coefficient81_198,
  OriginalRow227TriangleData1114.coefficient81_199,
  OriginalRow227TriangleData1114.coefficient81_200,
  OriginalRow227TriangleData1114.coefficient81_201,
  OriginalRow227TriangleData1114.coefficient81_202,
  OriginalRow227TriangleData1114.coefficient81_203,
  OriginalRow227TriangleData1114.coefficient81_204,
  OriginalRow227TriangleData1114.coefficient81_205,
  OriginalRow227TriangleData1114.coefficient81_206,
  OriginalRow227TriangleData1114.coefficient81_207
]

theorem values1114_size : values1114.size = 32 := rfl

def block1114 : ℕ → Option IntervalDyadic := segment 176 values1114

theorem block1114_domain : ExactDomain block1114 176 208 := by
  simpa only [values1114_size] using segment_domain 176 values1114

theorem block1114_get (i : Fin 32) :
    block1114 (176 + i.val) = some (values1114[i.val]'(by rw [values1114_size]; exact i.isLt)) := by
  exact segment_get 176 values1114 ⟨i.val, by rw [values1114_size]; exact i.isLt⟩

def values1115 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1115.coefficient81_208,
  OriginalRow227TriangleData1115.coefficient81_209,
  OriginalRow227TriangleData1115.coefficient81_210,
  OriginalRow227TriangleData1115.coefficient81_211,
  OriginalRow227TriangleData1115.coefficient81_212,
  OriginalRow227TriangleData1115.coefficient81_213,
  OriginalRow227TriangleData1115.coefficient81_214,
  OriginalRow227TriangleData1115.coefficient81_215,
  OriginalRow227TriangleData1115.coefficient81_216,
  OriginalRow227TriangleData1115.coefficient81_217,
  OriginalRow227TriangleData1115.coefficient81_218,
  OriginalRow227TriangleData1115.coefficient81_219,
  OriginalRow227TriangleData1115.coefficient81_220,
  OriginalRow227TriangleData1115.coefficient81_221,
  OriginalRow227TriangleData1115.coefficient81_222,
  OriginalRow227TriangleData1115.coefficient81_223,
  OriginalRow227TriangleData1115.coefficient81_224,
  OriginalRow227TriangleData1115.coefficient81_225,
  OriginalRow227TriangleData1115.coefficient81_226,
  OriginalRow227TriangleData1115.coefficient81_227,
  OriginalRow227TriangleData1115.coefficient81_228,
  OriginalRow227TriangleData1115.coefficient81_229,
  OriginalRow227TriangleData1115.coefficient81_230,
  OriginalRow227TriangleData1115.coefficient81_231,
  OriginalRow227TriangleData1115.coefficient81_232,
  OriginalRow227TriangleData1115.coefficient81_233,
  OriginalRow227TriangleData1115.coefficient81_234,
  OriginalRow227TriangleData1115.coefficient81_235,
  OriginalRow227TriangleData1115.coefficient81_236,
  OriginalRow227TriangleData1115.coefficient81_237,
  OriginalRow227TriangleData1115.coefficient81_238,
  OriginalRow227TriangleData1115.coefficient81_239
]

theorem values1115_size : values1115.size = 32 := rfl

def block1115 : ℕ → Option IntervalDyadic := segment 208 values1115

theorem block1115_domain : ExactDomain block1115 208 240 := by
  simpa only [values1115_size] using segment_domain 208 values1115

theorem block1115_get (i : Fin 32) :
    block1115 (208 + i.val) = some (values1115[i.val]'(by rw [values1115_size]; exact i.isLt)) := by
  exact segment_get 208 values1115 ⟨i.val, by rw [values1115_size]; exact i.isLt⟩

def values1116 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1116.coefficient81_240,
  OriginalRow227TriangleData1116.coefficient81_241,
  OriginalRow227TriangleData1116.coefficient81_242,
  OriginalRow227TriangleData1116.coefficient81_243,
  OriginalRow227TriangleData1116.coefficient81_244,
  OriginalRow227TriangleData1116.coefficient81_245,
  OriginalRow227TriangleData1116.coefficient81_246,
  OriginalRow227TriangleData1116.coefficient81_247,
  OriginalRow227TriangleData1116.coefficient81_248,
  OriginalRow227TriangleData1116.coefficient81_249,
  OriginalRow227TriangleData1116.coefficient81_250,
  OriginalRow227TriangleData1116.coefficient81_251,
  OriginalRow227TriangleData1116.coefficient81_252,
  OriginalRow227TriangleData1116.coefficient81_253,
  OriginalRow227TriangleData1116.coefficient81_254,
  OriginalRow227TriangleData1116.coefficient81_255,
  OriginalRow227TriangleData1116.coefficient81_256,
  OriginalRow227TriangleData1116.coefficient81_257,
  OriginalRow227TriangleData1116.coefficient81_258,
  OriginalRow227TriangleData1116.coefficient81_259,
  OriginalRow227TriangleData1116.coefficient81_260,
  OriginalRow227TriangleData1116.coefficient81_261,
  OriginalRow227TriangleData1116.coefficient81_262,
  OriginalRow227TriangleData1116.coefficient81_263,
  OriginalRow227TriangleData1116.coefficient81_264,
  OriginalRow227TriangleData1116.coefficient81_265,
  OriginalRow227TriangleData1116.coefficient81_266,
  OriginalRow227TriangleData1116.coefficient81_267,
  OriginalRow227TriangleData1116.coefficient81_268,
  OriginalRow227TriangleData1116.coefficient81_269,
  OriginalRow227TriangleData1116.coefficient81_270,
  OriginalRow227TriangleData1116.coefficient81_271
]

theorem values1116_size : values1116.size = 32 := rfl

def block1116 : ℕ → Option IntervalDyadic := segment 240 values1116

theorem block1116_domain : ExactDomain block1116 240 272 := by
  simpa only [values1116_size] using segment_domain 240 values1116

theorem block1116_get (i : Fin 32) :
    block1116 (240 + i.val) = some (values1116[i.val]'(by rw [values1116_size]; exact i.isLt)) := by
  exact segment_get 240 values1116 ⟨i.val, by rw [values1116_size]; exact i.isLt⟩

def values1117 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1117.coefficient81_272,
  OriginalRow227TriangleData1117.coefficient81_273,
  OriginalRow227TriangleData1117.coefficient81_274,
  OriginalRow227TriangleData1117.coefficient81_275,
  OriginalRow227TriangleData1117.coefficient81_276,
  OriginalRow227TriangleData1117.coefficient81_277,
  OriginalRow227TriangleData1117.coefficient81_278,
  OriginalRow227TriangleData1117.coefficient81_279,
  OriginalRow227TriangleData1117.coefficient81_280,
  OriginalRow227TriangleData1117.coefficient81_281,
  OriginalRow227TriangleData1117.coefficient81_282,
  OriginalRow227TriangleData1117.coefficient81_283,
  OriginalRow227TriangleData1117.coefficient81_284,
  OriginalRow227TriangleData1117.coefficient81_285,
  OriginalRow227TriangleData1117.coefficient81_286,
  OriginalRow227TriangleData1117.coefficient81_287,
  OriginalRow227TriangleData1117.coefficient81_288,
  OriginalRow227TriangleData1117.coefficient81_289,
  OriginalRow227TriangleData1117.coefficient81_290,
  OriginalRow227TriangleData1117.coefficient81_291,
  OriginalRow227TriangleData1117.coefficient81_292,
  OriginalRow227TriangleData1117.coefficient81_293,
  OriginalRow227TriangleData1117.coefficient81_294,
  OriginalRow227TriangleData1117.coefficient81_295,
  OriginalRow227TriangleData1117.coefficient81_296,
  OriginalRow227TriangleData1117.coefficient81_297,
  OriginalRow227TriangleData1117.coefficient81_298,
  OriginalRow227TriangleData1117.coefficient81_299,
  OriginalRow227TriangleData1117.coefficient81_300,
  OriginalRow227TriangleData1117.coefficient81_301,
  OriginalRow227TriangleData1117.coefficient81_302,
  OriginalRow227TriangleData1117.coefficient81_303
]

theorem values1117_size : values1117.size = 32 := rfl

def block1117 : ℕ → Option IntervalDyadic := segment 272 values1117

theorem block1117_domain : ExactDomain block1117 272 304 := by
  simpa only [values1117_size] using segment_domain 272 values1117

theorem block1117_get (i : Fin 32) :
    block1117 (272 + i.val) = some (values1117[i.val]'(by rw [values1117_size]; exact i.isLt)) := by
  exact segment_get 272 values1117 ⟨i.val, by rw [values1117_size]; exact i.isLt⟩

def values1118 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1118.coefficient81_304,
  OriginalRow227TriangleData1118.coefficient81_305,
  OriginalRow227TriangleData1118.coefficient81_306,
  OriginalRow227TriangleData1118.coefficient81_307,
  OriginalRow227TriangleData1118.coefficient81_308,
  OriginalRow227TriangleData1118.coefficient81_309,
  OriginalRow227TriangleData1118.coefficient81_310,
  OriginalRow227TriangleData1118.coefficient81_311,
  OriginalRow227TriangleData1118.coefficient81_312,
  OriginalRow227TriangleData1118.coefficient81_313,
  OriginalRow227TriangleData1118.coefficient81_314,
  OriginalRow227TriangleData1118.coefficient81_315,
  OriginalRow227TriangleData1118.coefficient81_316,
  OriginalRow227TriangleData1118.coefficient81_317,
  OriginalRow227TriangleData1118.coefficient81_318,
  OriginalRow227TriangleData1118.coefficient81_319,
  OriginalRow227TriangleData1118.coefficient81_320,
  OriginalRow227TriangleData1118.coefficient81_321,
  OriginalRow227TriangleData1118.coefficient81_322,
  OriginalRow227TriangleData1118.coefficient81_323,
  OriginalRow227TriangleData1118.coefficient81_324,
  OriginalRow227TriangleData1118.coefficient81_325,
  OriginalRow227TriangleData1118.coefficient81_326,
  OriginalRow227TriangleData1118.coefficient81_327,
  OriginalRow227TriangleData1118.coefficient81_328,
  OriginalRow227TriangleData1118.coefficient81_329,
  OriginalRow227TriangleData1118.coefficient81_330,
  OriginalRow227TriangleData1118.coefficient81_331,
  OriginalRow227TriangleData1118.coefficient81_332,
  OriginalRow227TriangleData1118.coefficient81_333,
  OriginalRow227TriangleData1118.coefficient81_334,
  OriginalRow227TriangleData1118.coefficient81_335
]

theorem values1118_size : values1118.size = 32 := rfl

def block1118 : ℕ → Option IntervalDyadic := segment 304 values1118

theorem block1118_domain : ExactDomain block1118 304 336 := by
  simpa only [values1118_size] using segment_domain 304 values1118

theorem block1118_get (i : Fin 32) :
    block1118 (304 + i.val) = some (values1118[i.val]'(by rw [values1118_size]; exact i.isLt)) := by
  exact segment_get 304 values1118 ⟨i.val, by rw [values1118_size]; exact i.isLt⟩

def values1119 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1119.coefficient81_336,
  OriginalRow227TriangleData1119.coefficient81_337,
  OriginalRow227TriangleData1119.coefficient81_338,
  OriginalRow227TriangleData1119.coefficient81_339,
  OriginalRow227TriangleData1119.coefficient81_340,
  OriginalRow227TriangleData1119.coefficient81_341,
  OriginalRow227TriangleData1119.coefficient81_342,
  OriginalRow227TriangleData1119.coefficient81_343,
  OriginalRow227TriangleData1119.coefficient81_344,
  OriginalRow227TriangleData1119.coefficient81_345,
  OriginalRow227TriangleData1119.coefficient81_346,
  OriginalRow227TriangleData1119.coefficient81_347,
  OriginalRow227TriangleData1119.coefficient81_348,
  OriginalRow227TriangleData1119.coefficient81_349,
  OriginalRow227TriangleData1119.coefficient81_350,
  OriginalRow227TriangleData1119.coefficient81_351,
  OriginalRow227TriangleData1119.coefficient81_352,
  OriginalRow227TriangleData1119.coefficient81_353,
  OriginalRow227TriangleData1119.coefficient81_354,
  OriginalRow227TriangleData1119.coefficient81_355,
  OriginalRow227TriangleData1119.coefficient81_356,
  OriginalRow227TriangleData1119.coefficient81_357,
  OriginalRow227TriangleData1119.coefficient81_358,
  OriginalRow227TriangleData1119.coefficient81_359,
  OriginalRow227TriangleData1119.coefficient81_360,
  OriginalRow227TriangleData1119.coefficient81_361,
  OriginalRow227TriangleData1119.coefficient81_362,
  OriginalRow227TriangleData1119.coefficient81_363,
  OriginalRow227TriangleData1119.coefficient81_364,
  OriginalRow227TriangleData1119.coefficient81_365,
  OriginalRow227TriangleData1119.coefficient81_366,
  OriginalRow227TriangleData1119.coefficient81_367
]

theorem values1119_size : values1119.size = 32 := rfl

def block1119 : ℕ → Option IntervalDyadic := segment 336 values1119

theorem block1119_domain : ExactDomain block1119 336 368 := by
  simpa only [values1119_size] using segment_domain 336 values1119

theorem block1119_get (i : Fin 32) :
    block1119 (336 + i.val) = some (values1119[i.val]'(by rw [values1119_size]; exact i.isLt)) := by
  exact segment_get 336 values1119 ⟨i.val, by rw [values1119_size]; exact i.isLt⟩

def values1120 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1120.coefficient81_368,
  OriginalRow227TriangleData1120.coefficient81_369,
  OriginalRow227TriangleData1120.coefficient81_370,
  OriginalRow227TriangleData1120.coefficient81_371,
  OriginalRow227TriangleData1120.coefficient81_372,
  OriginalRow227TriangleData1120.coefficient81_373,
  OriginalRow227TriangleData1120.coefficient81_374,
  OriginalRow227TriangleData1120.coefficient81_375,
  OriginalRow227TriangleData1120.coefficient81_376,
  OriginalRow227TriangleData1120.coefficient81_377,
  OriginalRow227TriangleData1120.coefficient81_378,
  OriginalRow227TriangleData1120.coefficient81_379,
  OriginalRow227TriangleData1120.coefficient81_380,
  OriginalRow227TriangleData1120.coefficient81_381,
  OriginalRow227TriangleData1120.coefficient81_382,
  OriginalRow227TriangleData1120.coefficient81_383,
  OriginalRow227TriangleData1120.coefficient81_384,
  OriginalRow227TriangleData1120.coefficient81_385,
  OriginalRow227TriangleData1120.coefficient81_386,
  OriginalRow227TriangleData1120.coefficient81_387,
  OriginalRow227TriangleData1120.coefficient81_388,
  OriginalRow227TriangleData1120.coefficient81_389,
  OriginalRow227TriangleData1120.coefficient81_390,
  OriginalRow227TriangleData1120.coefficient81_391,
  OriginalRow227TriangleData1120.coefficient81_392,
  OriginalRow227TriangleData1120.coefficient81_393,
  OriginalRow227TriangleData1120.coefficient81_394,
  OriginalRow227TriangleData1120.coefficient81_395,
  OriginalRow227TriangleData1120.coefficient81_396,
  OriginalRow227TriangleData1120.coefficient81_397,
  OriginalRow227TriangleData1120.coefficient81_398,
  OriginalRow227TriangleData1120.coefficient81_399
]

theorem values1120_size : values1120.size = 32 := rfl

def block1120 : ℕ → Option IntervalDyadic := segment 368 values1120

theorem block1120_domain : ExactDomain block1120 368 400 := by
  simpa only [values1120_size] using segment_domain 368 values1120

theorem block1120_get (i : Fin 32) :
    block1120 (368 + i.val) = some (values1120[i.val]'(by rw [values1120_size]; exact i.isLt)) := by
  exact segment_get 368 values1120 ⟨i.val, by rw [values1120_size]; exact i.isLt⟩

def values1121 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1121.coefficient81_400,
  OriginalRow227TriangleData1121.coefficient81_401,
  OriginalRow227TriangleData1121.coefficient81_402,
  OriginalRow227TriangleData1121.coefficient81_403,
  OriginalRow227TriangleData1121.coefficient81_404,
  OriginalRow227TriangleData1121.coefficient81_405,
  OriginalRow227TriangleData1121.coefficient81_406,
  OriginalRow227TriangleData1121.coefficient81_407,
  OriginalRow227TriangleData1121.coefficient81_408,
  OriginalRow227TriangleData1121.coefficient81_409,
  OriginalRow227TriangleData1121.coefficient81_410,
  OriginalRow227TriangleData1121.coefficient81_411,
  OriginalRow227TriangleData1121.coefficient81_412,
  OriginalRow227TriangleData1121.coefficient81_413,
  OriginalRow227TriangleData1121.coefficient81_414,
  OriginalRow227TriangleData1121.coefficient81_415,
  OriginalRow227TriangleData1121.coefficient81_416,
  OriginalRow227TriangleData1121.coefficient81_417,
  OriginalRow227TriangleData1121.coefficient81_418,
  OriginalRow227TriangleData1121.coefficient81_419,
  OriginalRow227TriangleData1121.coefficient81_420
]

theorem values1121_size : values1121.size = 21 := rfl

def block1121 : ℕ → Option IntervalDyadic := segment 400 values1121

theorem block1121_domain : ExactDomain block1121 400 421 := by
  simpa only [values1121_size] using segment_domain 400 values1121

theorem block1121_get (i : Fin 21) :
    block1121 (400 + i.val) = some (values1121[i.val]'(by rw [values1121_size]; exact i.isLt)) := by
  exact segment_get 400 values1121 ⟨i.val, by rw [values1121_size]; exact i.isLt⟩

def node0080_0144 : ℕ → Option IntervalDyadic := split 112 block1111 block1112

theorem node0080_0144_domain : ExactDomain node0080_0144 80 144 := by
  exact split_domain (by decide) (by decide) block1111_domain block1112_domain

def node0176_0240 : ℕ → Option IntervalDyadic := split 208 block1114 block1115

theorem node0176_0240_domain : ExactDomain node0176_0240 176 240 := by
  exact split_domain (by decide) (by decide) block1114_domain block1115_domain

def node0144_0240 : ℕ → Option IntervalDyadic := split 176 block1113 node0176_0240

theorem node0144_0240_domain : ExactDomain node0144_0240 144 240 := by
  exact split_domain (by decide) (by decide) block1113_domain node0176_0240_domain

def node0080_0240 : ℕ → Option IntervalDyadic := split 144 node0080_0144 node0144_0240

theorem node0080_0240_domain : ExactDomain node0080_0240 80 240 := by
  exact split_domain (by decide) (by decide) node0080_0144_domain node0144_0240_domain

def node0272_0336 : ℕ → Option IntervalDyadic := split 304 block1117 block1118

theorem node0272_0336_domain : ExactDomain node0272_0336 272 336 := by
  exact split_domain (by decide) (by decide) block1117_domain block1118_domain

def node0240_0336 : ℕ → Option IntervalDyadic := split 272 block1116 node0272_0336

theorem node0240_0336_domain : ExactDomain node0240_0336 240 336 := by
  exact split_domain (by decide) (by decide) block1116_domain node0272_0336_domain

def node0368_0421 : ℕ → Option IntervalDyadic := split 400 block1120 block1121

theorem node0368_0421_domain : ExactDomain node0368_0421 368 421 := by
  exact split_domain (by decide) (by decide) block1120_domain block1121_domain

def node0336_0421 : ℕ → Option IntervalDyadic := split 368 block1119 node0368_0421

theorem node0336_0421_domain : ExactDomain node0336_0421 336 421 := by
  exact split_domain (by decide) (by decide) block1119_domain node0368_0421_domain

def node0240_0421 : ℕ → Option IntervalDyadic := split 336 node0240_0336 node0336_0421

theorem node0240_0421_domain : ExactDomain node0240_0421 240 421 := by
  exact split_domain (by decide) (by decide) node0240_0336_domain node0336_0421_domain

def node0080_0421 : ℕ → Option IntervalDyadic := split 240 node0080_0240 node0240_0421

theorem node0080_0421_domain : ExactDomain node0080_0421 80 421 := by
  exact split_domain (by decide) (by decide) node0080_0240_domain node0240_0421_domain

def lookup : ℕ → Option IntervalDyadic := node0080_0421

theorem lookup_domain : ExactDomain lookup 80 421 :=
  node0080_0421_domain

theorem block1111_lookup (i : Fin 32) :
    lookup (80 + i.val) = some (values1111[i.val]'(by rw [values1111_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (80 + i.val) = _
  rw [node0080_0421, split_left 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0080_0240, split_left 144 node0080_0144 node0144_0240 (by omega)]
  rw [node0080_0144, split_left 112 block1111 block1112 (by omega)]
  exact block1111_get i

theorem block1112_lookup (i : Fin 32) :
    lookup (112 + i.val) = some (values1112[i.val]'(by rw [values1112_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (112 + i.val) = _
  rw [node0080_0421, split_left 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0080_0240, split_left 144 node0080_0144 node0144_0240 (by omega)]
  rw [node0080_0144, split_right 112 block1111 block1112 (by omega)]
  exact block1112_get i

theorem block1113_lookup (i : Fin 32) :
    lookup (144 + i.val) = some (values1113[i.val]'(by rw [values1113_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (144 + i.val) = _
  rw [node0080_0421, split_left 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0080_0240, split_right 144 node0080_0144 node0144_0240 (by omega)]
  rw [node0144_0240, split_left 176 block1113 node0176_0240 (by omega)]
  exact block1113_get i

theorem block1114_lookup (i : Fin 32) :
    lookup (176 + i.val) = some (values1114[i.val]'(by rw [values1114_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (176 + i.val) = _
  rw [node0080_0421, split_left 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0080_0240, split_right 144 node0080_0144 node0144_0240 (by omega)]
  rw [node0144_0240, split_right 176 block1113 node0176_0240 (by omega)]
  rw [node0176_0240, split_left 208 block1114 block1115 (by omega)]
  exact block1114_get i

theorem block1115_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values1115[i.val]'(by rw [values1115_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (208 + i.val) = _
  rw [node0080_0421, split_left 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0080_0240, split_right 144 node0080_0144 node0144_0240 (by omega)]
  rw [node0144_0240, split_right 176 block1113 node0176_0240 (by omega)]
  rw [node0176_0240, split_right 208 block1114 block1115 (by omega)]
  exact block1115_get i

theorem block1116_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values1116[i.val]'(by rw [values1116_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (240 + i.val) = _
  rw [node0080_0421, split_right 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0240_0421, split_left 336 node0240_0336 node0336_0421 (by omega)]
  rw [node0240_0336, split_left 272 block1116 node0272_0336 (by omega)]
  exact block1116_get i

theorem block1117_lookup (i : Fin 32) :
    lookup (272 + i.val) = some (values1117[i.val]'(by rw [values1117_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (272 + i.val) = _
  rw [node0080_0421, split_right 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0240_0421, split_left 336 node0240_0336 node0336_0421 (by omega)]
  rw [node0240_0336, split_right 272 block1116 node0272_0336 (by omega)]
  rw [node0272_0336, split_left 304 block1117 block1118 (by omega)]
  exact block1117_get i

theorem block1118_lookup (i : Fin 32) :
    lookup (304 + i.val) = some (values1118[i.val]'(by rw [values1118_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (304 + i.val) = _
  rw [node0080_0421, split_right 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0240_0421, split_left 336 node0240_0336 node0336_0421 (by omega)]
  rw [node0240_0336, split_right 272 block1116 node0272_0336 (by omega)]
  rw [node0272_0336, split_right 304 block1117 block1118 (by omega)]
  exact block1118_get i

theorem block1119_lookup (i : Fin 32) :
    lookup (336 + i.val) = some (values1119[i.val]'(by rw [values1119_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (336 + i.val) = _
  rw [node0080_0421, split_right 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0240_0421, split_right 336 node0240_0336 node0336_0421 (by omega)]
  rw [node0336_0421, split_left 368 block1119 node0368_0421 (by omega)]
  exact block1119_get i

theorem block1120_lookup (i : Fin 32) :
    lookup (368 + i.val) = some (values1120[i.val]'(by rw [values1120_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (368 + i.val) = _
  rw [node0080_0421, split_right 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0240_0421, split_right 336 node0240_0336 node0336_0421 (by omega)]
  rw [node0336_0421, split_right 368 block1119 node0368_0421 (by omega)]
  rw [node0368_0421, split_left 400 block1120 block1121 (by omega)]
  exact block1120_get i

theorem block1121_lookup (i : Fin 21) :
    lookup (400 + i.val) = some (values1121[i.val]'(by rw [values1121_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0080_0421 (400 + i.val) = _
  rw [node0080_0421, split_right 240 node0080_0240 node0240_0421 (by omega)]
  rw [node0240_0421, split_right 336 node0240_0336 node0336_0421 (by omega)]
  rw [node0336_0421, split_right 368 block1119 node0368_0421 (by omega)]
  rw [node0368_0421, split_right 400 block1120 block1121 (by omega)]
  exact block1121_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1111_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1111_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1112_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1112_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1113_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1113_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1114_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1114_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1115_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1115_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1116_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1116_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1117_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1117_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1118_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1118_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1119_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1119_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1120_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1120_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1121_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1121_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1111_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1112_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1113_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1114_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1115_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1116_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1117_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1118_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1119_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1120_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow081.block1121_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow081
