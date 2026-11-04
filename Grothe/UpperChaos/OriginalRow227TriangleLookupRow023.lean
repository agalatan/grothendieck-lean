import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0357
import Grothe.UpperChaos.OriginalRow227TriangleData0358
import Grothe.UpperChaos.OriginalRow227TriangleData0359
import Grothe.UpperChaos.OriginalRow227TriangleData0360
import Grothe.UpperChaos.OriginalRow227TriangleData0361
import Grothe.UpperChaos.OriginalRow227TriangleData0362
import Grothe.UpperChaos.OriginalRow227TriangleData0363
import Grothe.UpperChaos.OriginalRow227TriangleData0364
import Grothe.UpperChaos.OriginalRow227TriangleData0365
import Grothe.UpperChaos.OriginalRow227TriangleData0366
import Grothe.UpperChaos.OriginalRow227TriangleData0367
import Grothe.UpperChaos.OriginalRow227TriangleData0368
import Grothe.UpperChaos.OriginalRow227TriangleData0369
import Grothe.UpperChaos.OriginalRow227TriangleData0370
import Grothe.UpperChaos.OriginalRow227TriangleData0371

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow023

open ConditionalTableLookup

def values0357 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0357.coefficient23_22,
  OriginalRow227TriangleData0357.coefficient23_23,
  OriginalRow227TriangleData0357.coefficient23_24,
  OriginalRow227TriangleData0357.coefficient23_25,
  OriginalRow227TriangleData0357.coefficient23_26,
  OriginalRow227TriangleData0357.coefficient23_27,
  OriginalRow227TriangleData0357.coefficient23_28,
  OriginalRow227TriangleData0357.coefficient23_29,
  OriginalRow227TriangleData0357.coefficient23_30,
  OriginalRow227TriangleData0357.coefficient23_31,
  OriginalRow227TriangleData0357.coefficient23_32,
  OriginalRow227TriangleData0357.coefficient23_33,
  OriginalRow227TriangleData0357.coefficient23_34,
  OriginalRow227TriangleData0357.coefficient23_35,
  OriginalRow227TriangleData0357.coefficient23_36,
  OriginalRow227TriangleData0357.coefficient23_37,
  OriginalRow227TriangleData0357.coefficient23_38,
  OriginalRow227TriangleData0357.coefficient23_39,
  OriginalRow227TriangleData0357.coefficient23_40,
  OriginalRow227TriangleData0357.coefficient23_41,
  OriginalRow227TriangleData0357.coefficient23_42,
  OriginalRow227TriangleData0357.coefficient23_43,
  OriginalRow227TriangleData0357.coefficient23_44,
  OriginalRow227TriangleData0357.coefficient23_45,
  OriginalRow227TriangleData0357.coefficient23_46,
  OriginalRow227TriangleData0357.coefficient23_47,
  OriginalRow227TriangleData0357.coefficient23_48,
  OriginalRow227TriangleData0357.coefficient23_49,
  OriginalRow227TriangleData0357.coefficient23_50,
  OriginalRow227TriangleData0357.coefficient23_51,
  OriginalRow227TriangleData0357.coefficient23_52,
  OriginalRow227TriangleData0357.coefficient23_53
]

theorem values0357_size : values0357.size = 32 := rfl

def block0357 : ℕ → Option IntervalDyadic := segment 22 values0357

theorem block0357_domain : ExactDomain block0357 22 54 := by
  simpa only [values0357_size] using segment_domain 22 values0357

theorem block0357_get (i : Fin 32) :
    block0357 (22 + i.val) = some (values0357[i.val]'(by rw [values0357_size]; exact i.isLt)) := by
  exact segment_get 22 values0357 ⟨i.val, by rw [values0357_size]; exact i.isLt⟩

def values0358 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0358.coefficient23_54,
  OriginalRow227TriangleData0358.coefficient23_55,
  OriginalRow227TriangleData0358.coefficient23_56,
  OriginalRow227TriangleData0358.coefficient23_57,
  OriginalRow227TriangleData0358.coefficient23_58,
  OriginalRow227TriangleData0358.coefficient23_59,
  OriginalRow227TriangleData0358.coefficient23_60,
  OriginalRow227TriangleData0358.coefficient23_61,
  OriginalRow227TriangleData0358.coefficient23_62,
  OriginalRow227TriangleData0358.coefficient23_63,
  OriginalRow227TriangleData0358.coefficient23_64,
  OriginalRow227TriangleData0358.coefficient23_65,
  OriginalRow227TriangleData0358.coefficient23_66,
  OriginalRow227TriangleData0358.coefficient23_67,
  OriginalRow227TriangleData0358.coefficient23_68,
  OriginalRow227TriangleData0358.coefficient23_69,
  OriginalRow227TriangleData0358.coefficient23_70,
  OriginalRow227TriangleData0358.coefficient23_71,
  OriginalRow227TriangleData0358.coefficient23_72,
  OriginalRow227TriangleData0358.coefficient23_73,
  OriginalRow227TriangleData0358.coefficient23_74,
  OriginalRow227TriangleData0358.coefficient23_75,
  OriginalRow227TriangleData0358.coefficient23_76,
  OriginalRow227TriangleData0358.coefficient23_77,
  OriginalRow227TriangleData0358.coefficient23_78,
  OriginalRow227TriangleData0358.coefficient23_79,
  OriginalRow227TriangleData0358.coefficient23_80,
  OriginalRow227TriangleData0358.coefficient23_81,
  OriginalRow227TriangleData0358.coefficient23_82,
  OriginalRow227TriangleData0358.coefficient23_83,
  OriginalRow227TriangleData0358.coefficient23_84,
  OriginalRow227TriangleData0358.coefficient23_85
]

theorem values0358_size : values0358.size = 32 := rfl

def block0358 : ℕ → Option IntervalDyadic := segment 54 values0358

