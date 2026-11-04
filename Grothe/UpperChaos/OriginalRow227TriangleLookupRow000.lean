import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0000
import Grothe.UpperChaos.OriginalRow227TriangleData0001
import Grothe.UpperChaos.OriginalRow227TriangleData0002
import Grothe.UpperChaos.OriginalRow227TriangleData0003
import Grothe.UpperChaos.OriginalRow227TriangleData0004
import Grothe.UpperChaos.OriginalRow227TriangleData0005
import Grothe.UpperChaos.OriginalRow227TriangleData0006
import Grothe.UpperChaos.OriginalRow227TriangleData0007
import Grothe.UpperChaos.OriginalRow227TriangleData0008
import Grothe.UpperChaos.OriginalRow227TriangleData0009
import Grothe.UpperChaos.OriginalRow227TriangleData0010
import Grothe.UpperChaos.OriginalRow227TriangleData0011
import Grothe.UpperChaos.OriginalRow227TriangleData0012
import Grothe.UpperChaos.OriginalRow227TriangleData0013
import Grothe.UpperChaos.OriginalRow227TriangleData0014
import Grothe.UpperChaos.OriginalRow227TriangleData0015

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow000

open ConditionalTableLookup

def values0000 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0000.coefficient0_0,
  OriginalRow227TriangleData0000.coefficient0_1,
  OriginalRow227TriangleData0000.coefficient0_2,
  OriginalRow227TriangleData0000.coefficient0_3,
  OriginalRow227TriangleData0000.coefficient0_4,
  OriginalRow227TriangleData0000.coefficient0_5,
  OriginalRow227TriangleData0000.coefficient0_6,
  OriginalRow227TriangleData0000.coefficient0_7,
  OriginalRow227TriangleData0000.coefficient0_8,
  OriginalRow227TriangleData0000.coefficient0_9,
  OriginalRow227TriangleData0000.coefficient0_10,
  OriginalRow227TriangleData0000.coefficient0_11,
  OriginalRow227TriangleData0000.coefficient0_12,
  OriginalRow227TriangleData0000.coefficient0_13,
  OriginalRow227TriangleData0000.coefficient0_14,
  OriginalRow227TriangleData0000.coefficient0_15,
  OriginalRow227TriangleData0000.coefficient0_16,
  OriginalRow227TriangleData0000.coefficient0_17,
  OriginalRow227TriangleData0000.coefficient0_18,
  OriginalRow227TriangleData0000.coefficient0_19,
  OriginalRow227TriangleData0000.coefficient0_20,
  OriginalRow227TriangleData0000.coefficient0_21,
  OriginalRow227TriangleData0000.coefficient0_22,
  OriginalRow227TriangleData0000.coefficient0_23,
  OriginalRow227TriangleData0000.coefficient0_24,
  OriginalRow227TriangleData0000.coefficient0_25,
  OriginalRow227TriangleData0000.coefficient0_26,
  OriginalRow227TriangleData0000.coefficient0_27,
  OriginalRow227TriangleData0000.coefficient0_28,
  OriginalRow227TriangleData0000.coefficient0_29,
  OriginalRow227TriangleData0000.coefficient0_30,
  OriginalRow227TriangleData0000.coefficient0_31
]

theorem values0000_size : values0000.size = 32 := rfl

def block0000 : ℕ → Option IntervalDyadic := segment 0 values0000

theorem block0000_domain : ExactDomain block0000 0 32 := by
  simpa only [values0000_size] using segment_domain 0 values0000

theorem block0000_get (i : Fin 32) :
    block0000 (0 + i.val) = some (values0000[i.val]'(by rw [values0000_size]; exact i.isLt)) := by
  exact segment_get 0 values0000 ⟨i.val, by rw [values0000_size]; exact i.isLt⟩

def values0001 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0001.coefficient0_32,
  OriginalRow227TriangleData0001.coefficient0_33,
  OriginalRow227TriangleData0001.coefficient0_34,
  OriginalRow227TriangleData0001.coefficient0_35,
  OriginalRow227TriangleData0001.coefficient0_36,
  OriginalRow227TriangleData0001.coefficient0_37,
  OriginalRow227TriangleData0001.coefficient0_38,
  OriginalRow227TriangleData0001.coefficient0_39,
  OriginalRow227TriangleData0001.coefficient0_40,
  OriginalRow227TriangleData0001.coefficient0_41,
  OriginalRow227TriangleData0001.coefficient0_42,
  OriginalRow227TriangleData0001.coefficient0_43,
  OriginalRow227TriangleData0001.coefficient0_44,
  OriginalRow227TriangleData0001.coefficient0_45,
  OriginalRow227TriangleData0001.coefficient0_46,
  OriginalRow227TriangleData0001.coefficient0_47,
  OriginalRow227TriangleData0001.coefficient0_48,
  OriginalRow227TriangleData0001.coefficient0_49,
  OriginalRow227TriangleData0001.coefficient0_50,
  OriginalRow227TriangleData0001.coefficient0_51,
  OriginalRow227TriangleData0001.coefficient0_52,
  OriginalRow227TriangleData0001.coefficient0_53,
  OriginalRow227TriangleData0001.coefficient0_54,
  OriginalRow227TriangleData0001.coefficient0_55,
  OriginalRow227TriangleData0001.coefficient0_56,
  OriginalRow227TriangleData0001.coefficient0_57,
  OriginalRow227TriangleData0001.coefficient0_58,
  OriginalRow227TriangleData0001.coefficient0_59,
  OriginalRow227TriangleData0001.coefficient0_60,
  OriginalRow227TriangleData0001.coefficient0_61,
  OriginalRow227TriangleData0001.coefficient0_62,
  OriginalRow227TriangleData0001.coefficient0_63
]

theorem values0001_size : values0001.size = 32 := rfl

def block0001 : ℕ → Option IntervalDyadic := segment 32 values0001

theorem block0001_domain : ExactDomain block0001 32 64 := by
  simpa only [values0001_size] using segment_domain 32 values0001

