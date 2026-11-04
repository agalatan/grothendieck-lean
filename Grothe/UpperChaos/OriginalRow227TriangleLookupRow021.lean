import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0327
import Grothe.UpperChaos.OriginalRow227TriangleData0328
import Grothe.UpperChaos.OriginalRow227TriangleData0329
import Grothe.UpperChaos.OriginalRow227TriangleData0330
import Grothe.UpperChaos.OriginalRow227TriangleData0331
import Grothe.UpperChaos.OriginalRow227TriangleData0332
import Grothe.UpperChaos.OriginalRow227TriangleData0333
import Grothe.UpperChaos.OriginalRow227TriangleData0334
import Grothe.UpperChaos.OriginalRow227TriangleData0335
import Grothe.UpperChaos.OriginalRow227TriangleData0336
import Grothe.UpperChaos.OriginalRow227TriangleData0337
import Grothe.UpperChaos.OriginalRow227TriangleData0338
import Grothe.UpperChaos.OriginalRow227TriangleData0339
import Grothe.UpperChaos.OriginalRow227TriangleData0340
import Grothe.UpperChaos.OriginalRow227TriangleData0341

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow021

open ConditionalTableLookup

def values0327 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0327.coefficient21_20,
  OriginalRow227TriangleData0327.coefficient21_21,
  OriginalRow227TriangleData0327.coefficient21_22,
  OriginalRow227TriangleData0327.coefficient21_23,
  OriginalRow227TriangleData0327.coefficient21_24,
  OriginalRow227TriangleData0327.coefficient21_25,
  OriginalRow227TriangleData0327.coefficient21_26,
  OriginalRow227TriangleData0327.coefficient21_27,
  OriginalRow227TriangleData0327.coefficient21_28,
  OriginalRow227TriangleData0327.coefficient21_29,
  OriginalRow227TriangleData0327.coefficient21_30,
  OriginalRow227TriangleData0327.coefficient21_31,
  OriginalRow227TriangleData0327.coefficient21_32,
  OriginalRow227TriangleData0327.coefficient21_33,
  OriginalRow227TriangleData0327.coefficient21_34,
  OriginalRow227TriangleData0327.coefficient21_35,
  OriginalRow227TriangleData0327.coefficient21_36,
  OriginalRow227TriangleData0327.coefficient21_37,
  OriginalRow227TriangleData0327.coefficient21_38,
  OriginalRow227TriangleData0327.coefficient21_39,
  OriginalRow227TriangleData0327.coefficient21_40,
  OriginalRow227TriangleData0327.coefficient21_41,
  OriginalRow227TriangleData0327.coefficient21_42,
  OriginalRow227TriangleData0327.coefficient21_43,
  OriginalRow227TriangleData0327.coefficient21_44,
  OriginalRow227TriangleData0327.coefficient21_45,
  OriginalRow227TriangleData0327.coefficient21_46,
  OriginalRow227TriangleData0327.coefficient21_47,
  OriginalRow227TriangleData0327.coefficient21_48,
  OriginalRow227TriangleData0327.coefficient21_49,
  OriginalRow227TriangleData0327.coefficient21_50,
  OriginalRow227TriangleData0327.coefficient21_51
]

theorem values0327_size : values0327.size = 32 := rfl

def block0327 : ℕ → Option IntervalDyadic := segment 20 values0327

theorem block0327_domain : ExactDomain block0327 20 52 := by
  simpa only [values0327_size] using segment_domain 20 values0327

theorem block0327_get (i : Fin 32) :
    block0327 (20 + i.val) = some (values0327[i.val]'(by rw [values0327_size]; exact i.isLt)) := by
  exact segment_get 20 values0327 ⟨i.val, by rw [values0327_size]; exact i.isLt⟩

def values0328 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0328.coefficient21_52,
  OriginalRow227TriangleData0328.coefficient21_53,
  OriginalRow227TriangleData0328.coefficient21_54,
  OriginalRow227TriangleData0328.coefficient21_55,
  OriginalRow227TriangleData0328.coefficient21_56,
  OriginalRow227TriangleData0328.coefficient21_57,
  OriginalRow227TriangleData0328.coefficient21_58,
  OriginalRow227TriangleData0328.coefficient21_59,
  OriginalRow227TriangleData0328.coefficient21_60,
  OriginalRow227TriangleData0328.coefficient21_61,
  OriginalRow227TriangleData0328.coefficient21_62,
  OriginalRow227TriangleData0328.coefficient21_63,
  OriginalRow227TriangleData0328.coefficient21_64,
  OriginalRow227TriangleData0328.coefficient21_65,
  OriginalRow227TriangleData0328.coefficient21_66,
  OriginalRow227TriangleData0328.coefficient21_67,
  OriginalRow227TriangleData0328.coefficient21_68,
  OriginalRow227TriangleData0328.coefficient21_69,
  OriginalRow227TriangleData0328.coefficient21_70,
  OriginalRow227TriangleData0328.coefficient21_71,
  OriginalRow227TriangleData0328.coefficient21_72,
  OriginalRow227TriangleData0328.coefficient21_73,
  OriginalRow227TriangleData0328.coefficient21_74,
  OriginalRow227TriangleData0328.coefficient21_75,
  OriginalRow227TriangleData0328.coefficient21_76,
  OriginalRow227TriangleData0328.coefficient21_77,
  OriginalRow227TriangleData0328.coefficient21_78,
  OriginalRow227TriangleData0328.coefficient21_79,
  OriginalRow227TriangleData0328.coefficient21_80,
  OriginalRow227TriangleData0328.coefficient21_81,
  OriginalRow227TriangleData0328.coefficient21_82,
  OriginalRow227TriangleData0328.coefficient21_83
]

theorem values0328_size : values0328.size = 32 := rfl

def block0328 : ℕ → Option IntervalDyadic := segment 52 values0328

theorem block0328_domain : ExactDomain block0328 52 84 := by
  simpa only [values0328_size] using segment_domain 52 values0328

