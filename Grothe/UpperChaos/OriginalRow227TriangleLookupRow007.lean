import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0112
import Grothe.UpperChaos.OriginalRow227TriangleData0113
import Grothe.UpperChaos.OriginalRow227TriangleData0114
import Grothe.UpperChaos.OriginalRow227TriangleData0115
import Grothe.UpperChaos.OriginalRow227TriangleData0116
import Grothe.UpperChaos.OriginalRow227TriangleData0117
import Grothe.UpperChaos.OriginalRow227TriangleData0118
import Grothe.UpperChaos.OriginalRow227TriangleData0119
import Grothe.UpperChaos.OriginalRow227TriangleData0120
import Grothe.UpperChaos.OriginalRow227TriangleData0121
import Grothe.UpperChaos.OriginalRow227TriangleData0122
import Grothe.UpperChaos.OriginalRow227TriangleData0123
import Grothe.UpperChaos.OriginalRow227TriangleData0124
import Grothe.UpperChaos.OriginalRow227TriangleData0125
import Grothe.UpperChaos.OriginalRow227TriangleData0126
import Grothe.UpperChaos.OriginalRow227TriangleData0127

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow007

open ConditionalTableLookup

def values0112 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0112.coefficient7_6,
  OriginalRow227TriangleData0112.coefficient7_7,
  OriginalRow227TriangleData0112.coefficient7_8,
  OriginalRow227TriangleData0112.coefficient7_9,
  OriginalRow227TriangleData0112.coefficient7_10,
  OriginalRow227TriangleData0112.coefficient7_11,
  OriginalRow227TriangleData0112.coefficient7_12,
  OriginalRow227TriangleData0112.coefficient7_13,
  OriginalRow227TriangleData0112.coefficient7_14,
  OriginalRow227TriangleData0112.coefficient7_15,
  OriginalRow227TriangleData0112.coefficient7_16,
  OriginalRow227TriangleData0112.coefficient7_17,
  OriginalRow227TriangleData0112.coefficient7_18,
  OriginalRow227TriangleData0112.coefficient7_19,
  OriginalRow227TriangleData0112.coefficient7_20,
  OriginalRow227TriangleData0112.coefficient7_21,
  OriginalRow227TriangleData0112.coefficient7_22,
  OriginalRow227TriangleData0112.coefficient7_23,
  OriginalRow227TriangleData0112.coefficient7_24,
  OriginalRow227TriangleData0112.coefficient7_25,
  OriginalRow227TriangleData0112.coefficient7_26,
  OriginalRow227TriangleData0112.coefficient7_27,
  OriginalRow227TriangleData0112.coefficient7_28,
  OriginalRow227TriangleData0112.coefficient7_29,
  OriginalRow227TriangleData0112.coefficient7_30,
  OriginalRow227TriangleData0112.coefficient7_31,
  OriginalRow227TriangleData0112.coefficient7_32,
  OriginalRow227TriangleData0112.coefficient7_33,
  OriginalRow227TriangleData0112.coefficient7_34,
  OriginalRow227TriangleData0112.coefficient7_35,
  OriginalRow227TriangleData0112.coefficient7_36,
  OriginalRow227TriangleData0112.coefficient7_37
]

theorem values0112_size : values0112.size = 32 := rfl

def block0112 : ℕ → Option IntervalDyadic := segment 6 values0112

theorem block0112_domain : ExactDomain block0112 6 38 := by
  simpa only [values0112_size] using segment_domain 6 values0112

theorem block0112_get (i : Fin 32) :
    block0112 (6 + i.val) = some (values0112[i.val]'(by rw [values0112_size]; exact i.isLt)) := by
  exact segment_get 6 values0112 ⟨i.val, by rw [values0112_size]; exact i.isLt⟩

def values0113 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0113.coefficient7_38,
  OriginalRow227TriangleData0113.coefficient7_39,
  OriginalRow227TriangleData0113.coefficient7_40,
  OriginalRow227TriangleData0113.coefficient7_41,
  OriginalRow227TriangleData0113.coefficient7_42,
  OriginalRow227TriangleData0113.coefficient7_43,
  OriginalRow227TriangleData0113.coefficient7_44,
  OriginalRow227TriangleData0113.coefficient7_45,
  OriginalRow227TriangleData0113.coefficient7_46,
  OriginalRow227TriangleData0113.coefficient7_47,
  OriginalRow227TriangleData0113.coefficient7_48,
  OriginalRow227TriangleData0113.coefficient7_49,
  OriginalRow227TriangleData0113.coefficient7_50,
  OriginalRow227TriangleData0113.coefficient7_51,
  OriginalRow227TriangleData0113.coefficient7_52,
  OriginalRow227TriangleData0113.coefficient7_53,
  OriginalRow227TriangleData0113.coefficient7_54,
  OriginalRow227TriangleData0113.coefficient7_55,
  OriginalRow227TriangleData0113.coefficient7_56,
  OriginalRow227TriangleData0113.coefficient7_57,
  OriginalRow227TriangleData0113.coefficient7_58,
  OriginalRow227TriangleData0113.coefficient7_59,
  OriginalRow227TriangleData0113.coefficient7_60,
  OriginalRow227TriangleData0113.coefficient7_61,
  OriginalRow227TriangleData0113.coefficient7_62,
  OriginalRow227TriangleData0113.coefficient7_63,
  OriginalRow227TriangleData0113.coefficient7_64,
  OriginalRow227TriangleData0113.coefficient7_65,
  OriginalRow227TriangleData0113.coefficient7_66,
  OriginalRow227TriangleData0113.coefficient7_67,
  OriginalRow227TriangleData0113.coefficient7_68,
  OriginalRow227TriangleData0113.coefficient7_69
]

theorem values0113_size : values0113.size = 32 := rfl

def block0113 : ℕ → Option IntervalDyadic := segment 38 values0113

theorem block0113_domain : ExactDomain block0113 38 70 := by
  simpa only [values0113_size] using segment_domain 38 values0113

