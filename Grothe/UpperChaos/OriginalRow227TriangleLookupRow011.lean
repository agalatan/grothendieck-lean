import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0176
import Grothe.UpperChaos.OriginalRow227TriangleData0177
import Grothe.UpperChaos.OriginalRow227TriangleData0178
import Grothe.UpperChaos.OriginalRow227TriangleData0179
import Grothe.UpperChaos.OriginalRow227TriangleData0180
import Grothe.UpperChaos.OriginalRow227TriangleData0181
import Grothe.UpperChaos.OriginalRow227TriangleData0182
import Grothe.UpperChaos.OriginalRow227TriangleData0183
import Grothe.UpperChaos.OriginalRow227TriangleData0184
import Grothe.UpperChaos.OriginalRow227TriangleData0185
import Grothe.UpperChaos.OriginalRow227TriangleData0186
import Grothe.UpperChaos.OriginalRow227TriangleData0187
import Grothe.UpperChaos.OriginalRow227TriangleData0188
import Grothe.UpperChaos.OriginalRow227TriangleData0189
import Grothe.UpperChaos.OriginalRow227TriangleData0190
import Grothe.UpperChaos.OriginalRow227TriangleData0191

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow011

open ConditionalTableLookup

def values0176 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0176.coefficient11_10,
  OriginalRow227TriangleData0176.coefficient11_11,
  OriginalRow227TriangleData0176.coefficient11_12,
  OriginalRow227TriangleData0176.coefficient11_13,
  OriginalRow227TriangleData0176.coefficient11_14,
  OriginalRow227TriangleData0176.coefficient11_15,
  OriginalRow227TriangleData0176.coefficient11_16,
  OriginalRow227TriangleData0176.coefficient11_17,
  OriginalRow227TriangleData0176.coefficient11_18,
  OriginalRow227TriangleData0176.coefficient11_19,
  OriginalRow227TriangleData0176.coefficient11_20,
  OriginalRow227TriangleData0176.coefficient11_21,
  OriginalRow227TriangleData0176.coefficient11_22,
  OriginalRow227TriangleData0176.coefficient11_23,
  OriginalRow227TriangleData0176.coefficient11_24,
  OriginalRow227TriangleData0176.coefficient11_25,
  OriginalRow227TriangleData0176.coefficient11_26,
  OriginalRow227TriangleData0176.coefficient11_27,
  OriginalRow227TriangleData0176.coefficient11_28,
  OriginalRow227TriangleData0176.coefficient11_29,
  OriginalRow227TriangleData0176.coefficient11_30,
  OriginalRow227TriangleData0176.coefficient11_31,
  OriginalRow227TriangleData0176.coefficient11_32,
  OriginalRow227TriangleData0176.coefficient11_33,
  OriginalRow227TriangleData0176.coefficient11_34,
  OriginalRow227TriangleData0176.coefficient11_35,
  OriginalRow227TriangleData0176.coefficient11_36,
  OriginalRow227TriangleData0176.coefficient11_37,
  OriginalRow227TriangleData0176.coefficient11_38,
  OriginalRow227TriangleData0176.coefficient11_39,
  OriginalRow227TriangleData0176.coefficient11_40,
  OriginalRow227TriangleData0176.coefficient11_41
]

theorem values0176_size : values0176.size = 32 := rfl

def block0176 : ℕ → Option IntervalDyadic := segment 10 values0176

theorem block0176_domain : ExactDomain block0176 10 42 := by
  simpa only [values0176_size] using segment_domain 10 values0176

theorem block0176_get (i : Fin 32) :
    block0176 (10 + i.val) = some (values0176[i.val]'(by rw [values0176_size]; exact i.isLt)) := by
  exact segment_get 10 values0176 ⟨i.val, by rw [values0176_size]; exact i.isLt⟩

def values0177 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0177.coefficient11_42,
  OriginalRow227TriangleData0177.coefficient11_43,
  OriginalRow227TriangleData0177.coefficient11_44,
  OriginalRow227TriangleData0177.coefficient11_45,
  OriginalRow227TriangleData0177.coefficient11_46,
  OriginalRow227TriangleData0177.coefficient11_47,
  OriginalRow227TriangleData0177.coefficient11_48,
  OriginalRow227TriangleData0177.coefficient11_49,
  OriginalRow227TriangleData0177.coefficient11_50,
  OriginalRow227TriangleData0177.coefficient11_51,
  OriginalRow227TriangleData0177.coefficient11_52,
  OriginalRow227TriangleData0177.coefficient11_53,
  OriginalRow227TriangleData0177.coefficient11_54,
  OriginalRow227TriangleData0177.coefficient11_55,
  OriginalRow227TriangleData0177.coefficient11_56,
  OriginalRow227TriangleData0177.coefficient11_57,
  OriginalRow227TriangleData0177.coefficient11_58,
  OriginalRow227TriangleData0177.coefficient11_59,
  OriginalRow227TriangleData0177.coefficient11_60,
  OriginalRow227TriangleData0177.coefficient11_61,
  OriginalRow227TriangleData0177.coefficient11_62,
  OriginalRow227TriangleData0177.coefficient11_63,
  OriginalRow227TriangleData0177.coefficient11_64,
  OriginalRow227TriangleData0177.coefficient11_65,
  OriginalRow227TriangleData0177.coefficient11_66,
  OriginalRow227TriangleData0177.coefficient11_67,
  OriginalRow227TriangleData0177.coefficient11_68,
  OriginalRow227TriangleData0177.coefficient11_69,
  OriginalRow227TriangleData0177.coefficient11_70,
  OriginalRow227TriangleData0177.coefficient11_71,
  OriginalRow227TriangleData0177.coefficient11_72,
  OriginalRow227TriangleData0177.coefficient11_73
]

theorem values0177_size : values0177.size = 32 := rfl

def block0177 : ℕ → Option IntervalDyadic := segment 42 values0177

theorem block0177_domain : ExactDomain block0177 42 74 := by
  simpa only [values0177_size] using segment_domain 42 values0177

