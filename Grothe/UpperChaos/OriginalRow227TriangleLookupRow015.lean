import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0237
import Grothe.UpperChaos.OriginalRow227TriangleData0238
import Grothe.UpperChaos.OriginalRow227TriangleData0239
import Grothe.UpperChaos.OriginalRow227TriangleData0240
import Grothe.UpperChaos.OriginalRow227TriangleData0241
import Grothe.UpperChaos.OriginalRow227TriangleData0242
import Grothe.UpperChaos.OriginalRow227TriangleData0243
import Grothe.UpperChaos.OriginalRow227TriangleData0244
import Grothe.UpperChaos.OriginalRow227TriangleData0245
import Grothe.UpperChaos.OriginalRow227TriangleData0246
import Grothe.UpperChaos.OriginalRow227TriangleData0247
import Grothe.UpperChaos.OriginalRow227TriangleData0248
import Grothe.UpperChaos.OriginalRow227TriangleData0249
import Grothe.UpperChaos.OriginalRow227TriangleData0250
import Grothe.UpperChaos.OriginalRow227TriangleData0251

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow015

open ConditionalTableLookup

def values0237 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0237.coefficient15_14,
  OriginalRow227TriangleData0237.coefficient15_15,
  OriginalRow227TriangleData0237.coefficient15_16,
  OriginalRow227TriangleData0237.coefficient15_17,
  OriginalRow227TriangleData0237.coefficient15_18,
  OriginalRow227TriangleData0237.coefficient15_19,
  OriginalRow227TriangleData0237.coefficient15_20,
  OriginalRow227TriangleData0237.coefficient15_21,
  OriginalRow227TriangleData0237.coefficient15_22,
  OriginalRow227TriangleData0237.coefficient15_23,
  OriginalRow227TriangleData0237.coefficient15_24,
  OriginalRow227TriangleData0237.coefficient15_25,
  OriginalRow227TriangleData0237.coefficient15_26,
  OriginalRow227TriangleData0237.coefficient15_27,
  OriginalRow227TriangleData0237.coefficient15_28,
  OriginalRow227TriangleData0237.coefficient15_29,
  OriginalRow227TriangleData0237.coefficient15_30,
  OriginalRow227TriangleData0237.coefficient15_31,
  OriginalRow227TriangleData0237.coefficient15_32,
  OriginalRow227TriangleData0237.coefficient15_33,
  OriginalRow227TriangleData0237.coefficient15_34,
  OriginalRow227TriangleData0237.coefficient15_35,
  OriginalRow227TriangleData0237.coefficient15_36,
  OriginalRow227TriangleData0237.coefficient15_37,
  OriginalRow227TriangleData0237.coefficient15_38,
  OriginalRow227TriangleData0237.coefficient15_39,
  OriginalRow227TriangleData0237.coefficient15_40,
  OriginalRow227TriangleData0237.coefficient15_41,
  OriginalRow227TriangleData0237.coefficient15_42,
  OriginalRow227TriangleData0237.coefficient15_43,
  OriginalRow227TriangleData0237.coefficient15_44,
  OriginalRow227TriangleData0237.coefficient15_45
]

theorem values0237_size : values0237.size = 32 := rfl

def block0237 : ℕ → Option IntervalDyadic := segment 14 values0237

theorem block0237_domain : ExactDomain block0237 14 46 := by
  simpa only [values0237_size] using segment_domain 14 values0237

theorem block0237_get (i : Fin 32) :
    block0237 (14 + i.val) = some (values0237[i.val]'(by rw [values0237_size]; exact i.isLt)) := by
  exact segment_get 14 values0237 ⟨i.val, by rw [values0237_size]; exact i.isLt⟩

def values0238 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0238.coefficient15_46,
  OriginalRow227TriangleData0238.coefficient15_47,
  OriginalRow227TriangleData0238.coefficient15_48,
  OriginalRow227TriangleData0238.coefficient15_49,
  OriginalRow227TriangleData0238.coefficient15_50,
  OriginalRow227TriangleData0238.coefficient15_51,
  OriginalRow227TriangleData0238.coefficient15_52,
  OriginalRow227TriangleData0238.coefficient15_53,
  OriginalRow227TriangleData0238.coefficient15_54,
  OriginalRow227TriangleData0238.coefficient15_55,
  OriginalRow227TriangleData0238.coefficient15_56,
  OriginalRow227TriangleData0238.coefficient15_57,
  OriginalRow227TriangleData0238.coefficient15_58,
  OriginalRow227TriangleData0238.coefficient15_59,
  OriginalRow227TriangleData0238.coefficient15_60,
  OriginalRow227TriangleData0238.coefficient15_61,
  OriginalRow227TriangleData0238.coefficient15_62,
  OriginalRow227TriangleData0238.coefficient15_63,
  OriginalRow227TriangleData0238.coefficient15_64,
  OriginalRow227TriangleData0238.coefficient15_65,
  OriginalRow227TriangleData0238.coefficient15_66,
  OriginalRow227TriangleData0238.coefficient15_67,
  OriginalRow227TriangleData0238.coefficient15_68,
  OriginalRow227TriangleData0238.coefficient15_69,
  OriginalRow227TriangleData0238.coefficient15_70,
  OriginalRow227TriangleData0238.coefficient15_71,
  OriginalRow227TriangleData0238.coefficient15_72,
  OriginalRow227TriangleData0238.coefficient15_73,
  OriginalRow227TriangleData0238.coefficient15_74,
  OriginalRow227TriangleData0238.coefficient15_75,
  OriginalRow227TriangleData0238.coefficient15_76,
  OriginalRow227TriangleData0238.coefficient15_77
]

theorem values0238_size : values0238.size = 32 := rfl

def block0238 : ℕ → Option IntervalDyadic := segment 46 values0238

theorem block0238_domain : ExactDomain block0238 46 78 := by
  simpa only [values0238_size] using segment_domain 46 values0238

