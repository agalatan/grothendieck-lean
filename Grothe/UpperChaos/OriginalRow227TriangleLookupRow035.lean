import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0530
import Grothe.UpperChaos.OriginalRow227TriangleData0531
import Grothe.UpperChaos.OriginalRow227TriangleData0532
import Grothe.UpperChaos.OriginalRow227TriangleData0533
import Grothe.UpperChaos.OriginalRow227TriangleData0534
import Grothe.UpperChaos.OriginalRow227TriangleData0535
import Grothe.UpperChaos.OriginalRow227TriangleData0536
import Grothe.UpperChaos.OriginalRow227TriangleData0537
import Grothe.UpperChaos.OriginalRow227TriangleData0538
import Grothe.UpperChaos.OriginalRow227TriangleData0539
import Grothe.UpperChaos.OriginalRow227TriangleData0540
import Grothe.UpperChaos.OriginalRow227TriangleData0541
import Grothe.UpperChaos.OriginalRow227TriangleData0542
import Grothe.UpperChaos.OriginalRow227TriangleData0543

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow035

open ConditionalTableLookup

def values0530 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0530.coefficient35_34,
  OriginalRow227TriangleData0530.coefficient35_35,
  OriginalRow227TriangleData0530.coefficient35_36,
  OriginalRow227TriangleData0530.coefficient35_37,
  OriginalRow227TriangleData0530.coefficient35_38,
  OriginalRow227TriangleData0530.coefficient35_39,
  OriginalRow227TriangleData0530.coefficient35_40,
  OriginalRow227TriangleData0530.coefficient35_41,
  OriginalRow227TriangleData0530.coefficient35_42,
  OriginalRow227TriangleData0530.coefficient35_43,
  OriginalRow227TriangleData0530.coefficient35_44,
  OriginalRow227TriangleData0530.coefficient35_45,
  OriginalRow227TriangleData0530.coefficient35_46,
  OriginalRow227TriangleData0530.coefficient35_47,
  OriginalRow227TriangleData0530.coefficient35_48,
  OriginalRow227TriangleData0530.coefficient35_49,
  OriginalRow227TriangleData0530.coefficient35_50,
  OriginalRow227TriangleData0530.coefficient35_51,
  OriginalRow227TriangleData0530.coefficient35_52,
  OriginalRow227TriangleData0530.coefficient35_53,
  OriginalRow227TriangleData0530.coefficient35_54,
  OriginalRow227TriangleData0530.coefficient35_55,
  OriginalRow227TriangleData0530.coefficient35_56,
  OriginalRow227TriangleData0530.coefficient35_57,
  OriginalRow227TriangleData0530.coefficient35_58,
  OriginalRow227TriangleData0530.coefficient35_59,
  OriginalRow227TriangleData0530.coefficient35_60,
  OriginalRow227TriangleData0530.coefficient35_61,
  OriginalRow227TriangleData0530.coefficient35_62,
  OriginalRow227TriangleData0530.coefficient35_63,
  OriginalRow227TriangleData0530.coefficient35_64,
  OriginalRow227TriangleData0530.coefficient35_65
]

theorem values0530_size : values0530.size = 32 := rfl

def block0530 : ℕ → Option IntervalDyadic := segment 34 values0530

theorem block0530_domain : ExactDomain block0530 34 66 := by
  simpa only [values0530_size] using segment_domain 34 values0530

theorem block0530_get (i : Fin 32) :
    block0530 (34 + i.val) = some (values0530[i.val]'(by rw [values0530_size]; exact i.isLt)) := by
  exact segment_get 34 values0530 ⟨i.val, by rw [values0530_size]; exact i.isLt⟩

def values0531 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0531.coefficient35_66,
  OriginalRow227TriangleData0531.coefficient35_67,
  OriginalRow227TriangleData0531.coefficient35_68,
  OriginalRow227TriangleData0531.coefficient35_69,
  OriginalRow227TriangleData0531.coefficient35_70,
  OriginalRow227TriangleData0531.coefficient35_71,
  OriginalRow227TriangleData0531.coefficient35_72,
  OriginalRow227TriangleData0531.coefficient35_73,
  OriginalRow227TriangleData0531.coefficient35_74,
  OriginalRow227TriangleData0531.coefficient35_75,
  OriginalRow227TriangleData0531.coefficient35_76,
  OriginalRow227TriangleData0531.coefficient35_77,
  OriginalRow227TriangleData0531.coefficient35_78,
  OriginalRow227TriangleData0531.coefficient35_79,
  OriginalRow227TriangleData0531.coefficient35_80,
  OriginalRow227TriangleData0531.coefficient35_81,
  OriginalRow227TriangleData0531.coefficient35_82,
  OriginalRow227TriangleData0531.coefficient35_83,
  OriginalRow227TriangleData0531.coefficient35_84,
  OriginalRow227TriangleData0531.coefficient35_85,
  OriginalRow227TriangleData0531.coefficient35_86,
  OriginalRow227TriangleData0531.coefficient35_87,
  OriginalRow227TriangleData0531.coefficient35_88,
  OriginalRow227TriangleData0531.coefficient35_89,
  OriginalRow227TriangleData0531.coefficient35_90,
  OriginalRow227TriangleData0531.coefficient35_91,
  OriginalRow227TriangleData0531.coefficient35_92,
  OriginalRow227TriangleData0531.coefficient35_93,
  OriginalRow227TriangleData0531.coefficient35_94,
  OriginalRow227TriangleData0531.coefficient35_95,
  OriginalRow227TriangleData0531.coefficient35_96,
  OriginalRow227TriangleData0531.coefficient35_97
]

