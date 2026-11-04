import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0876
import Grothe.UpperChaos.OriginalRow227TriangleData0877
import Grothe.UpperChaos.OriginalRow227TriangleData0878
import Grothe.UpperChaos.OriginalRow227TriangleData0879
import Grothe.UpperChaos.OriginalRow227TriangleData0880
import Grothe.UpperChaos.OriginalRow227TriangleData0881
import Grothe.UpperChaos.OriginalRow227TriangleData0882
import Grothe.UpperChaos.OriginalRow227TriangleData0883
import Grothe.UpperChaos.OriginalRow227TriangleData0884
import Grothe.UpperChaos.OriginalRow227TriangleData0885
import Grothe.UpperChaos.OriginalRow227TriangleData0886
import Grothe.UpperChaos.OriginalRow227TriangleData0887

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow061

open ConditionalTableLookup

def values0876 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0876.coefficient61_60,
  OriginalRow227TriangleData0876.coefficient61_61,
  OriginalRow227TriangleData0876.coefficient61_62,
  OriginalRow227TriangleData0876.coefficient61_63,
  OriginalRow227TriangleData0876.coefficient61_64,
  OriginalRow227TriangleData0876.coefficient61_65,
  OriginalRow227TriangleData0876.coefficient61_66,
  OriginalRow227TriangleData0876.coefficient61_67,
  OriginalRow227TriangleData0876.coefficient61_68,
  OriginalRow227TriangleData0876.coefficient61_69,
  OriginalRow227TriangleData0876.coefficient61_70,
  OriginalRow227TriangleData0876.coefficient61_71,
  OriginalRow227TriangleData0876.coefficient61_72,
  OriginalRow227TriangleData0876.coefficient61_73,
  OriginalRow227TriangleData0876.coefficient61_74,
  OriginalRow227TriangleData0876.coefficient61_75,
  OriginalRow227TriangleData0876.coefficient61_76,
  OriginalRow227TriangleData0876.coefficient61_77,
  OriginalRow227TriangleData0876.coefficient61_78,
  OriginalRow227TriangleData0876.coefficient61_79,
  OriginalRow227TriangleData0876.coefficient61_80,
  OriginalRow227TriangleData0876.coefficient61_81,
  OriginalRow227TriangleData0876.coefficient61_82,
  OriginalRow227TriangleData0876.coefficient61_83,
  OriginalRow227TriangleData0876.coefficient61_84,
  OriginalRow227TriangleData0876.coefficient61_85,
  OriginalRow227TriangleData0876.coefficient61_86,
  OriginalRow227TriangleData0876.coefficient61_87,
  OriginalRow227TriangleData0876.coefficient61_88,
  OriginalRow227TriangleData0876.coefficient61_89,
  OriginalRow227TriangleData0876.coefficient61_90,
  OriginalRow227TriangleData0876.coefficient61_91
]

theorem values0876_size : values0876.size = 32 := rfl

def block0876 : ℕ → Option IntervalDyadic := segment 60 values0876

theorem block0876_domain : ExactDomain block0876 60 92 := by
  simpa only [values0876_size] using segment_domain 60 values0876

theorem block0876_get (i : Fin 32) :
    block0876 (60 + i.val) = some (values0876[i.val]'(by rw [values0876_size]; exact i.isLt)) := by
  exact segment_get 60 values0876 ⟨i.val, by rw [values0876_size]; exact i.isLt⟩

def values0877 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0877.coefficient61_92,
  OriginalRow227TriangleData0877.coefficient61_93,
  OriginalRow227TriangleData0877.coefficient61_94,
  OriginalRow227TriangleData0877.coefficient61_95,
  OriginalRow227TriangleData0877.coefficient61_96,
  OriginalRow227TriangleData0877.coefficient61_97,
  OriginalRow227TriangleData0877.coefficient61_98,
  OriginalRow227TriangleData0877.coefficient61_99,
  OriginalRow227TriangleData0877.coefficient61_100,
  OriginalRow227TriangleData0877.coefficient61_101,
  OriginalRow227TriangleData0877.coefficient61_102,
  OriginalRow227TriangleData0877.coefficient61_103,
  OriginalRow227TriangleData0877.coefficient61_104,
  OriginalRow227TriangleData0877.coefficient61_105,
  OriginalRow227TriangleData0877.coefficient61_106,
  OriginalRow227TriangleData0877.coefficient61_107,
  OriginalRow227TriangleData0877.coefficient61_108,
  OriginalRow227TriangleData0877.coefficient61_109,
  OriginalRow227TriangleData0877.coefficient61_110,
  OriginalRow227TriangleData0877.coefficient61_111,
  OriginalRow227TriangleData0877.coefficient61_112,
  OriginalRow227TriangleData0877.coefficient61_113,
  OriginalRow227TriangleData0877.coefficient61_114,
  OriginalRow227TriangleData0877.coefficient61_115,
  OriginalRow227TriangleData0877.coefficient61_116,
  OriginalRow227TriangleData0877.coefficient61_117,
  OriginalRow227TriangleData0877.coefficient61_118,
  OriginalRow227TriangleData0877.coefficient61_119,
  OriginalRow227TriangleData0877.coefficient61_120,
  OriginalRow227TriangleData0877.coefficient61_121,
  OriginalRow227TriangleData0877.coefficient61_122,
  OriginalRow227TriangleData0877.coefficient61_123
]

