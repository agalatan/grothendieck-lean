import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0488
import Grothe.UpperChaos.OriginalRow227TriangleData0489
import Grothe.UpperChaos.OriginalRow227TriangleData0490
import Grothe.UpperChaos.OriginalRow227TriangleData0491
import Grothe.UpperChaos.OriginalRow227TriangleData0492
import Grothe.UpperChaos.OriginalRow227TriangleData0493
import Grothe.UpperChaos.OriginalRow227TriangleData0494
import Grothe.UpperChaos.OriginalRow227TriangleData0495
import Grothe.UpperChaos.OriginalRow227TriangleData0496
import Grothe.UpperChaos.OriginalRow227TriangleData0497
import Grothe.UpperChaos.OriginalRow227TriangleData0498
import Grothe.UpperChaos.OriginalRow227TriangleData0499
import Grothe.UpperChaos.OriginalRow227TriangleData0500
import Grothe.UpperChaos.OriginalRow227TriangleData0501

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow032

open ConditionalTableLookup

def values0488 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0488.coefficient32_31,
  OriginalRow227TriangleData0488.coefficient32_32,
  OriginalRow227TriangleData0488.coefficient32_33,
  OriginalRow227TriangleData0488.coefficient32_34,
  OriginalRow227TriangleData0488.coefficient32_35,
  OriginalRow227TriangleData0488.coefficient32_36,
  OriginalRow227TriangleData0488.coefficient32_37,
  OriginalRow227TriangleData0488.coefficient32_38,
  OriginalRow227TriangleData0488.coefficient32_39,
  OriginalRow227TriangleData0488.coefficient32_40,
  OriginalRow227TriangleData0488.coefficient32_41,
  OriginalRow227TriangleData0488.coefficient32_42,
  OriginalRow227TriangleData0488.coefficient32_43,
  OriginalRow227TriangleData0488.coefficient32_44,
  OriginalRow227TriangleData0488.coefficient32_45,
  OriginalRow227TriangleData0488.coefficient32_46,
  OriginalRow227TriangleData0488.coefficient32_47,
  OriginalRow227TriangleData0488.coefficient32_48,
  OriginalRow227TriangleData0488.coefficient32_49,
  OriginalRow227TriangleData0488.coefficient32_50,
  OriginalRow227TriangleData0488.coefficient32_51,
  OriginalRow227TriangleData0488.coefficient32_52,
  OriginalRow227TriangleData0488.coefficient32_53,
  OriginalRow227TriangleData0488.coefficient32_54,
  OriginalRow227TriangleData0488.coefficient32_55,
  OriginalRow227TriangleData0488.coefficient32_56,
  OriginalRow227TriangleData0488.coefficient32_57,
  OriginalRow227TriangleData0488.coefficient32_58,
  OriginalRow227TriangleData0488.coefficient32_59,
  OriginalRow227TriangleData0488.coefficient32_60,
  OriginalRow227TriangleData0488.coefficient32_61,
  OriginalRow227TriangleData0488.coefficient32_62
]

theorem values0488_size : values0488.size = 32 := rfl

def block0488 : ℕ → Option IntervalDyadic := segment 31 values0488

theorem block0488_domain : ExactDomain block0488 31 63 := by
  simpa only [values0488_size] using segment_domain 31 values0488

theorem block0488_get (i : Fin 32) :
    block0488 (31 + i.val) = some (values0488[i.val]'(by rw [values0488_size]; exact i.isLt)) := by
  exact segment_get 31 values0488 ⟨i.val, by rw [values0488_size]; exact i.isLt⟩

def values0489 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0489.coefficient32_63,
  OriginalRow227TriangleData0489.coefficient32_64,
  OriginalRow227TriangleData0489.coefficient32_65,
  OriginalRow227TriangleData0489.coefficient32_66,
  OriginalRow227TriangleData0489.coefficient32_67,
  OriginalRow227TriangleData0489.coefficient32_68,
  OriginalRow227TriangleData0489.coefficient32_69,
  OriginalRow227TriangleData0489.coefficient32_70,
  OriginalRow227TriangleData0489.coefficient32_71,
  OriginalRow227TriangleData0489.coefficient32_72,
  OriginalRow227TriangleData0489.coefficient32_73,
  OriginalRow227TriangleData0489.coefficient32_74,
  OriginalRow227TriangleData0489.coefficient32_75,
  OriginalRow227TriangleData0489.coefficient32_76,
  OriginalRow227TriangleData0489.coefficient32_77,
  OriginalRow227TriangleData0489.coefficient32_78,
  OriginalRow227TriangleData0489.coefficient32_79,
  OriginalRow227TriangleData0489.coefficient32_80,
  OriginalRow227TriangleData0489.coefficient32_81,
  OriginalRow227TriangleData0489.coefficient32_82,
  OriginalRow227TriangleData0489.coefficient32_83,
  OriginalRow227TriangleData0489.coefficient32_84,
  OriginalRow227TriangleData0489.coefficient32_85,
  OriginalRow227TriangleData0489.coefficient32_86,
  OriginalRow227TriangleData0489.coefficient32_87,
  OriginalRow227TriangleData0489.coefficient32_88,
  OriginalRow227TriangleData0489.coefficient32_89,
  OriginalRow227TriangleData0489.coefficient32_90,
  OriginalRow227TriangleData0489.coefficient32_91,
  OriginalRow227TriangleData0489.coefficient32_92,
  OriginalRow227TriangleData0489.coefficient32_93,
  OriginalRow227TriangleData0489.coefficient32_94
]

theorem values0489_size : values0489.size = 32 := rfl