theorem block0113_get (i : Fin 32) :
    block0113 (38 + i.val) = some (values0113[i.val]'(by rw [values0113_size]; exact i.isLt)) := by
  exact segment_get 38 values0113 ⟨i.val, by rw [values0113_size]; exact i.isLt⟩

def values0114 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0114.coefficient7_70,
  OriginalRow227TriangleData0114.coefficient7_71,
  OriginalRow227TriangleData0114.coefficient7_72,
  OriginalRow227TriangleData0114.coefficient7_73,
  OriginalRow227TriangleData0114.coefficient7_74,
  OriginalRow227TriangleData0114.coefficient7_75,
  OriginalRow227TriangleData0114.coefficient7_76,
  OriginalRow227TriangleData0114.coefficient7_77,
  OriginalRow227TriangleData0114.coefficient7_78,
  OriginalRow227TriangleData0114.coefficient7_79,
  OriginalRow227TriangleData0114.coefficient7_80,
  OriginalRow227TriangleData0114.coefficient7_81,
  OriginalRow227TriangleData0114.coefficient7_82,
  OriginalRow227TriangleData0114.coefficient7_83,
  OriginalRow227TriangleData0114.coefficient7_84,
  OriginalRow227TriangleData0114.coefficient7_85,
  OriginalRow227TriangleData0114.coefficient7_86,
  OriginalRow227TriangleData0114.coefficient7_87,
  OriginalRow227TriangleData0114.coefficient7_88,
  OriginalRow227TriangleData0114.coefficient7_89,
  OriginalRow227TriangleData0114.coefficient7_90,
  OriginalRow227TriangleData0114.coefficient7_91,
  OriginalRow227TriangleData0114.coefficient7_92,
  OriginalRow227TriangleData0114.coefficient7_93,
  OriginalRow227TriangleData0114.coefficient7_94,
  OriginalRow227TriangleData0114.coefficient7_95,
  OriginalRow227TriangleData0114.coefficient7_96,
  OriginalRow227TriangleData0114.coefficient7_97,
  OriginalRow227TriangleData0114.coefficient7_98,
  OriginalRow227TriangleData0114.coefficient7_99,
  OriginalRow227TriangleData0114.coefficient7_100,
  OriginalRow227TriangleData0114.coefficient7_101
]

theorem values0114_size : values0114.size = 32 := rfl

def block0114 : ℕ → Option IntervalDyadic := segment 70 values0114

theorem block0114_domain : ExactDomain block0114 70 102 := by
  simpa only [values0114_size] using segment_domain 70 values0114

theorem block0114_get (i : Fin 32) :
    block0114 (70 + i.val) = some (values0114[i.val]'(by rw [values0114_size]; exact i.isLt)) := by
  exact segment_get 70 values0114 ⟨i.val, by rw [values0114_size]; exact i.isLt⟩

def values0115 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0115.coefficient7_102,
  OriginalRow227TriangleData0115.coefficient7_103,
  OriginalRow227TriangleData0115.coefficient7_104,
  OriginalRow227TriangleData0115.coefficient7_105,
  OriginalRow227TriangleData0115.coefficient7_106,
  OriginalRow227TriangleData0115.coefficient7_107,
  OriginalRow227TriangleData0115.coefficient7_108,
  OriginalRow227TriangleData0115.coefficient7_109,
  OriginalRow227TriangleData0115.coefficient7_110,
  OriginalRow227TriangleData0115.coefficient7_111,
  OriginalRow227TriangleData0115.coefficient7_112,
  OriginalRow227TriangleData0115.coefficient7_113,
  OriginalRow227TriangleData0115.coefficient7_114,
  OriginalRow227TriangleData0115.coefficient7_115,
  OriginalRow227TriangleData0115.coefficient7_116,
  OriginalRow227TriangleData0115.coefficient7_117,
  OriginalRow227TriangleData0115.coefficient7_118,
  OriginalRow227TriangleData0115.coefficient7_119,
  OriginalRow227TriangleData0115.coefficient7_120,
  OriginalRow227TriangleData0115.coefficient7_121,
  OriginalRow227TriangleData0115.coefficient7_122,
  OriginalRow227TriangleData0115.coefficient7_123,
  OriginalRow227TriangleData0115.coefficient7_124,
  OriginalRow227TriangleData0115.coefficient7_125,
  OriginalRow227TriangleData0115.coefficient7_126,
  OriginalRow227TriangleData0115.coefficient7_127,
  OriginalRow227TriangleData0115.coefficient7_128,
  OriginalRow227TriangleData0115.coefficient7_129,
  OriginalRow227TriangleData0115.coefficient7_130,
  OriginalRow227TriangleData0115.coefficient7_131,
  OriginalRow227TriangleData0115.coefficient7_132,
  OriginalRow227TriangleData0115.coefficient7_133
]

theorem values0115_size : values0115.size = 32 := rfl

def block0115 : ℕ → Option IntervalDyadic := segment 102 values0115

theorem block0115_domain : ExactDomain block0115 102 134 := by
  simpa only [values0115_size] using segment_domain 102 values0115

theorem block0115_get (i : Fin 32) :
    block0115 (102 + i.val) = some (values0115[i.val]'(by rw [values0115_size]; exact i.isLt)) := by
  exact segment_get 102 values0115 ⟨i.val, by rw [values0115_size]; exact i.isLt⟩

def values0116 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0116.coefficient7_134,
  OriginalRow227TriangleData0116.coefficient7_135,
  OriginalRow227TriangleData0116.coefficient7_136,
  OriginalRow227TriangleData0116.coefficient7_137,
  OriginalRow227TriangleData0116.coefficient7_138,
  OriginalRow227TriangleData0116.coefficient7_139,
  OriginalRow227TriangleData0116.coefficient7_140,
  OriginalRow227TriangleData0116.coefficient7_141,
  OriginalRow227TriangleData0116.coefficient7_142,
  OriginalRow227TriangleData0116.coefficient7_143,
  OriginalRow227TriangleData0116.coefficient7_144,
  OriginalRow227TriangleData0116.coefficient7_145,
  OriginalRow227TriangleData0116.coefficient7_146,
  OriginalRow227TriangleData0116.coefficient7_147,
  OriginalRow227TriangleData0116.coefficient7_148,
  OriginalRow227TriangleData0116.coefficient7_149,
  OriginalRow227TriangleData0116.coefficient7_150,
  OriginalRow227TriangleData0116.coefficient7_151,
  OriginalRow227TriangleData0116.coefficient7_152,
  OriginalRow227TriangleData0116.coefficient7_153,
  OriginalRow227TriangleData0116.coefficient7_154,
  OriginalRow227TriangleData0116.coefficient7_155,
  OriginalRow227TriangleData0116.coefficient7_156,
  OriginalRow227TriangleData0116.coefficient7_157,
  OriginalRow227TriangleData0116.coefficient7_158,
  OriginalRow227TriangleData0116.coefficient7_159,
  OriginalRow227TriangleData0116.coefficient7_160,
  OriginalRow227TriangleData0116.coefficient7_161,
  OriginalRow227TriangleData0116.coefficient7_162,
  OriginalRow227TriangleData0116.coefficient7_163,
  OriginalRow227TriangleData0116.coefficient7_164,
  OriginalRow227TriangleData0116.coefficient7_165
]

