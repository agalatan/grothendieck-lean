import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0064
import Grothe.UpperChaos.OriginalRow227TriangleData0065
import Grothe.UpperChaos.OriginalRow227TriangleData0066
import Grothe.UpperChaos.OriginalRow227TriangleData0067
import Grothe.UpperChaos.OriginalRow227TriangleData0068
import Grothe.UpperChaos.OriginalRow227TriangleData0069
import Grothe.UpperChaos.OriginalRow227TriangleData0070
import Grothe.UpperChaos.OriginalRow227TriangleData0071
import Grothe.UpperChaos.OriginalRow227TriangleData0072
import Grothe.UpperChaos.OriginalRow227TriangleData0073
import Grothe.UpperChaos.OriginalRow227TriangleData0074
import Grothe.UpperChaos.OriginalRow227TriangleData0075
import Grothe.UpperChaos.OriginalRow227TriangleData0076
import Grothe.UpperChaos.OriginalRow227TriangleData0077
import Grothe.UpperChaos.OriginalRow227TriangleData0078
import Grothe.UpperChaos.OriginalRow227TriangleData0079

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow004

open ConditionalTableLookup

def values0064 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0064.coefficient4_3,
  OriginalRow227TriangleData0064.coefficient4_4,
  OriginalRow227TriangleData0064.coefficient4_5,
  OriginalRow227TriangleData0064.coefficient4_6,
  OriginalRow227TriangleData0064.coefficient4_7,
  OriginalRow227TriangleData0064.coefficient4_8,
  OriginalRow227TriangleData0064.coefficient4_9,
  OriginalRow227TriangleData0064.coefficient4_10,
  OriginalRow227TriangleData0064.coefficient4_11,
  OriginalRow227TriangleData0064.coefficient4_12,
  OriginalRow227TriangleData0064.coefficient4_13,
  OriginalRow227TriangleData0064.coefficient4_14,
  OriginalRow227TriangleData0064.coefficient4_15,
  OriginalRow227TriangleData0064.coefficient4_16,
  OriginalRow227TriangleData0064.coefficient4_17,
  OriginalRow227TriangleData0064.coefficient4_18,
  OriginalRow227TriangleData0064.coefficient4_19,
  OriginalRow227TriangleData0064.coefficient4_20,
  OriginalRow227TriangleData0064.coefficient4_21,
  OriginalRow227TriangleData0064.coefficient4_22,
  OriginalRow227TriangleData0064.coefficient4_23,
  OriginalRow227TriangleData0064.coefficient4_24,
  OriginalRow227TriangleData0064.coefficient4_25,
  OriginalRow227TriangleData0064.coefficient4_26,
  OriginalRow227TriangleData0064.coefficient4_27,
  OriginalRow227TriangleData0064.coefficient4_28,
  OriginalRow227TriangleData0064.coefficient4_29,
  OriginalRow227TriangleData0064.coefficient4_30,
  OriginalRow227TriangleData0064.coefficient4_31,
  OriginalRow227TriangleData0064.coefficient4_32,
  OriginalRow227TriangleData0064.coefficient4_33,
  OriginalRow227TriangleData0064.coefficient4_34
]

theorem values0064_size : values0064.size = 32 := rfl

def block0064 : ℕ → Option IntervalDyadic := segment 3 values0064

theorem block0064_domain : ExactDomain block0064 3 35 := by
  simpa only [values0064_size] using segment_domain 3 values0064

theorem block0064_get (i : Fin 32) :
    block0064 (3 + i.val) = some (values0064[i.val]'(by rw [values0064_size]; exact i.isLt)) := by
  exact segment_get 3 values0064 ⟨i.val, by rw [values0064_size]; exact i.isLt⟩

def values0065 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0065.coefficient4_35,
  OriginalRow227TriangleData0065.coefficient4_36,
  OriginalRow227TriangleData0065.coefficient4_37,
  OriginalRow227TriangleData0065.coefficient4_38,
  OriginalRow227TriangleData0065.coefficient4_39,
  OriginalRow227TriangleData0065.coefficient4_40,
  OriginalRow227TriangleData0065.coefficient4_41,
  OriginalRow227TriangleData0065.coefficient4_42,
  OriginalRow227TriangleData0065.coefficient4_43,
  OriginalRow227TriangleData0065.coefficient4_44,
  OriginalRow227TriangleData0065.coefficient4_45,
  OriginalRow227TriangleData0065.coefficient4_46,
  OriginalRow227TriangleData0065.coefficient4_47,
  OriginalRow227TriangleData0065.coefficient4_48,
  OriginalRow227TriangleData0065.coefficient4_49,
  OriginalRow227TriangleData0065.coefficient4_50,
  OriginalRow227TriangleData0065.coefficient4_51,
  OriginalRow227TriangleData0065.coefficient4_52,
  OriginalRow227TriangleData0065.coefficient4_53,
  OriginalRow227TriangleData0065.coefficient4_54,
  OriginalRow227TriangleData0065.coefficient4_55,
  OriginalRow227TriangleData0065.coefficient4_56,
  OriginalRow227TriangleData0065.coefficient4_57,
  OriginalRow227TriangleData0065.coefficient4_58,
  OriginalRow227TriangleData0065.coefficient4_59,
  OriginalRow227TriangleData0065.coefficient4_60,
  OriginalRow227TriangleData0065.coefficient4_61,
  OriginalRow227TriangleData0065.coefficient4_62,
  OriginalRow227TriangleData0065.coefficient4_63,
  OriginalRow227TriangleData0065.coefficient4_64,
  OriginalRow227TriangleData0065.coefficient4_65,
  OriginalRow227TriangleData0065.coefficient4_66
]

theorem values0065_size : values0065.size = 32 := rfl

def block0065 : ℕ → Option IntervalDyadic := segment 35 values0065

theorem block0065_domain : ExactDomain block0065 35 67 := by
  simpa only [values0065_size] using segment_domain 35 values0065

