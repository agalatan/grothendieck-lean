import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0586
import Grothe.UpperChaos.OriginalRow227TriangleData0587
import Grothe.UpperChaos.OriginalRow227TriangleData0588
import Grothe.UpperChaos.OriginalRow227TriangleData0589
import Grothe.UpperChaos.OriginalRow227TriangleData0590
import Grothe.UpperChaos.OriginalRow227TriangleData0591
import Grothe.UpperChaos.OriginalRow227TriangleData0592
import Grothe.UpperChaos.OriginalRow227TriangleData0593
import Grothe.UpperChaos.OriginalRow227TriangleData0594
import Grothe.UpperChaos.OriginalRow227TriangleData0595
import Grothe.UpperChaos.OriginalRow227TriangleData0596
import Grothe.UpperChaos.OriginalRow227TriangleData0597
import Grothe.UpperChaos.OriginalRow227TriangleData0598
import Grothe.UpperChaos.OriginalRow227TriangleData0599

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow039

open ConditionalTableLookup

def values0586 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0586.coefficient39_38,
  OriginalRow227TriangleData0586.coefficient39_39,
  OriginalRow227TriangleData0586.coefficient39_40,
  OriginalRow227TriangleData0586.coefficient39_41,
  OriginalRow227TriangleData0586.coefficient39_42,
  OriginalRow227TriangleData0586.coefficient39_43,
  OriginalRow227TriangleData0586.coefficient39_44,
  OriginalRow227TriangleData0586.coefficient39_45,
  OriginalRow227TriangleData0586.coefficient39_46,
  OriginalRow227TriangleData0586.coefficient39_47,
  OriginalRow227TriangleData0586.coefficient39_48,
  OriginalRow227TriangleData0586.coefficient39_49,
  OriginalRow227TriangleData0586.coefficient39_50,
  OriginalRow227TriangleData0586.coefficient39_51,
  OriginalRow227TriangleData0586.coefficient39_52,
  OriginalRow227TriangleData0586.coefficient39_53,
  OriginalRow227TriangleData0586.coefficient39_54,
  OriginalRow227TriangleData0586.coefficient39_55,
  OriginalRow227TriangleData0586.coefficient39_56,
  OriginalRow227TriangleData0586.coefficient39_57,
  OriginalRow227TriangleData0586.coefficient39_58,
  OriginalRow227TriangleData0586.coefficient39_59,
  OriginalRow227TriangleData0586.coefficient39_60,
  OriginalRow227TriangleData0586.coefficient39_61,
  OriginalRow227TriangleData0586.coefficient39_62,
  OriginalRow227TriangleData0586.coefficient39_63,
  OriginalRow227TriangleData0586.coefficient39_64,
  OriginalRow227TriangleData0586.coefficient39_65,
  OriginalRow227TriangleData0586.coefficient39_66,
  OriginalRow227TriangleData0586.coefficient39_67,
  OriginalRow227TriangleData0586.coefficient39_68,
  OriginalRow227TriangleData0586.coefficient39_69
]

theorem values0586_size : values0586.size = 32 := rfl

def block0586 : ℕ → Option IntervalDyadic := segment 38 values0586

theorem block0586_domain : ExactDomain block0586 38 70 := by
  simpa only [values0586_size] using segment_domain 38 values0586

theorem block0586_get (i : Fin 32) :
    block0586 (38 + i.val) = some (values0586[i.val]'(by rw [values0586_size]; exact i.isLt)) := by
  exact segment_get 38 values0586 ⟨i.val, by rw [values0586_size]; exact i.isLt⟩

def values0587 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0587.coefficient39_70,
  OriginalRow227TriangleData0587.coefficient39_71,
  OriginalRow227TriangleData0587.coefficient39_72,
  OriginalRow227TriangleData0587.coefficient39_73,
  OriginalRow227TriangleData0587.coefficient39_74,
  OriginalRow227TriangleData0587.coefficient39_75,
  OriginalRow227TriangleData0587.coefficient39_76,
  OriginalRow227TriangleData0587.coefficient39_77,
  OriginalRow227TriangleData0587.coefficient39_78,
  OriginalRow227TriangleData0587.coefficient39_79,
  OriginalRow227TriangleData0587.coefficient39_80,
  OriginalRow227TriangleData0587.coefficient39_81,
  OriginalRow227TriangleData0587.coefficient39_82,
  OriginalRow227TriangleData0587.coefficient39_83,
  OriginalRow227TriangleData0587.coefficient39_84,
  OriginalRow227TriangleData0587.coefficient39_85,
  OriginalRow227TriangleData0587.coefficient39_86,
  OriginalRow227TriangleData0587.coefficient39_87,
  OriginalRow227TriangleData0587.coefficient39_88,
  OriginalRow227TriangleData0587.coefficient39_89,
  OriginalRow227TriangleData0587.coefficient39_90,
  OriginalRow227TriangleData0587.coefficient39_91,
  OriginalRow227TriangleData0587.coefficient39_92,
  OriginalRow227TriangleData0587.coefficient39_93,
  OriginalRow227TriangleData0587.coefficient39_94,
  OriginalRow227TriangleData0587.coefficient39_95,
  OriginalRow227TriangleData0587.coefficient39_96,
  OriginalRow227TriangleData0587.coefficient39_97,
  OriginalRow227TriangleData0587.coefficient39_98,
  OriginalRow227TriangleData0587.coefficient39_99,
  OriginalRow227TriangleData0587.coefficient39_100,
  OriginalRow227TriangleData0587.coefficient39_101
]

