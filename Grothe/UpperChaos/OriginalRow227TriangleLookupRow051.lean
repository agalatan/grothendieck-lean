import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0747
import Grothe.UpperChaos.OriginalRow227TriangleData0748
import Grothe.UpperChaos.OriginalRow227TriangleData0749
import Grothe.UpperChaos.OriginalRow227TriangleData0750
import Grothe.UpperChaos.OriginalRow227TriangleData0751
import Grothe.UpperChaos.OriginalRow227TriangleData0752
import Grothe.UpperChaos.OriginalRow227TriangleData0753
import Grothe.UpperChaos.OriginalRow227TriangleData0754
import Grothe.UpperChaos.OriginalRow227TriangleData0755
import Grothe.UpperChaos.OriginalRow227TriangleData0756
import Grothe.UpperChaos.OriginalRow227TriangleData0757
import Grothe.UpperChaos.OriginalRow227TriangleData0758
import Grothe.UpperChaos.OriginalRow227TriangleData0759

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow051

open ConditionalTableLookup

def values0747 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0747.coefficient51_50,
  OriginalRow227TriangleData0747.coefficient51_51,
  OriginalRow227TriangleData0747.coefficient51_52,
  OriginalRow227TriangleData0747.coefficient51_53,
  OriginalRow227TriangleData0747.coefficient51_54,
  OriginalRow227TriangleData0747.coefficient51_55,
  OriginalRow227TriangleData0747.coefficient51_56,
  OriginalRow227TriangleData0747.coefficient51_57,
  OriginalRow227TriangleData0747.coefficient51_58,
  OriginalRow227TriangleData0747.coefficient51_59,
  OriginalRow227TriangleData0747.coefficient51_60,
  OriginalRow227TriangleData0747.coefficient51_61,
  OriginalRow227TriangleData0747.coefficient51_62,
  OriginalRow227TriangleData0747.coefficient51_63,
  OriginalRow227TriangleData0747.coefficient51_64,
  OriginalRow227TriangleData0747.coefficient51_65,
  OriginalRow227TriangleData0747.coefficient51_66,
  OriginalRow227TriangleData0747.coefficient51_67,
  OriginalRow227TriangleData0747.coefficient51_68,
  OriginalRow227TriangleData0747.coefficient51_69,
  OriginalRow227TriangleData0747.coefficient51_70,
  OriginalRow227TriangleData0747.coefficient51_71,
  OriginalRow227TriangleData0747.coefficient51_72,
  OriginalRow227TriangleData0747.coefficient51_73,
  OriginalRow227TriangleData0747.coefficient51_74,
  OriginalRow227TriangleData0747.coefficient51_75,
  OriginalRow227TriangleData0747.coefficient51_76,
  OriginalRow227TriangleData0747.coefficient51_77,
  OriginalRow227TriangleData0747.coefficient51_78,
  OriginalRow227TriangleData0747.coefficient51_79,
  OriginalRow227TriangleData0747.coefficient51_80,
  OriginalRow227TriangleData0747.coefficient51_81
]

theorem values0747_size : values0747.size = 32 := rfl

def block0747 : ℕ → Option IntervalDyadic := segment 50 values0747

theorem block0747_domain : ExactDomain block0747 50 82 := by
  simpa only [values0747_size] using segment_domain 50 values0747

theorem block0747_get (i : Fin 32) :
    block0747 (50 + i.val) = some (values0747[i.val]'(by rw [values0747_size]; exact i.isLt)) := by
  exact segment_get 50 values0747 ⟨i.val, by rw [values0747_size]; exact i.isLt⟩

def values0748 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0748.coefficient51_82,
  OriginalRow227TriangleData0748.coefficient51_83,
  OriginalRow227TriangleData0748.coefficient51_84,
  OriginalRow227TriangleData0748.coefficient51_85,
  OriginalRow227TriangleData0748.coefficient51_86,
  OriginalRow227TriangleData0748.coefficient51_87,
  OriginalRow227TriangleData0748.coefficient51_88,
  OriginalRow227TriangleData0748.coefficient51_89,
  OriginalRow227TriangleData0748.coefficient51_90,
  OriginalRow227TriangleData0748.coefficient51_91,
  OriginalRow227TriangleData0748.coefficient51_92,
  OriginalRow227TriangleData0748.coefficient51_93,
  OriginalRow227TriangleData0748.coefficient51_94,
  OriginalRow227TriangleData0748.coefficient51_95,
  OriginalRow227TriangleData0748.coefficient51_96,
  OriginalRow227TriangleData0748.coefficient51_97,
  OriginalRow227TriangleData0748.coefficient51_98,
  OriginalRow227TriangleData0748.coefficient51_99,
  OriginalRow227TriangleData0748.coefficient51_100,
  OriginalRow227TriangleData0748.coefficient51_101,
  OriginalRow227TriangleData0748.coefficient51_102,
  OriginalRow227TriangleData0748.coefficient51_103,
  OriginalRow227TriangleData0748.coefficient51_104,
  OriginalRow227TriangleData0748.coefficient51_105,
  OriginalRow227TriangleData0748.coefficient51_106,
  OriginalRow227TriangleData0748.coefficient51_107,
  OriginalRow227TriangleData0748.coefficient51_108,
  OriginalRow227TriangleData0748.coefficient51_109,
  OriginalRow227TriangleData0748.coefficient51_110,
  OriginalRow227TriangleData0748.coefficient51_111,
  OriginalRow227TriangleData0748.coefficient51_112,
  OriginalRow227TriangleData0748.coefficient51_113
]