theorem block0065_get (i : Fin 32) :
    block0065 (35 + i.val) = some (values0065[i.val]'(by rw [values0065_size]; exact i.isLt)) := by
  exact segment_get 35 values0065 ⟨i.val, by rw [values0065_size]; exact i.isLt⟩

def values0066 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0066.coefficient4_67,
  OriginalRow227TriangleData0066.coefficient4_68,
  OriginalRow227TriangleData0066.coefficient4_69,
  OriginalRow227TriangleData0066.coefficient4_70,
  OriginalRow227TriangleData0066.coefficient4_71,
  OriginalRow227TriangleData0066.coefficient4_72,
  OriginalRow227TriangleData0066.coefficient4_73,
  OriginalRow227TriangleData0066.coefficient4_74,
  OriginalRow227TriangleData0066.coefficient4_75,
  OriginalRow227TriangleData0066.coefficient4_76,
  OriginalRow227TriangleData0066.coefficient4_77,
  OriginalRow227TriangleData0066.coefficient4_78,
  OriginalRow227TriangleData0066.coefficient4_79,
  OriginalRow227TriangleData0066.coefficient4_80,
  OriginalRow227TriangleData0066.coefficient4_81,
  OriginalRow227TriangleData0066.coefficient4_82,
  OriginalRow227TriangleData0066.coefficient4_83,
  OriginalRow227TriangleData0066.coefficient4_84,
  OriginalRow227TriangleData0066.coefficient4_85,
  OriginalRow227TriangleData0066.coefficient4_86,
  OriginalRow227TriangleData0066.coefficient4_87,
  OriginalRow227TriangleData0066.coefficient4_88,
  OriginalRow227TriangleData0066.coefficient4_89,
  OriginalRow227TriangleData0066.coefficient4_90,
  OriginalRow227TriangleData0066.coefficient4_91,
  OriginalRow227TriangleData0066.coefficient4_92,
  OriginalRow227TriangleData0066.coefficient4_93,
  OriginalRow227TriangleData0066.coefficient4_94,
  OriginalRow227TriangleData0066.coefficient4_95,
  OriginalRow227TriangleData0066.coefficient4_96,
  OriginalRow227TriangleData0066.coefficient4_97,
  OriginalRow227TriangleData0066.coefficient4_98
]

theorem values0066_size : values0066.size = 32 := rfl

def block0066 : ℕ → Option IntervalDyadic := segment 67 values0066

theorem block0066_domain : ExactDomain block0066 67 99 := by
  simpa only [values0066_size] using segment_domain 67 values0066

theorem block0066_get (i : Fin 32) :
    block0066 (67 + i.val) = some (values0066[i.val]'(by rw [values0066_size]; exact i.isLt)) := by
  exact segment_get 67 values0066 ⟨i.val, by rw [values0066_size]; exact i.isLt⟩

def values0067 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0067.coefficient4_99,
  OriginalRow227TriangleData0067.coefficient4_100,
  OriginalRow227TriangleData0067.coefficient4_101,
  OriginalRow227TriangleData0067.coefficient4_102,
  OriginalRow227TriangleData0067.coefficient4_103,
  OriginalRow227TriangleData0067.coefficient4_104,
  OriginalRow227TriangleData0067.coefficient4_105,
  OriginalRow227TriangleData0067.coefficient4_106,
  OriginalRow227TriangleData0067.coefficient4_107,
  OriginalRow227TriangleData0067.coefficient4_108,
  OriginalRow227TriangleData0067.coefficient4_109,
  OriginalRow227TriangleData0067.coefficient4_110,
  OriginalRow227TriangleData0067.coefficient4_111,
  OriginalRow227TriangleData0067.coefficient4_112,
  OriginalRow227TriangleData0067.coefficient4_113,
  OriginalRow227TriangleData0067.coefficient4_114,
  OriginalRow227TriangleData0067.coefficient4_115,
  OriginalRow227TriangleData0067.coefficient4_116,
  OriginalRow227TriangleData0067.coefficient4_117,
  OriginalRow227TriangleData0067.coefficient4_118,
  OriginalRow227TriangleData0067.coefficient4_119,
  OriginalRow227TriangleData0067.coefficient4_120,
  OriginalRow227TriangleData0067.coefficient4_121,
  OriginalRow227TriangleData0067.coefficient4_122,
  OriginalRow227TriangleData0067.coefficient4_123,
  OriginalRow227TriangleData0067.coefficient4_124,
  OriginalRow227TriangleData0067.coefficient4_125,
  OriginalRow227TriangleData0067.coefficient4_126,
  OriginalRow227TriangleData0067.coefficient4_127,
  OriginalRow227TriangleData0067.coefficient4_128,
  OriginalRow227TriangleData0067.coefficient4_129,
  OriginalRow227TriangleData0067.coefficient4_130
]

theorem values0067_size : values0067.size = 32 := rfl

def block0067 : ℕ → Option IntervalDyadic := segment 99 values0067

theorem block0067_domain : ExactDomain block0067 99 131 := by
  simpa only [values0067_size] using segment_domain 99 values0067

theorem block0067_get (i : Fin 32) :
    block0067 (99 + i.val) = some (values0067[i.val]'(by rw [values0067_size]; exact i.isLt)) := by
  exact segment_get 99 values0067 ⟨i.val, by rw [values0067_size]; exact i.isLt⟩

def values0068 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0068.coefficient4_131,
  OriginalRow227TriangleData0068.coefficient4_132,
  OriginalRow227TriangleData0068.coefficient4_133,
  OriginalRow227TriangleData0068.coefficient4_134,
  OriginalRow227TriangleData0068.coefficient4_135,
  OriginalRow227TriangleData0068.coefficient4_136,
  OriginalRow227TriangleData0068.coefficient4_137,
  OriginalRow227TriangleData0068.coefficient4_138,
  OriginalRow227TriangleData0068.coefficient4_139,
  OriginalRow227TriangleData0068.coefficient4_140,
  OriginalRow227TriangleData0068.coefficient4_141,
  OriginalRow227TriangleData0068.coefficient4_142,
  OriginalRow227TriangleData0068.coefficient4_143,
  OriginalRow227TriangleData0068.coefficient4_144,
  OriginalRow227TriangleData0068.coefficient4_145,
  OriginalRow227TriangleData0068.coefficient4_146,
  OriginalRow227TriangleData0068.coefficient4_147,
  OriginalRow227TriangleData0068.coefficient4_148,
  OriginalRow227TriangleData0068.coefficient4_149,
  OriginalRow227TriangleData0068.coefficient4_150,
  OriginalRow227TriangleData0068.coefficient4_151,
  OriginalRow227TriangleData0068.coefficient4_152,
  OriginalRow227TriangleData0068.coefficient4_153,
  OriginalRow227TriangleData0068.coefficient4_154,
  OriginalRow227TriangleData0068.coefficient4_155,
  OriginalRow227TriangleData0068.coefficient4_156,
  OriginalRow227TriangleData0068.coefficient4_157,
  OriginalRow227TriangleData0068.coefficient4_158,
  OriginalRow227TriangleData0068.coefficient4_159,
  OriginalRow227TriangleData0068.coefficient4_160,
  OriginalRow227TriangleData0068.coefficient4_161,
  OriginalRow227TriangleData0068.coefficient4_162
]