theorem block0177_get (i : Fin 32) :
    block0177 (42 + i.val) = some (values0177[i.val]'(by rw [values0177_size]; exact i.isLt)) := by
  exact segment_get 42 values0177 ⟨i.val, by rw [values0177_size]; exact i.isLt⟩

def values0178 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0178.coefficient11_74,
  OriginalRow227TriangleData0178.coefficient11_75,
  OriginalRow227TriangleData0178.coefficient11_76,
  OriginalRow227TriangleData0178.coefficient11_77,
  OriginalRow227TriangleData0178.coefficient11_78,
  OriginalRow227TriangleData0178.coefficient11_79,
  OriginalRow227TriangleData0178.coefficient11_80,
  OriginalRow227TriangleData0178.coefficient11_81,
  OriginalRow227TriangleData0178.coefficient11_82,
  OriginalRow227TriangleData0178.coefficient11_83,
  OriginalRow227TriangleData0178.coefficient11_84,
  OriginalRow227TriangleData0178.coefficient11_85,
  OriginalRow227TriangleData0178.coefficient11_86,
  OriginalRow227TriangleData0178.coefficient11_87,
  OriginalRow227TriangleData0178.coefficient11_88,
  OriginalRow227TriangleData0178.coefficient11_89,
  OriginalRow227TriangleData0178.coefficient11_90,
  OriginalRow227TriangleData0178.coefficient11_91,
  OriginalRow227TriangleData0178.coefficient11_92,
  OriginalRow227TriangleData0178.coefficient11_93,
  OriginalRow227TriangleData0178.coefficient11_94,
  OriginalRow227TriangleData0178.coefficient11_95,
  OriginalRow227TriangleData0178.coefficient11_96,
  OriginalRow227TriangleData0178.coefficient11_97,
  OriginalRow227TriangleData0178.coefficient11_98,
  OriginalRow227TriangleData0178.coefficient11_99,
  OriginalRow227TriangleData0178.coefficient11_100,
  OriginalRow227TriangleData0178.coefficient11_101,
  OriginalRow227TriangleData0178.coefficient11_102,
  OriginalRow227TriangleData0178.coefficient11_103,
  OriginalRow227TriangleData0178.coefficient11_104,
  OriginalRow227TriangleData0178.coefficient11_105
]

theorem values0178_size : values0178.size = 32 := rfl

def block0178 : ℕ → Option IntervalDyadic := segment 74 values0178

theorem block0178_domain : ExactDomain block0178 74 106 := by
  simpa only [values0178_size] using segment_domain 74 values0178

theorem block0178_get (i : Fin 32) :
    block0178 (74 + i.val) = some (values0178[i.val]'(by rw [values0178_size]; exact i.isLt)) := by
  exact segment_get 74 values0178 ⟨i.val, by rw [values0178_size]; exact i.isLt⟩

def values0179 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0179.coefficient11_106,
  OriginalRow227TriangleData0179.coefficient11_107,
  OriginalRow227TriangleData0179.coefficient11_108,
  OriginalRow227TriangleData0179.coefficient11_109,
  OriginalRow227TriangleData0179.coefficient11_110,
  OriginalRow227TriangleData0179.coefficient11_111,
  OriginalRow227TriangleData0179.coefficient11_112,
  OriginalRow227TriangleData0179.coefficient11_113,
  OriginalRow227TriangleData0179.coefficient11_114,
  OriginalRow227TriangleData0179.coefficient11_115,
  OriginalRow227TriangleData0179.coefficient11_116,
  OriginalRow227TriangleData0179.coefficient11_117,
  OriginalRow227TriangleData0179.coefficient11_118,
  OriginalRow227TriangleData0179.coefficient11_119,
  OriginalRow227TriangleData0179.coefficient11_120,
  OriginalRow227TriangleData0179.coefficient11_121,
  OriginalRow227TriangleData0179.coefficient11_122,
  OriginalRow227TriangleData0179.coefficient11_123,
  OriginalRow227TriangleData0179.coefficient11_124,
  OriginalRow227TriangleData0179.coefficient11_125,
  OriginalRow227TriangleData0179.coefficient11_126,
  OriginalRow227TriangleData0179.coefficient11_127,
  OriginalRow227TriangleData0179.coefficient11_128,
  OriginalRow227TriangleData0179.coefficient11_129,
  OriginalRow227TriangleData0179.coefficient11_130,
  OriginalRow227TriangleData0179.coefficient11_131,
  OriginalRow227TriangleData0179.coefficient11_132,
  OriginalRow227TriangleData0179.coefficient11_133,
  OriginalRow227TriangleData0179.coefficient11_134,
  OriginalRow227TriangleData0179.coefficient11_135,
  OriginalRow227TriangleData0179.coefficient11_136,
  OriginalRow227TriangleData0179.coefficient11_137
]

theorem values0179_size : values0179.size = 32 := rfl

def block0179 : ℕ → Option IntervalDyadic := segment 106 values0179

theorem block0179_domain : ExactDomain block0179 106 138 := by
  simpa only [values0179_size] using segment_domain 106 values0179

theorem block0179_get (i : Fin 32) :
    block0179 (106 + i.val) = some (values0179[i.val]'(by rw [values0179_size]; exact i.isLt)) := by
  exact segment_get 106 values0179 ⟨i.val, by rw [values0179_size]; exact i.isLt⟩

def values0180 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0180.coefficient11_138,
  OriginalRow227TriangleData0180.coefficient11_139,
  OriginalRow227TriangleData0180.coefficient11_140,
  OriginalRow227TriangleData0180.coefficient11_141,
  OriginalRow227TriangleData0180.coefficient11_142,
  OriginalRow227TriangleData0180.coefficient11_143,
  OriginalRow227TriangleData0180.coefficient11_144,
  OriginalRow227TriangleData0180.coefficient11_145,
  OriginalRow227TriangleData0180.coefficient11_146,
  OriginalRow227TriangleData0180.coefficient11_147,
  OriginalRow227TriangleData0180.coefficient11_148,
  OriginalRow227TriangleData0180.coefficient11_149,
  OriginalRow227TriangleData0180.coefficient11_150,
  OriginalRow227TriangleData0180.coefficient11_151,
  OriginalRow227TriangleData0180.coefficient11_152,
  OriginalRow227TriangleData0180.coefficient11_153,
  OriginalRow227TriangleData0180.coefficient11_154,
  OriginalRow227TriangleData0180.coefficient11_155,
  OriginalRow227TriangleData0180.coefficient11_156,
  OriginalRow227TriangleData0180.coefficient11_157,
  OriginalRow227TriangleData0180.coefficient11_158,
  OriginalRow227TriangleData0180.coefficient11_159,
  OriginalRow227TriangleData0180.coefficient11_160,
  OriginalRow227TriangleData0180.coefficient11_161,
  OriginalRow227TriangleData0180.coefficient11_162,
  OriginalRow227TriangleData0180.coefficient11_163,
  OriginalRow227TriangleData0180.coefficient11_164,
  OriginalRow227TriangleData0180.coefficient11_165,
  OriginalRow227TriangleData0180.coefficient11_166,
  OriginalRow227TriangleData0180.coefficient11_167,
  OriginalRow227TriangleData0180.coefficient11_168,
  OriginalRow227TriangleData0180.coefficient11_169
]