theorem values0587_size : values0587.size = 32 := rfl

def block0587 : ℕ → Option IntervalDyadic := segment 70 values0587

theorem block0587_domain : ExactDomain block0587 70 102 := by
  simpa only [values0587_size] using segment_domain 70 values0587

theorem block0587_get (i : Fin 32) :
    block0587 (70 + i.val) = some (values0587[i.val]'(by rw [values0587_size]; exact i.isLt)) := by
  exact segment_get 70 values0587 ⟨i.val, by rw [values0587_size]; exact i.isLt⟩

def values0588 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0588.coefficient39_102,
  OriginalRow227TriangleData0588.coefficient39_103,
  OriginalRow227TriangleData0588.coefficient39_104,
  OriginalRow227TriangleData0588.coefficient39_105,
  OriginalRow227TriangleData0588.coefficient39_106,
  OriginalRow227TriangleData0588.coefficient39_107,
  OriginalRow227TriangleData0588.coefficient39_108,
  OriginalRow227TriangleData0588.coefficient39_109,
  OriginalRow227TriangleData0588.coefficient39_110,
  OriginalRow227TriangleData0588.coefficient39_111,
  OriginalRow227TriangleData0588.coefficient39_112,
  OriginalRow227TriangleData0588.coefficient39_113,
  OriginalRow227TriangleData0588.coefficient39_114,
  OriginalRow227TriangleData0588.coefficient39_115,
  OriginalRow227TriangleData0588.coefficient39_116,
  OriginalRow227TriangleData0588.coefficient39_117,
  OriginalRow227TriangleData0588.coefficient39_118,
  OriginalRow227TriangleData0588.coefficient39_119,
  OriginalRow227TriangleData0588.coefficient39_120,
  OriginalRow227TriangleData0588.coefficient39_121,
  OriginalRow227TriangleData0588.coefficient39_122,
  OriginalRow227TriangleData0588.coefficient39_123,
  OriginalRow227TriangleData0588.coefficient39_124,
  OriginalRow227TriangleData0588.coefficient39_125,
  OriginalRow227TriangleData0588.coefficient39_126,
  OriginalRow227TriangleData0588.coefficient39_127,
  OriginalRow227TriangleData0588.coefficient39_128,
  OriginalRow227TriangleData0588.coefficient39_129,
  OriginalRow227TriangleData0588.coefficient39_130,
  OriginalRow227TriangleData0588.coefficient39_131,
  OriginalRow227TriangleData0588.coefficient39_132,
  OriginalRow227TriangleData0588.coefficient39_133
]

theorem values0588_size : values0588.size = 32 := rfl

def block0588 : ℕ → Option IntervalDyadic := segment 102 values0588

theorem block0588_domain : ExactDomain block0588 102 134 := by
  simpa only [values0588_size] using segment_domain 102 values0588

theorem block0588_get (i : Fin 32) :
    block0588 (102 + i.val) = some (values0588[i.val]'(by rw [values0588_size]; exact i.isLt)) := by
  exact segment_get 102 values0588 ⟨i.val, by rw [values0588_size]; exact i.isLt⟩

def values0589 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0589.coefficient39_134,
  OriginalRow227TriangleData0589.coefficient39_135,
  OriginalRow227TriangleData0589.coefficient39_136,
  OriginalRow227TriangleData0589.coefficient39_137,
  OriginalRow227TriangleData0589.coefficient39_138,
  OriginalRow227TriangleData0589.coefficient39_139,
  OriginalRow227TriangleData0589.coefficient39_140,
  OriginalRow227TriangleData0589.coefficient39_141,
  OriginalRow227TriangleData0589.coefficient39_142,
  OriginalRow227TriangleData0589.coefficient39_143,
  OriginalRow227TriangleData0589.coefficient39_144,
  OriginalRow227TriangleData0589.coefficient39_145,
  OriginalRow227TriangleData0589.coefficient39_146,
  OriginalRow227TriangleData0589.coefficient39_147,
  OriginalRow227TriangleData0589.coefficient39_148,
  OriginalRow227TriangleData0589.coefficient39_149,
  OriginalRow227TriangleData0589.coefficient39_150,
  OriginalRow227TriangleData0589.coefficient39_151,
  OriginalRow227TriangleData0589.coefficient39_152,
  OriginalRow227TriangleData0589.coefficient39_153,
  OriginalRow227TriangleData0589.coefficient39_154,
  OriginalRow227TriangleData0589.coefficient39_155,
  OriginalRow227TriangleData0589.coefficient39_156,
  OriginalRow227TriangleData0589.coefficient39_157,
  OriginalRow227TriangleData0589.coefficient39_158,
  OriginalRow227TriangleData0589.coefficient39_159,
  OriginalRow227TriangleData0589.coefficient39_160,
  OriginalRow227TriangleData0589.coefficient39_161,
  OriginalRow227TriangleData0589.coefficient39_162,
  OriginalRow227TriangleData0589.coefficient39_163,
  OriginalRow227TriangleData0589.coefficient39_164,
  OriginalRow227TriangleData0589.coefficient39_165
]

theorem values0589_size : values0589.size = 32 := rfl

def block0589 : ℕ → Option IntervalDyadic := segment 134 values0589

theorem block0589_domain : ExactDomain block0589 134 166 := by
  simpa only [values0589_size] using segment_domain 134 values0589

