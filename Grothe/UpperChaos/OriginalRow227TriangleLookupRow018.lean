import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0282
import Grothe.UpperChaos.OriginalRow227TriangleData0283
import Grothe.UpperChaos.OriginalRow227TriangleData0284
import Grothe.UpperChaos.OriginalRow227TriangleData0285
import Grothe.UpperChaos.OriginalRow227TriangleData0286
import Grothe.UpperChaos.OriginalRow227TriangleData0287
import Grothe.UpperChaos.OriginalRow227TriangleData0288
import Grothe.UpperChaos.OriginalRow227TriangleData0289
import Grothe.UpperChaos.OriginalRow227TriangleData0290
import Grothe.UpperChaos.OriginalRow227TriangleData0291
import Grothe.UpperChaos.OriginalRow227TriangleData0292
import Grothe.UpperChaos.OriginalRow227TriangleData0293
import Grothe.UpperChaos.OriginalRow227TriangleData0294
import Grothe.UpperChaos.OriginalRow227TriangleData0295
import Grothe.UpperChaos.OriginalRow227TriangleData0296

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow018

open ConditionalTableLookup

def values0282 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0282.coefficient18_17,
  OriginalRow227TriangleData0282.coefficient18_18,
  OriginalRow227TriangleData0282.coefficient18_19,
  OriginalRow227TriangleData0282.coefficient18_20,
  OriginalRow227TriangleData0282.coefficient18_21,
  OriginalRow227TriangleData0282.coefficient18_22,
  OriginalRow227TriangleData0282.coefficient18_23,
  OriginalRow227TriangleData0282.coefficient18_24,
  OriginalRow227TriangleData0282.coefficient18_25,
  OriginalRow227TriangleData0282.coefficient18_26,
  OriginalRow227TriangleData0282.coefficient18_27,
  OriginalRow227TriangleData0282.coefficient18_28,
  OriginalRow227TriangleData0282.coefficient18_29,
  OriginalRow227TriangleData0282.coefficient18_30,
  OriginalRow227TriangleData0282.coefficient18_31,
  OriginalRow227TriangleData0282.coefficient18_32,
  OriginalRow227TriangleData0282.coefficient18_33,
  OriginalRow227TriangleData0282.coefficient18_34,
  OriginalRow227TriangleData0282.coefficient18_35,
  OriginalRow227TriangleData0282.coefficient18_36,
  OriginalRow227TriangleData0282.coefficient18_37,
  OriginalRow227TriangleData0282.coefficient18_38,
  OriginalRow227TriangleData0282.coefficient18_39,
  OriginalRow227TriangleData0282.coefficient18_40,
  OriginalRow227TriangleData0282.coefficient18_41,
  OriginalRow227TriangleData0282.coefficient18_42,
  OriginalRow227TriangleData0282.coefficient18_43,
  OriginalRow227TriangleData0282.coefficient18_44,
  OriginalRow227TriangleData0282.coefficient18_45,
  OriginalRow227TriangleData0282.coefficient18_46,
  OriginalRow227TriangleData0282.coefficient18_47,
  OriginalRow227TriangleData0282.coefficient18_48
]

theorem values0282_size : values0282.size = 32 := rfl

def block0282 : ℕ → Option IntervalDyadic := segment 17 values0282

theorem block0282_domain : ExactDomain block0282 17 49 := by
  simpa only [values0282_size] using segment_domain 17 values0282

theorem block0282_get (i : Fin 32) :
    block0282 (17 + i.val) = some (values0282[i.val]'(by rw [values0282_size]; exact i.isLt)) := by
  exact segment_get 17 values0282 ⟨i.val, by rw [values0282_size]; exact i.isLt⟩

def values0283 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0283.coefficient18_49,
  OriginalRow227TriangleData0283.coefficient18_50,
  OriginalRow227TriangleData0283.coefficient18_51,
  OriginalRow227TriangleData0283.coefficient18_52,
  OriginalRow227TriangleData0283.coefficient18_53,
  OriginalRow227TriangleData0283.coefficient18_54,
  OriginalRow227TriangleData0283.coefficient18_55,
  OriginalRow227TriangleData0283.coefficient18_56,
  OriginalRow227TriangleData0283.coefficient18_57,
  OriginalRow227TriangleData0283.coefficient18_58,
  OriginalRow227TriangleData0283.coefficient18_59,
  OriginalRow227TriangleData0283.coefficient18_60,
  OriginalRow227TriangleData0283.coefficient18_61,
  OriginalRow227TriangleData0283.coefficient18_62,
  OriginalRow227TriangleData0283.coefficient18_63,
  OriginalRow227TriangleData0283.coefficient18_64,
  OriginalRow227TriangleData0283.coefficient18_65,
  OriginalRow227TriangleData0283.coefficient18_66,
  OriginalRow227TriangleData0283.coefficient18_67,
  OriginalRow227TriangleData0283.coefficient18_68,
  OriginalRow227TriangleData0283.coefficient18_69,
  OriginalRow227TriangleData0283.coefficient18_70,
  OriginalRow227TriangleData0283.coefficient18_71,
  OriginalRow227TriangleData0283.coefficient18_72,
  OriginalRow227TriangleData0283.coefficient18_73,
  OriginalRow227TriangleData0283.coefficient18_74,
  OriginalRow227TriangleData0283.coefficient18_75,
  OriginalRow227TriangleData0283.coefficient18_76,
  OriginalRow227TriangleData0283.coefficient18_77,
  OriginalRow227TriangleData0283.coefficient18_78,
  OriginalRow227TriangleData0283.coefficient18_79,
  OriginalRow227TriangleData0283.coefficient18_80
]

theorem values0283_size : values0283.size = 32 := rfl

def block0283 : ℕ → Option IntervalDyadic := segment 49 values0283

theorem block0283_domain : ExactDomain block0283 49 81 := by
  simpa only [values0283_size] using segment_domain 49 values0283

