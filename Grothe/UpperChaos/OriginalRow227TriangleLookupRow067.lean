import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0948
import Grothe.UpperChaos.OriginalRow227TriangleData0949
import Grothe.UpperChaos.OriginalRow227TriangleData0950
import Grothe.UpperChaos.OriginalRow227TriangleData0951
import Grothe.UpperChaos.OriginalRow227TriangleData0952
import Grothe.UpperChaos.OriginalRow227TriangleData0953
import Grothe.UpperChaos.OriginalRow227TriangleData0954
import Grothe.UpperChaos.OriginalRow227TriangleData0955
import Grothe.UpperChaos.OriginalRow227TriangleData0956
import Grothe.UpperChaos.OriginalRow227TriangleData0957
import Grothe.UpperChaos.OriginalRow227TriangleData0958
import Grothe.UpperChaos.OriginalRow227TriangleData0959

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow067

open ConditionalTableLookup

def values0948 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0948.coefficient67_66,
  OriginalRow227TriangleData0948.coefficient67_67,
  OriginalRow227TriangleData0948.coefficient67_68,
  OriginalRow227TriangleData0948.coefficient67_69,
  OriginalRow227TriangleData0948.coefficient67_70,
  OriginalRow227TriangleData0948.coefficient67_71,
  OriginalRow227TriangleData0948.coefficient67_72,
  OriginalRow227TriangleData0948.coefficient67_73,
  OriginalRow227TriangleData0948.coefficient67_74,
  OriginalRow227TriangleData0948.coefficient67_75,
  OriginalRow227TriangleData0948.coefficient67_76,
  OriginalRow227TriangleData0948.coefficient67_77,
  OriginalRow227TriangleData0948.coefficient67_78,
  OriginalRow227TriangleData0948.coefficient67_79,
  OriginalRow227TriangleData0948.coefficient67_80,
  OriginalRow227TriangleData0948.coefficient67_81,
  OriginalRow227TriangleData0948.coefficient67_82,
  OriginalRow227TriangleData0948.coefficient67_83,
  OriginalRow227TriangleData0948.coefficient67_84,
  OriginalRow227TriangleData0948.coefficient67_85,
  OriginalRow227TriangleData0948.coefficient67_86,
  OriginalRow227TriangleData0948.coefficient67_87,
  OriginalRow227TriangleData0948.coefficient67_88,
  OriginalRow227TriangleData0948.coefficient67_89,
  OriginalRow227TriangleData0948.coefficient67_90,
  OriginalRow227TriangleData0948.coefficient67_91,
  OriginalRow227TriangleData0948.coefficient67_92,
  OriginalRow227TriangleData0948.coefficient67_93,
  OriginalRow227TriangleData0948.coefficient67_94,
  OriginalRow227TriangleData0948.coefficient67_95,
  OriginalRow227TriangleData0948.coefficient67_96,
  OriginalRow227TriangleData0948.coefficient67_97
]

theorem values0948_size : values0948.size = 32 := rfl

def block0948 : ℕ → Option IntervalDyadic := segment 66 values0948

theorem block0948_domain : ExactDomain block0948 66 98 := by
  simpa only [values0948_size] using segment_domain 66 values0948

theorem block0948_get (i : Fin 32) :
    block0948 (66 + i.val) = some (values0948[i.val]'(by rw [values0948_size]; exact i.isLt)) := by
  exact segment_get 66 values0948 ⟨i.val, by rw [values0948_size]; exact i.isLt⟩

def values0949 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0949.coefficient67_98,
  OriginalRow227TriangleData0949.coefficient67_99,
  OriginalRow227TriangleData0949.coefficient67_100,
  OriginalRow227TriangleData0949.coefficient67_101,
  OriginalRow227TriangleData0949.coefficient67_102,
  OriginalRow227TriangleData0949.coefficient67_103,
  OriginalRow227TriangleData0949.coefficient67_104,
  OriginalRow227TriangleData0949.coefficient67_105,
  OriginalRow227TriangleData0949.coefficient67_106,
  OriginalRow227TriangleData0949.coefficient67_107,
  OriginalRow227TriangleData0949.coefficient67_108,
  OriginalRow227TriangleData0949.coefficient67_109,
  OriginalRow227TriangleData0949.coefficient67_110,
  OriginalRow227TriangleData0949.coefficient67_111,
  OriginalRow227TriangleData0949.coefficient67_112,
  OriginalRow227TriangleData0949.coefficient67_113,
  OriginalRow227TriangleData0949.coefficient67_114,
  OriginalRow227TriangleData0949.coefficient67_115,
  OriginalRow227TriangleData0949.coefficient67_116,
  OriginalRow227TriangleData0949.coefficient67_117,
  OriginalRow227TriangleData0949.coefficient67_118,
  OriginalRow227TriangleData0949.coefficient67_119,
  OriginalRow227TriangleData0949.coefficient67_120,
  OriginalRow227TriangleData0949.coefficient67_121,
  OriginalRow227TriangleData0949.coefficient67_122,
  OriginalRow227TriangleData0949.coefficient67_123,
  OriginalRow227TriangleData0949.coefficient67_124,
  OriginalRow227TriangleData0949.coefficient67_125,
  OriginalRow227TriangleData0949.coefficient67_126,
  OriginalRow227TriangleData0949.coefficient67_127,
  OriginalRow227TriangleData0949.coefficient67_128,
  OriginalRow227TriangleData0949.coefficient67_129
]