theorem values0531_size : values0531.size = 32 := rfl

def block0531 : ℕ → Option IntervalDyadic := segment 66 values0531

theorem block0531_domain : ExactDomain block0531 66 98 := by
  simpa only [values0531_size] using segment_domain 66 values0531

theorem block0531_get (i : Fin 32) :
    block0531 (66 + i.val) = some (values0531[i.val]'(by rw [values0531_size]; exact i.isLt)) := by
  exact segment_get 66 values0531 ⟨i.val, by rw [values0531_size]; exact i.isLt⟩

def values0532 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0532.coefficient35_98,
  OriginalRow227TriangleData0532.coefficient35_99,
  OriginalRow227TriangleData0532.coefficient35_100,
  OriginalRow227TriangleData0532.coefficient35_101,
  OriginalRow227TriangleData0532.coefficient35_102,
  OriginalRow227TriangleData0532.coefficient35_103,
  OriginalRow227TriangleData0532.coefficient35_104,
  OriginalRow227TriangleData0532.coefficient35_105,
  OriginalRow227TriangleData0532.coefficient35_106,
  OriginalRow227TriangleData0532.coefficient35_107,
  OriginalRow227TriangleData0532.coefficient35_108,
  OriginalRow227TriangleData0532.coefficient35_109,
  OriginalRow227TriangleData0532.coefficient35_110,
  OriginalRow227TriangleData0532.coefficient35_111,
  OriginalRow227TriangleData0532.coefficient35_112,
  OriginalRow227TriangleData0532.coefficient35_113,
  OriginalRow227TriangleData0532.coefficient35_114,
  OriginalRow227TriangleData0532.coefficient35_115,
  OriginalRow227TriangleData0532.coefficient35_116,
  OriginalRow227TriangleData0532.coefficient35_117,
  OriginalRow227TriangleData0532.coefficient35_118,
  OriginalRow227TriangleData0532.coefficient35_119,
  OriginalRow227TriangleData0532.coefficient35_120,
  OriginalRow227TriangleData0532.coefficient35_121,
  OriginalRow227TriangleData0532.coefficient35_122,
  OriginalRow227TriangleData0532.coefficient35_123,
  OriginalRow227TriangleData0532.coefficient35_124,
  OriginalRow227TriangleData0532.coefficient35_125,
  OriginalRow227TriangleData0532.coefficient35_126,
  OriginalRow227TriangleData0532.coefficient35_127,
  OriginalRow227TriangleData0532.coefficient35_128,
  OriginalRow227TriangleData0532.coefficient35_129
]

theorem values0532_size : values0532.size = 32 := rfl

def block0532 : ℕ → Option IntervalDyadic := segment 98 values0532

theorem block0532_domain : ExactDomain block0532 98 130 := by
  simpa only [values0532_size] using segment_domain 98 values0532

theorem block0532_get (i : Fin 32) :
    block0532 (98 + i.val) = some (values0532[i.val]'(by rw [values0532_size]; exact i.isLt)) := by
  exact segment_get 98 values0532 ⟨i.val, by rw [values0532_size]; exact i.isLt⟩

def values0533 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0533.coefficient35_130,
  OriginalRow227TriangleData0533.coefficient35_131,
  OriginalRow227TriangleData0533.coefficient35_132,
  OriginalRow227TriangleData0533.coefficient35_133,
  OriginalRow227TriangleData0533.coefficient35_134,
  OriginalRow227TriangleData0533.coefficient35_135,
  OriginalRow227TriangleData0533.coefficient35_136,
  OriginalRow227TriangleData0533.coefficient35_137,
  OriginalRow227TriangleData0533.coefficient35_138,
  OriginalRow227TriangleData0533.coefficient35_139,
  OriginalRow227TriangleData0533.coefficient35_140,
  OriginalRow227TriangleData0533.coefficient35_141,
  OriginalRow227TriangleData0533.coefficient35_142,
  OriginalRow227TriangleData0533.coefficient35_143,
  OriginalRow227TriangleData0533.coefficient35_144,
  OriginalRow227TriangleData0533.coefficient35_145,
  OriginalRow227TriangleData0533.coefficient35_146,
  OriginalRow227TriangleData0533.coefficient35_147,
  OriginalRow227TriangleData0533.coefficient35_148,
  OriginalRow227TriangleData0533.coefficient35_149,
  OriginalRow227TriangleData0533.coefficient35_150,
  OriginalRow227TriangleData0533.coefficient35_151,
  OriginalRow227TriangleData0533.coefficient35_152,
  OriginalRow227TriangleData0533.coefficient35_153,
  OriginalRow227TriangleData0533.coefficient35_154,
  OriginalRow227TriangleData0533.coefficient35_155,
  OriginalRow227TriangleData0533.coefficient35_156,
  OriginalRow227TriangleData0533.coefficient35_157,
  OriginalRow227TriangleData0533.coefficient35_158,
  OriginalRow227TriangleData0533.coefficient35_159,
  OriginalRow227TriangleData0533.coefficient35_160,
  OriginalRow227TriangleData0533.coefficient35_161
]

theorem values0533_size : values0533.size = 32 := rfl

def block0533 : ℕ → Option IntervalDyadic := segment 130 values0533

theorem block0533_domain : ExactDomain block0533 130 162 := by
  simpa only [values0533_size] using segment_domain 130 values0533

