import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0984
import Grothe.UpperChaos.OriginalRow227TriangleData0985
import Grothe.UpperChaos.OriginalRow227TriangleData0986
import Grothe.UpperChaos.OriginalRow227TriangleData0987
import Grothe.UpperChaos.OriginalRow227TriangleData0988
import Grothe.UpperChaos.OriginalRow227TriangleData0989
import Grothe.UpperChaos.OriginalRow227TriangleData0990
import Grothe.UpperChaos.OriginalRow227TriangleData0991
import Grothe.UpperChaos.OriginalRow227TriangleData0992
import Grothe.UpperChaos.OriginalRow227TriangleData0993
import Grothe.UpperChaos.OriginalRow227TriangleData0994
import Grothe.UpperChaos.OriginalRow227TriangleData0995

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow070

open ConditionalTableLookup

def values0984 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0984.coefficient70_69,
  OriginalRow227TriangleData0984.coefficient70_70,
  OriginalRow227TriangleData0984.coefficient70_71,
  OriginalRow227TriangleData0984.coefficient70_72,
  OriginalRow227TriangleData0984.coefficient70_73,
  OriginalRow227TriangleData0984.coefficient70_74,
  OriginalRow227TriangleData0984.coefficient70_75,
  OriginalRow227TriangleData0984.coefficient70_76,
  OriginalRow227TriangleData0984.coefficient70_77,
  OriginalRow227TriangleData0984.coefficient70_78,
  OriginalRow227TriangleData0984.coefficient70_79,
  OriginalRow227TriangleData0984.coefficient70_80,
  OriginalRow227TriangleData0984.coefficient70_81,
  OriginalRow227TriangleData0984.coefficient70_82,
  OriginalRow227TriangleData0984.coefficient70_83,
  OriginalRow227TriangleData0984.coefficient70_84,
  OriginalRow227TriangleData0984.coefficient70_85,
  OriginalRow227TriangleData0984.coefficient70_86,
  OriginalRow227TriangleData0984.coefficient70_87,
  OriginalRow227TriangleData0984.coefficient70_88,
  OriginalRow227TriangleData0984.coefficient70_89,
  OriginalRow227TriangleData0984.coefficient70_90,
  OriginalRow227TriangleData0984.coefficient70_91,
  OriginalRow227TriangleData0984.coefficient70_92,
  OriginalRow227TriangleData0984.coefficient70_93,
  OriginalRow227TriangleData0984.coefficient70_94,
  OriginalRow227TriangleData0984.coefficient70_95,
  OriginalRow227TriangleData0984.coefficient70_96,
  OriginalRow227TriangleData0984.coefficient70_97,
  OriginalRow227TriangleData0984.coefficient70_98,
  OriginalRow227TriangleData0984.coefficient70_99,
  OriginalRow227TriangleData0984.coefficient70_100
]

theorem values0984_size : values0984.size = 32 := rfl

def block0984 : ℕ → Option IntervalDyadic := segment 69 values0984

theorem block0984_domain : ExactDomain block0984 69 101 := by
  simpa only [values0984_size] using segment_domain 69 values0984

theorem block0984_get (i : Fin 32) :
    block0984 (69 + i.val) = some (values0984[i.val]'(by rw [values0984_size]; exact i.isLt)) := by
  exact segment_get 69 values0984 ⟨i.val, by rw [values0984_size]; exact i.isLt⟩

def values0985 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0985.coefficient70_101,
  OriginalRow227TriangleData0985.coefficient70_102,
  OriginalRow227TriangleData0985.coefficient70_103,
  OriginalRow227TriangleData0985.coefficient70_104,
  OriginalRow227TriangleData0985.coefficient70_105,
  OriginalRow227TriangleData0985.coefficient70_106,
  OriginalRow227TriangleData0985.coefficient70_107,
  OriginalRow227TriangleData0985.coefficient70_108,
  OriginalRow227TriangleData0985.coefficient70_109,
  OriginalRow227TriangleData0985.coefficient70_110,
  OriginalRow227TriangleData0985.coefficient70_111,
  OriginalRow227TriangleData0985.coefficient70_112,
  OriginalRow227TriangleData0985.coefficient70_113,
  OriginalRow227TriangleData0985.coefficient70_114,
  OriginalRow227TriangleData0985.coefficient70_115,
  OriginalRow227TriangleData0985.coefficient70_116,
  OriginalRow227TriangleData0985.coefficient70_117,
  OriginalRow227TriangleData0985.coefficient70_118,
  OriginalRow227TriangleData0985.coefficient70_119,
  OriginalRow227TriangleData0985.coefficient70_120,
  OriginalRow227TriangleData0985.coefficient70_121,
  OriginalRow227TriangleData0985.coefficient70_122,
  OriginalRow227TriangleData0985.coefficient70_123,
  OriginalRow227TriangleData0985.coefficient70_124,
  OriginalRow227TriangleData0985.coefficient70_125,
  OriginalRow227TriangleData0985.coefficient70_126,
  OriginalRow227TriangleData0985.coefficient70_127,
  OriginalRow227TriangleData0985.coefficient70_128,
  OriginalRow227TriangleData0985.coefficient70_129,
  OriginalRow227TriangleData0985.coefficient70_130,
  OriginalRow227TriangleData0985.coefficient70_131,
  OriginalRow227TriangleData0985.coefficient70_132
]

