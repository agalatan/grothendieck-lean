import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0682
import Grothe.UpperChaos.OriginalRow227TriangleData0683
import Grothe.UpperChaos.OriginalRow227TriangleData0684
import Grothe.UpperChaos.OriginalRow227TriangleData0685
import Grothe.UpperChaos.OriginalRow227TriangleData0686
import Grothe.UpperChaos.OriginalRow227TriangleData0687
import Grothe.UpperChaos.OriginalRow227TriangleData0688
import Grothe.UpperChaos.OriginalRow227TriangleData0689
import Grothe.UpperChaos.OriginalRow227TriangleData0690
import Grothe.UpperChaos.OriginalRow227TriangleData0691
import Grothe.UpperChaos.OriginalRow227TriangleData0692
import Grothe.UpperChaos.OriginalRow227TriangleData0693
import Grothe.UpperChaos.OriginalRow227TriangleData0694

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow046

open ConditionalTableLookup

def values0682 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0682.coefficient46_45,
  OriginalRow227TriangleData0682.coefficient46_46,
  OriginalRow227TriangleData0682.coefficient46_47,
  OriginalRow227TriangleData0682.coefficient46_48,
  OriginalRow227TriangleData0682.coefficient46_49,
  OriginalRow227TriangleData0682.coefficient46_50,
  OriginalRow227TriangleData0682.coefficient46_51,
  OriginalRow227TriangleData0682.coefficient46_52,
  OriginalRow227TriangleData0682.coefficient46_53,
  OriginalRow227TriangleData0682.coefficient46_54,
  OriginalRow227TriangleData0682.coefficient46_55,
  OriginalRow227TriangleData0682.coefficient46_56,
  OriginalRow227TriangleData0682.coefficient46_57,
  OriginalRow227TriangleData0682.coefficient46_58,
  OriginalRow227TriangleData0682.coefficient46_59,
  OriginalRow227TriangleData0682.coefficient46_60,
  OriginalRow227TriangleData0682.coefficient46_61,
  OriginalRow227TriangleData0682.coefficient46_62,
  OriginalRow227TriangleData0682.coefficient46_63,
  OriginalRow227TriangleData0682.coefficient46_64,
  OriginalRow227TriangleData0682.coefficient46_65,
  OriginalRow227TriangleData0682.coefficient46_66,
  OriginalRow227TriangleData0682.coefficient46_67,
  OriginalRow227TriangleData0682.coefficient46_68,
  OriginalRow227TriangleData0682.coefficient46_69,
  OriginalRow227TriangleData0682.coefficient46_70,
  OriginalRow227TriangleData0682.coefficient46_71,
  OriginalRow227TriangleData0682.coefficient46_72,
  OriginalRow227TriangleData0682.coefficient46_73,
  OriginalRow227TriangleData0682.coefficient46_74,
  OriginalRow227TriangleData0682.coefficient46_75,
  OriginalRow227TriangleData0682.coefficient46_76
]

theorem values0682_size : values0682.size = 32 := rfl

def block0682 : ℕ → Option IntervalDyadic := segment 45 values0682

theorem block0682_domain : ExactDomain block0682 45 77 := by
  simpa only [values0682_size] using segment_domain 45 values0682

theorem block0682_get (i : Fin 32) :
    block0682 (45 + i.val) = some (values0682[i.val]'(by rw [values0682_size]; exact i.isLt)) := by
  exact segment_get 45 values0682 ⟨i.val, by rw [values0682_size]; exact i.isLt⟩

def values0683 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0683.coefficient46_77,
  OriginalRow227TriangleData0683.coefficient46_78,
  OriginalRow227TriangleData0683.coefficient46_79,
  OriginalRow227TriangleData0683.coefficient46_80,
  OriginalRow227TriangleData0683.coefficient46_81,
  OriginalRow227TriangleData0683.coefficient46_82,
  OriginalRow227TriangleData0683.coefficient46_83,
  OriginalRow227TriangleData0683.coefficient46_84,
  OriginalRow227TriangleData0683.coefficient46_85,
  OriginalRow227TriangleData0683.coefficient46_86,
  OriginalRow227TriangleData0683.coefficient46_87,
  OriginalRow227TriangleData0683.coefficient46_88,
  OriginalRow227TriangleData0683.coefficient46_89,
  OriginalRow227TriangleData0683.coefficient46_90,
  OriginalRow227TriangleData0683.coefficient46_91,
  OriginalRow227TriangleData0683.coefficient46_92,
  OriginalRow227TriangleData0683.coefficient46_93,
  OriginalRow227TriangleData0683.coefficient46_94,
  OriginalRow227TriangleData0683.coefficient46_95,
  OriginalRow227TriangleData0683.coefficient46_96,
  OriginalRow227TriangleData0683.coefficient46_97,
  OriginalRow227TriangleData0683.coefficient46_98,
  OriginalRow227TriangleData0683.coefficient46_99,
  OriginalRow227TriangleData0683.coefficient46_100,
  OriginalRow227TriangleData0683.coefficient46_101,
  OriginalRow227TriangleData0683.coefficient46_102,
  OriginalRow227TriangleData0683.coefficient46_103,
  OriginalRow227TriangleData0683.coefficient46_104,
  OriginalRow227TriangleData0683.coefficient46_105,
  OriginalRow227TriangleData0683.coefficient46_106,
  OriginalRow227TriangleData0683.coefficient46_107,
  OriginalRow227TriangleData0683.coefficient46_108
]

