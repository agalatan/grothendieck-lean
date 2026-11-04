import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1020
import Grothe.UpperChaos.OriginalRow227TriangleData1021
import Grothe.UpperChaos.OriginalRow227TriangleData1022
import Grothe.UpperChaos.OriginalRow227TriangleData1023
import Grothe.UpperChaos.OriginalRow227TriangleData1024
import Grothe.UpperChaos.OriginalRow227TriangleData1025
import Grothe.UpperChaos.OriginalRow227TriangleData1026
import Grothe.UpperChaos.OriginalRow227TriangleData1027
import Grothe.UpperChaos.OriginalRow227TriangleData1028
import Grothe.UpperChaos.OriginalRow227TriangleData1029
import Grothe.UpperChaos.OriginalRow227TriangleData1030
import Grothe.UpperChaos.OriginalRow227TriangleData1031

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow073

open ConditionalTableLookup

def values1020 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1020.coefficient73_72,
  OriginalRow227TriangleData1020.coefficient73_73,
  OriginalRow227TriangleData1020.coefficient73_74,
  OriginalRow227TriangleData1020.coefficient73_75,
  OriginalRow227TriangleData1020.coefficient73_76,
  OriginalRow227TriangleData1020.coefficient73_77,
  OriginalRow227TriangleData1020.coefficient73_78,
  OriginalRow227TriangleData1020.coefficient73_79,
  OriginalRow227TriangleData1020.coefficient73_80,
  OriginalRow227TriangleData1020.coefficient73_81,
  OriginalRow227TriangleData1020.coefficient73_82,
  OriginalRow227TriangleData1020.coefficient73_83,
  OriginalRow227TriangleData1020.coefficient73_84,
  OriginalRow227TriangleData1020.coefficient73_85,
  OriginalRow227TriangleData1020.coefficient73_86,
  OriginalRow227TriangleData1020.coefficient73_87,
  OriginalRow227TriangleData1020.coefficient73_88,
  OriginalRow227TriangleData1020.coefficient73_89,
  OriginalRow227TriangleData1020.coefficient73_90,
  OriginalRow227TriangleData1020.coefficient73_91,
  OriginalRow227TriangleData1020.coefficient73_92,
  OriginalRow227TriangleData1020.coefficient73_93,
  OriginalRow227TriangleData1020.coefficient73_94,
  OriginalRow227TriangleData1020.coefficient73_95,
  OriginalRow227TriangleData1020.coefficient73_96,
  OriginalRow227TriangleData1020.coefficient73_97,
  OriginalRow227TriangleData1020.coefficient73_98,
  OriginalRow227TriangleData1020.coefficient73_99,
  OriginalRow227TriangleData1020.coefficient73_100,
  OriginalRow227TriangleData1020.coefficient73_101,
  OriginalRow227TriangleData1020.coefficient73_102,
  OriginalRow227TriangleData1020.coefficient73_103
]

theorem values1020_size : values1020.size = 32 := rfl

def block1020 : ℕ → Option IntervalDyadic := segment 72 values1020

theorem block1020_domain : ExactDomain block1020 72 104 := by
  simpa only [values1020_size] using segment_domain 72 values1020

theorem block1020_get (i : Fin 32) :
    block1020 (72 + i.val) = some (values1020[i.val]'(by rw [values1020_size]; exact i.isLt)) := by
  exact segment_get 72 values1020 ⟨i.val, by rw [values1020_size]; exact i.isLt⟩

def values1021 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1021.coefficient73_104,
  OriginalRow227TriangleData1021.coefficient73_105,
  OriginalRow227TriangleData1021.coefficient73_106,
  OriginalRow227TriangleData1021.coefficient73_107,
  OriginalRow227TriangleData1021.coefficient73_108,
  OriginalRow227TriangleData1021.coefficient73_109,
  OriginalRow227TriangleData1021.coefficient73_110,
  OriginalRow227TriangleData1021.coefficient73_111,
  OriginalRow227TriangleData1021.coefficient73_112,
  OriginalRow227TriangleData1021.coefficient73_113,
  OriginalRow227TriangleData1021.coefficient73_114,
  OriginalRow227TriangleData1021.coefficient73_115,
  OriginalRow227TriangleData1021.coefficient73_116,
  OriginalRow227TriangleData1021.coefficient73_117,
  OriginalRow227TriangleData1021.coefficient73_118,
  OriginalRow227TriangleData1021.coefficient73_119,
  OriginalRow227TriangleData1021.coefficient73_120,
  OriginalRow227TriangleData1021.coefficient73_121,
  OriginalRow227TriangleData1021.coefficient73_122,
  OriginalRow227TriangleData1021.coefficient73_123,
  OriginalRow227TriangleData1021.coefficient73_124,
  OriginalRow227TriangleData1021.coefficient73_125,
  OriginalRow227TriangleData1021.coefficient73_126,
  OriginalRow227TriangleData1021.coefficient73_127,
  OriginalRow227TriangleData1021.coefficient73_128,
  OriginalRow227TriangleData1021.coefficient73_129,
  OriginalRow227TriangleData1021.coefficient73_130,
  OriginalRow227TriangleData1021.coefficient73_131,
  OriginalRow227TriangleData1021.coefficient73_132,
  OriginalRow227TriangleData1021.coefficient73_133,
  OriginalRow227TriangleData1021.coefficient73_134,
  OriginalRow227TriangleData1021.coefficient73_135
]

