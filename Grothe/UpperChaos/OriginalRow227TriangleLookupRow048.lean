import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0708
import Grothe.UpperChaos.OriginalRow227TriangleData0709
import Grothe.UpperChaos.OriginalRow227TriangleData0710
import Grothe.UpperChaos.OriginalRow227TriangleData0711
import Grothe.UpperChaos.OriginalRow227TriangleData0712
import Grothe.UpperChaos.OriginalRow227TriangleData0713
import Grothe.UpperChaos.OriginalRow227TriangleData0714
import Grothe.UpperChaos.OriginalRow227TriangleData0715
import Grothe.UpperChaos.OriginalRow227TriangleData0716
import Grothe.UpperChaos.OriginalRow227TriangleData0717
import Grothe.UpperChaos.OriginalRow227TriangleData0718
import Grothe.UpperChaos.OriginalRow227TriangleData0719
import Grothe.UpperChaos.OriginalRow227TriangleData0720

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow048

open ConditionalTableLookup

def values0708 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0708.coefficient48_47,
  OriginalRow227TriangleData0708.coefficient48_48,
  OriginalRow227TriangleData0708.coefficient48_49,
  OriginalRow227TriangleData0708.coefficient48_50,
  OriginalRow227TriangleData0708.coefficient48_51,
  OriginalRow227TriangleData0708.coefficient48_52,
  OriginalRow227TriangleData0708.coefficient48_53,
  OriginalRow227TriangleData0708.coefficient48_54,
  OriginalRow227TriangleData0708.coefficient48_55,
  OriginalRow227TriangleData0708.coefficient48_56,
  OriginalRow227TriangleData0708.coefficient48_57,
  OriginalRow227TriangleData0708.coefficient48_58,
  OriginalRow227TriangleData0708.coefficient48_59,
  OriginalRow227TriangleData0708.coefficient48_60,
  OriginalRow227TriangleData0708.coefficient48_61,
  OriginalRow227TriangleData0708.coefficient48_62,
  OriginalRow227TriangleData0708.coefficient48_63,
  OriginalRow227TriangleData0708.coefficient48_64,
  OriginalRow227TriangleData0708.coefficient48_65,
  OriginalRow227TriangleData0708.coefficient48_66,
  OriginalRow227TriangleData0708.coefficient48_67,
  OriginalRow227TriangleData0708.coefficient48_68,
  OriginalRow227TriangleData0708.coefficient48_69,
  OriginalRow227TriangleData0708.coefficient48_70,
  OriginalRow227TriangleData0708.coefficient48_71,
  OriginalRow227TriangleData0708.coefficient48_72,
  OriginalRow227TriangleData0708.coefficient48_73,
  OriginalRow227TriangleData0708.coefficient48_74,
  OriginalRow227TriangleData0708.coefficient48_75,
  OriginalRow227TriangleData0708.coefficient48_76,
  OriginalRow227TriangleData0708.coefficient48_77,
  OriginalRow227TriangleData0708.coefficient48_78
]

theorem values0708_size : values0708.size = 32 := rfl

def block0708 : ℕ → Option IntervalDyadic := segment 47 values0708

theorem block0708_domain : ExactDomain block0708 47 79 := by
  simpa only [values0708_size] using segment_domain 47 values0708

theorem block0708_get (i : Fin 32) :
    block0708 (47 + i.val) = some (values0708[i.val]'(by rw [values0708_size]; exact i.isLt)) := by
  exact segment_get 47 values0708 ⟨i.val, by rw [values0708_size]; exact i.isLt⟩

def values0709 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0709.coefficient48_79,
  OriginalRow227TriangleData0709.coefficient48_80,
  OriginalRow227TriangleData0709.coefficient48_81,
  OriginalRow227TriangleData0709.coefficient48_82,
  OriginalRow227TriangleData0709.coefficient48_83,
  OriginalRow227TriangleData0709.coefficient48_84,
  OriginalRow227TriangleData0709.coefficient48_85,
  OriginalRow227TriangleData0709.coefficient48_86,
  OriginalRow227TriangleData0709.coefficient48_87,
  OriginalRow227TriangleData0709.coefficient48_88,
  OriginalRow227TriangleData0709.coefficient48_89,
  OriginalRow227TriangleData0709.coefficient48_90,
  OriginalRow227TriangleData0709.coefficient48_91,
  OriginalRow227TriangleData0709.coefficient48_92,
  OriginalRow227TriangleData0709.coefficient48_93,
  OriginalRow227TriangleData0709.coefficient48_94,
  OriginalRow227TriangleData0709.coefficient48_95,
  OriginalRow227TriangleData0709.coefficient48_96,
  OriginalRow227TriangleData0709.coefficient48_97,
  OriginalRow227TriangleData0709.coefficient48_98,
  OriginalRow227TriangleData0709.coefficient48_99,
  OriginalRow227TriangleData0709.coefficient48_100,
  OriginalRow227TriangleData0709.coefficient48_101,
  OriginalRow227TriangleData0709.coefficient48_102,
  OriginalRow227TriangleData0709.coefficient48_103,
  OriginalRow227TriangleData0709.coefficient48_104,
  OriginalRow227TriangleData0709.coefficient48_105,
  OriginalRow227TriangleData0709.coefficient48_106,
  OriginalRow227TriangleData0709.coefficient48_107,
  OriginalRow227TriangleData0709.coefficient48_108,
  OriginalRow227TriangleData0709.coefficient48_109,
  OriginalRow227TriangleData0709.coefficient48_110
]

