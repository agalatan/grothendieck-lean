import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0312
import Grothe.UpperChaos.OriginalRow227TriangleData0313
import Grothe.UpperChaos.OriginalRow227TriangleData0314
import Grothe.UpperChaos.OriginalRow227TriangleData0315
import Grothe.UpperChaos.OriginalRow227TriangleData0316
import Grothe.UpperChaos.OriginalRow227TriangleData0317
import Grothe.UpperChaos.OriginalRow227TriangleData0318
import Grothe.UpperChaos.OriginalRow227TriangleData0319
import Grothe.UpperChaos.OriginalRow227TriangleData0320
import Grothe.UpperChaos.OriginalRow227TriangleData0321
import Grothe.UpperChaos.OriginalRow227TriangleData0322
import Grothe.UpperChaos.OriginalRow227TriangleData0323
import Grothe.UpperChaos.OriginalRow227TriangleData0324
import Grothe.UpperChaos.OriginalRow227TriangleData0325
import Grothe.UpperChaos.OriginalRow227TriangleData0326

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow020

open ConditionalTableLookup

def values0312 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0312.coefficient20_19,
  OriginalRow227TriangleData0312.coefficient20_20,
  OriginalRow227TriangleData0312.coefficient20_21,
  OriginalRow227TriangleData0312.coefficient20_22,
  OriginalRow227TriangleData0312.coefficient20_23,
  OriginalRow227TriangleData0312.coefficient20_24,
  OriginalRow227TriangleData0312.coefficient20_25,
  OriginalRow227TriangleData0312.coefficient20_26,
  OriginalRow227TriangleData0312.coefficient20_27,
  OriginalRow227TriangleData0312.coefficient20_28,
  OriginalRow227TriangleData0312.coefficient20_29,
  OriginalRow227TriangleData0312.coefficient20_30,
  OriginalRow227TriangleData0312.coefficient20_31,
  OriginalRow227TriangleData0312.coefficient20_32,
  OriginalRow227TriangleData0312.coefficient20_33,
  OriginalRow227TriangleData0312.coefficient20_34,
  OriginalRow227TriangleData0312.coefficient20_35,
  OriginalRow227TriangleData0312.coefficient20_36,
  OriginalRow227TriangleData0312.coefficient20_37,
  OriginalRow227TriangleData0312.coefficient20_38,
  OriginalRow227TriangleData0312.coefficient20_39,
  OriginalRow227TriangleData0312.coefficient20_40,
  OriginalRow227TriangleData0312.coefficient20_41,
  OriginalRow227TriangleData0312.coefficient20_42,
  OriginalRow227TriangleData0312.coefficient20_43,
  OriginalRow227TriangleData0312.coefficient20_44,
  OriginalRow227TriangleData0312.coefficient20_45,
  OriginalRow227TriangleData0312.coefficient20_46,
  OriginalRow227TriangleData0312.coefficient20_47,
  OriginalRow227TriangleData0312.coefficient20_48,
  OriginalRow227TriangleData0312.coefficient20_49,
  OriginalRow227TriangleData0312.coefficient20_50
]

theorem values0312_size : values0312.size = 32 := rfl

def block0312 : ℕ → Option IntervalDyadic := segment 19 values0312

theorem block0312_domain : ExactDomain block0312 19 51 := by
  simpa only [values0312_size] using segment_domain 19 values0312

theorem block0312_get (i : Fin 32) :
    block0312 (19 + i.val) = some (values0312[i.val]'(by rw [values0312_size]; exact i.isLt)) := by
  exact segment_get 19 values0312 ⟨i.val, by rw [values0312_size]; exact i.isLt⟩

def values0313 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0313.coefficient20_51,
  OriginalRow227TriangleData0313.coefficient20_52,
  OriginalRow227TriangleData0313.coefficient20_53,
  OriginalRow227TriangleData0313.coefficient20_54,
  OriginalRow227TriangleData0313.coefficient20_55,
  OriginalRow227TriangleData0313.coefficient20_56,
  OriginalRow227TriangleData0313.coefficient20_57,
  OriginalRow227TriangleData0313.coefficient20_58,
  OriginalRow227TriangleData0313.coefficient20_59,
  OriginalRow227TriangleData0313.coefficient20_60,
  OriginalRow227TriangleData0313.coefficient20_61,
  OriginalRow227TriangleData0313.coefficient20_62,
  OriginalRow227TriangleData0313.coefficient20_63,
  OriginalRow227TriangleData0313.coefficient20_64,
  OriginalRow227TriangleData0313.coefficient20_65,
  OriginalRow227TriangleData0313.coefficient20_66,
  OriginalRow227TriangleData0313.coefficient20_67,
  OriginalRow227TriangleData0313.coefficient20_68,
  OriginalRow227TriangleData0313.coefficient20_69,
  OriginalRow227TriangleData0313.coefficient20_70,
  OriginalRow227TriangleData0313.coefficient20_71,
  OriginalRow227TriangleData0313.coefficient20_72,
  OriginalRow227TriangleData0313.coefficient20_73,
  OriginalRow227TriangleData0313.coefficient20_74,
  OriginalRow227TriangleData0313.coefficient20_75,
  OriginalRow227TriangleData0313.coefficient20_76,
  OriginalRow227TriangleData0313.coefficient20_77,
  OriginalRow227TriangleData0313.coefficient20_78,
  OriginalRow227TriangleData0313.coefficient20_79,
  OriginalRow227TriangleData0313.coefficient20_80,
  OriginalRow227TriangleData0313.coefficient20_81,
  OriginalRow227TriangleData0313.coefficient20_82
]

theorem values0313_size : values0313.size = 32 := rfl

def block0313 : ℕ → Option IntervalDyadic := segment 51 values0313

theorem block0313_domain : ExactDomain block0313 51 83 := by
  simpa only [values0313_size] using segment_domain 51 values0313