theorem block0283_get (i : Fin 32) :
    block0283 (49 + i.val) = some (values0283[i.val]'(by rw [values0283_size]; exact i.isLt)) := by
  exact segment_get 49 values0283 ⟨i.val, by rw [values0283_size]; exact i.isLt⟩

def values0284 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0284.coefficient18_81,
  OriginalRow227TriangleData0284.coefficient18_82,
  OriginalRow227TriangleData0284.coefficient18_83,
  OriginalRow227TriangleData0284.coefficient18_84,
  OriginalRow227TriangleData0284.coefficient18_85,
  OriginalRow227TriangleData0284.coefficient18_86,
  OriginalRow227TriangleData0284.coefficient18_87,
  OriginalRow227TriangleData0284.coefficient18_88,
  OriginalRow227TriangleData0284.coefficient18_89,
  OriginalRow227TriangleData0284.coefficient18_90,
  OriginalRow227TriangleData0284.coefficient18_91,
  OriginalRow227TriangleData0284.coefficient18_92,
  OriginalRow227TriangleData0284.coefficient18_93,
  OriginalRow227TriangleData0284.coefficient18_94,
  OriginalRow227TriangleData0284.coefficient18_95,
  OriginalRow227TriangleData0284.coefficient18_96,
  OriginalRow227TriangleData0284.coefficient18_97,
  OriginalRow227TriangleData0284.coefficient18_98,
  OriginalRow227TriangleData0284.coefficient18_99,
  OriginalRow227TriangleData0284.coefficient18_100,
  OriginalRow227TriangleData0284.coefficient18_101,
  OriginalRow227TriangleData0284.coefficient18_102,
  OriginalRow227TriangleData0284.coefficient18_103,
  OriginalRow227TriangleData0284.coefficient18_104,
  OriginalRow227TriangleData0284.coefficient18_105,
  OriginalRow227TriangleData0284.coefficient18_106,
  OriginalRow227TriangleData0284.coefficient18_107,
  OriginalRow227TriangleData0284.coefficient18_108,
  OriginalRow227TriangleData0284.coefficient18_109,
  OriginalRow227TriangleData0284.coefficient18_110,
  OriginalRow227TriangleData0284.coefficient18_111,
  OriginalRow227TriangleData0284.coefficient18_112
]

theorem values0284_size : values0284.size = 32 := rfl

def block0284 : ℕ → Option IntervalDyadic := segment 81 values0284

theorem block0284_domain : ExactDomain block0284 81 113 := by
  simpa only [values0284_size] using segment_domain 81 values0284

theorem block0284_get (i : Fin 32) :
    block0284 (81 + i.val) = some (values0284[i.val]'(by rw [values0284_size]; exact i.isLt)) := by
  exact segment_get 81 values0284 ⟨i.val, by rw [values0284_size]; exact i.isLt⟩

def values0285 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0285.coefficient18_113,
  OriginalRow227TriangleData0285.coefficient18_114,
  OriginalRow227TriangleData0285.coefficient18_115,
  OriginalRow227TriangleData0285.coefficient18_116,
  OriginalRow227TriangleData0285.coefficient18_117,
  OriginalRow227TriangleData0285.coefficient18_118,
  OriginalRow227TriangleData0285.coefficient18_119,
  OriginalRow227TriangleData0285.coefficient18_120,
  OriginalRow227TriangleData0285.coefficient18_121,
  OriginalRow227TriangleData0285.coefficient18_122,
  OriginalRow227TriangleData0285.coefficient18_123,
  OriginalRow227TriangleData0285.coefficient18_124,
  OriginalRow227TriangleData0285.coefficient18_125,
  OriginalRow227TriangleData0285.coefficient18_126,
  OriginalRow227TriangleData0285.coefficient18_127,
  OriginalRow227TriangleData0285.coefficient18_128,
  OriginalRow227TriangleData0285.coefficient18_129,
  OriginalRow227TriangleData0285.coefficient18_130,
  OriginalRow227TriangleData0285.coefficient18_131,
  OriginalRow227TriangleData0285.coefficient18_132,
  OriginalRow227TriangleData0285.coefficient18_133,
  OriginalRow227TriangleData0285.coefficient18_134,
  OriginalRow227TriangleData0285.coefficient18_135,
  OriginalRow227TriangleData0285.coefficient18_136,
  OriginalRow227TriangleData0285.coefficient18_137,
  OriginalRow227TriangleData0285.coefficient18_138,
  OriginalRow227TriangleData0285.coefficient18_139,
  OriginalRow227TriangleData0285.coefficient18_140,
  OriginalRow227TriangleData0285.coefficient18_141,
  OriginalRow227TriangleData0285.coefficient18_142,
  OriginalRow227TriangleData0285.coefficient18_143,
  OriginalRow227TriangleData0285.coefficient18_144
]

theorem values0285_size : values0285.size = 32 := rfl

def block0285 : ℕ → Option IntervalDyadic := segment 113 values0285

theorem block0285_domain : ExactDomain block0285 113 145 := by
  simpa only [values0285_size] using segment_domain 113 values0285

