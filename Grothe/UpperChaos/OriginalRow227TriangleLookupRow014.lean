import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0222
import Grothe.UpperChaos.OriginalRow227TriangleData0223
import Grothe.UpperChaos.OriginalRow227TriangleData0224
import Grothe.UpperChaos.OriginalRow227TriangleData0225
import Grothe.UpperChaos.OriginalRow227TriangleData0226
import Grothe.UpperChaos.OriginalRow227TriangleData0227
import Grothe.UpperChaos.OriginalRow227TriangleData0228
import Grothe.UpperChaos.OriginalRow227TriangleData0229
import Grothe.UpperChaos.OriginalRow227TriangleData0230
import Grothe.UpperChaos.OriginalRow227TriangleData0231
import Grothe.UpperChaos.OriginalRow227TriangleData0232
import Grothe.UpperChaos.OriginalRow227TriangleData0233
import Grothe.UpperChaos.OriginalRow227TriangleData0234
import Grothe.UpperChaos.OriginalRow227TriangleData0235
import Grothe.UpperChaos.OriginalRow227TriangleData0236

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow014

open ConditionalTableLookup

def values0222 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0222.coefficient14_13,
  OriginalRow227TriangleData0222.coefficient14_14,
  OriginalRow227TriangleData0222.coefficient14_15,
  OriginalRow227TriangleData0222.coefficient14_16,
  OriginalRow227TriangleData0222.coefficient14_17,
  OriginalRow227TriangleData0222.coefficient14_18,
  OriginalRow227TriangleData0222.coefficient14_19,
  OriginalRow227TriangleData0222.coefficient14_20,
  OriginalRow227TriangleData0222.coefficient14_21,
  OriginalRow227TriangleData0222.coefficient14_22,
  OriginalRow227TriangleData0222.coefficient14_23,
  OriginalRow227TriangleData0222.coefficient14_24,
  OriginalRow227TriangleData0222.coefficient14_25,
  OriginalRow227TriangleData0222.coefficient14_26,
  OriginalRow227TriangleData0222.coefficient14_27,
  OriginalRow227TriangleData0222.coefficient14_28,
  OriginalRow227TriangleData0222.coefficient14_29,
  OriginalRow227TriangleData0222.coefficient14_30,
  OriginalRow227TriangleData0222.coefficient14_31,
  OriginalRow227TriangleData0222.coefficient14_32,
  OriginalRow227TriangleData0222.coefficient14_33,
  OriginalRow227TriangleData0222.coefficient14_34,
  OriginalRow227TriangleData0222.coefficient14_35,
  OriginalRow227TriangleData0222.coefficient14_36,
  OriginalRow227TriangleData0222.coefficient14_37,
  OriginalRow227TriangleData0222.coefficient14_38,
  OriginalRow227TriangleData0222.coefficient14_39,
  OriginalRow227TriangleData0222.coefficient14_40,
  OriginalRow227TriangleData0222.coefficient14_41,
  OriginalRow227TriangleData0222.coefficient14_42,
  OriginalRow227TriangleData0222.coefficient14_43,
  OriginalRow227TriangleData0222.coefficient14_44
]

theorem values0222_size : values0222.size = 32 := rfl

def block0222 : ℕ → Option IntervalDyadic := segment 13 values0222

theorem block0222_domain : ExactDomain block0222 13 45 := by
  simpa only [values0222_size] using segment_domain 13 values0222

theorem block0222_get (i : Fin 32) :
    block0222 (13 + i.val) = some (values0222[i.val]'(by rw [values0222_size]; exact i.isLt)) := by
  exact segment_get 13 values0222 ⟨i.val, by rw [values0222_size]; exact i.isLt⟩

def values0223 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0223.coefficient14_45,
  OriginalRow227TriangleData0223.coefficient14_46,
  OriginalRow227TriangleData0223.coefficient14_47,
  OriginalRow227TriangleData0223.coefficient14_48,
  OriginalRow227TriangleData0223.coefficient14_49,
  OriginalRow227TriangleData0223.coefficient14_50,
  OriginalRow227TriangleData0223.coefficient14_51,
  OriginalRow227TriangleData0223.coefficient14_52,
  OriginalRow227TriangleData0223.coefficient14_53,
  OriginalRow227TriangleData0223.coefficient14_54,
  OriginalRow227TriangleData0223.coefficient14_55,
  OriginalRow227TriangleData0223.coefficient14_56,
  OriginalRow227TriangleData0223.coefficient14_57,
  OriginalRow227TriangleData0223.coefficient14_58,
  OriginalRow227TriangleData0223.coefficient14_59,
  OriginalRow227TriangleData0223.coefficient14_60,
  OriginalRow227TriangleData0223.coefficient14_61,
  OriginalRow227TriangleData0223.coefficient14_62,
  OriginalRow227TriangleData0223.coefficient14_63,
  OriginalRow227TriangleData0223.coefficient14_64,
  OriginalRow227TriangleData0223.coefficient14_65,
  OriginalRow227TriangleData0223.coefficient14_66,
  OriginalRow227TriangleData0223.coefficient14_67,
  OriginalRow227TriangleData0223.coefficient14_68,
  OriginalRow227TriangleData0223.coefficient14_69,
  OriginalRow227TriangleData0223.coefficient14_70,
  OriginalRow227TriangleData0223.coefficient14_71,
  OriginalRow227TriangleData0223.coefficient14_72,
  OriginalRow227TriangleData0223.coefficient14_73,
  OriginalRow227TriangleData0223.coefficient14_74,
  OriginalRow227TriangleData0223.coefficient14_75,
  OriginalRow227TriangleData0223.coefficient14_76
]

theorem values0223_size : values0223.size = 32 := rfl

def block0223 : ℕ → Option IntervalDyadic := segment 45 values0223

theorem block0223_domain : ExactDomain block0223 45 77 := by
  simpa only [values0223_size] using segment_domain 45 values0223

