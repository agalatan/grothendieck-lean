import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0851
import Grothe.UpperChaos.OriginalRow227TriangleData0852
import Grothe.UpperChaos.OriginalRow227TriangleData0853
import Grothe.UpperChaos.OriginalRow227TriangleData0854
import Grothe.UpperChaos.OriginalRow227TriangleData0855
import Grothe.UpperChaos.OriginalRow227TriangleData0856
import Grothe.UpperChaos.OriginalRow227TriangleData0857
import Grothe.UpperChaos.OriginalRow227TriangleData0858
import Grothe.UpperChaos.OriginalRow227TriangleData0859
import Grothe.UpperChaos.OriginalRow227TriangleData0860
import Grothe.UpperChaos.OriginalRow227TriangleData0861
import Grothe.UpperChaos.OriginalRow227TriangleData0862
import Grothe.UpperChaos.OriginalRow227TriangleData0863

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow059

open ConditionalTableLookup

def values0851 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0851.coefficient59_58,
  OriginalRow227TriangleData0851.coefficient59_59,
  OriginalRow227TriangleData0851.coefficient59_60,
  OriginalRow227TriangleData0851.coefficient59_61,
  OriginalRow227TriangleData0851.coefficient59_62,
  OriginalRow227TriangleData0851.coefficient59_63,
  OriginalRow227TriangleData0851.coefficient59_64,
  OriginalRow227TriangleData0851.coefficient59_65,
  OriginalRow227TriangleData0851.coefficient59_66,
  OriginalRow227TriangleData0851.coefficient59_67,
  OriginalRow227TriangleData0851.coefficient59_68,
  OriginalRow227TriangleData0851.coefficient59_69,
  OriginalRow227TriangleData0851.coefficient59_70,
  OriginalRow227TriangleData0851.coefficient59_71,
  OriginalRow227TriangleData0851.coefficient59_72,
  OriginalRow227TriangleData0851.coefficient59_73,
  OriginalRow227TriangleData0851.coefficient59_74,
  OriginalRow227TriangleData0851.coefficient59_75,
  OriginalRow227TriangleData0851.coefficient59_76,
  OriginalRow227TriangleData0851.coefficient59_77,
  OriginalRow227TriangleData0851.coefficient59_78,
  OriginalRow227TriangleData0851.coefficient59_79,
  OriginalRow227TriangleData0851.coefficient59_80,
  OriginalRow227TriangleData0851.coefficient59_81,
  OriginalRow227TriangleData0851.coefficient59_82,
  OriginalRow227TriangleData0851.coefficient59_83,
  OriginalRow227TriangleData0851.coefficient59_84,
  OriginalRow227TriangleData0851.coefficient59_85,
  OriginalRow227TriangleData0851.coefficient59_86,
  OriginalRow227TriangleData0851.coefficient59_87,
  OriginalRow227TriangleData0851.coefficient59_88,
  OriginalRow227TriangleData0851.coefficient59_89
]

theorem values0851_size : values0851.size = 32 := rfl

def block0851 : ℕ → Option IntervalDyadic := segment 58 values0851

theorem block0851_domain : ExactDomain block0851 58 90 := by
  simpa only [values0851_size] using segment_domain 58 values0851

theorem block0851_get (i : Fin 32) :
    block0851 (58 + i.val) = some (values0851[i.val]'(by rw [values0851_size]; exact i.isLt)) := by
  exact segment_get 58 values0851 ⟨i.val, by rw [values0851_size]; exact i.isLt⟩

def values0852 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0852.coefficient59_90,
  OriginalRow227TriangleData0852.coefficient59_91,
  OriginalRow227TriangleData0852.coefficient59_92,
  OriginalRow227TriangleData0852.coefficient59_93,
  OriginalRow227TriangleData0852.coefficient59_94,
  OriginalRow227TriangleData0852.coefficient59_95,
  OriginalRow227TriangleData0852.coefficient59_96,
  OriginalRow227TriangleData0852.coefficient59_97,
  OriginalRow227TriangleData0852.coefficient59_98,
  OriginalRow227TriangleData0852.coefficient59_99,
  OriginalRow227TriangleData0852.coefficient59_100,
  OriginalRow227TriangleData0852.coefficient59_101,
  OriginalRow227TriangleData0852.coefficient59_102,
  OriginalRow227TriangleData0852.coefficient59_103,
  OriginalRow227TriangleData0852.coefficient59_104,
  OriginalRow227TriangleData0852.coefficient59_105,
  OriginalRow227TriangleData0852.coefficient59_106,
  OriginalRow227TriangleData0852.coefficient59_107,
  OriginalRow227TriangleData0852.coefficient59_108,
  OriginalRow227TriangleData0852.coefficient59_109,
  OriginalRow227TriangleData0852.coefficient59_110,
  OriginalRow227TriangleData0852.coefficient59_111,
  OriginalRow227TriangleData0852.coefficient59_112,
  OriginalRow227TriangleData0852.coefficient59_113,
  OriginalRow227TriangleData0852.coefficient59_114,
  OriginalRow227TriangleData0852.coefficient59_115,
  OriginalRow227TriangleData0852.coefficient59_116,
  OriginalRow227TriangleData0852.coefficient59_117,
  OriginalRow227TriangleData0852.coefficient59_118,
  OriginalRow227TriangleData0852.coefficient59_119,
  OriginalRow227TriangleData0852.coefficient59_120,
  OriginalRow227TriangleData0852.coefficient59_121
]