theorem block0238_get (i : Fin 32) :
    block0238 (46 + i.val) = some (values0238[i.val]'(by rw [values0238_size]; exact i.isLt)) := by
  exact segment_get 46 values0238 ⟨i.val, by rw [values0238_size]; exact i.isLt⟩

def values0239 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0239.coefficient15_78,
  OriginalRow227TriangleData0239.coefficient15_79,
  OriginalRow227TriangleData0239.coefficient15_80,
  OriginalRow227TriangleData0239.coefficient15_81,
  OriginalRow227TriangleData0239.coefficient15_82,
  OriginalRow227TriangleData0239.coefficient15_83,
  OriginalRow227TriangleData0239.coefficient15_84,
  OriginalRow227TriangleData0239.coefficient15_85,
  OriginalRow227TriangleData0239.coefficient15_86,
  OriginalRow227TriangleData0239.coefficient15_87,
  OriginalRow227TriangleData0239.coefficient15_88,
  OriginalRow227TriangleData0239.coefficient15_89,
  OriginalRow227TriangleData0239.coefficient15_90,
  OriginalRow227TriangleData0239.coefficient15_91,
  OriginalRow227TriangleData0239.coefficient15_92,
  OriginalRow227TriangleData0239.coefficient15_93,
  OriginalRow227TriangleData0239.coefficient15_94,
  OriginalRow227TriangleData0239.coefficient15_95,
  OriginalRow227TriangleData0239.coefficient15_96,
  OriginalRow227TriangleData0239.coefficient15_97,
  OriginalRow227TriangleData0239.coefficient15_98,
  OriginalRow227TriangleData0239.coefficient15_99,
  OriginalRow227TriangleData0239.coefficient15_100,
  OriginalRow227TriangleData0239.coefficient15_101,
  OriginalRow227TriangleData0239.coefficient15_102,
  OriginalRow227TriangleData0239.coefficient15_103,
  OriginalRow227TriangleData0239.coefficient15_104,
  OriginalRow227TriangleData0239.coefficient15_105,
  OriginalRow227TriangleData0239.coefficient15_106,
  OriginalRow227TriangleData0239.coefficient15_107,
  OriginalRow227TriangleData0239.coefficient15_108,
  OriginalRow227TriangleData0239.coefficient15_109
]

theorem values0239_size : values0239.size = 32 := rfl

def block0239 : ℕ → Option IntervalDyadic := segment 78 values0239

theorem block0239_domain : ExactDomain block0239 78 110 := by
  simpa only [values0239_size] using segment_domain 78 values0239

theorem block0239_get (i : Fin 32) :
    block0239 (78 + i.val) = some (values0239[i.val]'(by rw [values0239_size]; exact i.isLt)) := by
  exact segment_get 78 values0239 ⟨i.val, by rw [values0239_size]; exact i.isLt⟩

def values0240 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0240.coefficient15_110,
  OriginalRow227TriangleData0240.coefficient15_111,
  OriginalRow227TriangleData0240.coefficient15_112,
  OriginalRow227TriangleData0240.coefficient15_113,
  OriginalRow227TriangleData0240.coefficient15_114,
  OriginalRow227TriangleData0240.coefficient15_115,
  OriginalRow227TriangleData0240.coefficient15_116,
  OriginalRow227TriangleData0240.coefficient15_117,
  OriginalRow227TriangleData0240.coefficient15_118,
  OriginalRow227TriangleData0240.coefficient15_119,
  OriginalRow227TriangleData0240.coefficient15_120,
  OriginalRow227TriangleData0240.coefficient15_121,
  OriginalRow227TriangleData0240.coefficient15_122,
  OriginalRow227TriangleData0240.coefficient15_123,
  OriginalRow227TriangleData0240.coefficient15_124,
  OriginalRow227TriangleData0240.coefficient15_125,
  OriginalRow227TriangleData0240.coefficient15_126,
  OriginalRow227TriangleData0240.coefficient15_127,
  OriginalRow227TriangleData0240.coefficient15_128,
  OriginalRow227TriangleData0240.coefficient15_129,
  OriginalRow227TriangleData0240.coefficient15_130,
  OriginalRow227TriangleData0240.coefficient15_131,
  OriginalRow227TriangleData0240.coefficient15_132,
  OriginalRow227TriangleData0240.coefficient15_133,
  OriginalRow227TriangleData0240.coefficient15_134,
  OriginalRow227TriangleData0240.coefficient15_135,
  OriginalRow227TriangleData0240.coefficient15_136,
  OriginalRow227TriangleData0240.coefficient15_137,
  OriginalRow227TriangleData0240.coefficient15_138,
  OriginalRow227TriangleData0240.coefficient15_139,
  OriginalRow227TriangleData0240.coefficient15_140,
  OriginalRow227TriangleData0240.coefficient15_141
]

theorem values0240_size : values0240.size = 32 := rfl

def block0240 : ℕ → Option IntervalDyadic := segment 110 values0240

theorem block0240_domain : ExactDomain block0240 110 142 := by
  simpa only [values0240_size] using segment_domain 110 values0240