theorem values0180_size : values0180.size = 32 := rfl

def block0180 : ℕ → Option IntervalDyadic := segment 138 values0180

theorem block0180_domain : ExactDomain block0180 138 170 := by
  simpa only [values0180_size] using segment_domain 138 values0180

theorem block0180_get (i : Fin 32) :
    block0180 (138 + i.val) = some (values0180[i.val]'(by rw [values0180_size]; exact i.isLt)) := by
  exact segment_get 138 values0180 ⟨i.val, by rw [values0180_size]; exact i.isLt⟩

def values0181 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0181.coefficient11_170,
  OriginalRow227TriangleData0181.coefficient11_171,
  OriginalRow227TriangleData0181.coefficient11_172,
  OriginalRow227TriangleData0181.coefficient11_173,
  OriginalRow227TriangleData0181.coefficient11_174,
  OriginalRow227TriangleData0181.coefficient11_175,
  OriginalRow227TriangleData0181.coefficient11_176,
  OriginalRow227TriangleData0181.coefficient11_177,
  OriginalRow227TriangleData0181.coefficient11_178,
  OriginalRow227TriangleData0181.coefficient11_179,
  OriginalRow227TriangleData0181.coefficient11_180,
  OriginalRow227TriangleData0181.coefficient11_181,
  OriginalRow227TriangleData0181.coefficient11_182,
  OriginalRow227TriangleData0181.coefficient11_183,
  OriginalRow227TriangleData0181.coefficient11_184,
  OriginalRow227TriangleData0181.coefficient11_185,
  OriginalRow227TriangleData0181.coefficient11_186,
  OriginalRow227TriangleData0181.coefficient11_187,
  OriginalRow227TriangleData0181.coefficient11_188,
  OriginalRow227TriangleData0181.coefficient11_189,
  OriginalRow227TriangleData0181.coefficient11_190,
  OriginalRow227TriangleData0181.coefficient11_191,
  OriginalRow227TriangleData0181.coefficient11_192,
  OriginalRow227TriangleData0181.coefficient11_193,
  OriginalRow227TriangleData0181.coefficient11_194,
  OriginalRow227TriangleData0181.coefficient11_195,
  OriginalRow227TriangleData0181.coefficient11_196,
  OriginalRow227TriangleData0181.coefficient11_197,
  OriginalRow227TriangleData0181.coefficient11_198,
  OriginalRow227TriangleData0181.coefficient11_199,
  OriginalRow227TriangleData0181.coefficient11_200,
  OriginalRow227TriangleData0181.coefficient11_201
]

theorem values0181_size : values0181.size = 32 := rfl

def block0181 : ℕ → Option IntervalDyadic := segment 170 values0181

theorem block0181_domain : ExactDomain block0181 170 202 := by
  simpa only [values0181_size] using segment_domain 170 values0181

theorem block0181_get (i : Fin 32) :
    block0181 (170 + i.val) = some (values0181[i.val]'(by rw [values0181_size]; exact i.isLt)) := by
  exact segment_get 170 values0181 ⟨i.val, by rw [values0181_size]; exact i.isLt⟩

def values0182 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0182.coefficient11_202,
  OriginalRow227TriangleData0182.coefficient11_203,
  OriginalRow227TriangleData0182.coefficient11_204,
  OriginalRow227TriangleData0182.coefficient11_205,
  OriginalRow227TriangleData0182.coefficient11_206,
  OriginalRow227TriangleData0182.coefficient11_207,
  OriginalRow227TriangleData0182.coefficient11_208,
  OriginalRow227TriangleData0182.coefficient11_209,
  OriginalRow227TriangleData0182.coefficient11_210,
  OriginalRow227TriangleData0182.coefficient11_211,
  OriginalRow227TriangleData0182.coefficient11_212,
  OriginalRow227TriangleData0182.coefficient11_213,
  OriginalRow227TriangleData0182.coefficient11_214,
  OriginalRow227TriangleData0182.coefficient11_215,
  OriginalRow227TriangleData0182.coefficient11_216,
  OriginalRow227TriangleData0182.coefficient11_217,
  OriginalRow227TriangleData0182.coefficient11_218,
  OriginalRow227TriangleData0182.coefficient11_219,
  OriginalRow227TriangleData0182.coefficient11_220,
  OriginalRow227TriangleData0182.coefficient11_221,
  OriginalRow227TriangleData0182.coefficient11_222,
  OriginalRow227TriangleData0182.coefficient11_223,
  OriginalRow227TriangleData0182.coefficient11_224,
  OriginalRow227TriangleData0182.coefficient11_225,
  OriginalRow227TriangleData0182.coefficient11_226,
  OriginalRow227TriangleData0182.coefficient11_227,
  OriginalRow227TriangleData0182.coefficient11_228,
  OriginalRow227TriangleData0182.coefficient11_229,
  OriginalRow227TriangleData0182.coefficient11_230,
  OriginalRow227TriangleData0182.coefficient11_231,
  OriginalRow227TriangleData0182.coefficient11_232,
  OriginalRow227TriangleData0182.coefficient11_233
]

theorem values0182_size : values0182.size = 32 := rfl

def block0182 : ℕ → Option IntervalDyadic := segment 202 values0182

