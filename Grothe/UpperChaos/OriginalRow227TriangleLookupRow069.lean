import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0972
import Grothe.UpperChaos.OriginalRow227TriangleData0973
import Grothe.UpperChaos.OriginalRow227TriangleData0974
import Grothe.UpperChaos.OriginalRow227TriangleData0975
import Grothe.UpperChaos.OriginalRow227TriangleData0976
import Grothe.UpperChaos.OriginalRow227TriangleData0977
import Grothe.UpperChaos.OriginalRow227TriangleData0978
import Grothe.UpperChaos.OriginalRow227TriangleData0979
import Grothe.UpperChaos.OriginalRow227TriangleData0980
import Grothe.UpperChaos.OriginalRow227TriangleData0981
import Grothe.UpperChaos.OriginalRow227TriangleData0982
import Grothe.UpperChaos.OriginalRow227TriangleData0983

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow069

open ConditionalTableLookup

def values0972 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0972.coefficient69_68,
  OriginalRow227TriangleData0972.coefficient69_69,
  OriginalRow227TriangleData0972.coefficient69_70,
  OriginalRow227TriangleData0972.coefficient69_71,
  OriginalRow227TriangleData0972.coefficient69_72,
  OriginalRow227TriangleData0972.coefficient69_73,
  OriginalRow227TriangleData0972.coefficient69_74,
  OriginalRow227TriangleData0972.coefficient69_75,
  OriginalRow227TriangleData0972.coefficient69_76,
  OriginalRow227TriangleData0972.coefficient69_77,
  OriginalRow227TriangleData0972.coefficient69_78,
  OriginalRow227TriangleData0972.coefficient69_79,
  OriginalRow227TriangleData0972.coefficient69_80,
  OriginalRow227TriangleData0972.coefficient69_81,
  OriginalRow227TriangleData0972.coefficient69_82,
  OriginalRow227TriangleData0972.coefficient69_83,
  OriginalRow227TriangleData0972.coefficient69_84,
  OriginalRow227TriangleData0972.coefficient69_85,
  OriginalRow227TriangleData0972.coefficient69_86,
  OriginalRow227TriangleData0972.coefficient69_87,
  OriginalRow227TriangleData0972.coefficient69_88,
  OriginalRow227TriangleData0972.coefficient69_89,
  OriginalRow227TriangleData0972.coefficient69_90,
  OriginalRow227TriangleData0972.coefficient69_91,
  OriginalRow227TriangleData0972.coefficient69_92,
  OriginalRow227TriangleData0972.coefficient69_93,
  OriginalRow227TriangleData0972.coefficient69_94,
  OriginalRow227TriangleData0972.coefficient69_95,
  OriginalRow227TriangleData0972.coefficient69_96,
  OriginalRow227TriangleData0972.coefficient69_97,
  OriginalRow227TriangleData0972.coefficient69_98,
  OriginalRow227TriangleData0972.coefficient69_99
]

theorem values0972_size : values0972.size = 32 := rfl

def block0972 : ℕ → Option IntervalDyadic := segment 68 values0972

theorem block0972_domain : ExactDomain block0972 68 100 := by
  simpa only [values0972_size] using segment_domain 68 values0972

theorem block0972_get (i : Fin 32) :
    block0972 (68 + i.val) = some (values0972[i.val]'(by rw [values0972_size]; exact i.isLt)) := by
  exact segment_get 68 values0972 ⟨i.val, by rw [values0972_size]; exact i.isLt⟩

def values0973 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0973.coefficient69_100,
  OriginalRow227TriangleData0973.coefficient69_101,
  OriginalRow227TriangleData0973.coefficient69_102,
  OriginalRow227TriangleData0973.coefficient69_103,
  OriginalRow227TriangleData0973.coefficient69_104,
  OriginalRow227TriangleData0973.coefficient69_105,
  OriginalRow227TriangleData0973.coefficient69_106,
  OriginalRow227TriangleData0973.coefficient69_107,
  OriginalRow227TriangleData0973.coefficient69_108,
  OriginalRow227TriangleData0973.coefficient69_109,
  OriginalRow227TriangleData0973.coefficient69_110,
  OriginalRow227TriangleData0973.coefficient69_111,
  OriginalRow227TriangleData0973.coefficient69_112,
  OriginalRow227TriangleData0973.coefficient69_113,
  OriginalRow227TriangleData0973.coefficient69_114,
  OriginalRow227TriangleData0973.coefficient69_115,
  OriginalRow227TriangleData0973.coefficient69_116,
  OriginalRow227TriangleData0973.coefficient69_117,
  OriginalRow227TriangleData0973.coefficient69_118,
  OriginalRow227TriangleData0973.coefficient69_119,
  OriginalRow227TriangleData0973.coefficient69_120,
  OriginalRow227TriangleData0973.coefficient69_121,
  OriginalRow227TriangleData0973.coefficient69_122,
  OriginalRow227TriangleData0973.coefficient69_123,
  OriginalRow227TriangleData0973.coefficient69_124,
  OriginalRow227TriangleData0973.coefficient69_125,
  OriginalRow227TriangleData0973.coefficient69_126,
  OriginalRow227TriangleData0973.coefficient69_127,
  OriginalRow227TriangleData0973.coefficient69_128,
  OriginalRow227TriangleData0973.coefficient69_129,
  OriginalRow227TriangleData0973.coefficient69_130,
  OriginalRow227TriangleData0973.coefficient69_131
]

