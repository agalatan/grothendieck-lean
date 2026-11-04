import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0516
import Grothe.UpperChaos.OriginalRow227TriangleData0517
import Grothe.UpperChaos.OriginalRow227TriangleData0518
import Grothe.UpperChaos.OriginalRow227TriangleData0519
import Grothe.UpperChaos.OriginalRow227TriangleData0520
import Grothe.UpperChaos.OriginalRow227TriangleData0521
import Grothe.UpperChaos.OriginalRow227TriangleData0522
import Grothe.UpperChaos.OriginalRow227TriangleData0523
import Grothe.UpperChaos.OriginalRow227TriangleData0524
import Grothe.UpperChaos.OriginalRow227TriangleData0525
import Grothe.UpperChaos.OriginalRow227TriangleData0526
import Grothe.UpperChaos.OriginalRow227TriangleData0527
import Grothe.UpperChaos.OriginalRow227TriangleData0528
import Grothe.UpperChaos.OriginalRow227TriangleData0529

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow034

open ConditionalTableLookup

def values0516 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0516.coefficient34_33,
  OriginalRow227TriangleData0516.coefficient34_34,
  OriginalRow227TriangleData0516.coefficient34_35,
  OriginalRow227TriangleData0516.coefficient34_36,
  OriginalRow227TriangleData0516.coefficient34_37,
  OriginalRow227TriangleData0516.coefficient34_38,
  OriginalRow227TriangleData0516.coefficient34_39,
  OriginalRow227TriangleData0516.coefficient34_40,
  OriginalRow227TriangleData0516.coefficient34_41,
  OriginalRow227TriangleData0516.coefficient34_42,
  OriginalRow227TriangleData0516.coefficient34_43,
  OriginalRow227TriangleData0516.coefficient34_44,
  OriginalRow227TriangleData0516.coefficient34_45,
  OriginalRow227TriangleData0516.coefficient34_46,
  OriginalRow227TriangleData0516.coefficient34_47,
  OriginalRow227TriangleData0516.coefficient34_48,
  OriginalRow227TriangleData0516.coefficient34_49,
  OriginalRow227TriangleData0516.coefficient34_50,
  OriginalRow227TriangleData0516.coefficient34_51,
  OriginalRow227TriangleData0516.coefficient34_52,
  OriginalRow227TriangleData0516.coefficient34_53,
  OriginalRow227TriangleData0516.coefficient34_54,
  OriginalRow227TriangleData0516.coefficient34_55,
  OriginalRow227TriangleData0516.coefficient34_56,
  OriginalRow227TriangleData0516.coefficient34_57,
  OriginalRow227TriangleData0516.coefficient34_58,
  OriginalRow227TriangleData0516.coefficient34_59,
  OriginalRow227TriangleData0516.coefficient34_60,
  OriginalRow227TriangleData0516.coefficient34_61,
  OriginalRow227TriangleData0516.coefficient34_62,
  OriginalRow227TriangleData0516.coefficient34_63,
  OriginalRow227TriangleData0516.coefficient34_64
]

theorem values0516_size : values0516.size = 32 := rfl

def block0516 : ℕ → Option IntervalDyadic := segment 33 values0516

theorem block0516_domain : ExactDomain block0516 33 65 := by
  simpa only [values0516_size] using segment_domain 33 values0516

theorem block0516_get (i : Fin 32) :
    block0516 (33 + i.val) = some (values0516[i.val]'(by rw [values0516_size]; exact i.isLt)) := by
  exact segment_get 33 values0516 ⟨i.val, by rw [values0516_size]; exact i.isLt⟩

def values0517 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0517.coefficient34_65,
  OriginalRow227TriangleData0517.coefficient34_66,
  OriginalRow227TriangleData0517.coefficient34_67,
  OriginalRow227TriangleData0517.coefficient34_68,
  OriginalRow227TriangleData0517.coefficient34_69,
  OriginalRow227TriangleData0517.coefficient34_70,
  OriginalRow227TriangleData0517.coefficient34_71,
  OriginalRow227TriangleData0517.coefficient34_72,
  OriginalRow227TriangleData0517.coefficient34_73,
  OriginalRow227TriangleData0517.coefficient34_74,
  OriginalRow227TriangleData0517.coefficient34_75,
  OriginalRow227TriangleData0517.coefficient34_76,
  OriginalRow227TriangleData0517.coefficient34_77,
  OriginalRow227TriangleData0517.coefficient34_78,
  OriginalRow227TriangleData0517.coefficient34_79,
  OriginalRow227TriangleData0517.coefficient34_80,
  OriginalRow227TriangleData0517.coefficient34_81,
  OriginalRow227TriangleData0517.coefficient34_82,
  OriginalRow227TriangleData0517.coefficient34_83,
  OriginalRow227TriangleData0517.coefficient34_84,
  OriginalRow227TriangleData0517.coefficient34_85,
  OriginalRow227TriangleData0517.coefficient34_86,
  OriginalRow227TriangleData0517.coefficient34_87,
  OriginalRow227TriangleData0517.coefficient34_88,
  OriginalRow227TriangleData0517.coefficient34_89,
  OriginalRow227TriangleData0517.coefficient34_90,
  OriginalRow227TriangleData0517.coefficient34_91,
  OriginalRow227TriangleData0517.coefficient34_92,
  OriginalRow227TriangleData0517.coefficient34_93,
  OriginalRow227TriangleData0517.coefficient34_94,
  OriginalRow227TriangleData0517.coefficient34_95,
  OriginalRow227TriangleData0517.coefficient34_96
]

