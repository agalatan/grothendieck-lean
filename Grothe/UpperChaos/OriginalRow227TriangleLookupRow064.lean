import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0912
import Grothe.UpperChaos.OriginalRow227TriangleData0913
import Grothe.UpperChaos.OriginalRow227TriangleData0914
import Grothe.UpperChaos.OriginalRow227TriangleData0915
import Grothe.UpperChaos.OriginalRow227TriangleData0916
import Grothe.UpperChaos.OriginalRow227TriangleData0917
import Grothe.UpperChaos.OriginalRow227TriangleData0918
import Grothe.UpperChaos.OriginalRow227TriangleData0919
import Grothe.UpperChaos.OriginalRow227TriangleData0920
import Grothe.UpperChaos.OriginalRow227TriangleData0921
import Grothe.UpperChaos.OriginalRow227TriangleData0922
import Grothe.UpperChaos.OriginalRow227TriangleData0923

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow064

open ConditionalTableLookup

def values0912 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0912.coefficient64_63,
  OriginalRow227TriangleData0912.coefficient64_64,
  OriginalRow227TriangleData0912.coefficient64_65,
  OriginalRow227TriangleData0912.coefficient64_66,
  OriginalRow227TriangleData0912.coefficient64_67,
  OriginalRow227TriangleData0912.coefficient64_68,
  OriginalRow227TriangleData0912.coefficient64_69,
  OriginalRow227TriangleData0912.coefficient64_70,
  OriginalRow227TriangleData0912.coefficient64_71,
  OriginalRow227TriangleData0912.coefficient64_72,
  OriginalRow227TriangleData0912.coefficient64_73,
  OriginalRow227TriangleData0912.coefficient64_74,
  OriginalRow227TriangleData0912.coefficient64_75,
  OriginalRow227TriangleData0912.coefficient64_76,
  OriginalRow227TriangleData0912.coefficient64_77,
  OriginalRow227TriangleData0912.coefficient64_78,
  OriginalRow227TriangleData0912.coefficient64_79,
  OriginalRow227TriangleData0912.coefficient64_80,
  OriginalRow227TriangleData0912.coefficient64_81,
  OriginalRow227TriangleData0912.coefficient64_82,
  OriginalRow227TriangleData0912.coefficient64_83,
  OriginalRow227TriangleData0912.coefficient64_84,
  OriginalRow227TriangleData0912.coefficient64_85,
  OriginalRow227TriangleData0912.coefficient64_86,
  OriginalRow227TriangleData0912.coefficient64_87,
  OriginalRow227TriangleData0912.coefficient64_88,
  OriginalRow227TriangleData0912.coefficient64_89,
  OriginalRow227TriangleData0912.coefficient64_90,
  OriginalRow227TriangleData0912.coefficient64_91,
  OriginalRow227TriangleData0912.coefficient64_92,
  OriginalRow227TriangleData0912.coefficient64_93,
  OriginalRow227TriangleData0912.coefficient64_94
]

theorem values0912_size : values0912.size = 32 := rfl

def block0912 : ℕ → Option IntervalDyadic := segment 63 values0912

theorem block0912_domain : ExactDomain block0912 63 95 := by
  simpa only [values0912_size] using segment_domain 63 values0912

theorem block0912_get (i : Fin 32) :
    block0912 (63 + i.val) = some (values0912[i.val]'(by rw [values0912_size]; exact i.isLt)) := by
  exact segment_get 63 values0912 ⟨i.val, by rw [values0912_size]; exact i.isLt⟩

def values0913 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0913.coefficient64_95,
  OriginalRow227TriangleData0913.coefficient64_96,
  OriginalRow227TriangleData0913.coefficient64_97,
  OriginalRow227TriangleData0913.coefficient64_98,
  OriginalRow227TriangleData0913.coefficient64_99,
  OriginalRow227TriangleData0913.coefficient64_100,
  OriginalRow227TriangleData0913.coefficient64_101,
  OriginalRow227TriangleData0913.coefficient64_102,
  OriginalRow227TriangleData0913.coefficient64_103,
  OriginalRow227TriangleData0913.coefficient64_104,
  OriginalRow227TriangleData0913.coefficient64_105,
  OriginalRow227TriangleData0913.coefficient64_106,
  OriginalRow227TriangleData0913.coefficient64_107,
  OriginalRow227TriangleData0913.coefficient64_108,
  OriginalRow227TriangleData0913.coefficient64_109,
  OriginalRow227TriangleData0913.coefficient64_110,
  OriginalRow227TriangleData0913.coefficient64_111,
  OriginalRow227TriangleData0913.coefficient64_112,
  OriginalRow227TriangleData0913.coefficient64_113,
  OriginalRow227TriangleData0913.coefficient64_114,
  OriginalRow227TriangleData0913.coefficient64_115,
  OriginalRow227TriangleData0913.coefficient64_116,
  OriginalRow227TriangleData0913.coefficient64_117,
  OriginalRow227TriangleData0913.coefficient64_118,
  OriginalRow227TriangleData0913.coefficient64_119,
  OriginalRow227TriangleData0913.coefficient64_120,
  OriginalRow227TriangleData0913.coefficient64_121,
  OriginalRow227TriangleData0913.coefficient64_122,
  OriginalRow227TriangleData0913.coefficient64_123,
  OriginalRow227TriangleData0913.coefficient64_124,
  OriginalRow227TriangleData0913.coefficient64_125,
  OriginalRow227TriangleData0913.coefficient64_126
]

