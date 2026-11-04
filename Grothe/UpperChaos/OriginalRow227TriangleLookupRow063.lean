import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0900
import Grothe.UpperChaos.OriginalRow227TriangleData0901
import Grothe.UpperChaos.OriginalRow227TriangleData0902
import Grothe.UpperChaos.OriginalRow227TriangleData0903
import Grothe.UpperChaos.OriginalRow227TriangleData0904
import Grothe.UpperChaos.OriginalRow227TriangleData0905
import Grothe.UpperChaos.OriginalRow227TriangleData0906
import Grothe.UpperChaos.OriginalRow227TriangleData0907
import Grothe.UpperChaos.OriginalRow227TriangleData0908
import Grothe.UpperChaos.OriginalRow227TriangleData0909
import Grothe.UpperChaos.OriginalRow227TriangleData0910
import Grothe.UpperChaos.OriginalRow227TriangleData0911

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow063

open ConditionalTableLookup

def values0900 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0900.coefficient63_62,
  OriginalRow227TriangleData0900.coefficient63_63,
  OriginalRow227TriangleData0900.coefficient63_64,
  OriginalRow227TriangleData0900.coefficient63_65,
  OriginalRow227TriangleData0900.coefficient63_66,
  OriginalRow227TriangleData0900.coefficient63_67,
  OriginalRow227TriangleData0900.coefficient63_68,
  OriginalRow227TriangleData0900.coefficient63_69,
  OriginalRow227TriangleData0900.coefficient63_70,
  OriginalRow227TriangleData0900.coefficient63_71,
  OriginalRow227TriangleData0900.coefficient63_72,
  OriginalRow227TriangleData0900.coefficient63_73,
  OriginalRow227TriangleData0900.coefficient63_74,
  OriginalRow227TriangleData0900.coefficient63_75,
  OriginalRow227TriangleData0900.coefficient63_76,
  OriginalRow227TriangleData0900.coefficient63_77,
  OriginalRow227TriangleData0900.coefficient63_78,
  OriginalRow227TriangleData0900.coefficient63_79,
  OriginalRow227TriangleData0900.coefficient63_80,
  OriginalRow227TriangleData0900.coefficient63_81,
  OriginalRow227TriangleData0900.coefficient63_82,
  OriginalRow227TriangleData0900.coefficient63_83,
  OriginalRow227TriangleData0900.coefficient63_84,
  OriginalRow227TriangleData0900.coefficient63_85,
  OriginalRow227TriangleData0900.coefficient63_86,
  OriginalRow227TriangleData0900.coefficient63_87,
  OriginalRow227TriangleData0900.coefficient63_88,
  OriginalRow227TriangleData0900.coefficient63_89,
  OriginalRow227TriangleData0900.coefficient63_90,
  OriginalRow227TriangleData0900.coefficient63_91,
  OriginalRow227TriangleData0900.coefficient63_92,
  OriginalRow227TriangleData0900.coefficient63_93
]

theorem values0900_size : values0900.size = 32 := rfl

def block0900 : ℕ → Option IntervalDyadic := segment 62 values0900

theorem block0900_domain : ExactDomain block0900 62 94 := by
  simpa only [values0900_size] using segment_domain 62 values0900

theorem block0900_get (i : Fin 32) :
    block0900 (62 + i.val) = some (values0900[i.val]'(by rw [values0900_size]; exact i.isLt)) := by
  exact segment_get 62 values0900 ⟨i.val, by rw [values0900_size]; exact i.isLt⟩

def values0901 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0901.coefficient63_94,
  OriginalRow227TriangleData0901.coefficient63_95,
  OriginalRow227TriangleData0901.coefficient63_96,
  OriginalRow227TriangleData0901.coefficient63_97,
  OriginalRow227TriangleData0901.coefficient63_98,
  OriginalRow227TriangleData0901.coefficient63_99,
  OriginalRow227TriangleData0901.coefficient63_100,
  OriginalRow227TriangleData0901.coefficient63_101,
  OriginalRow227TriangleData0901.coefficient63_102,
  OriginalRow227TriangleData0901.coefficient63_103,
  OriginalRow227TriangleData0901.coefficient63_104,
  OriginalRow227TriangleData0901.coefficient63_105,
  OriginalRow227TriangleData0901.coefficient63_106,
  OriginalRow227TriangleData0901.coefficient63_107,
  OriginalRow227TriangleData0901.coefficient63_108,
  OriginalRow227TriangleData0901.coefficient63_109,
  OriginalRow227TriangleData0901.coefficient63_110,
  OriginalRow227TriangleData0901.coefficient63_111,
  OriginalRow227TriangleData0901.coefficient63_112,
  OriginalRow227TriangleData0901.coefficient63_113,
  OriginalRow227TriangleData0901.coefficient63_114,
  OriginalRow227TriangleData0901.coefficient63_115,
  OriginalRow227TriangleData0901.coefficient63_116,
  OriginalRow227TriangleData0901.coefficient63_117,
  OriginalRow227TriangleData0901.coefficient63_118,
  OriginalRow227TriangleData0901.coefficient63_119,
  OriginalRow227TriangleData0901.coefficient63_120,
  OriginalRow227TriangleData0901.coefficient63_121,
  OriginalRow227TriangleData0901.coefficient63_122,
  OriginalRow227TriangleData0901.coefficient63_123,
  OriginalRow227TriangleData0901.coefficient63_124,
  OriginalRow227TriangleData0901.coefficient63_125
]

