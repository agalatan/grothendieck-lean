import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0460
import Grothe.UpperChaos.OriginalRow227TriangleData0461
import Grothe.UpperChaos.OriginalRow227TriangleData0462
import Grothe.UpperChaos.OriginalRow227TriangleData0463
import Grothe.UpperChaos.OriginalRow227TriangleData0464
import Grothe.UpperChaos.OriginalRow227TriangleData0465
import Grothe.UpperChaos.OriginalRow227TriangleData0466
import Grothe.UpperChaos.OriginalRow227TriangleData0467
import Grothe.UpperChaos.OriginalRow227TriangleData0468
import Grothe.UpperChaos.OriginalRow227TriangleData0469
import Grothe.UpperChaos.OriginalRow227TriangleData0470
import Grothe.UpperChaos.OriginalRow227TriangleData0471
import Grothe.UpperChaos.OriginalRow227TriangleData0472
import Grothe.UpperChaos.OriginalRow227TriangleData0473

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow030

open ConditionalTableLookup

def values0460 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0460.coefficient30_29,
  OriginalRow227TriangleData0460.coefficient30_30,
  OriginalRow227TriangleData0460.coefficient30_31,
  OriginalRow227TriangleData0460.coefficient30_32,
  OriginalRow227TriangleData0460.coefficient30_33,
  OriginalRow227TriangleData0460.coefficient30_34,
  OriginalRow227TriangleData0460.coefficient30_35,
  OriginalRow227TriangleData0460.coefficient30_36,
  OriginalRow227TriangleData0460.coefficient30_37,
  OriginalRow227TriangleData0460.coefficient30_38,
  OriginalRow227TriangleData0460.coefficient30_39,
  OriginalRow227TriangleData0460.coefficient30_40,
  OriginalRow227TriangleData0460.coefficient30_41,
  OriginalRow227TriangleData0460.coefficient30_42,
  OriginalRow227TriangleData0460.coefficient30_43,
  OriginalRow227TriangleData0460.coefficient30_44,
  OriginalRow227TriangleData0460.coefficient30_45,
  OriginalRow227TriangleData0460.coefficient30_46,
  OriginalRow227TriangleData0460.coefficient30_47,
  OriginalRow227TriangleData0460.coefficient30_48,
  OriginalRow227TriangleData0460.coefficient30_49,
  OriginalRow227TriangleData0460.coefficient30_50,
  OriginalRow227TriangleData0460.coefficient30_51,
  OriginalRow227TriangleData0460.coefficient30_52,
  OriginalRow227TriangleData0460.coefficient30_53,
  OriginalRow227TriangleData0460.coefficient30_54,
  OriginalRow227TriangleData0460.coefficient30_55,
  OriginalRow227TriangleData0460.coefficient30_56,
  OriginalRow227TriangleData0460.coefficient30_57,
  OriginalRow227TriangleData0460.coefficient30_58,
  OriginalRow227TriangleData0460.coefficient30_59,
  OriginalRow227TriangleData0460.coefficient30_60
]

theorem values0460_size : values0460.size = 32 := rfl

def block0460 : ℕ → Option IntervalDyadic := segment 29 values0460

theorem block0460_domain : ExactDomain block0460 29 61 := by
  simpa only [values0460_size] using segment_domain 29 values0460

theorem block0460_get (i : Fin 32) :
    block0460 (29 + i.val) = some (values0460[i.val]'(by rw [values0460_size]; exact i.isLt)) := by
  exact segment_get 29 values0460 ⟨i.val, by rw [values0460_size]; exact i.isLt⟩

def values0461 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0461.coefficient30_61,
  OriginalRow227TriangleData0461.coefficient30_62,
  OriginalRow227TriangleData0461.coefficient30_63,
  OriginalRow227TriangleData0461.coefficient30_64,
  OriginalRow227TriangleData0461.coefficient30_65,
  OriginalRow227TriangleData0461.coefficient30_66,
  OriginalRow227TriangleData0461.coefficient30_67,
  OriginalRow227TriangleData0461.coefficient30_68,
  OriginalRow227TriangleData0461.coefficient30_69,
  OriginalRow227TriangleData0461.coefficient30_70,
  OriginalRow227TriangleData0461.coefficient30_71,
  OriginalRow227TriangleData0461.coefficient30_72,
  OriginalRow227TriangleData0461.coefficient30_73,
  OriginalRow227TriangleData0461.coefficient30_74,
  OriginalRow227TriangleData0461.coefficient30_75,
  OriginalRow227TriangleData0461.coefficient30_76,
  OriginalRow227TriangleData0461.coefficient30_77,
  OriginalRow227TriangleData0461.coefficient30_78,
  OriginalRow227TriangleData0461.coefficient30_79,
  OriginalRow227TriangleData0461.coefficient30_80,
  OriginalRow227TriangleData0461.coefficient30_81,
  OriginalRow227TriangleData0461.coefficient30_82,
  OriginalRow227TriangleData0461.coefficient30_83,
  OriginalRow227TriangleData0461.coefficient30_84,
  OriginalRow227TriangleData0461.coefficient30_85,
  OriginalRow227TriangleData0461.coefficient30_86,
  OriginalRow227TriangleData0461.coefficient30_87,
  OriginalRow227TriangleData0461.coefficient30_88,
  OriginalRow227TriangleData0461.coefficient30_89,
  OriginalRow227TriangleData0461.coefficient30_90,
  OriginalRow227TriangleData0461.coefficient30_91,
  OriginalRow227TriangleData0461.coefficient30_92
]

theorem values0461_size : values0461.size = 32 := rfl

