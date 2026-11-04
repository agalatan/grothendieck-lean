import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0502
import Grothe.UpperChaos.OriginalRow227TriangleData0503
import Grothe.UpperChaos.OriginalRow227TriangleData0504
import Grothe.UpperChaos.OriginalRow227TriangleData0505
import Grothe.UpperChaos.OriginalRow227TriangleData0506
import Grothe.UpperChaos.OriginalRow227TriangleData0507
import Grothe.UpperChaos.OriginalRow227TriangleData0508
import Grothe.UpperChaos.OriginalRow227TriangleData0509
import Grothe.UpperChaos.OriginalRow227TriangleData0510
import Grothe.UpperChaos.OriginalRow227TriangleData0511
import Grothe.UpperChaos.OriginalRow227TriangleData0512
import Grothe.UpperChaos.OriginalRow227TriangleData0513
import Grothe.UpperChaos.OriginalRow227TriangleData0514
import Grothe.UpperChaos.OriginalRow227TriangleData0515

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow033

open ConditionalTableLookup

def values0502 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0502.coefficient33_32,
  OriginalRow227TriangleData0502.coefficient33_33,
  OriginalRow227TriangleData0502.coefficient33_34,
  OriginalRow227TriangleData0502.coefficient33_35,
  OriginalRow227TriangleData0502.coefficient33_36,
  OriginalRow227TriangleData0502.coefficient33_37,
  OriginalRow227TriangleData0502.coefficient33_38,
  OriginalRow227TriangleData0502.coefficient33_39,
  OriginalRow227TriangleData0502.coefficient33_40,
  OriginalRow227TriangleData0502.coefficient33_41,
  OriginalRow227TriangleData0502.coefficient33_42,
  OriginalRow227TriangleData0502.coefficient33_43,
  OriginalRow227TriangleData0502.coefficient33_44,
  OriginalRow227TriangleData0502.coefficient33_45,
  OriginalRow227TriangleData0502.coefficient33_46,
  OriginalRow227TriangleData0502.coefficient33_47,
  OriginalRow227TriangleData0502.coefficient33_48,
  OriginalRow227TriangleData0502.coefficient33_49,
  OriginalRow227TriangleData0502.coefficient33_50,
  OriginalRow227TriangleData0502.coefficient33_51,
  OriginalRow227TriangleData0502.coefficient33_52,
  OriginalRow227TriangleData0502.coefficient33_53,
  OriginalRow227TriangleData0502.coefficient33_54,
  OriginalRow227TriangleData0502.coefficient33_55,
  OriginalRow227TriangleData0502.coefficient33_56,
  OriginalRow227TriangleData0502.coefficient33_57,
  OriginalRow227TriangleData0502.coefficient33_58,
  OriginalRow227TriangleData0502.coefficient33_59,
  OriginalRow227TriangleData0502.coefficient33_60,
  OriginalRow227TriangleData0502.coefficient33_61,
  OriginalRow227TriangleData0502.coefficient33_62,
  OriginalRow227TriangleData0502.coefficient33_63
]

theorem values0502_size : values0502.size = 32 := rfl

def block0502 : ℕ → Option IntervalDyadic := segment 32 values0502

theorem block0502_domain : ExactDomain block0502 32 64 := by
  simpa only [values0502_size] using segment_domain 32 values0502

theorem block0502_get (i : Fin 32) :
    block0502 (32 + i.val) = some (values0502[i.val]'(by rw [values0502_size]; exact i.isLt)) := by
  exact segment_get 32 values0502 ⟨i.val, by rw [values0502_size]; exact i.isLt⟩

def values0503 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0503.coefficient33_64,
  OriginalRow227TriangleData0503.coefficient33_65,
  OriginalRow227TriangleData0503.coefficient33_66,
  OriginalRow227TriangleData0503.coefficient33_67,
  OriginalRow227TriangleData0503.coefficient33_68,
  OriginalRow227TriangleData0503.coefficient33_69,
  OriginalRow227TriangleData0503.coefficient33_70,
  OriginalRow227TriangleData0503.coefficient33_71,
  OriginalRow227TriangleData0503.coefficient33_72,
  OriginalRow227TriangleData0503.coefficient33_73,
  OriginalRow227TriangleData0503.coefficient33_74,
  OriginalRow227TriangleData0503.coefficient33_75,
  OriginalRow227TriangleData0503.coefficient33_76,
  OriginalRow227TriangleData0503.coefficient33_77,
  OriginalRow227TriangleData0503.coefficient33_78,
  OriginalRow227TriangleData0503.coefficient33_79,
  OriginalRow227TriangleData0503.coefficient33_80,
  OriginalRow227TriangleData0503.coefficient33_81,
  OriginalRow227TriangleData0503.coefficient33_82,
  OriginalRow227TriangleData0503.coefficient33_83,
  OriginalRow227TriangleData0503.coefficient33_84,
  OriginalRow227TriangleData0503.coefficient33_85,
  OriginalRow227TriangleData0503.coefficient33_86,
  OriginalRow227TriangleData0503.coefficient33_87,
  OriginalRow227TriangleData0503.coefficient33_88,
  OriginalRow227TriangleData0503.coefficient33_89,
  OriginalRow227TriangleData0503.coefficient33_90,
  OriginalRow227TriangleData0503.coefficient33_91,
  OriginalRow227TriangleData0503.coefficient33_92,
  OriginalRow227TriangleData0503.coefficient33_93,
  OriginalRow227TriangleData0503.coefficient33_94,
  OriginalRow227TriangleData0503.coefficient33_95
]

