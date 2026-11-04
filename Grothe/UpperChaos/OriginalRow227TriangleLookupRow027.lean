import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0417
import Grothe.UpperChaos.OriginalRow227TriangleData0418
import Grothe.UpperChaos.OriginalRow227TriangleData0419
import Grothe.UpperChaos.OriginalRow227TriangleData0420
import Grothe.UpperChaos.OriginalRow227TriangleData0421
import Grothe.UpperChaos.OriginalRow227TriangleData0422
import Grothe.UpperChaos.OriginalRow227TriangleData0423
import Grothe.UpperChaos.OriginalRow227TriangleData0424
import Grothe.UpperChaos.OriginalRow227TriangleData0425
import Grothe.UpperChaos.OriginalRow227TriangleData0426
import Grothe.UpperChaos.OriginalRow227TriangleData0427
import Grothe.UpperChaos.OriginalRow227TriangleData0428
import Grothe.UpperChaos.OriginalRow227TriangleData0429
import Grothe.UpperChaos.OriginalRow227TriangleData0430
import Grothe.UpperChaos.OriginalRow227TriangleData0431

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow027

open ConditionalTableLookup

def values0417 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0417.coefficient27_26,
  OriginalRow227TriangleData0417.coefficient27_27,
  OriginalRow227TriangleData0417.coefficient27_28,
  OriginalRow227TriangleData0417.coefficient27_29,
  OriginalRow227TriangleData0417.coefficient27_30,
  OriginalRow227TriangleData0417.coefficient27_31,
  OriginalRow227TriangleData0417.coefficient27_32,
  OriginalRow227TriangleData0417.coefficient27_33,
  OriginalRow227TriangleData0417.coefficient27_34,
  OriginalRow227TriangleData0417.coefficient27_35,
  OriginalRow227TriangleData0417.coefficient27_36,
  OriginalRow227TriangleData0417.coefficient27_37,
  OriginalRow227TriangleData0417.coefficient27_38,
  OriginalRow227TriangleData0417.coefficient27_39,
  OriginalRow227TriangleData0417.coefficient27_40,
  OriginalRow227TriangleData0417.coefficient27_41,
  OriginalRow227TriangleData0417.coefficient27_42,
  OriginalRow227TriangleData0417.coefficient27_43,
  OriginalRow227TriangleData0417.coefficient27_44,
  OriginalRow227TriangleData0417.coefficient27_45,
  OriginalRow227TriangleData0417.coefficient27_46,
  OriginalRow227TriangleData0417.coefficient27_47,
  OriginalRow227TriangleData0417.coefficient27_48,
  OriginalRow227TriangleData0417.coefficient27_49,
  OriginalRow227TriangleData0417.coefficient27_50,
  OriginalRow227TriangleData0417.coefficient27_51,
  OriginalRow227TriangleData0417.coefficient27_52,
  OriginalRow227TriangleData0417.coefficient27_53,
  OriginalRow227TriangleData0417.coefficient27_54,
  OriginalRow227TriangleData0417.coefficient27_55,
  OriginalRow227TriangleData0417.coefficient27_56,
  OriginalRow227TriangleData0417.coefficient27_57
]

theorem values0417_size : values0417.size = 32 := rfl

def block0417 : ℕ → Option IntervalDyadic := segment 26 values0417

theorem block0417_domain : ExactDomain block0417 26 58 := by
  simpa only [values0417_size] using segment_domain 26 values0417

theorem block0417_get (i : Fin 32) :
    block0417 (26 + i.val) = some (values0417[i.val]'(by rw [values0417_size]; exact i.isLt)) := by
  exact segment_get 26 values0417 ⟨i.val, by rw [values0417_size]; exact i.isLt⟩

def values0418 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0418.coefficient27_58,
  OriginalRow227TriangleData0418.coefficient27_59,
  OriginalRow227TriangleData0418.coefficient27_60,
  OriginalRow227TriangleData0418.coefficient27_61,
  OriginalRow227TriangleData0418.coefficient27_62,
  OriginalRow227TriangleData0418.coefficient27_63,
  OriginalRow227TriangleData0418.coefficient27_64,
  OriginalRow227TriangleData0418.coefficient27_65,
  OriginalRow227TriangleData0418.coefficient27_66,
  OriginalRow227TriangleData0418.coefficient27_67,
  OriginalRow227TriangleData0418.coefficient27_68,
  OriginalRow227TriangleData0418.coefficient27_69,
  OriginalRow227TriangleData0418.coefficient27_70,
  OriginalRow227TriangleData0418.coefficient27_71,
  OriginalRow227TriangleData0418.coefficient27_72,
  OriginalRow227TriangleData0418.coefficient27_73,
  OriginalRow227TriangleData0418.coefficient27_74,
  OriginalRow227TriangleData0418.coefficient27_75,
  OriginalRow227TriangleData0418.coefficient27_76,
  OriginalRow227TriangleData0418.coefficient27_77,
  OriginalRow227TriangleData0418.coefficient27_78,
  OriginalRow227TriangleData0418.coefficient27_79,
  OriginalRow227TriangleData0418.coefficient27_80,
  OriginalRow227TriangleData0418.coefficient27_81,
  OriginalRow227TriangleData0418.coefficient27_82,
  OriginalRow227TriangleData0418.coefficient27_83,
  OriginalRow227TriangleData0418.coefficient27_84,
  OriginalRow227TriangleData0418.coefficient27_85,
  OriginalRow227TriangleData0418.coefficient27_86,
  OriginalRow227TriangleData0418.coefficient27_87,
  OriginalRow227TriangleData0418.coefficient27_88,
  OriginalRow227TriangleData0418.coefficient27_89
]

theorem values0418_size : values0418.size = 32 := rfl

def block0418 : ℕ → Option IntervalDyadic := segment 58 values0418