theorem values0985_size : values0985.size = 32 := rfl

def block0985 : ℕ → Option IntervalDyadic := segment 101 values0985

theorem block0985_domain : ExactDomain block0985 101 133 := by
  simpa only [values0985_size] using segment_domain 101 values0985

theorem block0985_get (i : Fin 32) :
    block0985 (101 + i.val) = some (values0985[i.val]'(by rw [values0985_size]; exact i.isLt)) := by
  exact segment_get 101 values0985 ⟨i.val, by rw [values0985_size]; exact i.isLt⟩

def values0986 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0986.coefficient70_133,
  OriginalRow227TriangleData0986.coefficient70_134,
  OriginalRow227TriangleData0986.coefficient70_135,
  OriginalRow227TriangleData0986.coefficient70_136,
  OriginalRow227TriangleData0986.coefficient70_137,
  OriginalRow227TriangleData0986.coefficient70_138,
  OriginalRow227TriangleData0986.coefficient70_139,
  OriginalRow227TriangleData0986.coefficient70_140,
  OriginalRow227TriangleData0986.coefficient70_141,
  OriginalRow227TriangleData0986.coefficient70_142,
  OriginalRow227TriangleData0986.coefficient70_143,
  OriginalRow227TriangleData0986.coefficient70_144,
  OriginalRow227TriangleData0986.coefficient70_145,
  OriginalRow227TriangleData0986.coefficient70_146,
  OriginalRow227TriangleData0986.coefficient70_147,
  OriginalRow227TriangleData0986.coefficient70_148,
  OriginalRow227TriangleData0986.coefficient70_149,
  OriginalRow227TriangleData0986.coefficient70_150,
  OriginalRow227TriangleData0986.coefficient70_151,
  OriginalRow227TriangleData0986.coefficient70_152,
  OriginalRow227TriangleData0986.coefficient70_153,
  OriginalRow227TriangleData0986.coefficient70_154,
  OriginalRow227TriangleData0986.coefficient70_155,
  OriginalRow227TriangleData0986.coefficient70_156,
  OriginalRow227TriangleData0986.coefficient70_157,
  OriginalRow227TriangleData0986.coefficient70_158,
  OriginalRow227TriangleData0986.coefficient70_159,
  OriginalRow227TriangleData0986.coefficient70_160,
  OriginalRow227TriangleData0986.coefficient70_161,
  OriginalRow227TriangleData0986.coefficient70_162,
  OriginalRow227TriangleData0986.coefficient70_163,
  OriginalRow227TriangleData0986.coefficient70_164
]

theorem values0986_size : values0986.size = 32 := rfl

def block0986 : ℕ → Option IntervalDyadic := segment 133 values0986

theorem block0986_domain : ExactDomain block0986 133 165 := by
  simpa only [values0986_size] using segment_domain 133 values0986

theorem block0986_get (i : Fin 32) :
    block0986 (133 + i.val) = some (values0986[i.val]'(by rw [values0986_size]; exact i.isLt)) := by
  exact segment_get 133 values0986 ⟨i.val, by rw [values0986_size]; exact i.isLt⟩

def values0987 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0987.coefficient70_165,
  OriginalRow227TriangleData0987.coefficient70_166,
  OriginalRow227TriangleData0987.coefficient70_167,
  OriginalRow227TriangleData0987.coefficient70_168,
  OriginalRow227TriangleData0987.coefficient70_169,
  OriginalRow227TriangleData0987.coefficient70_170,
  OriginalRow227TriangleData0987.coefficient70_171,
  OriginalRow227TriangleData0987.coefficient70_172,
  OriginalRow227TriangleData0987.coefficient70_173,
  OriginalRow227TriangleData0987.coefficient70_174,
  OriginalRow227TriangleData0987.coefficient70_175,
  OriginalRow227TriangleData0987.coefficient70_176,
  OriginalRow227TriangleData0987.coefficient70_177,
  OriginalRow227TriangleData0987.coefficient70_178,
  OriginalRow227TriangleData0987.coefficient70_179,
  OriginalRow227TriangleData0987.coefficient70_180,
  OriginalRow227TriangleData0987.coefficient70_181,
  OriginalRow227TriangleData0987.coefficient70_182,
  OriginalRow227TriangleData0987.coefficient70_183,
  OriginalRow227TriangleData0987.coefficient70_184,
  OriginalRow227TriangleData0987.coefficient70_185,
  OriginalRow227TriangleData0987.coefficient70_186,
  OriginalRow227TriangleData0987.coefficient70_187,
  OriginalRow227TriangleData0987.coefficient70_188,
  OriginalRow227TriangleData0987.coefficient70_189,
  OriginalRow227TriangleData0987.coefficient70_190,
  OriginalRow227TriangleData0987.coefficient70_191,
  OriginalRow227TriangleData0987.coefficient70_192,
  OriginalRow227TriangleData0987.coefficient70_193,
  OriginalRow227TriangleData0987.coefficient70_194,
  OriginalRow227TriangleData0987.coefficient70_195,
  OriginalRow227TriangleData0987.coefficient70_196
]