theorem block0328_get (i : Fin 32) :
    block0328 (52 + i.val) = some (values0328[i.val]'(by rw [values0328_size]; exact i.isLt)) := by
  exact segment_get 52 values0328 ⟨i.val, by rw [values0328_size]; exact i.isLt⟩

def values0329 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0329.coefficient21_84,
  OriginalRow227TriangleData0329.coefficient21_85,
  OriginalRow227TriangleData0329.coefficient21_86,
  OriginalRow227TriangleData0329.coefficient21_87,
  OriginalRow227TriangleData0329.coefficient21_88,
  OriginalRow227TriangleData0329.coefficient21_89,
  OriginalRow227TriangleData0329.coefficient21_90,
  OriginalRow227TriangleData0329.coefficient21_91,
  OriginalRow227TriangleData0329.coefficient21_92,
  OriginalRow227TriangleData0329.coefficient21_93,
  OriginalRow227TriangleData0329.coefficient21_94,
  OriginalRow227TriangleData0329.coefficient21_95,
  OriginalRow227TriangleData0329.coefficient21_96,
  OriginalRow227TriangleData0329.coefficient21_97,
  OriginalRow227TriangleData0329.coefficient21_98,
  OriginalRow227TriangleData0329.coefficient21_99,
  OriginalRow227TriangleData0329.coefficient21_100,
  OriginalRow227TriangleData0329.coefficient21_101,
  OriginalRow227TriangleData0329.coefficient21_102,
  OriginalRow227TriangleData0329.coefficient21_103,
  OriginalRow227TriangleData0329.coefficient21_104,
  OriginalRow227TriangleData0329.coefficient21_105,
  OriginalRow227TriangleData0329.coefficient21_106,
  OriginalRow227TriangleData0329.coefficient21_107,
  OriginalRow227TriangleData0329.coefficient21_108,
  OriginalRow227TriangleData0329.coefficient21_109,
  OriginalRow227TriangleData0329.coefficient21_110,
  OriginalRow227TriangleData0329.coefficient21_111,
  OriginalRow227TriangleData0329.coefficient21_112,
  OriginalRow227TriangleData0329.coefficient21_113,
  OriginalRow227TriangleData0329.coefficient21_114,
  OriginalRow227TriangleData0329.coefficient21_115
]

theorem values0329_size : values0329.size = 32 := rfl

def block0329 : ℕ → Option IntervalDyadic := segment 84 values0329

theorem block0329_domain : ExactDomain block0329 84 116 := by
  simpa only [values0329_size] using segment_domain 84 values0329

theorem block0329_get (i : Fin 32) :
    block0329 (84 + i.val) = some (values0329[i.val]'(by rw [values0329_size]; exact i.isLt)) := by
  exact segment_get 84 values0329 ⟨i.val, by rw [values0329_size]; exact i.isLt⟩

def values0330 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0330.coefficient21_116,
  OriginalRow227TriangleData0330.coefficient21_117,
  OriginalRow227TriangleData0330.coefficient21_118,
  OriginalRow227TriangleData0330.coefficient21_119,
  OriginalRow227TriangleData0330.coefficient21_120,
  OriginalRow227TriangleData0330.coefficient21_121,
  OriginalRow227TriangleData0330.coefficient21_122,
  OriginalRow227TriangleData0330.coefficient21_123,
  OriginalRow227TriangleData0330.coefficient21_124,
  OriginalRow227TriangleData0330.coefficient21_125,
  OriginalRow227TriangleData0330.coefficient21_126,
  OriginalRow227TriangleData0330.coefficient21_127,
  OriginalRow227TriangleData0330.coefficient21_128,
  OriginalRow227TriangleData0330.coefficient21_129,
  OriginalRow227TriangleData0330.coefficient21_130,
  OriginalRow227TriangleData0330.coefficient21_131,
  OriginalRow227TriangleData0330.coefficient21_132,
  OriginalRow227TriangleData0330.coefficient21_133,
  OriginalRow227TriangleData0330.coefficient21_134,
  OriginalRow227TriangleData0330.coefficient21_135,
  OriginalRow227TriangleData0330.coefficient21_136,
  OriginalRow227TriangleData0330.coefficient21_137,
  OriginalRow227TriangleData0330.coefficient21_138,
  OriginalRow227TriangleData0330.coefficient21_139,
  OriginalRow227TriangleData0330.coefficient21_140,
  OriginalRow227TriangleData0330.coefficient21_141,
  OriginalRow227TriangleData0330.coefficient21_142,
  OriginalRow227TriangleData0330.coefficient21_143,
  OriginalRow227TriangleData0330.coefficient21_144,
  OriginalRow227TriangleData0330.coefficient21_145,
  OriginalRow227TriangleData0330.coefficient21_146,
  OriginalRow227TriangleData0330.coefficient21_147
]

theorem values0330_size : values0330.size = 32 := rfl

def block0330 : ℕ → Option IntervalDyadic := segment 116 values0330

theorem block0330_domain : ExactDomain block0330 116 148 := by
  simpa only [values0330_size] using segment_domain 116 values0330

