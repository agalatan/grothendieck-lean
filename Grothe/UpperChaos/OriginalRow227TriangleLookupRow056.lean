import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0812
import Grothe.UpperChaos.OriginalRow227TriangleData0813
import Grothe.UpperChaos.OriginalRow227TriangleData0814
import Grothe.UpperChaos.OriginalRow227TriangleData0815
import Grothe.UpperChaos.OriginalRow227TriangleData0816
import Grothe.UpperChaos.OriginalRow227TriangleData0817
import Grothe.UpperChaos.OriginalRow227TriangleData0818
import Grothe.UpperChaos.OriginalRow227TriangleData0819
import Grothe.UpperChaos.OriginalRow227TriangleData0820
import Grothe.UpperChaos.OriginalRow227TriangleData0821
import Grothe.UpperChaos.OriginalRow227TriangleData0822
import Grothe.UpperChaos.OriginalRow227TriangleData0823
import Grothe.UpperChaos.OriginalRow227TriangleData0824

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow056

open ConditionalTableLookup

def values0812 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0812.coefficient56_55,
  OriginalRow227TriangleData0812.coefficient56_56,
  OriginalRow227TriangleData0812.coefficient56_57,
  OriginalRow227TriangleData0812.coefficient56_58,
  OriginalRow227TriangleData0812.coefficient56_59,
  OriginalRow227TriangleData0812.coefficient56_60,
  OriginalRow227TriangleData0812.coefficient56_61,
  OriginalRow227TriangleData0812.coefficient56_62,
  OriginalRow227TriangleData0812.coefficient56_63,
  OriginalRow227TriangleData0812.coefficient56_64,
  OriginalRow227TriangleData0812.coefficient56_65,
  OriginalRow227TriangleData0812.coefficient56_66,
  OriginalRow227TriangleData0812.coefficient56_67,
  OriginalRow227TriangleData0812.coefficient56_68,
  OriginalRow227TriangleData0812.coefficient56_69,
  OriginalRow227TriangleData0812.coefficient56_70,
  OriginalRow227TriangleData0812.coefficient56_71,
  OriginalRow227TriangleData0812.coefficient56_72,
  OriginalRow227TriangleData0812.coefficient56_73,
  OriginalRow227TriangleData0812.coefficient56_74,
  OriginalRow227TriangleData0812.coefficient56_75,
  OriginalRow227TriangleData0812.coefficient56_76,
  OriginalRow227TriangleData0812.coefficient56_77,
  OriginalRow227TriangleData0812.coefficient56_78,
  OriginalRow227TriangleData0812.coefficient56_79,
  OriginalRow227TriangleData0812.coefficient56_80,
  OriginalRow227TriangleData0812.coefficient56_81,
  OriginalRow227TriangleData0812.coefficient56_82,
  OriginalRow227TriangleData0812.coefficient56_83,
  OriginalRow227TriangleData0812.coefficient56_84,
  OriginalRow227TriangleData0812.coefficient56_85,
  OriginalRow227TriangleData0812.coefficient56_86
]

theorem values0812_size : values0812.size = 32 := rfl

def block0812 : ℕ → Option IntervalDyadic := segment 55 values0812

theorem block0812_domain : ExactDomain block0812 55 87 := by
  simpa only [values0812_size] using segment_domain 55 values0812

theorem block0812_get (i : Fin 32) :
    block0812 (55 + i.val) = some (values0812[i.val]'(by rw [values0812_size]; exact i.isLt)) := by
  exact segment_get 55 values0812 ⟨i.val, by rw [values0812_size]; exact i.isLt⟩

def values0813 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0813.coefficient56_87,
  OriginalRow227TriangleData0813.coefficient56_88,
  OriginalRow227TriangleData0813.coefficient56_89,
  OriginalRow227TriangleData0813.coefficient56_90,
  OriginalRow227TriangleData0813.coefficient56_91,
  OriginalRow227TriangleData0813.coefficient56_92,
  OriginalRow227TriangleData0813.coefficient56_93,
  OriginalRow227TriangleData0813.coefficient56_94,
  OriginalRow227TriangleData0813.coefficient56_95,
  OriginalRow227TriangleData0813.coefficient56_96,
  OriginalRow227TriangleData0813.coefficient56_97,
  OriginalRow227TriangleData0813.coefficient56_98,
  OriginalRow227TriangleData0813.coefficient56_99,
  OriginalRow227TriangleData0813.coefficient56_100,
  OriginalRow227TriangleData0813.coefficient56_101,
  OriginalRow227TriangleData0813.coefficient56_102,
  OriginalRow227TriangleData0813.coefficient56_103,
  OriginalRow227TriangleData0813.coefficient56_104,
  OriginalRow227TriangleData0813.coefficient56_105,
  OriginalRow227TriangleData0813.coefficient56_106,
  OriginalRow227TriangleData0813.coefficient56_107,
  OriginalRow227TriangleData0813.coefficient56_108,
  OriginalRow227TriangleData0813.coefficient56_109,
  OriginalRow227TriangleData0813.coefficient56_110,
  OriginalRow227TriangleData0813.coefficient56_111,
  OriginalRow227TriangleData0813.coefficient56_112,
  OriginalRow227TriangleData0813.coefficient56_113,
  OriginalRow227TriangleData0813.coefficient56_114,
  OriginalRow227TriangleData0813.coefficient56_115,
  OriginalRow227TriangleData0813.coefficient56_116,
  OriginalRow227TriangleData0813.coefficient56_117,
  OriginalRow227TriangleData0813.coefficient56_118
]

