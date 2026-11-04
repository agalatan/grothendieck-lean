import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1032
import Grothe.UpperChaos.OriginalRow227TriangleData1033
import Grothe.UpperChaos.OriginalRow227TriangleData1034
import Grothe.UpperChaos.OriginalRow227TriangleData1035
import Grothe.UpperChaos.OriginalRow227TriangleData1036
import Grothe.UpperChaos.OriginalRow227TriangleData1037
import Grothe.UpperChaos.OriginalRow227TriangleData1038
import Grothe.UpperChaos.OriginalRow227TriangleData1039
import Grothe.UpperChaos.OriginalRow227TriangleData1040
import Grothe.UpperChaos.OriginalRow227TriangleData1041
import Grothe.UpperChaos.OriginalRow227TriangleData1042
import Grothe.UpperChaos.OriginalRow227TriangleData1043

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow074

open ConditionalTableLookup

def values1032 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1032.coefficient74_73,
  OriginalRow227TriangleData1032.coefficient74_74,
  OriginalRow227TriangleData1032.coefficient74_75,
  OriginalRow227TriangleData1032.coefficient74_76,
  OriginalRow227TriangleData1032.coefficient74_77,
  OriginalRow227TriangleData1032.coefficient74_78,
  OriginalRow227TriangleData1032.coefficient74_79,
  OriginalRow227TriangleData1032.coefficient74_80,
  OriginalRow227TriangleData1032.coefficient74_81,
  OriginalRow227TriangleData1032.coefficient74_82,
  OriginalRow227TriangleData1032.coefficient74_83,
  OriginalRow227TriangleData1032.coefficient74_84,
  OriginalRow227TriangleData1032.coefficient74_85,
  OriginalRow227TriangleData1032.coefficient74_86,
  OriginalRow227TriangleData1032.coefficient74_87,
  OriginalRow227TriangleData1032.coefficient74_88,
  OriginalRow227TriangleData1032.coefficient74_89,
  OriginalRow227TriangleData1032.coefficient74_90,
  OriginalRow227TriangleData1032.coefficient74_91,
  OriginalRow227TriangleData1032.coefficient74_92,
  OriginalRow227TriangleData1032.coefficient74_93,
  OriginalRow227TriangleData1032.coefficient74_94,
  OriginalRow227TriangleData1032.coefficient74_95,
  OriginalRow227TriangleData1032.coefficient74_96,
  OriginalRow227TriangleData1032.coefficient74_97,
  OriginalRow227TriangleData1032.coefficient74_98,
  OriginalRow227TriangleData1032.coefficient74_99,
  OriginalRow227TriangleData1032.coefficient74_100,
  OriginalRow227TriangleData1032.coefficient74_101,
  OriginalRow227TriangleData1032.coefficient74_102,
  OriginalRow227TriangleData1032.coefficient74_103,
  OriginalRow227TriangleData1032.coefficient74_104
]

theorem values1032_size : values1032.size = 32 := rfl

def block1032 : ℕ → Option IntervalDyadic := segment 73 values1032

theorem block1032_domain : ExactDomain block1032 73 105 := by
  simpa only [values1032_size] using segment_domain 73 values1032

theorem block1032_get (i : Fin 32) :
    block1032 (73 + i.val) = some (values1032[i.val]'(by rw [values1032_size]; exact i.isLt)) := by
  exact segment_get 73 values1032 ⟨i.val, by rw [values1032_size]; exact i.isLt⟩

def values1033 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1033.coefficient74_105,
  OriginalRow227TriangleData1033.coefficient74_106,
  OriginalRow227TriangleData1033.coefficient74_107,
  OriginalRow227TriangleData1033.coefficient74_108,
  OriginalRow227TriangleData1033.coefficient74_109,
  OriginalRow227TriangleData1033.coefficient74_110,
  OriginalRow227TriangleData1033.coefficient74_111,
  OriginalRow227TriangleData1033.coefficient74_112,
  OriginalRow227TriangleData1033.coefficient74_113,
  OriginalRow227TriangleData1033.coefficient74_114,
  OriginalRow227TriangleData1033.coefficient74_115,
  OriginalRow227TriangleData1033.coefficient74_116,
  OriginalRow227TriangleData1033.coefficient74_117,
  OriginalRow227TriangleData1033.coefficient74_118,
  OriginalRow227TriangleData1033.coefficient74_119,
  OriginalRow227TriangleData1033.coefficient74_120,
  OriginalRow227TriangleData1033.coefficient74_121,
  OriginalRow227TriangleData1033.coefficient74_122,
  OriginalRow227TriangleData1033.coefficient74_123,
  OriginalRow227TriangleData1033.coefficient74_124,
  OriginalRow227TriangleData1033.coefficient74_125,
  OriginalRow227TriangleData1033.coefficient74_126,
  OriginalRow227TriangleData1033.coefficient74_127,
  OriginalRow227TriangleData1033.coefficient74_128,
  OriginalRow227TriangleData1033.coefficient74_129,
  OriginalRow227TriangleData1033.coefficient74_130,
  OriginalRow227TriangleData1033.coefficient74_131,
  OriginalRow227TriangleData1033.coefficient74_132,
  OriginalRow227TriangleData1033.coefficient74_133,
  OriginalRow227TriangleData1033.coefficient74_134,
  OriginalRow227TriangleData1033.coefficient74_135,
  OriginalRow227TriangleData1033.coefficient74_136
]

