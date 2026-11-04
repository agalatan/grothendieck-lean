import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0032
import Grothe.UpperChaos.OriginalRow227TriangleData0033
import Grothe.UpperChaos.OriginalRow227TriangleData0034
import Grothe.UpperChaos.OriginalRow227TriangleData0035
import Grothe.UpperChaos.OriginalRow227TriangleData0036
import Grothe.UpperChaos.OriginalRow227TriangleData0037
import Grothe.UpperChaos.OriginalRow227TriangleData0038
import Grothe.UpperChaos.OriginalRow227TriangleData0039
import Grothe.UpperChaos.OriginalRow227TriangleData0040
import Grothe.UpperChaos.OriginalRow227TriangleData0041
import Grothe.UpperChaos.OriginalRow227TriangleData0042
import Grothe.UpperChaos.OriginalRow227TriangleData0043
import Grothe.UpperChaos.OriginalRow227TriangleData0044
import Grothe.UpperChaos.OriginalRow227TriangleData0045
import Grothe.UpperChaos.OriginalRow227TriangleData0046
import Grothe.UpperChaos.OriginalRow227TriangleData0047

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow002

open ConditionalTableLookup

def values0032 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0032.coefficient2_1,
  OriginalRow227TriangleData0032.coefficient2_2,
  OriginalRow227TriangleData0032.coefficient2_3,
  OriginalRow227TriangleData0032.coefficient2_4,
  OriginalRow227TriangleData0032.coefficient2_5,
  OriginalRow227TriangleData0032.coefficient2_6,
  OriginalRow227TriangleData0032.coefficient2_7,
  OriginalRow227TriangleData0032.coefficient2_8,
  OriginalRow227TriangleData0032.coefficient2_9,
  OriginalRow227TriangleData0032.coefficient2_10,
  OriginalRow227TriangleData0032.coefficient2_11,
  OriginalRow227TriangleData0032.coefficient2_12,
  OriginalRow227TriangleData0032.coefficient2_13,
  OriginalRow227TriangleData0032.coefficient2_14,
  OriginalRow227TriangleData0032.coefficient2_15,
  OriginalRow227TriangleData0032.coefficient2_16,
  OriginalRow227TriangleData0032.coefficient2_17,
  OriginalRow227TriangleData0032.coefficient2_18,
  OriginalRow227TriangleData0032.coefficient2_19,
  OriginalRow227TriangleData0032.coefficient2_20,
  OriginalRow227TriangleData0032.coefficient2_21,
  OriginalRow227TriangleData0032.coefficient2_22,
  OriginalRow227TriangleData0032.coefficient2_23,
  OriginalRow227TriangleData0032.coefficient2_24,
  OriginalRow227TriangleData0032.coefficient2_25,
  OriginalRow227TriangleData0032.coefficient2_26,
  OriginalRow227TriangleData0032.coefficient2_27,
  OriginalRow227TriangleData0032.coefficient2_28,
  OriginalRow227TriangleData0032.coefficient2_29,
  OriginalRow227TriangleData0032.coefficient2_30,
  OriginalRow227TriangleData0032.coefficient2_31,
  OriginalRow227TriangleData0032.coefficient2_32
]

theorem values0032_size : values0032.size = 32 := rfl

def block0032 : ℕ → Option IntervalDyadic := segment 1 values0032

theorem block0032_domain : ExactDomain block0032 1 33 := by
  simpa only [values0032_size] using segment_domain 1 values0032

theorem block0032_get (i : Fin 32) :
    block0032 (1 + i.val) = some (values0032[i.val]'(by rw [values0032_size]; exact i.isLt)) := by
  exact segment_get 1 values0032 ⟨i.val, by rw [values0032_size]; exact i.isLt⟩

def values0033 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0033.coefficient2_33,
  OriginalRow227TriangleData0033.coefficient2_34,
  OriginalRow227TriangleData0033.coefficient2_35,
  OriginalRow227TriangleData0033.coefficient2_36,
  OriginalRow227TriangleData0033.coefficient2_37,
  OriginalRow227TriangleData0033.coefficient2_38,
  OriginalRow227TriangleData0033.coefficient2_39,
  OriginalRow227TriangleData0033.coefficient2_40,
  OriginalRow227TriangleData0033.coefficient2_41,
  OriginalRow227TriangleData0033.coefficient2_42,
  OriginalRow227TriangleData0033.coefficient2_43,
  OriginalRow227TriangleData0033.coefficient2_44,
  OriginalRow227TriangleData0033.coefficient2_45,
  OriginalRow227TriangleData0033.coefficient2_46,
  OriginalRow227TriangleData0033.coefficient2_47,
  OriginalRow227TriangleData0033.coefficient2_48,
  OriginalRow227TriangleData0033.coefficient2_49,
  OriginalRow227TriangleData0033.coefficient2_50,
  OriginalRow227TriangleData0033.coefficient2_51,
  OriginalRow227TriangleData0033.coefficient2_52,
  OriginalRow227TriangleData0033.coefficient2_53,
  OriginalRow227TriangleData0033.coefficient2_54,
  OriginalRow227TriangleData0033.coefficient2_55,
  OriginalRow227TriangleData0033.coefficient2_56,
  OriginalRow227TriangleData0033.coefficient2_57,
  OriginalRow227TriangleData0033.coefficient2_58,
  OriginalRow227TriangleData0033.coefficient2_59,
  OriginalRow227TriangleData0033.coefficient2_60,
  OriginalRow227TriangleData0033.coefficient2_61,
  OriginalRow227TriangleData0033.coefficient2_62,
  OriginalRow227TriangleData0033.coefficient2_63,
  OriginalRow227TriangleData0033.coefficient2_64
]

theorem values0033_size : values0033.size = 32 := rfl

def block0033 : ℕ → Option IntervalDyadic := segment 33 values0033

theorem block0033_domain : ExactDomain block0033 33 65 := by
  simpa only [values0033_size] using segment_domain 33 values0033

