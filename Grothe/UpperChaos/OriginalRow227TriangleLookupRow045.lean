import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0669
import Grothe.UpperChaos.OriginalRow227TriangleData0670
import Grothe.UpperChaos.OriginalRow227TriangleData0671
import Grothe.UpperChaos.OriginalRow227TriangleData0672
import Grothe.UpperChaos.OriginalRow227TriangleData0673
import Grothe.UpperChaos.OriginalRow227TriangleData0674
import Grothe.UpperChaos.OriginalRow227TriangleData0675
import Grothe.UpperChaos.OriginalRow227TriangleData0676
import Grothe.UpperChaos.OriginalRow227TriangleData0677
import Grothe.UpperChaos.OriginalRow227TriangleData0678
import Grothe.UpperChaos.OriginalRow227TriangleData0679
import Grothe.UpperChaos.OriginalRow227TriangleData0680
import Grothe.UpperChaos.OriginalRow227TriangleData0681

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow045

open ConditionalTableLookup

def values0669 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0669.coefficient45_44,
  OriginalRow227TriangleData0669.coefficient45_45,
  OriginalRow227TriangleData0669.coefficient45_46,
  OriginalRow227TriangleData0669.coefficient45_47,
  OriginalRow227TriangleData0669.coefficient45_48,
  OriginalRow227TriangleData0669.coefficient45_49,
  OriginalRow227TriangleData0669.coefficient45_50,
  OriginalRow227TriangleData0669.coefficient45_51,
  OriginalRow227TriangleData0669.coefficient45_52,
  OriginalRow227TriangleData0669.coefficient45_53,
  OriginalRow227TriangleData0669.coefficient45_54,
  OriginalRow227TriangleData0669.coefficient45_55,
  OriginalRow227TriangleData0669.coefficient45_56,
  OriginalRow227TriangleData0669.coefficient45_57,
  OriginalRow227TriangleData0669.coefficient45_58,
  OriginalRow227TriangleData0669.coefficient45_59,
  OriginalRow227TriangleData0669.coefficient45_60,
  OriginalRow227TriangleData0669.coefficient45_61,
  OriginalRow227TriangleData0669.coefficient45_62,
  OriginalRow227TriangleData0669.coefficient45_63,
  OriginalRow227TriangleData0669.coefficient45_64,
  OriginalRow227TriangleData0669.coefficient45_65,
  OriginalRow227TriangleData0669.coefficient45_66,
  OriginalRow227TriangleData0669.coefficient45_67,
  OriginalRow227TriangleData0669.coefficient45_68,
  OriginalRow227TriangleData0669.coefficient45_69,
  OriginalRow227TriangleData0669.coefficient45_70,
  OriginalRow227TriangleData0669.coefficient45_71,
  OriginalRow227TriangleData0669.coefficient45_72,
  OriginalRow227TriangleData0669.coefficient45_73,
  OriginalRow227TriangleData0669.coefficient45_74,
  OriginalRow227TriangleData0669.coefficient45_75
]

theorem values0669_size : values0669.size = 32 := rfl

def block0669 : ℕ → Option IntervalDyadic := segment 44 values0669

theorem block0669_domain : ExactDomain block0669 44 76 := by
  simpa only [values0669_size] using segment_domain 44 values0669

theorem block0669_get (i : Fin 32) :
    block0669 (44 + i.val) = some (values0669[i.val]'(by rw [values0669_size]; exact i.isLt)) := by
  exact segment_get 44 values0669 ⟨i.val, by rw [values0669_size]; exact i.isLt⟩

def values0670 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0670.coefficient45_76,
  OriginalRow227TriangleData0670.coefficient45_77,
  OriginalRow227TriangleData0670.coefficient45_78,
  OriginalRow227TriangleData0670.coefficient45_79,
  OriginalRow227TriangleData0670.coefficient45_80,
  OriginalRow227TriangleData0670.coefficient45_81,
  OriginalRow227TriangleData0670.coefficient45_82,
  OriginalRow227TriangleData0670.coefficient45_83,
  OriginalRow227TriangleData0670.coefficient45_84,
  OriginalRow227TriangleData0670.coefficient45_85,
  OriginalRow227TriangleData0670.coefficient45_86,
  OriginalRow227TriangleData0670.coefficient45_87,
  OriginalRow227TriangleData0670.coefficient45_88,
  OriginalRow227TriangleData0670.coefficient45_89,
  OriginalRow227TriangleData0670.coefficient45_90,
  OriginalRow227TriangleData0670.coefficient45_91,
  OriginalRow227TriangleData0670.coefficient45_92,
  OriginalRow227TriangleData0670.coefficient45_93,
  OriginalRow227TriangleData0670.coefficient45_94,
  OriginalRow227TriangleData0670.coefficient45_95,
  OriginalRow227TriangleData0670.coefficient45_96,
  OriginalRow227TriangleData0670.coefficient45_97,
  OriginalRow227TriangleData0670.coefficient45_98,
  OriginalRow227TriangleData0670.coefficient45_99,
  OriginalRow227TriangleData0670.coefficient45_100,
  OriginalRow227TriangleData0670.coefficient45_101,
  OriginalRow227TriangleData0670.coefficient45_102,
  OriginalRow227TriangleData0670.coefficient45_103,
  OriginalRow227TriangleData0670.coefficient45_104,
  OriginalRow227TriangleData0670.coefficient45_105,
  OriginalRow227TriangleData0670.coefficient45_106,
  OriginalRow227TriangleData0670.coefficient45_107
]

