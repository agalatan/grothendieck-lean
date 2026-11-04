import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0996
import Grothe.UpperChaos.OriginalRow227TriangleData0997
import Grothe.UpperChaos.OriginalRow227TriangleData0998
import Grothe.UpperChaos.OriginalRow227TriangleData0999
import Grothe.UpperChaos.OriginalRow227TriangleData1000
import Grothe.UpperChaos.OriginalRow227TriangleData1001
import Grothe.UpperChaos.OriginalRow227TriangleData1002
import Grothe.UpperChaos.OriginalRow227TriangleData1003
import Grothe.UpperChaos.OriginalRow227TriangleData1004
import Grothe.UpperChaos.OriginalRow227TriangleData1005
import Grothe.UpperChaos.OriginalRow227TriangleData1006
import Grothe.UpperChaos.OriginalRow227TriangleData1007

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow071

open ConditionalTableLookup

def values0996 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0996.coefficient71_70,
  OriginalRow227TriangleData0996.coefficient71_71,
  OriginalRow227TriangleData0996.coefficient71_72,
  OriginalRow227TriangleData0996.coefficient71_73,
  OriginalRow227TriangleData0996.coefficient71_74,
  OriginalRow227TriangleData0996.coefficient71_75,
  OriginalRow227TriangleData0996.coefficient71_76,
  OriginalRow227TriangleData0996.coefficient71_77,
  OriginalRow227TriangleData0996.coefficient71_78,
  OriginalRow227TriangleData0996.coefficient71_79,
  OriginalRow227TriangleData0996.coefficient71_80,
  OriginalRow227TriangleData0996.coefficient71_81,
  OriginalRow227TriangleData0996.coefficient71_82,
  OriginalRow227TriangleData0996.coefficient71_83,
  OriginalRow227TriangleData0996.coefficient71_84,
  OriginalRow227TriangleData0996.coefficient71_85,
  OriginalRow227TriangleData0996.coefficient71_86,
  OriginalRow227TriangleData0996.coefficient71_87,
  OriginalRow227TriangleData0996.coefficient71_88,
  OriginalRow227TriangleData0996.coefficient71_89,
  OriginalRow227TriangleData0996.coefficient71_90,
  OriginalRow227TriangleData0996.coefficient71_91,
  OriginalRow227TriangleData0996.coefficient71_92,
  OriginalRow227TriangleData0996.coefficient71_93,
  OriginalRow227TriangleData0996.coefficient71_94,
  OriginalRow227TriangleData0996.coefficient71_95,
  OriginalRow227TriangleData0996.coefficient71_96,
  OriginalRow227TriangleData0996.coefficient71_97,
  OriginalRow227TriangleData0996.coefficient71_98,
  OriginalRow227TriangleData0996.coefficient71_99,
  OriginalRow227TriangleData0996.coefficient71_100,
  OriginalRow227TriangleData0996.coefficient71_101
]

theorem values0996_size : values0996.size = 32 := rfl

def block0996 : ℕ → Option IntervalDyadic := segment 70 values0996

theorem block0996_domain : ExactDomain block0996 70 102 := by
  simpa only [values0996_size] using segment_domain 70 values0996

theorem block0996_get (i : Fin 32) :
    block0996 (70 + i.val) = some (values0996[i.val]'(by rw [values0996_size]; exact i.isLt)) := by
  exact segment_get 70 values0996 ⟨i.val, by rw [values0996_size]; exact i.isLt⟩

def values0997 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0997.coefficient71_102,
  OriginalRow227TriangleData0997.coefficient71_103,
  OriginalRow227TriangleData0997.coefficient71_104,
  OriginalRow227TriangleData0997.coefficient71_105,
  OriginalRow227TriangleData0997.coefficient71_106,
  OriginalRow227TriangleData0997.coefficient71_107,
  OriginalRow227TriangleData0997.coefficient71_108,
  OriginalRow227TriangleData0997.coefficient71_109,
  OriginalRow227TriangleData0997.coefficient71_110,
  OriginalRow227TriangleData0997.coefficient71_111,
  OriginalRow227TriangleData0997.coefficient71_112,
  OriginalRow227TriangleData0997.coefficient71_113,
  OriginalRow227TriangleData0997.coefficient71_114,
  OriginalRow227TriangleData0997.coefficient71_115,
  OriginalRow227TriangleData0997.coefficient71_116,
  OriginalRow227TriangleData0997.coefficient71_117,
  OriginalRow227TriangleData0997.coefficient71_118,
  OriginalRow227TriangleData0997.coefficient71_119,
  OriginalRow227TriangleData0997.coefficient71_120,
  OriginalRow227TriangleData0997.coefficient71_121,
  OriginalRow227TriangleData0997.coefficient71_122,
  OriginalRow227TriangleData0997.coefficient71_123,
  OriginalRow227TriangleData0997.coefficient71_124,
  OriginalRow227TriangleData0997.coefficient71_125,
  OriginalRow227TriangleData0997.coefficient71_126,
  OriginalRow227TriangleData0997.coefficient71_127,
  OriginalRow227TriangleData0997.coefficient71_128,
  OriginalRow227TriangleData0997.coefficient71_129,
  OriginalRow227TriangleData0997.coefficient71_130,
  OriginalRow227TriangleData0997.coefficient71_131,
  OriginalRow227TriangleData0997.coefficient71_132,
  OriginalRow227TriangleData0997.coefficient71_133
]

