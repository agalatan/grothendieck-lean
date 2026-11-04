import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0838
import Grothe.UpperChaos.OriginalRow227TriangleData0839
import Grothe.UpperChaos.OriginalRow227TriangleData0840
import Grothe.UpperChaos.OriginalRow227TriangleData0841
import Grothe.UpperChaos.OriginalRow227TriangleData0842
import Grothe.UpperChaos.OriginalRow227TriangleData0843
import Grothe.UpperChaos.OriginalRow227TriangleData0844
import Grothe.UpperChaos.OriginalRow227TriangleData0845
import Grothe.UpperChaos.OriginalRow227TriangleData0846
import Grothe.UpperChaos.OriginalRow227TriangleData0847
import Grothe.UpperChaos.OriginalRow227TriangleData0848
import Grothe.UpperChaos.OriginalRow227TriangleData0849
import Grothe.UpperChaos.OriginalRow227TriangleData0850

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow058

open ConditionalTableLookup

def values0838 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0838.coefficient58_57,
  OriginalRow227TriangleData0838.coefficient58_58,
  OriginalRow227TriangleData0838.coefficient58_59,
  OriginalRow227TriangleData0838.coefficient58_60,
  OriginalRow227TriangleData0838.coefficient58_61,
  OriginalRow227TriangleData0838.coefficient58_62,
  OriginalRow227TriangleData0838.coefficient58_63,
  OriginalRow227TriangleData0838.coefficient58_64,
  OriginalRow227TriangleData0838.coefficient58_65,
  OriginalRow227TriangleData0838.coefficient58_66,
  OriginalRow227TriangleData0838.coefficient58_67,
  OriginalRow227TriangleData0838.coefficient58_68,
  OriginalRow227TriangleData0838.coefficient58_69,
  OriginalRow227TriangleData0838.coefficient58_70,
  OriginalRow227TriangleData0838.coefficient58_71,
  OriginalRow227TriangleData0838.coefficient58_72,
  OriginalRow227TriangleData0838.coefficient58_73,
  OriginalRow227TriangleData0838.coefficient58_74,
  OriginalRow227TriangleData0838.coefficient58_75,
  OriginalRow227TriangleData0838.coefficient58_76,
  OriginalRow227TriangleData0838.coefficient58_77,
  OriginalRow227TriangleData0838.coefficient58_78,
  OriginalRow227TriangleData0838.coefficient58_79,
  OriginalRow227TriangleData0838.coefficient58_80,
  OriginalRow227TriangleData0838.coefficient58_81,
  OriginalRow227TriangleData0838.coefficient58_82,
  OriginalRow227TriangleData0838.coefficient58_83,
  OriginalRow227TriangleData0838.coefficient58_84,
  OriginalRow227TriangleData0838.coefficient58_85,
  OriginalRow227TriangleData0838.coefficient58_86,
  OriginalRow227TriangleData0838.coefficient58_87,
  OriginalRow227TriangleData0838.coefficient58_88
]

theorem values0838_size : values0838.size = 32 := rfl

def block0838 : ℕ → Option IntervalDyadic := segment 57 values0838

theorem block0838_domain : ExactDomain block0838 57 89 := by
  simpa only [values0838_size] using segment_domain 57 values0838

theorem block0838_get (i : Fin 32) :
    block0838 (57 + i.val) = some (values0838[i.val]'(by rw [values0838_size]; exact i.isLt)) := by
  exact segment_get 57 values0838 ⟨i.val, by rw [values0838_size]; exact i.isLt⟩

def values0839 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0839.coefficient58_89,
  OriginalRow227TriangleData0839.coefficient58_90,
  OriginalRow227TriangleData0839.coefficient58_91,
  OriginalRow227TriangleData0839.coefficient58_92,
  OriginalRow227TriangleData0839.coefficient58_93,
  OriginalRow227TriangleData0839.coefficient58_94,
  OriginalRow227TriangleData0839.coefficient58_95,
  OriginalRow227TriangleData0839.coefficient58_96,
  OriginalRow227TriangleData0839.coefficient58_97,
  OriginalRow227TriangleData0839.coefficient58_98,
  OriginalRow227TriangleData0839.coefficient58_99,
  OriginalRow227TriangleData0839.coefficient58_100,
  OriginalRow227TriangleData0839.coefficient58_101,
  OriginalRow227TriangleData0839.coefficient58_102,
  OriginalRow227TriangleData0839.coefficient58_103,
  OriginalRow227TriangleData0839.coefficient58_104,
  OriginalRow227TriangleData0839.coefficient58_105,
  OriginalRow227TriangleData0839.coefficient58_106,
  OriginalRow227TriangleData0839.coefficient58_107,
  OriginalRow227TriangleData0839.coefficient58_108,
  OriginalRow227TriangleData0839.coefficient58_109,
  OriginalRow227TriangleData0839.coefficient58_110,
  OriginalRow227TriangleData0839.coefficient58_111,
  OriginalRow227TriangleData0839.coefficient58_112,
  OriginalRow227TriangleData0839.coefficient58_113,
  OriginalRow227TriangleData0839.coefficient58_114,
  OriginalRow227TriangleData0839.coefficient58_115,
  OriginalRow227TriangleData0839.coefficient58_116,
  OriginalRow227TriangleData0839.coefficient58_117,
  OriginalRow227TriangleData0839.coefficient58_118,
  OriginalRow227TriangleData0839.coefficient58_119,
  OriginalRow227TriangleData0839.coefficient58_120
]