theorem values0068_size : values0068.size = 32 := rfl

def block0068 : ℕ → Option IntervalDyadic := segment 131 values0068

theorem block0068_domain : ExactDomain block0068 131 163 := by
  simpa only [values0068_size] using segment_domain 131 values0068

theorem block0068_get (i : Fin 32) :
    block0068 (131 + i.val) = some (values0068[i.val]'(by rw [values0068_size]; exact i.isLt)) := by
  exact segment_get 131 values0068 ⟨i.val, by rw [values0068_size]; exact i.isLt⟩

def values0069 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0069.coefficient4_163,
  OriginalRow227TriangleData0069.coefficient4_164,
  OriginalRow227TriangleData0069.coefficient4_165,
  OriginalRow227TriangleData0069.coefficient4_166,
  OriginalRow227TriangleData0069.coefficient4_167,
  OriginalRow227TriangleData0069.coefficient4_168,
  OriginalRow227TriangleData0069.coefficient4_169,
  OriginalRow227TriangleData0069.coefficient4_170,
  OriginalRow227TriangleData0069.coefficient4_171,
  OriginalRow227TriangleData0069.coefficient4_172,
  OriginalRow227TriangleData0069.coefficient4_173,
  OriginalRow227TriangleData0069.coefficient4_174,
  OriginalRow227TriangleData0069.coefficient4_175,
  OriginalRow227TriangleData0069.coefficient4_176,
  OriginalRow227TriangleData0069.coefficient4_177,
  OriginalRow227TriangleData0069.coefficient4_178,
  OriginalRow227TriangleData0069.coefficient4_179,
  OriginalRow227TriangleData0069.coefficient4_180,
  OriginalRow227TriangleData0069.coefficient4_181,
  OriginalRow227TriangleData0069.coefficient4_182,
  OriginalRow227TriangleData0069.coefficient4_183,
  OriginalRow227TriangleData0069.coefficient4_184,
  OriginalRow227TriangleData0069.coefficient4_185,
  OriginalRow227TriangleData0069.coefficient4_186,
  OriginalRow227TriangleData0069.coefficient4_187,
  OriginalRow227TriangleData0069.coefficient4_188,
  OriginalRow227TriangleData0069.coefficient4_189,
  OriginalRow227TriangleData0069.coefficient4_190,
  OriginalRow227TriangleData0069.coefficient4_191,
  OriginalRow227TriangleData0069.coefficient4_192,
  OriginalRow227TriangleData0069.coefficient4_193,
  OriginalRow227TriangleData0069.coefficient4_194
]

theorem values0069_size : values0069.size = 32 := rfl

def block0069 : ℕ → Option IntervalDyadic := segment 163 values0069

theorem block0069_domain : ExactDomain block0069 163 195 := by
  simpa only [values0069_size] using segment_domain 163 values0069

theorem block0069_get (i : Fin 32) :
    block0069 (163 + i.val) = some (values0069[i.val]'(by rw [values0069_size]; exact i.isLt)) := by
  exact segment_get 163 values0069 ⟨i.val, by rw [values0069_size]; exact i.isLt⟩

def values0070 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0070.coefficient4_195,
  OriginalRow227TriangleData0070.coefficient4_196,
  OriginalRow227TriangleData0070.coefficient4_197,
  OriginalRow227TriangleData0070.coefficient4_198,
  OriginalRow227TriangleData0070.coefficient4_199,
  OriginalRow227TriangleData0070.coefficient4_200,
  OriginalRow227TriangleData0070.coefficient4_201,
  OriginalRow227TriangleData0070.coefficient4_202,
  OriginalRow227TriangleData0070.coefficient4_203,
  OriginalRow227TriangleData0070.coefficient4_204,
  OriginalRow227TriangleData0070.coefficient4_205,
  OriginalRow227TriangleData0070.coefficient4_206,
  OriginalRow227TriangleData0070.coefficient4_207,
  OriginalRow227TriangleData0070.coefficient4_208,
  OriginalRow227TriangleData0070.coefficient4_209,
  OriginalRow227TriangleData0070.coefficient4_210,
  OriginalRow227TriangleData0070.coefficient4_211,
  OriginalRow227TriangleData0070.coefficient4_212,
  OriginalRow227TriangleData0070.coefficient4_213,
  OriginalRow227TriangleData0070.coefficient4_214,
  OriginalRow227TriangleData0070.coefficient4_215,
  OriginalRow227TriangleData0070.coefficient4_216,
  OriginalRow227TriangleData0070.coefficient4_217,
  OriginalRow227TriangleData0070.coefficient4_218,
  OriginalRow227TriangleData0070.coefficient4_219,
  OriginalRow227TriangleData0070.coefficient4_220,
  OriginalRow227TriangleData0070.coefficient4_221,
  OriginalRow227TriangleData0070.coefficient4_222,
  OriginalRow227TriangleData0070.coefficient4_223,
  OriginalRow227TriangleData0070.coefficient4_224,
  OriginalRow227TriangleData0070.coefficient4_225,
  OriginalRow227TriangleData0070.coefficient4_226
]

theorem values0070_size : values0070.size = 32 := rfl

def block0070 : ℕ → Option IntervalDyadic := segment 195 values0070

theorem block0070_domain : ExactDomain block0070 195 227 := by
  simpa only [values0070_size] using segment_domain 195 values0070

