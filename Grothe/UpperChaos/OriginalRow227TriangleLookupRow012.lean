import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0192
import Grothe.UpperChaos.OriginalRow227TriangleData0193
import Grothe.UpperChaos.OriginalRow227TriangleData0194
import Grothe.UpperChaos.OriginalRow227TriangleData0195
import Grothe.UpperChaos.OriginalRow227TriangleData0196
import Grothe.UpperChaos.OriginalRow227TriangleData0197
import Grothe.UpperChaos.OriginalRow227TriangleData0198
import Grothe.UpperChaos.OriginalRow227TriangleData0199
import Grothe.UpperChaos.OriginalRow227TriangleData0200
import Grothe.UpperChaos.OriginalRow227TriangleData0201
import Grothe.UpperChaos.OriginalRow227TriangleData0202
import Grothe.UpperChaos.OriginalRow227TriangleData0203
import Grothe.UpperChaos.OriginalRow227TriangleData0204
import Grothe.UpperChaos.OriginalRow227TriangleData0205
import Grothe.UpperChaos.OriginalRow227TriangleData0206

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow012

open ConditionalTableLookup

def values0192 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0192.coefficient12_11,
  OriginalRow227TriangleData0192.coefficient12_12,
  OriginalRow227TriangleData0192.coefficient12_13,
  OriginalRow227TriangleData0192.coefficient12_14,
  OriginalRow227TriangleData0192.coefficient12_15,
  OriginalRow227TriangleData0192.coefficient12_16,
  OriginalRow227TriangleData0192.coefficient12_17,
  OriginalRow227TriangleData0192.coefficient12_18,
  OriginalRow227TriangleData0192.coefficient12_19,
  OriginalRow227TriangleData0192.coefficient12_20,
  OriginalRow227TriangleData0192.coefficient12_21,
  OriginalRow227TriangleData0192.coefficient12_22,
  OriginalRow227TriangleData0192.coefficient12_23,
  OriginalRow227TriangleData0192.coefficient12_24,
  OriginalRow227TriangleData0192.coefficient12_25,
  OriginalRow227TriangleData0192.coefficient12_26,
  OriginalRow227TriangleData0192.coefficient12_27,
  OriginalRow227TriangleData0192.coefficient12_28,
  OriginalRow227TriangleData0192.coefficient12_29,
  OriginalRow227TriangleData0192.coefficient12_30,
  OriginalRow227TriangleData0192.coefficient12_31,
  OriginalRow227TriangleData0192.coefficient12_32,
  OriginalRow227TriangleData0192.coefficient12_33,
  OriginalRow227TriangleData0192.coefficient12_34,
  OriginalRow227TriangleData0192.coefficient12_35,
  OriginalRow227TriangleData0192.coefficient12_36,
  OriginalRow227TriangleData0192.coefficient12_37,
  OriginalRow227TriangleData0192.coefficient12_38,
  OriginalRow227TriangleData0192.coefficient12_39,
  OriginalRow227TriangleData0192.coefficient12_40,
  OriginalRow227TriangleData0192.coefficient12_41,
  OriginalRow227TriangleData0192.coefficient12_42
]

theorem values0192_size : values0192.size = 32 := rfl

def block0192 : ℕ → Option IntervalDyadic := segment 11 values0192

theorem block0192_domain : ExactDomain block0192 11 43 := by
  simpa only [values0192_size] using segment_domain 11 values0192

theorem block0192_get (i : Fin 32) :
    block0192 (11 + i.val) = some (values0192[i.val]'(by rw [values0192_size]; exact i.isLt)) := by
  exact segment_get 11 values0192 ⟨i.val, by rw [values0192_size]; exact i.isLt⟩

def values0193 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0193.coefficient12_43,
  OriginalRow227TriangleData0193.coefficient12_44,
  OriginalRow227TriangleData0193.coefficient12_45,
  OriginalRow227TriangleData0193.coefficient12_46,
  OriginalRow227TriangleData0193.coefficient12_47,
  OriginalRow227TriangleData0193.coefficient12_48,
  OriginalRow227TriangleData0193.coefficient12_49,
  OriginalRow227TriangleData0193.coefficient12_50,
  OriginalRow227TriangleData0193.coefficient12_51,
  OriginalRow227TriangleData0193.coefficient12_52,
  OriginalRow227TriangleData0193.coefficient12_53,
  OriginalRow227TriangleData0193.coefficient12_54,
  OriginalRow227TriangleData0193.coefficient12_55,
  OriginalRow227TriangleData0193.coefficient12_56,
  OriginalRow227TriangleData0193.coefficient12_57,
  OriginalRow227TriangleData0193.coefficient12_58,
  OriginalRow227TriangleData0193.coefficient12_59,
  OriginalRow227TriangleData0193.coefficient12_60,
  OriginalRow227TriangleData0193.coefficient12_61,
  OriginalRow227TriangleData0193.coefficient12_62,
  OriginalRow227TriangleData0193.coefficient12_63,
  OriginalRow227TriangleData0193.coefficient12_64,
  OriginalRow227TriangleData0193.coefficient12_65,
  OriginalRow227TriangleData0193.coefficient12_66,
  OriginalRow227TriangleData0193.coefficient12_67,
  OriginalRow227TriangleData0193.coefficient12_68,
  OriginalRow227TriangleData0193.coefficient12_69,
  OriginalRow227TriangleData0193.coefficient12_70,
  OriginalRow227TriangleData0193.coefficient12_71,
  OriginalRow227TriangleData0193.coefficient12_72,
  OriginalRow227TriangleData0193.coefficient12_73,
  OriginalRow227TriangleData0193.coefficient12_74
]

theorem values0193_size : values0193.size = 32 := rfl

def block0193 : ℕ → Option IntervalDyadic := segment 43 values0193

theorem block0193_domain : ExactDomain block0193 43 75 := by
  simpa only [values0193_size] using segment_domain 43 values0193