theorem values0813_size : values0813.size = 32 := rfl

def block0813 : ℕ → Option IntervalDyadic := segment 87 values0813

theorem block0813_domain : ExactDomain block0813 87 119 := by
  simpa only [values0813_size] using segment_domain 87 values0813

theorem block0813_get (i : Fin 32) :
    block0813 (87 + i.val) = some (values0813[i.val]'(by rw [values0813_size]; exact i.isLt)) := by
  exact segment_get 87 values0813 ⟨i.val, by rw [values0813_size]; exact i.isLt⟩

def values0814 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0814.coefficient56_119,
  OriginalRow227TriangleData0814.coefficient56_120,
  OriginalRow227TriangleData0814.coefficient56_121,
  OriginalRow227TriangleData0814.coefficient56_122,
  OriginalRow227TriangleData0814.coefficient56_123,
  OriginalRow227TriangleData0814.coefficient56_124,
  OriginalRow227TriangleData0814.coefficient56_125,
  OriginalRow227TriangleData0814.coefficient56_126,
  OriginalRow227TriangleData0814.coefficient56_127,
  OriginalRow227TriangleData0814.coefficient56_128,
  OriginalRow227TriangleData0814.coefficient56_129,
  OriginalRow227TriangleData0814.coefficient56_130,
  OriginalRow227TriangleData0814.coefficient56_131,
  OriginalRow227TriangleData0814.coefficient56_132,
  OriginalRow227TriangleData0814.coefficient56_133,
  OriginalRow227TriangleData0814.coefficient56_134,
  OriginalRow227TriangleData0814.coefficient56_135,
  OriginalRow227TriangleData0814.coefficient56_136,
  OriginalRow227TriangleData0814.coefficient56_137,
  OriginalRow227TriangleData0814.coefficient56_138,
  OriginalRow227TriangleData0814.coefficient56_139,
  OriginalRow227TriangleData0814.coefficient56_140,
  OriginalRow227TriangleData0814.coefficient56_141,
  OriginalRow227TriangleData0814.coefficient56_142,
  OriginalRow227TriangleData0814.coefficient56_143,
  OriginalRow227TriangleData0814.coefficient56_144,
  OriginalRow227TriangleData0814.coefficient56_145,
  OriginalRow227TriangleData0814.coefficient56_146,
  OriginalRow227TriangleData0814.coefficient56_147,
  OriginalRow227TriangleData0814.coefficient56_148,
  OriginalRow227TriangleData0814.coefficient56_149,
  OriginalRow227TriangleData0814.coefficient56_150
]

theorem values0814_size : values0814.size = 32 := rfl

def block0814 : ℕ → Option IntervalDyadic := segment 119 values0814

theorem block0814_domain : ExactDomain block0814 119 151 := by
  simpa only [values0814_size] using segment_domain 119 values0814

theorem block0814_get (i : Fin 32) :
    block0814 (119 + i.val) = some (values0814[i.val]'(by rw [values0814_size]; exact i.isLt)) := by
  exact segment_get 119 values0814 ⟨i.val, by rw [values0814_size]; exact i.isLt⟩

def values0815 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0815.coefficient56_151,
  OriginalRow227TriangleData0815.coefficient56_152,
  OriginalRow227TriangleData0815.coefficient56_153,
  OriginalRow227TriangleData0815.coefficient56_154,
  OriginalRow227TriangleData0815.coefficient56_155,
  OriginalRow227TriangleData0815.coefficient56_156,
  OriginalRow227TriangleData0815.coefficient56_157,
  OriginalRow227TriangleData0815.coefficient56_158,
  OriginalRow227TriangleData0815.coefficient56_159,
  OriginalRow227TriangleData0815.coefficient56_160,
  OriginalRow227TriangleData0815.coefficient56_161,
  OriginalRow227TriangleData0815.coefficient56_162,
  OriginalRow227TriangleData0815.coefficient56_163,
  OriginalRow227TriangleData0815.coefficient56_164,
  OriginalRow227TriangleData0815.coefficient56_165,
  OriginalRow227TriangleData0815.coefficient56_166,
  OriginalRow227TriangleData0815.coefficient56_167,
  OriginalRow227TriangleData0815.coefficient56_168,
  OriginalRow227TriangleData0815.coefficient56_169,
  OriginalRow227TriangleData0815.coefficient56_170,
  OriginalRow227TriangleData0815.coefficient56_171,
  OriginalRow227TriangleData0815.coefficient56_172,
  OriginalRow227TriangleData0815.coefficient56_173,
  OriginalRow227TriangleData0815.coefficient56_174,
  OriginalRow227TriangleData0815.coefficient56_175,
  OriginalRow227TriangleData0815.coefficient56_176,
  OriginalRow227TriangleData0815.coefficient56_177,
  OriginalRow227TriangleData0815.coefficient56_178,
  OriginalRow227TriangleData0815.coefficient56_179,
  OriginalRow227TriangleData0815.coefficient56_180,
  OriginalRow227TriangleData0815.coefficient56_181,
  OriginalRow227TriangleData0815.coefficient56_182
]