theorem values0949_size : values0949.size = 32 := rfl

def block0949 : ℕ → Option IntervalDyadic := segment 98 values0949

theorem block0949_domain : ExactDomain block0949 98 130 := by
  simpa only [values0949_size] using segment_domain 98 values0949

theorem block0949_get (i : Fin 32) :
    block0949 (98 + i.val) = some (values0949[i.val]'(by rw [values0949_size]; exact i.isLt)) := by
  exact segment_get 98 values0949 ⟨i.val, by rw [values0949_size]; exact i.isLt⟩

def values0950 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0950.coefficient67_130,
  OriginalRow227TriangleData0950.coefficient67_131,
  OriginalRow227TriangleData0950.coefficient67_132,
  OriginalRow227TriangleData0950.coefficient67_133,
  OriginalRow227TriangleData0950.coefficient67_134,
  OriginalRow227TriangleData0950.coefficient67_135,
  OriginalRow227TriangleData0950.coefficient67_136,
  OriginalRow227TriangleData0950.coefficient67_137,
  OriginalRow227TriangleData0950.coefficient67_138,
  OriginalRow227TriangleData0950.coefficient67_139,
  OriginalRow227TriangleData0950.coefficient67_140,
  OriginalRow227TriangleData0950.coefficient67_141,
  OriginalRow227TriangleData0950.coefficient67_142,
  OriginalRow227TriangleData0950.coefficient67_143,
  OriginalRow227TriangleData0950.coefficient67_144,
  OriginalRow227TriangleData0950.coefficient67_145,
  OriginalRow227TriangleData0950.coefficient67_146,
  OriginalRow227TriangleData0950.coefficient67_147,
  OriginalRow227TriangleData0950.coefficient67_148,
  OriginalRow227TriangleData0950.coefficient67_149,
  OriginalRow227TriangleData0950.coefficient67_150,
  OriginalRow227TriangleData0950.coefficient67_151,
  OriginalRow227TriangleData0950.coefficient67_152,
  OriginalRow227TriangleData0950.coefficient67_153,
  OriginalRow227TriangleData0950.coefficient67_154,
  OriginalRow227TriangleData0950.coefficient67_155,
  OriginalRow227TriangleData0950.coefficient67_156,
  OriginalRow227TriangleData0950.coefficient67_157,
  OriginalRow227TriangleData0950.coefficient67_158,
  OriginalRow227TriangleData0950.coefficient67_159,
  OriginalRow227TriangleData0950.coefficient67_160,
  OriginalRow227TriangleData0950.coefficient67_161
]

theorem values0950_size : values0950.size = 32 := rfl

def block0950 : ℕ → Option IntervalDyadic := segment 130 values0950

theorem block0950_domain : ExactDomain block0950 130 162 := by
  simpa only [values0950_size] using segment_domain 130 values0950

theorem block0950_get (i : Fin 32) :
    block0950 (130 + i.val) = some (values0950[i.val]'(by rw [values0950_size]; exact i.isLt)) := by
  exact segment_get 130 values0950 ⟨i.val, by rw [values0950_size]; exact i.isLt⟩

def values0951 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0951.coefficient67_162,
  OriginalRow227TriangleData0951.coefficient67_163,
  OriginalRow227TriangleData0951.coefficient67_164,
  OriginalRow227TriangleData0951.coefficient67_165,
  OriginalRow227TriangleData0951.coefficient67_166,
  OriginalRow227TriangleData0951.coefficient67_167,
  OriginalRow227TriangleData0951.coefficient67_168,
  OriginalRow227TriangleData0951.coefficient67_169,
  OriginalRow227TriangleData0951.coefficient67_170,
  OriginalRow227TriangleData0951.coefficient67_171,
  OriginalRow227TriangleData0951.coefficient67_172,
  OriginalRow227TriangleData0951.coefficient67_173,
  OriginalRow227TriangleData0951.coefficient67_174,
  OriginalRow227TriangleData0951.coefficient67_175,
  OriginalRow227TriangleData0951.coefficient67_176,
  OriginalRow227TriangleData0951.coefficient67_177,
  OriginalRow227TriangleData0951.coefficient67_178,
  OriginalRow227TriangleData0951.coefficient67_179,
  OriginalRow227TriangleData0951.coefficient67_180,
  OriginalRow227TriangleData0951.coefficient67_181,
  OriginalRow227TriangleData0951.coefficient67_182,
  OriginalRow227TriangleData0951.coefficient67_183,
  OriginalRow227TriangleData0951.coefficient67_184,
  OriginalRow227TriangleData0951.coefficient67_185,
  OriginalRow227TriangleData0951.coefficient67_186,
  OriginalRow227TriangleData0951.coefficient67_187,
  OriginalRow227TriangleData0951.coefficient67_188,
  OriginalRow227TriangleData0951.coefficient67_189,
  OriginalRow227TriangleData0951.coefficient67_190,
  OriginalRow227TriangleData0951.coefficient67_191,
  OriginalRow227TriangleData0951.coefficient67_192,
  OriginalRow227TriangleData0951.coefficient67_193
]

