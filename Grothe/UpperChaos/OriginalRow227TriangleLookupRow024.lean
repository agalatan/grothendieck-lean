import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0372
import Grothe.UpperChaos.OriginalRow227TriangleData0373
import Grothe.UpperChaos.OriginalRow227TriangleData0374
import Grothe.UpperChaos.OriginalRow227TriangleData0375
import Grothe.UpperChaos.OriginalRow227TriangleData0376
import Grothe.UpperChaos.OriginalRow227TriangleData0377
import Grothe.UpperChaos.OriginalRow227TriangleData0378
import Grothe.UpperChaos.OriginalRow227TriangleData0379
import Grothe.UpperChaos.OriginalRow227TriangleData0380
import Grothe.UpperChaos.OriginalRow227TriangleData0381
import Grothe.UpperChaos.OriginalRow227TriangleData0382
import Grothe.UpperChaos.OriginalRow227TriangleData0383
import Grothe.UpperChaos.OriginalRow227TriangleData0384
import Grothe.UpperChaos.OriginalRow227TriangleData0385
import Grothe.UpperChaos.OriginalRow227TriangleData0386

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow024

open ConditionalTableLookup

def values0372 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0372.coefficient24_23,
  OriginalRow227TriangleData0372.coefficient24_24,
  OriginalRow227TriangleData0372.coefficient24_25,
  OriginalRow227TriangleData0372.coefficient24_26,
  OriginalRow227TriangleData0372.coefficient24_27,
  OriginalRow227TriangleData0372.coefficient24_28,
  OriginalRow227TriangleData0372.coefficient24_29,
  OriginalRow227TriangleData0372.coefficient24_30,
  OriginalRow227TriangleData0372.coefficient24_31,
  OriginalRow227TriangleData0372.coefficient24_32,
  OriginalRow227TriangleData0372.coefficient24_33,
  OriginalRow227TriangleData0372.coefficient24_34,
  OriginalRow227TriangleData0372.coefficient24_35,
  OriginalRow227TriangleData0372.coefficient24_36,
  OriginalRow227TriangleData0372.coefficient24_37,
  OriginalRow227TriangleData0372.coefficient24_38,
  OriginalRow227TriangleData0372.coefficient24_39,
  OriginalRow227TriangleData0372.coefficient24_40,
  OriginalRow227TriangleData0372.coefficient24_41,
  OriginalRow227TriangleData0372.coefficient24_42,
  OriginalRow227TriangleData0372.coefficient24_43,
  OriginalRow227TriangleData0372.coefficient24_44,
  OriginalRow227TriangleData0372.coefficient24_45,
  OriginalRow227TriangleData0372.coefficient24_46,
  OriginalRow227TriangleData0372.coefficient24_47,
  OriginalRow227TriangleData0372.coefficient24_48,
  OriginalRow227TriangleData0372.coefficient24_49,
  OriginalRow227TriangleData0372.coefficient24_50,
  OriginalRow227TriangleData0372.coefficient24_51,
  OriginalRow227TriangleData0372.coefficient24_52,
  OriginalRow227TriangleData0372.coefficient24_53,
  OriginalRow227TriangleData0372.coefficient24_54
]

theorem values0372_size : values0372.size = 32 := rfl

def block0372 : ℕ → Option IntervalDyadic := segment 23 values0372

theorem block0372_domain : ExactDomain block0372 23 55 := by
  simpa only [values0372_size] using segment_domain 23 values0372

theorem block0372_get (i : Fin 32) :
    block0372 (23 + i.val) = some (values0372[i.val]'(by rw [values0372_size]; exact i.isLt)) := by
  exact segment_get 23 values0372 ⟨i.val, by rw [values0372_size]; exact i.isLt⟩

def values0373 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0373.coefficient24_55,
  OriginalRow227TriangleData0373.coefficient24_56,
  OriginalRow227TriangleData0373.coefficient24_57,
  OriginalRow227TriangleData0373.coefficient24_58,
  OriginalRow227TriangleData0373.coefficient24_59,
  OriginalRow227TriangleData0373.coefficient24_60,
  OriginalRow227TriangleData0373.coefficient24_61,
  OriginalRow227TriangleData0373.coefficient24_62,
  OriginalRow227TriangleData0373.coefficient24_63,
  OriginalRow227TriangleData0373.coefficient24_64,
  OriginalRow227TriangleData0373.coefficient24_65,
  OriginalRow227TriangleData0373.coefficient24_66,
  OriginalRow227TriangleData0373.coefficient24_67,
  OriginalRow227TriangleData0373.coefficient24_68,
  OriginalRow227TriangleData0373.coefficient24_69,
  OriginalRow227TriangleData0373.coefficient24_70,
  OriginalRow227TriangleData0373.coefficient24_71,
  OriginalRow227TriangleData0373.coefficient24_72,
  OriginalRow227TriangleData0373.coefficient24_73,
  OriginalRow227TriangleData0373.coefficient24_74,
  OriginalRow227TriangleData0373.coefficient24_75,
  OriginalRow227TriangleData0373.coefficient24_76,
  OriginalRow227TriangleData0373.coefficient24_77,
  OriginalRow227TriangleData0373.coefficient24_78,
  OriginalRow227TriangleData0373.coefficient24_79,
  OriginalRow227TriangleData0373.coefficient24_80,
  OriginalRow227TriangleData0373.coefficient24_81,
  OriginalRow227TriangleData0373.coefficient24_82,
  OriginalRow227TriangleData0373.coefficient24_83,
  OriginalRow227TriangleData0373.coefficient24_84,
  OriginalRow227TriangleData0373.coefficient24_85,
  OriginalRow227TriangleData0373.coefficient24_86
]

theorem values0373_size : values0373.size = 32 := rfl

def block0373 : ℕ → Option IntervalDyadic := segment 55 values0373

