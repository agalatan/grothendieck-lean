import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1056
import Grothe.UpperChaos.OriginalRow227TriangleData1057
import Grothe.UpperChaos.OriginalRow227TriangleData1058
import Grothe.UpperChaos.OriginalRow227TriangleData1059
import Grothe.UpperChaos.OriginalRow227TriangleData1060
import Grothe.UpperChaos.OriginalRow227TriangleData1061
import Grothe.UpperChaos.OriginalRow227TriangleData1062
import Grothe.UpperChaos.OriginalRow227TriangleData1063
import Grothe.UpperChaos.OriginalRow227TriangleData1064
import Grothe.UpperChaos.OriginalRow227TriangleData1065
import Grothe.UpperChaos.OriginalRow227TriangleData1066

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow076

open ConditionalTableLookup

def values1056 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1056.coefficient76_75,
  OriginalRow227TriangleData1056.coefficient76_76,
  OriginalRow227TriangleData1056.coefficient76_77,
  OriginalRow227TriangleData1056.coefficient76_78,
  OriginalRow227TriangleData1056.coefficient76_79,
  OriginalRow227TriangleData1056.coefficient76_80,
  OriginalRow227TriangleData1056.coefficient76_81,
  OriginalRow227TriangleData1056.coefficient76_82,
  OriginalRow227TriangleData1056.coefficient76_83,
  OriginalRow227TriangleData1056.coefficient76_84,
  OriginalRow227TriangleData1056.coefficient76_85,
  OriginalRow227TriangleData1056.coefficient76_86,
  OriginalRow227TriangleData1056.coefficient76_87,
  OriginalRow227TriangleData1056.coefficient76_88,
  OriginalRow227TriangleData1056.coefficient76_89,
  OriginalRow227TriangleData1056.coefficient76_90,
  OriginalRow227TriangleData1056.coefficient76_91,
  OriginalRow227TriangleData1056.coefficient76_92,
  OriginalRow227TriangleData1056.coefficient76_93,
  OriginalRow227TriangleData1056.coefficient76_94,
  OriginalRow227TriangleData1056.coefficient76_95,
  OriginalRow227TriangleData1056.coefficient76_96,
  OriginalRow227TriangleData1056.coefficient76_97,
  OriginalRow227TriangleData1056.coefficient76_98,
  OriginalRow227TriangleData1056.coefficient76_99,
  OriginalRow227TriangleData1056.coefficient76_100,
  OriginalRow227TriangleData1056.coefficient76_101,
  OriginalRow227TriangleData1056.coefficient76_102,
  OriginalRow227TriangleData1056.coefficient76_103,
  OriginalRow227TriangleData1056.coefficient76_104,
  OriginalRow227TriangleData1056.coefficient76_105,
  OriginalRow227TriangleData1056.coefficient76_106
]

theorem values1056_size : values1056.size = 32 := rfl

def block1056 : ℕ → Option IntervalDyadic := segment 75 values1056

theorem block1056_domain : ExactDomain block1056 75 107 := by
  simpa only [values1056_size] using segment_domain 75 values1056

theorem block1056_get (i : Fin 32) :
    block1056 (75 + i.val) = some (values1056[i.val]'(by rw [values1056_size]; exact i.isLt)) := by
  exact segment_get 75 values1056 ⟨i.val, by rw [values1056_size]; exact i.isLt⟩

def values1057 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1057.coefficient76_107,
  OriginalRow227TriangleData1057.coefficient76_108,
  OriginalRow227TriangleData1057.coefficient76_109,
  OriginalRow227TriangleData1057.coefficient76_110,
  OriginalRow227TriangleData1057.coefficient76_111,
  OriginalRow227TriangleData1057.coefficient76_112,
  OriginalRow227TriangleData1057.coefficient76_113,
  OriginalRow227TriangleData1057.coefficient76_114,
  OriginalRow227TriangleData1057.coefficient76_115,
  OriginalRow227TriangleData1057.coefficient76_116,
  OriginalRow227TriangleData1057.coefficient76_117,
  OriginalRow227TriangleData1057.coefficient76_118,
  OriginalRow227TriangleData1057.coefficient76_119,
  OriginalRow227TriangleData1057.coefficient76_120,
  OriginalRow227TriangleData1057.coefficient76_121,
  OriginalRow227TriangleData1057.coefficient76_122,
  OriginalRow227TriangleData1057.coefficient76_123,
  OriginalRow227TriangleData1057.coefficient76_124,
  OriginalRow227TriangleData1057.coefficient76_125,
  OriginalRow227TriangleData1057.coefficient76_126,
  OriginalRow227TriangleData1057.coefficient76_127,
  OriginalRow227TriangleData1057.coefficient76_128,
  OriginalRow227TriangleData1057.coefficient76_129,
  OriginalRow227TriangleData1057.coefficient76_130,
  OriginalRow227TriangleData1057.coefficient76_131,
  OriginalRow227TriangleData1057.coefficient76_132,
  OriginalRow227TriangleData1057.coefficient76_133,
  OriginalRow227TriangleData1057.coefficient76_134,
  OriginalRow227TriangleData1057.coefficient76_135,
  OriginalRow227TriangleData1057.coefficient76_136,
  OriginalRow227TriangleData1057.coefficient76_137,
  OriginalRow227TriangleData1057.coefficient76_138
]

