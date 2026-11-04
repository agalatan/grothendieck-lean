import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0048
import Grothe.UpperChaos.OriginalRow227TriangleData0049
import Grothe.UpperChaos.OriginalRow227TriangleData0050
import Grothe.UpperChaos.OriginalRow227TriangleData0051
import Grothe.UpperChaos.OriginalRow227TriangleData0052
import Grothe.UpperChaos.OriginalRow227TriangleData0053
import Grothe.UpperChaos.OriginalRow227TriangleData0054
import Grothe.UpperChaos.OriginalRow227TriangleData0055
import Grothe.UpperChaos.OriginalRow227TriangleData0056
import Grothe.UpperChaos.OriginalRow227TriangleData0057
import Grothe.UpperChaos.OriginalRow227TriangleData0058
import Grothe.UpperChaos.OriginalRow227TriangleData0059
import Grothe.UpperChaos.OriginalRow227TriangleData0060
import Grothe.UpperChaos.OriginalRow227TriangleData0061
import Grothe.UpperChaos.OriginalRow227TriangleData0062
import Grothe.UpperChaos.OriginalRow227TriangleData0063

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow003

open ConditionalTableLookup

def values0048 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0048.coefficient3_2,
  OriginalRow227TriangleData0048.coefficient3_3,
  OriginalRow227TriangleData0048.coefficient3_4,
  OriginalRow227TriangleData0048.coefficient3_5,
  OriginalRow227TriangleData0048.coefficient3_6,
  OriginalRow227TriangleData0048.coefficient3_7,
  OriginalRow227TriangleData0048.coefficient3_8,
  OriginalRow227TriangleData0048.coefficient3_9,
  OriginalRow227TriangleData0048.coefficient3_10,
  OriginalRow227TriangleData0048.coefficient3_11,
  OriginalRow227TriangleData0048.coefficient3_12,
  OriginalRow227TriangleData0048.coefficient3_13,
  OriginalRow227TriangleData0048.coefficient3_14,
  OriginalRow227TriangleData0048.coefficient3_15,
  OriginalRow227TriangleData0048.coefficient3_16,
  OriginalRow227TriangleData0048.coefficient3_17,
  OriginalRow227TriangleData0048.coefficient3_18,
  OriginalRow227TriangleData0048.coefficient3_19,
  OriginalRow227TriangleData0048.coefficient3_20,
  OriginalRow227TriangleData0048.coefficient3_21,
  OriginalRow227TriangleData0048.coefficient3_22,
  OriginalRow227TriangleData0048.coefficient3_23,
  OriginalRow227TriangleData0048.coefficient3_24,
  OriginalRow227TriangleData0048.coefficient3_25,
  OriginalRow227TriangleData0048.coefficient3_26,
  OriginalRow227TriangleData0048.coefficient3_27,
  OriginalRow227TriangleData0048.coefficient3_28,
  OriginalRow227TriangleData0048.coefficient3_29,
  OriginalRow227TriangleData0048.coefficient3_30,
  OriginalRow227TriangleData0048.coefficient3_31,
  OriginalRow227TriangleData0048.coefficient3_32,
  OriginalRow227TriangleData0048.coefficient3_33
]

theorem values0048_size : values0048.size = 32 := rfl

def block0048 : ℕ → Option IntervalDyadic := segment 2 values0048

theorem block0048_domain : ExactDomain block0048 2 34 := by
  simpa only [values0048_size] using segment_domain 2 values0048

theorem block0048_get (i : Fin 32) :
    block0048 (2 + i.val) = some (values0048[i.val]'(by rw [values0048_size]; exact i.isLt)) := by
  exact segment_get 2 values0048 ⟨i.val, by rw [values0048_size]; exact i.isLt⟩

def values0049 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0049.coefficient3_34,
  OriginalRow227TriangleData0049.coefficient3_35,
  OriginalRow227TriangleData0049.coefficient3_36,
  OriginalRow227TriangleData0049.coefficient3_37,
  OriginalRow227TriangleData0049.coefficient3_38,
  OriginalRow227TriangleData0049.coefficient3_39,
  OriginalRow227TriangleData0049.coefficient3_40,
  OriginalRow227TriangleData0049.coefficient3_41,
  OriginalRow227TriangleData0049.coefficient3_42,
  OriginalRow227TriangleData0049.coefficient3_43,
  OriginalRow227TriangleData0049.coefficient3_44,
  OriginalRow227TriangleData0049.coefficient3_45,
  OriginalRow227TriangleData0049.coefficient3_46,
  OriginalRow227TriangleData0049.coefficient3_47,
  OriginalRow227TriangleData0049.coefficient3_48,
  OriginalRow227TriangleData0049.coefficient3_49,
  OriginalRow227TriangleData0049.coefficient3_50,
  OriginalRow227TriangleData0049.coefficient3_51,
  OriginalRow227TriangleData0049.coefficient3_52,
  OriginalRow227TriangleData0049.coefficient3_53,
  OriginalRow227TriangleData0049.coefficient3_54,
  OriginalRow227TriangleData0049.coefficient3_55,
  OriginalRow227TriangleData0049.coefficient3_56,
  OriginalRow227TriangleData0049.coefficient3_57,
  OriginalRow227TriangleData0049.coefficient3_58,
  OriginalRow227TriangleData0049.coefficient3_59,
  OriginalRow227TriangleData0049.coefficient3_60,
  OriginalRow227TriangleData0049.coefficient3_61,
  OriginalRow227TriangleData0049.coefficient3_62,
  OriginalRow227TriangleData0049.coefficient3_63,
  OriginalRow227TriangleData0049.coefficient3_64,
  OriginalRow227TriangleData0049.coefficient3_65
]

theorem values0049_size : values0049.size = 32 := rfl

def block0049 : ℕ → Option IntervalDyadic := segment 34 values0049

theorem block0049_domain : ExactDomain block0049 34 66 := by
  simpa only [values0049_size] using segment_domain 34 values0049

