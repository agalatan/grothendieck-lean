import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0432
import Grothe.UpperChaos.OriginalRow227TriangleData0433
import Grothe.UpperChaos.OriginalRow227TriangleData0434
import Grothe.UpperChaos.OriginalRow227TriangleData0435
import Grothe.UpperChaos.OriginalRow227TriangleData0436
import Grothe.UpperChaos.OriginalRow227TriangleData0437
import Grothe.UpperChaos.OriginalRow227TriangleData0438
import Grothe.UpperChaos.OriginalRow227TriangleData0439
import Grothe.UpperChaos.OriginalRow227TriangleData0440
import Grothe.UpperChaos.OriginalRow227TriangleData0441
import Grothe.UpperChaos.OriginalRow227TriangleData0442
import Grothe.UpperChaos.OriginalRow227TriangleData0443
import Grothe.UpperChaos.OriginalRow227TriangleData0444
import Grothe.UpperChaos.OriginalRow227TriangleData0445

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow028

open ConditionalTableLookup

def values0432 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0432.coefficient28_27,
  OriginalRow227TriangleData0432.coefficient28_28,
  OriginalRow227TriangleData0432.coefficient28_29,
  OriginalRow227TriangleData0432.coefficient28_30,
  OriginalRow227TriangleData0432.coefficient28_31,
  OriginalRow227TriangleData0432.coefficient28_32,
  OriginalRow227TriangleData0432.coefficient28_33,
  OriginalRow227TriangleData0432.coefficient28_34,
  OriginalRow227TriangleData0432.coefficient28_35,
  OriginalRow227TriangleData0432.coefficient28_36,
  OriginalRow227TriangleData0432.coefficient28_37,
  OriginalRow227TriangleData0432.coefficient28_38,
  OriginalRow227TriangleData0432.coefficient28_39,
  OriginalRow227TriangleData0432.coefficient28_40,
  OriginalRow227TriangleData0432.coefficient28_41,
  OriginalRow227TriangleData0432.coefficient28_42,
  OriginalRow227TriangleData0432.coefficient28_43,
  OriginalRow227TriangleData0432.coefficient28_44,
  OriginalRow227TriangleData0432.coefficient28_45,
  OriginalRow227TriangleData0432.coefficient28_46,
  OriginalRow227TriangleData0432.coefficient28_47,
  OriginalRow227TriangleData0432.coefficient28_48,
  OriginalRow227TriangleData0432.coefficient28_49,
  OriginalRow227TriangleData0432.coefficient28_50,
  OriginalRow227TriangleData0432.coefficient28_51,
  OriginalRow227TriangleData0432.coefficient28_52,
  OriginalRow227TriangleData0432.coefficient28_53,
  OriginalRow227TriangleData0432.coefficient28_54,
  OriginalRow227TriangleData0432.coefficient28_55,
  OriginalRow227TriangleData0432.coefficient28_56,
  OriginalRow227TriangleData0432.coefficient28_57,
  OriginalRow227TriangleData0432.coefficient28_58
]

theorem values0432_size : values0432.size = 32 := rfl

def block0432 : ℕ → Option IntervalDyadic := segment 27 values0432

theorem block0432_domain : ExactDomain block0432 27 59 := by
  simpa only [values0432_size] using segment_domain 27 values0432

theorem block0432_get (i : Fin 32) :
    block0432 (27 + i.val) = some (values0432[i.val]'(by rw [values0432_size]; exact i.isLt)) := by
  exact segment_get 27 values0432 ⟨i.val, by rw [values0432_size]; exact i.isLt⟩

def values0433 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0433.coefficient28_59,
  OriginalRow227TriangleData0433.coefficient28_60,
  OriginalRow227TriangleData0433.coefficient28_61,
  OriginalRow227TriangleData0433.coefficient28_62,
  OriginalRow227TriangleData0433.coefficient28_63,
  OriginalRow227TriangleData0433.coefficient28_64,
  OriginalRow227TriangleData0433.coefficient28_65,
  OriginalRow227TriangleData0433.coefficient28_66,
  OriginalRow227TriangleData0433.coefficient28_67,
  OriginalRow227TriangleData0433.coefficient28_68,
  OriginalRow227TriangleData0433.coefficient28_69,
  OriginalRow227TriangleData0433.coefficient28_70,
  OriginalRow227TriangleData0433.coefficient28_71,
  OriginalRow227TriangleData0433.coefficient28_72,
  OriginalRow227TriangleData0433.coefficient28_73,
  OriginalRow227TriangleData0433.coefficient28_74,
  OriginalRow227TriangleData0433.coefficient28_75,
  OriginalRow227TriangleData0433.coefficient28_76,
  OriginalRow227TriangleData0433.coefficient28_77,
  OriginalRow227TriangleData0433.coefficient28_78,
  OriginalRow227TriangleData0433.coefficient28_79,
  OriginalRow227TriangleData0433.coefficient28_80,
  OriginalRow227TriangleData0433.coefficient28_81,
  OriginalRow227TriangleData0433.coefficient28_82,
  OriginalRow227TriangleData0433.coefficient28_83,
  OriginalRow227TriangleData0433.coefficient28_84,
  OriginalRow227TriangleData0433.coefficient28_85,
  OriginalRow227TriangleData0433.coefficient28_86,
  OriginalRow227TriangleData0433.coefficient28_87,
  OriginalRow227TriangleData0433.coefficient28_88,
  OriginalRow227TriangleData0433.coefficient28_89,
  OriginalRow227TriangleData0433.coefficient28_90
]

theorem values0433_size : values0433.size = 32 := rfl

def block0433 : ℕ → Option IntervalDyadic := segment 59 values0433