theorem values0670_size : values0670.size = 32 := rfl

def block0670 : ℕ → Option IntervalDyadic := segment 76 values0670

theorem block0670_domain : ExactDomain block0670 76 108 := by
  simpa only [values0670_size] using segment_domain 76 values0670

theorem block0670_get (i : Fin 32) :
    block0670 (76 + i.val) = some (values0670[i.val]'(by rw [values0670_size]; exact i.isLt)) := by
  exact segment_get 76 values0670 ⟨i.val, by rw [values0670_size]; exact i.isLt⟩

def values0671 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0671.coefficient45_108,
  OriginalRow227TriangleData0671.coefficient45_109,
  OriginalRow227TriangleData0671.coefficient45_110,
  OriginalRow227TriangleData0671.coefficient45_111,
  OriginalRow227TriangleData0671.coefficient45_112,
  OriginalRow227TriangleData0671.coefficient45_113,
  OriginalRow227TriangleData0671.coefficient45_114,
  OriginalRow227TriangleData0671.coefficient45_115,
  OriginalRow227TriangleData0671.coefficient45_116,
  OriginalRow227TriangleData0671.coefficient45_117,
  OriginalRow227TriangleData0671.coefficient45_118,
  OriginalRow227TriangleData0671.coefficient45_119,
  OriginalRow227TriangleData0671.coefficient45_120,
  OriginalRow227TriangleData0671.coefficient45_121,
  OriginalRow227TriangleData0671.coefficient45_122,
  OriginalRow227TriangleData0671.coefficient45_123,
  OriginalRow227TriangleData0671.coefficient45_124,
  OriginalRow227TriangleData0671.coefficient45_125,
  OriginalRow227TriangleData0671.coefficient45_126,
  OriginalRow227TriangleData0671.coefficient45_127,
  OriginalRow227TriangleData0671.coefficient45_128,
  OriginalRow227TriangleData0671.coefficient45_129,
  OriginalRow227TriangleData0671.coefficient45_130,
  OriginalRow227TriangleData0671.coefficient45_131,
  OriginalRow227TriangleData0671.coefficient45_132,
  OriginalRow227TriangleData0671.coefficient45_133,
  OriginalRow227TriangleData0671.coefficient45_134,
  OriginalRow227TriangleData0671.coefficient45_135,
  OriginalRow227TriangleData0671.coefficient45_136,
  OriginalRow227TriangleData0671.coefficient45_137,
  OriginalRow227TriangleData0671.coefficient45_138,
  OriginalRow227TriangleData0671.coefficient45_139
]

theorem values0671_size : values0671.size = 32 := rfl

def block0671 : ℕ → Option IntervalDyadic := segment 108 values0671

theorem block0671_domain : ExactDomain block0671 108 140 := by
  simpa only [values0671_size] using segment_domain 108 values0671

theorem block0671_get (i : Fin 32) :
    block0671 (108 + i.val) = some (values0671[i.val]'(by rw [values0671_size]; exact i.isLt)) := by
  exact segment_get 108 values0671 ⟨i.val, by rw [values0671_size]; exact i.isLt⟩

def values0672 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0672.coefficient45_140,
  OriginalRow227TriangleData0672.coefficient45_141,
  OriginalRow227TriangleData0672.coefficient45_142,
  OriginalRow227TriangleData0672.coefficient45_143,
  OriginalRow227TriangleData0672.coefficient45_144,
  OriginalRow227TriangleData0672.coefficient45_145,
  OriginalRow227TriangleData0672.coefficient45_146,
  OriginalRow227TriangleData0672.coefficient45_147,
  OriginalRow227TriangleData0672.coefficient45_148,
  OriginalRow227TriangleData0672.coefficient45_149,
  OriginalRow227TriangleData0672.coefficient45_150,
  OriginalRow227TriangleData0672.coefficient45_151,
  OriginalRow227TriangleData0672.coefficient45_152,
  OriginalRow227TriangleData0672.coefficient45_153,
  OriginalRow227TriangleData0672.coefficient45_154,
  OriginalRow227TriangleData0672.coefficient45_155,
  OriginalRow227TriangleData0672.coefficient45_156,
  OriginalRow227TriangleData0672.coefficient45_157,
  OriginalRow227TriangleData0672.coefficient45_158,
  OriginalRow227TriangleData0672.coefficient45_159,
  OriginalRow227TriangleData0672.coefficient45_160,
  OriginalRow227TriangleData0672.coefficient45_161,
  OriginalRow227TriangleData0672.coefficient45_162,
  OriginalRow227TriangleData0672.coefficient45_163,
  OriginalRow227TriangleData0672.coefficient45_164,
  OriginalRow227TriangleData0672.coefficient45_165,
  OriginalRow227TriangleData0672.coefficient45_166,
  OriginalRow227TriangleData0672.coefficient45_167,
  OriginalRow227TriangleData0672.coefficient45_168,
  OriginalRow227TriangleData0672.coefficient45_169,
  OriginalRow227TriangleData0672.coefficient45_170,
  OriginalRow227TriangleData0672.coefficient45_171
]

theorem values0672_size : values0672.size = 32 := rfl