theorem block0193_get (i : Fin 32) :
    block0193 (43 + i.val) = some (values0193[i.val]'(by rw [values0193_size]; exact i.isLt)) := by
  exact segment_get 43 values0193 ⟨i.val, by rw [values0193_size]; exact i.isLt⟩

def values0194 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0194.coefficient12_75,
  OriginalRow227TriangleData0194.coefficient12_76,
  OriginalRow227TriangleData0194.coefficient12_77,
  OriginalRow227TriangleData0194.coefficient12_78,
  OriginalRow227TriangleData0194.coefficient12_79,
  OriginalRow227TriangleData0194.coefficient12_80,
  OriginalRow227TriangleData0194.coefficient12_81,
  OriginalRow227TriangleData0194.coefficient12_82,
  OriginalRow227TriangleData0194.coefficient12_83,
  OriginalRow227TriangleData0194.coefficient12_84,
  OriginalRow227TriangleData0194.coefficient12_85,
  OriginalRow227TriangleData0194.coefficient12_86,
  OriginalRow227TriangleData0194.coefficient12_87,
  OriginalRow227TriangleData0194.coefficient12_88,
  OriginalRow227TriangleData0194.coefficient12_89,
  OriginalRow227TriangleData0194.coefficient12_90,
  OriginalRow227TriangleData0194.coefficient12_91,
  OriginalRow227TriangleData0194.coefficient12_92,
  OriginalRow227TriangleData0194.coefficient12_93,
  OriginalRow227TriangleData0194.coefficient12_94,
  OriginalRow227TriangleData0194.coefficient12_95,
  OriginalRow227TriangleData0194.coefficient12_96,
  OriginalRow227TriangleData0194.coefficient12_97,
  OriginalRow227TriangleData0194.coefficient12_98,
  OriginalRow227TriangleData0194.coefficient12_99,
  OriginalRow227TriangleData0194.coefficient12_100,
  OriginalRow227TriangleData0194.coefficient12_101,
  OriginalRow227TriangleData0194.coefficient12_102,
  OriginalRow227TriangleData0194.coefficient12_103,
  OriginalRow227TriangleData0194.coefficient12_104,
  OriginalRow227TriangleData0194.coefficient12_105,
  OriginalRow227TriangleData0194.coefficient12_106
]

theorem values0194_size : values0194.size = 32 := rfl

def block0194 : ℕ → Option IntervalDyadic := segment 75 values0194

theorem block0194_domain : ExactDomain block0194 75 107 := by
  simpa only [values0194_size] using segment_domain 75 values0194

theorem block0194_get (i : Fin 32) :
    block0194 (75 + i.val) = some (values0194[i.val]'(by rw [values0194_size]; exact i.isLt)) := by
  exact segment_get 75 values0194 ⟨i.val, by rw [values0194_size]; exact i.isLt⟩

def values0195 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0195.coefficient12_107,
  OriginalRow227TriangleData0195.coefficient12_108,
  OriginalRow227TriangleData0195.coefficient12_109,
  OriginalRow227TriangleData0195.coefficient12_110,
  OriginalRow227TriangleData0195.coefficient12_111,
  OriginalRow227TriangleData0195.coefficient12_112,
  OriginalRow227TriangleData0195.coefficient12_113,
  OriginalRow227TriangleData0195.coefficient12_114,
  OriginalRow227TriangleData0195.coefficient12_115,
  OriginalRow227TriangleData0195.coefficient12_116,
  OriginalRow227TriangleData0195.coefficient12_117,
  OriginalRow227TriangleData0195.coefficient12_118,
  OriginalRow227TriangleData0195.coefficient12_119,
  OriginalRow227TriangleData0195.coefficient12_120,
  OriginalRow227TriangleData0195.coefficient12_121,
  OriginalRow227TriangleData0195.coefficient12_122,
  OriginalRow227TriangleData0195.coefficient12_123,
  OriginalRow227TriangleData0195.coefficient12_124,
  OriginalRow227TriangleData0195.coefficient12_125,
  OriginalRow227TriangleData0195.coefficient12_126,
  OriginalRow227TriangleData0195.coefficient12_127,
  OriginalRow227TriangleData0195.coefficient12_128,
  OriginalRow227TriangleData0195.coefficient12_129,
  OriginalRow227TriangleData0195.coefficient12_130,
  OriginalRow227TriangleData0195.coefficient12_131,
  OriginalRow227TriangleData0195.coefficient12_132,
  OriginalRow227TriangleData0195.coefficient12_133,
  OriginalRow227TriangleData0195.coefficient12_134,
  OriginalRow227TriangleData0195.coefficient12_135,
  OriginalRow227TriangleData0195.coefficient12_136,
  OriginalRow227TriangleData0195.coefficient12_137,
  OriginalRow227TriangleData0195.coefficient12_138
]

theorem values0195_size : values0195.size = 32 := rfl

def block0195 : ℕ → Option IntervalDyadic := segment 107 values0195

theorem block0195_domain : ExactDomain block0195 107 139 := by
  simpa only [values0195_size] using segment_domain 107 values0195

theorem block0195_get (i : Fin 32) :
    block0195 (107 + i.val) = some (values0195[i.val]'(by rw [values0195_size]; exact i.isLt)) := by
  exact segment_get 107 values0195 ⟨i.val, by rw [values0195_size]; exact i.isLt⟩

def values0196 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0196.coefficient12_139,
  OriginalRow227TriangleData0196.coefficient12_140,
  OriginalRow227TriangleData0196.coefficient12_141,
  OriginalRow227TriangleData0196.coefficient12_142,
  OriginalRow227TriangleData0196.coefficient12_143,
  OriginalRow227TriangleData0196.coefficient12_144,
  OriginalRow227TriangleData0196.coefficient12_145,
  OriginalRow227TriangleData0196.coefficient12_146,
  OriginalRow227TriangleData0196.coefficient12_147,
  OriginalRow227TriangleData0196.coefficient12_148,
  OriginalRow227TriangleData0196.coefficient12_149,
  OriginalRow227TriangleData0196.coefficient12_150,
  OriginalRow227TriangleData0196.coefficient12_151,
  OriginalRow227TriangleData0196.coefficient12_152,
  OriginalRow227TriangleData0196.coefficient12_153,
  OriginalRow227TriangleData0196.coefficient12_154,
  OriginalRow227TriangleData0196.coefficient12_155,
  OriginalRow227TriangleData0196.coefficient12_156,
  OriginalRow227TriangleData0196.coefficient12_157,
  OriginalRow227TriangleData0196.coefficient12_158,
  OriginalRow227TriangleData0196.coefficient12_159,
  OriginalRow227TriangleData0196.coefficient12_160,
  OriginalRow227TriangleData0196.coefficient12_161,
  OriginalRow227TriangleData0196.coefficient12_162,
  OriginalRow227TriangleData0196.coefficient12_163,
  OriginalRow227TriangleData0196.coefficient12_164,
  OriginalRow227TriangleData0196.coefficient12_165,
  OriginalRow227TriangleData0196.coefficient12_166,
  OriginalRow227TriangleData0196.coefficient12_167,
  OriginalRow227TriangleData0196.coefficient12_168,
  OriginalRow227TriangleData0196.coefficient12_169,
  OriginalRow227TriangleData0196.coefficient12_170
]

