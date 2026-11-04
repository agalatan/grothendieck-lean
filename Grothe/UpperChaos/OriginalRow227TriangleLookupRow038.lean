import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0572
import Grothe.UpperChaos.OriginalRow227TriangleData0573
import Grothe.UpperChaos.OriginalRow227TriangleData0574
import Grothe.UpperChaos.OriginalRow227TriangleData0575
import Grothe.UpperChaos.OriginalRow227TriangleData0576
import Grothe.UpperChaos.OriginalRow227TriangleData0577
import Grothe.UpperChaos.OriginalRow227TriangleData0578
import Grothe.UpperChaos.OriginalRow227TriangleData0579
import Grothe.UpperChaos.OriginalRow227TriangleData0580
import Grothe.UpperChaos.OriginalRow227TriangleData0581
import Grothe.UpperChaos.OriginalRow227TriangleData0582
import Grothe.UpperChaos.OriginalRow227TriangleData0583
import Grothe.UpperChaos.OriginalRow227TriangleData0584
import Grothe.UpperChaos.OriginalRow227TriangleData0585

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow038

open ConditionalTableLookup

def values0572 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0572.coefficient38_37,
  OriginalRow227TriangleData0572.coefficient38_38,
  OriginalRow227TriangleData0572.coefficient38_39,
  OriginalRow227TriangleData0572.coefficient38_40,
  OriginalRow227TriangleData0572.coefficient38_41,
  OriginalRow227TriangleData0572.coefficient38_42,
  OriginalRow227TriangleData0572.coefficient38_43,
  OriginalRow227TriangleData0572.coefficient38_44,
  OriginalRow227TriangleData0572.coefficient38_45,
  OriginalRow227TriangleData0572.coefficient38_46,
  OriginalRow227TriangleData0572.coefficient38_47,
  OriginalRow227TriangleData0572.coefficient38_48,
  OriginalRow227TriangleData0572.coefficient38_49,
  OriginalRow227TriangleData0572.coefficient38_50,
  OriginalRow227TriangleData0572.coefficient38_51,
  OriginalRow227TriangleData0572.coefficient38_52,
  OriginalRow227TriangleData0572.coefficient38_53,
  OriginalRow227TriangleData0572.coefficient38_54,
  OriginalRow227TriangleData0572.coefficient38_55,
  OriginalRow227TriangleData0572.coefficient38_56,
  OriginalRow227TriangleData0572.coefficient38_57,
  OriginalRow227TriangleData0572.coefficient38_58,
  OriginalRow227TriangleData0572.coefficient38_59,
  OriginalRow227TriangleData0572.coefficient38_60,
  OriginalRow227TriangleData0572.coefficient38_61,
  OriginalRow227TriangleData0572.coefficient38_62,
  OriginalRow227TriangleData0572.coefficient38_63,
  OriginalRow227TriangleData0572.coefficient38_64,
  OriginalRow227TriangleData0572.coefficient38_65,
  OriginalRow227TriangleData0572.coefficient38_66,
  OriginalRow227TriangleData0572.coefficient38_67,
  OriginalRow227TriangleData0572.coefficient38_68
]

theorem values0572_size : values0572.size = 32 := rfl

def block0572 : ℕ → Option IntervalDyadic := segment 37 values0572

theorem block0572_domain : ExactDomain block0572 37 69 := by
  simpa only [values0572_size] using segment_domain 37 values0572

theorem block0572_get (i : Fin 32) :
    block0572 (37 + i.val) = some (values0572[i.val]'(by rw [values0572_size]; exact i.isLt)) := by
  exact segment_get 37 values0572 ⟨i.val, by rw [values0572_size]; exact i.isLt⟩

def values0573 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0573.coefficient38_69,
  OriginalRow227TriangleData0573.coefficient38_70,
  OriginalRow227TriangleData0573.coefficient38_71,
  OriginalRow227TriangleData0573.coefficient38_72,
  OriginalRow227TriangleData0573.coefficient38_73,
  OriginalRow227TriangleData0573.coefficient38_74,
  OriginalRow227TriangleData0573.coefficient38_75,
  OriginalRow227TriangleData0573.coefficient38_76,
  OriginalRow227TriangleData0573.coefficient38_77,
  OriginalRow227TriangleData0573.coefficient38_78,
  OriginalRow227TriangleData0573.coefficient38_79,
  OriginalRow227TriangleData0573.coefficient38_80,
  OriginalRow227TriangleData0573.coefficient38_81,
  OriginalRow227TriangleData0573.coefficient38_82,
  OriginalRow227TriangleData0573.coefficient38_83,
  OriginalRow227TriangleData0573.coefficient38_84,
  OriginalRow227TriangleData0573.coefficient38_85,
  OriginalRow227TriangleData0573.coefficient38_86,
  OriginalRow227TriangleData0573.coefficient38_87,
  OriginalRow227TriangleData0573.coefficient38_88,
  OriginalRow227TriangleData0573.coefficient38_89,
  OriginalRow227TriangleData0573.coefficient38_90,
  OriginalRow227TriangleData0573.coefficient38_91,
  OriginalRow227TriangleData0573.coefficient38_92,
  OriginalRow227TriangleData0573.coefficient38_93,
  OriginalRow227TriangleData0573.coefficient38_94,
  OriginalRow227TriangleData0573.coefficient38_95,
  OriginalRow227TriangleData0573.coefficient38_96,
  OriginalRow227TriangleData0573.coefficient38_97,
  OriginalRow227TriangleData0573.coefficient38_98,
  OriginalRow227TriangleData0573.coefficient38_99,
  OriginalRow227TriangleData0573.coefficient38_100
]

