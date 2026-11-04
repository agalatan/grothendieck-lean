import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0207
import Grothe.UpperChaos.OriginalRow227TriangleData0208
import Grothe.UpperChaos.OriginalRow227TriangleData0209
import Grothe.UpperChaos.OriginalRow227TriangleData0210
import Grothe.UpperChaos.OriginalRow227TriangleData0211
import Grothe.UpperChaos.OriginalRow227TriangleData0212
import Grothe.UpperChaos.OriginalRow227TriangleData0213
import Grothe.UpperChaos.OriginalRow227TriangleData0214
import Grothe.UpperChaos.OriginalRow227TriangleData0215
import Grothe.UpperChaos.OriginalRow227TriangleData0216
import Grothe.UpperChaos.OriginalRow227TriangleData0217
import Grothe.UpperChaos.OriginalRow227TriangleData0218
import Grothe.UpperChaos.OriginalRow227TriangleData0219
import Grothe.UpperChaos.OriginalRow227TriangleData0220
import Grothe.UpperChaos.OriginalRow227TriangleData0221

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow013

open ConditionalTableLookup

def values0207 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0207.coefficient13_12,
  OriginalRow227TriangleData0207.coefficient13_13,
  OriginalRow227TriangleData0207.coefficient13_14,
  OriginalRow227TriangleData0207.coefficient13_15,
  OriginalRow227TriangleData0207.coefficient13_16,
  OriginalRow227TriangleData0207.coefficient13_17,
  OriginalRow227TriangleData0207.coefficient13_18,
  OriginalRow227TriangleData0207.coefficient13_19,
  OriginalRow227TriangleData0207.coefficient13_20,
  OriginalRow227TriangleData0207.coefficient13_21,
  OriginalRow227TriangleData0207.coefficient13_22,
  OriginalRow227TriangleData0207.coefficient13_23,
  OriginalRow227TriangleData0207.coefficient13_24,
  OriginalRow227TriangleData0207.coefficient13_25,
  OriginalRow227TriangleData0207.coefficient13_26,
  OriginalRow227TriangleData0207.coefficient13_27,
  OriginalRow227TriangleData0207.coefficient13_28,
  OriginalRow227TriangleData0207.coefficient13_29,
  OriginalRow227TriangleData0207.coefficient13_30,
  OriginalRow227TriangleData0207.coefficient13_31,
  OriginalRow227TriangleData0207.coefficient13_32,
  OriginalRow227TriangleData0207.coefficient13_33,
  OriginalRow227TriangleData0207.coefficient13_34,
  OriginalRow227TriangleData0207.coefficient13_35,
  OriginalRow227TriangleData0207.coefficient13_36,
  OriginalRow227TriangleData0207.coefficient13_37,
  OriginalRow227TriangleData0207.coefficient13_38,
  OriginalRow227TriangleData0207.coefficient13_39,
  OriginalRow227TriangleData0207.coefficient13_40,
  OriginalRow227TriangleData0207.coefficient13_41,
  OriginalRow227TriangleData0207.coefficient13_42,
  OriginalRow227TriangleData0207.coefficient13_43
]

theorem values0207_size : values0207.size = 32 := rfl

def block0207 : ℕ → Option IntervalDyadic := segment 12 values0207

theorem block0207_domain : ExactDomain block0207 12 44 := by
  simpa only [values0207_size] using segment_domain 12 values0207

theorem block0207_get (i : Fin 32) :
    block0207 (12 + i.val) = some (values0207[i.val]'(by rw [values0207_size]; exact i.isLt)) := by
  exact segment_get 12 values0207 ⟨i.val, by rw [values0207_size]; exact i.isLt⟩

def values0208 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0208.coefficient13_44,
  OriginalRow227TriangleData0208.coefficient13_45,
  OriginalRow227TriangleData0208.coefficient13_46,
  OriginalRow227TriangleData0208.coefficient13_47,
  OriginalRow227TriangleData0208.coefficient13_48,
  OriginalRow227TriangleData0208.coefficient13_49,
  OriginalRow227TriangleData0208.coefficient13_50,
  OriginalRow227TriangleData0208.coefficient13_51,
  OriginalRow227TriangleData0208.coefficient13_52,
  OriginalRow227TriangleData0208.coefficient13_53,
  OriginalRow227TriangleData0208.coefficient13_54,
  OriginalRow227TriangleData0208.coefficient13_55,
  OriginalRow227TriangleData0208.coefficient13_56,
  OriginalRow227TriangleData0208.coefficient13_57,
  OriginalRow227TriangleData0208.coefficient13_58,
  OriginalRow227TriangleData0208.coefficient13_59,
  OriginalRow227TriangleData0208.coefficient13_60,
  OriginalRow227TriangleData0208.coefficient13_61,
  OriginalRow227TriangleData0208.coefficient13_62,
  OriginalRow227TriangleData0208.coefficient13_63,
  OriginalRow227TriangleData0208.coefficient13_64,
  OriginalRow227TriangleData0208.coefficient13_65,
  OriginalRow227TriangleData0208.coefficient13_66,
  OriginalRow227TriangleData0208.coefficient13_67,
  OriginalRow227TriangleData0208.coefficient13_68,
  OriginalRow227TriangleData0208.coefficient13_69,
  OriginalRow227TriangleData0208.coefficient13_70,
  OriginalRow227TriangleData0208.coefficient13_71,
  OriginalRow227TriangleData0208.coefficient13_72,
  OriginalRow227TriangleData0208.coefficient13_73,
  OriginalRow227TriangleData0208.coefficient13_74,
  OriginalRow227TriangleData0208.coefficient13_75
]

theorem values0208_size : values0208.size = 32 := rfl

def block0208 : ℕ → Option IntervalDyadic := segment 44 values0208

theorem block0208_domain : ExactDomain block0208 44 76 := by
  simpa only [values0208_size] using segment_domain 44 values0208

