import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0128
import Grothe.UpperChaos.OriginalRow227TriangleData0129
import Grothe.UpperChaos.OriginalRow227TriangleData0130
import Grothe.UpperChaos.OriginalRow227TriangleData0131
import Grothe.UpperChaos.OriginalRow227TriangleData0132
import Grothe.UpperChaos.OriginalRow227TriangleData0133
import Grothe.UpperChaos.OriginalRow227TriangleData0134
import Grothe.UpperChaos.OriginalRow227TriangleData0135
import Grothe.UpperChaos.OriginalRow227TriangleData0136
import Grothe.UpperChaos.OriginalRow227TriangleData0137
import Grothe.UpperChaos.OriginalRow227TriangleData0138
import Grothe.UpperChaos.OriginalRow227TriangleData0139
import Grothe.UpperChaos.OriginalRow227TriangleData0140
import Grothe.UpperChaos.OriginalRow227TriangleData0141
import Grothe.UpperChaos.OriginalRow227TriangleData0142
import Grothe.UpperChaos.OriginalRow227TriangleData0143

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow008

open ConditionalTableLookup

def values0128 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0128.coefficient8_7,
  OriginalRow227TriangleData0128.coefficient8_8,
  OriginalRow227TriangleData0128.coefficient8_9,
  OriginalRow227TriangleData0128.coefficient8_10,
  OriginalRow227TriangleData0128.coefficient8_11,
  OriginalRow227TriangleData0128.coefficient8_12,
  OriginalRow227TriangleData0128.coefficient8_13,
  OriginalRow227TriangleData0128.coefficient8_14,
  OriginalRow227TriangleData0128.coefficient8_15,
  OriginalRow227TriangleData0128.coefficient8_16,
  OriginalRow227TriangleData0128.coefficient8_17,
  OriginalRow227TriangleData0128.coefficient8_18,
  OriginalRow227TriangleData0128.coefficient8_19,
  OriginalRow227TriangleData0128.coefficient8_20,
  OriginalRow227TriangleData0128.coefficient8_21,
  OriginalRow227TriangleData0128.coefficient8_22,
  OriginalRow227TriangleData0128.coefficient8_23,
  OriginalRow227TriangleData0128.coefficient8_24,
  OriginalRow227TriangleData0128.coefficient8_25,
  OriginalRow227TriangleData0128.coefficient8_26,
  OriginalRow227TriangleData0128.coefficient8_27,
  OriginalRow227TriangleData0128.coefficient8_28,
  OriginalRow227TriangleData0128.coefficient8_29,
  OriginalRow227TriangleData0128.coefficient8_30,
  OriginalRow227TriangleData0128.coefficient8_31,
  OriginalRow227TriangleData0128.coefficient8_32,
  OriginalRow227TriangleData0128.coefficient8_33,
  OriginalRow227TriangleData0128.coefficient8_34,
  OriginalRow227TriangleData0128.coefficient8_35,
  OriginalRow227TriangleData0128.coefficient8_36,
  OriginalRow227TriangleData0128.coefficient8_37,
  OriginalRow227TriangleData0128.coefficient8_38
]

theorem values0128_size : values0128.size = 32 := rfl

def block0128 : ℕ → Option IntervalDyadic := segment 7 values0128

theorem block0128_domain : ExactDomain block0128 7 39 := by
  simpa only [values0128_size] using segment_domain 7 values0128

theorem block0128_get (i : Fin 32) :
    block0128 (7 + i.val) = some (values0128[i.val]'(by rw [values0128_size]; exact i.isLt)) := by
  exact segment_get 7 values0128 ⟨i.val, by rw [values0128_size]; exact i.isLt⟩

def values0129 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0129.coefficient8_39,
  OriginalRow227TriangleData0129.coefficient8_40,
  OriginalRow227TriangleData0129.coefficient8_41,
  OriginalRow227TriangleData0129.coefficient8_42,
  OriginalRow227TriangleData0129.coefficient8_43,
  OriginalRow227TriangleData0129.coefficient8_44,
  OriginalRow227TriangleData0129.coefficient8_45,
  OriginalRow227TriangleData0129.coefficient8_46,
  OriginalRow227TriangleData0129.coefficient8_47,
  OriginalRow227TriangleData0129.coefficient8_48,
  OriginalRow227TriangleData0129.coefficient8_49,
  OriginalRow227TriangleData0129.coefficient8_50,
  OriginalRow227TriangleData0129.coefficient8_51,
  OriginalRow227TriangleData0129.coefficient8_52,
  OriginalRow227TriangleData0129.coefficient8_53,
  OriginalRow227TriangleData0129.coefficient8_54,
  OriginalRow227TriangleData0129.coefficient8_55,
  OriginalRow227TriangleData0129.coefficient8_56,
  OriginalRow227TriangleData0129.coefficient8_57,
  OriginalRow227TriangleData0129.coefficient8_58,
  OriginalRow227TriangleData0129.coefficient8_59,
  OriginalRow227TriangleData0129.coefficient8_60,
  OriginalRow227TriangleData0129.coefficient8_61,
  OriginalRow227TriangleData0129.coefficient8_62,
  OriginalRow227TriangleData0129.coefficient8_63,
  OriginalRow227TriangleData0129.coefficient8_64,
  OriginalRow227TriangleData0129.coefficient8_65,
  OriginalRow227TriangleData0129.coefficient8_66,
  OriginalRow227TriangleData0129.coefficient8_67,
  OriginalRow227TriangleData0129.coefficient8_68,
  OriginalRow227TriangleData0129.coefficient8_69,
  OriginalRow227TriangleData0129.coefficient8_70
]

theorem values0129_size : values0129.size = 32 := rfl

def block0129 : ℕ → Option IntervalDyadic := segment 39 values0129

theorem block0129_domain : ExactDomain block0129 39 71 := by
  simpa only [values0129_size] using segment_domain 39 values0129

