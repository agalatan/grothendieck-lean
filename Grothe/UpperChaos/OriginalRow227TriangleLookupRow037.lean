import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0558
import Grothe.UpperChaos.OriginalRow227TriangleData0559
import Grothe.UpperChaos.OriginalRow227TriangleData0560
import Grothe.UpperChaos.OriginalRow227TriangleData0561
import Grothe.UpperChaos.OriginalRow227TriangleData0562
import Grothe.UpperChaos.OriginalRow227TriangleData0563
import Grothe.UpperChaos.OriginalRow227TriangleData0564
import Grothe.UpperChaos.OriginalRow227TriangleData0565
import Grothe.UpperChaos.OriginalRow227TriangleData0566
import Grothe.UpperChaos.OriginalRow227TriangleData0567
import Grothe.UpperChaos.OriginalRow227TriangleData0568
import Grothe.UpperChaos.OriginalRow227TriangleData0569
import Grothe.UpperChaos.OriginalRow227TriangleData0570
import Grothe.UpperChaos.OriginalRow227TriangleData0571

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow037

open ConditionalTableLookup

def values0558 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0558.coefficient37_36,
  OriginalRow227TriangleData0558.coefficient37_37,
  OriginalRow227TriangleData0558.coefficient37_38,
  OriginalRow227TriangleData0558.coefficient37_39,
  OriginalRow227TriangleData0558.coefficient37_40,
  OriginalRow227TriangleData0558.coefficient37_41,
  OriginalRow227TriangleData0558.coefficient37_42,
  OriginalRow227TriangleData0558.coefficient37_43,
  OriginalRow227TriangleData0558.coefficient37_44,
  OriginalRow227TriangleData0558.coefficient37_45,
  OriginalRow227TriangleData0558.coefficient37_46,
  OriginalRow227TriangleData0558.coefficient37_47,
  OriginalRow227TriangleData0558.coefficient37_48,
  OriginalRow227TriangleData0558.coefficient37_49,
  OriginalRow227TriangleData0558.coefficient37_50,
  OriginalRow227TriangleData0558.coefficient37_51,
  OriginalRow227TriangleData0558.coefficient37_52,
  OriginalRow227TriangleData0558.coefficient37_53,
  OriginalRow227TriangleData0558.coefficient37_54,
  OriginalRow227TriangleData0558.coefficient37_55,
  OriginalRow227TriangleData0558.coefficient37_56,
  OriginalRow227TriangleData0558.coefficient37_57,
  OriginalRow227TriangleData0558.coefficient37_58,
  OriginalRow227TriangleData0558.coefficient37_59,
  OriginalRow227TriangleData0558.coefficient37_60,
  OriginalRow227TriangleData0558.coefficient37_61,
  OriginalRow227TriangleData0558.coefficient37_62,
  OriginalRow227TriangleData0558.coefficient37_63,
  OriginalRow227TriangleData0558.coefficient37_64,
  OriginalRow227TriangleData0558.coefficient37_65,
  OriginalRow227TriangleData0558.coefficient37_66,
  OriginalRow227TriangleData0558.coefficient37_67
]

theorem values0558_size : values0558.size = 32 := rfl

def block0558 : ℕ → Option IntervalDyadic := segment 36 values0558

theorem block0558_domain : ExactDomain block0558 36 68 := by
  simpa only [values0558_size] using segment_domain 36 values0558

theorem block0558_get (i : Fin 32) :
    block0558 (36 + i.val) = some (values0558[i.val]'(by rw [values0558_size]; exact i.isLt)) := by
  exact segment_get 36 values0558 ⟨i.val, by rw [values0558_size]; exact i.isLt⟩

def values0559 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0559.coefficient37_68,
  OriginalRow227TriangleData0559.coefficient37_69,
  OriginalRow227TriangleData0559.coefficient37_70,
  OriginalRow227TriangleData0559.coefficient37_71,
  OriginalRow227TriangleData0559.coefficient37_72,
  OriginalRow227TriangleData0559.coefficient37_73,
  OriginalRow227TriangleData0559.coefficient37_74,
  OriginalRow227TriangleData0559.coefficient37_75,
  OriginalRow227TriangleData0559.coefficient37_76,
  OriginalRow227TriangleData0559.coefficient37_77,
  OriginalRow227TriangleData0559.coefficient37_78,
  OriginalRow227TriangleData0559.coefficient37_79,
  OriginalRow227TriangleData0559.coefficient37_80,
  OriginalRow227TriangleData0559.coefficient37_81,
  OriginalRow227TriangleData0559.coefficient37_82,
  OriginalRow227TriangleData0559.coefficient37_83,
  OriginalRow227TriangleData0559.coefficient37_84,
  OriginalRow227TriangleData0559.coefficient37_85,
  OriginalRow227TriangleData0559.coefficient37_86,
  OriginalRow227TriangleData0559.coefficient37_87,
  OriginalRow227TriangleData0559.coefficient37_88,
  OriginalRow227TriangleData0559.coefficient37_89,
  OriginalRow227TriangleData0559.coefficient37_90,
  OriginalRow227TriangleData0559.coefficient37_91,
  OriginalRow227TriangleData0559.coefficient37_92,
  OriginalRow227TriangleData0559.coefficient37_93,
  OriginalRow227TriangleData0559.coefficient37_94,
  OriginalRow227TriangleData0559.coefficient37_95,
  OriginalRow227TriangleData0559.coefficient37_96,
  OriginalRow227TriangleData0559.coefficient37_97,
  OriginalRow227TriangleData0559.coefficient37_98,
  OriginalRow227TriangleData0559.coefficient37_99
]

