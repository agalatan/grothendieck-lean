import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0252
import Grothe.UpperChaos.OriginalRow227TriangleData0253
import Grothe.UpperChaos.OriginalRow227TriangleData0254
import Grothe.UpperChaos.OriginalRow227TriangleData0255
import Grothe.UpperChaos.OriginalRow227TriangleData0256
import Grothe.UpperChaos.OriginalRow227TriangleData0257
import Grothe.UpperChaos.OriginalRow227TriangleData0258
import Grothe.UpperChaos.OriginalRow227TriangleData0259
import Grothe.UpperChaos.OriginalRow227TriangleData0260
import Grothe.UpperChaos.OriginalRow227TriangleData0261
import Grothe.UpperChaos.OriginalRow227TriangleData0262
import Grothe.UpperChaos.OriginalRow227TriangleData0263
import Grothe.UpperChaos.OriginalRow227TriangleData0264
import Grothe.UpperChaos.OriginalRow227TriangleData0265
import Grothe.UpperChaos.OriginalRow227TriangleData0266

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow016

open ConditionalTableLookup

def values0252 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0252.coefficient16_15,
  OriginalRow227TriangleData0252.coefficient16_16,
  OriginalRow227TriangleData0252.coefficient16_17,
  OriginalRow227TriangleData0252.coefficient16_18,
  OriginalRow227TriangleData0252.coefficient16_19,
  OriginalRow227TriangleData0252.coefficient16_20,
  OriginalRow227TriangleData0252.coefficient16_21,
  OriginalRow227TriangleData0252.coefficient16_22,
  OriginalRow227TriangleData0252.coefficient16_23,
  OriginalRow227TriangleData0252.coefficient16_24,
  OriginalRow227TriangleData0252.coefficient16_25,
  OriginalRow227TriangleData0252.coefficient16_26,
  OriginalRow227TriangleData0252.coefficient16_27,
  OriginalRow227TriangleData0252.coefficient16_28,
  OriginalRow227TriangleData0252.coefficient16_29,
  OriginalRow227TriangleData0252.coefficient16_30,
  OriginalRow227TriangleData0252.coefficient16_31,
  OriginalRow227TriangleData0252.coefficient16_32,
  OriginalRow227TriangleData0252.coefficient16_33,
  OriginalRow227TriangleData0252.coefficient16_34,
  OriginalRow227TriangleData0252.coefficient16_35,
  OriginalRow227TriangleData0252.coefficient16_36,
  OriginalRow227TriangleData0252.coefficient16_37,
  OriginalRow227TriangleData0252.coefficient16_38,
  OriginalRow227TriangleData0252.coefficient16_39,
  OriginalRow227TriangleData0252.coefficient16_40,
  OriginalRow227TriangleData0252.coefficient16_41,
  OriginalRow227TriangleData0252.coefficient16_42,
  OriginalRow227TriangleData0252.coefficient16_43,
  OriginalRow227TriangleData0252.coefficient16_44,
  OriginalRow227TriangleData0252.coefficient16_45,
  OriginalRow227TriangleData0252.coefficient16_46
]

theorem values0252_size : values0252.size = 32 := rfl

def block0252 : ℕ → Option IntervalDyadic := segment 15 values0252

theorem block0252_domain : ExactDomain block0252 15 47 := by
  simpa only [values0252_size] using segment_domain 15 values0252

theorem block0252_get (i : Fin 32) :
    block0252 (15 + i.val) = some (values0252[i.val]'(by rw [values0252_size]; exact i.isLt)) := by
  exact segment_get 15 values0252 ⟨i.val, by rw [values0252_size]; exact i.isLt⟩

def values0253 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0253.coefficient16_47,
  OriginalRow227TriangleData0253.coefficient16_48,
  OriginalRow227TriangleData0253.coefficient16_49,
  OriginalRow227TriangleData0253.coefficient16_50,
  OriginalRow227TriangleData0253.coefficient16_51,
  OriginalRow227TriangleData0253.coefficient16_52,
  OriginalRow227TriangleData0253.coefficient16_53,
  OriginalRow227TriangleData0253.coefficient16_54,
  OriginalRow227TriangleData0253.coefficient16_55,
  OriginalRow227TriangleData0253.coefficient16_56,
  OriginalRow227TriangleData0253.coefficient16_57,
  OriginalRow227TriangleData0253.coefficient16_58,
  OriginalRow227TriangleData0253.coefficient16_59,
  OriginalRow227TriangleData0253.coefficient16_60,
  OriginalRow227TriangleData0253.coefficient16_61,
  OriginalRow227TriangleData0253.coefficient16_62,
  OriginalRow227TriangleData0253.coefficient16_63,
  OriginalRow227TriangleData0253.coefficient16_64,
  OriginalRow227TriangleData0253.coefficient16_65,
  OriginalRow227TriangleData0253.coefficient16_66,
  OriginalRow227TriangleData0253.coefficient16_67,
  OriginalRow227TriangleData0253.coefficient16_68,
  OriginalRow227TriangleData0253.coefficient16_69,
  OriginalRow227TriangleData0253.coefficient16_70,
  OriginalRow227TriangleData0253.coefficient16_71,
  OriginalRow227TriangleData0253.coefficient16_72,
  OriginalRow227TriangleData0253.coefficient16_73,
  OriginalRow227TriangleData0253.coefficient16_74,
  OriginalRow227TriangleData0253.coefficient16_75,
  OriginalRow227TriangleData0253.coefficient16_76,
  OriginalRow227TriangleData0253.coefficient16_77,
  OriginalRow227TriangleData0253.coefficient16_78
]

theorem values0253_size : values0253.size = 32 := rfl

def block0253 : ℕ → Option IntervalDyadic := segment 47 values0253

theorem block0253_domain : ExactDomain block0253 47 79 := by
  simpa only [values0253_size] using segment_domain 47 values0253

