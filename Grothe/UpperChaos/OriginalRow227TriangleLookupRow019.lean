import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0297
import Grothe.UpperChaos.OriginalRow227TriangleData0298
import Grothe.UpperChaos.OriginalRow227TriangleData0299
import Grothe.UpperChaos.OriginalRow227TriangleData0300
import Grothe.UpperChaos.OriginalRow227TriangleData0301
import Grothe.UpperChaos.OriginalRow227TriangleData0302
import Grothe.UpperChaos.OriginalRow227TriangleData0303
import Grothe.UpperChaos.OriginalRow227TriangleData0304
import Grothe.UpperChaos.OriginalRow227TriangleData0305
import Grothe.UpperChaos.OriginalRow227TriangleData0306
import Grothe.UpperChaos.OriginalRow227TriangleData0307
import Grothe.UpperChaos.OriginalRow227TriangleData0308
import Grothe.UpperChaos.OriginalRow227TriangleData0309
import Grothe.UpperChaos.OriginalRow227TriangleData0310
import Grothe.UpperChaos.OriginalRow227TriangleData0311

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow019

open ConditionalTableLookup

def values0297 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0297.coefficient19_18,
  OriginalRow227TriangleData0297.coefficient19_19,
  OriginalRow227TriangleData0297.coefficient19_20,
  OriginalRow227TriangleData0297.coefficient19_21,
  OriginalRow227TriangleData0297.coefficient19_22,
  OriginalRow227TriangleData0297.coefficient19_23,
  OriginalRow227TriangleData0297.coefficient19_24,
  OriginalRow227TriangleData0297.coefficient19_25,
  OriginalRow227TriangleData0297.coefficient19_26,
  OriginalRow227TriangleData0297.coefficient19_27,
  OriginalRow227TriangleData0297.coefficient19_28,
  OriginalRow227TriangleData0297.coefficient19_29,
  OriginalRow227TriangleData0297.coefficient19_30,
  OriginalRow227TriangleData0297.coefficient19_31,
  OriginalRow227TriangleData0297.coefficient19_32,
  OriginalRow227TriangleData0297.coefficient19_33,
  OriginalRow227TriangleData0297.coefficient19_34,
  OriginalRow227TriangleData0297.coefficient19_35,
  OriginalRow227TriangleData0297.coefficient19_36,
  OriginalRow227TriangleData0297.coefficient19_37,
  OriginalRow227TriangleData0297.coefficient19_38,
  OriginalRow227TriangleData0297.coefficient19_39,
  OriginalRow227TriangleData0297.coefficient19_40,
  OriginalRow227TriangleData0297.coefficient19_41,
  OriginalRow227TriangleData0297.coefficient19_42,
  OriginalRow227TriangleData0297.coefficient19_43,
  OriginalRow227TriangleData0297.coefficient19_44,
  OriginalRow227TriangleData0297.coefficient19_45,
  OriginalRow227TriangleData0297.coefficient19_46,
  OriginalRow227TriangleData0297.coefficient19_47,
  OriginalRow227TriangleData0297.coefficient19_48,
  OriginalRow227TriangleData0297.coefficient19_49
]

theorem values0297_size : values0297.size = 32 := rfl

def block0297 : ℕ → Option IntervalDyadic := segment 18 values0297

theorem block0297_domain : ExactDomain block0297 18 50 := by
  simpa only [values0297_size] using segment_domain 18 values0297

theorem block0297_get (i : Fin 32) :
    block0297 (18 + i.val) = some (values0297[i.val]'(by rw [values0297_size]; exact i.isLt)) := by
  exact segment_get 18 values0297 ⟨i.val, by rw [values0297_size]; exact i.isLt⟩

def values0298 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0298.coefficient19_50,
  OriginalRow227TriangleData0298.coefficient19_51,
  OriginalRow227TriangleData0298.coefficient19_52,
  OriginalRow227TriangleData0298.coefficient19_53,
  OriginalRow227TriangleData0298.coefficient19_54,
  OriginalRow227TriangleData0298.coefficient19_55,
  OriginalRow227TriangleData0298.coefficient19_56,
  OriginalRow227TriangleData0298.coefficient19_57,
  OriginalRow227TriangleData0298.coefficient19_58,
  OriginalRow227TriangleData0298.coefficient19_59,
  OriginalRow227TriangleData0298.coefficient19_60,
  OriginalRow227TriangleData0298.coefficient19_61,
  OriginalRow227TriangleData0298.coefficient19_62,
  OriginalRow227TriangleData0298.coefficient19_63,
  OriginalRow227TriangleData0298.coefficient19_64,
  OriginalRow227TriangleData0298.coefficient19_65,
  OriginalRow227TriangleData0298.coefficient19_66,
  OriginalRow227TriangleData0298.coefficient19_67,
  OriginalRow227TriangleData0298.coefficient19_68,
  OriginalRow227TriangleData0298.coefficient19_69,
  OriginalRow227TriangleData0298.coefficient19_70,
  OriginalRow227TriangleData0298.coefficient19_71,
  OriginalRow227TriangleData0298.coefficient19_72,
  OriginalRow227TriangleData0298.coefficient19_73,
  OriginalRow227TriangleData0298.coefficient19_74,
  OriginalRow227TriangleData0298.coefficient19_75,
  OriginalRow227TriangleData0298.coefficient19_76,
  OriginalRow227TriangleData0298.coefficient19_77,
  OriginalRow227TriangleData0298.coefficient19_78,
  OriginalRow227TriangleData0298.coefficient19_79,
  OriginalRow227TriangleData0298.coefficient19_80,
  OriginalRow227TriangleData0298.coefficient19_81
]

theorem values0298_size : values0298.size = 32 := rfl

def block0298 : ℕ → Option IntervalDyadic := segment 50 values0298

theorem block0298_domain : ExactDomain block0298 50 82 := by
  simpa only [values0298_size] using segment_domain 50 values0298

