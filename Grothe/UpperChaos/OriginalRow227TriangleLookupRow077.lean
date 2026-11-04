import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1067
import Grothe.UpperChaos.OriginalRow227TriangleData1068
import Grothe.UpperChaos.OriginalRow227TriangleData1069
import Grothe.UpperChaos.OriginalRow227TriangleData1070
import Grothe.UpperChaos.OriginalRow227TriangleData1071
import Grothe.UpperChaos.OriginalRow227TriangleData1072
import Grothe.UpperChaos.OriginalRow227TriangleData1073
import Grothe.UpperChaos.OriginalRow227TriangleData1074
import Grothe.UpperChaos.OriginalRow227TriangleData1075
import Grothe.UpperChaos.OriginalRow227TriangleData1076
import Grothe.UpperChaos.OriginalRow227TriangleData1077

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow077

open ConditionalTableLookup

def values1067 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1067.coefficient77_76,
  OriginalRow227TriangleData1067.coefficient77_77,
  OriginalRow227TriangleData1067.coefficient77_78,
  OriginalRow227TriangleData1067.coefficient77_79,
  OriginalRow227TriangleData1067.coefficient77_80,
  OriginalRow227TriangleData1067.coefficient77_81,
  OriginalRow227TriangleData1067.coefficient77_82,
  OriginalRow227TriangleData1067.coefficient77_83,
  OriginalRow227TriangleData1067.coefficient77_84,
  OriginalRow227TriangleData1067.coefficient77_85,
  OriginalRow227TriangleData1067.coefficient77_86,
  OriginalRow227TriangleData1067.coefficient77_87,
  OriginalRow227TriangleData1067.coefficient77_88,
  OriginalRow227TriangleData1067.coefficient77_89,
  OriginalRow227TriangleData1067.coefficient77_90,
  OriginalRow227TriangleData1067.coefficient77_91,
  OriginalRow227TriangleData1067.coefficient77_92,
  OriginalRow227TriangleData1067.coefficient77_93,
  OriginalRow227TriangleData1067.coefficient77_94,
  OriginalRow227TriangleData1067.coefficient77_95,
  OriginalRow227TriangleData1067.coefficient77_96,
  OriginalRow227TriangleData1067.coefficient77_97,
  OriginalRow227TriangleData1067.coefficient77_98,
  OriginalRow227TriangleData1067.coefficient77_99,
  OriginalRow227TriangleData1067.coefficient77_100,
  OriginalRow227TriangleData1067.coefficient77_101,
  OriginalRow227TriangleData1067.coefficient77_102,
  OriginalRow227TriangleData1067.coefficient77_103,
  OriginalRow227TriangleData1067.coefficient77_104,
  OriginalRow227TriangleData1067.coefficient77_105,
  OriginalRow227TriangleData1067.coefficient77_106,
  OriginalRow227TriangleData1067.coefficient77_107
]

theorem values1067_size : values1067.size = 32 := rfl

def block1067 : ℕ → Option IntervalDyadic := segment 76 values1067

theorem block1067_domain : ExactDomain block1067 76 108 := by
  simpa only [values1067_size] using segment_domain 76 values1067

theorem block1067_get (i : Fin 32) :
    block1067 (76 + i.val) = some (values1067[i.val]'(by rw [values1067_size]; exact i.isLt)) := by
  exact segment_get 76 values1067 ⟨i.val, by rw [values1067_size]; exact i.isLt⟩

def values1068 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1068.coefficient77_108,
  OriginalRow227TriangleData1068.coefficient77_109,
  OriginalRow227TriangleData1068.coefficient77_110,
  OriginalRow227TriangleData1068.coefficient77_111,
  OriginalRow227TriangleData1068.coefficient77_112,
  OriginalRow227TriangleData1068.coefficient77_113,
  OriginalRow227TriangleData1068.coefficient77_114,
  OriginalRow227TriangleData1068.coefficient77_115,
  OriginalRow227TriangleData1068.coefficient77_116,
  OriginalRow227TriangleData1068.coefficient77_117,
  OriginalRow227TriangleData1068.coefficient77_118,
  OriginalRow227TriangleData1068.coefficient77_119,
  OriginalRow227TriangleData1068.coefficient77_120,
  OriginalRow227TriangleData1068.coefficient77_121,
  OriginalRow227TriangleData1068.coefficient77_122,
  OriginalRow227TriangleData1068.coefficient77_123,
  OriginalRow227TriangleData1068.coefficient77_124,
  OriginalRow227TriangleData1068.coefficient77_125,
  OriginalRow227TriangleData1068.coefficient77_126,
  OriginalRow227TriangleData1068.coefficient77_127,
  OriginalRow227TriangleData1068.coefficient77_128,
  OriginalRow227TriangleData1068.coefficient77_129,
  OriginalRow227TriangleData1068.coefficient77_130,
  OriginalRow227TriangleData1068.coefficient77_131,
  OriginalRow227TriangleData1068.coefficient77_132,
  OriginalRow227TriangleData1068.coefficient77_133,
  OriginalRow227TriangleData1068.coefficient77_134,
  OriginalRow227TriangleData1068.coefficient77_135,
  OriginalRow227TriangleData1068.coefficient77_136,
  OriginalRow227TriangleData1068.coefficient77_137,
  OriginalRow227TriangleData1068.coefficient77_138,
  OriginalRow227TriangleData1068.coefficient77_139
]