def block0461 : ℕ → Option IntervalDyadic := segment 61 values0461

theorem block0461_domain : ExactDomain block0461 61 93 := by
  simpa only [values0461_size] using segment_domain 61 values0461

theorem block0461_get (i : Fin 32) :
    block0461 (61 + i.val) = some (values0461[i.val]'(by rw [values0461_size]; exact i.isLt)) := by
  exact segment_get 61 values0461 ⟨i.val, by rw [values0461_size]; exact i.isLt⟩

def values0462 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0462.coefficient30_93,
  OriginalRow227TriangleData0462.coefficient30_94,
  OriginalRow227TriangleData0462.coefficient30_95,
  OriginalRow227TriangleData0462.coefficient30_96,
  OriginalRow227TriangleData0462.coefficient30_97,
  OriginalRow227TriangleData0462.coefficient30_98,
  OriginalRow227TriangleData0462.coefficient30_99,
  OriginalRow227TriangleData0462.coefficient30_100,
  OriginalRow227TriangleData0462.coefficient30_101,
  OriginalRow227TriangleData0462.coefficient30_102,
  OriginalRow227TriangleData0462.coefficient30_103,
  OriginalRow227TriangleData0462.coefficient30_104,
  OriginalRow227TriangleData0462.coefficient30_105,
  OriginalRow227TriangleData0462.coefficient30_106,
  OriginalRow227TriangleData0462.coefficient30_107,
  OriginalRow227TriangleData0462.coefficient30_108,
  OriginalRow227TriangleData0462.coefficient30_109,
  OriginalRow227TriangleData0462.coefficient30_110,
  OriginalRow227TriangleData0462.coefficient30_111,
  OriginalRow227TriangleData0462.coefficient30_112,
  OriginalRow227TriangleData0462.coefficient30_113,
  OriginalRow227TriangleData0462.coefficient30_114,
  OriginalRow227TriangleData0462.coefficient30_115,
  OriginalRow227TriangleData0462.coefficient30_116,
  OriginalRow227TriangleData0462.coefficient30_117,
  OriginalRow227TriangleData0462.coefficient30_118,
  OriginalRow227TriangleData0462.coefficient30_119,
  OriginalRow227TriangleData0462.coefficient30_120,
  OriginalRow227TriangleData0462.coefficient30_121,
  OriginalRow227TriangleData0462.coefficient30_122,
  OriginalRow227TriangleData0462.coefficient30_123,
  OriginalRow227TriangleData0462.coefficient30_124
]

theorem values0462_size : values0462.size = 32 := rfl

def block0462 : ℕ → Option IntervalDyadic := segment 93 values0462

theorem block0462_domain : ExactDomain block0462 93 125 := by
  simpa only [values0462_size] using segment_domain 93 values0462

theorem block0462_get (i : Fin 32) :
    block0462 (93 + i.val) = some (values0462[i.val]'(by rw [values0462_size]; exact i.isLt)) := by
  exact segment_get 93 values0462 ⟨i.val, by rw [values0462_size]; exact i.isLt⟩

def values0463 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0463.coefficient30_125,
  OriginalRow227TriangleData0463.coefficient30_126,
  OriginalRow227TriangleData0463.coefficient30_127,
  OriginalRow227TriangleData0463.coefficient30_128,
  OriginalRow227TriangleData0463.coefficient30_129,
  OriginalRow227TriangleData0463.coefficient30_130,
  OriginalRow227TriangleData0463.coefficient30_131,
  OriginalRow227TriangleData0463.coefficient30_132,
  OriginalRow227TriangleData0463.coefficient30_133,
  OriginalRow227TriangleData0463.coefficient30_134,
  OriginalRow227TriangleData0463.coefficient30_135,
  OriginalRow227TriangleData0463.coefficient30_136,
  OriginalRow227TriangleData0463.coefficient30_137,
  OriginalRow227TriangleData0463.coefficient30_138,
  OriginalRow227TriangleData0463.coefficient30_139,
  OriginalRow227TriangleData0463.coefficient30_140,
  OriginalRow227TriangleData0463.coefficient30_141,
  OriginalRow227TriangleData0463.coefficient30_142,
  OriginalRow227TriangleData0463.coefficient30_143,
  OriginalRow227TriangleData0463.coefficient30_144,
  OriginalRow227TriangleData0463.coefficient30_145,
  OriginalRow227TriangleData0463.coefficient30_146,
  OriginalRow227TriangleData0463.coefficient30_147,
  OriginalRow227TriangleData0463.coefficient30_148,
  OriginalRow227TriangleData0463.coefficient30_149,
  OriginalRow227TriangleData0463.coefficient30_150,
  OriginalRow227TriangleData0463.coefficient30_151,
  OriginalRow227TriangleData0463.coefficient30_152,
  OriginalRow227TriangleData0463.coefficient30_153,
  OriginalRow227TriangleData0463.coefficient30_154,
  OriginalRow227TriangleData0463.coefficient30_155,
  OriginalRow227TriangleData0463.coefficient30_156
]

theorem values0463_size : values0463.size = 32 := rfl

def block0463 : ℕ → Option IntervalDyadic := segment 125 values0463

theorem block0463_domain : ExactDomain block0463 125 157 := by
  simpa only [values0463_size] using segment_domain 125 values0463

