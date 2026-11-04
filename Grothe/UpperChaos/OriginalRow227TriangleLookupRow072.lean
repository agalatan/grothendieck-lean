import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1008
import Grothe.UpperChaos.OriginalRow227TriangleData1009
import Grothe.UpperChaos.OriginalRow227TriangleData1010
import Grothe.UpperChaos.OriginalRow227TriangleData1011
import Grothe.UpperChaos.OriginalRow227TriangleData1012
import Grothe.UpperChaos.OriginalRow227TriangleData1013
import Grothe.UpperChaos.OriginalRow227TriangleData1014
import Grothe.UpperChaos.OriginalRow227TriangleData1015
import Grothe.UpperChaos.OriginalRow227TriangleData1016
import Grothe.UpperChaos.OriginalRow227TriangleData1017
import Grothe.UpperChaos.OriginalRow227TriangleData1018
import Grothe.UpperChaos.OriginalRow227TriangleData1019

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow072

open ConditionalTableLookup

def values1008 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1008.coefficient72_71,
  OriginalRow227TriangleData1008.coefficient72_72,
  OriginalRow227TriangleData1008.coefficient72_73,
  OriginalRow227TriangleData1008.coefficient72_74,
  OriginalRow227TriangleData1008.coefficient72_75,
  OriginalRow227TriangleData1008.coefficient72_76,
  OriginalRow227TriangleData1008.coefficient72_77,
  OriginalRow227TriangleData1008.coefficient72_78,
  OriginalRow227TriangleData1008.coefficient72_79,
  OriginalRow227TriangleData1008.coefficient72_80,
  OriginalRow227TriangleData1008.coefficient72_81,
  OriginalRow227TriangleData1008.coefficient72_82,
  OriginalRow227TriangleData1008.coefficient72_83,
  OriginalRow227TriangleData1008.coefficient72_84,
  OriginalRow227TriangleData1008.coefficient72_85,
  OriginalRow227TriangleData1008.coefficient72_86,
  OriginalRow227TriangleData1008.coefficient72_87,
  OriginalRow227TriangleData1008.coefficient72_88,
  OriginalRow227TriangleData1008.coefficient72_89,
  OriginalRow227TriangleData1008.coefficient72_90,
  OriginalRow227TriangleData1008.coefficient72_91,
  OriginalRow227TriangleData1008.coefficient72_92,
  OriginalRow227TriangleData1008.coefficient72_93,
  OriginalRow227TriangleData1008.coefficient72_94,
  OriginalRow227TriangleData1008.coefficient72_95,
  OriginalRow227TriangleData1008.coefficient72_96,
  OriginalRow227TriangleData1008.coefficient72_97,
  OriginalRow227TriangleData1008.coefficient72_98,
  OriginalRow227TriangleData1008.coefficient72_99,
  OriginalRow227TriangleData1008.coefficient72_100,
  OriginalRow227TriangleData1008.coefficient72_101,
  OriginalRow227TriangleData1008.coefficient72_102
]

theorem values1008_size : values1008.size = 32 := rfl

def block1008 : ℕ → Option IntervalDyadic := segment 71 values1008

theorem block1008_domain : ExactDomain block1008 71 103 := by
  simpa only [values1008_size] using segment_domain 71 values1008

theorem block1008_get (i : Fin 32) :
    block1008 (71 + i.val) = some (values1008[i.val]'(by rw [values1008_size]; exact i.isLt)) := by
  exact segment_get 71 values1008 ⟨i.val, by rw [values1008_size]; exact i.isLt⟩

def values1009 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1009.coefficient72_103,
  OriginalRow227TriangleData1009.coefficient72_104,
  OriginalRow227TriangleData1009.coefficient72_105,
  OriginalRow227TriangleData1009.coefficient72_106,
  OriginalRow227TriangleData1009.coefficient72_107,
  OriginalRow227TriangleData1009.coefficient72_108,
  OriginalRow227TriangleData1009.coefficient72_109,
  OriginalRow227TriangleData1009.coefficient72_110,
  OriginalRow227TriangleData1009.coefficient72_111,
  OriginalRow227TriangleData1009.coefficient72_112,
  OriginalRow227TriangleData1009.coefficient72_113,
  OriginalRow227TriangleData1009.coefficient72_114,
  OriginalRow227TriangleData1009.coefficient72_115,
  OriginalRow227TriangleData1009.coefficient72_116,
  OriginalRow227TriangleData1009.coefficient72_117,
  OriginalRow227TriangleData1009.coefficient72_118,
  OriginalRow227TriangleData1009.coefficient72_119,
  OriginalRow227TriangleData1009.coefficient72_120,
  OriginalRow227TriangleData1009.coefficient72_121,
  OriginalRow227TriangleData1009.coefficient72_122,
  OriginalRow227TriangleData1009.coefficient72_123,
  OriginalRow227TriangleData1009.coefficient72_124,
  OriginalRow227TriangleData1009.coefficient72_125,
  OriginalRow227TriangleData1009.coefficient72_126,
  OriginalRow227TriangleData1009.coefficient72_127,
  OriginalRow227TriangleData1009.coefficient72_128,
  OriginalRow227TriangleData1009.coefficient72_129,
  OriginalRow227TriangleData1009.coefficient72_130,
  OriginalRow227TriangleData1009.coefficient72_131,
  OriginalRow227TriangleData1009.coefficient72_132,
  OriginalRow227TriangleData1009.coefficient72_133,
  OriginalRow227TriangleData1009.coefficient72_134
]