theorem values0852_size : values0852.size = 32 := rfl

def block0852 : ℕ → Option IntervalDyadic := segment 90 values0852

theorem block0852_domain : ExactDomain block0852 90 122 := by
  simpa only [values0852_size] using segment_domain 90 values0852

theorem block0852_get (i : Fin 32) :
    block0852 (90 + i.val) = some (values0852[i.val]'(by rw [values0852_size]; exact i.isLt)) := by
  exact segment_get 90 values0852 ⟨i.val, by rw [values0852_size]; exact i.isLt⟩

def values0853 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0853.coefficient59_122,
  OriginalRow227TriangleData0853.coefficient59_123,
  OriginalRow227TriangleData0853.coefficient59_124,
  OriginalRow227TriangleData0853.coefficient59_125,
  OriginalRow227TriangleData0853.coefficient59_126,
  OriginalRow227TriangleData0853.coefficient59_127,
  OriginalRow227TriangleData0853.coefficient59_128,
  OriginalRow227TriangleData0853.coefficient59_129,
  OriginalRow227TriangleData0853.coefficient59_130,
  OriginalRow227TriangleData0853.coefficient59_131,
  OriginalRow227TriangleData0853.coefficient59_132,
  OriginalRow227TriangleData0853.coefficient59_133,
  OriginalRow227TriangleData0853.coefficient59_134,
  OriginalRow227TriangleData0853.coefficient59_135,
  OriginalRow227TriangleData0853.coefficient59_136,
  OriginalRow227TriangleData0853.coefficient59_137,
  OriginalRow227TriangleData0853.coefficient59_138,
  OriginalRow227TriangleData0853.coefficient59_139,
  OriginalRow227TriangleData0853.coefficient59_140,
  OriginalRow227TriangleData0853.coefficient59_141,
  OriginalRow227TriangleData0853.coefficient59_142,
  OriginalRow227TriangleData0853.coefficient59_143,
  OriginalRow227TriangleData0853.coefficient59_144,
  OriginalRow227TriangleData0853.coefficient59_145,
  OriginalRow227TriangleData0853.coefficient59_146,
  OriginalRow227TriangleData0853.coefficient59_147,
  OriginalRow227TriangleData0853.coefficient59_148,
  OriginalRow227TriangleData0853.coefficient59_149,
  OriginalRow227TriangleData0853.coefficient59_150,
  OriginalRow227TriangleData0853.coefficient59_151,
  OriginalRow227TriangleData0853.coefficient59_152,
  OriginalRow227TriangleData0853.coefficient59_153
]

theorem values0853_size : values0853.size = 32 := rfl

def block0853 : ℕ → Option IntervalDyadic := segment 122 values0853

theorem block0853_domain : ExactDomain block0853 122 154 := by
  simpa only [values0853_size] using segment_domain 122 values0853

theorem block0853_get (i : Fin 32) :
    block0853 (122 + i.val) = some (values0853[i.val]'(by rw [values0853_size]; exact i.isLt)) := by
  exact segment_get 122 values0853 ⟨i.val, by rw [values0853_size]; exact i.isLt⟩

def values0854 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0854.coefficient59_154,
  OriginalRow227TriangleData0854.coefficient59_155,
  OriginalRow227TriangleData0854.coefficient59_156,
  OriginalRow227TriangleData0854.coefficient59_157,
  OriginalRow227TriangleData0854.coefficient59_158,
  OriginalRow227TriangleData0854.coefficient59_159,
  OriginalRow227TriangleData0854.coefficient59_160,
  OriginalRow227TriangleData0854.coefficient59_161,
  OriginalRow227TriangleData0854.coefficient59_162,
  OriginalRow227TriangleData0854.coefficient59_163,
  OriginalRow227TriangleData0854.coefficient59_164,
  OriginalRow227TriangleData0854.coefficient59_165,
  OriginalRow227TriangleData0854.coefficient59_166,
  OriginalRow227TriangleData0854.coefficient59_167,
  OriginalRow227TriangleData0854.coefficient59_168,
  OriginalRow227TriangleData0854.coefficient59_169,
  OriginalRow227TriangleData0854.coefficient59_170,
  OriginalRow227TriangleData0854.coefficient59_171,
  OriginalRow227TriangleData0854.coefficient59_172,
  OriginalRow227TriangleData0854.coefficient59_173,
  OriginalRow227TriangleData0854.coefficient59_174,
  OriginalRow227TriangleData0854.coefficient59_175,
  OriginalRow227TriangleData0854.coefficient59_176,
  OriginalRow227TriangleData0854.coefficient59_177,
  OriginalRow227TriangleData0854.coefficient59_178,
  OriginalRow227TriangleData0854.coefficient59_179,
  OriginalRow227TriangleData0854.coefficient59_180,
  OriginalRow227TriangleData0854.coefficient59_181,
  OriginalRow227TriangleData0854.coefficient59_182,
  OriginalRow227TriangleData0854.coefficient59_183,
  OriginalRow227TriangleData0854.coefficient59_184,
  OriginalRow227TriangleData0854.coefficient59_185
]