theorem values0517_size : values0517.size = 32 := rfl

def block0517 : ℕ → Option IntervalDyadic := segment 65 values0517

theorem block0517_domain : ExactDomain block0517 65 97 := by
  simpa only [values0517_size] using segment_domain 65 values0517

theorem block0517_get (i : Fin 32) :
    block0517 (65 + i.val) = some (values0517[i.val]'(by rw [values0517_size]; exact i.isLt)) := by
  exact segment_get 65 values0517 ⟨i.val, by rw [values0517_size]; exact i.isLt⟩

def values0518 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0518.coefficient34_97,
  OriginalRow227TriangleData0518.coefficient34_98,
  OriginalRow227TriangleData0518.coefficient34_99,
  OriginalRow227TriangleData0518.coefficient34_100,
  OriginalRow227TriangleData0518.coefficient34_101,
  OriginalRow227TriangleData0518.coefficient34_102,
  OriginalRow227TriangleData0518.coefficient34_103,
  OriginalRow227TriangleData0518.coefficient34_104,
  OriginalRow227TriangleData0518.coefficient34_105,
  OriginalRow227TriangleData0518.coefficient34_106,
  OriginalRow227TriangleData0518.coefficient34_107,
  OriginalRow227TriangleData0518.coefficient34_108,
  OriginalRow227TriangleData0518.coefficient34_109,
  OriginalRow227TriangleData0518.coefficient34_110,
  OriginalRow227TriangleData0518.coefficient34_111,
  OriginalRow227TriangleData0518.coefficient34_112,
  OriginalRow227TriangleData0518.coefficient34_113,
  OriginalRow227TriangleData0518.coefficient34_114,
  OriginalRow227TriangleData0518.coefficient34_115,
  OriginalRow227TriangleData0518.coefficient34_116,
  OriginalRow227TriangleData0518.coefficient34_117,
  OriginalRow227TriangleData0518.coefficient34_118,
  OriginalRow227TriangleData0518.coefficient34_119,
  OriginalRow227TriangleData0518.coefficient34_120,
  OriginalRow227TriangleData0518.coefficient34_121,
  OriginalRow227TriangleData0518.coefficient34_122,
  OriginalRow227TriangleData0518.coefficient34_123,
  OriginalRow227TriangleData0518.coefficient34_124,
  OriginalRow227TriangleData0518.coefficient34_125,
  OriginalRow227TriangleData0518.coefficient34_126,
  OriginalRow227TriangleData0518.coefficient34_127,
  OriginalRow227TriangleData0518.coefficient34_128
]

theorem values0518_size : values0518.size = 32 := rfl

def block0518 : ℕ → Option IntervalDyadic := segment 97 values0518

theorem block0518_domain : ExactDomain block0518 97 129 := by
  simpa only [values0518_size] using segment_domain 97 values0518

theorem block0518_get (i : Fin 32) :
    block0518 (97 + i.val) = some (values0518[i.val]'(by rw [values0518_size]; exact i.isLt)) := by
  exact segment_get 97 values0518 ⟨i.val, by rw [values0518_size]; exact i.isLt⟩

def values0519 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0519.coefficient34_129,
  OriginalRow227TriangleData0519.coefficient34_130,
  OriginalRow227TriangleData0519.coefficient34_131,
  OriginalRow227TriangleData0519.coefficient34_132,
  OriginalRow227TriangleData0519.coefficient34_133,
  OriginalRow227TriangleData0519.coefficient34_134,
  OriginalRow227TriangleData0519.coefficient34_135,
  OriginalRow227TriangleData0519.coefficient34_136,
  OriginalRow227TriangleData0519.coefficient34_137,
  OriginalRow227TriangleData0519.coefficient34_138,
  OriginalRow227TriangleData0519.coefficient34_139,
  OriginalRow227TriangleData0519.coefficient34_140,
  OriginalRow227TriangleData0519.coefficient34_141,
  OriginalRow227TriangleData0519.coefficient34_142,
  OriginalRow227TriangleData0519.coefficient34_143,
  OriginalRow227TriangleData0519.coefficient34_144,
  OriginalRow227TriangleData0519.coefficient34_145,
  OriginalRow227TriangleData0519.coefficient34_146,
  OriginalRow227TriangleData0519.coefficient34_147,
  OriginalRow227TriangleData0519.coefficient34_148,
  OriginalRow227TriangleData0519.coefficient34_149,
  OriginalRow227TriangleData0519.coefficient34_150,
  OriginalRow227TriangleData0519.coefficient34_151,
  OriginalRow227TriangleData0519.coefficient34_152,
  OriginalRow227TriangleData0519.coefficient34_153,
  OriginalRow227TriangleData0519.coefficient34_154,
  OriginalRow227TriangleData0519.coefficient34_155,
  OriginalRow227TriangleData0519.coefficient34_156,
  OriginalRow227TriangleData0519.coefficient34_157,
  OriginalRow227TriangleData0519.coefficient34_158,
  OriginalRow227TriangleData0519.coefficient34_159,
  OriginalRow227TriangleData0519.coefficient34_160
]

theorem values0519_size : values0519.size = 32 := rfl

def block0519 : ℕ → Option IntervalDyadic := segment 129 values0519

theorem block0519_domain : ExactDomain block0519 129 161 := by
  simpa only [values0519_size] using segment_domain 129 values0519

