import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0387
import Grothe.UpperChaos.OriginalRow227TriangleData0388
import Grothe.UpperChaos.OriginalRow227TriangleData0389
import Grothe.UpperChaos.OriginalRow227TriangleData0390
import Grothe.UpperChaos.OriginalRow227TriangleData0391
import Grothe.UpperChaos.OriginalRow227TriangleData0392
import Grothe.UpperChaos.OriginalRow227TriangleData0393
import Grothe.UpperChaos.OriginalRow227TriangleData0394
import Grothe.UpperChaos.OriginalRow227TriangleData0395
import Grothe.UpperChaos.OriginalRow227TriangleData0396
import Grothe.UpperChaos.OriginalRow227TriangleData0397
import Grothe.UpperChaos.OriginalRow227TriangleData0398
import Grothe.UpperChaos.OriginalRow227TriangleData0399
import Grothe.UpperChaos.OriginalRow227TriangleData0400
import Grothe.UpperChaos.OriginalRow227TriangleData0401

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow025

open ConditionalTableLookup

def values0387 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0387.coefficient25_24,
  OriginalRow227TriangleData0387.coefficient25_25,
  OriginalRow227TriangleData0387.coefficient25_26,
  OriginalRow227TriangleData0387.coefficient25_27,
  OriginalRow227TriangleData0387.coefficient25_28,
  OriginalRow227TriangleData0387.coefficient25_29,
  OriginalRow227TriangleData0387.coefficient25_30,
  OriginalRow227TriangleData0387.coefficient25_31,
  OriginalRow227TriangleData0387.coefficient25_32,
  OriginalRow227TriangleData0387.coefficient25_33,
  OriginalRow227TriangleData0387.coefficient25_34,
  OriginalRow227TriangleData0387.coefficient25_35,
  OriginalRow227TriangleData0387.coefficient25_36,
  OriginalRow227TriangleData0387.coefficient25_37,
  OriginalRow227TriangleData0387.coefficient25_38,
  OriginalRow227TriangleData0387.coefficient25_39,
  OriginalRow227TriangleData0387.coefficient25_40,
  OriginalRow227TriangleData0387.coefficient25_41,
  OriginalRow227TriangleData0387.coefficient25_42,
  OriginalRow227TriangleData0387.coefficient25_43,
  OriginalRow227TriangleData0387.coefficient25_44,
  OriginalRow227TriangleData0387.coefficient25_45,
  OriginalRow227TriangleData0387.coefficient25_46,
  OriginalRow227TriangleData0387.coefficient25_47,
  OriginalRow227TriangleData0387.coefficient25_48,
  OriginalRow227TriangleData0387.coefficient25_49,
  OriginalRow227TriangleData0387.coefficient25_50,
  OriginalRow227TriangleData0387.coefficient25_51,
  OriginalRow227TriangleData0387.coefficient25_52,
  OriginalRow227TriangleData0387.coefficient25_53,
  OriginalRow227TriangleData0387.coefficient25_54,
  OriginalRow227TriangleData0387.coefficient25_55
]

theorem values0387_size : values0387.size = 32 := rfl

def block0387 : ℕ → Option IntervalDyadic := segment 24 values0387

theorem block0387_domain : ExactDomain block0387 24 56 := by
  simpa only [values0387_size] using segment_domain 24 values0387

theorem block0387_get (i : Fin 32) :
    block0387 (24 + i.val) = some (values0387[i.val]'(by rw [values0387_size]; exact i.isLt)) := by
  exact segment_get 24 values0387 ⟨i.val, by rw [values0387_size]; exact i.isLt⟩

def values0388 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0388.coefficient25_56,
  OriginalRow227TriangleData0388.coefficient25_57,
  OriginalRow227TriangleData0388.coefficient25_58,
  OriginalRow227TriangleData0388.coefficient25_59,
  OriginalRow227TriangleData0388.coefficient25_60,
  OriginalRow227TriangleData0388.coefficient25_61,
  OriginalRow227TriangleData0388.coefficient25_62,
  OriginalRow227TriangleData0388.coefficient25_63,
  OriginalRow227TriangleData0388.coefficient25_64,
  OriginalRow227TriangleData0388.coefficient25_65,
  OriginalRow227TriangleData0388.coefficient25_66,
  OriginalRow227TriangleData0388.coefficient25_67,
  OriginalRow227TriangleData0388.coefficient25_68,
  OriginalRow227TriangleData0388.coefficient25_69,
  OriginalRow227TriangleData0388.coefficient25_70,
  OriginalRow227TriangleData0388.coefficient25_71,
  OriginalRow227TriangleData0388.coefficient25_72,
  OriginalRow227TriangleData0388.coefficient25_73,
  OriginalRow227TriangleData0388.coefficient25_74,
  OriginalRow227TriangleData0388.coefficient25_75,
  OriginalRow227TriangleData0388.coefficient25_76,
  OriginalRow227TriangleData0388.coefficient25_77,
  OriginalRow227TriangleData0388.coefficient25_78,
  OriginalRow227TriangleData0388.coefficient25_79,
  OriginalRow227TriangleData0388.coefficient25_80,
  OriginalRow227TriangleData0388.coefficient25_81,
  OriginalRow227TriangleData0388.coefficient25_82,
  OriginalRow227TriangleData0388.coefficient25_83,
  OriginalRow227TriangleData0388.coefficient25_84,
  OriginalRow227TriangleData0388.coefficient25_85,
  OriginalRow227TriangleData0388.coefficient25_86,
  OriginalRow227TriangleData0388.coefficient25_87
]

theorem values0388_size : values0388.size = 32 := rfl

def block0388 : ℕ → Option IntervalDyadic := segment 56 values0388

theorem block0388_domain : ExactDomain block0388 56 88 := by
  simpa only [values0388_size] using segment_domain 56 values0388