theorem block0313_get (i : Fin 32) :
    block0313 (51 + i.val) = some (values0313[i.val]'(by rw [values0313_size]; exact i.isLt)) := by
  exact segment_get 51 values0313 ⟨i.val, by rw [values0313_size]; exact i.isLt⟩

def values0314 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0314.coefficient20_83,
  OriginalRow227TriangleData0314.coefficient20_84,
  OriginalRow227TriangleData0314.coefficient20_85,
  OriginalRow227TriangleData0314.coefficient20_86,
  OriginalRow227TriangleData0314.coefficient20_87,
  OriginalRow227TriangleData0314.coefficient20_88,
  OriginalRow227TriangleData0314.coefficient20_89,
  OriginalRow227TriangleData0314.coefficient20_90,
  OriginalRow227TriangleData0314.coefficient20_91,
  OriginalRow227TriangleData0314.coefficient20_92,
  OriginalRow227TriangleData0314.coefficient20_93,
  OriginalRow227TriangleData0314.coefficient20_94,
  OriginalRow227TriangleData0314.coefficient20_95,
  OriginalRow227TriangleData0314.coefficient20_96,
  OriginalRow227TriangleData0314.coefficient20_97,
  OriginalRow227TriangleData0314.coefficient20_98,
  OriginalRow227TriangleData0314.coefficient20_99,
  OriginalRow227TriangleData0314.coefficient20_100,
  OriginalRow227TriangleData0314.coefficient20_101,
  OriginalRow227TriangleData0314.coefficient20_102,
  OriginalRow227TriangleData0314.coefficient20_103,
  OriginalRow227TriangleData0314.coefficient20_104,
  OriginalRow227TriangleData0314.coefficient20_105,
  OriginalRow227TriangleData0314.coefficient20_106,
  OriginalRow227TriangleData0314.coefficient20_107,
  OriginalRow227TriangleData0314.coefficient20_108,
  OriginalRow227TriangleData0314.coefficient20_109,
  OriginalRow227TriangleData0314.coefficient20_110,
  OriginalRow227TriangleData0314.coefficient20_111,
  OriginalRow227TriangleData0314.coefficient20_112,
  OriginalRow227TriangleData0314.coefficient20_113,
  OriginalRow227TriangleData0314.coefficient20_114
]

theorem values0314_size : values0314.size = 32 := rfl

def block0314 : ℕ → Option IntervalDyadic := segment 83 values0314

theorem block0314_domain : ExactDomain block0314 83 115 := by
  simpa only [values0314_size] using segment_domain 83 values0314

theorem block0314_get (i : Fin 32) :
    block0314 (83 + i.val) = some (values0314[i.val]'(by rw [values0314_size]; exact i.isLt)) := by
  exact segment_get 83 values0314 ⟨i.val, by rw [values0314_size]; exact i.isLt⟩

def values0315 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0315.coefficient20_115,
  OriginalRow227TriangleData0315.coefficient20_116,
  OriginalRow227TriangleData0315.coefficient20_117,
  OriginalRow227TriangleData0315.coefficient20_118,
  OriginalRow227TriangleData0315.coefficient20_119,
  OriginalRow227TriangleData0315.coefficient20_120,
  OriginalRow227TriangleData0315.coefficient20_121,
  OriginalRow227TriangleData0315.coefficient20_122,
  OriginalRow227TriangleData0315.coefficient20_123,
  OriginalRow227TriangleData0315.coefficient20_124,
  OriginalRow227TriangleData0315.coefficient20_125,
  OriginalRow227TriangleData0315.coefficient20_126,
  OriginalRow227TriangleData0315.coefficient20_127,
  OriginalRow227TriangleData0315.coefficient20_128,
  OriginalRow227TriangleData0315.coefficient20_129,
  OriginalRow227TriangleData0315.coefficient20_130,
  OriginalRow227TriangleData0315.coefficient20_131,
  OriginalRow227TriangleData0315.coefficient20_132,
  OriginalRow227TriangleData0315.coefficient20_133,
  OriginalRow227TriangleData0315.coefficient20_134,
  OriginalRow227TriangleData0315.coefficient20_135,
  OriginalRow227TriangleData0315.coefficient20_136,
  OriginalRow227TriangleData0315.coefficient20_137,
  OriginalRow227TriangleData0315.coefficient20_138,
  OriginalRow227TriangleData0315.coefficient20_139,
  OriginalRow227TriangleData0315.coefficient20_140,
  OriginalRow227TriangleData0315.coefficient20_141,
  OriginalRow227TriangleData0315.coefficient20_142,
  OriginalRow227TriangleData0315.coefficient20_143,
  OriginalRow227TriangleData0315.coefficient20_144,
  OriginalRow227TriangleData0315.coefficient20_145,
  OriginalRow227TriangleData0315.coefficient20_146
]

theorem values0315_size : values0315.size = 32 := rfl

def block0315 : ℕ → Option IntervalDyadic := segment 115 values0315

theorem block0315_domain : ExactDomain block0315 115 147 := by
  simpa only [values0315_size] using segment_domain 115 values0315