theorem values0997_size : values0997.size = 32 := rfl

def block0997 : ℕ → Option IntervalDyadic := segment 102 values0997

theorem block0997_domain : ExactDomain block0997 102 134 := by
  simpa only [values0997_size] using segment_domain 102 values0997

theorem block0997_get (i : Fin 32) :
    block0997 (102 + i.val) = some (values0997[i.val]'(by rw [values0997_size]; exact i.isLt)) := by
  exact segment_get 102 values0997 ⟨i.val, by rw [values0997_size]; exact i.isLt⟩

def values0998 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0998.coefficient71_134,
  OriginalRow227TriangleData0998.coefficient71_135,
  OriginalRow227TriangleData0998.coefficient71_136,
  OriginalRow227TriangleData0998.coefficient71_137,
  OriginalRow227TriangleData0998.coefficient71_138,
  OriginalRow227TriangleData0998.coefficient71_139,
  OriginalRow227TriangleData0998.coefficient71_140,
  OriginalRow227TriangleData0998.coefficient71_141,
  OriginalRow227TriangleData0998.coefficient71_142,
  OriginalRow227TriangleData0998.coefficient71_143,
  OriginalRow227TriangleData0998.coefficient71_144,
  OriginalRow227TriangleData0998.coefficient71_145,
  OriginalRow227TriangleData0998.coefficient71_146,
  OriginalRow227TriangleData0998.coefficient71_147,
  OriginalRow227TriangleData0998.coefficient71_148,
  OriginalRow227TriangleData0998.coefficient71_149,
  OriginalRow227TriangleData0998.coefficient71_150,
  OriginalRow227TriangleData0998.coefficient71_151,
  OriginalRow227TriangleData0998.coefficient71_152,
  OriginalRow227TriangleData0998.coefficient71_153,
  OriginalRow227TriangleData0998.coefficient71_154,
  OriginalRow227TriangleData0998.coefficient71_155,
  OriginalRow227TriangleData0998.coefficient71_156,
  OriginalRow227TriangleData0998.coefficient71_157,
  OriginalRow227TriangleData0998.coefficient71_158,
  OriginalRow227TriangleData0998.coefficient71_159,
  OriginalRow227TriangleData0998.coefficient71_160,
  OriginalRow227TriangleData0998.coefficient71_161,
  OriginalRow227TriangleData0998.coefficient71_162,
  OriginalRow227TriangleData0998.coefficient71_163,
  OriginalRow227TriangleData0998.coefficient71_164,
  OriginalRow227TriangleData0998.coefficient71_165
]

theorem values0998_size : values0998.size = 32 := rfl

def block0998 : ℕ → Option IntervalDyadic := segment 134 values0998

theorem block0998_domain : ExactDomain block0998 134 166 := by
  simpa only [values0998_size] using segment_domain 134 values0998

theorem block0998_get (i : Fin 32) :
    block0998 (134 + i.val) = some (values0998[i.val]'(by rw [values0998_size]; exact i.isLt)) := by
  exact segment_get 134 values0998 ⟨i.val, by rw [values0998_size]; exact i.isLt⟩

def values0999 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0999.coefficient71_166,
  OriginalRow227TriangleData0999.coefficient71_167,
  OriginalRow227TriangleData0999.coefficient71_168,
  OriginalRow227TriangleData0999.coefficient71_169,
  OriginalRow227TriangleData0999.coefficient71_170,
  OriginalRow227TriangleData0999.coefficient71_171,
  OriginalRow227TriangleData0999.coefficient71_172,
  OriginalRow227TriangleData0999.coefficient71_173,
  OriginalRow227TriangleData0999.coefficient71_174,
  OriginalRow227TriangleData0999.coefficient71_175,
  OriginalRow227TriangleData0999.coefficient71_176,
  OriginalRow227TriangleData0999.coefficient71_177,
  OriginalRow227TriangleData0999.coefficient71_178,
  OriginalRow227TriangleData0999.coefficient71_179,
  OriginalRow227TriangleData0999.coefficient71_180,
  OriginalRow227TriangleData0999.coefficient71_181,
  OriginalRow227TriangleData0999.coefficient71_182,
  OriginalRow227TriangleData0999.coefficient71_183,
  OriginalRow227TriangleData0999.coefficient71_184,
  OriginalRow227TriangleData0999.coefficient71_185,
  OriginalRow227TriangleData0999.coefficient71_186,
  OriginalRow227TriangleData0999.coefficient71_187,
  OriginalRow227TriangleData0999.coefficient71_188,
  OriginalRow227TriangleData0999.coefficient71_189,
  OriginalRow227TriangleData0999.coefficient71_190,
  OriginalRow227TriangleData0999.coefficient71_191,
  OriginalRow227TriangleData0999.coefficient71_192,
  OriginalRow227TriangleData0999.coefficient71_193,
  OriginalRow227TriangleData0999.coefficient71_194,
  OriginalRow227TriangleData0999.coefficient71_195,
  OriginalRow227TriangleData0999.coefficient71_196,
  OriginalRow227TriangleData0999.coefficient71_197
]