theorem values0748_size : values0748.size = 32 := rfl

def block0748 : ℕ → Option IntervalDyadic := segment 82 values0748

theorem block0748_domain : ExactDomain block0748 82 114 := by
  simpa only [values0748_size] using segment_domain 82 values0748

theorem block0748_get (i : Fin 32) :
    block0748 (82 + i.val) = some (values0748[i.val]'(by rw [values0748_size]; exact i.isLt)) := by
  exact segment_get 82 values0748 ⟨i.val, by rw [values0748_size]; exact i.isLt⟩

def values0749 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0749.coefficient51_114,
  OriginalRow227TriangleData0749.coefficient51_115,
  OriginalRow227TriangleData0749.coefficient51_116,
  OriginalRow227TriangleData0749.coefficient51_117,
  OriginalRow227TriangleData0749.coefficient51_118,
  OriginalRow227TriangleData0749.coefficient51_119,
  OriginalRow227TriangleData0749.coefficient51_120,
  OriginalRow227TriangleData0749.coefficient51_121,
  OriginalRow227TriangleData0749.coefficient51_122,
  OriginalRow227TriangleData0749.coefficient51_123,
  OriginalRow227TriangleData0749.coefficient51_124,
  OriginalRow227TriangleData0749.coefficient51_125,
  OriginalRow227TriangleData0749.coefficient51_126,
  OriginalRow227TriangleData0749.coefficient51_127,
  OriginalRow227TriangleData0749.coefficient51_128,
  OriginalRow227TriangleData0749.coefficient51_129,
  OriginalRow227TriangleData0749.coefficient51_130,
  OriginalRow227TriangleData0749.coefficient51_131,
  OriginalRow227TriangleData0749.coefficient51_132,
  OriginalRow227TriangleData0749.coefficient51_133,
  OriginalRow227TriangleData0749.coefficient51_134,
  OriginalRow227TriangleData0749.coefficient51_135,
  OriginalRow227TriangleData0749.coefficient51_136,
  OriginalRow227TriangleData0749.coefficient51_137,
  OriginalRow227TriangleData0749.coefficient51_138,
  OriginalRow227TriangleData0749.coefficient51_139,
  OriginalRow227TriangleData0749.coefficient51_140,
  OriginalRow227TriangleData0749.coefficient51_141,
  OriginalRow227TriangleData0749.coefficient51_142,
  OriginalRow227TriangleData0749.coefficient51_143,
  OriginalRow227TriangleData0749.coefficient51_144,
  OriginalRow227TriangleData0749.coefficient51_145
]

theorem values0749_size : values0749.size = 32 := rfl

def block0749 : ℕ → Option IntervalDyadic := segment 114 values0749

theorem block0749_domain : ExactDomain block0749 114 146 := by
  simpa only [values0749_size] using segment_domain 114 values0749

theorem block0749_get (i : Fin 32) :
    block0749 (114 + i.val) = some (values0749[i.val]'(by rw [values0749_size]; exact i.isLt)) := by
  exact segment_get 114 values0749 ⟨i.val, by rw [values0749_size]; exact i.isLt⟩

def values0750 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0750.coefficient51_146,
  OriginalRow227TriangleData0750.coefficient51_147,
  OriginalRow227TriangleData0750.coefficient51_148,
  OriginalRow227TriangleData0750.coefficient51_149,
  OriginalRow227TriangleData0750.coefficient51_150,
  OriginalRow227TriangleData0750.coefficient51_151,
  OriginalRow227TriangleData0750.coefficient51_152,
  OriginalRow227TriangleData0750.coefficient51_153,
  OriginalRow227TriangleData0750.coefficient51_154,
  OriginalRow227TriangleData0750.coefficient51_155,
  OriginalRow227TriangleData0750.coefficient51_156,
  OriginalRow227TriangleData0750.coefficient51_157,
  OriginalRow227TriangleData0750.coefficient51_158,
  OriginalRow227TriangleData0750.coefficient51_159,
  OriginalRow227TriangleData0750.coefficient51_160,
  OriginalRow227TriangleData0750.coefficient51_161,
  OriginalRow227TriangleData0750.coefficient51_162,
  OriginalRow227TriangleData0750.coefficient51_163,
  OriginalRow227TriangleData0750.coefficient51_164,
  OriginalRow227TriangleData0750.coefficient51_165,
  OriginalRow227TriangleData0750.coefficient51_166,
  OriginalRow227TriangleData0750.coefficient51_167,
  OriginalRow227TriangleData0750.coefficient51_168,
  OriginalRow227TriangleData0750.coefficient51_169,
  OriginalRow227TriangleData0750.coefficient51_170,
  OriginalRow227TriangleData0750.coefficient51_171,
  OriginalRow227TriangleData0750.coefficient51_172,
  OriginalRow227TriangleData0750.coefficient51_173,
  OriginalRow227TriangleData0750.coefficient51_174,
  OriginalRow227TriangleData0750.coefficient51_175,
  OriginalRow227TriangleData0750.coefficient51_176,
  OriginalRow227TriangleData0750.coefficient51_177
]

