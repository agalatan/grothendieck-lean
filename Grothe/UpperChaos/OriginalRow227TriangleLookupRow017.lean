import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0267
import Grothe.UpperChaos.OriginalRow227TriangleData0268
import Grothe.UpperChaos.OriginalRow227TriangleData0269
import Grothe.UpperChaos.OriginalRow227TriangleData0270
import Grothe.UpperChaos.OriginalRow227TriangleData0271
import Grothe.UpperChaos.OriginalRow227TriangleData0272
import Grothe.UpperChaos.OriginalRow227TriangleData0273
import Grothe.UpperChaos.OriginalRow227TriangleData0274
import Grothe.UpperChaos.OriginalRow227TriangleData0275
import Grothe.UpperChaos.OriginalRow227TriangleData0276
import Grothe.UpperChaos.OriginalRow227TriangleData0277
import Grothe.UpperChaos.OriginalRow227TriangleData0278
import Grothe.UpperChaos.OriginalRow227TriangleData0279
import Grothe.UpperChaos.OriginalRow227TriangleData0280
import Grothe.UpperChaos.OriginalRow227TriangleData0281

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow017

open ConditionalTableLookup

def values0267 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0267.coefficient17_16,
  OriginalRow227TriangleData0267.coefficient17_17,
  OriginalRow227TriangleData0267.coefficient17_18,
  OriginalRow227TriangleData0267.coefficient17_19,
  OriginalRow227TriangleData0267.coefficient17_20,
  OriginalRow227TriangleData0267.coefficient17_21,
  OriginalRow227TriangleData0267.coefficient17_22,
  OriginalRow227TriangleData0267.coefficient17_23,
  OriginalRow227TriangleData0267.coefficient17_24,
  OriginalRow227TriangleData0267.coefficient17_25,
  OriginalRow227TriangleData0267.coefficient17_26,
  OriginalRow227TriangleData0267.coefficient17_27,
  OriginalRow227TriangleData0267.coefficient17_28,
  OriginalRow227TriangleData0267.coefficient17_29,
  OriginalRow227TriangleData0267.coefficient17_30,
  OriginalRow227TriangleData0267.coefficient17_31,
  OriginalRow227TriangleData0267.coefficient17_32,
  OriginalRow227TriangleData0267.coefficient17_33,
  OriginalRow227TriangleData0267.coefficient17_34,
  OriginalRow227TriangleData0267.coefficient17_35,
  OriginalRow227TriangleData0267.coefficient17_36,
  OriginalRow227TriangleData0267.coefficient17_37,
  OriginalRow227TriangleData0267.coefficient17_38,
  OriginalRow227TriangleData0267.coefficient17_39,
  OriginalRow227TriangleData0267.coefficient17_40,
  OriginalRow227TriangleData0267.coefficient17_41,
  OriginalRow227TriangleData0267.coefficient17_42,
  OriginalRow227TriangleData0267.coefficient17_43,
  OriginalRow227TriangleData0267.coefficient17_44,
  OriginalRow227TriangleData0267.coefficient17_45,
  OriginalRow227TriangleData0267.coefficient17_46,
  OriginalRow227TriangleData0267.coefficient17_47
]

theorem values0267_size : values0267.size = 32 := rfl

def block0267 : ℕ → Option IntervalDyadic := segment 16 values0267

theorem block0267_domain : ExactDomain block0267 16 48 := by
  simpa only [values0267_size] using segment_domain 16 values0267

theorem block0267_get (i : Fin 32) :
    block0267 (16 + i.val) = some (values0267[i.val]'(by rw [values0267_size]; exact i.isLt)) := by
  exact segment_get 16 values0267 ⟨i.val, by rw [values0267_size]; exact i.isLt⟩

def values0268 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0268.coefficient17_48,
  OriginalRow227TriangleData0268.coefficient17_49,
  OriginalRow227TriangleData0268.coefficient17_50,
  OriginalRow227TriangleData0268.coefficient17_51,
  OriginalRow227TriangleData0268.coefficient17_52,
  OriginalRow227TriangleData0268.coefficient17_53,
  OriginalRow227TriangleData0268.coefficient17_54,
  OriginalRow227TriangleData0268.coefficient17_55,
  OriginalRow227TriangleData0268.coefficient17_56,
  OriginalRow227TriangleData0268.coefficient17_57,
  OriginalRow227TriangleData0268.coefficient17_58,
  OriginalRow227TriangleData0268.coefficient17_59,
  OriginalRow227TriangleData0268.coefficient17_60,
  OriginalRow227TriangleData0268.coefficient17_61,
  OriginalRow227TriangleData0268.coefficient17_62,
  OriginalRow227TriangleData0268.coefficient17_63,
  OriginalRow227TriangleData0268.coefficient17_64,
  OriginalRow227TriangleData0268.coefficient17_65,
  OriginalRow227TriangleData0268.coefficient17_66,
  OriginalRow227TriangleData0268.coefficient17_67,
  OriginalRow227TriangleData0268.coefficient17_68,
  OriginalRow227TriangleData0268.coefficient17_69,
  OriginalRow227TriangleData0268.coefficient17_70,
  OriginalRow227TriangleData0268.coefficient17_71,
  OriginalRow227TriangleData0268.coefficient17_72,
  OriginalRow227TriangleData0268.coefficient17_73,
  OriginalRow227TriangleData0268.coefficient17_74,
  OriginalRow227TriangleData0268.coefficient17_75,
  OriginalRow227TriangleData0268.coefficient17_76,
  OriginalRow227TriangleData0268.coefficient17_77,
  OriginalRow227TriangleData0268.coefficient17_78,
  OriginalRow227TriangleData0268.coefficient17_79
]

theorem values0268_size : values0268.size = 32 := rfl

def block0268 : ℕ → Option IntervalDyadic := segment 48 values0268

theorem block0268_domain : ExactDomain block0268 48 80 := by
  simpa only [values0268_size] using segment_domain 48 values0268