theorem values1033_size : values1033.size = 32 := rfl

def block1033 : ℕ → Option IntervalDyadic := segment 105 values1033

theorem block1033_domain : ExactDomain block1033 105 137 := by
  simpa only [values1033_size] using segment_domain 105 values1033

theorem block1033_get (i : Fin 32) :
    block1033 (105 + i.val) = some (values1033[i.val]'(by rw [values1033_size]; exact i.isLt)) := by
  exact segment_get 105 values1033 ⟨i.val, by rw [values1033_size]; exact i.isLt⟩

def values1034 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1034.coefficient74_137,
  OriginalRow227TriangleData1034.coefficient74_138,
  OriginalRow227TriangleData1034.coefficient74_139,
  OriginalRow227TriangleData1034.coefficient74_140,
  OriginalRow227TriangleData1034.coefficient74_141,
  OriginalRow227TriangleData1034.coefficient74_142,
  OriginalRow227TriangleData1034.coefficient74_143,
  OriginalRow227TriangleData1034.coefficient74_144,
  OriginalRow227TriangleData1034.coefficient74_145,
  OriginalRow227TriangleData1034.coefficient74_146,
  OriginalRow227TriangleData1034.coefficient74_147,
  OriginalRow227TriangleData1034.coefficient74_148,
  OriginalRow227TriangleData1034.coefficient74_149,
  OriginalRow227TriangleData1034.coefficient74_150,
  OriginalRow227TriangleData1034.coefficient74_151,
  OriginalRow227TriangleData1034.coefficient74_152,
  OriginalRow227TriangleData1034.coefficient74_153,
  OriginalRow227TriangleData1034.coefficient74_154,
  OriginalRow227TriangleData1034.coefficient74_155,
  OriginalRow227TriangleData1034.coefficient74_156,
  OriginalRow227TriangleData1034.coefficient74_157,
  OriginalRow227TriangleData1034.coefficient74_158,
  OriginalRow227TriangleData1034.coefficient74_159,
  OriginalRow227TriangleData1034.coefficient74_160,
  OriginalRow227TriangleData1034.coefficient74_161,
  OriginalRow227TriangleData1034.coefficient74_162,
  OriginalRow227TriangleData1034.coefficient74_163,
  OriginalRow227TriangleData1034.coefficient74_164,
  OriginalRow227TriangleData1034.coefficient74_165,
  OriginalRow227TriangleData1034.coefficient74_166,
  OriginalRow227TriangleData1034.coefficient74_167,
  OriginalRow227TriangleData1034.coefficient74_168
]

theorem values1034_size : values1034.size = 32 := rfl

def block1034 : ℕ → Option IntervalDyadic := segment 137 values1034

theorem block1034_domain : ExactDomain block1034 137 169 := by
  simpa only [values1034_size] using segment_domain 137 values1034

theorem block1034_get (i : Fin 32) :
    block1034 (137 + i.val) = some (values1034[i.val]'(by rw [values1034_size]; exact i.isLt)) := by
  exact segment_get 137 values1034 ⟨i.val, by rw [values1034_size]; exact i.isLt⟩

def values1035 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1035.coefficient74_169,
  OriginalRow227TriangleData1035.coefficient74_170,
  OriginalRow227TriangleData1035.coefficient74_171,
  OriginalRow227TriangleData1035.coefficient74_172,
  OriginalRow227TriangleData1035.coefficient74_173,
  OriginalRow227TriangleData1035.coefficient74_174,
  OriginalRow227TriangleData1035.coefficient74_175,
  OriginalRow227TriangleData1035.coefficient74_176,
  OriginalRow227TriangleData1035.coefficient74_177,
  OriginalRow227TriangleData1035.coefficient74_178,
  OriginalRow227TriangleData1035.coefficient74_179,
  OriginalRow227TriangleData1035.coefficient74_180,
  OriginalRow227TriangleData1035.coefficient74_181,
  OriginalRow227TriangleData1035.coefficient74_182,
  OriginalRow227TriangleData1035.coefficient74_183,
  OriginalRow227TriangleData1035.coefficient74_184,
  OriginalRow227TriangleData1035.coefficient74_185,
  OriginalRow227TriangleData1035.coefficient74_186,
  OriginalRow227TriangleData1035.coefficient74_187,
  OriginalRow227TriangleData1035.coefficient74_188,
  OriginalRow227TriangleData1035.coefficient74_189,
  OriginalRow227TriangleData1035.coefficient74_190,
  OriginalRow227TriangleData1035.coefficient74_191,
  OriginalRow227TriangleData1035.coefficient74_192,
  OriginalRow227TriangleData1035.coefficient74_193,
  OriginalRow227TriangleData1035.coefficient74_194,
  OriginalRow227TriangleData1035.coefficient74_195,
  OriginalRow227TriangleData1035.coefficient74_196,
  OriginalRow227TriangleData1035.coefficient74_197,
  OriginalRow227TriangleData1035.coefficient74_198,
  OriginalRow227TriangleData1035.coefficient74_199,
  OriginalRow227TriangleData1035.coefficient74_200
]