theorem block0033_get (i : Fin 32) :
    block0033 (33 + i.val) = some (values0033[i.val]'(by rw [values0033_size]; exact i.isLt)) := by
  exact segment_get 33 values0033 ⟨i.val, by rw [values0033_size]; exact i.isLt⟩

def values0034 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0034.coefficient2_65,
  OriginalRow227TriangleData0034.coefficient2_66,
  OriginalRow227TriangleData0034.coefficient2_67,
  OriginalRow227TriangleData0034.coefficient2_68,
  OriginalRow227TriangleData0034.coefficient2_69,
  OriginalRow227TriangleData0034.coefficient2_70,
  OriginalRow227TriangleData0034.coefficient2_71,
  OriginalRow227TriangleData0034.coefficient2_72,
  OriginalRow227TriangleData0034.coefficient2_73,
  OriginalRow227TriangleData0034.coefficient2_74,
  OriginalRow227TriangleData0034.coefficient2_75,
  OriginalRow227TriangleData0034.coefficient2_76,
  OriginalRow227TriangleData0034.coefficient2_77,
  OriginalRow227TriangleData0034.coefficient2_78,
  OriginalRow227TriangleData0034.coefficient2_79,
  OriginalRow227TriangleData0034.coefficient2_80,
  OriginalRow227TriangleData0034.coefficient2_81,
  OriginalRow227TriangleData0034.coefficient2_82,
  OriginalRow227TriangleData0034.coefficient2_83,
  OriginalRow227TriangleData0034.coefficient2_84,
  OriginalRow227TriangleData0034.coefficient2_85,
  OriginalRow227TriangleData0034.coefficient2_86,
  OriginalRow227TriangleData0034.coefficient2_87,
  OriginalRow227TriangleData0034.coefficient2_88,
  OriginalRow227TriangleData0034.coefficient2_89,
  OriginalRow227TriangleData0034.coefficient2_90,
  OriginalRow227TriangleData0034.coefficient2_91,
  OriginalRow227TriangleData0034.coefficient2_92,
  OriginalRow227TriangleData0034.coefficient2_93,
  OriginalRow227TriangleData0034.coefficient2_94,
  OriginalRow227TriangleData0034.coefficient2_95,
  OriginalRow227TriangleData0034.coefficient2_96
]

theorem values0034_size : values0034.size = 32 := rfl

def block0034 : ℕ → Option IntervalDyadic := segment 65 values0034

theorem block0034_domain : ExactDomain block0034 65 97 := by
  simpa only [values0034_size] using segment_domain 65 values0034

theorem block0034_get (i : Fin 32) :
    block0034 (65 + i.val) = some (values0034[i.val]'(by rw [values0034_size]; exact i.isLt)) := by
  exact segment_get 65 values0034 ⟨i.val, by rw [values0034_size]; exact i.isLt⟩

def values0035 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0035.coefficient2_97,
  OriginalRow227TriangleData0035.coefficient2_98,
  OriginalRow227TriangleData0035.coefficient2_99,
  OriginalRow227TriangleData0035.coefficient2_100,
  OriginalRow227TriangleData0035.coefficient2_101,
  OriginalRow227TriangleData0035.coefficient2_102,
  OriginalRow227TriangleData0035.coefficient2_103,
  OriginalRow227TriangleData0035.coefficient2_104,
  OriginalRow227TriangleData0035.coefficient2_105,
  OriginalRow227TriangleData0035.coefficient2_106,
  OriginalRow227TriangleData0035.coefficient2_107,
  OriginalRow227TriangleData0035.coefficient2_108,
  OriginalRow227TriangleData0035.coefficient2_109,
  OriginalRow227TriangleData0035.coefficient2_110,
  OriginalRow227TriangleData0035.coefficient2_111,
  OriginalRow227TriangleData0035.coefficient2_112,
  OriginalRow227TriangleData0035.coefficient2_113,
  OriginalRow227TriangleData0035.coefficient2_114,
  OriginalRow227TriangleData0035.coefficient2_115,
  OriginalRow227TriangleData0035.coefficient2_116,
  OriginalRow227TriangleData0035.coefficient2_117,
  OriginalRow227TriangleData0035.coefficient2_118,
  OriginalRow227TriangleData0035.coefficient2_119,
  OriginalRow227TriangleData0035.coefficient2_120,
  OriginalRow227TriangleData0035.coefficient2_121,
  OriginalRow227TriangleData0035.coefficient2_122,
  OriginalRow227TriangleData0035.coefficient2_123,
  OriginalRow227TriangleData0035.coefficient2_124,
  OriginalRow227TriangleData0035.coefficient2_125,
  OriginalRow227TriangleData0035.coefficient2_126,
  OriginalRow227TriangleData0035.coefficient2_127,
  OriginalRow227TriangleData0035.coefficient2_128
]

theorem values0035_size : values0035.size = 32 := rfl

def block0035 : ℕ → Option IntervalDyadic := segment 97 values0035

theorem block0035_domain : ExactDomain block0035 97 129 := by
  simpa only [values0035_size] using segment_domain 97 values0035

theorem block0035_get (i : Fin 32) :
    block0035 (97 + i.val) = some (values0035[i.val]'(by rw [values0035_size]; exact i.isLt)) := by
  exact segment_get 97 values0035 ⟨i.val, by rw [values0035_size]; exact i.isLt⟩

def values0036 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0036.coefficient2_129,
  OriginalRow227TriangleData0036.coefficient2_130,
  OriginalRow227TriangleData0036.coefficient2_131,
  OriginalRow227TriangleData0036.coefficient2_132,
  OriginalRow227TriangleData0036.coefficient2_133,
  OriginalRow227TriangleData0036.coefficient2_134,
  OriginalRow227TriangleData0036.coefficient2_135,
  OriginalRow227TriangleData0036.coefficient2_136,
  OriginalRow227TriangleData0036.coefficient2_137,
  OriginalRow227TriangleData0036.coefficient2_138,
  OriginalRow227TriangleData0036.coefficient2_139,
  OriginalRow227TriangleData0036.coefficient2_140,
  OriginalRow227TriangleData0036.coefficient2_141,
  OriginalRow227TriangleData0036.coefficient2_142,
  OriginalRow227TriangleData0036.coefficient2_143,
  OriginalRow227TriangleData0036.coefficient2_144,
  OriginalRow227TriangleData0036.coefficient2_145,
  OriginalRow227TriangleData0036.coefficient2_146,
  OriginalRow227TriangleData0036.coefficient2_147,
  OriginalRow227TriangleData0036.coefficient2_148,
  OriginalRow227TriangleData0036.coefficient2_149,
  OriginalRow227TriangleData0036.coefficient2_150,
  OriginalRow227TriangleData0036.coefficient2_151,
  OriginalRow227TriangleData0036.coefficient2_152,
  OriginalRow227TriangleData0036.coefficient2_153,
  OriginalRow227TriangleData0036.coefficient2_154,
  OriginalRow227TriangleData0036.coefficient2_155,
  OriginalRow227TriangleData0036.coefficient2_156,
  OriginalRow227TriangleData0036.coefficient2_157,
  OriginalRow227TriangleData0036.coefficient2_158,
  OriginalRow227TriangleData0036.coefficient2_159,
  OriginalRow227TriangleData0036.coefficient2_160
]