theorem block0418_domain : ExactDomain block0418 58 90 := by
  simpa only [values0418_size] using segment_domain 58 values0418

theorem block0418_get (i : Fin 32) :
    block0418 (58 + i.val) = some (values0418[i.val]'(by rw [values0418_size]; exact i.isLt)) := by
  exact segment_get 58 values0418 ⟨i.val, by rw [values0418_size]; exact i.isLt⟩

def values0419 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0419.coefficient27_90,
  OriginalRow227TriangleData0419.coefficient27_91,
  OriginalRow227TriangleData0419.coefficient27_92,
  OriginalRow227TriangleData0419.coefficient27_93,
  OriginalRow227TriangleData0419.coefficient27_94,
  OriginalRow227TriangleData0419.coefficient27_95,
  OriginalRow227TriangleData0419.coefficient27_96,
  OriginalRow227TriangleData0419.coefficient27_97,
  OriginalRow227TriangleData0419.coefficient27_98,
  OriginalRow227TriangleData0419.coefficient27_99,
  OriginalRow227TriangleData0419.coefficient27_100,
  OriginalRow227TriangleData0419.coefficient27_101,
  OriginalRow227TriangleData0419.coefficient27_102,
  OriginalRow227TriangleData0419.coefficient27_103,
  OriginalRow227TriangleData0419.coefficient27_104,
  OriginalRow227TriangleData0419.coefficient27_105,
  OriginalRow227TriangleData0419.coefficient27_106,
  OriginalRow227TriangleData0419.coefficient27_107,
  OriginalRow227TriangleData0419.coefficient27_108,
  OriginalRow227TriangleData0419.coefficient27_109,
  OriginalRow227TriangleData0419.coefficient27_110,
  OriginalRow227TriangleData0419.coefficient27_111,
  OriginalRow227TriangleData0419.coefficient27_112,
  OriginalRow227TriangleData0419.coefficient27_113,
  OriginalRow227TriangleData0419.coefficient27_114,
  OriginalRow227TriangleData0419.coefficient27_115,
  OriginalRow227TriangleData0419.coefficient27_116,
  OriginalRow227TriangleData0419.coefficient27_117,
  OriginalRow227TriangleData0419.coefficient27_118,
  OriginalRow227TriangleData0419.coefficient27_119,
  OriginalRow227TriangleData0419.coefficient27_120,
  OriginalRow227TriangleData0419.coefficient27_121
]

theorem values0419_size : values0419.size = 32 := rfl

def block0419 : ℕ → Option IntervalDyadic := segment 90 values0419

theorem block0419_domain : ExactDomain block0419 90 122 := by
  simpa only [values0419_size] using segment_domain 90 values0419

theorem block0419_get (i : Fin 32) :
    block0419 (90 + i.val) = some (values0419[i.val]'(by rw [values0419_size]; exact i.isLt)) := by
  exact segment_get 90 values0419 ⟨i.val, by rw [values0419_size]; exact i.isLt⟩

def values0420 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0420.coefficient27_122,
  OriginalRow227TriangleData0420.coefficient27_123,
  OriginalRow227TriangleData0420.coefficient27_124,
  OriginalRow227TriangleData0420.coefficient27_125,
  OriginalRow227TriangleData0420.coefficient27_126,
  OriginalRow227TriangleData0420.coefficient27_127,
  OriginalRow227TriangleData0420.coefficient27_128,
  OriginalRow227TriangleData0420.coefficient27_129,
  OriginalRow227TriangleData0420.coefficient27_130,
  OriginalRow227TriangleData0420.coefficient27_131,
  OriginalRow227TriangleData0420.coefficient27_132,
  OriginalRow227TriangleData0420.coefficient27_133,
  OriginalRow227TriangleData0420.coefficient27_134,
  OriginalRow227TriangleData0420.coefficient27_135,
  OriginalRow227TriangleData0420.coefficient27_136,
  OriginalRow227TriangleData0420.coefficient27_137,
  OriginalRow227TriangleData0420.coefficient27_138,
  OriginalRow227TriangleData0420.coefficient27_139,
  OriginalRow227TriangleData0420.coefficient27_140,
  OriginalRow227TriangleData0420.coefficient27_141,
  OriginalRow227TriangleData0420.coefficient27_142,
  OriginalRow227TriangleData0420.coefficient27_143,
  OriginalRow227TriangleData0420.coefficient27_144,
  OriginalRow227TriangleData0420.coefficient27_145,
  OriginalRow227TriangleData0420.coefficient27_146,
  OriginalRow227TriangleData0420.coefficient27_147,
  OriginalRow227TriangleData0420.coefficient27_148,
  OriginalRow227TriangleData0420.coefficient27_149,
  OriginalRow227TriangleData0420.coefficient27_150,
  OriginalRow227TriangleData0420.coefficient27_151,
  OriginalRow227TriangleData0420.coefficient27_152,
  OriginalRow227TriangleData0420.coefficient27_153
]

theorem values0420_size : values0420.size = 32 := rfl

def block0420 : ℕ → Option IntervalDyadic := segment 122 values0420

theorem block0420_domain : ExactDomain block0420 122 154 := by
  simpa only [values0420_size] using segment_domain 122 values0420