theorem values0951_size : values0951.size = 32 := rfl

def block0951 : ℕ → Option IntervalDyadic := segment 162 values0951

theorem block0951_domain : ExactDomain block0951 162 194 := by
  simpa only [values0951_size] using segment_domain 162 values0951

theorem block0951_get (i : Fin 32) :
    block0951 (162 + i.val) = some (values0951[i.val]'(by rw [values0951_size]; exact i.isLt)) := by
  exact segment_get 162 values0951 ⟨i.val, by rw [values0951_size]; exact i.isLt⟩

def values0952 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0952.coefficient67_194,
  OriginalRow227TriangleData0952.coefficient67_195,
  OriginalRow227TriangleData0952.coefficient67_196,
  OriginalRow227TriangleData0952.coefficient67_197,
  OriginalRow227TriangleData0952.coefficient67_198,
  OriginalRow227TriangleData0952.coefficient67_199,
  OriginalRow227TriangleData0952.coefficient67_200,
  OriginalRow227TriangleData0952.coefficient67_201,
  OriginalRow227TriangleData0952.coefficient67_202,
  OriginalRow227TriangleData0952.coefficient67_203,
  OriginalRow227TriangleData0952.coefficient67_204,
  OriginalRow227TriangleData0952.coefficient67_205,
  OriginalRow227TriangleData0952.coefficient67_206,
  OriginalRow227TriangleData0952.coefficient67_207,
  OriginalRow227TriangleData0952.coefficient67_208,
  OriginalRow227TriangleData0952.coefficient67_209,
  OriginalRow227TriangleData0952.coefficient67_210,
  OriginalRow227TriangleData0952.coefficient67_211,
  OriginalRow227TriangleData0952.coefficient67_212,
  OriginalRow227TriangleData0952.coefficient67_213,
  OriginalRow227TriangleData0952.coefficient67_214,
  OriginalRow227TriangleData0952.coefficient67_215,
  OriginalRow227TriangleData0952.coefficient67_216,
  OriginalRow227TriangleData0952.coefficient67_217,
  OriginalRow227TriangleData0952.coefficient67_218,
  OriginalRow227TriangleData0952.coefficient67_219,
  OriginalRow227TriangleData0952.coefficient67_220,
  OriginalRow227TriangleData0952.coefficient67_221,
  OriginalRow227TriangleData0952.coefficient67_222,
  OriginalRow227TriangleData0952.coefficient67_223,
  OriginalRow227TriangleData0952.coefficient67_224,
  OriginalRow227TriangleData0952.coefficient67_225
]

theorem values0952_size : values0952.size = 32 := rfl

def block0952 : ℕ → Option IntervalDyadic := segment 194 values0952

theorem block0952_domain : ExactDomain block0952 194 226 := by
  simpa only [values0952_size] using segment_domain 194 values0952

theorem block0952_get (i : Fin 32) :
    block0952 (194 + i.val) = some (values0952[i.val]'(by rw [values0952_size]; exact i.isLt)) := by
  exact segment_get 194 values0952 ⟨i.val, by rw [values0952_size]; exact i.isLt⟩

def values0953 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0953.coefficient67_226,
  OriginalRow227TriangleData0953.coefficient67_227,
  OriginalRow227TriangleData0953.coefficient67_228,
  OriginalRow227TriangleData0953.coefficient67_229,
  OriginalRow227TriangleData0953.coefficient67_230,
  OriginalRow227TriangleData0953.coefficient67_231,
  OriginalRow227TriangleData0953.coefficient67_232,
  OriginalRow227TriangleData0953.coefficient67_233,
  OriginalRow227TriangleData0953.coefficient67_234,
  OriginalRow227TriangleData0953.coefficient67_235,
  OriginalRow227TriangleData0953.coefficient67_236,
  OriginalRow227TriangleData0953.coefficient67_237,
  OriginalRow227TriangleData0953.coefficient67_238,
  OriginalRow227TriangleData0953.coefficient67_239,
  OriginalRow227TriangleData0953.coefficient67_240,
  OriginalRow227TriangleData0953.coefficient67_241,
  OriginalRow227TriangleData0953.coefficient67_242,
  OriginalRow227TriangleData0953.coefficient67_243,
  OriginalRow227TriangleData0953.coefficient67_244,
  OriginalRow227TriangleData0953.coefficient67_245,
  OriginalRow227TriangleData0953.coefficient67_246,
  OriginalRow227TriangleData0953.coefficient67_247,
  OriginalRow227TriangleData0953.coefficient67_248,
  OriginalRow227TriangleData0953.coefficient67_249,
  OriginalRow227TriangleData0953.coefficient67_250,
  OriginalRow227TriangleData0953.coefficient67_251,
  OriginalRow227TriangleData0953.coefficient67_252,
  OriginalRow227TriangleData0953.coefficient67_253,
  OriginalRow227TriangleData0953.coefficient67_254,
  OriginalRow227TriangleData0953.coefficient67_255,
  OriginalRow227TriangleData0953.coefficient67_256,
  OriginalRow227TriangleData0953.coefficient67_257
]