theorem block0388_get (i : Fin 32) :
    block0388 (56 + i.val) = some (values0388[i.val]'(by rw [values0388_size]; exact i.isLt)) := by
  exact segment_get 56 values0388 ⟨i.val, by rw [values0388_size]; exact i.isLt⟩

def values0389 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0389.coefficient25_88,
  OriginalRow227TriangleData0389.coefficient25_89,
  OriginalRow227TriangleData0389.coefficient25_90,
  OriginalRow227TriangleData0389.coefficient25_91,
  OriginalRow227TriangleData0389.coefficient25_92,
  OriginalRow227TriangleData0389.coefficient25_93,
  OriginalRow227TriangleData0389.coefficient25_94,
  OriginalRow227TriangleData0389.coefficient25_95,
  OriginalRow227TriangleData0389.coefficient25_96,
  OriginalRow227TriangleData0389.coefficient25_97,
  OriginalRow227TriangleData0389.coefficient25_98,
  OriginalRow227TriangleData0389.coefficient25_99,
  OriginalRow227TriangleData0389.coefficient25_100,
  OriginalRow227TriangleData0389.coefficient25_101,
  OriginalRow227TriangleData0389.coefficient25_102,
  OriginalRow227TriangleData0389.coefficient25_103,
  OriginalRow227TriangleData0389.coefficient25_104,
  OriginalRow227TriangleData0389.coefficient25_105,
  OriginalRow227TriangleData0389.coefficient25_106,
  OriginalRow227TriangleData0389.coefficient25_107,
  OriginalRow227TriangleData0389.coefficient25_108,
  OriginalRow227TriangleData0389.coefficient25_109,
  OriginalRow227TriangleData0389.coefficient25_110,
  OriginalRow227TriangleData0389.coefficient25_111,
  OriginalRow227TriangleData0389.coefficient25_112,
  OriginalRow227TriangleData0389.coefficient25_113,
  OriginalRow227TriangleData0389.coefficient25_114,
  OriginalRow227TriangleData0389.coefficient25_115,
  OriginalRow227TriangleData0389.coefficient25_116,
  OriginalRow227TriangleData0389.coefficient25_117,
  OriginalRow227TriangleData0389.coefficient25_118,
  OriginalRow227TriangleData0389.coefficient25_119
]

theorem values0389_size : values0389.size = 32 := rfl

def block0389 : ℕ → Option IntervalDyadic := segment 88 values0389

theorem block0389_domain : ExactDomain block0389 88 120 := by
  simpa only [values0389_size] using segment_domain 88 values0389

theorem block0389_get (i : Fin 32) :
    block0389 (88 + i.val) = some (values0389[i.val]'(by rw [values0389_size]; exact i.isLt)) := by
  exact segment_get 88 values0389 ⟨i.val, by rw [values0389_size]; exact i.isLt⟩

def values0390 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0390.coefficient25_120,
  OriginalRow227TriangleData0390.coefficient25_121,
  OriginalRow227TriangleData0390.coefficient25_122,
  OriginalRow227TriangleData0390.coefficient25_123,
  OriginalRow227TriangleData0390.coefficient25_124,
  OriginalRow227TriangleData0390.coefficient25_125,
  OriginalRow227TriangleData0390.coefficient25_126,
  OriginalRow227TriangleData0390.coefficient25_127,
  OriginalRow227TriangleData0390.coefficient25_128,
  OriginalRow227TriangleData0390.coefficient25_129,
  OriginalRow227TriangleData0390.coefficient25_130,
  OriginalRow227TriangleData0390.coefficient25_131,
  OriginalRow227TriangleData0390.coefficient25_132,
  OriginalRow227TriangleData0390.coefficient25_133,
  OriginalRow227TriangleData0390.coefficient25_134,
  OriginalRow227TriangleData0390.coefficient25_135,
  OriginalRow227TriangleData0390.coefficient25_136,
  OriginalRow227TriangleData0390.coefficient25_137,
  OriginalRow227TriangleData0390.coefficient25_138,
  OriginalRow227TriangleData0390.coefficient25_139,
  OriginalRow227TriangleData0390.coefficient25_140,
  OriginalRow227TriangleData0390.coefficient25_141,
  OriginalRow227TriangleData0390.coefficient25_142,
  OriginalRow227TriangleData0390.coefficient25_143,
  OriginalRow227TriangleData0390.coefficient25_144,
  OriginalRow227TriangleData0390.coefficient25_145,
  OriginalRow227TriangleData0390.coefficient25_146,
  OriginalRow227TriangleData0390.coefficient25_147,
  OriginalRow227TriangleData0390.coefficient25_148,
  OriginalRow227TriangleData0390.coefficient25_149,
  OriginalRow227TriangleData0390.coefficient25_150,
  OriginalRow227TriangleData0390.coefficient25_151
]

theorem values0390_size : values0390.size = 32 := rfl

def block0390 : ℕ → Option IntervalDyadic := segment 120 values0390

theorem block0390_domain : ExactDomain block0390 120 152 := by
  simpa only [values0390_size] using segment_domain 120 values0390