theorem block0358_domain : ExactDomain block0358 54 86 := by
  simpa only [values0358_size] using segment_domain 54 values0358

theorem block0358_get (i : Fin 32) :
    block0358 (54 + i.val) = some (values0358[i.val]'(by rw [values0358_size]; exact i.isLt)) := by
  exact segment_get 54 values0358 ⟨i.val, by rw [values0358_size]; exact i.isLt⟩

def values0359 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0359.coefficient23_86,
  OriginalRow227TriangleData0359.coefficient23_87,
  OriginalRow227TriangleData0359.coefficient23_88,
  OriginalRow227TriangleData0359.coefficient23_89,
  OriginalRow227TriangleData0359.coefficient23_90,
  OriginalRow227TriangleData0359.coefficient23_91,
  OriginalRow227TriangleData0359.coefficient23_92,
  OriginalRow227TriangleData0359.coefficient23_93,
  OriginalRow227TriangleData0359.coefficient23_94,
  OriginalRow227TriangleData0359.coefficient23_95,
  OriginalRow227TriangleData0359.coefficient23_96,
  OriginalRow227TriangleData0359.coefficient23_97,
  OriginalRow227TriangleData0359.coefficient23_98,
  OriginalRow227TriangleData0359.coefficient23_99,
  OriginalRow227TriangleData0359.coefficient23_100,
  OriginalRow227TriangleData0359.coefficient23_101,
  OriginalRow227TriangleData0359.coefficient23_102,
  OriginalRow227TriangleData0359.coefficient23_103,
  OriginalRow227TriangleData0359.coefficient23_104,
  OriginalRow227TriangleData0359.coefficient23_105,
  OriginalRow227TriangleData0359.coefficient23_106,
  OriginalRow227TriangleData0359.coefficient23_107,
  OriginalRow227TriangleData0359.coefficient23_108,
  OriginalRow227TriangleData0359.coefficient23_109,
  OriginalRow227TriangleData0359.coefficient23_110,
  OriginalRow227TriangleData0359.coefficient23_111,
  OriginalRow227TriangleData0359.coefficient23_112,
  OriginalRow227TriangleData0359.coefficient23_113,
  OriginalRow227TriangleData0359.coefficient23_114,
  OriginalRow227TriangleData0359.coefficient23_115,
  OriginalRow227TriangleData0359.coefficient23_116,
  OriginalRow227TriangleData0359.coefficient23_117
]

theorem values0359_size : values0359.size = 32 := rfl

def block0359 : ℕ → Option IntervalDyadic := segment 86 values0359

theorem block0359_domain : ExactDomain block0359 86 118 := by
  simpa only [values0359_size] using segment_domain 86 values0359

theorem block0359_get (i : Fin 32) :
    block0359 (86 + i.val) = some (values0359[i.val]'(by rw [values0359_size]; exact i.isLt)) := by
  exact segment_get 86 values0359 ⟨i.val, by rw [values0359_size]; exact i.isLt⟩

def values0360 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0360.coefficient23_118,
  OriginalRow227TriangleData0360.coefficient23_119,
  OriginalRow227TriangleData0360.coefficient23_120,
  OriginalRow227TriangleData0360.coefficient23_121,
  OriginalRow227TriangleData0360.coefficient23_122,
  OriginalRow227TriangleData0360.coefficient23_123,
  OriginalRow227TriangleData0360.coefficient23_124,
  OriginalRow227TriangleData0360.coefficient23_125,
  OriginalRow227TriangleData0360.coefficient23_126,
  OriginalRow227TriangleData0360.coefficient23_127,
  OriginalRow227TriangleData0360.coefficient23_128,
  OriginalRow227TriangleData0360.coefficient23_129,
  OriginalRow227TriangleData0360.coefficient23_130,
  OriginalRow227TriangleData0360.coefficient23_131,
  OriginalRow227TriangleData0360.coefficient23_132,
  OriginalRow227TriangleData0360.coefficient23_133,
  OriginalRow227TriangleData0360.coefficient23_134,
  OriginalRow227TriangleData0360.coefficient23_135,
  OriginalRow227TriangleData0360.coefficient23_136,
  OriginalRow227TriangleData0360.coefficient23_137,
  OriginalRow227TriangleData0360.coefficient23_138,
  OriginalRow227TriangleData0360.coefficient23_139,
  OriginalRow227TriangleData0360.coefficient23_140,
  OriginalRow227TriangleData0360.coefficient23_141,
  OriginalRow227TriangleData0360.coefficient23_142,
  OriginalRow227TriangleData0360.coefficient23_143,
  OriginalRow227TriangleData0360.coefficient23_144,
  OriginalRow227TriangleData0360.coefficient23_145,
  OriginalRow227TriangleData0360.coefficient23_146,
  OriginalRow227TriangleData0360.coefficient23_147,
  OriginalRow227TriangleData0360.coefficient23_148,
  OriginalRow227TriangleData0360.coefficient23_149
]

theorem values0360_size : values0360.size = 32 := rfl

def block0360 : ℕ → Option IntervalDyadic := segment 118 values0360

theorem block0360_domain : ExactDomain block0360 118 150 := by
  simpa only [values0360_size] using segment_domain 118 values0360