def block0672 : ℕ → Option IntervalDyadic := segment 140 values0672

theorem block0672_domain : ExactDomain block0672 140 172 := by
  simpa only [values0672_size] using segment_domain 140 values0672

theorem block0672_get (i : Fin 32) :
    block0672 (140 + i.val) = some (values0672[i.val]'(by rw [values0672_size]; exact i.isLt)) := by
  exact segment_get 140 values0672 ⟨i.val, by rw [values0672_size]; exact i.isLt⟩

def values0673 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0673.coefficient45_172,
  OriginalRow227TriangleData0673.coefficient45_173,
  OriginalRow227TriangleData0673.coefficient45_174,
  OriginalRow227TriangleData0673.coefficient45_175,
  OriginalRow227TriangleData0673.coefficient45_176,
  OriginalRow227TriangleData0673.coefficient45_177,
  OriginalRow227TriangleData0673.coefficient45_178,
  OriginalRow227TriangleData0673.coefficient45_179,
  OriginalRow227TriangleData0673.coefficient45_180,
  OriginalRow227TriangleData0673.coefficient45_181,
  OriginalRow227TriangleData0673.coefficient45_182,
  OriginalRow227TriangleData0673.coefficient45_183,
  OriginalRow227TriangleData0673.coefficient45_184,
  OriginalRow227TriangleData0673.coefficient45_185,
  OriginalRow227TriangleData0673.coefficient45_186,
  OriginalRow227TriangleData0673.coefficient45_187,
  OriginalRow227TriangleData0673.coefficient45_188,
  OriginalRow227TriangleData0673.coefficient45_189,
  OriginalRow227TriangleData0673.coefficient45_190,
  OriginalRow227TriangleData0673.coefficient45_191,
  OriginalRow227TriangleData0673.coefficient45_192,
  OriginalRow227TriangleData0673.coefficient45_193,
  OriginalRow227TriangleData0673.coefficient45_194,
  OriginalRow227TriangleData0673.coefficient45_195,
  OriginalRow227TriangleData0673.coefficient45_196,
  OriginalRow227TriangleData0673.coefficient45_197,
  OriginalRow227TriangleData0673.coefficient45_198,
  OriginalRow227TriangleData0673.coefficient45_199,
  OriginalRow227TriangleData0673.coefficient45_200,
  OriginalRow227TriangleData0673.coefficient45_201,
  OriginalRow227TriangleData0673.coefficient45_202,
  OriginalRow227TriangleData0673.coefficient45_203
]

theorem values0673_size : values0673.size = 32 := rfl

def block0673 : ℕ → Option IntervalDyadic := segment 172 values0673

theorem block0673_domain : ExactDomain block0673 172 204 := by
  simpa only [values0673_size] using segment_domain 172 values0673

theorem block0673_get (i : Fin 32) :
    block0673 (172 + i.val) = some (values0673[i.val]'(by rw [values0673_size]; exact i.isLt)) := by
  exact segment_get 172 values0673 ⟨i.val, by rw [values0673_size]; exact i.isLt⟩

def values0674 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0674.coefficient45_204,
  OriginalRow227TriangleData0674.coefficient45_205,
  OriginalRow227TriangleData0674.coefficient45_206,
  OriginalRow227TriangleData0674.coefficient45_207,
  OriginalRow227TriangleData0674.coefficient45_208,
  OriginalRow227TriangleData0674.coefficient45_209,
  OriginalRow227TriangleData0674.coefficient45_210,
  OriginalRow227TriangleData0674.coefficient45_211,
  OriginalRow227TriangleData0674.coefficient45_212,
  OriginalRow227TriangleData0674.coefficient45_213,
  OriginalRow227TriangleData0674.coefficient45_214,
  OriginalRow227TriangleData0674.coefficient45_215,
  OriginalRow227TriangleData0674.coefficient45_216,
  OriginalRow227TriangleData0674.coefficient45_217,
  OriginalRow227TriangleData0674.coefficient45_218,
  OriginalRow227TriangleData0674.coefficient45_219,
  OriginalRow227TriangleData0674.coefficient45_220,
  OriginalRow227TriangleData0674.coefficient45_221,
  OriginalRow227TriangleData0674.coefficient45_222,
  OriginalRow227TriangleData0674.coefficient45_223,
  OriginalRow227TriangleData0674.coefficient45_224,
  OriginalRow227TriangleData0674.coefficient45_225,
  OriginalRow227TriangleData0674.coefficient45_226,
  OriginalRow227TriangleData0674.coefficient45_227,
  OriginalRow227TriangleData0674.coefficient45_228,
  OriginalRow227TriangleData0674.coefficient45_229,
  OriginalRow227TriangleData0674.coefficient45_230,
  OriginalRow227TriangleData0674.coefficient45_231,
  OriginalRow227TriangleData0674.coefficient45_232,
  OriginalRow227TriangleData0674.coefficient45_233,
  OriginalRow227TriangleData0674.coefficient45_234,
  OriginalRow227TriangleData0674.coefficient45_235
]

theorem values0674_size : values0674.size = 32 := rfl

def block0674 : ℕ → Option IntervalDyadic := segment 204 values0674

theorem block0674_domain : ExactDomain block0674 204 236 := by
  simpa only [values0674_size] using segment_domain 204 values0674

