import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0474
import Grothe.UpperChaos.OriginalRow227TriangleData0475
import Grothe.UpperChaos.OriginalRow227TriangleData0476
import Grothe.UpperChaos.OriginalRow227TriangleData0477
import Grothe.UpperChaos.OriginalRow227TriangleData0478
import Grothe.UpperChaos.OriginalRow227TriangleData0479
import Grothe.UpperChaos.OriginalRow227TriangleData0480
import Grothe.UpperChaos.OriginalRow227TriangleData0481
import Grothe.UpperChaos.OriginalRow227TriangleData0482
import Grothe.UpperChaos.OriginalRow227TriangleData0483
import Grothe.UpperChaos.OriginalRow227TriangleData0484
import Grothe.UpperChaos.OriginalRow227TriangleData0485
import Grothe.UpperChaos.OriginalRow227TriangleData0486
import Grothe.UpperChaos.OriginalRow227TriangleData0487

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow031

open ConditionalTableLookup

def values0474 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0474.coefficient31_30,
  OriginalRow227TriangleData0474.coefficient31_31,
  OriginalRow227TriangleData0474.coefficient31_32,
  OriginalRow227TriangleData0474.coefficient31_33,
  OriginalRow227TriangleData0474.coefficient31_34,
  OriginalRow227TriangleData0474.coefficient31_35,
  OriginalRow227TriangleData0474.coefficient31_36,
  OriginalRow227TriangleData0474.coefficient31_37,
  OriginalRow227TriangleData0474.coefficient31_38,
  OriginalRow227TriangleData0474.coefficient31_39,
  OriginalRow227TriangleData0474.coefficient31_40,
  OriginalRow227TriangleData0474.coefficient31_41,
  OriginalRow227TriangleData0474.coefficient31_42,
  OriginalRow227TriangleData0474.coefficient31_43,
  OriginalRow227TriangleData0474.coefficient31_44,
  OriginalRow227TriangleData0474.coefficient31_45,
  OriginalRow227TriangleData0474.coefficient31_46,
  OriginalRow227TriangleData0474.coefficient31_47,
  OriginalRow227TriangleData0474.coefficient31_48,
  OriginalRow227TriangleData0474.coefficient31_49,
  OriginalRow227TriangleData0474.coefficient31_50,
  OriginalRow227TriangleData0474.coefficient31_51,
  OriginalRow227TriangleData0474.coefficient31_52,
  OriginalRow227TriangleData0474.coefficient31_53,
  OriginalRow227TriangleData0474.coefficient31_54,
  OriginalRow227TriangleData0474.coefficient31_55,
  OriginalRow227TriangleData0474.coefficient31_56,
  OriginalRow227TriangleData0474.coefficient31_57,
  OriginalRow227TriangleData0474.coefficient31_58,
  OriginalRow227TriangleData0474.coefficient31_59,
  OriginalRow227TriangleData0474.coefficient31_60,
  OriginalRow227TriangleData0474.coefficient31_61
]

theorem values0474_size : values0474.size = 32 := rfl

def block0474 : ℕ → Option IntervalDyadic := segment 30 values0474

theorem block0474_domain : ExactDomain block0474 30 62 := by
  simpa only [values0474_size] using segment_domain 30 values0474

theorem block0474_get (i : Fin 32) :
    block0474 (30 + i.val) = some (values0474[i.val]'(by rw [values0474_size]; exact i.isLt)) := by
  exact segment_get 30 values0474 ⟨i.val, by rw [values0474_size]; exact i.isLt⟩

def values0475 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0475.coefficient31_62,
  OriginalRow227TriangleData0475.coefficient31_63,
  OriginalRow227TriangleData0475.coefficient31_64,
  OriginalRow227TriangleData0475.coefficient31_65,
  OriginalRow227TriangleData0475.coefficient31_66,
  OriginalRow227TriangleData0475.coefficient31_67,
  OriginalRow227TriangleData0475.coefficient31_68,
  OriginalRow227TriangleData0475.coefficient31_69,
  OriginalRow227TriangleData0475.coefficient31_70,
  OriginalRow227TriangleData0475.coefficient31_71,
  OriginalRow227TriangleData0475.coefficient31_72,
  OriginalRow227TriangleData0475.coefficient31_73,
  OriginalRow227TriangleData0475.coefficient31_74,
  OriginalRow227TriangleData0475.coefficient31_75,
  OriginalRow227TriangleData0475.coefficient31_76,
  OriginalRow227TriangleData0475.coefficient31_77,
  OriginalRow227TriangleData0475.coefficient31_78,
  OriginalRow227TriangleData0475.coefficient31_79,
  OriginalRow227TriangleData0475.coefficient31_80,
  OriginalRow227TriangleData0475.coefficient31_81,
  OriginalRow227TriangleData0475.coefficient31_82,
  OriginalRow227TriangleData0475.coefficient31_83,
  OriginalRow227TriangleData0475.coefficient31_84,
  OriginalRow227TriangleData0475.coefficient31_85,
  OriginalRow227TriangleData0475.coefficient31_86,
  OriginalRow227TriangleData0475.coefficient31_87,
  OriginalRow227TriangleData0475.coefficient31_88,
  OriginalRow227TriangleData0475.coefficient31_89,
  OriginalRow227TriangleData0475.coefficient31_90,
  OriginalRow227TriangleData0475.coefficient31_91,
  OriginalRow227TriangleData0475.coefficient31_92,
  OriginalRow227TriangleData0475.coefficient31_93
]

theorem values0475_size : values0475.size = 32 := rfl

def block0475 : ℕ → Option IntervalDyadic := segment 62 values0475