theorem block0390_get (i : Fin 32) :
    block0390 (120 + i.val) = some (values0390[i.val]'(by rw [values0390_size]; exact i.isLt)) := by
  exact segment_get 120 values0390 ⟨i.val, by rw [values0390_size]; exact i.isLt⟩

def values0391 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0391.coefficient25_152,
  OriginalRow227TriangleData0391.coefficient25_153,
  OriginalRow227TriangleData0391.coefficient25_154,
  OriginalRow227TriangleData0391.coefficient25_155,
  OriginalRow227TriangleData0391.coefficient25_156,
  OriginalRow227TriangleData0391.coefficient25_157,
  OriginalRow227TriangleData0391.coefficient25_158,
  OriginalRow227TriangleData0391.coefficient25_159,
  OriginalRow227TriangleData0391.coefficient25_160,
  OriginalRow227TriangleData0391.coefficient25_161,
  OriginalRow227TriangleData0391.coefficient25_162,
  OriginalRow227TriangleData0391.coefficient25_163,
  OriginalRow227TriangleData0391.coefficient25_164,
  OriginalRow227TriangleData0391.coefficient25_165,
  OriginalRow227TriangleData0391.coefficient25_166,
  OriginalRow227TriangleData0391.coefficient25_167,
  OriginalRow227TriangleData0391.coefficient25_168,
  OriginalRow227TriangleData0391.coefficient25_169,
  OriginalRow227TriangleData0391.coefficient25_170,
  OriginalRow227TriangleData0391.coefficient25_171,
  OriginalRow227TriangleData0391.coefficient25_172,
  OriginalRow227TriangleData0391.coefficient25_173,
  OriginalRow227TriangleData0391.coefficient25_174,
  OriginalRow227TriangleData0391.coefficient25_175,
  OriginalRow227TriangleData0391.coefficient25_176,
  OriginalRow227TriangleData0391.coefficient25_177,
  OriginalRow227TriangleData0391.coefficient25_178,
  OriginalRow227TriangleData0391.coefficient25_179,
  OriginalRow227TriangleData0391.coefficient25_180,
  OriginalRow227TriangleData0391.coefficient25_181,
  OriginalRow227TriangleData0391.coefficient25_182,
  OriginalRow227TriangleData0391.coefficient25_183
]

theorem values0391_size : values0391.size = 32 := rfl

def block0391 : ℕ → Option IntervalDyadic := segment 152 values0391

theorem block0391_domain : ExactDomain block0391 152 184 := by
  simpa only [values0391_size] using segment_domain 152 values0391

theorem block0391_get (i : Fin 32) :
    block0391 (152 + i.val) = some (values0391[i.val]'(by rw [values0391_size]; exact i.isLt)) := by
  exact segment_get 152 values0391 ⟨i.val, by rw [values0391_size]; exact i.isLt⟩

def values0392 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0392.coefficient25_184,
  OriginalRow227TriangleData0392.coefficient25_185,
  OriginalRow227TriangleData0392.coefficient25_186,
  OriginalRow227TriangleData0392.coefficient25_187,
  OriginalRow227TriangleData0392.coefficient25_188,
  OriginalRow227TriangleData0392.coefficient25_189,
  OriginalRow227TriangleData0392.coefficient25_190,
  OriginalRow227TriangleData0392.coefficient25_191,
  OriginalRow227TriangleData0392.coefficient25_192,
  OriginalRow227TriangleData0392.coefficient25_193,
  OriginalRow227TriangleData0392.coefficient25_194,
  OriginalRow227TriangleData0392.coefficient25_195,
  OriginalRow227TriangleData0392.coefficient25_196,
  OriginalRow227TriangleData0392.coefficient25_197,
  OriginalRow227TriangleData0392.coefficient25_198,
  OriginalRow227TriangleData0392.coefficient25_199,
  OriginalRow227TriangleData0392.coefficient25_200,
  OriginalRow227TriangleData0392.coefficient25_201,
  OriginalRow227TriangleData0392.coefficient25_202,
  OriginalRow227TriangleData0392.coefficient25_203,
  OriginalRow227TriangleData0392.coefficient25_204,
  OriginalRow227TriangleData0392.coefficient25_205,
  OriginalRow227TriangleData0392.coefficient25_206,
  OriginalRow227TriangleData0392.coefficient25_207,
  OriginalRow227TriangleData0392.coefficient25_208,
  OriginalRow227TriangleData0392.coefficient25_209,
  OriginalRow227TriangleData0392.coefficient25_210,
  OriginalRow227TriangleData0392.coefficient25_211,
  OriginalRow227TriangleData0392.coefficient25_212,
  OriginalRow227TriangleData0392.coefficient25_213,
  OriginalRow227TriangleData0392.coefficient25_214,
  OriginalRow227TriangleData0392.coefficient25_215
]

theorem values0392_size : values0392.size = 32 := rfl

def block0392 : ℕ → Option IntervalDyadic := segment 184 values0392

theorem block0392_domain : ExactDomain block0392 184 216 := by
  simpa only [values0392_size] using segment_domain 184 values0392

theorem block0392_get (i : Fin 32) :
    block0392 (184 + i.val) = some (values0392[i.val]'(by rw [values0392_size]; exact i.isLt)) := by
  exact segment_get 184 values0392 ⟨i.val, by rw [values0392_size]; exact i.isLt⟩

def values0393 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0393.coefficient25_216,
  OriginalRow227TriangleData0393.coefficient25_217,
  OriginalRow227TriangleData0393.coefficient25_218,
  OriginalRow227TriangleData0393.coefficient25_219,
  OriginalRow227TriangleData0393.coefficient25_220,
  OriginalRow227TriangleData0393.coefficient25_221,
  OriginalRow227TriangleData0393.coefficient25_222,
  OriginalRow227TriangleData0393.coefficient25_223,
  OriginalRow227TriangleData0393.coefficient25_224,
  OriginalRow227TriangleData0393.coefficient25_225,
  OriginalRow227TriangleData0393.coefficient25_226,
  OriginalRow227TriangleData0393.coefficient25_227,
  OriginalRow227TriangleData0393.coefficient25_228,
  OriginalRow227TriangleData0393.coefficient25_229,
  OriginalRow227TriangleData0393.coefficient25_230,
  OriginalRow227TriangleData0393.coefficient25_231,
  OriginalRow227TriangleData0393.coefficient25_232,
  OriginalRow227TriangleData0393.coefficient25_233,
  OriginalRow227TriangleData0393.coefficient25_234,
  OriginalRow227TriangleData0393.coefficient25_235,
  OriginalRow227TriangleData0393.coefficient25_236,
  OriginalRow227TriangleData0393.coefficient25_237,
  OriginalRow227TriangleData0393.coefficient25_238,
  OriginalRow227TriangleData0393.coefficient25_239,
  OriginalRow227TriangleData0393.coefficient25_240,
  OriginalRow227TriangleData0393.coefficient25_241,
  OriginalRow227TriangleData0393.coefficient25_242,
  OriginalRow227TriangleData0393.coefficient25_243,
  OriginalRow227TriangleData0393.coefficient25_244,
  OriginalRow227TriangleData0393.coefficient25_245,
  OriginalRow227TriangleData0393.coefficient25_246,
  OriginalRow227TriangleData0393.coefficient25_247
]