theorem block0420_get (i : Fin 32) :
    block0420 (122 + i.val) = some (values0420[i.val]'(by rw [values0420_size]; exact i.isLt)) := by
  exact segment_get 122 values0420 ⟨i.val, by rw [values0420_size]; exact i.isLt⟩

def values0421 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0421.coefficient27_154,
  OriginalRow227TriangleData0421.coefficient27_155,
  OriginalRow227TriangleData0421.coefficient27_156,
  OriginalRow227TriangleData0421.coefficient27_157,
  OriginalRow227TriangleData0421.coefficient27_158,
  OriginalRow227TriangleData0421.coefficient27_159,
  OriginalRow227TriangleData0421.coefficient27_160,
  OriginalRow227TriangleData0421.coefficient27_161,
  OriginalRow227TriangleData0421.coefficient27_162,
  OriginalRow227TriangleData0421.coefficient27_163,
  OriginalRow227TriangleData0421.coefficient27_164,
  OriginalRow227TriangleData0421.coefficient27_165,
  OriginalRow227TriangleData0421.coefficient27_166,
  OriginalRow227TriangleData0421.coefficient27_167,
  OriginalRow227TriangleData0421.coefficient27_168,
  OriginalRow227TriangleData0421.coefficient27_169,
  OriginalRow227TriangleData0421.coefficient27_170,
  OriginalRow227TriangleData0421.coefficient27_171,
  OriginalRow227TriangleData0421.coefficient27_172,
  OriginalRow227TriangleData0421.coefficient27_173,
  OriginalRow227TriangleData0421.coefficient27_174,
  OriginalRow227TriangleData0421.coefficient27_175,
  OriginalRow227TriangleData0421.coefficient27_176,
  OriginalRow227TriangleData0421.coefficient27_177,
  OriginalRow227TriangleData0421.coefficient27_178,
  OriginalRow227TriangleData0421.coefficient27_179,
  OriginalRow227TriangleData0421.coefficient27_180,
  OriginalRow227TriangleData0421.coefficient27_181,
  OriginalRow227TriangleData0421.coefficient27_182,
  OriginalRow227TriangleData0421.coefficient27_183,
  OriginalRow227TriangleData0421.coefficient27_184,
  OriginalRow227TriangleData0421.coefficient27_185
]

theorem values0421_size : values0421.size = 32 := rfl

def block0421 : ℕ → Option IntervalDyadic := segment 154 values0421

theorem block0421_domain : ExactDomain block0421 154 186 := by
  simpa only [values0421_size] using segment_domain 154 values0421

theorem block0421_get (i : Fin 32) :
    block0421 (154 + i.val) = some (values0421[i.val]'(by rw [values0421_size]; exact i.isLt)) := by
  exact segment_get 154 values0421 ⟨i.val, by rw [values0421_size]; exact i.isLt⟩

def values0422 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0422.coefficient27_186,
  OriginalRow227TriangleData0422.coefficient27_187,
  OriginalRow227TriangleData0422.coefficient27_188,
  OriginalRow227TriangleData0422.coefficient27_189,
  OriginalRow227TriangleData0422.coefficient27_190,
  OriginalRow227TriangleData0422.coefficient27_191,
  OriginalRow227TriangleData0422.coefficient27_192,
  OriginalRow227TriangleData0422.coefficient27_193,
  OriginalRow227TriangleData0422.coefficient27_194,
  OriginalRow227TriangleData0422.coefficient27_195,
  OriginalRow227TriangleData0422.coefficient27_196,
  OriginalRow227TriangleData0422.coefficient27_197,
  OriginalRow227TriangleData0422.coefficient27_198,
  OriginalRow227TriangleData0422.coefficient27_199,
  OriginalRow227TriangleData0422.coefficient27_200,
  OriginalRow227TriangleData0422.coefficient27_201,
  OriginalRow227TriangleData0422.coefficient27_202,
  OriginalRow227TriangleData0422.coefficient27_203,
  OriginalRow227TriangleData0422.coefficient27_204,
  OriginalRow227TriangleData0422.coefficient27_205,
  OriginalRow227TriangleData0422.coefficient27_206,
  OriginalRow227TriangleData0422.coefficient27_207,
  OriginalRow227TriangleData0422.coefficient27_208,
  OriginalRow227TriangleData0422.coefficient27_209,
  OriginalRow227TriangleData0422.coefficient27_210,
  OriginalRow227TriangleData0422.coefficient27_211,
  OriginalRow227TriangleData0422.coefficient27_212,
  OriginalRow227TriangleData0422.coefficient27_213,
  OriginalRow227TriangleData0422.coefficient27_214,
  OriginalRow227TriangleData0422.coefficient27_215,
  OriginalRow227TriangleData0422.coefficient27_216,
  OriginalRow227TriangleData0422.coefficient27_217
]

theorem values0422_size : values0422.size = 32 := rfl

def block0422 : ℕ → Option IntervalDyadic := segment 186 values0422

theorem block0422_domain : ExactDomain block0422 186 218 := by
  simpa only [values0422_size] using segment_domain 186 values0422

theorem block0422_get (i : Fin 32) :
    block0422 (186 + i.val) = some (values0422[i.val]'(by rw [values0422_size]; exact i.isLt)) := by
  exact segment_get 186 values0422 ⟨i.val, by rw [values0422_size]; exact i.isLt⟩

def values0423 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0423.coefficient27_218,
  OriginalRow227TriangleData0423.coefficient27_219,
  OriginalRow227TriangleData0423.coefficient27_220,
  OriginalRow227TriangleData0423.coefficient27_221,
  OriginalRow227TriangleData0423.coefficient27_222,
  OriginalRow227TriangleData0423.coefficient27_223,
  OriginalRow227TriangleData0423.coefficient27_224,
  OriginalRow227TriangleData0423.coefficient27_225,
  OriginalRow227TriangleData0423.coefficient27_226,
  OriginalRow227TriangleData0423.coefficient27_227,
  OriginalRow227TriangleData0423.coefficient27_228,
  OriginalRow227TriangleData0423.coefficient27_229,
  OriginalRow227TriangleData0423.coefficient27_230,
  OriginalRow227TriangleData0423.coefficient27_231,
  OriginalRow227TriangleData0423.coefficient27_232,
  OriginalRow227TriangleData0423.coefficient27_233,
  OriginalRow227TriangleData0423.coefficient27_234,
  OriginalRow227TriangleData0423.coefficient27_235,
  OriginalRow227TriangleData0423.coefficient27_236,
  OriginalRow227TriangleData0423.coefficient27_237,
  OriginalRow227TriangleData0423.coefficient27_238,
  OriginalRow227TriangleData0423.coefficient27_239,
  OriginalRow227TriangleData0423.coefficient27_240,
  OriginalRow227TriangleData0423.coefficient27_241,
  OriginalRow227TriangleData0423.coefficient27_242,
  OriginalRow227TriangleData0423.coefficient27_243,
  OriginalRow227TriangleData0423.coefficient27_244,
  OriginalRow227TriangleData0423.coefficient27_245,
  OriginalRow227TriangleData0423.coefficient27_246,
  OriginalRow227TriangleData0423.coefficient27_247,
  OriginalRow227TriangleData0423.coefficient27_248,
  OriginalRow227TriangleData0423.coefficient27_249
]