theorem values0987_size : values0987.size = 32 := rfl

def block0987 : ℕ → Option IntervalDyadic := segment 165 values0987

theorem block0987_domain : ExactDomain block0987 165 197 := by
  simpa only [values0987_size] using segment_domain 165 values0987

theorem block0987_get (i : Fin 32) :
    block0987 (165 + i.val) = some (values0987[i.val]'(by rw [values0987_size]; exact i.isLt)) := by
  exact segment_get 165 values0987 ⟨i.val, by rw [values0987_size]; exact i.isLt⟩

def values0988 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0988.coefficient70_197,
  OriginalRow227TriangleData0988.coefficient70_198,
  OriginalRow227TriangleData0988.coefficient70_199,
  OriginalRow227TriangleData0988.coefficient70_200,
  OriginalRow227TriangleData0988.coefficient70_201,
  OriginalRow227TriangleData0988.coefficient70_202,
  OriginalRow227TriangleData0988.coefficient70_203,
  OriginalRow227TriangleData0988.coefficient70_204,
  OriginalRow227TriangleData0988.coefficient70_205,
  OriginalRow227TriangleData0988.coefficient70_206,
  OriginalRow227TriangleData0988.coefficient70_207,
  OriginalRow227TriangleData0988.coefficient70_208,
  OriginalRow227TriangleData0988.coefficient70_209,
  OriginalRow227TriangleData0988.coefficient70_210,
  OriginalRow227TriangleData0988.coefficient70_211,
  OriginalRow227TriangleData0988.coefficient70_212,
  OriginalRow227TriangleData0988.coefficient70_213,
  OriginalRow227TriangleData0988.coefficient70_214,
  OriginalRow227TriangleData0988.coefficient70_215,
  OriginalRow227TriangleData0988.coefficient70_216,
  OriginalRow227TriangleData0988.coefficient70_217,
  OriginalRow227TriangleData0988.coefficient70_218,
  OriginalRow227TriangleData0988.coefficient70_219,
  OriginalRow227TriangleData0988.coefficient70_220,
  OriginalRow227TriangleData0988.coefficient70_221,
  OriginalRow227TriangleData0988.coefficient70_222,
  OriginalRow227TriangleData0988.coefficient70_223,
  OriginalRow227TriangleData0988.coefficient70_224,
  OriginalRow227TriangleData0988.coefficient70_225,
  OriginalRow227TriangleData0988.coefficient70_226,
  OriginalRow227TriangleData0988.coefficient70_227,
  OriginalRow227TriangleData0988.coefficient70_228
]

theorem values0988_size : values0988.size = 32 := rfl

def block0988 : ℕ → Option IntervalDyadic := segment 197 values0988

theorem block0988_domain : ExactDomain block0988 197 229 := by
  simpa only [values0988_size] using segment_domain 197 values0988

theorem block0988_get (i : Fin 32) :
    block0988 (197 + i.val) = some (values0988[i.val]'(by rw [values0988_size]; exact i.isLt)) := by
  exact segment_get 197 values0988 ⟨i.val, by rw [values0988_size]; exact i.isLt⟩

def values0989 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0989.coefficient70_229,
  OriginalRow227TriangleData0989.coefficient70_230,
  OriginalRow227TriangleData0989.coefficient70_231,
  OriginalRow227TriangleData0989.coefficient70_232,
  OriginalRow227TriangleData0989.coefficient70_233,
  OriginalRow227TriangleData0989.coefficient70_234,
  OriginalRow227TriangleData0989.coefficient70_235,
  OriginalRow227TriangleData0989.coefficient70_236,
  OriginalRow227TriangleData0989.coefficient70_237,
  OriginalRow227TriangleData0989.coefficient70_238,
  OriginalRow227TriangleData0989.coefficient70_239,
  OriginalRow227TriangleData0989.coefficient70_240,
  OriginalRow227TriangleData0989.coefficient70_241,
  OriginalRow227TriangleData0989.coefficient70_242,
  OriginalRow227TriangleData0989.coefficient70_243,
  OriginalRow227TriangleData0989.coefficient70_244,
  OriginalRow227TriangleData0989.coefficient70_245,
  OriginalRow227TriangleData0989.coefficient70_246,
  OriginalRow227TriangleData0989.coefficient70_247,
  OriginalRow227TriangleData0989.coefficient70_248,
  OriginalRow227TriangleData0989.coefficient70_249,
  OriginalRow227TriangleData0989.coefficient70_250,
  OriginalRow227TriangleData0989.coefficient70_251,
  OriginalRow227TriangleData0989.coefficient70_252,
  OriginalRow227TriangleData0989.coefficient70_253,
  OriginalRow227TriangleData0989.coefficient70_254,
  OriginalRow227TriangleData0989.coefficient70_255,
  OriginalRow227TriangleData0989.coefficient70_256,
  OriginalRow227TriangleData0989.coefficient70_257,
  OriginalRow227TriangleData0989.coefficient70_258,
  OriginalRow227TriangleData0989.coefficient70_259,
  OriginalRow227TriangleData0989.coefficient70_260
]