theorem block0360_get (i : Fin 32) :
    block0360 (118 + i.val) = some (values0360[i.val]'(by rw [values0360_size]; exact i.isLt)) := by
  exact segment_get 118 values0360 ⟨i.val, by rw [values0360_size]; exact i.isLt⟩

def values0361 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0361.coefficient23_150,
  OriginalRow227TriangleData0361.coefficient23_151,
  OriginalRow227TriangleData0361.coefficient23_152,
  OriginalRow227TriangleData0361.coefficient23_153,
  OriginalRow227TriangleData0361.coefficient23_154,
  OriginalRow227TriangleData0361.coefficient23_155,
  OriginalRow227TriangleData0361.coefficient23_156,
  OriginalRow227TriangleData0361.coefficient23_157,
  OriginalRow227TriangleData0361.coefficient23_158,
  OriginalRow227TriangleData0361.coefficient23_159,
  OriginalRow227TriangleData0361.coefficient23_160,
  OriginalRow227TriangleData0361.coefficient23_161,
  OriginalRow227TriangleData0361.coefficient23_162,
  OriginalRow227TriangleData0361.coefficient23_163,
  OriginalRow227TriangleData0361.coefficient23_164,
  OriginalRow227TriangleData0361.coefficient23_165,
  OriginalRow227TriangleData0361.coefficient23_166,
  OriginalRow227TriangleData0361.coefficient23_167,
  OriginalRow227TriangleData0361.coefficient23_168,
  OriginalRow227TriangleData0361.coefficient23_169,
  OriginalRow227TriangleData0361.coefficient23_170,
  OriginalRow227TriangleData0361.coefficient23_171,
  OriginalRow227TriangleData0361.coefficient23_172,
  OriginalRow227TriangleData0361.coefficient23_173,
  OriginalRow227TriangleData0361.coefficient23_174,
  OriginalRow227TriangleData0361.coefficient23_175,
  OriginalRow227TriangleData0361.coefficient23_176,
  OriginalRow227TriangleData0361.coefficient23_177,
  OriginalRow227TriangleData0361.coefficient23_178,
  OriginalRow227TriangleData0361.coefficient23_179,
  OriginalRow227TriangleData0361.coefficient23_180,
  OriginalRow227TriangleData0361.coefficient23_181
]

theorem values0361_size : values0361.size = 32 := rfl

def block0361 : ℕ → Option IntervalDyadic := segment 150 values0361

theorem block0361_domain : ExactDomain block0361 150 182 := by
  simpa only [values0361_size] using segment_domain 150 values0361

theorem block0361_get (i : Fin 32) :
    block0361 (150 + i.val) = some (values0361[i.val]'(by rw [values0361_size]; exact i.isLt)) := by
  exact segment_get 150 values0361 ⟨i.val, by rw [values0361_size]; exact i.isLt⟩

def values0362 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0362.coefficient23_182,
  OriginalRow227TriangleData0362.coefficient23_183,
  OriginalRow227TriangleData0362.coefficient23_184,
  OriginalRow227TriangleData0362.coefficient23_185,
  OriginalRow227TriangleData0362.coefficient23_186,
  OriginalRow227TriangleData0362.coefficient23_187,
  OriginalRow227TriangleData0362.coefficient23_188,
  OriginalRow227TriangleData0362.coefficient23_189,
  OriginalRow227TriangleData0362.coefficient23_190,
  OriginalRow227TriangleData0362.coefficient23_191,
  OriginalRow227TriangleData0362.coefficient23_192,
  OriginalRow227TriangleData0362.coefficient23_193,
  OriginalRow227TriangleData0362.coefficient23_194,
  OriginalRow227TriangleData0362.coefficient23_195,
  OriginalRow227TriangleData0362.coefficient23_196,
  OriginalRow227TriangleData0362.coefficient23_197,
  OriginalRow227TriangleData0362.coefficient23_198,
  OriginalRow227TriangleData0362.coefficient23_199,
  OriginalRow227TriangleData0362.coefficient23_200,
  OriginalRow227TriangleData0362.coefficient23_201,
  OriginalRow227TriangleData0362.coefficient23_202,
  OriginalRow227TriangleData0362.coefficient23_203,
  OriginalRow227TriangleData0362.coefficient23_204,
  OriginalRow227TriangleData0362.coefficient23_205,
  OriginalRow227TriangleData0362.coefficient23_206,
  OriginalRow227TriangleData0362.coefficient23_207,
  OriginalRow227TriangleData0362.coefficient23_208,
  OriginalRow227TriangleData0362.coefficient23_209,
  OriginalRow227TriangleData0362.coefficient23_210,
  OriginalRow227TriangleData0362.coefficient23_211,
  OriginalRow227TriangleData0362.coefficient23_212,
  OriginalRow227TriangleData0362.coefficient23_213
]

theorem values0362_size : values0362.size = 32 := rfl

def block0362 : ℕ → Option IntervalDyadic := segment 182 values0362

theorem block0362_domain : ExactDomain block0362 182 214 := by
  simpa only [values0362_size] using segment_domain 182 values0362

theorem block0362_get (i : Fin 32) :
    block0362 (182 + i.val) = some (values0362[i.val]'(by rw [values0362_size]; exact i.isLt)) := by
  exact segment_get 182 values0362 ⟨i.val, by rw [values0362_size]; exact i.isLt⟩

def values0363 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0363.coefficient23_214,
  OriginalRow227TriangleData0363.coefficient23_215,
  OriginalRow227TriangleData0363.coefficient23_216,
  OriginalRow227TriangleData0363.coefficient23_217,
  OriginalRow227TriangleData0363.coefficient23_218,
  OriginalRow227TriangleData0363.coefficient23_219,
  OriginalRow227TriangleData0363.coefficient23_220,
  OriginalRow227TriangleData0363.coefficient23_221,
  OriginalRow227TriangleData0363.coefficient23_222,
  OriginalRow227TriangleData0363.coefficient23_223,
  OriginalRow227TriangleData0363.coefficient23_224,
  OriginalRow227TriangleData0363.coefficient23_225,
  OriginalRow227TriangleData0363.coefficient23_226,
  OriginalRow227TriangleData0363.coefficient23_227,
  OriginalRow227TriangleData0363.coefficient23_228,
  OriginalRow227TriangleData0363.coefficient23_229,
  OriginalRow227TriangleData0363.coefficient23_230,
  OriginalRow227TriangleData0363.coefficient23_231,
  OriginalRow227TriangleData0363.coefficient23_232,
  OriginalRow227TriangleData0363.coefficient23_233,
  OriginalRow227TriangleData0363.coefficient23_234,
  OriginalRow227TriangleData0363.coefficient23_235,
  OriginalRow227TriangleData0363.coefficient23_236,
  OriginalRow227TriangleData0363.coefficient23_237,
  OriginalRow227TriangleData0363.coefficient23_238,
  OriginalRow227TriangleData0363.coefficient23_239,
  OriginalRow227TriangleData0363.coefficient23_240,
  OriginalRow227TriangleData0363.coefficient23_241,
  OriginalRow227TriangleData0363.coefficient23_242,
  OriginalRow227TriangleData0363.coefficient23_243,
  OriginalRow227TriangleData0363.coefficient23_244,
  OriginalRow227TriangleData0363.coefficient23_245
]