theorem values0854_size : values0854.size = 32 := rfl

def block0854 : ℕ → Option IntervalDyadic := segment 154 values0854

theorem block0854_domain : ExactDomain block0854 154 186 := by
  simpa only [values0854_size] using segment_domain 154 values0854

theorem block0854_get (i : Fin 32) :
    block0854 (154 + i.val) = some (values0854[i.val]'(by rw [values0854_size]; exact i.isLt)) := by
  exact segment_get 154 values0854 ⟨i.val, by rw [values0854_size]; exact i.isLt⟩

def values0855 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0855.coefficient59_186,
  OriginalRow227TriangleData0855.coefficient59_187,
  OriginalRow227TriangleData0855.coefficient59_188,
  OriginalRow227TriangleData0855.coefficient59_189,
  OriginalRow227TriangleData0855.coefficient59_190,
  OriginalRow227TriangleData0855.coefficient59_191,
  OriginalRow227TriangleData0855.coefficient59_192,
  OriginalRow227TriangleData0855.coefficient59_193,
  OriginalRow227TriangleData0855.coefficient59_194,
  OriginalRow227TriangleData0855.coefficient59_195,
  OriginalRow227TriangleData0855.coefficient59_196,
  OriginalRow227TriangleData0855.coefficient59_197,
  OriginalRow227TriangleData0855.coefficient59_198,
  OriginalRow227TriangleData0855.coefficient59_199,
  OriginalRow227TriangleData0855.coefficient59_200,
  OriginalRow227TriangleData0855.coefficient59_201,
  OriginalRow227TriangleData0855.coefficient59_202,
  OriginalRow227TriangleData0855.coefficient59_203,
  OriginalRow227TriangleData0855.coefficient59_204,
  OriginalRow227TriangleData0855.coefficient59_205,
  OriginalRow227TriangleData0855.coefficient59_206,
  OriginalRow227TriangleData0855.coefficient59_207,
  OriginalRow227TriangleData0855.coefficient59_208,
  OriginalRow227TriangleData0855.coefficient59_209,
  OriginalRow227TriangleData0855.coefficient59_210,
  OriginalRow227TriangleData0855.coefficient59_211,
  OriginalRow227TriangleData0855.coefficient59_212,
  OriginalRow227TriangleData0855.coefficient59_213,
  OriginalRow227TriangleData0855.coefficient59_214,
  OriginalRow227TriangleData0855.coefficient59_215,
  OriginalRow227TriangleData0855.coefficient59_216,
  OriginalRow227TriangleData0855.coefficient59_217
]

theorem values0855_size : values0855.size = 32 := rfl

def block0855 : ℕ → Option IntervalDyadic := segment 186 values0855

theorem block0855_domain : ExactDomain block0855 186 218 := by
  simpa only [values0855_size] using segment_domain 186 values0855

theorem block0855_get (i : Fin 32) :
    block0855 (186 + i.val) = some (values0855[i.val]'(by rw [values0855_size]; exact i.isLt)) := by
  exact segment_get 186 values0855 ⟨i.val, by rw [values0855_size]; exact i.isLt⟩

def values0856 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0856.coefficient59_218,
  OriginalRow227TriangleData0856.coefficient59_219,
  OriginalRow227TriangleData0856.coefficient59_220,
  OriginalRow227TriangleData0856.coefficient59_221,
  OriginalRow227TriangleData0856.coefficient59_222,
  OriginalRow227TriangleData0856.coefficient59_223,
  OriginalRow227TriangleData0856.coefficient59_224,
  OriginalRow227TriangleData0856.coefficient59_225,
  OriginalRow227TriangleData0856.coefficient59_226,
  OriginalRow227TriangleData0856.coefficient59_227,
  OriginalRow227TriangleData0856.coefficient59_228,
  OriginalRow227TriangleData0856.coefficient59_229,
  OriginalRow227TriangleData0856.coefficient59_230,
  OriginalRow227TriangleData0856.coefficient59_231,
  OriginalRow227TriangleData0856.coefficient59_232,
  OriginalRow227TriangleData0856.coefficient59_233,
  OriginalRow227TriangleData0856.coefficient59_234,
  OriginalRow227TriangleData0856.coefficient59_235,
  OriginalRow227TriangleData0856.coefficient59_236,
  OriginalRow227TriangleData0856.coefficient59_237,
  OriginalRow227TriangleData0856.coefficient59_238,
  OriginalRow227TriangleData0856.coefficient59_239,
  OriginalRow227TriangleData0856.coefficient59_240,
  OriginalRow227TriangleData0856.coefficient59_241,
  OriginalRow227TriangleData0856.coefficient59_242,
  OriginalRow227TriangleData0856.coefficient59_243,
  OriginalRow227TriangleData0856.coefficient59_244,
  OriginalRow227TriangleData0856.coefficient59_245,
  OriginalRow227TriangleData0856.coefficient59_246,
  OriginalRow227TriangleData0856.coefficient59_247,
  OriginalRow227TriangleData0856.coefficient59_248,
  OriginalRow227TriangleData0856.coefficient59_249
]

