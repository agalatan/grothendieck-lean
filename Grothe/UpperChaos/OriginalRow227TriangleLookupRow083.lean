import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1133
import Grothe.UpperChaos.OriginalRow227TriangleData1134
import Grothe.UpperChaos.OriginalRow227TriangleData1135
import Grothe.UpperChaos.OriginalRow227TriangleData1136
import Grothe.UpperChaos.OriginalRow227TriangleData1137
import Grothe.UpperChaos.OriginalRow227TriangleData1138
import Grothe.UpperChaos.OriginalRow227TriangleData1139
import Grothe.UpperChaos.OriginalRow227TriangleData1140
import Grothe.UpperChaos.OriginalRow227TriangleData1141
import Grothe.UpperChaos.OriginalRow227TriangleData1142
import Grothe.UpperChaos.OriginalRow227TriangleData1143

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow083

open ConditionalTableLookup

def values1133 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1133.coefficient83_82,
  OriginalRow227TriangleData1133.coefficient83_83,
  OriginalRow227TriangleData1133.coefficient83_84,
  OriginalRow227TriangleData1133.coefficient83_85,
  OriginalRow227TriangleData1133.coefficient83_86,
  OriginalRow227TriangleData1133.coefficient83_87,
  OriginalRow227TriangleData1133.coefficient83_88,
  OriginalRow227TriangleData1133.coefficient83_89,
  OriginalRow227TriangleData1133.coefficient83_90,
  OriginalRow227TriangleData1133.coefficient83_91,
  OriginalRow227TriangleData1133.coefficient83_92,
  OriginalRow227TriangleData1133.coefficient83_93,
  OriginalRow227TriangleData1133.coefficient83_94,
  OriginalRow227TriangleData1133.coefficient83_95,
  OriginalRow227TriangleData1133.coefficient83_96,
  OriginalRow227TriangleData1133.coefficient83_97,
  OriginalRow227TriangleData1133.coefficient83_98,
  OriginalRow227TriangleData1133.coefficient83_99,
  OriginalRow227TriangleData1133.coefficient83_100,
  OriginalRow227TriangleData1133.coefficient83_101,
  OriginalRow227TriangleData1133.coefficient83_102,
  OriginalRow227TriangleData1133.coefficient83_103,
  OriginalRow227TriangleData1133.coefficient83_104,
  OriginalRow227TriangleData1133.coefficient83_105,
  OriginalRow227TriangleData1133.coefficient83_106,
  OriginalRow227TriangleData1133.coefficient83_107,
  OriginalRow227TriangleData1133.coefficient83_108,
  OriginalRow227TriangleData1133.coefficient83_109,
  OriginalRow227TriangleData1133.coefficient83_110,
  OriginalRow227TriangleData1133.coefficient83_111,
  OriginalRow227TriangleData1133.coefficient83_112,
  OriginalRow227TriangleData1133.coefficient83_113
]

theorem values1133_size : values1133.size = 32 := rfl

def block1133 : ℕ → Option IntervalDyadic := segment 82 values1133

theorem block1133_domain : ExactDomain block1133 82 114 := by
  simpa only [values1133_size] using segment_domain 82 values1133

theorem block1133_get (i : Fin 32) :
    block1133 (82 + i.val) = some (values1133[i.val]'(by rw [values1133_size]; exact i.isLt)) := by
  exact segment_get 82 values1133 ⟨i.val, by rw [values1133_size]; exact i.isLt⟩

def values1134 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1134.coefficient83_114,
  OriginalRow227TriangleData1134.coefficient83_115,
  OriginalRow227TriangleData1134.coefficient83_116,
  OriginalRow227TriangleData1134.coefficient83_117,
  OriginalRow227TriangleData1134.coefficient83_118,
  OriginalRow227TriangleData1134.coefficient83_119,
  OriginalRow227TriangleData1134.coefficient83_120,
  OriginalRow227TriangleData1134.coefficient83_121,
  OriginalRow227TriangleData1134.coefficient83_122,
  OriginalRow227TriangleData1134.coefficient83_123,
  OriginalRow227TriangleData1134.coefficient83_124,
  OriginalRow227TriangleData1134.coefficient83_125,
  OriginalRow227TriangleData1134.coefficient83_126,
  OriginalRow227TriangleData1134.coefficient83_127,
  OriginalRow227TriangleData1134.coefficient83_128,
  OriginalRow227TriangleData1134.coefficient83_129,
  OriginalRow227TriangleData1134.coefficient83_130,
  OriginalRow227TriangleData1134.coefficient83_131,
  OriginalRow227TriangleData1134.coefficient83_132,
  OriginalRow227TriangleData1134.coefficient83_133,
  OriginalRow227TriangleData1134.coefficient83_134,
  OriginalRow227TriangleData1134.coefficient83_135,
  OriginalRow227TriangleData1134.coefficient83_136,
  OriginalRow227TriangleData1134.coefficient83_137,
  OriginalRow227TriangleData1134.coefficient83_138,
  OriginalRow227TriangleData1134.coefficient83_139,
  OriginalRow227TriangleData1134.coefficient83_140,
  OriginalRow227TriangleData1134.coefficient83_141,
  OriginalRow227TriangleData1134.coefficient83_142,
  OriginalRow227TriangleData1134.coefficient83_143,
  OriginalRow227TriangleData1134.coefficient83_144,
  OriginalRow227TriangleData1134.coefficient83_145
]