theorem values0559_size : values0559.size = 32 := rfl

def block0559 : ℕ → Option IntervalDyadic := segment 68 values0559

theorem block0559_domain : ExactDomain block0559 68 100 := by
  simpa only [values0559_size] using segment_domain 68 values0559

theorem block0559_get (i : Fin 32) :
    block0559 (68 + i.val) = some (values0559[i.val]'(by rw [values0559_size]; exact i.isLt)) := by
  exact segment_get 68 values0559 ⟨i.val, by rw [values0559_size]; exact i.isLt⟩

def values0560 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0560.coefficient37_100,
  OriginalRow227TriangleData0560.coefficient37_101,
  OriginalRow227TriangleData0560.coefficient37_102,
  OriginalRow227TriangleData0560.coefficient37_103,
  OriginalRow227TriangleData0560.coefficient37_104,
  OriginalRow227TriangleData0560.coefficient37_105,
  OriginalRow227TriangleData0560.coefficient37_106,
  OriginalRow227TriangleData0560.coefficient37_107,
  OriginalRow227TriangleData0560.coefficient37_108,
  OriginalRow227TriangleData0560.coefficient37_109,
  OriginalRow227TriangleData0560.coefficient37_110,
  OriginalRow227TriangleData0560.coefficient37_111,
  OriginalRow227TriangleData0560.coefficient37_112,
  OriginalRow227TriangleData0560.coefficient37_113,
  OriginalRow227TriangleData0560.coefficient37_114,
  OriginalRow227TriangleData0560.coefficient37_115,
  OriginalRow227TriangleData0560.coefficient37_116,
  OriginalRow227TriangleData0560.coefficient37_117,
  OriginalRow227TriangleData0560.coefficient37_118,
  OriginalRow227TriangleData0560.coefficient37_119,
  OriginalRow227TriangleData0560.coefficient37_120,
  OriginalRow227TriangleData0560.coefficient37_121,
  OriginalRow227TriangleData0560.coefficient37_122,
  OriginalRow227TriangleData0560.coefficient37_123,
  OriginalRow227TriangleData0560.coefficient37_124,
  OriginalRow227TriangleData0560.coefficient37_125,
  OriginalRow227TriangleData0560.coefficient37_126,
  OriginalRow227TriangleData0560.coefficient37_127,
  OriginalRow227TriangleData0560.coefficient37_128,
  OriginalRow227TriangleData0560.coefficient37_129,
  OriginalRow227TriangleData0560.coefficient37_130,
  OriginalRow227TriangleData0560.coefficient37_131
]

theorem values0560_size : values0560.size = 32 := rfl

def block0560 : ℕ → Option IntervalDyadic := segment 100 values0560

theorem block0560_domain : ExactDomain block0560 100 132 := by
  simpa only [values0560_size] using segment_domain 100 values0560

theorem block0560_get (i : Fin 32) :
    block0560 (100 + i.val) = some (values0560[i.val]'(by rw [values0560_size]; exact i.isLt)) := by
  exact segment_get 100 values0560 ⟨i.val, by rw [values0560_size]; exact i.isLt⟩

def values0561 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0561.coefficient37_132,
  OriginalRow227TriangleData0561.coefficient37_133,
  OriginalRow227TriangleData0561.coefficient37_134,
  OriginalRow227TriangleData0561.coefficient37_135,
  OriginalRow227TriangleData0561.coefficient37_136,
  OriginalRow227TriangleData0561.coefficient37_137,
  OriginalRow227TriangleData0561.coefficient37_138,
  OriginalRow227TriangleData0561.coefficient37_139,
  OriginalRow227TriangleData0561.coefficient37_140,
  OriginalRow227TriangleData0561.coefficient37_141,
  OriginalRow227TriangleData0561.coefficient37_142,
  OriginalRow227TriangleData0561.coefficient37_143,
  OriginalRow227TriangleData0561.coefficient37_144,
  OriginalRow227TriangleData0561.coefficient37_145,
  OriginalRow227TriangleData0561.coefficient37_146,
  OriginalRow227TriangleData0561.coefficient37_147,
  OriginalRow227TriangleData0561.coefficient37_148,
  OriginalRow227TriangleData0561.coefficient37_149,
  OriginalRow227TriangleData0561.coefficient37_150,
  OriginalRow227TriangleData0561.coefficient37_151,
  OriginalRow227TriangleData0561.coefficient37_152,
  OriginalRow227TriangleData0561.coefficient37_153,
  OriginalRow227TriangleData0561.coefficient37_154,
  OriginalRow227TriangleData0561.coefficient37_155,
  OriginalRow227TriangleData0561.coefficient37_156,
  OriginalRow227TriangleData0561.coefficient37_157,
  OriginalRow227TriangleData0561.coefficient37_158,
  OriginalRow227TriangleData0561.coefficient37_159,
  OriginalRow227TriangleData0561.coefficient37_160,
  OriginalRow227TriangleData0561.coefficient37_161,
  OriginalRow227TriangleData0561.coefficient37_162,
  OriginalRow227TriangleData0561.coefficient37_163
]

theorem values0561_size : values0561.size = 32 := rfl

def block0561 : ℕ → Option IntervalDyadic := segment 132 values0561

theorem block0561_domain : ExactDomain block0561 132 164 := by
  simpa only [values0561_size] using segment_domain 132 values0561