theorem block0268_get (i : Fin 32) :
    block0268 (48 + i.val) = some (values0268[i.val]'(by rw [values0268_size]; exact i.isLt)) := by
  exact segment_get 48 values0268 ⟨i.val, by rw [values0268_size]; exact i.isLt⟩

def values0269 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0269.coefficient17_80,
  OriginalRow227TriangleData0269.coefficient17_81,
  OriginalRow227TriangleData0269.coefficient17_82,
  OriginalRow227TriangleData0269.coefficient17_83,
  OriginalRow227TriangleData0269.coefficient17_84,
  OriginalRow227TriangleData0269.coefficient17_85,
  OriginalRow227TriangleData0269.coefficient17_86,
  OriginalRow227TriangleData0269.coefficient17_87,
  OriginalRow227TriangleData0269.coefficient17_88,
  OriginalRow227TriangleData0269.coefficient17_89,
  OriginalRow227TriangleData0269.coefficient17_90,
  OriginalRow227TriangleData0269.coefficient17_91,
  OriginalRow227TriangleData0269.coefficient17_92,
  OriginalRow227TriangleData0269.coefficient17_93,
  OriginalRow227TriangleData0269.coefficient17_94,
  OriginalRow227TriangleData0269.coefficient17_95,
  OriginalRow227TriangleData0269.coefficient17_96,
  OriginalRow227TriangleData0269.coefficient17_97,
  OriginalRow227TriangleData0269.coefficient17_98,
  OriginalRow227TriangleData0269.coefficient17_99,
  OriginalRow227TriangleData0269.coefficient17_100,
  OriginalRow227TriangleData0269.coefficient17_101,
  OriginalRow227TriangleData0269.coefficient17_102,
  OriginalRow227TriangleData0269.coefficient17_103,
  OriginalRow227TriangleData0269.coefficient17_104,
  OriginalRow227TriangleData0269.coefficient17_105,
  OriginalRow227TriangleData0269.coefficient17_106,
  OriginalRow227TriangleData0269.coefficient17_107,
  OriginalRow227TriangleData0269.coefficient17_108,
  OriginalRow227TriangleData0269.coefficient17_109,
  OriginalRow227TriangleData0269.coefficient17_110,
  OriginalRow227TriangleData0269.coefficient17_111
]

theorem values0269_size : values0269.size = 32 := rfl

def block0269 : ℕ → Option IntervalDyadic := segment 80 values0269

theorem block0269_domain : ExactDomain block0269 80 112 := by
  simpa only [values0269_size] using segment_domain 80 values0269

theorem block0269_get (i : Fin 32) :
    block0269 (80 + i.val) = some (values0269[i.val]'(by rw [values0269_size]; exact i.isLt)) := by
  exact segment_get 80 values0269 ⟨i.val, by rw [values0269_size]; exact i.isLt⟩

def values0270 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0270.coefficient17_112,
  OriginalRow227TriangleData0270.coefficient17_113,
  OriginalRow227TriangleData0270.coefficient17_114,
  OriginalRow227TriangleData0270.coefficient17_115,
  OriginalRow227TriangleData0270.coefficient17_116,
  OriginalRow227TriangleData0270.coefficient17_117,
  OriginalRow227TriangleData0270.coefficient17_118,
  OriginalRow227TriangleData0270.coefficient17_119,
  OriginalRow227TriangleData0270.coefficient17_120,
  OriginalRow227TriangleData0270.coefficient17_121,
  OriginalRow227TriangleData0270.coefficient17_122,
  OriginalRow227TriangleData0270.coefficient17_123,
  OriginalRow227TriangleData0270.coefficient17_124,
  OriginalRow227TriangleData0270.coefficient17_125,
  OriginalRow227TriangleData0270.coefficient17_126,
  OriginalRow227TriangleData0270.coefficient17_127,
  OriginalRow227TriangleData0270.coefficient17_128,
  OriginalRow227TriangleData0270.coefficient17_129,
  OriginalRow227TriangleData0270.coefficient17_130,
  OriginalRow227TriangleData0270.coefficient17_131,
  OriginalRow227TriangleData0270.coefficient17_132,
  OriginalRow227TriangleData0270.coefficient17_133,
  OriginalRow227TriangleData0270.coefficient17_134,
  OriginalRow227TriangleData0270.coefficient17_135,
  OriginalRow227TriangleData0270.coefficient17_136,
  OriginalRow227TriangleData0270.coefficient17_137,
  OriginalRow227TriangleData0270.coefficient17_138,
  OriginalRow227TriangleData0270.coefficient17_139,
  OriginalRow227TriangleData0270.coefficient17_140,
  OriginalRow227TriangleData0270.coefficient17_141,
  OriginalRow227TriangleData0270.coefficient17_142,
  OriginalRow227TriangleData0270.coefficient17_143
]

theorem values0270_size : values0270.size = 32 := rfl

def block0270 : ℕ → Option IntervalDyadic := segment 112 values0270

theorem block0270_domain : ExactDomain block0270 112 144 := by
  simpa only [values0270_size] using segment_domain 112 values0270