theorem values1021_size : values1021.size = 32 := rfl

def block1021 : ℕ → Option IntervalDyadic := segment 104 values1021

theorem block1021_domain : ExactDomain block1021 104 136 := by
  simpa only [values1021_size] using segment_domain 104 values1021

theorem block1021_get (i : Fin 32) :
    block1021 (104 + i.val) = some (values1021[i.val]'(by rw [values1021_size]; exact i.isLt)) := by
  exact segment_get 104 values1021 ⟨i.val, by rw [values1021_size]; exact i.isLt⟩

def values1022 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1022.coefficient73_136,
  OriginalRow227TriangleData1022.coefficient73_137,
  OriginalRow227TriangleData1022.coefficient73_138,
  OriginalRow227TriangleData1022.coefficient73_139,
  OriginalRow227TriangleData1022.coefficient73_140,
  OriginalRow227TriangleData1022.coefficient73_141,
  OriginalRow227TriangleData1022.coefficient73_142,
  OriginalRow227TriangleData1022.coefficient73_143,
  OriginalRow227TriangleData1022.coefficient73_144,
  OriginalRow227TriangleData1022.coefficient73_145,
  OriginalRow227TriangleData1022.coefficient73_146,
  OriginalRow227TriangleData1022.coefficient73_147,
  OriginalRow227TriangleData1022.coefficient73_148,
  OriginalRow227TriangleData1022.coefficient73_149,
  OriginalRow227TriangleData1022.coefficient73_150,
  OriginalRow227TriangleData1022.coefficient73_151,
  OriginalRow227TriangleData1022.coefficient73_152,
  OriginalRow227TriangleData1022.coefficient73_153,
  OriginalRow227TriangleData1022.coefficient73_154,
  OriginalRow227TriangleData1022.coefficient73_155,
  OriginalRow227TriangleData1022.coefficient73_156,
  OriginalRow227TriangleData1022.coefficient73_157,
  OriginalRow227TriangleData1022.coefficient73_158,
  OriginalRow227TriangleData1022.coefficient73_159,
  OriginalRow227TriangleData1022.coefficient73_160,
  OriginalRow227TriangleData1022.coefficient73_161,
  OriginalRow227TriangleData1022.coefficient73_162,
  OriginalRow227TriangleData1022.coefficient73_163,
  OriginalRow227TriangleData1022.coefficient73_164,
  OriginalRow227TriangleData1022.coefficient73_165,
  OriginalRow227TriangleData1022.coefficient73_166,
  OriginalRow227TriangleData1022.coefficient73_167
]

theorem values1022_size : values1022.size = 32 := rfl

def block1022 : ℕ → Option IntervalDyadic := segment 136 values1022

theorem block1022_domain : ExactDomain block1022 136 168 := by
  simpa only [values1022_size] using segment_domain 136 values1022

theorem block1022_get (i : Fin 32) :
    block1022 (136 + i.val) = some (values1022[i.val]'(by rw [values1022_size]; exact i.isLt)) := by
  exact segment_get 136 values1022 ⟨i.val, by rw [values1022_size]; exact i.isLt⟩

def values1023 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1023.coefficient73_168,
  OriginalRow227TriangleData1023.coefficient73_169,
  OriginalRow227TriangleData1023.coefficient73_170,
  OriginalRow227TriangleData1023.coefficient73_171,
  OriginalRow227TriangleData1023.coefficient73_172,
  OriginalRow227TriangleData1023.coefficient73_173,
  OriginalRow227TriangleData1023.coefficient73_174,
  OriginalRow227TriangleData1023.coefficient73_175,
  OriginalRow227TriangleData1023.coefficient73_176,
  OriginalRow227TriangleData1023.coefficient73_177,
  OriginalRow227TriangleData1023.coefficient73_178,
  OriginalRow227TriangleData1023.coefficient73_179,
  OriginalRow227TriangleData1023.coefficient73_180,
  OriginalRow227TriangleData1023.coefficient73_181,
  OriginalRow227TriangleData1023.coefficient73_182,
  OriginalRow227TriangleData1023.coefficient73_183,
  OriginalRow227TriangleData1023.coefficient73_184,
  OriginalRow227TriangleData1023.coefficient73_185,
  OriginalRow227TriangleData1023.coefficient73_186,
  OriginalRow227TriangleData1023.coefficient73_187,
  OriginalRow227TriangleData1023.coefficient73_188,
  OriginalRow227TriangleData1023.coefficient73_189,
  OriginalRow227TriangleData1023.coefficient73_190,
  OriginalRow227TriangleData1023.coefficient73_191,
  OriginalRow227TriangleData1023.coefficient73_192,
  OriginalRow227TriangleData1023.coefficient73_193,
  OriginalRow227TriangleData1023.coefficient73_194,
  OriginalRow227TriangleData1023.coefficient73_195,
  OriginalRow227TriangleData1023.coefficient73_196,
  OriginalRow227TriangleData1023.coefficient73_197,
  OriginalRow227TriangleData1023.coefficient73_198,
  OriginalRow227TriangleData1023.coefficient73_199
]

