import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0446
import Grothe.UpperChaos.OriginalRow227TriangleData0447
import Grothe.UpperChaos.OriginalRow227TriangleData0448
import Grothe.UpperChaos.OriginalRow227TriangleData0449
import Grothe.UpperChaos.OriginalRow227TriangleData0450
import Grothe.UpperChaos.OriginalRow227TriangleData0451
import Grothe.UpperChaos.OriginalRow227TriangleData0452
import Grothe.UpperChaos.OriginalRow227TriangleData0453
import Grothe.UpperChaos.OriginalRow227TriangleData0454
import Grothe.UpperChaos.OriginalRow227TriangleData0455
import Grothe.UpperChaos.OriginalRow227TriangleData0456
import Grothe.UpperChaos.OriginalRow227TriangleData0457
import Grothe.UpperChaos.OriginalRow227TriangleData0458
import Grothe.UpperChaos.OriginalRow227TriangleData0459

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow029

open ConditionalTableLookup

def values0446 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0446.coefficient29_28,
  OriginalRow227TriangleData0446.coefficient29_29,
  OriginalRow227TriangleData0446.coefficient29_30,
  OriginalRow227TriangleData0446.coefficient29_31,
  OriginalRow227TriangleData0446.coefficient29_32,
  OriginalRow227TriangleData0446.coefficient29_33,
  OriginalRow227TriangleData0446.coefficient29_34,
  OriginalRow227TriangleData0446.coefficient29_35,
  OriginalRow227TriangleData0446.coefficient29_36,
  OriginalRow227TriangleData0446.coefficient29_37,
  OriginalRow227TriangleData0446.coefficient29_38,
  OriginalRow227TriangleData0446.coefficient29_39,
  OriginalRow227TriangleData0446.coefficient29_40,
  OriginalRow227TriangleData0446.coefficient29_41,
  OriginalRow227TriangleData0446.coefficient29_42,
  OriginalRow227TriangleData0446.coefficient29_43,
  OriginalRow227TriangleData0446.coefficient29_44,
  OriginalRow227TriangleData0446.coefficient29_45,
  OriginalRow227TriangleData0446.coefficient29_46,
  OriginalRow227TriangleData0446.coefficient29_47,
  OriginalRow227TriangleData0446.coefficient29_48,
  OriginalRow227TriangleData0446.coefficient29_49,
  OriginalRow227TriangleData0446.coefficient29_50,
  OriginalRow227TriangleData0446.coefficient29_51,
  OriginalRow227TriangleData0446.coefficient29_52,
  OriginalRow227TriangleData0446.coefficient29_53,
  OriginalRow227TriangleData0446.coefficient29_54,
  OriginalRow227TriangleData0446.coefficient29_55,
  OriginalRow227TriangleData0446.coefficient29_56,
  OriginalRow227TriangleData0446.coefficient29_57,
  OriginalRow227TriangleData0446.coefficient29_58,
  OriginalRow227TriangleData0446.coefficient29_59
]

theorem values0446_size : values0446.size = 32 := rfl

def block0446 : ℕ → Option IntervalDyadic := segment 28 values0446

theorem block0446_domain : ExactDomain block0446 28 60 := by
  simpa only [values0446_size] using segment_domain 28 values0446

theorem block0446_get (i : Fin 32) :
    block0446 (28 + i.val) = some (values0446[i.val]'(by rw [values0446_size]; exact i.isLt)) := by
  exact segment_get 28 values0446 ⟨i.val, by rw [values0446_size]; exact i.isLt⟩

def values0447 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0447.coefficient29_60,
  OriginalRow227TriangleData0447.coefficient29_61,
  OriginalRow227TriangleData0447.coefficient29_62,
  OriginalRow227TriangleData0447.coefficient29_63,
  OriginalRow227TriangleData0447.coefficient29_64,
  OriginalRow227TriangleData0447.coefficient29_65,
  OriginalRow227TriangleData0447.coefficient29_66,
  OriginalRow227TriangleData0447.coefficient29_67,
  OriginalRow227TriangleData0447.coefficient29_68,
  OriginalRow227TriangleData0447.coefficient29_69,
  OriginalRow227TriangleData0447.coefficient29_70,
  OriginalRow227TriangleData0447.coefficient29_71,
  OriginalRow227TriangleData0447.coefficient29_72,
  OriginalRow227TriangleData0447.coefficient29_73,
  OriginalRow227TriangleData0447.coefficient29_74,
  OriginalRow227TriangleData0447.coefficient29_75,
  OriginalRow227TriangleData0447.coefficient29_76,
  OriginalRow227TriangleData0447.coefficient29_77,
  OriginalRow227TriangleData0447.coefficient29_78,
  OriginalRow227TriangleData0447.coefficient29_79,
  OriginalRow227TriangleData0447.coefficient29_80,
  OriginalRow227TriangleData0447.coefficient29_81,
  OriginalRow227TriangleData0447.coefficient29_82,
  OriginalRow227TriangleData0447.coefficient29_83,
  OriginalRow227TriangleData0447.coefficient29_84,
  OriginalRow227TriangleData0447.coefficient29_85,
  OriginalRow227TriangleData0447.coefficient29_86,
  OriginalRow227TriangleData0447.coefficient29_87,
  OriginalRow227TriangleData0447.coefficient29_88,
  OriginalRow227TriangleData0447.coefficient29_89,
  OriginalRow227TriangleData0447.coefficient29_90,
  OriginalRow227TriangleData0447.coefficient29_91
]

theorem values0447_size : values0447.size = 32 := rfl

def block0447 : ℕ → Option IntervalDyadic := segment 60 values0447

