import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0734
import Grothe.UpperChaos.OriginalRow227TriangleData0735
import Grothe.UpperChaos.OriginalRow227TriangleData0736
import Grothe.UpperChaos.OriginalRow227TriangleData0737
import Grothe.UpperChaos.OriginalRow227TriangleData0738
import Grothe.UpperChaos.OriginalRow227TriangleData0739
import Grothe.UpperChaos.OriginalRow227TriangleData0740
import Grothe.UpperChaos.OriginalRow227TriangleData0741
import Grothe.UpperChaos.OriginalRow227TriangleData0742
import Grothe.UpperChaos.OriginalRow227TriangleData0743
import Grothe.UpperChaos.OriginalRow227TriangleData0744
import Grothe.UpperChaos.OriginalRow227TriangleData0745
import Grothe.UpperChaos.OriginalRow227TriangleData0746

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow050

open ConditionalTableLookup

def values0734 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0734.coefficient50_49,
  OriginalRow227TriangleData0734.coefficient50_50,
  OriginalRow227TriangleData0734.coefficient50_51,
  OriginalRow227TriangleData0734.coefficient50_52,
  OriginalRow227TriangleData0734.coefficient50_53,
  OriginalRow227TriangleData0734.coefficient50_54,
  OriginalRow227TriangleData0734.coefficient50_55,
  OriginalRow227TriangleData0734.coefficient50_56,
  OriginalRow227TriangleData0734.coefficient50_57,
  OriginalRow227TriangleData0734.coefficient50_58,
  OriginalRow227TriangleData0734.coefficient50_59,
  OriginalRow227TriangleData0734.coefficient50_60,
  OriginalRow227TriangleData0734.coefficient50_61,
  OriginalRow227TriangleData0734.coefficient50_62,
  OriginalRow227TriangleData0734.coefficient50_63,
  OriginalRow227TriangleData0734.coefficient50_64,
  OriginalRow227TriangleData0734.coefficient50_65,
  OriginalRow227TriangleData0734.coefficient50_66,
  OriginalRow227TriangleData0734.coefficient50_67,
  OriginalRow227TriangleData0734.coefficient50_68,
  OriginalRow227TriangleData0734.coefficient50_69,
  OriginalRow227TriangleData0734.coefficient50_70,
  OriginalRow227TriangleData0734.coefficient50_71,
  OriginalRow227TriangleData0734.coefficient50_72,
  OriginalRow227TriangleData0734.coefficient50_73,
  OriginalRow227TriangleData0734.coefficient50_74,
  OriginalRow227TriangleData0734.coefficient50_75,
  OriginalRow227TriangleData0734.coefficient50_76,
  OriginalRow227TriangleData0734.coefficient50_77,
  OriginalRow227TriangleData0734.coefficient50_78,
  OriginalRow227TriangleData0734.coefficient50_79,
  OriginalRow227TriangleData0734.coefficient50_80
]

theorem values0734_size : values0734.size = 32 := rfl

def block0734 : ℕ → Option IntervalDyadic := segment 49 values0734

theorem block0734_domain : ExactDomain block0734 49 81 := by
  simpa only [values0734_size] using segment_domain 49 values0734

theorem block0734_get (i : Fin 32) :
    block0734 (49 + i.val) = some (values0734[i.val]'(by rw [values0734_size]; exact i.isLt)) := by
  exact segment_get 49 values0734 ⟨i.val, by rw [values0734_size]; exact i.isLt⟩

def values0735 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0735.coefficient50_81,
  OriginalRow227TriangleData0735.coefficient50_82,
  OriginalRow227TriangleData0735.coefficient50_83,
  OriginalRow227TriangleData0735.coefficient50_84,
  OriginalRow227TriangleData0735.coefficient50_85,
  OriginalRow227TriangleData0735.coefficient50_86,
  OriginalRow227TriangleData0735.coefficient50_87,
  OriginalRow227TriangleData0735.coefficient50_88,
  OriginalRow227TriangleData0735.coefficient50_89,
  OriginalRow227TriangleData0735.coefficient50_90,
  OriginalRow227TriangleData0735.coefficient50_91,
  OriginalRow227TriangleData0735.coefficient50_92,
  OriginalRow227TriangleData0735.coefficient50_93,
  OriginalRow227TriangleData0735.coefficient50_94,
  OriginalRow227TriangleData0735.coefficient50_95,
  OriginalRow227TriangleData0735.coefficient50_96,
  OriginalRow227TriangleData0735.coefficient50_97,
  OriginalRow227TriangleData0735.coefficient50_98,
  OriginalRow227TriangleData0735.coefficient50_99,
  OriginalRow227TriangleData0735.coefficient50_100,
  OriginalRow227TriangleData0735.coefficient50_101,
  OriginalRow227TriangleData0735.coefficient50_102,
  OriginalRow227TriangleData0735.coefficient50_103,
  OriginalRow227TriangleData0735.coefficient50_104,
  OriginalRow227TriangleData0735.coefficient50_105,
  OriginalRow227TriangleData0735.coefficient50_106,
  OriginalRow227TriangleData0735.coefficient50_107,
  OriginalRow227TriangleData0735.coefficient50_108,
  OriginalRow227TriangleData0735.coefficient50_109,
  OriginalRow227TriangleData0735.coefficient50_110,
  OriginalRow227TriangleData0735.coefficient50_111,
  OriginalRow227TriangleData0735.coefficient50_112
]