theorem block0049_get (i : Fin 32) :
    block0049 (34 + i.val) = some (values0049[i.val]'(by rw [values0049_size]; exact i.isLt)) := by
  exact segment_get 34 values0049 ⟨i.val, by rw [values0049_size]; exact i.isLt⟩

def values0050 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0050.coefficient3_66,
  OriginalRow227TriangleData0050.coefficient3_67,
  OriginalRow227TriangleData0050.coefficient3_68,
  OriginalRow227TriangleData0050.coefficient3_69,
  OriginalRow227TriangleData0050.coefficient3_70,
  OriginalRow227TriangleData0050.coefficient3_71,
  OriginalRow227TriangleData0050.coefficient3_72,
  OriginalRow227TriangleData0050.coefficient3_73,
  OriginalRow227TriangleData0050.coefficient3_74,
  OriginalRow227TriangleData0050.coefficient3_75,
  OriginalRow227TriangleData0050.coefficient3_76,
  OriginalRow227TriangleData0050.coefficient3_77,
  OriginalRow227TriangleData0050.coefficient3_78,
  OriginalRow227TriangleData0050.coefficient3_79,
  OriginalRow227TriangleData0050.coefficient3_80,
  OriginalRow227TriangleData0050.coefficient3_81,
  OriginalRow227TriangleData0050.coefficient3_82,
  OriginalRow227TriangleData0050.coefficient3_83,
  OriginalRow227TriangleData0050.coefficient3_84,
  OriginalRow227TriangleData0050.coefficient3_85,
  OriginalRow227TriangleData0050.coefficient3_86,
  OriginalRow227TriangleData0050.coefficient3_87,
  OriginalRow227TriangleData0050.coefficient3_88,
  OriginalRow227TriangleData0050.coefficient3_89,
  OriginalRow227TriangleData0050.coefficient3_90,
  OriginalRow227TriangleData0050.coefficient3_91,
  OriginalRow227TriangleData0050.coefficient3_92,
  OriginalRow227TriangleData0050.coefficient3_93,
  OriginalRow227TriangleData0050.coefficient3_94,
  OriginalRow227TriangleData0050.coefficient3_95,
  OriginalRow227TriangleData0050.coefficient3_96,
  OriginalRow227TriangleData0050.coefficient3_97
]

theorem values0050_size : values0050.size = 32 := rfl

def block0050 : ℕ → Option IntervalDyadic := segment 66 values0050

theorem block0050_domain : ExactDomain block0050 66 98 := by
  simpa only [values0050_size] using segment_domain 66 values0050

theorem block0050_get (i : Fin 32) :
    block0050 (66 + i.val) = some (values0050[i.val]'(by rw [values0050_size]; exact i.isLt)) := by
  exact segment_get 66 values0050 ⟨i.val, by rw [values0050_size]; exact i.isLt⟩

def values0051 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0051.coefficient3_98,
  OriginalRow227TriangleData0051.coefficient3_99,
  OriginalRow227TriangleData0051.coefficient3_100,
  OriginalRow227TriangleData0051.coefficient3_101,
  OriginalRow227TriangleData0051.coefficient3_102,
  OriginalRow227TriangleData0051.coefficient3_103,
  OriginalRow227TriangleData0051.coefficient3_104,
  OriginalRow227TriangleData0051.coefficient3_105,
  OriginalRow227TriangleData0051.coefficient3_106,
  OriginalRow227TriangleData0051.coefficient3_107,
  OriginalRow227TriangleData0051.coefficient3_108,
  OriginalRow227TriangleData0051.coefficient3_109,
  OriginalRow227TriangleData0051.coefficient3_110,
  OriginalRow227TriangleData0051.coefficient3_111,
  OriginalRow227TriangleData0051.coefficient3_112,
  OriginalRow227TriangleData0051.coefficient3_113,
  OriginalRow227TriangleData0051.coefficient3_114,
  OriginalRow227TriangleData0051.coefficient3_115,
  OriginalRow227TriangleData0051.coefficient3_116,
  OriginalRow227TriangleData0051.coefficient3_117,
  OriginalRow227TriangleData0051.coefficient3_118,
  OriginalRow227TriangleData0051.coefficient3_119,
  OriginalRow227TriangleData0051.coefficient3_120,
  OriginalRow227TriangleData0051.coefficient3_121,
  OriginalRow227TriangleData0051.coefficient3_122,
  OriginalRow227TriangleData0051.coefficient3_123,
  OriginalRow227TriangleData0051.coefficient3_124,
  OriginalRow227TriangleData0051.coefficient3_125,
  OriginalRow227TriangleData0051.coefficient3_126,
  OriginalRow227TriangleData0051.coefficient3_127,
  OriginalRow227TriangleData0051.coefficient3_128,
  OriginalRow227TriangleData0051.coefficient3_129
]

theorem values0051_size : values0051.size = 32 := rfl

def block0051 : ℕ → Option IntervalDyadic := segment 98 values0051

theorem block0051_domain : ExactDomain block0051 98 130 := by
  simpa only [values0051_size] using segment_domain 98 values0051

theorem block0051_get (i : Fin 32) :
    block0051 (98 + i.val) = some (values0051[i.val]'(by rw [values0051_size]; exact i.isLt)) := by
  exact segment_get 98 values0051 ⟨i.val, by rw [values0051_size]; exact i.isLt⟩

def values0052 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0052.coefficient3_130,
  OriginalRow227TriangleData0052.coefficient3_131,
  OriginalRow227TriangleData0052.coefficient3_132,
  OriginalRow227TriangleData0052.coefficient3_133,
  OriginalRow227TriangleData0052.coefficient3_134,
  OriginalRow227TriangleData0052.coefficient3_135,
  OriginalRow227TriangleData0052.coefficient3_136,
  OriginalRow227TriangleData0052.coefficient3_137,
  OriginalRow227TriangleData0052.coefficient3_138,
  OriginalRow227TriangleData0052.coefficient3_139,
  OriginalRow227TriangleData0052.coefficient3_140,
  OriginalRow227TriangleData0052.coefficient3_141,
  OriginalRow227TriangleData0052.coefficient3_142,
  OriginalRow227TriangleData0052.coefficient3_143,
  OriginalRow227TriangleData0052.coefficient3_144,
  OriginalRow227TriangleData0052.coefficient3_145,
  OriginalRow227TriangleData0052.coefficient3_146,
  OriginalRow227TriangleData0052.coefficient3_147,
  OriginalRow227TriangleData0052.coefficient3_148,
  OriginalRow227TriangleData0052.coefficient3_149,
  OriginalRow227TriangleData0052.coefficient3_150,
  OriginalRow227TriangleData0052.coefficient3_151,
  OriginalRow227TriangleData0052.coefficient3_152,
  OriginalRow227TriangleData0052.coefficient3_153,
  OriginalRow227TriangleData0052.coefficient3_154,
  OriginalRow227TriangleData0052.coefficient3_155,
  OriginalRow227TriangleData0052.coefficient3_156,
  OriginalRow227TriangleData0052.coefficient3_157,
  OriginalRow227TriangleData0052.coefficient3_158,
  OriginalRow227TriangleData0052.coefficient3_159,
  OriginalRow227TriangleData0052.coefficient3_160,
  OriginalRow227TriangleData0052.coefficient3_161
]