theorem block0298_get (i : Fin 32) :
    block0298 (50 + i.val) = some (values0298[i.val]'(by rw [values0298_size]; exact i.isLt)) := by
  exact segment_get 50 values0298 ⟨i.val, by rw [values0298_size]; exact i.isLt⟩

def values0299 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0299.coefficient19_82,
  OriginalRow227TriangleData0299.coefficient19_83,
  OriginalRow227TriangleData0299.coefficient19_84,
  OriginalRow227TriangleData0299.coefficient19_85,
  OriginalRow227TriangleData0299.coefficient19_86,
  OriginalRow227TriangleData0299.coefficient19_87,
  OriginalRow227TriangleData0299.coefficient19_88,
  OriginalRow227TriangleData0299.coefficient19_89,
  OriginalRow227TriangleData0299.coefficient19_90,
  OriginalRow227TriangleData0299.coefficient19_91,
  OriginalRow227TriangleData0299.coefficient19_92,
  OriginalRow227TriangleData0299.coefficient19_93,
  OriginalRow227TriangleData0299.coefficient19_94,
  OriginalRow227TriangleData0299.coefficient19_95,
  OriginalRow227TriangleData0299.coefficient19_96,
  OriginalRow227TriangleData0299.coefficient19_97,
  OriginalRow227TriangleData0299.coefficient19_98,
  OriginalRow227TriangleData0299.coefficient19_99,
  OriginalRow227TriangleData0299.coefficient19_100,
  OriginalRow227TriangleData0299.coefficient19_101,
  OriginalRow227TriangleData0299.coefficient19_102,
  OriginalRow227TriangleData0299.coefficient19_103,
  OriginalRow227TriangleData0299.coefficient19_104,
  OriginalRow227TriangleData0299.coefficient19_105,
  OriginalRow227TriangleData0299.coefficient19_106,
  OriginalRow227TriangleData0299.coefficient19_107,
  OriginalRow227TriangleData0299.coefficient19_108,
  OriginalRow227TriangleData0299.coefficient19_109,
  OriginalRow227TriangleData0299.coefficient19_110,
  OriginalRow227TriangleData0299.coefficient19_111,
  OriginalRow227TriangleData0299.coefficient19_112,
  OriginalRow227TriangleData0299.coefficient19_113
]

theorem values0299_size : values0299.size = 32 := rfl

def block0299 : ℕ → Option IntervalDyadic := segment 82 values0299

theorem block0299_domain : ExactDomain block0299 82 114 := by
  simpa only [values0299_size] using segment_domain 82 values0299

theorem block0299_get (i : Fin 32) :
    block0299 (82 + i.val) = some (values0299[i.val]'(by rw [values0299_size]; exact i.isLt)) := by
  exact segment_get 82 values0299 ⟨i.val, by rw [values0299_size]; exact i.isLt⟩

def values0300 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0300.coefficient19_114,
  OriginalRow227TriangleData0300.coefficient19_115,
  OriginalRow227TriangleData0300.coefficient19_116,
  OriginalRow227TriangleData0300.coefficient19_117,
  OriginalRow227TriangleData0300.coefficient19_118,
  OriginalRow227TriangleData0300.coefficient19_119,
  OriginalRow227TriangleData0300.coefficient19_120,
  OriginalRow227TriangleData0300.coefficient19_121,
  OriginalRow227TriangleData0300.coefficient19_122,
  OriginalRow227TriangleData0300.coefficient19_123,
  OriginalRow227TriangleData0300.coefficient19_124,
  OriginalRow227TriangleData0300.coefficient19_125,
  OriginalRow227TriangleData0300.coefficient19_126,
  OriginalRow227TriangleData0300.coefficient19_127,
  OriginalRow227TriangleData0300.coefficient19_128,
  OriginalRow227TriangleData0300.coefficient19_129,
  OriginalRow227TriangleData0300.coefficient19_130,
  OriginalRow227TriangleData0300.coefficient19_131,
  OriginalRow227TriangleData0300.coefficient19_132,
  OriginalRow227TriangleData0300.coefficient19_133,
  OriginalRow227TriangleData0300.coefficient19_134,
  OriginalRow227TriangleData0300.coefficient19_135,
  OriginalRow227TriangleData0300.coefficient19_136,
  OriginalRow227TriangleData0300.coefficient19_137,
  OriginalRow227TriangleData0300.coefficient19_138,
  OriginalRow227TriangleData0300.coefficient19_139,
  OriginalRow227TriangleData0300.coefficient19_140,
  OriginalRow227TriangleData0300.coefficient19_141,
  OriginalRow227TriangleData0300.coefficient19_142,
  OriginalRow227TriangleData0300.coefficient19_143,
  OriginalRow227TriangleData0300.coefficient19_144,
  OriginalRow227TriangleData0300.coefficient19_145
]

theorem values0300_size : values0300.size = 32 := rfl

def block0300 : ℕ → Option IntervalDyadic := segment 114 values0300

theorem block0300_domain : ExactDomain block0300 114 146 := by
  simpa only [values0300_size] using segment_domain 114 values0300