theorem block0433_domain : ExactDomain block0433 59 91 := by
  simpa only [values0433_size] using segment_domain 59 values0433

theorem block0433_get (i : Fin 32) :
    block0433 (59 + i.val) = some (values0433[i.val]'(by rw [values0433_size]; exact i.isLt)) := by
  exact segment_get 59 values0433 ⟨i.val, by rw [values0433_size]; exact i.isLt⟩

def values0434 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0434.coefficient28_91,
  OriginalRow227TriangleData0434.coefficient28_92,
  OriginalRow227TriangleData0434.coefficient28_93,
  OriginalRow227TriangleData0434.coefficient28_94,
  OriginalRow227TriangleData0434.coefficient28_95,
  OriginalRow227TriangleData0434.coefficient28_96,
  OriginalRow227TriangleData0434.coefficient28_97,
  OriginalRow227TriangleData0434.coefficient28_98,
  OriginalRow227TriangleData0434.coefficient28_99,
  OriginalRow227TriangleData0434.coefficient28_100,
  OriginalRow227TriangleData0434.coefficient28_101,
  OriginalRow227TriangleData0434.coefficient28_102,
  OriginalRow227TriangleData0434.coefficient28_103,
  OriginalRow227TriangleData0434.coefficient28_104,
  OriginalRow227TriangleData0434.coefficient28_105,
  OriginalRow227TriangleData0434.coefficient28_106,
  OriginalRow227TriangleData0434.coefficient28_107,
  OriginalRow227TriangleData0434.coefficient28_108,
  OriginalRow227TriangleData0434.coefficient28_109,
  OriginalRow227TriangleData0434.coefficient28_110,
  OriginalRow227TriangleData0434.coefficient28_111,
  OriginalRow227TriangleData0434.coefficient28_112,
  OriginalRow227TriangleData0434.coefficient28_113,
  OriginalRow227TriangleData0434.coefficient28_114,
  OriginalRow227TriangleData0434.coefficient28_115,
  OriginalRow227TriangleData0434.coefficient28_116,
  OriginalRow227TriangleData0434.coefficient28_117,
  OriginalRow227TriangleData0434.coefficient28_118,
  OriginalRow227TriangleData0434.coefficient28_119,
  OriginalRow227TriangleData0434.coefficient28_120,
  OriginalRow227TriangleData0434.coefficient28_121,
  OriginalRow227TriangleData0434.coefficient28_122
]

theorem values0434_size : values0434.size = 32 := rfl

def block0434 : ℕ → Option IntervalDyadic := segment 91 values0434

theorem block0434_domain : ExactDomain block0434 91 123 := by
  simpa only [values0434_size] using segment_domain 91 values0434

theorem block0434_get (i : Fin 32) :
    block0434 (91 + i.val) = some (values0434[i.val]'(by rw [values0434_size]; exact i.isLt)) := by
  exact segment_get 91 values0434 ⟨i.val, by rw [values0434_size]; exact i.isLt⟩

def values0435 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0435.coefficient28_123,
  OriginalRow227TriangleData0435.coefficient28_124,
  OriginalRow227TriangleData0435.coefficient28_125,
  OriginalRow227TriangleData0435.coefficient28_126,
  OriginalRow227TriangleData0435.coefficient28_127,
  OriginalRow227TriangleData0435.coefficient28_128,
  OriginalRow227TriangleData0435.coefficient28_129,
  OriginalRow227TriangleData0435.coefficient28_130,
  OriginalRow227TriangleData0435.coefficient28_131,
  OriginalRow227TriangleData0435.coefficient28_132,
  OriginalRow227TriangleData0435.coefficient28_133,
  OriginalRow227TriangleData0435.coefficient28_134,
  OriginalRow227TriangleData0435.coefficient28_135,
  OriginalRow227TriangleData0435.coefficient28_136,
  OriginalRow227TriangleData0435.coefficient28_137,
  OriginalRow227TriangleData0435.coefficient28_138,
  OriginalRow227TriangleData0435.coefficient28_139,
  OriginalRow227TriangleData0435.coefficient28_140,
  OriginalRow227TriangleData0435.coefficient28_141,
  OriginalRow227TriangleData0435.coefficient28_142,
  OriginalRow227TriangleData0435.coefficient28_143,
  OriginalRow227TriangleData0435.coefficient28_144,
  OriginalRow227TriangleData0435.coefficient28_145,
  OriginalRow227TriangleData0435.coefficient28_146,
  OriginalRow227TriangleData0435.coefficient28_147,
  OriginalRow227TriangleData0435.coefficient28_148,
  OriginalRow227TriangleData0435.coefficient28_149,
  OriginalRow227TriangleData0435.coefficient28_150,
  OriginalRow227TriangleData0435.coefficient28_151,
  OriginalRow227TriangleData0435.coefficient28_152,
  OriginalRow227TriangleData0435.coefficient28_153,
  OriginalRow227TriangleData0435.coefficient28_154
]

theorem values0435_size : values0435.size = 32 := rfl

def block0435 : ℕ → Option IntervalDyadic := segment 123 values0435

theorem block0435_domain : ExactDomain block0435 123 155 := by
  simpa only [values0435_size] using segment_domain 123 values0435

