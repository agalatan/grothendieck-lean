import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0614
import Grothe.UpperChaos.OriginalRow227TriangleData0615
import Grothe.UpperChaos.OriginalRow227TriangleData0616
import Grothe.UpperChaos.OriginalRow227TriangleData0617
import Grothe.UpperChaos.OriginalRow227TriangleData0618
import Grothe.UpperChaos.OriginalRow227TriangleData0619
import Grothe.UpperChaos.OriginalRow227TriangleData0620
import Grothe.UpperChaos.OriginalRow227TriangleData0621
import Grothe.UpperChaos.OriginalRow227TriangleData0622
import Grothe.UpperChaos.OriginalRow227TriangleData0623
import Grothe.UpperChaos.OriginalRow227TriangleData0624
import Grothe.UpperChaos.OriginalRow227TriangleData0625
import Grothe.UpperChaos.OriginalRow227TriangleData0626
import Grothe.UpperChaos.OriginalRow227TriangleData0627

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow041

open ConditionalTableLookup

def values0614 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0614.coefficient41_40,
  OriginalRow227TriangleData0614.coefficient41_41,
  OriginalRow227TriangleData0614.coefficient41_42,
  OriginalRow227TriangleData0614.coefficient41_43,
  OriginalRow227TriangleData0614.coefficient41_44,
  OriginalRow227TriangleData0614.coefficient41_45,
  OriginalRow227TriangleData0614.coefficient41_46,
  OriginalRow227TriangleData0614.coefficient41_47,
  OriginalRow227TriangleData0614.coefficient41_48,
  OriginalRow227TriangleData0614.coefficient41_49,
  OriginalRow227TriangleData0614.coefficient41_50,
  OriginalRow227TriangleData0614.coefficient41_51,
  OriginalRow227TriangleData0614.coefficient41_52,
  OriginalRow227TriangleData0614.coefficient41_53,
  OriginalRow227TriangleData0614.coefficient41_54,
  OriginalRow227TriangleData0614.coefficient41_55,
  OriginalRow227TriangleData0614.coefficient41_56,
  OriginalRow227TriangleData0614.coefficient41_57,
  OriginalRow227TriangleData0614.coefficient41_58,
  OriginalRow227TriangleData0614.coefficient41_59,
  OriginalRow227TriangleData0614.coefficient41_60,
  OriginalRow227TriangleData0614.coefficient41_61,
  OriginalRow227TriangleData0614.coefficient41_62,
  OriginalRow227TriangleData0614.coefficient41_63,
  OriginalRow227TriangleData0614.coefficient41_64,
  OriginalRow227TriangleData0614.coefficient41_65,
  OriginalRow227TriangleData0614.coefficient41_66,
  OriginalRow227TriangleData0614.coefficient41_67,
  OriginalRow227TriangleData0614.coefficient41_68,
  OriginalRow227TriangleData0614.coefficient41_69,
  OriginalRow227TriangleData0614.coefficient41_70,
  OriginalRow227TriangleData0614.coefficient41_71
]

theorem values0614_size : values0614.size = 32 := rfl

def block0614 : ℕ → Option IntervalDyadic := segment 40 values0614

theorem block0614_domain : ExactDomain block0614 40 72 := by
  simpa only [values0614_size] using segment_domain 40 values0614

theorem block0614_get (i : Fin 32) :
    block0614 (40 + i.val) = some (values0614[i.val]'(by rw [values0614_size]; exact i.isLt)) := by
  exact segment_get 40 values0614 ⟨i.val, by rw [values0614_size]; exact i.isLt⟩

def values0615 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0615.coefficient41_72,
  OriginalRow227TriangleData0615.coefficient41_73,
  OriginalRow227TriangleData0615.coefficient41_74,
  OriginalRow227TriangleData0615.coefficient41_75,
  OriginalRow227TriangleData0615.coefficient41_76,
  OriginalRow227TriangleData0615.coefficient41_77,
  OriginalRow227TriangleData0615.coefficient41_78,
  OriginalRow227TriangleData0615.coefficient41_79,
  OriginalRow227TriangleData0615.coefficient41_80,
  OriginalRow227TriangleData0615.coefficient41_81,
  OriginalRow227TriangleData0615.coefficient41_82,
  OriginalRow227TriangleData0615.coefficient41_83,
  OriginalRow227TriangleData0615.coefficient41_84,
  OriginalRow227TriangleData0615.coefficient41_85,
  OriginalRow227TriangleData0615.coefficient41_86,
  OriginalRow227TriangleData0615.coefficient41_87,
  OriginalRow227TriangleData0615.coefficient41_88,
  OriginalRow227TriangleData0615.coefficient41_89,
  OriginalRow227TriangleData0615.coefficient41_90,
  OriginalRow227TriangleData0615.coefficient41_91,
  OriginalRow227TriangleData0615.coefficient41_92,
  OriginalRow227TriangleData0615.coefficient41_93,
  OriginalRow227TriangleData0615.coefficient41_94,
  OriginalRow227TriangleData0615.coefficient41_95,
  OriginalRow227TriangleData0615.coefficient41_96,
  OriginalRow227TriangleData0615.coefficient41_97,
  OriginalRow227TriangleData0615.coefficient41_98,
  OriginalRow227TriangleData0615.coefficient41_99,
  OriginalRow227TriangleData0615.coefficient41_100,
  OriginalRow227TriangleData0615.coefficient41_101,
  OriginalRow227TriangleData0615.coefficient41_102,
  OriginalRow227TriangleData0615.coefficient41_103
]

