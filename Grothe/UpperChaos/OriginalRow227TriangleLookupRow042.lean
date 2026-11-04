import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0628
import Grothe.UpperChaos.OriginalRow227TriangleData0629
import Grothe.UpperChaos.OriginalRow227TriangleData0630
import Grothe.UpperChaos.OriginalRow227TriangleData0631
import Grothe.UpperChaos.OriginalRow227TriangleData0632
import Grothe.UpperChaos.OriginalRow227TriangleData0633
import Grothe.UpperChaos.OriginalRow227TriangleData0634
import Grothe.UpperChaos.OriginalRow227TriangleData0635
import Grothe.UpperChaos.OriginalRow227TriangleData0636
import Grothe.UpperChaos.OriginalRow227TriangleData0637
import Grothe.UpperChaos.OriginalRow227TriangleData0638
import Grothe.UpperChaos.OriginalRow227TriangleData0639
import Grothe.UpperChaos.OriginalRow227TriangleData0640
import Grothe.UpperChaos.OriginalRow227TriangleData0641

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow042

open ConditionalTableLookup

def values0628 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0628.coefficient42_41,
  OriginalRow227TriangleData0628.coefficient42_42,
  OriginalRow227TriangleData0628.coefficient42_43,
  OriginalRow227TriangleData0628.coefficient42_44,
  OriginalRow227TriangleData0628.coefficient42_45,
  OriginalRow227TriangleData0628.coefficient42_46,
  OriginalRow227TriangleData0628.coefficient42_47,
  OriginalRow227TriangleData0628.coefficient42_48,
  OriginalRow227TriangleData0628.coefficient42_49,
  OriginalRow227TriangleData0628.coefficient42_50,
  OriginalRow227TriangleData0628.coefficient42_51,
  OriginalRow227TriangleData0628.coefficient42_52,
  OriginalRow227TriangleData0628.coefficient42_53,
  OriginalRow227TriangleData0628.coefficient42_54,
  OriginalRow227TriangleData0628.coefficient42_55,
  OriginalRow227TriangleData0628.coefficient42_56,
  OriginalRow227TriangleData0628.coefficient42_57,
  OriginalRow227TriangleData0628.coefficient42_58,
  OriginalRow227TriangleData0628.coefficient42_59,
  OriginalRow227TriangleData0628.coefficient42_60,
  OriginalRow227TriangleData0628.coefficient42_61,
  OriginalRow227TriangleData0628.coefficient42_62,
  OriginalRow227TriangleData0628.coefficient42_63,
  OriginalRow227TriangleData0628.coefficient42_64,
  OriginalRow227TriangleData0628.coefficient42_65,
  OriginalRow227TriangleData0628.coefficient42_66,
  OriginalRow227TriangleData0628.coefficient42_67,
  OriginalRow227TriangleData0628.coefficient42_68,
  OriginalRow227TriangleData0628.coefficient42_69,
  OriginalRow227TriangleData0628.coefficient42_70,
  OriginalRow227TriangleData0628.coefficient42_71,
  OriginalRow227TriangleData0628.coefficient42_72
]

theorem values0628_size : values0628.size = 32 := rfl

def block0628 : ℕ → Option IntervalDyadic := segment 41 values0628

theorem block0628_domain : ExactDomain block0628 41 73 := by
  simpa only [values0628_size] using segment_domain 41 values0628

theorem block0628_get (i : Fin 32) :
    block0628 (41 + i.val) = some (values0628[i.val]'(by rw [values0628_size]; exact i.isLt)) := by
  exact segment_get 41 values0628 ⟨i.val, by rw [values0628_size]; exact i.isLt⟩

def values0629 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0629.coefficient42_73,
  OriginalRow227TriangleData0629.coefficient42_74,
  OriginalRow227TriangleData0629.coefficient42_75,
  OriginalRow227TriangleData0629.coefficient42_76,
  OriginalRow227TriangleData0629.coefficient42_77,
  OriginalRow227TriangleData0629.coefficient42_78,
  OriginalRow227TriangleData0629.coefficient42_79,
  OriginalRow227TriangleData0629.coefficient42_80,
  OriginalRow227TriangleData0629.coefficient42_81,
  OriginalRow227TriangleData0629.coefficient42_82,
  OriginalRow227TriangleData0629.coefficient42_83,
  OriginalRow227TriangleData0629.coefficient42_84,
  OriginalRow227TriangleData0629.coefficient42_85,
  OriginalRow227TriangleData0629.coefficient42_86,
  OriginalRow227TriangleData0629.coefficient42_87,
  OriginalRow227TriangleData0629.coefficient42_88,
  OriginalRow227TriangleData0629.coefficient42_89,
  OriginalRow227TriangleData0629.coefficient42_90,
  OriginalRow227TriangleData0629.coefficient42_91,
  OriginalRow227TriangleData0629.coefficient42_92,
  OriginalRow227TriangleData0629.coefficient42_93,
  OriginalRow227TriangleData0629.coefficient42_94,
  OriginalRow227TriangleData0629.coefficient42_95,
  OriginalRow227TriangleData0629.coefficient42_96,
  OriginalRow227TriangleData0629.coefficient42_97,
  OriginalRow227TriangleData0629.coefficient42_98,
  OriginalRow227TriangleData0629.coefficient42_99,
  OriginalRow227TriangleData0629.coefficient42_100,
  OriginalRow227TriangleData0629.coefficient42_101,
  OriginalRow227TriangleData0629.coefficient42_102,
  OriginalRow227TriangleData0629.coefficient42_103,
  OriginalRow227TriangleData0629.coefficient42_104
]