theorem block0435_get (i : Fin 32) :
    block0435 (123 + i.val) = some (values0435[i.val]'(by rw [values0435_size]; exact i.isLt)) := by
  exact segment_get 123 values0435 ⟨i.val, by rw [values0435_size]; exact i.isLt⟩

def values0436 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0436.coefficient28_155,
  OriginalRow227TriangleData0436.coefficient28_156,
  OriginalRow227TriangleData0436.coefficient28_157,
  OriginalRow227TriangleData0436.coefficient28_158,
  OriginalRow227TriangleData0436.coefficient28_159,
  OriginalRow227TriangleData0436.coefficient28_160,
  OriginalRow227TriangleData0436.coefficient28_161,
  OriginalRow227TriangleData0436.coefficient28_162,
  OriginalRow227TriangleData0436.coefficient28_163,
  OriginalRow227TriangleData0436.coefficient28_164,
  OriginalRow227TriangleData0436.coefficient28_165,
  OriginalRow227TriangleData0436.coefficient28_166,
  OriginalRow227TriangleData0436.coefficient28_167,
  OriginalRow227TriangleData0436.coefficient28_168,
  OriginalRow227TriangleData0436.coefficient28_169,
  OriginalRow227TriangleData0436.coefficient28_170,
  OriginalRow227TriangleData0436.coefficient28_171,
  OriginalRow227TriangleData0436.coefficient28_172,
  OriginalRow227TriangleData0436.coefficient28_173,
  OriginalRow227TriangleData0436.coefficient28_174,
  OriginalRow227TriangleData0436.coefficient28_175,
  OriginalRow227TriangleData0436.coefficient28_176,
  OriginalRow227TriangleData0436.coefficient28_177,
  OriginalRow227TriangleData0436.coefficient28_178,
  OriginalRow227TriangleData0436.coefficient28_179,
  OriginalRow227TriangleData0436.coefficient28_180,
  OriginalRow227TriangleData0436.coefficient28_181,
  OriginalRow227TriangleData0436.coefficient28_182,
  OriginalRow227TriangleData0436.coefficient28_183,
  OriginalRow227TriangleData0436.coefficient28_184,
  OriginalRow227TriangleData0436.coefficient28_185,
  OriginalRow227TriangleData0436.coefficient28_186
]

theorem values0436_size : values0436.size = 32 := rfl

def block0436 : ℕ → Option IntervalDyadic := segment 155 values0436

theorem block0436_domain : ExactDomain block0436 155 187 := by
  simpa only [values0436_size] using segment_domain 155 values0436

theorem block0436_get (i : Fin 32) :
    block0436 (155 + i.val) = some (values0436[i.val]'(by rw [values0436_size]; exact i.isLt)) := by
  exact segment_get 155 values0436 ⟨i.val, by rw [values0436_size]; exact i.isLt⟩

def values0437 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0437.coefficient28_187,
  OriginalRow227TriangleData0437.coefficient28_188,
  OriginalRow227TriangleData0437.coefficient28_189,
  OriginalRow227TriangleData0437.coefficient28_190,
  OriginalRow227TriangleData0437.coefficient28_191,
  OriginalRow227TriangleData0437.coefficient28_192,
  OriginalRow227TriangleData0437.coefficient28_193,
  OriginalRow227TriangleData0437.coefficient28_194,
  OriginalRow227TriangleData0437.coefficient28_195,
  OriginalRow227TriangleData0437.coefficient28_196,
  OriginalRow227TriangleData0437.coefficient28_197,
  OriginalRow227TriangleData0437.coefficient28_198,
  OriginalRow227TriangleData0437.coefficient28_199,
  OriginalRow227TriangleData0437.coefficient28_200,
  OriginalRow227TriangleData0437.coefficient28_201,
  OriginalRow227TriangleData0437.coefficient28_202,
  OriginalRow227TriangleData0437.coefficient28_203,
  OriginalRow227TriangleData0437.coefficient28_204,
  OriginalRow227TriangleData0437.coefficient28_205,
  OriginalRow227TriangleData0437.coefficient28_206,
  OriginalRow227TriangleData0437.coefficient28_207,
  OriginalRow227TriangleData0437.coefficient28_208,
  OriginalRow227TriangleData0437.coefficient28_209,
  OriginalRow227TriangleData0437.coefficient28_210,
  OriginalRow227TriangleData0437.coefficient28_211,
  OriginalRow227TriangleData0437.coefficient28_212,
  OriginalRow227TriangleData0437.coefficient28_213,
  OriginalRow227TriangleData0437.coefficient28_214,
  OriginalRow227TriangleData0437.coefficient28_215,
  OriginalRow227TriangleData0437.coefficient28_216,
  OriginalRow227TriangleData0437.coefficient28_217,
  OriginalRow227TriangleData0437.coefficient28_218
]

theorem values0437_size : values0437.size = 32 := rfl

def block0437 : ℕ → Option IntervalDyadic := segment 187 values0437

theorem block0437_domain : ExactDomain block0437 187 219 := by
  simpa only [values0437_size] using segment_domain 187 values0437