theorem block0285_get (i : Fin 32) :
    block0285 (113 + i.val) = some (values0285[i.val]'(by rw [values0285_size]; exact i.isLt)) := by
  exact segment_get 113 values0285 ⟨i.val, by rw [values0285_size]; exact i.isLt⟩

def values0286 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0286.coefficient18_145,
  OriginalRow227TriangleData0286.coefficient18_146,
  OriginalRow227TriangleData0286.coefficient18_147,
  OriginalRow227TriangleData0286.coefficient18_148,
  OriginalRow227TriangleData0286.coefficient18_149,
  OriginalRow227TriangleData0286.coefficient18_150,
  OriginalRow227TriangleData0286.coefficient18_151,
  OriginalRow227TriangleData0286.coefficient18_152,
  OriginalRow227TriangleData0286.coefficient18_153,
  OriginalRow227TriangleData0286.coefficient18_154,
  OriginalRow227TriangleData0286.coefficient18_155,
  OriginalRow227TriangleData0286.coefficient18_156,
  OriginalRow227TriangleData0286.coefficient18_157,
  OriginalRow227TriangleData0286.coefficient18_158,
  OriginalRow227TriangleData0286.coefficient18_159,
  OriginalRow227TriangleData0286.coefficient18_160,
  OriginalRow227TriangleData0286.coefficient18_161,
  OriginalRow227TriangleData0286.coefficient18_162,
  OriginalRow227TriangleData0286.coefficient18_163,
  OriginalRow227TriangleData0286.coefficient18_164,
  OriginalRow227TriangleData0286.coefficient18_165,
  OriginalRow227TriangleData0286.coefficient18_166,
  OriginalRow227TriangleData0286.coefficient18_167,
  OriginalRow227TriangleData0286.coefficient18_168,
  OriginalRow227TriangleData0286.coefficient18_169,
  OriginalRow227TriangleData0286.coefficient18_170,
  OriginalRow227TriangleData0286.coefficient18_171,
  OriginalRow227TriangleData0286.coefficient18_172,
  OriginalRow227TriangleData0286.coefficient18_173,
  OriginalRow227TriangleData0286.coefficient18_174,
  OriginalRow227TriangleData0286.coefficient18_175,
  OriginalRow227TriangleData0286.coefficient18_176
]

theorem values0286_size : values0286.size = 32 := rfl

def block0286 : ℕ → Option IntervalDyadic := segment 145 values0286

theorem block0286_domain : ExactDomain block0286 145 177 := by
  simpa only [values0286_size] using segment_domain 145 values0286

theorem block0286_get (i : Fin 32) :
    block0286 (145 + i.val) = some (values0286[i.val]'(by rw [values0286_size]; exact i.isLt)) := by
  exact segment_get 145 values0286 ⟨i.val, by rw [values0286_size]; exact i.isLt⟩

def values0287 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0287.coefficient18_177,
  OriginalRow227TriangleData0287.coefficient18_178,
  OriginalRow227TriangleData0287.coefficient18_179,
  OriginalRow227TriangleData0287.coefficient18_180,
  OriginalRow227TriangleData0287.coefficient18_181,
  OriginalRow227TriangleData0287.coefficient18_182,
  OriginalRow227TriangleData0287.coefficient18_183,
  OriginalRow227TriangleData0287.coefficient18_184,
  OriginalRow227TriangleData0287.coefficient18_185,
  OriginalRow227TriangleData0287.coefficient18_186,
  OriginalRow227TriangleData0287.coefficient18_187,
  OriginalRow227TriangleData0287.coefficient18_188,
  OriginalRow227TriangleData0287.coefficient18_189,
  OriginalRow227TriangleData0287.coefficient18_190,
  OriginalRow227TriangleData0287.coefficient18_191,
  OriginalRow227TriangleData0287.coefficient18_192,
  OriginalRow227TriangleData0287.coefficient18_193,
  OriginalRow227TriangleData0287.coefficient18_194,
  OriginalRow227TriangleData0287.coefficient18_195,
  OriginalRow227TriangleData0287.coefficient18_196,
  OriginalRow227TriangleData0287.coefficient18_197,
  OriginalRow227TriangleData0287.coefficient18_198,
  OriginalRow227TriangleData0287.coefficient18_199,
  OriginalRow227TriangleData0287.coefficient18_200,
  OriginalRow227TriangleData0287.coefficient18_201,
  OriginalRow227TriangleData0287.coefficient18_202,
  OriginalRow227TriangleData0287.coefficient18_203,
  OriginalRow227TriangleData0287.coefficient18_204,
  OriginalRow227TriangleData0287.coefficient18_205,
  OriginalRow227TriangleData0287.coefficient18_206,
  OriginalRow227TriangleData0287.coefficient18_207,
  OriginalRow227TriangleData0287.coefficient18_208
]

theorem values0287_size : values0287.size = 32 := rfl

def block0287 : ℕ → Option IntervalDyadic := segment 177 values0287

theorem block0287_domain : ExactDomain block0287 177 209 := by
  simpa only [values0287_size] using segment_domain 177 values0287

theorem block0287_get (i : Fin 32) :
    block0287 (177 + i.val) = some (values0287[i.val]'(by rw [values0287_size]; exact i.isLt)) := by
  exact segment_get 177 values0287 ⟨i.val, by rw [values0287_size]; exact i.isLt⟩

def values0288 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0288.coefficient18_209,
  OriginalRow227TriangleData0288.coefficient18_210,
  OriginalRow227TriangleData0288.coefficient18_211,
  OriginalRow227TriangleData0288.coefficient18_212,
  OriginalRow227TriangleData0288.coefficient18_213,
  OriginalRow227TriangleData0288.coefficient18_214,
  OriginalRow227TriangleData0288.coefficient18_215,
  OriginalRow227TriangleData0288.coefficient18_216,
  OriginalRow227TriangleData0288.coefficient18_217,
  OriginalRow227TriangleData0288.coefficient18_218,
  OriginalRow227TriangleData0288.coefficient18_219,
  OriginalRow227TriangleData0288.coefficient18_220,
  OriginalRow227TriangleData0288.coefficient18_221,
  OriginalRow227TriangleData0288.coefficient18_222,
  OriginalRow227TriangleData0288.coefficient18_223,
  OriginalRow227TriangleData0288.coefficient18_224,
  OriginalRow227TriangleData0288.coefficient18_225,
  OriginalRow227TriangleData0288.coefficient18_226,
  OriginalRow227TriangleData0288.coefficient18_227,
  OriginalRow227TriangleData0288.coefficient18_228,
  OriginalRow227TriangleData0288.coefficient18_229,
  OriginalRow227TriangleData0288.coefficient18_230,
  OriginalRow227TriangleData0288.coefficient18_231,
  OriginalRow227TriangleData0288.coefficient18_232,
  OriginalRow227TriangleData0288.coefficient18_233,
  OriginalRow227TriangleData0288.coefficient18_234,
  OriginalRow227TriangleData0288.coefficient18_235,
  OriginalRow227TriangleData0288.coefficient18_236,
  OriginalRow227TriangleData0288.coefficient18_237,
  OriginalRow227TriangleData0288.coefficient18_238,
  OriginalRow227TriangleData0288.coefficient18_239,
  OriginalRow227TriangleData0288.coefficient18_240
]

