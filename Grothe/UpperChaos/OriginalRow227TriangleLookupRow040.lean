import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0600
import Grothe.UpperChaos.OriginalRow227TriangleData0601
import Grothe.UpperChaos.OriginalRow227TriangleData0602
import Grothe.UpperChaos.OriginalRow227TriangleData0603
import Grothe.UpperChaos.OriginalRow227TriangleData0604
import Grothe.UpperChaos.OriginalRow227TriangleData0605
import Grothe.UpperChaos.OriginalRow227TriangleData0606
import Grothe.UpperChaos.OriginalRow227TriangleData0607
import Grothe.UpperChaos.OriginalRow227TriangleData0608
import Grothe.UpperChaos.OriginalRow227TriangleData0609
import Grothe.UpperChaos.OriginalRow227TriangleData0610
import Grothe.UpperChaos.OriginalRow227TriangleData0611
import Grothe.UpperChaos.OriginalRow227TriangleData0612
import Grothe.UpperChaos.OriginalRow227TriangleData0613

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow040

open ConditionalTableLookup

def values0600 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0600.coefficient40_39,
  OriginalRow227TriangleData0600.coefficient40_40,
  OriginalRow227TriangleData0600.coefficient40_41,
  OriginalRow227TriangleData0600.coefficient40_42,
  OriginalRow227TriangleData0600.coefficient40_43,
  OriginalRow227TriangleData0600.coefficient40_44,
  OriginalRow227TriangleData0600.coefficient40_45,
  OriginalRow227TriangleData0600.coefficient40_46,
  OriginalRow227TriangleData0600.coefficient40_47,
  OriginalRow227TriangleData0600.coefficient40_48,
  OriginalRow227TriangleData0600.coefficient40_49,
  OriginalRow227TriangleData0600.coefficient40_50,
  OriginalRow227TriangleData0600.coefficient40_51,
  OriginalRow227TriangleData0600.coefficient40_52,
  OriginalRow227TriangleData0600.coefficient40_53,
  OriginalRow227TriangleData0600.coefficient40_54,
  OriginalRow227TriangleData0600.coefficient40_55,
  OriginalRow227TriangleData0600.coefficient40_56,
  OriginalRow227TriangleData0600.coefficient40_57,
  OriginalRow227TriangleData0600.coefficient40_58,
  OriginalRow227TriangleData0600.coefficient40_59,
  OriginalRow227TriangleData0600.coefficient40_60,
  OriginalRow227TriangleData0600.coefficient40_61,
  OriginalRow227TriangleData0600.coefficient40_62,
  OriginalRow227TriangleData0600.coefficient40_63,
  OriginalRow227TriangleData0600.coefficient40_64,
  OriginalRow227TriangleData0600.coefficient40_65,
  OriginalRow227TriangleData0600.coefficient40_66,
  OriginalRow227TriangleData0600.coefficient40_67,
  OriginalRow227TriangleData0600.coefficient40_68,
  OriginalRow227TriangleData0600.coefficient40_69,
  OriginalRow227TriangleData0600.coefficient40_70
]

theorem values0600_size : values0600.size = 32 := rfl

def block0600 : ℕ → Option IntervalDyadic := segment 39 values0600

theorem block0600_domain : ExactDomain block0600 39 71 := by
  simpa only [values0600_size] using segment_domain 39 values0600

theorem block0600_get (i : Fin 32) :
    block0600 (39 + i.val) = some (values0600[i.val]'(by rw [values0600_size]; exact i.isLt)) := by
  exact segment_get 39 values0600 ⟨i.val, by rw [values0600_size]; exact i.isLt⟩

def values0601 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0601.coefficient40_71,
  OriginalRow227TriangleData0601.coefficient40_72,
  OriginalRow227TriangleData0601.coefficient40_73,
  OriginalRow227TriangleData0601.coefficient40_74,
  OriginalRow227TriangleData0601.coefficient40_75,
  OriginalRow227TriangleData0601.coefficient40_76,
  OriginalRow227TriangleData0601.coefficient40_77,
  OriginalRow227TriangleData0601.coefficient40_78,
  OriginalRow227TriangleData0601.coefficient40_79,
  OriginalRow227TriangleData0601.coefficient40_80,
  OriginalRow227TriangleData0601.coefficient40_81,
  OriginalRow227TriangleData0601.coefficient40_82,
  OriginalRow227TriangleData0601.coefficient40_83,
  OriginalRow227TriangleData0601.coefficient40_84,
  OriginalRow227TriangleData0601.coefficient40_85,
  OriginalRow227TriangleData0601.coefficient40_86,
  OriginalRow227TriangleData0601.coefficient40_87,
  OriginalRow227TriangleData0601.coefficient40_88,
  OriginalRow227TriangleData0601.coefficient40_89,
  OriginalRow227TriangleData0601.coefficient40_90,
  OriginalRow227TriangleData0601.coefficient40_91,
  OriginalRow227TriangleData0601.coefficient40_92,
  OriginalRow227TriangleData0601.coefficient40_93,
  OriginalRow227TriangleData0601.coefficient40_94,
  OriginalRow227TriangleData0601.coefficient40_95,
  OriginalRow227TriangleData0601.coefficient40_96,
  OriginalRow227TriangleData0601.coefficient40_97,
  OriginalRow227TriangleData0601.coefficient40_98,
  OriginalRow227TriangleData0601.coefficient40_99,
  OriginalRow227TriangleData0601.coefficient40_100,
  OriginalRow227TriangleData0601.coefficient40_101,
  OriginalRow227TriangleData0601.coefficient40_102
]

