import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0642
import Grothe.UpperChaos.OriginalRow227TriangleData0643
import Grothe.UpperChaos.OriginalRow227TriangleData0644
import Grothe.UpperChaos.OriginalRow227TriangleData0645
import Grothe.UpperChaos.OriginalRow227TriangleData0646
import Grothe.UpperChaos.OriginalRow227TriangleData0647
import Grothe.UpperChaos.OriginalRow227TriangleData0648
import Grothe.UpperChaos.OriginalRow227TriangleData0649
import Grothe.UpperChaos.OriginalRow227TriangleData0650
import Grothe.UpperChaos.OriginalRow227TriangleData0651
import Grothe.UpperChaos.OriginalRow227TriangleData0652
import Grothe.UpperChaos.OriginalRow227TriangleData0653
import Grothe.UpperChaos.OriginalRow227TriangleData0654
import Grothe.UpperChaos.OriginalRow227TriangleData0655

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow043

open ConditionalTableLookup

def values0642 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0642.coefficient43_42,
  OriginalRow227TriangleData0642.coefficient43_43,
  OriginalRow227TriangleData0642.coefficient43_44,
  OriginalRow227TriangleData0642.coefficient43_45,
  OriginalRow227TriangleData0642.coefficient43_46,
  OriginalRow227TriangleData0642.coefficient43_47,
  OriginalRow227TriangleData0642.coefficient43_48,
  OriginalRow227TriangleData0642.coefficient43_49,
  OriginalRow227TriangleData0642.coefficient43_50,
  OriginalRow227TriangleData0642.coefficient43_51,
  OriginalRow227TriangleData0642.coefficient43_52,
  OriginalRow227TriangleData0642.coefficient43_53,
  OriginalRow227TriangleData0642.coefficient43_54,
  OriginalRow227TriangleData0642.coefficient43_55,
  OriginalRow227TriangleData0642.coefficient43_56,
  OriginalRow227TriangleData0642.coefficient43_57,
  OriginalRow227TriangleData0642.coefficient43_58,
  OriginalRow227TriangleData0642.coefficient43_59,
  OriginalRow227TriangleData0642.coefficient43_60,
  OriginalRow227TriangleData0642.coefficient43_61,
  OriginalRow227TriangleData0642.coefficient43_62,
  OriginalRow227TriangleData0642.coefficient43_63,
  OriginalRow227TriangleData0642.coefficient43_64,
  OriginalRow227TriangleData0642.coefficient43_65,
  OriginalRow227TriangleData0642.coefficient43_66,
  OriginalRow227TriangleData0642.coefficient43_67,
  OriginalRow227TriangleData0642.coefficient43_68,
  OriginalRow227TriangleData0642.coefficient43_69,
  OriginalRow227TriangleData0642.coefficient43_70,
  OriginalRow227TriangleData0642.coefficient43_71,
  OriginalRow227TriangleData0642.coefficient43_72,
  OriginalRow227TriangleData0642.coefficient43_73
]

theorem values0642_size : values0642.size = 32 := rfl

def block0642 : ℕ → Option IntervalDyadic := segment 42 values0642

theorem block0642_domain : ExactDomain block0642 42 74 := by
  simpa only [values0642_size] using segment_domain 42 values0642

theorem block0642_get (i : Fin 32) :
    block0642 (42 + i.val) = some (values0642[i.val]'(by rw [values0642_size]; exact i.isLt)) := by
  exact segment_get 42 values0642 ⟨i.val, by rw [values0642_size]; exact i.isLt⟩

def values0643 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0643.coefficient43_74,
  OriginalRow227TriangleData0643.coefficient43_75,
  OriginalRow227TriangleData0643.coefficient43_76,
  OriginalRow227TriangleData0643.coefficient43_77,
  OriginalRow227TriangleData0643.coefficient43_78,
  OriginalRow227TriangleData0643.coefficient43_79,
  OriginalRow227TriangleData0643.coefficient43_80,
  OriginalRow227TriangleData0643.coefficient43_81,
  OriginalRow227TriangleData0643.coefficient43_82,
  OriginalRow227TriangleData0643.coefficient43_83,
  OriginalRow227TriangleData0643.coefficient43_84,
  OriginalRow227TriangleData0643.coefficient43_85,
  OriginalRow227TriangleData0643.coefficient43_86,
  OriginalRow227TriangleData0643.coefficient43_87,
  OriginalRow227TriangleData0643.coefficient43_88,
  OriginalRow227TriangleData0643.coefficient43_89,
  OriginalRow227TriangleData0643.coefficient43_90,
  OriginalRow227TriangleData0643.coefficient43_91,
  OriginalRow227TriangleData0643.coefficient43_92,
  OriginalRow227TriangleData0643.coefficient43_93,
  OriginalRow227TriangleData0643.coefficient43_94,
  OriginalRow227TriangleData0643.coefficient43_95,
  OriginalRow227TriangleData0643.coefficient43_96,
  OriginalRow227TriangleData0643.coefficient43_97,
  OriginalRow227TriangleData0643.coefficient43_98,
  OriginalRow227TriangleData0643.coefficient43_99,
  OriginalRow227TriangleData0643.coefficient43_100,
  OriginalRow227TriangleData0643.coefficient43_101,
  OriginalRow227TriangleData0643.coefficient43_102,
  OriginalRow227TriangleData0643.coefficient43_103,
  OriginalRow227TriangleData0643.coefficient43_104,
  OriginalRow227TriangleData0643.coefficient43_105
]