theorem block0070_get (i : Fin 32) :
    block0070 (195 + i.val) = some (values0070[i.val]'(by rw [values0070_size]; exact i.isLt)) := by
  exact segment_get 195 values0070 ⟨i.val, by rw [values0070_size]; exact i.isLt⟩

def values0071 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0071.coefficient4_227,
  OriginalRow227TriangleData0071.coefficient4_228,
  OriginalRow227TriangleData0071.coefficient4_229,
  OriginalRow227TriangleData0071.coefficient4_230,
  OriginalRow227TriangleData0071.coefficient4_231,
  OriginalRow227TriangleData0071.coefficient4_232,
  OriginalRow227TriangleData0071.coefficient4_233,
  OriginalRow227TriangleData0071.coefficient4_234,
  OriginalRow227TriangleData0071.coefficient4_235,
  OriginalRow227TriangleData0071.coefficient4_236,
  OriginalRow227TriangleData0071.coefficient4_237,
  OriginalRow227TriangleData0071.coefficient4_238,
  OriginalRow227TriangleData0071.coefficient4_239,
  OriginalRow227TriangleData0071.coefficient4_240,
  OriginalRow227TriangleData0071.coefficient4_241,
  OriginalRow227TriangleData0071.coefficient4_242,
  OriginalRow227TriangleData0071.coefficient4_243,
  OriginalRow227TriangleData0071.coefficient4_244,
  OriginalRow227TriangleData0071.coefficient4_245,
  OriginalRow227TriangleData0071.coefficient4_246,
  OriginalRow227TriangleData0071.coefficient4_247,
  OriginalRow227TriangleData0071.coefficient4_248,
  OriginalRow227TriangleData0071.coefficient4_249,
  OriginalRow227TriangleData0071.coefficient4_250,
  OriginalRow227TriangleData0071.coefficient4_251,
  OriginalRow227TriangleData0071.coefficient4_252,
  OriginalRow227TriangleData0071.coefficient4_253,
  OriginalRow227TriangleData0071.coefficient4_254,
  OriginalRow227TriangleData0071.coefficient4_255,
  OriginalRow227TriangleData0071.coefficient4_256,
  OriginalRow227TriangleData0071.coefficient4_257,
  OriginalRow227TriangleData0071.coefficient4_258
]

theorem values0071_size : values0071.size = 32 := rfl

def block0071 : ℕ → Option IntervalDyadic := segment 227 values0071

theorem block0071_domain : ExactDomain block0071 227 259 := by
  simpa only [values0071_size] using segment_domain 227 values0071

theorem block0071_get (i : Fin 32) :
    block0071 (227 + i.val) = some (values0071[i.val]'(by rw [values0071_size]; exact i.isLt)) := by
  exact segment_get 227 values0071 ⟨i.val, by rw [values0071_size]; exact i.isLt⟩

def values0072 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0072.coefficient4_259,
  OriginalRow227TriangleData0072.coefficient4_260,
  OriginalRow227TriangleData0072.coefficient4_261,
  OriginalRow227TriangleData0072.coefficient4_262,
  OriginalRow227TriangleData0072.coefficient4_263,
  OriginalRow227TriangleData0072.coefficient4_264,
  OriginalRow227TriangleData0072.coefficient4_265,
  OriginalRow227TriangleData0072.coefficient4_266,
  OriginalRow227TriangleData0072.coefficient4_267,
  OriginalRow227TriangleData0072.coefficient4_268,
  OriginalRow227TriangleData0072.coefficient4_269,
  OriginalRow227TriangleData0072.coefficient4_270,
  OriginalRow227TriangleData0072.coefficient4_271,
  OriginalRow227TriangleData0072.coefficient4_272,
  OriginalRow227TriangleData0072.coefficient4_273,
  OriginalRow227TriangleData0072.coefficient4_274,
  OriginalRow227TriangleData0072.coefficient4_275,
  OriginalRow227TriangleData0072.coefficient4_276,
  OriginalRow227TriangleData0072.coefficient4_277,
  OriginalRow227TriangleData0072.coefficient4_278,
  OriginalRow227TriangleData0072.coefficient4_279,
  OriginalRow227TriangleData0072.coefficient4_280,
  OriginalRow227TriangleData0072.coefficient4_281,
  OriginalRow227TriangleData0072.coefficient4_282,
  OriginalRow227TriangleData0072.coefficient4_283,
  OriginalRow227TriangleData0072.coefficient4_284,
  OriginalRow227TriangleData0072.coefficient4_285,
  OriginalRow227TriangleData0072.coefficient4_286,
  OriginalRow227TriangleData0072.coefficient4_287,
  OriginalRow227TriangleData0072.coefficient4_288,
  OriginalRow227TriangleData0072.coefficient4_289,
  OriginalRow227TriangleData0072.coefficient4_290
]

theorem values0072_size : values0072.size = 32 := rfl

def block0072 : ℕ → Option IntervalDyadic := segment 259 values0072

theorem block0072_domain : ExactDomain block0072 259 291 := by
  simpa only [values0072_size] using segment_domain 259 values0072

theorem block0072_get (i : Fin 32) :
    block0072 (259 + i.val) = some (values0072[i.val]'(by rw [values0072_size]; exact i.isLt)) := by
  exact segment_get 259 values0072 ⟨i.val, by rw [values0072_size]; exact i.isLt⟩

def values0073 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0073.coefficient4_291,
  OriginalRow227TriangleData0073.coefficient4_292,
  OriginalRow227TriangleData0073.coefficient4_293,
  OriginalRow227TriangleData0073.coefficient4_294,
  OriginalRow227TriangleData0073.coefficient4_295,
  OriginalRow227TriangleData0073.coefficient4_296,
  OriginalRow227TriangleData0073.coefficient4_297,
  OriginalRow227TriangleData0073.coefficient4_298,
  OriginalRow227TriangleData0073.coefficient4_299,
  OriginalRow227TriangleData0073.coefficient4_300,
  OriginalRow227TriangleData0073.coefficient4_301,
  OriginalRow227TriangleData0073.coefficient4_302,
  OriginalRow227TriangleData0073.coefficient4_303,
  OriginalRow227TriangleData0073.coefficient4_304,
  OriginalRow227TriangleData0073.coefficient4_305,
  OriginalRow227TriangleData0073.coefficient4_306,
  OriginalRow227TriangleData0073.coefficient4_307,
  OriginalRow227TriangleData0073.coefficient4_308,
  OriginalRow227TriangleData0073.coefficient4_309,
  OriginalRow227TriangleData0073.coefficient4_310,
  OriginalRow227TriangleData0073.coefficient4_311,
  OriginalRow227TriangleData0073.coefficient4_312,
  OriginalRow227TriangleData0073.coefficient4_313,
  OriginalRow227TriangleData0073.coefficient4_314,
  OriginalRow227TriangleData0073.coefficient4_315,
  OriginalRow227TriangleData0073.coefficient4_316,
  OriginalRow227TriangleData0073.coefficient4_317,
  OriginalRow227TriangleData0073.coefficient4_318,
  OriginalRow227TriangleData0073.coefficient4_319,
  OriginalRow227TriangleData0073.coefficient4_320,
  OriginalRow227TriangleData0073.coefficient4_321,
  OriginalRow227TriangleData0073.coefficient4_322
]