theorem values0196_size : values0196.size = 32 := rfl

def block0196 : ℕ → Option IntervalDyadic := segment 139 values0196

theorem block0196_domain : ExactDomain block0196 139 171 := by
  simpa only [values0196_size] using segment_domain 139 values0196

theorem block0196_get (i : Fin 32) :
    block0196 (139 + i.val) = some (values0196[i.val]'(by rw [values0196_size]; exact i.isLt)) := by
  exact segment_get 139 values0196 ⟨i.val, by rw [values0196_size]; exact i.isLt⟩

def values0197 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0197.coefficient12_171,
  OriginalRow227TriangleData0197.coefficient12_172,
  OriginalRow227TriangleData0197.coefficient12_173,
  OriginalRow227TriangleData0197.coefficient12_174,
  OriginalRow227TriangleData0197.coefficient12_175,
  OriginalRow227TriangleData0197.coefficient12_176,
  OriginalRow227TriangleData0197.coefficient12_177,
  OriginalRow227TriangleData0197.coefficient12_178,
  OriginalRow227TriangleData0197.coefficient12_179,
  OriginalRow227TriangleData0197.coefficient12_180,
  OriginalRow227TriangleData0197.coefficient12_181,
  OriginalRow227TriangleData0197.coefficient12_182,
  OriginalRow227TriangleData0197.coefficient12_183,
  OriginalRow227TriangleData0197.coefficient12_184,
  OriginalRow227TriangleData0197.coefficient12_185,
  OriginalRow227TriangleData0197.coefficient12_186,
  OriginalRow227TriangleData0197.coefficient12_187,
  OriginalRow227TriangleData0197.coefficient12_188,
  OriginalRow227TriangleData0197.coefficient12_189,
  OriginalRow227TriangleData0197.coefficient12_190,
  OriginalRow227TriangleData0197.coefficient12_191,
  OriginalRow227TriangleData0197.coefficient12_192,
  OriginalRow227TriangleData0197.coefficient12_193,
  OriginalRow227TriangleData0197.coefficient12_194,
  OriginalRow227TriangleData0197.coefficient12_195,
  OriginalRow227TriangleData0197.coefficient12_196,
  OriginalRow227TriangleData0197.coefficient12_197,
  OriginalRow227TriangleData0197.coefficient12_198,
  OriginalRow227TriangleData0197.coefficient12_199,
  OriginalRow227TriangleData0197.coefficient12_200,
  OriginalRow227TriangleData0197.coefficient12_201,
  OriginalRow227TriangleData0197.coefficient12_202
]

theorem values0197_size : values0197.size = 32 := rfl

def block0197 : ℕ → Option IntervalDyadic := segment 171 values0197

theorem block0197_domain : ExactDomain block0197 171 203 := by
  simpa only [values0197_size] using segment_domain 171 values0197

theorem block0197_get (i : Fin 32) :
    block0197 (171 + i.val) = some (values0197[i.val]'(by rw [values0197_size]; exact i.isLt)) := by
  exact segment_get 171 values0197 ⟨i.val, by rw [values0197_size]; exact i.isLt⟩

def values0198 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0198.coefficient12_203,
  OriginalRow227TriangleData0198.coefficient12_204,
  OriginalRow227TriangleData0198.coefficient12_205,
  OriginalRow227TriangleData0198.coefficient12_206,
  OriginalRow227TriangleData0198.coefficient12_207,
  OriginalRow227TriangleData0198.coefficient12_208,
  OriginalRow227TriangleData0198.coefficient12_209,
  OriginalRow227TriangleData0198.coefficient12_210,
  OriginalRow227TriangleData0198.coefficient12_211,
  OriginalRow227TriangleData0198.coefficient12_212,
  OriginalRow227TriangleData0198.coefficient12_213,
  OriginalRow227TriangleData0198.coefficient12_214,
  OriginalRow227TriangleData0198.coefficient12_215,
  OriginalRow227TriangleData0198.coefficient12_216,
  OriginalRow227TriangleData0198.coefficient12_217,
  OriginalRow227TriangleData0198.coefficient12_218,
  OriginalRow227TriangleData0198.coefficient12_219,
  OriginalRow227TriangleData0198.coefficient12_220,
  OriginalRow227TriangleData0198.coefficient12_221,
  OriginalRow227TriangleData0198.coefficient12_222,
  OriginalRow227TriangleData0198.coefficient12_223,
  OriginalRow227TriangleData0198.coefficient12_224,
  OriginalRow227TriangleData0198.coefficient12_225,
  OriginalRow227TriangleData0198.coefficient12_226,
  OriginalRow227TriangleData0198.coefficient12_227,
  OriginalRow227TriangleData0198.coefficient12_228,
  OriginalRow227TriangleData0198.coefficient12_229,
  OriginalRow227TriangleData0198.coefficient12_230,
  OriginalRow227TriangleData0198.coefficient12_231,
  OriginalRow227TriangleData0198.coefficient12_232,
  OriginalRow227TriangleData0198.coefficient12_233,
  OriginalRow227TriangleData0198.coefficient12_234
]

