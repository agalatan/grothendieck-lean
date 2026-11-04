import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0721
import Grothe.UpperChaos.OriginalRow227TriangleData0722
import Grothe.UpperChaos.OriginalRow227TriangleData0723
import Grothe.UpperChaos.OriginalRow227TriangleData0724
import Grothe.UpperChaos.OriginalRow227TriangleData0725
import Grothe.UpperChaos.OriginalRow227TriangleData0726
import Grothe.UpperChaos.OriginalRow227TriangleData0727
import Grothe.UpperChaos.OriginalRow227TriangleData0728
import Grothe.UpperChaos.OriginalRow227TriangleData0729
import Grothe.UpperChaos.OriginalRow227TriangleData0730
import Grothe.UpperChaos.OriginalRow227TriangleData0731
import Grothe.UpperChaos.OriginalRow227TriangleData0732
import Grothe.UpperChaos.OriginalRow227TriangleData0733

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow049

open ConditionalTableLookup

def values0721 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0721.coefficient49_48,
  OriginalRow227TriangleData0721.coefficient49_49,
  OriginalRow227TriangleData0721.coefficient49_50,
  OriginalRow227TriangleData0721.coefficient49_51,
  OriginalRow227TriangleData0721.coefficient49_52,
  OriginalRow227TriangleData0721.coefficient49_53,
  OriginalRow227TriangleData0721.coefficient49_54,
  OriginalRow227TriangleData0721.coefficient49_55,
  OriginalRow227TriangleData0721.coefficient49_56,
  OriginalRow227TriangleData0721.coefficient49_57,
  OriginalRow227TriangleData0721.coefficient49_58,
  OriginalRow227TriangleData0721.coefficient49_59,
  OriginalRow227TriangleData0721.coefficient49_60,
  OriginalRow227TriangleData0721.coefficient49_61,
  OriginalRow227TriangleData0721.coefficient49_62,
  OriginalRow227TriangleData0721.coefficient49_63,
  OriginalRow227TriangleData0721.coefficient49_64,
  OriginalRow227TriangleData0721.coefficient49_65,
  OriginalRow227TriangleData0721.coefficient49_66,
  OriginalRow227TriangleData0721.coefficient49_67,
  OriginalRow227TriangleData0721.coefficient49_68,
  OriginalRow227TriangleData0721.coefficient49_69,
  OriginalRow227TriangleData0721.coefficient49_70,
  OriginalRow227TriangleData0721.coefficient49_71,
  OriginalRow227TriangleData0721.coefficient49_72,
  OriginalRow227TriangleData0721.coefficient49_73,
  OriginalRow227TriangleData0721.coefficient49_74,
  OriginalRow227TriangleData0721.coefficient49_75,
  OriginalRow227TriangleData0721.coefficient49_76,
  OriginalRow227TriangleData0721.coefficient49_77,
  OriginalRow227TriangleData0721.coefficient49_78,
  OriginalRow227TriangleData0721.coefficient49_79
]

theorem values0721_size : values0721.size = 32 := rfl

def block0721 : ℕ → Option IntervalDyadic := segment 48 values0721

theorem block0721_domain : ExactDomain block0721 48 80 := by
  simpa only [values0721_size] using segment_domain 48 values0721

theorem block0721_get (i : Fin 32) :
    block0721 (48 + i.val) = some (values0721[i.val]'(by rw [values0721_size]; exact i.isLt)) := by
  exact segment_get 48 values0721 ⟨i.val, by rw [values0721_size]; exact i.isLt⟩

def values0722 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0722.coefficient49_80,
  OriginalRow227TriangleData0722.coefficient49_81,
  OriginalRow227TriangleData0722.coefficient49_82,
  OriginalRow227TriangleData0722.coefficient49_83,
  OriginalRow227TriangleData0722.coefficient49_84,
  OriginalRow227TriangleData0722.coefficient49_85,
  OriginalRow227TriangleData0722.coefficient49_86,
  OriginalRow227TriangleData0722.coefficient49_87,
  OriginalRow227TriangleData0722.coefficient49_88,
  OriginalRow227TriangleData0722.coefficient49_89,
  OriginalRow227TriangleData0722.coefficient49_90,
  OriginalRow227TriangleData0722.coefficient49_91,
  OriginalRow227TriangleData0722.coefficient49_92,
  OriginalRow227TriangleData0722.coefficient49_93,
  OriginalRow227TriangleData0722.coefficient49_94,
  OriginalRow227TriangleData0722.coefficient49_95,
  OriginalRow227TriangleData0722.coefficient49_96,
  OriginalRow227TriangleData0722.coefficient49_97,
  OriginalRow227TriangleData0722.coefficient49_98,
  OriginalRow227TriangleData0722.coefficient49_99,
  OriginalRow227TriangleData0722.coefficient49_100,
  OriginalRow227TriangleData0722.coefficient49_101,
  OriginalRow227TriangleData0722.coefficient49_102,
  OriginalRow227TriangleData0722.coefficient49_103,
  OriginalRow227TriangleData0722.coefficient49_104,
  OriginalRow227TriangleData0722.coefficient49_105,
  OriginalRow227TriangleData0722.coefficient49_106,
  OriginalRow227TriangleData0722.coefficient49_107,
  OriginalRow227TriangleData0722.coefficient49_108,
  OriginalRow227TriangleData0722.coefficient49_109,
  OriginalRow227TriangleData0722.coefficient49_110,
  OriginalRow227TriangleData0722.coefficient49_111
]