theorem block0475_domain : ExactDomain block0475 62 94 := by
  simpa only [values0475_size] using segment_domain 62 values0475

theorem block0475_get (i : Fin 32) :
    block0475 (62 + i.val) = some (values0475[i.val]'(by rw [values0475_size]; exact i.isLt)) := by
  exact segment_get 62 values0475 ⟨i.val, by rw [values0475_size]; exact i.isLt⟩

def values0476 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0476.coefficient31_94,
  OriginalRow227TriangleData0476.coefficient31_95,
  OriginalRow227TriangleData0476.coefficient31_96,
  OriginalRow227TriangleData0476.coefficient31_97,
  OriginalRow227TriangleData0476.coefficient31_98,
  OriginalRow227TriangleData0476.coefficient31_99,
  OriginalRow227TriangleData0476.coefficient31_100,
  OriginalRow227TriangleData0476.coefficient31_101,
  OriginalRow227TriangleData0476.coefficient31_102,
  OriginalRow227TriangleData0476.coefficient31_103,
  OriginalRow227TriangleData0476.coefficient31_104,
  OriginalRow227TriangleData0476.coefficient31_105,
  OriginalRow227TriangleData0476.coefficient31_106,
  OriginalRow227TriangleData0476.coefficient31_107,
  OriginalRow227TriangleData0476.coefficient31_108,
  OriginalRow227TriangleData0476.coefficient31_109,
  OriginalRow227TriangleData0476.coefficient31_110,
  OriginalRow227TriangleData0476.coefficient31_111,
  OriginalRow227TriangleData0476.coefficient31_112,
  OriginalRow227TriangleData0476.coefficient31_113,
  OriginalRow227TriangleData0476.coefficient31_114,
  OriginalRow227TriangleData0476.coefficient31_115,
  OriginalRow227TriangleData0476.coefficient31_116,
  OriginalRow227TriangleData0476.coefficient31_117,
  OriginalRow227TriangleData0476.coefficient31_118,
  OriginalRow227TriangleData0476.coefficient31_119,
  OriginalRow227TriangleData0476.coefficient31_120,
  OriginalRow227TriangleData0476.coefficient31_121,
  OriginalRow227TriangleData0476.coefficient31_122,
  OriginalRow227TriangleData0476.coefficient31_123,
  OriginalRow227TriangleData0476.coefficient31_124,
  OriginalRow227TriangleData0476.coefficient31_125
]

theorem values0476_size : values0476.size = 32 := rfl

def block0476 : ℕ → Option IntervalDyadic := segment 94 values0476

theorem block0476_domain : ExactDomain block0476 94 126 := by
  simpa only [values0476_size] using segment_domain 94 values0476

theorem block0476_get (i : Fin 32) :
    block0476 (94 + i.val) = some (values0476[i.val]'(by rw [values0476_size]; exact i.isLt)) := by
  exact segment_get 94 values0476 ⟨i.val, by rw [values0476_size]; exact i.isLt⟩

def values0477 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0477.coefficient31_126,
  OriginalRow227TriangleData0477.coefficient31_127,
  OriginalRow227TriangleData0477.coefficient31_128,
  OriginalRow227TriangleData0477.coefficient31_129,
  OriginalRow227TriangleData0477.coefficient31_130,
  OriginalRow227TriangleData0477.coefficient31_131,
  OriginalRow227TriangleData0477.coefficient31_132,
  OriginalRow227TriangleData0477.coefficient31_133,
  OriginalRow227TriangleData0477.coefficient31_134,
  OriginalRow227TriangleData0477.coefficient31_135,
  OriginalRow227TriangleData0477.coefficient31_136,
  OriginalRow227TriangleData0477.coefficient31_137,
  OriginalRow227TriangleData0477.coefficient31_138,
  OriginalRow227TriangleData0477.coefficient31_139,
  OriginalRow227TriangleData0477.coefficient31_140,
  OriginalRow227TriangleData0477.coefficient31_141,
  OriginalRow227TriangleData0477.coefficient31_142,
  OriginalRow227TriangleData0477.coefficient31_143,
  OriginalRow227TriangleData0477.coefficient31_144,
  OriginalRow227TriangleData0477.coefficient31_145,
  OriginalRow227TriangleData0477.coefficient31_146,
  OriginalRow227TriangleData0477.coefficient31_147,
  OriginalRow227TriangleData0477.coefficient31_148,
  OriginalRow227TriangleData0477.coefficient31_149,
  OriginalRow227TriangleData0477.coefficient31_150,
  OriginalRow227TriangleData0477.coefficient31_151,
  OriginalRow227TriangleData0477.coefficient31_152,
  OriginalRow227TriangleData0477.coefficient31_153,
  OriginalRow227TriangleData0477.coefficient31_154,
  OriginalRow227TriangleData0477.coefficient31_155,
  OriginalRow227TriangleData0477.coefficient31_156,
  OriginalRow227TriangleData0477.coefficient31_157
]

theorem values0477_size : values0477.size = 32 := rfl

def block0477 : ℕ → Option IntervalDyadic := segment 126 values0477

theorem block0477_domain : ExactDomain block0477 126 158 := by
  simpa only [values0477_size] using segment_domain 126 values0477