theorem block0561_get (i : Fin 32) :
    block0561 (132 + i.val) = some (values0561[i.val]'(by rw [values0561_size]; exact i.isLt)) := by
  exact segment_get 132 values0561 ⟨i.val, by rw [values0561_size]; exact i.isLt⟩

def values0562 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0562.coefficient37_164,
  OriginalRow227TriangleData0562.coefficient37_165,
  OriginalRow227TriangleData0562.coefficient37_166,
  OriginalRow227TriangleData0562.coefficient37_167,
  OriginalRow227TriangleData0562.coefficient37_168,
  OriginalRow227TriangleData0562.coefficient37_169,
  OriginalRow227TriangleData0562.coefficient37_170,
  OriginalRow227TriangleData0562.coefficient37_171,
  OriginalRow227TriangleData0562.coefficient37_172,
  OriginalRow227TriangleData0562.coefficient37_173,
  OriginalRow227TriangleData0562.coefficient37_174,
  OriginalRow227TriangleData0562.coefficient37_175,
  OriginalRow227TriangleData0562.coefficient37_176,
  OriginalRow227TriangleData0562.coefficient37_177,
  OriginalRow227TriangleData0562.coefficient37_178,
  OriginalRow227TriangleData0562.coefficient37_179,
  OriginalRow227TriangleData0562.coefficient37_180,
  OriginalRow227TriangleData0562.coefficient37_181,
  OriginalRow227TriangleData0562.coefficient37_182,
  OriginalRow227TriangleData0562.coefficient37_183,
  OriginalRow227TriangleData0562.coefficient37_184,
  OriginalRow227TriangleData0562.coefficient37_185,
  OriginalRow227TriangleData0562.coefficient37_186,
  OriginalRow227TriangleData0562.coefficient37_187,
  OriginalRow227TriangleData0562.coefficient37_188,
  OriginalRow227TriangleData0562.coefficient37_189,
  OriginalRow227TriangleData0562.coefficient37_190,
  OriginalRow227TriangleData0562.coefficient37_191,
  OriginalRow227TriangleData0562.coefficient37_192,
  OriginalRow227TriangleData0562.coefficient37_193,
  OriginalRow227TriangleData0562.coefficient37_194,
  OriginalRow227TriangleData0562.coefficient37_195
]

theorem values0562_size : values0562.size = 32 := rfl

def block0562 : ℕ → Option IntervalDyadic := segment 164 values0562

theorem block0562_domain : ExactDomain block0562 164 196 := by
  simpa only [values0562_size] using segment_domain 164 values0562

theorem block0562_get (i : Fin 32) :
    block0562 (164 + i.val) = some (values0562[i.val]'(by rw [values0562_size]; exact i.isLt)) := by
  exact segment_get 164 values0562 ⟨i.val, by rw [values0562_size]; exact i.isLt⟩

def values0563 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0563.coefficient37_196,
  OriginalRow227TriangleData0563.coefficient37_197,
  OriginalRow227TriangleData0563.coefficient37_198,
  OriginalRow227TriangleData0563.coefficient37_199,
  OriginalRow227TriangleData0563.coefficient37_200,
  OriginalRow227TriangleData0563.coefficient37_201,
  OriginalRow227TriangleData0563.coefficient37_202,
  OriginalRow227TriangleData0563.coefficient37_203,
  OriginalRow227TriangleData0563.coefficient37_204,
  OriginalRow227TriangleData0563.coefficient37_205,
  OriginalRow227TriangleData0563.coefficient37_206,
  OriginalRow227TriangleData0563.coefficient37_207,
  OriginalRow227TriangleData0563.coefficient37_208,
  OriginalRow227TriangleData0563.coefficient37_209,
  OriginalRow227TriangleData0563.coefficient37_210,
  OriginalRow227TriangleData0563.coefficient37_211,
  OriginalRow227TriangleData0563.coefficient37_212,
  OriginalRow227TriangleData0563.coefficient37_213,
  OriginalRow227TriangleData0563.coefficient37_214,
  OriginalRow227TriangleData0563.coefficient37_215,
  OriginalRow227TriangleData0563.coefficient37_216,
  OriginalRow227TriangleData0563.coefficient37_217,
  OriginalRow227TriangleData0563.coefficient37_218,
  OriginalRow227TriangleData0563.coefficient37_219,
  OriginalRow227TriangleData0563.coefficient37_220,
  OriginalRow227TriangleData0563.coefficient37_221,
  OriginalRow227TriangleData0563.coefficient37_222,
  OriginalRow227TriangleData0563.coefficient37_223,
  OriginalRow227TriangleData0563.coefficient37_224,
  OriginalRow227TriangleData0563.coefficient37_225,
  OriginalRow227TriangleData0563.coefficient37_226,
  OriginalRow227TriangleData0563.coefficient37_227
]

theorem values0563_size : values0563.size = 32 := rfl

def block0563 : ℕ → Option IntervalDyadic := segment 196 values0563

theorem block0563_domain : ExactDomain block0563 196 228 := by
  simpa only [values0563_size] using segment_domain 196 values0563