theorem block0223_get (i : Fin 32) :
    block0223 (45 + i.val) = some (values0223[i.val]'(by rw [values0223_size]; exact i.isLt)) := by
  exact segment_get 45 values0223 ⟨i.val, by rw [values0223_size]; exact i.isLt⟩

def values0224 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0224.coefficient14_77,
  OriginalRow227TriangleData0224.coefficient14_78,
  OriginalRow227TriangleData0224.coefficient14_79,
  OriginalRow227TriangleData0224.coefficient14_80,
  OriginalRow227TriangleData0224.coefficient14_81,
  OriginalRow227TriangleData0224.coefficient14_82,
  OriginalRow227TriangleData0224.coefficient14_83,
  OriginalRow227TriangleData0224.coefficient14_84,
  OriginalRow227TriangleData0224.coefficient14_85,
  OriginalRow227TriangleData0224.coefficient14_86,
  OriginalRow227TriangleData0224.coefficient14_87,
  OriginalRow227TriangleData0224.coefficient14_88,
  OriginalRow227TriangleData0224.coefficient14_89,
  OriginalRow227TriangleData0224.coefficient14_90,
  OriginalRow227TriangleData0224.coefficient14_91,
  OriginalRow227TriangleData0224.coefficient14_92,
  OriginalRow227TriangleData0224.coefficient14_93,
  OriginalRow227TriangleData0224.coefficient14_94,
  OriginalRow227TriangleData0224.coefficient14_95,
  OriginalRow227TriangleData0224.coefficient14_96,
  OriginalRow227TriangleData0224.coefficient14_97,
  OriginalRow227TriangleData0224.coefficient14_98,
  OriginalRow227TriangleData0224.coefficient14_99,
  OriginalRow227TriangleData0224.coefficient14_100,
  OriginalRow227TriangleData0224.coefficient14_101,
  OriginalRow227TriangleData0224.coefficient14_102,
  OriginalRow227TriangleData0224.coefficient14_103,
  OriginalRow227TriangleData0224.coefficient14_104,
  OriginalRow227TriangleData0224.coefficient14_105,
  OriginalRow227TriangleData0224.coefficient14_106,
  OriginalRow227TriangleData0224.coefficient14_107,
  OriginalRow227TriangleData0224.coefficient14_108
]

theorem values0224_size : values0224.size = 32 := rfl

def block0224 : ℕ → Option IntervalDyadic := segment 77 values0224

theorem block0224_domain : ExactDomain block0224 77 109 := by
  simpa only [values0224_size] using segment_domain 77 values0224

theorem block0224_get (i : Fin 32) :
    block0224 (77 + i.val) = some (values0224[i.val]'(by rw [values0224_size]; exact i.isLt)) := by
  exact segment_get 77 values0224 ⟨i.val, by rw [values0224_size]; exact i.isLt⟩

def values0225 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0225.coefficient14_109,
  OriginalRow227TriangleData0225.coefficient14_110,
  OriginalRow227TriangleData0225.coefficient14_111,
  OriginalRow227TriangleData0225.coefficient14_112,
  OriginalRow227TriangleData0225.coefficient14_113,
  OriginalRow227TriangleData0225.coefficient14_114,
  OriginalRow227TriangleData0225.coefficient14_115,
  OriginalRow227TriangleData0225.coefficient14_116,
  OriginalRow227TriangleData0225.coefficient14_117,
  OriginalRow227TriangleData0225.coefficient14_118,
  OriginalRow227TriangleData0225.coefficient14_119,
  OriginalRow227TriangleData0225.coefficient14_120,
  OriginalRow227TriangleData0225.coefficient14_121,
  OriginalRow227TriangleData0225.coefficient14_122,
  OriginalRow227TriangleData0225.coefficient14_123,
  OriginalRow227TriangleData0225.coefficient14_124,
  OriginalRow227TriangleData0225.coefficient14_125,
  OriginalRow227TriangleData0225.coefficient14_126,
  OriginalRow227TriangleData0225.coefficient14_127,
  OriginalRow227TriangleData0225.coefficient14_128,
  OriginalRow227TriangleData0225.coefficient14_129,
  OriginalRow227TriangleData0225.coefficient14_130,
  OriginalRow227TriangleData0225.coefficient14_131,
  OriginalRow227TriangleData0225.coefficient14_132,
  OriginalRow227TriangleData0225.coefficient14_133,
  OriginalRow227TriangleData0225.coefficient14_134,
  OriginalRow227TriangleData0225.coefficient14_135,
  OriginalRow227TriangleData0225.coefficient14_136,
  OriginalRow227TriangleData0225.coefficient14_137,
  OriginalRow227TriangleData0225.coefficient14_138,
  OriginalRow227TriangleData0225.coefficient14_139,
  OriginalRow227TriangleData0225.coefficient14_140
]

theorem values0225_size : values0225.size = 32 := rfl

def block0225 : ℕ → Option IntervalDyadic := segment 109 values0225

theorem block0225_domain : ExactDomain block0225 109 141 := by
  simpa only [values0225_size] using segment_domain 109 values0225

