import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0773
import Grothe.UpperChaos.OriginalRow227TriangleData0774
import Grothe.UpperChaos.OriginalRow227TriangleData0775
import Grothe.UpperChaos.OriginalRow227TriangleData0776
import Grothe.UpperChaos.OriginalRow227TriangleData0777
import Grothe.UpperChaos.OriginalRow227TriangleData0778
import Grothe.UpperChaos.OriginalRow227TriangleData0779
import Grothe.UpperChaos.OriginalRow227TriangleData0780
import Grothe.UpperChaos.OriginalRow227TriangleData0781
import Grothe.UpperChaos.OriginalRow227TriangleData0782
import Grothe.UpperChaos.OriginalRow227TriangleData0783
import Grothe.UpperChaos.OriginalRow227TriangleData0784
import Grothe.UpperChaos.OriginalRow227TriangleData0785

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow053

open ConditionalTableLookup

def values0773 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0773.coefficient53_52,
  OriginalRow227TriangleData0773.coefficient53_53,
  OriginalRow227TriangleData0773.coefficient53_54,
  OriginalRow227TriangleData0773.coefficient53_55,
  OriginalRow227TriangleData0773.coefficient53_56,
  OriginalRow227TriangleData0773.coefficient53_57,
  OriginalRow227TriangleData0773.coefficient53_58,
  OriginalRow227TriangleData0773.coefficient53_59,
  OriginalRow227TriangleData0773.coefficient53_60,
  OriginalRow227TriangleData0773.coefficient53_61,
  OriginalRow227TriangleData0773.coefficient53_62,
  OriginalRow227TriangleData0773.coefficient53_63,
  OriginalRow227TriangleData0773.coefficient53_64,
  OriginalRow227TriangleData0773.coefficient53_65,
  OriginalRow227TriangleData0773.coefficient53_66,
  OriginalRow227TriangleData0773.coefficient53_67,
  OriginalRow227TriangleData0773.coefficient53_68,
  OriginalRow227TriangleData0773.coefficient53_69,
  OriginalRow227TriangleData0773.coefficient53_70,
  OriginalRow227TriangleData0773.coefficient53_71,
  OriginalRow227TriangleData0773.coefficient53_72,
  OriginalRow227TriangleData0773.coefficient53_73,
  OriginalRow227TriangleData0773.coefficient53_74,
  OriginalRow227TriangleData0773.coefficient53_75,
  OriginalRow227TriangleData0773.coefficient53_76,
  OriginalRow227TriangleData0773.coefficient53_77,
  OriginalRow227TriangleData0773.coefficient53_78,
  OriginalRow227TriangleData0773.coefficient53_79,
  OriginalRow227TriangleData0773.coefficient53_80,
  OriginalRow227TriangleData0773.coefficient53_81,
  OriginalRow227TriangleData0773.coefficient53_82,
  OriginalRow227TriangleData0773.coefficient53_83
]

theorem values0773_size : values0773.size = 32 := rfl

def block0773 : ℕ → Option IntervalDyadic := segment 52 values0773

theorem block0773_domain : ExactDomain block0773 52 84 := by
  simpa only [values0773_size] using segment_domain 52 values0773

theorem block0773_get (i : Fin 32) :
    block0773 (52 + i.val) = some (values0773[i.val]'(by rw [values0773_size]; exact i.isLt)) := by
  exact segment_get 52 values0773 ⟨i.val, by rw [values0773_size]; exact i.isLt⟩

def values0774 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0774.coefficient53_84,
  OriginalRow227TriangleData0774.coefficient53_85,
  OriginalRow227TriangleData0774.coefficient53_86,
  OriginalRow227TriangleData0774.coefficient53_87,
  OriginalRow227TriangleData0774.coefficient53_88,
  OriginalRow227TriangleData0774.coefficient53_89,
  OriginalRow227TriangleData0774.coefficient53_90,
  OriginalRow227TriangleData0774.coefficient53_91,
  OriginalRow227TriangleData0774.coefficient53_92,
  OriginalRow227TriangleData0774.coefficient53_93,
  OriginalRow227TriangleData0774.coefficient53_94,
  OriginalRow227TriangleData0774.coefficient53_95,
  OriginalRow227TriangleData0774.coefficient53_96,
  OriginalRow227TriangleData0774.coefficient53_97,
  OriginalRow227TriangleData0774.coefficient53_98,
  OriginalRow227TriangleData0774.coefficient53_99,
  OriginalRow227TriangleData0774.coefficient53_100,
  OriginalRow227TriangleData0774.coefficient53_101,
  OriginalRow227TriangleData0774.coefficient53_102,
  OriginalRow227TriangleData0774.coefficient53_103,
  OriginalRow227TriangleData0774.coefficient53_104,
  OriginalRow227TriangleData0774.coefficient53_105,
  OriginalRow227TriangleData0774.coefficient53_106,
  OriginalRow227TriangleData0774.coefficient53_107,
  OriginalRow227TriangleData0774.coefficient53_108,
  OriginalRow227TriangleData0774.coefficient53_109,
  OriginalRow227TriangleData0774.coefficient53_110,
  OriginalRow227TriangleData0774.coefficient53_111,
  OriginalRow227TriangleData0774.coefficient53_112,
  OriginalRow227TriangleData0774.coefficient53_113,
  OriginalRow227TriangleData0774.coefficient53_114,
  OriginalRow227TriangleData0774.coefficient53_115
]

