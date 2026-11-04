import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0786
import Grothe.UpperChaos.OriginalRow227TriangleData0787
import Grothe.UpperChaos.OriginalRow227TriangleData0788
import Grothe.UpperChaos.OriginalRow227TriangleData0789
import Grothe.UpperChaos.OriginalRow227TriangleData0790
import Grothe.UpperChaos.OriginalRow227TriangleData0791
import Grothe.UpperChaos.OriginalRow227TriangleData0792
import Grothe.UpperChaos.OriginalRow227TriangleData0793
import Grothe.UpperChaos.OriginalRow227TriangleData0794
import Grothe.UpperChaos.OriginalRow227TriangleData0795
import Grothe.UpperChaos.OriginalRow227TriangleData0796
import Grothe.UpperChaos.OriginalRow227TriangleData0797
import Grothe.UpperChaos.OriginalRow227TriangleData0798

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow054

open ConditionalTableLookup

def values0786 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0786.coefficient54_53,
  OriginalRow227TriangleData0786.coefficient54_54,
  OriginalRow227TriangleData0786.coefficient54_55,
  OriginalRow227TriangleData0786.coefficient54_56,
  OriginalRow227TriangleData0786.coefficient54_57,
  OriginalRow227TriangleData0786.coefficient54_58,
  OriginalRow227TriangleData0786.coefficient54_59,
  OriginalRow227TriangleData0786.coefficient54_60,
  OriginalRow227TriangleData0786.coefficient54_61,
  OriginalRow227TriangleData0786.coefficient54_62,
  OriginalRow227TriangleData0786.coefficient54_63,
  OriginalRow227TriangleData0786.coefficient54_64,
  OriginalRow227TriangleData0786.coefficient54_65,
  OriginalRow227TriangleData0786.coefficient54_66,
  OriginalRow227TriangleData0786.coefficient54_67,
  OriginalRow227TriangleData0786.coefficient54_68,
  OriginalRow227TriangleData0786.coefficient54_69,
  OriginalRow227TriangleData0786.coefficient54_70,
  OriginalRow227TriangleData0786.coefficient54_71,
  OriginalRow227TriangleData0786.coefficient54_72,
  OriginalRow227TriangleData0786.coefficient54_73,
  OriginalRow227TriangleData0786.coefficient54_74,
  OriginalRow227TriangleData0786.coefficient54_75,
  OriginalRow227TriangleData0786.coefficient54_76,
  OriginalRow227TriangleData0786.coefficient54_77,
  OriginalRow227TriangleData0786.coefficient54_78,
  OriginalRow227TriangleData0786.coefficient54_79,
  OriginalRow227TriangleData0786.coefficient54_80,
  OriginalRow227TriangleData0786.coefficient54_81,
  OriginalRow227TriangleData0786.coefficient54_82,
  OriginalRow227TriangleData0786.coefficient54_83,
  OriginalRow227TriangleData0786.coefficient54_84
]

theorem values0786_size : values0786.size = 32 := rfl

def block0786 : ℕ → Option IntervalDyadic := segment 53 values0786

theorem block0786_domain : ExactDomain block0786 53 85 := by
  simpa only [values0786_size] using segment_domain 53 values0786

theorem block0786_get (i : Fin 32) :
    block0786 (53 + i.val) = some (values0786[i.val]'(by rw [values0786_size]; exact i.isLt)) := by
  exact segment_get 53 values0786 ⟨i.val, by rw [values0786_size]; exact i.isLt⟩

def values0787 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0787.coefficient54_85,
  OriginalRow227TriangleData0787.coefficient54_86,
  OriginalRow227TriangleData0787.coefficient54_87,
  OriginalRow227TriangleData0787.coefficient54_88,
  OriginalRow227TriangleData0787.coefficient54_89,
  OriginalRow227TriangleData0787.coefficient54_90,
  OriginalRow227TriangleData0787.coefficient54_91,
  OriginalRow227TriangleData0787.coefficient54_92,
  OriginalRow227TriangleData0787.coefficient54_93,
  OriginalRow227TriangleData0787.coefficient54_94,
  OriginalRow227TriangleData0787.coefficient54_95,
  OriginalRow227TriangleData0787.coefficient54_96,
  OriginalRow227TriangleData0787.coefficient54_97,
  OriginalRow227TriangleData0787.coefficient54_98,
  OriginalRow227TriangleData0787.coefficient54_99,
  OriginalRow227TriangleData0787.coefficient54_100,
  OriginalRow227TriangleData0787.coefficient54_101,
  OriginalRow227TriangleData0787.coefficient54_102,
  OriginalRow227TriangleData0787.coefficient54_103,
  OriginalRow227TriangleData0787.coefficient54_104,
  OriginalRow227TriangleData0787.coefficient54_105,
  OriginalRow227TriangleData0787.coefficient54_106,
  OriginalRow227TriangleData0787.coefficient54_107,
  OriginalRow227TriangleData0787.coefficient54_108,
  OriginalRow227TriangleData0787.coefficient54_109,
  OriginalRow227TriangleData0787.coefficient54_110,
  OriginalRow227TriangleData0787.coefficient54_111,
  OriginalRow227TriangleData0787.coefficient54_112,
  OriginalRow227TriangleData0787.coefficient54_113,
  OriginalRow227TriangleData0787.coefficient54_114,
  OriginalRow227TriangleData0787.coefficient54_115,
  OriginalRow227TriangleData0787.coefficient54_116
]

