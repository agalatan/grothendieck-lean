import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0695
import Grothe.UpperChaos.OriginalRow227TriangleData0696
import Grothe.UpperChaos.OriginalRow227TriangleData0697
import Grothe.UpperChaos.OriginalRow227TriangleData0698
import Grothe.UpperChaos.OriginalRow227TriangleData0699
import Grothe.UpperChaos.OriginalRow227TriangleData0700
import Grothe.UpperChaos.OriginalRow227TriangleData0701
import Grothe.UpperChaos.OriginalRow227TriangleData0702
import Grothe.UpperChaos.OriginalRow227TriangleData0703
import Grothe.UpperChaos.OriginalRow227TriangleData0704
import Grothe.UpperChaos.OriginalRow227TriangleData0705
import Grothe.UpperChaos.OriginalRow227TriangleData0706
import Grothe.UpperChaos.OriginalRow227TriangleData0707

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow047

open ConditionalTableLookup

def values0695 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0695.coefficient47_46,
  OriginalRow227TriangleData0695.coefficient47_47,
  OriginalRow227TriangleData0695.coefficient47_48,
  OriginalRow227TriangleData0695.coefficient47_49,
  OriginalRow227TriangleData0695.coefficient47_50,
  OriginalRow227TriangleData0695.coefficient47_51,
  OriginalRow227TriangleData0695.coefficient47_52,
  OriginalRow227TriangleData0695.coefficient47_53,
  OriginalRow227TriangleData0695.coefficient47_54,
  OriginalRow227TriangleData0695.coefficient47_55,
  OriginalRow227TriangleData0695.coefficient47_56,
  OriginalRow227TriangleData0695.coefficient47_57,
  OriginalRow227TriangleData0695.coefficient47_58,
  OriginalRow227TriangleData0695.coefficient47_59,
  OriginalRow227TriangleData0695.coefficient47_60,
  OriginalRow227TriangleData0695.coefficient47_61,
  OriginalRow227TriangleData0695.coefficient47_62,
  OriginalRow227TriangleData0695.coefficient47_63,
  OriginalRow227TriangleData0695.coefficient47_64,
  OriginalRow227TriangleData0695.coefficient47_65,
  OriginalRow227TriangleData0695.coefficient47_66,
  OriginalRow227TriangleData0695.coefficient47_67,
  OriginalRow227TriangleData0695.coefficient47_68,
  OriginalRow227TriangleData0695.coefficient47_69,
  OriginalRow227TriangleData0695.coefficient47_70,
  OriginalRow227TriangleData0695.coefficient47_71,
  OriginalRow227TriangleData0695.coefficient47_72,
  OriginalRow227TriangleData0695.coefficient47_73,
  OriginalRow227TriangleData0695.coefficient47_74,
  OriginalRow227TriangleData0695.coefficient47_75,
  OriginalRow227TriangleData0695.coefficient47_76,
  OriginalRow227TriangleData0695.coefficient47_77
]

theorem values0695_size : values0695.size = 32 := rfl

def block0695 : ℕ → Option IntervalDyadic := segment 46 values0695

theorem block0695_domain : ExactDomain block0695 46 78 := by
  simpa only [values0695_size] using segment_domain 46 values0695

theorem block0695_get (i : Fin 32) :
    block0695 (46 + i.val) = some (values0695[i.val]'(by rw [values0695_size]; exact i.isLt)) := by
  exact segment_get 46 values0695 ⟨i.val, by rw [values0695_size]; exact i.isLt⟩

def values0696 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0696.coefficient47_78,
  OriginalRow227TriangleData0696.coefficient47_79,
  OriginalRow227TriangleData0696.coefficient47_80,
  OriginalRow227TriangleData0696.coefficient47_81,
  OriginalRow227TriangleData0696.coefficient47_82,
  OriginalRow227TriangleData0696.coefficient47_83,
  OriginalRow227TriangleData0696.coefficient47_84,
  OriginalRow227TriangleData0696.coefficient47_85,
  OriginalRow227TriangleData0696.coefficient47_86,
  OriginalRow227TriangleData0696.coefficient47_87,
  OriginalRow227TriangleData0696.coefficient47_88,
  OriginalRow227TriangleData0696.coefficient47_89,
  OriginalRow227TriangleData0696.coefficient47_90,
  OriginalRow227TriangleData0696.coefficient47_91,
  OriginalRow227TriangleData0696.coefficient47_92,
  OriginalRow227TriangleData0696.coefficient47_93,
  OriginalRow227TriangleData0696.coefficient47_94,
  OriginalRow227TriangleData0696.coefficient47_95,
  OriginalRow227TriangleData0696.coefficient47_96,
  OriginalRow227TriangleData0696.coefficient47_97,
  OriginalRow227TriangleData0696.coefficient47_98,
  OriginalRow227TriangleData0696.coefficient47_99,
  OriginalRow227TriangleData0696.coefficient47_100,
  OriginalRow227TriangleData0696.coefficient47_101,
  OriginalRow227TriangleData0696.coefficient47_102,
  OriginalRow227TriangleData0696.coefficient47_103,
  OriginalRow227TriangleData0696.coefficient47_104,
  OriginalRow227TriangleData0696.coefficient47_105,
  OriginalRow227TriangleData0696.coefficient47_106,
  OriginalRow227TriangleData0696.coefficient47_107,
  OriginalRow227TriangleData0696.coefficient47_108,
  OriginalRow227TriangleData0696.coefficient47_109
]