theorem block0437_get (i : Fin 32) :
    block0437 (187 + i.val) = some (values0437[i.val]'(by rw [values0437_size]; exact i.isLt)) := by
  exact segment_get 187 values0437 ⟨i.val, by rw [values0437_size]; exact i.isLt⟩

def values0438 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0438.coefficient28_219,
  OriginalRow227TriangleData0438.coefficient28_220,
  OriginalRow227TriangleData0438.coefficient28_221,
  OriginalRow227TriangleData0438.coefficient28_222,
  OriginalRow227TriangleData0438.coefficient28_223,
  OriginalRow227TriangleData0438.coefficient28_224,
  OriginalRow227TriangleData0438.coefficient28_225,
  OriginalRow227TriangleData0438.coefficient28_226,
  OriginalRow227TriangleData0438.coefficient28_227,
  OriginalRow227TriangleData0438.coefficient28_228,
  OriginalRow227TriangleData0438.coefficient28_229,
  OriginalRow227TriangleData0438.coefficient28_230,
  OriginalRow227TriangleData0438.coefficient28_231,
  OriginalRow227TriangleData0438.coefficient28_232,
  OriginalRow227TriangleData0438.coefficient28_233,
  OriginalRow227TriangleData0438.coefficient28_234,
  OriginalRow227TriangleData0438.coefficient28_235,
  OriginalRow227TriangleData0438.coefficient28_236,
  OriginalRow227TriangleData0438.coefficient28_237,
  OriginalRow227TriangleData0438.coefficient28_238,
  OriginalRow227TriangleData0438.coefficient28_239,
  OriginalRow227TriangleData0438.coefficient28_240,
  OriginalRow227TriangleData0438.coefficient28_241,
  OriginalRow227TriangleData0438.coefficient28_242,
  OriginalRow227TriangleData0438.coefficient28_243,
  OriginalRow227TriangleData0438.coefficient28_244,
  OriginalRow227TriangleData0438.coefficient28_245,
  OriginalRow227TriangleData0438.coefficient28_246,
  OriginalRow227TriangleData0438.coefficient28_247,
  OriginalRow227TriangleData0438.coefficient28_248,
  OriginalRow227TriangleData0438.coefficient28_249,
  OriginalRow227TriangleData0438.coefficient28_250
]

theorem values0438_size : values0438.size = 32 := rfl

def block0438 : ℕ → Option IntervalDyadic := segment 219 values0438

theorem block0438_domain : ExactDomain block0438 219 251 := by
  simpa only [values0438_size] using segment_domain 219 values0438

theorem block0438_get (i : Fin 32) :
    block0438 (219 + i.val) = some (values0438[i.val]'(by rw [values0438_size]; exact i.isLt)) := by
  exact segment_get 219 values0438 ⟨i.val, by rw [values0438_size]; exact i.isLt⟩

def values0439 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0439.coefficient28_251,
  OriginalRow227TriangleData0439.coefficient28_252,
  OriginalRow227TriangleData0439.coefficient28_253,
  OriginalRow227TriangleData0439.coefficient28_254,
  OriginalRow227TriangleData0439.coefficient28_255,
  OriginalRow227TriangleData0439.coefficient28_256,
  OriginalRow227TriangleData0439.coefficient28_257,
  OriginalRow227TriangleData0439.coefficient28_258,
  OriginalRow227TriangleData0439.coefficient28_259,
  OriginalRow227TriangleData0439.coefficient28_260,
  OriginalRow227TriangleData0439.coefficient28_261,
  OriginalRow227TriangleData0439.coefficient28_262,
  OriginalRow227TriangleData0439.coefficient28_263,
  OriginalRow227TriangleData0439.coefficient28_264,
  OriginalRow227TriangleData0439.coefficient28_265,
  OriginalRow227TriangleData0439.coefficient28_266,
  OriginalRow227TriangleData0439.coefficient28_267,
  OriginalRow227TriangleData0439.coefficient28_268,
  OriginalRow227TriangleData0439.coefficient28_269,
  OriginalRow227TriangleData0439.coefficient28_270,
  OriginalRow227TriangleData0439.coefficient28_271,
  OriginalRow227TriangleData0439.coefficient28_272,
  OriginalRow227TriangleData0439.coefficient28_273,
  OriginalRow227TriangleData0439.coefficient28_274,
  OriginalRow227TriangleData0439.coefficient28_275,
  OriginalRow227TriangleData0439.coefficient28_276,
  OriginalRow227TriangleData0439.coefficient28_277,
  OriginalRow227TriangleData0439.coefficient28_278,
  OriginalRow227TriangleData0439.coefficient28_279,
  OriginalRow227TriangleData0439.coefficient28_280,
  OriginalRow227TriangleData0439.coefficient28_281,
  OriginalRow227TriangleData0439.coefficient28_282
]

theorem values0439_size : values0439.size = 32 := rfl

def block0439 : ℕ → Option IntervalDyadic := segment 251 values0439

theorem block0439_domain : ExactDomain block0439 251 283 := by
  simpa only [values0439_size] using segment_domain 251 values0439

theorem block0439_get (i : Fin 32) :
    block0439 (251 + i.val) = some (values0439[i.val]'(by rw [values0439_size]; exact i.isLt)) := by
  exact segment_get 251 values0439 ⟨i.val, by rw [values0439_size]; exact i.isLt⟩

def values0440 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0440.coefficient28_283,
  OriginalRow227TriangleData0440.coefficient28_284,
  OriginalRow227TriangleData0440.coefficient28_285,
  OriginalRow227TriangleData0440.coefficient28_286,
  OriginalRow227TriangleData0440.coefficient28_287,
  OriginalRow227TriangleData0440.coefficient28_288,
  OriginalRow227TriangleData0440.coefficient28_289,
  OriginalRow227TriangleData0440.coefficient28_290,
  OriginalRow227TriangleData0440.coefficient28_291,
  OriginalRow227TriangleData0440.coefficient28_292,
  OriginalRow227TriangleData0440.coefficient28_293,
  OriginalRow227TriangleData0440.coefficient28_294,
  OriginalRow227TriangleData0440.coefficient28_295,
  OriginalRow227TriangleData0440.coefficient28_296,
  OriginalRow227TriangleData0440.coefficient28_297,
  OriginalRow227TriangleData0440.coefficient28_298,
  OriginalRow227TriangleData0440.coefficient28_299,
  OriginalRow227TriangleData0440.coefficient28_300,
  OriginalRow227TriangleData0440.coefficient28_301,
  OriginalRow227TriangleData0440.coefficient28_302,
  OriginalRow227TriangleData0440.coefficient28_303,
  OriginalRow227TriangleData0440.coefficient28_304,
  OriginalRow227TriangleData0440.coefficient28_305,
  OriginalRow227TriangleData0440.coefficient28_306,
  OriginalRow227TriangleData0440.coefficient28_307,
  OriginalRow227TriangleData0440.coefficient28_308,
  OriginalRow227TriangleData0440.coefficient28_309,
  OriginalRow227TriangleData0440.coefficient28_310,
  OriginalRow227TriangleData0440.coefficient28_311,
  OriginalRow227TriangleData0440.coefficient28_312,
  OriginalRow227TriangleData0440.coefficient28_313,
  OriginalRow227TriangleData0440.coefficient28_314
]