theorem values0856_size : values0856.size = 32 := rfl

def block0856 : ℕ → Option IntervalDyadic := segment 218 values0856

theorem block0856_domain : ExactDomain block0856 218 250 := by
  simpa only [values0856_size] using segment_domain 218 values0856

theorem block0856_get (i : Fin 32) :
    block0856 (218 + i.val) = some (values0856[i.val]'(by rw [values0856_size]; exact i.isLt)) := by
  exact segment_get 218 values0856 ⟨i.val, by rw [values0856_size]; exact i.isLt⟩

def values0857 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0857.coefficient59_250,
  OriginalRow227TriangleData0857.coefficient59_251,
  OriginalRow227TriangleData0857.coefficient59_252,
  OriginalRow227TriangleData0857.coefficient59_253,
  OriginalRow227TriangleData0857.coefficient59_254,
  OriginalRow227TriangleData0857.coefficient59_255,
  OriginalRow227TriangleData0857.coefficient59_256,
  OriginalRow227TriangleData0857.coefficient59_257,
  OriginalRow227TriangleData0857.coefficient59_258,
  OriginalRow227TriangleData0857.coefficient59_259,
  OriginalRow227TriangleData0857.coefficient59_260,
  OriginalRow227TriangleData0857.coefficient59_261,
  OriginalRow227TriangleData0857.coefficient59_262,
  OriginalRow227TriangleData0857.coefficient59_263,
  OriginalRow227TriangleData0857.coefficient59_264,
  OriginalRow227TriangleData0857.coefficient59_265,
  OriginalRow227TriangleData0857.coefficient59_266,
  OriginalRow227TriangleData0857.coefficient59_267,
  OriginalRow227TriangleData0857.coefficient59_268,
  OriginalRow227TriangleData0857.coefficient59_269,
  OriginalRow227TriangleData0857.coefficient59_270,
  OriginalRow227TriangleData0857.coefficient59_271,
  OriginalRow227TriangleData0857.coefficient59_272,
  OriginalRow227TriangleData0857.coefficient59_273,
  OriginalRow227TriangleData0857.coefficient59_274,
  OriginalRow227TriangleData0857.coefficient59_275,
  OriginalRow227TriangleData0857.coefficient59_276,
  OriginalRow227TriangleData0857.coefficient59_277,
  OriginalRow227TriangleData0857.coefficient59_278,
  OriginalRow227TriangleData0857.coefficient59_279,
  OriginalRow227TriangleData0857.coefficient59_280,
  OriginalRow227TriangleData0857.coefficient59_281
]

theorem values0857_size : values0857.size = 32 := rfl

def block0857 : ℕ → Option IntervalDyadic := segment 250 values0857

theorem block0857_domain : ExactDomain block0857 250 282 := by
  simpa only [values0857_size] using segment_domain 250 values0857

theorem block0857_get (i : Fin 32) :
    block0857 (250 + i.val) = some (values0857[i.val]'(by rw [values0857_size]; exact i.isLt)) := by
  exact segment_get 250 values0857 ⟨i.val, by rw [values0857_size]; exact i.isLt⟩

def values0858 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0858.coefficient59_282,
  OriginalRow227TriangleData0858.coefficient59_283,
  OriginalRow227TriangleData0858.coefficient59_284,
  OriginalRow227TriangleData0858.coefficient59_285,
  OriginalRow227TriangleData0858.coefficient59_286,
  OriginalRow227TriangleData0858.coefficient59_287,
  OriginalRow227TriangleData0858.coefficient59_288,
  OriginalRow227TriangleData0858.coefficient59_289,
  OriginalRow227TriangleData0858.coefficient59_290,
  OriginalRow227TriangleData0858.coefficient59_291,
  OriginalRow227TriangleData0858.coefficient59_292,
  OriginalRow227TriangleData0858.coefficient59_293,
  OriginalRow227TriangleData0858.coefficient59_294,
  OriginalRow227TriangleData0858.coefficient59_295,
  OriginalRow227TriangleData0858.coefficient59_296,
  OriginalRow227TriangleData0858.coefficient59_297,
  OriginalRow227TriangleData0858.coefficient59_298,
  OriginalRow227TriangleData0858.coefficient59_299,
  OriginalRow227TriangleData0858.coefficient59_300,
  OriginalRow227TriangleData0858.coefficient59_301,
  OriginalRow227TriangleData0858.coefficient59_302,
  OriginalRow227TriangleData0858.coefficient59_303,
  OriginalRow227TriangleData0858.coefficient59_304,
  OriginalRow227TriangleData0858.coefficient59_305,
  OriginalRow227TriangleData0858.coefficient59_306,
  OriginalRow227TriangleData0858.coefficient59_307,
  OriginalRow227TriangleData0858.coefficient59_308,
  OriginalRow227TriangleData0858.coefficient59_309,
  OriginalRow227TriangleData0858.coefficient59_310,
  OriginalRow227TriangleData0858.coefficient59_311,
  OriginalRow227TriangleData0858.coefficient59_312,
  OriginalRow227TriangleData0858.coefficient59_313
]