theorem values0615_size : values0615.size = 32 := rfl

def block0615 : ℕ → Option IntervalDyadic := segment 72 values0615

theorem block0615_domain : ExactDomain block0615 72 104 := by
  simpa only [values0615_size] using segment_domain 72 values0615

theorem block0615_get (i : Fin 32) :
    block0615 (72 + i.val) = some (values0615[i.val]'(by rw [values0615_size]; exact i.isLt)) := by
  exact segment_get 72 values0615 ⟨i.val, by rw [values0615_size]; exact i.isLt⟩

def values0616 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0616.coefficient41_104,
  OriginalRow227TriangleData0616.coefficient41_105,
  OriginalRow227TriangleData0616.coefficient41_106,
  OriginalRow227TriangleData0616.coefficient41_107,
  OriginalRow227TriangleData0616.coefficient41_108,
  OriginalRow227TriangleData0616.coefficient41_109,
  OriginalRow227TriangleData0616.coefficient41_110,
  OriginalRow227TriangleData0616.coefficient41_111,
  OriginalRow227TriangleData0616.coefficient41_112,
  OriginalRow227TriangleData0616.coefficient41_113,
  OriginalRow227TriangleData0616.coefficient41_114,
  OriginalRow227TriangleData0616.coefficient41_115,
  OriginalRow227TriangleData0616.coefficient41_116,
  OriginalRow227TriangleData0616.coefficient41_117,
  OriginalRow227TriangleData0616.coefficient41_118,
  OriginalRow227TriangleData0616.coefficient41_119,
  OriginalRow227TriangleData0616.coefficient41_120,
  OriginalRow227TriangleData0616.coefficient41_121,
  OriginalRow227TriangleData0616.coefficient41_122,
  OriginalRow227TriangleData0616.coefficient41_123,
  OriginalRow227TriangleData0616.coefficient41_124,
  OriginalRow227TriangleData0616.coefficient41_125,
  OriginalRow227TriangleData0616.coefficient41_126,
  OriginalRow227TriangleData0616.coefficient41_127,
  OriginalRow227TriangleData0616.coefficient41_128,
  OriginalRow227TriangleData0616.coefficient41_129,
  OriginalRow227TriangleData0616.coefficient41_130,
  OriginalRow227TriangleData0616.coefficient41_131,
  OriginalRow227TriangleData0616.coefficient41_132,
  OriginalRow227TriangleData0616.coefficient41_133,
  OriginalRow227TriangleData0616.coefficient41_134,
  OriginalRow227TriangleData0616.coefficient41_135
]

theorem values0616_size : values0616.size = 32 := rfl

def block0616 : ℕ → Option IntervalDyadic := segment 104 values0616

theorem block0616_domain : ExactDomain block0616 104 136 := by
  simpa only [values0616_size] using segment_domain 104 values0616

theorem block0616_get (i : Fin 32) :
    block0616 (104 + i.val) = some (values0616[i.val]'(by rw [values0616_size]; exact i.isLt)) := by
  exact segment_get 104 values0616 ⟨i.val, by rw [values0616_size]; exact i.isLt⟩

def values0617 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0617.coefficient41_136,
  OriginalRow227TriangleData0617.coefficient41_137,
  OriginalRow227TriangleData0617.coefficient41_138,
  OriginalRow227TriangleData0617.coefficient41_139,
  OriginalRow227TriangleData0617.coefficient41_140,
  OriginalRow227TriangleData0617.coefficient41_141,
  OriginalRow227TriangleData0617.coefficient41_142,
  OriginalRow227TriangleData0617.coefficient41_143,
  OriginalRow227TriangleData0617.coefficient41_144,
  OriginalRow227TriangleData0617.coefficient41_145,
  OriginalRow227TriangleData0617.coefficient41_146,
  OriginalRow227TriangleData0617.coefficient41_147,
  OriginalRow227TriangleData0617.coefficient41_148,
  OriginalRow227TriangleData0617.coefficient41_149,
  OriginalRow227TriangleData0617.coefficient41_150,
  OriginalRow227TriangleData0617.coefficient41_151,
  OriginalRow227TriangleData0617.coefficient41_152,
  OriginalRow227TriangleData0617.coefficient41_153,
  OriginalRow227TriangleData0617.coefficient41_154,
  OriginalRow227TriangleData0617.coefficient41_155,
  OriginalRow227TriangleData0617.coefficient41_156,
  OriginalRow227TriangleData0617.coefficient41_157,
  OriginalRow227TriangleData0617.coefficient41_158,
  OriginalRow227TriangleData0617.coefficient41_159,
  OriginalRow227TriangleData0617.coefficient41_160,
  OriginalRow227TriangleData0617.coefficient41_161,
  OriginalRow227TriangleData0617.coefficient41_162,
  OriginalRow227TriangleData0617.coefficient41_163,
  OriginalRow227TriangleData0617.coefficient41_164,
  OriginalRow227TriangleData0617.coefficient41_165,
  OriginalRow227TriangleData0617.coefficient41_166,
  OriginalRow227TriangleData0617.coefficient41_167
]

theorem values0617_size : values0617.size = 32 := rfl

def block0617 : ℕ → Option IntervalDyadic := segment 136 values0617