theorem values0683_size : values0683.size = 32 := rfl

def block0683 : ℕ → Option IntervalDyadic := segment 77 values0683

theorem block0683_domain : ExactDomain block0683 77 109 := by
  simpa only [values0683_size] using segment_domain 77 values0683

theorem block0683_get (i : Fin 32) :
    block0683 (77 + i.val) = some (values0683[i.val]'(by rw [values0683_size]; exact i.isLt)) := by
  exact segment_get 77 values0683 ⟨i.val, by rw [values0683_size]; exact i.isLt⟩

def values0684 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0684.coefficient46_109,
  OriginalRow227TriangleData0684.coefficient46_110,
  OriginalRow227TriangleData0684.coefficient46_111,
  OriginalRow227TriangleData0684.coefficient46_112,
  OriginalRow227TriangleData0684.coefficient46_113,
  OriginalRow227TriangleData0684.coefficient46_114,
  OriginalRow227TriangleData0684.coefficient46_115,
  OriginalRow227TriangleData0684.coefficient46_116,
  OriginalRow227TriangleData0684.coefficient46_117,
  OriginalRow227TriangleData0684.coefficient46_118,
  OriginalRow227TriangleData0684.coefficient46_119,
  OriginalRow227TriangleData0684.coefficient46_120,
  OriginalRow227TriangleData0684.coefficient46_121,
  OriginalRow227TriangleData0684.coefficient46_122,
  OriginalRow227TriangleData0684.coefficient46_123,
  OriginalRow227TriangleData0684.coefficient46_124,
  OriginalRow227TriangleData0684.coefficient46_125,
  OriginalRow227TriangleData0684.coefficient46_126,
  OriginalRow227TriangleData0684.coefficient46_127,
  OriginalRow227TriangleData0684.coefficient46_128,
  OriginalRow227TriangleData0684.coefficient46_129,
  OriginalRow227TriangleData0684.coefficient46_130,
  OriginalRow227TriangleData0684.coefficient46_131,
  OriginalRow227TriangleData0684.coefficient46_132,
  OriginalRow227TriangleData0684.coefficient46_133,
  OriginalRow227TriangleData0684.coefficient46_134,
  OriginalRow227TriangleData0684.coefficient46_135,
  OriginalRow227TriangleData0684.coefficient46_136,
  OriginalRow227TriangleData0684.coefficient46_137,
  OriginalRow227TriangleData0684.coefficient46_138,
  OriginalRow227TriangleData0684.coefficient46_139,
  OriginalRow227TriangleData0684.coefficient46_140
]

theorem values0684_size : values0684.size = 32 := rfl

def block0684 : ℕ → Option IntervalDyadic := segment 109 values0684

theorem block0684_domain : ExactDomain block0684 109 141 := by
  simpa only [values0684_size] using segment_domain 109 values0684

theorem block0684_get (i : Fin 32) :
    block0684 (109 + i.val) = some (values0684[i.val]'(by rw [values0684_size]; exact i.isLt)) := by
  exact segment_get 109 values0684 ⟨i.val, by rw [values0684_size]; exact i.isLt⟩

def values0685 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0685.coefficient46_141,
  OriginalRow227TriangleData0685.coefficient46_142,
  OriginalRow227TriangleData0685.coefficient46_143,
  OriginalRow227TriangleData0685.coefficient46_144,
  OriginalRow227TriangleData0685.coefficient46_145,
  OriginalRow227TriangleData0685.coefficient46_146,
  OriginalRow227TriangleData0685.coefficient46_147,
  OriginalRow227TriangleData0685.coefficient46_148,
  OriginalRow227TriangleData0685.coefficient46_149,
  OriginalRow227TriangleData0685.coefficient46_150,
  OriginalRow227TriangleData0685.coefficient46_151,
  OriginalRow227TriangleData0685.coefficient46_152,
  OriginalRow227TriangleData0685.coefficient46_153,
  OriginalRow227TriangleData0685.coefficient46_154,
  OriginalRow227TriangleData0685.coefficient46_155,
  OriginalRow227TriangleData0685.coefficient46_156,
  OriginalRow227TriangleData0685.coefficient46_157,
  OriginalRow227TriangleData0685.coefficient46_158,
  OriginalRow227TriangleData0685.coefficient46_159,
  OriginalRow227TriangleData0685.coefficient46_160,
  OriginalRow227TriangleData0685.coefficient46_161,
  OriginalRow227TriangleData0685.coefficient46_162,
  OriginalRow227TriangleData0685.coefficient46_163,
  OriginalRow227TriangleData0685.coefficient46_164,
  OriginalRow227TriangleData0685.coefficient46_165,
  OriginalRow227TriangleData0685.coefficient46_166,
  OriginalRow227TriangleData0685.coefficient46_167,
  OriginalRow227TriangleData0685.coefficient46_168,
  OriginalRow227TriangleData0685.coefficient46_169,
  OriginalRow227TriangleData0685.coefficient46_170,
  OriginalRow227TriangleData0685.coefficient46_171,
  OriginalRow227TriangleData0685.coefficient46_172
]

theorem values0685_size : values0685.size = 32 := rfl