theorem values0877_size : values0877.size = 32 := rfl

def block0877 : ℕ → Option IntervalDyadic := segment 92 values0877

theorem block0877_domain : ExactDomain block0877 92 124 := by
  simpa only [values0877_size] using segment_domain 92 values0877

theorem block0877_get (i : Fin 32) :
    block0877 (92 + i.val) = some (values0877[i.val]'(by rw [values0877_size]; exact i.isLt)) := by
  exact segment_get 92 values0877 ⟨i.val, by rw [values0877_size]; exact i.isLt⟩

def values0878 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0878.coefficient61_124,
  OriginalRow227TriangleData0878.coefficient61_125,
  OriginalRow227TriangleData0878.coefficient61_126,
  OriginalRow227TriangleData0878.coefficient61_127,
  OriginalRow227TriangleData0878.coefficient61_128,
  OriginalRow227TriangleData0878.coefficient61_129,
  OriginalRow227TriangleData0878.coefficient61_130,
  OriginalRow227TriangleData0878.coefficient61_131,
  OriginalRow227TriangleData0878.coefficient61_132,
  OriginalRow227TriangleData0878.coefficient61_133,
  OriginalRow227TriangleData0878.coefficient61_134,
  OriginalRow227TriangleData0878.coefficient61_135,
  OriginalRow227TriangleData0878.coefficient61_136,
  OriginalRow227TriangleData0878.coefficient61_137,
  OriginalRow227TriangleData0878.coefficient61_138,
  OriginalRow227TriangleData0878.coefficient61_139,
  OriginalRow227TriangleData0878.coefficient61_140,
  OriginalRow227TriangleData0878.coefficient61_141,
  OriginalRow227TriangleData0878.coefficient61_142,
  OriginalRow227TriangleData0878.coefficient61_143,
  OriginalRow227TriangleData0878.coefficient61_144,
  OriginalRow227TriangleData0878.coefficient61_145,
  OriginalRow227TriangleData0878.coefficient61_146,
  OriginalRow227TriangleData0878.coefficient61_147,
  OriginalRow227TriangleData0878.coefficient61_148,
  OriginalRow227TriangleData0878.coefficient61_149,
  OriginalRow227TriangleData0878.coefficient61_150,
  OriginalRow227TriangleData0878.coefficient61_151,
  OriginalRow227TriangleData0878.coefficient61_152,
  OriginalRow227TriangleData0878.coefficient61_153,
  OriginalRow227TriangleData0878.coefficient61_154,
  OriginalRow227TriangleData0878.coefficient61_155
]

theorem values0878_size : values0878.size = 32 := rfl

def block0878 : ℕ → Option IntervalDyadic := segment 124 values0878

theorem block0878_domain : ExactDomain block0878 124 156 := by
  simpa only [values0878_size] using segment_domain 124 values0878

theorem block0878_get (i : Fin 32) :
    block0878 (124 + i.val) = some (values0878[i.val]'(by rw [values0878_size]; exact i.isLt)) := by
  exact segment_get 124 values0878 ⟨i.val, by rw [values0878_size]; exact i.isLt⟩

def values0879 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0879.coefficient61_156,
  OriginalRow227TriangleData0879.coefficient61_157,
  OriginalRow227TriangleData0879.coefficient61_158,
  OriginalRow227TriangleData0879.coefficient61_159,
  OriginalRow227TriangleData0879.coefficient61_160,
  OriginalRow227TriangleData0879.coefficient61_161,
  OriginalRow227TriangleData0879.coefficient61_162,
  OriginalRow227TriangleData0879.coefficient61_163,
  OriginalRow227TriangleData0879.coefficient61_164,
  OriginalRow227TriangleData0879.coefficient61_165,
  OriginalRow227TriangleData0879.coefficient61_166,
  OriginalRow227TriangleData0879.coefficient61_167,
  OriginalRow227TriangleData0879.coefficient61_168,
  OriginalRow227TriangleData0879.coefficient61_169,
  OriginalRow227TriangleData0879.coefficient61_170,
  OriginalRow227TriangleData0879.coefficient61_171,
  OriginalRow227TriangleData0879.coefficient61_172,
  OriginalRow227TriangleData0879.coefficient61_173,
  OriginalRow227TriangleData0879.coefficient61_174,
  OriginalRow227TriangleData0879.coefficient61_175,
  OriginalRow227TriangleData0879.coefficient61_176,
  OriginalRow227TriangleData0879.coefficient61_177,
  OriginalRow227TriangleData0879.coefficient61_178,
  OriginalRow227TriangleData0879.coefficient61_179,
  OriginalRow227TriangleData0879.coefficient61_180,
  OriginalRow227TriangleData0879.coefficient61_181,
  OriginalRow227TriangleData0879.coefficient61_182,
  OriginalRow227TriangleData0879.coefficient61_183,
  OriginalRow227TriangleData0879.coefficient61_184,
  OriginalRow227TriangleData0879.coefficient61_185,
  OriginalRow227TriangleData0879.coefficient61_186,
  OriginalRow227TriangleData0879.coefficient61_187
]