def block0489 : ℕ → Option IntervalDyadic := segment 63 values0489

theorem block0489_domain : ExactDomain block0489 63 95 := by
  simpa only [values0489_size] using segment_domain 63 values0489

theorem block0489_get (i : Fin 32) :
    block0489 (63 + i.val) = some (values0489[i.val]'(by rw [values0489_size]; exact i.isLt)) := by
  exact segment_get 63 values0489 ⟨i.val, by rw [values0489_size]; exact i.isLt⟩

def values0490 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0490.coefficient32_95,
  OriginalRow227TriangleData0490.coefficient32_96,
  OriginalRow227TriangleData0490.coefficient32_97,
  OriginalRow227TriangleData0490.coefficient32_98,
  OriginalRow227TriangleData0490.coefficient32_99,
  OriginalRow227TriangleData0490.coefficient32_100,
  OriginalRow227TriangleData0490.coefficient32_101,
  OriginalRow227TriangleData0490.coefficient32_102,
  OriginalRow227TriangleData0490.coefficient32_103,
  OriginalRow227TriangleData0490.coefficient32_104,
  OriginalRow227TriangleData0490.coefficient32_105,
  OriginalRow227TriangleData0490.coefficient32_106,
  OriginalRow227TriangleData0490.coefficient32_107,
  OriginalRow227TriangleData0490.coefficient32_108,
  OriginalRow227TriangleData0490.coefficient32_109,
  OriginalRow227TriangleData0490.coefficient32_110,
  OriginalRow227TriangleData0490.coefficient32_111,
  OriginalRow227TriangleData0490.coefficient32_112,
  OriginalRow227TriangleData0490.coefficient32_113,
  OriginalRow227TriangleData0490.coefficient32_114,
  OriginalRow227TriangleData0490.coefficient32_115,
  OriginalRow227TriangleData0490.coefficient32_116,
  OriginalRow227TriangleData0490.coefficient32_117,
  OriginalRow227TriangleData0490.coefficient32_118,
  OriginalRow227TriangleData0490.coefficient32_119,
  OriginalRow227TriangleData0490.coefficient32_120,
  OriginalRow227TriangleData0490.coefficient32_121,
  OriginalRow227TriangleData0490.coefficient32_122,
  OriginalRow227TriangleData0490.coefficient32_123,
  OriginalRow227TriangleData0490.coefficient32_124,
  OriginalRow227TriangleData0490.coefficient32_125,
  OriginalRow227TriangleData0490.coefficient32_126
]

theorem values0490_size : values0490.size = 32 := rfl

def block0490 : ℕ → Option IntervalDyadic := segment 95 values0490

theorem block0490_domain : ExactDomain block0490 95 127 := by
  simpa only [values0490_size] using segment_domain 95 values0490

theorem block0490_get (i : Fin 32) :
    block0490 (95 + i.val) = some (values0490[i.val]'(by rw [values0490_size]; exact i.isLt)) := by
  exact segment_get 95 values0490 ⟨i.val, by rw [values0490_size]; exact i.isLt⟩

def values0491 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0491.coefficient32_127,
  OriginalRow227TriangleData0491.coefficient32_128,
  OriginalRow227TriangleData0491.coefficient32_129,
  OriginalRow227TriangleData0491.coefficient32_130,
  OriginalRow227TriangleData0491.coefficient32_131,
  OriginalRow227TriangleData0491.coefficient32_132,
  OriginalRow227TriangleData0491.coefficient32_133,
  OriginalRow227TriangleData0491.coefficient32_134,
  OriginalRow227TriangleData0491.coefficient32_135,
  OriginalRow227TriangleData0491.coefficient32_136,
  OriginalRow227TriangleData0491.coefficient32_137,
  OriginalRow227TriangleData0491.coefficient32_138,
  OriginalRow227TriangleData0491.coefficient32_139,
  OriginalRow227TriangleData0491.coefficient32_140,
  OriginalRow227TriangleData0491.coefficient32_141,
  OriginalRow227TriangleData0491.coefficient32_142,
  OriginalRow227TriangleData0491.coefficient32_143,
  OriginalRow227TriangleData0491.coefficient32_144,
  OriginalRow227TriangleData0491.coefficient32_145,
  OriginalRow227TriangleData0491.coefficient32_146,
  OriginalRow227TriangleData0491.coefficient32_147,
  OriginalRow227TriangleData0491.coefficient32_148,
  OriginalRow227TriangleData0491.coefficient32_149,
  OriginalRow227TriangleData0491.coefficient32_150,
  OriginalRow227TriangleData0491.coefficient32_151,
  OriginalRow227TriangleData0491.coefficient32_152,
  OriginalRow227TriangleData0491.coefficient32_153,
  OriginalRow227TriangleData0491.coefficient32_154,
  OriginalRow227TriangleData0491.coefficient32_155,
  OriginalRow227TriangleData0491.coefficient32_156,
  OriginalRow227TriangleData0491.coefficient32_157,
  OriginalRow227TriangleData0491.coefficient32_158
]

theorem values0491_size : values0491.size = 32 := rfl

def block0491 : ℕ → Option IntervalDyadic := segment 127 values0491

theorem block0491_domain : ExactDomain block0491 127 159 := by
  simpa only [values0491_size] using segment_domain 127 values0491