theorem values0709_size : values0709.size = 32 := rfl

def block0709 : ℕ → Option IntervalDyadic := segment 79 values0709

theorem block0709_domain : ExactDomain block0709 79 111 := by
  simpa only [values0709_size] using segment_domain 79 values0709

theorem block0709_get (i : Fin 32) :
    block0709 (79 + i.val) = some (values0709[i.val]'(by rw [values0709_size]; exact i.isLt)) := by
  exact segment_get 79 values0709 ⟨i.val, by rw [values0709_size]; exact i.isLt⟩

def values0710 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0710.coefficient48_111,
  OriginalRow227TriangleData0710.coefficient48_112,
  OriginalRow227TriangleData0710.coefficient48_113,
  OriginalRow227TriangleData0710.coefficient48_114,
  OriginalRow227TriangleData0710.coefficient48_115,
  OriginalRow227TriangleData0710.coefficient48_116,
  OriginalRow227TriangleData0710.coefficient48_117,
  OriginalRow227TriangleData0710.coefficient48_118,
  OriginalRow227TriangleData0710.coefficient48_119,
  OriginalRow227TriangleData0710.coefficient48_120,
  OriginalRow227TriangleData0710.coefficient48_121,
  OriginalRow227TriangleData0710.coefficient48_122,
  OriginalRow227TriangleData0710.coefficient48_123,
  OriginalRow227TriangleData0710.coefficient48_124,
  OriginalRow227TriangleData0710.coefficient48_125,
  OriginalRow227TriangleData0710.coefficient48_126,
  OriginalRow227TriangleData0710.coefficient48_127,
  OriginalRow227TriangleData0710.coefficient48_128,
  OriginalRow227TriangleData0710.coefficient48_129,
  OriginalRow227TriangleData0710.coefficient48_130,
  OriginalRow227TriangleData0710.coefficient48_131,
  OriginalRow227TriangleData0710.coefficient48_132,
  OriginalRow227TriangleData0710.coefficient48_133,
  OriginalRow227TriangleData0710.coefficient48_134,
  OriginalRow227TriangleData0710.coefficient48_135,
  OriginalRow227TriangleData0710.coefficient48_136,
  OriginalRow227TriangleData0710.coefficient48_137,
  OriginalRow227TriangleData0710.coefficient48_138,
  OriginalRow227TriangleData0710.coefficient48_139,
  OriginalRow227TriangleData0710.coefficient48_140,
  OriginalRow227TriangleData0710.coefficient48_141,
  OriginalRow227TriangleData0710.coefficient48_142
]

theorem values0710_size : values0710.size = 32 := rfl

def block0710 : ℕ → Option IntervalDyadic := segment 111 values0710

theorem block0710_domain : ExactDomain block0710 111 143 := by
  simpa only [values0710_size] using segment_domain 111 values0710

theorem block0710_get (i : Fin 32) :
    block0710 (111 + i.val) = some (values0710[i.val]'(by rw [values0710_size]; exact i.isLt)) := by
  exact segment_get 111 values0710 ⟨i.val, by rw [values0710_size]; exact i.isLt⟩

def values0711 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0711.coefficient48_143,
  OriginalRow227TriangleData0711.coefficient48_144,
  OriginalRow227TriangleData0711.coefficient48_145,
  OriginalRow227TriangleData0711.coefficient48_146,
  OriginalRow227TriangleData0711.coefficient48_147,
  OriginalRow227TriangleData0711.coefficient48_148,
  OriginalRow227TriangleData0711.coefficient48_149,
  OriginalRow227TriangleData0711.coefficient48_150,
  OriginalRow227TriangleData0711.coefficient48_151,
  OriginalRow227TriangleData0711.coefficient48_152,
  OriginalRow227TriangleData0711.coefficient48_153,
  OriginalRow227TriangleData0711.coefficient48_154,
  OriginalRow227TriangleData0711.coefficient48_155,
  OriginalRow227TriangleData0711.coefficient48_156,
  OriginalRow227TriangleData0711.coefficient48_157,
  OriginalRow227TriangleData0711.coefficient48_158,
  OriginalRow227TriangleData0711.coefficient48_159,
  OriginalRow227TriangleData0711.coefficient48_160,
  OriginalRow227TriangleData0711.coefficient48_161,
  OriginalRow227TriangleData0711.coefficient48_162,
  OriginalRow227TriangleData0711.coefficient48_163,
  OriginalRow227TriangleData0711.coefficient48_164,
  OriginalRow227TriangleData0711.coefficient48_165,
  OriginalRow227TriangleData0711.coefficient48_166,
  OriginalRow227TriangleData0711.coefficient48_167,
  OriginalRow227TriangleData0711.coefficient48_168,
  OriginalRow227TriangleData0711.coefficient48_169,
  OriginalRow227TriangleData0711.coefficient48_170,
  OriginalRow227TriangleData0711.coefficient48_171,
  OriginalRow227TriangleData0711.coefficient48_172,
  OriginalRow227TriangleData0711.coefficient48_173,
  OriginalRow227TriangleData0711.coefficient48_174
]