theorem values0879_size : values0879.size = 32 := rfl

def block0879 : ℕ → Option IntervalDyadic := segment 156 values0879

theorem block0879_domain : ExactDomain block0879 156 188 := by
  simpa only [values0879_size] using segment_domain 156 values0879

theorem block0879_get (i : Fin 32) :
    block0879 (156 + i.val) = some (values0879[i.val]'(by rw [values0879_size]; exact i.isLt)) := by
  exact segment_get 156 values0879 ⟨i.val, by rw [values0879_size]; exact i.isLt⟩

def values0880 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0880.coefficient61_188,
  OriginalRow227TriangleData0880.coefficient61_189,
  OriginalRow227TriangleData0880.coefficient61_190,
  OriginalRow227TriangleData0880.coefficient61_191,
  OriginalRow227TriangleData0880.coefficient61_192,
  OriginalRow227TriangleData0880.coefficient61_193,
  OriginalRow227TriangleData0880.coefficient61_194,
  OriginalRow227TriangleData0880.coefficient61_195,
  OriginalRow227TriangleData0880.coefficient61_196,
  OriginalRow227TriangleData0880.coefficient61_197,
  OriginalRow227TriangleData0880.coefficient61_198,
  OriginalRow227TriangleData0880.coefficient61_199,
  OriginalRow227TriangleData0880.coefficient61_200,
  OriginalRow227TriangleData0880.coefficient61_201,
  OriginalRow227TriangleData0880.coefficient61_202,
  OriginalRow227TriangleData0880.coefficient61_203,
  OriginalRow227TriangleData0880.coefficient61_204,
  OriginalRow227TriangleData0880.coefficient61_205,
  OriginalRow227TriangleData0880.coefficient61_206,
  OriginalRow227TriangleData0880.coefficient61_207,
  OriginalRow227TriangleData0880.coefficient61_208,
  OriginalRow227TriangleData0880.coefficient61_209,
  OriginalRow227TriangleData0880.coefficient61_210,
  OriginalRow227TriangleData0880.coefficient61_211,
  OriginalRow227TriangleData0880.coefficient61_212,
  OriginalRow227TriangleData0880.coefficient61_213,
  OriginalRow227TriangleData0880.coefficient61_214,
  OriginalRow227TriangleData0880.coefficient61_215,
  OriginalRow227TriangleData0880.coefficient61_216,
  OriginalRow227TriangleData0880.coefficient61_217,
  OriginalRow227TriangleData0880.coefficient61_218,
  OriginalRow227TriangleData0880.coefficient61_219
]

theorem values0880_size : values0880.size = 32 := rfl

def block0880 : ℕ → Option IntervalDyadic := segment 188 values0880

theorem block0880_domain : ExactDomain block0880 188 220 := by
  simpa only [values0880_size] using segment_domain 188 values0880

theorem block0880_get (i : Fin 32) :
    block0880 (188 + i.val) = some (values0880[i.val]'(by rw [values0880_size]; exact i.isLt)) := by
  exact segment_get 188 values0880 ⟨i.val, by rw [values0880_size]; exact i.isLt⟩

def values0881 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0881.coefficient61_220,
  OriginalRow227TriangleData0881.coefficient61_221,
  OriginalRow227TriangleData0881.coefficient61_222,
  OriginalRow227TriangleData0881.coefficient61_223,
  OriginalRow227TriangleData0881.coefficient61_224,
  OriginalRow227TriangleData0881.coefficient61_225,
  OriginalRow227TriangleData0881.coefficient61_226,
  OriginalRow227TriangleData0881.coefficient61_227,
  OriginalRow227TriangleData0881.coefficient61_228,
  OriginalRow227TriangleData0881.coefficient61_229,
  OriginalRow227TriangleData0881.coefficient61_230,
  OriginalRow227TriangleData0881.coefficient61_231,
  OriginalRow227TriangleData0881.coefficient61_232,
  OriginalRow227TriangleData0881.coefficient61_233,
  OriginalRow227TriangleData0881.coefficient61_234,
  OriginalRow227TriangleData0881.coefficient61_235,
  OriginalRow227TriangleData0881.coefficient61_236,
  OriginalRow227TriangleData0881.coefficient61_237,
  OriginalRow227TriangleData0881.coefficient61_238,
  OriginalRow227TriangleData0881.coefficient61_239,
  OriginalRow227TriangleData0881.coefficient61_240,
  OriginalRow227TriangleData0881.coefficient61_241,
  OriginalRow227TriangleData0881.coefficient61_242,
  OriginalRow227TriangleData0881.coefficient61_243,
  OriginalRow227TriangleData0881.coefficient61_244,
  OriginalRow227TriangleData0881.coefficient61_245,
  OriginalRow227TriangleData0881.coefficient61_246,
  OriginalRow227TriangleData0881.coefficient61_247,
  OriginalRow227TriangleData0881.coefficient61_248,
  OriginalRow227TriangleData0881.coefficient61_249,
  OriginalRow227TriangleData0881.coefficient61_250,
  OriginalRow227TriangleData0881.coefficient61_251
]

