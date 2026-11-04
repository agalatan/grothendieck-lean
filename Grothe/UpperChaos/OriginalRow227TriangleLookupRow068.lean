import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0960
import Grothe.UpperChaos.OriginalRow227TriangleData0961
import Grothe.UpperChaos.OriginalRow227TriangleData0962
import Grothe.UpperChaos.OriginalRow227TriangleData0963
import Grothe.UpperChaos.OriginalRow227TriangleData0964
import Grothe.UpperChaos.OriginalRow227TriangleData0965
import Grothe.UpperChaos.OriginalRow227TriangleData0966
import Grothe.UpperChaos.OriginalRow227TriangleData0967
import Grothe.UpperChaos.OriginalRow227TriangleData0968
import Grothe.UpperChaos.OriginalRow227TriangleData0969
import Grothe.UpperChaos.OriginalRow227TriangleData0970
import Grothe.UpperChaos.OriginalRow227TriangleData0971

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow068

open ConditionalTableLookup

def values0960 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0960.coefficient68_67,
  OriginalRow227TriangleData0960.coefficient68_68,
  OriginalRow227TriangleData0960.coefficient68_69,
  OriginalRow227TriangleData0960.coefficient68_70,
  OriginalRow227TriangleData0960.coefficient68_71,
  OriginalRow227TriangleData0960.coefficient68_72,
  OriginalRow227TriangleData0960.coefficient68_73,
  OriginalRow227TriangleData0960.coefficient68_74,
  OriginalRow227TriangleData0960.coefficient68_75,
  OriginalRow227TriangleData0960.coefficient68_76,
  OriginalRow227TriangleData0960.coefficient68_77,
  OriginalRow227TriangleData0960.coefficient68_78,
  OriginalRow227TriangleData0960.coefficient68_79,
  OriginalRow227TriangleData0960.coefficient68_80,
  OriginalRow227TriangleData0960.coefficient68_81,
  OriginalRow227TriangleData0960.coefficient68_82,
  OriginalRow227TriangleData0960.coefficient68_83,
  OriginalRow227TriangleData0960.coefficient68_84,
  OriginalRow227TriangleData0960.coefficient68_85,
  OriginalRow227TriangleData0960.coefficient68_86,
  OriginalRow227TriangleData0960.coefficient68_87,
  OriginalRow227TriangleData0960.coefficient68_88,
  OriginalRow227TriangleData0960.coefficient68_89,
  OriginalRow227TriangleData0960.coefficient68_90,
  OriginalRow227TriangleData0960.coefficient68_91,
  OriginalRow227TriangleData0960.coefficient68_92,
  OriginalRow227TriangleData0960.coefficient68_93,
  OriginalRow227TriangleData0960.coefficient68_94,
  OriginalRow227TriangleData0960.coefficient68_95,
  OriginalRow227TriangleData0960.coefficient68_96,
  OriginalRow227TriangleData0960.coefficient68_97,
  OriginalRow227TriangleData0960.coefficient68_98
]

theorem values0960_size : values0960.size = 32 := rfl

def block0960 : ℕ → Option IntervalDyadic := segment 67 values0960

theorem block0960_domain : ExactDomain block0960 67 99 := by
  simpa only [values0960_size] using segment_domain 67 values0960

theorem block0960_get (i : Fin 32) :
    block0960 (67 + i.val) = some (values0960[i.val]'(by rw [values0960_size]; exact i.isLt)) := by
  exact segment_get 67 values0960 ⟨i.val, by rw [values0960_size]; exact i.isLt⟩

def values0961 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0961.coefficient68_99,
  OriginalRow227TriangleData0961.coefficient68_100,
  OriginalRow227TriangleData0961.coefficient68_101,
  OriginalRow227TriangleData0961.coefficient68_102,
  OriginalRow227TriangleData0961.coefficient68_103,
  OriginalRow227TriangleData0961.coefficient68_104,
  OriginalRow227TriangleData0961.coefficient68_105,
  OriginalRow227TriangleData0961.coefficient68_106,
  OriginalRow227TriangleData0961.coefficient68_107,
  OriginalRow227TriangleData0961.coefficient68_108,
  OriginalRow227TriangleData0961.coefficient68_109,
  OriginalRow227TriangleData0961.coefficient68_110,
  OriginalRow227TriangleData0961.coefficient68_111,
  OriginalRow227TriangleData0961.coefficient68_112,
  OriginalRow227TriangleData0961.coefficient68_113,
  OriginalRow227TriangleData0961.coefficient68_114,
  OriginalRow227TriangleData0961.coefficient68_115,
  OriginalRow227TriangleData0961.coefficient68_116,
  OriginalRow227TriangleData0961.coefficient68_117,
  OriginalRow227TriangleData0961.coefficient68_118,
  OriginalRow227TriangleData0961.coefficient68_119,
  OriginalRow227TriangleData0961.coefficient68_120,
  OriginalRow227TriangleData0961.coefficient68_121,
  OriginalRow227TriangleData0961.coefficient68_122,
  OriginalRow227TriangleData0961.coefficient68_123,
  OriginalRow227TriangleData0961.coefficient68_124,
  OriginalRow227TriangleData0961.coefficient68_125,
  OriginalRow227TriangleData0961.coefficient68_126,
  OriginalRow227TriangleData0961.coefficient68_127,
  OriginalRow227TriangleData0961.coefficient68_128,
  OriginalRow227TriangleData0961.coefficient68_129,
  OriginalRow227TriangleData0961.coefficient68_130
]

