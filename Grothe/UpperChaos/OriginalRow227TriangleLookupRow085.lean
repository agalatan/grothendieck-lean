import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1155
import Grothe.UpperChaos.OriginalRow227TriangleData1156
import Grothe.UpperChaos.OriginalRow227TriangleData1157
import Grothe.UpperChaos.OriginalRow227TriangleData1158
import Grothe.UpperChaos.OriginalRow227TriangleData1159
import Grothe.UpperChaos.OriginalRow227TriangleData1160
import Grothe.UpperChaos.OriginalRow227TriangleData1161
import Grothe.UpperChaos.OriginalRow227TriangleData1162
import Grothe.UpperChaos.OriginalRow227TriangleData1163
import Grothe.UpperChaos.OriginalRow227TriangleData1164
import Grothe.UpperChaos.OriginalRow227TriangleData1165

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow085

open ConditionalTableLookup

def values1155 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1155.coefficient85_84,
  OriginalRow227TriangleData1155.coefficient85_85,
  OriginalRow227TriangleData1155.coefficient85_86,
  OriginalRow227TriangleData1155.coefficient85_87,
  OriginalRow227TriangleData1155.coefficient85_88,
  OriginalRow227TriangleData1155.coefficient85_89,
  OriginalRow227TriangleData1155.coefficient85_90,
  OriginalRow227TriangleData1155.coefficient85_91,
  OriginalRow227TriangleData1155.coefficient85_92,
  OriginalRow227TriangleData1155.coefficient85_93,
  OriginalRow227TriangleData1155.coefficient85_94,
  OriginalRow227TriangleData1155.coefficient85_95,
  OriginalRow227TriangleData1155.coefficient85_96,
  OriginalRow227TriangleData1155.coefficient85_97,
  OriginalRow227TriangleData1155.coefficient85_98,
  OriginalRow227TriangleData1155.coefficient85_99,
  OriginalRow227TriangleData1155.coefficient85_100,
  OriginalRow227TriangleData1155.coefficient85_101,
  OriginalRow227TriangleData1155.coefficient85_102,
  OriginalRow227TriangleData1155.coefficient85_103,
  OriginalRow227TriangleData1155.coefficient85_104,
  OriginalRow227TriangleData1155.coefficient85_105,
  OriginalRow227TriangleData1155.coefficient85_106,
  OriginalRow227TriangleData1155.coefficient85_107,
  OriginalRow227TriangleData1155.coefficient85_108,
  OriginalRow227TriangleData1155.coefficient85_109,
  OriginalRow227TriangleData1155.coefficient85_110,
  OriginalRow227TriangleData1155.coefficient85_111,
  OriginalRow227TriangleData1155.coefficient85_112,
  OriginalRow227TriangleData1155.coefficient85_113,
  OriginalRow227TriangleData1155.coefficient85_114,
  OriginalRow227TriangleData1155.coefficient85_115
]

theorem values1155_size : values1155.size = 32 := rfl

def block1155 : ℕ → Option IntervalDyadic := segment 84 values1155

theorem block1155_domain : ExactDomain block1155 84 116 := by
  simpa only [values1155_size] using segment_domain 84 values1155

theorem block1155_get (i : Fin 32) :
    block1155 (84 + i.val) = some (values1155[i.val]'(by rw [values1155_size]; exact i.isLt)) := by
  exact segment_get 84 values1155 ⟨i.val, by rw [values1155_size]; exact i.isLt⟩

def values1156 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1156.coefficient85_116,
  OriginalRow227TriangleData1156.coefficient85_117,
  OriginalRow227TriangleData1156.coefficient85_118,
  OriginalRow227TriangleData1156.coefficient85_119,
  OriginalRow227TriangleData1156.coefficient85_120,
  OriginalRow227TriangleData1156.coefficient85_121,
  OriginalRow227TriangleData1156.coefficient85_122,
  OriginalRow227TriangleData1156.coefficient85_123,
  OriginalRow227TriangleData1156.coefficient85_124,
  OriginalRow227TriangleData1156.coefficient85_125,
  OriginalRow227TriangleData1156.coefficient85_126,
  OriginalRow227TriangleData1156.coefficient85_127,
  OriginalRow227TriangleData1156.coefficient85_128,
  OriginalRow227TriangleData1156.coefficient85_129,
  OriginalRow227TriangleData1156.coefficient85_130,
  OriginalRow227TriangleData1156.coefficient85_131,
  OriginalRow227TriangleData1156.coefficient85_132,
  OriginalRow227TriangleData1156.coefficient85_133,
  OriginalRow227TriangleData1156.coefficient85_134,
  OriginalRow227TriangleData1156.coefficient85_135,
  OriginalRow227TriangleData1156.coefficient85_136,
  OriginalRow227TriangleData1156.coefficient85_137,
  OriginalRow227TriangleData1156.coefficient85_138,
  OriginalRow227TriangleData1156.coefficient85_139,
  OriginalRow227TriangleData1156.coefficient85_140,
  OriginalRow227TriangleData1156.coefficient85_141,
  OriginalRow227TriangleData1156.coefficient85_142,
  OriginalRow227TriangleData1156.coefficient85_143,
  OriginalRow227TriangleData1156.coefficient85_144,
  OriginalRow227TriangleData1156.coefficient85_145,
  OriginalRow227TriangleData1156.coefficient85_146,
  OriginalRow227TriangleData1156.coefficient85_147
]