theorem values0901_size : values0901.size = 32 := rfl

def block0901 : ℕ → Option IntervalDyadic := segment 94 values0901

theorem block0901_domain : ExactDomain block0901 94 126 := by
  simpa only [values0901_size] using segment_domain 94 values0901

theorem block0901_get (i : Fin 32) :
    block0901 (94 + i.val) = some (values0901[i.val]'(by rw [values0901_size]; exact i.isLt)) := by
  exact segment_get 94 values0901 ⟨i.val, by rw [values0901_size]; exact i.isLt⟩

def values0902 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0902.coefficient63_126,
  OriginalRow227TriangleData0902.coefficient63_127,
  OriginalRow227TriangleData0902.coefficient63_128,
  OriginalRow227TriangleData0902.coefficient63_129,
  OriginalRow227TriangleData0902.coefficient63_130,
  OriginalRow227TriangleData0902.coefficient63_131,
  OriginalRow227TriangleData0902.coefficient63_132,
  OriginalRow227TriangleData0902.coefficient63_133,
  OriginalRow227TriangleData0902.coefficient63_134,
  OriginalRow227TriangleData0902.coefficient63_135,
  OriginalRow227TriangleData0902.coefficient63_136,
  OriginalRow227TriangleData0902.coefficient63_137,
  OriginalRow227TriangleData0902.coefficient63_138,
  OriginalRow227TriangleData0902.coefficient63_139,
  OriginalRow227TriangleData0902.coefficient63_140,
  OriginalRow227TriangleData0902.coefficient63_141,
  OriginalRow227TriangleData0902.coefficient63_142,
  OriginalRow227TriangleData0902.coefficient63_143,
  OriginalRow227TriangleData0902.coefficient63_144,
  OriginalRow227TriangleData0902.coefficient63_145,
  OriginalRow227TriangleData0902.coefficient63_146,
  OriginalRow227TriangleData0902.coefficient63_147,
  OriginalRow227TriangleData0902.coefficient63_148,
  OriginalRow227TriangleData0902.coefficient63_149,
  OriginalRow227TriangleData0902.coefficient63_150,
  OriginalRow227TriangleData0902.coefficient63_151,
  OriginalRow227TriangleData0902.coefficient63_152,
  OriginalRow227TriangleData0902.coefficient63_153,
  OriginalRow227TriangleData0902.coefficient63_154,
  OriginalRow227TriangleData0902.coefficient63_155,
  OriginalRow227TriangleData0902.coefficient63_156,
  OriginalRow227TriangleData0902.coefficient63_157
]

theorem values0902_size : values0902.size = 32 := rfl

def block0902 : ℕ → Option IntervalDyadic := segment 126 values0902

theorem block0902_domain : ExactDomain block0902 126 158 := by
  simpa only [values0902_size] using segment_domain 126 values0902

theorem block0902_get (i : Fin 32) :
    block0902 (126 + i.val) = some (values0902[i.val]'(by rw [values0902_size]; exact i.isLt)) := by
  exact segment_get 126 values0902 ⟨i.val, by rw [values0902_size]; exact i.isLt⟩

def values0903 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0903.coefficient63_158,
  OriginalRow227TriangleData0903.coefficient63_159,
  OriginalRow227TriangleData0903.coefficient63_160,
  OriginalRow227TriangleData0903.coefficient63_161,
  OriginalRow227TriangleData0903.coefficient63_162,
  OriginalRow227TriangleData0903.coefficient63_163,
  OriginalRow227TriangleData0903.coefficient63_164,
  OriginalRow227TriangleData0903.coefficient63_165,
  OriginalRow227TriangleData0903.coefficient63_166,
  OriginalRow227TriangleData0903.coefficient63_167,
  OriginalRow227TriangleData0903.coefficient63_168,
  OriginalRow227TriangleData0903.coefficient63_169,
  OriginalRow227TriangleData0903.coefficient63_170,
  OriginalRow227TriangleData0903.coefficient63_171,
  OriginalRow227TriangleData0903.coefficient63_172,
  OriginalRow227TriangleData0903.coefficient63_173,
  OriginalRow227TriangleData0903.coefficient63_174,
  OriginalRow227TriangleData0903.coefficient63_175,
  OriginalRow227TriangleData0903.coefficient63_176,
  OriginalRow227TriangleData0903.coefficient63_177,
  OriginalRow227TriangleData0903.coefficient63_178,
  OriginalRow227TriangleData0903.coefficient63_179,
  OriginalRow227TriangleData0903.coefficient63_180,
  OriginalRow227TriangleData0903.coefficient63_181,
  OriginalRow227TriangleData0903.coefficient63_182,
  OriginalRow227TriangleData0903.coefficient63_183,
  OriginalRow227TriangleData0903.coefficient63_184,
  OriginalRow227TriangleData0903.coefficient63_185,
  OriginalRow227TriangleData0903.coefficient63_186,
  OriginalRow227TriangleData0903.coefficient63_187,
  OriginalRow227TriangleData0903.coefficient63_188,
  OriginalRow227TriangleData0903.coefficient63_189
]

