import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0096
import Grothe.UpperChaos.OriginalRow227TriangleData0097
import Grothe.UpperChaos.OriginalRow227TriangleData0098
import Grothe.UpperChaos.OriginalRow227TriangleData0099
import Grothe.UpperChaos.OriginalRow227TriangleData0100
import Grothe.UpperChaos.OriginalRow227TriangleData0101
import Grothe.UpperChaos.OriginalRow227TriangleData0102
import Grothe.UpperChaos.OriginalRow227TriangleData0103
import Grothe.UpperChaos.OriginalRow227TriangleData0104
import Grothe.UpperChaos.OriginalRow227TriangleData0105
import Grothe.UpperChaos.OriginalRow227TriangleData0106
import Grothe.UpperChaos.OriginalRow227TriangleData0107
import Grothe.UpperChaos.OriginalRow227TriangleData0108
import Grothe.UpperChaos.OriginalRow227TriangleData0109
import Grothe.UpperChaos.OriginalRow227TriangleData0110
import Grothe.UpperChaos.OriginalRow227TriangleData0111

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow006

open ConditionalTableLookup

def values0096 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0096.coefficient6_5,
  OriginalRow227TriangleData0096.coefficient6_6,
  OriginalRow227TriangleData0096.coefficient6_7,
  OriginalRow227TriangleData0096.coefficient6_8,
  OriginalRow227TriangleData0096.coefficient6_9,
  OriginalRow227TriangleData0096.coefficient6_10,
  OriginalRow227TriangleData0096.coefficient6_11,
  OriginalRow227TriangleData0096.coefficient6_12,
  OriginalRow227TriangleData0096.coefficient6_13,
  OriginalRow227TriangleData0096.coefficient6_14,
  OriginalRow227TriangleData0096.coefficient6_15,
  OriginalRow227TriangleData0096.coefficient6_16,
  OriginalRow227TriangleData0096.coefficient6_17,
  OriginalRow227TriangleData0096.coefficient6_18,
  OriginalRow227TriangleData0096.coefficient6_19,
  OriginalRow227TriangleData0096.coefficient6_20,
  OriginalRow227TriangleData0096.coefficient6_21,
  OriginalRow227TriangleData0096.coefficient6_22,
  OriginalRow227TriangleData0096.coefficient6_23,
  OriginalRow227TriangleData0096.coefficient6_24,
  OriginalRow227TriangleData0096.coefficient6_25,
  OriginalRow227TriangleData0096.coefficient6_26,
  OriginalRow227TriangleData0096.coefficient6_27,
  OriginalRow227TriangleData0096.coefficient6_28,
  OriginalRow227TriangleData0096.coefficient6_29,
  OriginalRow227TriangleData0096.coefficient6_30,
  OriginalRow227TriangleData0096.coefficient6_31,
  OriginalRow227TriangleData0096.coefficient6_32,
  OriginalRow227TriangleData0096.coefficient6_33,
  OriginalRow227TriangleData0096.coefficient6_34,
  OriginalRow227TriangleData0096.coefficient6_35,
  OriginalRow227TriangleData0096.coefficient6_36
]

theorem values0096_size : values0096.size = 32 := rfl

def block0096 : ℕ → Option IntervalDyadic := segment 5 values0096

theorem block0096_domain : ExactDomain block0096 5 37 := by
  simpa only [values0096_size] using segment_domain 5 values0096

theorem block0096_get (i : Fin 32) :
    block0096 (5 + i.val) = some (values0096[i.val]'(by rw [values0096_size]; exact i.isLt)) := by
  exact segment_get 5 values0096 ⟨i.val, by rw [values0096_size]; exact i.isLt⟩

def values0097 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0097.coefficient6_37,
  OriginalRow227TriangleData0097.coefficient6_38,
  OriginalRow227TriangleData0097.coefficient6_39,
  OriginalRow227TriangleData0097.coefficient6_40,
  OriginalRow227TriangleData0097.coefficient6_41,
  OriginalRow227TriangleData0097.coefficient6_42,
  OriginalRow227TriangleData0097.coefficient6_43,
  OriginalRow227TriangleData0097.coefficient6_44,
  OriginalRow227TriangleData0097.coefficient6_45,
  OriginalRow227TriangleData0097.coefficient6_46,
  OriginalRow227TriangleData0097.coefficient6_47,
  OriginalRow227TriangleData0097.coefficient6_48,
  OriginalRow227TriangleData0097.coefficient6_49,
  OriginalRow227TriangleData0097.coefficient6_50,
  OriginalRow227TriangleData0097.coefficient6_51,
  OriginalRow227TriangleData0097.coefficient6_52,
  OriginalRow227TriangleData0097.coefficient6_53,
  OriginalRow227TriangleData0097.coefficient6_54,
  OriginalRow227TriangleData0097.coefficient6_55,
  OriginalRow227TriangleData0097.coefficient6_56,
  OriginalRow227TriangleData0097.coefficient6_57,
  OriginalRow227TriangleData0097.coefficient6_58,
  OriginalRow227TriangleData0097.coefficient6_59,
  OriginalRow227TriangleData0097.coefficient6_60,
  OriginalRow227TriangleData0097.coefficient6_61,
  OriginalRow227TriangleData0097.coefficient6_62,
  OriginalRow227TriangleData0097.coefficient6_63,
  OriginalRow227TriangleData0097.coefficient6_64,
  OriginalRow227TriangleData0097.coefficient6_65,
  OriginalRow227TriangleData0097.coefficient6_66,
  OriginalRow227TriangleData0097.coefficient6_67,
  OriginalRow227TriangleData0097.coefficient6_68
]

theorem values0097_size : values0097.size = 32 := rfl

def block0097 : ℕ → Option IntervalDyadic := segment 37 values0097

theorem block0097_domain : ExactDomain block0097 37 69 := by
  simpa only [values0097_size] using segment_domain 37 values0097