theorem block0270_get (i : Fin 32) :
    block0270 (112 + i.val) = some (values0270[i.val]'(by rw [values0270_size]; exact i.isLt)) := by
  exact segment_get 112 values0270 ⟨i.val, by rw [values0270_size]; exact i.isLt⟩

def values0271 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0271.coefficient17_144,
  OriginalRow227TriangleData0271.coefficient17_145,
  OriginalRow227TriangleData0271.coefficient17_146,
  OriginalRow227TriangleData0271.coefficient17_147,
  OriginalRow227TriangleData0271.coefficient17_148,
  OriginalRow227TriangleData0271.coefficient17_149,
  OriginalRow227TriangleData0271.coefficient17_150,
  OriginalRow227TriangleData0271.coefficient17_151,
  OriginalRow227TriangleData0271.coefficient17_152,
  OriginalRow227TriangleData0271.coefficient17_153,
  OriginalRow227TriangleData0271.coefficient17_154,
  OriginalRow227TriangleData0271.coefficient17_155,
  OriginalRow227TriangleData0271.coefficient17_156,
  OriginalRow227TriangleData0271.coefficient17_157,
  OriginalRow227TriangleData0271.coefficient17_158,
  OriginalRow227TriangleData0271.coefficient17_159,
  OriginalRow227TriangleData0271.coefficient17_160,
  OriginalRow227TriangleData0271.coefficient17_161,
  OriginalRow227TriangleData0271.coefficient17_162,
  OriginalRow227TriangleData0271.coefficient17_163,
  OriginalRow227TriangleData0271.coefficient17_164,
  OriginalRow227TriangleData0271.coefficient17_165,
  OriginalRow227TriangleData0271.coefficient17_166,
  OriginalRow227TriangleData0271.coefficient17_167,
  OriginalRow227TriangleData0271.coefficient17_168,
  OriginalRow227TriangleData0271.coefficient17_169,
  OriginalRow227TriangleData0271.coefficient17_170,
  OriginalRow227TriangleData0271.coefficient17_171,
  OriginalRow227TriangleData0271.coefficient17_172,
  OriginalRow227TriangleData0271.coefficient17_173,
  OriginalRow227TriangleData0271.coefficient17_174,
  OriginalRow227TriangleData0271.coefficient17_175
]

theorem values0271_size : values0271.size = 32 := rfl

def block0271 : ℕ → Option IntervalDyadic := segment 144 values0271

theorem block0271_domain : ExactDomain block0271 144 176 := by
  simpa only [values0271_size] using segment_domain 144 values0271

theorem block0271_get (i : Fin 32) :
    block0271 (144 + i.val) = some (values0271[i.val]'(by rw [values0271_size]; exact i.isLt)) := by
  exact segment_get 144 values0271 ⟨i.val, by rw [values0271_size]; exact i.isLt⟩

def values0272 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0272.coefficient17_176,
  OriginalRow227TriangleData0272.coefficient17_177,
  OriginalRow227TriangleData0272.coefficient17_178,
  OriginalRow227TriangleData0272.coefficient17_179,
  OriginalRow227TriangleData0272.coefficient17_180,
  OriginalRow227TriangleData0272.coefficient17_181,
  OriginalRow227TriangleData0272.coefficient17_182,
  OriginalRow227TriangleData0272.coefficient17_183,
  OriginalRow227TriangleData0272.coefficient17_184,
  OriginalRow227TriangleData0272.coefficient17_185,
  OriginalRow227TriangleData0272.coefficient17_186,
  OriginalRow227TriangleData0272.coefficient17_187,
  OriginalRow227TriangleData0272.coefficient17_188,
  OriginalRow227TriangleData0272.coefficient17_189,
  OriginalRow227TriangleData0272.coefficient17_190,
  OriginalRow227TriangleData0272.coefficient17_191,
  OriginalRow227TriangleData0272.coefficient17_192,
  OriginalRow227TriangleData0272.coefficient17_193,
  OriginalRow227TriangleData0272.coefficient17_194,
  OriginalRow227TriangleData0272.coefficient17_195,
  OriginalRow227TriangleData0272.coefficient17_196,
  OriginalRow227TriangleData0272.coefficient17_197,
  OriginalRow227TriangleData0272.coefficient17_198,
  OriginalRow227TriangleData0272.coefficient17_199,
  OriginalRow227TriangleData0272.coefficient17_200,
  OriginalRow227TriangleData0272.coefficient17_201,
  OriginalRow227TriangleData0272.coefficient17_202,
  OriginalRow227TriangleData0272.coefficient17_203,
  OriginalRow227TriangleData0272.coefficient17_204,
  OriginalRow227TriangleData0272.coefficient17_205,
  OriginalRow227TriangleData0272.coefficient17_206,
  OriginalRow227TriangleData0272.coefficient17_207
]

theorem values0272_size : values0272.size = 32 := rfl

def block0272 : ℕ → Option IntervalDyadic := segment 176 values0272

theorem block0272_domain : ExactDomain block0272 176 208 := by
  simpa only [values0272_size] using segment_domain 176 values0272

theorem block0272_get (i : Fin 32) :
    block0272 (176 + i.val) = some (values0272[i.val]'(by rw [values0272_size]; exact i.isLt)) := by
  exact segment_get 176 values0272 ⟨i.val, by rw [values0272_size]; exact i.isLt⟩

def values0273 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0273.coefficient17_208,
  OriginalRow227TriangleData0273.coefficient17_209,
  OriginalRow227TriangleData0273.coefficient17_210,
  OriginalRow227TriangleData0273.coefficient17_211,
  OriginalRow227TriangleData0273.coefficient17_212,
  OriginalRow227TriangleData0273.coefficient17_213,
  OriginalRow227TriangleData0273.coefficient17_214,
  OriginalRow227TriangleData0273.coefficient17_215,
  OriginalRow227TriangleData0273.coefficient17_216,
  OriginalRow227TriangleData0273.coefficient17_217,
  OriginalRow227TriangleData0273.coefficient17_218,
  OriginalRow227TriangleData0273.coefficient17_219,
  OriginalRow227TriangleData0273.coefficient17_220,
  OriginalRow227TriangleData0273.coefficient17_221,
  OriginalRow227TriangleData0273.coefficient17_222,
  OriginalRow227TriangleData0273.coefficient17_223,
  OriginalRow227TriangleData0273.coefficient17_224,
  OriginalRow227TriangleData0273.coefficient17_225,
  OriginalRow227TriangleData0273.coefficient17_226,
  OriginalRow227TriangleData0273.coefficient17_227,
  OriginalRow227TriangleData0273.coefficient17_228,
  OriginalRow227TriangleData0273.coefficient17_229,
  OriginalRow227TriangleData0273.coefficient17_230,
  OriginalRow227TriangleData0273.coefficient17_231,
  OriginalRow227TriangleData0273.coefficient17_232,
  OriginalRow227TriangleData0273.coefficient17_233,
  OriginalRow227TriangleData0273.coefficient17_234,
  OriginalRow227TriangleData0273.coefficient17_235,
  OriginalRow227TriangleData0273.coefficient17_236,
  OriginalRow227TriangleData0273.coefficient17_237,
  OriginalRow227TriangleData0273.coefficient17_238,
  OriginalRow227TriangleData0273.coefficient17_239
]