theorem values0423_size : values0423.size = 32 := rfl

def block0423 : ℕ → Option IntervalDyadic := segment 218 values0423

theorem block0423_domain : ExactDomain block0423 218 250 := by
  simpa only [values0423_size] using segment_domain 218 values0423

theorem block0423_get (i : Fin 32) :
    block0423 (218 + i.val) = some (values0423[i.val]'(by rw [values0423_size]; exact i.isLt)) := by
  exact segment_get 218 values0423 ⟨i.val, by rw [values0423_size]; exact i.isLt⟩

def values0424 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0424.coefficient27_250,
  OriginalRow227TriangleData0424.coefficient27_251,
  OriginalRow227TriangleData0424.coefficient27_252,
  OriginalRow227TriangleData0424.coefficient27_253,
  OriginalRow227TriangleData0424.coefficient27_254,
  OriginalRow227TriangleData0424.coefficient27_255,
  OriginalRow227TriangleData0424.coefficient27_256,
  OriginalRow227TriangleData0424.coefficient27_257,
  OriginalRow227TriangleData0424.coefficient27_258,
  OriginalRow227TriangleData0424.coefficient27_259,
  OriginalRow227TriangleData0424.coefficient27_260,
  OriginalRow227TriangleData0424.coefficient27_261,
  OriginalRow227TriangleData0424.coefficient27_262,
  OriginalRow227TriangleData0424.coefficient27_263,
  OriginalRow227TriangleData0424.coefficient27_264,
  OriginalRow227TriangleData0424.coefficient27_265,
  OriginalRow227TriangleData0424.coefficient27_266,
  OriginalRow227TriangleData0424.coefficient27_267,
  OriginalRow227TriangleData0424.coefficient27_268,
  OriginalRow227TriangleData0424.coefficient27_269,
  OriginalRow227TriangleData0424.coefficient27_270,
  OriginalRow227TriangleData0424.coefficient27_271,
  OriginalRow227TriangleData0424.coefficient27_272,
  OriginalRow227TriangleData0424.coefficient27_273,
  OriginalRow227TriangleData0424.coefficient27_274,
  OriginalRow227TriangleData0424.coefficient27_275,
  OriginalRow227TriangleData0424.coefficient27_276,
  OriginalRow227TriangleData0424.coefficient27_277,
  OriginalRow227TriangleData0424.coefficient27_278,
  OriginalRow227TriangleData0424.coefficient27_279,
  OriginalRow227TriangleData0424.coefficient27_280,
  OriginalRow227TriangleData0424.coefficient27_281
]

theorem values0424_size : values0424.size = 32 := rfl

def block0424 : ℕ → Option IntervalDyadic := segment 250 values0424

theorem block0424_domain : ExactDomain block0424 250 282 := by
  simpa only [values0424_size] using segment_domain 250 values0424

theorem block0424_get (i : Fin 32) :
    block0424 (250 + i.val) = some (values0424[i.val]'(by rw [values0424_size]; exact i.isLt)) := by
  exact segment_get 250 values0424 ⟨i.val, by rw [values0424_size]; exact i.isLt⟩

def values0425 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0425.coefficient27_282,
  OriginalRow227TriangleData0425.coefficient27_283,
  OriginalRow227TriangleData0425.coefficient27_284,
  OriginalRow227TriangleData0425.coefficient27_285,
  OriginalRow227TriangleData0425.coefficient27_286,
  OriginalRow227TriangleData0425.coefficient27_287,
  OriginalRow227TriangleData0425.coefficient27_288,
  OriginalRow227TriangleData0425.coefficient27_289,
  OriginalRow227TriangleData0425.coefficient27_290,
  OriginalRow227TriangleData0425.coefficient27_291,
  OriginalRow227TriangleData0425.coefficient27_292,
  OriginalRow227TriangleData0425.coefficient27_293,
  OriginalRow227TriangleData0425.coefficient27_294,
  OriginalRow227TriangleData0425.coefficient27_295,
  OriginalRow227TriangleData0425.coefficient27_296,
  OriginalRow227TriangleData0425.coefficient27_297,
  OriginalRow227TriangleData0425.coefficient27_298,
  OriginalRow227TriangleData0425.coefficient27_299,
  OriginalRow227TriangleData0425.coefficient27_300,
  OriginalRow227TriangleData0425.coefficient27_301,
  OriginalRow227TriangleData0425.coefficient27_302,
  OriginalRow227TriangleData0425.coefficient27_303,
  OriginalRow227TriangleData0425.coefficient27_304,
  OriginalRow227TriangleData0425.coefficient27_305,
  OriginalRow227TriangleData0425.coefficient27_306,
  OriginalRow227TriangleData0425.coefficient27_307,
  OriginalRow227TriangleData0425.coefficient27_308,
  OriginalRow227TriangleData0425.coefficient27_309,
  OriginalRow227TriangleData0425.coefficient27_310,
  OriginalRow227TriangleData0425.coefficient27_311,
  OriginalRow227TriangleData0425.coefficient27_312,
  OriginalRow227TriangleData0425.coefficient27_313
]