theorem values1035_size : values1035.size = 32 := rfl

def block1035 : ℕ → Option IntervalDyadic := segment 169 values1035

theorem block1035_domain : ExactDomain block1035 169 201 := by
  simpa only [values1035_size] using segment_domain 169 values1035

theorem block1035_get (i : Fin 32) :
    block1035 (169 + i.val) = some (values1035[i.val]'(by rw [values1035_size]; exact i.isLt)) := by
  exact segment_get 169 values1035 ⟨i.val, by rw [values1035_size]; exact i.isLt⟩

def values1036 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1036.coefficient74_201,
  OriginalRow227TriangleData1036.coefficient74_202,
  OriginalRow227TriangleData1036.coefficient74_203,
  OriginalRow227TriangleData1036.coefficient74_204,
  OriginalRow227TriangleData1036.coefficient74_205,
  OriginalRow227TriangleData1036.coefficient74_206,
  OriginalRow227TriangleData1036.coefficient74_207,
  OriginalRow227TriangleData1036.coefficient74_208,
  OriginalRow227TriangleData1036.coefficient74_209,
  OriginalRow227TriangleData1036.coefficient74_210,
  OriginalRow227TriangleData1036.coefficient74_211,
  OriginalRow227TriangleData1036.coefficient74_212,
  OriginalRow227TriangleData1036.coefficient74_213,
  OriginalRow227TriangleData1036.coefficient74_214,
  OriginalRow227TriangleData1036.coefficient74_215,
  OriginalRow227TriangleData1036.coefficient74_216,
  OriginalRow227TriangleData1036.coefficient74_217,
  OriginalRow227TriangleData1036.coefficient74_218,
  OriginalRow227TriangleData1036.coefficient74_219,
  OriginalRow227TriangleData1036.coefficient74_220,
  OriginalRow227TriangleData1036.coefficient74_221,
  OriginalRow227TriangleData1036.coefficient74_222,
  OriginalRow227TriangleData1036.coefficient74_223,
  OriginalRow227TriangleData1036.coefficient74_224,
  OriginalRow227TriangleData1036.coefficient74_225,
  OriginalRow227TriangleData1036.coefficient74_226,
  OriginalRow227TriangleData1036.coefficient74_227,
  OriginalRow227TriangleData1036.coefficient74_228,
  OriginalRow227TriangleData1036.coefficient74_229,
  OriginalRow227TriangleData1036.coefficient74_230,
  OriginalRow227TriangleData1036.coefficient74_231,
  OriginalRow227TriangleData1036.coefficient74_232
]

theorem values1036_size : values1036.size = 32 := rfl

def block1036 : ℕ → Option IntervalDyadic := segment 201 values1036

theorem block1036_domain : ExactDomain block1036 201 233 := by
  simpa only [values1036_size] using segment_domain 201 values1036