theorem values0052_size : values0052.size = 32 := rfl

def block0052 : ℕ → Option IntervalDyadic := segment 130 values0052

theorem block0052_domain : ExactDomain block0052 130 162 := by
  simpa only [values0052_size] using segment_domain 130 values0052

theorem block0052_get (i : Fin 32) :
    block0052 (130 + i.val) = some (values0052[i.val]'(by rw [values0052_size]; exact i.isLt)) := by
  exact segment_get 130 values0052 ⟨i.val, by rw [values0052_size]; exact i.isLt⟩

def values0053 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0053.coefficient3_162,
  OriginalRow227TriangleData0053.coefficient3_163,
  OriginalRow227TriangleData0053.coefficient3_164,
  OriginalRow227TriangleData0053.coefficient3_165,
  OriginalRow227TriangleData0053.coefficient3_166,
  OriginalRow227TriangleData0053.coefficient3_167,
  OriginalRow227TriangleData0053.coefficient3_168,
  OriginalRow227TriangleData0053.coefficient3_169,
  OriginalRow227TriangleData0053.coefficient3_170,
  OriginalRow227TriangleData0053.coefficient3_171,
  OriginalRow227TriangleData0053.coefficient3_172,
  OriginalRow227TriangleData0053.coefficient3_173,
  OriginalRow227TriangleData0053.coefficient3_174,
  OriginalRow227TriangleData0053.coefficient3_175,
  OriginalRow227TriangleData0053.coefficient3_176,
  OriginalRow227TriangleData0053.coefficient3_177,
  OriginalRow227TriangleData0053.coefficient3_178,
  OriginalRow227TriangleData0053.coefficient3_179,
  OriginalRow227TriangleData0053.coefficient3_180,
  OriginalRow227TriangleData0053.coefficient3_181,
  OriginalRow227TriangleData0053.coefficient3_182,
  OriginalRow227TriangleData0053.coefficient3_183,
  OriginalRow227TriangleData0053.coefficient3_184,
  OriginalRow227TriangleData0053.coefficient3_185,
  OriginalRow227TriangleData0053.coefficient3_186,
  OriginalRow227TriangleData0053.coefficient3_187,
  OriginalRow227TriangleData0053.coefficient3_188,
  OriginalRow227TriangleData0053.coefficient3_189,
  OriginalRow227TriangleData0053.coefficient3_190,
  OriginalRow227TriangleData0053.coefficient3_191,
  OriginalRow227TriangleData0053.coefficient3_192,
  OriginalRow227TriangleData0053.coefficient3_193
]

theorem values0053_size : values0053.size = 32 := rfl

def block0053 : ℕ → Option IntervalDyadic := segment 162 values0053

theorem block0053_domain : ExactDomain block0053 162 194 := by
  simpa only [values0053_size] using segment_domain 162 values0053

theorem block0053_get (i : Fin 32) :
    block0053 (162 + i.val) = some (values0053[i.val]'(by rw [values0053_size]; exact i.isLt)) := by
  exact segment_get 162 values0053 ⟨i.val, by rw [values0053_size]; exact i.isLt⟩

def values0054 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0054.coefficient3_194,
  OriginalRow227TriangleData0054.coefficient3_195,
  OriginalRow227TriangleData0054.coefficient3_196,
  OriginalRow227TriangleData0054.coefficient3_197,
  OriginalRow227TriangleData0054.coefficient3_198,
  OriginalRow227TriangleData0054.coefficient3_199,
  OriginalRow227TriangleData0054.coefficient3_200,
  OriginalRow227TriangleData0054.coefficient3_201,
  OriginalRow227TriangleData0054.coefficient3_202,
  OriginalRow227TriangleData0054.coefficient3_203,
  OriginalRow227TriangleData0054.coefficient3_204,
  OriginalRow227TriangleData0054.coefficient3_205,
  OriginalRow227TriangleData0054.coefficient3_206,
  OriginalRow227TriangleData0054.coefficient3_207,
  OriginalRow227TriangleData0054.coefficient3_208,
  OriginalRow227TriangleData0054.coefficient3_209,
  OriginalRow227TriangleData0054.coefficient3_210,
  OriginalRow227TriangleData0054.coefficient3_211,
  OriginalRow227TriangleData0054.coefficient3_212,
  OriginalRow227TriangleData0054.coefficient3_213,
  OriginalRow227TriangleData0054.coefficient3_214,
  OriginalRow227TriangleData0054.coefficient3_215,
  OriginalRow227TriangleData0054.coefficient3_216,
  OriginalRow227TriangleData0054.coefficient3_217,
  OriginalRow227TriangleData0054.coefficient3_218,
  OriginalRow227TriangleData0054.coefficient3_219,
  OriginalRow227TriangleData0054.coefficient3_220,
  OriginalRow227TriangleData0054.coefficient3_221,
  OriginalRow227TriangleData0054.coefficient3_222,
  OriginalRow227TriangleData0054.coefficient3_223,
  OriginalRow227TriangleData0054.coefficient3_224,
  OriginalRow227TriangleData0054.coefficient3_225
]

theorem values0054_size : values0054.size = 32 := rfl

def block0054 : ℕ → Option IntervalDyadic := segment 194 values0054

theorem block0054_domain : ExactDomain block0054 194 226 := by
  simpa only [values0054_size] using segment_domain 194 values0054