theorem values0629_size : values0629.size = 32 := rfl

def block0629 : ℕ → Option IntervalDyadic := segment 73 values0629

theorem block0629_domain : ExactDomain block0629 73 105 := by
  simpa only [values0629_size] using segment_domain 73 values0629

theorem block0629_get (i : Fin 32) :
    block0629 (73 + i.val) = some (values0629[i.val]'(by rw [values0629_size]; exact i.isLt)) := by
  exact segment_get 73 values0629 ⟨i.val, by rw [values0629_size]; exact i.isLt⟩

def values0630 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0630.coefficient42_105,
  OriginalRow227TriangleData0630.coefficient42_106,
  OriginalRow227TriangleData0630.coefficient42_107,
  OriginalRow227TriangleData0630.coefficient42_108,
  OriginalRow227TriangleData0630.coefficient42_109,
  OriginalRow227TriangleData0630.coefficient42_110,
  OriginalRow227TriangleData0630.coefficient42_111,
  OriginalRow227TriangleData0630.coefficient42_112,
  OriginalRow227TriangleData0630.coefficient42_113,
  OriginalRow227TriangleData0630.coefficient42_114,
  OriginalRow227TriangleData0630.coefficient42_115,
  OriginalRow227TriangleData0630.coefficient42_116,
  OriginalRow227TriangleData0630.coefficient42_117,
  OriginalRow227TriangleData0630.coefficient42_118,
  OriginalRow227TriangleData0630.coefficient42_119,
  OriginalRow227TriangleData0630.coefficient42_120,
  OriginalRow227TriangleData0630.coefficient42_121,
  OriginalRow227TriangleData0630.coefficient42_122,
  OriginalRow227TriangleData0630.coefficient42_123,
  OriginalRow227TriangleData0630.coefficient42_124,
  OriginalRow227TriangleData0630.coefficient42_125,
  OriginalRow227TriangleData0630.coefficient42_126,
  OriginalRow227TriangleData0630.coefficient42_127,
  OriginalRow227TriangleData0630.coefficient42_128,
  OriginalRow227TriangleData0630.coefficient42_129,
  OriginalRow227TriangleData0630.coefficient42_130,
  OriginalRow227TriangleData0630.coefficient42_131,
  OriginalRow227TriangleData0630.coefficient42_132,
  OriginalRow227TriangleData0630.coefficient42_133,
  OriginalRow227TriangleData0630.coefficient42_134,
  OriginalRow227TriangleData0630.coefficient42_135,
  OriginalRow227TriangleData0630.coefficient42_136
]

theorem values0630_size : values0630.size = 32 := rfl

def block0630 : ℕ → Option IntervalDyadic := segment 105 values0630

theorem block0630_domain : ExactDomain block0630 105 137 := by
  simpa only [values0630_size] using segment_domain 105 values0630

theorem block0630_get (i : Fin 32) :
    block0630 (105 + i.val) = some (values0630[i.val]'(by rw [values0630_size]; exact i.isLt)) := by
  exact segment_get 105 values0630 ⟨i.val, by rw [values0630_size]; exact i.isLt⟩

def values0631 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0631.coefficient42_137,
  OriginalRow227TriangleData0631.coefficient42_138,
  OriginalRow227TriangleData0631.coefficient42_139,
  OriginalRow227TriangleData0631.coefficient42_140,
  OriginalRow227TriangleData0631.coefficient42_141,
  OriginalRow227TriangleData0631.coefficient42_142,
  OriginalRow227TriangleData0631.coefficient42_143,
  OriginalRow227TriangleData0631.coefficient42_144,
  OriginalRow227TriangleData0631.coefficient42_145,
  OriginalRow227TriangleData0631.coefficient42_146,
  OriginalRow227TriangleData0631.coefficient42_147,
  OriginalRow227TriangleData0631.coefficient42_148,
  OriginalRow227TriangleData0631.coefficient42_149,
  OriginalRow227TriangleData0631.coefficient42_150,
  OriginalRow227TriangleData0631.coefficient42_151,
  OriginalRow227TriangleData0631.coefficient42_152,
  OriginalRow227TriangleData0631.coefficient42_153,
  OriginalRow227TriangleData0631.coefficient42_154,
  OriginalRow227TriangleData0631.coefficient42_155,
  OriginalRow227TriangleData0631.coefficient42_156,
  OriginalRow227TriangleData0631.coefficient42_157,
  OriginalRow227TriangleData0631.coefficient42_158,
  OriginalRow227TriangleData0631.coefficient42_159,
  OriginalRow227TriangleData0631.coefficient42_160,
  OriginalRow227TriangleData0631.coefficient42_161,
  OriginalRow227TriangleData0631.coefficient42_162,
  OriginalRow227TriangleData0631.coefficient42_163,
  OriginalRow227TriangleData0631.coefficient42_164,
  OriginalRow227TriangleData0631.coefficient42_165,
  OriginalRow227TriangleData0631.coefficient42_166,
  OriginalRow227TriangleData0631.coefficient42_167,
  OriginalRow227TriangleData0631.coefficient42_168
]

theorem values0631_size : values0631.size = 32 := rfl

