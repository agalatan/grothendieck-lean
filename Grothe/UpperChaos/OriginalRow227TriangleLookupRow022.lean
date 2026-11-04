import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0342
import Grothe.UpperChaos.OriginalRow227TriangleData0343
import Grothe.UpperChaos.OriginalRow227TriangleData0344
import Grothe.UpperChaos.OriginalRow227TriangleData0345
import Grothe.UpperChaos.OriginalRow227TriangleData0346
import Grothe.UpperChaos.OriginalRow227TriangleData0347
import Grothe.UpperChaos.OriginalRow227TriangleData0348
import Grothe.UpperChaos.OriginalRow227TriangleData0349
import Grothe.UpperChaos.OriginalRow227TriangleData0350
import Grothe.UpperChaos.OriginalRow227TriangleData0351
import Grothe.UpperChaos.OriginalRow227TriangleData0352
import Grothe.UpperChaos.OriginalRow227TriangleData0353
import Grothe.UpperChaos.OriginalRow227TriangleData0354
import Grothe.UpperChaos.OriginalRow227TriangleData0355
import Grothe.UpperChaos.OriginalRow227TriangleData0356

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow022

open ConditionalTableLookup

def values0342 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0342.coefficient22_21,
  OriginalRow227TriangleData0342.coefficient22_22,
  OriginalRow227TriangleData0342.coefficient22_23,
  OriginalRow227TriangleData0342.coefficient22_24,
  OriginalRow227TriangleData0342.coefficient22_25,
  OriginalRow227TriangleData0342.coefficient22_26,
  OriginalRow227TriangleData0342.coefficient22_27,
  OriginalRow227TriangleData0342.coefficient22_28,
  OriginalRow227TriangleData0342.coefficient22_29,
  OriginalRow227TriangleData0342.coefficient22_30,
  OriginalRow227TriangleData0342.coefficient22_31,
  OriginalRow227TriangleData0342.coefficient22_32,
  OriginalRow227TriangleData0342.coefficient22_33,
  OriginalRow227TriangleData0342.coefficient22_34,
  OriginalRow227TriangleData0342.coefficient22_35,
  OriginalRow227TriangleData0342.coefficient22_36,
  OriginalRow227TriangleData0342.coefficient22_37,
  OriginalRow227TriangleData0342.coefficient22_38,
  OriginalRow227TriangleData0342.coefficient22_39,
  OriginalRow227TriangleData0342.coefficient22_40,
  OriginalRow227TriangleData0342.coefficient22_41,
  OriginalRow227TriangleData0342.coefficient22_42,
  OriginalRow227TriangleData0342.coefficient22_43,
  OriginalRow227TriangleData0342.coefficient22_44,
  OriginalRow227TriangleData0342.coefficient22_45,
  OriginalRow227TriangleData0342.coefficient22_46,
  OriginalRow227TriangleData0342.coefficient22_47,
  OriginalRow227TriangleData0342.coefficient22_48,
  OriginalRow227TriangleData0342.coefficient22_49,
  OriginalRow227TriangleData0342.coefficient22_50,
  OriginalRow227TriangleData0342.coefficient22_51,
  OriginalRow227TriangleData0342.coefficient22_52
]

theorem values0342_size : values0342.size = 32 := rfl

def block0342 : ℕ → Option IntervalDyadic := segment 21 values0342

theorem block0342_domain : ExactDomain block0342 21 53 := by
  simpa only [values0342_size] using segment_domain 21 values0342

theorem block0342_get (i : Fin 32) :
    block0342 (21 + i.val) = some (values0342[i.val]'(by rw [values0342_size]; exact i.isLt)) := by
  exact segment_get 21 values0342 ⟨i.val, by rw [values0342_size]; exact i.isLt⟩

def values0343 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0343.coefficient22_53,
  OriginalRow227TriangleData0343.coefficient22_54,
  OriginalRow227TriangleData0343.coefficient22_55,
  OriginalRow227TriangleData0343.coefficient22_56,
  OriginalRow227TriangleData0343.coefficient22_57,
  OriginalRow227TriangleData0343.coefficient22_58,
  OriginalRow227TriangleData0343.coefficient22_59,
  OriginalRow227TriangleData0343.coefficient22_60,
  OriginalRow227TriangleData0343.coefficient22_61,
  OriginalRow227TriangleData0343.coefficient22_62,
  OriginalRow227TriangleData0343.coefficient22_63,
  OriginalRow227TriangleData0343.coefficient22_64,
  OriginalRow227TriangleData0343.coefficient22_65,
  OriginalRow227TriangleData0343.coefficient22_66,
  OriginalRow227TriangleData0343.coefficient22_67,
  OriginalRow227TriangleData0343.coefficient22_68,
  OriginalRow227TriangleData0343.coefficient22_69,
  OriginalRow227TriangleData0343.coefficient22_70,
  OriginalRow227TriangleData0343.coefficient22_71,
  OriginalRow227TriangleData0343.coefficient22_72,
  OriginalRow227TriangleData0343.coefficient22_73,
  OriginalRow227TriangleData0343.coefficient22_74,
  OriginalRow227TriangleData0343.coefficient22_75,
  OriginalRow227TriangleData0343.coefficient22_76,
  OriginalRow227TriangleData0343.coefficient22_77,
  OriginalRow227TriangleData0343.coefficient22_78,
  OriginalRow227TriangleData0343.coefficient22_79,
  OriginalRow227TriangleData0343.coefficient22_80,
  OriginalRow227TriangleData0343.coefficient22_81,
  OriginalRow227TriangleData0343.coefficient22_82,
  OriginalRow227TriangleData0343.coefficient22_83,
  OriginalRow227TriangleData0343.coefficient22_84
]

theorem values0343_size : values0343.size = 32 := rfl

def block0343 : ℕ → Option IntervalDyadic := segment 53 values0343

theorem block0343_domain : ExactDomain block0343 53 85 := by
  simpa only [values0343_size] using segment_domain 53 values0343