theorem values0363_size : values0363.size = 32 := rfl

def block0363 : ℕ → Option IntervalDyadic := segment 214 values0363

theorem block0363_domain : ExactDomain block0363 214 246 := by
  simpa only [values0363_size] using segment_domain 214 values0363

theorem block0363_get (i : Fin 32) :
    block0363 (214 + i.val) = some (values0363[i.val]'(by rw [values0363_size]; exact i.isLt)) := by
  exact segment_get 214 values0363 ⟨i.val, by rw [values0363_size]; exact i.isLt⟩

def values0364 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0364.coefficient23_246,
  OriginalRow227TriangleData0364.coefficient23_247,
  OriginalRow227TriangleData0364.coefficient23_248,
  OriginalRow227TriangleData0364.coefficient23_249,
  OriginalRow227TriangleData0364.coefficient23_250,
  OriginalRow227TriangleData0364.coefficient23_251,
  OriginalRow227TriangleData0364.coefficient23_252,
  OriginalRow227TriangleData0364.coefficient23_253,
  OriginalRow227TriangleData0364.coefficient23_254,
  OriginalRow227TriangleData0364.coefficient23_255,
  OriginalRow227TriangleData0364.coefficient23_256,
  OriginalRow227TriangleData0364.coefficient23_257,
  OriginalRow227TriangleData0364.coefficient23_258,
  OriginalRow227TriangleData0364.coefficient23_259,
  OriginalRow227TriangleData0364.coefficient23_260,
  OriginalRow227TriangleData0364.coefficient23_261,
  OriginalRow227TriangleData0364.coefficient23_262,
  OriginalRow227TriangleData0364.coefficient23_263,
  OriginalRow227TriangleData0364.coefficient23_264,
  OriginalRow227TriangleData0364.coefficient23_265,
  OriginalRow227TriangleData0364.coefficient23_266,
  OriginalRow227TriangleData0364.coefficient23_267,
  OriginalRow227TriangleData0364.coefficient23_268,
  OriginalRow227TriangleData0364.coefficient23_269,
  OriginalRow227TriangleData0364.coefficient23_270,
  OriginalRow227TriangleData0364.coefficient23_271,
  OriginalRow227TriangleData0364.coefficient23_272,
  OriginalRow227TriangleData0364.coefficient23_273,
  OriginalRow227TriangleData0364.coefficient23_274,
  OriginalRow227TriangleData0364.coefficient23_275,
  OriginalRow227TriangleData0364.coefficient23_276,
  OriginalRow227TriangleData0364.coefficient23_277
]

theorem values0364_size : values0364.size = 32 := rfl

def block0364 : ℕ → Option IntervalDyadic := segment 246 values0364

theorem block0364_domain : ExactDomain block0364 246 278 := by
  simpa only [values0364_size] using segment_domain 246 values0364

theorem block0364_get (i : Fin 32) :
    block0364 (246 + i.val) = some (values0364[i.val]'(by rw [values0364_size]; exact i.isLt)) := by
  exact segment_get 246 values0364 ⟨i.val, by rw [values0364_size]; exact i.isLt⟩

def values0365 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0365.coefficient23_278,
  OriginalRow227TriangleData0365.coefficient23_279,
  OriginalRow227TriangleData0365.coefficient23_280,
  OriginalRow227TriangleData0365.coefficient23_281,
  OriginalRow227TriangleData0365.coefficient23_282,
  OriginalRow227TriangleData0365.coefficient23_283,
  OriginalRow227TriangleData0365.coefficient23_284,
  OriginalRow227TriangleData0365.coefficient23_285,
  OriginalRow227TriangleData0365.coefficient23_286,
  OriginalRow227TriangleData0365.coefficient23_287,
  OriginalRow227TriangleData0365.coefficient23_288,
  OriginalRow227TriangleData0365.coefficient23_289,
  OriginalRow227TriangleData0365.coefficient23_290,
  OriginalRow227TriangleData0365.coefficient23_291,
  OriginalRow227TriangleData0365.coefficient23_292,
  OriginalRow227TriangleData0365.coefficient23_293,
  OriginalRow227TriangleData0365.coefficient23_294,
  OriginalRow227TriangleData0365.coefficient23_295,
  OriginalRow227TriangleData0365.coefficient23_296,
  OriginalRow227TriangleData0365.coefficient23_297,
  OriginalRow227TriangleData0365.coefficient23_298,
  OriginalRow227TriangleData0365.coefficient23_299,
  OriginalRow227TriangleData0365.coefficient23_300,
  OriginalRow227TriangleData0365.coefficient23_301,
  OriginalRow227TriangleData0365.coefficient23_302,
  OriginalRow227TriangleData0365.coefficient23_303,
  OriginalRow227TriangleData0365.coefficient23_304,
  OriginalRow227TriangleData0365.coefficient23_305,
  OriginalRow227TriangleData0365.coefficient23_306,
  OriginalRow227TriangleData0365.coefficient23_307,
  OriginalRow227TriangleData0365.coefficient23_308,
  OriginalRow227TriangleData0365.coefficient23_309
]

theorem values0365_size : values0365.size = 32 := rfl

def block0365 : ℕ → Option IntervalDyadic := segment 278 values0365