theorem block0225_get (i : Fin 32) :
    block0225 (109 + i.val) = some (values0225[i.val]'(by rw [values0225_size]; exact i.isLt)) := by
  exact segment_get 109 values0225 ⟨i.val, by rw [values0225_size]; exact i.isLt⟩

def values0226 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0226.coefficient14_141,
  OriginalRow227TriangleData0226.coefficient14_142,
  OriginalRow227TriangleData0226.coefficient14_143,
  OriginalRow227TriangleData0226.coefficient14_144,
  OriginalRow227TriangleData0226.coefficient14_145,
  OriginalRow227TriangleData0226.coefficient14_146,
  OriginalRow227TriangleData0226.coefficient14_147,
  OriginalRow227TriangleData0226.coefficient14_148,
  OriginalRow227TriangleData0226.coefficient14_149,
  OriginalRow227TriangleData0226.coefficient14_150,
  OriginalRow227TriangleData0226.coefficient14_151,
  OriginalRow227TriangleData0226.coefficient14_152,
  OriginalRow227TriangleData0226.coefficient14_153,
  OriginalRow227TriangleData0226.coefficient14_154,
  OriginalRow227TriangleData0226.coefficient14_155,
  OriginalRow227TriangleData0226.coefficient14_156,
  OriginalRow227TriangleData0226.coefficient14_157,
  OriginalRow227TriangleData0226.coefficient14_158,
  OriginalRow227TriangleData0226.coefficient14_159,
  OriginalRow227TriangleData0226.coefficient14_160,
  OriginalRow227TriangleData0226.coefficient14_161,
  OriginalRow227TriangleData0226.coefficient14_162,
  OriginalRow227TriangleData0226.coefficient14_163,
  OriginalRow227TriangleData0226.coefficient14_164,
  OriginalRow227TriangleData0226.coefficient14_165,
  OriginalRow227TriangleData0226.coefficient14_166,
  OriginalRow227TriangleData0226.coefficient14_167,
  OriginalRow227TriangleData0226.coefficient14_168,
  OriginalRow227TriangleData0226.coefficient14_169,
  OriginalRow227TriangleData0226.coefficient14_170,
  OriginalRow227TriangleData0226.coefficient14_171,
  OriginalRow227TriangleData0226.coefficient14_172
]

theorem values0226_size : values0226.size = 32 := rfl

def block0226 : ℕ → Option IntervalDyadic := segment 141 values0226

theorem block0226_domain : ExactDomain block0226 141 173 := by
  simpa only [values0226_size] using segment_domain 141 values0226

theorem block0226_get (i : Fin 32) :
    block0226 (141 + i.val) = some (values0226[i.val]'(by rw [values0226_size]; exact i.isLt)) := by
  exact segment_get 141 values0226 ⟨i.val, by rw [values0226_size]; exact i.isLt⟩

def values0227 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0227.coefficient14_173,
  OriginalRow227TriangleData0227.coefficient14_174,
  OriginalRow227TriangleData0227.coefficient14_175,
  OriginalRow227TriangleData0227.coefficient14_176,
  OriginalRow227TriangleData0227.coefficient14_177,
  OriginalRow227TriangleData0227.coefficient14_178,
  OriginalRow227TriangleData0227.coefficient14_179,
  OriginalRow227TriangleData0227.coefficient14_180,
  OriginalRow227TriangleData0227.coefficient14_181,
  OriginalRow227TriangleData0227.coefficient14_182,
  OriginalRow227TriangleData0227.coefficient14_183,
  OriginalRow227TriangleData0227.coefficient14_184,
  OriginalRow227TriangleData0227.coefficient14_185,
  OriginalRow227TriangleData0227.coefficient14_186,
  OriginalRow227TriangleData0227.coefficient14_187,
  OriginalRow227TriangleData0227.coefficient14_188,
  OriginalRow227TriangleData0227.coefficient14_189,
  OriginalRow227TriangleData0227.coefficient14_190,
  OriginalRow227TriangleData0227.coefficient14_191,
  OriginalRow227TriangleData0227.coefficient14_192,
  OriginalRow227TriangleData0227.coefficient14_193,
  OriginalRow227TriangleData0227.coefficient14_194,
  OriginalRow227TriangleData0227.coefficient14_195,
  OriginalRow227TriangleData0227.coefficient14_196,
  OriginalRow227TriangleData0227.coefficient14_197,
  OriginalRow227TriangleData0227.coefficient14_198,
  OriginalRow227TriangleData0227.coefficient14_199,
  OriginalRow227TriangleData0227.coefficient14_200,
  OriginalRow227TriangleData0227.coefficient14_201,
  OriginalRow227TriangleData0227.coefficient14_202,
  OriginalRow227TriangleData0227.coefficient14_203,
  OriginalRow227TriangleData0227.coefficient14_204
]

theorem values0227_size : values0227.size = 32 := rfl

def block0227 : ℕ → Option IntervalDyadic := segment 173 values0227

theorem block0227_domain : ExactDomain block0227 173 205 := by
  simpa only [values0227_size] using segment_domain 173 values0227

theorem block0227_get (i : Fin 32) :
    block0227 (173 + i.val) = some (values0227[i.val]'(by rw [values0227_size]; exact i.isLt)) := by
  exact segment_get 173 values0227 ⟨i.val, by rw [values0227_size]; exact i.isLt⟩

def values0228 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0228.coefficient14_205,
  OriginalRow227TriangleData0228.coefficient14_206,
  OriginalRow227TriangleData0228.coefficient14_207,
  OriginalRow227TriangleData0228.coefficient14_208,
  OriginalRow227TriangleData0228.coefficient14_209,
  OriginalRow227TriangleData0228.coefficient14_210,
  OriginalRow227TriangleData0228.coefficient14_211,
  OriginalRow227TriangleData0228.coefficient14_212,
  OriginalRow227TriangleData0228.coefficient14_213,
  OriginalRow227TriangleData0228.coefficient14_214,
  OriginalRow227TriangleData0228.coefficient14_215,
  OriginalRow227TriangleData0228.coefficient14_216,
  OriginalRow227TriangleData0228.coefficient14_217,
  OriginalRow227TriangleData0228.coefficient14_218,
  OriginalRow227TriangleData0228.coefficient14_219,
  OriginalRow227TriangleData0228.coefficient14_220,
  OriginalRow227TriangleData0228.coefficient14_221,
  OriginalRow227TriangleData0228.coefficient14_222,
  OriginalRow227TriangleData0228.coefficient14_223,
  OriginalRow227TriangleData0228.coefficient14_224,
  OriginalRow227TriangleData0228.coefficient14_225,
  OriginalRow227TriangleData0228.coefficient14_226,
  OriginalRow227TriangleData0228.coefficient14_227,
  OriginalRow227TriangleData0228.coefficient14_228,
  OriginalRow227TriangleData0228.coefficient14_229,
  OriginalRow227TriangleData0228.coefficient14_230,
  OriginalRow227TriangleData0228.coefficient14_231,
  OriginalRow227TriangleData0228.coefficient14_232,
  OriginalRow227TriangleData0228.coefficient14_233,
  OriginalRow227TriangleData0228.coefficient14_234,
  OriginalRow227TriangleData0228.coefficient14_235,
  OriginalRow227TriangleData0228.coefficient14_236
]