theorem block0208_get (i : Fin 32) :
    block0208 (44 + i.val) = some (values0208[i.val]'(by rw [values0208_size]; exact i.isLt)) := by
  exact segment_get 44 values0208 ⟨i.val, by rw [values0208_size]; exact i.isLt⟩

def values0209 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0209.coefficient13_76,
  OriginalRow227TriangleData0209.coefficient13_77,
  OriginalRow227TriangleData0209.coefficient13_78,
  OriginalRow227TriangleData0209.coefficient13_79,
  OriginalRow227TriangleData0209.coefficient13_80,
  OriginalRow227TriangleData0209.coefficient13_81,
  OriginalRow227TriangleData0209.coefficient13_82,
  OriginalRow227TriangleData0209.coefficient13_83,
  OriginalRow227TriangleData0209.coefficient13_84,
  OriginalRow227TriangleData0209.coefficient13_85,
  OriginalRow227TriangleData0209.coefficient13_86,
  OriginalRow227TriangleData0209.coefficient13_87,
  OriginalRow227TriangleData0209.coefficient13_88,
  OriginalRow227TriangleData0209.coefficient13_89,
  OriginalRow227TriangleData0209.coefficient13_90,
  OriginalRow227TriangleData0209.coefficient13_91,
  OriginalRow227TriangleData0209.coefficient13_92,
  OriginalRow227TriangleData0209.coefficient13_93,
  OriginalRow227TriangleData0209.coefficient13_94,
  OriginalRow227TriangleData0209.coefficient13_95,
  OriginalRow227TriangleData0209.coefficient13_96,
  OriginalRow227TriangleData0209.coefficient13_97,
  OriginalRow227TriangleData0209.coefficient13_98,
  OriginalRow227TriangleData0209.coefficient13_99,
  OriginalRow227TriangleData0209.coefficient13_100,
  OriginalRow227TriangleData0209.coefficient13_101,
  OriginalRow227TriangleData0209.coefficient13_102,
  OriginalRow227TriangleData0209.coefficient13_103,
  OriginalRow227TriangleData0209.coefficient13_104,
  OriginalRow227TriangleData0209.coefficient13_105,
  OriginalRow227TriangleData0209.coefficient13_106,
  OriginalRow227TriangleData0209.coefficient13_107
]

theorem values0209_size : values0209.size = 32 := rfl

def block0209 : ℕ → Option IntervalDyadic := segment 76 values0209

theorem block0209_domain : ExactDomain block0209 76 108 := by
  simpa only [values0209_size] using segment_domain 76 values0209

theorem block0209_get (i : Fin 32) :
    block0209 (76 + i.val) = some (values0209[i.val]'(by rw [values0209_size]; exact i.isLt)) := by
  exact segment_get 76 values0209 ⟨i.val, by rw [values0209_size]; exact i.isLt⟩

def values0210 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0210.coefficient13_108,
  OriginalRow227TriangleData0210.coefficient13_109,
  OriginalRow227TriangleData0210.coefficient13_110,
  OriginalRow227TriangleData0210.coefficient13_111,
  OriginalRow227TriangleData0210.coefficient13_112,
  OriginalRow227TriangleData0210.coefficient13_113,
  OriginalRow227TriangleData0210.coefficient13_114,
  OriginalRow227TriangleData0210.coefficient13_115,
  OriginalRow227TriangleData0210.coefficient13_116,
  OriginalRow227TriangleData0210.coefficient13_117,
  OriginalRow227TriangleData0210.coefficient13_118,
  OriginalRow227TriangleData0210.coefficient13_119,
  OriginalRow227TriangleData0210.coefficient13_120,
  OriginalRow227TriangleData0210.coefficient13_121,
  OriginalRow227TriangleData0210.coefficient13_122,
  OriginalRow227TriangleData0210.coefficient13_123,
  OriginalRow227TriangleData0210.coefficient13_124,
  OriginalRow227TriangleData0210.coefficient13_125,
  OriginalRow227TriangleData0210.coefficient13_126,
  OriginalRow227TriangleData0210.coefficient13_127,
  OriginalRow227TriangleData0210.coefficient13_128,
  OriginalRow227TriangleData0210.coefficient13_129,
  OriginalRow227TriangleData0210.coefficient13_130,
  OriginalRow227TriangleData0210.coefficient13_131,
  OriginalRow227TriangleData0210.coefficient13_132,
  OriginalRow227TriangleData0210.coefficient13_133,
  OriginalRow227TriangleData0210.coefficient13_134,
  OriginalRow227TriangleData0210.coefficient13_135,
  OriginalRow227TriangleData0210.coefficient13_136,
  OriginalRow227TriangleData0210.coefficient13_137,
  OriginalRow227TriangleData0210.coefficient13_138,
  OriginalRow227TriangleData0210.coefficient13_139
]

theorem values0210_size : values0210.size = 32 := rfl

def block0210 : ℕ → Option IntervalDyadic := segment 108 values0210

theorem block0210_domain : ExactDomain block0210 108 140 := by
  simpa only [values0210_size] using segment_domain 108 values0210