theorem values0440_size : values0440.size = 32 := rfl

def block0440 : ℕ → Option IntervalDyadic := segment 283 values0440

theorem block0440_domain : ExactDomain block0440 283 315 := by
  simpa only [values0440_size] using segment_domain 283 values0440

theorem block0440_get (i : Fin 32) :
    block0440 (283 + i.val) = some (values0440[i.val]'(by rw [values0440_size]; exact i.isLt)) := by
  exact segment_get 283 values0440 ⟨i.val, by rw [values0440_size]; exact i.isLt⟩

def values0441 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0441.coefficient28_315,
  OriginalRow227TriangleData0441.coefficient28_316,
  OriginalRow227TriangleData0441.coefficient28_317,
  OriginalRow227TriangleData0441.coefficient28_318,
  OriginalRow227TriangleData0441.coefficient28_319,
  OriginalRow227TriangleData0441.coefficient28_320,
  OriginalRow227TriangleData0441.coefficient28_321,
  OriginalRow227TriangleData0441.coefficient28_322,
  OriginalRow227TriangleData0441.coefficient28_323,
  OriginalRow227TriangleData0441.coefficient28_324,
  OriginalRow227TriangleData0441.coefficient28_325,
  OriginalRow227TriangleData0441.coefficient28_326,
  OriginalRow227TriangleData0441.coefficient28_327,
  OriginalRow227TriangleData0441.coefficient28_328,
  OriginalRow227TriangleData0441.coefficient28_329,
  OriginalRow227TriangleData0441.coefficient28_330,
  OriginalRow227TriangleData0441.coefficient28_331,
  OriginalRow227TriangleData0441.coefficient28_332,
  OriginalRow227TriangleData0441.coefficient28_333,
  OriginalRow227TriangleData0441.coefficient28_334,
  OriginalRow227TriangleData0441.coefficient28_335,
  OriginalRow227TriangleData0441.coefficient28_336,
  OriginalRow227TriangleData0441.coefficient28_337,
  OriginalRow227TriangleData0441.coefficient28_338,
  OriginalRow227TriangleData0441.coefficient28_339,
  OriginalRow227TriangleData0441.coefficient28_340,
  OriginalRow227TriangleData0441.coefficient28_341,
  OriginalRow227TriangleData0441.coefficient28_342,
  OriginalRow227TriangleData0441.coefficient28_343,
  OriginalRow227TriangleData0441.coefficient28_344,
  OriginalRow227TriangleData0441.coefficient28_345,
  OriginalRow227TriangleData0441.coefficient28_346
]

theorem values0441_size : values0441.size = 32 := rfl

def block0441 : ℕ → Option IntervalDyadic := segment 315 values0441

theorem block0441_domain : ExactDomain block0441 315 347 := by
  simpa only [values0441_size] using segment_domain 315 values0441

theorem block0441_get (i : Fin 32) :
    block0441 (315 + i.val) = some (values0441[i.val]'(by rw [values0441_size]; exact i.isLt)) := by
  exact segment_get 315 values0441 ⟨i.val, by rw [values0441_size]; exact i.isLt⟩

def values0442 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0442.coefficient28_347,
  OriginalRow227TriangleData0442.coefficient28_348,
  OriginalRow227TriangleData0442.coefficient28_349,
  OriginalRow227TriangleData0442.coefficient28_350,
  OriginalRow227TriangleData0442.coefficient28_351,
  OriginalRow227TriangleData0442.coefficient28_352,
  OriginalRow227TriangleData0442.coefficient28_353,
  OriginalRow227TriangleData0442.coefficient28_354,
  OriginalRow227TriangleData0442.coefficient28_355,
  OriginalRow227TriangleData0442.coefficient28_356,
  OriginalRow227TriangleData0442.coefficient28_357,
  OriginalRow227TriangleData0442.coefficient28_358,
  OriginalRow227TriangleData0442.coefficient28_359,
  OriginalRow227TriangleData0442.coefficient28_360,
  OriginalRow227TriangleData0442.coefficient28_361,
  OriginalRow227TriangleData0442.coefficient28_362,
  OriginalRow227TriangleData0442.coefficient28_363,
  OriginalRow227TriangleData0442.coefficient28_364,
  OriginalRow227TriangleData0442.coefficient28_365,
  OriginalRow227TriangleData0442.coefficient28_366,
  OriginalRow227TriangleData0442.coefficient28_367,
  OriginalRow227TriangleData0442.coefficient28_368,
  OriginalRow227TriangleData0442.coefficient28_369,
  OriginalRow227TriangleData0442.coefficient28_370,
  OriginalRow227TriangleData0442.coefficient28_371,
  OriginalRow227TriangleData0442.coefficient28_372,
  OriginalRow227TriangleData0442.coefficient28_373,
  OriginalRow227TriangleData0442.coefficient28_374,
  OriginalRow227TriangleData0442.coefficient28_375,
  OriginalRow227TriangleData0442.coefficient28_376,
  OriginalRow227TriangleData0442.coefficient28_377,
  OriginalRow227TriangleData0442.coefficient28_378
]