theorem values0881_size : values0881.size = 32 := rfl

def block0881 : ℕ → Option IntervalDyadic := segment 220 values0881

theorem block0881_domain : ExactDomain block0881 220 252 := by
  simpa only [values0881_size] using segment_domain 220 values0881

theorem block0881_get (i : Fin 32) :
    block0881 (220 + i.val) = some (values0881[i.val]'(by rw [values0881_size]; exact i.isLt)) := by
  exact segment_get 220 values0881 ⟨i.val, by rw [values0881_size]; exact i.isLt⟩

def values0882 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0882.coefficient61_252,
  OriginalRow227TriangleData0882.coefficient61_253,
  OriginalRow227TriangleData0882.coefficient61_254,
  OriginalRow227TriangleData0882.coefficient61_255,
  OriginalRow227TriangleData0882.coefficient61_256,
  OriginalRow227TriangleData0882.coefficient61_257,
  OriginalRow227TriangleData0882.coefficient61_258,
  OriginalRow227TriangleData0882.coefficient61_259,
  OriginalRow227TriangleData0882.coefficient61_260,
  OriginalRow227TriangleData0882.coefficient61_261,
  OriginalRow227TriangleData0882.coefficient61_262,
  OriginalRow227TriangleData0882.coefficient61_263,
  OriginalRow227TriangleData0882.coefficient61_264,
  OriginalRow227TriangleData0882.coefficient61_265,
  OriginalRow227TriangleData0882.coefficient61_266,
  OriginalRow227TriangleData0882.coefficient61_267,
  OriginalRow227TriangleData0882.coefficient61_268,
  OriginalRow227TriangleData0882.coefficient61_269,
  OriginalRow227TriangleData0882.coefficient61_270,
  OriginalRow227TriangleData0882.coefficient61_271,
  OriginalRow227TriangleData0882.coefficient61_272,
  OriginalRow227TriangleData0882.coefficient61_273,
  OriginalRow227TriangleData0882.coefficient61_274,
  OriginalRow227TriangleData0882.coefficient61_275,
  OriginalRow227TriangleData0882.coefficient61_276,
  OriginalRow227TriangleData0882.coefficient61_277,
  OriginalRow227TriangleData0882.coefficient61_278,
  OriginalRow227TriangleData0882.coefficient61_279,
  OriginalRow227TriangleData0882.coefficient61_280,
  OriginalRow227TriangleData0882.coefficient61_281,
  OriginalRow227TriangleData0882.coefficient61_282,
  OriginalRow227TriangleData0882.coefficient61_283
]

theorem values0882_size : values0882.size = 32 := rfl

def block0882 : ℕ → Option IntervalDyadic := segment 252 values0882

theorem block0882_domain : ExactDomain block0882 252 284 := by
  simpa only [values0882_size] using segment_domain 252 values0882

theorem block0882_get (i : Fin 32) :
    block0882 (252 + i.val) = some (values0882[i.val]'(by rw [values0882_size]; exact i.isLt)) := by
  exact segment_get 252 values0882 ⟨i.val, by rw [values0882_size]; exact i.isLt⟩

def values0883 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0883.coefficient61_284,
  OriginalRow227TriangleData0883.coefficient61_285,
  OriginalRow227TriangleData0883.coefficient61_286,
  OriginalRow227TriangleData0883.coefficient61_287,
  OriginalRow227TriangleData0883.coefficient61_288,
  OriginalRow227TriangleData0883.coefficient61_289,
  OriginalRow227TriangleData0883.coefficient61_290,
  OriginalRow227TriangleData0883.coefficient61_291,
  OriginalRow227TriangleData0883.coefficient61_292,
  OriginalRow227TriangleData0883.coefficient61_293,
  OriginalRow227TriangleData0883.coefficient61_294,
  OriginalRow227TriangleData0883.coefficient61_295,
  OriginalRow227TriangleData0883.coefficient61_296,
  OriginalRow227TriangleData0883.coefficient61_297,
  OriginalRow227TriangleData0883.coefficient61_298,
  OriginalRow227TriangleData0883.coefficient61_299,
  OriginalRow227TriangleData0883.coefficient61_300,
  OriginalRow227TriangleData0883.coefficient61_301,
  OriginalRow227TriangleData0883.coefficient61_302,
  OriginalRow227TriangleData0883.coefficient61_303,
  OriginalRow227TriangleData0883.coefficient61_304,
  OriginalRow227TriangleData0883.coefficient61_305,
  OriginalRow227TriangleData0883.coefficient61_306,
  OriginalRow227TriangleData0883.coefficient61_307,
  OriginalRow227TriangleData0883.coefficient61_308,
  OriginalRow227TriangleData0883.coefficient61_309,
  OriginalRow227TriangleData0883.coefficient61_310,
  OriginalRow227TriangleData0883.coefficient61_311,
  OriginalRow227TriangleData0883.coefficient61_312,
  OriginalRow227TriangleData0883.coefficient61_313,
  OriginalRow227TriangleData0883.coefficient61_314,
  OriginalRow227TriangleData0883.coefficient61_315
]

