import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0888
import Grothe.UpperChaos.OriginalRow227TriangleData0889
import Grothe.UpperChaos.OriginalRow227TriangleData0890
import Grothe.UpperChaos.OriginalRow227TriangleData0891
import Grothe.UpperChaos.OriginalRow227TriangleData0892
import Grothe.UpperChaos.OriginalRow227TriangleData0893
import Grothe.UpperChaos.OriginalRow227TriangleData0894
import Grothe.UpperChaos.OriginalRow227TriangleData0895
import Grothe.UpperChaos.OriginalRow227TriangleData0896
import Grothe.UpperChaos.OriginalRow227TriangleData0897
import Grothe.UpperChaos.OriginalRow227TriangleData0898
import Grothe.UpperChaos.OriginalRow227TriangleData0899

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow062

open ConditionalTableLookup

def values0888 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0888.coefficient62_61,
  OriginalRow227TriangleData0888.coefficient62_62,
  OriginalRow227TriangleData0888.coefficient62_63,
  OriginalRow227TriangleData0888.coefficient62_64,
  OriginalRow227TriangleData0888.coefficient62_65,
  OriginalRow227TriangleData0888.coefficient62_66,
  OriginalRow227TriangleData0888.coefficient62_67,
  OriginalRow227TriangleData0888.coefficient62_68,
  OriginalRow227TriangleData0888.coefficient62_69,
  OriginalRow227TriangleData0888.coefficient62_70,
  OriginalRow227TriangleData0888.coefficient62_71,
  OriginalRow227TriangleData0888.coefficient62_72,
  OriginalRow227TriangleData0888.coefficient62_73,
  OriginalRow227TriangleData0888.coefficient62_74,
  OriginalRow227TriangleData0888.coefficient62_75,
  OriginalRow227TriangleData0888.coefficient62_76,
  OriginalRow227TriangleData0888.coefficient62_77,
  OriginalRow227TriangleData0888.coefficient62_78,
  OriginalRow227TriangleData0888.coefficient62_79,
  OriginalRow227TriangleData0888.coefficient62_80,
  OriginalRow227TriangleData0888.coefficient62_81,
  OriginalRow227TriangleData0888.coefficient62_82,
  OriginalRow227TriangleData0888.coefficient62_83,
  OriginalRow227TriangleData0888.coefficient62_84,
  OriginalRow227TriangleData0888.coefficient62_85,
  OriginalRow227TriangleData0888.coefficient62_86,
  OriginalRow227TriangleData0888.coefficient62_87,
  OriginalRow227TriangleData0888.coefficient62_88,
  OriginalRow227TriangleData0888.coefficient62_89,
  OriginalRow227TriangleData0888.coefficient62_90,
  OriginalRow227TriangleData0888.coefficient62_91,
  OriginalRow227TriangleData0888.coefficient62_92
]

theorem values0888_size : values0888.size = 32 := rfl

def block0888 : ℕ → Option IntervalDyadic := segment 61 values0888

theorem block0888_domain : ExactDomain block0888 61 93 := by
  simpa only [values0888_size] using segment_domain 61 values0888

theorem block0888_get (i : Fin 32) :
    block0888 (61 + i.val) = some (values0888[i.val]'(by rw [values0888_size]; exact i.isLt)) := by
  exact segment_get 61 values0888 ⟨i.val, by rw [values0888_size]; exact i.isLt⟩

def values0889 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0889.coefficient62_93,
  OriginalRow227TriangleData0889.coefficient62_94,
  OriginalRow227TriangleData0889.coefficient62_95,
  OriginalRow227TriangleData0889.coefficient62_96,
  OriginalRow227TriangleData0889.coefficient62_97,
  OriginalRow227TriangleData0889.coefficient62_98,
  OriginalRow227TriangleData0889.coefficient62_99,
  OriginalRow227TriangleData0889.coefficient62_100,
  OriginalRow227TriangleData0889.coefficient62_101,
  OriginalRow227TriangleData0889.coefficient62_102,
  OriginalRow227TriangleData0889.coefficient62_103,
  OriginalRow227TriangleData0889.coefficient62_104,
  OriginalRow227TriangleData0889.coefficient62_105,
  OriginalRow227TriangleData0889.coefficient62_106,
  OriginalRow227TriangleData0889.coefficient62_107,
  OriginalRow227TriangleData0889.coefficient62_108,
  OriginalRow227TriangleData0889.coefficient62_109,
  OriginalRow227TriangleData0889.coefficient62_110,
  OriginalRow227TriangleData0889.coefficient62_111,
  OriginalRow227TriangleData0889.coefficient62_112,
  OriginalRow227TriangleData0889.coefficient62_113,
  OriginalRow227TriangleData0889.coefficient62_114,
  OriginalRow227TriangleData0889.coefficient62_115,
  OriginalRow227TriangleData0889.coefficient62_116,
  OriginalRow227TriangleData0889.coefficient62_117,
  OriginalRow227TriangleData0889.coefficient62_118,
  OriginalRow227TriangleData0889.coefficient62_119,
  OriginalRow227TriangleData0889.coefficient62_120,
  OriginalRow227TriangleData0889.coefficient62_121,
  OriginalRow227TriangleData0889.coefficient62_122,
  OriginalRow227TriangleData0889.coefficient62_123,
  OriginalRow227TriangleData0889.coefficient62_124
]