theorem block0463_get (i : Fin 32) :
    block0463 (125 + i.val) = some (values0463[i.val]'(by rw [values0463_size]; exact i.isLt)) := by
  exact segment_get 125 values0463 ⟨i.val, by rw [values0463_size]; exact i.isLt⟩

def values0464 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0464.coefficient30_157,
  OriginalRow227TriangleData0464.coefficient30_158,
  OriginalRow227TriangleData0464.coefficient30_159,
  OriginalRow227TriangleData0464.coefficient30_160,
  OriginalRow227TriangleData0464.coefficient30_161,
  OriginalRow227TriangleData0464.coefficient30_162,
  OriginalRow227TriangleData0464.coefficient30_163,
  OriginalRow227TriangleData0464.coefficient30_164,
  OriginalRow227TriangleData0464.coefficient30_165,
  OriginalRow227TriangleData0464.coefficient30_166,
  OriginalRow227TriangleData0464.coefficient30_167,
  OriginalRow227TriangleData0464.coefficient30_168,
  OriginalRow227TriangleData0464.coefficient30_169,
  OriginalRow227TriangleData0464.coefficient30_170,
  OriginalRow227TriangleData0464.coefficient30_171,
  OriginalRow227TriangleData0464.coefficient30_172,
  OriginalRow227TriangleData0464.coefficient30_173,
  OriginalRow227TriangleData0464.coefficient30_174,
  OriginalRow227TriangleData0464.coefficient30_175,
  OriginalRow227TriangleData0464.coefficient30_176,
  OriginalRow227TriangleData0464.coefficient30_177,
  OriginalRow227TriangleData0464.coefficient30_178,
  OriginalRow227TriangleData0464.coefficient30_179,
  OriginalRow227TriangleData0464.coefficient30_180,
  OriginalRow227TriangleData0464.coefficient30_181,
  OriginalRow227TriangleData0464.coefficient30_182,
  OriginalRow227TriangleData0464.coefficient30_183,
  OriginalRow227TriangleData0464.coefficient30_184,
  OriginalRow227TriangleData0464.coefficient30_185,
  OriginalRow227TriangleData0464.coefficient30_186,
  OriginalRow227TriangleData0464.coefficient30_187,
  OriginalRow227TriangleData0464.coefficient30_188
]

theorem values0464_size : values0464.size = 32 := rfl

def block0464 : ℕ → Option IntervalDyadic := segment 157 values0464

theorem block0464_domain : ExactDomain block0464 157 189 := by
  simpa only [values0464_size] using segment_domain 157 values0464

theorem block0464_get (i : Fin 32) :
    block0464 (157 + i.val) = some (values0464[i.val]'(by rw [values0464_size]; exact i.isLt)) := by
  exact segment_get 157 values0464 ⟨i.val, by rw [values0464_size]; exact i.isLt⟩

def values0465 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0465.coefficient30_189,
  OriginalRow227TriangleData0465.coefficient30_190,
  OriginalRow227TriangleData0465.coefficient30_191,
  OriginalRow227TriangleData0465.coefficient30_192,
  OriginalRow227TriangleData0465.coefficient30_193,
  OriginalRow227TriangleData0465.coefficient30_194,
  OriginalRow227TriangleData0465.coefficient30_195,
  OriginalRow227TriangleData0465.coefficient30_196,
  OriginalRow227TriangleData0465.coefficient30_197,
  OriginalRow227TriangleData0465.coefficient30_198,
  OriginalRow227TriangleData0465.coefficient30_199,
  OriginalRow227TriangleData0465.coefficient30_200,
  OriginalRow227TriangleData0465.coefficient30_201,
  OriginalRow227TriangleData0465.coefficient30_202,
  OriginalRow227TriangleData0465.coefficient30_203,
  OriginalRow227TriangleData0465.coefficient30_204,
  OriginalRow227TriangleData0465.coefficient30_205,
  OriginalRow227TriangleData0465.coefficient30_206,
  OriginalRow227TriangleData0465.coefficient30_207,
  OriginalRow227TriangleData0465.coefficient30_208,
  OriginalRow227TriangleData0465.coefficient30_209,
  OriginalRow227TriangleData0465.coefficient30_210,
  OriginalRow227TriangleData0465.coefficient30_211,
  OriginalRow227TriangleData0465.coefficient30_212,
  OriginalRow227TriangleData0465.coefficient30_213,
  OriginalRow227TriangleData0465.coefficient30_214,
  OriginalRow227TriangleData0465.coefficient30_215,
  OriginalRow227TriangleData0465.coefficient30_216,
  OriginalRow227TriangleData0465.coefficient30_217,
  OriginalRow227TriangleData0465.coefficient30_218,
  OriginalRow227TriangleData0465.coefficient30_219,
  OriginalRow227TriangleData0465.coefficient30_220
]

theorem values0465_size : values0465.size = 32 := rfl

def block0465 : ℕ → Option IntervalDyadic := segment 189 values0465

theorem block0465_domain : ExactDomain block0465 189 221 := by
  simpa only [values0465_size] using segment_domain 189 values0465