theorem block0129_get (i : Fin 32) :
    block0129 (39 + i.val) = some (values0129[i.val]'(by rw [values0129_size]; exact i.isLt)) := by
  exact segment_get 39 values0129 ⟨i.val, by rw [values0129_size]; exact i.isLt⟩

def values0130 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0130.coefficient8_71,
  OriginalRow227TriangleData0130.coefficient8_72,
  OriginalRow227TriangleData0130.coefficient8_73,
  OriginalRow227TriangleData0130.coefficient8_74,
  OriginalRow227TriangleData0130.coefficient8_75,
  OriginalRow227TriangleData0130.coefficient8_76,
  OriginalRow227TriangleData0130.coefficient8_77,
  OriginalRow227TriangleData0130.coefficient8_78,
  OriginalRow227TriangleData0130.coefficient8_79,
  OriginalRow227TriangleData0130.coefficient8_80,
  OriginalRow227TriangleData0130.coefficient8_81,
  OriginalRow227TriangleData0130.coefficient8_82,
  OriginalRow227TriangleData0130.coefficient8_83,
  OriginalRow227TriangleData0130.coefficient8_84,
  OriginalRow227TriangleData0130.coefficient8_85,
  OriginalRow227TriangleData0130.coefficient8_86,
  OriginalRow227TriangleData0130.coefficient8_87,
  OriginalRow227TriangleData0130.coefficient8_88,
  OriginalRow227TriangleData0130.coefficient8_89,
  OriginalRow227TriangleData0130.coefficient8_90,
  OriginalRow227TriangleData0130.coefficient8_91,
  OriginalRow227TriangleData0130.coefficient8_92,
  OriginalRow227TriangleData0130.coefficient8_93,
  OriginalRow227TriangleData0130.coefficient8_94,
  OriginalRow227TriangleData0130.coefficient8_95,
  OriginalRow227TriangleData0130.coefficient8_96,
  OriginalRow227TriangleData0130.coefficient8_97,
  OriginalRow227TriangleData0130.coefficient8_98,
  OriginalRow227TriangleData0130.coefficient8_99,
  OriginalRow227TriangleData0130.coefficient8_100,
  OriginalRow227TriangleData0130.coefficient8_101,
  OriginalRow227TriangleData0130.coefficient8_102
]

theorem values0130_size : values0130.size = 32 := rfl

def block0130 : ℕ → Option IntervalDyadic := segment 71 values0130

theorem block0130_domain : ExactDomain block0130 71 103 := by
  simpa only [values0130_size] using segment_domain 71 values0130

theorem block0130_get (i : Fin 32) :
    block0130 (71 + i.val) = some (values0130[i.val]'(by rw [values0130_size]; exact i.isLt)) := by
  exact segment_get 71 values0130 ⟨i.val, by rw [values0130_size]; exact i.isLt⟩

def values0131 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0131.coefficient8_103,
  OriginalRow227TriangleData0131.coefficient8_104,
  OriginalRow227TriangleData0131.coefficient8_105,
  OriginalRow227TriangleData0131.coefficient8_106,
  OriginalRow227TriangleData0131.coefficient8_107,
  OriginalRow227TriangleData0131.coefficient8_108,
  OriginalRow227TriangleData0131.coefficient8_109,
  OriginalRow227TriangleData0131.coefficient8_110,
  OriginalRow227TriangleData0131.coefficient8_111,
  OriginalRow227TriangleData0131.coefficient8_112,
  OriginalRow227TriangleData0131.coefficient8_113,
  OriginalRow227TriangleData0131.coefficient8_114,
  OriginalRow227TriangleData0131.coefficient8_115,
  OriginalRow227TriangleData0131.coefficient8_116,
  OriginalRow227TriangleData0131.coefficient8_117,
  OriginalRow227TriangleData0131.coefficient8_118,
  OriginalRow227TriangleData0131.coefficient8_119,
  OriginalRow227TriangleData0131.coefficient8_120,
  OriginalRow227TriangleData0131.coefficient8_121,
  OriginalRow227TriangleData0131.coefficient8_122,
  OriginalRow227TriangleData0131.coefficient8_123,
  OriginalRow227TriangleData0131.coefficient8_124,
  OriginalRow227TriangleData0131.coefficient8_125,
  OriginalRow227TriangleData0131.coefficient8_126,
  OriginalRow227TriangleData0131.coefficient8_127,
  OriginalRow227TriangleData0131.coefficient8_128,
  OriginalRow227TriangleData0131.coefficient8_129,
  OriginalRow227TriangleData0131.coefficient8_130,
  OriginalRow227TriangleData0131.coefficient8_131,
  OriginalRow227TriangleData0131.coefficient8_132,
  OriginalRow227TriangleData0131.coefficient8_133,
  OriginalRow227TriangleData0131.coefficient8_134
]

theorem values0131_size : values0131.size = 32 := rfl

def block0131 : ℕ → Option IntervalDyadic := segment 103 values0131

theorem block0131_domain : ExactDomain block0131 103 135 := by
  simpa only [values0131_size] using segment_domain 103 values0131

theorem block0131_get (i : Fin 32) :
    block0131 (103 + i.val) = some (values0131[i.val]'(by rw [values0131_size]; exact i.isLt)) := by
  exact segment_get 103 values0131 ⟨i.val, by rw [values0131_size]; exact i.isLt⟩

def values0132 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0132.coefficient8_135,
  OriginalRow227TriangleData0132.coefficient8_136,
  OriginalRow227TriangleData0132.coefficient8_137,
  OriginalRow227TriangleData0132.coefficient8_138,
  OriginalRow227TriangleData0132.coefficient8_139,
  OriginalRow227TriangleData0132.coefficient8_140,
  OriginalRow227TriangleData0132.coefficient8_141,
  OriginalRow227TriangleData0132.coefficient8_142,
  OriginalRow227TriangleData0132.coefficient8_143,
  OriginalRow227TriangleData0132.coefficient8_144,
  OriginalRow227TriangleData0132.coefficient8_145,
  OriginalRow227TriangleData0132.coefficient8_146,
  OriginalRow227TriangleData0132.coefficient8_147,
  OriginalRow227TriangleData0132.coefficient8_148,
  OriginalRow227TriangleData0132.coefficient8_149,
  OriginalRow227TriangleData0132.coefficient8_150,
  OriginalRow227TriangleData0132.coefficient8_151,
  OriginalRow227TriangleData0132.coefficient8_152,
  OriginalRow227TriangleData0132.coefficient8_153,
  OriginalRow227TriangleData0132.coefficient8_154,
  OriginalRow227TriangleData0132.coefficient8_155,
  OriginalRow227TriangleData0132.coefficient8_156,
  OriginalRow227TriangleData0132.coefficient8_157,
  OriginalRow227TriangleData0132.coefficient8_158,
  OriginalRow227TriangleData0132.coefficient8_159,
  OriginalRow227TriangleData0132.coefficient8_160,
  OriginalRow227TriangleData0132.coefficient8_161,
  OriginalRow227TriangleData0132.coefficient8_162,
  OriginalRow227TriangleData0132.coefficient8_163,
  OriginalRow227TriangleData0132.coefficient8_164,
  OriginalRow227TriangleData0132.coefficient8_165,
  OriginalRow227TriangleData0132.coefficient8_166
]