theorem values0722_size : values0722.size = 32 := rfl

def block0722 : ℕ → Option IntervalDyadic := segment 80 values0722

theorem block0722_domain : ExactDomain block0722 80 112 := by
  simpa only [values0722_size] using segment_domain 80 values0722

theorem block0722_get (i : Fin 32) :
    block0722 (80 + i.val) = some (values0722[i.val]'(by rw [values0722_size]; exact i.isLt)) := by
  exact segment_get 80 values0722 ⟨i.val, by rw [values0722_size]; exact i.isLt⟩

def values0723 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0723.coefficient49_112,
  OriginalRow227TriangleData0723.coefficient49_113,
  OriginalRow227TriangleData0723.coefficient49_114,
  OriginalRow227TriangleData0723.coefficient49_115,
  OriginalRow227TriangleData0723.coefficient49_116,
  OriginalRow227TriangleData0723.coefficient49_117,
  OriginalRow227TriangleData0723.coefficient49_118,
  OriginalRow227TriangleData0723.coefficient49_119,
  OriginalRow227TriangleData0723.coefficient49_120,
  OriginalRow227TriangleData0723.coefficient49_121,
  OriginalRow227TriangleData0723.coefficient49_122,
  OriginalRow227TriangleData0723.coefficient49_123,
  OriginalRow227TriangleData0723.coefficient49_124,
  OriginalRow227TriangleData0723.coefficient49_125,
  OriginalRow227TriangleData0723.coefficient49_126,
  OriginalRow227TriangleData0723.coefficient49_127,
  OriginalRow227TriangleData0723.coefficient49_128,
  OriginalRow227TriangleData0723.coefficient49_129,
  OriginalRow227TriangleData0723.coefficient49_130,
  OriginalRow227TriangleData0723.coefficient49_131,
  OriginalRow227TriangleData0723.coefficient49_132,
  OriginalRow227TriangleData0723.coefficient49_133,
  OriginalRow227TriangleData0723.coefficient49_134,
  OriginalRow227TriangleData0723.coefficient49_135,
  OriginalRow227TriangleData0723.coefficient49_136,
  OriginalRow227TriangleData0723.coefficient49_137,
  OriginalRow227TriangleData0723.coefficient49_138,
  OriginalRow227TriangleData0723.coefficient49_139,
  OriginalRow227TriangleData0723.coefficient49_140,
  OriginalRow227TriangleData0723.coefficient49_141,
  OriginalRow227TriangleData0723.coefficient49_142,
  OriginalRow227TriangleData0723.coefficient49_143
]

theorem values0723_size : values0723.size = 32 := rfl

def block0723 : ℕ → Option IntervalDyadic := segment 112 values0723

theorem block0723_domain : ExactDomain block0723 112 144 := by
  simpa only [values0723_size] using segment_domain 112 values0723

theorem block0723_get (i : Fin 32) :
    block0723 (112 + i.val) = some (values0723[i.val]'(by rw [values0723_size]; exact i.isLt)) := by
  exact segment_get 112 values0723 ⟨i.val, by rw [values0723_size]; exact i.isLt⟩

def values0724 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0724.coefficient49_144,
  OriginalRow227TriangleData0724.coefficient49_145,
  OriginalRow227TriangleData0724.coefficient49_146,
  OriginalRow227TriangleData0724.coefficient49_147,
  OriginalRow227TriangleData0724.coefficient49_148,
  OriginalRow227TriangleData0724.coefficient49_149,
  OriginalRow227TriangleData0724.coefficient49_150,
  OriginalRow227TriangleData0724.coefficient49_151,
  OriginalRow227TriangleData0724.coefficient49_152,
  OriginalRow227TriangleData0724.coefficient49_153,
  OriginalRow227TriangleData0724.coefficient49_154,
  OriginalRow227TriangleData0724.coefficient49_155,
  OriginalRow227TriangleData0724.coefficient49_156,
  OriginalRow227TriangleData0724.coefficient49_157,
  OriginalRow227TriangleData0724.coefficient49_158,
  OriginalRow227TriangleData0724.coefficient49_159,
  OriginalRow227TriangleData0724.coefficient49_160,
  OriginalRow227TriangleData0724.coefficient49_161,
  OriginalRow227TriangleData0724.coefficient49_162,
  OriginalRow227TriangleData0724.coefficient49_163,
  OriginalRow227TriangleData0724.coefficient49_164,
  OriginalRow227TriangleData0724.coefficient49_165,
  OriginalRow227TriangleData0724.coefficient49_166,
  OriginalRow227TriangleData0724.coefficient49_167,
  OriginalRow227TriangleData0724.coefficient49_168,
  OriginalRow227TriangleData0724.coefficient49_169,
  OriginalRow227TriangleData0724.coefficient49_170,
  OriginalRow227TriangleData0724.coefficient49_171,
  OriginalRow227TriangleData0724.coefficient49_172,
  OriginalRow227TriangleData0724.coefficient49_173,
  OriginalRow227TriangleData0724.coefficient49_174,
  OriginalRow227TriangleData0724.coefficient49_175
]