theorem block1036_get (i : Fin 32) :
    block1036 (201 + i.val) = some (values1036[i.val]'(by rw [values1036_size]; exact i.isLt)) := by
  exact segment_get 201 values1036 ⟨i.val, by rw [values1036_size]; exact i.isLt⟩

def values1037 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1037.coefficient74_233,
  OriginalRow227TriangleData1037.coefficient74_234,
  OriginalRow227TriangleData1037.coefficient74_235,
  OriginalRow227TriangleData1037.coefficient74_236,
  OriginalRow227TriangleData1037.coefficient74_237,
  OriginalRow227TriangleData1037.coefficient74_238,
  OriginalRow227TriangleData1037.coefficient74_239,
  OriginalRow227TriangleData1037.coefficient74_240,
  OriginalRow227TriangleData1037.coefficient74_241,
  OriginalRow227TriangleData1037.coefficient74_242,
  OriginalRow227TriangleData1037.coefficient74_243,
  OriginalRow227TriangleData1037.coefficient74_244,
  OriginalRow227TriangleData1037.coefficient74_245,
  OriginalRow227TriangleData1037.coefficient74_246,
  OriginalRow227TriangleData1037.coefficient74_247,
  OriginalRow227TriangleData1037.coefficient74_248,
  OriginalRow227TriangleData1037.coefficient74_249,
  OriginalRow227TriangleData1037.coefficient74_250,
  OriginalRow227TriangleData1037.coefficient74_251,
  OriginalRow227TriangleData1037.coefficient74_252,
  OriginalRow227TriangleData1037.coefficient74_253,
  OriginalRow227TriangleData1037.coefficient74_254,
  OriginalRow227TriangleData1037.coefficient74_255,
  OriginalRow227TriangleData1037.coefficient74_256,
  OriginalRow227TriangleData1037.coefficient74_257,
  OriginalRow227TriangleData1037.coefficient74_258,
  OriginalRow227TriangleData1037.coefficient74_259,
  OriginalRow227TriangleData1037.coefficient74_260,
  OriginalRow227TriangleData1037.coefficient74_261,
  OriginalRow227TriangleData1037.coefficient74_262,
  OriginalRow227TriangleData1037.coefficient74_263,
  OriginalRow227TriangleData1037.coefficient74_264
]

theorem values1037_size : values1037.size = 32 := rfl

def block1037 : ℕ → Option IntervalDyadic := segment 233 values1037

theorem block1037_domain : ExactDomain block1037 233 265 := by
  simpa only [values1037_size] using segment_domain 233 values1037

theorem block1037_get (i : Fin 32) :
    block1037 (233 + i.val) = some (values1037[i.val]'(by rw [values1037_size]; exact i.isLt)) := by
  exact segment_get 233 values1037 ⟨i.val, by rw [values1037_size]; exact i.isLt⟩

def values1038 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1038.coefficient74_265,
  OriginalRow227TriangleData1038.coefficient74_266,
  OriginalRow227TriangleData1038.coefficient74_267,
  OriginalRow227TriangleData1038.coefficient74_268,
  OriginalRow227TriangleData1038.coefficient74_269,
  OriginalRow227TriangleData1038.coefficient74_270,
  OriginalRow227TriangleData1038.coefficient74_271,
  OriginalRow227TriangleData1038.coefficient74_272,
  OriginalRow227TriangleData1038.coefficient74_273,
  OriginalRow227TriangleData1038.coefficient74_274,
  OriginalRow227TriangleData1038.coefficient74_275,
  OriginalRow227TriangleData1038.coefficient74_276,
  OriginalRow227TriangleData1038.coefficient74_277,
  OriginalRow227TriangleData1038.coefficient74_278,
  OriginalRow227TriangleData1038.coefficient74_279,
  OriginalRow227TriangleData1038.coefficient74_280,
  OriginalRow227TriangleData1038.coefficient74_281,
  OriginalRow227TriangleData1038.coefficient74_282,
  OriginalRow227TriangleData1038.coefficient74_283,
  OriginalRow227TriangleData1038.coefficient74_284,
  OriginalRow227TriangleData1038.coefficient74_285,
  OriginalRow227TriangleData1038.coefficient74_286,
  OriginalRow227TriangleData1038.coefficient74_287,
  OriginalRow227TriangleData1038.coefficient74_288,
  OriginalRow227TriangleData1038.coefficient74_289,
  OriginalRow227TriangleData1038.coefficient74_290,
  OriginalRow227TriangleData1038.coefficient74_291,
  OriginalRow227TriangleData1038.coefficient74_292,
  OriginalRow227TriangleData1038.coefficient74_293,
  OriginalRow227TriangleData1038.coefficient74_294,
  OriginalRow227TriangleData1038.coefficient74_295,
  OriginalRow227TriangleData1038.coefficient74_296
]

theorem values1038_size : values1038.size = 32 := rfl

def block1038 : ℕ → Option IntervalDyadic := segment 265 values1038

theorem block1038_domain : ExactDomain block1038 265 297 := by
  simpa only [values1038_size] using segment_domain 265 values1038