theorem values0711_size : values0711.size = 32 := rfl

def block0711 : ℕ → Option IntervalDyadic := segment 143 values0711

theorem block0711_domain : ExactDomain block0711 143 175 := by
  simpa only [values0711_size] using segment_domain 143 values0711

theorem block0711_get (i : Fin 32) :
    block0711 (143 + i.val) = some (values0711[i.val]'(by rw [values0711_size]; exact i.isLt)) := by
  exact segment_get 143 values0711 ⟨i.val, by rw [values0711_size]; exact i.isLt⟩

def values0712 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0712.coefficient48_175,
  OriginalRow227TriangleData0712.coefficient48_176,
  OriginalRow227TriangleData0712.coefficient48_177,
  OriginalRow227TriangleData0712.coefficient48_178,
  OriginalRow227TriangleData0712.coefficient48_179,
  OriginalRow227TriangleData0712.coefficient48_180,
  OriginalRow227TriangleData0712.coefficient48_181,
  OriginalRow227TriangleData0712.coefficient48_182,
  OriginalRow227TriangleData0712.coefficient48_183,
  OriginalRow227TriangleData0712.coefficient48_184,
  OriginalRow227TriangleData0712.coefficient48_185,
  OriginalRow227TriangleData0712.coefficient48_186,
  OriginalRow227TriangleData0712.coefficient48_187,
  OriginalRow227TriangleData0712.coefficient48_188,
  OriginalRow227TriangleData0712.coefficient48_189,
  OriginalRow227TriangleData0712.coefficient48_190,
  OriginalRow227TriangleData0712.coefficient48_191,
  OriginalRow227TriangleData0712.coefficient48_192,
  OriginalRow227TriangleData0712.coefficient48_193,
  OriginalRow227TriangleData0712.coefficient48_194,
  OriginalRow227TriangleData0712.coefficient48_195,
  OriginalRow227TriangleData0712.coefficient48_196,
  OriginalRow227TriangleData0712.coefficient48_197,
  OriginalRow227TriangleData0712.coefficient48_198,
  OriginalRow227TriangleData0712.coefficient48_199,
  OriginalRow227TriangleData0712.coefficient48_200,
  OriginalRow227TriangleData0712.coefficient48_201,
  OriginalRow227TriangleData0712.coefficient48_202,
  OriginalRow227TriangleData0712.coefficient48_203,
  OriginalRow227TriangleData0712.coefficient48_204,
  OriginalRow227TriangleData0712.coefficient48_205,
  OriginalRow227TriangleData0712.coefficient48_206
]

theorem values0712_size : values0712.size = 32 := rfl

def block0712 : ℕ → Option IntervalDyadic := segment 175 values0712

theorem block0712_domain : ExactDomain block0712 175 207 := by
  simpa only [values0712_size] using segment_domain 175 values0712

theorem block0712_get (i : Fin 32) :
    block0712 (175 + i.val) = some (values0712[i.val]'(by rw [values0712_size]; exact i.isLt)) := by
  exact segment_get 175 values0712 ⟨i.val, by rw [values0712_size]; exact i.isLt⟩

def values0713 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0713.coefficient48_207,
  OriginalRow227TriangleData0713.coefficient48_208,
  OriginalRow227TriangleData0713.coefficient48_209,
  OriginalRow227TriangleData0713.coefficient48_210,
  OriginalRow227TriangleData0713.coefficient48_211,
  OriginalRow227TriangleData0713.coefficient48_212,
  OriginalRow227TriangleData0713.coefficient48_213,
  OriginalRow227TriangleData0713.coefficient48_214,
  OriginalRow227TriangleData0713.coefficient48_215,
  OriginalRow227TriangleData0713.coefficient48_216,
  OriginalRow227TriangleData0713.coefficient48_217,
  OriginalRow227TriangleData0713.coefficient48_218,
  OriginalRow227TriangleData0713.coefficient48_219,
  OriginalRow227TriangleData0713.coefficient48_220,
  OriginalRow227TriangleData0713.coefficient48_221,
  OriginalRow227TriangleData0713.coefficient48_222,
  OriginalRow227TriangleData0713.coefficient48_223,
  OriginalRow227TriangleData0713.coefficient48_224,
  OriginalRow227TriangleData0713.coefficient48_225,
  OriginalRow227TriangleData0713.coefficient48_226,
  OriginalRow227TriangleData0713.coefficient48_227,
  OriginalRow227TriangleData0713.coefficient48_228,
  OriginalRow227TriangleData0713.coefficient48_229,
  OriginalRow227TriangleData0713.coefficient48_230,
  OriginalRow227TriangleData0713.coefficient48_231,
  OriginalRow227TriangleData0713.coefficient48_232,
  OriginalRow227TriangleData0713.coefficient48_233,
  OriginalRow227TriangleData0713.coefficient48_234,
  OriginalRow227TriangleData0713.coefficient48_235,
  OriginalRow227TriangleData0713.coefficient48_236,
  OriginalRow227TriangleData0713.coefficient48_237,
  OriginalRow227TriangleData0713.coefficient48_238
]

theorem values0713_size : values0713.size = 32 := rfl

def block0713 : ℕ → Option IntervalDyadic := segment 207 values0713

