import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0160
import Grothe.UpperChaos.OriginalRow227TriangleData0161
import Grothe.UpperChaos.OriginalRow227TriangleData0162
import Grothe.UpperChaos.OriginalRow227TriangleData0163
import Grothe.UpperChaos.OriginalRow227TriangleData0164
import Grothe.UpperChaos.OriginalRow227TriangleData0165
import Grothe.UpperChaos.OriginalRow227TriangleData0166
import Grothe.UpperChaos.OriginalRow227TriangleData0167
import Grothe.UpperChaos.OriginalRow227TriangleData0168
import Grothe.UpperChaos.OriginalRow227TriangleData0169
import Grothe.UpperChaos.OriginalRow227TriangleData0170
import Grothe.UpperChaos.OriginalRow227TriangleData0171
import Grothe.UpperChaos.OriginalRow227TriangleData0172
import Grothe.UpperChaos.OriginalRow227TriangleData0173
import Grothe.UpperChaos.OriginalRow227TriangleData0174
import Grothe.UpperChaos.OriginalRow227TriangleData0175

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow010

open ConditionalTableLookup

def values0160 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0160.coefficient10_9,
  OriginalRow227TriangleData0160.coefficient10_10,
  OriginalRow227TriangleData0160.coefficient10_11,
  OriginalRow227TriangleData0160.coefficient10_12,
  OriginalRow227TriangleData0160.coefficient10_13,
  OriginalRow227TriangleData0160.coefficient10_14,
  OriginalRow227TriangleData0160.coefficient10_15,
  OriginalRow227TriangleData0160.coefficient10_16,
  OriginalRow227TriangleData0160.coefficient10_17,
  OriginalRow227TriangleData0160.coefficient10_18,
  OriginalRow227TriangleData0160.coefficient10_19,
  OriginalRow227TriangleData0160.coefficient10_20,
  OriginalRow227TriangleData0160.coefficient10_21,
  OriginalRow227TriangleData0160.coefficient10_22,
  OriginalRow227TriangleData0160.coefficient10_23,
  OriginalRow227TriangleData0160.coefficient10_24,
  OriginalRow227TriangleData0160.coefficient10_25,
  OriginalRow227TriangleData0160.coefficient10_26,
  OriginalRow227TriangleData0160.coefficient10_27,
  OriginalRow227TriangleData0160.coefficient10_28,
  OriginalRow227TriangleData0160.coefficient10_29,
  OriginalRow227TriangleData0160.coefficient10_30,
  OriginalRow227TriangleData0160.coefficient10_31,
  OriginalRow227TriangleData0160.coefficient10_32,
  OriginalRow227TriangleData0160.coefficient10_33,
  OriginalRow227TriangleData0160.coefficient10_34,
  OriginalRow227TriangleData0160.coefficient10_35,
  OriginalRow227TriangleData0160.coefficient10_36,
  OriginalRow227TriangleData0160.coefficient10_37,
  OriginalRow227TriangleData0160.coefficient10_38,
  OriginalRow227TriangleData0160.coefficient10_39,
  OriginalRow227TriangleData0160.coefficient10_40
]

theorem values0160_size : values0160.size = 32 := rfl

def block0160 : ℕ → Option IntervalDyadic := segment 9 values0160

theorem block0160_domain : ExactDomain block0160 9 41 := by
  simpa only [values0160_size] using segment_domain 9 values0160

theorem block0160_get (i : Fin 32) :
    block0160 (9 + i.val) = some (values0160[i.val]'(by rw [values0160_size]; exact i.isLt)) := by
  exact segment_get 9 values0160 ⟨i.val, by rw [values0160_size]; exact i.isLt⟩

def values0161 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0161.coefficient10_41,
  OriginalRow227TriangleData0161.coefficient10_42,
  OriginalRow227TriangleData0161.coefficient10_43,
  OriginalRow227TriangleData0161.coefficient10_44,
  OriginalRow227TriangleData0161.coefficient10_45,
  OriginalRow227TriangleData0161.coefficient10_46,
  OriginalRow227TriangleData0161.coefficient10_47,
  OriginalRow227TriangleData0161.coefficient10_48,
  OriginalRow227TriangleData0161.coefficient10_49,
  OriginalRow227TriangleData0161.coefficient10_50,
  OriginalRow227TriangleData0161.coefficient10_51,
  OriginalRow227TriangleData0161.coefficient10_52,
  OriginalRow227TriangleData0161.coefficient10_53,
  OriginalRow227TriangleData0161.coefficient10_54,
  OriginalRow227TriangleData0161.coefficient10_55,
  OriginalRow227TriangleData0161.coefficient10_56,
  OriginalRow227TriangleData0161.coefficient10_57,
  OriginalRow227TriangleData0161.coefficient10_58,
  OriginalRow227TriangleData0161.coefficient10_59,
  OriginalRow227TriangleData0161.coefficient10_60,
  OriginalRow227TriangleData0161.coefficient10_61,
  OriginalRow227TriangleData0161.coefficient10_62,
  OriginalRow227TriangleData0161.coefficient10_63,
  OriginalRow227TriangleData0161.coefficient10_64,
  OriginalRow227TriangleData0161.coefficient10_65,
  OriginalRow227TriangleData0161.coefficient10_66,
  OriginalRow227TriangleData0161.coefficient10_67,
  OriginalRow227TriangleData0161.coefficient10_68,
  OriginalRow227TriangleData0161.coefficient10_69,
  OriginalRow227TriangleData0161.coefficient10_70,
  OriginalRow227TriangleData0161.coefficient10_71,
  OriginalRow227TriangleData0161.coefficient10_72
]

theorem values0161_size : values0161.size = 32 := rfl

def block0161 : ℕ → Option IntervalDyadic := segment 41 values0161

theorem block0161_domain : ExactDomain block0161 41 73 := by
  simpa only [values0161_size] using segment_domain 41 values0161