theorem block0253_get (i : Fin 32) :
    block0253 (47 + i.val) = some (values0253[i.val]'(by rw [values0253_size]; exact i.isLt)) := by
  exact segment_get 47 values0253 ⟨i.val, by rw [values0253_size]; exact i.isLt⟩

def values0254 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0254.coefficient16_79,
  OriginalRow227TriangleData0254.coefficient16_80,
  OriginalRow227TriangleData0254.coefficient16_81,
  OriginalRow227TriangleData0254.coefficient16_82,
  OriginalRow227TriangleData0254.coefficient16_83,
  OriginalRow227TriangleData0254.coefficient16_84,
  OriginalRow227TriangleData0254.coefficient16_85,
  OriginalRow227TriangleData0254.coefficient16_86,
  OriginalRow227TriangleData0254.coefficient16_87,
  OriginalRow227TriangleData0254.coefficient16_88,
  OriginalRow227TriangleData0254.coefficient16_89,
  OriginalRow227TriangleData0254.coefficient16_90,
  OriginalRow227TriangleData0254.coefficient16_91,
  OriginalRow227TriangleData0254.coefficient16_92,
  OriginalRow227TriangleData0254.coefficient16_93,
  OriginalRow227TriangleData0254.coefficient16_94,
  OriginalRow227TriangleData0254.coefficient16_95,
  OriginalRow227TriangleData0254.coefficient16_96,
  OriginalRow227TriangleData0254.coefficient16_97,
  OriginalRow227TriangleData0254.coefficient16_98,
  OriginalRow227TriangleData0254.coefficient16_99,
  OriginalRow227TriangleData0254.coefficient16_100,
  OriginalRow227TriangleData0254.coefficient16_101,
  OriginalRow227TriangleData0254.coefficient16_102,
  OriginalRow227TriangleData0254.coefficient16_103,
  OriginalRow227TriangleData0254.coefficient16_104,
  OriginalRow227TriangleData0254.coefficient16_105,
  OriginalRow227TriangleData0254.coefficient16_106,
  OriginalRow227TriangleData0254.coefficient16_107,
  OriginalRow227TriangleData0254.coefficient16_108,
  OriginalRow227TriangleData0254.coefficient16_109,
  OriginalRow227TriangleData0254.coefficient16_110
]

theorem values0254_size : values0254.size = 32 := rfl

def block0254 : ℕ → Option IntervalDyadic := segment 79 values0254

theorem block0254_domain : ExactDomain block0254 79 111 := by
  simpa only [values0254_size] using segment_domain 79 values0254

theorem block0254_get (i : Fin 32) :
    block0254 (79 + i.val) = some (values0254[i.val]'(by rw [values0254_size]; exact i.isLt)) := by
  exact segment_get 79 values0254 ⟨i.val, by rw [values0254_size]; exact i.isLt⟩

def values0255 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0255.coefficient16_111,
  OriginalRow227TriangleData0255.coefficient16_112,
  OriginalRow227TriangleData0255.coefficient16_113,
  OriginalRow227TriangleData0255.coefficient16_114,
  OriginalRow227TriangleData0255.coefficient16_115,
  OriginalRow227TriangleData0255.coefficient16_116,
  OriginalRow227TriangleData0255.coefficient16_117,
  OriginalRow227TriangleData0255.coefficient16_118,
  OriginalRow227TriangleData0255.coefficient16_119,
  OriginalRow227TriangleData0255.coefficient16_120,
  OriginalRow227TriangleData0255.coefficient16_121,
  OriginalRow227TriangleData0255.coefficient16_122,
  OriginalRow227TriangleData0255.coefficient16_123,
  OriginalRow227TriangleData0255.coefficient16_124,
  OriginalRow227TriangleData0255.coefficient16_125,
  OriginalRow227TriangleData0255.coefficient16_126,
  OriginalRow227TriangleData0255.coefficient16_127,
  OriginalRow227TriangleData0255.coefficient16_128,
  OriginalRow227TriangleData0255.coefficient16_129,
  OriginalRow227TriangleData0255.coefficient16_130,
  OriginalRow227TriangleData0255.coefficient16_131,
  OriginalRow227TriangleData0255.coefficient16_132,
  OriginalRow227TriangleData0255.coefficient16_133,
  OriginalRow227TriangleData0255.coefficient16_134,
  OriginalRow227TriangleData0255.coefficient16_135,
  OriginalRow227TriangleData0255.coefficient16_136,
  OriginalRow227TriangleData0255.coefficient16_137,
  OriginalRow227TriangleData0255.coefficient16_138,
  OriginalRow227TriangleData0255.coefficient16_139,
  OriginalRow227TriangleData0255.coefficient16_140,
  OriginalRow227TriangleData0255.coefficient16_141,
  OriginalRow227TriangleData0255.coefficient16_142
]

theorem values0255_size : values0255.size = 32 := rfl

def block0255 : ℕ → Option IntervalDyadic := segment 111 values0255

theorem block0255_domain : ExactDomain block0255 111 143 := by
  simpa only [values0255_size] using segment_domain 111 values0255