theorem values0913_size : values0913.size = 32 := rfl

def block0913 : ℕ → Option IntervalDyadic := segment 95 values0913

theorem block0913_domain : ExactDomain block0913 95 127 := by
  simpa only [values0913_size] using segment_domain 95 values0913

theorem block0913_get (i : Fin 32) :
    block0913 (95 + i.val) = some (values0913[i.val]'(by rw [values0913_size]; exact i.isLt)) := by
  exact segment_get 95 values0913 ⟨i.val, by rw [values0913_size]; exact i.isLt⟩

def values0914 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0914.coefficient64_127,
  OriginalRow227TriangleData0914.coefficient64_128,
  OriginalRow227TriangleData0914.coefficient64_129,
  OriginalRow227TriangleData0914.coefficient64_130,
  OriginalRow227TriangleData0914.coefficient64_131,
  OriginalRow227TriangleData0914.coefficient64_132,
  OriginalRow227TriangleData0914.coefficient64_133,
  OriginalRow227TriangleData0914.coefficient64_134,
  OriginalRow227TriangleData0914.coefficient64_135,
  OriginalRow227TriangleData0914.coefficient64_136,
  OriginalRow227TriangleData0914.coefficient64_137,
  OriginalRow227TriangleData0914.coefficient64_138,
  OriginalRow227TriangleData0914.coefficient64_139,
  OriginalRow227TriangleData0914.coefficient64_140,
  OriginalRow227TriangleData0914.coefficient64_141,
  OriginalRow227TriangleData0914.coefficient64_142,
  OriginalRow227TriangleData0914.coefficient64_143,
  OriginalRow227TriangleData0914.coefficient64_144,
  OriginalRow227TriangleData0914.coefficient64_145,
  OriginalRow227TriangleData0914.coefficient64_146,
  OriginalRow227TriangleData0914.coefficient64_147,
  OriginalRow227TriangleData0914.coefficient64_148,
  OriginalRow227TriangleData0914.coefficient64_149,
  OriginalRow227TriangleData0914.coefficient64_150,
  OriginalRow227TriangleData0914.coefficient64_151,
  OriginalRow227TriangleData0914.coefficient64_152,
  OriginalRow227TriangleData0914.coefficient64_153,
  OriginalRow227TriangleData0914.coefficient64_154,
  OriginalRow227TriangleData0914.coefficient64_155,
  OriginalRow227TriangleData0914.coefficient64_156,
  OriginalRow227TriangleData0914.coefficient64_157,
  OriginalRow227TriangleData0914.coefficient64_158
]

theorem values0914_size : values0914.size = 32 := rfl

def block0914 : ℕ → Option IntervalDyadic := segment 127 values0914

theorem block0914_domain : ExactDomain block0914 127 159 := by
  simpa only [values0914_size] using segment_domain 127 values0914

theorem block0914_get (i : Fin 32) :
    block0914 (127 + i.val) = some (values0914[i.val]'(by rw [values0914_size]; exact i.isLt)) := by
  exact segment_get 127 values0914 ⟨i.val, by rw [values0914_size]; exact i.isLt⟩

def values0915 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0915.coefficient64_159,
  OriginalRow227TriangleData0915.coefficient64_160,
  OriginalRow227TriangleData0915.coefficient64_161,
  OriginalRow227TriangleData0915.coefficient64_162,
  OriginalRow227TriangleData0915.coefficient64_163,
  OriginalRow227TriangleData0915.coefficient64_164,
  OriginalRow227TriangleData0915.coefficient64_165,
  OriginalRow227TriangleData0915.coefficient64_166,
  OriginalRow227TriangleData0915.coefficient64_167,
  OriginalRow227TriangleData0915.coefficient64_168,
  OriginalRow227TriangleData0915.coefficient64_169,
  OriginalRow227TriangleData0915.coefficient64_170,
  OriginalRow227TriangleData0915.coefficient64_171,
  OriginalRow227TriangleData0915.coefficient64_172,
  OriginalRow227TriangleData0915.coefficient64_173,
  OriginalRow227TriangleData0915.coefficient64_174,
  OriginalRow227TriangleData0915.coefficient64_175,
  OriginalRow227TriangleData0915.coefficient64_176,
  OriginalRow227TriangleData0915.coefficient64_177,
  OriginalRow227TriangleData0915.coefficient64_178,
  OriginalRow227TriangleData0915.coefficient64_179,
  OriginalRow227TriangleData0915.coefficient64_180,
  OriginalRow227TriangleData0915.coefficient64_181,
  OriginalRow227TriangleData0915.coefficient64_182,
  OriginalRow227TriangleData0915.coefficient64_183,
  OriginalRow227TriangleData0915.coefficient64_184,
  OriginalRow227TriangleData0915.coefficient64_185,
  OriginalRow227TriangleData0915.coefficient64_186,
  OriginalRow227TriangleData0915.coefficient64_187,
  OriginalRow227TriangleData0915.coefficient64_188,
  OriginalRow227TriangleData0915.coefficient64_189,
  OriginalRow227TriangleData0915.coefficient64_190
]

