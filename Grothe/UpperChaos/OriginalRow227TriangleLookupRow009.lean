import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0144
import Grothe.UpperChaos.OriginalRow227TriangleData0145
import Grothe.UpperChaos.OriginalRow227TriangleData0146
import Grothe.UpperChaos.OriginalRow227TriangleData0147
import Grothe.UpperChaos.OriginalRow227TriangleData0148
import Grothe.UpperChaos.OriginalRow227TriangleData0149
import Grothe.UpperChaos.OriginalRow227TriangleData0150
import Grothe.UpperChaos.OriginalRow227TriangleData0151
import Grothe.UpperChaos.OriginalRow227TriangleData0152
import Grothe.UpperChaos.OriginalRow227TriangleData0153
import Grothe.UpperChaos.OriginalRow227TriangleData0154
import Grothe.UpperChaos.OriginalRow227TriangleData0155
import Grothe.UpperChaos.OriginalRow227TriangleData0156
import Grothe.UpperChaos.OriginalRow227TriangleData0157
import Grothe.UpperChaos.OriginalRow227TriangleData0158
import Grothe.UpperChaos.OriginalRow227TriangleData0159

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow009

open ConditionalTableLookup

def values0144 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0144.coefficient9_8,
  OriginalRow227TriangleData0144.coefficient9_9,
  OriginalRow227TriangleData0144.coefficient9_10,
  OriginalRow227TriangleData0144.coefficient9_11,
  OriginalRow227TriangleData0144.coefficient9_12,
  OriginalRow227TriangleData0144.coefficient9_13,
  OriginalRow227TriangleData0144.coefficient9_14,
  OriginalRow227TriangleData0144.coefficient9_15,
  OriginalRow227TriangleData0144.coefficient9_16,
  OriginalRow227TriangleData0144.coefficient9_17,
  OriginalRow227TriangleData0144.coefficient9_18,
  OriginalRow227TriangleData0144.coefficient9_19,
  OriginalRow227TriangleData0144.coefficient9_20,
  OriginalRow227TriangleData0144.coefficient9_21,
  OriginalRow227TriangleData0144.coefficient9_22,
  OriginalRow227TriangleData0144.coefficient9_23,
  OriginalRow227TriangleData0144.coefficient9_24,
  OriginalRow227TriangleData0144.coefficient9_25,
  OriginalRow227TriangleData0144.coefficient9_26,
  OriginalRow227TriangleData0144.coefficient9_27,
  OriginalRow227TriangleData0144.coefficient9_28,
  OriginalRow227TriangleData0144.coefficient9_29,
  OriginalRow227TriangleData0144.coefficient9_30,
  OriginalRow227TriangleData0144.coefficient9_31,
  OriginalRow227TriangleData0144.coefficient9_32,
  OriginalRow227TriangleData0144.coefficient9_33,
  OriginalRow227TriangleData0144.coefficient9_34,
  OriginalRow227TriangleData0144.coefficient9_35,
  OriginalRow227TriangleData0144.coefficient9_36,
  OriginalRow227TriangleData0144.coefficient9_37,
  OriginalRow227TriangleData0144.coefficient9_38,
  OriginalRow227TriangleData0144.coefficient9_39
]

theorem values0144_size : values0144.size = 32 := rfl

def block0144 : ℕ → Option IntervalDyadic := segment 8 values0144

theorem block0144_domain : ExactDomain block0144 8 40 := by
  simpa only [values0144_size] using segment_domain 8 values0144

theorem block0144_get (i : Fin 32) :
    block0144 (8 + i.val) = some (values0144[i.val]'(by rw [values0144_size]; exact i.isLt)) := by
  exact segment_get 8 values0144 ⟨i.val, by rw [values0144_size]; exact i.isLt⟩

def values0145 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0145.coefficient9_40,
  OriginalRow227TriangleData0145.coefficient9_41,
  OriginalRow227TriangleData0145.coefficient9_42,
  OriginalRow227TriangleData0145.coefficient9_43,
  OriginalRow227TriangleData0145.coefficient9_44,
  OriginalRow227TriangleData0145.coefficient9_45,
  OriginalRow227TriangleData0145.coefficient9_46,
  OriginalRow227TriangleData0145.coefficient9_47,
  OriginalRow227TriangleData0145.coefficient9_48,
  OriginalRow227TriangleData0145.coefficient9_49,
  OriginalRow227TriangleData0145.coefficient9_50,
  OriginalRow227TriangleData0145.coefficient9_51,
  OriginalRow227TriangleData0145.coefficient9_52,
  OriginalRow227TriangleData0145.coefficient9_53,
  OriginalRow227TriangleData0145.coefficient9_54,
  OriginalRow227TriangleData0145.coefficient9_55,
  OriginalRow227TriangleData0145.coefficient9_56,
  OriginalRow227TriangleData0145.coefficient9_57,
  OriginalRow227TriangleData0145.coefficient9_58,
  OriginalRow227TriangleData0145.coefficient9_59,
  OriginalRow227TriangleData0145.coefficient9_60,
  OriginalRow227TriangleData0145.coefficient9_61,
  OriginalRow227TriangleData0145.coefficient9_62,
  OriginalRow227TriangleData0145.coefficient9_63,
  OriginalRow227TriangleData0145.coefficient9_64,
  OriginalRow227TriangleData0145.coefficient9_65,
  OriginalRow227TriangleData0145.coefficient9_66,
  OriginalRow227TriangleData0145.coefficient9_67,
  OriginalRow227TriangleData0145.coefficient9_68,
  OriginalRow227TriangleData0145.coefficient9_69,
  OriginalRow227TriangleData0145.coefficient9_70,
  OriginalRow227TriangleData0145.coefficient9_71
]

theorem values0145_size : values0145.size = 32 := rfl

def block0145 : ℕ → Option IntervalDyadic := segment 40 values0145

theorem block0145_domain : ExactDomain block0145 40 72 := by
  simpa only [values0145_size] using segment_domain 40 values0145

