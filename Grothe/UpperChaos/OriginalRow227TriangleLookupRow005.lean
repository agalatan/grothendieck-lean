import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0080
import Grothe.UpperChaos.OriginalRow227TriangleData0081
import Grothe.UpperChaos.OriginalRow227TriangleData0082
import Grothe.UpperChaos.OriginalRow227TriangleData0083
import Grothe.UpperChaos.OriginalRow227TriangleData0084
import Grothe.UpperChaos.OriginalRow227TriangleData0085
import Grothe.UpperChaos.OriginalRow227TriangleData0086
import Grothe.UpperChaos.OriginalRow227TriangleData0087
import Grothe.UpperChaos.OriginalRow227TriangleData0088
import Grothe.UpperChaos.OriginalRow227TriangleData0089
import Grothe.UpperChaos.OriginalRow227TriangleData0090
import Grothe.UpperChaos.OriginalRow227TriangleData0091
import Grothe.UpperChaos.OriginalRow227TriangleData0092
import Grothe.UpperChaos.OriginalRow227TriangleData0093
import Grothe.UpperChaos.OriginalRow227TriangleData0094
import Grothe.UpperChaos.OriginalRow227TriangleData0095

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow005

open ConditionalTableLookup

def values0080 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0080.coefficient5_4,
  OriginalRow227TriangleData0080.coefficient5_5,
  OriginalRow227TriangleData0080.coefficient5_6,
  OriginalRow227TriangleData0080.coefficient5_7,
  OriginalRow227TriangleData0080.coefficient5_8,
  OriginalRow227TriangleData0080.coefficient5_9,
  OriginalRow227TriangleData0080.coefficient5_10,
  OriginalRow227TriangleData0080.coefficient5_11,
  OriginalRow227TriangleData0080.coefficient5_12,
  OriginalRow227TriangleData0080.coefficient5_13,
  OriginalRow227TriangleData0080.coefficient5_14,
  OriginalRow227TriangleData0080.coefficient5_15,
  OriginalRow227TriangleData0080.coefficient5_16,
  OriginalRow227TriangleData0080.coefficient5_17,
  OriginalRow227TriangleData0080.coefficient5_18,
  OriginalRow227TriangleData0080.coefficient5_19,
  OriginalRow227TriangleData0080.coefficient5_20,
  OriginalRow227TriangleData0080.coefficient5_21,
  OriginalRow227TriangleData0080.coefficient5_22,
  OriginalRow227TriangleData0080.coefficient5_23,
  OriginalRow227TriangleData0080.coefficient5_24,
  OriginalRow227TriangleData0080.coefficient5_25,
  OriginalRow227TriangleData0080.coefficient5_26,
  OriginalRow227TriangleData0080.coefficient5_27,
  OriginalRow227TriangleData0080.coefficient5_28,
  OriginalRow227TriangleData0080.coefficient5_29,
  OriginalRow227TriangleData0080.coefficient5_30,
  OriginalRow227TriangleData0080.coefficient5_31,
  OriginalRow227TriangleData0080.coefficient5_32,
  OriginalRow227TriangleData0080.coefficient5_33,
  OriginalRow227TriangleData0080.coefficient5_34,
  OriginalRow227TriangleData0080.coefficient5_35
]

theorem values0080_size : values0080.size = 32 := rfl

def block0080 : ℕ → Option IntervalDyadic := segment 4 values0080

theorem block0080_domain : ExactDomain block0080 4 36 := by
  simpa only [values0080_size] using segment_domain 4 values0080

theorem block0080_get (i : Fin 32) :
    block0080 (4 + i.val) = some (values0080[i.val]'(by rw [values0080_size]; exact i.isLt)) := by
  exact segment_get 4 values0080 ⟨i.val, by rw [values0080_size]; exact i.isLt⟩

def values0081 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0081.coefficient5_36,
  OriginalRow227TriangleData0081.coefficient5_37,
  OriginalRow227TriangleData0081.coefficient5_38,
  OriginalRow227TriangleData0081.coefficient5_39,
  OriginalRow227TriangleData0081.coefficient5_40,
  OriginalRow227TriangleData0081.coefficient5_41,
  OriginalRow227TriangleData0081.coefficient5_42,
  OriginalRow227TriangleData0081.coefficient5_43,
  OriginalRow227TriangleData0081.coefficient5_44,
  OriginalRow227TriangleData0081.coefficient5_45,
  OriginalRow227TriangleData0081.coefficient5_46,
  OriginalRow227TriangleData0081.coefficient5_47,
  OriginalRow227TriangleData0081.coefficient5_48,
  OriginalRow227TriangleData0081.coefficient5_49,
  OriginalRow227TriangleData0081.coefficient5_50,
  OriginalRow227TriangleData0081.coefficient5_51,
  OriginalRow227TriangleData0081.coefficient5_52,
  OriginalRow227TriangleData0081.coefficient5_53,
  OriginalRow227TriangleData0081.coefficient5_54,
  OriginalRow227TriangleData0081.coefficient5_55,
  OriginalRow227TriangleData0081.coefficient5_56,
  OriginalRow227TriangleData0081.coefficient5_57,
  OriginalRow227TriangleData0081.coefficient5_58,
  OriginalRow227TriangleData0081.coefficient5_59,
  OriginalRow227TriangleData0081.coefficient5_60,
  OriginalRow227TriangleData0081.coefficient5_61,
  OriginalRow227TriangleData0081.coefficient5_62,
  OriginalRow227TriangleData0081.coefficient5_63,
  OriginalRow227TriangleData0081.coefficient5_64,
  OriginalRow227TriangleData0081.coefficient5_65,
  OriginalRow227TriangleData0081.coefficient5_66,
  OriginalRow227TriangleData0081.coefficient5_67
]

theorem values0081_size : values0081.size = 32 := rfl

def block0081 : ℕ → Option IntervalDyadic := segment 36 values0081

theorem block0081_domain : ExactDomain block0081 36 68 := by
  simpa only [values0081_size] using segment_domain 36 values0081