theorem values0787_size : values0787.size = 32 := rfl

def block0787 : ℕ → Option IntervalDyadic := segment 85 values0787

theorem block0787_domain : ExactDomain block0787 85 117 := by
  simpa only [values0787_size] using segment_domain 85 values0787

theorem block0787_get (i : Fin 32) :
    block0787 (85 + i.val) = some (values0787[i.val]'(by rw [values0787_size]; exact i.isLt)) := by
  exact segment_get 85 values0787 ⟨i.val, by rw [values0787_size]; exact i.isLt⟩

def values0788 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0788.coefficient54_117,
  OriginalRow227TriangleData0788.coefficient54_118,
  OriginalRow227TriangleData0788.coefficient54_119,
  OriginalRow227TriangleData0788.coefficient54_120,
  OriginalRow227TriangleData0788.coefficient54_121,
  OriginalRow227TriangleData0788.coefficient54_122,
  OriginalRow227TriangleData0788.coefficient54_123,
  OriginalRow227TriangleData0788.coefficient54_124,
  OriginalRow227TriangleData0788.coefficient54_125,
  OriginalRow227TriangleData0788.coefficient54_126,
  OriginalRow227TriangleData0788.coefficient54_127,
  OriginalRow227TriangleData0788.coefficient54_128,
  OriginalRow227TriangleData0788.coefficient54_129,
  OriginalRow227TriangleData0788.coefficient54_130,
  OriginalRow227TriangleData0788.coefficient54_131,
  OriginalRow227TriangleData0788.coefficient54_132,
  OriginalRow227TriangleData0788.coefficient54_133,
  OriginalRow227TriangleData0788.coefficient54_134,
  OriginalRow227TriangleData0788.coefficient54_135,
  OriginalRow227TriangleData0788.coefficient54_136,
  OriginalRow227TriangleData0788.coefficient54_137,
  OriginalRow227TriangleData0788.coefficient54_138,
  OriginalRow227TriangleData0788.coefficient54_139,
  OriginalRow227TriangleData0788.coefficient54_140,
  OriginalRow227TriangleData0788.coefficient54_141,
  OriginalRow227TriangleData0788.coefficient54_142,
  OriginalRow227TriangleData0788.coefficient54_143,
  OriginalRow227TriangleData0788.coefficient54_144,
  OriginalRow227TriangleData0788.coefficient54_145,
  OriginalRow227TriangleData0788.coefficient54_146,
  OriginalRow227TriangleData0788.coefficient54_147,
  OriginalRow227TriangleData0788.coefficient54_148
]

theorem values0788_size : values0788.size = 32 := rfl

def block0788 : ℕ → Option IntervalDyadic := segment 117 values0788

theorem block0788_domain : ExactDomain block0788 117 149 := by
  simpa only [values0788_size] using segment_domain 117 values0788

theorem block0788_get (i : Fin 32) :
    block0788 (117 + i.val) = some (values0788[i.val]'(by rw [values0788_size]; exact i.isLt)) := by
  exact segment_get 117 values0788 ⟨i.val, by rw [values0788_size]; exact i.isLt⟩

def values0789 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0789.coefficient54_149,
  OriginalRow227TriangleData0789.coefficient54_150,
  OriginalRow227TriangleData0789.coefficient54_151,
  OriginalRow227TriangleData0789.coefficient54_152,
  OriginalRow227TriangleData0789.coefficient54_153,
  OriginalRow227TriangleData0789.coefficient54_154,
  OriginalRow227TriangleData0789.coefficient54_155,
  OriginalRow227TriangleData0789.coefficient54_156,
  OriginalRow227TriangleData0789.coefficient54_157,
  OriginalRow227TriangleData0789.coefficient54_158,
  OriginalRow227TriangleData0789.coefficient54_159,
  OriginalRow227TriangleData0789.coefficient54_160,
  OriginalRow227TriangleData0789.coefficient54_161,
  OriginalRow227TriangleData0789.coefficient54_162,
  OriginalRow227TriangleData0789.coefficient54_163,
  OriginalRow227TriangleData0789.coefficient54_164,
  OriginalRow227TriangleData0789.coefficient54_165,
  OriginalRow227TriangleData0789.coefficient54_166,
  OriginalRow227TriangleData0789.coefficient54_167,
  OriginalRow227TriangleData0789.coefficient54_168,
  OriginalRow227TriangleData0789.coefficient54_169,
  OriginalRow227TriangleData0789.coefficient54_170,
  OriginalRow227TriangleData0789.coefficient54_171,
  OriginalRow227TriangleData0789.coefficient54_172,
  OriginalRow227TriangleData0789.coefficient54_173,
  OriginalRow227TriangleData0789.coefficient54_174,
  OriginalRow227TriangleData0789.coefficient54_175,
  OriginalRow227TriangleData0789.coefficient54_176,
  OriginalRow227TriangleData0789.coefficient54_177,
  OriginalRow227TriangleData0789.coefficient54_178,
  OriginalRow227TriangleData0789.coefficient54_179,
  OriginalRow227TriangleData0789.coefficient54_180
]