theorem block0182_domain : ExactDomain block0182 202 234 := by
  simpa only [values0182_size] using segment_domain 202 values0182

theorem block0182_get (i : Fin 32) :
    block0182 (202 + i.val) = some (values0182[i.val]'(by rw [values0182_size]; exact i.isLt)) := by
  exact segment_get 202 values0182 ⟨i.val, by rw [values0182_size]; exact i.isLt⟩

def values0183 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0183.coefficient11_234,
  OriginalRow227TriangleData0183.coefficient11_235,
  OriginalRow227TriangleData0183.coefficient11_236,
  OriginalRow227TriangleData0183.coefficient11_237,
  OriginalRow227TriangleData0183.coefficient11_238,
  OriginalRow227TriangleData0183.coefficient11_239,
  OriginalRow227TriangleData0183.coefficient11_240,
  OriginalRow227TriangleData0183.coefficient11_241,
  OriginalRow227TriangleData0183.coefficient11_242,
  OriginalRow227TriangleData0183.coefficient11_243,
  OriginalRow227TriangleData0183.coefficient11_244,
  OriginalRow227TriangleData0183.coefficient11_245,
  OriginalRow227TriangleData0183.coefficient11_246,
  OriginalRow227TriangleData0183.coefficient11_247,
  OriginalRow227TriangleData0183.coefficient11_248,
  OriginalRow227TriangleData0183.coefficient11_249,
  OriginalRow227TriangleData0183.coefficient11_250,
  OriginalRow227TriangleData0183.coefficient11_251,
  OriginalRow227TriangleData0183.coefficient11_252,
  OriginalRow227TriangleData0183.coefficient11_253,
  OriginalRow227TriangleData0183.coefficient11_254,
  OriginalRow227TriangleData0183.coefficient11_255,
  OriginalRow227TriangleData0183.coefficient11_256,
  OriginalRow227TriangleData0183.coefficient11_257,
  OriginalRow227TriangleData0183.coefficient11_258,
  OriginalRow227TriangleData0183.coefficient11_259,
  OriginalRow227TriangleData0183.coefficient11_260,
  OriginalRow227TriangleData0183.coefficient11_261,
  OriginalRow227TriangleData0183.coefficient11_262,
  OriginalRow227TriangleData0183.coefficient11_263,
  OriginalRow227TriangleData0183.coefficient11_264,
  OriginalRow227TriangleData0183.coefficient11_265
]

theorem values0183_size : values0183.size = 32 := rfl

def block0183 : ℕ → Option IntervalDyadic := segment 234 values0183

theorem block0183_domain : ExactDomain block0183 234 266 := by
  simpa only [values0183_size] using segment_domain 234 values0183

theorem block0183_get (i : Fin 32) :
    block0183 (234 + i.val) = some (values0183[i.val]'(by rw [values0183_size]; exact i.isLt)) := by
  exact segment_get 234 values0183 ⟨i.val, by rw [values0183_size]; exact i.isLt⟩

def values0184 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0184.coefficient11_266,
  OriginalRow227TriangleData0184.coefficient11_267,
  OriginalRow227TriangleData0184.coefficient11_268,
  OriginalRow227TriangleData0184.coefficient11_269,
  OriginalRow227TriangleData0184.coefficient11_270,
  OriginalRow227TriangleData0184.coefficient11_271,
  OriginalRow227TriangleData0184.coefficient11_272,
  OriginalRow227TriangleData0184.coefficient11_273,
  OriginalRow227TriangleData0184.coefficient11_274,
  OriginalRow227TriangleData0184.coefficient11_275,
  OriginalRow227TriangleData0184.coefficient11_276,
  OriginalRow227TriangleData0184.coefficient11_277,
  OriginalRow227TriangleData0184.coefficient11_278,
  OriginalRow227TriangleData0184.coefficient11_279,
  OriginalRow227TriangleData0184.coefficient11_280,
  OriginalRow227TriangleData0184.coefficient11_281,
  OriginalRow227TriangleData0184.coefficient11_282,
  OriginalRow227TriangleData0184.coefficient11_283,
  OriginalRow227TriangleData0184.coefficient11_284,
  OriginalRow227TriangleData0184.coefficient11_285,
  OriginalRow227TriangleData0184.coefficient11_286,
  OriginalRow227TriangleData0184.coefficient11_287,
  OriginalRow227TriangleData0184.coefficient11_288,
  OriginalRow227TriangleData0184.coefficient11_289,
  OriginalRow227TriangleData0184.coefficient11_290,
  OriginalRow227TriangleData0184.coefficient11_291,
  OriginalRow227TriangleData0184.coefficient11_292,
  OriginalRow227TriangleData0184.coefficient11_293,
  OriginalRow227TriangleData0184.coefficient11_294,
  OriginalRow227TriangleData0184.coefficient11_295,
  OriginalRow227TriangleData0184.coefficient11_296,
  OriginalRow227TriangleData0184.coefficient11_297
]

theorem values0184_size : values0184.size = 32 := rfl

def block0184 : ℕ → Option IntervalDyadic := segment 266 values0184

theorem block0184_domain : ExactDomain block0184 266 298 := by
  simpa only [values0184_size] using segment_domain 266 values0184