theorem block0300_get (i : Fin 32) :
    block0300 (114 + i.val) = some (values0300[i.val]'(by rw [values0300_size]; exact i.isLt)) := by
  exact segment_get 114 values0300 ⟨i.val, by rw [values0300_size]; exact i.isLt⟩

def values0301 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0301.coefficient19_146,
  OriginalRow227TriangleData0301.coefficient19_147,
  OriginalRow227TriangleData0301.coefficient19_148,
  OriginalRow227TriangleData0301.coefficient19_149,
  OriginalRow227TriangleData0301.coefficient19_150,
  OriginalRow227TriangleData0301.coefficient19_151,
  OriginalRow227TriangleData0301.coefficient19_152,
  OriginalRow227TriangleData0301.coefficient19_153,
  OriginalRow227TriangleData0301.coefficient19_154,
  OriginalRow227TriangleData0301.coefficient19_155,
  OriginalRow227TriangleData0301.coefficient19_156,
  OriginalRow227TriangleData0301.coefficient19_157,
  OriginalRow227TriangleData0301.coefficient19_158,
  OriginalRow227TriangleData0301.coefficient19_159,
  OriginalRow227TriangleData0301.coefficient19_160,
  OriginalRow227TriangleData0301.coefficient19_161,
  OriginalRow227TriangleData0301.coefficient19_162,
  OriginalRow227TriangleData0301.coefficient19_163,
  OriginalRow227TriangleData0301.coefficient19_164,
  OriginalRow227TriangleData0301.coefficient19_165,
  OriginalRow227TriangleData0301.coefficient19_166,
  OriginalRow227TriangleData0301.coefficient19_167,
  OriginalRow227TriangleData0301.coefficient19_168,
  OriginalRow227TriangleData0301.coefficient19_169,
  OriginalRow227TriangleData0301.coefficient19_170,
  OriginalRow227TriangleData0301.coefficient19_171,
  OriginalRow227TriangleData0301.coefficient19_172,
  OriginalRow227TriangleData0301.coefficient19_173,
  OriginalRow227TriangleData0301.coefficient19_174,
  OriginalRow227TriangleData0301.coefficient19_175,
  OriginalRow227TriangleData0301.coefficient19_176,
  OriginalRow227TriangleData0301.coefficient19_177
]

theorem values0301_size : values0301.size = 32 := rfl

def block0301 : ℕ → Option IntervalDyadic := segment 146 values0301

theorem block0301_domain : ExactDomain block0301 146 178 := by
  simpa only [values0301_size] using segment_domain 146 values0301

theorem block0301_get (i : Fin 32) :
    block0301 (146 + i.val) = some (values0301[i.val]'(by rw [values0301_size]; exact i.isLt)) := by
  exact segment_get 146 values0301 ⟨i.val, by rw [values0301_size]; exact i.isLt⟩

def values0302 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0302.coefficient19_178,
  OriginalRow227TriangleData0302.coefficient19_179,
  OriginalRow227TriangleData0302.coefficient19_180,
  OriginalRow227TriangleData0302.coefficient19_181,
  OriginalRow227TriangleData0302.coefficient19_182,
  OriginalRow227TriangleData0302.coefficient19_183,
  OriginalRow227TriangleData0302.coefficient19_184,
  OriginalRow227TriangleData0302.coefficient19_185,
  OriginalRow227TriangleData0302.coefficient19_186,
  OriginalRow227TriangleData0302.coefficient19_187,
  OriginalRow227TriangleData0302.coefficient19_188,
  OriginalRow227TriangleData0302.coefficient19_189,
  OriginalRow227TriangleData0302.coefficient19_190,
  OriginalRow227TriangleData0302.coefficient19_191,
  OriginalRow227TriangleData0302.coefficient19_192,
  OriginalRow227TriangleData0302.coefficient19_193,
  OriginalRow227TriangleData0302.coefficient19_194,
  OriginalRow227TriangleData0302.coefficient19_195,
  OriginalRow227TriangleData0302.coefficient19_196,
  OriginalRow227TriangleData0302.coefficient19_197,
  OriginalRow227TriangleData0302.coefficient19_198,
  OriginalRow227TriangleData0302.coefficient19_199,
  OriginalRow227TriangleData0302.coefficient19_200,
  OriginalRow227TriangleData0302.coefficient19_201,
  OriginalRow227TriangleData0302.coefficient19_202,
  OriginalRow227TriangleData0302.coefficient19_203,
  OriginalRow227TriangleData0302.coefficient19_204,
  OriginalRow227TriangleData0302.coefficient19_205,
  OriginalRow227TriangleData0302.coefficient19_206,
  OriginalRow227TriangleData0302.coefficient19_207,
  OriginalRow227TriangleData0302.coefficient19_208,
  OriginalRow227TriangleData0302.coefficient19_209
]

theorem values0302_size : values0302.size = 32 := rfl

def block0302 : ℕ → Option IntervalDyadic := segment 178 values0302

theorem block0302_domain : ExactDomain block0302 178 210 := by
  simpa only [values0302_size] using segment_domain 178 values0302

theorem block0302_get (i : Fin 32) :
    block0302 (178 + i.val) = some (values0302[i.val]'(by rw [values0302_size]; exact i.isLt)) := by
  exact segment_get 178 values0302 ⟨i.val, by rw [values0302_size]; exact i.isLt⟩

def values0303 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0303.coefficient19_210,
  OriginalRow227TriangleData0303.coefficient19_211,
  OriginalRow227TriangleData0303.coefficient19_212,
  OriginalRow227TriangleData0303.coefficient19_213,
  OriginalRow227TriangleData0303.coefficient19_214,
  OriginalRow227TriangleData0303.coefficient19_215,
  OriginalRow227TriangleData0303.coefficient19_216,
  OriginalRow227TriangleData0303.coefficient19_217,
  OriginalRow227TriangleData0303.coefficient19_218,
  OriginalRow227TriangleData0303.coefficient19_219,
  OriginalRow227TriangleData0303.coefficient19_220,
  OriginalRow227TriangleData0303.coefficient19_221,
  OriginalRow227TriangleData0303.coefficient19_222,
  OriginalRow227TriangleData0303.coefficient19_223,
  OriginalRow227TriangleData0303.coefficient19_224,
  OriginalRow227TriangleData0303.coefficient19_225,
  OriginalRow227TriangleData0303.coefficient19_226,
  OriginalRow227TriangleData0303.coefficient19_227,
  OriginalRow227TriangleData0303.coefficient19_228,
  OriginalRow227TriangleData0303.coefficient19_229,
  OriginalRow227TriangleData0303.coefficient19_230,
  OriginalRow227TriangleData0303.coefficient19_231,
  OriginalRow227TriangleData0303.coefficient19_232,
  OriginalRow227TriangleData0303.coefficient19_233,
  OriginalRow227TriangleData0303.coefficient19_234,
  OriginalRow227TriangleData0303.coefficient19_235,
  OriginalRow227TriangleData0303.coefficient19_236,
  OriginalRow227TriangleData0303.coefficient19_237,
  OriginalRow227TriangleData0303.coefficient19_238,
  OriginalRow227TriangleData0303.coefficient19_239,
  OriginalRow227TriangleData0303.coefficient19_240,
  OriginalRow227TriangleData0303.coefficient19_241
]