theorem values0036_size : values0036.size = 32 := rfl

def block0036 : ℕ → Option IntervalDyadic := segment 129 values0036

theorem block0036_domain : ExactDomain block0036 129 161 := by
  simpa only [values0036_size] using segment_domain 129 values0036

theorem block0036_get (i : Fin 32) :
    block0036 (129 + i.val) = some (values0036[i.val]'(by rw [values0036_size]; exact i.isLt)) := by
  exact segment_get 129 values0036 ⟨i.val, by rw [values0036_size]; exact i.isLt⟩

def values0037 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0037.coefficient2_161,
  OriginalRow227TriangleData0037.coefficient2_162,
  OriginalRow227TriangleData0037.coefficient2_163,
  OriginalRow227TriangleData0037.coefficient2_164,
  OriginalRow227TriangleData0037.coefficient2_165,
  OriginalRow227TriangleData0037.coefficient2_166,
  OriginalRow227TriangleData0037.coefficient2_167,
  OriginalRow227TriangleData0037.coefficient2_168,
  OriginalRow227TriangleData0037.coefficient2_169,
  OriginalRow227TriangleData0037.coefficient2_170,
  OriginalRow227TriangleData0037.coefficient2_171,
  OriginalRow227TriangleData0037.coefficient2_172,
  OriginalRow227TriangleData0037.coefficient2_173,
  OriginalRow227TriangleData0037.coefficient2_174,
  OriginalRow227TriangleData0037.coefficient2_175,
  OriginalRow227TriangleData0037.coefficient2_176,
  OriginalRow227TriangleData0037.coefficient2_177,
  OriginalRow227TriangleData0037.coefficient2_178,
  OriginalRow227TriangleData0037.coefficient2_179,
  OriginalRow227TriangleData0037.coefficient2_180,
  OriginalRow227TriangleData0037.coefficient2_181,
  OriginalRow227TriangleData0037.coefficient2_182,
  OriginalRow227TriangleData0037.coefficient2_183,
  OriginalRow227TriangleData0037.coefficient2_184,
  OriginalRow227TriangleData0037.coefficient2_185,
  OriginalRow227TriangleData0037.coefficient2_186,
  OriginalRow227TriangleData0037.coefficient2_187,
  OriginalRow227TriangleData0037.coefficient2_188,
  OriginalRow227TriangleData0037.coefficient2_189,
  OriginalRow227TriangleData0037.coefficient2_190,
  OriginalRow227TriangleData0037.coefficient2_191,
  OriginalRow227TriangleData0037.coefficient2_192
]

theorem values0037_size : values0037.size = 32 := rfl

def block0037 : ℕ → Option IntervalDyadic := segment 161 values0037

theorem block0037_domain : ExactDomain block0037 161 193 := by
  simpa only [values0037_size] using segment_domain 161 values0037

theorem block0037_get (i : Fin 32) :
    block0037 (161 + i.val) = some (values0037[i.val]'(by rw [values0037_size]; exact i.isLt)) := by
  exact segment_get 161 values0037 ⟨i.val, by rw [values0037_size]; exact i.isLt⟩

def values0038 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0038.coefficient2_193,
  OriginalRow227TriangleData0038.coefficient2_194,
  OriginalRow227TriangleData0038.coefficient2_195,
  OriginalRow227TriangleData0038.coefficient2_196,
  OriginalRow227TriangleData0038.coefficient2_197,
  OriginalRow227TriangleData0038.coefficient2_198,
  OriginalRow227TriangleData0038.coefficient2_199,
  OriginalRow227TriangleData0038.coefficient2_200,
  OriginalRow227TriangleData0038.coefficient2_201,
  OriginalRow227TriangleData0038.coefficient2_202,
  OriginalRow227TriangleData0038.coefficient2_203,
  OriginalRow227TriangleData0038.coefficient2_204,
  OriginalRow227TriangleData0038.coefficient2_205,
  OriginalRow227TriangleData0038.coefficient2_206,
  OriginalRow227TriangleData0038.coefficient2_207,
  OriginalRow227TriangleData0038.coefficient2_208,
  OriginalRow227TriangleData0038.coefficient2_209,
  OriginalRow227TriangleData0038.coefficient2_210,
  OriginalRow227TriangleData0038.coefficient2_211,
  OriginalRow227TriangleData0038.coefficient2_212,
  OriginalRow227TriangleData0038.coefficient2_213,
  OriginalRow227TriangleData0038.coefficient2_214,
  OriginalRow227TriangleData0038.coefficient2_215,
  OriginalRow227TriangleData0038.coefficient2_216,
  OriginalRow227TriangleData0038.coefficient2_217,
  OriginalRow227TriangleData0038.coefficient2_218,
  OriginalRow227TriangleData0038.coefficient2_219,
  OriginalRow227TriangleData0038.coefficient2_220,
  OriginalRow227TriangleData0038.coefficient2_221,
  OriginalRow227TriangleData0038.coefficient2_222,
  OriginalRow227TriangleData0038.coefficient2_223,
  OriginalRow227TriangleData0038.coefficient2_224
]

theorem values0038_size : values0038.size = 32 := rfl

def block0038 : ℕ → Option IntervalDyadic := segment 193 values0038

theorem block0038_domain : ExactDomain block0038 193 225 := by
  simpa only [values0038_size] using segment_domain 193 values0038