theorem block0210_get (i : Fin 32) :
    block0210 (108 + i.val) = some (values0210[i.val]'(by rw [values0210_size]; exact i.isLt)) := by
  exact segment_get 108 values0210 ⟨i.val, by rw [values0210_size]; exact i.isLt⟩

def values0211 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0211.coefficient13_140,
  OriginalRow227TriangleData0211.coefficient13_141,
  OriginalRow227TriangleData0211.coefficient13_142,
  OriginalRow227TriangleData0211.coefficient13_143,
  OriginalRow227TriangleData0211.coefficient13_144,
  OriginalRow227TriangleData0211.coefficient13_145,
  OriginalRow227TriangleData0211.coefficient13_146,
  OriginalRow227TriangleData0211.coefficient13_147,
  OriginalRow227TriangleData0211.coefficient13_148,
  OriginalRow227TriangleData0211.coefficient13_149,
  OriginalRow227TriangleData0211.coefficient13_150,
  OriginalRow227TriangleData0211.coefficient13_151,
  OriginalRow227TriangleData0211.coefficient13_152,
  OriginalRow227TriangleData0211.coefficient13_153,
  OriginalRow227TriangleData0211.coefficient13_154,
  OriginalRow227TriangleData0211.coefficient13_155,
  OriginalRow227TriangleData0211.coefficient13_156,
  OriginalRow227TriangleData0211.coefficient13_157,
  OriginalRow227TriangleData0211.coefficient13_158,
  OriginalRow227TriangleData0211.coefficient13_159,
  OriginalRow227TriangleData0211.coefficient13_160,
  OriginalRow227TriangleData0211.coefficient13_161,
  OriginalRow227TriangleData0211.coefficient13_162,
  OriginalRow227TriangleData0211.coefficient13_163,
  OriginalRow227TriangleData0211.coefficient13_164,
  OriginalRow227TriangleData0211.coefficient13_165,
  OriginalRow227TriangleData0211.coefficient13_166,
  OriginalRow227TriangleData0211.coefficient13_167,
  OriginalRow227TriangleData0211.coefficient13_168,
  OriginalRow227TriangleData0211.coefficient13_169,
  OriginalRow227TriangleData0211.coefficient13_170,
  OriginalRow227TriangleData0211.coefficient13_171
]

theorem values0211_size : values0211.size = 32 := rfl

def block0211 : ℕ → Option IntervalDyadic := segment 140 values0211

theorem block0211_domain : ExactDomain block0211 140 172 := by
  simpa only [values0211_size] using segment_domain 140 values0211

theorem block0211_get (i : Fin 32) :
    block0211 (140 + i.val) = some (values0211[i.val]'(by rw [values0211_size]; exact i.isLt)) := by
  exact segment_get 140 values0211 ⟨i.val, by rw [values0211_size]; exact i.isLt⟩

def values0212 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0212.coefficient13_172,
  OriginalRow227TriangleData0212.coefficient13_173,
  OriginalRow227TriangleData0212.coefficient13_174,
  OriginalRow227TriangleData0212.coefficient13_175,
  OriginalRow227TriangleData0212.coefficient13_176,
  OriginalRow227TriangleData0212.coefficient13_177,
  OriginalRow227TriangleData0212.coefficient13_178,
  OriginalRow227TriangleData0212.coefficient13_179,
  OriginalRow227TriangleData0212.coefficient13_180,
  OriginalRow227TriangleData0212.coefficient13_181,
  OriginalRow227TriangleData0212.coefficient13_182,
  OriginalRow227TriangleData0212.coefficient13_183,
  OriginalRow227TriangleData0212.coefficient13_184,
  OriginalRow227TriangleData0212.coefficient13_185,
  OriginalRow227TriangleData0212.coefficient13_186,
  OriginalRow227TriangleData0212.coefficient13_187,
  OriginalRow227TriangleData0212.coefficient13_188,
  OriginalRow227TriangleData0212.coefficient13_189,
  OriginalRow227TriangleData0212.coefficient13_190,
  OriginalRow227TriangleData0212.coefficient13_191,
  OriginalRow227TriangleData0212.coefficient13_192,
  OriginalRow227TriangleData0212.coefficient13_193,
  OriginalRow227TriangleData0212.coefficient13_194,
  OriginalRow227TriangleData0212.coefficient13_195,
  OriginalRow227TriangleData0212.coefficient13_196,
  OriginalRow227TriangleData0212.coefficient13_197,
  OriginalRow227TriangleData0212.coefficient13_198,
  OriginalRow227TriangleData0212.coefficient13_199,
  OriginalRow227TriangleData0212.coefficient13_200,
  OriginalRow227TriangleData0212.coefficient13_201,
  OriginalRow227TriangleData0212.coefficient13_202,
  OriginalRow227TriangleData0212.coefficient13_203
]

theorem values0212_size : values0212.size = 32 := rfl

def block0212 : ℕ → Option IntervalDyadic := segment 172 values0212

theorem block0212_domain : ExactDomain block0212 172 204 := by
  simpa only [values0212_size] using segment_domain 172 values0212

theorem block0212_get (i : Fin 32) :
    block0212 (172 + i.val) = some (values0212[i.val]'(by rw [values0212_size]; exact i.isLt)) := by
  exact segment_get 172 values0212 ⟨i.val, by rw [values0212_size]; exact i.isLt⟩

def values0213 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0213.coefficient13_204,
  OriginalRow227TriangleData0213.coefficient13_205,
  OriginalRow227TriangleData0213.coefficient13_206,
  OriginalRow227TriangleData0213.coefficient13_207,
  OriginalRow227TriangleData0213.coefficient13_208,
  OriginalRow227TriangleData0213.coefficient13_209,
  OriginalRow227TriangleData0213.coefficient13_210,
  OriginalRow227TriangleData0213.coefficient13_211,
  OriginalRow227TriangleData0213.coefficient13_212,
  OriginalRow227TriangleData0213.coefficient13_213,
  OriginalRow227TriangleData0213.coefficient13_214,
  OriginalRow227TriangleData0213.coefficient13_215,
  OriginalRow227TriangleData0213.coefficient13_216,
  OriginalRow227TriangleData0213.coefficient13_217,
  OriginalRow227TriangleData0213.coefficient13_218,
  OriginalRow227TriangleData0213.coefficient13_219,
  OriginalRow227TriangleData0213.coefficient13_220,
  OriginalRow227TriangleData0213.coefficient13_221,
  OriginalRow227TriangleData0213.coefficient13_222,
  OriginalRow227TriangleData0213.coefficient13_223,
  OriginalRow227TriangleData0213.coefficient13_224,
  OriginalRow227TriangleData0213.coefficient13_225,
  OriginalRow227TriangleData0213.coefficient13_226,
  OriginalRow227TriangleData0213.coefficient13_227,
  OriginalRow227TriangleData0213.coefficient13_228,
  OriginalRow227TriangleData0213.coefficient13_229,
  OriginalRow227TriangleData0213.coefficient13_230,
  OriginalRow227TriangleData0213.coefficient13_231,
  OriginalRow227TriangleData0213.coefficient13_232,
  OriginalRow227TriangleData0213.coefficient13_233,
  OriginalRow227TriangleData0213.coefficient13_234,
  OriginalRow227TriangleData0213.coefficient13_235
]