theorem block0184_get (i : Fin 32) :
    block0184 (266 + i.val) = some (values0184[i.val]'(by rw [values0184_size]; exact i.isLt)) := by
  exact segment_get 266 values0184 ⟨i.val, by rw [values0184_size]; exact i.isLt⟩

def values0185 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0185.coefficient11_298,
  OriginalRow227TriangleData0185.coefficient11_299,
  OriginalRow227TriangleData0185.coefficient11_300,
  OriginalRow227TriangleData0185.coefficient11_301,
  OriginalRow227TriangleData0185.coefficient11_302,
  OriginalRow227TriangleData0185.coefficient11_303,
  OriginalRow227TriangleData0185.coefficient11_304,
  OriginalRow227TriangleData0185.coefficient11_305,
  OriginalRow227TriangleData0185.coefficient11_306,
  OriginalRow227TriangleData0185.coefficient11_307,
  OriginalRow227TriangleData0185.coefficient11_308,
  OriginalRow227TriangleData0185.coefficient11_309,
  OriginalRow227TriangleData0185.coefficient11_310,
  OriginalRow227TriangleData0185.coefficient11_311,
  OriginalRow227TriangleData0185.coefficient11_312,
  OriginalRow227TriangleData0185.coefficient11_313,
  OriginalRow227TriangleData0185.coefficient11_314,
  OriginalRow227TriangleData0185.coefficient11_315,
  OriginalRow227TriangleData0185.coefficient11_316,
  OriginalRow227TriangleData0185.coefficient11_317,
  OriginalRow227TriangleData0185.coefficient11_318,
  OriginalRow227TriangleData0185.coefficient11_319,
  OriginalRow227TriangleData0185.coefficient11_320,
  OriginalRow227TriangleData0185.coefficient11_321,
  OriginalRow227TriangleData0185.coefficient11_322,
  OriginalRow227TriangleData0185.coefficient11_323,
  OriginalRow227TriangleData0185.coefficient11_324,
  OriginalRow227TriangleData0185.coefficient11_325,
  OriginalRow227TriangleData0185.coefficient11_326,
  OriginalRow227TriangleData0185.coefficient11_327,
  OriginalRow227TriangleData0185.coefficient11_328,
  OriginalRow227TriangleData0185.coefficient11_329
]

theorem values0185_size : values0185.size = 32 := rfl

def block0185 : ℕ → Option IntervalDyadic := segment 298 values0185

theorem block0185_domain : ExactDomain block0185 298 330 := by
  simpa only [values0185_size] using segment_domain 298 values0185

theorem block0185_get (i : Fin 32) :
    block0185 (298 + i.val) = some (values0185[i.val]'(by rw [values0185_size]; exact i.isLt)) := by
  exact segment_get 298 values0185 ⟨i.val, by rw [values0185_size]; exact i.isLt⟩

def values0186 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0186.coefficient11_330,
  OriginalRow227TriangleData0186.coefficient11_331,
  OriginalRow227TriangleData0186.coefficient11_332,
  OriginalRow227TriangleData0186.coefficient11_333,
  OriginalRow227TriangleData0186.coefficient11_334,
  OriginalRow227TriangleData0186.coefficient11_335,
  OriginalRow227TriangleData0186.coefficient11_336,
  OriginalRow227TriangleData0186.coefficient11_337,
  OriginalRow227TriangleData0186.coefficient11_338,
  OriginalRow227TriangleData0186.coefficient11_339,
  OriginalRow227TriangleData0186.coefficient11_340,
  OriginalRow227TriangleData0186.coefficient11_341,
  OriginalRow227TriangleData0186.coefficient11_342,
  OriginalRow227TriangleData0186.coefficient11_343,
  OriginalRow227TriangleData0186.coefficient11_344,
  OriginalRow227TriangleData0186.coefficient11_345,
  OriginalRow227TriangleData0186.coefficient11_346,
  OriginalRow227TriangleData0186.coefficient11_347,
  OriginalRow227TriangleData0186.coefficient11_348,
  OriginalRow227TriangleData0186.coefficient11_349,
  OriginalRow227TriangleData0186.coefficient11_350,
  OriginalRow227TriangleData0186.coefficient11_351,
  OriginalRow227TriangleData0186.coefficient11_352,
  OriginalRow227TriangleData0186.coefficient11_353,
  OriginalRow227TriangleData0186.coefficient11_354,
  OriginalRow227TriangleData0186.coefficient11_355,
  OriginalRow227TriangleData0186.coefficient11_356,
  OriginalRow227TriangleData0186.coefficient11_357,
  OriginalRow227TriangleData0186.coefficient11_358,
  OriginalRow227TriangleData0186.coefficient11_359,
  OriginalRow227TriangleData0186.coefficient11_360,
  OriginalRow227TriangleData0186.coefficient11_361
]

theorem values0186_size : values0186.size = 32 := rfl

def block0186 : ℕ → Option IntervalDyadic := segment 330 values0186

theorem block0186_domain : ExactDomain block0186 330 362 := by
  simpa only [values0186_size] using segment_domain 330 values0186

theorem block0186_get (i : Fin 32) :
    block0186 (330 + i.val) = some (values0186[i.val]'(by rw [values0186_size]; exact i.isLt)) := by
  exact segment_get 330 values0186 ⟨i.val, by rw [values0186_size]; exact i.isLt⟩

def values0187 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0187.coefficient11_362,
  OriginalRow227TriangleData0187.coefficient11_363,
  OriginalRow227TriangleData0187.coefficient11_364,
  OriginalRow227TriangleData0187.coefficient11_365,
  OriginalRow227TriangleData0187.coefficient11_366,
  OriginalRow227TriangleData0187.coefficient11_367,
  OriginalRow227TriangleData0187.coefficient11_368,
  OriginalRow227TriangleData0187.coefficient11_369,
  OriginalRow227TriangleData0187.coefficient11_370,
  OriginalRow227TriangleData0187.coefficient11_371,
  OriginalRow227TriangleData0187.coefficient11_372,
  OriginalRow227TriangleData0187.coefficient11_373,
  OriginalRow227TriangleData0187.coefficient11_374,
  OriginalRow227TriangleData0187.coefficient11_375,
  OriginalRow227TriangleData0187.coefficient11_376,
  OriginalRow227TriangleData0187.coefficient11_377,
  OriginalRow227TriangleData0187.coefficient11_378,
  OriginalRow227TriangleData0187.coefficient11_379,
  OriginalRow227TriangleData0187.coefficient11_380,
  OriginalRow227TriangleData0187.coefficient11_381,
  OriginalRow227TriangleData0187.coefficient11_382,
  OriginalRow227TriangleData0187.coefficient11_383,
  OriginalRow227TriangleData0187.coefficient11_384,
  OriginalRow227TriangleData0187.coefficient11_385,
  OriginalRow227TriangleData0187.coefficient11_386,
  OriginalRow227TriangleData0187.coefficient11_387,
  OriginalRow227TriangleData0187.coefficient11_388,
  OriginalRow227TriangleData0187.coefficient11_389,
  OriginalRow227TriangleData0187.coefficient11_390,
  OriginalRow227TriangleData0187.coefficient11_391,
  OriginalRow227TriangleData0187.coefficient11_392,
  OriginalRow227TriangleData0187.coefficient11_393
]