def block0631 : ℕ → Option IntervalDyadic := segment 137 values0631

theorem block0631_domain : ExactDomain block0631 137 169 := by
  simpa only [values0631_size] using segment_domain 137 values0631

theorem block0631_get (i : Fin 32) :
    block0631 (137 + i.val) = some (values0631[i.val]'(by rw [values0631_size]; exact i.isLt)) := by
  exact segment_get 137 values0631 ⟨i.val, by rw [values0631_size]; exact i.isLt⟩

def values0632 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0632.coefficient42_169,
  OriginalRow227TriangleData0632.coefficient42_170,
  OriginalRow227TriangleData0632.coefficient42_171,
  OriginalRow227TriangleData0632.coefficient42_172,
  OriginalRow227TriangleData0632.coefficient42_173,
  OriginalRow227TriangleData0632.coefficient42_174,
  OriginalRow227TriangleData0632.coefficient42_175,
  OriginalRow227TriangleData0632.coefficient42_176,
  OriginalRow227TriangleData0632.coefficient42_177,
  OriginalRow227TriangleData0632.coefficient42_178,
  OriginalRow227TriangleData0632.coefficient42_179,
  OriginalRow227TriangleData0632.coefficient42_180,
  OriginalRow227TriangleData0632.coefficient42_181,
  OriginalRow227TriangleData0632.coefficient42_182,
  OriginalRow227TriangleData0632.coefficient42_183,
  OriginalRow227TriangleData0632.coefficient42_184,
  OriginalRow227TriangleData0632.coefficient42_185,
  OriginalRow227TriangleData0632.coefficient42_186,
  OriginalRow227TriangleData0632.coefficient42_187,
  OriginalRow227TriangleData0632.coefficient42_188,
  OriginalRow227TriangleData0632.coefficient42_189,
  OriginalRow227TriangleData0632.coefficient42_190,
  OriginalRow227TriangleData0632.coefficient42_191,
  OriginalRow227TriangleData0632.coefficient42_192,
  OriginalRow227TriangleData0632.coefficient42_193,
  OriginalRow227TriangleData0632.coefficient42_194,
  OriginalRow227TriangleData0632.coefficient42_195,
  OriginalRow227TriangleData0632.coefficient42_196,
  OriginalRow227TriangleData0632.coefficient42_197,
  OriginalRow227TriangleData0632.coefficient42_198,
  OriginalRow227TriangleData0632.coefficient42_199,
  OriginalRow227TriangleData0632.coefficient42_200
]

theorem values0632_size : values0632.size = 32 := rfl

def block0632 : ℕ → Option IntervalDyadic := segment 169 values0632

theorem block0632_domain : ExactDomain block0632 169 201 := by
  simpa only [values0632_size] using segment_domain 169 values0632

theorem block0632_get (i : Fin 32) :
    block0632 (169 + i.val) = some (values0632[i.val]'(by rw [values0632_size]; exact i.isLt)) := by
  exact segment_get 169 values0632 ⟨i.val, by rw [values0632_size]; exact i.isLt⟩

def values0633 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0633.coefficient42_201,
  OriginalRow227TriangleData0633.coefficient42_202,
  OriginalRow227TriangleData0633.coefficient42_203,
  OriginalRow227TriangleData0633.coefficient42_204,
  OriginalRow227TriangleData0633.coefficient42_205,
  OriginalRow227TriangleData0633.coefficient42_206,
  OriginalRow227TriangleData0633.coefficient42_207,
  OriginalRow227TriangleData0633.coefficient42_208,
  OriginalRow227TriangleData0633.coefficient42_209,
  OriginalRow227TriangleData0633.coefficient42_210,
  OriginalRow227TriangleData0633.coefficient42_211,
  OriginalRow227TriangleData0633.coefficient42_212,
  OriginalRow227TriangleData0633.coefficient42_213,
  OriginalRow227TriangleData0633.coefficient42_214,
  OriginalRow227TriangleData0633.coefficient42_215,
  OriginalRow227TriangleData0633.coefficient42_216,
  OriginalRow227TriangleData0633.coefficient42_217,
  OriginalRow227TriangleData0633.coefficient42_218,
  OriginalRow227TriangleData0633.coefficient42_219,
  OriginalRow227TriangleData0633.coefficient42_220,
  OriginalRow227TriangleData0633.coefficient42_221,
  OriginalRow227TriangleData0633.coefficient42_222,
  OriginalRow227TriangleData0633.coefficient42_223,
  OriginalRow227TriangleData0633.coefficient42_224,
  OriginalRow227TriangleData0633.coefficient42_225,
  OriginalRow227TriangleData0633.coefficient42_226,
  OriginalRow227TriangleData0633.coefficient42_227,
  OriginalRow227TriangleData0633.coefficient42_228,
  OriginalRow227TriangleData0633.coefficient42_229,
  OriginalRow227TriangleData0633.coefficient42_230,
  OriginalRow227TriangleData0633.coefficient42_231,
  OriginalRow227TriangleData0633.coefficient42_232
]

theorem values0633_size : values0633.size = 32 := rfl

def block0633 : ℕ → Option IntervalDyadic := segment 201 values0633

theorem block0633_domain : ExactDomain block0633 201 233 := by
  simpa only [values0633_size] using segment_domain 201 values0633