theorem block0533_get (i : Fin 32) :
    block0533 (130 + i.val) = some (values0533[i.val]'(by rw [values0533_size]; exact i.isLt)) := by
  exact segment_get 130 values0533 ⟨i.val, by rw [values0533_size]; exact i.isLt⟩

def values0534 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0534.coefficient35_162,
  OriginalRow227TriangleData0534.coefficient35_163,
  OriginalRow227TriangleData0534.coefficient35_164,
  OriginalRow227TriangleData0534.coefficient35_165,
  OriginalRow227TriangleData0534.coefficient35_166,
  OriginalRow227TriangleData0534.coefficient35_167,
  OriginalRow227TriangleData0534.coefficient35_168,
  OriginalRow227TriangleData0534.coefficient35_169,
  OriginalRow227TriangleData0534.coefficient35_170,
  OriginalRow227TriangleData0534.coefficient35_171,
  OriginalRow227TriangleData0534.coefficient35_172,
  OriginalRow227TriangleData0534.coefficient35_173,
  OriginalRow227TriangleData0534.coefficient35_174,
  OriginalRow227TriangleData0534.coefficient35_175,
  OriginalRow227TriangleData0534.coefficient35_176,
  OriginalRow227TriangleData0534.coefficient35_177,
  OriginalRow227TriangleData0534.coefficient35_178,
  OriginalRow227TriangleData0534.coefficient35_179,
  OriginalRow227TriangleData0534.coefficient35_180,
  OriginalRow227TriangleData0534.coefficient35_181,
  OriginalRow227TriangleData0534.coefficient35_182,
  OriginalRow227TriangleData0534.coefficient35_183,
  OriginalRow227TriangleData0534.coefficient35_184,
  OriginalRow227TriangleData0534.coefficient35_185,
  OriginalRow227TriangleData0534.coefficient35_186,
  OriginalRow227TriangleData0534.coefficient35_187,
  OriginalRow227TriangleData0534.coefficient35_188,
  OriginalRow227TriangleData0534.coefficient35_189,
  OriginalRow227TriangleData0534.coefficient35_190,
  OriginalRow227TriangleData0534.coefficient35_191,
  OriginalRow227TriangleData0534.coefficient35_192,
  OriginalRow227TriangleData0534.coefficient35_193
]

theorem values0534_size : values0534.size = 32 := rfl

def block0534 : ℕ → Option IntervalDyadic := segment 162 values0534

theorem block0534_domain : ExactDomain block0534 162 194 := by
  simpa only [values0534_size] using segment_domain 162 values0534

theorem block0534_get (i : Fin 32) :
    block0534 (162 + i.val) = some (values0534[i.val]'(by rw [values0534_size]; exact i.isLt)) := by
  exact segment_get 162 values0534 ⟨i.val, by rw [values0534_size]; exact i.isLt⟩

def values0535 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0535.coefficient35_194,
  OriginalRow227TriangleData0535.coefficient35_195,
  OriginalRow227TriangleData0535.coefficient35_196,
  OriginalRow227TriangleData0535.coefficient35_197,
  OriginalRow227TriangleData0535.coefficient35_198,
  OriginalRow227TriangleData0535.coefficient35_199,
  OriginalRow227TriangleData0535.coefficient35_200,
  OriginalRow227TriangleData0535.coefficient35_201,
  OriginalRow227TriangleData0535.coefficient35_202,
  OriginalRow227TriangleData0535.coefficient35_203,
  OriginalRow227TriangleData0535.coefficient35_204,
  OriginalRow227TriangleData0535.coefficient35_205,
  OriginalRow227TriangleData0535.coefficient35_206,
  OriginalRow227TriangleData0535.coefficient35_207,
  OriginalRow227TriangleData0535.coefficient35_208,
  OriginalRow227TriangleData0535.coefficient35_209,
  OriginalRow227TriangleData0535.coefficient35_210,
  OriginalRow227TriangleData0535.coefficient35_211,
  OriginalRow227TriangleData0535.coefficient35_212,
  OriginalRow227TriangleData0535.coefficient35_213,
  OriginalRow227TriangleData0535.coefficient35_214,
  OriginalRow227TriangleData0535.coefficient35_215,
  OriginalRow227TriangleData0535.coefficient35_216,
  OriginalRow227TriangleData0535.coefficient35_217,
  OriginalRow227TriangleData0535.coefficient35_218,
  OriginalRow227TriangleData0535.coefficient35_219,
  OriginalRow227TriangleData0535.coefficient35_220,
  OriginalRow227TriangleData0535.coefficient35_221,
  OriginalRow227TriangleData0535.coefficient35_222,
  OriginalRow227TriangleData0535.coefficient35_223,
  OriginalRow227TriangleData0535.coefficient35_224,
  OriginalRow227TriangleData0535.coefficient35_225
]

theorem values0535_size : values0535.size = 32 := rfl

def block0535 : ℕ → Option IntervalDyadic := segment 194 values0535

theorem block0535_domain : ExactDomain block0535 194 226 := by
  simpa only [values0535_size] using segment_domain 194 values0535