theorem values0903_size : values0903.size = 32 := rfl

def block0903 : ℕ → Option IntervalDyadic := segment 158 values0903

theorem block0903_domain : ExactDomain block0903 158 190 := by
  simpa only [values0903_size] using segment_domain 158 values0903

theorem block0903_get (i : Fin 32) :
    block0903 (158 + i.val) = some (values0903[i.val]'(by rw [values0903_size]; exact i.isLt)) := by
  exact segment_get 158 values0903 ⟨i.val, by rw [values0903_size]; exact i.isLt⟩

def values0904 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0904.coefficient63_190,
  OriginalRow227TriangleData0904.coefficient63_191,
  OriginalRow227TriangleData0904.coefficient63_192,
  OriginalRow227TriangleData0904.coefficient63_193,
  OriginalRow227TriangleData0904.coefficient63_194,
  OriginalRow227TriangleData0904.coefficient63_195,
  OriginalRow227TriangleData0904.coefficient63_196,
  OriginalRow227TriangleData0904.coefficient63_197,
  OriginalRow227TriangleData0904.coefficient63_198,
  OriginalRow227TriangleData0904.coefficient63_199,
  OriginalRow227TriangleData0904.coefficient63_200,
  OriginalRow227TriangleData0904.coefficient63_201,
  OriginalRow227TriangleData0904.coefficient63_202,
  OriginalRow227TriangleData0904.coefficient63_203,
  OriginalRow227TriangleData0904.coefficient63_204,
  OriginalRow227TriangleData0904.coefficient63_205,
  OriginalRow227TriangleData0904.coefficient63_206,
  OriginalRow227TriangleData0904.coefficient63_207,
  OriginalRow227TriangleData0904.coefficient63_208,
  OriginalRow227TriangleData0904.coefficient63_209,
  OriginalRow227TriangleData0904.coefficient63_210,
  OriginalRow227TriangleData0904.coefficient63_211,
  OriginalRow227TriangleData0904.coefficient63_212,
  OriginalRow227TriangleData0904.coefficient63_213,
  OriginalRow227TriangleData0904.coefficient63_214,
  OriginalRow227TriangleData0904.coefficient63_215,
  OriginalRow227TriangleData0904.coefficient63_216,
  OriginalRow227TriangleData0904.coefficient63_217,
  OriginalRow227TriangleData0904.coefficient63_218,
  OriginalRow227TriangleData0904.coefficient63_219,
  OriginalRow227TriangleData0904.coefficient63_220,
  OriginalRow227TriangleData0904.coefficient63_221
]

theorem values0904_size : values0904.size = 32 := rfl

def block0904 : ℕ → Option IntervalDyadic := segment 190 values0904

theorem block0904_domain : ExactDomain block0904 190 222 := by
  simpa only [values0904_size] using segment_domain 190 values0904

theorem block0904_get (i : Fin 32) :
    block0904 (190 + i.val) = some (values0904[i.val]'(by rw [values0904_size]; exact i.isLt)) := by
  exact segment_get 190 values0904 ⟨i.val, by rw [values0904_size]; exact i.isLt⟩

def values0905 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0905.coefficient63_222,
  OriginalRow227TriangleData0905.coefficient63_223,
  OriginalRow227TriangleData0905.coefficient63_224,
  OriginalRow227TriangleData0905.coefficient63_225,
  OriginalRow227TriangleData0905.coefficient63_226,
  OriginalRow227TriangleData0905.coefficient63_227,
  OriginalRow227TriangleData0905.coefficient63_228,
  OriginalRow227TriangleData0905.coefficient63_229,
  OriginalRow227TriangleData0905.coefficient63_230,
  OriginalRow227TriangleData0905.coefficient63_231,
  OriginalRow227TriangleData0905.coefficient63_232,
  OriginalRow227TriangleData0905.coefficient63_233,
  OriginalRow227TriangleData0905.coefficient63_234,
  OriginalRow227TriangleData0905.coefficient63_235,
  OriginalRow227TriangleData0905.coefficient63_236,
  OriginalRow227TriangleData0905.coefficient63_237,
  OriginalRow227TriangleData0905.coefficient63_238,
  OriginalRow227TriangleData0905.coefficient63_239,
  OriginalRow227TriangleData0905.coefficient63_240,
  OriginalRow227TriangleData0905.coefficient63_241,
  OriginalRow227TriangleData0905.coefficient63_242,
  OriginalRow227TriangleData0905.coefficient63_243,
  OriginalRow227TriangleData0905.coefficient63_244,
  OriginalRow227TriangleData0905.coefficient63_245,
  OriginalRow227TriangleData0905.coefficient63_246,
  OriginalRow227TriangleData0905.coefficient63_247,
  OriginalRow227TriangleData0905.coefficient63_248,
  OriginalRow227TriangleData0905.coefficient63_249,
  OriginalRow227TriangleData0905.coefficient63_250,
  OriginalRow227TriangleData0905.coefficient63_251,
  OriginalRow227TriangleData0905.coefficient63_252,
  OriginalRow227TriangleData0905.coefficient63_253
]