theorem block0617_domain : ExactDomain block0617 136 168 := by
  simpa only [values0617_size] using segment_domain 136 values0617

theorem block0617_get (i : Fin 32) :
    block0617 (136 + i.val) = some (values0617[i.val]'(by rw [values0617_size]; exact i.isLt)) := by
  exact segment_get 136 values0617 ⟨i.val, by rw [values0617_size]; exact i.isLt⟩

def values0618 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0618.coefficient41_168,
  OriginalRow227TriangleData0618.coefficient41_169,
  OriginalRow227TriangleData0618.coefficient41_170,
  OriginalRow227TriangleData0618.coefficient41_171,
  OriginalRow227TriangleData0618.coefficient41_172,
  OriginalRow227TriangleData0618.coefficient41_173,
  OriginalRow227TriangleData0618.coefficient41_174,
  OriginalRow227TriangleData0618.coefficient41_175,
  OriginalRow227TriangleData0618.coefficient41_176,
  OriginalRow227TriangleData0618.coefficient41_177,
  OriginalRow227TriangleData0618.coefficient41_178,
  OriginalRow227TriangleData0618.coefficient41_179,
  OriginalRow227TriangleData0618.coefficient41_180,
  OriginalRow227TriangleData0618.coefficient41_181,
  OriginalRow227TriangleData0618.coefficient41_182,
  OriginalRow227TriangleData0618.coefficient41_183,
  OriginalRow227TriangleData0618.coefficient41_184,
  OriginalRow227TriangleData0618.coefficient41_185,
  OriginalRow227TriangleData0618.coefficient41_186,
  OriginalRow227TriangleData0618.coefficient41_187,
  OriginalRow227TriangleData0618.coefficient41_188,
  OriginalRow227TriangleData0618.coefficient41_189,
  OriginalRow227TriangleData0618.coefficient41_190,
  OriginalRow227TriangleData0618.coefficient41_191,
  OriginalRow227TriangleData0618.coefficient41_192,
  OriginalRow227TriangleData0618.coefficient41_193,
  OriginalRow227TriangleData0618.coefficient41_194,
  OriginalRow227TriangleData0618.coefficient41_195,
  OriginalRow227TriangleData0618.coefficient41_196,
  OriginalRow227TriangleData0618.coefficient41_197,
  OriginalRow227TriangleData0618.coefficient41_198,
  OriginalRow227TriangleData0618.coefficient41_199
]

theorem values0618_size : values0618.size = 32 := rfl

def block0618 : ℕ → Option IntervalDyadic := segment 168 values0618

theorem block0618_domain : ExactDomain block0618 168 200 := by
  simpa only [values0618_size] using segment_domain 168 values0618

theorem block0618_get (i : Fin 32) :
    block0618 (168 + i.val) = some (values0618[i.val]'(by rw [values0618_size]; exact i.isLt)) := by
  exact segment_get 168 values0618 ⟨i.val, by rw [values0618_size]; exact i.isLt⟩

def values0619 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0619.coefficient41_200,
  OriginalRow227TriangleData0619.coefficient41_201,
  OriginalRow227TriangleData0619.coefficient41_202,
  OriginalRow227TriangleData0619.coefficient41_203,
  OriginalRow227TriangleData0619.coefficient41_204,
  OriginalRow227TriangleData0619.coefficient41_205,
  OriginalRow227TriangleData0619.coefficient41_206,
  OriginalRow227TriangleData0619.coefficient41_207,
  OriginalRow227TriangleData0619.coefficient41_208,
  OriginalRow227TriangleData0619.coefficient41_209,
  OriginalRow227TriangleData0619.coefficient41_210,
  OriginalRow227TriangleData0619.coefficient41_211,
  OriginalRow227TriangleData0619.coefficient41_212,
  OriginalRow227TriangleData0619.coefficient41_213,
  OriginalRow227TriangleData0619.coefficient41_214,
  OriginalRow227TriangleData0619.coefficient41_215,
  OriginalRow227TriangleData0619.coefficient41_216,
  OriginalRow227TriangleData0619.coefficient41_217,
  OriginalRow227TriangleData0619.coefficient41_218,
  OriginalRow227TriangleData0619.coefficient41_219,
  OriginalRow227TriangleData0619.coefficient41_220,
  OriginalRow227TriangleData0619.coefficient41_221,
  OriginalRow227TriangleData0619.coefficient41_222,
  OriginalRow227TriangleData0619.coefficient41_223,
  OriginalRow227TriangleData0619.coefficient41_224,
  OriginalRow227TriangleData0619.coefficient41_225,
  OriginalRow227TriangleData0619.coefficient41_226,
  OriginalRow227TriangleData0619.coefficient41_227,
  OriginalRow227TriangleData0619.coefficient41_228,
  OriginalRow227TriangleData0619.coefficient41_229,
  OriginalRow227TriangleData0619.coefficient41_230,
  OriginalRow227TriangleData0619.coefficient41_231
]

theorem values0619_size : values0619.size = 32 := rfl

def block0619 : ℕ → Option IntervalDyadic := segment 200 values0619

theorem block0619_domain : ExactDomain block0619 200 232 := by
  simpa only [values0619_size] using segment_domain 200 values0619