theorem block0097_get (i : Fin 32) :
    block0097 (37 + i.val) = some (values0097[i.val]'(by rw [values0097_size]; exact i.isLt)) := by
  exact segment_get 37 values0097 ⟨i.val, by rw [values0097_size]; exact i.isLt⟩

def values0098 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0098.coefficient6_69,
  OriginalRow227TriangleData0098.coefficient6_70,
  OriginalRow227TriangleData0098.coefficient6_71,
  OriginalRow227TriangleData0098.coefficient6_72,
  OriginalRow227TriangleData0098.coefficient6_73,
  OriginalRow227TriangleData0098.coefficient6_74,
  OriginalRow227TriangleData0098.coefficient6_75,
  OriginalRow227TriangleData0098.coefficient6_76,
  OriginalRow227TriangleData0098.coefficient6_77,
  OriginalRow227TriangleData0098.coefficient6_78,
  OriginalRow227TriangleData0098.coefficient6_79,
  OriginalRow227TriangleData0098.coefficient6_80,
  OriginalRow227TriangleData0098.coefficient6_81,
  OriginalRow227TriangleData0098.coefficient6_82,
  OriginalRow227TriangleData0098.coefficient6_83,
  OriginalRow227TriangleData0098.coefficient6_84,
  OriginalRow227TriangleData0098.coefficient6_85,
  OriginalRow227TriangleData0098.coefficient6_86,
  OriginalRow227TriangleData0098.coefficient6_87,
  OriginalRow227TriangleData0098.coefficient6_88,
  OriginalRow227TriangleData0098.coefficient6_89,
  OriginalRow227TriangleData0098.coefficient6_90,
  OriginalRow227TriangleData0098.coefficient6_91,
  OriginalRow227TriangleData0098.coefficient6_92,
  OriginalRow227TriangleData0098.coefficient6_93,
  OriginalRow227TriangleData0098.coefficient6_94,
  OriginalRow227TriangleData0098.coefficient6_95,
  OriginalRow227TriangleData0098.coefficient6_96,
  OriginalRow227TriangleData0098.coefficient6_97,
  OriginalRow227TriangleData0098.coefficient6_98,
  OriginalRow227TriangleData0098.coefficient6_99,
  OriginalRow227TriangleData0098.coefficient6_100
]

theorem values0098_size : values0098.size = 32 := rfl

def block0098 : ℕ → Option IntervalDyadic := segment 69 values0098

theorem block0098_domain : ExactDomain block0098 69 101 := by
  simpa only [values0098_size] using segment_domain 69 values0098

theorem block0098_get (i : Fin 32) :
    block0098 (69 + i.val) = some (values0098[i.val]'(by rw [values0098_size]; exact i.isLt)) := by
  exact segment_get 69 values0098 ⟨i.val, by rw [values0098_size]; exact i.isLt⟩

def values0099 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0099.coefficient6_101,
  OriginalRow227TriangleData0099.coefficient6_102,
  OriginalRow227TriangleData0099.coefficient6_103,
  OriginalRow227TriangleData0099.coefficient6_104,
  OriginalRow227TriangleData0099.coefficient6_105,
  OriginalRow227TriangleData0099.coefficient6_106,
  OriginalRow227TriangleData0099.coefficient6_107,
  OriginalRow227TriangleData0099.coefficient6_108,
  OriginalRow227TriangleData0099.coefficient6_109,
  OriginalRow227TriangleData0099.coefficient6_110,
  OriginalRow227TriangleData0099.coefficient6_111,
  OriginalRow227TriangleData0099.coefficient6_112,
  OriginalRow227TriangleData0099.coefficient6_113,
  OriginalRow227TriangleData0099.coefficient6_114,
  OriginalRow227TriangleData0099.coefficient6_115,
  OriginalRow227TriangleData0099.coefficient6_116,
  OriginalRow227TriangleData0099.coefficient6_117,
  OriginalRow227TriangleData0099.coefficient6_118,
  OriginalRow227TriangleData0099.coefficient6_119,
  OriginalRow227TriangleData0099.coefficient6_120,
  OriginalRow227TriangleData0099.coefficient6_121,
  OriginalRow227TriangleData0099.coefficient6_122,
  OriginalRow227TriangleData0099.coefficient6_123,
  OriginalRow227TriangleData0099.coefficient6_124,
  OriginalRow227TriangleData0099.coefficient6_125,
  OriginalRow227TriangleData0099.coefficient6_126,
  OriginalRow227TriangleData0099.coefficient6_127,
  OriginalRow227TriangleData0099.coefficient6_128,
  OriginalRow227TriangleData0099.coefficient6_129,
  OriginalRow227TriangleData0099.coefficient6_130,
  OriginalRow227TriangleData0099.coefficient6_131,
  OriginalRow227TriangleData0099.coefficient6_132
]

theorem values0099_size : values0099.size = 32 := rfl

def block0099 : ℕ → Option IntervalDyadic := segment 101 values0099

theorem block0099_domain : ExactDomain block0099 101 133 := by
  simpa only [values0099_size] using segment_domain 101 values0099

theorem block0099_get (i : Fin 32) :
    block0099 (101 + i.val) = some (values0099[i.val]'(by rw [values0099_size]; exact i.isLt)) := by
  exact segment_get 101 values0099 ⟨i.val, by rw [values0099_size]; exact i.isLt⟩

def values0100 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0100.coefficient6_133,
  OriginalRow227TriangleData0100.coefficient6_134,
  OriginalRow227TriangleData0100.coefficient6_135,
  OriginalRow227TriangleData0100.coefficient6_136,
  OriginalRow227TriangleData0100.coefficient6_137,
  OriginalRow227TriangleData0100.coefficient6_138,
  OriginalRow227TriangleData0100.coefficient6_139,
  OriginalRow227TriangleData0100.coefficient6_140,
  OriginalRow227TriangleData0100.coefficient6_141,
  OriginalRow227TriangleData0100.coefficient6_142,
  OriginalRow227TriangleData0100.coefficient6_143,
  OriginalRow227TriangleData0100.coefficient6_144,
  OriginalRow227TriangleData0100.coefficient6_145,
  OriginalRow227TriangleData0100.coefficient6_146,
  OriginalRow227TriangleData0100.coefficient6_147,
  OriginalRow227TriangleData0100.coefficient6_148,
  OriginalRow227TriangleData0100.coefficient6_149,
  OriginalRow227TriangleData0100.coefficient6_150,
  OriginalRow227TriangleData0100.coefficient6_151,
  OriginalRow227TriangleData0100.coefficient6_152,
  OriginalRow227TriangleData0100.coefficient6_153,
  OriginalRow227TriangleData0100.coefficient6_154,
  OriginalRow227TriangleData0100.coefficient6_155,
  OriginalRow227TriangleData0100.coefficient6_156,
  OriginalRow227TriangleData0100.coefficient6_157,
  OriginalRow227TriangleData0100.coefficient6_158,
  OriginalRow227TriangleData0100.coefficient6_159,
  OriginalRow227TriangleData0100.coefficient6_160,
  OriginalRow227TriangleData0100.coefficient6_161,
  OriginalRow227TriangleData0100.coefficient6_162,
  OriginalRow227TriangleData0100.coefficient6_163,
  OriginalRow227TriangleData0100.coefficient6_164
]