theorem values0198_size : values0198.size = 32 := rfl

def block0198 : ℕ → Option IntervalDyadic := segment 203 values0198

theorem block0198_domain : ExactDomain block0198 203 235 := by
  simpa only [values0198_size] using segment_domain 203 values0198

theorem block0198_get (i : Fin 32) :
    block0198 (203 + i.val) = some (values0198[i.val]'(by rw [values0198_size]; exact i.isLt)) := by
  exact segment_get 203 values0198 ⟨i.val, by rw [values0198_size]; exact i.isLt⟩

def values0199 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0199.coefficient12_235,
  OriginalRow227TriangleData0199.coefficient12_236,
  OriginalRow227TriangleData0199.coefficient12_237,
  OriginalRow227TriangleData0199.coefficient12_238,
  OriginalRow227TriangleData0199.coefficient12_239,
  OriginalRow227TriangleData0199.coefficient12_240,
  OriginalRow227TriangleData0199.coefficient12_241,
  OriginalRow227TriangleData0199.coefficient12_242,
  OriginalRow227TriangleData0199.coefficient12_243,
  OriginalRow227TriangleData0199.coefficient12_244,
  OriginalRow227TriangleData0199.coefficient12_245,
  OriginalRow227TriangleData0199.coefficient12_246,
  OriginalRow227TriangleData0199.coefficient12_247,
  OriginalRow227TriangleData0199.coefficient12_248,
  OriginalRow227TriangleData0199.coefficient12_249,
  OriginalRow227TriangleData0199.coefficient12_250,
  OriginalRow227TriangleData0199.coefficient12_251,
  OriginalRow227TriangleData0199.coefficient12_252,
  OriginalRow227TriangleData0199.coefficient12_253,
  OriginalRow227TriangleData0199.coefficient12_254,
  OriginalRow227TriangleData0199.coefficient12_255,
  OriginalRow227TriangleData0199.coefficient12_256,
  OriginalRow227TriangleData0199.coefficient12_257,
  OriginalRow227TriangleData0199.coefficient12_258,
  OriginalRow227TriangleData0199.coefficient12_259,
  OriginalRow227TriangleData0199.coefficient12_260,
  OriginalRow227TriangleData0199.coefficient12_261,
  OriginalRow227TriangleData0199.coefficient12_262,
  OriginalRow227TriangleData0199.coefficient12_263,
  OriginalRow227TriangleData0199.coefficient12_264,
  OriginalRow227TriangleData0199.coefficient12_265,
  OriginalRow227TriangleData0199.coefficient12_266
]

theorem values0199_size : values0199.size = 32 := rfl

def block0199 : ℕ → Option IntervalDyadic := segment 235 values0199

theorem block0199_domain : ExactDomain block0199 235 267 := by
  simpa only [values0199_size] using segment_domain 235 values0199

theorem block0199_get (i : Fin 32) :
    block0199 (235 + i.val) = some (values0199[i.val]'(by rw [values0199_size]; exact i.isLt)) := by
  exact segment_get 235 values0199 ⟨i.val, by rw [values0199_size]; exact i.isLt⟩

def values0200 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0200.coefficient12_267,
  OriginalRow227TriangleData0200.coefficient12_268,
  OriginalRow227TriangleData0200.coefficient12_269,
  OriginalRow227TriangleData0200.coefficient12_270,
  OriginalRow227TriangleData0200.coefficient12_271,
  OriginalRow227TriangleData0200.coefficient12_272,
  OriginalRow227TriangleData0200.coefficient12_273,
  OriginalRow227TriangleData0200.coefficient12_274,
  OriginalRow227TriangleData0200.coefficient12_275,
  OriginalRow227TriangleData0200.coefficient12_276,
  OriginalRow227TriangleData0200.coefficient12_277,
  OriginalRow227TriangleData0200.coefficient12_278,
  OriginalRow227TriangleData0200.coefficient12_279,
  OriginalRow227TriangleData0200.coefficient12_280,
  OriginalRow227TriangleData0200.coefficient12_281,
  OriginalRow227TriangleData0200.coefficient12_282,
  OriginalRow227TriangleData0200.coefficient12_283,
  OriginalRow227TriangleData0200.coefficient12_284,
  OriginalRow227TriangleData0200.coefficient12_285,
  OriginalRow227TriangleData0200.coefficient12_286,
  OriginalRow227TriangleData0200.coefficient12_287,
  OriginalRow227TriangleData0200.coefficient12_288,
  OriginalRow227TriangleData0200.coefficient12_289,
  OriginalRow227TriangleData0200.coefficient12_290,
  OriginalRow227TriangleData0200.coefficient12_291,
  OriginalRow227TriangleData0200.coefficient12_292,
  OriginalRow227TriangleData0200.coefficient12_293,
  OriginalRow227TriangleData0200.coefficient12_294,
  OriginalRow227TriangleData0200.coefficient12_295,
  OriginalRow227TriangleData0200.coefficient12_296,
  OriginalRow227TriangleData0200.coefficient12_297,
  OriginalRow227TriangleData0200.coefficient12_298
]

theorem values0200_size : values0200.size = 32 := rfl

def block0200 : ℕ → Option IntervalDyadic := segment 267 values0200

theorem block0200_domain : ExactDomain block0200 267 299 := by
  simpa only [values0200_size] using segment_domain 267 values0200