theorem block0619_get (i : Fin 32) :
    block0619 (200 + i.val) = some (values0619[i.val]'(by rw [values0619_size]; exact i.isLt)) := by
  exact segment_get 200 values0619 ⟨i.val, by rw [values0619_size]; exact i.isLt⟩

def values0620 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0620.coefficient41_232,
  OriginalRow227TriangleData0620.coefficient41_233,
  OriginalRow227TriangleData0620.coefficient41_234,
  OriginalRow227TriangleData0620.coefficient41_235,
  OriginalRow227TriangleData0620.coefficient41_236,
  OriginalRow227TriangleData0620.coefficient41_237,
  OriginalRow227TriangleData0620.coefficient41_238,
  OriginalRow227TriangleData0620.coefficient41_239,
  OriginalRow227TriangleData0620.coefficient41_240,
  OriginalRow227TriangleData0620.coefficient41_241,
  OriginalRow227TriangleData0620.coefficient41_242,
  OriginalRow227TriangleData0620.coefficient41_243,
  OriginalRow227TriangleData0620.coefficient41_244,
  OriginalRow227TriangleData0620.coefficient41_245,
  OriginalRow227TriangleData0620.coefficient41_246,
  OriginalRow227TriangleData0620.coefficient41_247,
  OriginalRow227TriangleData0620.coefficient41_248,
  OriginalRow227TriangleData0620.coefficient41_249,
  OriginalRow227TriangleData0620.coefficient41_250,
  OriginalRow227TriangleData0620.coefficient41_251,
  OriginalRow227TriangleData0620.coefficient41_252,
  OriginalRow227TriangleData0620.coefficient41_253,
  OriginalRow227TriangleData0620.coefficient41_254,
  OriginalRow227TriangleData0620.coefficient41_255,
  OriginalRow227TriangleData0620.coefficient41_256,
  OriginalRow227TriangleData0620.coefficient41_257,
  OriginalRow227TriangleData0620.coefficient41_258,
  OriginalRow227TriangleData0620.coefficient41_259,
  OriginalRow227TriangleData0620.coefficient41_260,
  OriginalRow227TriangleData0620.coefficient41_261,
  OriginalRow227TriangleData0620.coefficient41_262,
  OriginalRow227TriangleData0620.coefficient41_263
]

theorem values0620_size : values0620.size = 32 := rfl

def block0620 : ℕ → Option IntervalDyadic := segment 232 values0620

theorem block0620_domain : ExactDomain block0620 232 264 := by
  simpa only [values0620_size] using segment_domain 232 values0620

theorem block0620_get (i : Fin 32) :
    block0620 (232 + i.val) = some (values0620[i.val]'(by rw [values0620_size]; exact i.isLt)) := by
  exact segment_get 232 values0620 ⟨i.val, by rw [values0620_size]; exact i.isLt⟩

def values0621 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0621.coefficient41_264,
  OriginalRow227TriangleData0621.coefficient41_265,
  OriginalRow227TriangleData0621.coefficient41_266,
  OriginalRow227TriangleData0621.coefficient41_267,
  OriginalRow227TriangleData0621.coefficient41_268,
  OriginalRow227TriangleData0621.coefficient41_269,
  OriginalRow227TriangleData0621.coefficient41_270,
  OriginalRow227TriangleData0621.coefficient41_271,
  OriginalRow227TriangleData0621.coefficient41_272,
  OriginalRow227TriangleData0621.coefficient41_273,
  OriginalRow227TriangleData0621.coefficient41_274,
  OriginalRow227TriangleData0621.coefficient41_275,
  OriginalRow227TriangleData0621.coefficient41_276,
  OriginalRow227TriangleData0621.coefficient41_277,
  OriginalRow227TriangleData0621.coefficient41_278,
  OriginalRow227TriangleData0621.coefficient41_279,
  OriginalRow227TriangleData0621.coefficient41_280,
  OriginalRow227TriangleData0621.coefficient41_281,
  OriginalRow227TriangleData0621.coefficient41_282,
  OriginalRow227TriangleData0621.coefficient41_283,
  OriginalRow227TriangleData0621.coefficient41_284,
  OriginalRow227TriangleData0621.coefficient41_285,
  OriginalRow227TriangleData0621.coefficient41_286,
  OriginalRow227TriangleData0621.coefficient41_287,
  OriginalRow227TriangleData0621.coefficient41_288,
  OriginalRow227TriangleData0621.coefficient41_289,
  OriginalRow227TriangleData0621.coefficient41_290,
  OriginalRow227TriangleData0621.coefficient41_291,
  OriginalRow227TriangleData0621.coefficient41_292,
  OriginalRow227TriangleData0621.coefficient41_293,
  OriginalRow227TriangleData0621.coefficient41_294,
  OriginalRow227TriangleData0621.coefficient41_295
]

theorem values0621_size : values0621.size = 32 := rfl

def block0621 : ℕ → Option IntervalDyadic := segment 264 values0621

theorem block0621_domain : ExactDomain block0621 264 296 := by
  simpa only [values0621_size] using segment_domain 264 values0621