theorem values0303_size : values0303.size = 32 := rfl

def block0303 : ℕ → Option IntervalDyadic := segment 210 values0303

theorem block0303_domain : ExactDomain block0303 210 242 := by
  simpa only [values0303_size] using segment_domain 210 values0303

theorem block0303_get (i : Fin 32) :
    block0303 (210 + i.val) = some (values0303[i.val]'(by rw [values0303_size]; exact i.isLt)) := by
  exact segment_get 210 values0303 ⟨i.val, by rw [values0303_size]; exact i.isLt⟩

def values0304 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0304.coefficient19_242,
  OriginalRow227TriangleData0304.coefficient19_243,
  OriginalRow227TriangleData0304.coefficient19_244,
  OriginalRow227TriangleData0304.coefficient19_245,
  OriginalRow227TriangleData0304.coefficient19_246,
  OriginalRow227TriangleData0304.coefficient19_247,
  OriginalRow227TriangleData0304.coefficient19_248,
  OriginalRow227TriangleData0304.coefficient19_249,
  OriginalRow227TriangleData0304.coefficient19_250,
  OriginalRow227TriangleData0304.coefficient19_251,
  OriginalRow227TriangleData0304.coefficient19_252,
  OriginalRow227TriangleData0304.coefficient19_253,
  OriginalRow227TriangleData0304.coefficient19_254,
  OriginalRow227TriangleData0304.coefficient19_255,
  OriginalRow227TriangleData0304.coefficient19_256,
  OriginalRow227TriangleData0304.coefficient19_257,
  OriginalRow227TriangleData0304.coefficient19_258,
  OriginalRow227TriangleData0304.coefficient19_259,
  OriginalRow227TriangleData0304.coefficient19_260,
  OriginalRow227TriangleData0304.coefficient19_261,
  OriginalRow227TriangleData0304.coefficient19_262,
  OriginalRow227TriangleData0304.coefficient19_263,
  OriginalRow227TriangleData0304.coefficient19_264,
  OriginalRow227TriangleData0304.coefficient19_265,
  OriginalRow227TriangleData0304.coefficient19_266,
  OriginalRow227TriangleData0304.coefficient19_267,
  OriginalRow227TriangleData0304.coefficient19_268,
  OriginalRow227TriangleData0304.coefficient19_269,
  OriginalRow227TriangleData0304.coefficient19_270,
  OriginalRow227TriangleData0304.coefficient19_271,
  OriginalRow227TriangleData0304.coefficient19_272,
  OriginalRow227TriangleData0304.coefficient19_273
]

theorem values0304_size : values0304.size = 32 := rfl

def block0304 : ℕ → Option IntervalDyadic := segment 242 values0304

theorem block0304_domain : ExactDomain block0304 242 274 := by
  simpa only [values0304_size] using segment_domain 242 values0304

theorem block0304_get (i : Fin 32) :
    block0304 (242 + i.val) = some (values0304[i.val]'(by rw [values0304_size]; exact i.isLt)) := by
  exact segment_get 242 values0304 ⟨i.val, by rw [values0304_size]; exact i.isLt⟩

def values0305 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0305.coefficient19_274,
  OriginalRow227TriangleData0305.coefficient19_275,
  OriginalRow227TriangleData0305.coefficient19_276,
  OriginalRow227TriangleData0305.coefficient19_277,
  OriginalRow227TriangleData0305.coefficient19_278,
  OriginalRow227TriangleData0305.coefficient19_279,
  OriginalRow227TriangleData0305.coefficient19_280,
  OriginalRow227TriangleData0305.coefficient19_281,
  OriginalRow227TriangleData0305.coefficient19_282,
  OriginalRow227TriangleData0305.coefficient19_283,
  OriginalRow227TriangleData0305.coefficient19_284,
  OriginalRow227TriangleData0305.coefficient19_285,
  OriginalRow227TriangleData0305.coefficient19_286,
  OriginalRow227TriangleData0305.coefficient19_287,
  OriginalRow227TriangleData0305.coefficient19_288,
  OriginalRow227TriangleData0305.coefficient19_289,
  OriginalRow227TriangleData0305.coefficient19_290,
  OriginalRow227TriangleData0305.coefficient19_291,
  OriginalRow227TriangleData0305.coefficient19_292,
  OriginalRow227TriangleData0305.coefficient19_293,
  OriginalRow227TriangleData0305.coefficient19_294,
  OriginalRow227TriangleData0305.coefficient19_295,
  OriginalRow227TriangleData0305.coefficient19_296,
  OriginalRow227TriangleData0305.coefficient19_297,
  OriginalRow227TriangleData0305.coefficient19_298,
  OriginalRow227TriangleData0305.coefficient19_299,
  OriginalRow227TriangleData0305.coefficient19_300,
  OriginalRow227TriangleData0305.coefficient19_301,
  OriginalRow227TriangleData0305.coefficient19_302,
  OriginalRow227TriangleData0305.coefficient19_303,
  OriginalRow227TriangleData0305.coefficient19_304,
  OriginalRow227TriangleData0305.coefficient19_305
]

theorem values0305_size : values0305.size = 32 := rfl

def block0305 : ℕ → Option IntervalDyadic := segment 274 values0305

theorem block0305_domain : ExactDomain block0305 274 306 := by
  simpa only [values0305_size] using segment_domain 274 values0305