theorem values0132_size : values0132.size = 32 := rfl

def block0132 : ℕ → Option IntervalDyadic := segment 135 values0132

theorem block0132_domain : ExactDomain block0132 135 167 := by
  simpa only [values0132_size] using segment_domain 135 values0132

theorem block0132_get (i : Fin 32) :
    block0132 (135 + i.val) = some (values0132[i.val]'(by rw [values0132_size]; exact i.isLt)) := by
  exact segment_get 135 values0132 ⟨i.val, by rw [values0132_size]; exact i.isLt⟩

def values0133 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0133.coefficient8_167,
  OriginalRow227TriangleData0133.coefficient8_168,
  OriginalRow227TriangleData0133.coefficient8_169,
  OriginalRow227TriangleData0133.coefficient8_170,
  OriginalRow227TriangleData0133.coefficient8_171,
  OriginalRow227TriangleData0133.coefficient8_172,
  OriginalRow227TriangleData0133.coefficient8_173,
  OriginalRow227TriangleData0133.coefficient8_174,
  OriginalRow227TriangleData0133.coefficient8_175,
  OriginalRow227TriangleData0133.coefficient8_176,
  OriginalRow227TriangleData0133.coefficient8_177,
  OriginalRow227TriangleData0133.coefficient8_178,
  OriginalRow227TriangleData0133.coefficient8_179,
  OriginalRow227TriangleData0133.coefficient8_180,
  OriginalRow227TriangleData0133.coefficient8_181,
  OriginalRow227TriangleData0133.coefficient8_182,
  OriginalRow227TriangleData0133.coefficient8_183,
  OriginalRow227TriangleData0133.coefficient8_184,
  OriginalRow227TriangleData0133.coefficient8_185,
  OriginalRow227TriangleData0133.coefficient8_186,
  OriginalRow227TriangleData0133.coefficient8_187,
  OriginalRow227TriangleData0133.coefficient8_188,
  OriginalRow227TriangleData0133.coefficient8_189,
  OriginalRow227TriangleData0133.coefficient8_190,
  OriginalRow227TriangleData0133.coefficient8_191,
  OriginalRow227TriangleData0133.coefficient8_192,
  OriginalRow227TriangleData0133.coefficient8_193,
  OriginalRow227TriangleData0133.coefficient8_194,
  OriginalRow227TriangleData0133.coefficient8_195,
  OriginalRow227TriangleData0133.coefficient8_196,
  OriginalRow227TriangleData0133.coefficient8_197,
  OriginalRow227TriangleData0133.coefficient8_198
]

theorem values0133_size : values0133.size = 32 := rfl

def block0133 : ℕ → Option IntervalDyadic := segment 167 values0133

theorem block0133_domain : ExactDomain block0133 167 199 := by
  simpa only [values0133_size] using segment_domain 167 values0133

theorem block0133_get (i : Fin 32) :
    block0133 (167 + i.val) = some (values0133[i.val]'(by rw [values0133_size]; exact i.isLt)) := by
  exact segment_get 167 values0133 ⟨i.val, by rw [values0133_size]; exact i.isLt⟩

def values0134 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0134.coefficient8_199,
  OriginalRow227TriangleData0134.coefficient8_200,
  OriginalRow227TriangleData0134.coefficient8_201,
  OriginalRow227TriangleData0134.coefficient8_202,
  OriginalRow227TriangleData0134.coefficient8_203,
  OriginalRow227TriangleData0134.coefficient8_204,
  OriginalRow227TriangleData0134.coefficient8_205,
  OriginalRow227TriangleData0134.coefficient8_206,
  OriginalRow227TriangleData0134.coefficient8_207,
  OriginalRow227TriangleData0134.coefficient8_208,
  OriginalRow227TriangleData0134.coefficient8_209,
  OriginalRow227TriangleData0134.coefficient8_210,
  OriginalRow227TriangleData0134.coefficient8_211,
  OriginalRow227TriangleData0134.coefficient8_212,
  OriginalRow227TriangleData0134.coefficient8_213,
  OriginalRow227TriangleData0134.coefficient8_214,
  OriginalRow227TriangleData0134.coefficient8_215,
  OriginalRow227TriangleData0134.coefficient8_216,
  OriginalRow227TriangleData0134.coefficient8_217,
  OriginalRow227TriangleData0134.coefficient8_218,
  OriginalRow227TriangleData0134.coefficient8_219,
  OriginalRow227TriangleData0134.coefficient8_220,
  OriginalRow227TriangleData0134.coefficient8_221,
  OriginalRow227TriangleData0134.coefficient8_222,
  OriginalRow227TriangleData0134.coefficient8_223,
  OriginalRow227TriangleData0134.coefficient8_224,
  OriginalRow227TriangleData0134.coefficient8_225,
  OriginalRow227TriangleData0134.coefficient8_226,
  OriginalRow227TriangleData0134.coefficient8_227,
  OriginalRow227TriangleData0134.coefficient8_228,
  OriginalRow227TriangleData0134.coefficient8_229,
  OriginalRow227TriangleData0134.coefficient8_230
]

theorem values0134_size : values0134.size = 32 := rfl

def block0134 : ℕ → Option IntervalDyadic := segment 199 values0134

theorem block0134_domain : ExactDomain block0134 199 231 := by
  simpa only [values0134_size] using segment_domain 199 values0134