theorem values0425_size : values0425.size = 32 := rfl

def block0425 : ℕ → Option IntervalDyadic := segment 282 values0425

theorem block0425_domain : ExactDomain block0425 282 314 := by
  simpa only [values0425_size] using segment_domain 282 values0425

theorem block0425_get (i : Fin 32) :
    block0425 (282 + i.val) = some (values0425[i.val]'(by rw [values0425_size]; exact i.isLt)) := by
  exact segment_get 282 values0425 ⟨i.val, by rw [values0425_size]; exact i.isLt⟩

def values0426 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0426.coefficient27_314,
  OriginalRow227TriangleData0426.coefficient27_315,
  OriginalRow227TriangleData0426.coefficient27_316,
  OriginalRow227TriangleData0426.coefficient27_317,
  OriginalRow227TriangleData0426.coefficient27_318,
  OriginalRow227TriangleData0426.coefficient27_319,
  OriginalRow227TriangleData0426.coefficient27_320,
  OriginalRow227TriangleData0426.coefficient27_321,
  OriginalRow227TriangleData0426.coefficient27_322,
  OriginalRow227TriangleData0426.coefficient27_323,
  OriginalRow227TriangleData0426.coefficient27_324,
  OriginalRow227TriangleData0426.coefficient27_325,
  OriginalRow227TriangleData0426.coefficient27_326,
  OriginalRow227TriangleData0426.coefficient27_327,
  OriginalRow227TriangleData0426.coefficient27_328,
  OriginalRow227TriangleData0426.coefficient27_329,
  OriginalRow227TriangleData0426.coefficient27_330,
  OriginalRow227TriangleData0426.coefficient27_331,
  OriginalRow227TriangleData0426.coefficient27_332,
  OriginalRow227TriangleData0426.coefficient27_333,
  OriginalRow227TriangleData0426.coefficient27_334,
  OriginalRow227TriangleData0426.coefficient27_335,
  OriginalRow227TriangleData0426.coefficient27_336,
  OriginalRow227TriangleData0426.coefficient27_337,
  OriginalRow227TriangleData0426.coefficient27_338,
  OriginalRow227TriangleData0426.coefficient27_339,
  OriginalRow227TriangleData0426.coefficient27_340,
  OriginalRow227TriangleData0426.coefficient27_341,
  OriginalRow227TriangleData0426.coefficient27_342,
  OriginalRow227TriangleData0426.coefficient27_343,
  OriginalRow227TriangleData0426.coefficient27_344,
  OriginalRow227TriangleData0426.coefficient27_345
]

theorem values0426_size : values0426.size = 32 := rfl

def block0426 : ℕ → Option IntervalDyadic := segment 314 values0426

theorem block0426_domain : ExactDomain block0426 314 346 := by
  simpa only [values0426_size] using segment_domain 314 values0426

theorem block0426_get (i : Fin 32) :
    block0426 (314 + i.val) = some (values0426[i.val]'(by rw [values0426_size]; exact i.isLt)) := by
  exact segment_get 314 values0426 ⟨i.val, by rw [values0426_size]; exact i.isLt⟩

def values0427 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0427.coefficient27_346,
  OriginalRow227TriangleData0427.coefficient27_347,
  OriginalRow227TriangleData0427.coefficient27_348,
  OriginalRow227TriangleData0427.coefficient27_349,
  OriginalRow227TriangleData0427.coefficient27_350,
  OriginalRow227TriangleData0427.coefficient27_351,
  OriginalRow227TriangleData0427.coefficient27_352,
  OriginalRow227TriangleData0427.coefficient27_353,
  OriginalRow227TriangleData0427.coefficient27_354,
  OriginalRow227TriangleData0427.coefficient27_355,
  OriginalRow227TriangleData0427.coefficient27_356,
  OriginalRow227TriangleData0427.coefficient27_357,
  OriginalRow227TriangleData0427.coefficient27_358,
  OriginalRow227TriangleData0427.coefficient27_359,
  OriginalRow227TriangleData0427.coefficient27_360,
  OriginalRow227TriangleData0427.coefficient27_361,
  OriginalRow227TriangleData0427.coefficient27_362,
  OriginalRow227TriangleData0427.coefficient27_363,
  OriginalRow227TriangleData0427.coefficient27_364,
  OriginalRow227TriangleData0427.coefficient27_365,
  OriginalRow227TriangleData0427.coefficient27_366,
  OriginalRow227TriangleData0427.coefficient27_367,
  OriginalRow227TriangleData0427.coefficient27_368,
  OriginalRow227TriangleData0427.coefficient27_369,
  OriginalRow227TriangleData0427.coefficient27_370,
  OriginalRow227TriangleData0427.coefficient27_371,
  OriginalRow227TriangleData0427.coefficient27_372,
  OriginalRow227TriangleData0427.coefficient27_373,
  OriginalRow227TriangleData0427.coefficient27_374,
  OriginalRow227TriangleData0427.coefficient27_375,
  OriginalRow227TriangleData0427.coefficient27_376,
  OriginalRow227TriangleData0427.coefficient27_377
]

theorem values0427_size : values0427.size = 32 := rfl

def block0427 : ℕ → Option IntervalDyadic := segment 346 values0427

theorem block0427_domain : ExactDomain block0427 346 378 := by
  simpa only [values0427_size] using segment_domain 346 values0427