theorem block0491_get (i : Fin 32) :
    block0491 (127 + i.val) = some (values0491[i.val]'(by rw [values0491_size]; exact i.isLt)) := by
  exact segment_get 127 values0491 ⟨i.val, by rw [values0491_size]; exact i.isLt⟩

def values0492 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0492.coefficient32_159,
  OriginalRow227TriangleData0492.coefficient32_160,
  OriginalRow227TriangleData0492.coefficient32_161,
  OriginalRow227TriangleData0492.coefficient32_162,
  OriginalRow227TriangleData0492.coefficient32_163,
  OriginalRow227TriangleData0492.coefficient32_164,
  OriginalRow227TriangleData0492.coefficient32_165,
  OriginalRow227TriangleData0492.coefficient32_166,
  OriginalRow227TriangleData0492.coefficient32_167,
  OriginalRow227TriangleData0492.coefficient32_168,
  OriginalRow227TriangleData0492.coefficient32_169,
  OriginalRow227TriangleData0492.coefficient32_170,
  OriginalRow227TriangleData0492.coefficient32_171,
  OriginalRow227TriangleData0492.coefficient32_172,
  OriginalRow227TriangleData0492.coefficient32_173,
  OriginalRow227TriangleData0492.coefficient32_174,
  OriginalRow227TriangleData0492.coefficient32_175,
  OriginalRow227TriangleData0492.coefficient32_176,
  OriginalRow227TriangleData0492.coefficient32_177,
  OriginalRow227TriangleData0492.coefficient32_178,
  OriginalRow227TriangleData0492.coefficient32_179,
  OriginalRow227TriangleData0492.coefficient32_180,
  OriginalRow227TriangleData0492.coefficient32_181,
  OriginalRow227TriangleData0492.coefficient32_182,
  OriginalRow227TriangleData0492.coefficient32_183,
  OriginalRow227TriangleData0492.coefficient32_184,
  OriginalRow227TriangleData0492.coefficient32_185,
  OriginalRow227TriangleData0492.coefficient32_186,
  OriginalRow227TriangleData0492.coefficient32_187,
  OriginalRow227TriangleData0492.coefficient32_188,
  OriginalRow227TriangleData0492.coefficient32_189,
  OriginalRow227TriangleData0492.coefficient32_190
]

theorem values0492_size : values0492.size = 32 := rfl

def block0492 : ℕ → Option IntervalDyadic := segment 159 values0492

theorem block0492_domain : ExactDomain block0492 159 191 := by
  simpa only [values0492_size] using segment_domain 159 values0492

theorem block0492_get (i : Fin 32) :
    block0492 (159 + i.val) = some (values0492[i.val]'(by rw [values0492_size]; exact i.isLt)) := by
  exact segment_get 159 values0492 ⟨i.val, by rw [values0492_size]; exact i.isLt⟩

def values0493 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0493.coefficient32_191,
  OriginalRow227TriangleData0493.coefficient32_192,
  OriginalRow227TriangleData0493.coefficient32_193,
  OriginalRow227TriangleData0493.coefficient32_194,
  OriginalRow227TriangleData0493.coefficient32_195,
  OriginalRow227TriangleData0493.coefficient32_196,
  OriginalRow227TriangleData0493.coefficient32_197,
  OriginalRow227TriangleData0493.coefficient32_198,
  OriginalRow227TriangleData0493.coefficient32_199,
  OriginalRow227TriangleData0493.coefficient32_200,
  OriginalRow227TriangleData0493.coefficient32_201,
  OriginalRow227TriangleData0493.coefficient32_202,
  OriginalRow227TriangleData0493.coefficient32_203,
  OriginalRow227TriangleData0493.coefficient32_204,
  OriginalRow227TriangleData0493.coefficient32_205,
  OriginalRow227TriangleData0493.coefficient32_206,
  OriginalRow227TriangleData0493.coefficient32_207,
  OriginalRow227TriangleData0493.coefficient32_208,
  OriginalRow227TriangleData0493.coefficient32_209,
  OriginalRow227TriangleData0493.coefficient32_210,
  OriginalRow227TriangleData0493.coefficient32_211,
  OriginalRow227TriangleData0493.coefficient32_212,
  OriginalRow227TriangleData0493.coefficient32_213,
  OriginalRow227TriangleData0493.coefficient32_214,
  OriginalRow227TriangleData0493.coefficient32_215,
  OriginalRow227TriangleData0493.coefficient32_216,
  OriginalRow227TriangleData0493.coefficient32_217,
  OriginalRow227TriangleData0493.coefficient32_218,
  OriginalRow227TriangleData0493.coefficient32_219,
  OriginalRow227TriangleData0493.coefficient32_220,
  OriginalRow227TriangleData0493.coefficient32_221,
  OriginalRow227TriangleData0493.coefficient32_222
]

theorem values0493_size : values0493.size = 32 := rfl

def block0493 : ℕ → Option IntervalDyadic := segment 191 values0493

theorem block0493_domain : ExactDomain block0493 191 223 := by
  simpa only [values0493_size] using segment_domain 191 values0493