theorem block0447_domain : ExactDomain block0447 60 92 := by
  simpa only [values0447_size] using segment_domain 60 values0447

theorem block0447_get (i : Fin 32) :
    block0447 (60 + i.val) = some (values0447[i.val]'(by rw [values0447_size]; exact i.isLt)) := by
  exact segment_get 60 values0447 ⟨i.val, by rw [values0447_size]; exact i.isLt⟩

def values0448 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0448.coefficient29_92,
  OriginalRow227TriangleData0448.coefficient29_93,
  OriginalRow227TriangleData0448.coefficient29_94,
  OriginalRow227TriangleData0448.coefficient29_95,
  OriginalRow227TriangleData0448.coefficient29_96,
  OriginalRow227TriangleData0448.coefficient29_97,
  OriginalRow227TriangleData0448.coefficient29_98,
  OriginalRow227TriangleData0448.coefficient29_99,
  OriginalRow227TriangleData0448.coefficient29_100,
  OriginalRow227TriangleData0448.coefficient29_101,
  OriginalRow227TriangleData0448.coefficient29_102,
  OriginalRow227TriangleData0448.coefficient29_103,
  OriginalRow227TriangleData0448.coefficient29_104,
  OriginalRow227TriangleData0448.coefficient29_105,
  OriginalRow227TriangleData0448.coefficient29_106,
  OriginalRow227TriangleData0448.coefficient29_107,
  OriginalRow227TriangleData0448.coefficient29_108,
  OriginalRow227TriangleData0448.coefficient29_109,
  OriginalRow227TriangleData0448.coefficient29_110,
  OriginalRow227TriangleData0448.coefficient29_111,
  OriginalRow227TriangleData0448.coefficient29_112,
  OriginalRow227TriangleData0448.coefficient29_113,
  OriginalRow227TriangleData0448.coefficient29_114,
  OriginalRow227TriangleData0448.coefficient29_115,
  OriginalRow227TriangleData0448.coefficient29_116,
  OriginalRow227TriangleData0448.coefficient29_117,
  OriginalRow227TriangleData0448.coefficient29_118,
  OriginalRow227TriangleData0448.coefficient29_119,
  OriginalRow227TriangleData0448.coefficient29_120,
  OriginalRow227TriangleData0448.coefficient29_121,
  OriginalRow227TriangleData0448.coefficient29_122,
  OriginalRow227TriangleData0448.coefficient29_123
]

theorem values0448_size : values0448.size = 32 := rfl

def block0448 : ℕ → Option IntervalDyadic := segment 92 values0448

theorem block0448_domain : ExactDomain block0448 92 124 := by
  simpa only [values0448_size] using segment_domain 92 values0448

theorem block0448_get (i : Fin 32) :
    block0448 (92 + i.val) = some (values0448[i.val]'(by rw [values0448_size]; exact i.isLt)) := by
  exact segment_get 92 values0448 ⟨i.val, by rw [values0448_size]; exact i.isLt⟩

def values0449 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0449.coefficient29_124,
  OriginalRow227TriangleData0449.coefficient29_125,
  OriginalRow227TriangleData0449.coefficient29_126,
  OriginalRow227TriangleData0449.coefficient29_127,
  OriginalRow227TriangleData0449.coefficient29_128,
  OriginalRow227TriangleData0449.coefficient29_129,
  OriginalRow227TriangleData0449.coefficient29_130,
  OriginalRow227TriangleData0449.coefficient29_131,
  OriginalRow227TriangleData0449.coefficient29_132,
  OriginalRow227TriangleData0449.coefficient29_133,
  OriginalRow227TriangleData0449.coefficient29_134,
  OriginalRow227TriangleData0449.coefficient29_135,
  OriginalRow227TriangleData0449.coefficient29_136,
  OriginalRow227TriangleData0449.coefficient29_137,
  OriginalRow227TriangleData0449.coefficient29_138,
  OriginalRow227TriangleData0449.coefficient29_139,
  OriginalRow227TriangleData0449.coefficient29_140,
  OriginalRow227TriangleData0449.coefficient29_141,
  OriginalRow227TriangleData0449.coefficient29_142,
  OriginalRow227TriangleData0449.coefficient29_143,
  OriginalRow227TriangleData0449.coefficient29_144,
  OriginalRow227TriangleData0449.coefficient29_145,
  OriginalRow227TriangleData0449.coefficient29_146,
  OriginalRow227TriangleData0449.coefficient29_147,
  OriginalRow227TriangleData0449.coefficient29_148,
  OriginalRow227TriangleData0449.coefficient29_149,
  OriginalRow227TriangleData0449.coefficient29_150,
  OriginalRow227TriangleData0449.coefficient29_151,
  OriginalRow227TriangleData0449.coefficient29_152,
  OriginalRow227TriangleData0449.coefficient29_153,
  OriginalRow227TriangleData0449.coefficient29_154,
  OriginalRow227TriangleData0449.coefficient29_155
]

theorem values0449_size : values0449.size = 32 := rfl

def block0449 : ℕ → Option IntervalDyadic := segment 124 values0449

theorem block0449_domain : ExactDomain block0449 124 156 := by
  simpa only [values0449_size] using segment_domain 124 values0449

