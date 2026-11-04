import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0656
import Grothe.UpperChaos.OriginalRow227TriangleData0657
import Grothe.UpperChaos.OriginalRow227TriangleData0658
import Grothe.UpperChaos.OriginalRow227TriangleData0659
import Grothe.UpperChaos.OriginalRow227TriangleData0660
import Grothe.UpperChaos.OriginalRow227TriangleData0661
import Grothe.UpperChaos.OriginalRow227TriangleData0662
import Grothe.UpperChaos.OriginalRow227TriangleData0663
import Grothe.UpperChaos.OriginalRow227TriangleData0664
import Grothe.UpperChaos.OriginalRow227TriangleData0665
import Grothe.UpperChaos.OriginalRow227TriangleData0666
import Grothe.UpperChaos.OriginalRow227TriangleData0667
import Grothe.UpperChaos.OriginalRow227TriangleData0668

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow044

open ConditionalTableLookup

def values0656 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0656.coefficient44_43,
  OriginalRow227TriangleData0656.coefficient44_44,
  OriginalRow227TriangleData0656.coefficient44_45,
  OriginalRow227TriangleData0656.coefficient44_46,
  OriginalRow227TriangleData0656.coefficient44_47,
  OriginalRow227TriangleData0656.coefficient44_48,
  OriginalRow227TriangleData0656.coefficient44_49,
  OriginalRow227TriangleData0656.coefficient44_50,
  OriginalRow227TriangleData0656.coefficient44_51,
  OriginalRow227TriangleData0656.coefficient44_52,
  OriginalRow227TriangleData0656.coefficient44_53,
  OriginalRow227TriangleData0656.coefficient44_54,
  OriginalRow227TriangleData0656.coefficient44_55,
  OriginalRow227TriangleData0656.coefficient44_56,
  OriginalRow227TriangleData0656.coefficient44_57,
  OriginalRow227TriangleData0656.coefficient44_58,
  OriginalRow227TriangleData0656.coefficient44_59,
  OriginalRow227TriangleData0656.coefficient44_60,
  OriginalRow227TriangleData0656.coefficient44_61,
  OriginalRow227TriangleData0656.coefficient44_62,
  OriginalRow227TriangleData0656.coefficient44_63,
  OriginalRow227TriangleData0656.coefficient44_64,
  OriginalRow227TriangleData0656.coefficient44_65,
  OriginalRow227TriangleData0656.coefficient44_66,
  OriginalRow227TriangleData0656.coefficient44_67,
  OriginalRow227TriangleData0656.coefficient44_68,
  OriginalRow227TriangleData0656.coefficient44_69,
  OriginalRow227TriangleData0656.coefficient44_70,
  OriginalRow227TriangleData0656.coefficient44_71,
  OriginalRow227TriangleData0656.coefficient44_72,
  OriginalRow227TriangleData0656.coefficient44_73,
  OriginalRow227TriangleData0656.coefficient44_74
]

theorem values0656_size : values0656.size = 32 := rfl

def block0656 : ℕ → Option IntervalDyadic := segment 43 values0656

theorem block0656_domain : ExactDomain block0656 43 75 := by
  simpa only [values0656_size] using segment_domain 43 values0656

theorem block0656_get (i : Fin 32) :
    block0656 (43 + i.val) = some (values0656[i.val]'(by rw [values0656_size]; exact i.isLt)) := by
  exact segment_get 43 values0656 ⟨i.val, by rw [values0656_size]; exact i.isLt⟩

def values0657 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0657.coefficient44_75,
  OriginalRow227TriangleData0657.coefficient44_76,
  OriginalRow227TriangleData0657.coefficient44_77,
  OriginalRow227TriangleData0657.coefficient44_78,
  OriginalRow227TriangleData0657.coefficient44_79,
  OriginalRow227TriangleData0657.coefficient44_80,
  OriginalRow227TriangleData0657.coefficient44_81,
  OriginalRow227TriangleData0657.coefficient44_82,
  OriginalRow227TriangleData0657.coefficient44_83,
  OriginalRow227TriangleData0657.coefficient44_84,
  OriginalRow227TriangleData0657.coefficient44_85,
  OriginalRow227TriangleData0657.coefficient44_86,
  OriginalRow227TriangleData0657.coefficient44_87,
  OriginalRow227TriangleData0657.coefficient44_88,
  OriginalRow227TriangleData0657.coefficient44_89,
  OriginalRow227TriangleData0657.coefficient44_90,
  OriginalRow227TriangleData0657.coefficient44_91,
  OriginalRow227TriangleData0657.coefficient44_92,
  OriginalRow227TriangleData0657.coefficient44_93,
  OriginalRow227TriangleData0657.coefficient44_94,
  OriginalRow227TriangleData0657.coefficient44_95,
  OriginalRow227TriangleData0657.coefficient44_96,
  OriginalRow227TriangleData0657.coefficient44_97,
  OriginalRow227TriangleData0657.coefficient44_98,
  OriginalRow227TriangleData0657.coefficient44_99,
  OriginalRow227TriangleData0657.coefficient44_100,
  OriginalRow227TriangleData0657.coefficient44_101,
  OriginalRow227TriangleData0657.coefficient44_102,
  OriginalRow227TriangleData0657.coefficient44_103,
  OriginalRow227TriangleData0657.coefficient44_104,
  OriginalRow227TriangleData0657.coefficient44_105,
  OriginalRow227TriangleData0657.coefficient44_106
]