theorem values0915_size : values0915.size = 32 := rfl

def block0915 : ℕ → Option IntervalDyadic := segment 159 values0915

theorem block0915_domain : ExactDomain block0915 159 191 := by
  simpa only [values0915_size] using segment_domain 159 values0915

theorem block0915_get (i : Fin 32) :
    block0915 (159 + i.val) = some (values0915[i.val]'(by rw [values0915_size]; exact i.isLt)) := by
  exact segment_get 159 values0915 ⟨i.val, by rw [values0915_size]; exact i.isLt⟩

def values0916 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0916.coefficient64_191,
  OriginalRow227TriangleData0916.coefficient64_192,
  OriginalRow227TriangleData0916.coefficient64_193,
  OriginalRow227TriangleData0916.coefficient64_194,
  OriginalRow227TriangleData0916.coefficient64_195,
  OriginalRow227TriangleData0916.coefficient64_196,
  OriginalRow227TriangleData0916.coefficient64_197,
  OriginalRow227TriangleData0916.coefficient64_198,
  OriginalRow227TriangleData0916.coefficient64_199,
  OriginalRow227TriangleData0916.coefficient64_200,
  OriginalRow227TriangleData0916.coefficient64_201,
  OriginalRow227TriangleData0916.coefficient64_202,
  OriginalRow227TriangleData0916.coefficient64_203,
  OriginalRow227TriangleData0916.coefficient64_204,
  OriginalRow227TriangleData0916.coefficient64_205,
  OriginalRow227TriangleData0916.coefficient64_206,
  OriginalRow227TriangleData0916.coefficient64_207,
  OriginalRow227TriangleData0916.coefficient64_208,
  OriginalRow227TriangleData0916.coefficient64_209,
  OriginalRow227TriangleData0916.coefficient64_210,
  OriginalRow227TriangleData0916.coefficient64_211,
  OriginalRow227TriangleData0916.coefficient64_212,
  OriginalRow227TriangleData0916.coefficient64_213,
  OriginalRow227TriangleData0916.coefficient64_214,
  OriginalRow227TriangleData0916.coefficient64_215,
  OriginalRow227TriangleData0916.coefficient64_216,
  OriginalRow227TriangleData0916.coefficient64_217,
  OriginalRow227TriangleData0916.coefficient64_218,
  OriginalRow227TriangleData0916.coefficient64_219,
  OriginalRow227TriangleData0916.coefficient64_220,
  OriginalRow227TriangleData0916.coefficient64_221,
  OriginalRow227TriangleData0916.coefficient64_222
]

theorem values0916_size : values0916.size = 32 := rfl

def block0916 : ℕ → Option IntervalDyadic := segment 191 values0916

theorem block0916_domain : ExactDomain block0916 191 223 := by
  simpa only [values0916_size] using segment_domain 191 values0916

theorem block0916_get (i : Fin 32) :
    block0916 (191 + i.val) = some (values0916[i.val]'(by rw [values0916_size]; exact i.isLt)) := by
  exact segment_get 191 values0916 ⟨i.val, by rw [values0916_size]; exact i.isLt⟩

def values0917 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0917.coefficient64_223,
  OriginalRow227TriangleData0917.coefficient64_224,
  OriginalRow227TriangleData0917.coefficient64_225,
  OriginalRow227TriangleData0917.coefficient64_226,
  OriginalRow227TriangleData0917.coefficient64_227,
  OriginalRow227TriangleData0917.coefficient64_228,
  OriginalRow227TriangleData0917.coefficient64_229,
  OriginalRow227TriangleData0917.coefficient64_230,
  OriginalRow227TriangleData0917.coefficient64_231,
  OriginalRow227TriangleData0917.coefficient64_232,
  OriginalRow227TriangleData0917.coefficient64_233,
  OriginalRow227TriangleData0917.coefficient64_234,
  OriginalRow227TriangleData0917.coefficient64_235,
  OriginalRow227TriangleData0917.coefficient64_236,
  OriginalRow227TriangleData0917.coefficient64_237,
  OriginalRow227TriangleData0917.coefficient64_238,
  OriginalRow227TriangleData0917.coefficient64_239,
  OriginalRow227TriangleData0917.coefficient64_240,
  OriginalRow227TriangleData0917.coefficient64_241,
  OriginalRow227TriangleData0917.coefficient64_242,
  OriginalRow227TriangleData0917.coefficient64_243,
  OriginalRow227TriangleData0917.coefficient64_244,
  OriginalRow227TriangleData0917.coefficient64_245,
  OriginalRow227TriangleData0917.coefficient64_246,
  OriginalRow227TriangleData0917.coefficient64_247,
  OriginalRow227TriangleData0917.coefficient64_248,
  OriginalRow227TriangleData0917.coefficient64_249,
  OriginalRow227TriangleData0917.coefficient64_250,
  OriginalRow227TriangleData0917.coefficient64_251,
  OriginalRow227TriangleData0917.coefficient64_252,
  OriginalRow227TriangleData0917.coefficient64_253,
  OriginalRow227TriangleData0917.coefficient64_254
]