theorem block0633_get (i : Fin 32) :
    block0633 (201 + i.val) = some (values0633[i.val]'(by rw [values0633_size]; exact i.isLt)) := by
  exact segment_get 201 values0633 ⟨i.val, by rw [values0633_size]; exact i.isLt⟩

def values0634 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0634.coefficient42_233,
  OriginalRow227TriangleData0634.coefficient42_234,
  OriginalRow227TriangleData0634.coefficient42_235,
  OriginalRow227TriangleData0634.coefficient42_236,
  OriginalRow227TriangleData0634.coefficient42_237,
  OriginalRow227TriangleData0634.coefficient42_238,
  OriginalRow227TriangleData0634.coefficient42_239,
  OriginalRow227TriangleData0634.coefficient42_240,
  OriginalRow227TriangleData0634.coefficient42_241,
  OriginalRow227TriangleData0634.coefficient42_242,
  OriginalRow227TriangleData0634.coefficient42_243,
  OriginalRow227TriangleData0634.coefficient42_244,
  OriginalRow227TriangleData0634.coefficient42_245,
  OriginalRow227TriangleData0634.coefficient42_246,
  OriginalRow227TriangleData0634.coefficient42_247,
  OriginalRow227TriangleData0634.coefficient42_248,
  OriginalRow227TriangleData0634.coefficient42_249,
  OriginalRow227TriangleData0634.coefficient42_250,
  OriginalRow227TriangleData0634.coefficient42_251,
  OriginalRow227TriangleData0634.coefficient42_252,
  OriginalRow227TriangleData0634.coefficient42_253,
  OriginalRow227TriangleData0634.coefficient42_254,
  OriginalRow227TriangleData0634.coefficient42_255,
  OriginalRow227TriangleData0634.coefficient42_256,
  OriginalRow227TriangleData0634.coefficient42_257,
  OriginalRow227TriangleData0634.coefficient42_258,
  OriginalRow227TriangleData0634.coefficient42_259,
  OriginalRow227TriangleData0634.coefficient42_260,
  OriginalRow227TriangleData0634.coefficient42_261,
  OriginalRow227TriangleData0634.coefficient42_262,
  OriginalRow227TriangleData0634.coefficient42_263,
  OriginalRow227TriangleData0634.coefficient42_264
]

theorem values0634_size : values0634.size = 32 := rfl

def block0634 : ℕ → Option IntervalDyadic := segment 233 values0634

theorem block0634_domain : ExactDomain block0634 233 265 := by
  simpa only [values0634_size] using segment_domain 233 values0634

theorem block0634_get (i : Fin 32) :
    block0634 (233 + i.val) = some (values0634[i.val]'(by rw [values0634_size]; exact i.isLt)) := by
  exact segment_get 233 values0634 ⟨i.val, by rw [values0634_size]; exact i.isLt⟩

def values0635 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0635.coefficient42_265,
  OriginalRow227TriangleData0635.coefficient42_266,
  OriginalRow227TriangleData0635.coefficient42_267,
  OriginalRow227TriangleData0635.coefficient42_268,
  OriginalRow227TriangleData0635.coefficient42_269,
  OriginalRow227TriangleData0635.coefficient42_270,
  OriginalRow227TriangleData0635.coefficient42_271,
  OriginalRow227TriangleData0635.coefficient42_272,
  OriginalRow227TriangleData0635.coefficient42_273,
  OriginalRow227TriangleData0635.coefficient42_274,
  OriginalRow227TriangleData0635.coefficient42_275,
  OriginalRow227TriangleData0635.coefficient42_276,
  OriginalRow227TriangleData0635.coefficient42_277,
  OriginalRow227TriangleData0635.coefficient42_278,
  OriginalRow227TriangleData0635.coefficient42_279,
  OriginalRow227TriangleData0635.coefficient42_280,
  OriginalRow227TriangleData0635.coefficient42_281,
  OriginalRow227TriangleData0635.coefficient42_282,
  OriginalRow227TriangleData0635.coefficient42_283,
  OriginalRow227TriangleData0635.coefficient42_284,
  OriginalRow227TriangleData0635.coefficient42_285,
  OriginalRow227TriangleData0635.coefficient42_286,
  OriginalRow227TriangleData0635.coefficient42_287,
  OriginalRow227TriangleData0635.coefficient42_288,
  OriginalRow227TriangleData0635.coefficient42_289,
  OriginalRow227TriangleData0635.coefficient42_290,
  OriginalRow227TriangleData0635.coefficient42_291,
  OriginalRow227TriangleData0635.coefficient42_292,
  OriginalRow227TriangleData0635.coefficient42_293,
  OriginalRow227TriangleData0635.coefficient42_294,
  OriginalRow227TriangleData0635.coefficient42_295,
  OriginalRow227TriangleData0635.coefficient42_296
]

theorem values0635_size : values0635.size = 32 := rfl

def block0635 : ℕ → Option IntervalDyadic := segment 265 values0635

theorem block0635_domain : ExactDomain block0635 265 297 := by
  simpa only [values0635_size] using segment_domain 265 values0635