theorem block0465_get (i : Fin 32) :
    block0465 (189 + i.val) = some (values0465[i.val]'(by rw [values0465_size]; exact i.isLt)) := by
  exact segment_get 189 values0465 ⟨i.val, by rw [values0465_size]; exact i.isLt⟩

def values0466 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0466.coefficient30_221,
  OriginalRow227TriangleData0466.coefficient30_222,
  OriginalRow227TriangleData0466.coefficient30_223,
  OriginalRow227TriangleData0466.coefficient30_224,
  OriginalRow227TriangleData0466.coefficient30_225,
  OriginalRow227TriangleData0466.coefficient30_226,
  OriginalRow227TriangleData0466.coefficient30_227,
  OriginalRow227TriangleData0466.coefficient30_228,
  OriginalRow227TriangleData0466.coefficient30_229,
  OriginalRow227TriangleData0466.coefficient30_230,
  OriginalRow227TriangleData0466.coefficient30_231,
  OriginalRow227TriangleData0466.coefficient30_232,
  OriginalRow227TriangleData0466.coefficient30_233,
  OriginalRow227TriangleData0466.coefficient30_234,
  OriginalRow227TriangleData0466.coefficient30_235,
  OriginalRow227TriangleData0466.coefficient30_236,
  OriginalRow227TriangleData0466.coefficient30_237,
  OriginalRow227TriangleData0466.coefficient30_238,
  OriginalRow227TriangleData0466.coefficient30_239,
  OriginalRow227TriangleData0466.coefficient30_240,
  OriginalRow227TriangleData0466.coefficient30_241,
  OriginalRow227TriangleData0466.coefficient30_242,
  OriginalRow227TriangleData0466.coefficient30_243,
  OriginalRow227TriangleData0466.coefficient30_244,
  OriginalRow227TriangleData0466.coefficient30_245,
  OriginalRow227TriangleData0466.coefficient30_246,
  OriginalRow227TriangleData0466.coefficient30_247,
  OriginalRow227TriangleData0466.coefficient30_248,
  OriginalRow227TriangleData0466.coefficient30_249,
  OriginalRow227TriangleData0466.coefficient30_250,
  OriginalRow227TriangleData0466.coefficient30_251,
  OriginalRow227TriangleData0466.coefficient30_252
]

theorem values0466_size : values0466.size = 32 := rfl

def block0466 : ℕ → Option IntervalDyadic := segment 221 values0466

theorem block0466_domain : ExactDomain block0466 221 253 := by
  simpa only [values0466_size] using segment_domain 221 values0466

theorem block0466_get (i : Fin 32) :
    block0466 (221 + i.val) = some (values0466[i.val]'(by rw [values0466_size]; exact i.isLt)) := by
  exact segment_get 221 values0466 ⟨i.val, by rw [values0466_size]; exact i.isLt⟩

def values0467 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0467.coefficient30_253,
  OriginalRow227TriangleData0467.coefficient30_254,
  OriginalRow227TriangleData0467.coefficient30_255,
  OriginalRow227TriangleData0467.coefficient30_256,
  OriginalRow227TriangleData0467.coefficient30_257,
  OriginalRow227TriangleData0467.coefficient30_258,
  OriginalRow227TriangleData0467.coefficient30_259,
  OriginalRow227TriangleData0467.coefficient30_260,
  OriginalRow227TriangleData0467.coefficient30_261,
  OriginalRow227TriangleData0467.coefficient30_262,
  OriginalRow227TriangleData0467.coefficient30_263,
  OriginalRow227TriangleData0467.coefficient30_264,
  OriginalRow227TriangleData0467.coefficient30_265,
  OriginalRow227TriangleData0467.coefficient30_266,
  OriginalRow227TriangleData0467.coefficient30_267,
  OriginalRow227TriangleData0467.coefficient30_268,
  OriginalRow227TriangleData0467.coefficient30_269,
  OriginalRow227TriangleData0467.coefficient30_270,
  OriginalRow227TriangleData0467.coefficient30_271,
  OriginalRow227TriangleData0467.coefficient30_272,
  OriginalRow227TriangleData0467.coefficient30_273,
  OriginalRow227TriangleData0467.coefficient30_274,
  OriginalRow227TriangleData0467.coefficient30_275,
  OriginalRow227TriangleData0467.coefficient30_276,
  OriginalRow227TriangleData0467.coefficient30_277,
  OriginalRow227TriangleData0467.coefficient30_278,
  OriginalRow227TriangleData0467.coefficient30_279,
  OriginalRow227TriangleData0467.coefficient30_280,
  OriginalRow227TriangleData0467.coefficient30_281,
  OriginalRow227TriangleData0467.coefficient30_282,
  OriginalRow227TriangleData0467.coefficient30_283,
  OriginalRow227TriangleData0467.coefficient30_284
]

theorem values0467_size : values0467.size = 32 := rfl

def block0467 : ℕ → Option IntervalDyadic := segment 253 values0467

theorem block0467_domain : ExactDomain block0467 253 285 := by
  simpa only [values0467_size] using segment_domain 253 values0467

theorem block0467_get (i : Fin 32) :
    block0467 (253 + i.val) = some (values0467[i.val]'(by rw [values0467_size]; exact i.isLt)) := by
  exact segment_get 253 values0467 ⟨i.val, by rw [values0467_size]; exact i.isLt⟩

def values0468 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0468.coefficient30_285,
  OriginalRow227TriangleData0468.coefficient30_286,
  OriginalRow227TriangleData0468.coefficient30_287,
  OriginalRow227TriangleData0468.coefficient30_288,
  OriginalRow227TriangleData0468.coefficient30_289,
  OriginalRow227TriangleData0468.coefficient30_290,
  OriginalRow227TriangleData0468.coefficient30_291,
  OriginalRow227TriangleData0468.coefficient30_292,
  OriginalRow227TriangleData0468.coefficient30_293,
  OriginalRow227TriangleData0468.coefficient30_294,
  OriginalRow227TriangleData0468.coefficient30_295,
  OriginalRow227TriangleData0468.coefficient30_296,
  OriginalRow227TriangleData0468.coefficient30_297,
  OriginalRow227TriangleData0468.coefficient30_298,
  OriginalRow227TriangleData0468.coefficient30_299,
  OriginalRow227TriangleData0468.coefficient30_300,
  OriginalRow227TriangleData0468.coefficient30_301,
  OriginalRow227TriangleData0468.coefficient30_302,
  OriginalRow227TriangleData0468.coefficient30_303,
  OriginalRow227TriangleData0468.coefficient30_304,
  OriginalRow227TriangleData0468.coefficient30_305,
  OriginalRow227TriangleData0468.coefficient30_306,
  OriginalRow227TriangleData0468.coefficient30_307,
  OriginalRow227TriangleData0468.coefficient30_308,
  OriginalRow227TriangleData0468.coefficient30_309,
  OriginalRow227TriangleData0468.coefficient30_310,
  OriginalRow227TriangleData0468.coefficient30_311,
  OriginalRow227TriangleData0468.coefficient30_312,
  OriginalRow227TriangleData0468.coefficient30_313,
  OriginalRow227TriangleData0468.coefficient30_314,
  OriginalRow227TriangleData0468.coefficient30_315,
  OriginalRow227TriangleData0468.coefficient30_316
]