theorem block0161_get (i : Fin 32) :
    block0161 (41 + i.val) = some (values0161[i.val]'(by rw [values0161_size]; exact i.isLt)) := by
  exact segment_get 41 values0161 ⟨i.val, by rw [values0161_size]; exact i.isLt⟩

def values0162 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0162.coefficient10_73,
  OriginalRow227TriangleData0162.coefficient10_74,
  OriginalRow227TriangleData0162.coefficient10_75,
  OriginalRow227TriangleData0162.coefficient10_76,
  OriginalRow227TriangleData0162.coefficient10_77,
  OriginalRow227TriangleData0162.coefficient10_78,
  OriginalRow227TriangleData0162.coefficient10_79,
  OriginalRow227TriangleData0162.coefficient10_80,
  OriginalRow227TriangleData0162.coefficient10_81,
  OriginalRow227TriangleData0162.coefficient10_82,
  OriginalRow227TriangleData0162.coefficient10_83,
  OriginalRow227TriangleData0162.coefficient10_84,
  OriginalRow227TriangleData0162.coefficient10_85,
  OriginalRow227TriangleData0162.coefficient10_86,
  OriginalRow227TriangleData0162.coefficient10_87,
  OriginalRow227TriangleData0162.coefficient10_88,
  OriginalRow227TriangleData0162.coefficient10_89,
  OriginalRow227TriangleData0162.coefficient10_90,
  OriginalRow227TriangleData0162.coefficient10_91,
  OriginalRow227TriangleData0162.coefficient10_92,
  OriginalRow227TriangleData0162.coefficient10_93,
  OriginalRow227TriangleData0162.coefficient10_94,
  OriginalRow227TriangleData0162.coefficient10_95,
  OriginalRow227TriangleData0162.coefficient10_96,
  OriginalRow227TriangleData0162.coefficient10_97,
  OriginalRow227TriangleData0162.coefficient10_98,
  OriginalRow227TriangleData0162.coefficient10_99,
  OriginalRow227TriangleData0162.coefficient10_100,
  OriginalRow227TriangleData0162.coefficient10_101,
  OriginalRow227TriangleData0162.coefficient10_102,
  OriginalRow227TriangleData0162.coefficient10_103,
  OriginalRow227TriangleData0162.coefficient10_104
]

theorem values0162_size : values0162.size = 32 := rfl

def block0162 : ℕ → Option IntervalDyadic := segment 73 values0162

theorem block0162_domain : ExactDomain block0162 73 105 := by
  simpa only [values0162_size] using segment_domain 73 values0162

theorem block0162_get (i : Fin 32) :
    block0162 (73 + i.val) = some (values0162[i.val]'(by rw [values0162_size]; exact i.isLt)) := by
  exact segment_get 73 values0162 ⟨i.val, by rw [values0162_size]; exact i.isLt⟩

def values0163 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0163.coefficient10_105,
  OriginalRow227TriangleData0163.coefficient10_106,
  OriginalRow227TriangleData0163.coefficient10_107,
  OriginalRow227TriangleData0163.coefficient10_108,
  OriginalRow227TriangleData0163.coefficient10_109,
  OriginalRow227TriangleData0163.coefficient10_110,
  OriginalRow227TriangleData0163.coefficient10_111,
  OriginalRow227TriangleData0163.coefficient10_112,
  OriginalRow227TriangleData0163.coefficient10_113,
  OriginalRow227TriangleData0163.coefficient10_114,
  OriginalRow227TriangleData0163.coefficient10_115,
  OriginalRow227TriangleData0163.coefficient10_116,
  OriginalRow227TriangleData0163.coefficient10_117,
  OriginalRow227TriangleData0163.coefficient10_118,
  OriginalRow227TriangleData0163.coefficient10_119,
  OriginalRow227TriangleData0163.coefficient10_120,
  OriginalRow227TriangleData0163.coefficient10_121,
  OriginalRow227TriangleData0163.coefficient10_122,
  OriginalRow227TriangleData0163.coefficient10_123,
  OriginalRow227TriangleData0163.coefficient10_124,
  OriginalRow227TriangleData0163.coefficient10_125,
  OriginalRow227TriangleData0163.coefficient10_126,
  OriginalRow227TriangleData0163.coefficient10_127,
  OriginalRow227TriangleData0163.coefficient10_128,
  OriginalRow227TriangleData0163.coefficient10_129,
  OriginalRow227TriangleData0163.coefficient10_130,
  OriginalRow227TriangleData0163.coefficient10_131,
  OriginalRow227TriangleData0163.coefficient10_132,
  OriginalRow227TriangleData0163.coefficient10_133,
  OriginalRow227TriangleData0163.coefficient10_134,
  OriginalRow227TriangleData0163.coefficient10_135,
  OriginalRow227TriangleData0163.coefficient10_136
]

theorem values0163_size : values0163.size = 32 := rfl

def block0163 : ℕ → Option IntervalDyadic := segment 105 values0163

theorem block0163_domain : ExactDomain block0163 105 137 := by
  simpa only [values0163_size] using segment_domain 105 values0163

theorem block0163_get (i : Fin 32) :
    block0163 (105 + i.val) = some (values0163[i.val]'(by rw [values0163_size]; exact i.isLt)) := by
  exact segment_get 105 values0163 ⟨i.val, by rw [values0163_size]; exact i.isLt⟩

def values0164 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0164.coefficient10_137,
  OriginalRow227TriangleData0164.coefficient10_138,
  OriginalRow227TriangleData0164.coefficient10_139,
  OriginalRow227TriangleData0164.coefficient10_140,
  OriginalRow227TriangleData0164.coefficient10_141,
  OriginalRow227TriangleData0164.coefficient10_142,
  OriginalRow227TriangleData0164.coefficient10_143,
  OriginalRow227TriangleData0164.coefficient10_144,
  OriginalRow227TriangleData0164.coefficient10_145,
  OriginalRow227TriangleData0164.coefficient10_146,
  OriginalRow227TriangleData0164.coefficient10_147,
  OriginalRow227TriangleData0164.coefficient10_148,
  OriginalRow227TriangleData0164.coefficient10_149,
  OriginalRow227TriangleData0164.coefficient10_150,
  OriginalRow227TriangleData0164.coefficient10_151,
  OriginalRow227TriangleData0164.coefficient10_152,
  OriginalRow227TriangleData0164.coefficient10_153,
  OriginalRow227TriangleData0164.coefficient10_154,
  OriginalRow227TriangleData0164.coefficient10_155,
  OriginalRow227TriangleData0164.coefficient10_156,
  OriginalRow227TriangleData0164.coefficient10_157,
  OriginalRow227TriangleData0164.coefficient10_158,
  OriginalRow227TriangleData0164.coefficient10_159,
  OriginalRow227TriangleData0164.coefficient10_160,
  OriginalRow227TriangleData0164.coefficient10_161,
  OriginalRow227TriangleData0164.coefficient10_162,
  OriginalRow227TriangleData0164.coefficient10_163,
  OriginalRow227TriangleData0164.coefficient10_164,
  OriginalRow227TriangleData0164.coefficient10_165,
  OriginalRow227TriangleData0164.coefficient10_166,
  OriginalRow227TriangleData0164.coefficient10_167,
  OriginalRow227TriangleData0164.coefficient10_168
]