theorem values0288_size : values0288.size = 32 := rfl

def block0288 : ℕ → Option IntervalDyadic := segment 209 values0288

theorem block0288_domain : ExactDomain block0288 209 241 := by
  simpa only [values0288_size] using segment_domain 209 values0288

theorem block0288_get (i : Fin 32) :
    block0288 (209 + i.val) = some (values0288[i.val]'(by rw [values0288_size]; exact i.isLt)) := by
  exact segment_get 209 values0288 ⟨i.val, by rw [values0288_size]; exact i.isLt⟩

def values0289 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0289.coefficient18_241,
  OriginalRow227TriangleData0289.coefficient18_242,
  OriginalRow227TriangleData0289.coefficient18_243,
  OriginalRow227TriangleData0289.coefficient18_244,
  OriginalRow227TriangleData0289.coefficient18_245,
  OriginalRow227TriangleData0289.coefficient18_246,
  OriginalRow227TriangleData0289.coefficient18_247,
  OriginalRow227TriangleData0289.coefficient18_248,
  OriginalRow227TriangleData0289.coefficient18_249,
  OriginalRow227TriangleData0289.coefficient18_250,
  OriginalRow227TriangleData0289.coefficient18_251,
  OriginalRow227TriangleData0289.coefficient18_252,
  OriginalRow227TriangleData0289.coefficient18_253,
  OriginalRow227TriangleData0289.coefficient18_254,
  OriginalRow227TriangleData0289.coefficient18_255,
  OriginalRow227TriangleData0289.coefficient18_256,
  OriginalRow227TriangleData0289.coefficient18_257,
  OriginalRow227TriangleData0289.coefficient18_258,
  OriginalRow227TriangleData0289.coefficient18_259,
  OriginalRow227TriangleData0289.coefficient18_260,
  OriginalRow227TriangleData0289.coefficient18_261,
  OriginalRow227TriangleData0289.coefficient18_262,
  OriginalRow227TriangleData0289.coefficient18_263,
  OriginalRow227TriangleData0289.coefficient18_264,
  OriginalRow227TriangleData0289.coefficient18_265,
  OriginalRow227TriangleData0289.coefficient18_266,
  OriginalRow227TriangleData0289.coefficient18_267,
  OriginalRow227TriangleData0289.coefficient18_268,
  OriginalRow227TriangleData0289.coefficient18_269,
  OriginalRow227TriangleData0289.coefficient18_270,
  OriginalRow227TriangleData0289.coefficient18_271,
  OriginalRow227TriangleData0289.coefficient18_272
]

theorem values0289_size : values0289.size = 32 := rfl

def block0289 : ℕ → Option IntervalDyadic := segment 241 values0289

theorem block0289_domain : ExactDomain block0289 241 273 := by
  simpa only [values0289_size] using segment_domain 241 values0289

theorem block0289_get (i : Fin 32) :
    block0289 (241 + i.val) = some (values0289[i.val]'(by rw [values0289_size]; exact i.isLt)) := by
  exact segment_get 241 values0289 ⟨i.val, by rw [values0289_size]; exact i.isLt⟩

def values0290 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0290.coefficient18_273,
  OriginalRow227TriangleData0290.coefficient18_274,
  OriginalRow227TriangleData0290.coefficient18_275,
  OriginalRow227TriangleData0290.coefficient18_276,
  OriginalRow227TriangleData0290.coefficient18_277,
  OriginalRow227TriangleData0290.coefficient18_278,
  OriginalRow227TriangleData0290.coefficient18_279,
  OriginalRow227TriangleData0290.coefficient18_280,
  OriginalRow227TriangleData0290.coefficient18_281,
  OriginalRow227TriangleData0290.coefficient18_282,
  OriginalRow227TriangleData0290.coefficient18_283,
  OriginalRow227TriangleData0290.coefficient18_284,
  OriginalRow227TriangleData0290.coefficient18_285,
  OriginalRow227TriangleData0290.coefficient18_286,
  OriginalRow227TriangleData0290.coefficient18_287,
  OriginalRow227TriangleData0290.coefficient18_288,
  OriginalRow227TriangleData0290.coefficient18_289,
  OriginalRow227TriangleData0290.coefficient18_290,
  OriginalRow227TriangleData0290.coefficient18_291,
  OriginalRow227TriangleData0290.coefficient18_292,
  OriginalRow227TriangleData0290.coefficient18_293,
  OriginalRow227TriangleData0290.coefficient18_294,
  OriginalRow227TriangleData0290.coefficient18_295,
  OriginalRow227TriangleData0290.coefficient18_296,
  OriginalRow227TriangleData0290.coefficient18_297,
  OriginalRow227TriangleData0290.coefficient18_298,
  OriginalRow227TriangleData0290.coefficient18_299,
  OriginalRow227TriangleData0290.coefficient18_300,
  OriginalRow227TriangleData0290.coefficient18_301,
  OriginalRow227TriangleData0290.coefficient18_302,
  OriginalRow227TriangleData0290.coefficient18_303,
  OriginalRow227TriangleData0290.coefficient18_304
]

theorem values0290_size : values0290.size = 32 := rfl

def block0290 : ℕ → Option IntervalDyadic := segment 273 values0290

theorem block0290_domain : ExactDomain block0290 273 305 := by
  simpa only [values0290_size] using segment_domain 273 values0290