theorem block0134_get (i : Fin 32) :
    block0134 (199 + i.val) = some (values0134[i.val]'(by rw [values0134_size]; exact i.isLt)) := by
  exact segment_get 199 values0134 ⟨i.val, by rw [values0134_size]; exact i.isLt⟩

def values0135 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0135.coefficient8_231,
  OriginalRow227TriangleData0135.coefficient8_232,
  OriginalRow227TriangleData0135.coefficient8_233,
  OriginalRow227TriangleData0135.coefficient8_234,
  OriginalRow227TriangleData0135.coefficient8_235,
  OriginalRow227TriangleData0135.coefficient8_236,
  OriginalRow227TriangleData0135.coefficient8_237,
  OriginalRow227TriangleData0135.coefficient8_238,
  OriginalRow227TriangleData0135.coefficient8_239,
  OriginalRow227TriangleData0135.coefficient8_240,
  OriginalRow227TriangleData0135.coefficient8_241,
  OriginalRow227TriangleData0135.coefficient8_242,
  OriginalRow227TriangleData0135.coefficient8_243,
  OriginalRow227TriangleData0135.coefficient8_244,
  OriginalRow227TriangleData0135.coefficient8_245,
  OriginalRow227TriangleData0135.coefficient8_246,
  OriginalRow227TriangleData0135.coefficient8_247,
  OriginalRow227TriangleData0135.coefficient8_248,
  OriginalRow227TriangleData0135.coefficient8_249,
  OriginalRow227TriangleData0135.coefficient8_250,
  OriginalRow227TriangleData0135.coefficient8_251,
  OriginalRow227TriangleData0135.coefficient8_252,
  OriginalRow227TriangleData0135.coefficient8_253,
  OriginalRow227TriangleData0135.coefficient8_254,
  OriginalRow227TriangleData0135.coefficient8_255,
  OriginalRow227TriangleData0135.coefficient8_256,
  OriginalRow227TriangleData0135.coefficient8_257,
  OriginalRow227TriangleData0135.coefficient8_258,
  OriginalRow227TriangleData0135.coefficient8_259,
  OriginalRow227TriangleData0135.coefficient8_260,
  OriginalRow227TriangleData0135.coefficient8_261,
  OriginalRow227TriangleData0135.coefficient8_262
]

theorem values0135_size : values0135.size = 32 := rfl

def block0135 : ℕ → Option IntervalDyadic := segment 231 values0135

theorem block0135_domain : ExactDomain block0135 231 263 := by
  simpa only [values0135_size] using segment_domain 231 values0135

theorem block0135_get (i : Fin 32) :
    block0135 (231 + i.val) = some (values0135[i.val]'(by rw [values0135_size]; exact i.isLt)) := by
  exact segment_get 231 values0135 ⟨i.val, by rw [values0135_size]; exact i.isLt⟩

def values0136 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0136.coefficient8_263,
  OriginalRow227TriangleData0136.coefficient8_264,
  OriginalRow227TriangleData0136.coefficient8_265,
  OriginalRow227TriangleData0136.coefficient8_266,
  OriginalRow227TriangleData0136.coefficient8_267,
  OriginalRow227TriangleData0136.coefficient8_268,
  OriginalRow227TriangleData0136.coefficient8_269,
  OriginalRow227TriangleData0136.coefficient8_270,
  OriginalRow227TriangleData0136.coefficient8_271,
  OriginalRow227TriangleData0136.coefficient8_272,
  OriginalRow227TriangleData0136.coefficient8_273,
  OriginalRow227TriangleData0136.coefficient8_274,
  OriginalRow227TriangleData0136.coefficient8_275,
  OriginalRow227TriangleData0136.coefficient8_276,
  OriginalRow227TriangleData0136.coefficient8_277,
  OriginalRow227TriangleData0136.coefficient8_278,
  OriginalRow227TriangleData0136.coefficient8_279,
  OriginalRow227TriangleData0136.coefficient8_280,
  OriginalRow227TriangleData0136.coefficient8_281,
  OriginalRow227TriangleData0136.coefficient8_282,
  OriginalRow227TriangleData0136.coefficient8_283,
  OriginalRow227TriangleData0136.coefficient8_284,
  OriginalRow227TriangleData0136.coefficient8_285,
  OriginalRow227TriangleData0136.coefficient8_286,
  OriginalRow227TriangleData0136.coefficient8_287,
  OriginalRow227TriangleData0136.coefficient8_288,
  OriginalRow227TriangleData0136.coefficient8_289,
  OriginalRow227TriangleData0136.coefficient8_290,
  OriginalRow227TriangleData0136.coefficient8_291,
  OriginalRow227TriangleData0136.coefficient8_292,
  OriginalRow227TriangleData0136.coefficient8_293,
  OriginalRow227TriangleData0136.coefficient8_294
]

theorem values0136_size : values0136.size = 32 := rfl

def block0136 : ℕ → Option IntervalDyadic := segment 263 values0136

theorem block0136_domain : ExactDomain block0136 263 295 := by
  simpa only [values0136_size] using segment_domain 263 values0136

theorem block0136_get (i : Fin 32) :
    block0136 (263 + i.val) = some (values0136[i.val]'(by rw [values0136_size]; exact i.isLt)) := by
  exact segment_get 263 values0136 ⟨i.val, by rw [values0136_size]; exact i.isLt⟩

def values0137 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0137.coefficient8_295,
  OriginalRow227TriangleData0137.coefficient8_296,
  OriginalRow227TriangleData0137.coefficient8_297,
  OriginalRow227TriangleData0137.coefficient8_298,
  OriginalRow227TriangleData0137.coefficient8_299,
  OriginalRow227TriangleData0137.coefficient8_300,
  OriginalRow227TriangleData0137.coefficient8_301,
  OriginalRow227TriangleData0137.coefficient8_302,
  OriginalRow227TriangleData0137.coefficient8_303,
  OriginalRow227TriangleData0137.coefficient8_304,
  OriginalRow227TriangleData0137.coefficient8_305,
  OriginalRow227TriangleData0137.coefficient8_306,
  OriginalRow227TriangleData0137.coefficient8_307,
  OriginalRow227TriangleData0137.coefficient8_308,
  OriginalRow227TriangleData0137.coefficient8_309,
  OriginalRow227TriangleData0137.coefficient8_310,
  OriginalRow227TriangleData0137.coefficient8_311,
  OriginalRow227TriangleData0137.coefficient8_312,
  OriginalRow227TriangleData0137.coefficient8_313,
  OriginalRow227TriangleData0137.coefficient8_314,
  OriginalRow227TriangleData0137.coefficient8_315,
  OriginalRow227TriangleData0137.coefficient8_316,
  OriginalRow227TriangleData0137.coefficient8_317,
  OriginalRow227TriangleData0137.coefficient8_318,
  OriginalRow227TriangleData0137.coefficient8_319,
  OriginalRow227TriangleData0137.coefficient8_320,
  OriginalRow227TriangleData0137.coefficient8_321,
  OriginalRow227TriangleData0137.coefficient8_322,
  OriginalRow227TriangleData0137.coefficient8_323,
  OriginalRow227TriangleData0137.coefficient8_324,
  OriginalRow227TriangleData0137.coefficient8_325,
  OriginalRow227TriangleData0137.coefficient8_326
]