theorem block0240_get (i : Fin 32) :
    block0240 (110 + i.val) = some (values0240[i.val]'(by rw [values0240_size]; exact i.isLt)) := by
  exact segment_get 110 values0240 ⟨i.val, by rw [values0240_size]; exact i.isLt⟩

def values0241 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0241.coefficient15_142,
  OriginalRow227TriangleData0241.coefficient15_143,
  OriginalRow227TriangleData0241.coefficient15_144,
  OriginalRow227TriangleData0241.coefficient15_145,
  OriginalRow227TriangleData0241.coefficient15_146,
  OriginalRow227TriangleData0241.coefficient15_147,
  OriginalRow227TriangleData0241.coefficient15_148,
  OriginalRow227TriangleData0241.coefficient15_149,
  OriginalRow227TriangleData0241.coefficient15_150,
  OriginalRow227TriangleData0241.coefficient15_151,
  OriginalRow227TriangleData0241.coefficient15_152,
  OriginalRow227TriangleData0241.coefficient15_153,
  OriginalRow227TriangleData0241.coefficient15_154,
  OriginalRow227TriangleData0241.coefficient15_155,
  OriginalRow227TriangleData0241.coefficient15_156,
  OriginalRow227TriangleData0241.coefficient15_157,
  OriginalRow227TriangleData0241.coefficient15_158,
  OriginalRow227TriangleData0241.coefficient15_159,
  OriginalRow227TriangleData0241.coefficient15_160,
  OriginalRow227TriangleData0241.coefficient15_161,
  OriginalRow227TriangleData0241.coefficient15_162,
  OriginalRow227TriangleData0241.coefficient15_163,
  OriginalRow227TriangleData0241.coefficient15_164,
  OriginalRow227TriangleData0241.coefficient15_165,
  OriginalRow227TriangleData0241.coefficient15_166,
  OriginalRow227TriangleData0241.coefficient15_167,
  OriginalRow227TriangleData0241.coefficient15_168,
  OriginalRow227TriangleData0241.coefficient15_169,
  OriginalRow227TriangleData0241.coefficient15_170,
  OriginalRow227TriangleData0241.coefficient15_171,
  OriginalRow227TriangleData0241.coefficient15_172,
  OriginalRow227TriangleData0241.coefficient15_173
]

theorem values0241_size : values0241.size = 32 := rfl

def block0241 : ℕ → Option IntervalDyadic := segment 142 values0241

theorem block0241_domain : ExactDomain block0241 142 174 := by
  simpa only [values0241_size] using segment_domain 142 values0241

theorem block0241_get (i : Fin 32) :
    block0241 (142 + i.val) = some (values0241[i.val]'(by rw [values0241_size]; exact i.isLt)) := by
  exact segment_get 142 values0241 ⟨i.val, by rw [values0241_size]; exact i.isLt⟩

def values0242 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0242.coefficient15_174,
  OriginalRow227TriangleData0242.coefficient15_175,
  OriginalRow227TriangleData0242.coefficient15_176,
  OriginalRow227TriangleData0242.coefficient15_177,
  OriginalRow227TriangleData0242.coefficient15_178,
  OriginalRow227TriangleData0242.coefficient15_179,
  OriginalRow227TriangleData0242.coefficient15_180,
  OriginalRow227TriangleData0242.coefficient15_181,
  OriginalRow227TriangleData0242.coefficient15_182,
  OriginalRow227TriangleData0242.coefficient15_183,
  OriginalRow227TriangleData0242.coefficient15_184,
  OriginalRow227TriangleData0242.coefficient15_185,
  OriginalRow227TriangleData0242.coefficient15_186,
  OriginalRow227TriangleData0242.coefficient15_187,
  OriginalRow227TriangleData0242.coefficient15_188,
  OriginalRow227TriangleData0242.coefficient15_189,
  OriginalRow227TriangleData0242.coefficient15_190,
  OriginalRow227TriangleData0242.coefficient15_191,
  OriginalRow227TriangleData0242.coefficient15_192,
  OriginalRow227TriangleData0242.coefficient15_193,
  OriginalRow227TriangleData0242.coefficient15_194,
  OriginalRow227TriangleData0242.coefficient15_195,
  OriginalRow227TriangleData0242.coefficient15_196,
  OriginalRow227TriangleData0242.coefficient15_197,
  OriginalRow227TriangleData0242.coefficient15_198,
  OriginalRow227TriangleData0242.coefficient15_199,
  OriginalRow227TriangleData0242.coefficient15_200,
  OriginalRow227TriangleData0242.coefficient15_201,
  OriginalRow227TriangleData0242.coefficient15_202,
  OriginalRow227TriangleData0242.coefficient15_203,
  OriginalRow227TriangleData0242.coefficient15_204,
  OriginalRow227TriangleData0242.coefficient15_205
]

theorem values0242_size : values0242.size = 32 := rfl

def block0242 : ℕ → Option IntervalDyadic := segment 174 values0242

theorem block0242_domain : ExactDomain block0242 174 206 := by
  simpa only [values0242_size] using segment_domain 174 values0242

theorem block0242_get (i : Fin 32) :
    block0242 (174 + i.val) = some (values0242[i.val]'(by rw [values0242_size]; exact i.isLt)) := by
  exact segment_get 174 values0242 ⟨i.val, by rw [values0242_size]; exact i.isLt⟩

def values0243 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0243.coefficient15_206,
  OriginalRow227TriangleData0243.coefficient15_207,
  OriginalRow227TriangleData0243.coefficient15_208,
  OriginalRow227TriangleData0243.coefficient15_209,
  OriginalRow227TriangleData0243.coefficient15_210,
  OriginalRow227TriangleData0243.coefficient15_211,
  OriginalRow227TriangleData0243.coefficient15_212,
  OriginalRow227TriangleData0243.coefficient15_213,
  OriginalRow227TriangleData0243.coefficient15_214,
  OriginalRow227TriangleData0243.coefficient15_215,
  OriginalRow227TriangleData0243.coefficient15_216,
  OriginalRow227TriangleData0243.coefficient15_217,
  OriginalRow227TriangleData0243.coefficient15_218,
  OriginalRow227TriangleData0243.coefficient15_219,
  OriginalRow227TriangleData0243.coefficient15_220,
  OriginalRow227TriangleData0243.coefficient15_221,
  OriginalRow227TriangleData0243.coefficient15_222,
  OriginalRow227TriangleData0243.coefficient15_223,
  OriginalRow227TriangleData0243.coefficient15_224,
  OriginalRow227TriangleData0243.coefficient15_225,
  OriginalRow227TriangleData0243.coefficient15_226,
  OriginalRow227TriangleData0243.coefficient15_227,
  OriginalRow227TriangleData0243.coefficient15_228,
  OriginalRow227TriangleData0243.coefficient15_229,
  OriginalRow227TriangleData0243.coefficient15_230,
  OriginalRow227TriangleData0243.coefficient15_231,
  OriginalRow227TriangleData0243.coefficient15_232,
  OriginalRow227TriangleData0243.coefficient15_233,
  OriginalRow227TriangleData0243.coefficient15_234,
  OriginalRow227TriangleData0243.coefficient15_235,
  OriginalRow227TriangleData0243.coefficient15_236,
  OriginalRow227TriangleData0243.coefficient15_237
]