theorem block0054_get (i : Fin 32) :
    block0054 (194 + i.val) = some (values0054[i.val]'(by rw [values0054_size]; exact i.isLt)) := by
  exact segment_get 194 values0054 ⟨i.val, by rw [values0054_size]; exact i.isLt⟩

def values0055 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0055.coefficient3_226,
  OriginalRow227TriangleData0055.coefficient3_227,
  OriginalRow227TriangleData0055.coefficient3_228,
  OriginalRow227TriangleData0055.coefficient3_229,
  OriginalRow227TriangleData0055.coefficient3_230,
  OriginalRow227TriangleData0055.coefficient3_231,
  OriginalRow227TriangleData0055.coefficient3_232,
  OriginalRow227TriangleData0055.coefficient3_233,
  OriginalRow227TriangleData0055.coefficient3_234,
  OriginalRow227TriangleData0055.coefficient3_235,
  OriginalRow227TriangleData0055.coefficient3_236,
  OriginalRow227TriangleData0055.coefficient3_237,
  OriginalRow227TriangleData0055.coefficient3_238,
  OriginalRow227TriangleData0055.coefficient3_239,
  OriginalRow227TriangleData0055.coefficient3_240,
  OriginalRow227TriangleData0055.coefficient3_241,
  OriginalRow227TriangleData0055.coefficient3_242,
  OriginalRow227TriangleData0055.coefficient3_243,
  OriginalRow227TriangleData0055.coefficient3_244,
  OriginalRow227TriangleData0055.coefficient3_245,
  OriginalRow227TriangleData0055.coefficient3_246,
  OriginalRow227TriangleData0055.coefficient3_247,
  OriginalRow227TriangleData0055.coefficient3_248,
  OriginalRow227TriangleData0055.coefficient3_249,
  OriginalRow227TriangleData0055.coefficient3_250,
  OriginalRow227TriangleData0055.coefficient3_251,
  OriginalRow227TriangleData0055.coefficient3_252,
  OriginalRow227TriangleData0055.coefficient3_253,
  OriginalRow227TriangleData0055.coefficient3_254,
  OriginalRow227TriangleData0055.coefficient3_255,
  OriginalRow227TriangleData0055.coefficient3_256,
  OriginalRow227TriangleData0055.coefficient3_257
]

theorem values0055_size : values0055.size = 32 := rfl

def block0055 : ℕ → Option IntervalDyadic := segment 226 values0055

theorem block0055_domain : ExactDomain block0055 226 258 := by
  simpa only [values0055_size] using segment_domain 226 values0055

theorem block0055_get (i : Fin 32) :
    block0055 (226 + i.val) = some (values0055[i.val]'(by rw [values0055_size]; exact i.isLt)) := by
  exact segment_get 226 values0055 ⟨i.val, by rw [values0055_size]; exact i.isLt⟩

def values0056 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0056.coefficient3_258,
  OriginalRow227TriangleData0056.coefficient3_259,
  OriginalRow227TriangleData0056.coefficient3_260,
  OriginalRow227TriangleData0056.coefficient3_261,
  OriginalRow227TriangleData0056.coefficient3_262,
  OriginalRow227TriangleData0056.coefficient3_263,
  OriginalRow227TriangleData0056.coefficient3_264,
  OriginalRow227TriangleData0056.coefficient3_265,
  OriginalRow227TriangleData0056.coefficient3_266,
  OriginalRow227TriangleData0056.coefficient3_267,
  OriginalRow227TriangleData0056.coefficient3_268,
  OriginalRow227TriangleData0056.coefficient3_269,
  OriginalRow227TriangleData0056.coefficient3_270,
  OriginalRow227TriangleData0056.coefficient3_271,
  OriginalRow227TriangleData0056.coefficient3_272,
  OriginalRow227TriangleData0056.coefficient3_273,
  OriginalRow227TriangleData0056.coefficient3_274,
  OriginalRow227TriangleData0056.coefficient3_275,
  OriginalRow227TriangleData0056.coefficient3_276,
  OriginalRow227TriangleData0056.coefficient3_277,
  OriginalRow227TriangleData0056.coefficient3_278,
  OriginalRow227TriangleData0056.coefficient3_279,
  OriginalRow227TriangleData0056.coefficient3_280,
  OriginalRow227TriangleData0056.coefficient3_281,
  OriginalRow227TriangleData0056.coefficient3_282,
  OriginalRow227TriangleData0056.coefficient3_283,
  OriginalRow227TriangleData0056.coefficient3_284,
  OriginalRow227TriangleData0056.coefficient3_285,
  OriginalRow227TriangleData0056.coefficient3_286,
  OriginalRow227TriangleData0056.coefficient3_287,
  OriginalRow227TriangleData0056.coefficient3_288,
  OriginalRow227TriangleData0056.coefficient3_289
]

theorem values0056_size : values0056.size = 32 := rfl

def block0056 : ℕ → Option IntervalDyadic := segment 258 values0056

theorem block0056_domain : ExactDomain block0056 258 290 := by
  simpa only [values0056_size] using segment_domain 258 values0056

theorem block0056_get (i : Fin 32) :
    block0056 (258 + i.val) = some (values0056[i.val]'(by rw [values0056_size]; exact i.isLt)) := by
  exact segment_get 258 values0056 ⟨i.val, by rw [values0056_size]; exact i.isLt⟩

def values0057 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0057.coefficient3_290,
  OriginalRow227TriangleData0057.coefficient3_291,
  OriginalRow227TriangleData0057.coefficient3_292,
  OriginalRow227TriangleData0057.coefficient3_293,
  OriginalRow227TriangleData0057.coefficient3_294,
  OriginalRow227TriangleData0057.coefficient3_295,
  OriginalRow227TriangleData0057.coefficient3_296,
  OriginalRow227TriangleData0057.coefficient3_297,
  OriginalRow227TriangleData0057.coefficient3_298,
  OriginalRow227TriangleData0057.coefficient3_299,
  OriginalRow227TriangleData0057.coefficient3_300,
  OriginalRow227TriangleData0057.coefficient3_301,
  OriginalRow227TriangleData0057.coefficient3_302,
  OriginalRow227TriangleData0057.coefficient3_303,
  OriginalRow227TriangleData0057.coefficient3_304,
  OriginalRow227TriangleData0057.coefficient3_305,
  OriginalRow227TriangleData0057.coefficient3_306,
  OriginalRow227TriangleData0057.coefficient3_307,
  OriginalRow227TriangleData0057.coefficient3_308,
  OriginalRow227TriangleData0057.coefficient3_309,
  OriginalRow227TriangleData0057.coefficient3_310,
  OriginalRow227TriangleData0057.coefficient3_311,
  OriginalRow227TriangleData0057.coefficient3_312,
  OriginalRow227TriangleData0057.coefficient3_313,
  OriginalRow227TriangleData0057.coefficient3_314,
  OriginalRow227TriangleData0057.coefficient3_315,
  OriginalRow227TriangleData0057.coefficient3_316,
  OriginalRow227TriangleData0057.coefficient3_317,
  OriginalRow227TriangleData0057.coefficient3_318,
  OriginalRow227TriangleData0057.coefficient3_319,
  OriginalRow227TriangleData0057.coefficient3_320,
  OriginalRow227TriangleData0057.coefficient3_321
]