theorem block0343_get (i : Fin 32) :
    block0343 (53 + i.val) = some (values0343[i.val]'(by rw [values0343_size]; exact i.isLt)) := by
  exact segment_get 53 values0343 ⟨i.val, by rw [values0343_size]; exact i.isLt⟩

def values0344 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0344.coefficient22_85,
  OriginalRow227TriangleData0344.coefficient22_86,
  OriginalRow227TriangleData0344.coefficient22_87,
  OriginalRow227TriangleData0344.coefficient22_88,
  OriginalRow227TriangleData0344.coefficient22_89,
  OriginalRow227TriangleData0344.coefficient22_90,
  OriginalRow227TriangleData0344.coefficient22_91,
  OriginalRow227TriangleData0344.coefficient22_92,
  OriginalRow227TriangleData0344.coefficient22_93,
  OriginalRow227TriangleData0344.coefficient22_94,
  OriginalRow227TriangleData0344.coefficient22_95,
  OriginalRow227TriangleData0344.coefficient22_96,
  OriginalRow227TriangleData0344.coefficient22_97,
  OriginalRow227TriangleData0344.coefficient22_98,
  OriginalRow227TriangleData0344.coefficient22_99,
  OriginalRow227TriangleData0344.coefficient22_100,
  OriginalRow227TriangleData0344.coefficient22_101,
  OriginalRow227TriangleData0344.coefficient22_102,
  OriginalRow227TriangleData0344.coefficient22_103,
  OriginalRow227TriangleData0344.coefficient22_104,
  OriginalRow227TriangleData0344.coefficient22_105,
  OriginalRow227TriangleData0344.coefficient22_106,
  OriginalRow227TriangleData0344.coefficient22_107,
  OriginalRow227TriangleData0344.coefficient22_108,
  OriginalRow227TriangleData0344.coefficient22_109,
  OriginalRow227TriangleData0344.coefficient22_110,
  OriginalRow227TriangleData0344.coefficient22_111,
  OriginalRow227TriangleData0344.coefficient22_112,
  OriginalRow227TriangleData0344.coefficient22_113,
  OriginalRow227TriangleData0344.coefficient22_114,
  OriginalRow227TriangleData0344.coefficient22_115,
  OriginalRow227TriangleData0344.coefficient22_116
]

theorem values0344_size : values0344.size = 32 := rfl

def block0344 : ℕ → Option IntervalDyadic := segment 85 values0344

theorem block0344_domain : ExactDomain block0344 85 117 := by
  simpa only [values0344_size] using segment_domain 85 values0344

theorem block0344_get (i : Fin 32) :
    block0344 (85 + i.val) = some (values0344[i.val]'(by rw [values0344_size]; exact i.isLt)) := by
  exact segment_get 85 values0344 ⟨i.val, by rw [values0344_size]; exact i.isLt⟩

def values0345 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0345.coefficient22_117,
  OriginalRow227TriangleData0345.coefficient22_118,
  OriginalRow227TriangleData0345.coefficient22_119,
  OriginalRow227TriangleData0345.coefficient22_120,
  OriginalRow227TriangleData0345.coefficient22_121,
  OriginalRow227TriangleData0345.coefficient22_122,
  OriginalRow227TriangleData0345.coefficient22_123,
  OriginalRow227TriangleData0345.coefficient22_124,
  OriginalRow227TriangleData0345.coefficient22_125,
  OriginalRow227TriangleData0345.coefficient22_126,
  OriginalRow227TriangleData0345.coefficient22_127,
  OriginalRow227TriangleData0345.coefficient22_128,
  OriginalRow227TriangleData0345.coefficient22_129,
  OriginalRow227TriangleData0345.coefficient22_130,
  OriginalRow227TriangleData0345.coefficient22_131,
  OriginalRow227TriangleData0345.coefficient22_132,
  OriginalRow227TriangleData0345.coefficient22_133,
  OriginalRow227TriangleData0345.coefficient22_134,
  OriginalRow227TriangleData0345.coefficient22_135,
  OriginalRow227TriangleData0345.coefficient22_136,
  OriginalRow227TriangleData0345.coefficient22_137,
  OriginalRow227TriangleData0345.coefficient22_138,
  OriginalRow227TriangleData0345.coefficient22_139,
  OriginalRow227TriangleData0345.coefficient22_140,
  OriginalRow227TriangleData0345.coefficient22_141,
  OriginalRow227TriangleData0345.coefficient22_142,
  OriginalRow227TriangleData0345.coefficient22_143,
  OriginalRow227TriangleData0345.coefficient22_144,
  OriginalRow227TriangleData0345.coefficient22_145,
  OriginalRow227TriangleData0345.coefficient22_146,
  OriginalRow227TriangleData0345.coefficient22_147,
  OriginalRow227TriangleData0345.coefficient22_148
]

theorem values0345_size : values0345.size = 32 := rfl

def block0345 : ℕ → Option IntervalDyadic := segment 117 values0345

theorem block0345_domain : ExactDomain block0345 117 149 := by
  simpa only [values0345_size] using segment_domain 117 values0345