theorem block0255_get (i : Fin 32) :
    block0255 (111 + i.val) = some (values0255[i.val]'(by rw [values0255_size]; exact i.isLt)) := by
  exact segment_get 111 values0255 ⟨i.val, by rw [values0255_size]; exact i.isLt⟩

def values0256 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0256.coefficient16_143,
  OriginalRow227TriangleData0256.coefficient16_144,
  OriginalRow227TriangleData0256.coefficient16_145,
  OriginalRow227TriangleData0256.coefficient16_146,
  OriginalRow227TriangleData0256.coefficient16_147,
  OriginalRow227TriangleData0256.coefficient16_148,
  OriginalRow227TriangleData0256.coefficient16_149,
  OriginalRow227TriangleData0256.coefficient16_150,
  OriginalRow227TriangleData0256.coefficient16_151,
  OriginalRow227TriangleData0256.coefficient16_152,
  OriginalRow227TriangleData0256.coefficient16_153,
  OriginalRow227TriangleData0256.coefficient16_154,
  OriginalRow227TriangleData0256.coefficient16_155,
  OriginalRow227TriangleData0256.coefficient16_156,
  OriginalRow227TriangleData0256.coefficient16_157,
  OriginalRow227TriangleData0256.coefficient16_158,
  OriginalRow227TriangleData0256.coefficient16_159,
  OriginalRow227TriangleData0256.coefficient16_160,
  OriginalRow227TriangleData0256.coefficient16_161,
  OriginalRow227TriangleData0256.coefficient16_162,
  OriginalRow227TriangleData0256.coefficient16_163,
  OriginalRow227TriangleData0256.coefficient16_164,
  OriginalRow227TriangleData0256.coefficient16_165,
  OriginalRow227TriangleData0256.coefficient16_166,
  OriginalRow227TriangleData0256.coefficient16_167,
  OriginalRow227TriangleData0256.coefficient16_168,
  OriginalRow227TriangleData0256.coefficient16_169,
  OriginalRow227TriangleData0256.coefficient16_170,
  OriginalRow227TriangleData0256.coefficient16_171,
  OriginalRow227TriangleData0256.coefficient16_172,
  OriginalRow227TriangleData0256.coefficient16_173,
  OriginalRow227TriangleData0256.coefficient16_174
]

theorem values0256_size : values0256.size = 32 := rfl

def block0256 : ℕ → Option IntervalDyadic := segment 143 values0256

theorem block0256_domain : ExactDomain block0256 143 175 := by
  simpa only [values0256_size] using segment_domain 143 values0256

theorem block0256_get (i : Fin 32) :
    block0256 (143 + i.val) = some (values0256[i.val]'(by rw [values0256_size]; exact i.isLt)) := by
  exact segment_get 143 values0256 ⟨i.val, by rw [values0256_size]; exact i.isLt⟩

def values0257 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0257.coefficient16_175,
  OriginalRow227TriangleData0257.coefficient16_176,
  OriginalRow227TriangleData0257.coefficient16_177,
  OriginalRow227TriangleData0257.coefficient16_178,
  OriginalRow227TriangleData0257.coefficient16_179,
  OriginalRow227TriangleData0257.coefficient16_180,
  OriginalRow227TriangleData0257.coefficient16_181,
  OriginalRow227TriangleData0257.coefficient16_182,
  OriginalRow227TriangleData0257.coefficient16_183,
  OriginalRow227TriangleData0257.coefficient16_184,
  OriginalRow227TriangleData0257.coefficient16_185,
  OriginalRow227TriangleData0257.coefficient16_186,
  OriginalRow227TriangleData0257.coefficient16_187,
  OriginalRow227TriangleData0257.coefficient16_188,
  OriginalRow227TriangleData0257.coefficient16_189,
  OriginalRow227TriangleData0257.coefficient16_190,
  OriginalRow227TriangleData0257.coefficient16_191,
  OriginalRow227TriangleData0257.coefficient16_192,
  OriginalRow227TriangleData0257.coefficient16_193,
  OriginalRow227TriangleData0257.coefficient16_194,
  OriginalRow227TriangleData0257.coefficient16_195,
  OriginalRow227TriangleData0257.coefficient16_196,
  OriginalRow227TriangleData0257.coefficient16_197,
  OriginalRow227TriangleData0257.coefficient16_198,
  OriginalRow227TriangleData0257.coefficient16_199,
  OriginalRow227TriangleData0257.coefficient16_200,
  OriginalRow227TriangleData0257.coefficient16_201,
  OriginalRow227TriangleData0257.coefficient16_202,
  OriginalRow227TriangleData0257.coefficient16_203,
  OriginalRow227TriangleData0257.coefficient16_204,
  OriginalRow227TriangleData0257.coefficient16_205,
  OriginalRow227TriangleData0257.coefficient16_206
]

theorem values0257_size : values0257.size = 32 := rfl

def block0257 : ℕ → Option IntervalDyadic := segment 175 values0257

theorem block0257_domain : ExactDomain block0257 175 207 := by
  simpa only [values0257_size] using segment_domain 175 values0257

theorem block0257_get (i : Fin 32) :
    block0257 (175 + i.val) = some (values0257[i.val]'(by rw [values0257_size]; exact i.isLt)) := by
  exact segment_get 175 values0257 ⟨i.val, by rw [values0257_size]; exact i.isLt⟩

def values0258 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0258.coefficient16_207,
  OriginalRow227TriangleData0258.coefficient16_208,
  OriginalRow227TriangleData0258.coefficient16_209,
  OriginalRow227TriangleData0258.coefficient16_210,
  OriginalRow227TriangleData0258.coefficient16_211,
  OriginalRow227TriangleData0258.coefficient16_212,
  OriginalRow227TriangleData0258.coefficient16_213,
  OriginalRow227TriangleData0258.coefficient16_214,
  OriginalRow227TriangleData0258.coefficient16_215,
  OriginalRow227TriangleData0258.coefficient16_216,
  OriginalRow227TriangleData0258.coefficient16_217,
  OriginalRow227TriangleData0258.coefficient16_218,
  OriginalRow227TriangleData0258.coefficient16_219,
  OriginalRow227TriangleData0258.coefficient16_220,
  OriginalRow227TriangleData0258.coefficient16_221,
  OriginalRow227TriangleData0258.coefficient16_222,
  OriginalRow227TriangleData0258.coefficient16_223,
  OriginalRow227TriangleData0258.coefficient16_224,
  OriginalRow227TriangleData0258.coefficient16_225,
  OriginalRow227TriangleData0258.coefficient16_226,
  OriginalRow227TriangleData0258.coefficient16_227,
  OriginalRow227TriangleData0258.coefficient16_228,
  OriginalRow227TriangleData0258.coefficient16_229,
  OriginalRow227TriangleData0258.coefficient16_230,
  OriginalRow227TriangleData0258.coefficient16_231,
  OriginalRow227TriangleData0258.coefficient16_232,
  OriginalRow227TriangleData0258.coefficient16_233,
  OriginalRow227TriangleData0258.coefficient16_234,
  OriginalRow227TriangleData0258.coefficient16_235,
  OriginalRow227TriangleData0258.coefficient16_236,
  OriginalRow227TriangleData0258.coefficient16_237,
  OriginalRow227TriangleData0258.coefficient16_238
]