theorem values0073_size : values0073.size = 32 := rfl

def block0073 : ℕ → Option IntervalDyadic := segment 291 values0073

theorem block0073_domain : ExactDomain block0073 291 323 := by
  simpa only [values0073_size] using segment_domain 291 values0073

theorem block0073_get (i : Fin 32) :
    block0073 (291 + i.val) = some (values0073[i.val]'(by rw [values0073_size]; exact i.isLt)) := by
  exact segment_get 291 values0073 ⟨i.val, by rw [values0073_size]; exact i.isLt⟩

def values0074 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0074.coefficient4_323,
  OriginalRow227TriangleData0074.coefficient4_324,
  OriginalRow227TriangleData0074.coefficient4_325,
  OriginalRow227TriangleData0074.coefficient4_326,
  OriginalRow227TriangleData0074.coefficient4_327,
  OriginalRow227TriangleData0074.coefficient4_328,
  OriginalRow227TriangleData0074.coefficient4_329,
  OriginalRow227TriangleData0074.coefficient4_330,
  OriginalRow227TriangleData0074.coefficient4_331,
  OriginalRow227TriangleData0074.coefficient4_332,
  OriginalRow227TriangleData0074.coefficient4_333,
  OriginalRow227TriangleData0074.coefficient4_334,
  OriginalRow227TriangleData0074.coefficient4_335,
  OriginalRow227TriangleData0074.coefficient4_336,
  OriginalRow227TriangleData0074.coefficient4_337,
  OriginalRow227TriangleData0074.coefficient4_338,
  OriginalRow227TriangleData0074.coefficient4_339,
  OriginalRow227TriangleData0074.coefficient4_340,
  OriginalRow227TriangleData0074.coefficient4_341,
  OriginalRow227TriangleData0074.coefficient4_342,
  OriginalRow227TriangleData0074.coefficient4_343,
  OriginalRow227TriangleData0074.coefficient4_344,
  OriginalRow227TriangleData0074.coefficient4_345,
  OriginalRow227TriangleData0074.coefficient4_346,
  OriginalRow227TriangleData0074.coefficient4_347,
  OriginalRow227TriangleData0074.coefficient4_348,
  OriginalRow227TriangleData0074.coefficient4_349,
  OriginalRow227TriangleData0074.coefficient4_350,
  OriginalRow227TriangleData0074.coefficient4_351,
  OriginalRow227TriangleData0074.coefficient4_352,
  OriginalRow227TriangleData0074.coefficient4_353,
  OriginalRow227TriangleData0074.coefficient4_354
]

theorem values0074_size : values0074.size = 32 := rfl

def block0074 : ℕ → Option IntervalDyadic := segment 323 values0074

theorem block0074_domain : ExactDomain block0074 323 355 := by
  simpa only [values0074_size] using segment_domain 323 values0074

theorem block0074_get (i : Fin 32) :
    block0074 (323 + i.val) = some (values0074[i.val]'(by rw [values0074_size]; exact i.isLt)) := by
  exact segment_get 323 values0074 ⟨i.val, by rw [values0074_size]; exact i.isLt⟩

def values0075 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0075.coefficient4_355,
  OriginalRow227TriangleData0075.coefficient4_356,
  OriginalRow227TriangleData0075.coefficient4_357,
  OriginalRow227TriangleData0075.coefficient4_358,
  OriginalRow227TriangleData0075.coefficient4_359,
  OriginalRow227TriangleData0075.coefficient4_360,
  OriginalRow227TriangleData0075.coefficient4_361,
  OriginalRow227TriangleData0075.coefficient4_362,
  OriginalRow227TriangleData0075.coefficient4_363,
  OriginalRow227TriangleData0075.coefficient4_364,
  OriginalRow227TriangleData0075.coefficient4_365,
  OriginalRow227TriangleData0075.coefficient4_366,
  OriginalRow227TriangleData0075.coefficient4_367,
  OriginalRow227TriangleData0075.coefficient4_368,
  OriginalRow227TriangleData0075.coefficient4_369,
  OriginalRow227TriangleData0075.coefficient4_370,
  OriginalRow227TriangleData0075.coefficient4_371,
  OriginalRow227TriangleData0075.coefficient4_372,
  OriginalRow227TriangleData0075.coefficient4_373,
  OriginalRow227TriangleData0075.coefficient4_374,
  OriginalRow227TriangleData0075.coefficient4_375,
  OriginalRow227TriangleData0075.coefficient4_376,
  OriginalRow227TriangleData0075.coefficient4_377,
  OriginalRow227TriangleData0075.coefficient4_378,
  OriginalRow227TriangleData0075.coefficient4_379,
  OriginalRow227TriangleData0075.coefficient4_380,
  OriginalRow227TriangleData0075.coefficient4_381,
  OriginalRow227TriangleData0075.coefficient4_382,
  OriginalRow227TriangleData0075.coefficient4_383,
  OriginalRow227TriangleData0075.coefficient4_384,
  OriginalRow227TriangleData0075.coefficient4_385,
  OriginalRow227TriangleData0075.coefficient4_386
]

theorem values0075_size : values0075.size = 32 := rfl

def block0075 : ℕ → Option IntervalDyadic := segment 355 values0075

theorem block0075_domain : ExactDomain block0075 355 387 := by
  simpa only [values0075_size] using segment_domain 355 values0075