theorem values0228_size : values0228.size = 32 := rfl

def block0228 : ℕ → Option IntervalDyadic := segment 205 values0228

theorem block0228_domain : ExactDomain block0228 205 237 := by
  simpa only [values0228_size] using segment_domain 205 values0228

theorem block0228_get (i : Fin 32) :
    block0228 (205 + i.val) = some (values0228[i.val]'(by rw [values0228_size]; exact i.isLt)) := by
  exact segment_get 205 values0228 ⟨i.val, by rw [values0228_size]; exact i.isLt⟩

def values0229 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0229.coefficient14_237,
  OriginalRow227TriangleData0229.coefficient14_238,
  OriginalRow227TriangleData0229.coefficient14_239,
  OriginalRow227TriangleData0229.coefficient14_240,
  OriginalRow227TriangleData0229.coefficient14_241,
  OriginalRow227TriangleData0229.coefficient14_242,
  OriginalRow227TriangleData0229.coefficient14_243,
  OriginalRow227TriangleData0229.coefficient14_244,
  OriginalRow227TriangleData0229.coefficient14_245,
  OriginalRow227TriangleData0229.coefficient14_246,
  OriginalRow227TriangleData0229.coefficient14_247,
  OriginalRow227TriangleData0229.coefficient14_248,
  OriginalRow227TriangleData0229.coefficient14_249,
  OriginalRow227TriangleData0229.coefficient14_250,
  OriginalRow227TriangleData0229.coefficient14_251,
  OriginalRow227TriangleData0229.coefficient14_252,
  OriginalRow227TriangleData0229.coefficient14_253,
  OriginalRow227TriangleData0229.coefficient14_254,
  OriginalRow227TriangleData0229.coefficient14_255,
  OriginalRow227TriangleData0229.coefficient14_256,
  OriginalRow227TriangleData0229.coefficient14_257,
  OriginalRow227TriangleData0229.coefficient14_258,
  OriginalRow227TriangleData0229.coefficient14_259,
  OriginalRow227TriangleData0229.coefficient14_260,
  OriginalRow227TriangleData0229.coefficient14_261,
  OriginalRow227TriangleData0229.coefficient14_262,
  OriginalRow227TriangleData0229.coefficient14_263,
  OriginalRow227TriangleData0229.coefficient14_264,
  OriginalRow227TriangleData0229.coefficient14_265,
  OriginalRow227TriangleData0229.coefficient14_266,
  OriginalRow227TriangleData0229.coefficient14_267,
  OriginalRow227TriangleData0229.coefficient14_268
]

theorem values0229_size : values0229.size = 32 := rfl

def block0229 : ℕ → Option IntervalDyadic := segment 237 values0229

theorem block0229_domain : ExactDomain block0229 237 269 := by
  simpa only [values0229_size] using segment_domain 237 values0229

theorem block0229_get (i : Fin 32) :
    block0229 (237 + i.val) = some (values0229[i.val]'(by rw [values0229_size]; exact i.isLt)) := by
  exact segment_get 237 values0229 ⟨i.val, by rw [values0229_size]; exact i.isLt⟩

def values0230 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0230.coefficient14_269,
  OriginalRow227TriangleData0230.coefficient14_270,
  OriginalRow227TriangleData0230.coefficient14_271,
  OriginalRow227TriangleData0230.coefficient14_272,
  OriginalRow227TriangleData0230.coefficient14_273,
  OriginalRow227TriangleData0230.coefficient14_274,
  OriginalRow227TriangleData0230.coefficient14_275,
  OriginalRow227TriangleData0230.coefficient14_276,
  OriginalRow227TriangleData0230.coefficient14_277,
  OriginalRow227TriangleData0230.coefficient14_278,
  OriginalRow227TriangleData0230.coefficient14_279,
  OriginalRow227TriangleData0230.coefficient14_280,
  OriginalRow227TriangleData0230.coefficient14_281,
  OriginalRow227TriangleData0230.coefficient14_282,
  OriginalRow227TriangleData0230.coefficient14_283,
  OriginalRow227TriangleData0230.coefficient14_284,
  OriginalRow227TriangleData0230.coefficient14_285,
  OriginalRow227TriangleData0230.coefficient14_286,
  OriginalRow227TriangleData0230.coefficient14_287,
  OriginalRow227TriangleData0230.coefficient14_288,
  OriginalRow227TriangleData0230.coefficient14_289,
  OriginalRow227TriangleData0230.coefficient14_290,
  OriginalRow227TriangleData0230.coefficient14_291,
  OriginalRow227TriangleData0230.coefficient14_292,
  OriginalRow227TriangleData0230.coefficient14_293,
  OriginalRow227TriangleData0230.coefficient14_294,
  OriginalRow227TriangleData0230.coefficient14_295,
  OriginalRow227TriangleData0230.coefficient14_296,
  OriginalRow227TriangleData0230.coefficient14_297,
  OriginalRow227TriangleData0230.coefficient14_298,
  OriginalRow227TriangleData0230.coefficient14_299,
  OriginalRow227TriangleData0230.coefficient14_300
]

theorem values0230_size : values0230.size = 32 := rfl

def block0230 : ℕ → Option IntervalDyadic := segment 269 values0230

theorem block0230_domain : ExactDomain block0230 269 301 := by
  simpa only [values0230_size] using segment_domain 269 values0230