theorem values1009_size : values1009.size = 32 := rfl

def block1009 : ℕ → Option IntervalDyadic := segment 103 values1009

theorem block1009_domain : ExactDomain block1009 103 135 := by
  simpa only [values1009_size] using segment_domain 103 values1009

theorem block1009_get (i : Fin 32) :
    block1009 (103 + i.val) = some (values1009[i.val]'(by rw [values1009_size]; exact i.isLt)) := by
  exact segment_get 103 values1009 ⟨i.val, by rw [values1009_size]; exact i.isLt⟩

def values1010 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1010.coefficient72_135,
  OriginalRow227TriangleData1010.coefficient72_136,
  OriginalRow227TriangleData1010.coefficient72_137,
  OriginalRow227TriangleData1010.coefficient72_138,
  OriginalRow227TriangleData1010.coefficient72_139,
  OriginalRow227TriangleData1010.coefficient72_140,
  OriginalRow227TriangleData1010.coefficient72_141,
  OriginalRow227TriangleData1010.coefficient72_142,
  OriginalRow227TriangleData1010.coefficient72_143,
  OriginalRow227TriangleData1010.coefficient72_144,
  OriginalRow227TriangleData1010.coefficient72_145,
  OriginalRow227TriangleData1010.coefficient72_146,
  OriginalRow227TriangleData1010.coefficient72_147,
  OriginalRow227TriangleData1010.coefficient72_148,
  OriginalRow227TriangleData1010.coefficient72_149,
  OriginalRow227TriangleData1010.coefficient72_150,
  OriginalRow227TriangleData1010.coefficient72_151,
  OriginalRow227TriangleData1010.coefficient72_152,
  OriginalRow227TriangleData1010.coefficient72_153,
  OriginalRow227TriangleData1010.coefficient72_154,
  OriginalRow227TriangleData1010.coefficient72_155,
  OriginalRow227TriangleData1010.coefficient72_156,
  OriginalRow227TriangleData1010.coefficient72_157,
  OriginalRow227TriangleData1010.coefficient72_158,
  OriginalRow227TriangleData1010.coefficient72_159,
  OriginalRow227TriangleData1010.coefficient72_160,
  OriginalRow227TriangleData1010.coefficient72_161,
  OriginalRow227TriangleData1010.coefficient72_162,
  OriginalRow227TriangleData1010.coefficient72_163,
  OriginalRow227TriangleData1010.coefficient72_164,
  OriginalRow227TriangleData1010.coefficient72_165,
  OriginalRow227TriangleData1010.coefficient72_166
]

theorem values1010_size : values1010.size = 32 := rfl

def block1010 : ℕ → Option IntervalDyadic := segment 135 values1010

theorem block1010_domain : ExactDomain block1010 135 167 := by
  simpa only [values1010_size] using segment_domain 135 values1010

theorem block1010_get (i : Fin 32) :
    block1010 (135 + i.val) = some (values1010[i.val]'(by rw [values1010_size]; exact i.isLt)) := by
  exact segment_get 135 values1010 ⟨i.val, by rw [values1010_size]; exact i.isLt⟩

def values1011 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1011.coefficient72_167,
  OriginalRow227TriangleData1011.coefficient72_168,
  OriginalRow227TriangleData1011.coefficient72_169,
  OriginalRow227TriangleData1011.coefficient72_170,
  OriginalRow227TriangleData1011.coefficient72_171,
  OriginalRow227TriangleData1011.coefficient72_172,
  OriginalRow227TriangleData1011.coefficient72_173,
  OriginalRow227TriangleData1011.coefficient72_174,
  OriginalRow227TriangleData1011.coefficient72_175,
  OriginalRow227TriangleData1011.coefficient72_176,
  OriginalRow227TriangleData1011.coefficient72_177,
  OriginalRow227TriangleData1011.coefficient72_178,
  OriginalRow227TriangleData1011.coefficient72_179,
  OriginalRow227TriangleData1011.coefficient72_180,
  OriginalRow227TriangleData1011.coefficient72_181,
  OriginalRow227TriangleData1011.coefficient72_182,
  OriginalRow227TriangleData1011.coefficient72_183,
  OriginalRow227TriangleData1011.coefficient72_184,
  OriginalRow227TriangleData1011.coefficient72_185,
  OriginalRow227TriangleData1011.coefficient72_186,
  OriginalRow227TriangleData1011.coefficient72_187,
  OriginalRow227TriangleData1011.coefficient72_188,
  OriginalRow227TriangleData1011.coefficient72_189,
  OriginalRow227TriangleData1011.coefficient72_190,
  OriginalRow227TriangleData1011.coefficient72_191,
  OriginalRow227TriangleData1011.coefficient72_192,
  OriginalRow227TriangleData1011.coefficient72_193,
  OriginalRow227TriangleData1011.coefficient72_194,
  OriginalRow227TriangleData1011.coefficient72_195,
  OriginalRow227TriangleData1011.coefficient72_196,
  OriginalRow227TriangleData1011.coefficient72_197,
  OriginalRow227TriangleData1011.coefficient72_198
]