theorem values1156_size : values1156.size = 32 := rfl

def block1156 : ℕ → Option IntervalDyadic := segment 116 values1156

theorem block1156_domain : ExactDomain block1156 116 148 := by
  simpa only [values1156_size] using segment_domain 116 values1156

theorem block1156_get (i : Fin 32) :
    block1156 (116 + i.val) = some (values1156[i.val]'(by rw [values1156_size]; exact i.isLt)) := by
  exact segment_get 116 values1156 ⟨i.val, by rw [values1156_size]; exact i.isLt⟩

def values1157 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1157.coefficient85_148,
  OriginalRow227TriangleData1157.coefficient85_149,
  OriginalRow227TriangleData1157.coefficient85_150,
  OriginalRow227TriangleData1157.coefficient85_151,
  OriginalRow227TriangleData1157.coefficient85_152,
  OriginalRow227TriangleData1157.coefficient85_153,
  OriginalRow227TriangleData1157.coefficient85_154,
  OriginalRow227TriangleData1157.coefficient85_155,
  OriginalRow227TriangleData1157.coefficient85_156,
  OriginalRow227TriangleData1157.coefficient85_157,
  OriginalRow227TriangleData1157.coefficient85_158,
  OriginalRow227TriangleData1157.coefficient85_159,
  OriginalRow227TriangleData1157.coefficient85_160,
  OriginalRow227TriangleData1157.coefficient85_161,
  OriginalRow227TriangleData1157.coefficient85_162,
  OriginalRow227TriangleData1157.coefficient85_163,
  OriginalRow227TriangleData1157.coefficient85_164,
  OriginalRow227TriangleData1157.coefficient85_165,
  OriginalRow227TriangleData1157.coefficient85_166,
  OriginalRow227TriangleData1157.coefficient85_167,
  OriginalRow227TriangleData1157.coefficient85_168,
  OriginalRow227TriangleData1157.coefficient85_169,
  OriginalRow227TriangleData1157.coefficient85_170,
  OriginalRow227TriangleData1157.coefficient85_171,
  OriginalRow227TriangleData1157.coefficient85_172,
  OriginalRow227TriangleData1157.coefficient85_173,
  OriginalRow227TriangleData1157.coefficient85_174,
  OriginalRow227TriangleData1157.coefficient85_175,
  OriginalRow227TriangleData1157.coefficient85_176,
  OriginalRow227TriangleData1157.coefficient85_177,
  OriginalRow227TriangleData1157.coefficient85_178,
  OriginalRow227TriangleData1157.coefficient85_179
]

theorem values1157_size : values1157.size = 32 := rfl

def block1157 : ℕ → Option IntervalDyadic := segment 148 values1157

theorem block1157_domain : ExactDomain block1157 148 180 := by
  simpa only [values1157_size] using segment_domain 148 values1157