theorem values0164_size : values0164.size = 32 := rfl

def block0164 : ℕ → Option IntervalDyadic := segment 137 values0164

theorem block0164_domain : ExactDomain block0164 137 169 := by
  simpa only [values0164_size] using segment_domain 137 values0164

theorem block0164_get (i : Fin 32) :
    block0164 (137 + i.val) = some (values0164[i.val]'(by rw [values0164_size]; exact i.isLt)) := by
  exact segment_get 137 values0164 ⟨i.val, by rw [values0164_size]; exact i.isLt⟩

def values0165 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0165.coefficient10_169,
  OriginalRow227TriangleData0165.coefficient10_170,
  OriginalRow227TriangleData0165.coefficient10_171,
  OriginalRow227TriangleData0165.coefficient10_172,
  OriginalRow227TriangleData0165.coefficient10_173,
  OriginalRow227TriangleData0165.coefficient10_174,
  OriginalRow227TriangleData0165.coefficient10_175,
  OriginalRow227TriangleData0165.coefficient10_176,
  OriginalRow227TriangleData0165.coefficient10_177,
  OriginalRow227TriangleData0165.coefficient10_178,
  OriginalRow227TriangleData0165.coefficient10_179,
  OriginalRow227TriangleData0165.coefficient10_180,
  OriginalRow227TriangleData0165.coefficient10_181,
  OriginalRow227TriangleData0165.coefficient10_182,
  OriginalRow227TriangleData0165.coefficient10_183,
  OriginalRow227TriangleData0165.coefficient10_184,
  OriginalRow227TriangleData0165.coefficient10_185,
  OriginalRow227TriangleData0165.coefficient10_186,
  OriginalRow227TriangleData0165.coefficient10_187,
  OriginalRow227TriangleData0165.coefficient10_188,
  OriginalRow227TriangleData0165.coefficient10_189,
  OriginalRow227TriangleData0165.coefficient10_190,
  OriginalRow227TriangleData0165.coefficient10_191,
  OriginalRow227TriangleData0165.coefficient10_192,
  OriginalRow227TriangleData0165.coefficient10_193,
  OriginalRow227TriangleData0165.coefficient10_194,
  OriginalRow227TriangleData0165.coefficient10_195,
  OriginalRow227TriangleData0165.coefficient10_196,
  OriginalRow227TriangleData0165.coefficient10_197,
  OriginalRow227TriangleData0165.coefficient10_198,
  OriginalRow227TriangleData0165.coefficient10_199,
  OriginalRow227TriangleData0165.coefficient10_200
]

theorem values0165_size : values0165.size = 32 := rfl

def block0165 : ℕ → Option IntervalDyadic := segment 169 values0165

theorem block0165_domain : ExactDomain block0165 169 201 := by
  simpa only [values0165_size] using segment_domain 169 values0165

theorem block0165_get (i : Fin 32) :
    block0165 (169 + i.val) = some (values0165[i.val]'(by rw [values0165_size]; exact i.isLt)) := by
  exact segment_get 169 values0165 ⟨i.val, by rw [values0165_size]; exact i.isLt⟩

def values0166 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0166.coefficient10_201,
  OriginalRow227TriangleData0166.coefficient10_202,
  OriginalRow227TriangleData0166.coefficient10_203,
  OriginalRow227TriangleData0166.coefficient10_204,
  OriginalRow227TriangleData0166.coefficient10_205,
  OriginalRow227TriangleData0166.coefficient10_206,
  OriginalRow227TriangleData0166.coefficient10_207,
  OriginalRow227TriangleData0166.coefficient10_208,
  OriginalRow227TriangleData0166.coefficient10_209,
  OriginalRow227TriangleData0166.coefficient10_210,
  OriginalRow227TriangleData0166.coefficient10_211,
  OriginalRow227TriangleData0166.coefficient10_212,
  OriginalRow227TriangleData0166.coefficient10_213,
  OriginalRow227TriangleData0166.coefficient10_214,
  OriginalRow227TriangleData0166.coefficient10_215,
  OriginalRow227TriangleData0166.coefficient10_216,
  OriginalRow227TriangleData0166.coefficient10_217,
  OriginalRow227TriangleData0166.coefficient10_218,
  OriginalRow227TriangleData0166.coefficient10_219,
  OriginalRow227TriangleData0166.coefficient10_220,
  OriginalRow227TriangleData0166.coefficient10_221,
  OriginalRow227TriangleData0166.coefficient10_222,
  OriginalRow227TriangleData0166.coefficient10_223,
  OriginalRow227TriangleData0166.coefficient10_224,
  OriginalRow227TriangleData0166.coefficient10_225,
  OriginalRow227TriangleData0166.coefficient10_226,
  OriginalRow227TriangleData0166.coefficient10_227,
  OriginalRow227TriangleData0166.coefficient10_228,
  OriginalRow227TriangleData0166.coefficient10_229,
  OriginalRow227TriangleData0166.coefficient10_230,
  OriginalRow227TriangleData0166.coefficient10_231,
  OriginalRow227TriangleData0166.coefficient10_232
]

theorem values0166_size : values0166.size = 32 := rfl

def block0166 : ℕ → Option IntervalDyadic := segment 201 values0166

theorem block0166_domain : ExactDomain block0166 201 233 := by
  simpa only [values0166_size] using segment_domain 201 values0166