theorem values0724_size : values0724.size = 32 := rfl

def block0724 : ℕ → Option IntervalDyadic := segment 144 values0724

theorem block0724_domain : ExactDomain block0724 144 176 := by
  simpa only [values0724_size] using segment_domain 144 values0724

theorem block0724_get (i : Fin 32) :
    block0724 (144 + i.val) = some (values0724[i.val]'(by rw [values0724_size]; exact i.isLt)) := by
  exact segment_get 144 values0724 ⟨i.val, by rw [values0724_size]; exact i.isLt⟩

def values0725 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0725.coefficient49_176,
  OriginalRow227TriangleData0725.coefficient49_177,
  OriginalRow227TriangleData0725.coefficient49_178,
  OriginalRow227TriangleData0725.coefficient49_179,
  OriginalRow227TriangleData0725.coefficient49_180,
  OriginalRow227TriangleData0725.coefficient49_181,
  OriginalRow227TriangleData0725.coefficient49_182,
  OriginalRow227TriangleData0725.coefficient49_183,
  OriginalRow227TriangleData0725.coefficient49_184,
  OriginalRow227TriangleData0725.coefficient49_185,
  OriginalRow227TriangleData0725.coefficient49_186,
  OriginalRow227TriangleData0725.coefficient49_187,
  OriginalRow227TriangleData0725.coefficient49_188,
  OriginalRow227TriangleData0725.coefficient49_189,
  OriginalRow227TriangleData0725.coefficient49_190,
  OriginalRow227TriangleData0725.coefficient49_191,
  OriginalRow227TriangleData0725.coefficient49_192,
  OriginalRow227TriangleData0725.coefficient49_193,
  OriginalRow227TriangleData0725.coefficient49_194,
  OriginalRow227TriangleData0725.coefficient49_195,
  OriginalRow227TriangleData0725.coefficient49_196,
  OriginalRow227TriangleData0725.coefficient49_197,
  OriginalRow227TriangleData0725.coefficient49_198,
  OriginalRow227TriangleData0725.coefficient49_199,
  OriginalRow227TriangleData0725.coefficient49_200,
  OriginalRow227TriangleData0725.coefficient49_201,
  OriginalRow227TriangleData0725.coefficient49_202,
  OriginalRow227TriangleData0725.coefficient49_203,
  OriginalRow227TriangleData0725.coefficient49_204,
  OriginalRow227TriangleData0725.coefficient49_205,
  OriginalRow227TriangleData0725.coefficient49_206,
  OriginalRow227TriangleData0725.coefficient49_207
]

theorem values0725_size : values0725.size = 32 := rfl

def block0725 : ℕ → Option IntervalDyadic := segment 176 values0725

theorem block0725_domain : ExactDomain block0725 176 208 := by
  simpa only [values0725_size] using segment_domain 176 values0725

theorem block0725_get (i : Fin 32) :
    block0725 (176 + i.val) = some (values0725[i.val]'(by rw [values0725_size]; exact i.isLt)) := by
  exact segment_get 176 values0725 ⟨i.val, by rw [values0725_size]; exact i.isLt⟩

def values0726 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0726.coefficient49_208,
  OriginalRow227TriangleData0726.coefficient49_209,
  OriginalRow227TriangleData0726.coefficient49_210,
  OriginalRow227TriangleData0726.coefficient49_211,
  OriginalRow227TriangleData0726.coefficient49_212,
  OriginalRow227TriangleData0726.coefficient49_213,
  OriginalRow227TriangleData0726.coefficient49_214,
  OriginalRow227TriangleData0726.coefficient49_215,
  OriginalRow227TriangleData0726.coefficient49_216,
  OriginalRow227TriangleData0726.coefficient49_217,
  OriginalRow227TriangleData0726.coefficient49_218,
  OriginalRow227TriangleData0726.coefficient49_219,
  OriginalRow227TriangleData0726.coefficient49_220,
  OriginalRow227TriangleData0726.coefficient49_221,
  OriginalRow227TriangleData0726.coefficient49_222,
  OriginalRow227TriangleData0726.coefficient49_223,
  OriginalRow227TriangleData0726.coefficient49_224,
  OriginalRow227TriangleData0726.coefficient49_225,
  OriginalRow227TriangleData0726.coefficient49_226,
  OriginalRow227TriangleData0726.coefficient49_227,
  OriginalRow227TriangleData0726.coefficient49_228,
  OriginalRow227TriangleData0726.coefficient49_229,
  OriginalRow227TriangleData0726.coefficient49_230,
  OriginalRow227TriangleData0726.coefficient49_231,
  OriginalRow227TriangleData0726.coefficient49_232,
  OriginalRow227TriangleData0726.coefficient49_233,
  OriginalRow227TriangleData0726.coefficient49_234,
  OriginalRow227TriangleData0726.coefficient49_235,
  OriginalRow227TriangleData0726.coefficient49_236,
  OriginalRow227TriangleData0726.coefficient49_237,
  OriginalRow227TriangleData0726.coefficient49_238,
  OriginalRow227TriangleData0726.coefficient49_239
]

theorem values0726_size : values0726.size = 32 := rfl

def block0726 : ℕ → Option IntervalDyadic := segment 208 values0726