theorem values0815_size : values0815.size = 32 := rfl

def block0815 : ℕ → Option IntervalDyadic := segment 151 values0815

theorem block0815_domain : ExactDomain block0815 151 183 := by
  simpa only [values0815_size] using segment_domain 151 values0815

theorem block0815_get (i : Fin 32) :
    block0815 (151 + i.val) = some (values0815[i.val]'(by rw [values0815_size]; exact i.isLt)) := by
  exact segment_get 151 values0815 ⟨i.val, by rw [values0815_size]; exact i.isLt⟩

def values0816 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0816.coefficient56_183,
  OriginalRow227TriangleData0816.coefficient56_184,
  OriginalRow227TriangleData0816.coefficient56_185,
  OriginalRow227TriangleData0816.coefficient56_186,
  OriginalRow227TriangleData0816.coefficient56_187,
  OriginalRow227TriangleData0816.coefficient56_188,
  OriginalRow227TriangleData0816.coefficient56_189,
  OriginalRow227TriangleData0816.coefficient56_190,
  OriginalRow227TriangleData0816.coefficient56_191,
  OriginalRow227TriangleData0816.coefficient56_192,
  OriginalRow227TriangleData0816.coefficient56_193,
  OriginalRow227TriangleData0816.coefficient56_194,
  OriginalRow227TriangleData0816.coefficient56_195,
  OriginalRow227TriangleData0816.coefficient56_196,
  OriginalRow227TriangleData0816.coefficient56_197,
  OriginalRow227TriangleData0816.coefficient56_198,
  OriginalRow227TriangleData0816.coefficient56_199,
  OriginalRow227TriangleData0816.coefficient56_200,
  OriginalRow227TriangleData0816.coefficient56_201,
  OriginalRow227TriangleData0816.coefficient56_202,
  OriginalRow227TriangleData0816.coefficient56_203,
  OriginalRow227TriangleData0816.coefficient56_204,
  OriginalRow227TriangleData0816.coefficient56_205,
  OriginalRow227TriangleData0816.coefficient56_206,
  OriginalRow227TriangleData0816.coefficient56_207,
  OriginalRow227TriangleData0816.coefficient56_208,
  OriginalRow227TriangleData0816.coefficient56_209,
  OriginalRow227TriangleData0816.coefficient56_210,
  OriginalRow227TriangleData0816.coefficient56_211,
  OriginalRow227TriangleData0816.coefficient56_212,
  OriginalRow227TriangleData0816.coefficient56_213,
  OriginalRow227TriangleData0816.coefficient56_214
]

theorem values0816_size : values0816.size = 32 := rfl

def block0816 : ℕ → Option IntervalDyadic := segment 183 values0816

theorem block0816_domain : ExactDomain block0816 183 215 := by
  simpa only [values0816_size] using segment_domain 183 values0816

theorem block0816_get (i : Fin 32) :
    block0816 (183 + i.val) = some (values0816[i.val]'(by rw [values0816_size]; exact i.isLt)) := by
  exact segment_get 183 values0816 ⟨i.val, by rw [values0816_size]; exact i.isLt⟩

def values0817 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0817.coefficient56_215,
  OriginalRow227TriangleData0817.coefficient56_216,
  OriginalRow227TriangleData0817.coefficient56_217,
  OriginalRow227TriangleData0817.coefficient56_218,
  OriginalRow227TriangleData0817.coefficient56_219,
  OriginalRow227TriangleData0817.coefficient56_220,
  OriginalRow227TriangleData0817.coefficient56_221,
  OriginalRow227TriangleData0817.coefficient56_222,
  OriginalRow227TriangleData0817.coefficient56_223,
  OriginalRow227TriangleData0817.coefficient56_224,
  OriginalRow227TriangleData0817.coefficient56_225,
  OriginalRow227TriangleData0817.coefficient56_226,
  OriginalRow227TriangleData0817.coefficient56_227,
  OriginalRow227TriangleData0817.coefficient56_228,
  OriginalRow227TriangleData0817.coefficient56_229,
  OriginalRow227TriangleData0817.coefficient56_230,
  OriginalRow227TriangleData0817.coefficient56_231,
  OriginalRow227TriangleData0817.coefficient56_232,
  OriginalRow227TriangleData0817.coefficient56_233,
  OriginalRow227TriangleData0817.coefficient56_234,
  OriginalRow227TriangleData0817.coefficient56_235,
  OriginalRow227TriangleData0817.coefficient56_236,
  OriginalRow227TriangleData0817.coefficient56_237,
  OriginalRow227TriangleData0817.coefficient56_238,
  OriginalRow227TriangleData0817.coefficient56_239,
  OriginalRow227TriangleData0817.coefficient56_240,
  OriginalRow227TriangleData0817.coefficient56_241,
  OriginalRow227TriangleData0817.coefficient56_242,
  OriginalRow227TriangleData0817.coefficient56_243,
  OriginalRow227TriangleData0817.coefficient56_244,
  OriginalRow227TriangleData0817.coefficient56_245,
  OriginalRow227TriangleData0817.coefficient56_246
]