theorem values0696_size : values0696.size = 32 := rfl

def block0696 : ℕ → Option IntervalDyadic := segment 78 values0696

theorem block0696_domain : ExactDomain block0696 78 110 := by
  simpa only [values0696_size] using segment_domain 78 values0696

theorem block0696_get (i : Fin 32) :
    block0696 (78 + i.val) = some (values0696[i.val]'(by rw [values0696_size]; exact i.isLt)) := by
  exact segment_get 78 values0696 ⟨i.val, by rw [values0696_size]; exact i.isLt⟩

def values0697 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0697.coefficient47_110,
  OriginalRow227TriangleData0697.coefficient47_111,
  OriginalRow227TriangleData0697.coefficient47_112,
  OriginalRow227TriangleData0697.coefficient47_113,
  OriginalRow227TriangleData0697.coefficient47_114,
  OriginalRow227TriangleData0697.coefficient47_115,
  OriginalRow227TriangleData0697.coefficient47_116,
  OriginalRow227TriangleData0697.coefficient47_117,
  OriginalRow227TriangleData0697.coefficient47_118,
  OriginalRow227TriangleData0697.coefficient47_119,
  OriginalRow227TriangleData0697.coefficient47_120,
  OriginalRow227TriangleData0697.coefficient47_121,
  OriginalRow227TriangleData0697.coefficient47_122,
  OriginalRow227TriangleData0697.coefficient47_123,
  OriginalRow227TriangleData0697.coefficient47_124,
  OriginalRow227TriangleData0697.coefficient47_125,
  OriginalRow227TriangleData0697.coefficient47_126,
  OriginalRow227TriangleData0697.coefficient47_127,
  OriginalRow227TriangleData0697.coefficient47_128,
  OriginalRow227TriangleData0697.coefficient47_129,
  OriginalRow227TriangleData0697.coefficient47_130,
  OriginalRow227TriangleData0697.coefficient47_131,
  OriginalRow227TriangleData0697.coefficient47_132,
  OriginalRow227TriangleData0697.coefficient47_133,
  OriginalRow227TriangleData0697.coefficient47_134,
  OriginalRow227TriangleData0697.coefficient47_135,
  OriginalRow227TriangleData0697.coefficient47_136,
  OriginalRow227TriangleData0697.coefficient47_137,
  OriginalRow227TriangleData0697.coefficient47_138,
  OriginalRow227TriangleData0697.coefficient47_139,
  OriginalRow227TriangleData0697.coefficient47_140,
  OriginalRow227TriangleData0697.coefficient47_141
]

theorem values0697_size : values0697.size = 32 := rfl

def block0697 : ℕ → Option IntervalDyadic := segment 110 values0697

theorem block0697_domain : ExactDomain block0697 110 142 := by
  simpa only [values0697_size] using segment_domain 110 values0697

theorem block0697_get (i : Fin 32) :
    block0697 (110 + i.val) = some (values0697[i.val]'(by rw [values0697_size]; exact i.isLt)) := by
  exact segment_get 110 values0697 ⟨i.val, by rw [values0697_size]; exact i.isLt⟩

def values0698 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0698.coefficient47_142,
  OriginalRow227TriangleData0698.coefficient47_143,
  OriginalRow227TriangleData0698.coefficient47_144,
  OriginalRow227TriangleData0698.coefficient47_145,
  OriginalRow227TriangleData0698.coefficient47_146,
  OriginalRow227TriangleData0698.coefficient47_147,
  OriginalRow227TriangleData0698.coefficient47_148,
  OriginalRow227TriangleData0698.coefficient47_149,
  OriginalRow227TriangleData0698.coefficient47_150,
  OriginalRow227TriangleData0698.coefficient47_151,
  OriginalRow227TriangleData0698.coefficient47_152,
  OriginalRow227TriangleData0698.coefficient47_153,
  OriginalRow227TriangleData0698.coefficient47_154,
  OriginalRow227TriangleData0698.coefficient47_155,
  OriginalRow227TriangleData0698.coefficient47_156,
  OriginalRow227TriangleData0698.coefficient47_157,
  OriginalRow227TriangleData0698.coefficient47_158,
  OriginalRow227TriangleData0698.coefficient47_159,
  OriginalRow227TriangleData0698.coefficient47_160,
  OriginalRow227TriangleData0698.coefficient47_161,
  OriginalRow227TriangleData0698.coefficient47_162,
  OriginalRow227TriangleData0698.coefficient47_163,
  OriginalRow227TriangleData0698.coefficient47_164,
  OriginalRow227TriangleData0698.coefficient47_165,
  OriginalRow227TriangleData0698.coefficient47_166,
  OriginalRow227TriangleData0698.coefficient47_167,
  OriginalRow227TriangleData0698.coefficient47_168,
  OriginalRow227TriangleData0698.coefficient47_169,
  OriginalRow227TriangleData0698.coefficient47_170,
  OriginalRow227TriangleData0698.coefficient47_171,
  OriginalRow227TriangleData0698.coefficient47_172,
  OriginalRow227TriangleData0698.coefficient47_173
]

theorem values0698_size : values0698.size = 32 := rfl