theorem values1023_size : values1023.size = 32 := rfl

def block1023 : ℕ → Option IntervalDyadic := segment 168 values1023

theorem block1023_domain : ExactDomain block1023 168 200 := by
  simpa only [values1023_size] using segment_domain 168 values1023

theorem block1023_get (i : Fin 32) :
    block1023 (168 + i.val) = some (values1023[i.val]'(by rw [values1023_size]; exact i.isLt)) := by
  exact segment_get 168 values1023 ⟨i.val, by rw [values1023_size]; exact i.isLt⟩

def values1024 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1024.coefficient73_200,
  OriginalRow227TriangleData1024.coefficient73_201,
  OriginalRow227TriangleData1024.coefficient73_202,
  OriginalRow227TriangleData1024.coefficient73_203,
  OriginalRow227TriangleData1024.coefficient73_204,
  OriginalRow227TriangleData1024.coefficient73_205,
  OriginalRow227TriangleData1024.coefficient73_206,
  OriginalRow227TriangleData1024.coefficient73_207,
  OriginalRow227TriangleData1024.coefficient73_208,
  OriginalRow227TriangleData1024.coefficient73_209,
  OriginalRow227TriangleData1024.coefficient73_210,
  OriginalRow227TriangleData1024.coefficient73_211,
  OriginalRow227TriangleData1024.coefficient73_212,
  OriginalRow227TriangleData1024.coefficient73_213,
  OriginalRow227TriangleData1024.coefficient73_214,
  OriginalRow227TriangleData1024.coefficient73_215,
  OriginalRow227TriangleData1024.coefficient73_216,
  OriginalRow227TriangleData1024.coefficient73_217,
  OriginalRow227TriangleData1024.coefficient73_218,
  OriginalRow227TriangleData1024.coefficient73_219,
  OriginalRow227TriangleData1024.coefficient73_220,
  OriginalRow227TriangleData1024.coefficient73_221,
  OriginalRow227TriangleData1024.coefficient73_222,
  OriginalRow227TriangleData1024.coefficient73_223,
  OriginalRow227TriangleData1024.coefficient73_224,
  OriginalRow227TriangleData1024.coefficient73_225,
  OriginalRow227TriangleData1024.coefficient73_226,
  OriginalRow227TriangleData1024.coefficient73_227,
  OriginalRow227TriangleData1024.coefficient73_228,
  OriginalRow227TriangleData1024.coefficient73_229,
  OriginalRow227TriangleData1024.coefficient73_230,
  OriginalRow227TriangleData1024.coefficient73_231
]

theorem values1024_size : values1024.size = 32 := rfl

def block1024 : ℕ → Option IntervalDyadic := segment 200 values1024

theorem block1024_domain : ExactDomain block1024 200 232 := by
  simpa only [values1024_size] using segment_domain 200 values1024