theorem values0573_size : values0573.size = 32 := rfl

def block0573 : ℕ → Option IntervalDyadic := segment 69 values0573

theorem block0573_domain : ExactDomain block0573 69 101 := by
  simpa only [values0573_size] using segment_domain 69 values0573

theorem block0573_get (i : Fin 32) :
    block0573 (69 + i.val) = some (values0573[i.val]'(by rw [values0573_size]; exact i.isLt)) := by
  exact segment_get 69 values0573 ⟨i.val, by rw [values0573_size]; exact i.isLt⟩

def values0574 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0574.coefficient38_101,
  OriginalRow227TriangleData0574.coefficient38_102,
  OriginalRow227TriangleData0574.coefficient38_103,
  OriginalRow227TriangleData0574.coefficient38_104,
  OriginalRow227TriangleData0574.coefficient38_105,
  OriginalRow227TriangleData0574.coefficient38_106,
  OriginalRow227TriangleData0574.coefficient38_107,
  OriginalRow227TriangleData0574.coefficient38_108,
  OriginalRow227TriangleData0574.coefficient38_109,
  OriginalRow227TriangleData0574.coefficient38_110,
  OriginalRow227TriangleData0574.coefficient38_111,
  OriginalRow227TriangleData0574.coefficient38_112,
  OriginalRow227TriangleData0574.coefficient38_113,
  OriginalRow227TriangleData0574.coefficient38_114,
  OriginalRow227TriangleData0574.coefficient38_115,
  OriginalRow227TriangleData0574.coefficient38_116,
  OriginalRow227TriangleData0574.coefficient38_117,
  OriginalRow227TriangleData0574.coefficient38_118,
  OriginalRow227TriangleData0574.coefficient38_119,
  OriginalRow227TriangleData0574.coefficient38_120,
  OriginalRow227TriangleData0574.coefficient38_121,
  OriginalRow227TriangleData0574.coefficient38_122,
  OriginalRow227TriangleData0574.coefficient38_123,
  OriginalRow227TriangleData0574.coefficient38_124,
  OriginalRow227TriangleData0574.coefficient38_125,
  OriginalRow227TriangleData0574.coefficient38_126,
  OriginalRow227TriangleData0574.coefficient38_127,
  OriginalRow227TriangleData0574.coefficient38_128,
  OriginalRow227TriangleData0574.coefficient38_129,
  OriginalRow227TriangleData0574.coefficient38_130,
  OriginalRow227TriangleData0574.coefficient38_131,
  OriginalRow227TriangleData0574.coefficient38_132
]

theorem values0574_size : values0574.size = 32 := rfl

def block0574 : ℕ → Option IntervalDyadic := segment 101 values0574

theorem block0574_domain : ExactDomain block0574 101 133 := by
  simpa only [values0574_size] using segment_domain 101 values0574

theorem block0574_get (i : Fin 32) :
    block0574 (101 + i.val) = some (values0574[i.val]'(by rw [values0574_size]; exact i.isLt)) := by
  exact segment_get 101 values0574 ⟨i.val, by rw [values0574_size]; exact i.isLt⟩

def values0575 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0575.coefficient38_133,
  OriginalRow227TriangleData0575.coefficient38_134,
  OriginalRow227TriangleData0575.coefficient38_135,
  OriginalRow227TriangleData0575.coefficient38_136,
  OriginalRow227TriangleData0575.coefficient38_137,
  OriginalRow227TriangleData0575.coefficient38_138,
  OriginalRow227TriangleData0575.coefficient38_139,
  OriginalRow227TriangleData0575.coefficient38_140,
  OriginalRow227TriangleData0575.coefficient38_141,
  OriginalRow227TriangleData0575.coefficient38_142,
  OriginalRow227TriangleData0575.coefficient38_143,
  OriginalRow227TriangleData0575.coefficient38_144,
  OriginalRow227TriangleData0575.coefficient38_145,
  OriginalRow227TriangleData0575.coefficient38_146,
  OriginalRow227TriangleData0575.coefficient38_147,
  OriginalRow227TriangleData0575.coefficient38_148,
  OriginalRow227TriangleData0575.coefficient38_149,
  OriginalRow227TriangleData0575.coefficient38_150,
  OriginalRow227TriangleData0575.coefficient38_151,
  OriginalRow227TriangleData0575.coefficient38_152,
  OriginalRow227TriangleData0575.coefficient38_153,
  OriginalRow227TriangleData0575.coefficient38_154,
  OriginalRow227TriangleData0575.coefficient38_155,
  OriginalRow227TriangleData0575.coefficient38_156,
  OriginalRow227TriangleData0575.coefficient38_157,
  OriginalRow227TriangleData0575.coefficient38_158,
  OriginalRow227TriangleData0575.coefficient38_159,
  OriginalRow227TriangleData0575.coefficient38_160,
  OriginalRow227TriangleData0575.coefficient38_161,
  OriginalRow227TriangleData0575.coefficient38_162,
  OriginalRow227TriangleData0575.coefficient38_163,
  OriginalRow227TriangleData0575.coefficient38_164
]

theorem values0575_size : values0575.size = 32 := rfl

def block0575 : ℕ → Option IntervalDyadic := segment 133 values0575