theorem values0883_size : values0883.size = 32 := rfl

def block0883 : ℕ → Option IntervalDyadic := segment 284 values0883

theorem block0883_domain : ExactDomain block0883 284 316 := by
  simpa only [values0883_size] using segment_domain 284 values0883

theorem block0883_get (i : Fin 32) :
    block0883 (284 + i.val) = some (values0883[i.val]'(by rw [values0883_size]; exact i.isLt)) := by
  exact segment_get 284 values0883 ⟨i.val, by rw [values0883_size]; exact i.isLt⟩

def values0884 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0884.coefficient61_316,
  OriginalRow227TriangleData0884.coefficient61_317,
  OriginalRow227TriangleData0884.coefficient61_318,
  OriginalRow227TriangleData0884.coefficient61_319,
  OriginalRow227TriangleData0884.coefficient61_320,
  OriginalRow227TriangleData0884.coefficient61_321,
  OriginalRow227TriangleData0884.coefficient61_322,
  OriginalRow227TriangleData0884.coefficient61_323,
  OriginalRow227TriangleData0884.coefficient61_324,
  OriginalRow227TriangleData0884.coefficient61_325,
  OriginalRow227TriangleData0884.coefficient61_326,
  OriginalRow227TriangleData0884.coefficient61_327,
  OriginalRow227TriangleData0884.coefficient61_328,
  OriginalRow227TriangleData0884.coefficient61_329,
  OriginalRow227TriangleData0884.coefficient61_330,
  OriginalRow227TriangleData0884.coefficient61_331,
  OriginalRow227TriangleData0884.coefficient61_332,
  OriginalRow227TriangleData0884.coefficient61_333,
  OriginalRow227TriangleData0884.coefficient61_334,
  OriginalRow227TriangleData0884.coefficient61_335,
  OriginalRow227TriangleData0884.coefficient61_336,
  OriginalRow227TriangleData0884.coefficient61_337,
  OriginalRow227TriangleData0884.coefficient61_338,
  OriginalRow227TriangleData0884.coefficient61_339,
  OriginalRow227TriangleData0884.coefficient61_340,
  OriginalRow227TriangleData0884.coefficient61_341,
  OriginalRow227TriangleData0884.coefficient61_342,
  OriginalRow227TriangleData0884.coefficient61_343,
  OriginalRow227TriangleData0884.coefficient61_344,
  OriginalRow227TriangleData0884.coefficient61_345,
  OriginalRow227TriangleData0884.coefficient61_346,
  OriginalRow227TriangleData0884.coefficient61_347
]

theorem values0884_size : values0884.size = 32 := rfl

def block0884 : ℕ → Option IntervalDyadic := segment 316 values0884

theorem block0884_domain : ExactDomain block0884 316 348 := by
  simpa only [values0884_size] using segment_domain 316 values0884

theorem block0884_get (i : Fin 32) :
    block0884 (316 + i.val) = some (values0884[i.val]'(by rw [values0884_size]; exact i.isLt)) := by
  exact segment_get 316 values0884 ⟨i.val, by rw [values0884_size]; exact i.isLt⟩

def values0885 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0885.coefficient61_348,
  OriginalRow227TriangleData0885.coefficient61_349,
  OriginalRow227TriangleData0885.coefficient61_350,
  OriginalRow227TriangleData0885.coefficient61_351,
  OriginalRow227TriangleData0885.coefficient61_352,
  OriginalRow227TriangleData0885.coefficient61_353,
  OriginalRow227TriangleData0885.coefficient61_354,
  OriginalRow227TriangleData0885.coefficient61_355,
  OriginalRow227TriangleData0885.coefficient61_356,
  OriginalRow227TriangleData0885.coefficient61_357,
  OriginalRow227TriangleData0885.coefficient61_358,
  OriginalRow227TriangleData0885.coefficient61_359,
  OriginalRow227TriangleData0885.coefficient61_360,
  OriginalRow227TriangleData0885.coefficient61_361,
  OriginalRow227TriangleData0885.coefficient61_362,
  OriginalRow227TriangleData0885.coefficient61_363,
  OriginalRow227TriangleData0885.coefficient61_364,
  OriginalRow227TriangleData0885.coefficient61_365,
  OriginalRow227TriangleData0885.coefficient61_366,
  OriginalRow227TriangleData0885.coefficient61_367,
  OriginalRow227TriangleData0885.coefficient61_368,
  OriginalRow227TriangleData0885.coefficient61_369,
  OriginalRow227TriangleData0885.coefficient61_370,
  OriginalRow227TriangleData0885.coefficient61_371,
  OriginalRow227TriangleData0885.coefficient61_372,
  OriginalRow227TriangleData0885.coefficient61_373,
  OriginalRow227TriangleData0885.coefficient61_374,
  OriginalRow227TriangleData0885.coefficient61_375,
  OriginalRow227TriangleData0885.coefficient61_376,
  OriginalRow227TriangleData0885.coefficient61_377,
  OriginalRow227TriangleData0885.coefficient61_378,
  OriginalRow227TriangleData0885.coefficient61_379
]