theorem values0999_size : values0999.size = 32 := rfl

def block0999 : ℕ → Option IntervalDyadic := segment 166 values0999

theorem block0999_domain : ExactDomain block0999 166 198 := by
  simpa only [values0999_size] using segment_domain 166 values0999

theorem block0999_get (i : Fin 32) :
    block0999 (166 + i.val) = some (values0999[i.val]'(by rw [values0999_size]; exact i.isLt)) := by
  exact segment_get 166 values0999 ⟨i.val, by rw [values0999_size]; exact i.isLt⟩

def values1000 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1000.coefficient71_198,
  OriginalRow227TriangleData1000.coefficient71_199,
  OriginalRow227TriangleData1000.coefficient71_200,
  OriginalRow227TriangleData1000.coefficient71_201,
  OriginalRow227TriangleData1000.coefficient71_202,
  OriginalRow227TriangleData1000.coefficient71_203,
  OriginalRow227TriangleData1000.coefficient71_204,
  OriginalRow227TriangleData1000.coefficient71_205,
  OriginalRow227TriangleData1000.coefficient71_206,
  OriginalRow227TriangleData1000.coefficient71_207,
  OriginalRow227TriangleData1000.coefficient71_208,
  OriginalRow227TriangleData1000.coefficient71_209,
  OriginalRow227TriangleData1000.coefficient71_210,
  OriginalRow227TriangleData1000.coefficient71_211,
  OriginalRow227TriangleData1000.coefficient71_212,
  OriginalRow227TriangleData1000.coefficient71_213,
  OriginalRow227TriangleData1000.coefficient71_214,
  OriginalRow227TriangleData1000.coefficient71_215,
  OriginalRow227TriangleData1000.coefficient71_216,
  OriginalRow227TriangleData1000.coefficient71_217,
  OriginalRow227TriangleData1000.coefficient71_218,
  OriginalRow227TriangleData1000.coefficient71_219,
  OriginalRow227TriangleData1000.coefficient71_220,
  OriginalRow227TriangleData1000.coefficient71_221,
  OriginalRow227TriangleData1000.coefficient71_222,
  OriginalRow227TriangleData1000.coefficient71_223,
  OriginalRow227TriangleData1000.coefficient71_224,
  OriginalRow227TriangleData1000.coefficient71_225,
  OriginalRow227TriangleData1000.coefficient71_226,
  OriginalRow227TriangleData1000.coefficient71_227,
  OriginalRow227TriangleData1000.coefficient71_228,
  OriginalRow227TriangleData1000.coefficient71_229
]

theorem values1000_size : values1000.size = 32 := rfl

def block1000 : ℕ → Option IntervalDyadic := segment 198 values1000

theorem block1000_domain : ExactDomain block1000 198 230 := by
  simpa only [values1000_size] using segment_domain 198 values1000