theorem values1134_size : values1134.size = 32 := rfl

def block1134 : ℕ → Option IntervalDyadic := segment 114 values1134

theorem block1134_domain : ExactDomain block1134 114 146 := by
  simpa only [values1134_size] using segment_domain 114 values1134

theorem block1134_get (i : Fin 32) :
    block1134 (114 + i.val) = some (values1134[i.val]'(by rw [values1134_size]; exact i.isLt)) := by
  exact segment_get 114 values1134 ⟨i.val, by rw [values1134_size]; exact i.isLt⟩

def values1135 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1135.coefficient83_146,
  OriginalRow227TriangleData1135.coefficient83_147,
  OriginalRow227TriangleData1135.coefficient83_148,
  OriginalRow227TriangleData1135.coefficient83_149,
  OriginalRow227TriangleData1135.coefficient83_150,
  OriginalRow227TriangleData1135.coefficient83_151,
  OriginalRow227TriangleData1135.coefficient83_152,
  OriginalRow227TriangleData1135.coefficient83_153,
  OriginalRow227TriangleData1135.coefficient83_154,
  OriginalRow227TriangleData1135.coefficient83_155,
  OriginalRow227TriangleData1135.coefficient83_156,
  OriginalRow227TriangleData1135.coefficient83_157,
  OriginalRow227TriangleData1135.coefficient83_158,
  OriginalRow227TriangleData1135.coefficient83_159,
  OriginalRow227TriangleData1135.coefficient83_160,
  OriginalRow227TriangleData1135.coefficient83_161,
  OriginalRow227TriangleData1135.coefficient83_162,
  OriginalRow227TriangleData1135.coefficient83_163,
  OriginalRow227TriangleData1135.coefficient83_164,
  OriginalRow227TriangleData1135.coefficient83_165,
  OriginalRow227TriangleData1135.coefficient83_166,
  OriginalRow227TriangleData1135.coefficient83_167,
  OriginalRow227TriangleData1135.coefficient83_168,
  OriginalRow227TriangleData1135.coefficient83_169,
  OriginalRow227TriangleData1135.coefficient83_170,
  OriginalRow227TriangleData1135.coefficient83_171,
  OriginalRow227TriangleData1135.coefficient83_172,
  OriginalRow227TriangleData1135.coefficient83_173,
  OriginalRow227TriangleData1135.coefficient83_174,
  OriginalRow227TriangleData1135.coefficient83_175,
  OriginalRow227TriangleData1135.coefficient83_176,
  OriginalRow227TriangleData1135.coefficient83_177
]

theorem values1135_size : values1135.size = 32 := rfl

def block1135 : ℕ → Option IntervalDyadic := segment 146 values1135

theorem block1135_domain : ExactDomain block1135 146 178 := by
  simpa only [values1135_size] using segment_domain 146 values1135