def block0685 : ℕ → Option IntervalDyadic := segment 141 values0685

theorem block0685_domain : ExactDomain block0685 141 173 := by
  simpa only [values0685_size] using segment_domain 141 values0685

theorem block0685_get (i : Fin 32) :
    block0685 (141 + i.val) = some (values0685[i.val]'(by rw [values0685_size]; exact i.isLt)) := by
  exact segment_get 141 values0685 ⟨i.val, by rw [values0685_size]; exact i.isLt⟩

def values0686 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0686.coefficient46_173,
  OriginalRow227TriangleData0686.coefficient46_174,
  OriginalRow227TriangleData0686.coefficient46_175,
  OriginalRow227TriangleData0686.coefficient46_176,
  OriginalRow227TriangleData0686.coefficient46_177,
  OriginalRow227TriangleData0686.coefficient46_178,
  OriginalRow227TriangleData0686.coefficient46_179,
  OriginalRow227TriangleData0686.coefficient46_180,
  OriginalRow227TriangleData0686.coefficient46_181,
  OriginalRow227TriangleData0686.coefficient46_182,
  OriginalRow227TriangleData0686.coefficient46_183,
  OriginalRow227TriangleData0686.coefficient46_184,
  OriginalRow227TriangleData0686.coefficient46_185,
  OriginalRow227TriangleData0686.coefficient46_186,
  OriginalRow227TriangleData0686.coefficient46_187,
  OriginalRow227TriangleData0686.coefficient46_188,
  OriginalRow227TriangleData0686.coefficient46_189,
  OriginalRow227TriangleData0686.coefficient46_190,
  OriginalRow227TriangleData0686.coefficient46_191,
  OriginalRow227TriangleData0686.coefficient46_192,
  OriginalRow227TriangleData0686.coefficient46_193,
  OriginalRow227TriangleData0686.coefficient46_194,
  OriginalRow227TriangleData0686.coefficient46_195,
  OriginalRow227TriangleData0686.coefficient46_196,
  OriginalRow227TriangleData0686.coefficient46_197,
  OriginalRow227TriangleData0686.coefficient46_198,
  OriginalRow227TriangleData0686.coefficient46_199,
  OriginalRow227TriangleData0686.coefficient46_200,
  OriginalRow227TriangleData0686.coefficient46_201,
  OriginalRow227TriangleData0686.coefficient46_202,
  OriginalRow227TriangleData0686.coefficient46_203,
  OriginalRow227TriangleData0686.coefficient46_204
]

theorem values0686_size : values0686.size = 32 := rfl

def block0686 : ℕ → Option IntervalDyadic := segment 173 values0686

theorem block0686_domain : ExactDomain block0686 173 205 := by
  simpa only [values0686_size] using segment_domain 173 values0686

theorem block0686_get (i : Fin 32) :
    block0686 (173 + i.val) = some (values0686[i.val]'(by rw [values0686_size]; exact i.isLt)) := by
  exact segment_get 173 values0686 ⟨i.val, by rw [values0686_size]; exact i.isLt⟩

def values0687 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0687.coefficient46_205,
  OriginalRow227TriangleData0687.coefficient46_206,
  OriginalRow227TriangleData0687.coefficient46_207,
  OriginalRow227TriangleData0687.coefficient46_208,
  OriginalRow227TriangleData0687.coefficient46_209,
  OriginalRow227TriangleData0687.coefficient46_210,
  OriginalRow227TriangleData0687.coefficient46_211,
  OriginalRow227TriangleData0687.coefficient46_212,
  OriginalRow227TriangleData0687.coefficient46_213,
  OriginalRow227TriangleData0687.coefficient46_214,
  OriginalRow227TriangleData0687.coefficient46_215,
  OriginalRow227TriangleData0687.coefficient46_216,
  OriginalRow227TriangleData0687.coefficient46_217,
  OriginalRow227TriangleData0687.coefficient46_218,
  OriginalRow227TriangleData0687.coefficient46_219,
  OriginalRow227TriangleData0687.coefficient46_220,
  OriginalRow227TriangleData0687.coefficient46_221,
  OriginalRow227TriangleData0687.coefficient46_222,
  OriginalRow227TriangleData0687.coefficient46_223,
  OriginalRow227TriangleData0687.coefficient46_224,
  OriginalRow227TriangleData0687.coefficient46_225,
  OriginalRow227TriangleData0687.coefficient46_226,
  OriginalRow227TriangleData0687.coefficient46_227,
  OriginalRow227TriangleData0687.coefficient46_228,
  OriginalRow227TriangleData0687.coefficient46_229,
  OriginalRow227TriangleData0687.coefficient46_230,
  OriginalRow227TriangleData0687.coefficient46_231,
  OriginalRow227TriangleData0687.coefficient46_232,
  OriginalRow227TriangleData0687.coefficient46_233,
  OriginalRow227TriangleData0687.coefficient46_234,
  OriginalRow227TriangleData0687.coefficient46_235,
  OriginalRow227TriangleData0687.coefficient46_236
]

theorem values0687_size : values0687.size = 32 := rfl

def block0687 : ℕ → Option IntervalDyadic := segment 205 values0687

theorem block0687_domain : ExactDomain block0687 205 237 := by
  simpa only [values0687_size] using segment_domain 205 values0687