def block0698 : ℕ → Option IntervalDyadic := segment 142 values0698

theorem block0698_domain : ExactDomain block0698 142 174 := by
  simpa only [values0698_size] using segment_domain 142 values0698

theorem block0698_get (i : Fin 32) :
    block0698 (142 + i.val) = some (values0698[i.val]'(by rw [values0698_size]; exact i.isLt)) := by
  exact segment_get 142 values0698 ⟨i.val, by rw [values0698_size]; exact i.isLt⟩

def values0699 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0699.coefficient47_174,
  OriginalRow227TriangleData0699.coefficient47_175,
  OriginalRow227TriangleData0699.coefficient47_176,
  OriginalRow227TriangleData0699.coefficient47_177,
  OriginalRow227TriangleData0699.coefficient47_178,
  OriginalRow227TriangleData0699.coefficient47_179,
  OriginalRow227TriangleData0699.coefficient47_180,
  OriginalRow227TriangleData0699.coefficient47_181,
  OriginalRow227TriangleData0699.coefficient47_182,
  OriginalRow227TriangleData0699.coefficient47_183,
  OriginalRow227TriangleData0699.coefficient47_184,
  OriginalRow227TriangleData0699.coefficient47_185,
  OriginalRow227TriangleData0699.coefficient47_186,
  OriginalRow227TriangleData0699.coefficient47_187,
  OriginalRow227TriangleData0699.coefficient47_188,
  OriginalRow227TriangleData0699.coefficient47_189,
  OriginalRow227TriangleData0699.coefficient47_190,
  OriginalRow227TriangleData0699.coefficient47_191,
  OriginalRow227TriangleData0699.coefficient47_192,
  OriginalRow227TriangleData0699.coefficient47_193,
  OriginalRow227TriangleData0699.coefficient47_194,
  OriginalRow227TriangleData0699.coefficient47_195,
  OriginalRow227TriangleData0699.coefficient47_196,
  OriginalRow227TriangleData0699.coefficient47_197,
  OriginalRow227TriangleData0699.coefficient47_198,
  OriginalRow227TriangleData0699.coefficient47_199,
  OriginalRow227TriangleData0699.coefficient47_200,
  OriginalRow227TriangleData0699.coefficient47_201,
  OriginalRow227TriangleData0699.coefficient47_202,
  OriginalRow227TriangleData0699.coefficient47_203,
  OriginalRow227TriangleData0699.coefficient47_204,
  OriginalRow227TriangleData0699.coefficient47_205
]

theorem values0699_size : values0699.size = 32 := rfl

def block0699 : ℕ → Option IntervalDyadic := segment 174 values0699

theorem block0699_domain : ExactDomain block0699 174 206 := by
  simpa only [values0699_size] using segment_domain 174 values0699

theorem block0699_get (i : Fin 32) :
    block0699 (174 + i.val) = some (values0699[i.val]'(by rw [values0699_size]; exact i.isLt)) := by
  exact segment_get 174 values0699 ⟨i.val, by rw [values0699_size]; exact i.isLt⟩

def values0700 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0700.coefficient47_206,
  OriginalRow227TriangleData0700.coefficient47_207,
  OriginalRow227TriangleData0700.coefficient47_208,
  OriginalRow227TriangleData0700.coefficient47_209,
  OriginalRow227TriangleData0700.coefficient47_210,
  OriginalRow227TriangleData0700.coefficient47_211,
  OriginalRow227TriangleData0700.coefficient47_212,
  OriginalRow227TriangleData0700.coefficient47_213,
  OriginalRow227TriangleData0700.coefficient47_214,
  OriginalRow227TriangleData0700.coefficient47_215,
  OriginalRow227TriangleData0700.coefficient47_216,
  OriginalRow227TriangleData0700.coefficient47_217,
  OriginalRow227TriangleData0700.coefficient47_218,
  OriginalRow227TriangleData0700.coefficient47_219,
  OriginalRow227TriangleData0700.coefficient47_220,
  OriginalRow227TriangleData0700.coefficient47_221,
  OriginalRow227TriangleData0700.coefficient47_222,
  OriginalRow227TriangleData0700.coefficient47_223,
  OriginalRow227TriangleData0700.coefficient47_224,
  OriginalRow227TriangleData0700.coefficient47_225,
  OriginalRow227TriangleData0700.coefficient47_226,
  OriginalRow227TriangleData0700.coefficient47_227,
  OriginalRow227TriangleData0700.coefficient47_228,
  OriginalRow227TriangleData0700.coefficient47_229,
  OriginalRow227TriangleData0700.coefficient47_230,
  OriginalRow227TriangleData0700.coefficient47_231,
  OriginalRow227TriangleData0700.coefficient47_232,
  OriginalRow227TriangleData0700.coefficient47_233,
  OriginalRow227TriangleData0700.coefficient47_234,
  OriginalRow227TriangleData0700.coefficient47_235,
  OriginalRow227TriangleData0700.coefficient47_236,
  OriginalRow227TriangleData0700.coefficient47_237
]

theorem values0700_size : values0700.size = 32 := rfl

def block0700 : ℕ → Option IntervalDyadic := segment 206 values0700

theorem block0700_domain : ExactDomain block0700 206 238 := by
  simpa only [values0700_size] using segment_domain 206 values0700