theorem block0315_get (i : Fin 32) :
    block0315 (115 + i.val) = some (values0315[i.val]'(by rw [values0315_size]; exact i.isLt)) := by
  exact segment_get 115 values0315 ⟨i.val, by rw [values0315_size]; exact i.isLt⟩

def values0316 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0316.coefficient20_147,
  OriginalRow227TriangleData0316.coefficient20_148,
  OriginalRow227TriangleData0316.coefficient20_149,
  OriginalRow227TriangleData0316.coefficient20_150,
  OriginalRow227TriangleData0316.coefficient20_151,
  OriginalRow227TriangleData0316.coefficient20_152,
  OriginalRow227TriangleData0316.coefficient20_153,
  OriginalRow227TriangleData0316.coefficient20_154,
  OriginalRow227TriangleData0316.coefficient20_155,
  OriginalRow227TriangleData0316.coefficient20_156,
  OriginalRow227TriangleData0316.coefficient20_157,
  OriginalRow227TriangleData0316.coefficient20_158,
  OriginalRow227TriangleData0316.coefficient20_159,
  OriginalRow227TriangleData0316.coefficient20_160,
  OriginalRow227TriangleData0316.coefficient20_161,
  OriginalRow227TriangleData0316.coefficient20_162,
  OriginalRow227TriangleData0316.coefficient20_163,
  OriginalRow227TriangleData0316.coefficient20_164,
  OriginalRow227TriangleData0316.coefficient20_165,
  OriginalRow227TriangleData0316.coefficient20_166,
  OriginalRow227TriangleData0316.coefficient20_167,
  OriginalRow227TriangleData0316.coefficient20_168,
  OriginalRow227TriangleData0316.coefficient20_169,
  OriginalRow227TriangleData0316.coefficient20_170,
  OriginalRow227TriangleData0316.coefficient20_171,
  OriginalRow227TriangleData0316.coefficient20_172,
  OriginalRow227TriangleData0316.coefficient20_173,
  OriginalRow227TriangleData0316.coefficient20_174,
  OriginalRow227TriangleData0316.coefficient20_175,
  OriginalRow227TriangleData0316.coefficient20_176,
  OriginalRow227TriangleData0316.coefficient20_177,
  OriginalRow227TriangleData0316.coefficient20_178
]

theorem values0316_size : values0316.size = 32 := rfl

def block0316 : ℕ → Option IntervalDyadic := segment 147 values0316

theorem block0316_domain : ExactDomain block0316 147 179 := by
  simpa only [values0316_size] using segment_domain 147 values0316

theorem block0316_get (i : Fin 32) :
    block0316 (147 + i.val) = some (values0316[i.val]'(by rw [values0316_size]; exact i.isLt)) := by
  exact segment_get 147 values0316 ⟨i.val, by rw [values0316_size]; exact i.isLt⟩

def values0317 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0317.coefficient20_179,
  OriginalRow227TriangleData0317.coefficient20_180,
  OriginalRow227TriangleData0317.coefficient20_181,
  OriginalRow227TriangleData0317.coefficient20_182,
  OriginalRow227TriangleData0317.coefficient20_183,
  OriginalRow227TriangleData0317.coefficient20_184,
  OriginalRow227TriangleData0317.coefficient20_185,
  OriginalRow227TriangleData0317.coefficient20_186,
  OriginalRow227TriangleData0317.coefficient20_187,
  OriginalRow227TriangleData0317.coefficient20_188,
  OriginalRow227TriangleData0317.coefficient20_189,
  OriginalRow227TriangleData0317.coefficient20_190,
  OriginalRow227TriangleData0317.coefficient20_191,
  OriginalRow227TriangleData0317.coefficient20_192,
  OriginalRow227TriangleData0317.coefficient20_193,
  OriginalRow227TriangleData0317.coefficient20_194,
  OriginalRow227TriangleData0317.coefficient20_195,
  OriginalRow227TriangleData0317.coefficient20_196,
  OriginalRow227TriangleData0317.coefficient20_197,
  OriginalRow227TriangleData0317.coefficient20_198,
  OriginalRow227TriangleData0317.coefficient20_199,
  OriginalRow227TriangleData0317.coefficient20_200,
  OriginalRow227TriangleData0317.coefficient20_201,
  OriginalRow227TriangleData0317.coefficient20_202,
  OriginalRow227TriangleData0317.coefficient20_203,
  OriginalRow227TriangleData0317.coefficient20_204,
  OriginalRow227TriangleData0317.coefficient20_205,
  OriginalRow227TriangleData0317.coefficient20_206,
  OriginalRow227TriangleData0317.coefficient20_207,
  OriginalRow227TriangleData0317.coefficient20_208,
  OriginalRow227TriangleData0317.coefficient20_209,
  OriginalRow227TriangleData0317.coefficient20_210
]

theorem values0317_size : values0317.size = 32 := rfl

def block0317 : ℕ → Option IntervalDyadic := segment 179 values0317

theorem block0317_domain : ExactDomain block0317 179 211 := by
  simpa only [values0317_size] using segment_domain 179 values0317

theorem block0317_get (i : Fin 32) :
    block0317 (179 + i.val) = some (values0317[i.val]'(by rw [values0317_size]; exact i.isLt)) := by
  exact segment_get 179 values0317 ⟨i.val, by rw [values0317_size]; exact i.isLt⟩

def values0318 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0318.coefficient20_211,
  OriginalRow227TriangleData0318.coefficient20_212,
  OriginalRow227TriangleData0318.coefficient20_213,
  OriginalRow227TriangleData0318.coefficient20_214,
  OriginalRow227TriangleData0318.coefficient20_215,
  OriginalRow227TriangleData0318.coefficient20_216,
  OriginalRow227TriangleData0318.coefficient20_217,
  OriginalRow227TriangleData0318.coefficient20_218,
  OriginalRow227TriangleData0318.coefficient20_219,
  OriginalRow227TriangleData0318.coefficient20_220,
  OriginalRow227TriangleData0318.coefficient20_221,
  OriginalRow227TriangleData0318.coefficient20_222,
  OriginalRow227TriangleData0318.coefficient20_223,
  OriginalRow227TriangleData0318.coefficient20_224,
  OriginalRow227TriangleData0318.coefficient20_225,
  OriginalRow227TriangleData0318.coefficient20_226,
  OriginalRow227TriangleData0318.coefficient20_227,
  OriginalRow227TriangleData0318.coefficient20_228,
  OriginalRow227TriangleData0318.coefficient20_229,
  OriginalRow227TriangleData0318.coefficient20_230,
  OriginalRow227TriangleData0318.coefficient20_231,
  OriginalRow227TriangleData0318.coefficient20_232,
  OriginalRow227TriangleData0318.coefficient20_233,
  OriginalRow227TriangleData0318.coefficient20_234,
  OriginalRow227TriangleData0318.coefficient20_235,
  OriginalRow227TriangleData0318.coefficient20_236,
  OriginalRow227TriangleData0318.coefficient20_237,
  OriginalRow227TriangleData0318.coefficient20_238,
  OriginalRow227TriangleData0318.coefficient20_239,
  OriginalRow227TriangleData0318.coefficient20_240,
  OriginalRow227TriangleData0318.coefficient20_241,
  OriginalRow227TriangleData0318.coefficient20_242
]