theorem values0839_size : values0839.size = 32 := rfl

def block0839 : ℕ → Option IntervalDyadic := segment 89 values0839

theorem block0839_domain : ExactDomain block0839 89 121 := by
  simpa only [values0839_size] using segment_domain 89 values0839

theorem block0839_get (i : Fin 32) :
    block0839 (89 + i.val) = some (values0839[i.val]'(by rw [values0839_size]; exact i.isLt)) := by
  exact segment_get 89 values0839 ⟨i.val, by rw [values0839_size]; exact i.isLt⟩

def values0840 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0840.coefficient58_121,
  OriginalRow227TriangleData0840.coefficient58_122,
  OriginalRow227TriangleData0840.coefficient58_123,
  OriginalRow227TriangleData0840.coefficient58_124,
  OriginalRow227TriangleData0840.coefficient58_125,
  OriginalRow227TriangleData0840.coefficient58_126,
  OriginalRow227TriangleData0840.coefficient58_127,
  OriginalRow227TriangleData0840.coefficient58_128,
  OriginalRow227TriangleData0840.coefficient58_129,
  OriginalRow227TriangleData0840.coefficient58_130,
  OriginalRow227TriangleData0840.coefficient58_131,
  OriginalRow227TriangleData0840.coefficient58_132,
  OriginalRow227TriangleData0840.coefficient58_133,
  OriginalRow227TriangleData0840.coefficient58_134,
  OriginalRow227TriangleData0840.coefficient58_135,
  OriginalRow227TriangleData0840.coefficient58_136,
  OriginalRow227TriangleData0840.coefficient58_137,
  OriginalRow227TriangleData0840.coefficient58_138,
  OriginalRow227TriangleData0840.coefficient58_139,
  OriginalRow227TriangleData0840.coefficient58_140,
  OriginalRow227TriangleData0840.coefficient58_141,
  OriginalRow227TriangleData0840.coefficient58_142,
  OriginalRow227TriangleData0840.coefficient58_143,
  OriginalRow227TriangleData0840.coefficient58_144,
  OriginalRow227TriangleData0840.coefficient58_145,
  OriginalRow227TriangleData0840.coefficient58_146,
  OriginalRow227TriangleData0840.coefficient58_147,
  OriginalRow227TriangleData0840.coefficient58_148,
  OriginalRow227TriangleData0840.coefficient58_149,
  OriginalRow227TriangleData0840.coefficient58_150,
  OriginalRow227TriangleData0840.coefficient58_151,
  OriginalRow227TriangleData0840.coefficient58_152
]

theorem values0840_size : values0840.size = 32 := rfl

def block0840 : ℕ → Option IntervalDyadic := segment 121 values0840

theorem block0840_domain : ExactDomain block0840 121 153 := by
  simpa only [values0840_size] using segment_domain 121 values0840

theorem block0840_get (i : Fin 32) :
    block0840 (121 + i.val) = some (values0840[i.val]'(by rw [values0840_size]; exact i.isLt)) := by
  exact segment_get 121 values0840 ⟨i.val, by rw [values0840_size]; exact i.isLt⟩

def values0841 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0841.coefficient58_153,
  OriginalRow227TriangleData0841.coefficient58_154,
  OriginalRow227TriangleData0841.coefficient58_155,
  OriginalRow227TriangleData0841.coefficient58_156,
  OriginalRow227TriangleData0841.coefficient58_157,
  OriginalRow227TriangleData0841.coefficient58_158,
  OriginalRow227TriangleData0841.coefficient58_159,
  OriginalRow227TriangleData0841.coefficient58_160,
  OriginalRow227TriangleData0841.coefficient58_161,
  OriginalRow227TriangleData0841.coefficient58_162,
  OriginalRow227TriangleData0841.coefficient58_163,
  OriginalRow227TriangleData0841.coefficient58_164,
  OriginalRow227TriangleData0841.coefficient58_165,
  OriginalRow227TriangleData0841.coefficient58_166,
  OriginalRow227TriangleData0841.coefficient58_167,
  OriginalRow227TriangleData0841.coefficient58_168,
  OriginalRow227TriangleData0841.coefficient58_169,
  OriginalRow227TriangleData0841.coefficient58_170,
  OriginalRow227TriangleData0841.coefficient58_171,
  OriginalRow227TriangleData0841.coefficient58_172,
  OriginalRow227TriangleData0841.coefficient58_173,
  OriginalRow227TriangleData0841.coefficient58_174,
  OriginalRow227TriangleData0841.coefficient58_175,
  OriginalRow227TriangleData0841.coefficient58_176,
  OriginalRow227TriangleData0841.coefficient58_177,
  OriginalRow227TriangleData0841.coefficient58_178,
  OriginalRow227TriangleData0841.coefficient58_179,
  OriginalRow227TriangleData0841.coefficient58_180,
  OriginalRow227TriangleData0841.coefficient58_181,
  OriginalRow227TriangleData0841.coefficient58_182,
  OriginalRow227TriangleData0841.coefficient58_183,
  OriginalRow227TriangleData0841.coefficient58_184
]