theorem block0001_get (i : Fin 32) :
    block0001 (32 + i.val) = some (values0001[i.val]'(by rw [values0001_size]; exact i.isLt)) := by
  exact segment_get 32 values0001 ⟨i.val, by rw [values0001_size]; exact i.isLt⟩

def values0002 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0002.coefficient0_64,
  OriginalRow227TriangleData0002.coefficient0_65,
  OriginalRow227TriangleData0002.coefficient0_66,
  OriginalRow227TriangleData0002.coefficient0_67,
  OriginalRow227TriangleData0002.coefficient0_68,
  OriginalRow227TriangleData0002.coefficient0_69,
  OriginalRow227TriangleData0002.coefficient0_70,
  OriginalRow227TriangleData0002.coefficient0_71,
  OriginalRow227TriangleData0002.coefficient0_72,
  OriginalRow227TriangleData0002.coefficient0_73,
  OriginalRow227TriangleData0002.coefficient0_74,
  OriginalRow227TriangleData0002.coefficient0_75,
  OriginalRow227TriangleData0002.coefficient0_76,
  OriginalRow227TriangleData0002.coefficient0_77,
  OriginalRow227TriangleData0002.coefficient0_78,
  OriginalRow227TriangleData0002.coefficient0_79,
  OriginalRow227TriangleData0002.coefficient0_80,
  OriginalRow227TriangleData0002.coefficient0_81,
  OriginalRow227TriangleData0002.coefficient0_82,
  OriginalRow227TriangleData0002.coefficient0_83,
  OriginalRow227TriangleData0002.coefficient0_84,
  OriginalRow227TriangleData0002.coefficient0_85,
  OriginalRow227TriangleData0002.coefficient0_86,
  OriginalRow227TriangleData0002.coefficient0_87,
  OriginalRow227TriangleData0002.coefficient0_88,
  OriginalRow227TriangleData0002.coefficient0_89,
  OriginalRow227TriangleData0002.coefficient0_90,
  OriginalRow227TriangleData0002.coefficient0_91,
  OriginalRow227TriangleData0002.coefficient0_92,
  OriginalRow227TriangleData0002.coefficient0_93,
  OriginalRow227TriangleData0002.coefficient0_94,
  OriginalRow227TriangleData0002.coefficient0_95
]

theorem values0002_size : values0002.size = 32 := rfl

def block0002 : ℕ → Option IntervalDyadic := segment 64 values0002

theorem block0002_domain : ExactDomain block0002 64 96 := by
  simpa only [values0002_size] using segment_domain 64 values0002

theorem block0002_get (i : Fin 32) :
    block0002 (64 + i.val) = some (values0002[i.val]'(by rw [values0002_size]; exact i.isLt)) := by
  exact segment_get 64 values0002 ⟨i.val, by rw [values0002_size]; exact i.isLt⟩

def values0003 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0003.coefficient0_96,
  OriginalRow227TriangleData0003.coefficient0_97,
  OriginalRow227TriangleData0003.coefficient0_98,
  OriginalRow227TriangleData0003.coefficient0_99,
  OriginalRow227TriangleData0003.coefficient0_100,
  OriginalRow227TriangleData0003.coefficient0_101,
  OriginalRow227TriangleData0003.coefficient0_102,
  OriginalRow227TriangleData0003.coefficient0_103,
  OriginalRow227TriangleData0003.coefficient0_104,
  OriginalRow227TriangleData0003.coefficient0_105,
  OriginalRow227TriangleData0003.coefficient0_106,
  OriginalRow227TriangleData0003.coefficient0_107,
  OriginalRow227TriangleData0003.coefficient0_108,
  OriginalRow227TriangleData0003.coefficient0_109,
  OriginalRow227TriangleData0003.coefficient0_110,
  OriginalRow227TriangleData0003.coefficient0_111,
  OriginalRow227TriangleData0003.coefficient0_112,
  OriginalRow227TriangleData0003.coefficient0_113,
  OriginalRow227TriangleData0003.coefficient0_114,
  OriginalRow227TriangleData0003.coefficient0_115,
  OriginalRow227TriangleData0003.coefficient0_116,
  OriginalRow227TriangleData0003.coefficient0_117,
  OriginalRow227TriangleData0003.coefficient0_118,
  OriginalRow227TriangleData0003.coefficient0_119,
  OriginalRow227TriangleData0003.coefficient0_120,
  OriginalRow227TriangleData0003.coefficient0_121,
  OriginalRow227TriangleData0003.coefficient0_122,
  OriginalRow227TriangleData0003.coefficient0_123,
  OriginalRow227TriangleData0003.coefficient0_124,
  OriginalRow227TriangleData0003.coefficient0_125,
  OriginalRow227TriangleData0003.coefficient0_126,
  OriginalRow227TriangleData0003.coefficient0_127
]

theorem values0003_size : values0003.size = 32 := rfl

def block0003 : ℕ → Option IntervalDyadic := segment 96 values0003

theorem block0003_domain : ExactDomain block0003 96 128 := by
  simpa only [values0003_size] using segment_domain 96 values0003

theorem block0003_get (i : Fin 32) :
    block0003 (96 + i.val) = some (values0003[i.val]'(by rw [values0003_size]; exact i.isLt)) := by
  exact segment_get 96 values0003 ⟨i.val, by rw [values0003_size]; exact i.isLt⟩

def values0004 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0004.coefficient0_128,
  OriginalRow227TriangleData0004.coefficient0_129,
  OriginalRow227TriangleData0004.coefficient0_130,
  OriginalRow227TriangleData0004.coefficient0_131,
  OriginalRow227TriangleData0004.coefficient0_132,
  OriginalRow227TriangleData0004.coefficient0_133,
  OriginalRow227TriangleData0004.coefficient0_134,
  OriginalRow227TriangleData0004.coefficient0_135,
  OriginalRow227TriangleData0004.coefficient0_136,
  OriginalRow227TriangleData0004.coefficient0_137,
  OriginalRow227TriangleData0004.coefficient0_138,
  OriginalRow227TriangleData0004.coefficient0_139,
  OriginalRow227TriangleData0004.coefficient0_140,
  OriginalRow227TriangleData0004.coefficient0_141,
  OriginalRow227TriangleData0004.coefficient0_142,
  OriginalRow227TriangleData0004.coefficient0_143,
  OriginalRow227TriangleData0004.coefficient0_144,
  OriginalRow227TriangleData0004.coefficient0_145,
  OriginalRow227TriangleData0004.coefficient0_146,
  OriginalRow227TriangleData0004.coefficient0_147,
  OriginalRow227TriangleData0004.coefficient0_148,
  OriginalRow227TriangleData0004.coefficient0_149,
  OriginalRow227TriangleData0004.coefficient0_150,
  OriginalRow227TriangleData0004.coefficient0_151,
  OriginalRow227TriangleData0004.coefficient0_152,
  OriginalRow227TriangleData0004.coefficient0_153,
  OriginalRow227TriangleData0004.coefficient0_154,
  OriginalRow227TriangleData0004.coefficient0_155,
  OriginalRow227TriangleData0004.coefficient0_156,
  OriginalRow227TriangleData0004.coefficient0_157,
  OriginalRow227TriangleData0004.coefficient0_158,
  OriginalRow227TriangleData0004.coefficient0_159
]