theorem block1024_get (i : Fin 32) :
    block1024 (200 + i.val) = some (values1024[i.val]'(by rw [values1024_size]; exact i.isLt)) := by
  exact segment_get 200 values1024 ⟨i.val, by rw [values1024_size]; exact i.isLt⟩

def values1025 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1025.coefficient73_232,
  OriginalRow227TriangleData1025.coefficient73_233,
  OriginalRow227TriangleData1025.coefficient73_234,
  OriginalRow227TriangleData1025.coefficient73_235,
  OriginalRow227TriangleData1025.coefficient73_236,
  OriginalRow227TriangleData1025.coefficient73_237,
  OriginalRow227TriangleData1025.coefficient73_238,
  OriginalRow227TriangleData1025.coefficient73_239,
  OriginalRow227TriangleData1025.coefficient73_240,
  OriginalRow227TriangleData1025.coefficient73_241,
  OriginalRow227TriangleData1025.coefficient73_242,
  OriginalRow227TriangleData1025.coefficient73_243,
  OriginalRow227TriangleData1025.coefficient73_244,
  OriginalRow227TriangleData1025.coefficient73_245,
  OriginalRow227TriangleData1025.coefficient73_246,
  OriginalRow227TriangleData1025.coefficient73_247,
  OriginalRow227TriangleData1025.coefficient73_248,
  OriginalRow227TriangleData1025.coefficient73_249,
  OriginalRow227TriangleData1025.coefficient73_250,
  OriginalRow227TriangleData1025.coefficient73_251,
  OriginalRow227TriangleData1025.coefficient73_252,
  OriginalRow227TriangleData1025.coefficient73_253,
  OriginalRow227TriangleData1025.coefficient73_254,
  OriginalRow227TriangleData1025.coefficient73_255,
  OriginalRow227TriangleData1025.coefficient73_256,
  OriginalRow227TriangleData1025.coefficient73_257,
  OriginalRow227TriangleData1025.coefficient73_258,
  OriginalRow227TriangleData1025.coefficient73_259,
  OriginalRow227TriangleData1025.coefficient73_260,
  OriginalRow227TriangleData1025.coefficient73_261,
  OriginalRow227TriangleData1025.coefficient73_262,
  OriginalRow227TriangleData1025.coefficient73_263
]

theorem values1025_size : values1025.size = 32 := rfl

def block1025 : ℕ → Option IntervalDyadic := segment 232 values1025

theorem block1025_domain : ExactDomain block1025 232 264 := by
  simpa only [values1025_size] using segment_domain 232 values1025

theorem block1025_get (i : Fin 32) :
    block1025 (232 + i.val) = some (values1025[i.val]'(by rw [values1025_size]; exact i.isLt)) := by
  exact segment_get 232 values1025 ⟨i.val, by rw [values1025_size]; exact i.isLt⟩

def values1026 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1026.coefficient73_264,
  OriginalRow227TriangleData1026.coefficient73_265,
  OriginalRow227TriangleData1026.coefficient73_266,
  OriginalRow227TriangleData1026.coefficient73_267,
  OriginalRow227TriangleData1026.coefficient73_268,
  OriginalRow227TriangleData1026.coefficient73_269,
  OriginalRow227TriangleData1026.coefficient73_270,
  OriginalRow227TriangleData1026.coefficient73_271,
  OriginalRow227TriangleData1026.coefficient73_272,
  OriginalRow227TriangleData1026.coefficient73_273,
  OriginalRow227TriangleData1026.coefficient73_274,
  OriginalRow227TriangleData1026.coefficient73_275,
  OriginalRow227TriangleData1026.coefficient73_276,
  OriginalRow227TriangleData1026.coefficient73_277,
  OriginalRow227TriangleData1026.coefficient73_278,
  OriginalRow227TriangleData1026.coefficient73_279,
  OriginalRow227TriangleData1026.coefficient73_280,
  OriginalRow227TriangleData1026.coefficient73_281,
  OriginalRow227TriangleData1026.coefficient73_282,
  OriginalRow227TriangleData1026.coefficient73_283,
  OriginalRow227TriangleData1026.coefficient73_284,
  OriginalRow227TriangleData1026.coefficient73_285,
  OriginalRow227TriangleData1026.coefficient73_286,
  OriginalRow227TriangleData1026.coefficient73_287,
  OriginalRow227TriangleData1026.coefficient73_288,
  OriginalRow227TriangleData1026.coefficient73_289,
  OriginalRow227TriangleData1026.coefficient73_290,
  OriginalRow227TriangleData1026.coefficient73_291,
  OriginalRow227TriangleData1026.coefficient73_292,
  OriginalRow227TriangleData1026.coefficient73_293,
  OriginalRow227TriangleData1026.coefficient73_294,
  OriginalRow227TriangleData1026.coefficient73_295
]

theorem values1026_size : values1026.size = 32 := rfl

def block1026 : ℕ → Option IntervalDyadic := segment 264 values1026

theorem block1026_domain : ExactDomain block1026 264 296 := by
  simpa only [values1026_size] using segment_domain 264 values1026