theorem block0200_get (i : Fin 32) :
    block0200 (267 + i.val) = some (values0200[i.val]'(by rw [values0200_size]; exact i.isLt)) := by
  exact segment_get 267 values0200 ⟨i.val, by rw [values0200_size]; exact i.isLt⟩

def values0201 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0201.coefficient12_299,
  OriginalRow227TriangleData0201.coefficient12_300,
  OriginalRow227TriangleData0201.coefficient12_301,
  OriginalRow227TriangleData0201.coefficient12_302,
  OriginalRow227TriangleData0201.coefficient12_303,
  OriginalRow227TriangleData0201.coefficient12_304,
  OriginalRow227TriangleData0201.coefficient12_305,
  OriginalRow227TriangleData0201.coefficient12_306,
  OriginalRow227TriangleData0201.coefficient12_307,
  OriginalRow227TriangleData0201.coefficient12_308,
  OriginalRow227TriangleData0201.coefficient12_309,
  OriginalRow227TriangleData0201.coefficient12_310,
  OriginalRow227TriangleData0201.coefficient12_311,
  OriginalRow227TriangleData0201.coefficient12_312,
  OriginalRow227TriangleData0201.coefficient12_313,
  OriginalRow227TriangleData0201.coefficient12_314,
  OriginalRow227TriangleData0201.coefficient12_315,
  OriginalRow227TriangleData0201.coefficient12_316,
  OriginalRow227TriangleData0201.coefficient12_317,
  OriginalRow227TriangleData0201.coefficient12_318,
  OriginalRow227TriangleData0201.coefficient12_319,
  OriginalRow227TriangleData0201.coefficient12_320,
  OriginalRow227TriangleData0201.coefficient12_321,
  OriginalRow227TriangleData0201.coefficient12_322,
  OriginalRow227TriangleData0201.coefficient12_323,
  OriginalRow227TriangleData0201.coefficient12_324,
  OriginalRow227TriangleData0201.coefficient12_325,
  OriginalRow227TriangleData0201.coefficient12_326,
  OriginalRow227TriangleData0201.coefficient12_327,
  OriginalRow227TriangleData0201.coefficient12_328,
  OriginalRow227TriangleData0201.coefficient12_329,
  OriginalRow227TriangleData0201.coefficient12_330
]

theorem values0201_size : values0201.size = 32 := rfl

def block0201 : ℕ → Option IntervalDyadic := segment 299 values0201

theorem block0201_domain : ExactDomain block0201 299 331 := by
  simpa only [values0201_size] using segment_domain 299 values0201

theorem block0201_get (i : Fin 32) :
    block0201 (299 + i.val) = some (values0201[i.val]'(by rw [values0201_size]; exact i.isLt)) := by
  exact segment_get 299 values0201 ⟨i.val, by rw [values0201_size]; exact i.isLt⟩

def values0202 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0202.coefficient12_331,
  OriginalRow227TriangleData0202.coefficient12_332,
  OriginalRow227TriangleData0202.coefficient12_333,
  OriginalRow227TriangleData0202.coefficient12_334,
  OriginalRow227TriangleData0202.coefficient12_335,
  OriginalRow227TriangleData0202.coefficient12_336,
  OriginalRow227TriangleData0202.coefficient12_337,
  OriginalRow227TriangleData0202.coefficient12_338,
  OriginalRow227TriangleData0202.coefficient12_339,
  OriginalRow227TriangleData0202.coefficient12_340,
  OriginalRow227TriangleData0202.coefficient12_341,
  OriginalRow227TriangleData0202.coefficient12_342,
  OriginalRow227TriangleData0202.coefficient12_343,
  OriginalRow227TriangleData0202.coefficient12_344,
  OriginalRow227TriangleData0202.coefficient12_345,
  OriginalRow227TriangleData0202.coefficient12_346,
  OriginalRow227TriangleData0202.coefficient12_347,
  OriginalRow227TriangleData0202.coefficient12_348,
  OriginalRow227TriangleData0202.coefficient12_349,
  OriginalRow227TriangleData0202.coefficient12_350,
  OriginalRow227TriangleData0202.coefficient12_351,
  OriginalRow227TriangleData0202.coefficient12_352,
  OriginalRow227TriangleData0202.coefficient12_353,
  OriginalRow227TriangleData0202.coefficient12_354,
  OriginalRow227TriangleData0202.coefficient12_355,
  OriginalRow227TriangleData0202.coefficient12_356,
  OriginalRow227TriangleData0202.coefficient12_357,
  OriginalRow227TriangleData0202.coefficient12_358,
  OriginalRow227TriangleData0202.coefficient12_359,
  OriginalRow227TriangleData0202.coefficient12_360,
  OriginalRow227TriangleData0202.coefficient12_361,
  OriginalRow227TriangleData0202.coefficient12_362
]

theorem values0202_size : values0202.size = 32 := rfl

def block0202 : ℕ → Option IntervalDyadic := segment 331 values0202

theorem block0202_domain : ExactDomain block0202 331 363 := by
  simpa only [values0202_size] using segment_domain 331 values0202

theorem block0202_get (i : Fin 32) :
    block0202 (331 + i.val) = some (values0202[i.val]'(by rw [values0202_size]; exact i.isLt)) := by
  exact segment_get 331 values0202 ⟨i.val, by rw [values0202_size]; exact i.isLt⟩

def values0203 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0203.coefficient12_363,
  OriginalRow227TriangleData0203.coefficient12_364,
  OriginalRow227TriangleData0203.coefficient12_365,
  OriginalRow227TriangleData0203.coefficient12_366,
  OriginalRow227TriangleData0203.coefficient12_367,
  OriginalRow227TriangleData0203.coefficient12_368,
  OriginalRow227TriangleData0203.coefficient12_369,
  OriginalRow227TriangleData0203.coefficient12_370,
  OriginalRow227TriangleData0203.coefficient12_371,
  OriginalRow227TriangleData0203.coefficient12_372,
  OriginalRow227TriangleData0203.coefficient12_373,
  OriginalRow227TriangleData0203.coefficient12_374,
  OriginalRow227TriangleData0203.coefficient12_375,
  OriginalRow227TriangleData0203.coefficient12_376,
  OriginalRow227TriangleData0203.coefficient12_377,
  OriginalRow227TriangleData0203.coefficient12_378,
  OriginalRow227TriangleData0203.coefficient12_379,
  OriginalRow227TriangleData0203.coefficient12_380,
  OriginalRow227TriangleData0203.coefficient12_381,
  OriginalRow227TriangleData0203.coefficient12_382,
  OriginalRow227TriangleData0203.coefficient12_383,
  OriginalRow227TriangleData0203.coefficient12_384,
  OriginalRow227TriangleData0203.coefficient12_385,
  OriginalRow227TriangleData0203.coefficient12_386,
  OriginalRow227TriangleData0203.coefficient12_387,
  OriginalRow227TriangleData0203.coefficient12_388,
  OriginalRow227TriangleData0203.coefficient12_389,
  OriginalRow227TriangleData0203.coefficient12_390,
  OriginalRow227TriangleData0203.coefficient12_391,
  OriginalRow227TriangleData0203.coefficient12_392,
  OriginalRow227TriangleData0203.coefficient12_393,
  OriginalRow227TriangleData0203.coefficient12_394
]