theorem values0961_size : values0961.size = 32 := rfl

def block0961 : ℕ → Option IntervalDyadic := segment 99 values0961

theorem block0961_domain : ExactDomain block0961 99 131 := by
  simpa only [values0961_size] using segment_domain 99 values0961

theorem block0961_get (i : Fin 32) :
    block0961 (99 + i.val) = some (values0961[i.val]'(by rw [values0961_size]; exact i.isLt)) := by
  exact segment_get 99 values0961 ⟨i.val, by rw [values0961_size]; exact i.isLt⟩

def values0962 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0962.coefficient68_131,
  OriginalRow227TriangleData0962.coefficient68_132,
  OriginalRow227TriangleData0962.coefficient68_133,
  OriginalRow227TriangleData0962.coefficient68_134,
  OriginalRow227TriangleData0962.coefficient68_135,
  OriginalRow227TriangleData0962.coefficient68_136,
  OriginalRow227TriangleData0962.coefficient68_137,
  OriginalRow227TriangleData0962.coefficient68_138,
  OriginalRow227TriangleData0962.coefficient68_139,
  OriginalRow227TriangleData0962.coefficient68_140,
  OriginalRow227TriangleData0962.coefficient68_141,
  OriginalRow227TriangleData0962.coefficient68_142,
  OriginalRow227TriangleData0962.coefficient68_143,
  OriginalRow227TriangleData0962.coefficient68_144,
  OriginalRow227TriangleData0962.coefficient68_145,
  OriginalRow227TriangleData0962.coefficient68_146,
  OriginalRow227TriangleData0962.coefficient68_147,
  OriginalRow227TriangleData0962.coefficient68_148,
  OriginalRow227TriangleData0962.coefficient68_149,
  OriginalRow227TriangleData0962.coefficient68_150,
  OriginalRow227TriangleData0962.coefficient68_151,
  OriginalRow227TriangleData0962.coefficient68_152,
  OriginalRow227TriangleData0962.coefficient68_153,
  OriginalRow227TriangleData0962.coefficient68_154,
  OriginalRow227TriangleData0962.coefficient68_155,
  OriginalRow227TriangleData0962.coefficient68_156,
  OriginalRow227TriangleData0962.coefficient68_157,
  OriginalRow227TriangleData0962.coefficient68_158,
  OriginalRow227TriangleData0962.coefficient68_159,
  OriginalRow227TriangleData0962.coefficient68_160,
  OriginalRow227TriangleData0962.coefficient68_161,
  OriginalRow227TriangleData0962.coefficient68_162
]

theorem values0962_size : values0962.size = 32 := rfl

def block0962 : ℕ → Option IntervalDyadic := segment 131 values0962

theorem block0962_domain : ExactDomain block0962 131 163 := by
  simpa only [values0962_size] using segment_domain 131 values0962

theorem block0962_get (i : Fin 32) :
    block0962 (131 + i.val) = some (values0962[i.val]'(by rw [values0962_size]; exact i.isLt)) := by
  exact segment_get 131 values0962 ⟨i.val, by rw [values0962_size]; exact i.isLt⟩

def values0963 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0963.coefficient68_163,
  OriginalRow227TriangleData0963.coefficient68_164,
  OriginalRow227TriangleData0963.coefficient68_165,
  OriginalRow227TriangleData0963.coefficient68_166,
  OriginalRow227TriangleData0963.coefficient68_167,
  OriginalRow227TriangleData0963.coefficient68_168,
  OriginalRow227TriangleData0963.coefficient68_169,
  OriginalRow227TriangleData0963.coefficient68_170,
  OriginalRow227TriangleData0963.coefficient68_171,
  OriginalRow227TriangleData0963.coefficient68_172,
  OriginalRow227TriangleData0963.coefficient68_173,
  OriginalRow227TriangleData0963.coefficient68_174,
  OriginalRow227TriangleData0963.coefficient68_175,
  OriginalRow227TriangleData0963.coefficient68_176,
  OriginalRow227TriangleData0963.coefficient68_177,
  OriginalRow227TriangleData0963.coefficient68_178,
  OriginalRow227TriangleData0963.coefficient68_179,
  OriginalRow227TriangleData0963.coefficient68_180,
  OriginalRow227TriangleData0963.coefficient68_181,
  OriginalRow227TriangleData0963.coefficient68_182,
  OriginalRow227TriangleData0963.coefficient68_183,
  OriginalRow227TriangleData0963.coefficient68_184,
  OriginalRow227TriangleData0963.coefficient68_185,
  OriginalRow227TriangleData0963.coefficient68_186,
  OriginalRow227TriangleData0963.coefficient68_187,
  OriginalRow227TriangleData0963.coefficient68_188,
  OriginalRow227TriangleData0963.coefficient68_189,
  OriginalRow227TriangleData0963.coefficient68_190,
  OriginalRow227TriangleData0963.coefficient68_191,
  OriginalRow227TriangleData0963.coefficient68_192,
  OriginalRow227TriangleData0963.coefficient68_193,
  OriginalRow227TriangleData0963.coefficient68_194
]