theorem block0345_get (i : Fin 32) :
    block0345 (117 + i.val) = some (values0345[i.val]'(by rw [values0345_size]; exact i.isLt)) := by
  exact segment_get 117 values0345 ⟨i.val, by rw [values0345_size]; exact i.isLt⟩

def values0346 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0346.coefficient22_149,
  OriginalRow227TriangleData0346.coefficient22_150,
  OriginalRow227TriangleData0346.coefficient22_151,
  OriginalRow227TriangleData0346.coefficient22_152,
  OriginalRow227TriangleData0346.coefficient22_153,
  OriginalRow227TriangleData0346.coefficient22_154,
  OriginalRow227TriangleData0346.coefficient22_155,
  OriginalRow227TriangleData0346.coefficient22_156,
  OriginalRow227TriangleData0346.coefficient22_157,
  OriginalRow227TriangleData0346.coefficient22_158,
  OriginalRow227TriangleData0346.coefficient22_159,
  OriginalRow227TriangleData0346.coefficient22_160,
  OriginalRow227TriangleData0346.coefficient22_161,
  OriginalRow227TriangleData0346.coefficient22_162,
  OriginalRow227TriangleData0346.coefficient22_163,
  OriginalRow227TriangleData0346.coefficient22_164,
  OriginalRow227TriangleData0346.coefficient22_165,
  OriginalRow227TriangleData0346.coefficient22_166,
  OriginalRow227TriangleData0346.coefficient22_167,
  OriginalRow227TriangleData0346.coefficient22_168,
  OriginalRow227TriangleData0346.coefficient22_169,
  OriginalRow227TriangleData0346.coefficient22_170,
  OriginalRow227TriangleData0346.coefficient22_171,
  OriginalRow227TriangleData0346.coefficient22_172,
  OriginalRow227TriangleData0346.coefficient22_173,
  OriginalRow227TriangleData0346.coefficient22_174,
  OriginalRow227TriangleData0346.coefficient22_175,
  OriginalRow227TriangleData0346.coefficient22_176,
  OriginalRow227TriangleData0346.coefficient22_177,
  OriginalRow227TriangleData0346.coefficient22_178,
  OriginalRow227TriangleData0346.coefficient22_179,
  OriginalRow227TriangleData0346.coefficient22_180
]

theorem values0346_size : values0346.size = 32 := rfl

def block0346 : ℕ → Option IntervalDyadic := segment 149 values0346

theorem block0346_domain : ExactDomain block0346 149 181 := by
  simpa only [values0346_size] using segment_domain 149 values0346

theorem block0346_get (i : Fin 32) :
    block0346 (149 + i.val) = some (values0346[i.val]'(by rw [values0346_size]; exact i.isLt)) := by
  exact segment_get 149 values0346 ⟨i.val, by rw [values0346_size]; exact i.isLt⟩

def values0347 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0347.coefficient22_181,
  OriginalRow227TriangleData0347.coefficient22_182,
  OriginalRow227TriangleData0347.coefficient22_183,
  OriginalRow227TriangleData0347.coefficient22_184,
  OriginalRow227TriangleData0347.coefficient22_185,
  OriginalRow227TriangleData0347.coefficient22_186,
  OriginalRow227TriangleData0347.coefficient22_187,
  OriginalRow227TriangleData0347.coefficient22_188,
  OriginalRow227TriangleData0347.coefficient22_189,
  OriginalRow227TriangleData0347.coefficient22_190,
  OriginalRow227TriangleData0347.coefficient22_191,
  OriginalRow227TriangleData0347.coefficient22_192,
  OriginalRow227TriangleData0347.coefficient22_193,
  OriginalRow227TriangleData0347.coefficient22_194,
  OriginalRow227TriangleData0347.coefficient22_195,
  OriginalRow227TriangleData0347.coefficient22_196,
  OriginalRow227TriangleData0347.coefficient22_197,
  OriginalRow227TriangleData0347.coefficient22_198,
  OriginalRow227TriangleData0347.coefficient22_199,
  OriginalRow227TriangleData0347.coefficient22_200,
  OriginalRow227TriangleData0347.coefficient22_201,
  OriginalRow227TriangleData0347.coefficient22_202,
  OriginalRow227TriangleData0347.coefficient22_203,
  OriginalRow227TriangleData0347.coefficient22_204,
  OriginalRow227TriangleData0347.coefficient22_205,
  OriginalRow227TriangleData0347.coefficient22_206,
  OriginalRow227TriangleData0347.coefficient22_207,
  OriginalRow227TriangleData0347.coefficient22_208,
  OriginalRow227TriangleData0347.coefficient22_209,
  OriginalRow227TriangleData0347.coefficient22_210,
  OriginalRow227TriangleData0347.coefficient22_211,
  OriginalRow227TriangleData0347.coefficient22_212
]

theorem values0347_size : values0347.size = 32 := rfl

def block0347 : ℕ → Option IntervalDyadic := segment 181 values0347

theorem block0347_domain : ExactDomain block0347 181 213 := by
  simpa only [values0347_size] using segment_domain 181 values0347

theorem block0347_get (i : Fin 32) :
    block0347 (181 + i.val) = some (values0347[i.val]'(by rw [values0347_size]; exact i.isLt)) := by
  exact segment_get 181 values0347 ⟨i.val, by rw [values0347_size]; exact i.isLt⟩

def values0348 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0348.coefficient22_213,
  OriginalRow227TriangleData0348.coefficient22_214,
  OriginalRow227TriangleData0348.coefficient22_215,
  OriginalRow227TriangleData0348.coefficient22_216,
  OriginalRow227TriangleData0348.coefficient22_217,
  OriginalRow227TriangleData0348.coefficient22_218,
  OriginalRow227TriangleData0348.coefficient22_219,
  OriginalRow227TriangleData0348.coefficient22_220,
  OriginalRow227TriangleData0348.coefficient22_221,
  OriginalRow227TriangleData0348.coefficient22_222,
  OriginalRow227TriangleData0348.coefficient22_223,
  OriginalRow227TriangleData0348.coefficient22_224,
  OriginalRow227TriangleData0348.coefficient22_225,
  OriginalRow227TriangleData0348.coefficient22_226,
  OriginalRow227TriangleData0348.coefficient22_227,
  OriginalRow227TriangleData0348.coefficient22_228,
  OriginalRow227TriangleData0348.coefficient22_229,
  OriginalRow227TriangleData0348.coefficient22_230,
  OriginalRow227TriangleData0348.coefficient22_231,
  OriginalRow227TriangleData0348.coefficient22_232,
  OriginalRow227TriangleData0348.coefficient22_233,
  OriginalRow227TriangleData0348.coefficient22_234,
  OriginalRow227TriangleData0348.coefficient22_235,
  OriginalRow227TriangleData0348.coefficient22_236,
  OriginalRow227TriangleData0348.coefficient22_237,
  OriginalRow227TriangleData0348.coefficient22_238,
  OriginalRow227TriangleData0348.coefficient22_239,
  OriginalRow227TriangleData0348.coefficient22_240,
  OriginalRow227TriangleData0348.coefficient22_241,
  OriginalRow227TriangleData0348.coefficient22_242,
  OriginalRow227TriangleData0348.coefficient22_243,
  OriginalRow227TriangleData0348.coefficient22_244
]