theorem values0468_size : values0468.size = 32 := rfl

def block0468 : ℕ → Option IntervalDyadic := segment 285 values0468

theorem block0468_domain : ExactDomain block0468 285 317 := by
  simpa only [values0468_size] using segment_domain 285 values0468

theorem block0468_get (i : Fin 32) :
    block0468 (285 + i.val) = some (values0468[i.val]'(by rw [values0468_size]; exact i.isLt)) := by
  exact segment_get 285 values0468 ⟨i.val, by rw [values0468_size]; exact i.isLt⟩

def values0469 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0469.coefficient30_317,
  OriginalRow227TriangleData0469.coefficient30_318,
  OriginalRow227TriangleData0469.coefficient30_319,
  OriginalRow227TriangleData0469.coefficient30_320,
  OriginalRow227TriangleData0469.coefficient30_321,
  OriginalRow227TriangleData0469.coefficient30_322,
  OriginalRow227TriangleData0469.coefficient30_323,
  OriginalRow227TriangleData0469.coefficient30_324,
  OriginalRow227TriangleData0469.coefficient30_325,
  OriginalRow227TriangleData0469.coefficient30_326,
  OriginalRow227TriangleData0469.coefficient30_327,
  OriginalRow227TriangleData0469.coefficient30_328,
  OriginalRow227TriangleData0469.coefficient30_329,
  OriginalRow227TriangleData0469.coefficient30_330,
  OriginalRow227TriangleData0469.coefficient30_331,
  OriginalRow227TriangleData0469.coefficient30_332,
  OriginalRow227TriangleData0469.coefficient30_333,
  OriginalRow227TriangleData0469.coefficient30_334,
  OriginalRow227TriangleData0469.coefficient30_335,
  OriginalRow227TriangleData0469.coefficient30_336,
  OriginalRow227TriangleData0469.coefficient30_337,
  OriginalRow227TriangleData0469.coefficient30_338,
  OriginalRow227TriangleData0469.coefficient30_339,
  OriginalRow227TriangleData0469.coefficient30_340,
  OriginalRow227TriangleData0469.coefficient30_341,
  OriginalRow227TriangleData0469.coefficient30_342,
  OriginalRow227TriangleData0469.coefficient30_343,
  OriginalRow227TriangleData0469.coefficient30_344,
  OriginalRow227TriangleData0469.coefficient30_345,
  OriginalRow227TriangleData0469.coefficient30_346,
  OriginalRow227TriangleData0469.coefficient30_347,
  OriginalRow227TriangleData0469.coefficient30_348
]

theorem values0469_size : values0469.size = 32 := rfl

def block0469 : ℕ → Option IntervalDyadic := segment 317 values0469

theorem block0469_domain : ExactDomain block0469 317 349 := by
  simpa only [values0469_size] using segment_domain 317 values0469

theorem block0469_get (i : Fin 32) :
    block0469 (317 + i.val) = some (values0469[i.val]'(by rw [values0469_size]; exact i.isLt)) := by
  exact segment_get 317 values0469 ⟨i.val, by rw [values0469_size]; exact i.isLt⟩

def values0470 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0470.coefficient30_349,
  OriginalRow227TriangleData0470.coefficient30_350,
  OriginalRow227TriangleData0470.coefficient30_351,
  OriginalRow227TriangleData0470.coefficient30_352,
  OriginalRow227TriangleData0470.coefficient30_353,
  OriginalRow227TriangleData0470.coefficient30_354,
  OriginalRow227TriangleData0470.coefficient30_355,
  OriginalRow227TriangleData0470.coefficient30_356,
  OriginalRow227TriangleData0470.coefficient30_357,
  OriginalRow227TriangleData0470.coefficient30_358,
  OriginalRow227TriangleData0470.coefficient30_359,
  OriginalRow227TriangleData0470.coefficient30_360,
  OriginalRow227TriangleData0470.coefficient30_361,
  OriginalRow227TriangleData0470.coefficient30_362,
  OriginalRow227TriangleData0470.coefficient30_363,
  OriginalRow227TriangleData0470.coefficient30_364,
  OriginalRow227TriangleData0470.coefficient30_365,
  OriginalRow227TriangleData0470.coefficient30_366,
  OriginalRow227TriangleData0470.coefficient30_367,
  OriginalRow227TriangleData0470.coefficient30_368,
  OriginalRow227TriangleData0470.coefficient30_369,
  OriginalRow227TriangleData0470.coefficient30_370,
  OriginalRow227TriangleData0470.coefficient30_371,
  OriginalRow227TriangleData0470.coefficient30_372,
  OriginalRow227TriangleData0470.coefficient30_373,
  OriginalRow227TriangleData0470.coefficient30_374,
  OriginalRow227TriangleData0470.coefficient30_375,
  OriginalRow227TriangleData0470.coefficient30_376,
  OriginalRow227TriangleData0470.coefficient30_377,
  OriginalRow227TriangleData0470.coefficient30_378,
  OriginalRow227TriangleData0470.coefficient30_379,
  OriginalRow227TriangleData0470.coefficient30_380
]