theorem values0273_size : values0273.size = 32 := rfl

def block0273 : ℕ → Option IntervalDyadic := segment 208 values0273

theorem block0273_domain : ExactDomain block0273 208 240 := by
  simpa only [values0273_size] using segment_domain 208 values0273

theorem block0273_get (i : Fin 32) :
    block0273 (208 + i.val) = some (values0273[i.val]'(by rw [values0273_size]; exact i.isLt)) := by
  exact segment_get 208 values0273 ⟨i.val, by rw [values0273_size]; exact i.isLt⟩

def values0274 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0274.coefficient17_240,
  OriginalRow227TriangleData0274.coefficient17_241,
  OriginalRow227TriangleData0274.coefficient17_242,
  OriginalRow227TriangleData0274.coefficient17_243,
  OriginalRow227TriangleData0274.coefficient17_244,
  OriginalRow227TriangleData0274.coefficient17_245,
  OriginalRow227TriangleData0274.coefficient17_246,
  OriginalRow227TriangleData0274.coefficient17_247,
  OriginalRow227TriangleData0274.coefficient17_248,
  OriginalRow227TriangleData0274.coefficient17_249,
  OriginalRow227TriangleData0274.coefficient17_250,
  OriginalRow227TriangleData0274.coefficient17_251,
  OriginalRow227TriangleData0274.coefficient17_252,
  OriginalRow227TriangleData0274.coefficient17_253,
  OriginalRow227TriangleData0274.coefficient17_254,
  OriginalRow227TriangleData0274.coefficient17_255,
  OriginalRow227TriangleData0274.coefficient17_256,
  OriginalRow227TriangleData0274.coefficient17_257,
  OriginalRow227TriangleData0274.coefficient17_258,
  OriginalRow227TriangleData0274.coefficient17_259,
  OriginalRow227TriangleData0274.coefficient17_260,
  OriginalRow227TriangleData0274.coefficient17_261,
  OriginalRow227TriangleData0274.coefficient17_262,
  OriginalRow227TriangleData0274.coefficient17_263,
  OriginalRow227TriangleData0274.coefficient17_264,
  OriginalRow227TriangleData0274.coefficient17_265,
  OriginalRow227TriangleData0274.coefficient17_266,
  OriginalRow227TriangleData0274.coefficient17_267,
  OriginalRow227TriangleData0274.coefficient17_268,
  OriginalRow227TriangleData0274.coefficient17_269,
  OriginalRow227TriangleData0274.coefficient17_270,
  OriginalRow227TriangleData0274.coefficient17_271
]

theorem values0274_size : values0274.size = 32 := rfl

def block0274 : ℕ → Option IntervalDyadic := segment 240 values0274

theorem block0274_domain : ExactDomain block0274 240 272 := by
  simpa only [values0274_size] using segment_domain 240 values0274

theorem block0274_get (i : Fin 32) :
    block0274 (240 + i.val) = some (values0274[i.val]'(by rw [values0274_size]; exact i.isLt)) := by
  exact segment_get 240 values0274 ⟨i.val, by rw [values0274_size]; exact i.isLt⟩

def values0275 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0275.coefficient17_272,
  OriginalRow227TriangleData0275.coefficient17_273,
  OriginalRow227TriangleData0275.coefficient17_274,
  OriginalRow227TriangleData0275.coefficient17_275,
  OriginalRow227TriangleData0275.coefficient17_276,
  OriginalRow227TriangleData0275.coefficient17_277,
  OriginalRow227TriangleData0275.coefficient17_278,
  OriginalRow227TriangleData0275.coefficient17_279,
  OriginalRow227TriangleData0275.coefficient17_280,
  OriginalRow227TriangleData0275.coefficient17_281,
  OriginalRow227TriangleData0275.coefficient17_282,
  OriginalRow227TriangleData0275.coefficient17_283,
  OriginalRow227TriangleData0275.coefficient17_284,
  OriginalRow227TriangleData0275.coefficient17_285,
  OriginalRow227TriangleData0275.coefficient17_286,
  OriginalRow227TriangleData0275.coefficient17_287,
  OriginalRow227TriangleData0275.coefficient17_288,
  OriginalRow227TriangleData0275.coefficient17_289,
  OriginalRow227TriangleData0275.coefficient17_290,
  OriginalRow227TriangleData0275.coefficient17_291,
  OriginalRow227TriangleData0275.coefficient17_292,
  OriginalRow227TriangleData0275.coefficient17_293,
  OriginalRow227TriangleData0275.coefficient17_294,
  OriginalRow227TriangleData0275.coefficient17_295,
  OriginalRow227TriangleData0275.coefficient17_296,
  OriginalRow227TriangleData0275.coefficient17_297,
  OriginalRow227TriangleData0275.coefficient17_298,
  OriginalRow227TriangleData0275.coefficient17_299,
  OriginalRow227TriangleData0275.coefficient17_300,
  OriginalRow227TriangleData0275.coefficient17_301,
  OriginalRow227TriangleData0275.coefficient17_302,
  OriginalRow227TriangleData0275.coefficient17_303
]

theorem values0275_size : values0275.size = 32 := rfl

def block0275 : ℕ → Option IntervalDyadic := segment 272 values0275

theorem block0275_domain : ExactDomain block0275 272 304 := by
  simpa only [values0275_size] using segment_domain 272 values0275