theorem block0713_domain : ExactDomain block0713 207 239 := by
  simpa only [values0713_size] using segment_domain 207 values0713

theorem block0713_get (i : Fin 32) :
    block0713 (207 + i.val) = some (values0713[i.val]'(by rw [values0713_size]; exact i.isLt)) := by
  exact segment_get 207 values0713 ⟨i.val, by rw [values0713_size]; exact i.isLt⟩

def values0714 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0714.coefficient48_239,
  OriginalRow227TriangleData0714.coefficient48_240,
  OriginalRow227TriangleData0714.coefficient48_241,
  OriginalRow227TriangleData0714.coefficient48_242,
  OriginalRow227TriangleData0714.coefficient48_243,
  OriginalRow227TriangleData0714.coefficient48_244,
  OriginalRow227TriangleData0714.coefficient48_245,
  OriginalRow227TriangleData0714.coefficient48_246,
  OriginalRow227TriangleData0714.coefficient48_247,
  OriginalRow227TriangleData0714.coefficient48_248,
  OriginalRow227TriangleData0714.coefficient48_249,
  OriginalRow227TriangleData0714.coefficient48_250,
  OriginalRow227TriangleData0714.coefficient48_251,
  OriginalRow227TriangleData0714.coefficient48_252,
  OriginalRow227TriangleData0714.coefficient48_253,
  OriginalRow227TriangleData0714.coefficient48_254,
  OriginalRow227TriangleData0714.coefficient48_255,
  OriginalRow227TriangleData0714.coefficient48_256,
  OriginalRow227TriangleData0714.coefficient48_257,
  OriginalRow227TriangleData0714.coefficient48_258,
  OriginalRow227TriangleData0714.coefficient48_259,
  OriginalRow227TriangleData0714.coefficient48_260,
  OriginalRow227TriangleData0714.coefficient48_261,
  OriginalRow227TriangleData0714.coefficient48_262,
  OriginalRow227TriangleData0714.coefficient48_263,
  OriginalRow227TriangleData0714.coefficient48_264,
  OriginalRow227TriangleData0714.coefficient48_265,
  OriginalRow227TriangleData0714.coefficient48_266,
  OriginalRow227TriangleData0714.coefficient48_267,
  OriginalRow227TriangleData0714.coefficient48_268,
  OriginalRow227TriangleData0714.coefficient48_269,
  OriginalRow227TriangleData0714.coefficient48_270
]

theorem values0714_size : values0714.size = 32 := rfl

def block0714 : ℕ → Option IntervalDyadic := segment 239 values0714

theorem block0714_domain : ExactDomain block0714 239 271 := by
  simpa only [values0714_size] using segment_domain 239 values0714

theorem block0714_get (i : Fin 32) :
    block0714 (239 + i.val) = some (values0714[i.val]'(by rw [values0714_size]; exact i.isLt)) := by
  exact segment_get 239 values0714 ⟨i.val, by rw [values0714_size]; exact i.isLt⟩

def values0715 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0715.coefficient48_271,
  OriginalRow227TriangleData0715.coefficient48_272,
  OriginalRow227TriangleData0715.coefficient48_273,
  OriginalRow227TriangleData0715.coefficient48_274,
  OriginalRow227TriangleData0715.coefficient48_275,
  OriginalRow227TriangleData0715.coefficient48_276,
  OriginalRow227TriangleData0715.coefficient48_277,
  OriginalRow227TriangleData0715.coefficient48_278,
  OriginalRow227TriangleData0715.coefficient48_279,
  OriginalRow227TriangleData0715.coefficient48_280,
  OriginalRow227TriangleData0715.coefficient48_281,
  OriginalRow227TriangleData0715.coefficient48_282,
  OriginalRow227TriangleData0715.coefficient48_283,
  OriginalRow227TriangleData0715.coefficient48_284,
  OriginalRow227TriangleData0715.coefficient48_285,
  OriginalRow227TriangleData0715.coefficient48_286,
  OriginalRow227TriangleData0715.coefficient48_287,
  OriginalRow227TriangleData0715.coefficient48_288,
  OriginalRow227TriangleData0715.coefficient48_289,
  OriginalRow227TriangleData0715.coefficient48_290,
  OriginalRow227TriangleData0715.coefficient48_291,
  OriginalRow227TriangleData0715.coefficient48_292,
  OriginalRow227TriangleData0715.coefficient48_293,
  OriginalRow227TriangleData0715.coefficient48_294,
  OriginalRow227TriangleData0715.coefficient48_295,
  OriginalRow227TriangleData0715.coefficient48_296,
  OriginalRow227TriangleData0715.coefficient48_297,
  OriginalRow227TriangleData0715.coefficient48_298,
  OriginalRow227TriangleData0715.coefficient48_299,
  OriginalRow227TriangleData0715.coefficient48_300,
  OriginalRow227TriangleData0715.coefficient48_301,
  OriginalRow227TriangleData0715.coefficient48_302
]

theorem values0715_size : values0715.size = 32 := rfl

def block0715 : ℕ → Option IntervalDyadic := segment 271 values0715

theorem block0715_domain : ExactDomain block0715 271 303 := by
  simpa only [values0715_size] using segment_domain 271 values0715