theorem values0735_size : values0735.size = 32 := rfl

def block0735 : ℕ → Option IntervalDyadic := segment 81 values0735

theorem block0735_domain : ExactDomain block0735 81 113 := by
  simpa only [values0735_size] using segment_domain 81 values0735

theorem block0735_get (i : Fin 32) :
    block0735 (81 + i.val) = some (values0735[i.val]'(by rw [values0735_size]; exact i.isLt)) := by
  exact segment_get 81 values0735 ⟨i.val, by rw [values0735_size]; exact i.isLt⟩

def values0736 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0736.coefficient50_113,
  OriginalRow227TriangleData0736.coefficient50_114,
  OriginalRow227TriangleData0736.coefficient50_115,
  OriginalRow227TriangleData0736.coefficient50_116,
  OriginalRow227TriangleData0736.coefficient50_117,
  OriginalRow227TriangleData0736.coefficient50_118,
  OriginalRow227TriangleData0736.coefficient50_119,
  OriginalRow227TriangleData0736.coefficient50_120,
  OriginalRow227TriangleData0736.coefficient50_121,
  OriginalRow227TriangleData0736.coefficient50_122,
  OriginalRow227TriangleData0736.coefficient50_123,
  OriginalRow227TriangleData0736.coefficient50_124,
  OriginalRow227TriangleData0736.coefficient50_125,
  OriginalRow227TriangleData0736.coefficient50_126,
  OriginalRow227TriangleData0736.coefficient50_127,
  OriginalRow227TriangleData0736.coefficient50_128,
  OriginalRow227TriangleData0736.coefficient50_129,
  OriginalRow227TriangleData0736.coefficient50_130,
  OriginalRow227TriangleData0736.coefficient50_131,
  OriginalRow227TriangleData0736.coefficient50_132,
  OriginalRow227TriangleData0736.coefficient50_133,
  OriginalRow227TriangleData0736.coefficient50_134,
  OriginalRow227TriangleData0736.coefficient50_135,
  OriginalRow227TriangleData0736.coefficient50_136,
  OriginalRow227TriangleData0736.coefficient50_137,
  OriginalRow227TriangleData0736.coefficient50_138,
  OriginalRow227TriangleData0736.coefficient50_139,
  OriginalRow227TriangleData0736.coefficient50_140,
  OriginalRow227TriangleData0736.coefficient50_141,
  OriginalRow227TriangleData0736.coefficient50_142,
  OriginalRow227TriangleData0736.coefficient50_143,
  OriginalRow227TriangleData0736.coefficient50_144
]

theorem values0736_size : values0736.size = 32 := rfl

def block0736 : ℕ → Option IntervalDyadic := segment 113 values0736

theorem block0736_domain : ExactDomain block0736 113 145 := by
  simpa only [values0736_size] using segment_domain 113 values0736

theorem block0736_get (i : Fin 32) :
    block0736 (113 + i.val) = some (values0736[i.val]'(by rw [values0736_size]; exact i.isLt)) := by
  exact segment_get 113 values0736 ⟨i.val, by rw [values0736_size]; exact i.isLt⟩

def values0737 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0737.coefficient50_145,
  OriginalRow227TriangleData0737.coefficient50_146,
  OriginalRow227TriangleData0737.coefficient50_147,
  OriginalRow227TriangleData0737.coefficient50_148,
  OriginalRow227TriangleData0737.coefficient50_149,
  OriginalRow227TriangleData0737.coefficient50_150,
  OriginalRow227TriangleData0737.coefficient50_151,
  OriginalRow227TriangleData0737.coefficient50_152,
  OriginalRow227TriangleData0737.coefficient50_153,
  OriginalRow227TriangleData0737.coefficient50_154,
  OriginalRow227TriangleData0737.coefficient50_155,
  OriginalRow227TriangleData0737.coefficient50_156,
  OriginalRow227TriangleData0737.coefficient50_157,
  OriginalRow227TriangleData0737.coefficient50_158,
  OriginalRow227TriangleData0737.coefficient50_159,
  OriginalRow227TriangleData0737.coefficient50_160,
  OriginalRow227TriangleData0737.coefficient50_161,
  OriginalRow227TriangleData0737.coefficient50_162,
  OriginalRow227TriangleData0737.coefficient50_163,
  OriginalRow227TriangleData0737.coefficient50_164,
  OriginalRow227TriangleData0737.coefficient50_165,
  OriginalRow227TriangleData0737.coefficient50_166,
  OriginalRow227TriangleData0737.coefficient50_167,
  OriginalRow227TriangleData0737.coefficient50_168,
  OriginalRow227TriangleData0737.coefficient50_169,
  OriginalRow227TriangleData0737.coefficient50_170,
  OriginalRow227TriangleData0737.coefficient50_171,
  OriginalRow227TriangleData0737.coefficient50_172,
  OriginalRow227TriangleData0737.coefficient50_173,
  OriginalRow227TriangleData0737.coefficient50_174,
  OriginalRow227TriangleData0737.coefficient50_175,
  OriginalRow227TriangleData0737.coefficient50_176
]