theorem values0203_size : values0203.size = 32 := rfl

def block0203 : ℕ → Option IntervalDyadic := segment 363 values0203

theorem block0203_domain : ExactDomain block0203 363 395 := by
  simpa only [values0203_size] using segment_domain 363 values0203

theorem block0203_get (i : Fin 32) :
    block0203 (363 + i.val) = some (values0203[i.val]'(by rw [values0203_size]; exact i.isLt)) := by
  exact segment_get 363 values0203 ⟨i.val, by rw [values0203_size]; exact i.isLt⟩

def values0204 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0204.coefficient12_395,
  OriginalRow227TriangleData0204.coefficient12_396,
  OriginalRow227TriangleData0204.coefficient12_397,
  OriginalRow227TriangleData0204.coefficient12_398,
  OriginalRow227TriangleData0204.coefficient12_399,
  OriginalRow227TriangleData0204.coefficient12_400,
  OriginalRow227TriangleData0204.coefficient12_401,
  OriginalRow227TriangleData0204.coefficient12_402,
  OriginalRow227TriangleData0204.coefficient12_403,
  OriginalRow227TriangleData0204.coefficient12_404,
  OriginalRow227TriangleData0204.coefficient12_405,
  OriginalRow227TriangleData0204.coefficient12_406,
  OriginalRow227TriangleData0204.coefficient12_407,
  OriginalRow227TriangleData0204.coefficient12_408,
  OriginalRow227TriangleData0204.coefficient12_409,
  OriginalRow227TriangleData0204.coefficient12_410,
  OriginalRow227TriangleData0204.coefficient12_411,
  OriginalRow227TriangleData0204.coefficient12_412,
  OriginalRow227TriangleData0204.coefficient12_413,
  OriginalRow227TriangleData0204.coefficient12_414,
  OriginalRow227TriangleData0204.coefficient12_415,
  OriginalRow227TriangleData0204.coefficient12_416,
  OriginalRow227TriangleData0204.coefficient12_417,
  OriginalRow227TriangleData0204.coefficient12_418,
  OriginalRow227TriangleData0204.coefficient12_419,
  OriginalRow227TriangleData0204.coefficient12_420,
  OriginalRow227TriangleData0204.coefficient12_421,
  OriginalRow227TriangleData0204.coefficient12_422,
  OriginalRow227TriangleData0204.coefficient12_423,
  OriginalRow227TriangleData0204.coefficient12_424,
  OriginalRow227TriangleData0204.coefficient12_425,
  OriginalRow227TriangleData0204.coefficient12_426
]

theorem values0204_size : values0204.size = 32 := rfl

def block0204 : ℕ → Option IntervalDyadic := segment 395 values0204

theorem block0204_domain : ExactDomain block0204 395 427 := by
  simpa only [values0204_size] using segment_domain 395 values0204

theorem block0204_get (i : Fin 32) :
    block0204 (395 + i.val) = some (values0204[i.val]'(by rw [values0204_size]; exact i.isLt)) := by
  exact segment_get 395 values0204 ⟨i.val, by rw [values0204_size]; exact i.isLt⟩

def values0205 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0205.coefficient12_427,
  OriginalRow227TriangleData0205.coefficient12_428,
  OriginalRow227TriangleData0205.coefficient12_429,
  OriginalRow227TriangleData0205.coefficient12_430,
  OriginalRow227TriangleData0205.coefficient12_431,
  OriginalRow227TriangleData0205.coefficient12_432,
  OriginalRow227TriangleData0205.coefficient12_433,
  OriginalRow227TriangleData0205.coefficient12_434,
  OriginalRow227TriangleData0205.coefficient12_435,
  OriginalRow227TriangleData0205.coefficient12_436,
  OriginalRow227TriangleData0205.coefficient12_437,
  OriginalRow227TriangleData0205.coefficient12_438,
  OriginalRow227TriangleData0205.coefficient12_439,
  OriginalRow227TriangleData0205.coefficient12_440,
  OriginalRow227TriangleData0205.coefficient12_441,
  OriginalRow227TriangleData0205.coefficient12_442,
  OriginalRow227TriangleData0205.coefficient12_443,
  OriginalRow227TriangleData0205.coefficient12_444,
  OriginalRow227TriangleData0205.coefficient12_445,
  OriginalRow227TriangleData0205.coefficient12_446,
  OriginalRow227TriangleData0205.coefficient12_447,
  OriginalRow227TriangleData0205.coefficient12_448,
  OriginalRow227TriangleData0205.coefficient12_449,
  OriginalRow227TriangleData0205.coefficient12_450,
  OriginalRow227TriangleData0205.coefficient12_451,
  OriginalRow227TriangleData0205.coefficient12_452,
  OriginalRow227TriangleData0205.coefficient12_453,
  OriginalRow227TriangleData0205.coefficient12_454,
  OriginalRow227TriangleData0205.coefficient12_455,
  OriginalRow227TriangleData0205.coefficient12_456,
  OriginalRow227TriangleData0205.coefficient12_457,
  OriginalRow227TriangleData0205.coefficient12_458
]

theorem values0205_size : values0205.size = 32 := rfl

def block0205 : ℕ → Option IntervalDyadic := segment 427 values0205

theorem block0205_domain : ExactDomain block0205 427 459 := by
  simpa only [values0205_size] using segment_domain 427 values0205