theorem block0519_get (i : Fin 32) :
    block0519 (129 + i.val) = some (values0519[i.val]'(by rw [values0519_size]; exact i.isLt)) := by
  exact segment_get 129 values0519 ⟨i.val, by rw [values0519_size]; exact i.isLt⟩

def values0520 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0520.coefficient34_161,
  OriginalRow227TriangleData0520.coefficient34_162,
  OriginalRow227TriangleData0520.coefficient34_163,
  OriginalRow227TriangleData0520.coefficient34_164,
  OriginalRow227TriangleData0520.coefficient34_165,
  OriginalRow227TriangleData0520.coefficient34_166,
  OriginalRow227TriangleData0520.coefficient34_167,
  OriginalRow227TriangleData0520.coefficient34_168,
  OriginalRow227TriangleData0520.coefficient34_169,
  OriginalRow227TriangleData0520.coefficient34_170,
  OriginalRow227TriangleData0520.coefficient34_171,
  OriginalRow227TriangleData0520.coefficient34_172,
  OriginalRow227TriangleData0520.coefficient34_173,
  OriginalRow227TriangleData0520.coefficient34_174,
  OriginalRow227TriangleData0520.coefficient34_175,
  OriginalRow227TriangleData0520.coefficient34_176,
  OriginalRow227TriangleData0520.coefficient34_177,
  OriginalRow227TriangleData0520.coefficient34_178,
  OriginalRow227TriangleData0520.coefficient34_179,
  OriginalRow227TriangleData0520.coefficient34_180,
  OriginalRow227TriangleData0520.coefficient34_181,
  OriginalRow227TriangleData0520.coefficient34_182,
  OriginalRow227TriangleData0520.coefficient34_183,
  OriginalRow227TriangleData0520.coefficient34_184,
  OriginalRow227TriangleData0520.coefficient34_185,
  OriginalRow227TriangleData0520.coefficient34_186,
  OriginalRow227TriangleData0520.coefficient34_187,
  OriginalRow227TriangleData0520.coefficient34_188,
  OriginalRow227TriangleData0520.coefficient34_189,
  OriginalRow227TriangleData0520.coefficient34_190,
  OriginalRow227TriangleData0520.coefficient34_191,
  OriginalRow227TriangleData0520.coefficient34_192
]

theorem values0520_size : values0520.size = 32 := rfl

def block0520 : ℕ → Option IntervalDyadic := segment 161 values0520

theorem block0520_domain : ExactDomain block0520 161 193 := by
  simpa only [values0520_size] using segment_domain 161 values0520

theorem block0520_get (i : Fin 32) :
    block0520 (161 + i.val) = some (values0520[i.val]'(by rw [values0520_size]; exact i.isLt)) := by
  exact segment_get 161 values0520 ⟨i.val, by rw [values0520_size]; exact i.isLt⟩

def values0521 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0521.coefficient34_193,
  OriginalRow227TriangleData0521.coefficient34_194,
  OriginalRow227TriangleData0521.coefficient34_195,
  OriginalRow227TriangleData0521.coefficient34_196,
  OriginalRow227TriangleData0521.coefficient34_197,
  OriginalRow227TriangleData0521.coefficient34_198,
  OriginalRow227TriangleData0521.coefficient34_199,
  OriginalRow227TriangleData0521.coefficient34_200,
  OriginalRow227TriangleData0521.coefficient34_201,
  OriginalRow227TriangleData0521.coefficient34_202,
  OriginalRow227TriangleData0521.coefficient34_203,
  OriginalRow227TriangleData0521.coefficient34_204,
  OriginalRow227TriangleData0521.coefficient34_205,
  OriginalRow227TriangleData0521.coefficient34_206,
  OriginalRow227TriangleData0521.coefficient34_207,
  OriginalRow227TriangleData0521.coefficient34_208,
  OriginalRow227TriangleData0521.coefficient34_209,
  OriginalRow227TriangleData0521.coefficient34_210,
  OriginalRow227TriangleData0521.coefficient34_211,
  OriginalRow227TriangleData0521.coefficient34_212,
  OriginalRow227TriangleData0521.coefficient34_213,
  OriginalRow227TriangleData0521.coefficient34_214,
  OriginalRow227TriangleData0521.coefficient34_215,
  OriginalRow227TriangleData0521.coefficient34_216,
  OriginalRow227TriangleData0521.coefficient34_217,
  OriginalRow227TriangleData0521.coefficient34_218,
  OriginalRow227TriangleData0521.coefficient34_219,
  OriginalRow227TriangleData0521.coefficient34_220,
  OriginalRow227TriangleData0521.coefficient34_221,
  OriginalRow227TriangleData0521.coefficient34_222,
  OriginalRow227TriangleData0521.coefficient34_223,
  OriginalRow227TriangleData0521.coefficient34_224
]

theorem values0521_size : values0521.size = 32 := rfl

def block0521 : ℕ → Option IntervalDyadic := segment 193 values0521

theorem block0521_domain : ExactDomain block0521 193 225 := by
  simpa only [values0521_size] using segment_domain 193 values0521