theorem block0635_get (i : Fin 32) :
    block0635 (265 + i.val) = some (values0635[i.val]'(by rw [values0635_size]; exact i.isLt)) := by
  exact segment_get 265 values0635 ⟨i.val, by rw [values0635_size]; exact i.isLt⟩

def values0636 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0636.coefficient42_297,
  OriginalRow227TriangleData0636.coefficient42_298,
  OriginalRow227TriangleData0636.coefficient42_299,
  OriginalRow227TriangleData0636.coefficient42_300,
  OriginalRow227TriangleData0636.coefficient42_301,
  OriginalRow227TriangleData0636.coefficient42_302,
  OriginalRow227TriangleData0636.coefficient42_303,
  OriginalRow227TriangleData0636.coefficient42_304,
  OriginalRow227TriangleData0636.coefficient42_305,
  OriginalRow227TriangleData0636.coefficient42_306,
  OriginalRow227TriangleData0636.coefficient42_307,
  OriginalRow227TriangleData0636.coefficient42_308,
  OriginalRow227TriangleData0636.coefficient42_309,
  OriginalRow227TriangleData0636.coefficient42_310,
  OriginalRow227TriangleData0636.coefficient42_311,
  OriginalRow227TriangleData0636.coefficient42_312,
  OriginalRow227TriangleData0636.coefficient42_313,
  OriginalRow227TriangleData0636.coefficient42_314,
  OriginalRow227TriangleData0636.coefficient42_315,
  OriginalRow227TriangleData0636.coefficient42_316,
  OriginalRow227TriangleData0636.coefficient42_317,
  OriginalRow227TriangleData0636.coefficient42_318,
  OriginalRow227TriangleData0636.coefficient42_319,
  OriginalRow227TriangleData0636.coefficient42_320,
  OriginalRow227TriangleData0636.coefficient42_321,
  OriginalRow227TriangleData0636.coefficient42_322,
  OriginalRow227TriangleData0636.coefficient42_323,
  OriginalRow227TriangleData0636.coefficient42_324,
  OriginalRow227TriangleData0636.coefficient42_325,
  OriginalRow227TriangleData0636.coefficient42_326,
  OriginalRow227TriangleData0636.coefficient42_327,
  OriginalRow227TriangleData0636.coefficient42_328
]

theorem values0636_size : values0636.size = 32 := rfl

def block0636 : ℕ → Option IntervalDyadic := segment 297 values0636

theorem block0636_domain : ExactDomain block0636 297 329 := by
  simpa only [values0636_size] using segment_domain 297 values0636

theorem block0636_get (i : Fin 32) :
    block0636 (297 + i.val) = some (values0636[i.val]'(by rw [values0636_size]; exact i.isLt)) := by
  exact segment_get 297 values0636 ⟨i.val, by rw [values0636_size]; exact i.isLt⟩

def values0637 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0637.coefficient42_329,
  OriginalRow227TriangleData0637.coefficient42_330,
  OriginalRow227TriangleData0637.coefficient42_331,
  OriginalRow227TriangleData0637.coefficient42_332,
  OriginalRow227TriangleData0637.coefficient42_333,
  OriginalRow227TriangleData0637.coefficient42_334,
  OriginalRow227TriangleData0637.coefficient42_335,
  OriginalRow227TriangleData0637.coefficient42_336,
  OriginalRow227TriangleData0637.coefficient42_337,
  OriginalRow227TriangleData0637.coefficient42_338,
  OriginalRow227TriangleData0637.coefficient42_339,
  OriginalRow227TriangleData0637.coefficient42_340,
  OriginalRow227TriangleData0637.coefficient42_341,
  OriginalRow227TriangleData0637.coefficient42_342,
  OriginalRow227TriangleData0637.coefficient42_343,
  OriginalRow227TriangleData0637.coefficient42_344,
  OriginalRow227TriangleData0637.coefficient42_345,
  OriginalRow227TriangleData0637.coefficient42_346,
  OriginalRow227TriangleData0637.coefficient42_347,
  OriginalRow227TriangleData0637.coefficient42_348,
  OriginalRow227TriangleData0637.coefficient42_349,
  OriginalRow227TriangleData0637.coefficient42_350,
  OriginalRow227TriangleData0637.coefficient42_351,
  OriginalRow227TriangleData0637.coefficient42_352,
  OriginalRow227TriangleData0637.coefficient42_353,
  OriginalRow227TriangleData0637.coefficient42_354,
  OriginalRow227TriangleData0637.coefficient42_355,
  OriginalRow227TriangleData0637.coefficient42_356,
  OriginalRow227TriangleData0637.coefficient42_357,
  OriginalRow227TriangleData0637.coefficient42_358,
  OriginalRow227TriangleData0637.coefficient42_359,
  OriginalRow227TriangleData0637.coefficient42_360
]

theorem values0637_size : values0637.size = 32 := rfl

def block0637 : ℕ → Option IntervalDyadic := segment 329 values0637

theorem block0637_domain : ExactDomain block0637 329 361 := by
  simpa only [values0637_size] using segment_domain 329 values0637