theorem values0774_size : values0774.size = 32 := rfl

def block0774 : ℕ → Option IntervalDyadic := segment 84 values0774

theorem block0774_domain : ExactDomain block0774 84 116 := by
  simpa only [values0774_size] using segment_domain 84 values0774

theorem block0774_get (i : Fin 32) :
    block0774 (84 + i.val) = some (values0774[i.val]'(by rw [values0774_size]; exact i.isLt)) := by
  exact segment_get 84 values0774 ⟨i.val, by rw [values0774_size]; exact i.isLt⟩

def values0775 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0775.coefficient53_116,
  OriginalRow227TriangleData0775.coefficient53_117,
  OriginalRow227TriangleData0775.coefficient53_118,
  OriginalRow227TriangleData0775.coefficient53_119,
  OriginalRow227TriangleData0775.coefficient53_120,
  OriginalRow227TriangleData0775.coefficient53_121,
  OriginalRow227TriangleData0775.coefficient53_122,
  OriginalRow227TriangleData0775.coefficient53_123,
  OriginalRow227TriangleData0775.coefficient53_124,
  OriginalRow227TriangleData0775.coefficient53_125,
  OriginalRow227TriangleData0775.coefficient53_126,
  OriginalRow227TriangleData0775.coefficient53_127,
  OriginalRow227TriangleData0775.coefficient53_128,
  OriginalRow227TriangleData0775.coefficient53_129,
  OriginalRow227TriangleData0775.coefficient53_130,
  OriginalRow227TriangleData0775.coefficient53_131,
  OriginalRow227TriangleData0775.coefficient53_132,
  OriginalRow227TriangleData0775.coefficient53_133,
  OriginalRow227TriangleData0775.coefficient53_134,
  OriginalRow227TriangleData0775.coefficient53_135,
  OriginalRow227TriangleData0775.coefficient53_136,
  OriginalRow227TriangleData0775.coefficient53_137,
  OriginalRow227TriangleData0775.coefficient53_138,
  OriginalRow227TriangleData0775.coefficient53_139,
  OriginalRow227TriangleData0775.coefficient53_140,
  OriginalRow227TriangleData0775.coefficient53_141,
  OriginalRow227TriangleData0775.coefficient53_142,
  OriginalRow227TriangleData0775.coefficient53_143,
  OriginalRow227TriangleData0775.coefficient53_144,
  OriginalRow227TriangleData0775.coefficient53_145,
  OriginalRow227TriangleData0775.coefficient53_146,
  OriginalRow227TriangleData0775.coefficient53_147
]

theorem values0775_size : values0775.size = 32 := rfl

def block0775 : ℕ → Option IntervalDyadic := segment 116 values0775

theorem block0775_domain : ExactDomain block0775 116 148 := by
  simpa only [values0775_size] using segment_domain 116 values0775

theorem block0775_get (i : Fin 32) :
    block0775 (116 + i.val) = some (values0775[i.val]'(by rw [values0775_size]; exact i.isLt)) := by
  exact segment_get 116 values0775 ⟨i.val, by rw [values0775_size]; exact i.isLt⟩

def values0776 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0776.coefficient53_148,
  OriginalRow227TriangleData0776.coefficient53_149,
  OriginalRow227TriangleData0776.coefficient53_150,
  OriginalRow227TriangleData0776.coefficient53_151,
  OriginalRow227TriangleData0776.coefficient53_152,
  OriginalRow227TriangleData0776.coefficient53_153,
  OriginalRow227TriangleData0776.coefficient53_154,
  OriginalRow227TriangleData0776.coefficient53_155,
  OriginalRow227TriangleData0776.coefficient53_156,
  OriginalRow227TriangleData0776.coefficient53_157,
  OriginalRow227TriangleData0776.coefficient53_158,
  OriginalRow227TriangleData0776.coefficient53_159,
  OriginalRow227TriangleData0776.coefficient53_160,
  OriginalRow227TriangleData0776.coefficient53_161,
  OriginalRow227TriangleData0776.coefficient53_162,
  OriginalRow227TriangleData0776.coefficient53_163,
  OriginalRow227TriangleData0776.coefficient53_164,
  OriginalRow227TriangleData0776.coefficient53_165,
  OriginalRow227TriangleData0776.coefficient53_166,
  OriginalRow227TriangleData0776.coefficient53_167,
  OriginalRow227TriangleData0776.coefficient53_168,
  OriginalRow227TriangleData0776.coefficient53_169,
  OriginalRow227TriangleData0776.coefficient53_170,
  OriginalRow227TriangleData0776.coefficient53_171,
  OriginalRow227TriangleData0776.coefficient53_172,
  OriginalRow227TriangleData0776.coefficient53_173,
  OriginalRow227TriangleData0776.coefficient53_174,
  OriginalRow227TriangleData0776.coefficient53_175,
  OriginalRow227TriangleData0776.coefficient53_176,
  OriginalRow227TriangleData0776.coefficient53_177,
  OriginalRow227TriangleData0776.coefficient53_178,
  OriginalRow227TriangleData0776.coefficient53_179
]

