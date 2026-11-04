import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1166
import Grothe.UpperChaos.OriginalRow227TriangleData1167
import Grothe.UpperChaos.OriginalRow227TriangleData1168
import Grothe.UpperChaos.OriginalRow227TriangleData1169
import Grothe.UpperChaos.OriginalRow227TriangleData1170
import Grothe.UpperChaos.OriginalRow227TriangleData1171
import Grothe.UpperChaos.OriginalRow227TriangleData1172
import Grothe.UpperChaos.OriginalRow227TriangleData1173
import Grothe.UpperChaos.OriginalRow227TriangleData1174
import Grothe.UpperChaos.OriginalRow227TriangleData1175
import Grothe.UpperChaos.OriginalRow227TriangleData1176

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow086

open ConditionalTableLookup

def values1166 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1166.coefficient86_85,
  OriginalRow227TriangleData1166.coefficient86_86,
  OriginalRow227TriangleData1166.coefficient86_87,
  OriginalRow227TriangleData1166.coefficient86_88,
  OriginalRow227TriangleData1166.coefficient86_89,
  OriginalRow227TriangleData1166.coefficient86_90,
  OriginalRow227TriangleData1166.coefficient86_91,
  OriginalRow227TriangleData1166.coefficient86_92,
  OriginalRow227TriangleData1166.coefficient86_93,
  OriginalRow227TriangleData1166.coefficient86_94,
  OriginalRow227TriangleData1166.coefficient86_95,
  OriginalRow227TriangleData1166.coefficient86_96,
  OriginalRow227TriangleData1166.coefficient86_97,
  OriginalRow227TriangleData1166.coefficient86_98,
  OriginalRow227TriangleData1166.coefficient86_99,
  OriginalRow227TriangleData1166.coefficient86_100,
  OriginalRow227TriangleData1166.coefficient86_101,
  OriginalRow227TriangleData1166.coefficient86_102,
  OriginalRow227TriangleData1166.coefficient86_103,
  OriginalRow227TriangleData1166.coefficient86_104,
  OriginalRow227TriangleData1166.coefficient86_105,
  OriginalRow227TriangleData1166.coefficient86_106,
  OriginalRow227TriangleData1166.coefficient86_107,
  OriginalRow227TriangleData1166.coefficient86_108,
  OriginalRow227TriangleData1166.coefficient86_109,
  OriginalRow227TriangleData1166.coefficient86_110,
  OriginalRow227TriangleData1166.coefficient86_111,
  OriginalRow227TriangleData1166.coefficient86_112,
  OriginalRow227TriangleData1166.coefficient86_113,
  OriginalRow227TriangleData1166.coefficient86_114,
  OriginalRow227TriangleData1166.coefficient86_115,
  OriginalRow227TriangleData1166.coefficient86_116
]

theorem values1166_size : values1166.size = 32 := rfl

def block1166 : ℕ → Option IntervalDyadic := segment 85 values1166

theorem block1166_domain : ExactDomain block1166 85 117 := by
  simpa only [values1166_size] using segment_domain 85 values1166

theorem block1166_get (i : Fin 32) :
    block1166 (85 + i.val) = some (values1166[i.val]'(by rw [values1166_size]; exact i.isLt)) := by
  exact segment_get 85 values1166 ⟨i.val, by rw [values1166_size]; exact i.isLt⟩

def values1167 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1167.coefficient86_117,
  OriginalRow227TriangleData1167.coefficient86_118,
  OriginalRow227TriangleData1167.coefficient86_119,
  OriginalRow227TriangleData1167.coefficient86_120,
  OriginalRow227TriangleData1167.coefficient86_121,
  OriginalRow227TriangleData1167.coefficient86_122,
  OriginalRow227TriangleData1167.coefficient86_123,
  OriginalRow227TriangleData1167.coefficient86_124,
  OriginalRow227TriangleData1167.coefficient86_125,
  OriginalRow227TriangleData1167.coefficient86_126,
  OriginalRow227TriangleData1167.coefficient86_127,
  OriginalRow227TriangleData1167.coefficient86_128,
  OriginalRow227TriangleData1167.coefficient86_129,
  OriginalRow227TriangleData1167.coefficient86_130,
  OriginalRow227TriangleData1167.coefficient86_131,
  OriginalRow227TriangleData1167.coefficient86_132,
  OriginalRow227TriangleData1167.coefficient86_133,
  OriginalRow227TriangleData1167.coefficient86_134,
  OriginalRow227TriangleData1167.coefficient86_135,
  OriginalRow227TriangleData1167.coefficient86_136,
  OriginalRow227TriangleData1167.coefficient86_137,
  OriginalRow227TriangleData1167.coefficient86_138,
  OriginalRow227TriangleData1167.coefficient86_139,
  OriginalRow227TriangleData1167.coefficient86_140,
  OriginalRow227TriangleData1167.coefficient86_141,
  OriginalRow227TriangleData1167.coefficient86_142,
  OriginalRow227TriangleData1167.coefficient86_143,
  OriginalRow227TriangleData1167.coefficient86_144,
  OriginalRow227TriangleData1167.coefficient86_145,
  OriginalRow227TriangleData1167.coefficient86_146,
  OriginalRow227TriangleData1167.coefficient86_147,
  OriginalRow227TriangleData1167.coefficient86_148
]

