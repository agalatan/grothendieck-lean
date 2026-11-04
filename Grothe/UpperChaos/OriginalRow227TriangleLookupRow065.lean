import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0924
import Grothe.UpperChaos.OriginalRow227TriangleData0925
import Grothe.UpperChaos.OriginalRow227TriangleData0926
import Grothe.UpperChaos.OriginalRow227TriangleData0927
import Grothe.UpperChaos.OriginalRow227TriangleData0928
import Grothe.UpperChaos.OriginalRow227TriangleData0929
import Grothe.UpperChaos.OriginalRow227TriangleData0930
import Grothe.UpperChaos.OriginalRow227TriangleData0931
import Grothe.UpperChaos.OriginalRow227TriangleData0932
import Grothe.UpperChaos.OriginalRow227TriangleData0933
import Grothe.UpperChaos.OriginalRow227TriangleData0934
import Grothe.UpperChaos.OriginalRow227TriangleData0935

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow065

open ConditionalTableLookup

def values0924 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0924.coefficient65_64,
  OriginalRow227TriangleData0924.coefficient65_65,
  OriginalRow227TriangleData0924.coefficient65_66,
  OriginalRow227TriangleData0924.coefficient65_67,
  OriginalRow227TriangleData0924.coefficient65_68,
  OriginalRow227TriangleData0924.coefficient65_69,
  OriginalRow227TriangleData0924.coefficient65_70,
  OriginalRow227TriangleData0924.coefficient65_71,
  OriginalRow227TriangleData0924.coefficient65_72,
  OriginalRow227TriangleData0924.coefficient65_73,
  OriginalRow227TriangleData0924.coefficient65_74,
  OriginalRow227TriangleData0924.coefficient65_75,
  OriginalRow227TriangleData0924.coefficient65_76,
  OriginalRow227TriangleData0924.coefficient65_77,
  OriginalRow227TriangleData0924.coefficient65_78,
  OriginalRow227TriangleData0924.coefficient65_79,
  OriginalRow227TriangleData0924.coefficient65_80,
  OriginalRow227TriangleData0924.coefficient65_81,
  OriginalRow227TriangleData0924.coefficient65_82,
  OriginalRow227TriangleData0924.coefficient65_83,
  OriginalRow227TriangleData0924.coefficient65_84,
  OriginalRow227TriangleData0924.coefficient65_85,
  OriginalRow227TriangleData0924.coefficient65_86,
  OriginalRow227TriangleData0924.coefficient65_87,
  OriginalRow227TriangleData0924.coefficient65_88,
  OriginalRow227TriangleData0924.coefficient65_89,
  OriginalRow227TriangleData0924.coefficient65_90,
  OriginalRow227TriangleData0924.coefficient65_91,
  OriginalRow227TriangleData0924.coefficient65_92,
  OriginalRow227TriangleData0924.coefficient65_93,
  OriginalRow227TriangleData0924.coefficient65_94,
  OriginalRow227TriangleData0924.coefficient65_95
]

theorem values0924_size : values0924.size = 32 := rfl

def block0924 : ℕ → Option IntervalDyadic := segment 64 values0924

theorem block0924_domain : ExactDomain block0924 64 96 := by
  simpa only [values0924_size] using segment_domain 64 values0924

theorem block0924_get (i : Fin 32) :
    block0924 (64 + i.val) = some (values0924[i.val]'(by rw [values0924_size]; exact i.isLt)) := by
  exact segment_get 64 values0924 ⟨i.val, by rw [values0924_size]; exact i.isLt⟩

def values0925 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0925.coefficient65_96,
  OriginalRow227TriangleData0925.coefficient65_97,
  OriginalRow227TriangleData0925.coefficient65_98,
  OriginalRow227TriangleData0925.coefficient65_99,
  OriginalRow227TriangleData0925.coefficient65_100,
  OriginalRow227TriangleData0925.coefficient65_101,
  OriginalRow227TriangleData0925.coefficient65_102,
  OriginalRow227TriangleData0925.coefficient65_103,
  OriginalRow227TriangleData0925.coefficient65_104,
  OriginalRow227TriangleData0925.coefficient65_105,
  OriginalRow227TriangleData0925.coefficient65_106,
  OriginalRow227TriangleData0925.coefficient65_107,
  OriginalRow227TriangleData0925.coefficient65_108,
  OriginalRow227TriangleData0925.coefficient65_109,
  OriginalRow227TriangleData0925.coefficient65_110,
  OriginalRow227TriangleData0925.coefficient65_111,
  OriginalRow227TriangleData0925.coefficient65_112,
  OriginalRow227TriangleData0925.coefficient65_113,
  OriginalRow227TriangleData0925.coefficient65_114,
  OriginalRow227TriangleData0925.coefficient65_115,
  OriginalRow227TriangleData0925.coefficient65_116,
  OriginalRow227TriangleData0925.coefficient65_117,
  OriginalRow227TriangleData0925.coefficient65_118,
  OriginalRow227TriangleData0925.coefficient65_119,
  OriginalRow227TriangleData0925.coefficient65_120,
  OriginalRow227TriangleData0925.coefficient65_121,
  OriginalRow227TriangleData0925.coefficient65_122,
  OriginalRow227TriangleData0925.coefficient65_123,
  OriginalRow227TriangleData0925.coefficient65_124,
  OriginalRow227TriangleData0925.coefficient65_125,
  OriginalRow227TriangleData0925.coefficient65_126,
  OriginalRow227TriangleData0925.coefficient65_127
]