theorem block0589_get (i : Fin 32) :
    block0589 (134 + i.val) = some (values0589[i.val]'(by rw [values0589_size]; exact i.isLt)) := by
  exact segment_get 134 values0589 ⟨i.val, by rw [values0589_size]; exact i.isLt⟩

def values0590 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0590.coefficient39_166,
  OriginalRow227TriangleData0590.coefficient39_167,
  OriginalRow227TriangleData0590.coefficient39_168,
  OriginalRow227TriangleData0590.coefficient39_169,
  OriginalRow227TriangleData0590.coefficient39_170,
  OriginalRow227TriangleData0590.coefficient39_171,
  OriginalRow227TriangleData0590.coefficient39_172,
  OriginalRow227TriangleData0590.coefficient39_173,
  OriginalRow227TriangleData0590.coefficient39_174,
  OriginalRow227TriangleData0590.coefficient39_175,
  OriginalRow227TriangleData0590.coefficient39_176,
  OriginalRow227TriangleData0590.coefficient39_177,
  OriginalRow227TriangleData0590.coefficient39_178,
  OriginalRow227TriangleData0590.coefficient39_179,
  OriginalRow227TriangleData0590.coefficient39_180,
  OriginalRow227TriangleData0590.coefficient39_181,
  OriginalRow227TriangleData0590.coefficient39_182,
  OriginalRow227TriangleData0590.coefficient39_183,
  OriginalRow227TriangleData0590.coefficient39_184,
  OriginalRow227TriangleData0590.coefficient39_185,
  OriginalRow227TriangleData0590.coefficient39_186,
  OriginalRow227TriangleData0590.coefficient39_187,
  OriginalRow227TriangleData0590.coefficient39_188,
  OriginalRow227TriangleData0590.coefficient39_189,
  OriginalRow227TriangleData0590.coefficient39_190,
  OriginalRow227TriangleData0590.coefficient39_191,
  OriginalRow227TriangleData0590.coefficient39_192,
  OriginalRow227TriangleData0590.coefficient39_193,
  OriginalRow227TriangleData0590.coefficient39_194,
  OriginalRow227TriangleData0590.coefficient39_195,
  OriginalRow227TriangleData0590.coefficient39_196,
  OriginalRow227TriangleData0590.coefficient39_197
]

theorem values0590_size : values0590.size = 32 := rfl

def block0590 : ℕ → Option IntervalDyadic := segment 166 values0590

theorem block0590_domain : ExactDomain block0590 166 198 := by
  simpa only [values0590_size] using segment_domain 166 values0590

theorem block0590_get (i : Fin 32) :
    block0590 (166 + i.val) = some (values0590[i.val]'(by rw [values0590_size]; exact i.isLt)) := by
  exact segment_get 166 values0590 ⟨i.val, by rw [values0590_size]; exact i.isLt⟩

def values0591 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0591.coefficient39_198,
  OriginalRow227TriangleData0591.coefficient39_199,
  OriginalRow227TriangleData0591.coefficient39_200,
  OriginalRow227TriangleData0591.coefficient39_201,
  OriginalRow227TriangleData0591.coefficient39_202,
  OriginalRow227TriangleData0591.coefficient39_203,
  OriginalRow227TriangleData0591.coefficient39_204,
  OriginalRow227TriangleData0591.coefficient39_205,
  OriginalRow227TriangleData0591.coefficient39_206,
  OriginalRow227TriangleData0591.coefficient39_207,
  OriginalRow227TriangleData0591.coefficient39_208,
  OriginalRow227TriangleData0591.coefficient39_209,
  OriginalRow227TriangleData0591.coefficient39_210,
  OriginalRow227TriangleData0591.coefficient39_211,
  OriginalRow227TriangleData0591.coefficient39_212,
  OriginalRow227TriangleData0591.coefficient39_213,
  OriginalRow227TriangleData0591.coefficient39_214,
  OriginalRow227TriangleData0591.coefficient39_215,
  OriginalRow227TriangleData0591.coefficient39_216,
  OriginalRow227TriangleData0591.coefficient39_217,
  OriginalRow227TriangleData0591.coefficient39_218,
  OriginalRow227TriangleData0591.coefficient39_219,
  OriginalRow227TriangleData0591.coefficient39_220,
  OriginalRow227TriangleData0591.coefficient39_221,
  OriginalRow227TriangleData0591.coefficient39_222,
  OriginalRow227TriangleData0591.coefficient39_223,
  OriginalRow227TriangleData0591.coefficient39_224,
  OriginalRow227TriangleData0591.coefficient39_225,
  OriginalRow227TriangleData0591.coefficient39_226,
  OriginalRow227TriangleData0591.coefficient39_227,
  OriginalRow227TriangleData0591.coefficient39_228,
  OriginalRow227TriangleData0591.coefficient39_229
]

theorem values0591_size : values0591.size = 32 := rfl

def block0591 : ℕ → Option IntervalDyadic := segment 198 values0591

theorem block0591_domain : ExactDomain block0591 198 230 := by
  simpa only [values0591_size] using segment_domain 198 values0591