theorem block0687_get (i : Fin 32) :
    block0687 (205 + i.val) = some (values0687[i.val]'(by rw [values0687_size]; exact i.isLt)) := by
  exact segment_get 205 values0687 ⟨i.val, by rw [values0687_size]; exact i.isLt⟩

def values0688 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0688.coefficient46_237,
  OriginalRow227TriangleData0688.coefficient46_238,
  OriginalRow227TriangleData0688.coefficient46_239,
  OriginalRow227TriangleData0688.coefficient46_240,
  OriginalRow227TriangleData0688.coefficient46_241,
  OriginalRow227TriangleData0688.coefficient46_242,
  OriginalRow227TriangleData0688.coefficient46_243,
  OriginalRow227TriangleData0688.coefficient46_244,
  OriginalRow227TriangleData0688.coefficient46_245,
  OriginalRow227TriangleData0688.coefficient46_246,
  OriginalRow227TriangleData0688.coefficient46_247,
  OriginalRow227TriangleData0688.coefficient46_248,
  OriginalRow227TriangleData0688.coefficient46_249,
  OriginalRow227TriangleData0688.coefficient46_250,
  OriginalRow227TriangleData0688.coefficient46_251,
  OriginalRow227TriangleData0688.coefficient46_252,
  OriginalRow227TriangleData0688.coefficient46_253,
  OriginalRow227TriangleData0688.coefficient46_254,
  OriginalRow227TriangleData0688.coefficient46_255,
  OriginalRow227TriangleData0688.coefficient46_256,
  OriginalRow227TriangleData0688.coefficient46_257,
  OriginalRow227TriangleData0688.coefficient46_258,
  OriginalRow227TriangleData0688.coefficient46_259,
  OriginalRow227TriangleData0688.coefficient46_260,
  OriginalRow227TriangleData0688.coefficient46_261,
  OriginalRow227TriangleData0688.coefficient46_262,
  OriginalRow227TriangleData0688.coefficient46_263,
  OriginalRow227TriangleData0688.coefficient46_264,
  OriginalRow227TriangleData0688.coefficient46_265,
  OriginalRow227TriangleData0688.coefficient46_266,
  OriginalRow227TriangleData0688.coefficient46_267,
  OriginalRow227TriangleData0688.coefficient46_268
]

theorem values0688_size : values0688.size = 32 := rfl

def block0688 : ℕ → Option IntervalDyadic := segment 237 values0688

theorem block0688_domain : ExactDomain block0688 237 269 := by
  simpa only [values0688_size] using segment_domain 237 values0688

theorem block0688_get (i : Fin 32) :
    block0688 (237 + i.val) = some (values0688[i.val]'(by rw [values0688_size]; exact i.isLt)) := by
  exact segment_get 237 values0688 ⟨i.val, by rw [values0688_size]; exact i.isLt⟩

def values0689 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0689.coefficient46_269,
  OriginalRow227TriangleData0689.coefficient46_270,
  OriginalRow227TriangleData0689.coefficient46_271,
  OriginalRow227TriangleData0689.coefficient46_272,
  OriginalRow227TriangleData0689.coefficient46_273,
  OriginalRow227TriangleData0689.coefficient46_274,
  OriginalRow227TriangleData0689.coefficient46_275,
  OriginalRow227TriangleData0689.coefficient46_276,
  OriginalRow227TriangleData0689.coefficient46_277,
  OriginalRow227TriangleData0689.coefficient46_278,
  OriginalRow227TriangleData0689.coefficient46_279,
  OriginalRow227TriangleData0689.coefficient46_280,
  OriginalRow227TriangleData0689.coefficient46_281,
  OriginalRow227TriangleData0689.coefficient46_282,
  OriginalRow227TriangleData0689.coefficient46_283,
  OriginalRow227TriangleData0689.coefficient46_284,
  OriginalRow227TriangleData0689.coefficient46_285,
  OriginalRow227TriangleData0689.coefficient46_286,
  OriginalRow227TriangleData0689.coefficient46_287,
  OriginalRow227TriangleData0689.coefficient46_288,
  OriginalRow227TriangleData0689.coefficient46_289,
  OriginalRow227TriangleData0689.coefficient46_290,
  OriginalRow227TriangleData0689.coefficient46_291,
  OriginalRow227TriangleData0689.coefficient46_292,
  OriginalRow227TriangleData0689.coefficient46_293,
  OriginalRow227TriangleData0689.coefficient46_294,
  OriginalRow227TriangleData0689.coefficient46_295,
  OriginalRow227TriangleData0689.coefficient46_296,
  OriginalRow227TriangleData0689.coefficient46_297,
  OriginalRow227TriangleData0689.coefficient46_298,
  OriginalRow227TriangleData0689.coefficient46_299,
  OriginalRow227TriangleData0689.coefficient46_300
]

theorem values0689_size : values0689.size = 32 := rfl

def block0689 : ℕ → Option IntervalDyadic := segment 269 values0689

theorem block0689_domain : ExactDomain block0689 269 301 := by
  simpa only [values0689_size] using segment_domain 269 values0689