theorem block0205_get (i : Fin 32) :
    block0205 (427 + i.val) = some (values0205[i.val]'(by rw [values0205_size]; exact i.isLt)) := by
  exact segment_get 427 values0205 ⟨i.val, by rw [values0205_size]; exact i.isLt⟩

def values0206 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0206.coefficient12_459,
  OriginalRow227TriangleData0206.coefficient12_460,
  OriginalRow227TriangleData0206.coefficient12_461,
  OriginalRow227TriangleData0206.coefficient12_462,
  OriginalRow227TriangleData0206.coefficient12_463,
  OriginalRow227TriangleData0206.coefficient12_464,
  OriginalRow227TriangleData0206.coefficient12_465,
  OriginalRow227TriangleData0206.coefficient12_466,
  OriginalRow227TriangleData0206.coefficient12_467,
  OriginalRow227TriangleData0206.coefficient12_468,
  OriginalRow227TriangleData0206.coefficient12_469,
  OriginalRow227TriangleData0206.coefficient12_470,
  OriginalRow227TriangleData0206.coefficient12_471,
  OriginalRow227TriangleData0206.coefficient12_472,
  OriginalRow227TriangleData0206.coefficient12_473,
  OriginalRow227TriangleData0206.coefficient12_474,
  OriginalRow227TriangleData0206.coefficient12_475,
  OriginalRow227TriangleData0206.coefficient12_476,
  OriginalRow227TriangleData0206.coefficient12_477,
  OriginalRow227TriangleData0206.coefficient12_478,
  OriginalRow227TriangleData0206.coefficient12_479,
  OriginalRow227TriangleData0206.coefficient12_480,
  OriginalRow227TriangleData0206.coefficient12_481,
  OriginalRow227TriangleData0206.coefficient12_482,
  OriginalRow227TriangleData0206.coefficient12_483,
  OriginalRow227TriangleData0206.coefficient12_484,
  OriginalRow227TriangleData0206.coefficient12_485,
  OriginalRow227TriangleData0206.coefficient12_486,
  OriginalRow227TriangleData0206.coefficient12_487,
  OriginalRow227TriangleData0206.coefficient12_488,
  OriginalRow227TriangleData0206.coefficient12_489
]

theorem values0206_size : values0206.size = 31 := rfl

def block0206 : ℕ → Option IntervalDyadic := segment 459 values0206

theorem block0206_domain : ExactDomain block0206 459 490 := by
  simpa only [values0206_size] using segment_domain 459 values0206