theorem block1135_get (i : Fin 32) :
    block1135 (146 + i.val) = some (values1135[i.val]'(by rw [values1135_size]; exact i.isLt)) := by
  exact segment_get 146 values1135 ⟨i.val, by rw [values1135_size]; exact i.isLt⟩

def values1136 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1136.coefficient83_178,
  OriginalRow227TriangleData1136.coefficient83_179,
  OriginalRow227TriangleData1136.coefficient83_180,
  OriginalRow227TriangleData1136.coefficient83_181,
  OriginalRow227TriangleData1136.coefficient83_182,
  OriginalRow227TriangleData1136.coefficient83_183,
  OriginalRow227TriangleData1136.coefficient83_184,
  OriginalRow227TriangleData1136.coefficient83_185,
  OriginalRow227TriangleData1136.coefficient83_186,
  OriginalRow227TriangleData1136.coefficient83_187,
  OriginalRow227TriangleData1136.coefficient83_188,
  OriginalRow227TriangleData1136.coefficient83_189,
  OriginalRow227TriangleData1136.coefficient83_190,
  OriginalRow227TriangleData1136.coefficient83_191,
  OriginalRow227TriangleData1136.coefficient83_192,
  OriginalRow227TriangleData1136.coefficient83_193,
  OriginalRow227TriangleData1136.coefficient83_194,
  OriginalRow227TriangleData1136.coefficient83_195,
  OriginalRow227TriangleData1136.coefficient83_196,
  OriginalRow227TriangleData1136.coefficient83_197,
  OriginalRow227TriangleData1136.coefficient83_198,
  OriginalRow227TriangleData1136.coefficient83_199,
  OriginalRow227TriangleData1136.coefficient83_200,
  OriginalRow227TriangleData1136.coefficient83_201,
  OriginalRow227TriangleData1136.coefficient83_202,
  OriginalRow227TriangleData1136.coefficient83_203,
  OriginalRow227TriangleData1136.coefficient83_204,
  OriginalRow227TriangleData1136.coefficient83_205,
  OriginalRow227TriangleData1136.coefficient83_206,
  OriginalRow227TriangleData1136.coefficient83_207,
  OriginalRow227TriangleData1136.coefficient83_208,
  OriginalRow227TriangleData1136.coefficient83_209
]

theorem values1136_size : values1136.size = 32 := rfl

def block1136 : ℕ → Option IntervalDyadic := segment 178 values1136

theorem block1136_domain : ExactDomain block1136 178 210 := by
  simpa only [values1136_size] using segment_domain 178 values1136

theorem block1136_get (i : Fin 32) :
    block1136 (178 + i.val) = some (values1136[i.val]'(by rw [values1136_size]; exact i.isLt)) := by
  exact segment_get 178 values1136 ⟨i.val, by rw [values1136_size]; exact i.isLt⟩

def values1137 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1137.coefficient83_210,
  OriginalRow227TriangleData1137.coefficient83_211,
  OriginalRow227TriangleData1137.coefficient83_212,
  OriginalRow227TriangleData1137.coefficient83_213,
  OriginalRow227TriangleData1137.coefficient83_214,
  OriginalRow227TriangleData1137.coefficient83_215,
  OriginalRow227TriangleData1137.coefficient83_216,
  OriginalRow227TriangleData1137.coefficient83_217,
  OriginalRow227TriangleData1137.coefficient83_218,
  OriginalRow227TriangleData1137.coefficient83_219,
  OriginalRow227TriangleData1137.coefficient83_220,
  OriginalRow227TriangleData1137.coefficient83_221,
  OriginalRow227TriangleData1137.coefficient83_222,
  OriginalRow227TriangleData1137.coefficient83_223,
  OriginalRow227TriangleData1137.coefficient83_224,
  OriginalRow227TriangleData1137.coefficient83_225,
  OriginalRow227TriangleData1137.coefficient83_226,
  OriginalRow227TriangleData1137.coefficient83_227,
  OriginalRow227TriangleData1137.coefficient83_228,
  OriginalRow227TriangleData1137.coefficient83_229,
  OriginalRow227TriangleData1137.coefficient83_230,
  OriginalRow227TriangleData1137.coefficient83_231,
  OriginalRow227TriangleData1137.coefficient83_232,
  OriginalRow227TriangleData1137.coefficient83_233,
  OriginalRow227TriangleData1137.coefficient83_234,
  OriginalRow227TriangleData1137.coefficient83_235,
  OriginalRow227TriangleData1137.coefficient83_236,
  OriginalRow227TriangleData1137.coefficient83_237,
  OriginalRow227TriangleData1137.coefficient83_238,
  OriginalRow227TriangleData1137.coefficient83_239,
  OriginalRow227TriangleData1137.coefficient83_240,
  OriginalRow227TriangleData1137.coefficient83_241
]

theorem values1137_size : values1137.size = 32 := rfl

def block1137 : ℕ → Option IntervalDyadic := segment 210 values1137

theorem block1137_domain : ExactDomain block1137 210 242 := by
  simpa only [values1137_size] using segment_domain 210 values1137