theorem block0674_get (i : Fin 32) :
    block0674 (204 + i.val) = some (values0674[i.val]'(by rw [values0674_size]; exact i.isLt)) := by
  exact segment_get 204 values0674 ⟨i.val, by rw [values0674_size]; exact i.isLt⟩

def values0675 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0675.coefficient45_236,
  OriginalRow227TriangleData0675.coefficient45_237,
  OriginalRow227TriangleData0675.coefficient45_238,
  OriginalRow227TriangleData0675.coefficient45_239,
  OriginalRow227TriangleData0675.coefficient45_240,
  OriginalRow227TriangleData0675.coefficient45_241,
  OriginalRow227TriangleData0675.coefficient45_242,
  OriginalRow227TriangleData0675.coefficient45_243,
  OriginalRow227TriangleData0675.coefficient45_244,
  OriginalRow227TriangleData0675.coefficient45_245,
  OriginalRow227TriangleData0675.coefficient45_246,
  OriginalRow227TriangleData0675.coefficient45_247,
  OriginalRow227TriangleData0675.coefficient45_248,
  OriginalRow227TriangleData0675.coefficient45_249,
  OriginalRow227TriangleData0675.coefficient45_250,
  OriginalRow227TriangleData0675.coefficient45_251,
  OriginalRow227TriangleData0675.coefficient45_252,
  OriginalRow227TriangleData0675.coefficient45_253,
  OriginalRow227TriangleData0675.coefficient45_254,
  OriginalRow227TriangleData0675.coefficient45_255,
  OriginalRow227TriangleData0675.coefficient45_256,
  OriginalRow227TriangleData0675.coefficient45_257,
  OriginalRow227TriangleData0675.coefficient45_258,
  OriginalRow227TriangleData0675.coefficient45_259,
  OriginalRow227TriangleData0675.coefficient45_260,
  OriginalRow227TriangleData0675.coefficient45_261,
  OriginalRow227TriangleData0675.coefficient45_262,
  OriginalRow227TriangleData0675.coefficient45_263,
  OriginalRow227TriangleData0675.coefficient45_264,
  OriginalRow227TriangleData0675.coefficient45_265,
  OriginalRow227TriangleData0675.coefficient45_266,
  OriginalRow227TriangleData0675.coefficient45_267
]

theorem values0675_size : values0675.size = 32 := rfl

def block0675 : ℕ → Option IntervalDyadic := segment 236 values0675

theorem block0675_domain : ExactDomain block0675 236 268 := by
  simpa only [values0675_size] using segment_domain 236 values0675

theorem block0675_get (i : Fin 32) :
    block0675 (236 + i.val) = some (values0675[i.val]'(by rw [values0675_size]; exact i.isLt)) := by
  exact segment_get 236 values0675 ⟨i.val, by rw [values0675_size]; exact i.isLt⟩

def values0676 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0676.coefficient45_268,
  OriginalRow227TriangleData0676.coefficient45_269,
  OriginalRow227TriangleData0676.coefficient45_270,
  OriginalRow227TriangleData0676.coefficient45_271,
  OriginalRow227TriangleData0676.coefficient45_272,
  OriginalRow227TriangleData0676.coefficient45_273,
  OriginalRow227TriangleData0676.coefficient45_274,
  OriginalRow227TriangleData0676.coefficient45_275,
  OriginalRow227TriangleData0676.coefficient45_276,
  OriginalRow227TriangleData0676.coefficient45_277,
  OriginalRow227TriangleData0676.coefficient45_278,
  OriginalRow227TriangleData0676.coefficient45_279,
  OriginalRow227TriangleData0676.coefficient45_280,
  OriginalRow227TriangleData0676.coefficient45_281,
  OriginalRow227TriangleData0676.coefficient45_282,
  OriginalRow227TriangleData0676.coefficient45_283,
  OriginalRow227TriangleData0676.coefficient45_284,
  OriginalRow227TriangleData0676.coefficient45_285,
  OriginalRow227TriangleData0676.coefficient45_286,
  OriginalRow227TriangleData0676.coefficient45_287,
  OriginalRow227TriangleData0676.coefficient45_288,
  OriginalRow227TriangleData0676.coefficient45_289,
  OriginalRow227TriangleData0676.coefficient45_290,
  OriginalRow227TriangleData0676.coefficient45_291,
  OriginalRow227TriangleData0676.coefficient45_292,
  OriginalRow227TriangleData0676.coefficient45_293,
  OriginalRow227TriangleData0676.coefficient45_294,
  OriginalRow227TriangleData0676.coefficient45_295,
  OriginalRow227TriangleData0676.coefficient45_296,
  OriginalRow227TriangleData0676.coefficient45_297,
  OriginalRow227TriangleData0676.coefficient45_298,
  OriginalRow227TriangleData0676.coefficient45_299
]

theorem values0676_size : values0676.size = 32 := rfl

def block0676 : ℕ → Option IntervalDyadic := segment 268 values0676

theorem block0676_domain : ExactDomain block0676 268 300 := by
  simpa only [values0676_size] using segment_domain 268 values0676