theorem block0365_domain : ExactDomain block0365 278 310 := by
  simpa only [values0365_size] using segment_domain 278 values0365

theorem block0365_get (i : Fin 32) :
    block0365 (278 + i.val) = some (values0365[i.val]'(by rw [values0365_size]; exact i.isLt)) := by
  exact segment_get 278 values0365 ⟨i.val, by rw [values0365_size]; exact i.isLt⟩

def values0366 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0366.coefficient23_310,
  OriginalRow227TriangleData0366.coefficient23_311,
  OriginalRow227TriangleData0366.coefficient23_312,
  OriginalRow227TriangleData0366.coefficient23_313,
  OriginalRow227TriangleData0366.coefficient23_314,
  OriginalRow227TriangleData0366.coefficient23_315,
  OriginalRow227TriangleData0366.coefficient23_316,
  OriginalRow227TriangleData0366.coefficient23_317,
  OriginalRow227TriangleData0366.coefficient23_318,
  OriginalRow227TriangleData0366.coefficient23_319,
  OriginalRow227TriangleData0366.coefficient23_320,
  OriginalRow227TriangleData0366.coefficient23_321,
  OriginalRow227TriangleData0366.coefficient23_322,
  OriginalRow227TriangleData0366.coefficient23_323,
  OriginalRow227TriangleData0366.coefficient23_324,
  OriginalRow227TriangleData0366.coefficient23_325,
  OriginalRow227TriangleData0366.coefficient23_326,
  OriginalRow227TriangleData0366.coefficient23_327,
  OriginalRow227TriangleData0366.coefficient23_328,
  OriginalRow227TriangleData0366.coefficient23_329,
  OriginalRow227TriangleData0366.coefficient23_330,
  OriginalRow227TriangleData0366.coefficient23_331,
  OriginalRow227TriangleData0366.coefficient23_332,
  OriginalRow227TriangleData0366.coefficient23_333,
  OriginalRow227TriangleData0366.coefficient23_334,
  OriginalRow227TriangleData0366.coefficient23_335,
  OriginalRow227TriangleData0366.coefficient23_336,
  OriginalRow227TriangleData0366.coefficient23_337,
  OriginalRow227TriangleData0366.coefficient23_338,
  OriginalRow227TriangleData0366.coefficient23_339,
  OriginalRow227TriangleData0366.coefficient23_340,
  OriginalRow227TriangleData0366.coefficient23_341
]

theorem values0366_size : values0366.size = 32 := rfl

def block0366 : ℕ → Option IntervalDyadic := segment 310 values0366

theorem block0366_domain : ExactDomain block0366 310 342 := by
  simpa only [values0366_size] using segment_domain 310 values0366

theorem block0366_get (i : Fin 32) :
    block0366 (310 + i.val) = some (values0366[i.val]'(by rw [values0366_size]; exact i.isLt)) := by
  exact segment_get 310 values0366 ⟨i.val, by rw [values0366_size]; exact i.isLt⟩

def values0367 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0367.coefficient23_342,
  OriginalRow227TriangleData0367.coefficient23_343,
  OriginalRow227TriangleData0367.coefficient23_344,
  OriginalRow227TriangleData0367.coefficient23_345,
  OriginalRow227TriangleData0367.coefficient23_346,
  OriginalRow227TriangleData0367.coefficient23_347,
  OriginalRow227TriangleData0367.coefficient23_348,
  OriginalRow227TriangleData0367.coefficient23_349,
  OriginalRow227TriangleData0367.coefficient23_350,
  OriginalRow227TriangleData0367.coefficient23_351,
  OriginalRow227TriangleData0367.coefficient23_352,
  OriginalRow227TriangleData0367.coefficient23_353,
  OriginalRow227TriangleData0367.coefficient23_354,
  OriginalRow227TriangleData0367.coefficient23_355,
  OriginalRow227TriangleData0367.coefficient23_356,
  OriginalRow227TriangleData0367.coefficient23_357,
  OriginalRow227TriangleData0367.coefficient23_358,
  OriginalRow227TriangleData0367.coefficient23_359,
  OriginalRow227TriangleData0367.coefficient23_360,
  OriginalRow227TriangleData0367.coefficient23_361,
  OriginalRow227TriangleData0367.coefficient23_362,
  OriginalRow227TriangleData0367.coefficient23_363,
  OriginalRow227TriangleData0367.coefficient23_364,
  OriginalRow227TriangleData0367.coefficient23_365,
  OriginalRow227TriangleData0367.coefficient23_366,
  OriginalRow227TriangleData0367.coefficient23_367,
  OriginalRow227TriangleData0367.coefficient23_368,
  OriginalRow227TriangleData0367.coefficient23_369,
  OriginalRow227TriangleData0367.coefficient23_370,
  OriginalRow227TriangleData0367.coefficient23_371,
  OriginalRow227TriangleData0367.coefficient23_372,
  OriginalRow227TriangleData0367.coefficient23_373
]

theorem values0367_size : values0367.size = 32 := rfl

def block0367 : ℕ → Option IntervalDyadic := segment 342 values0367

theorem block0367_domain : ExactDomain block0367 342 374 := by
  simpa only [values0367_size] using segment_domain 342 values0367