theorem values0057_size : values0057.size = 32 := rfl

def block0057 : ℕ → Option IntervalDyadic := segment 290 values0057

theorem block0057_domain : ExactDomain block0057 290 322 := by
  simpa only [values0057_size] using segment_domain 290 values0057

theorem block0057_get (i : Fin 32) :
    block0057 (290 + i.val) = some (values0057[i.val]'(by rw [values0057_size]; exact i.isLt)) := by
  exact segment_get 290 values0057 ⟨i.val, by rw [values0057_size]; exact i.isLt⟩

def values0058 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0058.coefficient3_322,
  OriginalRow227TriangleData0058.coefficient3_323,
  OriginalRow227TriangleData0058.coefficient3_324,
  OriginalRow227TriangleData0058.coefficient3_325,
  OriginalRow227TriangleData0058.coefficient3_326,
  OriginalRow227TriangleData0058.coefficient3_327,
  OriginalRow227TriangleData0058.coefficient3_328,
  OriginalRow227TriangleData0058.coefficient3_329,
  OriginalRow227TriangleData0058.coefficient3_330,
  OriginalRow227TriangleData0058.coefficient3_331,
  OriginalRow227TriangleData0058.coefficient3_332,
  OriginalRow227TriangleData0058.coefficient3_333,
  OriginalRow227TriangleData0058.coefficient3_334,
  OriginalRow227TriangleData0058.coefficient3_335,
  OriginalRow227TriangleData0058.coefficient3_336,
  OriginalRow227TriangleData0058.coefficient3_337,
  OriginalRow227TriangleData0058.coefficient3_338,
  OriginalRow227TriangleData0058.coefficient3_339,
  OriginalRow227TriangleData0058.coefficient3_340,
  OriginalRow227TriangleData0058.coefficient3_341,
  OriginalRow227TriangleData0058.coefficient3_342,
  OriginalRow227TriangleData0058.coefficient3_343,
  OriginalRow227TriangleData0058.coefficient3_344,
  OriginalRow227TriangleData0058.coefficient3_345,
  OriginalRow227TriangleData0058.coefficient3_346,
  OriginalRow227TriangleData0058.coefficient3_347,
  OriginalRow227TriangleData0058.coefficient3_348,
  OriginalRow227TriangleData0058.coefficient3_349,
  OriginalRow227TriangleData0058.coefficient3_350,
  OriginalRow227TriangleData0058.coefficient3_351,
  OriginalRow227TriangleData0058.coefficient3_352,
  OriginalRow227TriangleData0058.coefficient3_353
]

theorem values0058_size : values0058.size = 32 := rfl

def block0058 : ℕ → Option IntervalDyadic := segment 322 values0058

theorem block0058_domain : ExactDomain block0058 322 354 := by
  simpa only [values0058_size] using segment_domain 322 values0058

theorem block0058_get (i : Fin 32) :
    block0058 (322 + i.val) = some (values0058[i.val]'(by rw [values0058_size]; exact i.isLt)) := by
  exact segment_get 322 values0058 ⟨i.val, by rw [values0058_size]; exact i.isLt⟩

def values0059 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0059.coefficient3_354,
  OriginalRow227TriangleData0059.coefficient3_355,
  OriginalRow227TriangleData0059.coefficient3_356,
  OriginalRow227TriangleData0059.coefficient3_357,
  OriginalRow227TriangleData0059.coefficient3_358,
  OriginalRow227TriangleData0059.coefficient3_359,
  OriginalRow227TriangleData0059.coefficient3_360,
  OriginalRow227TriangleData0059.coefficient3_361,
  OriginalRow227TriangleData0059.coefficient3_362,
  OriginalRow227TriangleData0059.coefficient3_363,
  OriginalRow227TriangleData0059.coefficient3_364,
  OriginalRow227TriangleData0059.coefficient3_365,
  OriginalRow227TriangleData0059.coefficient3_366,
  OriginalRow227TriangleData0059.coefficient3_367,
  OriginalRow227TriangleData0059.coefficient3_368,
  OriginalRow227TriangleData0059.coefficient3_369,
  OriginalRow227TriangleData0059.coefficient3_370,
  OriginalRow227TriangleData0059.coefficient3_371,
  OriginalRow227TriangleData0059.coefficient3_372,
  OriginalRow227TriangleData0059.coefficient3_373,
  OriginalRow227TriangleData0059.coefficient3_374,
  OriginalRow227TriangleData0059.coefficient3_375,
  OriginalRow227TriangleData0059.coefficient3_376,
  OriginalRow227TriangleData0059.coefficient3_377,
  OriginalRow227TriangleData0059.coefficient3_378,
  OriginalRow227TriangleData0059.coefficient3_379,
  OriginalRow227TriangleData0059.coefficient3_380,
  OriginalRow227TriangleData0059.coefficient3_381,
  OriginalRow227TriangleData0059.coefficient3_382,
  OriginalRow227TriangleData0059.coefficient3_383,
  OriginalRow227TriangleData0059.coefficient3_384,
  OriginalRow227TriangleData0059.coefficient3_385
]

theorem values0059_size : values0059.size = 32 := rfl

def block0059 : ℕ → Option IntervalDyadic := segment 354 values0059

theorem block0059_domain : ExactDomain block0059 354 386 := by
  simpa only [values0059_size] using segment_domain 354 values0059