theorem values0889_size : values0889.size = 32 := rfl

def block0889 : ℕ → Option IntervalDyadic := segment 93 values0889

theorem block0889_domain : ExactDomain block0889 93 125 := by
  simpa only [values0889_size] using segment_domain 93 values0889

theorem block0889_get (i : Fin 32) :
    block0889 (93 + i.val) = some (values0889[i.val]'(by rw [values0889_size]; exact i.isLt)) := by
  exact segment_get 93 values0889 ⟨i.val, by rw [values0889_size]; exact i.isLt⟩

def values0890 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0890.coefficient62_125,
  OriginalRow227TriangleData0890.coefficient62_126,
  OriginalRow227TriangleData0890.coefficient62_127,
  OriginalRow227TriangleData0890.coefficient62_128,
  OriginalRow227TriangleData0890.coefficient62_129,
  OriginalRow227TriangleData0890.coefficient62_130,
  OriginalRow227TriangleData0890.coefficient62_131,
  OriginalRow227TriangleData0890.coefficient62_132,
  OriginalRow227TriangleData0890.coefficient62_133,
  OriginalRow227TriangleData0890.coefficient62_134,
  OriginalRow227TriangleData0890.coefficient62_135,
  OriginalRow227TriangleData0890.coefficient62_136,
  OriginalRow227TriangleData0890.coefficient62_137,
  OriginalRow227TriangleData0890.coefficient62_138,
  OriginalRow227TriangleData0890.coefficient62_139,
  OriginalRow227TriangleData0890.coefficient62_140,
  OriginalRow227TriangleData0890.coefficient62_141,
  OriginalRow227TriangleData0890.coefficient62_142,
  OriginalRow227TriangleData0890.coefficient62_143,
  OriginalRow227TriangleData0890.coefficient62_144,
  OriginalRow227TriangleData0890.coefficient62_145,
  OriginalRow227TriangleData0890.coefficient62_146,
  OriginalRow227TriangleData0890.coefficient62_147,
  OriginalRow227TriangleData0890.coefficient62_148,
  OriginalRow227TriangleData0890.coefficient62_149,
  OriginalRow227TriangleData0890.coefficient62_150,
  OriginalRow227TriangleData0890.coefficient62_151,
  OriginalRow227TriangleData0890.coefficient62_152,
  OriginalRow227TriangleData0890.coefficient62_153,
  OriginalRow227TriangleData0890.coefficient62_154,
  OriginalRow227TriangleData0890.coefficient62_155,
  OriginalRow227TriangleData0890.coefficient62_156
]

theorem values0890_size : values0890.size = 32 := rfl

def block0890 : ℕ → Option IntervalDyadic := segment 125 values0890

theorem block0890_domain : ExactDomain block0890 125 157 := by
  simpa only [values0890_size] using segment_domain 125 values0890

theorem block0890_get (i : Fin 32) :
    block0890 (125 + i.val) = some (values0890[i.val]'(by rw [values0890_size]; exact i.isLt)) := by
  exact segment_get 125 values0890 ⟨i.val, by rw [values0890_size]; exact i.isLt⟩

def values0891 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0891.coefficient62_157,
  OriginalRow227TriangleData0891.coefficient62_158,
  OriginalRow227TriangleData0891.coefficient62_159,
  OriginalRow227TriangleData0891.coefficient62_160,
  OriginalRow227TriangleData0891.coefficient62_161,
  OriginalRow227TriangleData0891.coefficient62_162,
  OriginalRow227TriangleData0891.coefficient62_163,
  OriginalRow227TriangleData0891.coefficient62_164,
  OriginalRow227TriangleData0891.coefficient62_165,
  OriginalRow227TriangleData0891.coefficient62_166,
  OriginalRow227TriangleData0891.coefficient62_167,
  OriginalRow227TriangleData0891.coefficient62_168,
  OriginalRow227TriangleData0891.coefficient62_169,
  OriginalRow227TriangleData0891.coefficient62_170,
  OriginalRow227TriangleData0891.coefficient62_171,
  OriginalRow227TriangleData0891.coefficient62_172,
  OriginalRow227TriangleData0891.coefficient62_173,
  OriginalRow227TriangleData0891.coefficient62_174,
  OriginalRow227TriangleData0891.coefficient62_175,
  OriginalRow227TriangleData0891.coefficient62_176,
  OriginalRow227TriangleData0891.coefficient62_177,
  OriginalRow227TriangleData0891.coefficient62_178,
  OriginalRow227TriangleData0891.coefficient62_179,
  OriginalRow227TriangleData0891.coefficient62_180,
  OriginalRow227TriangleData0891.coefficient62_181,
  OriginalRow227TriangleData0891.coefficient62_182,
  OriginalRow227TriangleData0891.coefficient62_183,
  OriginalRow227TriangleData0891.coefficient62_184,
  OriginalRow227TriangleData0891.coefficient62_185,
  OriginalRow227TriangleData0891.coefficient62_186,
  OriginalRow227TriangleData0891.coefficient62_187,
  OriginalRow227TriangleData0891.coefficient62_188
]