theorem values0116_size : values0116.size = 32 := rfl

def block0116 : ℕ → Option IntervalDyadic := segment 134 values0116

theorem block0116_domain : ExactDomain block0116 134 166 := by
  simpa only [values0116_size] using segment_domain 134 values0116

theorem block0116_get (i : Fin 32) :
    block0116 (134 + i.val) = some (values0116[i.val]'(by rw [values0116_size]; exact i.isLt)) := by
  exact segment_get 134 values0116 ⟨i.val, by rw [values0116_size]; exact i.isLt⟩

def values0117 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0117.coefficient7_166,
  OriginalRow227TriangleData0117.coefficient7_167,
  OriginalRow227TriangleData0117.coefficient7_168,
  OriginalRow227TriangleData0117.coefficient7_169,
  OriginalRow227TriangleData0117.coefficient7_170,
  OriginalRow227TriangleData0117.coefficient7_171,
  OriginalRow227TriangleData0117.coefficient7_172,
  OriginalRow227TriangleData0117.coefficient7_173,
  OriginalRow227TriangleData0117.coefficient7_174,
  OriginalRow227TriangleData0117.coefficient7_175,
  OriginalRow227TriangleData0117.coefficient7_176,
  OriginalRow227TriangleData0117.coefficient7_177,
  OriginalRow227TriangleData0117.coefficient7_178,
  OriginalRow227TriangleData0117.coefficient7_179,
  OriginalRow227TriangleData0117.coefficient7_180,
  OriginalRow227TriangleData0117.coefficient7_181,
  OriginalRow227TriangleData0117.coefficient7_182,
  OriginalRow227TriangleData0117.coefficient7_183,
  OriginalRow227TriangleData0117.coefficient7_184,
  OriginalRow227TriangleData0117.coefficient7_185,
  OriginalRow227TriangleData0117.coefficient7_186,
  OriginalRow227TriangleData0117.coefficient7_187,
  OriginalRow227TriangleData0117.coefficient7_188,
  OriginalRow227TriangleData0117.coefficient7_189,
  OriginalRow227TriangleData0117.coefficient7_190,
  OriginalRow227TriangleData0117.coefficient7_191,
  OriginalRow227TriangleData0117.coefficient7_192,
  OriginalRow227TriangleData0117.coefficient7_193,
  OriginalRow227TriangleData0117.coefficient7_194,
  OriginalRow227TriangleData0117.coefficient7_195,
  OriginalRow227TriangleData0117.coefficient7_196,
  OriginalRow227TriangleData0117.coefficient7_197
]

theorem values0117_size : values0117.size = 32 := rfl

def block0117 : ℕ → Option IntervalDyadic := segment 166 values0117

theorem block0117_domain : ExactDomain block0117 166 198 := by
  simpa only [values0117_size] using segment_domain 166 values0117

theorem block0117_get (i : Fin 32) :
    block0117 (166 + i.val) = some (values0117[i.val]'(by rw [values0117_size]; exact i.isLt)) := by
  exact segment_get 166 values0117 ⟨i.val, by rw [values0117_size]; exact i.isLt⟩

def values0118 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0118.coefficient7_198,
  OriginalRow227TriangleData0118.coefficient7_199,
  OriginalRow227TriangleData0118.coefficient7_200,
  OriginalRow227TriangleData0118.coefficient7_201,
  OriginalRow227TriangleData0118.coefficient7_202,
  OriginalRow227TriangleData0118.coefficient7_203,
  OriginalRow227TriangleData0118.coefficient7_204,
  OriginalRow227TriangleData0118.coefficient7_205,
  OriginalRow227TriangleData0118.coefficient7_206,
  OriginalRow227TriangleData0118.coefficient7_207,
  OriginalRow227TriangleData0118.coefficient7_208,
  OriginalRow227TriangleData0118.coefficient7_209,
  OriginalRow227TriangleData0118.coefficient7_210,
  OriginalRow227TriangleData0118.coefficient7_211,
  OriginalRow227TriangleData0118.coefficient7_212,
  OriginalRow227TriangleData0118.coefficient7_213,
  OriginalRow227TriangleData0118.coefficient7_214,
  OriginalRow227TriangleData0118.coefficient7_215,
  OriginalRow227TriangleData0118.coefficient7_216,
  OriginalRow227TriangleData0118.coefficient7_217,
  OriginalRow227TriangleData0118.coefficient7_218,
  OriginalRow227TriangleData0118.coefficient7_219,
  OriginalRow227TriangleData0118.coefficient7_220,
  OriginalRow227TriangleData0118.coefficient7_221,
  OriginalRow227TriangleData0118.coefficient7_222,
  OriginalRow227TriangleData0118.coefficient7_223,
  OriginalRow227TriangleData0118.coefficient7_224,
  OriginalRow227TriangleData0118.coefficient7_225,
  OriginalRow227TriangleData0118.coefficient7_226,
  OriginalRow227TriangleData0118.coefficient7_227,
  OriginalRow227TriangleData0118.coefficient7_228,
  OriginalRow227TriangleData0118.coefficient7_229
]

theorem values0118_size : values0118.size = 32 := rfl

def block0118 : ℕ → Option IntervalDyadic := segment 198 values0118

theorem block0118_domain : ExactDomain block0118 198 230 := by
  simpa only [values0118_size] using segment_domain 198 values0118