theorem values0917_size : values0917.size = 32 := rfl

def block0917 : ℕ → Option IntervalDyadic := segment 223 values0917

theorem block0917_domain : ExactDomain block0917 223 255 := by
  simpa only [values0917_size] using segment_domain 223 values0917

theorem block0917_get (i : Fin 32) :
    block0917 (223 + i.val) = some (values0917[i.val]'(by rw [values0917_size]; exact i.isLt)) := by
  exact segment_get 223 values0917 ⟨i.val, by rw [values0917_size]; exact i.isLt⟩

def values0918 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0918.coefficient64_255,
  OriginalRow227TriangleData0918.coefficient64_256,
  OriginalRow227TriangleData0918.coefficient64_257,
  OriginalRow227TriangleData0918.coefficient64_258,
  OriginalRow227TriangleData0918.coefficient64_259,
  OriginalRow227TriangleData0918.coefficient64_260,
  OriginalRow227TriangleData0918.coefficient64_261,
  OriginalRow227TriangleData0918.coefficient64_262,
  OriginalRow227TriangleData0918.coefficient64_263,
  OriginalRow227TriangleData0918.coefficient64_264,
  OriginalRow227TriangleData0918.coefficient64_265,
  OriginalRow227TriangleData0918.coefficient64_266,
  OriginalRow227TriangleData0918.coefficient64_267,
  OriginalRow227TriangleData0918.coefficient64_268,
  OriginalRow227TriangleData0918.coefficient64_269,
  OriginalRow227TriangleData0918.coefficient64_270,
  OriginalRow227TriangleData0918.coefficient64_271,
  OriginalRow227TriangleData0918.coefficient64_272,
  OriginalRow227TriangleData0918.coefficient64_273,
  OriginalRow227TriangleData0918.coefficient64_274,
  OriginalRow227TriangleData0918.coefficient64_275,
  OriginalRow227TriangleData0918.coefficient64_276,
  OriginalRow227TriangleData0918.coefficient64_277,
  OriginalRow227TriangleData0918.coefficient64_278,
  OriginalRow227TriangleData0918.coefficient64_279,
  OriginalRow227TriangleData0918.coefficient64_280,
  OriginalRow227TriangleData0918.coefficient64_281,
  OriginalRow227TriangleData0918.coefficient64_282,
  OriginalRow227TriangleData0918.coefficient64_283,
  OriginalRow227TriangleData0918.coefficient64_284,
  OriginalRow227TriangleData0918.coefficient64_285,
  OriginalRow227TriangleData0918.coefficient64_286
]

theorem values0918_size : values0918.size = 32 := rfl

def block0918 : ℕ → Option IntervalDyadic := segment 255 values0918

theorem block0918_domain : ExactDomain block0918 255 287 := by
  simpa only [values0918_size] using segment_domain 255 values0918

theorem block0918_get (i : Fin 32) :
    block0918 (255 + i.val) = some (values0918[i.val]'(by rw [values0918_size]; exact i.isLt)) := by
  exact segment_get 255 values0918 ⟨i.val, by rw [values0918_size]; exact i.isLt⟩

def values0919 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0919.coefficient64_287,
  OriginalRow227TriangleData0919.coefficient64_288,
  OriginalRow227TriangleData0919.coefficient64_289,
  OriginalRow227TriangleData0919.coefficient64_290,
  OriginalRow227TriangleData0919.coefficient64_291,
  OriginalRow227TriangleData0919.coefficient64_292,
  OriginalRow227TriangleData0919.coefficient64_293,
  OriginalRow227TriangleData0919.coefficient64_294,
  OriginalRow227TriangleData0919.coefficient64_295,
  OriginalRow227TriangleData0919.coefficient64_296,
  OriginalRow227TriangleData0919.coefficient64_297,
  OriginalRow227TriangleData0919.coefficient64_298,
  OriginalRow227TriangleData0919.coefficient64_299,
  OriginalRow227TriangleData0919.coefficient64_300,
  OriginalRow227TriangleData0919.coefficient64_301,
  OriginalRow227TriangleData0919.coefficient64_302,
  OriginalRow227TriangleData0919.coefficient64_303,
  OriginalRow227TriangleData0919.coefficient64_304,
  OriginalRow227TriangleData0919.coefficient64_305,
  OriginalRow227TriangleData0919.coefficient64_306,
  OriginalRow227TriangleData0919.coefficient64_307,
  OriginalRow227TriangleData0919.coefficient64_308,
  OriginalRow227TriangleData0919.coefficient64_309,
  OriginalRow227TriangleData0919.coefficient64_310,
  OriginalRow227TriangleData0919.coefficient64_311,
  OriginalRow227TriangleData0919.coefficient64_312,
  OriginalRow227TriangleData0919.coefficient64_313,
  OriginalRow227TriangleData0919.coefficient64_314,
  OriginalRow227TriangleData0919.coefficient64_315,
  OriginalRow227TriangleData0919.coefficient64_316,
  OriginalRow227TriangleData0919.coefficient64_317,
  OriginalRow227TriangleData0919.coefficient64_318
]