theorem block0367_get (i : Fin 32) :
    block0367 (342 + i.val) = some (values0367[i.val]'(by rw [values0367_size]; exact i.isLt)) := by
  exact segment_get 342 values0367 ⟨i.val, by rw [values0367_size]; exact i.isLt⟩

def values0368 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0368.coefficient23_374,
  OriginalRow227TriangleData0368.coefficient23_375,
  OriginalRow227TriangleData0368.coefficient23_376,
  OriginalRow227TriangleData0368.coefficient23_377,
  OriginalRow227TriangleData0368.coefficient23_378,
  OriginalRow227TriangleData0368.coefficient23_379,
  OriginalRow227TriangleData0368.coefficient23_380,
  OriginalRow227TriangleData0368.coefficient23_381,
  OriginalRow227TriangleData0368.coefficient23_382,
  OriginalRow227TriangleData0368.coefficient23_383,
  OriginalRow227TriangleData0368.coefficient23_384,
  OriginalRow227TriangleData0368.coefficient23_385,
  OriginalRow227TriangleData0368.coefficient23_386,
  OriginalRow227TriangleData0368.coefficient23_387,
  OriginalRow227TriangleData0368.coefficient23_388,
  OriginalRow227TriangleData0368.coefficient23_389,
  OriginalRow227TriangleData0368.coefficient23_390,
  OriginalRow227TriangleData0368.coefficient23_391,
  OriginalRow227TriangleData0368.coefficient23_392,
  OriginalRow227TriangleData0368.coefficient23_393,
  OriginalRow227TriangleData0368.coefficient23_394,
  OriginalRow227TriangleData0368.coefficient23_395,
  OriginalRow227TriangleData0368.coefficient23_396,
  OriginalRow227TriangleData0368.coefficient23_397,
  OriginalRow227TriangleData0368.coefficient23_398,
  OriginalRow227TriangleData0368.coefficient23_399,
  OriginalRow227TriangleData0368.coefficient23_400,
  OriginalRow227TriangleData0368.coefficient23_401,
  OriginalRow227TriangleData0368.coefficient23_402,
  OriginalRow227TriangleData0368.coefficient23_403,
  OriginalRow227TriangleData0368.coefficient23_404,
  OriginalRow227TriangleData0368.coefficient23_405
]

theorem values0368_size : values0368.size = 32 := rfl

def block0368 : ℕ → Option IntervalDyadic := segment 374 values0368

theorem block0368_domain : ExactDomain block0368 374 406 := by
  simpa only [values0368_size] using segment_domain 374 values0368

theorem block0368_get (i : Fin 32) :
    block0368 (374 + i.val) = some (values0368[i.val]'(by rw [values0368_size]; exact i.isLt)) := by
  exact segment_get 374 values0368 ⟨i.val, by rw [values0368_size]; exact i.isLt⟩

def values0369 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0369.coefficient23_406,
  OriginalRow227TriangleData0369.coefficient23_407,
  OriginalRow227TriangleData0369.coefficient23_408,
  OriginalRow227TriangleData0369.coefficient23_409,
  OriginalRow227TriangleData0369.coefficient23_410,
  OriginalRow227TriangleData0369.coefficient23_411,
  OriginalRow227TriangleData0369.coefficient23_412,
  OriginalRow227TriangleData0369.coefficient23_413,
  OriginalRow227TriangleData0369.coefficient23_414,
  OriginalRow227TriangleData0369.coefficient23_415,
  OriginalRow227TriangleData0369.coefficient23_416,
  OriginalRow227TriangleData0369.coefficient23_417,
  OriginalRow227TriangleData0369.coefficient23_418,
  OriginalRow227TriangleData0369.coefficient23_419,
  OriginalRow227TriangleData0369.coefficient23_420,
  OriginalRow227TriangleData0369.coefficient23_421,
  OriginalRow227TriangleData0369.coefficient23_422,
  OriginalRow227TriangleData0369.coefficient23_423,
  OriginalRow227TriangleData0369.coefficient23_424,
  OriginalRow227TriangleData0369.coefficient23_425,
  OriginalRow227TriangleData0369.coefficient23_426,
  OriginalRow227TriangleData0369.coefficient23_427,
  OriginalRow227TriangleData0369.coefficient23_428,
  OriginalRow227TriangleData0369.coefficient23_429,
  OriginalRow227TriangleData0369.coefficient23_430,
  OriginalRow227TriangleData0369.coefficient23_431,
  OriginalRow227TriangleData0369.coefficient23_432,
  OriginalRow227TriangleData0369.coefficient23_433,
  OriginalRow227TriangleData0369.coefficient23_434,
  OriginalRow227TriangleData0369.coefficient23_435,
  OriginalRow227TriangleData0369.coefficient23_436,
  OriginalRow227TriangleData0369.coefficient23_437
]

theorem values0369_size : values0369.size = 32 := rfl

def block0369 : ℕ → Option IntervalDyadic := segment 406 values0369

theorem block0369_domain : ExactDomain block0369 406 438 := by
  simpa only [values0369_size] using segment_domain 406 values0369

theorem block0369_get (i : Fin 32) :
    block0369 (406 + i.val) = some (values0369[i.val]'(by rw [values0369_size]; exact i.isLt)) := by
  exact segment_get 406 values0369 ⟨i.val, by rw [values0369_size]; exact i.isLt⟩

def values0370 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0370.coefficient23_438,
  OriginalRow227TriangleData0370.coefficient23_439,
  OriginalRow227TriangleData0370.coefficient23_440,
  OriginalRow227TriangleData0370.coefficient23_441,
  OriginalRow227TriangleData0370.coefficient23_442,
  OriginalRow227TriangleData0370.coefficient23_443,
  OriginalRow227TriangleData0370.coefficient23_444,
  OriginalRow227TriangleData0370.coefficient23_445,
  OriginalRow227TriangleData0370.coefficient23_446,
  OriginalRow227TriangleData0370.coefficient23_447,
  OriginalRow227TriangleData0370.coefficient23_448,
  OriginalRow227TriangleData0370.coefficient23_449,
  OriginalRow227TriangleData0370.coefficient23_450,
  OriginalRow227TriangleData0370.coefficient23_451,
  OriginalRow227TriangleData0370.coefficient23_452,
  OriginalRow227TriangleData0370.coefficient23_453,
  OriginalRow227TriangleData0370.coefficient23_454,
  OriginalRow227TriangleData0370.coefficient23_455,
  OriginalRow227TriangleData0370.coefficient23_456,
  OriginalRow227TriangleData0370.coefficient23_457,
  OriginalRow227TriangleData0370.coefficient23_458,
  OriginalRow227TriangleData0370.coefficient23_459,
  OriginalRow227TriangleData0370.coefficient23_460,
  OriginalRow227TriangleData0370.coefficient23_461,
  OriginalRow227TriangleData0370.coefficient23_462,
  OriginalRow227TriangleData0370.coefficient23_463,
  OriginalRow227TriangleData0370.coefficient23_464,
  OriginalRow227TriangleData0370.coefficient23_465,
  OriginalRow227TriangleData0370.coefficient23_466,
  OriginalRow227TriangleData0370.coefficient23_467,
  OriginalRow227TriangleData0370.coefficient23_468,
  OriginalRow227TriangleData0370.coefficient23_469
]