theorem block0166_get (i : Fin 32) :
    block0166 (201 + i.val) = some (values0166[i.val]'(by rw [values0166_size]; exact i.isLt)) := by
  exact segment_get 201 values0166 ⟨i.val, by rw [values0166_size]; exact i.isLt⟩

def values0167 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0167.coefficient10_233,
  OriginalRow227TriangleData0167.coefficient10_234,
  OriginalRow227TriangleData0167.coefficient10_235,
  OriginalRow227TriangleData0167.coefficient10_236,
  OriginalRow227TriangleData0167.coefficient10_237,
  OriginalRow227TriangleData0167.coefficient10_238,
  OriginalRow227TriangleData0167.coefficient10_239,
  OriginalRow227TriangleData0167.coefficient10_240,
  OriginalRow227TriangleData0167.coefficient10_241,
  OriginalRow227TriangleData0167.coefficient10_242,
  OriginalRow227TriangleData0167.coefficient10_243,
  OriginalRow227TriangleData0167.coefficient10_244,
  OriginalRow227TriangleData0167.coefficient10_245,
  OriginalRow227TriangleData0167.coefficient10_246,
  OriginalRow227TriangleData0167.coefficient10_247,
  OriginalRow227TriangleData0167.coefficient10_248,
  OriginalRow227TriangleData0167.coefficient10_249,
  OriginalRow227TriangleData0167.coefficient10_250,
  OriginalRow227TriangleData0167.coefficient10_251,
  OriginalRow227TriangleData0167.coefficient10_252,
  OriginalRow227TriangleData0167.coefficient10_253,
  OriginalRow227TriangleData0167.coefficient10_254,
  OriginalRow227TriangleData0167.coefficient10_255,
  OriginalRow227TriangleData0167.coefficient10_256,
  OriginalRow227TriangleData0167.coefficient10_257,
  OriginalRow227TriangleData0167.coefficient10_258,
  OriginalRow227TriangleData0167.coefficient10_259,
  OriginalRow227TriangleData0167.coefficient10_260,
  OriginalRow227TriangleData0167.coefficient10_261,
  OriginalRow227TriangleData0167.coefficient10_262,
  OriginalRow227TriangleData0167.coefficient10_263,
  OriginalRow227TriangleData0167.coefficient10_264
]

theorem values0167_size : values0167.size = 32 := rfl

def block0167 : ℕ → Option IntervalDyadic := segment 233 values0167

theorem block0167_domain : ExactDomain block0167 233 265 := by
  simpa only [values0167_size] using segment_domain 233 values0167

theorem block0167_get (i : Fin 32) :
    block0167 (233 + i.val) = some (values0167[i.val]'(by rw [values0167_size]; exact i.isLt)) := by
  exact segment_get 233 values0167 ⟨i.val, by rw [values0167_size]; exact i.isLt⟩

def values0168 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0168.coefficient10_265,
  OriginalRow227TriangleData0168.coefficient10_266,
  OriginalRow227TriangleData0168.coefficient10_267,
  OriginalRow227TriangleData0168.coefficient10_268,
  OriginalRow227TriangleData0168.coefficient10_269,
  OriginalRow227TriangleData0168.coefficient10_270,
  OriginalRow227TriangleData0168.coefficient10_271,
  OriginalRow227TriangleData0168.coefficient10_272,
  OriginalRow227TriangleData0168.coefficient10_273,
  OriginalRow227TriangleData0168.coefficient10_274,
  OriginalRow227TriangleData0168.coefficient10_275,
  OriginalRow227TriangleData0168.coefficient10_276,
  OriginalRow227TriangleData0168.coefficient10_277,
  OriginalRow227TriangleData0168.coefficient10_278,
  OriginalRow227TriangleData0168.coefficient10_279,
  OriginalRow227TriangleData0168.coefficient10_280,
  OriginalRow227TriangleData0168.coefficient10_281,
  OriginalRow227TriangleData0168.coefficient10_282,
  OriginalRow227TriangleData0168.coefficient10_283,
  OriginalRow227TriangleData0168.coefficient10_284,
  OriginalRow227TriangleData0168.coefficient10_285,
  OriginalRow227TriangleData0168.coefficient10_286,
  OriginalRow227TriangleData0168.coefficient10_287,
  OriginalRow227TriangleData0168.coefficient10_288,
  OriginalRow227TriangleData0168.coefficient10_289,
  OriginalRow227TriangleData0168.coefficient10_290,
  OriginalRow227TriangleData0168.coefficient10_291,
  OriginalRow227TriangleData0168.coefficient10_292,
  OriginalRow227TriangleData0168.coefficient10_293,
  OriginalRow227TriangleData0168.coefficient10_294,
  OriginalRow227TriangleData0168.coefficient10_295,
  OriginalRow227TriangleData0168.coefficient10_296
]

theorem values0168_size : values0168.size = 32 := rfl

def block0168 : ℕ → Option IntervalDyadic := segment 265 values0168

theorem block0168_domain : ExactDomain block0168 265 297 := by
  simpa only [values0168_size] using segment_domain 265 values0168

theorem block0168_get (i : Fin 32) :
    block0168 (265 + i.val) = some (values0168[i.val]'(by rw [values0168_size]; exact i.isLt)) := by
  exact segment_get 265 values0168 ⟨i.val, by rw [values0168_size]; exact i.isLt⟩

def values0169 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0169.coefficient10_297,
  OriginalRow227TriangleData0169.coefficient10_298,
  OriginalRow227TriangleData0169.coefficient10_299,
  OriginalRow227TriangleData0169.coefficient10_300,
  OriginalRow227TriangleData0169.coefficient10_301,
  OriginalRow227TriangleData0169.coefficient10_302,
  OriginalRow227TriangleData0169.coefficient10_303,
  OriginalRow227TriangleData0169.coefficient10_304,
  OriginalRow227TriangleData0169.coefficient10_305,
  OriginalRow227TriangleData0169.coefficient10_306,
  OriginalRow227TriangleData0169.coefficient10_307,
  OriginalRow227TriangleData0169.coefficient10_308,
  OriginalRow227TriangleData0169.coefficient10_309,
  OriginalRow227TriangleData0169.coefficient10_310,
  OriginalRow227TriangleData0169.coefficient10_311,
  OriginalRow227TriangleData0169.coefficient10_312,
  OriginalRow227TriangleData0169.coefficient10_313,
  OriginalRow227TriangleData0169.coefficient10_314,
  OriginalRow227TriangleData0169.coefficient10_315,
  OriginalRow227TriangleData0169.coefficient10_316,
  OriginalRow227TriangleData0169.coefficient10_317,
  OriginalRow227TriangleData0169.coefficient10_318,
  OriginalRow227TriangleData0169.coefficient10_319,
  OriginalRow227TriangleData0169.coefficient10_320,
  OriginalRow227TriangleData0169.coefficient10_321,
  OriginalRow227TriangleData0169.coefficient10_322,
  OriginalRow227TriangleData0169.coefficient10_323,
  OriginalRow227TriangleData0169.coefficient10_324,
  OriginalRow227TriangleData0169.coefficient10_325,
  OriginalRow227TriangleData0169.coefficient10_326,
  OriginalRow227TriangleData0169.coefficient10_327,
  OriginalRow227TriangleData0169.coefficient10_328
]