theorem values1068_size : values1068.size = 32 := rfl

def block1068 : ℕ → Option IntervalDyadic := segment 108 values1068

theorem block1068_domain : ExactDomain block1068 108 140 := by
  simpa only [values1068_size] using segment_domain 108 values1068

theorem block1068_get (i : Fin 32) :
    block1068 (108 + i.val) = some (values1068[i.val]'(by rw [values1068_size]; exact i.isLt)) := by
  exact segment_get 108 values1068 ⟨i.val, by rw [values1068_size]; exact i.isLt⟩

def values1069 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1069.coefficient77_140,
  OriginalRow227TriangleData1069.coefficient77_141,
  OriginalRow227TriangleData1069.coefficient77_142,
  OriginalRow227TriangleData1069.coefficient77_143,
  OriginalRow227TriangleData1069.coefficient77_144,
  OriginalRow227TriangleData1069.coefficient77_145,
  OriginalRow227TriangleData1069.coefficient77_146,
  OriginalRow227TriangleData1069.coefficient77_147,
  OriginalRow227TriangleData1069.coefficient77_148,
  OriginalRow227TriangleData1069.coefficient77_149,
  OriginalRow227TriangleData1069.coefficient77_150,
  OriginalRow227TriangleData1069.coefficient77_151,
  OriginalRow227TriangleData1069.coefficient77_152,
  OriginalRow227TriangleData1069.coefficient77_153,
  OriginalRow227TriangleData1069.coefficient77_154,
  OriginalRow227TriangleData1069.coefficient77_155,
  OriginalRow227TriangleData1069.coefficient77_156,
  OriginalRow227TriangleData1069.coefficient77_157,
  OriginalRow227TriangleData1069.coefficient77_158,
  OriginalRow227TriangleData1069.coefficient77_159,
  OriginalRow227TriangleData1069.coefficient77_160,
  OriginalRow227TriangleData1069.coefficient77_161,
  OriginalRow227TriangleData1069.coefficient77_162,
  OriginalRow227TriangleData1069.coefficient77_163,
  OriginalRow227TriangleData1069.coefficient77_164,
  OriginalRow227TriangleData1069.coefficient77_165,
  OriginalRow227TriangleData1069.coefficient77_166,
  OriginalRow227TriangleData1069.coefficient77_167,
  OriginalRow227TriangleData1069.coefficient77_168,
  OriginalRow227TriangleData1069.coefficient77_169,
  OriginalRow227TriangleData1069.coefficient77_170,
  OriginalRow227TriangleData1069.coefficient77_171
]

theorem values1069_size : values1069.size = 32 := rfl

def block1069 : ℕ → Option IntervalDyadic := segment 140 values1069

theorem block1069_domain : ExactDomain block1069 140 172 := by
  simpa only [values1069_size] using segment_domain 140 values1069