theorem values0657_size : values0657.size = 32 := rfl

def block0657 : ℕ → Option IntervalDyadic := segment 75 values0657

theorem block0657_domain : ExactDomain block0657 75 107 := by
  simpa only [values0657_size] using segment_domain 75 values0657

theorem block0657_get (i : Fin 32) :
    block0657 (75 + i.val) = some (values0657[i.val]'(by rw [values0657_size]; exact i.isLt)) := by
  exact segment_get 75 values0657 ⟨i.val, by rw [values0657_size]; exact i.isLt⟩

def values0658 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0658.coefficient44_107,
  OriginalRow227TriangleData0658.coefficient44_108,
  OriginalRow227TriangleData0658.coefficient44_109,
  OriginalRow227TriangleData0658.coefficient44_110,
  OriginalRow227TriangleData0658.coefficient44_111,
  OriginalRow227TriangleData0658.coefficient44_112,
  OriginalRow227TriangleData0658.coefficient44_113,
  OriginalRow227TriangleData0658.coefficient44_114,
  OriginalRow227TriangleData0658.coefficient44_115,
  OriginalRow227TriangleData0658.coefficient44_116,
  OriginalRow227TriangleData0658.coefficient44_117,
  OriginalRow227TriangleData0658.coefficient44_118,
  OriginalRow227TriangleData0658.coefficient44_119,
  OriginalRow227TriangleData0658.coefficient44_120,
  OriginalRow227TriangleData0658.coefficient44_121,
  OriginalRow227TriangleData0658.coefficient44_122,
  OriginalRow227TriangleData0658.coefficient44_123,
  OriginalRow227TriangleData0658.coefficient44_124,
  OriginalRow227TriangleData0658.coefficient44_125,
  OriginalRow227TriangleData0658.coefficient44_126,
  OriginalRow227TriangleData0658.coefficient44_127,
  OriginalRow227TriangleData0658.coefficient44_128,
  OriginalRow227TriangleData0658.coefficient44_129,
  OriginalRow227TriangleData0658.coefficient44_130,
  OriginalRow227TriangleData0658.coefficient44_131,
  OriginalRow227TriangleData0658.coefficient44_132,
  OriginalRow227TriangleData0658.coefficient44_133,
  OriginalRow227TriangleData0658.coefficient44_134,
  OriginalRow227TriangleData0658.coefficient44_135,
  OriginalRow227TriangleData0658.coefficient44_136,
  OriginalRow227TriangleData0658.coefficient44_137,
  OriginalRow227TriangleData0658.coefficient44_138
]

theorem values0658_size : values0658.size = 32 := rfl

def block0658 : ℕ → Option IntervalDyadic := segment 107 values0658

theorem block0658_domain : ExactDomain block0658 107 139 := by
  simpa only [values0658_size] using segment_domain 107 values0658

theorem block0658_get (i : Fin 32) :
    block0658 (107 + i.val) = some (values0658[i.val]'(by rw [values0658_size]; exact i.isLt)) := by
  exact segment_get 107 values0658 ⟨i.val, by rw [values0658_size]; exact i.isLt⟩

def values0659 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0659.coefficient44_139,
  OriginalRow227TriangleData0659.coefficient44_140,
  OriginalRow227TriangleData0659.coefficient44_141,
  OriginalRow227TriangleData0659.coefficient44_142,
  OriginalRow227TriangleData0659.coefficient44_143,
  OriginalRow227TriangleData0659.coefficient44_144,
  OriginalRow227TriangleData0659.coefficient44_145,
  OriginalRow227TriangleData0659.coefficient44_146,
  OriginalRow227TriangleData0659.coefficient44_147,
  OriginalRow227TriangleData0659.coefficient44_148,
  OriginalRow227TriangleData0659.coefficient44_149,
  OriginalRow227TriangleData0659.coefficient44_150,
  OriginalRow227TriangleData0659.coefficient44_151,
  OriginalRow227TriangleData0659.coefficient44_152,
  OriginalRow227TriangleData0659.coefficient44_153,
  OriginalRow227TriangleData0659.coefficient44_154,
  OriginalRow227TriangleData0659.coefficient44_155,
  OriginalRow227TriangleData0659.coefficient44_156,
  OriginalRow227TriangleData0659.coefficient44_157,
  OriginalRow227TriangleData0659.coefficient44_158,
  OriginalRow227TriangleData0659.coefficient44_159,
  OriginalRow227TriangleData0659.coefficient44_160,
  OriginalRow227TriangleData0659.coefficient44_161,
  OriginalRow227TriangleData0659.coefficient44_162,
  OriginalRow227TriangleData0659.coefficient44_163,
  OriginalRow227TriangleData0659.coefficient44_164,
  OriginalRow227TriangleData0659.coefficient44_165,
  OriginalRow227TriangleData0659.coefficient44_166,
  OriginalRow227TriangleData0659.coefficient44_167,
  OriginalRow227TriangleData0659.coefficient44_168,
  OriginalRow227TriangleData0659.coefficient44_169,
  OriginalRow227TriangleData0659.coefficient44_170
]

theorem values0659_size : values0659.size = 32 := rfl

def block0659 : ℕ → Option IntervalDyadic := segment 139 values0659