theorem values0973_size : values0973.size = 32 := rfl

def block0973 : ℕ → Option IntervalDyadic := segment 100 values0973

theorem block0973_domain : ExactDomain block0973 100 132 := by
  simpa only [values0973_size] using segment_domain 100 values0973

theorem block0973_get (i : Fin 32) :
    block0973 (100 + i.val) = some (values0973[i.val]'(by rw [values0973_size]; exact i.isLt)) := by
  exact segment_get 100 values0973 ⟨i.val, by rw [values0973_size]; exact i.isLt⟩

def values0974 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0974.coefficient69_132,
  OriginalRow227TriangleData0974.coefficient69_133,
  OriginalRow227TriangleData0974.coefficient69_134,
  OriginalRow227TriangleData0974.coefficient69_135,
  OriginalRow227TriangleData0974.coefficient69_136,
  OriginalRow227TriangleData0974.coefficient69_137,
  OriginalRow227TriangleData0974.coefficient69_138,
  OriginalRow227TriangleData0974.coefficient69_139,
  OriginalRow227TriangleData0974.coefficient69_140,
  OriginalRow227TriangleData0974.coefficient69_141,
  OriginalRow227TriangleData0974.coefficient69_142,
  OriginalRow227TriangleData0974.coefficient69_143,
  OriginalRow227TriangleData0974.coefficient69_144,
  OriginalRow227TriangleData0974.coefficient69_145,
  OriginalRow227TriangleData0974.coefficient69_146,
  OriginalRow227TriangleData0974.coefficient69_147,
  OriginalRow227TriangleData0974.coefficient69_148,
  OriginalRow227TriangleData0974.coefficient69_149,
  OriginalRow227TriangleData0974.coefficient69_150,
  OriginalRow227TriangleData0974.coefficient69_151,
  OriginalRow227TriangleData0974.coefficient69_152,
  OriginalRow227TriangleData0974.coefficient69_153,
  OriginalRow227TriangleData0974.coefficient69_154,
  OriginalRow227TriangleData0974.coefficient69_155,
  OriginalRow227TriangleData0974.coefficient69_156,
  OriginalRow227TriangleData0974.coefficient69_157,
  OriginalRow227TriangleData0974.coefficient69_158,
  OriginalRow227TriangleData0974.coefficient69_159,
  OriginalRow227TriangleData0974.coefficient69_160,
  OriginalRow227TriangleData0974.coefficient69_161,
  OriginalRow227TriangleData0974.coefficient69_162,
  OriginalRow227TriangleData0974.coefficient69_163
]

theorem values0974_size : values0974.size = 32 := rfl

def block0974 : ℕ → Option IntervalDyadic := segment 132 values0974

theorem block0974_domain : ExactDomain block0974 132 164 := by
  simpa only [values0974_size] using segment_domain 132 values0974

theorem block0974_get (i : Fin 32) :
    block0974 (132 + i.val) = some (values0974[i.val]'(by rw [values0974_size]; exact i.isLt)) := by
  exact segment_get 132 values0974 ⟨i.val, by rw [values0974_size]; exact i.isLt⟩

def values0975 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0975.coefficient69_164,
  OriginalRow227TriangleData0975.coefficient69_165,
  OriginalRow227TriangleData0975.coefficient69_166,
  OriginalRow227TriangleData0975.coefficient69_167,
  OriginalRow227TriangleData0975.coefficient69_168,
  OriginalRow227TriangleData0975.coefficient69_169,
  OriginalRow227TriangleData0975.coefficient69_170,
  OriginalRow227TriangleData0975.coefficient69_171,
  OriginalRow227TriangleData0975.coefficient69_172,
  OriginalRow227TriangleData0975.coefficient69_173,
  OriginalRow227TriangleData0975.coefficient69_174,
  OriginalRow227TriangleData0975.coefficient69_175,
  OriginalRow227TriangleData0975.coefficient69_176,
  OriginalRow227TriangleData0975.coefficient69_177,
  OriginalRow227TriangleData0975.coefficient69_178,
  OriginalRow227TriangleData0975.coefficient69_179,
  OriginalRow227TriangleData0975.coefficient69_180,
  OriginalRow227TriangleData0975.coefficient69_181,
  OriginalRow227TriangleData0975.coefficient69_182,
  OriginalRow227TriangleData0975.coefficient69_183,
  OriginalRow227TriangleData0975.coefficient69_184,
  OriginalRow227TriangleData0975.coefficient69_185,
  OriginalRow227TriangleData0975.coefficient69_186,
  OriginalRow227TriangleData0975.coefficient69_187,
  OriginalRow227TriangleData0975.coefficient69_188,
  OriginalRow227TriangleData0975.coefficient69_189,
  OriginalRow227TriangleData0975.coefficient69_190,
  OriginalRow227TriangleData0975.coefficient69_191,
  OriginalRow227TriangleData0975.coefficient69_192,
  OriginalRow227TriangleData0975.coefficient69_193,
  OriginalRow227TriangleData0975.coefficient69_194,
  OriginalRow227TriangleData0975.coefficient69_195
]