theorem block0081_get (i : Fin 32) :
    block0081 (36 + i.val) = some (values0081[i.val]'(by rw [values0081_size]; exact i.isLt)) := by
  exact segment_get 36 values0081 ⟨i.val, by rw [values0081_size]; exact i.isLt⟩

def values0082 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0082.coefficient5_68,
  OriginalRow227TriangleData0082.coefficient5_69,
  OriginalRow227TriangleData0082.coefficient5_70,
  OriginalRow227TriangleData0082.coefficient5_71,
  OriginalRow227TriangleData0082.coefficient5_72,
  OriginalRow227TriangleData0082.coefficient5_73,
  OriginalRow227TriangleData0082.coefficient5_74,
  OriginalRow227TriangleData0082.coefficient5_75,
  OriginalRow227TriangleData0082.coefficient5_76,
  OriginalRow227TriangleData0082.coefficient5_77,
  OriginalRow227TriangleData0082.coefficient5_78,
  OriginalRow227TriangleData0082.coefficient5_79,
  OriginalRow227TriangleData0082.coefficient5_80,
  OriginalRow227TriangleData0082.coefficient5_81,
  OriginalRow227TriangleData0082.coefficient5_82,
  OriginalRow227TriangleData0082.coefficient5_83,
  OriginalRow227TriangleData0082.coefficient5_84,
  OriginalRow227TriangleData0082.coefficient5_85,
  OriginalRow227TriangleData0082.coefficient5_86,
  OriginalRow227TriangleData0082.coefficient5_87,
  OriginalRow227TriangleData0082.coefficient5_88,
  OriginalRow227TriangleData0082.coefficient5_89,
  OriginalRow227TriangleData0082.coefficient5_90,
  OriginalRow227TriangleData0082.coefficient5_91,
  OriginalRow227TriangleData0082.coefficient5_92,
  OriginalRow227TriangleData0082.coefficient5_93,
  OriginalRow227TriangleData0082.coefficient5_94,
  OriginalRow227TriangleData0082.coefficient5_95,
  OriginalRow227TriangleData0082.coefficient5_96,
  OriginalRow227TriangleData0082.coefficient5_97,
  OriginalRow227TriangleData0082.coefficient5_98,
  OriginalRow227TriangleData0082.coefficient5_99
]

theorem values0082_size : values0082.size = 32 := rfl

def block0082 : ℕ → Option IntervalDyadic := segment 68 values0082

theorem block0082_domain : ExactDomain block0082 68 100 := by
  simpa only [values0082_size] using segment_domain 68 values0082

theorem block0082_get (i : Fin 32) :
    block0082 (68 + i.val) = some (values0082[i.val]'(by rw [values0082_size]; exact i.isLt)) := by
  exact segment_get 68 values0082 ⟨i.val, by rw [values0082_size]; exact i.isLt⟩

def values0083 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0083.coefficient5_100,
  OriginalRow227TriangleData0083.coefficient5_101,
  OriginalRow227TriangleData0083.coefficient5_102,
  OriginalRow227TriangleData0083.coefficient5_103,
  OriginalRow227TriangleData0083.coefficient5_104,
  OriginalRow227TriangleData0083.coefficient5_105,
  OriginalRow227TriangleData0083.coefficient5_106,
  OriginalRow227TriangleData0083.coefficient5_107,
  OriginalRow227TriangleData0083.coefficient5_108,
  OriginalRow227TriangleData0083.coefficient5_109,
  OriginalRow227TriangleData0083.coefficient5_110,
  OriginalRow227TriangleData0083.coefficient5_111,
  OriginalRow227TriangleData0083.coefficient5_112,
  OriginalRow227TriangleData0083.coefficient5_113,
  OriginalRow227TriangleData0083.coefficient5_114,
  OriginalRow227TriangleData0083.coefficient5_115,
  OriginalRow227TriangleData0083.coefficient5_116,
  OriginalRow227TriangleData0083.coefficient5_117,
  OriginalRow227TriangleData0083.coefficient5_118,
  OriginalRow227TriangleData0083.coefficient5_119,
  OriginalRow227TriangleData0083.coefficient5_120,
  OriginalRow227TriangleData0083.coefficient5_121,
  OriginalRow227TriangleData0083.coefficient5_122,
  OriginalRow227TriangleData0083.coefficient5_123,
  OriginalRow227TriangleData0083.coefficient5_124,
  OriginalRow227TriangleData0083.coefficient5_125,
  OriginalRow227TriangleData0083.coefficient5_126,
  OriginalRow227TriangleData0083.coefficient5_127,
  OriginalRow227TriangleData0083.coefficient5_128,
  OriginalRow227TriangleData0083.coefficient5_129,
  OriginalRow227TriangleData0083.coefficient5_130,
  OriginalRow227TriangleData0083.coefficient5_131
]

theorem values0083_size : values0083.size = 32 := rfl

def block0083 : ℕ → Option IntervalDyadic := segment 100 values0083

theorem block0083_domain : ExactDomain block0083 100 132 := by
  simpa only [values0083_size] using segment_domain 100 values0083

theorem block0083_get (i : Fin 32) :
    block0083 (100 + i.val) = some (values0083[i.val]'(by rw [values0083_size]; exact i.isLt)) := by
  exact segment_get 100 values0083 ⟨i.val, by rw [values0083_size]; exact i.isLt⟩

def values0084 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0084.coefficient5_132,
  OriginalRow227TriangleData0084.coefficient5_133,
  OriginalRow227TriangleData0084.coefficient5_134,
  OriginalRow227TriangleData0084.coefficient5_135,
  OriginalRow227TriangleData0084.coefficient5_136,
  OriginalRow227TriangleData0084.coefficient5_137,
  OriginalRow227TriangleData0084.coefficient5_138,
  OriginalRow227TriangleData0084.coefficient5_139,
  OriginalRow227TriangleData0084.coefficient5_140,
  OriginalRow227TriangleData0084.coefficient5_141,
  OriginalRow227TriangleData0084.coefficient5_142,
  OriginalRow227TriangleData0084.coefficient5_143,
  OriginalRow227TriangleData0084.coefficient5_144,
  OriginalRow227TriangleData0084.coefficient5_145,
  OriginalRow227TriangleData0084.coefficient5_146,
  OriginalRow227TriangleData0084.coefficient5_147,
  OriginalRow227TriangleData0084.coefficient5_148,
  OriginalRow227TriangleData0084.coefficient5_149,
  OriginalRow227TriangleData0084.coefficient5_150,
  OriginalRow227TriangleData0084.coefficient5_151,
  OriginalRow227TriangleData0084.coefficient5_152,
  OriginalRow227TriangleData0084.coefficient5_153,
  OriginalRow227TriangleData0084.coefficient5_154,
  OriginalRow227TriangleData0084.coefficient5_155,
  OriginalRow227TriangleData0084.coefficient5_156,
  OriginalRow227TriangleData0084.coefficient5_157,
  OriginalRow227TriangleData0084.coefficient5_158,
  OriginalRow227TriangleData0084.coefficient5_159,
  OriginalRow227TriangleData0084.coefficient5_160,
  OriginalRow227TriangleData0084.coefficient5_161,
  OriginalRow227TriangleData0084.coefficient5_162,
  OriginalRow227TriangleData0084.coefficient5_163
]