theorem values0776_size : values0776.size = 32 := rfl

def block0776 : ℕ → Option IntervalDyadic := segment 148 values0776

theorem block0776_domain : ExactDomain block0776 148 180 := by
  simpa only [values0776_size] using segment_domain 148 values0776

theorem block0776_get (i : Fin 32) :
    block0776 (148 + i.val) = some (values0776[i.val]'(by rw [values0776_size]; exact i.isLt)) := by
  exact segment_get 148 values0776 ⟨i.val, by rw [values0776_size]; exact i.isLt⟩

def values0777 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0777.coefficient53_180,
  OriginalRow227TriangleData0777.coefficient53_181,
  OriginalRow227TriangleData0777.coefficient53_182,
  OriginalRow227TriangleData0777.coefficient53_183,
  OriginalRow227TriangleData0777.coefficient53_184,
  OriginalRow227TriangleData0777.coefficient53_185,
  OriginalRow227TriangleData0777.coefficient53_186,
  OriginalRow227TriangleData0777.coefficient53_187,
  OriginalRow227TriangleData0777.coefficient53_188,
  OriginalRow227TriangleData0777.coefficient53_189,
  OriginalRow227TriangleData0777.coefficient53_190,
  OriginalRow227TriangleData0777.coefficient53_191,
  OriginalRow227TriangleData0777.coefficient53_192,
  OriginalRow227TriangleData0777.coefficient53_193,
  OriginalRow227TriangleData0777.coefficient53_194,
  OriginalRow227TriangleData0777.coefficient53_195,
  OriginalRow227TriangleData0777.coefficient53_196,
  OriginalRow227TriangleData0777.coefficient53_197,
  OriginalRow227TriangleData0777.coefficient53_198,
  OriginalRow227TriangleData0777.coefficient53_199,
  OriginalRow227TriangleData0777.coefficient53_200,
  OriginalRow227TriangleData0777.coefficient53_201,
  OriginalRow227TriangleData0777.coefficient53_202,
  OriginalRow227TriangleData0777.coefficient53_203,
  OriginalRow227TriangleData0777.coefficient53_204,
  OriginalRow227TriangleData0777.coefficient53_205,
  OriginalRow227TriangleData0777.coefficient53_206,
  OriginalRow227TriangleData0777.coefficient53_207,
  OriginalRow227TriangleData0777.coefficient53_208,
  OriginalRow227TriangleData0777.coefficient53_209,
  OriginalRow227TriangleData0777.coefficient53_210,
  OriginalRow227TriangleData0777.coefficient53_211
]

theorem values0777_size : values0777.size = 32 := rfl

def block0777 : ℕ → Option IntervalDyadic := segment 180 values0777

theorem block0777_domain : ExactDomain block0777 180 212 := by
  simpa only [values0777_size] using segment_domain 180 values0777

theorem block0777_get (i : Fin 32) :
    block0777 (180 + i.val) = some (values0777[i.val]'(by rw [values0777_size]; exact i.isLt)) := by
  exact segment_get 180 values0777 ⟨i.val, by rw [values0777_size]; exact i.isLt⟩

def values0778 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0778.coefficient53_212,
  OriginalRow227TriangleData0778.coefficient53_213,
  OriginalRow227TriangleData0778.coefficient53_214,
  OriginalRow227TriangleData0778.coefficient53_215,
  OriginalRow227TriangleData0778.coefficient53_216,
  OriginalRow227TriangleData0778.coefficient53_217,
  OriginalRow227TriangleData0778.coefficient53_218,
  OriginalRow227TriangleData0778.coefficient53_219,
  OriginalRow227TriangleData0778.coefficient53_220,
  OriginalRow227TriangleData0778.coefficient53_221,
  OriginalRow227TriangleData0778.coefficient53_222,
  OriginalRow227TriangleData0778.coefficient53_223,
  OriginalRow227TriangleData0778.coefficient53_224,
  OriginalRow227TriangleData0778.coefficient53_225,
  OriginalRow227TriangleData0778.coefficient53_226,
  OriginalRow227TriangleData0778.coefficient53_227,
  OriginalRow227TriangleData0778.coefficient53_228,
  OriginalRow227TriangleData0778.coefficient53_229,
  OriginalRow227TriangleData0778.coefficient53_230,
  OriginalRow227TriangleData0778.coefficient53_231,
  OriginalRow227TriangleData0778.coefficient53_232,
  OriginalRow227TriangleData0778.coefficient53_233,
  OriginalRow227TriangleData0778.coefficient53_234,
  OriginalRow227TriangleData0778.coefficient53_235,
  OriginalRow227TriangleData0778.coefficient53_236,
  OriginalRow227TriangleData0778.coefficient53_237,
  OriginalRow227TriangleData0778.coefficient53_238,
  OriginalRow227TriangleData0778.coefficient53_239,
  OriginalRow227TriangleData0778.coefficient53_240,
  OriginalRow227TriangleData0778.coefficient53_241,
  OriginalRow227TriangleData0778.coefficient53_242,
  OriginalRow227TriangleData0778.coefficient53_243
]