theorem block0715_get (i : Fin 32) :
    block0715 (271 + i.val) = some (values0715[i.val]'(by rw [values0715_size]; exact i.isLt)) := by
  exact segment_get 271 values0715 ⟨i.val, by rw [values0715_size]; exact i.isLt⟩

def values0716 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0716.coefficient48_303,
  OriginalRow227TriangleData0716.coefficient48_304,
  OriginalRow227TriangleData0716.coefficient48_305,
  OriginalRow227TriangleData0716.coefficient48_306,
  OriginalRow227TriangleData0716.coefficient48_307,
  OriginalRow227TriangleData0716.coefficient48_308,
  OriginalRow227TriangleData0716.coefficient48_309,
  OriginalRow227TriangleData0716.coefficient48_310,
  OriginalRow227TriangleData0716.coefficient48_311,
  OriginalRow227TriangleData0716.coefficient48_312,
  OriginalRow227TriangleData0716.coefficient48_313,
  OriginalRow227TriangleData0716.coefficient48_314,
  OriginalRow227TriangleData0716.coefficient48_315,
  OriginalRow227TriangleData0716.coefficient48_316,
  OriginalRow227TriangleData0716.coefficient48_317,
  OriginalRow227TriangleData0716.coefficient48_318,
  OriginalRow227TriangleData0716.coefficient48_319,
  OriginalRow227TriangleData0716.coefficient48_320,
  OriginalRow227TriangleData0716.coefficient48_321,
  OriginalRow227TriangleData0716.coefficient48_322,
  OriginalRow227TriangleData0716.coefficient48_323,
  OriginalRow227TriangleData0716.coefficient48_324,
  OriginalRow227TriangleData0716.coefficient48_325,
  OriginalRow227TriangleData0716.coefficient48_326,
  OriginalRow227TriangleData0716.coefficient48_327,
  OriginalRow227TriangleData0716.coefficient48_328,
  OriginalRow227TriangleData0716.coefficient48_329,
  OriginalRow227TriangleData0716.coefficient48_330,
  OriginalRow227TriangleData0716.coefficient48_331,
  OriginalRow227TriangleData0716.coefficient48_332,
  OriginalRow227TriangleData0716.coefficient48_333,
  OriginalRow227TriangleData0716.coefficient48_334
]

theorem values0716_size : values0716.size = 32 := rfl

def block0716 : ℕ → Option IntervalDyadic := segment 303 values0716

theorem block0716_domain : ExactDomain block0716 303 335 := by
  simpa only [values0716_size] using segment_domain 303 values0716

theorem block0716_get (i : Fin 32) :
    block0716 (303 + i.val) = some (values0716[i.val]'(by rw [values0716_size]; exact i.isLt)) := by
  exact segment_get 303 values0716 ⟨i.val, by rw [values0716_size]; exact i.isLt⟩

def values0717 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0717.coefficient48_335,
  OriginalRow227TriangleData0717.coefficient48_336,
  OriginalRow227TriangleData0717.coefficient48_337,
  OriginalRow227TriangleData0717.coefficient48_338,
  OriginalRow227TriangleData0717.coefficient48_339,
  OriginalRow227TriangleData0717.coefficient48_340,
  OriginalRow227TriangleData0717.coefficient48_341,
  OriginalRow227TriangleData0717.coefficient48_342,
  OriginalRow227TriangleData0717.coefficient48_343,
  OriginalRow227TriangleData0717.coefficient48_344,
  OriginalRow227TriangleData0717.coefficient48_345,
  OriginalRow227TriangleData0717.coefficient48_346,
  OriginalRow227TriangleData0717.coefficient48_347,
  OriginalRow227TriangleData0717.coefficient48_348,
  OriginalRow227TriangleData0717.coefficient48_349,
  OriginalRow227TriangleData0717.coefficient48_350,
  OriginalRow227TriangleData0717.coefficient48_351,
  OriginalRow227TriangleData0717.coefficient48_352,
  OriginalRow227TriangleData0717.coefficient48_353,
  OriginalRow227TriangleData0717.coefficient48_354,
  OriginalRow227TriangleData0717.coefficient48_355,
  OriginalRow227TriangleData0717.coefficient48_356,
  OriginalRow227TriangleData0717.coefficient48_357,
  OriginalRow227TriangleData0717.coefficient48_358,
  OriginalRow227TriangleData0717.coefficient48_359,
  OriginalRow227TriangleData0717.coefficient48_360,
  OriginalRow227TriangleData0717.coefficient48_361,
  OriginalRow227TriangleData0717.coefficient48_362,
  OriginalRow227TriangleData0717.coefficient48_363,
  OriginalRow227TriangleData0717.coefficient48_364,
  OriginalRow227TriangleData0717.coefficient48_365,
  OriginalRow227TriangleData0717.coefficient48_366
]

theorem values0717_size : values0717.size = 32 := rfl

def block0717 : ℕ → Option IntervalDyadic := segment 335 values0717

theorem block0717_domain : ExactDomain block0717 335 367 := by
  simpa only [values0717_size] using segment_domain 335 values0717