theorem block0575_domain : ExactDomain block0575 133 165 := by
  simpa only [values0575_size] using segment_domain 133 values0575

theorem block0575_get (i : Fin 32) :
    block0575 (133 + i.val) = some (values0575[i.val]'(by rw [values0575_size]; exact i.isLt)) := by
  exact segment_get 133 values0575 ⟨i.val, by rw [values0575_size]; exact i.isLt⟩

def values0576 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0576.coefficient38_165,
  OriginalRow227TriangleData0576.coefficient38_166,
  OriginalRow227TriangleData0576.coefficient38_167,
  OriginalRow227TriangleData0576.coefficient38_168,
  OriginalRow227TriangleData0576.coefficient38_169,
  OriginalRow227TriangleData0576.coefficient38_170,
  OriginalRow227TriangleData0576.coefficient38_171,
  OriginalRow227TriangleData0576.coefficient38_172,
  OriginalRow227TriangleData0576.coefficient38_173,
  OriginalRow227TriangleData0576.coefficient38_174,
  OriginalRow227TriangleData0576.coefficient38_175,
  OriginalRow227TriangleData0576.coefficient38_176,
  OriginalRow227TriangleData0576.coefficient38_177,
  OriginalRow227TriangleData0576.coefficient38_178,
  OriginalRow227TriangleData0576.coefficient38_179,
  OriginalRow227TriangleData0576.coefficient38_180,
  OriginalRow227TriangleData0576.coefficient38_181,
  OriginalRow227TriangleData0576.coefficient38_182,
  OriginalRow227TriangleData0576.coefficient38_183,
  OriginalRow227TriangleData0576.coefficient38_184,
  OriginalRow227TriangleData0576.coefficient38_185,
  OriginalRow227TriangleData0576.coefficient38_186,
  OriginalRow227TriangleData0576.coefficient38_187,
  OriginalRow227TriangleData0576.coefficient38_188,
  OriginalRow227TriangleData0576.coefficient38_189,
  OriginalRow227TriangleData0576.coefficient38_190,
  OriginalRow227TriangleData0576.coefficient38_191,
  OriginalRow227TriangleData0576.coefficient38_192,
  OriginalRow227TriangleData0576.coefficient38_193,
  OriginalRow227TriangleData0576.coefficient38_194,
  OriginalRow227TriangleData0576.coefficient38_195,
  OriginalRow227TriangleData0576.coefficient38_196
]

theorem values0576_size : values0576.size = 32 := rfl

def block0576 : ℕ → Option IntervalDyadic := segment 165 values0576

theorem block0576_domain : ExactDomain block0576 165 197 := by
  simpa only [values0576_size] using segment_domain 165 values0576

theorem block0576_get (i : Fin 32) :
    block0576 (165 + i.val) = some (values0576[i.val]'(by rw [values0576_size]; exact i.isLt)) := by
  exact segment_get 165 values0576 ⟨i.val, by rw [values0576_size]; exact i.isLt⟩

def values0577 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0577.coefficient38_197,
  OriginalRow227TriangleData0577.coefficient38_198,
  OriginalRow227TriangleData0577.coefficient38_199,
  OriginalRow227TriangleData0577.coefficient38_200,
  OriginalRow227TriangleData0577.coefficient38_201,
  OriginalRow227TriangleData0577.coefficient38_202,
  OriginalRow227TriangleData0577.coefficient38_203,
  OriginalRow227TriangleData0577.coefficient38_204,
  OriginalRow227TriangleData0577.coefficient38_205,
  OriginalRow227TriangleData0577.coefficient38_206,
  OriginalRow227TriangleData0577.coefficient38_207,
  OriginalRow227TriangleData0577.coefficient38_208,
  OriginalRow227TriangleData0577.coefficient38_209,
  OriginalRow227TriangleData0577.coefficient38_210,
  OriginalRow227TriangleData0577.coefficient38_211,
  OriginalRow227TriangleData0577.coefficient38_212,
  OriginalRow227TriangleData0577.coefficient38_213,
  OriginalRow227TriangleData0577.coefficient38_214,
  OriginalRow227TriangleData0577.coefficient38_215,
  OriginalRow227TriangleData0577.coefficient38_216,
  OriginalRow227TriangleData0577.coefficient38_217,
  OriginalRow227TriangleData0577.coefficient38_218,
  OriginalRow227TriangleData0577.coefficient38_219,
  OriginalRow227TriangleData0577.coefficient38_220,
  OriginalRow227TriangleData0577.coefficient38_221,
  OriginalRow227TriangleData0577.coefficient38_222,
  OriginalRow227TriangleData0577.coefficient38_223,
  OriginalRow227TriangleData0577.coefficient38_224,
  OriginalRow227TriangleData0577.coefficient38_225,
  OriginalRow227TriangleData0577.coefficient38_226,
  OriginalRow227TriangleData0577.coefficient38_227,
  OriginalRow227TriangleData0577.coefficient38_228
]

theorem values0577_size : values0577.size = 32 := rfl

def block0577 : ℕ → Option IntervalDyadic := segment 197 values0577

theorem block0577_domain : ExactDomain block0577 197 229 := by
  simpa only [values0577_size] using segment_domain 197 values0577