theorem values0975_size : values0975.size = 32 := rfl

def block0975 : ℕ → Option IntervalDyadic := segment 164 values0975

theorem block0975_domain : ExactDomain block0975 164 196 := by
  simpa only [values0975_size] using segment_domain 164 values0975

theorem block0975_get (i : Fin 32) :
    block0975 (164 + i.val) = some (values0975[i.val]'(by rw [values0975_size]; exact i.isLt)) := by
  exact segment_get 164 values0975 ⟨i.val, by rw [values0975_size]; exact i.isLt⟩

def values0976 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0976.coefficient69_196,
  OriginalRow227TriangleData0976.coefficient69_197,
  OriginalRow227TriangleData0976.coefficient69_198,
  OriginalRow227TriangleData0976.coefficient69_199,
  OriginalRow227TriangleData0976.coefficient69_200,
  OriginalRow227TriangleData0976.coefficient69_201,
  OriginalRow227TriangleData0976.coefficient69_202,
  OriginalRow227TriangleData0976.coefficient69_203,
  OriginalRow227TriangleData0976.coefficient69_204,
  OriginalRow227TriangleData0976.coefficient69_205,
  OriginalRow227TriangleData0976.coefficient69_206,
  OriginalRow227TriangleData0976.coefficient69_207,
  OriginalRow227TriangleData0976.coefficient69_208,
  OriginalRow227TriangleData0976.coefficient69_209,
  OriginalRow227TriangleData0976.coefficient69_210,
  OriginalRow227TriangleData0976.coefficient69_211,
  OriginalRow227TriangleData0976.coefficient69_212,
  OriginalRow227TriangleData0976.coefficient69_213,
  OriginalRow227TriangleData0976.coefficient69_214,
  OriginalRow227TriangleData0976.coefficient69_215,
  OriginalRow227TriangleData0976.coefficient69_216,
  OriginalRow227TriangleData0976.coefficient69_217,
  OriginalRow227TriangleData0976.coefficient69_218,
  OriginalRow227TriangleData0976.coefficient69_219,
  OriginalRow227TriangleData0976.coefficient69_220,
  OriginalRow227TriangleData0976.coefficient69_221,
  OriginalRow227TriangleData0976.coefficient69_222,
  OriginalRow227TriangleData0976.coefficient69_223,
  OriginalRow227TriangleData0976.coefficient69_224,
  OriginalRow227TriangleData0976.coefficient69_225,
  OriginalRow227TriangleData0976.coefficient69_226,
  OriginalRow227TriangleData0976.coefficient69_227
]

theorem values0976_size : values0976.size = 32 := rfl

def block0976 : ℕ → Option IntervalDyadic := segment 196 values0976

theorem block0976_domain : ExactDomain block0976 196 228 := by
  simpa only [values0976_size] using segment_domain 196 values0976

theorem block0976_get (i : Fin 32) :
    block0976 (196 + i.val) = some (values0976[i.val]'(by rw [values0976_size]; exact i.isLt)) := by
  exact segment_get 196 values0976 ⟨i.val, by rw [values0976_size]; exact i.isLt⟩

def values0977 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0977.coefficient69_228,
  OriginalRow227TriangleData0977.coefficient69_229,
  OriginalRow227TriangleData0977.coefficient69_230,
  OriginalRow227TriangleData0977.coefficient69_231,
  OriginalRow227TriangleData0977.coefficient69_232,
  OriginalRow227TriangleData0977.coefficient69_233,
  OriginalRow227TriangleData0977.coefficient69_234,
  OriginalRow227TriangleData0977.coefficient69_235,
  OriginalRow227TriangleData0977.coefficient69_236,
  OriginalRow227TriangleData0977.coefficient69_237,
  OriginalRow227TriangleData0977.coefficient69_238,
  OriginalRow227TriangleData0977.coefficient69_239,
  OriginalRow227TriangleData0977.coefficient69_240,
  OriginalRow227TriangleData0977.coefficient69_241,
  OriginalRow227TriangleData0977.coefficient69_242,
  OriginalRow227TriangleData0977.coefficient69_243,
  OriginalRow227TriangleData0977.coefficient69_244,
  OriginalRow227TriangleData0977.coefficient69_245,
  OriginalRow227TriangleData0977.coefficient69_246,
  OriginalRow227TriangleData0977.coefficient69_247,
  OriginalRow227TriangleData0977.coefficient69_248,
  OriginalRow227TriangleData0977.coefficient69_249,
  OriginalRow227TriangleData0977.coefficient69_250,
  OriginalRow227TriangleData0977.coefficient69_251,
  OriginalRow227TriangleData0977.coefficient69_252,
  OriginalRow227TriangleData0977.coefficient69_253,
  OriginalRow227TriangleData0977.coefficient69_254,
  OriginalRow227TriangleData0977.coefficient69_255,
  OriginalRow227TriangleData0977.coefficient69_256,
  OriginalRow227TriangleData0977.coefficient69_257,
  OriginalRow227TriangleData0977.coefficient69_258,
  OriginalRow227TriangleData0977.coefficient69_259
]