theorem values0004_size : values0004.size = 32 := rfl

def block0004 : ℕ → Option IntervalDyadic := segment 128 values0004

theorem block0004_domain : ExactDomain block0004 128 160 := by
  simpa only [values0004_size] using segment_domain 128 values0004

theorem block0004_get (i : Fin 32) :
    block0004 (128 + i.val) = some (values0004[i.val]'(by rw [values0004_size]; exact i.isLt)) := by
  exact segment_get 128 values0004 ⟨i.val, by rw [values0004_size]; exact i.isLt⟩

def values0005 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0005.coefficient0_160,
  OriginalRow227TriangleData0005.coefficient0_161,
  OriginalRow227TriangleData0005.coefficient0_162,
  OriginalRow227TriangleData0005.coefficient0_163,
  OriginalRow227TriangleData0005.coefficient0_164,
  OriginalRow227TriangleData0005.coefficient0_165,
  OriginalRow227TriangleData0005.coefficient0_166,
  OriginalRow227TriangleData0005.coefficient0_167,
  OriginalRow227TriangleData0005.coefficient0_168,
  OriginalRow227TriangleData0005.coefficient0_169,
  OriginalRow227TriangleData0005.coefficient0_170,
  OriginalRow227TriangleData0005.coefficient0_171,
  OriginalRow227TriangleData0005.coefficient0_172,
  OriginalRow227TriangleData0005.coefficient0_173,
  OriginalRow227TriangleData0005.coefficient0_174,
  OriginalRow227TriangleData0005.coefficient0_175,
  OriginalRow227TriangleData0005.coefficient0_176,
  OriginalRow227TriangleData0005.coefficient0_177,
  OriginalRow227TriangleData0005.coefficient0_178,
  OriginalRow227TriangleData0005.coefficient0_179,
  OriginalRow227TriangleData0005.coefficient0_180,
  OriginalRow227TriangleData0005.coefficient0_181,
  OriginalRow227TriangleData0005.coefficient0_182,
  OriginalRow227TriangleData0005.coefficient0_183,
  OriginalRow227TriangleData0005.coefficient0_184,
  OriginalRow227TriangleData0005.coefficient0_185,
  OriginalRow227TriangleData0005.coefficient0_186,
  OriginalRow227TriangleData0005.coefficient0_187,
  OriginalRow227TriangleData0005.coefficient0_188,
  OriginalRow227TriangleData0005.coefficient0_189,
  OriginalRow227TriangleData0005.coefficient0_190,
  OriginalRow227TriangleData0005.coefficient0_191
]

theorem values0005_size : values0005.size = 32 := rfl

def block0005 : ℕ → Option IntervalDyadic := segment 160 values0005

theorem block0005_domain : ExactDomain block0005 160 192 := by
  simpa only [values0005_size] using segment_domain 160 values0005

theorem block0005_get (i : Fin 32) :
    block0005 (160 + i.val) = some (values0005[i.val]'(by rw [values0005_size]; exact i.isLt)) := by
  exact segment_get 160 values0005 ⟨i.val, by rw [values0005_size]; exact i.isLt⟩

def values0006 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0006.coefficient0_192,
  OriginalRow227TriangleData0006.coefficient0_193,
  OriginalRow227TriangleData0006.coefficient0_194,
  OriginalRow227TriangleData0006.coefficient0_195,
  OriginalRow227TriangleData0006.coefficient0_196,
  OriginalRow227TriangleData0006.coefficient0_197,
  OriginalRow227TriangleData0006.coefficient0_198,
  OriginalRow227TriangleData0006.coefficient0_199,
  OriginalRow227TriangleData0006.coefficient0_200,
  OriginalRow227TriangleData0006.coefficient0_201,
  OriginalRow227TriangleData0006.coefficient0_202,
  OriginalRow227TriangleData0006.coefficient0_203,
  OriginalRow227TriangleData0006.coefficient0_204,
  OriginalRow227TriangleData0006.coefficient0_205,
  OriginalRow227TriangleData0006.coefficient0_206,
  OriginalRow227TriangleData0006.coefficient0_207,
  OriginalRow227TriangleData0006.coefficient0_208,
  OriginalRow227TriangleData0006.coefficient0_209,
  OriginalRow227TriangleData0006.coefficient0_210,
  OriginalRow227TriangleData0006.coefficient0_211,
  OriginalRow227TriangleData0006.coefficient0_212,
  OriginalRow227TriangleData0006.coefficient0_213,
  OriginalRow227TriangleData0006.coefficient0_214,
  OriginalRow227TriangleData0006.coefficient0_215,
  OriginalRow227TriangleData0006.coefficient0_216,
  OriginalRow227TriangleData0006.coefficient0_217,
  OriginalRow227TriangleData0006.coefficient0_218,
  OriginalRow227TriangleData0006.coefficient0_219,
  OriginalRow227TriangleData0006.coefficient0_220,
  OriginalRow227TriangleData0006.coefficient0_221,
  OriginalRow227TriangleData0006.coefficient0_222,
  OriginalRow227TriangleData0006.coefficient0_223
]

theorem values0006_size : values0006.size = 32 := rfl

def block0006 : ℕ → Option IntervalDyadic := segment 192 values0006

theorem block0006_domain : ExactDomain block0006 192 224 := by
  simpa only [values0006_size] using segment_domain 192 values0006