theorem values0348_size : values0348.size = 32 := rfl

def block0348 : ℕ → Option IntervalDyadic := segment 213 values0348

theorem block0348_domain : ExactDomain block0348 213 245 := by
  simpa only [values0348_size] using segment_domain 213 values0348

theorem block0348_get (i : Fin 32) :
    block0348 (213 + i.val) = some (values0348[i.val]'(by rw [values0348_size]; exact i.isLt)) := by
  exact segment_get 213 values0348 ⟨i.val, by rw [values0348_size]; exact i.isLt⟩

def values0349 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0349.coefficient22_245,
  OriginalRow227TriangleData0349.coefficient22_246,
  OriginalRow227TriangleData0349.coefficient22_247,
  OriginalRow227TriangleData0349.coefficient22_248,
  OriginalRow227TriangleData0349.coefficient22_249,
  OriginalRow227TriangleData0349.coefficient22_250,
  OriginalRow227TriangleData0349.coefficient22_251,
  OriginalRow227TriangleData0349.coefficient22_252,
  OriginalRow227TriangleData0349.coefficient22_253,
  OriginalRow227TriangleData0349.coefficient22_254,
  OriginalRow227TriangleData0349.coefficient22_255,
  OriginalRow227TriangleData0349.coefficient22_256,
  OriginalRow227TriangleData0349.coefficient22_257,
  OriginalRow227TriangleData0349.coefficient22_258,
  OriginalRow227TriangleData0349.coefficient22_259,
  OriginalRow227TriangleData0349.coefficient22_260,
  OriginalRow227TriangleData0349.coefficient22_261,
  OriginalRow227TriangleData0349.coefficient22_262,
  OriginalRow227TriangleData0349.coefficient22_263,
  OriginalRow227TriangleData0349.coefficient22_264,
  OriginalRow227TriangleData0349.coefficient22_265,
  OriginalRow227TriangleData0349.coefficient22_266,
  OriginalRow227TriangleData0349.coefficient22_267,
  OriginalRow227TriangleData0349.coefficient22_268,
  OriginalRow227TriangleData0349.coefficient22_269,
  OriginalRow227TriangleData0349.coefficient22_270,
  OriginalRow227TriangleData0349.coefficient22_271,
  OriginalRow227TriangleData0349.coefficient22_272,
  OriginalRow227TriangleData0349.coefficient22_273,
  OriginalRow227TriangleData0349.coefficient22_274,
  OriginalRow227TriangleData0349.coefficient22_275,
  OriginalRow227TriangleData0349.coefficient22_276
]

theorem values0349_size : values0349.size = 32 := rfl

def block0349 : ℕ → Option IntervalDyadic := segment 245 values0349

theorem block0349_domain : ExactDomain block0349 245 277 := by
  simpa only [values0349_size] using segment_domain 245 values0349

theorem block0349_get (i : Fin 32) :
    block0349 (245 + i.val) = some (values0349[i.val]'(by rw [values0349_size]; exact i.isLt)) := by
  exact segment_get 245 values0349 ⟨i.val, by rw [values0349_size]; exact i.isLt⟩

def values0350 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0350.coefficient22_277,
  OriginalRow227TriangleData0350.coefficient22_278,
  OriginalRow227TriangleData0350.coefficient22_279,
  OriginalRow227TriangleData0350.coefficient22_280,
  OriginalRow227TriangleData0350.coefficient22_281,
  OriginalRow227TriangleData0350.coefficient22_282,
  OriginalRow227TriangleData0350.coefficient22_283,
  OriginalRow227TriangleData0350.coefficient22_284,
  OriginalRow227TriangleData0350.coefficient22_285,
  OriginalRow227TriangleData0350.coefficient22_286,
  OriginalRow227TriangleData0350.coefficient22_287,
  OriginalRow227TriangleData0350.coefficient22_288,
  OriginalRow227TriangleData0350.coefficient22_289,
  OriginalRow227TriangleData0350.coefficient22_290,
  OriginalRow227TriangleData0350.coefficient22_291,
  OriginalRow227TriangleData0350.coefficient22_292,
  OriginalRow227TriangleData0350.coefficient22_293,
  OriginalRow227TriangleData0350.coefficient22_294,
  OriginalRow227TriangleData0350.coefficient22_295,
  OriginalRow227TriangleData0350.coefficient22_296,
  OriginalRow227TriangleData0350.coefficient22_297,
  OriginalRow227TriangleData0350.coefficient22_298,
  OriginalRow227TriangleData0350.coefficient22_299,
  OriginalRow227TriangleData0350.coefficient22_300,
  OriginalRow227TriangleData0350.coefficient22_301,
  OriginalRow227TriangleData0350.coefficient22_302,
  OriginalRow227TriangleData0350.coefficient22_303,
  OriginalRow227TriangleData0350.coefficient22_304,
  OriginalRow227TriangleData0350.coefficient22_305,
  OriginalRow227TriangleData0350.coefficient22_306,
  OriginalRow227TriangleData0350.coefficient22_307,
  OriginalRow227TriangleData0350.coefficient22_308
]

theorem values0350_size : values0350.size = 32 := rfl

def block0350 : ℕ → Option IntervalDyadic := segment 277 values0350

theorem block0350_domain : ExactDomain block0350 277 309 := by
  simpa only [values0350_size] using segment_domain 277 values0350