theorem block1000_get (i : Fin 32) :
    block1000 (198 + i.val) = some (values1000[i.val]'(by rw [values1000_size]; exact i.isLt)) := by
  exact segment_get 198 values1000 ⟨i.val, by rw [values1000_size]; exact i.isLt⟩

def values1001 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1001.coefficient71_230,
  OriginalRow227TriangleData1001.coefficient71_231,
  OriginalRow227TriangleData1001.coefficient71_232,
  OriginalRow227TriangleData1001.coefficient71_233,
  OriginalRow227TriangleData1001.coefficient71_234,
  OriginalRow227TriangleData1001.coefficient71_235,
  OriginalRow227TriangleData1001.coefficient71_236,
  OriginalRow227TriangleData1001.coefficient71_237,
  OriginalRow227TriangleData1001.coefficient71_238,
  OriginalRow227TriangleData1001.coefficient71_239,
  OriginalRow227TriangleData1001.coefficient71_240,
  OriginalRow227TriangleData1001.coefficient71_241,
  OriginalRow227TriangleData1001.coefficient71_242,
  OriginalRow227TriangleData1001.coefficient71_243,
  OriginalRow227TriangleData1001.coefficient71_244,
  OriginalRow227TriangleData1001.coefficient71_245,
  OriginalRow227TriangleData1001.coefficient71_246,
  OriginalRow227TriangleData1001.coefficient71_247,
  OriginalRow227TriangleData1001.coefficient71_248,
  OriginalRow227TriangleData1001.coefficient71_249,
  OriginalRow227TriangleData1001.coefficient71_250,
  OriginalRow227TriangleData1001.coefficient71_251,
  OriginalRow227TriangleData1001.coefficient71_252,
  OriginalRow227TriangleData1001.coefficient71_253,
  OriginalRow227TriangleData1001.coefficient71_254,
  OriginalRow227TriangleData1001.coefficient71_255,
  OriginalRow227TriangleData1001.coefficient71_256,
  OriginalRow227TriangleData1001.coefficient71_257,
  OriginalRow227TriangleData1001.coefficient71_258,
  OriginalRow227TriangleData1001.coefficient71_259,
  OriginalRow227TriangleData1001.coefficient71_260,
  OriginalRow227TriangleData1001.coefficient71_261
]

theorem values1001_size : values1001.size = 32 := rfl

def block1001 : ℕ → Option IntervalDyadic := segment 230 values1001

theorem block1001_domain : ExactDomain block1001 230 262 := by
  simpa only [values1001_size] using segment_domain 230 values1001

theorem block1001_get (i : Fin 32) :
    block1001 (230 + i.val) = some (values1001[i.val]'(by rw [values1001_size]; exact i.isLt)) := by
  exact segment_get 230 values1001 ⟨i.val, by rw [values1001_size]; exact i.isLt⟩

def values1002 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1002.coefficient71_262,
  OriginalRow227TriangleData1002.coefficient71_263,
  OriginalRow227TriangleData1002.coefficient71_264,
  OriginalRow227TriangleData1002.coefficient71_265,
  OriginalRow227TriangleData1002.coefficient71_266,
  OriginalRow227TriangleData1002.coefficient71_267,
  OriginalRow227TriangleData1002.coefficient71_268,
  OriginalRow227TriangleData1002.coefficient71_269,
  OriginalRow227TriangleData1002.coefficient71_270,
  OriginalRow227TriangleData1002.coefficient71_271,
  OriginalRow227TriangleData1002.coefficient71_272,
  OriginalRow227TriangleData1002.coefficient71_273,
  OriginalRow227TriangleData1002.coefficient71_274,
  OriginalRow227TriangleData1002.coefficient71_275,
  OriginalRow227TriangleData1002.coefficient71_276,
  OriginalRow227TriangleData1002.coefficient71_277,
  OriginalRow227TriangleData1002.coefficient71_278,
  OriginalRow227TriangleData1002.coefficient71_279,
  OriginalRow227TriangleData1002.coefficient71_280,
  OriginalRow227TriangleData1002.coefficient71_281,
  OriginalRow227TriangleData1002.coefficient71_282,
  OriginalRow227TriangleData1002.coefficient71_283,
  OriginalRow227TriangleData1002.coefficient71_284,
  OriginalRow227TriangleData1002.coefficient71_285,
  OriginalRow227TriangleData1002.coefficient71_286,
  OriginalRow227TriangleData1002.coefficient71_287,
  OriginalRow227TriangleData1002.coefficient71_288,
  OriginalRow227TriangleData1002.coefficient71_289,
  OriginalRow227TriangleData1002.coefficient71_290,
  OriginalRow227TriangleData1002.coefficient71_291,
  OriginalRow227TriangleData1002.coefficient71_292,
  OriginalRow227TriangleData1002.coefficient71_293
]

theorem values1002_size : values1002.size = 32 := rfl

def block1002 : ℕ → Option IntervalDyadic := segment 262 values1002

theorem block1002_domain : ExactDomain block1002 262 294 := by
  simpa only [values1002_size] using segment_domain 262 values1002