theorem block0275_get (i : Fin 32) :
    block0275 (272 + i.val) = some (values0275[i.val]'(by rw [values0275_size]; exact i.isLt)) := by
  exact segment_get 272 values0275 ⟨i.val, by rw [values0275_size]; exact i.isLt⟩

def values0276 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0276.coefficient17_304,
  OriginalRow227TriangleData0276.coefficient17_305,
  OriginalRow227TriangleData0276.coefficient17_306,
  OriginalRow227TriangleData0276.coefficient17_307,
  OriginalRow227TriangleData0276.coefficient17_308,
  OriginalRow227TriangleData0276.coefficient17_309,
  OriginalRow227TriangleData0276.coefficient17_310,
  OriginalRow227TriangleData0276.coefficient17_311,
  OriginalRow227TriangleData0276.coefficient17_312,
  OriginalRow227TriangleData0276.coefficient17_313,
  OriginalRow227TriangleData0276.coefficient17_314,
  OriginalRow227TriangleData0276.coefficient17_315,
  OriginalRow227TriangleData0276.coefficient17_316,
  OriginalRow227TriangleData0276.coefficient17_317,
  OriginalRow227TriangleData0276.coefficient17_318,
  OriginalRow227TriangleData0276.coefficient17_319,
  OriginalRow227TriangleData0276.coefficient17_320,
  OriginalRow227TriangleData0276.coefficient17_321,
  OriginalRow227TriangleData0276.coefficient17_322,
  OriginalRow227TriangleData0276.coefficient17_323,
  OriginalRow227TriangleData0276.coefficient17_324,
  OriginalRow227TriangleData0276.coefficient17_325,
  OriginalRow227TriangleData0276.coefficient17_326,
  OriginalRow227TriangleData0276.coefficient17_327,
  OriginalRow227TriangleData0276.coefficient17_328,
  OriginalRow227TriangleData0276.coefficient17_329,
  OriginalRow227TriangleData0276.coefficient17_330,
  OriginalRow227TriangleData0276.coefficient17_331,
  OriginalRow227TriangleData0276.coefficient17_332,
  OriginalRow227TriangleData0276.coefficient17_333,
  OriginalRow227TriangleData0276.coefficient17_334,
  OriginalRow227TriangleData0276.coefficient17_335
]

theorem values0276_size : values0276.size = 32 := rfl

def block0276 : ℕ → Option IntervalDyadic := segment 304 values0276

theorem block0276_domain : ExactDomain block0276 304 336 := by
  simpa only [values0276_size] using segment_domain 304 values0276

theorem block0276_get (i : Fin 32) :
    block0276 (304 + i.val) = some (values0276[i.val]'(by rw [values0276_size]; exact i.isLt)) := by
  exact segment_get 304 values0276 ⟨i.val, by rw [values0276_size]; exact i.isLt⟩

def values0277 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0277.coefficient17_336,
  OriginalRow227TriangleData0277.coefficient17_337,
  OriginalRow227TriangleData0277.coefficient17_338,
  OriginalRow227TriangleData0277.coefficient17_339,
  OriginalRow227TriangleData0277.coefficient17_340,
  OriginalRow227TriangleData0277.coefficient17_341,
  OriginalRow227TriangleData0277.coefficient17_342,
  OriginalRow227TriangleData0277.coefficient17_343,
  OriginalRow227TriangleData0277.coefficient17_344,
  OriginalRow227TriangleData0277.coefficient17_345,
  OriginalRow227TriangleData0277.coefficient17_346,
  OriginalRow227TriangleData0277.coefficient17_347,
  OriginalRow227TriangleData0277.coefficient17_348,
  OriginalRow227TriangleData0277.coefficient17_349,
  OriginalRow227TriangleData0277.coefficient17_350,
  OriginalRow227TriangleData0277.coefficient17_351,
  OriginalRow227TriangleData0277.coefficient17_352,
  OriginalRow227TriangleData0277.coefficient17_353,
  OriginalRow227TriangleData0277.coefficient17_354,
  OriginalRow227TriangleData0277.coefficient17_355,
  OriginalRow227TriangleData0277.coefficient17_356,
  OriginalRow227TriangleData0277.coefficient17_357,
  OriginalRow227TriangleData0277.coefficient17_358,
  OriginalRow227TriangleData0277.coefficient17_359,
  OriginalRow227TriangleData0277.coefficient17_360,
  OriginalRow227TriangleData0277.coefficient17_361,
  OriginalRow227TriangleData0277.coefficient17_362,
  OriginalRow227TriangleData0277.coefficient17_363,
  OriginalRow227TriangleData0277.coefficient17_364,
  OriginalRow227TriangleData0277.coefficient17_365,
  OriginalRow227TriangleData0277.coefficient17_366,
  OriginalRow227TriangleData0277.coefficient17_367
]

theorem values0277_size : values0277.size = 32 := rfl

def block0277 : ℕ → Option IntervalDyadic := segment 336 values0277

theorem block0277_domain : ExactDomain block0277 336 368 := by
  simpa only [values0277_size] using segment_domain 336 values0277

theorem block0277_get (i : Fin 32) :
    block0277 (336 + i.val) = some (values0277[i.val]'(by rw [values0277_size]; exact i.isLt)) := by
  exact segment_get 336 values0277 ⟨i.val, by rw [values0277_size]; exact i.isLt⟩

def values0278 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0278.coefficient17_368,
  OriginalRow227TriangleData0278.coefficient17_369,
  OriginalRow227TriangleData0278.coefficient17_370,
  OriginalRow227TriangleData0278.coefficient17_371,
  OriginalRow227TriangleData0278.coefficient17_372,
  OriginalRow227TriangleData0278.coefficient17_373,
  OriginalRow227TriangleData0278.coefficient17_374,
  OriginalRow227TriangleData0278.coefficient17_375,
  OriginalRow227TriangleData0278.coefficient17_376,
  OriginalRow227TriangleData0278.coefficient17_377,
  OriginalRow227TriangleData0278.coefficient17_378,
  OriginalRow227TriangleData0278.coefficient17_379,
  OriginalRow227TriangleData0278.coefficient17_380,
  OriginalRow227TriangleData0278.coefficient17_381,
  OriginalRow227TriangleData0278.coefficient17_382,
  OriginalRow227TriangleData0278.coefficient17_383,
  OriginalRow227TriangleData0278.coefficient17_384,
  OriginalRow227TriangleData0278.coefficient17_385,
  OriginalRow227TriangleData0278.coefficient17_386,
  OriginalRow227TriangleData0278.coefficient17_387,
  OriginalRow227TriangleData0278.coefficient17_388,
  OriginalRow227TriangleData0278.coefficient17_389,
  OriginalRow227TriangleData0278.coefficient17_390,
  OriginalRow227TriangleData0278.coefficient17_391,
  OriginalRow227TriangleData0278.coefficient17_392,
  OriginalRow227TriangleData0278.coefficient17_393,
  OriginalRow227TriangleData0278.coefficient17_394,
  OriginalRow227TriangleData0278.coefficient17_395,
  OriginalRow227TriangleData0278.coefficient17_396,
  OriginalRow227TriangleData0278.coefficient17_397,
  OriginalRow227TriangleData0278.coefficient17_398,
  OriginalRow227TriangleData0278.coefficient17_399
]