theorem block0521_get (i : Fin 32) :
    block0521 (193 + i.val) = some (values0521[i.val]'(by rw [values0521_size]; exact i.isLt)) := by
  exact segment_get 193 values0521 ⟨i.val, by rw [values0521_size]; exact i.isLt⟩

def values0522 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0522.coefficient34_225,
  OriginalRow227TriangleData0522.coefficient34_226,
  OriginalRow227TriangleData0522.coefficient34_227,
  OriginalRow227TriangleData0522.coefficient34_228,
  OriginalRow227TriangleData0522.coefficient34_229,
  OriginalRow227TriangleData0522.coefficient34_230,
  OriginalRow227TriangleData0522.coefficient34_231,
  OriginalRow227TriangleData0522.coefficient34_232,
  OriginalRow227TriangleData0522.coefficient34_233,
  OriginalRow227TriangleData0522.coefficient34_234,
  OriginalRow227TriangleData0522.coefficient34_235,
  OriginalRow227TriangleData0522.coefficient34_236,
  OriginalRow227TriangleData0522.coefficient34_237,
  OriginalRow227TriangleData0522.coefficient34_238,
  OriginalRow227TriangleData0522.coefficient34_239,
  OriginalRow227TriangleData0522.coefficient34_240,
  OriginalRow227TriangleData0522.coefficient34_241,
  OriginalRow227TriangleData0522.coefficient34_242,
  OriginalRow227TriangleData0522.coefficient34_243,
  OriginalRow227TriangleData0522.coefficient34_244,
  OriginalRow227TriangleData0522.coefficient34_245,
  OriginalRow227TriangleData0522.coefficient34_246,
  OriginalRow227TriangleData0522.coefficient34_247,
  OriginalRow227TriangleData0522.coefficient34_248,
  OriginalRow227TriangleData0522.coefficient34_249,
  OriginalRow227TriangleData0522.coefficient34_250,
  OriginalRow227TriangleData0522.coefficient34_251,
  OriginalRow227TriangleData0522.coefficient34_252,
  OriginalRow227TriangleData0522.coefficient34_253,
  OriginalRow227TriangleData0522.coefficient34_254,
  OriginalRow227TriangleData0522.coefficient34_255,
  OriginalRow227TriangleData0522.coefficient34_256
]

theorem values0522_size : values0522.size = 32 := rfl

def block0522 : ℕ → Option IntervalDyadic := segment 225 values0522

theorem block0522_domain : ExactDomain block0522 225 257 := by
  simpa only [values0522_size] using segment_domain 225 values0522

theorem block0522_get (i : Fin 32) :
    block0522 (225 + i.val) = some (values0522[i.val]'(by rw [values0522_size]; exact i.isLt)) := by
  exact segment_get 225 values0522 ⟨i.val, by rw [values0522_size]; exact i.isLt⟩

def values0523 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0523.coefficient34_257,
  OriginalRow227TriangleData0523.coefficient34_258,
  OriginalRow227TriangleData0523.coefficient34_259,
  OriginalRow227TriangleData0523.coefficient34_260,
  OriginalRow227TriangleData0523.coefficient34_261,
  OriginalRow227TriangleData0523.coefficient34_262,
  OriginalRow227TriangleData0523.coefficient34_263,
  OriginalRow227TriangleData0523.coefficient34_264,
  OriginalRow227TriangleData0523.coefficient34_265,
  OriginalRow227TriangleData0523.coefficient34_266,
  OriginalRow227TriangleData0523.coefficient34_267,
  OriginalRow227TriangleData0523.coefficient34_268,
  OriginalRow227TriangleData0523.coefficient34_269,
  OriginalRow227TriangleData0523.coefficient34_270,
  OriginalRow227TriangleData0523.coefficient34_271,
  OriginalRow227TriangleData0523.coefficient34_272,
  OriginalRow227TriangleData0523.coefficient34_273,
  OriginalRow227TriangleData0523.coefficient34_274,
  OriginalRow227TriangleData0523.coefficient34_275,
  OriginalRow227TriangleData0523.coefficient34_276,
  OriginalRow227TriangleData0523.coefficient34_277,
  OriginalRow227TriangleData0523.coefficient34_278,
  OriginalRow227TriangleData0523.coefficient34_279,
  OriginalRow227TriangleData0523.coefficient34_280,
  OriginalRow227TriangleData0523.coefficient34_281,
  OriginalRow227TriangleData0523.coefficient34_282,
  OriginalRow227TriangleData0523.coefficient34_283,
  OriginalRow227TriangleData0523.coefficient34_284,
  OriginalRow227TriangleData0523.coefficient34_285,
  OriginalRow227TriangleData0523.coefficient34_286,
  OriginalRow227TriangleData0523.coefficient34_287,
  OriginalRow227TriangleData0523.coefficient34_288
]

theorem values0523_size : values0523.size = 32 := rfl

def block0523 : ℕ → Option IntervalDyadic := segment 257 values0523

theorem block0523_domain : ExactDomain block0523 257 289 := by
  simpa only [values0523_size] using segment_domain 257 values0523