theorem block0563_get (i : Fin 32) :
    block0563 (196 + i.val) = some (values0563[i.val]'(by rw [values0563_size]; exact i.isLt)) := by
  exact segment_get 196 values0563 ⟨i.val, by rw [values0563_size]; exact i.isLt⟩

def values0564 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0564.coefficient37_228,
  OriginalRow227TriangleData0564.coefficient37_229,
  OriginalRow227TriangleData0564.coefficient37_230,
  OriginalRow227TriangleData0564.coefficient37_231,
  OriginalRow227TriangleData0564.coefficient37_232,
  OriginalRow227TriangleData0564.coefficient37_233,
  OriginalRow227TriangleData0564.coefficient37_234,
  OriginalRow227TriangleData0564.coefficient37_235,
  OriginalRow227TriangleData0564.coefficient37_236,
  OriginalRow227TriangleData0564.coefficient37_237,
  OriginalRow227TriangleData0564.coefficient37_238,
  OriginalRow227TriangleData0564.coefficient37_239,
  OriginalRow227TriangleData0564.coefficient37_240,
  OriginalRow227TriangleData0564.coefficient37_241,
  OriginalRow227TriangleData0564.coefficient37_242,
  OriginalRow227TriangleData0564.coefficient37_243,
  OriginalRow227TriangleData0564.coefficient37_244,
  OriginalRow227TriangleData0564.coefficient37_245,
  OriginalRow227TriangleData0564.coefficient37_246,
  OriginalRow227TriangleData0564.coefficient37_247,
  OriginalRow227TriangleData0564.coefficient37_248,
  OriginalRow227TriangleData0564.coefficient37_249,
  OriginalRow227TriangleData0564.coefficient37_250,
  OriginalRow227TriangleData0564.coefficient37_251,
  OriginalRow227TriangleData0564.coefficient37_252,
  OriginalRow227TriangleData0564.coefficient37_253,
  OriginalRow227TriangleData0564.coefficient37_254,
  OriginalRow227TriangleData0564.coefficient37_255,
  OriginalRow227TriangleData0564.coefficient37_256,
  OriginalRow227TriangleData0564.coefficient37_257,
  OriginalRow227TriangleData0564.coefficient37_258,
  OriginalRow227TriangleData0564.coefficient37_259
]

theorem values0564_size : values0564.size = 32 := rfl

def block0564 : ℕ → Option IntervalDyadic := segment 228 values0564

theorem block0564_domain : ExactDomain block0564 228 260 := by
  simpa only [values0564_size] using segment_domain 228 values0564

theorem block0564_get (i : Fin 32) :
    block0564 (228 + i.val) = some (values0564[i.val]'(by rw [values0564_size]; exact i.isLt)) := by
  exact segment_get 228 values0564 ⟨i.val, by rw [values0564_size]; exact i.isLt⟩

def values0565 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0565.coefficient37_260,
  OriginalRow227TriangleData0565.coefficient37_261,
  OriginalRow227TriangleData0565.coefficient37_262,
  OriginalRow227TriangleData0565.coefficient37_263,
  OriginalRow227TriangleData0565.coefficient37_264,
  OriginalRow227TriangleData0565.coefficient37_265,
  OriginalRow227TriangleData0565.coefficient37_266,
  OriginalRow227TriangleData0565.coefficient37_267,
  OriginalRow227TriangleData0565.coefficient37_268,
  OriginalRow227TriangleData0565.coefficient37_269,
  OriginalRow227TriangleData0565.coefficient37_270,
  OriginalRow227TriangleData0565.coefficient37_271,
  OriginalRow227TriangleData0565.coefficient37_272,
  OriginalRow227TriangleData0565.coefficient37_273,
  OriginalRow227TriangleData0565.coefficient37_274,
  OriginalRow227TriangleData0565.coefficient37_275,
  OriginalRow227TriangleData0565.coefficient37_276,
  OriginalRow227TriangleData0565.coefficient37_277,
  OriginalRow227TriangleData0565.coefficient37_278,
  OriginalRow227TriangleData0565.coefficient37_279,
  OriginalRow227TriangleData0565.coefficient37_280,
  OriginalRow227TriangleData0565.coefficient37_281,
  OriginalRow227TriangleData0565.coefficient37_282,
  OriginalRow227TriangleData0565.coefficient37_283,
  OriginalRow227TriangleData0565.coefficient37_284,
  OriginalRow227TriangleData0565.coefficient37_285,
  OriginalRow227TriangleData0565.coefficient37_286,
  OriginalRow227TriangleData0565.coefficient37_287,
  OriginalRow227TriangleData0565.coefficient37_288,
  OriginalRow227TriangleData0565.coefficient37_289,
  OriginalRow227TriangleData0565.coefficient37_290,
  OriginalRow227TriangleData0565.coefficient37_291
]

theorem values0565_size : values0565.size = 32 := rfl

def block0565 : ℕ → Option IntervalDyadic := segment 260 values0565

theorem block0565_domain : ExactDomain block0565 260 292 := by
  simpa only [values0565_size] using segment_domain 260 values0565