theorem values0470_size : values0470.size = 32 := rfl

def block0470 : ℕ → Option IntervalDyadic := segment 349 values0470

theorem block0470_domain : ExactDomain block0470 349 381 := by
  simpa only [values0470_size] using segment_domain 349 values0470

theorem block0470_get (i : Fin 32) :
    block0470 (349 + i.val) = some (values0470[i.val]'(by rw [values0470_size]; exact i.isLt)) := by
  exact segment_get 349 values0470 ⟨i.val, by rw [values0470_size]; exact i.isLt⟩

def values0471 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0471.coefficient30_381,
  OriginalRow227TriangleData0471.coefficient30_382,
  OriginalRow227TriangleData0471.coefficient30_383,
  OriginalRow227TriangleData0471.coefficient30_384,
  OriginalRow227TriangleData0471.coefficient30_385,
  OriginalRow227TriangleData0471.coefficient30_386,
  OriginalRow227TriangleData0471.coefficient30_387,
  OriginalRow227TriangleData0471.coefficient30_388,
  OriginalRow227TriangleData0471.coefficient30_389,
  OriginalRow227TriangleData0471.coefficient30_390,
  OriginalRow227TriangleData0471.coefficient30_391,
  OriginalRow227TriangleData0471.coefficient30_392,
  OriginalRow227TriangleData0471.coefficient30_393,
  OriginalRow227TriangleData0471.coefficient30_394,
  OriginalRow227TriangleData0471.coefficient30_395,
  OriginalRow227TriangleData0471.coefficient30_396,
  OriginalRow227TriangleData0471.coefficient30_397,
  OriginalRow227TriangleData0471.coefficient30_398,
  OriginalRow227TriangleData0471.coefficient30_399,
  OriginalRow227TriangleData0471.coefficient30_400,
  OriginalRow227TriangleData0471.coefficient30_401,
  OriginalRow227TriangleData0471.coefficient30_402,
  OriginalRow227TriangleData0471.coefficient30_403,
  OriginalRow227TriangleData0471.coefficient30_404,
  OriginalRow227TriangleData0471.coefficient30_405,
  OriginalRow227TriangleData0471.coefficient30_406,
  OriginalRow227TriangleData0471.coefficient30_407,
  OriginalRow227TriangleData0471.coefficient30_408,
  OriginalRow227TriangleData0471.coefficient30_409,
  OriginalRow227TriangleData0471.coefficient30_410,
  OriginalRow227TriangleData0471.coefficient30_411,
  OriginalRow227TriangleData0471.coefficient30_412
]

theorem values0471_size : values0471.size = 32 := rfl

def block0471 : ℕ → Option IntervalDyadic := segment 381 values0471

theorem block0471_domain : ExactDomain block0471 381 413 := by
  simpa only [values0471_size] using segment_domain 381 values0471

theorem block0471_get (i : Fin 32) :
    block0471 (381 + i.val) = some (values0471[i.val]'(by rw [values0471_size]; exact i.isLt)) := by
  exact segment_get 381 values0471 ⟨i.val, by rw [values0471_size]; exact i.isLt⟩

def values0472 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0472.coefficient30_413,
  OriginalRow227TriangleData0472.coefficient30_414,
  OriginalRow227TriangleData0472.coefficient30_415,
  OriginalRow227TriangleData0472.coefficient30_416,
  OriginalRow227TriangleData0472.coefficient30_417,
  OriginalRow227TriangleData0472.coefficient30_418,
  OriginalRow227TriangleData0472.coefficient30_419,
  OriginalRow227TriangleData0472.coefficient30_420,
  OriginalRow227TriangleData0472.coefficient30_421,
  OriginalRow227TriangleData0472.coefficient30_422,
  OriginalRow227TriangleData0472.coefficient30_423,
  OriginalRow227TriangleData0472.coefficient30_424,
  OriginalRow227TriangleData0472.coefficient30_425,
  OriginalRow227TriangleData0472.coefficient30_426,
  OriginalRow227TriangleData0472.coefficient30_427,
  OriginalRow227TriangleData0472.coefficient30_428,
  OriginalRow227TriangleData0472.coefficient30_429,
  OriginalRow227TriangleData0472.coefficient30_430,
  OriginalRow227TriangleData0472.coefficient30_431,
  OriginalRow227TriangleData0472.coefficient30_432,
  OriginalRow227TriangleData0472.coefficient30_433,
  OriginalRow227TriangleData0472.coefficient30_434,
  OriginalRow227TriangleData0472.coefficient30_435,
  OriginalRow227TriangleData0472.coefficient30_436,
  OriginalRow227TriangleData0472.coefficient30_437,
  OriginalRow227TriangleData0472.coefficient30_438,
  OriginalRow227TriangleData0472.coefficient30_439,
  OriginalRow227TriangleData0472.coefficient30_440,
  OriginalRow227TriangleData0472.coefficient30_441,
  OriginalRow227TriangleData0472.coefficient30_442,
  OriginalRow227TriangleData0472.coefficient30_443,
  OriginalRow227TriangleData0472.coefficient30_444
]

theorem values0472_size : values0472.size = 32 := rfl

def block0472 : ℕ → Option IntervalDyadic := segment 413 values0472

theorem block0472_domain : ExactDomain block0472 413 445 := by
  simpa only [values0472_size] using segment_domain 413 values0472

