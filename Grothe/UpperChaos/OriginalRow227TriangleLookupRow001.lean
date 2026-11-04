import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0016
import Grothe.UpperChaos.OriginalRow227TriangleData0017
import Grothe.UpperChaos.OriginalRow227TriangleData0018
import Grothe.UpperChaos.OriginalRow227TriangleData0019
import Grothe.UpperChaos.OriginalRow227TriangleData0020
import Grothe.UpperChaos.OriginalRow227TriangleData0021
import Grothe.UpperChaos.OriginalRow227TriangleData0022
import Grothe.UpperChaos.OriginalRow227TriangleData0023
import Grothe.UpperChaos.OriginalRow227TriangleData0024
import Grothe.UpperChaos.OriginalRow227TriangleData0025
import Grothe.UpperChaos.OriginalRow227TriangleData0026
import Grothe.UpperChaos.OriginalRow227TriangleData0027
import Grothe.UpperChaos.OriginalRow227TriangleData0028
import Grothe.UpperChaos.OriginalRow227TriangleData0029
import Grothe.UpperChaos.OriginalRow227TriangleData0030
import Grothe.UpperChaos.OriginalRow227TriangleData0031

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow001

open ConditionalTableLookup

def values0016 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0016.coefficient1_0,
  OriginalRow227TriangleData0016.coefficient1_1,
  OriginalRow227TriangleData0016.coefficient1_2,
  OriginalRow227TriangleData0016.coefficient1_3,
  OriginalRow227TriangleData0016.coefficient1_4,
  OriginalRow227TriangleData0016.coefficient1_5,
  OriginalRow227TriangleData0016.coefficient1_6,
  OriginalRow227TriangleData0016.coefficient1_7,
  OriginalRow227TriangleData0016.coefficient1_8,
  OriginalRow227TriangleData0016.coefficient1_9,
  OriginalRow227TriangleData0016.coefficient1_10,
  OriginalRow227TriangleData0016.coefficient1_11,
  OriginalRow227TriangleData0016.coefficient1_12,
  OriginalRow227TriangleData0016.coefficient1_13,
  OriginalRow227TriangleData0016.coefficient1_14,
  OriginalRow227TriangleData0016.coefficient1_15,
  OriginalRow227TriangleData0016.coefficient1_16,
  OriginalRow227TriangleData0016.coefficient1_17,
  OriginalRow227TriangleData0016.coefficient1_18,
  OriginalRow227TriangleData0016.coefficient1_19,
  OriginalRow227TriangleData0016.coefficient1_20,
  OriginalRow227TriangleData0016.coefficient1_21,
  OriginalRow227TriangleData0016.coefficient1_22,
  OriginalRow227TriangleData0016.coefficient1_23,
  OriginalRow227TriangleData0016.coefficient1_24,
  OriginalRow227TriangleData0016.coefficient1_25,
  OriginalRow227TriangleData0016.coefficient1_26,
  OriginalRow227TriangleData0016.coefficient1_27,
  OriginalRow227TriangleData0016.coefficient1_28,
  OriginalRow227TriangleData0016.coefficient1_29,
  OriginalRow227TriangleData0016.coefficient1_30,
  OriginalRow227TriangleData0016.coefficient1_31
]

theorem values0016_size : values0016.size = 32 := rfl

def block0016 : ℕ → Option IntervalDyadic := segment 0 values0016

theorem block0016_domain : ExactDomain block0016 0 32 := by
  simpa only [values0016_size] using segment_domain 0 values0016

theorem block0016_get (i : Fin 32) :
    block0016 (0 + i.val) = some (values0016[i.val]'(by rw [values0016_size]; exact i.isLt)) := by
  exact segment_get 0 values0016 ⟨i.val, by rw [values0016_size]; exact i.isLt⟩

def values0017 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0017.coefficient1_32,
  OriginalRow227TriangleData0017.coefficient1_33,
  OriginalRow227TriangleData0017.coefficient1_34,
  OriginalRow227TriangleData0017.coefficient1_35,
  OriginalRow227TriangleData0017.coefficient1_36,
  OriginalRow227TriangleData0017.coefficient1_37,
  OriginalRow227TriangleData0017.coefficient1_38,
  OriginalRow227TriangleData0017.coefficient1_39,
  OriginalRow227TriangleData0017.coefficient1_40,
  OriginalRow227TriangleData0017.coefficient1_41,
  OriginalRow227TriangleData0017.coefficient1_42,
  OriginalRow227TriangleData0017.coefficient1_43,
  OriginalRow227TriangleData0017.coefficient1_44,
  OriginalRow227TriangleData0017.coefficient1_45,
  OriginalRow227TriangleData0017.coefficient1_46,
  OriginalRow227TriangleData0017.coefficient1_47,
  OriginalRow227TriangleData0017.coefficient1_48,
  OriginalRow227TriangleData0017.coefficient1_49,
  OriginalRow227TriangleData0017.coefficient1_50,
  OriginalRow227TriangleData0017.coefficient1_51,
  OriginalRow227TriangleData0017.coefficient1_52,
  OriginalRow227TriangleData0017.coefficient1_53,
  OriginalRow227TriangleData0017.coefficient1_54,
  OriginalRow227TriangleData0017.coefficient1_55,
  OriginalRow227TriangleData0017.coefficient1_56,
  OriginalRow227TriangleData0017.coefficient1_57,
  OriginalRow227TriangleData0017.coefficient1_58,
  OriginalRow227TriangleData0017.coefficient1_59,
  OriginalRow227TriangleData0017.coefficient1_60,
  OriginalRow227TriangleData0017.coefficient1_61,
  OriginalRow227TriangleData0017.coefficient1_62,
  OriginalRow227TriangleData0017.coefficient1_63
]

theorem values0017_size : values0017.size = 32 := rfl

def block0017 : ℕ → Option IntervalDyadic := segment 32 values0017

theorem block0017_domain : ExactDomain block0017 32 64 := by
  simpa only [values0017_size] using segment_domain 32 values0017