theorem values1011_size : values1011.size = 32 := rfl

def block1011 : ℕ → Option IntervalDyadic := segment 167 values1011

theorem block1011_domain : ExactDomain block1011 167 199 := by
  simpa only [values1011_size] using segment_domain 167 values1011

theorem block1011_get (i : Fin 32) :
    block1011 (167 + i.val) = some (values1011[i.val]'(by rw [values1011_size]; exact i.isLt)) := by
  exact segment_get 167 values1011 ⟨i.val, by rw [values1011_size]; exact i.isLt⟩

def values1012 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1012.coefficient72_199,
  OriginalRow227TriangleData1012.coefficient72_200,
  OriginalRow227TriangleData1012.coefficient72_201,
  OriginalRow227TriangleData1012.coefficient72_202,
  OriginalRow227TriangleData1012.coefficient72_203,
  OriginalRow227TriangleData1012.coefficient72_204,
  OriginalRow227TriangleData1012.coefficient72_205,
  OriginalRow227TriangleData1012.coefficient72_206,
  OriginalRow227TriangleData1012.coefficient72_207,
  OriginalRow227TriangleData1012.coefficient72_208,
  OriginalRow227TriangleData1012.coefficient72_209,
  OriginalRow227TriangleData1012.coefficient72_210,
  OriginalRow227TriangleData1012.coefficient72_211,
  OriginalRow227TriangleData1012.coefficient72_212,
  OriginalRow227TriangleData1012.coefficient72_213,
  OriginalRow227TriangleData1012.coefficient72_214,
  OriginalRow227TriangleData1012.coefficient72_215,
  OriginalRow227TriangleData1012.coefficient72_216,
  OriginalRow227TriangleData1012.coefficient72_217,
  OriginalRow227TriangleData1012.coefficient72_218,
  OriginalRow227TriangleData1012.coefficient72_219,
  OriginalRow227TriangleData1012.coefficient72_220,
  OriginalRow227TriangleData1012.coefficient72_221,
  OriginalRow227TriangleData1012.coefficient72_222,
  OriginalRow227TriangleData1012.coefficient72_223,
  OriginalRow227TriangleData1012.coefficient72_224,
  OriginalRow227TriangleData1012.coefficient72_225,
  OriginalRow227TriangleData1012.coefficient72_226,
  OriginalRow227TriangleData1012.coefficient72_227,
  OriginalRow227TriangleData1012.coefficient72_228,
  OriginalRow227TriangleData1012.coefficient72_229,
  OriginalRow227TriangleData1012.coefficient72_230
]

theorem values1012_size : values1012.size = 32 := rfl

def block1012 : ℕ → Option IntervalDyadic := segment 199 values1012

theorem block1012_domain : ExactDomain block1012 199 231 := by
  simpa only [values1012_size] using segment_domain 199 values1012