theorem values0778_size : values0778.size = 32 := rfl

def block0778 : ℕ → Option IntervalDyadic := segment 212 values0778

theorem block0778_domain : ExactDomain block0778 212 244 := by
  simpa only [values0778_size] using segment_domain 212 values0778

theorem block0778_get (i : Fin 32) :
    block0778 (212 + i.val) = some (values0778[i.val]'(by rw [values0778_size]; exact i.isLt)) := by
  exact segment_get 212 values0778 ⟨i.val, by rw [values0778_size]; exact i.isLt⟩

def values0779 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0779.coefficient53_244,
  OriginalRow227TriangleData0779.coefficient53_245,
  OriginalRow227TriangleData0779.coefficient53_246,
  OriginalRow227TriangleData0779.coefficient53_247,
  OriginalRow227TriangleData0779.coefficient53_248,
  OriginalRow227TriangleData0779.coefficient53_249,
  OriginalRow227TriangleData0779.coefficient53_250,
  OriginalRow227TriangleData0779.coefficient53_251,
  OriginalRow227TriangleData0779.coefficient53_252,
  OriginalRow227TriangleData0779.coefficient53_253,
  OriginalRow227TriangleData0779.coefficient53_254,
  OriginalRow227TriangleData0779.coefficient53_255,
  OriginalRow227TriangleData0779.coefficient53_256,
  OriginalRow227TriangleData0779.coefficient53_257,
  OriginalRow227TriangleData0779.coefficient53_258,
  OriginalRow227TriangleData0779.coefficient53_259,
  OriginalRow227TriangleData0779.coefficient53_260,
  OriginalRow227TriangleData0779.coefficient53_261,
  OriginalRow227TriangleData0779.coefficient53_262,
  OriginalRow227TriangleData0779.coefficient53_263,
  OriginalRow227TriangleData0779.coefficient53_264,
  OriginalRow227TriangleData0779.coefficient53_265,
  OriginalRow227TriangleData0779.coefficient53_266,
  OriginalRow227TriangleData0779.coefficient53_267,
  OriginalRow227TriangleData0779.coefficient53_268,
  OriginalRow227TriangleData0779.coefficient53_269,
  OriginalRow227TriangleData0779.coefficient53_270,
  OriginalRow227TriangleData0779.coefficient53_271,
  OriginalRow227TriangleData0779.coefficient53_272,
  OriginalRow227TriangleData0779.coefficient53_273,
  OriginalRow227TriangleData0779.coefficient53_274,
  OriginalRow227TriangleData0779.coefficient53_275
]

theorem values0779_size : values0779.size = 32 := rfl

def block0779 : ℕ → Option IntervalDyadic := segment 244 values0779

theorem block0779_domain : ExactDomain block0779 244 276 := by
  simpa only [values0779_size] using segment_domain 244 values0779

theorem block0779_get (i : Fin 32) :
    block0779 (244 + i.val) = some (values0779[i.val]'(by rw [values0779_size]; exact i.isLt)) := by
  exact segment_get 244 values0779 ⟨i.val, by rw [values0779_size]; exact i.isLt⟩

def values0780 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0780.coefficient53_276,
  OriginalRow227TriangleData0780.coefficient53_277,
  OriginalRow227TriangleData0780.coefficient53_278,
  OriginalRow227TriangleData0780.coefficient53_279,
  OriginalRow227TriangleData0780.coefficient53_280,
  OriginalRow227TriangleData0780.coefficient53_281,
  OriginalRow227TriangleData0780.coefficient53_282,
  OriginalRow227TriangleData0780.coefficient53_283,
  OriginalRow227TriangleData0780.coefficient53_284,
  OriginalRow227TriangleData0780.coefficient53_285,
  OriginalRow227TriangleData0780.coefficient53_286,
  OriginalRow227TriangleData0780.coefficient53_287,
  OriginalRow227TriangleData0780.coefficient53_288,
  OriginalRow227TriangleData0780.coefficient53_289,
  OriginalRow227TriangleData0780.coefficient53_290,
  OriginalRow227TriangleData0780.coefficient53_291,
  OriginalRow227TriangleData0780.coefficient53_292,
  OriginalRow227TriangleData0780.coefficient53_293,
  OriginalRow227TriangleData0780.coefficient53_294,
  OriginalRow227TriangleData0780.coefficient53_295,
  OriginalRow227TriangleData0780.coefficient53_296,
  OriginalRow227TriangleData0780.coefficient53_297,
  OriginalRow227TriangleData0780.coefficient53_298,
  OriginalRow227TriangleData0780.coefficient53_299,
  OriginalRow227TriangleData0780.coefficient53_300,
  OriginalRow227TriangleData0780.coefficient53_301,
  OriginalRow227TriangleData0780.coefficient53_302,
  OriginalRow227TriangleData0780.coefficient53_303,
  OriginalRow227TriangleData0780.coefficient53_304,
  OriginalRow227TriangleData0780.coefficient53_305,
  OriginalRow227TriangleData0780.coefficient53_306,
  OriginalRow227TriangleData0780.coefficient53_307
]

theorem values0780_size : values0780.size = 32 := rfl

def block0780 : ℕ → Option IntervalDyadic := segment 276 values0780