theorem block0591_get (i : Fin 32) :
    block0591 (198 + i.val) = some (values0591[i.val]'(by rw [values0591_size]; exact i.isLt)) := by
  exact segment_get 198 values0591 ⟨i.val, by rw [values0591_size]; exact i.isLt⟩

def values0592 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0592.coefficient39_230,
  OriginalRow227TriangleData0592.coefficient39_231,
  OriginalRow227TriangleData0592.coefficient39_232,
  OriginalRow227TriangleData0592.coefficient39_233,
  OriginalRow227TriangleData0592.coefficient39_234,
  OriginalRow227TriangleData0592.coefficient39_235,
  OriginalRow227TriangleData0592.coefficient39_236,
  OriginalRow227TriangleData0592.coefficient39_237,
  OriginalRow227TriangleData0592.coefficient39_238,
  OriginalRow227TriangleData0592.coefficient39_239,
  OriginalRow227TriangleData0592.coefficient39_240,
  OriginalRow227TriangleData0592.coefficient39_241,
  OriginalRow227TriangleData0592.coefficient39_242,
  OriginalRow227TriangleData0592.coefficient39_243,
  OriginalRow227TriangleData0592.coefficient39_244,
  OriginalRow227TriangleData0592.coefficient39_245,
  OriginalRow227TriangleData0592.coefficient39_246,
  OriginalRow227TriangleData0592.coefficient39_247,
  OriginalRow227TriangleData0592.coefficient39_248,
  OriginalRow227TriangleData0592.coefficient39_249,
  OriginalRow227TriangleData0592.coefficient39_250,
  OriginalRow227TriangleData0592.coefficient39_251,
  OriginalRow227TriangleData0592.coefficient39_252,
  OriginalRow227TriangleData0592.coefficient39_253,
  OriginalRow227TriangleData0592.coefficient39_254,
  OriginalRow227TriangleData0592.coefficient39_255,
  OriginalRow227TriangleData0592.coefficient39_256,
  OriginalRow227TriangleData0592.coefficient39_257,
  OriginalRow227TriangleData0592.coefficient39_258,
  OriginalRow227TriangleData0592.coefficient39_259,
  OriginalRow227TriangleData0592.coefficient39_260,
  OriginalRow227TriangleData0592.coefficient39_261
]

theorem values0592_size : values0592.size = 32 := rfl

def block0592 : ℕ → Option IntervalDyadic := segment 230 values0592

theorem block0592_domain : ExactDomain block0592 230 262 := by
  simpa only [values0592_size] using segment_domain 230 values0592

theorem block0592_get (i : Fin 32) :
    block0592 (230 + i.val) = some (values0592[i.val]'(by rw [values0592_size]; exact i.isLt)) := by
  exact segment_get 230 values0592 ⟨i.val, by rw [values0592_size]; exact i.isLt⟩

def values0593 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0593.coefficient39_262,
  OriginalRow227TriangleData0593.coefficient39_263,
  OriginalRow227TriangleData0593.coefficient39_264,
  OriginalRow227TriangleData0593.coefficient39_265,
  OriginalRow227TriangleData0593.coefficient39_266,
  OriginalRow227TriangleData0593.coefficient39_267,
  OriginalRow227TriangleData0593.coefficient39_268,
  OriginalRow227TriangleData0593.coefficient39_269,
  OriginalRow227TriangleData0593.coefficient39_270,
  OriginalRow227TriangleData0593.coefficient39_271,
  OriginalRow227TriangleData0593.coefficient39_272,
  OriginalRow227TriangleData0593.coefficient39_273,
  OriginalRow227TriangleData0593.coefficient39_274,
  OriginalRow227TriangleData0593.coefficient39_275,
  OriginalRow227TriangleData0593.coefficient39_276,
  OriginalRow227TriangleData0593.coefficient39_277,
  OriginalRow227TriangleData0593.coefficient39_278,
  OriginalRow227TriangleData0593.coefficient39_279,
  OriginalRow227TriangleData0593.coefficient39_280,
  OriginalRow227TriangleData0593.coefficient39_281,
  OriginalRow227TriangleData0593.coefficient39_282,
  OriginalRow227TriangleData0593.coefficient39_283,
  OriginalRow227TriangleData0593.coefficient39_284,
  OriginalRow227TriangleData0593.coefficient39_285,
  OriginalRow227TriangleData0593.coefficient39_286,
  OriginalRow227TriangleData0593.coefficient39_287,
  OriginalRow227TriangleData0593.coefficient39_288,
  OriginalRow227TriangleData0593.coefficient39_289,
  OriginalRow227TriangleData0593.coefficient39_290,
  OriginalRow227TriangleData0593.coefficient39_291,
  OriginalRow227TriangleData0593.coefficient39_292,
  OriginalRow227TriangleData0593.coefficient39_293
]

theorem values0593_size : values0593.size = 32 := rfl

def block0593 : ℕ → Option IntervalDyadic := segment 262 values0593

theorem block0593_domain : ExactDomain block0593 262 294 := by
  simpa only [values0593_size] using segment_domain 262 values0593