theorem block0145_get (i : Fin 32) :
    block0145 (40 + i.val) = some (values0145[i.val]'(by rw [values0145_size]; exact i.isLt)) := by
  exact segment_get 40 values0145 ⟨i.val, by rw [values0145_size]; exact i.isLt⟩

def values0146 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0146.coefficient9_72,
  OriginalRow227TriangleData0146.coefficient9_73,
  OriginalRow227TriangleData0146.coefficient9_74,
  OriginalRow227TriangleData0146.coefficient9_75,
  OriginalRow227TriangleData0146.coefficient9_76,
  OriginalRow227TriangleData0146.coefficient9_77,
  OriginalRow227TriangleData0146.coefficient9_78,
  OriginalRow227TriangleData0146.coefficient9_79,
  OriginalRow227TriangleData0146.coefficient9_80,
  OriginalRow227TriangleData0146.coefficient9_81,
  OriginalRow227TriangleData0146.coefficient9_82,
  OriginalRow227TriangleData0146.coefficient9_83,
  OriginalRow227TriangleData0146.coefficient9_84,
  OriginalRow227TriangleData0146.coefficient9_85,
  OriginalRow227TriangleData0146.coefficient9_86,
  OriginalRow227TriangleData0146.coefficient9_87,
  OriginalRow227TriangleData0146.coefficient9_88,
  OriginalRow227TriangleData0146.coefficient9_89,
  OriginalRow227TriangleData0146.coefficient9_90,
  OriginalRow227TriangleData0146.coefficient9_91,
  OriginalRow227TriangleData0146.coefficient9_92,
  OriginalRow227TriangleData0146.coefficient9_93,
  OriginalRow227TriangleData0146.coefficient9_94,
  OriginalRow227TriangleData0146.coefficient9_95,
  OriginalRow227TriangleData0146.coefficient9_96,
  OriginalRow227TriangleData0146.coefficient9_97,
  OriginalRow227TriangleData0146.coefficient9_98,
  OriginalRow227TriangleData0146.coefficient9_99,
  OriginalRow227TriangleData0146.coefficient9_100,
  OriginalRow227TriangleData0146.coefficient9_101,
  OriginalRow227TriangleData0146.coefficient9_102,
  OriginalRow227TriangleData0146.coefficient9_103
]

theorem values0146_size : values0146.size = 32 := rfl

def block0146 : ℕ → Option IntervalDyadic := segment 72 values0146

theorem block0146_domain : ExactDomain block0146 72 104 := by
  simpa only [values0146_size] using segment_domain 72 values0146

theorem block0146_get (i : Fin 32) :
    block0146 (72 + i.val) = some (values0146[i.val]'(by rw [values0146_size]; exact i.isLt)) := by
  exact segment_get 72 values0146 ⟨i.val, by rw [values0146_size]; exact i.isLt⟩

def values0147 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0147.coefficient9_104,
  OriginalRow227TriangleData0147.coefficient9_105,
  OriginalRow227TriangleData0147.coefficient9_106,
  OriginalRow227TriangleData0147.coefficient9_107,
  OriginalRow227TriangleData0147.coefficient9_108,
  OriginalRow227TriangleData0147.coefficient9_109,
  OriginalRow227TriangleData0147.coefficient9_110,
  OriginalRow227TriangleData0147.coefficient9_111,
  OriginalRow227TriangleData0147.coefficient9_112,
  OriginalRow227TriangleData0147.coefficient9_113,
  OriginalRow227TriangleData0147.coefficient9_114,
  OriginalRow227TriangleData0147.coefficient9_115,
  OriginalRow227TriangleData0147.coefficient9_116,
  OriginalRow227TriangleData0147.coefficient9_117,
  OriginalRow227TriangleData0147.coefficient9_118,
  OriginalRow227TriangleData0147.coefficient9_119,
  OriginalRow227TriangleData0147.coefficient9_120,
  OriginalRow227TriangleData0147.coefficient9_121,
  OriginalRow227TriangleData0147.coefficient9_122,
  OriginalRow227TriangleData0147.coefficient9_123,
  OriginalRow227TriangleData0147.coefficient9_124,
  OriginalRow227TriangleData0147.coefficient9_125,
  OriginalRow227TriangleData0147.coefficient9_126,
  OriginalRow227TriangleData0147.coefficient9_127,
  OriginalRow227TriangleData0147.coefficient9_128,
  OriginalRow227TriangleData0147.coefficient9_129,
  OriginalRow227TriangleData0147.coefficient9_130,
  OriginalRow227TriangleData0147.coefficient9_131,
  OriginalRow227TriangleData0147.coefficient9_132,
  OriginalRow227TriangleData0147.coefficient9_133,
  OriginalRow227TriangleData0147.coefficient9_134,
  OriginalRow227TriangleData0147.coefficient9_135
]

theorem values0147_size : values0147.size = 32 := rfl

def block0147 : ℕ → Option IntervalDyadic := segment 104 values0147

theorem block0147_domain : ExactDomain block0147 104 136 := by
  simpa only [values0147_size] using segment_domain 104 values0147

theorem block0147_get (i : Fin 32) :
    block0147 (104 + i.val) = some (values0147[i.val]'(by rw [values0147_size]; exact i.isLt)) := by
  exact segment_get 104 values0147 ⟨i.val, by rw [values0147_size]; exact i.isLt⟩

def values0148 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0148.coefficient9_136,
  OriginalRow227TriangleData0148.coefficient9_137,
  OriginalRow227TriangleData0148.coefficient9_138,
  OriginalRow227TriangleData0148.coefficient9_139,
  OriginalRow227TriangleData0148.coefficient9_140,
  OriginalRow227TriangleData0148.coefficient9_141,
  OriginalRow227TriangleData0148.coefficient9_142,
  OriginalRow227TriangleData0148.coefficient9_143,
  OriginalRow227TriangleData0148.coefficient9_144,
  OriginalRow227TriangleData0148.coefficient9_145,
  OriginalRow227TriangleData0148.coefficient9_146,
  OriginalRow227TriangleData0148.coefficient9_147,
  OriginalRow227TriangleData0148.coefficient9_148,
  OriginalRow227TriangleData0148.coefficient9_149,
  OriginalRow227TriangleData0148.coefficient9_150,
  OriginalRow227TriangleData0148.coefficient9_151,
  OriginalRow227TriangleData0148.coefficient9_152,
  OriginalRow227TriangleData0148.coefficient9_153,
  OriginalRow227TriangleData0148.coefficient9_154,
  OriginalRow227TriangleData0148.coefficient9_155,
  OriginalRow227TriangleData0148.coefficient9_156,
  OriginalRow227TriangleData0148.coefficient9_157,
  OriginalRow227TriangleData0148.coefficient9_158,
  OriginalRow227TriangleData0148.coefficient9_159,
  OriginalRow227TriangleData0148.coefficient9_160,
  OriginalRow227TriangleData0148.coefficient9_161,
  OriginalRow227TriangleData0148.coefficient9_162,
  OriginalRow227TriangleData0148.coefficient9_163,
  OriginalRow227TriangleData0148.coefficient9_164,
  OriginalRow227TriangleData0148.coefficient9_165,
  OriginalRow227TriangleData0148.coefficient9_166,
  OriginalRow227TriangleData0148.coefficient9_167
]