theorem block0621_get (i : Fin 32) :
    block0621 (264 + i.val) = some (values0621[i.val]'(by rw [values0621_size]; exact i.isLt)) := by
  exact segment_get 264 values0621 ⟨i.val, by rw [values0621_size]; exact i.isLt⟩

def values0622 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0622.coefficient41_296,
  OriginalRow227TriangleData0622.coefficient41_297,
  OriginalRow227TriangleData0622.coefficient41_298,
  OriginalRow227TriangleData0622.coefficient41_299,
  OriginalRow227TriangleData0622.coefficient41_300,
  OriginalRow227TriangleData0622.coefficient41_301,
  OriginalRow227TriangleData0622.coefficient41_302,
  OriginalRow227TriangleData0622.coefficient41_303,
  OriginalRow227TriangleData0622.coefficient41_304,
  OriginalRow227TriangleData0622.coefficient41_305,
  OriginalRow227TriangleData0622.coefficient41_306,
  OriginalRow227TriangleData0622.coefficient41_307,
  OriginalRow227TriangleData0622.coefficient41_308,
  OriginalRow227TriangleData0622.coefficient41_309,
  OriginalRow227TriangleData0622.coefficient41_310,
  OriginalRow227TriangleData0622.coefficient41_311,
  OriginalRow227TriangleData0622.coefficient41_312,
  OriginalRow227TriangleData0622.coefficient41_313,
  OriginalRow227TriangleData0622.coefficient41_314,
  OriginalRow227TriangleData0622.coefficient41_315,
  OriginalRow227TriangleData0622.coefficient41_316,
  OriginalRow227TriangleData0622.coefficient41_317,
  OriginalRow227TriangleData0622.coefficient41_318,
  OriginalRow227TriangleData0622.coefficient41_319,
  OriginalRow227TriangleData0622.coefficient41_320,
  OriginalRow227TriangleData0622.coefficient41_321,
  OriginalRow227TriangleData0622.coefficient41_322,
  OriginalRow227TriangleData0622.coefficient41_323,
  OriginalRow227TriangleData0622.coefficient41_324,
  OriginalRow227TriangleData0622.coefficient41_325,
  OriginalRow227TriangleData0622.coefficient41_326,
  OriginalRow227TriangleData0622.coefficient41_327
]

theorem values0622_size : values0622.size = 32 := rfl

def block0622 : ℕ → Option IntervalDyadic := segment 296 values0622

theorem block0622_domain : ExactDomain block0622 296 328 := by
  simpa only [values0622_size] using segment_domain 296 values0622

theorem block0622_get (i : Fin 32) :
    block0622 (296 + i.val) = some (values0622[i.val]'(by rw [values0622_size]; exact i.isLt)) := by
  exact segment_get 296 values0622 ⟨i.val, by rw [values0622_size]; exact i.isLt⟩

def values0623 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0623.coefficient41_328,
  OriginalRow227TriangleData0623.coefficient41_329,
  OriginalRow227TriangleData0623.coefficient41_330,
  OriginalRow227TriangleData0623.coefficient41_331,
  OriginalRow227TriangleData0623.coefficient41_332,
  OriginalRow227TriangleData0623.coefficient41_333,
  OriginalRow227TriangleData0623.coefficient41_334,
  OriginalRow227TriangleData0623.coefficient41_335,
  OriginalRow227TriangleData0623.coefficient41_336,
  OriginalRow227TriangleData0623.coefficient41_337,
  OriginalRow227TriangleData0623.coefficient41_338,
  OriginalRow227TriangleData0623.coefficient41_339,
  OriginalRow227TriangleData0623.coefficient41_340,
  OriginalRow227TriangleData0623.coefficient41_341,
  OriginalRow227TriangleData0623.coefficient41_342,
  OriginalRow227TriangleData0623.coefficient41_343,
  OriginalRow227TriangleData0623.coefficient41_344,
  OriginalRow227TriangleData0623.coefficient41_345,
  OriginalRow227TriangleData0623.coefficient41_346,
  OriginalRow227TriangleData0623.coefficient41_347,
  OriginalRow227TriangleData0623.coefficient41_348,
  OriginalRow227TriangleData0623.coefficient41_349,
  OriginalRow227TriangleData0623.coefficient41_350,
  OriginalRow227TriangleData0623.coefficient41_351,
  OriginalRow227TriangleData0623.coefficient41_352,
  OriginalRow227TriangleData0623.coefficient41_353,
  OriginalRow227TriangleData0623.coefficient41_354,
  OriginalRow227TriangleData0623.coefficient41_355,
  OriginalRow227TriangleData0623.coefficient41_356,
  OriginalRow227TriangleData0623.coefficient41_357,
  OriginalRow227TriangleData0623.coefficient41_358,
  OriginalRow227TriangleData0623.coefficient41_359
]

theorem values0623_size : values0623.size = 32 := rfl

def block0623 : ℕ → Option IntervalDyadic := segment 328 values0623

theorem block0623_domain : ExactDomain block0623 328 360 := by
  simpa only [values0623_size] using segment_domain 328 values0623