theorem block0330_get (i : Fin 32) :
    block0330 (116 + i.val) = some (values0330[i.val]'(by rw [values0330_size]; exact i.isLt)) := by
  exact segment_get 116 values0330 ⟨i.val, by rw [values0330_size]; exact i.isLt⟩

def values0331 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0331.coefficient21_148,
  OriginalRow227TriangleData0331.coefficient21_149,
  OriginalRow227TriangleData0331.coefficient21_150,
  OriginalRow227TriangleData0331.coefficient21_151,
  OriginalRow227TriangleData0331.coefficient21_152,
  OriginalRow227TriangleData0331.coefficient21_153,
  OriginalRow227TriangleData0331.coefficient21_154,
  OriginalRow227TriangleData0331.coefficient21_155,
  OriginalRow227TriangleData0331.coefficient21_156,
  OriginalRow227TriangleData0331.coefficient21_157,
  OriginalRow227TriangleData0331.coefficient21_158,
  OriginalRow227TriangleData0331.coefficient21_159,
  OriginalRow227TriangleData0331.coefficient21_160,
  OriginalRow227TriangleData0331.coefficient21_161,
  OriginalRow227TriangleData0331.coefficient21_162,
  OriginalRow227TriangleData0331.coefficient21_163,
  OriginalRow227TriangleData0331.coefficient21_164,
  OriginalRow227TriangleData0331.coefficient21_165,
  OriginalRow227TriangleData0331.coefficient21_166,
  OriginalRow227TriangleData0331.coefficient21_167,
  OriginalRow227TriangleData0331.coefficient21_168,
  OriginalRow227TriangleData0331.coefficient21_169,
  OriginalRow227TriangleData0331.coefficient21_170,
  OriginalRow227TriangleData0331.coefficient21_171,
  OriginalRow227TriangleData0331.coefficient21_172,
  OriginalRow227TriangleData0331.coefficient21_173,
  OriginalRow227TriangleData0331.coefficient21_174,
  OriginalRow227TriangleData0331.coefficient21_175,
  OriginalRow227TriangleData0331.coefficient21_176,
  OriginalRow227TriangleData0331.coefficient21_177,
  OriginalRow227TriangleData0331.coefficient21_178,
  OriginalRow227TriangleData0331.coefficient21_179
]

theorem values0331_size : values0331.size = 32 := rfl

def block0331 : ℕ → Option IntervalDyadic := segment 148 values0331

theorem block0331_domain : ExactDomain block0331 148 180 := by
  simpa only [values0331_size] using segment_domain 148 values0331

theorem block0331_get (i : Fin 32) :
    block0331 (148 + i.val) = some (values0331[i.val]'(by rw [values0331_size]; exact i.isLt)) := by
  exact segment_get 148 values0331 ⟨i.val, by rw [values0331_size]; exact i.isLt⟩

def values0332 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0332.coefficient21_180,
  OriginalRow227TriangleData0332.coefficient21_181,
  OriginalRow227TriangleData0332.coefficient21_182,
  OriginalRow227TriangleData0332.coefficient21_183,
  OriginalRow227TriangleData0332.coefficient21_184,
  OriginalRow227TriangleData0332.coefficient21_185,
  OriginalRow227TriangleData0332.coefficient21_186,
  OriginalRow227TriangleData0332.coefficient21_187,
  OriginalRow227TriangleData0332.coefficient21_188,
  OriginalRow227TriangleData0332.coefficient21_189,
  OriginalRow227TriangleData0332.coefficient21_190,
  OriginalRow227TriangleData0332.coefficient21_191,
  OriginalRow227TriangleData0332.coefficient21_192,
  OriginalRow227TriangleData0332.coefficient21_193,
  OriginalRow227TriangleData0332.coefficient21_194,
  OriginalRow227TriangleData0332.coefficient21_195,
  OriginalRow227TriangleData0332.coefficient21_196,
  OriginalRow227TriangleData0332.coefficient21_197,
  OriginalRow227TriangleData0332.coefficient21_198,
  OriginalRow227TriangleData0332.coefficient21_199,
  OriginalRow227TriangleData0332.coefficient21_200,
  OriginalRow227TriangleData0332.coefficient21_201,
  OriginalRow227TriangleData0332.coefficient21_202,
  OriginalRow227TriangleData0332.coefficient21_203,
  OriginalRow227TriangleData0332.coefficient21_204,
  OriginalRow227TriangleData0332.coefficient21_205,
  OriginalRow227TriangleData0332.coefficient21_206,
  OriginalRow227TriangleData0332.coefficient21_207,
  OriginalRow227TriangleData0332.coefficient21_208,
  OriginalRow227TriangleData0332.coefficient21_209,
  OriginalRow227TriangleData0332.coefficient21_210,
  OriginalRow227TriangleData0332.coefficient21_211
]

theorem values0332_size : values0332.size = 32 := rfl

def block0332 : ℕ → Option IntervalDyadic := segment 180 values0332

theorem block0332_domain : ExactDomain block0332 180 212 := by
  simpa only [values0332_size] using segment_domain 180 values0332

theorem block0332_get (i : Fin 32) :
    block0332 (180 + i.val) = some (values0332[i.val]'(by rw [values0332_size]; exact i.isLt)) := by
  exact segment_get 180 values0332 ⟨i.val, by rw [values0332_size]; exact i.isLt⟩

def values0333 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0333.coefficient21_212,
  OriginalRow227TriangleData0333.coefficient21_213,
  OriginalRow227TriangleData0333.coefficient21_214,
  OriginalRow227TriangleData0333.coefficient21_215,
  OriginalRow227TriangleData0333.coefficient21_216,
  OriginalRow227TriangleData0333.coefficient21_217,
  OriginalRow227TriangleData0333.coefficient21_218,
  OriginalRow227TriangleData0333.coefficient21_219,
  OriginalRow227TriangleData0333.coefficient21_220,
  OriginalRow227TriangleData0333.coefficient21_221,
  OriginalRow227TriangleData0333.coefficient21_222,
  OriginalRow227TriangleData0333.coefficient21_223,
  OriginalRow227TriangleData0333.coefficient21_224,
  OriginalRow227TriangleData0333.coefficient21_225,
  OriginalRow227TriangleData0333.coefficient21_226,
  OriginalRow227TriangleData0333.coefficient21_227,
  OriginalRow227TriangleData0333.coefficient21_228,
  OriginalRow227TriangleData0333.coefficient21_229,
  OriginalRow227TriangleData0333.coefficient21_230,
  OriginalRow227TriangleData0333.coefficient21_231,
  OriginalRow227TriangleData0333.coefficient21_232,
  OriginalRow227TriangleData0333.coefficient21_233,
  OriginalRow227TriangleData0333.coefficient21_234,
  OriginalRow227TriangleData0333.coefficient21_235,
  OriginalRow227TriangleData0333.coefficient21_236,
  OriginalRow227TriangleData0333.coefficient21_237,
  OriginalRow227TriangleData0333.coefficient21_238,
  OriginalRow227TriangleData0333.coefficient21_239,
  OriginalRow227TriangleData0333.coefficient21_240,
  OriginalRow227TriangleData0333.coefficient21_241,
  OriginalRow227TriangleData0333.coefficient21_242,
  OriginalRow227TriangleData0333.coefficient21_243
]