theorem block1012_get (i : Fin 32) :
    block1012 (199 + i.val) = some (values1012[i.val]'(by rw [values1012_size]; exact i.isLt)) := by
  exact segment_get 199 values1012 ⟨i.val, by rw [values1012_size]; exact i.isLt⟩

def values1013 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1013.coefficient72_231,
  OriginalRow227TriangleData1013.coefficient72_232,
  OriginalRow227TriangleData1013.coefficient72_233,
  OriginalRow227TriangleData1013.coefficient72_234,
  OriginalRow227TriangleData1013.coefficient72_235,
  OriginalRow227TriangleData1013.coefficient72_236,
  OriginalRow227TriangleData1013.coefficient72_237,
  OriginalRow227TriangleData1013.coefficient72_238,
  OriginalRow227TriangleData1013.coefficient72_239,
  OriginalRow227TriangleData1013.coefficient72_240,
  OriginalRow227TriangleData1013.coefficient72_241,
  OriginalRow227TriangleData1013.coefficient72_242,
  OriginalRow227TriangleData1013.coefficient72_243,
  OriginalRow227TriangleData1013.coefficient72_244,
  OriginalRow227TriangleData1013.coefficient72_245,
  OriginalRow227TriangleData1013.coefficient72_246,
  OriginalRow227TriangleData1013.coefficient72_247,
  OriginalRow227TriangleData1013.coefficient72_248,
  OriginalRow227TriangleData1013.coefficient72_249,
  OriginalRow227TriangleData1013.coefficient72_250,
  OriginalRow227TriangleData1013.coefficient72_251,
  OriginalRow227TriangleData1013.coefficient72_252,
  OriginalRow227TriangleData1013.coefficient72_253,
  OriginalRow227TriangleData1013.coefficient72_254,
  OriginalRow227TriangleData1013.coefficient72_255,
  OriginalRow227TriangleData1013.coefficient72_256,
  OriginalRow227TriangleData1013.coefficient72_257,
  OriginalRow227TriangleData1013.coefficient72_258,
  OriginalRow227TriangleData1013.coefficient72_259,
  OriginalRow227TriangleData1013.coefficient72_260,
  OriginalRow227TriangleData1013.coefficient72_261,
  OriginalRow227TriangleData1013.coefficient72_262
]

theorem values1013_size : values1013.size = 32 := rfl

def block1013 : ℕ → Option IntervalDyadic := segment 231 values1013

theorem block1013_domain : ExactDomain block1013 231 263 := by
  simpa only [values1013_size] using segment_domain 231 values1013

theorem block1013_get (i : Fin 32) :
    block1013 (231 + i.val) = some (values1013[i.val]'(by rw [values1013_size]; exact i.isLt)) := by
  exact segment_get 231 values1013 ⟨i.val, by rw [values1013_size]; exact i.isLt⟩

def values1014 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1014.coefficient72_263,
  OriginalRow227TriangleData1014.coefficient72_264,
  OriginalRow227TriangleData1014.coefficient72_265,
  OriginalRow227TriangleData1014.coefficient72_266,
  OriginalRow227TriangleData1014.coefficient72_267,
  OriginalRow227TriangleData1014.coefficient72_268,
  OriginalRow227TriangleData1014.coefficient72_269,
  OriginalRow227TriangleData1014.coefficient72_270,
  OriginalRow227TriangleData1014.coefficient72_271,
  OriginalRow227TriangleData1014.coefficient72_272,
  OriginalRow227TriangleData1014.coefficient72_273,
  OriginalRow227TriangleData1014.coefficient72_274,
  OriginalRow227TriangleData1014.coefficient72_275,
  OriginalRow227TriangleData1014.coefficient72_276,
  OriginalRow227TriangleData1014.coefficient72_277,
  OriginalRow227TriangleData1014.coefficient72_278,
  OriginalRow227TriangleData1014.coefficient72_279,
  OriginalRow227TriangleData1014.coefficient72_280,
  OriginalRow227TriangleData1014.coefficient72_281,
  OriginalRow227TriangleData1014.coefficient72_282,
  OriginalRow227TriangleData1014.coefficient72_283,
  OriginalRow227TriangleData1014.coefficient72_284,
  OriginalRow227TriangleData1014.coefficient72_285,
  OriginalRow227TriangleData1014.coefficient72_286,
  OriginalRow227TriangleData1014.coefficient72_287,
  OriginalRow227TriangleData1014.coefficient72_288,
  OriginalRow227TriangleData1014.coefficient72_289,
  OriginalRow227TriangleData1014.coefficient72_290,
  OriginalRow227TriangleData1014.coefficient72_291,
  OriginalRow227TriangleData1014.coefficient72_292,
  OriginalRow227TriangleData1014.coefficient72_293,
  OriginalRow227TriangleData1014.coefficient72_294
]

theorem values1014_size : values1014.size = 32 := rfl

def block1014 : ℕ → Option IntervalDyadic := segment 263 values1014

theorem block1014_domain : ExactDomain block1014 263 295 := by
  simpa only [values1014_size] using segment_domain 263 values1014