theorem block0523_get (i : Fin 32) :
    block0523 (257 + i.val) = some (values0523[i.val]'(by rw [values0523_size]; exact i.isLt)) := by
  exact segment_get 257 values0523 ⟨i.val, by rw [values0523_size]; exact i.isLt⟩

def values0524 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0524.coefficient34_289,
  OriginalRow227TriangleData0524.coefficient34_290,
  OriginalRow227TriangleData0524.coefficient34_291,
  OriginalRow227TriangleData0524.coefficient34_292,
  OriginalRow227TriangleData0524.coefficient34_293,
  OriginalRow227TriangleData0524.coefficient34_294,
  OriginalRow227TriangleData0524.coefficient34_295,
  OriginalRow227TriangleData0524.coefficient34_296,
  OriginalRow227TriangleData0524.coefficient34_297,
  OriginalRow227TriangleData0524.coefficient34_298,
  OriginalRow227TriangleData0524.coefficient34_299,
  OriginalRow227TriangleData0524.coefficient34_300,
  OriginalRow227TriangleData0524.coefficient34_301,
  OriginalRow227TriangleData0524.coefficient34_302,
  OriginalRow227TriangleData0524.coefficient34_303,
  OriginalRow227TriangleData0524.coefficient34_304,
  OriginalRow227TriangleData0524.coefficient34_305,
  OriginalRow227TriangleData0524.coefficient34_306,
  OriginalRow227TriangleData0524.coefficient34_307,
  OriginalRow227TriangleData0524.coefficient34_308,
  OriginalRow227TriangleData0524.coefficient34_309,
  OriginalRow227TriangleData0524.coefficient34_310,
  OriginalRow227TriangleData0524.coefficient34_311,
  OriginalRow227TriangleData0524.coefficient34_312,
  OriginalRow227TriangleData0524.coefficient34_313,
  OriginalRow227TriangleData0524.coefficient34_314,
  OriginalRow227TriangleData0524.coefficient34_315,
  OriginalRow227TriangleData0524.coefficient34_316,
  OriginalRow227TriangleData0524.coefficient34_317,
  OriginalRow227TriangleData0524.coefficient34_318,
  OriginalRow227TriangleData0524.coefficient34_319,
  OriginalRow227TriangleData0524.coefficient34_320
]

theorem values0524_size : values0524.size = 32 := rfl

def block0524 : ℕ → Option IntervalDyadic := segment 289 values0524

theorem block0524_domain : ExactDomain block0524 289 321 := by
  simpa only [values0524_size] using segment_domain 289 values0524

theorem block0524_get (i : Fin 32) :
    block0524 (289 + i.val) = some (values0524[i.val]'(by rw [values0524_size]; exact i.isLt)) := by
  exact segment_get 289 values0524 ⟨i.val, by rw [values0524_size]; exact i.isLt⟩

def values0525 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0525.coefficient34_321,
  OriginalRow227TriangleData0525.coefficient34_322,
  OriginalRow227TriangleData0525.coefficient34_323,
  OriginalRow227TriangleData0525.coefficient34_324,
  OriginalRow227TriangleData0525.coefficient34_325,
  OriginalRow227TriangleData0525.coefficient34_326,
  OriginalRow227TriangleData0525.coefficient34_327,
  OriginalRow227TriangleData0525.coefficient34_328,
  OriginalRow227TriangleData0525.coefficient34_329,
  OriginalRow227TriangleData0525.coefficient34_330,
  OriginalRow227TriangleData0525.coefficient34_331,
  OriginalRow227TriangleData0525.coefficient34_332,
  OriginalRow227TriangleData0525.coefficient34_333,
  OriginalRow227TriangleData0525.coefficient34_334,
  OriginalRow227TriangleData0525.coefficient34_335,
  OriginalRow227TriangleData0525.coefficient34_336,
  OriginalRow227TriangleData0525.coefficient34_337,
  OriginalRow227TriangleData0525.coefficient34_338,
  OriginalRow227TriangleData0525.coefficient34_339,
  OriginalRow227TriangleData0525.coefficient34_340,
  OriginalRow227TriangleData0525.coefficient34_341,
  OriginalRow227TriangleData0525.coefficient34_342,
  OriginalRow227TriangleData0525.coefficient34_343,
  OriginalRow227TriangleData0525.coefficient34_344,
  OriginalRow227TriangleData0525.coefficient34_345,
  OriginalRow227TriangleData0525.coefficient34_346,
  OriginalRow227TriangleData0525.coefficient34_347,
  OriginalRow227TriangleData0525.coefficient34_348,
  OriginalRow227TriangleData0525.coefficient34_349,
  OriginalRow227TriangleData0525.coefficient34_350,
  OriginalRow227TriangleData0525.coefficient34_351,
  OriginalRow227TriangleData0525.coefficient34_352
]

theorem values0525_size : values0525.size = 32 := rfl

def block0525 : ℕ → Option IntervalDyadic := segment 321 values0525

theorem block0525_domain : ExactDomain block0525 321 353 := by
  simpa only [values0525_size] using segment_domain 321 values0525

theorem block0525_get (i : Fin 32) :
    block0525 (321 + i.val) = some (values0525[i.val]'(by rw [values0525_size]; exact i.isLt)) := by
  exact segment_get 321 values0525 ⟨i.val, by rw [values0525_size]; exact i.isLt⟩

def values0526 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0526.coefficient34_353,
  OriginalRow227TriangleData0526.coefficient34_354,
  OriginalRow227TriangleData0526.coefficient34_355,
  OriginalRow227TriangleData0526.coefficient34_356,
  OriginalRow227TriangleData0526.coefficient34_357,
  OriginalRow227TriangleData0526.coefficient34_358,
  OriginalRow227TriangleData0526.coefficient34_359,
  OriginalRow227TriangleData0526.coefficient34_360,
  OriginalRow227TriangleData0526.coefficient34_361,
  OriginalRow227TriangleData0526.coefficient34_362,
  OriginalRow227TriangleData0526.coefficient34_363,
  OriginalRow227TriangleData0526.coefficient34_364,
  OriginalRow227TriangleData0526.coefficient34_365,
  OriginalRow227TriangleData0526.coefficient34_366,
  OriginalRow227TriangleData0526.coefficient34_367,
  OriginalRow227TriangleData0526.coefficient34_368,
  OriginalRow227TriangleData0526.coefficient34_369,
  OriginalRow227TriangleData0526.coefficient34_370,
  OriginalRow227TriangleData0526.coefficient34_371,
  OriginalRow227TriangleData0526.coefficient34_372,
  OriginalRow227TriangleData0526.coefficient34_373,
  OriginalRow227TriangleData0526.coefficient34_374,
  OriginalRow227TriangleData0526.coefficient34_375,
  OriginalRow227TriangleData0526.coefficient34_376,
  OriginalRow227TriangleData0526.coefficient34_377,
  OriginalRow227TriangleData0526.coefficient34_378,
  OriginalRow227TriangleData0526.coefficient34_379,
  OriginalRow227TriangleData0526.coefficient34_380,
  OriginalRow227TriangleData0526.coefficient34_381,
  OriginalRow227TriangleData0526.coefficient34_382,
  OriginalRow227TriangleData0526.coefficient34_383,
  OriginalRow227TriangleData0526.coefficient34_384
]