theorem block1038_get (i : Fin 32) :
    block1038 (265 + i.val) = some (values1038[i.val]'(by rw [values1038_size]; exact i.isLt)) := by
  exact segment_get 265 values1038 ⟨i.val, by rw [values1038_size]; exact i.isLt⟩

def values1039 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1039.coefficient74_297,
  OriginalRow227TriangleData1039.coefficient74_298,
  OriginalRow227TriangleData1039.coefficient74_299,
  OriginalRow227TriangleData1039.coefficient74_300,
  OriginalRow227TriangleData1039.coefficient74_301,
  OriginalRow227TriangleData1039.coefficient74_302,
  OriginalRow227TriangleData1039.coefficient74_303,
  OriginalRow227TriangleData1039.coefficient74_304,
  OriginalRow227TriangleData1039.coefficient74_305,
  OriginalRow227TriangleData1039.coefficient74_306,
  OriginalRow227TriangleData1039.coefficient74_307,
  OriginalRow227TriangleData1039.coefficient74_308,
  OriginalRow227TriangleData1039.coefficient74_309,
  OriginalRow227TriangleData1039.coefficient74_310,
  OriginalRow227TriangleData1039.coefficient74_311,
  OriginalRow227TriangleData1039.coefficient74_312,
  OriginalRow227TriangleData1039.coefficient74_313,
  OriginalRow227TriangleData1039.coefficient74_314,
  OriginalRow227TriangleData1039.coefficient74_315,
  OriginalRow227TriangleData1039.coefficient74_316,
  OriginalRow227TriangleData1039.coefficient74_317,
  OriginalRow227TriangleData1039.coefficient74_318,
  OriginalRow227TriangleData1039.coefficient74_319,
  OriginalRow227TriangleData1039.coefficient74_320,
  OriginalRow227TriangleData1039.coefficient74_321,
  OriginalRow227TriangleData1039.coefficient74_322,
  OriginalRow227TriangleData1039.coefficient74_323,
  OriginalRow227TriangleData1039.coefficient74_324,
  OriginalRow227TriangleData1039.coefficient74_325,
  OriginalRow227TriangleData1039.coefficient74_326,
  OriginalRow227TriangleData1039.coefficient74_327,
  OriginalRow227TriangleData1039.coefficient74_328
]

theorem values1039_size : values1039.size = 32 := rfl

def block1039 : ℕ → Option IntervalDyadic := segment 297 values1039

theorem block1039_domain : ExactDomain block1039 297 329 := by
  simpa only [values1039_size] using segment_domain 297 values1039

theorem block1039_get (i : Fin 32) :
    block1039 (297 + i.val) = some (values1039[i.val]'(by rw [values1039_size]; exact i.isLt)) := by
  exact segment_get 297 values1039 ⟨i.val, by rw [values1039_size]; exact i.isLt⟩

def values1040 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1040.coefficient74_329,
  OriginalRow227TriangleData1040.coefficient74_330,
  OriginalRow227TriangleData1040.coefficient74_331,
  OriginalRow227TriangleData1040.coefficient74_332,
  OriginalRow227TriangleData1040.coefficient74_333,
  OriginalRow227TriangleData1040.coefficient74_334,
  OriginalRow227TriangleData1040.coefficient74_335,
  OriginalRow227TriangleData1040.coefficient74_336,
  OriginalRow227TriangleData1040.coefficient74_337,
  OriginalRow227TriangleData1040.coefficient74_338,
  OriginalRow227TriangleData1040.coefficient74_339,
  OriginalRow227TriangleData1040.coefficient74_340,
  OriginalRow227TriangleData1040.coefficient74_341,
  OriginalRow227TriangleData1040.coefficient74_342,
  OriginalRow227TriangleData1040.coefficient74_343,
  OriginalRow227TriangleData1040.coefficient74_344,
  OriginalRow227TriangleData1040.coefficient74_345,
  OriginalRow227TriangleData1040.coefficient74_346,
  OriginalRow227TriangleData1040.coefficient74_347,
  OriginalRow227TriangleData1040.coefficient74_348,
  OriginalRow227TriangleData1040.coefficient74_349,
  OriginalRow227TriangleData1040.coefficient74_350,
  OriginalRow227TriangleData1040.coefficient74_351,
  OriginalRow227TriangleData1040.coefficient74_352,
  OriginalRow227TriangleData1040.coefficient74_353,
  OriginalRow227TriangleData1040.coefficient74_354,
  OriginalRow227TriangleData1040.coefficient74_355,
  OriginalRow227TriangleData1040.coefficient74_356,
  OriginalRow227TriangleData1040.coefficient74_357,
  OriginalRow227TriangleData1040.coefficient74_358,
  OriginalRow227TriangleData1040.coefficient74_359,
  OriginalRow227TriangleData1040.coefficient74_360
]

theorem values1040_size : values1040.size = 32 := rfl

def block1040 : ℕ → Option IntervalDyadic := segment 329 values1040

theorem block1040_domain : ExactDomain block1040 329 361 := by
  simpa only [values1040_size] using segment_domain 329 values1040