theorem block0689_get (i : Fin 32) :
    block0689 (269 + i.val) = some (values0689[i.val]'(by rw [values0689_size]; exact i.isLt)) := by
  exact segment_get 269 values0689 ⟨i.val, by rw [values0689_size]; exact i.isLt⟩

def values0690 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0690.coefficient46_301,
  OriginalRow227TriangleData0690.coefficient46_302,
  OriginalRow227TriangleData0690.coefficient46_303,
  OriginalRow227TriangleData0690.coefficient46_304,
  OriginalRow227TriangleData0690.coefficient46_305,
  OriginalRow227TriangleData0690.coefficient46_306,
  OriginalRow227TriangleData0690.coefficient46_307,
  OriginalRow227TriangleData0690.coefficient46_308,
  OriginalRow227TriangleData0690.coefficient46_309,
  OriginalRow227TriangleData0690.coefficient46_310,
  OriginalRow227TriangleData0690.coefficient46_311,
  OriginalRow227TriangleData0690.coefficient46_312,
  OriginalRow227TriangleData0690.coefficient46_313,
  OriginalRow227TriangleData0690.coefficient46_314,
  OriginalRow227TriangleData0690.coefficient46_315,
  OriginalRow227TriangleData0690.coefficient46_316,
  OriginalRow227TriangleData0690.coefficient46_317,
  OriginalRow227TriangleData0690.coefficient46_318,
  OriginalRow227TriangleData0690.coefficient46_319,
  OriginalRow227TriangleData0690.coefficient46_320,
  OriginalRow227TriangleData0690.coefficient46_321,
  OriginalRow227TriangleData0690.coefficient46_322,
  OriginalRow227TriangleData0690.coefficient46_323,
  OriginalRow227TriangleData0690.coefficient46_324,
  OriginalRow227TriangleData0690.coefficient46_325,
  OriginalRow227TriangleData0690.coefficient46_326,
  OriginalRow227TriangleData0690.coefficient46_327,
  OriginalRow227TriangleData0690.coefficient46_328,
  OriginalRow227TriangleData0690.coefficient46_329,
  OriginalRow227TriangleData0690.coefficient46_330,
  OriginalRow227TriangleData0690.coefficient46_331,
  OriginalRow227TriangleData0690.coefficient46_332
]

theorem values0690_size : values0690.size = 32 := rfl

def block0690 : ℕ → Option IntervalDyadic := segment 301 values0690

theorem block0690_domain : ExactDomain block0690 301 333 := by
  simpa only [values0690_size] using segment_domain 301 values0690

theorem block0690_get (i : Fin 32) :
    block0690 (301 + i.val) = some (values0690[i.val]'(by rw [values0690_size]; exact i.isLt)) := by
  exact segment_get 301 values0690 ⟨i.val, by rw [values0690_size]; exact i.isLt⟩

def values0691 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0691.coefficient46_333,
  OriginalRow227TriangleData0691.coefficient46_334,
  OriginalRow227TriangleData0691.coefficient46_335,
  OriginalRow227TriangleData0691.coefficient46_336,
  OriginalRow227TriangleData0691.coefficient46_337,
  OriginalRow227TriangleData0691.coefficient46_338,
  OriginalRow227TriangleData0691.coefficient46_339,
  OriginalRow227TriangleData0691.coefficient46_340,
  OriginalRow227TriangleData0691.coefficient46_341,
  OriginalRow227TriangleData0691.coefficient46_342,
  OriginalRow227TriangleData0691.coefficient46_343,
  OriginalRow227TriangleData0691.coefficient46_344,
  OriginalRow227TriangleData0691.coefficient46_345,
  OriginalRow227TriangleData0691.coefficient46_346,
  OriginalRow227TriangleData0691.coefficient46_347,
  OriginalRow227TriangleData0691.coefficient46_348,
  OriginalRow227TriangleData0691.coefficient46_349,
  OriginalRow227TriangleData0691.coefficient46_350,
  OriginalRow227TriangleData0691.coefficient46_351,
  OriginalRow227TriangleData0691.coefficient46_352,
  OriginalRow227TriangleData0691.coefficient46_353,
  OriginalRow227TriangleData0691.coefficient46_354,
  OriginalRow227TriangleData0691.coefficient46_355,
  OriginalRow227TriangleData0691.coefficient46_356,
  OriginalRow227TriangleData0691.coefficient46_357,
  OriginalRow227TriangleData0691.coefficient46_358,
  OriginalRow227TriangleData0691.coefficient46_359,
  OriginalRow227TriangleData0691.coefficient46_360,
  OriginalRow227TriangleData0691.coefficient46_361,
  OriginalRow227TriangleData0691.coefficient46_362,
  OriginalRow227TriangleData0691.coefficient46_363,
  OriginalRow227TriangleData0691.coefficient46_364
]

theorem values0691_size : values0691.size = 32 := rfl

def block0691 : ℕ → Option IntervalDyadic := segment 333 values0691

theorem block0691_domain : ExactDomain block0691 333 365 := by
  simpa only [values0691_size] using segment_domain 333 values0691