theorem values0925_size : values0925.size = 32 := rfl

def block0925 : ℕ → Option IntervalDyadic := segment 96 values0925

theorem block0925_domain : ExactDomain block0925 96 128 := by
  simpa only [values0925_size] using segment_domain 96 values0925

theorem block0925_get (i : Fin 32) :
    block0925 (96 + i.val) = some (values0925[i.val]'(by rw [values0925_size]; exact i.isLt)) := by
  exact segment_get 96 values0925 ⟨i.val, by rw [values0925_size]; exact i.isLt⟩

def values0926 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0926.coefficient65_128,
  OriginalRow227TriangleData0926.coefficient65_129,
  OriginalRow227TriangleData0926.coefficient65_130,
  OriginalRow227TriangleData0926.coefficient65_131,
  OriginalRow227TriangleData0926.coefficient65_132,
  OriginalRow227TriangleData0926.coefficient65_133,
  OriginalRow227TriangleData0926.coefficient65_134,
  OriginalRow227TriangleData0926.coefficient65_135,
  OriginalRow227TriangleData0926.coefficient65_136,
  OriginalRow227TriangleData0926.coefficient65_137,
  OriginalRow227TriangleData0926.coefficient65_138,
  OriginalRow227TriangleData0926.coefficient65_139,
  OriginalRow227TriangleData0926.coefficient65_140,
  OriginalRow227TriangleData0926.coefficient65_141,
  OriginalRow227TriangleData0926.coefficient65_142,
  OriginalRow227TriangleData0926.coefficient65_143,
  OriginalRow227TriangleData0926.coefficient65_144,
  OriginalRow227TriangleData0926.coefficient65_145,
  OriginalRow227TriangleData0926.coefficient65_146,
  OriginalRow227TriangleData0926.coefficient65_147,
  OriginalRow227TriangleData0926.coefficient65_148,
  OriginalRow227TriangleData0926.coefficient65_149,
  OriginalRow227TriangleData0926.coefficient65_150,
  OriginalRow227TriangleData0926.coefficient65_151,
  OriginalRow227TriangleData0926.coefficient65_152,
  OriginalRow227TriangleData0926.coefficient65_153,
  OriginalRow227TriangleData0926.coefficient65_154,
  OriginalRow227TriangleData0926.coefficient65_155,
  OriginalRow227TriangleData0926.coefficient65_156,
  OriginalRow227TriangleData0926.coefficient65_157,
  OriginalRow227TriangleData0926.coefficient65_158,
  OriginalRow227TriangleData0926.coefficient65_159
]

theorem values0926_size : values0926.size = 32 := rfl

def block0926 : ℕ → Option IntervalDyadic := segment 128 values0926

theorem block0926_domain : ExactDomain block0926 128 160 := by
  simpa only [values0926_size] using segment_domain 128 values0926

theorem block0926_get (i : Fin 32) :
    block0926 (128 + i.val) = some (values0926[i.val]'(by rw [values0926_size]; exact i.isLt)) := by
  exact segment_get 128 values0926 ⟨i.val, by rw [values0926_size]; exact i.isLt⟩

def values0927 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0927.coefficient65_160,
  OriginalRow227TriangleData0927.coefficient65_161,
  OriginalRow227TriangleData0927.coefficient65_162,
  OriginalRow227TriangleData0927.coefficient65_163,
  OriginalRow227TriangleData0927.coefficient65_164,
  OriginalRow227TriangleData0927.coefficient65_165,
  OriginalRow227TriangleData0927.coefficient65_166,
  OriginalRow227TriangleData0927.coefficient65_167,
  OriginalRow227TriangleData0927.coefficient65_168,
  OriginalRow227TriangleData0927.coefficient65_169,
  OriginalRow227TriangleData0927.coefficient65_170,
  OriginalRow227TriangleData0927.coefficient65_171,
  OriginalRow227TriangleData0927.coefficient65_172,
  OriginalRow227TriangleData0927.coefficient65_173,
  OriginalRow227TriangleData0927.coefficient65_174,
  OriginalRow227TriangleData0927.coefficient65_175,
  OriginalRow227TriangleData0927.coefficient65_176,
  OriginalRow227TriangleData0927.coefficient65_177,
  OriginalRow227TriangleData0927.coefficient65_178,
  OriginalRow227TriangleData0927.coefficient65_179,
  OriginalRow227TriangleData0927.coefficient65_180,
  OriginalRow227TriangleData0927.coefficient65_181,
  OriginalRow227TriangleData0927.coefficient65_182,
  OriginalRow227TriangleData0927.coefficient65_183,
  OriginalRow227TriangleData0927.coefficient65_184,
  OriginalRow227TriangleData0927.coefficient65_185,
  OriginalRow227TriangleData0927.coefficient65_186,
  OriginalRow227TriangleData0927.coefficient65_187,
  OriginalRow227TriangleData0927.coefficient65_188,
  OriginalRow227TriangleData0927.coefficient65_189,
  OriginalRow227TriangleData0927.coefficient65_190,
  OriginalRow227TriangleData0927.coefficient65_191
]