theorem block0493_get (i : Fin 32) :
    block0493 (191 + i.val) = some (values0493[i.val]'(by rw [values0493_size]; exact i.isLt)) := by
  exact segment_get 191 values0493 ⟨i.val, by rw [values0493_size]; exact i.isLt⟩

def values0494 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0494.coefficient32_223,
  OriginalRow227TriangleData0494.coefficient32_224,
  OriginalRow227TriangleData0494.coefficient32_225,
  OriginalRow227TriangleData0494.coefficient32_226,
  OriginalRow227TriangleData0494.coefficient32_227,
  OriginalRow227TriangleData0494.coefficient32_228,
  OriginalRow227TriangleData0494.coefficient32_229,
  OriginalRow227TriangleData0494.coefficient32_230,
  OriginalRow227TriangleData0494.coefficient32_231,
  OriginalRow227TriangleData0494.coefficient32_232,
  OriginalRow227TriangleData0494.coefficient32_233,
  OriginalRow227TriangleData0494.coefficient32_234,
  OriginalRow227TriangleData0494.coefficient32_235,
  OriginalRow227TriangleData0494.coefficient32_236,
  OriginalRow227TriangleData0494.coefficient32_237,
  OriginalRow227TriangleData0494.coefficient32_238,
  OriginalRow227TriangleData0494.coefficient32_239,
  OriginalRow227TriangleData0494.coefficient32_240,
  OriginalRow227TriangleData0494.coefficient32_241,
  OriginalRow227TriangleData0494.coefficient32_242,
  OriginalRow227TriangleData0494.coefficient32_243,
  OriginalRow227TriangleData0494.coefficient32_244,
  OriginalRow227TriangleData0494.coefficient32_245,
  OriginalRow227TriangleData0494.coefficient32_246,
  OriginalRow227TriangleData0494.coefficient32_247,
  OriginalRow227TriangleData0494.coefficient32_248,
  OriginalRow227TriangleData0494.coefficient32_249,
  OriginalRow227TriangleData0494.coefficient32_250,
  OriginalRow227TriangleData0494.coefficient32_251,
  OriginalRow227TriangleData0494.coefficient32_252,
  OriginalRow227TriangleData0494.coefficient32_253,
  OriginalRow227TriangleData0494.coefficient32_254
]

theorem values0494_size : values0494.size = 32 := rfl

def block0494 : ℕ → Option IntervalDyadic := segment 223 values0494

theorem block0494_domain : ExactDomain block0494 223 255 := by
  simpa only [values0494_size] using segment_domain 223 values0494

theorem block0494_get (i : Fin 32) :
    block0494 (223 + i.val) = some (values0494[i.val]'(by rw [values0494_size]; exact i.isLt)) := by
  exact segment_get 223 values0494 ⟨i.val, by rw [values0494_size]; exact i.isLt⟩

def values0495 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0495.coefficient32_255,
  OriginalRow227TriangleData0495.coefficient32_256,
  OriginalRow227TriangleData0495.coefficient32_257,
  OriginalRow227TriangleData0495.coefficient32_258,
  OriginalRow227TriangleData0495.coefficient32_259,
  OriginalRow227TriangleData0495.coefficient32_260,
  OriginalRow227TriangleData0495.coefficient32_261,
  OriginalRow227TriangleData0495.coefficient32_262,
  OriginalRow227TriangleData0495.coefficient32_263,
  OriginalRow227TriangleData0495.coefficient32_264,
  OriginalRow227TriangleData0495.coefficient32_265,
  OriginalRow227TriangleData0495.coefficient32_266,
  OriginalRow227TriangleData0495.coefficient32_267,
  OriginalRow227TriangleData0495.coefficient32_268,
  OriginalRow227TriangleData0495.coefficient32_269,
  OriginalRow227TriangleData0495.coefficient32_270,
  OriginalRow227TriangleData0495.coefficient32_271,
  OriginalRow227TriangleData0495.coefficient32_272,
  OriginalRow227TriangleData0495.coefficient32_273,
  OriginalRow227TriangleData0495.coefficient32_274,
  OriginalRow227TriangleData0495.coefficient32_275,
  OriginalRow227TriangleData0495.coefficient32_276,
  OriginalRow227TriangleData0495.coefficient32_277,
  OriginalRow227TriangleData0495.coefficient32_278,
  OriginalRow227TriangleData0495.coefficient32_279,
  OriginalRow227TriangleData0495.coefficient32_280,
  OriginalRow227TriangleData0495.coefficient32_281,
  OriginalRow227TriangleData0495.coefficient32_282,
  OriginalRow227TriangleData0495.coefficient32_283,
  OriginalRow227TriangleData0495.coefficient32_284,
  OriginalRow227TriangleData0495.coefficient32_285,
  OriginalRow227TriangleData0495.coefficient32_286
]

theorem values0495_size : values0495.size = 32 := rfl

def block0495 : ℕ → Option IntervalDyadic := segment 255 values0495

theorem block0495_domain : ExactDomain block0495 255 287 := by
  simpa only [values0495_size] using segment_domain 255 values0495

theorem block0495_get (i : Fin 32) :
    block0495 (255 + i.val) = some (values0495[i.val]'(by rw [values0495_size]; exact i.isLt)) := by
  exact segment_get 255 values0495 ⟨i.val, by rw [values0495_size]; exact i.isLt⟩

def values0496 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0496.coefficient32_287,
  OriginalRow227TriangleData0496.coefficient32_288,
  OriginalRow227TriangleData0496.coefficient32_289,
  OriginalRow227TriangleData0496.coefficient32_290,
  OriginalRow227TriangleData0496.coefficient32_291,
  OriginalRow227TriangleData0496.coefficient32_292,
  OriginalRow227TriangleData0496.coefficient32_293,
  OriginalRow227TriangleData0496.coefficient32_294,
  OriginalRow227TriangleData0496.coefficient32_295,
  OriginalRow227TriangleData0496.coefficient32_296,
  OriginalRow227TriangleData0496.coefficient32_297,
  OriginalRow227TriangleData0496.coefficient32_298,
  OriginalRow227TriangleData0496.coefficient32_299,
  OriginalRow227TriangleData0496.coefficient32_300,
  OriginalRow227TriangleData0496.coefficient32_301,
  OriginalRow227TriangleData0496.coefficient32_302,
  OriginalRow227TriangleData0496.coefficient32_303,
  OriginalRow227TriangleData0496.coefficient32_304,
  OriginalRow227TriangleData0496.coefficient32_305,
  OriginalRow227TriangleData0496.coefficient32_306,
  OriginalRow227TriangleData0496.coefficient32_307,
  OriginalRow227TriangleData0496.coefficient32_308,
  OriginalRow227TriangleData0496.coefficient32_309,
  OriginalRow227TriangleData0496.coefficient32_310,
  OriginalRow227TriangleData0496.coefficient32_311,
  OriginalRow227TriangleData0496.coefficient32_312,
  OriginalRow227TriangleData0496.coefficient32_313,
  OriginalRow227TriangleData0496.coefficient32_314,
  OriginalRow227TriangleData0496.coefficient32_315,
  OriginalRow227TriangleData0496.coefficient32_316,
  OriginalRow227TriangleData0496.coefficient32_317,
  OriginalRow227TriangleData0496.coefficient32_318
]