theorem block0577_get (i : Fin 32) :
    block0577 (197 + i.val) = some (values0577[i.val]'(by rw [values0577_size]; exact i.isLt)) := by
  exact segment_get 197 values0577 ⟨i.val, by rw [values0577_size]; exact i.isLt⟩

def values0578 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0578.coefficient38_229,
  OriginalRow227TriangleData0578.coefficient38_230,
  OriginalRow227TriangleData0578.coefficient38_231,
  OriginalRow227TriangleData0578.coefficient38_232,
  OriginalRow227TriangleData0578.coefficient38_233,
  OriginalRow227TriangleData0578.coefficient38_234,
  OriginalRow227TriangleData0578.coefficient38_235,
  OriginalRow227TriangleData0578.coefficient38_236,
  OriginalRow227TriangleData0578.coefficient38_237,
  OriginalRow227TriangleData0578.coefficient38_238,
  OriginalRow227TriangleData0578.coefficient38_239,
  OriginalRow227TriangleData0578.coefficient38_240,
  OriginalRow227TriangleData0578.coefficient38_241,
  OriginalRow227TriangleData0578.coefficient38_242,
  OriginalRow227TriangleData0578.coefficient38_243,
  OriginalRow227TriangleData0578.coefficient38_244,
  OriginalRow227TriangleData0578.coefficient38_245,
  OriginalRow227TriangleData0578.coefficient38_246,
  OriginalRow227TriangleData0578.coefficient38_247,
  OriginalRow227TriangleData0578.coefficient38_248,
  OriginalRow227TriangleData0578.coefficient38_249,
  OriginalRow227TriangleData0578.coefficient38_250,
  OriginalRow227TriangleData0578.coefficient38_251,
  OriginalRow227TriangleData0578.coefficient38_252,
  OriginalRow227TriangleData0578.coefficient38_253,
  OriginalRow227TriangleData0578.coefficient38_254,
  OriginalRow227TriangleData0578.coefficient38_255,
  OriginalRow227TriangleData0578.coefficient38_256,
  OriginalRow227TriangleData0578.coefficient38_257,
  OriginalRow227TriangleData0578.coefficient38_258,
  OriginalRow227TriangleData0578.coefficient38_259,
  OriginalRow227TriangleData0578.coefficient38_260
]

theorem values0578_size : values0578.size = 32 := rfl

def block0578 : ℕ → Option IntervalDyadic := segment 229 values0578

theorem block0578_domain : ExactDomain block0578 229 261 := by
  simpa only [values0578_size] using segment_domain 229 values0578

theorem block0578_get (i : Fin 32) :
    block0578 (229 + i.val) = some (values0578[i.val]'(by rw [values0578_size]; exact i.isLt)) := by
  exact segment_get 229 values0578 ⟨i.val, by rw [values0578_size]; exact i.isLt⟩

def values0579 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0579.coefficient38_261,
  OriginalRow227TriangleData0579.coefficient38_262,
  OriginalRow227TriangleData0579.coefficient38_263,
  OriginalRow227TriangleData0579.coefficient38_264,
  OriginalRow227TriangleData0579.coefficient38_265,
  OriginalRow227TriangleData0579.coefficient38_266,
  OriginalRow227TriangleData0579.coefficient38_267,
  OriginalRow227TriangleData0579.coefficient38_268,
  OriginalRow227TriangleData0579.coefficient38_269,
  OriginalRow227TriangleData0579.coefficient38_270,
  OriginalRow227TriangleData0579.coefficient38_271,
  OriginalRow227TriangleData0579.coefficient38_272,
  OriginalRow227TriangleData0579.coefficient38_273,
  OriginalRow227TriangleData0579.coefficient38_274,
  OriginalRow227TriangleData0579.coefficient38_275,
  OriginalRow227TriangleData0579.coefficient38_276,
  OriginalRow227TriangleData0579.coefficient38_277,
  OriginalRow227TriangleData0579.coefficient38_278,
  OriginalRow227TriangleData0579.coefficient38_279,
  OriginalRow227TriangleData0579.coefficient38_280,
  OriginalRow227TriangleData0579.coefficient38_281,
  OriginalRow227TriangleData0579.coefficient38_282,
  OriginalRow227TriangleData0579.coefficient38_283,
  OriginalRow227TriangleData0579.coefficient38_284,
  OriginalRow227TriangleData0579.coefficient38_285,
  OriginalRow227TriangleData0579.coefficient38_286,
  OriginalRow227TriangleData0579.coefficient38_287,
  OriginalRow227TriangleData0579.coefficient38_288,
  OriginalRow227TriangleData0579.coefficient38_289,
  OriginalRow227TriangleData0579.coefficient38_290,
  OriginalRow227TriangleData0579.coefficient38_291,
  OriginalRow227TriangleData0579.coefficient38_292
]

theorem values0579_size : values0579.size = 32 := rfl

def block0579 : ℕ → Option IntervalDyadic := segment 261 values0579

theorem block0579_domain : ExactDomain block0579 261 293 := by
  simpa only [values0579_size] using segment_domain 261 values0579