theorem block0477_get (i : Fin 32) :
    block0477 (126 + i.val) = some (values0477[i.val]'(by rw [values0477_size]; exact i.isLt)) := by
  exact segment_get 126 values0477 ⟨i.val, by rw [values0477_size]; exact i.isLt⟩

def values0478 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0478.coefficient31_158,
  OriginalRow227TriangleData0478.coefficient31_159,
  OriginalRow227TriangleData0478.coefficient31_160,
  OriginalRow227TriangleData0478.coefficient31_161,
  OriginalRow227TriangleData0478.coefficient31_162,
  OriginalRow227TriangleData0478.coefficient31_163,
  OriginalRow227TriangleData0478.coefficient31_164,
  OriginalRow227TriangleData0478.coefficient31_165,
  OriginalRow227TriangleData0478.coefficient31_166,
  OriginalRow227TriangleData0478.coefficient31_167,
  OriginalRow227TriangleData0478.coefficient31_168,
  OriginalRow227TriangleData0478.coefficient31_169,
  OriginalRow227TriangleData0478.coefficient31_170,
  OriginalRow227TriangleData0478.coefficient31_171,
  OriginalRow227TriangleData0478.coefficient31_172,
  OriginalRow227TriangleData0478.coefficient31_173,
  OriginalRow227TriangleData0478.coefficient31_174,
  OriginalRow227TriangleData0478.coefficient31_175,
  OriginalRow227TriangleData0478.coefficient31_176,
  OriginalRow227TriangleData0478.coefficient31_177,
  OriginalRow227TriangleData0478.coefficient31_178,
  OriginalRow227TriangleData0478.coefficient31_179,
  OriginalRow227TriangleData0478.coefficient31_180,
  OriginalRow227TriangleData0478.coefficient31_181,
  OriginalRow227TriangleData0478.coefficient31_182,
  OriginalRow227TriangleData0478.coefficient31_183,
  OriginalRow227TriangleData0478.coefficient31_184,
  OriginalRow227TriangleData0478.coefficient31_185,
  OriginalRow227TriangleData0478.coefficient31_186,
  OriginalRow227TriangleData0478.coefficient31_187,
  OriginalRow227TriangleData0478.coefficient31_188,
  OriginalRow227TriangleData0478.coefficient31_189
]

theorem values0478_size : values0478.size = 32 := rfl

def block0478 : ℕ → Option IntervalDyadic := segment 158 values0478

theorem block0478_domain : ExactDomain block0478 158 190 := by
  simpa only [values0478_size] using segment_domain 158 values0478

theorem block0478_get (i : Fin 32) :
    block0478 (158 + i.val) = some (values0478[i.val]'(by rw [values0478_size]; exact i.isLt)) := by
  exact segment_get 158 values0478 ⟨i.val, by rw [values0478_size]; exact i.isLt⟩

def values0479 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0479.coefficient31_190,
  OriginalRow227TriangleData0479.coefficient31_191,
  OriginalRow227TriangleData0479.coefficient31_192,
  OriginalRow227TriangleData0479.coefficient31_193,
  OriginalRow227TriangleData0479.coefficient31_194,
  OriginalRow227TriangleData0479.coefficient31_195,
  OriginalRow227TriangleData0479.coefficient31_196,
  OriginalRow227TriangleData0479.coefficient31_197,
  OriginalRow227TriangleData0479.coefficient31_198,
  OriginalRow227TriangleData0479.coefficient31_199,
  OriginalRow227TriangleData0479.coefficient31_200,
  OriginalRow227TriangleData0479.coefficient31_201,
  OriginalRow227TriangleData0479.coefficient31_202,
  OriginalRow227TriangleData0479.coefficient31_203,
  OriginalRow227TriangleData0479.coefficient31_204,
  OriginalRow227TriangleData0479.coefficient31_205,
  OriginalRow227TriangleData0479.coefficient31_206,
  OriginalRow227TriangleData0479.coefficient31_207,
  OriginalRow227TriangleData0479.coefficient31_208,
  OriginalRow227TriangleData0479.coefficient31_209,
  OriginalRow227TriangleData0479.coefficient31_210,
  OriginalRow227TriangleData0479.coefficient31_211,
  OriginalRow227TriangleData0479.coefficient31_212,
  OriginalRow227TriangleData0479.coefficient31_213,
  OriginalRow227TriangleData0479.coefficient31_214,
  OriginalRow227TriangleData0479.coefficient31_215,
  OriginalRow227TriangleData0479.coefficient31_216,
  OriginalRow227TriangleData0479.coefficient31_217,
  OriginalRow227TriangleData0479.coefficient31_218,
  OriginalRow227TriangleData0479.coefficient31_219,
  OriginalRow227TriangleData0479.coefficient31_220,
  OriginalRow227TriangleData0479.coefficient31_221
]

theorem values0479_size : values0479.size = 32 := rfl

def block0479 : ℕ → Option IntervalDyadic := segment 190 values0479

theorem block0479_domain : ExactDomain block0479 190 222 := by
  simpa only [values0479_size] using segment_domain 190 values0479