theorem block0017_get (i : Fin 32) :
    block0017 (32 + i.val) = some (values0017[i.val]'(by rw [values0017_size]; exact i.isLt)) := by
  exact segment_get 32 values0017 ⟨i.val, by rw [values0017_size]; exact i.isLt⟩

def values0018 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0018.coefficient1_64,
  OriginalRow227TriangleData0018.coefficient1_65,
  OriginalRow227TriangleData0018.coefficient1_66,
  OriginalRow227TriangleData0018.coefficient1_67,
  OriginalRow227TriangleData0018.coefficient1_68,
  OriginalRow227TriangleData0018.coefficient1_69,
  OriginalRow227TriangleData0018.coefficient1_70,
  OriginalRow227TriangleData0018.coefficient1_71,
  OriginalRow227TriangleData0018.coefficient1_72,
  OriginalRow227TriangleData0018.coefficient1_73,
  OriginalRow227TriangleData0018.coefficient1_74,
  OriginalRow227TriangleData0018.coefficient1_75,
  OriginalRow227TriangleData0018.coefficient1_76,
  OriginalRow227TriangleData0018.coefficient1_77,
  OriginalRow227TriangleData0018.coefficient1_78,
  OriginalRow227TriangleData0018.coefficient1_79,
  OriginalRow227TriangleData0018.coefficient1_80,
  OriginalRow227TriangleData0018.coefficient1_81,
  OriginalRow227TriangleData0018.coefficient1_82,
  OriginalRow227TriangleData0018.coefficient1_83,
  OriginalRow227TriangleData0018.coefficient1_84,
  OriginalRow227TriangleData0018.coefficient1_85,
  OriginalRow227TriangleData0018.coefficient1_86,
  OriginalRow227TriangleData0018.coefficient1_87,
  OriginalRow227TriangleData0018.coefficient1_88,
  OriginalRow227TriangleData0018.coefficient1_89,
  OriginalRow227TriangleData0018.coefficient1_90,
  OriginalRow227TriangleData0018.coefficient1_91,
  OriginalRow227TriangleData0018.coefficient1_92,
  OriginalRow227TriangleData0018.coefficient1_93,
  OriginalRow227TriangleData0018.coefficient1_94,
  OriginalRow227TriangleData0018.coefficient1_95
]

theorem values0018_size : values0018.size = 32 := rfl

def block0018 : ℕ → Option IntervalDyadic := segment 64 values0018

theorem block0018_domain : ExactDomain block0018 64 96 := by
  simpa only [values0018_size] using segment_domain 64 values0018

theorem block0018_get (i : Fin 32) :
    block0018 (64 + i.val) = some (values0018[i.val]'(by rw [values0018_size]; exact i.isLt)) := by
  exact segment_get 64 values0018 ⟨i.val, by rw [values0018_size]; exact i.isLt⟩

def values0019 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0019.coefficient1_96,
  OriginalRow227TriangleData0019.coefficient1_97,
  OriginalRow227TriangleData0019.coefficient1_98,
  OriginalRow227TriangleData0019.coefficient1_99,
  OriginalRow227TriangleData0019.coefficient1_100,
  OriginalRow227TriangleData0019.coefficient1_101,
  OriginalRow227TriangleData0019.coefficient1_102,
  OriginalRow227TriangleData0019.coefficient1_103,
  OriginalRow227TriangleData0019.coefficient1_104,
  OriginalRow227TriangleData0019.coefficient1_105,
  OriginalRow227TriangleData0019.coefficient1_106,
  OriginalRow227TriangleData0019.coefficient1_107,
  OriginalRow227TriangleData0019.coefficient1_108,
  OriginalRow227TriangleData0019.coefficient1_109,
  OriginalRow227TriangleData0019.coefficient1_110,
  OriginalRow227TriangleData0019.coefficient1_111,
  OriginalRow227TriangleData0019.coefficient1_112,
  OriginalRow227TriangleData0019.coefficient1_113,
  OriginalRow227TriangleData0019.coefficient1_114,
  OriginalRow227TriangleData0019.coefficient1_115,
  OriginalRow227TriangleData0019.coefficient1_116,
  OriginalRow227TriangleData0019.coefficient1_117,
  OriginalRow227TriangleData0019.coefficient1_118,
  OriginalRow227TriangleData0019.coefficient1_119,
  OriginalRow227TriangleData0019.coefficient1_120,
  OriginalRow227TriangleData0019.coefficient1_121,
  OriginalRow227TriangleData0019.coefficient1_122,
  OriginalRow227TriangleData0019.coefficient1_123,
  OriginalRow227TriangleData0019.coefficient1_124,
  OriginalRow227TriangleData0019.coefficient1_125,
  OriginalRow227TriangleData0019.coefficient1_126,
  OriginalRow227TriangleData0019.coefficient1_127
]

theorem values0019_size : values0019.size = 32 := rfl

def block0019 : ℕ → Option IntervalDyadic := segment 96 values0019

theorem block0019_domain : ExactDomain block0019 96 128 := by
  simpa only [values0019_size] using segment_domain 96 values0019

theorem block0019_get (i : Fin 32) :
    block0019 (96 + i.val) = some (values0019[i.val]'(by rw [values0019_size]; exact i.isLt)) := by
  exact segment_get 96 values0019 ⟨i.val, by rw [values0019_size]; exact i.isLt⟩

def values0020 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0020.coefficient1_128,
  OriginalRow227TriangleData0020.coefficient1_129,
  OriginalRow227TriangleData0020.coefficient1_130,
  OriginalRow227TriangleData0020.coefficient1_131,
  OriginalRow227TriangleData0020.coefficient1_132,
  OriginalRow227TriangleData0020.coefficient1_133,
  OriginalRow227TriangleData0020.coefficient1_134,
  OriginalRow227TriangleData0020.coefficient1_135,
  OriginalRow227TriangleData0020.coefficient1_136,
  OriginalRow227TriangleData0020.coefficient1_137,
  OriginalRow227TriangleData0020.coefficient1_138,
  OriginalRow227TriangleData0020.coefficient1_139,
  OriginalRow227TriangleData0020.coefficient1_140,
  OriginalRow227TriangleData0020.coefficient1_141,
  OriginalRow227TriangleData0020.coefficient1_142,
  OriginalRow227TriangleData0020.coefficient1_143,
  OriginalRow227TriangleData0020.coefficient1_144,
  OriginalRow227TriangleData0020.coefficient1_145,
  OriginalRow227TriangleData0020.coefficient1_146,
  OriginalRow227TriangleData0020.coefficient1_147,
  OriginalRow227TriangleData0020.coefficient1_148,
  OriginalRow227TriangleData0020.coefficient1_149,
  OriginalRow227TriangleData0020.coefficient1_150,
  OriginalRow227TriangleData0020.coefficient1_151,
  OriginalRow227TriangleData0020.coefficient1_152,
  OriginalRow227TriangleData0020.coefficient1_153,
  OriginalRow227TriangleData0020.coefficient1_154,
  OriginalRow227TriangleData0020.coefficient1_155,
  OriginalRow227TriangleData0020.coefficient1_156,
  OriginalRow227TriangleData0020.coefficient1_157,
  OriginalRow227TriangleData0020.coefficient1_158,
  OriginalRow227TriangleData0020.coefficient1_159
]