theorem values0963_size : values0963.size = 32 := rfl

def block0963 : ℕ → Option IntervalDyadic := segment 163 values0963

theorem block0963_domain : ExactDomain block0963 163 195 := by
  simpa only [values0963_size] using segment_domain 163 values0963

theorem block0963_get (i : Fin 32) :
    block0963 (163 + i.val) = some (values0963[i.val]'(by rw [values0963_size]; exact i.isLt)) := by
  exact segment_get 163 values0963 ⟨i.val, by rw [values0963_size]; exact i.isLt⟩

def values0964 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0964.coefficient68_195,
  OriginalRow227TriangleData0964.coefficient68_196,
  OriginalRow227TriangleData0964.coefficient68_197,
  OriginalRow227TriangleData0964.coefficient68_198,
  OriginalRow227TriangleData0964.coefficient68_199,
  OriginalRow227TriangleData0964.coefficient68_200,
  OriginalRow227TriangleData0964.coefficient68_201,
  OriginalRow227TriangleData0964.coefficient68_202,
  OriginalRow227TriangleData0964.coefficient68_203,
  OriginalRow227TriangleData0964.coefficient68_204,
  OriginalRow227TriangleData0964.coefficient68_205,
  OriginalRow227TriangleData0964.coefficient68_206,
  OriginalRow227TriangleData0964.coefficient68_207,
  OriginalRow227TriangleData0964.coefficient68_208,
  OriginalRow227TriangleData0964.coefficient68_209,
  OriginalRow227TriangleData0964.coefficient68_210,
  OriginalRow227TriangleData0964.coefficient68_211,
  OriginalRow227TriangleData0964.coefficient68_212,
  OriginalRow227TriangleData0964.coefficient68_213,
  OriginalRow227TriangleData0964.coefficient68_214,
  OriginalRow227TriangleData0964.coefficient68_215,
  OriginalRow227TriangleData0964.coefficient68_216,
  OriginalRow227TriangleData0964.coefficient68_217,
  OriginalRow227TriangleData0964.coefficient68_218,
  OriginalRow227TriangleData0964.coefficient68_219,
  OriginalRow227TriangleData0964.coefficient68_220,
  OriginalRow227TriangleData0964.coefficient68_221,
  OriginalRow227TriangleData0964.coefficient68_222,
  OriginalRow227TriangleData0964.coefficient68_223,
  OriginalRow227TriangleData0964.coefficient68_224,
  OriginalRow227TriangleData0964.coefficient68_225,
  OriginalRow227TriangleData0964.coefficient68_226
]

theorem values0964_size : values0964.size = 32 := rfl

def block0964 : ℕ → Option IntervalDyadic := segment 195 values0964

theorem block0964_domain : ExactDomain block0964 195 227 := by
  simpa only [values0964_size] using segment_domain 195 values0964

theorem block0964_get (i : Fin 32) :
    block0964 (195 + i.val) = some (values0964[i.val]'(by rw [values0964_size]; exact i.isLt)) := by
  exact segment_get 195 values0964 ⟨i.val, by rw [values0964_size]; exact i.isLt⟩

def values0965 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0965.coefficient68_227,
  OriginalRow227TriangleData0965.coefficient68_228,
  OriginalRow227TriangleData0965.coefficient68_229,
  OriginalRow227TriangleData0965.coefficient68_230,
  OriginalRow227TriangleData0965.coefficient68_231,
  OriginalRow227TriangleData0965.coefficient68_232,
  OriginalRow227TriangleData0965.coefficient68_233,
  OriginalRow227TriangleData0965.coefficient68_234,
  OriginalRow227TriangleData0965.coefficient68_235,
  OriginalRow227TriangleData0965.coefficient68_236,
  OriginalRow227TriangleData0965.coefficient68_237,
  OriginalRow227TriangleData0965.coefficient68_238,
  OriginalRow227TriangleData0965.coefficient68_239,
  OriginalRow227TriangleData0965.coefficient68_240,
  OriginalRow227TriangleData0965.coefficient68_241,
  OriginalRow227TriangleData0965.coefficient68_242,
  OriginalRow227TriangleData0965.coefficient68_243,
  OriginalRow227TriangleData0965.coefficient68_244,
  OriginalRow227TriangleData0965.coefficient68_245,
  OriginalRow227TriangleData0965.coefficient68_246,
  OriginalRow227TriangleData0965.coefficient68_247,
  OriginalRow227TriangleData0965.coefficient68_248,
  OriginalRow227TriangleData0965.coefficient68_249,
  OriginalRow227TriangleData0965.coefficient68_250,
  OriginalRow227TriangleData0965.coefficient68_251,
  OriginalRow227TriangleData0965.coefficient68_252,
  OriginalRow227TriangleData0965.coefficient68_253,
  OriginalRow227TriangleData0965.coefficient68_254,
  OriginalRow227TriangleData0965.coefficient68_255,
  OriginalRow227TriangleData0965.coefficient68_256,
  OriginalRow227TriangleData0965.coefficient68_257,
  OriginalRow227TriangleData0965.coefficient68_258
]