theorem block1040_get (i : Fin 32) :
    block1040 (329 + i.val) = some (values1040[i.val]'(by rw [values1040_size]; exact i.isLt)) := by
  exact segment_get 329 values1040 ⟨i.val, by rw [values1040_size]; exact i.isLt⟩

def values1041 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1041.coefficient74_361,
  OriginalRow227TriangleData1041.coefficient74_362,
  OriginalRow227TriangleData1041.coefficient74_363,
  OriginalRow227TriangleData1041.coefficient74_364,
  OriginalRow227TriangleData1041.coefficient74_365,
  OriginalRow227TriangleData1041.coefficient74_366,
  OriginalRow227TriangleData1041.coefficient74_367,
  OriginalRow227TriangleData1041.coefficient74_368,
  OriginalRow227TriangleData1041.coefficient74_369,
  OriginalRow227TriangleData1041.coefficient74_370,
  OriginalRow227TriangleData1041.coefficient74_371,
  OriginalRow227TriangleData1041.coefficient74_372,
  OriginalRow227TriangleData1041.coefficient74_373,
  OriginalRow227TriangleData1041.coefficient74_374,
  OriginalRow227TriangleData1041.coefficient74_375,
  OriginalRow227TriangleData1041.coefficient74_376,
  OriginalRow227TriangleData1041.coefficient74_377,
  OriginalRow227TriangleData1041.coefficient74_378,
  OriginalRow227TriangleData1041.coefficient74_379,
  OriginalRow227TriangleData1041.coefficient74_380,
  OriginalRow227TriangleData1041.coefficient74_381,
  OriginalRow227TriangleData1041.coefficient74_382,
  OriginalRow227TriangleData1041.coefficient74_383,
  OriginalRow227TriangleData1041.coefficient74_384,
  OriginalRow227TriangleData1041.coefficient74_385,
  OriginalRow227TriangleData1041.coefficient74_386,
  OriginalRow227TriangleData1041.coefficient74_387,
  OriginalRow227TriangleData1041.coefficient74_388,
  OriginalRow227TriangleData1041.coefficient74_389,
  OriginalRow227TriangleData1041.coefficient74_390,
  OriginalRow227TriangleData1041.coefficient74_391,
  OriginalRow227TriangleData1041.coefficient74_392
]

theorem values1041_size : values1041.size = 32 := rfl

def block1041 : ℕ → Option IntervalDyadic := segment 361 values1041

theorem block1041_domain : ExactDomain block1041 361 393 := by
  simpa only [values1041_size] using segment_domain 361 values1041

theorem block1041_get (i : Fin 32) :
    block1041 (361 + i.val) = some (values1041[i.val]'(by rw [values1041_size]; exact i.isLt)) := by
  exact segment_get 361 values1041 ⟨i.val, by rw [values1041_size]; exact i.isLt⟩

def values1042 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1042.coefficient74_393,
  OriginalRow227TriangleData1042.coefficient74_394,
  OriginalRow227TriangleData1042.coefficient74_395,
  OriginalRow227TriangleData1042.coefficient74_396,
  OriginalRow227TriangleData1042.coefficient74_397,
  OriginalRow227TriangleData1042.coefficient74_398,
  OriginalRow227TriangleData1042.coefficient74_399,
  OriginalRow227TriangleData1042.coefficient74_400,
  OriginalRow227TriangleData1042.coefficient74_401,
  OriginalRow227TriangleData1042.coefficient74_402,
  OriginalRow227TriangleData1042.coefficient74_403,
  OriginalRow227TriangleData1042.coefficient74_404,
  OriginalRow227TriangleData1042.coefficient74_405,
  OriginalRow227TriangleData1042.coefficient74_406,
  OriginalRow227TriangleData1042.coefficient74_407,
  OriginalRow227TriangleData1042.coefficient74_408,
  OriginalRow227TriangleData1042.coefficient74_409,
  OriginalRow227TriangleData1042.coefficient74_410,
  OriginalRow227TriangleData1042.coefficient74_411,
  OriginalRow227TriangleData1042.coefficient74_412,
  OriginalRow227TriangleData1042.coefficient74_413,
  OriginalRow227TriangleData1042.coefficient74_414,
  OriginalRow227TriangleData1042.coefficient74_415,
  OriginalRow227TriangleData1042.coefficient74_416,
  OriginalRow227TriangleData1042.coefficient74_417,
  OriginalRow227TriangleData1042.coefficient74_418,
  OriginalRow227TriangleData1042.coefficient74_419,
  OriginalRow227TriangleData1042.coefficient74_420,
  OriginalRow227TriangleData1042.coefficient74_421,
  OriginalRow227TriangleData1042.coefficient74_422,
  OriginalRow227TriangleData1042.coefficient74_423,
  OriginalRow227TriangleData1042.coefficient74_424
]

theorem values1042_size : values1042.size = 32 := rfl

def block1042 : ℕ → Option IntervalDyadic := segment 393 values1042

theorem block1042_domain : ExactDomain block1042 393 425 := by
  simpa only [values1042_size] using segment_domain 393 values1042