theorem block0373_domain : ExactDomain block0373 55 87 := by
  simpa only [values0373_size] using segment_domain 55 values0373

theorem block0373_get (i : Fin 32) :
    block0373 (55 + i.val) = some (values0373[i.val]'(by rw [values0373_size]; exact i.isLt)) := by
  exact segment_get 55 values0373 ⟨i.val, by rw [values0373_size]; exact i.isLt⟩

def values0374 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0374.coefficient24_87,
  OriginalRow227TriangleData0374.coefficient24_88,
  OriginalRow227TriangleData0374.coefficient24_89,
  OriginalRow227TriangleData0374.coefficient24_90,
  OriginalRow227TriangleData0374.coefficient24_91,
  OriginalRow227TriangleData0374.coefficient24_92,
  OriginalRow227TriangleData0374.coefficient24_93,
  OriginalRow227TriangleData0374.coefficient24_94,
  OriginalRow227TriangleData0374.coefficient24_95,
  OriginalRow227TriangleData0374.coefficient24_96,
  OriginalRow227TriangleData0374.coefficient24_97,
  OriginalRow227TriangleData0374.coefficient24_98,
  OriginalRow227TriangleData0374.coefficient24_99,
  OriginalRow227TriangleData0374.coefficient24_100,
  OriginalRow227TriangleData0374.coefficient24_101,
  OriginalRow227TriangleData0374.coefficient24_102,
  OriginalRow227TriangleData0374.coefficient24_103,
  OriginalRow227TriangleData0374.coefficient24_104,
  OriginalRow227TriangleData0374.coefficient24_105,
  OriginalRow227TriangleData0374.coefficient24_106,
  OriginalRow227TriangleData0374.coefficient24_107,
  OriginalRow227TriangleData0374.coefficient24_108,
  OriginalRow227TriangleData0374.coefficient24_109,
  OriginalRow227TriangleData0374.coefficient24_110,
  OriginalRow227TriangleData0374.coefficient24_111,
  OriginalRow227TriangleData0374.coefficient24_112,
  OriginalRow227TriangleData0374.coefficient24_113,
  OriginalRow227TriangleData0374.coefficient24_114,
  OriginalRow227TriangleData0374.coefficient24_115,
  OriginalRow227TriangleData0374.coefficient24_116,
  OriginalRow227TriangleData0374.coefficient24_117,
  OriginalRow227TriangleData0374.coefficient24_118
]

theorem values0374_size : values0374.size = 32 := rfl

def block0374 : ℕ → Option IntervalDyadic := segment 87 values0374

theorem block0374_domain : ExactDomain block0374 87 119 := by
  simpa only [values0374_size] using segment_domain 87 values0374

theorem block0374_get (i : Fin 32) :
    block0374 (87 + i.val) = some (values0374[i.val]'(by rw [values0374_size]; exact i.isLt)) := by
  exact segment_get 87 values0374 ⟨i.val, by rw [values0374_size]; exact i.isLt⟩

def values0375 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0375.coefficient24_119,
  OriginalRow227TriangleData0375.coefficient24_120,
  OriginalRow227TriangleData0375.coefficient24_121,
  OriginalRow227TriangleData0375.coefficient24_122,
  OriginalRow227TriangleData0375.coefficient24_123,
  OriginalRow227TriangleData0375.coefficient24_124,
  OriginalRow227TriangleData0375.coefficient24_125,
  OriginalRow227TriangleData0375.coefficient24_126,
  OriginalRow227TriangleData0375.coefficient24_127,
  OriginalRow227TriangleData0375.coefficient24_128,
  OriginalRow227TriangleData0375.coefficient24_129,
  OriginalRow227TriangleData0375.coefficient24_130,
  OriginalRow227TriangleData0375.coefficient24_131,
  OriginalRow227TriangleData0375.coefficient24_132,
  OriginalRow227TriangleData0375.coefficient24_133,
  OriginalRow227TriangleData0375.coefficient24_134,
  OriginalRow227TriangleData0375.coefficient24_135,
  OriginalRow227TriangleData0375.coefficient24_136,
  OriginalRow227TriangleData0375.coefficient24_137,
  OriginalRow227TriangleData0375.coefficient24_138,
  OriginalRow227TriangleData0375.coefficient24_139,
  OriginalRow227TriangleData0375.coefficient24_140,
  OriginalRow227TriangleData0375.coefficient24_141,
  OriginalRow227TriangleData0375.coefficient24_142,
  OriginalRow227TriangleData0375.coefficient24_143,
  OriginalRow227TriangleData0375.coefficient24_144,
  OriginalRow227TriangleData0375.coefficient24_145,
  OriginalRow227TriangleData0375.coefficient24_146,
  OriginalRow227TriangleData0375.coefficient24_147,
  OriginalRow227TriangleData0375.coefficient24_148,
  OriginalRow227TriangleData0375.coefficient24_149,
  OriginalRow227TriangleData0375.coefficient24_150
]

theorem values0375_size : values0375.size = 32 := rfl

def block0375 : ℕ → Option IntervalDyadic := segment 119 values0375

theorem block0375_domain : ExactDomain block0375 119 151 := by
  simpa only [values0375_size] using segment_domain 119 values0375