theorem block1069_get (i : Fin 32) :
    block1069 (140 + i.val) = some (values1069[i.val]'(by rw [values1069_size]; exact i.isLt)) := by
  exact segment_get 140 values1069 ⟨i.val, by rw [values1069_size]; exact i.isLt⟩

def values1070 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1070.coefficient77_172,
  OriginalRow227TriangleData1070.coefficient77_173,
  OriginalRow227TriangleData1070.coefficient77_174,
  OriginalRow227TriangleData1070.coefficient77_175,
  OriginalRow227TriangleData1070.coefficient77_176,
  OriginalRow227TriangleData1070.coefficient77_177,
  OriginalRow227TriangleData1070.coefficient77_178,
  OriginalRow227TriangleData1070.coefficient77_179,
  OriginalRow227TriangleData1070.coefficient77_180,
  OriginalRow227TriangleData1070.coefficient77_181,
  OriginalRow227TriangleData1070.coefficient77_182,
  OriginalRow227TriangleData1070.coefficient77_183,
  OriginalRow227TriangleData1070.coefficient77_184,
  OriginalRow227TriangleData1070.coefficient77_185,
  OriginalRow227TriangleData1070.coefficient77_186,
  OriginalRow227TriangleData1070.coefficient77_187,
  OriginalRow227TriangleData1070.coefficient77_188,
  OriginalRow227TriangleData1070.coefficient77_189,
  OriginalRow227TriangleData1070.coefficient77_190,
  OriginalRow227TriangleData1070.coefficient77_191,
  OriginalRow227TriangleData1070.coefficient77_192,
  OriginalRow227TriangleData1070.coefficient77_193,
  OriginalRow227TriangleData1070.coefficient77_194,
  OriginalRow227TriangleData1070.coefficient77_195,
  OriginalRow227TriangleData1070.coefficient77_196,
  OriginalRow227TriangleData1070.coefficient77_197,
  OriginalRow227TriangleData1070.coefficient77_198,
  OriginalRow227TriangleData1070.coefficient77_199,
  OriginalRow227TriangleData1070.coefficient77_200,
  OriginalRow227TriangleData1070.coefficient77_201,
  OriginalRow227TriangleData1070.coefficient77_202,
  OriginalRow227TriangleData1070.coefficient77_203
]

theorem values1070_size : values1070.size = 32 := rfl

def block1070 : ℕ → Option IntervalDyadic := segment 172 values1070

theorem block1070_domain : ExactDomain block1070 172 204 := by
  simpa only [values1070_size] using segment_domain 172 values1070

theorem block1070_get (i : Fin 32) :
    block1070 (172 + i.val) = some (values1070[i.val]'(by rw [values1070_size]; exact i.isLt)) := by
  exact segment_get 172 values1070 ⟨i.val, by rw [values1070_size]; exact i.isLt⟩

def values1071 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1071.coefficient77_204,
  OriginalRow227TriangleData1071.coefficient77_205,
  OriginalRow227TriangleData1071.coefficient77_206,
  OriginalRow227TriangleData1071.coefficient77_207,
  OriginalRow227TriangleData1071.coefficient77_208,
  OriginalRow227TriangleData1071.coefficient77_209,
  OriginalRow227TriangleData1071.coefficient77_210,
  OriginalRow227TriangleData1071.coefficient77_211,
  OriginalRow227TriangleData1071.coefficient77_212,
  OriginalRow227TriangleData1071.coefficient77_213,
  OriginalRow227TriangleData1071.coefficient77_214,
  OriginalRow227TriangleData1071.coefficient77_215,
  OriginalRow227TriangleData1071.coefficient77_216,
  OriginalRow227TriangleData1071.coefficient77_217,
  OriginalRow227TriangleData1071.coefficient77_218,
  OriginalRow227TriangleData1071.coefficient77_219,
  OriginalRow227TriangleData1071.coefficient77_220,
  OriginalRow227TriangleData1071.coefficient77_221,
  OriginalRow227TriangleData1071.coefficient77_222,
  OriginalRow227TriangleData1071.coefficient77_223,
  OriginalRow227TriangleData1071.coefficient77_224,
  OriginalRow227TriangleData1071.coefficient77_225,
  OriginalRow227TriangleData1071.coefficient77_226,
  OriginalRow227TriangleData1071.coefficient77_227,
  OriginalRow227TriangleData1071.coefficient77_228,
  OriginalRow227TriangleData1071.coefficient77_229,
  OriginalRow227TriangleData1071.coefficient77_230,
  OriginalRow227TriangleData1071.coefficient77_231,
  OriginalRow227TriangleData1071.coefficient77_232,
  OriginalRow227TriangleData1071.coefficient77_233,
  OriginalRow227TriangleData1071.coefficient77_234,
  OriginalRow227TriangleData1071.coefficient77_235
]

theorem values1071_size : values1071.size = 32 := rfl

def block1071 : ℕ → Option IntervalDyadic := segment 204 values1071

theorem block1071_domain : ExactDomain block1071 204 236 := by
  simpa only [values1071_size] using segment_domain 204 values1071