theorem block0006_get (i : Fin 32) :
    block0006 (192 + i.val) = some (values0006[i.val]'(by rw [values0006_size]; exact i.isLt)) := by
  exact segment_get 192 values0006 ⟨i.val, by rw [values0006_size]; exact i.isLt⟩

def values0007 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0007.coefficient0_224,
  OriginalRow227TriangleData0007.coefficient0_225,
  OriginalRow227TriangleData0007.coefficient0_226,
  OriginalRow227TriangleData0007.coefficient0_227,
  OriginalRow227TriangleData0007.coefficient0_228,
  OriginalRow227TriangleData0007.coefficient0_229,
  OriginalRow227TriangleData0007.coefficient0_230,
  OriginalRow227TriangleData0007.coefficient0_231,
  OriginalRow227TriangleData0007.coefficient0_232,
  OriginalRow227TriangleData0007.coefficient0_233,
  OriginalRow227TriangleData0007.coefficient0_234,
  OriginalRow227TriangleData0007.coefficient0_235,
  OriginalRow227TriangleData0007.coefficient0_236,
  OriginalRow227TriangleData0007.coefficient0_237,
  OriginalRow227TriangleData0007.coefficient0_238,
  OriginalRow227TriangleData0007.coefficient0_239,
  OriginalRow227TriangleData0007.coefficient0_240,
  OriginalRow227TriangleData0007.coefficient0_241,
  OriginalRow227TriangleData0007.coefficient0_242,
  OriginalRow227TriangleData0007.coefficient0_243,
  OriginalRow227TriangleData0007.coefficient0_244,
  OriginalRow227TriangleData0007.coefficient0_245,
  OriginalRow227TriangleData0007.coefficient0_246,
  OriginalRow227TriangleData0007.coefficient0_247,
  OriginalRow227TriangleData0007.coefficient0_248,
  OriginalRow227TriangleData0007.coefficient0_249,
  OriginalRow227TriangleData0007.coefficient0_250,
  OriginalRow227TriangleData0007.coefficient0_251,
  OriginalRow227TriangleData0007.coefficient0_252,
  OriginalRow227TriangleData0007.coefficient0_253,
  OriginalRow227TriangleData0007.coefficient0_254,
  OriginalRow227TriangleData0007.coefficient0_255
]

theorem values0007_size : values0007.size = 32 := rfl

def block0007 : ℕ → Option IntervalDyadic := segment 224 values0007

theorem block0007_domain : ExactDomain block0007 224 256 := by
  simpa only [values0007_size] using segment_domain 224 values0007

theorem block0007_get (i : Fin 32) :
    block0007 (224 + i.val) = some (values0007[i.val]'(by rw [values0007_size]; exact i.isLt)) := by
  exact segment_get 224 values0007 ⟨i.val, by rw [values0007_size]; exact i.isLt⟩

def values0008 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0008.coefficient0_256,
  OriginalRow227TriangleData0008.coefficient0_257,
  OriginalRow227TriangleData0008.coefficient0_258,
  OriginalRow227TriangleData0008.coefficient0_259,
  OriginalRow227TriangleData0008.coefficient0_260,
  OriginalRow227TriangleData0008.coefficient0_261,
  OriginalRow227TriangleData0008.coefficient0_262,
  OriginalRow227TriangleData0008.coefficient0_263,
  OriginalRow227TriangleData0008.coefficient0_264,
  OriginalRow227TriangleData0008.coefficient0_265,
  OriginalRow227TriangleData0008.coefficient0_266,
  OriginalRow227TriangleData0008.coefficient0_267,
  OriginalRow227TriangleData0008.coefficient0_268,
  OriginalRow227TriangleData0008.coefficient0_269,
  OriginalRow227TriangleData0008.coefficient0_270,
  OriginalRow227TriangleData0008.coefficient0_271,
  OriginalRow227TriangleData0008.coefficient0_272,
  OriginalRow227TriangleData0008.coefficient0_273,
  OriginalRow227TriangleData0008.coefficient0_274,
  OriginalRow227TriangleData0008.coefficient0_275,
  OriginalRow227TriangleData0008.coefficient0_276,
  OriginalRow227TriangleData0008.coefficient0_277,
  OriginalRow227TriangleData0008.coefficient0_278,
  OriginalRow227TriangleData0008.coefficient0_279,
  OriginalRow227TriangleData0008.coefficient0_280,
  OriginalRow227TriangleData0008.coefficient0_281,
  OriginalRow227TriangleData0008.coefficient0_282,
  OriginalRow227TriangleData0008.coefficient0_283,
  OriginalRow227TriangleData0008.coefficient0_284,
  OriginalRow227TriangleData0008.coefficient0_285,
  OriginalRow227TriangleData0008.coefficient0_286,
  OriginalRow227TriangleData0008.coefficient0_287
]

theorem values0008_size : values0008.size = 32 := rfl

def block0008 : ℕ → Option IntervalDyadic := segment 256 values0008

theorem block0008_domain : ExactDomain block0008 256 288 := by
  simpa only [values0008_size] using segment_domain 256 values0008

theorem block0008_get (i : Fin 32) :
    block0008 (256 + i.val) = some (values0008[i.val]'(by rw [values0008_size]; exact i.isLt)) := by
  exact segment_get 256 values0008 ⟨i.val, by rw [values0008_size]; exact i.isLt⟩

def values0009 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0009.coefficient0_288,
  OriginalRow227TriangleData0009.coefficient0_289,
  OriginalRow227TriangleData0009.coefficient0_290,
  OriginalRow227TriangleData0009.coefficient0_291,
  OriginalRow227TriangleData0009.coefficient0_292,
  OriginalRow227TriangleData0009.coefficient0_293,
  OriginalRow227TriangleData0009.coefficient0_294,
  OriginalRow227TriangleData0009.coefficient0_295,
  OriginalRow227TriangleData0009.coefficient0_296,
  OriginalRow227TriangleData0009.coefficient0_297,
  OriginalRow227TriangleData0009.coefficient0_298,
  OriginalRow227TriangleData0009.coefficient0_299,
  OriginalRow227TriangleData0009.coefficient0_300,
  OriginalRow227TriangleData0009.coefficient0_301,
  OriginalRow227TriangleData0009.coefficient0_302,
  OriginalRow227TriangleData0009.coefficient0_303,
  OriginalRow227TriangleData0009.coefficient0_304,
  OriginalRow227TriangleData0009.coefficient0_305,
  OriginalRow227TriangleData0009.coefficient0_306,
  OriginalRow227TriangleData0009.coefficient0_307,
  OriginalRow227TriangleData0009.coefficient0_308,
  OriginalRow227TriangleData0009.coefficient0_309,
  OriginalRow227TriangleData0009.coefficient0_310,
  OriginalRow227TriangleData0009.coefficient0_311,
  OriginalRow227TriangleData0009.coefficient0_312,
  OriginalRow227TriangleData0009.coefficient0_313,
  OriginalRow227TriangleData0009.coefficient0_314,
  OriginalRow227TriangleData0009.coefficient0_315,
  OriginalRow227TriangleData0009.coefficient0_316,
  OriginalRow227TriangleData0009.coefficient0_317,
  OriginalRow227TriangleData0009.coefficient0_318,
  OriginalRow227TriangleData0009.coefficient0_319
]