theorem values0084_size : values0084.size = 32 := rfl

def block0084 : ℕ → Option IntervalDyadic := segment 132 values0084

theorem block0084_domain : ExactDomain block0084 132 164 := by
  simpa only [values0084_size] using segment_domain 132 values0084

theorem block0084_get (i : Fin 32) :
    block0084 (132 + i.val) = some (values0084[i.val]'(by rw [values0084_size]; exact i.isLt)) := by
  exact segment_get 132 values0084 ⟨i.val, by rw [values0084_size]; exact i.isLt⟩

def values0085 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0085.coefficient5_164,
  OriginalRow227TriangleData0085.coefficient5_165,
  OriginalRow227TriangleData0085.coefficient5_166,
  OriginalRow227TriangleData0085.coefficient5_167,
  OriginalRow227TriangleData0085.coefficient5_168,
  OriginalRow227TriangleData0085.coefficient5_169,
  OriginalRow227TriangleData0085.coefficient5_170,
  OriginalRow227TriangleData0085.coefficient5_171,
  OriginalRow227TriangleData0085.coefficient5_172,
  OriginalRow227TriangleData0085.coefficient5_173,
  OriginalRow227TriangleData0085.coefficient5_174,
  OriginalRow227TriangleData0085.coefficient5_175,
  OriginalRow227TriangleData0085.coefficient5_176,
  OriginalRow227TriangleData0085.coefficient5_177,
  OriginalRow227TriangleData0085.coefficient5_178,
  OriginalRow227TriangleData0085.coefficient5_179,
  OriginalRow227TriangleData0085.coefficient5_180,
  OriginalRow227TriangleData0085.coefficient5_181,
  OriginalRow227TriangleData0085.coefficient5_182,
  OriginalRow227TriangleData0085.coefficient5_183,
  OriginalRow227TriangleData0085.coefficient5_184,
  OriginalRow227TriangleData0085.coefficient5_185,
  OriginalRow227TriangleData0085.coefficient5_186,
  OriginalRow227TriangleData0085.coefficient5_187,
  OriginalRow227TriangleData0085.coefficient5_188,
  OriginalRow227TriangleData0085.coefficient5_189,
  OriginalRow227TriangleData0085.coefficient5_190,
  OriginalRow227TriangleData0085.coefficient5_191,
  OriginalRow227TriangleData0085.coefficient5_192,
  OriginalRow227TriangleData0085.coefficient5_193,
  OriginalRow227TriangleData0085.coefficient5_194,
  OriginalRow227TriangleData0085.coefficient5_195
]

theorem values0085_size : values0085.size = 32 := rfl

def block0085 : ℕ → Option IntervalDyadic := segment 164 values0085

theorem block0085_domain : ExactDomain block0085 164 196 := by
  simpa only [values0085_size] using segment_domain 164 values0085

theorem block0085_get (i : Fin 32) :
    block0085 (164 + i.val) = some (values0085[i.val]'(by rw [values0085_size]; exact i.isLt)) := by
  exact segment_get 164 values0085 ⟨i.val, by rw [values0085_size]; exact i.isLt⟩

def values0086 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0086.coefficient5_196,
  OriginalRow227TriangleData0086.coefficient5_197,
  OriginalRow227TriangleData0086.coefficient5_198,
  OriginalRow227TriangleData0086.coefficient5_199,
  OriginalRow227TriangleData0086.coefficient5_200,
  OriginalRow227TriangleData0086.coefficient5_201,
  OriginalRow227TriangleData0086.coefficient5_202,
  OriginalRow227TriangleData0086.coefficient5_203,
  OriginalRow227TriangleData0086.coefficient5_204,
  OriginalRow227TriangleData0086.coefficient5_205,
  OriginalRow227TriangleData0086.coefficient5_206,
  OriginalRow227TriangleData0086.coefficient5_207,
  OriginalRow227TriangleData0086.coefficient5_208,
  OriginalRow227TriangleData0086.coefficient5_209,
  OriginalRow227TriangleData0086.coefficient5_210,
  OriginalRow227TriangleData0086.coefficient5_211,
  OriginalRow227TriangleData0086.coefficient5_212,
  OriginalRow227TriangleData0086.coefficient5_213,
  OriginalRow227TriangleData0086.coefficient5_214,
  OriginalRow227TriangleData0086.coefficient5_215,
  OriginalRow227TriangleData0086.coefficient5_216,
  OriginalRow227TriangleData0086.coefficient5_217,
  OriginalRow227TriangleData0086.coefficient5_218,
  OriginalRow227TriangleData0086.coefficient5_219,
  OriginalRow227TriangleData0086.coefficient5_220,
  OriginalRow227TriangleData0086.coefficient5_221,
  OriginalRow227TriangleData0086.coefficient5_222,
  OriginalRow227TriangleData0086.coefficient5_223,
  OriginalRow227TriangleData0086.coefficient5_224,
  OriginalRow227TriangleData0086.coefficient5_225,
  OriginalRow227TriangleData0086.coefficient5_226,
  OriginalRow227TriangleData0086.coefficient5_227
]

theorem values0086_size : values0086.size = 32 := rfl

def block0086 : ℕ → Option IntervalDyadic := segment 196 values0086

theorem block0086_domain : ExactDomain block0086 196 228 := by
  simpa only [values0086_size] using segment_domain 196 values0086