theorem values0393_size : values0393.size = 32 := rfl

def block0393 : ℕ → Option IntervalDyadic := segment 216 values0393

theorem block0393_domain : ExactDomain block0393 216 248 := by
  simpa only [values0393_size] using segment_domain 216 values0393

theorem block0393_get (i : Fin 32) :
    block0393 (216 + i.val) = some (values0393[i.val]'(by rw [values0393_size]; exact i.isLt)) := by
  exact segment_get 216 values0393 ⟨i.val, by rw [values0393_size]; exact i.isLt⟩

def values0394 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0394.coefficient25_248,
  OriginalRow227TriangleData0394.coefficient25_249,
  OriginalRow227TriangleData0394.coefficient25_250,
  OriginalRow227TriangleData0394.coefficient25_251,
  OriginalRow227TriangleData0394.coefficient25_252,
  OriginalRow227TriangleData0394.coefficient25_253,
  OriginalRow227TriangleData0394.coefficient25_254,
  OriginalRow227TriangleData0394.coefficient25_255,
  OriginalRow227TriangleData0394.coefficient25_256,
  OriginalRow227TriangleData0394.coefficient25_257,
  OriginalRow227TriangleData0394.coefficient25_258,
  OriginalRow227TriangleData0394.coefficient25_259,
  OriginalRow227TriangleData0394.coefficient25_260,
  OriginalRow227TriangleData0394.coefficient25_261,
  OriginalRow227TriangleData0394.coefficient25_262,
  OriginalRow227TriangleData0394.coefficient25_263,
  OriginalRow227TriangleData0394.coefficient25_264,
  OriginalRow227TriangleData0394.coefficient25_265,
  OriginalRow227TriangleData0394.coefficient25_266,
  OriginalRow227TriangleData0394.coefficient25_267,
  OriginalRow227TriangleData0394.coefficient25_268,
  OriginalRow227TriangleData0394.coefficient25_269,
  OriginalRow227TriangleData0394.coefficient25_270,
  OriginalRow227TriangleData0394.coefficient25_271,
  OriginalRow227TriangleData0394.coefficient25_272,
  OriginalRow227TriangleData0394.coefficient25_273,
  OriginalRow227TriangleData0394.coefficient25_274,
  OriginalRow227TriangleData0394.coefficient25_275,
  OriginalRow227TriangleData0394.coefficient25_276,
  OriginalRow227TriangleData0394.coefficient25_277,
  OriginalRow227TriangleData0394.coefficient25_278,
  OriginalRow227TriangleData0394.coefficient25_279
]

theorem values0394_size : values0394.size = 32 := rfl

def block0394 : ℕ → Option IntervalDyadic := segment 248 values0394

theorem block0394_domain : ExactDomain block0394 248 280 := by
  simpa only [values0394_size] using segment_domain 248 values0394

theorem block0394_get (i : Fin 32) :
    block0394 (248 + i.val) = some (values0394[i.val]'(by rw [values0394_size]; exact i.isLt)) := by
  exact segment_get 248 values0394 ⟨i.val, by rw [values0394_size]; exact i.isLt⟩

def values0395 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0395.coefficient25_280,
  OriginalRow227TriangleData0395.coefficient25_281,
  OriginalRow227TriangleData0395.coefficient25_282,
  OriginalRow227TriangleData0395.coefficient25_283,
  OriginalRow227TriangleData0395.coefficient25_284,
  OriginalRow227TriangleData0395.coefficient25_285,
  OriginalRow227TriangleData0395.coefficient25_286,
  OriginalRow227TriangleData0395.coefficient25_287,
  OriginalRow227TriangleData0395.coefficient25_288,
  OriginalRow227TriangleData0395.coefficient25_289,
  OriginalRow227TriangleData0395.coefficient25_290,
  OriginalRow227TriangleData0395.coefficient25_291,
  OriginalRow227TriangleData0395.coefficient25_292,
  OriginalRow227TriangleData0395.coefficient25_293,
  OriginalRow227TriangleData0395.coefficient25_294,
  OriginalRow227TriangleData0395.coefficient25_295,
  OriginalRow227TriangleData0395.coefficient25_296,
  OriginalRow227TriangleData0395.coefficient25_297,
  OriginalRow227TriangleData0395.coefficient25_298,
  OriginalRow227TriangleData0395.coefficient25_299,
  OriginalRow227TriangleData0395.coefficient25_300,
  OriginalRow227TriangleData0395.coefficient25_301,
  OriginalRow227TriangleData0395.coefficient25_302,
  OriginalRow227TriangleData0395.coefficient25_303,
  OriginalRow227TriangleData0395.coefficient25_304,
  OriginalRow227TriangleData0395.coefficient25_305,
  OriginalRow227TriangleData0395.coefficient25_306,
  OriginalRow227TriangleData0395.coefficient25_307,
  OriginalRow227TriangleData0395.coefficient25_308,
  OriginalRow227TriangleData0395.coefficient25_309,
  OriginalRow227TriangleData0395.coefficient25_310,
  OriginalRow227TriangleData0395.coefficient25_311
]

theorem values0395_size : values0395.size = 32 := rfl