theorem values0009_size : values0009.size = 32 := rfl

def block0009 : ℕ → Option IntervalDyadic := segment 288 values0009

theorem block0009_domain : ExactDomain block0009 288 320 := by
  simpa only [values0009_size] using segment_domain 288 values0009

theorem block0009_get (i : Fin 32) :
    block0009 (288 + i.val) = some (values0009[i.val]'(by rw [values0009_size]; exact i.isLt)) := by
  exact segment_get 288 values0009 ⟨i.val, by rw [values0009_size]; exact i.isLt⟩

def values0010 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0010.coefficient0_320,
  OriginalRow227TriangleData0010.coefficient0_321,
  OriginalRow227TriangleData0010.coefficient0_322,
  OriginalRow227TriangleData0010.coefficient0_323,
  OriginalRow227TriangleData0010.coefficient0_324,
  OriginalRow227TriangleData0010.coefficient0_325,
  OriginalRow227TriangleData0010.coefficient0_326,
  OriginalRow227TriangleData0010.coefficient0_327,
  OriginalRow227TriangleData0010.coefficient0_328,
  OriginalRow227TriangleData0010.coefficient0_329,
  OriginalRow227TriangleData0010.coefficient0_330,
  OriginalRow227TriangleData0010.coefficient0_331,
  OriginalRow227TriangleData0010.coefficient0_332,
  OriginalRow227TriangleData0010.coefficient0_333,
  OriginalRow227TriangleData0010.coefficient0_334,
  OriginalRow227TriangleData0010.coefficient0_335,
  OriginalRow227TriangleData0010.coefficient0_336,
  OriginalRow227TriangleData0010.coefficient0_337,
  OriginalRow227TriangleData0010.coefficient0_338,
  OriginalRow227TriangleData0010.coefficient0_339,
  OriginalRow227TriangleData0010.coefficient0_340,
  OriginalRow227TriangleData0010.coefficient0_341,
  OriginalRow227TriangleData0010.coefficient0_342,
  OriginalRow227TriangleData0010.coefficient0_343,
  OriginalRow227TriangleData0010.coefficient0_344,
  OriginalRow227TriangleData0010.coefficient0_345,
  OriginalRow227TriangleData0010.coefficient0_346,
  OriginalRow227TriangleData0010.coefficient0_347,
  OriginalRow227TriangleData0010.coefficient0_348,
  OriginalRow227TriangleData0010.coefficient0_349,
  OriginalRow227TriangleData0010.coefficient0_350,
  OriginalRow227TriangleData0010.coefficient0_351
]

theorem values0010_size : values0010.size = 32 := rfl

def block0010 : ℕ → Option IntervalDyadic := segment 320 values0010

theorem block0010_domain : ExactDomain block0010 320 352 := by
  simpa only [values0010_size] using segment_domain 320 values0010

theorem block0010_get (i : Fin 32) :
    block0010 (320 + i.val) = some (values0010[i.val]'(by rw [values0010_size]; exact i.isLt)) := by
  exact segment_get 320 values0010 ⟨i.val, by rw [values0010_size]; exact i.isLt⟩

def values0011 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0011.coefficient0_352,
  OriginalRow227TriangleData0011.coefficient0_353,
  OriginalRow227TriangleData0011.coefficient0_354,
  OriginalRow227TriangleData0011.coefficient0_355,
  OriginalRow227TriangleData0011.coefficient0_356,
  OriginalRow227TriangleData0011.coefficient0_357,
  OriginalRow227TriangleData0011.coefficient0_358,
  OriginalRow227TriangleData0011.coefficient0_359,
  OriginalRow227TriangleData0011.coefficient0_360,
  OriginalRow227TriangleData0011.coefficient0_361,
  OriginalRow227TriangleData0011.coefficient0_362,
  OriginalRow227TriangleData0011.coefficient0_363,
  OriginalRow227TriangleData0011.coefficient0_364,
  OriginalRow227TriangleData0011.coefficient0_365,
  OriginalRow227TriangleData0011.coefficient0_366,
  OriginalRow227TriangleData0011.coefficient0_367,
  OriginalRow227TriangleData0011.coefficient0_368,
  OriginalRow227TriangleData0011.coefficient0_369,
  OriginalRow227TriangleData0011.coefficient0_370,
  OriginalRow227TriangleData0011.coefficient0_371,
  OriginalRow227TriangleData0011.coefficient0_372,
  OriginalRow227TriangleData0011.coefficient0_373,
  OriginalRow227TriangleData0011.coefficient0_374,
  OriginalRow227TriangleData0011.coefficient0_375,
  OriginalRow227TriangleData0011.coefficient0_376,
  OriginalRow227TriangleData0011.coefficient0_377,
  OriginalRow227TriangleData0011.coefficient0_378,
  OriginalRow227TriangleData0011.coefficient0_379,
  OriginalRow227TriangleData0011.coefficient0_380,
  OriginalRow227TriangleData0011.coefficient0_381,
  OriginalRow227TriangleData0011.coefficient0_382,
  OriginalRow227TriangleData0011.coefficient0_383
]

theorem values0011_size : values0011.size = 32 := rfl