theorem block1042_get (i : Fin 32) :
    block1042 (393 + i.val) = some (values1042[i.val]'(by rw [values1042_size]; exact i.isLt)) := by
  exact segment_get 393 values1042 ⟨i.val, by rw [values1042_size]; exact i.isLt⟩

def values1043 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1043.coefficient74_425,
  OriginalRow227TriangleData1043.coefficient74_426,
  OriginalRow227TriangleData1043.coefficient74_427
]

theorem values1043_size : values1043.size = 3 := rfl

def block1043 : ℕ → Option IntervalDyadic := segment 425 values1043

theorem block1043_domain : ExactDomain block1043 425 428 := by
  simpa only [values1043_size] using segment_domain 425 values1043

theorem block1043_get (i : Fin 3) :
    block1043 (425 + i.val) = some (values1043[i.val]'(by rw [values1043_size]; exact i.isLt)) := by
  exact segment_get 425 values1043 ⟨i.val, by rw [values1043_size]; exact i.isLt⟩

def node0105_0169 : ℕ → Option IntervalDyadic := split 137 block1033 block1034

theorem node0105_0169_domain : ExactDomain node0105_0169 105 169 := by
  exact split_domain (by decide) (by decide) block1033_domain block1034_domain

def node0073_0169 : ℕ → Option IntervalDyadic := split 105 block1032 node0105_0169

theorem node0073_0169_domain : ExactDomain node0073_0169 73 169 := by
  exact split_domain (by decide) (by decide) block1032_domain node0105_0169_domain

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block1036 block1037

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block1036_domain block1037_domain

def node0169_0265 : ℕ → Option IntervalDyadic := split 201 block1035 node0201_0265

theorem node0169_0265_domain : ExactDomain node0169_0265 169 265 := by
  exact split_domain (by decide) (by decide) block1035_domain node0201_0265_domain

def node0073_0265 : ℕ → Option IntervalDyadic := split 169 node0073_0169 node0169_0265

theorem node0073_0265_domain : ExactDomain node0073_0265 73 265 := by
  exact split_domain (by decide) (by decide) node0073_0169_domain node0169_0265_domain

def node0297_0361 : ℕ → Option IntervalDyadic := split 329 block1039 block1040

theorem node0297_0361_domain : ExactDomain node0297_0361 297 361 := by
  exact split_domain (by decide) (by decide) block1039_domain block1040_domain

def node0265_0361 : ℕ → Option IntervalDyadic := split 297 block1038 node0297_0361

theorem node0265_0361_domain : ExactDomain node0265_0361 265 361 := by
  exact split_domain (by decide) (by decide) block1038_domain node0297_0361_domain

def node0393_0428 : ℕ → Option IntervalDyadic := split 425 block1042 block1043

theorem node0393_0428_domain : ExactDomain node0393_0428 393 428 := by
  exact split_domain (by decide) (by decide) block1042_domain block1043_domain

def node0361_0428 : ℕ → Option IntervalDyadic := split 393 block1041 node0393_0428

theorem node0361_0428_domain : ExactDomain node0361_0428 361 428 := by
  exact split_domain (by decide) (by decide) block1041_domain node0393_0428_domain

def node0265_0428 : ℕ → Option IntervalDyadic := split 361 node0265_0361 node0361_0428

theorem node0265_0428_domain : ExactDomain node0265_0428 265 428 := by
  exact split_domain (by decide) (by decide) node0265_0361_domain node0361_0428_domain

def node0073_0428 : ℕ → Option IntervalDyadic := split 265 node0073_0265 node0265_0428

theorem node0073_0428_domain : ExactDomain node0073_0428 73 428 := by
  exact split_domain (by decide) (by decide) node0073_0265_domain node0265_0428_domain

def lookup : ℕ → Option IntervalDyadic := node0073_0428

theorem lookup_domain : ExactDomain lookup 73 428 :=
  node0073_0428_domain

theorem block1032_lookup (i : Fin 32) :
    lookup (73 + i.val) = some (values1032[i.val]'(by rw [values1032_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (73 + i.val) = _
  rw [node0073_0428, split_left 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0073_0265, split_left 169 node0073_0169 node0169_0265 (by omega)]
  rw [node0073_0169, split_left 105 block1032 node0105_0169 (by omega)]
  exact block1032_get i

theorem block1033_lookup (i : Fin 32) :
    lookup (105 + i.val) = some (values1033[i.val]'(by rw [values1033_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (105 + i.val) = _
  rw [node0073_0428, split_left 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0073_0265, split_left 169 node0073_0169 node0169_0265 (by omega)]
  rw [node0073_0169, split_right 105 block1032 node0105_0169 (by omega)]
  rw [node0105_0169, split_left 137 block1033 block1034 (by omega)]
  exact block1033_get i

theorem block1034_lookup (i : Fin 32) :
    lookup (137 + i.val) = some (values1034[i.val]'(by rw [values1034_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (137 + i.val) = _
  rw [node0073_0428, split_left 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0073_0265, split_left 169 node0073_0169 node0169_0265 (by omega)]
  rw [node0073_0169, split_right 105 block1032 node0105_0169 (by omega)]
  rw [node0105_0169, split_right 137 block1033 block1034 (by omega)]
  exact block1034_get i

theorem block1035_lookup (i : Fin 32) :
    lookup (169 + i.val) = some (values1035[i.val]'(by rw [values1035_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (169 + i.val) = _
  rw [node0073_0428, split_left 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0073_0265, split_right 169 node0073_0169 node0169_0265 (by omega)]
  rw [node0169_0265, split_left 201 block1035 node0201_0265 (by omega)]
  exact block1035_get i

theorem block1036_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values1036[i.val]'(by rw [values1036_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (201 + i.val) = _
  rw [node0073_0428, split_left 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0073_0265, split_right 169 node0073_0169 node0169_0265 (by omega)]
  rw [node0169_0265, split_right 201 block1035 node0201_0265 (by omega)]
  rw [node0201_0265, split_left 233 block1036 block1037 (by omega)]
  exact block1036_get i

theorem block1037_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values1037[i.val]'(by rw [values1037_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (233 + i.val) = _
  rw [node0073_0428, split_left 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0073_0265, split_right 169 node0073_0169 node0169_0265 (by omega)]
  rw [node0169_0265, split_right 201 block1035 node0201_0265 (by omega)]
  rw [node0201_0265, split_right 233 block1036 block1037 (by omega)]
  exact block1037_get i

theorem block1038_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values1038[i.val]'(by rw [values1038_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (265 + i.val) = _
  rw [node0073_0428, split_right 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0265_0428, split_left 361 node0265_0361 node0361_0428 (by omega)]
  rw [node0265_0361, split_left 297 block1038 node0297_0361 (by omega)]
  exact block1038_get i

theorem block1039_lookup (i : Fin 32) :
    lookup (297 + i.val) = some (values1039[i.val]'(by rw [values1039_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (297 + i.val) = _
  rw [node0073_0428, split_right 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0265_0428, split_left 361 node0265_0361 node0361_0428 (by omega)]
  rw [node0265_0361, split_right 297 block1038 node0297_0361 (by omega)]
  rw [node0297_0361, split_left 329 block1039 block1040 (by omega)]
  exact block1039_get i

theorem block1040_lookup (i : Fin 32) :
    lookup (329 + i.val) = some (values1040[i.val]'(by rw [values1040_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (329 + i.val) = _
  rw [node0073_0428, split_right 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0265_0428, split_left 361 node0265_0361 node0361_0428 (by omega)]
  rw [node0265_0361, split_right 297 block1038 node0297_0361 (by omega)]
  rw [node0297_0361, split_right 329 block1039 block1040 (by omega)]
  exact block1040_get i

theorem block1041_lookup (i : Fin 32) :
    lookup (361 + i.val) = some (values1041[i.val]'(by rw [values1041_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (361 + i.val) = _
  rw [node0073_0428, split_right 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0265_0428, split_right 361 node0265_0361 node0361_0428 (by omega)]
  rw [node0361_0428, split_left 393 block1041 node0393_0428 (by omega)]
  exact block1041_get i

theorem block1042_lookup (i : Fin 32) :
    lookup (393 + i.val) = some (values1042[i.val]'(by rw [values1042_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (393 + i.val) = _
  rw [node0073_0428, split_right 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0265_0428, split_right 361 node0265_0361 node0361_0428 (by omega)]
  rw [node0361_0428, split_right 393 block1041 node0393_0428 (by omega)]
  rw [node0393_0428, split_left 425 block1042 block1043 (by omega)]
  exact block1042_get i

theorem block1043_lookup (i : Fin 3) :
    lookup (425 + i.val) = some (values1043[i.val]'(by rw [values1043_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0073_0428 (425 + i.val) = _
  rw [node0073_0428, split_right 265 node0073_0265 node0265_0428 (by omega)]
  rw [node0265_0428, split_right 361 node0265_0361 node0361_0428 (by omega)]
  rw [node0361_0428, split_right 393 block1041 node0393_0428 (by omega)]
  rw [node0393_0428, split_right 425 block1042 block1043 (by omega)]
  exact block1043_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1032_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1032_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1033_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1033_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1034_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1034_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1035_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1035_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1036_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1036_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1037_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1037_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1038_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1038_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1039_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1039_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1040_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1040_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1041_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1041_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1042_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1042_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1043_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1043_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1032_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1033_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1034_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1035_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1036_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1037_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1038_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1039_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1040_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1041_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1042_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow074.block1043_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow074