theorem values0137_size : values0137.size = 32 := rfl

def block0137 : ℕ → Option IntervalDyadic := segment 295 values0137

theorem block0137_domain : ExactDomain block0137 295 327 := by
  simpa only [values0137_size] using segment_domain 295 values0137

theorem block0137_get (i : Fin 32) :
    block0137 (295 + i.val) = some (values0137[i.val]'(by rw [values0137_size]; exact i.isLt)) := by
  exact segment_get 295 values0137 ⟨i.val, by rw [values0137_size]; exact i.isLt⟩

def values0138 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0138.coefficient8_327,
  OriginalRow227TriangleData0138.coefficient8_328,
  OriginalRow227TriangleData0138.coefficient8_329,
  OriginalRow227TriangleData0138.coefficient8_330,
  OriginalRow227TriangleData0138.coefficient8_331,
  OriginalRow227TriangleData0138.coefficient8_332,
  OriginalRow227TriangleData0138.coefficient8_333,
  OriginalRow227TriangleData0138.coefficient8_334,
  OriginalRow227TriangleData0138.coefficient8_335,
  OriginalRow227TriangleData0138.coefficient8_336,
  OriginalRow227TriangleData0138.coefficient8_337,
  OriginalRow227TriangleData0138.coefficient8_338,
  OriginalRow227TriangleData0138.coefficient8_339,
  OriginalRow227TriangleData0138.coefficient8_340,
  OriginalRow227TriangleData0138.coefficient8_341,
  OriginalRow227TriangleData0138.coefficient8_342,
  OriginalRow227TriangleData0138.coefficient8_343,
  OriginalRow227TriangleData0138.coefficient8_344,
  OriginalRow227TriangleData0138.coefficient8_345,
  OriginalRow227TriangleData0138.coefficient8_346,
  OriginalRow227TriangleData0138.coefficient8_347,
  OriginalRow227TriangleData0138.coefficient8_348,
  OriginalRow227TriangleData0138.coefficient8_349,
  OriginalRow227TriangleData0138.coefficient8_350,
  OriginalRow227TriangleData0138.coefficient8_351,
  OriginalRow227TriangleData0138.coefficient8_352,
  OriginalRow227TriangleData0138.coefficient8_353,
  OriginalRow227TriangleData0138.coefficient8_354,
  OriginalRow227TriangleData0138.coefficient8_355,
  OriginalRow227TriangleData0138.coefficient8_356,
  OriginalRow227TriangleData0138.coefficient8_357,
  OriginalRow227TriangleData0138.coefficient8_358
]

theorem values0138_size : values0138.size = 32 := rfl

def block0138 : ℕ → Option IntervalDyadic := segment 327 values0138

theorem block0138_domain : ExactDomain block0138 327 359 := by
  simpa only [values0138_size] using segment_domain 327 values0138

theorem block0138_get (i : Fin 32) :
    block0138 (327 + i.val) = some (values0138[i.val]'(by rw [values0138_size]; exact i.isLt)) := by
  exact segment_get 327 values0138 ⟨i.val, by rw [values0138_size]; exact i.isLt⟩

def values0139 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0139.coefficient8_359,
  OriginalRow227TriangleData0139.coefficient8_360,
  OriginalRow227TriangleData0139.coefficient8_361,
  OriginalRow227TriangleData0139.coefficient8_362,
  OriginalRow227TriangleData0139.coefficient8_363,
  OriginalRow227TriangleData0139.coefficient8_364,
  OriginalRow227TriangleData0139.coefficient8_365,
  OriginalRow227TriangleData0139.coefficient8_366,
  OriginalRow227TriangleData0139.coefficient8_367,
  OriginalRow227TriangleData0139.coefficient8_368,
  OriginalRow227TriangleData0139.coefficient8_369,
  OriginalRow227TriangleData0139.coefficient8_370,
  OriginalRow227TriangleData0139.coefficient8_371,
  OriginalRow227TriangleData0139.coefficient8_372,
  OriginalRow227TriangleData0139.coefficient8_373,
  OriginalRow227TriangleData0139.coefficient8_374,
  OriginalRow227TriangleData0139.coefficient8_375,
  OriginalRow227TriangleData0139.coefficient8_376,
  OriginalRow227TriangleData0139.coefficient8_377,
  OriginalRow227TriangleData0139.coefficient8_378,
  OriginalRow227TriangleData0139.coefficient8_379,
  OriginalRow227TriangleData0139.coefficient8_380,
  OriginalRow227TriangleData0139.coefficient8_381,
  OriginalRow227TriangleData0139.coefficient8_382,
  OriginalRow227TriangleData0139.coefficient8_383,
  OriginalRow227TriangleData0139.coefficient8_384,
  OriginalRow227TriangleData0139.coefficient8_385,
  OriginalRow227TriangleData0139.coefficient8_386,
  OriginalRow227TriangleData0139.coefficient8_387,
  OriginalRow227TriangleData0139.coefficient8_388,
  OriginalRow227TriangleData0139.coefficient8_389,
  OriginalRow227TriangleData0139.coefficient8_390
]

theorem values0139_size : values0139.size = 32 := rfl

def block0139 : ℕ → Option IntervalDyadic := segment 359 values0139