theorem block0230_get (i : Fin 32) :
    block0230 (269 + i.val) = some (values0230[i.val]'(by rw [values0230_size]; exact i.isLt)) := by
  exact segment_get 269 values0230 ⟨i.val, by rw [values0230_size]; exact i.isLt⟩

def values0231 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0231.coefficient14_301,
  OriginalRow227TriangleData0231.coefficient14_302,
  OriginalRow227TriangleData0231.coefficient14_303,
  OriginalRow227TriangleData0231.coefficient14_304,
  OriginalRow227TriangleData0231.coefficient14_305,
  OriginalRow227TriangleData0231.coefficient14_306,
  OriginalRow227TriangleData0231.coefficient14_307,
  OriginalRow227TriangleData0231.coefficient14_308,
  OriginalRow227TriangleData0231.coefficient14_309,
  OriginalRow227TriangleData0231.coefficient14_310,
  OriginalRow227TriangleData0231.coefficient14_311,
  OriginalRow227TriangleData0231.coefficient14_312,
  OriginalRow227TriangleData0231.coefficient14_313,
  OriginalRow227TriangleData0231.coefficient14_314,
  OriginalRow227TriangleData0231.coefficient14_315,
  OriginalRow227TriangleData0231.coefficient14_316,
  OriginalRow227TriangleData0231.coefficient14_317,
  OriginalRow227TriangleData0231.coefficient14_318,
  OriginalRow227TriangleData0231.coefficient14_319,
  OriginalRow227TriangleData0231.coefficient14_320,
  OriginalRow227TriangleData0231.coefficient14_321,
  OriginalRow227TriangleData0231.coefficient14_322,
  OriginalRow227TriangleData0231.coefficient14_323,
  OriginalRow227TriangleData0231.coefficient14_324,
  OriginalRow227TriangleData0231.coefficient14_325,
  OriginalRow227TriangleData0231.coefficient14_326,
  OriginalRow227TriangleData0231.coefficient14_327,
  OriginalRow227TriangleData0231.coefficient14_328,
  OriginalRow227TriangleData0231.coefficient14_329,
  OriginalRow227TriangleData0231.coefficient14_330,
  OriginalRow227TriangleData0231.coefficient14_331,
  OriginalRow227TriangleData0231.coefficient14_332
]

theorem values0231_size : values0231.size = 32 := rfl

def block0231 : ℕ → Option IntervalDyadic := segment 301 values0231

theorem block0231_domain : ExactDomain block0231 301 333 := by
  simpa only [values0231_size] using segment_domain 301 values0231

theorem block0231_get (i : Fin 32) :
    block0231 (301 + i.val) = some (values0231[i.val]'(by rw [values0231_size]; exact i.isLt)) := by
  exact segment_get 301 values0231 ⟨i.val, by rw [values0231_size]; exact i.isLt⟩

def values0232 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0232.coefficient14_333,
  OriginalRow227TriangleData0232.coefficient14_334,
  OriginalRow227TriangleData0232.coefficient14_335,
  OriginalRow227TriangleData0232.coefficient14_336,
  OriginalRow227TriangleData0232.coefficient14_337,
  OriginalRow227TriangleData0232.coefficient14_338,
  OriginalRow227TriangleData0232.coefficient14_339,
  OriginalRow227TriangleData0232.coefficient14_340,
  OriginalRow227TriangleData0232.coefficient14_341,
  OriginalRow227TriangleData0232.coefficient14_342,
  OriginalRow227TriangleData0232.coefficient14_343,
  OriginalRow227TriangleData0232.coefficient14_344,
  OriginalRow227TriangleData0232.coefficient14_345,
  OriginalRow227TriangleData0232.coefficient14_346,
  OriginalRow227TriangleData0232.coefficient14_347,
  OriginalRow227TriangleData0232.coefficient14_348,
  OriginalRow227TriangleData0232.coefficient14_349,
  OriginalRow227TriangleData0232.coefficient14_350,
  OriginalRow227TriangleData0232.coefficient14_351,
  OriginalRow227TriangleData0232.coefficient14_352,
  OriginalRow227TriangleData0232.coefficient14_353,
  OriginalRow227TriangleData0232.coefficient14_354,
  OriginalRow227TriangleData0232.coefficient14_355,
  OriginalRow227TriangleData0232.coefficient14_356,
  OriginalRow227TriangleData0232.coefficient14_357,
  OriginalRow227TriangleData0232.coefficient14_358,
  OriginalRow227TriangleData0232.coefficient14_359,
  OriginalRow227TriangleData0232.coefficient14_360,
  OriginalRow227TriangleData0232.coefficient14_361,
  OriginalRow227TriangleData0232.coefficient14_362,
  OriginalRow227TriangleData0232.coefficient14_363,
  OriginalRow227TriangleData0232.coefficient14_364
]

theorem values0232_size : values0232.size = 32 := rfl

def block0232 : ℕ → Option IntervalDyadic := segment 333 values0232

theorem block0232_domain : ExactDomain block0232 333 365 := by
  simpa only [values0232_size] using segment_domain 333 values0232

theorem block0232_get (i : Fin 32) :
    block0232 (333 + i.val) = some (values0232[i.val]'(by rw [values0232_size]; exact i.isLt)) := by
  exact segment_get 333 values0232 ⟨i.val, by rw [values0232_size]; exact i.isLt⟩

def values0233 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0233.coefficient14_365,
  OriginalRow227TriangleData0233.coefficient14_366,
  OriginalRow227TriangleData0233.coefficient14_367,
  OriginalRow227TriangleData0233.coefficient14_368,
  OriginalRow227TriangleData0233.coefficient14_369,
  OriginalRow227TriangleData0233.coefficient14_370,
  OriginalRow227TriangleData0233.coefficient14_371,
  OriginalRow227TriangleData0233.coefficient14_372,
  OriginalRow227TriangleData0233.coefficient14_373,
  OriginalRow227TriangleData0233.coefficient14_374,
  OriginalRow227TriangleData0233.coefficient14_375,
  OriginalRow227TriangleData0233.coefficient14_376,
  OriginalRow227TriangleData0233.coefficient14_377,
  OriginalRow227TriangleData0233.coefficient14_378,
  OriginalRow227TriangleData0233.coefficient14_379,
  OriginalRow227TriangleData0233.coefficient14_380,
  OriginalRow227TriangleData0233.coefficient14_381,
  OriginalRow227TriangleData0233.coefficient14_382,
  OriginalRow227TriangleData0233.coefficient14_383,
  OriginalRow227TriangleData0233.coefficient14_384,
  OriginalRow227TriangleData0233.coefficient14_385,
  OriginalRow227TriangleData0233.coefficient14_386,
  OriginalRow227TriangleData0233.coefficient14_387,
  OriginalRow227TriangleData0233.coefficient14_388,
  OriginalRow227TriangleData0233.coefficient14_389,
  OriginalRow227TriangleData0233.coefficient14_390,
  OriginalRow227TriangleData0233.coefficient14_391,
  OriginalRow227TriangleData0233.coefficient14_392,
  OriginalRow227TriangleData0233.coefficient14_393,
  OriginalRow227TriangleData0233.coefficient14_394,
  OriginalRow227TriangleData0233.coefficient14_395,
  OriginalRow227TriangleData0233.coefficient14_396
]