theorem block0637_get (i : Fin 32) :
    block0637 (329 + i.val) = some (values0637[i.val]'(by rw [values0637_size]; exact i.isLt)) := by
  exact segment_get 329 values0637 ⟨i.val, by rw [values0637_size]; exact i.isLt⟩

def values0638 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0638.coefficient42_361,
  OriginalRow227TriangleData0638.coefficient42_362,
  OriginalRow227TriangleData0638.coefficient42_363,
  OriginalRow227TriangleData0638.coefficient42_364,
  OriginalRow227TriangleData0638.coefficient42_365,
  OriginalRow227TriangleData0638.coefficient42_366,
  OriginalRow227TriangleData0638.coefficient42_367,
  OriginalRow227TriangleData0638.coefficient42_368,
  OriginalRow227TriangleData0638.coefficient42_369,
  OriginalRow227TriangleData0638.coefficient42_370,
  OriginalRow227TriangleData0638.coefficient42_371,
  OriginalRow227TriangleData0638.coefficient42_372,
  OriginalRow227TriangleData0638.coefficient42_373,
  OriginalRow227TriangleData0638.coefficient42_374,
  OriginalRow227TriangleData0638.coefficient42_375,
  OriginalRow227TriangleData0638.coefficient42_376,
  OriginalRow227TriangleData0638.coefficient42_377,
  OriginalRow227TriangleData0638.coefficient42_378,
  OriginalRow227TriangleData0638.coefficient42_379,
  OriginalRow227TriangleData0638.coefficient42_380,
  OriginalRow227TriangleData0638.coefficient42_381,
  OriginalRow227TriangleData0638.coefficient42_382,
  OriginalRow227TriangleData0638.coefficient42_383,
  OriginalRow227TriangleData0638.coefficient42_384,
  OriginalRow227TriangleData0638.coefficient42_385,
  OriginalRow227TriangleData0638.coefficient42_386,
  OriginalRow227TriangleData0638.coefficient42_387,
  OriginalRow227TriangleData0638.coefficient42_388,
  OriginalRow227TriangleData0638.coefficient42_389,
  OriginalRow227TriangleData0638.coefficient42_390,
  OriginalRow227TriangleData0638.coefficient42_391,
  OriginalRow227TriangleData0638.coefficient42_392
]

theorem values0638_size : values0638.size = 32 := rfl

def block0638 : ℕ → Option IntervalDyadic := segment 361 values0638

theorem block0638_domain : ExactDomain block0638 361 393 := by
  simpa only [values0638_size] using segment_domain 361 values0638

theorem block0638_get (i : Fin 32) :
    block0638 (361 + i.val) = some (values0638[i.val]'(by rw [values0638_size]; exact i.isLt)) := by
  exact segment_get 361 values0638 ⟨i.val, by rw [values0638_size]; exact i.isLt⟩

def values0639 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0639.coefficient42_393,
  OriginalRow227TriangleData0639.coefficient42_394,
  OriginalRow227TriangleData0639.coefficient42_395,
  OriginalRow227TriangleData0639.coefficient42_396,
  OriginalRow227TriangleData0639.coefficient42_397,
  OriginalRow227TriangleData0639.coefficient42_398,
  OriginalRow227TriangleData0639.coefficient42_399,
  OriginalRow227TriangleData0639.coefficient42_400,
  OriginalRow227TriangleData0639.coefficient42_401,
  OriginalRow227TriangleData0639.coefficient42_402,
  OriginalRow227TriangleData0639.coefficient42_403,
  OriginalRow227TriangleData0639.coefficient42_404,
  OriginalRow227TriangleData0639.coefficient42_405,
  OriginalRow227TriangleData0639.coefficient42_406,
  OriginalRow227TriangleData0639.coefficient42_407,
  OriginalRow227TriangleData0639.coefficient42_408,
  OriginalRow227TriangleData0639.coefficient42_409,
  OriginalRow227TriangleData0639.coefficient42_410,
  OriginalRow227TriangleData0639.coefficient42_411,
  OriginalRow227TriangleData0639.coefficient42_412,
  OriginalRow227TriangleData0639.coefficient42_413,
  OriginalRow227TriangleData0639.coefficient42_414,
  OriginalRow227TriangleData0639.coefficient42_415,
  OriginalRow227TriangleData0639.coefficient42_416,
  OriginalRow227TriangleData0639.coefficient42_417,
  OriginalRow227TriangleData0639.coefficient42_418,
  OriginalRow227TriangleData0639.coefficient42_419,
  OriginalRow227TriangleData0639.coefficient42_420,
  OriginalRow227TriangleData0639.coefficient42_421,
  OriginalRow227TriangleData0639.coefficient42_422,
  OriginalRow227TriangleData0639.coefficient42_423,
  OriginalRow227TriangleData0639.coefficient42_424
]

theorem values0639_size : values0639.size = 32 := rfl

def block0639 : ℕ → Option IntervalDyadic := segment 393 values0639

theorem block0639_domain : ExactDomain block0639 393 425 := by
  simpa only [values0639_size] using segment_domain 393 values0639