theorem values0965_size : values0965.size = 32 := rfl

def block0965 : ℕ → Option IntervalDyadic := segment 227 values0965

theorem block0965_domain : ExactDomain block0965 227 259 := by
  simpa only [values0965_size] using segment_domain 227 values0965

theorem block0965_get (i : Fin 32) :
    block0965 (227 + i.val) = some (values0965[i.val]'(by rw [values0965_size]; exact i.isLt)) := by
  exact segment_get 227 values0965 ⟨i.val, by rw [values0965_size]; exact i.isLt⟩

def values0966 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0966.coefficient68_259,
  OriginalRow227TriangleData0966.coefficient68_260,
  OriginalRow227TriangleData0966.coefficient68_261,
  OriginalRow227TriangleData0966.coefficient68_262,
  OriginalRow227TriangleData0966.coefficient68_263,
  OriginalRow227TriangleData0966.coefficient68_264,
  OriginalRow227TriangleData0966.coefficient68_265,
  OriginalRow227TriangleData0966.coefficient68_266,
  OriginalRow227TriangleData0966.coefficient68_267,
  OriginalRow227TriangleData0966.coefficient68_268,
  OriginalRow227TriangleData0966.coefficient68_269,
  OriginalRow227TriangleData0966.coefficient68_270,
  OriginalRow227TriangleData0966.coefficient68_271,
  OriginalRow227TriangleData0966.coefficient68_272,
  OriginalRow227TriangleData0966.coefficient68_273,
  OriginalRow227TriangleData0966.coefficient68_274,
  OriginalRow227TriangleData0966.coefficient68_275,
  OriginalRow227TriangleData0966.coefficient68_276,
  OriginalRow227TriangleData0966.coefficient68_277,
  OriginalRow227TriangleData0966.coefficient68_278,
  OriginalRow227TriangleData0966.coefficient68_279,
  OriginalRow227TriangleData0966.coefficient68_280,
  OriginalRow227TriangleData0966.coefficient68_281,
  OriginalRow227TriangleData0966.coefficient68_282,
  OriginalRow227TriangleData0966.coefficient68_283,
  OriginalRow227TriangleData0966.coefficient68_284,
  OriginalRow227TriangleData0966.coefficient68_285,
  OriginalRow227TriangleData0966.coefficient68_286,
  OriginalRow227TriangleData0966.coefficient68_287,
  OriginalRow227TriangleData0966.coefficient68_288,
  OriginalRow227TriangleData0966.coefficient68_289,
  OriginalRow227TriangleData0966.coefficient68_290
]

theorem values0966_size : values0966.size = 32 := rfl

def block0966 : ℕ → Option IntervalDyadic := segment 259 values0966

theorem block0966_domain : ExactDomain block0966 259 291 := by
  simpa only [values0966_size] using segment_domain 259 values0966