theorem values0318_size : values0318.size = 32 := rfl

def block0318 : ℕ → Option IntervalDyadic := segment 211 values0318

theorem block0318_domain : ExactDomain block0318 211 243 := by
  simpa only [values0318_size] using segment_domain 211 values0318

theorem block0318_get (i : Fin 32) :
    block0318 (211 + i.val) = some (values0318[i.val]'(by rw [values0318_size]; exact i.isLt)) := by
  exact segment_get 211 values0318 ⟨i.val, by rw [values0318_size]; exact i.isLt⟩

def values0319 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0319.coefficient20_243,
  OriginalRow227TriangleData0319.coefficient20_244,
  OriginalRow227TriangleData0319.coefficient20_245,
  OriginalRow227TriangleData0319.coefficient20_246,
  OriginalRow227TriangleData0319.coefficient20_247,
  OriginalRow227TriangleData0319.coefficient20_248,
  OriginalRow227TriangleData0319.coefficient20_249,
  OriginalRow227TriangleData0319.coefficient20_250,
  OriginalRow227TriangleData0319.coefficient20_251,
  OriginalRow227TriangleData0319.coefficient20_252,
  OriginalRow227TriangleData0319.coefficient20_253,
  OriginalRow227TriangleData0319.coefficient20_254,
  OriginalRow227TriangleData0319.coefficient20_255,
  OriginalRow227TriangleData0319.coefficient20_256,
  OriginalRow227TriangleData0319.coefficient20_257,
  OriginalRow227TriangleData0319.coefficient20_258,
  OriginalRow227TriangleData0319.coefficient20_259,
  OriginalRow227TriangleData0319.coefficient20_260,
  OriginalRow227TriangleData0319.coefficient20_261,
  OriginalRow227TriangleData0319.coefficient20_262,
  OriginalRow227TriangleData0319.coefficient20_263,
  OriginalRow227TriangleData0319.coefficient20_264,
  OriginalRow227TriangleData0319.coefficient20_265,
  OriginalRow227TriangleData0319.coefficient20_266,
  OriginalRow227TriangleData0319.coefficient20_267,
  OriginalRow227TriangleData0319.coefficient20_268,
  OriginalRow227TriangleData0319.coefficient20_269,
  OriginalRow227TriangleData0319.coefficient20_270,
  OriginalRow227TriangleData0319.coefficient20_271,
  OriginalRow227TriangleData0319.coefficient20_272,
  OriginalRow227TriangleData0319.coefficient20_273,
  OriginalRow227TriangleData0319.coefficient20_274
]

theorem values0319_size : values0319.size = 32 := rfl

def block0319 : ℕ → Option IntervalDyadic := segment 243 values0319

theorem block0319_domain : ExactDomain block0319 243 275 := by
  simpa only [values0319_size] using segment_domain 243 values0319

theorem block0319_get (i : Fin 32) :
    block0319 (243 + i.val) = some (values0319[i.val]'(by rw [values0319_size]; exact i.isLt)) := by
  exact segment_get 243 values0319 ⟨i.val, by rw [values0319_size]; exact i.isLt⟩

def values0320 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0320.coefficient20_275,
  OriginalRow227TriangleData0320.coefficient20_276,
  OriginalRow227TriangleData0320.coefficient20_277,
  OriginalRow227TriangleData0320.coefficient20_278,
  OriginalRow227TriangleData0320.coefficient20_279,
  OriginalRow227TriangleData0320.coefficient20_280,
  OriginalRow227TriangleData0320.coefficient20_281,
  OriginalRow227TriangleData0320.coefficient20_282,
  OriginalRow227TriangleData0320.coefficient20_283,
  OriginalRow227TriangleData0320.coefficient20_284,
  OriginalRow227TriangleData0320.coefficient20_285,
  OriginalRow227TriangleData0320.coefficient20_286,
  OriginalRow227TriangleData0320.coefficient20_287,
  OriginalRow227TriangleData0320.coefficient20_288,
  OriginalRow227TriangleData0320.coefficient20_289,
  OriginalRow227TriangleData0320.coefficient20_290,
  OriginalRow227TriangleData0320.coefficient20_291,
  OriginalRow227TriangleData0320.coefficient20_292,
  OriginalRow227TriangleData0320.coefficient20_293,
  OriginalRow227TriangleData0320.coefficient20_294,
  OriginalRow227TriangleData0320.coefficient20_295,
  OriginalRow227TriangleData0320.coefficient20_296,
  OriginalRow227TriangleData0320.coefficient20_297,
  OriginalRow227TriangleData0320.coefficient20_298,
  OriginalRow227TriangleData0320.coefficient20_299,
  OriginalRow227TriangleData0320.coefficient20_300,
  OriginalRow227TriangleData0320.coefficient20_301,
  OriginalRow227TriangleData0320.coefficient20_302,
  OriginalRow227TriangleData0320.coefficient20_303,
  OriginalRow227TriangleData0320.coefficient20_304,
  OriginalRow227TriangleData0320.coefficient20_305,
  OriginalRow227TriangleData0320.coefficient20_306
]

theorem values0320_size : values0320.size = 32 := rfl

def block0320 : ℕ → Option IntervalDyadic := segment 275 values0320

theorem block0320_domain : ExactDomain block0320 275 307 := by
  simpa only [values0320_size] using segment_domain 275 values0320