theorem values0817_size : values0817.size = 32 := rfl

def block0817 : ℕ → Option IntervalDyadic := segment 215 values0817

theorem block0817_domain : ExactDomain block0817 215 247 := by
  simpa only [values0817_size] using segment_domain 215 values0817

theorem block0817_get (i : Fin 32) :
    block0817 (215 + i.val) = some (values0817[i.val]'(by rw [values0817_size]; exact i.isLt)) := by
  exact segment_get 215 values0817 ⟨i.val, by rw [values0817_size]; exact i.isLt⟩

def values0818 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0818.coefficient56_247,
  OriginalRow227TriangleData0818.coefficient56_248,
  OriginalRow227TriangleData0818.coefficient56_249,
  OriginalRow227TriangleData0818.coefficient56_250,
  OriginalRow227TriangleData0818.coefficient56_251,
  OriginalRow227TriangleData0818.coefficient56_252,
  OriginalRow227TriangleData0818.coefficient56_253,
  OriginalRow227TriangleData0818.coefficient56_254,
  OriginalRow227TriangleData0818.coefficient56_255,
  OriginalRow227TriangleData0818.coefficient56_256,
  OriginalRow227TriangleData0818.coefficient56_257,
  OriginalRow227TriangleData0818.coefficient56_258,
  OriginalRow227TriangleData0818.coefficient56_259,
  OriginalRow227TriangleData0818.coefficient56_260,
  OriginalRow227TriangleData0818.coefficient56_261,
  OriginalRow227TriangleData0818.coefficient56_262,
  OriginalRow227TriangleData0818.coefficient56_263,
  OriginalRow227TriangleData0818.coefficient56_264,
  OriginalRow227TriangleData0818.coefficient56_265,
  OriginalRow227TriangleData0818.coefficient56_266,
  OriginalRow227TriangleData0818.coefficient56_267,
  OriginalRow227TriangleData0818.coefficient56_268,
  OriginalRow227TriangleData0818.coefficient56_269,
  OriginalRow227TriangleData0818.coefficient56_270,
  OriginalRow227TriangleData0818.coefficient56_271,
  OriginalRow227TriangleData0818.coefficient56_272,
  OriginalRow227TriangleData0818.coefficient56_273,
  OriginalRow227TriangleData0818.coefficient56_274,
  OriginalRow227TriangleData0818.coefficient56_275,
  OriginalRow227TriangleData0818.coefficient56_276,
  OriginalRow227TriangleData0818.coefficient56_277,
  OriginalRow227TriangleData0818.coefficient56_278
]

theorem values0818_size : values0818.size = 32 := rfl

def block0818 : ℕ → Option IntervalDyadic := segment 247 values0818

theorem block0818_domain : ExactDomain block0818 247 279 := by
  simpa only [values0818_size] using segment_domain 247 values0818

theorem block0818_get (i : Fin 32) :
    block0818 (247 + i.val) = some (values0818[i.val]'(by rw [values0818_size]; exact i.isLt)) := by
  exact segment_get 247 values0818 ⟨i.val, by rw [values0818_size]; exact i.isLt⟩

def values0819 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0819.coefficient56_279,
  OriginalRow227TriangleData0819.coefficient56_280,
  OriginalRow227TriangleData0819.coefficient56_281,
  OriginalRow227TriangleData0819.coefficient56_282,
  OriginalRow227TriangleData0819.coefficient56_283,
  OriginalRow227TriangleData0819.coefficient56_284,
  OriginalRow227TriangleData0819.coefficient56_285,
  OriginalRow227TriangleData0819.coefficient56_286,
  OriginalRow227TriangleData0819.coefficient56_287,
  OriginalRow227TriangleData0819.coefficient56_288,
  OriginalRow227TriangleData0819.coefficient56_289,
  OriginalRow227TriangleData0819.coefficient56_290,
  OriginalRow227TriangleData0819.coefficient56_291,
  OriginalRow227TriangleData0819.coefficient56_292,
  OriginalRow227TriangleData0819.coefficient56_293,
  OriginalRow227TriangleData0819.coefficient56_294,
  OriginalRow227TriangleData0819.coefficient56_295,
  OriginalRow227TriangleData0819.coefficient56_296,
  OriginalRow227TriangleData0819.coefficient56_297,
  OriginalRow227TriangleData0819.coefficient56_298,
  OriginalRow227TriangleData0819.coefficient56_299,
  OriginalRow227TriangleData0819.coefficient56_300,
  OriginalRow227TriangleData0819.coefficient56_301,
  OriginalRow227TriangleData0819.coefficient56_302,
  OriginalRow227TriangleData0819.coefficient56_303,
  OriginalRow227TriangleData0819.coefficient56_304,
  OriginalRow227TriangleData0819.coefficient56_305,
  OriginalRow227TriangleData0819.coefficient56_306,
  OriginalRow227TriangleData0819.coefficient56_307,
  OriginalRow227TriangleData0819.coefficient56_308,
  OriginalRow227TriangleData0819.coefficient56_309,
  OriginalRow227TriangleData0819.coefficient56_310
]