theorem block0700_get (i : Fin 32) :
    block0700 (206 + i.val) = some (values0700[i.val]'(by rw [values0700_size]; exact i.isLt)) := by
  exact segment_get 206 values0700 ⟨i.val, by rw [values0700_size]; exact i.isLt⟩

def values0701 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0701.coefficient47_238,
  OriginalRow227TriangleData0701.coefficient47_239,
  OriginalRow227TriangleData0701.coefficient47_240,
  OriginalRow227TriangleData0701.coefficient47_241,
  OriginalRow227TriangleData0701.coefficient47_242,
  OriginalRow227TriangleData0701.coefficient47_243,
  OriginalRow227TriangleData0701.coefficient47_244,
  OriginalRow227TriangleData0701.coefficient47_245,
  OriginalRow227TriangleData0701.coefficient47_246,
  OriginalRow227TriangleData0701.coefficient47_247,
  OriginalRow227TriangleData0701.coefficient47_248,
  OriginalRow227TriangleData0701.coefficient47_249,
  OriginalRow227TriangleData0701.coefficient47_250,
  OriginalRow227TriangleData0701.coefficient47_251,
  OriginalRow227TriangleData0701.coefficient47_252,
  OriginalRow227TriangleData0701.coefficient47_253,
  OriginalRow227TriangleData0701.coefficient47_254,
  OriginalRow227TriangleData0701.coefficient47_255,
  OriginalRow227TriangleData0701.coefficient47_256,
  OriginalRow227TriangleData0701.coefficient47_257,
  OriginalRow227TriangleData0701.coefficient47_258,
  OriginalRow227TriangleData0701.coefficient47_259,
  OriginalRow227TriangleData0701.coefficient47_260,
  OriginalRow227TriangleData0701.coefficient47_261,
  OriginalRow227TriangleData0701.coefficient47_262,
  OriginalRow227TriangleData0701.coefficient47_263,
  OriginalRow227TriangleData0701.coefficient47_264,
  OriginalRow227TriangleData0701.coefficient47_265,
  OriginalRow227TriangleData0701.coefficient47_266,
  OriginalRow227TriangleData0701.coefficient47_267,
  OriginalRow227TriangleData0701.coefficient47_268,
  OriginalRow227TriangleData0701.coefficient47_269
]

theorem values0701_size : values0701.size = 32 := rfl

def block0701 : ℕ → Option IntervalDyadic := segment 238 values0701

theorem block0701_domain : ExactDomain block0701 238 270 := by
  simpa only [values0701_size] using segment_domain 238 values0701

theorem block0701_get (i : Fin 32) :
    block0701 (238 + i.val) = some (values0701[i.val]'(by rw [values0701_size]; exact i.isLt)) := by
  exact segment_get 238 values0701 ⟨i.val, by rw [values0701_size]; exact i.isLt⟩

def values0702 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0702.coefficient47_270,
  OriginalRow227TriangleData0702.coefficient47_271,
  OriginalRow227TriangleData0702.coefficient47_272,
  OriginalRow227TriangleData0702.coefficient47_273,
  OriginalRow227TriangleData0702.coefficient47_274,
  OriginalRow227TriangleData0702.coefficient47_275,
  OriginalRow227TriangleData0702.coefficient47_276,
  OriginalRow227TriangleData0702.coefficient47_277,
  OriginalRow227TriangleData0702.coefficient47_278,
  OriginalRow227TriangleData0702.coefficient47_279,
  OriginalRow227TriangleData0702.coefficient47_280,
  OriginalRow227TriangleData0702.coefficient47_281,
  OriginalRow227TriangleData0702.coefficient47_282,
  OriginalRow227TriangleData0702.coefficient47_283,
  OriginalRow227TriangleData0702.coefficient47_284,
  OriginalRow227TriangleData0702.coefficient47_285,
  OriginalRow227TriangleData0702.coefficient47_286,
  OriginalRow227TriangleData0702.coefficient47_287,
  OriginalRow227TriangleData0702.coefficient47_288,
  OriginalRow227TriangleData0702.coefficient47_289,
  OriginalRow227TriangleData0702.coefficient47_290,
  OriginalRow227TriangleData0702.coefficient47_291,
  OriginalRow227TriangleData0702.coefficient47_292,
  OriginalRow227TriangleData0702.coefficient47_293,
  OriginalRow227TriangleData0702.coefficient47_294,
  OriginalRow227TriangleData0702.coefficient47_295,
  OriginalRow227TriangleData0702.coefficient47_296,
  OriginalRow227TriangleData0702.coefficient47_297,
  OriginalRow227TriangleData0702.coefficient47_298,
  OriginalRow227TriangleData0702.coefficient47_299,
  OriginalRow227TriangleData0702.coefficient47_300,
  OriginalRow227TriangleData0702.coefficient47_301
]

theorem values0702_size : values0702.size = 32 := rfl

def block0702 : ℕ → Option IntervalDyadic := segment 270 values0702

theorem block0702_domain : ExactDomain block0702 270 302 := by
  simpa only [values0702_size] using segment_domain 270 values0702