theorem block0479_get (i : Fin 32) :
    block0479 (190 + i.val) = some (values0479[i.val]'(by rw [values0479_size]; exact i.isLt)) := by
  exact segment_get 190 values0479 ⟨i.val, by rw [values0479_size]; exact i.isLt⟩

def values0480 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0480.coefficient31_222,
  OriginalRow227TriangleData0480.coefficient31_223,
  OriginalRow227TriangleData0480.coefficient31_224,
  OriginalRow227TriangleData0480.coefficient31_225,
  OriginalRow227TriangleData0480.coefficient31_226,
  OriginalRow227TriangleData0480.coefficient31_227,
  OriginalRow227TriangleData0480.coefficient31_228,
  OriginalRow227TriangleData0480.coefficient31_229,
  OriginalRow227TriangleData0480.coefficient31_230,
  OriginalRow227TriangleData0480.coefficient31_231,
  OriginalRow227TriangleData0480.coefficient31_232,
  OriginalRow227TriangleData0480.coefficient31_233,
  OriginalRow227TriangleData0480.coefficient31_234,
  OriginalRow227TriangleData0480.coefficient31_235,
  OriginalRow227TriangleData0480.coefficient31_236,
  OriginalRow227TriangleData0480.coefficient31_237,
  OriginalRow227TriangleData0480.coefficient31_238,
  OriginalRow227TriangleData0480.coefficient31_239,
  OriginalRow227TriangleData0480.coefficient31_240,
  OriginalRow227TriangleData0480.coefficient31_241,
  OriginalRow227TriangleData0480.coefficient31_242,
  OriginalRow227TriangleData0480.coefficient31_243,
  OriginalRow227TriangleData0480.coefficient31_244,
  OriginalRow227TriangleData0480.coefficient31_245,
  OriginalRow227TriangleData0480.coefficient31_246,
  OriginalRow227TriangleData0480.coefficient31_247,
  OriginalRow227TriangleData0480.coefficient31_248,
  OriginalRow227TriangleData0480.coefficient31_249,
  OriginalRow227TriangleData0480.coefficient31_250,
  OriginalRow227TriangleData0480.coefficient31_251,
  OriginalRow227TriangleData0480.coefficient31_252,
  OriginalRow227TriangleData0480.coefficient31_253
]

theorem values0480_size : values0480.size = 32 := rfl

def block0480 : ℕ → Option IntervalDyadic := segment 222 values0480

theorem block0480_domain : ExactDomain block0480 222 254 := by
  simpa only [values0480_size] using segment_domain 222 values0480

theorem block0480_get (i : Fin 32) :
    block0480 (222 + i.val) = some (values0480[i.val]'(by rw [values0480_size]; exact i.isLt)) := by
  exact segment_get 222 values0480 ⟨i.val, by rw [values0480_size]; exact i.isLt⟩

def values0481 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0481.coefficient31_254,
  OriginalRow227TriangleData0481.coefficient31_255,
  OriginalRow227TriangleData0481.coefficient31_256,
  OriginalRow227TriangleData0481.coefficient31_257,
  OriginalRow227TriangleData0481.coefficient31_258,
  OriginalRow227TriangleData0481.coefficient31_259,
  OriginalRow227TriangleData0481.coefficient31_260,
  OriginalRow227TriangleData0481.coefficient31_261,
  OriginalRow227TriangleData0481.coefficient31_262,
  OriginalRow227TriangleData0481.coefficient31_263,
  OriginalRow227TriangleData0481.coefficient31_264,
  OriginalRow227TriangleData0481.coefficient31_265,
  OriginalRow227TriangleData0481.coefficient31_266,
  OriginalRow227TriangleData0481.coefficient31_267,
  OriginalRow227TriangleData0481.coefficient31_268,
  OriginalRow227TriangleData0481.coefficient31_269,
  OriginalRow227TriangleData0481.coefficient31_270,
  OriginalRow227TriangleData0481.coefficient31_271,
  OriginalRow227TriangleData0481.coefficient31_272,
  OriginalRow227TriangleData0481.coefficient31_273,
  OriginalRow227TriangleData0481.coefficient31_274,
  OriginalRow227TriangleData0481.coefficient31_275,
  OriginalRow227TriangleData0481.coefficient31_276,
  OriginalRow227TriangleData0481.coefficient31_277,
  OriginalRow227TriangleData0481.coefficient31_278,
  OriginalRow227TriangleData0481.coefficient31_279,
  OriginalRow227TriangleData0481.coefficient31_280,
  OriginalRow227TriangleData0481.coefficient31_281,
  OriginalRow227TriangleData0481.coefficient31_282,
  OriginalRow227TriangleData0481.coefficient31_283,
  OriginalRow227TriangleData0481.coefficient31_284,
  OriginalRow227TriangleData0481.coefficient31_285
]

theorem values0481_size : values0481.size = 32 := rfl

def block0481 : ℕ → Option IntervalDyadic := segment 254 values0481

theorem block0481_domain : ExactDomain block0481 254 286 := by
  simpa only [values0481_size] using segment_domain 254 values0481

theorem block0481_get (i : Fin 32) :
    block0481 (254 + i.val) = some (values0481[i.val]'(by rw [values0481_size]; exact i.isLt)) := by
  exact segment_get 254 values0481 ⟨i.val, by rw [values0481_size]; exact i.isLt⟩

def values0482 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0482.coefficient31_286,
  OriginalRow227TriangleData0482.coefficient31_287,
  OriginalRow227TriangleData0482.coefficient31_288,
  OriginalRow227TriangleData0482.coefficient31_289,
  OriginalRow227TriangleData0482.coefficient31_290,
  OriginalRow227TriangleData0482.coefficient31_291,
  OriginalRow227TriangleData0482.coefficient31_292,
  OriginalRow227TriangleData0482.coefficient31_293,
  OriginalRow227TriangleData0482.coefficient31_294,
  OriginalRow227TriangleData0482.coefficient31_295,
  OriginalRow227TriangleData0482.coefficient31_296,
  OriginalRow227TriangleData0482.coefficient31_297,
  OriginalRow227TriangleData0482.coefficient31_298,
  OriginalRow227TriangleData0482.coefficient31_299,
  OriginalRow227TriangleData0482.coefficient31_300,
  OriginalRow227TriangleData0482.coefficient31_301,
  OriginalRow227TriangleData0482.coefficient31_302,
  OriginalRow227TriangleData0482.coefficient31_303,
  OriginalRow227TriangleData0482.coefficient31_304,
  OriginalRow227TriangleData0482.coefficient31_305,
  OriginalRow227TriangleData0482.coefficient31_306,
  OriginalRow227TriangleData0482.coefficient31_307,
  OriginalRow227TriangleData0482.coefficient31_308,
  OriginalRow227TriangleData0482.coefficient31_309,
  OriginalRow227TriangleData0482.coefficient31_310,
  OriginalRow227TriangleData0482.coefficient31_311,
  OriginalRow227TriangleData0482.coefficient31_312,
  OriginalRow227TriangleData0482.coefficient31_313,
  OriginalRow227TriangleData0482.coefficient31_314,
  OriginalRow227TriangleData0482.coefficient31_315,
  OriginalRow227TriangleData0482.coefficient31_316,
  OriginalRow227TriangleData0482.coefficient31_317
]