theorem values0643_size : values0643.size = 32 := rfl

def block0643 : ℕ → Option IntervalDyadic := segment 74 values0643

theorem block0643_domain : ExactDomain block0643 74 106 := by
  simpa only [values0643_size] using segment_domain 74 values0643

theorem block0643_get (i : Fin 32) :
    block0643 (74 + i.val) = some (values0643[i.val]'(by rw [values0643_size]; exact i.isLt)) := by
  exact segment_get 74 values0643 ⟨i.val, by rw [values0643_size]; exact i.isLt⟩

def values0644 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0644.coefficient43_106,
  OriginalRow227TriangleData0644.coefficient43_107,
  OriginalRow227TriangleData0644.coefficient43_108,
  OriginalRow227TriangleData0644.coefficient43_109,
  OriginalRow227TriangleData0644.coefficient43_110,
  OriginalRow227TriangleData0644.coefficient43_111,
  OriginalRow227TriangleData0644.coefficient43_112,
  OriginalRow227TriangleData0644.coefficient43_113,
  OriginalRow227TriangleData0644.coefficient43_114,
  OriginalRow227TriangleData0644.coefficient43_115,
  OriginalRow227TriangleData0644.coefficient43_116,
  OriginalRow227TriangleData0644.coefficient43_117,
  OriginalRow227TriangleData0644.coefficient43_118,
  OriginalRow227TriangleData0644.coefficient43_119,
  OriginalRow227TriangleData0644.coefficient43_120,
  OriginalRow227TriangleData0644.coefficient43_121,
  OriginalRow227TriangleData0644.coefficient43_122,
  OriginalRow227TriangleData0644.coefficient43_123,
  OriginalRow227TriangleData0644.coefficient43_124,
  OriginalRow227TriangleData0644.coefficient43_125,
  OriginalRow227TriangleData0644.coefficient43_126,
  OriginalRow227TriangleData0644.coefficient43_127,
  OriginalRow227TriangleData0644.coefficient43_128,
  OriginalRow227TriangleData0644.coefficient43_129,
  OriginalRow227TriangleData0644.coefficient43_130,
  OriginalRow227TriangleData0644.coefficient43_131,
  OriginalRow227TriangleData0644.coefficient43_132,
  OriginalRow227TriangleData0644.coefficient43_133,
  OriginalRow227TriangleData0644.coefficient43_134,
  OriginalRow227TriangleData0644.coefficient43_135,
  OriginalRow227TriangleData0644.coefficient43_136,
  OriginalRow227TriangleData0644.coefficient43_137
]

theorem values0644_size : values0644.size = 32 := rfl

def block0644 : ℕ → Option IntervalDyadic := segment 106 values0644

theorem block0644_domain : ExactDomain block0644 106 138 := by
  simpa only [values0644_size] using segment_domain 106 values0644

theorem block0644_get (i : Fin 32) :
    block0644 (106 + i.val) = some (values0644[i.val]'(by rw [values0644_size]; exact i.isLt)) := by
  exact segment_get 106 values0644 ⟨i.val, by rw [values0644_size]; exact i.isLt⟩

def values0645 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0645.coefficient43_138,
  OriginalRow227TriangleData0645.coefficient43_139,
  OriginalRow227TriangleData0645.coefficient43_140,
  OriginalRow227TriangleData0645.coefficient43_141,
  OriginalRow227TriangleData0645.coefficient43_142,
  OriginalRow227TriangleData0645.coefficient43_143,
  OriginalRow227TriangleData0645.coefficient43_144,
  OriginalRow227TriangleData0645.coefficient43_145,
  OriginalRow227TriangleData0645.coefficient43_146,
  OriginalRow227TriangleData0645.coefficient43_147,
  OriginalRow227TriangleData0645.coefficient43_148,
  OriginalRow227TriangleData0645.coefficient43_149,
  OriginalRow227TriangleData0645.coefficient43_150,
  OriginalRow227TriangleData0645.coefficient43_151,
  OriginalRow227TriangleData0645.coefficient43_152,
  OriginalRow227TriangleData0645.coefficient43_153,
  OriginalRow227TriangleData0645.coefficient43_154,
  OriginalRow227TriangleData0645.coefficient43_155,
  OriginalRow227TriangleData0645.coefficient43_156,
  OriginalRow227TriangleData0645.coefficient43_157,
  OriginalRow227TriangleData0645.coefficient43_158,
  OriginalRow227TriangleData0645.coefficient43_159,
  OriginalRow227TriangleData0645.coefficient43_160,
  OriginalRow227TriangleData0645.coefficient43_161,
  OriginalRow227TriangleData0645.coefficient43_162,
  OriginalRow227TriangleData0645.coefficient43_163,
  OriginalRow227TriangleData0645.coefficient43_164,
  OriginalRow227TriangleData0645.coefficient43_165,
  OriginalRow227TriangleData0645.coefficient43_166,
  OriginalRow227TriangleData0645.coefficient43_167,
  OriginalRow227TriangleData0645.coefficient43_168,
  OriginalRow227TriangleData0645.coefficient43_169
]

theorem values0645_size : values0645.size = 32 := rfl

def block0645 : ℕ → Option IntervalDyadic := segment 138 values0645