theorem values0841_size : values0841.size = 32 := rfl

def block0841 : ℕ → Option IntervalDyadic := segment 153 values0841

theorem block0841_domain : ExactDomain block0841 153 185 := by
  simpa only [values0841_size] using segment_domain 153 values0841

theorem block0841_get (i : Fin 32) :
    block0841 (153 + i.val) = some (values0841[i.val]'(by rw [values0841_size]; exact i.isLt)) := by
  exact segment_get 153 values0841 ⟨i.val, by rw [values0841_size]; exact i.isLt⟩

def values0842 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0842.coefficient58_185,
  OriginalRow227TriangleData0842.coefficient58_186,
  OriginalRow227TriangleData0842.coefficient58_187,
  OriginalRow227TriangleData0842.coefficient58_188,
  OriginalRow227TriangleData0842.coefficient58_189,
  OriginalRow227TriangleData0842.coefficient58_190,
  OriginalRow227TriangleData0842.coefficient58_191,
  OriginalRow227TriangleData0842.coefficient58_192,
  OriginalRow227TriangleData0842.coefficient58_193,
  OriginalRow227TriangleData0842.coefficient58_194,
  OriginalRow227TriangleData0842.coefficient58_195,
  OriginalRow227TriangleData0842.coefficient58_196,
  OriginalRow227TriangleData0842.coefficient58_197,
  OriginalRow227TriangleData0842.coefficient58_198,
  OriginalRow227TriangleData0842.coefficient58_199,
  OriginalRow227TriangleData0842.coefficient58_200,
  OriginalRow227TriangleData0842.coefficient58_201,
  OriginalRow227TriangleData0842.coefficient58_202,
  OriginalRow227TriangleData0842.coefficient58_203,
  OriginalRow227TriangleData0842.coefficient58_204,
  OriginalRow227TriangleData0842.coefficient58_205,
  OriginalRow227TriangleData0842.coefficient58_206,
  OriginalRow227TriangleData0842.coefficient58_207,
  OriginalRow227TriangleData0842.coefficient58_208,
  OriginalRow227TriangleData0842.coefficient58_209,
  OriginalRow227TriangleData0842.coefficient58_210,
  OriginalRow227TriangleData0842.coefficient58_211,
  OriginalRow227TriangleData0842.coefficient58_212,
  OriginalRow227TriangleData0842.coefficient58_213,
  OriginalRow227TriangleData0842.coefficient58_214,
  OriginalRow227TriangleData0842.coefficient58_215,
  OriginalRow227TriangleData0842.coefficient58_216
]

theorem values0842_size : values0842.size = 32 := rfl

def block0842 : ℕ → Option IntervalDyadic := segment 185 values0842

theorem block0842_domain : ExactDomain block0842 185 217 := by
  simpa only [values0842_size] using segment_domain 185 values0842

theorem block0842_get (i : Fin 32) :
    block0842 (185 + i.val) = some (values0842[i.val]'(by rw [values0842_size]; exact i.isLt)) := by
  exact segment_get 185 values0842 ⟨i.val, by rw [values0842_size]; exact i.isLt⟩

def values0843 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0843.coefficient58_217,
  OriginalRow227TriangleData0843.coefficient58_218,
  OriginalRow227TriangleData0843.coefficient58_219,
  OriginalRow227TriangleData0843.coefficient58_220,
  OriginalRow227TriangleData0843.coefficient58_221,
  OriginalRow227TriangleData0843.coefficient58_222,
  OriginalRow227TriangleData0843.coefficient58_223,
  OriginalRow227TriangleData0843.coefficient58_224,
  OriginalRow227TriangleData0843.coefficient58_225,
  OriginalRow227TriangleData0843.coefficient58_226,
  OriginalRow227TriangleData0843.coefficient58_227,
  OriginalRow227TriangleData0843.coefficient58_228,
  OriginalRow227TriangleData0843.coefficient58_229,
  OriginalRow227TriangleData0843.coefficient58_230,
  OriginalRow227TriangleData0843.coefficient58_231,
  OriginalRow227TriangleData0843.coefficient58_232,
  OriginalRow227TriangleData0843.coefficient58_233,
  OriginalRow227TriangleData0843.coefficient58_234,
  OriginalRow227TriangleData0843.coefficient58_235,
  OriginalRow227TriangleData0843.coefficient58_236,
  OriginalRow227TriangleData0843.coefficient58_237,
  OriginalRow227TriangleData0843.coefficient58_238,
  OriginalRow227TriangleData0843.coefficient58_239,
  OriginalRow227TriangleData0843.coefficient58_240,
  OriginalRow227TriangleData0843.coefficient58_241,
  OriginalRow227TriangleData0843.coefficient58_242,
  OriginalRow227TriangleData0843.coefficient58_243,
  OriginalRow227TriangleData0843.coefficient58_244,
  OriginalRow227TriangleData0843.coefficient58_245,
  OriginalRow227TriangleData0843.coefficient58_246,
  OriginalRow227TriangleData0843.coefficient58_247,
  OriginalRow227TriangleData0843.coefficient58_248
]