theorem block0535_get (i : Fin 32) :
    block0535 (194 + i.val) = some (values0535[i.val]'(by rw [values0535_size]; exact i.isLt)) := by
  exact segment_get 194 values0535 ⟨i.val, by rw [values0535_size]; exact i.isLt⟩

def values0536 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0536.coefficient35_226,
  OriginalRow227TriangleData0536.coefficient35_227,
  OriginalRow227TriangleData0536.coefficient35_228,
  OriginalRow227TriangleData0536.coefficient35_229,
  OriginalRow227TriangleData0536.coefficient35_230,
  OriginalRow227TriangleData0536.coefficient35_231,
  OriginalRow227TriangleData0536.coefficient35_232,
  OriginalRow227TriangleData0536.coefficient35_233,
  OriginalRow227TriangleData0536.coefficient35_234,
  OriginalRow227TriangleData0536.coefficient35_235,
  OriginalRow227TriangleData0536.coefficient35_236,
  OriginalRow227TriangleData0536.coefficient35_237,
  OriginalRow227TriangleData0536.coefficient35_238,
  OriginalRow227TriangleData0536.coefficient35_239,
  OriginalRow227TriangleData0536.coefficient35_240,
  OriginalRow227TriangleData0536.coefficient35_241,
  OriginalRow227TriangleData0536.coefficient35_242,
  OriginalRow227TriangleData0536.coefficient35_243,
  OriginalRow227TriangleData0536.coefficient35_244,
  OriginalRow227TriangleData0536.coefficient35_245,
  OriginalRow227TriangleData0536.coefficient35_246,
  OriginalRow227TriangleData0536.coefficient35_247,
  OriginalRow227TriangleData0536.coefficient35_248,
  OriginalRow227TriangleData0536.coefficient35_249,
  OriginalRow227TriangleData0536.coefficient35_250,
  OriginalRow227TriangleData0536.coefficient35_251,
  OriginalRow227TriangleData0536.coefficient35_252,
  OriginalRow227TriangleData0536.coefficient35_253,
  OriginalRow227TriangleData0536.coefficient35_254,
  OriginalRow227TriangleData0536.coefficient35_255,
  OriginalRow227TriangleData0536.coefficient35_256,
  OriginalRow227TriangleData0536.coefficient35_257
]

theorem values0536_size : values0536.size = 32 := rfl

def block0536 : ℕ → Option IntervalDyadic := segment 226 values0536

theorem block0536_domain : ExactDomain block0536 226 258 := by
  simpa only [values0536_size] using segment_domain 226 values0536

theorem block0536_get (i : Fin 32) :
    block0536 (226 + i.val) = some (values0536[i.val]'(by rw [values0536_size]; exact i.isLt)) := by
  exact segment_get 226 values0536 ⟨i.val, by rw [values0536_size]; exact i.isLt⟩

def values0537 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0537.coefficient35_258,
  OriginalRow227TriangleData0537.coefficient35_259,
  OriginalRow227TriangleData0537.coefficient35_260,
  OriginalRow227TriangleData0537.coefficient35_261,
  OriginalRow227TriangleData0537.coefficient35_262,
  OriginalRow227TriangleData0537.coefficient35_263,
  OriginalRow227TriangleData0537.coefficient35_264,
  OriginalRow227TriangleData0537.coefficient35_265,
  OriginalRow227TriangleData0537.coefficient35_266,
  OriginalRow227TriangleData0537.coefficient35_267,
  OriginalRow227TriangleData0537.coefficient35_268,
  OriginalRow227TriangleData0537.coefficient35_269,
  OriginalRow227TriangleData0537.coefficient35_270,
  OriginalRow227TriangleData0537.coefficient35_271,
  OriginalRow227TriangleData0537.coefficient35_272,
  OriginalRow227TriangleData0537.coefficient35_273,
  OriginalRow227TriangleData0537.coefficient35_274,
  OriginalRow227TriangleData0537.coefficient35_275,
  OriginalRow227TriangleData0537.coefficient35_276,
  OriginalRow227TriangleData0537.coefficient35_277,
  OriginalRow227TriangleData0537.coefficient35_278,
  OriginalRow227TriangleData0537.coefficient35_279,
  OriginalRow227TriangleData0537.coefficient35_280,
  OriginalRow227TriangleData0537.coefficient35_281,
  OriginalRow227TriangleData0537.coefficient35_282,
  OriginalRow227TriangleData0537.coefficient35_283,
  OriginalRow227TriangleData0537.coefficient35_284,
  OriginalRow227TriangleData0537.coefficient35_285,
  OriginalRow227TriangleData0537.coefficient35_286,
  OriginalRow227TriangleData0537.coefficient35_287,
  OriginalRow227TriangleData0537.coefficient35_288,
  OriginalRow227TriangleData0537.coefficient35_289
]

theorem values0537_size : values0537.size = 32 := rfl

def block0537 : ℕ → Option IntervalDyadic := segment 258 values0537

theorem block0537_domain : ExactDomain block0537 258 290 := by
  simpa only [values0537_size] using segment_domain 258 values0537