theorem values0442_size : values0442.size = 32 := rfl

def block0442 : ℕ → Option IntervalDyadic := segment 347 values0442

theorem block0442_domain : ExactDomain block0442 347 379 := by
  simpa only [values0442_size] using segment_domain 347 values0442

theorem block0442_get (i : Fin 32) :
    block0442 (347 + i.val) = some (values0442[i.val]'(by rw [values0442_size]; exact i.isLt)) := by
  exact segment_get 347 values0442 ⟨i.val, by rw [values0442_size]; exact i.isLt⟩

def values0443 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0443.coefficient28_379,
  OriginalRow227TriangleData0443.coefficient28_380,
  OriginalRow227TriangleData0443.coefficient28_381,
  OriginalRow227TriangleData0443.coefficient28_382,
  OriginalRow227TriangleData0443.coefficient28_383,
  OriginalRow227TriangleData0443.coefficient28_384,
  OriginalRow227TriangleData0443.coefficient28_385,
  OriginalRow227TriangleData0443.coefficient28_386,
  OriginalRow227TriangleData0443.coefficient28_387,
  OriginalRow227TriangleData0443.coefficient28_388,
  OriginalRow227TriangleData0443.coefficient28_389,
  OriginalRow227TriangleData0443.coefficient28_390,
  OriginalRow227TriangleData0443.coefficient28_391,
  OriginalRow227TriangleData0443.coefficient28_392,
  OriginalRow227TriangleData0443.coefficient28_393,
  OriginalRow227TriangleData0443.coefficient28_394,
  OriginalRow227TriangleData0443.coefficient28_395,
  OriginalRow227TriangleData0443.coefficient28_396,
  OriginalRow227TriangleData0443.coefficient28_397,
  OriginalRow227TriangleData0443.coefficient28_398,
  OriginalRow227TriangleData0443.coefficient28_399,
  OriginalRow227TriangleData0443.coefficient28_400,
  OriginalRow227TriangleData0443.coefficient28_401,
  OriginalRow227TriangleData0443.coefficient28_402,
  OriginalRow227TriangleData0443.coefficient28_403,
  OriginalRow227TriangleData0443.coefficient28_404,
  OriginalRow227TriangleData0443.coefficient28_405,
  OriginalRow227TriangleData0443.coefficient28_406,
  OriginalRow227TriangleData0443.coefficient28_407,
  OriginalRow227TriangleData0443.coefficient28_408,
  OriginalRow227TriangleData0443.coefficient28_409,
  OriginalRow227TriangleData0443.coefficient28_410
]

theorem values0443_size : values0443.size = 32 := rfl

def block0443 : ℕ → Option IntervalDyadic := segment 379 values0443

theorem block0443_domain : ExactDomain block0443 379 411 := by
  simpa only [values0443_size] using segment_domain 379 values0443

theorem block0443_get (i : Fin 32) :
    block0443 (379 + i.val) = some (values0443[i.val]'(by rw [values0443_size]; exact i.isLt)) := by
  exact segment_get 379 values0443 ⟨i.val, by rw [values0443_size]; exact i.isLt⟩

def values0444 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0444.coefficient28_411,
  OriginalRow227TriangleData0444.coefficient28_412,
  OriginalRow227TriangleData0444.coefficient28_413,
  OriginalRow227TriangleData0444.coefficient28_414,
  OriginalRow227TriangleData0444.coefficient28_415,
  OriginalRow227TriangleData0444.coefficient28_416,
  OriginalRow227TriangleData0444.coefficient28_417,
  OriginalRow227TriangleData0444.coefficient28_418,
  OriginalRow227TriangleData0444.coefficient28_419,
  OriginalRow227TriangleData0444.coefficient28_420,
  OriginalRow227TriangleData0444.coefficient28_421,
  OriginalRow227TriangleData0444.coefficient28_422,
  OriginalRow227TriangleData0444.coefficient28_423,
  OriginalRow227TriangleData0444.coefficient28_424,
  OriginalRow227TriangleData0444.coefficient28_425,
  OriginalRow227TriangleData0444.coefficient28_426,
  OriginalRow227TriangleData0444.coefficient28_427,
  OriginalRow227TriangleData0444.coefficient28_428,
  OriginalRow227TriangleData0444.coefficient28_429,
  OriginalRow227TriangleData0444.coefficient28_430,
  OriginalRow227TriangleData0444.coefficient28_431,
  OriginalRow227TriangleData0444.coefficient28_432,
  OriginalRow227TriangleData0444.coefficient28_433,
  OriginalRow227TriangleData0444.coefficient28_434,
  OriginalRow227TriangleData0444.coefficient28_435,
  OriginalRow227TriangleData0444.coefficient28_436,
  OriginalRow227TriangleData0444.coefficient28_437,
  OriginalRow227TriangleData0444.coefficient28_438,
  OriginalRow227TriangleData0444.coefficient28_439,
  OriginalRow227TriangleData0444.coefficient28_440,
  OriginalRow227TriangleData0444.coefficient28_441,
  OriginalRow227TriangleData0444.coefficient28_442
]

theorem values0444_size : values0444.size = 32 := rfl

def block0444 : ℕ → Option IntervalDyadic := segment 411 values0444

theorem block0444_domain : ExactDomain block0444 411 443 := by
  simpa only [values0444_size] using segment_domain 411 values0444