theorem block0350_get (i : Fin 32) :
    block0350 (277 + i.val) = some (values0350[i.val]'(by rw [values0350_size]; exact i.isLt)) := by
  exact segment_get 277 values0350 ⟨i.val, by rw [values0350_size]; exact i.isLt⟩

def values0351 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0351.coefficient22_309,
  OriginalRow227TriangleData0351.coefficient22_310,
  OriginalRow227TriangleData0351.coefficient22_311,
  OriginalRow227TriangleData0351.coefficient22_312,
  OriginalRow227TriangleData0351.coefficient22_313,
  OriginalRow227TriangleData0351.coefficient22_314,
  OriginalRow227TriangleData0351.coefficient22_315,
  OriginalRow227TriangleData0351.coefficient22_316,
  OriginalRow227TriangleData0351.coefficient22_317,
  OriginalRow227TriangleData0351.coefficient22_318,
  OriginalRow227TriangleData0351.coefficient22_319,
  OriginalRow227TriangleData0351.coefficient22_320,
  OriginalRow227TriangleData0351.coefficient22_321,
  OriginalRow227TriangleData0351.coefficient22_322,
  OriginalRow227TriangleData0351.coefficient22_323,
  OriginalRow227TriangleData0351.coefficient22_324,
  OriginalRow227TriangleData0351.coefficient22_325,
  OriginalRow227TriangleData0351.coefficient22_326,
  OriginalRow227TriangleData0351.coefficient22_327,
  OriginalRow227TriangleData0351.coefficient22_328,
  OriginalRow227TriangleData0351.coefficient22_329,
  OriginalRow227TriangleData0351.coefficient22_330,
  OriginalRow227TriangleData0351.coefficient22_331,
  OriginalRow227TriangleData0351.coefficient22_332,
  OriginalRow227TriangleData0351.coefficient22_333,
  OriginalRow227TriangleData0351.coefficient22_334,
  OriginalRow227TriangleData0351.coefficient22_335,
  OriginalRow227TriangleData0351.coefficient22_336,
  OriginalRow227TriangleData0351.coefficient22_337,
  OriginalRow227TriangleData0351.coefficient22_338,
  OriginalRow227TriangleData0351.coefficient22_339,
  OriginalRow227TriangleData0351.coefficient22_340
]

theorem values0351_size : values0351.size = 32 := rfl

def block0351 : ℕ → Option IntervalDyadic := segment 309 values0351

theorem block0351_domain : ExactDomain block0351 309 341 := by
  simpa only [values0351_size] using segment_domain 309 values0351

theorem block0351_get (i : Fin 32) :
    block0351 (309 + i.val) = some (values0351[i.val]'(by rw [values0351_size]; exact i.isLt)) := by
  exact segment_get 309 values0351 ⟨i.val, by rw [values0351_size]; exact i.isLt⟩

def values0352 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0352.coefficient22_341,
  OriginalRow227TriangleData0352.coefficient22_342,
  OriginalRow227TriangleData0352.coefficient22_343,
  OriginalRow227TriangleData0352.coefficient22_344,
  OriginalRow227TriangleData0352.coefficient22_345,
  OriginalRow227TriangleData0352.coefficient22_346,
  OriginalRow227TriangleData0352.coefficient22_347,
  OriginalRow227TriangleData0352.coefficient22_348,
  OriginalRow227TriangleData0352.coefficient22_349,
  OriginalRow227TriangleData0352.coefficient22_350,
  OriginalRow227TriangleData0352.coefficient22_351,
  OriginalRow227TriangleData0352.coefficient22_352,
  OriginalRow227TriangleData0352.coefficient22_353,
  OriginalRow227TriangleData0352.coefficient22_354,
  OriginalRow227TriangleData0352.coefficient22_355,
  OriginalRow227TriangleData0352.coefficient22_356,
  OriginalRow227TriangleData0352.coefficient22_357,
  OriginalRow227TriangleData0352.coefficient22_358,
  OriginalRow227TriangleData0352.coefficient22_359,
  OriginalRow227TriangleData0352.coefficient22_360,
  OriginalRow227TriangleData0352.coefficient22_361,
  OriginalRow227TriangleData0352.coefficient22_362,
  OriginalRow227TriangleData0352.coefficient22_363,
  OriginalRow227TriangleData0352.coefficient22_364,
  OriginalRow227TriangleData0352.coefficient22_365,
  OriginalRow227TriangleData0352.coefficient22_366,
  OriginalRow227TriangleData0352.coefficient22_367,
  OriginalRow227TriangleData0352.coefficient22_368,
  OriginalRow227TriangleData0352.coefficient22_369,
  OriginalRow227TriangleData0352.coefficient22_370,
  OriginalRow227TriangleData0352.coefficient22_371,
  OriginalRow227TriangleData0352.coefficient22_372
]

theorem values0352_size : values0352.size = 32 := rfl

def block0352 : ℕ → Option IntervalDyadic := segment 341 values0352

theorem block0352_domain : ExactDomain block0352 341 373 := by
  simpa only [values0352_size] using segment_domain 341 values0352