theorem values0953_size : values0953.size = 32 := rfl

def block0953 : ℕ → Option IntervalDyadic := segment 226 values0953

theorem block0953_domain : ExactDomain block0953 226 258 := by
  simpa only [values0953_size] using segment_domain 226 values0953

theorem block0953_get (i : Fin 32) :
    block0953 (226 + i.val) = some (values0953[i.val]'(by rw [values0953_size]; exact i.isLt)) := by
  exact segment_get 226 values0953 ⟨i.val, by rw [values0953_size]; exact i.isLt⟩

def values0954 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0954.coefficient67_258,
  OriginalRow227TriangleData0954.coefficient67_259,
  OriginalRow227TriangleData0954.coefficient67_260,
  OriginalRow227TriangleData0954.coefficient67_261,
  OriginalRow227TriangleData0954.coefficient67_262,
  OriginalRow227TriangleData0954.coefficient67_263,
  OriginalRow227TriangleData0954.coefficient67_264,
  OriginalRow227TriangleData0954.coefficient67_265,
  OriginalRow227TriangleData0954.coefficient67_266,
  OriginalRow227TriangleData0954.coefficient67_267,
  OriginalRow227TriangleData0954.coefficient67_268,
  OriginalRow227TriangleData0954.coefficient67_269,
  OriginalRow227TriangleData0954.coefficient67_270,
  OriginalRow227TriangleData0954.coefficient67_271,
  OriginalRow227TriangleData0954.coefficient67_272,
  OriginalRow227TriangleData0954.coefficient67_273,
  OriginalRow227TriangleData0954.coefficient67_274,
  OriginalRow227TriangleData0954.coefficient67_275,
  OriginalRow227TriangleData0954.coefficient67_276,
  OriginalRow227TriangleData0954.coefficient67_277,
  OriginalRow227TriangleData0954.coefficient67_278,
  OriginalRow227TriangleData0954.coefficient67_279,
  OriginalRow227TriangleData0954.coefficient67_280,
  OriginalRow227TriangleData0954.coefficient67_281,
  OriginalRow227TriangleData0954.coefficient67_282,
  OriginalRow227TriangleData0954.coefficient67_283,
  OriginalRow227TriangleData0954.coefficient67_284,
  OriginalRow227TriangleData0954.coefficient67_285,
  OriginalRow227TriangleData0954.coefficient67_286,
  OriginalRow227TriangleData0954.coefficient67_287,
  OriginalRow227TriangleData0954.coefficient67_288,
  OriginalRow227TriangleData0954.coefficient67_289
]

theorem values0954_size : values0954.size = 32 := rfl

def block0954 : ℕ → Option IntervalDyadic := segment 258 values0954

theorem block0954_domain : ExactDomain block0954 258 290 := by
  simpa only [values0954_size] using segment_domain 258 values0954