theorem values0169_size : values0169.size = 32 := rfl

def block0169 : ℕ → Option IntervalDyadic := segment 297 values0169

theorem block0169_domain : ExactDomain block0169 297 329 := by
  simpa only [values0169_size] using segment_domain 297 values0169

theorem block0169_get (i : Fin 32) :
    block0169 (297 + i.val) = some (values0169[i.val]'(by rw [values0169_size]; exact i.isLt)) := by
  exact segment_get 297 values0169 ⟨i.val, by rw [values0169_size]; exact i.isLt⟩

def values0170 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0170.coefficient10_329,
  OriginalRow227TriangleData0170.coefficient10_330,
  OriginalRow227TriangleData0170.coefficient10_331,
  OriginalRow227TriangleData0170.coefficient10_332,
  OriginalRow227TriangleData0170.coefficient10_333,
  OriginalRow227TriangleData0170.coefficient10_334,
  OriginalRow227TriangleData0170.coefficient10_335,
  OriginalRow227TriangleData0170.coefficient10_336,
  OriginalRow227TriangleData0170.coefficient10_337,
  OriginalRow227TriangleData0170.coefficient10_338,
  OriginalRow227TriangleData0170.coefficient10_339,
  OriginalRow227TriangleData0170.coefficient10_340,
  OriginalRow227TriangleData0170.coefficient10_341,
  OriginalRow227TriangleData0170.coefficient10_342,
  OriginalRow227TriangleData0170.coefficient10_343,
  OriginalRow227TriangleData0170.coefficient10_344,
  OriginalRow227TriangleData0170.coefficient10_345,
  OriginalRow227TriangleData0170.coefficient10_346,
  OriginalRow227TriangleData0170.coefficient10_347,
  OriginalRow227TriangleData0170.coefficient10_348,
  OriginalRow227TriangleData0170.coefficient10_349,
  OriginalRow227TriangleData0170.coefficient10_350,
  OriginalRow227TriangleData0170.coefficient10_351,
  OriginalRow227TriangleData0170.coefficient10_352,
  OriginalRow227TriangleData0170.coefficient10_353,
  OriginalRow227TriangleData0170.coefficient10_354,
  OriginalRow227TriangleData0170.coefficient10_355,
  OriginalRow227TriangleData0170.coefficient10_356,
  OriginalRow227TriangleData0170.coefficient10_357,
  OriginalRow227TriangleData0170.coefficient10_358,
  OriginalRow227TriangleData0170.coefficient10_359,
  OriginalRow227TriangleData0170.coefficient10_360
]

theorem values0170_size : values0170.size = 32 := rfl

def block0170 : ℕ → Option IntervalDyadic := segment 329 values0170

theorem block0170_domain : ExactDomain block0170 329 361 := by
  simpa only [values0170_size] using segment_domain 329 values0170

theorem block0170_get (i : Fin 32) :
    block0170 (329 + i.val) = some (values0170[i.val]'(by rw [values0170_size]; exact i.isLt)) := by
  exact segment_get 329 values0170 ⟨i.val, by rw [values0170_size]; exact i.isLt⟩

def values0171 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0171.coefficient10_361,
  OriginalRow227TriangleData0171.coefficient10_362,
  OriginalRow227TriangleData0171.coefficient10_363,
  OriginalRow227TriangleData0171.coefficient10_364,
  OriginalRow227TriangleData0171.coefficient10_365,
  OriginalRow227TriangleData0171.coefficient10_366,
  OriginalRow227TriangleData0171.coefficient10_367,
  OriginalRow227TriangleData0171.coefficient10_368,
  OriginalRow227TriangleData0171.coefficient10_369,
  OriginalRow227TriangleData0171.coefficient10_370,
  OriginalRow227TriangleData0171.coefficient10_371,
  OriginalRow227TriangleData0171.coefficient10_372,
  OriginalRow227TriangleData0171.coefficient10_373,
  OriginalRow227TriangleData0171.coefficient10_374,
  OriginalRow227TriangleData0171.coefficient10_375,
  OriginalRow227TriangleData0171.coefficient10_376,
  OriginalRow227TriangleData0171.coefficient10_377,
  OriginalRow227TriangleData0171.coefficient10_378,
  OriginalRow227TriangleData0171.coefficient10_379,
  OriginalRow227TriangleData0171.coefficient10_380,
  OriginalRow227TriangleData0171.coefficient10_381,
  OriginalRow227TriangleData0171.coefficient10_382,
  OriginalRow227TriangleData0171.coefficient10_383,
  OriginalRow227TriangleData0171.coefficient10_384,
  OriginalRow227TriangleData0171.coefficient10_385,
  OriginalRow227TriangleData0171.coefficient10_386,
  OriginalRow227TriangleData0171.coefficient10_387,
  OriginalRow227TriangleData0171.coefficient10_388,
  OriginalRow227TriangleData0171.coefficient10_389,
  OriginalRow227TriangleData0171.coefficient10_390,
  OriginalRow227TriangleData0171.coefficient10_391,
  OriginalRow227TriangleData0171.coefficient10_392
]

theorem values0171_size : values0171.size = 32 := rfl