theorem values0858_size : values0858.size = 32 := rfl

def block0858 : ℕ → Option IntervalDyadic := segment 282 values0858

theorem block0858_domain : ExactDomain block0858 282 314 := by
  simpa only [values0858_size] using segment_domain 282 values0858

theorem block0858_get (i : Fin 32) :
    block0858 (282 + i.val) = some (values0858[i.val]'(by rw [values0858_size]; exact i.isLt)) := by
  exact segment_get 282 values0858 ⟨i.val, by rw [values0858_size]; exact i.isLt⟩

def values0859 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0859.coefficient59_314,
  OriginalRow227TriangleData0859.coefficient59_315,
  OriginalRow227TriangleData0859.coefficient59_316,
  OriginalRow227TriangleData0859.coefficient59_317,
  OriginalRow227TriangleData0859.coefficient59_318,
  OriginalRow227TriangleData0859.coefficient59_319,
  OriginalRow227TriangleData0859.coefficient59_320,
  OriginalRow227TriangleData0859.coefficient59_321,
  OriginalRow227TriangleData0859.coefficient59_322,
  OriginalRow227TriangleData0859.coefficient59_323,
  OriginalRow227TriangleData0859.coefficient59_324,
  OriginalRow227TriangleData0859.coefficient59_325,
  OriginalRow227TriangleData0859.coefficient59_326,
  OriginalRow227TriangleData0859.coefficient59_327,
  OriginalRow227TriangleData0859.coefficient59_328,
  OriginalRow227TriangleData0859.coefficient59_329,
  OriginalRow227TriangleData0859.coefficient59_330,
  OriginalRow227TriangleData0859.coefficient59_331,
  OriginalRow227TriangleData0859.coefficient59_332,
  OriginalRow227TriangleData0859.coefficient59_333,
  OriginalRow227TriangleData0859.coefficient59_334,
  OriginalRow227TriangleData0859.coefficient59_335,
  OriginalRow227TriangleData0859.coefficient59_336,
  OriginalRow227TriangleData0859.coefficient59_337,
  OriginalRow227TriangleData0859.coefficient59_338,
  OriginalRow227TriangleData0859.coefficient59_339,
  OriginalRow227TriangleData0859.coefficient59_340,
  OriginalRow227TriangleData0859.coefficient59_341,
  OriginalRow227TriangleData0859.coefficient59_342,
  OriginalRow227TriangleData0859.coefficient59_343,
  OriginalRow227TriangleData0859.coefficient59_344,
  OriginalRow227TriangleData0859.coefficient59_345
]

theorem values0859_size : values0859.size = 32 := rfl

def block0859 : ℕ → Option IntervalDyadic := segment 314 values0859

theorem block0859_domain : ExactDomain block0859 314 346 := by
  simpa only [values0859_size] using segment_domain 314 values0859

theorem block0859_get (i : Fin 32) :
    block0859 (314 + i.val) = some (values0859[i.val]'(by rw [values0859_size]; exact i.isLt)) := by
  exact segment_get 314 values0859 ⟨i.val, by rw [values0859_size]; exact i.isLt⟩

def values0860 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0860.coefficient59_346,
  OriginalRow227TriangleData0860.coefficient59_347,
  OriginalRow227TriangleData0860.coefficient59_348,
  OriginalRow227TriangleData0860.coefficient59_349,
  OriginalRow227TriangleData0860.coefficient59_350,
  OriginalRow227TriangleData0860.coefficient59_351,
  OriginalRow227TriangleData0860.coefficient59_352,
  OriginalRow227TriangleData0860.coefficient59_353,
  OriginalRow227TriangleData0860.coefficient59_354,
  OriginalRow227TriangleData0860.coefficient59_355,
  OriginalRow227TriangleData0860.coefficient59_356,
  OriginalRow227TriangleData0860.coefficient59_357,
  OriginalRow227TriangleData0860.coefficient59_358,
  OriginalRow227TriangleData0860.coefficient59_359,
  OriginalRow227TriangleData0860.coefficient59_360,
  OriginalRow227TriangleData0860.coefficient59_361,
  OriginalRow227TriangleData0860.coefficient59_362,
  OriginalRow227TriangleData0860.coefficient59_363,
  OriginalRow227TriangleData0860.coefficient59_364,
  OriginalRow227TriangleData0860.coefficient59_365,
  OriginalRow227TriangleData0860.coefficient59_366,
  OriginalRow227TriangleData0860.coefficient59_367,
  OriginalRow227TriangleData0860.coefficient59_368,
  OriginalRow227TriangleData0860.coefficient59_369,
  OriginalRow227TriangleData0860.coefficient59_370,
  OriginalRow227TriangleData0860.coefficient59_371,
  OriginalRow227TriangleData0860.coefficient59_372,
  OriginalRow227TriangleData0860.coefficient59_373,
  OriginalRow227TriangleData0860.coefficient59_374,
  OriginalRow227TriangleData0860.coefficient59_375,
  OriginalRow227TriangleData0860.coefficient59_376,
  OriginalRow227TriangleData0860.coefficient59_377
]