theorem block0537_get (i : Fin 32) :
    block0537 (258 + i.val) = some (values0537[i.val]'(by rw [values0537_size]; exact i.isLt)) := by
  exact segment_get 258 values0537 ⟨i.val, by rw [values0537_size]; exact i.isLt⟩

def values0538 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0538.coefficient35_290,
  OriginalRow227TriangleData0538.coefficient35_291,
  OriginalRow227TriangleData0538.coefficient35_292,
  OriginalRow227TriangleData0538.coefficient35_293,
  OriginalRow227TriangleData0538.coefficient35_294,
  OriginalRow227TriangleData0538.coefficient35_295,
  OriginalRow227TriangleData0538.coefficient35_296,
  OriginalRow227TriangleData0538.coefficient35_297,
  OriginalRow227TriangleData0538.coefficient35_298,
  OriginalRow227TriangleData0538.coefficient35_299,
  OriginalRow227TriangleData0538.coefficient35_300,
  OriginalRow227TriangleData0538.coefficient35_301,
  OriginalRow227TriangleData0538.coefficient35_302,
  OriginalRow227TriangleData0538.coefficient35_303,
  OriginalRow227TriangleData0538.coefficient35_304,
  OriginalRow227TriangleData0538.coefficient35_305,
  OriginalRow227TriangleData0538.coefficient35_306,
  OriginalRow227TriangleData0538.coefficient35_307,
  OriginalRow227TriangleData0538.coefficient35_308,
  OriginalRow227TriangleData0538.coefficient35_309,
  OriginalRow227TriangleData0538.coefficient35_310,
  OriginalRow227TriangleData0538.coefficient35_311,
  OriginalRow227TriangleData0538.coefficient35_312,
  OriginalRow227TriangleData0538.coefficient35_313,
  OriginalRow227TriangleData0538.coefficient35_314,
  OriginalRow227TriangleData0538.coefficient35_315,
  OriginalRow227TriangleData0538.coefficient35_316,
  OriginalRow227TriangleData0538.coefficient35_317,
  OriginalRow227TriangleData0538.coefficient35_318,
  OriginalRow227TriangleData0538.coefficient35_319,
  OriginalRow227TriangleData0538.coefficient35_320,
  OriginalRow227TriangleData0538.coefficient35_321
]

theorem values0538_size : values0538.size = 32 := rfl

def block0538 : ℕ → Option IntervalDyadic := segment 290 values0538

theorem block0538_domain : ExactDomain block0538 290 322 := by
  simpa only [values0538_size] using segment_domain 290 values0538

theorem block0538_get (i : Fin 32) :
    block0538 (290 + i.val) = some (values0538[i.val]'(by rw [values0538_size]; exact i.isLt)) := by
  exact segment_get 290 values0538 ⟨i.val, by rw [values0538_size]; exact i.isLt⟩

def values0539 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0539.coefficient35_322,
  OriginalRow227TriangleData0539.coefficient35_323,
  OriginalRow227TriangleData0539.coefficient35_324,
  OriginalRow227TriangleData0539.coefficient35_325,
  OriginalRow227TriangleData0539.coefficient35_326,
  OriginalRow227TriangleData0539.coefficient35_327,
  OriginalRow227TriangleData0539.coefficient35_328,
  OriginalRow227TriangleData0539.coefficient35_329,
  OriginalRow227TriangleData0539.coefficient35_330,
  OriginalRow227TriangleData0539.coefficient35_331,
  OriginalRow227TriangleData0539.coefficient35_332,
  OriginalRow227TriangleData0539.coefficient35_333,
  OriginalRow227TriangleData0539.coefficient35_334,
  OriginalRow227TriangleData0539.coefficient35_335,
  OriginalRow227TriangleData0539.coefficient35_336,
  OriginalRow227TriangleData0539.coefficient35_337,
  OriginalRow227TriangleData0539.coefficient35_338,
  OriginalRow227TriangleData0539.coefficient35_339,
  OriginalRow227TriangleData0539.coefficient35_340,
  OriginalRow227TriangleData0539.coefficient35_341,
  OriginalRow227TriangleData0539.coefficient35_342,
  OriginalRow227TriangleData0539.coefficient35_343,
  OriginalRow227TriangleData0539.coefficient35_344,
  OriginalRow227TriangleData0539.coefficient35_345,
  OriginalRow227TriangleData0539.coefficient35_346,
  OriginalRow227TriangleData0539.coefficient35_347,
  OriginalRow227TriangleData0539.coefficient35_348,
  OriginalRow227TriangleData0539.coefficient35_349,
  OriginalRow227TriangleData0539.coefficient35_350,
  OriginalRow227TriangleData0539.coefficient35_351,
  OriginalRow227TriangleData0539.coefficient35_352,
  OriginalRow227TriangleData0539.coefficient35_353
]

theorem values0539_size : values0539.size = 32 := rfl

def block0539 : ℕ → Option IntervalDyadic := segment 322 values0539

theorem block0539_domain : ExactDomain block0539 322 354 := by
  simpa only [values0539_size] using segment_domain 322 values0539

theorem block0539_get (i : Fin 32) :
    block0539 (322 + i.val) = some (values0539[i.val]'(by rw [values0539_size]; exact i.isLt)) := by
  exact segment_get 322 values0539 ⟨i.val, by rw [values0539_size]; exact i.isLt⟩

def values0540 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0540.coefficient35_354,
  OriginalRow227TriangleData0540.coefficient35_355,
  OriginalRow227TriangleData0540.coefficient35_356,
  OriginalRow227TriangleData0540.coefficient35_357,
  OriginalRow227TriangleData0540.coefficient35_358,
  OriginalRow227TriangleData0540.coefficient35_359,
  OriginalRow227TriangleData0540.coefficient35_360,
  OriginalRow227TriangleData0540.coefficient35_361,
  OriginalRow227TriangleData0540.coefficient35_362,
  OriginalRow227TriangleData0540.coefficient35_363,
  OriginalRow227TriangleData0540.coefficient35_364,
  OriginalRow227TriangleData0540.coefficient35_365,
  OriginalRow227TriangleData0540.coefficient35_366,
  OriginalRow227TriangleData0540.coefficient35_367,
  OriginalRow227TriangleData0540.coefficient35_368,
  OriginalRow227TriangleData0540.coefficient35_369,
  OriginalRow227TriangleData0540.coefficient35_370,
  OriginalRow227TriangleData0540.coefficient35_371,
  OriginalRow227TriangleData0540.coefficient35_372,
  OriginalRow227TriangleData0540.coefficient35_373,
  OriginalRow227TriangleData0540.coefficient35_374,
  OriginalRow227TriangleData0540.coefficient35_375,
  OriginalRow227TriangleData0540.coefficient35_376,
  OriginalRow227TriangleData0540.coefficient35_377,
  OriginalRow227TriangleData0540.coefficient35_378,
  OriginalRow227TriangleData0540.coefficient35_379,
  OriginalRow227TriangleData0540.coefficient35_380,
  OriginalRow227TriangleData0540.coefficient35_381,
  OriginalRow227TriangleData0540.coefficient35_382,
  OriginalRow227TriangleData0540.coefficient35_383,
  OriginalRow227TriangleData0540.coefficient35_384,
  OriginalRow227TriangleData0540.coefficient35_385
]