theorem values0977_size : values0977.size = 32 := rfl

def block0977 : ℕ → Option IntervalDyadic := segment 228 values0977

theorem block0977_domain : ExactDomain block0977 228 260 := by
  simpa only [values0977_size] using segment_domain 228 values0977

theorem block0977_get (i : Fin 32) :
    block0977 (228 + i.val) = some (values0977[i.val]'(by rw [values0977_size]; exact i.isLt)) := by
  exact segment_get 228 values0977 ⟨i.val, by rw [values0977_size]; exact i.isLt⟩

def values0978 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0978.coefficient69_260,
  OriginalRow227TriangleData0978.coefficient69_261,
  OriginalRow227TriangleData0978.coefficient69_262,
  OriginalRow227TriangleData0978.coefficient69_263,
  OriginalRow227TriangleData0978.coefficient69_264,
  OriginalRow227TriangleData0978.coefficient69_265,
  OriginalRow227TriangleData0978.coefficient69_266,
  OriginalRow227TriangleData0978.coefficient69_267,
  OriginalRow227TriangleData0978.coefficient69_268,
  OriginalRow227TriangleData0978.coefficient69_269,
  OriginalRow227TriangleData0978.coefficient69_270,
  OriginalRow227TriangleData0978.coefficient69_271,
  OriginalRow227TriangleData0978.coefficient69_272,
  OriginalRow227TriangleData0978.coefficient69_273,
  OriginalRow227TriangleData0978.coefficient69_274,
  OriginalRow227TriangleData0978.coefficient69_275,
  OriginalRow227TriangleData0978.coefficient69_276,
  OriginalRow227TriangleData0978.coefficient69_277,
  OriginalRow227TriangleData0978.coefficient69_278,
  OriginalRow227TriangleData0978.coefficient69_279,
  OriginalRow227TriangleData0978.coefficient69_280,
  OriginalRow227TriangleData0978.coefficient69_281,
  OriginalRow227TriangleData0978.coefficient69_282,
  OriginalRow227TriangleData0978.coefficient69_283,
  OriginalRow227TriangleData0978.coefficient69_284,
  OriginalRow227TriangleData0978.coefficient69_285,
  OriginalRow227TriangleData0978.coefficient69_286,
  OriginalRow227TriangleData0978.coefficient69_287,
  OriginalRow227TriangleData0978.coefficient69_288,
  OriginalRow227TriangleData0978.coefficient69_289,
  OriginalRow227TriangleData0978.coefficient69_290,
  OriginalRow227TriangleData0978.coefficient69_291
]

theorem values0978_size : values0978.size = 32 := rfl

def block0978 : ℕ → Option IntervalDyadic := segment 260 values0978

theorem block0978_domain : ExactDomain block0978 260 292 := by
  simpa only [values0978_size] using segment_domain 260 values0978