theorem values0148_size : values0148.size = 32 := rfl

def block0148 : ℕ → Option IntervalDyadic := segment 136 values0148

theorem block0148_domain : ExactDomain block0148 136 168 := by
  simpa only [values0148_size] using segment_domain 136 values0148

theorem block0148_get (i : Fin 32) :
    block0148 (136 + i.val) = some (values0148[i.val]'(by rw [values0148_size]; exact i.isLt)) := by
  exact segment_get 136 values0148 ⟨i.val, by rw [values0148_size]; exact i.isLt⟩

def values0149 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0149.coefficient9_168,
  OriginalRow227TriangleData0149.coefficient9_169,
  OriginalRow227TriangleData0149.coefficient9_170,
  OriginalRow227TriangleData0149.coefficient9_171,
  OriginalRow227TriangleData0149.coefficient9_172,
  OriginalRow227TriangleData0149.coefficient9_173,
  OriginalRow227TriangleData0149.coefficient9_174,
  OriginalRow227TriangleData0149.coefficient9_175,
  OriginalRow227TriangleData0149.coefficient9_176,
  OriginalRow227TriangleData0149.coefficient9_177,
  OriginalRow227TriangleData0149.coefficient9_178,
  OriginalRow227TriangleData0149.coefficient9_179,
  OriginalRow227TriangleData0149.coefficient9_180,
  OriginalRow227TriangleData0149.coefficient9_181,
  OriginalRow227TriangleData0149.coefficient9_182,
  OriginalRow227TriangleData0149.coefficient9_183,
  OriginalRow227TriangleData0149.coefficient9_184,
  OriginalRow227TriangleData0149.coefficient9_185,
  OriginalRow227TriangleData0149.coefficient9_186,
  OriginalRow227TriangleData0149.coefficient9_187,
  OriginalRow227TriangleData0149.coefficient9_188,
  OriginalRow227TriangleData0149.coefficient9_189,
  OriginalRow227TriangleData0149.coefficient9_190,
  OriginalRow227TriangleData0149.coefficient9_191,
  OriginalRow227TriangleData0149.coefficient9_192,
  OriginalRow227TriangleData0149.coefficient9_193,
  OriginalRow227TriangleData0149.coefficient9_194,
  OriginalRow227TriangleData0149.coefficient9_195,
  OriginalRow227TriangleData0149.coefficient9_196,
  OriginalRow227TriangleData0149.coefficient9_197,
  OriginalRow227TriangleData0149.coefficient9_198,
  OriginalRow227TriangleData0149.coefficient9_199
]

theorem values0149_size : values0149.size = 32 := rfl

def block0149 : ℕ → Option IntervalDyadic := segment 168 values0149

theorem block0149_domain : ExactDomain block0149 168 200 := by
  simpa only [values0149_size] using segment_domain 168 values0149

theorem block0149_get (i : Fin 32) :
    block0149 (168 + i.val) = some (values0149[i.val]'(by rw [values0149_size]; exact i.isLt)) := by
  exact segment_get 168 values0149 ⟨i.val, by rw [values0149_size]; exact i.isLt⟩

def values0150 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0150.coefficient9_200,
  OriginalRow227TriangleData0150.coefficient9_201,
  OriginalRow227TriangleData0150.coefficient9_202,
  OriginalRow227TriangleData0150.coefficient9_203,
  OriginalRow227TriangleData0150.coefficient9_204,
  OriginalRow227TriangleData0150.coefficient9_205,
  OriginalRow227TriangleData0150.coefficient9_206,
  OriginalRow227TriangleData0150.coefficient9_207,
  OriginalRow227TriangleData0150.coefficient9_208,
  OriginalRow227TriangleData0150.coefficient9_209,
  OriginalRow227TriangleData0150.coefficient9_210,
  OriginalRow227TriangleData0150.coefficient9_211,
  OriginalRow227TriangleData0150.coefficient9_212,
  OriginalRow227TriangleData0150.coefficient9_213,
  OriginalRow227TriangleData0150.coefficient9_214,
  OriginalRow227TriangleData0150.coefficient9_215,
  OriginalRow227TriangleData0150.coefficient9_216,
  OriginalRow227TriangleData0150.coefficient9_217,
  OriginalRow227TriangleData0150.coefficient9_218,
  OriginalRow227TriangleData0150.coefficient9_219,
  OriginalRow227TriangleData0150.coefficient9_220,
  OriginalRow227TriangleData0150.coefficient9_221,
  OriginalRow227TriangleData0150.coefficient9_222,
  OriginalRow227TriangleData0150.coefficient9_223,
  OriginalRow227TriangleData0150.coefficient9_224,
  OriginalRow227TriangleData0150.coefficient9_225,
  OriginalRow227TriangleData0150.coefficient9_226,
  OriginalRow227TriangleData0150.coefficient9_227,
  OriginalRow227TriangleData0150.coefficient9_228,
  OriginalRow227TriangleData0150.coefficient9_229,
  OriginalRow227TriangleData0150.coefficient9_230,
  OriginalRow227TriangleData0150.coefficient9_231
]

theorem values0150_size : values0150.size = 32 := rfl

def block0150 : ℕ → Option IntervalDyadic := segment 200 values0150

theorem block0150_domain : ExactDomain block0150 200 232 := by
  simpa only [values0150_size] using segment_domain 200 values0150