def block0395 : ℕ → Option IntervalDyadic := segment 280 values0395

theorem block0395_domain : ExactDomain block0395 280 312 := by
  simpa only [values0395_size] using segment_domain 280 values0395

theorem block0395_get (i : Fin 32) :
    block0395 (280 + i.val) = some (values0395[i.val]'(by rw [values0395_size]; exact i.isLt)) := by
  exact segment_get 280 values0395 ⟨i.val, by rw [values0395_size]; exact i.isLt⟩

def values0396 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0396.coefficient25_312,
  OriginalRow227TriangleData0396.coefficient25_313,
  OriginalRow227TriangleData0396.coefficient25_314,
  OriginalRow227TriangleData0396.coefficient25_315,
  OriginalRow227TriangleData0396.coefficient25_316,
  OriginalRow227TriangleData0396.coefficient25_317,
  OriginalRow227TriangleData0396.coefficient25_318,
  OriginalRow227TriangleData0396.coefficient25_319,
  OriginalRow227TriangleData0396.coefficient25_320,
  OriginalRow227TriangleData0396.coefficient25_321,
  OriginalRow227TriangleData0396.coefficient25_322,
  OriginalRow227TriangleData0396.coefficient25_323,
  OriginalRow227TriangleData0396.coefficient25_324,
  OriginalRow227TriangleData0396.coefficient25_325,
  OriginalRow227TriangleData0396.coefficient25_326,
  OriginalRow227TriangleData0396.coefficient25_327,
  OriginalRow227TriangleData0396.coefficient25_328,
  OriginalRow227TriangleData0396.coefficient25_329,
  OriginalRow227TriangleData0396.coefficient25_330,
  OriginalRow227TriangleData0396.coefficient25_331,
  OriginalRow227TriangleData0396.coefficient25_332,
  OriginalRow227TriangleData0396.coefficient25_333,
  OriginalRow227TriangleData0396.coefficient25_334,
  OriginalRow227TriangleData0396.coefficient25_335,
  OriginalRow227TriangleData0396.coefficient25_336,
  OriginalRow227TriangleData0396.coefficient25_337,
  OriginalRow227TriangleData0396.coefficient25_338,
  OriginalRow227TriangleData0396.coefficient25_339,
  OriginalRow227TriangleData0396.coefficient25_340,
  OriginalRow227TriangleData0396.coefficient25_341,
  OriginalRow227TriangleData0396.coefficient25_342,
  OriginalRow227TriangleData0396.coefficient25_343
]

theorem values0396_size : values0396.size = 32 := rfl

def block0396 : ℕ → Option IntervalDyadic := segment 312 values0396

theorem block0396_domain : ExactDomain block0396 312 344 := by
  simpa only [values0396_size] using segment_domain 312 values0396

theorem block0396_get (i : Fin 32) :
    block0396 (312 + i.val) = some (values0396[i.val]'(by rw [values0396_size]; exact i.isLt)) := by
  exact segment_get 312 values0396 ⟨i.val, by rw [values0396_size]; exact i.isLt⟩

def values0397 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0397.coefficient25_344,
  OriginalRow227TriangleData0397.coefficient25_345,
  OriginalRow227TriangleData0397.coefficient25_346,
  OriginalRow227TriangleData0397.coefficient25_347,
  OriginalRow227TriangleData0397.coefficient25_348,
  OriginalRow227TriangleData0397.coefficient25_349,
  OriginalRow227TriangleData0397.coefficient25_350,
  OriginalRow227TriangleData0397.coefficient25_351,
  OriginalRow227TriangleData0397.coefficient25_352,
  OriginalRow227TriangleData0397.coefficient25_353,
  OriginalRow227TriangleData0397.coefficient25_354,
  OriginalRow227TriangleData0397.coefficient25_355,
  OriginalRow227TriangleData0397.coefficient25_356,
  OriginalRow227TriangleData0397.coefficient25_357,
  OriginalRow227TriangleData0397.coefficient25_358,
  OriginalRow227TriangleData0397.coefficient25_359,
  OriginalRow227TriangleData0397.coefficient25_360,
  OriginalRow227TriangleData0397.coefficient25_361,
  OriginalRow227TriangleData0397.coefficient25_362,
  OriginalRow227TriangleData0397.coefficient25_363,
  OriginalRow227TriangleData0397.coefficient25_364,
  OriginalRow227TriangleData0397.coefficient25_365,
  OriginalRow227TriangleData0397.coefficient25_366,
  OriginalRow227TriangleData0397.coefficient25_367,
  OriginalRow227TriangleData0397.coefficient25_368,
  OriginalRow227TriangleData0397.coefficient25_369,
  OriginalRow227TriangleData0397.coefficient25_370,
  OriginalRow227TriangleData0397.coefficient25_371,
  OriginalRow227TriangleData0397.coefficient25_372,
  OriginalRow227TriangleData0397.coefficient25_373,
  OriginalRow227TriangleData0397.coefficient25_374,
  OriginalRow227TriangleData0397.coefficient25_375
]

theorem values0397_size : values0397.size = 32 := rfl

def block0397 : ℕ → Option IntervalDyadic := segment 344 values0397

theorem block0397_domain : ExactDomain block0397 344 376 := by
  simpa only [values0397_size] using segment_domain 344 values0397