theorem values0100_size : values0100.size = 32 := rfl

def block0100 : ℕ → Option IntervalDyadic := segment 133 values0100

theorem block0100_domain : ExactDomain block0100 133 165 := by
  simpa only [values0100_size] using segment_domain 133 values0100

theorem block0100_get (i : Fin 32) :
    block0100 (133 + i.val) = some (values0100[i.val]'(by rw [values0100_size]; exact i.isLt)) := by
  exact segment_get 133 values0100 ⟨i.val, by rw [values0100_size]; exact i.isLt⟩

def values0101 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0101.coefficient6_165,
  OriginalRow227TriangleData0101.coefficient6_166,
  OriginalRow227TriangleData0101.coefficient6_167,
  OriginalRow227TriangleData0101.coefficient6_168,
  OriginalRow227TriangleData0101.coefficient6_169,
  OriginalRow227TriangleData0101.coefficient6_170,
  OriginalRow227TriangleData0101.coefficient6_171,
  OriginalRow227TriangleData0101.coefficient6_172,
  OriginalRow227TriangleData0101.coefficient6_173,
  OriginalRow227TriangleData0101.coefficient6_174,
  OriginalRow227TriangleData0101.coefficient6_175,
  OriginalRow227TriangleData0101.coefficient6_176,
  OriginalRow227TriangleData0101.coefficient6_177,
  OriginalRow227TriangleData0101.coefficient6_178,
  OriginalRow227TriangleData0101.coefficient6_179,
  OriginalRow227TriangleData0101.coefficient6_180,
  OriginalRow227TriangleData0101.coefficient6_181,
  OriginalRow227TriangleData0101.coefficient6_182,
  OriginalRow227TriangleData0101.coefficient6_183,
  OriginalRow227TriangleData0101.coefficient6_184,
  OriginalRow227TriangleData0101.coefficient6_185,
  OriginalRow227TriangleData0101.coefficient6_186,
  OriginalRow227TriangleData0101.coefficient6_187,
  OriginalRow227TriangleData0101.coefficient6_188,
  OriginalRow227TriangleData0101.coefficient6_189,
  OriginalRow227TriangleData0101.coefficient6_190,
  OriginalRow227TriangleData0101.coefficient6_191,
  OriginalRow227TriangleData0101.coefficient6_192,
  OriginalRow227TriangleData0101.coefficient6_193,
  OriginalRow227TriangleData0101.coefficient6_194,
  OriginalRow227TriangleData0101.coefficient6_195,
  OriginalRow227TriangleData0101.coefficient6_196
]

theorem values0101_size : values0101.size = 32 := rfl

def block0101 : ℕ → Option IntervalDyadic := segment 165 values0101

theorem block0101_domain : ExactDomain block0101 165 197 := by
  simpa only [values0101_size] using segment_domain 165 values0101

theorem block0101_get (i : Fin 32) :
    block0101 (165 + i.val) = some (values0101[i.val]'(by rw [values0101_size]; exact i.isLt)) := by
  exact segment_get 165 values0101 ⟨i.val, by rw [values0101_size]; exact i.isLt⟩

def values0102 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0102.coefficient6_197,
  OriginalRow227TriangleData0102.coefficient6_198,
  OriginalRow227TriangleData0102.coefficient6_199,
  OriginalRow227TriangleData0102.coefficient6_200,
  OriginalRow227TriangleData0102.coefficient6_201,
  OriginalRow227TriangleData0102.coefficient6_202,
  OriginalRow227TriangleData0102.coefficient6_203,
  OriginalRow227TriangleData0102.coefficient6_204,
  OriginalRow227TriangleData0102.coefficient6_205,
  OriginalRow227TriangleData0102.coefficient6_206,
  OriginalRow227TriangleData0102.coefficient6_207,
  OriginalRow227TriangleData0102.coefficient6_208,
  OriginalRow227TriangleData0102.coefficient6_209,
  OriginalRow227TriangleData0102.coefficient6_210,
  OriginalRow227TriangleData0102.coefficient6_211,
  OriginalRow227TriangleData0102.coefficient6_212,
  OriginalRow227TriangleData0102.coefficient6_213,
  OriginalRow227TriangleData0102.coefficient6_214,
  OriginalRow227TriangleData0102.coefficient6_215,
  OriginalRow227TriangleData0102.coefficient6_216,
  OriginalRow227TriangleData0102.coefficient6_217,
  OriginalRow227TriangleData0102.coefficient6_218,
  OriginalRow227TriangleData0102.coefficient6_219,
  OriginalRow227TriangleData0102.coefficient6_220,
  OriginalRow227TriangleData0102.coefficient6_221,
  OriginalRow227TriangleData0102.coefficient6_222,
  OriginalRow227TriangleData0102.coefficient6_223,
  OriginalRow227TriangleData0102.coefficient6_224,
  OriginalRow227TriangleData0102.coefficient6_225,
  OriginalRow227TriangleData0102.coefficient6_226,
  OriginalRow227TriangleData0102.coefficient6_227,
  OriginalRow227TriangleData0102.coefficient6_228
]

theorem values0102_size : values0102.size = 32 := rfl

def block0102 : ℕ → Option IntervalDyadic := segment 197 values0102

theorem block0102_domain : ExactDomain block0102 197 229 := by
  simpa only [values0102_size] using segment_domain 197 values0102