theorem block0966_get (i : Fin 32) :
    block0966 (259 + i.val) = some (values0966[i.val]'(by rw [values0966_size]; exact i.isLt)) := by
  exact segment_get 259 values0966 ⟨i.val, by rw [values0966_size]; exact i.isLt⟩

def values0967 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0967.coefficient68_291,
  OriginalRow227TriangleData0967.coefficient68_292,
  OriginalRow227TriangleData0967.coefficient68_293,
  OriginalRow227TriangleData0967.coefficient68_294,
  OriginalRow227TriangleData0967.coefficient68_295,
  OriginalRow227TriangleData0967.coefficient68_296,
  OriginalRow227TriangleData0967.coefficient68_297,
  OriginalRow227TriangleData0967.coefficient68_298,
  OriginalRow227TriangleData0967.coefficient68_299,
  OriginalRow227TriangleData0967.coefficient68_300,
  OriginalRow227TriangleData0967.coefficient68_301,
  OriginalRow227TriangleData0967.coefficient68_302,
  OriginalRow227TriangleData0967.coefficient68_303,
  OriginalRow227TriangleData0967.coefficient68_304,
  OriginalRow227TriangleData0967.coefficient68_305,
  OriginalRow227TriangleData0967.coefficient68_306,
  OriginalRow227TriangleData0967.coefficient68_307,
  OriginalRow227TriangleData0967.coefficient68_308,
  OriginalRow227TriangleData0967.coefficient68_309,
  OriginalRow227TriangleData0967.coefficient68_310,
  OriginalRow227TriangleData0967.coefficient68_311,
  OriginalRow227TriangleData0967.coefficient68_312,
  OriginalRow227TriangleData0967.coefficient68_313,
  OriginalRow227TriangleData0967.coefficient68_314,
  OriginalRow227TriangleData0967.coefficient68_315,
  OriginalRow227TriangleData0967.coefficient68_316,
  OriginalRow227TriangleData0967.coefficient68_317,
  OriginalRow227TriangleData0967.coefficient68_318,
  OriginalRow227TriangleData0967.coefficient68_319,
  OriginalRow227TriangleData0967.coefficient68_320,
  OriginalRow227TriangleData0967.coefficient68_321,
  OriginalRow227TriangleData0967.coefficient68_322
]

theorem values0967_size : values0967.size = 32 := rfl

def block0967 : ℕ → Option IntervalDyadic := segment 291 values0967

theorem block0967_domain : ExactDomain block0967 291 323 := by
  simpa only [values0967_size] using segment_domain 291 values0967

theorem block0967_get (i : Fin 32) :
    block0967 (291 + i.val) = some (values0967[i.val]'(by rw [values0967_size]; exact i.isLt)) := by
  exact segment_get 291 values0967 ⟨i.val, by rw [values0967_size]; exact i.isLt⟩

def values0968 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0968.coefficient68_323,
  OriginalRow227TriangleData0968.coefficient68_324,
  OriginalRow227TriangleData0968.coefficient68_325,
  OriginalRow227TriangleData0968.coefficient68_326,
  OriginalRow227TriangleData0968.coefficient68_327,
  OriginalRow227TriangleData0968.coefficient68_328,
  OriginalRow227TriangleData0968.coefficient68_329,
  OriginalRow227TriangleData0968.coefficient68_330,
  OriginalRow227TriangleData0968.coefficient68_331,
  OriginalRow227TriangleData0968.coefficient68_332,
  OriginalRow227TriangleData0968.coefficient68_333,
  OriginalRow227TriangleData0968.coefficient68_334,
  OriginalRow227TriangleData0968.coefficient68_335,
  OriginalRow227TriangleData0968.coefficient68_336,
  OriginalRow227TriangleData0968.coefficient68_337,
  OriginalRow227TriangleData0968.coefficient68_338,
  OriginalRow227TriangleData0968.coefficient68_339,
  OriginalRow227TriangleData0968.coefficient68_340,
  OriginalRow227TriangleData0968.coefficient68_341,
  OriginalRow227TriangleData0968.coefficient68_342,
  OriginalRow227TriangleData0968.coefficient68_343,
  OriginalRow227TriangleData0968.coefficient68_344,
  OriginalRow227TriangleData0968.coefficient68_345,
  OriginalRow227TriangleData0968.coefficient68_346,
  OriginalRow227TriangleData0968.coefficient68_347,
  OriginalRow227TriangleData0968.coefficient68_348,
  OriginalRow227TriangleData0968.coefficient68_349,
  OriginalRow227TriangleData0968.coefficient68_350,
  OriginalRow227TriangleData0968.coefficient68_351,
  OriginalRow227TriangleData0968.coefficient68_352,
  OriginalRow227TriangleData0968.coefficient68_353,
  OriginalRow227TriangleData0968.coefficient68_354
]

theorem values0968_size : values0968.size = 32 := rfl

def block0968 : ℕ → Option IntervalDyadic := segment 323 values0968

theorem block0968_domain : ExactDomain block0968 323 355 := by
  simpa only [values0968_size] using segment_domain 323 values0968