theorem block0978_get (i : Fin 32) :
    block0978 (260 + i.val) = some (values0978[i.val]'(by rw [values0978_size]; exact i.isLt)) := by
  exact segment_get 260 values0978 ⟨i.val, by rw [values0978_size]; exact i.isLt⟩

def values0979 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0979.coefficient69_292,
  OriginalRow227TriangleData0979.coefficient69_293,
  OriginalRow227TriangleData0979.coefficient69_294,
  OriginalRow227TriangleData0979.coefficient69_295,
  OriginalRow227TriangleData0979.coefficient69_296,
  OriginalRow227TriangleData0979.coefficient69_297,
  OriginalRow227TriangleData0979.coefficient69_298,
  OriginalRow227TriangleData0979.coefficient69_299,
  OriginalRow227TriangleData0979.coefficient69_300,
  OriginalRow227TriangleData0979.coefficient69_301,
  OriginalRow227TriangleData0979.coefficient69_302,
  OriginalRow227TriangleData0979.coefficient69_303,
  OriginalRow227TriangleData0979.coefficient69_304,
  OriginalRow227TriangleData0979.coefficient69_305,
  OriginalRow227TriangleData0979.coefficient69_306,
  OriginalRow227TriangleData0979.coefficient69_307,
  OriginalRow227TriangleData0979.coefficient69_308,
  OriginalRow227TriangleData0979.coefficient69_309,
  OriginalRow227TriangleData0979.coefficient69_310,
  OriginalRow227TriangleData0979.coefficient69_311,
  OriginalRow227TriangleData0979.coefficient69_312,
  OriginalRow227TriangleData0979.coefficient69_313,
  OriginalRow227TriangleData0979.coefficient69_314,
  OriginalRow227TriangleData0979.coefficient69_315,
  OriginalRow227TriangleData0979.coefficient69_316,
  OriginalRow227TriangleData0979.coefficient69_317,
  OriginalRow227TriangleData0979.coefficient69_318,
  OriginalRow227TriangleData0979.coefficient69_319,
  OriginalRow227TriangleData0979.coefficient69_320,
  OriginalRow227TriangleData0979.coefficient69_321,
  OriginalRow227TriangleData0979.coefficient69_322,
  OriginalRow227TriangleData0979.coefficient69_323
]

theorem values0979_size : values0979.size = 32 := rfl

def block0979 : ℕ → Option IntervalDyadic := segment 292 values0979

theorem block0979_domain : ExactDomain block0979 292 324 := by
  simpa only [values0979_size] using segment_domain 292 values0979

theorem block0979_get (i : Fin 32) :
    block0979 (292 + i.val) = some (values0979[i.val]'(by rw [values0979_size]; exact i.isLt)) := by
  exact segment_get 292 values0979 ⟨i.val, by rw [values0979_size]; exact i.isLt⟩

def values0980 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0980.coefficient69_324,
  OriginalRow227TriangleData0980.coefficient69_325,
  OriginalRow227TriangleData0980.coefficient69_326,
  OriginalRow227TriangleData0980.coefficient69_327,
  OriginalRow227TriangleData0980.coefficient69_328,
  OriginalRow227TriangleData0980.coefficient69_329,
  OriginalRow227TriangleData0980.coefficient69_330,
  OriginalRow227TriangleData0980.coefficient69_331,
  OriginalRow227TriangleData0980.coefficient69_332,
  OriginalRow227TriangleData0980.coefficient69_333,
  OriginalRow227TriangleData0980.coefficient69_334,
  OriginalRow227TriangleData0980.coefficient69_335,
  OriginalRow227TriangleData0980.coefficient69_336,
  OriginalRow227TriangleData0980.coefficient69_337,
  OriginalRow227TriangleData0980.coefficient69_338,
  OriginalRow227TriangleData0980.coefficient69_339,
  OriginalRow227TriangleData0980.coefficient69_340,
  OriginalRow227TriangleData0980.coefficient69_341,
  OriginalRow227TriangleData0980.coefficient69_342,
  OriginalRow227TriangleData0980.coefficient69_343,
  OriginalRow227TriangleData0980.coefficient69_344,
  OriginalRow227TriangleData0980.coefficient69_345,
  OriginalRow227TriangleData0980.coefficient69_346,
  OriginalRow227TriangleData0980.coefficient69_347,
  OriginalRow227TriangleData0980.coefficient69_348,
  OriginalRow227TriangleData0980.coefficient69_349,
  OriginalRow227TriangleData0980.coefficient69_350,
  OriginalRow227TriangleData0980.coefficient69_351,
  OriginalRow227TriangleData0980.coefficient69_352,
  OriginalRow227TriangleData0980.coefficient69_353,
  OriginalRow227TriangleData0980.coefficient69_354,
  OriginalRow227TriangleData0980.coefficient69_355
]

theorem values0980_size : values0980.size = 32 := rfl

def block0980 : ℕ → Option IntervalDyadic := segment 324 values0980

theorem block0980_domain : ExactDomain block0980 324 356 := by
  simpa only [values0980_size] using segment_domain 324 values0980