theorem values0737_size : values0737.size = 32 := rfl

def block0737 : ℕ → Option IntervalDyadic := segment 145 values0737

theorem block0737_domain : ExactDomain block0737 145 177 := by
  simpa only [values0737_size] using segment_domain 145 values0737

theorem block0737_get (i : Fin 32) :
    block0737 (145 + i.val) = some (values0737[i.val]'(by rw [values0737_size]; exact i.isLt)) := by
  exact segment_get 145 values0737 ⟨i.val, by rw [values0737_size]; exact i.isLt⟩

def values0738 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0738.coefficient50_177,
  OriginalRow227TriangleData0738.coefficient50_178,
  OriginalRow227TriangleData0738.coefficient50_179,
  OriginalRow227TriangleData0738.coefficient50_180,
  OriginalRow227TriangleData0738.coefficient50_181,
  OriginalRow227TriangleData0738.coefficient50_182,
  OriginalRow227TriangleData0738.coefficient50_183,
  OriginalRow227TriangleData0738.coefficient50_184,
  OriginalRow227TriangleData0738.coefficient50_185,
  OriginalRow227TriangleData0738.coefficient50_186,
  OriginalRow227TriangleData0738.coefficient50_187,
  OriginalRow227TriangleData0738.coefficient50_188,
  OriginalRow227TriangleData0738.coefficient50_189,
  OriginalRow227TriangleData0738.coefficient50_190,
  OriginalRow227TriangleData0738.coefficient50_191,
  OriginalRow227TriangleData0738.coefficient50_192,
  OriginalRow227TriangleData0738.coefficient50_193,
  OriginalRow227TriangleData0738.coefficient50_194,
  OriginalRow227TriangleData0738.coefficient50_195,
  OriginalRow227TriangleData0738.coefficient50_196,
  OriginalRow227TriangleData0738.coefficient50_197,
  OriginalRow227TriangleData0738.coefficient50_198,
  OriginalRow227TriangleData0738.coefficient50_199,
  OriginalRow227TriangleData0738.coefficient50_200,
  OriginalRow227TriangleData0738.coefficient50_201,
  OriginalRow227TriangleData0738.coefficient50_202,
  OriginalRow227TriangleData0738.coefficient50_203,
  OriginalRow227TriangleData0738.coefficient50_204,
  OriginalRow227TriangleData0738.coefficient50_205,
  OriginalRow227TriangleData0738.coefficient50_206,
  OriginalRow227TriangleData0738.coefficient50_207,
  OriginalRow227TriangleData0738.coefficient50_208
]

theorem values0738_size : values0738.size = 32 := rfl

def block0738 : ℕ → Option IntervalDyadic := segment 177 values0738

theorem block0738_domain : ExactDomain block0738 177 209 := by
  simpa only [values0738_size] using segment_domain 177 values0738

theorem block0738_get (i : Fin 32) :
    block0738 (177 + i.val) = some (values0738[i.val]'(by rw [values0738_size]; exact i.isLt)) := by
  exact segment_get 177 values0738 ⟨i.val, by rw [values0738_size]; exact i.isLt⟩

def values0739 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0739.coefficient50_209,
  OriginalRow227TriangleData0739.coefficient50_210,
  OriginalRow227TriangleData0739.coefficient50_211,
  OriginalRow227TriangleData0739.coefficient50_212,
  OriginalRow227TriangleData0739.coefficient50_213,
  OriginalRow227TriangleData0739.coefficient50_214,
  OriginalRow227TriangleData0739.coefficient50_215,
  OriginalRow227TriangleData0739.coefficient50_216,
  OriginalRow227TriangleData0739.coefficient50_217,
  OriginalRow227TriangleData0739.coefficient50_218,
  OriginalRow227TriangleData0739.coefficient50_219,
  OriginalRow227TriangleData0739.coefficient50_220,
  OriginalRow227TriangleData0739.coefficient50_221,
  OriginalRow227TriangleData0739.coefficient50_222,
  OriginalRow227TriangleData0739.coefficient50_223,
  OriginalRow227TriangleData0739.coefficient50_224,
  OriginalRow227TriangleData0739.coefficient50_225,
  OriginalRow227TriangleData0739.coefficient50_226,
  OriginalRow227TriangleData0739.coefficient50_227,
  OriginalRow227TriangleData0739.coefficient50_228,
  OriginalRow227TriangleData0739.coefficient50_229,
  OriginalRow227TriangleData0739.coefficient50_230,
  OriginalRow227TriangleData0739.coefficient50_231,
  OriginalRow227TriangleData0739.coefficient50_232,
  OriginalRow227TriangleData0739.coefficient50_233,
  OriginalRow227TriangleData0739.coefficient50_234,
  OriginalRow227TriangleData0739.coefficient50_235,
  OriginalRow227TriangleData0739.coefficient50_236,
  OriginalRow227TriangleData0739.coefficient50_237,
  OriginalRow227TriangleData0739.coefficient50_238,
  OriginalRow227TriangleData0739.coefficient50_239,
  OriginalRow227TriangleData0739.coefficient50_240
]

theorem values0739_size : values0739.size = 32 := rfl

def block0739 : ℕ → Option IntervalDyadic := segment 209 values0739