theorem values0819_size : values0819.size = 32 := rfl

def block0819 : ℕ → Option IntervalDyadic := segment 279 values0819

theorem block0819_domain : ExactDomain block0819 279 311 := by
  simpa only [values0819_size] using segment_domain 279 values0819

theorem block0819_get (i : Fin 32) :
    block0819 (279 + i.val) = some (values0819[i.val]'(by rw [values0819_size]; exact i.isLt)) := by
  exact segment_get 279 values0819 ⟨i.val, by rw [values0819_size]; exact i.isLt⟩

def values0820 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0820.coefficient56_311,
  OriginalRow227TriangleData0820.coefficient56_312,
  OriginalRow227TriangleData0820.coefficient56_313,
  OriginalRow227TriangleData0820.coefficient56_314,
  OriginalRow227TriangleData0820.coefficient56_315,
  OriginalRow227TriangleData0820.coefficient56_316,
  OriginalRow227TriangleData0820.coefficient56_317,
  OriginalRow227TriangleData0820.coefficient56_318,
  OriginalRow227TriangleData0820.coefficient56_319,
  OriginalRow227TriangleData0820.coefficient56_320,
  OriginalRow227TriangleData0820.coefficient56_321,
  OriginalRow227TriangleData0820.coefficient56_322,
  OriginalRow227TriangleData0820.coefficient56_323,
  OriginalRow227TriangleData0820.coefficient56_324,
  OriginalRow227TriangleData0820.coefficient56_325,
  OriginalRow227TriangleData0820.coefficient56_326,
  OriginalRow227TriangleData0820.coefficient56_327,
  OriginalRow227TriangleData0820.coefficient56_328,
  OriginalRow227TriangleData0820.coefficient56_329,
  OriginalRow227TriangleData0820.coefficient56_330,
  OriginalRow227TriangleData0820.coefficient56_331,
  OriginalRow227TriangleData0820.coefficient56_332,
  OriginalRow227TriangleData0820.coefficient56_333,
  OriginalRow227TriangleData0820.coefficient56_334,
  OriginalRow227TriangleData0820.coefficient56_335,
  OriginalRow227TriangleData0820.coefficient56_336,
  OriginalRow227TriangleData0820.coefficient56_337,
  OriginalRow227TriangleData0820.coefficient56_338,
  OriginalRow227TriangleData0820.coefficient56_339,
  OriginalRow227TriangleData0820.coefficient56_340,
  OriginalRow227TriangleData0820.coefficient56_341,
  OriginalRow227TriangleData0820.coefficient56_342
]

theorem values0820_size : values0820.size = 32 := rfl

def block0820 : ℕ → Option IntervalDyadic := segment 311 values0820

theorem block0820_domain : ExactDomain block0820 311 343 := by
  simpa only [values0820_size] using segment_domain 311 values0820

theorem block0820_get (i : Fin 32) :
    block0820 (311 + i.val) = some (values0820[i.val]'(by rw [values0820_size]; exact i.isLt)) := by
  exact segment_get 311 values0820 ⟨i.val, by rw [values0820_size]; exact i.isLt⟩

def values0821 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0821.coefficient56_343,
  OriginalRow227TriangleData0821.coefficient56_344,
  OriginalRow227TriangleData0821.coefficient56_345,
  OriginalRow227TriangleData0821.coefficient56_346,
  OriginalRow227TriangleData0821.coefficient56_347,
  OriginalRow227TriangleData0821.coefficient56_348,
  OriginalRow227TriangleData0821.coefficient56_349,
  OriginalRow227TriangleData0821.coefficient56_350,
  OriginalRow227TriangleData0821.coefficient56_351,
  OriginalRow227TriangleData0821.coefficient56_352,
  OriginalRow227TriangleData0821.coefficient56_353,
  OriginalRow227TriangleData0821.coefficient56_354,
  OriginalRow227TriangleData0821.coefficient56_355,
  OriginalRow227TriangleData0821.coefficient56_356,
  OriginalRow227TriangleData0821.coefficient56_357,
  OriginalRow227TriangleData0821.coefficient56_358,
  OriginalRow227TriangleData0821.coefficient56_359,
  OriginalRow227TriangleData0821.coefficient56_360,
  OriginalRow227TriangleData0821.coefficient56_361,
  OriginalRow227TriangleData0821.coefficient56_362,
  OriginalRow227TriangleData0821.coefficient56_363,
  OriginalRow227TriangleData0821.coefficient56_364,
  OriginalRow227TriangleData0821.coefficient56_365,
  OriginalRow227TriangleData0821.coefficient56_366,
  OriginalRow227TriangleData0821.coefficient56_367,
  OriginalRow227TriangleData0821.coefficient56_368,
  OriginalRow227TriangleData0821.coefficient56_369,
  OriginalRow227TriangleData0821.coefficient56_370,
  OriginalRow227TriangleData0821.coefficient56_371,
  OriginalRow227TriangleData0821.coefficient56_372,
  OriginalRow227TriangleData0821.coefficient56_373,
  OriginalRow227TriangleData0821.coefficient56_374
]