theorem block0038_get (i : Fin 32) :
    block0038 (193 + i.val) = some (values0038[i.val]'(by rw [values0038_size]; exact i.isLt)) := by
  exact segment_get 193 values0038 ⟨i.val, by rw [values0038_size]; exact i.isLt⟩

def values0039 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0039.coefficient2_225,
  OriginalRow227TriangleData0039.coefficient2_226,
  OriginalRow227TriangleData0039.coefficient2_227,
  OriginalRow227TriangleData0039.coefficient2_228,
  OriginalRow227TriangleData0039.coefficient2_229,
  OriginalRow227TriangleData0039.coefficient2_230,
  OriginalRow227TriangleData0039.coefficient2_231,
  OriginalRow227TriangleData0039.coefficient2_232,
  OriginalRow227TriangleData0039.coefficient2_233,
  OriginalRow227TriangleData0039.coefficient2_234,
  OriginalRow227TriangleData0039.coefficient2_235,
  OriginalRow227TriangleData0039.coefficient2_236,
  OriginalRow227TriangleData0039.coefficient2_237,
  OriginalRow227TriangleData0039.coefficient2_238,
  OriginalRow227TriangleData0039.coefficient2_239,
  OriginalRow227TriangleData0039.coefficient2_240,
  OriginalRow227TriangleData0039.coefficient2_241,
  OriginalRow227TriangleData0039.coefficient2_242,
  OriginalRow227TriangleData0039.coefficient2_243,
  OriginalRow227TriangleData0039.coefficient2_244,
  OriginalRow227TriangleData0039.coefficient2_245,
  OriginalRow227TriangleData0039.coefficient2_246,
  OriginalRow227TriangleData0039.coefficient2_247,
  OriginalRow227TriangleData0039.coefficient2_248,
  OriginalRow227TriangleData0039.coefficient2_249,
  OriginalRow227TriangleData0039.coefficient2_250,
  OriginalRow227TriangleData0039.coefficient2_251,
  OriginalRow227TriangleData0039.coefficient2_252,
  OriginalRow227TriangleData0039.coefficient2_253,
  OriginalRow227TriangleData0039.coefficient2_254,
  OriginalRow227TriangleData0039.coefficient2_255,
  OriginalRow227TriangleData0039.coefficient2_256
]

theorem values0039_size : values0039.size = 32 := rfl

def block0039 : ℕ → Option IntervalDyadic := segment 225 values0039

theorem block0039_domain : ExactDomain block0039 225 257 := by
  simpa only [values0039_size] using segment_domain 225 values0039

theorem block0039_get (i : Fin 32) :
    block0039 (225 + i.val) = some (values0039[i.val]'(by rw [values0039_size]; exact i.isLt)) := by
  exact segment_get 225 values0039 ⟨i.val, by rw [values0039_size]; exact i.isLt⟩

def values0040 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0040.coefficient2_257,
  OriginalRow227TriangleData0040.coefficient2_258,
  OriginalRow227TriangleData0040.coefficient2_259,
  OriginalRow227TriangleData0040.coefficient2_260,
  OriginalRow227TriangleData0040.coefficient2_261,
  OriginalRow227TriangleData0040.coefficient2_262,
  OriginalRow227TriangleData0040.coefficient2_263,
  OriginalRow227TriangleData0040.coefficient2_264,
  OriginalRow227TriangleData0040.coefficient2_265,
  OriginalRow227TriangleData0040.coefficient2_266,
  OriginalRow227TriangleData0040.coefficient2_267,
  OriginalRow227TriangleData0040.coefficient2_268,
  OriginalRow227TriangleData0040.coefficient2_269,
  OriginalRow227TriangleData0040.coefficient2_270,
  OriginalRow227TriangleData0040.coefficient2_271,
  OriginalRow227TriangleData0040.coefficient2_272,
  OriginalRow227TriangleData0040.coefficient2_273,
  OriginalRow227TriangleData0040.coefficient2_274,
  OriginalRow227TriangleData0040.coefficient2_275,
  OriginalRow227TriangleData0040.coefficient2_276,
  OriginalRow227TriangleData0040.coefficient2_277,
  OriginalRow227TriangleData0040.coefficient2_278,
  OriginalRow227TriangleData0040.coefficient2_279,
  OriginalRow227TriangleData0040.coefficient2_280,
  OriginalRow227TriangleData0040.coefficient2_281,
  OriginalRow227TriangleData0040.coefficient2_282,
  OriginalRow227TriangleData0040.coefficient2_283,
  OriginalRow227TriangleData0040.coefficient2_284,
  OriginalRow227TriangleData0040.coefficient2_285,
  OriginalRow227TriangleData0040.coefficient2_286,
  OriginalRow227TriangleData0040.coefficient2_287,
  OriginalRow227TriangleData0040.coefficient2_288
]

theorem values0040_size : values0040.size = 32 := rfl

def block0040 : ℕ → Option IntervalDyadic := segment 257 values0040

theorem block0040_domain : ExactDomain block0040 257 289 := by
  simpa only [values0040_size] using segment_domain 257 values0040

theorem block0040_get (i : Fin 32) :
    block0040 (257 + i.val) = some (values0040[i.val]'(by rw [values0040_size]; exact i.isLt)) := by
  exact segment_get 257 values0040 ⟨i.val, by rw [values0040_size]; exact i.isLt⟩

def values0041 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0041.coefficient2_289,
  OriginalRow227TriangleData0041.coefficient2_290,
  OriginalRow227TriangleData0041.coefficient2_291,
  OriginalRow227TriangleData0041.coefficient2_292,
  OriginalRow227TriangleData0041.coefficient2_293,
  OriginalRow227TriangleData0041.coefficient2_294,
  OriginalRow227TriangleData0041.coefficient2_295,
  OriginalRow227TriangleData0041.coefficient2_296,
  OriginalRow227TriangleData0041.coefficient2_297,
  OriginalRow227TriangleData0041.coefficient2_298,
  OriginalRow227TriangleData0041.coefficient2_299,
  OriginalRow227TriangleData0041.coefficient2_300,
  OriginalRow227TriangleData0041.coefficient2_301,
  OriginalRow227TriangleData0041.coefficient2_302,
  OriginalRow227TriangleData0041.coefficient2_303,
  OriginalRow227TriangleData0041.coefficient2_304,
  OriginalRow227TriangleData0041.coefficient2_305,
  OriginalRow227TriangleData0041.coefficient2_306,
  OriginalRow227TriangleData0041.coefficient2_307,
  OriginalRow227TriangleData0041.coefficient2_308,
  OriginalRow227TriangleData0041.coefficient2_309,
  OriginalRow227TriangleData0041.coefficient2_310,
  OriginalRow227TriangleData0041.coefficient2_311,
  OriginalRow227TriangleData0041.coefficient2_312,
  OriginalRow227TriangleData0041.coefficient2_313,
  OriginalRow227TriangleData0041.coefficient2_314,
  OriginalRow227TriangleData0041.coefficient2_315,
  OriginalRow227TriangleData0041.coefficient2_316,
  OriginalRow227TriangleData0041.coefficient2_317,
  OriginalRow227TriangleData0041.coefficient2_318,
  OriginalRow227TriangleData0041.coefficient2_319,
  OriginalRow227TriangleData0041.coefficient2_320
]