theorem values0789_size : values0789.size = 32 := rfl

def block0789 : ℕ → Option IntervalDyadic := segment 149 values0789

theorem block0789_domain : ExactDomain block0789 149 181 := by
  simpa only [values0789_size] using segment_domain 149 values0789

theorem block0789_get (i : Fin 32) :
    block0789 (149 + i.val) = some (values0789[i.val]'(by rw [values0789_size]; exact i.isLt)) := by
  exact segment_get 149 values0789 ⟨i.val, by rw [values0789_size]; exact i.isLt⟩

def values0790 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0790.coefficient54_181,
  OriginalRow227TriangleData0790.coefficient54_182,
  OriginalRow227TriangleData0790.coefficient54_183,
  OriginalRow227TriangleData0790.coefficient54_184,
  OriginalRow227TriangleData0790.coefficient54_185,
  OriginalRow227TriangleData0790.coefficient54_186,
  OriginalRow227TriangleData0790.coefficient54_187,
  OriginalRow227TriangleData0790.coefficient54_188,
  OriginalRow227TriangleData0790.coefficient54_189,
  OriginalRow227TriangleData0790.coefficient54_190,
  OriginalRow227TriangleData0790.coefficient54_191,
  OriginalRow227TriangleData0790.coefficient54_192,
  OriginalRow227TriangleData0790.coefficient54_193,
  OriginalRow227TriangleData0790.coefficient54_194,
  OriginalRow227TriangleData0790.coefficient54_195,
  OriginalRow227TriangleData0790.coefficient54_196,
  OriginalRow227TriangleData0790.coefficient54_197,
  OriginalRow227TriangleData0790.coefficient54_198,
  OriginalRow227TriangleData0790.coefficient54_199,
  OriginalRow227TriangleData0790.coefficient54_200,
  OriginalRow227TriangleData0790.coefficient54_201,
  OriginalRow227TriangleData0790.coefficient54_202,
  OriginalRow227TriangleData0790.coefficient54_203,
  OriginalRow227TriangleData0790.coefficient54_204,
  OriginalRow227TriangleData0790.coefficient54_205,
  OriginalRow227TriangleData0790.coefficient54_206,
  OriginalRow227TriangleData0790.coefficient54_207,
  OriginalRow227TriangleData0790.coefficient54_208,
  OriginalRow227TriangleData0790.coefficient54_209,
  OriginalRow227TriangleData0790.coefficient54_210,
  OriginalRow227TriangleData0790.coefficient54_211,
  OriginalRow227TriangleData0790.coefficient54_212
]

theorem values0790_size : values0790.size = 32 := rfl

def block0790 : ℕ → Option IntervalDyadic := segment 181 values0790

theorem block0790_domain : ExactDomain block0790 181 213 := by
  simpa only [values0790_size] using segment_domain 181 values0790

theorem block0790_get (i : Fin 32) :
    block0790 (181 + i.val) = some (values0790[i.val]'(by rw [values0790_size]; exact i.isLt)) := by
  exact segment_get 181 values0790 ⟨i.val, by rw [values0790_size]; exact i.isLt⟩

def values0791 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0791.coefficient54_213,
  OriginalRow227TriangleData0791.coefficient54_214,
  OriginalRow227TriangleData0791.coefficient54_215,
  OriginalRow227TriangleData0791.coefficient54_216,
  OriginalRow227TriangleData0791.coefficient54_217,
  OriginalRow227TriangleData0791.coefficient54_218,
  OriginalRow227TriangleData0791.coefficient54_219,
  OriginalRow227TriangleData0791.coefficient54_220,
  OriginalRow227TriangleData0791.coefficient54_221,
  OriginalRow227TriangleData0791.coefficient54_222,
  OriginalRow227TriangleData0791.coefficient54_223,
  OriginalRow227TriangleData0791.coefficient54_224,
  OriginalRow227TriangleData0791.coefficient54_225,
  OriginalRow227TriangleData0791.coefficient54_226,
  OriginalRow227TriangleData0791.coefficient54_227,
  OriginalRow227TriangleData0791.coefficient54_228,
  OriginalRow227TriangleData0791.coefficient54_229,
  OriginalRow227TriangleData0791.coefficient54_230,
  OriginalRow227TriangleData0791.coefficient54_231,
  OriginalRow227TriangleData0791.coefficient54_232,
  OriginalRow227TriangleData0791.coefficient54_233,
  OriginalRow227TriangleData0791.coefficient54_234,
  OriginalRow227TriangleData0791.coefficient54_235,
  OriginalRow227TriangleData0791.coefficient54_236,
  OriginalRow227TriangleData0791.coefficient54_237,
  OriginalRow227TriangleData0791.coefficient54_238,
  OriginalRow227TriangleData0791.coefficient54_239,
  OriginalRow227TriangleData0791.coefficient54_240,
  OriginalRow227TriangleData0791.coefficient54_241,
  OriginalRow227TriangleData0791.coefficient54_242,
  OriginalRow227TriangleData0791.coefficient54_243,
  OriginalRow227TriangleData0791.coefficient54_244
]