theorem block0206_get (i : Fin 31) :
    block0206 (459 + i.val) = some (values0206[i.val]'(by rw [values0206_size]; exact i.isLt)) := by
  exact segment_get 459 values0206 ⟨i.val, by rw [values0206_size]; exact i.isLt⟩

def node0043_0107 : ℕ → Option IntervalDyadic := split 75 block0193 block0194

theorem node0043_0107_domain : ExactDomain node0043_0107 43 107 := by
  exact split_domain (by decide) (by decide) block0193_domain block0194_domain

def node0011_0107 : ℕ → Option IntervalDyadic := split 43 block0192 node0043_0107

theorem node0011_0107_domain : ExactDomain node0011_0107 11 107 := by
  exact split_domain (by decide) (by decide) block0192_domain node0043_0107_domain

def node0107_0171 : ℕ → Option IntervalDyadic := split 139 block0195 block0196

theorem node0107_0171_domain : ExactDomain node0107_0171 107 171 := by
  exact split_domain (by decide) (by decide) block0195_domain block0196_domain

def node0171_0235 : ℕ → Option IntervalDyadic := split 203 block0197 block0198

theorem node0171_0235_domain : ExactDomain node0171_0235 171 235 := by
  exact split_domain (by decide) (by decide) block0197_domain block0198_domain

def node0107_0235 : ℕ → Option IntervalDyadic := split 171 node0107_0171 node0171_0235

theorem node0107_0235_domain : ExactDomain node0107_0235 107 235 := by
  exact split_domain (by decide) (by decide) node0107_0171_domain node0171_0235_domain

def node0011_0235 : ℕ → Option IntervalDyadic := split 107 node0011_0107 node0107_0235

theorem node0011_0235_domain : ExactDomain node0011_0235 11 235 := by
  exact split_domain (by decide) (by decide) node0011_0107_domain node0107_0235_domain

def node0235_0299 : ℕ → Option IntervalDyadic := split 267 block0199 block0200

theorem node0235_0299_domain : ExactDomain node0235_0299 235 299 := by
  exact split_domain (by decide) (by decide) block0199_domain block0200_domain

def node0299_0363 : ℕ → Option IntervalDyadic := split 331 block0201 block0202

theorem node0299_0363_domain : ExactDomain node0299_0363 299 363 := by
  exact split_domain (by decide) (by decide) block0201_domain block0202_domain

def node0235_0363 : ℕ → Option IntervalDyadic := split 299 node0235_0299 node0299_0363

theorem node0235_0363_domain : ExactDomain node0235_0363 235 363 := by
  exact split_domain (by decide) (by decide) node0235_0299_domain node0299_0363_domain

def node0363_0427 : ℕ → Option IntervalDyadic := split 395 block0203 block0204

theorem node0363_0427_domain : ExactDomain node0363_0427 363 427 := by
  exact split_domain (by decide) (by decide) block0203_domain block0204_domain

def node0427_0490 : ℕ → Option IntervalDyadic := split 459 block0205 block0206

theorem node0427_0490_domain : ExactDomain node0427_0490 427 490 := by
  exact split_domain (by decide) (by decide) block0205_domain block0206_domain

def node0363_0490 : ℕ → Option IntervalDyadic := split 427 node0363_0427 node0427_0490

theorem node0363_0490_domain : ExactDomain node0363_0490 363 490 := by
  exact split_domain (by decide) (by decide) node0363_0427_domain node0427_0490_domain

def node0235_0490 : ℕ → Option IntervalDyadic := split 363 node0235_0363 node0363_0490

theorem node0235_0490_domain : ExactDomain node0235_0490 235 490 := by
  exact split_domain (by decide) (by decide) node0235_0363_domain node0363_0490_domain

def node0011_0490 : ℕ → Option IntervalDyadic := split 235 node0011_0235 node0235_0490

theorem node0011_0490_domain : ExactDomain node0011_0490 11 490 := by
  exact split_domain (by decide) (by decide) node0011_0235_domain node0235_0490_domain

def lookup : ℕ → Option IntervalDyadic := node0011_0490

theorem lookup_domain : ExactDomain lookup 11 490 :=
  node0011_0490_domain

theorem block0192_lookup (i : Fin 32) :
    lookup (11 + i.val) = some (values0192[i.val]'(by rw [values0192_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (11 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_left 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0011_0107, split_left 43 block0192 node0043_0107 (by omega)]
  exact block0192_get i

theorem block0193_lookup (i : Fin 32) :
    lookup (43 + i.val) = some (values0193[i.val]'(by rw [values0193_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (43 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_left 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0011_0107, split_right 43 block0192 node0043_0107 (by omega)]
  rw [node0043_0107, split_left 75 block0193 block0194 (by omega)]
  exact block0193_get i

theorem block0194_lookup (i : Fin 32) :
    lookup (75 + i.val) = some (values0194[i.val]'(by rw [values0194_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (75 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_left 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0011_0107, split_right 43 block0192 node0043_0107 (by omega)]
  rw [node0043_0107, split_right 75 block0193 block0194 (by omega)]
  exact block0194_get i

theorem block0195_lookup (i : Fin 32) :
    lookup (107 + i.val) = some (values0195[i.val]'(by rw [values0195_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (107 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_right 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0107_0235, split_left 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0107_0171, split_left 139 block0195 block0196 (by omega)]
  exact block0195_get i

theorem block0196_lookup (i : Fin 32) :
    lookup (139 + i.val) = some (values0196[i.val]'(by rw [values0196_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (139 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_right 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0107_0235, split_left 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0107_0171, split_right 139 block0195 block0196 (by omega)]
  exact block0196_get i

theorem block0197_lookup (i : Fin 32) :
    lookup (171 + i.val) = some (values0197[i.val]'(by rw [values0197_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (171 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_right 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0107_0235, split_right 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0171_0235, split_left 203 block0197 block0198 (by omega)]
  exact block0197_get i

theorem block0198_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values0198[i.val]'(by rw [values0198_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (203 + i.val) = _
  rw [node0011_0490, split_left 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0011_0235, split_right 107 node0011_0107 node0107_0235 (by omega)]
  rw [node0107_0235, split_right 171 node0107_0171 node0171_0235 (by omega)]
  rw [node0171_0235, split_right 203 block0197 block0198 (by omega)]
  exact block0198_get i

theorem block0199_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values0199[i.val]'(by rw [values0199_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (235 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_left 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0235_0363, split_left 299 node0235_0299 node0299_0363 (by omega)]
  rw [node0235_0299, split_left 267 block0199 block0200 (by omega)]
  exact block0199_get i

theorem block0200_lookup (i : Fin 32) :
    lookup (267 + i.val) = some (values0200[i.val]'(by rw [values0200_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (267 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_left 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0235_0363, split_left 299 node0235_0299 node0299_0363 (by omega)]
  rw [node0235_0299, split_right 267 block0199 block0200 (by omega)]
  exact block0200_get i

theorem block0201_lookup (i : Fin 32) :
    lookup (299 + i.val) = some (values0201[i.val]'(by rw [values0201_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (299 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_left 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0235_0363, split_right 299 node0235_0299 node0299_0363 (by omega)]
  rw [node0299_0363, split_left 331 block0201 block0202 (by omega)]
  exact block0201_get i

theorem block0202_lookup (i : Fin 32) :
    lookup (331 + i.val) = some (values0202[i.val]'(by rw [values0202_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (331 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_left 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0235_0363, split_right 299 node0235_0299 node0299_0363 (by omega)]
  rw [node0299_0363, split_right 331 block0201 block0202 (by omega)]
  exact block0202_get i

theorem block0203_lookup (i : Fin 32) :
    lookup (363 + i.val) = some (values0203[i.val]'(by rw [values0203_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (363 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_right 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0363_0490, split_left 427 node0363_0427 node0427_0490 (by omega)]
  rw [node0363_0427, split_left 395 block0203 block0204 (by omega)]
  exact block0203_get i

theorem block0204_lookup (i : Fin 32) :
    lookup (395 + i.val) = some (values0204[i.val]'(by rw [values0204_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (395 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_right 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0363_0490, split_left 427 node0363_0427 node0427_0490 (by omega)]
  rw [node0363_0427, split_right 395 block0203 block0204 (by omega)]
  exact block0204_get i

theorem block0205_lookup (i : Fin 32) :
    lookup (427 + i.val) = some (values0205[i.val]'(by rw [values0205_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (427 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_right 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0363_0490, split_right 427 node0363_0427 node0427_0490 (by omega)]
  rw [node0427_0490, split_left 459 block0205 block0206 (by omega)]
  exact block0205_get i

theorem block0206_lookup (i : Fin 31) :
    lookup (459 + i.val) = some (values0206[i.val]'(by rw [values0206_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0011_0490 (459 + i.val) = _
  rw [node0011_0490, split_right 235 node0011_0235 node0235_0490 (by omega)]
  rw [node0235_0490, split_right 363 node0235_0363 node0363_0490 (by omega)]
  rw [node0363_0490, split_right 427 node0363_0427 node0427_0490 (by omega)]
  rw [node0427_0490, split_right 459 block0205 block0206 (by omega)]
  exact block0206_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0192_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0192_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0193_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0193_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0194_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0194_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0195_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0195_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0196_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0196_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0197_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0197_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0198_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0198_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0199_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0199_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0200_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0200_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0201_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0201_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0202_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0202_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0203_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0203_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0204_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0204_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0205_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0205_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0206_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0206_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0192_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0193_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0194_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0195_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0196_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0197_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0198_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0199_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0200_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0201_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0202_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0203_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0204_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0205_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow012.block0206_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow012