theorem block0305_get (i : Fin 32) :
    block0305 (274 + i.val) = some (values0305[i.val]'(by rw [values0305_size]; exact i.isLt)) := by
  exact segment_get 274 values0305 ⟨i.val, by rw [values0305_size]; exact i.isLt⟩

def values0306 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0306.coefficient19_306,
  OriginalRow227TriangleData0306.coefficient19_307,
  OriginalRow227TriangleData0306.coefficient19_308,
  OriginalRow227TriangleData0306.coefficient19_309,
  OriginalRow227TriangleData0306.coefficient19_310,
  OriginalRow227TriangleData0306.coefficient19_311,
  OriginalRow227TriangleData0306.coefficient19_312,
  OriginalRow227TriangleData0306.coefficient19_313,
  OriginalRow227TriangleData0306.coefficient19_314,
  OriginalRow227TriangleData0306.coefficient19_315,
  OriginalRow227TriangleData0306.coefficient19_316,
  OriginalRow227TriangleData0306.coefficient19_317,
  OriginalRow227TriangleData0306.coefficient19_318,
  OriginalRow227TriangleData0306.coefficient19_319,
  OriginalRow227TriangleData0306.coefficient19_320,
  OriginalRow227TriangleData0306.coefficient19_321,
  OriginalRow227TriangleData0306.coefficient19_322,
  OriginalRow227TriangleData0306.coefficient19_323,
  OriginalRow227TriangleData0306.coefficient19_324,
  OriginalRow227TriangleData0306.coefficient19_325,
  OriginalRow227TriangleData0306.coefficient19_326,
  OriginalRow227TriangleData0306.coefficient19_327,
  OriginalRow227TriangleData0306.coefficient19_328,
  OriginalRow227TriangleData0306.coefficient19_329,
  OriginalRow227TriangleData0306.coefficient19_330,
  OriginalRow227TriangleData0306.coefficient19_331,
  OriginalRow227TriangleData0306.coefficient19_332,
  OriginalRow227TriangleData0306.coefficient19_333,
  OriginalRow227TriangleData0306.coefficient19_334,
  OriginalRow227TriangleData0306.coefficient19_335,
  OriginalRow227TriangleData0306.coefficient19_336,
  OriginalRow227TriangleData0306.coefficient19_337
]

theorem values0306_size : values0306.size = 32 := rfl

def block0306 : ℕ → Option IntervalDyadic := segment 306 values0306

theorem block0306_domain : ExactDomain block0306 306 338 := by
  simpa only [values0306_size] using segment_domain 306 values0306

theorem block0306_get (i : Fin 32) :
    block0306 (306 + i.val) = some (values0306[i.val]'(by rw [values0306_size]; exact i.isLt)) := by
  exact segment_get 306 values0306 ⟨i.val, by rw [values0306_size]; exact i.isLt⟩

def values0307 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0307.coefficient19_338,
  OriginalRow227TriangleData0307.coefficient19_339,
  OriginalRow227TriangleData0307.coefficient19_340,
  OriginalRow227TriangleData0307.coefficient19_341,
  OriginalRow227TriangleData0307.coefficient19_342,
  OriginalRow227TriangleData0307.coefficient19_343,
  OriginalRow227TriangleData0307.coefficient19_344,
  OriginalRow227TriangleData0307.coefficient19_345,
  OriginalRow227TriangleData0307.coefficient19_346,
  OriginalRow227TriangleData0307.coefficient19_347,
  OriginalRow227TriangleData0307.coefficient19_348,
  OriginalRow227TriangleData0307.coefficient19_349,
  OriginalRow227TriangleData0307.coefficient19_350,
  OriginalRow227TriangleData0307.coefficient19_351,
  OriginalRow227TriangleData0307.coefficient19_352,
  OriginalRow227TriangleData0307.coefficient19_353,
  OriginalRow227TriangleData0307.coefficient19_354,
  OriginalRow227TriangleData0307.coefficient19_355,
  OriginalRow227TriangleData0307.coefficient19_356,
  OriginalRow227TriangleData0307.coefficient19_357,
  OriginalRow227TriangleData0307.coefficient19_358,
  OriginalRow227TriangleData0307.coefficient19_359,
  OriginalRow227TriangleData0307.coefficient19_360,
  OriginalRow227TriangleData0307.coefficient19_361,
  OriginalRow227TriangleData0307.coefficient19_362,
  OriginalRow227TriangleData0307.coefficient19_363,
  OriginalRow227TriangleData0307.coefficient19_364,
  OriginalRow227TriangleData0307.coefficient19_365,
  OriginalRow227TriangleData0307.coefficient19_366,
  OriginalRow227TriangleData0307.coefficient19_367,
  OriginalRow227TriangleData0307.coefficient19_368,
  OriginalRow227TriangleData0307.coefficient19_369
]

theorem values0307_size : values0307.size = 32 := rfl

def block0307 : ℕ → Option IntervalDyadic := segment 338 values0307

theorem block0307_domain : ExactDomain block0307 338 370 := by
  simpa only [values0307_size] using segment_domain 338 values0307