theorem values0503_size : values0503.size = 32 := rfl

def block0503 : ℕ → Option IntervalDyadic := segment 64 values0503

theorem block0503_domain : ExactDomain block0503 64 96 := by
  simpa only [values0503_size] using segment_domain 64 values0503

theorem block0503_get (i : Fin 32) :
    block0503 (64 + i.val) = some (values0503[i.val]'(by rw [values0503_size]; exact i.isLt)) := by
  exact segment_get 64 values0503 ⟨i.val, by rw [values0503_size]; exact i.isLt⟩

def values0504 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0504.coefficient33_96,
  OriginalRow227TriangleData0504.coefficient33_97,
  OriginalRow227TriangleData0504.coefficient33_98,
  OriginalRow227TriangleData0504.coefficient33_99,
  OriginalRow227TriangleData0504.coefficient33_100,
  OriginalRow227TriangleData0504.coefficient33_101,
  OriginalRow227TriangleData0504.coefficient33_102,
  OriginalRow227TriangleData0504.coefficient33_103,
  OriginalRow227TriangleData0504.coefficient33_104,
  OriginalRow227TriangleData0504.coefficient33_105,
  OriginalRow227TriangleData0504.coefficient33_106,
  OriginalRow227TriangleData0504.coefficient33_107,
  OriginalRow227TriangleData0504.coefficient33_108,
  OriginalRow227TriangleData0504.coefficient33_109,
  OriginalRow227TriangleData0504.coefficient33_110,
  OriginalRow227TriangleData0504.coefficient33_111,
  OriginalRow227TriangleData0504.coefficient33_112,
  OriginalRow227TriangleData0504.coefficient33_113,
  OriginalRow227TriangleData0504.coefficient33_114,
  OriginalRow227TriangleData0504.coefficient33_115,
  OriginalRow227TriangleData0504.coefficient33_116,
  OriginalRow227TriangleData0504.coefficient33_117,
  OriginalRow227TriangleData0504.coefficient33_118,
  OriginalRow227TriangleData0504.coefficient33_119,
  OriginalRow227TriangleData0504.coefficient33_120,
  OriginalRow227TriangleData0504.coefficient33_121,
  OriginalRow227TriangleData0504.coefficient33_122,
  OriginalRow227TriangleData0504.coefficient33_123,
  OriginalRow227TriangleData0504.coefficient33_124,
  OriginalRow227TriangleData0504.coefficient33_125,
  OriginalRow227TriangleData0504.coefficient33_126,
  OriginalRow227TriangleData0504.coefficient33_127
]

theorem values0504_size : values0504.size = 32 := rfl

def block0504 : ℕ → Option IntervalDyadic := segment 96 values0504

theorem block0504_domain : ExactDomain block0504 96 128 := by
  simpa only [values0504_size] using segment_domain 96 values0504

theorem block0504_get (i : Fin 32) :
    block0504 (96 + i.val) = some (values0504[i.val]'(by rw [values0504_size]; exact i.isLt)) := by
  exact segment_get 96 values0504 ⟨i.val, by rw [values0504_size]; exact i.isLt⟩

def values0505 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0505.coefficient33_128,
  OriginalRow227TriangleData0505.coefficient33_129,
  OriginalRow227TriangleData0505.coefficient33_130,
  OriginalRow227TriangleData0505.coefficient33_131,
  OriginalRow227TriangleData0505.coefficient33_132,
  OriginalRow227TriangleData0505.coefficient33_133,
  OriginalRow227TriangleData0505.coefficient33_134,
  OriginalRow227TriangleData0505.coefficient33_135,
  OriginalRow227TriangleData0505.coefficient33_136,
  OriginalRow227TriangleData0505.coefficient33_137,
  OriginalRow227TriangleData0505.coefficient33_138,
  OriginalRow227TriangleData0505.coefficient33_139,
  OriginalRow227TriangleData0505.coefficient33_140,
  OriginalRow227TriangleData0505.coefficient33_141,
  OriginalRow227TriangleData0505.coefficient33_142,
  OriginalRow227TriangleData0505.coefficient33_143,
  OriginalRow227TriangleData0505.coefficient33_144,
  OriginalRow227TriangleData0505.coefficient33_145,
  OriginalRow227TriangleData0505.coefficient33_146,
  OriginalRow227TriangleData0505.coefficient33_147,
  OriginalRow227TriangleData0505.coefficient33_148,
  OriginalRow227TriangleData0505.coefficient33_149,
  OriginalRow227TriangleData0505.coefficient33_150,
  OriginalRow227TriangleData0505.coefficient33_151,
  OriginalRow227TriangleData0505.coefficient33_152,
  OriginalRow227TriangleData0505.coefficient33_153,
  OriginalRow227TriangleData0505.coefficient33_154,
  OriginalRow227TriangleData0505.coefficient33_155,
  OriginalRow227TriangleData0505.coefficient33_156,
  OriginalRow227TriangleData0505.coefficient33_157,
  OriginalRow227TriangleData0505.coefficient33_158,
  OriginalRow227TriangleData0505.coefficient33_159
]

theorem values0505_size : values0505.size = 32 := rfl

def block0505 : ℕ → Option IntervalDyadic := segment 128 values0505

theorem block0505_domain : ExactDomain block0505 128 160 := by
  simpa only [values0505_size] using segment_domain 128 values0505