theorem block0150_get (i : Fin 32) :
    block0150 (200 + i.val) = some (values0150[i.val]'(by rw [values0150_size]; exact i.isLt)) := by
  exact segment_get 200 values0150 ⟨i.val, by rw [values0150_size]; exact i.isLt⟩

def values0151 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0151.coefficient9_232,
  OriginalRow227TriangleData0151.coefficient9_233,
  OriginalRow227TriangleData0151.coefficient9_234,
  OriginalRow227TriangleData0151.coefficient9_235,
  OriginalRow227TriangleData0151.coefficient9_236,
  OriginalRow227TriangleData0151.coefficient9_237,
  OriginalRow227TriangleData0151.coefficient9_238,
  OriginalRow227TriangleData0151.coefficient9_239,
  OriginalRow227TriangleData0151.coefficient9_240,
  OriginalRow227TriangleData0151.coefficient9_241,
  OriginalRow227TriangleData0151.coefficient9_242,
  OriginalRow227TriangleData0151.coefficient9_243,
  OriginalRow227TriangleData0151.coefficient9_244,
  OriginalRow227TriangleData0151.coefficient9_245,
  OriginalRow227TriangleData0151.coefficient9_246,
  OriginalRow227TriangleData0151.coefficient9_247,
  OriginalRow227TriangleData0151.coefficient9_248,
  OriginalRow227TriangleData0151.coefficient9_249,
  OriginalRow227TriangleData0151.coefficient9_250,
  OriginalRow227TriangleData0151.coefficient9_251,
  OriginalRow227TriangleData0151.coefficient9_252,
  OriginalRow227TriangleData0151.coefficient9_253,
  OriginalRow227TriangleData0151.coefficient9_254,
  OriginalRow227TriangleData0151.coefficient9_255,
  OriginalRow227TriangleData0151.coefficient9_256,
  OriginalRow227TriangleData0151.coefficient9_257,
  OriginalRow227TriangleData0151.coefficient9_258,
  OriginalRow227TriangleData0151.coefficient9_259,
  OriginalRow227TriangleData0151.coefficient9_260,
  OriginalRow227TriangleData0151.coefficient9_261,
  OriginalRow227TriangleData0151.coefficient9_262,
  OriginalRow227TriangleData0151.coefficient9_263
]

theorem values0151_size : values0151.size = 32 := rfl

def block0151 : ℕ → Option IntervalDyadic := segment 232 values0151

theorem block0151_domain : ExactDomain block0151 232 264 := by
  simpa only [values0151_size] using segment_domain 232 values0151

theorem block0151_get (i : Fin 32) :
    block0151 (232 + i.val) = some (values0151[i.val]'(by rw [values0151_size]; exact i.isLt)) := by
  exact segment_get 232 values0151 ⟨i.val, by rw [values0151_size]; exact i.isLt⟩

def values0152 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0152.coefficient9_264,
  OriginalRow227TriangleData0152.coefficient9_265,
  OriginalRow227TriangleData0152.coefficient9_266,
  OriginalRow227TriangleData0152.coefficient9_267,
  OriginalRow227TriangleData0152.coefficient9_268,
  OriginalRow227TriangleData0152.coefficient9_269,
  OriginalRow227TriangleData0152.coefficient9_270,
  OriginalRow227TriangleData0152.coefficient9_271,
  OriginalRow227TriangleData0152.coefficient9_272,
  OriginalRow227TriangleData0152.coefficient9_273,
  OriginalRow227TriangleData0152.coefficient9_274,
  OriginalRow227TriangleData0152.coefficient9_275,
  OriginalRow227TriangleData0152.coefficient9_276,
  OriginalRow227TriangleData0152.coefficient9_277,
  OriginalRow227TriangleData0152.coefficient9_278,
  OriginalRow227TriangleData0152.coefficient9_279,
  OriginalRow227TriangleData0152.coefficient9_280,
  OriginalRow227TriangleData0152.coefficient9_281,
  OriginalRow227TriangleData0152.coefficient9_282,
  OriginalRow227TriangleData0152.coefficient9_283,
  OriginalRow227TriangleData0152.coefficient9_284,
  OriginalRow227TriangleData0152.coefficient9_285,
  OriginalRow227TriangleData0152.coefficient9_286,
  OriginalRow227TriangleData0152.coefficient9_287,
  OriginalRow227TriangleData0152.coefficient9_288,
  OriginalRow227TriangleData0152.coefficient9_289,
  OriginalRow227TriangleData0152.coefficient9_290,
  OriginalRow227TriangleData0152.coefficient9_291,
  OriginalRow227TriangleData0152.coefficient9_292,
  OriginalRow227TriangleData0152.coefficient9_293,
  OriginalRow227TriangleData0152.coefficient9_294,
  OriginalRow227TriangleData0152.coefficient9_295
]

theorem values0152_size : values0152.size = 32 := rfl

def block0152 : ℕ → Option IntervalDyadic := segment 264 values0152

theorem block0152_domain : ExactDomain block0152 264 296 := by
  simpa only [values0152_size] using segment_domain 264 values0152

theorem block0152_get (i : Fin 32) :
    block0152 (264 + i.val) = some (values0152[i.val]'(by rw [values0152_size]; exact i.isLt)) := by
  exact segment_get 264 values0152 ⟨i.val, by rw [values0152_size]; exact i.isLt⟩

def values0153 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0153.coefficient9_296,
  OriginalRow227TriangleData0153.coefficient9_297,
  OriginalRow227TriangleData0153.coefficient9_298,
  OriginalRow227TriangleData0153.coefficient9_299,
  OriginalRow227TriangleData0153.coefficient9_300,
  OriginalRow227TriangleData0153.coefficient9_301,
  OriginalRow227TriangleData0153.coefficient9_302,
  OriginalRow227TriangleData0153.coefficient9_303,
  OriginalRow227TriangleData0153.coefficient9_304,
  OriginalRow227TriangleData0153.coefficient9_305,
  OriginalRow227TriangleData0153.coefficient9_306,
  OriginalRow227TriangleData0153.coefficient9_307,
  OriginalRow227TriangleData0153.coefficient9_308,
  OriginalRow227TriangleData0153.coefficient9_309,
  OriginalRow227TriangleData0153.coefficient9_310,
  OriginalRow227TriangleData0153.coefficient9_311,
  OriginalRow227TriangleData0153.coefficient9_312,
  OriginalRow227TriangleData0153.coefficient9_313,
  OriginalRow227TriangleData0153.coefficient9_314,
  OriginalRow227TriangleData0153.coefficient9_315,
  OriginalRow227TriangleData0153.coefficient9_316,
  OriginalRow227TriangleData0153.coefficient9_317,
  OriginalRow227TriangleData0153.coefficient9_318,
  OriginalRow227TriangleData0153.coefficient9_319,
  OriginalRow227TriangleData0153.coefficient9_320,
  OriginalRow227TriangleData0153.coefficient9_321,
  OriginalRow227TriangleData0153.coefficient9_322,
  OriginalRow227TriangleData0153.coefficient9_323,
  OriginalRow227TriangleData0153.coefficient9_324,
  OriginalRow227TriangleData0153.coefficient9_325,
  OriginalRow227TriangleData0153.coefficient9_326,
  OriginalRow227TriangleData0153.coefficient9_327
]