theorem block0086_get (i : Fin 32) :
    block0086 (196 + i.val) = some (values0086[i.val]'(by rw [values0086_size]; exact i.isLt)) := by
  exact segment_get 196 values0086 ⟨i.val, by rw [values0086_size]; exact i.isLt⟩

def values0087 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0087.coefficient5_228,
  OriginalRow227TriangleData0087.coefficient5_229,
  OriginalRow227TriangleData0087.coefficient5_230,
  OriginalRow227TriangleData0087.coefficient5_231,
  OriginalRow227TriangleData0087.coefficient5_232,
  OriginalRow227TriangleData0087.coefficient5_233,
  OriginalRow227TriangleData0087.coefficient5_234,
  OriginalRow227TriangleData0087.coefficient5_235,
  OriginalRow227TriangleData0087.coefficient5_236,
  OriginalRow227TriangleData0087.coefficient5_237,
  OriginalRow227TriangleData0087.coefficient5_238,
  OriginalRow227TriangleData0087.coefficient5_239,
  OriginalRow227TriangleData0087.coefficient5_240,
  OriginalRow227TriangleData0087.coefficient5_241,
  OriginalRow227TriangleData0087.coefficient5_242,
  OriginalRow227TriangleData0087.coefficient5_243,
  OriginalRow227TriangleData0087.coefficient5_244,
  OriginalRow227TriangleData0087.coefficient5_245,
  OriginalRow227TriangleData0087.coefficient5_246,
  OriginalRow227TriangleData0087.coefficient5_247,
  OriginalRow227TriangleData0087.coefficient5_248,
  OriginalRow227TriangleData0087.coefficient5_249,
  OriginalRow227TriangleData0087.coefficient5_250,
  OriginalRow227TriangleData0087.coefficient5_251,
  OriginalRow227TriangleData0087.coefficient5_252,
  OriginalRow227TriangleData0087.coefficient5_253,
  OriginalRow227TriangleData0087.coefficient5_254,
  OriginalRow227TriangleData0087.coefficient5_255,
  OriginalRow227TriangleData0087.coefficient5_256,
  OriginalRow227TriangleData0087.coefficient5_257,
  OriginalRow227TriangleData0087.coefficient5_258,
  OriginalRow227TriangleData0087.coefficient5_259
]

theorem values0087_size : values0087.size = 32 := rfl

def block0087 : ℕ → Option IntervalDyadic := segment 228 values0087

theorem block0087_domain : ExactDomain block0087 228 260 := by
  simpa only [values0087_size] using segment_domain 228 values0087

theorem block0087_get (i : Fin 32) :
    block0087 (228 + i.val) = some (values0087[i.val]'(by rw [values0087_size]; exact i.isLt)) := by
  exact segment_get 228 values0087 ⟨i.val, by rw [values0087_size]; exact i.isLt⟩

def values0088 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0088.coefficient5_260,
  OriginalRow227TriangleData0088.coefficient5_261,
  OriginalRow227TriangleData0088.coefficient5_262,
  OriginalRow227TriangleData0088.coefficient5_263,
  OriginalRow227TriangleData0088.coefficient5_264,
  OriginalRow227TriangleData0088.coefficient5_265,
  OriginalRow227TriangleData0088.coefficient5_266,
  OriginalRow227TriangleData0088.coefficient5_267,
  OriginalRow227TriangleData0088.coefficient5_268,
  OriginalRow227TriangleData0088.coefficient5_269,
  OriginalRow227TriangleData0088.coefficient5_270,
  OriginalRow227TriangleData0088.coefficient5_271,
  OriginalRow227TriangleData0088.coefficient5_272,
  OriginalRow227TriangleData0088.coefficient5_273,
  OriginalRow227TriangleData0088.coefficient5_274,
  OriginalRow227TriangleData0088.coefficient5_275,
  OriginalRow227TriangleData0088.coefficient5_276,
  OriginalRow227TriangleData0088.coefficient5_277,
  OriginalRow227TriangleData0088.coefficient5_278,
  OriginalRow227TriangleData0088.coefficient5_279,
  OriginalRow227TriangleData0088.coefficient5_280,
  OriginalRow227TriangleData0088.coefficient5_281,
  OriginalRow227TriangleData0088.coefficient5_282,
  OriginalRow227TriangleData0088.coefficient5_283,
  OriginalRow227TriangleData0088.coefficient5_284,
  OriginalRow227TriangleData0088.coefficient5_285,
  OriginalRow227TriangleData0088.coefficient5_286,
  OriginalRow227TriangleData0088.coefficient5_287,
  OriginalRow227TriangleData0088.coefficient5_288,
  OriginalRow227TriangleData0088.coefficient5_289,
  OriginalRow227TriangleData0088.coefficient5_290,
  OriginalRow227TriangleData0088.coefficient5_291
]

theorem values0088_size : values0088.size = 32 := rfl

def block0088 : ℕ → Option IntervalDyadic := segment 260 values0088

theorem block0088_domain : ExactDomain block0088 260 292 := by
  simpa only [values0088_size] using segment_domain 260 values0088

theorem block0088_get (i : Fin 32) :
    block0088 (260 + i.val) = some (values0088[i.val]'(by rw [values0088_size]; exact i.isLt)) := by
  exact segment_get 260 values0088 ⟨i.val, by rw [values0088_size]; exact i.isLt⟩

def values0089 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0089.coefficient5_292,
  OriginalRow227TriangleData0089.coefficient5_293,
  OriginalRow227TriangleData0089.coefficient5_294,
  OriginalRow227TriangleData0089.coefficient5_295,
  OriginalRow227TriangleData0089.coefficient5_296,
  OriginalRow227TriangleData0089.coefficient5_297,
  OriginalRow227TriangleData0089.coefficient5_298,
  OriginalRow227TriangleData0089.coefficient5_299,
  OriginalRow227TriangleData0089.coefficient5_300,
  OriginalRow227TriangleData0089.coefficient5_301,
  OriginalRow227TriangleData0089.coefficient5_302,
  OriginalRow227TriangleData0089.coefficient5_303,
  OriginalRow227TriangleData0089.coefficient5_304,
  OriginalRow227TriangleData0089.coefficient5_305,
  OriginalRow227TriangleData0089.coefficient5_306,
  OriginalRow227TriangleData0089.coefficient5_307,
  OriginalRow227TriangleData0089.coefficient5_308,
  OriginalRow227TriangleData0089.coefficient5_309,
  OriginalRow227TriangleData0089.coefficient5_310,
  OriginalRow227TriangleData0089.coefficient5_311,
  OriginalRow227TriangleData0089.coefficient5_312,
  OriginalRow227TriangleData0089.coefficient5_313,
  OriginalRow227TriangleData0089.coefficient5_314,
  OriginalRow227TriangleData0089.coefficient5_315,
  OriginalRow227TriangleData0089.coefficient5_316,
  OriginalRow227TriangleData0089.coefficient5_317,
  OriginalRow227TriangleData0089.coefficient5_318,
  OriginalRow227TriangleData0089.coefficient5_319,
  OriginalRow227TriangleData0089.coefficient5_320,
  OriginalRow227TriangleData0089.coefficient5_321,
  OriginalRow227TriangleData0089.coefficient5_322,
  OriginalRow227TriangleData0089.coefficient5_323
]