theorem block1137_get (i : Fin 32) :
    block1137 (210 + i.val) = some (values1137[i.val]'(by rw [values1137_size]; exact i.isLt)) := by
  exact segment_get 210 values1137 ⟨i.val, by rw [values1137_size]; exact i.isLt⟩

def values1138 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1138.coefficient83_242,
  OriginalRow227TriangleData1138.coefficient83_243,
  OriginalRow227TriangleData1138.coefficient83_244,
  OriginalRow227TriangleData1138.coefficient83_245,
  OriginalRow227TriangleData1138.coefficient83_246,
  OriginalRow227TriangleData1138.coefficient83_247,
  OriginalRow227TriangleData1138.coefficient83_248,
  OriginalRow227TriangleData1138.coefficient83_249,
  OriginalRow227TriangleData1138.coefficient83_250,
  OriginalRow227TriangleData1138.coefficient83_251,
  OriginalRow227TriangleData1138.coefficient83_252,
  OriginalRow227TriangleData1138.coefficient83_253,
  OriginalRow227TriangleData1138.coefficient83_254,
  OriginalRow227TriangleData1138.coefficient83_255,
  OriginalRow227TriangleData1138.coefficient83_256,
  OriginalRow227TriangleData1138.coefficient83_257,
  OriginalRow227TriangleData1138.coefficient83_258,
  OriginalRow227TriangleData1138.coefficient83_259,
  OriginalRow227TriangleData1138.coefficient83_260,
  OriginalRow227TriangleData1138.coefficient83_261,
  OriginalRow227TriangleData1138.coefficient83_262,
  OriginalRow227TriangleData1138.coefficient83_263,
  OriginalRow227TriangleData1138.coefficient83_264,
  OriginalRow227TriangleData1138.coefficient83_265,
  OriginalRow227TriangleData1138.coefficient83_266,
  OriginalRow227TriangleData1138.coefficient83_267,
  OriginalRow227TriangleData1138.coefficient83_268,
  OriginalRow227TriangleData1138.coefficient83_269,
  OriginalRow227TriangleData1138.coefficient83_270,
  OriginalRow227TriangleData1138.coefficient83_271,
  OriginalRow227TriangleData1138.coefficient83_272,
  OriginalRow227TriangleData1138.coefficient83_273
]

theorem values1138_size : values1138.size = 32 := rfl

def block1138 : ℕ → Option IntervalDyadic := segment 242 values1138

theorem block1138_domain : ExactDomain block1138 242 274 := by
  simpa only [values1138_size] using segment_domain 242 values1138

theorem block1138_get (i : Fin 32) :
    block1138 (242 + i.val) = some (values1138[i.val]'(by rw [values1138_size]; exact i.isLt)) := by
  exact segment_get 242 values1138 ⟨i.val, by rw [values1138_size]; exact i.isLt⟩

def values1139 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1139.coefficient83_274,
  OriginalRow227TriangleData1139.coefficient83_275,
  OriginalRow227TriangleData1139.coefficient83_276,
  OriginalRow227TriangleData1139.coefficient83_277,
  OriginalRow227TriangleData1139.coefficient83_278,
  OriginalRow227TriangleData1139.coefficient83_279,
  OriginalRow227TriangleData1139.coefficient83_280,
  OriginalRow227TriangleData1139.coefficient83_281,
  OriginalRow227TriangleData1139.coefficient83_282,
  OriginalRow227TriangleData1139.coefficient83_283,
  OriginalRow227TriangleData1139.coefficient83_284,
  OriginalRow227TriangleData1139.coefficient83_285,
  OriginalRow227TriangleData1139.coefficient83_286,
  OriginalRow227TriangleData1139.coefficient83_287,
  OriginalRow227TriangleData1139.coefficient83_288,
  OriginalRow227TriangleData1139.coefficient83_289,
  OriginalRow227TriangleData1139.coefficient83_290,
  OriginalRow227TriangleData1139.coefficient83_291,
  OriginalRow227TriangleData1139.coefficient83_292,
  OriginalRow227TriangleData1139.coefficient83_293,
  OriginalRow227TriangleData1139.coefficient83_294,
  OriginalRow227TriangleData1139.coefficient83_295,
  OriginalRow227TriangleData1139.coefficient83_296,
  OriginalRow227TriangleData1139.coefficient83_297,
  OriginalRow227TriangleData1139.coefficient83_298,
  OriginalRow227TriangleData1139.coefficient83_299,
  OriginalRow227TriangleData1139.coefficient83_300,
  OriginalRow227TriangleData1139.coefficient83_301,
  OriginalRow227TriangleData1139.coefficient83_302,
  OriginalRow227TriangleData1139.coefficient83_303,
  OriginalRow227TriangleData1139.coefficient83_304,
  OriginalRow227TriangleData1139.coefficient83_305
]