theorem values0919_size : values0919.size = 32 := rfl

def block0919 : ℕ → Option IntervalDyadic := segment 287 values0919

theorem block0919_domain : ExactDomain block0919 287 319 := by
  simpa only [values0919_size] using segment_domain 287 values0919

theorem block0919_get (i : Fin 32) :
    block0919 (287 + i.val) = some (values0919[i.val]'(by rw [values0919_size]; exact i.isLt)) := by
  exact segment_get 287 values0919 ⟨i.val, by rw [values0919_size]; exact i.isLt⟩

def values0920 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0920.coefficient64_319,
  OriginalRow227TriangleData0920.coefficient64_320,
  OriginalRow227TriangleData0920.coefficient64_321,
  OriginalRow227TriangleData0920.coefficient64_322,
  OriginalRow227TriangleData0920.coefficient64_323,
  OriginalRow227TriangleData0920.coefficient64_324,
  OriginalRow227TriangleData0920.coefficient64_325,
  OriginalRow227TriangleData0920.coefficient64_326,
  OriginalRow227TriangleData0920.coefficient64_327,
  OriginalRow227TriangleData0920.coefficient64_328,
  OriginalRow227TriangleData0920.coefficient64_329,
  OriginalRow227TriangleData0920.coefficient64_330,
  OriginalRow227TriangleData0920.coefficient64_331,
  OriginalRow227TriangleData0920.coefficient64_332,
  OriginalRow227TriangleData0920.coefficient64_333,
  OriginalRow227TriangleData0920.coefficient64_334,
  OriginalRow227TriangleData0920.coefficient64_335,
  OriginalRow227TriangleData0920.coefficient64_336,
  OriginalRow227TriangleData0920.coefficient64_337,
  OriginalRow227TriangleData0920.coefficient64_338,
  OriginalRow227TriangleData0920.coefficient64_339,
  OriginalRow227TriangleData0920.coefficient64_340,
  OriginalRow227TriangleData0920.coefficient64_341,
  OriginalRow227TriangleData0920.coefficient64_342,
  OriginalRow227TriangleData0920.coefficient64_343,
  OriginalRow227TriangleData0920.coefficient64_344,
  OriginalRow227TriangleData0920.coefficient64_345,
  OriginalRow227TriangleData0920.coefficient64_346,
  OriginalRow227TriangleData0920.coefficient64_347,
  OriginalRow227TriangleData0920.coefficient64_348,
  OriginalRow227TriangleData0920.coefficient64_349,
  OriginalRow227TriangleData0920.coefficient64_350
]

theorem values0920_size : values0920.size = 32 := rfl

def block0920 : ℕ → Option IntervalDyadic := segment 319 values0920

theorem block0920_domain : ExactDomain block0920 319 351 := by
  simpa only [values0920_size] using segment_domain 319 values0920

theorem block0920_get (i : Fin 32) :
    block0920 (319 + i.val) = some (values0920[i.val]'(by rw [values0920_size]; exact i.isLt)) := by
  exact segment_get 319 values0920 ⟨i.val, by rw [values0920_size]; exact i.isLt⟩

def values0921 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0921.coefficient64_351,
  OriginalRow227TriangleData0921.coefficient64_352,
  OriginalRow227TriangleData0921.coefficient64_353,
  OriginalRow227TriangleData0921.coefficient64_354,
  OriginalRow227TriangleData0921.coefficient64_355,
  OriginalRow227TriangleData0921.coefficient64_356,
  OriginalRow227TriangleData0921.coefficient64_357,
  OriginalRow227TriangleData0921.coefficient64_358,
  OriginalRow227TriangleData0921.coefficient64_359,
  OriginalRow227TriangleData0921.coefficient64_360,
  OriginalRow227TriangleData0921.coefficient64_361,
  OriginalRow227TriangleData0921.coefficient64_362,
  OriginalRow227TriangleData0921.coefficient64_363,
  OriginalRow227TriangleData0921.coefficient64_364,
  OriginalRow227TriangleData0921.coefficient64_365,
  OriginalRow227TriangleData0921.coefficient64_366,
  OriginalRow227TriangleData0921.coefficient64_367,
  OriginalRow227TriangleData0921.coefficient64_368,
  OriginalRow227TriangleData0921.coefficient64_369,
  OriginalRow227TriangleData0921.coefficient64_370,
  OriginalRow227TriangleData0921.coefficient64_371,
  OriginalRow227TriangleData0921.coefficient64_372,
  OriginalRow227TriangleData0921.coefficient64_373,
  OriginalRow227TriangleData0921.coefficient64_374,
  OriginalRow227TriangleData0921.coefficient64_375,
  OriginalRow227TriangleData0921.coefficient64_376,
  OriginalRow227TriangleData0921.coefficient64_377,
  OriginalRow227TriangleData0921.coefficient64_378,
  OriginalRow227TriangleData0921.coefficient64_379,
  OriginalRow227TriangleData0921.coefficient64_380,
  OriginalRow227TriangleData0921.coefficient64_381,
  OriginalRow227TriangleData0921.coefficient64_382
]