theorem values0333_size : values0333.size = 32 := rfl

def block0333 : ℕ → Option IntervalDyadic := segment 212 values0333

theorem block0333_domain : ExactDomain block0333 212 244 := by
  simpa only [values0333_size] using segment_domain 212 values0333

theorem block0333_get (i : Fin 32) :
    block0333 (212 + i.val) = some (values0333[i.val]'(by rw [values0333_size]; exact i.isLt)) := by
  exact segment_get 212 values0333 ⟨i.val, by rw [values0333_size]; exact i.isLt⟩

def values0334 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0334.coefficient21_244,
  OriginalRow227TriangleData0334.coefficient21_245,
  OriginalRow227TriangleData0334.coefficient21_246,
  OriginalRow227TriangleData0334.coefficient21_247,
  OriginalRow227TriangleData0334.coefficient21_248,
  OriginalRow227TriangleData0334.coefficient21_249,
  OriginalRow227TriangleData0334.coefficient21_250,
  OriginalRow227TriangleData0334.coefficient21_251,
  OriginalRow227TriangleData0334.coefficient21_252,
  OriginalRow227TriangleData0334.coefficient21_253,
  OriginalRow227TriangleData0334.coefficient21_254,
  OriginalRow227TriangleData0334.coefficient21_255,
  OriginalRow227TriangleData0334.coefficient21_256,
  OriginalRow227TriangleData0334.coefficient21_257,
  OriginalRow227TriangleData0334.coefficient21_258,
  OriginalRow227TriangleData0334.coefficient21_259,
  OriginalRow227TriangleData0334.coefficient21_260,
  OriginalRow227TriangleData0334.coefficient21_261,
  OriginalRow227TriangleData0334.coefficient21_262,
  OriginalRow227TriangleData0334.coefficient21_263,
  OriginalRow227TriangleData0334.coefficient21_264,
  OriginalRow227TriangleData0334.coefficient21_265,
  OriginalRow227TriangleData0334.coefficient21_266,
  OriginalRow227TriangleData0334.coefficient21_267,
  OriginalRow227TriangleData0334.coefficient21_268,
  OriginalRow227TriangleData0334.coefficient21_269,
  OriginalRow227TriangleData0334.coefficient21_270,
  OriginalRow227TriangleData0334.coefficient21_271,
  OriginalRow227TriangleData0334.coefficient21_272,
  OriginalRow227TriangleData0334.coefficient21_273,
  OriginalRow227TriangleData0334.coefficient21_274,
  OriginalRow227TriangleData0334.coefficient21_275
]

theorem values0334_size : values0334.size = 32 := rfl

def block0334 : ℕ → Option IntervalDyadic := segment 244 values0334

theorem block0334_domain : ExactDomain block0334 244 276 := by
  simpa only [values0334_size] using segment_domain 244 values0334

theorem block0334_get (i : Fin 32) :
    block0334 (244 + i.val) = some (values0334[i.val]'(by rw [values0334_size]; exact i.isLt)) := by
  exact segment_get 244 values0334 ⟨i.val, by rw [values0334_size]; exact i.isLt⟩

def values0335 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0335.coefficient21_276,
  OriginalRow227TriangleData0335.coefficient21_277,
  OriginalRow227TriangleData0335.coefficient21_278,
  OriginalRow227TriangleData0335.coefficient21_279,
  OriginalRow227TriangleData0335.coefficient21_280,
  OriginalRow227TriangleData0335.coefficient21_281,
  OriginalRow227TriangleData0335.coefficient21_282,
  OriginalRow227TriangleData0335.coefficient21_283,
  OriginalRow227TriangleData0335.coefficient21_284,
  OriginalRow227TriangleData0335.coefficient21_285,
  OriginalRow227TriangleData0335.coefficient21_286,
  OriginalRow227TriangleData0335.coefficient21_287,
  OriginalRow227TriangleData0335.coefficient21_288,
  OriginalRow227TriangleData0335.coefficient21_289,
  OriginalRow227TriangleData0335.coefficient21_290,
  OriginalRow227TriangleData0335.coefficient21_291,
  OriginalRow227TriangleData0335.coefficient21_292,
  OriginalRow227TriangleData0335.coefficient21_293,
  OriginalRow227TriangleData0335.coefficient21_294,
  OriginalRow227TriangleData0335.coefficient21_295,
  OriginalRow227TriangleData0335.coefficient21_296,
  OriginalRow227TriangleData0335.coefficient21_297,
  OriginalRow227TriangleData0335.coefficient21_298,
  OriginalRow227TriangleData0335.coefficient21_299,
  OriginalRow227TriangleData0335.coefficient21_300,
  OriginalRow227TriangleData0335.coefficient21_301,
  OriginalRow227TriangleData0335.coefficient21_302,
  OriginalRow227TriangleData0335.coefficient21_303,
  OriginalRow227TriangleData0335.coefficient21_304,
  OriginalRow227TriangleData0335.coefficient21_305,
  OriginalRow227TriangleData0335.coefficient21_306,
  OriginalRow227TriangleData0335.coefficient21_307
]

theorem values0335_size : values0335.size = 32 := rfl

def block0335 : ℕ → Option IntervalDyadic := segment 276 values0335

theorem block0335_domain : ExactDomain block0335 276 308 := by
  simpa only [values0335_size] using segment_domain 276 values0335