theorem block0427_get (i : Fin 32) :
    block0427 (346 + i.val) = some (values0427[i.val]'(by rw [values0427_size]; exact i.isLt)) := by
  exact segment_get 346 values0427 ⟨i.val, by rw [values0427_size]; exact i.isLt⟩

def values0428 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0428.coefficient27_378,
  OriginalRow227TriangleData0428.coefficient27_379,
  OriginalRow227TriangleData0428.coefficient27_380,
  OriginalRow227TriangleData0428.coefficient27_381,
  OriginalRow227TriangleData0428.coefficient27_382,
  OriginalRow227TriangleData0428.coefficient27_383,
  OriginalRow227TriangleData0428.coefficient27_384,
  OriginalRow227TriangleData0428.coefficient27_385,
  OriginalRow227TriangleData0428.coefficient27_386,
  OriginalRow227TriangleData0428.coefficient27_387,
  OriginalRow227TriangleData0428.coefficient27_388,
  OriginalRow227TriangleData0428.coefficient27_389,
  OriginalRow227TriangleData0428.coefficient27_390,
  OriginalRow227TriangleData0428.coefficient27_391,
  OriginalRow227TriangleData0428.coefficient27_392,
  OriginalRow227TriangleData0428.coefficient27_393,
  OriginalRow227TriangleData0428.coefficient27_394,
  OriginalRow227TriangleData0428.coefficient27_395,
  OriginalRow227TriangleData0428.coefficient27_396,
  OriginalRow227TriangleData0428.coefficient27_397,
  OriginalRow227TriangleData0428.coefficient27_398,
  OriginalRow227TriangleData0428.coefficient27_399,
  OriginalRow227TriangleData0428.coefficient27_400,
  OriginalRow227TriangleData0428.coefficient27_401,
  OriginalRow227TriangleData0428.coefficient27_402,
  OriginalRow227TriangleData0428.coefficient27_403,
  OriginalRow227TriangleData0428.coefficient27_404,
  OriginalRow227TriangleData0428.coefficient27_405,
  OriginalRow227TriangleData0428.coefficient27_406,
  OriginalRow227TriangleData0428.coefficient27_407,
  OriginalRow227TriangleData0428.coefficient27_408,
  OriginalRow227TriangleData0428.coefficient27_409
]

theorem values0428_size : values0428.size = 32 := rfl

def block0428 : ℕ → Option IntervalDyadic := segment 378 values0428

theorem block0428_domain : ExactDomain block0428 378 410 := by
  simpa only [values0428_size] using segment_domain 378 values0428

theorem block0428_get (i : Fin 32) :
    block0428 (378 + i.val) = some (values0428[i.val]'(by rw [values0428_size]; exact i.isLt)) := by
  exact segment_get 378 values0428 ⟨i.val, by rw [values0428_size]; exact i.isLt⟩

def values0429 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0429.coefficient27_410,
  OriginalRow227TriangleData0429.coefficient27_411,
  OriginalRow227TriangleData0429.coefficient27_412,
  OriginalRow227TriangleData0429.coefficient27_413,
  OriginalRow227TriangleData0429.coefficient27_414,
  OriginalRow227TriangleData0429.coefficient27_415,
  OriginalRow227TriangleData0429.coefficient27_416,
  OriginalRow227TriangleData0429.coefficient27_417,
  OriginalRow227TriangleData0429.coefficient27_418,
  OriginalRow227TriangleData0429.coefficient27_419,
  OriginalRow227TriangleData0429.coefficient27_420,
  OriginalRow227TriangleData0429.coefficient27_421,
  OriginalRow227TriangleData0429.coefficient27_422,
  OriginalRow227TriangleData0429.coefficient27_423,
  OriginalRow227TriangleData0429.coefficient27_424,
  OriginalRow227TriangleData0429.coefficient27_425,
  OriginalRow227TriangleData0429.coefficient27_426,
  OriginalRow227TriangleData0429.coefficient27_427,
  OriginalRow227TriangleData0429.coefficient27_428,
  OriginalRow227TriangleData0429.coefficient27_429,
  OriginalRow227TriangleData0429.coefficient27_430,
  OriginalRow227TriangleData0429.coefficient27_431,
  OriginalRow227TriangleData0429.coefficient27_432,
  OriginalRow227TriangleData0429.coefficient27_433,
  OriginalRow227TriangleData0429.coefficient27_434,
  OriginalRow227TriangleData0429.coefficient27_435,
  OriginalRow227TriangleData0429.coefficient27_436,
  OriginalRow227TriangleData0429.coefficient27_437,
  OriginalRow227TriangleData0429.coefficient27_438,
  OriginalRow227TriangleData0429.coefficient27_439,
  OriginalRow227TriangleData0429.coefficient27_440,
  OriginalRow227TriangleData0429.coefficient27_441
]

theorem values0429_size : values0429.size = 32 := rfl

def block0429 : ℕ → Option IntervalDyadic := segment 410 values0429

theorem block0429_domain : ExactDomain block0429 410 442 := by
  simpa only [values0429_size] using segment_domain 410 values0429

theorem block0429_get (i : Fin 32) :
    block0429 (410 + i.val) = some (values0429[i.val]'(by rw [values0429_size]; exact i.isLt)) := by
  exact segment_get 410 values0429 ⟨i.val, by rw [values0429_size]; exact i.isLt⟩

def values0430 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0430.coefficient27_442,
  OriginalRow227TriangleData0430.coefficient27_443,
  OriginalRow227TriangleData0430.coefficient27_444,
  OriginalRow227TriangleData0430.coefficient27_445,
  OriginalRow227TriangleData0430.coefficient27_446,
  OriginalRow227TriangleData0430.coefficient27_447,
  OriginalRow227TriangleData0430.coefficient27_448,
  OriginalRow227TriangleData0430.coefficient27_449,
  OriginalRow227TriangleData0430.coefficient27_450,
  OriginalRow227TriangleData0430.coefficient27_451,
  OriginalRow227TriangleData0430.coefficient27_452,
  OriginalRow227TriangleData0430.coefficient27_453,
  OriginalRow227TriangleData0430.coefficient27_454,
  OriginalRow227TriangleData0430.coefficient27_455,
  OriginalRow227TriangleData0430.coefficient27_456,
  OriginalRow227TriangleData0430.coefficient27_457,
  OriginalRow227TriangleData0430.coefficient27_458,
  OriginalRow227TriangleData0430.coefficient27_459,
  OriginalRow227TriangleData0430.coefficient27_460,
  OriginalRow227TriangleData0430.coefficient27_461,
  OriginalRow227TriangleData0430.coefficient27_462,
  OriginalRow227TriangleData0430.coefficient27_463,
  OriginalRow227TriangleData0430.coefficient27_464,
  OriginalRow227TriangleData0430.coefficient27_465,
  OriginalRow227TriangleData0430.coefficient27_466,
  OriginalRow227TriangleData0430.coefficient27_467,
  OriginalRow227TriangleData0430.coefficient27_468,
  OriginalRow227TriangleData0430.coefficient27_469,
  OriginalRow227TriangleData0430.coefficient27_470,
  OriginalRow227TriangleData0430.coefficient27_471,
  OriginalRow227TriangleData0430.coefficient27_472,
  OriginalRow227TriangleData0430.coefficient27_473
]