theorem block0702_get (i : Fin 32) :
    block0702 (270 + i.val) = some (values0702[i.val]'(by rw [values0702_size]; exact i.isLt)) := by
  exact segment_get 270 values0702 ⟨i.val, by rw [values0702_size]; exact i.isLt⟩

def values0703 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0703.coefficient47_302,
  OriginalRow227TriangleData0703.coefficient47_303,
  OriginalRow227TriangleData0703.coefficient47_304,
  OriginalRow227TriangleData0703.coefficient47_305,
  OriginalRow227TriangleData0703.coefficient47_306,
  OriginalRow227TriangleData0703.coefficient47_307,
  OriginalRow227TriangleData0703.coefficient47_308,
  OriginalRow227TriangleData0703.coefficient47_309,
  OriginalRow227TriangleData0703.coefficient47_310,
  OriginalRow227TriangleData0703.coefficient47_311,
  OriginalRow227TriangleData0703.coefficient47_312,
  OriginalRow227TriangleData0703.coefficient47_313,
  OriginalRow227TriangleData0703.coefficient47_314,
  OriginalRow227TriangleData0703.coefficient47_315,
  OriginalRow227TriangleData0703.coefficient47_316,
  OriginalRow227TriangleData0703.coefficient47_317,
  OriginalRow227TriangleData0703.coefficient47_318,
  OriginalRow227TriangleData0703.coefficient47_319,
  OriginalRow227TriangleData0703.coefficient47_320,
  OriginalRow227TriangleData0703.coefficient47_321,
  OriginalRow227TriangleData0703.coefficient47_322,
  OriginalRow227TriangleData0703.coefficient47_323,
  OriginalRow227TriangleData0703.coefficient47_324,
  OriginalRow227TriangleData0703.coefficient47_325,
  OriginalRow227TriangleData0703.coefficient47_326,
  OriginalRow227TriangleData0703.coefficient47_327,
  OriginalRow227TriangleData0703.coefficient47_328,
  OriginalRow227TriangleData0703.coefficient47_329,
  OriginalRow227TriangleData0703.coefficient47_330,
  OriginalRow227TriangleData0703.coefficient47_331,
  OriginalRow227TriangleData0703.coefficient47_332,
  OriginalRow227TriangleData0703.coefficient47_333
]

theorem values0703_size : values0703.size = 32 := rfl

def block0703 : ℕ → Option IntervalDyadic := segment 302 values0703

theorem block0703_domain : ExactDomain block0703 302 334 := by
  simpa only [values0703_size] using segment_domain 302 values0703

theorem block0703_get (i : Fin 32) :
    block0703 (302 + i.val) = some (values0703[i.val]'(by rw [values0703_size]; exact i.isLt)) := by
  exact segment_get 302 values0703 ⟨i.val, by rw [values0703_size]; exact i.isLt⟩

def values0704 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0704.coefficient47_334,
  OriginalRow227TriangleData0704.coefficient47_335,
  OriginalRow227TriangleData0704.coefficient47_336,
  OriginalRow227TriangleData0704.coefficient47_337,
  OriginalRow227TriangleData0704.coefficient47_338,
  OriginalRow227TriangleData0704.coefficient47_339,
  OriginalRow227TriangleData0704.coefficient47_340,
  OriginalRow227TriangleData0704.coefficient47_341,
  OriginalRow227TriangleData0704.coefficient47_342,
  OriginalRow227TriangleData0704.coefficient47_343,
  OriginalRow227TriangleData0704.coefficient47_344,
  OriginalRow227TriangleData0704.coefficient47_345,
  OriginalRow227TriangleData0704.coefficient47_346,
  OriginalRow227TriangleData0704.coefficient47_347,
  OriginalRow227TriangleData0704.coefficient47_348,
  OriginalRow227TriangleData0704.coefficient47_349,
  OriginalRow227TriangleData0704.coefficient47_350,
  OriginalRow227TriangleData0704.coefficient47_351,
  OriginalRow227TriangleData0704.coefficient47_352,
  OriginalRow227TriangleData0704.coefficient47_353,
  OriginalRow227TriangleData0704.coefficient47_354,
  OriginalRow227TriangleData0704.coefficient47_355,
  OriginalRow227TriangleData0704.coefficient47_356,
  OriginalRow227TriangleData0704.coefficient47_357,
  OriginalRow227TriangleData0704.coefficient47_358,
  OriginalRow227TriangleData0704.coefficient47_359,
  OriginalRow227TriangleData0704.coefficient47_360,
  OriginalRow227TriangleData0704.coefficient47_361,
  OriginalRow227TriangleData0704.coefficient47_362,
  OriginalRow227TriangleData0704.coefficient47_363,
  OriginalRow227TriangleData0704.coefficient47_364,
  OriginalRow227TriangleData0704.coefficient47_365
]

theorem values0704_size : values0704.size = 32 := rfl

def block0704 : ℕ → Option IntervalDyadic := segment 334 values0704

theorem block0704_domain : ExactDomain block0704 334 366 := by
  simpa only [values0704_size] using segment_domain 334 values0704