theorem block0449_get (i : Fin 32) :
    block0449 (124 + i.val) = some (values0449[i.val]'(by rw [values0449_size]; exact i.isLt)) := by
  exact segment_get 124 values0449 ⟨i.val, by rw [values0449_size]; exact i.isLt⟩

def values0450 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0450.coefficient29_156,
  OriginalRow227TriangleData0450.coefficient29_157,
  OriginalRow227TriangleData0450.coefficient29_158,
  OriginalRow227TriangleData0450.coefficient29_159,
  OriginalRow227TriangleData0450.coefficient29_160,
  OriginalRow227TriangleData0450.coefficient29_161,
  OriginalRow227TriangleData0450.coefficient29_162,
  OriginalRow227TriangleData0450.coefficient29_163,
  OriginalRow227TriangleData0450.coefficient29_164,
  OriginalRow227TriangleData0450.coefficient29_165,
  OriginalRow227TriangleData0450.coefficient29_166,
  OriginalRow227TriangleData0450.coefficient29_167,
  OriginalRow227TriangleData0450.coefficient29_168,
  OriginalRow227TriangleData0450.coefficient29_169,
  OriginalRow227TriangleData0450.coefficient29_170,
  OriginalRow227TriangleData0450.coefficient29_171,
  OriginalRow227TriangleData0450.coefficient29_172,
  OriginalRow227TriangleData0450.coefficient29_173,
  OriginalRow227TriangleData0450.coefficient29_174,
  OriginalRow227TriangleData0450.coefficient29_175,
  OriginalRow227TriangleData0450.coefficient29_176,
  OriginalRow227TriangleData0450.coefficient29_177,
  OriginalRow227TriangleData0450.coefficient29_178,
  OriginalRow227TriangleData0450.coefficient29_179,
  OriginalRow227TriangleData0450.coefficient29_180,
  OriginalRow227TriangleData0450.coefficient29_181,
  OriginalRow227TriangleData0450.coefficient29_182,
  OriginalRow227TriangleData0450.coefficient29_183,
  OriginalRow227TriangleData0450.coefficient29_184,
  OriginalRow227TriangleData0450.coefficient29_185,
  OriginalRow227TriangleData0450.coefficient29_186,
  OriginalRow227TriangleData0450.coefficient29_187
]

theorem values0450_size : values0450.size = 32 := rfl

def block0450 : ℕ → Option IntervalDyadic := segment 156 values0450

theorem block0450_domain : ExactDomain block0450 156 188 := by
  simpa only [values0450_size] using segment_domain 156 values0450

theorem block0450_get (i : Fin 32) :
    block0450 (156 + i.val) = some (values0450[i.val]'(by rw [values0450_size]; exact i.isLt)) := by
  exact segment_get 156 values0450 ⟨i.val, by rw [values0450_size]; exact i.isLt⟩

def values0451 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0451.coefficient29_188,
  OriginalRow227TriangleData0451.coefficient29_189,
  OriginalRow227TriangleData0451.coefficient29_190,
  OriginalRow227TriangleData0451.coefficient29_191,
  OriginalRow227TriangleData0451.coefficient29_192,
  OriginalRow227TriangleData0451.coefficient29_193,
  OriginalRow227TriangleData0451.coefficient29_194,
  OriginalRow227TriangleData0451.coefficient29_195,
  OriginalRow227TriangleData0451.coefficient29_196,
  OriginalRow227TriangleData0451.coefficient29_197,
  OriginalRow227TriangleData0451.coefficient29_198,
  OriginalRow227TriangleData0451.coefficient29_199,
  OriginalRow227TriangleData0451.coefficient29_200,
  OriginalRow227TriangleData0451.coefficient29_201,
  OriginalRow227TriangleData0451.coefficient29_202,
  OriginalRow227TriangleData0451.coefficient29_203,
  OriginalRow227TriangleData0451.coefficient29_204,
  OriginalRow227TriangleData0451.coefficient29_205,
  OriginalRow227TriangleData0451.coefficient29_206,
  OriginalRow227TriangleData0451.coefficient29_207,
  OriginalRow227TriangleData0451.coefficient29_208,
  OriginalRow227TriangleData0451.coefficient29_209,
  OriginalRow227TriangleData0451.coefficient29_210,
  OriginalRow227TriangleData0451.coefficient29_211,
  OriginalRow227TriangleData0451.coefficient29_212,
  OriginalRow227TriangleData0451.coefficient29_213,
  OriginalRow227TriangleData0451.coefficient29_214,
  OriginalRow227TriangleData0451.coefficient29_215,
  OriginalRow227TriangleData0451.coefficient29_216,
  OriginalRow227TriangleData0451.coefficient29_217,
  OriginalRow227TriangleData0451.coefficient29_218,
  OriginalRow227TriangleData0451.coefficient29_219
]

theorem values0451_size : values0451.size = 32 := rfl

def block0451 : ℕ → Option IntervalDyadic := segment 188 values0451

theorem block0451_domain : ExactDomain block0451 188 220 := by
  simpa only [values0451_size] using segment_domain 188 values0451