theorem block0565_get (i : Fin 32) :
    block0565 (260 + i.val) = some (values0565[i.val]'(by rw [values0565_size]; exact i.isLt)) := by
  exact segment_get 260 values0565 ⟨i.val, by rw [values0565_size]; exact i.isLt⟩

def values0566 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0566.coefficient37_292,
  OriginalRow227TriangleData0566.coefficient37_293,
  OriginalRow227TriangleData0566.coefficient37_294,
  OriginalRow227TriangleData0566.coefficient37_295,
  OriginalRow227TriangleData0566.coefficient37_296,
  OriginalRow227TriangleData0566.coefficient37_297,
  OriginalRow227TriangleData0566.coefficient37_298,
  OriginalRow227TriangleData0566.coefficient37_299,
  OriginalRow227TriangleData0566.coefficient37_300,
  OriginalRow227TriangleData0566.coefficient37_301,
  OriginalRow227TriangleData0566.coefficient37_302,
  OriginalRow227TriangleData0566.coefficient37_303,
  OriginalRow227TriangleData0566.coefficient37_304,
  OriginalRow227TriangleData0566.coefficient37_305,
  OriginalRow227TriangleData0566.coefficient37_306,
  OriginalRow227TriangleData0566.coefficient37_307,
  OriginalRow227TriangleData0566.coefficient37_308,
  OriginalRow227TriangleData0566.coefficient37_309,
  OriginalRow227TriangleData0566.coefficient37_310,
  OriginalRow227TriangleData0566.coefficient37_311,
  OriginalRow227TriangleData0566.coefficient37_312,
  OriginalRow227TriangleData0566.coefficient37_313,
  OriginalRow227TriangleData0566.coefficient37_314,
  OriginalRow227TriangleData0566.coefficient37_315,
  OriginalRow227TriangleData0566.coefficient37_316,
  OriginalRow227TriangleData0566.coefficient37_317,
  OriginalRow227TriangleData0566.coefficient37_318,
  OriginalRow227TriangleData0566.coefficient37_319,
  OriginalRow227TriangleData0566.coefficient37_320,
  OriginalRow227TriangleData0566.coefficient37_321,
  OriginalRow227TriangleData0566.coefficient37_322,
  OriginalRow227TriangleData0566.coefficient37_323
]

theorem values0566_size : values0566.size = 32 := rfl

def block0566 : ℕ → Option IntervalDyadic := segment 292 values0566

theorem block0566_domain : ExactDomain block0566 292 324 := by
  simpa only [values0566_size] using segment_domain 292 values0566

theorem block0566_get (i : Fin 32) :
    block0566 (292 + i.val) = some (values0566[i.val]'(by rw [values0566_size]; exact i.isLt)) := by
  exact segment_get 292 values0566 ⟨i.val, by rw [values0566_size]; exact i.isLt⟩

def values0567 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0567.coefficient37_324,
  OriginalRow227TriangleData0567.coefficient37_325,
  OriginalRow227TriangleData0567.coefficient37_326,
  OriginalRow227TriangleData0567.coefficient37_327,
  OriginalRow227TriangleData0567.coefficient37_328,
  OriginalRow227TriangleData0567.coefficient37_329,
  OriginalRow227TriangleData0567.coefficient37_330,
  OriginalRow227TriangleData0567.coefficient37_331,
  OriginalRow227TriangleData0567.coefficient37_332,
  OriginalRow227TriangleData0567.coefficient37_333,
  OriginalRow227TriangleData0567.coefficient37_334,
  OriginalRow227TriangleData0567.coefficient37_335,
  OriginalRow227TriangleData0567.coefficient37_336,
  OriginalRow227TriangleData0567.coefficient37_337,
  OriginalRow227TriangleData0567.coefficient37_338,
  OriginalRow227TriangleData0567.coefficient37_339,
  OriginalRow227TriangleData0567.coefficient37_340,
  OriginalRow227TriangleData0567.coefficient37_341,
  OriginalRow227TriangleData0567.coefficient37_342,
  OriginalRow227TriangleData0567.coefficient37_343,
  OriginalRow227TriangleData0567.coefficient37_344,
  OriginalRow227TriangleData0567.coefficient37_345,
  OriginalRow227TriangleData0567.coefficient37_346,
  OriginalRow227TriangleData0567.coefficient37_347,
  OriginalRow227TriangleData0567.coefficient37_348,
  OriginalRow227TriangleData0567.coefficient37_349,
  OriginalRow227TriangleData0567.coefficient37_350,
  OriginalRow227TriangleData0567.coefficient37_351,
  OriginalRow227TriangleData0567.coefficient37_352,
  OriginalRow227TriangleData0567.coefficient37_353,
  OriginalRow227TriangleData0567.coefficient37_354,
  OriginalRow227TriangleData0567.coefficient37_355
]

theorem values0567_size : values0567.size = 32 := rfl

def block0567 : ℕ → Option IntervalDyadic := segment 324 values0567

theorem block0567_domain : ExactDomain block0567 324 356 := by
  simpa only [values0567_size] using segment_domain 324 values0567

theorem block0567_get (i : Fin 32) :
    block0567 (324 + i.val) = some (values0567[i.val]'(by rw [values0567_size]; exact i.isLt)) := by
  exact segment_get 324 values0567 ⟨i.val, by rw [values0567_size]; exact i.isLt⟩

def values0568 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0568.coefficient37_356,
  OriginalRow227TriangleData0568.coefficient37_357,
  OriginalRow227TriangleData0568.coefficient37_358,
  OriginalRow227TriangleData0568.coefficient37_359,
  OriginalRow227TriangleData0568.coefficient37_360,
  OriginalRow227TriangleData0568.coefficient37_361,
  OriginalRow227TriangleData0568.coefficient37_362,
  OriginalRow227TriangleData0568.coefficient37_363,
  OriginalRow227TriangleData0568.coefficient37_364,
  OriginalRow227TriangleData0568.coefficient37_365,
  OriginalRow227TriangleData0568.coefficient37_366,
  OriginalRow227TriangleData0568.coefficient37_367,
  OriginalRow227TriangleData0568.coefficient37_368,
  OriginalRow227TriangleData0568.coefficient37_369,
  OriginalRow227TriangleData0568.coefficient37_370,
  OriginalRow227TriangleData0568.coefficient37_371,
  OriginalRow227TriangleData0568.coefficient37_372,
  OriginalRow227TriangleData0568.coefficient37_373,
  OriginalRow227TriangleData0568.coefficient37_374,
  OriginalRow227TriangleData0568.coefficient37_375,
  OriginalRow227TriangleData0568.coefficient37_376,
  OriginalRow227TriangleData0568.coefficient37_377,
  OriginalRow227TriangleData0568.coefficient37_378,
  OriginalRow227TriangleData0568.coefficient37_379,
  OriginalRow227TriangleData0568.coefficient37_380,
  OriginalRow227TriangleData0568.coefficient37_381,
  OriginalRow227TriangleData0568.coefficient37_382,
  OriginalRow227TriangleData0568.coefficient37_383,
  OriginalRow227TriangleData0568.coefficient37_384,
  OriginalRow227TriangleData0568.coefficient37_385,
  OriginalRow227TriangleData0568.coefficient37_386,
  OriginalRow227TriangleData0568.coefficient37_387
]