theorem values0821_size : values0821.size = 32 := rfl

def block0821 : ℕ → Option IntervalDyadic := segment 343 values0821

theorem block0821_domain : ExactDomain block0821 343 375 := by
  simpa only [values0821_size] using segment_domain 343 values0821

theorem block0821_get (i : Fin 32) :
    block0821 (343 + i.val) = some (values0821[i.val]'(by rw [values0821_size]; exact i.isLt)) := by
  exact segment_get 343 values0821 ⟨i.val, by rw [values0821_size]; exact i.isLt⟩

def values0822 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0822.coefficient56_375,
  OriginalRow227TriangleData0822.coefficient56_376,
  OriginalRow227TriangleData0822.coefficient56_377,
  OriginalRow227TriangleData0822.coefficient56_378,
  OriginalRow227TriangleData0822.coefficient56_379,
  OriginalRow227TriangleData0822.coefficient56_380,
  OriginalRow227TriangleData0822.coefficient56_381,
  OriginalRow227TriangleData0822.coefficient56_382,
  OriginalRow227TriangleData0822.coefficient56_383,
  OriginalRow227TriangleData0822.coefficient56_384,
  OriginalRow227TriangleData0822.coefficient56_385,
  OriginalRow227TriangleData0822.coefficient56_386,
  OriginalRow227TriangleData0822.coefficient56_387,
  OriginalRow227TriangleData0822.coefficient56_388,
  OriginalRow227TriangleData0822.coefficient56_389,
  OriginalRow227TriangleData0822.coefficient56_390,
  OriginalRow227TriangleData0822.coefficient56_391,
  OriginalRow227TriangleData0822.coefficient56_392,
  OriginalRow227TriangleData0822.coefficient56_393,
  OriginalRow227TriangleData0822.coefficient56_394,
  OriginalRow227TriangleData0822.coefficient56_395,
  OriginalRow227TriangleData0822.coefficient56_396,
  OriginalRow227TriangleData0822.coefficient56_397,
  OriginalRow227TriangleData0822.coefficient56_398,
  OriginalRow227TriangleData0822.coefficient56_399,
  OriginalRow227TriangleData0822.coefficient56_400,
  OriginalRow227TriangleData0822.coefficient56_401,
  OriginalRow227TriangleData0822.coefficient56_402,
  OriginalRow227TriangleData0822.coefficient56_403,
  OriginalRow227TriangleData0822.coefficient56_404,
  OriginalRow227TriangleData0822.coefficient56_405,
  OriginalRow227TriangleData0822.coefficient56_406
]

theorem values0822_size : values0822.size = 32 := rfl

def block0822 : ℕ → Option IntervalDyadic := segment 375 values0822

theorem block0822_domain : ExactDomain block0822 375 407 := by
  simpa only [values0822_size] using segment_domain 375 values0822

theorem block0822_get (i : Fin 32) :
    block0822 (375 + i.val) = some (values0822[i.val]'(by rw [values0822_size]; exact i.isLt)) := by
  exact segment_get 375 values0822 ⟨i.val, by rw [values0822_size]; exact i.isLt⟩

def values0823 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0823.coefficient56_407,
  OriginalRow227TriangleData0823.coefficient56_408,
  OriginalRow227TriangleData0823.coefficient56_409,
  OriginalRow227TriangleData0823.coefficient56_410,
  OriginalRow227TriangleData0823.coefficient56_411,
  OriginalRow227TriangleData0823.coefficient56_412,
  OriginalRow227TriangleData0823.coefficient56_413,
  OriginalRow227TriangleData0823.coefficient56_414,
  OriginalRow227TriangleData0823.coefficient56_415,
  OriginalRow227TriangleData0823.coefficient56_416,
  OriginalRow227TriangleData0823.coefficient56_417,
  OriginalRow227TriangleData0823.coefficient56_418,
  OriginalRow227TriangleData0823.coefficient56_419,
  OriginalRow227TriangleData0823.coefficient56_420,
  OriginalRow227TriangleData0823.coefficient56_421,
  OriginalRow227TriangleData0823.coefficient56_422,
  OriginalRow227TriangleData0823.coefficient56_423,
  OriginalRow227TriangleData0823.coefficient56_424,
  OriginalRow227TriangleData0823.coefficient56_425,
  OriginalRow227TriangleData0823.coefficient56_426,
  OriginalRow227TriangleData0823.coefficient56_427,
  OriginalRow227TriangleData0823.coefficient56_428,
  OriginalRow227TriangleData0823.coefficient56_429,
  OriginalRow227TriangleData0823.coefficient56_430,
  OriginalRow227TriangleData0823.coefficient56_431,
  OriginalRow227TriangleData0823.coefficient56_432,
  OriginalRow227TriangleData0823.coefficient56_433,
  OriginalRow227TriangleData0823.coefficient56_434,
  OriginalRow227TriangleData0823.coefficient56_435,
  OriginalRow227TriangleData0823.coefficient56_436,
  OriginalRow227TriangleData0823.coefficient56_437,
  OriginalRow227TriangleData0823.coefficient56_438
]

theorem values0823_size : values0823.size = 32 := rfl