theorem block0645_domain : ExactDomain block0645 138 170 := by
  simpa only [values0645_size] using segment_domain 138 values0645

theorem block0645_get (i : Fin 32) :
    block0645 (138 + i.val) = some (values0645[i.val]'(by rw [values0645_size]; exact i.isLt)) := by
  exact segment_get 138 values0645 ⟨i.val, by rw [values0645_size]; exact i.isLt⟩

def values0646 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0646.coefficient43_170,
  OriginalRow227TriangleData0646.coefficient43_171,
  OriginalRow227TriangleData0646.coefficient43_172,
  OriginalRow227TriangleData0646.coefficient43_173,
  OriginalRow227TriangleData0646.coefficient43_174,
  OriginalRow227TriangleData0646.coefficient43_175,
  OriginalRow227TriangleData0646.coefficient43_176,
  OriginalRow227TriangleData0646.coefficient43_177,
  OriginalRow227TriangleData0646.coefficient43_178,
  OriginalRow227TriangleData0646.coefficient43_179,
  OriginalRow227TriangleData0646.coefficient43_180,
  OriginalRow227TriangleData0646.coefficient43_181,
  OriginalRow227TriangleData0646.coefficient43_182,
  OriginalRow227TriangleData0646.coefficient43_183,
  OriginalRow227TriangleData0646.coefficient43_184,
  OriginalRow227TriangleData0646.coefficient43_185,
  OriginalRow227TriangleData0646.coefficient43_186,
  OriginalRow227TriangleData0646.coefficient43_187,
  OriginalRow227TriangleData0646.coefficient43_188,
  OriginalRow227TriangleData0646.coefficient43_189,
  OriginalRow227TriangleData0646.coefficient43_190,
  OriginalRow227TriangleData0646.coefficient43_191,
  OriginalRow227TriangleData0646.coefficient43_192,
  OriginalRow227TriangleData0646.coefficient43_193,
  OriginalRow227TriangleData0646.coefficient43_194,
  OriginalRow227TriangleData0646.coefficient43_195,
  OriginalRow227TriangleData0646.coefficient43_196,
  OriginalRow227TriangleData0646.coefficient43_197,
  OriginalRow227TriangleData0646.coefficient43_198,
  OriginalRow227TriangleData0646.coefficient43_199,
  OriginalRow227TriangleData0646.coefficient43_200,
  OriginalRow227TriangleData0646.coefficient43_201
]

theorem values0646_size : values0646.size = 32 := rfl

def block0646 : ℕ → Option IntervalDyadic := segment 170 values0646

theorem block0646_domain : ExactDomain block0646 170 202 := by
  simpa only [values0646_size] using segment_domain 170 values0646

theorem block0646_get (i : Fin 32) :
    block0646 (170 + i.val) = some (values0646[i.val]'(by rw [values0646_size]; exact i.isLt)) := by
  exact segment_get 170 values0646 ⟨i.val, by rw [values0646_size]; exact i.isLt⟩

def values0647 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0647.coefficient43_202,
  OriginalRow227TriangleData0647.coefficient43_203,
  OriginalRow227TriangleData0647.coefficient43_204,
  OriginalRow227TriangleData0647.coefficient43_205,
  OriginalRow227TriangleData0647.coefficient43_206,
  OriginalRow227TriangleData0647.coefficient43_207,
  OriginalRow227TriangleData0647.coefficient43_208,
  OriginalRow227TriangleData0647.coefficient43_209,
  OriginalRow227TriangleData0647.coefficient43_210,
  OriginalRow227TriangleData0647.coefficient43_211,
  OriginalRow227TriangleData0647.coefficient43_212,
  OriginalRow227TriangleData0647.coefficient43_213,
  OriginalRow227TriangleData0647.coefficient43_214,
  OriginalRow227TriangleData0647.coefficient43_215,
  OriginalRow227TriangleData0647.coefficient43_216,
  OriginalRow227TriangleData0647.coefficient43_217,
  OriginalRow227TriangleData0647.coefficient43_218,
  OriginalRow227TriangleData0647.coefficient43_219,
  OriginalRow227TriangleData0647.coefficient43_220,
  OriginalRow227TriangleData0647.coefficient43_221,
  OriginalRow227TriangleData0647.coefficient43_222,
  OriginalRow227TriangleData0647.coefficient43_223,
  OriginalRow227TriangleData0647.coefficient43_224,
  OriginalRow227TriangleData0647.coefficient43_225,
  OriginalRow227TriangleData0647.coefficient43_226,
  OriginalRow227TriangleData0647.coefficient43_227,
  OriginalRow227TriangleData0647.coefficient43_228,
  OriginalRow227TriangleData0647.coefficient43_229,
  OriginalRow227TriangleData0647.coefficient43_230,
  OriginalRow227TriangleData0647.coefficient43_231,
  OriginalRow227TriangleData0647.coefficient43_232,
  OriginalRow227TriangleData0647.coefficient43_233
]

theorem values0647_size : values0647.size = 32 := rfl

def block0647 : ℕ → Option IntervalDyadic := segment 202 values0647

theorem block0647_domain : ExactDomain block0647 202 234 := by
  simpa only [values0647_size] using segment_domain 202 values0647

