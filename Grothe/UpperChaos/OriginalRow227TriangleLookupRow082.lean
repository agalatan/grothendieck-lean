import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1122
import Grothe.UpperChaos.OriginalRow227TriangleData1123
import Grothe.UpperChaos.OriginalRow227TriangleData1124
import Grothe.UpperChaos.OriginalRow227TriangleData1125
import Grothe.UpperChaos.OriginalRow227TriangleData1126
import Grothe.UpperChaos.OriginalRow227TriangleData1127
import Grothe.UpperChaos.OriginalRow227TriangleData1128
import Grothe.UpperChaos.OriginalRow227TriangleData1129
import Grothe.UpperChaos.OriginalRow227TriangleData1130
import Grothe.UpperChaos.OriginalRow227TriangleData1131
import Grothe.UpperChaos.OriginalRow227TriangleData1132

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow082

open ConditionalTableLookup

def values1122 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1122.coefficient82_81,
  OriginalRow227TriangleData1122.coefficient82_82,
  OriginalRow227TriangleData1122.coefficient82_83,
  OriginalRow227TriangleData1122.coefficient82_84,
  OriginalRow227TriangleData1122.coefficient82_85,
  OriginalRow227TriangleData1122.coefficient82_86,
  OriginalRow227TriangleData1122.coefficient82_87,
  OriginalRow227TriangleData1122.coefficient82_88,
  OriginalRow227TriangleData1122.coefficient82_89,
  OriginalRow227TriangleData1122.coefficient82_90,
  OriginalRow227TriangleData1122.coefficient82_91,
  OriginalRow227TriangleData1122.coefficient82_92,
  OriginalRow227TriangleData1122.coefficient82_93,
  OriginalRow227TriangleData1122.coefficient82_94,
  OriginalRow227TriangleData1122.coefficient82_95,
  OriginalRow227TriangleData1122.coefficient82_96,
  OriginalRow227TriangleData1122.coefficient82_97,
  OriginalRow227TriangleData1122.coefficient82_98,
  OriginalRow227TriangleData1122.coefficient82_99,
  OriginalRow227TriangleData1122.coefficient82_100,
  OriginalRow227TriangleData1122.coefficient82_101,
  OriginalRow227TriangleData1122.coefficient82_102,
  OriginalRow227TriangleData1122.coefficient82_103,
  OriginalRow227TriangleData1122.coefficient82_104,
  OriginalRow227TriangleData1122.coefficient82_105,
  OriginalRow227TriangleData1122.coefficient82_106,
  OriginalRow227TriangleData1122.coefficient82_107,
  OriginalRow227TriangleData1122.coefficient82_108,
  OriginalRow227TriangleData1122.coefficient82_109,
  OriginalRow227TriangleData1122.coefficient82_110,
  OriginalRow227TriangleData1122.coefficient82_111,
  OriginalRow227TriangleData1122.coefficient82_112
]

theorem values1122_size : values1122.size = 32 := rfl

def block1122 : ℕ → Option IntervalDyadic := segment 81 values1122

theorem block1122_domain : ExactDomain block1122 81 113 := by
  simpa only [values1122_size] using segment_domain 81 values1122

theorem block1122_get (i : Fin 32) :
    block1122 (81 + i.val) = some (values1122[i.val]'(by rw [values1122_size]; exact i.isLt)) := by
  exact segment_get 81 values1122 ⟨i.val, by rw [values1122_size]; exact i.isLt⟩

def values1123 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1123.coefficient82_113,
  OriginalRow227TriangleData1123.coefficient82_114,
  OriginalRow227TriangleData1123.coefficient82_115,
  OriginalRow227TriangleData1123.coefficient82_116,
  OriginalRow227TriangleData1123.coefficient82_117,
  OriginalRow227TriangleData1123.coefficient82_118,
  OriginalRow227TriangleData1123.coefficient82_119,
  OriginalRow227TriangleData1123.coefficient82_120,
  OriginalRow227TriangleData1123.coefficient82_121,
  OriginalRow227TriangleData1123.coefficient82_122,
  OriginalRow227TriangleData1123.coefficient82_123,
  OriginalRow227TriangleData1123.coefficient82_124,
  OriginalRow227TriangleData1123.coefficient82_125,
  OriginalRow227TriangleData1123.coefficient82_126,
  OriginalRow227TriangleData1123.coefficient82_127,
  OriginalRow227TriangleData1123.coefficient82_128,
  OriginalRow227TriangleData1123.coefficient82_129,
  OriginalRow227TriangleData1123.coefficient82_130,
  OriginalRow227TriangleData1123.coefficient82_131,
  OriginalRow227TriangleData1123.coefficient82_132,
  OriginalRow227TriangleData1123.coefficient82_133,
  OriginalRow227TriangleData1123.coefficient82_134,
  OriginalRow227TriangleData1123.coefficient82_135,
  OriginalRow227TriangleData1123.coefficient82_136,
  OriginalRow227TriangleData1123.coefficient82_137,
  OriginalRow227TriangleData1123.coefficient82_138,
  OriginalRow227TriangleData1123.coefficient82_139,
  OriginalRow227TriangleData1123.coefficient82_140,
  OriginalRow227TriangleData1123.coefficient82_141,
  OriginalRow227TriangleData1123.coefficient82_142,
  OriginalRow227TriangleData1123.coefficient82_143,
  OriginalRow227TriangleData1123.coefficient82_144
]