theorem block0505_get (i : Fin 32) :
    block0505 (128 + i.val) = some (values0505[i.val]'(by rw [values0505_size]; exact i.isLt)) := by
  exact segment_get 128 values0505 ⟨i.val, by rw [values0505_size]; exact i.isLt⟩

def values0506 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0506.coefficient33_160,
  OriginalRow227TriangleData0506.coefficient33_161,
  OriginalRow227TriangleData0506.coefficient33_162,
  OriginalRow227TriangleData0506.coefficient33_163,
  OriginalRow227TriangleData0506.coefficient33_164,
  OriginalRow227TriangleData0506.coefficient33_165,
  OriginalRow227TriangleData0506.coefficient33_166,
  OriginalRow227TriangleData0506.coefficient33_167,
  OriginalRow227TriangleData0506.coefficient33_168,
  OriginalRow227TriangleData0506.coefficient33_169,
  OriginalRow227TriangleData0506.coefficient33_170,
  OriginalRow227TriangleData0506.coefficient33_171,
  OriginalRow227TriangleData0506.coefficient33_172,
  OriginalRow227TriangleData0506.coefficient33_173,
  OriginalRow227TriangleData0506.coefficient33_174,
  OriginalRow227TriangleData0506.coefficient33_175,
  OriginalRow227TriangleData0506.coefficient33_176,
  OriginalRow227TriangleData0506.coefficient33_177,
  OriginalRow227TriangleData0506.coefficient33_178,
  OriginalRow227TriangleData0506.coefficient33_179,
  OriginalRow227TriangleData0506.coefficient33_180,
  OriginalRow227TriangleData0506.coefficient33_181,
  OriginalRow227TriangleData0506.coefficient33_182,
  OriginalRow227TriangleData0506.coefficient33_183,
  OriginalRow227TriangleData0506.coefficient33_184,
  OriginalRow227TriangleData0506.coefficient33_185,
  OriginalRow227TriangleData0506.coefficient33_186,
  OriginalRow227TriangleData0506.coefficient33_187,
  OriginalRow227TriangleData0506.coefficient33_188,
  OriginalRow227TriangleData0506.coefficient33_189,
  OriginalRow227TriangleData0506.coefficient33_190,
  OriginalRow227TriangleData0506.coefficient33_191
]

theorem values0506_size : values0506.size = 32 := rfl

def block0506 : ℕ → Option IntervalDyadic := segment 160 values0506

theorem block0506_domain : ExactDomain block0506 160 192 := by
  simpa only [values0506_size] using segment_domain 160 values0506

theorem block0506_get (i : Fin 32) :
    block0506 (160 + i.val) = some (values0506[i.val]'(by rw [values0506_size]; exact i.isLt)) := by
  exact segment_get 160 values0506 ⟨i.val, by rw [values0506_size]; exact i.isLt⟩

def values0507 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0507.coefficient33_192,
  OriginalRow227TriangleData0507.coefficient33_193,
  OriginalRow227TriangleData0507.coefficient33_194,
  OriginalRow227TriangleData0507.coefficient33_195,
  OriginalRow227TriangleData0507.coefficient33_196,
  OriginalRow227TriangleData0507.coefficient33_197,
  OriginalRow227TriangleData0507.coefficient33_198,
  OriginalRow227TriangleData0507.coefficient33_199,
  OriginalRow227TriangleData0507.coefficient33_200,
  OriginalRow227TriangleData0507.coefficient33_201,
  OriginalRow227TriangleData0507.coefficient33_202,
  OriginalRow227TriangleData0507.coefficient33_203,
  OriginalRow227TriangleData0507.coefficient33_204,
  OriginalRow227TriangleData0507.coefficient33_205,
  OriginalRow227TriangleData0507.coefficient33_206,
  OriginalRow227TriangleData0507.coefficient33_207,
  OriginalRow227TriangleData0507.coefficient33_208,
  OriginalRow227TriangleData0507.coefficient33_209,
  OriginalRow227TriangleData0507.coefficient33_210,
  OriginalRow227TriangleData0507.coefficient33_211,
  OriginalRow227TriangleData0507.coefficient33_212,
  OriginalRow227TriangleData0507.coefficient33_213,
  OriginalRow227TriangleData0507.coefficient33_214,
  OriginalRow227TriangleData0507.coefficient33_215,
  OriginalRow227TriangleData0507.coefficient33_216,
  OriginalRow227TriangleData0507.coefficient33_217,
  OriginalRow227TriangleData0507.coefficient33_218,
  OriginalRow227TriangleData0507.coefficient33_219,
  OriginalRow227TriangleData0507.coefficient33_220,
  OriginalRow227TriangleData0507.coefficient33_221,
  OriginalRow227TriangleData0507.coefficient33_222,
  OriginalRow227TriangleData0507.coefficient33_223
]

theorem values0507_size : values0507.size = 32 := rfl

def block0507 : ℕ → Option IntervalDyadic := segment 192 values0507

theorem block0507_domain : ExactDomain block0507 192 224 := by
  simpa only [values0507_size] using segment_domain 192 values0507