theorem block1026_get (i : Fin 32) :
    block1026 (264 + i.val) = some (values1026[i.val]'(by rw [values1026_size]; exact i.isLt)) := by
  exact segment_get 264 values1026 ⟨i.val, by rw [values1026_size]; exact i.isLt⟩

def values1027 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1027.coefficient73_296,
  OriginalRow227TriangleData1027.coefficient73_297,
  OriginalRow227TriangleData1027.coefficient73_298,
  OriginalRow227TriangleData1027.coefficient73_299,
  OriginalRow227TriangleData1027.coefficient73_300,
  OriginalRow227TriangleData1027.coefficient73_301,
  OriginalRow227TriangleData1027.coefficient73_302,
  OriginalRow227TriangleData1027.coefficient73_303,
  OriginalRow227TriangleData1027.coefficient73_304,
  OriginalRow227TriangleData1027.coefficient73_305,
  OriginalRow227TriangleData1027.coefficient73_306,
  OriginalRow227TriangleData1027.coefficient73_307,
  OriginalRow227TriangleData1027.coefficient73_308,
  OriginalRow227TriangleData1027.coefficient73_309,
  OriginalRow227TriangleData1027.coefficient73_310,
  OriginalRow227TriangleData1027.coefficient73_311,
  OriginalRow227TriangleData1027.coefficient73_312,
  OriginalRow227TriangleData1027.coefficient73_313,
  OriginalRow227TriangleData1027.coefficient73_314,
  OriginalRow227TriangleData1027.coefficient73_315,
  OriginalRow227TriangleData1027.coefficient73_316,
  OriginalRow227TriangleData1027.coefficient73_317,
  OriginalRow227TriangleData1027.coefficient73_318,
  OriginalRow227TriangleData1027.coefficient73_319,
  OriginalRow227TriangleData1027.coefficient73_320,
  OriginalRow227TriangleData1027.coefficient73_321,
  OriginalRow227TriangleData1027.coefficient73_322,
  OriginalRow227TriangleData1027.coefficient73_323,
  OriginalRow227TriangleData1027.coefficient73_324,
  OriginalRow227TriangleData1027.coefficient73_325,
  OriginalRow227TriangleData1027.coefficient73_326,
  OriginalRow227TriangleData1027.coefficient73_327
]

theorem values1027_size : values1027.size = 32 := rfl

def block1027 : ℕ → Option IntervalDyadic := segment 296 values1027

theorem block1027_domain : ExactDomain block1027 296 328 := by
  simpa only [values1027_size] using segment_domain 296 values1027

theorem block1027_get (i : Fin 32) :
    block1027 (296 + i.val) = some (values1027[i.val]'(by rw [values1027_size]; exact i.isLt)) := by
  exact segment_get 296 values1027 ⟨i.val, by rw [values1027_size]; exact i.isLt⟩

def values1028 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1028.coefficient73_328,
  OriginalRow227TriangleData1028.coefficient73_329,
  OriginalRow227TriangleData1028.coefficient73_330,
  OriginalRow227TriangleData1028.coefficient73_331,
  OriginalRow227TriangleData1028.coefficient73_332,
  OriginalRow227TriangleData1028.coefficient73_333,
  OriginalRow227TriangleData1028.coefficient73_334,
  OriginalRow227TriangleData1028.coefficient73_335,
  OriginalRow227TriangleData1028.coefficient73_336,
  OriginalRow227TriangleData1028.coefficient73_337,
  OriginalRow227TriangleData1028.coefficient73_338,
  OriginalRow227TriangleData1028.coefficient73_339,
  OriginalRow227TriangleData1028.coefficient73_340,
  OriginalRow227TriangleData1028.coefficient73_341,
  OriginalRow227TriangleData1028.coefficient73_342,
  OriginalRow227TriangleData1028.coefficient73_343,
  OriginalRow227TriangleData1028.coefficient73_344,
  OriginalRow227TriangleData1028.coefficient73_345,
  OriginalRow227TriangleData1028.coefficient73_346,
  OriginalRow227TriangleData1028.coefficient73_347,
  OriginalRow227TriangleData1028.coefficient73_348,
  OriginalRow227TriangleData1028.coefficient73_349,
  OriginalRow227TriangleData1028.coefficient73_350,
  OriginalRow227TriangleData1028.coefficient73_351,
  OriginalRow227TriangleData1028.coefficient73_352,
  OriginalRow227TriangleData1028.coefficient73_353,
  OriginalRow227TriangleData1028.coefficient73_354,
  OriginalRow227TriangleData1028.coefficient73_355,
  OriginalRow227TriangleData1028.coefficient73_356,
  OriginalRow227TriangleData1028.coefficient73_357,
  OriginalRow227TriangleData1028.coefficient73_358,
  OriginalRow227TriangleData1028.coefficient73_359
]

theorem values1028_size : values1028.size = 32 := rfl

def block1028 : ℕ → Option IntervalDyadic := segment 328 values1028

theorem block1028_domain : ExactDomain block1028 328 360 := by
  simpa only [values1028_size] using segment_domain 328 values1028