theorem block1002_get (i : Fin 32) :
    block1002 (262 + i.val) = some (values1002[i.val]'(by rw [values1002_size]; exact i.isLt)) := by
  exact segment_get 262 values1002 ⟨i.val, by rw [values1002_size]; exact i.isLt⟩

def values1003 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1003.coefficient71_294,
  OriginalRow227TriangleData1003.coefficient71_295,
  OriginalRow227TriangleData1003.coefficient71_296,
  OriginalRow227TriangleData1003.coefficient71_297,
  OriginalRow227TriangleData1003.coefficient71_298,
  OriginalRow227TriangleData1003.coefficient71_299,
  OriginalRow227TriangleData1003.coefficient71_300,
  OriginalRow227TriangleData1003.coefficient71_301,
  OriginalRow227TriangleData1003.coefficient71_302,
  OriginalRow227TriangleData1003.coefficient71_303,
  OriginalRow227TriangleData1003.coefficient71_304,
  OriginalRow227TriangleData1003.coefficient71_305,
  OriginalRow227TriangleData1003.coefficient71_306,
  OriginalRow227TriangleData1003.coefficient71_307,
  OriginalRow227TriangleData1003.coefficient71_308,
  OriginalRow227TriangleData1003.coefficient71_309,
  OriginalRow227TriangleData1003.coefficient71_310,
  OriginalRow227TriangleData1003.coefficient71_311,
  OriginalRow227TriangleData1003.coefficient71_312,
  OriginalRow227TriangleData1003.coefficient71_313,
  OriginalRow227TriangleData1003.coefficient71_314,
  OriginalRow227TriangleData1003.coefficient71_315,
  OriginalRow227TriangleData1003.coefficient71_316,
  OriginalRow227TriangleData1003.coefficient71_317,
  OriginalRow227TriangleData1003.coefficient71_318,
  OriginalRow227TriangleData1003.coefficient71_319,
  OriginalRow227TriangleData1003.coefficient71_320,
  OriginalRow227TriangleData1003.coefficient71_321,
  OriginalRow227TriangleData1003.coefficient71_322,
  OriginalRow227TriangleData1003.coefficient71_323,
  OriginalRow227TriangleData1003.coefficient71_324,
  OriginalRow227TriangleData1003.coefficient71_325
]

theorem values1003_size : values1003.size = 32 := rfl

def block1003 : ℕ → Option IntervalDyadic := segment 294 values1003

theorem block1003_domain : ExactDomain block1003 294 326 := by
  simpa only [values1003_size] using segment_domain 294 values1003

theorem block1003_get (i : Fin 32) :
    block1003 (294 + i.val) = some (values1003[i.val]'(by rw [values1003_size]; exact i.isLt)) := by
  exact segment_get 294 values1003 ⟨i.val, by rw [values1003_size]; exact i.isLt⟩

def values1004 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1004.coefficient71_326,
  OriginalRow227TriangleData1004.coefficient71_327,
  OriginalRow227TriangleData1004.coefficient71_328,
  OriginalRow227TriangleData1004.coefficient71_329,
  OriginalRow227TriangleData1004.coefficient71_330,
  OriginalRow227TriangleData1004.coefficient71_331,
  OriginalRow227TriangleData1004.coefficient71_332,
  OriginalRow227TriangleData1004.coefficient71_333,
  OriginalRow227TriangleData1004.coefficient71_334,
  OriginalRow227TriangleData1004.coefficient71_335,
  OriginalRow227TriangleData1004.coefficient71_336,
  OriginalRow227TriangleData1004.coefficient71_337,
  OriginalRow227TriangleData1004.coefficient71_338,
  OriginalRow227TriangleData1004.coefficient71_339,
  OriginalRow227TriangleData1004.coefficient71_340,
  OriginalRow227TriangleData1004.coefficient71_341,
  OriginalRow227TriangleData1004.coefficient71_342,
  OriginalRow227TriangleData1004.coefficient71_343,
  OriginalRow227TriangleData1004.coefficient71_344,
  OriginalRow227TriangleData1004.coefficient71_345,
  OriginalRow227TriangleData1004.coefficient71_346,
  OriginalRow227TriangleData1004.coefficient71_347,
  OriginalRow227TriangleData1004.coefficient71_348,
  OriginalRow227TriangleData1004.coefficient71_349,
  OriginalRow227TriangleData1004.coefficient71_350,
  OriginalRow227TriangleData1004.coefficient71_351,
  OriginalRow227TriangleData1004.coefficient71_352,
  OriginalRow227TriangleData1004.coefficient71_353,
  OriginalRow227TriangleData1004.coefficient71_354,
  OriginalRow227TriangleData1004.coefficient71_355,
  OriginalRow227TriangleData1004.coefficient71_356,
  OriginalRow227TriangleData1004.coefficient71_357
]

theorem values1004_size : values1004.size = 32 := rfl

def block1004 : ℕ → Option IntervalDyadic := segment 326 values1004

theorem block1004_domain : ExactDomain block1004 326 358 := by
  simpa only [values1004_size] using segment_domain 326 values1004