theorem values0278_size : values0278.size = 32 := rfl

def block0278 : ℕ → Option IntervalDyadic := segment 368 values0278

theorem block0278_domain : ExactDomain block0278 368 400 := by
  simpa only [values0278_size] using segment_domain 368 values0278

theorem block0278_get (i : Fin 32) :
    block0278 (368 + i.val) = some (values0278[i.val]'(by rw [values0278_size]; exact i.isLt)) := by
  exact segment_get 368 values0278 ⟨i.val, by rw [values0278_size]; exact i.isLt⟩

def values0279 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0279.coefficient17_400,
  OriginalRow227TriangleData0279.coefficient17_401,
  OriginalRow227TriangleData0279.coefficient17_402,
  OriginalRow227TriangleData0279.coefficient17_403,
  OriginalRow227TriangleData0279.coefficient17_404,
  OriginalRow227TriangleData0279.coefficient17_405,
  OriginalRow227TriangleData0279.coefficient17_406,
  OriginalRow227TriangleData0279.coefficient17_407,
  OriginalRow227TriangleData0279.coefficient17_408,
  OriginalRow227TriangleData0279.coefficient17_409,
  OriginalRow227TriangleData0279.coefficient17_410,
  OriginalRow227TriangleData0279.coefficient17_411,
  OriginalRow227TriangleData0279.coefficient17_412,
  OriginalRow227TriangleData0279.coefficient17_413,
  OriginalRow227TriangleData0279.coefficient17_414,
  OriginalRow227TriangleData0279.coefficient17_415,
  OriginalRow227TriangleData0279.coefficient17_416,
  OriginalRow227TriangleData0279.coefficient17_417,
  OriginalRow227TriangleData0279.coefficient17_418,
  OriginalRow227TriangleData0279.coefficient17_419,
  OriginalRow227TriangleData0279.coefficient17_420,
  OriginalRow227TriangleData0279.coefficient17_421,
  OriginalRow227TriangleData0279.coefficient17_422,
  OriginalRow227TriangleData0279.coefficient17_423,
  OriginalRow227TriangleData0279.coefficient17_424,
  OriginalRow227TriangleData0279.coefficient17_425,
  OriginalRow227TriangleData0279.coefficient17_426,
  OriginalRow227TriangleData0279.coefficient17_427,
  OriginalRow227TriangleData0279.coefficient17_428,
  OriginalRow227TriangleData0279.coefficient17_429,
  OriginalRow227TriangleData0279.coefficient17_430,
  OriginalRow227TriangleData0279.coefficient17_431
]

theorem values0279_size : values0279.size = 32 := rfl

def block0279 : ℕ → Option IntervalDyadic := segment 400 values0279

theorem block0279_domain : ExactDomain block0279 400 432 := by
  simpa only [values0279_size] using segment_domain 400 values0279

theorem block0279_get (i : Fin 32) :
    block0279 (400 + i.val) = some (values0279[i.val]'(by rw [values0279_size]; exact i.isLt)) := by
  exact segment_get 400 values0279 ⟨i.val, by rw [values0279_size]; exact i.isLt⟩

def values0280 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0280.coefficient17_432,
  OriginalRow227TriangleData0280.coefficient17_433,
  OriginalRow227TriangleData0280.coefficient17_434,
  OriginalRow227TriangleData0280.coefficient17_435,
  OriginalRow227TriangleData0280.coefficient17_436,
  OriginalRow227TriangleData0280.coefficient17_437,
  OriginalRow227TriangleData0280.coefficient17_438,
  OriginalRow227TriangleData0280.coefficient17_439,
  OriginalRow227TriangleData0280.coefficient17_440,
  OriginalRow227TriangleData0280.coefficient17_441,
  OriginalRow227TriangleData0280.coefficient17_442,
  OriginalRow227TriangleData0280.coefficient17_443,
  OriginalRow227TriangleData0280.coefficient17_444,
  OriginalRow227TriangleData0280.coefficient17_445,
  OriginalRow227TriangleData0280.coefficient17_446,
  OriginalRow227TriangleData0280.coefficient17_447,
  OriginalRow227TriangleData0280.coefficient17_448,
  OriginalRow227TriangleData0280.coefficient17_449,
  OriginalRow227TriangleData0280.coefficient17_450,
  OriginalRow227TriangleData0280.coefficient17_451,
  OriginalRow227TriangleData0280.coefficient17_452,
  OriginalRow227TriangleData0280.coefficient17_453,
  OriginalRow227TriangleData0280.coefficient17_454,
  OriginalRow227TriangleData0280.coefficient17_455,
  OriginalRow227TriangleData0280.coefficient17_456,
  OriginalRow227TriangleData0280.coefficient17_457,
  OriginalRow227TriangleData0280.coefficient17_458,
  OriginalRow227TriangleData0280.coefficient17_459,
  OriginalRow227TriangleData0280.coefficient17_460,
  OriginalRow227TriangleData0280.coefficient17_461,
  OriginalRow227TriangleData0280.coefficient17_462,
  OriginalRow227TriangleData0280.coefficient17_463
]