theorem block0739_domain : ExactDomain block0739 209 241 := by
  simpa only [values0739_size] using segment_domain 209 values0739

theorem block0739_get (i : Fin 32) :
    block0739 (209 + i.val) = some (values0739[i.val]'(by rw [values0739_size]; exact i.isLt)) := by
  exact segment_get 209 values0739 ⟨i.val, by rw [values0739_size]; exact i.isLt⟩

def values0740 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0740.coefficient50_241,
  OriginalRow227TriangleData0740.coefficient50_242,
  OriginalRow227TriangleData0740.coefficient50_243,
  OriginalRow227TriangleData0740.coefficient50_244,
  OriginalRow227TriangleData0740.coefficient50_245,
  OriginalRow227TriangleData0740.coefficient50_246,
  OriginalRow227TriangleData0740.coefficient50_247,
  OriginalRow227TriangleData0740.coefficient50_248,
  OriginalRow227TriangleData0740.coefficient50_249,
  OriginalRow227TriangleData0740.coefficient50_250,
  OriginalRow227TriangleData0740.coefficient50_251,
  OriginalRow227TriangleData0740.coefficient50_252,
  OriginalRow227TriangleData0740.coefficient50_253,
  OriginalRow227TriangleData0740.coefficient50_254,
  OriginalRow227TriangleData0740.coefficient50_255,
  OriginalRow227TriangleData0740.coefficient50_256,
  OriginalRow227TriangleData0740.coefficient50_257,
  OriginalRow227TriangleData0740.coefficient50_258,
  OriginalRow227TriangleData0740.coefficient50_259,
  OriginalRow227TriangleData0740.coefficient50_260,
  OriginalRow227TriangleData0740.coefficient50_261,
  OriginalRow227TriangleData0740.coefficient50_262,
  OriginalRow227TriangleData0740.coefficient50_263,
  OriginalRow227TriangleData0740.coefficient50_264,
  OriginalRow227TriangleData0740.coefficient50_265,
  OriginalRow227TriangleData0740.coefficient50_266,
  OriginalRow227TriangleData0740.coefficient50_267,
  OriginalRow227TriangleData0740.coefficient50_268,
  OriginalRow227TriangleData0740.coefficient50_269,
  OriginalRow227TriangleData0740.coefficient50_270,
  OriginalRow227TriangleData0740.coefficient50_271,
  OriginalRow227TriangleData0740.coefficient50_272
]

theorem values0740_size : values0740.size = 32 := rfl

def block0740 : ℕ → Option IntervalDyadic := segment 241 values0740

theorem block0740_domain : ExactDomain block0740 241 273 := by
  simpa only [values0740_size] using segment_domain 241 values0740

theorem block0740_get (i : Fin 32) :
    block0740 (241 + i.val) = some (values0740[i.val]'(by rw [values0740_size]; exact i.isLt)) := by
  exact segment_get 241 values0740 ⟨i.val, by rw [values0740_size]; exact i.isLt⟩

def values0741 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0741.coefficient50_273,
  OriginalRow227TriangleData0741.coefficient50_274,
  OriginalRow227TriangleData0741.coefficient50_275,
  OriginalRow227TriangleData0741.coefficient50_276,
  OriginalRow227TriangleData0741.coefficient50_277,
  OriginalRow227TriangleData0741.coefficient50_278,
  OriginalRow227TriangleData0741.coefficient50_279,
  OriginalRow227TriangleData0741.coefficient50_280,
  OriginalRow227TriangleData0741.coefficient50_281,
  OriginalRow227TriangleData0741.coefficient50_282,
  OriginalRow227TriangleData0741.coefficient50_283,
  OriginalRow227TriangleData0741.coefficient50_284,
  OriginalRow227TriangleData0741.coefficient50_285,
  OriginalRow227TriangleData0741.coefficient50_286,
  OriginalRow227TriangleData0741.coefficient50_287,
  OriginalRow227TriangleData0741.coefficient50_288,
  OriginalRow227TriangleData0741.coefficient50_289,
  OriginalRow227TriangleData0741.coefficient50_290,
  OriginalRow227TriangleData0741.coefficient50_291,
  OriginalRow227TriangleData0741.coefficient50_292,
  OriginalRow227TriangleData0741.coefficient50_293,
  OriginalRow227TriangleData0741.coefficient50_294,
  OriginalRow227TriangleData0741.coefficient50_295,
  OriginalRow227TriangleData0741.coefficient50_296,
  OriginalRow227TriangleData0741.coefficient50_297,
  OriginalRow227TriangleData0741.coefficient50_298,
  OriginalRow227TriangleData0741.coefficient50_299,
  OriginalRow227TriangleData0741.coefficient50_300,
  OriginalRow227TriangleData0741.coefficient50_301,
  OriginalRow227TriangleData0741.coefficient50_302,
  OriginalRow227TriangleData0741.coefficient50_303,
  OriginalRow227TriangleData0741.coefficient50_304
]

theorem values0741_size : values0741.size = 32 := rfl

def block0741 : ℕ → Option IntervalDyadic := segment 273 values0741

theorem block0741_domain : ExactDomain block0741 273 305 := by
  simpa only [values0741_size] using segment_domain 273 values0741