theorem values0153_size : values0153.size = 32 := rfl

def block0153 : ℕ → Option IntervalDyadic := segment 296 values0153

theorem block0153_domain : ExactDomain block0153 296 328 := by
  simpa only [values0153_size] using segment_domain 296 values0153

theorem block0153_get (i : Fin 32) :
    block0153 (296 + i.val) = some (values0153[i.val]'(by rw [values0153_size]; exact i.isLt)) := by
  exact segment_get 296 values0153 ⟨i.val, by rw [values0153_size]; exact i.isLt⟩

def values0154 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0154.coefficient9_328,
  OriginalRow227TriangleData0154.coefficient9_329,
  OriginalRow227TriangleData0154.coefficient9_330,
  OriginalRow227TriangleData0154.coefficient9_331,
  OriginalRow227TriangleData0154.coefficient9_332,
  OriginalRow227TriangleData0154.coefficient9_333,
  OriginalRow227TriangleData0154.coefficient9_334,
  OriginalRow227TriangleData0154.coefficient9_335,
  OriginalRow227TriangleData0154.coefficient9_336,
  OriginalRow227TriangleData0154.coefficient9_337,
  OriginalRow227TriangleData0154.coefficient9_338,
  OriginalRow227TriangleData0154.coefficient9_339,
  OriginalRow227TriangleData0154.coefficient9_340,
  OriginalRow227TriangleData0154.coefficient9_341,
  OriginalRow227TriangleData0154.coefficient9_342,
  OriginalRow227TriangleData0154.coefficient9_343,
  OriginalRow227TriangleData0154.coefficient9_344,
  OriginalRow227TriangleData0154.coefficient9_345,
  OriginalRow227TriangleData0154.coefficient9_346,
  OriginalRow227TriangleData0154.coefficient9_347,
  OriginalRow227TriangleData0154.coefficient9_348,
  OriginalRow227TriangleData0154.coefficient9_349,
  OriginalRow227TriangleData0154.coefficient9_350,
  OriginalRow227TriangleData0154.coefficient9_351,
  OriginalRow227TriangleData0154.coefficient9_352,
  OriginalRow227TriangleData0154.coefficient9_353,
  OriginalRow227TriangleData0154.coefficient9_354,
  OriginalRow227TriangleData0154.coefficient9_355,
  OriginalRow227TriangleData0154.coefficient9_356,
  OriginalRow227TriangleData0154.coefficient9_357,
  OriginalRow227TriangleData0154.coefficient9_358,
  OriginalRow227TriangleData0154.coefficient9_359
]

theorem values0154_size : values0154.size = 32 := rfl

def block0154 : ℕ → Option IntervalDyadic := segment 328 values0154

theorem block0154_domain : ExactDomain block0154 328 360 := by
  simpa only [values0154_size] using segment_domain 328 values0154

theorem block0154_get (i : Fin 32) :
    block0154 (328 + i.val) = some (values0154[i.val]'(by rw [values0154_size]; exact i.isLt)) := by
  exact segment_get 328 values0154 ⟨i.val, by rw [values0154_size]; exact i.isLt⟩

def values0155 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0155.coefficient9_360,
  OriginalRow227TriangleData0155.coefficient9_361,
  OriginalRow227TriangleData0155.coefficient9_362,
  OriginalRow227TriangleData0155.coefficient9_363,
  OriginalRow227TriangleData0155.coefficient9_364,
  OriginalRow227TriangleData0155.coefficient9_365,
  OriginalRow227TriangleData0155.coefficient9_366,
  OriginalRow227TriangleData0155.coefficient9_367,
  OriginalRow227TriangleData0155.coefficient9_368,
  OriginalRow227TriangleData0155.coefficient9_369,
  OriginalRow227TriangleData0155.coefficient9_370,
  OriginalRow227TriangleData0155.coefficient9_371,
  OriginalRow227TriangleData0155.coefficient9_372,
  OriginalRow227TriangleData0155.coefficient9_373,
  OriginalRow227TriangleData0155.coefficient9_374,
  OriginalRow227TriangleData0155.coefficient9_375,
  OriginalRow227TriangleData0155.coefficient9_376,
  OriginalRow227TriangleData0155.coefficient9_377,
  OriginalRow227TriangleData0155.coefficient9_378,
  OriginalRow227TriangleData0155.coefficient9_379,
  OriginalRow227TriangleData0155.coefficient9_380,
  OriginalRow227TriangleData0155.coefficient9_381,
  OriginalRow227TriangleData0155.coefficient9_382,
  OriginalRow227TriangleData0155.coefficient9_383,
  OriginalRow227TriangleData0155.coefficient9_384,
  OriginalRow227TriangleData0155.coefficient9_385,
  OriginalRow227TriangleData0155.coefficient9_386,
  OriginalRow227TriangleData0155.coefficient9_387,
  OriginalRow227TriangleData0155.coefficient9_388,
  OriginalRow227TriangleData0155.coefficient9_389,
  OriginalRow227TriangleData0155.coefficient9_390,
  OriginalRow227TriangleData0155.coefficient9_391
]

theorem values0155_size : values0155.size = 32 := rfl