theorem values0370_size : values0370.size = 32 := rfl

def block0370 : ℕ → Option IntervalDyadic := segment 438 values0370

theorem block0370_domain : ExactDomain block0370 438 470 := by
  simpa only [values0370_size] using segment_domain 438 values0370

theorem block0370_get (i : Fin 32) :
    block0370 (438 + i.val) = some (values0370[i.val]'(by rw [values0370_size]; exact i.isLt)) := by
  exact segment_get 438 values0370 ⟨i.val, by rw [values0370_size]; exact i.isLt⟩

def values0371 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0371.coefficient23_470,
  OriginalRow227TriangleData0371.coefficient23_471,
  OriginalRow227TriangleData0371.coefficient23_472,
  OriginalRow227TriangleData0371.coefficient23_473,
  OriginalRow227TriangleData0371.coefficient23_474,
  OriginalRow227TriangleData0371.coefficient23_475,
  OriginalRow227TriangleData0371.coefficient23_476,
  OriginalRow227TriangleData0371.coefficient23_477,
  OriginalRow227TriangleData0371.coefficient23_478
]

theorem values0371_size : values0371.size = 9 := rfl

def block0371 : ℕ → Option IntervalDyadic := segment 470 values0371

theorem block0371_domain : ExactDomain block0371 470 479 := by
  simpa only [values0371_size] using segment_domain 470 values0371