theorem block0375_get (i : Fin 32) :
    block0375 (119 + i.val) = some (values0375[i.val]'(by rw [values0375_size]; exact i.isLt)) := by
  exact segment_get 119 values0375 ⟨i.val, by rw [values0375_size]; exact i.isLt⟩

def values0376 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0376.coefficient24_151,
  OriginalRow227TriangleData0376.coefficient24_152,
  OriginalRow227TriangleData0376.coefficient24_153,
  OriginalRow227TriangleData0376.coefficient24_154,
  OriginalRow227TriangleData0376.coefficient24_155,
  OriginalRow227TriangleData0376.coefficient24_156,
  OriginalRow227TriangleData0376.coefficient24_157,
  OriginalRow227TriangleData0376.coefficient24_158,
  OriginalRow227TriangleData0376.coefficient24_159,
  OriginalRow227TriangleData0376.coefficient24_160,
  OriginalRow227TriangleData0376.coefficient24_161,
  OriginalRow227TriangleData0376.coefficient24_162,
  OriginalRow227TriangleData0376.coefficient24_163,
  OriginalRow227TriangleData0376.coefficient24_164,
  OriginalRow227TriangleData0376.coefficient24_165,
  OriginalRow227TriangleData0376.coefficient24_166,
  OriginalRow227TriangleData0376.coefficient24_167,
  OriginalRow227TriangleData0376.coefficient24_168,
  OriginalRow227TriangleData0376.coefficient24_169,
  OriginalRow227TriangleData0376.coefficient24_170,
  OriginalRow227TriangleData0376.coefficient24_171,
  OriginalRow227TriangleData0376.coefficient24_172,
  OriginalRow227TriangleData0376.coefficient24_173,
  OriginalRow227TriangleData0376.coefficient24_174,
  OriginalRow227TriangleData0376.coefficient24_175,
  OriginalRow227TriangleData0376.coefficient24_176,
  OriginalRow227TriangleData0376.coefficient24_177,
  OriginalRow227TriangleData0376.coefficient24_178,
  OriginalRow227TriangleData0376.coefficient24_179,
  OriginalRow227TriangleData0376.coefficient24_180,
  OriginalRow227TriangleData0376.coefficient24_181,
  OriginalRow227TriangleData0376.coefficient24_182
]

theorem values0376_size : values0376.size = 32 := rfl

def block0376 : ℕ → Option IntervalDyadic := segment 151 values0376

theorem block0376_domain : ExactDomain block0376 151 183 := by
  simpa only [values0376_size] using segment_domain 151 values0376

theorem block0376_get (i : Fin 32) :
    block0376 (151 + i.val) = some (values0376[i.val]'(by rw [values0376_size]; exact i.isLt)) := by
  exact segment_get 151 values0376 ⟨i.val, by rw [values0376_size]; exact i.isLt⟩

def values0377 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0377.coefficient24_183,
  OriginalRow227TriangleData0377.coefficient24_184,
  OriginalRow227TriangleData0377.coefficient24_185,
  OriginalRow227TriangleData0377.coefficient24_186,
  OriginalRow227TriangleData0377.coefficient24_187,
  OriginalRow227TriangleData0377.coefficient24_188,
  OriginalRow227TriangleData0377.coefficient24_189,
  OriginalRow227TriangleData0377.coefficient24_190,
  OriginalRow227TriangleData0377.coefficient24_191,
  OriginalRow227TriangleData0377.coefficient24_192,
  OriginalRow227TriangleData0377.coefficient24_193,
  OriginalRow227TriangleData0377.coefficient24_194,
  OriginalRow227TriangleData0377.coefficient24_195,
  OriginalRow227TriangleData0377.coefficient24_196,
  OriginalRow227TriangleData0377.coefficient24_197,
  OriginalRow227TriangleData0377.coefficient24_198,
  OriginalRow227TriangleData0377.coefficient24_199,
  OriginalRow227TriangleData0377.coefficient24_200,
  OriginalRow227TriangleData0377.coefficient24_201,
  OriginalRow227TriangleData0377.coefficient24_202,
  OriginalRow227TriangleData0377.coefficient24_203,
  OriginalRow227TriangleData0377.coefficient24_204,
  OriginalRow227TriangleData0377.coefficient24_205,
  OriginalRow227TriangleData0377.coefficient24_206,
  OriginalRow227TriangleData0377.coefficient24_207,
  OriginalRow227TriangleData0377.coefficient24_208,
  OriginalRow227TriangleData0377.coefficient24_209,
  OriginalRow227TriangleData0377.coefficient24_210,
  OriginalRow227TriangleData0377.coefficient24_211,
  OriginalRow227TriangleData0377.coefficient24_212,
  OriginalRow227TriangleData0377.coefficient24_213,
  OriginalRow227TriangleData0377.coefficient24_214
]

theorem values0377_size : values0377.size = 32 := rfl

def block0377 : ℕ → Option IntervalDyadic := segment 183 values0377

theorem block0377_domain : ExactDomain block0377 183 215 := by
  simpa only [values0377_size] using segment_domain 183 values0377

theorem block0377_get (i : Fin 32) :
    block0377 (183 + i.val) = some (values0377[i.val]'(by rw [values0377_size]; exact i.isLt)) := by
  exact segment_get 183 values0377 ⟨i.val, by rw [values0377_size]; exact i.isLt⟩

def values0378 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0378.coefficient24_215,
  OriginalRow227TriangleData0378.coefficient24_216,
  OriginalRow227TriangleData0378.coefficient24_217,
  OriginalRow227TriangleData0378.coefficient24_218,
  OriginalRow227TriangleData0378.coefficient24_219,
  OriginalRow227TriangleData0378.coefficient24_220,
  OriginalRow227TriangleData0378.coefficient24_221,
  OriginalRow227TriangleData0378.coefficient24_222,
  OriginalRow227TriangleData0378.coefficient24_223,
  OriginalRow227TriangleData0378.coefficient24_224,
  OriginalRow227TriangleData0378.coefficient24_225,
  OriginalRow227TriangleData0378.coefficient24_226,
  OriginalRow227TriangleData0378.coefficient24_227,
  OriginalRow227TriangleData0378.coefficient24_228,
  OriginalRow227TriangleData0378.coefficient24_229,
  OriginalRow227TriangleData0378.coefficient24_230,
  OriginalRow227TriangleData0378.coefficient24_231,
  OriginalRow227TriangleData0378.coefficient24_232,
  OriginalRow227TriangleData0378.coefficient24_233,
  OriginalRow227TriangleData0378.coefficient24_234,
  OriginalRow227TriangleData0378.coefficient24_235,
  OriginalRow227TriangleData0378.coefficient24_236,
  OriginalRow227TriangleData0378.coefficient24_237,
  OriginalRow227TriangleData0378.coefficient24_238,
  OriginalRow227TriangleData0378.coefficient24_239,
  OriginalRow227TriangleData0378.coefficient24_240,
  OriginalRow227TriangleData0378.coefficient24_241,
  OriginalRow227TriangleData0378.coefficient24_242,
  OriginalRow227TriangleData0378.coefficient24_243,
  OriginalRow227TriangleData0378.coefficient24_244,
  OriginalRow227TriangleData0378.coefficient24_245,
  OriginalRow227TriangleData0378.coefficient24_246
]