theorem block0647_get (i : Fin 32) :
    block0647 (202 + i.val) = some (values0647[i.val]'(by rw [values0647_size]; exact i.isLt)) := by
  exact segment_get 202 values0647 ⟨i.val, by rw [values0647_size]; exact i.isLt⟩

def values0648 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0648.coefficient43_234,
  OriginalRow227TriangleData0648.coefficient43_235,
  OriginalRow227TriangleData0648.coefficient43_236,
  OriginalRow227TriangleData0648.coefficient43_237,
  OriginalRow227TriangleData0648.coefficient43_238,
  OriginalRow227TriangleData0648.coefficient43_239,
  OriginalRow227TriangleData0648.coefficient43_240,
  OriginalRow227TriangleData0648.coefficient43_241,
  OriginalRow227TriangleData0648.coefficient43_242,
  OriginalRow227TriangleData0648.coefficient43_243,
  OriginalRow227TriangleData0648.coefficient43_244,
  OriginalRow227TriangleData0648.coefficient43_245,
  OriginalRow227TriangleData0648.coefficient43_246,
  OriginalRow227TriangleData0648.coefficient43_247,
  OriginalRow227TriangleData0648.coefficient43_248,
  OriginalRow227TriangleData0648.coefficient43_249,
  OriginalRow227TriangleData0648.coefficient43_250,
  OriginalRow227TriangleData0648.coefficient43_251,
  OriginalRow227TriangleData0648.coefficient43_252,
  OriginalRow227TriangleData0648.coefficient43_253,
  OriginalRow227TriangleData0648.coefficient43_254,
  OriginalRow227TriangleData0648.coefficient43_255,
  OriginalRow227TriangleData0648.coefficient43_256,
  OriginalRow227TriangleData0648.coefficient43_257,
  OriginalRow227TriangleData0648.coefficient43_258,
  OriginalRow227TriangleData0648.coefficient43_259,
  OriginalRow227TriangleData0648.coefficient43_260,
  OriginalRow227TriangleData0648.coefficient43_261,
  OriginalRow227TriangleData0648.coefficient43_262,
  OriginalRow227TriangleData0648.coefficient43_263,
  OriginalRow227TriangleData0648.coefficient43_264,
  OriginalRow227TriangleData0648.coefficient43_265
]

theorem values0648_size : values0648.size = 32 := rfl

def block0648 : ℕ → Option IntervalDyadic := segment 234 values0648

theorem block0648_domain : ExactDomain block0648 234 266 := by
  simpa only [values0648_size] using segment_domain 234 values0648

theorem block0648_get (i : Fin 32) :
    block0648 (234 + i.val) = some (values0648[i.val]'(by rw [values0648_size]; exact i.isLt)) := by
  exact segment_get 234 values0648 ⟨i.val, by rw [values0648_size]; exact i.isLt⟩

def values0649 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0649.coefficient43_266,
  OriginalRow227TriangleData0649.coefficient43_267,
  OriginalRow227TriangleData0649.coefficient43_268,
  OriginalRow227TriangleData0649.coefficient43_269,
  OriginalRow227TriangleData0649.coefficient43_270,
  OriginalRow227TriangleData0649.coefficient43_271,
  OriginalRow227TriangleData0649.coefficient43_272,
  OriginalRow227TriangleData0649.coefficient43_273,
  OriginalRow227TriangleData0649.coefficient43_274,
  OriginalRow227TriangleData0649.coefficient43_275,
  OriginalRow227TriangleData0649.coefficient43_276,
  OriginalRow227TriangleData0649.coefficient43_277,
  OriginalRow227TriangleData0649.coefficient43_278,
  OriginalRow227TriangleData0649.coefficient43_279,
  OriginalRow227TriangleData0649.coefficient43_280,
  OriginalRow227TriangleData0649.coefficient43_281,
  OriginalRow227TriangleData0649.coefficient43_282,
  OriginalRow227TriangleData0649.coefficient43_283,
  OriginalRow227TriangleData0649.coefficient43_284,
  OriginalRow227TriangleData0649.coefficient43_285,
  OriginalRow227TriangleData0649.coefficient43_286,
  OriginalRow227TriangleData0649.coefficient43_287,
  OriginalRow227TriangleData0649.coefficient43_288,
  OriginalRow227TriangleData0649.coefficient43_289,
  OriginalRow227TriangleData0649.coefficient43_290,
  OriginalRow227TriangleData0649.coefficient43_291,
  OriginalRow227TriangleData0649.coefficient43_292,
  OriginalRow227TriangleData0649.coefficient43_293,
  OriginalRow227TriangleData0649.coefficient43_294,
  OriginalRow227TriangleData0649.coefficient43_295,
  OriginalRow227TriangleData0649.coefficient43_296,
  OriginalRow227TriangleData0649.coefficient43_297
]

theorem values0649_size : values0649.size = 32 := rfl

def block0649 : ℕ → Option IntervalDyadic := segment 266 values0649

theorem block0649_domain : ExactDomain block0649 266 298 := by
  simpa only [values0649_size] using segment_domain 266 values0649