theorem block0059_get (i : Fin 32) :
    block0059 (354 + i.val) = some (values0059[i.val]'(by rw [values0059_size]; exact i.isLt)) := by
  exact segment_get 354 values0059 ⟨i.val, by rw [values0059_size]; exact i.isLt⟩

def values0060 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0060.coefficient3_386,
  OriginalRow227TriangleData0060.coefficient3_387,
  OriginalRow227TriangleData0060.coefficient3_388,
  OriginalRow227TriangleData0060.coefficient3_389,
  OriginalRow227TriangleData0060.coefficient3_390,
  OriginalRow227TriangleData0060.coefficient3_391,
  OriginalRow227TriangleData0060.coefficient3_392,
  OriginalRow227TriangleData0060.coefficient3_393,
  OriginalRow227TriangleData0060.coefficient3_394,
  OriginalRow227TriangleData0060.coefficient3_395,
  OriginalRow227TriangleData0060.coefficient3_396,
  OriginalRow227TriangleData0060.coefficient3_397,
  OriginalRow227TriangleData0060.coefficient3_398,
  OriginalRow227TriangleData0060.coefficient3_399,
  OriginalRow227TriangleData0060.coefficient3_400,
  OriginalRow227TriangleData0060.coefficient3_401,
  OriginalRow227TriangleData0060.coefficient3_402,
  OriginalRow227TriangleData0060.coefficient3_403,
  OriginalRow227TriangleData0060.coefficient3_404,
  OriginalRow227TriangleData0060.coefficient3_405,
  OriginalRow227TriangleData0060.coefficient3_406,
  OriginalRow227TriangleData0060.coefficient3_407,
  OriginalRow227TriangleData0060.coefficient3_408,
  OriginalRow227TriangleData0060.coefficient3_409,
  OriginalRow227TriangleData0060.coefficient3_410,
  OriginalRow227TriangleData0060.coefficient3_411,
  OriginalRow227TriangleData0060.coefficient3_412,
  OriginalRow227TriangleData0060.coefficient3_413,
  OriginalRow227TriangleData0060.coefficient3_414,
  OriginalRow227TriangleData0060.coefficient3_415,
  OriginalRow227TriangleData0060.coefficient3_416,
  OriginalRow227TriangleData0060.coefficient3_417
]

theorem values0060_size : values0060.size = 32 := rfl

def block0060 : ℕ → Option IntervalDyadic := segment 386 values0060

theorem block0060_domain : ExactDomain block0060 386 418 := by
  simpa only [values0060_size] using segment_domain 386 values0060

theorem block0060_get (i : Fin 32) :
    block0060 (386 + i.val) = some (values0060[i.val]'(by rw [values0060_size]; exact i.isLt)) := by
  exact segment_get 386 values0060 ⟨i.val, by rw [values0060_size]; exact i.isLt⟩

def values0061 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0061.coefficient3_418,
  OriginalRow227TriangleData0061.coefficient3_419,
  OriginalRow227TriangleData0061.coefficient3_420,
  OriginalRow227TriangleData0061.coefficient3_421,
  OriginalRow227TriangleData0061.coefficient3_422,
  OriginalRow227TriangleData0061.coefficient3_423,
  OriginalRow227TriangleData0061.coefficient3_424,
  OriginalRow227TriangleData0061.coefficient3_425,
  OriginalRow227TriangleData0061.coefficient3_426,
  OriginalRow227TriangleData0061.coefficient3_427,
  OriginalRow227TriangleData0061.coefficient3_428,
  OriginalRow227TriangleData0061.coefficient3_429,
  OriginalRow227TriangleData0061.coefficient3_430,
  OriginalRow227TriangleData0061.coefficient3_431,
  OriginalRow227TriangleData0061.coefficient3_432,
  OriginalRow227TriangleData0061.coefficient3_433,
  OriginalRow227TriangleData0061.coefficient3_434,
  OriginalRow227TriangleData0061.coefficient3_435,
  OriginalRow227TriangleData0061.coefficient3_436,
  OriginalRow227TriangleData0061.coefficient3_437,
  OriginalRow227TriangleData0061.coefficient3_438,
  OriginalRow227TriangleData0061.coefficient3_439,
  OriginalRow227TriangleData0061.coefficient3_440,
  OriginalRow227TriangleData0061.coefficient3_441,
  OriginalRow227TriangleData0061.coefficient3_442,
  OriginalRow227TriangleData0061.coefficient3_443,
  OriginalRow227TriangleData0061.coefficient3_444,
  OriginalRow227TriangleData0061.coefficient3_445,
  OriginalRow227TriangleData0061.coefficient3_446,
  OriginalRow227TriangleData0061.coefficient3_447,
  OriginalRow227TriangleData0061.coefficient3_448,
  OriginalRow227TriangleData0061.coefficient3_449
]

theorem values0061_size : values0061.size = 32 := rfl

def block0061 : ℕ → Option IntervalDyadic := segment 418 values0061

theorem block0061_domain : ExactDomain block0061 418 450 := by
  simpa only [values0061_size] using segment_domain 418 values0061

theorem block0061_get (i : Fin 32) :
    block0061 (418 + i.val) = some (values0061[i.val]'(by rw [values0061_size]; exact i.isLt)) := by
  exact segment_get 418 values0061 ⟨i.val, by rw [values0061_size]; exact i.isLt⟩

def values0062 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0062.coefficient3_450,
  OriginalRow227TriangleData0062.coefficient3_451,
  OriginalRow227TriangleData0062.coefficient3_452,
  OriginalRow227TriangleData0062.coefficient3_453,
  OriginalRow227TriangleData0062.coefficient3_454,
  OriginalRow227TriangleData0062.coefficient3_455,
  OriginalRow227TriangleData0062.coefficient3_456,
  OriginalRow227TriangleData0062.coefficient3_457,
  OriginalRow227TriangleData0062.coefficient3_458,
  OriginalRow227TriangleData0062.coefficient3_459,
  OriginalRow227TriangleData0062.coefficient3_460,
  OriginalRow227TriangleData0062.coefficient3_461,
  OriginalRow227TriangleData0062.coefficient3_462,
  OriginalRow227TriangleData0062.coefficient3_463,
  OriginalRow227TriangleData0062.coefficient3_464,
  OriginalRow227TriangleData0062.coefficient3_465,
  OriginalRow227TriangleData0062.coefficient3_466,
  OriginalRow227TriangleData0062.coefficient3_467,
  OriginalRow227TriangleData0062.coefficient3_468,
  OriginalRow227TriangleData0062.coefficient3_469,
  OriginalRow227TriangleData0062.coefficient3_470,
  OriginalRow227TriangleData0062.coefficient3_471,
  OriginalRow227TriangleData0062.coefficient3_472,
  OriginalRow227TriangleData0062.coefficient3_473,
  OriginalRow227TriangleData0062.coefficient3_474,
  OriginalRow227TriangleData0062.coefficient3_475,
  OriginalRow227TriangleData0062.coefficient3_476,
  OriginalRow227TriangleData0062.coefficient3_477,
  OriginalRow227TriangleData0062.coefficient3_478,
  OriginalRow227TriangleData0062.coefficient3_479,
  OriginalRow227TriangleData0062.coefficient3_480,
  OriginalRow227TriangleData0062.coefficient3_481
]