theorem values0601_size : values0601.size = 32 := rfl

def block0601 : ℕ → Option IntervalDyadic := segment 71 values0601

theorem block0601_domain : ExactDomain block0601 71 103 := by
  simpa only [values0601_size] using segment_domain 71 values0601

theorem block0601_get (i : Fin 32) :
    block0601 (71 + i.val) = some (values0601[i.val]'(by rw [values0601_size]; exact i.isLt)) := by
  exact segment_get 71 values0601 ⟨i.val, by rw [values0601_size]; exact i.isLt⟩

def values0602 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0602.coefficient40_103,
  OriginalRow227TriangleData0602.coefficient40_104,
  OriginalRow227TriangleData0602.coefficient40_105,
  OriginalRow227TriangleData0602.coefficient40_106,
  OriginalRow227TriangleData0602.coefficient40_107,
  OriginalRow227TriangleData0602.coefficient40_108,
  OriginalRow227TriangleData0602.coefficient40_109,
  OriginalRow227TriangleData0602.coefficient40_110,
  OriginalRow227TriangleData0602.coefficient40_111,
  OriginalRow227TriangleData0602.coefficient40_112,
  OriginalRow227TriangleData0602.coefficient40_113,
  OriginalRow227TriangleData0602.coefficient40_114,
  OriginalRow227TriangleData0602.coefficient40_115,
  OriginalRow227TriangleData0602.coefficient40_116,
  OriginalRow227TriangleData0602.coefficient40_117,
  OriginalRow227TriangleData0602.coefficient40_118,
  OriginalRow227TriangleData0602.coefficient40_119,
  OriginalRow227TriangleData0602.coefficient40_120,
  OriginalRow227TriangleData0602.coefficient40_121,
  OriginalRow227TriangleData0602.coefficient40_122,
  OriginalRow227TriangleData0602.coefficient40_123,
  OriginalRow227TriangleData0602.coefficient40_124,
  OriginalRow227TriangleData0602.coefficient40_125,
  OriginalRow227TriangleData0602.coefficient40_126,
  OriginalRow227TriangleData0602.coefficient40_127,
  OriginalRow227TriangleData0602.coefficient40_128,
  OriginalRow227TriangleData0602.coefficient40_129,
  OriginalRow227TriangleData0602.coefficient40_130,
  OriginalRow227TriangleData0602.coefficient40_131,
  OriginalRow227TriangleData0602.coefficient40_132,
  OriginalRow227TriangleData0602.coefficient40_133,
  OriginalRow227TriangleData0602.coefficient40_134
]

theorem values0602_size : values0602.size = 32 := rfl

def block0602 : ℕ → Option IntervalDyadic := segment 103 values0602

theorem block0602_domain : ExactDomain block0602 103 135 := by
  simpa only [values0602_size] using segment_domain 103 values0602

theorem block0602_get (i : Fin 32) :
    block0602 (103 + i.val) = some (values0602[i.val]'(by rw [values0602_size]; exact i.isLt)) := by
  exact segment_get 103 values0602 ⟨i.val, by rw [values0602_size]; exact i.isLt⟩

def values0603 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0603.coefficient40_135,
  OriginalRow227TriangleData0603.coefficient40_136,
  OriginalRow227TriangleData0603.coefficient40_137,
  OriginalRow227TriangleData0603.coefficient40_138,
  OriginalRow227TriangleData0603.coefficient40_139,
  OriginalRow227TriangleData0603.coefficient40_140,
  OriginalRow227TriangleData0603.coefficient40_141,
  OriginalRow227TriangleData0603.coefficient40_142,
  OriginalRow227TriangleData0603.coefficient40_143,
  OriginalRow227TriangleData0603.coefficient40_144,
  OriginalRow227TriangleData0603.coefficient40_145,
  OriginalRow227TriangleData0603.coefficient40_146,
  OriginalRow227TriangleData0603.coefficient40_147,
  OriginalRow227TriangleData0603.coefficient40_148,
  OriginalRow227TriangleData0603.coefficient40_149,
  OriginalRow227TriangleData0603.coefficient40_150,
  OriginalRow227TriangleData0603.coefficient40_151,
  OriginalRow227TriangleData0603.coefficient40_152,
  OriginalRow227TriangleData0603.coefficient40_153,
  OriginalRow227TriangleData0603.coefficient40_154,
  OriginalRow227TriangleData0603.coefficient40_155,
  OriginalRow227TriangleData0603.coefficient40_156,
  OriginalRow227TriangleData0603.coefficient40_157,
  OriginalRow227TriangleData0603.coefficient40_158,
  OriginalRow227TriangleData0603.coefficient40_159,
  OriginalRow227TriangleData0603.coefficient40_160,
  OriginalRow227TriangleData0603.coefficient40_161,
  OriginalRow227TriangleData0603.coefficient40_162,
  OriginalRow227TriangleData0603.coefficient40_163,
  OriginalRow227TriangleData0603.coefficient40_164,
  OriginalRow227TriangleData0603.coefficient40_165,
  OriginalRow227TriangleData0603.coefficient40_166
]

theorem values0603_size : values0603.size = 32 := rfl

def block0603 : ℕ → Option IntervalDyadic := segment 135 values0603