theorem values0378_size : values0378.size = 32 := rfl

def block0378 : ℕ → Option IntervalDyadic := segment 215 values0378

theorem block0378_domain : ExactDomain block0378 215 247 := by
  simpa only [values0378_size] using segment_domain 215 values0378

theorem block0378_get (i : Fin 32) :
    block0378 (215 + i.val) = some (values0378[i.val]'(by rw [values0378_size]; exact i.isLt)) := by
  exact segment_get 215 values0378 ⟨i.val, by rw [values0378_size]; exact i.isLt⟩

def values0379 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0379.coefficient24_247,
  OriginalRow227TriangleData0379.coefficient24_248,
  OriginalRow227TriangleData0379.coefficient24_249,
  OriginalRow227TriangleData0379.coefficient24_250,
  OriginalRow227TriangleData0379.coefficient24_251,
  OriginalRow227TriangleData0379.coefficient24_252,
  OriginalRow227TriangleData0379.coefficient24_253,
  OriginalRow227TriangleData0379.coefficient24_254,
  OriginalRow227TriangleData0379.coefficient24_255,
  OriginalRow227TriangleData0379.coefficient24_256,
  OriginalRow227TriangleData0379.coefficient24_257,
  OriginalRow227TriangleData0379.coefficient24_258,
  OriginalRow227TriangleData0379.coefficient24_259,
  OriginalRow227TriangleData0379.coefficient24_260,
  OriginalRow227TriangleData0379.coefficient24_261,
  OriginalRow227TriangleData0379.coefficient24_262,
  OriginalRow227TriangleData0379.coefficient24_263,
  OriginalRow227TriangleData0379.coefficient24_264,
  OriginalRow227TriangleData0379.coefficient24_265,
  OriginalRow227TriangleData0379.coefficient24_266,
  OriginalRow227TriangleData0379.coefficient24_267,
  OriginalRow227TriangleData0379.coefficient24_268,
  OriginalRow227TriangleData0379.coefficient24_269,
  OriginalRow227TriangleData0379.coefficient24_270,
  OriginalRow227TriangleData0379.coefficient24_271,
  OriginalRow227TriangleData0379.coefficient24_272,
  OriginalRow227TriangleData0379.coefficient24_273,
  OriginalRow227TriangleData0379.coefficient24_274,
  OriginalRow227TriangleData0379.coefficient24_275,
  OriginalRow227TriangleData0379.coefficient24_276,
  OriginalRow227TriangleData0379.coefficient24_277,
  OriginalRow227TriangleData0379.coefficient24_278
]

theorem values0379_size : values0379.size = 32 := rfl

def block0379 : ℕ → Option IntervalDyadic := segment 247 values0379

theorem block0379_domain : ExactDomain block0379 247 279 := by
  simpa only [values0379_size] using segment_domain 247 values0379

theorem block0379_get (i : Fin 32) :
    block0379 (247 + i.val) = some (values0379[i.val]'(by rw [values0379_size]; exact i.isLt)) := by
  exact segment_get 247 values0379 ⟨i.val, by rw [values0379_size]; exact i.isLt⟩

def values0380 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0380.coefficient24_279,
  OriginalRow227TriangleData0380.coefficient24_280,
  OriginalRow227TriangleData0380.coefficient24_281,
  OriginalRow227TriangleData0380.coefficient24_282,
  OriginalRow227TriangleData0380.coefficient24_283,
  OriginalRow227TriangleData0380.coefficient24_284,
  OriginalRow227TriangleData0380.coefficient24_285,
  OriginalRow227TriangleData0380.coefficient24_286,
  OriginalRow227TriangleData0380.coefficient24_287,
  OriginalRow227TriangleData0380.coefficient24_288,
  OriginalRow227TriangleData0380.coefficient24_289,
  OriginalRow227TriangleData0380.coefficient24_290,
  OriginalRow227TriangleData0380.coefficient24_291,
  OriginalRow227TriangleData0380.coefficient24_292,
  OriginalRow227TriangleData0380.coefficient24_293,
  OriginalRow227TriangleData0380.coefficient24_294,
  OriginalRow227TriangleData0380.coefficient24_295,
  OriginalRow227TriangleData0380.coefficient24_296,
  OriginalRow227TriangleData0380.coefficient24_297,
  OriginalRow227TriangleData0380.coefficient24_298,
  OriginalRow227TriangleData0380.coefficient24_299,
  OriginalRow227TriangleData0380.coefficient24_300,
  OriginalRow227TriangleData0380.coefficient24_301,
  OriginalRow227TriangleData0380.coefficient24_302,
  OriginalRow227TriangleData0380.coefficient24_303,
  OriginalRow227TriangleData0380.coefficient24_304,
  OriginalRow227TriangleData0380.coefficient24_305,
  OriginalRow227TriangleData0380.coefficient24_306,
  OriginalRow227TriangleData0380.coefficient24_307,
  OriginalRow227TriangleData0380.coefficient24_308,
  OriginalRow227TriangleData0380.coefficient24_309,
  OriginalRow227TriangleData0380.coefficient24_310
]

theorem values0380_size : values0380.size = 32 := rfl

def block0380 : ℕ → Option IntervalDyadic := segment 279 values0380