theorem block0335_get (i : Fin 32) :
    block0335 (276 + i.val) = some (values0335[i.val]'(by rw [values0335_size]; exact i.isLt)) := by
  exact segment_get 276 values0335 ⟨i.val, by rw [values0335_size]; exact i.isLt⟩

def values0336 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0336.coefficient21_308,
  OriginalRow227TriangleData0336.coefficient21_309,
  OriginalRow227TriangleData0336.coefficient21_310,
  OriginalRow227TriangleData0336.coefficient21_311,
  OriginalRow227TriangleData0336.coefficient21_312,
  OriginalRow227TriangleData0336.coefficient21_313,
  OriginalRow227TriangleData0336.coefficient21_314,
  OriginalRow227TriangleData0336.coefficient21_315,
  OriginalRow227TriangleData0336.coefficient21_316,
  OriginalRow227TriangleData0336.coefficient21_317,
  OriginalRow227TriangleData0336.coefficient21_318,
  OriginalRow227TriangleData0336.coefficient21_319,
  OriginalRow227TriangleData0336.coefficient21_320,
  OriginalRow227TriangleData0336.coefficient21_321,
  OriginalRow227TriangleData0336.coefficient21_322,
  OriginalRow227TriangleData0336.coefficient21_323,
  OriginalRow227TriangleData0336.coefficient21_324,
  OriginalRow227TriangleData0336.coefficient21_325,
  OriginalRow227TriangleData0336.coefficient21_326,
  OriginalRow227TriangleData0336.coefficient21_327,
  OriginalRow227TriangleData0336.coefficient21_328,
  OriginalRow227TriangleData0336.coefficient21_329,
  OriginalRow227TriangleData0336.coefficient21_330,
  OriginalRow227TriangleData0336.coefficient21_331,
  OriginalRow227TriangleData0336.coefficient21_332,
  OriginalRow227TriangleData0336.coefficient21_333,
  OriginalRow227TriangleData0336.coefficient21_334,
  OriginalRow227TriangleData0336.coefficient21_335,
  OriginalRow227TriangleData0336.coefficient21_336,
  OriginalRow227TriangleData0336.coefficient21_337,
  OriginalRow227TriangleData0336.coefficient21_338,
  OriginalRow227TriangleData0336.coefficient21_339
]

theorem values0336_size : values0336.size = 32 := rfl

def block0336 : ℕ → Option IntervalDyadic := segment 308 values0336

theorem block0336_domain : ExactDomain block0336 308 340 := by
  simpa only [values0336_size] using segment_domain 308 values0336

theorem block0336_get (i : Fin 32) :
    block0336 (308 + i.val) = some (values0336[i.val]'(by rw [values0336_size]; exact i.isLt)) := by
  exact segment_get 308 values0336 ⟨i.val, by rw [values0336_size]; exact i.isLt⟩

def values0337 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0337.coefficient21_340,
  OriginalRow227TriangleData0337.coefficient21_341,
  OriginalRow227TriangleData0337.coefficient21_342,
  OriginalRow227TriangleData0337.coefficient21_343,
  OriginalRow227TriangleData0337.coefficient21_344,
  OriginalRow227TriangleData0337.coefficient21_345,
  OriginalRow227TriangleData0337.coefficient21_346,
  OriginalRow227TriangleData0337.coefficient21_347,
  OriginalRow227TriangleData0337.coefficient21_348,
  OriginalRow227TriangleData0337.coefficient21_349,
  OriginalRow227TriangleData0337.coefficient21_350,
  OriginalRow227TriangleData0337.coefficient21_351,
  OriginalRow227TriangleData0337.coefficient21_352,
  OriginalRow227TriangleData0337.coefficient21_353,
  OriginalRow227TriangleData0337.coefficient21_354,
  OriginalRow227TriangleData0337.coefficient21_355,
  OriginalRow227TriangleData0337.coefficient21_356,
  OriginalRow227TriangleData0337.coefficient21_357,
  OriginalRow227TriangleData0337.coefficient21_358,
  OriginalRow227TriangleData0337.coefficient21_359,
  OriginalRow227TriangleData0337.coefficient21_360,
  OriginalRow227TriangleData0337.coefficient21_361,
  OriginalRow227TriangleData0337.coefficient21_362,
  OriginalRow227TriangleData0337.coefficient21_363,
  OriginalRow227TriangleData0337.coefficient21_364,
  OriginalRow227TriangleData0337.coefficient21_365,
  OriginalRow227TriangleData0337.coefficient21_366,
  OriginalRow227TriangleData0337.coefficient21_367,
  OriginalRow227TriangleData0337.coefficient21_368,
  OriginalRow227TriangleData0337.coefficient21_369,
  OriginalRow227TriangleData0337.coefficient21_370,
  OriginalRow227TriangleData0337.coefficient21_371
]

theorem values0337_size : values0337.size = 32 := rfl

def block0337 : ℕ → Option IntervalDyadic := segment 340 values0337

theorem block0337_domain : ExactDomain block0337 340 372 := by
  simpa only [values0337_size] using segment_domain 340 values0337