theorem block0102_get (i : Fin 32) :
    block0102 (197 + i.val) = some (values0102[i.val]'(by rw [values0102_size]; exact i.isLt)) := by
  exact segment_get 197 values0102 ⟨i.val, by rw [values0102_size]; exact i.isLt⟩

def values0103 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0103.coefficient6_229,
  OriginalRow227TriangleData0103.coefficient6_230,
  OriginalRow227TriangleData0103.coefficient6_231,
  OriginalRow227TriangleData0103.coefficient6_232,
  OriginalRow227TriangleData0103.coefficient6_233,
  OriginalRow227TriangleData0103.coefficient6_234,
  OriginalRow227TriangleData0103.coefficient6_235,
  OriginalRow227TriangleData0103.coefficient6_236,
  OriginalRow227TriangleData0103.coefficient6_237,
  OriginalRow227TriangleData0103.coefficient6_238,
  OriginalRow227TriangleData0103.coefficient6_239,
  OriginalRow227TriangleData0103.coefficient6_240,
  OriginalRow227TriangleData0103.coefficient6_241,
  OriginalRow227TriangleData0103.coefficient6_242,
  OriginalRow227TriangleData0103.coefficient6_243,
  OriginalRow227TriangleData0103.coefficient6_244,
  OriginalRow227TriangleData0103.coefficient6_245,
  OriginalRow227TriangleData0103.coefficient6_246,
  OriginalRow227TriangleData0103.coefficient6_247,
  OriginalRow227TriangleData0103.coefficient6_248,
  OriginalRow227TriangleData0103.coefficient6_249,
  OriginalRow227TriangleData0103.coefficient6_250,
  OriginalRow227TriangleData0103.coefficient6_251,
  OriginalRow227TriangleData0103.coefficient6_252,
  OriginalRow227TriangleData0103.coefficient6_253,
  OriginalRow227TriangleData0103.coefficient6_254,
  OriginalRow227TriangleData0103.coefficient6_255,
  OriginalRow227TriangleData0103.coefficient6_256,
  OriginalRow227TriangleData0103.coefficient6_257,
  OriginalRow227TriangleData0103.coefficient6_258,
  OriginalRow227TriangleData0103.coefficient6_259,
  OriginalRow227TriangleData0103.coefficient6_260
]

theorem values0103_size : values0103.size = 32 := rfl

def block0103 : ℕ → Option IntervalDyadic := segment 229 values0103

theorem block0103_domain : ExactDomain block0103 229 261 := by
  simpa only [values0103_size] using segment_domain 229 values0103

theorem block0103_get (i : Fin 32) :
    block0103 (229 + i.val) = some (values0103[i.val]'(by rw [values0103_size]; exact i.isLt)) := by
  exact segment_get 229 values0103 ⟨i.val, by rw [values0103_size]; exact i.isLt⟩

def values0104 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0104.coefficient6_261,
  OriginalRow227TriangleData0104.coefficient6_262,
  OriginalRow227TriangleData0104.coefficient6_263,
  OriginalRow227TriangleData0104.coefficient6_264,
  OriginalRow227TriangleData0104.coefficient6_265,
  OriginalRow227TriangleData0104.coefficient6_266,
  OriginalRow227TriangleData0104.coefficient6_267,
  OriginalRow227TriangleData0104.coefficient6_268,
  OriginalRow227TriangleData0104.coefficient6_269,
  OriginalRow227TriangleData0104.coefficient6_270,
  OriginalRow227TriangleData0104.coefficient6_271,
  OriginalRow227TriangleData0104.coefficient6_272,
  OriginalRow227TriangleData0104.coefficient6_273,
  OriginalRow227TriangleData0104.coefficient6_274,
  OriginalRow227TriangleData0104.coefficient6_275,
  OriginalRow227TriangleData0104.coefficient6_276,
  OriginalRow227TriangleData0104.coefficient6_277,
  OriginalRow227TriangleData0104.coefficient6_278,
  OriginalRow227TriangleData0104.coefficient6_279,
  OriginalRow227TriangleData0104.coefficient6_280,
  OriginalRow227TriangleData0104.coefficient6_281,
  OriginalRow227TriangleData0104.coefficient6_282,
  OriginalRow227TriangleData0104.coefficient6_283,
  OriginalRow227TriangleData0104.coefficient6_284,
  OriginalRow227TriangleData0104.coefficient6_285,
  OriginalRow227TriangleData0104.coefficient6_286,
  OriginalRow227TriangleData0104.coefficient6_287,
  OriginalRow227TriangleData0104.coefficient6_288,
  OriginalRow227TriangleData0104.coefficient6_289,
  OriginalRow227TriangleData0104.coefficient6_290,
  OriginalRow227TriangleData0104.coefficient6_291,
  OriginalRow227TriangleData0104.coefficient6_292
]

theorem values0104_size : values0104.size = 32 := rfl

def block0104 : ℕ → Option IntervalDyadic := segment 261 values0104

theorem block0104_domain : ExactDomain block0104 261 293 := by
  simpa only [values0104_size] using segment_domain 261 values0104

theorem block0104_get (i : Fin 32) :
    block0104 (261 + i.val) = some (values0104[i.val]'(by rw [values0104_size]; exact i.isLt)) := by
  exact segment_get 261 values0104 ⟨i.val, by rw [values0104_size]; exact i.isLt⟩

def values0105 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0105.coefficient6_293,
  OriginalRow227TriangleData0105.coefficient6_294,
  OriginalRow227TriangleData0105.coefficient6_295,
  OriginalRow227TriangleData0105.coefficient6_296,
  OriginalRow227TriangleData0105.coefficient6_297,
  OriginalRow227TriangleData0105.coefficient6_298,
  OriginalRow227TriangleData0105.coefficient6_299,
  OriginalRow227TriangleData0105.coefficient6_300,
  OriginalRow227TriangleData0105.coefficient6_301,
  OriginalRow227TriangleData0105.coefficient6_302,
  OriginalRow227TriangleData0105.coefficient6_303,
  OriginalRow227TriangleData0105.coefficient6_304,
  OriginalRow227TriangleData0105.coefficient6_305,
  OriginalRow227TriangleData0105.coefficient6_306,
  OriginalRow227TriangleData0105.coefficient6_307,
  OriginalRow227TriangleData0105.coefficient6_308,
  OriginalRow227TriangleData0105.coefficient6_309,
  OriginalRow227TriangleData0105.coefficient6_310,
  OriginalRow227TriangleData0105.coefficient6_311,
  OriginalRow227TriangleData0105.coefficient6_312,
  OriginalRow227TriangleData0105.coefficient6_313,
  OriginalRow227TriangleData0105.coefficient6_314,
  OriginalRow227TriangleData0105.coefficient6_315,
  OriginalRow227TriangleData0105.coefficient6_316,
  OriginalRow227TriangleData0105.coefficient6_317,
  OriginalRow227TriangleData0105.coefficient6_318,
  OriginalRow227TriangleData0105.coefficient6_319,
  OriginalRow227TriangleData0105.coefficient6_320,
  OriginalRow227TriangleData0105.coefficient6_321,
  OriginalRow227TriangleData0105.coefficient6_322,
  OriginalRow227TriangleData0105.coefficient6_323,
  OriginalRow227TriangleData0105.coefficient6_324
]