theorem block0380_domain : ExactDomain block0380 279 311 := by
  simpa only [values0380_size] using segment_domain 279 values0380

theorem block0380_get (i : Fin 32) :
    block0380 (279 + i.val) = some (values0380[i.val]'(by rw [values0380_size]; exact i.isLt)) := by
  exact segment_get 279 values0380 ⟨i.val, by rw [values0380_size]; exact i.isLt⟩

def values0381 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0381.coefficient24_311,
  OriginalRow227TriangleData0381.coefficient24_312,
  OriginalRow227TriangleData0381.coefficient24_313,
  OriginalRow227TriangleData0381.coefficient24_314,
  OriginalRow227TriangleData0381.coefficient24_315,
  OriginalRow227TriangleData0381.coefficient24_316,
  OriginalRow227TriangleData0381.coefficient24_317,
  OriginalRow227TriangleData0381.coefficient24_318,
  OriginalRow227TriangleData0381.coefficient24_319,
  OriginalRow227TriangleData0381.coefficient24_320,
  OriginalRow227TriangleData0381.coefficient24_321,
  OriginalRow227TriangleData0381.coefficient24_322,
  OriginalRow227TriangleData0381.coefficient24_323,
  OriginalRow227TriangleData0381.coefficient24_324,
  OriginalRow227TriangleData0381.coefficient24_325,
  OriginalRow227TriangleData0381.coefficient24_326,
  OriginalRow227TriangleData0381.coefficient24_327,
  OriginalRow227TriangleData0381.coefficient24_328,
  OriginalRow227TriangleData0381.coefficient24_329,
  OriginalRow227TriangleData0381.coefficient24_330,
  OriginalRow227TriangleData0381.coefficient24_331,
  OriginalRow227TriangleData0381.coefficient24_332,
  OriginalRow227TriangleData0381.coefficient24_333,
  OriginalRow227TriangleData0381.coefficient24_334,
  OriginalRow227TriangleData0381.coefficient24_335,
  OriginalRow227TriangleData0381.coefficient24_336,
  OriginalRow227TriangleData0381.coefficient24_337,
  OriginalRow227TriangleData0381.coefficient24_338,
  OriginalRow227TriangleData0381.coefficient24_339,
  OriginalRow227TriangleData0381.coefficient24_340,
  OriginalRow227TriangleData0381.coefficient24_341,
  OriginalRow227TriangleData0381.coefficient24_342
]

theorem values0381_size : values0381.size = 32 := rfl

def block0381 : ℕ → Option IntervalDyadic := segment 311 values0381

theorem block0381_domain : ExactDomain block0381 311 343 := by
  simpa only [values0381_size] using segment_domain 311 values0381

theorem block0381_get (i : Fin 32) :
    block0381 (311 + i.val) = some (values0381[i.val]'(by rw [values0381_size]; exact i.isLt)) := by
  exact segment_get 311 values0381 ⟨i.val, by rw [values0381_size]; exact i.isLt⟩

def values0382 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0382.coefficient24_343,
  OriginalRow227TriangleData0382.coefficient24_344,
  OriginalRow227TriangleData0382.coefficient24_345,
  OriginalRow227TriangleData0382.coefficient24_346,
  OriginalRow227TriangleData0382.coefficient24_347,
  OriginalRow227TriangleData0382.coefficient24_348,
  OriginalRow227TriangleData0382.coefficient24_349,
  OriginalRow227TriangleData0382.coefficient24_350,
  OriginalRow227TriangleData0382.coefficient24_351,
  OriginalRow227TriangleData0382.coefficient24_352,
  OriginalRow227TriangleData0382.coefficient24_353,
  OriginalRow227TriangleData0382.coefficient24_354,
  OriginalRow227TriangleData0382.coefficient24_355,
  OriginalRow227TriangleData0382.coefficient24_356,
  OriginalRow227TriangleData0382.coefficient24_357,
  OriginalRow227TriangleData0382.coefficient24_358,
  OriginalRow227TriangleData0382.coefficient24_359,
  OriginalRow227TriangleData0382.coefficient24_360,
  OriginalRow227TriangleData0382.coefficient24_361,
  OriginalRow227TriangleData0382.coefficient24_362,
  OriginalRow227TriangleData0382.coefficient24_363,
  OriginalRow227TriangleData0382.coefficient24_364,
  OriginalRow227TriangleData0382.coefficient24_365,
  OriginalRow227TriangleData0382.coefficient24_366,
  OriginalRow227TriangleData0382.coefficient24_367,
  OriginalRow227TriangleData0382.coefficient24_368,
  OriginalRow227TriangleData0382.coefficient24_369,
  OriginalRow227TriangleData0382.coefficient24_370,
  OriginalRow227TriangleData0382.coefficient24_371,
  OriginalRow227TriangleData0382.coefficient24_372,
  OriginalRow227TriangleData0382.coefficient24_373,
  OriginalRow227TriangleData0382.coefficient24_374
]

theorem values0382_size : values0382.size = 32 := rfl

def block0382 : ℕ → Option IntervalDyadic := segment 343 values0382

theorem block0382_domain : ExactDomain block0382 343 375 := by
  simpa only [values0382_size] using segment_domain 343 values0382