theorem block0691_get (i : Fin 32) :
    block0691 (333 + i.val) = some (values0691[i.val]'(by rw [values0691_size]; exact i.isLt)) := by
  exact segment_get 333 values0691 ⟨i.val, by rw [values0691_size]; exact i.isLt⟩

def values0692 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0692.coefficient46_365,
  OriginalRow227TriangleData0692.coefficient46_366,
  OriginalRow227TriangleData0692.coefficient46_367,
  OriginalRow227TriangleData0692.coefficient46_368,
  OriginalRow227TriangleData0692.coefficient46_369,
  OriginalRow227TriangleData0692.coefficient46_370,
  OriginalRow227TriangleData0692.coefficient46_371,
  OriginalRow227TriangleData0692.coefficient46_372,
  OriginalRow227TriangleData0692.coefficient46_373,
  OriginalRow227TriangleData0692.coefficient46_374,
  OriginalRow227TriangleData0692.coefficient46_375,
  OriginalRow227TriangleData0692.coefficient46_376,
  OriginalRow227TriangleData0692.coefficient46_377,
  OriginalRow227TriangleData0692.coefficient46_378,
  OriginalRow227TriangleData0692.coefficient46_379,
  OriginalRow227TriangleData0692.coefficient46_380,
  OriginalRow227TriangleData0692.coefficient46_381,
  OriginalRow227TriangleData0692.coefficient46_382,
  OriginalRow227TriangleData0692.coefficient46_383,
  OriginalRow227TriangleData0692.coefficient46_384,
  OriginalRow227TriangleData0692.coefficient46_385,
  OriginalRow227TriangleData0692.coefficient46_386,
  OriginalRow227TriangleData0692.coefficient46_387,
  OriginalRow227TriangleData0692.coefficient46_388,
  OriginalRow227TriangleData0692.coefficient46_389,
  OriginalRow227TriangleData0692.coefficient46_390,
  OriginalRow227TriangleData0692.coefficient46_391,
  OriginalRow227TriangleData0692.coefficient46_392,
  OriginalRow227TriangleData0692.coefficient46_393,
  OriginalRow227TriangleData0692.coefficient46_394,
  OriginalRow227TriangleData0692.coefficient46_395,
  OriginalRow227TriangleData0692.coefficient46_396
]

theorem values0692_size : values0692.size = 32 := rfl

def block0692 : ℕ → Option IntervalDyadic := segment 365 values0692

theorem block0692_domain : ExactDomain block0692 365 397 := by
  simpa only [values0692_size] using segment_domain 365 values0692

theorem block0692_get (i : Fin 32) :
    block0692 (365 + i.val) = some (values0692[i.val]'(by rw [values0692_size]; exact i.isLt)) := by
  exact segment_get 365 values0692 ⟨i.val, by rw [values0692_size]; exact i.isLt⟩

def values0693 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0693.coefficient46_397,
  OriginalRow227TriangleData0693.coefficient46_398,
  OriginalRow227TriangleData0693.coefficient46_399,
  OriginalRow227TriangleData0693.coefficient46_400,
  OriginalRow227TriangleData0693.coefficient46_401,
  OriginalRow227TriangleData0693.coefficient46_402,
  OriginalRow227TriangleData0693.coefficient46_403,
  OriginalRow227TriangleData0693.coefficient46_404,
  OriginalRow227TriangleData0693.coefficient46_405,
  OriginalRow227TriangleData0693.coefficient46_406,
  OriginalRow227TriangleData0693.coefficient46_407,
  OriginalRow227TriangleData0693.coefficient46_408,
  OriginalRow227TriangleData0693.coefficient46_409,
  OriginalRow227TriangleData0693.coefficient46_410,
  OriginalRow227TriangleData0693.coefficient46_411,
  OriginalRow227TriangleData0693.coefficient46_412,
  OriginalRow227TriangleData0693.coefficient46_413,
  OriginalRow227TriangleData0693.coefficient46_414,
  OriginalRow227TriangleData0693.coefficient46_415,
  OriginalRow227TriangleData0693.coefficient46_416,
  OriginalRow227TriangleData0693.coefficient46_417,
  OriginalRow227TriangleData0693.coefficient46_418,
  OriginalRow227TriangleData0693.coefficient46_419,
  OriginalRow227TriangleData0693.coefficient46_420,
  OriginalRow227TriangleData0693.coefficient46_421,
  OriginalRow227TriangleData0693.coefficient46_422,
  OriginalRow227TriangleData0693.coefficient46_423,
  OriginalRow227TriangleData0693.coefficient46_424,
  OriginalRow227TriangleData0693.coefficient46_425,
  OriginalRow227TriangleData0693.coefficient46_426,
  OriginalRow227TriangleData0693.coefficient46_427,
  OriginalRow227TriangleData0693.coefficient46_428
]

theorem values0693_size : values0693.size = 32 := rfl

def block0693 : ℕ → Option IntervalDyadic := segment 397 values0693

theorem block0693_domain : ExactDomain block0693 397 429 := by
  simpa only [values0693_size] using segment_domain 397 values0693