theorem block0780_domain : ExactDomain block0780 276 308 := by
  simpa only [values0780_size] using segment_domain 276 values0780

theorem block0780_get (i : Fin 32) :
    block0780 (276 + i.val) = some (values0780[i.val]'(by rw [values0780_size]; exact i.isLt)) := by
  exact segment_get 276 values0780 ⟨i.val, by rw [values0780_size]; exact i.isLt⟩

def values0781 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0781.coefficient53_308,
  OriginalRow227TriangleData0781.coefficient53_309,
  OriginalRow227TriangleData0781.coefficient53_310,
  OriginalRow227TriangleData0781.coefficient53_311,
  OriginalRow227TriangleData0781.coefficient53_312,
  OriginalRow227TriangleData0781.coefficient53_313,
  OriginalRow227TriangleData0781.coefficient53_314,
  OriginalRow227TriangleData0781.coefficient53_315,
  OriginalRow227TriangleData0781.coefficient53_316,
  OriginalRow227TriangleData0781.coefficient53_317,
  OriginalRow227TriangleData0781.coefficient53_318,
  OriginalRow227TriangleData0781.coefficient53_319,
  OriginalRow227TriangleData0781.coefficient53_320,
  OriginalRow227TriangleData0781.coefficient53_321,
  OriginalRow227TriangleData0781.coefficient53_322,
  OriginalRow227TriangleData0781.coefficient53_323,
  OriginalRow227TriangleData0781.coefficient53_324,
  OriginalRow227TriangleData0781.coefficient53_325,
  OriginalRow227TriangleData0781.coefficient53_326,
  OriginalRow227TriangleData0781.coefficient53_327,
  OriginalRow227TriangleData0781.coefficient53_328,
  OriginalRow227TriangleData0781.coefficient53_329,
  OriginalRow227TriangleData0781.coefficient53_330,
  OriginalRow227TriangleData0781.coefficient53_331,
  OriginalRow227TriangleData0781.coefficient53_332,
  OriginalRow227TriangleData0781.coefficient53_333,
  OriginalRow227TriangleData0781.coefficient53_334,
  OriginalRow227TriangleData0781.coefficient53_335,
  OriginalRow227TriangleData0781.coefficient53_336,
  OriginalRow227TriangleData0781.coefficient53_337,
  OriginalRow227TriangleData0781.coefficient53_338,
  OriginalRow227TriangleData0781.coefficient53_339
]

theorem values0781_size : values0781.size = 32 := rfl

def block0781 : ℕ → Option IntervalDyadic := segment 308 values0781

theorem block0781_domain : ExactDomain block0781 308 340 := by
  simpa only [values0781_size] using segment_domain 308 values0781

theorem block0781_get (i : Fin 32) :
    block0781 (308 + i.val) = some (values0781[i.val]'(by rw [values0781_size]; exact i.isLt)) := by
  exact segment_get 308 values0781 ⟨i.val, by rw [values0781_size]; exact i.isLt⟩

def values0782 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0782.coefficient53_340,
  OriginalRow227TriangleData0782.coefficient53_341,
  OriginalRow227TriangleData0782.coefficient53_342,
  OriginalRow227TriangleData0782.coefficient53_343,
  OriginalRow227TriangleData0782.coefficient53_344,
  OriginalRow227TriangleData0782.coefficient53_345,
  OriginalRow227TriangleData0782.coefficient53_346,
  OriginalRow227TriangleData0782.coefficient53_347,
  OriginalRow227TriangleData0782.coefficient53_348,
  OriginalRow227TriangleData0782.coefficient53_349,
  OriginalRow227TriangleData0782.coefficient53_350,
  OriginalRow227TriangleData0782.coefficient53_351,
  OriginalRow227TriangleData0782.coefficient53_352,
  OriginalRow227TriangleData0782.coefficient53_353,
  OriginalRow227TriangleData0782.coefficient53_354,
  OriginalRow227TriangleData0782.coefficient53_355,
  OriginalRow227TriangleData0782.coefficient53_356,
  OriginalRow227TriangleData0782.coefficient53_357,
  OriginalRow227TriangleData0782.coefficient53_358,
  OriginalRow227TriangleData0782.coefficient53_359,
  OriginalRow227TriangleData0782.coefficient53_360,
  OriginalRow227TriangleData0782.coefficient53_361,
  OriginalRow227TriangleData0782.coefficient53_362,
  OriginalRow227TriangleData0782.coefficient53_363,
  OriginalRow227TriangleData0782.coefficient53_364,
  OriginalRow227TriangleData0782.coefficient53_365,
  OriginalRow227TriangleData0782.coefficient53_366,
  OriginalRow227TriangleData0782.coefficient53_367,
  OriginalRow227TriangleData0782.coefficient53_368,
  OriginalRow227TriangleData0782.coefficient53_369,
  OriginalRow227TriangleData0782.coefficient53_370,
  OriginalRow227TriangleData0782.coefficient53_371
]

theorem values0782_size : values0782.size = 32 := rfl

def block0782 : ℕ → Option IntervalDyadic := segment 340 values0782

theorem block0782_domain : ExactDomain block0782 340 372 := by
  simpa only [values0782_size] using segment_domain 340 values0782