theorem block0290_get (i : Fin 32) :
    block0290 (273 + i.val) = some (values0290[i.val]'(by rw [values0290_size]; exact i.isLt)) := by
  exact segment_get 273 values0290 ⟨i.val, by rw [values0290_size]; exact i.isLt⟩

def values0291 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0291.coefficient18_305,
  OriginalRow227TriangleData0291.coefficient18_306,
  OriginalRow227TriangleData0291.coefficient18_307,
  OriginalRow227TriangleData0291.coefficient18_308,
  OriginalRow227TriangleData0291.coefficient18_309,
  OriginalRow227TriangleData0291.coefficient18_310,
  OriginalRow227TriangleData0291.coefficient18_311,
  OriginalRow227TriangleData0291.coefficient18_312,
  OriginalRow227TriangleData0291.coefficient18_313,
  OriginalRow227TriangleData0291.coefficient18_314,
  OriginalRow227TriangleData0291.coefficient18_315,
  OriginalRow227TriangleData0291.coefficient18_316,
  OriginalRow227TriangleData0291.coefficient18_317,
  OriginalRow227TriangleData0291.coefficient18_318,
  OriginalRow227TriangleData0291.coefficient18_319,
  OriginalRow227TriangleData0291.coefficient18_320,
  OriginalRow227TriangleData0291.coefficient18_321,
  OriginalRow227TriangleData0291.coefficient18_322,
  OriginalRow227TriangleData0291.coefficient18_323,
  OriginalRow227TriangleData0291.coefficient18_324,
  OriginalRow227TriangleData0291.coefficient18_325,
  OriginalRow227TriangleData0291.coefficient18_326,
  OriginalRow227TriangleData0291.coefficient18_327,
  OriginalRow227TriangleData0291.coefficient18_328,
  OriginalRow227TriangleData0291.coefficient18_329,
  OriginalRow227TriangleData0291.coefficient18_330,
  OriginalRow227TriangleData0291.coefficient18_331,
  OriginalRow227TriangleData0291.coefficient18_332,
  OriginalRow227TriangleData0291.coefficient18_333,
  OriginalRow227TriangleData0291.coefficient18_334,
  OriginalRow227TriangleData0291.coefficient18_335,
  OriginalRow227TriangleData0291.coefficient18_336
]

theorem values0291_size : values0291.size = 32 := rfl

def block0291 : ℕ → Option IntervalDyadic := segment 305 values0291

theorem block0291_domain : ExactDomain block0291 305 337 := by
  simpa only [values0291_size] using segment_domain 305 values0291

theorem block0291_get (i : Fin 32) :
    block0291 (305 + i.val) = some (values0291[i.val]'(by rw [values0291_size]; exact i.isLt)) := by
  exact segment_get 305 values0291 ⟨i.val, by rw [values0291_size]; exact i.isLt⟩

def values0292 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0292.coefficient18_337,
  OriginalRow227TriangleData0292.coefficient18_338,
  OriginalRow227TriangleData0292.coefficient18_339,
  OriginalRow227TriangleData0292.coefficient18_340,
  OriginalRow227TriangleData0292.coefficient18_341,
  OriginalRow227TriangleData0292.coefficient18_342,
  OriginalRow227TriangleData0292.coefficient18_343,
  OriginalRow227TriangleData0292.coefficient18_344,
  OriginalRow227TriangleData0292.coefficient18_345,
  OriginalRow227TriangleData0292.coefficient18_346,
  OriginalRow227TriangleData0292.coefficient18_347,
  OriginalRow227TriangleData0292.coefficient18_348,
  OriginalRow227TriangleData0292.coefficient18_349,
  OriginalRow227TriangleData0292.coefficient18_350,
  OriginalRow227TriangleData0292.coefficient18_351,
  OriginalRow227TriangleData0292.coefficient18_352,
  OriginalRow227TriangleData0292.coefficient18_353,
  OriginalRow227TriangleData0292.coefficient18_354,
  OriginalRow227TriangleData0292.coefficient18_355,
  OriginalRow227TriangleData0292.coefficient18_356,
  OriginalRow227TriangleData0292.coefficient18_357,
  OriginalRow227TriangleData0292.coefficient18_358,
  OriginalRow227TriangleData0292.coefficient18_359,
  OriginalRow227TriangleData0292.coefficient18_360,
  OriginalRow227TriangleData0292.coefficient18_361,
  OriginalRow227TriangleData0292.coefficient18_362,
  OriginalRow227TriangleData0292.coefficient18_363,
  OriginalRow227TriangleData0292.coefficient18_364,
  OriginalRow227TriangleData0292.coefficient18_365,
  OriginalRow227TriangleData0292.coefficient18_366,
  OriginalRow227TriangleData0292.coefficient18_367,
  OriginalRow227TriangleData0292.coefficient18_368
]

theorem values0292_size : values0292.size = 32 := rfl

def block0292 : ℕ → Option IntervalDyadic := segment 337 values0292

theorem block0292_domain : ExactDomain block0292 337 369 := by
  simpa only [values0292_size] using segment_domain 337 values0292