theorem values0568_size : values0568.size = 32 := rfl

def block0568 : ℕ → Option IntervalDyadic := segment 356 values0568

theorem block0568_domain : ExactDomain block0568 356 388 := by
  simpa only [values0568_size] using segment_domain 356 values0568

theorem block0568_get (i : Fin 32) :
    block0568 (356 + i.val) = some (values0568[i.val]'(by rw [values0568_size]; exact i.isLt)) := by
  exact segment_get 356 values0568 ⟨i.val, by rw [values0568_size]; exact i.isLt⟩

def values0569 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0569.coefficient37_388,
  OriginalRow227TriangleData0569.coefficient37_389,
  OriginalRow227TriangleData0569.coefficient37_390,
  OriginalRow227TriangleData0569.coefficient37_391,
  OriginalRow227TriangleData0569.coefficient37_392,
  OriginalRow227TriangleData0569.coefficient37_393,
  OriginalRow227TriangleData0569.coefficient37_394,
  OriginalRow227TriangleData0569.coefficient37_395,
  OriginalRow227TriangleData0569.coefficient37_396,
  OriginalRow227TriangleData0569.coefficient37_397,
  OriginalRow227TriangleData0569.coefficient37_398,
  OriginalRow227TriangleData0569.coefficient37_399,
  OriginalRow227TriangleData0569.coefficient37_400,
  OriginalRow227TriangleData0569.coefficient37_401,
  OriginalRow227TriangleData0569.coefficient37_402,
  OriginalRow227TriangleData0569.coefficient37_403,
  OriginalRow227TriangleData0569.coefficient37_404,
  OriginalRow227TriangleData0569.coefficient37_405,
  OriginalRow227TriangleData0569.coefficient37_406,
  OriginalRow227TriangleData0569.coefficient37_407,
  OriginalRow227TriangleData0569.coefficient37_408,
  OriginalRow227TriangleData0569.coefficient37_409,
  OriginalRow227TriangleData0569.coefficient37_410,
  OriginalRow227TriangleData0569.coefficient37_411,
  OriginalRow227TriangleData0569.coefficient37_412,
  OriginalRow227TriangleData0569.coefficient37_413,
  OriginalRow227TriangleData0569.coefficient37_414,
  OriginalRow227TriangleData0569.coefficient37_415,
  OriginalRow227TriangleData0569.coefficient37_416,
  OriginalRow227TriangleData0569.coefficient37_417,
  OriginalRow227TriangleData0569.coefficient37_418,
  OriginalRow227TriangleData0569.coefficient37_419
]

theorem values0569_size : values0569.size = 32 := rfl

def block0569 : ℕ → Option IntervalDyadic := segment 388 values0569

theorem block0569_domain : ExactDomain block0569 388 420 := by
  simpa only [values0569_size] using segment_domain 388 values0569

theorem block0569_get (i : Fin 32) :
    block0569 (388 + i.val) = some (values0569[i.val]'(by rw [values0569_size]; exact i.isLt)) := by
  exact segment_get 388 values0569 ⟨i.val, by rw [values0569_size]; exact i.isLt⟩

def values0570 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0570.coefficient37_420,
  OriginalRow227TriangleData0570.coefficient37_421,
  OriginalRow227TriangleData0570.coefficient37_422,
  OriginalRow227TriangleData0570.coefficient37_423,
  OriginalRow227TriangleData0570.coefficient37_424,
  OriginalRow227TriangleData0570.coefficient37_425,
  OriginalRow227TriangleData0570.coefficient37_426,
  OriginalRow227TriangleData0570.coefficient37_427,
  OriginalRow227TriangleData0570.coefficient37_428,
  OriginalRow227TriangleData0570.coefficient37_429,
  OriginalRow227TriangleData0570.coefficient37_430,
  OriginalRow227TriangleData0570.coefficient37_431,
  OriginalRow227TriangleData0570.coefficient37_432,
  OriginalRow227TriangleData0570.coefficient37_433,
  OriginalRow227TriangleData0570.coefficient37_434,
  OriginalRow227TriangleData0570.coefficient37_435,
  OriginalRow227TriangleData0570.coefficient37_436,
  OriginalRow227TriangleData0570.coefficient37_437,
  OriginalRow227TriangleData0570.coefficient37_438,
  OriginalRow227TriangleData0570.coefficient37_439,
  OriginalRow227TriangleData0570.coefficient37_440,
  OriginalRow227TriangleData0570.coefficient37_441,
  OriginalRow227TriangleData0570.coefficient37_442,
  OriginalRow227TriangleData0570.coefficient37_443,
  OriginalRow227TriangleData0570.coefficient37_444,
  OriginalRow227TriangleData0570.coefficient37_445,
  OriginalRow227TriangleData0570.coefficient37_446,
  OriginalRow227TriangleData0570.coefficient37_447,
  OriginalRow227TriangleData0570.coefficient37_448,
  OriginalRow227TriangleData0570.coefficient37_449,
  OriginalRow227TriangleData0570.coefficient37_450,
  OriginalRow227TriangleData0570.coefficient37_451
]