theorem block0741_get (i : Fin 32) :
    block0741 (273 + i.val) = some (values0741[i.val]'(by rw [values0741_size]; exact i.isLt)) := by
  exact segment_get 273 values0741 ⟨i.val, by rw [values0741_size]; exact i.isLt⟩

def values0742 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0742.coefficient50_305,
  OriginalRow227TriangleData0742.coefficient50_306,
  OriginalRow227TriangleData0742.coefficient50_307,
  OriginalRow227TriangleData0742.coefficient50_308,
  OriginalRow227TriangleData0742.coefficient50_309,
  OriginalRow227TriangleData0742.coefficient50_310,
  OriginalRow227TriangleData0742.coefficient50_311,
  OriginalRow227TriangleData0742.coefficient50_312,
  OriginalRow227TriangleData0742.coefficient50_313,
  OriginalRow227TriangleData0742.coefficient50_314,
  OriginalRow227TriangleData0742.coefficient50_315,
  OriginalRow227TriangleData0742.coefficient50_316,
  OriginalRow227TriangleData0742.coefficient50_317,
  OriginalRow227TriangleData0742.coefficient50_318,
  OriginalRow227TriangleData0742.coefficient50_319,
  OriginalRow227TriangleData0742.coefficient50_320,
  OriginalRow227TriangleData0742.coefficient50_321,
  OriginalRow227TriangleData0742.coefficient50_322,
  OriginalRow227TriangleData0742.coefficient50_323,
  OriginalRow227TriangleData0742.coefficient50_324,
  OriginalRow227TriangleData0742.coefficient50_325,
  OriginalRow227TriangleData0742.coefficient50_326,
  OriginalRow227TriangleData0742.coefficient50_327,
  OriginalRow227TriangleData0742.coefficient50_328,
  OriginalRow227TriangleData0742.coefficient50_329,
  OriginalRow227TriangleData0742.coefficient50_330,
  OriginalRow227TriangleData0742.coefficient50_331,
  OriginalRow227TriangleData0742.coefficient50_332,
  OriginalRow227TriangleData0742.coefficient50_333,
  OriginalRow227TriangleData0742.coefficient50_334,
  OriginalRow227TriangleData0742.coefficient50_335,
  OriginalRow227TriangleData0742.coefficient50_336
]

theorem values0742_size : values0742.size = 32 := rfl

def block0742 : ℕ → Option IntervalDyadic := segment 305 values0742

theorem block0742_domain : ExactDomain block0742 305 337 := by
  simpa only [values0742_size] using segment_domain 305 values0742

theorem block0742_get (i : Fin 32) :
    block0742 (305 + i.val) = some (values0742[i.val]'(by rw [values0742_size]; exact i.isLt)) := by
  exact segment_get 305 values0742 ⟨i.val, by rw [values0742_size]; exact i.isLt⟩

def values0743 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0743.coefficient50_337,
  OriginalRow227TriangleData0743.coefficient50_338,
  OriginalRow227TriangleData0743.coefficient50_339,
  OriginalRow227TriangleData0743.coefficient50_340,
  OriginalRow227TriangleData0743.coefficient50_341,
  OriginalRow227TriangleData0743.coefficient50_342,
  OriginalRow227TriangleData0743.coefficient50_343,
  OriginalRow227TriangleData0743.coefficient50_344,
  OriginalRow227TriangleData0743.coefficient50_345,
  OriginalRow227TriangleData0743.coefficient50_346,
  OriginalRow227TriangleData0743.coefficient50_347,
  OriginalRow227TriangleData0743.coefficient50_348,
  OriginalRow227TriangleData0743.coefficient50_349,
  OriginalRow227TriangleData0743.coefficient50_350,
  OriginalRow227TriangleData0743.coefficient50_351,
  OriginalRow227TriangleData0743.coefficient50_352,
  OriginalRow227TriangleData0743.coefficient50_353,
  OriginalRow227TriangleData0743.coefficient50_354,
  OriginalRow227TriangleData0743.coefficient50_355,
  OriginalRow227TriangleData0743.coefficient50_356,
  OriginalRow227TriangleData0743.coefficient50_357,
  OriginalRow227TriangleData0743.coefficient50_358,
  OriginalRow227TriangleData0743.coefficient50_359,
  OriginalRow227TriangleData0743.coefficient50_360,
  OriginalRow227TriangleData0743.coefficient50_361,
  OriginalRow227TriangleData0743.coefficient50_362,
  OriginalRow227TriangleData0743.coefficient50_363,
  OriginalRow227TriangleData0743.coefficient50_364,
  OriginalRow227TriangleData0743.coefficient50_365,
  OriginalRow227TriangleData0743.coefficient50_366,
  OriginalRow227TriangleData0743.coefficient50_367,
  OriginalRow227TriangleData0743.coefficient50_368
]

theorem values0743_size : values0743.size = 32 := rfl

def block0743 : ℕ → Option IntervalDyadic := segment 337 values0743

theorem block0743_domain : ExactDomain block0743 337 369 := by
  simpa only [values0743_size] using segment_domain 337 values0743