theorem values0791_size : values0791.size = 32 := rfl

def block0791 : ℕ → Option IntervalDyadic := segment 213 values0791

theorem block0791_domain : ExactDomain block0791 213 245 := by
  simpa only [values0791_size] using segment_domain 213 values0791

theorem block0791_get (i : Fin 32) :
    block0791 (213 + i.val) = some (values0791[i.val]'(by rw [values0791_size]; exact i.isLt)) := by
  exact segment_get 213 values0791 ⟨i.val, by rw [values0791_size]; exact i.isLt⟩

def values0792 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0792.coefficient54_245,
  OriginalRow227TriangleData0792.coefficient54_246,
  OriginalRow227TriangleData0792.coefficient54_247,
  OriginalRow227TriangleData0792.coefficient54_248,
  OriginalRow227TriangleData0792.coefficient54_249,
  OriginalRow227TriangleData0792.coefficient54_250,
  OriginalRow227TriangleData0792.coefficient54_251,
  OriginalRow227TriangleData0792.coefficient54_252,
  OriginalRow227TriangleData0792.coefficient54_253,
  OriginalRow227TriangleData0792.coefficient54_254,
  OriginalRow227TriangleData0792.coefficient54_255,
  OriginalRow227TriangleData0792.coefficient54_256,
  OriginalRow227TriangleData0792.coefficient54_257,
  OriginalRow227TriangleData0792.coefficient54_258,
  OriginalRow227TriangleData0792.coefficient54_259,
  OriginalRow227TriangleData0792.coefficient54_260,
  OriginalRow227TriangleData0792.coefficient54_261,
  OriginalRow227TriangleData0792.coefficient54_262,
  OriginalRow227TriangleData0792.coefficient54_263,
  OriginalRow227TriangleData0792.coefficient54_264,
  OriginalRow227TriangleData0792.coefficient54_265,
  OriginalRow227TriangleData0792.coefficient54_266,
  OriginalRow227TriangleData0792.coefficient54_267,
  OriginalRow227TriangleData0792.coefficient54_268,
  OriginalRow227TriangleData0792.coefficient54_269,
  OriginalRow227TriangleData0792.coefficient54_270,
  OriginalRow227TriangleData0792.coefficient54_271,
  OriginalRow227TriangleData0792.coefficient54_272,
  OriginalRow227TriangleData0792.coefficient54_273,
  OriginalRow227TriangleData0792.coefficient54_274,
  OriginalRow227TriangleData0792.coefficient54_275,
  OriginalRow227TriangleData0792.coefficient54_276
]

theorem values0792_size : values0792.size = 32 := rfl

def block0792 : ℕ → Option IntervalDyadic := segment 245 values0792

theorem block0792_domain : ExactDomain block0792 245 277 := by
  simpa only [values0792_size] using segment_domain 245 values0792

theorem block0792_get (i : Fin 32) :
    block0792 (245 + i.val) = some (values0792[i.val]'(by rw [values0792_size]; exact i.isLt)) := by
  exact segment_get 245 values0792 ⟨i.val, by rw [values0792_size]; exact i.isLt⟩

def values0793 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0793.coefficient54_277,
  OriginalRow227TriangleData0793.coefficient54_278,
  OriginalRow227TriangleData0793.coefficient54_279,
  OriginalRow227TriangleData0793.coefficient54_280,
  OriginalRow227TriangleData0793.coefficient54_281,
  OriginalRow227TriangleData0793.coefficient54_282,
  OriginalRow227TriangleData0793.coefficient54_283,
  OriginalRow227TriangleData0793.coefficient54_284,
  OriginalRow227TriangleData0793.coefficient54_285,
  OriginalRow227TriangleData0793.coefficient54_286,
  OriginalRow227TriangleData0793.coefficient54_287,
  OriginalRow227TriangleData0793.coefficient54_288,
  OriginalRow227TriangleData0793.coefficient54_289,
  OriginalRow227TriangleData0793.coefficient54_290,
  OriginalRow227TriangleData0793.coefficient54_291,
  OriginalRow227TriangleData0793.coefficient54_292,
  OriginalRow227TriangleData0793.coefficient54_293,
  OriginalRow227TriangleData0793.coefficient54_294,
  OriginalRow227TriangleData0793.coefficient54_295,
  OriginalRow227TriangleData0793.coefficient54_296,
  OriginalRow227TriangleData0793.coefficient54_297,
  OriginalRow227TriangleData0793.coefficient54_298,
  OriginalRow227TriangleData0793.coefficient54_299,
  OriginalRow227TriangleData0793.coefficient54_300,
  OriginalRow227TriangleData0793.coefficient54_301,
  OriginalRow227TriangleData0793.coefficient54_302,
  OriginalRow227TriangleData0793.coefficient54_303,
  OriginalRow227TriangleData0793.coefficient54_304,
  OriginalRow227TriangleData0793.coefficient54_305,
  OriginalRow227TriangleData0793.coefficient54_306,
  OriginalRow227TriangleData0793.coefficient54_307,
  OriginalRow227TriangleData0793.coefficient54_308
]

theorem values0793_size : values0793.size = 32 := rfl