theorem values0233_size : values0233.size = 32 := rfl

def block0233 : ℕ → Option IntervalDyadic := segment 365 values0233

theorem block0233_domain : ExactDomain block0233 365 397 := by
  simpa only [values0233_size] using segment_domain 365 values0233

theorem block0233_get (i : Fin 32) :
    block0233 (365 + i.val) = some (values0233[i.val]'(by rw [values0233_size]; exact i.isLt)) := by
  exact segment_get 365 values0233 ⟨i.val, by rw [values0233_size]; exact i.isLt⟩

def values0234 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0234.coefficient14_397,
  OriginalRow227TriangleData0234.coefficient14_398,
  OriginalRow227TriangleData0234.coefficient14_399,
  OriginalRow227TriangleData0234.coefficient14_400,
  OriginalRow227TriangleData0234.coefficient14_401,
  OriginalRow227TriangleData0234.coefficient14_402,
  OriginalRow227TriangleData0234.coefficient14_403,
  OriginalRow227TriangleData0234.coefficient14_404,
  OriginalRow227TriangleData0234.coefficient14_405,
  OriginalRow227TriangleData0234.coefficient14_406,
  OriginalRow227TriangleData0234.coefficient14_407,
  OriginalRow227TriangleData0234.coefficient14_408,
  OriginalRow227TriangleData0234.coefficient14_409,
  OriginalRow227TriangleData0234.coefficient14_410,
  OriginalRow227TriangleData0234.coefficient14_411,
  OriginalRow227TriangleData0234.coefficient14_412,
  OriginalRow227TriangleData0234.coefficient14_413,
  OriginalRow227TriangleData0234.coefficient14_414,
  OriginalRow227TriangleData0234.coefficient14_415,
  OriginalRow227TriangleData0234.coefficient14_416,
  OriginalRow227TriangleData0234.coefficient14_417,
  OriginalRow227TriangleData0234.coefficient14_418,
  OriginalRow227TriangleData0234.coefficient14_419,
  OriginalRow227TriangleData0234.coefficient14_420,
  OriginalRow227TriangleData0234.coefficient14_421,
  OriginalRow227TriangleData0234.coefficient14_422,
  OriginalRow227TriangleData0234.coefficient14_423,
  OriginalRow227TriangleData0234.coefficient14_424,
  OriginalRow227TriangleData0234.coefficient14_425,
  OriginalRow227TriangleData0234.coefficient14_426,
  OriginalRow227TriangleData0234.coefficient14_427,
  OriginalRow227TriangleData0234.coefficient14_428
]

theorem values0234_size : values0234.size = 32 := rfl

def block0234 : ℕ → Option IntervalDyadic := segment 397 values0234

theorem block0234_domain : ExactDomain block0234 397 429 := by
  simpa only [values0234_size] using segment_domain 397 values0234

theorem block0234_get (i : Fin 32) :
    block0234 (397 + i.val) = some (values0234[i.val]'(by rw [values0234_size]; exact i.isLt)) := by
  exact segment_get 397 values0234 ⟨i.val, by rw [values0234_size]; exact i.isLt⟩

def values0235 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0235.coefficient14_429,
  OriginalRow227TriangleData0235.coefficient14_430,
  OriginalRow227TriangleData0235.coefficient14_431,
  OriginalRow227TriangleData0235.coefficient14_432,
  OriginalRow227TriangleData0235.coefficient14_433,
  OriginalRow227TriangleData0235.coefficient14_434,
  OriginalRow227TriangleData0235.coefficient14_435,
  OriginalRow227TriangleData0235.coefficient14_436,
  OriginalRow227TriangleData0235.coefficient14_437,
  OriginalRow227TriangleData0235.coefficient14_438,
  OriginalRow227TriangleData0235.coefficient14_439,
  OriginalRow227TriangleData0235.coefficient14_440,
  OriginalRow227TriangleData0235.coefficient14_441,
  OriginalRow227TriangleData0235.coefficient14_442,
  OriginalRow227TriangleData0235.coefficient14_443,
  OriginalRow227TriangleData0235.coefficient14_444,
  OriginalRow227TriangleData0235.coefficient14_445,
  OriginalRow227TriangleData0235.coefficient14_446,
  OriginalRow227TriangleData0235.coefficient14_447,
  OriginalRow227TriangleData0235.coefficient14_448,
  OriginalRow227TriangleData0235.coefficient14_449,
  OriginalRow227TriangleData0235.coefficient14_450,
  OriginalRow227TriangleData0235.coefficient14_451,
  OriginalRow227TriangleData0235.coefficient14_452,
  OriginalRow227TriangleData0235.coefficient14_453,
  OriginalRow227TriangleData0235.coefficient14_454,
  OriginalRow227TriangleData0235.coefficient14_455,
  OriginalRow227TriangleData0235.coefficient14_456,
  OriginalRow227TriangleData0235.coefficient14_457,
  OriginalRow227TriangleData0235.coefficient14_458,
  OriginalRow227TriangleData0235.coefficient14_459,
  OriginalRow227TriangleData0235.coefficient14_460
]

theorem values0235_size : values0235.size = 32 := rfl

def block0235 : ℕ → Option IntervalDyadic := segment 429 values0235