theorem block0320_get (i : Fin 32) :
    block0320 (275 + i.val) = some (values0320[i.val]'(by rw [values0320_size]; exact i.isLt)) := by
  exact segment_get 275 values0320 ⟨i.val, by rw [values0320_size]; exact i.isLt⟩

def values0321 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0321.coefficient20_307,
  OriginalRow227TriangleData0321.coefficient20_308,
  OriginalRow227TriangleData0321.coefficient20_309,
  OriginalRow227TriangleData0321.coefficient20_310,
  OriginalRow227TriangleData0321.coefficient20_311,
  OriginalRow227TriangleData0321.coefficient20_312,
  OriginalRow227TriangleData0321.coefficient20_313,
  OriginalRow227TriangleData0321.coefficient20_314,
  OriginalRow227TriangleData0321.coefficient20_315,
  OriginalRow227TriangleData0321.coefficient20_316,
  OriginalRow227TriangleData0321.coefficient20_317,
  OriginalRow227TriangleData0321.coefficient20_318,
  OriginalRow227TriangleData0321.coefficient20_319,
  OriginalRow227TriangleData0321.coefficient20_320,
  OriginalRow227TriangleData0321.coefficient20_321,
  OriginalRow227TriangleData0321.coefficient20_322,
  OriginalRow227TriangleData0321.coefficient20_323,
  OriginalRow227TriangleData0321.coefficient20_324,
  OriginalRow227TriangleData0321.coefficient20_325,
  OriginalRow227TriangleData0321.coefficient20_326,
  OriginalRow227TriangleData0321.coefficient20_327,
  OriginalRow227TriangleData0321.coefficient20_328,
  OriginalRow227TriangleData0321.coefficient20_329,
  OriginalRow227TriangleData0321.coefficient20_330,
  OriginalRow227TriangleData0321.coefficient20_331,
  OriginalRow227TriangleData0321.coefficient20_332,
  OriginalRow227TriangleData0321.coefficient20_333,
  OriginalRow227TriangleData0321.coefficient20_334,
  OriginalRow227TriangleData0321.coefficient20_335,
  OriginalRow227TriangleData0321.coefficient20_336,
  OriginalRow227TriangleData0321.coefficient20_337,
  OriginalRow227TriangleData0321.coefficient20_338
]

theorem values0321_size : values0321.size = 32 := rfl

def block0321 : ℕ → Option IntervalDyadic := segment 307 values0321

theorem block0321_domain : ExactDomain block0321 307 339 := by
  simpa only [values0321_size] using segment_domain 307 values0321

theorem block0321_get (i : Fin 32) :
    block0321 (307 + i.val) = some (values0321[i.val]'(by rw [values0321_size]; exact i.isLt)) := by
  exact segment_get 307 values0321 ⟨i.val, by rw [values0321_size]; exact i.isLt⟩

def values0322 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0322.coefficient20_339,
  OriginalRow227TriangleData0322.coefficient20_340,
  OriginalRow227TriangleData0322.coefficient20_341,
  OriginalRow227TriangleData0322.coefficient20_342,
  OriginalRow227TriangleData0322.coefficient20_343,
  OriginalRow227TriangleData0322.coefficient20_344,
  OriginalRow227TriangleData0322.coefficient20_345,
  OriginalRow227TriangleData0322.coefficient20_346,
  OriginalRow227TriangleData0322.coefficient20_347,
  OriginalRow227TriangleData0322.coefficient20_348,
  OriginalRow227TriangleData0322.coefficient20_349,
  OriginalRow227TriangleData0322.coefficient20_350,
  OriginalRow227TriangleData0322.coefficient20_351,
  OriginalRow227TriangleData0322.coefficient20_352,
  OriginalRow227TriangleData0322.coefficient20_353,
  OriginalRow227TriangleData0322.coefficient20_354,
  OriginalRow227TriangleData0322.coefficient20_355,
  OriginalRow227TriangleData0322.coefficient20_356,
  OriginalRow227TriangleData0322.coefficient20_357,
  OriginalRow227TriangleData0322.coefficient20_358,
  OriginalRow227TriangleData0322.coefficient20_359,
  OriginalRow227TriangleData0322.coefficient20_360,
  OriginalRow227TriangleData0322.coefficient20_361,
  OriginalRow227TriangleData0322.coefficient20_362,
  OriginalRow227TriangleData0322.coefficient20_363,
  OriginalRow227TriangleData0322.coefficient20_364,
  OriginalRow227TriangleData0322.coefficient20_365,
  OriginalRow227TriangleData0322.coefficient20_366,
  OriginalRow227TriangleData0322.coefficient20_367,
  OriginalRow227TriangleData0322.coefficient20_368,
  OriginalRow227TriangleData0322.coefficient20_369,
  OriginalRow227TriangleData0322.coefficient20_370
]

theorem values0322_size : values0322.size = 32 := rfl

def block0322 : ℕ → Option IntervalDyadic := segment 339 values0322

theorem block0322_domain : ExactDomain block0322 339 371 := by
  simpa only [values0322_size] using segment_domain 339 values0322