theorem values0927_size : values0927.size = 32 := rfl

def block0927 : ℕ → Option IntervalDyadic := segment 160 values0927

theorem block0927_domain : ExactDomain block0927 160 192 := by
  simpa only [values0927_size] using segment_domain 160 values0927

theorem block0927_get (i : Fin 32) :
    block0927 (160 + i.val) = some (values0927[i.val]'(by rw [values0927_size]; exact i.isLt)) := by
  exact segment_get 160 values0927 ⟨i.val, by rw [values0927_size]; exact i.isLt⟩

def values0928 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0928.coefficient65_192,
  OriginalRow227TriangleData0928.coefficient65_193,
  OriginalRow227TriangleData0928.coefficient65_194,
  OriginalRow227TriangleData0928.coefficient65_195,
  OriginalRow227TriangleData0928.coefficient65_196,
  OriginalRow227TriangleData0928.coefficient65_197,
  OriginalRow227TriangleData0928.coefficient65_198,
  OriginalRow227TriangleData0928.coefficient65_199,
  OriginalRow227TriangleData0928.coefficient65_200,
  OriginalRow227TriangleData0928.coefficient65_201,
  OriginalRow227TriangleData0928.coefficient65_202,
  OriginalRow227TriangleData0928.coefficient65_203,
  OriginalRow227TriangleData0928.coefficient65_204,
  OriginalRow227TriangleData0928.coefficient65_205,
  OriginalRow227TriangleData0928.coefficient65_206,
  OriginalRow227TriangleData0928.coefficient65_207,
  OriginalRow227TriangleData0928.coefficient65_208,
  OriginalRow227TriangleData0928.coefficient65_209,
  OriginalRow227TriangleData0928.coefficient65_210,
  OriginalRow227TriangleData0928.coefficient65_211,
  OriginalRow227TriangleData0928.coefficient65_212,
  OriginalRow227TriangleData0928.coefficient65_213,
  OriginalRow227TriangleData0928.coefficient65_214,
  OriginalRow227TriangleData0928.coefficient65_215,
  OriginalRow227TriangleData0928.coefficient65_216,
  OriginalRow227TriangleData0928.coefficient65_217,
  OriginalRow227TriangleData0928.coefficient65_218,
  OriginalRow227TriangleData0928.coefficient65_219,
  OriginalRow227TriangleData0928.coefficient65_220,
  OriginalRow227TriangleData0928.coefficient65_221,
  OriginalRow227TriangleData0928.coefficient65_222,
  OriginalRow227TriangleData0928.coefficient65_223
]

theorem values0928_size : values0928.size = 32 := rfl

def block0928 : ℕ → Option IntervalDyadic := segment 192 values0928

theorem block0928_domain : ExactDomain block0928 192 224 := by
  simpa only [values0928_size] using segment_domain 192 values0928

theorem block0928_get (i : Fin 32) :
    block0928 (192 + i.val) = some (values0928[i.val]'(by rw [values0928_size]; exact i.isLt)) := by
  exact segment_get 192 values0928 ⟨i.val, by rw [values0928_size]; exact i.isLt⟩

def values0929 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0929.coefficient65_224,
  OriginalRow227TriangleData0929.coefficient65_225,
  OriginalRow227TriangleData0929.coefficient65_226,
  OriginalRow227TriangleData0929.coefficient65_227,
  OriginalRow227TriangleData0929.coefficient65_228,
  OriginalRow227TriangleData0929.coefficient65_229,
  OriginalRow227TriangleData0929.coefficient65_230,
  OriginalRow227TriangleData0929.coefficient65_231,
  OriginalRow227TriangleData0929.coefficient65_232,
  OriginalRow227TriangleData0929.coefficient65_233,
  OriginalRow227TriangleData0929.coefficient65_234,
  OriginalRow227TriangleData0929.coefficient65_235,
  OriginalRow227TriangleData0929.coefficient65_236,
  OriginalRow227TriangleData0929.coefficient65_237,
  OriginalRow227TriangleData0929.coefficient65_238,
  OriginalRow227TriangleData0929.coefficient65_239,
  OriginalRow227TriangleData0929.coefficient65_240,
  OriginalRow227TriangleData0929.coefficient65_241,
  OriginalRow227TriangleData0929.coefficient65_242,
  OriginalRow227TriangleData0929.coefficient65_243,
  OriginalRow227TriangleData0929.coefficient65_244,
  OriginalRow227TriangleData0929.coefficient65_245,
  OriginalRow227TriangleData0929.coefficient65_246,
  OriginalRow227TriangleData0929.coefficient65_247,
  OriginalRow227TriangleData0929.coefficient65_248,
  OriginalRow227TriangleData0929.coefficient65_249,
  OriginalRow227TriangleData0929.coefficient65_250,
  OriginalRow227TriangleData0929.coefficient65_251,
  OriginalRow227TriangleData0929.coefficient65_252,
  OriginalRow227TriangleData0929.coefficient65_253,
  OriginalRow227TriangleData0929.coefficient65_254,
  OriginalRow227TriangleData0929.coefficient65_255
]