theorem block1014_get (i : Fin 32) :
    block1014 (263 + i.val) = some (values1014[i.val]'(by rw [values1014_size]; exact i.isLt)) := by
  exact segment_get 263 values1014 ⟨i.val, by rw [values1014_size]; exact i.isLt⟩

def values1015 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1015.coefficient72_295,
  OriginalRow227TriangleData1015.coefficient72_296,
  OriginalRow227TriangleData1015.coefficient72_297,
  OriginalRow227TriangleData1015.coefficient72_298,
  OriginalRow227TriangleData1015.coefficient72_299,
  OriginalRow227TriangleData1015.coefficient72_300,
  OriginalRow227TriangleData1015.coefficient72_301,
  OriginalRow227TriangleData1015.coefficient72_302,
  OriginalRow227TriangleData1015.coefficient72_303,
  OriginalRow227TriangleData1015.coefficient72_304,
  OriginalRow227TriangleData1015.coefficient72_305,
  OriginalRow227TriangleData1015.coefficient72_306,
  OriginalRow227TriangleData1015.coefficient72_307,
  OriginalRow227TriangleData1015.coefficient72_308,
  OriginalRow227TriangleData1015.coefficient72_309,
  OriginalRow227TriangleData1015.coefficient72_310,
  OriginalRow227TriangleData1015.coefficient72_311,
  OriginalRow227TriangleData1015.coefficient72_312,
  OriginalRow227TriangleData1015.coefficient72_313,
  OriginalRow227TriangleData1015.coefficient72_314,
  OriginalRow227TriangleData1015.coefficient72_315,
  OriginalRow227TriangleData1015.coefficient72_316,
  OriginalRow227TriangleData1015.coefficient72_317,
  OriginalRow227TriangleData1015.coefficient72_318,
  OriginalRow227TriangleData1015.coefficient72_319,
  OriginalRow227TriangleData1015.coefficient72_320,
  OriginalRow227TriangleData1015.coefficient72_321,
  OriginalRow227TriangleData1015.coefficient72_322,
  OriginalRow227TriangleData1015.coefficient72_323,
  OriginalRow227TriangleData1015.coefficient72_324,
  OriginalRow227TriangleData1015.coefficient72_325,
  OriginalRow227TriangleData1015.coefficient72_326
]

theorem values1015_size : values1015.size = 32 := rfl

def block1015 : ℕ → Option IntervalDyadic := segment 295 values1015

theorem block1015_domain : ExactDomain block1015 295 327 := by
  simpa only [values1015_size] using segment_domain 295 values1015

theorem block1015_get (i : Fin 32) :
    block1015 (295 + i.val) = some (values1015[i.val]'(by rw [values1015_size]; exact i.isLt)) := by
  exact segment_get 295 values1015 ⟨i.val, by rw [values1015_size]; exact i.isLt⟩

def values1016 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1016.coefficient72_327,
  OriginalRow227TriangleData1016.coefficient72_328,
  OriginalRow227TriangleData1016.coefficient72_329,
  OriginalRow227TriangleData1016.coefficient72_330,
  OriginalRow227TriangleData1016.coefficient72_331,
  OriginalRow227TriangleData1016.coefficient72_332,
  OriginalRow227TriangleData1016.coefficient72_333,
  OriginalRow227TriangleData1016.coefficient72_334,
  OriginalRow227TriangleData1016.coefficient72_335,
  OriginalRow227TriangleData1016.coefficient72_336,
  OriginalRow227TriangleData1016.coefficient72_337,
  OriginalRow227TriangleData1016.coefficient72_338,
  OriginalRow227TriangleData1016.coefficient72_339,
  OriginalRow227TriangleData1016.coefficient72_340,
  OriginalRow227TriangleData1016.coefficient72_341,
  OriginalRow227TriangleData1016.coefficient72_342,
  OriginalRow227TriangleData1016.coefficient72_343,
  OriginalRow227TriangleData1016.coefficient72_344,
  OriginalRow227TriangleData1016.coefficient72_345,
  OriginalRow227TriangleData1016.coefficient72_346,
  OriginalRow227TriangleData1016.coefficient72_347,
  OriginalRow227TriangleData1016.coefficient72_348,
  OriginalRow227TriangleData1016.coefficient72_349,
  OriginalRow227TriangleData1016.coefficient72_350,
  OriginalRow227TriangleData1016.coefficient72_351,
  OriginalRow227TriangleData1016.coefficient72_352,
  OriginalRow227TriangleData1016.coefficient72_353,
  OriginalRow227TriangleData1016.coefficient72_354,
  OriginalRow227TriangleData1016.coefficient72_355,
  OriginalRow227TriangleData1016.coefficient72_356,
  OriginalRow227TriangleData1016.coefficient72_357,
  OriginalRow227TriangleData1016.coefficient72_358
]

theorem values1016_size : values1016.size = 32 := rfl

def block1016 : ℕ → Option IntervalDyadic := segment 327 values1016

theorem block1016_domain : ExactDomain block1016 327 359 := by
  simpa only [values1016_size] using segment_domain 327 values1016