theorem block0397_get (i : Fin 32) :
    block0397 (344 + i.val) = some (values0397[i.val]'(by rw [values0397_size]; exact i.isLt)) := by
  exact segment_get 344 values0397 ⟨i.val, by rw [values0397_size]; exact i.isLt⟩

def values0398 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0398.coefficient25_376,
  OriginalRow227TriangleData0398.coefficient25_377,
  OriginalRow227TriangleData0398.coefficient25_378,
  OriginalRow227TriangleData0398.coefficient25_379,
  OriginalRow227TriangleData0398.coefficient25_380,
  OriginalRow227TriangleData0398.coefficient25_381,
  OriginalRow227TriangleData0398.coefficient25_382,
  OriginalRow227TriangleData0398.coefficient25_383,
  OriginalRow227TriangleData0398.coefficient25_384,
  OriginalRow227TriangleData0398.coefficient25_385,
  OriginalRow227TriangleData0398.coefficient25_386,
  OriginalRow227TriangleData0398.coefficient25_387,
  OriginalRow227TriangleData0398.coefficient25_388,
  OriginalRow227TriangleData0398.coefficient25_389,
  OriginalRow227TriangleData0398.coefficient25_390,
  OriginalRow227TriangleData0398.coefficient25_391,
  OriginalRow227TriangleData0398.coefficient25_392,
  OriginalRow227TriangleData0398.coefficient25_393,
  OriginalRow227TriangleData0398.coefficient25_394,
  OriginalRow227TriangleData0398.coefficient25_395,
  OriginalRow227TriangleData0398.coefficient25_396,
  OriginalRow227TriangleData0398.coefficient25_397,
  OriginalRow227TriangleData0398.coefficient25_398,
  OriginalRow227TriangleData0398.coefficient25_399,
  OriginalRow227TriangleData0398.coefficient25_400,
  OriginalRow227TriangleData0398.coefficient25_401,
  OriginalRow227TriangleData0398.coefficient25_402,
  OriginalRow227TriangleData0398.coefficient25_403,
  OriginalRow227TriangleData0398.coefficient25_404,
  OriginalRow227TriangleData0398.coefficient25_405,
  OriginalRow227TriangleData0398.coefficient25_406,
  OriginalRow227TriangleData0398.coefficient25_407
]

theorem values0398_size : values0398.size = 32 := rfl

def block0398 : ℕ → Option IntervalDyadic := segment 376 values0398

theorem block0398_domain : ExactDomain block0398 376 408 := by
  simpa only [values0398_size] using segment_domain 376 values0398

theorem block0398_get (i : Fin 32) :
    block0398 (376 + i.val) = some (values0398[i.val]'(by rw [values0398_size]; exact i.isLt)) := by
  exact segment_get 376 values0398 ⟨i.val, by rw [values0398_size]; exact i.isLt⟩

def values0399 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0399.coefficient25_408,
  OriginalRow227TriangleData0399.coefficient25_409,
  OriginalRow227TriangleData0399.coefficient25_410,
  OriginalRow227TriangleData0399.coefficient25_411,
  OriginalRow227TriangleData0399.coefficient25_412,
  OriginalRow227TriangleData0399.coefficient25_413,
  OriginalRow227TriangleData0399.coefficient25_414,
  OriginalRow227TriangleData0399.coefficient25_415,
  OriginalRow227TriangleData0399.coefficient25_416,
  OriginalRow227TriangleData0399.coefficient25_417,
  OriginalRow227TriangleData0399.coefficient25_418,
  OriginalRow227TriangleData0399.coefficient25_419,
  OriginalRow227TriangleData0399.coefficient25_420,
  OriginalRow227TriangleData0399.coefficient25_421,
  OriginalRow227TriangleData0399.coefficient25_422,
  OriginalRow227TriangleData0399.coefficient25_423,
  OriginalRow227TriangleData0399.coefficient25_424,
  OriginalRow227TriangleData0399.coefficient25_425,
  OriginalRow227TriangleData0399.coefficient25_426,
  OriginalRow227TriangleData0399.coefficient25_427,
  OriginalRow227TriangleData0399.coefficient25_428,
  OriginalRow227TriangleData0399.coefficient25_429,
  OriginalRow227TriangleData0399.coefficient25_430,
  OriginalRow227TriangleData0399.coefficient25_431,
  OriginalRow227TriangleData0399.coefficient25_432,
  OriginalRow227TriangleData0399.coefficient25_433,
  OriginalRow227TriangleData0399.coefficient25_434,
  OriginalRow227TriangleData0399.coefficient25_435,
  OriginalRow227TriangleData0399.coefficient25_436,
  OriginalRow227TriangleData0399.coefficient25_437,
  OriginalRow227TriangleData0399.coefficient25_438,
  OriginalRow227TriangleData0399.coefficient25_439
]

theorem values0399_size : values0399.size = 32 := rfl

def block0399 : ℕ → Option IntervalDyadic := segment 408 values0399

theorem block0399_domain : ExactDomain block0399 408 440 := by
  simpa only [values0399_size] using segment_domain 408 values0399

theorem block0399_get (i : Fin 32) :
    block0399 (408 + i.val) = some (values0399[i.val]'(by rw [values0399_size]; exact i.isLt)) := by
  exact segment_get 408 values0399 ⟨i.val, by rw [values0399_size]; exact i.isLt⟩

def values0400 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0400.coefficient25_440,
  OriginalRow227TriangleData0400.coefficient25_441,
  OriginalRow227TriangleData0400.coefficient25_442,
  OriginalRow227TriangleData0400.coefficient25_443,
  OriginalRow227TriangleData0400.coefficient25_444,
  OriginalRow227TriangleData0400.coefficient25_445,
  OriginalRow227TriangleData0400.coefficient25_446,
  OriginalRow227TriangleData0400.coefficient25_447,
  OriginalRow227TriangleData0400.coefficient25_448,
  OriginalRow227TriangleData0400.coefficient25_449,
  OriginalRow227TriangleData0400.coefficient25_450,
  OriginalRow227TriangleData0400.coefficient25_451,
  OriginalRow227TriangleData0400.coefficient25_452,
  OriginalRow227TriangleData0400.coefficient25_453,
  OriginalRow227TriangleData0400.coefficient25_454,
  OriginalRow227TriangleData0400.coefficient25_455,
  OriginalRow227TriangleData0400.coefficient25_456,
  OriginalRow227TriangleData0400.coefficient25_457,
  OriginalRow227TriangleData0400.coefficient25_458,
  OriginalRow227TriangleData0400.coefficient25_459,
  OriginalRow227TriangleData0400.coefficient25_460,
  OriginalRow227TriangleData0400.coefficient25_461,
  OriginalRow227TriangleData0400.coefficient25_462,
  OriginalRow227TriangleData0400.coefficient25_463,
  OriginalRow227TriangleData0400.coefficient25_464,
  OriginalRow227TriangleData0400.coefficient25_465,
  OriginalRow227TriangleData0400.coefficient25_466,
  OriginalRow227TriangleData0400.coefficient25_467,
  OriginalRow227TriangleData0400.coefficient25_468,
  OriginalRow227TriangleData0400.coefficient25_469,
  OriginalRow227TriangleData0400.coefficient25_470,
  OriginalRow227TriangleData0400.coefficient25_471
]