theorem values0041_size : values0041.size = 32 := rfl

def block0041 : ℕ → Option IntervalDyadic := segment 289 values0041

theorem block0041_domain : ExactDomain block0041 289 321 := by
  simpa only [values0041_size] using segment_domain 289 values0041

theorem block0041_get (i : Fin 32) :
    block0041 (289 + i.val) = some (values0041[i.val]'(by rw [values0041_size]; exact i.isLt)) := by
  exact segment_get 289 values0041 ⟨i.val, by rw [values0041_size]; exact i.isLt⟩

def values0042 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0042.coefficient2_321,
  OriginalRow227TriangleData0042.coefficient2_322,
  OriginalRow227TriangleData0042.coefficient2_323,
  OriginalRow227TriangleData0042.coefficient2_324,
  OriginalRow227TriangleData0042.coefficient2_325,
  OriginalRow227TriangleData0042.coefficient2_326,
  OriginalRow227TriangleData0042.coefficient2_327,
  OriginalRow227TriangleData0042.coefficient2_328,
  OriginalRow227TriangleData0042.coefficient2_329,
  OriginalRow227TriangleData0042.coefficient2_330,
  OriginalRow227TriangleData0042.coefficient2_331,
  OriginalRow227TriangleData0042.coefficient2_332,
  OriginalRow227TriangleData0042.coefficient2_333,
  OriginalRow227TriangleData0042.coefficient2_334,
  OriginalRow227TriangleData0042.coefficient2_335,
  OriginalRow227TriangleData0042.coefficient2_336,
  OriginalRow227TriangleData0042.coefficient2_337,
  OriginalRow227TriangleData0042.coefficient2_338,
  OriginalRow227TriangleData0042.coefficient2_339,
  OriginalRow227TriangleData0042.coefficient2_340,
  OriginalRow227TriangleData0042.coefficient2_341,
  OriginalRow227TriangleData0042.coefficient2_342,
  OriginalRow227TriangleData0042.coefficient2_343,
  OriginalRow227TriangleData0042.coefficient2_344,
  OriginalRow227TriangleData0042.coefficient2_345,
  OriginalRow227TriangleData0042.coefficient2_346,
  OriginalRow227TriangleData0042.coefficient2_347,
  OriginalRow227TriangleData0042.coefficient2_348,
  OriginalRow227TriangleData0042.coefficient2_349,
  OriginalRow227TriangleData0042.coefficient2_350,
  OriginalRow227TriangleData0042.coefficient2_351,
  OriginalRow227TriangleData0042.coefficient2_352
]

theorem values0042_size : values0042.size = 32 := rfl

def block0042 : ℕ → Option IntervalDyadic := segment 321 values0042

theorem block0042_domain : ExactDomain block0042 321 353 := by
  simpa only [values0042_size] using segment_domain 321 values0042

theorem block0042_get (i : Fin 32) :
    block0042 (321 + i.val) = some (values0042[i.val]'(by rw [values0042_size]; exact i.isLt)) := by
  exact segment_get 321 values0042 ⟨i.val, by rw [values0042_size]; exact i.isLt⟩

def values0043 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0043.coefficient2_353,
  OriginalRow227TriangleData0043.coefficient2_354,
  OriginalRow227TriangleData0043.coefficient2_355,
  OriginalRow227TriangleData0043.coefficient2_356,
  OriginalRow227TriangleData0043.coefficient2_357,
  OriginalRow227TriangleData0043.coefficient2_358,
  OriginalRow227TriangleData0043.coefficient2_359,
  OriginalRow227TriangleData0043.coefficient2_360,
  OriginalRow227TriangleData0043.coefficient2_361,
  OriginalRow227TriangleData0043.coefficient2_362,
  OriginalRow227TriangleData0043.coefficient2_363,
  OriginalRow227TriangleData0043.coefficient2_364,
  OriginalRow227TriangleData0043.coefficient2_365,
  OriginalRow227TriangleData0043.coefficient2_366,
  OriginalRow227TriangleData0043.coefficient2_367,
  OriginalRow227TriangleData0043.coefficient2_368,
  OriginalRow227TriangleData0043.coefficient2_369,
  OriginalRow227TriangleData0043.coefficient2_370,
  OriginalRow227TriangleData0043.coefficient2_371,
  OriginalRow227TriangleData0043.coefficient2_372,
  OriginalRow227TriangleData0043.coefficient2_373,
  OriginalRow227TriangleData0043.coefficient2_374,
  OriginalRow227TriangleData0043.coefficient2_375,
  OriginalRow227TriangleData0043.coefficient2_376,
  OriginalRow227TriangleData0043.coefficient2_377,
  OriginalRow227TriangleData0043.coefficient2_378,
  OriginalRow227TriangleData0043.coefficient2_379,
  OriginalRow227TriangleData0043.coefficient2_380,
  OriginalRow227TriangleData0043.coefficient2_381,
  OriginalRow227TriangleData0043.coefficient2_382,
  OriginalRow227TriangleData0043.coefficient2_383,
  OriginalRow227TriangleData0043.coefficient2_384
]

theorem values0043_size : values0043.size = 32 := rfl

def block0043 : ℕ → Option IntervalDyadic := segment 353 values0043

theorem block0043_domain : ExactDomain block0043 353 385 := by
  simpa only [values0043_size] using segment_domain 353 values0043