theorem block0980_get (i : Fin 32) :
    block0980 (324 + i.val) = some (values0980[i.val]'(by rw [values0980_size]; exact i.isLt)) := by
  exact segment_get 324 values0980 ⟨i.val, by rw [values0980_size]; exact i.isLt⟩

def values0981 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0981.coefficient69_356,
  OriginalRow227TriangleData0981.coefficient69_357,
  OriginalRow227TriangleData0981.coefficient69_358,
  OriginalRow227TriangleData0981.coefficient69_359,
  OriginalRow227TriangleData0981.coefficient69_360,
  OriginalRow227TriangleData0981.coefficient69_361,
  OriginalRow227TriangleData0981.coefficient69_362,
  OriginalRow227TriangleData0981.coefficient69_363,
  OriginalRow227TriangleData0981.coefficient69_364,
  OriginalRow227TriangleData0981.coefficient69_365,
  OriginalRow227TriangleData0981.coefficient69_366,
  OriginalRow227TriangleData0981.coefficient69_367,
  OriginalRow227TriangleData0981.coefficient69_368,
  OriginalRow227TriangleData0981.coefficient69_369,
  OriginalRow227TriangleData0981.coefficient69_370,
  OriginalRow227TriangleData0981.coefficient69_371,
  OriginalRow227TriangleData0981.coefficient69_372,
  OriginalRow227TriangleData0981.coefficient69_373,
  OriginalRow227TriangleData0981.coefficient69_374,
  OriginalRow227TriangleData0981.coefficient69_375,
  OriginalRow227TriangleData0981.coefficient69_376,
  OriginalRow227TriangleData0981.coefficient69_377,
  OriginalRow227TriangleData0981.coefficient69_378,
  OriginalRow227TriangleData0981.coefficient69_379,
  OriginalRow227TriangleData0981.coefficient69_380,
  OriginalRow227TriangleData0981.coefficient69_381,
  OriginalRow227TriangleData0981.coefficient69_382,
  OriginalRow227TriangleData0981.coefficient69_383,
  OriginalRow227TriangleData0981.coefficient69_384,
  OriginalRow227TriangleData0981.coefficient69_385,
  OriginalRow227TriangleData0981.coefficient69_386,
  OriginalRow227TriangleData0981.coefficient69_387
]

theorem values0981_size : values0981.size = 32 := rfl

def block0981 : ℕ → Option IntervalDyadic := segment 356 values0981

theorem block0981_domain : ExactDomain block0981 356 388 := by
  simpa only [values0981_size] using segment_domain 356 values0981

theorem block0981_get (i : Fin 32) :
    block0981 (356 + i.val) = some (values0981[i.val]'(by rw [values0981_size]; exact i.isLt)) := by
  exact segment_get 356 values0981 ⟨i.val, by rw [values0981_size]; exact i.isLt⟩

def values0982 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0982.coefficient69_388,
  OriginalRow227TriangleData0982.coefficient69_389,
  OriginalRow227TriangleData0982.coefficient69_390,
  OriginalRow227TriangleData0982.coefficient69_391,
  OriginalRow227TriangleData0982.coefficient69_392,
  OriginalRow227TriangleData0982.coefficient69_393,
  OriginalRow227TriangleData0982.coefficient69_394,
  OriginalRow227TriangleData0982.coefficient69_395,
  OriginalRow227TriangleData0982.coefficient69_396,
  OriginalRow227TriangleData0982.coefficient69_397,
  OriginalRow227TriangleData0982.coefficient69_398,
  OriginalRow227TriangleData0982.coefficient69_399,
  OriginalRow227TriangleData0982.coefficient69_400,
  OriginalRow227TriangleData0982.coefficient69_401,
  OriginalRow227TriangleData0982.coefficient69_402,
  OriginalRow227TriangleData0982.coefficient69_403,
  OriginalRow227TriangleData0982.coefficient69_404,
  OriginalRow227TriangleData0982.coefficient69_405,
  OriginalRow227TriangleData0982.coefficient69_406,
  OriginalRow227TriangleData0982.coefficient69_407,
  OriginalRow227TriangleData0982.coefficient69_408,
  OriginalRow227TriangleData0982.coefficient69_409,
  OriginalRow227TriangleData0982.coefficient69_410,
  OriginalRow227TriangleData0982.coefficient69_411,
  OriginalRow227TriangleData0982.coefficient69_412,
  OriginalRow227TriangleData0982.coefficient69_413,
  OriginalRow227TriangleData0982.coefficient69_414,
  OriginalRow227TriangleData0982.coefficient69_415,
  OriginalRow227TriangleData0982.coefficient69_416,
  OriginalRow227TriangleData0982.coefficient69_417,
  OriginalRow227TriangleData0982.coefficient69_418,
  OriginalRow227TriangleData0982.coefficient69_419
]

theorem values0982_size : values0982.size = 32 := rfl

def block0982 : ℕ → Option IntervalDyadic := segment 388 values0982

theorem block0982_domain : ExactDomain block0982 388 420 := by
  simpa only [values0982_size] using segment_domain 388 values0982