def block0793 : ℕ → Option IntervalDyadic := segment 277 values0793

theorem block0793_domain : ExactDomain block0793 277 309 := by
  simpa only [values0793_size] using segment_domain 277 values0793

theorem block0793_get (i : Fin 32) :
    block0793 (277 + i.val) = some (values0793[i.val]'(by rw [values0793_size]; exact i.isLt)) := by
  exact segment_get 277 values0793 ⟨i.val, by rw [values0793_size]; exact i.isLt⟩

def values0794 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0794.coefficient54_309,
  OriginalRow227TriangleData0794.coefficient54_310,
  OriginalRow227TriangleData0794.coefficient54_311,
  OriginalRow227TriangleData0794.coefficient54_312,
  OriginalRow227TriangleData0794.coefficient54_313,
  OriginalRow227TriangleData0794.coefficient54_314,
  OriginalRow227TriangleData0794.coefficient54_315,
  OriginalRow227TriangleData0794.coefficient54_316,
  OriginalRow227TriangleData0794.coefficient54_317,
  OriginalRow227TriangleData0794.coefficient54_318,
  OriginalRow227TriangleData0794.coefficient54_319,
  OriginalRow227TriangleData0794.coefficient54_320,
  OriginalRow227TriangleData0794.coefficient54_321,
  OriginalRow227TriangleData0794.coefficient54_322,
  OriginalRow227TriangleData0794.coefficient54_323,
  OriginalRow227TriangleData0794.coefficient54_324,
  OriginalRow227TriangleData0794.coefficient54_325,
  OriginalRow227TriangleData0794.coefficient54_326,
  OriginalRow227TriangleData0794.coefficient54_327,
  OriginalRow227TriangleData0794.coefficient54_328,
  OriginalRow227TriangleData0794.coefficient54_329,
  OriginalRow227TriangleData0794.coefficient54_330,
  OriginalRow227TriangleData0794.coefficient54_331,
  OriginalRow227TriangleData0794.coefficient54_332,
  OriginalRow227TriangleData0794.coefficient54_333,
  OriginalRow227TriangleData0794.coefficient54_334,
  OriginalRow227TriangleData0794.coefficient54_335,
  OriginalRow227TriangleData0794.coefficient54_336,
  OriginalRow227TriangleData0794.coefficient54_337,
  OriginalRow227TriangleData0794.coefficient54_338,
  OriginalRow227TriangleData0794.coefficient54_339,
  OriginalRow227TriangleData0794.coefficient54_340
]

theorem values0794_size : values0794.size = 32 := rfl

def block0794 : ℕ → Option IntervalDyadic := segment 309 values0794

theorem block0794_domain : ExactDomain block0794 309 341 := by
  simpa only [values0794_size] using segment_domain 309 values0794

theorem block0794_get (i : Fin 32) :
    block0794 (309 + i.val) = some (values0794[i.val]'(by rw [values0794_size]; exact i.isLt)) := by
  exact segment_get 309 values0794 ⟨i.val, by rw [values0794_size]; exact i.isLt⟩

def values0795 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0795.coefficient54_341,
  OriginalRow227TriangleData0795.coefficient54_342,
  OriginalRow227TriangleData0795.coefficient54_343,
  OriginalRow227TriangleData0795.coefficient54_344,
  OriginalRow227TriangleData0795.coefficient54_345,
  OriginalRow227TriangleData0795.coefficient54_346,
  OriginalRow227TriangleData0795.coefficient54_347,
  OriginalRow227TriangleData0795.coefficient54_348,
  OriginalRow227TriangleData0795.coefficient54_349,
  OriginalRow227TriangleData0795.coefficient54_350,
  OriginalRow227TriangleData0795.coefficient54_351,
  OriginalRow227TriangleData0795.coefficient54_352,
  OriginalRow227TriangleData0795.coefficient54_353,
  OriginalRow227TriangleData0795.coefficient54_354,
  OriginalRow227TriangleData0795.coefficient54_355,
  OriginalRow227TriangleData0795.coefficient54_356,
  OriginalRow227TriangleData0795.coefficient54_357,
  OriginalRow227TriangleData0795.coefficient54_358,
  OriginalRow227TriangleData0795.coefficient54_359,
  OriginalRow227TriangleData0795.coefficient54_360,
  OriginalRow227TriangleData0795.coefficient54_361,
  OriginalRow227TriangleData0795.coefficient54_362,
  OriginalRow227TriangleData0795.coefficient54_363,
  OriginalRow227TriangleData0795.coefficient54_364,
  OriginalRow227TriangleData0795.coefficient54_365,
  OriginalRow227TriangleData0795.coefficient54_366,
  OriginalRow227TriangleData0795.coefficient54_367,
  OriginalRow227TriangleData0795.coefficient54_368,
  OriginalRow227TriangleData0795.coefficient54_369,
  OriginalRow227TriangleData0795.coefficient54_370,
  OriginalRow227TriangleData0795.coefficient54_371,
  OriginalRow227TriangleData0795.coefficient54_372
]

theorem values0795_size : values0795.size = 32 := rfl

def block0795 : ℕ → Option IntervalDyadic := segment 341 values0795