theorem block0649_get (i : Fin 32) :
    block0649 (266 + i.val) = some (values0649[i.val]'(by rw [values0649_size]; exact i.isLt)) := by
  exact segment_get 266 values0649 ⟨i.val, by rw [values0649_size]; exact i.isLt⟩

def values0650 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0650.coefficient43_298,
  OriginalRow227TriangleData0650.coefficient43_299,
  OriginalRow227TriangleData0650.coefficient43_300,
  OriginalRow227TriangleData0650.coefficient43_301,
  OriginalRow227TriangleData0650.coefficient43_302,
  OriginalRow227TriangleData0650.coefficient43_303,
  OriginalRow227TriangleData0650.coefficient43_304,
  OriginalRow227TriangleData0650.coefficient43_305,
  OriginalRow227TriangleData0650.coefficient43_306,
  OriginalRow227TriangleData0650.coefficient43_307,
  OriginalRow227TriangleData0650.coefficient43_308,
  OriginalRow227TriangleData0650.coefficient43_309,
  OriginalRow227TriangleData0650.coefficient43_310,
  OriginalRow227TriangleData0650.coefficient43_311,
  OriginalRow227TriangleData0650.coefficient43_312,
  OriginalRow227TriangleData0650.coefficient43_313,
  OriginalRow227TriangleData0650.coefficient43_314,
  OriginalRow227TriangleData0650.coefficient43_315,
  OriginalRow227TriangleData0650.coefficient43_316,
  OriginalRow227TriangleData0650.coefficient43_317,
  OriginalRow227TriangleData0650.coefficient43_318,
  OriginalRow227TriangleData0650.coefficient43_319,
  OriginalRow227TriangleData0650.coefficient43_320,
  OriginalRow227TriangleData0650.coefficient43_321,
  OriginalRow227TriangleData0650.coefficient43_322,
  OriginalRow227TriangleData0650.coefficient43_323,
  OriginalRow227TriangleData0650.coefficient43_324,
  OriginalRow227TriangleData0650.coefficient43_325,
  OriginalRow227TriangleData0650.coefficient43_326,
  OriginalRow227TriangleData0650.coefficient43_327,
  OriginalRow227TriangleData0650.coefficient43_328,
  OriginalRow227TriangleData0650.coefficient43_329
]

theorem values0650_size : values0650.size = 32 := rfl

def block0650 : ℕ → Option IntervalDyadic := segment 298 values0650

theorem block0650_domain : ExactDomain block0650 298 330 := by
  simpa only [values0650_size] using segment_domain 298 values0650

theorem block0650_get (i : Fin 32) :
    block0650 (298 + i.val) = some (values0650[i.val]'(by rw [values0650_size]; exact i.isLt)) := by
  exact segment_get 298 values0650 ⟨i.val, by rw [values0650_size]; exact i.isLt⟩

def values0651 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0651.coefficient43_330,
  OriginalRow227TriangleData0651.coefficient43_331,
  OriginalRow227TriangleData0651.coefficient43_332,
  OriginalRow227TriangleData0651.coefficient43_333,
  OriginalRow227TriangleData0651.coefficient43_334,
  OriginalRow227TriangleData0651.coefficient43_335,
  OriginalRow227TriangleData0651.coefficient43_336,
  OriginalRow227TriangleData0651.coefficient43_337,
  OriginalRow227TriangleData0651.coefficient43_338,
  OriginalRow227TriangleData0651.coefficient43_339,
  OriginalRow227TriangleData0651.coefficient43_340,
  OriginalRow227TriangleData0651.coefficient43_341,
  OriginalRow227TriangleData0651.coefficient43_342,
  OriginalRow227TriangleData0651.coefficient43_343,
  OriginalRow227TriangleData0651.coefficient43_344,
  OriginalRow227TriangleData0651.coefficient43_345,
  OriginalRow227TriangleData0651.coefficient43_346,
  OriginalRow227TriangleData0651.coefficient43_347,
  OriginalRow227TriangleData0651.coefficient43_348,
  OriginalRow227TriangleData0651.coefficient43_349,
  OriginalRow227TriangleData0651.coefficient43_350,
  OriginalRow227TriangleData0651.coefficient43_351,
  OriginalRow227TriangleData0651.coefficient43_352,
  OriginalRow227TriangleData0651.coefficient43_353,
  OriginalRow227TriangleData0651.coefficient43_354,
  OriginalRow227TriangleData0651.coefficient43_355,
  OriginalRow227TriangleData0651.coefficient43_356,
  OriginalRow227TriangleData0651.coefficient43_357,
  OriginalRow227TriangleData0651.coefficient43_358,
  OriginalRow227TriangleData0651.coefficient43_359,
  OriginalRow227TriangleData0651.coefficient43_360,
  OriginalRow227TriangleData0651.coefficient43_361
]

theorem values0651_size : values0651.size = 32 := rfl

def block0651 : ℕ → Option IntervalDyadic := segment 330 values0651

theorem block0651_domain : ExactDomain block0651 330 362 := by
  simpa only [values0651_size] using segment_domain 330 values0651