theorem values0213_size : values0213.size = 32 := rfl

def block0213 : ℕ → Option IntervalDyadic := segment 204 values0213

theorem block0213_domain : ExactDomain block0213 204 236 := by
  simpa only [values0213_size] using segment_domain 204 values0213

theorem block0213_get (i : Fin 32) :
    block0213 (204 + i.val) = some (values0213[i.val]'(by rw [values0213_size]; exact i.isLt)) := by
  exact segment_get 204 values0213 ⟨i.val, by rw [values0213_size]; exact i.isLt⟩

def values0214 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0214.coefficient13_236,
  OriginalRow227TriangleData0214.coefficient13_237,
  OriginalRow227TriangleData0214.coefficient13_238,
  OriginalRow227TriangleData0214.coefficient13_239,
  OriginalRow227TriangleData0214.coefficient13_240,
  OriginalRow227TriangleData0214.coefficient13_241,
  OriginalRow227TriangleData0214.coefficient13_242,
  OriginalRow227TriangleData0214.coefficient13_243,
  OriginalRow227TriangleData0214.coefficient13_244,
  OriginalRow227TriangleData0214.coefficient13_245,
  OriginalRow227TriangleData0214.coefficient13_246,
  OriginalRow227TriangleData0214.coefficient13_247,
  OriginalRow227TriangleData0214.coefficient13_248,
  OriginalRow227TriangleData0214.coefficient13_249,
  OriginalRow227TriangleData0214.coefficient13_250,
  OriginalRow227TriangleData0214.coefficient13_251,
  OriginalRow227TriangleData0214.coefficient13_252,
  OriginalRow227TriangleData0214.coefficient13_253,
  OriginalRow227TriangleData0214.coefficient13_254,
  OriginalRow227TriangleData0214.coefficient13_255,
  OriginalRow227TriangleData0214.coefficient13_256,
  OriginalRow227TriangleData0214.coefficient13_257,
  OriginalRow227TriangleData0214.coefficient13_258,
  OriginalRow227TriangleData0214.coefficient13_259,
  OriginalRow227TriangleData0214.coefficient13_260,
  OriginalRow227TriangleData0214.coefficient13_261,
  OriginalRow227TriangleData0214.coefficient13_262,
  OriginalRow227TriangleData0214.coefficient13_263,
  OriginalRow227TriangleData0214.coefficient13_264,
  OriginalRow227TriangleData0214.coefficient13_265,
  OriginalRow227TriangleData0214.coefficient13_266,
  OriginalRow227TriangleData0214.coefficient13_267
]

theorem values0214_size : values0214.size = 32 := rfl

def block0214 : ℕ → Option IntervalDyadic := segment 236 values0214

theorem block0214_domain : ExactDomain block0214 236 268 := by
  simpa only [values0214_size] using segment_domain 236 values0214

theorem block0214_get (i : Fin 32) :
    block0214 (236 + i.val) = some (values0214[i.val]'(by rw [values0214_size]; exact i.isLt)) := by
  exact segment_get 236 values0214 ⟨i.val, by rw [values0214_size]; exact i.isLt⟩

def values0215 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0215.coefficient13_268,
  OriginalRow227TriangleData0215.coefficient13_269,
  OriginalRow227TriangleData0215.coefficient13_270,
  OriginalRow227TriangleData0215.coefficient13_271,
  OriginalRow227TriangleData0215.coefficient13_272,
  OriginalRow227TriangleData0215.coefficient13_273,
  OriginalRow227TriangleData0215.coefficient13_274,
  OriginalRow227TriangleData0215.coefficient13_275,
  OriginalRow227TriangleData0215.coefficient13_276,
  OriginalRow227TriangleData0215.coefficient13_277,
  OriginalRow227TriangleData0215.coefficient13_278,
  OriginalRow227TriangleData0215.coefficient13_279,
  OriginalRow227TriangleData0215.coefficient13_280,
  OriginalRow227TriangleData0215.coefficient13_281,
  OriginalRow227TriangleData0215.coefficient13_282,
  OriginalRow227TriangleData0215.coefficient13_283,
  OriginalRow227TriangleData0215.coefficient13_284,
  OriginalRow227TriangleData0215.coefficient13_285,
  OriginalRow227TriangleData0215.coefficient13_286,
  OriginalRow227TriangleData0215.coefficient13_287,
  OriginalRow227TriangleData0215.coefficient13_288,
  OriginalRow227TriangleData0215.coefficient13_289,
  OriginalRow227TriangleData0215.coefficient13_290,
  OriginalRow227TriangleData0215.coefficient13_291,
  OriginalRow227TriangleData0215.coefficient13_292,
  OriginalRow227TriangleData0215.coefficient13_293,
  OriginalRow227TriangleData0215.coefficient13_294,
  OriginalRow227TriangleData0215.coefficient13_295,
  OriginalRow227TriangleData0215.coefficient13_296,
  OriginalRow227TriangleData0215.coefficient13_297,
  OriginalRow227TriangleData0215.coefficient13_298,
  OriginalRow227TriangleData0215.coefficient13_299
]

theorem values0215_size : values0215.size = 32 := rfl

def block0215 : ℕ → Option IntervalDyadic := segment 268 values0215

theorem block0215_domain : ExactDomain block0215 268 300 := by
  simpa only [values0215_size] using segment_domain 268 values0215