theorem block0444_get (i : Fin 32) :
    block0444 (411 + i.val) = some (values0444[i.val]'(by rw [values0444_size]; exact i.isLt)) := by
  exact segment_get 411 values0444 ⟨i.val, by rw [values0444_size]; exact i.isLt⟩

def values0445 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0445.coefficient28_443,
  OriginalRow227TriangleData0445.coefficient28_444,
  OriginalRow227TriangleData0445.coefficient28_445,
  OriginalRow227TriangleData0445.coefficient28_446,
  OriginalRow227TriangleData0445.coefficient28_447,
  OriginalRow227TriangleData0445.coefficient28_448,
  OriginalRow227TriangleData0445.coefficient28_449,
  OriginalRow227TriangleData0445.coefficient28_450,
  OriginalRow227TriangleData0445.coefficient28_451,
  OriginalRow227TriangleData0445.coefficient28_452,
  OriginalRow227TriangleData0445.coefficient28_453,
  OriginalRow227TriangleData0445.coefficient28_454,
  OriginalRow227TriangleData0445.coefficient28_455,
  OriginalRow227TriangleData0445.coefficient28_456,
  OriginalRow227TriangleData0445.coefficient28_457,
  OriginalRow227TriangleData0445.coefficient28_458,
  OriginalRow227TriangleData0445.coefficient28_459,
  OriginalRow227TriangleData0445.coefficient28_460,
  OriginalRow227TriangleData0445.coefficient28_461,
  OriginalRow227TriangleData0445.coefficient28_462,
  OriginalRow227TriangleData0445.coefficient28_463,
  OriginalRow227TriangleData0445.coefficient28_464,
  OriginalRow227TriangleData0445.coefficient28_465,
  OriginalRow227TriangleData0445.coefficient28_466,
  OriginalRow227TriangleData0445.coefficient28_467,
  OriginalRow227TriangleData0445.coefficient28_468,
  OriginalRow227TriangleData0445.coefficient28_469,
  OriginalRow227TriangleData0445.coefficient28_470,
  OriginalRow227TriangleData0445.coefficient28_471,
  OriginalRow227TriangleData0445.coefficient28_472,
  OriginalRow227TriangleData0445.coefficient28_473
]

theorem values0445_size : values0445.size = 31 := rfl

def block0445 : ℕ → Option IntervalDyadic := segment 443 values0445

theorem block0445_domain : ExactDomain block0445 443 474 := by
  simpa only [values0445_size] using segment_domain 443 values0445