theorem block0726_domain : ExactDomain block0726 208 240 := by
  simpa only [values0726_size] using segment_domain 208 values0726

theorem block0726_get (i : Fin 32) :
    block0726 (208 + i.val) = some (values0726[i.val]'(by rw [values0726_size]; exact i.isLt)) := by
  exact segment_get 208 values0726 ⟨i.val, by rw [values0726_size]; exact i.isLt⟩

def values0727 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0727.coefficient49_240,
  OriginalRow227TriangleData0727.coefficient49_241,
  OriginalRow227TriangleData0727.coefficient49_242,
  OriginalRow227TriangleData0727.coefficient49_243,
  OriginalRow227TriangleData0727.coefficient49_244,
  OriginalRow227TriangleData0727.coefficient49_245,
  OriginalRow227TriangleData0727.coefficient49_246,
  OriginalRow227TriangleData0727.coefficient49_247,
  OriginalRow227TriangleData0727.coefficient49_248,
  OriginalRow227TriangleData0727.coefficient49_249,
  OriginalRow227TriangleData0727.coefficient49_250,
  OriginalRow227TriangleData0727.coefficient49_251,
  OriginalRow227TriangleData0727.coefficient49_252,
  OriginalRow227TriangleData0727.coefficient49_253,
  OriginalRow227TriangleData0727.coefficient49_254,
  OriginalRow227TriangleData0727.coefficient49_255,
  OriginalRow227TriangleData0727.coefficient49_256,
  OriginalRow227TriangleData0727.coefficient49_257,
  OriginalRow227TriangleData0727.coefficient49_258,
  OriginalRow227TriangleData0727.coefficient49_259,
  OriginalRow227TriangleData0727.coefficient49_260,
  OriginalRow227TriangleData0727.coefficient49_261,
  OriginalRow227TriangleData0727.coefficient49_262,
  OriginalRow227TriangleData0727.coefficient49_263,
  OriginalRow227TriangleData0727.coefficient49_264,
  OriginalRow227TriangleData0727.coefficient49_265,
  OriginalRow227TriangleData0727.coefficient49_266,
  OriginalRow227TriangleData0727.coefficient49_267,
  OriginalRow227TriangleData0727.coefficient49_268,
  OriginalRow227TriangleData0727.coefficient49_269,
  OriginalRow227TriangleData0727.coefficient49_270,
  OriginalRow227TriangleData0727.coefficient49_271
]

theorem values0727_size : values0727.size = 32 := rfl

def block0727 : ℕ → Option IntervalDyadic := segment 240 values0727

theorem block0727_domain : ExactDomain block0727 240 272 := by
  simpa only [values0727_size] using segment_domain 240 values0727

theorem block0727_get (i : Fin 32) :
    block0727 (240 + i.val) = some (values0727[i.val]'(by rw [values0727_size]; exact i.isLt)) := by
  exact segment_get 240 values0727 ⟨i.val, by rw [values0727_size]; exact i.isLt⟩

def values0728 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0728.coefficient49_272,
  OriginalRow227TriangleData0728.coefficient49_273,
  OriginalRow227TriangleData0728.coefficient49_274,
  OriginalRow227TriangleData0728.coefficient49_275,
  OriginalRow227TriangleData0728.coefficient49_276,
  OriginalRow227TriangleData0728.coefficient49_277,
  OriginalRow227TriangleData0728.coefficient49_278,
  OriginalRow227TriangleData0728.coefficient49_279,
  OriginalRow227TriangleData0728.coefficient49_280,
  OriginalRow227TriangleData0728.coefficient49_281,
  OriginalRow227TriangleData0728.coefficient49_282,
  OriginalRow227TriangleData0728.coefficient49_283,
  OriginalRow227TriangleData0728.coefficient49_284,
  OriginalRow227TriangleData0728.coefficient49_285,
  OriginalRow227TriangleData0728.coefficient49_286,
  OriginalRow227TriangleData0728.coefficient49_287,
  OriginalRow227TriangleData0728.coefficient49_288,
  OriginalRow227TriangleData0728.coefficient49_289,
  OriginalRow227TriangleData0728.coefficient49_290,
  OriginalRow227TriangleData0728.coefficient49_291,
  OriginalRow227TriangleData0728.coefficient49_292,
  OriginalRow227TriangleData0728.coefficient49_293,
  OriginalRow227TriangleData0728.coefficient49_294,
  OriginalRow227TriangleData0728.coefficient49_295,
  OriginalRow227TriangleData0728.coefficient49_296,
  OriginalRow227TriangleData0728.coefficient49_297,
  OriginalRow227TriangleData0728.coefficient49_298,
  OriginalRow227TriangleData0728.coefficient49_299,
  OriginalRow227TriangleData0728.coefficient49_300,
  OriginalRow227TriangleData0728.coefficient49_301,
  OriginalRow227TriangleData0728.coefficient49_302,
  OriginalRow227TriangleData0728.coefficient49_303
]

theorem values0728_size : values0728.size = 32 := rfl

def block0728 : ℕ → Option IntervalDyadic := segment 272 values0728

theorem block0728_domain : ExactDomain block0728 272 304 := by
  simpa only [values0728_size] using segment_domain 272 values0728