theorem block0215_get (i : Fin 32) :
    block0215 (268 + i.val) = some (values0215[i.val]'(by rw [values0215_size]; exact i.isLt)) := by
  exact segment_get 268 values0215 ⟨i.val, by rw [values0215_size]; exact i.isLt⟩

def values0216 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0216.coefficient13_300,
  OriginalRow227TriangleData0216.coefficient13_301,
  OriginalRow227TriangleData0216.coefficient13_302,
  OriginalRow227TriangleData0216.coefficient13_303,
  OriginalRow227TriangleData0216.coefficient13_304,
  OriginalRow227TriangleData0216.coefficient13_305,
  OriginalRow227TriangleData0216.coefficient13_306,
  OriginalRow227TriangleData0216.coefficient13_307,
  OriginalRow227TriangleData0216.coefficient13_308,
  OriginalRow227TriangleData0216.coefficient13_309,
  OriginalRow227TriangleData0216.coefficient13_310,
  OriginalRow227TriangleData0216.coefficient13_311,
  OriginalRow227TriangleData0216.coefficient13_312,
  OriginalRow227TriangleData0216.coefficient13_313,
  OriginalRow227TriangleData0216.coefficient13_314,
  OriginalRow227TriangleData0216.coefficient13_315,
  OriginalRow227TriangleData0216.coefficient13_316,
  OriginalRow227TriangleData0216.coefficient13_317,
  OriginalRow227TriangleData0216.coefficient13_318,
  OriginalRow227TriangleData0216.coefficient13_319,
  OriginalRow227TriangleData0216.coefficient13_320,
  OriginalRow227TriangleData0216.coefficient13_321,
  OriginalRow227TriangleData0216.coefficient13_322,
  OriginalRow227TriangleData0216.coefficient13_323,
  OriginalRow227TriangleData0216.coefficient13_324,
  OriginalRow227TriangleData0216.coefficient13_325,
  OriginalRow227TriangleData0216.coefficient13_326,
  OriginalRow227TriangleData0216.coefficient13_327,
  OriginalRow227TriangleData0216.coefficient13_328,
  OriginalRow227TriangleData0216.coefficient13_329,
  OriginalRow227TriangleData0216.coefficient13_330,
  OriginalRow227TriangleData0216.coefficient13_331
]

theorem values0216_size : values0216.size = 32 := rfl

def block0216 : ℕ → Option IntervalDyadic := segment 300 values0216

theorem block0216_domain : ExactDomain block0216 300 332 := by
  simpa only [values0216_size] using segment_domain 300 values0216

theorem block0216_get (i : Fin 32) :
    block0216 (300 + i.val) = some (values0216[i.val]'(by rw [values0216_size]; exact i.isLt)) := by
  exact segment_get 300 values0216 ⟨i.val, by rw [values0216_size]; exact i.isLt⟩

def values0217 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0217.coefficient13_332,
  OriginalRow227TriangleData0217.coefficient13_333,
  OriginalRow227TriangleData0217.coefficient13_334,
  OriginalRow227TriangleData0217.coefficient13_335,
  OriginalRow227TriangleData0217.coefficient13_336,
  OriginalRow227TriangleData0217.coefficient13_337,
  OriginalRow227TriangleData0217.coefficient13_338,
  OriginalRow227TriangleData0217.coefficient13_339,
  OriginalRow227TriangleData0217.coefficient13_340,
  OriginalRow227TriangleData0217.coefficient13_341,
  OriginalRow227TriangleData0217.coefficient13_342,
  OriginalRow227TriangleData0217.coefficient13_343,
  OriginalRow227TriangleData0217.coefficient13_344,
  OriginalRow227TriangleData0217.coefficient13_345,
  OriginalRow227TriangleData0217.coefficient13_346,
  OriginalRow227TriangleData0217.coefficient13_347,
  OriginalRow227TriangleData0217.coefficient13_348,
  OriginalRow227TriangleData0217.coefficient13_349,
  OriginalRow227TriangleData0217.coefficient13_350,
  OriginalRow227TriangleData0217.coefficient13_351,
  OriginalRow227TriangleData0217.coefficient13_352,
  OriginalRow227TriangleData0217.coefficient13_353,
  OriginalRow227TriangleData0217.coefficient13_354,
  OriginalRow227TriangleData0217.coefficient13_355,
  OriginalRow227TriangleData0217.coefficient13_356,
  OriginalRow227TriangleData0217.coefficient13_357,
  OriginalRow227TriangleData0217.coefficient13_358,
  OriginalRow227TriangleData0217.coefficient13_359,
  OriginalRow227TriangleData0217.coefficient13_360,
  OriginalRow227TriangleData0217.coefficient13_361,
  OriginalRow227TriangleData0217.coefficient13_362,
  OriginalRow227TriangleData0217.coefficient13_363
]

theorem values0217_size : values0217.size = 32 := rfl

def block0217 : ℕ → Option IntervalDyadic := segment 332 values0217

theorem block0217_domain : ExactDomain block0217 332 364 := by
  simpa only [values0217_size] using segment_domain 332 values0217

theorem block0217_get (i : Fin 32) :
    block0217 (332 + i.val) = some (values0217[i.val]'(by rw [values0217_size]; exact i.isLt)) := by
  exact segment_get 332 values0217 ⟨i.val, by rw [values0217_size]; exact i.isLt⟩

def values0218 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0218.coefficient13_364,
  OriginalRow227TriangleData0218.coefficient13_365,
  OriginalRow227TriangleData0218.coefficient13_366,
  OriginalRow227TriangleData0218.coefficient13_367,
  OriginalRow227TriangleData0218.coefficient13_368,
  OriginalRow227TriangleData0218.coefficient13_369,
  OriginalRow227TriangleData0218.coefficient13_370,
  OriginalRow227TriangleData0218.coefficient13_371,
  OriginalRow227TriangleData0218.coefficient13_372,
  OriginalRow227TriangleData0218.coefficient13_373,
  OriginalRow227TriangleData0218.coefficient13_374,
  OriginalRow227TriangleData0218.coefficient13_375,
  OriginalRow227TriangleData0218.coefficient13_376,
  OriginalRow227TriangleData0218.coefficient13_377,
  OriginalRow227TriangleData0218.coefficient13_378,
  OriginalRow227TriangleData0218.coefficient13_379,
  OriginalRow227TriangleData0218.coefficient13_380,
  OriginalRow227TriangleData0218.coefficient13_381,
  OriginalRow227TriangleData0218.coefficient13_382,
  OriginalRow227TriangleData0218.coefficient13_383,
  OriginalRow227TriangleData0218.coefficient13_384,
  OriginalRow227TriangleData0218.coefficient13_385,
  OriginalRow227TriangleData0218.coefficient13_386,
  OriginalRow227TriangleData0218.coefficient13_387,
  OriginalRow227TriangleData0218.coefficient13_388,
  OriginalRow227TriangleData0218.coefficient13_389,
  OriginalRow227TriangleData0218.coefficient13_390,
  OriginalRow227TriangleData0218.coefficient13_391,
  OriginalRow227TriangleData0218.coefficient13_392,
  OriginalRow227TriangleData0218.coefficient13_393,
  OriginalRow227TriangleData0218.coefficient13_394,
  OriginalRow227TriangleData0218.coefficient13_395
]