theorem values0929_size : values0929.size = 32 := rfl

def block0929 : ℕ → Option IntervalDyadic := segment 224 values0929

theorem block0929_domain : ExactDomain block0929 224 256 := by
  simpa only [values0929_size] using segment_domain 224 values0929

theorem block0929_get (i : Fin 32) :
    block0929 (224 + i.val) = some (values0929[i.val]'(by rw [values0929_size]; exact i.isLt)) := by
  exact segment_get 224 values0929 ⟨i.val, by rw [values0929_size]; exact i.isLt⟩

def values0930 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0930.coefficient65_256,
  OriginalRow227TriangleData0930.coefficient65_257,
  OriginalRow227TriangleData0930.coefficient65_258,
  OriginalRow227TriangleData0930.coefficient65_259,
  OriginalRow227TriangleData0930.coefficient65_260,
  OriginalRow227TriangleData0930.coefficient65_261,
  OriginalRow227TriangleData0930.coefficient65_262,
  OriginalRow227TriangleData0930.coefficient65_263,
  OriginalRow227TriangleData0930.coefficient65_264,
  OriginalRow227TriangleData0930.coefficient65_265,
  OriginalRow227TriangleData0930.coefficient65_266,
  OriginalRow227TriangleData0930.coefficient65_267,
  OriginalRow227TriangleData0930.coefficient65_268,
  OriginalRow227TriangleData0930.coefficient65_269,
  OriginalRow227TriangleData0930.coefficient65_270,
  OriginalRow227TriangleData0930.coefficient65_271,
  OriginalRow227TriangleData0930.coefficient65_272,
  OriginalRow227TriangleData0930.coefficient65_273,
  OriginalRow227TriangleData0930.coefficient65_274,
  OriginalRow227TriangleData0930.coefficient65_275,
  OriginalRow227TriangleData0930.coefficient65_276,
  OriginalRow227TriangleData0930.coefficient65_277,
  OriginalRow227TriangleData0930.coefficient65_278,
  OriginalRow227TriangleData0930.coefficient65_279,
  OriginalRow227TriangleData0930.coefficient65_280,
  OriginalRow227TriangleData0930.coefficient65_281,
  OriginalRow227TriangleData0930.coefficient65_282,
  OriginalRow227TriangleData0930.coefficient65_283,
  OriginalRow227TriangleData0930.coefficient65_284,
  OriginalRow227TriangleData0930.coefficient65_285,
  OriginalRow227TriangleData0930.coefficient65_286,
  OriginalRow227TriangleData0930.coefficient65_287
]

theorem values0930_size : values0930.size = 32 := rfl

def block0930 : ℕ → Option IntervalDyadic := segment 256 values0930

theorem block0930_domain : ExactDomain block0930 256 288 := by
  simpa only [values0930_size] using segment_domain 256 values0930