theorem block0139_domain : ExactDomain block0139 359 391 := by
  simpa only [values0139_size] using segment_domain 359 values0139

theorem block0139_get (i : Fin 32) :
    block0139 (359 + i.val) = some (values0139[i.val]'(by rw [values0139_size]; exact i.isLt)) := by
  exact segment_get 359 values0139 ⟨i.val, by rw [values0139_size]; exact i.isLt⟩

def values0140 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0140.coefficient8_391,
  OriginalRow227TriangleData0140.coefficient8_392,
  OriginalRow227TriangleData0140.coefficient8_393,
  OriginalRow227TriangleData0140.coefficient8_394,
  OriginalRow227TriangleData0140.coefficient8_395,
  OriginalRow227TriangleData0140.coefficient8_396,
  OriginalRow227TriangleData0140.coefficient8_397,
  OriginalRow227TriangleData0140.coefficient8_398,
  OriginalRow227TriangleData0140.coefficient8_399,
  OriginalRow227TriangleData0140.coefficient8_400,
  OriginalRow227TriangleData0140.coefficient8_401,
  OriginalRow227TriangleData0140.coefficient8_402,
  OriginalRow227TriangleData0140.coefficient8_403,
  OriginalRow227TriangleData0140.coefficient8_404,
  OriginalRow227TriangleData0140.coefficient8_405,
  OriginalRow227TriangleData0140.coefficient8_406,
  OriginalRow227TriangleData0140.coefficient8_407,
  OriginalRow227TriangleData0140.coefficient8_408,
  OriginalRow227TriangleData0140.coefficient8_409,
  OriginalRow227TriangleData0140.coefficient8_410,
  OriginalRow227TriangleData0140.coefficient8_411,
  OriginalRow227TriangleData0140.coefficient8_412,
  OriginalRow227TriangleData0140.coefficient8_413,
  OriginalRow227TriangleData0140.coefficient8_414,
  OriginalRow227TriangleData0140.coefficient8_415,
  OriginalRow227TriangleData0140.coefficient8_416,
  OriginalRow227TriangleData0140.coefficient8_417,
  OriginalRow227TriangleData0140.coefficient8_418,
  OriginalRow227TriangleData0140.coefficient8_419,
  OriginalRow227TriangleData0140.coefficient8_420,
  OriginalRow227TriangleData0140.coefficient8_421,
  OriginalRow227TriangleData0140.coefficient8_422
]

theorem values0140_size : values0140.size = 32 := rfl

def block0140 : ℕ → Option IntervalDyadic := segment 391 values0140

theorem block0140_domain : ExactDomain block0140 391 423 := by
  simpa only [values0140_size] using segment_domain 391 values0140

theorem block0140_get (i : Fin 32) :
    block0140 (391 + i.val) = some (values0140[i.val]'(by rw [values0140_size]; exact i.isLt)) := by
  exact segment_get 391 values0140 ⟨i.val, by rw [values0140_size]; exact i.isLt⟩

def values0141 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0141.coefficient8_423,
  OriginalRow227TriangleData0141.coefficient8_424,
  OriginalRow227TriangleData0141.coefficient8_425,
  OriginalRow227TriangleData0141.coefficient8_426,
  OriginalRow227TriangleData0141.coefficient8_427,
  OriginalRow227TriangleData0141.coefficient8_428,
  OriginalRow227TriangleData0141.coefficient8_429,
  OriginalRow227TriangleData0141.coefficient8_430,
  OriginalRow227TriangleData0141.coefficient8_431,
  OriginalRow227TriangleData0141.coefficient8_432,
  OriginalRow227TriangleData0141.coefficient8_433,
  OriginalRow227TriangleData0141.coefficient8_434,
  OriginalRow227TriangleData0141.coefficient8_435,
  OriginalRow227TriangleData0141.coefficient8_436,
  OriginalRow227TriangleData0141.coefficient8_437,
  OriginalRow227TriangleData0141.coefficient8_438,
  OriginalRow227TriangleData0141.coefficient8_439,
  OriginalRow227TriangleData0141.coefficient8_440,
  OriginalRow227TriangleData0141.coefficient8_441,
  OriginalRow227TriangleData0141.coefficient8_442,
  OriginalRow227TriangleData0141.coefficient8_443,
  OriginalRow227TriangleData0141.coefficient8_444,
  OriginalRow227TriangleData0141.coefficient8_445,
  OriginalRow227TriangleData0141.coefficient8_446,
  OriginalRow227TriangleData0141.coefficient8_447,
  OriginalRow227TriangleData0141.coefficient8_448,
  OriginalRow227TriangleData0141.coefficient8_449,
  OriginalRow227TriangleData0141.coefficient8_450,
  OriginalRow227TriangleData0141.coefficient8_451,
  OriginalRow227TriangleData0141.coefficient8_452,
  OriginalRow227TriangleData0141.coefficient8_453,
  OriginalRow227TriangleData0141.coefficient8_454
]

theorem values0141_size : values0141.size = 32 := rfl

def block0141 : ℕ → Option IntervalDyadic := segment 423 values0141

theorem block0141_domain : ExactDomain block0141 423 455 := by
  simpa only [values0141_size] using segment_domain 423 values0141