theorem block0118_get (i : Fin 32) :
    block0118 (198 + i.val) = some (values0118[i.val]'(by rw [values0118_size]; exact i.isLt)) := by
  exact segment_get 198 values0118 ⟨i.val, by rw [values0118_size]; exact i.isLt⟩

def values0119 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0119.coefficient7_230,
  OriginalRow227TriangleData0119.coefficient7_231,
  OriginalRow227TriangleData0119.coefficient7_232,
  OriginalRow227TriangleData0119.coefficient7_233,
  OriginalRow227TriangleData0119.coefficient7_234,
  OriginalRow227TriangleData0119.coefficient7_235,
  OriginalRow227TriangleData0119.coefficient7_236,
  OriginalRow227TriangleData0119.coefficient7_237,
  OriginalRow227TriangleData0119.coefficient7_238,
  OriginalRow227TriangleData0119.coefficient7_239,
  OriginalRow227TriangleData0119.coefficient7_240,
  OriginalRow227TriangleData0119.coefficient7_241,
  OriginalRow227TriangleData0119.coefficient7_242,
  OriginalRow227TriangleData0119.coefficient7_243,
  OriginalRow227TriangleData0119.coefficient7_244,
  OriginalRow227TriangleData0119.coefficient7_245,
  OriginalRow227TriangleData0119.coefficient7_246,
  OriginalRow227TriangleData0119.coefficient7_247,
  OriginalRow227TriangleData0119.coefficient7_248,
  OriginalRow227TriangleData0119.coefficient7_249,
  OriginalRow227TriangleData0119.coefficient7_250,
  OriginalRow227TriangleData0119.coefficient7_251,
  OriginalRow227TriangleData0119.coefficient7_252,
  OriginalRow227TriangleData0119.coefficient7_253,
  OriginalRow227TriangleData0119.coefficient7_254,
  OriginalRow227TriangleData0119.coefficient7_255,
  OriginalRow227TriangleData0119.coefficient7_256,
  OriginalRow227TriangleData0119.coefficient7_257,
  OriginalRow227TriangleData0119.coefficient7_258,
  OriginalRow227TriangleData0119.coefficient7_259,
  OriginalRow227TriangleData0119.coefficient7_260,
  OriginalRow227TriangleData0119.coefficient7_261
]

theorem values0119_size : values0119.size = 32 := rfl

def block0119 : ℕ → Option IntervalDyadic := segment 230 values0119

theorem block0119_domain : ExactDomain block0119 230 262 := by
  simpa only [values0119_size] using segment_domain 230 values0119

theorem block0119_get (i : Fin 32) :
    block0119 (230 + i.val) = some (values0119[i.val]'(by rw [values0119_size]; exact i.isLt)) := by
  exact segment_get 230 values0119 ⟨i.val, by rw [values0119_size]; exact i.isLt⟩

def values0120 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0120.coefficient7_262,
  OriginalRow227TriangleData0120.coefficient7_263,
  OriginalRow227TriangleData0120.coefficient7_264,
  OriginalRow227TriangleData0120.coefficient7_265,
  OriginalRow227TriangleData0120.coefficient7_266,
  OriginalRow227TriangleData0120.coefficient7_267,
  OriginalRow227TriangleData0120.coefficient7_268,
  OriginalRow227TriangleData0120.coefficient7_269,
  OriginalRow227TriangleData0120.coefficient7_270,
  OriginalRow227TriangleData0120.coefficient7_271,
  OriginalRow227TriangleData0120.coefficient7_272,
  OriginalRow227TriangleData0120.coefficient7_273,
  OriginalRow227TriangleData0120.coefficient7_274,
  OriginalRow227TriangleData0120.coefficient7_275,
  OriginalRow227TriangleData0120.coefficient7_276,
  OriginalRow227TriangleData0120.coefficient7_277,
  OriginalRow227TriangleData0120.coefficient7_278,
  OriginalRow227TriangleData0120.coefficient7_279,
  OriginalRow227TriangleData0120.coefficient7_280,
  OriginalRow227TriangleData0120.coefficient7_281,
  OriginalRow227TriangleData0120.coefficient7_282,
  OriginalRow227TriangleData0120.coefficient7_283,
  OriginalRow227TriangleData0120.coefficient7_284,
  OriginalRow227TriangleData0120.coefficient7_285,
  OriginalRow227TriangleData0120.coefficient7_286,
  OriginalRow227TriangleData0120.coefficient7_287,
  OriginalRow227TriangleData0120.coefficient7_288,
  OriginalRow227TriangleData0120.coefficient7_289,
  OriginalRow227TriangleData0120.coefficient7_290,
  OriginalRow227TriangleData0120.coefficient7_291,
  OriginalRow227TriangleData0120.coefficient7_292,
  OriginalRow227TriangleData0120.coefficient7_293
]

theorem values0120_size : values0120.size = 32 := rfl

def block0120 : ℕ → Option IntervalDyadic := segment 262 values0120

theorem block0120_domain : ExactDomain block0120 262 294 := by
  simpa only [values0120_size] using segment_domain 262 values0120

theorem block0120_get (i : Fin 32) :
    block0120 (262 + i.val) = some (values0120[i.val]'(by rw [values0120_size]; exact i.isLt)) := by
  exact segment_get 262 values0120 ⟨i.val, by rw [values0120_size]; exact i.isLt⟩

def values0121 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0121.coefficient7_294,
  OriginalRow227TriangleData0121.coefficient7_295,
  OriginalRow227TriangleData0121.coefficient7_296,
  OriginalRow227TriangleData0121.coefficient7_297,
  OriginalRow227TriangleData0121.coefficient7_298,
  OriginalRow227TriangleData0121.coefficient7_299,
  OriginalRow227TriangleData0121.coefficient7_300,
  OriginalRow227TriangleData0121.coefficient7_301,
  OriginalRow227TriangleData0121.coefficient7_302,
  OriginalRow227TriangleData0121.coefficient7_303,
  OriginalRow227TriangleData0121.coefficient7_304,
  OriginalRow227TriangleData0121.coefficient7_305,
  OriginalRow227TriangleData0121.coefficient7_306,
  OriginalRow227TriangleData0121.coefficient7_307,
  OriginalRow227TriangleData0121.coefficient7_308,
  OriginalRow227TriangleData0121.coefficient7_309,
  OriginalRow227TriangleData0121.coefficient7_310,
  OriginalRow227TriangleData0121.coefficient7_311,
  OriginalRow227TriangleData0121.coefficient7_312,
  OriginalRow227TriangleData0121.coefficient7_313,
  OriginalRow227TriangleData0121.coefficient7_314,
  OriginalRow227TriangleData0121.coefficient7_315,
  OriginalRow227TriangleData0121.coefficient7_316,
  OriginalRow227TriangleData0121.coefficient7_317,
  OriginalRow227TriangleData0121.coefficient7_318,
  OriginalRow227TriangleData0121.coefficient7_319,
  OriginalRow227TriangleData0121.coefficient7_320,
  OriginalRow227TriangleData0121.coefficient7_321,
  OriginalRow227TriangleData0121.coefficient7_322,
  OriginalRow227TriangleData0121.coefficient7_323,
  OriginalRow227TriangleData0121.coefficient7_324,
  OriginalRow227TriangleData0121.coefficient7_325
]