theorem values0280_size : values0280.size = 32 := rfl

def block0280 : ℕ → Option IntervalDyadic := segment 432 values0280

theorem block0280_domain : ExactDomain block0280 432 464 := by
  simpa only [values0280_size] using segment_domain 432 values0280

theorem block0280_get (i : Fin 32) :
    block0280 (432 + i.val) = some (values0280[i.val]'(by rw [values0280_size]; exact i.isLt)) := by
  exact segment_get 432 values0280 ⟨i.val, by rw [values0280_size]; exact i.isLt⟩

def values0281 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0281.coefficient17_464,
  OriginalRow227TriangleData0281.coefficient17_465,
  OriginalRow227TriangleData0281.coefficient17_466,
  OriginalRow227TriangleData0281.coefficient17_467,
  OriginalRow227TriangleData0281.coefficient17_468,
  OriginalRow227TriangleData0281.coefficient17_469,
  OriginalRow227TriangleData0281.coefficient17_470,
  OriginalRow227TriangleData0281.coefficient17_471,
  OriginalRow227TriangleData0281.coefficient17_472,
  OriginalRow227TriangleData0281.coefficient17_473,
  OriginalRow227TriangleData0281.coefficient17_474,
  OriginalRow227TriangleData0281.coefficient17_475,
  OriginalRow227TriangleData0281.coefficient17_476,
  OriginalRow227TriangleData0281.coefficient17_477,
  OriginalRow227TriangleData0281.coefficient17_478,
  OriginalRow227TriangleData0281.coefficient17_479,
  OriginalRow227TriangleData0281.coefficient17_480,
  OriginalRow227TriangleData0281.coefficient17_481,
  OriginalRow227TriangleData0281.coefficient17_482,
  OriginalRow227TriangleData0281.coefficient17_483,
  OriginalRow227TriangleData0281.coefficient17_484
]

theorem values0281_size : values0281.size = 21 := rfl

def block0281 : ℕ → Option IntervalDyadic := segment 464 values0281

theorem block0281_domain : ExactDomain block0281 464 485 := by
  simpa only [values0281_size] using segment_domain 464 values0281