theorem block0507_get (i : Fin 32) :
    block0507 (192 + i.val) = some (values0507[i.val]'(by rw [values0507_size]; exact i.isLt)) := by
  exact segment_get 192 values0507 ⟨i.val, by rw [values0507_size]; exact i.isLt⟩

def values0508 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0508.coefficient33_224,
  OriginalRow227TriangleData0508.coefficient33_225,
  OriginalRow227TriangleData0508.coefficient33_226,
  OriginalRow227TriangleData0508.coefficient33_227,
  OriginalRow227TriangleData0508.coefficient33_228,
  OriginalRow227TriangleData0508.coefficient33_229,
  OriginalRow227TriangleData0508.coefficient33_230,
  OriginalRow227TriangleData0508.coefficient33_231,
  OriginalRow227TriangleData0508.coefficient33_232,
  OriginalRow227TriangleData0508.coefficient33_233,
  OriginalRow227TriangleData0508.coefficient33_234,
  OriginalRow227TriangleData0508.coefficient33_235,
  OriginalRow227TriangleData0508.coefficient33_236,
  OriginalRow227TriangleData0508.coefficient33_237,
  OriginalRow227TriangleData0508.coefficient33_238,
  OriginalRow227TriangleData0508.coefficient33_239,
  OriginalRow227TriangleData0508.coefficient33_240,
  OriginalRow227TriangleData0508.coefficient33_241,
  OriginalRow227TriangleData0508.coefficient33_242,
  OriginalRow227TriangleData0508.coefficient33_243,
  OriginalRow227TriangleData0508.coefficient33_244,
  OriginalRow227TriangleData0508.coefficient33_245,
  OriginalRow227TriangleData0508.coefficient33_246,
  OriginalRow227TriangleData0508.coefficient33_247,
  OriginalRow227TriangleData0508.coefficient33_248,
  OriginalRow227TriangleData0508.coefficient33_249,
  OriginalRow227TriangleData0508.coefficient33_250,
  OriginalRow227TriangleData0508.coefficient33_251,
  OriginalRow227TriangleData0508.coefficient33_252,
  OriginalRow227TriangleData0508.coefficient33_253,
  OriginalRow227TriangleData0508.coefficient33_254,
  OriginalRow227TriangleData0508.coefficient33_255
]

theorem values0508_size : values0508.size = 32 := rfl

def block0508 : ℕ → Option IntervalDyadic := segment 224 values0508

theorem block0508_domain : ExactDomain block0508 224 256 := by
  simpa only [values0508_size] using segment_domain 224 values0508

theorem block0508_get (i : Fin 32) :
    block0508 (224 + i.val) = some (values0508[i.val]'(by rw [values0508_size]; exact i.isLt)) := by
  exact segment_get 224 values0508 ⟨i.val, by rw [values0508_size]; exact i.isLt⟩

def values0509 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0509.coefficient33_256,
  OriginalRow227TriangleData0509.coefficient33_257,
  OriginalRow227TriangleData0509.coefficient33_258,
  OriginalRow227TriangleData0509.coefficient33_259,
  OriginalRow227TriangleData0509.coefficient33_260,
  OriginalRow227TriangleData0509.coefficient33_261,
  OriginalRow227TriangleData0509.coefficient33_262,
  OriginalRow227TriangleData0509.coefficient33_263,
  OriginalRow227TriangleData0509.coefficient33_264,
  OriginalRow227TriangleData0509.coefficient33_265,
  OriginalRow227TriangleData0509.coefficient33_266,
  OriginalRow227TriangleData0509.coefficient33_267,
  OriginalRow227TriangleData0509.coefficient33_268,
  OriginalRow227TriangleData0509.coefficient33_269,
  OriginalRow227TriangleData0509.coefficient33_270,
  OriginalRow227TriangleData0509.coefficient33_271,
  OriginalRow227TriangleData0509.coefficient33_272,
  OriginalRow227TriangleData0509.coefficient33_273,
  OriginalRow227TriangleData0509.coefficient33_274,
  OriginalRow227TriangleData0509.coefficient33_275,
  OriginalRow227TriangleData0509.coefficient33_276,
  OriginalRow227TriangleData0509.coefficient33_277,
  OriginalRow227TriangleData0509.coefficient33_278,
  OriginalRow227TriangleData0509.coefficient33_279,
  OriginalRow227TriangleData0509.coefficient33_280,
  OriginalRow227TriangleData0509.coefficient33_281,
  OriginalRow227TriangleData0509.coefficient33_282,
  OriginalRow227TriangleData0509.coefficient33_283,
  OriginalRow227TriangleData0509.coefficient33_284,
  OriginalRow227TriangleData0509.coefficient33_285,
  OriginalRow227TriangleData0509.coefficient33_286,
  OriginalRow227TriangleData0509.coefficient33_287
]

theorem values0509_size : values0509.size = 32 := rfl

def block0509 : ℕ → Option IntervalDyadic := segment 256 values0509

theorem block0509_domain : ExactDomain block0509 256 288 := by
  simpa only [values0509_size] using segment_domain 256 values0509