theorem block0651_get (i : Fin 32) :
    block0651 (330 + i.val) = some (values0651[i.val]'(by rw [values0651_size]; exact i.isLt)) := by
  exact segment_get 330 values0651 ⟨i.val, by rw [values0651_size]; exact i.isLt⟩

def values0652 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0652.coefficient43_362,
  OriginalRow227TriangleData0652.coefficient43_363,
  OriginalRow227TriangleData0652.coefficient43_364,
  OriginalRow227TriangleData0652.coefficient43_365,
  OriginalRow227TriangleData0652.coefficient43_366,
  OriginalRow227TriangleData0652.coefficient43_367,
  OriginalRow227TriangleData0652.coefficient43_368,
  OriginalRow227TriangleData0652.coefficient43_369,
  OriginalRow227TriangleData0652.coefficient43_370,
  OriginalRow227TriangleData0652.coefficient43_371,
  OriginalRow227TriangleData0652.coefficient43_372,
  OriginalRow227TriangleData0652.coefficient43_373,
  OriginalRow227TriangleData0652.coefficient43_374,
  OriginalRow227TriangleData0652.coefficient43_375,
  OriginalRow227TriangleData0652.coefficient43_376,
  OriginalRow227TriangleData0652.coefficient43_377,
  OriginalRow227TriangleData0652.coefficient43_378,
  OriginalRow227TriangleData0652.coefficient43_379,
  OriginalRow227TriangleData0652.coefficient43_380,
  OriginalRow227TriangleData0652.coefficient43_381,
  OriginalRow227TriangleData0652.coefficient43_382,
  OriginalRow227TriangleData0652.coefficient43_383,
  OriginalRow227TriangleData0652.coefficient43_384,
  OriginalRow227TriangleData0652.coefficient43_385,
  OriginalRow227TriangleData0652.coefficient43_386,
  OriginalRow227TriangleData0652.coefficient43_387,
  OriginalRow227TriangleData0652.coefficient43_388,
  OriginalRow227TriangleData0652.coefficient43_389,
  OriginalRow227TriangleData0652.coefficient43_390,
  OriginalRow227TriangleData0652.coefficient43_391,
  OriginalRow227TriangleData0652.coefficient43_392,
  OriginalRow227TriangleData0652.coefficient43_393
]

theorem values0652_size : values0652.size = 32 := rfl

def block0652 : ℕ → Option IntervalDyadic := segment 362 values0652

theorem block0652_domain : ExactDomain block0652 362 394 := by
  simpa only [values0652_size] using segment_domain 362 values0652

theorem block0652_get (i : Fin 32) :
    block0652 (362 + i.val) = some (values0652[i.val]'(by rw [values0652_size]; exact i.isLt)) := by
  exact segment_get 362 values0652 ⟨i.val, by rw [values0652_size]; exact i.isLt⟩

def values0653 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0653.coefficient43_394,
  OriginalRow227TriangleData0653.coefficient43_395,
  OriginalRow227TriangleData0653.coefficient43_396,
  OriginalRow227TriangleData0653.coefficient43_397,
  OriginalRow227TriangleData0653.coefficient43_398,
  OriginalRow227TriangleData0653.coefficient43_399,
  OriginalRow227TriangleData0653.coefficient43_400,
  OriginalRow227TriangleData0653.coefficient43_401,
  OriginalRow227TriangleData0653.coefficient43_402,
  OriginalRow227TriangleData0653.coefficient43_403,
  OriginalRow227TriangleData0653.coefficient43_404,
  OriginalRow227TriangleData0653.coefficient43_405,
  OriginalRow227TriangleData0653.coefficient43_406,
  OriginalRow227TriangleData0653.coefficient43_407,
  OriginalRow227TriangleData0653.coefficient43_408,
  OriginalRow227TriangleData0653.coefficient43_409,
  OriginalRow227TriangleData0653.coefficient43_410,
  OriginalRow227TriangleData0653.coefficient43_411,
  OriginalRow227TriangleData0653.coefficient43_412,
  OriginalRow227TriangleData0653.coefficient43_413,
  OriginalRow227TriangleData0653.coefficient43_414,
  OriginalRow227TriangleData0653.coefficient43_415,
  OriginalRow227TriangleData0653.coefficient43_416,
  OriginalRow227TriangleData0653.coefficient43_417,
  OriginalRow227TriangleData0653.coefficient43_418,
  OriginalRow227TriangleData0653.coefficient43_419,
  OriginalRow227TriangleData0653.coefficient43_420,
  OriginalRow227TriangleData0653.coefficient43_421,
  OriginalRow227TriangleData0653.coefficient43_422,
  OriginalRow227TriangleData0653.coefficient43_423,
  OriginalRow227TriangleData0653.coefficient43_424,
  OriginalRow227TriangleData0653.coefficient43_425
]

theorem values0653_size : values0653.size = 32 := rfl

def block0653 : ℕ → Option IntervalDyadic := segment 394 values0653

theorem block0653_domain : ExactDomain block0653 394 426 := by
  simpa only [values0653_size] using segment_domain 394 values0653