theorem values0105_size : values0105.size = 32 := rfl

def block0105 : ℕ → Option IntervalDyadic := segment 293 values0105

theorem block0105_domain : ExactDomain block0105 293 325 := by
  simpa only [values0105_size] using segment_domain 293 values0105

theorem block0105_get (i : Fin 32) :
    block0105 (293 + i.val) = some (values0105[i.val]'(by rw [values0105_size]; exact i.isLt)) := by
  exact segment_get 293 values0105 ⟨i.val, by rw [values0105_size]; exact i.isLt⟩

def values0106 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0106.coefficient6_325,
  OriginalRow227TriangleData0106.coefficient6_326,
  OriginalRow227TriangleData0106.coefficient6_327,
  OriginalRow227TriangleData0106.coefficient6_328,
  OriginalRow227TriangleData0106.coefficient6_329,
  OriginalRow227TriangleData0106.coefficient6_330,
  OriginalRow227TriangleData0106.coefficient6_331,
  OriginalRow227TriangleData0106.coefficient6_332,
  OriginalRow227TriangleData0106.coefficient6_333,
  OriginalRow227TriangleData0106.coefficient6_334,
  OriginalRow227TriangleData0106.coefficient6_335,
  OriginalRow227TriangleData0106.coefficient6_336,
  OriginalRow227TriangleData0106.coefficient6_337,
  OriginalRow227TriangleData0106.coefficient6_338,
  OriginalRow227TriangleData0106.coefficient6_339,
  OriginalRow227TriangleData0106.coefficient6_340,
  OriginalRow227TriangleData0106.coefficient6_341,
  OriginalRow227TriangleData0106.coefficient6_342,
  OriginalRow227TriangleData0106.coefficient6_343,
  OriginalRow227TriangleData0106.coefficient6_344,
  OriginalRow227TriangleData0106.coefficient6_345,
  OriginalRow227TriangleData0106.coefficient6_346,
  OriginalRow227TriangleData0106.coefficient6_347,
  OriginalRow227TriangleData0106.coefficient6_348,
  OriginalRow227TriangleData0106.coefficient6_349,
  OriginalRow227TriangleData0106.coefficient6_350,
  OriginalRow227TriangleData0106.coefficient6_351,
  OriginalRow227TriangleData0106.coefficient6_352,
  OriginalRow227TriangleData0106.coefficient6_353,
  OriginalRow227TriangleData0106.coefficient6_354,
  OriginalRow227TriangleData0106.coefficient6_355,
  OriginalRow227TriangleData0106.coefficient6_356
]

theorem values0106_size : values0106.size = 32 := rfl

def block0106 : ℕ → Option IntervalDyadic := segment 325 values0106

theorem block0106_domain : ExactDomain block0106 325 357 := by
  simpa only [values0106_size] using segment_domain 325 values0106

theorem block0106_get (i : Fin 32) :
    block0106 (325 + i.val) = some (values0106[i.val]'(by rw [values0106_size]; exact i.isLt)) := by
  exact segment_get 325 values0106 ⟨i.val, by rw [values0106_size]; exact i.isLt⟩

def values0107 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0107.coefficient6_357,
  OriginalRow227TriangleData0107.coefficient6_358,
  OriginalRow227TriangleData0107.coefficient6_359,
  OriginalRow227TriangleData0107.coefficient6_360,
  OriginalRow227TriangleData0107.coefficient6_361,
  OriginalRow227TriangleData0107.coefficient6_362,
  OriginalRow227TriangleData0107.coefficient6_363,
  OriginalRow227TriangleData0107.coefficient6_364,
  OriginalRow227TriangleData0107.coefficient6_365,
  OriginalRow227TriangleData0107.coefficient6_366,
  OriginalRow227TriangleData0107.coefficient6_367,
  OriginalRow227TriangleData0107.coefficient6_368,
  OriginalRow227TriangleData0107.coefficient6_369,
  OriginalRow227TriangleData0107.coefficient6_370,
  OriginalRow227TriangleData0107.coefficient6_371,
  OriginalRow227TriangleData0107.coefficient6_372,
  OriginalRow227TriangleData0107.coefficient6_373,
  OriginalRow227TriangleData0107.coefficient6_374,
  OriginalRow227TriangleData0107.coefficient6_375,
  OriginalRow227TriangleData0107.coefficient6_376,
  OriginalRow227TriangleData0107.coefficient6_377,
  OriginalRow227TriangleData0107.coefficient6_378,
  OriginalRow227TriangleData0107.coefficient6_379,
  OriginalRow227TriangleData0107.coefficient6_380,
  OriginalRow227TriangleData0107.coefficient6_381,
  OriginalRow227TriangleData0107.coefficient6_382,
  OriginalRow227TriangleData0107.coefficient6_383,
  OriginalRow227TriangleData0107.coefficient6_384,
  OriginalRow227TriangleData0107.coefficient6_385,
  OriginalRow227TriangleData0107.coefficient6_386,
  OriginalRow227TriangleData0107.coefficient6_387,
  OriginalRow227TriangleData0107.coefficient6_388
]

theorem values0107_size : values0107.size = 32 := rfl

def block0107 : ℕ → Option IntervalDyadic := segment 357 values0107

theorem block0107_domain : ExactDomain block0107 357 389 := by
  simpa only [values0107_size] using segment_domain 357 values0107