theorem block1016_get (i : Fin 32) :
    block1016 (327 + i.val) = some (values1016[i.val]'(by rw [values1016_size]; exact i.isLt)) := by
  exact segment_get 327 values1016 ⟨i.val, by rw [values1016_size]; exact i.isLt⟩

def values1017 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1017.coefficient72_359,
  OriginalRow227TriangleData1017.coefficient72_360,
  OriginalRow227TriangleData1017.coefficient72_361,
  OriginalRow227TriangleData1017.coefficient72_362,
  OriginalRow227TriangleData1017.coefficient72_363,
  OriginalRow227TriangleData1017.coefficient72_364,
  OriginalRow227TriangleData1017.coefficient72_365,
  OriginalRow227TriangleData1017.coefficient72_366,
  OriginalRow227TriangleData1017.coefficient72_367,
  OriginalRow227TriangleData1017.coefficient72_368,
  OriginalRow227TriangleData1017.coefficient72_369,
  OriginalRow227TriangleData1017.coefficient72_370,
  OriginalRow227TriangleData1017.coefficient72_371,
  OriginalRow227TriangleData1017.coefficient72_372,
  OriginalRow227TriangleData1017.coefficient72_373,
  OriginalRow227TriangleData1017.coefficient72_374,
  OriginalRow227TriangleData1017.coefficient72_375,
  OriginalRow227TriangleData1017.coefficient72_376,
  OriginalRow227TriangleData1017.coefficient72_377,
  OriginalRow227TriangleData1017.coefficient72_378,
  OriginalRow227TriangleData1017.coefficient72_379,
  OriginalRow227TriangleData1017.coefficient72_380,
  OriginalRow227TriangleData1017.coefficient72_381,
  OriginalRow227TriangleData1017.coefficient72_382,
  OriginalRow227TriangleData1017.coefficient72_383,
  OriginalRow227TriangleData1017.coefficient72_384,
  OriginalRow227TriangleData1017.coefficient72_385,
  OriginalRow227TriangleData1017.coefficient72_386,
  OriginalRow227TriangleData1017.coefficient72_387,
  OriginalRow227TriangleData1017.coefficient72_388,
  OriginalRow227TriangleData1017.coefficient72_389,
  OriginalRow227TriangleData1017.coefficient72_390
]

theorem values1017_size : values1017.size = 32 := rfl

def block1017 : ℕ → Option IntervalDyadic := segment 359 values1017

theorem block1017_domain : ExactDomain block1017 359 391 := by
  simpa only [values1017_size] using segment_domain 359 values1017

theorem block1017_get (i : Fin 32) :
    block1017 (359 + i.val) = some (values1017[i.val]'(by rw [values1017_size]; exact i.isLt)) := by
  exact segment_get 359 values1017 ⟨i.val, by rw [values1017_size]; exact i.isLt⟩

def values1018 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1018.coefficient72_391,
  OriginalRow227TriangleData1018.coefficient72_392,
  OriginalRow227TriangleData1018.coefficient72_393,
  OriginalRow227TriangleData1018.coefficient72_394,
  OriginalRow227TriangleData1018.coefficient72_395,
  OriginalRow227TriangleData1018.coefficient72_396,
  OriginalRow227TriangleData1018.coefficient72_397,
  OriginalRow227TriangleData1018.coefficient72_398,
  OriginalRow227TriangleData1018.coefficient72_399,
  OriginalRow227TriangleData1018.coefficient72_400,
  OriginalRow227TriangleData1018.coefficient72_401,
  OriginalRow227TriangleData1018.coefficient72_402,
  OriginalRow227TriangleData1018.coefficient72_403,
  OriginalRow227TriangleData1018.coefficient72_404,
  OriginalRow227TriangleData1018.coefficient72_405,
  OriginalRow227TriangleData1018.coefficient72_406,
  OriginalRow227TriangleData1018.coefficient72_407,
  OriginalRow227TriangleData1018.coefficient72_408,
  OriginalRow227TriangleData1018.coefficient72_409,
  OriginalRow227TriangleData1018.coefficient72_410,
  OriginalRow227TriangleData1018.coefficient72_411,
  OriginalRow227TriangleData1018.coefficient72_412,
  OriginalRow227TriangleData1018.coefficient72_413,
  OriginalRow227TriangleData1018.coefficient72_414,
  OriginalRow227TriangleData1018.coefficient72_415,
  OriginalRow227TriangleData1018.coefficient72_416,
  OriginalRow227TriangleData1018.coefficient72_417,
  OriginalRow227TriangleData1018.coefficient72_418,
  OriginalRow227TriangleData1018.coefficient72_419,
  OriginalRow227TriangleData1018.coefficient72_420,
  OriginalRow227TriangleData1018.coefficient72_421,
  OriginalRow227TriangleData1018.coefficient72_422
]

theorem values1018_size : values1018.size = 32 := rfl

def block1018 : ℕ → Option IntervalDyadic := segment 391 values1018

theorem block1018_domain : ExactDomain block1018 391 423 := by
  simpa only [values1018_size] using segment_domain 391 values1018