theorem block0292_get (i : Fin 32) :
    block0292 (337 + i.val) = some (values0292[i.val]'(by rw [values0292_size]; exact i.isLt)) := by
  exact segment_get 337 values0292 ⟨i.val, by rw [values0292_size]; exact i.isLt⟩

def values0293 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0293.coefficient18_369,
  OriginalRow227TriangleData0293.coefficient18_370,
  OriginalRow227TriangleData0293.coefficient18_371,
  OriginalRow227TriangleData0293.coefficient18_372,
  OriginalRow227TriangleData0293.coefficient18_373,
  OriginalRow227TriangleData0293.coefficient18_374,
  OriginalRow227TriangleData0293.coefficient18_375,
  OriginalRow227TriangleData0293.coefficient18_376,
  OriginalRow227TriangleData0293.coefficient18_377,
  OriginalRow227TriangleData0293.coefficient18_378,
  OriginalRow227TriangleData0293.coefficient18_379,
  OriginalRow227TriangleData0293.coefficient18_380,
  OriginalRow227TriangleData0293.coefficient18_381,
  OriginalRow227TriangleData0293.coefficient18_382,
  OriginalRow227TriangleData0293.coefficient18_383,
  OriginalRow227TriangleData0293.coefficient18_384,
  OriginalRow227TriangleData0293.coefficient18_385,
  OriginalRow227TriangleData0293.coefficient18_386,
  OriginalRow227TriangleData0293.coefficient18_387,
  OriginalRow227TriangleData0293.coefficient18_388,
  OriginalRow227TriangleData0293.coefficient18_389,
  OriginalRow227TriangleData0293.coefficient18_390,
  OriginalRow227TriangleData0293.coefficient18_391,
  OriginalRow227TriangleData0293.coefficient18_392,
  OriginalRow227TriangleData0293.coefficient18_393,
  OriginalRow227TriangleData0293.coefficient18_394,
  OriginalRow227TriangleData0293.coefficient18_395,
  OriginalRow227TriangleData0293.coefficient18_396,
  OriginalRow227TriangleData0293.coefficient18_397,
  OriginalRow227TriangleData0293.coefficient18_398,
  OriginalRow227TriangleData0293.coefficient18_399,
  OriginalRow227TriangleData0293.coefficient18_400
]

theorem values0293_size : values0293.size = 32 := rfl

def block0293 : ℕ → Option IntervalDyadic := segment 369 values0293

theorem block0293_domain : ExactDomain block0293 369 401 := by
  simpa only [values0293_size] using segment_domain 369 values0293

theorem block0293_get (i : Fin 32) :
    block0293 (369 + i.val) = some (values0293[i.val]'(by rw [values0293_size]; exact i.isLt)) := by
  exact segment_get 369 values0293 ⟨i.val, by rw [values0293_size]; exact i.isLt⟩

def values0294 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0294.coefficient18_401,
  OriginalRow227TriangleData0294.coefficient18_402,
  OriginalRow227TriangleData0294.coefficient18_403,
  OriginalRow227TriangleData0294.coefficient18_404,
  OriginalRow227TriangleData0294.coefficient18_405,
  OriginalRow227TriangleData0294.coefficient18_406,
  OriginalRow227TriangleData0294.coefficient18_407,
  OriginalRow227TriangleData0294.coefficient18_408,
  OriginalRow227TriangleData0294.coefficient18_409,
  OriginalRow227TriangleData0294.coefficient18_410,
  OriginalRow227TriangleData0294.coefficient18_411,
  OriginalRow227TriangleData0294.coefficient18_412,
  OriginalRow227TriangleData0294.coefficient18_413,
  OriginalRow227TriangleData0294.coefficient18_414,
  OriginalRow227TriangleData0294.coefficient18_415,
  OriginalRow227TriangleData0294.coefficient18_416,
  OriginalRow227TriangleData0294.coefficient18_417,
  OriginalRow227TriangleData0294.coefficient18_418,
  OriginalRow227TriangleData0294.coefficient18_419,
  OriginalRow227TriangleData0294.coefficient18_420,
  OriginalRow227TriangleData0294.coefficient18_421,
  OriginalRow227TriangleData0294.coefficient18_422,
  OriginalRow227TriangleData0294.coefficient18_423,
  OriginalRow227TriangleData0294.coefficient18_424,
  OriginalRow227TriangleData0294.coefficient18_425,
  OriginalRow227TriangleData0294.coefficient18_426,
  OriginalRow227TriangleData0294.coefficient18_427,
  OriginalRow227TriangleData0294.coefficient18_428,
  OriginalRow227TriangleData0294.coefficient18_429,
  OriginalRow227TriangleData0294.coefficient18_430,
  OriginalRow227TriangleData0294.coefficient18_431,
  OriginalRow227TriangleData0294.coefficient18_432
]

theorem values0294_size : values0294.size = 32 := rfl

def block0294 : ℕ → Option IntervalDyadic := segment 401 values0294

theorem block0294_domain : ExactDomain block0294 401 433 := by
  simpa only [values0294_size] using segment_domain 401 values0294

theorem block0294_get (i : Fin 32) :
    block0294 (401 + i.val) = some (values0294[i.val]'(by rw [values0294_size]; exact i.isLt)) := by
  exact segment_get 401 values0294 ⟨i.val, by rw [values0294_size]; exact i.isLt⟩

def values0295 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0295.coefficient18_433,
  OriginalRow227TriangleData0295.coefficient18_434,
  OriginalRow227TriangleData0295.coefficient18_435,
  OriginalRow227TriangleData0295.coefficient18_436,
  OriginalRow227TriangleData0295.coefficient18_437,
  OriginalRow227TriangleData0295.coefficient18_438,
  OriginalRow227TriangleData0295.coefficient18_439,
  OriginalRow227TriangleData0295.coefficient18_440,
  OriginalRow227TriangleData0295.coefficient18_441,
  OriginalRow227TriangleData0295.coefficient18_442,
  OriginalRow227TriangleData0295.coefficient18_443,
  OriginalRow227TriangleData0295.coefficient18_444,
  OriginalRow227TriangleData0295.coefficient18_445,
  OriginalRow227TriangleData0295.coefficient18_446,
  OriginalRow227TriangleData0295.coefficient18_447,
  OriginalRow227TriangleData0295.coefficient18_448,
  OriginalRow227TriangleData0295.coefficient18_449,
  OriginalRow227TriangleData0295.coefficient18_450,
  OriginalRow227TriangleData0295.coefficient18_451,
  OriginalRow227TriangleData0295.coefficient18_452,
  OriginalRow227TriangleData0295.coefficient18_453,
  OriginalRow227TriangleData0295.coefficient18_454,
  OriginalRow227TriangleData0295.coefficient18_455,
  OriginalRow227TriangleData0295.coefficient18_456,
  OriginalRow227TriangleData0295.coefficient18_457,
  OriginalRow227TriangleData0295.coefficient18_458,
  OriginalRow227TriangleData0295.coefficient18_459,
  OriginalRow227TriangleData0295.coefficient18_460,
  OriginalRow227TriangleData0295.coefficient18_461,
  OriginalRow227TriangleData0295.coefficient18_462,
  OriginalRow227TriangleData0295.coefficient18_463,
  OriginalRow227TriangleData0295.coefficient18_464
]