theorem values0258_size : values0258.size = 32 := rfl

def block0258 : ℕ → Option IntervalDyadic := segment 207 values0258

theorem block0258_domain : ExactDomain block0258 207 239 := by
  simpa only [values0258_size] using segment_domain 207 values0258

theorem block0258_get (i : Fin 32) :
    block0258 (207 + i.val) = some (values0258[i.val]'(by rw [values0258_size]; exact i.isLt)) := by
  exact segment_get 207 values0258 ⟨i.val, by rw [values0258_size]; exact i.isLt⟩

def values0259 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0259.coefficient16_239,
  OriginalRow227TriangleData0259.coefficient16_240,
  OriginalRow227TriangleData0259.coefficient16_241,
  OriginalRow227TriangleData0259.coefficient16_242,
  OriginalRow227TriangleData0259.coefficient16_243,
  OriginalRow227TriangleData0259.coefficient16_244,
  OriginalRow227TriangleData0259.coefficient16_245,
  OriginalRow227TriangleData0259.coefficient16_246,
  OriginalRow227TriangleData0259.coefficient16_247,
  OriginalRow227TriangleData0259.coefficient16_248,
  OriginalRow227TriangleData0259.coefficient16_249,
  OriginalRow227TriangleData0259.coefficient16_250,
  OriginalRow227TriangleData0259.coefficient16_251,
  OriginalRow227TriangleData0259.coefficient16_252,
  OriginalRow227TriangleData0259.coefficient16_253,
  OriginalRow227TriangleData0259.coefficient16_254,
  OriginalRow227TriangleData0259.coefficient16_255,
  OriginalRow227TriangleData0259.coefficient16_256,
  OriginalRow227TriangleData0259.coefficient16_257,
  OriginalRow227TriangleData0259.coefficient16_258,
  OriginalRow227TriangleData0259.coefficient16_259,
  OriginalRow227TriangleData0259.coefficient16_260,
  OriginalRow227TriangleData0259.coefficient16_261,
  OriginalRow227TriangleData0259.coefficient16_262,
  OriginalRow227TriangleData0259.coefficient16_263,
  OriginalRow227TriangleData0259.coefficient16_264,
  OriginalRow227TriangleData0259.coefficient16_265,
  OriginalRow227TriangleData0259.coefficient16_266,
  OriginalRow227TriangleData0259.coefficient16_267,
  OriginalRow227TriangleData0259.coefficient16_268,
  OriginalRow227TriangleData0259.coefficient16_269,
  OriginalRow227TriangleData0259.coefficient16_270
]

theorem values0259_size : values0259.size = 32 := rfl

def block0259 : ℕ → Option IntervalDyadic := segment 239 values0259

theorem block0259_domain : ExactDomain block0259 239 271 := by
  simpa only [values0259_size] using segment_domain 239 values0259

theorem block0259_get (i : Fin 32) :
    block0259 (239 + i.val) = some (values0259[i.val]'(by rw [values0259_size]; exact i.isLt)) := by
  exact segment_get 239 values0259 ⟨i.val, by rw [values0259_size]; exact i.isLt⟩

def values0260 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0260.coefficient16_271,
  OriginalRow227TriangleData0260.coefficient16_272,
  OriginalRow227TriangleData0260.coefficient16_273,
  OriginalRow227TriangleData0260.coefficient16_274,
  OriginalRow227TriangleData0260.coefficient16_275,
  OriginalRow227TriangleData0260.coefficient16_276,
  OriginalRow227TriangleData0260.coefficient16_277,
  OriginalRow227TriangleData0260.coefficient16_278,
  OriginalRow227TriangleData0260.coefficient16_279,
  OriginalRow227TriangleData0260.coefficient16_280,
  OriginalRow227TriangleData0260.coefficient16_281,
  OriginalRow227TriangleData0260.coefficient16_282,
  OriginalRow227TriangleData0260.coefficient16_283,
  OriginalRow227TriangleData0260.coefficient16_284,
  OriginalRow227TriangleData0260.coefficient16_285,
  OriginalRow227TriangleData0260.coefficient16_286,
  OriginalRow227TriangleData0260.coefficient16_287,
  OriginalRow227TriangleData0260.coefficient16_288,
  OriginalRow227TriangleData0260.coefficient16_289,
  OriginalRow227TriangleData0260.coefficient16_290,
  OriginalRow227TriangleData0260.coefficient16_291,
  OriginalRow227TriangleData0260.coefficient16_292,
  OriginalRow227TriangleData0260.coefficient16_293,
  OriginalRow227TriangleData0260.coefficient16_294,
  OriginalRow227TriangleData0260.coefficient16_295,
  OriginalRow227TriangleData0260.coefficient16_296,
  OriginalRow227TriangleData0260.coefficient16_297,
  OriginalRow227TriangleData0260.coefficient16_298,
  OriginalRow227TriangleData0260.coefficient16_299,
  OriginalRow227TriangleData0260.coefficient16_300,
  OriginalRow227TriangleData0260.coefficient16_301,
  OriginalRow227TriangleData0260.coefficient16_302
]

theorem values0260_size : values0260.size = 32 := rfl

def block0260 : ℕ → Option IntervalDyadic := segment 271 values0260

theorem block0260_domain : ExactDomain block0260 271 303 := by
  simpa only [values0260_size] using segment_domain 271 values0260