theorem block0352_get (i : Fin 32) :
    block0352 (341 + i.val) = some (values0352[i.val]'(by rw [values0352_size]; exact i.isLt)) := by
  exact segment_get 341 values0352 ⟨i.val, by rw [values0352_size]; exact i.isLt⟩

def values0353 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0353.coefficient22_373,
  OriginalRow227TriangleData0353.coefficient22_374,
  OriginalRow227TriangleData0353.coefficient22_375,
  OriginalRow227TriangleData0353.coefficient22_376,
  OriginalRow227TriangleData0353.coefficient22_377,
  OriginalRow227TriangleData0353.coefficient22_378,
  OriginalRow227TriangleData0353.coefficient22_379,
  OriginalRow227TriangleData0353.coefficient22_380,
  OriginalRow227TriangleData0353.coefficient22_381,
  OriginalRow227TriangleData0353.coefficient22_382,
  OriginalRow227TriangleData0353.coefficient22_383,
  OriginalRow227TriangleData0353.coefficient22_384,
  OriginalRow227TriangleData0353.coefficient22_385,
  OriginalRow227TriangleData0353.coefficient22_386,
  OriginalRow227TriangleData0353.coefficient22_387,
  OriginalRow227TriangleData0353.coefficient22_388,
  OriginalRow227TriangleData0353.coefficient22_389,
  OriginalRow227TriangleData0353.coefficient22_390,
  OriginalRow227TriangleData0353.coefficient22_391,
  OriginalRow227TriangleData0353.coefficient22_392,
  OriginalRow227TriangleData0353.coefficient22_393,
  OriginalRow227TriangleData0353.coefficient22_394,
  OriginalRow227TriangleData0353.coefficient22_395,
  OriginalRow227TriangleData0353.coefficient22_396,
  OriginalRow227TriangleData0353.coefficient22_397,
  OriginalRow227TriangleData0353.coefficient22_398,
  OriginalRow227TriangleData0353.coefficient22_399,
  OriginalRow227TriangleData0353.coefficient22_400,
  OriginalRow227TriangleData0353.coefficient22_401,
  OriginalRow227TriangleData0353.coefficient22_402,
  OriginalRow227TriangleData0353.coefficient22_403,
  OriginalRow227TriangleData0353.coefficient22_404
]

theorem values0353_size : values0353.size = 32 := rfl

def block0353 : ℕ → Option IntervalDyadic := segment 373 values0353

theorem block0353_domain : ExactDomain block0353 373 405 := by
  simpa only [values0353_size] using segment_domain 373 values0353

theorem block0353_get (i : Fin 32) :
    block0353 (373 + i.val) = some (values0353[i.val]'(by rw [values0353_size]; exact i.isLt)) := by
  exact segment_get 373 values0353 ⟨i.val, by rw [values0353_size]; exact i.isLt⟩

def values0354 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0354.coefficient22_405,
  OriginalRow227TriangleData0354.coefficient22_406,
  OriginalRow227TriangleData0354.coefficient22_407,
  OriginalRow227TriangleData0354.coefficient22_408,
  OriginalRow227TriangleData0354.coefficient22_409,
  OriginalRow227TriangleData0354.coefficient22_410,
  OriginalRow227TriangleData0354.coefficient22_411,
  OriginalRow227TriangleData0354.coefficient22_412,
  OriginalRow227TriangleData0354.coefficient22_413,
  OriginalRow227TriangleData0354.coefficient22_414,
  OriginalRow227TriangleData0354.coefficient22_415,
  OriginalRow227TriangleData0354.coefficient22_416,
  OriginalRow227TriangleData0354.coefficient22_417,
  OriginalRow227TriangleData0354.coefficient22_418,
  OriginalRow227TriangleData0354.coefficient22_419,
  OriginalRow227TriangleData0354.coefficient22_420,
  OriginalRow227TriangleData0354.coefficient22_421,
  OriginalRow227TriangleData0354.coefficient22_422,
  OriginalRow227TriangleData0354.coefficient22_423,
  OriginalRow227TriangleData0354.coefficient22_424,
  OriginalRow227TriangleData0354.coefficient22_425,
  OriginalRow227TriangleData0354.coefficient22_426,
  OriginalRow227TriangleData0354.coefficient22_427,
  OriginalRow227TriangleData0354.coefficient22_428,
  OriginalRow227TriangleData0354.coefficient22_429,
  OriginalRow227TriangleData0354.coefficient22_430,
  OriginalRow227TriangleData0354.coefficient22_431,
  OriginalRow227TriangleData0354.coefficient22_432,
  OriginalRow227TriangleData0354.coefficient22_433,
  OriginalRow227TriangleData0354.coefficient22_434,
  OriginalRow227TriangleData0354.coefficient22_435,
  OriginalRow227TriangleData0354.coefficient22_436
]

theorem values0354_size : values0354.size = 32 := rfl

def block0354 : ℕ → Option IntervalDyadic := segment 405 values0354

theorem block0354_domain : ExactDomain block0354 405 437 := by
  simpa only [values0354_size] using segment_domain 405 values0354

theorem block0354_get (i : Fin 32) :
    block0354 (405 + i.val) = some (values0354[i.val]'(by rw [values0354_size]; exact i.isLt)) := by
  exact segment_get 405 values0354 ⟨i.val, by rw [values0354_size]; exact i.isLt⟩

def values0355 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0355.coefficient22_437,
  OriginalRow227TriangleData0355.coefficient22_438,
  OriginalRow227TriangleData0355.coefficient22_439,
  OriginalRow227TriangleData0355.coefficient22_440,
  OriginalRow227TriangleData0355.coefficient22_441,
  OriginalRow227TriangleData0355.coefficient22_442,
  OriginalRow227TriangleData0355.coefficient22_443,
  OriginalRow227TriangleData0355.coefficient22_444,
  OriginalRow227TriangleData0355.coefficient22_445,
  OriginalRow227TriangleData0355.coefficient22_446,
  OriginalRow227TriangleData0355.coefficient22_447,
  OriginalRow227TriangleData0355.coefficient22_448,
  OriginalRow227TriangleData0355.coefficient22_449,
  OriginalRow227TriangleData0355.coefficient22_450,
  OriginalRow227TriangleData0355.coefficient22_451,
  OriginalRow227TriangleData0355.coefficient22_452,
  OriginalRow227TriangleData0355.coefficient22_453,
  OriginalRow227TriangleData0355.coefficient22_454,
  OriginalRow227TriangleData0355.coefficient22_455,
  OriginalRow227TriangleData0355.coefficient22_456,
  OriginalRow227TriangleData0355.coefficient22_457,
  OriginalRow227TriangleData0355.coefficient22_458,
  OriginalRow227TriangleData0355.coefficient22_459,
  OriginalRow227TriangleData0355.coefficient22_460,
  OriginalRow227TriangleData0355.coefficient22_461,
  OriginalRow227TriangleData0355.coefficient22_462,
  OriginalRow227TriangleData0355.coefficient22_463,
  OriginalRow227TriangleData0355.coefficient22_464,
  OriginalRow227TriangleData0355.coefficient22_465,
  OriginalRow227TriangleData0355.coefficient22_466,
  OriginalRow227TriangleData0355.coefficient22_467,
  OriginalRow227TriangleData0355.coefficient22_468
]