theorem values1167_size : values1167.size = 32 := rfl

def block1167 : ℕ → Option IntervalDyadic := segment 117 values1167

theorem block1167_domain : ExactDomain block1167 117 149 := by
  simpa only [values1167_size] using segment_domain 117 values1167

theorem block1167_get (i : Fin 32) :
    block1167 (117 + i.val) = some (values1167[i.val]'(by rw [values1167_size]; exact i.isLt)) := by
  exact segment_get 117 values1167 ⟨i.val, by rw [values1167_size]; exact i.isLt⟩

def values1168 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1168.coefficient86_149,
  OriginalRow227TriangleData1168.coefficient86_150,
  OriginalRow227TriangleData1168.coefficient86_151,
  OriginalRow227TriangleData1168.coefficient86_152,
  OriginalRow227TriangleData1168.coefficient86_153,
  OriginalRow227TriangleData1168.coefficient86_154,
  OriginalRow227TriangleData1168.coefficient86_155,
  OriginalRow227TriangleData1168.coefficient86_156,
  OriginalRow227TriangleData1168.coefficient86_157,
  OriginalRow227TriangleData1168.coefficient86_158,
  OriginalRow227TriangleData1168.coefficient86_159,
  OriginalRow227TriangleData1168.coefficient86_160,
  OriginalRow227TriangleData1168.coefficient86_161,
  OriginalRow227TriangleData1168.coefficient86_162,
  OriginalRow227TriangleData1168.coefficient86_163,
  OriginalRow227TriangleData1168.coefficient86_164,
  OriginalRow227TriangleData1168.coefficient86_165,
  OriginalRow227TriangleData1168.coefficient86_166,
  OriginalRow227TriangleData1168.coefficient86_167,
  OriginalRow227TriangleData1168.coefficient86_168,
  OriginalRow227TriangleData1168.coefficient86_169,
  OriginalRow227TriangleData1168.coefficient86_170,
  OriginalRow227TriangleData1168.coefficient86_171,
  OriginalRow227TriangleData1168.coefficient86_172,
  OriginalRow227TriangleData1168.coefficient86_173,
  OriginalRow227TriangleData1168.coefficient86_174,
  OriginalRow227TriangleData1168.coefficient86_175,
  OriginalRow227TriangleData1168.coefficient86_176,
  OriginalRow227TriangleData1168.coefficient86_177,
  OriginalRow227TriangleData1168.coefficient86_178,
  OriginalRow227TriangleData1168.coefficient86_179,
  OriginalRow227TriangleData1168.coefficient86_180
]

theorem values1168_size : values1168.size = 32 := rfl

def block1168 : ℕ → Option IntervalDyadic := segment 149 values1168

theorem block1168_domain : ExactDomain block1168 149 181 := by
  simpa only [values1168_size] using segment_domain 149 values1168