theorem block0676_get (i : Fin 32) :
    block0676 (268 + i.val) = some (values0676[i.val]'(by rw [values0676_size]; exact i.isLt)) := by
  exact segment_get 268 values0676 ⟨i.val, by rw [values0676_size]; exact i.isLt⟩

def values0677 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0677.coefficient45_300,
  OriginalRow227TriangleData0677.coefficient45_301,
  OriginalRow227TriangleData0677.coefficient45_302,
  OriginalRow227TriangleData0677.coefficient45_303,
  OriginalRow227TriangleData0677.coefficient45_304,
  OriginalRow227TriangleData0677.coefficient45_305,
  OriginalRow227TriangleData0677.coefficient45_306,
  OriginalRow227TriangleData0677.coefficient45_307,
  OriginalRow227TriangleData0677.coefficient45_308,
  OriginalRow227TriangleData0677.coefficient45_309,
  OriginalRow227TriangleData0677.coefficient45_310,
  OriginalRow227TriangleData0677.coefficient45_311,
  OriginalRow227TriangleData0677.coefficient45_312,
  OriginalRow227TriangleData0677.coefficient45_313,
  OriginalRow227TriangleData0677.coefficient45_314,
  OriginalRow227TriangleData0677.coefficient45_315,
  OriginalRow227TriangleData0677.coefficient45_316,
  OriginalRow227TriangleData0677.coefficient45_317,
  OriginalRow227TriangleData0677.coefficient45_318,
  OriginalRow227TriangleData0677.coefficient45_319,
  OriginalRow227TriangleData0677.coefficient45_320,
  OriginalRow227TriangleData0677.coefficient45_321,
  OriginalRow227TriangleData0677.coefficient45_322,
  OriginalRow227TriangleData0677.coefficient45_323,
  OriginalRow227TriangleData0677.coefficient45_324,
  OriginalRow227TriangleData0677.coefficient45_325,
  OriginalRow227TriangleData0677.coefficient45_326,
  OriginalRow227TriangleData0677.coefficient45_327,
  OriginalRow227TriangleData0677.coefficient45_328,
  OriginalRow227TriangleData0677.coefficient45_329,
  OriginalRow227TriangleData0677.coefficient45_330,
  OriginalRow227TriangleData0677.coefficient45_331
]

theorem values0677_size : values0677.size = 32 := rfl

def block0677 : ℕ → Option IntervalDyadic := segment 300 values0677

theorem block0677_domain : ExactDomain block0677 300 332 := by
  simpa only [values0677_size] using segment_domain 300 values0677

theorem block0677_get (i : Fin 32) :
    block0677 (300 + i.val) = some (values0677[i.val]'(by rw [values0677_size]; exact i.isLt)) := by
  exact segment_get 300 values0677 ⟨i.val, by rw [values0677_size]; exact i.isLt⟩

def values0678 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0678.coefficient45_332,
  OriginalRow227TriangleData0678.coefficient45_333,
  OriginalRow227TriangleData0678.coefficient45_334,
  OriginalRow227TriangleData0678.coefficient45_335,
  OriginalRow227TriangleData0678.coefficient45_336,
  OriginalRow227TriangleData0678.coefficient45_337,
  OriginalRow227TriangleData0678.coefficient45_338,
  OriginalRow227TriangleData0678.coefficient45_339,
  OriginalRow227TriangleData0678.coefficient45_340,
  OriginalRow227TriangleData0678.coefficient45_341,
  OriginalRow227TriangleData0678.coefficient45_342,
  OriginalRow227TriangleData0678.coefficient45_343,
  OriginalRow227TriangleData0678.coefficient45_344,
  OriginalRow227TriangleData0678.coefficient45_345,
  OriginalRow227TriangleData0678.coefficient45_346,
  OriginalRow227TriangleData0678.coefficient45_347,
  OriginalRow227TriangleData0678.coefficient45_348,
  OriginalRow227TriangleData0678.coefficient45_349,
  OriginalRow227TriangleData0678.coefficient45_350,
  OriginalRow227TriangleData0678.coefficient45_351,
  OriginalRow227TriangleData0678.coefficient45_352,
  OriginalRow227TriangleData0678.coefficient45_353,
  OriginalRow227TriangleData0678.coefficient45_354,
  OriginalRow227TriangleData0678.coefficient45_355,
  OriginalRow227TriangleData0678.coefficient45_356,
  OriginalRow227TriangleData0678.coefficient45_357,
  OriginalRow227TriangleData0678.coefficient45_358,
  OriginalRow227TriangleData0678.coefficient45_359,
  OriginalRow227TriangleData0678.coefficient45_360,
  OriginalRow227TriangleData0678.coefficient45_361,
  OriginalRow227TriangleData0678.coefficient45_362,
  OriginalRow227TriangleData0678.coefficient45_363
]

theorem values0678_size : values0678.size = 32 := rfl

def block0678 : ℕ → Option IntervalDyadic := segment 332 values0678

theorem block0678_domain : ExactDomain block0678 332 364 := by
  simpa only [values0678_size] using segment_domain 332 values0678