theorem values0218_size : values0218.size = 32 := rfl

def block0218 : ℕ → Option IntervalDyadic := segment 364 values0218

theorem block0218_domain : ExactDomain block0218 364 396 := by
  simpa only [values0218_size] using segment_domain 364 values0218

theorem block0218_get (i : Fin 32) :
    block0218 (364 + i.val) = some (values0218[i.val]'(by rw [values0218_size]; exact i.isLt)) := by
  exact segment_get 364 values0218 ⟨i.val, by rw [values0218_size]; exact i.isLt⟩

def values0219 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0219.coefficient13_396,
  OriginalRow227TriangleData0219.coefficient13_397,
  OriginalRow227TriangleData0219.coefficient13_398,
  OriginalRow227TriangleData0219.coefficient13_399,
  OriginalRow227TriangleData0219.coefficient13_400,
  OriginalRow227TriangleData0219.coefficient13_401,
  OriginalRow227TriangleData0219.coefficient13_402,
  OriginalRow227TriangleData0219.coefficient13_403,
  OriginalRow227TriangleData0219.coefficient13_404,
  OriginalRow227TriangleData0219.coefficient13_405,
  OriginalRow227TriangleData0219.coefficient13_406,
  OriginalRow227TriangleData0219.coefficient13_407,
  OriginalRow227TriangleData0219.coefficient13_408,
  OriginalRow227TriangleData0219.coefficient13_409,
  OriginalRow227TriangleData0219.coefficient13_410,
  OriginalRow227TriangleData0219.coefficient13_411,
  OriginalRow227TriangleData0219.coefficient13_412,
  OriginalRow227TriangleData0219.coefficient13_413,
  OriginalRow227TriangleData0219.coefficient13_414,
  OriginalRow227TriangleData0219.coefficient13_415,
  OriginalRow227TriangleData0219.coefficient13_416,
  OriginalRow227TriangleData0219.coefficient13_417,
  OriginalRow227TriangleData0219.coefficient13_418,
  OriginalRow227TriangleData0219.coefficient13_419,
  OriginalRow227TriangleData0219.coefficient13_420,
  OriginalRow227TriangleData0219.coefficient13_421,
  OriginalRow227TriangleData0219.coefficient13_422,
  OriginalRow227TriangleData0219.coefficient13_423,
  OriginalRow227TriangleData0219.coefficient13_424,
  OriginalRow227TriangleData0219.coefficient13_425,
  OriginalRow227TriangleData0219.coefficient13_426,
  OriginalRow227TriangleData0219.coefficient13_427
]

theorem values0219_size : values0219.size = 32 := rfl

def block0219 : ℕ → Option IntervalDyadic := segment 396 values0219

theorem block0219_domain : ExactDomain block0219 396 428 := by
  simpa only [values0219_size] using segment_domain 396 values0219

theorem block0219_get (i : Fin 32) :
    block0219 (396 + i.val) = some (values0219[i.val]'(by rw [values0219_size]; exact i.isLt)) := by
  exact segment_get 396 values0219 ⟨i.val, by rw [values0219_size]; exact i.isLt⟩

def values0220 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0220.coefficient13_428,
  OriginalRow227TriangleData0220.coefficient13_429,
  OriginalRow227TriangleData0220.coefficient13_430,
  OriginalRow227TriangleData0220.coefficient13_431,
  OriginalRow227TriangleData0220.coefficient13_432,
  OriginalRow227TriangleData0220.coefficient13_433,
  OriginalRow227TriangleData0220.coefficient13_434,
  OriginalRow227TriangleData0220.coefficient13_435,
  OriginalRow227TriangleData0220.coefficient13_436,
  OriginalRow227TriangleData0220.coefficient13_437,
  OriginalRow227TriangleData0220.coefficient13_438,
  OriginalRow227TriangleData0220.coefficient13_439,
  OriginalRow227TriangleData0220.coefficient13_440,
  OriginalRow227TriangleData0220.coefficient13_441,
  OriginalRow227TriangleData0220.coefficient13_442,
  OriginalRow227TriangleData0220.coefficient13_443,
  OriginalRow227TriangleData0220.coefficient13_444,
  OriginalRow227TriangleData0220.coefficient13_445,
  OriginalRow227TriangleData0220.coefficient13_446,
  OriginalRow227TriangleData0220.coefficient13_447,
  OriginalRow227TriangleData0220.coefficient13_448,
  OriginalRow227TriangleData0220.coefficient13_449,
  OriginalRow227TriangleData0220.coefficient13_450,
  OriginalRow227TriangleData0220.coefficient13_451,
  OriginalRow227TriangleData0220.coefficient13_452,
  OriginalRow227TriangleData0220.coefficient13_453,
  OriginalRow227TriangleData0220.coefficient13_454,
  OriginalRow227TriangleData0220.coefficient13_455,
  OriginalRow227TriangleData0220.coefficient13_456,
  OriginalRow227TriangleData0220.coefficient13_457,
  OriginalRow227TriangleData0220.coefficient13_458,
  OriginalRow227TriangleData0220.coefficient13_459
]

theorem values0220_size : values0220.size = 32 := rfl

def block0220 : ℕ → Option IntervalDyadic := segment 428 values0220

theorem block0220_domain : ExactDomain block0220 428 460 := by
  simpa only [values0220_size] using segment_domain 428 values0220