theorem block0795_domain : ExactDomain block0795 341 373 := by
  simpa only [values0795_size] using segment_domain 341 values0795

theorem block0795_get (i : Fin 32) :
    block0795 (341 + i.val) = some (values0795[i.val]'(by rw [values0795_size]; exact i.isLt)) := by
  exact segment_get 341 values0795 ⟨i.val, by rw [values0795_size]; exact i.isLt⟩

def values0796 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0796.coefficient54_373,
  OriginalRow227TriangleData0796.coefficient54_374,
  OriginalRow227TriangleData0796.coefficient54_375,
  OriginalRow227TriangleData0796.coefficient54_376,
  OriginalRow227TriangleData0796.coefficient54_377,
  OriginalRow227TriangleData0796.coefficient54_378,
  OriginalRow227TriangleData0796.coefficient54_379,
  OriginalRow227TriangleData0796.coefficient54_380,
  OriginalRow227TriangleData0796.coefficient54_381,
  OriginalRow227TriangleData0796.coefficient54_382,
  OriginalRow227TriangleData0796.coefficient54_383,
  OriginalRow227TriangleData0796.coefficient54_384,
  OriginalRow227TriangleData0796.coefficient54_385,
  OriginalRow227TriangleData0796.coefficient54_386,
  OriginalRow227TriangleData0796.coefficient54_387,
  OriginalRow227TriangleData0796.coefficient54_388,
  OriginalRow227TriangleData0796.coefficient54_389,
  OriginalRow227TriangleData0796.coefficient54_390,
  OriginalRow227TriangleData0796.coefficient54_391,
  OriginalRow227TriangleData0796.coefficient54_392,
  OriginalRow227TriangleData0796.coefficient54_393,
  OriginalRow227TriangleData0796.coefficient54_394,
  OriginalRow227TriangleData0796.coefficient54_395,
  OriginalRow227TriangleData0796.coefficient54_396,
  OriginalRow227TriangleData0796.coefficient54_397,
  OriginalRow227TriangleData0796.coefficient54_398,
  OriginalRow227TriangleData0796.coefficient54_399,
  OriginalRow227TriangleData0796.coefficient54_400,
  OriginalRow227TriangleData0796.coefficient54_401,
  OriginalRow227TriangleData0796.coefficient54_402,
  OriginalRow227TriangleData0796.coefficient54_403,
  OriginalRow227TriangleData0796.coefficient54_404
]

theorem values0796_size : values0796.size = 32 := rfl

def block0796 : ℕ → Option IntervalDyadic := segment 373 values0796

theorem block0796_domain : ExactDomain block0796 373 405 := by
  simpa only [values0796_size] using segment_domain 373 values0796

theorem block0796_get (i : Fin 32) :
    block0796 (373 + i.val) = some (values0796[i.val]'(by rw [values0796_size]; exact i.isLt)) := by
  exact segment_get 373 values0796 ⟨i.val, by rw [values0796_size]; exact i.isLt⟩

def values0797 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0797.coefficient54_405,
  OriginalRow227TriangleData0797.coefficient54_406,
  OriginalRow227TriangleData0797.coefficient54_407,
  OriginalRow227TriangleData0797.coefficient54_408,
  OriginalRow227TriangleData0797.coefficient54_409,
  OriginalRow227TriangleData0797.coefficient54_410,
  OriginalRow227TriangleData0797.coefficient54_411,
  OriginalRow227TriangleData0797.coefficient54_412,
  OriginalRow227TriangleData0797.coefficient54_413,
  OriginalRow227TriangleData0797.coefficient54_414,
  OriginalRow227TriangleData0797.coefficient54_415,
  OriginalRow227TriangleData0797.coefficient54_416,
  OriginalRow227TriangleData0797.coefficient54_417,
  OriginalRow227TriangleData0797.coefficient54_418,
  OriginalRow227TriangleData0797.coefficient54_419,
  OriginalRow227TriangleData0797.coefficient54_420,
  OriginalRow227TriangleData0797.coefficient54_421,
  OriginalRow227TriangleData0797.coefficient54_422,
  OriginalRow227TriangleData0797.coefficient54_423,
  OriginalRow227TriangleData0797.coefficient54_424,
  OriginalRow227TriangleData0797.coefficient54_425,
  OriginalRow227TriangleData0797.coefficient54_426,
  OriginalRow227TriangleData0797.coefficient54_427,
  OriginalRow227TriangleData0797.coefficient54_428,
  OriginalRow227TriangleData0797.coefficient54_429,
  OriginalRow227TriangleData0797.coefficient54_430,
  OriginalRow227TriangleData0797.coefficient54_431,
  OriginalRow227TriangleData0797.coefficient54_432,
  OriginalRow227TriangleData0797.coefficient54_433,
  OriginalRow227TriangleData0797.coefficient54_434,
  OriginalRow227TriangleData0797.coefficient54_435,
  OriginalRow227TriangleData0797.coefficient54_436
]

theorem values0797_size : values0797.size = 32 := rfl

def block0797 : ℕ → Option IntervalDyadic := segment 405 values0797

theorem block0797_domain : ExactDomain block0797 405 437 := by
  simpa only [values0797_size] using segment_domain 405 values0797