theorem block0451_get (i : Fin 32) :
    block0451 (188 + i.val) = some (values0451[i.val]'(by rw [values0451_size]; exact i.isLt)) := by
  exact segment_get 188 values0451 ⟨i.val, by rw [values0451_size]; exact i.isLt⟩

def values0452 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0452.coefficient29_220,
  OriginalRow227TriangleData0452.coefficient29_221,
  OriginalRow227TriangleData0452.coefficient29_222,
  OriginalRow227TriangleData0452.coefficient29_223,
  OriginalRow227TriangleData0452.coefficient29_224,
  OriginalRow227TriangleData0452.coefficient29_225,
  OriginalRow227TriangleData0452.coefficient29_226,
  OriginalRow227TriangleData0452.coefficient29_227,
  OriginalRow227TriangleData0452.coefficient29_228,
  OriginalRow227TriangleData0452.coefficient29_229,
  OriginalRow227TriangleData0452.coefficient29_230,
  OriginalRow227TriangleData0452.coefficient29_231,
  OriginalRow227TriangleData0452.coefficient29_232,
  OriginalRow227TriangleData0452.coefficient29_233,
  OriginalRow227TriangleData0452.coefficient29_234,
  OriginalRow227TriangleData0452.coefficient29_235,
  OriginalRow227TriangleData0452.coefficient29_236,
  OriginalRow227TriangleData0452.coefficient29_237,
  OriginalRow227TriangleData0452.coefficient29_238,
  OriginalRow227TriangleData0452.coefficient29_239,
  OriginalRow227TriangleData0452.coefficient29_240,
  OriginalRow227TriangleData0452.coefficient29_241,
  OriginalRow227TriangleData0452.coefficient29_242,
  OriginalRow227TriangleData0452.coefficient29_243,
  OriginalRow227TriangleData0452.coefficient29_244,
  OriginalRow227TriangleData0452.coefficient29_245,
  OriginalRow227TriangleData0452.coefficient29_246,
  OriginalRow227TriangleData0452.coefficient29_247,
  OriginalRow227TriangleData0452.coefficient29_248,
  OriginalRow227TriangleData0452.coefficient29_249,
  OriginalRow227TriangleData0452.coefficient29_250,
  OriginalRow227TriangleData0452.coefficient29_251
]

theorem values0452_size : values0452.size = 32 := rfl

def block0452 : ℕ → Option IntervalDyadic := segment 220 values0452

theorem block0452_domain : ExactDomain block0452 220 252 := by
  simpa only [values0452_size] using segment_domain 220 values0452

theorem block0452_get (i : Fin 32) :
    block0452 (220 + i.val) = some (values0452[i.val]'(by rw [values0452_size]; exact i.isLt)) := by
  exact segment_get 220 values0452 ⟨i.val, by rw [values0452_size]; exact i.isLt⟩

def values0453 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0453.coefficient29_252,
  OriginalRow227TriangleData0453.coefficient29_253,
  OriginalRow227TriangleData0453.coefficient29_254,
  OriginalRow227TriangleData0453.coefficient29_255,
  OriginalRow227TriangleData0453.coefficient29_256,
  OriginalRow227TriangleData0453.coefficient29_257,
  OriginalRow227TriangleData0453.coefficient29_258,
  OriginalRow227TriangleData0453.coefficient29_259,
  OriginalRow227TriangleData0453.coefficient29_260,
  OriginalRow227TriangleData0453.coefficient29_261,
  OriginalRow227TriangleData0453.coefficient29_262,
  OriginalRow227TriangleData0453.coefficient29_263,
  OriginalRow227TriangleData0453.coefficient29_264,
  OriginalRow227TriangleData0453.coefficient29_265,
  OriginalRow227TriangleData0453.coefficient29_266,
  OriginalRow227TriangleData0453.coefficient29_267,
  OriginalRow227TriangleData0453.coefficient29_268,
  OriginalRow227TriangleData0453.coefficient29_269,
  OriginalRow227TriangleData0453.coefficient29_270,
  OriginalRow227TriangleData0453.coefficient29_271,
  OriginalRow227TriangleData0453.coefficient29_272,
  OriginalRow227TriangleData0453.coefficient29_273,
  OriginalRow227TriangleData0453.coefficient29_274,
  OriginalRow227TriangleData0453.coefficient29_275,
  OriginalRow227TriangleData0453.coefficient29_276,
  OriginalRow227TriangleData0453.coefficient29_277,
  OriginalRow227TriangleData0453.coefficient29_278,
  OriginalRow227TriangleData0453.coefficient29_279,
  OriginalRow227TriangleData0453.coefficient29_280,
  OriginalRow227TriangleData0453.coefficient29_281,
  OriginalRow227TriangleData0453.coefficient29_282,
  OriginalRow227TriangleData0453.coefficient29_283
]

theorem values0453_size : values0453.size = 32 := rfl

def block0453 : ℕ → Option IntervalDyadic := segment 252 values0453

theorem block0453_domain : ExactDomain block0453 252 284 := by
  simpa only [values0453_size] using segment_domain 252 values0453

theorem block0453_get (i : Fin 32) :
    block0453 (252 + i.val) = some (values0453[i.val]'(by rw [values0453_size]; exact i.isLt)) := by
  exact segment_get 252 values0453 ⟨i.val, by rw [values0453_size]; exact i.isLt⟩

def values0454 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0454.coefficient29_284,
  OriginalRow227TriangleData0454.coefficient29_285,
  OriginalRow227TriangleData0454.coefficient29_286,
  OriginalRow227TriangleData0454.coefficient29_287,
  OriginalRow227TriangleData0454.coefficient29_288,
  OriginalRow227TriangleData0454.coefficient29_289,
  OriginalRow227TriangleData0454.coefficient29_290,
  OriginalRow227TriangleData0454.coefficient29_291,
  OriginalRow227TriangleData0454.coefficient29_292,
  OriginalRow227TriangleData0454.coefficient29_293,
  OriginalRow227TriangleData0454.coefficient29_294,
  OriginalRow227TriangleData0454.coefficient29_295,
  OriginalRow227TriangleData0454.coefficient29_296,
  OriginalRow227TriangleData0454.coefficient29_297,
  OriginalRow227TriangleData0454.coefficient29_298,
  OriginalRow227TriangleData0454.coefficient29_299,
  OriginalRow227TriangleData0454.coefficient29_300,
  OriginalRow227TriangleData0454.coefficient29_301,
  OriginalRow227TriangleData0454.coefficient29_302,
  OriginalRow227TriangleData0454.coefficient29_303,
  OriginalRow227TriangleData0454.coefficient29_304,
  OriginalRow227TriangleData0454.coefficient29_305,
  OriginalRow227TriangleData0454.coefficient29_306,
  OriginalRow227TriangleData0454.coefficient29_307,
  OriginalRow227TriangleData0454.coefficient29_308,
  OriginalRow227TriangleData0454.coefficient29_309,
  OriginalRow227TriangleData0454.coefficient29_310,
  OriginalRow227TriangleData0454.coefficient29_311,
  OriginalRow227TriangleData0454.coefficient29_312,
  OriginalRow227TriangleData0454.coefficient29_313,
  OriginalRow227TriangleData0454.coefficient29_314,
  OriginalRow227TriangleData0454.coefficient29_315
]