theorem block0782_get (i : Fin 32) :
    block0782 (340 + i.val) = some (values0782[i.val]'(by rw [values0782_size]; exact i.isLt)) := by
  exact segment_get 340 values0782 ⟨i.val, by rw [values0782_size]; exact i.isLt⟩

def values0783 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0783.coefficient53_372,
  OriginalRow227TriangleData0783.coefficient53_373,
  OriginalRow227TriangleData0783.coefficient53_374,
  OriginalRow227TriangleData0783.coefficient53_375,
  OriginalRow227TriangleData0783.coefficient53_376,
  OriginalRow227TriangleData0783.coefficient53_377,
  OriginalRow227TriangleData0783.coefficient53_378,
  OriginalRow227TriangleData0783.coefficient53_379,
  OriginalRow227TriangleData0783.coefficient53_380,
  OriginalRow227TriangleData0783.coefficient53_381,
  OriginalRow227TriangleData0783.coefficient53_382,
  OriginalRow227TriangleData0783.coefficient53_383,
  OriginalRow227TriangleData0783.coefficient53_384,
  OriginalRow227TriangleData0783.coefficient53_385,
  OriginalRow227TriangleData0783.coefficient53_386,
  OriginalRow227TriangleData0783.coefficient53_387,
  OriginalRow227TriangleData0783.coefficient53_388,
  OriginalRow227TriangleData0783.coefficient53_389,
  OriginalRow227TriangleData0783.coefficient53_390,
  OriginalRow227TriangleData0783.coefficient53_391,
  OriginalRow227TriangleData0783.coefficient53_392,
  OriginalRow227TriangleData0783.coefficient53_393,
  OriginalRow227TriangleData0783.coefficient53_394,
  OriginalRow227TriangleData0783.coefficient53_395,
  OriginalRow227TriangleData0783.coefficient53_396,
  OriginalRow227TriangleData0783.coefficient53_397,
  OriginalRow227TriangleData0783.coefficient53_398,
  OriginalRow227TriangleData0783.coefficient53_399,
  OriginalRow227TriangleData0783.coefficient53_400,
  OriginalRow227TriangleData0783.coefficient53_401,
  OriginalRow227TriangleData0783.coefficient53_402,
  OriginalRow227TriangleData0783.coefficient53_403
]

theorem values0783_size : values0783.size = 32 := rfl

def block0783 : ℕ → Option IntervalDyadic := segment 372 values0783

theorem block0783_domain : ExactDomain block0783 372 404 := by
  simpa only [values0783_size] using segment_domain 372 values0783

theorem block0783_get (i : Fin 32) :
    block0783 (372 + i.val) = some (values0783[i.val]'(by rw [values0783_size]; exact i.isLt)) := by
  exact segment_get 372 values0783 ⟨i.val, by rw [values0783_size]; exact i.isLt⟩

def values0784 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0784.coefficient53_404,
  OriginalRow227TriangleData0784.coefficient53_405,
  OriginalRow227TriangleData0784.coefficient53_406,
  OriginalRow227TriangleData0784.coefficient53_407,
  OriginalRow227TriangleData0784.coefficient53_408,
  OriginalRow227TriangleData0784.coefficient53_409,
  OriginalRow227TriangleData0784.coefficient53_410,
  OriginalRow227TriangleData0784.coefficient53_411,
  OriginalRow227TriangleData0784.coefficient53_412,
  OriginalRow227TriangleData0784.coefficient53_413,
  OriginalRow227TriangleData0784.coefficient53_414,
  OriginalRow227TriangleData0784.coefficient53_415,
  OriginalRow227TriangleData0784.coefficient53_416,
  OriginalRow227TriangleData0784.coefficient53_417,
  OriginalRow227TriangleData0784.coefficient53_418,
  OriginalRow227TriangleData0784.coefficient53_419,
  OriginalRow227TriangleData0784.coefficient53_420,
  OriginalRow227TriangleData0784.coefficient53_421,
  OriginalRow227TriangleData0784.coefficient53_422,
  OriginalRow227TriangleData0784.coefficient53_423,
  OriginalRow227TriangleData0784.coefficient53_424,
  OriginalRow227TriangleData0784.coefficient53_425,
  OriginalRow227TriangleData0784.coefficient53_426,
  OriginalRow227TriangleData0784.coefficient53_427,
  OriginalRow227TriangleData0784.coefficient53_428,
  OriginalRow227TriangleData0784.coefficient53_429,
  OriginalRow227TriangleData0784.coefficient53_430,
  OriginalRow227TriangleData0784.coefficient53_431,
  OriginalRow227TriangleData0784.coefficient53_432,
  OriginalRow227TriangleData0784.coefficient53_433,
  OriginalRow227TriangleData0784.coefficient53_434,
  OriginalRow227TriangleData0784.coefficient53_435
]

theorem values0784_size : values0784.size = 32 := rfl

def block0784 : ℕ → Option IntervalDyadic := segment 404 values0784

theorem block0784_domain : ExactDomain block0784 404 436 := by
  simpa only [values0784_size] using segment_domain 404 values0784