theorem block0141_get (i : Fin 32) :
    block0141 (423 + i.val) = some (values0141[i.val]'(by rw [values0141_size]; exact i.isLt)) := by
  exact segment_get 423 values0141 ⟨i.val, by rw [values0141_size]; exact i.isLt⟩

def values0142 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0142.coefficient8_455,
  OriginalRow227TriangleData0142.coefficient8_456,
  OriginalRow227TriangleData0142.coefficient8_457,
  OriginalRow227TriangleData0142.coefficient8_458,
  OriginalRow227TriangleData0142.coefficient8_459,
  OriginalRow227TriangleData0142.coefficient8_460,
  OriginalRow227TriangleData0142.coefficient8_461,
  OriginalRow227TriangleData0142.coefficient8_462,
  OriginalRow227TriangleData0142.coefficient8_463,
  OriginalRow227TriangleData0142.coefficient8_464,
  OriginalRow227TriangleData0142.coefficient8_465,
  OriginalRow227TriangleData0142.coefficient8_466,
  OriginalRow227TriangleData0142.coefficient8_467,
  OriginalRow227TriangleData0142.coefficient8_468,
  OriginalRow227TriangleData0142.coefficient8_469,
  OriginalRow227TriangleData0142.coefficient8_470,
  OriginalRow227TriangleData0142.coefficient8_471,
  OriginalRow227TriangleData0142.coefficient8_472,
  OriginalRow227TriangleData0142.coefficient8_473,
  OriginalRow227TriangleData0142.coefficient8_474,
  OriginalRow227TriangleData0142.coefficient8_475,
  OriginalRow227TriangleData0142.coefficient8_476,
  OriginalRow227TriangleData0142.coefficient8_477,
  OriginalRow227TriangleData0142.coefficient8_478,
  OriginalRow227TriangleData0142.coefficient8_479,
  OriginalRow227TriangleData0142.coefficient8_480,
  OriginalRow227TriangleData0142.coefficient8_481,
  OriginalRow227TriangleData0142.coefficient8_482,
  OriginalRow227TriangleData0142.coefficient8_483,
  OriginalRow227TriangleData0142.coefficient8_484,
  OriginalRow227TriangleData0142.coefficient8_485,
  OriginalRow227TriangleData0142.coefficient8_486
]

theorem values0142_size : values0142.size = 32 := rfl

def block0142 : ℕ → Option IntervalDyadic := segment 455 values0142

theorem block0142_domain : ExactDomain block0142 455 487 := by
  simpa only [values0142_size] using segment_domain 455 values0142

theorem block0142_get (i : Fin 32) :
    block0142 (455 + i.val) = some (values0142[i.val]'(by rw [values0142_size]; exact i.isLt)) := by
  exact segment_get 455 values0142 ⟨i.val, by rw [values0142_size]; exact i.isLt⟩

def values0143 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0143.coefficient8_487,
  OriginalRow227TriangleData0143.coefficient8_488,
  OriginalRow227TriangleData0143.coefficient8_489,
  OriginalRow227TriangleData0143.coefficient8_490,
  OriginalRow227TriangleData0143.coefficient8_491,
  OriginalRow227TriangleData0143.coefficient8_492,
  OriginalRow227TriangleData0143.coefficient8_493
]

theorem values0143_size : values0143.size = 7 := rfl

def block0143 : ℕ → Option IntervalDyadic := segment 487 values0143

theorem block0143_domain : ExactDomain block0143 487 494 := by
  simpa only [values0143_size] using segment_domain 487 values0143