theorem block0797_get (i : Fin 32) :
    block0797 (405 + i.val) = some (values0797[i.val]'(by rw [values0797_size]; exact i.isLt)) := by
  exact segment_get 405 values0797 ⟨i.val, by rw [values0797_size]; exact i.isLt⟩

def values0798 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0798.coefficient54_437,
  OriginalRow227TriangleData0798.coefficient54_438,
  OriginalRow227TriangleData0798.coefficient54_439,
  OriginalRow227TriangleData0798.coefficient54_440,
  OriginalRow227TriangleData0798.coefficient54_441,
  OriginalRow227TriangleData0798.coefficient54_442,
  OriginalRow227TriangleData0798.coefficient54_443,
  OriginalRow227TriangleData0798.coefficient54_444,
  OriginalRow227TriangleData0798.coefficient54_445,
  OriginalRow227TriangleData0798.coefficient54_446,
  OriginalRow227TriangleData0798.coefficient54_447
]

theorem values0798_size : values0798.size = 11 := rfl

def block0798 : ℕ → Option IntervalDyadic := segment 437 values0798

theorem block0798_domain : ExactDomain block0798 437 448 := by
  simpa only [values0798_size] using segment_domain 437 values0798

theorem block0798_get (i : Fin 11) :
    block0798 (437 + i.val) = some (values0798[i.val]'(by rw [values0798_size]; exact i.isLt)) := by
  exact segment_get 437 values0798 ⟨i.val, by rw [values0798_size]; exact i.isLt⟩

def node0085_0149 : ℕ → Option IntervalDyadic := split 117 block0787 block0788

theorem node0085_0149_domain : ExactDomain node0085_0149 85 149 := by
  exact split_domain (by decide) (by decide) block0787_domain block0788_domain

def node0053_0149 : ℕ → Option IntervalDyadic := split 85 block0786 node0085_0149

theorem node0053_0149_domain : ExactDomain node0053_0149 53 149 := by
  exact split_domain (by decide) (by decide) block0786_domain node0085_0149_domain

def node0181_0245 : ℕ → Option IntervalDyadic := split 213 block0790 block0791

theorem node0181_0245_domain : ExactDomain node0181_0245 181 245 := by
  exact split_domain (by decide) (by decide) block0790_domain block0791_domain

def node0149_0245 : ℕ → Option IntervalDyadic := split 181 block0789 node0181_0245

theorem node0149_0245_domain : ExactDomain node0149_0245 149 245 := by
  exact split_domain (by decide) (by decide) block0789_domain node0181_0245_domain

def node0053_0245 : ℕ → Option IntervalDyadic := split 149 node0053_0149 node0149_0245

theorem node0053_0245_domain : ExactDomain node0053_0245 53 245 := by
  exact split_domain (by decide) (by decide) node0053_0149_domain node0149_0245_domain

def node0277_0341 : ℕ → Option IntervalDyadic := split 309 block0793 block0794

theorem node0277_0341_domain : ExactDomain node0277_0341 277 341 := by
  exact split_domain (by decide) (by decide) block0793_domain block0794_domain

def node0245_0341 : ℕ → Option IntervalDyadic := split 277 block0792 node0277_0341

theorem node0245_0341_domain : ExactDomain node0245_0341 245 341 := by
  exact split_domain (by decide) (by decide) block0792_domain node0277_0341_domain

def node0341_0405 : ℕ → Option IntervalDyadic := split 373 block0795 block0796

theorem node0341_0405_domain : ExactDomain node0341_0405 341 405 := by
  exact split_domain (by decide) (by decide) block0795_domain block0796_domain

def node0405_0448 : ℕ → Option IntervalDyadic := split 437 block0797 block0798

theorem node0405_0448_domain : ExactDomain node0405_0448 405 448 := by
  exact split_domain (by decide) (by decide) block0797_domain block0798_domain

def node0341_0448 : ℕ → Option IntervalDyadic := split 405 node0341_0405 node0405_0448

theorem node0341_0448_domain : ExactDomain node0341_0448 341 448 := by
  exact split_domain (by decide) (by decide) node0341_0405_domain node0405_0448_domain

def node0245_0448 : ℕ → Option IntervalDyadic := split 341 node0245_0341 node0341_0448

theorem node0245_0448_domain : ExactDomain node0245_0448 245 448 := by
  exact split_domain (by decide) (by decide) node0245_0341_domain node0341_0448_domain

def node0053_0448 : ℕ → Option IntervalDyadic := split 245 node0053_0245 node0245_0448

theorem node0053_0448_domain : ExactDomain node0053_0448 53 448 := by
  exact split_domain (by decide) (by decide) node0053_0245_domain node0245_0448_domain

def lookup : ℕ → Option IntervalDyadic := node0053_0448

theorem lookup_domain : ExactDomain lookup 53 448 :=
  node0053_0448_domain

theorem block0786_lookup (i : Fin 32) :
    lookup (53 + i.val) = some (values0786[i.val]'(by rw [values0786_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (53 + i.val) = _
  rw [node0053_0448, split_left 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0053_0245, split_left 149 node0053_0149 node0149_0245 (by omega)]
  rw [node0053_0149, split_left 85 block0786 node0085_0149 (by omega)]
  exact block0786_get i

theorem block0787_lookup (i : Fin 32) :
    lookup (85 + i.val) = some (values0787[i.val]'(by rw [values0787_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (85 + i.val) = _
  rw [node0053_0448, split_left 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0053_0245, split_left 149 node0053_0149 node0149_0245 (by omega)]
  rw [node0053_0149, split_right 85 block0786 node0085_0149 (by omega)]
  rw [node0085_0149, split_left 117 block0787 block0788 (by omega)]
  exact block0787_get i

theorem block0788_lookup (i : Fin 32) :
    lookup (117 + i.val) = some (values0788[i.val]'(by rw [values0788_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (117 + i.val) = _
  rw [node0053_0448, split_left 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0053_0245, split_left 149 node0053_0149 node0149_0245 (by omega)]
  rw [node0053_0149, split_right 85 block0786 node0085_0149 (by omega)]
  rw [node0085_0149, split_right 117 block0787 block0788 (by omega)]
  exact block0788_get i

theorem block0789_lookup (i : Fin 32) :
    lookup (149 + i.val) = some (values0789[i.val]'(by rw [values0789_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (149 + i.val) = _
  rw [node0053_0448, split_left 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0053_0245, split_right 149 node0053_0149 node0149_0245 (by omega)]
  rw [node0149_0245, split_left 181 block0789 node0181_0245 (by omega)]
  exact block0789_get i

theorem block0790_lookup (i : Fin 32) :
    lookup (181 + i.val) = some (values0790[i.val]'(by rw [values0790_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (181 + i.val) = _
  rw [node0053_0448, split_left 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0053_0245, split_right 149 node0053_0149 node0149_0245 (by omega)]
  rw [node0149_0245, split_right 181 block0789 node0181_0245 (by omega)]
  rw [node0181_0245, split_left 213 block0790 block0791 (by omega)]
  exact block0790_get i

theorem block0791_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values0791[i.val]'(by rw [values0791_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (213 + i.val) = _
  rw [node0053_0448, split_left 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0053_0245, split_right 149 node0053_0149 node0149_0245 (by omega)]
  rw [node0149_0245, split_right 181 block0789 node0181_0245 (by omega)]
  rw [node0181_0245, split_right 213 block0790 block0791 (by omega)]
  exact block0791_get i

theorem block0792_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values0792[i.val]'(by rw [values0792_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (245 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_left 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0245_0341, split_left 277 block0792 node0277_0341 (by omega)]
  exact block0792_get i

theorem block0793_lookup (i : Fin 32) :
    lookup (277 + i.val) = some (values0793[i.val]'(by rw [values0793_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (277 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_left 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0245_0341, split_right 277 block0792 node0277_0341 (by omega)]
  rw [node0277_0341, split_left 309 block0793 block0794 (by omega)]
  exact block0793_get i

theorem block0794_lookup (i : Fin 32) :
    lookup (309 + i.val) = some (values0794[i.val]'(by rw [values0794_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (309 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_left 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0245_0341, split_right 277 block0792 node0277_0341 (by omega)]
  rw [node0277_0341, split_right 309 block0793 block0794 (by omega)]
  exact block0794_get i

theorem block0795_lookup (i : Fin 32) :
    lookup (341 + i.val) = some (values0795[i.val]'(by rw [values0795_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (341 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_right 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0341_0448, split_left 405 node0341_0405 node0405_0448 (by omega)]
  rw [node0341_0405, split_left 373 block0795 block0796 (by omega)]
  exact block0795_get i

theorem block0796_lookup (i : Fin 32) :
    lookup (373 + i.val) = some (values0796[i.val]'(by rw [values0796_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (373 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_right 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0341_0448, split_left 405 node0341_0405 node0405_0448 (by omega)]
  rw [node0341_0405, split_right 373 block0795 block0796 (by omega)]
  exact block0796_get i

theorem block0797_lookup (i : Fin 32) :
    lookup (405 + i.val) = some (values0797[i.val]'(by rw [values0797_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (405 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_right 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0341_0448, split_right 405 node0341_0405 node0405_0448 (by omega)]
  rw [node0405_0448, split_left 437 block0797 block0798 (by omega)]
  exact block0797_get i

theorem block0798_lookup (i : Fin 11) :
    lookup (437 + i.val) = some (values0798[i.val]'(by rw [values0798_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0053_0448 (437 + i.val) = _
  rw [node0053_0448, split_right 245 node0053_0245 node0245_0448 (by omega)]
  rw [node0245_0448, split_right 341 node0245_0341 node0341_0448 (by omega)]
  rw [node0341_0448, split_right 405 node0341_0405 node0405_0448 (by omega)]
  rw [node0405_0448, split_right 437 block0797 block0798 (by omega)]
  exact block0798_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0786_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0786_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0787_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0787_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0788_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0788_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0789_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0789_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0790_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0790_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0791_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0791_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0792_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0792_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0793_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0793_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0794_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0794_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0795_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0795_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0796_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0796_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0797_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0797_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0798_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0798_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0786_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0787_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0788_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0789_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0790_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0791_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0792_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0793_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0794_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0795_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0796_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0797_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow054.block0798_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow054