theorem block0659_domain : ExactDomain block0659 139 171 := by
  simpa only [values0659_size] using segment_domain 139 values0659

theorem block0659_get (i : Fin 32) :
    block0659 (139 + i.val) = some (values0659[i.val]'(by rw [values0659_size]; exact i.isLt)) := by
  exact segment_get 139 values0659 ⟨i.val, by rw [values0659_size]; exact i.isLt⟩

def values0660 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0660.coefficient44_171,
  OriginalRow227TriangleData0660.coefficient44_172,
  OriginalRow227TriangleData0660.coefficient44_173,
  OriginalRow227TriangleData0660.coefficient44_174,
  OriginalRow227TriangleData0660.coefficient44_175,
  OriginalRow227TriangleData0660.coefficient44_176,
  OriginalRow227TriangleData0660.coefficient44_177,
  OriginalRow227TriangleData0660.coefficient44_178,
  OriginalRow227TriangleData0660.coefficient44_179,
  OriginalRow227TriangleData0660.coefficient44_180,
  OriginalRow227TriangleData0660.coefficient44_181,
  OriginalRow227TriangleData0660.coefficient44_182,
  OriginalRow227TriangleData0660.coefficient44_183,
  OriginalRow227TriangleData0660.coefficient44_184,
  OriginalRow227TriangleData0660.coefficient44_185,
  OriginalRow227TriangleData0660.coefficient44_186,
  OriginalRow227TriangleData0660.coefficient44_187,
  OriginalRow227TriangleData0660.coefficient44_188,
  OriginalRow227TriangleData0660.coefficient44_189,
  OriginalRow227TriangleData0660.coefficient44_190,
  OriginalRow227TriangleData0660.coefficient44_191,
  OriginalRow227TriangleData0660.coefficient44_192,
  OriginalRow227TriangleData0660.coefficient44_193,
  OriginalRow227TriangleData0660.coefficient44_194,
  OriginalRow227TriangleData0660.coefficient44_195,
  OriginalRow227TriangleData0660.coefficient44_196,
  OriginalRow227TriangleData0660.coefficient44_197,
  OriginalRow227TriangleData0660.coefficient44_198,
  OriginalRow227TriangleData0660.coefficient44_199,
  OriginalRow227TriangleData0660.coefficient44_200,
  OriginalRow227TriangleData0660.coefficient44_201,
  OriginalRow227TriangleData0660.coefficient44_202
]

theorem values0660_size : values0660.size = 32 := rfl

def block0660 : ℕ → Option IntervalDyadic := segment 171 values0660

theorem block0660_domain : ExactDomain block0660 171 203 := by
  simpa only [values0660_size] using segment_domain 171 values0660

theorem block0660_get (i : Fin 32) :
    block0660 (171 + i.val) = some (values0660[i.val]'(by rw [values0660_size]; exact i.isLt)) := by
  exact segment_get 171 values0660 ⟨i.val, by rw [values0660_size]; exact i.isLt⟩

def values0661 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0661.coefficient44_203,
  OriginalRow227TriangleData0661.coefficient44_204,
  OriginalRow227TriangleData0661.coefficient44_205,
  OriginalRow227TriangleData0661.coefficient44_206,
  OriginalRow227TriangleData0661.coefficient44_207,
  OriginalRow227TriangleData0661.coefficient44_208,
  OriginalRow227TriangleData0661.coefficient44_209,
  OriginalRow227TriangleData0661.coefficient44_210,
  OriginalRow227TriangleData0661.coefficient44_211,
  OriginalRow227TriangleData0661.coefficient44_212,
  OriginalRow227TriangleData0661.coefficient44_213,
  OriginalRow227TriangleData0661.coefficient44_214,
  OriginalRow227TriangleData0661.coefficient44_215,
  OriginalRow227TriangleData0661.coefficient44_216,
  OriginalRow227TriangleData0661.coefficient44_217,
  OriginalRow227TriangleData0661.coefficient44_218,
  OriginalRow227TriangleData0661.coefficient44_219,
  OriginalRow227TriangleData0661.coefficient44_220,
  OriginalRow227TriangleData0661.coefficient44_221,
  OriginalRow227TriangleData0661.coefficient44_222,
  OriginalRow227TriangleData0661.coefficient44_223,
  OriginalRow227TriangleData0661.coefficient44_224,
  OriginalRow227TriangleData0661.coefficient44_225,
  OriginalRow227TriangleData0661.coefficient44_226,
  OriginalRow227TriangleData0661.coefficient44_227,
  OriginalRow227TriangleData0661.coefficient44_228,
  OriginalRow227TriangleData0661.coefficient44_229,
  OriginalRow227TriangleData0661.coefficient44_230,
  OriginalRow227TriangleData0661.coefficient44_231,
  OriginalRow227TriangleData0661.coefficient44_232,
  OriginalRow227TriangleData0661.coefficient44_233,
  OriginalRow227TriangleData0661.coefficient44_234
]

theorem values0661_size : values0661.size = 32 := rfl

def block0661 : ℕ → Option IntervalDyadic := segment 203 values0661

theorem block0661_domain : ExactDomain block0661 203 235 := by
  simpa only [values0661_size] using segment_domain 203 values0661