theorem values0540_size : values0540.size = 32 := rfl

def block0540 : ℕ → Option IntervalDyadic := segment 354 values0540

theorem block0540_domain : ExactDomain block0540 354 386 := by
  simpa only [values0540_size] using segment_domain 354 values0540

theorem block0540_get (i : Fin 32) :
    block0540 (354 + i.val) = some (values0540[i.val]'(by rw [values0540_size]; exact i.isLt)) := by
  exact segment_get 354 values0540 ⟨i.val, by rw [values0540_size]; exact i.isLt⟩

def values0541 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0541.coefficient35_386,
  OriginalRow227TriangleData0541.coefficient35_387,
  OriginalRow227TriangleData0541.coefficient35_388,
  OriginalRow227TriangleData0541.coefficient35_389,
  OriginalRow227TriangleData0541.coefficient35_390,
  OriginalRow227TriangleData0541.coefficient35_391,
  OriginalRow227TriangleData0541.coefficient35_392,
  OriginalRow227TriangleData0541.coefficient35_393,
  OriginalRow227TriangleData0541.coefficient35_394,
  OriginalRow227TriangleData0541.coefficient35_395,
  OriginalRow227TriangleData0541.coefficient35_396,
  OriginalRow227TriangleData0541.coefficient35_397,
  OriginalRow227TriangleData0541.coefficient35_398,
  OriginalRow227TriangleData0541.coefficient35_399,
  OriginalRow227TriangleData0541.coefficient35_400,
  OriginalRow227TriangleData0541.coefficient35_401,
  OriginalRow227TriangleData0541.coefficient35_402,
  OriginalRow227TriangleData0541.coefficient35_403,
  OriginalRow227TriangleData0541.coefficient35_404,
  OriginalRow227TriangleData0541.coefficient35_405,
  OriginalRow227TriangleData0541.coefficient35_406,
  OriginalRow227TriangleData0541.coefficient35_407,
  OriginalRow227TriangleData0541.coefficient35_408,
  OriginalRow227TriangleData0541.coefficient35_409,
  OriginalRow227TriangleData0541.coefficient35_410,
  OriginalRow227TriangleData0541.coefficient35_411,
  OriginalRow227TriangleData0541.coefficient35_412,
  OriginalRow227TriangleData0541.coefficient35_413,
  OriginalRow227TriangleData0541.coefficient35_414,
  OriginalRow227TriangleData0541.coefficient35_415,
  OriginalRow227TriangleData0541.coefficient35_416,
  OriginalRow227TriangleData0541.coefficient35_417
]

theorem values0541_size : values0541.size = 32 := rfl

def block0541 : ℕ → Option IntervalDyadic := segment 386 values0541

theorem block0541_domain : ExactDomain block0541 386 418 := by
  simpa only [values0541_size] using segment_domain 386 values0541

theorem block0541_get (i : Fin 32) :
    block0541 (386 + i.val) = some (values0541[i.val]'(by rw [values0541_size]; exact i.isLt)) := by
  exact segment_get 386 values0541 ⟨i.val, by rw [values0541_size]; exact i.isLt⟩

def values0542 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0542.coefficient35_418,
  OriginalRow227TriangleData0542.coefficient35_419,
  OriginalRow227TriangleData0542.coefficient35_420,
  OriginalRow227TriangleData0542.coefficient35_421,
  OriginalRow227TriangleData0542.coefficient35_422,
  OriginalRow227TriangleData0542.coefficient35_423,
  OriginalRow227TriangleData0542.coefficient35_424,
  OriginalRow227TriangleData0542.coefficient35_425,
  OriginalRow227TriangleData0542.coefficient35_426,
  OriginalRow227TriangleData0542.coefficient35_427,
  OriginalRow227TriangleData0542.coefficient35_428,
  OriginalRow227TriangleData0542.coefficient35_429,
  OriginalRow227TriangleData0542.coefficient35_430,
  OriginalRow227TriangleData0542.coefficient35_431,
  OriginalRow227TriangleData0542.coefficient35_432,
  OriginalRow227TriangleData0542.coefficient35_433,
  OriginalRow227TriangleData0542.coefficient35_434,
  OriginalRow227TriangleData0542.coefficient35_435,
  OriginalRow227TriangleData0542.coefficient35_436,
  OriginalRow227TriangleData0542.coefficient35_437,
  OriginalRow227TriangleData0542.coefficient35_438,
  OriginalRow227TriangleData0542.coefficient35_439,
  OriginalRow227TriangleData0542.coefficient35_440,
  OriginalRow227TriangleData0542.coefficient35_441,
  OriginalRow227TriangleData0542.coefficient35_442,
  OriginalRow227TriangleData0542.coefficient35_443,
  OriginalRow227TriangleData0542.coefficient35_444,
  OriginalRow227TriangleData0542.coefficient35_445,
  OriginalRow227TriangleData0542.coefficient35_446,
  OriginalRow227TriangleData0542.coefficient35_447,
  OriginalRow227TriangleData0542.coefficient35_448,
  OriginalRow227TriangleData0542.coefficient35_449
]