theorem values0891_size : values0891.size = 32 := rfl

def block0891 : ℕ → Option IntervalDyadic := segment 157 values0891

theorem block0891_domain : ExactDomain block0891 157 189 := by
  simpa only [values0891_size] using segment_domain 157 values0891

theorem block0891_get (i : Fin 32) :
    block0891 (157 + i.val) = some (values0891[i.val]'(by rw [values0891_size]; exact i.isLt)) := by
  exact segment_get 157 values0891 ⟨i.val, by rw [values0891_size]; exact i.isLt⟩

def values0892 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0892.coefficient62_189,
  OriginalRow227TriangleData0892.coefficient62_190,
  OriginalRow227TriangleData0892.coefficient62_191,
  OriginalRow227TriangleData0892.coefficient62_192,
  OriginalRow227TriangleData0892.coefficient62_193,
  OriginalRow227TriangleData0892.coefficient62_194,
  OriginalRow227TriangleData0892.coefficient62_195,
  OriginalRow227TriangleData0892.coefficient62_196,
  OriginalRow227TriangleData0892.coefficient62_197,
  OriginalRow227TriangleData0892.coefficient62_198,
  OriginalRow227TriangleData0892.coefficient62_199,
  OriginalRow227TriangleData0892.coefficient62_200,
  OriginalRow227TriangleData0892.coefficient62_201,
  OriginalRow227TriangleData0892.coefficient62_202,
  OriginalRow227TriangleData0892.coefficient62_203,
  OriginalRow227TriangleData0892.coefficient62_204,
  OriginalRow227TriangleData0892.coefficient62_205,
  OriginalRow227TriangleData0892.coefficient62_206,
  OriginalRow227TriangleData0892.coefficient62_207,
  OriginalRow227TriangleData0892.coefficient62_208,
  OriginalRow227TriangleData0892.coefficient62_209,
  OriginalRow227TriangleData0892.coefficient62_210,
  OriginalRow227TriangleData0892.coefficient62_211,
  OriginalRow227TriangleData0892.coefficient62_212,
  OriginalRow227TriangleData0892.coefficient62_213,
  OriginalRow227TriangleData0892.coefficient62_214,
  OriginalRow227TriangleData0892.coefficient62_215,
  OriginalRow227TriangleData0892.coefficient62_216,
  OriginalRow227TriangleData0892.coefficient62_217,
  OriginalRow227TriangleData0892.coefficient62_218,
  OriginalRow227TriangleData0892.coefficient62_219,
  OriginalRow227TriangleData0892.coefficient62_220
]

theorem values0892_size : values0892.size = 32 := rfl

def block0892 : ℕ → Option IntervalDyadic := segment 189 values0892

theorem block0892_domain : ExactDomain block0892 189 221 := by
  simpa only [values0892_size] using segment_domain 189 values0892

theorem block0892_get (i : Fin 32) :
    block0892 (189 + i.val) = some (values0892[i.val]'(by rw [values0892_size]; exact i.isLt)) := by
  exact segment_get 189 values0892 ⟨i.val, by rw [values0892_size]; exact i.isLt⟩

def values0893 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0893.coefficient62_221,
  OriginalRow227TriangleData0893.coefficient62_222,
  OriginalRow227TriangleData0893.coefficient62_223,
  OriginalRow227TriangleData0893.coefficient62_224,
  OriginalRow227TriangleData0893.coefficient62_225,
  OriginalRow227TriangleData0893.coefficient62_226,
  OriginalRow227TriangleData0893.coefficient62_227,
  OriginalRow227TriangleData0893.coefficient62_228,
  OriginalRow227TriangleData0893.coefficient62_229,
  OriginalRow227TriangleData0893.coefficient62_230,
  OriginalRow227TriangleData0893.coefficient62_231,
  OriginalRow227TriangleData0893.coefficient62_232,
  OriginalRow227TriangleData0893.coefficient62_233,
  OriginalRow227TriangleData0893.coefficient62_234,
  OriginalRow227TriangleData0893.coefficient62_235,
  OriginalRow227TriangleData0893.coefficient62_236,
  OriginalRow227TriangleData0893.coefficient62_237,
  OriginalRow227TriangleData0893.coefficient62_238,
  OriginalRow227TriangleData0893.coefficient62_239,
  OriginalRow227TriangleData0893.coefficient62_240,
  OriginalRow227TriangleData0893.coefficient62_241,
  OriginalRow227TriangleData0893.coefficient62_242,
  OriginalRow227TriangleData0893.coefficient62_243,
  OriginalRow227TriangleData0893.coefficient62_244,
  OriginalRow227TriangleData0893.coefficient62_245,
  OriginalRow227TriangleData0893.coefficient62_246,
  OriginalRow227TriangleData0893.coefficient62_247,
  OriginalRow227TriangleData0893.coefficient62_248,
  OriginalRow227TriangleData0893.coefficient62_249,
  OriginalRow227TriangleData0893.coefficient62_250,
  OriginalRow227TriangleData0893.coefficient62_251,
  OriginalRow227TriangleData0893.coefficient62_252
]