theorem block0371_get (i : Fin 9) :
    block0371 (470 + i.val) = some (values0371[i.val]'(by rw [values0371_size]; exact i.isLt)) := by
  exact segment_get 470 values0371 ⟨i.val, by rw [values0371_size]; exact i.isLt⟩

def node0054_0118 : ℕ → Option IntervalDyadic := split 86 block0358 block0359

theorem node0054_0118_domain : ExactDomain node0054_0118 54 118 := by
  exact split_domain (by decide) (by decide) block0358_domain block0359_domain

def node0022_0118 : ℕ → Option IntervalDyadic := split 54 block0357 node0054_0118

theorem node0022_0118_domain : ExactDomain node0022_0118 22 118 := by
  exact split_domain (by decide) (by decide) block0357_domain node0054_0118_domain

def node0118_0182 : ℕ → Option IntervalDyadic := split 150 block0360 block0361

theorem node0118_0182_domain : ExactDomain node0118_0182 118 182 := by
  exact split_domain (by decide) (by decide) block0360_domain block0361_domain

def node0182_0246 : ℕ → Option IntervalDyadic := split 214 block0362 block0363

theorem node0182_0246_domain : ExactDomain node0182_0246 182 246 := by
  exact split_domain (by decide) (by decide) block0362_domain block0363_domain

def node0118_0246 : ℕ → Option IntervalDyadic := split 182 node0118_0182 node0182_0246

theorem node0118_0246_domain : ExactDomain node0118_0246 118 246 := by
  exact split_domain (by decide) (by decide) node0118_0182_domain node0182_0246_domain

def node0022_0246 : ℕ → Option IntervalDyadic := split 118 node0022_0118 node0118_0246

theorem node0022_0246_domain : ExactDomain node0022_0246 22 246 := by
  exact split_domain (by decide) (by decide) node0022_0118_domain node0118_0246_domain

def node0246_0310 : ℕ → Option IntervalDyadic := split 278 block0364 block0365

theorem node0246_0310_domain : ExactDomain node0246_0310 246 310 := by
  exact split_domain (by decide) (by decide) block0364_domain block0365_domain

def node0310_0374 : ℕ → Option IntervalDyadic := split 342 block0366 block0367

theorem node0310_0374_domain : ExactDomain node0310_0374 310 374 := by
  exact split_domain (by decide) (by decide) block0366_domain block0367_domain

def node0246_0374 : ℕ → Option IntervalDyadic := split 310 node0246_0310 node0310_0374

theorem node0246_0374_domain : ExactDomain node0246_0374 246 374 := by
  exact split_domain (by decide) (by decide) node0246_0310_domain node0310_0374_domain

def node0374_0438 : ℕ → Option IntervalDyadic := split 406 block0368 block0369

theorem node0374_0438_domain : ExactDomain node0374_0438 374 438 := by
  exact split_domain (by decide) (by decide) block0368_domain block0369_domain

def node0438_0479 : ℕ → Option IntervalDyadic := split 470 block0370 block0371

theorem node0438_0479_domain : ExactDomain node0438_0479 438 479 := by
  exact split_domain (by decide) (by decide) block0370_domain block0371_domain

def node0374_0479 : ℕ → Option IntervalDyadic := split 438 node0374_0438 node0438_0479

theorem node0374_0479_domain : ExactDomain node0374_0479 374 479 := by
  exact split_domain (by decide) (by decide) node0374_0438_domain node0438_0479_domain

def node0246_0479 : ℕ → Option IntervalDyadic := split 374 node0246_0374 node0374_0479

theorem node0246_0479_domain : ExactDomain node0246_0479 246 479 := by
  exact split_domain (by decide) (by decide) node0246_0374_domain node0374_0479_domain

def node0022_0479 : ℕ → Option IntervalDyadic := split 246 node0022_0246 node0246_0479

theorem node0022_0479_domain : ExactDomain node0022_0479 22 479 := by
  exact split_domain (by decide) (by decide) node0022_0246_domain node0246_0479_domain

def lookup : ℕ → Option IntervalDyadic := node0022_0479

theorem lookup_domain : ExactDomain lookup 22 479 :=
  node0022_0479_domain

theorem block0357_lookup (i : Fin 32) :
    lookup (22 + i.val) = some (values0357[i.val]'(by rw [values0357_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (22 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_left 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0022_0118, split_left 54 block0357 node0054_0118 (by omega)]
  exact block0357_get i

theorem block0358_lookup (i : Fin 32) :
    lookup (54 + i.val) = some (values0358[i.val]'(by rw [values0358_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (54 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_left 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0022_0118, split_right 54 block0357 node0054_0118 (by omega)]
  rw [node0054_0118, split_left 86 block0358 block0359 (by omega)]
  exact block0358_get i

theorem block0359_lookup (i : Fin 32) :
    lookup (86 + i.val) = some (values0359[i.val]'(by rw [values0359_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (86 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_left 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0022_0118, split_right 54 block0357 node0054_0118 (by omega)]
  rw [node0054_0118, split_right 86 block0358 block0359 (by omega)]
  exact block0359_get i

theorem block0360_lookup (i : Fin 32) :
    lookup (118 + i.val) = some (values0360[i.val]'(by rw [values0360_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (118 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_right 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0118_0246, split_left 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0118_0182, split_left 150 block0360 block0361 (by omega)]
  exact block0360_get i

theorem block0361_lookup (i : Fin 32) :
    lookup (150 + i.val) = some (values0361[i.val]'(by rw [values0361_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (150 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_right 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0118_0246, split_left 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0118_0182, split_right 150 block0360 block0361 (by omega)]
  exact block0361_get i

theorem block0362_lookup (i : Fin 32) :
    lookup (182 + i.val) = some (values0362[i.val]'(by rw [values0362_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (182 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_right 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0118_0246, split_right 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0182_0246, split_left 214 block0362 block0363 (by omega)]
  exact block0362_get i

theorem block0363_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values0363[i.val]'(by rw [values0363_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (214 + i.val) = _
  rw [node0022_0479, split_left 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0022_0246, split_right 118 node0022_0118 node0118_0246 (by omega)]
  rw [node0118_0246, split_right 182 node0118_0182 node0182_0246 (by omega)]
  rw [node0182_0246, split_right 214 block0362 block0363 (by omega)]
  exact block0363_get i

theorem block0364_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values0364[i.val]'(by rw [values0364_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (246 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_left 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0246_0374, split_left 310 node0246_0310 node0310_0374 (by omega)]
  rw [node0246_0310, split_left 278 block0364 block0365 (by omega)]
  exact block0364_get i

theorem block0365_lookup (i : Fin 32) :
    lookup (278 + i.val) = some (values0365[i.val]'(by rw [values0365_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (278 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_left 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0246_0374, split_left 310 node0246_0310 node0310_0374 (by omega)]
  rw [node0246_0310, split_right 278 block0364 block0365 (by omega)]
  exact block0365_get i

theorem block0366_lookup (i : Fin 32) :
    lookup (310 + i.val) = some (values0366[i.val]'(by rw [values0366_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (310 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_left 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0246_0374, split_right 310 node0246_0310 node0310_0374 (by omega)]
  rw [node0310_0374, split_left 342 block0366 block0367 (by omega)]
  exact block0366_get i

theorem block0367_lookup (i : Fin 32) :
    lookup (342 + i.val) = some (values0367[i.val]'(by rw [values0367_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (342 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_left 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0246_0374, split_right 310 node0246_0310 node0310_0374 (by omega)]
  rw [node0310_0374, split_right 342 block0366 block0367 (by omega)]
  exact block0367_get i

theorem block0368_lookup (i : Fin 32) :
    lookup (374 + i.val) = some (values0368[i.val]'(by rw [values0368_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (374 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_right 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0374_0479, split_left 438 node0374_0438 node0438_0479 (by omega)]
  rw [node0374_0438, split_left 406 block0368 block0369 (by omega)]
  exact block0368_get i

theorem block0369_lookup (i : Fin 32) :
    lookup (406 + i.val) = some (values0369[i.val]'(by rw [values0369_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (406 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_right 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0374_0479, split_left 438 node0374_0438 node0438_0479 (by omega)]
  rw [node0374_0438, split_right 406 block0368 block0369 (by omega)]
  exact block0369_get i

theorem block0370_lookup (i : Fin 32) :
    lookup (438 + i.val) = some (values0370[i.val]'(by rw [values0370_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (438 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_right 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0374_0479, split_right 438 node0374_0438 node0438_0479 (by omega)]
  rw [node0438_0479, split_left 470 block0370 block0371 (by omega)]
  exact block0370_get i

theorem block0371_lookup (i : Fin 9) :
    lookup (470 + i.val) = some (values0371[i.val]'(by rw [values0371_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0022_0479 (470 + i.val) = _
  rw [node0022_0479, split_right 246 node0022_0246 node0246_0479 (by omega)]
  rw [node0246_0479, split_right 374 node0246_0374 node0374_0479 (by omega)]
  rw [node0374_0479, split_right 438 node0374_0438 node0438_0479 (by omega)]
  rw [node0438_0479, split_right 470 block0370 block0371 (by omega)]
  exact block0371_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0357_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0357_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0358_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0358_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0359_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0359_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0360_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0360_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0361_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0361_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0362_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0362_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0363_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0363_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0364_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0364_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0365_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0365_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0366_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0366_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0367_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0367_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0368_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0368_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0369_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0369_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0370_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0370_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0371_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0371_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0357_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0358_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0359_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0360_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0361_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0362_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0363_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0364_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0365_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0366_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0367_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0368_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0369_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0370_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow023.block0371_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow023