theorem block0235_domain : ExactDomain block0235 429 461 := by
  simpa only [values0235_size] using segment_domain 429 values0235

theorem block0235_get (i : Fin 32) :
    block0235 (429 + i.val) = some (values0235[i.val]'(by rw [values0235_size]; exact i.isLt)) := by
  exact segment_get 429 values0235 ⟨i.val, by rw [values0235_size]; exact i.isLt⟩

def values0236 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0236.coefficient14_461,
  OriginalRow227TriangleData0236.coefficient14_462,
  OriginalRow227TriangleData0236.coefficient14_463,
  OriginalRow227TriangleData0236.coefficient14_464,
  OriginalRow227TriangleData0236.coefficient14_465,
  OriginalRow227TriangleData0236.coefficient14_466,
  OriginalRow227TriangleData0236.coefficient14_467,
  OriginalRow227TriangleData0236.coefficient14_468,
  OriginalRow227TriangleData0236.coefficient14_469,
  OriginalRow227TriangleData0236.coefficient14_470,
  OriginalRow227TriangleData0236.coefficient14_471,
  OriginalRow227TriangleData0236.coefficient14_472,
  OriginalRow227TriangleData0236.coefficient14_473,
  OriginalRow227TriangleData0236.coefficient14_474,
  OriginalRow227TriangleData0236.coefficient14_475,
  OriginalRow227TriangleData0236.coefficient14_476,
  OriginalRow227TriangleData0236.coefficient14_477,
  OriginalRow227TriangleData0236.coefficient14_478,
  OriginalRow227TriangleData0236.coefficient14_479,
  OriginalRow227TriangleData0236.coefficient14_480,
  OriginalRow227TriangleData0236.coefficient14_481,
  OriginalRow227TriangleData0236.coefficient14_482,
  OriginalRow227TriangleData0236.coefficient14_483,
  OriginalRow227TriangleData0236.coefficient14_484,
  OriginalRow227TriangleData0236.coefficient14_485,
  OriginalRow227TriangleData0236.coefficient14_486,
  OriginalRow227TriangleData0236.coefficient14_487
]

theorem values0236_size : values0236.size = 27 := rfl

def block0236 : ℕ → Option IntervalDyadic := segment 461 values0236

theorem block0236_domain : ExactDomain block0236 461 488 := by
  simpa only [values0236_size] using segment_domain 461 values0236