theorem block1004_get (i : Fin 32) :
    block1004 (326 + i.val) = some (values1004[i.val]'(by rw [values1004_size]; exact i.isLt)) := by
  exact segment_get 326 values1004 ⟨i.val, by rw [values1004_size]; exact i.isLt⟩

def values1005 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1005.coefficient71_358,
  OriginalRow227TriangleData1005.coefficient71_359,
  OriginalRow227TriangleData1005.coefficient71_360,
  OriginalRow227TriangleData1005.coefficient71_361,
  OriginalRow227TriangleData1005.coefficient71_362,
  OriginalRow227TriangleData1005.coefficient71_363,
  OriginalRow227TriangleData1005.coefficient71_364,
  OriginalRow227TriangleData1005.coefficient71_365,
  OriginalRow227TriangleData1005.coefficient71_366,
  OriginalRow227TriangleData1005.coefficient71_367,
  OriginalRow227TriangleData1005.coefficient71_368,
  OriginalRow227TriangleData1005.coefficient71_369,
  OriginalRow227TriangleData1005.coefficient71_370,
  OriginalRow227TriangleData1005.coefficient71_371,
  OriginalRow227TriangleData1005.coefficient71_372,
  OriginalRow227TriangleData1005.coefficient71_373,
  OriginalRow227TriangleData1005.coefficient71_374,
  OriginalRow227TriangleData1005.coefficient71_375,
  OriginalRow227TriangleData1005.coefficient71_376,
  OriginalRow227TriangleData1005.coefficient71_377,
  OriginalRow227TriangleData1005.coefficient71_378,
  OriginalRow227TriangleData1005.coefficient71_379,
  OriginalRow227TriangleData1005.coefficient71_380,
  OriginalRow227TriangleData1005.coefficient71_381,
  OriginalRow227TriangleData1005.coefficient71_382,
  OriginalRow227TriangleData1005.coefficient71_383,
  OriginalRow227TriangleData1005.coefficient71_384,
  OriginalRow227TriangleData1005.coefficient71_385,
  OriginalRow227TriangleData1005.coefficient71_386,
  OriginalRow227TriangleData1005.coefficient71_387,
  OriginalRow227TriangleData1005.coefficient71_388,
  OriginalRow227TriangleData1005.coefficient71_389
]

theorem values1005_size : values1005.size = 32 := rfl

def block1005 : ℕ → Option IntervalDyadic := segment 358 values1005

theorem block1005_domain : ExactDomain block1005 358 390 := by
  simpa only [values1005_size] using segment_domain 358 values1005

theorem block1005_get (i : Fin 32) :
    block1005 (358 + i.val) = some (values1005[i.val]'(by rw [values1005_size]; exact i.isLt)) := by
  exact segment_get 358 values1005 ⟨i.val, by rw [values1005_size]; exact i.isLt⟩

def values1006 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1006.coefficient71_390,
  OriginalRow227TriangleData1006.coefficient71_391,
  OriginalRow227TriangleData1006.coefficient71_392,
  OriginalRow227TriangleData1006.coefficient71_393,
  OriginalRow227TriangleData1006.coefficient71_394,
  OriginalRow227TriangleData1006.coefficient71_395,
  OriginalRow227TriangleData1006.coefficient71_396,
  OriginalRow227TriangleData1006.coefficient71_397,
  OriginalRow227TriangleData1006.coefficient71_398,
  OriginalRow227TriangleData1006.coefficient71_399,
  OriginalRow227TriangleData1006.coefficient71_400,
  OriginalRow227TriangleData1006.coefficient71_401,
  OriginalRow227TriangleData1006.coefficient71_402,
  OriginalRow227TriangleData1006.coefficient71_403,
  OriginalRow227TriangleData1006.coefficient71_404,
  OriginalRow227TriangleData1006.coefficient71_405,
  OriginalRow227TriangleData1006.coefficient71_406,
  OriginalRow227TriangleData1006.coefficient71_407,
  OriginalRow227TriangleData1006.coefficient71_408,
  OriginalRow227TriangleData1006.coefficient71_409,
  OriginalRow227TriangleData1006.coefficient71_410,
  OriginalRow227TriangleData1006.coefficient71_411,
  OriginalRow227TriangleData1006.coefficient71_412,
  OriginalRow227TriangleData1006.coefficient71_413,
  OriginalRow227TriangleData1006.coefficient71_414,
  OriginalRow227TriangleData1006.coefficient71_415,
  OriginalRow227TriangleData1006.coefficient71_416,
  OriginalRow227TriangleData1006.coefficient71_417,
  OriginalRow227TriangleData1006.coefficient71_418,
  OriginalRow227TriangleData1006.coefficient71_419,
  OriginalRow227TriangleData1006.coefficient71_420,
  OriginalRow227TriangleData1006.coefficient71_421
]

theorem values1006_size : values1006.size = 32 := rfl

def block1006 : ℕ → Option IntervalDyadic := segment 390 values1006

theorem block1006_domain : ExactDomain block1006 390 422 := by
  simpa only [values1006_size] using segment_domain 390 values1006