theorem values0750_size : values0750.size = 32 := rfl

def block0750 : ℕ → Option IntervalDyadic := segment 146 values0750

theorem block0750_domain : ExactDomain block0750 146 178 := by
  simpa only [values0750_size] using segment_domain 146 values0750

theorem block0750_get (i : Fin 32) :
    block0750 (146 + i.val) = some (values0750[i.val]'(by rw [values0750_size]; exact i.isLt)) := by
  exact segment_get 146 values0750 ⟨i.val, by rw [values0750_size]; exact i.isLt⟩

def values0751 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0751.coefficient51_178,
  OriginalRow227TriangleData0751.coefficient51_179,
  OriginalRow227TriangleData0751.coefficient51_180,
  OriginalRow227TriangleData0751.coefficient51_181,
  OriginalRow227TriangleData0751.coefficient51_182,
  OriginalRow227TriangleData0751.coefficient51_183,
  OriginalRow227TriangleData0751.coefficient51_184,
  OriginalRow227TriangleData0751.coefficient51_185,
  OriginalRow227TriangleData0751.coefficient51_186,
  OriginalRow227TriangleData0751.coefficient51_187,
  OriginalRow227TriangleData0751.coefficient51_188,
  OriginalRow227TriangleData0751.coefficient51_189,
  OriginalRow227TriangleData0751.coefficient51_190,
  OriginalRow227TriangleData0751.coefficient51_191,
  OriginalRow227TriangleData0751.coefficient51_192,
  OriginalRow227TriangleData0751.coefficient51_193,
  OriginalRow227TriangleData0751.coefficient51_194,
  OriginalRow227TriangleData0751.coefficient51_195,
  OriginalRow227TriangleData0751.coefficient51_196,
  OriginalRow227TriangleData0751.coefficient51_197,
  OriginalRow227TriangleData0751.coefficient51_198,
  OriginalRow227TriangleData0751.coefficient51_199,
  OriginalRow227TriangleData0751.coefficient51_200,
  OriginalRow227TriangleData0751.coefficient51_201,
  OriginalRow227TriangleData0751.coefficient51_202,
  OriginalRow227TriangleData0751.coefficient51_203,
  OriginalRow227TriangleData0751.coefficient51_204,
  OriginalRow227TriangleData0751.coefficient51_205,
  OriginalRow227TriangleData0751.coefficient51_206,
  OriginalRow227TriangleData0751.coefficient51_207,
  OriginalRow227TriangleData0751.coefficient51_208,
  OriginalRow227TriangleData0751.coefficient51_209
]

theorem values0751_size : values0751.size = 32 := rfl

def block0751 : ℕ → Option IntervalDyadic := segment 178 values0751

theorem block0751_domain : ExactDomain block0751 178 210 := by
  simpa only [values0751_size] using segment_domain 178 values0751

theorem block0751_get (i : Fin 32) :
    block0751 (178 + i.val) = some (values0751[i.val]'(by rw [values0751_size]; exact i.isLt)) := by
  exact segment_get 178 values0751 ⟨i.val, by rw [values0751_size]; exact i.isLt⟩

def values0752 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0752.coefficient51_210,
  OriginalRow227TriangleData0752.coefficient51_211,
  OriginalRow227TriangleData0752.coefficient51_212,
  OriginalRow227TriangleData0752.coefficient51_213,
  OriginalRow227TriangleData0752.coefficient51_214,
  OriginalRow227TriangleData0752.coefficient51_215,
  OriginalRow227TriangleData0752.coefficient51_216,
  OriginalRow227TriangleData0752.coefficient51_217,
  OriginalRow227TriangleData0752.coefficient51_218,
  OriginalRow227TriangleData0752.coefficient51_219,
  OriginalRow227TriangleData0752.coefficient51_220,
  OriginalRow227TriangleData0752.coefficient51_221,
  OriginalRow227TriangleData0752.coefficient51_222,
  OriginalRow227TriangleData0752.coefficient51_223,
  OriginalRow227TriangleData0752.coefficient51_224,
  OriginalRow227TriangleData0752.coefficient51_225,
  OriginalRow227TriangleData0752.coefficient51_226,
  OriginalRow227TriangleData0752.coefficient51_227,
  OriginalRow227TriangleData0752.coefficient51_228,
  OriginalRow227TriangleData0752.coefficient51_229,
  OriginalRow227TriangleData0752.coefficient51_230,
  OriginalRow227TriangleData0752.coefficient51_231,
  OriginalRow227TriangleData0752.coefficient51_232,
  OriginalRow227TriangleData0752.coefficient51_233,
  OriginalRow227TriangleData0752.coefficient51_234,
  OriginalRow227TriangleData0752.coefficient51_235,
  OriginalRow227TriangleData0752.coefficient51_236,
  OriginalRow227TriangleData0752.coefficient51_237,
  OriginalRow227TriangleData0752.coefficient51_238,
  OriginalRow227TriangleData0752.coefficient51_239,
  OriginalRow227TriangleData0752.coefficient51_240,
  OriginalRow227TriangleData0752.coefficient51_241
]