theorem values0921_size : values0921.size = 32 := rfl

def block0921 : ℕ → Option IntervalDyadic := segment 351 values0921

theorem block0921_domain : ExactDomain block0921 351 383 := by
  simpa only [values0921_size] using segment_domain 351 values0921

theorem block0921_get (i : Fin 32) :
    block0921 (351 + i.val) = some (values0921[i.val]'(by rw [values0921_size]; exact i.isLt)) := by
  exact segment_get 351 values0921 ⟨i.val, by rw [values0921_size]; exact i.isLt⟩

def values0922 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0922.coefficient64_383,
  OriginalRow227TriangleData0922.coefficient64_384,
  OriginalRow227TriangleData0922.coefficient64_385,
  OriginalRow227TriangleData0922.coefficient64_386,
  OriginalRow227TriangleData0922.coefficient64_387,
  OriginalRow227TriangleData0922.coefficient64_388,
  OriginalRow227TriangleData0922.coefficient64_389,
  OriginalRow227TriangleData0922.coefficient64_390,
  OriginalRow227TriangleData0922.coefficient64_391,
  OriginalRow227TriangleData0922.coefficient64_392,
  OriginalRow227TriangleData0922.coefficient64_393,
  OriginalRow227TriangleData0922.coefficient64_394,
  OriginalRow227TriangleData0922.coefficient64_395,
  OriginalRow227TriangleData0922.coefficient64_396,
  OriginalRow227TriangleData0922.coefficient64_397,
  OriginalRow227TriangleData0922.coefficient64_398,
  OriginalRow227TriangleData0922.coefficient64_399,
  OriginalRow227TriangleData0922.coefficient64_400,
  OriginalRow227TriangleData0922.coefficient64_401,
  OriginalRow227TriangleData0922.coefficient64_402,
  OriginalRow227TriangleData0922.coefficient64_403,
  OriginalRow227TriangleData0922.coefficient64_404,
  OriginalRow227TriangleData0922.coefficient64_405,
  OriginalRow227TriangleData0922.coefficient64_406,
  OriginalRow227TriangleData0922.coefficient64_407,
  OriginalRow227TriangleData0922.coefficient64_408,
  OriginalRow227TriangleData0922.coefficient64_409,
  OriginalRow227TriangleData0922.coefficient64_410,
  OriginalRow227TriangleData0922.coefficient64_411,
  OriginalRow227TriangleData0922.coefficient64_412,
  OriginalRow227TriangleData0922.coefficient64_413,
  OriginalRow227TriangleData0922.coefficient64_414
]

theorem values0922_size : values0922.size = 32 := rfl

def block0922 : ℕ → Option IntervalDyadic := segment 383 values0922

theorem block0922_domain : ExactDomain block0922 383 415 := by
  simpa only [values0922_size] using segment_domain 383 values0922

theorem block0922_get (i : Fin 32) :
    block0922 (383 + i.val) = some (values0922[i.val]'(by rw [values0922_size]; exact i.isLt)) := by
  exact segment_get 383 values0922 ⟨i.val, by rw [values0922_size]; exact i.isLt⟩

def values0923 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0923.coefficient64_415,
  OriginalRow227TriangleData0923.coefficient64_416,
  OriginalRow227TriangleData0923.coefficient64_417,
  OriginalRow227TriangleData0923.coefficient64_418,
  OriginalRow227TriangleData0923.coefficient64_419,
  OriginalRow227TriangleData0923.coefficient64_420,
  OriginalRow227TriangleData0923.coefficient64_421,
  OriginalRow227TriangleData0923.coefficient64_422,
  OriginalRow227TriangleData0923.coefficient64_423,
  OriginalRow227TriangleData0923.coefficient64_424,
  OriginalRow227TriangleData0923.coefficient64_425,
  OriginalRow227TriangleData0923.coefficient64_426,
  OriginalRow227TriangleData0923.coefficient64_427,
  OriginalRow227TriangleData0923.coefficient64_428,
  OriginalRow227TriangleData0923.coefficient64_429,
  OriginalRow227TriangleData0923.coefficient64_430,
  OriginalRow227TriangleData0923.coefficient64_431,
  OriginalRow227TriangleData0923.coefficient64_432,
  OriginalRow227TriangleData0923.coefficient64_433,
  OriginalRow227TriangleData0923.coefficient64_434,
  OriginalRow227TriangleData0923.coefficient64_435,
  OriginalRow227TriangleData0923.coefficient64_436,
  OriginalRow227TriangleData0923.coefficient64_437
]