theorem block0220_get (i : Fin 32) :
    block0220 (428 + i.val) = some (values0220[i.val]'(by rw [values0220_size]; exact i.isLt)) := by
  exact segment_get 428 values0220 ⟨i.val, by rw [values0220_size]; exact i.isLt⟩

def values0221 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0221.coefficient13_460,
  OriginalRow227TriangleData0221.coefficient13_461,
  OriginalRow227TriangleData0221.coefficient13_462,
  OriginalRow227TriangleData0221.coefficient13_463,
  OriginalRow227TriangleData0221.coefficient13_464,
  OriginalRow227TriangleData0221.coefficient13_465,
  OriginalRow227TriangleData0221.coefficient13_466,
  OriginalRow227TriangleData0221.coefficient13_467,
  OriginalRow227TriangleData0221.coefficient13_468,
  OriginalRow227TriangleData0221.coefficient13_469,
  OriginalRow227TriangleData0221.coefficient13_470,
  OriginalRow227TriangleData0221.coefficient13_471,
  OriginalRow227TriangleData0221.coefficient13_472,
  OriginalRow227TriangleData0221.coefficient13_473,
  OriginalRow227TriangleData0221.coefficient13_474,
  OriginalRow227TriangleData0221.coefficient13_475,
  OriginalRow227TriangleData0221.coefficient13_476,
  OriginalRow227TriangleData0221.coefficient13_477,
  OriginalRow227TriangleData0221.coefficient13_478,
  OriginalRow227TriangleData0221.coefficient13_479,
  OriginalRow227TriangleData0221.coefficient13_480,
  OriginalRow227TriangleData0221.coefficient13_481,
  OriginalRow227TriangleData0221.coefficient13_482,
  OriginalRow227TriangleData0221.coefficient13_483,
  OriginalRow227TriangleData0221.coefficient13_484,
  OriginalRow227TriangleData0221.coefficient13_485,
  OriginalRow227TriangleData0221.coefficient13_486,
  OriginalRow227TriangleData0221.coefficient13_487,
  OriginalRow227TriangleData0221.coefficient13_488
]

theorem values0221_size : values0221.size = 29 := rfl

def block0221 : ℕ → Option IntervalDyadic := segment 460 values0221

theorem block0221_domain : ExactDomain block0221 460 489 := by
  simpa only [values0221_size] using segment_domain 460 values0221