theorem values0752_size : values0752.size = 32 := rfl

def block0752 : ℕ → Option IntervalDyadic := segment 210 values0752

theorem block0752_domain : ExactDomain block0752 210 242 := by
  simpa only [values0752_size] using segment_domain 210 values0752

theorem block0752_get (i : Fin 32) :
    block0752 (210 + i.val) = some (values0752[i.val]'(by rw [values0752_size]; exact i.isLt)) := by
  exact segment_get 210 values0752 ⟨i.val, by rw [values0752_size]; exact i.isLt⟩

def values0753 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0753.coefficient51_242,
  OriginalRow227TriangleData0753.coefficient51_243,
  OriginalRow227TriangleData0753.coefficient51_244,
  OriginalRow227TriangleData0753.coefficient51_245,
  OriginalRow227TriangleData0753.coefficient51_246,
  OriginalRow227TriangleData0753.coefficient51_247,
  OriginalRow227TriangleData0753.coefficient51_248,
  OriginalRow227TriangleData0753.coefficient51_249,
  OriginalRow227TriangleData0753.coefficient51_250,
  OriginalRow227TriangleData0753.coefficient51_251,
  OriginalRow227TriangleData0753.coefficient51_252,
  OriginalRow227TriangleData0753.coefficient51_253,
  OriginalRow227TriangleData0753.coefficient51_254,
  OriginalRow227TriangleData0753.coefficient51_255,
  OriginalRow227TriangleData0753.coefficient51_256,
  OriginalRow227TriangleData0753.coefficient51_257,
  OriginalRow227TriangleData0753.coefficient51_258,
  OriginalRow227TriangleData0753.coefficient51_259,
  OriginalRow227TriangleData0753.coefficient51_260,
  OriginalRow227TriangleData0753.coefficient51_261,
  OriginalRow227TriangleData0753.coefficient51_262,
  OriginalRow227TriangleData0753.coefficient51_263,
  OriginalRow227TriangleData0753.coefficient51_264,
  OriginalRow227TriangleData0753.coefficient51_265,
  OriginalRow227TriangleData0753.coefficient51_266,
  OriginalRow227TriangleData0753.coefficient51_267,
  OriginalRow227TriangleData0753.coefficient51_268,
  OriginalRow227TriangleData0753.coefficient51_269,
  OriginalRow227TriangleData0753.coefficient51_270,
  OriginalRow227TriangleData0753.coefficient51_271,
  OriginalRow227TriangleData0753.coefficient51_272,
  OriginalRow227TriangleData0753.coefficient51_273
]

theorem values0753_size : values0753.size = 32 := rfl

def block0753 : ℕ → Option IntervalDyadic := segment 242 values0753

theorem block0753_domain : ExactDomain block0753 242 274 := by
  simpa only [values0753_size] using segment_domain 242 values0753

theorem block0753_get (i : Fin 32) :
    block0753 (242 + i.val) = some (values0753[i.val]'(by rw [values0753_size]; exact i.isLt)) := by
  exact segment_get 242 values0753 ⟨i.val, by rw [values0753_size]; exact i.isLt⟩

def values0754 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0754.coefficient51_274,
  OriginalRow227TriangleData0754.coefficient51_275,
  OriginalRow227TriangleData0754.coefficient51_276,
  OriginalRow227TriangleData0754.coefficient51_277,
  OriginalRow227TriangleData0754.coefficient51_278,
  OriginalRow227TriangleData0754.coefficient51_279,
  OriginalRow227TriangleData0754.coefficient51_280,
  OriginalRow227TriangleData0754.coefficient51_281,
  OriginalRow227TriangleData0754.coefficient51_282,
  OriginalRow227TriangleData0754.coefficient51_283,
  OriginalRow227TriangleData0754.coefficient51_284,
  OriginalRow227TriangleData0754.coefficient51_285,
  OriginalRow227TriangleData0754.coefficient51_286,
  OriginalRow227TriangleData0754.coefficient51_287,
  OriginalRow227TriangleData0754.coefficient51_288,
  OriginalRow227TriangleData0754.coefficient51_289,
  OriginalRow227TriangleData0754.coefficient51_290,
  OriginalRow227TriangleData0754.coefficient51_291,
  OriginalRow227TriangleData0754.coefficient51_292,
  OriginalRow227TriangleData0754.coefficient51_293,
  OriginalRow227TriangleData0754.coefficient51_294,
  OriginalRow227TriangleData0754.coefficient51_295,
  OriginalRow227TriangleData0754.coefficient51_296,
  OriginalRow227TriangleData0754.coefficient51_297,
  OriginalRow227TriangleData0754.coefficient51_298,
  OriginalRow227TriangleData0754.coefficient51_299,
  OriginalRow227TriangleData0754.coefficient51_300,
  OriginalRow227TriangleData0754.coefficient51_301,
  OriginalRow227TriangleData0754.coefficient51_302,
  OriginalRow227TriangleData0754.coefficient51_303,
  OriginalRow227TriangleData0754.coefficient51_304,
  OriginalRow227TriangleData0754.coefficient51_305
]

theorem values0754_size : values0754.size = 32 := rfl

def block0754 : ℕ → Option IntervalDyadic := segment 274 values0754