theorem values0121_size : values0121.size = 32 := rfl

def block0121 : ℕ → Option IntervalDyadic := segment 294 values0121

theorem block0121_domain : ExactDomain block0121 294 326 := by
  simpa only [values0121_size] using segment_domain 294 values0121

theorem block0121_get (i : Fin 32) :
    block0121 (294 + i.val) = some (values0121[i.val]'(by rw [values0121_size]; exact i.isLt)) := by
  exact segment_get 294 values0121 ⟨i.val, by rw [values0121_size]; exact i.isLt⟩

def values0122 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0122.coefficient7_326,
  OriginalRow227TriangleData0122.coefficient7_327,
  OriginalRow227TriangleData0122.coefficient7_328,
  OriginalRow227TriangleData0122.coefficient7_329,
  OriginalRow227TriangleData0122.coefficient7_330,
  OriginalRow227TriangleData0122.coefficient7_331,
  OriginalRow227TriangleData0122.coefficient7_332,
  OriginalRow227TriangleData0122.coefficient7_333,
  OriginalRow227TriangleData0122.coefficient7_334,
  OriginalRow227TriangleData0122.coefficient7_335,
  OriginalRow227TriangleData0122.coefficient7_336,
  OriginalRow227TriangleData0122.coefficient7_337,
  OriginalRow227TriangleData0122.coefficient7_338,
  OriginalRow227TriangleData0122.coefficient7_339,
  OriginalRow227TriangleData0122.coefficient7_340,
  OriginalRow227TriangleData0122.coefficient7_341,
  OriginalRow227TriangleData0122.coefficient7_342,
  OriginalRow227TriangleData0122.coefficient7_343,
  OriginalRow227TriangleData0122.coefficient7_344,
  OriginalRow227TriangleData0122.coefficient7_345,
  OriginalRow227TriangleData0122.coefficient7_346,
  OriginalRow227TriangleData0122.coefficient7_347,
  OriginalRow227TriangleData0122.coefficient7_348,
  OriginalRow227TriangleData0122.coefficient7_349,
  OriginalRow227TriangleData0122.coefficient7_350,
  OriginalRow227TriangleData0122.coefficient7_351,
  OriginalRow227TriangleData0122.coefficient7_352,
  OriginalRow227TriangleData0122.coefficient7_353,
  OriginalRow227TriangleData0122.coefficient7_354,
  OriginalRow227TriangleData0122.coefficient7_355,
  OriginalRow227TriangleData0122.coefficient7_356,
  OriginalRow227TriangleData0122.coefficient7_357
]

theorem values0122_size : values0122.size = 32 := rfl

def block0122 : ℕ → Option IntervalDyadic := segment 326 values0122

theorem block0122_domain : ExactDomain block0122 326 358 := by
  simpa only [values0122_size] using segment_domain 326 values0122

theorem block0122_get (i : Fin 32) :
    block0122 (326 + i.val) = some (values0122[i.val]'(by rw [values0122_size]; exact i.isLt)) := by
  exact segment_get 326 values0122 ⟨i.val, by rw [values0122_size]; exact i.isLt⟩

def values0123 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0123.coefficient7_358,
  OriginalRow227TriangleData0123.coefficient7_359,
  OriginalRow227TriangleData0123.coefficient7_360,
  OriginalRow227TriangleData0123.coefficient7_361,
  OriginalRow227TriangleData0123.coefficient7_362,
  OriginalRow227TriangleData0123.coefficient7_363,
  OriginalRow227TriangleData0123.coefficient7_364,
  OriginalRow227TriangleData0123.coefficient7_365,
  OriginalRow227TriangleData0123.coefficient7_366,
  OriginalRow227TriangleData0123.coefficient7_367,
  OriginalRow227TriangleData0123.coefficient7_368,
  OriginalRow227TriangleData0123.coefficient7_369,
  OriginalRow227TriangleData0123.coefficient7_370,
  OriginalRow227TriangleData0123.coefficient7_371,
  OriginalRow227TriangleData0123.coefficient7_372,
  OriginalRow227TriangleData0123.coefficient7_373,
  OriginalRow227TriangleData0123.coefficient7_374,
  OriginalRow227TriangleData0123.coefficient7_375,
  OriginalRow227TriangleData0123.coefficient7_376,
  OriginalRow227TriangleData0123.coefficient7_377,
  OriginalRow227TriangleData0123.coefficient7_378,
  OriginalRow227TriangleData0123.coefficient7_379,
  OriginalRow227TriangleData0123.coefficient7_380,
  OriginalRow227TriangleData0123.coefficient7_381,
  OriginalRow227TriangleData0123.coefficient7_382,
  OriginalRow227TriangleData0123.coefficient7_383,
  OriginalRow227TriangleData0123.coefficient7_384,
  OriginalRow227TriangleData0123.coefficient7_385,
  OriginalRow227TriangleData0123.coefficient7_386,
  OriginalRow227TriangleData0123.coefficient7_387,
  OriginalRow227TriangleData0123.coefficient7_388,
  OriginalRow227TriangleData0123.coefficient7_389
]

theorem values0123_size : values0123.size = 32 := rfl

def block0123 : ℕ → Option IntervalDyadic := segment 358 values0123

theorem block0123_domain : ExactDomain block0123 358 390 := by
  simpa only [values0123_size] using segment_domain 358 values0123