theorem block0639_get (i : Fin 32) :
    block0639 (393 + i.val) = some (values0639[i.val]'(by rw [values0639_size]; exact i.isLt)) := by
  exact segment_get 393 values0639 ⟨i.val, by rw [values0639_size]; exact i.isLt⟩

def values0640 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0640.coefficient42_425,
  OriginalRow227TriangleData0640.coefficient42_426,
  OriginalRow227TriangleData0640.coefficient42_427,
  OriginalRow227TriangleData0640.coefficient42_428,
  OriginalRow227TriangleData0640.coefficient42_429,
  OriginalRow227TriangleData0640.coefficient42_430,
  OriginalRow227TriangleData0640.coefficient42_431,
  OriginalRow227TriangleData0640.coefficient42_432,
  OriginalRow227TriangleData0640.coefficient42_433,
  OriginalRow227TriangleData0640.coefficient42_434,
  OriginalRow227TriangleData0640.coefficient42_435,
  OriginalRow227TriangleData0640.coefficient42_436,
  OriginalRow227TriangleData0640.coefficient42_437,
  OriginalRow227TriangleData0640.coefficient42_438,
  OriginalRow227TriangleData0640.coefficient42_439,
  OriginalRow227TriangleData0640.coefficient42_440,
  OriginalRow227TriangleData0640.coefficient42_441,
  OriginalRow227TriangleData0640.coefficient42_442,
  OriginalRow227TriangleData0640.coefficient42_443,
  OriginalRow227TriangleData0640.coefficient42_444,
  OriginalRow227TriangleData0640.coefficient42_445,
  OriginalRow227TriangleData0640.coefficient42_446,
  OriginalRow227TriangleData0640.coefficient42_447,
  OriginalRow227TriangleData0640.coefficient42_448,
  OriginalRow227TriangleData0640.coefficient42_449,
  OriginalRow227TriangleData0640.coefficient42_450,
  OriginalRow227TriangleData0640.coefficient42_451,
  OriginalRow227TriangleData0640.coefficient42_452,
  OriginalRow227TriangleData0640.coefficient42_453,
  OriginalRow227TriangleData0640.coefficient42_454,
  OriginalRow227TriangleData0640.coefficient42_455,
  OriginalRow227TriangleData0640.coefficient42_456
]

theorem values0640_size : values0640.size = 32 := rfl

def block0640 : ℕ → Option IntervalDyadic := segment 425 values0640

theorem block0640_domain : ExactDomain block0640 425 457 := by
  simpa only [values0640_size] using segment_domain 425 values0640

theorem block0640_get (i : Fin 32) :
    block0640 (425 + i.val) = some (values0640[i.val]'(by rw [values0640_size]; exact i.isLt)) := by
  exact segment_get 425 values0640 ⟨i.val, by rw [values0640_size]; exact i.isLt⟩

def values0641 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0641.coefficient42_457,
  OriginalRow227TriangleData0641.coefficient42_458,
  OriginalRow227TriangleData0641.coefficient42_459
]

theorem values0641_size : values0641.size = 3 := rfl

def block0641 : ℕ → Option IntervalDyadic := segment 457 values0641

theorem block0641_domain : ExactDomain block0641 457 460 := by
  simpa only [values0641_size] using segment_domain 457 values0641