theorem block0982_get (i : Fin 32) :
    block0982 (388 + i.val) = some (values0982[i.val]'(by rw [values0982_size]; exact i.isLt)) := by
  exact segment_get 388 values0982 ⟨i.val, by rw [values0982_size]; exact i.isLt⟩

def values0983 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0983.coefficient69_420,
  OriginalRow227TriangleData0983.coefficient69_421,
  OriginalRow227TriangleData0983.coefficient69_422,
  OriginalRow227TriangleData0983.coefficient69_423,
  OriginalRow227TriangleData0983.coefficient69_424,
  OriginalRow227TriangleData0983.coefficient69_425,
  OriginalRow227TriangleData0983.coefficient69_426,
  OriginalRow227TriangleData0983.coefficient69_427,
  OriginalRow227TriangleData0983.coefficient69_428,
  OriginalRow227TriangleData0983.coefficient69_429,
  OriginalRow227TriangleData0983.coefficient69_430,
  OriginalRow227TriangleData0983.coefficient69_431,
  OriginalRow227TriangleData0983.coefficient69_432
]

theorem values0983_size : values0983.size = 13 := rfl

def block0983 : ℕ → Option IntervalDyadic := segment 420 values0983

theorem block0983_domain : ExactDomain block0983 420 433 := by
  simpa only [values0983_size] using segment_domain 420 values0983