theorem block0754_domain : ExactDomain block0754 274 306 := by
  simpa only [values0754_size] using segment_domain 274 values0754

theorem block0754_get (i : Fin 32) :
    block0754 (274 + i.val) = some (values0754[i.val]'(by rw [values0754_size]; exact i.isLt)) := by
  exact segment_get 274 values0754 ⟨i.val, by rw [values0754_size]; exact i.isLt⟩

def values0755 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0755.coefficient51_306,
  OriginalRow227TriangleData0755.coefficient51_307,
  OriginalRow227TriangleData0755.coefficient51_308,
  OriginalRow227TriangleData0755.coefficient51_309,
  OriginalRow227TriangleData0755.coefficient51_310,
  OriginalRow227TriangleData0755.coefficient51_311,
  OriginalRow227TriangleData0755.coefficient51_312,
  OriginalRow227TriangleData0755.coefficient51_313,
  OriginalRow227TriangleData0755.coefficient51_314,
  OriginalRow227TriangleData0755.coefficient51_315,
  OriginalRow227TriangleData0755.coefficient51_316,
  OriginalRow227TriangleData0755.coefficient51_317,
  OriginalRow227TriangleData0755.coefficient51_318,
  OriginalRow227TriangleData0755.coefficient51_319,
  OriginalRow227TriangleData0755.coefficient51_320,
  OriginalRow227TriangleData0755.coefficient51_321,
  OriginalRow227TriangleData0755.coefficient51_322,
  OriginalRow227TriangleData0755.coefficient51_323,
  OriginalRow227TriangleData0755.coefficient51_324,
  OriginalRow227TriangleData0755.coefficient51_325,
  OriginalRow227TriangleData0755.coefficient51_326,
  OriginalRow227TriangleData0755.coefficient51_327,
  OriginalRow227TriangleData0755.coefficient51_328,
  OriginalRow227TriangleData0755.coefficient51_329,
  OriginalRow227TriangleData0755.coefficient51_330,
  OriginalRow227TriangleData0755.coefficient51_331,
  OriginalRow227TriangleData0755.coefficient51_332,
  OriginalRow227TriangleData0755.coefficient51_333,
  OriginalRow227TriangleData0755.coefficient51_334,
  OriginalRow227TriangleData0755.coefficient51_335,
  OriginalRow227TriangleData0755.coefficient51_336,
  OriginalRow227TriangleData0755.coefficient51_337
]

theorem values0755_size : values0755.size = 32 := rfl

def block0755 : ℕ → Option IntervalDyadic := segment 306 values0755

theorem block0755_domain : ExactDomain block0755 306 338 := by
  simpa only [values0755_size] using segment_domain 306 values0755

theorem block0755_get (i : Fin 32) :
    block0755 (306 + i.val) = some (values0755[i.val]'(by rw [values0755_size]; exact i.isLt)) := by
  exact segment_get 306 values0755 ⟨i.val, by rw [values0755_size]; exact i.isLt⟩

def values0756 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0756.coefficient51_338,
  OriginalRow227TriangleData0756.coefficient51_339,
  OriginalRow227TriangleData0756.coefficient51_340,
  OriginalRow227TriangleData0756.coefficient51_341,
  OriginalRow227TriangleData0756.coefficient51_342,
  OriginalRow227TriangleData0756.coefficient51_343,
  OriginalRow227TriangleData0756.coefficient51_344,
  OriginalRow227TriangleData0756.coefficient51_345,
  OriginalRow227TriangleData0756.coefficient51_346,
  OriginalRow227TriangleData0756.coefficient51_347,
  OriginalRow227TriangleData0756.coefficient51_348,
  OriginalRow227TriangleData0756.coefficient51_349,
  OriginalRow227TriangleData0756.coefficient51_350,
  OriginalRow227TriangleData0756.coefficient51_351,
  OriginalRow227TriangleData0756.coefficient51_352,
  OriginalRow227TriangleData0756.coefficient51_353,
  OriginalRow227TriangleData0756.coefficient51_354,
  OriginalRow227TriangleData0756.coefficient51_355,
  OriginalRow227TriangleData0756.coefficient51_356,
  OriginalRow227TriangleData0756.coefficient51_357,
  OriginalRow227TriangleData0756.coefficient51_358,
  OriginalRow227TriangleData0756.coefficient51_359,
  OriginalRow227TriangleData0756.coefficient51_360,
  OriginalRow227TriangleData0756.coefficient51_361,
  OriginalRow227TriangleData0756.coefficient51_362,
  OriginalRow227TriangleData0756.coefficient51_363,
  OriginalRow227TriangleData0756.coefficient51_364,
  OriginalRow227TriangleData0756.coefficient51_365,
  OriginalRow227TriangleData0756.coefficient51_366,
  OriginalRow227TriangleData0756.coefficient51_367,
  OriginalRow227TriangleData0756.coefficient51_368,
  OriginalRow227TriangleData0756.coefficient51_369
]

theorem values0756_size : values0756.size = 32 := rfl

def block0756 : ℕ → Option IntervalDyadic := segment 338 values0756

theorem block0756_domain : ExactDomain block0756 338 370 := by
  simpa only [values0756_size] using segment_domain 338 values0756

