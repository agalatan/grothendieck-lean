import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0544
import Grothe.UpperChaos.OriginalRow227TriangleData0545
import Grothe.UpperChaos.OriginalRow227TriangleData0546
import Grothe.UpperChaos.OriginalRow227TriangleData0547
import Grothe.UpperChaos.OriginalRow227TriangleData0548
import Grothe.UpperChaos.OriginalRow227TriangleData0549
import Grothe.UpperChaos.OriginalRow227TriangleData0550
import Grothe.UpperChaos.OriginalRow227TriangleData0551
import Grothe.UpperChaos.OriginalRow227TriangleData0552
import Grothe.UpperChaos.OriginalRow227TriangleData0553
import Grothe.UpperChaos.OriginalRow227TriangleData0554
import Grothe.UpperChaos.OriginalRow227TriangleData0555
import Grothe.UpperChaos.OriginalRow227TriangleData0556
import Grothe.UpperChaos.OriginalRow227TriangleData0557

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow036

open ConditionalTableLookup

def values0544 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0544.coefficient36_35,
  OriginalRow227TriangleData0544.coefficient36_36,
  OriginalRow227TriangleData0544.coefficient36_37,
  OriginalRow227TriangleData0544.coefficient36_38,
  OriginalRow227TriangleData0544.coefficient36_39,
  OriginalRow227TriangleData0544.coefficient36_40,
  OriginalRow227TriangleData0544.coefficient36_41,
  OriginalRow227TriangleData0544.coefficient36_42,
  OriginalRow227TriangleData0544.coefficient36_43,
  OriginalRow227TriangleData0544.coefficient36_44,
  OriginalRow227TriangleData0544.coefficient36_45,
  OriginalRow227TriangleData0544.coefficient36_46,
  OriginalRow227TriangleData0544.coefficient36_47,
  OriginalRow227TriangleData0544.coefficient36_48,
  OriginalRow227TriangleData0544.coefficient36_49,
  OriginalRow227TriangleData0544.coefficient36_50,
  OriginalRow227TriangleData0544.coefficient36_51,
  OriginalRow227TriangleData0544.coefficient36_52,
  OriginalRow227TriangleData0544.coefficient36_53,
  OriginalRow227TriangleData0544.coefficient36_54,
  OriginalRow227TriangleData0544.coefficient36_55,
  OriginalRow227TriangleData0544.coefficient36_56,
  OriginalRow227TriangleData0544.coefficient36_57,
  OriginalRow227TriangleData0544.coefficient36_58,
  OriginalRow227TriangleData0544.coefficient36_59,
  OriginalRow227TriangleData0544.coefficient36_60,
  OriginalRow227TriangleData0544.coefficient36_61,
  OriginalRow227TriangleData0544.coefficient36_62,
  OriginalRow227TriangleData0544.coefficient36_63,
  OriginalRow227TriangleData0544.coefficient36_64,
  OriginalRow227TriangleData0544.coefficient36_65,
  OriginalRow227TriangleData0544.coefficient36_66
]

theorem values0544_size : values0544.size = 32 := rfl

def block0544 : ℕ → Option IntervalDyadic := segment 35 values0544

theorem block0544_domain : ExactDomain block0544 35 67 := by
  simpa only [values0544_size] using segment_domain 35 values0544

theorem block0544_get (i : Fin 32) :
    block0544 (35 + i.val) = some (values0544[i.val]'(by rw [values0544_size]; exact i.isLt)) := by
  exact segment_get 35 values0544 ⟨i.val, by rw [values0544_size]; exact i.isLt⟩

def values0545 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0545.coefficient36_67,
  OriginalRow227TriangleData0545.coefficient36_68,
  OriginalRow227TriangleData0545.coefficient36_69,
  OriginalRow227TriangleData0545.coefficient36_70,
  OriginalRow227TriangleData0545.coefficient36_71,
  OriginalRow227TriangleData0545.coefficient36_72,
  OriginalRow227TriangleData0545.coefficient36_73,
  OriginalRow227TriangleData0545.coefficient36_74,
  OriginalRow227TriangleData0545.coefficient36_75,
  OriginalRow227TriangleData0545.coefficient36_76,
  OriginalRow227TriangleData0545.coefficient36_77,
  OriginalRow227TriangleData0545.coefficient36_78,
  OriginalRow227TriangleData0545.coefficient36_79,
  OriginalRow227TriangleData0545.coefficient36_80,
  OriginalRow227TriangleData0545.coefficient36_81,
  OriginalRow227TriangleData0545.coefficient36_82,
  OriginalRow227TriangleData0545.coefficient36_83,
  OriginalRow227TriangleData0545.coefficient36_84,
  OriginalRow227TriangleData0545.coefficient36_85,
  OriginalRow227TriangleData0545.coefficient36_86,
  OriginalRow227TriangleData0545.coefficient36_87,
  OriginalRow227TriangleData0545.coefficient36_88,
  OriginalRow227TriangleData0545.coefficient36_89,
  OriginalRow227TriangleData0545.coefficient36_90,
  OriginalRow227TriangleData0545.coefficient36_91,
  OriginalRow227TriangleData0545.coefficient36_92,
  OriginalRow227TriangleData0545.coefficient36_93,
  OriginalRow227TriangleData0545.coefficient36_94,
  OriginalRow227TriangleData0545.coefficient36_95,
  OriginalRow227TriangleData0545.coefficient36_96,
  OriginalRow227TriangleData0545.coefficient36_97,
  OriginalRow227TriangleData0545.coefficient36_98
]