theorem values0885_size : values0885.size = 32 := rfl

def block0885 : ℕ → Option IntervalDyadic := segment 348 values0885

theorem block0885_domain : ExactDomain block0885 348 380 := by
  simpa only [values0885_size] using segment_domain 348 values0885

theorem block0885_get (i : Fin 32) :
    block0885 (348 + i.val) = some (values0885[i.val]'(by rw [values0885_size]; exact i.isLt)) := by
  exact segment_get 348 values0885 ⟨i.val, by rw [values0885_size]; exact i.isLt⟩

def values0886 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0886.coefficient61_380,
  OriginalRow227TriangleData0886.coefficient61_381,
  OriginalRow227TriangleData0886.coefficient61_382,
  OriginalRow227TriangleData0886.coefficient61_383,
  OriginalRow227TriangleData0886.coefficient61_384,
  OriginalRow227TriangleData0886.coefficient61_385,
  OriginalRow227TriangleData0886.coefficient61_386,
  OriginalRow227TriangleData0886.coefficient61_387,
  OriginalRow227TriangleData0886.coefficient61_388,
  OriginalRow227TriangleData0886.coefficient61_389,
  OriginalRow227TriangleData0886.coefficient61_390,
  OriginalRow227TriangleData0886.coefficient61_391,
  OriginalRow227TriangleData0886.coefficient61_392,
  OriginalRow227TriangleData0886.coefficient61_393,
  OriginalRow227TriangleData0886.coefficient61_394,
  OriginalRow227TriangleData0886.coefficient61_395,
  OriginalRow227TriangleData0886.coefficient61_396,
  OriginalRow227TriangleData0886.coefficient61_397,
  OriginalRow227TriangleData0886.coefficient61_398,
  OriginalRow227TriangleData0886.coefficient61_399,
  OriginalRow227TriangleData0886.coefficient61_400,
  OriginalRow227TriangleData0886.coefficient61_401,
  OriginalRow227TriangleData0886.coefficient61_402,
  OriginalRow227TriangleData0886.coefficient61_403,
  OriginalRow227TriangleData0886.coefficient61_404,
  OriginalRow227TriangleData0886.coefficient61_405,
  OriginalRow227TriangleData0886.coefficient61_406,
  OriginalRow227TriangleData0886.coefficient61_407,
  OriginalRow227TriangleData0886.coefficient61_408,
  OriginalRow227TriangleData0886.coefficient61_409,
  OriginalRow227TriangleData0886.coefficient61_410,
  OriginalRow227TriangleData0886.coefficient61_411
]

theorem values0886_size : values0886.size = 32 := rfl

def block0886 : ℕ → Option IntervalDyadic := segment 380 values0886

theorem block0886_domain : ExactDomain block0886 380 412 := by
  simpa only [values0886_size] using segment_domain 380 values0886

theorem block0886_get (i : Fin 32) :
    block0886 (380 + i.val) = some (values0886[i.val]'(by rw [values0886_size]; exact i.isLt)) := by
  exact segment_get 380 values0886 ⟨i.val, by rw [values0886_size]; exact i.isLt⟩

def values0887 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0887.coefficient61_412,
  OriginalRow227TriangleData0887.coefficient61_413,
  OriginalRow227TriangleData0887.coefficient61_414,
  OriginalRow227TriangleData0887.coefficient61_415,
  OriginalRow227TriangleData0887.coefficient61_416,
  OriginalRow227TriangleData0887.coefficient61_417,
  OriginalRow227TriangleData0887.coefficient61_418,
  OriginalRow227TriangleData0887.coefficient61_419,
  OriginalRow227TriangleData0887.coefficient61_420,
  OriginalRow227TriangleData0887.coefficient61_421,
  OriginalRow227TriangleData0887.coefficient61_422,
  OriginalRow227TriangleData0887.coefficient61_423,
  OriginalRow227TriangleData0887.coefficient61_424,
  OriginalRow227TriangleData0887.coefficient61_425,
  OriginalRow227TriangleData0887.coefficient61_426,
  OriginalRow227TriangleData0887.coefficient61_427,
  OriginalRow227TriangleData0887.coefficient61_428,
  OriginalRow227TriangleData0887.coefficient61_429,
  OriginalRow227TriangleData0887.coefficient61_430,
  OriginalRow227TriangleData0887.coefficient61_431,
  OriginalRow227TriangleData0887.coefficient61_432,
  OriginalRow227TriangleData0887.coefficient61_433,
  OriginalRow227TriangleData0887.coefficient61_434,
  OriginalRow227TriangleData0887.coefficient61_435,
  OriginalRow227TriangleData0887.coefficient61_436,
  OriginalRow227TriangleData0887.coefficient61_437,
  OriginalRow227TriangleData0887.coefficient61_438,
  OriginalRow227TriangleData0887.coefficient61_439,
  OriginalRow227TriangleData0887.coefficient61_440
]