theorem block0603_domain : ExactDomain block0603 135 167 := by
  simpa only [values0603_size] using segment_domain 135 values0603

theorem block0603_get (i : Fin 32) :
    block0603 (135 + i.val) = some (values0603[i.val]'(by rw [values0603_size]; exact i.isLt)) := by
  exact segment_get 135 values0603 ⟨i.val, by rw [values0603_size]; exact i.isLt⟩

def values0604 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0604.coefficient40_167,
  OriginalRow227TriangleData0604.coefficient40_168,
  OriginalRow227TriangleData0604.coefficient40_169,
  OriginalRow227TriangleData0604.coefficient40_170,
  OriginalRow227TriangleData0604.coefficient40_171,
  OriginalRow227TriangleData0604.coefficient40_172,
  OriginalRow227TriangleData0604.coefficient40_173,
  OriginalRow227TriangleData0604.coefficient40_174,
  OriginalRow227TriangleData0604.coefficient40_175,
  OriginalRow227TriangleData0604.coefficient40_176,
  OriginalRow227TriangleData0604.coefficient40_177,
  OriginalRow227TriangleData0604.coefficient40_178,
  OriginalRow227TriangleData0604.coefficient40_179,
  OriginalRow227TriangleData0604.coefficient40_180,
  OriginalRow227TriangleData0604.coefficient40_181,
  OriginalRow227TriangleData0604.coefficient40_182,
  OriginalRow227TriangleData0604.coefficient40_183,
  OriginalRow227TriangleData0604.coefficient40_184,
  OriginalRow227TriangleData0604.coefficient40_185,
  OriginalRow227TriangleData0604.coefficient40_186,
  OriginalRow227TriangleData0604.coefficient40_187,
  OriginalRow227TriangleData0604.coefficient40_188,
  OriginalRow227TriangleData0604.coefficient40_189,
  OriginalRow227TriangleData0604.coefficient40_190,
  OriginalRow227TriangleData0604.coefficient40_191,
  OriginalRow227TriangleData0604.coefficient40_192,
  OriginalRow227TriangleData0604.coefficient40_193,
  OriginalRow227TriangleData0604.coefficient40_194,
  OriginalRow227TriangleData0604.coefficient40_195,
  OriginalRow227TriangleData0604.coefficient40_196,
  OriginalRow227TriangleData0604.coefficient40_197,
  OriginalRow227TriangleData0604.coefficient40_198
]

theorem values0604_size : values0604.size = 32 := rfl

def block0604 : ℕ → Option IntervalDyadic := segment 167 values0604

theorem block0604_domain : ExactDomain block0604 167 199 := by
  simpa only [values0604_size] using segment_domain 167 values0604

theorem block0604_get (i : Fin 32) :
    block0604 (167 + i.val) = some (values0604[i.val]'(by rw [values0604_size]; exact i.isLt)) := by
  exact segment_get 167 values0604 ⟨i.val, by rw [values0604_size]; exact i.isLt⟩

def values0605 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0605.coefficient40_199,
  OriginalRow227TriangleData0605.coefficient40_200,
  OriginalRow227TriangleData0605.coefficient40_201,
  OriginalRow227TriangleData0605.coefficient40_202,
  OriginalRow227TriangleData0605.coefficient40_203,
  OriginalRow227TriangleData0605.coefficient40_204,
  OriginalRow227TriangleData0605.coefficient40_205,
  OriginalRow227TriangleData0605.coefficient40_206,
  OriginalRow227TriangleData0605.coefficient40_207,
  OriginalRow227TriangleData0605.coefficient40_208,
  OriginalRow227TriangleData0605.coefficient40_209,
  OriginalRow227TriangleData0605.coefficient40_210,
  OriginalRow227TriangleData0605.coefficient40_211,
  OriginalRow227TriangleData0605.coefficient40_212,
  OriginalRow227TriangleData0605.coefficient40_213,
  OriginalRow227TriangleData0605.coefficient40_214,
  OriginalRow227TriangleData0605.coefficient40_215,
  OriginalRow227TriangleData0605.coefficient40_216,
  OriginalRow227TriangleData0605.coefficient40_217,
  OriginalRow227TriangleData0605.coefficient40_218,
  OriginalRow227TriangleData0605.coefficient40_219,
  OriginalRow227TriangleData0605.coefficient40_220,
  OriginalRow227TriangleData0605.coefficient40_221,
  OriginalRow227TriangleData0605.coefficient40_222,
  OriginalRow227TriangleData0605.coefficient40_223,
  OriginalRow227TriangleData0605.coefficient40_224,
  OriginalRow227TriangleData0605.coefficient40_225,
  OriginalRow227TriangleData0605.coefficient40_226,
  OriginalRow227TriangleData0605.coefficient40_227,
  OriginalRow227TriangleData0605.coefficient40_228,
  OriginalRow227TriangleData0605.coefficient40_229,
  OriginalRow227TriangleData0605.coefficient40_230
]

theorem values0605_size : values0605.size = 32 := rfl

def block0605 : ℕ → Option IntervalDyadic := segment 199 values0605

theorem block0605_domain : ExactDomain block0605 199 231 := by
  simpa only [values0605_size] using segment_domain 199 values0605