theorem block0968_get (i : Fin 32) :
    block0968 (323 + i.val) = some (values0968[i.val]'(by rw [values0968_size]; exact i.isLt)) := by
  exact segment_get 323 values0968 ⟨i.val, by rw [values0968_size]; exact i.isLt⟩

def values0969 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0969.coefficient68_355,
  OriginalRow227TriangleData0969.coefficient68_356,
  OriginalRow227TriangleData0969.coefficient68_357,
  OriginalRow227TriangleData0969.coefficient68_358,
  OriginalRow227TriangleData0969.coefficient68_359,
  OriginalRow227TriangleData0969.coefficient68_360,
  OriginalRow227TriangleData0969.coefficient68_361,
  OriginalRow227TriangleData0969.coefficient68_362,
  OriginalRow227TriangleData0969.coefficient68_363,
  OriginalRow227TriangleData0969.coefficient68_364,
  OriginalRow227TriangleData0969.coefficient68_365,
  OriginalRow227TriangleData0969.coefficient68_366,
  OriginalRow227TriangleData0969.coefficient68_367,
  OriginalRow227TriangleData0969.coefficient68_368,
  OriginalRow227TriangleData0969.coefficient68_369,
  OriginalRow227TriangleData0969.coefficient68_370,
  OriginalRow227TriangleData0969.coefficient68_371,
  OriginalRow227TriangleData0969.coefficient68_372,
  OriginalRow227TriangleData0969.coefficient68_373,
  OriginalRow227TriangleData0969.coefficient68_374,
  OriginalRow227TriangleData0969.coefficient68_375,
  OriginalRow227TriangleData0969.coefficient68_376,
  OriginalRow227TriangleData0969.coefficient68_377,
  OriginalRow227TriangleData0969.coefficient68_378,
  OriginalRow227TriangleData0969.coefficient68_379,
  OriginalRow227TriangleData0969.coefficient68_380,
  OriginalRow227TriangleData0969.coefficient68_381,
  OriginalRow227TriangleData0969.coefficient68_382,
  OriginalRow227TriangleData0969.coefficient68_383,
  OriginalRow227TriangleData0969.coefficient68_384,
  OriginalRow227TriangleData0969.coefficient68_385,
  OriginalRow227TriangleData0969.coefficient68_386
]

theorem values0969_size : values0969.size = 32 := rfl

def block0969 : ℕ → Option IntervalDyadic := segment 355 values0969

theorem block0969_domain : ExactDomain block0969 355 387 := by
  simpa only [values0969_size] using segment_domain 355 values0969

theorem block0969_get (i : Fin 32) :
    block0969 (355 + i.val) = some (values0969[i.val]'(by rw [values0969_size]; exact i.isLt)) := by
  exact segment_get 355 values0969 ⟨i.val, by rw [values0969_size]; exact i.isLt⟩

def values0970 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0970.coefficient68_387,
  OriginalRow227TriangleData0970.coefficient68_388,
  OriginalRow227TriangleData0970.coefficient68_389,
  OriginalRow227TriangleData0970.coefficient68_390,
  OriginalRow227TriangleData0970.coefficient68_391,
  OriginalRow227TriangleData0970.coefficient68_392,
  OriginalRow227TriangleData0970.coefficient68_393,
  OriginalRow227TriangleData0970.coefficient68_394,
  OriginalRow227TriangleData0970.coefficient68_395,
  OriginalRow227TriangleData0970.coefficient68_396,
  OriginalRow227TriangleData0970.coefficient68_397,
  OriginalRow227TriangleData0970.coefficient68_398,
  OriginalRow227TriangleData0970.coefficient68_399,
  OriginalRow227TriangleData0970.coefficient68_400,
  OriginalRow227TriangleData0970.coefficient68_401,
  OriginalRow227TriangleData0970.coefficient68_402,
  OriginalRow227TriangleData0970.coefficient68_403,
  OriginalRow227TriangleData0970.coefficient68_404,
  OriginalRow227TriangleData0970.coefficient68_405,
  OriginalRow227TriangleData0970.coefficient68_406,
  OriginalRow227TriangleData0970.coefficient68_407,
  OriginalRow227TriangleData0970.coefficient68_408,
  OriginalRow227TriangleData0970.coefficient68_409,
  OriginalRow227TriangleData0970.coefficient68_410,
  OriginalRow227TriangleData0970.coefficient68_411,
  OriginalRow227TriangleData0970.coefficient68_412,
  OriginalRow227TriangleData0970.coefficient68_413,
  OriginalRow227TriangleData0970.coefficient68_414,
  OriginalRow227TriangleData0970.coefficient68_415,
  OriginalRow227TriangleData0970.coefficient68_416,
  OriginalRow227TriangleData0970.coefficient68_417,
  OriginalRow227TriangleData0970.coefficient68_418
]

theorem values0970_size : values0970.size = 32 := rfl

def block0970 : ℕ → Option IntervalDyadic := segment 387 values0970

theorem block0970_domain : ExactDomain block0970 387 419 := by
  simpa only [values0970_size] using segment_domain 387 values0970