theorem block0337_get (i : Fin 32) :
    block0337 (340 + i.val) = some (values0337[i.val]'(by rw [values0337_size]; exact i.isLt)) := by
  exact segment_get 340 values0337 ⟨i.val, by rw [values0337_size]; exact i.isLt⟩

def values0338 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0338.coefficient21_372,
  OriginalRow227TriangleData0338.coefficient21_373,
  OriginalRow227TriangleData0338.coefficient21_374,
  OriginalRow227TriangleData0338.coefficient21_375,
  OriginalRow227TriangleData0338.coefficient21_376,
  OriginalRow227TriangleData0338.coefficient21_377,
  OriginalRow227TriangleData0338.coefficient21_378,
  OriginalRow227TriangleData0338.coefficient21_379,
  OriginalRow227TriangleData0338.coefficient21_380,
  OriginalRow227TriangleData0338.coefficient21_381,
  OriginalRow227TriangleData0338.coefficient21_382,
  OriginalRow227TriangleData0338.coefficient21_383,
  OriginalRow227TriangleData0338.coefficient21_384,
  OriginalRow227TriangleData0338.coefficient21_385,
  OriginalRow227TriangleData0338.coefficient21_386,
  OriginalRow227TriangleData0338.coefficient21_387,
  OriginalRow227TriangleData0338.coefficient21_388,
  OriginalRow227TriangleData0338.coefficient21_389,
  OriginalRow227TriangleData0338.coefficient21_390,
  OriginalRow227TriangleData0338.coefficient21_391,
  OriginalRow227TriangleData0338.coefficient21_392,
  OriginalRow227TriangleData0338.coefficient21_393,
  OriginalRow227TriangleData0338.coefficient21_394,
  OriginalRow227TriangleData0338.coefficient21_395,
  OriginalRow227TriangleData0338.coefficient21_396,
  OriginalRow227TriangleData0338.coefficient21_397,
  OriginalRow227TriangleData0338.coefficient21_398,
  OriginalRow227TriangleData0338.coefficient21_399,
  OriginalRow227TriangleData0338.coefficient21_400,
  OriginalRow227TriangleData0338.coefficient21_401,
  OriginalRow227TriangleData0338.coefficient21_402,
  OriginalRow227TriangleData0338.coefficient21_403
]

theorem values0338_size : values0338.size = 32 := rfl

def block0338 : ℕ → Option IntervalDyadic := segment 372 values0338

theorem block0338_domain : ExactDomain block0338 372 404 := by
  simpa only [values0338_size] using segment_domain 372 values0338

theorem block0338_get (i : Fin 32) :
    block0338 (372 + i.val) = some (values0338[i.val]'(by rw [values0338_size]; exact i.isLt)) := by
  exact segment_get 372 values0338 ⟨i.val, by rw [values0338_size]; exact i.isLt⟩

def values0339 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0339.coefficient21_404,
  OriginalRow227TriangleData0339.coefficient21_405,
  OriginalRow227TriangleData0339.coefficient21_406,
  OriginalRow227TriangleData0339.coefficient21_407,
  OriginalRow227TriangleData0339.coefficient21_408,
  OriginalRow227TriangleData0339.coefficient21_409,
  OriginalRow227TriangleData0339.coefficient21_410,
  OriginalRow227TriangleData0339.coefficient21_411,
  OriginalRow227TriangleData0339.coefficient21_412,
  OriginalRow227TriangleData0339.coefficient21_413,
  OriginalRow227TriangleData0339.coefficient21_414,
  OriginalRow227TriangleData0339.coefficient21_415,
  OriginalRow227TriangleData0339.coefficient21_416,
  OriginalRow227TriangleData0339.coefficient21_417,
  OriginalRow227TriangleData0339.coefficient21_418,
  OriginalRow227TriangleData0339.coefficient21_419,
  OriginalRow227TriangleData0339.coefficient21_420,
  OriginalRow227TriangleData0339.coefficient21_421,
  OriginalRow227TriangleData0339.coefficient21_422,
  OriginalRow227TriangleData0339.coefficient21_423,
  OriginalRow227TriangleData0339.coefficient21_424,
  OriginalRow227TriangleData0339.coefficient21_425,
  OriginalRow227TriangleData0339.coefficient21_426,
  OriginalRow227TriangleData0339.coefficient21_427,
  OriginalRow227TriangleData0339.coefficient21_428,
  OriginalRow227TriangleData0339.coefficient21_429,
  OriginalRow227TriangleData0339.coefficient21_430,
  OriginalRow227TriangleData0339.coefficient21_431,
  OriginalRow227TriangleData0339.coefficient21_432,
  OriginalRow227TriangleData0339.coefficient21_433,
  OriginalRow227TriangleData0339.coefficient21_434,
  OriginalRow227TriangleData0339.coefficient21_435
]

theorem values0339_size : values0339.size = 32 := rfl

def block0339 : ℕ → Option IntervalDyadic := segment 404 values0339

theorem block0339_domain : ExactDomain block0339 404 436 := by
  simpa only [values0339_size] using segment_domain 404 values0339

theorem block0339_get (i : Fin 32) :
    block0339 (404 + i.val) = some (values0339[i.val]'(by rw [values0339_size]; exact i.isLt)) := by
  exact segment_get 404 values0339 ⟨i.val, by rw [values0339_size]; exact i.isLt⟩

def values0340 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0340.coefficient21_436,
  OriginalRow227TriangleData0340.coefficient21_437,
  OriginalRow227TriangleData0340.coefficient21_438,
  OriginalRow227TriangleData0340.coefficient21_439,
  OriginalRow227TriangleData0340.coefficient21_440,
  OriginalRow227TriangleData0340.coefficient21_441,
  OriginalRow227TriangleData0340.coefficient21_442,
  OriginalRow227TriangleData0340.coefficient21_443,
  OriginalRow227TriangleData0340.coefficient21_444,
  OriginalRow227TriangleData0340.coefficient21_445,
  OriginalRow227TriangleData0340.coefficient21_446,
  OriginalRow227TriangleData0340.coefficient21_447,
  OriginalRow227TriangleData0340.coefficient21_448,
  OriginalRow227TriangleData0340.coefficient21_449,
  OriginalRow227TriangleData0340.coefficient21_450,
  OriginalRow227TriangleData0340.coefficient21_451,
  OriginalRow227TriangleData0340.coefficient21_452,
  OriginalRow227TriangleData0340.coefficient21_453,
  OriginalRow227TriangleData0340.coefficient21_454,
  OriginalRow227TriangleData0340.coefficient21_455,
  OriginalRow227TriangleData0340.coefficient21_456,
  OriginalRow227TriangleData0340.coefficient21_457,
  OriginalRow227TriangleData0340.coefficient21_458,
  OriginalRow227TriangleData0340.coefficient21_459,
  OriginalRow227TriangleData0340.coefficient21_460,
  OriginalRow227TriangleData0340.coefficient21_461,
  OriginalRow227TriangleData0340.coefficient21_462,
  OriginalRow227TriangleData0340.coefficient21_463,
  OriginalRow227TriangleData0340.coefficient21_464,
  OriginalRow227TriangleData0340.coefficient21_465,
  OriginalRow227TriangleData0340.coefficient21_466,
  OriginalRow227TriangleData0340.coefficient21_467
]