theorem values0542_size : values0542.size = 32 := rfl

def block0542 : ℕ → Option IntervalDyadic := segment 418 values0542

theorem block0542_domain : ExactDomain block0542 418 450 := by
  simpa only [values0542_size] using segment_domain 418 values0542

theorem block0542_get (i : Fin 32) :
    block0542 (418 + i.val) = some (values0542[i.val]'(by rw [values0542_size]; exact i.isLt)) := by
  exact segment_get 418 values0542 ⟨i.val, by rw [values0542_size]; exact i.isLt⟩

def values0543 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0543.coefficient35_450,
  OriginalRow227TriangleData0543.coefficient35_451,
  OriginalRow227TriangleData0543.coefficient35_452,
  OriginalRow227TriangleData0543.coefficient35_453,
  OriginalRow227TriangleData0543.coefficient35_454,
  OriginalRow227TriangleData0543.coefficient35_455,
  OriginalRow227TriangleData0543.coefficient35_456,
  OriginalRow227TriangleData0543.coefficient35_457,
  OriginalRow227TriangleData0543.coefficient35_458,
  OriginalRow227TriangleData0543.coefficient35_459,
  OriginalRow227TriangleData0543.coefficient35_460,
  OriginalRow227TriangleData0543.coefficient35_461,
  OriginalRow227TriangleData0543.coefficient35_462,
  OriginalRow227TriangleData0543.coefficient35_463,
  OriginalRow227TriangleData0543.coefficient35_464,
  OriginalRow227TriangleData0543.coefficient35_465,
  OriginalRow227TriangleData0543.coefficient35_466
]

theorem values0543_size : values0543.size = 17 := rfl

def block0543 : ℕ → Option IntervalDyadic := segment 450 values0543

theorem block0543_domain : ExactDomain block0543 450 467 := by
  simpa only [values0543_size] using segment_domain 450 values0543