theorem values0893_size : values0893.size = 32 := rfl

def block0893 : ℕ → Option IntervalDyadic := segment 221 values0893

theorem block0893_domain : ExactDomain block0893 221 253 := by
  simpa only [values0893_size] using segment_domain 221 values0893

theorem block0893_get (i : Fin 32) :
    block0893 (221 + i.val) = some (values0893[i.val]'(by rw [values0893_size]; exact i.isLt)) := by
  exact segment_get 221 values0893 ⟨i.val, by rw [values0893_size]; exact i.isLt⟩

def values0894 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0894.coefficient62_253,
  OriginalRow227TriangleData0894.coefficient62_254,
  OriginalRow227TriangleData0894.coefficient62_255,
  OriginalRow227TriangleData0894.coefficient62_256,
  OriginalRow227TriangleData0894.coefficient62_257,
  OriginalRow227TriangleData0894.coefficient62_258,
  OriginalRow227TriangleData0894.coefficient62_259,
  OriginalRow227TriangleData0894.coefficient62_260,
  OriginalRow227TriangleData0894.coefficient62_261,
  OriginalRow227TriangleData0894.coefficient62_262,
  OriginalRow227TriangleData0894.coefficient62_263,
  OriginalRow227TriangleData0894.coefficient62_264,
  OriginalRow227TriangleData0894.coefficient62_265,
  OriginalRow227TriangleData0894.coefficient62_266,
  OriginalRow227TriangleData0894.coefficient62_267,
  OriginalRow227TriangleData0894.coefficient62_268,
  OriginalRow227TriangleData0894.coefficient62_269,
  OriginalRow227TriangleData0894.coefficient62_270,
  OriginalRow227TriangleData0894.coefficient62_271,
  OriginalRow227TriangleData0894.coefficient62_272,
  OriginalRow227TriangleData0894.coefficient62_273,
  OriginalRow227TriangleData0894.coefficient62_274,
  OriginalRow227TriangleData0894.coefficient62_275,
  OriginalRow227TriangleData0894.coefficient62_276,
  OriginalRow227TriangleData0894.coefficient62_277,
  OriginalRow227TriangleData0894.coefficient62_278,
  OriginalRow227TriangleData0894.coefficient62_279,
  OriginalRow227TriangleData0894.coefficient62_280,
  OriginalRow227TriangleData0894.coefficient62_281,
  OriginalRow227TriangleData0894.coefficient62_282,
  OriginalRow227TriangleData0894.coefficient62_283,
  OriginalRow227TriangleData0894.coefficient62_284
]

theorem values0894_size : values0894.size = 32 := rfl

def block0894 : ℕ → Option IntervalDyadic := segment 253 values0894

theorem block0894_domain : ExactDomain block0894 253 285 := by
  simpa only [values0894_size] using segment_domain 253 values0894

theorem block0894_get (i : Fin 32) :
    block0894 (253 + i.val) = some (values0894[i.val]'(by rw [values0894_size]; exact i.isLt)) := by
  exact segment_get 253 values0894 ⟨i.val, by rw [values0894_size]; exact i.isLt⟩

def values0895 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0895.coefficient62_285,
  OriginalRow227TriangleData0895.coefficient62_286,
  OriginalRow227TriangleData0895.coefficient62_287,
  OriginalRow227TriangleData0895.coefficient62_288,
  OriginalRow227TriangleData0895.coefficient62_289,
  OriginalRow227TriangleData0895.coefficient62_290,
  OriginalRow227TriangleData0895.coefficient62_291,
  OriginalRow227TriangleData0895.coefficient62_292,
  OriginalRow227TriangleData0895.coefficient62_293,
  OriginalRow227TriangleData0895.coefficient62_294,
  OriginalRow227TriangleData0895.coefficient62_295,
  OriginalRow227TriangleData0895.coefficient62_296,
  OriginalRow227TriangleData0895.coefficient62_297,
  OriginalRow227TriangleData0895.coefficient62_298,
  OriginalRow227TriangleData0895.coefficient62_299,
  OriginalRow227TriangleData0895.coefficient62_300,
  OriginalRow227TriangleData0895.coefficient62_301,
  OriginalRow227TriangleData0895.coefficient62_302,
  OriginalRow227TriangleData0895.coefficient62_303,
  OriginalRow227TriangleData0895.coefficient62_304,
  OriginalRow227TriangleData0895.coefficient62_305,
  OriginalRow227TriangleData0895.coefficient62_306,
  OriginalRow227TriangleData0895.coefficient62_307,
  OriginalRow227TriangleData0895.coefficient62_308,
  OriginalRow227TriangleData0895.coefficient62_309,
  OriginalRow227TriangleData0895.coefficient62_310,
  OriginalRow227TriangleData0895.coefficient62_311,
  OriginalRow227TriangleData0895.coefficient62_312,
  OriginalRow227TriangleData0895.coefficient62_313,
  OriginalRow227TriangleData0895.coefficient62_314,
  OriginalRow227TriangleData0895.coefficient62_315,
  OriginalRow227TriangleData0895.coefficient62_316
]