theorem values0243_size : values0243.size = 32 := rfl

def block0243 : ℕ → Option IntervalDyadic := segment 206 values0243

theorem block0243_domain : ExactDomain block0243 206 238 := by
  simpa only [values0243_size] using segment_domain 206 values0243

theorem block0243_get (i : Fin 32) :
    block0243 (206 + i.val) = some (values0243[i.val]'(by rw [values0243_size]; exact i.isLt)) := by
  exact segment_get 206 values0243 ⟨i.val, by rw [values0243_size]; exact i.isLt⟩

def values0244 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0244.coefficient15_238,
  OriginalRow227TriangleData0244.coefficient15_239,
  OriginalRow227TriangleData0244.coefficient15_240,
  OriginalRow227TriangleData0244.coefficient15_241,
  OriginalRow227TriangleData0244.coefficient15_242,
  OriginalRow227TriangleData0244.coefficient15_243,
  OriginalRow227TriangleData0244.coefficient15_244,
  OriginalRow227TriangleData0244.coefficient15_245,
  OriginalRow227TriangleData0244.coefficient15_246,
  OriginalRow227TriangleData0244.coefficient15_247,
  OriginalRow227TriangleData0244.coefficient15_248,
  OriginalRow227TriangleData0244.coefficient15_249,
  OriginalRow227TriangleData0244.coefficient15_250,
  OriginalRow227TriangleData0244.coefficient15_251,
  OriginalRow227TriangleData0244.coefficient15_252,
  OriginalRow227TriangleData0244.coefficient15_253,
  OriginalRow227TriangleData0244.coefficient15_254,
  OriginalRow227TriangleData0244.coefficient15_255,
  OriginalRow227TriangleData0244.coefficient15_256,
  OriginalRow227TriangleData0244.coefficient15_257,
  OriginalRow227TriangleData0244.coefficient15_258,
  OriginalRow227TriangleData0244.coefficient15_259,
  OriginalRow227TriangleData0244.coefficient15_260,
  OriginalRow227TriangleData0244.coefficient15_261,
  OriginalRow227TriangleData0244.coefficient15_262,
  OriginalRow227TriangleData0244.coefficient15_263,
  OriginalRow227TriangleData0244.coefficient15_264,
  OriginalRow227TriangleData0244.coefficient15_265,
  OriginalRow227TriangleData0244.coefficient15_266,
  OriginalRow227TriangleData0244.coefficient15_267,
  OriginalRow227TriangleData0244.coefficient15_268,
  OriginalRow227TriangleData0244.coefficient15_269
]

theorem values0244_size : values0244.size = 32 := rfl

def block0244 : ℕ → Option IntervalDyadic := segment 238 values0244

theorem block0244_domain : ExactDomain block0244 238 270 := by
  simpa only [values0244_size] using segment_domain 238 values0244

theorem block0244_get (i : Fin 32) :
    block0244 (238 + i.val) = some (values0244[i.val]'(by rw [values0244_size]; exact i.isLt)) := by
  exact segment_get 238 values0244 ⟨i.val, by rw [values0244_size]; exact i.isLt⟩

def values0245 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0245.coefficient15_270,
  OriginalRow227TriangleData0245.coefficient15_271,
  OriginalRow227TriangleData0245.coefficient15_272,
  OriginalRow227TriangleData0245.coefficient15_273,
  OriginalRow227TriangleData0245.coefficient15_274,
  OriginalRow227TriangleData0245.coefficient15_275,
  OriginalRow227TriangleData0245.coefficient15_276,
  OriginalRow227TriangleData0245.coefficient15_277,
  OriginalRow227TriangleData0245.coefficient15_278,
  OriginalRow227TriangleData0245.coefficient15_279,
  OriginalRow227TriangleData0245.coefficient15_280,
  OriginalRow227TriangleData0245.coefficient15_281,
  OriginalRow227TriangleData0245.coefficient15_282,
  OriginalRow227TriangleData0245.coefficient15_283,
  OriginalRow227TriangleData0245.coefficient15_284,
  OriginalRow227TriangleData0245.coefficient15_285,
  OriginalRow227TriangleData0245.coefficient15_286,
  OriginalRow227TriangleData0245.coefficient15_287,
  OriginalRow227TriangleData0245.coefficient15_288,
  OriginalRow227TriangleData0245.coefficient15_289,
  OriginalRow227TriangleData0245.coefficient15_290,
  OriginalRow227TriangleData0245.coefficient15_291,
  OriginalRow227TriangleData0245.coefficient15_292,
  OriginalRow227TriangleData0245.coefficient15_293,
  OriginalRow227TriangleData0245.coefficient15_294,
  OriginalRow227TriangleData0245.coefficient15_295,
  OriginalRow227TriangleData0245.coefficient15_296,
  OriginalRow227TriangleData0245.coefficient15_297,
  OriginalRow227TriangleData0245.coefficient15_298,
  OriginalRow227TriangleData0245.coefficient15_299,
  OriginalRow227TriangleData0245.coefficient15_300,
  OriginalRow227TriangleData0245.coefficient15_301
]

theorem values0245_size : values0245.size = 32 := rfl

def block0245 : ℕ → Option IntervalDyadic := segment 270 values0245

theorem block0245_domain : ExactDomain block0245 270 302 := by
  simpa only [values0245_size] using segment_domain 270 values0245