def block0011 : ℕ → Option IntervalDyadic := segment 352 values0011

theorem block0011_domain : ExactDomain block0011 352 384 := by
  simpa only [values0011_size] using segment_domain 352 values0011

theorem block0011_get (i : Fin 32) :
    block0011 (352 + i.val) = some (values0011[i.val]'(by rw [values0011_size]; exact i.isLt)) := by
  exact segment_get 352 values0011 ⟨i.val, by rw [values0011_size]; exact i.isLt⟩

def values0012 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0012.coefficient0_384,
  OriginalRow227TriangleData0012.coefficient0_385,
  OriginalRow227TriangleData0012.coefficient0_386,
  OriginalRow227TriangleData0012.coefficient0_387,
  OriginalRow227TriangleData0012.coefficient0_388,
  OriginalRow227TriangleData0012.coefficient0_389,
  OriginalRow227TriangleData0012.coefficient0_390,
  OriginalRow227TriangleData0012.coefficient0_391,
  OriginalRow227TriangleData0012.coefficient0_392,
  OriginalRow227TriangleData0012.coefficient0_393,
  OriginalRow227TriangleData0012.coefficient0_394,
  OriginalRow227TriangleData0012.coefficient0_395,
  OriginalRow227TriangleData0012.coefficient0_396,
  OriginalRow227TriangleData0012.coefficient0_397,
  OriginalRow227TriangleData0012.coefficient0_398,
  OriginalRow227TriangleData0012.coefficient0_399,
  OriginalRow227TriangleData0012.coefficient0_400,
  OriginalRow227TriangleData0012.coefficient0_401,
  OriginalRow227TriangleData0012.coefficient0_402,
  OriginalRow227TriangleData0012.coefficient0_403,
  OriginalRow227TriangleData0012.coefficient0_404,
  OriginalRow227TriangleData0012.coefficient0_405,
  OriginalRow227TriangleData0012.coefficient0_406,
  OriginalRow227TriangleData0012.coefficient0_407,
  OriginalRow227TriangleData0012.coefficient0_408,
  OriginalRow227TriangleData0012.coefficient0_409,
  OriginalRow227TriangleData0012.coefficient0_410,
  OriginalRow227TriangleData0012.coefficient0_411,
  OriginalRow227TriangleData0012.coefficient0_412,
  OriginalRow227TriangleData0012.coefficient0_413,
  OriginalRow227TriangleData0012.coefficient0_414,
  OriginalRow227TriangleData0012.coefficient0_415
]

theorem values0012_size : values0012.size = 32 := rfl

def block0012 : ℕ → Option IntervalDyadic := segment 384 values0012

theorem block0012_domain : ExactDomain block0012 384 416 := by
  simpa only [values0012_size] using segment_domain 384 values0012

theorem block0012_get (i : Fin 32) :
    block0012 (384 + i.val) = some (values0012[i.val]'(by rw [values0012_size]; exact i.isLt)) := by
  exact segment_get 384 values0012 ⟨i.val, by rw [values0012_size]; exact i.isLt⟩

def values0013 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0013.coefficient0_416,
  OriginalRow227TriangleData0013.coefficient0_417,
  OriginalRow227TriangleData0013.coefficient0_418,
  OriginalRow227TriangleData0013.coefficient0_419,
  OriginalRow227TriangleData0013.coefficient0_420,
  OriginalRow227TriangleData0013.coefficient0_421,
  OriginalRow227TriangleData0013.coefficient0_422,
  OriginalRow227TriangleData0013.coefficient0_423,
  OriginalRow227TriangleData0013.coefficient0_424,
  OriginalRow227TriangleData0013.coefficient0_425,
  OriginalRow227TriangleData0013.coefficient0_426,
  OriginalRow227TriangleData0013.coefficient0_427,
  OriginalRow227TriangleData0013.coefficient0_428,
  OriginalRow227TriangleData0013.coefficient0_429,
  OriginalRow227TriangleData0013.coefficient0_430,
  OriginalRow227TriangleData0013.coefficient0_431,
  OriginalRow227TriangleData0013.coefficient0_432,
  OriginalRow227TriangleData0013.coefficient0_433,
  OriginalRow227TriangleData0013.coefficient0_434,
  OriginalRow227TriangleData0013.coefficient0_435,
  OriginalRow227TriangleData0013.coefficient0_436,
  OriginalRow227TriangleData0013.coefficient0_437,
  OriginalRow227TriangleData0013.coefficient0_438,
  OriginalRow227TriangleData0013.coefficient0_439,
  OriginalRow227TriangleData0013.coefficient0_440,
  OriginalRow227TriangleData0013.coefficient0_441,
  OriginalRow227TriangleData0013.coefficient0_442,
  OriginalRow227TriangleData0013.coefficient0_443,
  OriginalRow227TriangleData0013.coefficient0_444,
  OriginalRow227TriangleData0013.coefficient0_445,
  OriginalRow227TriangleData0013.coefficient0_446,
  OriginalRow227TriangleData0013.coefficient0_447
]

theorem values0013_size : values0013.size = 32 := rfl

def block0013 : ℕ → Option IntervalDyadic := segment 416 values0013

theorem block0013_domain : ExactDomain block0013 416 448 := by
  simpa only [values0013_size] using segment_domain 416 values0013