theorem values0843_size : values0843.size = 32 := rfl

def block0843 : ℕ → Option IntervalDyadic := segment 217 values0843

theorem block0843_domain : ExactDomain block0843 217 249 := by
  simpa only [values0843_size] using segment_domain 217 values0843

theorem block0843_get (i : Fin 32) :
    block0843 (217 + i.val) = some (values0843[i.val]'(by rw [values0843_size]; exact i.isLt)) := by
  exact segment_get 217 values0843 ⟨i.val, by rw [values0843_size]; exact i.isLt⟩

def values0844 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0844.coefficient58_249,
  OriginalRow227TriangleData0844.coefficient58_250,
  OriginalRow227TriangleData0844.coefficient58_251,
  OriginalRow227TriangleData0844.coefficient58_252,
  OriginalRow227TriangleData0844.coefficient58_253,
  OriginalRow227TriangleData0844.coefficient58_254,
  OriginalRow227TriangleData0844.coefficient58_255,
  OriginalRow227TriangleData0844.coefficient58_256,
  OriginalRow227TriangleData0844.coefficient58_257,
  OriginalRow227TriangleData0844.coefficient58_258,
  OriginalRow227TriangleData0844.coefficient58_259,
  OriginalRow227TriangleData0844.coefficient58_260,
  OriginalRow227TriangleData0844.coefficient58_261,
  OriginalRow227TriangleData0844.coefficient58_262,
  OriginalRow227TriangleData0844.coefficient58_263,
  OriginalRow227TriangleData0844.coefficient58_264,
  OriginalRow227TriangleData0844.coefficient58_265,
  OriginalRow227TriangleData0844.coefficient58_266,
  OriginalRow227TriangleData0844.coefficient58_267,
  OriginalRow227TriangleData0844.coefficient58_268,
  OriginalRow227TriangleData0844.coefficient58_269,
  OriginalRow227TriangleData0844.coefficient58_270,
  OriginalRow227TriangleData0844.coefficient58_271,
  OriginalRow227TriangleData0844.coefficient58_272,
  OriginalRow227TriangleData0844.coefficient58_273,
  OriginalRow227TriangleData0844.coefficient58_274,
  OriginalRow227TriangleData0844.coefficient58_275,
  OriginalRow227TriangleData0844.coefficient58_276,
  OriginalRow227TriangleData0844.coefficient58_277,
  OriginalRow227TriangleData0844.coefficient58_278,
  OriginalRow227TriangleData0844.coefficient58_279,
  OriginalRow227TriangleData0844.coefficient58_280
]

theorem values0844_size : values0844.size = 32 := rfl

def block0844 : ℕ → Option IntervalDyadic := segment 249 values0844

theorem block0844_domain : ExactDomain block0844 249 281 := by
  simpa only [values0844_size] using segment_domain 249 values0844

theorem block0844_get (i : Fin 32) :
    block0844 (249 + i.val) = some (values0844[i.val]'(by rw [values0844_size]; exact i.isLt)) := by
  exact segment_get 249 values0844 ⟨i.val, by rw [values0844_size]; exact i.isLt⟩

def values0845 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0845.coefficient58_281,
  OriginalRow227TriangleData0845.coefficient58_282,
  OriginalRow227TriangleData0845.coefficient58_283,
  OriginalRow227TriangleData0845.coefficient58_284,
  OriginalRow227TriangleData0845.coefficient58_285,
  OriginalRow227TriangleData0845.coefficient58_286,
  OriginalRow227TriangleData0845.coefficient58_287,
  OriginalRow227TriangleData0845.coefficient58_288,
  OriginalRow227TriangleData0845.coefficient58_289,
  OriginalRow227TriangleData0845.coefficient58_290,
  OriginalRow227TriangleData0845.coefficient58_291,
  OriginalRow227TriangleData0845.coefficient58_292,
  OriginalRow227TriangleData0845.coefficient58_293,
  OriginalRow227TriangleData0845.coefficient58_294,
  OriginalRow227TriangleData0845.coefficient58_295,
  OriginalRow227TriangleData0845.coefficient58_296,
  OriginalRow227TriangleData0845.coefficient58_297,
  OriginalRow227TriangleData0845.coefficient58_298,
  OriginalRow227TriangleData0845.coefficient58_299,
  OriginalRow227TriangleData0845.coefficient58_300,
  OriginalRow227TriangleData0845.coefficient58_301,
  OriginalRow227TriangleData0845.coefficient58_302,
  OriginalRow227TriangleData0845.coefficient58_303,
  OriginalRow227TriangleData0845.coefficient58_304,
  OriginalRow227TriangleData0845.coefficient58_305,
  OriginalRow227TriangleData0845.coefficient58_306,
  OriginalRow227TriangleData0845.coefficient58_307,
  OriginalRow227TriangleData0845.coefficient58_308,
  OriginalRow227TriangleData0845.coefficient58_309,
  OriginalRow227TriangleData0845.coefficient58_310,
  OriginalRow227TriangleData0845.coefficient58_311,
  OriginalRow227TriangleData0845.coefficient58_312
]