theorem values0989_size : values0989.size = 32 := rfl

def block0989 : ℕ → Option IntervalDyadic := segment 229 values0989

theorem block0989_domain : ExactDomain block0989 229 261 := by
  simpa only [values0989_size] using segment_domain 229 values0989

theorem block0989_get (i : Fin 32) :
    block0989 (229 + i.val) = some (values0989[i.val]'(by rw [values0989_size]; exact i.isLt)) := by
  exact segment_get 229 values0989 ⟨i.val, by rw [values0989_size]; exact i.isLt⟩

def values0990 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0990.coefficient70_261,
  OriginalRow227TriangleData0990.coefficient70_262,
  OriginalRow227TriangleData0990.coefficient70_263,
  OriginalRow227TriangleData0990.coefficient70_264,
  OriginalRow227TriangleData0990.coefficient70_265,
  OriginalRow227TriangleData0990.coefficient70_266,
  OriginalRow227TriangleData0990.coefficient70_267,
  OriginalRow227TriangleData0990.coefficient70_268,
  OriginalRow227TriangleData0990.coefficient70_269,
  OriginalRow227TriangleData0990.coefficient70_270,
  OriginalRow227TriangleData0990.coefficient70_271,
  OriginalRow227TriangleData0990.coefficient70_272,
  OriginalRow227TriangleData0990.coefficient70_273,
  OriginalRow227TriangleData0990.coefficient70_274,
  OriginalRow227TriangleData0990.coefficient70_275,
  OriginalRow227TriangleData0990.coefficient70_276,
  OriginalRow227TriangleData0990.coefficient70_277,
  OriginalRow227TriangleData0990.coefficient70_278,
  OriginalRow227TriangleData0990.coefficient70_279,
  OriginalRow227TriangleData0990.coefficient70_280,
  OriginalRow227TriangleData0990.coefficient70_281,
  OriginalRow227TriangleData0990.coefficient70_282,
  OriginalRow227TriangleData0990.coefficient70_283,
  OriginalRow227TriangleData0990.coefficient70_284,
  OriginalRow227TriangleData0990.coefficient70_285,
  OriginalRow227TriangleData0990.coefficient70_286,
  OriginalRow227TriangleData0990.coefficient70_287,
  OriginalRow227TriangleData0990.coefficient70_288,
  OriginalRow227TriangleData0990.coefficient70_289,
  OriginalRow227TriangleData0990.coefficient70_290,
  OriginalRow227TriangleData0990.coefficient70_291,
  OriginalRow227TriangleData0990.coefficient70_292
]

theorem values0990_size : values0990.size = 32 := rfl

def block0990 : ℕ → Option IntervalDyadic := segment 261 values0990

theorem block0990_domain : ExactDomain block0990 261 293 := by
  simpa only [values0990_size] using segment_domain 261 values0990