theorem block0728_get (i : Fin 32) :
    block0728 (272 + i.val) = some (values0728[i.val]'(by rw [values0728_size]; exact i.isLt)) := by
  exact segment_get 272 values0728 ⟨i.val, by rw [values0728_size]; exact i.isLt⟩

def values0729 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0729.coefficient49_304,
  OriginalRow227TriangleData0729.coefficient49_305,
  OriginalRow227TriangleData0729.coefficient49_306,
  OriginalRow227TriangleData0729.coefficient49_307,
  OriginalRow227TriangleData0729.coefficient49_308,
  OriginalRow227TriangleData0729.coefficient49_309,
  OriginalRow227TriangleData0729.coefficient49_310,
  OriginalRow227TriangleData0729.coefficient49_311,
  OriginalRow227TriangleData0729.coefficient49_312,
  OriginalRow227TriangleData0729.coefficient49_313,
  OriginalRow227TriangleData0729.coefficient49_314,
  OriginalRow227TriangleData0729.coefficient49_315,
  OriginalRow227TriangleData0729.coefficient49_316,
  OriginalRow227TriangleData0729.coefficient49_317,
  OriginalRow227TriangleData0729.coefficient49_318,
  OriginalRow227TriangleData0729.coefficient49_319,
  OriginalRow227TriangleData0729.coefficient49_320,
  OriginalRow227TriangleData0729.coefficient49_321,
  OriginalRow227TriangleData0729.coefficient49_322,
  OriginalRow227TriangleData0729.coefficient49_323,
  OriginalRow227TriangleData0729.coefficient49_324,
  OriginalRow227TriangleData0729.coefficient49_325,
  OriginalRow227TriangleData0729.coefficient49_326,
  OriginalRow227TriangleData0729.coefficient49_327,
  OriginalRow227TriangleData0729.coefficient49_328,
  OriginalRow227TriangleData0729.coefficient49_329,
  OriginalRow227TriangleData0729.coefficient49_330,
  OriginalRow227TriangleData0729.coefficient49_331,
  OriginalRow227TriangleData0729.coefficient49_332,
  OriginalRow227TriangleData0729.coefficient49_333,
  OriginalRow227TriangleData0729.coefficient49_334,
  OriginalRow227TriangleData0729.coefficient49_335
]

theorem values0729_size : values0729.size = 32 := rfl

def block0729 : ℕ → Option IntervalDyadic := segment 304 values0729

theorem block0729_domain : ExactDomain block0729 304 336 := by
  simpa only [values0729_size] using segment_domain 304 values0729

theorem block0729_get (i : Fin 32) :
    block0729 (304 + i.val) = some (values0729[i.val]'(by rw [values0729_size]; exact i.isLt)) := by
  exact segment_get 304 values0729 ⟨i.val, by rw [values0729_size]; exact i.isLt⟩

def values0730 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0730.coefficient49_336,
  OriginalRow227TriangleData0730.coefficient49_337,
  OriginalRow227TriangleData0730.coefficient49_338,
  OriginalRow227TriangleData0730.coefficient49_339,
  OriginalRow227TriangleData0730.coefficient49_340,
  OriginalRow227TriangleData0730.coefficient49_341,
  OriginalRow227TriangleData0730.coefficient49_342,
  OriginalRow227TriangleData0730.coefficient49_343,
  OriginalRow227TriangleData0730.coefficient49_344,
  OriginalRow227TriangleData0730.coefficient49_345,
  OriginalRow227TriangleData0730.coefficient49_346,
  OriginalRow227TriangleData0730.coefficient49_347,
  OriginalRow227TriangleData0730.coefficient49_348,
  OriginalRow227TriangleData0730.coefficient49_349,
  OriginalRow227TriangleData0730.coefficient49_350,
  OriginalRow227TriangleData0730.coefficient49_351,
  OriginalRow227TriangleData0730.coefficient49_352,
  OriginalRow227TriangleData0730.coefficient49_353,
  OriginalRow227TriangleData0730.coefficient49_354,
  OriginalRow227TriangleData0730.coefficient49_355,
  OriginalRow227TriangleData0730.coefficient49_356,
  OriginalRow227TriangleData0730.coefficient49_357,
  OriginalRow227TriangleData0730.coefficient49_358,
  OriginalRow227TriangleData0730.coefficient49_359,
  OriginalRow227TriangleData0730.coefficient49_360,
  OriginalRow227TriangleData0730.coefficient49_361,
  OriginalRow227TriangleData0730.coefficient49_362,
  OriginalRow227TriangleData0730.coefficient49_363,
  OriginalRow227TriangleData0730.coefficient49_364,
  OriginalRow227TriangleData0730.coefficient49_365,
  OriginalRow227TriangleData0730.coefficient49_366,
  OriginalRow227TriangleData0730.coefficient49_367
]

theorem values0730_size : values0730.size = 32 := rfl

def block0730 : ℕ → Option IntervalDyadic := segment 336 values0730

theorem block0730_domain : ExactDomain block0730 336 368 := by
  simpa only [values0730_size] using segment_domain 336 values0730