theorem block0954_get (i : Fin 32) :
    block0954 (258 + i.val) = some (values0954[i.val]'(by rw [values0954_size]; exact i.isLt)) := by
  exact segment_get 258 values0954 ⟨i.val, by rw [values0954_size]; exact i.isLt⟩

def values0955 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0955.coefficient67_290,
  OriginalRow227TriangleData0955.coefficient67_291,
  OriginalRow227TriangleData0955.coefficient67_292,
  OriginalRow227TriangleData0955.coefficient67_293,
  OriginalRow227TriangleData0955.coefficient67_294,
  OriginalRow227TriangleData0955.coefficient67_295,
  OriginalRow227TriangleData0955.coefficient67_296,
  OriginalRow227TriangleData0955.coefficient67_297,
  OriginalRow227TriangleData0955.coefficient67_298,
  OriginalRow227TriangleData0955.coefficient67_299,
  OriginalRow227TriangleData0955.coefficient67_300,
  OriginalRow227TriangleData0955.coefficient67_301,
  OriginalRow227TriangleData0955.coefficient67_302,
  OriginalRow227TriangleData0955.coefficient67_303,
  OriginalRow227TriangleData0955.coefficient67_304,
  OriginalRow227TriangleData0955.coefficient67_305,
  OriginalRow227TriangleData0955.coefficient67_306,
  OriginalRow227TriangleData0955.coefficient67_307,
  OriginalRow227TriangleData0955.coefficient67_308,
  OriginalRow227TriangleData0955.coefficient67_309,
  OriginalRow227TriangleData0955.coefficient67_310,
  OriginalRow227TriangleData0955.coefficient67_311,
  OriginalRow227TriangleData0955.coefficient67_312,
  OriginalRow227TriangleData0955.coefficient67_313,
  OriginalRow227TriangleData0955.coefficient67_314,
  OriginalRow227TriangleData0955.coefficient67_315,
  OriginalRow227TriangleData0955.coefficient67_316,
  OriginalRow227TriangleData0955.coefficient67_317,
  OriginalRow227TriangleData0955.coefficient67_318,
  OriginalRow227TriangleData0955.coefficient67_319,
  OriginalRow227TriangleData0955.coefficient67_320,
  OriginalRow227TriangleData0955.coefficient67_321
]

theorem values0955_size : values0955.size = 32 := rfl

def block0955 : ℕ → Option IntervalDyadic := segment 290 values0955

theorem block0955_domain : ExactDomain block0955 290 322 := by
  simpa only [values0955_size] using segment_domain 290 values0955

theorem block0955_get (i : Fin 32) :
    block0955 (290 + i.val) = some (values0955[i.val]'(by rw [values0955_size]; exact i.isLt)) := by
  exact segment_get 290 values0955 ⟨i.val, by rw [values0955_size]; exact i.isLt⟩

def values0956 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0956.coefficient67_322,
  OriginalRow227TriangleData0956.coefficient67_323,
  OriginalRow227TriangleData0956.coefficient67_324,
  OriginalRow227TriangleData0956.coefficient67_325,
  OriginalRow227TriangleData0956.coefficient67_326,
  OriginalRow227TriangleData0956.coefficient67_327,
  OriginalRow227TriangleData0956.coefficient67_328,
  OriginalRow227TriangleData0956.coefficient67_329,
  OriginalRow227TriangleData0956.coefficient67_330,
  OriginalRow227TriangleData0956.coefficient67_331,
  OriginalRow227TriangleData0956.coefficient67_332,
  OriginalRow227TriangleData0956.coefficient67_333,
  OriginalRow227TriangleData0956.coefficient67_334,
  OriginalRow227TriangleData0956.coefficient67_335,
  OriginalRow227TriangleData0956.coefficient67_336,
  OriginalRow227TriangleData0956.coefficient67_337,
  OriginalRow227TriangleData0956.coefficient67_338,
  OriginalRow227TriangleData0956.coefficient67_339,
  OriginalRow227TriangleData0956.coefficient67_340,
  OriginalRow227TriangleData0956.coefficient67_341,
  OriginalRow227TriangleData0956.coefficient67_342,
  OriginalRow227TriangleData0956.coefficient67_343,
  OriginalRow227TriangleData0956.coefficient67_344,
  OriginalRow227TriangleData0956.coefficient67_345,
  OriginalRow227TriangleData0956.coefficient67_346,
  OriginalRow227TriangleData0956.coefficient67_347,
  OriginalRow227TriangleData0956.coefficient67_348,
  OriginalRow227TriangleData0956.coefficient67_349,
  OriginalRow227TriangleData0956.coefficient67_350,
  OriginalRow227TriangleData0956.coefficient67_351,
  OriginalRow227TriangleData0956.coefficient67_352,
  OriginalRow227TriangleData0956.coefficient67_353
]

theorem values0956_size : values0956.size = 32 := rfl

def block0956 : ℕ → Option IntervalDyadic := segment 322 values0956

theorem block0956_domain : ExactDomain block0956 322 354 := by
  simpa only [values0956_size] using segment_domain 322 values0956