theorem block0322_get (i : Fin 32) :
    block0322 (339 + i.val) = some (values0322[i.val]'(by rw [values0322_size]; exact i.isLt)) := by
  exact segment_get 339 values0322 ⟨i.val, by rw [values0322_size]; exact i.isLt⟩

def values0323 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0323.coefficient20_371,
  OriginalRow227TriangleData0323.coefficient20_372,
  OriginalRow227TriangleData0323.coefficient20_373,
  OriginalRow227TriangleData0323.coefficient20_374,
  OriginalRow227TriangleData0323.coefficient20_375,
  OriginalRow227TriangleData0323.coefficient20_376,
  OriginalRow227TriangleData0323.coefficient20_377,
  OriginalRow227TriangleData0323.coefficient20_378,
  OriginalRow227TriangleData0323.coefficient20_379,
  OriginalRow227TriangleData0323.coefficient20_380,
  OriginalRow227TriangleData0323.coefficient20_381,
  OriginalRow227TriangleData0323.coefficient20_382,
  OriginalRow227TriangleData0323.coefficient20_383,
  OriginalRow227TriangleData0323.coefficient20_384,
  OriginalRow227TriangleData0323.coefficient20_385,
  OriginalRow227TriangleData0323.coefficient20_386,
  OriginalRow227TriangleData0323.coefficient20_387,
  OriginalRow227TriangleData0323.coefficient20_388,
  OriginalRow227TriangleData0323.coefficient20_389,
  OriginalRow227TriangleData0323.coefficient20_390,
  OriginalRow227TriangleData0323.coefficient20_391,
  OriginalRow227TriangleData0323.coefficient20_392,
  OriginalRow227TriangleData0323.coefficient20_393,
  OriginalRow227TriangleData0323.coefficient20_394,
  OriginalRow227TriangleData0323.coefficient20_395,
  OriginalRow227TriangleData0323.coefficient20_396,
  OriginalRow227TriangleData0323.coefficient20_397,
  OriginalRow227TriangleData0323.coefficient20_398,
  OriginalRow227TriangleData0323.coefficient20_399,
  OriginalRow227TriangleData0323.coefficient20_400,
  OriginalRow227TriangleData0323.coefficient20_401,
  OriginalRow227TriangleData0323.coefficient20_402
]

theorem values0323_size : values0323.size = 32 := rfl

def block0323 : ℕ → Option IntervalDyadic := segment 371 values0323

theorem block0323_domain : ExactDomain block0323 371 403 := by
  simpa only [values0323_size] using segment_domain 371 values0323

theorem block0323_get (i : Fin 32) :
    block0323 (371 + i.val) = some (values0323[i.val]'(by rw [values0323_size]; exact i.isLt)) := by
  exact segment_get 371 values0323 ⟨i.val, by rw [values0323_size]; exact i.isLt⟩

def values0324 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0324.coefficient20_403,
  OriginalRow227TriangleData0324.coefficient20_404,
  OriginalRow227TriangleData0324.coefficient20_405,
  OriginalRow227TriangleData0324.coefficient20_406,
  OriginalRow227TriangleData0324.coefficient20_407,
  OriginalRow227TriangleData0324.coefficient20_408,
  OriginalRow227TriangleData0324.coefficient20_409,
  OriginalRow227TriangleData0324.coefficient20_410,
  OriginalRow227TriangleData0324.coefficient20_411,
  OriginalRow227TriangleData0324.coefficient20_412,
  OriginalRow227TriangleData0324.coefficient20_413,
  OriginalRow227TriangleData0324.coefficient20_414,
  OriginalRow227TriangleData0324.coefficient20_415,
  OriginalRow227TriangleData0324.coefficient20_416,
  OriginalRow227TriangleData0324.coefficient20_417,
  OriginalRow227TriangleData0324.coefficient20_418,
  OriginalRow227TriangleData0324.coefficient20_419,
  OriginalRow227TriangleData0324.coefficient20_420,
  OriginalRow227TriangleData0324.coefficient20_421,
  OriginalRow227TriangleData0324.coefficient20_422,
  OriginalRow227TriangleData0324.coefficient20_423,
  OriginalRow227TriangleData0324.coefficient20_424,
  OriginalRow227TriangleData0324.coefficient20_425,
  OriginalRow227TriangleData0324.coefficient20_426,
  OriginalRow227TriangleData0324.coefficient20_427,
  OriginalRow227TriangleData0324.coefficient20_428,
  OriginalRow227TriangleData0324.coefficient20_429,
  OriginalRow227TriangleData0324.coefficient20_430,
  OriginalRow227TriangleData0324.coefficient20_431,
  OriginalRow227TriangleData0324.coefficient20_432,
  OriginalRow227TriangleData0324.coefficient20_433,
  OriginalRow227TriangleData0324.coefficient20_434
]

theorem values0324_size : values0324.size = 32 := rfl

def block0324 : ℕ → Option IntervalDyadic := segment 403 values0324

theorem block0324_domain : ExactDomain block0324 403 435 := by
  simpa only [values0324_size] using segment_domain 403 values0324

theorem block0324_get (i : Fin 32) :
    block0324 (403 + i.val) = some (values0324[i.val]'(by rw [values0324_size]; exact i.isLt)) := by
  exact segment_get 403 values0324 ⟨i.val, by rw [values0324_size]; exact i.isLt⟩

def values0325 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0325.coefficient20_435,
  OriginalRow227TriangleData0325.coefficient20_436,
  OriginalRow227TriangleData0325.coefficient20_437,
  OriginalRow227TriangleData0325.coefficient20_438,
  OriginalRow227TriangleData0325.coefficient20_439,
  OriginalRow227TriangleData0325.coefficient20_440,
  OriginalRow227TriangleData0325.coefficient20_441,
  OriginalRow227TriangleData0325.coefficient20_442,
  OriginalRow227TriangleData0325.coefficient20_443,
  OriginalRow227TriangleData0325.coefficient20_444,
  OriginalRow227TriangleData0325.coefficient20_445,
  OriginalRow227TriangleData0325.coefficient20_446,
  OriginalRow227TriangleData0325.coefficient20_447,
  OriginalRow227TriangleData0325.coefficient20_448,
  OriginalRow227TriangleData0325.coefficient20_449,
  OriginalRow227TriangleData0325.coefficient20_450,
  OriginalRow227TriangleData0325.coefficient20_451,
  OriginalRow227TriangleData0325.coefficient20_452,
  OriginalRow227TriangleData0325.coefficient20_453,
  OriginalRow227TriangleData0325.coefficient20_454,
  OriginalRow227TriangleData0325.coefficient20_455,
  OriginalRow227TriangleData0325.coefficient20_456,
  OriginalRow227TriangleData0325.coefficient20_457,
  OriginalRow227TriangleData0325.coefficient20_458,
  OriginalRow227TriangleData0325.coefficient20_459,
  OriginalRow227TriangleData0325.coefficient20_460,
  OriginalRow227TriangleData0325.coefficient20_461,
  OriginalRow227TriangleData0325.coefficient20_462,
  OriginalRow227TriangleData0325.coefficient20_463,
  OriginalRow227TriangleData0325.coefficient20_464,
  OriginalRow227TriangleData0325.coefficient20_465,
  OriginalRow227TriangleData0325.coefficient20_466
]