theorem block0693_get (i : Fin 32) :
    block0693 (397 + i.val) = some (values0693[i.val]'(by rw [values0693_size]; exact i.isLt)) := by
  exact segment_get 397 values0693 ⟨i.val, by rw [values0693_size]; exact i.isLt⟩

def values0694 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0694.coefficient46_429,
  OriginalRow227TriangleData0694.coefficient46_430,
  OriginalRow227TriangleData0694.coefficient46_431,
  OriginalRow227TriangleData0694.coefficient46_432,
  OriginalRow227TriangleData0694.coefficient46_433,
  OriginalRow227TriangleData0694.coefficient46_434,
  OriginalRow227TriangleData0694.coefficient46_435,
  OriginalRow227TriangleData0694.coefficient46_436,
  OriginalRow227TriangleData0694.coefficient46_437,
  OriginalRow227TriangleData0694.coefficient46_438,
  OriginalRow227TriangleData0694.coefficient46_439,
  OriginalRow227TriangleData0694.coefficient46_440,
  OriginalRow227TriangleData0694.coefficient46_441,
  OriginalRow227TriangleData0694.coefficient46_442,
  OriginalRow227TriangleData0694.coefficient46_443,
  OriginalRow227TriangleData0694.coefficient46_444,
  OriginalRow227TriangleData0694.coefficient46_445,
  OriginalRow227TriangleData0694.coefficient46_446,
  OriginalRow227TriangleData0694.coefficient46_447,
  OriginalRow227TriangleData0694.coefficient46_448,
  OriginalRow227TriangleData0694.coefficient46_449,
  OriginalRow227TriangleData0694.coefficient46_450,
  OriginalRow227TriangleData0694.coefficient46_451,
  OriginalRow227TriangleData0694.coefficient46_452,
  OriginalRow227TriangleData0694.coefficient46_453,
  OriginalRow227TriangleData0694.coefficient46_454,
  OriginalRow227TriangleData0694.coefficient46_455
]

theorem values0694_size : values0694.size = 27 := rfl

def block0694 : ℕ → Option IntervalDyadic := segment 429 values0694

theorem block0694_domain : ExactDomain block0694 429 456 := by
  simpa only [values0694_size] using segment_domain 429 values0694