theorem block0221_get (i : Fin 29) :
    block0221 (460 + i.val) = some (values0221[i.val]'(by rw [values0221_size]; exact i.isLt)) := by
  exact segment_get 460 values0221 ⟨i.val, by rw [values0221_size]; exact i.isLt⟩

def node0044_0108 : ℕ → Option IntervalDyadic := split 76 block0208 block0209

theorem node0044_0108_domain : ExactDomain node0044_0108 44 108 := by
  exact split_domain (by decide) (by decide) block0208_domain block0209_domain

def node0012_0108 : ℕ → Option IntervalDyadic := split 44 block0207 node0044_0108

theorem node0012_0108_domain : ExactDomain node0012_0108 12 108 := by
  exact split_domain (by decide) (by decide) block0207_domain node0044_0108_domain

def node0108_0172 : ℕ → Option IntervalDyadic := split 140 block0210 block0211

theorem node0108_0172_domain : ExactDomain node0108_0172 108 172 := by
  exact split_domain (by decide) (by decide) block0210_domain block0211_domain

def node0172_0236 : ℕ → Option IntervalDyadic := split 204 block0212 block0213

theorem node0172_0236_domain : ExactDomain node0172_0236 172 236 := by
  exact split_domain (by decide) (by decide) block0212_domain block0213_domain

def node0108_0236 : ℕ → Option IntervalDyadic := split 172 node0108_0172 node0172_0236

theorem node0108_0236_domain : ExactDomain node0108_0236 108 236 := by
  exact split_domain (by decide) (by decide) node0108_0172_domain node0172_0236_domain

def node0012_0236 : ℕ → Option IntervalDyadic := split 108 node0012_0108 node0108_0236

theorem node0012_0236_domain : ExactDomain node0012_0236 12 236 := by
  exact split_domain (by decide) (by decide) node0012_0108_domain node0108_0236_domain

def node0236_0300 : ℕ → Option IntervalDyadic := split 268 block0214 block0215

theorem node0236_0300_domain : ExactDomain node0236_0300 236 300 := by
  exact split_domain (by decide) (by decide) block0214_domain block0215_domain

def node0300_0364 : ℕ → Option IntervalDyadic := split 332 block0216 block0217

theorem node0300_0364_domain : ExactDomain node0300_0364 300 364 := by
  exact split_domain (by decide) (by decide) block0216_domain block0217_domain

def node0236_0364 : ℕ → Option IntervalDyadic := split 300 node0236_0300 node0300_0364

theorem node0236_0364_domain : ExactDomain node0236_0364 236 364 := by
  exact split_domain (by decide) (by decide) node0236_0300_domain node0300_0364_domain

def node0364_0428 : ℕ → Option IntervalDyadic := split 396 block0218 block0219

theorem node0364_0428_domain : ExactDomain node0364_0428 364 428 := by
  exact split_domain (by decide) (by decide) block0218_domain block0219_domain

def node0428_0489 : ℕ → Option IntervalDyadic := split 460 block0220 block0221

theorem node0428_0489_domain : ExactDomain node0428_0489 428 489 := by
  exact split_domain (by decide) (by decide) block0220_domain block0221_domain

def node0364_0489 : ℕ → Option IntervalDyadic := split 428 node0364_0428 node0428_0489

theorem node0364_0489_domain : ExactDomain node0364_0489 364 489 := by
  exact split_domain (by decide) (by decide) node0364_0428_domain node0428_0489_domain

def node0236_0489 : ℕ → Option IntervalDyadic := split 364 node0236_0364 node0364_0489

theorem node0236_0489_domain : ExactDomain node0236_0489 236 489 := by
  exact split_domain (by decide) (by decide) node0236_0364_domain node0364_0489_domain

def node0012_0489 : ℕ → Option IntervalDyadic := split 236 node0012_0236 node0236_0489

theorem node0012_0489_domain : ExactDomain node0012_0489 12 489 := by
  exact split_domain (by decide) (by decide) node0012_0236_domain node0236_0489_domain

def lookup : ℕ → Option IntervalDyadic := node0012_0489

theorem lookup_domain : ExactDomain lookup 12 489 :=
  node0012_0489_domain

theorem block0207_lookup (i : Fin 32) :
    lookup (12 + i.val) = some (values0207[i.val]'(by rw [values0207_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (12 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_left 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0012_0108, split_left 44 block0207 node0044_0108 (by omega)]
  exact block0207_get i

theorem block0208_lookup (i : Fin 32) :
    lookup (44 + i.val) = some (values0208[i.val]'(by rw [values0208_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (44 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_left 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0012_0108, split_right 44 block0207 node0044_0108 (by omega)]
  rw [node0044_0108, split_left 76 block0208 block0209 (by omega)]
  exact block0208_get i

theorem block0209_lookup (i : Fin 32) :
    lookup (76 + i.val) = some (values0209[i.val]'(by rw [values0209_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (76 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_left 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0012_0108, split_right 44 block0207 node0044_0108 (by omega)]
  rw [node0044_0108, split_right 76 block0208 block0209 (by omega)]
  exact block0209_get i

theorem block0210_lookup (i : Fin 32) :
    lookup (108 + i.val) = some (values0210[i.val]'(by rw [values0210_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (108 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_right 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0108_0236, split_left 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0108_0172, split_left 140 block0210 block0211 (by omega)]
  exact block0210_get i

theorem block0211_lookup (i : Fin 32) :
    lookup (140 + i.val) = some (values0211[i.val]'(by rw [values0211_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (140 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_right 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0108_0236, split_left 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0108_0172, split_right 140 block0210 block0211 (by omega)]
  exact block0211_get i

theorem block0212_lookup (i : Fin 32) :
    lookup (172 + i.val) = some (values0212[i.val]'(by rw [values0212_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (172 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_right 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0108_0236, split_right 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0172_0236, split_left 204 block0212 block0213 (by omega)]
  exact block0212_get i

theorem block0213_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values0213[i.val]'(by rw [values0213_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (204 + i.val) = _
  rw [node0012_0489, split_left 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0012_0236, split_right 108 node0012_0108 node0108_0236 (by omega)]
  rw [node0108_0236, split_right 172 node0108_0172 node0172_0236 (by omega)]
  rw [node0172_0236, split_right 204 block0212 block0213 (by omega)]
  exact block0213_get i

theorem block0214_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values0214[i.val]'(by rw [values0214_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (236 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_left 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0236_0364, split_left 300 node0236_0300 node0300_0364 (by omega)]
  rw [node0236_0300, split_left 268 block0214 block0215 (by omega)]
  exact block0214_get i

theorem block0215_lookup (i : Fin 32) :
    lookup (268 + i.val) = some (values0215[i.val]'(by rw [values0215_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (268 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_left 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0236_0364, split_left 300 node0236_0300 node0300_0364 (by omega)]
  rw [node0236_0300, split_right 268 block0214 block0215 (by omega)]
  exact block0215_get i

theorem block0216_lookup (i : Fin 32) :
    lookup (300 + i.val) = some (values0216[i.val]'(by rw [values0216_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (300 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_left 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0236_0364, split_right 300 node0236_0300 node0300_0364 (by omega)]
  rw [node0300_0364, split_left 332 block0216 block0217 (by omega)]
  exact block0216_get i

theorem block0217_lookup (i : Fin 32) :
    lookup (332 + i.val) = some (values0217[i.val]'(by rw [values0217_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (332 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_left 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0236_0364, split_right 300 node0236_0300 node0300_0364 (by omega)]
  rw [node0300_0364, split_right 332 block0216 block0217 (by omega)]
  exact block0217_get i

theorem block0218_lookup (i : Fin 32) :
    lookup (364 + i.val) = some (values0218[i.val]'(by rw [values0218_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (364 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_right 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0364_0489, split_left 428 node0364_0428 node0428_0489 (by omega)]
  rw [node0364_0428, split_left 396 block0218 block0219 (by omega)]
  exact block0218_get i

theorem block0219_lookup (i : Fin 32) :
    lookup (396 + i.val) = some (values0219[i.val]'(by rw [values0219_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (396 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_right 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0364_0489, split_left 428 node0364_0428 node0428_0489 (by omega)]
  rw [node0364_0428, split_right 396 block0218 block0219 (by omega)]
  exact block0219_get i

theorem block0220_lookup (i : Fin 32) :
    lookup (428 + i.val) = some (values0220[i.val]'(by rw [values0220_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (428 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_right 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0364_0489, split_right 428 node0364_0428 node0428_0489 (by omega)]
  rw [node0428_0489, split_left 460 block0220 block0221 (by omega)]
  exact block0220_get i

theorem block0221_lookup (i : Fin 29) :
    lookup (460 + i.val) = some (values0221[i.val]'(by rw [values0221_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0012_0489 (460 + i.val) = _
  rw [node0012_0489, split_right 236 node0012_0236 node0236_0489 (by omega)]
  rw [node0236_0489, split_right 364 node0236_0364 node0364_0489 (by omega)]
  rw [node0364_0489, split_right 428 node0364_0428 node0428_0489 (by omega)]
  rw [node0428_0489, split_right 460 block0220 block0221 (by omega)]
  exact block0221_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0207_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0207_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0208_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0208_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0209_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0209_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0210_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0210_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0211_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0211_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0212_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0212_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0213_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0213_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0214_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0214_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0215_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0215_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0216_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0216_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0217_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0217_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0218_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0218_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0219_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0219_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0220_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0220_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0221_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0221_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0207_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0208_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0209_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0210_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0211_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0212_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0213_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0214_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0215_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0216_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0217_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0218_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0219_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0220_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow013.block0221_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow013