theorem values0454_size : values0454.size = 32 := rfl

def block0454 : ℕ → Option IntervalDyadic := segment 284 values0454

theorem block0454_domain : ExactDomain block0454 284 316 := by
  simpa only [values0454_size] using segment_domain 284 values0454

theorem block0454_get (i : Fin 32) :
    block0454 (284 + i.val) = some (values0454[i.val]'(by rw [values0454_size]; exact i.isLt)) := by
  exact segment_get 284 values0454 ⟨i.val, by rw [values0454_size]; exact i.isLt⟩

def values0455 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0455.coefficient29_316,
  OriginalRow227TriangleData0455.coefficient29_317,
  OriginalRow227TriangleData0455.coefficient29_318,
  OriginalRow227TriangleData0455.coefficient29_319,
  OriginalRow227TriangleData0455.coefficient29_320,
  OriginalRow227TriangleData0455.coefficient29_321,
  OriginalRow227TriangleData0455.coefficient29_322,
  OriginalRow227TriangleData0455.coefficient29_323,
  OriginalRow227TriangleData0455.coefficient29_324,
  OriginalRow227TriangleData0455.coefficient29_325,
  OriginalRow227TriangleData0455.coefficient29_326,
  OriginalRow227TriangleData0455.coefficient29_327,
  OriginalRow227TriangleData0455.coefficient29_328,
  OriginalRow227TriangleData0455.coefficient29_329,
  OriginalRow227TriangleData0455.coefficient29_330,
  OriginalRow227TriangleData0455.coefficient29_331,
  OriginalRow227TriangleData0455.coefficient29_332,
  OriginalRow227TriangleData0455.coefficient29_333,
  OriginalRow227TriangleData0455.coefficient29_334,
  OriginalRow227TriangleData0455.coefficient29_335,
  OriginalRow227TriangleData0455.coefficient29_336,
  OriginalRow227TriangleData0455.coefficient29_337,
  OriginalRow227TriangleData0455.coefficient29_338,
  OriginalRow227TriangleData0455.coefficient29_339,
  OriginalRow227TriangleData0455.coefficient29_340,
  OriginalRow227TriangleData0455.coefficient29_341,
  OriginalRow227TriangleData0455.coefficient29_342,
  OriginalRow227TriangleData0455.coefficient29_343,
  OriginalRow227TriangleData0455.coefficient29_344,
  OriginalRow227TriangleData0455.coefficient29_345,
  OriginalRow227TriangleData0455.coefficient29_346,
  OriginalRow227TriangleData0455.coefficient29_347
]

theorem values0455_size : values0455.size = 32 := rfl

def block0455 : ℕ → Option IntervalDyadic := segment 316 values0455

theorem block0455_domain : ExactDomain block0455 316 348 := by
  simpa only [values0455_size] using segment_domain 316 values0455

theorem block0455_get (i : Fin 32) :
    block0455 (316 + i.val) = some (values0455[i.val]'(by rw [values0455_size]; exact i.isLt)) := by
  exact segment_get 316 values0455 ⟨i.val, by rw [values0455_size]; exact i.isLt⟩

def values0456 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0456.coefficient29_348,
  OriginalRow227TriangleData0456.coefficient29_349,
  OriginalRow227TriangleData0456.coefficient29_350,
  OriginalRow227TriangleData0456.coefficient29_351,
  OriginalRow227TriangleData0456.coefficient29_352,
  OriginalRow227TriangleData0456.coefficient29_353,
  OriginalRow227TriangleData0456.coefficient29_354,
  OriginalRow227TriangleData0456.coefficient29_355,
  OriginalRow227TriangleData0456.coefficient29_356,
  OriginalRow227TriangleData0456.coefficient29_357,
  OriginalRow227TriangleData0456.coefficient29_358,
  OriginalRow227TriangleData0456.coefficient29_359,
  OriginalRow227TriangleData0456.coefficient29_360,
  OriginalRow227TriangleData0456.coefficient29_361,
  OriginalRow227TriangleData0456.coefficient29_362,
  OriginalRow227TriangleData0456.coefficient29_363,
  OriginalRow227TriangleData0456.coefficient29_364,
  OriginalRow227TriangleData0456.coefficient29_365,
  OriginalRow227TriangleData0456.coefficient29_366,
  OriginalRow227TriangleData0456.coefficient29_367,
  OriginalRow227TriangleData0456.coefficient29_368,
  OriginalRow227TriangleData0456.coefficient29_369,
  OriginalRow227TriangleData0456.coefficient29_370,
  OriginalRow227TriangleData0456.coefficient29_371,
  OriginalRow227TriangleData0456.coefficient29_372,
  OriginalRow227TriangleData0456.coefficient29_373,
  OriginalRow227TriangleData0456.coefficient29_374,
  OriginalRow227TriangleData0456.coefficient29_375,
  OriginalRow227TriangleData0456.coefficient29_376,
  OriginalRow227TriangleData0456.coefficient29_377,
  OriginalRow227TriangleData0456.coefficient29_378,
  OriginalRow227TriangleData0456.coefficient29_379
]