theorem block1157_get (i : Fin 32) :
    block1157 (148 + i.val) = some (values1157[i.val]'(by rw [values1157_size]; exact i.isLt)) := by
  exact segment_get 148 values1157 ⟨i.val, by rw [values1157_size]; exact i.isLt⟩

def values1158 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1158.coefficient85_180,
  OriginalRow227TriangleData1158.coefficient85_181,
  OriginalRow227TriangleData1158.coefficient85_182,
  OriginalRow227TriangleData1158.coefficient85_183,
  OriginalRow227TriangleData1158.coefficient85_184,
  OriginalRow227TriangleData1158.coefficient85_185,
  OriginalRow227TriangleData1158.coefficient85_186,
  OriginalRow227TriangleData1158.coefficient85_187,
  OriginalRow227TriangleData1158.coefficient85_188,
  OriginalRow227TriangleData1158.coefficient85_189,
  OriginalRow227TriangleData1158.coefficient85_190,
  OriginalRow227TriangleData1158.coefficient85_191,
  OriginalRow227TriangleData1158.coefficient85_192,
  OriginalRow227TriangleData1158.coefficient85_193,
  OriginalRow227TriangleData1158.coefficient85_194,
  OriginalRow227TriangleData1158.coefficient85_195,
  OriginalRow227TriangleData1158.coefficient85_196,
  OriginalRow227TriangleData1158.coefficient85_197,
  OriginalRow227TriangleData1158.coefficient85_198,
  OriginalRow227TriangleData1158.coefficient85_199,
  OriginalRow227TriangleData1158.coefficient85_200,
  OriginalRow227TriangleData1158.coefficient85_201,
  OriginalRow227TriangleData1158.coefficient85_202,
  OriginalRow227TriangleData1158.coefficient85_203,
  OriginalRow227TriangleData1158.coefficient85_204,
  OriginalRow227TriangleData1158.coefficient85_205,
  OriginalRow227TriangleData1158.coefficient85_206,
  OriginalRow227TriangleData1158.coefficient85_207,
  OriginalRow227TriangleData1158.coefficient85_208,
  OriginalRow227TriangleData1158.coefficient85_209,
  OriginalRow227TriangleData1158.coefficient85_210,
  OriginalRow227TriangleData1158.coefficient85_211
]

theorem values1158_size : values1158.size = 32 := rfl

def block1158 : ℕ → Option IntervalDyadic := segment 180 values1158

theorem block1158_domain : ExactDomain block1158 180 212 := by
  simpa only [values1158_size] using segment_domain 180 values1158

theorem block1158_get (i : Fin 32) :
    block1158 (180 + i.val) = some (values1158[i.val]'(by rw [values1158_size]; exact i.isLt)) := by
  exact segment_get 180 values1158 ⟨i.val, by rw [values1158_size]; exact i.isLt⟩

def values1159 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1159.coefficient85_212,
  OriginalRow227TriangleData1159.coefficient85_213,
  OriginalRow227TriangleData1159.coefficient85_214,
  OriginalRow227TriangleData1159.coefficient85_215,
  OriginalRow227TriangleData1159.coefficient85_216,
  OriginalRow227TriangleData1159.coefficient85_217,
  OriginalRow227TriangleData1159.coefficient85_218,
  OriginalRow227TriangleData1159.coefficient85_219,
  OriginalRow227TriangleData1159.coefficient85_220,
  OriginalRow227TriangleData1159.coefficient85_221,
  OriginalRow227TriangleData1159.coefficient85_222,
  OriginalRow227TriangleData1159.coefficient85_223,
  OriginalRow227TriangleData1159.coefficient85_224,
  OriginalRow227TriangleData1159.coefficient85_225,
  OriginalRow227TriangleData1159.coefficient85_226,
  OriginalRow227TriangleData1159.coefficient85_227,
  OriginalRow227TriangleData1159.coefficient85_228,
  OriginalRow227TriangleData1159.coefficient85_229,
  OriginalRow227TriangleData1159.coefficient85_230,
  OriginalRow227TriangleData1159.coefficient85_231,
  OriginalRow227TriangleData1159.coefficient85_232,
  OriginalRow227TriangleData1159.coefficient85_233,
  OriginalRow227TriangleData1159.coefficient85_234,
  OriginalRow227TriangleData1159.coefficient85_235,
  OriginalRow227TriangleData1159.coefficient85_236,
  OriginalRow227TriangleData1159.coefficient85_237,
  OriginalRow227TriangleData1159.coefficient85_238,
  OriginalRow227TriangleData1159.coefficient85_239,
  OriginalRow227TriangleData1159.coefficient85_240,
  OriginalRow227TriangleData1159.coefficient85_241,
  OriginalRow227TriangleData1159.coefficient85_242,
  OriginalRow227TriangleData1159.coefficient85_243
]

theorem values1159_size : values1159.size = 32 := rfl

def block1159 : ℕ → Option IntervalDyadic := segment 212 values1159

theorem block1159_domain : ExactDomain block1159 212 244 := by
  simpa only [values1159_size] using segment_domain 212 values1159