theorem block0509_get (i : Fin 32) :
    block0509 (256 + i.val) = some (values0509[i.val]'(by rw [values0509_size]; exact i.isLt)) := by
  exact segment_get 256 values0509 ⟨i.val, by rw [values0509_size]; exact i.isLt⟩

def values0510 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0510.coefficient33_288,
  OriginalRow227TriangleData0510.coefficient33_289,
  OriginalRow227TriangleData0510.coefficient33_290,
  OriginalRow227TriangleData0510.coefficient33_291,
  OriginalRow227TriangleData0510.coefficient33_292,
  OriginalRow227TriangleData0510.coefficient33_293,
  OriginalRow227TriangleData0510.coefficient33_294,
  OriginalRow227TriangleData0510.coefficient33_295,
  OriginalRow227TriangleData0510.coefficient33_296,
  OriginalRow227TriangleData0510.coefficient33_297,
  OriginalRow227TriangleData0510.coefficient33_298,
  OriginalRow227TriangleData0510.coefficient33_299,
  OriginalRow227TriangleData0510.coefficient33_300,
  OriginalRow227TriangleData0510.coefficient33_301,
  OriginalRow227TriangleData0510.coefficient33_302,
  OriginalRow227TriangleData0510.coefficient33_303,
  OriginalRow227TriangleData0510.coefficient33_304,
  OriginalRow227TriangleData0510.coefficient33_305,
  OriginalRow227TriangleData0510.coefficient33_306,
  OriginalRow227TriangleData0510.coefficient33_307,
  OriginalRow227TriangleData0510.coefficient33_308,
  OriginalRow227TriangleData0510.coefficient33_309,
  OriginalRow227TriangleData0510.coefficient33_310,
  OriginalRow227TriangleData0510.coefficient33_311,
  OriginalRow227TriangleData0510.coefficient33_312,
  OriginalRow227TriangleData0510.coefficient33_313,
  OriginalRow227TriangleData0510.coefficient33_314,
  OriginalRow227TriangleData0510.coefficient33_315,
  OriginalRow227TriangleData0510.coefficient33_316,
  OriginalRow227TriangleData0510.coefficient33_317,
  OriginalRow227TriangleData0510.coefficient33_318,
  OriginalRow227TriangleData0510.coefficient33_319
]

theorem values0510_size : values0510.size = 32 := rfl

def block0510 : ℕ → Option IntervalDyadic := segment 288 values0510

theorem block0510_domain : ExactDomain block0510 288 320 := by
  simpa only [values0510_size] using segment_domain 288 values0510

theorem block0510_get (i : Fin 32) :
    block0510 (288 + i.val) = some (values0510[i.val]'(by rw [values0510_size]; exact i.isLt)) := by
  exact segment_get 288 values0510 ⟨i.val, by rw [values0510_size]; exact i.isLt⟩

def values0511 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0511.coefficient33_320,
  OriginalRow227TriangleData0511.coefficient33_321,
  OriginalRow227TriangleData0511.coefficient33_322,
  OriginalRow227TriangleData0511.coefficient33_323,
  OriginalRow227TriangleData0511.coefficient33_324,
  OriginalRow227TriangleData0511.coefficient33_325,
  OriginalRow227TriangleData0511.coefficient33_326,
  OriginalRow227TriangleData0511.coefficient33_327,
  OriginalRow227TriangleData0511.coefficient33_328,
  OriginalRow227TriangleData0511.coefficient33_329,
  OriginalRow227TriangleData0511.coefficient33_330,
  OriginalRow227TriangleData0511.coefficient33_331,
  OriginalRow227TriangleData0511.coefficient33_332,
  OriginalRow227TriangleData0511.coefficient33_333,
  OriginalRow227TriangleData0511.coefficient33_334,
  OriginalRow227TriangleData0511.coefficient33_335,
  OriginalRow227TriangleData0511.coefficient33_336,
  OriginalRow227TriangleData0511.coefficient33_337,
  OriginalRow227TriangleData0511.coefficient33_338,
  OriginalRow227TriangleData0511.coefficient33_339,
  OriginalRow227TriangleData0511.coefficient33_340,
  OriginalRow227TriangleData0511.coefficient33_341,
  OriginalRow227TriangleData0511.coefficient33_342,
  OriginalRow227TriangleData0511.coefficient33_343,
  OriginalRow227TriangleData0511.coefficient33_344,
  OriginalRow227TriangleData0511.coefficient33_345,
  OriginalRow227TriangleData0511.coefficient33_346,
  OriginalRow227TriangleData0511.coefficient33_347,
  OriginalRow227TriangleData0511.coefficient33_348,
  OriginalRow227TriangleData0511.coefficient33_349,
  OriginalRow227TriangleData0511.coefficient33_350,
  OriginalRow227TriangleData0511.coefficient33_351
]

theorem values0511_size : values0511.size = 32 := rfl

def block0511 : ℕ → Option IntervalDyadic := segment 320 values0511

theorem block0511_domain : ExactDomain block0511 320 352 := by
  simpa only [values0511_size] using segment_domain 320 values0511

theorem block0511_get (i : Fin 32) :
    block0511 (320 + i.val) = some (values0511[i.val]'(by rw [values0511_size]; exact i.isLt)) := by
  exact segment_get 320 values0511 ⟨i.val, by rw [values0511_size]; exact i.isLt⟩

def values0512 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0512.coefficient33_352,
  OriginalRow227TriangleData0512.coefficient33_353,
  OriginalRow227TriangleData0512.coefficient33_354,
  OriginalRow227TriangleData0512.coefficient33_355,
  OriginalRow227TriangleData0512.coefficient33_356,
  OriginalRow227TriangleData0512.coefficient33_357,
  OriginalRow227TriangleData0512.coefficient33_358,
  OriginalRow227TriangleData0512.coefficient33_359,
  OriginalRow227TriangleData0512.coefficient33_360,
  OriginalRow227TriangleData0512.coefficient33_361,
  OriginalRow227TriangleData0512.coefficient33_362,
  OriginalRow227TriangleData0512.coefficient33_363,
  OriginalRow227TriangleData0512.coefficient33_364,
  OriginalRow227TriangleData0512.coefficient33_365,
  OriginalRow227TriangleData0512.coefficient33_366,
  OriginalRow227TriangleData0512.coefficient33_367,
  OriginalRow227TriangleData0512.coefficient33_368,
  OriginalRow227TriangleData0512.coefficient33_369,
  OriginalRow227TriangleData0512.coefficient33_370,
  OriginalRow227TriangleData0512.coefficient33_371,
  OriginalRow227TriangleData0512.coefficient33_372,
  OriginalRow227TriangleData0512.coefficient33_373,
  OriginalRow227TriangleData0512.coefficient33_374,
  OriginalRow227TriangleData0512.coefficient33_375,
  OriginalRow227TriangleData0512.coefficient33_376,
  OriginalRow227TriangleData0512.coefficient33_377,
  OriginalRow227TriangleData0512.coefficient33_378,
  OriginalRow227TriangleData0512.coefficient33_379,
  OriginalRow227TriangleData0512.coefficient33_380,
  OriginalRow227TriangleData0512.coefficient33_381,
  OriginalRow227TriangleData0512.coefficient33_382,
  OriginalRow227TriangleData0512.coefficient33_383
]