theorem block0605_get (i : Fin 32) :
    block0605 (199 + i.val) = some (values0605[i.val]'(by rw [values0605_size]; exact i.isLt)) := by
  exact segment_get 199 values0605 ⟨i.val, by rw [values0605_size]; exact i.isLt⟩

def values0606 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0606.coefficient40_231,
  OriginalRow227TriangleData0606.coefficient40_232,
  OriginalRow227TriangleData0606.coefficient40_233,
  OriginalRow227TriangleData0606.coefficient40_234,
  OriginalRow227TriangleData0606.coefficient40_235,
  OriginalRow227TriangleData0606.coefficient40_236,
  OriginalRow227TriangleData0606.coefficient40_237,
  OriginalRow227TriangleData0606.coefficient40_238,
  OriginalRow227TriangleData0606.coefficient40_239,
  OriginalRow227TriangleData0606.coefficient40_240,
  OriginalRow227TriangleData0606.coefficient40_241,
  OriginalRow227TriangleData0606.coefficient40_242,
  OriginalRow227TriangleData0606.coefficient40_243,
  OriginalRow227TriangleData0606.coefficient40_244,
  OriginalRow227TriangleData0606.coefficient40_245,
  OriginalRow227TriangleData0606.coefficient40_246,
  OriginalRow227TriangleData0606.coefficient40_247,
  OriginalRow227TriangleData0606.coefficient40_248,
  OriginalRow227TriangleData0606.coefficient40_249,
  OriginalRow227TriangleData0606.coefficient40_250,
  OriginalRow227TriangleData0606.coefficient40_251,
  OriginalRow227TriangleData0606.coefficient40_252,
  OriginalRow227TriangleData0606.coefficient40_253,
  OriginalRow227TriangleData0606.coefficient40_254,
  OriginalRow227TriangleData0606.coefficient40_255,
  OriginalRow227TriangleData0606.coefficient40_256,
  OriginalRow227TriangleData0606.coefficient40_257,
  OriginalRow227TriangleData0606.coefficient40_258,
  OriginalRow227TriangleData0606.coefficient40_259,
  OriginalRow227TriangleData0606.coefficient40_260,
  OriginalRow227TriangleData0606.coefficient40_261,
  OriginalRow227TriangleData0606.coefficient40_262
]

theorem values0606_size : values0606.size = 32 := rfl

def block0606 : ℕ → Option IntervalDyadic := segment 231 values0606

theorem block0606_domain : ExactDomain block0606 231 263 := by
  simpa only [values0606_size] using segment_domain 231 values0606

theorem block0606_get (i : Fin 32) :
    block0606 (231 + i.val) = some (values0606[i.val]'(by rw [values0606_size]; exact i.isLt)) := by
  exact segment_get 231 values0606 ⟨i.val, by rw [values0606_size]; exact i.isLt⟩

def values0607 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0607.coefficient40_263,
  OriginalRow227TriangleData0607.coefficient40_264,
  OriginalRow227TriangleData0607.coefficient40_265,
  OriginalRow227TriangleData0607.coefficient40_266,
  OriginalRow227TriangleData0607.coefficient40_267,
  OriginalRow227TriangleData0607.coefficient40_268,
  OriginalRow227TriangleData0607.coefficient40_269,
  OriginalRow227TriangleData0607.coefficient40_270,
  OriginalRow227TriangleData0607.coefficient40_271,
  OriginalRow227TriangleData0607.coefficient40_272,
  OriginalRow227TriangleData0607.coefficient40_273,
  OriginalRow227TriangleData0607.coefficient40_274,
  OriginalRow227TriangleData0607.coefficient40_275,
  OriginalRow227TriangleData0607.coefficient40_276,
  OriginalRow227TriangleData0607.coefficient40_277,
  OriginalRow227TriangleData0607.coefficient40_278,
  OriginalRow227TriangleData0607.coefficient40_279,
  OriginalRow227TriangleData0607.coefficient40_280,
  OriginalRow227TriangleData0607.coefficient40_281,
  OriginalRow227TriangleData0607.coefficient40_282,
  OriginalRow227TriangleData0607.coefficient40_283,
  OriginalRow227TriangleData0607.coefficient40_284,
  OriginalRow227TriangleData0607.coefficient40_285,
  OriginalRow227TriangleData0607.coefficient40_286,
  OriginalRow227TriangleData0607.coefficient40_287,
  OriginalRow227TriangleData0607.coefficient40_288,
  OriginalRow227TriangleData0607.coefficient40_289,
  OriginalRow227TriangleData0607.coefficient40_290,
  OriginalRow227TriangleData0607.coefficient40_291,
  OriginalRow227TriangleData0607.coefficient40_292,
  OriginalRow227TriangleData0607.coefficient40_293,
  OriginalRow227TriangleData0607.coefficient40_294
]

theorem values0607_size : values0607.size = 32 := rfl

def block0607 : ℕ → Option IntervalDyadic := segment 263 values0607

theorem block0607_domain : ExactDomain block0607 263 295 := by
  simpa only [values0607_size] using segment_domain 263 values0607