theorem block0236_get (i : Fin 27) :
    block0236 (461 + i.val) = some (values0236[i.val]'(by rw [values0236_size]; exact i.isLt)) := by
  exact segment_get 461 values0236 ⟨i.val, by rw [values0236_size]; exact i.isLt⟩

def node0045_0109 : ℕ → Option IntervalDyadic := split 77 block0223 block0224

theorem node0045_0109_domain : ExactDomain node0045_0109 45 109 := by
  exact split_domain (by decide) (by decide) block0223_domain block0224_domain

def node0013_0109 : ℕ → Option IntervalDyadic := split 45 block0222 node0045_0109

theorem node0013_0109_domain : ExactDomain node0013_0109 13 109 := by
  exact split_domain (by decide) (by decide) block0222_domain node0045_0109_domain

def node0109_0173 : ℕ → Option IntervalDyadic := split 141 block0225 block0226

theorem node0109_0173_domain : ExactDomain node0109_0173 109 173 := by
  exact split_domain (by decide) (by decide) block0225_domain block0226_domain

def node0173_0237 : ℕ → Option IntervalDyadic := split 205 block0227 block0228

theorem node0173_0237_domain : ExactDomain node0173_0237 173 237 := by
  exact split_domain (by decide) (by decide) block0227_domain block0228_domain

def node0109_0237 : ℕ → Option IntervalDyadic := split 173 node0109_0173 node0173_0237

theorem node0109_0237_domain : ExactDomain node0109_0237 109 237 := by
  exact split_domain (by decide) (by decide) node0109_0173_domain node0173_0237_domain

def node0013_0237 : ℕ → Option IntervalDyadic := split 109 node0013_0109 node0109_0237

theorem node0013_0237_domain : ExactDomain node0013_0237 13 237 := by
  exact split_domain (by decide) (by decide) node0013_0109_domain node0109_0237_domain

def node0237_0301 : ℕ → Option IntervalDyadic := split 269 block0229 block0230

theorem node0237_0301_domain : ExactDomain node0237_0301 237 301 := by
  exact split_domain (by decide) (by decide) block0229_domain block0230_domain

def node0301_0365 : ℕ → Option IntervalDyadic := split 333 block0231 block0232

theorem node0301_0365_domain : ExactDomain node0301_0365 301 365 := by
  exact split_domain (by decide) (by decide) block0231_domain block0232_domain

def node0237_0365 : ℕ → Option IntervalDyadic := split 301 node0237_0301 node0301_0365

theorem node0237_0365_domain : ExactDomain node0237_0365 237 365 := by
  exact split_domain (by decide) (by decide) node0237_0301_domain node0301_0365_domain

def node0365_0429 : ℕ → Option IntervalDyadic := split 397 block0233 block0234

theorem node0365_0429_domain : ExactDomain node0365_0429 365 429 := by
  exact split_domain (by decide) (by decide) block0233_domain block0234_domain

def node0429_0488 : ℕ → Option IntervalDyadic := split 461 block0235 block0236

theorem node0429_0488_domain : ExactDomain node0429_0488 429 488 := by
  exact split_domain (by decide) (by decide) block0235_domain block0236_domain

def node0365_0488 : ℕ → Option IntervalDyadic := split 429 node0365_0429 node0429_0488

theorem node0365_0488_domain : ExactDomain node0365_0488 365 488 := by
  exact split_domain (by decide) (by decide) node0365_0429_domain node0429_0488_domain

def node0237_0488 : ℕ → Option IntervalDyadic := split 365 node0237_0365 node0365_0488

theorem node0237_0488_domain : ExactDomain node0237_0488 237 488 := by
  exact split_domain (by decide) (by decide) node0237_0365_domain node0365_0488_domain

def node0013_0488 : ℕ → Option IntervalDyadic := split 237 node0013_0237 node0237_0488

theorem node0013_0488_domain : ExactDomain node0013_0488 13 488 := by
  exact split_domain (by decide) (by decide) node0013_0237_domain node0237_0488_domain

def lookup : ℕ → Option IntervalDyadic := node0013_0488

theorem lookup_domain : ExactDomain lookup 13 488 :=
  node0013_0488_domain

theorem block0222_lookup (i : Fin 32) :
    lookup (13 + i.val) = some (values0222[i.val]'(by rw [values0222_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (13 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_left 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0013_0109, split_left 45 block0222 node0045_0109 (by omega)]
  exact block0222_get i

theorem block0223_lookup (i : Fin 32) :
    lookup (45 + i.val) = some (values0223[i.val]'(by rw [values0223_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (45 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_left 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0013_0109, split_right 45 block0222 node0045_0109 (by omega)]
  rw [node0045_0109, split_left 77 block0223 block0224 (by omega)]
  exact block0223_get i

theorem block0224_lookup (i : Fin 32) :
    lookup (77 + i.val) = some (values0224[i.val]'(by rw [values0224_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (77 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_left 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0013_0109, split_right 45 block0222 node0045_0109 (by omega)]
  rw [node0045_0109, split_right 77 block0223 block0224 (by omega)]
  exact block0224_get i

theorem block0225_lookup (i : Fin 32) :
    lookup (109 + i.val) = some (values0225[i.val]'(by rw [values0225_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (109 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_right 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0109_0237, split_left 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0109_0173, split_left 141 block0225 block0226 (by omega)]
  exact block0225_get i

theorem block0226_lookup (i : Fin 32) :
    lookup (141 + i.val) = some (values0226[i.val]'(by rw [values0226_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (141 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_right 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0109_0237, split_left 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0109_0173, split_right 141 block0225 block0226 (by omega)]
  exact block0226_get i

theorem block0227_lookup (i : Fin 32) :
    lookup (173 + i.val) = some (values0227[i.val]'(by rw [values0227_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (173 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_right 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0109_0237, split_right 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0173_0237, split_left 205 block0227 block0228 (by omega)]
  exact block0227_get i

theorem block0228_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values0228[i.val]'(by rw [values0228_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (205 + i.val) = _
  rw [node0013_0488, split_left 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0013_0237, split_right 109 node0013_0109 node0109_0237 (by omega)]
  rw [node0109_0237, split_right 173 node0109_0173 node0173_0237 (by omega)]
  rw [node0173_0237, split_right 205 block0227 block0228 (by omega)]
  exact block0228_get i

theorem block0229_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values0229[i.val]'(by rw [values0229_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (237 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_left 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0237_0365, split_left 301 node0237_0301 node0301_0365 (by omega)]
  rw [node0237_0301, split_left 269 block0229 block0230 (by omega)]
  exact block0229_get i

theorem block0230_lookup (i : Fin 32) :
    lookup (269 + i.val) = some (values0230[i.val]'(by rw [values0230_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (269 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_left 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0237_0365, split_left 301 node0237_0301 node0301_0365 (by omega)]
  rw [node0237_0301, split_right 269 block0229 block0230 (by omega)]
  exact block0230_get i

theorem block0231_lookup (i : Fin 32) :
    lookup (301 + i.val) = some (values0231[i.val]'(by rw [values0231_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (301 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_left 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0237_0365, split_right 301 node0237_0301 node0301_0365 (by omega)]
  rw [node0301_0365, split_left 333 block0231 block0232 (by omega)]
  exact block0231_get i

theorem block0232_lookup (i : Fin 32) :
    lookup (333 + i.val) = some (values0232[i.val]'(by rw [values0232_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (333 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_left 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0237_0365, split_right 301 node0237_0301 node0301_0365 (by omega)]
  rw [node0301_0365, split_right 333 block0231 block0232 (by omega)]
  exact block0232_get i

theorem block0233_lookup (i : Fin 32) :
    lookup (365 + i.val) = some (values0233[i.val]'(by rw [values0233_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (365 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_right 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0365_0488, split_left 429 node0365_0429 node0429_0488 (by omega)]
  rw [node0365_0429, split_left 397 block0233 block0234 (by omega)]
  exact block0233_get i

theorem block0234_lookup (i : Fin 32) :
    lookup (397 + i.val) = some (values0234[i.val]'(by rw [values0234_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (397 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_right 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0365_0488, split_left 429 node0365_0429 node0429_0488 (by omega)]
  rw [node0365_0429, split_right 397 block0233 block0234 (by omega)]
  exact block0234_get i

theorem block0235_lookup (i : Fin 32) :
    lookup (429 + i.val) = some (values0235[i.val]'(by rw [values0235_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (429 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_right 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0365_0488, split_right 429 node0365_0429 node0429_0488 (by omega)]
  rw [node0429_0488, split_left 461 block0235 block0236 (by omega)]
  exact block0235_get i

theorem block0236_lookup (i : Fin 27) :
    lookup (461 + i.val) = some (values0236[i.val]'(by rw [values0236_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0013_0488 (461 + i.val) = _
  rw [node0013_0488, split_right 237 node0013_0237 node0237_0488 (by omega)]
  rw [node0237_0488, split_right 365 node0237_0365 node0365_0488 (by omega)]
  rw [node0365_0488, split_right 429 node0365_0429 node0429_0488 (by omega)]
  rw [node0429_0488, split_right 461 block0235 block0236 (by omega)]
  exact block0236_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0222_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0222_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0223_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0223_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0224_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0224_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0225_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0225_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0226_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0226_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0227_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0227_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0228_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0228_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0229_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0229_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0230_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0230_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0231_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0231_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0232_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0232_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0233_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0233_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0234_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0234_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0235_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0235_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0236_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0236_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0222_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0223_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0224_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0225_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0226_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0227_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0228_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0229_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0230_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0231_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0232_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0233_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0234_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0235_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow014.block0236_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow014