theorem values1123_size : values1123.size = 32 := rfl

def block1123 : ℕ → Option IntervalDyadic := segment 113 values1123

theorem block1123_domain : ExactDomain block1123 113 145 := by
  simpa only [values1123_size] using segment_domain 113 values1123

theorem block1123_get (i : Fin 32) :
    block1123 (113 + i.val) = some (values1123[i.val]'(by rw [values1123_size]; exact i.isLt)) := by
  exact segment_get 113 values1123 ⟨i.val, by rw [values1123_size]; exact i.isLt⟩

def values1124 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1124.coefficient82_145,
  OriginalRow227TriangleData1124.coefficient82_146,
  OriginalRow227TriangleData1124.coefficient82_147,
  OriginalRow227TriangleData1124.coefficient82_148,
  OriginalRow227TriangleData1124.coefficient82_149,
  OriginalRow227TriangleData1124.coefficient82_150,
  OriginalRow227TriangleData1124.coefficient82_151,
  OriginalRow227TriangleData1124.coefficient82_152,
  OriginalRow227TriangleData1124.coefficient82_153,
  OriginalRow227TriangleData1124.coefficient82_154,
  OriginalRow227TriangleData1124.coefficient82_155,
  OriginalRow227TriangleData1124.coefficient82_156,
  OriginalRow227TriangleData1124.coefficient82_157,
  OriginalRow227TriangleData1124.coefficient82_158,
  OriginalRow227TriangleData1124.coefficient82_159,
  OriginalRow227TriangleData1124.coefficient82_160,
  OriginalRow227TriangleData1124.coefficient82_161,
  OriginalRow227TriangleData1124.coefficient82_162,
  OriginalRow227TriangleData1124.coefficient82_163,
  OriginalRow227TriangleData1124.coefficient82_164,
  OriginalRow227TriangleData1124.coefficient82_165,
  OriginalRow227TriangleData1124.coefficient82_166,
  OriginalRow227TriangleData1124.coefficient82_167,
  OriginalRow227TriangleData1124.coefficient82_168,
  OriginalRow227TriangleData1124.coefficient82_169,
  OriginalRow227TriangleData1124.coefficient82_170,
  OriginalRow227TriangleData1124.coefficient82_171,
  OriginalRow227TriangleData1124.coefficient82_172,
  OriginalRow227TriangleData1124.coefficient82_173,
  OriginalRow227TriangleData1124.coefficient82_174,
  OriginalRow227TriangleData1124.coefficient82_175,
  OriginalRow227TriangleData1124.coefficient82_176
]

theorem values1124_size : values1124.size = 32 := rfl

def block1124 : ℕ → Option IntervalDyadic := segment 145 values1124

theorem block1124_domain : ExactDomain block1124 145 177 := by
  simpa only [values1124_size] using segment_domain 145 values1124