theorem block1159_get (i : Fin 32) :
    block1159 (212 + i.val) = some (values1159[i.val]'(by rw [values1159_size]; exact i.isLt)) := by
  exact segment_get 212 values1159 ⟨i.val, by rw [values1159_size]; exact i.isLt⟩

def values1160 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1160.coefficient85_244,
  OriginalRow227TriangleData1160.coefficient85_245,
  OriginalRow227TriangleData1160.coefficient85_246,
  OriginalRow227TriangleData1160.coefficient85_247,
  OriginalRow227TriangleData1160.coefficient85_248,
  OriginalRow227TriangleData1160.coefficient85_249,
  OriginalRow227TriangleData1160.coefficient85_250,
  OriginalRow227TriangleData1160.coefficient85_251,
  OriginalRow227TriangleData1160.coefficient85_252,
  OriginalRow227TriangleData1160.coefficient85_253,
  OriginalRow227TriangleData1160.coefficient85_254,
  OriginalRow227TriangleData1160.coefficient85_255,
  OriginalRow227TriangleData1160.coefficient85_256,
  OriginalRow227TriangleData1160.coefficient85_257,
  OriginalRow227TriangleData1160.coefficient85_258,
  OriginalRow227TriangleData1160.coefficient85_259,
  OriginalRow227TriangleData1160.coefficient85_260,
  OriginalRow227TriangleData1160.coefficient85_261,
  OriginalRow227TriangleData1160.coefficient85_262,
  OriginalRow227TriangleData1160.coefficient85_263,
  OriginalRow227TriangleData1160.coefficient85_264,
  OriginalRow227TriangleData1160.coefficient85_265,
  OriginalRow227TriangleData1160.coefficient85_266,
  OriginalRow227TriangleData1160.coefficient85_267,
  OriginalRow227TriangleData1160.coefficient85_268,
  OriginalRow227TriangleData1160.coefficient85_269,
  OriginalRow227TriangleData1160.coefficient85_270,
  OriginalRow227TriangleData1160.coefficient85_271,
  OriginalRow227TriangleData1160.coefficient85_272,
  OriginalRow227TriangleData1160.coefficient85_273,
  OriginalRow227TriangleData1160.coefficient85_274,
  OriginalRow227TriangleData1160.coefficient85_275
]

theorem values1160_size : values1160.size = 32 := rfl

def block1160 : ℕ → Option IntervalDyadic := segment 244 values1160

theorem block1160_domain : ExactDomain block1160 244 276 := by
  simpa only [values1160_size] using segment_domain 244 values1160

theorem block1160_get (i : Fin 32) :
    block1160 (244 + i.val) = some (values1160[i.val]'(by rw [values1160_size]; exact i.isLt)) := by
  exact segment_get 244 values1160 ⟨i.val, by rw [values1160_size]; exact i.isLt⟩

def values1161 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1161.coefficient85_276,
  OriginalRow227TriangleData1161.coefficient85_277,
  OriginalRow227TriangleData1161.coefficient85_278,
  OriginalRow227TriangleData1161.coefficient85_279,
  OriginalRow227TriangleData1161.coefficient85_280,
  OriginalRow227TriangleData1161.coefficient85_281,
  OriginalRow227TriangleData1161.coefficient85_282,
  OriginalRow227TriangleData1161.coefficient85_283,
  OriginalRow227TriangleData1161.coefficient85_284,
  OriginalRow227TriangleData1161.coefficient85_285,
  OriginalRow227TriangleData1161.coefficient85_286,
  OriginalRow227TriangleData1161.coefficient85_287,
  OriginalRow227TriangleData1161.coefficient85_288,
  OriginalRow227TriangleData1161.coefficient85_289,
  OriginalRow227TriangleData1161.coefficient85_290,
  OriginalRow227TriangleData1161.coefficient85_291,
  OriginalRow227TriangleData1161.coefficient85_292,
  OriginalRow227TriangleData1161.coefficient85_293,
  OriginalRow227TriangleData1161.coefficient85_294,
  OriginalRow227TriangleData1161.coefficient85_295,
  OriginalRow227TriangleData1161.coefficient85_296,
  OriginalRow227TriangleData1161.coefficient85_297,
  OriginalRow227TriangleData1161.coefficient85_298,
  OriginalRow227TriangleData1161.coefficient85_299,
  OriginalRow227TriangleData1161.coefficient85_300,
  OriginalRow227TriangleData1161.coefficient85_301,
  OriginalRow227TriangleData1161.coefficient85_302,
  OriginalRow227TriangleData1161.coefficient85_303,
  OriginalRow227TriangleData1161.coefficient85_304,
  OriginalRow227TriangleData1161.coefficient85_305,
  OriginalRow227TriangleData1161.coefficient85_306,
  OriginalRow227TriangleData1161.coefficient85_307
]