theorem block0607_get (i : Fin 32) :
    block0607 (263 + i.val) = some (values0607[i.val]'(by rw [values0607_size]; exact i.isLt)) := by
  exact segment_get 263 values0607 ⟨i.val, by rw [values0607_size]; exact i.isLt⟩

def values0608 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0608.coefficient40_295,
  OriginalRow227TriangleData0608.coefficient40_296,
  OriginalRow227TriangleData0608.coefficient40_297,
  OriginalRow227TriangleData0608.coefficient40_298,
  OriginalRow227TriangleData0608.coefficient40_299,
  OriginalRow227TriangleData0608.coefficient40_300,
  OriginalRow227TriangleData0608.coefficient40_301,
  OriginalRow227TriangleData0608.coefficient40_302,
  OriginalRow227TriangleData0608.coefficient40_303,
  OriginalRow227TriangleData0608.coefficient40_304,
  OriginalRow227TriangleData0608.coefficient40_305,
  OriginalRow227TriangleData0608.coefficient40_306,
  OriginalRow227TriangleData0608.coefficient40_307,
  OriginalRow227TriangleData0608.coefficient40_308,
  OriginalRow227TriangleData0608.coefficient40_309,
  OriginalRow227TriangleData0608.coefficient40_310,
  OriginalRow227TriangleData0608.coefficient40_311,
  OriginalRow227TriangleData0608.coefficient40_312,
  OriginalRow227TriangleData0608.coefficient40_313,
  OriginalRow227TriangleData0608.coefficient40_314,
  OriginalRow227TriangleData0608.coefficient40_315,
  OriginalRow227TriangleData0608.coefficient40_316,
  OriginalRow227TriangleData0608.coefficient40_317,
  OriginalRow227TriangleData0608.coefficient40_318,
  OriginalRow227TriangleData0608.coefficient40_319,
  OriginalRow227TriangleData0608.coefficient40_320,
  OriginalRow227TriangleData0608.coefficient40_321,
  OriginalRow227TriangleData0608.coefficient40_322,
  OriginalRow227TriangleData0608.coefficient40_323,
  OriginalRow227TriangleData0608.coefficient40_324,
  OriginalRow227TriangleData0608.coefficient40_325,
  OriginalRow227TriangleData0608.coefficient40_326
]

theorem values0608_size : values0608.size = 32 := rfl

def block0608 : ℕ → Option IntervalDyadic := segment 295 values0608

theorem block0608_domain : ExactDomain block0608 295 327 := by
  simpa only [values0608_size] using segment_domain 295 values0608

theorem block0608_get (i : Fin 32) :
    block0608 (295 + i.val) = some (values0608[i.val]'(by rw [values0608_size]; exact i.isLt)) := by
  exact segment_get 295 values0608 ⟨i.val, by rw [values0608_size]; exact i.isLt⟩

def values0609 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0609.coefficient40_327,
  OriginalRow227TriangleData0609.coefficient40_328,
  OriginalRow227TriangleData0609.coefficient40_329,
  OriginalRow227TriangleData0609.coefficient40_330,
  OriginalRow227TriangleData0609.coefficient40_331,
  OriginalRow227TriangleData0609.coefficient40_332,
  OriginalRow227TriangleData0609.coefficient40_333,
  OriginalRow227TriangleData0609.coefficient40_334,
  OriginalRow227TriangleData0609.coefficient40_335,
  OriginalRow227TriangleData0609.coefficient40_336,
  OriginalRow227TriangleData0609.coefficient40_337,
  OriginalRow227TriangleData0609.coefficient40_338,
  OriginalRow227TriangleData0609.coefficient40_339,
  OriginalRow227TriangleData0609.coefficient40_340,
  OriginalRow227TriangleData0609.coefficient40_341,
  OriginalRow227TriangleData0609.coefficient40_342,
  OriginalRow227TriangleData0609.coefficient40_343,
  OriginalRow227TriangleData0609.coefficient40_344,
  OriginalRow227TriangleData0609.coefficient40_345,
  OriginalRow227TriangleData0609.coefficient40_346,
  OriginalRow227TriangleData0609.coefficient40_347,
  OriginalRow227TriangleData0609.coefficient40_348,
  OriginalRow227TriangleData0609.coefficient40_349,
  OriginalRow227TriangleData0609.coefficient40_350,
  OriginalRow227TriangleData0609.coefficient40_351,
  OriginalRow227TriangleData0609.coefficient40_352,
  OriginalRow227TriangleData0609.coefficient40_353,
  OriginalRow227TriangleData0609.coefficient40_354,
  OriginalRow227TriangleData0609.coefficient40_355,
  OriginalRow227TriangleData0609.coefficient40_356,
  OriginalRow227TriangleData0609.coefficient40_357,
  OriginalRow227TriangleData0609.coefficient40_358
]

theorem values0609_size : values0609.size = 32 := rfl

def block0609 : ℕ → Option IntervalDyadic := segment 327 values0609

theorem block0609_domain : ExactDomain block0609 327 359 := by
  simpa only [values0609_size] using segment_domain 327 values0609