theorem block0075_get (i : Fin 32) :
    block0075 (355 + i.val) = some (values0075[i.val]'(by rw [values0075_size]; exact i.isLt)) := by
  exact segment_get 355 values0075 ⟨i.val, by rw [values0075_size]; exact i.isLt⟩

def values0076 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0076.coefficient4_387,
  OriginalRow227TriangleData0076.coefficient4_388,
  OriginalRow227TriangleData0076.coefficient4_389,
  OriginalRow227TriangleData0076.coefficient4_390,
  OriginalRow227TriangleData0076.coefficient4_391,
  OriginalRow227TriangleData0076.coefficient4_392,
  OriginalRow227TriangleData0076.coefficient4_393,
  OriginalRow227TriangleData0076.coefficient4_394,
  OriginalRow227TriangleData0076.coefficient4_395,
  OriginalRow227TriangleData0076.coefficient4_396,
  OriginalRow227TriangleData0076.coefficient4_397,
  OriginalRow227TriangleData0076.coefficient4_398,
  OriginalRow227TriangleData0076.coefficient4_399,
  OriginalRow227TriangleData0076.coefficient4_400,
  OriginalRow227TriangleData0076.coefficient4_401,
  OriginalRow227TriangleData0076.coefficient4_402,
  OriginalRow227TriangleData0076.coefficient4_403,
  OriginalRow227TriangleData0076.coefficient4_404,
  OriginalRow227TriangleData0076.coefficient4_405,
  OriginalRow227TriangleData0076.coefficient4_406,
  OriginalRow227TriangleData0076.coefficient4_407,
  OriginalRow227TriangleData0076.coefficient4_408,
  OriginalRow227TriangleData0076.coefficient4_409,
  OriginalRow227TriangleData0076.coefficient4_410,
  OriginalRow227TriangleData0076.coefficient4_411,
  OriginalRow227TriangleData0076.coefficient4_412,
  OriginalRow227TriangleData0076.coefficient4_413,
  OriginalRow227TriangleData0076.coefficient4_414,
  OriginalRow227TriangleData0076.coefficient4_415,
  OriginalRow227TriangleData0076.coefficient4_416,
  OriginalRow227TriangleData0076.coefficient4_417,
  OriginalRow227TriangleData0076.coefficient4_418
]

theorem values0076_size : values0076.size = 32 := rfl

def block0076 : ℕ → Option IntervalDyadic := segment 387 values0076

theorem block0076_domain : ExactDomain block0076 387 419 := by
  simpa only [values0076_size] using segment_domain 387 values0076

theorem block0076_get (i : Fin 32) :
    block0076 (387 + i.val) = some (values0076[i.val]'(by rw [values0076_size]; exact i.isLt)) := by
  exact segment_get 387 values0076 ⟨i.val, by rw [values0076_size]; exact i.isLt⟩

def values0077 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0077.coefficient4_419,
  OriginalRow227TriangleData0077.coefficient4_420,
  OriginalRow227TriangleData0077.coefficient4_421,
  OriginalRow227TriangleData0077.coefficient4_422,
  OriginalRow227TriangleData0077.coefficient4_423,
  OriginalRow227TriangleData0077.coefficient4_424,
  OriginalRow227TriangleData0077.coefficient4_425,
  OriginalRow227TriangleData0077.coefficient4_426,
  OriginalRow227TriangleData0077.coefficient4_427,
  OriginalRow227TriangleData0077.coefficient4_428,
  OriginalRow227TriangleData0077.coefficient4_429,
  OriginalRow227TriangleData0077.coefficient4_430,
  OriginalRow227TriangleData0077.coefficient4_431,
  OriginalRow227TriangleData0077.coefficient4_432,
  OriginalRow227TriangleData0077.coefficient4_433,
  OriginalRow227TriangleData0077.coefficient4_434,
  OriginalRow227TriangleData0077.coefficient4_435,
  OriginalRow227TriangleData0077.coefficient4_436,
  OriginalRow227TriangleData0077.coefficient4_437,
  OriginalRow227TriangleData0077.coefficient4_438,
  OriginalRow227TriangleData0077.coefficient4_439,
  OriginalRow227TriangleData0077.coefficient4_440,
  OriginalRow227TriangleData0077.coefficient4_441,
  OriginalRow227TriangleData0077.coefficient4_442,
  OriginalRow227TriangleData0077.coefficient4_443,
  OriginalRow227TriangleData0077.coefficient4_444,
  OriginalRow227TriangleData0077.coefficient4_445,
  OriginalRow227TriangleData0077.coefficient4_446,
  OriginalRow227TriangleData0077.coefficient4_447,
  OriginalRow227TriangleData0077.coefficient4_448,
  OriginalRow227TriangleData0077.coefficient4_449,
  OriginalRow227TriangleData0077.coefficient4_450
]

theorem values0077_size : values0077.size = 32 := rfl

def block0077 : ℕ → Option IntervalDyadic := segment 419 values0077

theorem block0077_domain : ExactDomain block0077 419 451 := by
  simpa only [values0077_size] using segment_domain 419 values0077

theorem block0077_get (i : Fin 32) :
    block0077 (419 + i.val) = some (values0077[i.val]'(by rw [values0077_size]; exact i.isLt)) := by
  exact segment_get 419 values0077 ⟨i.val, by rw [values0077_size]; exact i.isLt⟩

def values0078 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0078.coefficient4_451,
  OriginalRow227TriangleData0078.coefficient4_452,
  OriginalRow227TriangleData0078.coefficient4_453,
  OriginalRow227TriangleData0078.coefficient4_454,
  OriginalRow227TriangleData0078.coefficient4_455,
  OriginalRow227TriangleData0078.coefficient4_456,
  OriginalRow227TriangleData0078.coefficient4_457,
  OriginalRow227TriangleData0078.coefficient4_458,
  OriginalRow227TriangleData0078.coefficient4_459,
  OriginalRow227TriangleData0078.coefficient4_460,
  OriginalRow227TriangleData0078.coefficient4_461,
  OriginalRow227TriangleData0078.coefficient4_462,
  OriginalRow227TriangleData0078.coefficient4_463,
  OriginalRow227TriangleData0078.coefficient4_464,
  OriginalRow227TriangleData0078.coefficient4_465,
  OriginalRow227TriangleData0078.coefficient4_466,
  OriginalRow227TriangleData0078.coefficient4_467,
  OriginalRow227TriangleData0078.coefficient4_468,
  OriginalRow227TriangleData0078.coefficient4_469,
  OriginalRow227TriangleData0078.coefficient4_470,
  OriginalRow227TriangleData0078.coefficient4_471,
  OriginalRow227TriangleData0078.coefficient4_472,
  OriginalRow227TriangleData0078.coefficient4_473,
  OriginalRow227TriangleData0078.coefficient4_474,
  OriginalRow227TriangleData0078.coefficient4_475,
  OriginalRow227TriangleData0078.coefficient4_476,
  OriginalRow227TriangleData0078.coefficient4_477,
  OriginalRow227TriangleData0078.coefficient4_478,
  OriginalRow227TriangleData0078.coefficient4_479,
  OriginalRow227TriangleData0078.coefficient4_480,
  OriginalRow227TriangleData0078.coefficient4_481,
  OriginalRow227TriangleData0078.coefficient4_482
]