theorem block0307_get (i : Fin 32) :
    block0307 (338 + i.val) = some (values0307[i.val]'(by rw [values0307_size]; exact i.isLt)) := by
  exact segment_get 338 values0307 ⟨i.val, by rw [values0307_size]; exact i.isLt⟩

def values0308 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0308.coefficient19_370,
  OriginalRow227TriangleData0308.coefficient19_371,
  OriginalRow227TriangleData0308.coefficient19_372,
  OriginalRow227TriangleData0308.coefficient19_373,
  OriginalRow227TriangleData0308.coefficient19_374,
  OriginalRow227TriangleData0308.coefficient19_375,
  OriginalRow227TriangleData0308.coefficient19_376,
  OriginalRow227TriangleData0308.coefficient19_377,
  OriginalRow227TriangleData0308.coefficient19_378,
  OriginalRow227TriangleData0308.coefficient19_379,
  OriginalRow227TriangleData0308.coefficient19_380,
  OriginalRow227TriangleData0308.coefficient19_381,
  OriginalRow227TriangleData0308.coefficient19_382,
  OriginalRow227TriangleData0308.coefficient19_383,
  OriginalRow227TriangleData0308.coefficient19_384,
  OriginalRow227TriangleData0308.coefficient19_385,
  OriginalRow227TriangleData0308.coefficient19_386,
  OriginalRow227TriangleData0308.coefficient19_387,
  OriginalRow227TriangleData0308.coefficient19_388,
  OriginalRow227TriangleData0308.coefficient19_389,
  OriginalRow227TriangleData0308.coefficient19_390,
  OriginalRow227TriangleData0308.coefficient19_391,
  OriginalRow227TriangleData0308.coefficient19_392,
  OriginalRow227TriangleData0308.coefficient19_393,
  OriginalRow227TriangleData0308.coefficient19_394,
  OriginalRow227TriangleData0308.coefficient19_395,
  OriginalRow227TriangleData0308.coefficient19_396,
  OriginalRow227TriangleData0308.coefficient19_397,
  OriginalRow227TriangleData0308.coefficient19_398,
  OriginalRow227TriangleData0308.coefficient19_399,
  OriginalRow227TriangleData0308.coefficient19_400,
  OriginalRow227TriangleData0308.coefficient19_401
]

theorem values0308_size : values0308.size = 32 := rfl

def block0308 : ℕ → Option IntervalDyadic := segment 370 values0308

theorem block0308_domain : ExactDomain block0308 370 402 := by
  simpa only [values0308_size] using segment_domain 370 values0308

theorem block0308_get (i : Fin 32) :
    block0308 (370 + i.val) = some (values0308[i.val]'(by rw [values0308_size]; exact i.isLt)) := by
  exact segment_get 370 values0308 ⟨i.val, by rw [values0308_size]; exact i.isLt⟩

def values0309 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0309.coefficient19_402,
  OriginalRow227TriangleData0309.coefficient19_403,
  OriginalRow227TriangleData0309.coefficient19_404,
  OriginalRow227TriangleData0309.coefficient19_405,
  OriginalRow227TriangleData0309.coefficient19_406,
  OriginalRow227TriangleData0309.coefficient19_407,
  OriginalRow227TriangleData0309.coefficient19_408,
  OriginalRow227TriangleData0309.coefficient19_409,
  OriginalRow227TriangleData0309.coefficient19_410,
  OriginalRow227TriangleData0309.coefficient19_411,
  OriginalRow227TriangleData0309.coefficient19_412,
  OriginalRow227TriangleData0309.coefficient19_413,
  OriginalRow227TriangleData0309.coefficient19_414,
  OriginalRow227TriangleData0309.coefficient19_415,
  OriginalRow227TriangleData0309.coefficient19_416,
  OriginalRow227TriangleData0309.coefficient19_417,
  OriginalRow227TriangleData0309.coefficient19_418,
  OriginalRow227TriangleData0309.coefficient19_419,
  OriginalRow227TriangleData0309.coefficient19_420,
  OriginalRow227TriangleData0309.coefficient19_421,
  OriginalRow227TriangleData0309.coefficient19_422,
  OriginalRow227TriangleData0309.coefficient19_423,
  OriginalRow227TriangleData0309.coefficient19_424,
  OriginalRow227TriangleData0309.coefficient19_425,
  OriginalRow227TriangleData0309.coefficient19_426,
  OriginalRow227TriangleData0309.coefficient19_427,
  OriginalRow227TriangleData0309.coefficient19_428,
  OriginalRow227TriangleData0309.coefficient19_429,
  OriginalRow227TriangleData0309.coefficient19_430,
  OriginalRow227TriangleData0309.coefficient19_431,
  OriginalRow227TriangleData0309.coefficient19_432,
  OriginalRow227TriangleData0309.coefficient19_433
]

theorem values0309_size : values0309.size = 32 := rfl

def block0309 : ℕ → Option IntervalDyadic := segment 402 values0309

theorem block0309_domain : ExactDomain block0309 402 434 := by
  simpa only [values0309_size] using segment_domain 402 values0309

theorem block0309_get (i : Fin 32) :
    block0309 (402 + i.val) = some (values0309[i.val]'(by rw [values0309_size]; exact i.isLt)) := by
  exact segment_get 402 values0309 ⟨i.val, by rw [values0309_size]; exact i.isLt⟩

def values0310 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0310.coefficient19_434,
  OriginalRow227TriangleData0310.coefficient19_435,
  OriginalRow227TriangleData0310.coefficient19_436,
  OriginalRow227TriangleData0310.coefficient19_437,
  OriginalRow227TriangleData0310.coefficient19_438,
  OriginalRow227TriangleData0310.coefficient19_439,
  OriginalRow227TriangleData0310.coefficient19_440,
  OriginalRow227TriangleData0310.coefficient19_441,
  OriginalRow227TriangleData0310.coefficient19_442,
  OriginalRow227TriangleData0310.coefficient19_443,
  OriginalRow227TriangleData0310.coefficient19_444,
  OriginalRow227TriangleData0310.coefficient19_445,
  OriginalRow227TriangleData0310.coefficient19_446,
  OriginalRow227TriangleData0310.coefficient19_447,
  OriginalRow227TriangleData0310.coefficient19_448,
  OriginalRow227TriangleData0310.coefficient19_449,
  OriginalRow227TriangleData0310.coefficient19_450,
  OriginalRow227TriangleData0310.coefficient19_451,
  OriginalRow227TriangleData0310.coefficient19_452,
  OriginalRow227TriangleData0310.coefficient19_453,
  OriginalRow227TriangleData0310.coefficient19_454,
  OriginalRow227TriangleData0310.coefficient19_455,
  OriginalRow227TriangleData0310.coefficient19_456,
  OriginalRow227TriangleData0310.coefficient19_457,
  OriginalRow227TriangleData0310.coefficient19_458,
  OriginalRow227TriangleData0310.coefficient19_459,
  OriginalRow227TriangleData0310.coefficient19_460,
  OriginalRow227TriangleData0310.coefficient19_461,
  OriginalRow227TriangleData0310.coefficient19_462,
  OriginalRow227TriangleData0310.coefficient19_463,
  OriginalRow227TriangleData0310.coefficient19_464,
  OriginalRow227TriangleData0310.coefficient19_465
]