theorem block1018_get (i : Fin 32) :
    block1018 (391 + i.val) = some (values1018[i.val]'(by rw [values1018_size]; exact i.isLt)) := by
  exact segment_get 391 values1018 ⟨i.val, by rw [values1018_size]; exact i.isLt⟩

def values1019 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1019.coefficient72_423,
  OriginalRow227TriangleData1019.coefficient72_424,
  OriginalRow227TriangleData1019.coefficient72_425,
  OriginalRow227TriangleData1019.coefficient72_426,
  OriginalRow227TriangleData1019.coefficient72_427,
  OriginalRow227TriangleData1019.coefficient72_428,
  OriginalRow227TriangleData1019.coefficient72_429
]

theorem values1019_size : values1019.size = 7 := rfl

def block1019 : ℕ → Option IntervalDyadic := segment 423 values1019

theorem block1019_domain : ExactDomain block1019 423 430 := by
  simpa only [values1019_size] using segment_domain 423 values1019

theorem block1019_get (i : Fin 7) :
    block1019 (423 + i.val) = some (values1019[i.val]'(by rw [values1019_size]; exact i.isLt)) := by
  exact segment_get 423 values1019 ⟨i.val, by rw [values1019_size]; exact i.isLt⟩

def node0103_0167 : ℕ → Option IntervalDyadic := split 135 block1009 block1010

theorem node0103_0167_domain : ExactDomain node0103_0167 103 167 := by
  exact split_domain (by decide) (by decide) block1009_domain block1010_domain

def node0071_0167 : ℕ → Option IntervalDyadic := split 103 block1008 node0103_0167

theorem node0071_0167_domain : ExactDomain node0071_0167 71 167 := by
  exact split_domain (by decide) (by decide) block1008_domain node0103_0167_domain

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block1012 block1013

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block1012_domain block1013_domain

def node0167_0263 : ℕ → Option IntervalDyadic := split 199 block1011 node0199_0263

theorem node0167_0263_domain : ExactDomain node0167_0263 167 263 := by
  exact split_domain (by decide) (by decide) block1011_domain node0199_0263_domain

def node0071_0263 : ℕ → Option IntervalDyadic := split 167 node0071_0167 node0167_0263

theorem node0071_0263_domain : ExactDomain node0071_0263 71 263 := by
  exact split_domain (by decide) (by decide) node0071_0167_domain node0167_0263_domain

def node0295_0359 : ℕ → Option IntervalDyadic := split 327 block1015 block1016

theorem node0295_0359_domain : ExactDomain node0295_0359 295 359 := by
  exact split_domain (by decide) (by decide) block1015_domain block1016_domain

def node0263_0359 : ℕ → Option IntervalDyadic := split 295 block1014 node0295_0359

theorem node0263_0359_domain : ExactDomain node0263_0359 263 359 := by
  exact split_domain (by decide) (by decide) block1014_domain node0295_0359_domain

def node0391_0430 : ℕ → Option IntervalDyadic := split 423 block1018 block1019

theorem node0391_0430_domain : ExactDomain node0391_0430 391 430 := by
  exact split_domain (by decide) (by decide) block1018_domain block1019_domain

def node0359_0430 : ℕ → Option IntervalDyadic := split 391 block1017 node0391_0430

theorem node0359_0430_domain : ExactDomain node0359_0430 359 430 := by
  exact split_domain (by decide) (by decide) block1017_domain node0391_0430_domain

def node0263_0430 : ℕ → Option IntervalDyadic := split 359 node0263_0359 node0359_0430

theorem node0263_0430_domain : ExactDomain node0263_0430 263 430 := by
  exact split_domain (by decide) (by decide) node0263_0359_domain node0359_0430_domain

def node0071_0430 : ℕ → Option IntervalDyadic := split 263 node0071_0263 node0263_0430

theorem node0071_0430_domain : ExactDomain node0071_0430 71 430 := by
  exact split_domain (by decide) (by decide) node0071_0263_domain node0263_0430_domain

def lookup : ℕ → Option IntervalDyadic := node0071_0430

theorem lookup_domain : ExactDomain lookup 71 430 :=
  node0071_0430_domain

theorem block1008_lookup (i : Fin 32) :
    lookup (71 + i.val) = some (values1008[i.val]'(by rw [values1008_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (71 + i.val) = _
  rw [node0071_0430, split_left 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0071_0263, split_left 167 node0071_0167 node0167_0263 (by omega)]
  rw [node0071_0167, split_left 103 block1008 node0103_0167 (by omega)]
  exact block1008_get i

theorem block1009_lookup (i : Fin 32) :
    lookup (103 + i.val) = some (values1009[i.val]'(by rw [values1009_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (103 + i.val) = _
  rw [node0071_0430, split_left 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0071_0263, split_left 167 node0071_0167 node0167_0263 (by omega)]
  rw [node0071_0167, split_right 103 block1008 node0103_0167 (by omega)]
  rw [node0103_0167, split_left 135 block1009 block1010 (by omega)]
  exact block1009_get i

theorem block1010_lookup (i : Fin 32) :
    lookup (135 + i.val) = some (values1010[i.val]'(by rw [values1010_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (135 + i.val) = _
  rw [node0071_0430, split_left 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0071_0263, split_left 167 node0071_0167 node0167_0263 (by omega)]
  rw [node0071_0167, split_right 103 block1008 node0103_0167 (by omega)]
  rw [node0103_0167, split_right 135 block1009 block1010 (by omega)]
  exact block1010_get i

theorem block1011_lookup (i : Fin 32) :
    lookup (167 + i.val) = some (values1011[i.val]'(by rw [values1011_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (167 + i.val) = _
  rw [node0071_0430, split_left 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0071_0263, split_right 167 node0071_0167 node0167_0263 (by omega)]
  rw [node0167_0263, split_left 199 block1011 node0199_0263 (by omega)]
  exact block1011_get i

theorem block1012_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values1012[i.val]'(by rw [values1012_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (199 + i.val) = _
  rw [node0071_0430, split_left 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0071_0263, split_right 167 node0071_0167 node0167_0263 (by omega)]
  rw [node0167_0263, split_right 199 block1011 node0199_0263 (by omega)]
  rw [node0199_0263, split_left 231 block1012 block1013 (by omega)]
  exact block1012_get i

theorem block1013_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values1013[i.val]'(by rw [values1013_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (231 + i.val) = _
  rw [node0071_0430, split_left 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0071_0263, split_right 167 node0071_0167 node0167_0263 (by omega)]
  rw [node0167_0263, split_right 199 block1011 node0199_0263 (by omega)]
  rw [node0199_0263, split_right 231 block1012 block1013 (by omega)]
  exact block1013_get i

theorem block1014_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values1014[i.val]'(by rw [values1014_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (263 + i.val) = _
  rw [node0071_0430, split_right 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0263_0430, split_left 359 node0263_0359 node0359_0430 (by omega)]
  rw [node0263_0359, split_left 295 block1014 node0295_0359 (by omega)]
  exact block1014_get i

theorem block1015_lookup (i : Fin 32) :
    lookup (295 + i.val) = some (values1015[i.val]'(by rw [values1015_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (295 + i.val) = _
  rw [node0071_0430, split_right 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0263_0430, split_left 359 node0263_0359 node0359_0430 (by omega)]
  rw [node0263_0359, split_right 295 block1014 node0295_0359 (by omega)]
  rw [node0295_0359, split_left 327 block1015 block1016 (by omega)]
  exact block1015_get i

theorem block1016_lookup (i : Fin 32) :
    lookup (327 + i.val) = some (values1016[i.val]'(by rw [values1016_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (327 + i.val) = _
  rw [node0071_0430, split_right 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0263_0430, split_left 359 node0263_0359 node0359_0430 (by omega)]
  rw [node0263_0359, split_right 295 block1014 node0295_0359 (by omega)]
  rw [node0295_0359, split_right 327 block1015 block1016 (by omega)]
  exact block1016_get i

theorem block1017_lookup (i : Fin 32) :
    lookup (359 + i.val) = some (values1017[i.val]'(by rw [values1017_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (359 + i.val) = _
  rw [node0071_0430, split_right 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0263_0430, split_right 359 node0263_0359 node0359_0430 (by omega)]
  rw [node0359_0430, split_left 391 block1017 node0391_0430 (by omega)]
  exact block1017_get i

theorem block1018_lookup (i : Fin 32) :
    lookup (391 + i.val) = some (values1018[i.val]'(by rw [values1018_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (391 + i.val) = _
  rw [node0071_0430, split_right 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0263_0430, split_right 359 node0263_0359 node0359_0430 (by omega)]
  rw [node0359_0430, split_right 391 block1017 node0391_0430 (by omega)]
  rw [node0391_0430, split_left 423 block1018 block1019 (by omega)]
  exact block1018_get i

theorem block1019_lookup (i : Fin 7) :
    lookup (423 + i.val) = some (values1019[i.val]'(by rw [values1019_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0071_0430 (423 + i.val) = _
  rw [node0071_0430, split_right 263 node0071_0263 node0263_0430 (by omega)]
  rw [node0263_0430, split_right 359 node0263_0359 node0359_0430 (by omega)]
  rw [node0359_0430, split_right 391 block1017 node0391_0430 (by omega)]
  rw [node0391_0430, split_right 423 block1018 block1019 (by omega)]
  exact block1019_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1008_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1008_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1009_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1009_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1010_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1010_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1011_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1011_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1012_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1012_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1013_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1013_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1014_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1014_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1015_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1015_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1016_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1016_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1017_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1017_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1018_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1018_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1019_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1019_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1008_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1009_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1010_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1011_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1012_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1013_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1014_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1015_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1016_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1017_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1018_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow072.block1019_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow072