theorem block0678_get (i : Fin 32) :
    block0678 (332 + i.val) = some (values0678[i.val]'(by rw [values0678_size]; exact i.isLt)) := by
  exact segment_get 332 values0678 ⟨i.val, by rw [values0678_size]; exact i.isLt⟩

def values0679 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0679.coefficient45_364,
  OriginalRow227TriangleData0679.coefficient45_365,
  OriginalRow227TriangleData0679.coefficient45_366,
  OriginalRow227TriangleData0679.coefficient45_367,
  OriginalRow227TriangleData0679.coefficient45_368,
  OriginalRow227TriangleData0679.coefficient45_369,
  OriginalRow227TriangleData0679.coefficient45_370,
  OriginalRow227TriangleData0679.coefficient45_371,
  OriginalRow227TriangleData0679.coefficient45_372,
  OriginalRow227TriangleData0679.coefficient45_373,
  OriginalRow227TriangleData0679.coefficient45_374,
  OriginalRow227TriangleData0679.coefficient45_375,
  OriginalRow227TriangleData0679.coefficient45_376,
  OriginalRow227TriangleData0679.coefficient45_377,
  OriginalRow227TriangleData0679.coefficient45_378,
  OriginalRow227TriangleData0679.coefficient45_379,
  OriginalRow227TriangleData0679.coefficient45_380,
  OriginalRow227TriangleData0679.coefficient45_381,
  OriginalRow227TriangleData0679.coefficient45_382,
  OriginalRow227TriangleData0679.coefficient45_383,
  OriginalRow227TriangleData0679.coefficient45_384,
  OriginalRow227TriangleData0679.coefficient45_385,
  OriginalRow227TriangleData0679.coefficient45_386,
  OriginalRow227TriangleData0679.coefficient45_387,
  OriginalRow227TriangleData0679.coefficient45_388,
  OriginalRow227TriangleData0679.coefficient45_389,
  OriginalRow227TriangleData0679.coefficient45_390,
  OriginalRow227TriangleData0679.coefficient45_391,
  OriginalRow227TriangleData0679.coefficient45_392,
  OriginalRow227TriangleData0679.coefficient45_393,
  OriginalRow227TriangleData0679.coefficient45_394,
  OriginalRow227TriangleData0679.coefficient45_395
]

theorem values0679_size : values0679.size = 32 := rfl

def block0679 : ℕ → Option IntervalDyadic := segment 364 values0679

theorem block0679_domain : ExactDomain block0679 364 396 := by
  simpa only [values0679_size] using segment_domain 364 values0679

theorem block0679_get (i : Fin 32) :
    block0679 (364 + i.val) = some (values0679[i.val]'(by rw [values0679_size]; exact i.isLt)) := by
  exact segment_get 364 values0679 ⟨i.val, by rw [values0679_size]; exact i.isLt⟩

def values0680 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0680.coefficient45_396,
  OriginalRow227TriangleData0680.coefficient45_397,
  OriginalRow227TriangleData0680.coefficient45_398,
  OriginalRow227TriangleData0680.coefficient45_399,
  OriginalRow227TriangleData0680.coefficient45_400,
  OriginalRow227TriangleData0680.coefficient45_401,
  OriginalRow227TriangleData0680.coefficient45_402,
  OriginalRow227TriangleData0680.coefficient45_403,
  OriginalRow227TriangleData0680.coefficient45_404,
  OriginalRow227TriangleData0680.coefficient45_405,
  OriginalRow227TriangleData0680.coefficient45_406,
  OriginalRow227TriangleData0680.coefficient45_407,
  OriginalRow227TriangleData0680.coefficient45_408,
  OriginalRow227TriangleData0680.coefficient45_409,
  OriginalRow227TriangleData0680.coefficient45_410,
  OriginalRow227TriangleData0680.coefficient45_411,
  OriginalRow227TriangleData0680.coefficient45_412,
  OriginalRow227TriangleData0680.coefficient45_413,
  OriginalRow227TriangleData0680.coefficient45_414,
  OriginalRow227TriangleData0680.coefficient45_415,
  OriginalRow227TriangleData0680.coefficient45_416,
  OriginalRow227TriangleData0680.coefficient45_417,
  OriginalRow227TriangleData0680.coefficient45_418,
  OriginalRow227TriangleData0680.coefficient45_419,
  OriginalRow227TriangleData0680.coefficient45_420,
  OriginalRow227TriangleData0680.coefficient45_421,
  OriginalRow227TriangleData0680.coefficient45_422,
  OriginalRow227TriangleData0680.coefficient45_423,
  OriginalRow227TriangleData0680.coefficient45_424,
  OriginalRow227TriangleData0680.coefficient45_425,
  OriginalRow227TriangleData0680.coefficient45_426,
  OriginalRow227TriangleData0680.coefficient45_427
]

theorem values0680_size : values0680.size = 32 := rfl

def block0680 : ℕ → Option IntervalDyadic := segment 396 values0680

theorem block0680_domain : ExactDomain block0680 396 428 := by
  simpa only [values0680_size] using segment_domain 396 values0680