theorem values0905_size : values0905.size = 32 := rfl

def block0905 : ℕ → Option IntervalDyadic := segment 222 values0905

theorem block0905_domain : ExactDomain block0905 222 254 := by
  simpa only [values0905_size] using segment_domain 222 values0905

theorem block0905_get (i : Fin 32) :
    block0905 (222 + i.val) = some (values0905[i.val]'(by rw [values0905_size]; exact i.isLt)) := by
  exact segment_get 222 values0905 ⟨i.val, by rw [values0905_size]; exact i.isLt⟩

def values0906 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0906.coefficient63_254,
  OriginalRow227TriangleData0906.coefficient63_255,
  OriginalRow227TriangleData0906.coefficient63_256,
  OriginalRow227TriangleData0906.coefficient63_257,
  OriginalRow227TriangleData0906.coefficient63_258,
  OriginalRow227TriangleData0906.coefficient63_259,
  OriginalRow227TriangleData0906.coefficient63_260,
  OriginalRow227TriangleData0906.coefficient63_261,
  OriginalRow227TriangleData0906.coefficient63_262,
  OriginalRow227TriangleData0906.coefficient63_263,
  OriginalRow227TriangleData0906.coefficient63_264,
  OriginalRow227TriangleData0906.coefficient63_265,
  OriginalRow227TriangleData0906.coefficient63_266,
  OriginalRow227TriangleData0906.coefficient63_267,
  OriginalRow227TriangleData0906.coefficient63_268,
  OriginalRow227TriangleData0906.coefficient63_269,
  OriginalRow227TriangleData0906.coefficient63_270,
  OriginalRow227TriangleData0906.coefficient63_271,
  OriginalRow227TriangleData0906.coefficient63_272,
  OriginalRow227TriangleData0906.coefficient63_273,
  OriginalRow227TriangleData0906.coefficient63_274,
  OriginalRow227TriangleData0906.coefficient63_275,
  OriginalRow227TriangleData0906.coefficient63_276,
  OriginalRow227TriangleData0906.coefficient63_277,
  OriginalRow227TriangleData0906.coefficient63_278,
  OriginalRow227TriangleData0906.coefficient63_279,
  OriginalRow227TriangleData0906.coefficient63_280,
  OriginalRow227TriangleData0906.coefficient63_281,
  OriginalRow227TriangleData0906.coefficient63_282,
  OriginalRow227TriangleData0906.coefficient63_283,
  OriginalRow227TriangleData0906.coefficient63_284,
  OriginalRow227TriangleData0906.coefficient63_285
]

theorem values0906_size : values0906.size = 32 := rfl

def block0906 : ℕ → Option IntervalDyadic := segment 254 values0906

theorem block0906_domain : ExactDomain block0906 254 286 := by
  simpa only [values0906_size] using segment_domain 254 values0906

theorem block0906_get (i : Fin 32) :
    block0906 (254 + i.val) = some (values0906[i.val]'(by rw [values0906_size]; exact i.isLt)) := by
  exact segment_get 254 values0906 ⟨i.val, by rw [values0906_size]; exact i.isLt⟩

def values0907 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0907.coefficient63_286,
  OriginalRow227TriangleData0907.coefficient63_287,
  OriginalRow227TriangleData0907.coefficient63_288,
  OriginalRow227TriangleData0907.coefficient63_289,
  OriginalRow227TriangleData0907.coefficient63_290,
  OriginalRow227TriangleData0907.coefficient63_291,
  OriginalRow227TriangleData0907.coefficient63_292,
  OriginalRow227TriangleData0907.coefficient63_293,
  OriginalRow227TriangleData0907.coefficient63_294,
  OriginalRow227TriangleData0907.coefficient63_295,
  OriginalRow227TriangleData0907.coefficient63_296,
  OriginalRow227TriangleData0907.coefficient63_297,
  OriginalRow227TriangleData0907.coefficient63_298,
  OriginalRow227TriangleData0907.coefficient63_299,
  OriginalRow227TriangleData0907.coefficient63_300,
  OriginalRow227TriangleData0907.coefficient63_301,
  OriginalRow227TriangleData0907.coefficient63_302,
  OriginalRow227TriangleData0907.coefficient63_303,
  OriginalRow227TriangleData0907.coefficient63_304,
  OriginalRow227TriangleData0907.coefficient63_305,
  OriginalRow227TriangleData0907.coefficient63_306,
  OriginalRow227TriangleData0907.coefficient63_307,
  OriginalRow227TriangleData0907.coefficient63_308,
  OriginalRow227TriangleData0907.coefficient63_309,
  OriginalRow227TriangleData0907.coefficient63_310,
  OriginalRow227TriangleData0907.coefficient63_311,
  OriginalRow227TriangleData0907.coefficient63_312,
  OriginalRow227TriangleData0907.coefficient63_313,
  OriginalRow227TriangleData0907.coefficient63_314,
  OriginalRow227TriangleData0907.coefficient63_315,
  OriginalRow227TriangleData0907.coefficient63_316,
  OriginalRow227TriangleData0907.coefficient63_317
]