theorem block0593_get (i : Fin 32) :
    block0593 (262 + i.val) = some (values0593[i.val]'(by rw [values0593_size]; exact i.isLt)) := by
  exact segment_get 262 values0593 ⟨i.val, by rw [values0593_size]; exact i.isLt⟩

def values0594 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0594.coefficient39_294,
  OriginalRow227TriangleData0594.coefficient39_295,
  OriginalRow227TriangleData0594.coefficient39_296,
  OriginalRow227TriangleData0594.coefficient39_297,
  OriginalRow227TriangleData0594.coefficient39_298,
  OriginalRow227TriangleData0594.coefficient39_299,
  OriginalRow227TriangleData0594.coefficient39_300,
  OriginalRow227TriangleData0594.coefficient39_301,
  OriginalRow227TriangleData0594.coefficient39_302,
  OriginalRow227TriangleData0594.coefficient39_303,
  OriginalRow227TriangleData0594.coefficient39_304,
  OriginalRow227TriangleData0594.coefficient39_305,
  OriginalRow227TriangleData0594.coefficient39_306,
  OriginalRow227TriangleData0594.coefficient39_307,
  OriginalRow227TriangleData0594.coefficient39_308,
  OriginalRow227TriangleData0594.coefficient39_309,
  OriginalRow227TriangleData0594.coefficient39_310,
  OriginalRow227TriangleData0594.coefficient39_311,
  OriginalRow227TriangleData0594.coefficient39_312,
  OriginalRow227TriangleData0594.coefficient39_313,
  OriginalRow227TriangleData0594.coefficient39_314,
  OriginalRow227TriangleData0594.coefficient39_315,
  OriginalRow227TriangleData0594.coefficient39_316,
  OriginalRow227TriangleData0594.coefficient39_317,
  OriginalRow227TriangleData0594.coefficient39_318,
  OriginalRow227TriangleData0594.coefficient39_319,
  OriginalRow227TriangleData0594.coefficient39_320,
  OriginalRow227TriangleData0594.coefficient39_321,
  OriginalRow227TriangleData0594.coefficient39_322,
  OriginalRow227TriangleData0594.coefficient39_323,
  OriginalRow227TriangleData0594.coefficient39_324,
  OriginalRow227TriangleData0594.coefficient39_325
]

theorem values0594_size : values0594.size = 32 := rfl

def block0594 : ℕ → Option IntervalDyadic := segment 294 values0594

theorem block0594_domain : ExactDomain block0594 294 326 := by
  simpa only [values0594_size] using segment_domain 294 values0594

theorem block0594_get (i : Fin 32) :
    block0594 (294 + i.val) = some (values0594[i.val]'(by rw [values0594_size]; exact i.isLt)) := by
  exact segment_get 294 values0594 ⟨i.val, by rw [values0594_size]; exact i.isLt⟩

def values0595 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0595.coefficient39_326,
  OriginalRow227TriangleData0595.coefficient39_327,
  OriginalRow227TriangleData0595.coefficient39_328,
  OriginalRow227TriangleData0595.coefficient39_329,
  OriginalRow227TriangleData0595.coefficient39_330,
  OriginalRow227TriangleData0595.coefficient39_331,
  OriginalRow227TriangleData0595.coefficient39_332,
  OriginalRow227TriangleData0595.coefficient39_333,
  OriginalRow227TriangleData0595.coefficient39_334,
  OriginalRow227TriangleData0595.coefficient39_335,
  OriginalRow227TriangleData0595.coefficient39_336,
  OriginalRow227TriangleData0595.coefficient39_337,
  OriginalRow227TriangleData0595.coefficient39_338,
  OriginalRow227TriangleData0595.coefficient39_339,
  OriginalRow227TriangleData0595.coefficient39_340,
  OriginalRow227TriangleData0595.coefficient39_341,
  OriginalRow227TriangleData0595.coefficient39_342,
  OriginalRow227TriangleData0595.coefficient39_343,
  OriginalRow227TriangleData0595.coefficient39_344,
  OriginalRow227TriangleData0595.coefficient39_345,
  OriginalRow227TriangleData0595.coefficient39_346,
  OriginalRow227TriangleData0595.coefficient39_347,
  OriginalRow227TriangleData0595.coefficient39_348,
  OriginalRow227TriangleData0595.coefficient39_349,
  OriginalRow227TriangleData0595.coefficient39_350,
  OriginalRow227TriangleData0595.coefficient39_351,
  OriginalRow227TriangleData0595.coefficient39_352,
  OriginalRow227TriangleData0595.coefficient39_353,
  OriginalRow227TriangleData0595.coefficient39_354,
  OriginalRow227TriangleData0595.coefficient39_355,
  OriginalRow227TriangleData0595.coefficient39_356,
  OriginalRow227TriangleData0595.coefficient39_357
]

theorem values0595_size : values0595.size = 32 := rfl

def block0595 : ℕ → Option IntervalDyadic := segment 326 values0595

theorem block0595_domain : ExactDomain block0595 326 358 := by
  simpa only [values0595_size] using segment_domain 326 values0595