theorem values0570_size : values0570.size = 32 := rfl

def block0570 : ℕ → Option IntervalDyadic := segment 420 values0570

theorem block0570_domain : ExactDomain block0570 420 452 := by
  simpa only [values0570_size] using segment_domain 420 values0570

theorem block0570_get (i : Fin 32) :
    block0570 (420 + i.val) = some (values0570[i.val]'(by rw [values0570_size]; exact i.isLt)) := by
  exact segment_get 420 values0570 ⟨i.val, by rw [values0570_size]; exact i.isLt⟩

def values0571 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0571.coefficient37_452,
  OriginalRow227TriangleData0571.coefficient37_453,
  OriginalRow227TriangleData0571.coefficient37_454,
  OriginalRow227TriangleData0571.coefficient37_455,
  OriginalRow227TriangleData0571.coefficient37_456,
  OriginalRow227TriangleData0571.coefficient37_457,
  OriginalRow227TriangleData0571.coefficient37_458,
  OriginalRow227TriangleData0571.coefficient37_459,
  OriginalRow227TriangleData0571.coefficient37_460,
  OriginalRow227TriangleData0571.coefficient37_461,
  OriginalRow227TriangleData0571.coefficient37_462,
  OriginalRow227TriangleData0571.coefficient37_463,
  OriginalRow227TriangleData0571.coefficient37_464
]

theorem values0571_size : values0571.size = 13 := rfl

def block0571 : ℕ → Option IntervalDyadic := segment 452 values0571

theorem block0571_domain : ExactDomain block0571 452 465 := by
  simpa only [values0571_size] using segment_domain 452 values0571