theorem values0482_size : values0482.size = 32 := rfl

def block0482 : ℕ → Option IntervalDyadic := segment 286 values0482

theorem block0482_domain : ExactDomain block0482 286 318 := by
  simpa only [values0482_size] using segment_domain 286 values0482

theorem block0482_get (i : Fin 32) :
    block0482 (286 + i.val) = some (values0482[i.val]'(by rw [values0482_size]; exact i.isLt)) := by
  exact segment_get 286 values0482 ⟨i.val, by rw [values0482_size]; exact i.isLt⟩

def values0483 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0483.coefficient31_318,
  OriginalRow227TriangleData0483.coefficient31_319,
  OriginalRow227TriangleData0483.coefficient31_320,
  OriginalRow227TriangleData0483.coefficient31_321,
  OriginalRow227TriangleData0483.coefficient31_322,
  OriginalRow227TriangleData0483.coefficient31_323,
  OriginalRow227TriangleData0483.coefficient31_324,
  OriginalRow227TriangleData0483.coefficient31_325,
  OriginalRow227TriangleData0483.coefficient31_326,
  OriginalRow227TriangleData0483.coefficient31_327,
  OriginalRow227TriangleData0483.coefficient31_328,
  OriginalRow227TriangleData0483.coefficient31_329,
  OriginalRow227TriangleData0483.coefficient31_330,
  OriginalRow227TriangleData0483.coefficient31_331,
  OriginalRow227TriangleData0483.coefficient31_332,
  OriginalRow227TriangleData0483.coefficient31_333,
  OriginalRow227TriangleData0483.coefficient31_334,
  OriginalRow227TriangleData0483.coefficient31_335,
  OriginalRow227TriangleData0483.coefficient31_336,
  OriginalRow227TriangleData0483.coefficient31_337,
  OriginalRow227TriangleData0483.coefficient31_338,
  OriginalRow227TriangleData0483.coefficient31_339,
  OriginalRow227TriangleData0483.coefficient31_340,
  OriginalRow227TriangleData0483.coefficient31_341,
  OriginalRow227TriangleData0483.coefficient31_342,
  OriginalRow227TriangleData0483.coefficient31_343,
  OriginalRow227TriangleData0483.coefficient31_344,
  OriginalRow227TriangleData0483.coefficient31_345,
  OriginalRow227TriangleData0483.coefficient31_346,
  OriginalRow227TriangleData0483.coefficient31_347,
  OriginalRow227TriangleData0483.coefficient31_348,
  OriginalRow227TriangleData0483.coefficient31_349
]

theorem values0483_size : values0483.size = 32 := rfl

def block0483 : ℕ → Option IntervalDyadic := segment 318 values0483

theorem block0483_domain : ExactDomain block0483 318 350 := by
  simpa only [values0483_size] using segment_domain 318 values0483

theorem block0483_get (i : Fin 32) :
    block0483 (318 + i.val) = some (values0483[i.val]'(by rw [values0483_size]; exact i.isLt)) := by
  exact segment_get 318 values0483 ⟨i.val, by rw [values0483_size]; exact i.isLt⟩

def values0484 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0484.coefficient31_350,
  OriginalRow227TriangleData0484.coefficient31_351,
  OriginalRow227TriangleData0484.coefficient31_352,
  OriginalRow227TriangleData0484.coefficient31_353,
  OriginalRow227TriangleData0484.coefficient31_354,
  OriginalRow227TriangleData0484.coefficient31_355,
  OriginalRow227TriangleData0484.coefficient31_356,
  OriginalRow227TriangleData0484.coefficient31_357,
  OriginalRow227TriangleData0484.coefficient31_358,
  OriginalRow227TriangleData0484.coefficient31_359,
  OriginalRow227TriangleData0484.coefficient31_360,
  OriginalRow227TriangleData0484.coefficient31_361,
  OriginalRow227TriangleData0484.coefficient31_362,
  OriginalRow227TriangleData0484.coefficient31_363,
  OriginalRow227TriangleData0484.coefficient31_364,
  OriginalRow227TriangleData0484.coefficient31_365,
  OriginalRow227TriangleData0484.coefficient31_366,
  OriginalRow227TriangleData0484.coefficient31_367,
  OriginalRow227TriangleData0484.coefficient31_368,
  OriginalRow227TriangleData0484.coefficient31_369,
  OriginalRow227TriangleData0484.coefficient31_370,
  OriginalRow227TriangleData0484.coefficient31_371,
  OriginalRow227TriangleData0484.coefficient31_372,
  OriginalRow227TriangleData0484.coefficient31_373,
  OriginalRow227TriangleData0484.coefficient31_374,
  OriginalRow227TriangleData0484.coefficient31_375,
  OriginalRow227TriangleData0484.coefficient31_376,
  OriginalRow227TriangleData0484.coefficient31_377,
  OriginalRow227TriangleData0484.coefficient31_378,
  OriginalRow227TriangleData0484.coefficient31_379,
  OriginalRow227TriangleData0484.coefficient31_380,
  OriginalRow227TriangleData0484.coefficient31_381
]