theorem values0545_size : values0545.size = 32 := rfl

def block0545 : ℕ → Option IntervalDyadic := segment 67 values0545

theorem block0545_domain : ExactDomain block0545 67 99 := by
  simpa only [values0545_size] using segment_domain 67 values0545

theorem block0545_get (i : Fin 32) :
    block0545 (67 + i.val) = some (values0545[i.val]'(by rw [values0545_size]; exact i.isLt)) := by
  exact segment_get 67 values0545 ⟨i.val, by rw [values0545_size]; exact i.isLt⟩

def values0546 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0546.coefficient36_99,
  OriginalRow227TriangleData0546.coefficient36_100,
  OriginalRow227TriangleData0546.coefficient36_101,
  OriginalRow227TriangleData0546.coefficient36_102,
  OriginalRow227TriangleData0546.coefficient36_103,
  OriginalRow227TriangleData0546.coefficient36_104,
  OriginalRow227TriangleData0546.coefficient36_105,
  OriginalRow227TriangleData0546.coefficient36_106,
  OriginalRow227TriangleData0546.coefficient36_107,
  OriginalRow227TriangleData0546.coefficient36_108,
  OriginalRow227TriangleData0546.coefficient36_109,
  OriginalRow227TriangleData0546.coefficient36_110,
  OriginalRow227TriangleData0546.coefficient36_111,
  OriginalRow227TriangleData0546.coefficient36_112,
  OriginalRow227TriangleData0546.coefficient36_113,
  OriginalRow227TriangleData0546.coefficient36_114,
  OriginalRow227TriangleData0546.coefficient36_115,
  OriginalRow227TriangleData0546.coefficient36_116,
  OriginalRow227TriangleData0546.coefficient36_117,
  OriginalRow227TriangleData0546.coefficient36_118,
  OriginalRow227TriangleData0546.coefficient36_119,
  OriginalRow227TriangleData0546.coefficient36_120,
  OriginalRow227TriangleData0546.coefficient36_121,
  OriginalRow227TriangleData0546.coefficient36_122,
  OriginalRow227TriangleData0546.coefficient36_123,
  OriginalRow227TriangleData0546.coefficient36_124,
  OriginalRow227TriangleData0546.coefficient36_125,
  OriginalRow227TriangleData0546.coefficient36_126,
  OriginalRow227TriangleData0546.coefficient36_127,
  OriginalRow227TriangleData0546.coefficient36_128,
  OriginalRow227TriangleData0546.coefficient36_129,
  OriginalRow227TriangleData0546.coefficient36_130
]

theorem values0546_size : values0546.size = 32 := rfl

def block0546 : ℕ → Option IntervalDyadic := segment 99 values0546

theorem block0546_domain : ExactDomain block0546 99 131 := by
  simpa only [values0546_size] using segment_domain 99 values0546

theorem block0546_get (i : Fin 32) :
    block0546 (99 + i.val) = some (values0546[i.val]'(by rw [values0546_size]; exact i.isLt)) := by
  exact segment_get 99 values0546 ⟨i.val, by rw [values0546_size]; exact i.isLt⟩

def values0547 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0547.coefficient36_131,
  OriginalRow227TriangleData0547.coefficient36_132,
  OriginalRow227TriangleData0547.coefficient36_133,
  OriginalRow227TriangleData0547.coefficient36_134,
  OriginalRow227TriangleData0547.coefficient36_135,
  OriginalRow227TriangleData0547.coefficient36_136,
  OriginalRow227TriangleData0547.coefficient36_137,
  OriginalRow227TriangleData0547.coefficient36_138,
  OriginalRow227TriangleData0547.coefficient36_139,
  OriginalRow227TriangleData0547.coefficient36_140,
  OriginalRow227TriangleData0547.coefficient36_141,
  OriginalRow227TriangleData0547.coefficient36_142,
  OriginalRow227TriangleData0547.coefficient36_143,
  OriginalRow227TriangleData0547.coefficient36_144,
  OriginalRow227TriangleData0547.coefficient36_145,
  OriginalRow227TriangleData0547.coefficient36_146,
  OriginalRow227TriangleData0547.coefficient36_147,
  OriginalRow227TriangleData0547.coefficient36_148,
  OriginalRow227TriangleData0547.coefficient36_149,
  OriginalRow227TriangleData0547.coefficient36_150,
  OriginalRow227TriangleData0547.coefficient36_151,
  OriginalRow227TriangleData0547.coefficient36_152,
  OriginalRow227TriangleData0547.coefficient36_153,
  OriginalRow227TriangleData0547.coefficient36_154,
  OriginalRow227TriangleData0547.coefficient36_155,
  OriginalRow227TriangleData0547.coefficient36_156,
  OriginalRow227TriangleData0547.coefficient36_157,
  OriginalRow227TriangleData0547.coefficient36_158,
  OriginalRow227TriangleData0547.coefficient36_159,
  OriginalRow227TriangleData0547.coefficient36_160,
  OriginalRow227TriangleData0547.coefficient36_161,
  OriginalRow227TriangleData0547.coefficient36_162
]

theorem values0547_size : values0547.size = 32 := rfl

def block0547 : ℕ → Option IntervalDyadic := segment 131 values0547

theorem block0547_domain : ExactDomain block0547 131 163 := by
  simpa only [values0547_size] using segment_domain 131 values0547