theorem block0983_get (i : Fin 13) :
    block0983 (420 + i.val) = some (values0983[i.val]'(by rw [values0983_size]; exact i.isLt)) := by
  exact segment_get 420 values0983 ⟨i.val, by rw [values0983_size]; exact i.isLt⟩

def node0100_0164 : ℕ → Option IntervalDyadic := split 132 block0973 block0974

theorem node0100_0164_domain : ExactDomain node0100_0164 100 164 := by
  exact split_domain (by decide) (by decide) block0973_domain block0974_domain

def node0068_0164 : ℕ → Option IntervalDyadic := split 100 block0972 node0100_0164

theorem node0068_0164_domain : ExactDomain node0068_0164 68 164 := by
  exact split_domain (by decide) (by decide) block0972_domain node0100_0164_domain

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block0976 block0977

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block0976_domain block0977_domain

def node0164_0260 : ℕ → Option IntervalDyadic := split 196 block0975 node0196_0260

theorem node0164_0260_domain : ExactDomain node0164_0260 164 260 := by
  exact split_domain (by decide) (by decide) block0975_domain node0196_0260_domain

def node0068_0260 : ℕ → Option IntervalDyadic := split 164 node0068_0164 node0164_0260

theorem node0068_0260_domain : ExactDomain node0068_0260 68 260 := by
  exact split_domain (by decide) (by decide) node0068_0164_domain node0164_0260_domain

def node0292_0356 : ℕ → Option IntervalDyadic := split 324 block0979 block0980

theorem node0292_0356_domain : ExactDomain node0292_0356 292 356 := by
  exact split_domain (by decide) (by decide) block0979_domain block0980_domain

def node0260_0356 : ℕ → Option IntervalDyadic := split 292 block0978 node0292_0356

theorem node0260_0356_domain : ExactDomain node0260_0356 260 356 := by
  exact split_domain (by decide) (by decide) block0978_domain node0292_0356_domain

def node0388_0433 : ℕ → Option IntervalDyadic := split 420 block0982 block0983

theorem node0388_0433_domain : ExactDomain node0388_0433 388 433 := by
  exact split_domain (by decide) (by decide) block0982_domain block0983_domain

def node0356_0433 : ℕ → Option IntervalDyadic := split 388 block0981 node0388_0433

theorem node0356_0433_domain : ExactDomain node0356_0433 356 433 := by
  exact split_domain (by decide) (by decide) block0981_domain node0388_0433_domain

def node0260_0433 : ℕ → Option IntervalDyadic := split 356 node0260_0356 node0356_0433

theorem node0260_0433_domain : ExactDomain node0260_0433 260 433 := by
  exact split_domain (by decide) (by decide) node0260_0356_domain node0356_0433_domain

def node0068_0433 : ℕ → Option IntervalDyadic := split 260 node0068_0260 node0260_0433

theorem node0068_0433_domain : ExactDomain node0068_0433 68 433 := by
  exact split_domain (by decide) (by decide) node0068_0260_domain node0260_0433_domain

def lookup : ℕ → Option IntervalDyadic := node0068_0433

theorem lookup_domain : ExactDomain lookup 68 433 :=
  node0068_0433_domain

theorem block0972_lookup (i : Fin 32) :
    lookup (68 + i.val) = some (values0972[i.val]'(by rw [values0972_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (68 + i.val) = _
  rw [node0068_0433, split_left 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0068_0260, split_left 164 node0068_0164 node0164_0260 (by omega)]
  rw [node0068_0164, split_left 100 block0972 node0100_0164 (by omega)]
  exact block0972_get i

theorem block0973_lookup (i : Fin 32) :
    lookup (100 + i.val) = some (values0973[i.val]'(by rw [values0973_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (100 + i.val) = _
  rw [node0068_0433, split_left 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0068_0260, split_left 164 node0068_0164 node0164_0260 (by omega)]
  rw [node0068_0164, split_right 100 block0972 node0100_0164 (by omega)]
  rw [node0100_0164, split_left 132 block0973 block0974 (by omega)]
  exact block0973_get i

theorem block0974_lookup (i : Fin 32) :
    lookup (132 + i.val) = some (values0974[i.val]'(by rw [values0974_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (132 + i.val) = _
  rw [node0068_0433, split_left 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0068_0260, split_left 164 node0068_0164 node0164_0260 (by omega)]
  rw [node0068_0164, split_right 100 block0972 node0100_0164 (by omega)]
  rw [node0100_0164, split_right 132 block0973 block0974 (by omega)]
  exact block0974_get i

theorem block0975_lookup (i : Fin 32) :
    lookup (164 + i.val) = some (values0975[i.val]'(by rw [values0975_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (164 + i.val) = _
  rw [node0068_0433, split_left 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0068_0260, split_right 164 node0068_0164 node0164_0260 (by omega)]
  rw [node0164_0260, split_left 196 block0975 node0196_0260 (by omega)]
  exact block0975_get i

theorem block0976_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values0976[i.val]'(by rw [values0976_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (196 + i.val) = _
  rw [node0068_0433, split_left 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0068_0260, split_right 164 node0068_0164 node0164_0260 (by omega)]
  rw [node0164_0260, split_right 196 block0975 node0196_0260 (by omega)]
  rw [node0196_0260, split_left 228 block0976 block0977 (by omega)]
  exact block0976_get i

theorem block0977_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values0977[i.val]'(by rw [values0977_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (228 + i.val) = _
  rw [node0068_0433, split_left 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0068_0260, split_right 164 node0068_0164 node0164_0260 (by omega)]
  rw [node0164_0260, split_right 196 block0975 node0196_0260 (by omega)]
  rw [node0196_0260, split_right 228 block0976 block0977 (by omega)]
  exact block0977_get i

theorem block0978_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values0978[i.val]'(by rw [values0978_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (260 + i.val) = _
  rw [node0068_0433, split_right 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0260_0433, split_left 356 node0260_0356 node0356_0433 (by omega)]
  rw [node0260_0356, split_left 292 block0978 node0292_0356 (by omega)]
  exact block0978_get i

theorem block0979_lookup (i : Fin 32) :
    lookup (292 + i.val) = some (values0979[i.val]'(by rw [values0979_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (292 + i.val) = _
  rw [node0068_0433, split_right 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0260_0433, split_left 356 node0260_0356 node0356_0433 (by omega)]
  rw [node0260_0356, split_right 292 block0978 node0292_0356 (by omega)]
  rw [node0292_0356, split_left 324 block0979 block0980 (by omega)]
  exact block0979_get i

theorem block0980_lookup (i : Fin 32) :
    lookup (324 + i.val) = some (values0980[i.val]'(by rw [values0980_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (324 + i.val) = _
  rw [node0068_0433, split_right 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0260_0433, split_left 356 node0260_0356 node0356_0433 (by omega)]
  rw [node0260_0356, split_right 292 block0978 node0292_0356 (by omega)]
  rw [node0292_0356, split_right 324 block0979 block0980 (by omega)]
  exact block0980_get i

theorem block0981_lookup (i : Fin 32) :
    lookup (356 + i.val) = some (values0981[i.val]'(by rw [values0981_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (356 + i.val) = _
  rw [node0068_0433, split_right 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0260_0433, split_right 356 node0260_0356 node0356_0433 (by omega)]
  rw [node0356_0433, split_left 388 block0981 node0388_0433 (by omega)]
  exact block0981_get i

theorem block0982_lookup (i : Fin 32) :
    lookup (388 + i.val) = some (values0982[i.val]'(by rw [values0982_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (388 + i.val) = _
  rw [node0068_0433, split_right 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0260_0433, split_right 356 node0260_0356 node0356_0433 (by omega)]
  rw [node0356_0433, split_right 388 block0981 node0388_0433 (by omega)]
  rw [node0388_0433, split_left 420 block0982 block0983 (by omega)]
  exact block0982_get i

theorem block0983_lookup (i : Fin 13) :
    lookup (420 + i.val) = some (values0983[i.val]'(by rw [values0983_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0068_0433 (420 + i.val) = _
  rw [node0068_0433, split_right 260 node0068_0260 node0260_0433 (by omega)]
  rw [node0260_0433, split_right 356 node0260_0356 node0356_0433 (by omega)]
  rw [node0356_0433, split_right 388 block0981 node0388_0433 (by omega)]
  rw [node0388_0433, split_right 420 block0982 block0983 (by omega)]
  exact block0983_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0972_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0972_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0973_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0973_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0974_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0974_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0975_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0975_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0976_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0976_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0977_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0977_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0978_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0978_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0979_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0979_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0980_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0980_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0981_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0981_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0982_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0982_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0983_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0983_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0972_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0973_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0974_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0975_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0976_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0977_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0978_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0979_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0980_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0981_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0982_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow069.block0983_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow069