theorem block0930_get (i : Fin 32) :
    block0930 (256 + i.val) = some (values0930[i.val]'(by rw [values0930_size]; exact i.isLt)) := by
  exact segment_get 256 values0930 ⟨i.val, by rw [values0930_size]; exact i.isLt⟩

def values0931 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0931.coefficient65_288,
  OriginalRow227TriangleData0931.coefficient65_289,
  OriginalRow227TriangleData0931.coefficient65_290,
  OriginalRow227TriangleData0931.coefficient65_291,
  OriginalRow227TriangleData0931.coefficient65_292,
  OriginalRow227TriangleData0931.coefficient65_293,
  OriginalRow227TriangleData0931.coefficient65_294,
  OriginalRow227TriangleData0931.coefficient65_295,
  OriginalRow227TriangleData0931.coefficient65_296,
  OriginalRow227TriangleData0931.coefficient65_297,
  OriginalRow227TriangleData0931.coefficient65_298,
  OriginalRow227TriangleData0931.coefficient65_299,
  OriginalRow227TriangleData0931.coefficient65_300,
  OriginalRow227TriangleData0931.coefficient65_301,
  OriginalRow227TriangleData0931.coefficient65_302,
  OriginalRow227TriangleData0931.coefficient65_303,
  OriginalRow227TriangleData0931.coefficient65_304,
  OriginalRow227TriangleData0931.coefficient65_305,
  OriginalRow227TriangleData0931.coefficient65_306,
  OriginalRow227TriangleData0931.coefficient65_307,
  OriginalRow227TriangleData0931.coefficient65_308,
  OriginalRow227TriangleData0931.coefficient65_309,
  OriginalRow227TriangleData0931.coefficient65_310,
  OriginalRow227TriangleData0931.coefficient65_311,
  OriginalRow227TriangleData0931.coefficient65_312,
  OriginalRow227TriangleData0931.coefficient65_313,
  OriginalRow227TriangleData0931.coefficient65_314,
  OriginalRow227TriangleData0931.coefficient65_315,
  OriginalRow227TriangleData0931.coefficient65_316,
  OriginalRow227TriangleData0931.coefficient65_317,
  OriginalRow227TriangleData0931.coefficient65_318,
  OriginalRow227TriangleData0931.coefficient65_319
]

theorem values0931_size : values0931.size = 32 := rfl

def block0931 : ℕ → Option IntervalDyadic := segment 288 values0931

theorem block0931_domain : ExactDomain block0931 288 320 := by
  simpa only [values0931_size] using segment_domain 288 values0931

theorem block0931_get (i : Fin 32) :
    block0931 (288 + i.val) = some (values0931[i.val]'(by rw [values0931_size]; exact i.isLt)) := by
  exact segment_get 288 values0931 ⟨i.val, by rw [values0931_size]; exact i.isLt⟩

def values0932 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0932.coefficient65_320,
  OriginalRow227TriangleData0932.coefficient65_321,
  OriginalRow227TriangleData0932.coefficient65_322,
  OriginalRow227TriangleData0932.coefficient65_323,
  OriginalRow227TriangleData0932.coefficient65_324,
  OriginalRow227TriangleData0932.coefficient65_325,
  OriginalRow227TriangleData0932.coefficient65_326,
  OriginalRow227TriangleData0932.coefficient65_327,
  OriginalRow227TriangleData0932.coefficient65_328,
  OriginalRow227TriangleData0932.coefficient65_329,
  OriginalRow227TriangleData0932.coefficient65_330,
  OriginalRow227TriangleData0932.coefficient65_331,
  OriginalRow227TriangleData0932.coefficient65_332,
  OriginalRow227TriangleData0932.coefficient65_333,
  OriginalRow227TriangleData0932.coefficient65_334,
  OriginalRow227TriangleData0932.coefficient65_335,
  OriginalRow227TriangleData0932.coefficient65_336,
  OriginalRow227TriangleData0932.coefficient65_337,
  OriginalRow227TriangleData0932.coefficient65_338,
  OriginalRow227TriangleData0932.coefficient65_339,
  OriginalRow227TriangleData0932.coefficient65_340,
  OriginalRow227TriangleData0932.coefficient65_341,
  OriginalRow227TriangleData0932.coefficient65_342,
  OriginalRow227TriangleData0932.coefficient65_343,
  OriginalRow227TriangleData0932.coefficient65_344,
  OriginalRow227TriangleData0932.coefficient65_345,
  OriginalRow227TriangleData0932.coefficient65_346,
  OriginalRow227TriangleData0932.coefficient65_347,
  OriginalRow227TriangleData0932.coefficient65_348,
  OriginalRow227TriangleData0932.coefficient65_349,
  OriginalRow227TriangleData0932.coefficient65_350,
  OriginalRow227TriangleData0932.coefficient65_351
]

theorem values0932_size : values0932.size = 32 := rfl

def block0932 : ℕ → Option IntervalDyadic := segment 320 values0932

theorem block0932_domain : ExactDomain block0932 320 352 := by
  simpa only [values0932_size] using segment_domain 320 values0932