theorem values0456_size : values0456.size = 32 := rfl

def block0456 : ℕ → Option IntervalDyadic := segment 348 values0456

theorem block0456_domain : ExactDomain block0456 348 380 := by
  simpa only [values0456_size] using segment_domain 348 values0456

theorem block0456_get (i : Fin 32) :
    block0456 (348 + i.val) = some (values0456[i.val]'(by rw [values0456_size]; exact i.isLt)) := by
  exact segment_get 348 values0456 ⟨i.val, by rw [values0456_size]; exact i.isLt⟩

def values0457 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0457.coefficient29_380,
  OriginalRow227TriangleData0457.coefficient29_381,
  OriginalRow227TriangleData0457.coefficient29_382,
  OriginalRow227TriangleData0457.coefficient29_383,
  OriginalRow227TriangleData0457.coefficient29_384,
  OriginalRow227TriangleData0457.coefficient29_385,
  OriginalRow227TriangleData0457.coefficient29_386,
  OriginalRow227TriangleData0457.coefficient29_387,
  OriginalRow227TriangleData0457.coefficient29_388,
  OriginalRow227TriangleData0457.coefficient29_389,
  OriginalRow227TriangleData0457.coefficient29_390,
  OriginalRow227TriangleData0457.coefficient29_391,
  OriginalRow227TriangleData0457.coefficient29_392,
  OriginalRow227TriangleData0457.coefficient29_393,
  OriginalRow227TriangleData0457.coefficient29_394,
  OriginalRow227TriangleData0457.coefficient29_395,
  OriginalRow227TriangleData0457.coefficient29_396,
  OriginalRow227TriangleData0457.coefficient29_397,
  OriginalRow227TriangleData0457.coefficient29_398,
  OriginalRow227TriangleData0457.coefficient29_399,
  OriginalRow227TriangleData0457.coefficient29_400,
  OriginalRow227TriangleData0457.coefficient29_401,
  OriginalRow227TriangleData0457.coefficient29_402,
  OriginalRow227TriangleData0457.coefficient29_403,
  OriginalRow227TriangleData0457.coefficient29_404,
  OriginalRow227TriangleData0457.coefficient29_405,
  OriginalRow227TriangleData0457.coefficient29_406,
  OriginalRow227TriangleData0457.coefficient29_407,
  OriginalRow227TriangleData0457.coefficient29_408,
  OriginalRow227TriangleData0457.coefficient29_409,
  OriginalRow227TriangleData0457.coefficient29_410,
  OriginalRow227TriangleData0457.coefficient29_411
]

theorem values0457_size : values0457.size = 32 := rfl

def block0457 : ℕ → Option IntervalDyadic := segment 380 values0457

theorem block0457_domain : ExactDomain block0457 380 412 := by
  simpa only [values0457_size] using segment_domain 380 values0457

theorem block0457_get (i : Fin 32) :
    block0457 (380 + i.val) = some (values0457[i.val]'(by rw [values0457_size]; exact i.isLt)) := by
  exact segment_get 380 values0457 ⟨i.val, by rw [values0457_size]; exact i.isLt⟩

def values0458 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0458.coefficient29_412,
  OriginalRow227TriangleData0458.coefficient29_413,
  OriginalRow227TriangleData0458.coefficient29_414,
  OriginalRow227TriangleData0458.coefficient29_415,
  OriginalRow227TriangleData0458.coefficient29_416,
  OriginalRow227TriangleData0458.coefficient29_417,
  OriginalRow227TriangleData0458.coefficient29_418,
  OriginalRow227TriangleData0458.coefficient29_419,
  OriginalRow227TriangleData0458.coefficient29_420,
  OriginalRow227TriangleData0458.coefficient29_421,
  OriginalRow227TriangleData0458.coefficient29_422,
  OriginalRow227TriangleData0458.coefficient29_423,
  OriginalRow227TriangleData0458.coefficient29_424,
  OriginalRow227TriangleData0458.coefficient29_425,
  OriginalRow227TriangleData0458.coefficient29_426,
  OriginalRow227TriangleData0458.coefficient29_427,
  OriginalRow227TriangleData0458.coefficient29_428,
  OriginalRow227TriangleData0458.coefficient29_429,
  OriginalRow227TriangleData0458.coefficient29_430,
  OriginalRow227TriangleData0458.coefficient29_431,
  OriginalRow227TriangleData0458.coefficient29_432,
  OriginalRow227TriangleData0458.coefficient29_433,
  OriginalRow227TriangleData0458.coefficient29_434,
  OriginalRow227TriangleData0458.coefficient29_435,
  OriginalRow227TriangleData0458.coefficient29_436,
  OriginalRow227TriangleData0458.coefficient29_437,
  OriginalRow227TriangleData0458.coefficient29_438,
  OriginalRow227TriangleData0458.coefficient29_439,
  OriginalRow227TriangleData0458.coefficient29_440,
  OriginalRow227TriangleData0458.coefficient29_441,
  OriginalRow227TriangleData0458.coefficient29_442,
  OriginalRow227TriangleData0458.coefficient29_443
]

theorem values0458_size : values0458.size = 32 := rfl

def block0458 : ℕ → Option IntervalDyadic := segment 412 values0458

theorem block0458_domain : ExactDomain block0458 412 444 := by
  simpa only [values0458_size] using segment_domain 412 values0458