theorem block0641_get (i : Fin 3) :
    block0641 (457 + i.val) = some (values0641[i.val]'(by rw [values0641_size]; exact i.isLt)) := by
  exact segment_get 457 values0641 ⟨i.val, by rw [values0641_size]; exact i.isLt⟩

def node0073_0137 : ℕ → Option IntervalDyadic := split 105 block0629 block0630

theorem node0073_0137_domain : ExactDomain node0073_0137 73 137 := by
  exact split_domain (by decide) (by decide) block0629_domain block0630_domain

def node0041_0137 : ℕ → Option IntervalDyadic := split 73 block0628 node0073_0137

theorem node0041_0137_domain : ExactDomain node0041_0137 41 137 := by
  exact split_domain (by decide) (by decide) block0628_domain node0073_0137_domain

def node0137_0201 : ℕ → Option IntervalDyadic := split 169 block0631 block0632

theorem node0137_0201_domain : ExactDomain node0137_0201 137 201 := by
  exact split_domain (by decide) (by decide) block0631_domain block0632_domain

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block0633 block0634

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block0633_domain block0634_domain

def node0137_0265 : ℕ → Option IntervalDyadic := split 201 node0137_0201 node0201_0265

theorem node0137_0265_domain : ExactDomain node0137_0265 137 265 := by
  exact split_domain (by decide) (by decide) node0137_0201_domain node0201_0265_domain

def node0041_0265 : ℕ → Option IntervalDyadic := split 137 node0041_0137 node0137_0265

theorem node0041_0265_domain : ExactDomain node0041_0265 41 265 := by
  exact split_domain (by decide) (by decide) node0041_0137_domain node0137_0265_domain

def node0297_0361 : ℕ → Option IntervalDyadic := split 329 block0636 block0637

theorem node0297_0361_domain : ExactDomain node0297_0361 297 361 := by
  exact split_domain (by decide) (by decide) block0636_domain block0637_domain

def node0265_0361 : ℕ → Option IntervalDyadic := split 297 block0635 node0297_0361

theorem node0265_0361_domain : ExactDomain node0265_0361 265 361 := by
  exact split_domain (by decide) (by decide) block0635_domain node0297_0361_domain

def node0361_0425 : ℕ → Option IntervalDyadic := split 393 block0638 block0639

theorem node0361_0425_domain : ExactDomain node0361_0425 361 425 := by
  exact split_domain (by decide) (by decide) block0638_domain block0639_domain

def node0425_0460 : ℕ → Option IntervalDyadic := split 457 block0640 block0641

theorem node0425_0460_domain : ExactDomain node0425_0460 425 460 := by
  exact split_domain (by decide) (by decide) block0640_domain block0641_domain

def node0361_0460 : ℕ → Option IntervalDyadic := split 425 node0361_0425 node0425_0460

theorem node0361_0460_domain : ExactDomain node0361_0460 361 460 := by
  exact split_domain (by decide) (by decide) node0361_0425_domain node0425_0460_domain

def node0265_0460 : ℕ → Option IntervalDyadic := split 361 node0265_0361 node0361_0460

theorem node0265_0460_domain : ExactDomain node0265_0460 265 460 := by
  exact split_domain (by decide) (by decide) node0265_0361_domain node0361_0460_domain

def node0041_0460 : ℕ → Option IntervalDyadic := split 265 node0041_0265 node0265_0460

theorem node0041_0460_domain : ExactDomain node0041_0460 41 460 := by
  exact split_domain (by decide) (by decide) node0041_0265_domain node0265_0460_domain

def lookup : ℕ → Option IntervalDyadic := node0041_0460

theorem lookup_domain : ExactDomain lookup 41 460 :=
  node0041_0460_domain

theorem block0628_lookup (i : Fin 32) :
    lookup (41 + i.val) = some (values0628[i.val]'(by rw [values0628_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (41 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_left 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0041_0137, split_left 73 block0628 node0073_0137 (by omega)]
  exact block0628_get i

theorem block0629_lookup (i : Fin 32) :
    lookup (73 + i.val) = some (values0629[i.val]'(by rw [values0629_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (73 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_left 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0041_0137, split_right 73 block0628 node0073_0137 (by omega)]
  rw [node0073_0137, split_left 105 block0629 block0630 (by omega)]
  exact block0629_get i

theorem block0630_lookup (i : Fin 32) :
    lookup (105 + i.val) = some (values0630[i.val]'(by rw [values0630_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (105 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_left 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0041_0137, split_right 73 block0628 node0073_0137 (by omega)]
  rw [node0073_0137, split_right 105 block0629 block0630 (by omega)]
  exact block0630_get i

theorem block0631_lookup (i : Fin 32) :
    lookup (137 + i.val) = some (values0631[i.val]'(by rw [values0631_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (137 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_right 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_left 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0137_0201, split_left 169 block0631 block0632 (by omega)]
  exact block0631_get i

theorem block0632_lookup (i : Fin 32) :
    lookup (169 + i.val) = some (values0632[i.val]'(by rw [values0632_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (169 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_right 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_left 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0137_0201, split_right 169 block0631 block0632 (by omega)]
  exact block0632_get i

theorem block0633_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values0633[i.val]'(by rw [values0633_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (201 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_right 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_right 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0201_0265, split_left 233 block0633 block0634 (by omega)]
  exact block0633_get i

theorem block0634_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values0634[i.val]'(by rw [values0634_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (233 + i.val) = _
  rw [node0041_0460, split_left 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0041_0265, split_right 137 node0041_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_right 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0201_0265, split_right 233 block0633 block0634 (by omega)]
  exact block0634_get i

theorem block0635_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values0635[i.val]'(by rw [values0635_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (265 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_left 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0265_0361, split_left 297 block0635 node0297_0361 (by omega)]
  exact block0635_get i

theorem block0636_lookup (i : Fin 32) :
    lookup (297 + i.val) = some (values0636[i.val]'(by rw [values0636_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (297 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_left 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0265_0361, split_right 297 block0635 node0297_0361 (by omega)]
  rw [node0297_0361, split_left 329 block0636 block0637 (by omega)]
  exact block0636_get i

theorem block0637_lookup (i : Fin 32) :
    lookup (329 + i.val) = some (values0637[i.val]'(by rw [values0637_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (329 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_left 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0265_0361, split_right 297 block0635 node0297_0361 (by omega)]
  rw [node0297_0361, split_right 329 block0636 block0637 (by omega)]
  exact block0637_get i

theorem block0638_lookup (i : Fin 32) :
    lookup (361 + i.val) = some (values0638[i.val]'(by rw [values0638_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (361 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_right 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0361_0460, split_left 425 node0361_0425 node0425_0460 (by omega)]
  rw [node0361_0425, split_left 393 block0638 block0639 (by omega)]
  exact block0638_get i

theorem block0639_lookup (i : Fin 32) :
    lookup (393 + i.val) = some (values0639[i.val]'(by rw [values0639_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (393 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_right 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0361_0460, split_left 425 node0361_0425 node0425_0460 (by omega)]
  rw [node0361_0425, split_right 393 block0638 block0639 (by omega)]
  exact block0639_get i

theorem block0640_lookup (i : Fin 32) :
    lookup (425 + i.val) = some (values0640[i.val]'(by rw [values0640_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (425 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_right 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0361_0460, split_right 425 node0361_0425 node0425_0460 (by omega)]
  rw [node0425_0460, split_left 457 block0640 block0641 (by omega)]
  exact block0640_get i

theorem block0641_lookup (i : Fin 3) :
    lookup (457 + i.val) = some (values0641[i.val]'(by rw [values0641_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0041_0460 (457 + i.val) = _
  rw [node0041_0460, split_right 265 node0041_0265 node0265_0460 (by omega)]
  rw [node0265_0460, split_right 361 node0265_0361 node0361_0460 (by omega)]
  rw [node0361_0460, split_right 425 node0361_0425 node0425_0460 (by omega)]
  rw [node0425_0460, split_right 457 block0640 block0641 (by omega)]
  exact block0641_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0628_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0628_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0629_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0629_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0630_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0630_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0631_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0631_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0632_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0632_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0633_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0633_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0634_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0634_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0635_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0635_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0636_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0636_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0637_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0637_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0638_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0638_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0639_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0639_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0640_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0640_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0641_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0641_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0628_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0629_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0630_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0631_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0632_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0633_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0634_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0635_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0636_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0637_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0638_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0639_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0640_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow042.block0641_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow042