theorem values0484_size : values0484.size = 32 := rfl

def block0484 : ℕ → Option IntervalDyadic := segment 350 values0484

theorem block0484_domain : ExactDomain block0484 350 382 := by
  simpa only [values0484_size] using segment_domain 350 values0484

theorem block0484_get (i : Fin 32) :
    block0484 (350 + i.val) = some (values0484[i.val]'(by rw [values0484_size]; exact i.isLt)) := by
  exact segment_get 350 values0484 ⟨i.val, by rw [values0484_size]; exact i.isLt⟩

def values0485 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0485.coefficient31_382,
  OriginalRow227TriangleData0485.coefficient31_383,
  OriginalRow227TriangleData0485.coefficient31_384,
  OriginalRow227TriangleData0485.coefficient31_385,
  OriginalRow227TriangleData0485.coefficient31_386,
  OriginalRow227TriangleData0485.coefficient31_387,
  OriginalRow227TriangleData0485.coefficient31_388,
  OriginalRow227TriangleData0485.coefficient31_389,
  OriginalRow227TriangleData0485.coefficient31_390,
  OriginalRow227TriangleData0485.coefficient31_391,
  OriginalRow227TriangleData0485.coefficient31_392,
  OriginalRow227TriangleData0485.coefficient31_393,
  OriginalRow227TriangleData0485.coefficient31_394,
  OriginalRow227TriangleData0485.coefficient31_395,
  OriginalRow227TriangleData0485.coefficient31_396,
  OriginalRow227TriangleData0485.coefficient31_397,
  OriginalRow227TriangleData0485.coefficient31_398,
  OriginalRow227TriangleData0485.coefficient31_399,
  OriginalRow227TriangleData0485.coefficient31_400,
  OriginalRow227TriangleData0485.coefficient31_401,
  OriginalRow227TriangleData0485.coefficient31_402,
  OriginalRow227TriangleData0485.coefficient31_403,
  OriginalRow227TriangleData0485.coefficient31_404,
  OriginalRow227TriangleData0485.coefficient31_405,
  OriginalRow227TriangleData0485.coefficient31_406,
  OriginalRow227TriangleData0485.coefficient31_407,
  OriginalRow227TriangleData0485.coefficient31_408,
  OriginalRow227TriangleData0485.coefficient31_409,
  OriginalRow227TriangleData0485.coefficient31_410,
  OriginalRow227TriangleData0485.coefficient31_411,
  OriginalRow227TriangleData0485.coefficient31_412,
  OriginalRow227TriangleData0485.coefficient31_413
]

theorem values0485_size : values0485.size = 32 := rfl

def block0485 : ℕ → Option IntervalDyadic := segment 382 values0485

theorem block0485_domain : ExactDomain block0485 382 414 := by
  simpa only [values0485_size] using segment_domain 382 values0485

theorem block0485_get (i : Fin 32) :
    block0485 (382 + i.val) = some (values0485[i.val]'(by rw [values0485_size]; exact i.isLt)) := by
  exact segment_get 382 values0485 ⟨i.val, by rw [values0485_size]; exact i.isLt⟩

def values0486 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0486.coefficient31_414,
  OriginalRow227TriangleData0486.coefficient31_415,
  OriginalRow227TriangleData0486.coefficient31_416,
  OriginalRow227TriangleData0486.coefficient31_417,
  OriginalRow227TriangleData0486.coefficient31_418,
  OriginalRow227TriangleData0486.coefficient31_419,
  OriginalRow227TriangleData0486.coefficient31_420,
  OriginalRow227TriangleData0486.coefficient31_421,
  OriginalRow227TriangleData0486.coefficient31_422,
  OriginalRow227TriangleData0486.coefficient31_423,
  OriginalRow227TriangleData0486.coefficient31_424,
  OriginalRow227TriangleData0486.coefficient31_425,
  OriginalRow227TriangleData0486.coefficient31_426,
  OriginalRow227TriangleData0486.coefficient31_427,
  OriginalRow227TriangleData0486.coefficient31_428,
  OriginalRow227TriangleData0486.coefficient31_429,
  OriginalRow227TriangleData0486.coefficient31_430,
  OriginalRow227TriangleData0486.coefficient31_431,
  OriginalRow227TriangleData0486.coefficient31_432,
  OriginalRow227TriangleData0486.coefficient31_433,
  OriginalRow227TriangleData0486.coefficient31_434,
  OriginalRow227TriangleData0486.coefficient31_435,
  OriginalRow227TriangleData0486.coefficient31_436,
  OriginalRow227TriangleData0486.coefficient31_437,
  OriginalRow227TriangleData0486.coefficient31_438,
  OriginalRow227TriangleData0486.coefficient31_439,
  OriginalRow227TriangleData0486.coefficient31_440,
  OriginalRow227TriangleData0486.coefficient31_441,
  OriginalRow227TriangleData0486.coefficient31_442,
  OriginalRow227TriangleData0486.coefficient31_443,
  OriginalRow227TriangleData0486.coefficient31_444,
  OriginalRow227TriangleData0486.coefficient31_445
]

theorem values0486_size : values0486.size = 32 := rfl

def block0486 : ℕ → Option IntervalDyadic := segment 414 values0486