def block0171 : ℕ → Option IntervalDyadic := segment 361 values0171

theorem block0171_domain : ExactDomain block0171 361 393 := by
  simpa only [values0171_size] using segment_domain 361 values0171

theorem block0171_get (i : Fin 32) :
    block0171 (361 + i.val) = some (values0171[i.val]'(by rw [values0171_size]; exact i.isLt)) := by
  exact segment_get 361 values0171 ⟨i.val, by rw [values0171_size]; exact i.isLt⟩

def values0172 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0172.coefficient10_393,
  OriginalRow227TriangleData0172.coefficient10_394,
  OriginalRow227TriangleData0172.coefficient10_395,
  OriginalRow227TriangleData0172.coefficient10_396,
  OriginalRow227TriangleData0172.coefficient10_397,
  OriginalRow227TriangleData0172.coefficient10_398,
  OriginalRow227TriangleData0172.coefficient10_399,
  OriginalRow227TriangleData0172.coefficient10_400,
  OriginalRow227TriangleData0172.coefficient10_401,
  OriginalRow227TriangleData0172.coefficient10_402,
  OriginalRow227TriangleData0172.coefficient10_403,
  OriginalRow227TriangleData0172.coefficient10_404,
  OriginalRow227TriangleData0172.coefficient10_405,
  OriginalRow227TriangleData0172.coefficient10_406,
  OriginalRow227TriangleData0172.coefficient10_407,
  OriginalRow227TriangleData0172.coefficient10_408,
  OriginalRow227TriangleData0172.coefficient10_409,
  OriginalRow227TriangleData0172.coefficient10_410,
  OriginalRow227TriangleData0172.coefficient10_411,
  OriginalRow227TriangleData0172.coefficient10_412,
  OriginalRow227TriangleData0172.coefficient10_413,
  OriginalRow227TriangleData0172.coefficient10_414,
  OriginalRow227TriangleData0172.coefficient10_415,
  OriginalRow227TriangleData0172.coefficient10_416,
  OriginalRow227TriangleData0172.coefficient10_417,
  OriginalRow227TriangleData0172.coefficient10_418,
  OriginalRow227TriangleData0172.coefficient10_419,
  OriginalRow227TriangleData0172.coefficient10_420,
  OriginalRow227TriangleData0172.coefficient10_421,
  OriginalRow227TriangleData0172.coefficient10_422,
  OriginalRow227TriangleData0172.coefficient10_423,
  OriginalRow227TriangleData0172.coefficient10_424
]

theorem values0172_size : values0172.size = 32 := rfl

def block0172 : ℕ → Option IntervalDyadic := segment 393 values0172

theorem block0172_domain : ExactDomain block0172 393 425 := by
  simpa only [values0172_size] using segment_domain 393 values0172

theorem block0172_get (i : Fin 32) :
    block0172 (393 + i.val) = some (values0172[i.val]'(by rw [values0172_size]; exact i.isLt)) := by
  exact segment_get 393 values0172 ⟨i.val, by rw [values0172_size]; exact i.isLt⟩

def values0173 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0173.coefficient10_425,
  OriginalRow227TriangleData0173.coefficient10_426,
  OriginalRow227TriangleData0173.coefficient10_427,
  OriginalRow227TriangleData0173.coefficient10_428,
  OriginalRow227TriangleData0173.coefficient10_429,
  OriginalRow227TriangleData0173.coefficient10_430,
  OriginalRow227TriangleData0173.coefficient10_431,
  OriginalRow227TriangleData0173.coefficient10_432,
  OriginalRow227TriangleData0173.coefficient10_433,
  OriginalRow227TriangleData0173.coefficient10_434,
  OriginalRow227TriangleData0173.coefficient10_435,
  OriginalRow227TriangleData0173.coefficient10_436,
  OriginalRow227TriangleData0173.coefficient10_437,
  OriginalRow227TriangleData0173.coefficient10_438,
  OriginalRow227TriangleData0173.coefficient10_439,
  OriginalRow227TriangleData0173.coefficient10_440,
  OriginalRow227TriangleData0173.coefficient10_441,
  OriginalRow227TriangleData0173.coefficient10_442,
  OriginalRow227TriangleData0173.coefficient10_443,
  OriginalRow227TriangleData0173.coefficient10_444,
  OriginalRow227TriangleData0173.coefficient10_445,
  OriginalRow227TriangleData0173.coefficient10_446,
  OriginalRow227TriangleData0173.coefficient10_447,
  OriginalRow227TriangleData0173.coefficient10_448,
  OriginalRow227TriangleData0173.coefficient10_449,
  OriginalRow227TriangleData0173.coefficient10_450,
  OriginalRow227TriangleData0173.coefficient10_451,
  OriginalRow227TriangleData0173.coefficient10_452,
  OriginalRow227TriangleData0173.coefficient10_453,
  OriginalRow227TriangleData0173.coefficient10_454,
  OriginalRow227TriangleData0173.coefficient10_455,
  OriginalRow227TriangleData0173.coefficient10_456
]

theorem values0173_size : values0173.size = 32 := rfl

def block0173 : ℕ → Option IntervalDyadic := segment 425 values0173

theorem block0173_domain : ExactDomain block0173 425 457 := by
  simpa only [values0173_size] using segment_domain 425 values0173