theorem values0430_size : values0430.size = 32 := rfl

def block0430 : ℕ → Option IntervalDyadic := segment 442 values0430

theorem block0430_domain : ExactDomain block0430 442 474 := by
  simpa only [values0430_size] using segment_domain 442 values0430

theorem block0430_get (i : Fin 32) :
    block0430 (442 + i.val) = some (values0430[i.val]'(by rw [values0430_size]; exact i.isLt)) := by
  exact segment_get 442 values0430 ⟨i.val, by rw [values0430_size]; exact i.isLt⟩

def values0431 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0431.coefficient27_474
]

theorem values0431_size : values0431.size = 1 := rfl

def block0431 : ℕ → Option IntervalDyadic := segment 474 values0431

theorem block0431_domain : ExactDomain block0431 474 475 := by
  simpa only [values0431_size] using segment_domain 474 values0431

theorem block0431_get (i : Fin 1) :
    block0431 (474 + i.val) = some (values0431[i.val]'(by rw [values0431_size]; exact i.isLt)) := by
  exact segment_get 474 values0431 ⟨i.val, by rw [values0431_size]; exact i.isLt⟩

def node0058_0122 : ℕ → Option IntervalDyadic := split 90 block0418 block0419

theorem node0058_0122_domain : ExactDomain node0058_0122 58 122 := by
  exact split_domain (by decide) (by decide) block0418_domain block0419_domain

def node0026_0122 : ℕ → Option IntervalDyadic := split 58 block0417 node0058_0122

theorem node0026_0122_domain : ExactDomain node0026_0122 26 122 := by
  exact split_domain (by decide) (by decide) block0417_domain node0058_0122_domain

def node0122_0186 : ℕ → Option IntervalDyadic := split 154 block0420 block0421

theorem node0122_0186_domain : ExactDomain node0122_0186 122 186 := by
  exact split_domain (by decide) (by decide) block0420_domain block0421_domain

def node0186_0250 : ℕ → Option IntervalDyadic := split 218 block0422 block0423

theorem node0186_0250_domain : ExactDomain node0186_0250 186 250 := by
  exact split_domain (by decide) (by decide) block0422_domain block0423_domain

def node0122_0250 : ℕ → Option IntervalDyadic := split 186 node0122_0186 node0186_0250

theorem node0122_0250_domain : ExactDomain node0122_0250 122 250 := by
  exact split_domain (by decide) (by decide) node0122_0186_domain node0186_0250_domain

def node0026_0250 : ℕ → Option IntervalDyadic := split 122 node0026_0122 node0122_0250

theorem node0026_0250_domain : ExactDomain node0026_0250 26 250 := by
  exact split_domain (by decide) (by decide) node0026_0122_domain node0122_0250_domain

def node0250_0314 : ℕ → Option IntervalDyadic := split 282 block0424 block0425

theorem node0250_0314_domain : ExactDomain node0250_0314 250 314 := by
  exact split_domain (by decide) (by decide) block0424_domain block0425_domain

def node0314_0378 : ℕ → Option IntervalDyadic := split 346 block0426 block0427

theorem node0314_0378_domain : ExactDomain node0314_0378 314 378 := by
  exact split_domain (by decide) (by decide) block0426_domain block0427_domain

def node0250_0378 : ℕ → Option IntervalDyadic := split 314 node0250_0314 node0314_0378

theorem node0250_0378_domain : ExactDomain node0250_0378 250 378 := by
  exact split_domain (by decide) (by decide) node0250_0314_domain node0314_0378_domain

def node0378_0442 : ℕ → Option IntervalDyadic := split 410 block0428 block0429

theorem node0378_0442_domain : ExactDomain node0378_0442 378 442 := by
  exact split_domain (by decide) (by decide) block0428_domain block0429_domain

def node0442_0475 : ℕ → Option IntervalDyadic := split 474 block0430 block0431

theorem node0442_0475_domain : ExactDomain node0442_0475 442 475 := by
  exact split_domain (by decide) (by decide) block0430_domain block0431_domain

def node0378_0475 : ℕ → Option IntervalDyadic := split 442 node0378_0442 node0442_0475

theorem node0378_0475_domain : ExactDomain node0378_0475 378 475 := by
  exact split_domain (by decide) (by decide) node0378_0442_domain node0442_0475_domain

def node0250_0475 : ℕ → Option IntervalDyadic := split 378 node0250_0378 node0378_0475

theorem node0250_0475_domain : ExactDomain node0250_0475 250 475 := by
  exact split_domain (by decide) (by decide) node0250_0378_domain node0378_0475_domain

def node0026_0475 : ℕ → Option IntervalDyadic := split 250 node0026_0250 node0250_0475

theorem node0026_0475_domain : ExactDomain node0026_0475 26 475 := by
  exact split_domain (by decide) (by decide) node0026_0250_domain node0250_0475_domain

def lookup : ℕ → Option IntervalDyadic := node0026_0475

theorem lookup_domain : ExactDomain lookup 26 475 :=
  node0026_0475_domain

theorem block0417_lookup (i : Fin 32) :
    lookup (26 + i.val) = some (values0417[i.val]'(by rw [values0417_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (26 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_left 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0026_0122, split_left 58 block0417 node0058_0122 (by omega)]
  exact block0417_get i

theorem block0418_lookup (i : Fin 32) :
    lookup (58 + i.val) = some (values0418[i.val]'(by rw [values0418_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (58 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_left 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0026_0122, split_right 58 block0417 node0058_0122 (by omega)]
  rw [node0058_0122, split_left 90 block0418 block0419 (by omega)]
  exact block0418_get i

theorem block0419_lookup (i : Fin 32) :
    lookup (90 + i.val) = some (values0419[i.val]'(by rw [values0419_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (90 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_left 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0026_0122, split_right 58 block0417 node0058_0122 (by omega)]
  rw [node0058_0122, split_right 90 block0418 block0419 (by omega)]
  exact block0419_get i

theorem block0420_lookup (i : Fin 32) :
    lookup (122 + i.val) = some (values0420[i.val]'(by rw [values0420_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (122 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_right 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0122_0250, split_left 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0122_0186, split_left 154 block0420 block0421 (by omega)]
  exact block0420_get i

theorem block0421_lookup (i : Fin 32) :
    lookup (154 + i.val) = some (values0421[i.val]'(by rw [values0421_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (154 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_right 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0122_0250, split_left 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0122_0186, split_right 154 block0420 block0421 (by omega)]
  exact block0421_get i

theorem block0422_lookup (i : Fin 32) :
    lookup (186 + i.val) = some (values0422[i.val]'(by rw [values0422_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (186 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_right 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0122_0250, split_right 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0186_0250, split_left 218 block0422 block0423 (by omega)]
  exact block0422_get i

theorem block0423_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values0423[i.val]'(by rw [values0423_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (218 + i.val) = _
  rw [node0026_0475, split_left 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0026_0250, split_right 122 node0026_0122 node0122_0250 (by omega)]
  rw [node0122_0250, split_right 186 node0122_0186 node0186_0250 (by omega)]
  rw [node0186_0250, split_right 218 block0422 block0423 (by omega)]
  exact block0423_get i

theorem block0424_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values0424[i.val]'(by rw [values0424_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (250 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_left 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0250_0378, split_left 314 node0250_0314 node0314_0378 (by omega)]
  rw [node0250_0314, split_left 282 block0424 block0425 (by omega)]
  exact block0424_get i

theorem block0425_lookup (i : Fin 32) :
    lookup (282 + i.val) = some (values0425[i.val]'(by rw [values0425_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (282 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_left 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0250_0378, split_left 314 node0250_0314 node0314_0378 (by omega)]
  rw [node0250_0314, split_right 282 block0424 block0425 (by omega)]
  exact block0425_get i

theorem block0426_lookup (i : Fin 32) :
    lookup (314 + i.val) = some (values0426[i.val]'(by rw [values0426_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (314 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_left 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0250_0378, split_right 314 node0250_0314 node0314_0378 (by omega)]
  rw [node0314_0378, split_left 346 block0426 block0427 (by omega)]
  exact block0426_get i

theorem block0427_lookup (i : Fin 32) :
    lookup (346 + i.val) = some (values0427[i.val]'(by rw [values0427_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (346 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_left 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0250_0378, split_right 314 node0250_0314 node0314_0378 (by omega)]
  rw [node0314_0378, split_right 346 block0426 block0427 (by omega)]
  exact block0427_get i

theorem block0428_lookup (i : Fin 32) :
    lookup (378 + i.val) = some (values0428[i.val]'(by rw [values0428_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (378 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_right 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0378_0475, split_left 442 node0378_0442 node0442_0475 (by omega)]
  rw [node0378_0442, split_left 410 block0428 block0429 (by omega)]
  exact block0428_get i

theorem block0429_lookup (i : Fin 32) :
    lookup (410 + i.val) = some (values0429[i.val]'(by rw [values0429_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (410 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_right 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0378_0475, split_left 442 node0378_0442 node0442_0475 (by omega)]
  rw [node0378_0442, split_right 410 block0428 block0429 (by omega)]
  exact block0429_get i

theorem block0430_lookup (i : Fin 32) :
    lookup (442 + i.val) = some (values0430[i.val]'(by rw [values0430_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (442 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_right 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0378_0475, split_right 442 node0378_0442 node0442_0475 (by omega)]
  rw [node0442_0475, split_left 474 block0430 block0431 (by omega)]
  exact block0430_get i

theorem block0431_lookup (i : Fin 1) :
    lookup (474 + i.val) = some (values0431[i.val]'(by rw [values0431_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0026_0475 (474 + i.val) = _
  rw [node0026_0475, split_right 250 node0026_0250 node0250_0475 (by omega)]
  rw [node0250_0475, split_right 378 node0250_0378 node0378_0475 (by omega)]
  rw [node0378_0475, split_right 442 node0378_0442 node0442_0475 (by omega)]
  rw [node0442_0475, split_right 474 block0430 block0431 (by omega)]
  exact block0431_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0417_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0417_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0418_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0418_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0419_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0419_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0420_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0420_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0421_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0421_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0422_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0422_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0423_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0423_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0424_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0424_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0425_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0425_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0426_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0426_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0427_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0427_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0428_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0428_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0429_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0429_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0430_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0430_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0431_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0431_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0417_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0418_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0419_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0420_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0421_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0422_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0423_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0424_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0425_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0426_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0427_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0428_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0429_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0430_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow027.block0431_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow027