theorem block0260_get (i : Fin 32) :
    block0260 (271 + i.val) = some (values0260[i.val]'(by rw [values0260_size]; exact i.isLt)) := by
  exact segment_get 271 values0260 ⟨i.val, by rw [values0260_size]; exact i.isLt⟩

def values0261 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0261.coefficient16_303,
  OriginalRow227TriangleData0261.coefficient16_304,
  OriginalRow227TriangleData0261.coefficient16_305,
  OriginalRow227TriangleData0261.coefficient16_306,
  OriginalRow227TriangleData0261.coefficient16_307,
  OriginalRow227TriangleData0261.coefficient16_308,
  OriginalRow227TriangleData0261.coefficient16_309,
  OriginalRow227TriangleData0261.coefficient16_310,
  OriginalRow227TriangleData0261.coefficient16_311,
  OriginalRow227TriangleData0261.coefficient16_312,
  OriginalRow227TriangleData0261.coefficient16_313,
  OriginalRow227TriangleData0261.coefficient16_314,
  OriginalRow227TriangleData0261.coefficient16_315,
  OriginalRow227TriangleData0261.coefficient16_316,
  OriginalRow227TriangleData0261.coefficient16_317,
  OriginalRow227TriangleData0261.coefficient16_318,
  OriginalRow227TriangleData0261.coefficient16_319,
  OriginalRow227TriangleData0261.coefficient16_320,
  OriginalRow227TriangleData0261.coefficient16_321,
  OriginalRow227TriangleData0261.coefficient16_322,
  OriginalRow227TriangleData0261.coefficient16_323,
  OriginalRow227TriangleData0261.coefficient16_324,
  OriginalRow227TriangleData0261.coefficient16_325,
  OriginalRow227TriangleData0261.coefficient16_326,
  OriginalRow227TriangleData0261.coefficient16_327,
  OriginalRow227TriangleData0261.coefficient16_328,
  OriginalRow227TriangleData0261.coefficient16_329,
  OriginalRow227TriangleData0261.coefficient16_330,
  OriginalRow227TriangleData0261.coefficient16_331,
  OriginalRow227TriangleData0261.coefficient16_332,
  OriginalRow227TriangleData0261.coefficient16_333,
  OriginalRow227TriangleData0261.coefficient16_334
]

theorem values0261_size : values0261.size = 32 := rfl

def block0261 : ℕ → Option IntervalDyadic := segment 303 values0261

theorem block0261_domain : ExactDomain block0261 303 335 := by
  simpa only [values0261_size] using segment_domain 303 values0261

theorem block0261_get (i : Fin 32) :
    block0261 (303 + i.val) = some (values0261[i.val]'(by rw [values0261_size]; exact i.isLt)) := by
  exact segment_get 303 values0261 ⟨i.val, by rw [values0261_size]; exact i.isLt⟩

def values0262 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0262.coefficient16_335,
  OriginalRow227TriangleData0262.coefficient16_336,
  OriginalRow227TriangleData0262.coefficient16_337,
  OriginalRow227TriangleData0262.coefficient16_338,
  OriginalRow227TriangleData0262.coefficient16_339,
  OriginalRow227TriangleData0262.coefficient16_340,
  OriginalRow227TriangleData0262.coefficient16_341,
  OriginalRow227TriangleData0262.coefficient16_342,
  OriginalRow227TriangleData0262.coefficient16_343,
  OriginalRow227TriangleData0262.coefficient16_344,
  OriginalRow227TriangleData0262.coefficient16_345,
  OriginalRow227TriangleData0262.coefficient16_346,
  OriginalRow227TriangleData0262.coefficient16_347,
  OriginalRow227TriangleData0262.coefficient16_348,
  OriginalRow227TriangleData0262.coefficient16_349,
  OriginalRow227TriangleData0262.coefficient16_350,
  OriginalRow227TriangleData0262.coefficient16_351,
  OriginalRow227TriangleData0262.coefficient16_352,
  OriginalRow227TriangleData0262.coefficient16_353,
  OriginalRow227TriangleData0262.coefficient16_354,
  OriginalRow227TriangleData0262.coefficient16_355,
  OriginalRow227TriangleData0262.coefficient16_356,
  OriginalRow227TriangleData0262.coefficient16_357,
  OriginalRow227TriangleData0262.coefficient16_358,
  OriginalRow227TriangleData0262.coefficient16_359,
  OriginalRow227TriangleData0262.coefficient16_360,
  OriginalRow227TriangleData0262.coefficient16_361,
  OriginalRow227TriangleData0262.coefficient16_362,
  OriginalRow227TriangleData0262.coefficient16_363,
  OriginalRow227TriangleData0262.coefficient16_364,
  OriginalRow227TriangleData0262.coefficient16_365,
  OriginalRow227TriangleData0262.coefficient16_366
]

theorem values0262_size : values0262.size = 32 := rfl

def block0262 : ℕ → Option IntervalDyadic := segment 335 values0262

theorem block0262_domain : ExactDomain block0262 335 367 := by
  simpa only [values0262_size] using segment_domain 335 values0262

theorem block0262_get (i : Fin 32) :
    block0262 (335 + i.val) = some (values0262[i.val]'(by rw [values0262_size]; exact i.isLt)) := by
  exact segment_get 335 values0262 ⟨i.val, by rw [values0262_size]; exact i.isLt⟩

def values0263 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0263.coefficient16_367,
  OriginalRow227TriangleData0263.coefficient16_368,
  OriginalRow227TriangleData0263.coefficient16_369,
  OriginalRow227TriangleData0263.coefficient16_370,
  OriginalRow227TriangleData0263.coefficient16_371,
  OriginalRow227TriangleData0263.coefficient16_372,
  OriginalRow227TriangleData0263.coefficient16_373,
  OriginalRow227TriangleData0263.coefficient16_374,
  OriginalRow227TriangleData0263.coefficient16_375,
  OriginalRow227TriangleData0263.coefficient16_376,
  OriginalRow227TriangleData0263.coefficient16_377,
  OriginalRow227TriangleData0263.coefficient16_378,
  OriginalRow227TriangleData0263.coefficient16_379,
  OriginalRow227TriangleData0263.coefficient16_380,
  OriginalRow227TriangleData0263.coefficient16_381,
  OriginalRow227TriangleData0263.coefficient16_382,
  OriginalRow227TriangleData0263.coefficient16_383,
  OriginalRow227TriangleData0263.coefficient16_384,
  OriginalRow227TriangleData0263.coefficient16_385,
  OriginalRow227TriangleData0263.coefficient16_386,
  OriginalRow227TriangleData0263.coefficient16_387,
  OriginalRow227TriangleData0263.coefficient16_388,
  OriginalRow227TriangleData0263.coefficient16_389,
  OriginalRow227TriangleData0263.coefficient16_390,
  OriginalRow227TriangleData0263.coefficient16_391,
  OriginalRow227TriangleData0263.coefficient16_392,
  OriginalRow227TriangleData0263.coefficient16_393,
  OriginalRow227TriangleData0263.coefficient16_394,
  OriginalRow227TriangleData0263.coefficient16_395,
  OriginalRow227TriangleData0263.coefficient16_396,
  OriginalRow227TriangleData0263.coefficient16_397,
  OriginalRow227TriangleData0263.coefficient16_398
]