theorem block0281_get (i : Fin 21) :
    block0281 (464 + i.val) = some (values0281[i.val]'(by rw [values0281_size]; exact i.isLt)) := by
  exact segment_get 464 values0281 ⟨i.val, by rw [values0281_size]; exact i.isLt⟩

def node0048_0112 : ℕ → Option IntervalDyadic := split 80 block0268 block0269

theorem node0048_0112_domain : ExactDomain node0048_0112 48 112 := by
  exact split_domain (by decide) (by decide) block0268_domain block0269_domain

def node0016_0112 : ℕ → Option IntervalDyadic := split 48 block0267 node0048_0112

theorem node0016_0112_domain : ExactDomain node0016_0112 16 112 := by
  exact split_domain (by decide) (by decide) block0267_domain node0048_0112_domain

def node0112_0176 : ℕ → Option IntervalDyadic := split 144 block0270 block0271

theorem node0112_0176_domain : ExactDomain node0112_0176 112 176 := by
  exact split_domain (by decide) (by decide) block0270_domain block0271_domain

def node0176_0240 : ℕ → Option IntervalDyadic := split 208 block0272 block0273

theorem node0176_0240_domain : ExactDomain node0176_0240 176 240 := by
  exact split_domain (by decide) (by decide) block0272_domain block0273_domain

def node0112_0240 : ℕ → Option IntervalDyadic := split 176 node0112_0176 node0176_0240

theorem node0112_0240_domain : ExactDomain node0112_0240 112 240 := by
  exact split_domain (by decide) (by decide) node0112_0176_domain node0176_0240_domain

def node0016_0240 : ℕ → Option IntervalDyadic := split 112 node0016_0112 node0112_0240

theorem node0016_0240_domain : ExactDomain node0016_0240 16 240 := by
  exact split_domain (by decide) (by decide) node0016_0112_domain node0112_0240_domain

def node0240_0304 : ℕ → Option IntervalDyadic := split 272 block0274 block0275

theorem node0240_0304_domain : ExactDomain node0240_0304 240 304 := by
  exact split_domain (by decide) (by decide) block0274_domain block0275_domain

def node0304_0368 : ℕ → Option IntervalDyadic := split 336 block0276 block0277

theorem node0304_0368_domain : ExactDomain node0304_0368 304 368 := by
  exact split_domain (by decide) (by decide) block0276_domain block0277_domain

def node0240_0368 : ℕ → Option IntervalDyadic := split 304 node0240_0304 node0304_0368

theorem node0240_0368_domain : ExactDomain node0240_0368 240 368 := by
  exact split_domain (by decide) (by decide) node0240_0304_domain node0304_0368_domain

def node0368_0432 : ℕ → Option IntervalDyadic := split 400 block0278 block0279

theorem node0368_0432_domain : ExactDomain node0368_0432 368 432 := by
  exact split_domain (by decide) (by decide) block0278_domain block0279_domain

def node0432_0485 : ℕ → Option IntervalDyadic := split 464 block0280 block0281

theorem node0432_0485_domain : ExactDomain node0432_0485 432 485 := by
  exact split_domain (by decide) (by decide) block0280_domain block0281_domain

def node0368_0485 : ℕ → Option IntervalDyadic := split 432 node0368_0432 node0432_0485

theorem node0368_0485_domain : ExactDomain node0368_0485 368 485 := by
  exact split_domain (by decide) (by decide) node0368_0432_domain node0432_0485_domain

def node0240_0485 : ℕ → Option IntervalDyadic := split 368 node0240_0368 node0368_0485

theorem node0240_0485_domain : ExactDomain node0240_0485 240 485 := by
  exact split_domain (by decide) (by decide) node0240_0368_domain node0368_0485_domain

def node0016_0485 : ℕ → Option IntervalDyadic := split 240 node0016_0240 node0240_0485

theorem node0016_0485_domain : ExactDomain node0016_0485 16 485 := by
  exact split_domain (by decide) (by decide) node0016_0240_domain node0240_0485_domain

def lookup : ℕ → Option IntervalDyadic := node0016_0485

theorem lookup_domain : ExactDomain lookup 16 485 :=
  node0016_0485_domain

theorem block0267_lookup (i : Fin 32) :
    lookup (16 + i.val) = some (values0267[i.val]'(by rw [values0267_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (16 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_left 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0016_0112, split_left 48 block0267 node0048_0112 (by omega)]
  exact block0267_get i

theorem block0268_lookup (i : Fin 32) :
    lookup (48 + i.val) = some (values0268[i.val]'(by rw [values0268_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (48 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_left 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0016_0112, split_right 48 block0267 node0048_0112 (by omega)]
  rw [node0048_0112, split_left 80 block0268 block0269 (by omega)]
  exact block0268_get i

theorem block0269_lookup (i : Fin 32) :
    lookup (80 + i.val) = some (values0269[i.val]'(by rw [values0269_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (80 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_left 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0016_0112, split_right 48 block0267 node0048_0112 (by omega)]
  rw [node0048_0112, split_right 80 block0268 block0269 (by omega)]
  exact block0269_get i

theorem block0270_lookup (i : Fin 32) :
    lookup (112 + i.val) = some (values0270[i.val]'(by rw [values0270_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (112 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_right 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0112_0240, split_left 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0112_0176, split_left 144 block0270 block0271 (by omega)]
  exact block0270_get i

theorem block0271_lookup (i : Fin 32) :
    lookup (144 + i.val) = some (values0271[i.val]'(by rw [values0271_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (144 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_right 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0112_0240, split_left 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0112_0176, split_right 144 block0270 block0271 (by omega)]
  exact block0271_get i

theorem block0272_lookup (i : Fin 32) :
    lookup (176 + i.val) = some (values0272[i.val]'(by rw [values0272_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (176 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_right 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0112_0240, split_right 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0176_0240, split_left 208 block0272 block0273 (by omega)]
  exact block0272_get i

theorem block0273_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values0273[i.val]'(by rw [values0273_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (208 + i.val) = _
  rw [node0016_0485, split_left 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0016_0240, split_right 112 node0016_0112 node0112_0240 (by omega)]
  rw [node0112_0240, split_right 176 node0112_0176 node0176_0240 (by omega)]
  rw [node0176_0240, split_right 208 block0272 block0273 (by omega)]
  exact block0273_get i

theorem block0274_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values0274[i.val]'(by rw [values0274_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (240 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_left 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0240_0368, split_left 304 node0240_0304 node0304_0368 (by omega)]
  rw [node0240_0304, split_left 272 block0274 block0275 (by omega)]
  exact block0274_get i

theorem block0275_lookup (i : Fin 32) :
    lookup (272 + i.val) = some (values0275[i.val]'(by rw [values0275_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (272 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_left 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0240_0368, split_left 304 node0240_0304 node0304_0368 (by omega)]
  rw [node0240_0304, split_right 272 block0274 block0275 (by omega)]
  exact block0275_get i

theorem block0276_lookup (i : Fin 32) :
    lookup (304 + i.val) = some (values0276[i.val]'(by rw [values0276_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (304 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_left 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0240_0368, split_right 304 node0240_0304 node0304_0368 (by omega)]
  rw [node0304_0368, split_left 336 block0276 block0277 (by omega)]
  exact block0276_get i

theorem block0277_lookup (i : Fin 32) :
    lookup (336 + i.val) = some (values0277[i.val]'(by rw [values0277_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (336 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_left 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0240_0368, split_right 304 node0240_0304 node0304_0368 (by omega)]
  rw [node0304_0368, split_right 336 block0276 block0277 (by omega)]
  exact block0277_get i

theorem block0278_lookup (i : Fin 32) :
    lookup (368 + i.val) = some (values0278[i.val]'(by rw [values0278_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (368 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_right 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0368_0485, split_left 432 node0368_0432 node0432_0485 (by omega)]
  rw [node0368_0432, split_left 400 block0278 block0279 (by omega)]
  exact block0278_get i

theorem block0279_lookup (i : Fin 32) :
    lookup (400 + i.val) = some (values0279[i.val]'(by rw [values0279_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (400 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_right 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0368_0485, split_left 432 node0368_0432 node0432_0485 (by omega)]
  rw [node0368_0432, split_right 400 block0278 block0279 (by omega)]
  exact block0279_get i

theorem block0280_lookup (i : Fin 32) :
    lookup (432 + i.val) = some (values0280[i.val]'(by rw [values0280_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (432 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_right 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0368_0485, split_right 432 node0368_0432 node0432_0485 (by omega)]
  rw [node0432_0485, split_left 464 block0280 block0281 (by omega)]
  exact block0280_get i

theorem block0281_lookup (i : Fin 21) :
    lookup (464 + i.val) = some (values0281[i.val]'(by rw [values0281_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0016_0485 (464 + i.val) = _
  rw [node0016_0485, split_right 240 node0016_0240 node0240_0485 (by omega)]
  rw [node0240_0485, split_right 368 node0240_0368 node0368_0485 (by omega)]
  rw [node0368_0485, split_right 432 node0368_0432 node0432_0485 (by omega)]
  rw [node0432_0485, split_right 464 block0280 block0281 (by omega)]
  exact block0281_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0267_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0267_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0268_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0268_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0269_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0269_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0270_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0270_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0271_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0271_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0272_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0272_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0273_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0273_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0274_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0274_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0275_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0275_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0276_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0276_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0277_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0277_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0278_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0278_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0279_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0279_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0280_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0280_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0281_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0281_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0267_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0268_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0269_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0270_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0271_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0272_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0273_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0274_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0275_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0276_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0277_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0278_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0279_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0280_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow017.block0281_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow017