theorem block0990_get (i : Fin 32) :
    block0990 (261 + i.val) = some (values0990[i.val]'(by rw [values0990_size]; exact i.isLt)) := by
  exact segment_get 261 values0990 ⟨i.val, by rw [values0990_size]; exact i.isLt⟩

def values0991 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0991.coefficient70_293,
  OriginalRow227TriangleData0991.coefficient70_294,
  OriginalRow227TriangleData0991.coefficient70_295,
  OriginalRow227TriangleData0991.coefficient70_296,
  OriginalRow227TriangleData0991.coefficient70_297,
  OriginalRow227TriangleData0991.coefficient70_298,
  OriginalRow227TriangleData0991.coefficient70_299,
  OriginalRow227TriangleData0991.coefficient70_300,
  OriginalRow227TriangleData0991.coefficient70_301,
  OriginalRow227TriangleData0991.coefficient70_302,
  OriginalRow227TriangleData0991.coefficient70_303,
  OriginalRow227TriangleData0991.coefficient70_304,
  OriginalRow227TriangleData0991.coefficient70_305,
  OriginalRow227TriangleData0991.coefficient70_306,
  OriginalRow227TriangleData0991.coefficient70_307,
  OriginalRow227TriangleData0991.coefficient70_308,
  OriginalRow227TriangleData0991.coefficient70_309,
  OriginalRow227TriangleData0991.coefficient70_310,
  OriginalRow227TriangleData0991.coefficient70_311,
  OriginalRow227TriangleData0991.coefficient70_312,
  OriginalRow227TriangleData0991.coefficient70_313,
  OriginalRow227TriangleData0991.coefficient70_314,
  OriginalRow227TriangleData0991.coefficient70_315,
  OriginalRow227TriangleData0991.coefficient70_316,
  OriginalRow227TriangleData0991.coefficient70_317,
  OriginalRow227TriangleData0991.coefficient70_318,
  OriginalRow227TriangleData0991.coefficient70_319,
  OriginalRow227TriangleData0991.coefficient70_320,
  OriginalRow227TriangleData0991.coefficient70_321,
  OriginalRow227TriangleData0991.coefficient70_322,
  OriginalRow227TriangleData0991.coefficient70_323,
  OriginalRow227TriangleData0991.coefficient70_324
]

theorem values0991_size : values0991.size = 32 := rfl

def block0991 : ℕ → Option IntervalDyadic := segment 293 values0991

theorem block0991_domain : ExactDomain block0991 293 325 := by
  simpa only [values0991_size] using segment_domain 293 values0991

theorem block0991_get (i : Fin 32) :
    block0991 (293 + i.val) = some (values0991[i.val]'(by rw [values0991_size]; exact i.isLt)) := by
  exact segment_get 293 values0991 ⟨i.val, by rw [values0991_size]; exact i.isLt⟩

def values0992 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0992.coefficient70_325,
  OriginalRow227TriangleData0992.coefficient70_326,
  OriginalRow227TriangleData0992.coefficient70_327,
  OriginalRow227TriangleData0992.coefficient70_328,
  OriginalRow227TriangleData0992.coefficient70_329,
  OriginalRow227TriangleData0992.coefficient70_330,
  OriginalRow227TriangleData0992.coefficient70_331,
  OriginalRow227TriangleData0992.coefficient70_332,
  OriginalRow227TriangleData0992.coefficient70_333,
  OriginalRow227TriangleData0992.coefficient70_334,
  OriginalRow227TriangleData0992.coefficient70_335,
  OriginalRow227TriangleData0992.coefficient70_336,
  OriginalRow227TriangleData0992.coefficient70_337,
  OriginalRow227TriangleData0992.coefficient70_338,
  OriginalRow227TriangleData0992.coefficient70_339,
  OriginalRow227TriangleData0992.coefficient70_340,
  OriginalRow227TriangleData0992.coefficient70_341,
  OriginalRow227TriangleData0992.coefficient70_342,
  OriginalRow227TriangleData0992.coefficient70_343,
  OriginalRow227TriangleData0992.coefficient70_344,
  OriginalRow227TriangleData0992.coefficient70_345,
  OriginalRow227TriangleData0992.coefficient70_346,
  OriginalRow227TriangleData0992.coefficient70_347,
  OriginalRow227TriangleData0992.coefficient70_348,
  OriginalRow227TriangleData0992.coefficient70_349,
  OriginalRow227TriangleData0992.coefficient70_350,
  OriginalRow227TriangleData0992.coefficient70_351,
  OriginalRow227TriangleData0992.coefficient70_352,
  OriginalRow227TriangleData0992.coefficient70_353,
  OriginalRow227TriangleData0992.coefficient70_354,
  OriginalRow227TriangleData0992.coefficient70_355,
  OriginalRow227TriangleData0992.coefficient70_356
]

theorem values0992_size : values0992.size = 32 := rfl

def block0992 : ℕ → Option IntervalDyadic := segment 325 values0992

theorem block0992_domain : ExactDomain block0992 325 357 := by
  simpa only [values0992_size] using segment_domain 325 values0992