theorem block1071_get (i : Fin 32) :
    block1071 (204 + i.val) = some (values1071[i.val]'(by rw [values1071_size]; exact i.isLt)) := by
  exact segment_get 204 values1071 ⟨i.val, by rw [values1071_size]; exact i.isLt⟩

def values1072 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1072.coefficient77_236,
  OriginalRow227TriangleData1072.coefficient77_237,
  OriginalRow227TriangleData1072.coefficient77_238,
  OriginalRow227TriangleData1072.coefficient77_239,
  OriginalRow227TriangleData1072.coefficient77_240,
  OriginalRow227TriangleData1072.coefficient77_241,
  OriginalRow227TriangleData1072.coefficient77_242,
  OriginalRow227TriangleData1072.coefficient77_243,
  OriginalRow227TriangleData1072.coefficient77_244,
  OriginalRow227TriangleData1072.coefficient77_245,
  OriginalRow227TriangleData1072.coefficient77_246,
  OriginalRow227TriangleData1072.coefficient77_247,
  OriginalRow227TriangleData1072.coefficient77_248,
  OriginalRow227TriangleData1072.coefficient77_249,
  OriginalRow227TriangleData1072.coefficient77_250,
  OriginalRow227TriangleData1072.coefficient77_251,
  OriginalRow227TriangleData1072.coefficient77_252,
  OriginalRow227TriangleData1072.coefficient77_253,
  OriginalRow227TriangleData1072.coefficient77_254,
  OriginalRow227TriangleData1072.coefficient77_255,
  OriginalRow227TriangleData1072.coefficient77_256,
  OriginalRow227TriangleData1072.coefficient77_257,
  OriginalRow227TriangleData1072.coefficient77_258,
  OriginalRow227TriangleData1072.coefficient77_259,
  OriginalRow227TriangleData1072.coefficient77_260,
  OriginalRow227TriangleData1072.coefficient77_261,
  OriginalRow227TriangleData1072.coefficient77_262,
  OriginalRow227TriangleData1072.coefficient77_263,
  OriginalRow227TriangleData1072.coefficient77_264,
  OriginalRow227TriangleData1072.coefficient77_265,
  OriginalRow227TriangleData1072.coefficient77_266,
  OriginalRow227TriangleData1072.coefficient77_267
]

theorem values1072_size : values1072.size = 32 := rfl

def block1072 : ℕ → Option IntervalDyadic := segment 236 values1072

theorem block1072_domain : ExactDomain block1072 236 268 := by
  simpa only [values1072_size] using segment_domain 236 values1072

theorem block1072_get (i : Fin 32) :
    block1072 (236 + i.val) = some (values1072[i.val]'(by rw [values1072_size]; exact i.isLt)) := by
  exact segment_get 236 values1072 ⟨i.val, by rw [values1072_size]; exact i.isLt⟩

def values1073 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1073.coefficient77_268,
  OriginalRow227TriangleData1073.coefficient77_269,
  OriginalRow227TriangleData1073.coefficient77_270,
  OriginalRow227TriangleData1073.coefficient77_271,
  OriginalRow227TriangleData1073.coefficient77_272,
  OriginalRow227TriangleData1073.coefficient77_273,
  OriginalRow227TriangleData1073.coefficient77_274,
  OriginalRow227TriangleData1073.coefficient77_275,
  OriginalRow227TriangleData1073.coefficient77_276,
  OriginalRow227TriangleData1073.coefficient77_277,
  OriginalRow227TriangleData1073.coefficient77_278,
  OriginalRow227TriangleData1073.coefficient77_279,
  OriginalRow227TriangleData1073.coefficient77_280,
  OriginalRow227TriangleData1073.coefficient77_281,
  OriginalRow227TriangleData1073.coefficient77_282,
  OriginalRow227TriangleData1073.coefficient77_283,
  OriginalRow227TriangleData1073.coefficient77_284,
  OriginalRow227TriangleData1073.coefficient77_285,
  OriginalRow227TriangleData1073.coefficient77_286,
  OriginalRow227TriangleData1073.coefficient77_287,
  OriginalRow227TriangleData1073.coefficient77_288,
  OriginalRow227TriangleData1073.coefficient77_289,
  OriginalRow227TriangleData1073.coefficient77_290,
  OriginalRow227TriangleData1073.coefficient77_291,
  OriginalRow227TriangleData1073.coefficient77_292,
  OriginalRow227TriangleData1073.coefficient77_293,
  OriginalRow227TriangleData1073.coefficient77_294,
  OriginalRow227TriangleData1073.coefficient77_295,
  OriginalRow227TriangleData1073.coefficient77_296,
  OriginalRow227TriangleData1073.coefficient77_297,
  OriginalRow227TriangleData1073.coefficient77_298,
  OriginalRow227TriangleData1073.coefficient77_299
]

theorem values1073_size : values1073.size = 32 := rfl

def block1073 : ℕ → Option IntervalDyadic := segment 268 values1073