theorem block0486_domain : ExactDomain block0486 414 446 := by
  simpa only [values0486_size] using segment_domain 414 values0486

theorem block0486_get (i : Fin 32) :
    block0486 (414 + i.val) = some (values0486[i.val]'(by rw [values0486_size]; exact i.isLt)) := by
  exact segment_get 414 values0486 ⟨i.val, by rw [values0486_size]; exact i.isLt⟩

def values0487 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0487.coefficient31_446,
  OriginalRow227TriangleData0487.coefficient31_447,
  OriginalRow227TriangleData0487.coefficient31_448,
  OriginalRow227TriangleData0487.coefficient31_449,
  OriginalRow227TriangleData0487.coefficient31_450,
  OriginalRow227TriangleData0487.coefficient31_451,
  OriginalRow227TriangleData0487.coefficient31_452,
  OriginalRow227TriangleData0487.coefficient31_453,
  OriginalRow227TriangleData0487.coefficient31_454,
  OriginalRow227TriangleData0487.coefficient31_455,
  OriginalRow227TriangleData0487.coefficient31_456,
  OriginalRow227TriangleData0487.coefficient31_457,
  OriginalRow227TriangleData0487.coefficient31_458,
  OriginalRow227TriangleData0487.coefficient31_459,
  OriginalRow227TriangleData0487.coefficient31_460,
  OriginalRow227TriangleData0487.coefficient31_461,
  OriginalRow227TriangleData0487.coefficient31_462,
  OriginalRow227TriangleData0487.coefficient31_463,
  OriginalRow227TriangleData0487.coefficient31_464,
  OriginalRow227TriangleData0487.coefficient31_465,
  OriginalRow227TriangleData0487.coefficient31_466,
  OriginalRow227TriangleData0487.coefficient31_467,
  OriginalRow227TriangleData0487.coefficient31_468,
  OriginalRow227TriangleData0487.coefficient31_469,
  OriginalRow227TriangleData0487.coefficient31_470
]

theorem values0487_size : values0487.size = 25 := rfl

def block0487 : ℕ → Option IntervalDyadic := segment 446 values0487

theorem block0487_domain : ExactDomain block0487 446 471 := by
  simpa only [values0487_size] using segment_domain 446 values0487