theorem values0325_size : values0325.size = 32 := rfl

def block0325 : ℕ → Option IntervalDyadic := segment 435 values0325

theorem block0325_domain : ExactDomain block0325 435 467 := by
  simpa only [values0325_size] using segment_domain 435 values0325

theorem block0325_get (i : Fin 32) :
    block0325 (435 + i.val) = some (values0325[i.val]'(by rw [values0325_size]; exact i.isLt)) := by
  exact segment_get 435 values0325 ⟨i.val, by rw [values0325_size]; exact i.isLt⟩

def values0326 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0326.coefficient20_467,
  OriginalRow227TriangleData0326.coefficient20_468,
  OriginalRow227TriangleData0326.coefficient20_469,
  OriginalRow227TriangleData0326.coefficient20_470,
  OriginalRow227TriangleData0326.coefficient20_471,
  OriginalRow227TriangleData0326.coefficient20_472,
  OriginalRow227TriangleData0326.coefficient20_473,
  OriginalRow227TriangleData0326.coefficient20_474,
  OriginalRow227TriangleData0326.coefficient20_475,
  OriginalRow227TriangleData0326.coefficient20_476,
  OriginalRow227TriangleData0326.coefficient20_477,
  OriginalRow227TriangleData0326.coefficient20_478,
  OriginalRow227TriangleData0326.coefficient20_479,
  OriginalRow227TriangleData0326.coefficient20_480,
  OriginalRow227TriangleData0326.coefficient20_481
]

theorem values0326_size : values0326.size = 15 := rfl

def block0326 : ℕ → Option IntervalDyadic := segment 467 values0326

theorem block0326_domain : ExactDomain block0326 467 482 := by
  simpa only [values0326_size] using segment_domain 467 values0326