theorem block0472_get (i : Fin 32) :
    block0472 (413 + i.val) = some (values0472[i.val]'(by rw [values0472_size]; exact i.isLt)) := by
  exact segment_get 413 values0472 ⟨i.val, by rw [values0472_size]; exact i.isLt⟩

def values0473 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0473.coefficient30_445,
  OriginalRow227TriangleData0473.coefficient30_446,
  OriginalRow227TriangleData0473.coefficient30_447,
  OriginalRow227TriangleData0473.coefficient30_448,
  OriginalRow227TriangleData0473.coefficient30_449,
  OriginalRow227TriangleData0473.coefficient30_450,
  OriginalRow227TriangleData0473.coefficient30_451,
  OriginalRow227TriangleData0473.coefficient30_452,
  OriginalRow227TriangleData0473.coefficient30_453,
  OriginalRow227TriangleData0473.coefficient30_454,
  OriginalRow227TriangleData0473.coefficient30_455,
  OriginalRow227TriangleData0473.coefficient30_456,
  OriginalRow227TriangleData0473.coefficient30_457,
  OriginalRow227TriangleData0473.coefficient30_458,
  OriginalRow227TriangleData0473.coefficient30_459,
  OriginalRow227TriangleData0473.coefficient30_460,
  OriginalRow227TriangleData0473.coefficient30_461,
  OriginalRow227TriangleData0473.coefficient30_462,
  OriginalRow227TriangleData0473.coefficient30_463,
  OriginalRow227TriangleData0473.coefficient30_464,
  OriginalRow227TriangleData0473.coefficient30_465,
  OriginalRow227TriangleData0473.coefficient30_466,
  OriginalRow227TriangleData0473.coefficient30_467,
  OriginalRow227TriangleData0473.coefficient30_468,
  OriginalRow227TriangleData0473.coefficient30_469,
  OriginalRow227TriangleData0473.coefficient30_470,
  OriginalRow227TriangleData0473.coefficient30_471
]

theorem values0473_size : values0473.size = 27 := rfl

def block0473 : ℕ → Option IntervalDyadic := segment 445 values0473

theorem block0473_domain : ExactDomain block0473 445 472 := by
  simpa only [values0473_size] using segment_domain 445 values0473