theorem block0543_get (i : Fin 17) :
    block0543 (450 + i.val) = some (values0543[i.val]'(by rw [values0543_size]; exact i.isLt)) := by
  exact segment_get 450 values0543 ⟨i.val, by rw [values0543_size]; exact i.isLt⟩

def node0066_0130 : ℕ → Option IntervalDyadic := split 98 block0531 block0532

theorem node0066_0130_domain : ExactDomain node0066_0130 66 130 := by
  exact split_domain (by decide) (by decide) block0531_domain block0532_domain

def node0034_0130 : ℕ → Option IntervalDyadic := split 66 block0530 node0066_0130

theorem node0034_0130_domain : ExactDomain node0034_0130 34 130 := by
  exact split_domain (by decide) (by decide) block0530_domain node0066_0130_domain

def node0130_0194 : ℕ → Option IntervalDyadic := split 162 block0533 block0534

theorem node0130_0194_domain : ExactDomain node0130_0194 130 194 := by
  exact split_domain (by decide) (by decide) block0533_domain block0534_domain

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block0535 block0536

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block0535_domain block0536_domain

def node0130_0258 : ℕ → Option IntervalDyadic := split 194 node0130_0194 node0194_0258

theorem node0130_0258_domain : ExactDomain node0130_0258 130 258 := by
  exact split_domain (by decide) (by decide) node0130_0194_domain node0194_0258_domain

def node0034_0258 : ℕ → Option IntervalDyadic := split 130 node0034_0130 node0130_0258

theorem node0034_0258_domain : ExactDomain node0034_0258 34 258 := by
  exact split_domain (by decide) (by decide) node0034_0130_domain node0130_0258_domain

def node0290_0354 : ℕ → Option IntervalDyadic := split 322 block0538 block0539

theorem node0290_0354_domain : ExactDomain node0290_0354 290 354 := by
  exact split_domain (by decide) (by decide) block0538_domain block0539_domain

def node0258_0354 : ℕ → Option IntervalDyadic := split 290 block0537 node0290_0354

theorem node0258_0354_domain : ExactDomain node0258_0354 258 354 := by
  exact split_domain (by decide) (by decide) block0537_domain node0290_0354_domain

def node0354_0418 : ℕ → Option IntervalDyadic := split 386 block0540 block0541

theorem node0354_0418_domain : ExactDomain node0354_0418 354 418 := by
  exact split_domain (by decide) (by decide) block0540_domain block0541_domain

def node0418_0467 : ℕ → Option IntervalDyadic := split 450 block0542 block0543

theorem node0418_0467_domain : ExactDomain node0418_0467 418 467 := by
  exact split_domain (by decide) (by decide) block0542_domain block0543_domain

def node0354_0467 : ℕ → Option IntervalDyadic := split 418 node0354_0418 node0418_0467

theorem node0354_0467_domain : ExactDomain node0354_0467 354 467 := by
  exact split_domain (by decide) (by decide) node0354_0418_domain node0418_0467_domain

def node0258_0467 : ℕ → Option IntervalDyadic := split 354 node0258_0354 node0354_0467

theorem node0258_0467_domain : ExactDomain node0258_0467 258 467 := by
  exact split_domain (by decide) (by decide) node0258_0354_domain node0354_0467_domain

def node0034_0467 : ℕ → Option IntervalDyadic := split 258 node0034_0258 node0258_0467

theorem node0034_0467_domain : ExactDomain node0034_0467 34 467 := by
  exact split_domain (by decide) (by decide) node0034_0258_domain node0258_0467_domain

def lookup : ℕ → Option IntervalDyadic := node0034_0467

theorem lookup_domain : ExactDomain lookup 34 467 :=
  node0034_0467_domain

theorem block0530_lookup (i : Fin 32) :
    lookup (34 + i.val) = some (values0530[i.val]'(by rw [values0530_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (34 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_left 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0034_0130, split_left 66 block0530 node0066_0130 (by omega)]
  exact block0530_get i

theorem block0531_lookup (i : Fin 32) :
    lookup (66 + i.val) = some (values0531[i.val]'(by rw [values0531_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (66 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_left 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0034_0130, split_right 66 block0530 node0066_0130 (by omega)]
  rw [node0066_0130, split_left 98 block0531 block0532 (by omega)]
  exact block0531_get i

theorem block0532_lookup (i : Fin 32) :
    lookup (98 + i.val) = some (values0532[i.val]'(by rw [values0532_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (98 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_left 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0034_0130, split_right 66 block0530 node0066_0130 (by omega)]
  rw [node0066_0130, split_right 98 block0531 block0532 (by omega)]
  exact block0532_get i

theorem block0533_lookup (i : Fin 32) :
    lookup (130 + i.val) = some (values0533[i.val]'(by rw [values0533_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (130 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_right 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_left 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0130_0194, split_left 162 block0533 block0534 (by omega)]
  exact block0533_get i

theorem block0534_lookup (i : Fin 32) :
    lookup (162 + i.val) = some (values0534[i.val]'(by rw [values0534_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (162 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_right 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_left 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0130_0194, split_right 162 block0533 block0534 (by omega)]
  exact block0534_get i

theorem block0535_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values0535[i.val]'(by rw [values0535_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (194 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_right 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_right 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0194_0258, split_left 226 block0535 block0536 (by omega)]
  exact block0535_get i

theorem block0536_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values0536[i.val]'(by rw [values0536_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (226 + i.val) = _
  rw [node0034_0467, split_left 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0034_0258, split_right 130 node0034_0130 node0130_0258 (by omega)]
  rw [node0130_0258, split_right 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0194_0258, split_right 226 block0535 block0536 (by omega)]
  exact block0536_get i

theorem block0537_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values0537[i.val]'(by rw [values0537_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (258 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_left 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0258_0354, split_left 290 block0537 node0290_0354 (by omega)]
  exact block0537_get i

theorem block0538_lookup (i : Fin 32) :
    lookup (290 + i.val) = some (values0538[i.val]'(by rw [values0538_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (290 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_left 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0258_0354, split_right 290 block0537 node0290_0354 (by omega)]
  rw [node0290_0354, split_left 322 block0538 block0539 (by omega)]
  exact block0538_get i

theorem block0539_lookup (i : Fin 32) :
    lookup (322 + i.val) = some (values0539[i.val]'(by rw [values0539_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (322 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_left 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0258_0354, split_right 290 block0537 node0290_0354 (by omega)]
  rw [node0290_0354, split_right 322 block0538 block0539 (by omega)]
  exact block0539_get i

theorem block0540_lookup (i : Fin 32) :
    lookup (354 + i.val) = some (values0540[i.val]'(by rw [values0540_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (354 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_right 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0354_0467, split_left 418 node0354_0418 node0418_0467 (by omega)]
  rw [node0354_0418, split_left 386 block0540 block0541 (by omega)]
  exact block0540_get i

theorem block0541_lookup (i : Fin 32) :
    lookup (386 + i.val) = some (values0541[i.val]'(by rw [values0541_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (386 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_right 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0354_0467, split_left 418 node0354_0418 node0418_0467 (by omega)]
  rw [node0354_0418, split_right 386 block0540 block0541 (by omega)]
  exact block0541_get i

theorem block0542_lookup (i : Fin 32) :
    lookup (418 + i.val) = some (values0542[i.val]'(by rw [values0542_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (418 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_right 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0354_0467, split_right 418 node0354_0418 node0418_0467 (by omega)]
  rw [node0418_0467, split_left 450 block0542 block0543 (by omega)]
  exact block0542_get i

theorem block0543_lookup (i : Fin 17) :
    lookup (450 + i.val) = some (values0543[i.val]'(by rw [values0543_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0034_0467 (450 + i.val) = _
  rw [node0034_0467, split_right 258 node0034_0258 node0258_0467 (by omega)]
  rw [node0258_0467, split_right 354 node0258_0354 node0354_0467 (by omega)]
  rw [node0354_0467, split_right 418 node0354_0418 node0418_0467 (by omega)]
  rw [node0418_0467, split_right 450 block0542 block0543 (by omega)]
  exact block0543_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0530_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0530_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0531_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0531_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0532_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0532_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0533_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0533_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0534_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0534_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0535_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0535_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0536_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0536_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0537_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0537_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0538_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0538_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0539_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0539_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0540_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0540_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0541_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0541_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0542_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0542_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0543_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0543_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0530_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0531_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0532_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0533_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0534_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0535_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0536_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0537_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0538_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0539_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0540_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0541_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0542_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow035.block0543_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow035