theorem values1161_size : values1161.size = 32 := rfl

def block1161 : ℕ → Option IntervalDyadic := segment 276 values1161

theorem block1161_domain : ExactDomain block1161 276 308 := by
  simpa only [values1161_size] using segment_domain 276 values1161

theorem block1161_get (i : Fin 32) :
    block1161 (276 + i.val) = some (values1161[i.val]'(by rw [values1161_size]; exact i.isLt)) := by
  exact segment_get 276 values1161 ⟨i.val, by rw [values1161_size]; exact i.isLt⟩

def values1162 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1162.coefficient85_308,
  OriginalRow227TriangleData1162.coefficient85_309,
  OriginalRow227TriangleData1162.coefficient85_310,
  OriginalRow227TriangleData1162.coefficient85_311,
  OriginalRow227TriangleData1162.coefficient85_312,
  OriginalRow227TriangleData1162.coefficient85_313,
  OriginalRow227TriangleData1162.coefficient85_314,
  OriginalRow227TriangleData1162.coefficient85_315,
  OriginalRow227TriangleData1162.coefficient85_316,
  OriginalRow227TriangleData1162.coefficient85_317,
  OriginalRow227TriangleData1162.coefficient85_318,
  OriginalRow227TriangleData1162.coefficient85_319,
  OriginalRow227TriangleData1162.coefficient85_320,
  OriginalRow227TriangleData1162.coefficient85_321,
  OriginalRow227TriangleData1162.coefficient85_322,
  OriginalRow227TriangleData1162.coefficient85_323,
  OriginalRow227TriangleData1162.coefficient85_324,
  OriginalRow227TriangleData1162.coefficient85_325,
  OriginalRow227TriangleData1162.coefficient85_326,
  OriginalRow227TriangleData1162.coefficient85_327,
  OriginalRow227TriangleData1162.coefficient85_328,
  OriginalRow227TriangleData1162.coefficient85_329,
  OriginalRow227TriangleData1162.coefficient85_330,
  OriginalRow227TriangleData1162.coefficient85_331,
  OriginalRow227TriangleData1162.coefficient85_332,
  OriginalRow227TriangleData1162.coefficient85_333,
  OriginalRow227TriangleData1162.coefficient85_334,
  OriginalRow227TriangleData1162.coefficient85_335,
  OriginalRow227TriangleData1162.coefficient85_336,
  OriginalRow227TriangleData1162.coefficient85_337,
  OriginalRow227TriangleData1162.coefficient85_338,
  OriginalRow227TriangleData1162.coefficient85_339
]

theorem values1162_size : values1162.size = 32 := rfl

def block1162 : ℕ → Option IntervalDyadic := segment 308 values1162

theorem block1162_domain : ExactDomain block1162 308 340 := by
  simpa only [values1162_size] using segment_domain 308 values1162

theorem block1162_get (i : Fin 32) :
    block1162 (308 + i.val) = some (values1162[i.val]'(by rw [values1162_size]; exact i.isLt)) := by
  exact segment_get 308 values1162 ⟨i.val, by rw [values1162_size]; exact i.isLt⟩

def values1163 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1163.coefficient85_340,
  OriginalRow227TriangleData1163.coefficient85_341,
  OriginalRow227TriangleData1163.coefficient85_342,
  OriginalRow227TriangleData1163.coefficient85_343,
  OriginalRow227TriangleData1163.coefficient85_344,
  OriginalRow227TriangleData1163.coefficient85_345,
  OriginalRow227TriangleData1163.coefficient85_346,
  OriginalRow227TriangleData1163.coefficient85_347,
  OriginalRow227TriangleData1163.coefficient85_348,
  OriginalRow227TriangleData1163.coefficient85_349,
  OriginalRow227TriangleData1163.coefficient85_350,
  OriginalRow227TriangleData1163.coefficient85_351,
  OriginalRow227TriangleData1163.coefficient85_352,
  OriginalRow227TriangleData1163.coefficient85_353,
  OriginalRow227TriangleData1163.coefficient85_354,
  OriginalRow227TriangleData1163.coefficient85_355,
  OriginalRow227TriangleData1163.coefficient85_356,
  OriginalRow227TriangleData1163.coefficient85_357,
  OriginalRow227TriangleData1163.coefficient85_358,
  OriginalRow227TriangleData1163.coefficient85_359,
  OriginalRow227TriangleData1163.coefficient85_360,
  OriginalRow227TriangleData1163.coefficient85_361,
  OriginalRow227TriangleData1163.coefficient85_362,
  OriginalRow227TriangleData1163.coefficient85_363,
  OriginalRow227TriangleData1163.coefficient85_364,
  OriginalRow227TriangleData1163.coefficient85_365,
  OriginalRow227TriangleData1163.coefficient85_366,
  OriginalRow227TriangleData1163.coefficient85_367,
  OriginalRow227TriangleData1163.coefficient85_368,
  OriginalRow227TriangleData1163.coefficient85_369,
  OriginalRow227TriangleData1163.coefficient85_370,
  OriginalRow227TriangleData1163.coefficient85_371
]