theorem block0547_get (i : Fin 32) :
    block0547 (131 + i.val) = some (values0547[i.val]'(by rw [values0547_size]; exact i.isLt)) := by
  exact segment_get 131 values0547 ⟨i.val, by rw [values0547_size]; exact i.isLt⟩

def values0548 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0548.coefficient36_163,
  OriginalRow227TriangleData0548.coefficient36_164,
  OriginalRow227TriangleData0548.coefficient36_165,
  OriginalRow227TriangleData0548.coefficient36_166,
  OriginalRow227TriangleData0548.coefficient36_167,
  OriginalRow227TriangleData0548.coefficient36_168,
  OriginalRow227TriangleData0548.coefficient36_169,
  OriginalRow227TriangleData0548.coefficient36_170,
  OriginalRow227TriangleData0548.coefficient36_171,
  OriginalRow227TriangleData0548.coefficient36_172,
  OriginalRow227TriangleData0548.coefficient36_173,
  OriginalRow227TriangleData0548.coefficient36_174,
  OriginalRow227TriangleData0548.coefficient36_175,
  OriginalRow227TriangleData0548.coefficient36_176,
  OriginalRow227TriangleData0548.coefficient36_177,
  OriginalRow227TriangleData0548.coefficient36_178,
  OriginalRow227TriangleData0548.coefficient36_179,
  OriginalRow227TriangleData0548.coefficient36_180,
  OriginalRow227TriangleData0548.coefficient36_181,
  OriginalRow227TriangleData0548.coefficient36_182,
  OriginalRow227TriangleData0548.coefficient36_183,
  OriginalRow227TriangleData0548.coefficient36_184,
  OriginalRow227TriangleData0548.coefficient36_185,
  OriginalRow227TriangleData0548.coefficient36_186,
  OriginalRow227TriangleData0548.coefficient36_187,
  OriginalRow227TriangleData0548.coefficient36_188,
  OriginalRow227TriangleData0548.coefficient36_189,
  OriginalRow227TriangleData0548.coefficient36_190,
  OriginalRow227TriangleData0548.coefficient36_191,
  OriginalRow227TriangleData0548.coefficient36_192,
  OriginalRow227TriangleData0548.coefficient36_193,
  OriginalRow227TriangleData0548.coefficient36_194
]

theorem values0548_size : values0548.size = 32 := rfl

def block0548 : ℕ → Option IntervalDyadic := segment 163 values0548

theorem block0548_domain : ExactDomain block0548 163 195 := by
  simpa only [values0548_size] using segment_domain 163 values0548

theorem block0548_get (i : Fin 32) :
    block0548 (163 + i.val) = some (values0548[i.val]'(by rw [values0548_size]; exact i.isLt)) := by
  exact segment_get 163 values0548 ⟨i.val, by rw [values0548_size]; exact i.isLt⟩

def values0549 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0549.coefficient36_195,
  OriginalRow227TriangleData0549.coefficient36_196,
  OriginalRow227TriangleData0549.coefficient36_197,
  OriginalRow227TriangleData0549.coefficient36_198,
  OriginalRow227TriangleData0549.coefficient36_199,
  OriginalRow227TriangleData0549.coefficient36_200,
  OriginalRow227TriangleData0549.coefficient36_201,
  OriginalRow227TriangleData0549.coefficient36_202,
  OriginalRow227TriangleData0549.coefficient36_203,
  OriginalRow227TriangleData0549.coefficient36_204,
  OriginalRow227TriangleData0549.coefficient36_205,
  OriginalRow227TriangleData0549.coefficient36_206,
  OriginalRow227TriangleData0549.coefficient36_207,
  OriginalRow227TriangleData0549.coefficient36_208,
  OriginalRow227TriangleData0549.coefficient36_209,
  OriginalRow227TriangleData0549.coefficient36_210,
  OriginalRow227TriangleData0549.coefficient36_211,
  OriginalRow227TriangleData0549.coefficient36_212,
  OriginalRow227TriangleData0549.coefficient36_213,
  OriginalRow227TriangleData0549.coefficient36_214,
  OriginalRow227TriangleData0549.coefficient36_215,
  OriginalRow227TriangleData0549.coefficient36_216,
  OriginalRow227TriangleData0549.coefficient36_217,
  OriginalRow227TriangleData0549.coefficient36_218,
  OriginalRow227TriangleData0549.coefficient36_219,
  OriginalRow227TriangleData0549.coefficient36_220,
  OriginalRow227TriangleData0549.coefficient36_221,
  OriginalRow227TriangleData0549.coefficient36_222,
  OriginalRow227TriangleData0549.coefficient36_223,
  OriginalRow227TriangleData0549.coefficient36_224,
  OriginalRow227TriangleData0549.coefficient36_225,
  OriginalRow227TriangleData0549.coefficient36_226
]

theorem values0549_size : values0549.size = 32 := rfl

def block0549 : ℕ → Option IntervalDyadic := segment 195 values0549

theorem block0549_domain : ExactDomain block0549 195 227 := by
  simpa only [values0549_size] using segment_domain 195 values0549