theorem block0661_get (i : Fin 32) :
    block0661 (203 + i.val) = some (values0661[i.val]'(by rw [values0661_size]; exact i.isLt)) := by
  exact segment_get 203 values0661 ⟨i.val, by rw [values0661_size]; exact i.isLt⟩

def values0662 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0662.coefficient44_235,
  OriginalRow227TriangleData0662.coefficient44_236,
  OriginalRow227TriangleData0662.coefficient44_237,
  OriginalRow227TriangleData0662.coefficient44_238,
  OriginalRow227TriangleData0662.coefficient44_239,
  OriginalRow227TriangleData0662.coefficient44_240,
  OriginalRow227TriangleData0662.coefficient44_241,
  OriginalRow227TriangleData0662.coefficient44_242,
  OriginalRow227TriangleData0662.coefficient44_243,
  OriginalRow227TriangleData0662.coefficient44_244,
  OriginalRow227TriangleData0662.coefficient44_245,
  OriginalRow227TriangleData0662.coefficient44_246,
  OriginalRow227TriangleData0662.coefficient44_247,
  OriginalRow227TriangleData0662.coefficient44_248,
  OriginalRow227TriangleData0662.coefficient44_249,
  OriginalRow227TriangleData0662.coefficient44_250,
  OriginalRow227TriangleData0662.coefficient44_251,
  OriginalRow227TriangleData0662.coefficient44_252,
  OriginalRow227TriangleData0662.coefficient44_253,
  OriginalRow227TriangleData0662.coefficient44_254,
  OriginalRow227TriangleData0662.coefficient44_255,
  OriginalRow227TriangleData0662.coefficient44_256,
  OriginalRow227TriangleData0662.coefficient44_257,
  OriginalRow227TriangleData0662.coefficient44_258,
  OriginalRow227TriangleData0662.coefficient44_259,
  OriginalRow227TriangleData0662.coefficient44_260,
  OriginalRow227TriangleData0662.coefficient44_261,
  OriginalRow227TriangleData0662.coefficient44_262,
  OriginalRow227TriangleData0662.coefficient44_263,
  OriginalRow227TriangleData0662.coefficient44_264,
  OriginalRow227TriangleData0662.coefficient44_265,
  OriginalRow227TriangleData0662.coefficient44_266
]

theorem values0662_size : values0662.size = 32 := rfl

def block0662 : ℕ → Option IntervalDyadic := segment 235 values0662

theorem block0662_domain : ExactDomain block0662 235 267 := by
  simpa only [values0662_size] using segment_domain 235 values0662

theorem block0662_get (i : Fin 32) :
    block0662 (235 + i.val) = some (values0662[i.val]'(by rw [values0662_size]; exact i.isLt)) := by
  exact segment_get 235 values0662 ⟨i.val, by rw [values0662_size]; exact i.isLt⟩

def values0663 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0663.coefficient44_267,
  OriginalRow227TriangleData0663.coefficient44_268,
  OriginalRow227TriangleData0663.coefficient44_269,
  OriginalRow227TriangleData0663.coefficient44_270,
  OriginalRow227TriangleData0663.coefficient44_271,
  OriginalRow227TriangleData0663.coefficient44_272,
  OriginalRow227TriangleData0663.coefficient44_273,
  OriginalRow227TriangleData0663.coefficient44_274,
  OriginalRow227TriangleData0663.coefficient44_275,
  OriginalRow227TriangleData0663.coefficient44_276,
  OriginalRow227TriangleData0663.coefficient44_277,
  OriginalRow227TriangleData0663.coefficient44_278,
  OriginalRow227TriangleData0663.coefficient44_279,
  OriginalRow227TriangleData0663.coefficient44_280,
  OriginalRow227TriangleData0663.coefficient44_281,
  OriginalRow227TriangleData0663.coefficient44_282,
  OriginalRow227TriangleData0663.coefficient44_283,
  OriginalRow227TriangleData0663.coefficient44_284,
  OriginalRow227TriangleData0663.coefficient44_285,
  OriginalRow227TriangleData0663.coefficient44_286,
  OriginalRow227TriangleData0663.coefficient44_287,
  OriginalRow227TriangleData0663.coefficient44_288,
  OriginalRow227TriangleData0663.coefficient44_289,
  OriginalRow227TriangleData0663.coefficient44_290,
  OriginalRow227TriangleData0663.coefficient44_291,
  OriginalRow227TriangleData0663.coefficient44_292,
  OriginalRow227TriangleData0663.coefficient44_293,
  OriginalRow227TriangleData0663.coefficient44_294,
  OriginalRow227TriangleData0663.coefficient44_295,
  OriginalRow227TriangleData0663.coefficient44_296,
  OriginalRow227TriangleData0663.coefficient44_297,
  OriginalRow227TriangleData0663.coefficient44_298
]

theorem values0663_size : values0663.size = 32 := rfl

def block0663 : ℕ → Option IntervalDyadic := segment 267 values0663

theorem block0663_domain : ExactDomain block0663 267 299 := by
  simpa only [values0663_size] using segment_domain 267 values0663