def block0155 : ℕ → Option IntervalDyadic := segment 360 values0155

theorem block0155_domain : ExactDomain block0155 360 392 := by
  simpa only [values0155_size] using segment_domain 360 values0155

theorem block0155_get (i : Fin 32) :
    block0155 (360 + i.val) = some (values0155[i.val]'(by rw [values0155_size]; exact i.isLt)) := by
  exact segment_get 360 values0155 ⟨i.val, by rw [values0155_size]; exact i.isLt⟩

def values0156 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0156.coefficient9_392,
  OriginalRow227TriangleData0156.coefficient9_393,
  OriginalRow227TriangleData0156.coefficient9_394,
  OriginalRow227TriangleData0156.coefficient9_395,
  OriginalRow227TriangleData0156.coefficient9_396,
  OriginalRow227TriangleData0156.coefficient9_397,
  OriginalRow227TriangleData0156.coefficient9_398,
  OriginalRow227TriangleData0156.coefficient9_399,
  OriginalRow227TriangleData0156.coefficient9_400,
  OriginalRow227TriangleData0156.coefficient9_401,
  OriginalRow227TriangleData0156.coefficient9_402,
  OriginalRow227TriangleData0156.coefficient9_403,
  OriginalRow227TriangleData0156.coefficient9_404,
  OriginalRow227TriangleData0156.coefficient9_405,
  OriginalRow227TriangleData0156.coefficient9_406,
  OriginalRow227TriangleData0156.coefficient9_407,
  OriginalRow227TriangleData0156.coefficient9_408,
  OriginalRow227TriangleData0156.coefficient9_409,
  OriginalRow227TriangleData0156.coefficient9_410,
  OriginalRow227TriangleData0156.coefficient9_411,
  OriginalRow227TriangleData0156.coefficient9_412,
  OriginalRow227TriangleData0156.coefficient9_413,
  OriginalRow227TriangleData0156.coefficient9_414,
  OriginalRow227TriangleData0156.coefficient9_415,
  OriginalRow227TriangleData0156.coefficient9_416,
  OriginalRow227TriangleData0156.coefficient9_417,
  OriginalRow227TriangleData0156.coefficient9_418,
  OriginalRow227TriangleData0156.coefficient9_419,
  OriginalRow227TriangleData0156.coefficient9_420,
  OriginalRow227TriangleData0156.coefficient9_421,
  OriginalRow227TriangleData0156.coefficient9_422,
  OriginalRow227TriangleData0156.coefficient9_423
]

theorem values0156_size : values0156.size = 32 := rfl

def block0156 : ℕ → Option IntervalDyadic := segment 392 values0156

theorem block0156_domain : ExactDomain block0156 392 424 := by
  simpa only [values0156_size] using segment_domain 392 values0156

theorem block0156_get (i : Fin 32) :
    block0156 (392 + i.val) = some (values0156[i.val]'(by rw [values0156_size]; exact i.isLt)) := by
  exact segment_get 392 values0156 ⟨i.val, by rw [values0156_size]; exact i.isLt⟩

def values0157 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0157.coefficient9_424,
  OriginalRow227TriangleData0157.coefficient9_425,
  OriginalRow227TriangleData0157.coefficient9_426,
  OriginalRow227TriangleData0157.coefficient9_427,
  OriginalRow227TriangleData0157.coefficient9_428,
  OriginalRow227TriangleData0157.coefficient9_429,
  OriginalRow227TriangleData0157.coefficient9_430,
  OriginalRow227TriangleData0157.coefficient9_431,
  OriginalRow227TriangleData0157.coefficient9_432,
  OriginalRow227TriangleData0157.coefficient9_433,
  OriginalRow227TriangleData0157.coefficient9_434,
  OriginalRow227TriangleData0157.coefficient9_435,
  OriginalRow227TriangleData0157.coefficient9_436,
  OriginalRow227TriangleData0157.coefficient9_437,
  OriginalRow227TriangleData0157.coefficient9_438,
  OriginalRow227TriangleData0157.coefficient9_439,
  OriginalRow227TriangleData0157.coefficient9_440,
  OriginalRow227TriangleData0157.coefficient9_441,
  OriginalRow227TriangleData0157.coefficient9_442,
  OriginalRow227TriangleData0157.coefficient9_443,
  OriginalRow227TriangleData0157.coefficient9_444,
  OriginalRow227TriangleData0157.coefficient9_445,
  OriginalRow227TriangleData0157.coefficient9_446,
  OriginalRow227TriangleData0157.coefficient9_447,
  OriginalRow227TriangleData0157.coefficient9_448,
  OriginalRow227TriangleData0157.coefficient9_449,
  OriginalRow227TriangleData0157.coefficient9_450,
  OriginalRow227TriangleData0157.coefficient9_451,
  OriginalRow227TriangleData0157.coefficient9_452,
  OriginalRow227TriangleData0157.coefficient9_453,
  OriginalRow227TriangleData0157.coefficient9_454,
  OriginalRow227TriangleData0157.coefficient9_455
]

theorem values0157_size : values0157.size = 32 := rfl

def block0157 : ℕ → Option IntervalDyadic := segment 424 values0157

theorem block0157_domain : ExactDomain block0157 424 456 := by
  simpa only [values0157_size] using segment_domain 424 values0157