theorem values0887_size : values0887.size = 29 := rfl

def block0887 : ℕ → Option IntervalDyadic := segment 412 values0887

theorem block0887_domain : ExactDomain block0887 412 441 := by
  simpa only [values0887_size] using segment_domain 412 values0887

theorem block0887_get (i : Fin 29) :
    block0887 (412 + i.val) = some (values0887[i.val]'(by rw [values0887_size]; exact i.isLt)) := by
  exact segment_get 412 values0887 ⟨i.val, by rw [values0887_size]; exact i.isLt⟩

def node0092_0156 : ℕ → Option IntervalDyadic := split 124 block0877 block0878

theorem node0092_0156_domain : ExactDomain node0092_0156 92 156 := by
  exact split_domain (by decide) (by decide) block0877_domain block0878_domain

def node0060_0156 : ℕ → Option IntervalDyadic := split 92 block0876 node0092_0156

theorem node0060_0156_domain : ExactDomain node0060_0156 60 156 := by
  exact split_domain (by decide) (by decide) block0876_domain node0092_0156_domain

def node0188_0252 : ℕ → Option IntervalDyadic := split 220 block0880 block0881

theorem node0188_0252_domain : ExactDomain node0188_0252 188 252 := by
  exact split_domain (by decide) (by decide) block0880_domain block0881_domain

def node0156_0252 : ℕ → Option IntervalDyadic := split 188 block0879 node0188_0252

theorem node0156_0252_domain : ExactDomain node0156_0252 156 252 := by
  exact split_domain (by decide) (by decide) block0879_domain node0188_0252_domain

def node0060_0252 : ℕ → Option IntervalDyadic := split 156 node0060_0156 node0156_0252

theorem node0060_0252_domain : ExactDomain node0060_0252 60 252 := by
  exact split_domain (by decide) (by decide) node0060_0156_domain node0156_0252_domain

def node0284_0348 : ℕ → Option IntervalDyadic := split 316 block0883 block0884

theorem node0284_0348_domain : ExactDomain node0284_0348 284 348 := by
  exact split_domain (by decide) (by decide) block0883_domain block0884_domain

def node0252_0348 : ℕ → Option IntervalDyadic := split 284 block0882 node0284_0348

theorem node0252_0348_domain : ExactDomain node0252_0348 252 348 := by
  exact split_domain (by decide) (by decide) block0882_domain node0284_0348_domain

def node0380_0441 : ℕ → Option IntervalDyadic := split 412 block0886 block0887

theorem node0380_0441_domain : ExactDomain node0380_0441 380 441 := by
  exact split_domain (by decide) (by decide) block0886_domain block0887_domain

def node0348_0441 : ℕ → Option IntervalDyadic := split 380 block0885 node0380_0441

theorem node0348_0441_domain : ExactDomain node0348_0441 348 441 := by
  exact split_domain (by decide) (by decide) block0885_domain node0380_0441_domain

def node0252_0441 : ℕ → Option IntervalDyadic := split 348 node0252_0348 node0348_0441

theorem node0252_0441_domain : ExactDomain node0252_0441 252 441 := by
  exact split_domain (by decide) (by decide) node0252_0348_domain node0348_0441_domain

def node0060_0441 : ℕ → Option IntervalDyadic := split 252 node0060_0252 node0252_0441

theorem node0060_0441_domain : ExactDomain node0060_0441 60 441 := by
  exact split_domain (by decide) (by decide) node0060_0252_domain node0252_0441_domain

def lookup : ℕ → Option IntervalDyadic := node0060_0441

theorem lookup_domain : ExactDomain lookup 60 441 :=
  node0060_0441_domain

theorem block0876_lookup (i : Fin 32) :
    lookup (60 + i.val) = some (values0876[i.val]'(by rw [values0876_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (60 + i.val) = _
  rw [node0060_0441, split_left 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0060_0252, split_left 156 node0060_0156 node0156_0252 (by omega)]
  rw [node0060_0156, split_left 92 block0876 node0092_0156 (by omega)]
  exact block0876_get i

theorem block0877_lookup (i : Fin 32) :
    lookup (92 + i.val) = some (values0877[i.val]'(by rw [values0877_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (92 + i.val) = _
  rw [node0060_0441, split_left 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0060_0252, split_left 156 node0060_0156 node0156_0252 (by omega)]
  rw [node0060_0156, split_right 92 block0876 node0092_0156 (by omega)]
  rw [node0092_0156, split_left 124 block0877 block0878 (by omega)]
  exact block0877_get i

theorem block0878_lookup (i : Fin 32) :
    lookup (124 + i.val) = some (values0878[i.val]'(by rw [values0878_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (124 + i.val) = _
  rw [node0060_0441, split_left 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0060_0252, split_left 156 node0060_0156 node0156_0252 (by omega)]
  rw [node0060_0156, split_right 92 block0876 node0092_0156 (by omega)]
  rw [node0092_0156, split_right 124 block0877 block0878 (by omega)]
  exact block0878_get i

theorem block0879_lookup (i : Fin 32) :
    lookup (156 + i.val) = some (values0879[i.val]'(by rw [values0879_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (156 + i.val) = _
  rw [node0060_0441, split_left 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0060_0252, split_right 156 node0060_0156 node0156_0252 (by omega)]
  rw [node0156_0252, split_left 188 block0879 node0188_0252 (by omega)]
  exact block0879_get i

theorem block0880_lookup (i : Fin 32) :
    lookup (188 + i.val) = some (values0880[i.val]'(by rw [values0880_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (188 + i.val) = _
  rw [node0060_0441, split_left 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0060_0252, split_right 156 node0060_0156 node0156_0252 (by omega)]
  rw [node0156_0252, split_right 188 block0879 node0188_0252 (by omega)]
  rw [node0188_0252, split_left 220 block0880 block0881 (by omega)]
  exact block0880_get i

theorem block0881_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values0881[i.val]'(by rw [values0881_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (220 + i.val) = _
  rw [node0060_0441, split_left 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0060_0252, split_right 156 node0060_0156 node0156_0252 (by omega)]
  rw [node0156_0252, split_right 188 block0879 node0188_0252 (by omega)]
  rw [node0188_0252, split_right 220 block0880 block0881 (by omega)]
  exact block0881_get i

theorem block0882_lookup (i : Fin 32) :
    lookup (252 + i.val) = some (values0882[i.val]'(by rw [values0882_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (252 + i.val) = _
  rw [node0060_0441, split_right 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0252_0441, split_left 348 node0252_0348 node0348_0441 (by omega)]
  rw [node0252_0348, split_left 284 block0882 node0284_0348 (by omega)]
  exact block0882_get i

theorem block0883_lookup (i : Fin 32) :
    lookup (284 + i.val) = some (values0883[i.val]'(by rw [values0883_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (284 + i.val) = _
  rw [node0060_0441, split_right 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0252_0441, split_left 348 node0252_0348 node0348_0441 (by omega)]
  rw [node0252_0348, split_right 284 block0882 node0284_0348 (by omega)]
  rw [node0284_0348, split_left 316 block0883 block0884 (by omega)]
  exact block0883_get i

theorem block0884_lookup (i : Fin 32) :
    lookup (316 + i.val) = some (values0884[i.val]'(by rw [values0884_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (316 + i.val) = _
  rw [node0060_0441, split_right 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0252_0441, split_left 348 node0252_0348 node0348_0441 (by omega)]
  rw [node0252_0348, split_right 284 block0882 node0284_0348 (by omega)]
  rw [node0284_0348, split_right 316 block0883 block0884 (by omega)]
  exact block0884_get i

theorem block0885_lookup (i : Fin 32) :
    lookup (348 + i.val) = some (values0885[i.val]'(by rw [values0885_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (348 + i.val) = _
  rw [node0060_0441, split_right 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0252_0441, split_right 348 node0252_0348 node0348_0441 (by omega)]
  rw [node0348_0441, split_left 380 block0885 node0380_0441 (by omega)]
  exact block0885_get i

theorem block0886_lookup (i : Fin 32) :
    lookup (380 + i.val) = some (values0886[i.val]'(by rw [values0886_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (380 + i.val) = _
  rw [node0060_0441, split_right 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0252_0441, split_right 348 node0252_0348 node0348_0441 (by omega)]
  rw [node0348_0441, split_right 380 block0885 node0380_0441 (by omega)]
  rw [node0380_0441, split_left 412 block0886 block0887 (by omega)]
  exact block0886_get i

theorem block0887_lookup (i : Fin 29) :
    lookup (412 + i.val) = some (values0887[i.val]'(by rw [values0887_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0060_0441 (412 + i.val) = _
  rw [node0060_0441, split_right 252 node0060_0252 node0252_0441 (by omega)]
  rw [node0252_0441, split_right 348 node0252_0348 node0348_0441 (by omega)]
  rw [node0348_0441, split_right 380 block0885 node0380_0441 (by omega)]
  rw [node0380_0441, split_right 412 block0886 block0887 (by omega)]
  exact block0887_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0876_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0876_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0877_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0877_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0878_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0878_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0879_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0879_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0880_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0880_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0881_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0881_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0882_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0882_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0883_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0883_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0884_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0884_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0885_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0885_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0886_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0886_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0887_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0887_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0876_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0877_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0878_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0879_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0880_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0881_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0882_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0883_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0884_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0885_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0886_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow061.block0887_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow061