theorem block0663_get (i : Fin 32) :
    block0663 (267 + i.val) = some (values0663[i.val]'(by rw [values0663_size]; exact i.isLt)) := by
  exact segment_get 267 values0663 ⟨i.val, by rw [values0663_size]; exact i.isLt⟩

def values0664 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0664.coefficient44_299,
  OriginalRow227TriangleData0664.coefficient44_300,
  OriginalRow227TriangleData0664.coefficient44_301,
  OriginalRow227TriangleData0664.coefficient44_302,
  OriginalRow227TriangleData0664.coefficient44_303,
  OriginalRow227TriangleData0664.coefficient44_304,
  OriginalRow227TriangleData0664.coefficient44_305,
  OriginalRow227TriangleData0664.coefficient44_306,
  OriginalRow227TriangleData0664.coefficient44_307,
  OriginalRow227TriangleData0664.coefficient44_308,
  OriginalRow227TriangleData0664.coefficient44_309,
  OriginalRow227TriangleData0664.coefficient44_310,
  OriginalRow227TriangleData0664.coefficient44_311,
  OriginalRow227TriangleData0664.coefficient44_312,
  OriginalRow227TriangleData0664.coefficient44_313,
  OriginalRow227TriangleData0664.coefficient44_314,
  OriginalRow227TriangleData0664.coefficient44_315,
  OriginalRow227TriangleData0664.coefficient44_316,
  OriginalRow227TriangleData0664.coefficient44_317,
  OriginalRow227TriangleData0664.coefficient44_318,
  OriginalRow227TriangleData0664.coefficient44_319,
  OriginalRow227TriangleData0664.coefficient44_320,
  OriginalRow227TriangleData0664.coefficient44_321,
  OriginalRow227TriangleData0664.coefficient44_322,
  OriginalRow227TriangleData0664.coefficient44_323,
  OriginalRow227TriangleData0664.coefficient44_324,
  OriginalRow227TriangleData0664.coefficient44_325,
  OriginalRow227TriangleData0664.coefficient44_326,
  OriginalRow227TriangleData0664.coefficient44_327,
  OriginalRow227TriangleData0664.coefficient44_328,
  OriginalRow227TriangleData0664.coefficient44_329,
  OriginalRow227TriangleData0664.coefficient44_330
]

theorem values0664_size : values0664.size = 32 := rfl

def block0664 : ℕ → Option IntervalDyadic := segment 299 values0664

theorem block0664_domain : ExactDomain block0664 299 331 := by
  simpa only [values0664_size] using segment_domain 299 values0664

theorem block0664_get (i : Fin 32) :
    block0664 (299 + i.val) = some (values0664[i.val]'(by rw [values0664_size]; exact i.isLt)) := by
  exact segment_get 299 values0664 ⟨i.val, by rw [values0664_size]; exact i.isLt⟩

def values0665 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0665.coefficient44_331,
  OriginalRow227TriangleData0665.coefficient44_332,
  OriginalRow227TriangleData0665.coefficient44_333,
  OriginalRow227TriangleData0665.coefficient44_334,
  OriginalRow227TriangleData0665.coefficient44_335,
  OriginalRow227TriangleData0665.coefficient44_336,
  OriginalRow227TriangleData0665.coefficient44_337,
  OriginalRow227TriangleData0665.coefficient44_338,
  OriginalRow227TriangleData0665.coefficient44_339,
  OriginalRow227TriangleData0665.coefficient44_340,
  OriginalRow227TriangleData0665.coefficient44_341,
  OriginalRow227TriangleData0665.coefficient44_342,
  OriginalRow227TriangleData0665.coefficient44_343,
  OriginalRow227TriangleData0665.coefficient44_344,
  OriginalRow227TriangleData0665.coefficient44_345,
  OriginalRow227TriangleData0665.coefficient44_346,
  OriginalRow227TriangleData0665.coefficient44_347,
  OriginalRow227TriangleData0665.coefficient44_348,
  OriginalRow227TriangleData0665.coefficient44_349,
  OriginalRow227TriangleData0665.coefficient44_350,
  OriginalRow227TriangleData0665.coefficient44_351,
  OriginalRow227TriangleData0665.coefficient44_352,
  OriginalRow227TriangleData0665.coefficient44_353,
  OriginalRow227TriangleData0665.coefficient44_354,
  OriginalRow227TriangleData0665.coefficient44_355,
  OriginalRow227TriangleData0665.coefficient44_356,
  OriginalRow227TriangleData0665.coefficient44_357,
  OriginalRow227TriangleData0665.coefficient44_358,
  OriginalRow227TriangleData0665.coefficient44_359,
  OriginalRow227TriangleData0665.coefficient44_360,
  OriginalRow227TriangleData0665.coefficient44_361,
  OriginalRow227TriangleData0665.coefficient44_362
]

theorem values0665_size : values0665.size = 32 := rfl

def block0665 : ℕ → Option IntervalDyadic := segment 331 values0665

theorem block0665_domain : ExactDomain block0665 331 363 := by
  simpa only [values0665_size] using segment_domain 331 values0665