theorem values0263_size : values0263.size = 32 := rfl

def block0263 : ℕ → Option IntervalDyadic := segment 367 values0263

theorem block0263_domain : ExactDomain block0263 367 399 := by
  simpa only [values0263_size] using segment_domain 367 values0263

theorem block0263_get (i : Fin 32) :
    block0263 (367 + i.val) = some (values0263[i.val]'(by rw [values0263_size]; exact i.isLt)) := by
  exact segment_get 367 values0263 ⟨i.val, by rw [values0263_size]; exact i.isLt⟩

def values0264 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0264.coefficient16_399,
  OriginalRow227TriangleData0264.coefficient16_400,
  OriginalRow227TriangleData0264.coefficient16_401,
  OriginalRow227TriangleData0264.coefficient16_402,
  OriginalRow227TriangleData0264.coefficient16_403,
  OriginalRow227TriangleData0264.coefficient16_404,
  OriginalRow227TriangleData0264.coefficient16_405,
  OriginalRow227TriangleData0264.coefficient16_406,
  OriginalRow227TriangleData0264.coefficient16_407,
  OriginalRow227TriangleData0264.coefficient16_408,
  OriginalRow227TriangleData0264.coefficient16_409,
  OriginalRow227TriangleData0264.coefficient16_410,
  OriginalRow227TriangleData0264.coefficient16_411,
  OriginalRow227TriangleData0264.coefficient16_412,
  OriginalRow227TriangleData0264.coefficient16_413,
  OriginalRow227TriangleData0264.coefficient16_414,
  OriginalRow227TriangleData0264.coefficient16_415,
  OriginalRow227TriangleData0264.coefficient16_416,
  OriginalRow227TriangleData0264.coefficient16_417,
  OriginalRow227TriangleData0264.coefficient16_418,
  OriginalRow227TriangleData0264.coefficient16_419,
  OriginalRow227TriangleData0264.coefficient16_420,
  OriginalRow227TriangleData0264.coefficient16_421,
  OriginalRow227TriangleData0264.coefficient16_422,
  OriginalRow227TriangleData0264.coefficient16_423,
  OriginalRow227TriangleData0264.coefficient16_424,
  OriginalRow227TriangleData0264.coefficient16_425,
  OriginalRow227TriangleData0264.coefficient16_426,
  OriginalRow227TriangleData0264.coefficient16_427,
  OriginalRow227TriangleData0264.coefficient16_428,
  OriginalRow227TriangleData0264.coefficient16_429,
  OriginalRow227TriangleData0264.coefficient16_430
]

theorem values0264_size : values0264.size = 32 := rfl

def block0264 : ℕ → Option IntervalDyadic := segment 399 values0264

theorem block0264_domain : ExactDomain block0264 399 431 := by
  simpa only [values0264_size] using segment_domain 399 values0264

theorem block0264_get (i : Fin 32) :
    block0264 (399 + i.val) = some (values0264[i.val]'(by rw [values0264_size]; exact i.isLt)) := by
  exact segment_get 399 values0264 ⟨i.val, by rw [values0264_size]; exact i.isLt⟩

def values0265 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0265.coefficient16_431,
  OriginalRow227TriangleData0265.coefficient16_432,
  OriginalRow227TriangleData0265.coefficient16_433,
  OriginalRow227TriangleData0265.coefficient16_434,
  OriginalRow227TriangleData0265.coefficient16_435,
  OriginalRow227TriangleData0265.coefficient16_436,
  OriginalRow227TriangleData0265.coefficient16_437,
  OriginalRow227TriangleData0265.coefficient16_438,
  OriginalRow227TriangleData0265.coefficient16_439,
  OriginalRow227TriangleData0265.coefficient16_440,
  OriginalRow227TriangleData0265.coefficient16_441,
  OriginalRow227TriangleData0265.coefficient16_442,
  OriginalRow227TriangleData0265.coefficient16_443,
  OriginalRow227TriangleData0265.coefficient16_444,
  OriginalRow227TriangleData0265.coefficient16_445,
  OriginalRow227TriangleData0265.coefficient16_446,
  OriginalRow227TriangleData0265.coefficient16_447,
  OriginalRow227TriangleData0265.coefficient16_448,
  OriginalRow227TriangleData0265.coefficient16_449,
  OriginalRow227TriangleData0265.coefficient16_450,
  OriginalRow227TriangleData0265.coefficient16_451,
  OriginalRow227TriangleData0265.coefficient16_452,
  OriginalRow227TriangleData0265.coefficient16_453,
  OriginalRow227TriangleData0265.coefficient16_454,
  OriginalRow227TriangleData0265.coefficient16_455,
  OriginalRow227TriangleData0265.coefficient16_456,
  OriginalRow227TriangleData0265.coefficient16_457,
  OriginalRow227TriangleData0265.coefficient16_458,
  OriginalRow227TriangleData0265.coefficient16_459,
  OriginalRow227TriangleData0265.coefficient16_460,
  OriginalRow227TriangleData0265.coefficient16_461,
  OriginalRow227TriangleData0265.coefficient16_462
]