theorem block0609_get (i : Fin 32) :
    block0609 (327 + i.val) = some (values0609[i.val]'(by rw [values0609_size]; exact i.isLt)) := by
  exact segment_get 327 values0609 ⟨i.val, by rw [values0609_size]; exact i.isLt⟩

def values0610 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0610.coefficient40_359,
  OriginalRow227TriangleData0610.coefficient40_360,
  OriginalRow227TriangleData0610.coefficient40_361,
  OriginalRow227TriangleData0610.coefficient40_362,
  OriginalRow227TriangleData0610.coefficient40_363,
  OriginalRow227TriangleData0610.coefficient40_364,
  OriginalRow227TriangleData0610.coefficient40_365,
  OriginalRow227TriangleData0610.coefficient40_366,
  OriginalRow227TriangleData0610.coefficient40_367,
  OriginalRow227TriangleData0610.coefficient40_368,
  OriginalRow227TriangleData0610.coefficient40_369,
  OriginalRow227TriangleData0610.coefficient40_370,
  OriginalRow227TriangleData0610.coefficient40_371,
  OriginalRow227TriangleData0610.coefficient40_372,
  OriginalRow227TriangleData0610.coefficient40_373,
  OriginalRow227TriangleData0610.coefficient40_374,
  OriginalRow227TriangleData0610.coefficient40_375,
  OriginalRow227TriangleData0610.coefficient40_376,
  OriginalRow227TriangleData0610.coefficient40_377,
  OriginalRow227TriangleData0610.coefficient40_378,
  OriginalRow227TriangleData0610.coefficient40_379,
  OriginalRow227TriangleData0610.coefficient40_380,
  OriginalRow227TriangleData0610.coefficient40_381,
  OriginalRow227TriangleData0610.coefficient40_382,
  OriginalRow227TriangleData0610.coefficient40_383,
  OriginalRow227TriangleData0610.coefficient40_384,
  OriginalRow227TriangleData0610.coefficient40_385,
  OriginalRow227TriangleData0610.coefficient40_386,
  OriginalRow227TriangleData0610.coefficient40_387,
  OriginalRow227TriangleData0610.coefficient40_388,
  OriginalRow227TriangleData0610.coefficient40_389,
  OriginalRow227TriangleData0610.coefficient40_390
]

theorem values0610_size : values0610.size = 32 := rfl

def block0610 : ℕ → Option IntervalDyadic := segment 359 values0610

theorem block0610_domain : ExactDomain block0610 359 391 := by
  simpa only [values0610_size] using segment_domain 359 values0610

theorem block0610_get (i : Fin 32) :
    block0610 (359 + i.val) = some (values0610[i.val]'(by rw [values0610_size]; exact i.isLt)) := by
  exact segment_get 359 values0610 ⟨i.val, by rw [values0610_size]; exact i.isLt⟩

def values0611 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0611.coefficient40_391,
  OriginalRow227TriangleData0611.coefficient40_392,
  OriginalRow227TriangleData0611.coefficient40_393,
  OriginalRow227TriangleData0611.coefficient40_394,
  OriginalRow227TriangleData0611.coefficient40_395,
  OriginalRow227TriangleData0611.coefficient40_396,
  OriginalRow227TriangleData0611.coefficient40_397,
  OriginalRow227TriangleData0611.coefficient40_398,
  OriginalRow227TriangleData0611.coefficient40_399,
  OriginalRow227TriangleData0611.coefficient40_400,
  OriginalRow227TriangleData0611.coefficient40_401,
  OriginalRow227TriangleData0611.coefficient40_402,
  OriginalRow227TriangleData0611.coefficient40_403,
  OriginalRow227TriangleData0611.coefficient40_404,
  OriginalRow227TriangleData0611.coefficient40_405,
  OriginalRow227TriangleData0611.coefficient40_406,
  OriginalRow227TriangleData0611.coefficient40_407,
  OriginalRow227TriangleData0611.coefficient40_408,
  OriginalRow227TriangleData0611.coefficient40_409,
  OriginalRow227TriangleData0611.coefficient40_410,
  OriginalRow227TriangleData0611.coefficient40_411,
  OriginalRow227TriangleData0611.coefficient40_412,
  OriginalRow227TriangleData0611.coefficient40_413,
  OriginalRow227TriangleData0611.coefficient40_414,
  OriginalRow227TriangleData0611.coefficient40_415,
  OriginalRow227TriangleData0611.coefficient40_416,
  OriginalRow227TriangleData0611.coefficient40_417,
  OriginalRow227TriangleData0611.coefficient40_418,
  OriginalRow227TriangleData0611.coefficient40_419,
  OriginalRow227TriangleData0611.coefficient40_420,
  OriginalRow227TriangleData0611.coefficient40_421,
  OriginalRow227TriangleData0611.coefficient40_422
]

theorem values0611_size : values0611.size = 32 := rfl

def block0611 : ℕ → Option IntervalDyadic := segment 391 values0611

theorem block0611_domain : ExactDomain block0611 391 423 := by
  simpa only [values0611_size] using segment_domain 391 values0611

theorem block0611_get (i : Fin 32) :
    block0611 (391 + i.val) = some (values0611[i.val]'(by rw [values0611_size]; exact i.isLt)) := by
  exact segment_get 391 values0611 ⟨i.val, by rw [values0611_size]; exact i.isLt⟩

def values0612 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0612.coefficient40_423,
  OriginalRow227TriangleData0612.coefficient40_424,
  OriginalRow227TriangleData0612.coefficient40_425,
  OriginalRow227TriangleData0612.coefficient40_426,
  OriginalRow227TriangleData0612.coefficient40_427,
  OriginalRow227TriangleData0612.coefficient40_428,
  OriginalRow227TriangleData0612.coefficient40_429,
  OriginalRow227TriangleData0612.coefficient40_430,
  OriginalRow227TriangleData0612.coefficient40_431,
  OriginalRow227TriangleData0612.coefficient40_432,
  OriginalRow227TriangleData0612.coefficient40_433,
  OriginalRow227TriangleData0612.coefficient40_434,
  OriginalRow227TriangleData0612.coefficient40_435,
  OriginalRow227TriangleData0612.coefficient40_436,
  OriginalRow227TriangleData0612.coefficient40_437,
  OriginalRow227TriangleData0612.coefficient40_438,
  OriginalRow227TriangleData0612.coefficient40_439,
  OriginalRow227TriangleData0612.coefficient40_440,
  OriginalRow227TriangleData0612.coefficient40_441,
  OriginalRow227TriangleData0612.coefficient40_442,
  OriginalRow227TriangleData0612.coefficient40_443,
  OriginalRow227TriangleData0612.coefficient40_444,
  OriginalRow227TriangleData0612.coefficient40_445,
  OriginalRow227TriangleData0612.coefficient40_446,
  OriginalRow227TriangleData0612.coefficient40_447,
  OriginalRow227TriangleData0612.coefficient40_448,
  OriginalRow227TriangleData0612.coefficient40_449,
  OriginalRow227TriangleData0612.coefficient40_450,
  OriginalRow227TriangleData0612.coefficient40_451,
  OriginalRow227TriangleData0612.coefficient40_452,
  OriginalRow227TriangleData0612.coefficient40_453,
  OriginalRow227TriangleData0612.coefficient40_454
]