theorem block0245_get (i : Fin 32) :
    block0245 (270 + i.val) = some (values0245[i.val]'(by rw [values0245_size]; exact i.isLt)) := by
  exact segment_get 270 values0245 ⟨i.val, by rw [values0245_size]; exact i.isLt⟩

def values0246 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0246.coefficient15_302,
  OriginalRow227TriangleData0246.coefficient15_303,
  OriginalRow227TriangleData0246.coefficient15_304,
  OriginalRow227TriangleData0246.coefficient15_305,
  OriginalRow227TriangleData0246.coefficient15_306,
  OriginalRow227TriangleData0246.coefficient15_307,
  OriginalRow227TriangleData0246.coefficient15_308,
  OriginalRow227TriangleData0246.coefficient15_309,
  OriginalRow227TriangleData0246.coefficient15_310,
  OriginalRow227TriangleData0246.coefficient15_311,
  OriginalRow227TriangleData0246.coefficient15_312,
  OriginalRow227TriangleData0246.coefficient15_313,
  OriginalRow227TriangleData0246.coefficient15_314,
  OriginalRow227TriangleData0246.coefficient15_315,
  OriginalRow227TriangleData0246.coefficient15_316,
  OriginalRow227TriangleData0246.coefficient15_317,
  OriginalRow227TriangleData0246.coefficient15_318,
  OriginalRow227TriangleData0246.coefficient15_319,
  OriginalRow227TriangleData0246.coefficient15_320,
  OriginalRow227TriangleData0246.coefficient15_321,
  OriginalRow227TriangleData0246.coefficient15_322,
  OriginalRow227TriangleData0246.coefficient15_323,
  OriginalRow227TriangleData0246.coefficient15_324,
  OriginalRow227TriangleData0246.coefficient15_325,
  OriginalRow227TriangleData0246.coefficient15_326,
  OriginalRow227TriangleData0246.coefficient15_327,
  OriginalRow227TriangleData0246.coefficient15_328,
  OriginalRow227TriangleData0246.coefficient15_329,
  OriginalRow227TriangleData0246.coefficient15_330,
  OriginalRow227TriangleData0246.coefficient15_331,
  OriginalRow227TriangleData0246.coefficient15_332,
  OriginalRow227TriangleData0246.coefficient15_333
]

theorem values0246_size : values0246.size = 32 := rfl

def block0246 : ℕ → Option IntervalDyadic := segment 302 values0246

theorem block0246_domain : ExactDomain block0246 302 334 := by
  simpa only [values0246_size] using segment_domain 302 values0246

theorem block0246_get (i : Fin 32) :
    block0246 (302 + i.val) = some (values0246[i.val]'(by rw [values0246_size]; exact i.isLt)) := by
  exact segment_get 302 values0246 ⟨i.val, by rw [values0246_size]; exact i.isLt⟩

def values0247 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0247.coefficient15_334,
  OriginalRow227TriangleData0247.coefficient15_335,
  OriginalRow227TriangleData0247.coefficient15_336,
  OriginalRow227TriangleData0247.coefficient15_337,
  OriginalRow227TriangleData0247.coefficient15_338,
  OriginalRow227TriangleData0247.coefficient15_339,
  OriginalRow227TriangleData0247.coefficient15_340,
  OriginalRow227TriangleData0247.coefficient15_341,
  OriginalRow227TriangleData0247.coefficient15_342,
  OriginalRow227TriangleData0247.coefficient15_343,
  OriginalRow227TriangleData0247.coefficient15_344,
  OriginalRow227TriangleData0247.coefficient15_345,
  OriginalRow227TriangleData0247.coefficient15_346,
  OriginalRow227TriangleData0247.coefficient15_347,
  OriginalRow227TriangleData0247.coefficient15_348,
  OriginalRow227TriangleData0247.coefficient15_349,
  OriginalRow227TriangleData0247.coefficient15_350,
  OriginalRow227TriangleData0247.coefficient15_351,
  OriginalRow227TriangleData0247.coefficient15_352,
  OriginalRow227TriangleData0247.coefficient15_353,
  OriginalRow227TriangleData0247.coefficient15_354,
  OriginalRow227TriangleData0247.coefficient15_355,
  OriginalRow227TriangleData0247.coefficient15_356,
  OriginalRow227TriangleData0247.coefficient15_357,
  OriginalRow227TriangleData0247.coefficient15_358,
  OriginalRow227TriangleData0247.coefficient15_359,
  OriginalRow227TriangleData0247.coefficient15_360,
  OriginalRow227TriangleData0247.coefficient15_361,
  OriginalRow227TriangleData0247.coefficient15_362,
  OriginalRow227TriangleData0247.coefficient15_363,
  OriginalRow227TriangleData0247.coefficient15_364,
  OriginalRow227TriangleData0247.coefficient15_365
]

theorem values0247_size : values0247.size = 32 := rfl

def block0247 : ℕ → Option IntervalDyadic := segment 334 values0247

theorem block0247_domain : ExactDomain block0247 334 366 := by
  simpa only [values0247_size] using segment_domain 334 values0247

theorem block0247_get (i : Fin 32) :
    block0247 (334 + i.val) = some (values0247[i.val]'(by rw [values0247_size]; exact i.isLt)) := by
  exact segment_get 334 values0247 ⟨i.val, by rw [values0247_size]; exact i.isLt⟩

def values0248 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0248.coefficient15_366,
  OriginalRow227TriangleData0248.coefficient15_367,
  OriginalRow227TriangleData0248.coefficient15_368,
  OriginalRow227TriangleData0248.coefficient15_369,
  OriginalRow227TriangleData0248.coefficient15_370,
  OriginalRow227TriangleData0248.coefficient15_371,
  OriginalRow227TriangleData0248.coefficient15_372,
  OriginalRow227TriangleData0248.coefficient15_373,
  OriginalRow227TriangleData0248.coefficient15_374,
  OriginalRow227TriangleData0248.coefficient15_375,
  OriginalRow227TriangleData0248.coefficient15_376,
  OriginalRow227TriangleData0248.coefficient15_377,
  OriginalRow227TriangleData0248.coefficient15_378,
  OriginalRow227TriangleData0248.coefficient15_379,
  OriginalRow227TriangleData0248.coefficient15_380,
  OriginalRow227TriangleData0248.coefficient15_381,
  OriginalRow227TriangleData0248.coefficient15_382,
  OriginalRow227TriangleData0248.coefficient15_383,
  OriginalRow227TriangleData0248.coefficient15_384,
  OriginalRow227TriangleData0248.coefficient15_385,
  OriginalRow227TriangleData0248.coefficient15_386,
  OriginalRow227TriangleData0248.coefficient15_387,
  OriginalRow227TriangleData0248.coefficient15_388,
  OriginalRow227TriangleData0248.coefficient15_389,
  OriginalRow227TriangleData0248.coefficient15_390,
  OriginalRow227TriangleData0248.coefficient15_391,
  OriginalRow227TriangleData0248.coefficient15_392,
  OriginalRow227TriangleData0248.coefficient15_393,
  OriginalRow227TriangleData0248.coefficient15_394,
  OriginalRow227TriangleData0248.coefficient15_395,
  OriginalRow227TriangleData0248.coefficient15_396,
  OriginalRow227TriangleData0248.coefficient15_397
]