theorem block1168_get (i : Fin 32) :
    block1168 (149 + i.val) = some (values1168[i.val]'(by rw [values1168_size]; exact i.isLt)) := by
  exact segment_get 149 values1168 ⟨i.val, by rw [values1168_size]; exact i.isLt⟩

def values1169 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1169.coefficient86_181,
  OriginalRow227TriangleData1169.coefficient86_182,
  OriginalRow227TriangleData1169.coefficient86_183,
  OriginalRow227TriangleData1169.coefficient86_184,
  OriginalRow227TriangleData1169.coefficient86_185,
  OriginalRow227TriangleData1169.coefficient86_186,
  OriginalRow227TriangleData1169.coefficient86_187,
  OriginalRow227TriangleData1169.coefficient86_188,
  OriginalRow227TriangleData1169.coefficient86_189,
  OriginalRow227TriangleData1169.coefficient86_190,
  OriginalRow227TriangleData1169.coefficient86_191,
  OriginalRow227TriangleData1169.coefficient86_192,
  OriginalRow227TriangleData1169.coefficient86_193,
  OriginalRow227TriangleData1169.coefficient86_194,
  OriginalRow227TriangleData1169.coefficient86_195,
  OriginalRow227TriangleData1169.coefficient86_196,
  OriginalRow227TriangleData1169.coefficient86_197,
  OriginalRow227TriangleData1169.coefficient86_198,
  OriginalRow227TriangleData1169.coefficient86_199,
  OriginalRow227TriangleData1169.coefficient86_200,
  OriginalRow227TriangleData1169.coefficient86_201,
  OriginalRow227TriangleData1169.coefficient86_202,
  OriginalRow227TriangleData1169.coefficient86_203,
  OriginalRow227TriangleData1169.coefficient86_204,
  OriginalRow227TriangleData1169.coefficient86_205,
  OriginalRow227TriangleData1169.coefficient86_206,
  OriginalRow227TriangleData1169.coefficient86_207,
  OriginalRow227TriangleData1169.coefficient86_208,
  OriginalRow227TriangleData1169.coefficient86_209,
  OriginalRow227TriangleData1169.coefficient86_210,
  OriginalRow227TriangleData1169.coefficient86_211,
  OriginalRow227TriangleData1169.coefficient86_212
]

theorem values1169_size : values1169.size = 32 := rfl

def block1169 : ℕ → Option IntervalDyadic := segment 181 values1169

theorem block1169_domain : ExactDomain block1169 181 213 := by
  simpa only [values1169_size] using segment_domain 181 values1169

theorem block1169_get (i : Fin 32) :
    block1169 (181 + i.val) = some (values1169[i.val]'(by rw [values1169_size]; exact i.isLt)) := by
  exact segment_get 181 values1169 ⟨i.val, by rw [values1169_size]; exact i.isLt⟩

def values1170 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1170.coefficient86_213,
  OriginalRow227TriangleData1170.coefficient86_214,
  OriginalRow227TriangleData1170.coefficient86_215,
  OriginalRow227TriangleData1170.coefficient86_216,
  OriginalRow227TriangleData1170.coefficient86_217,
  OriginalRow227TriangleData1170.coefficient86_218,
  OriginalRow227TriangleData1170.coefficient86_219,
  OriginalRow227TriangleData1170.coefficient86_220,
  OriginalRow227TriangleData1170.coefficient86_221,
  OriginalRow227TriangleData1170.coefficient86_222,
  OriginalRow227TriangleData1170.coefficient86_223,
  OriginalRow227TriangleData1170.coefficient86_224,
  OriginalRow227TriangleData1170.coefficient86_225,
  OriginalRow227TriangleData1170.coefficient86_226,
  OriginalRow227TriangleData1170.coefficient86_227,
  OriginalRow227TriangleData1170.coefficient86_228,
  OriginalRow227TriangleData1170.coefficient86_229,
  OriginalRow227TriangleData1170.coefficient86_230,
  OriginalRow227TriangleData1170.coefficient86_231,
  OriginalRow227TriangleData1170.coefficient86_232,
  OriginalRow227TriangleData1170.coefficient86_233,
  OriginalRow227TriangleData1170.coefficient86_234,
  OriginalRow227TriangleData1170.coefficient86_235,
  OriginalRow227TriangleData1170.coefficient86_236,
  OriginalRow227TriangleData1170.coefficient86_237,
  OriginalRow227TriangleData1170.coefficient86_238,
  OriginalRow227TriangleData1170.coefficient86_239,
  OriginalRow227TriangleData1170.coefficient86_240,
  OriginalRow227TriangleData1170.coefficient86_241,
  OriginalRow227TriangleData1170.coefficient86_242,
  OriginalRow227TriangleData1170.coefficient86_243,
  OriginalRow227TriangleData1170.coefficient86_244
]

theorem values1170_size : values1170.size = 32 := rfl

def block1170 : ℕ → Option IntervalDyadic := segment 213 values1170

theorem block1170_domain : ExactDomain block1170 213 245 := by
  simpa only [values1170_size] using segment_domain 213 values1170