theorem block1028_get (i : Fin 32) :
    block1028 (328 + i.val) = some (values1028[i.val]'(by rw [values1028_size]; exact i.isLt)) := by
  exact segment_get 328 values1028 ⟨i.val, by rw [values1028_size]; exact i.isLt⟩

def values1029 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1029.coefficient73_360,
  OriginalRow227TriangleData1029.coefficient73_361,
  OriginalRow227TriangleData1029.coefficient73_362,
  OriginalRow227TriangleData1029.coefficient73_363,
  OriginalRow227TriangleData1029.coefficient73_364,
  OriginalRow227TriangleData1029.coefficient73_365,
  OriginalRow227TriangleData1029.coefficient73_366,
  OriginalRow227TriangleData1029.coefficient73_367,
  OriginalRow227TriangleData1029.coefficient73_368,
  OriginalRow227TriangleData1029.coefficient73_369,
  OriginalRow227TriangleData1029.coefficient73_370,
  OriginalRow227TriangleData1029.coefficient73_371,
  OriginalRow227TriangleData1029.coefficient73_372,
  OriginalRow227TriangleData1029.coefficient73_373,
  OriginalRow227TriangleData1029.coefficient73_374,
  OriginalRow227TriangleData1029.coefficient73_375,
  OriginalRow227TriangleData1029.coefficient73_376,
  OriginalRow227TriangleData1029.coefficient73_377,
  OriginalRow227TriangleData1029.coefficient73_378,
  OriginalRow227TriangleData1029.coefficient73_379,
  OriginalRow227TriangleData1029.coefficient73_380,
  OriginalRow227TriangleData1029.coefficient73_381,
  OriginalRow227TriangleData1029.coefficient73_382,
  OriginalRow227TriangleData1029.coefficient73_383,
  OriginalRow227TriangleData1029.coefficient73_384,
  OriginalRow227TriangleData1029.coefficient73_385,
  OriginalRow227TriangleData1029.coefficient73_386,
  OriginalRow227TriangleData1029.coefficient73_387,
  OriginalRow227TriangleData1029.coefficient73_388,
  OriginalRow227TriangleData1029.coefficient73_389,
  OriginalRow227TriangleData1029.coefficient73_390,
  OriginalRow227TriangleData1029.coefficient73_391
]

theorem values1029_size : values1029.size = 32 := rfl

def block1029 : ℕ → Option IntervalDyadic := segment 360 values1029

theorem block1029_domain : ExactDomain block1029 360 392 := by
  simpa only [values1029_size] using segment_domain 360 values1029

theorem block1029_get (i : Fin 32) :
    block1029 (360 + i.val) = some (values1029[i.val]'(by rw [values1029_size]; exact i.isLt)) := by
  exact segment_get 360 values1029 ⟨i.val, by rw [values1029_size]; exact i.isLt⟩

def values1030 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1030.coefficient73_392,
  OriginalRow227TriangleData1030.coefficient73_393,
  OriginalRow227TriangleData1030.coefficient73_394,
  OriginalRow227TriangleData1030.coefficient73_395,
  OriginalRow227TriangleData1030.coefficient73_396,
  OriginalRow227TriangleData1030.coefficient73_397,
  OriginalRow227TriangleData1030.coefficient73_398,
  OriginalRow227TriangleData1030.coefficient73_399,
  OriginalRow227TriangleData1030.coefficient73_400,
  OriginalRow227TriangleData1030.coefficient73_401,
  OriginalRow227TriangleData1030.coefficient73_402,
  OriginalRow227TriangleData1030.coefficient73_403,
  OriginalRow227TriangleData1030.coefficient73_404,
  OriginalRow227TriangleData1030.coefficient73_405,
  OriginalRow227TriangleData1030.coefficient73_406,
  OriginalRow227TriangleData1030.coefficient73_407,
  OriginalRow227TriangleData1030.coefficient73_408,
  OriginalRow227TriangleData1030.coefficient73_409,
  OriginalRow227TriangleData1030.coefficient73_410,
  OriginalRow227TriangleData1030.coefficient73_411,
  OriginalRow227TriangleData1030.coefficient73_412,
  OriginalRow227TriangleData1030.coefficient73_413,
  OriginalRow227TriangleData1030.coefficient73_414,
  OriginalRow227TriangleData1030.coefficient73_415,
  OriginalRow227TriangleData1030.coefficient73_416,
  OriginalRow227TriangleData1030.coefficient73_417,
  OriginalRow227TriangleData1030.coefficient73_418,
  OriginalRow227TriangleData1030.coefficient73_419,
  OriginalRow227TriangleData1030.coefficient73_420,
  OriginalRow227TriangleData1030.coefficient73_421,
  OriginalRow227TriangleData1030.coefficient73_422,
  OriginalRow227TriangleData1030.coefficient73_423
]

theorem values1030_size : values1030.size = 32 := rfl

def block1030 : ℕ → Option IntervalDyadic := segment 392 values1030

theorem block1030_domain : ExactDomain block1030 392 424 := by
  simpa only [values1030_size] using segment_domain 392 values1030