theorem values0020_size : values0020.size = 32 := rfl

def block0020 : ℕ → Option IntervalDyadic := segment 128 values0020

theorem block0020_domain : ExactDomain block0020 128 160 := by
  simpa only [values0020_size] using segment_domain 128 values0020

theorem block0020_get (i : Fin 32) :
    block0020 (128 + i.val) = some (values0020[i.val]'(by rw [values0020_size]; exact i.isLt)) := by
  exact segment_get 128 values0020 ⟨i.val, by rw [values0020_size]; exact i.isLt⟩

def values0021 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0021.coefficient1_160,
  OriginalRow227TriangleData0021.coefficient1_161,
  OriginalRow227TriangleData0021.coefficient1_162,
  OriginalRow227TriangleData0021.coefficient1_163,
  OriginalRow227TriangleData0021.coefficient1_164,
  OriginalRow227TriangleData0021.coefficient1_165,
  OriginalRow227TriangleData0021.coefficient1_166,
  OriginalRow227TriangleData0021.coefficient1_167,
  OriginalRow227TriangleData0021.coefficient1_168,
  OriginalRow227TriangleData0021.coefficient1_169,
  OriginalRow227TriangleData0021.coefficient1_170,
  OriginalRow227TriangleData0021.coefficient1_171,
  OriginalRow227TriangleData0021.coefficient1_172,
  OriginalRow227TriangleData0021.coefficient1_173,
  OriginalRow227TriangleData0021.coefficient1_174,
  OriginalRow227TriangleData0021.coefficient1_175,
  OriginalRow227TriangleData0021.coefficient1_176,
  OriginalRow227TriangleData0021.coefficient1_177,
  OriginalRow227TriangleData0021.coefficient1_178,
  OriginalRow227TriangleData0021.coefficient1_179,
  OriginalRow227TriangleData0021.coefficient1_180,
  OriginalRow227TriangleData0021.coefficient1_181,
  OriginalRow227TriangleData0021.coefficient1_182,
  OriginalRow227TriangleData0021.coefficient1_183,
  OriginalRow227TriangleData0021.coefficient1_184,
  OriginalRow227TriangleData0021.coefficient1_185,
  OriginalRow227TriangleData0021.coefficient1_186,
  OriginalRow227TriangleData0021.coefficient1_187,
  OriginalRow227TriangleData0021.coefficient1_188,
  OriginalRow227TriangleData0021.coefficient1_189,
  OriginalRow227TriangleData0021.coefficient1_190,
  OriginalRow227TriangleData0021.coefficient1_191
]

theorem values0021_size : values0021.size = 32 := rfl

def block0021 : ℕ → Option IntervalDyadic := segment 160 values0021

theorem block0021_domain : ExactDomain block0021 160 192 := by
  simpa only [values0021_size] using segment_domain 160 values0021

theorem block0021_get (i : Fin 32) :
    block0021 (160 + i.val) = some (values0021[i.val]'(by rw [values0021_size]; exact i.isLt)) := by
  exact segment_get 160 values0021 ⟨i.val, by rw [values0021_size]; exact i.isLt⟩

def values0022 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0022.coefficient1_192,
  OriginalRow227TriangleData0022.coefficient1_193,
  OriginalRow227TriangleData0022.coefficient1_194,
  OriginalRow227TriangleData0022.coefficient1_195,
  OriginalRow227TriangleData0022.coefficient1_196,
  OriginalRow227TriangleData0022.coefficient1_197,
  OriginalRow227TriangleData0022.coefficient1_198,
  OriginalRow227TriangleData0022.coefficient1_199,
  OriginalRow227TriangleData0022.coefficient1_200,
  OriginalRow227TriangleData0022.coefficient1_201,
  OriginalRow227TriangleData0022.coefficient1_202,
  OriginalRow227TriangleData0022.coefficient1_203,
  OriginalRow227TriangleData0022.coefficient1_204,
  OriginalRow227TriangleData0022.coefficient1_205,
  OriginalRow227TriangleData0022.coefficient1_206,
  OriginalRow227TriangleData0022.coefficient1_207,
  OriginalRow227TriangleData0022.coefficient1_208,
  OriginalRow227TriangleData0022.coefficient1_209,
  OriginalRow227TriangleData0022.coefficient1_210,
  OriginalRow227TriangleData0022.coefficient1_211,
  OriginalRow227TriangleData0022.coefficient1_212,
  OriginalRow227TriangleData0022.coefficient1_213,
  OriginalRow227TriangleData0022.coefficient1_214,
  OriginalRow227TriangleData0022.coefficient1_215,
  OriginalRow227TriangleData0022.coefficient1_216,
  OriginalRow227TriangleData0022.coefficient1_217,
  OriginalRow227TriangleData0022.coefficient1_218,
  OriginalRow227TriangleData0022.coefficient1_219,
  OriginalRow227TriangleData0022.coefficient1_220,
  OriginalRow227TriangleData0022.coefficient1_221,
  OriginalRow227TriangleData0022.coefficient1_222,
  OriginalRow227TriangleData0022.coefficient1_223
]

theorem values0022_size : values0022.size = 32 := rfl

def block0022 : ℕ → Option IntervalDyadic := segment 192 values0022

theorem block0022_domain : ExactDomain block0022 192 224 := by
  simpa only [values0022_size] using segment_domain 192 values0022