theorem block0653_get (i : Fin 32) :
    block0653 (394 + i.val) = some (values0653[i.val]'(by rw [values0653_size]; exact i.isLt)) := by
  exact segment_get 394 values0653 ⟨i.val, by rw [values0653_size]; exact i.isLt⟩

def values0654 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0654.coefficient43_426,
  OriginalRow227TriangleData0654.coefficient43_427,
  OriginalRow227TriangleData0654.coefficient43_428,
  OriginalRow227TriangleData0654.coefficient43_429,
  OriginalRow227TriangleData0654.coefficient43_430,
  OriginalRow227TriangleData0654.coefficient43_431,
  OriginalRow227TriangleData0654.coefficient43_432,
  OriginalRow227TriangleData0654.coefficient43_433,
  OriginalRow227TriangleData0654.coefficient43_434,
  OriginalRow227TriangleData0654.coefficient43_435,
  OriginalRow227TriangleData0654.coefficient43_436,
  OriginalRow227TriangleData0654.coefficient43_437,
  OriginalRow227TriangleData0654.coefficient43_438,
  OriginalRow227TriangleData0654.coefficient43_439,
  OriginalRow227TriangleData0654.coefficient43_440,
  OriginalRow227TriangleData0654.coefficient43_441,
  OriginalRow227TriangleData0654.coefficient43_442,
  OriginalRow227TriangleData0654.coefficient43_443,
  OriginalRow227TriangleData0654.coefficient43_444,
  OriginalRow227TriangleData0654.coefficient43_445,
  OriginalRow227TriangleData0654.coefficient43_446,
  OriginalRow227TriangleData0654.coefficient43_447,
  OriginalRow227TriangleData0654.coefficient43_448,
  OriginalRow227TriangleData0654.coefficient43_449,
  OriginalRow227TriangleData0654.coefficient43_450,
  OriginalRow227TriangleData0654.coefficient43_451,
  OriginalRow227TriangleData0654.coefficient43_452,
  OriginalRow227TriangleData0654.coefficient43_453,
  OriginalRow227TriangleData0654.coefficient43_454,
  OriginalRow227TriangleData0654.coefficient43_455,
  OriginalRow227TriangleData0654.coefficient43_456,
  OriginalRow227TriangleData0654.coefficient43_457
]

theorem values0654_size : values0654.size = 32 := rfl

def block0654 : ℕ → Option IntervalDyadic := segment 426 values0654

theorem block0654_domain : ExactDomain block0654 426 458 := by
  simpa only [values0654_size] using segment_domain 426 values0654

theorem block0654_get (i : Fin 32) :
    block0654 (426 + i.val) = some (values0654[i.val]'(by rw [values0654_size]; exact i.isLt)) := by
  exact segment_get 426 values0654 ⟨i.val, by rw [values0654_size]; exact i.isLt⟩

def values0655 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0655.coefficient43_458
]

theorem values0655_size : values0655.size = 1 := rfl

def block0655 : ℕ → Option IntervalDyadic := segment 458 values0655

theorem block0655_domain : ExactDomain block0655 458 459 := by
  simpa only [values0655_size] using segment_domain 458 values0655