theorem values0340_size : values0340.size = 32 := rfl

def block0340 : ℕ → Option IntervalDyadic := segment 436 values0340

theorem block0340_domain : ExactDomain block0340 436 468 := by
  simpa only [values0340_size] using segment_domain 436 values0340

theorem block0340_get (i : Fin 32) :
    block0340 (436 + i.val) = some (values0340[i.val]'(by rw [values0340_size]; exact i.isLt)) := by
  exact segment_get 436 values0340 ⟨i.val, by rw [values0340_size]; exact i.isLt⟩

def values0341 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0341.coefficient21_468,
  OriginalRow227TriangleData0341.coefficient21_469,
  OriginalRow227TriangleData0341.coefficient21_470,
  OriginalRow227TriangleData0341.coefficient21_471,
  OriginalRow227TriangleData0341.coefficient21_472,
  OriginalRow227TriangleData0341.coefficient21_473,
  OriginalRow227TriangleData0341.coefficient21_474,
  OriginalRow227TriangleData0341.coefficient21_475,
  OriginalRow227TriangleData0341.coefficient21_476,
  OriginalRow227TriangleData0341.coefficient21_477,
  OriginalRow227TriangleData0341.coefficient21_478,
  OriginalRow227TriangleData0341.coefficient21_479,
  OriginalRow227TriangleData0341.coefficient21_480
]

theorem values0341_size : values0341.size = 13 := rfl

def block0341 : ℕ → Option IntervalDyadic := segment 468 values0341

theorem block0341_domain : ExactDomain block0341 468 481 := by
  simpa only [values0341_size] using segment_domain 468 values0341