theorem block1006_get (i : Fin 32) :
    block1006 (390 + i.val) = some (values1006[i.val]'(by rw [values1006_size]; exact i.isLt)) := by
  exact segment_get 390 values1006 ⟨i.val, by rw [values1006_size]; exact i.isLt⟩

def values1007 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1007.coefficient71_422,
  OriginalRow227TriangleData1007.coefficient71_423,
  OriginalRow227TriangleData1007.coefficient71_424,
  OriginalRow227TriangleData1007.coefficient71_425,
  OriginalRow227TriangleData1007.coefficient71_426,
  OriginalRow227TriangleData1007.coefficient71_427,
  OriginalRow227TriangleData1007.coefficient71_428,
  OriginalRow227TriangleData1007.coefficient71_429,
  OriginalRow227TriangleData1007.coefficient71_430
]

theorem values1007_size : values1007.size = 9 := rfl

def block1007 : ℕ → Option IntervalDyadic := segment 422 values1007

theorem block1007_domain : ExactDomain block1007 422 431 := by
  simpa only [values1007_size] using segment_domain 422 values1007

theorem block1007_get (i : Fin 9) :
    block1007 (422 + i.val) = some (values1007[i.val]'(by rw [values1007_size]; exact i.isLt)) := by
  exact segment_get 422 values1007 ⟨i.val, by rw [values1007_size]; exact i.isLt⟩

def node0102_0166 : ℕ → Option IntervalDyadic := split 134 block0997 block0998

theorem node0102_0166_domain : ExactDomain node0102_0166 102 166 := by
  exact split_domain (by decide) (by decide) block0997_domain block0998_domain

def node0070_0166 : ℕ → Option IntervalDyadic := split 102 block0996 node0102_0166

theorem node0070_0166_domain : ExactDomain node0070_0166 70 166 := by
  exact split_domain (by decide) (by decide) block0996_domain node0102_0166_domain

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block1000 block1001

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block1000_domain block1001_domain

def node0166_0262 : ℕ → Option IntervalDyadic := split 198 block0999 node0198_0262

theorem node0166_0262_domain : ExactDomain node0166_0262 166 262 := by
  exact split_domain (by decide) (by decide) block0999_domain node0198_0262_domain

def node0070_0262 : ℕ → Option IntervalDyadic := split 166 node0070_0166 node0166_0262

theorem node0070_0262_domain : ExactDomain node0070_0262 70 262 := by
  exact split_domain (by decide) (by decide) node0070_0166_domain node0166_0262_domain

def node0294_0358 : ℕ → Option IntervalDyadic := split 326 block1003 block1004

theorem node0294_0358_domain : ExactDomain node0294_0358 294 358 := by
  exact split_domain (by decide) (by decide) block1003_domain block1004_domain

def node0262_0358 : ℕ → Option IntervalDyadic := split 294 block1002 node0294_0358

theorem node0262_0358_domain : ExactDomain node0262_0358 262 358 := by
  exact split_domain (by decide) (by decide) block1002_domain node0294_0358_domain

def node0390_0431 : ℕ → Option IntervalDyadic := split 422 block1006 block1007

theorem node0390_0431_domain : ExactDomain node0390_0431 390 431 := by
  exact split_domain (by decide) (by decide) block1006_domain block1007_domain

def node0358_0431 : ℕ → Option IntervalDyadic := split 390 block1005 node0390_0431

theorem node0358_0431_domain : ExactDomain node0358_0431 358 431 := by
  exact split_domain (by decide) (by decide) block1005_domain node0390_0431_domain

def node0262_0431 : ℕ → Option IntervalDyadic := split 358 node0262_0358 node0358_0431

theorem node0262_0431_domain : ExactDomain node0262_0431 262 431 := by
  exact split_domain (by decide) (by decide) node0262_0358_domain node0358_0431_domain

def node0070_0431 : ℕ → Option IntervalDyadic := split 262 node0070_0262 node0262_0431

theorem node0070_0431_domain : ExactDomain node0070_0431 70 431 := by
  exact split_domain (by decide) (by decide) node0070_0262_domain node0262_0431_domain

def lookup : ℕ → Option IntervalDyadic := node0070_0431

theorem lookup_domain : ExactDomain lookup 70 431 :=
  node0070_0431_domain

theorem block0996_lookup (i : Fin 32) :
    lookup (70 + i.val) = some (values0996[i.val]'(by rw [values0996_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (70 + i.val) = _
  rw [node0070_0431, split_left 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0070_0262, split_left 166 node0070_0166 node0166_0262 (by omega)]
  rw [node0070_0166, split_left 102 block0996 node0102_0166 (by omega)]
  exact block0996_get i

theorem block0997_lookup (i : Fin 32) :
    lookup (102 + i.val) = some (values0997[i.val]'(by rw [values0997_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (102 + i.val) = _
  rw [node0070_0431, split_left 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0070_0262, split_left 166 node0070_0166 node0166_0262 (by omega)]
  rw [node0070_0166, split_right 102 block0996 node0102_0166 (by omega)]
  rw [node0102_0166, split_left 134 block0997 block0998 (by omega)]
  exact block0997_get i

theorem block0998_lookup (i : Fin 32) :
    lookup (134 + i.val) = some (values0998[i.val]'(by rw [values0998_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (134 + i.val) = _
  rw [node0070_0431, split_left 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0070_0262, split_left 166 node0070_0166 node0166_0262 (by omega)]
  rw [node0070_0166, split_right 102 block0996 node0102_0166 (by omega)]
  rw [node0102_0166, split_right 134 block0997 block0998 (by omega)]
  exact block0998_get i

theorem block0999_lookup (i : Fin 32) :
    lookup (166 + i.val) = some (values0999[i.val]'(by rw [values0999_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (166 + i.val) = _
  rw [node0070_0431, split_left 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0070_0262, split_right 166 node0070_0166 node0166_0262 (by omega)]
  rw [node0166_0262, split_left 198 block0999 node0198_0262 (by omega)]
  exact block0999_get i

theorem block1000_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values1000[i.val]'(by rw [values1000_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (198 + i.val) = _
  rw [node0070_0431, split_left 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0070_0262, split_right 166 node0070_0166 node0166_0262 (by omega)]
  rw [node0166_0262, split_right 198 block0999 node0198_0262 (by omega)]
  rw [node0198_0262, split_left 230 block1000 block1001 (by omega)]
  exact block1000_get i

theorem block1001_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values1001[i.val]'(by rw [values1001_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (230 + i.val) = _
  rw [node0070_0431, split_left 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0070_0262, split_right 166 node0070_0166 node0166_0262 (by omega)]
  rw [node0166_0262, split_right 198 block0999 node0198_0262 (by omega)]
  rw [node0198_0262, split_right 230 block1000 block1001 (by omega)]
  exact block1001_get i

theorem block1002_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values1002[i.val]'(by rw [values1002_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (262 + i.val) = _
  rw [node0070_0431, split_right 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0262_0431, split_left 358 node0262_0358 node0358_0431 (by omega)]
  rw [node0262_0358, split_left 294 block1002 node0294_0358 (by omega)]
  exact block1002_get i

theorem block1003_lookup (i : Fin 32) :
    lookup (294 + i.val) = some (values1003[i.val]'(by rw [values1003_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (294 + i.val) = _
  rw [node0070_0431, split_right 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0262_0431, split_left 358 node0262_0358 node0358_0431 (by omega)]
  rw [node0262_0358, split_right 294 block1002 node0294_0358 (by omega)]
  rw [node0294_0358, split_left 326 block1003 block1004 (by omega)]
  exact block1003_get i

theorem block1004_lookup (i : Fin 32) :
    lookup (326 + i.val) = some (values1004[i.val]'(by rw [values1004_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (326 + i.val) = _
  rw [node0070_0431, split_right 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0262_0431, split_left 358 node0262_0358 node0358_0431 (by omega)]
  rw [node0262_0358, split_right 294 block1002 node0294_0358 (by omega)]
  rw [node0294_0358, split_right 326 block1003 block1004 (by omega)]
  exact block1004_get i

theorem block1005_lookup (i : Fin 32) :
    lookup (358 + i.val) = some (values1005[i.val]'(by rw [values1005_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (358 + i.val) = _
  rw [node0070_0431, split_right 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0262_0431, split_right 358 node0262_0358 node0358_0431 (by omega)]
  rw [node0358_0431, split_left 390 block1005 node0390_0431 (by omega)]
  exact block1005_get i

theorem block1006_lookup (i : Fin 32) :
    lookup (390 + i.val) = some (values1006[i.val]'(by rw [values1006_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (390 + i.val) = _
  rw [node0070_0431, split_right 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0262_0431, split_right 358 node0262_0358 node0358_0431 (by omega)]
  rw [node0358_0431, split_right 390 block1005 node0390_0431 (by omega)]
  rw [node0390_0431, split_left 422 block1006 block1007 (by omega)]
  exact block1006_get i

theorem block1007_lookup (i : Fin 9) :
    lookup (422 + i.val) = some (values1007[i.val]'(by rw [values1007_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0070_0431 (422 + i.val) = _
  rw [node0070_0431, split_right 262 node0070_0262 node0262_0431 (by omega)]
  rw [node0262_0431, split_right 358 node0262_0358 node0358_0431 (by omega)]
  rw [node0358_0431, split_right 390 block1005 node0390_0431 (by omega)]
  rw [node0390_0431, split_right 422 block1006 block1007 (by omega)]
  exact block1007_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0996_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0996_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0997_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0997_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0998_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0998_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0999_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0999_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1000_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1000_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1001_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1001_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1002_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1002_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1003_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1003_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1004_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1004_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1005_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1005_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1006_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1006_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1007_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1007_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0996_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0997_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0998_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block0999_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1000_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1001_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1002_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1003_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1004_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1005_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1006_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow071.block1007_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow071