theorem block0579_get (i : Fin 32) :
    block0579 (261 + i.val) = some (values0579[i.val]'(by rw [values0579_size]; exact i.isLt)) := by
  exact segment_get 261 values0579 ⟨i.val, by rw [values0579_size]; exact i.isLt⟩

def values0580 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0580.coefficient38_293,
  OriginalRow227TriangleData0580.coefficient38_294,
  OriginalRow227TriangleData0580.coefficient38_295,
  OriginalRow227TriangleData0580.coefficient38_296,
  OriginalRow227TriangleData0580.coefficient38_297,
  OriginalRow227TriangleData0580.coefficient38_298,
  OriginalRow227TriangleData0580.coefficient38_299,
  OriginalRow227TriangleData0580.coefficient38_300,
  OriginalRow227TriangleData0580.coefficient38_301,
  OriginalRow227TriangleData0580.coefficient38_302,
  OriginalRow227TriangleData0580.coefficient38_303,
  OriginalRow227TriangleData0580.coefficient38_304,
  OriginalRow227TriangleData0580.coefficient38_305,
  OriginalRow227TriangleData0580.coefficient38_306,
  OriginalRow227TriangleData0580.coefficient38_307,
  OriginalRow227TriangleData0580.coefficient38_308,
  OriginalRow227TriangleData0580.coefficient38_309,
  OriginalRow227TriangleData0580.coefficient38_310,
  OriginalRow227TriangleData0580.coefficient38_311,
  OriginalRow227TriangleData0580.coefficient38_312,
  OriginalRow227TriangleData0580.coefficient38_313,
  OriginalRow227TriangleData0580.coefficient38_314,
  OriginalRow227TriangleData0580.coefficient38_315,
  OriginalRow227TriangleData0580.coefficient38_316,
  OriginalRow227TriangleData0580.coefficient38_317,
  OriginalRow227TriangleData0580.coefficient38_318,
  OriginalRow227TriangleData0580.coefficient38_319,
  OriginalRow227TriangleData0580.coefficient38_320,
  OriginalRow227TriangleData0580.coefficient38_321,
  OriginalRow227TriangleData0580.coefficient38_322,
  OriginalRow227TriangleData0580.coefficient38_323,
  OriginalRow227TriangleData0580.coefficient38_324
]

theorem values0580_size : values0580.size = 32 := rfl

def block0580 : ℕ → Option IntervalDyadic := segment 293 values0580

theorem block0580_domain : ExactDomain block0580 293 325 := by
  simpa only [values0580_size] using segment_domain 293 values0580

theorem block0580_get (i : Fin 32) :
    block0580 (293 + i.val) = some (values0580[i.val]'(by rw [values0580_size]; exact i.isLt)) := by
  exact segment_get 293 values0580 ⟨i.val, by rw [values0580_size]; exact i.isLt⟩

def values0581 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0581.coefficient38_325,
  OriginalRow227TriangleData0581.coefficient38_326,
  OriginalRow227TriangleData0581.coefficient38_327,
  OriginalRow227TriangleData0581.coefficient38_328,
  OriginalRow227TriangleData0581.coefficient38_329,
  OriginalRow227TriangleData0581.coefficient38_330,
  OriginalRow227TriangleData0581.coefficient38_331,
  OriginalRow227TriangleData0581.coefficient38_332,
  OriginalRow227TriangleData0581.coefficient38_333,
  OriginalRow227TriangleData0581.coefficient38_334,
  OriginalRow227TriangleData0581.coefficient38_335,
  OriginalRow227TriangleData0581.coefficient38_336,
  OriginalRow227TriangleData0581.coefficient38_337,
  OriginalRow227TriangleData0581.coefficient38_338,
  OriginalRow227TriangleData0581.coefficient38_339,
  OriginalRow227TriangleData0581.coefficient38_340,
  OriginalRow227TriangleData0581.coefficient38_341,
  OriginalRow227TriangleData0581.coefficient38_342,
  OriginalRow227TriangleData0581.coefficient38_343,
  OriginalRow227TriangleData0581.coefficient38_344,
  OriginalRow227TriangleData0581.coefficient38_345,
  OriginalRow227TriangleData0581.coefficient38_346,
  OriginalRow227TriangleData0581.coefficient38_347,
  OriginalRow227TriangleData0581.coefficient38_348,
  OriginalRow227TriangleData0581.coefficient38_349,
  OriginalRow227TriangleData0581.coefficient38_350,
  OriginalRow227TriangleData0581.coefficient38_351,
  OriginalRow227TriangleData0581.coefficient38_352,
  OriginalRow227TriangleData0581.coefficient38_353,
  OriginalRow227TriangleData0581.coefficient38_354,
  OriginalRow227TriangleData0581.coefficient38_355,
  OriginalRow227TriangleData0581.coefficient38_356
]

theorem values0581_size : values0581.size = 32 := rfl

def block0581 : ℕ → Option IntervalDyadic := segment 325 values0581

theorem block0581_domain : ExactDomain block0581 325 357 := by
  simpa only [values0581_size] using segment_domain 325 values0581