theorem values0310_size : values0310.size = 32 := rfl

def block0310 : ℕ → Option IntervalDyadic := segment 434 values0310

theorem block0310_domain : ExactDomain block0310 434 466 := by
  simpa only [values0310_size] using segment_domain 434 values0310

theorem block0310_get (i : Fin 32) :
    block0310 (434 + i.val) = some (values0310[i.val]'(by rw [values0310_size]; exact i.isLt)) := by
  exact segment_get 434 values0310 ⟨i.val, by rw [values0310_size]; exact i.isLt⟩

def values0311 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0311.coefficient19_466,
  OriginalRow227TriangleData0311.coefficient19_467,
  OriginalRow227TriangleData0311.coefficient19_468,
  OriginalRow227TriangleData0311.coefficient19_469,
  OriginalRow227TriangleData0311.coefficient19_470,
  OriginalRow227TriangleData0311.coefficient19_471,
  OriginalRow227TriangleData0311.coefficient19_472,
  OriginalRow227TriangleData0311.coefficient19_473,
  OriginalRow227TriangleData0311.coefficient19_474,
  OriginalRow227TriangleData0311.coefficient19_475,
  OriginalRow227TriangleData0311.coefficient19_476,
  OriginalRow227TriangleData0311.coefficient19_477,
  OriginalRow227TriangleData0311.coefficient19_478,
  OriginalRow227TriangleData0311.coefficient19_479,
  OriginalRow227TriangleData0311.coefficient19_480,
  OriginalRow227TriangleData0311.coefficient19_481,
  OriginalRow227TriangleData0311.coefficient19_482
]

theorem values0311_size : values0311.size = 17 := rfl

def block0311 : ℕ → Option IntervalDyadic := segment 466 values0311

theorem block0311_domain : ExactDomain block0311 466 483 := by
  simpa only [values0311_size] using segment_domain 466 values0311