theorem values0295_size : values0295.size = 32 := rfl

def block0295 : ℕ → Option IntervalDyadic := segment 433 values0295

theorem block0295_domain : ExactDomain block0295 433 465 := by
  simpa only [values0295_size] using segment_domain 433 values0295

theorem block0295_get (i : Fin 32) :
    block0295 (433 + i.val) = some (values0295[i.val]'(by rw [values0295_size]; exact i.isLt)) := by
  exact segment_get 433 values0295 ⟨i.val, by rw [values0295_size]; exact i.isLt⟩

def values0296 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0296.coefficient18_465,
  OriginalRow227TriangleData0296.coefficient18_466,
  OriginalRow227TriangleData0296.coefficient18_467,
  OriginalRow227TriangleData0296.coefficient18_468,
  OriginalRow227TriangleData0296.coefficient18_469,
  OriginalRow227TriangleData0296.coefficient18_470,
  OriginalRow227TriangleData0296.coefficient18_471,
  OriginalRow227TriangleData0296.coefficient18_472,
  OriginalRow227TriangleData0296.coefficient18_473,
  OriginalRow227TriangleData0296.coefficient18_474,
  OriginalRow227TriangleData0296.coefficient18_475,
  OriginalRow227TriangleData0296.coefficient18_476,
  OriginalRow227TriangleData0296.coefficient18_477,
  OriginalRow227TriangleData0296.coefficient18_478,
  OriginalRow227TriangleData0296.coefficient18_479,
  OriginalRow227TriangleData0296.coefficient18_480,
  OriginalRow227TriangleData0296.coefficient18_481,
  OriginalRow227TriangleData0296.coefficient18_482,
  OriginalRow227TriangleData0296.coefficient18_483
]

theorem values0296_size : values0296.size = 19 := rfl

def block0296 : ℕ → Option IntervalDyadic := segment 465 values0296

theorem block0296_domain : ExactDomain block0296 465 484 := by
  simpa only [values0296_size] using segment_domain 465 values0296