theorem block0143_get (i : Fin 7) :
    block0143 (487 + i.val) = some (values0143[i.val]'(by rw [values0143_size]; exact i.isLt)) := by
  exact segment_get 487 values0143 ⟨i.val, by rw [values0143_size]; exact i.isLt⟩

def node0007_0071 : ℕ → Option IntervalDyadic := split 39 block0128 block0129

theorem node0007_0071_domain : ExactDomain node0007_0071 7 71 := by
  exact split_domain (by decide) (by decide) block0128_domain block0129_domain

def node0071_0135 : ℕ → Option IntervalDyadic := split 103 block0130 block0131

theorem node0071_0135_domain : ExactDomain node0071_0135 71 135 := by
  exact split_domain (by decide) (by decide) block0130_domain block0131_domain

def node0007_0135 : ℕ → Option IntervalDyadic := split 71 node0007_0071 node0071_0135

theorem node0007_0135_domain : ExactDomain node0007_0135 7 135 := by
  exact split_domain (by decide) (by decide) node0007_0071_domain node0071_0135_domain

def node0135_0199 : ℕ → Option IntervalDyadic := split 167 block0132 block0133

theorem node0135_0199_domain : ExactDomain node0135_0199 135 199 := by
  exact split_domain (by decide) (by decide) block0132_domain block0133_domain

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block0134 block0135

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block0134_domain block0135_domain

def node0135_0263 : ℕ → Option IntervalDyadic := split 199 node0135_0199 node0199_0263

theorem node0135_0263_domain : ExactDomain node0135_0263 135 263 := by
  exact split_domain (by decide) (by decide) node0135_0199_domain node0199_0263_domain

def node0007_0263 : ℕ → Option IntervalDyadic := split 135 node0007_0135 node0135_0263

theorem node0007_0263_domain : ExactDomain node0007_0263 7 263 := by
  exact split_domain (by decide) (by decide) node0007_0135_domain node0135_0263_domain

def node0263_0327 : ℕ → Option IntervalDyadic := split 295 block0136 block0137

theorem node0263_0327_domain : ExactDomain node0263_0327 263 327 := by
  exact split_domain (by decide) (by decide) block0136_domain block0137_domain

def node0327_0391 : ℕ → Option IntervalDyadic := split 359 block0138 block0139

theorem node0327_0391_domain : ExactDomain node0327_0391 327 391 := by
  exact split_domain (by decide) (by decide) block0138_domain block0139_domain

def node0263_0391 : ℕ → Option IntervalDyadic := split 327 node0263_0327 node0327_0391

theorem node0263_0391_domain : ExactDomain node0263_0391 263 391 := by
  exact split_domain (by decide) (by decide) node0263_0327_domain node0327_0391_domain

def node0391_0455 : ℕ → Option IntervalDyadic := split 423 block0140 block0141

theorem node0391_0455_domain : ExactDomain node0391_0455 391 455 := by
  exact split_domain (by decide) (by decide) block0140_domain block0141_domain

def node0455_0494 : ℕ → Option IntervalDyadic := split 487 block0142 block0143

theorem node0455_0494_domain : ExactDomain node0455_0494 455 494 := by
  exact split_domain (by decide) (by decide) block0142_domain block0143_domain

def node0391_0494 : ℕ → Option IntervalDyadic := split 455 node0391_0455 node0455_0494

theorem node0391_0494_domain : ExactDomain node0391_0494 391 494 := by
  exact split_domain (by decide) (by decide) node0391_0455_domain node0455_0494_domain

def node0263_0494 : ℕ → Option IntervalDyadic := split 391 node0263_0391 node0391_0494

theorem node0263_0494_domain : ExactDomain node0263_0494 263 494 := by
  exact split_domain (by decide) (by decide) node0263_0391_domain node0391_0494_domain

def node0007_0494 : ℕ → Option IntervalDyadic := split 263 node0007_0263 node0263_0494

theorem node0007_0494_domain : ExactDomain node0007_0494 7 494 := by
  exact split_domain (by decide) (by decide) node0007_0263_domain node0263_0494_domain

def lookup : ℕ → Option IntervalDyadic := node0007_0494

theorem lookup_domain : ExactDomain lookup 7 494 :=
  node0007_0494_domain

theorem block0128_lookup (i : Fin 32) :
    lookup (7 + i.val) = some (values0128[i.val]'(by rw [values0128_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (7 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_left 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0007_0135, split_left 71 node0007_0071 node0071_0135 (by omega)]
  rw [node0007_0071, split_left 39 block0128 block0129 (by omega)]
  exact block0128_get i

theorem block0129_lookup (i : Fin 32) :
    lookup (39 + i.val) = some (values0129[i.val]'(by rw [values0129_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (39 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_left 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0007_0135, split_left 71 node0007_0071 node0071_0135 (by omega)]
  rw [node0007_0071, split_right 39 block0128 block0129 (by omega)]
  exact block0129_get i

theorem block0130_lookup (i : Fin 32) :
    lookup (71 + i.val) = some (values0130[i.val]'(by rw [values0130_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (71 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_left 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0007_0135, split_right 71 node0007_0071 node0071_0135 (by omega)]
  rw [node0071_0135, split_left 103 block0130 block0131 (by omega)]
  exact block0130_get i

theorem block0131_lookup (i : Fin 32) :
    lookup (103 + i.val) = some (values0131[i.val]'(by rw [values0131_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (103 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_left 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0007_0135, split_right 71 node0007_0071 node0071_0135 (by omega)]
  rw [node0071_0135, split_right 103 block0130 block0131 (by omega)]
  exact block0131_get i

theorem block0132_lookup (i : Fin 32) :
    lookup (135 + i.val) = some (values0132[i.val]'(by rw [values0132_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (135 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_right 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_left 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0135_0199, split_left 167 block0132 block0133 (by omega)]
  exact block0132_get i

theorem block0133_lookup (i : Fin 32) :
    lookup (167 + i.val) = some (values0133[i.val]'(by rw [values0133_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (167 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_right 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_left 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0135_0199, split_right 167 block0132 block0133 (by omega)]
  exact block0133_get i

theorem block0134_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values0134[i.val]'(by rw [values0134_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (199 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_right 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_right 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0199_0263, split_left 231 block0134 block0135 (by omega)]
  exact block0134_get i

theorem block0135_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values0135[i.val]'(by rw [values0135_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (231 + i.val) = _
  rw [node0007_0494, split_left 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0007_0263, split_right 135 node0007_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_right 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0199_0263, split_right 231 block0134 block0135 (by omega)]
  exact block0135_get i

theorem block0136_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values0136[i.val]'(by rw [values0136_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (263 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_left 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0263_0391, split_left 327 node0263_0327 node0327_0391 (by omega)]
  rw [node0263_0327, split_left 295 block0136 block0137 (by omega)]
  exact block0136_get i

theorem block0137_lookup (i : Fin 32) :
    lookup (295 + i.val) = some (values0137[i.val]'(by rw [values0137_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (295 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_left 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0263_0391, split_left 327 node0263_0327 node0327_0391 (by omega)]
  rw [node0263_0327, split_right 295 block0136 block0137 (by omega)]
  exact block0137_get i

theorem block0138_lookup (i : Fin 32) :
    lookup (327 + i.val) = some (values0138[i.val]'(by rw [values0138_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (327 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_left 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0263_0391, split_right 327 node0263_0327 node0327_0391 (by omega)]
  rw [node0327_0391, split_left 359 block0138 block0139 (by omega)]
  exact block0138_get i

theorem block0139_lookup (i : Fin 32) :
    lookup (359 + i.val) = some (values0139[i.val]'(by rw [values0139_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (359 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_left 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0263_0391, split_right 327 node0263_0327 node0327_0391 (by omega)]
  rw [node0327_0391, split_right 359 block0138 block0139 (by omega)]
  exact block0139_get i

theorem block0140_lookup (i : Fin 32) :
    lookup (391 + i.val) = some (values0140[i.val]'(by rw [values0140_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (391 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_right 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0391_0494, split_left 455 node0391_0455 node0455_0494 (by omega)]
  rw [node0391_0455, split_left 423 block0140 block0141 (by omega)]
  exact block0140_get i

theorem block0141_lookup (i : Fin 32) :
    lookup (423 + i.val) = some (values0141[i.val]'(by rw [values0141_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (423 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_right 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0391_0494, split_left 455 node0391_0455 node0455_0494 (by omega)]
  rw [node0391_0455, split_right 423 block0140 block0141 (by omega)]
  exact block0141_get i

theorem block0142_lookup (i : Fin 32) :
    lookup (455 + i.val) = some (values0142[i.val]'(by rw [values0142_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (455 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_right 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0391_0494, split_right 455 node0391_0455 node0455_0494 (by omega)]
  rw [node0455_0494, split_left 487 block0142 block0143 (by omega)]
  exact block0142_get i

theorem block0143_lookup (i : Fin 7) :
    lookup (487 + i.val) = some (values0143[i.val]'(by rw [values0143_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0007_0494 (487 + i.val) = _
  rw [node0007_0494, split_right 263 node0007_0263 node0263_0494 (by omega)]
  rw [node0263_0494, split_right 391 node0263_0391 node0391_0494 (by omega)]
  rw [node0391_0494, split_right 455 node0391_0455 node0455_0494 (by omega)]
  rw [node0455_0494, split_right 487 block0142 block0143 (by omega)]
  exact block0143_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0128_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0128_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0129_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0129_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0130_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0130_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0131_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0131_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0132_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0132_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0133_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0133_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0134_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0134_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0135_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0135_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0136_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0136_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0137_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0137_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0138_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0138_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0139_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0139_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0140_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0140_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0141_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0141_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0142_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0142_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0143_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0143_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0128_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0129_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0130_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0131_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0132_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0133_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0134_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0135_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0136_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0137_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0138_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0139_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0140_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0141_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0142_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow008.block0143_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow008