theorem block0932_get (i : Fin 32) :
    block0932 (320 + i.val) = some (values0932[i.val]'(by rw [values0932_size]; exact i.isLt)) := by
  exact segment_get 320 values0932 ⟨i.val, by rw [values0932_size]; exact i.isLt⟩

def values0933 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0933.coefficient65_352,
  OriginalRow227TriangleData0933.coefficient65_353,
  OriginalRow227TriangleData0933.coefficient65_354,
  OriginalRow227TriangleData0933.coefficient65_355,
  OriginalRow227TriangleData0933.coefficient65_356,
  OriginalRow227TriangleData0933.coefficient65_357,
  OriginalRow227TriangleData0933.coefficient65_358,
  OriginalRow227TriangleData0933.coefficient65_359,
  OriginalRow227TriangleData0933.coefficient65_360,
  OriginalRow227TriangleData0933.coefficient65_361,
  OriginalRow227TriangleData0933.coefficient65_362,
  OriginalRow227TriangleData0933.coefficient65_363,
  OriginalRow227TriangleData0933.coefficient65_364,
  OriginalRow227TriangleData0933.coefficient65_365,
  OriginalRow227TriangleData0933.coefficient65_366,
  OriginalRow227TriangleData0933.coefficient65_367,
  OriginalRow227TriangleData0933.coefficient65_368,
  OriginalRow227TriangleData0933.coefficient65_369,
  OriginalRow227TriangleData0933.coefficient65_370,
  OriginalRow227TriangleData0933.coefficient65_371,
  OriginalRow227TriangleData0933.coefficient65_372,
  OriginalRow227TriangleData0933.coefficient65_373,
  OriginalRow227TriangleData0933.coefficient65_374,
  OriginalRow227TriangleData0933.coefficient65_375,
  OriginalRow227TriangleData0933.coefficient65_376,
  OriginalRow227TriangleData0933.coefficient65_377,
  OriginalRow227TriangleData0933.coefficient65_378,
  OriginalRow227TriangleData0933.coefficient65_379,
  OriginalRow227TriangleData0933.coefficient65_380,
  OriginalRow227TriangleData0933.coefficient65_381,
  OriginalRow227TriangleData0933.coefficient65_382,
  OriginalRow227TriangleData0933.coefficient65_383
]

theorem values0933_size : values0933.size = 32 := rfl

def block0933 : ℕ → Option IntervalDyadic := segment 352 values0933

theorem block0933_domain : ExactDomain block0933 352 384 := by
  simpa only [values0933_size] using segment_domain 352 values0933

theorem block0933_get (i : Fin 32) :
    block0933 (352 + i.val) = some (values0933[i.val]'(by rw [values0933_size]; exact i.isLt)) := by
  exact segment_get 352 values0933 ⟨i.val, by rw [values0933_size]; exact i.isLt⟩

def values0934 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0934.coefficient65_384,
  OriginalRow227TriangleData0934.coefficient65_385,
  OriginalRow227TriangleData0934.coefficient65_386,
  OriginalRow227TriangleData0934.coefficient65_387,
  OriginalRow227TriangleData0934.coefficient65_388,
  OriginalRow227TriangleData0934.coefficient65_389,
  OriginalRow227TriangleData0934.coefficient65_390,
  OriginalRow227TriangleData0934.coefficient65_391,
  OriginalRow227TriangleData0934.coefficient65_392,
  OriginalRow227TriangleData0934.coefficient65_393,
  OriginalRow227TriangleData0934.coefficient65_394,
  OriginalRow227TriangleData0934.coefficient65_395,
  OriginalRow227TriangleData0934.coefficient65_396,
  OriginalRow227TriangleData0934.coefficient65_397,
  OriginalRow227TriangleData0934.coefficient65_398,
  OriginalRow227TriangleData0934.coefficient65_399,
  OriginalRow227TriangleData0934.coefficient65_400,
  OriginalRow227TriangleData0934.coefficient65_401,
  OriginalRow227TriangleData0934.coefficient65_402,
  OriginalRow227TriangleData0934.coefficient65_403,
  OriginalRow227TriangleData0934.coefficient65_404,
  OriginalRow227TriangleData0934.coefficient65_405,
  OriginalRow227TriangleData0934.coefficient65_406,
  OriginalRow227TriangleData0934.coefficient65_407,
  OriginalRow227TriangleData0934.coefficient65_408,
  OriginalRow227TriangleData0934.coefficient65_409,
  OriginalRow227TriangleData0934.coefficient65_410,
  OriginalRow227TriangleData0934.coefficient65_411,
  OriginalRow227TriangleData0934.coefficient65_412,
  OriginalRow227TriangleData0934.coefficient65_413,
  OriginalRow227TriangleData0934.coefficient65_414,
  OriginalRow227TriangleData0934.coefficient65_415
]

theorem values0934_size : values0934.size = 32 := rfl

def block0934 : ℕ → Option IntervalDyadic := segment 384 values0934

theorem block0934_domain : ExactDomain block0934 384 416 := by
  simpa only [values0934_size] using segment_domain 384 values0934