theorem block0296_get (i : Fin 19) :
    block0296 (465 + i.val) = some (values0296[i.val]'(by rw [values0296_size]; exact i.isLt)) := by
  exact segment_get 465 values0296 ⟨i.val, by rw [values0296_size]; exact i.isLt⟩

def node0049_0113 : ℕ → Option IntervalDyadic := split 81 block0283 block0284

theorem node0049_0113_domain : ExactDomain node0049_0113 49 113 := by
  exact split_domain (by decide) (by decide) block0283_domain block0284_domain

def node0017_0113 : ℕ → Option IntervalDyadic := split 49 block0282 node0049_0113

theorem node0017_0113_domain : ExactDomain node0017_0113 17 113 := by
  exact split_domain (by decide) (by decide) block0282_domain node0049_0113_domain

def node0113_0177 : ℕ → Option IntervalDyadic := split 145 block0285 block0286

theorem node0113_0177_domain : ExactDomain node0113_0177 113 177 := by
  exact split_domain (by decide) (by decide) block0285_domain block0286_domain

def node0177_0241 : ℕ → Option IntervalDyadic := split 209 block0287 block0288

theorem node0177_0241_domain : ExactDomain node0177_0241 177 241 := by
  exact split_domain (by decide) (by decide) block0287_domain block0288_domain

def node0113_0241 : ℕ → Option IntervalDyadic := split 177 node0113_0177 node0177_0241

theorem node0113_0241_domain : ExactDomain node0113_0241 113 241 := by
  exact split_domain (by decide) (by decide) node0113_0177_domain node0177_0241_domain

def node0017_0241 : ℕ → Option IntervalDyadic := split 113 node0017_0113 node0113_0241

theorem node0017_0241_domain : ExactDomain node0017_0241 17 241 := by
  exact split_domain (by decide) (by decide) node0017_0113_domain node0113_0241_domain

def node0241_0305 : ℕ → Option IntervalDyadic := split 273 block0289 block0290

theorem node0241_0305_domain : ExactDomain node0241_0305 241 305 := by
  exact split_domain (by decide) (by decide) block0289_domain block0290_domain

def node0305_0369 : ℕ → Option IntervalDyadic := split 337 block0291 block0292

theorem node0305_0369_domain : ExactDomain node0305_0369 305 369 := by
  exact split_domain (by decide) (by decide) block0291_domain block0292_domain

def node0241_0369 : ℕ → Option IntervalDyadic := split 305 node0241_0305 node0305_0369

theorem node0241_0369_domain : ExactDomain node0241_0369 241 369 := by
  exact split_domain (by decide) (by decide) node0241_0305_domain node0305_0369_domain

def node0369_0433 : ℕ → Option IntervalDyadic := split 401 block0293 block0294

theorem node0369_0433_domain : ExactDomain node0369_0433 369 433 := by
  exact split_domain (by decide) (by decide) block0293_domain block0294_domain

def node0433_0484 : ℕ → Option IntervalDyadic := split 465 block0295 block0296

theorem node0433_0484_domain : ExactDomain node0433_0484 433 484 := by
  exact split_domain (by decide) (by decide) block0295_domain block0296_domain

def node0369_0484 : ℕ → Option IntervalDyadic := split 433 node0369_0433 node0433_0484

theorem node0369_0484_domain : ExactDomain node0369_0484 369 484 := by
  exact split_domain (by decide) (by decide) node0369_0433_domain node0433_0484_domain

def node0241_0484 : ℕ → Option IntervalDyadic := split 369 node0241_0369 node0369_0484

theorem node0241_0484_domain : ExactDomain node0241_0484 241 484 := by
  exact split_domain (by decide) (by decide) node0241_0369_domain node0369_0484_domain

def node0017_0484 : ℕ → Option IntervalDyadic := split 241 node0017_0241 node0241_0484

theorem node0017_0484_domain : ExactDomain node0017_0484 17 484 := by
  exact split_domain (by decide) (by decide) node0017_0241_domain node0241_0484_domain

def lookup : ℕ → Option IntervalDyadic := node0017_0484

theorem lookup_domain : ExactDomain lookup 17 484 :=
  node0017_0484_domain

theorem block0282_lookup (i : Fin 32) :
    lookup (17 + i.val) = some (values0282[i.val]'(by rw [values0282_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (17 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_left 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0017_0113, split_left 49 block0282 node0049_0113 (by omega)]
  exact block0282_get i

theorem block0283_lookup (i : Fin 32) :
    lookup (49 + i.val) = some (values0283[i.val]'(by rw [values0283_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (49 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_left 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0017_0113, split_right 49 block0282 node0049_0113 (by omega)]
  rw [node0049_0113, split_left 81 block0283 block0284 (by omega)]
  exact block0283_get i

theorem block0284_lookup (i : Fin 32) :
    lookup (81 + i.val) = some (values0284[i.val]'(by rw [values0284_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (81 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_left 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0017_0113, split_right 49 block0282 node0049_0113 (by omega)]
  rw [node0049_0113, split_right 81 block0283 block0284 (by omega)]
  exact block0284_get i

theorem block0285_lookup (i : Fin 32) :
    lookup (113 + i.val) = some (values0285[i.val]'(by rw [values0285_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (113 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_right 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0113_0241, split_left 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0113_0177, split_left 145 block0285 block0286 (by omega)]
  exact block0285_get i

theorem block0286_lookup (i : Fin 32) :
    lookup (145 + i.val) = some (values0286[i.val]'(by rw [values0286_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (145 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_right 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0113_0241, split_left 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0113_0177, split_right 145 block0285 block0286 (by omega)]
  exact block0286_get i

theorem block0287_lookup (i : Fin 32) :
    lookup (177 + i.val) = some (values0287[i.val]'(by rw [values0287_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (177 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_right 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0113_0241, split_right 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0177_0241, split_left 209 block0287 block0288 (by omega)]
  exact block0287_get i

theorem block0288_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values0288[i.val]'(by rw [values0288_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (209 + i.val) = _
  rw [node0017_0484, split_left 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0017_0241, split_right 113 node0017_0113 node0113_0241 (by omega)]
  rw [node0113_0241, split_right 177 node0113_0177 node0177_0241 (by omega)]
  rw [node0177_0241, split_right 209 block0287 block0288 (by omega)]
  exact block0288_get i

theorem block0289_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values0289[i.val]'(by rw [values0289_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (241 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_left 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0241_0369, split_left 305 node0241_0305 node0305_0369 (by omega)]
  rw [node0241_0305, split_left 273 block0289 block0290 (by omega)]
  exact block0289_get i

theorem block0290_lookup (i : Fin 32) :
    lookup (273 + i.val) = some (values0290[i.val]'(by rw [values0290_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (273 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_left 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0241_0369, split_left 305 node0241_0305 node0305_0369 (by omega)]
  rw [node0241_0305, split_right 273 block0289 block0290 (by omega)]
  exact block0290_get i

theorem block0291_lookup (i : Fin 32) :
    lookup (305 + i.val) = some (values0291[i.val]'(by rw [values0291_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (305 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_left 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0241_0369, split_right 305 node0241_0305 node0305_0369 (by omega)]
  rw [node0305_0369, split_left 337 block0291 block0292 (by omega)]
  exact block0291_get i

theorem block0292_lookup (i : Fin 32) :
    lookup (337 + i.val) = some (values0292[i.val]'(by rw [values0292_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (337 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_left 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0241_0369, split_right 305 node0241_0305 node0305_0369 (by omega)]
  rw [node0305_0369, split_right 337 block0291 block0292 (by omega)]
  exact block0292_get i

theorem block0293_lookup (i : Fin 32) :
    lookup (369 + i.val) = some (values0293[i.val]'(by rw [values0293_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (369 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_right 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0369_0484, split_left 433 node0369_0433 node0433_0484 (by omega)]
  rw [node0369_0433, split_left 401 block0293 block0294 (by omega)]
  exact block0293_get i

theorem block0294_lookup (i : Fin 32) :
    lookup (401 + i.val) = some (values0294[i.val]'(by rw [values0294_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (401 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_right 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0369_0484, split_left 433 node0369_0433 node0433_0484 (by omega)]
  rw [node0369_0433, split_right 401 block0293 block0294 (by omega)]
  exact block0294_get i

theorem block0295_lookup (i : Fin 32) :
    lookup (433 + i.val) = some (values0295[i.val]'(by rw [values0295_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (433 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_right 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0369_0484, split_right 433 node0369_0433 node0433_0484 (by omega)]
  rw [node0433_0484, split_left 465 block0295 block0296 (by omega)]
  exact block0295_get i

theorem block0296_lookup (i : Fin 19) :
    lookup (465 + i.val) = some (values0296[i.val]'(by rw [values0296_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0017_0484 (465 + i.val) = _
  rw [node0017_0484, split_right 241 node0017_0241 node0241_0484 (by omega)]
  rw [node0241_0484, split_right 369 node0241_0369 node0369_0484 (by omega)]
  rw [node0369_0484, split_right 433 node0369_0433 node0433_0484 (by omega)]
  rw [node0433_0484, split_right 465 block0295 block0296 (by omega)]
  exact block0296_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0282_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0282_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0283_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0283_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0284_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0284_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0285_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0285_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0286_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0286_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0287_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0287_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0288_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0288_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0289_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0289_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0290_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0290_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0291_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0291_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0292_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0292_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0293_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0293_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0294_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0294_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0295_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0295_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0296_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0296_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0282_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0283_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0284_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0285_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0286_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0287_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0288_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0289_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0290_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0291_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0292_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0293_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0294_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0295_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow018.block0296_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow018