theorem values1057_size : values1057.size = 32 := rfl

def block1057 : ℕ → Option IntervalDyadic := segment 107 values1057

theorem block1057_domain : ExactDomain block1057 107 139 := by
  simpa only [values1057_size] using segment_domain 107 values1057

theorem block1057_get (i : Fin 32) :
    block1057 (107 + i.val) = some (values1057[i.val]'(by rw [values1057_size]; exact i.isLt)) := by
  exact segment_get 107 values1057 ⟨i.val, by rw [values1057_size]; exact i.isLt⟩

def values1058 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1058.coefficient76_139,
  OriginalRow227TriangleData1058.coefficient76_140,
  OriginalRow227TriangleData1058.coefficient76_141,
  OriginalRow227TriangleData1058.coefficient76_142,
  OriginalRow227TriangleData1058.coefficient76_143,
  OriginalRow227TriangleData1058.coefficient76_144,
  OriginalRow227TriangleData1058.coefficient76_145,
  OriginalRow227TriangleData1058.coefficient76_146,
  OriginalRow227TriangleData1058.coefficient76_147,
  OriginalRow227TriangleData1058.coefficient76_148,
  OriginalRow227TriangleData1058.coefficient76_149,
  OriginalRow227TriangleData1058.coefficient76_150,
  OriginalRow227TriangleData1058.coefficient76_151,
  OriginalRow227TriangleData1058.coefficient76_152,
  OriginalRow227TriangleData1058.coefficient76_153,
  OriginalRow227TriangleData1058.coefficient76_154,
  OriginalRow227TriangleData1058.coefficient76_155,
  OriginalRow227TriangleData1058.coefficient76_156,
  OriginalRow227TriangleData1058.coefficient76_157,
  OriginalRow227TriangleData1058.coefficient76_158,
  OriginalRow227TriangleData1058.coefficient76_159,
  OriginalRow227TriangleData1058.coefficient76_160,
  OriginalRow227TriangleData1058.coefficient76_161,
  OriginalRow227TriangleData1058.coefficient76_162,
  OriginalRow227TriangleData1058.coefficient76_163,
  OriginalRow227TriangleData1058.coefficient76_164,
  OriginalRow227TriangleData1058.coefficient76_165,
  OriginalRow227TriangleData1058.coefficient76_166,
  OriginalRow227TriangleData1058.coefficient76_167,
  OriginalRow227TriangleData1058.coefficient76_168,
  OriginalRow227TriangleData1058.coefficient76_169,
  OriginalRow227TriangleData1058.coefficient76_170
]

theorem values1058_size : values1058.size = 32 := rfl

def block1058 : ℕ → Option IntervalDyadic := segment 139 values1058

theorem block1058_domain : ExactDomain block1058 139 171 := by
  simpa only [values1058_size] using segment_domain 139 values1058