theorem values0845_size : values0845.size = 32 := rfl

def block0845 : ℕ → Option IntervalDyadic := segment 281 values0845

theorem block0845_domain : ExactDomain block0845 281 313 := by
  simpa only [values0845_size] using segment_domain 281 values0845

theorem block0845_get (i : Fin 32) :
    block0845 (281 + i.val) = some (values0845[i.val]'(by rw [values0845_size]; exact i.isLt)) := by
  exact segment_get 281 values0845 ⟨i.val, by rw [values0845_size]; exact i.isLt⟩

def values0846 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0846.coefficient58_313,
  OriginalRow227TriangleData0846.coefficient58_314,
  OriginalRow227TriangleData0846.coefficient58_315,
  OriginalRow227TriangleData0846.coefficient58_316,
  OriginalRow227TriangleData0846.coefficient58_317,
  OriginalRow227TriangleData0846.coefficient58_318,
  OriginalRow227TriangleData0846.coefficient58_319,
  OriginalRow227TriangleData0846.coefficient58_320,
  OriginalRow227TriangleData0846.coefficient58_321,
  OriginalRow227TriangleData0846.coefficient58_322,
  OriginalRow227TriangleData0846.coefficient58_323,
  OriginalRow227TriangleData0846.coefficient58_324,
  OriginalRow227TriangleData0846.coefficient58_325,
  OriginalRow227TriangleData0846.coefficient58_326,
  OriginalRow227TriangleData0846.coefficient58_327,
  OriginalRow227TriangleData0846.coefficient58_328,
  OriginalRow227TriangleData0846.coefficient58_329,
  OriginalRow227TriangleData0846.coefficient58_330,
  OriginalRow227TriangleData0846.coefficient58_331,
  OriginalRow227TriangleData0846.coefficient58_332,
  OriginalRow227TriangleData0846.coefficient58_333,
  OriginalRow227TriangleData0846.coefficient58_334,
  OriginalRow227TriangleData0846.coefficient58_335,
  OriginalRow227TriangleData0846.coefficient58_336,
  OriginalRow227TriangleData0846.coefficient58_337,
  OriginalRow227TriangleData0846.coefficient58_338,
  OriginalRow227TriangleData0846.coefficient58_339,
  OriginalRow227TriangleData0846.coefficient58_340,
  OriginalRow227TriangleData0846.coefficient58_341,
  OriginalRow227TriangleData0846.coefficient58_342,
  OriginalRow227TriangleData0846.coefficient58_343,
  OriginalRow227TriangleData0846.coefficient58_344
]

theorem values0846_size : values0846.size = 32 := rfl

def block0846 : ℕ → Option IntervalDyadic := segment 313 values0846

theorem block0846_domain : ExactDomain block0846 313 345 := by
  simpa only [values0846_size] using segment_domain 313 values0846

theorem block0846_get (i : Fin 32) :
    block0846 (313 + i.val) = some (values0846[i.val]'(by rw [values0846_size]; exact i.isLt)) := by
  exact segment_get 313 values0846 ⟨i.val, by rw [values0846_size]; exact i.isLt⟩

def values0847 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0847.coefficient58_345,
  OriginalRow227TriangleData0847.coefficient58_346,
  OriginalRow227TriangleData0847.coefficient58_347,
  OriginalRow227TriangleData0847.coefficient58_348,
  OriginalRow227TriangleData0847.coefficient58_349,
  OriginalRow227TriangleData0847.coefficient58_350,
  OriginalRow227TriangleData0847.coefficient58_351,
  OriginalRow227TriangleData0847.coefficient58_352,
  OriginalRow227TriangleData0847.coefficient58_353,
  OriginalRow227TriangleData0847.coefficient58_354,
  OriginalRow227TriangleData0847.coefficient58_355,
  OriginalRow227TriangleData0847.coefficient58_356,
  OriginalRow227TriangleData0847.coefficient58_357,
  OriginalRow227TriangleData0847.coefficient58_358,
  OriginalRow227TriangleData0847.coefficient58_359,
  OriginalRow227TriangleData0847.coefficient58_360,
  OriginalRow227TriangleData0847.coefficient58_361,
  OriginalRow227TriangleData0847.coefficient58_362,
  OriginalRow227TriangleData0847.coefficient58_363,
  OriginalRow227TriangleData0847.coefficient58_364,
  OriginalRow227TriangleData0847.coefficient58_365,
  OriginalRow227TriangleData0847.coefficient58_366,
  OriginalRow227TriangleData0847.coefficient58_367,
  OriginalRow227TriangleData0847.coefficient58_368,
  OriginalRow227TriangleData0847.coefficient58_369,
  OriginalRow227TriangleData0847.coefficient58_370,
  OriginalRow227TriangleData0847.coefficient58_371,
  OriginalRow227TriangleData0847.coefficient58_372,
  OriginalRow227TriangleData0847.coefficient58_373,
  OriginalRow227TriangleData0847.coefficient58_374,
  OriginalRow227TriangleData0847.coefficient58_375,
  OriginalRow227TriangleData0847.coefficient58_376
]