theorem values0907_size : values0907.size = 32 := rfl

def block0907 : ℕ → Option IntervalDyadic := segment 286 values0907

theorem block0907_domain : ExactDomain block0907 286 318 := by
  simpa only [values0907_size] using segment_domain 286 values0907

theorem block0907_get (i : Fin 32) :
    block0907 (286 + i.val) = some (values0907[i.val]'(by rw [values0907_size]; exact i.isLt)) := by
  exact segment_get 286 values0907 ⟨i.val, by rw [values0907_size]; exact i.isLt⟩

def values0908 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0908.coefficient63_318,
  OriginalRow227TriangleData0908.coefficient63_319,
  OriginalRow227TriangleData0908.coefficient63_320,
  OriginalRow227TriangleData0908.coefficient63_321,
  OriginalRow227TriangleData0908.coefficient63_322,
  OriginalRow227TriangleData0908.coefficient63_323,
  OriginalRow227TriangleData0908.coefficient63_324,
  OriginalRow227TriangleData0908.coefficient63_325,
  OriginalRow227TriangleData0908.coefficient63_326,
  OriginalRow227TriangleData0908.coefficient63_327,
  OriginalRow227TriangleData0908.coefficient63_328,
  OriginalRow227TriangleData0908.coefficient63_329,
  OriginalRow227TriangleData0908.coefficient63_330,
  OriginalRow227TriangleData0908.coefficient63_331,
  OriginalRow227TriangleData0908.coefficient63_332,
  OriginalRow227TriangleData0908.coefficient63_333,
  OriginalRow227TriangleData0908.coefficient63_334,
  OriginalRow227TriangleData0908.coefficient63_335,
  OriginalRow227TriangleData0908.coefficient63_336,
  OriginalRow227TriangleData0908.coefficient63_337,
  OriginalRow227TriangleData0908.coefficient63_338,
  OriginalRow227TriangleData0908.coefficient63_339,
  OriginalRow227TriangleData0908.coefficient63_340,
  OriginalRow227TriangleData0908.coefficient63_341,
  OriginalRow227TriangleData0908.coefficient63_342,
  OriginalRow227TriangleData0908.coefficient63_343,
  OriginalRow227TriangleData0908.coefficient63_344,
  OriginalRow227TriangleData0908.coefficient63_345,
  OriginalRow227TriangleData0908.coefficient63_346,
  OriginalRow227TriangleData0908.coefficient63_347,
  OriginalRow227TriangleData0908.coefficient63_348,
  OriginalRow227TriangleData0908.coefficient63_349
]

theorem values0908_size : values0908.size = 32 := rfl

def block0908 : ℕ → Option IntervalDyadic := segment 318 values0908

theorem block0908_domain : ExactDomain block0908 318 350 := by
  simpa only [values0908_size] using segment_domain 318 values0908

theorem block0908_get (i : Fin 32) :
    block0908 (318 + i.val) = some (values0908[i.val]'(by rw [values0908_size]; exact i.isLt)) := by
  exact segment_get 318 values0908 ⟨i.val, by rw [values0908_size]; exact i.isLt⟩

def values0909 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0909.coefficient63_350,
  OriginalRow227TriangleData0909.coefficient63_351,
  OriginalRow227TriangleData0909.coefficient63_352,
  OriginalRow227TriangleData0909.coefficient63_353,
  OriginalRow227TriangleData0909.coefficient63_354,
  OriginalRow227TriangleData0909.coefficient63_355,
  OriginalRow227TriangleData0909.coefficient63_356,
  OriginalRow227TriangleData0909.coefficient63_357,
  OriginalRow227TriangleData0909.coefficient63_358,
  OriginalRow227TriangleData0909.coefficient63_359,
  OriginalRow227TriangleData0909.coefficient63_360,
  OriginalRow227TriangleData0909.coefficient63_361,
  OriginalRow227TriangleData0909.coefficient63_362,
  OriginalRow227TriangleData0909.coefficient63_363,
  OriginalRow227TriangleData0909.coefficient63_364,
  OriginalRow227TriangleData0909.coefficient63_365,
  OriginalRow227TriangleData0909.coefficient63_366,
  OriginalRow227TriangleData0909.coefficient63_367,
  OriginalRow227TriangleData0909.coefficient63_368,
  OriginalRow227TriangleData0909.coefficient63_369,
  OriginalRow227TriangleData0909.coefficient63_370,
  OriginalRow227TriangleData0909.coefficient63_371,
  OriginalRow227TriangleData0909.coefficient63_372,
  OriginalRow227TriangleData0909.coefficient63_373,
  OriginalRow227TriangleData0909.coefficient63_374,
  OriginalRow227TriangleData0909.coefficient63_375,
  OriginalRow227TriangleData0909.coefficient63_376,
  OriginalRow227TriangleData0909.coefficient63_377,
  OriginalRow227TriangleData0909.coefficient63_378,
  OriginalRow227TriangleData0909.coefficient63_379,
  OriginalRow227TriangleData0909.coefficient63_380,
  OriginalRow227TriangleData0909.coefficient63_381
]