theorem block0382_get (i : Fin 32) :
    block0382 (343 + i.val) = some (values0382[i.val]'(by rw [values0382_size]; exact i.isLt)) := by
  exact segment_get 343 values0382 ⟨i.val, by rw [values0382_size]; exact i.isLt⟩

def values0383 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0383.coefficient24_375,
  OriginalRow227TriangleData0383.coefficient24_376,
  OriginalRow227TriangleData0383.coefficient24_377,
  OriginalRow227TriangleData0383.coefficient24_378,
  OriginalRow227TriangleData0383.coefficient24_379,
  OriginalRow227TriangleData0383.coefficient24_380,
  OriginalRow227TriangleData0383.coefficient24_381,
  OriginalRow227TriangleData0383.coefficient24_382,
  OriginalRow227TriangleData0383.coefficient24_383,
  OriginalRow227TriangleData0383.coefficient24_384,
  OriginalRow227TriangleData0383.coefficient24_385,
  OriginalRow227TriangleData0383.coefficient24_386,
  OriginalRow227TriangleData0383.coefficient24_387,
  OriginalRow227TriangleData0383.coefficient24_388,
  OriginalRow227TriangleData0383.coefficient24_389,
  OriginalRow227TriangleData0383.coefficient24_390,
  OriginalRow227TriangleData0383.coefficient24_391,
  OriginalRow227TriangleData0383.coefficient24_392,
  OriginalRow227TriangleData0383.coefficient24_393,
  OriginalRow227TriangleData0383.coefficient24_394,
  OriginalRow227TriangleData0383.coefficient24_395,
  OriginalRow227TriangleData0383.coefficient24_396,
  OriginalRow227TriangleData0383.coefficient24_397,
  OriginalRow227TriangleData0383.coefficient24_398,
  OriginalRow227TriangleData0383.coefficient24_399,
  OriginalRow227TriangleData0383.coefficient24_400,
  OriginalRow227TriangleData0383.coefficient24_401,
  OriginalRow227TriangleData0383.coefficient24_402,
  OriginalRow227TriangleData0383.coefficient24_403,
  OriginalRow227TriangleData0383.coefficient24_404,
  OriginalRow227TriangleData0383.coefficient24_405,
  OriginalRow227TriangleData0383.coefficient24_406
]

theorem values0383_size : values0383.size = 32 := rfl

def block0383 : ℕ → Option IntervalDyadic := segment 375 values0383

theorem block0383_domain : ExactDomain block0383 375 407 := by
  simpa only [values0383_size] using segment_domain 375 values0383

theorem block0383_get (i : Fin 32) :
    block0383 (375 + i.val) = some (values0383[i.val]'(by rw [values0383_size]; exact i.isLt)) := by
  exact segment_get 375 values0383 ⟨i.val, by rw [values0383_size]; exact i.isLt⟩

def values0384 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0384.coefficient24_407,
  OriginalRow227TriangleData0384.coefficient24_408,
  OriginalRow227TriangleData0384.coefficient24_409,
  OriginalRow227TriangleData0384.coefficient24_410,
  OriginalRow227TriangleData0384.coefficient24_411,
  OriginalRow227TriangleData0384.coefficient24_412,
  OriginalRow227TriangleData0384.coefficient24_413,
  OriginalRow227TriangleData0384.coefficient24_414,
  OriginalRow227TriangleData0384.coefficient24_415,
  OriginalRow227TriangleData0384.coefficient24_416,
  OriginalRow227TriangleData0384.coefficient24_417,
  OriginalRow227TriangleData0384.coefficient24_418,
  OriginalRow227TriangleData0384.coefficient24_419,
  OriginalRow227TriangleData0384.coefficient24_420,
  OriginalRow227TriangleData0384.coefficient24_421,
  OriginalRow227TriangleData0384.coefficient24_422,
  OriginalRow227TriangleData0384.coefficient24_423,
  OriginalRow227TriangleData0384.coefficient24_424,
  OriginalRow227TriangleData0384.coefficient24_425,
  OriginalRow227TriangleData0384.coefficient24_426,
  OriginalRow227TriangleData0384.coefficient24_427,
  OriginalRow227TriangleData0384.coefficient24_428,
  OriginalRow227TriangleData0384.coefficient24_429,
  OriginalRow227TriangleData0384.coefficient24_430,
  OriginalRow227TriangleData0384.coefficient24_431,
  OriginalRow227TriangleData0384.coefficient24_432,
  OriginalRow227TriangleData0384.coefficient24_433,
  OriginalRow227TriangleData0384.coefficient24_434,
  OriginalRow227TriangleData0384.coefficient24_435,
  OriginalRow227TriangleData0384.coefficient24_436,
  OriginalRow227TriangleData0384.coefficient24_437,
  OriginalRow227TriangleData0384.coefficient24_438
]

theorem values0384_size : values0384.size = 32 := rfl

def block0384 : ℕ → Option IntervalDyadic := segment 407 values0384

theorem block0384_domain : ExactDomain block0384 407 439 := by
  simpa only [values0384_size] using segment_domain 407 values0384

theorem block0384_get (i : Fin 32) :
    block0384 (407 + i.val) = some (values0384[i.val]'(by rw [values0384_size]; exact i.isLt)) := by
  exact segment_get 407 values0384 ⟨i.val, by rw [values0384_size]; exact i.isLt⟩

def values0385 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0385.coefficient24_439,
  OriginalRow227TriangleData0385.coefficient24_440,
  OriginalRow227TriangleData0385.coefficient24_441,
  OriginalRow227TriangleData0385.coefficient24_442,
  OriginalRow227TriangleData0385.coefficient24_443,
  OriginalRow227TriangleData0385.coefficient24_444,
  OriginalRow227TriangleData0385.coefficient24_445,
  OriginalRow227TriangleData0385.coefficient24_446,
  OriginalRow227TriangleData0385.coefficient24_447,
  OriginalRow227TriangleData0385.coefficient24_448,
  OriginalRow227TriangleData0385.coefficient24_449,
  OriginalRow227TriangleData0385.coefficient24_450,
  OriginalRow227TriangleData0385.coefficient24_451,
  OriginalRow227TriangleData0385.coefficient24_452,
  OriginalRow227TriangleData0385.coefficient24_453,
  OriginalRow227TriangleData0385.coefficient24_454,
  OriginalRow227TriangleData0385.coefficient24_455,
  OriginalRow227TriangleData0385.coefficient24_456,
  OriginalRow227TriangleData0385.coefficient24_457,
  OriginalRow227TriangleData0385.coefficient24_458,
  OriginalRow227TriangleData0385.coefficient24_459,
  OriginalRow227TriangleData0385.coefficient24_460,
  OriginalRow227TriangleData0385.coefficient24_461,
  OriginalRow227TriangleData0385.coefficient24_462,
  OriginalRow227TriangleData0385.coefficient24_463,
  OriginalRow227TriangleData0385.coefficient24_464,
  OriginalRow227TriangleData0385.coefficient24_465,
  OriginalRow227TriangleData0385.coefficient24_466,
  OriginalRow227TriangleData0385.coefficient24_467,
  OriginalRow227TriangleData0385.coefficient24_468,
  OriginalRow227TriangleData0385.coefficient24_469,
  OriginalRow227TriangleData0385.coefficient24_470
]