theorem block0022_get (i : Fin 32) :
    block0022 (192 + i.val) = some (values0022[i.val]'(by rw [values0022_size]; exact i.isLt)) := by
  exact segment_get 192 values0022 ⟨i.val, by rw [values0022_size]; exact i.isLt⟩

def values0023 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0023.coefficient1_224,
  OriginalRow227TriangleData0023.coefficient1_225,
  OriginalRow227TriangleData0023.coefficient1_226,
  OriginalRow227TriangleData0023.coefficient1_227,
  OriginalRow227TriangleData0023.coefficient1_228,
  OriginalRow227TriangleData0023.coefficient1_229,
  OriginalRow227TriangleData0023.coefficient1_230,
  OriginalRow227TriangleData0023.coefficient1_231,
  OriginalRow227TriangleData0023.coefficient1_232,
  OriginalRow227TriangleData0023.coefficient1_233,
  OriginalRow227TriangleData0023.coefficient1_234,
  OriginalRow227TriangleData0023.coefficient1_235,
  OriginalRow227TriangleData0023.coefficient1_236,
  OriginalRow227TriangleData0023.coefficient1_237,
  OriginalRow227TriangleData0023.coefficient1_238,
  OriginalRow227TriangleData0023.coefficient1_239,
  OriginalRow227TriangleData0023.coefficient1_240,
  OriginalRow227TriangleData0023.coefficient1_241,
  OriginalRow227TriangleData0023.coefficient1_242,
  OriginalRow227TriangleData0023.coefficient1_243,
  OriginalRow227TriangleData0023.coefficient1_244,
  OriginalRow227TriangleData0023.coefficient1_245,
  OriginalRow227TriangleData0023.coefficient1_246,
  OriginalRow227TriangleData0023.coefficient1_247,
  OriginalRow227TriangleData0023.coefficient1_248,
  OriginalRow227TriangleData0023.coefficient1_249,
  OriginalRow227TriangleData0023.coefficient1_250,
  OriginalRow227TriangleData0023.coefficient1_251,
  OriginalRow227TriangleData0023.coefficient1_252,
  OriginalRow227TriangleData0023.coefficient1_253,
  OriginalRow227TriangleData0023.coefficient1_254,
  OriginalRow227TriangleData0023.coefficient1_255
]

theorem values0023_size : values0023.size = 32 := rfl

def block0023 : ℕ → Option IntervalDyadic := segment 224 values0023

theorem block0023_domain : ExactDomain block0023 224 256 := by
  simpa only [values0023_size] using segment_domain 224 values0023

theorem block0023_get (i : Fin 32) :
    block0023 (224 + i.val) = some (values0023[i.val]'(by rw [values0023_size]; exact i.isLt)) := by
  exact segment_get 224 values0023 ⟨i.val, by rw [values0023_size]; exact i.isLt⟩

def values0024 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0024.coefficient1_256,
  OriginalRow227TriangleData0024.coefficient1_257,
  OriginalRow227TriangleData0024.coefficient1_258,
  OriginalRow227TriangleData0024.coefficient1_259,
  OriginalRow227TriangleData0024.coefficient1_260,
  OriginalRow227TriangleData0024.coefficient1_261,
  OriginalRow227TriangleData0024.coefficient1_262,
  OriginalRow227TriangleData0024.coefficient1_263,
  OriginalRow227TriangleData0024.coefficient1_264,
  OriginalRow227TriangleData0024.coefficient1_265,
  OriginalRow227TriangleData0024.coefficient1_266,
  OriginalRow227TriangleData0024.coefficient1_267,
  OriginalRow227TriangleData0024.coefficient1_268,
  OriginalRow227TriangleData0024.coefficient1_269,
  OriginalRow227TriangleData0024.coefficient1_270,
  OriginalRow227TriangleData0024.coefficient1_271,
  OriginalRow227TriangleData0024.coefficient1_272,
  OriginalRow227TriangleData0024.coefficient1_273,
  OriginalRow227TriangleData0024.coefficient1_274,
  OriginalRow227TriangleData0024.coefficient1_275,
  OriginalRow227TriangleData0024.coefficient1_276,
  OriginalRow227TriangleData0024.coefficient1_277,
  OriginalRow227TriangleData0024.coefficient1_278,
  OriginalRow227TriangleData0024.coefficient1_279,
  OriginalRow227TriangleData0024.coefficient1_280,
  OriginalRow227TriangleData0024.coefficient1_281,
  OriginalRow227TriangleData0024.coefficient1_282,
  OriginalRow227TriangleData0024.coefficient1_283,
  OriginalRow227TriangleData0024.coefficient1_284,
  OriginalRow227TriangleData0024.coefficient1_285,
  OriginalRow227TriangleData0024.coefficient1_286,
  OriginalRow227TriangleData0024.coefficient1_287
]

theorem values0024_size : values0024.size = 32 := rfl

def block0024 : ℕ → Option IntervalDyadic := segment 256 values0024

theorem block0024_domain : ExactDomain block0024 256 288 := by
  simpa only [values0024_size] using segment_domain 256 values0024

theorem block0024_get (i : Fin 32) :
    block0024 (256 + i.val) = some (values0024[i.val]'(by rw [values0024_size]; exact i.isLt)) := by
  exact segment_get 256 values0024 ⟨i.val, by rw [values0024_size]; exact i.isLt⟩

def values0025 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0025.coefficient1_288,
  OriginalRow227TriangleData0025.coefficient1_289,
  OriginalRow227TriangleData0025.coefficient1_290,
  OriginalRow227TriangleData0025.coefficient1_291,
  OriginalRow227TriangleData0025.coefficient1_292,
  OriginalRow227TriangleData0025.coefficient1_293,
  OriginalRow227TriangleData0025.coefficient1_294,
  OriginalRow227TriangleData0025.coefficient1_295,
  OriginalRow227TriangleData0025.coefficient1_296,
  OriginalRow227TriangleData0025.coefficient1_297,
  OriginalRow227TriangleData0025.coefficient1_298,
  OriginalRow227TriangleData0025.coefficient1_299,
  OriginalRow227TriangleData0025.coefficient1_300,
  OriginalRow227TriangleData0025.coefficient1_301,
  OriginalRow227TriangleData0025.coefficient1_302,
  OriginalRow227TriangleData0025.coefficient1_303,
  OriginalRow227TriangleData0025.coefficient1_304,
  OriginalRow227TriangleData0025.coefficient1_305,
  OriginalRow227TriangleData0025.coefficient1_306,
  OriginalRow227TriangleData0025.coefficient1_307,
  OriginalRow227TriangleData0025.coefficient1_308,
  OriginalRow227TriangleData0025.coefficient1_309,
  OriginalRow227TriangleData0025.coefficient1_310,
  OriginalRow227TriangleData0025.coefficient1_311,
  OriginalRow227TriangleData0025.coefficient1_312,
  OriginalRow227TriangleData0025.coefficient1_313,
  OriginalRow227TriangleData0025.coefficient1_314,
  OriginalRow227TriangleData0025.coefficient1_315,
  OriginalRow227TriangleData0025.coefficient1_316,
  OriginalRow227TriangleData0025.coefficient1_317,
  OriginalRow227TriangleData0025.coefficient1_318,
  OriginalRow227TriangleData0025.coefficient1_319
]