theorem values0187_size : values0187.size = 32 := rfl

def block0187 : ℕ → Option IntervalDyadic := segment 362 values0187

theorem block0187_domain : ExactDomain block0187 362 394 := by
  simpa only [values0187_size] using segment_domain 362 values0187

theorem block0187_get (i : Fin 32) :
    block0187 (362 + i.val) = some (values0187[i.val]'(by rw [values0187_size]; exact i.isLt)) := by
  exact segment_get 362 values0187 ⟨i.val, by rw [values0187_size]; exact i.isLt⟩

def values0188 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0188.coefficient11_394,
  OriginalRow227TriangleData0188.coefficient11_395,
  OriginalRow227TriangleData0188.coefficient11_396,
  OriginalRow227TriangleData0188.coefficient11_397,
  OriginalRow227TriangleData0188.coefficient11_398,
  OriginalRow227TriangleData0188.coefficient11_399,
  OriginalRow227TriangleData0188.coefficient11_400,
  OriginalRow227TriangleData0188.coefficient11_401,
  OriginalRow227TriangleData0188.coefficient11_402,
  OriginalRow227TriangleData0188.coefficient11_403,
  OriginalRow227TriangleData0188.coefficient11_404,
  OriginalRow227TriangleData0188.coefficient11_405,
  OriginalRow227TriangleData0188.coefficient11_406,
  OriginalRow227TriangleData0188.coefficient11_407,
  OriginalRow227TriangleData0188.coefficient11_408,
  OriginalRow227TriangleData0188.coefficient11_409,
  OriginalRow227TriangleData0188.coefficient11_410,
  OriginalRow227TriangleData0188.coefficient11_411,
  OriginalRow227TriangleData0188.coefficient11_412,
  OriginalRow227TriangleData0188.coefficient11_413,
  OriginalRow227TriangleData0188.coefficient11_414,
  OriginalRow227TriangleData0188.coefficient11_415,
  OriginalRow227TriangleData0188.coefficient11_416,
  OriginalRow227TriangleData0188.coefficient11_417,
  OriginalRow227TriangleData0188.coefficient11_418,
  OriginalRow227TriangleData0188.coefficient11_419,
  OriginalRow227TriangleData0188.coefficient11_420,
  OriginalRow227TriangleData0188.coefficient11_421,
  OriginalRow227TriangleData0188.coefficient11_422,
  OriginalRow227TriangleData0188.coefficient11_423,
  OriginalRow227TriangleData0188.coefficient11_424,
  OriginalRow227TriangleData0188.coefficient11_425
]

theorem values0188_size : values0188.size = 32 := rfl

def block0188 : ℕ → Option IntervalDyadic := segment 394 values0188

theorem block0188_domain : ExactDomain block0188 394 426 := by
  simpa only [values0188_size] using segment_domain 394 values0188

theorem block0188_get (i : Fin 32) :
    block0188 (394 + i.val) = some (values0188[i.val]'(by rw [values0188_size]; exact i.isLt)) := by
  exact segment_get 394 values0188 ⟨i.val, by rw [values0188_size]; exact i.isLt⟩

def values0189 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0189.coefficient11_426,
  OriginalRow227TriangleData0189.coefficient11_427,
  OriginalRow227TriangleData0189.coefficient11_428,
  OriginalRow227TriangleData0189.coefficient11_429,
  OriginalRow227TriangleData0189.coefficient11_430,
  OriginalRow227TriangleData0189.coefficient11_431,
  OriginalRow227TriangleData0189.coefficient11_432,
  OriginalRow227TriangleData0189.coefficient11_433,
  OriginalRow227TriangleData0189.coefficient11_434,
  OriginalRow227TriangleData0189.coefficient11_435,
  OriginalRow227TriangleData0189.coefficient11_436,
  OriginalRow227TriangleData0189.coefficient11_437,
  OriginalRow227TriangleData0189.coefficient11_438,
  OriginalRow227TriangleData0189.coefficient11_439,
  OriginalRow227TriangleData0189.coefficient11_440,
  OriginalRow227TriangleData0189.coefficient11_441,
  OriginalRow227TriangleData0189.coefficient11_442,
  OriginalRow227TriangleData0189.coefficient11_443,
  OriginalRow227TriangleData0189.coefficient11_444,
  OriginalRow227TriangleData0189.coefficient11_445,
  OriginalRow227TriangleData0189.coefficient11_446,
  OriginalRow227TriangleData0189.coefficient11_447,
  OriginalRow227TriangleData0189.coefficient11_448,
  OriginalRow227TriangleData0189.coefficient11_449,
  OriginalRow227TriangleData0189.coefficient11_450,
  OriginalRow227TriangleData0189.coefficient11_451,
  OriginalRow227TriangleData0189.coefficient11_452,
  OriginalRow227TriangleData0189.coefficient11_453,
  OriginalRow227TriangleData0189.coefficient11_454,
  OriginalRow227TriangleData0189.coefficient11_455,
  OriginalRow227TriangleData0189.coefficient11_456,
  OriginalRow227TriangleData0189.coefficient11_457
]

theorem values0189_size : values0189.size = 32 := rfl

def block0189 : ℕ → Option IntervalDyadic := segment 426 values0189

theorem block0189_domain : ExactDomain block0189 426 458 := by
  simpa only [values0189_size] using segment_domain 426 values0189