theorem block0595_get (i : Fin 32) :
    block0595 (326 + i.val) = some (values0595[i.val]'(by rw [values0595_size]; exact i.isLt)) := by
  exact segment_get 326 values0595 ⟨i.val, by rw [values0595_size]; exact i.isLt⟩

def values0596 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0596.coefficient39_358,
  OriginalRow227TriangleData0596.coefficient39_359,
  OriginalRow227TriangleData0596.coefficient39_360,
  OriginalRow227TriangleData0596.coefficient39_361,
  OriginalRow227TriangleData0596.coefficient39_362,
  OriginalRow227TriangleData0596.coefficient39_363,
  OriginalRow227TriangleData0596.coefficient39_364,
  OriginalRow227TriangleData0596.coefficient39_365,
  OriginalRow227TriangleData0596.coefficient39_366,
  OriginalRow227TriangleData0596.coefficient39_367,
  OriginalRow227TriangleData0596.coefficient39_368,
  OriginalRow227TriangleData0596.coefficient39_369,
  OriginalRow227TriangleData0596.coefficient39_370,
  OriginalRow227TriangleData0596.coefficient39_371,
  OriginalRow227TriangleData0596.coefficient39_372,
  OriginalRow227TriangleData0596.coefficient39_373,
  OriginalRow227TriangleData0596.coefficient39_374,
  OriginalRow227TriangleData0596.coefficient39_375,
  OriginalRow227TriangleData0596.coefficient39_376,
  OriginalRow227TriangleData0596.coefficient39_377,
  OriginalRow227TriangleData0596.coefficient39_378,
  OriginalRow227TriangleData0596.coefficient39_379,
  OriginalRow227TriangleData0596.coefficient39_380,
  OriginalRow227TriangleData0596.coefficient39_381,
  OriginalRow227TriangleData0596.coefficient39_382,
  OriginalRow227TriangleData0596.coefficient39_383,
  OriginalRow227TriangleData0596.coefficient39_384,
  OriginalRow227TriangleData0596.coefficient39_385,
  OriginalRow227TriangleData0596.coefficient39_386,
  OriginalRow227TriangleData0596.coefficient39_387,
  OriginalRow227TriangleData0596.coefficient39_388,
  OriginalRow227TriangleData0596.coefficient39_389
]

theorem values0596_size : values0596.size = 32 := rfl

def block0596 : ℕ → Option IntervalDyadic := segment 358 values0596

theorem block0596_domain : ExactDomain block0596 358 390 := by
  simpa only [values0596_size] using segment_domain 358 values0596

theorem block0596_get (i : Fin 32) :
    block0596 (358 + i.val) = some (values0596[i.val]'(by rw [values0596_size]; exact i.isLt)) := by
  exact segment_get 358 values0596 ⟨i.val, by rw [values0596_size]; exact i.isLt⟩

def values0597 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0597.coefficient39_390,
  OriginalRow227TriangleData0597.coefficient39_391,
  OriginalRow227TriangleData0597.coefficient39_392,
  OriginalRow227TriangleData0597.coefficient39_393,
  OriginalRow227TriangleData0597.coefficient39_394,
  OriginalRow227TriangleData0597.coefficient39_395,
  OriginalRow227TriangleData0597.coefficient39_396,
  OriginalRow227TriangleData0597.coefficient39_397,
  OriginalRow227TriangleData0597.coefficient39_398,
  OriginalRow227TriangleData0597.coefficient39_399,
  OriginalRow227TriangleData0597.coefficient39_400,
  OriginalRow227TriangleData0597.coefficient39_401,
  OriginalRow227TriangleData0597.coefficient39_402,
  OriginalRow227TriangleData0597.coefficient39_403,
  OriginalRow227TriangleData0597.coefficient39_404,
  OriginalRow227TriangleData0597.coefficient39_405,
  OriginalRow227TriangleData0597.coefficient39_406,
  OriginalRow227TriangleData0597.coefficient39_407,
  OriginalRow227TriangleData0597.coefficient39_408,
  OriginalRow227TriangleData0597.coefficient39_409,
  OriginalRow227TriangleData0597.coefficient39_410,
  OriginalRow227TriangleData0597.coefficient39_411,
  OriginalRow227TriangleData0597.coefficient39_412,
  OriginalRow227TriangleData0597.coefficient39_413,
  OriginalRow227TriangleData0597.coefficient39_414,
  OriginalRow227TriangleData0597.coefficient39_415,
  OriginalRow227TriangleData0597.coefficient39_416,
  OriginalRow227TriangleData0597.coefficient39_417,
  OriginalRow227TriangleData0597.coefficient39_418,
  OriginalRow227TriangleData0597.coefficient39_419,
  OriginalRow227TriangleData0597.coefficient39_420,
  OriginalRow227TriangleData0597.coefficient39_421
]

theorem values0597_size : values0597.size = 32 := rfl

def block0597 : ℕ → Option IntervalDyadic := segment 390 values0597

theorem block0597_domain : ExactDomain block0597 390 422 := by
  simpa only [values0597_size] using segment_domain 390 values0597

theorem block0597_get (i : Fin 32) :
    block0597 (390 + i.val) = some (values0597[i.val]'(by rw [values0597_size]; exact i.isLt)) := by
  exact segment_get 390 values0597 ⟨i.val, by rw [values0597_size]; exact i.isLt⟩

def values0598 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0598.coefficient39_422,
  OriginalRow227TriangleData0598.coefficient39_423,
  OriginalRow227TriangleData0598.coefficient39_424,
  OriginalRow227TriangleData0598.coefficient39_425,
  OriginalRow227TriangleData0598.coefficient39_426,
  OriginalRow227TriangleData0598.coefficient39_427,
  OriginalRow227TriangleData0598.coefficient39_428,
  OriginalRow227TriangleData0598.coefficient39_429,
  OriginalRow227TriangleData0598.coefficient39_430,
  OriginalRow227TriangleData0598.coefficient39_431,
  OriginalRow227TriangleData0598.coefficient39_432,
  OriginalRow227TriangleData0598.coefficient39_433,
  OriginalRow227TriangleData0598.coefficient39_434,
  OriginalRow227TriangleData0598.coefficient39_435,
  OriginalRow227TriangleData0598.coefficient39_436,
  OriginalRow227TriangleData0598.coefficient39_437,
  OriginalRow227TriangleData0598.coefficient39_438,
  OriginalRow227TriangleData0598.coefficient39_439,
  OriginalRow227TriangleData0598.coefficient39_440,
  OriginalRow227TriangleData0598.coefficient39_441,
  OriginalRow227TriangleData0598.coefficient39_442,
  OriginalRow227TriangleData0598.coefficient39_443,
  OriginalRow227TriangleData0598.coefficient39_444,
  OriginalRow227TriangleData0598.coefficient39_445,
  OriginalRow227TriangleData0598.coefficient39_446,
  OriginalRow227TriangleData0598.coefficient39_447,
  OriginalRow227TriangleData0598.coefficient39_448,
  OriginalRow227TriangleData0598.coefficient39_449,
  OriginalRow227TriangleData0598.coefficient39_450,
  OriginalRow227TriangleData0598.coefficient39_451,
  OriginalRow227TriangleData0598.coefficient39_452,
  OriginalRow227TriangleData0598.coefficient39_453
]