theorem values1139_size : values1139.size = 32 := rfl

def block1139 : ℕ → Option IntervalDyadic := segment 274 values1139

theorem block1139_domain : ExactDomain block1139 274 306 := by
  simpa only [values1139_size] using segment_domain 274 values1139

theorem block1139_get (i : Fin 32) :
    block1139 (274 + i.val) = some (values1139[i.val]'(by rw [values1139_size]; exact i.isLt)) := by
  exact segment_get 274 values1139 ⟨i.val, by rw [values1139_size]; exact i.isLt⟩

def values1140 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1140.coefficient83_306,
  OriginalRow227TriangleData1140.coefficient83_307,
  OriginalRow227TriangleData1140.coefficient83_308,
  OriginalRow227TriangleData1140.coefficient83_309,
  OriginalRow227TriangleData1140.coefficient83_310,
  OriginalRow227TriangleData1140.coefficient83_311,
  OriginalRow227TriangleData1140.coefficient83_312,
  OriginalRow227TriangleData1140.coefficient83_313,
  OriginalRow227TriangleData1140.coefficient83_314,
  OriginalRow227TriangleData1140.coefficient83_315,
  OriginalRow227TriangleData1140.coefficient83_316,
  OriginalRow227TriangleData1140.coefficient83_317,
  OriginalRow227TriangleData1140.coefficient83_318,
  OriginalRow227TriangleData1140.coefficient83_319,
  OriginalRow227TriangleData1140.coefficient83_320,
  OriginalRow227TriangleData1140.coefficient83_321,
  OriginalRow227TriangleData1140.coefficient83_322,
  OriginalRow227TriangleData1140.coefficient83_323,
  OriginalRow227TriangleData1140.coefficient83_324,
  OriginalRow227TriangleData1140.coefficient83_325,
  OriginalRow227TriangleData1140.coefficient83_326,
  OriginalRow227TriangleData1140.coefficient83_327,
  OriginalRow227TriangleData1140.coefficient83_328,
  OriginalRow227TriangleData1140.coefficient83_329,
  OriginalRow227TriangleData1140.coefficient83_330,
  OriginalRow227TriangleData1140.coefficient83_331,
  OriginalRow227TriangleData1140.coefficient83_332,
  OriginalRow227TriangleData1140.coefficient83_333,
  OriginalRow227TriangleData1140.coefficient83_334,
  OriginalRow227TriangleData1140.coefficient83_335,
  OriginalRow227TriangleData1140.coefficient83_336,
  OriginalRow227TriangleData1140.coefficient83_337
]

theorem values1140_size : values1140.size = 32 := rfl

def block1140 : ℕ → Option IntervalDyadic := segment 306 values1140

theorem block1140_domain : ExactDomain block1140 306 338 := by
  simpa only [values1140_size] using segment_domain 306 values1140

theorem block1140_get (i : Fin 32) :
    block1140 (306 + i.val) = some (values1140[i.val]'(by rw [values1140_size]; exact i.isLt)) := by
  exact segment_get 306 values1140 ⟨i.val, by rw [values1140_size]; exact i.isLt⟩

def values1141 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1141.coefficient83_338,
  OriginalRow227TriangleData1141.coefficient83_339,
  OriginalRow227TriangleData1141.coefficient83_340,
  OriginalRow227TriangleData1141.coefficient83_341,
  OriginalRow227TriangleData1141.coefficient83_342,
  OriginalRow227TriangleData1141.coefficient83_343,
  OriginalRow227TriangleData1141.coefficient83_344,
  OriginalRow227TriangleData1141.coefficient83_345,
  OriginalRow227TriangleData1141.coefficient83_346,
  OriginalRow227TriangleData1141.coefficient83_347,
  OriginalRow227TriangleData1141.coefficient83_348,
  OriginalRow227TriangleData1141.coefficient83_349,
  OriginalRow227TriangleData1141.coefficient83_350,
  OriginalRow227TriangleData1141.coefficient83_351,
  OriginalRow227TriangleData1141.coefficient83_352,
  OriginalRow227TriangleData1141.coefficient83_353,
  OriginalRow227TriangleData1141.coefficient83_354,
  OriginalRow227TriangleData1141.coefficient83_355,
  OriginalRow227TriangleData1141.coefficient83_356,
  OriginalRow227TriangleData1141.coefficient83_357,
  OriginalRow227TriangleData1141.coefficient83_358,
  OriginalRow227TriangleData1141.coefficient83_359,
  OriginalRow227TriangleData1141.coefficient83_360,
  OriginalRow227TriangleData1141.coefficient83_361,
  OriginalRow227TriangleData1141.coefficient83_362,
  OriginalRow227TriangleData1141.coefficient83_363,
  OriginalRow227TriangleData1141.coefficient83_364,
  OriginalRow227TriangleData1141.coefficient83_365,
  OriginalRow227TriangleData1141.coefficient83_366,
  OriginalRow227TriangleData1141.coefficient83_367,
  OriginalRow227TriangleData1141.coefficient83_368,
  OriginalRow227TriangleData1141.coefficient83_369
]