theorem block0311_get (i : Fin 17) :
    block0311 (466 + i.val) = some (values0311[i.val]'(by rw [values0311_size]; exact i.isLt)) := by
  exact segment_get 466 values0311 ⟨i.val, by rw [values0311_size]; exact i.isLt⟩

def node0050_0114 : ℕ → Option IntervalDyadic := split 82 block0298 block0299

theorem node0050_0114_domain : ExactDomain node0050_0114 50 114 := by
  exact split_domain (by decide) (by decide) block0298_domain block0299_domain

def node0018_0114 : ℕ → Option IntervalDyadic := split 50 block0297 node0050_0114

theorem node0018_0114_domain : ExactDomain node0018_0114 18 114 := by
  exact split_domain (by decide) (by decide) block0297_domain node0050_0114_domain

def node0114_0178 : ℕ → Option IntervalDyadic := split 146 block0300 block0301

theorem node0114_0178_domain : ExactDomain node0114_0178 114 178 := by
  exact split_domain (by decide) (by decide) block0300_domain block0301_domain

def node0178_0242 : ℕ → Option IntervalDyadic := split 210 block0302 block0303

theorem node0178_0242_domain : ExactDomain node0178_0242 178 242 := by
  exact split_domain (by decide) (by decide) block0302_domain block0303_domain

def node0114_0242 : ℕ → Option IntervalDyadic := split 178 node0114_0178 node0178_0242

theorem node0114_0242_domain : ExactDomain node0114_0242 114 242 := by
  exact split_domain (by decide) (by decide) node0114_0178_domain node0178_0242_domain

def node0018_0242 : ℕ → Option IntervalDyadic := split 114 node0018_0114 node0114_0242

theorem node0018_0242_domain : ExactDomain node0018_0242 18 242 := by
  exact split_domain (by decide) (by decide) node0018_0114_domain node0114_0242_domain

def node0242_0306 : ℕ → Option IntervalDyadic := split 274 block0304 block0305

theorem node0242_0306_domain : ExactDomain node0242_0306 242 306 := by
  exact split_domain (by decide) (by decide) block0304_domain block0305_domain

def node0306_0370 : ℕ → Option IntervalDyadic := split 338 block0306 block0307

theorem node0306_0370_domain : ExactDomain node0306_0370 306 370 := by
  exact split_domain (by decide) (by decide) block0306_domain block0307_domain

def node0242_0370 : ℕ → Option IntervalDyadic := split 306 node0242_0306 node0306_0370

theorem node0242_0370_domain : ExactDomain node0242_0370 242 370 := by
  exact split_domain (by decide) (by decide) node0242_0306_domain node0306_0370_domain

def node0370_0434 : ℕ → Option IntervalDyadic := split 402 block0308 block0309

theorem node0370_0434_domain : ExactDomain node0370_0434 370 434 := by
  exact split_domain (by decide) (by decide) block0308_domain block0309_domain

def node0434_0483 : ℕ → Option IntervalDyadic := split 466 block0310 block0311

theorem node0434_0483_domain : ExactDomain node0434_0483 434 483 := by
  exact split_domain (by decide) (by decide) block0310_domain block0311_domain

def node0370_0483 : ℕ → Option IntervalDyadic := split 434 node0370_0434 node0434_0483

theorem node0370_0483_domain : ExactDomain node0370_0483 370 483 := by
  exact split_domain (by decide) (by decide) node0370_0434_domain node0434_0483_domain

def node0242_0483 : ℕ → Option IntervalDyadic := split 370 node0242_0370 node0370_0483

theorem node0242_0483_domain : ExactDomain node0242_0483 242 483 := by
  exact split_domain (by decide) (by decide) node0242_0370_domain node0370_0483_domain

def node0018_0483 : ℕ → Option IntervalDyadic := split 242 node0018_0242 node0242_0483

theorem node0018_0483_domain : ExactDomain node0018_0483 18 483 := by
  exact split_domain (by decide) (by decide) node0018_0242_domain node0242_0483_domain

def lookup : ℕ → Option IntervalDyadic := node0018_0483

theorem lookup_domain : ExactDomain lookup 18 483 :=
  node0018_0483_domain

theorem block0297_lookup (i : Fin 32) :
    lookup (18 + i.val) = some (values0297[i.val]'(by rw [values0297_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (18 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_left 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0018_0114, split_left 50 block0297 node0050_0114 (by omega)]
  exact block0297_get i

theorem block0298_lookup (i : Fin 32) :
    lookup (50 + i.val) = some (values0298[i.val]'(by rw [values0298_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (50 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_left 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0018_0114, split_right 50 block0297 node0050_0114 (by omega)]
  rw [node0050_0114, split_left 82 block0298 block0299 (by omega)]
  exact block0298_get i

theorem block0299_lookup (i : Fin 32) :
    lookup (82 + i.val) = some (values0299[i.val]'(by rw [values0299_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (82 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_left 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0018_0114, split_right 50 block0297 node0050_0114 (by omega)]
  rw [node0050_0114, split_right 82 block0298 block0299 (by omega)]
  exact block0299_get i

theorem block0300_lookup (i : Fin 32) :
    lookup (114 + i.val) = some (values0300[i.val]'(by rw [values0300_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (114 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_right 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0114_0242, split_left 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0114_0178, split_left 146 block0300 block0301 (by omega)]
  exact block0300_get i

theorem block0301_lookup (i : Fin 32) :
    lookup (146 + i.val) = some (values0301[i.val]'(by rw [values0301_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (146 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_right 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0114_0242, split_left 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0114_0178, split_right 146 block0300 block0301 (by omega)]
  exact block0301_get i

theorem block0302_lookup (i : Fin 32) :
    lookup (178 + i.val) = some (values0302[i.val]'(by rw [values0302_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (178 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_right 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0114_0242, split_right 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0178_0242, split_left 210 block0302 block0303 (by omega)]
  exact block0302_get i

theorem block0303_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values0303[i.val]'(by rw [values0303_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (210 + i.val) = _
  rw [node0018_0483, split_left 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0018_0242, split_right 114 node0018_0114 node0114_0242 (by omega)]
  rw [node0114_0242, split_right 178 node0114_0178 node0178_0242 (by omega)]
  rw [node0178_0242, split_right 210 block0302 block0303 (by omega)]
  exact block0303_get i

theorem block0304_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values0304[i.val]'(by rw [values0304_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (242 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_left 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0242_0370, split_left 306 node0242_0306 node0306_0370 (by omega)]
  rw [node0242_0306, split_left 274 block0304 block0305 (by omega)]
  exact block0304_get i

theorem block0305_lookup (i : Fin 32) :
    lookup (274 + i.val) = some (values0305[i.val]'(by rw [values0305_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (274 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_left 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0242_0370, split_left 306 node0242_0306 node0306_0370 (by omega)]
  rw [node0242_0306, split_right 274 block0304 block0305 (by omega)]
  exact block0305_get i

theorem block0306_lookup (i : Fin 32) :
    lookup (306 + i.val) = some (values0306[i.val]'(by rw [values0306_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (306 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_left 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0242_0370, split_right 306 node0242_0306 node0306_0370 (by omega)]
  rw [node0306_0370, split_left 338 block0306 block0307 (by omega)]
  exact block0306_get i

theorem block0307_lookup (i : Fin 32) :
    lookup (338 + i.val) = some (values0307[i.val]'(by rw [values0307_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (338 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_left 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0242_0370, split_right 306 node0242_0306 node0306_0370 (by omega)]
  rw [node0306_0370, split_right 338 block0306 block0307 (by omega)]
  exact block0307_get i

theorem block0308_lookup (i : Fin 32) :
    lookup (370 + i.val) = some (values0308[i.val]'(by rw [values0308_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (370 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_right 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0370_0483, split_left 434 node0370_0434 node0434_0483 (by omega)]
  rw [node0370_0434, split_left 402 block0308 block0309 (by omega)]
  exact block0308_get i

theorem block0309_lookup (i : Fin 32) :
    lookup (402 + i.val) = some (values0309[i.val]'(by rw [values0309_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (402 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_right 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0370_0483, split_left 434 node0370_0434 node0434_0483 (by omega)]
  rw [node0370_0434, split_right 402 block0308 block0309 (by omega)]
  exact block0309_get i

theorem block0310_lookup (i : Fin 32) :
    lookup (434 + i.val) = some (values0310[i.val]'(by rw [values0310_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (434 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_right 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0370_0483, split_right 434 node0370_0434 node0434_0483 (by omega)]
  rw [node0434_0483, split_left 466 block0310 block0311 (by omega)]
  exact block0310_get i

theorem block0311_lookup (i : Fin 17) :
    lookup (466 + i.val) = some (values0311[i.val]'(by rw [values0311_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0018_0483 (466 + i.val) = _
  rw [node0018_0483, split_right 242 node0018_0242 node0242_0483 (by omega)]
  rw [node0242_0483, split_right 370 node0242_0370 node0370_0483 (by omega)]
  rw [node0370_0483, split_right 434 node0370_0434 node0434_0483 (by omega)]
  rw [node0434_0483, split_right 466 block0310 block0311 (by omega)]
  exact block0311_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0297_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0297_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0298_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0298_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0299_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0299_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0300_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0300_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0301_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0301_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0302_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0302_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0303_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0303_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0304_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0304_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0305_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0305_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0306_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0306_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0307_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0307_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0308_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0308_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0309_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0309_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0310_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0310_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0311_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0311_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0297_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0298_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0299_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0300_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0301_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0302_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0303_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0304_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0305_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0306_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0307_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0308_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0309_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0310_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow019.block0311_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow019