theorem block1124_get (i : Fin 32) :
    block1124 (145 + i.val) = some (values1124[i.val]'(by rw [values1124_size]; exact i.isLt)) := by
  exact segment_get 145 values1124 ⟨i.val, by rw [values1124_size]; exact i.isLt⟩

def values1125 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1125.coefficient82_177,
  OriginalRow227TriangleData1125.coefficient82_178,
  OriginalRow227TriangleData1125.coefficient82_179,
  OriginalRow227TriangleData1125.coefficient82_180,
  OriginalRow227TriangleData1125.coefficient82_181,
  OriginalRow227TriangleData1125.coefficient82_182,
  OriginalRow227TriangleData1125.coefficient82_183,
  OriginalRow227TriangleData1125.coefficient82_184,
  OriginalRow227TriangleData1125.coefficient82_185,
  OriginalRow227TriangleData1125.coefficient82_186,
  OriginalRow227TriangleData1125.coefficient82_187,
  OriginalRow227TriangleData1125.coefficient82_188,
  OriginalRow227TriangleData1125.coefficient82_189,
  OriginalRow227TriangleData1125.coefficient82_190,
  OriginalRow227TriangleData1125.coefficient82_191,
  OriginalRow227TriangleData1125.coefficient82_192,
  OriginalRow227TriangleData1125.coefficient82_193,
  OriginalRow227TriangleData1125.coefficient82_194,
  OriginalRow227TriangleData1125.coefficient82_195,
  OriginalRow227TriangleData1125.coefficient82_196,
  OriginalRow227TriangleData1125.coefficient82_197,
  OriginalRow227TriangleData1125.coefficient82_198,
  OriginalRow227TriangleData1125.coefficient82_199,
  OriginalRow227TriangleData1125.coefficient82_200,
  OriginalRow227TriangleData1125.coefficient82_201,
  OriginalRow227TriangleData1125.coefficient82_202,
  OriginalRow227TriangleData1125.coefficient82_203,
  OriginalRow227TriangleData1125.coefficient82_204,
  OriginalRow227TriangleData1125.coefficient82_205,
  OriginalRow227TriangleData1125.coefficient82_206,
  OriginalRow227TriangleData1125.coefficient82_207,
  OriginalRow227TriangleData1125.coefficient82_208
]

theorem values1125_size : values1125.size = 32 := rfl

def block1125 : ℕ → Option IntervalDyadic := segment 177 values1125

theorem block1125_domain : ExactDomain block1125 177 209 := by
  simpa only [values1125_size] using segment_domain 177 values1125

theorem block1125_get (i : Fin 32) :
    block1125 (177 + i.val) = some (values1125[i.val]'(by rw [values1125_size]; exact i.isLt)) := by
  exact segment_get 177 values1125 ⟨i.val, by rw [values1125_size]; exact i.isLt⟩

def values1126 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1126.coefficient82_209,
  OriginalRow227TriangleData1126.coefficient82_210,
  OriginalRow227TriangleData1126.coefficient82_211,
  OriginalRow227TriangleData1126.coefficient82_212,
  OriginalRow227TriangleData1126.coefficient82_213,
  OriginalRow227TriangleData1126.coefficient82_214,
  OriginalRow227TriangleData1126.coefficient82_215,
  OriginalRow227TriangleData1126.coefficient82_216,
  OriginalRow227TriangleData1126.coefficient82_217,
  OriginalRow227TriangleData1126.coefficient82_218,
  OriginalRow227TriangleData1126.coefficient82_219,
  OriginalRow227TriangleData1126.coefficient82_220,
  OriginalRow227TriangleData1126.coefficient82_221,
  OriginalRow227TriangleData1126.coefficient82_222,
  OriginalRow227TriangleData1126.coefficient82_223,
  OriginalRow227TriangleData1126.coefficient82_224,
  OriginalRow227TriangleData1126.coefficient82_225,
  OriginalRow227TriangleData1126.coefficient82_226,
  OriginalRow227TriangleData1126.coefficient82_227,
  OriginalRow227TriangleData1126.coefficient82_228,
  OriginalRow227TriangleData1126.coefficient82_229,
  OriginalRow227TriangleData1126.coefficient82_230,
  OriginalRow227TriangleData1126.coefficient82_231,
  OriginalRow227TriangleData1126.coefficient82_232,
  OriginalRow227TriangleData1126.coefficient82_233,
  OriginalRow227TriangleData1126.coefficient82_234,
  OriginalRow227TriangleData1126.coefficient82_235,
  OriginalRow227TriangleData1126.coefficient82_236,
  OriginalRow227TriangleData1126.coefficient82_237,
  OriginalRow227TriangleData1126.coefficient82_238,
  OriginalRow227TriangleData1126.coefficient82_239,
  OriginalRow227TriangleData1126.coefficient82_240
]

theorem values1126_size : values1126.size = 32 := rfl

def block1126 : ℕ → Option IntervalDyadic := segment 209 values1126

theorem block1126_domain : ExactDomain block1126 209 241 := by
  simpa only [values1126_size] using segment_domain 209 values1126