theorem block0341_get (i : Fin 13) :
    block0341 (468 + i.val) = some (values0341[i.val]'(by rw [values0341_size]; exact i.isLt)) := by
  exact segment_get 468 values0341 ⟨i.val, by rw [values0341_size]; exact i.isLt⟩

def node0052_0116 : ℕ → Option IntervalDyadic := split 84 block0328 block0329

theorem node0052_0116_domain : ExactDomain node0052_0116 52 116 := by
  exact split_domain (by decide) (by decide) block0328_domain block0329_domain

def node0020_0116 : ℕ → Option IntervalDyadic := split 52 block0327 node0052_0116

theorem node0020_0116_domain : ExactDomain node0020_0116 20 116 := by
  exact split_domain (by decide) (by decide) block0327_domain node0052_0116_domain

def node0116_0180 : ℕ → Option IntervalDyadic := split 148 block0330 block0331

theorem node0116_0180_domain : ExactDomain node0116_0180 116 180 := by
  exact split_domain (by decide) (by decide) block0330_domain block0331_domain

def node0180_0244 : ℕ → Option IntervalDyadic := split 212 block0332 block0333

theorem node0180_0244_domain : ExactDomain node0180_0244 180 244 := by
  exact split_domain (by decide) (by decide) block0332_domain block0333_domain

def node0116_0244 : ℕ → Option IntervalDyadic := split 180 node0116_0180 node0180_0244

theorem node0116_0244_domain : ExactDomain node0116_0244 116 244 := by
  exact split_domain (by decide) (by decide) node0116_0180_domain node0180_0244_domain

def node0020_0244 : ℕ → Option IntervalDyadic := split 116 node0020_0116 node0116_0244

theorem node0020_0244_domain : ExactDomain node0020_0244 20 244 := by
  exact split_domain (by decide) (by decide) node0020_0116_domain node0116_0244_domain

def node0244_0308 : ℕ → Option IntervalDyadic := split 276 block0334 block0335

theorem node0244_0308_domain : ExactDomain node0244_0308 244 308 := by
  exact split_domain (by decide) (by decide) block0334_domain block0335_domain

def node0308_0372 : ℕ → Option IntervalDyadic := split 340 block0336 block0337

theorem node0308_0372_domain : ExactDomain node0308_0372 308 372 := by
  exact split_domain (by decide) (by decide) block0336_domain block0337_domain

def node0244_0372 : ℕ → Option IntervalDyadic := split 308 node0244_0308 node0308_0372

theorem node0244_0372_domain : ExactDomain node0244_0372 244 372 := by
  exact split_domain (by decide) (by decide) node0244_0308_domain node0308_0372_domain

def node0372_0436 : ℕ → Option IntervalDyadic := split 404 block0338 block0339

theorem node0372_0436_domain : ExactDomain node0372_0436 372 436 := by
  exact split_domain (by decide) (by decide) block0338_domain block0339_domain

def node0436_0481 : ℕ → Option IntervalDyadic := split 468 block0340 block0341

theorem node0436_0481_domain : ExactDomain node0436_0481 436 481 := by
  exact split_domain (by decide) (by decide) block0340_domain block0341_domain

def node0372_0481 : ℕ → Option IntervalDyadic := split 436 node0372_0436 node0436_0481

theorem node0372_0481_domain : ExactDomain node0372_0481 372 481 := by
  exact split_domain (by decide) (by decide) node0372_0436_domain node0436_0481_domain

def node0244_0481 : ℕ → Option IntervalDyadic := split 372 node0244_0372 node0372_0481

theorem node0244_0481_domain : ExactDomain node0244_0481 244 481 := by
  exact split_domain (by decide) (by decide) node0244_0372_domain node0372_0481_domain

def node0020_0481 : ℕ → Option IntervalDyadic := split 244 node0020_0244 node0244_0481

theorem node0020_0481_domain : ExactDomain node0020_0481 20 481 := by
  exact split_domain (by decide) (by decide) node0020_0244_domain node0244_0481_domain

def lookup : ℕ → Option IntervalDyadic := node0020_0481

theorem lookup_domain : ExactDomain lookup 20 481 :=
  node0020_0481_domain

theorem block0327_lookup (i : Fin 32) :
    lookup (20 + i.val) = some (values0327[i.val]'(by rw [values0327_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (20 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_left 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0020_0116, split_left 52 block0327 node0052_0116 (by omega)]
  exact block0327_get i

theorem block0328_lookup (i : Fin 32) :
    lookup (52 + i.val) = some (values0328[i.val]'(by rw [values0328_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (52 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_left 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0020_0116, split_right 52 block0327 node0052_0116 (by omega)]
  rw [node0052_0116, split_left 84 block0328 block0329 (by omega)]
  exact block0328_get i

theorem block0329_lookup (i : Fin 32) :
    lookup (84 + i.val) = some (values0329[i.val]'(by rw [values0329_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (84 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_left 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0020_0116, split_right 52 block0327 node0052_0116 (by omega)]
  rw [node0052_0116, split_right 84 block0328 block0329 (by omega)]
  exact block0329_get i

theorem block0330_lookup (i : Fin 32) :
    lookup (116 + i.val) = some (values0330[i.val]'(by rw [values0330_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (116 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_right 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0116_0244, split_left 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0116_0180, split_left 148 block0330 block0331 (by omega)]
  exact block0330_get i

theorem block0331_lookup (i : Fin 32) :
    lookup (148 + i.val) = some (values0331[i.val]'(by rw [values0331_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (148 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_right 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0116_0244, split_left 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0116_0180, split_right 148 block0330 block0331 (by omega)]
  exact block0331_get i

theorem block0332_lookup (i : Fin 32) :
    lookup (180 + i.val) = some (values0332[i.val]'(by rw [values0332_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (180 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_right 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0116_0244, split_right 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0180_0244, split_left 212 block0332 block0333 (by omega)]
  exact block0332_get i

theorem block0333_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values0333[i.val]'(by rw [values0333_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (212 + i.val) = _
  rw [node0020_0481, split_left 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0020_0244, split_right 116 node0020_0116 node0116_0244 (by omega)]
  rw [node0116_0244, split_right 180 node0116_0180 node0180_0244 (by omega)]
  rw [node0180_0244, split_right 212 block0332 block0333 (by omega)]
  exact block0333_get i

theorem block0334_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values0334[i.val]'(by rw [values0334_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (244 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_left 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0244_0372, split_left 308 node0244_0308 node0308_0372 (by omega)]
  rw [node0244_0308, split_left 276 block0334 block0335 (by omega)]
  exact block0334_get i

theorem block0335_lookup (i : Fin 32) :
    lookup (276 + i.val) = some (values0335[i.val]'(by rw [values0335_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (276 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_left 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0244_0372, split_left 308 node0244_0308 node0308_0372 (by omega)]
  rw [node0244_0308, split_right 276 block0334 block0335 (by omega)]
  exact block0335_get i

theorem block0336_lookup (i : Fin 32) :
    lookup (308 + i.val) = some (values0336[i.val]'(by rw [values0336_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (308 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_left 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0244_0372, split_right 308 node0244_0308 node0308_0372 (by omega)]
  rw [node0308_0372, split_left 340 block0336 block0337 (by omega)]
  exact block0336_get i

theorem block0337_lookup (i : Fin 32) :
    lookup (340 + i.val) = some (values0337[i.val]'(by rw [values0337_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (340 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_left 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0244_0372, split_right 308 node0244_0308 node0308_0372 (by omega)]
  rw [node0308_0372, split_right 340 block0336 block0337 (by omega)]
  exact block0337_get i

theorem block0338_lookup (i : Fin 32) :
    lookup (372 + i.val) = some (values0338[i.val]'(by rw [values0338_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (372 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_right 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0372_0481, split_left 436 node0372_0436 node0436_0481 (by omega)]
  rw [node0372_0436, split_left 404 block0338 block0339 (by omega)]
  exact block0338_get i

theorem block0339_lookup (i : Fin 32) :
    lookup (404 + i.val) = some (values0339[i.val]'(by rw [values0339_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (404 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_right 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0372_0481, split_left 436 node0372_0436 node0436_0481 (by omega)]
  rw [node0372_0436, split_right 404 block0338 block0339 (by omega)]
  exact block0339_get i

theorem block0340_lookup (i : Fin 32) :
    lookup (436 + i.val) = some (values0340[i.val]'(by rw [values0340_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (436 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_right 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0372_0481, split_right 436 node0372_0436 node0436_0481 (by omega)]
  rw [node0436_0481, split_left 468 block0340 block0341 (by omega)]
  exact block0340_get i

theorem block0341_lookup (i : Fin 13) :
    lookup (468 + i.val) = some (values0341[i.val]'(by rw [values0341_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0020_0481 (468 + i.val) = _
  rw [node0020_0481, split_right 244 node0020_0244 node0244_0481 (by omega)]
  rw [node0244_0481, split_right 372 node0244_0372 node0372_0481 (by omega)]
  rw [node0372_0481, split_right 436 node0372_0436 node0436_0481 (by omega)]
  rw [node0436_0481, split_right 468 block0340 block0341 (by omega)]
  exact block0341_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0327_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0327_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0328_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0328_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0329_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0329_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0330_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0330_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0331_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0331_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0332_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0332_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0333_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0333_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0334_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0334_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0335_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0335_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0336_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0336_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0337_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0337_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0338_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0338_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0339_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0339_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0340_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0340_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0341_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0341_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0327_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0328_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0329_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0330_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0331_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0332_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0333_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0334_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0335_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0336_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0337_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0338_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0339_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0340_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow021.block0341_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow021