theorem block1073_domain : ExactDomain block1073 268 300 := by
  simpa only [values1073_size] using segment_domain 268 values1073

theorem block1073_get (i : Fin 32) :
    block1073 (268 + i.val) = some (values1073[i.val]'(by rw [values1073_size]; exact i.isLt)) := by
  exact segment_get 268 values1073 ⟨i.val, by rw [values1073_size]; exact i.isLt⟩

def values1074 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1074.coefficient77_300,
  OriginalRow227TriangleData1074.coefficient77_301,
  OriginalRow227TriangleData1074.coefficient77_302,
  OriginalRow227TriangleData1074.coefficient77_303,
  OriginalRow227TriangleData1074.coefficient77_304,
  OriginalRow227TriangleData1074.coefficient77_305,
  OriginalRow227TriangleData1074.coefficient77_306,
  OriginalRow227TriangleData1074.coefficient77_307,
  OriginalRow227TriangleData1074.coefficient77_308,
  OriginalRow227TriangleData1074.coefficient77_309,
  OriginalRow227TriangleData1074.coefficient77_310,
  OriginalRow227TriangleData1074.coefficient77_311,
  OriginalRow227TriangleData1074.coefficient77_312,
  OriginalRow227TriangleData1074.coefficient77_313,
  OriginalRow227TriangleData1074.coefficient77_314,
  OriginalRow227TriangleData1074.coefficient77_315,
  OriginalRow227TriangleData1074.coefficient77_316,
  OriginalRow227TriangleData1074.coefficient77_317,
  OriginalRow227TriangleData1074.coefficient77_318,
  OriginalRow227TriangleData1074.coefficient77_319,
  OriginalRow227TriangleData1074.coefficient77_320,
  OriginalRow227TriangleData1074.coefficient77_321,
  OriginalRow227TriangleData1074.coefficient77_322,
  OriginalRow227TriangleData1074.coefficient77_323,
  OriginalRow227TriangleData1074.coefficient77_324,
  OriginalRow227TriangleData1074.coefficient77_325,
  OriginalRow227TriangleData1074.coefficient77_326,
  OriginalRow227TriangleData1074.coefficient77_327,
  OriginalRow227TriangleData1074.coefficient77_328,
  OriginalRow227TriangleData1074.coefficient77_329,
  OriginalRow227TriangleData1074.coefficient77_330,
  OriginalRow227TriangleData1074.coefficient77_331
]

theorem values1074_size : values1074.size = 32 := rfl

def block1074 : ℕ → Option IntervalDyadic := segment 300 values1074

theorem block1074_domain : ExactDomain block1074 300 332 := by
  simpa only [values1074_size] using segment_domain 300 values1074

theorem block1074_get (i : Fin 32) :
    block1074 (300 + i.val) = some (values1074[i.val]'(by rw [values1074_size]; exact i.isLt)) := by
  exact segment_get 300 values1074 ⟨i.val, by rw [values1074_size]; exact i.isLt⟩

def values1075 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1075.coefficient77_332,
  OriginalRow227TriangleData1075.coefficient77_333,
  OriginalRow227TriangleData1075.coefficient77_334,
  OriginalRow227TriangleData1075.coefficient77_335,
  OriginalRow227TriangleData1075.coefficient77_336,
  OriginalRow227TriangleData1075.coefficient77_337,
  OriginalRow227TriangleData1075.coefficient77_338,
  OriginalRow227TriangleData1075.coefficient77_339,
  OriginalRow227TriangleData1075.coefficient77_340,
  OriginalRow227TriangleData1075.coefficient77_341,
  OriginalRow227TriangleData1075.coefficient77_342,
  OriginalRow227TriangleData1075.coefficient77_343,
  OriginalRow227TriangleData1075.coefficient77_344,
  OriginalRow227TriangleData1075.coefficient77_345,
  OriginalRow227TriangleData1075.coefficient77_346,
  OriginalRow227TriangleData1075.coefficient77_347,
  OriginalRow227TriangleData1075.coefficient77_348,
  OriginalRow227TriangleData1075.coefficient77_349,
  OriginalRow227TriangleData1075.coefficient77_350,
  OriginalRow227TriangleData1075.coefficient77_351,
  OriginalRow227TriangleData1075.coefficient77_352,
  OriginalRow227TriangleData1075.coefficient77_353,
  OriginalRow227TriangleData1075.coefficient77_354,
  OriginalRow227TriangleData1075.coefficient77_355,
  OriginalRow227TriangleData1075.coefficient77_356,
  OriginalRow227TriangleData1075.coefficient77_357,
  OriginalRow227TriangleData1075.coefficient77_358,
  OriginalRow227TriangleData1075.coefficient77_359,
  OriginalRow227TriangleData1075.coefficient77_360,
  OriginalRow227TriangleData1075.coefficient77_361,
  OriginalRow227TriangleData1075.coefficient77_362,
  OriginalRow227TriangleData1075.coefficient77_363
]