theorem block0655_get (i : Fin 1) :
    block0655 (458 + i.val) = some (values0655[i.val]'(by rw [values0655_size]; exact i.isLt)) := by
  exact segment_get 458 values0655 ⟨i.val, by rw [values0655_size]; exact i.isLt⟩

def node0074_0138 : ℕ → Option IntervalDyadic := split 106 block0643 block0644

theorem node0074_0138_domain : ExactDomain node0074_0138 74 138 := by
  exact split_domain (by decide) (by decide) block0643_domain block0644_domain

def node0042_0138 : ℕ → Option IntervalDyadic := split 74 block0642 node0074_0138

theorem node0042_0138_domain : ExactDomain node0042_0138 42 138 := by
  exact split_domain (by decide) (by decide) block0642_domain node0074_0138_domain

def node0138_0202 : ℕ → Option IntervalDyadic := split 170 block0645 block0646

theorem node0138_0202_domain : ExactDomain node0138_0202 138 202 := by
  exact split_domain (by decide) (by decide) block0645_domain block0646_domain

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block0647 block0648

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block0647_domain block0648_domain

def node0138_0266 : ℕ → Option IntervalDyadic := split 202 node0138_0202 node0202_0266

theorem node0138_0266_domain : ExactDomain node0138_0266 138 266 := by
  exact split_domain (by decide) (by decide) node0138_0202_domain node0202_0266_domain

def node0042_0266 : ℕ → Option IntervalDyadic := split 138 node0042_0138 node0138_0266

theorem node0042_0266_domain : ExactDomain node0042_0266 42 266 := by
  exact split_domain (by decide) (by decide) node0042_0138_domain node0138_0266_domain

def node0298_0362 : ℕ → Option IntervalDyadic := split 330 block0650 block0651

theorem node0298_0362_domain : ExactDomain node0298_0362 298 362 := by
  exact split_domain (by decide) (by decide) block0650_domain block0651_domain

def node0266_0362 : ℕ → Option IntervalDyadic := split 298 block0649 node0298_0362

theorem node0266_0362_domain : ExactDomain node0266_0362 266 362 := by
  exact split_domain (by decide) (by decide) block0649_domain node0298_0362_domain

def node0362_0426 : ℕ → Option IntervalDyadic := split 394 block0652 block0653

theorem node0362_0426_domain : ExactDomain node0362_0426 362 426 := by
  exact split_domain (by decide) (by decide) block0652_domain block0653_domain

def node0426_0459 : ℕ → Option IntervalDyadic := split 458 block0654 block0655

theorem node0426_0459_domain : ExactDomain node0426_0459 426 459 := by
  exact split_domain (by decide) (by decide) block0654_domain block0655_domain

def node0362_0459 : ℕ → Option IntervalDyadic := split 426 node0362_0426 node0426_0459

theorem node0362_0459_domain : ExactDomain node0362_0459 362 459 := by
  exact split_domain (by decide) (by decide) node0362_0426_domain node0426_0459_domain

def node0266_0459 : ℕ → Option IntervalDyadic := split 362 node0266_0362 node0362_0459

theorem node0266_0459_domain : ExactDomain node0266_0459 266 459 := by
  exact split_domain (by decide) (by decide) node0266_0362_domain node0362_0459_domain

def node0042_0459 : ℕ → Option IntervalDyadic := split 266 node0042_0266 node0266_0459

theorem node0042_0459_domain : ExactDomain node0042_0459 42 459 := by
  exact split_domain (by decide) (by decide) node0042_0266_domain node0266_0459_domain

def lookup : ℕ → Option IntervalDyadic := node0042_0459

theorem lookup_domain : ExactDomain lookup 42 459 :=
  node0042_0459_domain

theorem block0642_lookup (i : Fin 32) :
    lookup (42 + i.val) = some (values0642[i.val]'(by rw [values0642_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (42 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_left 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0042_0138, split_left 74 block0642 node0074_0138 (by omega)]
  exact block0642_get i

theorem block0643_lookup (i : Fin 32) :
    lookup (74 + i.val) = some (values0643[i.val]'(by rw [values0643_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (74 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_left 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0042_0138, split_right 74 block0642 node0074_0138 (by omega)]
  rw [node0074_0138, split_left 106 block0643 block0644 (by omega)]
  exact block0643_get i

theorem block0644_lookup (i : Fin 32) :
    lookup (106 + i.val) = some (values0644[i.val]'(by rw [values0644_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (106 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_left 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0042_0138, split_right 74 block0642 node0074_0138 (by omega)]
  rw [node0074_0138, split_right 106 block0643 block0644 (by omega)]
  exact block0644_get i

theorem block0645_lookup (i : Fin 32) :
    lookup (138 + i.val) = some (values0645[i.val]'(by rw [values0645_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (138 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_right 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_left 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0138_0202, split_left 170 block0645 block0646 (by omega)]
  exact block0645_get i

theorem block0646_lookup (i : Fin 32) :
    lookup (170 + i.val) = some (values0646[i.val]'(by rw [values0646_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (170 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_right 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_left 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0138_0202, split_right 170 block0645 block0646 (by omega)]
  exact block0646_get i

theorem block0647_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values0647[i.val]'(by rw [values0647_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (202 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_right 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_right 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0202_0266, split_left 234 block0647 block0648 (by omega)]
  exact block0647_get i

theorem block0648_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values0648[i.val]'(by rw [values0648_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (234 + i.val) = _
  rw [node0042_0459, split_left 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0042_0266, split_right 138 node0042_0138 node0138_0266 (by omega)]
  rw [node0138_0266, split_right 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0202_0266, split_right 234 block0647 block0648 (by omega)]
  exact block0648_get i

theorem block0649_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values0649[i.val]'(by rw [values0649_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (266 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_left 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0266_0362, split_left 298 block0649 node0298_0362 (by omega)]
  exact block0649_get i

theorem block0650_lookup (i : Fin 32) :
    lookup (298 + i.val) = some (values0650[i.val]'(by rw [values0650_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (298 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_left 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0266_0362, split_right 298 block0649 node0298_0362 (by omega)]
  rw [node0298_0362, split_left 330 block0650 block0651 (by omega)]
  exact block0650_get i

theorem block0651_lookup (i : Fin 32) :
    lookup (330 + i.val) = some (values0651[i.val]'(by rw [values0651_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (330 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_left 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0266_0362, split_right 298 block0649 node0298_0362 (by omega)]
  rw [node0298_0362, split_right 330 block0650 block0651 (by omega)]
  exact block0651_get i

theorem block0652_lookup (i : Fin 32) :
    lookup (362 + i.val) = some (values0652[i.val]'(by rw [values0652_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (362 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_right 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0362_0459, split_left 426 node0362_0426 node0426_0459 (by omega)]
  rw [node0362_0426, split_left 394 block0652 block0653 (by omega)]
  exact block0652_get i

theorem block0653_lookup (i : Fin 32) :
    lookup (394 + i.val) = some (values0653[i.val]'(by rw [values0653_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (394 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_right 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0362_0459, split_left 426 node0362_0426 node0426_0459 (by omega)]
  rw [node0362_0426, split_right 394 block0652 block0653 (by omega)]
  exact block0653_get i

theorem block0654_lookup (i : Fin 32) :
    lookup (426 + i.val) = some (values0654[i.val]'(by rw [values0654_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (426 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_right 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0362_0459, split_right 426 node0362_0426 node0426_0459 (by omega)]
  rw [node0426_0459, split_left 458 block0654 block0655 (by omega)]
  exact block0654_get i

theorem block0655_lookup (i : Fin 1) :
    lookup (458 + i.val) = some (values0655[i.val]'(by rw [values0655_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0042_0459 (458 + i.val) = _
  rw [node0042_0459, split_right 266 node0042_0266 node0266_0459 (by omega)]
  rw [node0266_0459, split_right 362 node0266_0362 node0362_0459 (by omega)]
  rw [node0362_0459, split_right 426 node0362_0426 node0426_0459 (by omega)]
  rw [node0426_0459, split_right 458 block0654 block0655 (by omega)]
  exact block0655_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0642_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0642_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0643_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0643_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0644_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0644_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0645_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0645_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0646_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0646_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0647_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0647_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0648_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0648_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0649_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0649_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0650_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0650_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0651_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0651_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0652_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0652_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0653_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0653_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0654_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0654_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0655_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0655_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0642_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0643_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0644_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0645_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0646_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0647_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0648_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0649_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0650_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0651_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0652_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0653_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0654_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow043.block0655_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow043