theorem block0756_get (i : Fin 32) :
    block0756 (338 + i.val) = some (values0756[i.val]'(by rw [values0756_size]; exact i.isLt)) := by
  exact segment_get 338 values0756 ⟨i.val, by rw [values0756_size]; exact i.isLt⟩

def values0757 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0757.coefficient51_370,
  OriginalRow227TriangleData0757.coefficient51_371,
  OriginalRow227TriangleData0757.coefficient51_372,
  OriginalRow227TriangleData0757.coefficient51_373,
  OriginalRow227TriangleData0757.coefficient51_374,
  OriginalRow227TriangleData0757.coefficient51_375,
  OriginalRow227TriangleData0757.coefficient51_376,
  OriginalRow227TriangleData0757.coefficient51_377,
  OriginalRow227TriangleData0757.coefficient51_378,
  OriginalRow227TriangleData0757.coefficient51_379,
  OriginalRow227TriangleData0757.coefficient51_380,
  OriginalRow227TriangleData0757.coefficient51_381,
  OriginalRow227TriangleData0757.coefficient51_382,
  OriginalRow227TriangleData0757.coefficient51_383,
  OriginalRow227TriangleData0757.coefficient51_384,
  OriginalRow227TriangleData0757.coefficient51_385,
  OriginalRow227TriangleData0757.coefficient51_386,
  OriginalRow227TriangleData0757.coefficient51_387,
  OriginalRow227TriangleData0757.coefficient51_388,
  OriginalRow227TriangleData0757.coefficient51_389,
  OriginalRow227TriangleData0757.coefficient51_390,
  OriginalRow227TriangleData0757.coefficient51_391,
  OriginalRow227TriangleData0757.coefficient51_392,
  OriginalRow227TriangleData0757.coefficient51_393,
  OriginalRow227TriangleData0757.coefficient51_394,
  OriginalRow227TriangleData0757.coefficient51_395,
  OriginalRow227TriangleData0757.coefficient51_396,
  OriginalRow227TriangleData0757.coefficient51_397,
  OriginalRow227TriangleData0757.coefficient51_398,
  OriginalRow227TriangleData0757.coefficient51_399,
  OriginalRow227TriangleData0757.coefficient51_400,
  OriginalRow227TriangleData0757.coefficient51_401
]

theorem values0757_size : values0757.size = 32 := rfl

def block0757 : ℕ → Option IntervalDyadic := segment 370 values0757

theorem block0757_domain : ExactDomain block0757 370 402 := by
  simpa only [values0757_size] using segment_domain 370 values0757

theorem block0757_get (i : Fin 32) :
    block0757 (370 + i.val) = some (values0757[i.val]'(by rw [values0757_size]; exact i.isLt)) := by
  exact segment_get 370 values0757 ⟨i.val, by rw [values0757_size]; exact i.isLt⟩

def values0758 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0758.coefficient51_402,
  OriginalRow227TriangleData0758.coefficient51_403,
  OriginalRow227TriangleData0758.coefficient51_404,
  OriginalRow227TriangleData0758.coefficient51_405,
  OriginalRow227TriangleData0758.coefficient51_406,
  OriginalRow227TriangleData0758.coefficient51_407,
  OriginalRow227TriangleData0758.coefficient51_408,
  OriginalRow227TriangleData0758.coefficient51_409,
  OriginalRow227TriangleData0758.coefficient51_410,
  OriginalRow227TriangleData0758.coefficient51_411,
  OriginalRow227TriangleData0758.coefficient51_412,
  OriginalRow227TriangleData0758.coefficient51_413,
  OriginalRow227TriangleData0758.coefficient51_414,
  OriginalRow227TriangleData0758.coefficient51_415,
  OriginalRow227TriangleData0758.coefficient51_416,
  OriginalRow227TriangleData0758.coefficient51_417,
  OriginalRow227TriangleData0758.coefficient51_418,
  OriginalRow227TriangleData0758.coefficient51_419,
  OriginalRow227TriangleData0758.coefficient51_420,
  OriginalRow227TriangleData0758.coefficient51_421,
  OriginalRow227TriangleData0758.coefficient51_422,
  OriginalRow227TriangleData0758.coefficient51_423,
  OriginalRow227TriangleData0758.coefficient51_424,
  OriginalRow227TriangleData0758.coefficient51_425,
  OriginalRow227TriangleData0758.coefficient51_426,
  OriginalRow227TriangleData0758.coefficient51_427,
  OriginalRow227TriangleData0758.coefficient51_428,
  OriginalRow227TriangleData0758.coefficient51_429,
  OriginalRow227TriangleData0758.coefficient51_430,
  OriginalRow227TriangleData0758.coefficient51_431,
  OriginalRow227TriangleData0758.coefficient51_432,
  OriginalRow227TriangleData0758.coefficient51_433
]

theorem values0758_size : values0758.size = 32 := rfl

def block0758 : ℕ → Option IntervalDyadic := segment 402 values0758

theorem block0758_domain : ExactDomain block0758 402 434 := by
  simpa only [values0758_size] using segment_domain 402 values0758