theorem values1141_size : values1141.size = 32 := rfl

def block1141 : ℕ → Option IntervalDyadic := segment 338 values1141

theorem block1141_domain : ExactDomain block1141 338 370 := by
  simpa only [values1141_size] using segment_domain 338 values1141

theorem block1141_get (i : Fin 32) :
    block1141 (338 + i.val) = some (values1141[i.val]'(by rw [values1141_size]; exact i.isLt)) := by
  exact segment_get 338 values1141 ⟨i.val, by rw [values1141_size]; exact i.isLt⟩

def values1142 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1142.coefficient83_370,
  OriginalRow227TriangleData1142.coefficient83_371,
  OriginalRow227TriangleData1142.coefficient83_372,
  OriginalRow227TriangleData1142.coefficient83_373,
  OriginalRow227TriangleData1142.coefficient83_374,
  OriginalRow227TriangleData1142.coefficient83_375,
  OriginalRow227TriangleData1142.coefficient83_376,
  OriginalRow227TriangleData1142.coefficient83_377,
  OriginalRow227TriangleData1142.coefficient83_378,
  OriginalRow227TriangleData1142.coefficient83_379,
  OriginalRow227TriangleData1142.coefficient83_380,
  OriginalRow227TriangleData1142.coefficient83_381,
  OriginalRow227TriangleData1142.coefficient83_382,
  OriginalRow227TriangleData1142.coefficient83_383,
  OriginalRow227TriangleData1142.coefficient83_384,
  OriginalRow227TriangleData1142.coefficient83_385,
  OriginalRow227TriangleData1142.coefficient83_386,
  OriginalRow227TriangleData1142.coefficient83_387,
  OriginalRow227TriangleData1142.coefficient83_388,
  OriginalRow227TriangleData1142.coefficient83_389,
  OriginalRow227TriangleData1142.coefficient83_390,
  OriginalRow227TriangleData1142.coefficient83_391,
  OriginalRow227TriangleData1142.coefficient83_392,
  OriginalRow227TriangleData1142.coefficient83_393,
  OriginalRow227TriangleData1142.coefficient83_394,
  OriginalRow227TriangleData1142.coefficient83_395,
  OriginalRow227TriangleData1142.coefficient83_396,
  OriginalRow227TriangleData1142.coefficient83_397,
  OriginalRow227TriangleData1142.coefficient83_398,
  OriginalRow227TriangleData1142.coefficient83_399,
  OriginalRow227TriangleData1142.coefficient83_400,
  OriginalRow227TriangleData1142.coefficient83_401
]

theorem values1142_size : values1142.size = 32 := rfl

def block1142 : ℕ → Option IntervalDyadic := segment 370 values1142

theorem block1142_domain : ExactDomain block1142 370 402 := by
  simpa only [values1142_size] using segment_domain 370 values1142

theorem block1142_get (i : Fin 32) :
    block1142 (370 + i.val) = some (values1142[i.val]'(by rw [values1142_size]; exact i.isLt)) := by
  exact segment_get 370 values1142 ⟨i.val, by rw [values1142_size]; exact i.isLt⟩

def values1143 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1143.coefficient83_402,
  OriginalRow227TriangleData1143.coefficient83_403,
  OriginalRow227TriangleData1143.coefficient83_404,
  OriginalRow227TriangleData1143.coefficient83_405,
  OriginalRow227TriangleData1143.coefficient83_406,
  OriginalRow227TriangleData1143.coefficient83_407,
  OriginalRow227TriangleData1143.coefficient83_408,
  OriginalRow227TriangleData1143.coefficient83_409,
  OriginalRow227TriangleData1143.coefficient83_410,
  OriginalRow227TriangleData1143.coefficient83_411,
  OriginalRow227TriangleData1143.coefficient83_412,
  OriginalRow227TriangleData1143.coefficient83_413,
  OriginalRow227TriangleData1143.coefficient83_414,
  OriginalRow227TriangleData1143.coefficient83_415,
  OriginalRow227TriangleData1143.coefficient83_416,
  OriginalRow227TriangleData1143.coefficient83_417,
  OriginalRow227TriangleData1143.coefficient83_418
]