theorem block1126_get (i : Fin 32) :
    block1126 (209 + i.val) = some (values1126[i.val]'(by rw [values1126_size]; exact i.isLt)) := by
  exact segment_get 209 values1126 ⟨i.val, by rw [values1126_size]; exact i.isLt⟩

def values1127 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1127.coefficient82_241,
  OriginalRow227TriangleData1127.coefficient82_242,
  OriginalRow227TriangleData1127.coefficient82_243,
  OriginalRow227TriangleData1127.coefficient82_244,
  OriginalRow227TriangleData1127.coefficient82_245,
  OriginalRow227TriangleData1127.coefficient82_246,
  OriginalRow227TriangleData1127.coefficient82_247,
  OriginalRow227TriangleData1127.coefficient82_248,
  OriginalRow227TriangleData1127.coefficient82_249,
  OriginalRow227TriangleData1127.coefficient82_250,
  OriginalRow227TriangleData1127.coefficient82_251,
  OriginalRow227TriangleData1127.coefficient82_252,
  OriginalRow227TriangleData1127.coefficient82_253,
  OriginalRow227TriangleData1127.coefficient82_254,
  OriginalRow227TriangleData1127.coefficient82_255,
  OriginalRow227TriangleData1127.coefficient82_256,
  OriginalRow227TriangleData1127.coefficient82_257,
  OriginalRow227TriangleData1127.coefficient82_258,
  OriginalRow227TriangleData1127.coefficient82_259,
  OriginalRow227TriangleData1127.coefficient82_260,
  OriginalRow227TriangleData1127.coefficient82_261,
  OriginalRow227TriangleData1127.coefficient82_262,
  OriginalRow227TriangleData1127.coefficient82_263,
  OriginalRow227TriangleData1127.coefficient82_264,
  OriginalRow227TriangleData1127.coefficient82_265,
  OriginalRow227TriangleData1127.coefficient82_266,
  OriginalRow227TriangleData1127.coefficient82_267,
  OriginalRow227TriangleData1127.coefficient82_268,
  OriginalRow227TriangleData1127.coefficient82_269,
  OriginalRow227TriangleData1127.coefficient82_270,
  OriginalRow227TriangleData1127.coefficient82_271,
  OriginalRow227TriangleData1127.coefficient82_272
]

theorem values1127_size : values1127.size = 32 := rfl

def block1127 : ℕ → Option IntervalDyadic := segment 241 values1127

theorem block1127_domain : ExactDomain block1127 241 273 := by
  simpa only [values1127_size] using segment_domain 241 values1127

theorem block1127_get (i : Fin 32) :
    block1127 (241 + i.val) = some (values1127[i.val]'(by rw [values1127_size]; exact i.isLt)) := by
  exact segment_get 241 values1127 ⟨i.val, by rw [values1127_size]; exact i.isLt⟩

def values1128 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1128.coefficient82_273,
  OriginalRow227TriangleData1128.coefficient82_274,
  OriginalRow227TriangleData1128.coefficient82_275,
  OriginalRow227TriangleData1128.coefficient82_276,
  OriginalRow227TriangleData1128.coefficient82_277,
  OriginalRow227TriangleData1128.coefficient82_278,
  OriginalRow227TriangleData1128.coefficient82_279,
  OriginalRow227TriangleData1128.coefficient82_280,
  OriginalRow227TriangleData1128.coefficient82_281,
  OriginalRow227TriangleData1128.coefficient82_282,
  OriginalRow227TriangleData1128.coefficient82_283,
  OriginalRow227TriangleData1128.coefficient82_284,
  OriginalRow227TriangleData1128.coefficient82_285,
  OriginalRow227TriangleData1128.coefficient82_286,
  OriginalRow227TriangleData1128.coefficient82_287,
  OriginalRow227TriangleData1128.coefficient82_288,
  OriginalRow227TriangleData1128.coefficient82_289,
  OriginalRow227TriangleData1128.coefficient82_290,
  OriginalRow227TriangleData1128.coefficient82_291,
  OriginalRow227TriangleData1128.coefficient82_292,
  OriginalRow227TriangleData1128.coefficient82_293,
  OriginalRow227TriangleData1128.coefficient82_294,
  OriginalRow227TriangleData1128.coefficient82_295,
  OriginalRow227TriangleData1128.coefficient82_296,
  OriginalRow227TriangleData1128.coefficient82_297,
  OriginalRow227TriangleData1128.coefficient82_298,
  OriginalRow227TriangleData1128.coefficient82_299,
  OriginalRow227TriangleData1128.coefficient82_300,
  OriginalRow227TriangleData1128.coefficient82_301,
  OriginalRow227TriangleData1128.coefficient82_302,
  OriginalRow227TriangleData1128.coefficient82_303,
  OriginalRow227TriangleData1128.coefficient82_304
]