theorem values1075_size : values1075.size = 32 := rfl

def block1075 : ℕ → Option IntervalDyadic := segment 332 values1075

theorem block1075_domain : ExactDomain block1075 332 364 := by
  simpa only [values1075_size] using segment_domain 332 values1075

theorem block1075_get (i : Fin 32) :
    block1075 (332 + i.val) = some (values1075[i.val]'(by rw [values1075_size]; exact i.isLt)) := by
  exact segment_get 332 values1075 ⟨i.val, by rw [values1075_size]; exact i.isLt⟩

def values1076 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1076.coefficient77_364,
  OriginalRow227TriangleData1076.coefficient77_365,
  OriginalRow227TriangleData1076.coefficient77_366,
  OriginalRow227TriangleData1076.coefficient77_367,
  OriginalRow227TriangleData1076.coefficient77_368,
  OriginalRow227TriangleData1076.coefficient77_369,
  OriginalRow227TriangleData1076.coefficient77_370,
  OriginalRow227TriangleData1076.coefficient77_371,
  OriginalRow227TriangleData1076.coefficient77_372,
  OriginalRow227TriangleData1076.coefficient77_373,
  OriginalRow227TriangleData1076.coefficient77_374,
  OriginalRow227TriangleData1076.coefficient77_375,
  OriginalRow227TriangleData1076.coefficient77_376,
  OriginalRow227TriangleData1076.coefficient77_377,
  OriginalRow227TriangleData1076.coefficient77_378,
  OriginalRow227TriangleData1076.coefficient77_379,
  OriginalRow227TriangleData1076.coefficient77_380,
  OriginalRow227TriangleData1076.coefficient77_381,
  OriginalRow227TriangleData1076.coefficient77_382,
  OriginalRow227TriangleData1076.coefficient77_383,
  OriginalRow227TriangleData1076.coefficient77_384,
  OriginalRow227TriangleData1076.coefficient77_385,
  OriginalRow227TriangleData1076.coefficient77_386,
  OriginalRow227TriangleData1076.coefficient77_387,
  OriginalRow227TriangleData1076.coefficient77_388,
  OriginalRow227TriangleData1076.coefficient77_389,
  OriginalRow227TriangleData1076.coefficient77_390,
  OriginalRow227TriangleData1076.coefficient77_391,
  OriginalRow227TriangleData1076.coefficient77_392,
  OriginalRow227TriangleData1076.coefficient77_393,
  OriginalRow227TriangleData1076.coefficient77_394,
  OriginalRow227TriangleData1076.coefficient77_395
]

theorem values1076_size : values1076.size = 32 := rfl

def block1076 : ℕ → Option IntervalDyadic := segment 364 values1076

theorem block1076_domain : ExactDomain block1076 364 396 := by
  simpa only [values1076_size] using segment_domain 364 values1076

theorem block1076_get (i : Fin 32) :
    block1076 (364 + i.val) = some (values1076[i.val]'(by rw [values1076_size]; exact i.isLt)) := by
  exact segment_get 364 values1076 ⟨i.val, by rw [values1076_size]; exact i.isLt⟩

def values1077 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1077.coefficient77_396,
  OriginalRow227TriangleData1077.coefficient77_397,
  OriginalRow227TriangleData1077.coefficient77_398,
  OriginalRow227TriangleData1077.coefficient77_399,
  OriginalRow227TriangleData1077.coefficient77_400,
  OriginalRow227TriangleData1077.coefficient77_401,
  OriginalRow227TriangleData1077.coefficient77_402,
  OriginalRow227TriangleData1077.coefficient77_403,
  OriginalRow227TriangleData1077.coefficient77_404,
  OriginalRow227TriangleData1077.coefficient77_405,
  OriginalRow227TriangleData1077.coefficient77_406,
  OriginalRow227TriangleData1077.coefficient77_407,
  OriginalRow227TriangleData1077.coefficient77_408,
  OriginalRow227TriangleData1077.coefficient77_409,
  OriginalRow227TriangleData1077.coefficient77_410,
  OriginalRow227TriangleData1077.coefficient77_411,
  OriginalRow227TriangleData1077.coefficient77_412,
  OriginalRow227TriangleData1077.coefficient77_413,
  OriginalRow227TriangleData1077.coefficient77_414,
  OriginalRow227TriangleData1077.coefficient77_415,
  OriginalRow227TriangleData1077.coefficient77_416,
  OriginalRow227TriangleData1077.coefficient77_417,
  OriginalRow227TriangleData1077.coefficient77_418,
  OriginalRow227TriangleData1077.coefficient77_419,
  OriginalRow227TriangleData1077.coefficient77_420,
  OriginalRow227TriangleData1077.coefficient77_421,
  OriginalRow227TriangleData1077.coefficient77_422,
  OriginalRow227TriangleData1077.coefficient77_423,
  OriginalRow227TriangleData1077.coefficient77_424
]