theorem values0895_size : values0895.size = 32 := rfl

def block0895 : ℕ → Option IntervalDyadic := segment 285 values0895

theorem block0895_domain : ExactDomain block0895 285 317 := by
  simpa only [values0895_size] using segment_domain 285 values0895

theorem block0895_get (i : Fin 32) :
    block0895 (285 + i.val) = some (values0895[i.val]'(by rw [values0895_size]; exact i.isLt)) := by
  exact segment_get 285 values0895 ⟨i.val, by rw [values0895_size]; exact i.isLt⟩

def values0896 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0896.coefficient62_317,
  OriginalRow227TriangleData0896.coefficient62_318,
  OriginalRow227TriangleData0896.coefficient62_319,
  OriginalRow227TriangleData0896.coefficient62_320,
  OriginalRow227TriangleData0896.coefficient62_321,
  OriginalRow227TriangleData0896.coefficient62_322,
  OriginalRow227TriangleData0896.coefficient62_323,
  OriginalRow227TriangleData0896.coefficient62_324,
  OriginalRow227TriangleData0896.coefficient62_325,
  OriginalRow227TriangleData0896.coefficient62_326,
  OriginalRow227TriangleData0896.coefficient62_327,
  OriginalRow227TriangleData0896.coefficient62_328,
  OriginalRow227TriangleData0896.coefficient62_329,
  OriginalRow227TriangleData0896.coefficient62_330,
  OriginalRow227TriangleData0896.coefficient62_331,
  OriginalRow227TriangleData0896.coefficient62_332,
  OriginalRow227TriangleData0896.coefficient62_333,
  OriginalRow227TriangleData0896.coefficient62_334,
  OriginalRow227TriangleData0896.coefficient62_335,
  OriginalRow227TriangleData0896.coefficient62_336,
  OriginalRow227TriangleData0896.coefficient62_337,
  OriginalRow227TriangleData0896.coefficient62_338,
  OriginalRow227TriangleData0896.coefficient62_339,
  OriginalRow227TriangleData0896.coefficient62_340,
  OriginalRow227TriangleData0896.coefficient62_341,
  OriginalRow227TriangleData0896.coefficient62_342,
  OriginalRow227TriangleData0896.coefficient62_343,
  OriginalRow227TriangleData0896.coefficient62_344,
  OriginalRow227TriangleData0896.coefficient62_345,
  OriginalRow227TriangleData0896.coefficient62_346,
  OriginalRow227TriangleData0896.coefficient62_347,
  OriginalRow227TriangleData0896.coefficient62_348
]

theorem values0896_size : values0896.size = 32 := rfl

def block0896 : ℕ → Option IntervalDyadic := segment 317 values0896

theorem block0896_domain : ExactDomain block0896 317 349 := by
  simpa only [values0896_size] using segment_domain 317 values0896

theorem block0896_get (i : Fin 32) :
    block0896 (317 + i.val) = some (values0896[i.val]'(by rw [values0896_size]; exact i.isLt)) := by
  exact segment_get 317 values0896 ⟨i.val, by rw [values0896_size]; exact i.isLt⟩

def values0897 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0897.coefficient62_349,
  OriginalRow227TriangleData0897.coefficient62_350,
  OriginalRow227TriangleData0897.coefficient62_351,
  OriginalRow227TriangleData0897.coefficient62_352,
  OriginalRow227TriangleData0897.coefficient62_353,
  OriginalRow227TriangleData0897.coefficient62_354,
  OriginalRow227TriangleData0897.coefficient62_355,
  OriginalRow227TriangleData0897.coefficient62_356,
  OriginalRow227TriangleData0897.coefficient62_357,
  OriginalRow227TriangleData0897.coefficient62_358,
  OriginalRow227TriangleData0897.coefficient62_359,
  OriginalRow227TriangleData0897.coefficient62_360,
  OriginalRow227TriangleData0897.coefficient62_361,
  OriginalRow227TriangleData0897.coefficient62_362,
  OriginalRow227TriangleData0897.coefficient62_363,
  OriginalRow227TriangleData0897.coefficient62_364,
  OriginalRow227TriangleData0897.coefficient62_365,
  OriginalRow227TriangleData0897.coefficient62_366,
  OriginalRow227TriangleData0897.coefficient62_367,
  OriginalRow227TriangleData0897.coefficient62_368,
  OriginalRow227TriangleData0897.coefficient62_369,
  OriginalRow227TriangleData0897.coefficient62_370,
  OriginalRow227TriangleData0897.coefficient62_371,
  OriginalRow227TriangleData0897.coefficient62_372,
  OriginalRow227TriangleData0897.coefficient62_373,
  OriginalRow227TriangleData0897.coefficient62_374,
  OriginalRow227TriangleData0897.coefficient62_375,
  OriginalRow227TriangleData0897.coefficient62_376,
  OriginalRow227TriangleData0897.coefficient62_377,
  OriginalRow227TriangleData0897.coefficient62_378,
  OriginalRow227TriangleData0897.coefficient62_379,
  OriginalRow227TriangleData0897.coefficient62_380
]