theorem block0549_get (i : Fin 32) :
    block0549 (195 + i.val) = some (values0549[i.val]'(by rw [values0549_size]; exact i.isLt)) := by
  exact segment_get 195 values0549 ⟨i.val, by rw [values0549_size]; exact i.isLt⟩

def values0550 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0550.coefficient36_227,
  OriginalRow227TriangleData0550.coefficient36_228,
  OriginalRow227TriangleData0550.coefficient36_229,
  OriginalRow227TriangleData0550.coefficient36_230,
  OriginalRow227TriangleData0550.coefficient36_231,
  OriginalRow227TriangleData0550.coefficient36_232,
  OriginalRow227TriangleData0550.coefficient36_233,
  OriginalRow227TriangleData0550.coefficient36_234,
  OriginalRow227TriangleData0550.coefficient36_235,
  OriginalRow227TriangleData0550.coefficient36_236,
  OriginalRow227TriangleData0550.coefficient36_237,
  OriginalRow227TriangleData0550.coefficient36_238,
  OriginalRow227TriangleData0550.coefficient36_239,
  OriginalRow227TriangleData0550.coefficient36_240,
  OriginalRow227TriangleData0550.coefficient36_241,
  OriginalRow227TriangleData0550.coefficient36_242,
  OriginalRow227TriangleData0550.coefficient36_243,
  OriginalRow227TriangleData0550.coefficient36_244,
  OriginalRow227TriangleData0550.coefficient36_245,
  OriginalRow227TriangleData0550.coefficient36_246,
  OriginalRow227TriangleData0550.coefficient36_247,
  OriginalRow227TriangleData0550.coefficient36_248,
  OriginalRow227TriangleData0550.coefficient36_249,
  OriginalRow227TriangleData0550.coefficient36_250,
  OriginalRow227TriangleData0550.coefficient36_251,
  OriginalRow227TriangleData0550.coefficient36_252,
  OriginalRow227TriangleData0550.coefficient36_253,
  OriginalRow227TriangleData0550.coefficient36_254,
  OriginalRow227TriangleData0550.coefficient36_255,
  OriginalRow227TriangleData0550.coefficient36_256,
  OriginalRow227TriangleData0550.coefficient36_257,
  OriginalRow227TriangleData0550.coefficient36_258
]

theorem values0550_size : values0550.size = 32 := rfl

def block0550 : ℕ → Option IntervalDyadic := segment 227 values0550

theorem block0550_domain : ExactDomain block0550 227 259 := by
  simpa only [values0550_size] using segment_domain 227 values0550

theorem block0550_get (i : Fin 32) :
    block0550 (227 + i.val) = some (values0550[i.val]'(by rw [values0550_size]; exact i.isLt)) := by
  exact segment_get 227 values0550 ⟨i.val, by rw [values0550_size]; exact i.isLt⟩

def values0551 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0551.coefficient36_259,
  OriginalRow227TriangleData0551.coefficient36_260,
  OriginalRow227TriangleData0551.coefficient36_261,
  OriginalRow227TriangleData0551.coefficient36_262,
  OriginalRow227TriangleData0551.coefficient36_263,
  OriginalRow227TriangleData0551.coefficient36_264,
  OriginalRow227TriangleData0551.coefficient36_265,
  OriginalRow227TriangleData0551.coefficient36_266,
  OriginalRow227TriangleData0551.coefficient36_267,
  OriginalRow227TriangleData0551.coefficient36_268,
  OriginalRow227TriangleData0551.coefficient36_269,
  OriginalRow227TriangleData0551.coefficient36_270,
  OriginalRow227TriangleData0551.coefficient36_271,
  OriginalRow227TriangleData0551.coefficient36_272,
  OriginalRow227TriangleData0551.coefficient36_273,
  OriginalRow227TriangleData0551.coefficient36_274,
  OriginalRow227TriangleData0551.coefficient36_275,
  OriginalRow227TriangleData0551.coefficient36_276,
  OriginalRow227TriangleData0551.coefficient36_277,
  OriginalRow227TriangleData0551.coefficient36_278,
  OriginalRow227TriangleData0551.coefficient36_279,
  OriginalRow227TriangleData0551.coefficient36_280,
  OriginalRow227TriangleData0551.coefficient36_281,
  OriginalRow227TriangleData0551.coefficient36_282,
  OriginalRow227TriangleData0551.coefficient36_283,
  OriginalRow227TriangleData0551.coefficient36_284,
  OriginalRow227TriangleData0551.coefficient36_285,
  OriginalRow227TriangleData0551.coefficient36_286,
  OriginalRow227TriangleData0551.coefficient36_287,
  OriginalRow227TriangleData0551.coefficient36_288,
  OriginalRow227TriangleData0551.coefficient36_289,
  OriginalRow227TriangleData0551.coefficient36_290
]

theorem values0551_size : values0551.size = 32 := rfl

def block0551 : ℕ → Option IntervalDyadic := segment 259 values0551

theorem block0551_domain : ExactDomain block0551 259 291 := by
  simpa only [values0551_size] using segment_domain 259 values0551