theorem block0970_get (i : Fin 32) :
    block0970 (387 + i.val) = some (values0970[i.val]'(by rw [values0970_size]; exact i.isLt)) := by
  exact segment_get 387 values0970 ⟨i.val, by rw [values0970_size]; exact i.isLt⟩

def values0971 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0971.coefficient68_419,
  OriginalRow227TriangleData0971.coefficient68_420,
  OriginalRow227TriangleData0971.coefficient68_421,
  OriginalRow227TriangleData0971.coefficient68_422,
  OriginalRow227TriangleData0971.coefficient68_423,
  OriginalRow227TriangleData0971.coefficient68_424,
  OriginalRow227TriangleData0971.coefficient68_425,
  OriginalRow227TriangleData0971.coefficient68_426,
  OriginalRow227TriangleData0971.coefficient68_427,
  OriginalRow227TriangleData0971.coefficient68_428,
  OriginalRow227TriangleData0971.coefficient68_429,
  OriginalRow227TriangleData0971.coefficient68_430,
  OriginalRow227TriangleData0971.coefficient68_431,
  OriginalRow227TriangleData0971.coefficient68_432,
  OriginalRow227TriangleData0971.coefficient68_433
]

theorem values0971_size : values0971.size = 15 := rfl

def block0971 : ℕ → Option IntervalDyadic := segment 419 values0971

theorem block0971_domain : ExactDomain block0971 419 434 := by
  simpa only [values0971_size] using segment_domain 419 values0971