theorem block1058_get (i : Fin 32) :
    block1058 (139 + i.val) = some (values1058[i.val]'(by rw [values1058_size]; exact i.isLt)) := by
  exact segment_get 139 values1058 ⟨i.val, by rw [values1058_size]; exact i.isLt⟩

def values1059 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1059.coefficient76_171,
  OriginalRow227TriangleData1059.coefficient76_172,
  OriginalRow227TriangleData1059.coefficient76_173,
  OriginalRow227TriangleData1059.coefficient76_174,
  OriginalRow227TriangleData1059.coefficient76_175,
  OriginalRow227TriangleData1059.coefficient76_176,
  OriginalRow227TriangleData1059.coefficient76_177,
  OriginalRow227TriangleData1059.coefficient76_178,
  OriginalRow227TriangleData1059.coefficient76_179,
  OriginalRow227TriangleData1059.coefficient76_180,
  OriginalRow227TriangleData1059.coefficient76_181,
  OriginalRow227TriangleData1059.coefficient76_182,
  OriginalRow227TriangleData1059.coefficient76_183,
  OriginalRow227TriangleData1059.coefficient76_184,
  OriginalRow227TriangleData1059.coefficient76_185,
  OriginalRow227TriangleData1059.coefficient76_186,
  OriginalRow227TriangleData1059.coefficient76_187,
  OriginalRow227TriangleData1059.coefficient76_188,
  OriginalRow227TriangleData1059.coefficient76_189,
  OriginalRow227TriangleData1059.coefficient76_190,
  OriginalRow227TriangleData1059.coefficient76_191,
  OriginalRow227TriangleData1059.coefficient76_192,
  OriginalRow227TriangleData1059.coefficient76_193,
  OriginalRow227TriangleData1059.coefficient76_194,
  OriginalRow227TriangleData1059.coefficient76_195,
  OriginalRow227TriangleData1059.coefficient76_196,
  OriginalRow227TriangleData1059.coefficient76_197,
  OriginalRow227TriangleData1059.coefficient76_198,
  OriginalRow227TriangleData1059.coefficient76_199,
  OriginalRow227TriangleData1059.coefficient76_200,
  OriginalRow227TriangleData1059.coefficient76_201,
  OriginalRow227TriangleData1059.coefficient76_202
]

theorem values1059_size : values1059.size = 32 := rfl

def block1059 : ℕ → Option IntervalDyadic := segment 171 values1059

theorem block1059_domain : ExactDomain block1059 171 203 := by
  simpa only [values1059_size] using segment_domain 171 values1059

theorem block1059_get (i : Fin 32) :
    block1059 (171 + i.val) = some (values1059[i.val]'(by rw [values1059_size]; exact i.isLt)) := by
  exact segment_get 171 values1059 ⟨i.val, by rw [values1059_size]; exact i.isLt⟩

def values1060 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1060.coefficient76_203,
  OriginalRow227TriangleData1060.coefficient76_204,
  OriginalRow227TriangleData1060.coefficient76_205,
  OriginalRow227TriangleData1060.coefficient76_206,
  OriginalRow227TriangleData1060.coefficient76_207,
  OriginalRow227TriangleData1060.coefficient76_208,
  OriginalRow227TriangleData1060.coefficient76_209,
  OriginalRow227TriangleData1060.coefficient76_210,
  OriginalRow227TriangleData1060.coefficient76_211,
  OriginalRow227TriangleData1060.coefficient76_212,
  OriginalRow227TriangleData1060.coefficient76_213,
  OriginalRow227TriangleData1060.coefficient76_214,
  OriginalRow227TriangleData1060.coefficient76_215,
  OriginalRow227TriangleData1060.coefficient76_216,
  OriginalRow227TriangleData1060.coefficient76_217,
  OriginalRow227TriangleData1060.coefficient76_218,
  OriginalRow227TriangleData1060.coefficient76_219,
  OriginalRow227TriangleData1060.coefficient76_220,
  OriginalRow227TriangleData1060.coefficient76_221,
  OriginalRow227TriangleData1060.coefficient76_222,
  OriginalRow227TriangleData1060.coefficient76_223,
  OriginalRow227TriangleData1060.coefficient76_224,
  OriginalRow227TriangleData1060.coefficient76_225,
  OriginalRow227TriangleData1060.coefficient76_226,
  OriginalRow227TriangleData1060.coefficient76_227,
  OriginalRow227TriangleData1060.coefficient76_228,
  OriginalRow227TriangleData1060.coefficient76_229,
  OriginalRow227TriangleData1060.coefficient76_230,
  OriginalRow227TriangleData1060.coefficient76_231,
  OriginalRow227TriangleData1060.coefficient76_232,
  OriginalRow227TriangleData1060.coefficient76_233,
  OriginalRow227TriangleData1060.coefficient76_234
]

theorem values1060_size : values1060.size = 32 := rfl

def block1060 : ℕ → Option IntervalDyadic := segment 203 values1060

theorem block1060_domain : ExactDomain block1060 203 235 := by
  simpa only [values1060_size] using segment_domain 203 values1060