theorem block0173_get (i : Fin 32) :
    block0173 (425 + i.val) = some (values0173[i.val]'(by rw [values0173_size]; exact i.isLt)) := by
  exact segment_get 425 values0173 ⟨i.val, by rw [values0173_size]; exact i.isLt⟩

def values0174 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0174.coefficient10_457,
  OriginalRow227TriangleData0174.coefficient10_458,
  OriginalRow227TriangleData0174.coefficient10_459,
  OriginalRow227TriangleData0174.coefficient10_460,
  OriginalRow227TriangleData0174.coefficient10_461,
  OriginalRow227TriangleData0174.coefficient10_462,
  OriginalRow227TriangleData0174.coefficient10_463,
  OriginalRow227TriangleData0174.coefficient10_464,
  OriginalRow227TriangleData0174.coefficient10_465,
  OriginalRow227TriangleData0174.coefficient10_466,
  OriginalRow227TriangleData0174.coefficient10_467,
  OriginalRow227TriangleData0174.coefficient10_468,
  OriginalRow227TriangleData0174.coefficient10_469,
  OriginalRow227TriangleData0174.coefficient10_470,
  OriginalRow227TriangleData0174.coefficient10_471,
  OriginalRow227TriangleData0174.coefficient10_472,
  OriginalRow227TriangleData0174.coefficient10_473,
  OriginalRow227TriangleData0174.coefficient10_474,
  OriginalRow227TriangleData0174.coefficient10_475,
  OriginalRow227TriangleData0174.coefficient10_476,
  OriginalRow227TriangleData0174.coefficient10_477,
  OriginalRow227TriangleData0174.coefficient10_478,
  OriginalRow227TriangleData0174.coefficient10_479,
  OriginalRow227TriangleData0174.coefficient10_480,
  OriginalRow227TriangleData0174.coefficient10_481,
  OriginalRow227TriangleData0174.coefficient10_482,
  OriginalRow227TriangleData0174.coefficient10_483,
  OriginalRow227TriangleData0174.coefficient10_484,
  OriginalRow227TriangleData0174.coefficient10_485,
  OriginalRow227TriangleData0174.coefficient10_486,
  OriginalRow227TriangleData0174.coefficient10_487,
  OriginalRow227TriangleData0174.coefficient10_488
]

theorem values0174_size : values0174.size = 32 := rfl

def block0174 : ℕ → Option IntervalDyadic := segment 457 values0174

theorem block0174_domain : ExactDomain block0174 457 489 := by
  simpa only [values0174_size] using segment_domain 457 values0174

theorem block0174_get (i : Fin 32) :
    block0174 (457 + i.val) = some (values0174[i.val]'(by rw [values0174_size]; exact i.isLt)) := by
  exact segment_get 457 values0174 ⟨i.val, by rw [values0174_size]; exact i.isLt⟩

def values0175 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0175.coefficient10_489,
  OriginalRow227TriangleData0175.coefficient10_490,
  OriginalRow227TriangleData0175.coefficient10_491
]

theorem values0175_size : values0175.size = 3 := rfl

def block0175 : ℕ → Option IntervalDyadic := segment 489 values0175

theorem block0175_domain : ExactDomain block0175 489 492 := by
  simpa only [values0175_size] using segment_domain 489 values0175