theorem block0551_get (i : Fin 32) :
    block0551 (259 + i.val) = some (values0551[i.val]'(by rw [values0551_size]; exact i.isLt)) := by
  exact segment_get 259 values0551 ⟨i.val, by rw [values0551_size]; exact i.isLt⟩

def values0552 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0552.coefficient36_291,
  OriginalRow227TriangleData0552.coefficient36_292,
  OriginalRow227TriangleData0552.coefficient36_293,
  OriginalRow227TriangleData0552.coefficient36_294,
  OriginalRow227TriangleData0552.coefficient36_295,
  OriginalRow227TriangleData0552.coefficient36_296,
  OriginalRow227TriangleData0552.coefficient36_297,
  OriginalRow227TriangleData0552.coefficient36_298,
  OriginalRow227TriangleData0552.coefficient36_299,
  OriginalRow227TriangleData0552.coefficient36_300,
  OriginalRow227TriangleData0552.coefficient36_301,
  OriginalRow227TriangleData0552.coefficient36_302,
  OriginalRow227TriangleData0552.coefficient36_303,
  OriginalRow227TriangleData0552.coefficient36_304,
  OriginalRow227TriangleData0552.coefficient36_305,
  OriginalRow227TriangleData0552.coefficient36_306,
  OriginalRow227TriangleData0552.coefficient36_307,
  OriginalRow227TriangleData0552.coefficient36_308,
  OriginalRow227TriangleData0552.coefficient36_309,
  OriginalRow227TriangleData0552.coefficient36_310,
  OriginalRow227TriangleData0552.coefficient36_311,
  OriginalRow227TriangleData0552.coefficient36_312,
  OriginalRow227TriangleData0552.coefficient36_313,
  OriginalRow227TriangleData0552.coefficient36_314,
  OriginalRow227TriangleData0552.coefficient36_315,
  OriginalRow227TriangleData0552.coefficient36_316,
  OriginalRow227TriangleData0552.coefficient36_317,
  OriginalRow227TriangleData0552.coefficient36_318,
  OriginalRow227TriangleData0552.coefficient36_319,
  OriginalRow227TriangleData0552.coefficient36_320,
  OriginalRow227TriangleData0552.coefficient36_321,
  OriginalRow227TriangleData0552.coefficient36_322
]

theorem values0552_size : values0552.size = 32 := rfl

def block0552 : ℕ → Option IntervalDyadic := segment 291 values0552

theorem block0552_domain : ExactDomain block0552 291 323 := by
  simpa only [values0552_size] using segment_domain 291 values0552

theorem block0552_get (i : Fin 32) :
    block0552 (291 + i.val) = some (values0552[i.val]'(by rw [values0552_size]; exact i.isLt)) := by
  exact segment_get 291 values0552 ⟨i.val, by rw [values0552_size]; exact i.isLt⟩

def values0553 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0553.coefficient36_323,
  OriginalRow227TriangleData0553.coefficient36_324,
  OriginalRow227TriangleData0553.coefficient36_325,
  OriginalRow227TriangleData0553.coefficient36_326,
  OriginalRow227TriangleData0553.coefficient36_327,
  OriginalRow227TriangleData0553.coefficient36_328,
  OriginalRow227TriangleData0553.coefficient36_329,
  OriginalRow227TriangleData0553.coefficient36_330,
  OriginalRow227TriangleData0553.coefficient36_331,
  OriginalRow227TriangleData0553.coefficient36_332,
  OriginalRow227TriangleData0553.coefficient36_333,
  OriginalRow227TriangleData0553.coefficient36_334,
  OriginalRow227TriangleData0553.coefficient36_335,
  OriginalRow227TriangleData0553.coefficient36_336,
  OriginalRow227TriangleData0553.coefficient36_337,
  OriginalRow227TriangleData0553.coefficient36_338,
  OriginalRow227TriangleData0553.coefficient36_339,
  OriginalRow227TriangleData0553.coefficient36_340,
  OriginalRow227TriangleData0553.coefficient36_341,
  OriginalRow227TriangleData0553.coefficient36_342,
  OriginalRow227TriangleData0553.coefficient36_343,
  OriginalRow227TriangleData0553.coefficient36_344,
  OriginalRow227TriangleData0553.coefficient36_345,
  OriginalRow227TriangleData0553.coefficient36_346,
  OriginalRow227TriangleData0553.coefficient36_347,
  OriginalRow227TriangleData0553.coefficient36_348,
  OriginalRow227TriangleData0553.coefficient36_349,
  OriginalRow227TriangleData0553.coefficient36_350,
  OriginalRow227TriangleData0553.coefficient36_351,
  OriginalRow227TriangleData0553.coefficient36_352,
  OriginalRow227TriangleData0553.coefficient36_353,
  OriginalRow227TriangleData0553.coefficient36_354
]

theorem values0553_size : values0553.size = 32 := rfl

def block0553 : ℕ → Option IntervalDyadic := segment 323 values0553

theorem block0553_domain : ExactDomain block0553 323 355 := by
  simpa only [values0553_size] using segment_domain 323 values0553

theorem block0553_get (i : Fin 32) :
    block0553 (323 + i.val) = some (values0553[i.val]'(by rw [values0553_size]; exact i.isLt)) := by
  exact segment_get 323 values0553 ⟨i.val, by rw [values0553_size]; exact i.isLt⟩

def values0554 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0554.coefficient36_355,
  OriginalRow227TriangleData0554.coefficient36_356,
  OriginalRow227TriangleData0554.coefficient36_357,
  OriginalRow227TriangleData0554.coefficient36_358,
  OriginalRow227TriangleData0554.coefficient36_359,
  OriginalRow227TriangleData0554.coefficient36_360,
  OriginalRow227TriangleData0554.coefficient36_361,
  OriginalRow227TriangleData0554.coefficient36_362,
  OriginalRow227TriangleData0554.coefficient36_363,
  OriginalRow227TriangleData0554.coefficient36_364,
  OriginalRow227TriangleData0554.coefficient36_365,
  OriginalRow227TriangleData0554.coefficient36_366,
  OriginalRow227TriangleData0554.coefficient36_367,
  OriginalRow227TriangleData0554.coefficient36_368,
  OriginalRow227TriangleData0554.coefficient36_369,
  OriginalRow227TriangleData0554.coefficient36_370,
  OriginalRow227TriangleData0554.coefficient36_371,
  OriginalRow227TriangleData0554.coefficient36_372,
  OriginalRow227TriangleData0554.coefficient36_373,
  OriginalRow227TriangleData0554.coefficient36_374,
  OriginalRow227TriangleData0554.coefficient36_375,
  OriginalRow227TriangleData0554.coefficient36_376,
  OriginalRow227TriangleData0554.coefficient36_377,
  OriginalRow227TriangleData0554.coefficient36_378,
  OriginalRow227TriangleData0554.coefficient36_379,
  OriginalRow227TriangleData0554.coefficient36_380,
  OriginalRow227TriangleData0554.coefficient36_381,
  OriginalRow227TriangleData0554.coefficient36_382,
  OriginalRow227TriangleData0554.coefficient36_383,
  OriginalRow227TriangleData0554.coefficient36_384,
  OriginalRow227TriangleData0554.coefficient36_385,
  OriginalRow227TriangleData0554.coefficient36_386
]