theorem values0025_size : values0025.size = 32 := rfl

def block0025 : ℕ → Option IntervalDyadic := segment 288 values0025

theorem block0025_domain : ExactDomain block0025 288 320 := by
  simpa only [values0025_size] using segment_domain 288 values0025

theorem block0025_get (i : Fin 32) :
    block0025 (288 + i.val) = some (values0025[i.val]'(by rw [values0025_size]; exact i.isLt)) := by
  exact segment_get 288 values0025 ⟨i.val, by rw [values0025_size]; exact i.isLt⟩

def values0026 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0026.coefficient1_320,
  OriginalRow227TriangleData0026.coefficient1_321,
  OriginalRow227TriangleData0026.coefficient1_322,
  OriginalRow227TriangleData0026.coefficient1_323,
  OriginalRow227TriangleData0026.coefficient1_324,
  OriginalRow227TriangleData0026.coefficient1_325,
  OriginalRow227TriangleData0026.coefficient1_326,
  OriginalRow227TriangleData0026.coefficient1_327,
  OriginalRow227TriangleData0026.coefficient1_328,
  OriginalRow227TriangleData0026.coefficient1_329,
  OriginalRow227TriangleData0026.coefficient1_330,
  OriginalRow227TriangleData0026.coefficient1_331,
  OriginalRow227TriangleData0026.coefficient1_332,
  OriginalRow227TriangleData0026.coefficient1_333,
  OriginalRow227TriangleData0026.coefficient1_334,
  OriginalRow227TriangleData0026.coefficient1_335,
  OriginalRow227TriangleData0026.coefficient1_336,
  OriginalRow227TriangleData0026.coefficient1_337,
  OriginalRow227TriangleData0026.coefficient1_338,
  OriginalRow227TriangleData0026.coefficient1_339,
  OriginalRow227TriangleData0026.coefficient1_340,
  OriginalRow227TriangleData0026.coefficient1_341,
  OriginalRow227TriangleData0026.coefficient1_342,
  OriginalRow227TriangleData0026.coefficient1_343,
  OriginalRow227TriangleData0026.coefficient1_344,
  OriginalRow227TriangleData0026.coefficient1_345,
  OriginalRow227TriangleData0026.coefficient1_346,
  OriginalRow227TriangleData0026.coefficient1_347,
  OriginalRow227TriangleData0026.coefficient1_348,
  OriginalRow227TriangleData0026.coefficient1_349,
  OriginalRow227TriangleData0026.coefficient1_350,
  OriginalRow227TriangleData0026.coefficient1_351
]

theorem values0026_size : values0026.size = 32 := rfl

def block0026 : ℕ → Option IntervalDyadic := segment 320 values0026

theorem block0026_domain : ExactDomain block0026 320 352 := by
  simpa only [values0026_size] using segment_domain 320 values0026

theorem block0026_get (i : Fin 32) :
    block0026 (320 + i.val) = some (values0026[i.val]'(by rw [values0026_size]; exact i.isLt)) := by
  exact segment_get 320 values0026 ⟨i.val, by rw [values0026_size]; exact i.isLt⟩

def values0027 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0027.coefficient1_352,
  OriginalRow227TriangleData0027.coefficient1_353,
  OriginalRow227TriangleData0027.coefficient1_354,
  OriginalRow227TriangleData0027.coefficient1_355,
  OriginalRow227TriangleData0027.coefficient1_356,
  OriginalRow227TriangleData0027.coefficient1_357,
  OriginalRow227TriangleData0027.coefficient1_358,
  OriginalRow227TriangleData0027.coefficient1_359,
  OriginalRow227TriangleData0027.coefficient1_360,
  OriginalRow227TriangleData0027.coefficient1_361,
  OriginalRow227TriangleData0027.coefficient1_362,
  OriginalRow227TriangleData0027.coefficient1_363,
  OriginalRow227TriangleData0027.coefficient1_364,
  OriginalRow227TriangleData0027.coefficient1_365,
  OriginalRow227TriangleData0027.coefficient1_366,
  OriginalRow227TriangleData0027.coefficient1_367,
  OriginalRow227TriangleData0027.coefficient1_368,
  OriginalRow227TriangleData0027.coefficient1_369,
  OriginalRow227TriangleData0027.coefficient1_370,
  OriginalRow227TriangleData0027.coefficient1_371,
  OriginalRow227TriangleData0027.coefficient1_372,
  OriginalRow227TriangleData0027.coefficient1_373,
  OriginalRow227TriangleData0027.coefficient1_374,
  OriginalRow227TriangleData0027.coefficient1_375,
  OriginalRow227TriangleData0027.coefficient1_376,
  OriginalRow227TriangleData0027.coefficient1_377,
  OriginalRow227TriangleData0027.coefficient1_378,
  OriginalRow227TriangleData0027.coefficient1_379,
  OriginalRow227TriangleData0027.coefficient1_380,
  OriginalRow227TriangleData0027.coefficient1_381,
  OriginalRow227TriangleData0027.coefficient1_382,
  OriginalRow227TriangleData0027.coefficient1_383
]

theorem values0027_size : values0027.size = 32 := rfl

def block0027 : ℕ → Option IntervalDyadic := segment 352 values0027