theorem block0730_get (i : Fin 32) :
    block0730 (336 + i.val) = some (values0730[i.val]'(by rw [values0730_size]; exact i.isLt)) := by
  exact segment_get 336 values0730 ⟨i.val, by rw [values0730_size]; exact i.isLt⟩

def values0731 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0731.coefficient49_368,
  OriginalRow227TriangleData0731.coefficient49_369,
  OriginalRow227TriangleData0731.coefficient49_370,
  OriginalRow227TriangleData0731.coefficient49_371,
  OriginalRow227TriangleData0731.coefficient49_372,
  OriginalRow227TriangleData0731.coefficient49_373,
  OriginalRow227TriangleData0731.coefficient49_374,
  OriginalRow227TriangleData0731.coefficient49_375,
  OriginalRow227TriangleData0731.coefficient49_376,
  OriginalRow227TriangleData0731.coefficient49_377,
  OriginalRow227TriangleData0731.coefficient49_378,
  OriginalRow227TriangleData0731.coefficient49_379,
  OriginalRow227TriangleData0731.coefficient49_380,
  OriginalRow227TriangleData0731.coefficient49_381,
  OriginalRow227TriangleData0731.coefficient49_382,
  OriginalRow227TriangleData0731.coefficient49_383,
  OriginalRow227TriangleData0731.coefficient49_384,
  OriginalRow227TriangleData0731.coefficient49_385,
  OriginalRow227TriangleData0731.coefficient49_386,
  OriginalRow227TriangleData0731.coefficient49_387,
  OriginalRow227TriangleData0731.coefficient49_388,
  OriginalRow227TriangleData0731.coefficient49_389,
  OriginalRow227TriangleData0731.coefficient49_390,
  OriginalRow227TriangleData0731.coefficient49_391,
  OriginalRow227TriangleData0731.coefficient49_392,
  OriginalRow227TriangleData0731.coefficient49_393,
  OriginalRow227TriangleData0731.coefficient49_394,
  OriginalRow227TriangleData0731.coefficient49_395,
  OriginalRow227TriangleData0731.coefficient49_396,
  OriginalRow227TriangleData0731.coefficient49_397,
  OriginalRow227TriangleData0731.coefficient49_398,
  OriginalRow227TriangleData0731.coefficient49_399
]

theorem values0731_size : values0731.size = 32 := rfl

def block0731 : ℕ → Option IntervalDyadic := segment 368 values0731

theorem block0731_domain : ExactDomain block0731 368 400 := by
  simpa only [values0731_size] using segment_domain 368 values0731

theorem block0731_get (i : Fin 32) :
    block0731 (368 + i.val) = some (values0731[i.val]'(by rw [values0731_size]; exact i.isLt)) := by
  exact segment_get 368 values0731 ⟨i.val, by rw [values0731_size]; exact i.isLt⟩

def values0732 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0732.coefficient49_400,
  OriginalRow227TriangleData0732.coefficient49_401,
  OriginalRow227TriangleData0732.coefficient49_402,
  OriginalRow227TriangleData0732.coefficient49_403,
  OriginalRow227TriangleData0732.coefficient49_404,
  OriginalRow227TriangleData0732.coefficient49_405,
  OriginalRow227TriangleData0732.coefficient49_406,
  OriginalRow227TriangleData0732.coefficient49_407,
  OriginalRow227TriangleData0732.coefficient49_408,
  OriginalRow227TriangleData0732.coefficient49_409,
  OriginalRow227TriangleData0732.coefficient49_410,
  OriginalRow227TriangleData0732.coefficient49_411,
  OriginalRow227TriangleData0732.coefficient49_412,
  OriginalRow227TriangleData0732.coefficient49_413,
  OriginalRow227TriangleData0732.coefficient49_414,
  OriginalRow227TriangleData0732.coefficient49_415,
  OriginalRow227TriangleData0732.coefficient49_416,
  OriginalRow227TriangleData0732.coefficient49_417,
  OriginalRow227TriangleData0732.coefficient49_418,
  OriginalRow227TriangleData0732.coefficient49_419,
  OriginalRow227TriangleData0732.coefficient49_420,
  OriginalRow227TriangleData0732.coefficient49_421,
  OriginalRow227TriangleData0732.coefficient49_422,
  OriginalRow227TriangleData0732.coefficient49_423,
  OriginalRow227TriangleData0732.coefficient49_424,
  OriginalRow227TriangleData0732.coefficient49_425,
  OriginalRow227TriangleData0732.coefficient49_426,
  OriginalRow227TriangleData0732.coefficient49_427,
  OriginalRow227TriangleData0732.coefficient49_428,
  OriginalRow227TriangleData0732.coefficient49_429,
  OriginalRow227TriangleData0732.coefficient49_430,
  OriginalRow227TriangleData0732.coefficient49_431
]

theorem values0732_size : values0732.size = 32 := rfl

def block0732 : ℕ → Option IntervalDyadic := segment 400 values0732

theorem block0732_domain : ExactDomain block0732 400 432 := by
  simpa only [values0732_size] using segment_domain 400 values0732