theorem values0062_size : values0062.size = 32 := rfl

def block0062 : ℕ → Option IntervalDyadic := segment 450 values0062

theorem block0062_domain : ExactDomain block0062 450 482 := by
  simpa only [values0062_size] using segment_domain 450 values0062

theorem block0062_get (i : Fin 32) :
    block0062 (450 + i.val) = some (values0062[i.val]'(by rw [values0062_size]; exact i.isLt)) := by
  exact segment_get 450 values0062 ⟨i.val, by rw [values0062_size]; exact i.isLt⟩

def values0063 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0063.coefficient3_482,
  OriginalRow227TriangleData0063.coefficient3_483,
  OriginalRow227TriangleData0063.coefficient3_484,
  OriginalRow227TriangleData0063.coefficient3_485,
  OriginalRow227TriangleData0063.coefficient3_486,
  OriginalRow227TriangleData0063.coefficient3_487,
  OriginalRow227TriangleData0063.coefficient3_488,
  OriginalRow227TriangleData0063.coefficient3_489,
  OriginalRow227TriangleData0063.coefficient3_490,
  OriginalRow227TriangleData0063.coefficient3_491,
  OriginalRow227TriangleData0063.coefficient3_492,
  OriginalRow227TriangleData0063.coefficient3_493,
  OriginalRow227TriangleData0063.coefficient3_494,
  OriginalRow227TriangleData0063.coefficient3_495,
  OriginalRow227TriangleData0063.coefficient3_496,
  OriginalRow227TriangleData0063.coefficient3_497,
  OriginalRow227TriangleData0063.coefficient3_498
]

theorem values0063_size : values0063.size = 17 := rfl

def block0063 : ℕ → Option IntervalDyadic := segment 482 values0063

theorem block0063_domain : ExactDomain block0063 482 499 := by
  simpa only [values0063_size] using segment_domain 482 values0063