theorem values0265_size : values0265.size = 32 := rfl

def block0265 : ℕ → Option IntervalDyadic := segment 431 values0265

theorem block0265_domain : ExactDomain block0265 431 463 := by
  simpa only [values0265_size] using segment_domain 431 values0265

theorem block0265_get (i : Fin 32) :
    block0265 (431 + i.val) = some (values0265[i.val]'(by rw [values0265_size]; exact i.isLt)) := by
  exact segment_get 431 values0265 ⟨i.val, by rw [values0265_size]; exact i.isLt⟩

def values0266 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0266.coefficient16_463,
  OriginalRow227TriangleData0266.coefficient16_464,
  OriginalRow227TriangleData0266.coefficient16_465,
  OriginalRow227TriangleData0266.coefficient16_466,
  OriginalRow227TriangleData0266.coefficient16_467,
  OriginalRow227TriangleData0266.coefficient16_468,
  OriginalRow227TriangleData0266.coefficient16_469,
  OriginalRow227TriangleData0266.coefficient16_470,
  OriginalRow227TriangleData0266.coefficient16_471,
  OriginalRow227TriangleData0266.coefficient16_472,
  OriginalRow227TriangleData0266.coefficient16_473,
  OriginalRow227TriangleData0266.coefficient16_474,
  OriginalRow227TriangleData0266.coefficient16_475,
  OriginalRow227TriangleData0266.coefficient16_476,
  OriginalRow227TriangleData0266.coefficient16_477,
  OriginalRow227TriangleData0266.coefficient16_478,
  OriginalRow227TriangleData0266.coefficient16_479,
  OriginalRow227TriangleData0266.coefficient16_480,
  OriginalRow227TriangleData0266.coefficient16_481,
  OriginalRow227TriangleData0266.coefficient16_482,
  OriginalRow227TriangleData0266.coefficient16_483,
  OriginalRow227TriangleData0266.coefficient16_484,
  OriginalRow227TriangleData0266.coefficient16_485
]

theorem values0266_size : values0266.size = 23 := rfl

def block0266 : ℕ → Option IntervalDyadic := segment 463 values0266

theorem block0266_domain : ExactDomain block0266 463 486 := by
  simpa only [values0266_size] using segment_domain 463 values0266