theorem values1143_size : values1143.size = 17 := rfl

def block1143 : ℕ → Option IntervalDyadic := segment 402 values1143

theorem block1143_domain : ExactDomain block1143 402 419 := by
  simpa only [values1143_size] using segment_domain 402 values1143

theorem block1143_get (i : Fin 17) :
    block1143 (402 + i.val) = some (values1143[i.val]'(by rw [values1143_size]; exact i.isLt)) := by
  exact segment_get 402 values1143 ⟨i.val, by rw [values1143_size]; exact i.isLt⟩

def node0082_0146 : ℕ → Option IntervalDyadic := split 114 block1133 block1134

theorem node0082_0146_domain : ExactDomain node0082_0146 82 146 := by
  exact split_domain (by decide) (by decide) block1133_domain block1134_domain

def node0178_0242 : ℕ → Option IntervalDyadic := split 210 block1136 block1137

theorem node0178_0242_domain : ExactDomain node0178_0242 178 242 := by
  exact split_domain (by decide) (by decide) block1136_domain block1137_domain

def node0146_0242 : ℕ → Option IntervalDyadic := split 178 block1135 node0178_0242

theorem node0146_0242_domain : ExactDomain node0146_0242 146 242 := by
  exact split_domain (by decide) (by decide) block1135_domain node0178_0242_domain

def node0082_0242 : ℕ → Option IntervalDyadic := split 146 node0082_0146 node0146_0242

theorem node0082_0242_domain : ExactDomain node0082_0242 82 242 := by
  exact split_domain (by decide) (by decide) node0082_0146_domain node0146_0242_domain

def node0274_0338 : ℕ → Option IntervalDyadic := split 306 block1139 block1140

theorem node0274_0338_domain : ExactDomain node0274_0338 274 338 := by
  exact split_domain (by decide) (by decide) block1139_domain block1140_domain

def node0242_0338 : ℕ → Option IntervalDyadic := split 274 block1138 node0274_0338

theorem node0242_0338_domain : ExactDomain node0242_0338 242 338 := by
  exact split_domain (by decide) (by decide) block1138_domain node0274_0338_domain

def node0370_0419 : ℕ → Option IntervalDyadic := split 402 block1142 block1143

theorem node0370_0419_domain : ExactDomain node0370_0419 370 419 := by
  exact split_domain (by decide) (by decide) block1142_domain block1143_domain

def node0338_0419 : ℕ → Option IntervalDyadic := split 370 block1141 node0370_0419

theorem node0338_0419_domain : ExactDomain node0338_0419 338 419 := by
  exact split_domain (by decide) (by decide) block1141_domain node0370_0419_domain

def node0242_0419 : ℕ → Option IntervalDyadic := split 338 node0242_0338 node0338_0419

theorem node0242_0419_domain : ExactDomain node0242_0419 242 419 := by
  exact split_domain (by decide) (by decide) node0242_0338_domain node0338_0419_domain

def node0082_0419 : ℕ → Option IntervalDyadic := split 242 node0082_0242 node0242_0419

theorem node0082_0419_domain : ExactDomain node0082_0419 82 419 := by
  exact split_domain (by decide) (by decide) node0082_0242_domain node0242_0419_domain

def lookup : ℕ → Option IntervalDyadic := node0082_0419

theorem lookup_domain : ExactDomain lookup 82 419 :=
  node0082_0419_domain

theorem block1133_lookup (i : Fin 32) :
    lookup (82 + i.val) = some (values1133[i.val]'(by rw [values1133_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (82 + i.val) = _
  rw [node0082_0419, split_left 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0082_0242, split_left 146 node0082_0146 node0146_0242 (by omega)]
  rw [node0082_0146, split_left 114 block1133 block1134 (by omega)]
  exact block1133_get i

theorem block1134_lookup (i : Fin 32) :
    lookup (114 + i.val) = some (values1134[i.val]'(by rw [values1134_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (114 + i.val) = _
  rw [node0082_0419, split_left 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0082_0242, split_left 146 node0082_0146 node0146_0242 (by omega)]
  rw [node0082_0146, split_right 114 block1133 block1134 (by omega)]
  exact block1134_get i

theorem block1135_lookup (i : Fin 32) :
    lookup (146 + i.val) = some (values1135[i.val]'(by rw [values1135_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (146 + i.val) = _
  rw [node0082_0419, split_left 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0082_0242, split_right 146 node0082_0146 node0146_0242 (by omega)]
  rw [node0146_0242, split_left 178 block1135 node0178_0242 (by omega)]
  exact block1135_get i

theorem block1136_lookup (i : Fin 32) :
    lookup (178 + i.val) = some (values1136[i.val]'(by rw [values1136_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (178 + i.val) = _
  rw [node0082_0419, split_left 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0082_0242, split_right 146 node0082_0146 node0146_0242 (by omega)]
  rw [node0146_0242, split_right 178 block1135 node0178_0242 (by omega)]
  rw [node0178_0242, split_left 210 block1136 block1137 (by omega)]
  exact block1136_get i

theorem block1137_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values1137[i.val]'(by rw [values1137_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (210 + i.val) = _
  rw [node0082_0419, split_left 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0082_0242, split_right 146 node0082_0146 node0146_0242 (by omega)]
  rw [node0146_0242, split_right 178 block1135 node0178_0242 (by omega)]
  rw [node0178_0242, split_right 210 block1136 block1137 (by omega)]
  exact block1137_get i

theorem block1138_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values1138[i.val]'(by rw [values1138_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (242 + i.val) = _
  rw [node0082_0419, split_right 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0242_0419, split_left 338 node0242_0338 node0338_0419 (by omega)]
  rw [node0242_0338, split_left 274 block1138 node0274_0338 (by omega)]
  exact block1138_get i

theorem block1139_lookup (i : Fin 32) :
    lookup (274 + i.val) = some (values1139[i.val]'(by rw [values1139_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (274 + i.val) = _
  rw [node0082_0419, split_right 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0242_0419, split_left 338 node0242_0338 node0338_0419 (by omega)]
  rw [node0242_0338, split_right 274 block1138 node0274_0338 (by omega)]
  rw [node0274_0338, split_left 306 block1139 block1140 (by omega)]
  exact block1139_get i

theorem block1140_lookup (i : Fin 32) :
    lookup (306 + i.val) = some (values1140[i.val]'(by rw [values1140_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (306 + i.val) = _
  rw [node0082_0419, split_right 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0242_0419, split_left 338 node0242_0338 node0338_0419 (by omega)]
  rw [node0242_0338, split_right 274 block1138 node0274_0338 (by omega)]
  rw [node0274_0338, split_right 306 block1139 block1140 (by omega)]
  exact block1140_get i

theorem block1141_lookup (i : Fin 32) :
    lookup (338 + i.val) = some (values1141[i.val]'(by rw [values1141_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (338 + i.val) = _
  rw [node0082_0419, split_right 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0242_0419, split_right 338 node0242_0338 node0338_0419 (by omega)]
  rw [node0338_0419, split_left 370 block1141 node0370_0419 (by omega)]
  exact block1141_get i

theorem block1142_lookup (i : Fin 32) :
    lookup (370 + i.val) = some (values1142[i.val]'(by rw [values1142_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (370 + i.val) = _
  rw [node0082_0419, split_right 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0242_0419, split_right 338 node0242_0338 node0338_0419 (by omega)]
  rw [node0338_0419, split_right 370 block1141 node0370_0419 (by omega)]
  rw [node0370_0419, split_left 402 block1142 block1143 (by omega)]
  exact block1142_get i

theorem block1143_lookup (i : Fin 17) :
    lookup (402 + i.val) = some (values1143[i.val]'(by rw [values1143_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0082_0419 (402 + i.val) = _
  rw [node0082_0419, split_right 242 node0082_0242 node0242_0419 (by omega)]
  rw [node0242_0419, split_right 338 node0242_0338 node0338_0419 (by omega)]
  rw [node0338_0419, split_right 370 block1141 node0370_0419 (by omega)]
  rw [node0370_0419, split_right 402 block1142 block1143 (by omega)]
  exact block1143_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1133_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1133_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1134_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1134_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1135_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1135_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1136_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1136_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1137_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1137_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1138_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1138_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1139_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1139_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1140_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1140_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1141_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1141_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1142_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1142_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1143_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1143_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1133_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1134_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1135_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1136_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1137_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1138_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1139_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1140_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1141_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1142_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow083.block1143_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow083