theorem values0847_size : values0847.size = 32 := rfl

def block0847 : ℕ → Option IntervalDyadic := segment 345 values0847

theorem block0847_domain : ExactDomain block0847 345 377 := by
  simpa only [values0847_size] using segment_domain 345 values0847

theorem block0847_get (i : Fin 32) :
    block0847 (345 + i.val) = some (values0847[i.val]'(by rw [values0847_size]; exact i.isLt)) := by
  exact segment_get 345 values0847 ⟨i.val, by rw [values0847_size]; exact i.isLt⟩

def values0848 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0848.coefficient58_377,
  OriginalRow227TriangleData0848.coefficient58_378,
  OriginalRow227TriangleData0848.coefficient58_379,
  OriginalRow227TriangleData0848.coefficient58_380,
  OriginalRow227TriangleData0848.coefficient58_381,
  OriginalRow227TriangleData0848.coefficient58_382,
  OriginalRow227TriangleData0848.coefficient58_383,
  OriginalRow227TriangleData0848.coefficient58_384,
  OriginalRow227TriangleData0848.coefficient58_385,
  OriginalRow227TriangleData0848.coefficient58_386,
  OriginalRow227TriangleData0848.coefficient58_387,
  OriginalRow227TriangleData0848.coefficient58_388,
  OriginalRow227TriangleData0848.coefficient58_389,
  OriginalRow227TriangleData0848.coefficient58_390,
  OriginalRow227TriangleData0848.coefficient58_391,
  OriginalRow227TriangleData0848.coefficient58_392,
  OriginalRow227TriangleData0848.coefficient58_393,
  OriginalRow227TriangleData0848.coefficient58_394,
  OriginalRow227TriangleData0848.coefficient58_395,
  OriginalRow227TriangleData0848.coefficient58_396,
  OriginalRow227TriangleData0848.coefficient58_397,
  OriginalRow227TriangleData0848.coefficient58_398,
  OriginalRow227TriangleData0848.coefficient58_399,
  OriginalRow227TriangleData0848.coefficient58_400,
  OriginalRow227TriangleData0848.coefficient58_401,
  OriginalRow227TriangleData0848.coefficient58_402,
  OriginalRow227TriangleData0848.coefficient58_403,
  OriginalRow227TriangleData0848.coefficient58_404,
  OriginalRow227TriangleData0848.coefficient58_405,
  OriginalRow227TriangleData0848.coefficient58_406,
  OriginalRow227TriangleData0848.coefficient58_407,
  OriginalRow227TriangleData0848.coefficient58_408
]

theorem values0848_size : values0848.size = 32 := rfl

def block0848 : ℕ → Option IntervalDyadic := segment 377 values0848

theorem block0848_domain : ExactDomain block0848 377 409 := by
  simpa only [values0848_size] using segment_domain 377 values0848

theorem block0848_get (i : Fin 32) :
    block0848 (377 + i.val) = some (values0848[i.val]'(by rw [values0848_size]; exact i.isLt)) := by
  exact segment_get 377 values0848 ⟨i.val, by rw [values0848_size]; exact i.isLt⟩

def values0849 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0849.coefficient58_409,
  OriginalRow227TriangleData0849.coefficient58_410,
  OriginalRow227TriangleData0849.coefficient58_411,
  OriginalRow227TriangleData0849.coefficient58_412,
  OriginalRow227TriangleData0849.coefficient58_413,
  OriginalRow227TriangleData0849.coefficient58_414,
  OriginalRow227TriangleData0849.coefficient58_415,
  OriginalRow227TriangleData0849.coefficient58_416,
  OriginalRow227TriangleData0849.coefficient58_417,
  OriginalRow227TriangleData0849.coefficient58_418,
  OriginalRow227TriangleData0849.coefficient58_419,
  OriginalRow227TriangleData0849.coefficient58_420,
  OriginalRow227TriangleData0849.coefficient58_421,
  OriginalRow227TriangleData0849.coefficient58_422,
  OriginalRow227TriangleData0849.coefficient58_423,
  OriginalRow227TriangleData0849.coefficient58_424,
  OriginalRow227TriangleData0849.coefficient58_425,
  OriginalRow227TriangleData0849.coefficient58_426,
  OriginalRow227TriangleData0849.coefficient58_427,
  OriginalRow227TriangleData0849.coefficient58_428,
  OriginalRow227TriangleData0849.coefficient58_429,
  OriginalRow227TriangleData0849.coefficient58_430,
  OriginalRow227TriangleData0849.coefficient58_431,
  OriginalRow227TriangleData0849.coefficient58_432,
  OriginalRow227TriangleData0849.coefficient58_433,
  OriginalRow227TriangleData0849.coefficient58_434,
  OriginalRow227TriangleData0849.coefficient58_435,
  OriginalRow227TriangleData0849.coefficient58_436,
  OriginalRow227TriangleData0849.coefficient58_437,
  OriginalRow227TriangleData0849.coefficient58_438,
  OriginalRow227TriangleData0849.coefficient58_439,
  OriginalRow227TriangleData0849.coefficient58_440
]