theorem block0758_get (i : Fin 32) :
    block0758 (402 + i.val) = some (values0758[i.val]'(by rw [values0758_size]; exact i.isLt)) := by
  exact segment_get 402 values0758 ⟨i.val, by rw [values0758_size]; exact i.isLt⟩

def values0759 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0759.coefficient51_434,
  OriginalRow227TriangleData0759.coefficient51_435,
  OriginalRow227TriangleData0759.coefficient51_436,
  OriginalRow227TriangleData0759.coefficient51_437,
  OriginalRow227TriangleData0759.coefficient51_438,
  OriginalRow227TriangleData0759.coefficient51_439,
  OriginalRow227TriangleData0759.coefficient51_440,
  OriginalRow227TriangleData0759.coefficient51_441,
  OriginalRow227TriangleData0759.coefficient51_442,
  OriginalRow227TriangleData0759.coefficient51_443,
  OriginalRow227TriangleData0759.coefficient51_444,
  OriginalRow227TriangleData0759.coefficient51_445,
  OriginalRow227TriangleData0759.coefficient51_446,
  OriginalRow227TriangleData0759.coefficient51_447,
  OriginalRow227TriangleData0759.coefficient51_448,
  OriginalRow227TriangleData0759.coefficient51_449,
  OriginalRow227TriangleData0759.coefficient51_450
]

theorem values0759_size : values0759.size = 17 := rfl

def block0759 : ℕ → Option IntervalDyadic := segment 434 values0759

theorem block0759_domain : ExactDomain block0759 434 451 := by
  simpa only [values0759_size] using segment_domain 434 values0759