theorem block0189_get (i : Fin 32) :
    block0189 (426 + i.val) = some (values0189[i.val]'(by rw [values0189_size]; exact i.isLt)) := by
  exact segment_get 426 values0189 ⟨i.val, by rw [values0189_size]; exact i.isLt⟩

def values0190 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0190.coefficient11_458,
  OriginalRow227TriangleData0190.coefficient11_459,
  OriginalRow227TriangleData0190.coefficient11_460,
  OriginalRow227TriangleData0190.coefficient11_461,
  OriginalRow227TriangleData0190.coefficient11_462,
  OriginalRow227TriangleData0190.coefficient11_463,
  OriginalRow227TriangleData0190.coefficient11_464,
  OriginalRow227TriangleData0190.coefficient11_465,
  OriginalRow227TriangleData0190.coefficient11_466,
  OriginalRow227TriangleData0190.coefficient11_467,
  OriginalRow227TriangleData0190.coefficient11_468,
  OriginalRow227TriangleData0190.coefficient11_469,
  OriginalRow227TriangleData0190.coefficient11_470,
  OriginalRow227TriangleData0190.coefficient11_471,
  OriginalRow227TriangleData0190.coefficient11_472,
  OriginalRow227TriangleData0190.coefficient11_473,
  OriginalRow227TriangleData0190.coefficient11_474,
  OriginalRow227TriangleData0190.coefficient11_475,
  OriginalRow227TriangleData0190.coefficient11_476,
  OriginalRow227TriangleData0190.coefficient11_477,
  OriginalRow227TriangleData0190.coefficient11_478,
  OriginalRow227TriangleData0190.coefficient11_479,
  OriginalRow227TriangleData0190.coefficient11_480,
  OriginalRow227TriangleData0190.coefficient11_481,
  OriginalRow227TriangleData0190.coefficient11_482,
  OriginalRow227TriangleData0190.coefficient11_483,
  OriginalRow227TriangleData0190.coefficient11_484,
  OriginalRow227TriangleData0190.coefficient11_485,
  OriginalRow227TriangleData0190.coefficient11_486,
  OriginalRow227TriangleData0190.coefficient11_487,
  OriginalRow227TriangleData0190.coefficient11_488,
  OriginalRow227TriangleData0190.coefficient11_489
]

theorem values0190_size : values0190.size = 32 := rfl

def block0190 : ℕ → Option IntervalDyadic := segment 458 values0190

theorem block0190_domain : ExactDomain block0190 458 490 := by
  simpa only [values0190_size] using segment_domain 458 values0190

theorem block0190_get (i : Fin 32) :
    block0190 (458 + i.val) = some (values0190[i.val]'(by rw [values0190_size]; exact i.isLt)) := by
  exact segment_get 458 values0190 ⟨i.val, by rw [values0190_size]; exact i.isLt⟩

def values0191 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0191.coefficient11_490
]

theorem values0191_size : values0191.size = 1 := rfl

def block0191 : ℕ → Option IntervalDyadic := segment 490 values0191

theorem block0191_domain : ExactDomain block0191 490 491 := by
  simpa only [values0191_size] using segment_domain 490 values0191