theorem block0992_get (i : Fin 32) :
    block0992 (325 + i.val) = some (values0992[i.val]'(by rw [values0992_size]; exact i.isLt)) := by
  exact segment_get 325 values0992 ⟨i.val, by rw [values0992_size]; exact i.isLt⟩

def values0993 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0993.coefficient70_357,
  OriginalRow227TriangleData0993.coefficient70_358,
  OriginalRow227TriangleData0993.coefficient70_359,
  OriginalRow227TriangleData0993.coefficient70_360,
  OriginalRow227TriangleData0993.coefficient70_361,
  OriginalRow227TriangleData0993.coefficient70_362,
  OriginalRow227TriangleData0993.coefficient70_363,
  OriginalRow227TriangleData0993.coefficient70_364,
  OriginalRow227TriangleData0993.coefficient70_365,
  OriginalRow227TriangleData0993.coefficient70_366,
  OriginalRow227TriangleData0993.coefficient70_367,
  OriginalRow227TriangleData0993.coefficient70_368,
  OriginalRow227TriangleData0993.coefficient70_369,
  OriginalRow227TriangleData0993.coefficient70_370,
  OriginalRow227TriangleData0993.coefficient70_371,
  OriginalRow227TriangleData0993.coefficient70_372,
  OriginalRow227TriangleData0993.coefficient70_373,
  OriginalRow227TriangleData0993.coefficient70_374,
  OriginalRow227TriangleData0993.coefficient70_375,
  OriginalRow227TriangleData0993.coefficient70_376,
  OriginalRow227TriangleData0993.coefficient70_377,
  OriginalRow227TriangleData0993.coefficient70_378,
  OriginalRow227TriangleData0993.coefficient70_379,
  OriginalRow227TriangleData0993.coefficient70_380,
  OriginalRow227TriangleData0993.coefficient70_381,
  OriginalRow227TriangleData0993.coefficient70_382,
  OriginalRow227TriangleData0993.coefficient70_383,
  OriginalRow227TriangleData0993.coefficient70_384,
  OriginalRow227TriangleData0993.coefficient70_385,
  OriginalRow227TriangleData0993.coefficient70_386,
  OriginalRow227TriangleData0993.coefficient70_387,
  OriginalRow227TriangleData0993.coefficient70_388
]

theorem values0993_size : values0993.size = 32 := rfl

def block0993 : ℕ → Option IntervalDyadic := segment 357 values0993

theorem block0993_domain : ExactDomain block0993 357 389 := by
  simpa only [values0993_size] using segment_domain 357 values0993

theorem block0993_get (i : Fin 32) :
    block0993 (357 + i.val) = some (values0993[i.val]'(by rw [values0993_size]; exact i.isLt)) := by
  exact segment_get 357 values0993 ⟨i.val, by rw [values0993_size]; exact i.isLt⟩

def values0994 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0994.coefficient70_389,
  OriginalRow227TriangleData0994.coefficient70_390,
  OriginalRow227TriangleData0994.coefficient70_391,
  OriginalRow227TriangleData0994.coefficient70_392,
  OriginalRow227TriangleData0994.coefficient70_393,
  OriginalRow227TriangleData0994.coefficient70_394,
  OriginalRow227TriangleData0994.coefficient70_395,
  OriginalRow227TriangleData0994.coefficient70_396,
  OriginalRow227TriangleData0994.coefficient70_397,
  OriginalRow227TriangleData0994.coefficient70_398,
  OriginalRow227TriangleData0994.coefficient70_399,
  OriginalRow227TriangleData0994.coefficient70_400,
  OriginalRow227TriangleData0994.coefficient70_401,
  OriginalRow227TriangleData0994.coefficient70_402,
  OriginalRow227TriangleData0994.coefficient70_403,
  OriginalRow227TriangleData0994.coefficient70_404,
  OriginalRow227TriangleData0994.coefficient70_405,
  OriginalRow227TriangleData0994.coefficient70_406,
  OriginalRow227TriangleData0994.coefficient70_407,
  OriginalRow227TriangleData0994.coefficient70_408,
  OriginalRow227TriangleData0994.coefficient70_409,
  OriginalRow227TriangleData0994.coefficient70_410,
  OriginalRow227TriangleData0994.coefficient70_411,
  OriginalRow227TriangleData0994.coefficient70_412,
  OriginalRow227TriangleData0994.coefficient70_413,
  OriginalRow227TriangleData0994.coefficient70_414,
  OriginalRow227TriangleData0994.coefficient70_415,
  OriginalRow227TriangleData0994.coefficient70_416,
  OriginalRow227TriangleData0994.coefficient70_417,
  OriginalRow227TriangleData0994.coefficient70_418,
  OriginalRow227TriangleData0994.coefficient70_419,
  OriginalRow227TriangleData0994.coefficient70_420
]

theorem values0994_size : values0994.size = 32 := rfl

def block0994 : ℕ → Option IntervalDyadic := segment 389 values0994

theorem block0994_domain : ExactDomain block0994 389 421 := by
  simpa only [values0994_size] using segment_domain 389 values0994