theorem block0571_get (i : Fin 13) :
    block0571 (452 + i.val) = some (values0571[i.val]'(by rw [values0571_size]; exact i.isLt)) := by
  exact segment_get 452 values0571 ⟨i.val, by rw [values0571_size]; exact i.isLt⟩

def node0068_0132 : ℕ → Option IntervalDyadic := split 100 block0559 block0560

theorem node0068_0132_domain : ExactDomain node0068_0132 68 132 := by
  exact split_domain (by decide) (by decide) block0559_domain block0560_domain

def node0036_0132 : ℕ → Option IntervalDyadic := split 68 block0558 node0068_0132

theorem node0036_0132_domain : ExactDomain node0036_0132 36 132 := by
  exact split_domain (by decide) (by decide) block0558_domain node0068_0132_domain

def node0132_0196 : ℕ → Option IntervalDyadic := split 164 block0561 block0562

theorem node0132_0196_domain : ExactDomain node0132_0196 132 196 := by
  exact split_domain (by decide) (by decide) block0561_domain block0562_domain

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block0563 block0564

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block0563_domain block0564_domain

def node0132_0260 : ℕ → Option IntervalDyadic := split 196 node0132_0196 node0196_0260

theorem node0132_0260_domain : ExactDomain node0132_0260 132 260 := by
  exact split_domain (by decide) (by decide) node0132_0196_domain node0196_0260_domain

def node0036_0260 : ℕ → Option IntervalDyadic := split 132 node0036_0132 node0132_0260

theorem node0036_0260_domain : ExactDomain node0036_0260 36 260 := by
  exact split_domain (by decide) (by decide) node0036_0132_domain node0132_0260_domain

def node0292_0356 : ℕ → Option IntervalDyadic := split 324 block0566 block0567

theorem node0292_0356_domain : ExactDomain node0292_0356 292 356 := by
  exact split_domain (by decide) (by decide) block0566_domain block0567_domain

def node0260_0356 : ℕ → Option IntervalDyadic := split 292 block0565 node0292_0356

theorem node0260_0356_domain : ExactDomain node0260_0356 260 356 := by
  exact split_domain (by decide) (by decide) block0565_domain node0292_0356_domain

def node0356_0420 : ℕ → Option IntervalDyadic := split 388 block0568 block0569

theorem node0356_0420_domain : ExactDomain node0356_0420 356 420 := by
  exact split_domain (by decide) (by decide) block0568_domain block0569_domain

def node0420_0465 : ℕ → Option IntervalDyadic := split 452 block0570 block0571

theorem node0420_0465_domain : ExactDomain node0420_0465 420 465 := by
  exact split_domain (by decide) (by decide) block0570_domain block0571_domain

def node0356_0465 : ℕ → Option IntervalDyadic := split 420 node0356_0420 node0420_0465

theorem node0356_0465_domain : ExactDomain node0356_0465 356 465 := by
  exact split_domain (by decide) (by decide) node0356_0420_domain node0420_0465_domain

def node0260_0465 : ℕ → Option IntervalDyadic := split 356 node0260_0356 node0356_0465

theorem node0260_0465_domain : ExactDomain node0260_0465 260 465 := by
  exact split_domain (by decide) (by decide) node0260_0356_domain node0356_0465_domain

def node0036_0465 : ℕ → Option IntervalDyadic := split 260 node0036_0260 node0260_0465

theorem node0036_0465_domain : ExactDomain node0036_0465 36 465 := by
  exact split_domain (by decide) (by decide) node0036_0260_domain node0260_0465_domain

def lookup : ℕ → Option IntervalDyadic := node0036_0465

theorem lookup_domain : ExactDomain lookup 36 465 :=
  node0036_0465_domain

theorem block0558_lookup (i : Fin 32) :
    lookup (36 + i.val) = some (values0558[i.val]'(by rw [values0558_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (36 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_left 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0036_0132, split_left 68 block0558 node0068_0132 (by omega)]
  exact block0558_get i

theorem block0559_lookup (i : Fin 32) :
    lookup (68 + i.val) = some (values0559[i.val]'(by rw [values0559_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (68 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_left 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0036_0132, split_right 68 block0558 node0068_0132 (by omega)]
  rw [node0068_0132, split_left 100 block0559 block0560 (by omega)]
  exact block0559_get i

theorem block0560_lookup (i : Fin 32) :
    lookup (100 + i.val) = some (values0560[i.val]'(by rw [values0560_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (100 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_left 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0036_0132, split_right 68 block0558 node0068_0132 (by omega)]
  rw [node0068_0132, split_right 100 block0559 block0560 (by omega)]
  exact block0560_get i

theorem block0561_lookup (i : Fin 32) :
    lookup (132 + i.val) = some (values0561[i.val]'(by rw [values0561_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (132 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_right 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_left 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0132_0196, split_left 164 block0561 block0562 (by omega)]
  exact block0561_get i

theorem block0562_lookup (i : Fin 32) :
    lookup (164 + i.val) = some (values0562[i.val]'(by rw [values0562_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (164 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_right 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_left 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0132_0196, split_right 164 block0561 block0562 (by omega)]
  exact block0562_get i

theorem block0563_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values0563[i.val]'(by rw [values0563_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (196 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_right 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_right 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0196_0260, split_left 228 block0563 block0564 (by omega)]
  exact block0563_get i

theorem block0564_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values0564[i.val]'(by rw [values0564_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (228 + i.val) = _
  rw [node0036_0465, split_left 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0036_0260, split_right 132 node0036_0132 node0132_0260 (by omega)]
  rw [node0132_0260, split_right 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0196_0260, split_right 228 block0563 block0564 (by omega)]
  exact block0564_get i

theorem block0565_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values0565[i.val]'(by rw [values0565_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (260 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_left 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0260_0356, split_left 292 block0565 node0292_0356 (by omega)]
  exact block0565_get i

theorem block0566_lookup (i : Fin 32) :
    lookup (292 + i.val) = some (values0566[i.val]'(by rw [values0566_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (292 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_left 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0260_0356, split_right 292 block0565 node0292_0356 (by omega)]
  rw [node0292_0356, split_left 324 block0566 block0567 (by omega)]
  exact block0566_get i

theorem block0567_lookup (i : Fin 32) :
    lookup (324 + i.val) = some (values0567[i.val]'(by rw [values0567_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (324 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_left 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0260_0356, split_right 292 block0565 node0292_0356 (by omega)]
  rw [node0292_0356, split_right 324 block0566 block0567 (by omega)]
  exact block0567_get i

theorem block0568_lookup (i : Fin 32) :
    lookup (356 + i.val) = some (values0568[i.val]'(by rw [values0568_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (356 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_right 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0356_0465, split_left 420 node0356_0420 node0420_0465 (by omega)]
  rw [node0356_0420, split_left 388 block0568 block0569 (by omega)]
  exact block0568_get i

theorem block0569_lookup (i : Fin 32) :
    lookup (388 + i.val) = some (values0569[i.val]'(by rw [values0569_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (388 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_right 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0356_0465, split_left 420 node0356_0420 node0420_0465 (by omega)]
  rw [node0356_0420, split_right 388 block0568 block0569 (by omega)]
  exact block0569_get i

theorem block0570_lookup (i : Fin 32) :
    lookup (420 + i.val) = some (values0570[i.val]'(by rw [values0570_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (420 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_right 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0356_0465, split_right 420 node0356_0420 node0420_0465 (by omega)]
  rw [node0420_0465, split_left 452 block0570 block0571 (by omega)]
  exact block0570_get i

theorem block0571_lookup (i : Fin 13) :
    lookup (452 + i.val) = some (values0571[i.val]'(by rw [values0571_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0036_0465 (452 + i.val) = _
  rw [node0036_0465, split_right 260 node0036_0260 node0260_0465 (by omega)]
  rw [node0260_0465, split_right 356 node0260_0356 node0356_0465 (by omega)]
  rw [node0356_0465, split_right 420 node0356_0420 node0420_0465 (by omega)]
  rw [node0420_0465, split_right 452 block0570 block0571 (by omega)]
  exact block0571_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0558_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0558_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0559_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0559_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0560_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0560_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0561_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0561_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0562_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0562_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0563_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0563_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0564_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0564_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0565_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0565_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0566_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0566_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0567_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0567_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0568_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0568_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0569_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0569_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0570_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0570_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0571_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0571_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0558_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0559_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0560_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0561_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0562_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0563_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0564_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0565_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0566_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0567_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0568_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0569_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0570_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow037.block0571_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow037