theorem block0266_get (i : Fin 23) :
    block0266 (463 + i.val) = some (values0266[i.val]'(by rw [values0266_size]; exact i.isLt)) := by
  exact segment_get 463 values0266 ⟨i.val, by rw [values0266_size]; exact i.isLt⟩

def node0047_0111 : ℕ → Option IntervalDyadic := split 79 block0253 block0254

theorem node0047_0111_domain : ExactDomain node0047_0111 47 111 := by
  exact split_domain (by decide) (by decide) block0253_domain block0254_domain

def node0015_0111 : ℕ → Option IntervalDyadic := split 47 block0252 node0047_0111

theorem node0015_0111_domain : ExactDomain node0015_0111 15 111 := by
  exact split_domain (by decide) (by decide) block0252_domain node0047_0111_domain

def node0111_0175 : ℕ → Option IntervalDyadic := split 143 block0255 block0256

theorem node0111_0175_domain : ExactDomain node0111_0175 111 175 := by
  exact split_domain (by decide) (by decide) block0255_domain block0256_domain

def node0175_0239 : ℕ → Option IntervalDyadic := split 207 block0257 block0258

theorem node0175_0239_domain : ExactDomain node0175_0239 175 239 := by
  exact split_domain (by decide) (by decide) block0257_domain block0258_domain

def node0111_0239 : ℕ → Option IntervalDyadic := split 175 node0111_0175 node0175_0239

theorem node0111_0239_domain : ExactDomain node0111_0239 111 239 := by
  exact split_domain (by decide) (by decide) node0111_0175_domain node0175_0239_domain

def node0015_0239 : ℕ → Option IntervalDyadic := split 111 node0015_0111 node0111_0239

theorem node0015_0239_domain : ExactDomain node0015_0239 15 239 := by
  exact split_domain (by decide) (by decide) node0015_0111_domain node0111_0239_domain

def node0239_0303 : ℕ → Option IntervalDyadic := split 271 block0259 block0260

theorem node0239_0303_domain : ExactDomain node0239_0303 239 303 := by
  exact split_domain (by decide) (by decide) block0259_domain block0260_domain

def node0303_0367 : ℕ → Option IntervalDyadic := split 335 block0261 block0262

theorem node0303_0367_domain : ExactDomain node0303_0367 303 367 := by
  exact split_domain (by decide) (by decide) block0261_domain block0262_domain

def node0239_0367 : ℕ → Option IntervalDyadic := split 303 node0239_0303 node0303_0367

theorem node0239_0367_domain : ExactDomain node0239_0367 239 367 := by
  exact split_domain (by decide) (by decide) node0239_0303_domain node0303_0367_domain

def node0367_0431 : ℕ → Option IntervalDyadic := split 399 block0263 block0264

theorem node0367_0431_domain : ExactDomain node0367_0431 367 431 := by
  exact split_domain (by decide) (by decide) block0263_domain block0264_domain

def node0431_0486 : ℕ → Option IntervalDyadic := split 463 block0265 block0266

theorem node0431_0486_domain : ExactDomain node0431_0486 431 486 := by
  exact split_domain (by decide) (by decide) block0265_domain block0266_domain

def node0367_0486 : ℕ → Option IntervalDyadic := split 431 node0367_0431 node0431_0486

theorem node0367_0486_domain : ExactDomain node0367_0486 367 486 := by
  exact split_domain (by decide) (by decide) node0367_0431_domain node0431_0486_domain

def node0239_0486 : ℕ → Option IntervalDyadic := split 367 node0239_0367 node0367_0486

theorem node0239_0486_domain : ExactDomain node0239_0486 239 486 := by
  exact split_domain (by decide) (by decide) node0239_0367_domain node0367_0486_domain

def node0015_0486 : ℕ → Option IntervalDyadic := split 239 node0015_0239 node0239_0486

theorem node0015_0486_domain : ExactDomain node0015_0486 15 486 := by
  exact split_domain (by decide) (by decide) node0015_0239_domain node0239_0486_domain

def lookup : ℕ → Option IntervalDyadic := node0015_0486

theorem lookup_domain : ExactDomain lookup 15 486 :=
  node0015_0486_domain

theorem block0252_lookup (i : Fin 32) :
    lookup (15 + i.val) = some (values0252[i.val]'(by rw [values0252_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (15 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_left 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0015_0111, split_left 47 block0252 node0047_0111 (by omega)]
  exact block0252_get i

theorem block0253_lookup (i : Fin 32) :
    lookup (47 + i.val) = some (values0253[i.val]'(by rw [values0253_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (47 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_left 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0015_0111, split_right 47 block0252 node0047_0111 (by omega)]
  rw [node0047_0111, split_left 79 block0253 block0254 (by omega)]
  exact block0253_get i

theorem block0254_lookup (i : Fin 32) :
    lookup (79 + i.val) = some (values0254[i.val]'(by rw [values0254_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (79 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_left 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0015_0111, split_right 47 block0252 node0047_0111 (by omega)]
  rw [node0047_0111, split_right 79 block0253 block0254 (by omega)]
  exact block0254_get i

theorem block0255_lookup (i : Fin 32) :
    lookup (111 + i.val) = some (values0255[i.val]'(by rw [values0255_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (111 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_right 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0111_0239, split_left 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0111_0175, split_left 143 block0255 block0256 (by omega)]
  exact block0255_get i

theorem block0256_lookup (i : Fin 32) :
    lookup (143 + i.val) = some (values0256[i.val]'(by rw [values0256_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (143 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_right 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0111_0239, split_left 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0111_0175, split_right 143 block0255 block0256 (by omega)]
  exact block0256_get i

theorem block0257_lookup (i : Fin 32) :
    lookup (175 + i.val) = some (values0257[i.val]'(by rw [values0257_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (175 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_right 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0111_0239, split_right 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0175_0239, split_left 207 block0257 block0258 (by omega)]
  exact block0257_get i

theorem block0258_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values0258[i.val]'(by rw [values0258_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (207 + i.val) = _
  rw [node0015_0486, split_left 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0015_0239, split_right 111 node0015_0111 node0111_0239 (by omega)]
  rw [node0111_0239, split_right 175 node0111_0175 node0175_0239 (by omega)]
  rw [node0175_0239, split_right 207 block0257 block0258 (by omega)]
  exact block0258_get i

theorem block0259_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values0259[i.val]'(by rw [values0259_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (239 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_left 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0239_0367, split_left 303 node0239_0303 node0303_0367 (by omega)]
  rw [node0239_0303, split_left 271 block0259 block0260 (by omega)]
  exact block0259_get i

theorem block0260_lookup (i : Fin 32) :
    lookup (271 + i.val) = some (values0260[i.val]'(by rw [values0260_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (271 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_left 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0239_0367, split_left 303 node0239_0303 node0303_0367 (by omega)]
  rw [node0239_0303, split_right 271 block0259 block0260 (by omega)]
  exact block0260_get i

theorem block0261_lookup (i : Fin 32) :
    lookup (303 + i.val) = some (values0261[i.val]'(by rw [values0261_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (303 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_left 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0239_0367, split_right 303 node0239_0303 node0303_0367 (by omega)]
  rw [node0303_0367, split_left 335 block0261 block0262 (by omega)]
  exact block0261_get i

theorem block0262_lookup (i : Fin 32) :
    lookup (335 + i.val) = some (values0262[i.val]'(by rw [values0262_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (335 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_left 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0239_0367, split_right 303 node0239_0303 node0303_0367 (by omega)]
  rw [node0303_0367, split_right 335 block0261 block0262 (by omega)]
  exact block0262_get i

theorem block0263_lookup (i : Fin 32) :
    lookup (367 + i.val) = some (values0263[i.val]'(by rw [values0263_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (367 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_right 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0367_0486, split_left 431 node0367_0431 node0431_0486 (by omega)]
  rw [node0367_0431, split_left 399 block0263 block0264 (by omega)]
  exact block0263_get i

theorem block0264_lookup (i : Fin 32) :
    lookup (399 + i.val) = some (values0264[i.val]'(by rw [values0264_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (399 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_right 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0367_0486, split_left 431 node0367_0431 node0431_0486 (by omega)]
  rw [node0367_0431, split_right 399 block0263 block0264 (by omega)]
  exact block0264_get i

theorem block0265_lookup (i : Fin 32) :
    lookup (431 + i.val) = some (values0265[i.val]'(by rw [values0265_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (431 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_right 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0367_0486, split_right 431 node0367_0431 node0431_0486 (by omega)]
  rw [node0431_0486, split_left 463 block0265 block0266 (by omega)]
  exact block0265_get i

theorem block0266_lookup (i : Fin 23) :
    lookup (463 + i.val) = some (values0266[i.val]'(by rw [values0266_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0015_0486 (463 + i.val) = _
  rw [node0015_0486, split_right 239 node0015_0239 node0239_0486 (by omega)]
  rw [node0239_0486, split_right 367 node0239_0367 node0367_0486 (by omega)]
  rw [node0367_0486, split_right 431 node0367_0431 node0431_0486 (by omega)]
  rw [node0431_0486, split_right 463 block0265 block0266 (by omega)]
  exact block0266_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0252_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0252_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0253_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0253_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0254_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0254_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0255_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0255_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0256_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0256_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0257_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0257_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0258_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0258_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0259_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0259_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0260_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0260_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0261_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0261_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0262_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0262_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0263_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0263_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0264_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0264_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0265_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0265_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0266_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0266_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0252_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0253_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0254_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0255_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0256_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0257_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0258_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0259_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0260_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0261_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0262_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0263_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0264_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0265_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow016.block0266_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow016