theorem block0123_get (i : Fin 32) :
    block0123 (358 + i.val) = some (values0123[i.val]'(by rw [values0123_size]; exact i.isLt)) := by
  exact segment_get 358 values0123 ⟨i.val, by rw [values0123_size]; exact i.isLt⟩

def values0124 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0124.coefficient7_390,
  OriginalRow227TriangleData0124.coefficient7_391,
  OriginalRow227TriangleData0124.coefficient7_392,
  OriginalRow227TriangleData0124.coefficient7_393,
  OriginalRow227TriangleData0124.coefficient7_394,
  OriginalRow227TriangleData0124.coefficient7_395,
  OriginalRow227TriangleData0124.coefficient7_396,
  OriginalRow227TriangleData0124.coefficient7_397,
  OriginalRow227TriangleData0124.coefficient7_398,
  OriginalRow227TriangleData0124.coefficient7_399,
  OriginalRow227TriangleData0124.coefficient7_400,
  OriginalRow227TriangleData0124.coefficient7_401,
  OriginalRow227TriangleData0124.coefficient7_402,
  OriginalRow227TriangleData0124.coefficient7_403,
  OriginalRow227TriangleData0124.coefficient7_404,
  OriginalRow227TriangleData0124.coefficient7_405,
  OriginalRow227TriangleData0124.coefficient7_406,
  OriginalRow227TriangleData0124.coefficient7_407,
  OriginalRow227TriangleData0124.coefficient7_408,
  OriginalRow227TriangleData0124.coefficient7_409,
  OriginalRow227TriangleData0124.coefficient7_410,
  OriginalRow227TriangleData0124.coefficient7_411,
  OriginalRow227TriangleData0124.coefficient7_412,
  OriginalRow227TriangleData0124.coefficient7_413,
  OriginalRow227TriangleData0124.coefficient7_414,
  OriginalRow227TriangleData0124.coefficient7_415,
  OriginalRow227TriangleData0124.coefficient7_416,
  OriginalRow227TriangleData0124.coefficient7_417,
  OriginalRow227TriangleData0124.coefficient7_418,
  OriginalRow227TriangleData0124.coefficient7_419,
  OriginalRow227TriangleData0124.coefficient7_420,
  OriginalRow227TriangleData0124.coefficient7_421
]

theorem values0124_size : values0124.size = 32 := rfl

def block0124 : ℕ → Option IntervalDyadic := segment 390 values0124

theorem block0124_domain : ExactDomain block0124 390 422 := by
  simpa only [values0124_size] using segment_domain 390 values0124

theorem block0124_get (i : Fin 32) :
    block0124 (390 + i.val) = some (values0124[i.val]'(by rw [values0124_size]; exact i.isLt)) := by
  exact segment_get 390 values0124 ⟨i.val, by rw [values0124_size]; exact i.isLt⟩

def values0125 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0125.coefficient7_422,
  OriginalRow227TriangleData0125.coefficient7_423,
  OriginalRow227TriangleData0125.coefficient7_424,
  OriginalRow227TriangleData0125.coefficient7_425,
  OriginalRow227TriangleData0125.coefficient7_426,
  OriginalRow227TriangleData0125.coefficient7_427,
  OriginalRow227TriangleData0125.coefficient7_428,
  OriginalRow227TriangleData0125.coefficient7_429,
  OriginalRow227TriangleData0125.coefficient7_430,
  OriginalRow227TriangleData0125.coefficient7_431,
  OriginalRow227TriangleData0125.coefficient7_432,
  OriginalRow227TriangleData0125.coefficient7_433,
  OriginalRow227TriangleData0125.coefficient7_434,
  OriginalRow227TriangleData0125.coefficient7_435,
  OriginalRow227TriangleData0125.coefficient7_436,
  OriginalRow227TriangleData0125.coefficient7_437,
  OriginalRow227TriangleData0125.coefficient7_438,
  OriginalRow227TriangleData0125.coefficient7_439,
  OriginalRow227TriangleData0125.coefficient7_440,
  OriginalRow227TriangleData0125.coefficient7_441,
  OriginalRow227TriangleData0125.coefficient7_442,
  OriginalRow227TriangleData0125.coefficient7_443,
  OriginalRow227TriangleData0125.coefficient7_444,
  OriginalRow227TriangleData0125.coefficient7_445,
  OriginalRow227TriangleData0125.coefficient7_446,
  OriginalRow227TriangleData0125.coefficient7_447,
  OriginalRow227TriangleData0125.coefficient7_448,
  OriginalRow227TriangleData0125.coefficient7_449,
  OriginalRow227TriangleData0125.coefficient7_450,
  OriginalRow227TriangleData0125.coefficient7_451,
  OriginalRow227TriangleData0125.coefficient7_452,
  OriginalRow227TriangleData0125.coefficient7_453
]

theorem values0125_size : values0125.size = 32 := rfl

def block0125 : ℕ → Option IntervalDyadic := segment 422 values0125

theorem block0125_domain : ExactDomain block0125 422 454 := by
  simpa only [values0125_size] using segment_domain 422 values0125