theorem block0704_get (i : Fin 32) :
    block0704 (334 + i.val) = some (values0704[i.val]'(by rw [values0704_size]; exact i.isLt)) := by
  exact segment_get 334 values0704 ⟨i.val, by rw [values0704_size]; exact i.isLt⟩

def values0705 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0705.coefficient47_366,
  OriginalRow227TriangleData0705.coefficient47_367,
  OriginalRow227TriangleData0705.coefficient47_368,
  OriginalRow227TriangleData0705.coefficient47_369,
  OriginalRow227TriangleData0705.coefficient47_370,
  OriginalRow227TriangleData0705.coefficient47_371,
  OriginalRow227TriangleData0705.coefficient47_372,
  OriginalRow227TriangleData0705.coefficient47_373,
  OriginalRow227TriangleData0705.coefficient47_374,
  OriginalRow227TriangleData0705.coefficient47_375,
  OriginalRow227TriangleData0705.coefficient47_376,
  OriginalRow227TriangleData0705.coefficient47_377,
  OriginalRow227TriangleData0705.coefficient47_378,
  OriginalRow227TriangleData0705.coefficient47_379,
  OriginalRow227TriangleData0705.coefficient47_380,
  OriginalRow227TriangleData0705.coefficient47_381,
  OriginalRow227TriangleData0705.coefficient47_382,
  OriginalRow227TriangleData0705.coefficient47_383,
  OriginalRow227TriangleData0705.coefficient47_384,
  OriginalRow227TriangleData0705.coefficient47_385,
  OriginalRow227TriangleData0705.coefficient47_386,
  OriginalRow227TriangleData0705.coefficient47_387,
  OriginalRow227TriangleData0705.coefficient47_388,
  OriginalRow227TriangleData0705.coefficient47_389,
  OriginalRow227TriangleData0705.coefficient47_390,
  OriginalRow227TriangleData0705.coefficient47_391,
  OriginalRow227TriangleData0705.coefficient47_392,
  OriginalRow227TriangleData0705.coefficient47_393,
  OriginalRow227TriangleData0705.coefficient47_394,
  OriginalRow227TriangleData0705.coefficient47_395,
  OriginalRow227TriangleData0705.coefficient47_396,
  OriginalRow227TriangleData0705.coefficient47_397
]

theorem values0705_size : values0705.size = 32 := rfl

def block0705 : ℕ → Option IntervalDyadic := segment 366 values0705

theorem block0705_domain : ExactDomain block0705 366 398 := by
  simpa only [values0705_size] using segment_domain 366 values0705

theorem block0705_get (i : Fin 32) :
    block0705 (366 + i.val) = some (values0705[i.val]'(by rw [values0705_size]; exact i.isLt)) := by
  exact segment_get 366 values0705 ⟨i.val, by rw [values0705_size]; exact i.isLt⟩

def values0706 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0706.coefficient47_398,
  OriginalRow227TriangleData0706.coefficient47_399,
  OriginalRow227TriangleData0706.coefficient47_400,
  OriginalRow227TriangleData0706.coefficient47_401,
  OriginalRow227TriangleData0706.coefficient47_402,
  OriginalRow227TriangleData0706.coefficient47_403,
  OriginalRow227TriangleData0706.coefficient47_404,
  OriginalRow227TriangleData0706.coefficient47_405,
  OriginalRow227TriangleData0706.coefficient47_406,
  OriginalRow227TriangleData0706.coefficient47_407,
  OriginalRow227TriangleData0706.coefficient47_408,
  OriginalRow227TriangleData0706.coefficient47_409,
  OriginalRow227TriangleData0706.coefficient47_410,
  OriginalRow227TriangleData0706.coefficient47_411,
  OriginalRow227TriangleData0706.coefficient47_412,
  OriginalRow227TriangleData0706.coefficient47_413,
  OriginalRow227TriangleData0706.coefficient47_414,
  OriginalRow227TriangleData0706.coefficient47_415,
  OriginalRow227TriangleData0706.coefficient47_416,
  OriginalRow227TriangleData0706.coefficient47_417,
  OriginalRow227TriangleData0706.coefficient47_418,
  OriginalRow227TriangleData0706.coefficient47_419,
  OriginalRow227TriangleData0706.coefficient47_420,
  OriginalRow227TriangleData0706.coefficient47_421,
  OriginalRow227TriangleData0706.coefficient47_422,
  OriginalRow227TriangleData0706.coefficient47_423,
  OriginalRow227TriangleData0706.coefficient47_424,
  OriginalRow227TriangleData0706.coefficient47_425,
  OriginalRow227TriangleData0706.coefficient47_426,
  OriginalRow227TriangleData0706.coefficient47_427,
  OriginalRow227TriangleData0706.coefficient47_428,
  OriginalRow227TriangleData0706.coefficient47_429
]

theorem values0706_size : values0706.size = 32 := rfl

def block0706 : ℕ → Option IntervalDyadic := segment 398 values0706

theorem block0706_domain : ExactDomain block0706 398 430 := by
  simpa only [values0706_size] using segment_domain 398 values0706