theorem values0248_size : values0248.size = 32 := rfl

def block0248 : ℕ → Option IntervalDyadic := segment 366 values0248

theorem block0248_domain : ExactDomain block0248 366 398 := by
  simpa only [values0248_size] using segment_domain 366 values0248

theorem block0248_get (i : Fin 32) :
    block0248 (366 + i.val) = some (values0248[i.val]'(by rw [values0248_size]; exact i.isLt)) := by
  exact segment_get 366 values0248 ⟨i.val, by rw [values0248_size]; exact i.isLt⟩

def values0249 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0249.coefficient15_398,
  OriginalRow227TriangleData0249.coefficient15_399,
  OriginalRow227TriangleData0249.coefficient15_400,
  OriginalRow227TriangleData0249.coefficient15_401,
  OriginalRow227TriangleData0249.coefficient15_402,
  OriginalRow227TriangleData0249.coefficient15_403,
  OriginalRow227TriangleData0249.coefficient15_404,
  OriginalRow227TriangleData0249.coefficient15_405,
  OriginalRow227TriangleData0249.coefficient15_406,
  OriginalRow227TriangleData0249.coefficient15_407,
  OriginalRow227TriangleData0249.coefficient15_408,
  OriginalRow227TriangleData0249.coefficient15_409,
  OriginalRow227TriangleData0249.coefficient15_410,
  OriginalRow227TriangleData0249.coefficient15_411,
  OriginalRow227TriangleData0249.coefficient15_412,
  OriginalRow227TriangleData0249.coefficient15_413,
  OriginalRow227TriangleData0249.coefficient15_414,
  OriginalRow227TriangleData0249.coefficient15_415,
  OriginalRow227TriangleData0249.coefficient15_416,
  OriginalRow227TriangleData0249.coefficient15_417,
  OriginalRow227TriangleData0249.coefficient15_418,
  OriginalRow227TriangleData0249.coefficient15_419,
  OriginalRow227TriangleData0249.coefficient15_420,
  OriginalRow227TriangleData0249.coefficient15_421,
  OriginalRow227TriangleData0249.coefficient15_422,
  OriginalRow227TriangleData0249.coefficient15_423,
  OriginalRow227TriangleData0249.coefficient15_424,
  OriginalRow227TriangleData0249.coefficient15_425,
  OriginalRow227TriangleData0249.coefficient15_426,
  OriginalRow227TriangleData0249.coefficient15_427,
  OriginalRow227TriangleData0249.coefficient15_428,
  OriginalRow227TriangleData0249.coefficient15_429
]

theorem values0249_size : values0249.size = 32 := rfl

def block0249 : ℕ → Option IntervalDyadic := segment 398 values0249

theorem block0249_domain : ExactDomain block0249 398 430 := by
  simpa only [values0249_size] using segment_domain 398 values0249

theorem block0249_get (i : Fin 32) :
    block0249 (398 + i.val) = some (values0249[i.val]'(by rw [values0249_size]; exact i.isLt)) := by
  exact segment_get 398 values0249 ⟨i.val, by rw [values0249_size]; exact i.isLt⟩

def values0250 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0250.coefficient15_430,
  OriginalRow227TriangleData0250.coefficient15_431,
  OriginalRow227TriangleData0250.coefficient15_432,
  OriginalRow227TriangleData0250.coefficient15_433,
  OriginalRow227TriangleData0250.coefficient15_434,
  OriginalRow227TriangleData0250.coefficient15_435,
  OriginalRow227TriangleData0250.coefficient15_436,
  OriginalRow227TriangleData0250.coefficient15_437,
  OriginalRow227TriangleData0250.coefficient15_438,
  OriginalRow227TriangleData0250.coefficient15_439,
  OriginalRow227TriangleData0250.coefficient15_440,
  OriginalRow227TriangleData0250.coefficient15_441,
  OriginalRow227TriangleData0250.coefficient15_442,
  OriginalRow227TriangleData0250.coefficient15_443,
  OriginalRow227TriangleData0250.coefficient15_444,
  OriginalRow227TriangleData0250.coefficient15_445,
  OriginalRow227TriangleData0250.coefficient15_446,
  OriginalRow227TriangleData0250.coefficient15_447,
  OriginalRow227TriangleData0250.coefficient15_448,
  OriginalRow227TriangleData0250.coefficient15_449,
  OriginalRow227TriangleData0250.coefficient15_450,
  OriginalRow227TriangleData0250.coefficient15_451,
  OriginalRow227TriangleData0250.coefficient15_452,
  OriginalRow227TriangleData0250.coefficient15_453,
  OriginalRow227TriangleData0250.coefficient15_454,
  OriginalRow227TriangleData0250.coefficient15_455,
  OriginalRow227TriangleData0250.coefficient15_456,
  OriginalRow227TriangleData0250.coefficient15_457,
  OriginalRow227TriangleData0250.coefficient15_458,
  OriginalRow227TriangleData0250.coefficient15_459,
  OriginalRow227TriangleData0250.coefficient15_460,
  OriginalRow227TriangleData0250.coefficient15_461
]

theorem values0250_size : values0250.size = 32 := rfl