theorem block0717_get (i : Fin 32) :
    block0717 (335 + i.val) = some (values0717[i.val]'(by rw [values0717_size]; exact i.isLt)) := by
  exact segment_get 335 values0717 ⟨i.val, by rw [values0717_size]; exact i.isLt⟩

def values0718 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0718.coefficient48_367,
  OriginalRow227TriangleData0718.coefficient48_368,
  OriginalRow227TriangleData0718.coefficient48_369,
  OriginalRow227TriangleData0718.coefficient48_370,
  OriginalRow227TriangleData0718.coefficient48_371,
  OriginalRow227TriangleData0718.coefficient48_372,
  OriginalRow227TriangleData0718.coefficient48_373,
  OriginalRow227TriangleData0718.coefficient48_374,
  OriginalRow227TriangleData0718.coefficient48_375,
  OriginalRow227TriangleData0718.coefficient48_376,
  OriginalRow227TriangleData0718.coefficient48_377,
  OriginalRow227TriangleData0718.coefficient48_378,
  OriginalRow227TriangleData0718.coefficient48_379,
  OriginalRow227TriangleData0718.coefficient48_380,
  OriginalRow227TriangleData0718.coefficient48_381,
  OriginalRow227TriangleData0718.coefficient48_382,
  OriginalRow227TriangleData0718.coefficient48_383,
  OriginalRow227TriangleData0718.coefficient48_384,
  OriginalRow227TriangleData0718.coefficient48_385,
  OriginalRow227TriangleData0718.coefficient48_386,
  OriginalRow227TriangleData0718.coefficient48_387,
  OriginalRow227TriangleData0718.coefficient48_388,
  OriginalRow227TriangleData0718.coefficient48_389,
  OriginalRow227TriangleData0718.coefficient48_390,
  OriginalRow227TriangleData0718.coefficient48_391,
  OriginalRow227TriangleData0718.coefficient48_392,
  OriginalRow227TriangleData0718.coefficient48_393,
  OriginalRow227TriangleData0718.coefficient48_394,
  OriginalRow227TriangleData0718.coefficient48_395,
  OriginalRow227TriangleData0718.coefficient48_396,
  OriginalRow227TriangleData0718.coefficient48_397,
  OriginalRow227TriangleData0718.coefficient48_398
]

theorem values0718_size : values0718.size = 32 := rfl

def block0718 : ℕ → Option IntervalDyadic := segment 367 values0718

theorem block0718_domain : ExactDomain block0718 367 399 := by
  simpa only [values0718_size] using segment_domain 367 values0718

theorem block0718_get (i : Fin 32) :
    block0718 (367 + i.val) = some (values0718[i.val]'(by rw [values0718_size]; exact i.isLt)) := by
  exact segment_get 367 values0718 ⟨i.val, by rw [values0718_size]; exact i.isLt⟩

def values0719 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0719.coefficient48_399,
  OriginalRow227TriangleData0719.coefficient48_400,
  OriginalRow227TriangleData0719.coefficient48_401,
  OriginalRow227TriangleData0719.coefficient48_402,
  OriginalRow227TriangleData0719.coefficient48_403,
  OriginalRow227TriangleData0719.coefficient48_404,
  OriginalRow227TriangleData0719.coefficient48_405,
  OriginalRow227TriangleData0719.coefficient48_406,
  OriginalRow227TriangleData0719.coefficient48_407,
  OriginalRow227TriangleData0719.coefficient48_408,
  OriginalRow227TriangleData0719.coefficient48_409,
  OriginalRow227TriangleData0719.coefficient48_410,
  OriginalRow227TriangleData0719.coefficient48_411,
  OriginalRow227TriangleData0719.coefficient48_412,
  OriginalRow227TriangleData0719.coefficient48_413,
  OriginalRow227TriangleData0719.coefficient48_414,
  OriginalRow227TriangleData0719.coefficient48_415,
  OriginalRow227TriangleData0719.coefficient48_416,
  OriginalRow227TriangleData0719.coefficient48_417,
  OriginalRow227TriangleData0719.coefficient48_418,
  OriginalRow227TriangleData0719.coefficient48_419,
  OriginalRow227TriangleData0719.coefficient48_420,
  OriginalRow227TriangleData0719.coefficient48_421,
  OriginalRow227TriangleData0719.coefficient48_422,
  OriginalRow227TriangleData0719.coefficient48_423,
  OriginalRow227TriangleData0719.coefficient48_424,
  OriginalRow227TriangleData0719.coefficient48_425,
  OriginalRow227TriangleData0719.coefficient48_426,
  OriginalRow227TriangleData0719.coefficient48_427,
  OriginalRow227TriangleData0719.coefficient48_428,
  OriginalRow227TriangleData0719.coefficient48_429,
  OriginalRow227TriangleData0719.coefficient48_430
]

theorem values0719_size : values0719.size = 32 := rfl

def block0719 : ℕ → Option IntervalDyadic := segment 399 values0719

theorem block0719_domain : ExactDomain block0719 399 431 := by
  simpa only [values0719_size] using segment_domain 399 values0719