theorem values0385_size : values0385.size = 32 := rfl

def block0385 : ℕ → Option IntervalDyadic := segment 439 values0385

theorem block0385_domain : ExactDomain block0385 439 471 := by
  simpa only [values0385_size] using segment_domain 439 values0385

theorem block0385_get (i : Fin 32) :
    block0385 (439 + i.val) = some (values0385[i.val]'(by rw [values0385_size]; exact i.isLt)) := by
  exact segment_get 439 values0385 ⟨i.val, by rw [values0385_size]; exact i.isLt⟩

def values0386 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0386.coefficient24_471,
  OriginalRow227TriangleData0386.coefficient24_472,
  OriginalRow227TriangleData0386.coefficient24_473,
  OriginalRow227TriangleData0386.coefficient24_474,
  OriginalRow227TriangleData0386.coefficient24_475,
  OriginalRow227TriangleData0386.coefficient24_476,
  OriginalRow227TriangleData0386.coefficient24_477
]

theorem values0386_size : values0386.size = 7 := rfl

def block0386 : ℕ → Option IntervalDyadic := segment 471 values0386

theorem block0386_domain : ExactDomain block0386 471 478 := by
  simpa only [values0386_size] using segment_domain 471 values0386

theorem block0386_get (i : Fin 7) :
    block0386 (471 + i.val) = some (values0386[i.val]'(by rw [values0386_size]; exact i.isLt)) := by
  exact segment_get 471 values0386 ⟨i.val, by rw [values0386_size]; exact i.isLt⟩

def node0055_0119 : ℕ → Option IntervalDyadic := split 87 block0373 block0374

theorem node0055_0119_domain : ExactDomain node0055_0119 55 119 := by
  exact split_domain (by decide) (by decide) block0373_domain block0374_domain

def node0023_0119 : ℕ → Option IntervalDyadic := split 55 block0372 node0055_0119

theorem node0023_0119_domain : ExactDomain node0023_0119 23 119 := by
  exact split_domain (by decide) (by decide) block0372_domain node0055_0119_domain

def node0119_0183 : ℕ → Option IntervalDyadic := split 151 block0375 block0376

theorem node0119_0183_domain : ExactDomain node0119_0183 119 183 := by
  exact split_domain (by decide) (by decide) block0375_domain block0376_domain

def node0183_0247 : ℕ → Option IntervalDyadic := split 215 block0377 block0378

theorem node0183_0247_domain : ExactDomain node0183_0247 183 247 := by
  exact split_domain (by decide) (by decide) block0377_domain block0378_domain

def node0119_0247 : ℕ → Option IntervalDyadic := split 183 node0119_0183 node0183_0247

theorem node0119_0247_domain : ExactDomain node0119_0247 119 247 := by
  exact split_domain (by decide) (by decide) node0119_0183_domain node0183_0247_domain

def node0023_0247 : ℕ → Option IntervalDyadic := split 119 node0023_0119 node0119_0247

theorem node0023_0247_domain : ExactDomain node0023_0247 23 247 := by
  exact split_domain (by decide) (by decide) node0023_0119_domain node0119_0247_domain

def node0247_0311 : ℕ → Option IntervalDyadic := split 279 block0379 block0380

theorem node0247_0311_domain : ExactDomain node0247_0311 247 311 := by
  exact split_domain (by decide) (by decide) block0379_domain block0380_domain

def node0311_0375 : ℕ → Option IntervalDyadic := split 343 block0381 block0382

theorem node0311_0375_domain : ExactDomain node0311_0375 311 375 := by
  exact split_domain (by decide) (by decide) block0381_domain block0382_domain

def node0247_0375 : ℕ → Option IntervalDyadic := split 311 node0247_0311 node0311_0375

theorem node0247_0375_domain : ExactDomain node0247_0375 247 375 := by
  exact split_domain (by decide) (by decide) node0247_0311_domain node0311_0375_domain

def node0375_0439 : ℕ → Option IntervalDyadic := split 407 block0383 block0384

theorem node0375_0439_domain : ExactDomain node0375_0439 375 439 := by
  exact split_domain (by decide) (by decide) block0383_domain block0384_domain

def node0439_0478 : ℕ → Option IntervalDyadic := split 471 block0385 block0386

theorem node0439_0478_domain : ExactDomain node0439_0478 439 478 := by
  exact split_domain (by decide) (by decide) block0385_domain block0386_domain

def node0375_0478 : ℕ → Option IntervalDyadic := split 439 node0375_0439 node0439_0478

theorem node0375_0478_domain : ExactDomain node0375_0478 375 478 := by
  exact split_domain (by decide) (by decide) node0375_0439_domain node0439_0478_domain

def node0247_0478 : ℕ → Option IntervalDyadic := split 375 node0247_0375 node0375_0478

theorem node0247_0478_domain : ExactDomain node0247_0478 247 478 := by
  exact split_domain (by decide) (by decide) node0247_0375_domain node0375_0478_domain

def node0023_0478 : ℕ → Option IntervalDyadic := split 247 node0023_0247 node0247_0478

theorem node0023_0478_domain : ExactDomain node0023_0478 23 478 := by
  exact split_domain (by decide) (by decide) node0023_0247_domain node0247_0478_domain

def lookup : ℕ → Option IntervalDyadic := node0023_0478

theorem lookup_domain : ExactDomain lookup 23 478 :=
  node0023_0478_domain

theorem block0372_lookup (i : Fin 32) :
    lookup (23 + i.val) = some (values0372[i.val]'(by rw [values0372_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (23 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_left 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0023_0119, split_left 55 block0372 node0055_0119 (by omega)]
  exact block0372_get i

theorem block0373_lookup (i : Fin 32) :
    lookup (55 + i.val) = some (values0373[i.val]'(by rw [values0373_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (55 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_left 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0023_0119, split_right 55 block0372 node0055_0119 (by omega)]
  rw [node0055_0119, split_left 87 block0373 block0374 (by omega)]
  exact block0373_get i

theorem block0374_lookup (i : Fin 32) :
    lookup (87 + i.val) = some (values0374[i.val]'(by rw [values0374_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (87 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_left 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0023_0119, split_right 55 block0372 node0055_0119 (by omega)]
  rw [node0055_0119, split_right 87 block0373 block0374 (by omega)]
  exact block0374_get i

theorem block0375_lookup (i : Fin 32) :
    lookup (119 + i.val) = some (values0375[i.val]'(by rw [values0375_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (119 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_right 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0119_0247, split_left 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0119_0183, split_left 151 block0375 block0376 (by omega)]
  exact block0375_get i

theorem block0376_lookup (i : Fin 32) :
    lookup (151 + i.val) = some (values0376[i.val]'(by rw [values0376_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (151 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_right 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0119_0247, split_left 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0119_0183, split_right 151 block0375 block0376 (by omega)]
  exact block0376_get i

theorem block0377_lookup (i : Fin 32) :
    lookup (183 + i.val) = some (values0377[i.val]'(by rw [values0377_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (183 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_right 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0119_0247, split_right 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0183_0247, split_left 215 block0377 block0378 (by omega)]
  exact block0377_get i

theorem block0378_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values0378[i.val]'(by rw [values0378_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (215 + i.val) = _
  rw [node0023_0478, split_left 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0023_0247, split_right 119 node0023_0119 node0119_0247 (by omega)]
  rw [node0119_0247, split_right 183 node0119_0183 node0183_0247 (by omega)]
  rw [node0183_0247, split_right 215 block0377 block0378 (by omega)]
  exact block0378_get i

theorem block0379_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values0379[i.val]'(by rw [values0379_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (247 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_left 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0247_0375, split_left 311 node0247_0311 node0311_0375 (by omega)]
  rw [node0247_0311, split_left 279 block0379 block0380 (by omega)]
  exact block0379_get i

theorem block0380_lookup (i : Fin 32) :
    lookup (279 + i.val) = some (values0380[i.val]'(by rw [values0380_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (279 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_left 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0247_0375, split_left 311 node0247_0311 node0311_0375 (by omega)]
  rw [node0247_0311, split_right 279 block0379 block0380 (by omega)]
  exact block0380_get i

theorem block0381_lookup (i : Fin 32) :
    lookup (311 + i.val) = some (values0381[i.val]'(by rw [values0381_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (311 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_left 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0247_0375, split_right 311 node0247_0311 node0311_0375 (by omega)]
  rw [node0311_0375, split_left 343 block0381 block0382 (by omega)]
  exact block0381_get i

theorem block0382_lookup (i : Fin 32) :
    lookup (343 + i.val) = some (values0382[i.val]'(by rw [values0382_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (343 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_left 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0247_0375, split_right 311 node0247_0311 node0311_0375 (by omega)]
  rw [node0311_0375, split_right 343 block0381 block0382 (by omega)]
  exact block0382_get i

theorem block0383_lookup (i : Fin 32) :
    lookup (375 + i.val) = some (values0383[i.val]'(by rw [values0383_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (375 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_right 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0375_0478, split_left 439 node0375_0439 node0439_0478 (by omega)]
  rw [node0375_0439, split_left 407 block0383 block0384 (by omega)]
  exact block0383_get i

theorem block0384_lookup (i : Fin 32) :
    lookup (407 + i.val) = some (values0384[i.val]'(by rw [values0384_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (407 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_right 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0375_0478, split_left 439 node0375_0439 node0439_0478 (by omega)]
  rw [node0375_0439, split_right 407 block0383 block0384 (by omega)]
  exact block0384_get i

theorem block0385_lookup (i : Fin 32) :
    lookup (439 + i.val) = some (values0385[i.val]'(by rw [values0385_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (439 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_right 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0375_0478, split_right 439 node0375_0439 node0439_0478 (by omega)]
  rw [node0439_0478, split_left 471 block0385 block0386 (by omega)]
  exact block0385_get i

theorem block0386_lookup (i : Fin 7) :
    lookup (471 + i.val) = some (values0386[i.val]'(by rw [values0386_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0023_0478 (471 + i.val) = _
  rw [node0023_0478, split_right 247 node0023_0247 node0247_0478 (by omega)]
  rw [node0247_0478, split_right 375 node0247_0375 node0375_0478 (by omega)]
  rw [node0375_0478, split_right 439 node0375_0439 node0439_0478 (by omega)]
  rw [node0439_0478, split_right 471 block0385 block0386 (by omega)]
  exact block0386_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0372_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0372_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0373_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0373_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0374_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0374_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0375_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0375_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0376_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0376_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0377_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0377_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0378_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0378_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0379_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0379_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0380_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0380_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0381_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0381_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0382_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0382_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0383_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0383_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0384_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0384_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0385_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0385_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0386_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0386_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0372_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0373_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0374_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0375_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0376_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0377_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0378_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0379_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0380_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0381_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0382_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0383_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0384_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0385_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow024.block0386_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow024