theorem values0526_size : values0526.size = 32 := rfl

def block0526 : ℕ → Option IntervalDyadic := segment 353 values0526

theorem block0526_domain : ExactDomain block0526 353 385 := by
  simpa only [values0526_size] using segment_domain 353 values0526

theorem block0526_get (i : Fin 32) :
    block0526 (353 + i.val) = some (values0526[i.val]'(by rw [values0526_size]; exact i.isLt)) := by
  exact segment_get 353 values0526 ⟨i.val, by rw [values0526_size]; exact i.isLt⟩

def values0527 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0527.coefficient34_385,
  OriginalRow227TriangleData0527.coefficient34_386,
  OriginalRow227TriangleData0527.coefficient34_387,
  OriginalRow227TriangleData0527.coefficient34_388,
  OriginalRow227TriangleData0527.coefficient34_389,
  OriginalRow227TriangleData0527.coefficient34_390,
  OriginalRow227TriangleData0527.coefficient34_391,
  OriginalRow227TriangleData0527.coefficient34_392,
  OriginalRow227TriangleData0527.coefficient34_393,
  OriginalRow227TriangleData0527.coefficient34_394,
  OriginalRow227TriangleData0527.coefficient34_395,
  OriginalRow227TriangleData0527.coefficient34_396,
  OriginalRow227TriangleData0527.coefficient34_397,
  OriginalRow227TriangleData0527.coefficient34_398,
  OriginalRow227TriangleData0527.coefficient34_399,
  OriginalRow227TriangleData0527.coefficient34_400,
  OriginalRow227TriangleData0527.coefficient34_401,
  OriginalRow227TriangleData0527.coefficient34_402,
  OriginalRow227TriangleData0527.coefficient34_403,
  OriginalRow227TriangleData0527.coefficient34_404,
  OriginalRow227TriangleData0527.coefficient34_405,
  OriginalRow227TriangleData0527.coefficient34_406,
  OriginalRow227TriangleData0527.coefficient34_407,
  OriginalRow227TriangleData0527.coefficient34_408,
  OriginalRow227TriangleData0527.coefficient34_409,
  OriginalRow227TriangleData0527.coefficient34_410,
  OriginalRow227TriangleData0527.coefficient34_411,
  OriginalRow227TriangleData0527.coefficient34_412,
  OriginalRow227TriangleData0527.coefficient34_413,
  OriginalRow227TriangleData0527.coefficient34_414,
  OriginalRow227TriangleData0527.coefficient34_415,
  OriginalRow227TriangleData0527.coefficient34_416
]

theorem values0527_size : values0527.size = 32 := rfl

def block0527 : ℕ → Option IntervalDyadic := segment 385 values0527

theorem block0527_domain : ExactDomain block0527 385 417 := by
  simpa only [values0527_size] using segment_domain 385 values0527

theorem block0527_get (i : Fin 32) :
    block0527 (385 + i.val) = some (values0527[i.val]'(by rw [values0527_size]; exact i.isLt)) := by
  exact segment_get 385 values0527 ⟨i.val, by rw [values0527_size]; exact i.isLt⟩

def values0528 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0528.coefficient34_417,
  OriginalRow227TriangleData0528.coefficient34_418,
  OriginalRow227TriangleData0528.coefficient34_419,
  OriginalRow227TriangleData0528.coefficient34_420,
  OriginalRow227TriangleData0528.coefficient34_421,
  OriginalRow227TriangleData0528.coefficient34_422,
  OriginalRow227TriangleData0528.coefficient34_423,
  OriginalRow227TriangleData0528.coefficient34_424,
  OriginalRow227TriangleData0528.coefficient34_425,
  OriginalRow227TriangleData0528.coefficient34_426,
  OriginalRow227TriangleData0528.coefficient34_427,
  OriginalRow227TriangleData0528.coefficient34_428,
  OriginalRow227TriangleData0528.coefficient34_429,
  OriginalRow227TriangleData0528.coefficient34_430,
  OriginalRow227TriangleData0528.coefficient34_431,
  OriginalRow227TriangleData0528.coefficient34_432,
  OriginalRow227TriangleData0528.coefficient34_433,
  OriginalRow227TriangleData0528.coefficient34_434,
  OriginalRow227TriangleData0528.coefficient34_435,
  OriginalRow227TriangleData0528.coefficient34_436,
  OriginalRow227TriangleData0528.coefficient34_437,
  OriginalRow227TriangleData0528.coefficient34_438,
  OriginalRow227TriangleData0528.coefficient34_439,
  OriginalRow227TriangleData0528.coefficient34_440,
  OriginalRow227TriangleData0528.coefficient34_441,
  OriginalRow227TriangleData0528.coefficient34_442,
  OriginalRow227TriangleData0528.coefficient34_443,
  OriginalRow227TriangleData0528.coefficient34_444,
  OriginalRow227TriangleData0528.coefficient34_445,
  OriginalRow227TriangleData0528.coefficient34_446,
  OriginalRow227TriangleData0528.coefficient34_447,
  OriginalRow227TriangleData0528.coefficient34_448
]