theorem block0694_get (i : Fin 27) :
    block0694 (429 + i.val) = some (values0694[i.val]'(by rw [values0694_size]; exact i.isLt)) := by
  exact segment_get 429 values0694 ⟨i.val, by rw [values0694_size]; exact i.isLt⟩

def node0077_0141 : ℕ → Option IntervalDyadic := split 109 block0683 block0684

theorem node0077_0141_domain : ExactDomain node0077_0141 77 141 := by
  exact split_domain (by decide) (by decide) block0683_domain block0684_domain

def node0045_0141 : ℕ → Option IntervalDyadic := split 77 block0682 node0077_0141

theorem node0045_0141_domain : ExactDomain node0045_0141 45 141 := by
  exact split_domain (by decide) (by decide) block0682_domain node0077_0141_domain

def node0173_0237 : ℕ → Option IntervalDyadic := split 205 block0686 block0687

theorem node0173_0237_domain : ExactDomain node0173_0237 173 237 := by
  exact split_domain (by decide) (by decide) block0686_domain block0687_domain

def node0141_0237 : ℕ → Option IntervalDyadic := split 173 block0685 node0173_0237

theorem node0141_0237_domain : ExactDomain node0141_0237 141 237 := by
  exact split_domain (by decide) (by decide) block0685_domain node0173_0237_domain

def node0045_0237 : ℕ → Option IntervalDyadic := split 141 node0045_0141 node0141_0237

theorem node0045_0237_domain : ExactDomain node0045_0237 45 237 := by
  exact split_domain (by decide) (by decide) node0045_0141_domain node0141_0237_domain

def node0269_0333 : ℕ → Option IntervalDyadic := split 301 block0689 block0690

theorem node0269_0333_domain : ExactDomain node0269_0333 269 333 := by
  exact split_domain (by decide) (by decide) block0689_domain block0690_domain

def node0237_0333 : ℕ → Option IntervalDyadic := split 269 block0688 node0269_0333

theorem node0237_0333_domain : ExactDomain node0237_0333 237 333 := by
  exact split_domain (by decide) (by decide) block0688_domain node0269_0333_domain

def node0333_0397 : ℕ → Option IntervalDyadic := split 365 block0691 block0692

theorem node0333_0397_domain : ExactDomain node0333_0397 333 397 := by
  exact split_domain (by decide) (by decide) block0691_domain block0692_domain

def node0397_0456 : ℕ → Option IntervalDyadic := split 429 block0693 block0694

theorem node0397_0456_domain : ExactDomain node0397_0456 397 456 := by
  exact split_domain (by decide) (by decide) block0693_domain block0694_domain

def node0333_0456 : ℕ → Option IntervalDyadic := split 397 node0333_0397 node0397_0456

theorem node0333_0456_domain : ExactDomain node0333_0456 333 456 := by
  exact split_domain (by decide) (by decide) node0333_0397_domain node0397_0456_domain

def node0237_0456 : ℕ → Option IntervalDyadic := split 333 node0237_0333 node0333_0456

theorem node0237_0456_domain : ExactDomain node0237_0456 237 456 := by
  exact split_domain (by decide) (by decide) node0237_0333_domain node0333_0456_domain

def node0045_0456 : ℕ → Option IntervalDyadic := split 237 node0045_0237 node0237_0456

theorem node0045_0456_domain : ExactDomain node0045_0456 45 456 := by
  exact split_domain (by decide) (by decide) node0045_0237_domain node0237_0456_domain

def lookup : ℕ → Option IntervalDyadic := node0045_0456

theorem lookup_domain : ExactDomain lookup 45 456 :=
  node0045_0456_domain

theorem block0682_lookup (i : Fin 32) :
    lookup (45 + i.val) = some (values0682[i.val]'(by rw [values0682_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (45 + i.val) = _
  rw [node0045_0456, split_left 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0045_0237, split_left 141 node0045_0141 node0141_0237 (by omega)]
  rw [node0045_0141, split_left 77 block0682 node0077_0141 (by omega)]
  exact block0682_get i

theorem block0683_lookup (i : Fin 32) :
    lookup (77 + i.val) = some (values0683[i.val]'(by rw [values0683_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (77 + i.val) = _
  rw [node0045_0456, split_left 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0045_0237, split_left 141 node0045_0141 node0141_0237 (by omega)]
  rw [node0045_0141, split_right 77 block0682 node0077_0141 (by omega)]
  rw [node0077_0141, split_left 109 block0683 block0684 (by omega)]
  exact block0683_get i

theorem block0684_lookup (i : Fin 32) :
    lookup (109 + i.val) = some (values0684[i.val]'(by rw [values0684_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (109 + i.val) = _
  rw [node0045_0456, split_left 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0045_0237, split_left 141 node0045_0141 node0141_0237 (by omega)]
  rw [node0045_0141, split_right 77 block0682 node0077_0141 (by omega)]
  rw [node0077_0141, split_right 109 block0683 block0684 (by omega)]
  exact block0684_get i

theorem block0685_lookup (i : Fin 32) :
    lookup (141 + i.val) = some (values0685[i.val]'(by rw [values0685_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (141 + i.val) = _
  rw [node0045_0456, split_left 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0045_0237, split_right 141 node0045_0141 node0141_0237 (by omega)]
  rw [node0141_0237, split_left 173 block0685 node0173_0237 (by omega)]
  exact block0685_get i

theorem block0686_lookup (i : Fin 32) :
    lookup (173 + i.val) = some (values0686[i.val]'(by rw [values0686_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (173 + i.val) = _
  rw [node0045_0456, split_left 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0045_0237, split_right 141 node0045_0141 node0141_0237 (by omega)]
  rw [node0141_0237, split_right 173 block0685 node0173_0237 (by omega)]
  rw [node0173_0237, split_left 205 block0686 block0687 (by omega)]
  exact block0686_get i

theorem block0687_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values0687[i.val]'(by rw [values0687_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (205 + i.val) = _
  rw [node0045_0456, split_left 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0045_0237, split_right 141 node0045_0141 node0141_0237 (by omega)]
  rw [node0141_0237, split_right 173 block0685 node0173_0237 (by omega)]
  rw [node0173_0237, split_right 205 block0686 block0687 (by omega)]
  exact block0687_get i

theorem block0688_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values0688[i.val]'(by rw [values0688_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (237 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_left 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0237_0333, split_left 269 block0688 node0269_0333 (by omega)]
  exact block0688_get i

theorem block0689_lookup (i : Fin 32) :
    lookup (269 + i.val) = some (values0689[i.val]'(by rw [values0689_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (269 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_left 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0237_0333, split_right 269 block0688 node0269_0333 (by omega)]
  rw [node0269_0333, split_left 301 block0689 block0690 (by omega)]
  exact block0689_get i

theorem block0690_lookup (i : Fin 32) :
    lookup (301 + i.val) = some (values0690[i.val]'(by rw [values0690_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (301 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_left 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0237_0333, split_right 269 block0688 node0269_0333 (by omega)]
  rw [node0269_0333, split_right 301 block0689 block0690 (by omega)]
  exact block0690_get i

theorem block0691_lookup (i : Fin 32) :
    lookup (333 + i.val) = some (values0691[i.val]'(by rw [values0691_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (333 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_right 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0333_0456, split_left 397 node0333_0397 node0397_0456 (by omega)]
  rw [node0333_0397, split_left 365 block0691 block0692 (by omega)]
  exact block0691_get i

theorem block0692_lookup (i : Fin 32) :
    lookup (365 + i.val) = some (values0692[i.val]'(by rw [values0692_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (365 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_right 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0333_0456, split_left 397 node0333_0397 node0397_0456 (by omega)]
  rw [node0333_0397, split_right 365 block0691 block0692 (by omega)]
  exact block0692_get i

theorem block0693_lookup (i : Fin 32) :
    lookup (397 + i.val) = some (values0693[i.val]'(by rw [values0693_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (397 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_right 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0333_0456, split_right 397 node0333_0397 node0397_0456 (by omega)]
  rw [node0397_0456, split_left 429 block0693 block0694 (by omega)]
  exact block0693_get i

theorem block0694_lookup (i : Fin 27) :
    lookup (429 + i.val) = some (values0694[i.val]'(by rw [values0694_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0045_0456 (429 + i.val) = _
  rw [node0045_0456, split_right 237 node0045_0237 node0237_0456 (by omega)]
  rw [node0237_0456, split_right 333 node0237_0333 node0333_0456 (by omega)]
  rw [node0333_0456, split_right 397 node0333_0397 node0397_0456 (by omega)]
  rw [node0397_0456, split_right 429 block0693 block0694 (by omega)]
  exact block0694_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0682_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0682_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0683_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0683_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0684_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0684_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0685_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0685_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0686_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0686_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0687_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0687_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0688_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0688_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0689_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0689_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0690_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0690_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0691_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0691_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0692_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0692_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0693_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0693_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0694_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0694_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0682_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0683_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0684_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0685_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0686_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0687_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0688_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0689_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0690_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0691_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0692_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0693_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow046.block0694_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow046