theorem values0897_size : values0897.size = 32 := rfl

def block0897 : ℕ → Option IntervalDyadic := segment 349 values0897

theorem block0897_domain : ExactDomain block0897 349 381 := by
  simpa only [values0897_size] using segment_domain 349 values0897

theorem block0897_get (i : Fin 32) :
    block0897 (349 + i.val) = some (values0897[i.val]'(by rw [values0897_size]; exact i.isLt)) := by
  exact segment_get 349 values0897 ⟨i.val, by rw [values0897_size]; exact i.isLt⟩

def values0898 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0898.coefficient62_381,
  OriginalRow227TriangleData0898.coefficient62_382,
  OriginalRow227TriangleData0898.coefficient62_383,
  OriginalRow227TriangleData0898.coefficient62_384,
  OriginalRow227TriangleData0898.coefficient62_385,
  OriginalRow227TriangleData0898.coefficient62_386,
  OriginalRow227TriangleData0898.coefficient62_387,
  OriginalRow227TriangleData0898.coefficient62_388,
  OriginalRow227TriangleData0898.coefficient62_389,
  OriginalRow227TriangleData0898.coefficient62_390,
  OriginalRow227TriangleData0898.coefficient62_391,
  OriginalRow227TriangleData0898.coefficient62_392,
  OriginalRow227TriangleData0898.coefficient62_393,
  OriginalRow227TriangleData0898.coefficient62_394,
  OriginalRow227TriangleData0898.coefficient62_395,
  OriginalRow227TriangleData0898.coefficient62_396,
  OriginalRow227TriangleData0898.coefficient62_397,
  OriginalRow227TriangleData0898.coefficient62_398,
  OriginalRow227TriangleData0898.coefficient62_399,
  OriginalRow227TriangleData0898.coefficient62_400,
  OriginalRow227TriangleData0898.coefficient62_401,
  OriginalRow227TriangleData0898.coefficient62_402,
  OriginalRow227TriangleData0898.coefficient62_403,
  OriginalRow227TriangleData0898.coefficient62_404,
  OriginalRow227TriangleData0898.coefficient62_405,
  OriginalRow227TriangleData0898.coefficient62_406,
  OriginalRow227TriangleData0898.coefficient62_407,
  OriginalRow227TriangleData0898.coefficient62_408,
  OriginalRow227TriangleData0898.coefficient62_409,
  OriginalRow227TriangleData0898.coefficient62_410,
  OriginalRow227TriangleData0898.coefficient62_411,
  OriginalRow227TriangleData0898.coefficient62_412
]

theorem values0898_size : values0898.size = 32 := rfl

def block0898 : ℕ → Option IntervalDyadic := segment 381 values0898

theorem block0898_domain : ExactDomain block0898 381 413 := by
  simpa only [values0898_size] using segment_domain 381 values0898

theorem block0898_get (i : Fin 32) :
    block0898 (381 + i.val) = some (values0898[i.val]'(by rw [values0898_size]; exact i.isLt)) := by
  exact segment_get 381 values0898 ⟨i.val, by rw [values0898_size]; exact i.isLt⟩

def values0899 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0899.coefficient62_413,
  OriginalRow227TriangleData0899.coefficient62_414,
  OriginalRow227TriangleData0899.coefficient62_415,
  OriginalRow227TriangleData0899.coefficient62_416,
  OriginalRow227TriangleData0899.coefficient62_417,
  OriginalRow227TriangleData0899.coefficient62_418,
  OriginalRow227TriangleData0899.coefficient62_419,
  OriginalRow227TriangleData0899.coefficient62_420,
  OriginalRow227TriangleData0899.coefficient62_421,
  OriginalRow227TriangleData0899.coefficient62_422,
  OriginalRow227TriangleData0899.coefficient62_423,
  OriginalRow227TriangleData0899.coefficient62_424,
  OriginalRow227TriangleData0899.coefficient62_425,
  OriginalRow227TriangleData0899.coefficient62_426,
  OriginalRow227TriangleData0899.coefficient62_427,
  OriginalRow227TriangleData0899.coefficient62_428,
  OriginalRow227TriangleData0899.coefficient62_429,
  OriginalRow227TriangleData0899.coefficient62_430,
  OriginalRow227TriangleData0899.coefficient62_431,
  OriginalRow227TriangleData0899.coefficient62_432,
  OriginalRow227TriangleData0899.coefficient62_433,
  OriginalRow227TriangleData0899.coefficient62_434,
  OriginalRow227TriangleData0899.coefficient62_435,
  OriginalRow227TriangleData0899.coefficient62_436,
  OriginalRow227TriangleData0899.coefficient62_437,
  OriginalRow227TriangleData0899.coefficient62_438,
  OriginalRow227TriangleData0899.coefficient62_439
]