theorem values0512_size : values0512.size = 32 := rfl

def block0512 : ℕ → Option IntervalDyadic := segment 352 values0512

theorem block0512_domain : ExactDomain block0512 352 384 := by
  simpa only [values0512_size] using segment_domain 352 values0512

theorem block0512_get (i : Fin 32) :
    block0512 (352 + i.val) = some (values0512[i.val]'(by rw [values0512_size]; exact i.isLt)) := by
  exact segment_get 352 values0512 ⟨i.val, by rw [values0512_size]; exact i.isLt⟩

def values0513 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0513.coefficient33_384,
  OriginalRow227TriangleData0513.coefficient33_385,
  OriginalRow227TriangleData0513.coefficient33_386,
  OriginalRow227TriangleData0513.coefficient33_387,
  OriginalRow227TriangleData0513.coefficient33_388,
  OriginalRow227TriangleData0513.coefficient33_389,
  OriginalRow227TriangleData0513.coefficient33_390,
  OriginalRow227TriangleData0513.coefficient33_391,
  OriginalRow227TriangleData0513.coefficient33_392,
  OriginalRow227TriangleData0513.coefficient33_393,
  OriginalRow227TriangleData0513.coefficient33_394,
  OriginalRow227TriangleData0513.coefficient33_395,
  OriginalRow227TriangleData0513.coefficient33_396,
  OriginalRow227TriangleData0513.coefficient33_397,
  OriginalRow227TriangleData0513.coefficient33_398,
  OriginalRow227TriangleData0513.coefficient33_399,
  OriginalRow227TriangleData0513.coefficient33_400,
  OriginalRow227TriangleData0513.coefficient33_401,
  OriginalRow227TriangleData0513.coefficient33_402,
  OriginalRow227TriangleData0513.coefficient33_403,
  OriginalRow227TriangleData0513.coefficient33_404,
  OriginalRow227TriangleData0513.coefficient33_405,
  OriginalRow227TriangleData0513.coefficient33_406,
  OriginalRow227TriangleData0513.coefficient33_407,
  OriginalRow227TriangleData0513.coefficient33_408,
  OriginalRow227TriangleData0513.coefficient33_409,
  OriginalRow227TriangleData0513.coefficient33_410,
  OriginalRow227TriangleData0513.coefficient33_411,
  OriginalRow227TriangleData0513.coefficient33_412,
  OriginalRow227TriangleData0513.coefficient33_413,
  OriginalRow227TriangleData0513.coefficient33_414,
  OriginalRow227TriangleData0513.coefficient33_415
]

theorem values0513_size : values0513.size = 32 := rfl

def block0513 : ℕ → Option IntervalDyadic := segment 384 values0513

theorem block0513_domain : ExactDomain block0513 384 416 := by
  simpa only [values0513_size] using segment_domain 384 values0513

theorem block0513_get (i : Fin 32) :
    block0513 (384 + i.val) = some (values0513[i.val]'(by rw [values0513_size]; exact i.isLt)) := by
  exact segment_get 384 values0513 ⟨i.val, by rw [values0513_size]; exact i.isLt⟩

def values0514 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0514.coefficient33_416,
  OriginalRow227TriangleData0514.coefficient33_417,
  OriginalRow227TriangleData0514.coefficient33_418,
  OriginalRow227TriangleData0514.coefficient33_419,
  OriginalRow227TriangleData0514.coefficient33_420,
  OriginalRow227TriangleData0514.coefficient33_421,
  OriginalRow227TriangleData0514.coefficient33_422,
  OriginalRow227TriangleData0514.coefficient33_423,
  OriginalRow227TriangleData0514.coefficient33_424,
  OriginalRow227TriangleData0514.coefficient33_425,
  OriginalRow227TriangleData0514.coefficient33_426,
  OriginalRow227TriangleData0514.coefficient33_427,
  OriginalRow227TriangleData0514.coefficient33_428,
  OriginalRow227TriangleData0514.coefficient33_429,
  OriginalRow227TriangleData0514.coefficient33_430,
  OriginalRow227TriangleData0514.coefficient33_431,
  OriginalRow227TriangleData0514.coefficient33_432,
  OriginalRow227TriangleData0514.coefficient33_433,
  OriginalRow227TriangleData0514.coefficient33_434,
  OriginalRow227TriangleData0514.coefficient33_435,
  OriginalRow227TriangleData0514.coefficient33_436,
  OriginalRow227TriangleData0514.coefficient33_437,
  OriginalRow227TriangleData0514.coefficient33_438,
  OriginalRow227TriangleData0514.coefficient33_439,
  OriginalRow227TriangleData0514.coefficient33_440,
  OriginalRow227TriangleData0514.coefficient33_441,
  OriginalRow227TriangleData0514.coefficient33_442,
  OriginalRow227TriangleData0514.coefficient33_443,
  OriginalRow227TriangleData0514.coefficient33_444,
  OriginalRow227TriangleData0514.coefficient33_445,
  OriginalRow227TriangleData0514.coefficient33_446,
  OriginalRow227TriangleData0514.coefficient33_447
]