theorem block0719_get (i : Fin 32) :
    block0719 (399 + i.val) = some (values0719[i.val]'(by rw [values0719_size]; exact i.isLt)) := by
  exact segment_get 399 values0719 ⟨i.val, by rw [values0719_size]; exact i.isLt⟩

def values0720 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0720.coefficient48_431,
  OriginalRow227TriangleData0720.coefficient48_432,
  OriginalRow227TriangleData0720.coefficient48_433,
  OriginalRow227TriangleData0720.coefficient48_434,
  OriginalRow227TriangleData0720.coefficient48_435,
  OriginalRow227TriangleData0720.coefficient48_436,
  OriginalRow227TriangleData0720.coefficient48_437,
  OriginalRow227TriangleData0720.coefficient48_438,
  OriginalRow227TriangleData0720.coefficient48_439,
  OriginalRow227TriangleData0720.coefficient48_440,
  OriginalRow227TriangleData0720.coefficient48_441,
  OriginalRow227TriangleData0720.coefficient48_442,
  OriginalRow227TriangleData0720.coefficient48_443,
  OriginalRow227TriangleData0720.coefficient48_444,
  OriginalRow227TriangleData0720.coefficient48_445,
  OriginalRow227TriangleData0720.coefficient48_446,
  OriginalRow227TriangleData0720.coefficient48_447,
  OriginalRow227TriangleData0720.coefficient48_448,
  OriginalRow227TriangleData0720.coefficient48_449,
  OriginalRow227TriangleData0720.coefficient48_450,
  OriginalRow227TriangleData0720.coefficient48_451,
  OriginalRow227TriangleData0720.coefficient48_452,
  OriginalRow227TriangleData0720.coefficient48_453
]

theorem values0720_size : values0720.size = 23 := rfl

def block0720 : ℕ → Option IntervalDyadic := segment 431 values0720

theorem block0720_domain : ExactDomain block0720 431 454 := by
  simpa only [values0720_size] using segment_domain 431 values0720