theorem block0732_get (i : Fin 32) :
    block0732 (400 + i.val) = some (values0732[i.val]'(by rw [values0732_size]; exact i.isLt)) := by
  exact segment_get 400 values0732 ⟨i.val, by rw [values0732_size]; exact i.isLt⟩

def values0733 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0733.coefficient49_432,
  OriginalRow227TriangleData0733.coefficient49_433,
  OriginalRow227TriangleData0733.coefficient49_434,
  OriginalRow227TriangleData0733.coefficient49_435,
  OriginalRow227TriangleData0733.coefficient49_436,
  OriginalRow227TriangleData0733.coefficient49_437,
  OriginalRow227TriangleData0733.coefficient49_438,
  OriginalRow227TriangleData0733.coefficient49_439,
  OriginalRow227TriangleData0733.coefficient49_440,
  OriginalRow227TriangleData0733.coefficient49_441,
  OriginalRow227TriangleData0733.coefficient49_442,
  OriginalRow227TriangleData0733.coefficient49_443,
  OriginalRow227TriangleData0733.coefficient49_444,
  OriginalRow227TriangleData0733.coefficient49_445,
  OriginalRow227TriangleData0733.coefficient49_446,
  OriginalRow227TriangleData0733.coefficient49_447,
  OriginalRow227TriangleData0733.coefficient49_448,
  OriginalRow227TriangleData0733.coefficient49_449,
  OriginalRow227TriangleData0733.coefficient49_450,
  OriginalRow227TriangleData0733.coefficient49_451,
  OriginalRow227TriangleData0733.coefficient49_452
]

theorem values0733_size : values0733.size = 21 := rfl

def block0733 : ℕ → Option IntervalDyadic := segment 432 values0733

theorem block0733_domain : ExactDomain block0733 432 453 := by
  simpa only [values0733_size] using segment_domain 432 values0733