theorem block0581_get (i : Fin 32) :
    block0581 (325 + i.val) = some (values0581[i.val]'(by rw [values0581_size]; exact i.isLt)) := by
  exact segment_get 325 values0581 ⟨i.val, by rw [values0581_size]; exact i.isLt⟩

def values0582 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0582.coefficient38_357,
  OriginalRow227TriangleData0582.coefficient38_358,
  OriginalRow227TriangleData0582.coefficient38_359,
  OriginalRow227TriangleData0582.coefficient38_360,
  OriginalRow227TriangleData0582.coefficient38_361,
  OriginalRow227TriangleData0582.coefficient38_362,
  OriginalRow227TriangleData0582.coefficient38_363,
  OriginalRow227TriangleData0582.coefficient38_364,
  OriginalRow227TriangleData0582.coefficient38_365,
  OriginalRow227TriangleData0582.coefficient38_366,
  OriginalRow227TriangleData0582.coefficient38_367,
  OriginalRow227TriangleData0582.coefficient38_368,
  OriginalRow227TriangleData0582.coefficient38_369,
  OriginalRow227TriangleData0582.coefficient38_370,
  OriginalRow227TriangleData0582.coefficient38_371,
  OriginalRow227TriangleData0582.coefficient38_372,
  OriginalRow227TriangleData0582.coefficient38_373,
  OriginalRow227TriangleData0582.coefficient38_374,
  OriginalRow227TriangleData0582.coefficient38_375,
  OriginalRow227TriangleData0582.coefficient38_376,
  OriginalRow227TriangleData0582.coefficient38_377,
  OriginalRow227TriangleData0582.coefficient38_378,
  OriginalRow227TriangleData0582.coefficient38_379,
  OriginalRow227TriangleData0582.coefficient38_380,
  OriginalRow227TriangleData0582.coefficient38_381,
  OriginalRow227TriangleData0582.coefficient38_382,
  OriginalRow227TriangleData0582.coefficient38_383,
  OriginalRow227TriangleData0582.coefficient38_384,
  OriginalRow227TriangleData0582.coefficient38_385,
  OriginalRow227TriangleData0582.coefficient38_386,
  OriginalRow227TriangleData0582.coefficient38_387,
  OriginalRow227TriangleData0582.coefficient38_388
]

theorem values0582_size : values0582.size = 32 := rfl

def block0582 : ℕ → Option IntervalDyadic := segment 357 values0582

theorem block0582_domain : ExactDomain block0582 357 389 := by
  simpa only [values0582_size] using segment_domain 357 values0582

theorem block0582_get (i : Fin 32) :
    block0582 (357 + i.val) = some (values0582[i.val]'(by rw [values0582_size]; exact i.isLt)) := by
  exact segment_get 357 values0582 ⟨i.val, by rw [values0582_size]; exact i.isLt⟩

def values0583 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0583.coefficient38_389,
  OriginalRow227TriangleData0583.coefficient38_390,
  OriginalRow227TriangleData0583.coefficient38_391,
  OriginalRow227TriangleData0583.coefficient38_392,
  OriginalRow227TriangleData0583.coefficient38_393,
  OriginalRow227TriangleData0583.coefficient38_394,
  OriginalRow227TriangleData0583.coefficient38_395,
  OriginalRow227TriangleData0583.coefficient38_396,
  OriginalRow227TriangleData0583.coefficient38_397,
  OriginalRow227TriangleData0583.coefficient38_398,
  OriginalRow227TriangleData0583.coefficient38_399,
  OriginalRow227TriangleData0583.coefficient38_400,
  OriginalRow227TriangleData0583.coefficient38_401,
  OriginalRow227TriangleData0583.coefficient38_402,
  OriginalRow227TriangleData0583.coefficient38_403,
  OriginalRow227TriangleData0583.coefficient38_404,
  OriginalRow227TriangleData0583.coefficient38_405,
  OriginalRow227TriangleData0583.coefficient38_406,
  OriginalRow227TriangleData0583.coefficient38_407,
  OriginalRow227TriangleData0583.coefficient38_408,
  OriginalRow227TriangleData0583.coefficient38_409,
  OriginalRow227TriangleData0583.coefficient38_410,
  OriginalRow227TriangleData0583.coefficient38_411,
  OriginalRow227TriangleData0583.coefficient38_412,
  OriginalRow227TriangleData0583.coefficient38_413,
  OriginalRow227TriangleData0583.coefficient38_414,
  OriginalRow227TriangleData0583.coefficient38_415,
  OriginalRow227TriangleData0583.coefficient38_416,
  OriginalRow227TriangleData0583.coefficient38_417,
  OriginalRow227TriangleData0583.coefficient38_418,
  OriginalRow227TriangleData0583.coefficient38_419,
  OriginalRow227TriangleData0583.coefficient38_420
]

theorem values0583_size : values0583.size = 32 := rfl

def block0583 : ℕ → Option IntervalDyadic := segment 389 values0583

theorem block0583_domain : ExactDomain block0583 389 421 := by
  simpa only [values0583_size] using segment_domain 389 values0583

theorem block0583_get (i : Fin 32) :
    block0583 (389 + i.val) = some (values0583[i.val]'(by rw [values0583_size]; exact i.isLt)) := by
  exact segment_get 389 values0583 ⟨i.val, by rw [values0583_size]; exact i.isLt⟩

def values0584 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0584.coefficient38_421,
  OriginalRow227TriangleData0584.coefficient38_422,
  OriginalRow227TriangleData0584.coefficient38_423,
  OriginalRow227TriangleData0584.coefficient38_424,
  OriginalRow227TriangleData0584.coefficient38_425,
  OriginalRow227TriangleData0584.coefficient38_426,
  OriginalRow227TriangleData0584.coefficient38_427,
  OriginalRow227TriangleData0584.coefficient38_428,
  OriginalRow227TriangleData0584.coefficient38_429,
  OriginalRow227TriangleData0584.coefficient38_430,
  OriginalRow227TriangleData0584.coefficient38_431,
  OriginalRow227TriangleData0584.coefficient38_432,
  OriginalRow227TriangleData0584.coefficient38_433,
  OriginalRow227TriangleData0584.coefficient38_434,
  OriginalRow227TriangleData0584.coefficient38_435,
  OriginalRow227TriangleData0584.coefficient38_436,
  OriginalRow227TriangleData0584.coefficient38_437,
  OriginalRow227TriangleData0584.coefficient38_438,
  OriginalRow227TriangleData0584.coefficient38_439,
  OriginalRow227TriangleData0584.coefficient38_440,
  OriginalRow227TriangleData0584.coefficient38_441,
  OriginalRow227TriangleData0584.coefficient38_442,
  OriginalRow227TriangleData0584.coefficient38_443,
  OriginalRow227TriangleData0584.coefficient38_444,
  OriginalRow227TriangleData0584.coefficient38_445,
  OriginalRow227TriangleData0584.coefficient38_446,
  OriginalRow227TriangleData0584.coefficient38_447,
  OriginalRow227TriangleData0584.coefficient38_448,
  OriginalRow227TriangleData0584.coefficient38_449,
  OriginalRow227TriangleData0584.coefficient38_450,
  OriginalRow227TriangleData0584.coefficient38_451,
  OriginalRow227TriangleData0584.coefficient38_452
]