theorem values0089_size : values0089.size = 32 := rfl

def block0089 : ℕ → Option IntervalDyadic := segment 292 values0089

theorem block0089_domain : ExactDomain block0089 292 324 := by
  simpa only [values0089_size] using segment_domain 292 values0089

theorem block0089_get (i : Fin 32) :
    block0089 (292 + i.val) = some (values0089[i.val]'(by rw [values0089_size]; exact i.isLt)) := by
  exact segment_get 292 values0089 ⟨i.val, by rw [values0089_size]; exact i.isLt⟩

def values0090 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0090.coefficient5_324,
  OriginalRow227TriangleData0090.coefficient5_325,
  OriginalRow227TriangleData0090.coefficient5_326,
  OriginalRow227TriangleData0090.coefficient5_327,
  OriginalRow227TriangleData0090.coefficient5_328,
  OriginalRow227TriangleData0090.coefficient5_329,
  OriginalRow227TriangleData0090.coefficient5_330,
  OriginalRow227TriangleData0090.coefficient5_331,
  OriginalRow227TriangleData0090.coefficient5_332,
  OriginalRow227TriangleData0090.coefficient5_333,
  OriginalRow227TriangleData0090.coefficient5_334,
  OriginalRow227TriangleData0090.coefficient5_335,
  OriginalRow227TriangleData0090.coefficient5_336,
  OriginalRow227TriangleData0090.coefficient5_337,
  OriginalRow227TriangleData0090.coefficient5_338,
  OriginalRow227TriangleData0090.coefficient5_339,
  OriginalRow227TriangleData0090.coefficient5_340,
  OriginalRow227TriangleData0090.coefficient5_341,
  OriginalRow227TriangleData0090.coefficient5_342,
  OriginalRow227TriangleData0090.coefficient5_343,
  OriginalRow227TriangleData0090.coefficient5_344,
  OriginalRow227TriangleData0090.coefficient5_345,
  OriginalRow227TriangleData0090.coefficient5_346,
  OriginalRow227TriangleData0090.coefficient5_347,
  OriginalRow227TriangleData0090.coefficient5_348,
  OriginalRow227TriangleData0090.coefficient5_349,
  OriginalRow227TriangleData0090.coefficient5_350,
  OriginalRow227TriangleData0090.coefficient5_351,
  OriginalRow227TriangleData0090.coefficient5_352,
  OriginalRow227TriangleData0090.coefficient5_353,
  OriginalRow227TriangleData0090.coefficient5_354,
  OriginalRow227TriangleData0090.coefficient5_355
]

theorem values0090_size : values0090.size = 32 := rfl

def block0090 : ℕ → Option IntervalDyadic := segment 324 values0090

theorem block0090_domain : ExactDomain block0090 324 356 := by
  simpa only [values0090_size] using segment_domain 324 values0090

theorem block0090_get (i : Fin 32) :
    block0090 (324 + i.val) = some (values0090[i.val]'(by rw [values0090_size]; exact i.isLt)) := by
  exact segment_get 324 values0090 ⟨i.val, by rw [values0090_size]; exact i.isLt⟩

def values0091 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0091.coefficient5_356,
  OriginalRow227TriangleData0091.coefficient5_357,
  OriginalRow227TriangleData0091.coefficient5_358,
  OriginalRow227TriangleData0091.coefficient5_359,
  OriginalRow227TriangleData0091.coefficient5_360,
  OriginalRow227TriangleData0091.coefficient5_361,
  OriginalRow227TriangleData0091.coefficient5_362,
  OriginalRow227TriangleData0091.coefficient5_363,
  OriginalRow227TriangleData0091.coefficient5_364,
  OriginalRow227TriangleData0091.coefficient5_365,
  OriginalRow227TriangleData0091.coefficient5_366,
  OriginalRow227TriangleData0091.coefficient5_367,
  OriginalRow227TriangleData0091.coefficient5_368,
  OriginalRow227TriangleData0091.coefficient5_369,
  OriginalRow227TriangleData0091.coefficient5_370,
  OriginalRow227TriangleData0091.coefficient5_371,
  OriginalRow227TriangleData0091.coefficient5_372,
  OriginalRow227TriangleData0091.coefficient5_373,
  OriginalRow227TriangleData0091.coefficient5_374,
  OriginalRow227TriangleData0091.coefficient5_375,
  OriginalRow227TriangleData0091.coefficient5_376,
  OriginalRow227TriangleData0091.coefficient5_377,
  OriginalRow227TriangleData0091.coefficient5_378,
  OriginalRow227TriangleData0091.coefficient5_379,
  OriginalRow227TriangleData0091.coefficient5_380,
  OriginalRow227TriangleData0091.coefficient5_381,
  OriginalRow227TriangleData0091.coefficient5_382,
  OriginalRow227TriangleData0091.coefficient5_383,
  OriginalRow227TriangleData0091.coefficient5_384,
  OriginalRow227TriangleData0091.coefficient5_385,
  OriginalRow227TriangleData0091.coefficient5_386,
  OriginalRow227TriangleData0091.coefficient5_387
]

theorem values0091_size : values0091.size = 32 := rfl

def block0091 : ℕ → Option IntervalDyadic := segment 356 values0091

theorem block0091_domain : ExactDomain block0091 356 388 := by
  simpa only [values0091_size] using segment_domain 356 values0091