theorem block0125_get (i : Fin 32) :
    block0125 (422 + i.val) = some (values0125[i.val]'(by rw [values0125_size]; exact i.isLt)) := by
  exact segment_get 422 values0125 ⟨i.val, by rw [values0125_size]; exact i.isLt⟩

def values0126 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0126.coefficient7_454,
  OriginalRow227TriangleData0126.coefficient7_455,
  OriginalRow227TriangleData0126.coefficient7_456,
  OriginalRow227TriangleData0126.coefficient7_457,
  OriginalRow227TriangleData0126.coefficient7_458,
  OriginalRow227TriangleData0126.coefficient7_459,
  OriginalRow227TriangleData0126.coefficient7_460,
  OriginalRow227TriangleData0126.coefficient7_461,
  OriginalRow227TriangleData0126.coefficient7_462,
  OriginalRow227TriangleData0126.coefficient7_463,
  OriginalRow227TriangleData0126.coefficient7_464,
  OriginalRow227TriangleData0126.coefficient7_465,
  OriginalRow227TriangleData0126.coefficient7_466,
  OriginalRow227TriangleData0126.coefficient7_467,
  OriginalRow227TriangleData0126.coefficient7_468,
  OriginalRow227TriangleData0126.coefficient7_469,
  OriginalRow227TriangleData0126.coefficient7_470,
  OriginalRow227TriangleData0126.coefficient7_471,
  OriginalRow227TriangleData0126.coefficient7_472,
  OriginalRow227TriangleData0126.coefficient7_473,
  OriginalRow227TriangleData0126.coefficient7_474,
  OriginalRow227TriangleData0126.coefficient7_475,
  OriginalRow227TriangleData0126.coefficient7_476,
  OriginalRow227TriangleData0126.coefficient7_477,
  OriginalRow227TriangleData0126.coefficient7_478,
  OriginalRow227TriangleData0126.coefficient7_479,
  OriginalRow227TriangleData0126.coefficient7_480,
  OriginalRow227TriangleData0126.coefficient7_481,
  OriginalRow227TriangleData0126.coefficient7_482,
  OriginalRow227TriangleData0126.coefficient7_483,
  OriginalRow227TriangleData0126.coefficient7_484,
  OriginalRow227TriangleData0126.coefficient7_485
]

theorem values0126_size : values0126.size = 32 := rfl

def block0126 : ℕ → Option IntervalDyadic := segment 454 values0126

theorem block0126_domain : ExactDomain block0126 454 486 := by
  simpa only [values0126_size] using segment_domain 454 values0126

theorem block0126_get (i : Fin 32) :
    block0126 (454 + i.val) = some (values0126[i.val]'(by rw [values0126_size]; exact i.isLt)) := by
  exact segment_get 454 values0126 ⟨i.val, by rw [values0126_size]; exact i.isLt⟩

def values0127 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0127.coefficient7_486,
  OriginalRow227TriangleData0127.coefficient7_487,
  OriginalRow227TriangleData0127.coefficient7_488,
  OriginalRow227TriangleData0127.coefficient7_489,
  OriginalRow227TriangleData0127.coefficient7_490,
  OriginalRow227TriangleData0127.coefficient7_491,
  OriginalRow227TriangleData0127.coefficient7_492,
  OriginalRow227TriangleData0127.coefficient7_493,
  OriginalRow227TriangleData0127.coefficient7_494
]

theorem values0127_size : values0127.size = 9 := rfl

def block0127 : ℕ → Option IntervalDyadic := segment 486 values0127

theorem block0127_domain : ExactDomain block0127 486 495 := by
  simpa only [values0127_size] using segment_domain 486 values0127