theorem block0733_get (i : Fin 21) :
    block0733 (432 + i.val) = some (values0733[i.val]'(by rw [values0733_size]; exact i.isLt)) := by
  exact segment_get 432 values0733 ⟨i.val, by rw [values0733_size]; exact i.isLt⟩

def node0080_0144 : ℕ → Option IntervalDyadic := split 112 block0722 block0723

theorem node0080_0144_domain : ExactDomain node0080_0144 80 144 := by
  exact split_domain (by decide) (by decide) block0722_domain block0723_domain

def node0048_0144 : ℕ → Option IntervalDyadic := split 80 block0721 node0080_0144

theorem node0048_0144_domain : ExactDomain node0048_0144 48 144 := by
  exact split_domain (by decide) (by decide) block0721_domain node0080_0144_domain

def node0176_0240 : ℕ → Option IntervalDyadic := split 208 block0725 block0726

theorem node0176_0240_domain : ExactDomain node0176_0240 176 240 := by
  exact split_domain (by decide) (by decide) block0725_domain block0726_domain

def node0144_0240 : ℕ → Option IntervalDyadic := split 176 block0724 node0176_0240

theorem node0144_0240_domain : ExactDomain node0144_0240 144 240 := by
  exact split_domain (by decide) (by decide) block0724_domain node0176_0240_domain

def node0048_0240 : ℕ → Option IntervalDyadic := split 144 node0048_0144 node0144_0240

theorem node0048_0240_domain : ExactDomain node0048_0240 48 240 := by
  exact split_domain (by decide) (by decide) node0048_0144_domain node0144_0240_domain

def node0272_0336 : ℕ → Option IntervalDyadic := split 304 block0728 block0729

theorem node0272_0336_domain : ExactDomain node0272_0336 272 336 := by
  exact split_domain (by decide) (by decide) block0728_domain block0729_domain

def node0240_0336 : ℕ → Option IntervalDyadic := split 272 block0727 node0272_0336

theorem node0240_0336_domain : ExactDomain node0240_0336 240 336 := by
  exact split_domain (by decide) (by decide) block0727_domain node0272_0336_domain

def node0336_0400 : ℕ → Option IntervalDyadic := split 368 block0730 block0731

theorem node0336_0400_domain : ExactDomain node0336_0400 336 400 := by
  exact split_domain (by decide) (by decide) block0730_domain block0731_domain

def node0400_0453 : ℕ → Option IntervalDyadic := split 432 block0732 block0733

theorem node0400_0453_domain : ExactDomain node0400_0453 400 453 := by
  exact split_domain (by decide) (by decide) block0732_domain block0733_domain

def node0336_0453 : ℕ → Option IntervalDyadic := split 400 node0336_0400 node0400_0453

theorem node0336_0453_domain : ExactDomain node0336_0453 336 453 := by
  exact split_domain (by decide) (by decide) node0336_0400_domain node0400_0453_domain

def node0240_0453 : ℕ → Option IntervalDyadic := split 336 node0240_0336 node0336_0453

theorem node0240_0453_domain : ExactDomain node0240_0453 240 453 := by
  exact split_domain (by decide) (by decide) node0240_0336_domain node0336_0453_domain

def node0048_0453 : ℕ → Option IntervalDyadic := split 240 node0048_0240 node0240_0453

theorem node0048_0453_domain : ExactDomain node0048_0453 48 453 := by
  exact split_domain (by decide) (by decide) node0048_0240_domain node0240_0453_domain

def lookup : ℕ → Option IntervalDyadic := node0048_0453

theorem lookup_domain : ExactDomain lookup 48 453 :=
  node0048_0453_domain

theorem block0721_lookup (i : Fin 32) :
    lookup (48 + i.val) = some (values0721[i.val]'(by rw [values0721_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (48 + i.val) = _
  rw [node0048_0453, split_left 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0048_0240, split_left 144 node0048_0144 node0144_0240 (by omega)]
  rw [node0048_0144, split_left 80 block0721 node0080_0144 (by omega)]
  exact block0721_get i

theorem block0722_lookup (i : Fin 32) :
    lookup (80 + i.val) = some (values0722[i.val]'(by rw [values0722_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (80 + i.val) = _
  rw [node0048_0453, split_left 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0048_0240, split_left 144 node0048_0144 node0144_0240 (by omega)]
  rw [node0048_0144, split_right 80 block0721 node0080_0144 (by omega)]
  rw [node0080_0144, split_left 112 block0722 block0723 (by omega)]
  exact block0722_get i

theorem block0723_lookup (i : Fin 32) :
    lookup (112 + i.val) = some (values0723[i.val]'(by rw [values0723_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (112 + i.val) = _
  rw [node0048_0453, split_left 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0048_0240, split_left 144 node0048_0144 node0144_0240 (by omega)]
  rw [node0048_0144, split_right 80 block0721 node0080_0144 (by omega)]
  rw [node0080_0144, split_right 112 block0722 block0723 (by omega)]
  exact block0723_get i

theorem block0724_lookup (i : Fin 32) :
    lookup (144 + i.val) = some (values0724[i.val]'(by rw [values0724_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (144 + i.val) = _
  rw [node0048_0453, split_left 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0048_0240, split_right 144 node0048_0144 node0144_0240 (by omega)]
  rw [node0144_0240, split_left 176 block0724 node0176_0240 (by omega)]
  exact block0724_get i

theorem block0725_lookup (i : Fin 32) :
    lookup (176 + i.val) = some (values0725[i.val]'(by rw [values0725_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (176 + i.val) = _
  rw [node0048_0453, split_left 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0048_0240, split_right 144 node0048_0144 node0144_0240 (by omega)]
  rw [node0144_0240, split_right 176 block0724 node0176_0240 (by omega)]
  rw [node0176_0240, split_left 208 block0725 block0726 (by omega)]
  exact block0725_get i

theorem block0726_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values0726[i.val]'(by rw [values0726_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (208 + i.val) = _
  rw [node0048_0453, split_left 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0048_0240, split_right 144 node0048_0144 node0144_0240 (by omega)]
  rw [node0144_0240, split_right 176 block0724 node0176_0240 (by omega)]
  rw [node0176_0240, split_right 208 block0725 block0726 (by omega)]
  exact block0726_get i

theorem block0727_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values0727[i.val]'(by rw [values0727_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (240 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_left 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0240_0336, split_left 272 block0727 node0272_0336 (by omega)]
  exact block0727_get i

theorem block0728_lookup (i : Fin 32) :
    lookup (272 + i.val) = some (values0728[i.val]'(by rw [values0728_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (272 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_left 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0240_0336, split_right 272 block0727 node0272_0336 (by omega)]
  rw [node0272_0336, split_left 304 block0728 block0729 (by omega)]
  exact block0728_get i

theorem block0729_lookup (i : Fin 32) :
    lookup (304 + i.val) = some (values0729[i.val]'(by rw [values0729_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (304 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_left 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0240_0336, split_right 272 block0727 node0272_0336 (by omega)]
  rw [node0272_0336, split_right 304 block0728 block0729 (by omega)]
  exact block0729_get i

theorem block0730_lookup (i : Fin 32) :
    lookup (336 + i.val) = some (values0730[i.val]'(by rw [values0730_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (336 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_right 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0336_0453, split_left 400 node0336_0400 node0400_0453 (by omega)]
  rw [node0336_0400, split_left 368 block0730 block0731 (by omega)]
  exact block0730_get i

theorem block0731_lookup (i : Fin 32) :
    lookup (368 + i.val) = some (values0731[i.val]'(by rw [values0731_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (368 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_right 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0336_0453, split_left 400 node0336_0400 node0400_0453 (by omega)]
  rw [node0336_0400, split_right 368 block0730 block0731 (by omega)]
  exact block0731_get i

theorem block0732_lookup (i : Fin 32) :
    lookup (400 + i.val) = some (values0732[i.val]'(by rw [values0732_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (400 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_right 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0336_0453, split_right 400 node0336_0400 node0400_0453 (by omega)]
  rw [node0400_0453, split_left 432 block0732 block0733 (by omega)]
  exact block0732_get i

theorem block0733_lookup (i : Fin 21) :
    lookup (432 + i.val) = some (values0733[i.val]'(by rw [values0733_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0048_0453 (432 + i.val) = _
  rw [node0048_0453, split_right 240 node0048_0240 node0240_0453 (by omega)]
  rw [node0240_0453, split_right 336 node0240_0336 node0336_0453 (by omega)]
  rw [node0336_0453, split_right 400 node0336_0400 node0400_0453 (by omega)]
  rw [node0400_0453, split_right 432 block0732 block0733 (by omega)]
  exact block0733_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0721_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0721_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0722_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0722_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0723_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0723_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0724_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0724_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0725_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0725_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0726_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0726_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0727_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0727_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0728_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0728_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0729_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0729_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0730_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0730_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0731_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0731_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0732_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0732_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0733_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0733_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0721_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0722_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0723_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0724_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0725_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0726_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0727_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0728_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0729_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0730_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0731_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0732_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow049.block0733_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow049