theorem values0849_size : values0849.size = 32 := rfl

def block0849 : ℕ → Option IntervalDyadic := segment 409 values0849

theorem block0849_domain : ExactDomain block0849 409 441 := by
  simpa only [values0849_size] using segment_domain 409 values0849

theorem block0849_get (i : Fin 32) :
    block0849 (409 + i.val) = some (values0849[i.val]'(by rw [values0849_size]; exact i.isLt)) := by
  exact segment_get 409 values0849 ⟨i.val, by rw [values0849_size]; exact i.isLt⟩

def values0850 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0850.coefficient58_441,
  OriginalRow227TriangleData0850.coefficient58_442,
  OriginalRow227TriangleData0850.coefficient58_443
]

theorem values0850_size : values0850.size = 3 := rfl

def block0850 : ℕ → Option IntervalDyadic := segment 441 values0850

theorem block0850_domain : ExactDomain block0850 441 444 := by
  simpa only [values0850_size] using segment_domain 441 values0850

theorem block0850_get (i : Fin 3) :
    block0850 (441 + i.val) = some (values0850[i.val]'(by rw [values0850_size]; exact i.isLt)) := by
  exact segment_get 441 values0850 ⟨i.val, by rw [values0850_size]; exact i.isLt⟩

def node0089_0153 : ℕ → Option IntervalDyadic := split 121 block0839 block0840

theorem node0089_0153_domain : ExactDomain node0089_0153 89 153 := by
  exact split_domain (by decide) (by decide) block0839_domain block0840_domain

def node0057_0153 : ℕ → Option IntervalDyadic := split 89 block0838 node0089_0153

theorem node0057_0153_domain : ExactDomain node0057_0153 57 153 := by
  exact split_domain (by decide) (by decide) block0838_domain node0089_0153_domain

def node0185_0249 : ℕ → Option IntervalDyadic := split 217 block0842 block0843

theorem node0185_0249_domain : ExactDomain node0185_0249 185 249 := by
  exact split_domain (by decide) (by decide) block0842_domain block0843_domain

def node0153_0249 : ℕ → Option IntervalDyadic := split 185 block0841 node0185_0249

theorem node0153_0249_domain : ExactDomain node0153_0249 153 249 := by
  exact split_domain (by decide) (by decide) block0841_domain node0185_0249_domain

def node0057_0249 : ℕ → Option IntervalDyadic := split 153 node0057_0153 node0153_0249

theorem node0057_0249_domain : ExactDomain node0057_0249 57 249 := by
  exact split_domain (by decide) (by decide) node0057_0153_domain node0153_0249_domain

def node0281_0345 : ℕ → Option IntervalDyadic := split 313 block0845 block0846

theorem node0281_0345_domain : ExactDomain node0281_0345 281 345 := by
  exact split_domain (by decide) (by decide) block0845_domain block0846_domain

def node0249_0345 : ℕ → Option IntervalDyadic := split 281 block0844 node0281_0345

theorem node0249_0345_domain : ExactDomain node0249_0345 249 345 := by
  exact split_domain (by decide) (by decide) block0844_domain node0281_0345_domain

def node0345_0409 : ℕ → Option IntervalDyadic := split 377 block0847 block0848

theorem node0345_0409_domain : ExactDomain node0345_0409 345 409 := by
  exact split_domain (by decide) (by decide) block0847_domain block0848_domain

def node0409_0444 : ℕ → Option IntervalDyadic := split 441 block0849 block0850

theorem node0409_0444_domain : ExactDomain node0409_0444 409 444 := by
  exact split_domain (by decide) (by decide) block0849_domain block0850_domain

def node0345_0444 : ℕ → Option IntervalDyadic := split 409 node0345_0409 node0409_0444

theorem node0345_0444_domain : ExactDomain node0345_0444 345 444 := by
  exact split_domain (by decide) (by decide) node0345_0409_domain node0409_0444_domain

def node0249_0444 : ℕ → Option IntervalDyadic := split 345 node0249_0345 node0345_0444

theorem node0249_0444_domain : ExactDomain node0249_0444 249 444 := by
  exact split_domain (by decide) (by decide) node0249_0345_domain node0345_0444_domain

def node0057_0444 : ℕ → Option IntervalDyadic := split 249 node0057_0249 node0249_0444

theorem node0057_0444_domain : ExactDomain node0057_0444 57 444 := by
  exact split_domain (by decide) (by decide) node0057_0249_domain node0249_0444_domain

def lookup : ℕ → Option IntervalDyadic := node0057_0444

theorem lookup_domain : ExactDomain lookup 57 444 :=
  node0057_0444_domain

theorem block0838_lookup (i : Fin 32) :
    lookup (57 + i.val) = some (values0838[i.val]'(by rw [values0838_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (57 + i.val) = _
  rw [node0057_0444, split_left 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0057_0249, split_left 153 node0057_0153 node0153_0249 (by omega)]
  rw [node0057_0153, split_left 89 block0838 node0089_0153 (by omega)]
  exact block0838_get i

theorem block0839_lookup (i : Fin 32) :
    lookup (89 + i.val) = some (values0839[i.val]'(by rw [values0839_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (89 + i.val) = _
  rw [node0057_0444, split_left 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0057_0249, split_left 153 node0057_0153 node0153_0249 (by omega)]
  rw [node0057_0153, split_right 89 block0838 node0089_0153 (by omega)]
  rw [node0089_0153, split_left 121 block0839 block0840 (by omega)]
  exact block0839_get i

theorem block0840_lookup (i : Fin 32) :
    lookup (121 + i.val) = some (values0840[i.val]'(by rw [values0840_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (121 + i.val) = _
  rw [node0057_0444, split_left 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0057_0249, split_left 153 node0057_0153 node0153_0249 (by omega)]
  rw [node0057_0153, split_right 89 block0838 node0089_0153 (by omega)]
  rw [node0089_0153, split_right 121 block0839 block0840 (by omega)]
  exact block0840_get i

theorem block0841_lookup (i : Fin 32) :
    lookup (153 + i.val) = some (values0841[i.val]'(by rw [values0841_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (153 + i.val) = _
  rw [node0057_0444, split_left 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0057_0249, split_right 153 node0057_0153 node0153_0249 (by omega)]
  rw [node0153_0249, split_left 185 block0841 node0185_0249 (by omega)]
  exact block0841_get i

theorem block0842_lookup (i : Fin 32) :
    lookup (185 + i.val) = some (values0842[i.val]'(by rw [values0842_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (185 + i.val) = _
  rw [node0057_0444, split_left 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0057_0249, split_right 153 node0057_0153 node0153_0249 (by omega)]
  rw [node0153_0249, split_right 185 block0841 node0185_0249 (by omega)]
  rw [node0185_0249, split_left 217 block0842 block0843 (by omega)]
  exact block0842_get i

theorem block0843_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values0843[i.val]'(by rw [values0843_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (217 + i.val) = _
  rw [node0057_0444, split_left 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0057_0249, split_right 153 node0057_0153 node0153_0249 (by omega)]
  rw [node0153_0249, split_right 185 block0841 node0185_0249 (by omega)]
  rw [node0185_0249, split_right 217 block0842 block0843 (by omega)]
  exact block0843_get i

theorem block0844_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values0844[i.val]'(by rw [values0844_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (249 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_left 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0249_0345, split_left 281 block0844 node0281_0345 (by omega)]
  exact block0844_get i

theorem block0845_lookup (i : Fin 32) :
    lookup (281 + i.val) = some (values0845[i.val]'(by rw [values0845_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (281 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_left 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0249_0345, split_right 281 block0844 node0281_0345 (by omega)]
  rw [node0281_0345, split_left 313 block0845 block0846 (by omega)]
  exact block0845_get i

theorem block0846_lookup (i : Fin 32) :
    lookup (313 + i.val) = some (values0846[i.val]'(by rw [values0846_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (313 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_left 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0249_0345, split_right 281 block0844 node0281_0345 (by omega)]
  rw [node0281_0345, split_right 313 block0845 block0846 (by omega)]
  exact block0846_get i

theorem block0847_lookup (i : Fin 32) :
    lookup (345 + i.val) = some (values0847[i.val]'(by rw [values0847_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (345 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_right 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0345_0444, split_left 409 node0345_0409 node0409_0444 (by omega)]
  rw [node0345_0409, split_left 377 block0847 block0848 (by omega)]
  exact block0847_get i

theorem block0848_lookup (i : Fin 32) :
    lookup (377 + i.val) = some (values0848[i.val]'(by rw [values0848_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (377 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_right 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0345_0444, split_left 409 node0345_0409 node0409_0444 (by omega)]
  rw [node0345_0409, split_right 377 block0847 block0848 (by omega)]
  exact block0848_get i

theorem block0849_lookup (i : Fin 32) :
    lookup (409 + i.val) = some (values0849[i.val]'(by rw [values0849_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (409 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_right 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0345_0444, split_right 409 node0345_0409 node0409_0444 (by omega)]
  rw [node0409_0444, split_left 441 block0849 block0850 (by omega)]
  exact block0849_get i

theorem block0850_lookup (i : Fin 3) :
    lookup (441 + i.val) = some (values0850[i.val]'(by rw [values0850_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0057_0444 (441 + i.val) = _
  rw [node0057_0444, split_right 249 node0057_0249 node0249_0444 (by omega)]
  rw [node0249_0444, split_right 345 node0249_0345 node0345_0444 (by omega)]
  rw [node0345_0444, split_right 409 node0345_0409 node0409_0444 (by omega)]
  rw [node0409_0444, split_right 441 block0849 block0850 (by omega)]
  exact block0850_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0838_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0838_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0839_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0839_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0840_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0840_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0841_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0841_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0842_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0842_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0843_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0843_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0844_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0844_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0845_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0845_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0846_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0846_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0847_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0847_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0848_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0848_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0849_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0849_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0850_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0850_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0838_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0839_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0840_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0841_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0842_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0843_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0844_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0845_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0846_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0847_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0848_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0849_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow058.block0850_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow058