theorem values0860_size : values0860.size = 32 := rfl

def block0860 : ℕ → Option IntervalDyadic := segment 346 values0860

theorem block0860_domain : ExactDomain block0860 346 378 := by
  simpa only [values0860_size] using segment_domain 346 values0860

theorem block0860_get (i : Fin 32) :
    block0860 (346 + i.val) = some (values0860[i.val]'(by rw [values0860_size]; exact i.isLt)) := by
  exact segment_get 346 values0860 ⟨i.val, by rw [values0860_size]; exact i.isLt⟩

def values0861 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0861.coefficient59_378,
  OriginalRow227TriangleData0861.coefficient59_379,
  OriginalRow227TriangleData0861.coefficient59_380,
  OriginalRow227TriangleData0861.coefficient59_381,
  OriginalRow227TriangleData0861.coefficient59_382,
  OriginalRow227TriangleData0861.coefficient59_383,
  OriginalRow227TriangleData0861.coefficient59_384,
  OriginalRow227TriangleData0861.coefficient59_385,
  OriginalRow227TriangleData0861.coefficient59_386,
  OriginalRow227TriangleData0861.coefficient59_387,
  OriginalRow227TriangleData0861.coefficient59_388,
  OriginalRow227TriangleData0861.coefficient59_389,
  OriginalRow227TriangleData0861.coefficient59_390,
  OriginalRow227TriangleData0861.coefficient59_391,
  OriginalRow227TriangleData0861.coefficient59_392,
  OriginalRow227TriangleData0861.coefficient59_393,
  OriginalRow227TriangleData0861.coefficient59_394,
  OriginalRow227TriangleData0861.coefficient59_395,
  OriginalRow227TriangleData0861.coefficient59_396,
  OriginalRow227TriangleData0861.coefficient59_397,
  OriginalRow227TriangleData0861.coefficient59_398,
  OriginalRow227TriangleData0861.coefficient59_399,
  OriginalRow227TriangleData0861.coefficient59_400,
  OriginalRow227TriangleData0861.coefficient59_401,
  OriginalRow227TriangleData0861.coefficient59_402,
  OriginalRow227TriangleData0861.coefficient59_403,
  OriginalRow227TriangleData0861.coefficient59_404,
  OriginalRow227TriangleData0861.coefficient59_405,
  OriginalRow227TriangleData0861.coefficient59_406,
  OriginalRow227TriangleData0861.coefficient59_407,
  OriginalRow227TriangleData0861.coefficient59_408,
  OriginalRow227TriangleData0861.coefficient59_409
]

theorem values0861_size : values0861.size = 32 := rfl

def block0861 : ℕ → Option IntervalDyadic := segment 378 values0861

theorem block0861_domain : ExactDomain block0861 378 410 := by
  simpa only [values0861_size] using segment_domain 378 values0861

theorem block0861_get (i : Fin 32) :
    block0861 (378 + i.val) = some (values0861[i.val]'(by rw [values0861_size]; exact i.isLt)) := by
  exact segment_get 378 values0861 ⟨i.val, by rw [values0861_size]; exact i.isLt⟩

def values0862 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0862.coefficient59_410,
  OriginalRow227TriangleData0862.coefficient59_411,
  OriginalRow227TriangleData0862.coefficient59_412,
  OriginalRow227TriangleData0862.coefficient59_413,
  OriginalRow227TriangleData0862.coefficient59_414,
  OriginalRow227TriangleData0862.coefficient59_415,
  OriginalRow227TriangleData0862.coefficient59_416,
  OriginalRow227TriangleData0862.coefficient59_417,
  OriginalRow227TriangleData0862.coefficient59_418,
  OriginalRow227TriangleData0862.coefficient59_419,
  OriginalRow227TriangleData0862.coefficient59_420,
  OriginalRow227TriangleData0862.coefficient59_421,
  OriginalRow227TriangleData0862.coefficient59_422,
  OriginalRow227TriangleData0862.coefficient59_423,
  OriginalRow227TriangleData0862.coefficient59_424,
  OriginalRow227TriangleData0862.coefficient59_425,
  OriginalRow227TriangleData0862.coefficient59_426,
  OriginalRow227TriangleData0862.coefficient59_427,
  OriginalRow227TriangleData0862.coefficient59_428,
  OriginalRow227TriangleData0862.coefficient59_429,
  OriginalRow227TriangleData0862.coefficient59_430,
  OriginalRow227TriangleData0862.coefficient59_431,
  OriginalRow227TriangleData0862.coefficient59_432,
  OriginalRow227TriangleData0862.coefficient59_433,
  OriginalRow227TriangleData0862.coefficient59_434,
  OriginalRow227TriangleData0862.coefficient59_435,
  OriginalRow227TriangleData0862.coefficient59_436,
  OriginalRow227TriangleData0862.coefficient59_437,
  OriginalRow227TriangleData0862.coefficient59_438,
  OriginalRow227TriangleData0862.coefficient59_439,
  OriginalRow227TriangleData0862.coefficient59_440,
  OriginalRow227TriangleData0862.coefficient59_441
]