theorem block0706_get (i : Fin 32) :
    block0706 (398 + i.val) = some (values0706[i.val]'(by rw [values0706_size]; exact i.isLt)) := by
  exact segment_get 398 values0706 ⟨i.val, by rw [values0706_size]; exact i.isLt⟩

def values0707 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0707.coefficient47_430,
  OriginalRow227TriangleData0707.coefficient47_431,
  OriginalRow227TriangleData0707.coefficient47_432,
  OriginalRow227TriangleData0707.coefficient47_433,
  OriginalRow227TriangleData0707.coefficient47_434,
  OriginalRow227TriangleData0707.coefficient47_435,
  OriginalRow227TriangleData0707.coefficient47_436,
  OriginalRow227TriangleData0707.coefficient47_437,
  OriginalRow227TriangleData0707.coefficient47_438,
  OriginalRow227TriangleData0707.coefficient47_439,
  OriginalRow227TriangleData0707.coefficient47_440,
  OriginalRow227TriangleData0707.coefficient47_441,
  OriginalRow227TriangleData0707.coefficient47_442,
  OriginalRow227TriangleData0707.coefficient47_443,
  OriginalRow227TriangleData0707.coefficient47_444,
  OriginalRow227TriangleData0707.coefficient47_445,
  OriginalRow227TriangleData0707.coefficient47_446,
  OriginalRow227TriangleData0707.coefficient47_447,
  OriginalRow227TriangleData0707.coefficient47_448,
  OriginalRow227TriangleData0707.coefficient47_449,
  OriginalRow227TriangleData0707.coefficient47_450,
  OriginalRow227TriangleData0707.coefficient47_451,
  OriginalRow227TriangleData0707.coefficient47_452,
  OriginalRow227TriangleData0707.coefficient47_453,
  OriginalRow227TriangleData0707.coefficient47_454
]

theorem values0707_size : values0707.size = 25 := rfl

def block0707 : ℕ → Option IntervalDyadic := segment 430 values0707

theorem block0707_domain : ExactDomain block0707 430 455 := by
  simpa only [values0707_size] using segment_domain 430 values0707