theorem values0078_size : values0078.size = 32 := rfl

def block0078 : ℕ → Option IntervalDyadic := segment 451 values0078

theorem block0078_domain : ExactDomain block0078 451 483 := by
  simpa only [values0078_size] using segment_domain 451 values0078

theorem block0078_get (i : Fin 32) :
    block0078 (451 + i.val) = some (values0078[i.val]'(by rw [values0078_size]; exact i.isLt)) := by
  exact segment_get 451 values0078 ⟨i.val, by rw [values0078_size]; exact i.isLt⟩

def values0079 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0079.coefficient4_483,
  OriginalRow227TriangleData0079.coefficient4_484,
  OriginalRow227TriangleData0079.coefficient4_485,
  OriginalRow227TriangleData0079.coefficient4_486,
  OriginalRow227TriangleData0079.coefficient4_487,
  OriginalRow227TriangleData0079.coefficient4_488,
  OriginalRow227TriangleData0079.coefficient4_489,
  OriginalRow227TriangleData0079.coefficient4_490,
  OriginalRow227TriangleData0079.coefficient4_491,
  OriginalRow227TriangleData0079.coefficient4_492,
  OriginalRow227TriangleData0079.coefficient4_493,
  OriginalRow227TriangleData0079.coefficient4_494,
  OriginalRow227TriangleData0079.coefficient4_495,
  OriginalRow227TriangleData0079.coefficient4_496,
  OriginalRow227TriangleData0079.coefficient4_497
]

theorem values0079_size : values0079.size = 15 := rfl

def block0079 : ℕ → Option IntervalDyadic := segment 483 values0079

theorem block0079_domain : ExactDomain block0079 483 498 := by
  simpa only [values0079_size] using segment_domain 483 values0079