theorem block0487_get (i : Fin 25) :
    block0487 (446 + i.val) = some (values0487[i.val]'(by rw [values0487_size]; exact i.isLt)) := by
  exact segment_get 446 values0487 ⟨i.val, by rw [values0487_size]; exact i.isLt⟩

def node0062_0126 : ℕ → Option IntervalDyadic := split 94 block0475 block0476

theorem node0062_0126_domain : ExactDomain node0062_0126 62 126 := by
  exact split_domain (by decide) (by decide) block0475_domain block0476_domain

def node0030_0126 : ℕ → Option IntervalDyadic := split 62 block0474 node0062_0126

theorem node0030_0126_domain : ExactDomain node0030_0126 30 126 := by
  exact split_domain (by decide) (by decide) block0474_domain node0062_0126_domain

def node0126_0190 : ℕ → Option IntervalDyadic := split 158 block0477 block0478

theorem node0126_0190_domain : ExactDomain node0126_0190 126 190 := by
  exact split_domain (by decide) (by decide) block0477_domain block0478_domain

def node0190_0254 : ℕ → Option IntervalDyadic := split 222 block0479 block0480

theorem node0190_0254_domain : ExactDomain node0190_0254 190 254 := by
  exact split_domain (by decide) (by decide) block0479_domain block0480_domain

def node0126_0254 : ℕ → Option IntervalDyadic := split 190 node0126_0190 node0190_0254

theorem node0126_0254_domain : ExactDomain node0126_0254 126 254 := by
  exact split_domain (by decide) (by decide) node0126_0190_domain node0190_0254_domain

def node0030_0254 : ℕ → Option IntervalDyadic := split 126 node0030_0126 node0126_0254

theorem node0030_0254_domain : ExactDomain node0030_0254 30 254 := by
  exact split_domain (by decide) (by decide) node0030_0126_domain node0126_0254_domain

def node0286_0350 : ℕ → Option IntervalDyadic := split 318 block0482 block0483

theorem node0286_0350_domain : ExactDomain node0286_0350 286 350 := by
  exact split_domain (by decide) (by decide) block0482_domain block0483_domain

def node0254_0350 : ℕ → Option IntervalDyadic := split 286 block0481 node0286_0350

theorem node0254_0350_domain : ExactDomain node0254_0350 254 350 := by
  exact split_domain (by decide) (by decide) block0481_domain node0286_0350_domain

def node0350_0414 : ℕ → Option IntervalDyadic := split 382 block0484 block0485

theorem node0350_0414_domain : ExactDomain node0350_0414 350 414 := by
  exact split_domain (by decide) (by decide) block0484_domain block0485_domain

def node0414_0471 : ℕ → Option IntervalDyadic := split 446 block0486 block0487

theorem node0414_0471_domain : ExactDomain node0414_0471 414 471 := by
  exact split_domain (by decide) (by decide) block0486_domain block0487_domain

def node0350_0471 : ℕ → Option IntervalDyadic := split 414 node0350_0414 node0414_0471

theorem node0350_0471_domain : ExactDomain node0350_0471 350 471 := by
  exact split_domain (by decide) (by decide) node0350_0414_domain node0414_0471_domain

def node0254_0471 : ℕ → Option IntervalDyadic := split 350 node0254_0350 node0350_0471

theorem node0254_0471_domain : ExactDomain node0254_0471 254 471 := by
  exact split_domain (by decide) (by decide) node0254_0350_domain node0350_0471_domain

def node0030_0471 : ℕ → Option IntervalDyadic := split 254 node0030_0254 node0254_0471

theorem node0030_0471_domain : ExactDomain node0030_0471 30 471 := by
  exact split_domain (by decide) (by decide) node0030_0254_domain node0254_0471_domain

def lookup : ℕ → Option IntervalDyadic := node0030_0471

theorem lookup_domain : ExactDomain lookup 30 471 :=
  node0030_0471_domain

theorem block0474_lookup (i : Fin 32) :
    lookup (30 + i.val) = some (values0474[i.val]'(by rw [values0474_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (30 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_left 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0030_0126, split_left 62 block0474 node0062_0126 (by omega)]
  exact block0474_get i

theorem block0475_lookup (i : Fin 32) :
    lookup (62 + i.val) = some (values0475[i.val]'(by rw [values0475_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (62 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_left 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0030_0126, split_right 62 block0474 node0062_0126 (by omega)]
  rw [node0062_0126, split_left 94 block0475 block0476 (by omega)]
  exact block0475_get i

theorem block0476_lookup (i : Fin 32) :
    lookup (94 + i.val) = some (values0476[i.val]'(by rw [values0476_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (94 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_left 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0030_0126, split_right 62 block0474 node0062_0126 (by omega)]
  rw [node0062_0126, split_right 94 block0475 block0476 (by omega)]
  exact block0476_get i

theorem block0477_lookup (i : Fin 32) :
    lookup (126 + i.val) = some (values0477[i.val]'(by rw [values0477_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (126 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_right 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0126_0254, split_left 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0126_0190, split_left 158 block0477 block0478 (by omega)]
  exact block0477_get i

theorem block0478_lookup (i : Fin 32) :
    lookup (158 + i.val) = some (values0478[i.val]'(by rw [values0478_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (158 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_right 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0126_0254, split_left 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0126_0190, split_right 158 block0477 block0478 (by omega)]
  exact block0478_get i

theorem block0479_lookup (i : Fin 32) :
    lookup (190 + i.val) = some (values0479[i.val]'(by rw [values0479_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (190 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_right 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0126_0254, split_right 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0190_0254, split_left 222 block0479 block0480 (by omega)]
  exact block0479_get i

theorem block0480_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values0480[i.val]'(by rw [values0480_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (222 + i.val) = _
  rw [node0030_0471, split_left 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0030_0254, split_right 126 node0030_0126 node0126_0254 (by omega)]
  rw [node0126_0254, split_right 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0190_0254, split_right 222 block0479 block0480 (by omega)]
  exact block0480_get i

theorem block0481_lookup (i : Fin 32) :
    lookup (254 + i.val) = some (values0481[i.val]'(by rw [values0481_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (254 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_left 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0254_0350, split_left 286 block0481 node0286_0350 (by omega)]
  exact block0481_get i

theorem block0482_lookup (i : Fin 32) :
    lookup (286 + i.val) = some (values0482[i.val]'(by rw [values0482_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (286 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_left 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0254_0350, split_right 286 block0481 node0286_0350 (by omega)]
  rw [node0286_0350, split_left 318 block0482 block0483 (by omega)]
  exact block0482_get i

theorem block0483_lookup (i : Fin 32) :
    lookup (318 + i.val) = some (values0483[i.val]'(by rw [values0483_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (318 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_left 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0254_0350, split_right 286 block0481 node0286_0350 (by omega)]
  rw [node0286_0350, split_right 318 block0482 block0483 (by omega)]
  exact block0483_get i

theorem block0484_lookup (i : Fin 32) :
    lookup (350 + i.val) = some (values0484[i.val]'(by rw [values0484_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (350 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_right 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0350_0471, split_left 414 node0350_0414 node0414_0471 (by omega)]
  rw [node0350_0414, split_left 382 block0484 block0485 (by omega)]
  exact block0484_get i

theorem block0485_lookup (i : Fin 32) :
    lookup (382 + i.val) = some (values0485[i.val]'(by rw [values0485_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (382 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_right 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0350_0471, split_left 414 node0350_0414 node0414_0471 (by omega)]
  rw [node0350_0414, split_right 382 block0484 block0485 (by omega)]
  exact block0485_get i

theorem block0486_lookup (i : Fin 32) :
    lookup (414 + i.val) = some (values0486[i.val]'(by rw [values0486_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (414 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_right 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0350_0471, split_right 414 node0350_0414 node0414_0471 (by omega)]
  rw [node0414_0471, split_left 446 block0486 block0487 (by omega)]
  exact block0486_get i

theorem block0487_lookup (i : Fin 25) :
    lookup (446 + i.val) = some (values0487[i.val]'(by rw [values0487_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0030_0471 (446 + i.val) = _
  rw [node0030_0471, split_right 254 node0030_0254 node0254_0471 (by omega)]
  rw [node0254_0471, split_right 350 node0254_0350 node0350_0471 (by omega)]
  rw [node0350_0471, split_right 414 node0350_0414 node0414_0471 (by omega)]
  rw [node0414_0471, split_right 446 block0486 block0487 (by omega)]
  exact block0487_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0474_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0474_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0475_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0475_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0476_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0476_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0477_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0477_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0478_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0478_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0479_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0479_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0480_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0480_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0481_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0481_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0482_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0482_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0483_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0483_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0484_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0484_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0485_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0485_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0486_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0486_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0487_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0487_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0474_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0475_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0476_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0477_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0478_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0479_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0480_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0481_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0482_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0483_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0484_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0485_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0486_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow031.block0487_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow031