theorem block0707_get (i : Fin 25) :
    block0707 (430 + i.val) = some (values0707[i.val]'(by rw [values0707_size]; exact i.isLt)) := by
  exact segment_get 430 values0707 ⟨i.val, by rw [values0707_size]; exact i.isLt⟩

def node0078_0142 : ℕ → Option IntervalDyadic := split 110 block0696 block0697

theorem node0078_0142_domain : ExactDomain node0078_0142 78 142 := by
  exact split_domain (by decide) (by decide) block0696_domain block0697_domain

def node0046_0142 : ℕ → Option IntervalDyadic := split 78 block0695 node0078_0142

theorem node0046_0142_domain : ExactDomain node0046_0142 46 142 := by
  exact split_domain (by decide) (by decide) block0695_domain node0078_0142_domain

def node0174_0238 : ℕ → Option IntervalDyadic := split 206 block0699 block0700

theorem node0174_0238_domain : ExactDomain node0174_0238 174 238 := by
  exact split_domain (by decide) (by decide) block0699_domain block0700_domain

def node0142_0238 : ℕ → Option IntervalDyadic := split 174 block0698 node0174_0238

theorem node0142_0238_domain : ExactDomain node0142_0238 142 238 := by
  exact split_domain (by decide) (by decide) block0698_domain node0174_0238_domain

def node0046_0238 : ℕ → Option IntervalDyadic := split 142 node0046_0142 node0142_0238

theorem node0046_0238_domain : ExactDomain node0046_0238 46 238 := by
  exact split_domain (by decide) (by decide) node0046_0142_domain node0142_0238_domain

def node0270_0334 : ℕ → Option IntervalDyadic := split 302 block0702 block0703

theorem node0270_0334_domain : ExactDomain node0270_0334 270 334 := by
  exact split_domain (by decide) (by decide) block0702_domain block0703_domain

def node0238_0334 : ℕ → Option IntervalDyadic := split 270 block0701 node0270_0334

theorem node0238_0334_domain : ExactDomain node0238_0334 238 334 := by
  exact split_domain (by decide) (by decide) block0701_domain node0270_0334_domain

def node0334_0398 : ℕ → Option IntervalDyadic := split 366 block0704 block0705

theorem node0334_0398_domain : ExactDomain node0334_0398 334 398 := by
  exact split_domain (by decide) (by decide) block0704_domain block0705_domain

def node0398_0455 : ℕ → Option IntervalDyadic := split 430 block0706 block0707

theorem node0398_0455_domain : ExactDomain node0398_0455 398 455 := by
  exact split_domain (by decide) (by decide) block0706_domain block0707_domain

def node0334_0455 : ℕ → Option IntervalDyadic := split 398 node0334_0398 node0398_0455

theorem node0334_0455_domain : ExactDomain node0334_0455 334 455 := by
  exact split_domain (by decide) (by decide) node0334_0398_domain node0398_0455_domain

def node0238_0455 : ℕ → Option IntervalDyadic := split 334 node0238_0334 node0334_0455

theorem node0238_0455_domain : ExactDomain node0238_0455 238 455 := by
  exact split_domain (by decide) (by decide) node0238_0334_domain node0334_0455_domain

def node0046_0455 : ℕ → Option IntervalDyadic := split 238 node0046_0238 node0238_0455

theorem node0046_0455_domain : ExactDomain node0046_0455 46 455 := by
  exact split_domain (by decide) (by decide) node0046_0238_domain node0238_0455_domain

def lookup : ℕ → Option IntervalDyadic := node0046_0455

theorem lookup_domain : ExactDomain lookup 46 455 :=
  node0046_0455_domain

theorem block0695_lookup (i : Fin 32) :
    lookup (46 + i.val) = some (values0695[i.val]'(by rw [values0695_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (46 + i.val) = _
  rw [node0046_0455, split_left 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0046_0238, split_left 142 node0046_0142 node0142_0238 (by omega)]
  rw [node0046_0142, split_left 78 block0695 node0078_0142 (by omega)]
  exact block0695_get i

theorem block0696_lookup (i : Fin 32) :
    lookup (78 + i.val) = some (values0696[i.val]'(by rw [values0696_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (78 + i.val) = _
  rw [node0046_0455, split_left 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0046_0238, split_left 142 node0046_0142 node0142_0238 (by omega)]
  rw [node0046_0142, split_right 78 block0695 node0078_0142 (by omega)]
  rw [node0078_0142, split_left 110 block0696 block0697 (by omega)]
  exact block0696_get i

theorem block0697_lookup (i : Fin 32) :
    lookup (110 + i.val) = some (values0697[i.val]'(by rw [values0697_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (110 + i.val) = _
  rw [node0046_0455, split_left 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0046_0238, split_left 142 node0046_0142 node0142_0238 (by omega)]
  rw [node0046_0142, split_right 78 block0695 node0078_0142 (by omega)]
  rw [node0078_0142, split_right 110 block0696 block0697 (by omega)]
  exact block0697_get i

theorem block0698_lookup (i : Fin 32) :
    lookup (142 + i.val) = some (values0698[i.val]'(by rw [values0698_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (142 + i.val) = _
  rw [node0046_0455, split_left 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0046_0238, split_right 142 node0046_0142 node0142_0238 (by omega)]
  rw [node0142_0238, split_left 174 block0698 node0174_0238 (by omega)]
  exact block0698_get i

theorem block0699_lookup (i : Fin 32) :
    lookup (174 + i.val) = some (values0699[i.val]'(by rw [values0699_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (174 + i.val) = _
  rw [node0046_0455, split_left 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0046_0238, split_right 142 node0046_0142 node0142_0238 (by omega)]
  rw [node0142_0238, split_right 174 block0698 node0174_0238 (by omega)]
  rw [node0174_0238, split_left 206 block0699 block0700 (by omega)]
  exact block0699_get i

theorem block0700_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values0700[i.val]'(by rw [values0700_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (206 + i.val) = _
  rw [node0046_0455, split_left 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0046_0238, split_right 142 node0046_0142 node0142_0238 (by omega)]
  rw [node0142_0238, split_right 174 block0698 node0174_0238 (by omega)]
  rw [node0174_0238, split_right 206 block0699 block0700 (by omega)]
  exact block0700_get i

theorem block0701_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values0701[i.val]'(by rw [values0701_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (238 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_left 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0238_0334, split_left 270 block0701 node0270_0334 (by omega)]
  exact block0701_get i

theorem block0702_lookup (i : Fin 32) :
    lookup (270 + i.val) = some (values0702[i.val]'(by rw [values0702_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (270 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_left 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0238_0334, split_right 270 block0701 node0270_0334 (by omega)]
  rw [node0270_0334, split_left 302 block0702 block0703 (by omega)]
  exact block0702_get i

theorem block0703_lookup (i : Fin 32) :
    lookup (302 + i.val) = some (values0703[i.val]'(by rw [values0703_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (302 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_left 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0238_0334, split_right 270 block0701 node0270_0334 (by omega)]
  rw [node0270_0334, split_right 302 block0702 block0703 (by omega)]
  exact block0703_get i

theorem block0704_lookup (i : Fin 32) :
    lookup (334 + i.val) = some (values0704[i.val]'(by rw [values0704_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (334 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_right 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0334_0455, split_left 398 node0334_0398 node0398_0455 (by omega)]
  rw [node0334_0398, split_left 366 block0704 block0705 (by omega)]
  exact block0704_get i

theorem block0705_lookup (i : Fin 32) :
    lookup (366 + i.val) = some (values0705[i.val]'(by rw [values0705_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (366 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_right 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0334_0455, split_left 398 node0334_0398 node0398_0455 (by omega)]
  rw [node0334_0398, split_right 366 block0704 block0705 (by omega)]
  exact block0705_get i

theorem block0706_lookup (i : Fin 32) :
    lookup (398 + i.val) = some (values0706[i.val]'(by rw [values0706_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (398 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_right 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0334_0455, split_right 398 node0334_0398 node0398_0455 (by omega)]
  rw [node0398_0455, split_left 430 block0706 block0707 (by omega)]
  exact block0706_get i

theorem block0707_lookup (i : Fin 25) :
    lookup (430 + i.val) = some (values0707[i.val]'(by rw [values0707_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0046_0455 (430 + i.val) = _
  rw [node0046_0455, split_right 238 node0046_0238 node0238_0455 (by omega)]
  rw [node0238_0455, split_right 334 node0238_0334 node0334_0455 (by omega)]
  rw [node0334_0455, split_right 398 node0334_0398 node0398_0455 (by omega)]
  rw [node0398_0455, split_right 430 block0706 block0707 (by omega)]
  exact block0707_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0695_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0695_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0696_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0696_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0697_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0697_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0698_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0698_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0699_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0699_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0700_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0700_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0701_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0701_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0702_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0702_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0703_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0703_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0704_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0704_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0705_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0705_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0706_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0706_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0707_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0707_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0695_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0696_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0697_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0698_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0699_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0700_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0701_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0702_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0703_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0704_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0705_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0706_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow047.block0707_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow047