theorem block0326_get (i : Fin 15) :
    block0326 (467 + i.val) = some (values0326[i.val]'(by rw [values0326_size]; exact i.isLt)) := by
  exact segment_get 467 values0326 ⟨i.val, by rw [values0326_size]; exact i.isLt⟩

def node0051_0115 : ℕ → Option IntervalDyadic := split 83 block0313 block0314

theorem node0051_0115_domain : ExactDomain node0051_0115 51 115 := by
  exact split_domain (by decide) (by decide) block0313_domain block0314_domain

def node0019_0115 : ℕ → Option IntervalDyadic := split 51 block0312 node0051_0115

theorem node0019_0115_domain : ExactDomain node0019_0115 19 115 := by
  exact split_domain (by decide) (by decide) block0312_domain node0051_0115_domain

def node0115_0179 : ℕ → Option IntervalDyadic := split 147 block0315 block0316

theorem node0115_0179_domain : ExactDomain node0115_0179 115 179 := by
  exact split_domain (by decide) (by decide) block0315_domain block0316_domain

def node0179_0243 : ℕ → Option IntervalDyadic := split 211 block0317 block0318

theorem node0179_0243_domain : ExactDomain node0179_0243 179 243 := by
  exact split_domain (by decide) (by decide) block0317_domain block0318_domain

def node0115_0243 : ℕ → Option IntervalDyadic := split 179 node0115_0179 node0179_0243

theorem node0115_0243_domain : ExactDomain node0115_0243 115 243 := by
  exact split_domain (by decide) (by decide) node0115_0179_domain node0179_0243_domain

def node0019_0243 : ℕ → Option IntervalDyadic := split 115 node0019_0115 node0115_0243

theorem node0019_0243_domain : ExactDomain node0019_0243 19 243 := by
  exact split_domain (by decide) (by decide) node0019_0115_domain node0115_0243_domain

def node0243_0307 : ℕ → Option IntervalDyadic := split 275 block0319 block0320

theorem node0243_0307_domain : ExactDomain node0243_0307 243 307 := by
  exact split_domain (by decide) (by decide) block0319_domain block0320_domain

def node0307_0371 : ℕ → Option IntervalDyadic := split 339 block0321 block0322

theorem node0307_0371_domain : ExactDomain node0307_0371 307 371 := by
  exact split_domain (by decide) (by decide) block0321_domain block0322_domain

def node0243_0371 : ℕ → Option IntervalDyadic := split 307 node0243_0307 node0307_0371

theorem node0243_0371_domain : ExactDomain node0243_0371 243 371 := by
  exact split_domain (by decide) (by decide) node0243_0307_domain node0307_0371_domain

def node0371_0435 : ℕ → Option IntervalDyadic := split 403 block0323 block0324

theorem node0371_0435_domain : ExactDomain node0371_0435 371 435 := by
  exact split_domain (by decide) (by decide) block0323_domain block0324_domain

def node0435_0482 : ℕ → Option IntervalDyadic := split 467 block0325 block0326

theorem node0435_0482_domain : ExactDomain node0435_0482 435 482 := by
  exact split_domain (by decide) (by decide) block0325_domain block0326_domain

def node0371_0482 : ℕ → Option IntervalDyadic := split 435 node0371_0435 node0435_0482

theorem node0371_0482_domain : ExactDomain node0371_0482 371 482 := by
  exact split_domain (by decide) (by decide) node0371_0435_domain node0435_0482_domain

def node0243_0482 : ℕ → Option IntervalDyadic := split 371 node0243_0371 node0371_0482

theorem node0243_0482_domain : ExactDomain node0243_0482 243 482 := by
  exact split_domain (by decide) (by decide) node0243_0371_domain node0371_0482_domain

def node0019_0482 : ℕ → Option IntervalDyadic := split 243 node0019_0243 node0243_0482

theorem node0019_0482_domain : ExactDomain node0019_0482 19 482 := by
  exact split_domain (by decide) (by decide) node0019_0243_domain node0243_0482_domain

def lookup : ℕ → Option IntervalDyadic := node0019_0482

theorem lookup_domain : ExactDomain lookup 19 482 :=
  node0019_0482_domain

theorem block0312_lookup (i : Fin 32) :
    lookup (19 + i.val) = some (values0312[i.val]'(by rw [values0312_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (19 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_left 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0019_0115, split_left 51 block0312 node0051_0115 (by omega)]
  exact block0312_get i

theorem block0313_lookup (i : Fin 32) :
    lookup (51 + i.val) = some (values0313[i.val]'(by rw [values0313_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (51 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_left 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0019_0115, split_right 51 block0312 node0051_0115 (by omega)]
  rw [node0051_0115, split_left 83 block0313 block0314 (by omega)]
  exact block0313_get i

theorem block0314_lookup (i : Fin 32) :
    lookup (83 + i.val) = some (values0314[i.val]'(by rw [values0314_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (83 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_left 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0019_0115, split_right 51 block0312 node0051_0115 (by omega)]
  rw [node0051_0115, split_right 83 block0313 block0314 (by omega)]
  exact block0314_get i

theorem block0315_lookup (i : Fin 32) :
    lookup (115 + i.val) = some (values0315[i.val]'(by rw [values0315_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (115 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_right 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0115_0243, split_left 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0115_0179, split_left 147 block0315 block0316 (by omega)]
  exact block0315_get i

theorem block0316_lookup (i : Fin 32) :
    lookup (147 + i.val) = some (values0316[i.val]'(by rw [values0316_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (147 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_right 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0115_0243, split_left 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0115_0179, split_right 147 block0315 block0316 (by omega)]
  exact block0316_get i

theorem block0317_lookup (i : Fin 32) :
    lookup (179 + i.val) = some (values0317[i.val]'(by rw [values0317_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (179 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_right 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0115_0243, split_right 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0179_0243, split_left 211 block0317 block0318 (by omega)]
  exact block0317_get i

theorem block0318_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values0318[i.val]'(by rw [values0318_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (211 + i.val) = _
  rw [node0019_0482, split_left 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0019_0243, split_right 115 node0019_0115 node0115_0243 (by omega)]
  rw [node0115_0243, split_right 179 node0115_0179 node0179_0243 (by omega)]
  rw [node0179_0243, split_right 211 block0317 block0318 (by omega)]
  exact block0318_get i

theorem block0319_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values0319[i.val]'(by rw [values0319_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (243 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_left 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0243_0371, split_left 307 node0243_0307 node0307_0371 (by omega)]
  rw [node0243_0307, split_left 275 block0319 block0320 (by omega)]
  exact block0319_get i

theorem block0320_lookup (i : Fin 32) :
    lookup (275 + i.val) = some (values0320[i.val]'(by rw [values0320_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (275 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_left 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0243_0371, split_left 307 node0243_0307 node0307_0371 (by omega)]
  rw [node0243_0307, split_right 275 block0319 block0320 (by omega)]
  exact block0320_get i

theorem block0321_lookup (i : Fin 32) :
    lookup (307 + i.val) = some (values0321[i.val]'(by rw [values0321_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (307 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_left 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0243_0371, split_right 307 node0243_0307 node0307_0371 (by omega)]
  rw [node0307_0371, split_left 339 block0321 block0322 (by omega)]
  exact block0321_get i

theorem block0322_lookup (i : Fin 32) :
    lookup (339 + i.val) = some (values0322[i.val]'(by rw [values0322_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (339 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_left 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0243_0371, split_right 307 node0243_0307 node0307_0371 (by omega)]
  rw [node0307_0371, split_right 339 block0321 block0322 (by omega)]
  exact block0322_get i

theorem block0323_lookup (i : Fin 32) :
    lookup (371 + i.val) = some (values0323[i.val]'(by rw [values0323_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (371 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_right 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0371_0482, split_left 435 node0371_0435 node0435_0482 (by omega)]
  rw [node0371_0435, split_left 403 block0323 block0324 (by omega)]
  exact block0323_get i

theorem block0324_lookup (i : Fin 32) :
    lookup (403 + i.val) = some (values0324[i.val]'(by rw [values0324_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (403 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_right 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0371_0482, split_left 435 node0371_0435 node0435_0482 (by omega)]
  rw [node0371_0435, split_right 403 block0323 block0324 (by omega)]
  exact block0324_get i

theorem block0325_lookup (i : Fin 32) :
    lookup (435 + i.val) = some (values0325[i.val]'(by rw [values0325_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (435 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_right 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0371_0482, split_right 435 node0371_0435 node0435_0482 (by omega)]
  rw [node0435_0482, split_left 467 block0325 block0326 (by omega)]
  exact block0325_get i

theorem block0326_lookup (i : Fin 15) :
    lookup (467 + i.val) = some (values0326[i.val]'(by rw [values0326_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0019_0482 (467 + i.val) = _
  rw [node0019_0482, split_right 243 node0019_0243 node0243_0482 (by omega)]
  rw [node0243_0482, split_right 371 node0243_0371 node0371_0482 (by omega)]
  rw [node0371_0482, split_right 435 node0371_0435 node0435_0482 (by omega)]
  rw [node0435_0482, split_right 467 block0325 block0326 (by omega)]
  exact block0326_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0312_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0312_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0313_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0313_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0314_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0314_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0315_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0315_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0316_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0316_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0317_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0317_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0318_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0318_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0319_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0319_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0320_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0320_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0321_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0321_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0322_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0322_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0323_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0323_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0324_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0324_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0325_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0325_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0326_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0326_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0312_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0313_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0314_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0315_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0316_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0317_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0318_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0319_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0320_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0321_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0322_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0323_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0324_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0325_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow020.block0326_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow020