theorem block0784_get (i : Fin 32) :
    block0784 (404 + i.val) = some (values0784[i.val]'(by rw [values0784_size]; exact i.isLt)) := by
  exact segment_get 404 values0784 ⟨i.val, by rw [values0784_size]; exact i.isLt⟩

def values0785 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0785.coefficient53_436,
  OriginalRow227TriangleData0785.coefficient53_437,
  OriginalRow227TriangleData0785.coefficient53_438,
  OriginalRow227TriangleData0785.coefficient53_439,
  OriginalRow227TriangleData0785.coefficient53_440,
  OriginalRow227TriangleData0785.coefficient53_441,
  OriginalRow227TriangleData0785.coefficient53_442,
  OriginalRow227TriangleData0785.coefficient53_443,
  OriginalRow227TriangleData0785.coefficient53_444,
  OriginalRow227TriangleData0785.coefficient53_445,
  OriginalRow227TriangleData0785.coefficient53_446,
  OriginalRow227TriangleData0785.coefficient53_447,
  OriginalRow227TriangleData0785.coefficient53_448
]

theorem values0785_size : values0785.size = 13 := rfl

def block0785 : ℕ → Option IntervalDyadic := segment 436 values0785

theorem block0785_domain : ExactDomain block0785 436 449 := by
  simpa only [values0785_size] using segment_domain 436 values0785