theorem values0598_size : values0598.size = 32 := rfl

def block0598 : ℕ → Option IntervalDyadic := segment 422 values0598

theorem block0598_domain : ExactDomain block0598 422 454 := by
  simpa only [values0598_size] using segment_domain 422 values0598

theorem block0598_get (i : Fin 32) :
    block0598 (422 + i.val) = some (values0598[i.val]'(by rw [values0598_size]; exact i.isLt)) := by
  exact segment_get 422 values0598 ⟨i.val, by rw [values0598_size]; exact i.isLt⟩

def values0599 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0599.coefficient39_454,
  OriginalRow227TriangleData0599.coefficient39_455,
  OriginalRow227TriangleData0599.coefficient39_456,
  OriginalRow227TriangleData0599.coefficient39_457,
  OriginalRow227TriangleData0599.coefficient39_458,
  OriginalRow227TriangleData0599.coefficient39_459,
  OriginalRow227TriangleData0599.coefficient39_460,
  OriginalRow227TriangleData0599.coefficient39_461,
  OriginalRow227TriangleData0599.coefficient39_462
]

theorem values0599_size : values0599.size = 9 := rfl

def block0599 : ℕ → Option IntervalDyadic := segment 454 values0599

theorem block0599_domain : ExactDomain block0599 454 463 := by
  simpa only [values0599_size] using segment_domain 454 values0599