theorem values0496_size : values0496.size = 32 := rfl

def block0496 : ℕ → Option IntervalDyadic := segment 287 values0496

theorem block0496_domain : ExactDomain block0496 287 319 := by
  simpa only [values0496_size] using segment_domain 287 values0496

theorem block0496_get (i : Fin 32) :
    block0496 (287 + i.val) = some (values0496[i.val]'(by rw [values0496_size]; exact i.isLt)) := by
  exact segment_get 287 values0496 ⟨i.val, by rw [values0496_size]; exact i.isLt⟩

def values0497 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0497.coefficient32_319,
  OriginalRow227TriangleData0497.coefficient32_320,
  OriginalRow227TriangleData0497.coefficient32_321,
  OriginalRow227TriangleData0497.coefficient32_322,
  OriginalRow227TriangleData0497.coefficient32_323,
  OriginalRow227TriangleData0497.coefficient32_324,
  OriginalRow227TriangleData0497.coefficient32_325,
  OriginalRow227TriangleData0497.coefficient32_326,
  OriginalRow227TriangleData0497.coefficient32_327,
  OriginalRow227TriangleData0497.coefficient32_328,
  OriginalRow227TriangleData0497.coefficient32_329,
  OriginalRow227TriangleData0497.coefficient32_330,
  OriginalRow227TriangleData0497.coefficient32_331,
  OriginalRow227TriangleData0497.coefficient32_332,
  OriginalRow227TriangleData0497.coefficient32_333,
  OriginalRow227TriangleData0497.coefficient32_334,
  OriginalRow227TriangleData0497.coefficient32_335,
  OriginalRow227TriangleData0497.coefficient32_336,
  OriginalRow227TriangleData0497.coefficient32_337,
  OriginalRow227TriangleData0497.coefficient32_338,
  OriginalRow227TriangleData0497.coefficient32_339,
  OriginalRow227TriangleData0497.coefficient32_340,
  OriginalRow227TriangleData0497.coefficient32_341,
  OriginalRow227TriangleData0497.coefficient32_342,
  OriginalRow227TriangleData0497.coefficient32_343,
  OriginalRow227TriangleData0497.coefficient32_344,
  OriginalRow227TriangleData0497.coefficient32_345,
  OriginalRow227TriangleData0497.coefficient32_346,
  OriginalRow227TriangleData0497.coefficient32_347,
  OriginalRow227TriangleData0497.coefficient32_348,
  OriginalRow227TriangleData0497.coefficient32_349,
  OriginalRow227TriangleData0497.coefficient32_350
]

theorem values0497_size : values0497.size = 32 := rfl

def block0497 : ℕ → Option IntervalDyadic := segment 319 values0497

theorem block0497_domain : ExactDomain block0497 319 351 := by
  simpa only [values0497_size] using segment_domain 319 values0497

theorem block0497_get (i : Fin 32) :
    block0497 (319 + i.val) = some (values0497[i.val]'(by rw [values0497_size]; exact i.isLt)) := by
  exact segment_get 319 values0497 ⟨i.val, by rw [values0497_size]; exact i.isLt⟩

def values0498 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0498.coefficient32_351,
  OriginalRow227TriangleData0498.coefficient32_352,
  OriginalRow227TriangleData0498.coefficient32_353,
  OriginalRow227TriangleData0498.coefficient32_354,
  OriginalRow227TriangleData0498.coefficient32_355,
  OriginalRow227TriangleData0498.coefficient32_356,
  OriginalRow227TriangleData0498.coefficient32_357,
  OriginalRow227TriangleData0498.coefficient32_358,
  OriginalRow227TriangleData0498.coefficient32_359,
  OriginalRow227TriangleData0498.coefficient32_360,
  OriginalRow227TriangleData0498.coefficient32_361,
  OriginalRow227TriangleData0498.coefficient32_362,
  OriginalRow227TriangleData0498.coefficient32_363,
  OriginalRow227TriangleData0498.coefficient32_364,
  OriginalRow227TriangleData0498.coefficient32_365,
  OriginalRow227TriangleData0498.coefficient32_366,
  OriginalRow227TriangleData0498.coefficient32_367,
  OriginalRow227TriangleData0498.coefficient32_368,
  OriginalRow227TriangleData0498.coefficient32_369,
  OriginalRow227TriangleData0498.coefficient32_370,
  OriginalRow227TriangleData0498.coefficient32_371,
  OriginalRow227TriangleData0498.coefficient32_372,
  OriginalRow227TriangleData0498.coefficient32_373,
  OriginalRow227TriangleData0498.coefficient32_374,
  OriginalRow227TriangleData0498.coefficient32_375,
  OriginalRow227TriangleData0498.coefficient32_376,
  OriginalRow227TriangleData0498.coefficient32_377,
  OriginalRow227TriangleData0498.coefficient32_378,
  OriginalRow227TriangleData0498.coefficient32_379,
  OriginalRow227TriangleData0498.coefficient32_380,
  OriginalRow227TriangleData0498.coefficient32_381,
  OriginalRow227TriangleData0498.coefficient32_382
]