theorem block0458_get (i : Fin 32) :
    block0458 (412 + i.val) = some (values0458[i.val]'(by rw [values0458_size]; exact i.isLt)) := by
  exact segment_get 412 values0458 ⟨i.val, by rw [values0458_size]; exact i.isLt⟩

def values0459 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0459.coefficient29_444,
  OriginalRow227TriangleData0459.coefficient29_445,
  OriginalRow227TriangleData0459.coefficient29_446,
  OriginalRow227TriangleData0459.coefficient29_447,
  OriginalRow227TriangleData0459.coefficient29_448,
  OriginalRow227TriangleData0459.coefficient29_449,
  OriginalRow227TriangleData0459.coefficient29_450,
  OriginalRow227TriangleData0459.coefficient29_451,
  OriginalRow227TriangleData0459.coefficient29_452,
  OriginalRow227TriangleData0459.coefficient29_453,
  OriginalRow227TriangleData0459.coefficient29_454,
  OriginalRow227TriangleData0459.coefficient29_455,
  OriginalRow227TriangleData0459.coefficient29_456,
  OriginalRow227TriangleData0459.coefficient29_457,
  OriginalRow227TriangleData0459.coefficient29_458,
  OriginalRow227TriangleData0459.coefficient29_459,
  OriginalRow227TriangleData0459.coefficient29_460,
  OriginalRow227TriangleData0459.coefficient29_461,
  OriginalRow227TriangleData0459.coefficient29_462,
  OriginalRow227TriangleData0459.coefficient29_463,
  OriginalRow227TriangleData0459.coefficient29_464,
  OriginalRow227TriangleData0459.coefficient29_465,
  OriginalRow227TriangleData0459.coefficient29_466,
  OriginalRow227TriangleData0459.coefficient29_467,
  OriginalRow227TriangleData0459.coefficient29_468,
  OriginalRow227TriangleData0459.coefficient29_469,
  OriginalRow227TriangleData0459.coefficient29_470,
  OriginalRow227TriangleData0459.coefficient29_471,
  OriginalRow227TriangleData0459.coefficient29_472
]

theorem values0459_size : values0459.size = 29 := rfl

def block0459 : ℕ → Option IntervalDyadic := segment 444 values0459

theorem block0459_domain : ExactDomain block0459 444 473 := by
  simpa only [values0459_size] using segment_domain 444 values0459