theorem values0514_size : values0514.size = 32 := rfl

def block0514 : ℕ → Option IntervalDyadic := segment 416 values0514

theorem block0514_domain : ExactDomain block0514 416 448 := by
  simpa only [values0514_size] using segment_domain 416 values0514

theorem block0514_get (i : Fin 32) :
    block0514 (416 + i.val) = some (values0514[i.val]'(by rw [values0514_size]; exact i.isLt)) := by
  exact segment_get 416 values0514 ⟨i.val, by rw [values0514_size]; exact i.isLt⟩

def values0515 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0515.coefficient33_448,
  OriginalRow227TriangleData0515.coefficient33_449,
  OriginalRow227TriangleData0515.coefficient33_450,
  OriginalRow227TriangleData0515.coefficient33_451,
  OriginalRow227TriangleData0515.coefficient33_452,
  OriginalRow227TriangleData0515.coefficient33_453,
  OriginalRow227TriangleData0515.coefficient33_454,
  OriginalRow227TriangleData0515.coefficient33_455,
  OriginalRow227TriangleData0515.coefficient33_456,
  OriginalRow227TriangleData0515.coefficient33_457,
  OriginalRow227TriangleData0515.coefficient33_458,
  OriginalRow227TriangleData0515.coefficient33_459,
  OriginalRow227TriangleData0515.coefficient33_460,
  OriginalRow227TriangleData0515.coefficient33_461,
  OriginalRow227TriangleData0515.coefficient33_462,
  OriginalRow227TriangleData0515.coefficient33_463,
  OriginalRow227TriangleData0515.coefficient33_464,
  OriginalRow227TriangleData0515.coefficient33_465,
  OriginalRow227TriangleData0515.coefficient33_466,
  OriginalRow227TriangleData0515.coefficient33_467,
  OriginalRow227TriangleData0515.coefficient33_468
]

theorem values0515_size : values0515.size = 21 := rfl

def block0515 : ℕ → Option IntervalDyadic := segment 448 values0515

theorem block0515_domain : ExactDomain block0515 448 469 := by
  simpa only [values0515_size] using segment_domain 448 values0515