theorem block0599_get (i : Fin 9) :
    block0599 (454 + i.val) = some (values0599[i.val]'(by rw [values0599_size]; exact i.isLt)) := by
  exact segment_get 454 values0599 ⟨i.val, by rw [values0599_size]; exact i.isLt⟩

def node0070_0134 : ℕ → Option IntervalDyadic := split 102 block0587 block0588

theorem node0070_0134_domain : ExactDomain node0070_0134 70 134 := by
  exact split_domain (by decide) (by decide) block0587_domain block0588_domain

def node0038_0134 : ℕ → Option IntervalDyadic := split 70 block0586 node0070_0134

theorem node0038_0134_domain : ExactDomain node0038_0134 38 134 := by
  exact split_domain (by decide) (by decide) block0586_domain node0070_0134_domain

def node0134_0198 : ℕ → Option IntervalDyadic := split 166 block0589 block0590

theorem node0134_0198_domain : ExactDomain node0134_0198 134 198 := by
  exact split_domain (by decide) (by decide) block0589_domain block0590_domain

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block0591 block0592

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block0591_domain block0592_domain

def node0134_0262 : ℕ → Option IntervalDyadic := split 198 node0134_0198 node0198_0262

theorem node0134_0262_domain : ExactDomain node0134_0262 134 262 := by
  exact split_domain (by decide) (by decide) node0134_0198_domain node0198_0262_domain

def node0038_0262 : ℕ → Option IntervalDyadic := split 134 node0038_0134 node0134_0262

theorem node0038_0262_domain : ExactDomain node0038_0262 38 262 := by
  exact split_domain (by decide) (by decide) node0038_0134_domain node0134_0262_domain

def node0294_0358 : ℕ → Option IntervalDyadic := split 326 block0594 block0595

theorem node0294_0358_domain : ExactDomain node0294_0358 294 358 := by
  exact split_domain (by decide) (by decide) block0594_domain block0595_domain

def node0262_0358 : ℕ → Option IntervalDyadic := split 294 block0593 node0294_0358

theorem node0262_0358_domain : ExactDomain node0262_0358 262 358 := by
  exact split_domain (by decide) (by decide) block0593_domain node0294_0358_domain

def node0358_0422 : ℕ → Option IntervalDyadic := split 390 block0596 block0597

theorem node0358_0422_domain : ExactDomain node0358_0422 358 422 := by
  exact split_domain (by decide) (by decide) block0596_domain block0597_domain

def node0422_0463 : ℕ → Option IntervalDyadic := split 454 block0598 block0599

theorem node0422_0463_domain : ExactDomain node0422_0463 422 463 := by
  exact split_domain (by decide) (by decide) block0598_domain block0599_domain

def node0358_0463 : ℕ → Option IntervalDyadic := split 422 node0358_0422 node0422_0463

theorem node0358_0463_domain : ExactDomain node0358_0463 358 463 := by
  exact split_domain (by decide) (by decide) node0358_0422_domain node0422_0463_domain

def node0262_0463 : ℕ → Option IntervalDyadic := split 358 node0262_0358 node0358_0463

theorem node0262_0463_domain : ExactDomain node0262_0463 262 463 := by
  exact split_domain (by decide) (by decide) node0262_0358_domain node0358_0463_domain

def node0038_0463 : ℕ → Option IntervalDyadic := split 262 node0038_0262 node0262_0463

theorem node0038_0463_domain : ExactDomain node0038_0463 38 463 := by
  exact split_domain (by decide) (by decide) node0038_0262_domain node0262_0463_domain

def lookup : ℕ → Option IntervalDyadic := node0038_0463

theorem lookup_domain : ExactDomain lookup 38 463 :=
  node0038_0463_domain

theorem block0586_lookup (i : Fin 32) :
    lookup (38 + i.val) = some (values0586[i.val]'(by rw [values0586_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (38 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_left 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0038_0134, split_left 70 block0586 node0070_0134 (by omega)]
  exact block0586_get i

theorem block0587_lookup (i : Fin 32) :
    lookup (70 + i.val) = some (values0587[i.val]'(by rw [values0587_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (70 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_left 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0038_0134, split_right 70 block0586 node0070_0134 (by omega)]
  rw [node0070_0134, split_left 102 block0587 block0588 (by omega)]
  exact block0587_get i

theorem block0588_lookup (i : Fin 32) :
    lookup (102 + i.val) = some (values0588[i.val]'(by rw [values0588_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (102 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_left 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0038_0134, split_right 70 block0586 node0070_0134 (by omega)]
  rw [node0070_0134, split_right 102 block0587 block0588 (by omega)]
  exact block0588_get i

theorem block0589_lookup (i : Fin 32) :
    lookup (134 + i.val) = some (values0589[i.val]'(by rw [values0589_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (134 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_right 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_left 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0134_0198, split_left 166 block0589 block0590 (by omega)]
  exact block0589_get i

theorem block0590_lookup (i : Fin 32) :
    lookup (166 + i.val) = some (values0590[i.val]'(by rw [values0590_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (166 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_right 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_left 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0134_0198, split_right 166 block0589 block0590 (by omega)]
  exact block0590_get i

theorem block0591_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values0591[i.val]'(by rw [values0591_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (198 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_right 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_right 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0198_0262, split_left 230 block0591 block0592 (by omega)]
  exact block0591_get i

theorem block0592_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values0592[i.val]'(by rw [values0592_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (230 + i.val) = _
  rw [node0038_0463, split_left 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0038_0262, split_right 134 node0038_0134 node0134_0262 (by omega)]
  rw [node0134_0262, split_right 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0198_0262, split_right 230 block0591 block0592 (by omega)]
  exact block0592_get i

theorem block0593_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values0593[i.val]'(by rw [values0593_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (262 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_left 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0262_0358, split_left 294 block0593 node0294_0358 (by omega)]
  exact block0593_get i

theorem block0594_lookup (i : Fin 32) :
    lookup (294 + i.val) = some (values0594[i.val]'(by rw [values0594_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (294 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_left 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0262_0358, split_right 294 block0593 node0294_0358 (by omega)]
  rw [node0294_0358, split_left 326 block0594 block0595 (by omega)]
  exact block0594_get i

theorem block0595_lookup (i : Fin 32) :
    lookup (326 + i.val) = some (values0595[i.val]'(by rw [values0595_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (326 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_left 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0262_0358, split_right 294 block0593 node0294_0358 (by omega)]
  rw [node0294_0358, split_right 326 block0594 block0595 (by omega)]
  exact block0595_get i

theorem block0596_lookup (i : Fin 32) :
    lookup (358 + i.val) = some (values0596[i.val]'(by rw [values0596_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (358 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_right 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0358_0463, split_left 422 node0358_0422 node0422_0463 (by omega)]
  rw [node0358_0422, split_left 390 block0596 block0597 (by omega)]
  exact block0596_get i

theorem block0597_lookup (i : Fin 32) :
    lookup (390 + i.val) = some (values0597[i.val]'(by rw [values0597_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (390 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_right 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0358_0463, split_left 422 node0358_0422 node0422_0463 (by omega)]
  rw [node0358_0422, split_right 390 block0596 block0597 (by omega)]
  exact block0597_get i

theorem block0598_lookup (i : Fin 32) :
    lookup (422 + i.val) = some (values0598[i.val]'(by rw [values0598_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (422 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_right 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0358_0463, split_right 422 node0358_0422 node0422_0463 (by omega)]
  rw [node0422_0463, split_left 454 block0598 block0599 (by omega)]
  exact block0598_get i

theorem block0599_lookup (i : Fin 9) :
    lookup (454 + i.val) = some (values0599[i.val]'(by rw [values0599_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0038_0463 (454 + i.val) = _
  rw [node0038_0463, split_right 262 node0038_0262 node0262_0463 (by omega)]
  rw [node0262_0463, split_right 358 node0262_0358 node0358_0463 (by omega)]
  rw [node0358_0463, split_right 422 node0358_0422 node0422_0463 (by omega)]
  rw [node0422_0463, split_right 454 block0598 block0599 (by omega)]
  exact block0599_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0586_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0586_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0587_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0587_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0588_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0588_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0589_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0589_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0590_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0590_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0591_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0591_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0592_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0592_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0593_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0593_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0594_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0594_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0595_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0595_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0596_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0596_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0597_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0597_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0598_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0598_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0599_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0599_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0586_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0587_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0588_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0589_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0590_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0591_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0592_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0593_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0594_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0595_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0596_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0597_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0598_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow039.block0599_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow039