theorem values0584_size : values0584.size = 32 := rfl

def block0584 : ℕ → Option IntervalDyadic := segment 421 values0584

theorem block0584_domain : ExactDomain block0584 421 453 := by
  simpa only [values0584_size] using segment_domain 421 values0584

theorem block0584_get (i : Fin 32) :
    block0584 (421 + i.val) = some (values0584[i.val]'(by rw [values0584_size]; exact i.isLt)) := by
  exact segment_get 421 values0584 ⟨i.val, by rw [values0584_size]; exact i.isLt⟩

def values0585 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0585.coefficient38_453,
  OriginalRow227TriangleData0585.coefficient38_454,
  OriginalRow227TriangleData0585.coefficient38_455,
  OriginalRow227TriangleData0585.coefficient38_456,
  OriginalRow227TriangleData0585.coefficient38_457,
  OriginalRow227TriangleData0585.coefficient38_458,
  OriginalRow227TriangleData0585.coefficient38_459,
  OriginalRow227TriangleData0585.coefficient38_460,
  OriginalRow227TriangleData0585.coefficient38_461,
  OriginalRow227TriangleData0585.coefficient38_462,
  OriginalRow227TriangleData0585.coefficient38_463
]

theorem values0585_size : values0585.size = 11 := rfl

def block0585 : ℕ → Option IntervalDyadic := segment 453 values0585

theorem block0585_domain : ExactDomain block0585 453 464 := by
  simpa only [values0585_size] using segment_domain 453 values0585