theorem block1060_get (i : Fin 32) :
    block1060 (203 + i.val) = some (values1060[i.val]'(by rw [values1060_size]; exact i.isLt)) := by
  exact segment_get 203 values1060 ⟨i.val, by rw [values1060_size]; exact i.isLt⟩

def values1061 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1061.coefficient76_235,
  OriginalRow227TriangleData1061.coefficient76_236,
  OriginalRow227TriangleData1061.coefficient76_237,
  OriginalRow227TriangleData1061.coefficient76_238,
  OriginalRow227TriangleData1061.coefficient76_239,
  OriginalRow227TriangleData1061.coefficient76_240,
  OriginalRow227TriangleData1061.coefficient76_241,
  OriginalRow227TriangleData1061.coefficient76_242,
  OriginalRow227TriangleData1061.coefficient76_243,
  OriginalRow227TriangleData1061.coefficient76_244,
  OriginalRow227TriangleData1061.coefficient76_245,
  OriginalRow227TriangleData1061.coefficient76_246,
  OriginalRow227TriangleData1061.coefficient76_247,
  OriginalRow227TriangleData1061.coefficient76_248,
  OriginalRow227TriangleData1061.coefficient76_249,
  OriginalRow227TriangleData1061.coefficient76_250,
  OriginalRow227TriangleData1061.coefficient76_251,
  OriginalRow227TriangleData1061.coefficient76_252,
  OriginalRow227TriangleData1061.coefficient76_253,
  OriginalRow227TriangleData1061.coefficient76_254,
  OriginalRow227TriangleData1061.coefficient76_255,
  OriginalRow227TriangleData1061.coefficient76_256,
  OriginalRow227TriangleData1061.coefficient76_257,
  OriginalRow227TriangleData1061.coefficient76_258,
  OriginalRow227TriangleData1061.coefficient76_259,
  OriginalRow227TriangleData1061.coefficient76_260,
  OriginalRow227TriangleData1061.coefficient76_261,
  OriginalRow227TriangleData1061.coefficient76_262,
  OriginalRow227TriangleData1061.coefficient76_263,
  OriginalRow227TriangleData1061.coefficient76_264,
  OriginalRow227TriangleData1061.coefficient76_265,
  OriginalRow227TriangleData1061.coefficient76_266
]

theorem values1061_size : values1061.size = 32 := rfl

def block1061 : ℕ → Option IntervalDyadic := segment 235 values1061

theorem block1061_domain : ExactDomain block1061 235 267 := by
  simpa only [values1061_size] using segment_domain 235 values1061

theorem block1061_get (i : Fin 32) :
    block1061 (235 + i.val) = some (values1061[i.val]'(by rw [values1061_size]; exact i.isLt)) := by
  exact segment_get 235 values1061 ⟨i.val, by rw [values1061_size]; exact i.isLt⟩

def values1062 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1062.coefficient76_267,
  OriginalRow227TriangleData1062.coefficient76_268,
  OriginalRow227TriangleData1062.coefficient76_269,
  OriginalRow227TriangleData1062.coefficient76_270,
  OriginalRow227TriangleData1062.coefficient76_271,
  OriginalRow227TriangleData1062.coefficient76_272,
  OriginalRow227TriangleData1062.coefficient76_273,
  OriginalRow227TriangleData1062.coefficient76_274,
  OriginalRow227TriangleData1062.coefficient76_275,
  OriginalRow227TriangleData1062.coefficient76_276,
  OriginalRow227TriangleData1062.coefficient76_277,
  OriginalRow227TriangleData1062.coefficient76_278,
  OriginalRow227TriangleData1062.coefficient76_279,
  OriginalRow227TriangleData1062.coefficient76_280,
  OriginalRow227TriangleData1062.coefficient76_281,
  OriginalRow227TriangleData1062.coefficient76_282,
  OriginalRow227TriangleData1062.coefficient76_283,
  OriginalRow227TriangleData1062.coefficient76_284,
  OriginalRow227TriangleData1062.coefficient76_285,
  OriginalRow227TriangleData1062.coefficient76_286,
  OriginalRow227TriangleData1062.coefficient76_287,
  OriginalRow227TriangleData1062.coefficient76_288,
  OriginalRow227TriangleData1062.coefficient76_289,
  OriginalRow227TriangleData1062.coefficient76_290,
  OriginalRow227TriangleData1062.coefficient76_291,
  OriginalRow227TriangleData1062.coefficient76_292,
  OriginalRow227TriangleData1062.coefficient76_293,
  OriginalRow227TriangleData1062.coefficient76_294,
  OriginalRow227TriangleData1062.coefficient76_295,
  OriginalRow227TriangleData1062.coefficient76_296,
  OriginalRow227TriangleData1062.coefficient76_297,
  OriginalRow227TriangleData1062.coefficient76_298
]

theorem values1062_size : values1062.size = 32 := rfl

def block1062 : ℕ → Option IntervalDyadic := segment 267 values1062

theorem block1062_domain : ExactDomain block1062 267 299 := by
  simpa only [values1062_size] using segment_domain 267 values1062