theorem block0107_get (i : Fin 32) :
    block0107 (357 + i.val) = some (values0107[i.val]'(by rw [values0107_size]; exact i.isLt)) := by
  exact segment_get 357 values0107 ⟨i.val, by rw [values0107_size]; exact i.isLt⟩

def values0108 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0108.coefficient6_389,
  OriginalRow227TriangleData0108.coefficient6_390,
  OriginalRow227TriangleData0108.coefficient6_391,
  OriginalRow227TriangleData0108.coefficient6_392,
  OriginalRow227TriangleData0108.coefficient6_393,
  OriginalRow227TriangleData0108.coefficient6_394,
  OriginalRow227TriangleData0108.coefficient6_395,
  OriginalRow227TriangleData0108.coefficient6_396,
  OriginalRow227TriangleData0108.coefficient6_397,
  OriginalRow227TriangleData0108.coefficient6_398,
  OriginalRow227TriangleData0108.coefficient6_399,
  OriginalRow227TriangleData0108.coefficient6_400,
  OriginalRow227TriangleData0108.coefficient6_401,
  OriginalRow227TriangleData0108.coefficient6_402,
  OriginalRow227TriangleData0108.coefficient6_403,
  OriginalRow227TriangleData0108.coefficient6_404,
  OriginalRow227TriangleData0108.coefficient6_405,
  OriginalRow227TriangleData0108.coefficient6_406,
  OriginalRow227TriangleData0108.coefficient6_407,
  OriginalRow227TriangleData0108.coefficient6_408,
  OriginalRow227TriangleData0108.coefficient6_409,
  OriginalRow227TriangleData0108.coefficient6_410,
  OriginalRow227TriangleData0108.coefficient6_411,
  OriginalRow227TriangleData0108.coefficient6_412,
  OriginalRow227TriangleData0108.coefficient6_413,
  OriginalRow227TriangleData0108.coefficient6_414,
  OriginalRow227TriangleData0108.coefficient6_415,
  OriginalRow227TriangleData0108.coefficient6_416,
  OriginalRow227TriangleData0108.coefficient6_417,
  OriginalRow227TriangleData0108.coefficient6_418,
  OriginalRow227TriangleData0108.coefficient6_419,
  OriginalRow227TriangleData0108.coefficient6_420
]

theorem values0108_size : values0108.size = 32 := rfl

def block0108 : ℕ → Option IntervalDyadic := segment 389 values0108

theorem block0108_domain : ExactDomain block0108 389 421 := by
  simpa only [values0108_size] using segment_domain 389 values0108

theorem block0108_get (i : Fin 32) :
    block0108 (389 + i.val) = some (values0108[i.val]'(by rw [values0108_size]; exact i.isLt)) := by
  exact segment_get 389 values0108 ⟨i.val, by rw [values0108_size]; exact i.isLt⟩

def values0109 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0109.coefficient6_421,
  OriginalRow227TriangleData0109.coefficient6_422,
  OriginalRow227TriangleData0109.coefficient6_423,
  OriginalRow227TriangleData0109.coefficient6_424,
  OriginalRow227TriangleData0109.coefficient6_425,
  OriginalRow227TriangleData0109.coefficient6_426,
  OriginalRow227TriangleData0109.coefficient6_427,
  OriginalRow227TriangleData0109.coefficient6_428,
  OriginalRow227TriangleData0109.coefficient6_429,
  OriginalRow227TriangleData0109.coefficient6_430,
  OriginalRow227TriangleData0109.coefficient6_431,
  OriginalRow227TriangleData0109.coefficient6_432,
  OriginalRow227TriangleData0109.coefficient6_433,
  OriginalRow227TriangleData0109.coefficient6_434,
  OriginalRow227TriangleData0109.coefficient6_435,
  OriginalRow227TriangleData0109.coefficient6_436,
  OriginalRow227TriangleData0109.coefficient6_437,
  OriginalRow227TriangleData0109.coefficient6_438,
  OriginalRow227TriangleData0109.coefficient6_439,
  OriginalRow227TriangleData0109.coefficient6_440,
  OriginalRow227TriangleData0109.coefficient6_441,
  OriginalRow227TriangleData0109.coefficient6_442,
  OriginalRow227TriangleData0109.coefficient6_443,
  OriginalRow227TriangleData0109.coefficient6_444,
  OriginalRow227TriangleData0109.coefficient6_445,
  OriginalRow227TriangleData0109.coefficient6_446,
  OriginalRow227TriangleData0109.coefficient6_447,
  OriginalRow227TriangleData0109.coefficient6_448,
  OriginalRow227TriangleData0109.coefficient6_449,
  OriginalRow227TriangleData0109.coefficient6_450,
  OriginalRow227TriangleData0109.coefficient6_451,
  OriginalRow227TriangleData0109.coefficient6_452
]

theorem values0109_size : values0109.size = 32 := rfl

def block0109 : ℕ → Option IntervalDyadic := segment 421 values0109

theorem block0109_domain : ExactDomain block0109 421 453 := by
  simpa only [values0109_size] using segment_domain 421 values0109

theorem block0109_get (i : Fin 32) :
    block0109 (421 + i.val) = some (values0109[i.val]'(by rw [values0109_size]; exact i.isLt)) := by
  exact segment_get 421 values0109 ⟨i.val, by rw [values0109_size]; exact i.isLt⟩

def values0110 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0110.coefficient6_453,
  OriginalRow227TriangleData0110.coefficient6_454,
  OriginalRow227TriangleData0110.coefficient6_455,
  OriginalRow227TriangleData0110.coefficient6_456,
  OriginalRow227TriangleData0110.coefficient6_457,
  OriginalRow227TriangleData0110.coefficient6_458,
  OriginalRow227TriangleData0110.coefficient6_459,
  OriginalRow227TriangleData0110.coefficient6_460,
  OriginalRow227TriangleData0110.coefficient6_461,
  OriginalRow227TriangleData0110.coefficient6_462,
  OriginalRow227TriangleData0110.coefficient6_463,
  OriginalRow227TriangleData0110.coefficient6_464,
  OriginalRow227TriangleData0110.coefficient6_465,
  OriginalRow227TriangleData0110.coefficient6_466,
  OriginalRow227TriangleData0110.coefficient6_467,
  OriginalRow227TriangleData0110.coefficient6_468,
  OriginalRow227TriangleData0110.coefficient6_469,
  OriginalRow227TriangleData0110.coefficient6_470,
  OriginalRow227TriangleData0110.coefficient6_471,
  OriginalRow227TriangleData0110.coefficient6_472,
  OriginalRow227TriangleData0110.coefficient6_473,
  OriginalRow227TriangleData0110.coefficient6_474,
  OriginalRow227TriangleData0110.coefficient6_475,
  OriginalRow227TriangleData0110.coefficient6_476,
  OriginalRow227TriangleData0110.coefficient6_477,
  OriginalRow227TriangleData0110.coefficient6_478,
  OriginalRow227TriangleData0110.coefficient6_479,
  OriginalRow227TriangleData0110.coefficient6_480,
  OriginalRow227TriangleData0110.coefficient6_481,
  OriginalRow227TriangleData0110.coefficient6_482,
  OriginalRow227TriangleData0110.coefficient6_483,
  OriginalRow227TriangleData0110.coefficient6_484
]