theorem block0720_get (i : Fin 23) :
    block0720 (431 + i.val) = some (values0720[i.val]'(by rw [values0720_size]; exact i.isLt)) := by
  exact segment_get 431 values0720 ⟨i.val, by rw [values0720_size]; exact i.isLt⟩

def node0079_0143 : ℕ → Option IntervalDyadic := split 111 block0709 block0710

theorem node0079_0143_domain : ExactDomain node0079_0143 79 143 := by
  exact split_domain (by decide) (by decide) block0709_domain block0710_domain

def node0047_0143 : ℕ → Option IntervalDyadic := split 79 block0708 node0079_0143

theorem node0047_0143_domain : ExactDomain node0047_0143 47 143 := by
  exact split_domain (by decide) (by decide) block0708_domain node0079_0143_domain

def node0175_0239 : ℕ → Option IntervalDyadic := split 207 block0712 block0713

theorem node0175_0239_domain : ExactDomain node0175_0239 175 239 := by
  exact split_domain (by decide) (by decide) block0712_domain block0713_domain

def node0143_0239 : ℕ → Option IntervalDyadic := split 175 block0711 node0175_0239

theorem node0143_0239_domain : ExactDomain node0143_0239 143 239 := by
  exact split_domain (by decide) (by decide) block0711_domain node0175_0239_domain

def node0047_0239 : ℕ → Option IntervalDyadic := split 143 node0047_0143 node0143_0239

theorem node0047_0239_domain : ExactDomain node0047_0239 47 239 := by
  exact split_domain (by decide) (by decide) node0047_0143_domain node0143_0239_domain

def node0271_0335 : ℕ → Option IntervalDyadic := split 303 block0715 block0716

theorem node0271_0335_domain : ExactDomain node0271_0335 271 335 := by
  exact split_domain (by decide) (by decide) block0715_domain block0716_domain

def node0239_0335 : ℕ → Option IntervalDyadic := split 271 block0714 node0271_0335

theorem node0239_0335_domain : ExactDomain node0239_0335 239 335 := by
  exact split_domain (by decide) (by decide) block0714_domain node0271_0335_domain

def node0335_0399 : ℕ → Option IntervalDyadic := split 367 block0717 block0718

theorem node0335_0399_domain : ExactDomain node0335_0399 335 399 := by
  exact split_domain (by decide) (by decide) block0717_domain block0718_domain

def node0399_0454 : ℕ → Option IntervalDyadic := split 431 block0719 block0720

theorem node0399_0454_domain : ExactDomain node0399_0454 399 454 := by
  exact split_domain (by decide) (by decide) block0719_domain block0720_domain

def node0335_0454 : ℕ → Option IntervalDyadic := split 399 node0335_0399 node0399_0454

theorem node0335_0454_domain : ExactDomain node0335_0454 335 454 := by
  exact split_domain (by decide) (by decide) node0335_0399_domain node0399_0454_domain

def node0239_0454 : ℕ → Option IntervalDyadic := split 335 node0239_0335 node0335_0454

theorem node0239_0454_domain : ExactDomain node0239_0454 239 454 := by
  exact split_domain (by decide) (by decide) node0239_0335_domain node0335_0454_domain

def node0047_0454 : ℕ → Option IntervalDyadic := split 239 node0047_0239 node0239_0454

theorem node0047_0454_domain : ExactDomain node0047_0454 47 454 := by
  exact split_domain (by decide) (by decide) node0047_0239_domain node0239_0454_domain

def lookup : ℕ → Option IntervalDyadic := node0047_0454

theorem lookup_domain : ExactDomain lookup 47 454 :=
  node0047_0454_domain

theorem block0708_lookup (i : Fin 32) :
    lookup (47 + i.val) = some (values0708[i.val]'(by rw [values0708_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (47 + i.val) = _
  rw [node0047_0454, split_left 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0047_0239, split_left 143 node0047_0143 node0143_0239 (by omega)]
  rw [node0047_0143, split_left 79 block0708 node0079_0143 (by omega)]
  exact block0708_get i

theorem block0709_lookup (i : Fin 32) :
    lookup (79 + i.val) = some (values0709[i.val]'(by rw [values0709_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (79 + i.val) = _
  rw [node0047_0454, split_left 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0047_0239, split_left 143 node0047_0143 node0143_0239 (by omega)]
  rw [node0047_0143, split_right 79 block0708 node0079_0143 (by omega)]
  rw [node0079_0143, split_left 111 block0709 block0710 (by omega)]
  exact block0709_get i

theorem block0710_lookup (i : Fin 32) :
    lookup (111 + i.val) = some (values0710[i.val]'(by rw [values0710_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (111 + i.val) = _
  rw [node0047_0454, split_left 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0047_0239, split_left 143 node0047_0143 node0143_0239 (by omega)]
  rw [node0047_0143, split_right 79 block0708 node0079_0143 (by omega)]
  rw [node0079_0143, split_right 111 block0709 block0710 (by omega)]
  exact block0710_get i

theorem block0711_lookup (i : Fin 32) :
    lookup (143 + i.val) = some (values0711[i.val]'(by rw [values0711_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (143 + i.val) = _
  rw [node0047_0454, split_left 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0047_0239, split_right 143 node0047_0143 node0143_0239 (by omega)]
  rw [node0143_0239, split_left 175 block0711 node0175_0239 (by omega)]
  exact block0711_get i

theorem block0712_lookup (i : Fin 32) :
    lookup (175 + i.val) = some (values0712[i.val]'(by rw [values0712_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (175 + i.val) = _
  rw [node0047_0454, split_left 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0047_0239, split_right 143 node0047_0143 node0143_0239 (by omega)]
  rw [node0143_0239, split_right 175 block0711 node0175_0239 (by omega)]
  rw [node0175_0239, split_left 207 block0712 block0713 (by omega)]
  exact block0712_get i

theorem block0713_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values0713[i.val]'(by rw [values0713_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (207 + i.val) = _
  rw [node0047_0454, split_left 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0047_0239, split_right 143 node0047_0143 node0143_0239 (by omega)]
  rw [node0143_0239, split_right 175 block0711 node0175_0239 (by omega)]
  rw [node0175_0239, split_right 207 block0712 block0713 (by omega)]
  exact block0713_get i

theorem block0714_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values0714[i.val]'(by rw [values0714_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (239 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_left 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0239_0335, split_left 271 block0714 node0271_0335 (by omega)]
  exact block0714_get i

theorem block0715_lookup (i : Fin 32) :
    lookup (271 + i.val) = some (values0715[i.val]'(by rw [values0715_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (271 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_left 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0239_0335, split_right 271 block0714 node0271_0335 (by omega)]
  rw [node0271_0335, split_left 303 block0715 block0716 (by omega)]
  exact block0715_get i

theorem block0716_lookup (i : Fin 32) :
    lookup (303 + i.val) = some (values0716[i.val]'(by rw [values0716_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (303 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_left 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0239_0335, split_right 271 block0714 node0271_0335 (by omega)]
  rw [node0271_0335, split_right 303 block0715 block0716 (by omega)]
  exact block0716_get i

theorem block0717_lookup (i : Fin 32) :
    lookup (335 + i.val) = some (values0717[i.val]'(by rw [values0717_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (335 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_right 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0335_0454, split_left 399 node0335_0399 node0399_0454 (by omega)]
  rw [node0335_0399, split_left 367 block0717 block0718 (by omega)]
  exact block0717_get i

theorem block0718_lookup (i : Fin 32) :
    lookup (367 + i.val) = some (values0718[i.val]'(by rw [values0718_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (367 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_right 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0335_0454, split_left 399 node0335_0399 node0399_0454 (by omega)]
  rw [node0335_0399, split_right 367 block0717 block0718 (by omega)]
  exact block0718_get i

theorem block0719_lookup (i : Fin 32) :
    lookup (399 + i.val) = some (values0719[i.val]'(by rw [values0719_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (399 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_right 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0335_0454, split_right 399 node0335_0399 node0399_0454 (by omega)]
  rw [node0399_0454, split_left 431 block0719 block0720 (by omega)]
  exact block0719_get i

theorem block0720_lookup (i : Fin 23) :
    lookup (431 + i.val) = some (values0720[i.val]'(by rw [values0720_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0047_0454 (431 + i.val) = _
  rw [node0047_0454, split_right 239 node0047_0239 node0239_0454 (by omega)]
  rw [node0239_0454, split_right 335 node0239_0335 node0335_0454 (by omega)]
  rw [node0335_0454, split_right 399 node0335_0399 node0399_0454 (by omega)]
  rw [node0399_0454, split_right 431 block0719 block0720 (by omega)]
  exact block0720_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0708_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0708_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0709_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0709_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0710_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0710_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0711_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0711_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0712_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0712_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0713_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0713_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0714_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0714_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0715_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0715_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0716_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0716_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0717_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0717_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0718_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0718_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0719_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0719_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0720_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0720_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0708_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0709_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0710_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0711_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0712_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0713_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0714_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0715_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0716_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0717_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0718_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0719_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow048.block0720_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow048