theorem block1062_get (i : Fin 32) :
    block1062 (267 + i.val) = some (values1062[i.val]'(by rw [values1062_size]; exact i.isLt)) := by
  exact segment_get 267 values1062 ⟨i.val, by rw [values1062_size]; exact i.isLt⟩

def values1063 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1063.coefficient76_299,
  OriginalRow227TriangleData1063.coefficient76_300,
  OriginalRow227TriangleData1063.coefficient76_301,
  OriginalRow227TriangleData1063.coefficient76_302,
  OriginalRow227TriangleData1063.coefficient76_303,
  OriginalRow227TriangleData1063.coefficient76_304,
  OriginalRow227TriangleData1063.coefficient76_305,
  OriginalRow227TriangleData1063.coefficient76_306,
  OriginalRow227TriangleData1063.coefficient76_307,
  OriginalRow227TriangleData1063.coefficient76_308,
  OriginalRow227TriangleData1063.coefficient76_309,
  OriginalRow227TriangleData1063.coefficient76_310,
  OriginalRow227TriangleData1063.coefficient76_311,
  OriginalRow227TriangleData1063.coefficient76_312,
  OriginalRow227TriangleData1063.coefficient76_313,
  OriginalRow227TriangleData1063.coefficient76_314,
  OriginalRow227TriangleData1063.coefficient76_315,
  OriginalRow227TriangleData1063.coefficient76_316,
  OriginalRow227TriangleData1063.coefficient76_317,
  OriginalRow227TriangleData1063.coefficient76_318,
  OriginalRow227TriangleData1063.coefficient76_319,
  OriginalRow227TriangleData1063.coefficient76_320,
  OriginalRow227TriangleData1063.coefficient76_321,
  OriginalRow227TriangleData1063.coefficient76_322,
  OriginalRow227TriangleData1063.coefficient76_323,
  OriginalRow227TriangleData1063.coefficient76_324,
  OriginalRow227TriangleData1063.coefficient76_325,
  OriginalRow227TriangleData1063.coefficient76_326,
  OriginalRow227TriangleData1063.coefficient76_327,
  OriginalRow227TriangleData1063.coefficient76_328,
  OriginalRow227TriangleData1063.coefficient76_329,
  OriginalRow227TriangleData1063.coefficient76_330
]

theorem values1063_size : values1063.size = 32 := rfl

def block1063 : ℕ → Option IntervalDyadic := segment 299 values1063

theorem block1063_domain : ExactDomain block1063 299 331 := by
  simpa only [values1063_size] using segment_domain 299 values1063

theorem block1063_get (i : Fin 32) :
    block1063 (299 + i.val) = some (values1063[i.val]'(by rw [values1063_size]; exact i.isLt)) := by
  exact segment_get 299 values1063 ⟨i.val, by rw [values1063_size]; exact i.isLt⟩

def values1064 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1064.coefficient76_331,
  OriginalRow227TriangleData1064.coefficient76_332,
  OriginalRow227TriangleData1064.coefficient76_333,
  OriginalRow227TriangleData1064.coefficient76_334,
  OriginalRow227TriangleData1064.coefficient76_335,
  OriginalRow227TriangleData1064.coefficient76_336,
  OriginalRow227TriangleData1064.coefficient76_337,
  OriginalRow227TriangleData1064.coefficient76_338,
  OriginalRow227TriangleData1064.coefficient76_339,
  OriginalRow227TriangleData1064.coefficient76_340,
  OriginalRow227TriangleData1064.coefficient76_341,
  OriginalRow227TriangleData1064.coefficient76_342,
  OriginalRow227TriangleData1064.coefficient76_343,
  OriginalRow227TriangleData1064.coefficient76_344,
  OriginalRow227TriangleData1064.coefficient76_345,
  OriginalRow227TriangleData1064.coefficient76_346,
  OriginalRow227TriangleData1064.coefficient76_347,
  OriginalRow227TriangleData1064.coefficient76_348,
  OriginalRow227TriangleData1064.coefficient76_349,
  OriginalRow227TriangleData1064.coefficient76_350,
  OriginalRow227TriangleData1064.coefficient76_351,
  OriginalRow227TriangleData1064.coefficient76_352,
  OriginalRow227TriangleData1064.coefficient76_353,
  OriginalRow227TriangleData1064.coefficient76_354,
  OriginalRow227TriangleData1064.coefficient76_355,
  OriginalRow227TriangleData1064.coefficient76_356,
  OriginalRow227TriangleData1064.coefficient76_357,
  OriginalRow227TriangleData1064.coefficient76_358,
  OriginalRow227TriangleData1064.coefficient76_359,
  OriginalRow227TriangleData1064.coefficient76_360,
  OriginalRow227TriangleData1064.coefficient76_361,
  OriginalRow227TriangleData1064.coefficient76_362
]