theorem block0191_get (i : Fin 1) :
    block0191 (490 + i.val) = some (values0191[i.val]'(by rw [values0191_size]; exact i.isLt)) := by
  exact segment_get 490 values0191 ⟨i.val, by rw [values0191_size]; exact i.isLt⟩

def node0010_0074 : ℕ → Option IntervalDyadic := split 42 block0176 block0177

theorem node0010_0074_domain : ExactDomain node0010_0074 10 74 := by
  exact split_domain (by decide) (by decide) block0176_domain block0177_domain

def node0074_0138 : ℕ → Option IntervalDyadic := split 106 block0178 block0179

theorem node0074_0138_domain : ExactDomain node0074_0138 74 138 := by
  exact split_domain (by decide) (by decide) block0178_domain block0179_domain

def node0010_0138 : ℕ → Option IntervalDyadic := split 74 node0010_0074 node0074_0138

theorem node0010_0138_domain : ExactDomain node0010_0138 10 138 := by
  exact split_domain (by decide) (by decide) node0010_0074_domain node0074_0138_domain

def node0138_0202 : ℕ → Option IntervalDyadic := split 170 block0180 block0181

theorem node0138_0202_domain : ExactDomain node0138_0202 138 202 := by
  exact split_domain (by decide) (by decide) block0180_domain block0181_domain

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block0182 block0183

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block0182_domain block0183_domain

def node0138_0266 : ℕ → Option IntervalDyadic := split 202 node0138_0202 node0202_0266

theorem node0138_0266_domain : ExactDomain node0138_0266 138 266 := by
  exact split_domain (by decide) (by decide) node0138_0202_domain node0202_0266_domain

def node0010_0266 : ℕ → Option IntervalDyadic := split 138 node0010_0138 node0138_0266

theorem node0010_0266_domain : ExactDomain node0010_0266 10 266 := by
  exact split_domain (by decide) (by decide) node0010_0138_domain node0138_0266_domain

def node0266_0330 : ℕ → Option IntervalDyadic := split 298 block0184 block0185

theorem node0266_0330_domain : ExactDomain node0266_0330 266 330 := by
  exact split_domain (by decide) (by decide) block0184_domain block0185_domain

def node0330_0394 : ℕ → Option IntervalDyadic := split 362 block0186 block0187

theorem node0330_0394_domain : ExactDomain node0330_0394 330 394 := by
  exact split_domain (by decide) (by decide) block0186_domain block0187_domain

def node0266_0394 : ℕ → Option IntervalDyadic := split 330 node0266_0330 node0330_0394

theorem node0266_0394_domain : ExactDomain node0266_0394 266 394 := by
  exact split_domain (by decide) (by decide) node0266_0330_domain node0330_0394_domain

def node0394_0458 : ℕ → Option IntervalDyadic := split 426 block0188 block0189

theorem node0394_0458_domain : ExactDomain node0394_0458 394 458 := by
  exact split_domain (by decide) (by decide) block0188_domain block0189_domain

def node0458_0491 : ℕ → Option IntervalDyadic := split 490 block0190 block0191

theorem node0458_0491_domain : ExactDomain node0458_0491 458 491 := by
  exact split_domain (by decide) (by decide) block0190_domain block0191_domain

def node0394_0491 : ℕ → Option IntervalDyadic := split 458 node0394_0458 node0458_0491

theorem node0394_0491_domain : ExactDomain node0394_0491 394 491 := by
  exact split_domain (by decide) (by decide) node0394_0458_domain node0458_0491_domain

def node0266_0491 : ℕ → Option IntervalDyadic := split 394 node0266_0394 node0394_0491

theorem node0266_0491_domain : ExactDomain node0266_0491 266 491 := by
  exact split_domain (by decide) (by decide) node0266_0394_domain node0394_0491_domain

def node0010_0491 : ℕ → Option IntervalDyadic := split 266 node0010_0266 node0266_0491

theorem node0010_0491_domain : ExactDomain node0010_0491 10 491 := by
  exact split_domain (by decide) (by decide) node0010_0266_domain node0266_0491_domain

def lookup : ℕ → Option IntervalDyadic := node0010_0491

theorem lookup_domain : ExactDomain lookup 10 491 :=
  node0010_0491_domain

theorem block0176_lookup (i : Fin 32) :
    lookup (10 + i.val) = some (values0176[i.val]'(by rw [values0176_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (10 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_left 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0010_0138, split_left 74 node0010_0074 node0074_0138 (by omega)]
  rw [node0010_0074, split_left 42 block0176 block0177 (by omega)]
  exact block0176_get i

theorem block0177_lookup (i : Fin 32) :
    lookup (42 + i.val) = some (values0177[i.val]'(by rw [values0177_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (42 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_left 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0010_0138, split_left 74 node0010_0074 node0074_0138 (by omega)]
  rw [node0010_0074, split_right 42 block0176 block0177 (by omega)]
  exact block0177_get i

theorem block0178_lookup (i : Fin 32) :
    lookup (74 + i.val) = some (values0178[i.val]'(by rw [values0178_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (74 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_left 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0010_0138, split_right 74 node0010_0074 node0074_0138 (by omega)]
  rw [node0074_0138, split_left 106 block0178 block0179 (by omega)]
  exact block0178_get i

theorem block0179_lookup (i : Fin 32) :
    lookup (106 + i.val) = some (values0179[i.val]'(by rw [values0179_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (106 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_left 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0010_0138, split_right 74 node0010_0074 node0074_0138 (by omega)]
  rw [node0074_0138, split_right 106 block0178 block0179 (by omega)]
  exact block0179_get i

theorem block0180_lookup (i : Fin 32) :
    lookup (138 + i.val) = some (values0180[i.val]'(by rw [values0180_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (138 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_right 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_left 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0138_0202, split_left 170 block0180 block0181 (by omega)]
  exact block0180_get i

theorem block0181_lookup (i : Fin 32) :
    lookup (170 + i.val) = some (values0181[i.val]'(by rw [values0181_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (170 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_right 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_left 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0138_0202, split_right 170 block0180 block0181 (by omega)]
  exact block0181_get i

theorem block0182_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values0182[i.val]'(by rw [values0182_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (202 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_right 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_right 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0202_0266, split_left 234 block0182 block0183 (by omega)]
  exact block0182_get i

theorem block0183_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values0183[i.val]'(by rw [values0183_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (234 + i.val) = _
  rw [node0010_0491, split_left 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0010_0266, split_right 138 node0010_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_right 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0202_0266, split_right 234 block0182 block0183 (by omega)]
  exact block0183_get i

theorem block0184_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values0184[i.val]'(by rw [values0184_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (266 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_left 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0266_0394, split_left 330 node0266_0330 node0330_0394 (by omega)]
  rw [node0266_0330, split_left 298 block0184 block0185 (by omega)]
  exact block0184_get i

theorem block0185_lookup (i : Fin 32) :
    lookup (298 + i.val) = some (values0185[i.val]'(by rw [values0185_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (298 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_left 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0266_0394, split_left 330 node0266_0330 node0330_0394 (by omega)]
  rw [node0266_0330, split_right 298 block0184 block0185 (by omega)]
  exact block0185_get i

theorem block0186_lookup (i : Fin 32) :
    lookup (330 + i.val) = some (values0186[i.val]'(by rw [values0186_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (330 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_left 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0266_0394, split_right 330 node0266_0330 node0330_0394 (by omega)]
  rw [node0330_0394, split_left 362 block0186 block0187 (by omega)]
  exact block0186_get i

theorem block0187_lookup (i : Fin 32) :
    lookup (362 + i.val) = some (values0187[i.val]'(by rw [values0187_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (362 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_left 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0266_0394, split_right 330 node0266_0330 node0330_0394 (by omega)]
  rw [node0330_0394, split_right 362 block0186 block0187 (by omega)]
  exact block0187_get i

theorem block0188_lookup (i : Fin 32) :
    lookup (394 + i.val) = some (values0188[i.val]'(by rw [values0188_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (394 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_right 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0394_0491, split_left 458 node0394_0458 node0458_0491 (by omega)]
  rw [node0394_0458, split_left 426 block0188 block0189 (by omega)]
  exact block0188_get i

theorem block0189_lookup (i : Fin 32) :
    lookup (426 + i.val) = some (values0189[i.val]'(by rw [values0189_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (426 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_right 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0394_0491, split_left 458 node0394_0458 node0458_0491 (by omega)]
  rw [node0394_0458, split_right 426 block0188 block0189 (by omega)]
  exact block0189_get i

theorem block0190_lookup (i : Fin 32) :
    lookup (458 + i.val) = some (values0190[i.val]'(by rw [values0190_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (458 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_right 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0394_0491, split_right 458 node0394_0458 node0458_0491 (by omega)]
  rw [node0458_0491, split_left 490 block0190 block0191 (by omega)]
  exact block0190_get i

theorem block0191_lookup (i : Fin 1) :
    lookup (490 + i.val) = some (values0191[i.val]'(by rw [values0191_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0010_0491 (490 + i.val) = _
  rw [node0010_0491, split_right 266 node0010_0266 node0266_0491 (by omega)]
  rw [node0266_0491, split_right 394 node0266_0394 node0394_0491 (by omega)]
  rw [node0394_0491, split_right 458 node0394_0458 node0458_0491 (by omega)]
  rw [node0458_0491, split_right 490 block0190 block0191 (by omega)]
  exact block0191_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0176_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0176_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0177_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0177_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0178_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0178_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0179_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0179_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0180_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0180_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0181_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0181_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0182_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0182_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0183_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0183_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0184_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0184_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0185_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0185_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0186_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0186_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0187_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0187_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0188_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0188_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0189_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0189_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0190_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0190_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0191_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0191_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0176_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0177_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0178_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0179_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0180_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0181_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0182_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0183_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0184_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0185_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0186_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0187_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0188_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0189_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0190_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow011.block0191_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow011