theorem block0091_get (i : Fin 32) :
    block0091 (356 + i.val) = some (values0091[i.val]'(by rw [values0091_size]; exact i.isLt)) := by
  exact segment_get 356 values0091 ⟨i.val, by rw [values0091_size]; exact i.isLt⟩

def values0092 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0092.coefficient5_388,
  OriginalRow227TriangleData0092.coefficient5_389,
  OriginalRow227TriangleData0092.coefficient5_390,
  OriginalRow227TriangleData0092.coefficient5_391,
  OriginalRow227TriangleData0092.coefficient5_392,
  OriginalRow227TriangleData0092.coefficient5_393,
  OriginalRow227TriangleData0092.coefficient5_394,
  OriginalRow227TriangleData0092.coefficient5_395,
  OriginalRow227TriangleData0092.coefficient5_396,
  OriginalRow227TriangleData0092.coefficient5_397,
  OriginalRow227TriangleData0092.coefficient5_398,
  OriginalRow227TriangleData0092.coefficient5_399,
  OriginalRow227TriangleData0092.coefficient5_400,
  OriginalRow227TriangleData0092.coefficient5_401,
  OriginalRow227TriangleData0092.coefficient5_402,
  OriginalRow227TriangleData0092.coefficient5_403,
  OriginalRow227TriangleData0092.coefficient5_404,
  OriginalRow227TriangleData0092.coefficient5_405,
  OriginalRow227TriangleData0092.coefficient5_406,
  OriginalRow227TriangleData0092.coefficient5_407,
  OriginalRow227TriangleData0092.coefficient5_408,
  OriginalRow227TriangleData0092.coefficient5_409,
  OriginalRow227TriangleData0092.coefficient5_410,
  OriginalRow227TriangleData0092.coefficient5_411,
  OriginalRow227TriangleData0092.coefficient5_412,
  OriginalRow227TriangleData0092.coefficient5_413,
  OriginalRow227TriangleData0092.coefficient5_414,
  OriginalRow227TriangleData0092.coefficient5_415,
  OriginalRow227TriangleData0092.coefficient5_416,
  OriginalRow227TriangleData0092.coefficient5_417,
  OriginalRow227TriangleData0092.coefficient5_418,
  OriginalRow227TriangleData0092.coefficient5_419
]

theorem values0092_size : values0092.size = 32 := rfl

def block0092 : ℕ → Option IntervalDyadic := segment 388 values0092

theorem block0092_domain : ExactDomain block0092 388 420 := by
  simpa only [values0092_size] using segment_domain 388 values0092

theorem block0092_get (i : Fin 32) :
    block0092 (388 + i.val) = some (values0092[i.val]'(by rw [values0092_size]; exact i.isLt)) := by
  exact segment_get 388 values0092 ⟨i.val, by rw [values0092_size]; exact i.isLt⟩

def values0093 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0093.coefficient5_420,
  OriginalRow227TriangleData0093.coefficient5_421,
  OriginalRow227TriangleData0093.coefficient5_422,
  OriginalRow227TriangleData0093.coefficient5_423,
  OriginalRow227TriangleData0093.coefficient5_424,
  OriginalRow227TriangleData0093.coefficient5_425,
  OriginalRow227TriangleData0093.coefficient5_426,
  OriginalRow227TriangleData0093.coefficient5_427,
  OriginalRow227TriangleData0093.coefficient5_428,
  OriginalRow227TriangleData0093.coefficient5_429,
  OriginalRow227TriangleData0093.coefficient5_430,
  OriginalRow227TriangleData0093.coefficient5_431,
  OriginalRow227TriangleData0093.coefficient5_432,
  OriginalRow227TriangleData0093.coefficient5_433,
  OriginalRow227TriangleData0093.coefficient5_434,
  OriginalRow227TriangleData0093.coefficient5_435,
  OriginalRow227TriangleData0093.coefficient5_436,
  OriginalRow227TriangleData0093.coefficient5_437,
  OriginalRow227TriangleData0093.coefficient5_438,
  OriginalRow227TriangleData0093.coefficient5_439,
  OriginalRow227TriangleData0093.coefficient5_440,
  OriginalRow227TriangleData0093.coefficient5_441,
  OriginalRow227TriangleData0093.coefficient5_442,
  OriginalRow227TriangleData0093.coefficient5_443,
  OriginalRow227TriangleData0093.coefficient5_444,
  OriginalRow227TriangleData0093.coefficient5_445,
  OriginalRow227TriangleData0093.coefficient5_446,
  OriginalRow227TriangleData0093.coefficient5_447,
  OriginalRow227TriangleData0093.coefficient5_448,
  OriginalRow227TriangleData0093.coefficient5_449,
  OriginalRow227TriangleData0093.coefficient5_450,
  OriginalRow227TriangleData0093.coefficient5_451
]

theorem values0093_size : values0093.size = 32 := rfl

def block0093 : ℕ → Option IntervalDyadic := segment 420 values0093

theorem block0093_domain : ExactDomain block0093 420 452 := by
  simpa only [values0093_size] using segment_domain 420 values0093

theorem block0093_get (i : Fin 32) :
    block0093 (420 + i.val) = some (values0093[i.val]'(by rw [values0093_size]; exact i.isLt)) := by
  exact segment_get 420 values0093 ⟨i.val, by rw [values0093_size]; exact i.isLt⟩

def values0094 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0094.coefficient5_452,
  OriginalRow227TriangleData0094.coefficient5_453,
  OriginalRow227TriangleData0094.coefficient5_454,
  OriginalRow227TriangleData0094.coefficient5_455,
  OriginalRow227TriangleData0094.coefficient5_456,
  OriginalRow227TriangleData0094.coefficient5_457,
  OriginalRow227TriangleData0094.coefficient5_458,
  OriginalRow227TriangleData0094.coefficient5_459,
  OriginalRow227TriangleData0094.coefficient5_460,
  OriginalRow227TriangleData0094.coefficient5_461,
  OriginalRow227TriangleData0094.coefficient5_462,
  OriginalRow227TriangleData0094.coefficient5_463,
  OriginalRow227TriangleData0094.coefficient5_464,
  OriginalRow227TriangleData0094.coefficient5_465,
  OriginalRow227TriangleData0094.coefficient5_466,
  OriginalRow227TriangleData0094.coefficient5_467,
  OriginalRow227TriangleData0094.coefficient5_468,
  OriginalRow227TriangleData0094.coefficient5_469,
  OriginalRow227TriangleData0094.coefficient5_470,
  OriginalRow227TriangleData0094.coefficient5_471,
  OriginalRow227TriangleData0094.coefficient5_472,
  OriginalRow227TriangleData0094.coefficient5_473,
  OriginalRow227TriangleData0094.coefficient5_474,
  OriginalRow227TriangleData0094.coefficient5_475,
  OriginalRow227TriangleData0094.coefficient5_476,
  OriginalRow227TriangleData0094.coefficient5_477,
  OriginalRow227TriangleData0094.coefficient5_478,
  OriginalRow227TriangleData0094.coefficient5_479,
  OriginalRow227TriangleData0094.coefficient5_480,
  OriginalRow227TriangleData0094.coefficient5_481,
  OriginalRow227TriangleData0094.coefficient5_482,
  OriginalRow227TriangleData0094.coefficient5_483
]