theorem block0623_get (i : Fin 32) :
    block0623 (328 + i.val) = some (values0623[i.val]'(by rw [values0623_size]; exact i.isLt)) := by
  exact segment_get 328 values0623 ⟨i.val, by rw [values0623_size]; exact i.isLt⟩

def values0624 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0624.coefficient41_360,
  OriginalRow227TriangleData0624.coefficient41_361,
  OriginalRow227TriangleData0624.coefficient41_362,
  OriginalRow227TriangleData0624.coefficient41_363,
  OriginalRow227TriangleData0624.coefficient41_364,
  OriginalRow227TriangleData0624.coefficient41_365,
  OriginalRow227TriangleData0624.coefficient41_366,
  OriginalRow227TriangleData0624.coefficient41_367,
  OriginalRow227TriangleData0624.coefficient41_368,
  OriginalRow227TriangleData0624.coefficient41_369,
  OriginalRow227TriangleData0624.coefficient41_370,
  OriginalRow227TriangleData0624.coefficient41_371,
  OriginalRow227TriangleData0624.coefficient41_372,
  OriginalRow227TriangleData0624.coefficient41_373,
  OriginalRow227TriangleData0624.coefficient41_374,
  OriginalRow227TriangleData0624.coefficient41_375,
  OriginalRow227TriangleData0624.coefficient41_376,
  OriginalRow227TriangleData0624.coefficient41_377,
  OriginalRow227TriangleData0624.coefficient41_378,
  OriginalRow227TriangleData0624.coefficient41_379,
  OriginalRow227TriangleData0624.coefficient41_380,
  OriginalRow227TriangleData0624.coefficient41_381,
  OriginalRow227TriangleData0624.coefficient41_382,
  OriginalRow227TriangleData0624.coefficient41_383,
  OriginalRow227TriangleData0624.coefficient41_384,
  OriginalRow227TriangleData0624.coefficient41_385,
  OriginalRow227TriangleData0624.coefficient41_386,
  OriginalRow227TriangleData0624.coefficient41_387,
  OriginalRow227TriangleData0624.coefficient41_388,
  OriginalRow227TriangleData0624.coefficient41_389,
  OriginalRow227TriangleData0624.coefficient41_390,
  OriginalRow227TriangleData0624.coefficient41_391
]

theorem values0624_size : values0624.size = 32 := rfl

def block0624 : ℕ → Option IntervalDyadic := segment 360 values0624

theorem block0624_domain : ExactDomain block0624 360 392 := by
  simpa only [values0624_size] using segment_domain 360 values0624

theorem block0624_get (i : Fin 32) :
    block0624 (360 + i.val) = some (values0624[i.val]'(by rw [values0624_size]; exact i.isLt)) := by
  exact segment_get 360 values0624 ⟨i.val, by rw [values0624_size]; exact i.isLt⟩

def values0625 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0625.coefficient41_392,
  OriginalRow227TriangleData0625.coefficient41_393,
  OriginalRow227TriangleData0625.coefficient41_394,
  OriginalRow227TriangleData0625.coefficient41_395,
  OriginalRow227TriangleData0625.coefficient41_396,
  OriginalRow227TriangleData0625.coefficient41_397,
  OriginalRow227TriangleData0625.coefficient41_398,
  OriginalRow227TriangleData0625.coefficient41_399,
  OriginalRow227TriangleData0625.coefficient41_400,
  OriginalRow227TriangleData0625.coefficient41_401,
  OriginalRow227TriangleData0625.coefficient41_402,
  OriginalRow227TriangleData0625.coefficient41_403,
  OriginalRow227TriangleData0625.coefficient41_404,
  OriginalRow227TriangleData0625.coefficient41_405,
  OriginalRow227TriangleData0625.coefficient41_406,
  OriginalRow227TriangleData0625.coefficient41_407,
  OriginalRow227TriangleData0625.coefficient41_408,
  OriginalRow227TriangleData0625.coefficient41_409,
  OriginalRow227TriangleData0625.coefficient41_410,
  OriginalRow227TriangleData0625.coefficient41_411,
  OriginalRow227TriangleData0625.coefficient41_412,
  OriginalRow227TriangleData0625.coefficient41_413,
  OriginalRow227TriangleData0625.coefficient41_414,
  OriginalRow227TriangleData0625.coefficient41_415,
  OriginalRow227TriangleData0625.coefficient41_416,
  OriginalRow227TriangleData0625.coefficient41_417,
  OriginalRow227TriangleData0625.coefficient41_418,
  OriginalRow227TriangleData0625.coefficient41_419,
  OriginalRow227TriangleData0625.coefficient41_420,
  OriginalRow227TriangleData0625.coefficient41_421,
  OriginalRow227TriangleData0625.coefficient41_422,
  OriginalRow227TriangleData0625.coefficient41_423
]

theorem values0625_size : values0625.size = 32 := rfl

def block0625 : ℕ → Option IntervalDyadic := segment 392 values0625

theorem block0625_domain : ExactDomain block0625 392 424 := by
  simpa only [values0625_size] using segment_domain 392 values0625

theorem block0625_get (i : Fin 32) :
    block0625 (392 + i.val) = some (values0625[i.val]'(by rw [values0625_size]; exact i.isLt)) := by
  exact segment_get 392 values0625 ⟨i.val, by rw [values0625_size]; exact i.isLt⟩

def values0626 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0626.coefficient41_424,
  OriginalRow227TriangleData0626.coefficient41_425,
  OriginalRow227TriangleData0626.coefficient41_426,
  OriginalRow227TriangleData0626.coefficient41_427,
  OriginalRow227TriangleData0626.coefficient41_428,
  OriginalRow227TriangleData0626.coefficient41_429,
  OriginalRow227TriangleData0626.coefficient41_430,
  OriginalRow227TriangleData0626.coefficient41_431,
  OriginalRow227TriangleData0626.coefficient41_432,
  OriginalRow227TriangleData0626.coefficient41_433,
  OriginalRow227TriangleData0626.coefficient41_434,
  OriginalRow227TriangleData0626.coefficient41_435,
  OriginalRow227TriangleData0626.coefficient41_436,
  OriginalRow227TriangleData0626.coefficient41_437,
  OriginalRow227TriangleData0626.coefficient41_438,
  OriginalRow227TriangleData0626.coefficient41_439,
  OriginalRow227TriangleData0626.coefficient41_440,
  OriginalRow227TriangleData0626.coefficient41_441,
  OriginalRow227TriangleData0626.coefficient41_442,
  OriginalRow227TriangleData0626.coefficient41_443,
  OriginalRow227TriangleData0626.coefficient41_444,
  OriginalRow227TriangleData0626.coefficient41_445,
  OriginalRow227TriangleData0626.coefficient41_446,
  OriginalRow227TriangleData0626.coefficient41_447,
  OriginalRow227TriangleData0626.coefficient41_448,
  OriginalRow227TriangleData0626.coefficient41_449,
  OriginalRow227TriangleData0626.coefficient41_450,
  OriginalRow227TriangleData0626.coefficient41_451,
  OriginalRow227TriangleData0626.coefficient41_452,
  OriginalRow227TriangleData0626.coefficient41_453,
  OriginalRow227TriangleData0626.coefficient41_454,
  OriginalRow227TriangleData0626.coefficient41_455
]