theorem block0743_get (i : Fin 32) :
    block0743 (337 + i.val) = some (values0743[i.val]'(by rw [values0743_size]; exact i.isLt)) := by
  exact segment_get 337 values0743 ⟨i.val, by rw [values0743_size]; exact i.isLt⟩

def values0744 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0744.coefficient50_369,
  OriginalRow227TriangleData0744.coefficient50_370,
  OriginalRow227TriangleData0744.coefficient50_371,
  OriginalRow227TriangleData0744.coefficient50_372,
  OriginalRow227TriangleData0744.coefficient50_373,
  OriginalRow227TriangleData0744.coefficient50_374,
  OriginalRow227TriangleData0744.coefficient50_375,
  OriginalRow227TriangleData0744.coefficient50_376,
  OriginalRow227TriangleData0744.coefficient50_377,
  OriginalRow227TriangleData0744.coefficient50_378,
  OriginalRow227TriangleData0744.coefficient50_379,
  OriginalRow227TriangleData0744.coefficient50_380,
  OriginalRow227TriangleData0744.coefficient50_381,
  OriginalRow227TriangleData0744.coefficient50_382,
  OriginalRow227TriangleData0744.coefficient50_383,
  OriginalRow227TriangleData0744.coefficient50_384,
  OriginalRow227TriangleData0744.coefficient50_385,
  OriginalRow227TriangleData0744.coefficient50_386,
  OriginalRow227TriangleData0744.coefficient50_387,
  OriginalRow227TriangleData0744.coefficient50_388,
  OriginalRow227TriangleData0744.coefficient50_389,
  OriginalRow227TriangleData0744.coefficient50_390,
  OriginalRow227TriangleData0744.coefficient50_391,
  OriginalRow227TriangleData0744.coefficient50_392,
  OriginalRow227TriangleData0744.coefficient50_393,
  OriginalRow227TriangleData0744.coefficient50_394,
  OriginalRow227TriangleData0744.coefficient50_395,
  OriginalRow227TriangleData0744.coefficient50_396,
  OriginalRow227TriangleData0744.coefficient50_397,
  OriginalRow227TriangleData0744.coefficient50_398,
  OriginalRow227TriangleData0744.coefficient50_399,
  OriginalRow227TriangleData0744.coefficient50_400
]

theorem values0744_size : values0744.size = 32 := rfl

def block0744 : ℕ → Option IntervalDyadic := segment 369 values0744

theorem block0744_domain : ExactDomain block0744 369 401 := by
  simpa only [values0744_size] using segment_domain 369 values0744

theorem block0744_get (i : Fin 32) :
    block0744 (369 + i.val) = some (values0744[i.val]'(by rw [values0744_size]; exact i.isLt)) := by
  exact segment_get 369 values0744 ⟨i.val, by rw [values0744_size]; exact i.isLt⟩

def values0745 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0745.coefficient50_401,
  OriginalRow227TriangleData0745.coefficient50_402,
  OriginalRow227TriangleData0745.coefficient50_403,
  OriginalRow227TriangleData0745.coefficient50_404,
  OriginalRow227TriangleData0745.coefficient50_405,
  OriginalRow227TriangleData0745.coefficient50_406,
  OriginalRow227TriangleData0745.coefficient50_407,
  OriginalRow227TriangleData0745.coefficient50_408,
  OriginalRow227TriangleData0745.coefficient50_409,
  OriginalRow227TriangleData0745.coefficient50_410,
  OriginalRow227TriangleData0745.coefficient50_411,
  OriginalRow227TriangleData0745.coefficient50_412,
  OriginalRow227TriangleData0745.coefficient50_413,
  OriginalRow227TriangleData0745.coefficient50_414,
  OriginalRow227TriangleData0745.coefficient50_415,
  OriginalRow227TriangleData0745.coefficient50_416,
  OriginalRow227TriangleData0745.coefficient50_417,
  OriginalRow227TriangleData0745.coefficient50_418,
  OriginalRow227TriangleData0745.coefficient50_419,
  OriginalRow227TriangleData0745.coefficient50_420,
  OriginalRow227TriangleData0745.coefficient50_421,
  OriginalRow227TriangleData0745.coefficient50_422,
  OriginalRow227TriangleData0745.coefficient50_423,
  OriginalRow227TriangleData0745.coefficient50_424,
  OriginalRow227TriangleData0745.coefficient50_425,
  OriginalRow227TriangleData0745.coefficient50_426,
  OriginalRow227TriangleData0745.coefficient50_427,
  OriginalRow227TriangleData0745.coefficient50_428,
  OriginalRow227TriangleData0745.coefficient50_429,
  OriginalRow227TriangleData0745.coefficient50_430,
  OriginalRow227TriangleData0745.coefficient50_431,
  OriginalRow227TriangleData0745.coefficient50_432
]

theorem values0745_size : values0745.size = 32 := rfl

def block0745 : ℕ → Option IntervalDyadic := segment 401 values0745

theorem block0745_domain : ExactDomain block0745 401 433 := by
  simpa only [values0745_size] using segment_domain 401 values0745