theorem values0923_size : values0923.size = 23 := rfl

def block0923 : ℕ → Option IntervalDyadic := segment 415 values0923

theorem block0923_domain : ExactDomain block0923 415 438 := by
  simpa only [values0923_size] using segment_domain 415 values0923

theorem block0923_get (i : Fin 23) :
    block0923 (415 + i.val) = some (values0923[i.val]'(by rw [values0923_size]; exact i.isLt)) := by
  exact segment_get 415 values0923 ⟨i.val, by rw [values0923_size]; exact i.isLt⟩

def node0095_0159 : ℕ → Option IntervalDyadic := split 127 block0913 block0914

theorem node0095_0159_domain : ExactDomain node0095_0159 95 159 := by
  exact split_domain (by decide) (by decide) block0913_domain block0914_domain

def node0063_0159 : ℕ → Option IntervalDyadic := split 95 block0912 node0095_0159

theorem node0063_0159_domain : ExactDomain node0063_0159 63 159 := by
  exact split_domain (by decide) (by decide) block0912_domain node0095_0159_domain

def node0191_0255 : ℕ → Option IntervalDyadic := split 223 block0916 block0917

theorem node0191_0255_domain : ExactDomain node0191_0255 191 255 := by
  exact split_domain (by decide) (by decide) block0916_domain block0917_domain

def node0159_0255 : ℕ → Option IntervalDyadic := split 191 block0915 node0191_0255

theorem node0159_0255_domain : ExactDomain node0159_0255 159 255 := by
  exact split_domain (by decide) (by decide) block0915_domain node0191_0255_domain

def node0063_0255 : ℕ → Option IntervalDyadic := split 159 node0063_0159 node0159_0255

theorem node0063_0255_domain : ExactDomain node0063_0255 63 255 := by
  exact split_domain (by decide) (by decide) node0063_0159_domain node0159_0255_domain

def node0287_0351 : ℕ → Option IntervalDyadic := split 319 block0919 block0920

theorem node0287_0351_domain : ExactDomain node0287_0351 287 351 := by
  exact split_domain (by decide) (by decide) block0919_domain block0920_domain

def node0255_0351 : ℕ → Option IntervalDyadic := split 287 block0918 node0287_0351

theorem node0255_0351_domain : ExactDomain node0255_0351 255 351 := by
  exact split_domain (by decide) (by decide) block0918_domain node0287_0351_domain

def node0383_0438 : ℕ → Option IntervalDyadic := split 415 block0922 block0923

theorem node0383_0438_domain : ExactDomain node0383_0438 383 438 := by
  exact split_domain (by decide) (by decide) block0922_domain block0923_domain

def node0351_0438 : ℕ → Option IntervalDyadic := split 383 block0921 node0383_0438

theorem node0351_0438_domain : ExactDomain node0351_0438 351 438 := by
  exact split_domain (by decide) (by decide) block0921_domain node0383_0438_domain

def node0255_0438 : ℕ → Option IntervalDyadic := split 351 node0255_0351 node0351_0438

theorem node0255_0438_domain : ExactDomain node0255_0438 255 438 := by
  exact split_domain (by decide) (by decide) node0255_0351_domain node0351_0438_domain

def node0063_0438 : ℕ → Option IntervalDyadic := split 255 node0063_0255 node0255_0438

theorem node0063_0438_domain : ExactDomain node0063_0438 63 438 := by
  exact split_domain (by decide) (by decide) node0063_0255_domain node0255_0438_domain

def lookup : ℕ → Option IntervalDyadic := node0063_0438

theorem lookup_domain : ExactDomain lookup 63 438 :=
  node0063_0438_domain

theorem block0912_lookup (i : Fin 32) :
    lookup (63 + i.val) = some (values0912[i.val]'(by rw [values0912_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (63 + i.val) = _
  rw [node0063_0438, split_left 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0063_0255, split_left 159 node0063_0159 node0159_0255 (by omega)]
  rw [node0063_0159, split_left 95 block0912 node0095_0159 (by omega)]
  exact block0912_get i

theorem block0913_lookup (i : Fin 32) :
    lookup (95 + i.val) = some (values0913[i.val]'(by rw [values0913_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (95 + i.val) = _
  rw [node0063_0438, split_left 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0063_0255, split_left 159 node0063_0159 node0159_0255 (by omega)]
  rw [node0063_0159, split_right 95 block0912 node0095_0159 (by omega)]
  rw [node0095_0159, split_left 127 block0913 block0914 (by omega)]
  exact block0913_get i

theorem block0914_lookup (i : Fin 32) :
    lookup (127 + i.val) = some (values0914[i.val]'(by rw [values0914_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (127 + i.val) = _
  rw [node0063_0438, split_left 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0063_0255, split_left 159 node0063_0159 node0159_0255 (by omega)]
  rw [node0063_0159, split_right 95 block0912 node0095_0159 (by omega)]
  rw [node0095_0159, split_right 127 block0913 block0914 (by omega)]
  exact block0914_get i

theorem block0915_lookup (i : Fin 32) :
    lookup (159 + i.val) = some (values0915[i.val]'(by rw [values0915_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (159 + i.val) = _
  rw [node0063_0438, split_left 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0063_0255, split_right 159 node0063_0159 node0159_0255 (by omega)]
  rw [node0159_0255, split_left 191 block0915 node0191_0255 (by omega)]
  exact block0915_get i

theorem block0916_lookup (i : Fin 32) :
    lookup (191 + i.val) = some (values0916[i.val]'(by rw [values0916_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (191 + i.val) = _
  rw [node0063_0438, split_left 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0063_0255, split_right 159 node0063_0159 node0159_0255 (by omega)]
  rw [node0159_0255, split_right 191 block0915 node0191_0255 (by omega)]
  rw [node0191_0255, split_left 223 block0916 block0917 (by omega)]
  exact block0916_get i

theorem block0917_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values0917[i.val]'(by rw [values0917_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (223 + i.val) = _
  rw [node0063_0438, split_left 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0063_0255, split_right 159 node0063_0159 node0159_0255 (by omega)]
  rw [node0159_0255, split_right 191 block0915 node0191_0255 (by omega)]
  rw [node0191_0255, split_right 223 block0916 block0917 (by omega)]
  exact block0917_get i

theorem block0918_lookup (i : Fin 32) :
    lookup (255 + i.val) = some (values0918[i.val]'(by rw [values0918_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (255 + i.val) = _
  rw [node0063_0438, split_right 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0255_0438, split_left 351 node0255_0351 node0351_0438 (by omega)]
  rw [node0255_0351, split_left 287 block0918 node0287_0351 (by omega)]
  exact block0918_get i

theorem block0919_lookup (i : Fin 32) :
    lookup (287 + i.val) = some (values0919[i.val]'(by rw [values0919_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (287 + i.val) = _
  rw [node0063_0438, split_right 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0255_0438, split_left 351 node0255_0351 node0351_0438 (by omega)]
  rw [node0255_0351, split_right 287 block0918 node0287_0351 (by omega)]
  rw [node0287_0351, split_left 319 block0919 block0920 (by omega)]
  exact block0919_get i

theorem block0920_lookup (i : Fin 32) :
    lookup (319 + i.val) = some (values0920[i.val]'(by rw [values0920_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (319 + i.val) = _
  rw [node0063_0438, split_right 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0255_0438, split_left 351 node0255_0351 node0351_0438 (by omega)]
  rw [node0255_0351, split_right 287 block0918 node0287_0351 (by omega)]
  rw [node0287_0351, split_right 319 block0919 block0920 (by omega)]
  exact block0920_get i

theorem block0921_lookup (i : Fin 32) :
    lookup (351 + i.val) = some (values0921[i.val]'(by rw [values0921_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (351 + i.val) = _
  rw [node0063_0438, split_right 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0255_0438, split_right 351 node0255_0351 node0351_0438 (by omega)]
  rw [node0351_0438, split_left 383 block0921 node0383_0438 (by omega)]
  exact block0921_get i

theorem block0922_lookup (i : Fin 32) :
    lookup (383 + i.val) = some (values0922[i.val]'(by rw [values0922_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (383 + i.val) = _
  rw [node0063_0438, split_right 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0255_0438, split_right 351 node0255_0351 node0351_0438 (by omega)]
  rw [node0351_0438, split_right 383 block0921 node0383_0438 (by omega)]
  rw [node0383_0438, split_left 415 block0922 block0923 (by omega)]
  exact block0922_get i

theorem block0923_lookup (i : Fin 23) :
    lookup (415 + i.val) = some (values0923[i.val]'(by rw [values0923_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0063_0438 (415 + i.val) = _
  rw [node0063_0438, split_right 255 node0063_0255 node0255_0438 (by omega)]
  rw [node0255_0438, split_right 351 node0255_0351 node0351_0438 (by omega)]
  rw [node0351_0438, split_right 383 block0921 node0383_0438 (by omega)]
  rw [node0383_0438, split_right 415 block0922 block0923 (by omega)]
  exact block0923_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0912_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0912_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0913_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0913_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0914_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0914_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0915_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0915_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0916_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0916_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0917_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0917_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0918_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0918_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0919_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0919_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0920_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0920_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0921_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0921_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0922_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0922_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0923_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0923_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0912_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0913_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0914_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0915_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0916_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0917_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0918_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0919_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0920_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0921_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0922_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow064.block0923_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow064