theorem values0110_size : values0110.size = 32 := rfl

def block0110 : ℕ → Option IntervalDyadic := segment 453 values0110

theorem block0110_domain : ExactDomain block0110 453 485 := by
  simpa only [values0110_size] using segment_domain 453 values0110

theorem block0110_get (i : Fin 32) :
    block0110 (453 + i.val) = some (values0110[i.val]'(by rw [values0110_size]; exact i.isLt)) := by
  exact segment_get 453 values0110 ⟨i.val, by rw [values0110_size]; exact i.isLt⟩

def values0111 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0111.coefficient6_485,
  OriginalRow227TriangleData0111.coefficient6_486,
  OriginalRow227TriangleData0111.coefficient6_487,
  OriginalRow227TriangleData0111.coefficient6_488,
  OriginalRow227TriangleData0111.coefficient6_489,
  OriginalRow227TriangleData0111.coefficient6_490,
  OriginalRow227TriangleData0111.coefficient6_491,
  OriginalRow227TriangleData0111.coefficient6_492,
  OriginalRow227TriangleData0111.coefficient6_493,
  OriginalRow227TriangleData0111.coefficient6_494,
  OriginalRow227TriangleData0111.coefficient6_495
]

theorem values0111_size : values0111.size = 11 := rfl

def block0111 : ℕ → Option IntervalDyadic := segment 485 values0111

theorem block0111_domain : ExactDomain block0111 485 496 := by
  simpa only [values0111_size] using segment_domain 485 values0111