theorem block0745_get (i : Fin 32) :
    block0745 (401 + i.val) = some (values0745[i.val]'(by rw [values0745_size]; exact i.isLt)) := by
  exact segment_get 401 values0745 ⟨i.val, by rw [values0745_size]; exact i.isLt⟩

def values0746 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0746.coefficient50_433,
  OriginalRow227TriangleData0746.coefficient50_434,
  OriginalRow227TriangleData0746.coefficient50_435,
  OriginalRow227TriangleData0746.coefficient50_436,
  OriginalRow227TriangleData0746.coefficient50_437,
  OriginalRow227TriangleData0746.coefficient50_438,
  OriginalRow227TriangleData0746.coefficient50_439,
  OriginalRow227TriangleData0746.coefficient50_440,
  OriginalRow227TriangleData0746.coefficient50_441,
  OriginalRow227TriangleData0746.coefficient50_442,
  OriginalRow227TriangleData0746.coefficient50_443,
  OriginalRow227TriangleData0746.coefficient50_444,
  OriginalRow227TriangleData0746.coefficient50_445,
  OriginalRow227TriangleData0746.coefficient50_446,
  OriginalRow227TriangleData0746.coefficient50_447,
  OriginalRow227TriangleData0746.coefficient50_448,
  OriginalRow227TriangleData0746.coefficient50_449,
  OriginalRow227TriangleData0746.coefficient50_450,
  OriginalRow227TriangleData0746.coefficient50_451
]

theorem values0746_size : values0746.size = 19 := rfl

def block0746 : ℕ → Option IntervalDyadic := segment 433 values0746

theorem block0746_domain : ExactDomain block0746 433 452 := by
  simpa only [values0746_size] using segment_domain 433 values0746