theorem block0027_domain : ExactDomain block0027 352 384 := by
  simpa only [values0027_size] using segment_domain 352 values0027

theorem block0027_get (i : Fin 32) :
    block0027 (352 + i.val) = some (values0027[i.val]'(by rw [values0027_size]; exact i.isLt)) := by
  exact segment_get 352 values0027 ⟨i.val, by rw [values0027_size]; exact i.isLt⟩

def values0028 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0028.coefficient1_384,
  OriginalRow227TriangleData0028.coefficient1_385,
  OriginalRow227TriangleData0028.coefficient1_386,
  OriginalRow227TriangleData0028.coefficient1_387,
  OriginalRow227TriangleData0028.coefficient1_388,
  OriginalRow227TriangleData0028.coefficient1_389,
  OriginalRow227TriangleData0028.coefficient1_390,
  OriginalRow227TriangleData0028.coefficient1_391,
  OriginalRow227TriangleData0028.coefficient1_392,
  OriginalRow227TriangleData0028.coefficient1_393,
  OriginalRow227TriangleData0028.coefficient1_394,
  OriginalRow227TriangleData0028.coefficient1_395,
  OriginalRow227TriangleData0028.coefficient1_396,
  OriginalRow227TriangleData0028.coefficient1_397,
  OriginalRow227TriangleData0028.coefficient1_398,
  OriginalRow227TriangleData0028.coefficient1_399,
  OriginalRow227TriangleData0028.coefficient1_400,
  OriginalRow227TriangleData0028.coefficient1_401,
  OriginalRow227TriangleData0028.coefficient1_402,
  OriginalRow227TriangleData0028.coefficient1_403,
  OriginalRow227TriangleData0028.coefficient1_404,
  OriginalRow227TriangleData0028.coefficient1_405,
  OriginalRow227TriangleData0028.coefficient1_406,
  OriginalRow227TriangleData0028.coefficient1_407,
  OriginalRow227TriangleData0028.coefficient1_408,
  OriginalRow227TriangleData0028.coefficient1_409,
  OriginalRow227TriangleData0028.coefficient1_410,
  OriginalRow227TriangleData0028.coefficient1_411,
  OriginalRow227TriangleData0028.coefficient1_412,
  OriginalRow227TriangleData0028.coefficient1_413,
  OriginalRow227TriangleData0028.coefficient1_414,
  OriginalRow227TriangleData0028.coefficient1_415
]

theorem values0028_size : values0028.size = 32 := rfl

def block0028 : ℕ → Option IntervalDyadic := segment 384 values0028

theorem block0028_domain : ExactDomain block0028 384 416 := by
  simpa only [values0028_size] using segment_domain 384 values0028

theorem block0028_get (i : Fin 32) :
    block0028 (384 + i.val) = some (values0028[i.val]'(by rw [values0028_size]; exact i.isLt)) := by
  exact segment_get 384 values0028 ⟨i.val, by rw [values0028_size]; exact i.isLt⟩

def values0029 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0029.coefficient1_416,
  OriginalRow227TriangleData0029.coefficient1_417,
  OriginalRow227TriangleData0029.coefficient1_418,
  OriginalRow227TriangleData0029.coefficient1_419,
  OriginalRow227TriangleData0029.coefficient1_420,
  OriginalRow227TriangleData0029.coefficient1_421,
  OriginalRow227TriangleData0029.coefficient1_422,
  OriginalRow227TriangleData0029.coefficient1_423,
  OriginalRow227TriangleData0029.coefficient1_424,
  OriginalRow227TriangleData0029.coefficient1_425,
  OriginalRow227TriangleData0029.coefficient1_426,
  OriginalRow227TriangleData0029.coefficient1_427,
  OriginalRow227TriangleData0029.coefficient1_428,
  OriginalRow227TriangleData0029.coefficient1_429,
  OriginalRow227TriangleData0029.coefficient1_430,
  OriginalRow227TriangleData0029.coefficient1_431,
  OriginalRow227TriangleData0029.coefficient1_432,
  OriginalRow227TriangleData0029.coefficient1_433,
  OriginalRow227TriangleData0029.coefficient1_434,
  OriginalRow227TriangleData0029.coefficient1_435,
  OriginalRow227TriangleData0029.coefficient1_436,
  OriginalRow227TriangleData0029.coefficient1_437,
  OriginalRow227TriangleData0029.coefficient1_438,
  OriginalRow227TriangleData0029.coefficient1_439,
  OriginalRow227TriangleData0029.coefficient1_440,
  OriginalRow227TriangleData0029.coefficient1_441,
  OriginalRow227TriangleData0029.coefficient1_442,
  OriginalRow227TriangleData0029.coefficient1_443,
  OriginalRow227TriangleData0029.coefficient1_444,
  OriginalRow227TriangleData0029.coefficient1_445,
  OriginalRow227TriangleData0029.coefficient1_446,
  OriginalRow227TriangleData0029.coefficient1_447
]

theorem values0029_size : values0029.size = 32 := rfl

def block0029 : ℕ → Option IntervalDyadic := segment 416 values0029

theorem block0029_domain : ExactDomain block0029 416 448 := by
  simpa only [values0029_size] using segment_domain 416 values0029