theorem block0759_get (i : Fin 17) :
    block0759 (434 + i.val) = some (values0759[i.val]'(by rw [values0759_size]; exact i.isLt)) := by
  exact segment_get 434 values0759 ⟨i.val, by rw [values0759_size]; exact i.isLt⟩

def node0082_0146 : ℕ → Option IntervalDyadic := split 114 block0748 block0749

theorem node0082_0146_domain : ExactDomain node0082_0146 82 146 := by
  exact split_domain (by decide) (by decide) block0748_domain block0749_domain

def node0050_0146 : ℕ → Option IntervalDyadic := split 82 block0747 node0082_0146

theorem node0050_0146_domain : ExactDomain node0050_0146 50 146 := by
  exact split_domain (by decide) (by decide) block0747_domain node0082_0146_domain

def node0178_0242 : ℕ → Option IntervalDyadic := split 210 block0751 block0752

theorem node0178_0242_domain : ExactDomain node0178_0242 178 242 := by
  exact split_domain (by decide) (by decide) block0751_domain block0752_domain

def node0146_0242 : ℕ → Option IntervalDyadic := split 178 block0750 node0178_0242

theorem node0146_0242_domain : ExactDomain node0146_0242 146 242 := by
  exact split_domain (by decide) (by decide) block0750_domain node0178_0242_domain

def node0050_0242 : ℕ → Option IntervalDyadic := split 146 node0050_0146 node0146_0242

theorem node0050_0242_domain : ExactDomain node0050_0242 50 242 := by
  exact split_domain (by decide) (by decide) node0050_0146_domain node0146_0242_domain

def node0274_0338 : ℕ → Option IntervalDyadic := split 306 block0754 block0755

theorem node0274_0338_domain : ExactDomain node0274_0338 274 338 := by
  exact split_domain (by decide) (by decide) block0754_domain block0755_domain

def node0242_0338 : ℕ → Option IntervalDyadic := split 274 block0753 node0274_0338

theorem node0242_0338_domain : ExactDomain node0242_0338 242 338 := by
  exact split_domain (by decide) (by decide) block0753_domain node0274_0338_domain

def node0338_0402 : ℕ → Option IntervalDyadic := split 370 block0756 block0757

theorem node0338_0402_domain : ExactDomain node0338_0402 338 402 := by
  exact split_domain (by decide) (by decide) block0756_domain block0757_domain

def node0402_0451 : ℕ → Option IntervalDyadic := split 434 block0758 block0759

theorem node0402_0451_domain : ExactDomain node0402_0451 402 451 := by
  exact split_domain (by decide) (by decide) block0758_domain block0759_domain

def node0338_0451 : ℕ → Option IntervalDyadic := split 402 node0338_0402 node0402_0451

theorem node0338_0451_domain : ExactDomain node0338_0451 338 451 := by
  exact split_domain (by decide) (by decide) node0338_0402_domain node0402_0451_domain

def node0242_0451 : ℕ → Option IntervalDyadic := split 338 node0242_0338 node0338_0451

theorem node0242_0451_domain : ExactDomain node0242_0451 242 451 := by
  exact split_domain (by decide) (by decide) node0242_0338_domain node0338_0451_domain

def node0050_0451 : ℕ → Option IntervalDyadic := split 242 node0050_0242 node0242_0451

theorem node0050_0451_domain : ExactDomain node0050_0451 50 451 := by
  exact split_domain (by decide) (by decide) node0050_0242_domain node0242_0451_domain

def lookup : ℕ → Option IntervalDyadic := node0050_0451

theorem lookup_domain : ExactDomain lookup 50 451 :=
  node0050_0451_domain

theorem block0747_lookup (i : Fin 32) :
    lookup (50 + i.val) = some (values0747[i.val]'(by rw [values0747_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (50 + i.val) = _
  rw [node0050_0451, split_left 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0050_0242, split_left 146 node0050_0146 node0146_0242 (by omega)]
  rw [node0050_0146, split_left 82 block0747 node0082_0146 (by omega)]
  exact block0747_get i

theorem block0748_lookup (i : Fin 32) :
    lookup (82 + i.val) = some (values0748[i.val]'(by rw [values0748_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (82 + i.val) = _
  rw [node0050_0451, split_left 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0050_0242, split_left 146 node0050_0146 node0146_0242 (by omega)]
  rw [node0050_0146, split_right 82 block0747 node0082_0146 (by omega)]
  rw [node0082_0146, split_left 114 block0748 block0749 (by omega)]
  exact block0748_get i

theorem block0749_lookup (i : Fin 32) :
    lookup (114 + i.val) = some (values0749[i.val]'(by rw [values0749_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (114 + i.val) = _
  rw [node0050_0451, split_left 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0050_0242, split_left 146 node0050_0146 node0146_0242 (by omega)]
  rw [node0050_0146, split_right 82 block0747 node0082_0146 (by omega)]
  rw [node0082_0146, split_right 114 block0748 block0749 (by omega)]
  exact block0749_get i

theorem block0750_lookup (i : Fin 32) :
    lookup (146 + i.val) = some (values0750[i.val]'(by rw [values0750_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (146 + i.val) = _
  rw [node0050_0451, split_left 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0050_0242, split_right 146 node0050_0146 node0146_0242 (by omega)]
  rw [node0146_0242, split_left 178 block0750 node0178_0242 (by omega)]
  exact block0750_get i

theorem block0751_lookup (i : Fin 32) :
    lookup (178 + i.val) = some (values0751[i.val]'(by rw [values0751_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (178 + i.val) = _
  rw [node0050_0451, split_left 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0050_0242, split_right 146 node0050_0146 node0146_0242 (by omega)]
  rw [node0146_0242, split_right 178 block0750 node0178_0242 (by omega)]
  rw [node0178_0242, split_left 210 block0751 block0752 (by omega)]
  exact block0751_get i

theorem block0752_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values0752[i.val]'(by rw [values0752_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (210 + i.val) = _
  rw [node0050_0451, split_left 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0050_0242, split_right 146 node0050_0146 node0146_0242 (by omega)]
  rw [node0146_0242, split_right 178 block0750 node0178_0242 (by omega)]
  rw [node0178_0242, split_right 210 block0751 block0752 (by omega)]
  exact block0752_get i

theorem block0753_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values0753[i.val]'(by rw [values0753_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (242 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_left 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0242_0338, split_left 274 block0753 node0274_0338 (by omega)]
  exact block0753_get i

theorem block0754_lookup (i : Fin 32) :
    lookup (274 + i.val) = some (values0754[i.val]'(by rw [values0754_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (274 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_left 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0242_0338, split_right 274 block0753 node0274_0338 (by omega)]
  rw [node0274_0338, split_left 306 block0754 block0755 (by omega)]
  exact block0754_get i

theorem block0755_lookup (i : Fin 32) :
    lookup (306 + i.val) = some (values0755[i.val]'(by rw [values0755_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (306 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_left 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0242_0338, split_right 274 block0753 node0274_0338 (by omega)]
  rw [node0274_0338, split_right 306 block0754 block0755 (by omega)]
  exact block0755_get i

theorem block0756_lookup (i : Fin 32) :
    lookup (338 + i.val) = some (values0756[i.val]'(by rw [values0756_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (338 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_right 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0338_0451, split_left 402 node0338_0402 node0402_0451 (by omega)]
  rw [node0338_0402, split_left 370 block0756 block0757 (by omega)]
  exact block0756_get i

theorem block0757_lookup (i : Fin 32) :
    lookup (370 + i.val) = some (values0757[i.val]'(by rw [values0757_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (370 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_right 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0338_0451, split_left 402 node0338_0402 node0402_0451 (by omega)]
  rw [node0338_0402, split_right 370 block0756 block0757 (by omega)]
  exact block0757_get i

theorem block0758_lookup (i : Fin 32) :
    lookup (402 + i.val) = some (values0758[i.val]'(by rw [values0758_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (402 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_right 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0338_0451, split_right 402 node0338_0402 node0402_0451 (by omega)]
  rw [node0402_0451, split_left 434 block0758 block0759 (by omega)]
  exact block0758_get i

theorem block0759_lookup (i : Fin 17) :
    lookup (434 + i.val) = some (values0759[i.val]'(by rw [values0759_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0050_0451 (434 + i.val) = _
  rw [node0050_0451, split_right 242 node0050_0242 node0242_0451 (by omega)]
  rw [node0242_0451, split_right 338 node0242_0338 node0338_0451 (by omega)]
  rw [node0338_0451, split_right 402 node0338_0402 node0402_0451 (by omega)]
  rw [node0402_0451, split_right 434 block0758 block0759 (by omega)]
  exact block0759_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0747_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0747_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0748_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0748_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0749_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0749_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0750_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0750_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0751_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0751_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0752_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0752_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0753_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0753_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0754_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0754_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0755_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0755_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0756_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0756_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0757_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0757_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0758_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0758_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0759_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0759_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0747_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0748_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0749_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0750_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0751_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0752_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0753_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0754_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0755_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0756_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0757_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0758_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow051.block0759_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow051