theorem values1064_size : values1064.size = 32 := rfl

def block1064 : ℕ → Option IntervalDyadic := segment 331 values1064

theorem block1064_domain : ExactDomain block1064 331 363 := by
  simpa only [values1064_size] using segment_domain 331 values1064

theorem block1064_get (i : Fin 32) :
    block1064 (331 + i.val) = some (values1064[i.val]'(by rw [values1064_size]; exact i.isLt)) := by
  exact segment_get 331 values1064 ⟨i.val, by rw [values1064_size]; exact i.isLt⟩

def values1065 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1065.coefficient76_363,
  OriginalRow227TriangleData1065.coefficient76_364,
  OriginalRow227TriangleData1065.coefficient76_365,
  OriginalRow227TriangleData1065.coefficient76_366,
  OriginalRow227TriangleData1065.coefficient76_367,
  OriginalRow227TriangleData1065.coefficient76_368,
  OriginalRow227TriangleData1065.coefficient76_369,
  OriginalRow227TriangleData1065.coefficient76_370,
  OriginalRow227TriangleData1065.coefficient76_371,
  OriginalRow227TriangleData1065.coefficient76_372,
  OriginalRow227TriangleData1065.coefficient76_373,
  OriginalRow227TriangleData1065.coefficient76_374,
  OriginalRow227TriangleData1065.coefficient76_375,
  OriginalRow227TriangleData1065.coefficient76_376,
  OriginalRow227TriangleData1065.coefficient76_377,
  OriginalRow227TriangleData1065.coefficient76_378,
  OriginalRow227TriangleData1065.coefficient76_379,
  OriginalRow227TriangleData1065.coefficient76_380,
  OriginalRow227TriangleData1065.coefficient76_381,
  OriginalRow227TriangleData1065.coefficient76_382,
  OriginalRow227TriangleData1065.coefficient76_383,
  OriginalRow227TriangleData1065.coefficient76_384,
  OriginalRow227TriangleData1065.coefficient76_385,
  OriginalRow227TriangleData1065.coefficient76_386,
  OriginalRow227TriangleData1065.coefficient76_387,
  OriginalRow227TriangleData1065.coefficient76_388,
  OriginalRow227TriangleData1065.coefficient76_389,
  OriginalRow227TriangleData1065.coefficient76_390,
  OriginalRow227TriangleData1065.coefficient76_391,
  OriginalRow227TriangleData1065.coefficient76_392,
  OriginalRow227TriangleData1065.coefficient76_393,
  OriginalRow227TriangleData1065.coefficient76_394
]

theorem values1065_size : values1065.size = 32 := rfl

def block1065 : ℕ → Option IntervalDyadic := segment 363 values1065

theorem block1065_domain : ExactDomain block1065 363 395 := by
  simpa only [values1065_size] using segment_domain 363 values1065

theorem block1065_get (i : Fin 32) :
    block1065 (363 + i.val) = some (values1065[i.val]'(by rw [values1065_size]; exact i.isLt)) := by
  exact segment_get 363 values1065 ⟨i.val, by rw [values1065_size]; exact i.isLt⟩

def values1066 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1066.coefficient76_395,
  OriginalRow227TriangleData1066.coefficient76_396,
  OriginalRow227TriangleData1066.coefficient76_397,
  OriginalRow227TriangleData1066.coefficient76_398,
  OriginalRow227TriangleData1066.coefficient76_399,
  OriginalRow227TriangleData1066.coefficient76_400,
  OriginalRow227TriangleData1066.coefficient76_401,
  OriginalRow227TriangleData1066.coefficient76_402,
  OriginalRow227TriangleData1066.coefficient76_403,
  OriginalRow227TriangleData1066.coefficient76_404,
  OriginalRow227TriangleData1066.coefficient76_405,
  OriginalRow227TriangleData1066.coefficient76_406,
  OriginalRow227TriangleData1066.coefficient76_407,
  OriginalRow227TriangleData1066.coefficient76_408,
  OriginalRow227TriangleData1066.coefficient76_409,
  OriginalRow227TriangleData1066.coefficient76_410,
  OriginalRow227TriangleData1066.coefficient76_411,
  OriginalRow227TriangleData1066.coefficient76_412,
  OriginalRow227TriangleData1066.coefficient76_413,
  OriginalRow227TriangleData1066.coefficient76_414,
  OriginalRow227TriangleData1066.coefficient76_415,
  OriginalRow227TriangleData1066.coefficient76_416,
  OriginalRow227TriangleData1066.coefficient76_417,
  OriginalRow227TriangleData1066.coefficient76_418,
  OriginalRow227TriangleData1066.coefficient76_419,
  OriginalRow227TriangleData1066.coefficient76_420,
  OriginalRow227TriangleData1066.coefficient76_421,
  OriginalRow227TriangleData1066.coefficient76_422,
  OriginalRow227TriangleData1066.coefficient76_423,
  OriginalRow227TriangleData1066.coefficient76_424,
  OriginalRow227TriangleData1066.coefficient76_425
]