def block0250 : ℕ → Option IntervalDyadic := segment 430 values0250

theorem block0250_domain : ExactDomain block0250 430 462 := by
  simpa only [values0250_size] using segment_domain 430 values0250

theorem block0250_get (i : Fin 32) :
    block0250 (430 + i.val) = some (values0250[i.val]'(by rw [values0250_size]; exact i.isLt)) := by
  exact segment_get 430 values0250 ⟨i.val, by rw [values0250_size]; exact i.isLt⟩

def values0251 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0251.coefficient15_462,
  OriginalRow227TriangleData0251.coefficient15_463,
  OriginalRow227TriangleData0251.coefficient15_464,
  OriginalRow227TriangleData0251.coefficient15_465,
  OriginalRow227TriangleData0251.coefficient15_466,
  OriginalRow227TriangleData0251.coefficient15_467,
  OriginalRow227TriangleData0251.coefficient15_468,
  OriginalRow227TriangleData0251.coefficient15_469,
  OriginalRow227TriangleData0251.coefficient15_470,
  OriginalRow227TriangleData0251.coefficient15_471,
  OriginalRow227TriangleData0251.coefficient15_472,
  OriginalRow227TriangleData0251.coefficient15_473,
  OriginalRow227TriangleData0251.coefficient15_474,
  OriginalRow227TriangleData0251.coefficient15_475,
  OriginalRow227TriangleData0251.coefficient15_476,
  OriginalRow227TriangleData0251.coefficient15_477,
  OriginalRow227TriangleData0251.coefficient15_478,
  OriginalRow227TriangleData0251.coefficient15_479,
  OriginalRow227TriangleData0251.coefficient15_480,
  OriginalRow227TriangleData0251.coefficient15_481,
  OriginalRow227TriangleData0251.coefficient15_482,
  OriginalRow227TriangleData0251.coefficient15_483,
  OriginalRow227TriangleData0251.coefficient15_484,
  OriginalRow227TriangleData0251.coefficient15_485,
  OriginalRow227TriangleData0251.coefficient15_486
]

theorem values0251_size : values0251.size = 25 := rfl

def block0251 : ℕ → Option IntervalDyadic := segment 462 values0251

theorem block0251_domain : ExactDomain block0251 462 487 := by
  simpa only [values0251_size] using segment_domain 462 values0251