theorem block0971_get (i : Fin 15) :
    block0971 (419 + i.val) = some (values0971[i.val]'(by rw [values0971_size]; exact i.isLt)) := by
  exact segment_get 419 values0971 ⟨i.val, by rw [values0971_size]; exact i.isLt⟩

def node0099_0163 : ℕ → Option IntervalDyadic := split 131 block0961 block0962

theorem node0099_0163_domain : ExactDomain node0099_0163 99 163 := by
  exact split_domain (by decide) (by decide) block0961_domain block0962_domain

def node0067_0163 : ℕ → Option IntervalDyadic := split 99 block0960 node0099_0163

theorem node0067_0163_domain : ExactDomain node0067_0163 67 163 := by
  exact split_domain (by decide) (by decide) block0960_domain node0099_0163_domain

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block0964 block0965

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block0964_domain block0965_domain

def node0163_0259 : ℕ → Option IntervalDyadic := split 195 block0963 node0195_0259

theorem node0163_0259_domain : ExactDomain node0163_0259 163 259 := by
  exact split_domain (by decide) (by decide) block0963_domain node0195_0259_domain

def node0067_0259 : ℕ → Option IntervalDyadic := split 163 node0067_0163 node0163_0259

theorem node0067_0259_domain : ExactDomain node0067_0259 67 259 := by
  exact split_domain (by decide) (by decide) node0067_0163_domain node0163_0259_domain

def node0291_0355 : ℕ → Option IntervalDyadic := split 323 block0967 block0968

theorem node0291_0355_domain : ExactDomain node0291_0355 291 355 := by
  exact split_domain (by decide) (by decide) block0967_domain block0968_domain

def node0259_0355 : ℕ → Option IntervalDyadic := split 291 block0966 node0291_0355

theorem node0259_0355_domain : ExactDomain node0259_0355 259 355 := by
  exact split_domain (by decide) (by decide) block0966_domain node0291_0355_domain

def node0387_0434 : ℕ → Option IntervalDyadic := split 419 block0970 block0971

theorem node0387_0434_domain : ExactDomain node0387_0434 387 434 := by
  exact split_domain (by decide) (by decide) block0970_domain block0971_domain

def node0355_0434 : ℕ → Option IntervalDyadic := split 387 block0969 node0387_0434

theorem node0355_0434_domain : ExactDomain node0355_0434 355 434 := by
  exact split_domain (by decide) (by decide) block0969_domain node0387_0434_domain

def node0259_0434 : ℕ → Option IntervalDyadic := split 355 node0259_0355 node0355_0434

theorem node0259_0434_domain : ExactDomain node0259_0434 259 434 := by
  exact split_domain (by decide) (by decide) node0259_0355_domain node0355_0434_domain

def node0067_0434 : ℕ → Option IntervalDyadic := split 259 node0067_0259 node0259_0434

theorem node0067_0434_domain : ExactDomain node0067_0434 67 434 := by
  exact split_domain (by decide) (by decide) node0067_0259_domain node0259_0434_domain

def lookup : ℕ → Option IntervalDyadic := node0067_0434

theorem lookup_domain : ExactDomain lookup 67 434 :=
  node0067_0434_domain

theorem block0960_lookup (i : Fin 32) :
    lookup (67 + i.val) = some (values0960[i.val]'(by rw [values0960_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (67 + i.val) = _
  rw [node0067_0434, split_left 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0067_0259, split_left 163 node0067_0163 node0163_0259 (by omega)]
  rw [node0067_0163, split_left 99 block0960 node0099_0163 (by omega)]
  exact block0960_get i

theorem block0961_lookup (i : Fin 32) :
    lookup (99 + i.val) = some (values0961[i.val]'(by rw [values0961_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (99 + i.val) = _
  rw [node0067_0434, split_left 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0067_0259, split_left 163 node0067_0163 node0163_0259 (by omega)]
  rw [node0067_0163, split_right 99 block0960 node0099_0163 (by omega)]
  rw [node0099_0163, split_left 131 block0961 block0962 (by omega)]
  exact block0961_get i

theorem block0962_lookup (i : Fin 32) :
    lookup (131 + i.val) = some (values0962[i.val]'(by rw [values0962_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (131 + i.val) = _
  rw [node0067_0434, split_left 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0067_0259, split_left 163 node0067_0163 node0163_0259 (by omega)]
  rw [node0067_0163, split_right 99 block0960 node0099_0163 (by omega)]
  rw [node0099_0163, split_right 131 block0961 block0962 (by omega)]
  exact block0962_get i

theorem block0963_lookup (i : Fin 32) :
    lookup (163 + i.val) = some (values0963[i.val]'(by rw [values0963_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (163 + i.val) = _
  rw [node0067_0434, split_left 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0067_0259, split_right 163 node0067_0163 node0163_0259 (by omega)]
  rw [node0163_0259, split_left 195 block0963 node0195_0259 (by omega)]
  exact block0963_get i

theorem block0964_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values0964[i.val]'(by rw [values0964_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (195 + i.val) = _
  rw [node0067_0434, split_left 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0067_0259, split_right 163 node0067_0163 node0163_0259 (by omega)]
  rw [node0163_0259, split_right 195 block0963 node0195_0259 (by omega)]
  rw [node0195_0259, split_left 227 block0964 block0965 (by omega)]
  exact block0964_get i

theorem block0965_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values0965[i.val]'(by rw [values0965_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (227 + i.val) = _
  rw [node0067_0434, split_left 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0067_0259, split_right 163 node0067_0163 node0163_0259 (by omega)]
  rw [node0163_0259, split_right 195 block0963 node0195_0259 (by omega)]
  rw [node0195_0259, split_right 227 block0964 block0965 (by omega)]
  exact block0965_get i

theorem block0966_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values0966[i.val]'(by rw [values0966_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (259 + i.val) = _
  rw [node0067_0434, split_right 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0259_0434, split_left 355 node0259_0355 node0355_0434 (by omega)]
  rw [node0259_0355, split_left 291 block0966 node0291_0355 (by omega)]
  exact block0966_get i

theorem block0967_lookup (i : Fin 32) :
    lookup (291 + i.val) = some (values0967[i.val]'(by rw [values0967_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (291 + i.val) = _
  rw [node0067_0434, split_right 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0259_0434, split_left 355 node0259_0355 node0355_0434 (by omega)]
  rw [node0259_0355, split_right 291 block0966 node0291_0355 (by omega)]
  rw [node0291_0355, split_left 323 block0967 block0968 (by omega)]
  exact block0967_get i

theorem block0968_lookup (i : Fin 32) :
    lookup (323 + i.val) = some (values0968[i.val]'(by rw [values0968_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (323 + i.val) = _
  rw [node0067_0434, split_right 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0259_0434, split_left 355 node0259_0355 node0355_0434 (by omega)]
  rw [node0259_0355, split_right 291 block0966 node0291_0355 (by omega)]
  rw [node0291_0355, split_right 323 block0967 block0968 (by omega)]
  exact block0968_get i

theorem block0969_lookup (i : Fin 32) :
    lookup (355 + i.val) = some (values0969[i.val]'(by rw [values0969_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (355 + i.val) = _
  rw [node0067_0434, split_right 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0259_0434, split_right 355 node0259_0355 node0355_0434 (by omega)]
  rw [node0355_0434, split_left 387 block0969 node0387_0434 (by omega)]
  exact block0969_get i

theorem block0970_lookup (i : Fin 32) :
    lookup (387 + i.val) = some (values0970[i.val]'(by rw [values0970_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (387 + i.val) = _
  rw [node0067_0434, split_right 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0259_0434, split_right 355 node0259_0355 node0355_0434 (by omega)]
  rw [node0355_0434, split_right 387 block0969 node0387_0434 (by omega)]
  rw [node0387_0434, split_left 419 block0970 block0971 (by omega)]
  exact block0970_get i

theorem block0971_lookup (i : Fin 15) :
    lookup (419 + i.val) = some (values0971[i.val]'(by rw [values0971_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0067_0434 (419 + i.val) = _
  rw [node0067_0434, split_right 259 node0067_0259 node0259_0434 (by omega)]
  rw [node0259_0434, split_right 355 node0259_0355 node0355_0434 (by omega)]
  rw [node0355_0434, split_right 387 block0969 node0387_0434 (by omega)]
  rw [node0387_0434, split_right 419 block0970 block0971 (by omega)]
  exact block0971_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0960_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0960_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0961_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0961_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0962_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0962_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0963_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0963_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0964_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0964_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0965_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0965_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0966_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0966_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0967_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0967_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0968_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0968_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0969_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0969_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0970_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0970_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0971_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0971_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0960_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0961_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0962_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0963_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0964_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0965_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0966_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0967_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0968_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0969_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0970_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow068.block0971_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow068