theorem block0680_get (i : Fin 32) :
    block0680 (396 + i.val) = some (values0680[i.val]'(by rw [values0680_size]; exact i.isLt)) := by
  exact segment_get 396 values0680 ⟨i.val, by rw [values0680_size]; exact i.isLt⟩

def values0681 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0681.coefficient45_428,
  OriginalRow227TriangleData0681.coefficient45_429,
  OriginalRow227TriangleData0681.coefficient45_430,
  OriginalRow227TriangleData0681.coefficient45_431,
  OriginalRow227TriangleData0681.coefficient45_432,
  OriginalRow227TriangleData0681.coefficient45_433,
  OriginalRow227TriangleData0681.coefficient45_434,
  OriginalRow227TriangleData0681.coefficient45_435,
  OriginalRow227TriangleData0681.coefficient45_436,
  OriginalRow227TriangleData0681.coefficient45_437,
  OriginalRow227TriangleData0681.coefficient45_438,
  OriginalRow227TriangleData0681.coefficient45_439,
  OriginalRow227TriangleData0681.coefficient45_440,
  OriginalRow227TriangleData0681.coefficient45_441,
  OriginalRow227TriangleData0681.coefficient45_442,
  OriginalRow227TriangleData0681.coefficient45_443,
  OriginalRow227TriangleData0681.coefficient45_444,
  OriginalRow227TriangleData0681.coefficient45_445,
  OriginalRow227TriangleData0681.coefficient45_446,
  OriginalRow227TriangleData0681.coefficient45_447,
  OriginalRow227TriangleData0681.coefficient45_448,
  OriginalRow227TriangleData0681.coefficient45_449,
  OriginalRow227TriangleData0681.coefficient45_450,
  OriginalRow227TriangleData0681.coefficient45_451,
  OriginalRow227TriangleData0681.coefficient45_452,
  OriginalRow227TriangleData0681.coefficient45_453,
  OriginalRow227TriangleData0681.coefficient45_454,
  OriginalRow227TriangleData0681.coefficient45_455,
  OriginalRow227TriangleData0681.coefficient45_456
]

theorem values0681_size : values0681.size = 29 := rfl

def block0681 : ℕ → Option IntervalDyadic := segment 428 values0681

theorem block0681_domain : ExactDomain block0681 428 457 := by
  simpa only [values0681_size] using segment_domain 428 values0681