theorem values0909_size : values0909.size = 32 := rfl

def block0909 : ℕ → Option IntervalDyadic := segment 350 values0909

theorem block0909_domain : ExactDomain block0909 350 382 := by
  simpa only [values0909_size] using segment_domain 350 values0909

theorem block0909_get (i : Fin 32) :
    block0909 (350 + i.val) = some (values0909[i.val]'(by rw [values0909_size]; exact i.isLt)) := by
  exact segment_get 350 values0909 ⟨i.val, by rw [values0909_size]; exact i.isLt⟩

def values0910 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0910.coefficient63_382,
  OriginalRow227TriangleData0910.coefficient63_383,
  OriginalRow227TriangleData0910.coefficient63_384,
  OriginalRow227TriangleData0910.coefficient63_385,
  OriginalRow227TriangleData0910.coefficient63_386,
  OriginalRow227TriangleData0910.coefficient63_387,
  OriginalRow227TriangleData0910.coefficient63_388,
  OriginalRow227TriangleData0910.coefficient63_389,
  OriginalRow227TriangleData0910.coefficient63_390,
  OriginalRow227TriangleData0910.coefficient63_391,
  OriginalRow227TriangleData0910.coefficient63_392,
  OriginalRow227TriangleData0910.coefficient63_393,
  OriginalRow227TriangleData0910.coefficient63_394,
  OriginalRow227TriangleData0910.coefficient63_395,
  OriginalRow227TriangleData0910.coefficient63_396,
  OriginalRow227TriangleData0910.coefficient63_397,
  OriginalRow227TriangleData0910.coefficient63_398,
  OriginalRow227TriangleData0910.coefficient63_399,
  OriginalRow227TriangleData0910.coefficient63_400,
  OriginalRow227TriangleData0910.coefficient63_401,
  OriginalRow227TriangleData0910.coefficient63_402,
  OriginalRow227TriangleData0910.coefficient63_403,
  OriginalRow227TriangleData0910.coefficient63_404,
  OriginalRow227TriangleData0910.coefficient63_405,
  OriginalRow227TriangleData0910.coefficient63_406,
  OriginalRow227TriangleData0910.coefficient63_407,
  OriginalRow227TriangleData0910.coefficient63_408,
  OriginalRow227TriangleData0910.coefficient63_409,
  OriginalRow227TriangleData0910.coefficient63_410,
  OriginalRow227TriangleData0910.coefficient63_411,
  OriginalRow227TriangleData0910.coefficient63_412,
  OriginalRow227TriangleData0910.coefficient63_413
]

theorem values0910_size : values0910.size = 32 := rfl

def block0910 : ℕ → Option IntervalDyadic := segment 382 values0910

theorem block0910_domain : ExactDomain block0910 382 414 := by
  simpa only [values0910_size] using segment_domain 382 values0910

theorem block0910_get (i : Fin 32) :
    block0910 (382 + i.val) = some (values0910[i.val]'(by rw [values0910_size]; exact i.isLt)) := by
  exact segment_get 382 values0910 ⟨i.val, by rw [values0910_size]; exact i.isLt⟩

def values0911 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0911.coefficient63_414,
  OriginalRow227TriangleData0911.coefficient63_415,
  OriginalRow227TriangleData0911.coefficient63_416,
  OriginalRow227TriangleData0911.coefficient63_417,
  OriginalRow227TriangleData0911.coefficient63_418,
  OriginalRow227TriangleData0911.coefficient63_419,
  OriginalRow227TriangleData0911.coefficient63_420,
  OriginalRow227TriangleData0911.coefficient63_421,
  OriginalRow227TriangleData0911.coefficient63_422,
  OriginalRow227TriangleData0911.coefficient63_423,
  OriginalRow227TriangleData0911.coefficient63_424,
  OriginalRow227TriangleData0911.coefficient63_425,
  OriginalRow227TriangleData0911.coefficient63_426,
  OriginalRow227TriangleData0911.coefficient63_427,
  OriginalRow227TriangleData0911.coefficient63_428,
  OriginalRow227TriangleData0911.coefficient63_429,
  OriginalRow227TriangleData0911.coefficient63_430,
  OriginalRow227TriangleData0911.coefficient63_431,
  OriginalRow227TriangleData0911.coefficient63_432,
  OriginalRow227TriangleData0911.coefficient63_433,
  OriginalRow227TriangleData0911.coefficient63_434,
  OriginalRow227TriangleData0911.coefficient63_435,
  OriginalRow227TriangleData0911.coefficient63_436,
  OriginalRow227TriangleData0911.coefficient63_437,
  OriginalRow227TriangleData0911.coefficient63_438
]