theorem values0554_size : values0554.size = 32 := rfl

def block0554 : ℕ → Option IntervalDyadic := segment 355 values0554

theorem block0554_domain : ExactDomain block0554 355 387 := by
  simpa only [values0554_size] using segment_domain 355 values0554

theorem block0554_get (i : Fin 32) :
    block0554 (355 + i.val) = some (values0554[i.val]'(by rw [values0554_size]; exact i.isLt)) := by
  exact segment_get 355 values0554 ⟨i.val, by rw [values0554_size]; exact i.isLt⟩

def values0555 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0555.coefficient36_387,
  OriginalRow227TriangleData0555.coefficient36_388,
  OriginalRow227TriangleData0555.coefficient36_389,
  OriginalRow227TriangleData0555.coefficient36_390,
  OriginalRow227TriangleData0555.coefficient36_391,
  OriginalRow227TriangleData0555.coefficient36_392,
  OriginalRow227TriangleData0555.coefficient36_393,
  OriginalRow227TriangleData0555.coefficient36_394,
  OriginalRow227TriangleData0555.coefficient36_395,
  OriginalRow227TriangleData0555.coefficient36_396,
  OriginalRow227TriangleData0555.coefficient36_397,
  OriginalRow227TriangleData0555.coefficient36_398,
  OriginalRow227TriangleData0555.coefficient36_399,
  OriginalRow227TriangleData0555.coefficient36_400,
  OriginalRow227TriangleData0555.coefficient36_401,
  OriginalRow227TriangleData0555.coefficient36_402,
  OriginalRow227TriangleData0555.coefficient36_403,
  OriginalRow227TriangleData0555.coefficient36_404,
  OriginalRow227TriangleData0555.coefficient36_405,
  OriginalRow227TriangleData0555.coefficient36_406,
  OriginalRow227TriangleData0555.coefficient36_407,
  OriginalRow227TriangleData0555.coefficient36_408,
  OriginalRow227TriangleData0555.coefficient36_409,
  OriginalRow227TriangleData0555.coefficient36_410,
  OriginalRow227TriangleData0555.coefficient36_411,
  OriginalRow227TriangleData0555.coefficient36_412,
  OriginalRow227TriangleData0555.coefficient36_413,
  OriginalRow227TriangleData0555.coefficient36_414,
  OriginalRow227TriangleData0555.coefficient36_415,
  OriginalRow227TriangleData0555.coefficient36_416,
  OriginalRow227TriangleData0555.coefficient36_417,
  OriginalRow227TriangleData0555.coefficient36_418
]

theorem values0555_size : values0555.size = 32 := rfl

def block0555 : ℕ → Option IntervalDyadic := segment 387 values0555

theorem block0555_domain : ExactDomain block0555 387 419 := by
  simpa only [values0555_size] using segment_domain 387 values0555

theorem block0555_get (i : Fin 32) :
    block0555 (387 + i.val) = some (values0555[i.val]'(by rw [values0555_size]; exact i.isLt)) := by
  exact segment_get 387 values0555 ⟨i.val, by rw [values0555_size]; exact i.isLt⟩

def values0556 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0556.coefficient36_419,
  OriginalRow227TriangleData0556.coefficient36_420,
  OriginalRow227TriangleData0556.coefficient36_421,
  OriginalRow227TriangleData0556.coefficient36_422,
  OriginalRow227TriangleData0556.coefficient36_423,
  OriginalRow227TriangleData0556.coefficient36_424,
  OriginalRow227TriangleData0556.coefficient36_425,
  OriginalRow227TriangleData0556.coefficient36_426,
  OriginalRow227TriangleData0556.coefficient36_427,
  OriginalRow227TriangleData0556.coefficient36_428,
  OriginalRow227TriangleData0556.coefficient36_429,
  OriginalRow227TriangleData0556.coefficient36_430,
  OriginalRow227TriangleData0556.coefficient36_431,
  OriginalRow227TriangleData0556.coefficient36_432,
  OriginalRow227TriangleData0556.coefficient36_433,
  OriginalRow227TriangleData0556.coefficient36_434,
  OriginalRow227TriangleData0556.coefficient36_435,
  OriginalRow227TriangleData0556.coefficient36_436,
  OriginalRow227TriangleData0556.coefficient36_437,
  OriginalRow227TriangleData0556.coefficient36_438,
  OriginalRow227TriangleData0556.coefficient36_439,
  OriginalRow227TriangleData0556.coefficient36_440,
  OriginalRow227TriangleData0556.coefficient36_441,
  OriginalRow227TriangleData0556.coefficient36_442,
  OriginalRow227TriangleData0556.coefficient36_443,
  OriginalRow227TriangleData0556.coefficient36_444,
  OriginalRow227TriangleData0556.coefficient36_445,
  OriginalRow227TriangleData0556.coefficient36_446,
  OriginalRow227TriangleData0556.coefficient36_447,
  OriginalRow227TriangleData0556.coefficient36_448,
  OriginalRow227TriangleData0556.coefficient36_449,
  OriginalRow227TriangleData0556.coefficient36_450
]