theorem values1128_size : values1128.size = 32 := rfl

def block1128 : ℕ → Option IntervalDyadic := segment 273 values1128

theorem block1128_domain : ExactDomain block1128 273 305 := by
  simpa only [values1128_size] using segment_domain 273 values1128

theorem block1128_get (i : Fin 32) :
    block1128 (273 + i.val) = some (values1128[i.val]'(by rw [values1128_size]; exact i.isLt)) := by
  exact segment_get 273 values1128 ⟨i.val, by rw [values1128_size]; exact i.isLt⟩

def values1129 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1129.coefficient82_305,
  OriginalRow227TriangleData1129.coefficient82_306,
  OriginalRow227TriangleData1129.coefficient82_307,
  OriginalRow227TriangleData1129.coefficient82_308,
  OriginalRow227TriangleData1129.coefficient82_309,
  OriginalRow227TriangleData1129.coefficient82_310,
  OriginalRow227TriangleData1129.coefficient82_311,
  OriginalRow227TriangleData1129.coefficient82_312,
  OriginalRow227TriangleData1129.coefficient82_313,
  OriginalRow227TriangleData1129.coefficient82_314,
  OriginalRow227TriangleData1129.coefficient82_315,
  OriginalRow227TriangleData1129.coefficient82_316,
  OriginalRow227TriangleData1129.coefficient82_317,
  OriginalRow227TriangleData1129.coefficient82_318,
  OriginalRow227TriangleData1129.coefficient82_319,
  OriginalRow227TriangleData1129.coefficient82_320,
  OriginalRow227TriangleData1129.coefficient82_321,
  OriginalRow227TriangleData1129.coefficient82_322,
  OriginalRow227TriangleData1129.coefficient82_323,
  OriginalRow227TriangleData1129.coefficient82_324,
  OriginalRow227TriangleData1129.coefficient82_325,
  OriginalRow227TriangleData1129.coefficient82_326,
  OriginalRow227TriangleData1129.coefficient82_327,
  OriginalRow227TriangleData1129.coefficient82_328,
  OriginalRow227TriangleData1129.coefficient82_329,
  OriginalRow227TriangleData1129.coefficient82_330,
  OriginalRow227TriangleData1129.coefficient82_331,
  OriginalRow227TriangleData1129.coefficient82_332,
  OriginalRow227TriangleData1129.coefficient82_333,
  OriginalRow227TriangleData1129.coefficient82_334,
  OriginalRow227TriangleData1129.coefficient82_335,
  OriginalRow227TriangleData1129.coefficient82_336
]

theorem values1129_size : values1129.size = 32 := rfl

def block1129 : ℕ → Option IntervalDyadic := segment 305 values1129

theorem block1129_domain : ExactDomain block1129 305 337 := by
  simpa only [values1129_size] using segment_domain 305 values1129

theorem block1129_get (i : Fin 32) :
    block1129 (305 + i.val) = some (values1129[i.val]'(by rw [values1129_size]; exact i.isLt)) := by
  exact segment_get 305 values1129 ⟨i.val, by rw [values1129_size]; exact i.isLt⟩

def values1130 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1130.coefficient82_337,
  OriginalRow227TriangleData1130.coefficient82_338,
  OriginalRow227TriangleData1130.coefficient82_339,
  OriginalRow227TriangleData1130.coefficient82_340,
  OriginalRow227TriangleData1130.coefficient82_341,
  OriginalRow227TriangleData1130.coefficient82_342,
  OriginalRow227TriangleData1130.coefficient82_343,
  OriginalRow227TriangleData1130.coefficient82_344,
  OriginalRow227TriangleData1130.coefficient82_345,
  OriginalRow227TriangleData1130.coefficient82_346,
  OriginalRow227TriangleData1130.coefficient82_347,
  OriginalRow227TriangleData1130.coefficient82_348,
  OriginalRow227TriangleData1130.coefficient82_349,
  OriginalRow227TriangleData1130.coefficient82_350,
  OriginalRow227TriangleData1130.coefficient82_351,
  OriginalRow227TriangleData1130.coefficient82_352,
  OriginalRow227TriangleData1130.coefficient82_353,
  OriginalRow227TriangleData1130.coefficient82_354,
  OriginalRow227TriangleData1130.coefficient82_355,
  OriginalRow227TriangleData1130.coefficient82_356,
  OriginalRow227TriangleData1130.coefficient82_357,
  OriginalRow227TriangleData1130.coefficient82_358,
  OriginalRow227TriangleData1130.coefficient82_359,
  OriginalRow227TriangleData1130.coefficient82_360,
  OriginalRow227TriangleData1130.coefficient82_361,
  OriginalRow227TriangleData1130.coefficient82_362,
  OriginalRow227TriangleData1130.coefficient82_363,
  OriginalRow227TriangleData1130.coefficient82_364,
  OriginalRow227TriangleData1130.coefficient82_365,
  OriginalRow227TriangleData1130.coefficient82_366,
  OriginalRow227TriangleData1130.coefficient82_367,
  OriginalRow227TriangleData1130.coefficient82_368
]