theorem values1066_size : values1066.size = 31 := rfl

def block1066 : ℕ → Option IntervalDyadic := segment 395 values1066

theorem block1066_domain : ExactDomain block1066 395 426 := by
  simpa only [values1066_size] using segment_domain 395 values1066

theorem block1066_get (i : Fin 31) :
    block1066 (395 + i.val) = some (values1066[i.val]'(by rw [values1066_size]; exact i.isLt)) := by
  exact segment_get 395 values1066 ⟨i.val, by rw [values1066_size]; exact i.isLt⟩

def node0075_0139 : ℕ → Option IntervalDyadic := split 107 block1056 block1057

theorem node0075_0139_domain : ExactDomain node0075_0139 75 139 := by
  exact split_domain (by decide) (by decide) block1056_domain block1057_domain

def node0171_0235 : ℕ → Option IntervalDyadic := split 203 block1059 block1060

theorem node0171_0235_domain : ExactDomain node0171_0235 171 235 := by
  exact split_domain (by decide) (by decide) block1059_domain block1060_domain

def node0139_0235 : ℕ → Option IntervalDyadic := split 171 block1058 node0171_0235

theorem node0139_0235_domain : ExactDomain node0139_0235 139 235 := by
  exact split_domain (by decide) (by decide) block1058_domain node0171_0235_domain

def node0075_0235 : ℕ → Option IntervalDyadic := split 139 node0075_0139 node0139_0235

theorem node0075_0235_domain : ExactDomain node0075_0235 75 235 := by
  exact split_domain (by decide) (by decide) node0075_0139_domain node0139_0235_domain

def node0267_0331 : ℕ → Option IntervalDyadic := split 299 block1062 block1063

theorem node0267_0331_domain : ExactDomain node0267_0331 267 331 := by
  exact split_domain (by decide) (by decide) block1062_domain block1063_domain

def node0235_0331 : ℕ → Option IntervalDyadic := split 267 block1061 node0267_0331

theorem node0235_0331_domain : ExactDomain node0235_0331 235 331 := by
  exact split_domain (by decide) (by decide) block1061_domain node0267_0331_domain

def node0363_0426 : ℕ → Option IntervalDyadic := split 395 block1065 block1066

theorem node0363_0426_domain : ExactDomain node0363_0426 363 426 := by
  exact split_domain (by decide) (by decide) block1065_domain block1066_domain

def node0331_0426 : ℕ → Option IntervalDyadic := split 363 block1064 node0363_0426

theorem node0331_0426_domain : ExactDomain node0331_0426 331 426 := by
  exact split_domain (by decide) (by decide) block1064_domain node0363_0426_domain

def node0235_0426 : ℕ → Option IntervalDyadic := split 331 node0235_0331 node0331_0426

theorem node0235_0426_domain : ExactDomain node0235_0426 235 426 := by
  exact split_domain (by decide) (by decide) node0235_0331_domain node0331_0426_domain

def node0075_0426 : ℕ → Option IntervalDyadic := split 235 node0075_0235 node0235_0426

theorem node0075_0426_domain : ExactDomain node0075_0426 75 426 := by
  exact split_domain (by decide) (by decide) node0075_0235_domain node0235_0426_domain

def lookup : ℕ → Option IntervalDyadic := node0075_0426

theorem lookup_domain : ExactDomain lookup 75 426 :=
  node0075_0426_domain

theorem block1056_lookup (i : Fin 32) :
    lookup (75 + i.val) = some (values1056[i.val]'(by rw [values1056_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (75 + i.val) = _
  rw [node0075_0426, split_left 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0075_0235, split_left 139 node0075_0139 node0139_0235 (by omega)]
  rw [node0075_0139, split_left 107 block1056 block1057 (by omega)]
  exact block1056_get i

theorem block1057_lookup (i : Fin 32) :
    lookup (107 + i.val) = some (values1057[i.val]'(by rw [values1057_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (107 + i.val) = _
  rw [node0075_0426, split_left 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0075_0235, split_left 139 node0075_0139 node0139_0235 (by omega)]
  rw [node0075_0139, split_right 107 block1056 block1057 (by omega)]
  exact block1057_get i

theorem block1058_lookup (i : Fin 32) :
    lookup (139 + i.val) = some (values1058[i.val]'(by rw [values1058_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (139 + i.val) = _
  rw [node0075_0426, split_left 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0075_0235, split_right 139 node0075_0139 node0139_0235 (by omega)]
  rw [node0139_0235, split_left 171 block1058 node0171_0235 (by omega)]
  exact block1058_get i

theorem block1059_lookup (i : Fin 32) :
    lookup (171 + i.val) = some (values1059[i.val]'(by rw [values1059_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (171 + i.val) = _
  rw [node0075_0426, split_left 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0075_0235, split_right 139 node0075_0139 node0139_0235 (by omega)]
  rw [node0139_0235, split_right 171 block1058 node0171_0235 (by omega)]
  rw [node0171_0235, split_left 203 block1059 block1060 (by omega)]
  exact block1059_get i

theorem block1060_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values1060[i.val]'(by rw [values1060_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (203 + i.val) = _
  rw [node0075_0426, split_left 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0075_0235, split_right 139 node0075_0139 node0139_0235 (by omega)]
  rw [node0139_0235, split_right 171 block1058 node0171_0235 (by omega)]
  rw [node0171_0235, split_right 203 block1059 block1060 (by omega)]
  exact block1060_get i

theorem block1061_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values1061[i.val]'(by rw [values1061_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (235 + i.val) = _
  rw [node0075_0426, split_right 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0235_0426, split_left 331 node0235_0331 node0331_0426 (by omega)]
  rw [node0235_0331, split_left 267 block1061 node0267_0331 (by omega)]
  exact block1061_get i

theorem block1062_lookup (i : Fin 32) :
    lookup (267 + i.val) = some (values1062[i.val]'(by rw [values1062_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (267 + i.val) = _
  rw [node0075_0426, split_right 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0235_0426, split_left 331 node0235_0331 node0331_0426 (by omega)]
  rw [node0235_0331, split_right 267 block1061 node0267_0331 (by omega)]
  rw [node0267_0331, split_left 299 block1062 block1063 (by omega)]
  exact block1062_get i

theorem block1063_lookup (i : Fin 32) :
    lookup (299 + i.val) = some (values1063[i.val]'(by rw [values1063_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (299 + i.val) = _
  rw [node0075_0426, split_right 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0235_0426, split_left 331 node0235_0331 node0331_0426 (by omega)]
  rw [node0235_0331, split_right 267 block1061 node0267_0331 (by omega)]
  rw [node0267_0331, split_right 299 block1062 block1063 (by omega)]
  exact block1063_get i

theorem block1064_lookup (i : Fin 32) :
    lookup (331 + i.val) = some (values1064[i.val]'(by rw [values1064_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (331 + i.val) = _
  rw [node0075_0426, split_right 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0235_0426, split_right 331 node0235_0331 node0331_0426 (by omega)]
  rw [node0331_0426, split_left 363 block1064 node0363_0426 (by omega)]
  exact block1064_get i

theorem block1065_lookup (i : Fin 32) :
    lookup (363 + i.val) = some (values1065[i.val]'(by rw [values1065_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (363 + i.val) = _
  rw [node0075_0426, split_right 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0235_0426, split_right 331 node0235_0331 node0331_0426 (by omega)]
  rw [node0331_0426, split_right 363 block1064 node0363_0426 (by omega)]
  rw [node0363_0426, split_left 395 block1065 block1066 (by omega)]
  exact block1065_get i

theorem block1066_lookup (i : Fin 31) :
    lookup (395 + i.val) = some (values1066[i.val]'(by rw [values1066_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0075_0426 (395 + i.val) = _
  rw [node0075_0426, split_right 235 node0075_0235 node0235_0426 (by omega)]
  rw [node0235_0426, split_right 331 node0235_0331 node0331_0426 (by omega)]
  rw [node0331_0426, split_right 363 block1064 node0363_0426 (by omega)]
  rw [node0363_0426, split_right 395 block1065 block1066 (by omega)]
  exact block1066_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1056_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1056_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1057_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1057_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1058_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1058_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1059_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1059_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1060_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1060_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1061_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1061_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1062_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1062_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1063_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1063_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1064_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1064_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1065_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1065_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1066_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1066_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1056_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1057_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1058_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1059_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1060_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1061_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1062_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1063_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1064_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1065_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow076.block1066_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow076