theorem values0899_size : values0899.size = 27 := rfl

def block0899 : ℕ → Option IntervalDyadic := segment 413 values0899

theorem block0899_domain : ExactDomain block0899 413 440 := by
  simpa only [values0899_size] using segment_domain 413 values0899

theorem block0899_get (i : Fin 27) :
    block0899 (413 + i.val) = some (values0899[i.val]'(by rw [values0899_size]; exact i.isLt)) := by
  exact segment_get 413 values0899 ⟨i.val, by rw [values0899_size]; exact i.isLt⟩

def node0093_0157 : ℕ → Option IntervalDyadic := split 125 block0889 block0890

theorem node0093_0157_domain : ExactDomain node0093_0157 93 157 := by
  exact split_domain (by decide) (by decide) block0889_domain block0890_domain

def node0061_0157 : ℕ → Option IntervalDyadic := split 93 block0888 node0093_0157

theorem node0061_0157_domain : ExactDomain node0061_0157 61 157 := by
  exact split_domain (by decide) (by decide) block0888_domain node0093_0157_domain

def node0189_0253 : ℕ → Option IntervalDyadic := split 221 block0892 block0893

theorem node0189_0253_domain : ExactDomain node0189_0253 189 253 := by
  exact split_domain (by decide) (by decide) block0892_domain block0893_domain

def node0157_0253 : ℕ → Option IntervalDyadic := split 189 block0891 node0189_0253

theorem node0157_0253_domain : ExactDomain node0157_0253 157 253 := by
  exact split_domain (by decide) (by decide) block0891_domain node0189_0253_domain

def node0061_0253 : ℕ → Option IntervalDyadic := split 157 node0061_0157 node0157_0253

theorem node0061_0253_domain : ExactDomain node0061_0253 61 253 := by
  exact split_domain (by decide) (by decide) node0061_0157_domain node0157_0253_domain

def node0285_0349 : ℕ → Option IntervalDyadic := split 317 block0895 block0896

theorem node0285_0349_domain : ExactDomain node0285_0349 285 349 := by
  exact split_domain (by decide) (by decide) block0895_domain block0896_domain

def node0253_0349 : ℕ → Option IntervalDyadic := split 285 block0894 node0285_0349

theorem node0253_0349_domain : ExactDomain node0253_0349 253 349 := by
  exact split_domain (by decide) (by decide) block0894_domain node0285_0349_domain

def node0381_0440 : ℕ → Option IntervalDyadic := split 413 block0898 block0899

theorem node0381_0440_domain : ExactDomain node0381_0440 381 440 := by
  exact split_domain (by decide) (by decide) block0898_domain block0899_domain

def node0349_0440 : ℕ → Option IntervalDyadic := split 381 block0897 node0381_0440

theorem node0349_0440_domain : ExactDomain node0349_0440 349 440 := by
  exact split_domain (by decide) (by decide) block0897_domain node0381_0440_domain

def node0253_0440 : ℕ → Option IntervalDyadic := split 349 node0253_0349 node0349_0440

theorem node0253_0440_domain : ExactDomain node0253_0440 253 440 := by
  exact split_domain (by decide) (by decide) node0253_0349_domain node0349_0440_domain

def node0061_0440 : ℕ → Option IntervalDyadic := split 253 node0061_0253 node0253_0440

theorem node0061_0440_domain : ExactDomain node0061_0440 61 440 := by
  exact split_domain (by decide) (by decide) node0061_0253_domain node0253_0440_domain

def lookup : ℕ → Option IntervalDyadic := node0061_0440

theorem lookup_domain : ExactDomain lookup 61 440 :=
  node0061_0440_domain

theorem block0888_lookup (i : Fin 32) :
    lookup (61 + i.val) = some (values0888[i.val]'(by rw [values0888_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (61 + i.val) = _
  rw [node0061_0440, split_left 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0061_0253, split_left 157 node0061_0157 node0157_0253 (by omega)]
  rw [node0061_0157, split_left 93 block0888 node0093_0157 (by omega)]
  exact block0888_get i

theorem block0889_lookup (i : Fin 32) :
    lookup (93 + i.val) = some (values0889[i.val]'(by rw [values0889_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (93 + i.val) = _
  rw [node0061_0440, split_left 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0061_0253, split_left 157 node0061_0157 node0157_0253 (by omega)]
  rw [node0061_0157, split_right 93 block0888 node0093_0157 (by omega)]
  rw [node0093_0157, split_left 125 block0889 block0890 (by omega)]
  exact block0889_get i

theorem block0890_lookup (i : Fin 32) :
    lookup (125 + i.val) = some (values0890[i.val]'(by rw [values0890_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (125 + i.val) = _
  rw [node0061_0440, split_left 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0061_0253, split_left 157 node0061_0157 node0157_0253 (by omega)]
  rw [node0061_0157, split_right 93 block0888 node0093_0157 (by omega)]
  rw [node0093_0157, split_right 125 block0889 block0890 (by omega)]
  exact block0890_get i

theorem block0891_lookup (i : Fin 32) :
    lookup (157 + i.val) = some (values0891[i.val]'(by rw [values0891_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (157 + i.val) = _
  rw [node0061_0440, split_left 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0061_0253, split_right 157 node0061_0157 node0157_0253 (by omega)]
  rw [node0157_0253, split_left 189 block0891 node0189_0253 (by omega)]
  exact block0891_get i

theorem block0892_lookup (i : Fin 32) :
    lookup (189 + i.val) = some (values0892[i.val]'(by rw [values0892_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (189 + i.val) = _
  rw [node0061_0440, split_left 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0061_0253, split_right 157 node0061_0157 node0157_0253 (by omega)]
  rw [node0157_0253, split_right 189 block0891 node0189_0253 (by omega)]
  rw [node0189_0253, split_left 221 block0892 block0893 (by omega)]
  exact block0892_get i

theorem block0893_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values0893[i.val]'(by rw [values0893_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (221 + i.val) = _
  rw [node0061_0440, split_left 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0061_0253, split_right 157 node0061_0157 node0157_0253 (by omega)]
  rw [node0157_0253, split_right 189 block0891 node0189_0253 (by omega)]
  rw [node0189_0253, split_right 221 block0892 block0893 (by omega)]
  exact block0893_get i

theorem block0894_lookup (i : Fin 32) :
    lookup (253 + i.val) = some (values0894[i.val]'(by rw [values0894_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (253 + i.val) = _
  rw [node0061_0440, split_right 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0253_0440, split_left 349 node0253_0349 node0349_0440 (by omega)]
  rw [node0253_0349, split_left 285 block0894 node0285_0349 (by omega)]
  exact block0894_get i

theorem block0895_lookup (i : Fin 32) :
    lookup (285 + i.val) = some (values0895[i.val]'(by rw [values0895_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (285 + i.val) = _
  rw [node0061_0440, split_right 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0253_0440, split_left 349 node0253_0349 node0349_0440 (by omega)]
  rw [node0253_0349, split_right 285 block0894 node0285_0349 (by omega)]
  rw [node0285_0349, split_left 317 block0895 block0896 (by omega)]
  exact block0895_get i

theorem block0896_lookup (i : Fin 32) :
    lookup (317 + i.val) = some (values0896[i.val]'(by rw [values0896_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (317 + i.val) = _
  rw [node0061_0440, split_right 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0253_0440, split_left 349 node0253_0349 node0349_0440 (by omega)]
  rw [node0253_0349, split_right 285 block0894 node0285_0349 (by omega)]
  rw [node0285_0349, split_right 317 block0895 block0896 (by omega)]
  exact block0896_get i

theorem block0897_lookup (i : Fin 32) :
    lookup (349 + i.val) = some (values0897[i.val]'(by rw [values0897_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (349 + i.val) = _
  rw [node0061_0440, split_right 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0253_0440, split_right 349 node0253_0349 node0349_0440 (by omega)]
  rw [node0349_0440, split_left 381 block0897 node0381_0440 (by omega)]
  exact block0897_get i

theorem block0898_lookup (i : Fin 32) :
    lookup (381 + i.val) = some (values0898[i.val]'(by rw [values0898_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (381 + i.val) = _
  rw [node0061_0440, split_right 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0253_0440, split_right 349 node0253_0349 node0349_0440 (by omega)]
  rw [node0349_0440, split_right 381 block0897 node0381_0440 (by omega)]
  rw [node0381_0440, split_left 413 block0898 block0899 (by omega)]
  exact block0898_get i

theorem block0899_lookup (i : Fin 27) :
    lookup (413 + i.val) = some (values0899[i.val]'(by rw [values0899_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0061_0440 (413 + i.val) = _
  rw [node0061_0440, split_right 253 node0061_0253 node0253_0440 (by omega)]
  rw [node0253_0440, split_right 349 node0253_0349 node0349_0440 (by omega)]
  rw [node0349_0440, split_right 381 block0897 node0381_0440 (by omega)]
  rw [node0381_0440, split_right 413 block0898 block0899 (by omega)]
  exact block0899_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0888_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0888_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0889_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0889_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0890_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0890_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0891_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0891_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0892_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0892_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0893_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0893_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0894_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0894_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0895_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0895_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0896_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0896_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0897_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0897_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0898_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0898_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0899_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0899_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0888_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0889_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0890_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0891_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0892_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0893_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0894_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0895_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0896_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0897_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0898_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow062.block0899_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow062