theorem block0111_get (i : Fin 11) :
    block0111 (485 + i.val) = some (values0111[i.val]'(by rw [values0111_size]; exact i.isLt)) := by
  exact segment_get 485 values0111 ⟨i.val, by rw [values0111_size]; exact i.isLt⟩

def node0005_0069 : ℕ → Option IntervalDyadic := split 37 block0096 block0097

theorem node0005_0069_domain : ExactDomain node0005_0069 5 69 := by
  exact split_domain (by decide) (by decide) block0096_domain block0097_domain

def node0069_0133 : ℕ → Option IntervalDyadic := split 101 block0098 block0099

theorem node0069_0133_domain : ExactDomain node0069_0133 69 133 := by
  exact split_domain (by decide) (by decide) block0098_domain block0099_domain

def node0005_0133 : ℕ → Option IntervalDyadic := split 69 node0005_0069 node0069_0133

theorem node0005_0133_domain : ExactDomain node0005_0133 5 133 := by
  exact split_domain (by decide) (by decide) node0005_0069_domain node0069_0133_domain

def node0133_0197 : ℕ → Option IntervalDyadic := split 165 block0100 block0101

theorem node0133_0197_domain : ExactDomain node0133_0197 133 197 := by
  exact split_domain (by decide) (by decide) block0100_domain block0101_domain

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block0102 block0103

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block0102_domain block0103_domain

def node0133_0261 : ℕ → Option IntervalDyadic := split 197 node0133_0197 node0197_0261

theorem node0133_0261_domain : ExactDomain node0133_0261 133 261 := by
  exact split_domain (by decide) (by decide) node0133_0197_domain node0197_0261_domain

def node0005_0261 : ℕ → Option IntervalDyadic := split 133 node0005_0133 node0133_0261

theorem node0005_0261_domain : ExactDomain node0005_0261 5 261 := by
  exact split_domain (by decide) (by decide) node0005_0133_domain node0133_0261_domain

def node0261_0325 : ℕ → Option IntervalDyadic := split 293 block0104 block0105

theorem node0261_0325_domain : ExactDomain node0261_0325 261 325 := by
  exact split_domain (by decide) (by decide) block0104_domain block0105_domain

def node0325_0389 : ℕ → Option IntervalDyadic := split 357 block0106 block0107

theorem node0325_0389_domain : ExactDomain node0325_0389 325 389 := by
  exact split_domain (by decide) (by decide) block0106_domain block0107_domain

def node0261_0389 : ℕ → Option IntervalDyadic := split 325 node0261_0325 node0325_0389

theorem node0261_0389_domain : ExactDomain node0261_0389 261 389 := by
  exact split_domain (by decide) (by decide) node0261_0325_domain node0325_0389_domain

def node0389_0453 : ℕ → Option IntervalDyadic := split 421 block0108 block0109

theorem node0389_0453_domain : ExactDomain node0389_0453 389 453 := by
  exact split_domain (by decide) (by decide) block0108_domain block0109_domain

def node0453_0496 : ℕ → Option IntervalDyadic := split 485 block0110 block0111

theorem node0453_0496_domain : ExactDomain node0453_0496 453 496 := by
  exact split_domain (by decide) (by decide) block0110_domain block0111_domain

def node0389_0496 : ℕ → Option IntervalDyadic := split 453 node0389_0453 node0453_0496

theorem node0389_0496_domain : ExactDomain node0389_0496 389 496 := by
  exact split_domain (by decide) (by decide) node0389_0453_domain node0453_0496_domain

def node0261_0496 : ℕ → Option IntervalDyadic := split 389 node0261_0389 node0389_0496

theorem node0261_0496_domain : ExactDomain node0261_0496 261 496 := by
  exact split_domain (by decide) (by decide) node0261_0389_domain node0389_0496_domain

def node0005_0496 : ℕ → Option IntervalDyadic := split 261 node0005_0261 node0261_0496

theorem node0005_0496_domain : ExactDomain node0005_0496 5 496 := by
  exact split_domain (by decide) (by decide) node0005_0261_domain node0261_0496_domain

def lookup : ℕ → Option IntervalDyadic := node0005_0496

theorem lookup_domain : ExactDomain lookup 5 496 :=
  node0005_0496_domain

theorem block0096_lookup (i : Fin 32) :
    lookup (5 + i.val) = some (values0096[i.val]'(by rw [values0096_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (5 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_left 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0005_0133, split_left 69 node0005_0069 node0069_0133 (by omega)]
  rw [node0005_0069, split_left 37 block0096 block0097 (by omega)]
  exact block0096_get i

theorem block0097_lookup (i : Fin 32) :
    lookup (37 + i.val) = some (values0097[i.val]'(by rw [values0097_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (37 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_left 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0005_0133, split_left 69 node0005_0069 node0069_0133 (by omega)]
  rw [node0005_0069, split_right 37 block0096 block0097 (by omega)]
  exact block0097_get i

theorem block0098_lookup (i : Fin 32) :
    lookup (69 + i.val) = some (values0098[i.val]'(by rw [values0098_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (69 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_left 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0005_0133, split_right 69 node0005_0069 node0069_0133 (by omega)]
  rw [node0069_0133, split_left 101 block0098 block0099 (by omega)]
  exact block0098_get i

theorem block0099_lookup (i : Fin 32) :
    lookup (101 + i.val) = some (values0099[i.val]'(by rw [values0099_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (101 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_left 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0005_0133, split_right 69 node0005_0069 node0069_0133 (by omega)]
  rw [node0069_0133, split_right 101 block0098 block0099 (by omega)]
  exact block0099_get i

theorem block0100_lookup (i : Fin 32) :
    lookup (133 + i.val) = some (values0100[i.val]'(by rw [values0100_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (133 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_right 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_left 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0133_0197, split_left 165 block0100 block0101 (by omega)]
  exact block0100_get i

theorem block0101_lookup (i : Fin 32) :
    lookup (165 + i.val) = some (values0101[i.val]'(by rw [values0101_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (165 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_right 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_left 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0133_0197, split_right 165 block0100 block0101 (by omega)]
  exact block0101_get i

theorem block0102_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values0102[i.val]'(by rw [values0102_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (197 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_right 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_right 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0197_0261, split_left 229 block0102 block0103 (by omega)]
  exact block0102_get i

theorem block0103_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values0103[i.val]'(by rw [values0103_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (229 + i.val) = _
  rw [node0005_0496, split_left 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0005_0261, split_right 133 node0005_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_right 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0197_0261, split_right 229 block0102 block0103 (by omega)]
  exact block0103_get i

theorem block0104_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values0104[i.val]'(by rw [values0104_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (261 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_left 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0261_0389, split_left 325 node0261_0325 node0325_0389 (by omega)]
  rw [node0261_0325, split_left 293 block0104 block0105 (by omega)]
  exact block0104_get i

theorem block0105_lookup (i : Fin 32) :
    lookup (293 + i.val) = some (values0105[i.val]'(by rw [values0105_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (293 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_left 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0261_0389, split_left 325 node0261_0325 node0325_0389 (by omega)]
  rw [node0261_0325, split_right 293 block0104 block0105 (by omega)]
  exact block0105_get i

theorem block0106_lookup (i : Fin 32) :
    lookup (325 + i.val) = some (values0106[i.val]'(by rw [values0106_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (325 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_left 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0261_0389, split_right 325 node0261_0325 node0325_0389 (by omega)]
  rw [node0325_0389, split_left 357 block0106 block0107 (by omega)]
  exact block0106_get i

theorem block0107_lookup (i : Fin 32) :
    lookup (357 + i.val) = some (values0107[i.val]'(by rw [values0107_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (357 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_left 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0261_0389, split_right 325 node0261_0325 node0325_0389 (by omega)]
  rw [node0325_0389, split_right 357 block0106 block0107 (by omega)]
  exact block0107_get i

theorem block0108_lookup (i : Fin 32) :
    lookup (389 + i.val) = some (values0108[i.val]'(by rw [values0108_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (389 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_right 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0389_0496, split_left 453 node0389_0453 node0453_0496 (by omega)]
  rw [node0389_0453, split_left 421 block0108 block0109 (by omega)]
  exact block0108_get i

theorem block0109_lookup (i : Fin 32) :
    lookup (421 + i.val) = some (values0109[i.val]'(by rw [values0109_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (421 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_right 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0389_0496, split_left 453 node0389_0453 node0453_0496 (by omega)]
  rw [node0389_0453, split_right 421 block0108 block0109 (by omega)]
  exact block0109_get i

theorem block0110_lookup (i : Fin 32) :
    lookup (453 + i.val) = some (values0110[i.val]'(by rw [values0110_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (453 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_right 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0389_0496, split_right 453 node0389_0453 node0453_0496 (by omega)]
  rw [node0453_0496, split_left 485 block0110 block0111 (by omega)]
  exact block0110_get i

theorem block0111_lookup (i : Fin 11) :
    lookup (485 + i.val) = some (values0111[i.val]'(by rw [values0111_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0005_0496 (485 + i.val) = _
  rw [node0005_0496, split_right 261 node0005_0261 node0261_0496 (by omega)]
  rw [node0261_0496, split_right 389 node0261_0389 node0389_0496 (by omega)]
  rw [node0389_0496, split_right 453 node0389_0453 node0453_0496 (by omega)]
  rw [node0453_0496, split_right 485 block0110 block0111 (by omega)]
  exact block0111_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0096_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0096_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0097_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0097_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0098_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0098_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0099_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0099_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0100_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0100_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0101_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0101_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0102_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0102_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0103_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0103_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0104_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0104_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0105_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0105_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0106_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0106_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0107_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0107_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0108_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0108_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0109_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0109_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0110_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0110_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0111_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0111_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0096_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0097_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0098_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0099_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0100_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0101_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0102_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0103_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0104_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0105_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0106_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0107_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0108_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0109_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0110_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow006.block0111_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow006