theorem block0127_get (i : Fin 9) :
    block0127 (486 + i.val) = some (values0127[i.val]'(by rw [values0127_size]; exact i.isLt)) := by
  exact segment_get 486 values0127 ⟨i.val, by rw [values0127_size]; exact i.isLt⟩

def node0006_0070 : ℕ → Option IntervalDyadic := split 38 block0112 block0113

theorem node0006_0070_domain : ExactDomain node0006_0070 6 70 := by
  exact split_domain (by decide) (by decide) block0112_domain block0113_domain

def node0070_0134 : ℕ → Option IntervalDyadic := split 102 block0114 block0115

theorem node0070_0134_domain : ExactDomain node0070_0134 70 134 := by
  exact split_domain (by decide) (by decide) block0114_domain block0115_domain

def node0006_0134 : ℕ → Option IntervalDyadic := split 70 node0006_0070 node0070_0134

theorem node0006_0134_domain : ExactDomain node0006_0134 6 134 := by
  exact split_domain (by decide) (by decide) node0006_0070_domain node0070_0134_domain

def node0134_0198 : ℕ → Option IntervalDyadic := split 166 block0116 block0117

theorem node0134_0198_domain : ExactDomain node0134_0198 134 198 := by
  exact split_domain (by decide) (by decide) block0116_domain block0117_domain

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block0118 block0119

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block0118_domain block0119_domain

def node0134_0262 : ℕ → Option IntervalDyadic := split 198 node0134_0198 node0198_0262

theorem node0134_0262_domain : ExactDomain node0134_0262 134 262 := by
  exact split_domain (by decide) (by decide) node0134_0198_domain node0198_0262_domain

def node0006_0262 : ℕ → Option IntervalDyadic := split 134 node0006_0134 node0134_0262

theorem node0006_0262_domain : ExactDomain node0006_0262 6 262 := by
  exact split_domain (by decide) (by decide) node0006_0134_domain node0134_0262_domain

def node0262_0326 : ℕ → Option IntervalDyadic := split 294 block0120 block0121

theorem node0262_0326_domain : ExactDomain node0262_0326 262 326 := by
  exact split_domain (by decide) (by decide) block0120_domain block0121_domain

def node0326_0390 : ℕ → Option IntervalDyadic := split 358 block0122 block0123

theorem node0326_0390_domain : ExactDomain node0326_0390 326 390 := by
  exact split_domain (by decide) (by decide) block0122_domain block0123_domain

def node0262_0390 : ℕ → Option IntervalDyadic := split 326 node0262_0326 node0326_0390

theorem node0262_0390_domain : ExactDomain node0262_0390 262 390 := by
  exact split_domain (by decide) (by decide) node0262_0326_domain node0326_0390_domain

def node0390_0454 : ℕ → Option IntervalDyadic := split 422 block0124 block0125

theorem node0390_0454_domain : ExactDomain node0390_0454 390 454 := by
  exact split_domain (by decide) (by decide) block0124_domain block0125_domain

def node0454_0495 : ℕ → Option IntervalDyadic := split 486 block0126 block0127

theorem node0454_0495_domain : ExactDomain node0454_0495 454 495 := by
  exact split_domain (by decide) (by decide) block0126_domain block0127_domain

def node0390_0495 : ℕ → Option IntervalDyadic := split 454 node0390_0454 node0454_0495

theorem node0390_0495_domain : ExactDomain node0390_0495 390 495 := by
  exact split_domain (by decide) (by decide) node0390_0454_domain node0454_0495_domain

def node0262_0495 : ℕ → Option IntervalDyadic := split 390 node0262_0390 node0390_0495

theorem node0262_0495_domain : ExactDomain node0262_0495 262 495 := by
  exact split_domain (by decide) (by decide) node0262_0390_domain node0390_0495_domain

def node0006_0495 : ℕ → Option IntervalDyadic := split 262 node0006_0262 node0262_0495

theorem node0006_0495_domain : ExactDomain node0006_0495 6 495 := by
  exact split_domain (by decide) (by decide) node0006_0262_domain node0262_0495_domain

def lookup : ℕ → Option IntervalDyadic := node0006_0495

theorem lookup_domain : ExactDomain lookup 6 495 :=
  node0006_0495_domain

theorem block0112_lookup (i : Fin 32) :
    lookup (6 + i.val) = some (values0112[i.val]'(by rw [values0112_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (6 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_left 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0006_0134, split_left 70 node0006_0070 node0070_0134 (by omega)]
  rw [node0006_0070, split_left 38 block0112 block0113 (by omega)]
  exact block0112_get i

theorem block0113_lookup (i : Fin 32) :
    lookup (38 + i.val) = some (values0113[i.val]'(by rw [values0113_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (38 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_left 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0006_0134, split_left 70 node0006_0070 node0070_0134 (by omega)]
  rw [node0006_0070, split_right 38 block0112 block0113 (by omega)]
  exact block0113_get i

theorem block0114_lookup (i : Fin 32) :
    lookup (70 + i.val) = some (values0114[i.val]'(by rw [values0114_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (70 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_left 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0006_0134, split_right 70 node0006_0070 node0070_0134 (by omega)]
  rw [node0070_0134, split_left 102 block0114 block0115 (by omega)]
  exact block0114_get i

theorem block0115_lookup (i : Fin 32) :
    lookup (102 + i.val) = some (values0115[i.val]'(by rw [values0115_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (102 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_left 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0006_0134, split_right 70 node0006_0070 node0070_0134 (by omega)]
  rw [node0070_0134, split_right 102 block0114 block0115 (by omega)]
  exact block0115_get i

theorem block0116_lookup (i : Fin 32) :
    lookup (134 + i.val) = some (values0116[i.val]'(by rw [values0116_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (134 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_right 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_left 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0134_0198, split_left 166 block0116 block0117 (by omega)]
  exact block0116_get i

theorem block0117_lookup (i : Fin 32) :
    lookup (166 + i.val) = some (values0117[i.val]'(by rw [values0117_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (166 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_right 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_left 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0134_0198, split_right 166 block0116 block0117 (by omega)]
  exact block0117_get i

theorem block0118_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values0118[i.val]'(by rw [values0118_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (198 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_right 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_right 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0198_0262, split_left 230 block0118 block0119 (by omega)]
  exact block0118_get i

theorem block0119_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values0119[i.val]'(by rw [values0119_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (230 + i.val) = _
  rw [node0006_0495, split_left 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0006_0262, split_right 134 node0006_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_right 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0198_0262, split_right 230 block0118 block0119 (by omega)]
  exact block0119_get i

theorem block0120_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values0120[i.val]'(by rw [values0120_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (262 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_left 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0262_0390, split_left 326 node0262_0326 node0326_0390 (by omega)]
  rw [node0262_0326, split_left 294 block0120 block0121 (by omega)]
  exact block0120_get i

theorem block0121_lookup (i : Fin 32) :
    lookup (294 + i.val) = some (values0121[i.val]'(by rw [values0121_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (294 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_left 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0262_0390, split_left 326 node0262_0326 node0326_0390 (by omega)]
  rw [node0262_0326, split_right 294 block0120 block0121 (by omega)]
  exact block0121_get i

theorem block0122_lookup (i : Fin 32) :
    lookup (326 + i.val) = some (values0122[i.val]'(by rw [values0122_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (326 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_left 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0262_0390, split_right 326 node0262_0326 node0326_0390 (by omega)]
  rw [node0326_0390, split_left 358 block0122 block0123 (by omega)]
  exact block0122_get i

theorem block0123_lookup (i : Fin 32) :
    lookup (358 + i.val) = some (values0123[i.val]'(by rw [values0123_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (358 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_left 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0262_0390, split_right 326 node0262_0326 node0326_0390 (by omega)]
  rw [node0326_0390, split_right 358 block0122 block0123 (by omega)]
  exact block0123_get i

theorem block0124_lookup (i : Fin 32) :
    lookup (390 + i.val) = some (values0124[i.val]'(by rw [values0124_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (390 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_right 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0390_0495, split_left 454 node0390_0454 node0454_0495 (by omega)]
  rw [node0390_0454, split_left 422 block0124 block0125 (by omega)]
  exact block0124_get i

theorem block0125_lookup (i : Fin 32) :
    lookup (422 + i.val) = some (values0125[i.val]'(by rw [values0125_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (422 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_right 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0390_0495, split_left 454 node0390_0454 node0454_0495 (by omega)]
  rw [node0390_0454, split_right 422 block0124 block0125 (by omega)]
  exact block0125_get i

theorem block0126_lookup (i : Fin 32) :
    lookup (454 + i.val) = some (values0126[i.val]'(by rw [values0126_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (454 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_right 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0390_0495, split_right 454 node0390_0454 node0454_0495 (by omega)]
  rw [node0454_0495, split_left 486 block0126 block0127 (by omega)]
  exact block0126_get i

theorem block0127_lookup (i : Fin 9) :
    lookup (486 + i.val) = some (values0127[i.val]'(by rw [values0127_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0006_0495 (486 + i.val) = _
  rw [node0006_0495, split_right 262 node0006_0262 node0262_0495 (by omega)]
  rw [node0262_0495, split_right 390 node0262_0390 node0390_0495 (by omega)]
  rw [node0390_0495, split_right 454 node0390_0454 node0454_0495 (by omega)]
  rw [node0454_0495, split_right 486 block0126 block0127 (by omega)]
  exact block0127_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0112_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0112_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0113_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0113_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0114_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0114_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0115_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0115_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0116_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0116_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0117_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0117_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0118_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0118_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0119_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0119_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0120_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0120_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0121_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0121_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0122_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0122_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0123_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0123_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0124_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0124_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0125_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0125_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0126_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0126_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0127_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0127_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0112_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0113_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0114_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0115_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0116_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0117_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0118_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0119_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0120_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0121_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0122_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0123_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0124_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0125_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0126_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow007.block0127_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow007