theorem values0355_size : values0355.size = 32 := rfl

def block0355 : ℕ → Option IntervalDyadic := segment 437 values0355

theorem block0355_domain : ExactDomain block0355 437 469 := by
  simpa only [values0355_size] using segment_domain 437 values0355

theorem block0355_get (i : Fin 32) :
    block0355 (437 + i.val) = some (values0355[i.val]'(by rw [values0355_size]; exact i.isLt)) := by
  exact segment_get 437 values0355 ⟨i.val, by rw [values0355_size]; exact i.isLt⟩

def values0356 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0356.coefficient22_469,
  OriginalRow227TriangleData0356.coefficient22_470,
  OriginalRow227TriangleData0356.coefficient22_471,
  OriginalRow227TriangleData0356.coefficient22_472,
  OriginalRow227TriangleData0356.coefficient22_473,
  OriginalRow227TriangleData0356.coefficient22_474,
  OriginalRow227TriangleData0356.coefficient22_475,
  OriginalRow227TriangleData0356.coefficient22_476,
  OriginalRow227TriangleData0356.coefficient22_477,
  OriginalRow227TriangleData0356.coefficient22_478,
  OriginalRow227TriangleData0356.coefficient22_479
]

theorem values0356_size : values0356.size = 11 := rfl

def block0356 : ℕ → Option IntervalDyadic := segment 469 values0356

theorem block0356_domain : ExactDomain block0356 469 480 := by
  simpa only [values0356_size] using segment_domain 469 values0356