theorem block0746_get (i : Fin 19) :
    block0746 (433 + i.val) = some (values0746[i.val]'(by rw [values0746_size]; exact i.isLt)) := by
  exact segment_get 433 values0746 ⟨i.val, by rw [values0746_size]; exact i.isLt⟩

def node0081_0145 : ℕ → Option IntervalDyadic := split 113 block0735 block0736

theorem node0081_0145_domain : ExactDomain node0081_0145 81 145 := by
  exact split_domain (by decide) (by decide) block0735_domain block0736_domain

def node0049_0145 : ℕ → Option IntervalDyadic := split 81 block0734 node0081_0145

theorem node0049_0145_domain : ExactDomain node0049_0145 49 145 := by
  exact split_domain (by decide) (by decide) block0734_domain node0081_0145_domain

def node0177_0241 : ℕ → Option IntervalDyadic := split 209 block0738 block0739

theorem node0177_0241_domain : ExactDomain node0177_0241 177 241 := by
  exact split_domain (by decide) (by decide) block0738_domain block0739_domain

def node0145_0241 : ℕ → Option IntervalDyadic := split 177 block0737 node0177_0241

theorem node0145_0241_domain : ExactDomain node0145_0241 145 241 := by
  exact split_domain (by decide) (by decide) block0737_domain node0177_0241_domain

def node0049_0241 : ℕ → Option IntervalDyadic := split 145 node0049_0145 node0145_0241

theorem node0049_0241_domain : ExactDomain node0049_0241 49 241 := by
  exact split_domain (by decide) (by decide) node0049_0145_domain node0145_0241_domain

def node0273_0337 : ℕ → Option IntervalDyadic := split 305 block0741 block0742

theorem node0273_0337_domain : ExactDomain node0273_0337 273 337 := by
  exact split_domain (by decide) (by decide) block0741_domain block0742_domain

def node0241_0337 : ℕ → Option IntervalDyadic := split 273 block0740 node0273_0337

theorem node0241_0337_domain : ExactDomain node0241_0337 241 337 := by
  exact split_domain (by decide) (by decide) block0740_domain node0273_0337_domain

def node0337_0401 : ℕ → Option IntervalDyadic := split 369 block0743 block0744

theorem node0337_0401_domain : ExactDomain node0337_0401 337 401 := by
  exact split_domain (by decide) (by decide) block0743_domain block0744_domain

def node0401_0452 : ℕ → Option IntervalDyadic := split 433 block0745 block0746

theorem node0401_0452_domain : ExactDomain node0401_0452 401 452 := by
  exact split_domain (by decide) (by decide) block0745_domain block0746_domain

def node0337_0452 : ℕ → Option IntervalDyadic := split 401 node0337_0401 node0401_0452

theorem node0337_0452_domain : ExactDomain node0337_0452 337 452 := by
  exact split_domain (by decide) (by decide) node0337_0401_domain node0401_0452_domain

def node0241_0452 : ℕ → Option IntervalDyadic := split 337 node0241_0337 node0337_0452

theorem node0241_0452_domain : ExactDomain node0241_0452 241 452 := by
  exact split_domain (by decide) (by decide) node0241_0337_domain node0337_0452_domain

def node0049_0452 : ℕ → Option IntervalDyadic := split 241 node0049_0241 node0241_0452

theorem node0049_0452_domain : ExactDomain node0049_0452 49 452 := by
  exact split_domain (by decide) (by decide) node0049_0241_domain node0241_0452_domain

def lookup : ℕ → Option IntervalDyadic := node0049_0452

theorem lookup_domain : ExactDomain lookup 49 452 :=
  node0049_0452_domain

theorem block0734_lookup (i : Fin 32) :
    lookup (49 + i.val) = some (values0734[i.val]'(by rw [values0734_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (49 + i.val) = _
  rw [node0049_0452, split_left 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0049_0241, split_left 145 node0049_0145 node0145_0241 (by omega)]
  rw [node0049_0145, split_left 81 block0734 node0081_0145 (by omega)]
  exact block0734_get i

theorem block0735_lookup (i : Fin 32) :
    lookup (81 + i.val) = some (values0735[i.val]'(by rw [values0735_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (81 + i.val) = _
  rw [node0049_0452, split_left 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0049_0241, split_left 145 node0049_0145 node0145_0241 (by omega)]
  rw [node0049_0145, split_right 81 block0734 node0081_0145 (by omega)]
  rw [node0081_0145, split_left 113 block0735 block0736 (by omega)]
  exact block0735_get i

theorem block0736_lookup (i : Fin 32) :
    lookup (113 + i.val) = some (values0736[i.val]'(by rw [values0736_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (113 + i.val) = _
  rw [node0049_0452, split_left 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0049_0241, split_left 145 node0049_0145 node0145_0241 (by omega)]
  rw [node0049_0145, split_right 81 block0734 node0081_0145 (by omega)]
  rw [node0081_0145, split_right 113 block0735 block0736 (by omega)]
  exact block0736_get i

theorem block0737_lookup (i : Fin 32) :
    lookup (145 + i.val) = some (values0737[i.val]'(by rw [values0737_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (145 + i.val) = _
  rw [node0049_0452, split_left 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0049_0241, split_right 145 node0049_0145 node0145_0241 (by omega)]
  rw [node0145_0241, split_left 177 block0737 node0177_0241 (by omega)]
  exact block0737_get i

theorem block0738_lookup (i : Fin 32) :
    lookup (177 + i.val) = some (values0738[i.val]'(by rw [values0738_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (177 + i.val) = _
  rw [node0049_0452, split_left 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0049_0241, split_right 145 node0049_0145 node0145_0241 (by omega)]
  rw [node0145_0241, split_right 177 block0737 node0177_0241 (by omega)]
  rw [node0177_0241, split_left 209 block0738 block0739 (by omega)]
  exact block0738_get i

theorem block0739_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values0739[i.val]'(by rw [values0739_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (209 + i.val) = _
  rw [node0049_0452, split_left 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0049_0241, split_right 145 node0049_0145 node0145_0241 (by omega)]
  rw [node0145_0241, split_right 177 block0737 node0177_0241 (by omega)]
  rw [node0177_0241, split_right 209 block0738 block0739 (by omega)]
  exact block0739_get i

theorem block0740_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values0740[i.val]'(by rw [values0740_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (241 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_left 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0241_0337, split_left 273 block0740 node0273_0337 (by omega)]
  exact block0740_get i

theorem block0741_lookup (i : Fin 32) :
    lookup (273 + i.val) = some (values0741[i.val]'(by rw [values0741_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (273 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_left 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0241_0337, split_right 273 block0740 node0273_0337 (by omega)]
  rw [node0273_0337, split_left 305 block0741 block0742 (by omega)]
  exact block0741_get i

theorem block0742_lookup (i : Fin 32) :
    lookup (305 + i.val) = some (values0742[i.val]'(by rw [values0742_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (305 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_left 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0241_0337, split_right 273 block0740 node0273_0337 (by omega)]
  rw [node0273_0337, split_right 305 block0741 block0742 (by omega)]
  exact block0742_get i

theorem block0743_lookup (i : Fin 32) :
    lookup (337 + i.val) = some (values0743[i.val]'(by rw [values0743_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (337 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_right 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0337_0452, split_left 401 node0337_0401 node0401_0452 (by omega)]
  rw [node0337_0401, split_left 369 block0743 block0744 (by omega)]
  exact block0743_get i

theorem block0744_lookup (i : Fin 32) :
    lookup (369 + i.val) = some (values0744[i.val]'(by rw [values0744_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (369 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_right 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0337_0452, split_left 401 node0337_0401 node0401_0452 (by omega)]
  rw [node0337_0401, split_right 369 block0743 block0744 (by omega)]
  exact block0744_get i

theorem block0745_lookup (i : Fin 32) :
    lookup (401 + i.val) = some (values0745[i.val]'(by rw [values0745_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (401 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_right 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0337_0452, split_right 401 node0337_0401 node0401_0452 (by omega)]
  rw [node0401_0452, split_left 433 block0745 block0746 (by omega)]
  exact block0745_get i

theorem block0746_lookup (i : Fin 19) :
    lookup (433 + i.val) = some (values0746[i.val]'(by rw [values0746_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0049_0452 (433 + i.val) = _
  rw [node0049_0452, split_right 241 node0049_0241 node0241_0452 (by omega)]
  rw [node0241_0452, split_right 337 node0241_0337 node0337_0452 (by omega)]
  rw [node0337_0452, split_right 401 node0337_0401 node0401_0452 (by omega)]
  rw [node0401_0452, split_right 433 block0745 block0746 (by omega)]
  exact block0746_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0734_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0734_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0735_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0735_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0736_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0736_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0737_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0737_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0738_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0738_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0739_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0739_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0740_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0740_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0741_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0741_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0742_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0742_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0743_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0743_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0744_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0744_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0745_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0745_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0746_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0746_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0734_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0735_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0736_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0737_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0738_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0739_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0740_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0741_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0742_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0743_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0744_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0745_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow050.block0746_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow050