theorem block1170_get (i : Fin 32) :
    block1170 (213 + i.val) = some (values1170[i.val]'(by rw [values1170_size]; exact i.isLt)) := by
  exact segment_get 213 values1170 ⟨i.val, by rw [values1170_size]; exact i.isLt⟩

def values1171 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1171.coefficient86_245,
  OriginalRow227TriangleData1171.coefficient86_246,
  OriginalRow227TriangleData1171.coefficient86_247,
  OriginalRow227TriangleData1171.coefficient86_248,
  OriginalRow227TriangleData1171.coefficient86_249,
  OriginalRow227TriangleData1171.coefficient86_250,
  OriginalRow227TriangleData1171.coefficient86_251,
  OriginalRow227TriangleData1171.coefficient86_252,
  OriginalRow227TriangleData1171.coefficient86_253,
  OriginalRow227TriangleData1171.coefficient86_254,
  OriginalRow227TriangleData1171.coefficient86_255,
  OriginalRow227TriangleData1171.coefficient86_256,
  OriginalRow227TriangleData1171.coefficient86_257,
  OriginalRow227TriangleData1171.coefficient86_258,
  OriginalRow227TriangleData1171.coefficient86_259,
  OriginalRow227TriangleData1171.coefficient86_260,
  OriginalRow227TriangleData1171.coefficient86_261,
  OriginalRow227TriangleData1171.coefficient86_262,
  OriginalRow227TriangleData1171.coefficient86_263,
  OriginalRow227TriangleData1171.coefficient86_264,
  OriginalRow227TriangleData1171.coefficient86_265,
  OriginalRow227TriangleData1171.coefficient86_266,
  OriginalRow227TriangleData1171.coefficient86_267,
  OriginalRow227TriangleData1171.coefficient86_268,
  OriginalRow227TriangleData1171.coefficient86_269,
  OriginalRow227TriangleData1171.coefficient86_270,
  OriginalRow227TriangleData1171.coefficient86_271,
  OriginalRow227TriangleData1171.coefficient86_272,
  OriginalRow227TriangleData1171.coefficient86_273,
  OriginalRow227TriangleData1171.coefficient86_274,
  OriginalRow227TriangleData1171.coefficient86_275,
  OriginalRow227TriangleData1171.coefficient86_276
]

theorem values1171_size : values1171.size = 32 := rfl

def block1171 : ℕ → Option IntervalDyadic := segment 245 values1171

theorem block1171_domain : ExactDomain block1171 245 277 := by
  simpa only [values1171_size] using segment_domain 245 values1171

theorem block1171_get (i : Fin 32) :
    block1171 (245 + i.val) = some (values1171[i.val]'(by rw [values1171_size]; exact i.isLt)) := by
  exact segment_get 245 values1171 ⟨i.val, by rw [values1171_size]; exact i.isLt⟩

def values1172 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1172.coefficient86_277,
  OriginalRow227TriangleData1172.coefficient86_278,
  OriginalRow227TriangleData1172.coefficient86_279,
  OriginalRow227TriangleData1172.coefficient86_280,
  OriginalRow227TriangleData1172.coefficient86_281,
  OriginalRow227TriangleData1172.coefficient86_282,
  OriginalRow227TriangleData1172.coefficient86_283,
  OriginalRow227TriangleData1172.coefficient86_284,
  OriginalRow227TriangleData1172.coefficient86_285,
  OriginalRow227TriangleData1172.coefficient86_286,
  OriginalRow227TriangleData1172.coefficient86_287,
  OriginalRow227TriangleData1172.coefficient86_288,
  OriginalRow227TriangleData1172.coefficient86_289,
  OriginalRow227TriangleData1172.coefficient86_290,
  OriginalRow227TriangleData1172.coefficient86_291,
  OriginalRow227TriangleData1172.coefficient86_292,
  OriginalRow227TriangleData1172.coefficient86_293,
  OriginalRow227TriangleData1172.coefficient86_294,
  OriginalRow227TriangleData1172.coefficient86_295,
  OriginalRow227TriangleData1172.coefficient86_296,
  OriginalRow227TriangleData1172.coefficient86_297,
  OriginalRow227TriangleData1172.coefficient86_298,
  OriginalRow227TriangleData1172.coefficient86_299,
  OriginalRow227TriangleData1172.coefficient86_300,
  OriginalRow227TriangleData1172.coefficient86_301,
  OriginalRow227TriangleData1172.coefficient86_302,
  OriginalRow227TriangleData1172.coefficient86_303,
  OriginalRow227TriangleData1172.coefficient86_304,
  OriginalRow227TriangleData1172.coefficient86_305,
  OriginalRow227TriangleData1172.coefficient86_306,
  OriginalRow227TriangleData1172.coefficient86_307,
  OriginalRow227TriangleData1172.coefficient86_308
]