theorem block0356_get (i : Fin 11) :
    block0356 (469 + i.val) = some (values0356[i.val]'(by rw [values0356_size]; exact i.isLt)) := by
  exact segment_get 469 values0356 ⟨i.val, by rw [values0356_size]; exact i.isLt⟩

def node0053_0117 : ℕ → Option IntervalDyadic := split 85 block0343 block0344

theorem node0053_0117_domain : ExactDomain node0053_0117 53 117 := by
  exact split_domain (by decide) (by decide) block0343_domain block0344_domain

def node0021_0117 : ℕ → Option IntervalDyadic := split 53 block0342 node0053_0117

theorem node0021_0117_domain : ExactDomain node0021_0117 21 117 := by
  exact split_domain (by decide) (by decide) block0342_domain node0053_0117_domain

def node0117_0181 : ℕ → Option IntervalDyadic := split 149 block0345 block0346

theorem node0117_0181_domain : ExactDomain node0117_0181 117 181 := by
  exact split_domain (by decide) (by decide) block0345_domain block0346_domain

def node0181_0245 : ℕ → Option IntervalDyadic := split 213 block0347 block0348

theorem node0181_0245_domain : ExactDomain node0181_0245 181 245 := by
  exact split_domain (by decide) (by decide) block0347_domain block0348_domain

def node0117_0245 : ℕ → Option IntervalDyadic := split 181 node0117_0181 node0181_0245

theorem node0117_0245_domain : ExactDomain node0117_0245 117 245 := by
  exact split_domain (by decide) (by decide) node0117_0181_domain node0181_0245_domain

def node0021_0245 : ℕ → Option IntervalDyadic := split 117 node0021_0117 node0117_0245

theorem node0021_0245_domain : ExactDomain node0021_0245 21 245 := by
  exact split_domain (by decide) (by decide) node0021_0117_domain node0117_0245_domain

def node0245_0309 : ℕ → Option IntervalDyadic := split 277 block0349 block0350

theorem node0245_0309_domain : ExactDomain node0245_0309 245 309 := by
  exact split_domain (by decide) (by decide) block0349_domain block0350_domain

def node0309_0373 : ℕ → Option IntervalDyadic := split 341 block0351 block0352

theorem node0309_0373_domain : ExactDomain node0309_0373 309 373 := by
  exact split_domain (by decide) (by decide) block0351_domain block0352_domain

def node0245_0373 : ℕ → Option IntervalDyadic := split 309 node0245_0309 node0309_0373

theorem node0245_0373_domain : ExactDomain node0245_0373 245 373 := by
  exact split_domain (by decide) (by decide) node0245_0309_domain node0309_0373_domain

def node0373_0437 : ℕ → Option IntervalDyadic := split 405 block0353 block0354

theorem node0373_0437_domain : ExactDomain node0373_0437 373 437 := by
  exact split_domain (by decide) (by decide) block0353_domain block0354_domain

def node0437_0480 : ℕ → Option IntervalDyadic := split 469 block0355 block0356

theorem node0437_0480_domain : ExactDomain node0437_0480 437 480 := by
  exact split_domain (by decide) (by decide) block0355_domain block0356_domain

def node0373_0480 : ℕ → Option IntervalDyadic := split 437 node0373_0437 node0437_0480

theorem node0373_0480_domain : ExactDomain node0373_0480 373 480 := by
  exact split_domain (by decide) (by decide) node0373_0437_domain node0437_0480_domain

def node0245_0480 : ℕ → Option IntervalDyadic := split 373 node0245_0373 node0373_0480

theorem node0245_0480_domain : ExactDomain node0245_0480 245 480 := by
  exact split_domain (by decide) (by decide) node0245_0373_domain node0373_0480_domain

def node0021_0480 : ℕ → Option IntervalDyadic := split 245 node0021_0245 node0245_0480

theorem node0021_0480_domain : ExactDomain node0021_0480 21 480 := by
  exact split_domain (by decide) (by decide) node0021_0245_domain node0245_0480_domain

def lookup : ℕ → Option IntervalDyadic := node0021_0480

theorem lookup_domain : ExactDomain lookup 21 480 :=
  node0021_0480_domain

theorem block0342_lookup (i : Fin 32) :
    lookup (21 + i.val) = some (values0342[i.val]'(by rw [values0342_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (21 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_left 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0021_0117, split_left 53 block0342 node0053_0117 (by omega)]
  exact block0342_get i

theorem block0343_lookup (i : Fin 32) :
    lookup (53 + i.val) = some (values0343[i.val]'(by rw [values0343_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (53 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_left 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0021_0117, split_right 53 block0342 node0053_0117 (by omega)]
  rw [node0053_0117, split_left 85 block0343 block0344 (by omega)]
  exact block0343_get i

theorem block0344_lookup (i : Fin 32) :
    lookup (85 + i.val) = some (values0344[i.val]'(by rw [values0344_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (85 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_left 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0021_0117, split_right 53 block0342 node0053_0117 (by omega)]
  rw [node0053_0117, split_right 85 block0343 block0344 (by omega)]
  exact block0344_get i

theorem block0345_lookup (i : Fin 32) :
    lookup (117 + i.val) = some (values0345[i.val]'(by rw [values0345_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (117 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_right 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0117_0245, split_left 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0117_0181, split_left 149 block0345 block0346 (by omega)]
  exact block0345_get i

theorem block0346_lookup (i : Fin 32) :
    lookup (149 + i.val) = some (values0346[i.val]'(by rw [values0346_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (149 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_right 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0117_0245, split_left 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0117_0181, split_right 149 block0345 block0346 (by omega)]
  exact block0346_get i

theorem block0347_lookup (i : Fin 32) :
    lookup (181 + i.val) = some (values0347[i.val]'(by rw [values0347_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (181 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_right 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0117_0245, split_right 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0181_0245, split_left 213 block0347 block0348 (by omega)]
  exact block0347_get i

theorem block0348_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values0348[i.val]'(by rw [values0348_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (213 + i.val) = _
  rw [node0021_0480, split_left 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0021_0245, split_right 117 node0021_0117 node0117_0245 (by omega)]
  rw [node0117_0245, split_right 181 node0117_0181 node0181_0245 (by omega)]
  rw [node0181_0245, split_right 213 block0347 block0348 (by omega)]
  exact block0348_get i

theorem block0349_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values0349[i.val]'(by rw [values0349_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (245 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_left 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0245_0373, split_left 309 node0245_0309 node0309_0373 (by omega)]
  rw [node0245_0309, split_left 277 block0349 block0350 (by omega)]
  exact block0349_get i

theorem block0350_lookup (i : Fin 32) :
    lookup (277 + i.val) = some (values0350[i.val]'(by rw [values0350_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (277 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_left 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0245_0373, split_left 309 node0245_0309 node0309_0373 (by omega)]
  rw [node0245_0309, split_right 277 block0349 block0350 (by omega)]
  exact block0350_get i

theorem block0351_lookup (i : Fin 32) :
    lookup (309 + i.val) = some (values0351[i.val]'(by rw [values0351_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (309 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_left 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0245_0373, split_right 309 node0245_0309 node0309_0373 (by omega)]
  rw [node0309_0373, split_left 341 block0351 block0352 (by omega)]
  exact block0351_get i

theorem block0352_lookup (i : Fin 32) :
    lookup (341 + i.val) = some (values0352[i.val]'(by rw [values0352_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (341 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_left 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0245_0373, split_right 309 node0245_0309 node0309_0373 (by omega)]
  rw [node0309_0373, split_right 341 block0351 block0352 (by omega)]
  exact block0352_get i

theorem block0353_lookup (i : Fin 32) :
    lookup (373 + i.val) = some (values0353[i.val]'(by rw [values0353_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (373 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_right 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0373_0480, split_left 437 node0373_0437 node0437_0480 (by omega)]
  rw [node0373_0437, split_left 405 block0353 block0354 (by omega)]
  exact block0353_get i

theorem block0354_lookup (i : Fin 32) :
    lookup (405 + i.val) = some (values0354[i.val]'(by rw [values0354_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (405 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_right 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0373_0480, split_left 437 node0373_0437 node0437_0480 (by omega)]
  rw [node0373_0437, split_right 405 block0353 block0354 (by omega)]
  exact block0354_get i

theorem block0355_lookup (i : Fin 32) :
    lookup (437 + i.val) = some (values0355[i.val]'(by rw [values0355_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (437 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_right 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0373_0480, split_right 437 node0373_0437 node0437_0480 (by omega)]
  rw [node0437_0480, split_left 469 block0355 block0356 (by omega)]
  exact block0355_get i

theorem block0356_lookup (i : Fin 11) :
    lookup (469 + i.val) = some (values0356[i.val]'(by rw [values0356_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0021_0480 (469 + i.val) = _
  rw [node0021_0480, split_right 245 node0021_0245 node0245_0480 (by omega)]
  rw [node0245_0480, split_right 373 node0245_0373 node0373_0480 (by omega)]
  rw [node0373_0480, split_right 437 node0373_0437 node0437_0480 (by omega)]
  rw [node0437_0480, split_right 469 block0355 block0356 (by omega)]
  exact block0356_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0342_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0342_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0343_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0343_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0344_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0344_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0345_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0345_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0346_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0346_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0347_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0347_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0348_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0348_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0349_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0349_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0350_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0350_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0351_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0351_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0352_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0352_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0353_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0353_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0354_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0354_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0355_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0355_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0356_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0356_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0342_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0343_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0344_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0345_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0346_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0347_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0348_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0349_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0350_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0351_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0352_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0353_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0354_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0355_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow022.block0356_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow022