theorem block0459_get (i : Fin 29) :
    block0459 (444 + i.val) = some (values0459[i.val]'(by rw [values0459_size]; exact i.isLt)) := by
  exact segment_get 444 values0459 ⟨i.val, by rw [values0459_size]; exact i.isLt⟩

def node0060_0124 : ℕ → Option IntervalDyadic := split 92 block0447 block0448

theorem node0060_0124_domain : ExactDomain node0060_0124 60 124 := by
  exact split_domain (by decide) (by decide) block0447_domain block0448_domain

def node0028_0124 : ℕ → Option IntervalDyadic := split 60 block0446 node0060_0124

theorem node0028_0124_domain : ExactDomain node0028_0124 28 124 := by
  exact split_domain (by decide) (by decide) block0446_domain node0060_0124_domain

def node0124_0188 : ℕ → Option IntervalDyadic := split 156 block0449 block0450

theorem node0124_0188_domain : ExactDomain node0124_0188 124 188 := by
  exact split_domain (by decide) (by decide) block0449_domain block0450_domain

def node0188_0252 : ℕ → Option IntervalDyadic := split 220 block0451 block0452

theorem node0188_0252_domain : ExactDomain node0188_0252 188 252 := by
  exact split_domain (by decide) (by decide) block0451_domain block0452_domain

def node0124_0252 : ℕ → Option IntervalDyadic := split 188 node0124_0188 node0188_0252

theorem node0124_0252_domain : ExactDomain node0124_0252 124 252 := by
  exact split_domain (by decide) (by decide) node0124_0188_domain node0188_0252_domain

def node0028_0252 : ℕ → Option IntervalDyadic := split 124 node0028_0124 node0124_0252

theorem node0028_0252_domain : ExactDomain node0028_0252 28 252 := by
  exact split_domain (by decide) (by decide) node0028_0124_domain node0124_0252_domain

def node0284_0348 : ℕ → Option IntervalDyadic := split 316 block0454 block0455

theorem node0284_0348_domain : ExactDomain node0284_0348 284 348 := by
  exact split_domain (by decide) (by decide) block0454_domain block0455_domain

def node0252_0348 : ℕ → Option IntervalDyadic := split 284 block0453 node0284_0348

theorem node0252_0348_domain : ExactDomain node0252_0348 252 348 := by
  exact split_domain (by decide) (by decide) block0453_domain node0284_0348_domain

def node0348_0412 : ℕ → Option IntervalDyadic := split 380 block0456 block0457

theorem node0348_0412_domain : ExactDomain node0348_0412 348 412 := by
  exact split_domain (by decide) (by decide) block0456_domain block0457_domain

def node0412_0473 : ℕ → Option IntervalDyadic := split 444 block0458 block0459

theorem node0412_0473_domain : ExactDomain node0412_0473 412 473 := by
  exact split_domain (by decide) (by decide) block0458_domain block0459_domain

def node0348_0473 : ℕ → Option IntervalDyadic := split 412 node0348_0412 node0412_0473

theorem node0348_0473_domain : ExactDomain node0348_0473 348 473 := by
  exact split_domain (by decide) (by decide) node0348_0412_domain node0412_0473_domain

def node0252_0473 : ℕ → Option IntervalDyadic := split 348 node0252_0348 node0348_0473

theorem node0252_0473_domain : ExactDomain node0252_0473 252 473 := by
  exact split_domain (by decide) (by decide) node0252_0348_domain node0348_0473_domain

def node0028_0473 : ℕ → Option IntervalDyadic := split 252 node0028_0252 node0252_0473

theorem node0028_0473_domain : ExactDomain node0028_0473 28 473 := by
  exact split_domain (by decide) (by decide) node0028_0252_domain node0252_0473_domain

def lookup : ℕ → Option IntervalDyadic := node0028_0473

theorem lookup_domain : ExactDomain lookup 28 473 :=
  node0028_0473_domain

theorem block0446_lookup (i : Fin 32) :
    lookup (28 + i.val) = some (values0446[i.val]'(by rw [values0446_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (28 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_left 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0028_0124, split_left 60 block0446 node0060_0124 (by omega)]
  exact block0446_get i

theorem block0447_lookup (i : Fin 32) :
    lookup (60 + i.val) = some (values0447[i.val]'(by rw [values0447_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (60 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_left 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0028_0124, split_right 60 block0446 node0060_0124 (by omega)]
  rw [node0060_0124, split_left 92 block0447 block0448 (by omega)]
  exact block0447_get i

theorem block0448_lookup (i : Fin 32) :
    lookup (92 + i.val) = some (values0448[i.val]'(by rw [values0448_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (92 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_left 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0028_0124, split_right 60 block0446 node0060_0124 (by omega)]
  rw [node0060_0124, split_right 92 block0447 block0448 (by omega)]
  exact block0448_get i

theorem block0449_lookup (i : Fin 32) :
    lookup (124 + i.val) = some (values0449[i.val]'(by rw [values0449_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (124 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_right 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0124_0252, split_left 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0124_0188, split_left 156 block0449 block0450 (by omega)]
  exact block0449_get i

theorem block0450_lookup (i : Fin 32) :
    lookup (156 + i.val) = some (values0450[i.val]'(by rw [values0450_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (156 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_right 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0124_0252, split_left 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0124_0188, split_right 156 block0449 block0450 (by omega)]
  exact block0450_get i

theorem block0451_lookup (i : Fin 32) :
    lookup (188 + i.val) = some (values0451[i.val]'(by rw [values0451_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (188 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_right 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0124_0252, split_right 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0188_0252, split_left 220 block0451 block0452 (by omega)]
  exact block0451_get i

theorem block0452_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values0452[i.val]'(by rw [values0452_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (220 + i.val) = _
  rw [node0028_0473, split_left 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0028_0252, split_right 124 node0028_0124 node0124_0252 (by omega)]
  rw [node0124_0252, split_right 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0188_0252, split_right 220 block0451 block0452 (by omega)]
  exact block0452_get i

theorem block0453_lookup (i : Fin 32) :
    lookup (252 + i.val) = some (values0453[i.val]'(by rw [values0453_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (252 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_left 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0252_0348, split_left 284 block0453 node0284_0348 (by omega)]
  exact block0453_get i

theorem block0454_lookup (i : Fin 32) :
    lookup (284 + i.val) = some (values0454[i.val]'(by rw [values0454_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (284 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_left 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0252_0348, split_right 284 block0453 node0284_0348 (by omega)]
  rw [node0284_0348, split_left 316 block0454 block0455 (by omega)]
  exact block0454_get i

theorem block0455_lookup (i : Fin 32) :
    lookup (316 + i.val) = some (values0455[i.val]'(by rw [values0455_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (316 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_left 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0252_0348, split_right 284 block0453 node0284_0348 (by omega)]
  rw [node0284_0348, split_right 316 block0454 block0455 (by omega)]
  exact block0455_get i

theorem block0456_lookup (i : Fin 32) :
    lookup (348 + i.val) = some (values0456[i.val]'(by rw [values0456_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (348 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_right 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0348_0473, split_left 412 node0348_0412 node0412_0473 (by omega)]
  rw [node0348_0412, split_left 380 block0456 block0457 (by omega)]
  exact block0456_get i

theorem block0457_lookup (i : Fin 32) :
    lookup (380 + i.val) = some (values0457[i.val]'(by rw [values0457_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (380 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_right 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0348_0473, split_left 412 node0348_0412 node0412_0473 (by omega)]
  rw [node0348_0412, split_right 380 block0456 block0457 (by omega)]
  exact block0457_get i

theorem block0458_lookup (i : Fin 32) :
    lookup (412 + i.val) = some (values0458[i.val]'(by rw [values0458_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (412 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_right 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0348_0473, split_right 412 node0348_0412 node0412_0473 (by omega)]
  rw [node0412_0473, split_left 444 block0458 block0459 (by omega)]
  exact block0458_get i

theorem block0459_lookup (i : Fin 29) :
    lookup (444 + i.val) = some (values0459[i.val]'(by rw [values0459_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0028_0473 (444 + i.val) = _
  rw [node0028_0473, split_right 252 node0028_0252 node0252_0473 (by omega)]
  rw [node0252_0473, split_right 348 node0252_0348 node0348_0473 (by omega)]
  rw [node0348_0473, split_right 412 node0348_0412 node0412_0473 (by omega)]
  rw [node0412_0473, split_right 444 block0458 block0459 (by omega)]
  exact block0459_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0446_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0446_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0447_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0447_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0448_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0448_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0449_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0449_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0450_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0450_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0451_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0451_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0452_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0452_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0453_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0453_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0454_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0454_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0455_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0455_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0456_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0456_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0457_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0457_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0458_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0458_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0459_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0459_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0446_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0447_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0448_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0449_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0450_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0451_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0452_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0453_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0454_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0455_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0456_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0457_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0458_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow029.block0459_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow029