theorem block0934_get (i : Fin 32) :
    block0934 (384 + i.val) = some (values0934[i.val]'(by rw [values0934_size]; exact i.isLt)) := by
  exact segment_get 384 values0934 ⟨i.val, by rw [values0934_size]; exact i.isLt⟩

def values0935 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0935.coefficient65_416,
  OriginalRow227TriangleData0935.coefficient65_417,
  OriginalRow227TriangleData0935.coefficient65_418,
  OriginalRow227TriangleData0935.coefficient65_419,
  OriginalRow227TriangleData0935.coefficient65_420,
  OriginalRow227TriangleData0935.coefficient65_421,
  OriginalRow227TriangleData0935.coefficient65_422,
  OriginalRow227TriangleData0935.coefficient65_423,
  OriginalRow227TriangleData0935.coefficient65_424,
  OriginalRow227TriangleData0935.coefficient65_425,
  OriginalRow227TriangleData0935.coefficient65_426,
  OriginalRow227TriangleData0935.coefficient65_427,
  OriginalRow227TriangleData0935.coefficient65_428,
  OriginalRow227TriangleData0935.coefficient65_429,
  OriginalRow227TriangleData0935.coefficient65_430,
  OriginalRow227TriangleData0935.coefficient65_431,
  OriginalRow227TriangleData0935.coefficient65_432,
  OriginalRow227TriangleData0935.coefficient65_433,
  OriginalRow227TriangleData0935.coefficient65_434,
  OriginalRow227TriangleData0935.coefficient65_435,
  OriginalRow227TriangleData0935.coefficient65_436
]

theorem values0935_size : values0935.size = 21 := rfl

def block0935 : ℕ → Option IntervalDyadic := segment 416 values0935

theorem block0935_domain : ExactDomain block0935 416 437 := by
  simpa only [values0935_size] using segment_domain 416 values0935