theorem block0079_get (i : Fin 15) :
    block0079 (483 + i.val) = some (values0079[i.val]'(by rw [values0079_size]; exact i.isLt)) := by
  exact segment_get 483 values0079 ⟨i.val, by rw [values0079_size]; exact i.isLt⟩

def node0003_0067 : ℕ → Option IntervalDyadic := split 35 block0064 block0065

theorem node0003_0067_domain : ExactDomain node0003_0067 3 67 := by
  exact split_domain (by decide) (by decide) block0064_domain block0065_domain

def node0067_0131 : ℕ → Option IntervalDyadic := split 99 block0066 block0067

theorem node0067_0131_domain : ExactDomain node0067_0131 67 131 := by
  exact split_domain (by decide) (by decide) block0066_domain block0067_domain

def node0003_0131 : ℕ → Option IntervalDyadic := split 67 node0003_0067 node0067_0131

theorem node0003_0131_domain : ExactDomain node0003_0131 3 131 := by
  exact split_domain (by decide) (by decide) node0003_0067_domain node0067_0131_domain

def node0131_0195 : ℕ → Option IntervalDyadic := split 163 block0068 block0069

theorem node0131_0195_domain : ExactDomain node0131_0195 131 195 := by
  exact split_domain (by decide) (by decide) block0068_domain block0069_domain

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block0070 block0071

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block0070_domain block0071_domain

def node0131_0259 : ℕ → Option IntervalDyadic := split 195 node0131_0195 node0195_0259

theorem node0131_0259_domain : ExactDomain node0131_0259 131 259 := by
  exact split_domain (by decide) (by decide) node0131_0195_domain node0195_0259_domain

def node0003_0259 : ℕ → Option IntervalDyadic := split 131 node0003_0131 node0131_0259

theorem node0003_0259_domain : ExactDomain node0003_0259 3 259 := by
  exact split_domain (by decide) (by decide) node0003_0131_domain node0131_0259_domain

def node0259_0323 : ℕ → Option IntervalDyadic := split 291 block0072 block0073

theorem node0259_0323_domain : ExactDomain node0259_0323 259 323 := by
  exact split_domain (by decide) (by decide) block0072_domain block0073_domain

def node0323_0387 : ℕ → Option IntervalDyadic := split 355 block0074 block0075

theorem node0323_0387_domain : ExactDomain node0323_0387 323 387 := by
  exact split_domain (by decide) (by decide) block0074_domain block0075_domain

def node0259_0387 : ℕ → Option IntervalDyadic := split 323 node0259_0323 node0323_0387

theorem node0259_0387_domain : ExactDomain node0259_0387 259 387 := by
  exact split_domain (by decide) (by decide) node0259_0323_domain node0323_0387_domain

def node0387_0451 : ℕ → Option IntervalDyadic := split 419 block0076 block0077

theorem node0387_0451_domain : ExactDomain node0387_0451 387 451 := by
  exact split_domain (by decide) (by decide) block0076_domain block0077_domain

def node0451_0498 : ℕ → Option IntervalDyadic := split 483 block0078 block0079

theorem node0451_0498_domain : ExactDomain node0451_0498 451 498 := by
  exact split_domain (by decide) (by decide) block0078_domain block0079_domain

def node0387_0498 : ℕ → Option IntervalDyadic := split 451 node0387_0451 node0451_0498

theorem node0387_0498_domain : ExactDomain node0387_0498 387 498 := by
  exact split_domain (by decide) (by decide) node0387_0451_domain node0451_0498_domain

def node0259_0498 : ℕ → Option IntervalDyadic := split 387 node0259_0387 node0387_0498

theorem node0259_0498_domain : ExactDomain node0259_0498 259 498 := by
  exact split_domain (by decide) (by decide) node0259_0387_domain node0387_0498_domain

def node0003_0498 : ℕ → Option IntervalDyadic := split 259 node0003_0259 node0259_0498

theorem node0003_0498_domain : ExactDomain node0003_0498 3 498 := by
  exact split_domain (by decide) (by decide) node0003_0259_domain node0259_0498_domain

def lookup : ℕ → Option IntervalDyadic := node0003_0498

theorem lookup_domain : ExactDomain lookup 3 498 :=
  node0003_0498_domain

theorem block0064_lookup (i : Fin 32) :
    lookup (3 + i.val) = some (values0064[i.val]'(by rw [values0064_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (3 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_left 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0003_0131, split_left 67 node0003_0067 node0067_0131 (by omega)]
  rw [node0003_0067, split_left 35 block0064 block0065 (by omega)]
  exact block0064_get i

theorem block0065_lookup (i : Fin 32) :
    lookup (35 + i.val) = some (values0065[i.val]'(by rw [values0065_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (35 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_left 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0003_0131, split_left 67 node0003_0067 node0067_0131 (by omega)]
  rw [node0003_0067, split_right 35 block0064 block0065 (by omega)]
  exact block0065_get i

theorem block0066_lookup (i : Fin 32) :
    lookup (67 + i.val) = some (values0066[i.val]'(by rw [values0066_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (67 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_left 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0003_0131, split_right 67 node0003_0067 node0067_0131 (by omega)]
  rw [node0067_0131, split_left 99 block0066 block0067 (by omega)]
  exact block0066_get i

theorem block0067_lookup (i : Fin 32) :
    lookup (99 + i.val) = some (values0067[i.val]'(by rw [values0067_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (99 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_left 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0003_0131, split_right 67 node0003_0067 node0067_0131 (by omega)]
  rw [node0067_0131, split_right 99 block0066 block0067 (by omega)]
  exact block0067_get i

theorem block0068_lookup (i : Fin 32) :
    lookup (131 + i.val) = some (values0068[i.val]'(by rw [values0068_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (131 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_right 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_left 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0131_0195, split_left 163 block0068 block0069 (by omega)]
  exact block0068_get i

theorem block0069_lookup (i : Fin 32) :
    lookup (163 + i.val) = some (values0069[i.val]'(by rw [values0069_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (163 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_right 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_left 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0131_0195, split_right 163 block0068 block0069 (by omega)]
  exact block0069_get i

theorem block0070_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values0070[i.val]'(by rw [values0070_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (195 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_right 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_right 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0195_0259, split_left 227 block0070 block0071 (by omega)]
  exact block0070_get i

theorem block0071_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values0071[i.val]'(by rw [values0071_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (227 + i.val) = _
  rw [node0003_0498, split_left 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0003_0259, split_right 131 node0003_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_right 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0195_0259, split_right 227 block0070 block0071 (by omega)]
  exact block0071_get i

theorem block0072_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values0072[i.val]'(by rw [values0072_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (259 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_left 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0259_0387, split_left 323 node0259_0323 node0323_0387 (by omega)]
  rw [node0259_0323, split_left 291 block0072 block0073 (by omega)]
  exact block0072_get i

theorem block0073_lookup (i : Fin 32) :
    lookup (291 + i.val) = some (values0073[i.val]'(by rw [values0073_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (291 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_left 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0259_0387, split_left 323 node0259_0323 node0323_0387 (by omega)]
  rw [node0259_0323, split_right 291 block0072 block0073 (by omega)]
  exact block0073_get i

theorem block0074_lookup (i : Fin 32) :
    lookup (323 + i.val) = some (values0074[i.val]'(by rw [values0074_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (323 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_left 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0259_0387, split_right 323 node0259_0323 node0323_0387 (by omega)]
  rw [node0323_0387, split_left 355 block0074 block0075 (by omega)]
  exact block0074_get i

theorem block0075_lookup (i : Fin 32) :
    lookup (355 + i.val) = some (values0075[i.val]'(by rw [values0075_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (355 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_left 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0259_0387, split_right 323 node0259_0323 node0323_0387 (by omega)]
  rw [node0323_0387, split_right 355 block0074 block0075 (by omega)]
  exact block0075_get i

theorem block0076_lookup (i : Fin 32) :
    lookup (387 + i.val) = some (values0076[i.val]'(by rw [values0076_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (387 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_right 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0387_0498, split_left 451 node0387_0451 node0451_0498 (by omega)]
  rw [node0387_0451, split_left 419 block0076 block0077 (by omega)]
  exact block0076_get i

theorem block0077_lookup (i : Fin 32) :
    lookup (419 + i.val) = some (values0077[i.val]'(by rw [values0077_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (419 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_right 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0387_0498, split_left 451 node0387_0451 node0451_0498 (by omega)]
  rw [node0387_0451, split_right 419 block0076 block0077 (by omega)]
  exact block0077_get i

theorem block0078_lookup (i : Fin 32) :
    lookup (451 + i.val) = some (values0078[i.val]'(by rw [values0078_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (451 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_right 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0387_0498, split_right 451 node0387_0451 node0451_0498 (by omega)]
  rw [node0451_0498, split_left 483 block0078 block0079 (by omega)]
  exact block0078_get i

theorem block0079_lookup (i : Fin 15) :
    lookup (483 + i.val) = some (values0079[i.val]'(by rw [values0079_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0003_0498 (483 + i.val) = _
  rw [node0003_0498, split_right 259 node0003_0259 node0259_0498 (by omega)]
  rw [node0259_0498, split_right 387 node0259_0387 node0387_0498 (by omega)]
  rw [node0387_0498, split_right 451 node0387_0451 node0451_0498 (by omega)]
  rw [node0451_0498, split_right 483 block0078 block0079 (by omega)]
  exact block0079_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0064_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0064_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0065_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0065_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0066_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0066_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0067_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0067_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0068_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0068_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0069_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0069_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0070_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0070_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0071_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0071_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0072_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0072_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0073_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0073_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0074_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0074_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0075_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0075_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0076_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0076_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0077_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0077_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0078_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0078_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0079_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0079_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0064_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0065_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0066_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0067_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0068_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0069_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0070_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0071_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0072_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0073_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0074_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0075_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0076_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0077_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0078_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow004.block0079_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow004