theorem block0029_get (i : Fin 32) :
    block0029 (416 + i.val) = some (values0029[i.val]'(by rw [values0029_size]; exact i.isLt)) := by
  exact segment_get 416 values0029 ⟨i.val, by rw [values0029_size]; exact i.isLt⟩

def values0030 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0030.coefficient1_448,
  OriginalRow227TriangleData0030.coefficient1_449,
  OriginalRow227TriangleData0030.coefficient1_450,
  OriginalRow227TriangleData0030.coefficient1_451,
  OriginalRow227TriangleData0030.coefficient1_452,
  OriginalRow227TriangleData0030.coefficient1_453,
  OriginalRow227TriangleData0030.coefficient1_454,
  OriginalRow227TriangleData0030.coefficient1_455,
  OriginalRow227TriangleData0030.coefficient1_456,
  OriginalRow227TriangleData0030.coefficient1_457,
  OriginalRow227TriangleData0030.coefficient1_458,
  OriginalRow227TriangleData0030.coefficient1_459,
  OriginalRow227TriangleData0030.coefficient1_460,
  OriginalRow227TriangleData0030.coefficient1_461,
  OriginalRow227TriangleData0030.coefficient1_462,
  OriginalRow227TriangleData0030.coefficient1_463,
  OriginalRow227TriangleData0030.coefficient1_464,
  OriginalRow227TriangleData0030.coefficient1_465,
  OriginalRow227TriangleData0030.coefficient1_466,
  OriginalRow227TriangleData0030.coefficient1_467,
  OriginalRow227TriangleData0030.coefficient1_468,
  OriginalRow227TriangleData0030.coefficient1_469,
  OriginalRow227TriangleData0030.coefficient1_470,
  OriginalRow227TriangleData0030.coefficient1_471,
  OriginalRow227TriangleData0030.coefficient1_472,
  OriginalRow227TriangleData0030.coefficient1_473,
  OriginalRow227TriangleData0030.coefficient1_474,
  OriginalRow227TriangleData0030.coefficient1_475,
  OriginalRow227TriangleData0030.coefficient1_476,
  OriginalRow227TriangleData0030.coefficient1_477,
  OriginalRow227TriangleData0030.coefficient1_478,
  OriginalRow227TriangleData0030.coefficient1_479
]

theorem values0030_size : values0030.size = 32 := rfl

def block0030 : ℕ → Option IntervalDyadic := segment 448 values0030

theorem block0030_domain : ExactDomain block0030 448 480 := by
  simpa only [values0030_size] using segment_domain 448 values0030

theorem block0030_get (i : Fin 32) :
    block0030 (448 + i.val) = some (values0030[i.val]'(by rw [values0030_size]; exact i.isLt)) := by
  exact segment_get 448 values0030 ⟨i.val, by rw [values0030_size]; exact i.isLt⟩

def values0031 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0031.coefficient1_480,
  OriginalRow227TriangleData0031.coefficient1_481,
  OriginalRow227TriangleData0031.coefficient1_482,
  OriginalRow227TriangleData0031.coefficient1_483,
  OriginalRow227TriangleData0031.coefficient1_484,
  OriginalRow227TriangleData0031.coefficient1_485,
  OriginalRow227TriangleData0031.coefficient1_486,
  OriginalRow227TriangleData0031.coefficient1_487,
  OriginalRow227TriangleData0031.coefficient1_488,
  OriginalRow227TriangleData0031.coefficient1_489,
  OriginalRow227TriangleData0031.coefficient1_490,
  OriginalRow227TriangleData0031.coefficient1_491,
  OriginalRow227TriangleData0031.coefficient1_492,
  OriginalRow227TriangleData0031.coefficient1_493,
  OriginalRow227TriangleData0031.coefficient1_494,
  OriginalRow227TriangleData0031.coefficient1_495,
  OriginalRow227TriangleData0031.coefficient1_496,
  OriginalRow227TriangleData0031.coefficient1_497,
  OriginalRow227TriangleData0031.coefficient1_498,
  OriginalRow227TriangleData0031.coefficient1_499,
  OriginalRow227TriangleData0031.coefficient1_500
]

theorem values0031_size : values0031.size = 21 := rfl

def block0031 : ℕ → Option IntervalDyadic := segment 480 values0031

theorem block0031_domain : ExactDomain block0031 480 501 := by
  simpa only [values0031_size] using segment_domain 480 values0031