theorem block0043_get (i : Fin 32) :
    block0043 (353 + i.val) = some (values0043[i.val]'(by rw [values0043_size]; exact i.isLt)) := by
  exact segment_get 353 values0043 ⟨i.val, by rw [values0043_size]; exact i.isLt⟩

def values0044 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0044.coefficient2_385,
  OriginalRow227TriangleData0044.coefficient2_386,
  OriginalRow227TriangleData0044.coefficient2_387,
  OriginalRow227TriangleData0044.coefficient2_388,
  OriginalRow227TriangleData0044.coefficient2_389,
  OriginalRow227TriangleData0044.coefficient2_390,
  OriginalRow227TriangleData0044.coefficient2_391,
  OriginalRow227TriangleData0044.coefficient2_392,
  OriginalRow227TriangleData0044.coefficient2_393,
  OriginalRow227TriangleData0044.coefficient2_394,
  OriginalRow227TriangleData0044.coefficient2_395,
  OriginalRow227TriangleData0044.coefficient2_396,
  OriginalRow227TriangleData0044.coefficient2_397,
  OriginalRow227TriangleData0044.coefficient2_398,
  OriginalRow227TriangleData0044.coefficient2_399,
  OriginalRow227TriangleData0044.coefficient2_400,
  OriginalRow227TriangleData0044.coefficient2_401,
  OriginalRow227TriangleData0044.coefficient2_402,
  OriginalRow227TriangleData0044.coefficient2_403,
  OriginalRow227TriangleData0044.coefficient2_404,
  OriginalRow227TriangleData0044.coefficient2_405,
  OriginalRow227TriangleData0044.coefficient2_406,
  OriginalRow227TriangleData0044.coefficient2_407,
  OriginalRow227TriangleData0044.coefficient2_408,
  OriginalRow227TriangleData0044.coefficient2_409,
  OriginalRow227TriangleData0044.coefficient2_410,
  OriginalRow227TriangleData0044.coefficient2_411,
  OriginalRow227TriangleData0044.coefficient2_412,
  OriginalRow227TriangleData0044.coefficient2_413,
  OriginalRow227TriangleData0044.coefficient2_414,
  OriginalRow227TriangleData0044.coefficient2_415,
  OriginalRow227TriangleData0044.coefficient2_416
]

theorem values0044_size : values0044.size = 32 := rfl

def block0044 : ℕ → Option IntervalDyadic := segment 385 values0044

theorem block0044_domain : ExactDomain block0044 385 417 := by
  simpa only [values0044_size] using segment_domain 385 values0044

theorem block0044_get (i : Fin 32) :
    block0044 (385 + i.val) = some (values0044[i.val]'(by rw [values0044_size]; exact i.isLt)) := by
  exact segment_get 385 values0044 ⟨i.val, by rw [values0044_size]; exact i.isLt⟩

def values0045 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0045.coefficient2_417,
  OriginalRow227TriangleData0045.coefficient2_418,
  OriginalRow227TriangleData0045.coefficient2_419,
  OriginalRow227TriangleData0045.coefficient2_420,
  OriginalRow227TriangleData0045.coefficient2_421,
  OriginalRow227TriangleData0045.coefficient2_422,
  OriginalRow227TriangleData0045.coefficient2_423,
  OriginalRow227TriangleData0045.coefficient2_424,
  OriginalRow227TriangleData0045.coefficient2_425,
  OriginalRow227TriangleData0045.coefficient2_426,
  OriginalRow227TriangleData0045.coefficient2_427,
  OriginalRow227TriangleData0045.coefficient2_428,
  OriginalRow227TriangleData0045.coefficient2_429,
  OriginalRow227TriangleData0045.coefficient2_430,
  OriginalRow227TriangleData0045.coefficient2_431,
  OriginalRow227TriangleData0045.coefficient2_432,
  OriginalRow227TriangleData0045.coefficient2_433,
  OriginalRow227TriangleData0045.coefficient2_434,
  OriginalRow227TriangleData0045.coefficient2_435,
  OriginalRow227TriangleData0045.coefficient2_436,
  OriginalRow227TriangleData0045.coefficient2_437,
  OriginalRow227TriangleData0045.coefficient2_438,
  OriginalRow227TriangleData0045.coefficient2_439,
  OriginalRow227TriangleData0045.coefficient2_440,
  OriginalRow227TriangleData0045.coefficient2_441,
  OriginalRow227TriangleData0045.coefficient2_442,
  OriginalRow227TriangleData0045.coefficient2_443,
  OriginalRow227TriangleData0045.coefficient2_444,
  OriginalRow227TriangleData0045.coefficient2_445,
  OriginalRow227TriangleData0045.coefficient2_446,
  OriginalRow227TriangleData0045.coefficient2_447,
  OriginalRow227TriangleData0045.coefficient2_448
]

theorem values0045_size : values0045.size = 32 := rfl

def block0045 : ℕ → Option IntervalDyadic := segment 417 values0045

theorem block0045_domain : ExactDomain block0045 417 449 := by
  simpa only [values0045_size] using segment_domain 417 values0045

theorem block0045_get (i : Fin 32) :
    block0045 (417 + i.val) = some (values0045[i.val]'(by rw [values0045_size]; exact i.isLt)) := by
  exact segment_get 417 values0045 ⟨i.val, by rw [values0045_size]; exact i.isLt⟩

def values0046 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0046.coefficient2_449,
  OriginalRow227TriangleData0046.coefficient2_450,
  OriginalRow227TriangleData0046.coefficient2_451,
  OriginalRow227TriangleData0046.coefficient2_452,
  OriginalRow227TriangleData0046.coefficient2_453,
  OriginalRow227TriangleData0046.coefficient2_454,
  OriginalRow227TriangleData0046.coefficient2_455,
  OriginalRow227TriangleData0046.coefficient2_456,
  OriginalRow227TriangleData0046.coefficient2_457,
  OriginalRow227TriangleData0046.coefficient2_458,
  OriginalRow227TriangleData0046.coefficient2_459,
  OriginalRow227TriangleData0046.coefficient2_460,
  OriginalRow227TriangleData0046.coefficient2_461,
  OriginalRow227TriangleData0046.coefficient2_462,
  OriginalRow227TriangleData0046.coefficient2_463,
  OriginalRow227TriangleData0046.coefficient2_464,
  OriginalRow227TriangleData0046.coefficient2_465,
  OriginalRow227TriangleData0046.coefficient2_466,
  OriginalRow227TriangleData0046.coefficient2_467,
  OriginalRow227TriangleData0046.coefficient2_468,
  OriginalRow227TriangleData0046.coefficient2_469,
  OriginalRow227TriangleData0046.coefficient2_470,
  OriginalRow227TriangleData0046.coefficient2_471,
  OriginalRow227TriangleData0046.coefficient2_472,
  OriginalRow227TriangleData0046.coefficient2_473,
  OriginalRow227TriangleData0046.coefficient2_474,
  OriginalRow227TriangleData0046.coefficient2_475,
  OriginalRow227TriangleData0046.coefficient2_476,
  OriginalRow227TriangleData0046.coefficient2_477,
  OriginalRow227TriangleData0046.coefficient2_478,
  OriginalRow227TriangleData0046.coefficient2_479,
  OriginalRow227TriangleData0046.coefficient2_480
]