theorem block0063_get (i : Fin 17) :
    block0063 (482 + i.val) = some (values0063[i.val]'(by rw [values0063_size]; exact i.isLt)) := by
  exact segment_get 482 values0063 ⟨i.val, by rw [values0063_size]; exact i.isLt⟩

def node0002_0066 : ℕ → Option IntervalDyadic := split 34 block0048 block0049

theorem node0002_0066_domain : ExactDomain node0002_0066 2 66 := by
  exact split_domain (by decide) (by decide) block0048_domain block0049_domain

def node0066_0130 : ℕ → Option IntervalDyadic := split 98 block0050 block0051

theorem node0066_0130_domain : ExactDomain node0066_0130 66 130 := by
  exact split_domain (by decide) (by decide) block0050_domain block0051_domain

def node0002_0130 : ℕ → Option IntervalDyadic := split 66 node0002_0066 node0066_0130

theorem node0002_0130_domain : ExactDomain node0002_0130 2 130 := by
  exact split_domain (by decide) (by decide) node0002_0066_domain node0066_0130_domain

def node0130_0194 : ℕ → Option IntervalDyadic := split 162 block0052 block0053

theorem node0130_0194_domain : ExactDomain node0130_0194 130 194 := by
  exact split_domain (by decide) (by decide) block0052_domain block0053_domain

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block0054 block0055

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block0054_domain block0055_domain

def node0130_0258 : ℕ → Option IntervalDyadic := split 194 node0130_0194 node0194_0258

theorem node0130_0258_domain : ExactDomain node0130_0258 130 258 := by
  exact split_domain (by decide) (by decide) node0130_0194_domain node0194_0258_domain

def node0002_0258 : ℕ → Option IntervalDyadic := split 130 node0002_0130 node0130_0258

theorem node0002_0258_domain : ExactDomain node0002_0258 2 258 := by
  exact split_domain (by decide) (by decide) node0002_0130_domain node0130_0258_domain

def node0258_0322 : ℕ → Option IntervalDyadic := split 290 block0056 block0057

theorem node0258_0322_domain : ExactDomain node0258_0322 258 322 := by
  exact split_domain (by decide) (by decide) block0056_domain block0057_domain

def node0322_0386 : ℕ → Option IntervalDyadic := split 354 block0058 block0059

theorem node0322_0386_domain : ExactDomain node0322_0386 322 386 := by
  exact split_domain (by decide) (by decide) block0058_domain block0059_domain

def node0258_0386 : ℕ → Option IntervalDyadic := split 322 node0258_0322 node0322_0386

theorem node0258_0386_domain : ExactDomain node0258_0386 258 386 := by
  exact split_domain (by decide) (by decide) node0258_0322_domain node0322_0386_domain

def node0386_0450 : ℕ → Option IntervalDyadic := split 418 block0060 block0061

theorem node0386_0450_domain : ExactDomain node0386_0450 386 450 := by
  exact split_domain (by decide) (by decide) block0060_domain block0061_domain

def node0450_0499 : ℕ → Option IntervalDyadic := split 482 block0062 block0063

theorem node0450_0499_domain : ExactDomain node0450_0499 450 499 := by
  exact split_domain (by decide) (by decide) block0062_domain block0063_domain

def node0386_0499 : ℕ → Option IntervalDyadic := split 450 node0386_0450 node0450_0499

theorem node0386_0499_domain : ExactDomain node0386_0499 386 499 := by
  exact split_domain (by decide) (by decide) node0386_0450_domain node0450_0499_domain

def node0258_0499 : ℕ → Option IntervalDyadic := split 386 node0258_0386 node0386_0499

theorem node0258_0499_domain : ExactDomain node0258_0499 258 499 := by
  exact split_domain (by decide) (by decide) node0258_0386_domain node0386_0499_domain

def node0002_0499 : ℕ → Option IntervalDyadic := split 258 node0002_0258 node0258_0499

theorem node0002_0499_domain : ExactDomain node0002_0499 2 499 := by
  exact split_domain (by decide) (by decide) node0002_0258_domain node0258_0499_domain

def lookup : ℕ → Option IntervalDyadic := node0002_0499

theorem lookup_domain : ExactDomain lookup 2 499 :=
  node0002_0499_domain

theorem block0048_lookup (i : Fin 32) :
    lookup (2 + i.val) = some (values0048[i.val]'(by rw [values0048_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (2 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_left 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0002_0130, split_left 66 node0002_0066 node0066_0130 (by omega)]
  rw [node0002_0066, split_left 34 block0048 block0049 (by omega)]
  exact block0048_get i

theorem block0049_lookup (i : Fin 32) :
    lookup (34 + i.val) = some (values0049[i.val]'(by rw [values0049_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (34 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_left 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0002_0130, split_left 66 node0002_0066 node0066_0130 (by omega)]
  rw [node0002_0066, split_right 34 block0048 block0049 (by omega)]
  exact block0049_get i

theorem block0050_lookup (i : Fin 32) :
    lookup (66 + i.val) = some (values0050[i.val]'(by rw [values0050_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (66 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_left 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0002_0130, split_right 66 node0002_0066 node0066_0130 (by omega)]
  rw [node0066_0130, split_left 98 block0050 block0051 (by omega)]
  exact block0050_get i

theorem block0051_lookup (i : Fin 32) :
    lookup (98 + i.val) = some (values0051[i.val]'(by rw [values0051_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (98 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_left 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0002_0130, split_right 66 node0002_0066 node0066_0130 (by omega)]
  rw [node0066_0130, split_right 98 block0050 block0051 (by omega)]
  exact block0051_get i

theorem block0052_lookup (i : Fin 32) :
    lookup (130 + i.val) = some (values0052[i.val]'(by rw [values0052_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (130 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_right 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_left 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0130_0194, split_left 162 block0052 block0053 (by omega)]
  exact block0052_get i

theorem block0053_lookup (i : Fin 32) :
    lookup (162 + i.val) = some (values0053[i.val]'(by rw [values0053_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (162 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_right 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_left 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0130_0194, split_right 162 block0052 block0053 (by omega)]
  exact block0053_get i

theorem block0054_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values0054[i.val]'(by rw [values0054_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (194 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_right 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_right 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0194_0258, split_left 226 block0054 block0055 (by omega)]
  exact block0054_get i

theorem block0055_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values0055[i.val]'(by rw [values0055_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (226 + i.val) = _
  rw [node0002_0499, split_left 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0002_0258, split_right 130 node0002_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_right 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0194_0258, split_right 226 block0054 block0055 (by omega)]
  exact block0055_get i

theorem block0056_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values0056[i.val]'(by rw [values0056_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (258 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_left 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0258_0386, split_left 322 node0258_0322 node0322_0386 (by omega)]
  rw [node0258_0322, split_left 290 block0056 block0057 (by omega)]
  exact block0056_get i

theorem block0057_lookup (i : Fin 32) :
    lookup (290 + i.val) = some (values0057[i.val]'(by rw [values0057_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (290 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_left 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0258_0386, split_left 322 node0258_0322 node0322_0386 (by omega)]
  rw [node0258_0322, split_right 290 block0056 block0057 (by omega)]
  exact block0057_get i

theorem block0058_lookup (i : Fin 32) :
    lookup (322 + i.val) = some (values0058[i.val]'(by rw [values0058_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (322 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_left 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0258_0386, split_right 322 node0258_0322 node0322_0386 (by omega)]
  rw [node0322_0386, split_left 354 block0058 block0059 (by omega)]
  exact block0058_get i

theorem block0059_lookup (i : Fin 32) :
    lookup (354 + i.val) = some (values0059[i.val]'(by rw [values0059_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (354 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_left 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0258_0386, split_right 322 node0258_0322 node0322_0386 (by omega)]
  rw [node0322_0386, split_right 354 block0058 block0059 (by omega)]
  exact block0059_get i

theorem block0060_lookup (i : Fin 32) :
    lookup (386 + i.val) = some (values0060[i.val]'(by rw [values0060_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (386 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_right 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0386_0499, split_left 450 node0386_0450 node0450_0499 (by omega)]
  rw [node0386_0450, split_left 418 block0060 block0061 (by omega)]
  exact block0060_get i

theorem block0061_lookup (i : Fin 32) :
    lookup (418 + i.val) = some (values0061[i.val]'(by rw [values0061_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (418 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_right 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0386_0499, split_left 450 node0386_0450 node0450_0499 (by omega)]
  rw [node0386_0450, split_right 418 block0060 block0061 (by omega)]
  exact block0061_get i

theorem block0062_lookup (i : Fin 32) :
    lookup (450 + i.val) = some (values0062[i.val]'(by rw [values0062_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (450 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_right 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0386_0499, split_right 450 node0386_0450 node0450_0499 (by omega)]
  rw [node0450_0499, split_left 482 block0062 block0063 (by omega)]
  exact block0062_get i

theorem block0063_lookup (i : Fin 17) :
    lookup (482 + i.val) = some (values0063[i.val]'(by rw [values0063_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0002_0499 (482 + i.val) = _
  rw [node0002_0499, split_right 258 node0002_0258 node0258_0499 (by omega)]
  rw [node0258_0499, split_right 386 node0258_0386 node0386_0499 (by omega)]
  rw [node0386_0499, split_right 450 node0386_0450 node0450_0499 (by omega)]
  rw [node0450_0499, split_right 482 block0062 block0063 (by omega)]
  exact block0063_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0048_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0048_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0049_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0049_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0050_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0050_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0051_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0051_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0052_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0052_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0053_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0053_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0054_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0054_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0055_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0055_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0056_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0056_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0057_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0057_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0058_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0058_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0059_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0059_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0060_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0060_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0061_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0061_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0062_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0062_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0063_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0063_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0048_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0049_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0050_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0051_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0052_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0053_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0054_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0055_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0056_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0057_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0058_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0059_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0060_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0061_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0062_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow003.block0063_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow003