theorem block0994_get (i : Fin 32) :
    block0994 (389 + i.val) = some (values0994[i.val]'(by rw [values0994_size]; exact i.isLt)) := by
  exact segment_get 389 values0994 ⟨i.val, by rw [values0994_size]; exact i.isLt⟩

def values0995 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0995.coefficient70_421,
  OriginalRow227TriangleData0995.coefficient70_422,
  OriginalRow227TriangleData0995.coefficient70_423,
  OriginalRow227TriangleData0995.coefficient70_424,
  OriginalRow227TriangleData0995.coefficient70_425,
  OriginalRow227TriangleData0995.coefficient70_426,
  OriginalRow227TriangleData0995.coefficient70_427,
  OriginalRow227TriangleData0995.coefficient70_428,
  OriginalRow227TriangleData0995.coefficient70_429,
  OriginalRow227TriangleData0995.coefficient70_430,
  OriginalRow227TriangleData0995.coefficient70_431
]

theorem values0995_size : values0995.size = 11 := rfl

def block0995 : ℕ → Option IntervalDyadic := segment 421 values0995

theorem block0995_domain : ExactDomain block0995 421 432 := by
  simpa only [values0995_size] using segment_domain 421 values0995

theorem block0995_get (i : Fin 11) :
    block0995 (421 + i.val) = some (values0995[i.val]'(by rw [values0995_size]; exact i.isLt)) := by
  exact segment_get 421 values0995 ⟨i.val, by rw [values0995_size]; exact i.isLt⟩

def node0101_0165 : ℕ → Option IntervalDyadic := split 133 block0985 block0986

theorem node0101_0165_domain : ExactDomain node0101_0165 101 165 := by
  exact split_domain (by decide) (by decide) block0985_domain block0986_domain

def node0069_0165 : ℕ → Option IntervalDyadic := split 101 block0984 node0101_0165

theorem node0069_0165_domain : ExactDomain node0069_0165 69 165 := by
  exact split_domain (by decide) (by decide) block0984_domain node0101_0165_domain

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block0988 block0989

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block0988_domain block0989_domain

def node0165_0261 : ℕ → Option IntervalDyadic := split 197 block0987 node0197_0261

theorem node0165_0261_domain : ExactDomain node0165_0261 165 261 := by
  exact split_domain (by decide) (by decide) block0987_domain node0197_0261_domain

def node0069_0261 : ℕ → Option IntervalDyadic := split 165 node0069_0165 node0165_0261

theorem node0069_0261_domain : ExactDomain node0069_0261 69 261 := by
  exact split_domain (by decide) (by decide) node0069_0165_domain node0165_0261_domain

def node0293_0357 : ℕ → Option IntervalDyadic := split 325 block0991 block0992

theorem node0293_0357_domain : ExactDomain node0293_0357 293 357 := by
  exact split_domain (by decide) (by decide) block0991_domain block0992_domain

def node0261_0357 : ℕ → Option IntervalDyadic := split 293 block0990 node0293_0357

theorem node0261_0357_domain : ExactDomain node0261_0357 261 357 := by
  exact split_domain (by decide) (by decide) block0990_domain node0293_0357_domain

def node0389_0432 : ℕ → Option IntervalDyadic := split 421 block0994 block0995

theorem node0389_0432_domain : ExactDomain node0389_0432 389 432 := by
  exact split_domain (by decide) (by decide) block0994_domain block0995_domain

def node0357_0432 : ℕ → Option IntervalDyadic := split 389 block0993 node0389_0432

theorem node0357_0432_domain : ExactDomain node0357_0432 357 432 := by
  exact split_domain (by decide) (by decide) block0993_domain node0389_0432_domain

def node0261_0432 : ℕ → Option IntervalDyadic := split 357 node0261_0357 node0357_0432

theorem node0261_0432_domain : ExactDomain node0261_0432 261 432 := by
  exact split_domain (by decide) (by decide) node0261_0357_domain node0357_0432_domain

def node0069_0432 : ℕ → Option IntervalDyadic := split 261 node0069_0261 node0261_0432

theorem node0069_0432_domain : ExactDomain node0069_0432 69 432 := by
  exact split_domain (by decide) (by decide) node0069_0261_domain node0261_0432_domain

def lookup : ℕ → Option IntervalDyadic := node0069_0432

theorem lookup_domain : ExactDomain lookup 69 432 :=
  node0069_0432_domain

theorem block0984_lookup (i : Fin 32) :
    lookup (69 + i.val) = some (values0984[i.val]'(by rw [values0984_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (69 + i.val) = _
  rw [node0069_0432, split_left 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0069_0261, split_left 165 node0069_0165 node0165_0261 (by omega)]
  rw [node0069_0165, split_left 101 block0984 node0101_0165 (by omega)]
  exact block0984_get i

theorem block0985_lookup (i : Fin 32) :
    lookup (101 + i.val) = some (values0985[i.val]'(by rw [values0985_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (101 + i.val) = _
  rw [node0069_0432, split_left 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0069_0261, split_left 165 node0069_0165 node0165_0261 (by omega)]
  rw [node0069_0165, split_right 101 block0984 node0101_0165 (by omega)]
  rw [node0101_0165, split_left 133 block0985 block0986 (by omega)]
  exact block0985_get i

theorem block0986_lookup (i : Fin 32) :
    lookup (133 + i.val) = some (values0986[i.val]'(by rw [values0986_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (133 + i.val) = _
  rw [node0069_0432, split_left 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0069_0261, split_left 165 node0069_0165 node0165_0261 (by omega)]
  rw [node0069_0165, split_right 101 block0984 node0101_0165 (by omega)]
  rw [node0101_0165, split_right 133 block0985 block0986 (by omega)]
  exact block0986_get i

theorem block0987_lookup (i : Fin 32) :
    lookup (165 + i.val) = some (values0987[i.val]'(by rw [values0987_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (165 + i.val) = _
  rw [node0069_0432, split_left 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0069_0261, split_right 165 node0069_0165 node0165_0261 (by omega)]
  rw [node0165_0261, split_left 197 block0987 node0197_0261 (by omega)]
  exact block0987_get i

theorem block0988_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values0988[i.val]'(by rw [values0988_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (197 + i.val) = _
  rw [node0069_0432, split_left 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0069_0261, split_right 165 node0069_0165 node0165_0261 (by omega)]
  rw [node0165_0261, split_right 197 block0987 node0197_0261 (by omega)]
  rw [node0197_0261, split_left 229 block0988 block0989 (by omega)]
  exact block0988_get i

theorem block0989_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values0989[i.val]'(by rw [values0989_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (229 + i.val) = _
  rw [node0069_0432, split_left 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0069_0261, split_right 165 node0069_0165 node0165_0261 (by omega)]
  rw [node0165_0261, split_right 197 block0987 node0197_0261 (by omega)]
  rw [node0197_0261, split_right 229 block0988 block0989 (by omega)]
  exact block0989_get i

theorem block0990_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values0990[i.val]'(by rw [values0990_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (261 + i.val) = _
  rw [node0069_0432, split_right 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0261_0432, split_left 357 node0261_0357 node0357_0432 (by omega)]
  rw [node0261_0357, split_left 293 block0990 node0293_0357 (by omega)]
  exact block0990_get i

theorem block0991_lookup (i : Fin 32) :
    lookup (293 + i.val) = some (values0991[i.val]'(by rw [values0991_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (293 + i.val) = _
  rw [node0069_0432, split_right 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0261_0432, split_left 357 node0261_0357 node0357_0432 (by omega)]
  rw [node0261_0357, split_right 293 block0990 node0293_0357 (by omega)]
  rw [node0293_0357, split_left 325 block0991 block0992 (by omega)]
  exact block0991_get i

theorem block0992_lookup (i : Fin 32) :
    lookup (325 + i.val) = some (values0992[i.val]'(by rw [values0992_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (325 + i.val) = _
  rw [node0069_0432, split_right 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0261_0432, split_left 357 node0261_0357 node0357_0432 (by omega)]
  rw [node0261_0357, split_right 293 block0990 node0293_0357 (by omega)]
  rw [node0293_0357, split_right 325 block0991 block0992 (by omega)]
  exact block0992_get i

theorem block0993_lookup (i : Fin 32) :
    lookup (357 + i.val) = some (values0993[i.val]'(by rw [values0993_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (357 + i.val) = _
  rw [node0069_0432, split_right 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0261_0432, split_right 357 node0261_0357 node0357_0432 (by omega)]
  rw [node0357_0432, split_left 389 block0993 node0389_0432 (by omega)]
  exact block0993_get i

theorem block0994_lookup (i : Fin 32) :
    lookup (389 + i.val) = some (values0994[i.val]'(by rw [values0994_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (389 + i.val) = _
  rw [node0069_0432, split_right 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0261_0432, split_right 357 node0261_0357 node0357_0432 (by omega)]
  rw [node0357_0432, split_right 389 block0993 node0389_0432 (by omega)]
  rw [node0389_0432, split_left 421 block0994 block0995 (by omega)]
  exact block0994_get i

theorem block0995_lookup (i : Fin 11) :
    lookup (421 + i.val) = some (values0995[i.val]'(by rw [values0995_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0069_0432 (421 + i.val) = _
  rw [node0069_0432, split_right 261 node0069_0261 node0261_0432 (by omega)]
  rw [node0261_0432, split_right 357 node0261_0357 node0357_0432 (by omega)]
  rw [node0357_0432, split_right 389 block0993 node0389_0432 (by omega)]
  rw [node0389_0432, split_right 421 block0994 block0995 (by omega)]
  exact block0995_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0984_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0984_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0985_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0985_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0986_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0986_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0987_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0987_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0988_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0988_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0989_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0989_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0990_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0990_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0991_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0991_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0992_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0992_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0993_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0993_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0994_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0994_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0995_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0995_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0984_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0985_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0986_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0987_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0988_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0989_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0990_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0991_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0992_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0993_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0994_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow070.block0995_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow070