theorem block0585_get (i : Fin 11) :
    block0585 (453 + i.val) = some (values0585[i.val]'(by rw [values0585_size]; exact i.isLt)) := by
  exact segment_get 453 values0585 ⟨i.val, by rw [values0585_size]; exact i.isLt⟩

def node0069_0133 : ℕ → Option IntervalDyadic := split 101 block0573 block0574

theorem node0069_0133_domain : ExactDomain node0069_0133 69 133 := by
  exact split_domain (by decide) (by decide) block0573_domain block0574_domain

def node0037_0133 : ℕ → Option IntervalDyadic := split 69 block0572 node0069_0133

theorem node0037_0133_domain : ExactDomain node0037_0133 37 133 := by
  exact split_domain (by decide) (by decide) block0572_domain node0069_0133_domain

def node0133_0197 : ℕ → Option IntervalDyadic := split 165 block0575 block0576

theorem node0133_0197_domain : ExactDomain node0133_0197 133 197 := by
  exact split_domain (by decide) (by decide) block0575_domain block0576_domain

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block0577 block0578

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block0577_domain block0578_domain

def node0133_0261 : ℕ → Option IntervalDyadic := split 197 node0133_0197 node0197_0261

theorem node0133_0261_domain : ExactDomain node0133_0261 133 261 := by
  exact split_domain (by decide) (by decide) node0133_0197_domain node0197_0261_domain

def node0037_0261 : ℕ → Option IntervalDyadic := split 133 node0037_0133 node0133_0261

theorem node0037_0261_domain : ExactDomain node0037_0261 37 261 := by
  exact split_domain (by decide) (by decide) node0037_0133_domain node0133_0261_domain

def node0293_0357 : ℕ → Option IntervalDyadic := split 325 block0580 block0581

theorem node0293_0357_domain : ExactDomain node0293_0357 293 357 := by
  exact split_domain (by decide) (by decide) block0580_domain block0581_domain

def node0261_0357 : ℕ → Option IntervalDyadic := split 293 block0579 node0293_0357

theorem node0261_0357_domain : ExactDomain node0261_0357 261 357 := by
  exact split_domain (by decide) (by decide) block0579_domain node0293_0357_domain

def node0357_0421 : ℕ → Option IntervalDyadic := split 389 block0582 block0583

theorem node0357_0421_domain : ExactDomain node0357_0421 357 421 := by
  exact split_domain (by decide) (by decide) block0582_domain block0583_domain

def node0421_0464 : ℕ → Option IntervalDyadic := split 453 block0584 block0585

theorem node0421_0464_domain : ExactDomain node0421_0464 421 464 := by
  exact split_domain (by decide) (by decide) block0584_domain block0585_domain

def node0357_0464 : ℕ → Option IntervalDyadic := split 421 node0357_0421 node0421_0464

theorem node0357_0464_domain : ExactDomain node0357_0464 357 464 := by
  exact split_domain (by decide) (by decide) node0357_0421_domain node0421_0464_domain

def node0261_0464 : ℕ → Option IntervalDyadic := split 357 node0261_0357 node0357_0464

theorem node0261_0464_domain : ExactDomain node0261_0464 261 464 := by
  exact split_domain (by decide) (by decide) node0261_0357_domain node0357_0464_domain

def node0037_0464 : ℕ → Option IntervalDyadic := split 261 node0037_0261 node0261_0464

theorem node0037_0464_domain : ExactDomain node0037_0464 37 464 := by
  exact split_domain (by decide) (by decide) node0037_0261_domain node0261_0464_domain

def lookup : ℕ → Option IntervalDyadic := node0037_0464

theorem lookup_domain : ExactDomain lookup 37 464 :=
  node0037_0464_domain

theorem block0572_lookup (i : Fin 32) :
    lookup (37 + i.val) = some (values0572[i.val]'(by rw [values0572_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (37 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_left 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0037_0133, split_left 69 block0572 node0069_0133 (by omega)]
  exact block0572_get i

theorem block0573_lookup (i : Fin 32) :
    lookup (69 + i.val) = some (values0573[i.val]'(by rw [values0573_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (69 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_left 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0037_0133, split_right 69 block0572 node0069_0133 (by omega)]
  rw [node0069_0133, split_left 101 block0573 block0574 (by omega)]
  exact block0573_get i

theorem block0574_lookup (i : Fin 32) :
    lookup (101 + i.val) = some (values0574[i.val]'(by rw [values0574_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (101 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_left 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0037_0133, split_right 69 block0572 node0069_0133 (by omega)]
  rw [node0069_0133, split_right 101 block0573 block0574 (by omega)]
  exact block0574_get i

theorem block0575_lookup (i : Fin 32) :
    lookup (133 + i.val) = some (values0575[i.val]'(by rw [values0575_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (133 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_right 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_left 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0133_0197, split_left 165 block0575 block0576 (by omega)]
  exact block0575_get i

theorem block0576_lookup (i : Fin 32) :
    lookup (165 + i.val) = some (values0576[i.val]'(by rw [values0576_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (165 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_right 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_left 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0133_0197, split_right 165 block0575 block0576 (by omega)]
  exact block0576_get i

theorem block0577_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values0577[i.val]'(by rw [values0577_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (197 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_right 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_right 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0197_0261, split_left 229 block0577 block0578 (by omega)]
  exact block0577_get i

theorem block0578_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values0578[i.val]'(by rw [values0578_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (229 + i.val) = _
  rw [node0037_0464, split_left 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0037_0261, split_right 133 node0037_0133 node0133_0261 (by omega)]
  rw [node0133_0261, split_right 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0197_0261, split_right 229 block0577 block0578 (by omega)]
  exact block0578_get i

theorem block0579_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values0579[i.val]'(by rw [values0579_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (261 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_left 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0261_0357, split_left 293 block0579 node0293_0357 (by omega)]
  exact block0579_get i

theorem block0580_lookup (i : Fin 32) :
    lookup (293 + i.val) = some (values0580[i.val]'(by rw [values0580_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (293 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_left 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0261_0357, split_right 293 block0579 node0293_0357 (by omega)]
  rw [node0293_0357, split_left 325 block0580 block0581 (by omega)]
  exact block0580_get i

theorem block0581_lookup (i : Fin 32) :
    lookup (325 + i.val) = some (values0581[i.val]'(by rw [values0581_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (325 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_left 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0261_0357, split_right 293 block0579 node0293_0357 (by omega)]
  rw [node0293_0357, split_right 325 block0580 block0581 (by omega)]
  exact block0581_get i

theorem block0582_lookup (i : Fin 32) :
    lookup (357 + i.val) = some (values0582[i.val]'(by rw [values0582_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (357 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_right 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0357_0464, split_left 421 node0357_0421 node0421_0464 (by omega)]
  rw [node0357_0421, split_left 389 block0582 block0583 (by omega)]
  exact block0582_get i

theorem block0583_lookup (i : Fin 32) :
    lookup (389 + i.val) = some (values0583[i.val]'(by rw [values0583_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (389 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_right 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0357_0464, split_left 421 node0357_0421 node0421_0464 (by omega)]
  rw [node0357_0421, split_right 389 block0582 block0583 (by omega)]
  exact block0583_get i

theorem block0584_lookup (i : Fin 32) :
    lookup (421 + i.val) = some (values0584[i.val]'(by rw [values0584_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (421 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_right 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0357_0464, split_right 421 node0357_0421 node0421_0464 (by omega)]
  rw [node0421_0464, split_left 453 block0584 block0585 (by omega)]
  exact block0584_get i

theorem block0585_lookup (i : Fin 11) :
    lookup (453 + i.val) = some (values0585[i.val]'(by rw [values0585_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0037_0464 (453 + i.val) = _
  rw [node0037_0464, split_right 261 node0037_0261 node0261_0464 (by omega)]
  rw [node0261_0464, split_right 357 node0261_0357 node0357_0464 (by omega)]
  rw [node0357_0464, split_right 421 node0357_0421 node0421_0464 (by omega)]
  rw [node0421_0464, split_right 453 block0584 block0585 (by omega)]
  exact block0585_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0572_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0572_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0573_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0573_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0574_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0574_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0575_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0575_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0576_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0576_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0577_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0577_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0578_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0578_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0579_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0579_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0580_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0580_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0581_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0581_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0582_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0582_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0583_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0583_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0584_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0584_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0585_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0585_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0572_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0573_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0574_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0575_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0576_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0577_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0578_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0579_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0580_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0581_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0582_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0583_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0584_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow038.block0585_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow038