theorem values0094_size : values0094.size = 32 := rfl

def block0094 : ℕ → Option IntervalDyadic := segment 452 values0094

theorem block0094_domain : ExactDomain block0094 452 484 := by
  simpa only [values0094_size] using segment_domain 452 values0094

theorem block0094_get (i : Fin 32) :
    block0094 (452 + i.val) = some (values0094[i.val]'(by rw [values0094_size]; exact i.isLt)) := by
  exact segment_get 452 values0094 ⟨i.val, by rw [values0094_size]; exact i.isLt⟩

def values0095 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0095.coefficient5_484,
  OriginalRow227TriangleData0095.coefficient5_485,
  OriginalRow227TriangleData0095.coefficient5_486,
  OriginalRow227TriangleData0095.coefficient5_487,
  OriginalRow227TriangleData0095.coefficient5_488,
  OriginalRow227TriangleData0095.coefficient5_489,
  OriginalRow227TriangleData0095.coefficient5_490,
  OriginalRow227TriangleData0095.coefficient5_491,
  OriginalRow227TriangleData0095.coefficient5_492,
  OriginalRow227TriangleData0095.coefficient5_493,
  OriginalRow227TriangleData0095.coefficient5_494,
  OriginalRow227TriangleData0095.coefficient5_495,
  OriginalRow227TriangleData0095.coefficient5_496
]

theorem values0095_size : values0095.size = 13 := rfl

def block0095 : ℕ → Option IntervalDyadic := segment 484 values0095

theorem block0095_domain : ExactDomain block0095 484 497 := by
  simpa only [values0095_size] using segment_domain 484 values0095