theorem block0013_get (i : Fin 32) :
    block0013 (416 + i.val) = some (values0013[i.val]'(by rw [values0013_size]; exact i.isLt)) := by
  exact segment_get 416 values0013 ⟨i.val, by rw [values0013_size]; exact i.isLt⟩

def values0014 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0014.coefficient0_448,
  OriginalRow227TriangleData0014.coefficient0_449,
  OriginalRow227TriangleData0014.coefficient0_450,
  OriginalRow227TriangleData0014.coefficient0_451,
  OriginalRow227TriangleData0014.coefficient0_452,
  OriginalRow227TriangleData0014.coefficient0_453,
  OriginalRow227TriangleData0014.coefficient0_454,
  OriginalRow227TriangleData0014.coefficient0_455,
  OriginalRow227TriangleData0014.coefficient0_456,
  OriginalRow227TriangleData0014.coefficient0_457,
  OriginalRow227TriangleData0014.coefficient0_458,
  OriginalRow227TriangleData0014.coefficient0_459,
  OriginalRow227TriangleData0014.coefficient0_460,
  OriginalRow227TriangleData0014.coefficient0_461,
  OriginalRow227TriangleData0014.coefficient0_462,
  OriginalRow227TriangleData0014.coefficient0_463,
  OriginalRow227TriangleData0014.coefficient0_464,
  OriginalRow227TriangleData0014.coefficient0_465,
  OriginalRow227TriangleData0014.coefficient0_466,
  OriginalRow227TriangleData0014.coefficient0_467,
  OriginalRow227TriangleData0014.coefficient0_468,
  OriginalRow227TriangleData0014.coefficient0_469,
  OriginalRow227TriangleData0014.coefficient0_470,
  OriginalRow227TriangleData0014.coefficient0_471,
  OriginalRow227TriangleData0014.coefficient0_472,
  OriginalRow227TriangleData0014.coefficient0_473,
  OriginalRow227TriangleData0014.coefficient0_474,
  OriginalRow227TriangleData0014.coefficient0_475,
  OriginalRow227TriangleData0014.coefficient0_476,
  OriginalRow227TriangleData0014.coefficient0_477,
  OriginalRow227TriangleData0014.coefficient0_478,
  OriginalRow227TriangleData0014.coefficient0_479
]

theorem values0014_size : values0014.size = 32 := rfl

def block0014 : ℕ → Option IntervalDyadic := segment 448 values0014

theorem block0014_domain : ExactDomain block0014 448 480 := by
  simpa only [values0014_size] using segment_domain 448 values0014

theorem block0014_get (i : Fin 32) :
    block0014 (448 + i.val) = some (values0014[i.val]'(by rw [values0014_size]; exact i.isLt)) := by
  exact segment_get 448 values0014 ⟨i.val, by rw [values0014_size]; exact i.isLt⟩

def values0015 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0015.coefficient0_480,
  OriginalRow227TriangleData0015.coefficient0_481,
  OriginalRow227TriangleData0015.coefficient0_482,
  OriginalRow227TriangleData0015.coefficient0_483,
  OriginalRow227TriangleData0015.coefficient0_484,
  OriginalRow227TriangleData0015.coefficient0_485,
  OriginalRow227TriangleData0015.coefficient0_486,
  OriginalRow227TriangleData0015.coefficient0_487,
  OriginalRow227TriangleData0015.coefficient0_488,
  OriginalRow227TriangleData0015.coefficient0_489,
  OriginalRow227TriangleData0015.coefficient0_490,
  OriginalRow227TriangleData0015.coefficient0_491,
  OriginalRow227TriangleData0015.coefficient0_492,
  OriginalRow227TriangleData0015.coefficient0_493,
  OriginalRow227TriangleData0015.coefficient0_494,
  OriginalRow227TriangleData0015.coefficient0_495,
  OriginalRow227TriangleData0015.coefficient0_496,
  OriginalRow227TriangleData0015.coefficient0_497,
  OriginalRow227TriangleData0015.coefficient0_498,
  OriginalRow227TriangleData0015.coefficient0_499,
  OriginalRow227TriangleData0015.coefficient0_500,
  OriginalRow227TriangleData0015.coefficient0_501
]

theorem values0015_size : values0015.size = 22 := rfl

def block0015 : ℕ → Option IntervalDyadic := segment 480 values0015

theorem block0015_domain : ExactDomain block0015 480 502 := by
  simpa only [values0015_size] using segment_domain 480 values0015