theorem values0528_size : values0528.size = 32 := rfl

def block0528 : ℕ → Option IntervalDyadic := segment 417 values0528

theorem block0528_domain : ExactDomain block0528 417 449 := by
  simpa only [values0528_size] using segment_domain 417 values0528

theorem block0528_get (i : Fin 32) :
    block0528 (417 + i.val) = some (values0528[i.val]'(by rw [values0528_size]; exact i.isLt)) := by
  exact segment_get 417 values0528 ⟨i.val, by rw [values0528_size]; exact i.isLt⟩

def values0529 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0529.coefficient34_449,
  OriginalRow227TriangleData0529.coefficient34_450,
  OriginalRow227TriangleData0529.coefficient34_451,
  OriginalRow227TriangleData0529.coefficient34_452,
  OriginalRow227TriangleData0529.coefficient34_453,
  OriginalRow227TriangleData0529.coefficient34_454,
  OriginalRow227TriangleData0529.coefficient34_455,
  OriginalRow227TriangleData0529.coefficient34_456,
  OriginalRow227TriangleData0529.coefficient34_457,
  OriginalRow227TriangleData0529.coefficient34_458,
  OriginalRow227TriangleData0529.coefficient34_459,
  OriginalRow227TriangleData0529.coefficient34_460,
  OriginalRow227TriangleData0529.coefficient34_461,
  OriginalRow227TriangleData0529.coefficient34_462,
  OriginalRow227TriangleData0529.coefficient34_463,
  OriginalRow227TriangleData0529.coefficient34_464,
  OriginalRow227TriangleData0529.coefficient34_465,
  OriginalRow227TriangleData0529.coefficient34_466,
  OriginalRow227TriangleData0529.coefficient34_467
]

theorem values0529_size : values0529.size = 19 := rfl

def block0529 : ℕ → Option IntervalDyadic := segment 449 values0529

theorem block0529_domain : ExactDomain block0529 449 468 := by
  simpa only [values0529_size] using segment_domain 449 values0529