theorem values0556_size : values0556.size = 32 := rfl

def block0556 : ℕ → Option IntervalDyadic := segment 419 values0556

theorem block0556_domain : ExactDomain block0556 419 451 := by
  simpa only [values0556_size] using segment_domain 419 values0556

theorem block0556_get (i : Fin 32) :
    block0556 (419 + i.val) = some (values0556[i.val]'(by rw [values0556_size]; exact i.isLt)) := by
  exact segment_get 419 values0556 ⟨i.val, by rw [values0556_size]; exact i.isLt⟩

def values0557 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0557.coefficient36_451,
  OriginalRow227TriangleData0557.coefficient36_452,
  OriginalRow227TriangleData0557.coefficient36_453,
  OriginalRow227TriangleData0557.coefficient36_454,
  OriginalRow227TriangleData0557.coefficient36_455,
  OriginalRow227TriangleData0557.coefficient36_456,
  OriginalRow227TriangleData0557.coefficient36_457,
  OriginalRow227TriangleData0557.coefficient36_458,
  OriginalRow227TriangleData0557.coefficient36_459,
  OriginalRow227TriangleData0557.coefficient36_460,
  OriginalRow227TriangleData0557.coefficient36_461,
  OriginalRow227TriangleData0557.coefficient36_462,
  OriginalRow227TriangleData0557.coefficient36_463,
  OriginalRow227TriangleData0557.coefficient36_464,
  OriginalRow227TriangleData0557.coefficient36_465
]

theorem values0557_size : values0557.size = 15 := rfl

def block0557 : ℕ → Option IntervalDyadic := segment 451 values0557

theorem block0557_domain : ExactDomain block0557 451 466 := by
  simpa only [values0557_size] using segment_domain 451 values0557