theorem values1077_size : values1077.size = 29 := rfl

def block1077 : ℕ → Option IntervalDyadic := segment 396 values1077

theorem block1077_domain : ExactDomain block1077 396 425 := by
  simpa only [values1077_size] using segment_domain 396 values1077

theorem block1077_get (i : Fin 29) :
    block1077 (396 + i.val) = some (values1077[i.val]'(by rw [values1077_size]; exact i.isLt)) := by
  exact segment_get 396 values1077 ⟨i.val, by rw [values1077_size]; exact i.isLt⟩

def node0076_0140 : ℕ → Option IntervalDyadic := split 108 block1067 block1068

theorem node0076_0140_domain : ExactDomain node0076_0140 76 140 := by
  exact split_domain (by decide) (by decide) block1067_domain block1068_domain

def node0172_0236 : ℕ → Option IntervalDyadic := split 204 block1070 block1071

theorem node0172_0236_domain : ExactDomain node0172_0236 172 236 := by
  exact split_domain (by decide) (by decide) block1070_domain block1071_domain

def node0140_0236 : ℕ → Option IntervalDyadic := split 172 block1069 node0172_0236

theorem node0140_0236_domain : ExactDomain node0140_0236 140 236 := by
  exact split_domain (by decide) (by decide) block1069_domain node0172_0236_domain

def node0076_0236 : ℕ → Option IntervalDyadic := split 140 node0076_0140 node0140_0236

theorem node0076_0236_domain : ExactDomain node0076_0236 76 236 := by
  exact split_domain (by decide) (by decide) node0076_0140_domain node0140_0236_domain

def node0268_0332 : ℕ → Option IntervalDyadic := split 300 block1073 block1074

theorem node0268_0332_domain : ExactDomain node0268_0332 268 332 := by
  exact split_domain (by decide) (by decide) block1073_domain block1074_domain

def node0236_0332 : ℕ → Option IntervalDyadic := split 268 block1072 node0268_0332

theorem node0236_0332_domain : ExactDomain node0236_0332 236 332 := by
  exact split_domain (by decide) (by decide) block1072_domain node0268_0332_domain

def node0364_0425 : ℕ → Option IntervalDyadic := split 396 block1076 block1077

theorem node0364_0425_domain : ExactDomain node0364_0425 364 425 := by
  exact split_domain (by decide) (by decide) block1076_domain block1077_domain

def node0332_0425 : ℕ → Option IntervalDyadic := split 364 block1075 node0364_0425

theorem node0332_0425_domain : ExactDomain node0332_0425 332 425 := by
  exact split_domain (by decide) (by decide) block1075_domain node0364_0425_domain

def node0236_0425 : ℕ → Option IntervalDyadic := split 332 node0236_0332 node0332_0425

theorem node0236_0425_domain : ExactDomain node0236_0425 236 425 := by
  exact split_domain (by decide) (by decide) node0236_0332_domain node0332_0425_domain

def node0076_0425 : ℕ → Option IntervalDyadic := split 236 node0076_0236 node0236_0425

theorem node0076_0425_domain : ExactDomain node0076_0425 76 425 := by
  exact split_domain (by decide) (by decide) node0076_0236_domain node0236_0425_domain

def lookup : ℕ → Option IntervalDyadic := node0076_0425

theorem lookup_domain : ExactDomain lookup 76 425 :=
  node0076_0425_domain

theorem block1067_lookup (i : Fin 32) :
    lookup (76 + i.val) = some (values1067[i.val]'(by rw [values1067_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (76 + i.val) = _
  rw [node0076_0425, split_left 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0076_0236, split_left 140 node0076_0140 node0140_0236 (by omega)]
  rw [node0076_0140, split_left 108 block1067 block1068 (by omega)]
  exact block1067_get i

theorem block1068_lookup (i : Fin 32) :
    lookup (108 + i.val) = some (values1068[i.val]'(by rw [values1068_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (108 + i.val) = _
  rw [node0076_0425, split_left 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0076_0236, split_left 140 node0076_0140 node0140_0236 (by omega)]
  rw [node0076_0140, split_right 108 block1067 block1068 (by omega)]
  exact block1068_get i

theorem block1069_lookup (i : Fin 32) :
    lookup (140 + i.val) = some (values1069[i.val]'(by rw [values1069_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (140 + i.val) = _
  rw [node0076_0425, split_left 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0076_0236, split_right 140 node0076_0140 node0140_0236 (by omega)]
  rw [node0140_0236, split_left 172 block1069 node0172_0236 (by omega)]
  exact block1069_get i

theorem block1070_lookup (i : Fin 32) :
    lookup (172 + i.val) = some (values1070[i.val]'(by rw [values1070_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (172 + i.val) = _
  rw [node0076_0425, split_left 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0076_0236, split_right 140 node0076_0140 node0140_0236 (by omega)]
  rw [node0140_0236, split_right 172 block1069 node0172_0236 (by omega)]
  rw [node0172_0236, split_left 204 block1070 block1071 (by omega)]
  exact block1070_get i

theorem block1071_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values1071[i.val]'(by rw [values1071_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (204 + i.val) = _
  rw [node0076_0425, split_left 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0076_0236, split_right 140 node0076_0140 node0140_0236 (by omega)]
  rw [node0140_0236, split_right 172 block1069 node0172_0236 (by omega)]
  rw [node0172_0236, split_right 204 block1070 block1071 (by omega)]
  exact block1071_get i

theorem block1072_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values1072[i.val]'(by rw [values1072_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (236 + i.val) = _
  rw [node0076_0425, split_right 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0236_0425, split_left 332 node0236_0332 node0332_0425 (by omega)]
  rw [node0236_0332, split_left 268 block1072 node0268_0332 (by omega)]
  exact block1072_get i

theorem block1073_lookup (i : Fin 32) :
    lookup (268 + i.val) = some (values1073[i.val]'(by rw [values1073_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (268 + i.val) = _
  rw [node0076_0425, split_right 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0236_0425, split_left 332 node0236_0332 node0332_0425 (by omega)]
  rw [node0236_0332, split_right 268 block1072 node0268_0332 (by omega)]
  rw [node0268_0332, split_left 300 block1073 block1074 (by omega)]
  exact block1073_get i

theorem block1074_lookup (i : Fin 32) :
    lookup (300 + i.val) = some (values1074[i.val]'(by rw [values1074_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (300 + i.val) = _
  rw [node0076_0425, split_right 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0236_0425, split_left 332 node0236_0332 node0332_0425 (by omega)]
  rw [node0236_0332, split_right 268 block1072 node0268_0332 (by omega)]
  rw [node0268_0332, split_right 300 block1073 block1074 (by omega)]
  exact block1074_get i

theorem block1075_lookup (i : Fin 32) :
    lookup (332 + i.val) = some (values1075[i.val]'(by rw [values1075_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (332 + i.val) = _
  rw [node0076_0425, split_right 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0236_0425, split_right 332 node0236_0332 node0332_0425 (by omega)]
  rw [node0332_0425, split_left 364 block1075 node0364_0425 (by omega)]
  exact block1075_get i

theorem block1076_lookup (i : Fin 32) :
    lookup (364 + i.val) = some (values1076[i.val]'(by rw [values1076_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (364 + i.val) = _
  rw [node0076_0425, split_right 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0236_0425, split_right 332 node0236_0332 node0332_0425 (by omega)]
  rw [node0332_0425, split_right 364 block1075 node0364_0425 (by omega)]
  rw [node0364_0425, split_left 396 block1076 block1077 (by omega)]
  exact block1076_get i

theorem block1077_lookup (i : Fin 29) :
    lookup (396 + i.val) = some (values1077[i.val]'(by rw [values1077_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0076_0425 (396 + i.val) = _
  rw [node0076_0425, split_right 236 node0076_0236 node0236_0425 (by omega)]
  rw [node0236_0425, split_right 332 node0236_0332 node0332_0425 (by omega)]
  rw [node0332_0425, split_right 364 block1075 node0364_0425 (by omega)]
  rw [node0364_0425, split_right 396 block1076 block1077 (by omega)]
  exact block1077_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1067_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1067_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1068_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1068_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1069_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1069_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1070_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1070_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1071_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1071_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1072_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1072_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1073_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1073_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1074_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1074_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1075_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1075_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1076_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1076_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1077_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1077_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1067_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1068_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1069_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1070_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1071_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1072_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1073_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1074_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1075_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1076_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow077.block1077_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow077