theorem block0665_get (i : Fin 32) :
    block0665 (331 + i.val) = some (values0665[i.val]'(by rw [values0665_size]; exact i.isLt)) := by
  exact segment_get 331 values0665 ⟨i.val, by rw [values0665_size]; exact i.isLt⟩

def values0666 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0666.coefficient44_363,
  OriginalRow227TriangleData0666.coefficient44_364,
  OriginalRow227TriangleData0666.coefficient44_365,
  OriginalRow227TriangleData0666.coefficient44_366,
  OriginalRow227TriangleData0666.coefficient44_367,
  OriginalRow227TriangleData0666.coefficient44_368,
  OriginalRow227TriangleData0666.coefficient44_369,
  OriginalRow227TriangleData0666.coefficient44_370,
  OriginalRow227TriangleData0666.coefficient44_371,
  OriginalRow227TriangleData0666.coefficient44_372,
  OriginalRow227TriangleData0666.coefficient44_373,
  OriginalRow227TriangleData0666.coefficient44_374,
  OriginalRow227TriangleData0666.coefficient44_375,
  OriginalRow227TriangleData0666.coefficient44_376,
  OriginalRow227TriangleData0666.coefficient44_377,
  OriginalRow227TriangleData0666.coefficient44_378,
  OriginalRow227TriangleData0666.coefficient44_379,
  OriginalRow227TriangleData0666.coefficient44_380,
  OriginalRow227TriangleData0666.coefficient44_381,
  OriginalRow227TriangleData0666.coefficient44_382,
  OriginalRow227TriangleData0666.coefficient44_383,
  OriginalRow227TriangleData0666.coefficient44_384,
  OriginalRow227TriangleData0666.coefficient44_385,
  OriginalRow227TriangleData0666.coefficient44_386,
  OriginalRow227TriangleData0666.coefficient44_387,
  OriginalRow227TriangleData0666.coefficient44_388,
  OriginalRow227TriangleData0666.coefficient44_389,
  OriginalRow227TriangleData0666.coefficient44_390,
  OriginalRow227TriangleData0666.coefficient44_391,
  OriginalRow227TriangleData0666.coefficient44_392,
  OriginalRow227TriangleData0666.coefficient44_393,
  OriginalRow227TriangleData0666.coefficient44_394
]

theorem values0666_size : values0666.size = 32 := rfl

def block0666 : ℕ → Option IntervalDyadic := segment 363 values0666

theorem block0666_domain : ExactDomain block0666 363 395 := by
  simpa only [values0666_size] using segment_domain 363 values0666

theorem block0666_get (i : Fin 32) :
    block0666 (363 + i.val) = some (values0666[i.val]'(by rw [values0666_size]; exact i.isLt)) := by
  exact segment_get 363 values0666 ⟨i.val, by rw [values0666_size]; exact i.isLt⟩

def values0667 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0667.coefficient44_395,
  OriginalRow227TriangleData0667.coefficient44_396,
  OriginalRow227TriangleData0667.coefficient44_397,
  OriginalRow227TriangleData0667.coefficient44_398,
  OriginalRow227TriangleData0667.coefficient44_399,
  OriginalRow227TriangleData0667.coefficient44_400,
  OriginalRow227TriangleData0667.coefficient44_401,
  OriginalRow227TriangleData0667.coefficient44_402,
  OriginalRow227TriangleData0667.coefficient44_403,
  OriginalRow227TriangleData0667.coefficient44_404,
  OriginalRow227TriangleData0667.coefficient44_405,
  OriginalRow227TriangleData0667.coefficient44_406,
  OriginalRow227TriangleData0667.coefficient44_407,
  OriginalRow227TriangleData0667.coefficient44_408,
  OriginalRow227TriangleData0667.coefficient44_409,
  OriginalRow227TriangleData0667.coefficient44_410,
  OriginalRow227TriangleData0667.coefficient44_411,
  OriginalRow227TriangleData0667.coefficient44_412,
  OriginalRow227TriangleData0667.coefficient44_413,
  OriginalRow227TriangleData0667.coefficient44_414,
  OriginalRow227TriangleData0667.coefficient44_415,
  OriginalRow227TriangleData0667.coefficient44_416,
  OriginalRow227TriangleData0667.coefficient44_417,
  OriginalRow227TriangleData0667.coefficient44_418,
  OriginalRow227TriangleData0667.coefficient44_419,
  OriginalRow227TriangleData0667.coefficient44_420,
  OriginalRow227TriangleData0667.coefficient44_421,
  OriginalRow227TriangleData0667.coefficient44_422,
  OriginalRow227TriangleData0667.coefficient44_423,
  OriginalRow227TriangleData0667.coefficient44_424,
  OriginalRow227TriangleData0667.coefficient44_425,
  OriginalRow227TriangleData0667.coefficient44_426
]

theorem values0667_size : values0667.size = 32 := rfl

def block0667 : ℕ → Option IntervalDyadic := segment 395 values0667

theorem block0667_domain : ExactDomain block0667 395 427 := by
  simpa only [values0667_size] using segment_domain 395 values0667