theorem values1163_size : values1163.size = 32 := rfl

def block1163 : ℕ → Option IntervalDyadic := segment 340 values1163

theorem block1163_domain : ExactDomain block1163 340 372 := by
  simpa only [values1163_size] using segment_domain 340 values1163

theorem block1163_get (i : Fin 32) :
    block1163 (340 + i.val) = some (values1163[i.val]'(by rw [values1163_size]; exact i.isLt)) := by
  exact segment_get 340 values1163 ⟨i.val, by rw [values1163_size]; exact i.isLt⟩

def values1164 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1164.coefficient85_372,
  OriginalRow227TriangleData1164.coefficient85_373,
  OriginalRow227TriangleData1164.coefficient85_374,
  OriginalRow227TriangleData1164.coefficient85_375,
  OriginalRow227TriangleData1164.coefficient85_376,
  OriginalRow227TriangleData1164.coefficient85_377,
  OriginalRow227TriangleData1164.coefficient85_378,
  OriginalRow227TriangleData1164.coefficient85_379,
  OriginalRow227TriangleData1164.coefficient85_380,
  OriginalRow227TriangleData1164.coefficient85_381,
  OriginalRow227TriangleData1164.coefficient85_382,
  OriginalRow227TriangleData1164.coefficient85_383,
  OriginalRow227TriangleData1164.coefficient85_384,
  OriginalRow227TriangleData1164.coefficient85_385,
  OriginalRow227TriangleData1164.coefficient85_386,
  OriginalRow227TriangleData1164.coefficient85_387,
  OriginalRow227TriangleData1164.coefficient85_388,
  OriginalRow227TriangleData1164.coefficient85_389,
  OriginalRow227TriangleData1164.coefficient85_390,
  OriginalRow227TriangleData1164.coefficient85_391,
  OriginalRow227TriangleData1164.coefficient85_392,
  OriginalRow227TriangleData1164.coefficient85_393,
  OriginalRow227TriangleData1164.coefficient85_394,
  OriginalRow227TriangleData1164.coefficient85_395,
  OriginalRow227TriangleData1164.coefficient85_396,
  OriginalRow227TriangleData1164.coefficient85_397,
  OriginalRow227TriangleData1164.coefficient85_398,
  OriginalRow227TriangleData1164.coefficient85_399,
  OriginalRow227TriangleData1164.coefficient85_400,
  OriginalRow227TriangleData1164.coefficient85_401,
  OriginalRow227TriangleData1164.coefficient85_402,
  OriginalRow227TriangleData1164.coefficient85_403
]

theorem values1164_size : values1164.size = 32 := rfl

def block1164 : ℕ → Option IntervalDyadic := segment 372 values1164

theorem block1164_domain : ExactDomain block1164 372 404 := by
  simpa only [values1164_size] using segment_domain 372 values1164

theorem block1164_get (i : Fin 32) :
    block1164 (372 + i.val) = some (values1164[i.val]'(by rw [values1164_size]; exact i.isLt)) := by
  exact segment_get 372 values1164 ⟨i.val, by rw [values1164_size]; exact i.isLt⟩

def values1165 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1165.coefficient85_404,
  OriginalRow227TriangleData1165.coefficient85_405,
  OriginalRow227TriangleData1165.coefficient85_406,
  OriginalRow227TriangleData1165.coefficient85_407,
  OriginalRow227TriangleData1165.coefficient85_408,
  OriginalRow227TriangleData1165.coefficient85_409,
  OriginalRow227TriangleData1165.coefficient85_410,
  OriginalRow227TriangleData1165.coefficient85_411,
  OriginalRow227TriangleData1165.coefficient85_412,
  OriginalRow227TriangleData1165.coefficient85_413,
  OriginalRow227TriangleData1165.coefficient85_414,
  OriginalRow227TriangleData1165.coefficient85_415,
  OriginalRow227TriangleData1165.coefficient85_416
]