theorem block0956_get (i : Fin 32) :
    block0956 (322 + i.val) = some (values0956[i.val]'(by rw [values0956_size]; exact i.isLt)) := by
  exact segment_get 322 values0956 ⟨i.val, by rw [values0956_size]; exact i.isLt⟩

def values0957 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0957.coefficient67_354,
  OriginalRow227TriangleData0957.coefficient67_355,
  OriginalRow227TriangleData0957.coefficient67_356,
  OriginalRow227TriangleData0957.coefficient67_357,
  OriginalRow227TriangleData0957.coefficient67_358,
  OriginalRow227TriangleData0957.coefficient67_359,
  OriginalRow227TriangleData0957.coefficient67_360,
  OriginalRow227TriangleData0957.coefficient67_361,
  OriginalRow227TriangleData0957.coefficient67_362,
  OriginalRow227TriangleData0957.coefficient67_363,
  OriginalRow227TriangleData0957.coefficient67_364,
  OriginalRow227TriangleData0957.coefficient67_365,
  OriginalRow227TriangleData0957.coefficient67_366,
  OriginalRow227TriangleData0957.coefficient67_367,
  OriginalRow227TriangleData0957.coefficient67_368,
  OriginalRow227TriangleData0957.coefficient67_369,
  OriginalRow227TriangleData0957.coefficient67_370,
  OriginalRow227TriangleData0957.coefficient67_371,
  OriginalRow227TriangleData0957.coefficient67_372,
  OriginalRow227TriangleData0957.coefficient67_373,
  OriginalRow227TriangleData0957.coefficient67_374,
  OriginalRow227TriangleData0957.coefficient67_375,
  OriginalRow227TriangleData0957.coefficient67_376,
  OriginalRow227TriangleData0957.coefficient67_377,
  OriginalRow227TriangleData0957.coefficient67_378,
  OriginalRow227TriangleData0957.coefficient67_379,
  OriginalRow227TriangleData0957.coefficient67_380,
  OriginalRow227TriangleData0957.coefficient67_381,
  OriginalRow227TriangleData0957.coefficient67_382,
  OriginalRow227TriangleData0957.coefficient67_383,
  OriginalRow227TriangleData0957.coefficient67_384,
  OriginalRow227TriangleData0957.coefficient67_385
]

theorem values0957_size : values0957.size = 32 := rfl

def block0957 : ℕ → Option IntervalDyadic := segment 354 values0957

theorem block0957_domain : ExactDomain block0957 354 386 := by
  simpa only [values0957_size] using segment_domain 354 values0957

theorem block0957_get (i : Fin 32) :
    block0957 (354 + i.val) = some (values0957[i.val]'(by rw [values0957_size]; exact i.isLt)) := by
  exact segment_get 354 values0957 ⟨i.val, by rw [values0957_size]; exact i.isLt⟩

def values0958 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0958.coefficient67_386,
  OriginalRow227TriangleData0958.coefficient67_387,
  OriginalRow227TriangleData0958.coefficient67_388,
  OriginalRow227TriangleData0958.coefficient67_389,
  OriginalRow227TriangleData0958.coefficient67_390,
  OriginalRow227TriangleData0958.coefficient67_391,
  OriginalRow227TriangleData0958.coefficient67_392,
  OriginalRow227TriangleData0958.coefficient67_393,
  OriginalRow227TriangleData0958.coefficient67_394,
  OriginalRow227TriangleData0958.coefficient67_395,
  OriginalRow227TriangleData0958.coefficient67_396,
  OriginalRow227TriangleData0958.coefficient67_397,
  OriginalRow227TriangleData0958.coefficient67_398,
  OriginalRow227TriangleData0958.coefficient67_399,
  OriginalRow227TriangleData0958.coefficient67_400,
  OriginalRow227TriangleData0958.coefficient67_401,
  OriginalRow227TriangleData0958.coefficient67_402,
  OriginalRow227TriangleData0958.coefficient67_403,
  OriginalRow227TriangleData0958.coefficient67_404,
  OriginalRow227TriangleData0958.coefficient67_405,
  OriginalRow227TriangleData0958.coefficient67_406,
  OriginalRow227TriangleData0958.coefficient67_407,
  OriginalRow227TriangleData0958.coefficient67_408,
  OriginalRow227TriangleData0958.coefficient67_409,
  OriginalRow227TriangleData0958.coefficient67_410,
  OriginalRow227TriangleData0958.coefficient67_411,
  OriginalRow227TriangleData0958.coefficient67_412,
  OriginalRow227TriangleData0958.coefficient67_413,
  OriginalRow227TriangleData0958.coefficient67_414,
  OriginalRow227TriangleData0958.coefficient67_415,
  OriginalRow227TriangleData0958.coefficient67_416,
  OriginalRow227TriangleData0958.coefficient67_417
]

theorem values0958_size : values0958.size = 32 := rfl

def block0958 : ℕ → Option IntervalDyadic := segment 386 values0958

theorem block0958_domain : ExactDomain block0958 386 418 := by
  simpa only [values0958_size] using segment_domain 386 values0958

theorem block0958_get (i : Fin 32) :
    block0958 (386 + i.val) = some (values0958[i.val]'(by rw [values0958_size]; exact i.isLt)) := by
  exact segment_get 386 values0958 ⟨i.val, by rw [values0958_size]; exact i.isLt⟩

def values0959 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0959.coefficient67_418,
  OriginalRow227TriangleData0959.coefficient67_419,
  OriginalRow227TriangleData0959.coefficient67_420,
  OriginalRow227TriangleData0959.coefficient67_421,
  OriginalRow227TriangleData0959.coefficient67_422,
  OriginalRow227TriangleData0959.coefficient67_423,
  OriginalRow227TriangleData0959.coefficient67_424,
  OriginalRow227TriangleData0959.coefficient67_425,
  OriginalRow227TriangleData0959.coefficient67_426,
  OriginalRow227TriangleData0959.coefficient67_427,
  OriginalRow227TriangleData0959.coefficient67_428,
  OriginalRow227TriangleData0959.coefficient67_429,
  OriginalRow227TriangleData0959.coefficient67_430,
  OriginalRow227TriangleData0959.coefficient67_431,
  OriginalRow227TriangleData0959.coefficient67_432,
  OriginalRow227TriangleData0959.coefficient67_433,
  OriginalRow227TriangleData0959.coefficient67_434
]