theorem block0667_get (i : Fin 32) :
    block0667 (395 + i.val) = some (values0667[i.val]'(by rw [values0667_size]; exact i.isLt)) := by
  exact segment_get 395 values0667 ⟨i.val, by rw [values0667_size]; exact i.isLt⟩

def values0668 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0668.coefficient44_427,
  OriginalRow227TriangleData0668.coefficient44_428,
  OriginalRow227TriangleData0668.coefficient44_429,
  OriginalRow227TriangleData0668.coefficient44_430,
  OriginalRow227TriangleData0668.coefficient44_431,
  OriginalRow227TriangleData0668.coefficient44_432,
  OriginalRow227TriangleData0668.coefficient44_433,
  OriginalRow227TriangleData0668.coefficient44_434,
  OriginalRow227TriangleData0668.coefficient44_435,
  OriginalRow227TriangleData0668.coefficient44_436,
  OriginalRow227TriangleData0668.coefficient44_437,
  OriginalRow227TriangleData0668.coefficient44_438,
  OriginalRow227TriangleData0668.coefficient44_439,
  OriginalRow227TriangleData0668.coefficient44_440,
  OriginalRow227TriangleData0668.coefficient44_441,
  OriginalRow227TriangleData0668.coefficient44_442,
  OriginalRow227TriangleData0668.coefficient44_443,
  OriginalRow227TriangleData0668.coefficient44_444,
  OriginalRow227TriangleData0668.coefficient44_445,
  OriginalRow227TriangleData0668.coefficient44_446,
  OriginalRow227TriangleData0668.coefficient44_447,
  OriginalRow227TriangleData0668.coefficient44_448,
  OriginalRow227TriangleData0668.coefficient44_449,
  OriginalRow227TriangleData0668.coefficient44_450,
  OriginalRow227TriangleData0668.coefficient44_451,
  OriginalRow227TriangleData0668.coefficient44_452,
  OriginalRow227TriangleData0668.coefficient44_453,
  OriginalRow227TriangleData0668.coefficient44_454,
  OriginalRow227TriangleData0668.coefficient44_455,
  OriginalRow227TriangleData0668.coefficient44_456,
  OriginalRow227TriangleData0668.coefficient44_457
]

theorem values0668_size : values0668.size = 31 := rfl

def block0668 : ℕ → Option IntervalDyadic := segment 427 values0668

theorem block0668_domain : ExactDomain block0668 427 458 := by
  simpa only [values0668_size] using segment_domain 427 values0668