theorem values1130_size : values1130.size = 32 := rfl

def block1130 : ℕ → Option IntervalDyadic := segment 337 values1130

theorem block1130_domain : ExactDomain block1130 337 369 := by
  simpa only [values1130_size] using segment_domain 337 values1130

theorem block1130_get (i : Fin 32) :
    block1130 (337 + i.val) = some (values1130[i.val]'(by rw [values1130_size]; exact i.isLt)) := by
  exact segment_get 337 values1130 ⟨i.val, by rw [values1130_size]; exact i.isLt⟩

def values1131 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1131.coefficient82_369,
  OriginalRow227TriangleData1131.coefficient82_370,
  OriginalRow227TriangleData1131.coefficient82_371,
  OriginalRow227TriangleData1131.coefficient82_372,
  OriginalRow227TriangleData1131.coefficient82_373,
  OriginalRow227TriangleData1131.coefficient82_374,
  OriginalRow227TriangleData1131.coefficient82_375,
  OriginalRow227TriangleData1131.coefficient82_376,
  OriginalRow227TriangleData1131.coefficient82_377,
  OriginalRow227TriangleData1131.coefficient82_378,
  OriginalRow227TriangleData1131.coefficient82_379,
  OriginalRow227TriangleData1131.coefficient82_380,
  OriginalRow227TriangleData1131.coefficient82_381,
  OriginalRow227TriangleData1131.coefficient82_382,
  OriginalRow227TriangleData1131.coefficient82_383,
  OriginalRow227TriangleData1131.coefficient82_384,
  OriginalRow227TriangleData1131.coefficient82_385,
  OriginalRow227TriangleData1131.coefficient82_386,
  OriginalRow227TriangleData1131.coefficient82_387,
  OriginalRow227TriangleData1131.coefficient82_388,
  OriginalRow227TriangleData1131.coefficient82_389,
  OriginalRow227TriangleData1131.coefficient82_390,
  OriginalRow227TriangleData1131.coefficient82_391,
  OriginalRow227TriangleData1131.coefficient82_392,
  OriginalRow227TriangleData1131.coefficient82_393,
  OriginalRow227TriangleData1131.coefficient82_394,
  OriginalRow227TriangleData1131.coefficient82_395,
  OriginalRow227TriangleData1131.coefficient82_396,
  OriginalRow227TriangleData1131.coefficient82_397,
  OriginalRow227TriangleData1131.coefficient82_398,
  OriginalRow227TriangleData1131.coefficient82_399,
  OriginalRow227TriangleData1131.coefficient82_400
]

theorem values1131_size : values1131.size = 32 := rfl

def block1131 : ℕ → Option IntervalDyadic := segment 369 values1131

theorem block1131_domain : ExactDomain block1131 369 401 := by
  simpa only [values1131_size] using segment_domain 369 values1131

theorem block1131_get (i : Fin 32) :
    block1131 (369 + i.val) = some (values1131[i.val]'(by rw [values1131_size]; exact i.isLt)) := by
  exact segment_get 369 values1131 ⟨i.val, by rw [values1131_size]; exact i.isLt⟩

def values1132 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1132.coefficient82_401,
  OriginalRow227TriangleData1132.coefficient82_402,
  OriginalRow227TriangleData1132.coefficient82_403,
  OriginalRow227TriangleData1132.coefficient82_404,
  OriginalRow227TriangleData1132.coefficient82_405,
  OriginalRow227TriangleData1132.coefficient82_406,
  OriginalRow227TriangleData1132.coefficient82_407,
  OriginalRow227TriangleData1132.coefficient82_408,
  OriginalRow227TriangleData1132.coefficient82_409,
  OriginalRow227TriangleData1132.coefficient82_410,
  OriginalRow227TriangleData1132.coefficient82_411,
  OriginalRow227TriangleData1132.coefficient82_412,
  OriginalRow227TriangleData1132.coefficient82_413,
  OriginalRow227TriangleData1132.coefficient82_414,
  OriginalRow227TriangleData1132.coefficient82_415,
  OriginalRow227TriangleData1132.coefficient82_416,
  OriginalRow227TriangleData1132.coefficient82_417,
  OriginalRow227TriangleData1132.coefficient82_418,
  OriginalRow227TriangleData1132.coefficient82_419
]