theorem values0400_size : values0400.size = 32 := rfl

def block0400 : ℕ → Option IntervalDyadic := segment 440 values0400

theorem block0400_domain : ExactDomain block0400 440 472 := by
  simpa only [values0400_size] using segment_domain 440 values0400

theorem block0400_get (i : Fin 32) :
    block0400 (440 + i.val) = some (values0400[i.val]'(by rw [values0400_size]; exact i.isLt)) := by
  exact segment_get 440 values0400 ⟨i.val, by rw [values0400_size]; exact i.isLt⟩

def values0401 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0401.coefficient25_472,
  OriginalRow227TriangleData0401.coefficient25_473,
  OriginalRow227TriangleData0401.coefficient25_474,
  OriginalRow227TriangleData0401.coefficient25_475,
  OriginalRow227TriangleData0401.coefficient25_476
]

theorem values0401_size : values0401.size = 5 := rfl

def block0401 : ℕ → Option IntervalDyadic := segment 472 values0401

theorem block0401_domain : ExactDomain block0401 472 477 := by
  simpa only [values0401_size] using segment_domain 472 values0401

theorem block0401_get (i : Fin 5) :
    block0401 (472 + i.val) = some (values0401[i.val]'(by rw [values0401_size]; exact i.isLt)) := by
  exact segment_get 472 values0401 ⟨i.val, by rw [values0401_size]; exact i.isLt⟩

def node0056_0120 : ℕ → Option IntervalDyadic := split 88 block0388 block0389

theorem node0056_0120_domain : ExactDomain node0056_0120 56 120 := by
  exact split_domain (by decide) (by decide) block0388_domain block0389_domain

def node0024_0120 : ℕ → Option IntervalDyadic := split 56 block0387 node0056_0120

theorem node0024_0120_domain : ExactDomain node0024_0120 24 120 := by
  exact split_domain (by decide) (by decide) block0387_domain node0056_0120_domain

def node0120_0184 : ℕ → Option IntervalDyadic := split 152 block0390 block0391

theorem node0120_0184_domain : ExactDomain node0120_0184 120 184 := by
  exact split_domain (by decide) (by decide) block0390_domain block0391_domain

def node0184_0248 : ℕ → Option IntervalDyadic := split 216 block0392 block0393

theorem node0184_0248_domain : ExactDomain node0184_0248 184 248 := by
  exact split_domain (by decide) (by decide) block0392_domain block0393_domain

def node0120_0248 : ℕ → Option IntervalDyadic := split 184 node0120_0184 node0184_0248

theorem node0120_0248_domain : ExactDomain node0120_0248 120 248 := by
  exact split_domain (by decide) (by decide) node0120_0184_domain node0184_0248_domain

def node0024_0248 : ℕ → Option IntervalDyadic := split 120 node0024_0120 node0120_0248

theorem node0024_0248_domain : ExactDomain node0024_0248 24 248 := by
  exact split_domain (by decide) (by decide) node0024_0120_domain node0120_0248_domain

def node0248_0312 : ℕ → Option IntervalDyadic := split 280 block0394 block0395

theorem node0248_0312_domain : ExactDomain node0248_0312 248 312 := by
  exact split_domain (by decide) (by decide) block0394_domain block0395_domain

def node0312_0376 : ℕ → Option IntervalDyadic := split 344 block0396 block0397

theorem node0312_0376_domain : ExactDomain node0312_0376 312 376 := by
  exact split_domain (by decide) (by decide) block0396_domain block0397_domain

def node0248_0376 : ℕ → Option IntervalDyadic := split 312 node0248_0312 node0312_0376

theorem node0248_0376_domain : ExactDomain node0248_0376 248 376 := by
  exact split_domain (by decide) (by decide) node0248_0312_domain node0312_0376_domain

def node0376_0440 : ℕ → Option IntervalDyadic := split 408 block0398 block0399

theorem node0376_0440_domain : ExactDomain node0376_0440 376 440 := by
  exact split_domain (by decide) (by decide) block0398_domain block0399_domain

def node0440_0477 : ℕ → Option IntervalDyadic := split 472 block0400 block0401

theorem node0440_0477_domain : ExactDomain node0440_0477 440 477 := by
  exact split_domain (by decide) (by decide) block0400_domain block0401_domain

def node0376_0477 : ℕ → Option IntervalDyadic := split 440 node0376_0440 node0440_0477

theorem node0376_0477_domain : ExactDomain node0376_0477 376 477 := by
  exact split_domain (by decide) (by decide) node0376_0440_domain node0440_0477_domain

def node0248_0477 : ℕ → Option IntervalDyadic := split 376 node0248_0376 node0376_0477

theorem node0248_0477_domain : ExactDomain node0248_0477 248 477 := by
  exact split_domain (by decide) (by decide) node0248_0376_domain node0376_0477_domain

def node0024_0477 : ℕ → Option IntervalDyadic := split 248 node0024_0248 node0248_0477

theorem node0024_0477_domain : ExactDomain node0024_0477 24 477 := by
  exact split_domain (by decide) (by decide) node0024_0248_domain node0248_0477_domain

def lookup : ℕ → Option IntervalDyadic := node0024_0477

theorem lookup_domain : ExactDomain lookup 24 477 :=
  node0024_0477_domain

theorem block0387_lookup (i : Fin 32) :
    lookup (24 + i.val) = some (values0387[i.val]'(by rw [values0387_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (24 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_left 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0024_0120, split_left 56 block0387 node0056_0120 (by omega)]
  exact block0387_get i

theorem block0388_lookup (i : Fin 32) :
    lookup (56 + i.val) = some (values0388[i.val]'(by rw [values0388_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (56 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_left 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0024_0120, split_right 56 block0387 node0056_0120 (by omega)]
  rw [node0056_0120, split_left 88 block0388 block0389 (by omega)]
  exact block0388_get i

theorem block0389_lookup (i : Fin 32) :
    lookup (88 + i.val) = some (values0389[i.val]'(by rw [values0389_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (88 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_left 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0024_0120, split_right 56 block0387 node0056_0120 (by omega)]
  rw [node0056_0120, split_right 88 block0388 block0389 (by omega)]
  exact block0389_get i

theorem block0390_lookup (i : Fin 32) :
    lookup (120 + i.val) = some (values0390[i.val]'(by rw [values0390_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (120 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_right 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0120_0248, split_left 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0120_0184, split_left 152 block0390 block0391 (by omega)]
  exact block0390_get i

theorem block0391_lookup (i : Fin 32) :
    lookup (152 + i.val) = some (values0391[i.val]'(by rw [values0391_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (152 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_right 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0120_0248, split_left 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0120_0184, split_right 152 block0390 block0391 (by omega)]
  exact block0391_get i

theorem block0392_lookup (i : Fin 32) :
    lookup (184 + i.val) = some (values0392[i.val]'(by rw [values0392_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (184 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_right 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0120_0248, split_right 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0184_0248, split_left 216 block0392 block0393 (by omega)]
  exact block0392_get i

theorem block0393_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values0393[i.val]'(by rw [values0393_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (216 + i.val) = _
  rw [node0024_0477, split_left 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0024_0248, split_right 120 node0024_0120 node0120_0248 (by omega)]
  rw [node0120_0248, split_right 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0184_0248, split_right 216 block0392 block0393 (by omega)]
  exact block0393_get i

theorem block0394_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values0394[i.val]'(by rw [values0394_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (248 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_left 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0248_0376, split_left 312 node0248_0312 node0312_0376 (by omega)]
  rw [node0248_0312, split_left 280 block0394 block0395 (by omega)]
  exact block0394_get i

theorem block0395_lookup (i : Fin 32) :
    lookup (280 + i.val) = some (values0395[i.val]'(by rw [values0395_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (280 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_left 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0248_0376, split_left 312 node0248_0312 node0312_0376 (by omega)]
  rw [node0248_0312, split_right 280 block0394 block0395 (by omega)]
  exact block0395_get i

theorem block0396_lookup (i : Fin 32) :
    lookup (312 + i.val) = some (values0396[i.val]'(by rw [values0396_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (312 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_left 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0248_0376, split_right 312 node0248_0312 node0312_0376 (by omega)]
  rw [node0312_0376, split_left 344 block0396 block0397 (by omega)]
  exact block0396_get i

theorem block0397_lookup (i : Fin 32) :
    lookup (344 + i.val) = some (values0397[i.val]'(by rw [values0397_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (344 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_left 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0248_0376, split_right 312 node0248_0312 node0312_0376 (by omega)]
  rw [node0312_0376, split_right 344 block0396 block0397 (by omega)]
  exact block0397_get i

theorem block0398_lookup (i : Fin 32) :
    lookup (376 + i.val) = some (values0398[i.val]'(by rw [values0398_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (376 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_right 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0376_0477, split_left 440 node0376_0440 node0440_0477 (by omega)]
  rw [node0376_0440, split_left 408 block0398 block0399 (by omega)]
  exact block0398_get i

theorem block0399_lookup (i : Fin 32) :
    lookup (408 + i.val) = some (values0399[i.val]'(by rw [values0399_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (408 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_right 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0376_0477, split_left 440 node0376_0440 node0440_0477 (by omega)]
  rw [node0376_0440, split_right 408 block0398 block0399 (by omega)]
  exact block0399_get i

theorem block0400_lookup (i : Fin 32) :
    lookup (440 + i.val) = some (values0400[i.val]'(by rw [values0400_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (440 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_right 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0376_0477, split_right 440 node0376_0440 node0440_0477 (by omega)]
  rw [node0440_0477, split_left 472 block0400 block0401 (by omega)]
  exact block0400_get i

theorem block0401_lookup (i : Fin 5) :
    lookup (472 + i.val) = some (values0401[i.val]'(by rw [values0401_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0024_0477 (472 + i.val) = _
  rw [node0024_0477, split_right 248 node0024_0248 node0248_0477 (by omega)]
  rw [node0248_0477, split_right 376 node0248_0376 node0376_0477 (by omega)]
  rw [node0376_0477, split_right 440 node0376_0440 node0440_0477 (by omega)]
  rw [node0440_0477, split_right 472 block0400 block0401 (by omega)]
  exact block0401_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0387_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0387_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0388_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0388_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0389_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0389_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0390_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0390_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0391_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0391_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0392_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0392_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0393_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0393_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0394_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0394_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0395_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0395_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0396_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0396_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0397_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0397_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0398_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0398_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0399_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0399_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0400_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0400_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0401_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0401_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0387_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0388_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0389_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0390_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0391_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0392_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0393_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0394_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0395_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0396_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0397_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0398_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0399_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0400_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow025.block0401_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow025