theorem block0015_get (i : Fin 22) :
    block0015 (480 + i.val) = some (values0015[i.val]'(by rw [values0015_size]; exact i.isLt)) := by
  exact segment_get 480 values0015 ⟨i.val, by rw [values0015_size]; exact i.isLt⟩

def node0000_0064 : ℕ → Option IntervalDyadic := split 32 block0000 block0001

theorem node0000_0064_domain : ExactDomain node0000_0064 0 64 := by
  exact split_domain (by decide) (by decide) block0000_domain block0001_domain

def node0064_0128 : ℕ → Option IntervalDyadic := split 96 block0002 block0003

theorem node0064_0128_domain : ExactDomain node0064_0128 64 128 := by
  exact split_domain (by decide) (by decide) block0002_domain block0003_domain

def node0000_0128 : ℕ → Option IntervalDyadic := split 64 node0000_0064 node0064_0128

theorem node0000_0128_domain : ExactDomain node0000_0128 0 128 := by
  exact split_domain (by decide) (by decide) node0000_0064_domain node0064_0128_domain

def node0128_0192 : ℕ → Option IntervalDyadic := split 160 block0004 block0005

theorem node0128_0192_domain : ExactDomain node0128_0192 128 192 := by
  exact split_domain (by decide) (by decide) block0004_domain block0005_domain

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block0006 block0007

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block0006_domain block0007_domain

def node0128_0256 : ℕ → Option IntervalDyadic := split 192 node0128_0192 node0192_0256

theorem node0128_0256_domain : ExactDomain node0128_0256 128 256 := by
  exact split_domain (by decide) (by decide) node0128_0192_domain node0192_0256_domain

def node0000_0256 : ℕ → Option IntervalDyadic := split 128 node0000_0128 node0128_0256

theorem node0000_0256_domain : ExactDomain node0000_0256 0 256 := by
  exact split_domain (by decide) (by decide) node0000_0128_domain node0128_0256_domain

def node0256_0320 : ℕ → Option IntervalDyadic := split 288 block0008 block0009

theorem node0256_0320_domain : ExactDomain node0256_0320 256 320 := by
  exact split_domain (by decide) (by decide) block0008_domain block0009_domain

def node0320_0384 : ℕ → Option IntervalDyadic := split 352 block0010 block0011

theorem node0320_0384_domain : ExactDomain node0320_0384 320 384 := by
  exact split_domain (by decide) (by decide) block0010_domain block0011_domain

def node0256_0384 : ℕ → Option IntervalDyadic := split 320 node0256_0320 node0320_0384

theorem node0256_0384_domain : ExactDomain node0256_0384 256 384 := by
  exact split_domain (by decide) (by decide) node0256_0320_domain node0320_0384_domain

def node0384_0448 : ℕ → Option IntervalDyadic := split 416 block0012 block0013

theorem node0384_0448_domain : ExactDomain node0384_0448 384 448 := by
  exact split_domain (by decide) (by decide) block0012_domain block0013_domain

def node0448_0502 : ℕ → Option IntervalDyadic := split 480 block0014 block0015

theorem node0448_0502_domain : ExactDomain node0448_0502 448 502 := by
  exact split_domain (by decide) (by decide) block0014_domain block0015_domain

def node0384_0502 : ℕ → Option IntervalDyadic := split 448 node0384_0448 node0448_0502

theorem node0384_0502_domain : ExactDomain node0384_0502 384 502 := by
  exact split_domain (by decide) (by decide) node0384_0448_domain node0448_0502_domain

def node0256_0502 : ℕ → Option IntervalDyadic := split 384 node0256_0384 node0384_0502

theorem node0256_0502_domain : ExactDomain node0256_0502 256 502 := by
  exact split_domain (by decide) (by decide) node0256_0384_domain node0384_0502_domain

def node0000_0502 : ℕ → Option IntervalDyadic := split 256 node0000_0256 node0256_0502

theorem node0000_0502_domain : ExactDomain node0000_0502 0 502 := by
  exact split_domain (by decide) (by decide) node0000_0256_domain node0256_0502_domain

def lookup : ℕ → Option IntervalDyadic := node0000_0502

theorem lookup_domain : ExactDomain lookup 0 502 :=
  node0000_0502_domain

theorem block0000_lookup (i : Fin 32) :
    lookup (0 + i.val) = some (values0000[i.val]'(by rw [values0000_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (0 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_left 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0000_0064, split_left 32 block0000 block0001 (by omega)]
  exact block0000_get i

theorem block0001_lookup (i : Fin 32) :
    lookup (32 + i.val) = some (values0001[i.val]'(by rw [values0001_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (32 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_left 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0000_0064, split_right 32 block0000 block0001 (by omega)]
  exact block0001_get i

theorem block0002_lookup (i : Fin 32) :
    lookup (64 + i.val) = some (values0002[i.val]'(by rw [values0002_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (64 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_right 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0064_0128, split_left 96 block0002 block0003 (by omega)]
  exact block0002_get i

theorem block0003_lookup (i : Fin 32) :
    lookup (96 + i.val) = some (values0003[i.val]'(by rw [values0003_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (96 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_right 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0064_0128, split_right 96 block0002 block0003 (by omega)]
  exact block0003_get i

theorem block0004_lookup (i : Fin 32) :
    lookup (128 + i.val) = some (values0004[i.val]'(by rw [values0004_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (128 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_left 160 block0004 block0005 (by omega)]
  exact block0004_get i

theorem block0005_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values0005[i.val]'(by rw [values0005_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (160 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_right 160 block0004 block0005 (by omega)]
  exact block0005_get i

theorem block0006_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values0006[i.val]'(by rw [values0006_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (192 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block0006 block0007 (by omega)]
  exact block0006_get i

theorem block0007_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values0007[i.val]'(by rw [values0007_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (224 + i.val) = _
  rw [node0000_0502, split_left 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block0006 block0007 (by omega)]
  exact block0007_get i

theorem block0008_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values0008[i.val]'(by rw [values0008_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (256 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_left 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0256_0384, split_left 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0256_0320, split_left 288 block0008 block0009 (by omega)]
  exact block0008_get i

theorem block0009_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values0009[i.val]'(by rw [values0009_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (288 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_left 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0256_0384, split_left 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0256_0320, split_right 288 block0008 block0009 (by omega)]
  exact block0009_get i

theorem block0010_lookup (i : Fin 32) :
    lookup (320 + i.val) = some (values0010[i.val]'(by rw [values0010_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (320 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_left 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0256_0384, split_right 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0320_0384, split_left 352 block0010 block0011 (by omega)]
  exact block0010_get i

theorem block0011_lookup (i : Fin 32) :
    lookup (352 + i.val) = some (values0011[i.val]'(by rw [values0011_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (352 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_left 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0256_0384, split_right 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0320_0384, split_right 352 block0010 block0011 (by omega)]
  exact block0011_get i

theorem block0012_lookup (i : Fin 32) :
    lookup (384 + i.val) = some (values0012[i.val]'(by rw [values0012_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (384 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_right 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0384_0502, split_left 448 node0384_0448 node0448_0502 (by omega)]
  rw [node0384_0448, split_left 416 block0012 block0013 (by omega)]
  exact block0012_get i

theorem block0013_lookup (i : Fin 32) :
    lookup (416 + i.val) = some (values0013[i.val]'(by rw [values0013_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (416 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_right 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0384_0502, split_left 448 node0384_0448 node0448_0502 (by omega)]
  rw [node0384_0448, split_right 416 block0012 block0013 (by omega)]
  exact block0013_get i

theorem block0014_lookup (i : Fin 32) :
    lookup (448 + i.val) = some (values0014[i.val]'(by rw [values0014_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (448 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_right 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0384_0502, split_right 448 node0384_0448 node0448_0502 (by omega)]
  rw [node0448_0502, split_left 480 block0014 block0015 (by omega)]
  exact block0014_get i

theorem block0015_lookup (i : Fin 22) :
    lookup (480 + i.val) = some (values0015[i.val]'(by rw [values0015_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0502 (480 + i.val) = _
  rw [node0000_0502, split_right 256 node0000_0256 node0256_0502 (by omega)]
  rw [node0256_0502, split_right 384 node0256_0384 node0384_0502 (by omega)]
  rw [node0384_0502, split_right 448 node0384_0448 node0448_0502 (by omega)]
  rw [node0448_0502, split_right 480 block0014 block0015 (by omega)]
  exact block0015_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0000_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0000_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0001_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0001_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0002_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0002_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0003_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0003_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0004_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0004_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0005_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0005_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0006_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0006_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0007_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0007_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0008_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0008_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0009_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0009_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0010_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0010_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0011_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0011_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0012_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0012_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0013_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0013_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0014_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0014_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0015_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0015_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0000_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0001_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0002_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0003_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0004_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0005_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0006_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0007_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0008_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0009_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0010_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0011_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0012_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0013_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0014_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow000.block0015_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow000