theorem values1172_size : values1172.size = 32 := rfl

def block1172 : ℕ → Option IntervalDyadic := segment 277 values1172

theorem block1172_domain : ExactDomain block1172 277 309 := by
  simpa only [values1172_size] using segment_domain 277 values1172

theorem block1172_get (i : Fin 32) :
    block1172 (277 + i.val) = some (values1172[i.val]'(by rw [values1172_size]; exact i.isLt)) := by
  exact segment_get 277 values1172 ⟨i.val, by rw [values1172_size]; exact i.isLt⟩

def values1173 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1173.coefficient86_309,
  OriginalRow227TriangleData1173.coefficient86_310,
  OriginalRow227TriangleData1173.coefficient86_311,
  OriginalRow227TriangleData1173.coefficient86_312,
  OriginalRow227TriangleData1173.coefficient86_313,
  OriginalRow227TriangleData1173.coefficient86_314,
  OriginalRow227TriangleData1173.coefficient86_315,
  OriginalRow227TriangleData1173.coefficient86_316,
  OriginalRow227TriangleData1173.coefficient86_317,
  OriginalRow227TriangleData1173.coefficient86_318,
  OriginalRow227TriangleData1173.coefficient86_319,
  OriginalRow227TriangleData1173.coefficient86_320,
  OriginalRow227TriangleData1173.coefficient86_321,
  OriginalRow227TriangleData1173.coefficient86_322,
  OriginalRow227TriangleData1173.coefficient86_323,
  OriginalRow227TriangleData1173.coefficient86_324,
  OriginalRow227TriangleData1173.coefficient86_325,
  OriginalRow227TriangleData1173.coefficient86_326,
  OriginalRow227TriangleData1173.coefficient86_327,
  OriginalRow227TriangleData1173.coefficient86_328,
  OriginalRow227TriangleData1173.coefficient86_329,
  OriginalRow227TriangleData1173.coefficient86_330,
  OriginalRow227TriangleData1173.coefficient86_331,
  OriginalRow227TriangleData1173.coefficient86_332,
  OriginalRow227TriangleData1173.coefficient86_333,
  OriginalRow227TriangleData1173.coefficient86_334,
  OriginalRow227TriangleData1173.coefficient86_335,
  OriginalRow227TriangleData1173.coefficient86_336,
  OriginalRow227TriangleData1173.coefficient86_337,
  OriginalRow227TriangleData1173.coefficient86_338,
  OriginalRow227TriangleData1173.coefficient86_339,
  OriginalRow227TriangleData1173.coefficient86_340
]

theorem values1173_size : values1173.size = 32 := rfl

def block1173 : ℕ → Option IntervalDyadic := segment 309 values1173

theorem block1173_domain : ExactDomain block1173 309 341 := by
  simpa only [values1173_size] using segment_domain 309 values1173

theorem block1173_get (i : Fin 32) :
    block1173 (309 + i.val) = some (values1173[i.val]'(by rw [values1173_size]; exact i.isLt)) := by
  exact segment_get 309 values1173 ⟨i.val, by rw [values1173_size]; exact i.isLt⟩

def values1174 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1174.coefficient86_341,
  OriginalRow227TriangleData1174.coefficient86_342,
  OriginalRow227TriangleData1174.coefficient86_343,
  OriginalRow227TriangleData1174.coefficient86_344,
  OriginalRow227TriangleData1174.coefficient86_345,
  OriginalRow227TriangleData1174.coefficient86_346,
  OriginalRow227TriangleData1174.coefficient86_347,
  OriginalRow227TriangleData1174.coefficient86_348,
  OriginalRow227TriangleData1174.coefficient86_349,
  OriginalRow227TriangleData1174.coefficient86_350,
  OriginalRow227TriangleData1174.coefficient86_351,
  OriginalRow227TriangleData1174.coefficient86_352,
  OriginalRow227TriangleData1174.coefficient86_353,
  OriginalRow227TriangleData1174.coefficient86_354,
  OriginalRow227TriangleData1174.coefficient86_355,
  OriginalRow227TriangleData1174.coefficient86_356,
  OriginalRow227TriangleData1174.coefficient86_357,
  OriginalRow227TriangleData1174.coefficient86_358,
  OriginalRow227TriangleData1174.coefficient86_359,
  OriginalRow227TriangleData1174.coefficient86_360,
  OriginalRow227TriangleData1174.coefficient86_361,
  OriginalRow227TriangleData1174.coefficient86_362,
  OriginalRow227TriangleData1174.coefficient86_363,
  OriginalRow227TriangleData1174.coefficient86_364,
  OriginalRow227TriangleData1174.coefficient86_365,
  OriginalRow227TriangleData1174.coefficient86_366,
  OriginalRow227TriangleData1174.coefficient86_367,
  OriginalRow227TriangleData1174.coefficient86_368,
  OriginalRow227TriangleData1174.coefficient86_369,
  OriginalRow227TriangleData1174.coefficient86_370,
  OriginalRow227TriangleData1174.coefficient86_371,
  OriginalRow227TriangleData1174.coefficient86_372
]