theorem block0095_get (i : Fin 13) :
    block0095 (484 + i.val) = some (values0095[i.val]'(by rw [values0095_size]; exact i.isLt)) := by
  exact segment_get 484 values0095 ⟨i.val, by rw [values0095_size]; exact i.isLt⟩

def node0004_0068 : ℕ → Option IntervalDyadic := split 36 block0080 block0081

theorem node0004_0068_domain : ExactDomain node0004_0068 4 68 := by
  exact split_domain (by decide) (by decide) block0080_domain block0081_domain

def node0068_0132 : ℕ → Option IntervalDyadic := split 100 block0082 block0083

theorem node0068_0132_domain : ExactDomain node0068_0132 68 132 := by
  exact split_domain (by decide) (by decide) block0082_domain block0083_domain

def node0004_0132 : ℕ → Option IntervalDyadic := split 68 node0004_0068 node0068_0132

theorem node0004_0132_domain : ExactDomain node0004_0132 4 132 := by
  exact split_domain (by decide) (by decide) node0004_0068_domain node0068_0132_domain

def node0132_0196 : ℕ → Option IntervalDyadic := split 164 block0084 block0085

theorem node0132_0196_domain : ExactDomain node0132_0196 132 196 := by
  exact split_domain (by decide) (by decide) block0084_domain block0085_domain

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block0086 block0087

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block0086_domain block0087_domain

def node0132_0260 : ℕ → Option IntervalDyadic := split 196 node0132_0196 node0196_0260

theorem node0132_0260_domain : ExactDomain node0132_0260 132 260 := by
  exact split_domain (by decide) (by decide) node0132_0196_domain node0196_0260_domain

def node0004_0260 : ℕ → Option IntervalDyadic := split 132 node0004_0132 node0132_0260

theorem node0004_0260_domain : ExactDomain node0004_0260 4 260 := by
  exact split_domain (by decide) (by decide) node0004_0132_domain node0132_0260_domain

def node0260_0324 : ℕ → Option IntervalDyadic := split 292 block0088 block0089

theorem node0260_0324_domain : ExactDomain node0260_0324 260 324 := by
  exact split_domain (by decide) (by decide) block0088_domain block0089_domain

def node0324_0388 : ℕ → Option IntervalDyadic := split 356 block0090 block0091

theorem node0324_0388_domain : ExactDomain node0324_0388 324 388 := by
  exact split_domain (by decide) (by decide) block0090_domain block0091_domain

def node0260_0388 : ℕ → Option IntervalDyadic := split 324 node0260_0324 node0324_0388

theorem node0260_0388_domain : ExactDomain node0260_0388 260 388 := by
  exact split_domain (by decide) (by decide) node0260_0324_domain node0324_0388_domain

def node0388_0452 : ℕ → Option IntervalDyadic := split 420 block0092 block0093

theorem node0388_0452_domain : ExactDomain node0388_0452 388 452 := by
  exact split_domain (by decide) (by decide) block0092_domain block0093_domain

def node0452_0497 : ℕ → Option IntervalDyadic := split 484 block0094 block0095

theorem node0452_0497_domain : ExactDomain node0452_0497 452 497 := by
  exact split_domain (by decide) (by decide) block0094_domain block0095_domain

def node0388_0497 : ℕ → Option IntervalDyadic := split 452 node0388_0452 node0452_0497

theorem node0388_0497_domain : ExactDomain node0388_0497 388 497 := by
  exact split_domain (by decide) (by decide) node0388_0452_domain node0452_0497_domain

def node0260_0497 : ℕ → Option IntervalDyadic := split 388 node0260_0388 node0388_0497

theorem node0260_0497_domain : ExactDomain node0260_0497 260 497 := by
  exact split_domain (by decide) (by decide) node0260_0388_domain node0388_0497_domain

def node0004_0497 : ℕ → Option IntervalDyadic := split 260 node0004_0260 node0260_0497

theorem node0004_0497_domain : ExactDomain node0004_0497 4 497 := by
  exact split_domain (by decide) (by decide) node0004_0260_domain node0260_0497_domain

def lookup : ℕ → Option IntervalDyadic := node0004_0497

theorem lookup_domain : ExactDomain lookup 4 497 :=
  node0004_0497_domain

theorem block0080_lookup (i : Fin 32) :
    lookup (4 + i.val) = some (values0080[i.val]'(by rw [values0080_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (4 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_left 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0004_0132, split_left 68 node0004_0068 node0068_0132 (by omega)]
  rw [node0004_0068, split_left 36 block0080 block0081 (by omega)]
  exact block0080_get i

theorem block0081_lookup (i : Fin 32) :
    lookup (36 + i.val) = some (values0081[i.val]'(by rw [values0081_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (36 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_left 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0004_0132, split_left 68 node0004_0068 node0068_0132 (by omega)]
  rw [node0004_0068, split_right 36 block0080 block0081 (by omega)]
  exact block0081_get i

theorem block0082_lookup (i : Fin 32) :
    lookup (68 + i.val) = some (values0082[i.val]'(by rw [values0082_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (68 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_left 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0004_0132, split_right 68 node0004_0068 node0068_0132 (by omega)]
  rw [node0068_0132, split_left 100 block0082 block0083 (by omega)]
  exact block0082_get i

theorem block0083_lookup (i : Fin 32) :
    lookup (100 + i.val) = some (values0083[i.val]'(by rw [values0083_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (100 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_left 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0004_0132, split_right 68 node0004_0068 node0068_0132 (by omega)]
  rw [node0068_0132, split_right 100 block0082 block0083 (by omega)]
  exact block0083_get i

theorem block0084_lookup (i : Fin 32) :
    lookup (132 + i.val) = some (values0084[i.val]'(by rw [values0084_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (132 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_right 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_left 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0132_0196, split_left 164 block0084 block0085 (by omega)]
  exact block0084_get i

theorem block0085_lookup (i : Fin 32) :
    lookup (164 + i.val) = some (values0085[i.val]'(by rw [values0085_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (164 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_right 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_left 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0132_0196, split_right 164 block0084 block0085 (by omega)]
  exact block0085_get i

theorem block0086_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values0086[i.val]'(by rw [values0086_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (196 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_right 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_right 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0196_0260, split_left 228 block0086 block0087 (by omega)]
  exact block0086_get i

theorem block0087_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values0087[i.val]'(by rw [values0087_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (228 + i.val) = _
  rw [node0004_0497, split_left 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0004_0260, split_right 132 node0004_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_right 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0196_0260, split_right 228 block0086 block0087 (by omega)]
  exact block0087_get i

theorem block0088_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values0088[i.val]'(by rw [values0088_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (260 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_left 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0260_0388, split_left 324 node0260_0324 node0324_0388 (by omega)]
  rw [node0260_0324, split_left 292 block0088 block0089 (by omega)]
  exact block0088_get i

theorem block0089_lookup (i : Fin 32) :
    lookup (292 + i.val) = some (values0089[i.val]'(by rw [values0089_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (292 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_left 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0260_0388, split_left 324 node0260_0324 node0324_0388 (by omega)]
  rw [node0260_0324, split_right 292 block0088 block0089 (by omega)]
  exact block0089_get i

theorem block0090_lookup (i : Fin 32) :
    lookup (324 + i.val) = some (values0090[i.val]'(by rw [values0090_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (324 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_left 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0260_0388, split_right 324 node0260_0324 node0324_0388 (by omega)]
  rw [node0324_0388, split_left 356 block0090 block0091 (by omega)]
  exact block0090_get i

theorem block0091_lookup (i : Fin 32) :
    lookup (356 + i.val) = some (values0091[i.val]'(by rw [values0091_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (356 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_left 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0260_0388, split_right 324 node0260_0324 node0324_0388 (by omega)]
  rw [node0324_0388, split_right 356 block0090 block0091 (by omega)]
  exact block0091_get i

theorem block0092_lookup (i : Fin 32) :
    lookup (388 + i.val) = some (values0092[i.val]'(by rw [values0092_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (388 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_right 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0388_0497, split_left 452 node0388_0452 node0452_0497 (by omega)]
  rw [node0388_0452, split_left 420 block0092 block0093 (by omega)]
  exact block0092_get i

theorem block0093_lookup (i : Fin 32) :
    lookup (420 + i.val) = some (values0093[i.val]'(by rw [values0093_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (420 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_right 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0388_0497, split_left 452 node0388_0452 node0452_0497 (by omega)]
  rw [node0388_0452, split_right 420 block0092 block0093 (by omega)]
  exact block0093_get i

theorem block0094_lookup (i : Fin 32) :
    lookup (452 + i.val) = some (values0094[i.val]'(by rw [values0094_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (452 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_right 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0388_0497, split_right 452 node0388_0452 node0452_0497 (by omega)]
  rw [node0452_0497, split_left 484 block0094 block0095 (by omega)]
  exact block0094_get i

theorem block0095_lookup (i : Fin 13) :
    lookup (484 + i.val) = some (values0095[i.val]'(by rw [values0095_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0004_0497 (484 + i.val) = _
  rw [node0004_0497, split_right 260 node0004_0260 node0260_0497 (by omega)]
  rw [node0260_0497, split_right 388 node0260_0388 node0388_0497 (by omega)]
  rw [node0388_0497, split_right 452 node0388_0452 node0452_0497 (by omega)]
  rw [node0452_0497, split_right 484 block0094 block0095 (by omega)]
  exact block0095_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0080_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0080_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0081_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0081_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0082_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0082_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0083_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0083_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0084_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0084_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0085_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0085_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0086_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0086_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0087_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0087_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0088_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0088_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0089_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0089_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0090_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0090_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0091_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0091_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0092_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0092_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0093_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0093_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0094_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0094_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0095_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0095_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0080_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0081_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0082_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0083_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0084_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0085_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0086_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0087_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0088_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0089_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0090_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0091_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0092_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0093_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0094_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow005.block0095_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow005