theorem block0785_get (i : Fin 13) :
    block0785 (436 + i.val) = some (values0785[i.val]'(by rw [values0785_size]; exact i.isLt)) := by
  exact segment_get 436 values0785 ⟨i.val, by rw [values0785_size]; exact i.isLt⟩

def node0084_0148 : ℕ → Option IntervalDyadic := split 116 block0774 block0775

theorem node0084_0148_domain : ExactDomain node0084_0148 84 148 := by
  exact split_domain (by decide) (by decide) block0774_domain block0775_domain

def node0052_0148 : ℕ → Option IntervalDyadic := split 84 block0773 node0084_0148

theorem node0052_0148_domain : ExactDomain node0052_0148 52 148 := by
  exact split_domain (by decide) (by decide) block0773_domain node0084_0148_domain

def node0180_0244 : ℕ → Option IntervalDyadic := split 212 block0777 block0778

theorem node0180_0244_domain : ExactDomain node0180_0244 180 244 := by
  exact split_domain (by decide) (by decide) block0777_domain block0778_domain

def node0148_0244 : ℕ → Option IntervalDyadic := split 180 block0776 node0180_0244

theorem node0148_0244_domain : ExactDomain node0148_0244 148 244 := by
  exact split_domain (by decide) (by decide) block0776_domain node0180_0244_domain

def node0052_0244 : ℕ → Option IntervalDyadic := split 148 node0052_0148 node0148_0244

theorem node0052_0244_domain : ExactDomain node0052_0244 52 244 := by
  exact split_domain (by decide) (by decide) node0052_0148_domain node0148_0244_domain

def node0276_0340 : ℕ → Option IntervalDyadic := split 308 block0780 block0781

theorem node0276_0340_domain : ExactDomain node0276_0340 276 340 := by
  exact split_domain (by decide) (by decide) block0780_domain block0781_domain

def node0244_0340 : ℕ → Option IntervalDyadic := split 276 block0779 node0276_0340

theorem node0244_0340_domain : ExactDomain node0244_0340 244 340 := by
  exact split_domain (by decide) (by decide) block0779_domain node0276_0340_domain

def node0340_0404 : ℕ → Option IntervalDyadic := split 372 block0782 block0783

theorem node0340_0404_domain : ExactDomain node0340_0404 340 404 := by
  exact split_domain (by decide) (by decide) block0782_domain block0783_domain

def node0404_0449 : ℕ → Option IntervalDyadic := split 436 block0784 block0785

theorem node0404_0449_domain : ExactDomain node0404_0449 404 449 := by
  exact split_domain (by decide) (by decide) block0784_domain block0785_domain

def node0340_0449 : ℕ → Option IntervalDyadic := split 404 node0340_0404 node0404_0449

theorem node0340_0449_domain : ExactDomain node0340_0449 340 449 := by
  exact split_domain (by decide) (by decide) node0340_0404_domain node0404_0449_domain

def node0244_0449 : ℕ → Option IntervalDyadic := split 340 node0244_0340 node0340_0449

theorem node0244_0449_domain : ExactDomain node0244_0449 244 449 := by
  exact split_domain (by decide) (by decide) node0244_0340_domain node0340_0449_domain

def node0052_0449 : ℕ → Option IntervalDyadic := split 244 node0052_0244 node0244_0449

theorem node0052_0449_domain : ExactDomain node0052_0449 52 449 := by
  exact split_domain (by decide) (by decide) node0052_0244_domain node0244_0449_domain

def lookup : ℕ → Option IntervalDyadic := node0052_0449

theorem lookup_domain : ExactDomain lookup 52 449 :=
  node0052_0449_domain

theorem block0773_lookup (i : Fin 32) :
    lookup (52 + i.val) = some (values0773[i.val]'(by rw [values0773_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (52 + i.val) = _
  rw [node0052_0449, split_left 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0052_0244, split_left 148 node0052_0148 node0148_0244 (by omega)]
  rw [node0052_0148, split_left 84 block0773 node0084_0148 (by omega)]
  exact block0773_get i

theorem block0774_lookup (i : Fin 32) :
    lookup (84 + i.val) = some (values0774[i.val]'(by rw [values0774_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (84 + i.val) = _
  rw [node0052_0449, split_left 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0052_0244, split_left 148 node0052_0148 node0148_0244 (by omega)]
  rw [node0052_0148, split_right 84 block0773 node0084_0148 (by omega)]
  rw [node0084_0148, split_left 116 block0774 block0775 (by omega)]
  exact block0774_get i

theorem block0775_lookup (i : Fin 32) :
    lookup (116 + i.val) = some (values0775[i.val]'(by rw [values0775_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (116 + i.val) = _
  rw [node0052_0449, split_left 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0052_0244, split_left 148 node0052_0148 node0148_0244 (by omega)]
  rw [node0052_0148, split_right 84 block0773 node0084_0148 (by omega)]
  rw [node0084_0148, split_right 116 block0774 block0775 (by omega)]
  exact block0775_get i

theorem block0776_lookup (i : Fin 32) :
    lookup (148 + i.val) = some (values0776[i.val]'(by rw [values0776_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (148 + i.val) = _
  rw [node0052_0449, split_left 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0052_0244, split_right 148 node0052_0148 node0148_0244 (by omega)]
  rw [node0148_0244, split_left 180 block0776 node0180_0244 (by omega)]
  exact block0776_get i

theorem block0777_lookup (i : Fin 32) :
    lookup (180 + i.val) = some (values0777[i.val]'(by rw [values0777_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (180 + i.val) = _
  rw [node0052_0449, split_left 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0052_0244, split_right 148 node0052_0148 node0148_0244 (by omega)]
  rw [node0148_0244, split_right 180 block0776 node0180_0244 (by omega)]
  rw [node0180_0244, split_left 212 block0777 block0778 (by omega)]
  exact block0777_get i

theorem block0778_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values0778[i.val]'(by rw [values0778_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (212 + i.val) = _
  rw [node0052_0449, split_left 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0052_0244, split_right 148 node0052_0148 node0148_0244 (by omega)]
  rw [node0148_0244, split_right 180 block0776 node0180_0244 (by omega)]
  rw [node0180_0244, split_right 212 block0777 block0778 (by omega)]
  exact block0778_get i

theorem block0779_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values0779[i.val]'(by rw [values0779_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (244 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_left 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0244_0340, split_left 276 block0779 node0276_0340 (by omega)]
  exact block0779_get i

theorem block0780_lookup (i : Fin 32) :
    lookup (276 + i.val) = some (values0780[i.val]'(by rw [values0780_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (276 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_left 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0244_0340, split_right 276 block0779 node0276_0340 (by omega)]
  rw [node0276_0340, split_left 308 block0780 block0781 (by omega)]
  exact block0780_get i

theorem block0781_lookup (i : Fin 32) :
    lookup (308 + i.val) = some (values0781[i.val]'(by rw [values0781_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (308 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_left 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0244_0340, split_right 276 block0779 node0276_0340 (by omega)]
  rw [node0276_0340, split_right 308 block0780 block0781 (by omega)]
  exact block0781_get i

theorem block0782_lookup (i : Fin 32) :
    lookup (340 + i.val) = some (values0782[i.val]'(by rw [values0782_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (340 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_right 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0340_0449, split_left 404 node0340_0404 node0404_0449 (by omega)]
  rw [node0340_0404, split_left 372 block0782 block0783 (by omega)]
  exact block0782_get i

theorem block0783_lookup (i : Fin 32) :
    lookup (372 + i.val) = some (values0783[i.val]'(by rw [values0783_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (372 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_right 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0340_0449, split_left 404 node0340_0404 node0404_0449 (by omega)]
  rw [node0340_0404, split_right 372 block0782 block0783 (by omega)]
  exact block0783_get i

theorem block0784_lookup (i : Fin 32) :
    lookup (404 + i.val) = some (values0784[i.val]'(by rw [values0784_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (404 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_right 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0340_0449, split_right 404 node0340_0404 node0404_0449 (by omega)]
  rw [node0404_0449, split_left 436 block0784 block0785 (by omega)]
  exact block0784_get i

theorem block0785_lookup (i : Fin 13) :
    lookup (436 + i.val) = some (values0785[i.val]'(by rw [values0785_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0052_0449 (436 + i.val) = _
  rw [node0052_0449, split_right 244 node0052_0244 node0244_0449 (by omega)]
  rw [node0244_0449, split_right 340 node0244_0340 node0340_0449 (by omega)]
  rw [node0340_0449, split_right 404 node0340_0404 node0404_0449 (by omega)]
  rw [node0404_0449, split_right 436 block0784 block0785 (by omega)]
  exact block0785_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0773_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0773_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0774_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0774_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0775_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0775_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0776_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0776_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0777_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0777_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0778_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0778_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0779_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0779_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0780_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0780_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0781_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0781_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0782_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0782_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0783_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0783_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0784_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0784_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0785_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0785_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0773_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0774_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0775_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0776_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0777_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0778_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0779_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0780_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0781_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0782_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0783_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0784_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow053.block0785_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow053