theorem values0612_size : values0612.size = 32 := rfl

def block0612 : ℕ → Option IntervalDyadic := segment 423 values0612

theorem block0612_domain : ExactDomain block0612 423 455 := by
  simpa only [values0612_size] using segment_domain 423 values0612

theorem block0612_get (i : Fin 32) :
    block0612 (423 + i.val) = some (values0612[i.val]'(by rw [values0612_size]; exact i.isLt)) := by
  exact segment_get 423 values0612 ⟨i.val, by rw [values0612_size]; exact i.isLt⟩

def values0613 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0613.coefficient40_455,
  OriginalRow227TriangleData0613.coefficient40_456,
  OriginalRow227TriangleData0613.coefficient40_457,
  OriginalRow227TriangleData0613.coefficient40_458,
  OriginalRow227TriangleData0613.coefficient40_459,
  OriginalRow227TriangleData0613.coefficient40_460,
  OriginalRow227TriangleData0613.coefficient40_461
]

theorem values0613_size : values0613.size = 7 := rfl

def block0613 : ℕ → Option IntervalDyadic := segment 455 values0613

theorem block0613_domain : ExactDomain block0613 455 462 := by
  simpa only [values0613_size] using segment_domain 455 values0613

theorem block0613_get (i : Fin 7) :
    block0613 (455 + i.val) = some (values0613[i.val]'(by rw [values0613_size]; exact i.isLt)) := by
  exact segment_get 455 values0613 ⟨i.val, by rw [values0613_size]; exact i.isLt⟩

def node0071_0135 : ℕ → Option IntervalDyadic := split 103 block0601 block0602

theorem node0071_0135_domain : ExactDomain node0071_0135 71 135 := by
  exact split_domain (by decide) (by decide) block0601_domain block0602_domain

def node0039_0135 : ℕ → Option IntervalDyadic := split 71 block0600 node0071_0135

theorem node0039_0135_domain : ExactDomain node0039_0135 39 135 := by
  exact split_domain (by decide) (by decide) block0600_domain node0071_0135_domain

def node0135_0199 : ℕ → Option IntervalDyadic := split 167 block0603 block0604

theorem node0135_0199_domain : ExactDomain node0135_0199 135 199 := by
  exact split_domain (by decide) (by decide) block0603_domain block0604_domain

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block0605 block0606

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block0605_domain block0606_domain

def node0135_0263 : ℕ → Option IntervalDyadic := split 199 node0135_0199 node0199_0263

theorem node0135_0263_domain : ExactDomain node0135_0263 135 263 := by
  exact split_domain (by decide) (by decide) node0135_0199_domain node0199_0263_domain

def node0039_0263 : ℕ → Option IntervalDyadic := split 135 node0039_0135 node0135_0263

theorem node0039_0263_domain : ExactDomain node0039_0263 39 263 := by
  exact split_domain (by decide) (by decide) node0039_0135_domain node0135_0263_domain

def node0295_0359 : ℕ → Option IntervalDyadic := split 327 block0608 block0609

theorem node0295_0359_domain : ExactDomain node0295_0359 295 359 := by
  exact split_domain (by decide) (by decide) block0608_domain block0609_domain

def node0263_0359 : ℕ → Option IntervalDyadic := split 295 block0607 node0295_0359

theorem node0263_0359_domain : ExactDomain node0263_0359 263 359 := by
  exact split_domain (by decide) (by decide) block0607_domain node0295_0359_domain

def node0359_0423 : ℕ → Option IntervalDyadic := split 391 block0610 block0611

theorem node0359_0423_domain : ExactDomain node0359_0423 359 423 := by
  exact split_domain (by decide) (by decide) block0610_domain block0611_domain

def node0423_0462 : ℕ → Option IntervalDyadic := split 455 block0612 block0613

theorem node0423_0462_domain : ExactDomain node0423_0462 423 462 := by
  exact split_domain (by decide) (by decide) block0612_domain block0613_domain

def node0359_0462 : ℕ → Option IntervalDyadic := split 423 node0359_0423 node0423_0462

theorem node0359_0462_domain : ExactDomain node0359_0462 359 462 := by
  exact split_domain (by decide) (by decide) node0359_0423_domain node0423_0462_domain

def node0263_0462 : ℕ → Option IntervalDyadic := split 359 node0263_0359 node0359_0462

theorem node0263_0462_domain : ExactDomain node0263_0462 263 462 := by
  exact split_domain (by decide) (by decide) node0263_0359_domain node0359_0462_domain

def node0039_0462 : ℕ → Option IntervalDyadic := split 263 node0039_0263 node0263_0462

theorem node0039_0462_domain : ExactDomain node0039_0462 39 462 := by
  exact split_domain (by decide) (by decide) node0039_0263_domain node0263_0462_domain

def lookup : ℕ → Option IntervalDyadic := node0039_0462

theorem lookup_domain : ExactDomain lookup 39 462 :=
  node0039_0462_domain

theorem block0600_lookup (i : Fin 32) :
    lookup (39 + i.val) = some (values0600[i.val]'(by rw [values0600_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (39 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_left 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0039_0135, split_left 71 block0600 node0071_0135 (by omega)]
  exact block0600_get i

theorem block0601_lookup (i : Fin 32) :
    lookup (71 + i.val) = some (values0601[i.val]'(by rw [values0601_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (71 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_left 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0039_0135, split_right 71 block0600 node0071_0135 (by omega)]
  rw [node0071_0135, split_left 103 block0601 block0602 (by omega)]
  exact block0601_get i

theorem block0602_lookup (i : Fin 32) :
    lookup (103 + i.val) = some (values0602[i.val]'(by rw [values0602_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (103 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_left 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0039_0135, split_right 71 block0600 node0071_0135 (by omega)]
  rw [node0071_0135, split_right 103 block0601 block0602 (by omega)]
  exact block0602_get i

theorem block0603_lookup (i : Fin 32) :
    lookup (135 + i.val) = some (values0603[i.val]'(by rw [values0603_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (135 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_right 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_left 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0135_0199, split_left 167 block0603 block0604 (by omega)]
  exact block0603_get i

theorem block0604_lookup (i : Fin 32) :
    lookup (167 + i.val) = some (values0604[i.val]'(by rw [values0604_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (167 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_right 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_left 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0135_0199, split_right 167 block0603 block0604 (by omega)]
  exact block0604_get i

theorem block0605_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values0605[i.val]'(by rw [values0605_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (199 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_right 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_right 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0199_0263, split_left 231 block0605 block0606 (by omega)]
  exact block0605_get i

theorem block0606_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values0606[i.val]'(by rw [values0606_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (231 + i.val) = _
  rw [node0039_0462, split_left 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0039_0263, split_right 135 node0039_0135 node0135_0263 (by omega)]
  rw [node0135_0263, split_right 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0199_0263, split_right 231 block0605 block0606 (by omega)]
  exact block0606_get i

theorem block0607_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values0607[i.val]'(by rw [values0607_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (263 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_left 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0263_0359, split_left 295 block0607 node0295_0359 (by omega)]
  exact block0607_get i

theorem block0608_lookup (i : Fin 32) :
    lookup (295 + i.val) = some (values0608[i.val]'(by rw [values0608_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (295 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_left 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0263_0359, split_right 295 block0607 node0295_0359 (by omega)]
  rw [node0295_0359, split_left 327 block0608 block0609 (by omega)]
  exact block0608_get i

theorem block0609_lookup (i : Fin 32) :
    lookup (327 + i.val) = some (values0609[i.val]'(by rw [values0609_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (327 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_left 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0263_0359, split_right 295 block0607 node0295_0359 (by omega)]
  rw [node0295_0359, split_right 327 block0608 block0609 (by omega)]
  exact block0609_get i

theorem block0610_lookup (i : Fin 32) :
    lookup (359 + i.val) = some (values0610[i.val]'(by rw [values0610_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (359 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_right 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0359_0462, split_left 423 node0359_0423 node0423_0462 (by omega)]
  rw [node0359_0423, split_left 391 block0610 block0611 (by omega)]
  exact block0610_get i

theorem block0611_lookup (i : Fin 32) :
    lookup (391 + i.val) = some (values0611[i.val]'(by rw [values0611_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (391 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_right 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0359_0462, split_left 423 node0359_0423 node0423_0462 (by omega)]
  rw [node0359_0423, split_right 391 block0610 block0611 (by omega)]
  exact block0611_get i

theorem block0612_lookup (i : Fin 32) :
    lookup (423 + i.val) = some (values0612[i.val]'(by rw [values0612_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (423 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_right 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0359_0462, split_right 423 node0359_0423 node0423_0462 (by omega)]
  rw [node0423_0462, split_left 455 block0612 block0613 (by omega)]
  exact block0612_get i

theorem block0613_lookup (i : Fin 7) :
    lookup (455 + i.val) = some (values0613[i.val]'(by rw [values0613_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0039_0462 (455 + i.val) = _
  rw [node0039_0462, split_right 263 node0039_0263 node0263_0462 (by omega)]
  rw [node0263_0462, split_right 359 node0263_0359 node0359_0462 (by omega)]
  rw [node0359_0462, split_right 423 node0359_0423 node0423_0462 (by omega)]
  rw [node0423_0462, split_right 455 block0612 block0613 (by omega)]
  exact block0613_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0600_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0600_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0601_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0601_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0602_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0602_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0603_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0603_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0604_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0604_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0605_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0605_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0606_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0606_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0607_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0607_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0608_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0608_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0609_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0609_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0610_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0610_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0611_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0611_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0612_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0612_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0613_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0613_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0600_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0601_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0602_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0603_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0604_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0605_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0606_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0607_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0608_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0609_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0610_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0611_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0612_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow040.block0613_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow040