theorem values1174_size : values1174.size = 32 := rfl

def block1174 : ℕ → Option IntervalDyadic := segment 341 values1174

theorem block1174_domain : ExactDomain block1174 341 373 := by
  simpa only [values1174_size] using segment_domain 341 values1174

theorem block1174_get (i : Fin 32) :
    block1174 (341 + i.val) = some (values1174[i.val]'(by rw [values1174_size]; exact i.isLt)) := by
  exact segment_get 341 values1174 ⟨i.val, by rw [values1174_size]; exact i.isLt⟩

def values1175 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1175.coefficient86_373,
  OriginalRow227TriangleData1175.coefficient86_374,
  OriginalRow227TriangleData1175.coefficient86_375,
  OriginalRow227TriangleData1175.coefficient86_376,
  OriginalRow227TriangleData1175.coefficient86_377,
  OriginalRow227TriangleData1175.coefficient86_378,
  OriginalRow227TriangleData1175.coefficient86_379,
  OriginalRow227TriangleData1175.coefficient86_380,
  OriginalRow227TriangleData1175.coefficient86_381,
  OriginalRow227TriangleData1175.coefficient86_382,
  OriginalRow227TriangleData1175.coefficient86_383,
  OriginalRow227TriangleData1175.coefficient86_384,
  OriginalRow227TriangleData1175.coefficient86_385,
  OriginalRow227TriangleData1175.coefficient86_386,
  OriginalRow227TriangleData1175.coefficient86_387,
  OriginalRow227TriangleData1175.coefficient86_388,
  OriginalRow227TriangleData1175.coefficient86_389,
  OriginalRow227TriangleData1175.coefficient86_390,
  OriginalRow227TriangleData1175.coefficient86_391,
  OriginalRow227TriangleData1175.coefficient86_392,
  OriginalRow227TriangleData1175.coefficient86_393,
  OriginalRow227TriangleData1175.coefficient86_394,
  OriginalRow227TriangleData1175.coefficient86_395,
  OriginalRow227TriangleData1175.coefficient86_396,
  OriginalRow227TriangleData1175.coefficient86_397,
  OriginalRow227TriangleData1175.coefficient86_398,
  OriginalRow227TriangleData1175.coefficient86_399,
  OriginalRow227TriangleData1175.coefficient86_400,
  OriginalRow227TriangleData1175.coefficient86_401,
  OriginalRow227TriangleData1175.coefficient86_402,
  OriginalRow227TriangleData1175.coefficient86_403,
  OriginalRow227TriangleData1175.coefficient86_404
]

theorem values1175_size : values1175.size = 32 := rfl

def block1175 : ℕ → Option IntervalDyadic := segment 373 values1175

theorem block1175_domain : ExactDomain block1175 373 405 := by
  simpa only [values1175_size] using segment_domain 373 values1175

theorem block1175_get (i : Fin 32) :
    block1175 (373 + i.val) = some (values1175[i.val]'(by rw [values1175_size]; exact i.isLt)) := by
  exact segment_get 373 values1175 ⟨i.val, by rw [values1175_size]; exact i.isLt⟩

def values1176 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1176.coefficient86_405,
  OriginalRow227TriangleData1176.coefficient86_406,
  OriginalRow227TriangleData1176.coefficient86_407,
  OriginalRow227TriangleData1176.coefficient86_408,
  OriginalRow227TriangleData1176.coefficient86_409,
  OriginalRow227TriangleData1176.coefficient86_410,
  OriginalRow227TriangleData1176.coefficient86_411,
  OriginalRow227TriangleData1176.coefficient86_412,
  OriginalRow227TriangleData1176.coefficient86_413,
  OriginalRow227TriangleData1176.coefficient86_414,
  OriginalRow227TriangleData1176.coefficient86_415
]