theorem values1132_size : values1132.size = 19 := rfl

def block1132 : ℕ → Option IntervalDyadic := segment 401 values1132

theorem block1132_domain : ExactDomain block1132 401 420 := by
  simpa only [values1132_size] using segment_domain 401 values1132

theorem block1132_get (i : Fin 19) :
    block1132 (401 + i.val) = some (values1132[i.val]'(by rw [values1132_size]; exact i.isLt)) := by
  exact segment_get 401 values1132 ⟨i.val, by rw [values1132_size]; exact i.isLt⟩

def node0081_0145 : ℕ → Option IntervalDyadic := split 113 block1122 block1123

theorem node0081_0145_domain : ExactDomain node0081_0145 81 145 := by
  exact split_domain (by decide) (by decide) block1122_domain block1123_domain

def node0177_0241 : ℕ → Option IntervalDyadic := split 209 block1125 block1126

theorem node0177_0241_domain : ExactDomain node0177_0241 177 241 := by
  exact split_domain (by decide) (by decide) block1125_domain block1126_domain

def node0145_0241 : ℕ → Option IntervalDyadic := split 177 block1124 node0177_0241

theorem node0145_0241_domain : ExactDomain node0145_0241 145 241 := by
  exact split_domain (by decide) (by decide) block1124_domain node0177_0241_domain

def node0081_0241 : ℕ → Option IntervalDyadic := split 145 node0081_0145 node0145_0241

theorem node0081_0241_domain : ExactDomain node0081_0241 81 241 := by
  exact split_domain (by decide) (by decide) node0081_0145_domain node0145_0241_domain

def node0273_0337 : ℕ → Option IntervalDyadic := split 305 block1128 block1129

theorem node0273_0337_domain : ExactDomain node0273_0337 273 337 := by
  exact split_domain (by decide) (by decide) block1128_domain block1129_domain

def node0241_0337 : ℕ → Option IntervalDyadic := split 273 block1127 node0273_0337

theorem node0241_0337_domain : ExactDomain node0241_0337 241 337 := by
  exact split_domain (by decide) (by decide) block1127_domain node0273_0337_domain

def node0369_0420 : ℕ → Option IntervalDyadic := split 401 block1131 block1132

theorem node0369_0420_domain : ExactDomain node0369_0420 369 420 := by
  exact split_domain (by decide) (by decide) block1131_domain block1132_domain

def node0337_0420 : ℕ → Option IntervalDyadic := split 369 block1130 node0369_0420

theorem node0337_0420_domain : ExactDomain node0337_0420 337 420 := by
  exact split_domain (by decide) (by decide) block1130_domain node0369_0420_domain

def node0241_0420 : ℕ → Option IntervalDyadic := split 337 node0241_0337 node0337_0420

theorem node0241_0420_domain : ExactDomain node0241_0420 241 420 := by
  exact split_domain (by decide) (by decide) node0241_0337_domain node0337_0420_domain

def node0081_0420 : ℕ → Option IntervalDyadic := split 241 node0081_0241 node0241_0420

theorem node0081_0420_domain : ExactDomain node0081_0420 81 420 := by
  exact split_domain (by decide) (by decide) node0081_0241_domain node0241_0420_domain

def lookup : ℕ → Option IntervalDyadic := node0081_0420

theorem lookup_domain : ExactDomain lookup 81 420 :=
  node0081_0420_domain

theorem block1122_lookup (i : Fin 32) :
    lookup (81 + i.val) = some (values1122[i.val]'(by rw [values1122_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (81 + i.val) = _
  rw [node0081_0420, split_left 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0081_0241, split_left 145 node0081_0145 node0145_0241 (by omega)]
  rw [node0081_0145, split_left 113 block1122 block1123 (by omega)]
  exact block1122_get i

theorem block1123_lookup (i : Fin 32) :
    lookup (113 + i.val) = some (values1123[i.val]'(by rw [values1123_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (113 + i.val) = _
  rw [node0081_0420, split_left 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0081_0241, split_left 145 node0081_0145 node0145_0241 (by omega)]
  rw [node0081_0145, split_right 113 block1122 block1123 (by omega)]
  exact block1123_get i

theorem block1124_lookup (i : Fin 32) :
    lookup (145 + i.val) = some (values1124[i.val]'(by rw [values1124_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (145 + i.val) = _
  rw [node0081_0420, split_left 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0081_0241, split_right 145 node0081_0145 node0145_0241 (by omega)]
  rw [node0145_0241, split_left 177 block1124 node0177_0241 (by omega)]
  exact block1124_get i

theorem block1125_lookup (i : Fin 32) :
    lookup (177 + i.val) = some (values1125[i.val]'(by rw [values1125_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (177 + i.val) = _
  rw [node0081_0420, split_left 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0081_0241, split_right 145 node0081_0145 node0145_0241 (by omega)]
  rw [node0145_0241, split_right 177 block1124 node0177_0241 (by omega)]
  rw [node0177_0241, split_left 209 block1125 block1126 (by omega)]
  exact block1125_get i

theorem block1126_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values1126[i.val]'(by rw [values1126_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (209 + i.val) = _
  rw [node0081_0420, split_left 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0081_0241, split_right 145 node0081_0145 node0145_0241 (by omega)]
  rw [node0145_0241, split_right 177 block1124 node0177_0241 (by omega)]
  rw [node0177_0241, split_right 209 block1125 block1126 (by omega)]
  exact block1126_get i

theorem block1127_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values1127[i.val]'(by rw [values1127_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (241 + i.val) = _
  rw [node0081_0420, split_right 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0241_0420, split_left 337 node0241_0337 node0337_0420 (by omega)]
  rw [node0241_0337, split_left 273 block1127 node0273_0337 (by omega)]
  exact block1127_get i

theorem block1128_lookup (i : Fin 32) :
    lookup (273 + i.val) = some (values1128[i.val]'(by rw [values1128_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (273 + i.val) = _
  rw [node0081_0420, split_right 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0241_0420, split_left 337 node0241_0337 node0337_0420 (by omega)]
  rw [node0241_0337, split_right 273 block1127 node0273_0337 (by omega)]
  rw [node0273_0337, split_left 305 block1128 block1129 (by omega)]
  exact block1128_get i

theorem block1129_lookup (i : Fin 32) :
    lookup (305 + i.val) = some (values1129[i.val]'(by rw [values1129_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (305 + i.val) = _
  rw [node0081_0420, split_right 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0241_0420, split_left 337 node0241_0337 node0337_0420 (by omega)]
  rw [node0241_0337, split_right 273 block1127 node0273_0337 (by omega)]
  rw [node0273_0337, split_right 305 block1128 block1129 (by omega)]
  exact block1129_get i

theorem block1130_lookup (i : Fin 32) :
    lookup (337 + i.val) = some (values1130[i.val]'(by rw [values1130_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (337 + i.val) = _
  rw [node0081_0420, split_right 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0241_0420, split_right 337 node0241_0337 node0337_0420 (by omega)]
  rw [node0337_0420, split_left 369 block1130 node0369_0420 (by omega)]
  exact block1130_get i

theorem block1131_lookup (i : Fin 32) :
    lookup (369 + i.val) = some (values1131[i.val]'(by rw [values1131_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (369 + i.val) = _
  rw [node0081_0420, split_right 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0241_0420, split_right 337 node0241_0337 node0337_0420 (by omega)]
  rw [node0337_0420, split_right 369 block1130 node0369_0420 (by omega)]
  rw [node0369_0420, split_left 401 block1131 block1132 (by omega)]
  exact block1131_get i

theorem block1132_lookup (i : Fin 19) :
    lookup (401 + i.val) = some (values1132[i.val]'(by rw [values1132_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0081_0420 (401 + i.val) = _
  rw [node0081_0420, split_right 241 node0081_0241 node0241_0420 (by omega)]
  rw [node0241_0420, split_right 337 node0241_0337 node0337_0420 (by omega)]
  rw [node0337_0420, split_right 369 block1130 node0369_0420 (by omega)]
  rw [node0369_0420, split_right 401 block1131 block1132 (by omega)]
  exact block1132_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1122_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1122_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1123_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1123_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1124_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1124_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1125_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1125_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1126_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1126_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1127_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1127_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1128_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1128_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1129_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1129_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1130_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1130_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1131_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1131_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1132_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1132_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1122_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1123_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1124_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1125_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1126_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1127_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1128_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1129_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1130_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1131_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow082.block1132_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow082