theorem values0911_size : values0911.size = 25 := rfl

def block0911 : ℕ → Option IntervalDyadic := segment 414 values0911

theorem block0911_domain : ExactDomain block0911 414 439 := by
  simpa only [values0911_size] using segment_domain 414 values0911

theorem block0911_get (i : Fin 25) :
    block0911 (414 + i.val) = some (values0911[i.val]'(by rw [values0911_size]; exact i.isLt)) := by
  exact segment_get 414 values0911 ⟨i.val, by rw [values0911_size]; exact i.isLt⟩

def node0094_0158 : ℕ → Option IntervalDyadic := split 126 block0901 block0902

theorem node0094_0158_domain : ExactDomain node0094_0158 94 158 := by
  exact split_domain (by decide) (by decide) block0901_domain block0902_domain

def node0062_0158 : ℕ → Option IntervalDyadic := split 94 block0900 node0094_0158

theorem node0062_0158_domain : ExactDomain node0062_0158 62 158 := by
  exact split_domain (by decide) (by decide) block0900_domain node0094_0158_domain

def node0190_0254 : ℕ → Option IntervalDyadic := split 222 block0904 block0905

theorem node0190_0254_domain : ExactDomain node0190_0254 190 254 := by
  exact split_domain (by decide) (by decide) block0904_domain block0905_domain

def node0158_0254 : ℕ → Option IntervalDyadic := split 190 block0903 node0190_0254

theorem node0158_0254_domain : ExactDomain node0158_0254 158 254 := by
  exact split_domain (by decide) (by decide) block0903_domain node0190_0254_domain

def node0062_0254 : ℕ → Option IntervalDyadic := split 158 node0062_0158 node0158_0254

theorem node0062_0254_domain : ExactDomain node0062_0254 62 254 := by
  exact split_domain (by decide) (by decide) node0062_0158_domain node0158_0254_domain

def node0286_0350 : ℕ → Option IntervalDyadic := split 318 block0907 block0908

theorem node0286_0350_domain : ExactDomain node0286_0350 286 350 := by
  exact split_domain (by decide) (by decide) block0907_domain block0908_domain

def node0254_0350 : ℕ → Option IntervalDyadic := split 286 block0906 node0286_0350

theorem node0254_0350_domain : ExactDomain node0254_0350 254 350 := by
  exact split_domain (by decide) (by decide) block0906_domain node0286_0350_domain

def node0382_0439 : ℕ → Option IntervalDyadic := split 414 block0910 block0911

theorem node0382_0439_domain : ExactDomain node0382_0439 382 439 := by
  exact split_domain (by decide) (by decide) block0910_domain block0911_domain

def node0350_0439 : ℕ → Option IntervalDyadic := split 382 block0909 node0382_0439

theorem node0350_0439_domain : ExactDomain node0350_0439 350 439 := by
  exact split_domain (by decide) (by decide) block0909_domain node0382_0439_domain

def node0254_0439 : ℕ → Option IntervalDyadic := split 350 node0254_0350 node0350_0439

theorem node0254_0439_domain : ExactDomain node0254_0439 254 439 := by
  exact split_domain (by decide) (by decide) node0254_0350_domain node0350_0439_domain

def node0062_0439 : ℕ → Option IntervalDyadic := split 254 node0062_0254 node0254_0439

theorem node0062_0439_domain : ExactDomain node0062_0439 62 439 := by
  exact split_domain (by decide) (by decide) node0062_0254_domain node0254_0439_domain

def lookup : ℕ → Option IntervalDyadic := node0062_0439

theorem lookup_domain : ExactDomain lookup 62 439 :=
  node0062_0439_domain

theorem block0900_lookup (i : Fin 32) :
    lookup (62 + i.val) = some (values0900[i.val]'(by rw [values0900_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (62 + i.val) = _
  rw [node0062_0439, split_left 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0062_0254, split_left 158 node0062_0158 node0158_0254 (by omega)]
  rw [node0062_0158, split_left 94 block0900 node0094_0158 (by omega)]
  exact block0900_get i

theorem block0901_lookup (i : Fin 32) :
    lookup (94 + i.val) = some (values0901[i.val]'(by rw [values0901_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (94 + i.val) = _
  rw [node0062_0439, split_left 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0062_0254, split_left 158 node0062_0158 node0158_0254 (by omega)]
  rw [node0062_0158, split_right 94 block0900 node0094_0158 (by omega)]
  rw [node0094_0158, split_left 126 block0901 block0902 (by omega)]
  exact block0901_get i

theorem block0902_lookup (i : Fin 32) :
    lookup (126 + i.val) = some (values0902[i.val]'(by rw [values0902_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (126 + i.val) = _
  rw [node0062_0439, split_left 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0062_0254, split_left 158 node0062_0158 node0158_0254 (by omega)]
  rw [node0062_0158, split_right 94 block0900 node0094_0158 (by omega)]
  rw [node0094_0158, split_right 126 block0901 block0902 (by omega)]
  exact block0902_get i

theorem block0903_lookup (i : Fin 32) :
    lookup (158 + i.val) = some (values0903[i.val]'(by rw [values0903_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (158 + i.val) = _
  rw [node0062_0439, split_left 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0062_0254, split_right 158 node0062_0158 node0158_0254 (by omega)]
  rw [node0158_0254, split_left 190 block0903 node0190_0254 (by omega)]
  exact block0903_get i

theorem block0904_lookup (i : Fin 32) :
    lookup (190 + i.val) = some (values0904[i.val]'(by rw [values0904_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (190 + i.val) = _
  rw [node0062_0439, split_left 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0062_0254, split_right 158 node0062_0158 node0158_0254 (by omega)]
  rw [node0158_0254, split_right 190 block0903 node0190_0254 (by omega)]
  rw [node0190_0254, split_left 222 block0904 block0905 (by omega)]
  exact block0904_get i

theorem block0905_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values0905[i.val]'(by rw [values0905_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (222 + i.val) = _
  rw [node0062_0439, split_left 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0062_0254, split_right 158 node0062_0158 node0158_0254 (by omega)]
  rw [node0158_0254, split_right 190 block0903 node0190_0254 (by omega)]
  rw [node0190_0254, split_right 222 block0904 block0905 (by omega)]
  exact block0905_get i

theorem block0906_lookup (i : Fin 32) :
    lookup (254 + i.val) = some (values0906[i.val]'(by rw [values0906_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (254 + i.val) = _
  rw [node0062_0439, split_right 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0254_0439, split_left 350 node0254_0350 node0350_0439 (by omega)]
  rw [node0254_0350, split_left 286 block0906 node0286_0350 (by omega)]
  exact block0906_get i

theorem block0907_lookup (i : Fin 32) :
    lookup (286 + i.val) = some (values0907[i.val]'(by rw [values0907_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (286 + i.val) = _
  rw [node0062_0439, split_right 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0254_0439, split_left 350 node0254_0350 node0350_0439 (by omega)]
  rw [node0254_0350, split_right 286 block0906 node0286_0350 (by omega)]
  rw [node0286_0350, split_left 318 block0907 block0908 (by omega)]
  exact block0907_get i

theorem block0908_lookup (i : Fin 32) :
    lookup (318 + i.val) = some (values0908[i.val]'(by rw [values0908_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (318 + i.val) = _
  rw [node0062_0439, split_right 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0254_0439, split_left 350 node0254_0350 node0350_0439 (by omega)]
  rw [node0254_0350, split_right 286 block0906 node0286_0350 (by omega)]
  rw [node0286_0350, split_right 318 block0907 block0908 (by omega)]
  exact block0908_get i

theorem block0909_lookup (i : Fin 32) :
    lookup (350 + i.val) = some (values0909[i.val]'(by rw [values0909_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (350 + i.val) = _
  rw [node0062_0439, split_right 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0254_0439, split_right 350 node0254_0350 node0350_0439 (by omega)]
  rw [node0350_0439, split_left 382 block0909 node0382_0439 (by omega)]
  exact block0909_get i

theorem block0910_lookup (i : Fin 32) :
    lookup (382 + i.val) = some (values0910[i.val]'(by rw [values0910_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (382 + i.val) = _
  rw [node0062_0439, split_right 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0254_0439, split_right 350 node0254_0350 node0350_0439 (by omega)]
  rw [node0350_0439, split_right 382 block0909 node0382_0439 (by omega)]
  rw [node0382_0439, split_left 414 block0910 block0911 (by omega)]
  exact block0910_get i

theorem block0911_lookup (i : Fin 25) :
    lookup (414 + i.val) = some (values0911[i.val]'(by rw [values0911_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0062_0439 (414 + i.val) = _
  rw [node0062_0439, split_right 254 node0062_0254 node0254_0439 (by omega)]
  rw [node0254_0439, split_right 350 node0254_0350 node0350_0439 (by omega)]
  rw [node0350_0439, split_right 382 block0909 node0382_0439 (by omega)]
  rw [node0382_0439, split_right 414 block0910 block0911 (by omega)]
  exact block0911_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0900_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0900_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0901_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0901_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0902_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0902_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0903_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0903_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0904_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0904_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0905_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0905_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0906_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0906_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0907_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0907_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0908_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0908_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0909_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0909_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0910_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0910_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0911_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0911_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0900_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0901_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0902_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0903_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0904_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0905_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0906_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0907_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0908_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0909_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0910_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow063.block0911_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow063