theorem values0498_size : values0498.size = 32 := rfl

def block0498 : ℕ → Option IntervalDyadic := segment 351 values0498

theorem block0498_domain : ExactDomain block0498 351 383 := by
  simpa only [values0498_size] using segment_domain 351 values0498

theorem block0498_get (i : Fin 32) :
    block0498 (351 + i.val) = some (values0498[i.val]'(by rw [values0498_size]; exact i.isLt)) := by
  exact segment_get 351 values0498 ⟨i.val, by rw [values0498_size]; exact i.isLt⟩

def values0499 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0499.coefficient32_383,
  OriginalRow227TriangleData0499.coefficient32_384,
  OriginalRow227TriangleData0499.coefficient32_385,
  OriginalRow227TriangleData0499.coefficient32_386,
  OriginalRow227TriangleData0499.coefficient32_387,
  OriginalRow227TriangleData0499.coefficient32_388,
  OriginalRow227TriangleData0499.coefficient32_389,
  OriginalRow227TriangleData0499.coefficient32_390,
  OriginalRow227TriangleData0499.coefficient32_391,
  OriginalRow227TriangleData0499.coefficient32_392,
  OriginalRow227TriangleData0499.coefficient32_393,
  OriginalRow227TriangleData0499.coefficient32_394,
  OriginalRow227TriangleData0499.coefficient32_395,
  OriginalRow227TriangleData0499.coefficient32_396,
  OriginalRow227TriangleData0499.coefficient32_397,
  OriginalRow227TriangleData0499.coefficient32_398,
  OriginalRow227TriangleData0499.coefficient32_399,
  OriginalRow227TriangleData0499.coefficient32_400,
  OriginalRow227TriangleData0499.coefficient32_401,
  OriginalRow227TriangleData0499.coefficient32_402,
  OriginalRow227TriangleData0499.coefficient32_403,
  OriginalRow227TriangleData0499.coefficient32_404,
  OriginalRow227TriangleData0499.coefficient32_405,
  OriginalRow227TriangleData0499.coefficient32_406,
  OriginalRow227TriangleData0499.coefficient32_407,
  OriginalRow227TriangleData0499.coefficient32_408,
  OriginalRow227TriangleData0499.coefficient32_409,
  OriginalRow227TriangleData0499.coefficient32_410,
  OriginalRow227TriangleData0499.coefficient32_411,
  OriginalRow227TriangleData0499.coefficient32_412,
  OriginalRow227TriangleData0499.coefficient32_413,
  OriginalRow227TriangleData0499.coefficient32_414
]

theorem values0499_size : values0499.size = 32 := rfl

def block0499 : ℕ → Option IntervalDyadic := segment 383 values0499

theorem block0499_domain : ExactDomain block0499 383 415 := by
  simpa only [values0499_size] using segment_domain 383 values0499

theorem block0499_get (i : Fin 32) :
    block0499 (383 + i.val) = some (values0499[i.val]'(by rw [values0499_size]; exact i.isLt)) := by
  exact segment_get 383 values0499 ⟨i.val, by rw [values0499_size]; exact i.isLt⟩

def values0500 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0500.coefficient32_415,
  OriginalRow227TriangleData0500.coefficient32_416,
  OriginalRow227TriangleData0500.coefficient32_417,
  OriginalRow227TriangleData0500.coefficient32_418,
  OriginalRow227TriangleData0500.coefficient32_419,
  OriginalRow227TriangleData0500.coefficient32_420,
  OriginalRow227TriangleData0500.coefficient32_421,
  OriginalRow227TriangleData0500.coefficient32_422,
  OriginalRow227TriangleData0500.coefficient32_423,
  OriginalRow227TriangleData0500.coefficient32_424,
  OriginalRow227TriangleData0500.coefficient32_425,
  OriginalRow227TriangleData0500.coefficient32_426,
  OriginalRow227TriangleData0500.coefficient32_427,
  OriginalRow227TriangleData0500.coefficient32_428,
  OriginalRow227TriangleData0500.coefficient32_429,
  OriginalRow227TriangleData0500.coefficient32_430,
  OriginalRow227TriangleData0500.coefficient32_431,
  OriginalRow227TriangleData0500.coefficient32_432,
  OriginalRow227TriangleData0500.coefficient32_433,
  OriginalRow227TriangleData0500.coefficient32_434,
  OriginalRow227TriangleData0500.coefficient32_435,
  OriginalRow227TriangleData0500.coefficient32_436,
  OriginalRow227TriangleData0500.coefficient32_437,
  OriginalRow227TriangleData0500.coefficient32_438,
  OriginalRow227TriangleData0500.coefficient32_439,
  OriginalRow227TriangleData0500.coefficient32_440,
  OriginalRow227TriangleData0500.coefficient32_441,
  OriginalRow227TriangleData0500.coefficient32_442,
  OriginalRow227TriangleData0500.coefficient32_443,
  OriginalRow227TriangleData0500.coefficient32_444,
  OriginalRow227TriangleData0500.coefficient32_445,
  OriginalRow227TriangleData0500.coefficient32_446
]

theorem values0500_size : values0500.size = 32 := rfl