theorem block0515_get (i : Fin 21) :
    block0515 (448 + i.val) = some (values0515[i.val]'(by rw [values0515_size]; exact i.isLt)) := by
  exact segment_get 448 values0515 ⟨i.val, by rw [values0515_size]; exact i.isLt⟩

def node0064_0128 : ℕ → Option IntervalDyadic := split 96 block0503 block0504

theorem node0064_0128_domain : ExactDomain node0064_0128 64 128 := by
  exact split_domain (by decide) (by decide) block0503_domain block0504_domain

def node0032_0128 : ℕ → Option IntervalDyadic := split 64 block0502 node0064_0128

theorem node0032_0128_domain : ExactDomain node0032_0128 32 128 := by
  exact split_domain (by decide) (by decide) block0502_domain node0064_0128_domain

def node0128_0192 : ℕ → Option IntervalDyadic := split 160 block0505 block0506

theorem node0128_0192_domain : ExactDomain node0128_0192 128 192 := by
  exact split_domain (by decide) (by decide) block0505_domain block0506_domain

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block0507 block0508

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block0507_domain block0508_domain

def node0128_0256 : ℕ → Option IntervalDyadic := split 192 node0128_0192 node0192_0256

theorem node0128_0256_domain : ExactDomain node0128_0256 128 256 := by
  exact split_domain (by decide) (by decide) node0128_0192_domain node0192_0256_domain

def node0032_0256 : ℕ → Option IntervalDyadic := split 128 node0032_0128 node0128_0256

theorem node0032_0256_domain : ExactDomain node0032_0256 32 256 := by
  exact split_domain (by decide) (by decide) node0032_0128_domain node0128_0256_domain

def node0288_0352 : ℕ → Option IntervalDyadic := split 320 block0510 block0511

theorem node0288_0352_domain : ExactDomain node0288_0352 288 352 := by
  exact split_domain (by decide) (by decide) block0510_domain block0511_domain

def node0256_0352 : ℕ → Option IntervalDyadic := split 288 block0509 node0288_0352

theorem node0256_0352_domain : ExactDomain node0256_0352 256 352 := by
  exact split_domain (by decide) (by decide) block0509_domain node0288_0352_domain

def node0352_0416 : ℕ → Option IntervalDyadic := split 384 block0512 block0513

theorem node0352_0416_domain : ExactDomain node0352_0416 352 416 := by
  exact split_domain (by decide) (by decide) block0512_domain block0513_domain

def node0416_0469 : ℕ → Option IntervalDyadic := split 448 block0514 block0515

theorem node0416_0469_domain : ExactDomain node0416_0469 416 469 := by
  exact split_domain (by decide) (by decide) block0514_domain block0515_domain

def node0352_0469 : ℕ → Option IntervalDyadic := split 416 node0352_0416 node0416_0469

theorem node0352_0469_domain : ExactDomain node0352_0469 352 469 := by
  exact split_domain (by decide) (by decide) node0352_0416_domain node0416_0469_domain

def node0256_0469 : ℕ → Option IntervalDyadic := split 352 node0256_0352 node0352_0469

theorem node0256_0469_domain : ExactDomain node0256_0469 256 469 := by
  exact split_domain (by decide) (by decide) node0256_0352_domain node0352_0469_domain

def node0032_0469 : ℕ → Option IntervalDyadic := split 256 node0032_0256 node0256_0469

theorem node0032_0469_domain : ExactDomain node0032_0469 32 469 := by
  exact split_domain (by decide) (by decide) node0032_0256_domain node0256_0469_domain

def lookup : ℕ → Option IntervalDyadic := node0032_0469

theorem lookup_domain : ExactDomain lookup 32 469 :=
  node0032_0469_domain

theorem block0502_lookup (i : Fin 32) :
    lookup (32 + i.val) = some (values0502[i.val]'(by rw [values0502_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (32 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_left 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0032_0128, split_left 64 block0502 node0064_0128 (by omega)]
  exact block0502_get i

theorem block0503_lookup (i : Fin 32) :
    lookup (64 + i.val) = some (values0503[i.val]'(by rw [values0503_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (64 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_left 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0032_0128, split_right 64 block0502 node0064_0128 (by omega)]
  rw [node0064_0128, split_left 96 block0503 block0504 (by omega)]
  exact block0503_get i

theorem block0504_lookup (i : Fin 32) :
    lookup (96 + i.val) = some (values0504[i.val]'(by rw [values0504_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (96 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_left 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0032_0128, split_right 64 block0502 node0064_0128 (by omega)]
  rw [node0064_0128, split_right 96 block0503 block0504 (by omega)]
  exact block0504_get i

theorem block0505_lookup (i : Fin 32) :
    lookup (128 + i.val) = some (values0505[i.val]'(by rw [values0505_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (128 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_right 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_left 160 block0505 block0506 (by omega)]
  exact block0505_get i

theorem block0506_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values0506[i.val]'(by rw [values0506_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (160 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_right 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_right 160 block0505 block0506 (by omega)]
  exact block0506_get i

theorem block0507_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values0507[i.val]'(by rw [values0507_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (192 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_right 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block0507 block0508 (by omega)]
  exact block0507_get i

theorem block0508_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values0508[i.val]'(by rw [values0508_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (224 + i.val) = _
  rw [node0032_0469, split_left 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0032_0256, split_right 128 node0032_0128 node0128_0256 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block0507 block0508 (by omega)]
  exact block0508_get i

theorem block0509_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values0509[i.val]'(by rw [values0509_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (256 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_left 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0256_0352, split_left 288 block0509 node0288_0352 (by omega)]
  exact block0509_get i

theorem block0510_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values0510[i.val]'(by rw [values0510_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (288 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_left 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0256_0352, split_right 288 block0509 node0288_0352 (by omega)]
  rw [node0288_0352, split_left 320 block0510 block0511 (by omega)]
  exact block0510_get i

theorem block0511_lookup (i : Fin 32) :
    lookup (320 + i.val) = some (values0511[i.val]'(by rw [values0511_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (320 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_left 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0256_0352, split_right 288 block0509 node0288_0352 (by omega)]
  rw [node0288_0352, split_right 320 block0510 block0511 (by omega)]
  exact block0511_get i

theorem block0512_lookup (i : Fin 32) :
    lookup (352 + i.val) = some (values0512[i.val]'(by rw [values0512_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (352 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_right 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0352_0469, split_left 416 node0352_0416 node0416_0469 (by omega)]
  rw [node0352_0416, split_left 384 block0512 block0513 (by omega)]
  exact block0512_get i

theorem block0513_lookup (i : Fin 32) :
    lookup (384 + i.val) = some (values0513[i.val]'(by rw [values0513_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (384 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_right 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0352_0469, split_left 416 node0352_0416 node0416_0469 (by omega)]
  rw [node0352_0416, split_right 384 block0512 block0513 (by omega)]
  exact block0513_get i

theorem block0514_lookup (i : Fin 32) :
    lookup (416 + i.val) = some (values0514[i.val]'(by rw [values0514_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (416 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_right 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0352_0469, split_right 416 node0352_0416 node0416_0469 (by omega)]
  rw [node0416_0469, split_left 448 block0514 block0515 (by omega)]
  exact block0514_get i

theorem block0515_lookup (i : Fin 21) :
    lookup (448 + i.val) = some (values0515[i.val]'(by rw [values0515_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0032_0469 (448 + i.val) = _
  rw [node0032_0469, split_right 256 node0032_0256 node0256_0469 (by omega)]
  rw [node0256_0469, split_right 352 node0256_0352 node0352_0469 (by omega)]
  rw [node0352_0469, split_right 416 node0352_0416 node0416_0469 (by omega)]
  rw [node0416_0469, split_right 448 block0514 block0515 (by omega)]
  exact block0515_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0502_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0502_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0503_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0503_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0504_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0504_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0505_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0505_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0506_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0506_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0507_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0507_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0508_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0508_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0509_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0509_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0510_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0510_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0511_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0511_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0512_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0512_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0513_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0513_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0514_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0514_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0515_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0515_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0502_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0503_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0504_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0505_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0506_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0507_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0508_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0509_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0510_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0511_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0512_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0513_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0514_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow033.block0515_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow033