theorem block0473_get (i : Fin 27) :
    block0473 (445 + i.val) = some (values0473[i.val]'(by rw [values0473_size]; exact i.isLt)) := by
  exact segment_get 445 values0473 ⟨i.val, by rw [values0473_size]; exact i.isLt⟩

def node0061_0125 : ℕ → Option IntervalDyadic := split 93 block0461 block0462

theorem node0061_0125_domain : ExactDomain node0061_0125 61 125 := by
  exact split_domain (by decide) (by decide) block0461_domain block0462_domain

def node0029_0125 : ℕ → Option IntervalDyadic := split 61 block0460 node0061_0125

theorem node0029_0125_domain : ExactDomain node0029_0125 29 125 := by
  exact split_domain (by decide) (by decide) block0460_domain node0061_0125_domain

def node0125_0189 : ℕ → Option IntervalDyadic := split 157 block0463 block0464

theorem node0125_0189_domain : ExactDomain node0125_0189 125 189 := by
  exact split_domain (by decide) (by decide) block0463_domain block0464_domain

def node0189_0253 : ℕ → Option IntervalDyadic := split 221 block0465 block0466

theorem node0189_0253_domain : ExactDomain node0189_0253 189 253 := by
  exact split_domain (by decide) (by decide) block0465_domain block0466_domain

def node0125_0253 : ℕ → Option IntervalDyadic := split 189 node0125_0189 node0189_0253

theorem node0125_0253_domain : ExactDomain node0125_0253 125 253 := by
  exact split_domain (by decide) (by decide) node0125_0189_domain node0189_0253_domain

def node0029_0253 : ℕ → Option IntervalDyadic := split 125 node0029_0125 node0125_0253

theorem node0029_0253_domain : ExactDomain node0029_0253 29 253 := by
  exact split_domain (by decide) (by decide) node0029_0125_domain node0125_0253_domain

def node0285_0349 : ℕ → Option IntervalDyadic := split 317 block0468 block0469

theorem node0285_0349_domain : ExactDomain node0285_0349 285 349 := by
  exact split_domain (by decide) (by decide) block0468_domain block0469_domain

def node0253_0349 : ℕ → Option IntervalDyadic := split 285 block0467 node0285_0349

theorem node0253_0349_domain : ExactDomain node0253_0349 253 349 := by
  exact split_domain (by decide) (by decide) block0467_domain node0285_0349_domain

def node0349_0413 : ℕ → Option IntervalDyadic := split 381 block0470 block0471

theorem node0349_0413_domain : ExactDomain node0349_0413 349 413 := by
  exact split_domain (by decide) (by decide) block0470_domain block0471_domain

def node0413_0472 : ℕ → Option IntervalDyadic := split 445 block0472 block0473

theorem node0413_0472_domain : ExactDomain node0413_0472 413 472 := by
  exact split_domain (by decide) (by decide) block0472_domain block0473_domain

def node0349_0472 : ℕ → Option IntervalDyadic := split 413 node0349_0413 node0413_0472

theorem node0349_0472_domain : ExactDomain node0349_0472 349 472 := by
  exact split_domain (by decide) (by decide) node0349_0413_domain node0413_0472_domain

def node0253_0472 : ℕ → Option IntervalDyadic := split 349 node0253_0349 node0349_0472

theorem node0253_0472_domain : ExactDomain node0253_0472 253 472 := by
  exact split_domain (by decide) (by decide) node0253_0349_domain node0349_0472_domain

def node0029_0472 : ℕ → Option IntervalDyadic := split 253 node0029_0253 node0253_0472

theorem node0029_0472_domain : ExactDomain node0029_0472 29 472 := by
  exact split_domain (by decide) (by decide) node0029_0253_domain node0253_0472_domain

def lookup : ℕ → Option IntervalDyadic := node0029_0472

theorem lookup_domain : ExactDomain lookup 29 472 :=
  node0029_0472_domain

theorem block0460_lookup (i : Fin 32) :
    lookup (29 + i.val) = some (values0460[i.val]'(by rw [values0460_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (29 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_left 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0029_0125, split_left 61 block0460 node0061_0125 (by omega)]
  exact block0460_get i

theorem block0461_lookup (i : Fin 32) :
    lookup (61 + i.val) = some (values0461[i.val]'(by rw [values0461_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (61 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_left 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0029_0125, split_right 61 block0460 node0061_0125 (by omega)]
  rw [node0061_0125, split_left 93 block0461 block0462 (by omega)]
  exact block0461_get i

theorem block0462_lookup (i : Fin 32) :
    lookup (93 + i.val) = some (values0462[i.val]'(by rw [values0462_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (93 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_left 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0029_0125, split_right 61 block0460 node0061_0125 (by omega)]
  rw [node0061_0125, split_right 93 block0461 block0462 (by omega)]
  exact block0462_get i

theorem block0463_lookup (i : Fin 32) :
    lookup (125 + i.val) = some (values0463[i.val]'(by rw [values0463_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (125 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_right 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0125_0253, split_left 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0125_0189, split_left 157 block0463 block0464 (by omega)]
  exact block0463_get i

theorem block0464_lookup (i : Fin 32) :
    lookup (157 + i.val) = some (values0464[i.val]'(by rw [values0464_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (157 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_right 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0125_0253, split_left 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0125_0189, split_right 157 block0463 block0464 (by omega)]
  exact block0464_get i

theorem block0465_lookup (i : Fin 32) :
    lookup (189 + i.val) = some (values0465[i.val]'(by rw [values0465_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (189 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_right 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0125_0253, split_right 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0189_0253, split_left 221 block0465 block0466 (by omega)]
  exact block0465_get i

theorem block0466_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values0466[i.val]'(by rw [values0466_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (221 + i.val) = _
  rw [node0029_0472, split_left 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0029_0253, split_right 125 node0029_0125 node0125_0253 (by omega)]
  rw [node0125_0253, split_right 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0189_0253, split_right 221 block0465 block0466 (by omega)]
  exact block0466_get i

theorem block0467_lookup (i : Fin 32) :
    lookup (253 + i.val) = some (values0467[i.val]'(by rw [values0467_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (253 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_left 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0253_0349, split_left 285 block0467 node0285_0349 (by omega)]
  exact block0467_get i

theorem block0468_lookup (i : Fin 32) :
    lookup (285 + i.val) = some (values0468[i.val]'(by rw [values0468_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (285 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_left 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0253_0349, split_right 285 block0467 node0285_0349 (by omega)]
  rw [node0285_0349, split_left 317 block0468 block0469 (by omega)]
  exact block0468_get i

theorem block0469_lookup (i : Fin 32) :
    lookup (317 + i.val) = some (values0469[i.val]'(by rw [values0469_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (317 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_left 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0253_0349, split_right 285 block0467 node0285_0349 (by omega)]
  rw [node0285_0349, split_right 317 block0468 block0469 (by omega)]
  exact block0469_get i

theorem block0470_lookup (i : Fin 32) :
    lookup (349 + i.val) = some (values0470[i.val]'(by rw [values0470_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (349 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_right 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0349_0472, split_left 413 node0349_0413 node0413_0472 (by omega)]
  rw [node0349_0413, split_left 381 block0470 block0471 (by omega)]
  exact block0470_get i

theorem block0471_lookup (i : Fin 32) :
    lookup (381 + i.val) = some (values0471[i.val]'(by rw [values0471_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (381 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_right 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0349_0472, split_left 413 node0349_0413 node0413_0472 (by omega)]
  rw [node0349_0413, split_right 381 block0470 block0471 (by omega)]
  exact block0471_get i

theorem block0472_lookup (i : Fin 32) :
    lookup (413 + i.val) = some (values0472[i.val]'(by rw [values0472_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (413 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_right 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0349_0472, split_right 413 node0349_0413 node0413_0472 (by omega)]
  rw [node0413_0472, split_left 445 block0472 block0473 (by omega)]
  exact block0472_get i

theorem block0473_lookup (i : Fin 27) :
    lookup (445 + i.val) = some (values0473[i.val]'(by rw [values0473_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0029_0472 (445 + i.val) = _
  rw [node0029_0472, split_right 253 node0029_0253 node0253_0472 (by omega)]
  rw [node0253_0472, split_right 349 node0253_0349 node0349_0472 (by omega)]
  rw [node0349_0472, split_right 413 node0349_0413 node0413_0472 (by omega)]
  rw [node0413_0472, split_right 445 block0472 block0473 (by omega)]
  exact block0473_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0460_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0460_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0461_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0461_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0462_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0462_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0463_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0463_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0464_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0464_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0465_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0465_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0466_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0466_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0467_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0467_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0468_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0468_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0469_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0469_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0470_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0470_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0471_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0471_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0472_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0472_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0473_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0473_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0460_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0461_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0462_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0463_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0464_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0465_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0466_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0467_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0468_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0469_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0470_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0471_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0472_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow030.block0473_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow030