theorem block1030_get (i : Fin 32) :
    block1030 (392 + i.val) = some (values1030[i.val]'(by rw [values1030_size]; exact i.isLt)) := by
  exact segment_get 392 values1030 ⟨i.val, by rw [values1030_size]; exact i.isLt⟩

def values1031 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1031.coefficient73_424,
  OriginalRow227TriangleData1031.coefficient73_425,
  OriginalRow227TriangleData1031.coefficient73_426,
  OriginalRow227TriangleData1031.coefficient73_427,
  OriginalRow227TriangleData1031.coefficient73_428
]

theorem values1031_size : values1031.size = 5 := rfl

def block1031 : ℕ → Option IntervalDyadic := segment 424 values1031

theorem block1031_domain : ExactDomain block1031 424 429 := by
  simpa only [values1031_size] using segment_domain 424 values1031

theorem block1031_get (i : Fin 5) :
    block1031 (424 + i.val) = some (values1031[i.val]'(by rw [values1031_size]; exact i.isLt)) := by
  exact segment_get 424 values1031 ⟨i.val, by rw [values1031_size]; exact i.isLt⟩

def node0104_0168 : ℕ → Option IntervalDyadic := split 136 block1021 block1022

theorem node0104_0168_domain : ExactDomain node0104_0168 104 168 := by
  exact split_domain (by decide) (by decide) block1021_domain block1022_domain

def node0072_0168 : ℕ → Option IntervalDyadic := split 104 block1020 node0104_0168

theorem node0072_0168_domain : ExactDomain node0072_0168 72 168 := by
  exact split_domain (by decide) (by decide) block1020_domain node0104_0168_domain

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block1024 block1025

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block1024_domain block1025_domain

def node0168_0264 : ℕ → Option IntervalDyadic := split 200 block1023 node0200_0264

theorem node0168_0264_domain : ExactDomain node0168_0264 168 264 := by
  exact split_domain (by decide) (by decide) block1023_domain node0200_0264_domain

def node0072_0264 : ℕ → Option IntervalDyadic := split 168 node0072_0168 node0168_0264

theorem node0072_0264_domain : ExactDomain node0072_0264 72 264 := by
  exact split_domain (by decide) (by decide) node0072_0168_domain node0168_0264_domain

def node0296_0360 : ℕ → Option IntervalDyadic := split 328 block1027 block1028

theorem node0296_0360_domain : ExactDomain node0296_0360 296 360 := by
  exact split_domain (by decide) (by decide) block1027_domain block1028_domain

def node0264_0360 : ℕ → Option IntervalDyadic := split 296 block1026 node0296_0360

theorem node0264_0360_domain : ExactDomain node0264_0360 264 360 := by
  exact split_domain (by decide) (by decide) block1026_domain node0296_0360_domain

def node0392_0429 : ℕ → Option IntervalDyadic := split 424 block1030 block1031

theorem node0392_0429_domain : ExactDomain node0392_0429 392 429 := by
  exact split_domain (by decide) (by decide) block1030_domain block1031_domain

def node0360_0429 : ℕ → Option IntervalDyadic := split 392 block1029 node0392_0429

theorem node0360_0429_domain : ExactDomain node0360_0429 360 429 := by
  exact split_domain (by decide) (by decide) block1029_domain node0392_0429_domain

def node0264_0429 : ℕ → Option IntervalDyadic := split 360 node0264_0360 node0360_0429

theorem node0264_0429_domain : ExactDomain node0264_0429 264 429 := by
  exact split_domain (by decide) (by decide) node0264_0360_domain node0360_0429_domain

def node0072_0429 : ℕ → Option IntervalDyadic := split 264 node0072_0264 node0264_0429

theorem node0072_0429_domain : ExactDomain node0072_0429 72 429 := by
  exact split_domain (by decide) (by decide) node0072_0264_domain node0264_0429_domain

def lookup : ℕ → Option IntervalDyadic := node0072_0429

theorem lookup_domain : ExactDomain lookup 72 429 :=
  node0072_0429_domain

theorem block1020_lookup (i : Fin 32) :
    lookup (72 + i.val) = some (values1020[i.val]'(by rw [values1020_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (72 + i.val) = _
  rw [node0072_0429, split_left 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0072_0264, split_left 168 node0072_0168 node0168_0264 (by omega)]
  rw [node0072_0168, split_left 104 block1020 node0104_0168 (by omega)]
  exact block1020_get i

theorem block1021_lookup (i : Fin 32) :
    lookup (104 + i.val) = some (values1021[i.val]'(by rw [values1021_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (104 + i.val) = _
  rw [node0072_0429, split_left 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0072_0264, split_left 168 node0072_0168 node0168_0264 (by omega)]
  rw [node0072_0168, split_right 104 block1020 node0104_0168 (by omega)]
  rw [node0104_0168, split_left 136 block1021 block1022 (by omega)]
  exact block1021_get i

theorem block1022_lookup (i : Fin 32) :
    lookup (136 + i.val) = some (values1022[i.val]'(by rw [values1022_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (136 + i.val) = _
  rw [node0072_0429, split_left 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0072_0264, split_left 168 node0072_0168 node0168_0264 (by omega)]
  rw [node0072_0168, split_right 104 block1020 node0104_0168 (by omega)]
  rw [node0104_0168, split_right 136 block1021 block1022 (by omega)]
  exact block1022_get i

theorem block1023_lookup (i : Fin 32) :
    lookup (168 + i.val) = some (values1023[i.val]'(by rw [values1023_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (168 + i.val) = _
  rw [node0072_0429, split_left 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0072_0264, split_right 168 node0072_0168 node0168_0264 (by omega)]
  rw [node0168_0264, split_left 200 block1023 node0200_0264 (by omega)]
  exact block1023_get i

theorem block1024_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values1024[i.val]'(by rw [values1024_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (200 + i.val) = _
  rw [node0072_0429, split_left 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0072_0264, split_right 168 node0072_0168 node0168_0264 (by omega)]
  rw [node0168_0264, split_right 200 block1023 node0200_0264 (by omega)]
  rw [node0200_0264, split_left 232 block1024 block1025 (by omega)]
  exact block1024_get i

theorem block1025_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values1025[i.val]'(by rw [values1025_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (232 + i.val) = _
  rw [node0072_0429, split_left 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0072_0264, split_right 168 node0072_0168 node0168_0264 (by omega)]
  rw [node0168_0264, split_right 200 block1023 node0200_0264 (by omega)]
  rw [node0200_0264, split_right 232 block1024 block1025 (by omega)]
  exact block1025_get i

theorem block1026_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values1026[i.val]'(by rw [values1026_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (264 + i.val) = _
  rw [node0072_0429, split_right 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0264_0429, split_left 360 node0264_0360 node0360_0429 (by omega)]
  rw [node0264_0360, split_left 296 block1026 node0296_0360 (by omega)]
  exact block1026_get i

theorem block1027_lookup (i : Fin 32) :
    lookup (296 + i.val) = some (values1027[i.val]'(by rw [values1027_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (296 + i.val) = _
  rw [node0072_0429, split_right 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0264_0429, split_left 360 node0264_0360 node0360_0429 (by omega)]
  rw [node0264_0360, split_right 296 block1026 node0296_0360 (by omega)]
  rw [node0296_0360, split_left 328 block1027 block1028 (by omega)]
  exact block1027_get i

theorem block1028_lookup (i : Fin 32) :
    lookup (328 + i.val) = some (values1028[i.val]'(by rw [values1028_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (328 + i.val) = _
  rw [node0072_0429, split_right 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0264_0429, split_left 360 node0264_0360 node0360_0429 (by omega)]
  rw [node0264_0360, split_right 296 block1026 node0296_0360 (by omega)]
  rw [node0296_0360, split_right 328 block1027 block1028 (by omega)]
  exact block1028_get i

theorem block1029_lookup (i : Fin 32) :
    lookup (360 + i.val) = some (values1029[i.val]'(by rw [values1029_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (360 + i.val) = _
  rw [node0072_0429, split_right 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0264_0429, split_right 360 node0264_0360 node0360_0429 (by omega)]
  rw [node0360_0429, split_left 392 block1029 node0392_0429 (by omega)]
  exact block1029_get i

theorem block1030_lookup (i : Fin 32) :
    lookup (392 + i.val) = some (values1030[i.val]'(by rw [values1030_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (392 + i.val) = _
  rw [node0072_0429, split_right 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0264_0429, split_right 360 node0264_0360 node0360_0429 (by omega)]
  rw [node0360_0429, split_right 392 block1029 node0392_0429 (by omega)]
  rw [node0392_0429, split_left 424 block1030 block1031 (by omega)]
  exact block1030_get i

theorem block1031_lookup (i : Fin 5) :
    lookup (424 + i.val) = some (values1031[i.val]'(by rw [values1031_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0072_0429 (424 + i.val) = _
  rw [node0072_0429, split_right 264 node0072_0264 node0264_0429 (by omega)]
  rw [node0264_0429, split_right 360 node0264_0360 node0360_0429 (by omega)]
  rw [node0360_0429, split_right 392 block1029 node0392_0429 (by omega)]
  rw [node0392_0429, split_right 424 block1030 block1031 (by omega)]
  exact block1031_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1020_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1020_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1021_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1021_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1022_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1022_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1023_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1023_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1024_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1024_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1025_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1025_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1026_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1026_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1027_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1027_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1028_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1028_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1029_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1029_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1030_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1030_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1031_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1031_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1020_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1021_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1022_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1023_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1024_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1025_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1026_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1027_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1028_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1029_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1030_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow073.block1031_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow073