def block0823 : ℕ → Option IntervalDyadic := segment 407 values0823

theorem block0823_domain : ExactDomain block0823 407 439 := by
  simpa only [values0823_size] using segment_domain 407 values0823

theorem block0823_get (i : Fin 32) :
    block0823 (407 + i.val) = some (values0823[i.val]'(by rw [values0823_size]; exact i.isLt)) := by
  exact segment_get 407 values0823 ⟨i.val, by rw [values0823_size]; exact i.isLt⟩

def values0824 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0824.coefficient56_439,
  OriginalRow227TriangleData0824.coefficient56_440,
  OriginalRow227TriangleData0824.coefficient56_441,
  OriginalRow227TriangleData0824.coefficient56_442,
  OriginalRow227TriangleData0824.coefficient56_443,
  OriginalRow227TriangleData0824.coefficient56_444,
  OriginalRow227TriangleData0824.coefficient56_445
]

theorem values0824_size : values0824.size = 7 := rfl

def block0824 : ℕ → Option IntervalDyadic := segment 439 values0824

theorem block0824_domain : ExactDomain block0824 439 446 := by
  simpa only [values0824_size] using segment_domain 439 values0824

theorem block0824_get (i : Fin 7) :
    block0824 (439 + i.val) = some (values0824[i.val]'(by rw [values0824_size]; exact i.isLt)) := by
  exact segment_get 439 values0824 ⟨i.val, by rw [values0824_size]; exact i.isLt⟩

def node0087_0151 : ℕ → Option IntervalDyadic := split 119 block0813 block0814

theorem node0087_0151_domain : ExactDomain node0087_0151 87 151 := by
  exact split_domain (by decide) (by decide) block0813_domain block0814_domain

def node0055_0151 : ℕ → Option IntervalDyadic := split 87 block0812 node0087_0151

theorem node0055_0151_domain : ExactDomain node0055_0151 55 151 := by
  exact split_domain (by decide) (by decide) block0812_domain node0087_0151_domain

def node0183_0247 : ℕ → Option IntervalDyadic := split 215 block0816 block0817

theorem node0183_0247_domain : ExactDomain node0183_0247 183 247 := by
  exact split_domain (by decide) (by decide) block0816_domain block0817_domain

def node0151_0247 : ℕ → Option IntervalDyadic := split 183 block0815 node0183_0247

theorem node0151_0247_domain : ExactDomain node0151_0247 151 247 := by
  exact split_domain (by decide) (by decide) block0815_domain node0183_0247_domain

def node0055_0247 : ℕ → Option IntervalDyadic := split 151 node0055_0151 node0151_0247

theorem node0055_0247_domain : ExactDomain node0055_0247 55 247 := by
  exact split_domain (by decide) (by decide) node0055_0151_domain node0151_0247_domain

def node0279_0343 : ℕ → Option IntervalDyadic := split 311 block0819 block0820

theorem node0279_0343_domain : ExactDomain node0279_0343 279 343 := by
  exact split_domain (by decide) (by decide) block0819_domain block0820_domain

def node0247_0343 : ℕ → Option IntervalDyadic := split 279 block0818 node0279_0343

theorem node0247_0343_domain : ExactDomain node0247_0343 247 343 := by
  exact split_domain (by decide) (by decide) block0818_domain node0279_0343_domain

def node0343_0407 : ℕ → Option IntervalDyadic := split 375 block0821 block0822

theorem node0343_0407_domain : ExactDomain node0343_0407 343 407 := by
  exact split_domain (by decide) (by decide) block0821_domain block0822_domain

def node0407_0446 : ℕ → Option IntervalDyadic := split 439 block0823 block0824

theorem node0407_0446_domain : ExactDomain node0407_0446 407 446 := by
  exact split_domain (by decide) (by decide) block0823_domain block0824_domain

def node0343_0446 : ℕ → Option IntervalDyadic := split 407 node0343_0407 node0407_0446

theorem node0343_0446_domain : ExactDomain node0343_0446 343 446 := by
  exact split_domain (by decide) (by decide) node0343_0407_domain node0407_0446_domain

def node0247_0446 : ℕ → Option IntervalDyadic := split 343 node0247_0343 node0343_0446

theorem node0247_0446_domain : ExactDomain node0247_0446 247 446 := by
  exact split_domain (by decide) (by decide) node0247_0343_domain node0343_0446_domain

def node0055_0446 : ℕ → Option IntervalDyadic := split 247 node0055_0247 node0247_0446

theorem node0055_0446_domain : ExactDomain node0055_0446 55 446 := by
  exact split_domain (by decide) (by decide) node0055_0247_domain node0247_0446_domain

def lookup : ℕ → Option IntervalDyadic := node0055_0446

theorem lookup_domain : ExactDomain lookup 55 446 :=
  node0055_0446_domain

theorem block0812_lookup (i : Fin 32) :
    lookup (55 + i.val) = some (values0812[i.val]'(by rw [values0812_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (55 + i.val) = _
  rw [node0055_0446, split_left 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0055_0247, split_left 151 node0055_0151 node0151_0247 (by omega)]
  rw [node0055_0151, split_left 87 block0812 node0087_0151 (by omega)]
  exact block0812_get i

theorem block0813_lookup (i : Fin 32) :
    lookup (87 + i.val) = some (values0813[i.val]'(by rw [values0813_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (87 + i.val) = _
  rw [node0055_0446, split_left 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0055_0247, split_left 151 node0055_0151 node0151_0247 (by omega)]
  rw [node0055_0151, split_right 87 block0812 node0087_0151 (by omega)]
  rw [node0087_0151, split_left 119 block0813 block0814 (by omega)]
  exact block0813_get i

theorem block0814_lookup (i : Fin 32) :
    lookup (119 + i.val) = some (values0814[i.val]'(by rw [values0814_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (119 + i.val) = _
  rw [node0055_0446, split_left 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0055_0247, split_left 151 node0055_0151 node0151_0247 (by omega)]
  rw [node0055_0151, split_right 87 block0812 node0087_0151 (by omega)]
  rw [node0087_0151, split_right 119 block0813 block0814 (by omega)]
  exact block0814_get i

theorem block0815_lookup (i : Fin 32) :
    lookup (151 + i.val) = some (values0815[i.val]'(by rw [values0815_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (151 + i.val) = _
  rw [node0055_0446, split_left 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0055_0247, split_right 151 node0055_0151 node0151_0247 (by omega)]
  rw [node0151_0247, split_left 183 block0815 node0183_0247 (by omega)]
  exact block0815_get i

theorem block0816_lookup (i : Fin 32) :
    lookup (183 + i.val) = some (values0816[i.val]'(by rw [values0816_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (183 + i.val) = _
  rw [node0055_0446, split_left 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0055_0247, split_right 151 node0055_0151 node0151_0247 (by omega)]
  rw [node0151_0247, split_right 183 block0815 node0183_0247 (by omega)]
  rw [node0183_0247, split_left 215 block0816 block0817 (by omega)]
  exact block0816_get i

theorem block0817_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values0817[i.val]'(by rw [values0817_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (215 + i.val) = _
  rw [node0055_0446, split_left 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0055_0247, split_right 151 node0055_0151 node0151_0247 (by omega)]
  rw [node0151_0247, split_right 183 block0815 node0183_0247 (by omega)]
  rw [node0183_0247, split_right 215 block0816 block0817 (by omega)]
  exact block0817_get i

theorem block0818_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values0818[i.val]'(by rw [values0818_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (247 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_left 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0247_0343, split_left 279 block0818 node0279_0343 (by omega)]
  exact block0818_get i

theorem block0819_lookup (i : Fin 32) :
    lookup (279 + i.val) = some (values0819[i.val]'(by rw [values0819_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (279 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_left 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0247_0343, split_right 279 block0818 node0279_0343 (by omega)]
  rw [node0279_0343, split_left 311 block0819 block0820 (by omega)]
  exact block0819_get i

theorem block0820_lookup (i : Fin 32) :
    lookup (311 + i.val) = some (values0820[i.val]'(by rw [values0820_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (311 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_left 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0247_0343, split_right 279 block0818 node0279_0343 (by omega)]
  rw [node0279_0343, split_right 311 block0819 block0820 (by omega)]
  exact block0820_get i

theorem block0821_lookup (i : Fin 32) :
    lookup (343 + i.val) = some (values0821[i.val]'(by rw [values0821_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (343 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_right 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0343_0446, split_left 407 node0343_0407 node0407_0446 (by omega)]
  rw [node0343_0407, split_left 375 block0821 block0822 (by omega)]
  exact block0821_get i

theorem block0822_lookup (i : Fin 32) :
    lookup (375 + i.val) = some (values0822[i.val]'(by rw [values0822_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (375 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_right 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0343_0446, split_left 407 node0343_0407 node0407_0446 (by omega)]
  rw [node0343_0407, split_right 375 block0821 block0822 (by omega)]
  exact block0822_get i

theorem block0823_lookup (i : Fin 32) :
    lookup (407 + i.val) = some (values0823[i.val]'(by rw [values0823_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (407 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_right 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0343_0446, split_right 407 node0343_0407 node0407_0446 (by omega)]
  rw [node0407_0446, split_left 439 block0823 block0824 (by omega)]
  exact block0823_get i

theorem block0824_lookup (i : Fin 7) :
    lookup (439 + i.val) = some (values0824[i.val]'(by rw [values0824_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0055_0446 (439 + i.val) = _
  rw [node0055_0446, split_right 247 node0055_0247 node0247_0446 (by omega)]
  rw [node0247_0446, split_right 343 node0247_0343 node0343_0446 (by omega)]
  rw [node0343_0446, split_right 407 node0343_0407 node0407_0446 (by omega)]
  rw [node0407_0446, split_right 439 block0823 block0824 (by omega)]
  exact block0824_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0812_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0812_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0813_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0813_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0814_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0814_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0815_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0815_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0816_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0816_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0817_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0817_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0818_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0818_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0819_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0819_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0820_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0820_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0821_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0821_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0822_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0822_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0823_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0823_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0824_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0824_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0812_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0813_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0814_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0815_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0816_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0817_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0818_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0819_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0820_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0821_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0822_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0823_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow056.block0824_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow056