theorem block0681_get (i : Fin 29) :
    block0681 (428 + i.val) = some (values0681[i.val]'(by rw [values0681_size]; exact i.isLt)) := by
  exact segment_get 428 values0681 ⟨i.val, by rw [values0681_size]; exact i.isLt⟩

def node0076_0140 : ℕ → Option IntervalDyadic := split 108 block0670 block0671

theorem node0076_0140_domain : ExactDomain node0076_0140 76 140 := by
  exact split_domain (by decide) (by decide) block0670_domain block0671_domain

def node0044_0140 : ℕ → Option IntervalDyadic := split 76 block0669 node0076_0140

theorem node0044_0140_domain : ExactDomain node0044_0140 44 140 := by
  exact split_domain (by decide) (by decide) block0669_domain node0076_0140_domain

def node0172_0236 : ℕ → Option IntervalDyadic := split 204 block0673 block0674

theorem node0172_0236_domain : ExactDomain node0172_0236 172 236 := by
  exact split_domain (by decide) (by decide) block0673_domain block0674_domain

def node0140_0236 : ℕ → Option IntervalDyadic := split 172 block0672 node0172_0236

theorem node0140_0236_domain : ExactDomain node0140_0236 140 236 := by
  exact split_domain (by decide) (by decide) block0672_domain node0172_0236_domain

def node0044_0236 : ℕ → Option IntervalDyadic := split 140 node0044_0140 node0140_0236

theorem node0044_0236_domain : ExactDomain node0044_0236 44 236 := by
  exact split_domain (by decide) (by decide) node0044_0140_domain node0140_0236_domain

def node0268_0332 : ℕ → Option IntervalDyadic := split 300 block0676 block0677

theorem node0268_0332_domain : ExactDomain node0268_0332 268 332 := by
  exact split_domain (by decide) (by decide) block0676_domain block0677_domain

def node0236_0332 : ℕ → Option IntervalDyadic := split 268 block0675 node0268_0332

theorem node0236_0332_domain : ExactDomain node0236_0332 236 332 := by
  exact split_domain (by decide) (by decide) block0675_domain node0268_0332_domain

def node0332_0396 : ℕ → Option IntervalDyadic := split 364 block0678 block0679

theorem node0332_0396_domain : ExactDomain node0332_0396 332 396 := by
  exact split_domain (by decide) (by decide) block0678_domain block0679_domain

def node0396_0457 : ℕ → Option IntervalDyadic := split 428 block0680 block0681

theorem node0396_0457_domain : ExactDomain node0396_0457 396 457 := by
  exact split_domain (by decide) (by decide) block0680_domain block0681_domain

def node0332_0457 : ℕ → Option IntervalDyadic := split 396 node0332_0396 node0396_0457

theorem node0332_0457_domain : ExactDomain node0332_0457 332 457 := by
  exact split_domain (by decide) (by decide) node0332_0396_domain node0396_0457_domain

def node0236_0457 : ℕ → Option IntervalDyadic := split 332 node0236_0332 node0332_0457

theorem node0236_0457_domain : ExactDomain node0236_0457 236 457 := by
  exact split_domain (by decide) (by decide) node0236_0332_domain node0332_0457_domain

def node0044_0457 : ℕ → Option IntervalDyadic := split 236 node0044_0236 node0236_0457

theorem node0044_0457_domain : ExactDomain node0044_0457 44 457 := by
  exact split_domain (by decide) (by decide) node0044_0236_domain node0236_0457_domain

def lookup : ℕ → Option IntervalDyadic := node0044_0457

theorem lookup_domain : ExactDomain lookup 44 457 :=
  node0044_0457_domain

theorem block0669_lookup (i : Fin 32) :
    lookup (44 + i.val) = some (values0669[i.val]'(by rw [values0669_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (44 + i.val) = _
  rw [node0044_0457, split_left 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0044_0236, split_left 140 node0044_0140 node0140_0236 (by omega)]
  rw [node0044_0140, split_left 76 block0669 node0076_0140 (by omega)]
  exact block0669_get i

theorem block0670_lookup (i : Fin 32) :
    lookup (76 + i.val) = some (values0670[i.val]'(by rw [values0670_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (76 + i.val) = _
  rw [node0044_0457, split_left 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0044_0236, split_left 140 node0044_0140 node0140_0236 (by omega)]
  rw [node0044_0140, split_right 76 block0669 node0076_0140 (by omega)]
  rw [node0076_0140, split_left 108 block0670 block0671 (by omega)]
  exact block0670_get i

theorem block0671_lookup (i : Fin 32) :
    lookup (108 + i.val) = some (values0671[i.val]'(by rw [values0671_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (108 + i.val) = _
  rw [node0044_0457, split_left 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0044_0236, split_left 140 node0044_0140 node0140_0236 (by omega)]
  rw [node0044_0140, split_right 76 block0669 node0076_0140 (by omega)]
  rw [node0076_0140, split_right 108 block0670 block0671 (by omega)]
  exact block0671_get i

theorem block0672_lookup (i : Fin 32) :
    lookup (140 + i.val) = some (values0672[i.val]'(by rw [values0672_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (140 + i.val) = _
  rw [node0044_0457, split_left 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0044_0236, split_right 140 node0044_0140 node0140_0236 (by omega)]
  rw [node0140_0236, split_left 172 block0672 node0172_0236 (by omega)]
  exact block0672_get i

theorem block0673_lookup (i : Fin 32) :
    lookup (172 + i.val) = some (values0673[i.val]'(by rw [values0673_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (172 + i.val) = _
  rw [node0044_0457, split_left 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0044_0236, split_right 140 node0044_0140 node0140_0236 (by omega)]
  rw [node0140_0236, split_right 172 block0672 node0172_0236 (by omega)]
  rw [node0172_0236, split_left 204 block0673 block0674 (by omega)]
  exact block0673_get i

theorem block0674_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values0674[i.val]'(by rw [values0674_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (204 + i.val) = _
  rw [node0044_0457, split_left 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0044_0236, split_right 140 node0044_0140 node0140_0236 (by omega)]
  rw [node0140_0236, split_right 172 block0672 node0172_0236 (by omega)]
  rw [node0172_0236, split_right 204 block0673 block0674 (by omega)]
  exact block0674_get i

theorem block0675_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values0675[i.val]'(by rw [values0675_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (236 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_left 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0236_0332, split_left 268 block0675 node0268_0332 (by omega)]
  exact block0675_get i

theorem block0676_lookup (i : Fin 32) :
    lookup (268 + i.val) = some (values0676[i.val]'(by rw [values0676_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (268 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_left 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0236_0332, split_right 268 block0675 node0268_0332 (by omega)]
  rw [node0268_0332, split_left 300 block0676 block0677 (by omega)]
  exact block0676_get i

theorem block0677_lookup (i : Fin 32) :
    lookup (300 + i.val) = some (values0677[i.val]'(by rw [values0677_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (300 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_left 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0236_0332, split_right 268 block0675 node0268_0332 (by omega)]
  rw [node0268_0332, split_right 300 block0676 block0677 (by omega)]
  exact block0677_get i

theorem block0678_lookup (i : Fin 32) :
    lookup (332 + i.val) = some (values0678[i.val]'(by rw [values0678_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (332 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_right 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0332_0457, split_left 396 node0332_0396 node0396_0457 (by omega)]
  rw [node0332_0396, split_left 364 block0678 block0679 (by omega)]
  exact block0678_get i

theorem block0679_lookup (i : Fin 32) :
    lookup (364 + i.val) = some (values0679[i.val]'(by rw [values0679_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (364 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_right 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0332_0457, split_left 396 node0332_0396 node0396_0457 (by omega)]
  rw [node0332_0396, split_right 364 block0678 block0679 (by omega)]
  exact block0679_get i

theorem block0680_lookup (i : Fin 32) :
    lookup (396 + i.val) = some (values0680[i.val]'(by rw [values0680_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (396 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_right 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0332_0457, split_right 396 node0332_0396 node0396_0457 (by omega)]
  rw [node0396_0457, split_left 428 block0680 block0681 (by omega)]
  exact block0680_get i

theorem block0681_lookup (i : Fin 29) :
    lookup (428 + i.val) = some (values0681[i.val]'(by rw [values0681_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0044_0457 (428 + i.val) = _
  rw [node0044_0457, split_right 236 node0044_0236 node0236_0457 (by omega)]
  rw [node0236_0457, split_right 332 node0236_0332 node0332_0457 (by omega)]
  rw [node0332_0457, split_right 396 node0332_0396 node0396_0457 (by omega)]
  rw [node0396_0457, split_right 428 block0680 block0681 (by omega)]
  exact block0681_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0669_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0669_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0670_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0670_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0671_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0671_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0672_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0672_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0673_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0673_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0674_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0674_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0675_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0675_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0676_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0676_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0677_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0677_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0678_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0678_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0679_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0679_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0680_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0680_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0681_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0681_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0669_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0670_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0671_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0672_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0673_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0674_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0675_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0676_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0677_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0678_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0679_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0680_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow045.block0681_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow045