theorem block0157_get (i : Fin 32) :
    block0157 (424 + i.val) = some (values0157[i.val]'(by rw [values0157_size]; exact i.isLt)) := by
  exact segment_get 424 values0157 ⟨i.val, by rw [values0157_size]; exact i.isLt⟩

def values0158 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0158.coefficient9_456,
  OriginalRow227TriangleData0158.coefficient9_457,
  OriginalRow227TriangleData0158.coefficient9_458,
  OriginalRow227TriangleData0158.coefficient9_459,
  OriginalRow227TriangleData0158.coefficient9_460,
  OriginalRow227TriangleData0158.coefficient9_461,
  OriginalRow227TriangleData0158.coefficient9_462,
  OriginalRow227TriangleData0158.coefficient9_463,
  OriginalRow227TriangleData0158.coefficient9_464,
  OriginalRow227TriangleData0158.coefficient9_465,
  OriginalRow227TriangleData0158.coefficient9_466,
  OriginalRow227TriangleData0158.coefficient9_467,
  OriginalRow227TriangleData0158.coefficient9_468,
  OriginalRow227TriangleData0158.coefficient9_469,
  OriginalRow227TriangleData0158.coefficient9_470,
  OriginalRow227TriangleData0158.coefficient9_471,
  OriginalRow227TriangleData0158.coefficient9_472,
  OriginalRow227TriangleData0158.coefficient9_473,
  OriginalRow227TriangleData0158.coefficient9_474,
  OriginalRow227TriangleData0158.coefficient9_475,
  OriginalRow227TriangleData0158.coefficient9_476,
  OriginalRow227TriangleData0158.coefficient9_477,
  OriginalRow227TriangleData0158.coefficient9_478,
  OriginalRow227TriangleData0158.coefficient9_479,
  OriginalRow227TriangleData0158.coefficient9_480,
  OriginalRow227TriangleData0158.coefficient9_481,
  OriginalRow227TriangleData0158.coefficient9_482,
  OriginalRow227TriangleData0158.coefficient9_483,
  OriginalRow227TriangleData0158.coefficient9_484,
  OriginalRow227TriangleData0158.coefficient9_485,
  OriginalRow227TriangleData0158.coefficient9_486,
  OriginalRow227TriangleData0158.coefficient9_487
]

theorem values0158_size : values0158.size = 32 := rfl

def block0158 : ℕ → Option IntervalDyadic := segment 456 values0158

theorem block0158_domain : ExactDomain block0158 456 488 := by
  simpa only [values0158_size] using segment_domain 456 values0158

theorem block0158_get (i : Fin 32) :
    block0158 (456 + i.val) = some (values0158[i.val]'(by rw [values0158_size]; exact i.isLt)) := by
  exact segment_get 456 values0158 ⟨i.val, by rw [values0158_size]; exact i.isLt⟩

def values0159 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0159.coefficient9_488,
  OriginalRow227TriangleData0159.coefficient9_489,
  OriginalRow227TriangleData0159.coefficient9_490,
  OriginalRow227TriangleData0159.coefficient9_491,
  OriginalRow227TriangleData0159.coefficient9_492
]

theorem values0159_size : values0159.size = 5 := rfl

def block0159 : ℕ → Option IntervalDyadic := segment 488 values0159

theorem block0159_domain : ExactDomain block0159 488 493 := by
  simpa only [values0159_size] using segment_domain 488 values0159