theorem block0445_get (i : Fin 31) :
    block0445 (443 + i.val) = some (values0445[i.val]'(by rw [values0445_size]; exact i.isLt)) := by
  exact segment_get 443 values0445 ⟨i.val, by rw [values0445_size]; exact i.isLt⟩

def node0059_0123 : ℕ → Option IntervalDyadic := split 91 block0433 block0434

theorem node0059_0123_domain : ExactDomain node0059_0123 59 123 := by
  exact split_domain (by decide) (by decide) block0433_domain block0434_domain

def node0027_0123 : ℕ → Option IntervalDyadic := split 59 block0432 node0059_0123

theorem node0027_0123_domain : ExactDomain node0027_0123 27 123 := by
  exact split_domain (by decide) (by decide) block0432_domain node0059_0123_domain

def node0123_0187 : ℕ → Option IntervalDyadic := split 155 block0435 block0436

theorem node0123_0187_domain : ExactDomain node0123_0187 123 187 := by
  exact split_domain (by decide) (by decide) block0435_domain block0436_domain

def node0187_0251 : ℕ → Option IntervalDyadic := split 219 block0437 block0438

theorem node0187_0251_domain : ExactDomain node0187_0251 187 251 := by
  exact split_domain (by decide) (by decide) block0437_domain block0438_domain

def node0123_0251 : ℕ → Option IntervalDyadic := split 187 node0123_0187 node0187_0251

theorem node0123_0251_domain : ExactDomain node0123_0251 123 251 := by
  exact split_domain (by decide) (by decide) node0123_0187_domain node0187_0251_domain

def node0027_0251 : ℕ → Option IntervalDyadic := split 123 node0027_0123 node0123_0251

theorem node0027_0251_domain : ExactDomain node0027_0251 27 251 := by
  exact split_domain (by decide) (by decide) node0027_0123_domain node0123_0251_domain

def node0283_0347 : ℕ → Option IntervalDyadic := split 315 block0440 block0441

theorem node0283_0347_domain : ExactDomain node0283_0347 283 347 := by
  exact split_domain (by decide) (by decide) block0440_domain block0441_domain

def node0251_0347 : ℕ → Option IntervalDyadic := split 283 block0439 node0283_0347

theorem node0251_0347_domain : ExactDomain node0251_0347 251 347 := by
  exact split_domain (by decide) (by decide) block0439_domain node0283_0347_domain

def node0347_0411 : ℕ → Option IntervalDyadic := split 379 block0442 block0443

theorem node0347_0411_domain : ExactDomain node0347_0411 347 411 := by
  exact split_domain (by decide) (by decide) block0442_domain block0443_domain

def node0411_0474 : ℕ → Option IntervalDyadic := split 443 block0444 block0445

theorem node0411_0474_domain : ExactDomain node0411_0474 411 474 := by
  exact split_domain (by decide) (by decide) block0444_domain block0445_domain

def node0347_0474 : ℕ → Option IntervalDyadic := split 411 node0347_0411 node0411_0474

theorem node0347_0474_domain : ExactDomain node0347_0474 347 474 := by
  exact split_domain (by decide) (by decide) node0347_0411_domain node0411_0474_domain

def node0251_0474 : ℕ → Option IntervalDyadic := split 347 node0251_0347 node0347_0474

theorem node0251_0474_domain : ExactDomain node0251_0474 251 474 := by
  exact split_domain (by decide) (by decide) node0251_0347_domain node0347_0474_domain

def node0027_0474 : ℕ → Option IntervalDyadic := split 251 node0027_0251 node0251_0474

theorem node0027_0474_domain : ExactDomain node0027_0474 27 474 := by
  exact split_domain (by decide) (by decide) node0027_0251_domain node0251_0474_domain

def lookup : ℕ → Option IntervalDyadic := node0027_0474

theorem lookup_domain : ExactDomain lookup 27 474 :=
  node0027_0474_domain

theorem block0432_lookup (i : Fin 32) :
    lookup (27 + i.val) = some (values0432[i.val]'(by rw [values0432_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (27 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_left 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0027_0123, split_left 59 block0432 node0059_0123 (by omega)]
  exact block0432_get i

theorem block0433_lookup (i : Fin 32) :
    lookup (59 + i.val) = some (values0433[i.val]'(by rw [values0433_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (59 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_left 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0027_0123, split_right 59 block0432 node0059_0123 (by omega)]
  rw [node0059_0123, split_left 91 block0433 block0434 (by omega)]
  exact block0433_get i

theorem block0434_lookup (i : Fin 32) :
    lookup (91 + i.val) = some (values0434[i.val]'(by rw [values0434_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (91 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_left 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0027_0123, split_right 59 block0432 node0059_0123 (by omega)]
  rw [node0059_0123, split_right 91 block0433 block0434 (by omega)]
  exact block0434_get i

theorem block0435_lookup (i : Fin 32) :
    lookup (123 + i.val) = some (values0435[i.val]'(by rw [values0435_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (123 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_right 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0123_0251, split_left 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0123_0187, split_left 155 block0435 block0436 (by omega)]
  exact block0435_get i

theorem block0436_lookup (i : Fin 32) :
    lookup (155 + i.val) = some (values0436[i.val]'(by rw [values0436_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (155 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_right 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0123_0251, split_left 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0123_0187, split_right 155 block0435 block0436 (by omega)]
  exact block0436_get i

theorem block0437_lookup (i : Fin 32) :
    lookup (187 + i.val) = some (values0437[i.val]'(by rw [values0437_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (187 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_right 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0123_0251, split_right 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0187_0251, split_left 219 block0437 block0438 (by omega)]
  exact block0437_get i

theorem block0438_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values0438[i.val]'(by rw [values0438_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (219 + i.val) = _
  rw [node0027_0474, split_left 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0027_0251, split_right 123 node0027_0123 node0123_0251 (by omega)]
  rw [node0123_0251, split_right 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0187_0251, split_right 219 block0437 block0438 (by omega)]
  exact block0438_get i

theorem block0439_lookup (i : Fin 32) :
    lookup (251 + i.val) = some (values0439[i.val]'(by rw [values0439_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (251 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_left 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0251_0347, split_left 283 block0439 node0283_0347 (by omega)]
  exact block0439_get i

theorem block0440_lookup (i : Fin 32) :
    lookup (283 + i.val) = some (values0440[i.val]'(by rw [values0440_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (283 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_left 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0251_0347, split_right 283 block0439 node0283_0347 (by omega)]
  rw [node0283_0347, split_left 315 block0440 block0441 (by omega)]
  exact block0440_get i

theorem block0441_lookup (i : Fin 32) :
    lookup (315 + i.val) = some (values0441[i.val]'(by rw [values0441_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (315 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_left 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0251_0347, split_right 283 block0439 node0283_0347 (by omega)]
  rw [node0283_0347, split_right 315 block0440 block0441 (by omega)]
  exact block0441_get i

theorem block0442_lookup (i : Fin 32) :
    lookup (347 + i.val) = some (values0442[i.val]'(by rw [values0442_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (347 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_right 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0347_0474, split_left 411 node0347_0411 node0411_0474 (by omega)]
  rw [node0347_0411, split_left 379 block0442 block0443 (by omega)]
  exact block0442_get i

theorem block0443_lookup (i : Fin 32) :
    lookup (379 + i.val) = some (values0443[i.val]'(by rw [values0443_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (379 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_right 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0347_0474, split_left 411 node0347_0411 node0411_0474 (by omega)]
  rw [node0347_0411, split_right 379 block0442 block0443 (by omega)]
  exact block0443_get i

theorem block0444_lookup (i : Fin 32) :
    lookup (411 + i.val) = some (values0444[i.val]'(by rw [values0444_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (411 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_right 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0347_0474, split_right 411 node0347_0411 node0411_0474 (by omega)]
  rw [node0411_0474, split_left 443 block0444 block0445 (by omega)]
  exact block0444_get i

theorem block0445_lookup (i : Fin 31) :
    lookup (443 + i.val) = some (values0445[i.val]'(by rw [values0445_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0027_0474 (443 + i.val) = _
  rw [node0027_0474, split_right 251 node0027_0251 node0251_0474 (by omega)]
  rw [node0251_0474, split_right 347 node0251_0347 node0347_0474 (by omega)]
  rw [node0347_0474, split_right 411 node0347_0411 node0411_0474 (by omega)]
  rw [node0411_0474, split_right 443 block0444 block0445 (by omega)]
  exact block0445_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0432_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0432_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0433_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0433_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0434_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0434_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0435_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0435_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0436_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0436_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0437_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0437_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0438_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0438_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0439_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0439_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0440_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0440_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0441_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0441_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0442_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0442_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0443_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0443_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0444_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0444_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0445_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0445_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0432_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0433_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0434_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0435_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0436_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0437_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0438_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0439_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0440_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0441_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0442_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0443_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0444_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow028.block0445_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow028