theorem values0626_size : values0626.size = 32 := rfl

def block0626 : ℕ → Option IntervalDyadic := segment 424 values0626

theorem block0626_domain : ExactDomain block0626 424 456 := by
  simpa only [values0626_size] using segment_domain 424 values0626

theorem block0626_get (i : Fin 32) :
    block0626 (424 + i.val) = some (values0626[i.val]'(by rw [values0626_size]; exact i.isLt)) := by
  exact segment_get 424 values0626 ⟨i.val, by rw [values0626_size]; exact i.isLt⟩

def values0627 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0627.coefficient41_456,
  OriginalRow227TriangleData0627.coefficient41_457,
  OriginalRow227TriangleData0627.coefficient41_458,
  OriginalRow227TriangleData0627.coefficient41_459,
  OriginalRow227TriangleData0627.coefficient41_460
]

theorem values0627_size : values0627.size = 5 := rfl

def block0627 : ℕ → Option IntervalDyadic := segment 456 values0627

theorem block0627_domain : ExactDomain block0627 456 461 := by
  simpa only [values0627_size] using segment_domain 456 values0627

theorem block0627_get (i : Fin 5) :
    block0627 (456 + i.val) = some (values0627[i.val]'(by rw [values0627_size]; exact i.isLt)) := by
  exact segment_get 456 values0627 ⟨i.val, by rw [values0627_size]; exact i.isLt⟩

def node0072_0136 : ℕ → Option IntervalDyadic := split 104 block0615 block0616

theorem node0072_0136_domain : ExactDomain node0072_0136 72 136 := by
  exact split_domain (by decide) (by decide) block0615_domain block0616_domain

def node0040_0136 : ℕ → Option IntervalDyadic := split 72 block0614 node0072_0136

theorem node0040_0136_domain : ExactDomain node0040_0136 40 136 := by
  exact split_domain (by decide) (by decide) block0614_domain node0072_0136_domain

def node0136_0200 : ℕ → Option IntervalDyadic := split 168 block0617 block0618

theorem node0136_0200_domain : ExactDomain node0136_0200 136 200 := by
  exact split_domain (by decide) (by decide) block0617_domain block0618_domain

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block0619 block0620

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block0619_domain block0620_domain

def node0136_0264 : ℕ → Option IntervalDyadic := split 200 node0136_0200 node0200_0264

theorem node0136_0264_domain : ExactDomain node0136_0264 136 264 := by
  exact split_domain (by decide) (by decide) node0136_0200_domain node0200_0264_domain

def node0040_0264 : ℕ → Option IntervalDyadic := split 136 node0040_0136 node0136_0264

theorem node0040_0264_domain : ExactDomain node0040_0264 40 264 := by
  exact split_domain (by decide) (by decide) node0040_0136_domain node0136_0264_domain

def node0296_0360 : ℕ → Option IntervalDyadic := split 328 block0622 block0623

theorem node0296_0360_domain : ExactDomain node0296_0360 296 360 := by
  exact split_domain (by decide) (by decide) block0622_domain block0623_domain

def node0264_0360 : ℕ → Option IntervalDyadic := split 296 block0621 node0296_0360

theorem node0264_0360_domain : ExactDomain node0264_0360 264 360 := by
  exact split_domain (by decide) (by decide) block0621_domain node0296_0360_domain

def node0360_0424 : ℕ → Option IntervalDyadic := split 392 block0624 block0625

theorem node0360_0424_domain : ExactDomain node0360_0424 360 424 := by
  exact split_domain (by decide) (by decide) block0624_domain block0625_domain

def node0424_0461 : ℕ → Option IntervalDyadic := split 456 block0626 block0627

theorem node0424_0461_domain : ExactDomain node0424_0461 424 461 := by
  exact split_domain (by decide) (by decide) block0626_domain block0627_domain

def node0360_0461 : ℕ → Option IntervalDyadic := split 424 node0360_0424 node0424_0461

theorem node0360_0461_domain : ExactDomain node0360_0461 360 461 := by
  exact split_domain (by decide) (by decide) node0360_0424_domain node0424_0461_domain

def node0264_0461 : ℕ → Option IntervalDyadic := split 360 node0264_0360 node0360_0461

theorem node0264_0461_domain : ExactDomain node0264_0461 264 461 := by
  exact split_domain (by decide) (by decide) node0264_0360_domain node0360_0461_domain

def node0040_0461 : ℕ → Option IntervalDyadic := split 264 node0040_0264 node0264_0461

theorem node0040_0461_domain : ExactDomain node0040_0461 40 461 := by
  exact split_domain (by decide) (by decide) node0040_0264_domain node0264_0461_domain

def lookup : ℕ → Option IntervalDyadic := node0040_0461

theorem lookup_domain : ExactDomain lookup 40 461 :=
  node0040_0461_domain

theorem block0614_lookup (i : Fin 32) :
    lookup (40 + i.val) = some (values0614[i.val]'(by rw [values0614_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (40 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_left 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0040_0136, split_left 72 block0614 node0072_0136 (by omega)]
  exact block0614_get i

theorem block0615_lookup (i : Fin 32) :
    lookup (72 + i.val) = some (values0615[i.val]'(by rw [values0615_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (72 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_left 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0040_0136, split_right 72 block0614 node0072_0136 (by omega)]
  rw [node0072_0136, split_left 104 block0615 block0616 (by omega)]
  exact block0615_get i

theorem block0616_lookup (i : Fin 32) :
    lookup (104 + i.val) = some (values0616[i.val]'(by rw [values0616_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (104 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_left 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0040_0136, split_right 72 block0614 node0072_0136 (by omega)]
  rw [node0072_0136, split_right 104 block0615 block0616 (by omega)]
  exact block0616_get i

theorem block0617_lookup (i : Fin 32) :
    lookup (136 + i.val) = some (values0617[i.val]'(by rw [values0617_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (136 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_right 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_left 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0136_0200, split_left 168 block0617 block0618 (by omega)]
  exact block0617_get i

theorem block0618_lookup (i : Fin 32) :
    lookup (168 + i.val) = some (values0618[i.val]'(by rw [values0618_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (168 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_right 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_left 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0136_0200, split_right 168 block0617 block0618 (by omega)]
  exact block0618_get i

theorem block0619_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values0619[i.val]'(by rw [values0619_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (200 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_right 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_right 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0200_0264, split_left 232 block0619 block0620 (by omega)]
  exact block0619_get i

theorem block0620_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values0620[i.val]'(by rw [values0620_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (232 + i.val) = _
  rw [node0040_0461, split_left 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0040_0264, split_right 136 node0040_0136 node0136_0264 (by omega)]
  rw [node0136_0264, split_right 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0200_0264, split_right 232 block0619 block0620 (by omega)]
  exact block0620_get i

theorem block0621_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values0621[i.val]'(by rw [values0621_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (264 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_left 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0264_0360, split_left 296 block0621 node0296_0360 (by omega)]
  exact block0621_get i

theorem block0622_lookup (i : Fin 32) :
    lookup (296 + i.val) = some (values0622[i.val]'(by rw [values0622_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (296 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_left 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0264_0360, split_right 296 block0621 node0296_0360 (by omega)]
  rw [node0296_0360, split_left 328 block0622 block0623 (by omega)]
  exact block0622_get i

theorem block0623_lookup (i : Fin 32) :
    lookup (328 + i.val) = some (values0623[i.val]'(by rw [values0623_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (328 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_left 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0264_0360, split_right 296 block0621 node0296_0360 (by omega)]
  rw [node0296_0360, split_right 328 block0622 block0623 (by omega)]
  exact block0623_get i

theorem block0624_lookup (i : Fin 32) :
    lookup (360 + i.val) = some (values0624[i.val]'(by rw [values0624_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (360 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_right 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0360_0461, split_left 424 node0360_0424 node0424_0461 (by omega)]
  rw [node0360_0424, split_left 392 block0624 block0625 (by omega)]
  exact block0624_get i

theorem block0625_lookup (i : Fin 32) :
    lookup (392 + i.val) = some (values0625[i.val]'(by rw [values0625_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (392 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_right 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0360_0461, split_left 424 node0360_0424 node0424_0461 (by omega)]
  rw [node0360_0424, split_right 392 block0624 block0625 (by omega)]
  exact block0625_get i

theorem block0626_lookup (i : Fin 32) :
    lookup (424 + i.val) = some (values0626[i.val]'(by rw [values0626_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (424 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_right 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0360_0461, split_right 424 node0360_0424 node0424_0461 (by omega)]
  rw [node0424_0461, split_left 456 block0626 block0627 (by omega)]
  exact block0626_get i

theorem block0627_lookup (i : Fin 5) :
    lookup (456 + i.val) = some (values0627[i.val]'(by rw [values0627_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0040_0461 (456 + i.val) = _
  rw [node0040_0461, split_right 264 node0040_0264 node0264_0461 (by omega)]
  rw [node0264_0461, split_right 360 node0264_0360 node0360_0461 (by omega)]
  rw [node0360_0461, split_right 424 node0360_0424 node0424_0461 (by omega)]
  rw [node0424_0461, split_right 456 block0626 block0627 (by omega)]
  exact block0627_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0614_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0614_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0615_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0615_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0616_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0616_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0617_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0617_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0618_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0618_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0619_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0619_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0620_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0620_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0621_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0621_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0622_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0622_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0623_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0623_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0624_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0624_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0625_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0625_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0626_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0626_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0627_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0627_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0614_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0615_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0616_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0617_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0618_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0619_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0620_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0621_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0622_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0623_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0624_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0625_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0626_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow041.block0627_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow041