theorem block0668_get (i : Fin 31) :
    block0668 (427 + i.val) = some (values0668[i.val]'(by rw [values0668_size]; exact i.isLt)) := by
  exact segment_get 427 values0668 ⟨i.val, by rw [values0668_size]; exact i.isLt⟩

def node0075_0139 : ℕ → Option IntervalDyadic := split 107 block0657 block0658

theorem node0075_0139_domain : ExactDomain node0075_0139 75 139 := by
  exact split_domain (by decide) (by decide) block0657_domain block0658_domain

def node0043_0139 : ℕ → Option IntervalDyadic := split 75 block0656 node0075_0139

theorem node0043_0139_domain : ExactDomain node0043_0139 43 139 := by
  exact split_domain (by decide) (by decide) block0656_domain node0075_0139_domain

def node0171_0235 : ℕ → Option IntervalDyadic := split 203 block0660 block0661

theorem node0171_0235_domain : ExactDomain node0171_0235 171 235 := by
  exact split_domain (by decide) (by decide) block0660_domain block0661_domain

def node0139_0235 : ℕ → Option IntervalDyadic := split 171 block0659 node0171_0235

theorem node0139_0235_domain : ExactDomain node0139_0235 139 235 := by
  exact split_domain (by decide) (by decide) block0659_domain node0171_0235_domain

def node0043_0235 : ℕ → Option IntervalDyadic := split 139 node0043_0139 node0139_0235

theorem node0043_0235_domain : ExactDomain node0043_0235 43 235 := by
  exact split_domain (by decide) (by decide) node0043_0139_domain node0139_0235_domain

def node0267_0331 : ℕ → Option IntervalDyadic := split 299 block0663 block0664

theorem node0267_0331_domain : ExactDomain node0267_0331 267 331 := by
  exact split_domain (by decide) (by decide) block0663_domain block0664_domain

def node0235_0331 : ℕ → Option IntervalDyadic := split 267 block0662 node0267_0331

theorem node0235_0331_domain : ExactDomain node0235_0331 235 331 := by
  exact split_domain (by decide) (by decide) block0662_domain node0267_0331_domain

def node0331_0395 : ℕ → Option IntervalDyadic := split 363 block0665 block0666

theorem node0331_0395_domain : ExactDomain node0331_0395 331 395 := by
  exact split_domain (by decide) (by decide) block0665_domain block0666_domain

def node0395_0458 : ℕ → Option IntervalDyadic := split 427 block0667 block0668

theorem node0395_0458_domain : ExactDomain node0395_0458 395 458 := by
  exact split_domain (by decide) (by decide) block0667_domain block0668_domain

def node0331_0458 : ℕ → Option IntervalDyadic := split 395 node0331_0395 node0395_0458

theorem node0331_0458_domain : ExactDomain node0331_0458 331 458 := by
  exact split_domain (by decide) (by decide) node0331_0395_domain node0395_0458_domain

def node0235_0458 : ℕ → Option IntervalDyadic := split 331 node0235_0331 node0331_0458

theorem node0235_0458_domain : ExactDomain node0235_0458 235 458 := by
  exact split_domain (by decide) (by decide) node0235_0331_domain node0331_0458_domain

def node0043_0458 : ℕ → Option IntervalDyadic := split 235 node0043_0235 node0235_0458

theorem node0043_0458_domain : ExactDomain node0043_0458 43 458 := by
  exact split_domain (by decide) (by decide) node0043_0235_domain node0235_0458_domain

def lookup : ℕ → Option IntervalDyadic := node0043_0458

theorem lookup_domain : ExactDomain lookup 43 458 :=
  node0043_0458_domain

theorem block0656_lookup (i : Fin 32) :
    lookup (43 + i.val) = some (values0656[i.val]'(by rw [values0656_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (43 + i.val) = _
  rw [node0043_0458, split_left 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0043_0235, split_left 139 node0043_0139 node0139_0235 (by omega)]
  rw [node0043_0139, split_left 75 block0656 node0075_0139 (by omega)]
  exact block0656_get i

theorem block0657_lookup (i : Fin 32) :
    lookup (75 + i.val) = some (values0657[i.val]'(by rw [values0657_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (75 + i.val) = _
  rw [node0043_0458, split_left 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0043_0235, split_left 139 node0043_0139 node0139_0235 (by omega)]
  rw [node0043_0139, split_right 75 block0656 node0075_0139 (by omega)]
  rw [node0075_0139, split_left 107 block0657 block0658 (by omega)]
  exact block0657_get i

theorem block0658_lookup (i : Fin 32) :
    lookup (107 + i.val) = some (values0658[i.val]'(by rw [values0658_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (107 + i.val) = _
  rw [node0043_0458, split_left 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0043_0235, split_left 139 node0043_0139 node0139_0235 (by omega)]
  rw [node0043_0139, split_right 75 block0656 node0075_0139 (by omega)]
  rw [node0075_0139, split_right 107 block0657 block0658 (by omega)]
  exact block0658_get i

theorem block0659_lookup (i : Fin 32) :
    lookup (139 + i.val) = some (values0659[i.val]'(by rw [values0659_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (139 + i.val) = _
  rw [node0043_0458, split_left 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0043_0235, split_right 139 node0043_0139 node0139_0235 (by omega)]
  rw [node0139_0235, split_left 171 block0659 node0171_0235 (by omega)]
  exact block0659_get i

theorem block0660_lookup (i : Fin 32) :
    lookup (171 + i.val) = some (values0660[i.val]'(by rw [values0660_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (171 + i.val) = _
  rw [node0043_0458, split_left 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0043_0235, split_right 139 node0043_0139 node0139_0235 (by omega)]
  rw [node0139_0235, split_right 171 block0659 node0171_0235 (by omega)]
  rw [node0171_0235, split_left 203 block0660 block0661 (by omega)]
  exact block0660_get i

theorem block0661_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values0661[i.val]'(by rw [values0661_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (203 + i.val) = _
  rw [node0043_0458, split_left 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0043_0235, split_right 139 node0043_0139 node0139_0235 (by omega)]
  rw [node0139_0235, split_right 171 block0659 node0171_0235 (by omega)]
  rw [node0171_0235, split_right 203 block0660 block0661 (by omega)]
  exact block0661_get i

theorem block0662_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values0662[i.val]'(by rw [values0662_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (235 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_left 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0235_0331, split_left 267 block0662 node0267_0331 (by omega)]
  exact block0662_get i

theorem block0663_lookup (i : Fin 32) :
    lookup (267 + i.val) = some (values0663[i.val]'(by rw [values0663_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (267 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_left 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0235_0331, split_right 267 block0662 node0267_0331 (by omega)]
  rw [node0267_0331, split_left 299 block0663 block0664 (by omega)]
  exact block0663_get i

theorem block0664_lookup (i : Fin 32) :
    lookup (299 + i.val) = some (values0664[i.val]'(by rw [values0664_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (299 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_left 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0235_0331, split_right 267 block0662 node0267_0331 (by omega)]
  rw [node0267_0331, split_right 299 block0663 block0664 (by omega)]
  exact block0664_get i

theorem block0665_lookup (i : Fin 32) :
    lookup (331 + i.val) = some (values0665[i.val]'(by rw [values0665_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (331 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_right 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0331_0458, split_left 395 node0331_0395 node0395_0458 (by omega)]
  rw [node0331_0395, split_left 363 block0665 block0666 (by omega)]
  exact block0665_get i

theorem block0666_lookup (i : Fin 32) :
    lookup (363 + i.val) = some (values0666[i.val]'(by rw [values0666_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (363 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_right 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0331_0458, split_left 395 node0331_0395 node0395_0458 (by omega)]
  rw [node0331_0395, split_right 363 block0665 block0666 (by omega)]
  exact block0666_get i

theorem block0667_lookup (i : Fin 32) :
    lookup (395 + i.val) = some (values0667[i.val]'(by rw [values0667_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (395 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_right 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0331_0458, split_right 395 node0331_0395 node0395_0458 (by omega)]
  rw [node0395_0458, split_left 427 block0667 block0668 (by omega)]
  exact block0667_get i

theorem block0668_lookup (i : Fin 31) :
    lookup (427 + i.val) = some (values0668[i.val]'(by rw [values0668_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0043_0458 (427 + i.val) = _
  rw [node0043_0458, split_right 235 node0043_0235 node0235_0458 (by omega)]
  rw [node0235_0458, split_right 331 node0235_0331 node0331_0458 (by omega)]
  rw [node0331_0458, split_right 395 node0331_0395 node0395_0458 (by omega)]
  rw [node0395_0458, split_right 427 block0667 block0668 (by omega)]
  exact block0668_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0656_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0656_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0657_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0657_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0658_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0658_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0659_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0659_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0660_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0660_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0661_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0661_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0662_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0662_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0663_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0663_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0664_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0664_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0665_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0665_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0666_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0666_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0667_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0667_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0668_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0668_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0656_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0657_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0658_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0659_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0660_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0661_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0662_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0663_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0664_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0665_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0666_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0667_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow044.block0668_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow044