theorem block0935_get (i : Fin 21) :
    block0935 (416 + i.val) = some (values0935[i.val]'(by rw [values0935_size]; exact i.isLt)) := by
  exact segment_get 416 values0935 ⟨i.val, by rw [values0935_size]; exact i.isLt⟩

def node0096_0160 : ℕ → Option IntervalDyadic := split 128 block0925 block0926

theorem node0096_0160_domain : ExactDomain node0096_0160 96 160 := by
  exact split_domain (by decide) (by decide) block0925_domain block0926_domain

def node0064_0160 : ℕ → Option IntervalDyadic := split 96 block0924 node0096_0160

theorem node0064_0160_domain : ExactDomain node0064_0160 64 160 := by
  exact split_domain (by decide) (by decide) block0924_domain node0096_0160_domain

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block0928 block0929

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block0928_domain block0929_domain

def node0160_0256 : ℕ → Option IntervalDyadic := split 192 block0927 node0192_0256

theorem node0160_0256_domain : ExactDomain node0160_0256 160 256 := by
  exact split_domain (by decide) (by decide) block0927_domain node0192_0256_domain

def node0064_0256 : ℕ → Option IntervalDyadic := split 160 node0064_0160 node0160_0256

theorem node0064_0256_domain : ExactDomain node0064_0256 64 256 := by
  exact split_domain (by decide) (by decide) node0064_0160_domain node0160_0256_domain

def node0288_0352 : ℕ → Option IntervalDyadic := split 320 block0931 block0932

theorem node0288_0352_domain : ExactDomain node0288_0352 288 352 := by
  exact split_domain (by decide) (by decide) block0931_domain block0932_domain

def node0256_0352 : ℕ → Option IntervalDyadic := split 288 block0930 node0288_0352

theorem node0256_0352_domain : ExactDomain node0256_0352 256 352 := by
  exact split_domain (by decide) (by decide) block0930_domain node0288_0352_domain

def node0384_0437 : ℕ → Option IntervalDyadic := split 416 block0934 block0935

theorem node0384_0437_domain : ExactDomain node0384_0437 384 437 := by
  exact split_domain (by decide) (by decide) block0934_domain block0935_domain

def node0352_0437 : ℕ → Option IntervalDyadic := split 384 block0933 node0384_0437

theorem node0352_0437_domain : ExactDomain node0352_0437 352 437 := by
  exact split_domain (by decide) (by decide) block0933_domain node0384_0437_domain

def node0256_0437 : ℕ → Option IntervalDyadic := split 352 node0256_0352 node0352_0437

theorem node0256_0437_domain : ExactDomain node0256_0437 256 437 := by
  exact split_domain (by decide) (by decide) node0256_0352_domain node0352_0437_domain

def node0064_0437 : ℕ → Option IntervalDyadic := split 256 node0064_0256 node0256_0437

theorem node0064_0437_domain : ExactDomain node0064_0437 64 437 := by
  exact split_domain (by decide) (by decide) node0064_0256_domain node0256_0437_domain

def lookup : ℕ → Option IntervalDyadic := node0064_0437

theorem lookup_domain : ExactDomain lookup 64 437 :=
  node0064_0437_domain

theorem block0924_lookup (i : Fin 32) :
    lookup (64 + i.val) = some (values0924[i.val]'(by rw [values0924_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (64 + i.val) = _
  rw [node0064_0437, split_left 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0064_0256, split_left 160 node0064_0160 node0160_0256 (by omega)]
  rw [node0064_0160, split_left 96 block0924 node0096_0160 (by omega)]
  exact block0924_get i

theorem block0925_lookup (i : Fin 32) :
    lookup (96 + i.val) = some (values0925[i.val]'(by rw [values0925_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (96 + i.val) = _
  rw [node0064_0437, split_left 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0064_0256, split_left 160 node0064_0160 node0160_0256 (by omega)]
  rw [node0064_0160, split_right 96 block0924 node0096_0160 (by omega)]
  rw [node0096_0160, split_left 128 block0925 block0926 (by omega)]
  exact block0925_get i

theorem block0926_lookup (i : Fin 32) :
    lookup (128 + i.val) = some (values0926[i.val]'(by rw [values0926_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (128 + i.val) = _
  rw [node0064_0437, split_left 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0064_0256, split_left 160 node0064_0160 node0160_0256 (by omega)]
  rw [node0064_0160, split_right 96 block0924 node0096_0160 (by omega)]
  rw [node0096_0160, split_right 128 block0925 block0926 (by omega)]
  exact block0926_get i

theorem block0927_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values0927[i.val]'(by rw [values0927_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (160 + i.val) = _
  rw [node0064_0437, split_left 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0064_0256, split_right 160 node0064_0160 node0160_0256 (by omega)]
  rw [node0160_0256, split_left 192 block0927 node0192_0256 (by omega)]
  exact block0927_get i

theorem block0928_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values0928[i.val]'(by rw [values0928_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (192 + i.val) = _
  rw [node0064_0437, split_left 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0064_0256, split_right 160 node0064_0160 node0160_0256 (by omega)]
  rw [node0160_0256, split_right 192 block0927 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block0928 block0929 (by omega)]
  exact block0928_get i

theorem block0929_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values0929[i.val]'(by rw [values0929_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (224 + i.val) = _
  rw [node0064_0437, split_left 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0064_0256, split_right 160 node0064_0160 node0160_0256 (by omega)]
  rw [node0160_0256, split_right 192 block0927 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block0928 block0929 (by omega)]
  exact block0929_get i

theorem block0930_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values0930[i.val]'(by rw [values0930_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (256 + i.val) = _
  rw [node0064_0437, split_right 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0256_0437, split_left 352 node0256_0352 node0352_0437 (by omega)]
  rw [node0256_0352, split_left 288 block0930 node0288_0352 (by omega)]
  exact block0930_get i

theorem block0931_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values0931[i.val]'(by rw [values0931_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (288 + i.val) = _
  rw [node0064_0437, split_right 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0256_0437, split_left 352 node0256_0352 node0352_0437 (by omega)]
  rw [node0256_0352, split_right 288 block0930 node0288_0352 (by omega)]
  rw [node0288_0352, split_left 320 block0931 block0932 (by omega)]
  exact block0931_get i

theorem block0932_lookup (i : Fin 32) :
    lookup (320 + i.val) = some (values0932[i.val]'(by rw [values0932_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (320 + i.val) = _
  rw [node0064_0437, split_right 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0256_0437, split_left 352 node0256_0352 node0352_0437 (by omega)]
  rw [node0256_0352, split_right 288 block0930 node0288_0352 (by omega)]
  rw [node0288_0352, split_right 320 block0931 block0932 (by omega)]
  exact block0932_get i

theorem block0933_lookup (i : Fin 32) :
    lookup (352 + i.val) = some (values0933[i.val]'(by rw [values0933_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (352 + i.val) = _
  rw [node0064_0437, split_right 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0256_0437, split_right 352 node0256_0352 node0352_0437 (by omega)]
  rw [node0352_0437, split_left 384 block0933 node0384_0437 (by omega)]
  exact block0933_get i

theorem block0934_lookup (i : Fin 32) :
    lookup (384 + i.val) = some (values0934[i.val]'(by rw [values0934_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (384 + i.val) = _
  rw [node0064_0437, split_right 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0256_0437, split_right 352 node0256_0352 node0352_0437 (by omega)]
  rw [node0352_0437, split_right 384 block0933 node0384_0437 (by omega)]
  rw [node0384_0437, split_left 416 block0934 block0935 (by omega)]
  exact block0934_get i

theorem block0935_lookup (i : Fin 21) :
    lookup (416 + i.val) = some (values0935[i.val]'(by rw [values0935_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0064_0437 (416 + i.val) = _
  rw [node0064_0437, split_right 256 node0064_0256 node0256_0437 (by omega)]
  rw [node0256_0437, split_right 352 node0256_0352 node0352_0437 (by omega)]
  rw [node0352_0437, split_right 384 block0933 node0384_0437 (by omega)]
  rw [node0384_0437, split_right 416 block0934 block0935 (by omega)]
  exact block0935_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0924_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0924_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0925_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0925_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0926_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0926_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0927_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0927_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0928_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0928_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0929_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0929_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0930_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0930_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0931_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0931_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0932_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0932_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0933_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0933_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0934_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0934_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0935_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0935_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0924_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0925_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0926_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0927_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0928_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0929_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0930_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0931_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0932_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0933_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0934_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow065.block0935_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow065