theorem block0557_get (i : Fin 15) :
    block0557 (451 + i.val) = some (values0557[i.val]'(by rw [values0557_size]; exact i.isLt)) := by
  exact segment_get 451 values0557 ⟨i.val, by rw [values0557_size]; exact i.isLt⟩

def node0067_0131 : ℕ → Option IntervalDyadic := split 99 block0545 block0546

theorem node0067_0131_domain : ExactDomain node0067_0131 67 131 := by
  exact split_domain (by decide) (by decide) block0545_domain block0546_domain

def node0035_0131 : ℕ → Option IntervalDyadic := split 67 block0544 node0067_0131

theorem node0035_0131_domain : ExactDomain node0035_0131 35 131 := by
  exact split_domain (by decide) (by decide) block0544_domain node0067_0131_domain

def node0131_0195 : ℕ → Option IntervalDyadic := split 163 block0547 block0548

theorem node0131_0195_domain : ExactDomain node0131_0195 131 195 := by
  exact split_domain (by decide) (by decide) block0547_domain block0548_domain

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block0549 block0550

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block0549_domain block0550_domain

def node0131_0259 : ℕ → Option IntervalDyadic := split 195 node0131_0195 node0195_0259

theorem node0131_0259_domain : ExactDomain node0131_0259 131 259 := by
  exact split_domain (by decide) (by decide) node0131_0195_domain node0195_0259_domain

def node0035_0259 : ℕ → Option IntervalDyadic := split 131 node0035_0131 node0131_0259

theorem node0035_0259_domain : ExactDomain node0035_0259 35 259 := by
  exact split_domain (by decide) (by decide) node0035_0131_domain node0131_0259_domain

def node0291_0355 : ℕ → Option IntervalDyadic := split 323 block0552 block0553

theorem node0291_0355_domain : ExactDomain node0291_0355 291 355 := by
  exact split_domain (by decide) (by decide) block0552_domain block0553_domain

def node0259_0355 : ℕ → Option IntervalDyadic := split 291 block0551 node0291_0355

theorem node0259_0355_domain : ExactDomain node0259_0355 259 355 := by
  exact split_domain (by decide) (by decide) block0551_domain node0291_0355_domain

def node0355_0419 : ℕ → Option IntervalDyadic := split 387 block0554 block0555

theorem node0355_0419_domain : ExactDomain node0355_0419 355 419 := by
  exact split_domain (by decide) (by decide) block0554_domain block0555_domain

def node0419_0466 : ℕ → Option IntervalDyadic := split 451 block0556 block0557

theorem node0419_0466_domain : ExactDomain node0419_0466 419 466 := by
  exact split_domain (by decide) (by decide) block0556_domain block0557_domain

def node0355_0466 : ℕ → Option IntervalDyadic := split 419 node0355_0419 node0419_0466

theorem node0355_0466_domain : ExactDomain node0355_0466 355 466 := by
  exact split_domain (by decide) (by decide) node0355_0419_domain node0419_0466_domain

def node0259_0466 : ℕ → Option IntervalDyadic := split 355 node0259_0355 node0355_0466

theorem node0259_0466_domain : ExactDomain node0259_0466 259 466 := by
  exact split_domain (by decide) (by decide) node0259_0355_domain node0355_0466_domain

def node0035_0466 : ℕ → Option IntervalDyadic := split 259 node0035_0259 node0259_0466

theorem node0035_0466_domain : ExactDomain node0035_0466 35 466 := by
  exact split_domain (by decide) (by decide) node0035_0259_domain node0259_0466_domain

def lookup : ℕ → Option IntervalDyadic := node0035_0466

theorem lookup_domain : ExactDomain lookup 35 466 :=
  node0035_0466_domain

theorem block0544_lookup (i : Fin 32) :
    lookup (35 + i.val) = some (values0544[i.val]'(by rw [values0544_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (35 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_left 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0035_0131, split_left 67 block0544 node0067_0131 (by omega)]
  exact block0544_get i

theorem block0545_lookup (i : Fin 32) :
    lookup (67 + i.val) = some (values0545[i.val]'(by rw [values0545_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (67 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_left 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0035_0131, split_right 67 block0544 node0067_0131 (by omega)]
  rw [node0067_0131, split_left 99 block0545 block0546 (by omega)]
  exact block0545_get i

theorem block0546_lookup (i : Fin 32) :
    lookup (99 + i.val) = some (values0546[i.val]'(by rw [values0546_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (99 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_left 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0035_0131, split_right 67 block0544 node0067_0131 (by omega)]
  rw [node0067_0131, split_right 99 block0545 block0546 (by omega)]
  exact block0546_get i

theorem block0547_lookup (i : Fin 32) :
    lookup (131 + i.val) = some (values0547[i.val]'(by rw [values0547_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (131 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_right 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_left 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0131_0195, split_left 163 block0547 block0548 (by omega)]
  exact block0547_get i

theorem block0548_lookup (i : Fin 32) :
    lookup (163 + i.val) = some (values0548[i.val]'(by rw [values0548_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (163 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_right 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_left 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0131_0195, split_right 163 block0547 block0548 (by omega)]
  exact block0548_get i

theorem block0549_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values0549[i.val]'(by rw [values0549_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (195 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_right 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_right 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0195_0259, split_left 227 block0549 block0550 (by omega)]
  exact block0549_get i

theorem block0550_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values0550[i.val]'(by rw [values0550_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (227 + i.val) = _
  rw [node0035_0466, split_left 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0035_0259, split_right 131 node0035_0131 node0131_0259 (by omega)]
  rw [node0131_0259, split_right 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0195_0259, split_right 227 block0549 block0550 (by omega)]
  exact block0550_get i

theorem block0551_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values0551[i.val]'(by rw [values0551_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (259 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_left 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0259_0355, split_left 291 block0551 node0291_0355 (by omega)]
  exact block0551_get i

theorem block0552_lookup (i : Fin 32) :
    lookup (291 + i.val) = some (values0552[i.val]'(by rw [values0552_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (291 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_left 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0259_0355, split_right 291 block0551 node0291_0355 (by omega)]
  rw [node0291_0355, split_left 323 block0552 block0553 (by omega)]
  exact block0552_get i

theorem block0553_lookup (i : Fin 32) :
    lookup (323 + i.val) = some (values0553[i.val]'(by rw [values0553_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (323 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_left 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0259_0355, split_right 291 block0551 node0291_0355 (by omega)]
  rw [node0291_0355, split_right 323 block0552 block0553 (by omega)]
  exact block0553_get i

theorem block0554_lookup (i : Fin 32) :
    lookup (355 + i.val) = some (values0554[i.val]'(by rw [values0554_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (355 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_right 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0355_0466, split_left 419 node0355_0419 node0419_0466 (by omega)]
  rw [node0355_0419, split_left 387 block0554 block0555 (by omega)]
  exact block0554_get i

theorem block0555_lookup (i : Fin 32) :
    lookup (387 + i.val) = some (values0555[i.val]'(by rw [values0555_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (387 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_right 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0355_0466, split_left 419 node0355_0419 node0419_0466 (by omega)]
  rw [node0355_0419, split_right 387 block0554 block0555 (by omega)]
  exact block0555_get i

theorem block0556_lookup (i : Fin 32) :
    lookup (419 + i.val) = some (values0556[i.val]'(by rw [values0556_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (419 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_right 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0355_0466, split_right 419 node0355_0419 node0419_0466 (by omega)]
  rw [node0419_0466, split_left 451 block0556 block0557 (by omega)]
  exact block0556_get i

theorem block0557_lookup (i : Fin 15) :
    lookup (451 + i.val) = some (values0557[i.val]'(by rw [values0557_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0035_0466 (451 + i.val) = _
  rw [node0035_0466, split_right 259 node0035_0259 node0259_0466 (by omega)]
  rw [node0259_0466, split_right 355 node0259_0355 node0355_0466 (by omega)]
  rw [node0355_0466, split_right 419 node0355_0419 node0419_0466 (by omega)]
  rw [node0419_0466, split_right 451 block0556 block0557 (by omega)]
  exact block0557_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0544_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0544_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0545_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0545_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0546_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0546_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0547_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0547_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0548_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0548_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0549_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0549_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0550_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0550_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0551_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0551_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0552_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0552_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0553_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0553_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0554_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0554_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0555_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0555_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0556_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0556_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0557_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0557_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0544_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0545_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0546_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0547_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0548_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0549_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0550_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0551_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0552_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0553_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0554_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0555_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0556_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow036.block0557_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow036