theorem block0175_get (i : Fin 3) :
    block0175 (489 + i.val) = some (values0175[i.val]'(by rw [values0175_size]; exact i.isLt)) := by
  exact segment_get 489 values0175 ⟨i.val, by rw [values0175_size]; exact i.isLt⟩

def node0009_0073 : ℕ → Option IntervalDyadic := split 41 block0160 block0161

theorem node0009_0073_domain : ExactDomain node0009_0073 9 73 := by
  exact split_domain (by decide) (by decide) block0160_domain block0161_domain

def node0073_0137 : ℕ → Option IntervalDyadic := split 105 block0162 block0163

theorem node0073_0137_domain : ExactDomain node0073_0137 73 137 := by
  exact split_domain (by decide) (by decide) block0162_domain block0163_domain

def node0009_0137 : ℕ → Option IntervalDyadic := split 73 node0009_0073 node0073_0137

theorem node0009_0137_domain : ExactDomain node0009_0137 9 137 := by
  exact split_domain (by decide) (by decide) node0009_0073_domain node0073_0137_domain

def node0137_0201 : ℕ → Option IntervalDyadic := split 169 block0164 block0165

theorem node0137_0201_domain : ExactDomain node0137_0201 137 201 := by
  exact split_domain (by decide) (by decide) block0164_domain block0165_domain

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block0166 block0167

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block0166_domain block0167_domain

def node0137_0265 : ℕ → Option IntervalDyadic := split 201 node0137_0201 node0201_0265

theorem node0137_0265_domain : ExactDomain node0137_0265 137 265 := by
  exact split_domain (by decide) (by decide) node0137_0201_domain node0201_0265_domain

def node0009_0265 : ℕ → Option IntervalDyadic := split 137 node0009_0137 node0137_0265

theorem node0009_0265_domain : ExactDomain node0009_0265 9 265 := by
  exact split_domain (by decide) (by decide) node0009_0137_domain node0137_0265_domain

def node0265_0329 : ℕ → Option IntervalDyadic := split 297 block0168 block0169

theorem node0265_0329_domain : ExactDomain node0265_0329 265 329 := by
  exact split_domain (by decide) (by decide) block0168_domain block0169_domain

def node0329_0393 : ℕ → Option IntervalDyadic := split 361 block0170 block0171

theorem node0329_0393_domain : ExactDomain node0329_0393 329 393 := by
  exact split_domain (by decide) (by decide) block0170_domain block0171_domain

def node0265_0393 : ℕ → Option IntervalDyadic := split 329 node0265_0329 node0329_0393

theorem node0265_0393_domain : ExactDomain node0265_0393 265 393 := by
  exact split_domain (by decide) (by decide) node0265_0329_domain node0329_0393_domain

def node0393_0457 : ℕ → Option IntervalDyadic := split 425 block0172 block0173

theorem node0393_0457_domain : ExactDomain node0393_0457 393 457 := by
  exact split_domain (by decide) (by decide) block0172_domain block0173_domain

def node0457_0492 : ℕ → Option IntervalDyadic := split 489 block0174 block0175

theorem node0457_0492_domain : ExactDomain node0457_0492 457 492 := by
  exact split_domain (by decide) (by decide) block0174_domain block0175_domain

def node0393_0492 : ℕ → Option IntervalDyadic := split 457 node0393_0457 node0457_0492

theorem node0393_0492_domain : ExactDomain node0393_0492 393 492 := by
  exact split_domain (by decide) (by decide) node0393_0457_domain node0457_0492_domain

def node0265_0492 : ℕ → Option IntervalDyadic := split 393 node0265_0393 node0393_0492

theorem node0265_0492_domain : ExactDomain node0265_0492 265 492 := by
  exact split_domain (by decide) (by decide) node0265_0393_domain node0393_0492_domain

def node0009_0492 : ℕ → Option IntervalDyadic := split 265 node0009_0265 node0265_0492

theorem node0009_0492_domain : ExactDomain node0009_0492 9 492 := by
  exact split_domain (by decide) (by decide) node0009_0265_domain node0265_0492_domain

def lookup : ℕ → Option IntervalDyadic := node0009_0492

theorem lookup_domain : ExactDomain lookup 9 492 :=
  node0009_0492_domain

theorem block0160_lookup (i : Fin 32) :
    lookup (9 + i.val) = some (values0160[i.val]'(by rw [values0160_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (9 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_left 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0009_0137, split_left 73 node0009_0073 node0073_0137 (by omega)]
  rw [node0009_0073, split_left 41 block0160 block0161 (by omega)]
  exact block0160_get i

theorem block0161_lookup (i : Fin 32) :
    lookup (41 + i.val) = some (values0161[i.val]'(by rw [values0161_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (41 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_left 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0009_0137, split_left 73 node0009_0073 node0073_0137 (by omega)]
  rw [node0009_0073, split_right 41 block0160 block0161 (by omega)]
  exact block0161_get i

theorem block0162_lookup (i : Fin 32) :
    lookup (73 + i.val) = some (values0162[i.val]'(by rw [values0162_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (73 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_left 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0009_0137, split_right 73 node0009_0073 node0073_0137 (by omega)]
  rw [node0073_0137, split_left 105 block0162 block0163 (by omega)]
  exact block0162_get i

theorem block0163_lookup (i : Fin 32) :
    lookup (105 + i.val) = some (values0163[i.val]'(by rw [values0163_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (105 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_left 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0009_0137, split_right 73 node0009_0073 node0073_0137 (by omega)]
  rw [node0073_0137, split_right 105 block0162 block0163 (by omega)]
  exact block0163_get i

theorem block0164_lookup (i : Fin 32) :
    lookup (137 + i.val) = some (values0164[i.val]'(by rw [values0164_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (137 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_right 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_left 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0137_0201, split_left 169 block0164 block0165 (by omega)]
  exact block0164_get i

theorem block0165_lookup (i : Fin 32) :
    lookup (169 + i.val) = some (values0165[i.val]'(by rw [values0165_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (169 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_right 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_left 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0137_0201, split_right 169 block0164 block0165 (by omega)]
  exact block0165_get i

theorem block0166_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values0166[i.val]'(by rw [values0166_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (201 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_right 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_right 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0201_0265, split_left 233 block0166 block0167 (by omega)]
  exact block0166_get i

theorem block0167_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values0167[i.val]'(by rw [values0167_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (233 + i.val) = _
  rw [node0009_0492, split_left 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0009_0265, split_right 137 node0009_0137 node0137_0265 (by omega)]
  rw [node0137_0265, split_right 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0201_0265, split_right 233 block0166 block0167 (by omega)]
  exact block0167_get i

theorem block0168_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values0168[i.val]'(by rw [values0168_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (265 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_left 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0265_0393, split_left 329 node0265_0329 node0329_0393 (by omega)]
  rw [node0265_0329, split_left 297 block0168 block0169 (by omega)]
  exact block0168_get i

theorem block0169_lookup (i : Fin 32) :
    lookup (297 + i.val) = some (values0169[i.val]'(by rw [values0169_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (297 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_left 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0265_0393, split_left 329 node0265_0329 node0329_0393 (by omega)]
  rw [node0265_0329, split_right 297 block0168 block0169 (by omega)]
  exact block0169_get i

theorem block0170_lookup (i : Fin 32) :
    lookup (329 + i.val) = some (values0170[i.val]'(by rw [values0170_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (329 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_left 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0265_0393, split_right 329 node0265_0329 node0329_0393 (by omega)]
  rw [node0329_0393, split_left 361 block0170 block0171 (by omega)]
  exact block0170_get i

theorem block0171_lookup (i : Fin 32) :
    lookup (361 + i.val) = some (values0171[i.val]'(by rw [values0171_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (361 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_left 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0265_0393, split_right 329 node0265_0329 node0329_0393 (by omega)]
  rw [node0329_0393, split_right 361 block0170 block0171 (by omega)]
  exact block0171_get i

theorem block0172_lookup (i : Fin 32) :
    lookup (393 + i.val) = some (values0172[i.val]'(by rw [values0172_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (393 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_right 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0393_0492, split_left 457 node0393_0457 node0457_0492 (by omega)]
  rw [node0393_0457, split_left 425 block0172 block0173 (by omega)]
  exact block0172_get i

theorem block0173_lookup (i : Fin 32) :
    lookup (425 + i.val) = some (values0173[i.val]'(by rw [values0173_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (425 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_right 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0393_0492, split_left 457 node0393_0457 node0457_0492 (by omega)]
  rw [node0393_0457, split_right 425 block0172 block0173 (by omega)]
  exact block0173_get i

theorem block0174_lookup (i : Fin 32) :
    lookup (457 + i.val) = some (values0174[i.val]'(by rw [values0174_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (457 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_right 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0393_0492, split_right 457 node0393_0457 node0457_0492 (by omega)]
  rw [node0457_0492, split_left 489 block0174 block0175 (by omega)]
  exact block0174_get i

theorem block0175_lookup (i : Fin 3) :
    lookup (489 + i.val) = some (values0175[i.val]'(by rw [values0175_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0009_0492 (489 + i.val) = _
  rw [node0009_0492, split_right 265 node0009_0265 node0265_0492 (by omega)]
  rw [node0265_0492, split_right 393 node0265_0393 node0393_0492 (by omega)]
  rw [node0393_0492, split_right 457 node0393_0457 node0457_0492 (by omega)]
  rw [node0457_0492, split_right 489 block0174 block0175 (by omega)]
  exact block0175_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0160_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0160_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0161_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0161_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0162_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0162_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0163_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0163_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0164_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0164_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0165_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0165_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0166_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0166_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0167_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0167_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0168_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0168_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0169_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0169_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0170_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0170_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0171_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0171_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0172_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0172_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0173_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0173_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0174_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0174_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0175_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0175_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0160_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0161_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0162_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0163_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0164_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0165_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0166_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0167_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0168_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0169_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0170_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0171_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0172_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0173_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0174_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow010.block0175_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow010