def block0500 : ℕ → Option IntervalDyadic := segment 415 values0500

theorem block0500_domain : ExactDomain block0500 415 447 := by
  simpa only [values0500_size] using segment_domain 415 values0500

theorem block0500_get (i : Fin 32) :
    block0500 (415 + i.val) = some (values0500[i.val]'(by rw [values0500_size]; exact i.isLt)) := by
  exact segment_get 415 values0500 ⟨i.val, by rw [values0500_size]; exact i.isLt⟩

def values0501 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0501.coefficient32_447,
  OriginalRow227TriangleData0501.coefficient32_448,
  OriginalRow227TriangleData0501.coefficient32_449,
  OriginalRow227TriangleData0501.coefficient32_450,
  OriginalRow227TriangleData0501.coefficient32_451,
  OriginalRow227TriangleData0501.coefficient32_452,
  OriginalRow227TriangleData0501.coefficient32_453,
  OriginalRow227TriangleData0501.coefficient32_454,
  OriginalRow227TriangleData0501.coefficient32_455,
  OriginalRow227TriangleData0501.coefficient32_456,
  OriginalRow227TriangleData0501.coefficient32_457,
  OriginalRow227TriangleData0501.coefficient32_458,
  OriginalRow227TriangleData0501.coefficient32_459,
  OriginalRow227TriangleData0501.coefficient32_460,
  OriginalRow227TriangleData0501.coefficient32_461,
  OriginalRow227TriangleData0501.coefficient32_462,
  OriginalRow227TriangleData0501.coefficient32_463,
  OriginalRow227TriangleData0501.coefficient32_464,
  OriginalRow227TriangleData0501.coefficient32_465,
  OriginalRow227TriangleData0501.coefficient32_466,
  OriginalRow227TriangleData0501.coefficient32_467,
  OriginalRow227TriangleData0501.coefficient32_468,
  OriginalRow227TriangleData0501.coefficient32_469
]

theorem values0501_size : values0501.size = 23 := rfl

def block0501 : ℕ → Option IntervalDyadic := segment 447 values0501

theorem block0501_domain : ExactDomain block0501 447 470 := by
  simpa only [values0501_size] using segment_domain 447 values0501