theorem block0251_get (i : Fin 25) :
    block0251 (462 + i.val) = some (values0251[i.val]'(by rw [values0251_size]; exact i.isLt)) := by
  exact segment_get 462 values0251 ⟨i.val, by rw [values0251_size]; exact i.isLt⟩

def node0046_0110 : ℕ → Option IntervalDyadic := split 78 block0238 block0239

theorem node0046_0110_domain : ExactDomain node0046_0110 46 110 := by
  exact split_domain (by decide) (by decide) block0238_domain block0239_domain

def node0014_0110 : ℕ → Option IntervalDyadic := split 46 block0237 node0046_0110

theorem node0014_0110_domain : ExactDomain node0014_0110 14 110 := by
  exact split_domain (by decide) (by decide) block0237_domain node0046_0110_domain

def node0110_0174 : ℕ → Option IntervalDyadic := split 142 block0240 block0241

theorem node0110_0174_domain : ExactDomain node0110_0174 110 174 := by
  exact split_domain (by decide) (by decide) block0240_domain block0241_domain

def node0174_0238 : ℕ → Option IntervalDyadic := split 206 block0242 block0243

theorem node0174_0238_domain : ExactDomain node0174_0238 174 238 := by
  exact split_domain (by decide) (by decide) block0242_domain block0243_domain

def node0110_0238 : ℕ → Option IntervalDyadic := split 174 node0110_0174 node0174_0238

theorem node0110_0238_domain : ExactDomain node0110_0238 110 238 := by
  exact split_domain (by decide) (by decide) node0110_0174_domain node0174_0238_domain

def node0014_0238 : ℕ → Option IntervalDyadic := split 110 node0014_0110 node0110_0238

theorem node0014_0238_domain : ExactDomain node0014_0238 14 238 := by
  exact split_domain (by decide) (by decide) node0014_0110_domain node0110_0238_domain

def node0238_0302 : ℕ → Option IntervalDyadic := split 270 block0244 block0245

theorem node0238_0302_domain : ExactDomain node0238_0302 238 302 := by
  exact split_domain (by decide) (by decide) block0244_domain block0245_domain

def node0302_0366 : ℕ → Option IntervalDyadic := split 334 block0246 block0247

theorem node0302_0366_domain : ExactDomain node0302_0366 302 366 := by
  exact split_domain (by decide) (by decide) block0246_domain block0247_domain

def node0238_0366 : ℕ → Option IntervalDyadic := split 302 node0238_0302 node0302_0366

theorem node0238_0366_domain : ExactDomain node0238_0366 238 366 := by
  exact split_domain (by decide) (by decide) node0238_0302_domain node0302_0366_domain

def node0366_0430 : ℕ → Option IntervalDyadic := split 398 block0248 block0249

theorem node0366_0430_domain : ExactDomain node0366_0430 366 430 := by
  exact split_domain (by decide) (by decide) block0248_domain block0249_domain

def node0430_0487 : ℕ → Option IntervalDyadic := split 462 block0250 block0251

theorem node0430_0487_domain : ExactDomain node0430_0487 430 487 := by
  exact split_domain (by decide) (by decide) block0250_domain block0251_domain

def node0366_0487 : ℕ → Option IntervalDyadic := split 430 node0366_0430 node0430_0487

theorem node0366_0487_domain : ExactDomain node0366_0487 366 487 := by
  exact split_domain (by decide) (by decide) node0366_0430_domain node0430_0487_domain

def node0238_0487 : ℕ → Option IntervalDyadic := split 366 node0238_0366 node0366_0487

theorem node0238_0487_domain : ExactDomain node0238_0487 238 487 := by
  exact split_domain (by decide) (by decide) node0238_0366_domain node0366_0487_domain

def node0014_0487 : ℕ → Option IntervalDyadic := split 238 node0014_0238 node0238_0487

theorem node0014_0487_domain : ExactDomain node0014_0487 14 487 := by
  exact split_domain (by decide) (by decide) node0014_0238_domain node0238_0487_domain

def lookup : ℕ → Option IntervalDyadic := node0014_0487

theorem lookup_domain : ExactDomain lookup 14 487 :=
  node0014_0487_domain

theorem block0237_lookup (i : Fin 32) :
    lookup (14 + i.val) = some (values0237[i.val]'(by rw [values0237_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (14 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_left 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0014_0110, split_left 46 block0237 node0046_0110 (by omega)]
  exact block0237_get i

theorem block0238_lookup (i : Fin 32) :
    lookup (46 + i.val) = some (values0238[i.val]'(by rw [values0238_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (46 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_left 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0014_0110, split_right 46 block0237 node0046_0110 (by omega)]
  rw [node0046_0110, split_left 78 block0238 block0239 (by omega)]
  exact block0238_get i

theorem block0239_lookup (i : Fin 32) :
    lookup (78 + i.val) = some (values0239[i.val]'(by rw [values0239_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (78 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_left 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0014_0110, split_right 46 block0237 node0046_0110 (by omega)]
  rw [node0046_0110, split_right 78 block0238 block0239 (by omega)]
  exact block0239_get i

theorem block0240_lookup (i : Fin 32) :
    lookup (110 + i.val) = some (values0240[i.val]'(by rw [values0240_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (110 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_right 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0110_0238, split_left 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0110_0174, split_left 142 block0240 block0241 (by omega)]
  exact block0240_get i

theorem block0241_lookup (i : Fin 32) :
    lookup (142 + i.val) = some (values0241[i.val]'(by rw [values0241_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (142 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_right 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0110_0238, split_left 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0110_0174, split_right 142 block0240 block0241 (by omega)]
  exact block0241_get i

theorem block0242_lookup (i : Fin 32) :
    lookup (174 + i.val) = some (values0242[i.val]'(by rw [values0242_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (174 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_right 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0110_0238, split_right 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0174_0238, split_left 206 block0242 block0243 (by omega)]
  exact block0242_get i

theorem block0243_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values0243[i.val]'(by rw [values0243_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (206 + i.val) = _
  rw [node0014_0487, split_left 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0014_0238, split_right 110 node0014_0110 node0110_0238 (by omega)]
  rw [node0110_0238, split_right 174 node0110_0174 node0174_0238 (by omega)]
  rw [node0174_0238, split_right 206 block0242 block0243 (by omega)]
  exact block0243_get i

theorem block0244_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values0244[i.val]'(by rw [values0244_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (238 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_left 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0238_0366, split_left 302 node0238_0302 node0302_0366 (by omega)]
  rw [node0238_0302, split_left 270 block0244 block0245 (by omega)]
  exact block0244_get i

theorem block0245_lookup (i : Fin 32) :
    lookup (270 + i.val) = some (values0245[i.val]'(by rw [values0245_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (270 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_left 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0238_0366, split_left 302 node0238_0302 node0302_0366 (by omega)]
  rw [node0238_0302, split_right 270 block0244 block0245 (by omega)]
  exact block0245_get i

theorem block0246_lookup (i : Fin 32) :
    lookup (302 + i.val) = some (values0246[i.val]'(by rw [values0246_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (302 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_left 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0238_0366, split_right 302 node0238_0302 node0302_0366 (by omega)]
  rw [node0302_0366, split_left 334 block0246 block0247 (by omega)]
  exact block0246_get i

theorem block0247_lookup (i : Fin 32) :
    lookup (334 + i.val) = some (values0247[i.val]'(by rw [values0247_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (334 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_left 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0238_0366, split_right 302 node0238_0302 node0302_0366 (by omega)]
  rw [node0302_0366, split_right 334 block0246 block0247 (by omega)]
  exact block0247_get i

theorem block0248_lookup (i : Fin 32) :
    lookup (366 + i.val) = some (values0248[i.val]'(by rw [values0248_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (366 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_right 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0366_0487, split_left 430 node0366_0430 node0430_0487 (by omega)]
  rw [node0366_0430, split_left 398 block0248 block0249 (by omega)]
  exact block0248_get i

theorem block0249_lookup (i : Fin 32) :
    lookup (398 + i.val) = some (values0249[i.val]'(by rw [values0249_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (398 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_right 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0366_0487, split_left 430 node0366_0430 node0430_0487 (by omega)]
  rw [node0366_0430, split_right 398 block0248 block0249 (by omega)]
  exact block0249_get i

theorem block0250_lookup (i : Fin 32) :
    lookup (430 + i.val) = some (values0250[i.val]'(by rw [values0250_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (430 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_right 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0366_0487, split_right 430 node0366_0430 node0430_0487 (by omega)]
  rw [node0430_0487, split_left 462 block0250 block0251 (by omega)]
  exact block0250_get i

theorem block0251_lookup (i : Fin 25) :
    lookup (462 + i.val) = some (values0251[i.val]'(by rw [values0251_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0014_0487 (462 + i.val) = _
  rw [node0014_0487, split_right 238 node0014_0238 node0238_0487 (by omega)]
  rw [node0238_0487, split_right 366 node0238_0366 node0366_0487 (by omega)]
  rw [node0366_0487, split_right 430 node0366_0430 node0430_0487 (by omega)]
  rw [node0430_0487, split_right 462 block0250 block0251 (by omega)]
  exact block0251_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0237_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0237_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0238_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0238_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0239_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0239_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0240_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0240_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0241_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0241_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0242_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0242_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0243_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0243_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0244_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0244_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0245_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0245_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0246_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0246_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0247_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0247_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0248_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0248_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0249_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0249_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0250_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0250_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0251_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0251_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0237_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0238_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0239_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0240_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0241_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0242_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0243_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0244_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0245_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0246_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0247_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0248_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0249_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0250_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow015.block0251_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow015