theorem values0959_size : values0959.size = 17 := rfl

def block0959 : ℕ → Option IntervalDyadic := segment 418 values0959

theorem block0959_domain : ExactDomain block0959 418 435 := by
  simpa only [values0959_size] using segment_domain 418 values0959

theorem block0959_get (i : Fin 17) :
    block0959 (418 + i.val) = some (values0959[i.val]'(by rw [values0959_size]; exact i.isLt)) := by
  exact segment_get 418 values0959 ⟨i.val, by rw [values0959_size]; exact i.isLt⟩

def node0098_0162 : ℕ → Option IntervalDyadic := split 130 block0949 block0950

theorem node0098_0162_domain : ExactDomain node0098_0162 98 162 := by
  exact split_domain (by decide) (by decide) block0949_domain block0950_domain

def node0066_0162 : ℕ → Option IntervalDyadic := split 98 block0948 node0098_0162

theorem node0066_0162_domain : ExactDomain node0066_0162 66 162 := by
  exact split_domain (by decide) (by decide) block0948_domain node0098_0162_domain

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block0952 block0953

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block0952_domain block0953_domain

def node0162_0258 : ℕ → Option IntervalDyadic := split 194 block0951 node0194_0258

theorem node0162_0258_domain : ExactDomain node0162_0258 162 258 := by
  exact split_domain (by decide) (by decide) block0951_domain node0194_0258_domain

def node0066_0258 : ℕ → Option IntervalDyadic := split 162 node0066_0162 node0162_0258

theorem node0066_0258_domain : ExactDomain node0066_0258 66 258 := by
  exact split_domain (by decide) (by decide) node0066_0162_domain node0162_0258_domain

def node0290_0354 : ℕ → Option IntervalDyadic := split 322 block0955 block0956

theorem node0290_0354_domain : ExactDomain node0290_0354 290 354 := by
  exact split_domain (by decide) (by decide) block0955_domain block0956_domain

def node0258_0354 : ℕ → Option IntervalDyadic := split 290 block0954 node0290_0354

theorem node0258_0354_domain : ExactDomain node0258_0354 258 354 := by
  exact split_domain (by decide) (by decide) block0954_domain node0290_0354_domain

def node0386_0435 : ℕ → Option IntervalDyadic := split 418 block0958 block0959

theorem node0386_0435_domain : ExactDomain node0386_0435 386 435 := by
  exact split_domain (by decide) (by decide) block0958_domain block0959_domain

def node0354_0435 : ℕ → Option IntervalDyadic := split 386 block0957 node0386_0435

theorem node0354_0435_domain : ExactDomain node0354_0435 354 435 := by
  exact split_domain (by decide) (by decide) block0957_domain node0386_0435_domain

def node0258_0435 : ℕ → Option IntervalDyadic := split 354 node0258_0354 node0354_0435

theorem node0258_0435_domain : ExactDomain node0258_0435 258 435 := by
  exact split_domain (by decide) (by decide) node0258_0354_domain node0354_0435_domain

def node0066_0435 : ℕ → Option IntervalDyadic := split 258 node0066_0258 node0258_0435

theorem node0066_0435_domain : ExactDomain node0066_0435 66 435 := by
  exact split_domain (by decide) (by decide) node0066_0258_domain node0258_0435_domain

def lookup : ℕ → Option IntervalDyadic := node0066_0435

theorem lookup_domain : ExactDomain lookup 66 435 :=
  node0066_0435_domain

theorem block0948_lookup (i : Fin 32) :
    lookup (66 + i.val) = some (values0948[i.val]'(by rw [values0948_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (66 + i.val) = _
  rw [node0066_0435, split_left 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0066_0258, split_left 162 node0066_0162 node0162_0258 (by omega)]
  rw [node0066_0162, split_left 98 block0948 node0098_0162 (by omega)]
  exact block0948_get i

theorem block0949_lookup (i : Fin 32) :
    lookup (98 + i.val) = some (values0949[i.val]'(by rw [values0949_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (98 + i.val) = _
  rw [node0066_0435, split_left 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0066_0258, split_left 162 node0066_0162 node0162_0258 (by omega)]
  rw [node0066_0162, split_right 98 block0948 node0098_0162 (by omega)]
  rw [node0098_0162, split_left 130 block0949 block0950 (by omega)]
  exact block0949_get i

theorem block0950_lookup (i : Fin 32) :
    lookup (130 + i.val) = some (values0950[i.val]'(by rw [values0950_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (130 + i.val) = _
  rw [node0066_0435, split_left 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0066_0258, split_left 162 node0066_0162 node0162_0258 (by omega)]
  rw [node0066_0162, split_right 98 block0948 node0098_0162 (by omega)]
  rw [node0098_0162, split_right 130 block0949 block0950 (by omega)]
  exact block0950_get i

theorem block0951_lookup (i : Fin 32) :
    lookup (162 + i.val) = some (values0951[i.val]'(by rw [values0951_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (162 + i.val) = _
  rw [node0066_0435, split_left 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0066_0258, split_right 162 node0066_0162 node0162_0258 (by omega)]
  rw [node0162_0258, split_left 194 block0951 node0194_0258 (by omega)]
  exact block0951_get i

theorem block0952_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values0952[i.val]'(by rw [values0952_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (194 + i.val) = _
  rw [node0066_0435, split_left 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0066_0258, split_right 162 node0066_0162 node0162_0258 (by omega)]
  rw [node0162_0258, split_right 194 block0951 node0194_0258 (by omega)]
  rw [node0194_0258, split_left 226 block0952 block0953 (by omega)]
  exact block0952_get i

theorem block0953_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values0953[i.val]'(by rw [values0953_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (226 + i.val) = _
  rw [node0066_0435, split_left 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0066_0258, split_right 162 node0066_0162 node0162_0258 (by omega)]
  rw [node0162_0258, split_right 194 block0951 node0194_0258 (by omega)]
  rw [node0194_0258, split_right 226 block0952 block0953 (by omega)]
  exact block0953_get i

theorem block0954_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values0954[i.val]'(by rw [values0954_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (258 + i.val) = _
  rw [node0066_0435, split_right 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0258_0435, split_left 354 node0258_0354 node0354_0435 (by omega)]
  rw [node0258_0354, split_left 290 block0954 node0290_0354 (by omega)]
  exact block0954_get i

theorem block0955_lookup (i : Fin 32) :
    lookup (290 + i.val) = some (values0955[i.val]'(by rw [values0955_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (290 + i.val) = _
  rw [node0066_0435, split_right 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0258_0435, split_left 354 node0258_0354 node0354_0435 (by omega)]
  rw [node0258_0354, split_right 290 block0954 node0290_0354 (by omega)]
  rw [node0290_0354, split_left 322 block0955 block0956 (by omega)]
  exact block0955_get i

theorem block0956_lookup (i : Fin 32) :
    lookup (322 + i.val) = some (values0956[i.val]'(by rw [values0956_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (322 + i.val) = _
  rw [node0066_0435, split_right 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0258_0435, split_left 354 node0258_0354 node0354_0435 (by omega)]
  rw [node0258_0354, split_right 290 block0954 node0290_0354 (by omega)]
  rw [node0290_0354, split_right 322 block0955 block0956 (by omega)]
  exact block0956_get i

theorem block0957_lookup (i : Fin 32) :
    lookup (354 + i.val) = some (values0957[i.val]'(by rw [values0957_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (354 + i.val) = _
  rw [node0066_0435, split_right 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0258_0435, split_right 354 node0258_0354 node0354_0435 (by omega)]
  rw [node0354_0435, split_left 386 block0957 node0386_0435 (by omega)]
  exact block0957_get i

theorem block0958_lookup (i : Fin 32) :
    lookup (386 + i.val) = some (values0958[i.val]'(by rw [values0958_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (386 + i.val) = _
  rw [node0066_0435, split_right 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0258_0435, split_right 354 node0258_0354 node0354_0435 (by omega)]
  rw [node0354_0435, split_right 386 block0957 node0386_0435 (by omega)]
  rw [node0386_0435, split_left 418 block0958 block0959 (by omega)]
  exact block0958_get i

theorem block0959_lookup (i : Fin 17) :
    lookup (418 + i.val) = some (values0959[i.val]'(by rw [values0959_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0066_0435 (418 + i.val) = _
  rw [node0066_0435, split_right 258 node0066_0258 node0258_0435 (by omega)]
  rw [node0258_0435, split_right 354 node0258_0354 node0354_0435 (by omega)]
  rw [node0354_0435, split_right 386 block0957 node0386_0435 (by omega)]
  rw [node0386_0435, split_right 418 block0958 block0959 (by omega)]
  exact block0959_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0948_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0948_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0949_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0949_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0950_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0950_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0951_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0951_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0952_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0952_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0953_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0953_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0954_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0954_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0955_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0955_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0956_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0956_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0957_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0957_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0958_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0958_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0959_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0959_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0948_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0949_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0950_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0951_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0952_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0953_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0954_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0955_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0956_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0957_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0958_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow067.block0959_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow067