theorem block0501_get (i : Fin 23) :
    block0501 (447 + i.val) = some (values0501[i.val]'(by rw [values0501_size]; exact i.isLt)) := by
  exact segment_get 447 values0501 ⟨i.val, by rw [values0501_size]; exact i.isLt⟩

def node0063_0127 : ℕ → Option IntervalDyadic := split 95 block0489 block0490

theorem node0063_0127_domain : ExactDomain node0063_0127 63 127 := by
  exact split_domain (by decide) (by decide) block0489_domain block0490_domain

def node0031_0127 : ℕ → Option IntervalDyadic := split 63 block0488 node0063_0127

theorem node0031_0127_domain : ExactDomain node0031_0127 31 127 := by
  exact split_domain (by decide) (by decide) block0488_domain node0063_0127_domain

def node0127_0191 : ℕ → Option IntervalDyadic := split 159 block0491 block0492

theorem node0127_0191_domain : ExactDomain node0127_0191 127 191 := by
  exact split_domain (by decide) (by decide) block0491_domain block0492_domain

def node0191_0255 : ℕ → Option IntervalDyadic := split 223 block0493 block0494

theorem node0191_0255_domain : ExactDomain node0191_0255 191 255 := by
  exact split_domain (by decide) (by decide) block0493_domain block0494_domain

def node0127_0255 : ℕ → Option IntervalDyadic := split 191 node0127_0191 node0191_0255

theorem node0127_0255_domain : ExactDomain node0127_0255 127 255 := by
  exact split_domain (by decide) (by decide) node0127_0191_domain node0191_0255_domain

def node0031_0255 : ℕ → Option IntervalDyadic := split 127 node0031_0127 node0127_0255

theorem node0031_0255_domain : ExactDomain node0031_0255 31 255 := by
  exact split_domain (by decide) (by decide) node0031_0127_domain node0127_0255_domain

def node0287_0351 : ℕ → Option IntervalDyadic := split 319 block0496 block0497

theorem node0287_0351_domain : ExactDomain node0287_0351 287 351 := by
  exact split_domain (by decide) (by decide) block0496_domain block0497_domain

def node0255_0351 : ℕ → Option IntervalDyadic := split 287 block0495 node0287_0351

theorem node0255_0351_domain : ExactDomain node0255_0351 255 351 := by
  exact split_domain (by decide) (by decide) block0495_domain node0287_0351_domain

def node0351_0415 : ℕ → Option IntervalDyadic := split 383 block0498 block0499

theorem node0351_0415_domain : ExactDomain node0351_0415 351 415 := by
  exact split_domain (by decide) (by decide) block0498_domain block0499_domain

def node0415_0470 : ℕ → Option IntervalDyadic := split 447 block0500 block0501

theorem node0415_0470_domain : ExactDomain node0415_0470 415 470 := by
  exact split_domain (by decide) (by decide) block0500_domain block0501_domain

def node0351_0470 : ℕ → Option IntervalDyadic := split 415 node0351_0415 node0415_0470

theorem node0351_0470_domain : ExactDomain node0351_0470 351 470 := by
  exact split_domain (by decide) (by decide) node0351_0415_domain node0415_0470_domain

def node0255_0470 : ℕ → Option IntervalDyadic := split 351 node0255_0351 node0351_0470

theorem node0255_0470_domain : ExactDomain node0255_0470 255 470 := by
  exact split_domain (by decide) (by decide) node0255_0351_domain node0351_0470_domain

def node0031_0470 : ℕ → Option IntervalDyadic := split 255 node0031_0255 node0255_0470

theorem node0031_0470_domain : ExactDomain node0031_0470 31 470 := by
  exact split_domain (by decide) (by decide) node0031_0255_domain node0255_0470_domain

def lookup : ℕ → Option IntervalDyadic := node0031_0470

theorem lookup_domain : ExactDomain lookup 31 470 :=
  node0031_0470_domain

theorem block0488_lookup (i : Fin 32) :
    lookup (31 + i.val) = some (values0488[i.val]'(by rw [values0488_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (31 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_left 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0031_0127, split_left 63 block0488 node0063_0127 (by omega)]
  exact block0488_get i

theorem block0489_lookup (i : Fin 32) :
    lookup (63 + i.val) = some (values0489[i.val]'(by rw [values0489_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (63 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_left 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0031_0127, split_right 63 block0488 node0063_0127 (by omega)]
  rw [node0063_0127, split_left 95 block0489 block0490 (by omega)]
  exact block0489_get i

theorem block0490_lookup (i : Fin 32) :
    lookup (95 + i.val) = some (values0490[i.val]'(by rw [values0490_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (95 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_left 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0031_0127, split_right 63 block0488 node0063_0127 (by omega)]
  rw [node0063_0127, split_right 95 block0489 block0490 (by omega)]
  exact block0490_get i

theorem block0491_lookup (i : Fin 32) :
    lookup (127 + i.val) = some (values0491[i.val]'(by rw [values0491_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (127 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_right 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0127_0255, split_left 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0127_0191, split_left 159 block0491 block0492 (by omega)]
  exact block0491_get i

theorem block0492_lookup (i : Fin 32) :
    lookup (159 + i.val) = some (values0492[i.val]'(by rw [values0492_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (159 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_right 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0127_0255, split_left 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0127_0191, split_right 159 block0491 block0492 (by omega)]
  exact block0492_get i

theorem block0493_lookup (i : Fin 32) :
    lookup (191 + i.val) = some (values0493[i.val]'(by rw [values0493_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (191 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_right 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0127_0255, split_right 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0191_0255, split_left 223 block0493 block0494 (by omega)]
  exact block0493_get i

theorem block0494_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values0494[i.val]'(by rw [values0494_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (223 + i.val) = _
  rw [node0031_0470, split_left 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0031_0255, split_right 127 node0031_0127 node0127_0255 (by omega)]
  rw [node0127_0255, split_right 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0191_0255, split_right 223 block0493 block0494 (by omega)]
  exact block0494_get i

theorem block0495_lookup (i : Fin 32) :
    lookup (255 + i.val) = some (values0495[i.val]'(by rw [values0495_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (255 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_left 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0255_0351, split_left 287 block0495 node0287_0351 (by omega)]
  exact block0495_get i

theorem block0496_lookup (i : Fin 32) :
    lookup (287 + i.val) = some (values0496[i.val]'(by rw [values0496_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (287 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_left 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0255_0351, split_right 287 block0495 node0287_0351 (by omega)]
  rw [node0287_0351, split_left 319 block0496 block0497 (by omega)]
  exact block0496_get i

theorem block0497_lookup (i : Fin 32) :
    lookup (319 + i.val) = some (values0497[i.val]'(by rw [values0497_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (319 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_left 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0255_0351, split_right 287 block0495 node0287_0351 (by omega)]
  rw [node0287_0351, split_right 319 block0496 block0497 (by omega)]
  exact block0497_get i

theorem block0498_lookup (i : Fin 32) :
    lookup (351 + i.val) = some (values0498[i.val]'(by rw [values0498_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (351 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_right 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0351_0470, split_left 415 node0351_0415 node0415_0470 (by omega)]
  rw [node0351_0415, split_left 383 block0498 block0499 (by omega)]
  exact block0498_get i

theorem block0499_lookup (i : Fin 32) :
    lookup (383 + i.val) = some (values0499[i.val]'(by rw [values0499_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (383 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_right 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0351_0470, split_left 415 node0351_0415 node0415_0470 (by omega)]
  rw [node0351_0415, split_right 383 block0498 block0499 (by omega)]
  exact block0499_get i

theorem block0500_lookup (i : Fin 32) :
    lookup (415 + i.val) = some (values0500[i.val]'(by rw [values0500_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (415 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_right 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0351_0470, split_right 415 node0351_0415 node0415_0470 (by omega)]
  rw [node0415_0470, split_left 447 block0500 block0501 (by omega)]
  exact block0500_get i

theorem block0501_lookup (i : Fin 23) :
    lookup (447 + i.val) = some (values0501[i.val]'(by rw [values0501_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0031_0470 (447 + i.val) = _
  rw [node0031_0470, split_right 255 node0031_0255 node0255_0470 (by omega)]
  rw [node0255_0470, split_right 351 node0255_0351 node0351_0470 (by omega)]
  rw [node0351_0470, split_right 415 node0351_0415 node0415_0470 (by omega)]
  rw [node0415_0470, split_right 447 block0500 block0501 (by omega)]
  exact block0501_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0488_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0488_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0489_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0489_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0490_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0490_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0491_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0491_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0492_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0492_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0493_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0493_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0494_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0494_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0495_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0495_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0496_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0496_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0497_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0497_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0498_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0498_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0499_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0499_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0500_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0500_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0501_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0501_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0488_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0489_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0490_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0491_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0492_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0493_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0494_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0495_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0496_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0497_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0498_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0499_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0500_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow032.block0501_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow032