theorem block0529_get (i : Fin 19) :
    block0529 (449 + i.val) = some (values0529[i.val]'(by rw [values0529_size]; exact i.isLt)) := by
  exact segment_get 449 values0529 ⟨i.val, by rw [values0529_size]; exact i.isLt⟩

def node0065_0129 : ℕ → Option IntervalDyadic := split 97 block0517 block0518

theorem node0065_0129_domain : ExactDomain node0065_0129 65 129 := by
  exact split_domain (by decide) (by decide) block0517_domain block0518_domain

def node0033_0129 : ℕ → Option IntervalDyadic := split 65 block0516 node0065_0129

theorem node0033_0129_domain : ExactDomain node0033_0129 33 129 := by
  exact split_domain (by decide) (by decide) block0516_domain node0065_0129_domain

def node0129_0193 : ℕ → Option IntervalDyadic := split 161 block0519 block0520

theorem node0129_0193_domain : ExactDomain node0129_0193 129 193 := by
  exact split_domain (by decide) (by decide) block0519_domain block0520_domain

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block0521 block0522

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block0521_domain block0522_domain

def node0129_0257 : ℕ → Option IntervalDyadic := split 193 node0129_0193 node0193_0257

theorem node0129_0257_domain : ExactDomain node0129_0257 129 257 := by
  exact split_domain (by decide) (by decide) node0129_0193_domain node0193_0257_domain

def node0033_0257 : ℕ → Option IntervalDyadic := split 129 node0033_0129 node0129_0257

theorem node0033_0257_domain : ExactDomain node0033_0257 33 257 := by
  exact split_domain (by decide) (by decide) node0033_0129_domain node0129_0257_domain

def node0289_0353 : ℕ → Option IntervalDyadic := split 321 block0524 block0525

theorem node0289_0353_domain : ExactDomain node0289_0353 289 353 := by
  exact split_domain (by decide) (by decide) block0524_domain block0525_domain

def node0257_0353 : ℕ → Option IntervalDyadic := split 289 block0523 node0289_0353

theorem node0257_0353_domain : ExactDomain node0257_0353 257 353 := by
  exact split_domain (by decide) (by decide) block0523_domain node0289_0353_domain

def node0353_0417 : ℕ → Option IntervalDyadic := split 385 block0526 block0527

theorem node0353_0417_domain : ExactDomain node0353_0417 353 417 := by
  exact split_domain (by decide) (by decide) block0526_domain block0527_domain

def node0417_0468 : ℕ → Option IntervalDyadic := split 449 block0528 block0529

theorem node0417_0468_domain : ExactDomain node0417_0468 417 468 := by
  exact split_domain (by decide) (by decide) block0528_domain block0529_domain

def node0353_0468 : ℕ → Option IntervalDyadic := split 417 node0353_0417 node0417_0468

theorem node0353_0468_domain : ExactDomain node0353_0468 353 468 := by
  exact split_domain (by decide) (by decide) node0353_0417_domain node0417_0468_domain

def node0257_0468 : ℕ → Option IntervalDyadic := split 353 node0257_0353 node0353_0468

theorem node0257_0468_domain : ExactDomain node0257_0468 257 468 := by
  exact split_domain (by decide) (by decide) node0257_0353_domain node0353_0468_domain

def node0033_0468 : ℕ → Option IntervalDyadic := split 257 node0033_0257 node0257_0468

theorem node0033_0468_domain : ExactDomain node0033_0468 33 468 := by
  exact split_domain (by decide) (by decide) node0033_0257_domain node0257_0468_domain

def lookup : ℕ → Option IntervalDyadic := node0033_0468

theorem lookup_domain : ExactDomain lookup 33 468 :=
  node0033_0468_domain

theorem block0516_lookup (i : Fin 32) :
    lookup (33 + i.val) = some (values0516[i.val]'(by rw [values0516_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (33 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_left 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0033_0129, split_left 65 block0516 node0065_0129 (by omega)]
  exact block0516_get i

theorem block0517_lookup (i : Fin 32) :
    lookup (65 + i.val) = some (values0517[i.val]'(by rw [values0517_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (65 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_left 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0033_0129, split_right 65 block0516 node0065_0129 (by omega)]
  rw [node0065_0129, split_left 97 block0517 block0518 (by omega)]
  exact block0517_get i

theorem block0518_lookup (i : Fin 32) :
    lookup (97 + i.val) = some (values0518[i.val]'(by rw [values0518_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (97 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_left 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0033_0129, split_right 65 block0516 node0065_0129 (by omega)]
  rw [node0065_0129, split_right 97 block0517 block0518 (by omega)]
  exact block0518_get i

theorem block0519_lookup (i : Fin 32) :
    lookup (129 + i.val) = some (values0519[i.val]'(by rw [values0519_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (129 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_right 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_left 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0129_0193, split_left 161 block0519 block0520 (by omega)]
  exact block0519_get i

theorem block0520_lookup (i : Fin 32) :
    lookup (161 + i.val) = some (values0520[i.val]'(by rw [values0520_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (161 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_right 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_left 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0129_0193, split_right 161 block0519 block0520 (by omega)]
  exact block0520_get i

theorem block0521_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values0521[i.val]'(by rw [values0521_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (193 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_right 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_right 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0193_0257, split_left 225 block0521 block0522 (by omega)]
  exact block0521_get i

theorem block0522_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values0522[i.val]'(by rw [values0522_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (225 + i.val) = _
  rw [node0033_0468, split_left 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0033_0257, split_right 129 node0033_0129 node0129_0257 (by omega)]
  rw [node0129_0257, split_right 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0193_0257, split_right 225 block0521 block0522 (by omega)]
  exact block0522_get i

theorem block0523_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values0523[i.val]'(by rw [values0523_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (257 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_left 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0257_0353, split_left 289 block0523 node0289_0353 (by omega)]
  exact block0523_get i

theorem block0524_lookup (i : Fin 32) :
    lookup (289 + i.val) = some (values0524[i.val]'(by rw [values0524_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (289 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_left 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0257_0353, split_right 289 block0523 node0289_0353 (by omega)]
  rw [node0289_0353, split_left 321 block0524 block0525 (by omega)]
  exact block0524_get i

theorem block0525_lookup (i : Fin 32) :
    lookup (321 + i.val) = some (values0525[i.val]'(by rw [values0525_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (321 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_left 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0257_0353, split_right 289 block0523 node0289_0353 (by omega)]
  rw [node0289_0353, split_right 321 block0524 block0525 (by omega)]
  exact block0525_get i

theorem block0526_lookup (i : Fin 32) :
    lookup (353 + i.val) = some (values0526[i.val]'(by rw [values0526_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (353 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_right 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0353_0468, split_left 417 node0353_0417 node0417_0468 (by omega)]
  rw [node0353_0417, split_left 385 block0526 block0527 (by omega)]
  exact block0526_get i

theorem block0527_lookup (i : Fin 32) :
    lookup (385 + i.val) = some (values0527[i.val]'(by rw [values0527_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (385 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_right 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0353_0468, split_left 417 node0353_0417 node0417_0468 (by omega)]
  rw [node0353_0417, split_right 385 block0526 block0527 (by omega)]
  exact block0527_get i

theorem block0528_lookup (i : Fin 32) :
    lookup (417 + i.val) = some (values0528[i.val]'(by rw [values0528_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (417 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_right 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0353_0468, split_right 417 node0353_0417 node0417_0468 (by omega)]
  rw [node0417_0468, split_left 449 block0528 block0529 (by omega)]
  exact block0528_get i

theorem block0529_lookup (i : Fin 19) :
    lookup (449 + i.val) = some (values0529[i.val]'(by rw [values0529_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0033_0468 (449 + i.val) = _
  rw [node0033_0468, split_right 257 node0033_0257 node0257_0468 (by omega)]
  rw [node0257_0468, split_right 353 node0257_0353 node0353_0468 (by omega)]
  rw [node0353_0468, split_right 417 node0353_0417 node0417_0468 (by omega)]
  rw [node0417_0468, split_right 449 block0528 block0529 (by omega)]
  exact block0529_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0516_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0516_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0517_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0517_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0518_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0518_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0519_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0519_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0520_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0520_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0521_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0521_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0522_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0522_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0523_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0523_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0524_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0524_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0525_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0525_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0526_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0526_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0527_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0527_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0528_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0528_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0529_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0529_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0516_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0517_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0518_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0519_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0520_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0521_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0522_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0523_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0524_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0525_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0526_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0527_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0528_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow034.block0529_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow034