theorem values0046_size : values0046.size = 32 := rfl

def block0046 : ℕ → Option IntervalDyadic := segment 449 values0046

theorem block0046_domain : ExactDomain block0046 449 481 := by
  simpa only [values0046_size] using segment_domain 449 values0046

theorem block0046_get (i : Fin 32) :
    block0046 (449 + i.val) = some (values0046[i.val]'(by rw [values0046_size]; exact i.isLt)) := by
  exact segment_get 449 values0046 ⟨i.val, by rw [values0046_size]; exact i.isLt⟩

def values0047 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0047.coefficient2_481,
  OriginalRow227TriangleData0047.coefficient2_482,
  OriginalRow227TriangleData0047.coefficient2_483,
  OriginalRow227TriangleData0047.coefficient2_484,
  OriginalRow227TriangleData0047.coefficient2_485,
  OriginalRow227TriangleData0047.coefficient2_486,
  OriginalRow227TriangleData0047.coefficient2_487,
  OriginalRow227TriangleData0047.coefficient2_488,
  OriginalRow227TriangleData0047.coefficient2_489,
  OriginalRow227TriangleData0047.coefficient2_490,
  OriginalRow227TriangleData0047.coefficient2_491,
  OriginalRow227TriangleData0047.coefficient2_492,
  OriginalRow227TriangleData0047.coefficient2_493,
  OriginalRow227TriangleData0047.coefficient2_494,
  OriginalRow227TriangleData0047.coefficient2_495,
  OriginalRow227TriangleData0047.coefficient2_496,
  OriginalRow227TriangleData0047.coefficient2_497,
  OriginalRow227TriangleData0047.coefficient2_498,
  OriginalRow227TriangleData0047.coefficient2_499
]

theorem values0047_size : values0047.size = 19 := rfl

def block0047 : ℕ → Option IntervalDyadic := segment 481 values0047

theorem block0047_domain : ExactDomain block0047 481 500 := by
  simpa only [values0047_size] using segment_domain 481 values0047