theorem values1176_size : values1176.size = 11 := rfl

def block1176 : ℕ → Option IntervalDyadic := segment 405 values1176

theorem block1176_domain : ExactDomain block1176 405 416 := by
  simpa only [values1176_size] using segment_domain 405 values1176

theorem block1176_get (i : Fin 11) :
    block1176 (405 + i.val) = some (values1176[i.val]'(by rw [values1176_size]; exact i.isLt)) := by
  exact segment_get 405 values1176 ⟨i.val, by rw [values1176_size]; exact i.isLt⟩

def node0085_0149 : ℕ → Option IntervalDyadic := split 117 block1166 block1167

theorem node0085_0149_domain : ExactDomain node0085_0149 85 149 := by
  exact split_domain (by decide) (by decide) block1166_domain block1167_domain

def node0181_0245 : ℕ → Option IntervalDyadic := split 213 block1169 block1170

theorem node0181_0245_domain : ExactDomain node0181_0245 181 245 := by
  exact split_domain (by decide) (by decide) block1169_domain block1170_domain

def node0149_0245 : ℕ → Option IntervalDyadic := split 181 block1168 node0181_0245

theorem node0149_0245_domain : ExactDomain node0149_0245 149 245 := by
  exact split_domain (by decide) (by decide) block1168_domain node0181_0245_domain

def node0085_0245 : ℕ → Option IntervalDyadic := split 149 node0085_0149 node0149_0245

theorem node0085_0245_domain : ExactDomain node0085_0245 85 245 := by
  exact split_domain (by decide) (by decide) node0085_0149_domain node0149_0245_domain

def node0277_0341 : ℕ → Option IntervalDyadic := split 309 block1172 block1173

theorem node0277_0341_domain : ExactDomain node0277_0341 277 341 := by
  exact split_domain (by decide) (by decide) block1172_domain block1173_domain

def node0245_0341 : ℕ → Option IntervalDyadic := split 277 block1171 node0277_0341

theorem node0245_0341_domain : ExactDomain node0245_0341 245 341 := by
  exact split_domain (by decide) (by decide) block1171_domain node0277_0341_domain

def node0373_0416 : ℕ → Option IntervalDyadic := split 405 block1175 block1176

theorem node0373_0416_domain : ExactDomain node0373_0416 373 416 := by
  exact split_domain (by decide) (by decide) block1175_domain block1176_domain

def node0341_0416 : ℕ → Option IntervalDyadic := split 373 block1174 node0373_0416

theorem node0341_0416_domain : ExactDomain node0341_0416 341 416 := by
  exact split_domain (by decide) (by decide) block1174_domain node0373_0416_domain

def node0245_0416 : ℕ → Option IntervalDyadic := split 341 node0245_0341 node0341_0416

theorem node0245_0416_domain : ExactDomain node0245_0416 245 416 := by
  exact split_domain (by decide) (by decide) node0245_0341_domain node0341_0416_domain

def node0085_0416 : ℕ → Option IntervalDyadic := split 245 node0085_0245 node0245_0416

theorem node0085_0416_domain : ExactDomain node0085_0416 85 416 := by
  exact split_domain (by decide) (by decide) node0085_0245_domain node0245_0416_domain

def lookup : ℕ → Option IntervalDyadic := node0085_0416

theorem lookup_domain : ExactDomain lookup 85 416 :=
  node0085_0416_domain

theorem block1166_lookup (i : Fin 32) :
    lookup (85 + i.val) = some (values1166[i.val]'(by rw [values1166_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (85 + i.val) = _
  rw [node0085_0416, split_left 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0085_0245, split_left 149 node0085_0149 node0149_0245 (by omega)]
  rw [node0085_0149, split_left 117 block1166 block1167 (by omega)]
  exact block1166_get i

theorem block1167_lookup (i : Fin 32) :
    lookup (117 + i.val) = some (values1167[i.val]'(by rw [values1167_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (117 + i.val) = _
  rw [node0085_0416, split_left 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0085_0245, split_left 149 node0085_0149 node0149_0245 (by omega)]
  rw [node0085_0149, split_right 117 block1166 block1167 (by omega)]
  exact block1167_get i

theorem block1168_lookup (i : Fin 32) :
    lookup (149 + i.val) = some (values1168[i.val]'(by rw [values1168_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (149 + i.val) = _
  rw [node0085_0416, split_left 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0085_0245, split_right 149 node0085_0149 node0149_0245 (by omega)]
  rw [node0149_0245, split_left 181 block1168 node0181_0245 (by omega)]
  exact block1168_get i

theorem block1169_lookup (i : Fin 32) :
    lookup (181 + i.val) = some (values1169[i.val]'(by rw [values1169_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (181 + i.val) = _
  rw [node0085_0416, split_left 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0085_0245, split_right 149 node0085_0149 node0149_0245 (by omega)]
  rw [node0149_0245, split_right 181 block1168 node0181_0245 (by omega)]
  rw [node0181_0245, split_left 213 block1169 block1170 (by omega)]
  exact block1169_get i

theorem block1170_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values1170[i.val]'(by rw [values1170_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (213 + i.val) = _
  rw [node0085_0416, split_left 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0085_0245, split_right 149 node0085_0149 node0149_0245 (by omega)]
  rw [node0149_0245, split_right 181 block1168 node0181_0245 (by omega)]
  rw [node0181_0245, split_right 213 block1169 block1170 (by omega)]
  exact block1170_get i

theorem block1171_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values1171[i.val]'(by rw [values1171_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (245 + i.val) = _
  rw [node0085_0416, split_right 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0245_0416, split_left 341 node0245_0341 node0341_0416 (by omega)]
  rw [node0245_0341, split_left 277 block1171 node0277_0341 (by omega)]
  exact block1171_get i

theorem block1172_lookup (i : Fin 32) :
    lookup (277 + i.val) = some (values1172[i.val]'(by rw [values1172_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (277 + i.val) = _
  rw [node0085_0416, split_right 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0245_0416, split_left 341 node0245_0341 node0341_0416 (by omega)]
  rw [node0245_0341, split_right 277 block1171 node0277_0341 (by omega)]
  rw [node0277_0341, split_left 309 block1172 block1173 (by omega)]
  exact block1172_get i

theorem block1173_lookup (i : Fin 32) :
    lookup (309 + i.val) = some (values1173[i.val]'(by rw [values1173_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (309 + i.val) = _
  rw [node0085_0416, split_right 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0245_0416, split_left 341 node0245_0341 node0341_0416 (by omega)]
  rw [node0245_0341, split_right 277 block1171 node0277_0341 (by omega)]
  rw [node0277_0341, split_right 309 block1172 block1173 (by omega)]
  exact block1173_get i

theorem block1174_lookup (i : Fin 32) :
    lookup (341 + i.val) = some (values1174[i.val]'(by rw [values1174_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (341 + i.val) = _
  rw [node0085_0416, split_right 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0245_0416, split_right 341 node0245_0341 node0341_0416 (by omega)]
  rw [node0341_0416, split_left 373 block1174 node0373_0416 (by omega)]
  exact block1174_get i

theorem block1175_lookup (i : Fin 32) :
    lookup (373 + i.val) = some (values1175[i.val]'(by rw [values1175_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (373 + i.val) = _
  rw [node0085_0416, split_right 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0245_0416, split_right 341 node0245_0341 node0341_0416 (by omega)]
  rw [node0341_0416, split_right 373 block1174 node0373_0416 (by omega)]
  rw [node0373_0416, split_left 405 block1175 block1176 (by omega)]
  exact block1175_get i

theorem block1176_lookup (i : Fin 11) :
    lookup (405 + i.val) = some (values1176[i.val]'(by rw [values1176_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0085_0416 (405 + i.val) = _
  rw [node0085_0416, split_right 245 node0085_0245 node0245_0416 (by omega)]
  rw [node0245_0416, split_right 341 node0245_0341 node0341_0416 (by omega)]
  rw [node0341_0416, split_right 373 block1174 node0373_0416 (by omega)]
  rw [node0373_0416, split_right 405 block1175 block1176 (by omega)]
  exact block1176_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1166_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1166_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1167_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1167_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1168_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1168_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1169_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1169_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1170_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1170_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1171_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1171_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1172_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1172_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1173_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1173_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1174_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1174_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1175_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1175_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1176_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1176_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1166_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1167_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1168_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1169_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1170_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1171_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1172_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1173_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1174_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1175_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow086.block1176_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow086