theorem values1165_size : values1165.size = 13 := rfl

def block1165 : ℕ → Option IntervalDyadic := segment 404 values1165

theorem block1165_domain : ExactDomain block1165 404 417 := by
  simpa only [values1165_size] using segment_domain 404 values1165

theorem block1165_get (i : Fin 13) :
    block1165 (404 + i.val) = some (values1165[i.val]'(by rw [values1165_size]; exact i.isLt)) := by
  exact segment_get 404 values1165 ⟨i.val, by rw [values1165_size]; exact i.isLt⟩

def node0084_0148 : ℕ → Option IntervalDyadic := split 116 block1155 block1156

theorem node0084_0148_domain : ExactDomain node0084_0148 84 148 := by
  exact split_domain (by decide) (by decide) block1155_domain block1156_domain

def node0180_0244 : ℕ → Option IntervalDyadic := split 212 block1158 block1159

theorem node0180_0244_domain : ExactDomain node0180_0244 180 244 := by
  exact split_domain (by decide) (by decide) block1158_domain block1159_domain

def node0148_0244 : ℕ → Option IntervalDyadic := split 180 block1157 node0180_0244

theorem node0148_0244_domain : ExactDomain node0148_0244 148 244 := by
  exact split_domain (by decide) (by decide) block1157_domain node0180_0244_domain

def node0084_0244 : ℕ → Option IntervalDyadic := split 148 node0084_0148 node0148_0244

theorem node0084_0244_domain : ExactDomain node0084_0244 84 244 := by
  exact split_domain (by decide) (by decide) node0084_0148_domain node0148_0244_domain

def node0276_0340 : ℕ → Option IntervalDyadic := split 308 block1161 block1162

theorem node0276_0340_domain : ExactDomain node0276_0340 276 340 := by
  exact split_domain (by decide) (by decide) block1161_domain block1162_domain

def node0244_0340 : ℕ → Option IntervalDyadic := split 276 block1160 node0276_0340

theorem node0244_0340_domain : ExactDomain node0244_0340 244 340 := by
  exact split_domain (by decide) (by decide) block1160_domain node0276_0340_domain

def node0372_0417 : ℕ → Option IntervalDyadic := split 404 block1164 block1165

theorem node0372_0417_domain : ExactDomain node0372_0417 372 417 := by
  exact split_domain (by decide) (by decide) block1164_domain block1165_domain

def node0340_0417 : ℕ → Option IntervalDyadic := split 372 block1163 node0372_0417

theorem node0340_0417_domain : ExactDomain node0340_0417 340 417 := by
  exact split_domain (by decide) (by decide) block1163_domain node0372_0417_domain

def node0244_0417 : ℕ → Option IntervalDyadic := split 340 node0244_0340 node0340_0417

theorem node0244_0417_domain : ExactDomain node0244_0417 244 417 := by
  exact split_domain (by decide) (by decide) node0244_0340_domain node0340_0417_domain

def node0084_0417 : ℕ → Option IntervalDyadic := split 244 node0084_0244 node0244_0417

theorem node0084_0417_domain : ExactDomain node0084_0417 84 417 := by
  exact split_domain (by decide) (by decide) node0084_0244_domain node0244_0417_domain

def lookup : ℕ → Option IntervalDyadic := node0084_0417

theorem lookup_domain : ExactDomain lookup 84 417 :=
  node0084_0417_domain

theorem block1155_lookup (i : Fin 32) :
    lookup (84 + i.val) = some (values1155[i.val]'(by rw [values1155_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (84 + i.val) = _
  rw [node0084_0417, split_left 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0084_0244, split_left 148 node0084_0148 node0148_0244 (by omega)]
  rw [node0084_0148, split_left 116 block1155 block1156 (by omega)]
  exact block1155_get i

theorem block1156_lookup (i : Fin 32) :
    lookup (116 + i.val) = some (values1156[i.val]'(by rw [values1156_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (116 + i.val) = _
  rw [node0084_0417, split_left 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0084_0244, split_left 148 node0084_0148 node0148_0244 (by omega)]
  rw [node0084_0148, split_right 116 block1155 block1156 (by omega)]
  exact block1156_get i

theorem block1157_lookup (i : Fin 32) :
    lookup (148 + i.val) = some (values1157[i.val]'(by rw [values1157_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (148 + i.val) = _
  rw [node0084_0417, split_left 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0084_0244, split_right 148 node0084_0148 node0148_0244 (by omega)]
  rw [node0148_0244, split_left 180 block1157 node0180_0244 (by omega)]
  exact block1157_get i

theorem block1158_lookup (i : Fin 32) :
    lookup (180 + i.val) = some (values1158[i.val]'(by rw [values1158_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (180 + i.val) = _
  rw [node0084_0417, split_left 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0084_0244, split_right 148 node0084_0148 node0148_0244 (by omega)]
  rw [node0148_0244, split_right 180 block1157 node0180_0244 (by omega)]
  rw [node0180_0244, split_left 212 block1158 block1159 (by omega)]
  exact block1158_get i

theorem block1159_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values1159[i.val]'(by rw [values1159_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (212 + i.val) = _
  rw [node0084_0417, split_left 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0084_0244, split_right 148 node0084_0148 node0148_0244 (by omega)]
  rw [node0148_0244, split_right 180 block1157 node0180_0244 (by omega)]
  rw [node0180_0244, split_right 212 block1158 block1159 (by omega)]
  exact block1159_get i

theorem block1160_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values1160[i.val]'(by rw [values1160_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (244 + i.val) = _
  rw [node0084_0417, split_right 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0244_0417, split_left 340 node0244_0340 node0340_0417 (by omega)]
  rw [node0244_0340, split_left 276 block1160 node0276_0340 (by omega)]
  exact block1160_get i

theorem block1161_lookup (i : Fin 32) :
    lookup (276 + i.val) = some (values1161[i.val]'(by rw [values1161_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (276 + i.val) = _
  rw [node0084_0417, split_right 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0244_0417, split_left 340 node0244_0340 node0340_0417 (by omega)]
  rw [node0244_0340, split_right 276 block1160 node0276_0340 (by omega)]
  rw [node0276_0340, split_left 308 block1161 block1162 (by omega)]
  exact block1161_get i

theorem block1162_lookup (i : Fin 32) :
    lookup (308 + i.val) = some (values1162[i.val]'(by rw [values1162_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (308 + i.val) = _
  rw [node0084_0417, split_right 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0244_0417, split_left 340 node0244_0340 node0340_0417 (by omega)]
  rw [node0244_0340, split_right 276 block1160 node0276_0340 (by omega)]
  rw [node0276_0340, split_right 308 block1161 block1162 (by omega)]
  exact block1162_get i

theorem block1163_lookup (i : Fin 32) :
    lookup (340 + i.val) = some (values1163[i.val]'(by rw [values1163_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (340 + i.val) = _
  rw [node0084_0417, split_right 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0244_0417, split_right 340 node0244_0340 node0340_0417 (by omega)]
  rw [node0340_0417, split_left 372 block1163 node0372_0417 (by omega)]
  exact block1163_get i

theorem block1164_lookup (i : Fin 32) :
    lookup (372 + i.val) = some (values1164[i.val]'(by rw [values1164_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (372 + i.val) = _
  rw [node0084_0417, split_right 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0244_0417, split_right 340 node0244_0340 node0340_0417 (by omega)]
  rw [node0340_0417, split_right 372 block1163 node0372_0417 (by omega)]
  rw [node0372_0417, split_left 404 block1164 block1165 (by omega)]
  exact block1164_get i

theorem block1165_lookup (i : Fin 13) :
    lookup (404 + i.val) = some (values1165[i.val]'(by rw [values1165_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0084_0417 (404 + i.val) = _
  rw [node0084_0417, split_right 244 node0084_0244 node0244_0417 (by omega)]
  rw [node0244_0417, split_right 340 node0244_0340 node0340_0417 (by omega)]
  rw [node0340_0417, split_right 372 block1163 node0372_0417 (by omega)]
  rw [node0372_0417, split_right 404 block1164 block1165 (by omega)]
  exact block1165_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1155_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1155_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1156_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1156_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1157_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1157_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1158_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1158_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1159_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1159_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1160_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1160_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1161_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1161_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1162_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1162_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1163_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1163_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1164_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1164_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1165_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1165_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1155_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1156_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1157_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1158_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1159_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1160_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1161_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1162_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1163_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1164_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow085.block1165_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow085