theorem block0031_get (i : Fin 21) :
    block0031 (480 + i.val) = some (values0031[i.val]'(by rw [values0031_size]; exact i.isLt)) := by
  exact segment_get 480 values0031 ⟨i.val, by rw [values0031_size]; exact i.isLt⟩

def node0000_0064 : ℕ → Option IntervalDyadic := split 32 block0016 block0017

theorem node0000_0064_domain : ExactDomain node0000_0064 0 64 := by
  exact split_domain (by decide) (by decide) block0016_domain block0017_domain

def node0064_0128 : ℕ → Option IntervalDyadic := split 96 block0018 block0019

theorem node0064_0128_domain : ExactDomain node0064_0128 64 128 := by
  exact split_domain (by decide) (by decide) block0018_domain block0019_domain

def node0000_0128 : ℕ → Option IntervalDyadic := split 64 node0000_0064 node0064_0128

theorem node0000_0128_domain : ExactDomain node0000_0128 0 128 := by
  exact split_domain (by decide) (by decide) node0000_0064_domain node0064_0128_domain

def node0128_0192 : ℕ → Option IntervalDyadic := split 160 block0020 block0021

theorem node0128_0192_domain : ExactDomain node0128_0192 128 192 := by
  exact split_domain (by decide) (by decide) block0020_domain block0021_domain

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block0022 block0023

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block0022_domain block0023_domain

def node0128_0256 : ℕ → Option IntervalDyadic := split 192 node0128_0192 node0192_0256

theorem node0128_0256_domain : ExactDomain node0128_0256 128 256 := by
  exact split_domain (by decide) (by decide) node0128_0192_domain node0192_0256_domain

def node0000_0256 : ℕ → Option IntervalDyadic := split 128 node0000_0128 node0128_0256

theorem node0000_0256_domain : ExactDomain node0000_0256 0 256 := by
  exact split_domain (by decide) (by decide) node0000_0128_domain node0128_0256_domain

def node0256_0320 : ℕ → Option IntervalDyadic := split 288 block0024 block0025

theorem node0256_0320_domain : ExactDomain node0256_0320 256 320 := by
  exact split_domain (by decide) (by decide) block0024_domain block0025_domain

def node0320_0384 : ℕ → Option IntervalDyadic := split 352 block0026 block0027

theorem node0320_0384_domain : ExactDomain node0320_0384 320 384 := by
  exact split_domain (by decide) (by decide) block0026_domain block0027_domain

def node0256_0384 : ℕ → Option IntervalDyadic := split 320 node0256_0320 node0320_0384

theorem node0256_0384_domain : ExactDomain node0256_0384 256 384 := by
  exact split_domain (by decide) (by decide) node0256_0320_domain node0320_0384_domain

def node0384_0448 : ℕ → Option IntervalDyadic := split 416 block0028 block0029

theorem node0384_0448_domain : ExactDomain node0384_0448 384 448 := by
  exact split_domain (by decide) (by decide) block0028_domain block0029_domain

def node0448_0501 : ℕ → Option IntervalDyadic := split 480 block0030 block0031

theorem node0448_0501_domain : ExactDomain node0448_0501 448 501 := by
  exact split_domain (by decide) (by decide) block0030_domain block0031_domain

def node0384_0501 : ℕ → Option IntervalDyadic := split 448 node0384_0448 node0448_0501

theorem node0384_0501_domain : ExactDomain node0384_0501 384 501 := by
  exact split_domain (by decide) (by decide) node0384_0448_domain node0448_0501_domain

def node0256_0501 : ℕ → Option IntervalDyadic := split 384 node0256_0384 node0384_0501

theorem node0256_0501_domain : ExactDomain node0256_0501 256 501 := by
  exact split_domain (by decide) (by decide) node0256_0384_domain node0384_0501_domain

def node0000_0501 : ℕ → Option IntervalDyadic := split 256 node0000_0256 node0256_0501

theorem node0000_0501_domain : ExactDomain node0000_0501 0 501 := by
  exact split_domain (by decide) (by decide) node0000_0256_domain node0256_0501_domain

def lookup : ℕ → Option IntervalDyadic := node0000_0501

theorem lookup_domain : ExactDomain lookup 0 501 :=
  node0000_0501_domain

theorem block0016_lookup (i : Fin 32) :
    lookup (0 + i.val) = some (values0016[i.val]'(by rw [values0016_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (0 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_left 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0000_0064, split_left 32 block0016 block0017 (by omega)]
  exact block0016_get i

theorem block0017_lookup (i : Fin 32) :
    lookup (32 + i.val) = some (values0017[i.val]'(by rw [values0017_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (32 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_left 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0000_0064, split_right 32 block0016 block0017 (by omega)]
  exact block0017_get i

theorem block0018_lookup (i : Fin 32) :
    lookup (64 + i.val) = some (values0018[i.val]'(by rw [values0018_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (64 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_right 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0064_0128, split_left 96 block0018 block0019 (by omega)]
  exact block0018_get i

theorem block0019_lookup (i : Fin 32) :
    lookup (96 + i.val) = some (values0019[i.val]'(by rw [values0019_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (96 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_left 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0000_0128, split_right 64 node0000_0064 node0064_0128 (by omega)]
  rw [node0064_0128, split_right 96 block0018 block0019 (by omega)]
  exact block0019_get i

theorem block0020_lookup (i : Fin 32) :
    lookup (128 + i.val) = some (values0020[i.val]'(by rw [values0020_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (128 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_left 160 block0020 block0021 (by omega)]
  exact block0020_get i

theorem block0021_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values0021[i.val]'(by rw [values0021_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (160 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_right 160 block0020 block0021 (by omega)]
  exact block0021_get i

theorem block0022_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values0022[i.val]'(by rw [values0022_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (192 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block0022 block0023 (by omega)]
  exact block0022_get i

theorem block0023_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values0023[i.val]'(by rw [values0023_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (224 + i.val) = _
  rw [node0000_0501, split_left 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0000_0256, split_right 128 node0000_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block0022 block0023 (by omega)]
  exact block0023_get i

theorem block0024_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values0024[i.val]'(by rw [values0024_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (256 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_left 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0256_0384, split_left 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0256_0320, split_left 288 block0024 block0025 (by omega)]
  exact block0024_get i

theorem block0025_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values0025[i.val]'(by rw [values0025_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (288 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_left 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0256_0384, split_left 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0256_0320, split_right 288 block0024 block0025 (by omega)]
  exact block0025_get i

theorem block0026_lookup (i : Fin 32) :
    lookup (320 + i.val) = some (values0026[i.val]'(by rw [values0026_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (320 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_left 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0256_0384, split_right 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0320_0384, split_left 352 block0026 block0027 (by omega)]
  exact block0026_get i

theorem block0027_lookup (i : Fin 32) :
    lookup (352 + i.val) = some (values0027[i.val]'(by rw [values0027_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (352 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_left 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0256_0384, split_right 320 node0256_0320 node0320_0384 (by omega)]
  rw [node0320_0384, split_right 352 block0026 block0027 (by omega)]
  exact block0027_get i

theorem block0028_lookup (i : Fin 32) :
    lookup (384 + i.val) = some (values0028[i.val]'(by rw [values0028_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (384 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_right 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0384_0501, split_left 448 node0384_0448 node0448_0501 (by omega)]
  rw [node0384_0448, split_left 416 block0028 block0029 (by omega)]
  exact block0028_get i

theorem block0029_lookup (i : Fin 32) :
    lookup (416 + i.val) = some (values0029[i.val]'(by rw [values0029_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (416 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_right 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0384_0501, split_left 448 node0384_0448 node0448_0501 (by omega)]
  rw [node0384_0448, split_right 416 block0028 block0029 (by omega)]
  exact block0029_get i

theorem block0030_lookup (i : Fin 32) :
    lookup (448 + i.val) = some (values0030[i.val]'(by rw [values0030_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (448 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_right 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0384_0501, split_right 448 node0384_0448 node0448_0501 (by omega)]
  rw [node0448_0501, split_left 480 block0030 block0031 (by omega)]
  exact block0030_get i

theorem block0031_lookup (i : Fin 21) :
    lookup (480 + i.val) = some (values0031[i.val]'(by rw [values0031_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0000_0501 (480 + i.val) = _
  rw [node0000_0501, split_right 256 node0000_0256 node0256_0501 (by omega)]
  rw [node0256_0501, split_right 384 node0256_0384 node0384_0501 (by omega)]
  rw [node0384_0501, split_right 448 node0384_0448 node0448_0501 (by omega)]
  rw [node0448_0501, split_right 480 block0030 block0031 (by omega)]
  exact block0031_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0016_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0016_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0017_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0017_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0018_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0018_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0019_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0019_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0020_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0020_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0021_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0021_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0022_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0022_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0023_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0023_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0024_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0024_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0025_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0025_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0026_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0026_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0027_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0027_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0028_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0028_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0029_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0029_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0030_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0030_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0031_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0031_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0016_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0017_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0018_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0019_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0020_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0021_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0022_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0023_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0024_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0025_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0026_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0027_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0028_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0029_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0030_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow001.block0031_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow001