theorem block0047_get (i : Fin 19) :
    block0047 (481 + i.val) = some (values0047[i.val]'(by rw [values0047_size]; exact i.isLt)) := by
  exact segment_get 481 values0047 ⟨i.val, by rw [values0047_size]; exact i.isLt⟩

def node0001_0065 : ℕ → Option IntervalDyadic := split 33 block0032 block0033

theorem node0001_0065_domain : ExactDomain node0001_0065 1 65 := by
  exact split_domain (by decide) (by decide) block0032_domain block0033_domain

def node0065_0129 : ℕ → Option IntervalDyadic := split 97 block0034 block0035

theorem node0065_0129_domain : ExactDomain node0065_0129 65 129 := by
  exact split_domain (by decide) (by decide) block0034_domain block0035_domain

def node0001_0129 : ℕ → Option IntervalDyadic := split 65 node0001_0065 node0065_0129

theorem node0001_0129_domain : ExactDomain node0001_0129 1 129 := by
  exact split_domain (by decide) (by decide) node0001_0065_domain node0065_0129_domain

def node0129_0193 : ℕ → Option IntervalDyadic := split 161 block0036 block0037

theorem node0129_0193_domain : ExactDomain node0129_0193 129 193 := by
  exact split_domain (by decide) (by decide) block0036_domain block0037_domain

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block0038 block0039

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block0038_domain block0039_domain

def node0129_0257 : ℕ → Option IntervalDyadic := split 193 node0129_0193 node0193_0257

theorem node0129_0257_domain : ExactDomain node0129_0257 129 257 := by
  exact split_domain (by decide) (by decide) node0129_0193_domain node0193_0257_domain

def node0001_0257 : ℕ → Option IntervalDyadic := split 129 node0001_0129 node0129_0257

theorem node0001_0257_domain : ExactDomain node0001_0257 1 257 := by
  exact split_domain (by decide) (by decide) node0001_0129_domain node0129_0257_domain

def node0257_0321 : ℕ → Option IntervalDyadic := split 289 block0040 block0041

theorem node0257_0321_domain : ExactDomain node0257_0321 257 321 := by
  exact split_domain (by decide) (by decide) block0040_domain block0041_domain

def node0321_0385 : ℕ → Option IntervalDyadic := split 353 block0042 block0043

theorem node0321_0385_domain : ExactDomain node0321_0385 321 385 := by
  exact split_domain (by decide) (by decide) block0042_domain block0043_domain

def node0257_0385 : ℕ → Option IntervalDyadic := split 321 node0257_0321 node0321_0385

theorem node0257_0385_domain : ExactDomain node0257_0385 257 385 := by
  exact split_domain (by decide) (by decide) node0257_0321_domain node0321_0385_domain

def node0385_0449 : ℕ → Option IntervalDyadic := split 417 block0044 block0045

theorem node0385_0449_domain : ExactDomain node0385_0449 385 449 := by
  exact split_domain (by decide) (by decide) block0044_domain block0045_domain

def node0449_0500 : ℕ → Option IntervalDyadic := split 481 block0046 block0047

theorem node0449_0500_domain : ExactDomain node0449_0500 449 500 := by
  exact split_domain (by decide) (by decide) block0046_domain block0047_domain

def node0385_0500 : ℕ → Option IntervalDyadic := split 449 node0385_0449 node0449_0500

theorem node0385_0500_domain : ExactDomain node0385_0500 385 500 := by
  exact split_domain (by decide) (by decide) node0385_0449_domain node0449_0500_domain

def node0257_0500 : ℕ → Option IntervalDyadic := split 385 node0257_0385 node0385_0500

theorem node0257_0500_domain : ExactDomain node0257_0500 257 500 := by
  exact split_domain (by decide) (by decide) node0257_0385_domain node0385_0500_domain

def node0001_0500 : ℕ → Option IntervalDyadic := split 257 node0001_0257 node0257_0500

theorem node0001_0500_domain : ExactDomain node0001_0500 1 500 := by
  exact split_domain (by decide) (by decide) node0001_0257_domain node0257_0500_domain

def lookup : ℕ → Option IntervalDyadic := node0001_0500

theorem lookup_domain : ExactDomain lookup 1 500 :=
  node0001_0500_domain

theorem block0032_lookup (i : Fin 32) :
    lookup (1 + i.val) = some (values0032[i.val]'(by rw [values0032_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (1 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_left 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0001_0129, split_left 65 node0001_0065 node0065_0129 (by omega)]
  rw [node0001_0065, split_left 33 block0032 block0033 (by omega)]
  exact block0032_get i

theorem block0033_lookup (i : Fin 32) :
    lookup (33 + i.val) = some (values0033[i.val]'(by rw [values0033_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (33 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_left 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0001_0129, split_left 65 node0001_0065 node0065_0129 (by omega)]
  rw [node0001_0065, split_right 33 block0032 block0033 (by omega)]
  exact block0033_get i

theorem block0034_lookup (i : Fin 32) :
    lookup (65 + i.val) = some (values0034[i.val]'(by rw [values0034_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (65 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_left 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0001_0129, split_right 65 node0001_0065 node0065_0129 (by omega)]
  rw [node0065_0129, split_left 97 block0034 block0035 (by omega)]
  exact block0034_get i

theorem block0035_lookup (i : Fin 32) :
    lookup (97 + i.val) = some (values0035[i.val]'(by rw [values0035_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (97 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_left 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0001_0129, split_right 65 node0001_0065 node0065_0129 (by omega)]
  rw [node0065_0129, split_right 97 block0034 block0035 (by omega)]
  exact block0035_get i

theorem block0036_lookup (i : Fin 32) :
    lookup (129 + i.val) = some (values0036[i.val]'(by rw [values0036_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (129 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_right 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_left 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0129_0193, split_left 161 block0036 block0037 (by omega)]
  exact block0036_get i

theorem block0037_lookup (i : Fin 32) :
    lookup (161 + i.val) = some (values0037[i.val]'(by rw [values0037_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (161 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_right 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_left 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0129_0193, split_right 161 block0036 block0037 (by omega)]
  exact block0037_get i

theorem block0038_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values0038[i.val]'(by rw [values0038_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (193 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_right 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_right 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0193_0257, split_left 225 block0038 block0039 (by omega)]
  exact block0038_get i

theorem block0039_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values0039[i.val]'(by rw [values0039_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (225 + i.val) = _
  rw [node0001_0500, split_left 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0001_0257, split_right 129 node0001_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_right 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0193_0257, split_right 225 block0038 block0039 (by omega)]
  exact block0039_get i

theorem block0040_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values0040[i.val]'(by rw [values0040_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (257 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_left 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0257_0385, split_left 321 node0257_0321 node0321_0385 (by omega)]
  rw [node0257_0321, split_left 289 block0040 block0041 (by omega)]
  exact block0040_get i

theorem block0041_lookup (i : Fin 32) :
    lookup (289 + i.val) = some (values0041[i.val]'(by rw [values0041_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (289 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_left 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0257_0385, split_left 321 node0257_0321 node0321_0385 (by omega)]
  rw [node0257_0321, split_right 289 block0040 block0041 (by omega)]
  exact block0041_get i

theorem block0042_lookup (i : Fin 32) :
    lookup (321 + i.val) = some (values0042[i.val]'(by rw [values0042_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (321 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_left 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0257_0385, split_right 321 node0257_0321 node0321_0385 (by omega)]
  rw [node0321_0385, split_left 353 block0042 block0043 (by omega)]
  exact block0042_get i

theorem block0043_lookup (i : Fin 32) :
    lookup (353 + i.val) = some (values0043[i.val]'(by rw [values0043_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (353 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_left 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0257_0385, split_right 321 node0257_0321 node0321_0385 (by omega)]
  rw [node0321_0385, split_right 353 block0042 block0043 (by omega)]
  exact block0043_get i

theorem block0044_lookup (i : Fin 32) :
    lookup (385 + i.val) = some (values0044[i.val]'(by rw [values0044_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (385 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_right 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0385_0500, split_left 449 node0385_0449 node0449_0500 (by omega)]
  rw [node0385_0449, split_left 417 block0044 block0045 (by omega)]
  exact block0044_get i

theorem block0045_lookup (i : Fin 32) :
    lookup (417 + i.val) = some (values0045[i.val]'(by rw [values0045_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (417 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_right 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0385_0500, split_left 449 node0385_0449 node0449_0500 (by omega)]
  rw [node0385_0449, split_right 417 block0044 block0045 (by omega)]
  exact block0045_get i

theorem block0046_lookup (i : Fin 32) :
    lookup (449 + i.val) = some (values0046[i.val]'(by rw [values0046_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (449 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_right 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0385_0500, split_right 449 node0385_0449 node0449_0500 (by omega)]
  rw [node0449_0500, split_left 481 block0046 block0047 (by omega)]
  exact block0046_get i

theorem block0047_lookup (i : Fin 19) :
    lookup (481 + i.val) = some (values0047[i.val]'(by rw [values0047_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0001_0500 (481 + i.val) = _
  rw [node0001_0500, split_right 257 node0001_0257 node0257_0500 (by omega)]
  rw [node0257_0500, split_right 385 node0257_0385 node0385_0500 (by omega)]
  rw [node0385_0500, split_right 449 node0385_0449 node0449_0500 (by omega)]
  rw [node0449_0500, split_right 481 block0046 block0047 (by omega)]
  exact block0047_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0032_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0032_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0033_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0033_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0034_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0034_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0035_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0035_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0036_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0036_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0037_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0037_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0038_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0038_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0039_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0039_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0040_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0040_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0041_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0041_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0042_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0042_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0043_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0043_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0044_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0044_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0045_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0045_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0046_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0046_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0047_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0047_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0032_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0033_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0034_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0035_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0036_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0037_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0038_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0039_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0040_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0041_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0042_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0043_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0044_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0045_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0046_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow002.block0047_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow002