theorem block0159_get (i : Fin 5) :
    block0159 (488 + i.val) = some (values0159[i.val]'(by rw [values0159_size]; exact i.isLt)) := by
  exact segment_get 488 values0159 ⟨i.val, by rw [values0159_size]; exact i.isLt⟩

def node0008_0072 : ℕ → Option IntervalDyadic := split 40 block0144 block0145

theorem node0008_0072_domain : ExactDomain node0008_0072 8 72 := by
  exact split_domain (by decide) (by decide) block0144_domain block0145_domain

def node0072_0136 : ℕ → Option IntervalDyadic := split 104 block0146 block0147

theorem node0072_0136_domain : ExactDomain node0072_0136 72 136 := by
  exact split_domain (by decide) (by decide) block0146_domain block0147_domain

def node0008_0136 : ℕ → Option IntervalDyadic := split 72 node0008_0072 node0072_0136

theorem node0008_0136_domain : ExactDomain node0008_0136 8 136 := by
  exact split_domain (by decide) (by decide) node0008_0072_domain node0072_0136_domain

def node0136_0200 : ℕ → Option IntervalDyadic := split 168 block0148 block0149

theorem node0136_0200_domain : ExactDomain node0136_0200 136 200 := by
  exact split_domain (by decide) (by decide) block0148_domain block0149_domain

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block0150 block0151

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block0150_domain block0151_domain

def node0136_0264 : ℕ → Option IntervalDyadic := split 200 node0136_0200 node0200_0264

theorem node0136_0264_domain : ExactDomain node0136_0264 136 264 := by
  exact split_domain (by decide) (by decide) node0136_0200_domain node0200_0264_domain

def node0008_0264 : ℕ → Option IntervalDyadic := split 136 node0008_0136 node0136_0264

theorem node0008_0264_domain : ExactDomain node0008_0264 8 264 := by
  exact split_domain (by decide) (by decide) node0008_0136_domain node0136_0264_domain

def node0264_0328 : ℕ → Option IntervalDyadic := split 296 block0152 block0153

theorem node0264_0328_domain : ExactDomain node0264_0328 264 328 := by
  exact split_domain (by decide) (by decide) block0152_domain block0153_domain

def node0328_0392 : ℕ → Option IntervalDyadic := split 360 block0154 block0155

theorem node0328_0392_domain : ExactDomain node0328_0392 328 392 := by
  exact split_domain (by decide) (by decide) block0154_domain block0155_domain

def node0264_0392 : ℕ → Option IntervalDyadic := split 328 node0264_0328 node0328_0392

theorem node0264_0392_domain : ExactDomain node0264_0392 264 392 := by
  exact split_domain (by decide) (by decide) node0264_0328_domain node0328_0392_domain

def node0392_0456 : ℕ → Option IntervalDyadic := split 424 block0156 block0157

theorem node0392_0456_domain : ExactDomain node0392_0456 392 456 := by
  exact split_domain (by decide) (by decide) block0156_domain block0157_domain

def node0456_0493 : ℕ → Option IntervalDyadic := split 488 block0158 block0159

theorem node0456_0493_domain : ExactDomain node0456_0493 456 493 := by
  exact split_domain (by decide) (by decide) block0158_domain block0159_domain

def node0392_0493 : ℕ → Option IntervalDyadic := split 456 node0392_0456 node0456_0493

theorem node0392_0493_domain : ExactDomain node0392_0493 392 493 := by
  exact split_domain (by decide) (by decide) node0392_0456_domain node0456_0493_domain

def node0264_0493 : ℕ → Option IntervalDyadic := split 392 node0264_0392 node0392_0493

theorem node0264_0493_domain : ExactDomain node0264_0493 264 493 := by
  exact split_domain (by decide) (by decide) node0264_0392_domain node0392_0493_domain

def node0008_0493 : ℕ → Option IntervalDyadic := split 264 node0008_0264 node0264_0493

theorem node0008_0493_domain : ExactDomain node0008_0493 8 493 := by
  exact split_domain (by decide) (by decide) node0008_0264_domain node0264_0493_domain

def lookup : ℕ → Option IntervalDyadic := node0008_0493

theorem lookup_domain : ExactDomain lookup 8 493 :=
  node0008_0493_domain

theorem block0144_lookup (i : Fin 32) :
    lookup (8 + i.val) = some (values0144[i.val]'(by rw [values0144_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (8 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_left 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0008_0136, split_left 72 node0008_0072 node0072_0136 (by omega)]
  rw [node0008_0072, split_left 40 block0144 block0145 (by omega)]
  exact block0144_get i

theorem block0145_lookup (i : Fin 32) :
    lookup (40 + i.val) = some (values0145[i.val]'(by rw [values0145_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (40 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_left 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0008_0136, split_left 72 node0008_0072 node0072_0136 (by omega)]
  rw [node0008_0072, split_right 40 block0144 block0145 (by omega)]
  exact block0145_get i

theorem block0146_lookup (i : Fin 32) :
    lookup (72 + i.val) = some (values0146[i.val]'(by rw [values0146_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (72 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_left 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0008_0136, split_right 72 node0008_0072 node0072_0136 (by omega)]
  rw [node0072_0136, split_left 104 block0146 block0147 (by omega)]
  exact block0146_get i

theorem block0147_lookup (i : Fin 32) :
    lookup (104 + i.val) = some (values0147[i.val]'(by rw [values0147_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (104 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_left 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0008_0136, split_right 72 node0008_0072 node0072_0136 (by omega)]
  rw [node0072_0136, split_right 104 block0146 block0147 (by omega)]
  exact block0147_get i

theorem block0148_lookup (i : Fin 32) :
    lookup (136 + i.val) = some (values0148[i.val]'(by rw [values0148_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (136 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_right 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_left 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0136_0200, split_left 168 block0148 block0149 (by omega)]
  exact block0148_get i

theorem block0149_lookup (i : Fin 32) :
    lookup (168 + i.val) = some (values0149[i.val]'(by rw [values0149_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (168 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_right 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_left 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0136_0200, split_right 168 block0148 block0149 (by omega)]
  exact block0149_get i

theorem block0150_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values0150[i.val]'(by rw [values0150_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (200 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_right 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_right 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0200_0264, split_left 232 block0150 block0151 (by omega)]
  exact block0150_get i

theorem block0151_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values0151[i.val]'(by rw [values0151_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (232 + i.val) = _
  rw [node0008_0493, split_left 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0008_0264, split_right 136 node0008_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_right 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0200_0264, split_right 232 block0150 block0151 (by omega)]
  exact block0151_get i

theorem block0152_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values0152[i.val]'(by rw [values0152_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (264 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_left 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0264_0392, split_left 328 node0264_0328 node0328_0392 (by omega)]
  rw [node0264_0328, split_left 296 block0152 block0153 (by omega)]
  exact block0152_get i

theorem block0153_lookup (i : Fin 32) :
    lookup (296 + i.val) = some (values0153[i.val]'(by rw [values0153_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (296 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_left 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0264_0392, split_left 328 node0264_0328 node0328_0392 (by omega)]
  rw [node0264_0328, split_right 296 block0152 block0153 (by omega)]
  exact block0153_get i

theorem block0154_lookup (i : Fin 32) :
    lookup (328 + i.val) = some (values0154[i.val]'(by rw [values0154_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (328 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_left 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0264_0392, split_right 328 node0264_0328 node0328_0392 (by omega)]
  rw [node0328_0392, split_left 360 block0154 block0155 (by omega)]
  exact block0154_get i

theorem block0155_lookup (i : Fin 32) :
    lookup (360 + i.val) = some (values0155[i.val]'(by rw [values0155_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (360 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_left 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0264_0392, split_right 328 node0264_0328 node0328_0392 (by omega)]
  rw [node0328_0392, split_right 360 block0154 block0155 (by omega)]
  exact block0155_get i

theorem block0156_lookup (i : Fin 32) :
    lookup (392 + i.val) = some (values0156[i.val]'(by rw [values0156_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (392 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_right 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0392_0493, split_left 456 node0392_0456 node0456_0493 (by omega)]
  rw [node0392_0456, split_left 424 block0156 block0157 (by omega)]
  exact block0156_get i

theorem block0157_lookup (i : Fin 32) :
    lookup (424 + i.val) = some (values0157[i.val]'(by rw [values0157_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (424 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_right 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0392_0493, split_left 456 node0392_0456 node0456_0493 (by omega)]
  rw [node0392_0456, split_right 424 block0156 block0157 (by omega)]
  exact block0157_get i

theorem block0158_lookup (i : Fin 32) :
    lookup (456 + i.val) = some (values0158[i.val]'(by rw [values0158_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (456 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_right 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0392_0493, split_right 456 node0392_0456 node0456_0493 (by omega)]
  rw [node0456_0493, split_left 488 block0158 block0159 (by omega)]
  exact block0158_get i

theorem block0159_lookup (i : Fin 5) :
    lookup (488 + i.val) = some (values0159[i.val]'(by rw [values0159_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0008_0493 (488 + i.val) = _
  rw [node0008_0493, split_right 264 node0008_0264 node0264_0493 (by omega)]
  rw [node0264_0493, split_right 392 node0264_0392 node0392_0493 (by omega)]
  rw [node0392_0493, split_right 456 node0392_0456 node0456_0493 (by omega)]
  rw [node0456_0493, split_right 488 block0158 block0159 (by omega)]
  exact block0159_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0144_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0144_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0145_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0145_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0146_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0146_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0147_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0147_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0148_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0148_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0149_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0149_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0150_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0150_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0151_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0151_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0152_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0152_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0153_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0153_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0154_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0154_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0155_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0155_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0156_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0156_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0157_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0157_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0158_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0158_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0159_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0159_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0144_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0145_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0146_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0147_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0148_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0149_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0150_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0151_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0152_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0153_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0154_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0155_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0156_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0157_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0158_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow009.block0159_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow009