theorem values0862_size : values0862.size = 32 := rfl

def block0862 : ℕ → Option IntervalDyadic := segment 410 values0862

theorem block0862_domain : ExactDomain block0862 410 442 := by
  simpa only [values0862_size] using segment_domain 410 values0862

theorem block0862_get (i : Fin 32) :
    block0862 (410 + i.val) = some (values0862[i.val]'(by rw [values0862_size]; exact i.isLt)) := by
  exact segment_get 410 values0862 ⟨i.val, by rw [values0862_size]; exact i.isLt⟩

def values0863 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0863.coefficient59_442
]

theorem values0863_size : values0863.size = 1 := rfl

def block0863 : ℕ → Option IntervalDyadic := segment 442 values0863

theorem block0863_domain : ExactDomain block0863 442 443 := by
  simpa only [values0863_size] using segment_domain 442 values0863

theorem block0863_get (i : Fin 1) :
    block0863 (442 + i.val) = some (values0863[i.val]'(by rw [values0863_size]; exact i.isLt)) := by
  exact segment_get 442 values0863 ⟨i.val, by rw [values0863_size]; exact i.isLt⟩

def node0090_0154 : ℕ → Option IntervalDyadic := split 122 block0852 block0853

theorem node0090_0154_domain : ExactDomain node0090_0154 90 154 := by
  exact split_domain (by decide) (by decide) block0852_domain block0853_domain

def node0058_0154 : ℕ → Option IntervalDyadic := split 90 block0851 node0090_0154

theorem node0058_0154_domain : ExactDomain node0058_0154 58 154 := by
  exact split_domain (by decide) (by decide) block0851_domain node0090_0154_domain

def node0186_0250 : ℕ → Option IntervalDyadic := split 218 block0855 block0856

theorem node0186_0250_domain : ExactDomain node0186_0250 186 250 := by
  exact split_domain (by decide) (by decide) block0855_domain block0856_domain

def node0154_0250 : ℕ → Option IntervalDyadic := split 186 block0854 node0186_0250

theorem node0154_0250_domain : ExactDomain node0154_0250 154 250 := by
  exact split_domain (by decide) (by decide) block0854_domain node0186_0250_domain

def node0058_0250 : ℕ → Option IntervalDyadic := split 154 node0058_0154 node0154_0250

theorem node0058_0250_domain : ExactDomain node0058_0250 58 250 := by
  exact split_domain (by decide) (by decide) node0058_0154_domain node0154_0250_domain

def node0282_0346 : ℕ → Option IntervalDyadic := split 314 block0858 block0859

theorem node0282_0346_domain : ExactDomain node0282_0346 282 346 := by
  exact split_domain (by decide) (by decide) block0858_domain block0859_domain

def node0250_0346 : ℕ → Option IntervalDyadic := split 282 block0857 node0282_0346

theorem node0250_0346_domain : ExactDomain node0250_0346 250 346 := by
  exact split_domain (by decide) (by decide) block0857_domain node0282_0346_domain

def node0346_0410 : ℕ → Option IntervalDyadic := split 378 block0860 block0861

theorem node0346_0410_domain : ExactDomain node0346_0410 346 410 := by
  exact split_domain (by decide) (by decide) block0860_domain block0861_domain

def node0410_0443 : ℕ → Option IntervalDyadic := split 442 block0862 block0863

theorem node0410_0443_domain : ExactDomain node0410_0443 410 443 := by
  exact split_domain (by decide) (by decide) block0862_domain block0863_domain

def node0346_0443 : ℕ → Option IntervalDyadic := split 410 node0346_0410 node0410_0443

theorem node0346_0443_domain : ExactDomain node0346_0443 346 443 := by
  exact split_domain (by decide) (by decide) node0346_0410_domain node0410_0443_domain

def node0250_0443 : ℕ → Option IntervalDyadic := split 346 node0250_0346 node0346_0443

theorem node0250_0443_domain : ExactDomain node0250_0443 250 443 := by
  exact split_domain (by decide) (by decide) node0250_0346_domain node0346_0443_domain

def node0058_0443 : ℕ → Option IntervalDyadic := split 250 node0058_0250 node0250_0443

theorem node0058_0443_domain : ExactDomain node0058_0443 58 443 := by
  exact split_domain (by decide) (by decide) node0058_0250_domain node0250_0443_domain

def lookup : ℕ → Option IntervalDyadic := node0058_0443

theorem lookup_domain : ExactDomain lookup 58 443 :=
  node0058_0443_domain

theorem block0851_lookup (i : Fin 32) :
    lookup (58 + i.val) = some (values0851[i.val]'(by rw [values0851_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (58 + i.val) = _
  rw [node0058_0443, split_left 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0058_0250, split_left 154 node0058_0154 node0154_0250 (by omega)]
  rw [node0058_0154, split_left 90 block0851 node0090_0154 (by omega)]
  exact block0851_get i

theorem block0852_lookup (i : Fin 32) :
    lookup (90 + i.val) = some (values0852[i.val]'(by rw [values0852_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (90 + i.val) = _
  rw [node0058_0443, split_left 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0058_0250, split_left 154 node0058_0154 node0154_0250 (by omega)]
  rw [node0058_0154, split_right 90 block0851 node0090_0154 (by omega)]
  rw [node0090_0154, split_left 122 block0852 block0853 (by omega)]
  exact block0852_get i

theorem block0853_lookup (i : Fin 32) :
    lookup (122 + i.val) = some (values0853[i.val]'(by rw [values0853_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (122 + i.val) = _
  rw [node0058_0443, split_left 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0058_0250, split_left 154 node0058_0154 node0154_0250 (by omega)]
  rw [node0058_0154, split_right 90 block0851 node0090_0154 (by omega)]
  rw [node0090_0154, split_right 122 block0852 block0853 (by omega)]
  exact block0853_get i

theorem block0854_lookup (i : Fin 32) :
    lookup (154 + i.val) = some (values0854[i.val]'(by rw [values0854_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (154 + i.val) = _
  rw [node0058_0443, split_left 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0058_0250, split_right 154 node0058_0154 node0154_0250 (by omega)]
  rw [node0154_0250, split_left 186 block0854 node0186_0250 (by omega)]
  exact block0854_get i

theorem block0855_lookup (i : Fin 32) :
    lookup (186 + i.val) = some (values0855[i.val]'(by rw [values0855_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (186 + i.val) = _
  rw [node0058_0443, split_left 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0058_0250, split_right 154 node0058_0154 node0154_0250 (by omega)]
  rw [node0154_0250, split_right 186 block0854 node0186_0250 (by omega)]
  rw [node0186_0250, split_left 218 block0855 block0856 (by omega)]
  exact block0855_get i

theorem block0856_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values0856[i.val]'(by rw [values0856_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (218 + i.val) = _
  rw [node0058_0443, split_left 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0058_0250, split_right 154 node0058_0154 node0154_0250 (by omega)]
  rw [node0154_0250, split_right 186 block0854 node0186_0250 (by omega)]
  rw [node0186_0250, split_right 218 block0855 block0856 (by omega)]
  exact block0856_get i

theorem block0857_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values0857[i.val]'(by rw [values0857_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (250 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_left 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0250_0346, split_left 282 block0857 node0282_0346 (by omega)]
  exact block0857_get i

theorem block0858_lookup (i : Fin 32) :
    lookup (282 + i.val) = some (values0858[i.val]'(by rw [values0858_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (282 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_left 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0250_0346, split_right 282 block0857 node0282_0346 (by omega)]
  rw [node0282_0346, split_left 314 block0858 block0859 (by omega)]
  exact block0858_get i

theorem block0859_lookup (i : Fin 32) :
    lookup (314 + i.val) = some (values0859[i.val]'(by rw [values0859_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (314 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_left 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0250_0346, split_right 282 block0857 node0282_0346 (by omega)]
  rw [node0282_0346, split_right 314 block0858 block0859 (by omega)]
  exact block0859_get i

theorem block0860_lookup (i : Fin 32) :
    lookup (346 + i.val) = some (values0860[i.val]'(by rw [values0860_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (346 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_right 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0346_0443, split_left 410 node0346_0410 node0410_0443 (by omega)]
  rw [node0346_0410, split_left 378 block0860 block0861 (by omega)]
  exact block0860_get i

theorem block0861_lookup (i : Fin 32) :
    lookup (378 + i.val) = some (values0861[i.val]'(by rw [values0861_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (378 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_right 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0346_0443, split_left 410 node0346_0410 node0410_0443 (by omega)]
  rw [node0346_0410, split_right 378 block0860 block0861 (by omega)]
  exact block0861_get i

theorem block0862_lookup (i : Fin 32) :
    lookup (410 + i.val) = some (values0862[i.val]'(by rw [values0862_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (410 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_right 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0346_0443, split_right 410 node0346_0410 node0410_0443 (by omega)]
  rw [node0410_0443, split_left 442 block0862 block0863 (by omega)]
  exact block0862_get i

theorem block0863_lookup (i : Fin 1) :
    lookup (442 + i.val) = some (values0863[i.val]'(by rw [values0863_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0058_0443 (442 + i.val) = _
  rw [node0058_0443, split_right 250 node0058_0250 node0250_0443 (by omega)]
  rw [node0250_0443, split_right 346 node0250_0346 node0346_0443 (by omega)]
  rw [node0346_0443, split_right 410 node0346_0410 node0410_0443 (by omega)]
  rw [node0410_0443, split_right 442 block0862 block0863 (by omega)]
  exact block0863_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0851_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0851_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0852_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0852_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0853_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0853_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0854_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0854_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0855_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0855_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0856_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0856_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0857_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0857_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0858_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0858_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0859_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0859_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0860_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0860_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0861_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0861_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0862_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0862_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0863_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0863_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0851_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0852_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0853_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0854_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0855_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0856_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0857_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0858_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0859_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0860_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0861_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0862_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow059.block0863_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow059
