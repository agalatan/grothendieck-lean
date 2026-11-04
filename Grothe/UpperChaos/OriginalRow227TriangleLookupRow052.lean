import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0760
import Grothe.UpperChaos.OriginalRow227TriangleData0761
import Grothe.UpperChaos.OriginalRow227TriangleData0762
import Grothe.UpperChaos.OriginalRow227TriangleData0763
import Grothe.UpperChaos.OriginalRow227TriangleData0764
import Grothe.UpperChaos.OriginalRow227TriangleData0765
import Grothe.UpperChaos.OriginalRow227TriangleData0766
import Grothe.UpperChaos.OriginalRow227TriangleData0767
import Grothe.UpperChaos.OriginalRow227TriangleData0768
import Grothe.UpperChaos.OriginalRow227TriangleData0769
import Grothe.UpperChaos.OriginalRow227TriangleData0770
import Grothe.UpperChaos.OriginalRow227TriangleData0771
import Grothe.UpperChaos.OriginalRow227TriangleData0772

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow052

open ConditionalTableLookup

def values0760 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0760.coefficient52_51,
  OriginalRow227TriangleData0760.coefficient52_52,
  OriginalRow227TriangleData0760.coefficient52_53,
  OriginalRow227TriangleData0760.coefficient52_54,
  OriginalRow227TriangleData0760.coefficient52_55,
  OriginalRow227TriangleData0760.coefficient52_56,
  OriginalRow227TriangleData0760.coefficient52_57,
  OriginalRow227TriangleData0760.coefficient52_58,
  OriginalRow227TriangleData0760.coefficient52_59,
  OriginalRow227TriangleData0760.coefficient52_60,
  OriginalRow227TriangleData0760.coefficient52_61,
  OriginalRow227TriangleData0760.coefficient52_62,
  OriginalRow227TriangleData0760.coefficient52_63,
  OriginalRow227TriangleData0760.coefficient52_64,
  OriginalRow227TriangleData0760.coefficient52_65,
  OriginalRow227TriangleData0760.coefficient52_66,
  OriginalRow227TriangleData0760.coefficient52_67,
  OriginalRow227TriangleData0760.coefficient52_68,
  OriginalRow227TriangleData0760.coefficient52_69,
  OriginalRow227TriangleData0760.coefficient52_70,
  OriginalRow227TriangleData0760.coefficient52_71,
  OriginalRow227TriangleData0760.coefficient52_72,
  OriginalRow227TriangleData0760.coefficient52_73,
  OriginalRow227TriangleData0760.coefficient52_74,
  OriginalRow227TriangleData0760.coefficient52_75,
  OriginalRow227TriangleData0760.coefficient52_76,
  OriginalRow227TriangleData0760.coefficient52_77,
  OriginalRow227TriangleData0760.coefficient52_78,
  OriginalRow227TriangleData0760.coefficient52_79,
  OriginalRow227TriangleData0760.coefficient52_80,
  OriginalRow227TriangleData0760.coefficient52_81,
  OriginalRow227TriangleData0760.coefficient52_82
]

theorem values0760_size : values0760.size = 32 := rfl

def block0760 : ℕ → Option IntervalDyadic := segment 51 values0760

theorem block0760_domain : ExactDomain block0760 51 83 := by
  simpa only [values0760_size] using segment_domain 51 values0760

theorem block0760_get (i : Fin 32) :
    block0760 (51 + i.val) = some (values0760[i.val]'(by rw [values0760_size]; exact i.isLt)) := by
  exact segment_get 51 values0760 ⟨i.val, by rw [values0760_size]; exact i.isLt⟩

def values0761 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0761.coefficient52_83,
  OriginalRow227TriangleData0761.coefficient52_84,
  OriginalRow227TriangleData0761.coefficient52_85,
  OriginalRow227TriangleData0761.coefficient52_86,
  OriginalRow227TriangleData0761.coefficient52_87,
  OriginalRow227TriangleData0761.coefficient52_88,
  OriginalRow227TriangleData0761.coefficient52_89,
  OriginalRow227TriangleData0761.coefficient52_90,
  OriginalRow227TriangleData0761.coefficient52_91,
  OriginalRow227TriangleData0761.coefficient52_92,
  OriginalRow227TriangleData0761.coefficient52_93,
  OriginalRow227TriangleData0761.coefficient52_94,
  OriginalRow227TriangleData0761.coefficient52_95,
  OriginalRow227TriangleData0761.coefficient52_96,
  OriginalRow227TriangleData0761.coefficient52_97,
  OriginalRow227TriangleData0761.coefficient52_98,
  OriginalRow227TriangleData0761.coefficient52_99,
  OriginalRow227TriangleData0761.coefficient52_100,
  OriginalRow227TriangleData0761.coefficient52_101,
  OriginalRow227TriangleData0761.coefficient52_102,
  OriginalRow227TriangleData0761.coefficient52_103,
  OriginalRow227TriangleData0761.coefficient52_104,
  OriginalRow227TriangleData0761.coefficient52_105,
  OriginalRow227TriangleData0761.coefficient52_106,
  OriginalRow227TriangleData0761.coefficient52_107,
  OriginalRow227TriangleData0761.coefficient52_108,
  OriginalRow227TriangleData0761.coefficient52_109,
  OriginalRow227TriangleData0761.coefficient52_110,
  OriginalRow227TriangleData0761.coefficient52_111,
  OriginalRow227TriangleData0761.coefficient52_112,
  OriginalRow227TriangleData0761.coefficient52_113,
  OriginalRow227TriangleData0761.coefficient52_114
]

theorem values0761_size : values0761.size = 32 := rfl

def block0761 : ℕ → Option IntervalDyadic := segment 83 values0761

theorem block0761_domain : ExactDomain block0761 83 115 := by
  simpa only [values0761_size] using segment_domain 83 values0761

theorem block0761_get (i : Fin 32) :
    block0761 (83 + i.val) = some (values0761[i.val]'(by rw [values0761_size]; exact i.isLt)) := by
  exact segment_get 83 values0761 ⟨i.val, by rw [values0761_size]; exact i.isLt⟩

def values0762 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0762.coefficient52_115,
  OriginalRow227TriangleData0762.coefficient52_116,
  OriginalRow227TriangleData0762.coefficient52_117,
  OriginalRow227TriangleData0762.coefficient52_118,
  OriginalRow227TriangleData0762.coefficient52_119,
  OriginalRow227TriangleData0762.coefficient52_120,
  OriginalRow227TriangleData0762.coefficient52_121,
  OriginalRow227TriangleData0762.coefficient52_122,
  OriginalRow227TriangleData0762.coefficient52_123,
  OriginalRow227TriangleData0762.coefficient52_124,
  OriginalRow227TriangleData0762.coefficient52_125,
  OriginalRow227TriangleData0762.coefficient52_126,
  OriginalRow227TriangleData0762.coefficient52_127,
  OriginalRow227TriangleData0762.coefficient52_128,
  OriginalRow227TriangleData0762.coefficient52_129,
  OriginalRow227TriangleData0762.coefficient52_130,
  OriginalRow227TriangleData0762.coefficient52_131,
  OriginalRow227TriangleData0762.coefficient52_132,
  OriginalRow227TriangleData0762.coefficient52_133,
  OriginalRow227TriangleData0762.coefficient52_134,
  OriginalRow227TriangleData0762.coefficient52_135,
  OriginalRow227TriangleData0762.coefficient52_136,
  OriginalRow227TriangleData0762.coefficient52_137,
  OriginalRow227TriangleData0762.coefficient52_138,
  OriginalRow227TriangleData0762.coefficient52_139,
  OriginalRow227TriangleData0762.coefficient52_140,
  OriginalRow227TriangleData0762.coefficient52_141,
  OriginalRow227TriangleData0762.coefficient52_142,
  OriginalRow227TriangleData0762.coefficient52_143,
  OriginalRow227TriangleData0762.coefficient52_144,
  OriginalRow227TriangleData0762.coefficient52_145,
  OriginalRow227TriangleData0762.coefficient52_146
]

theorem values0762_size : values0762.size = 32 := rfl

def block0762 : ℕ → Option IntervalDyadic := segment 115 values0762

theorem block0762_domain : ExactDomain block0762 115 147 := by
  simpa only [values0762_size] using segment_domain 115 values0762

theorem block0762_get (i : Fin 32) :
    block0762 (115 + i.val) = some (values0762[i.val]'(by rw [values0762_size]; exact i.isLt)) := by
  exact segment_get 115 values0762 ⟨i.val, by rw [values0762_size]; exact i.isLt⟩

def values0763 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0763.coefficient52_147,
  OriginalRow227TriangleData0763.coefficient52_148,
  OriginalRow227TriangleData0763.coefficient52_149,
  OriginalRow227TriangleData0763.coefficient52_150,
  OriginalRow227TriangleData0763.coefficient52_151,
  OriginalRow227TriangleData0763.coefficient52_152,
  OriginalRow227TriangleData0763.coefficient52_153,
  OriginalRow227TriangleData0763.coefficient52_154,
  OriginalRow227TriangleData0763.coefficient52_155,
  OriginalRow227TriangleData0763.coefficient52_156,
  OriginalRow227TriangleData0763.coefficient52_157,
  OriginalRow227TriangleData0763.coefficient52_158,
  OriginalRow227TriangleData0763.coefficient52_159,
  OriginalRow227TriangleData0763.coefficient52_160,
  OriginalRow227TriangleData0763.coefficient52_161,
  OriginalRow227TriangleData0763.coefficient52_162,
  OriginalRow227TriangleData0763.coefficient52_163,
  OriginalRow227TriangleData0763.coefficient52_164,
  OriginalRow227TriangleData0763.coefficient52_165,
  OriginalRow227TriangleData0763.coefficient52_166,
  OriginalRow227TriangleData0763.coefficient52_167,
  OriginalRow227TriangleData0763.coefficient52_168,
  OriginalRow227TriangleData0763.coefficient52_169,
  OriginalRow227TriangleData0763.coefficient52_170,
  OriginalRow227TriangleData0763.coefficient52_171,
  OriginalRow227TriangleData0763.coefficient52_172,
  OriginalRow227TriangleData0763.coefficient52_173,
  OriginalRow227TriangleData0763.coefficient52_174,
  OriginalRow227TriangleData0763.coefficient52_175,
  OriginalRow227TriangleData0763.coefficient52_176,
  OriginalRow227TriangleData0763.coefficient52_177,
  OriginalRow227TriangleData0763.coefficient52_178
]

theorem values0763_size : values0763.size = 32 := rfl

def block0763 : ℕ → Option IntervalDyadic := segment 147 values0763

theorem block0763_domain : ExactDomain block0763 147 179 := by
  simpa only [values0763_size] using segment_domain 147 values0763

theorem block0763_get (i : Fin 32) :
    block0763 (147 + i.val) = some (values0763[i.val]'(by rw [values0763_size]; exact i.isLt)) := by
  exact segment_get 147 values0763 ⟨i.val, by rw [values0763_size]; exact i.isLt⟩

def values0764 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0764.coefficient52_179,
  OriginalRow227TriangleData0764.coefficient52_180,
  OriginalRow227TriangleData0764.coefficient52_181,
  OriginalRow227TriangleData0764.coefficient52_182,
  OriginalRow227TriangleData0764.coefficient52_183,
  OriginalRow227TriangleData0764.coefficient52_184,
  OriginalRow227TriangleData0764.coefficient52_185,
  OriginalRow227TriangleData0764.coefficient52_186,
  OriginalRow227TriangleData0764.coefficient52_187,
  OriginalRow227TriangleData0764.coefficient52_188,
  OriginalRow227TriangleData0764.coefficient52_189,
  OriginalRow227TriangleData0764.coefficient52_190,
  OriginalRow227TriangleData0764.coefficient52_191,
  OriginalRow227TriangleData0764.coefficient52_192,
  OriginalRow227TriangleData0764.coefficient52_193,
  OriginalRow227TriangleData0764.coefficient52_194,
  OriginalRow227TriangleData0764.coefficient52_195,
  OriginalRow227TriangleData0764.coefficient52_196,
  OriginalRow227TriangleData0764.coefficient52_197,
  OriginalRow227TriangleData0764.coefficient52_198,
  OriginalRow227TriangleData0764.coefficient52_199,
  OriginalRow227TriangleData0764.coefficient52_200,
  OriginalRow227TriangleData0764.coefficient52_201,
  OriginalRow227TriangleData0764.coefficient52_202,
  OriginalRow227TriangleData0764.coefficient52_203,
  OriginalRow227TriangleData0764.coefficient52_204,
  OriginalRow227TriangleData0764.coefficient52_205,
  OriginalRow227TriangleData0764.coefficient52_206,
  OriginalRow227TriangleData0764.coefficient52_207,
  OriginalRow227TriangleData0764.coefficient52_208,
  OriginalRow227TriangleData0764.coefficient52_209,
  OriginalRow227TriangleData0764.coefficient52_210
]

theorem values0764_size : values0764.size = 32 := rfl

def block0764 : ℕ → Option IntervalDyadic := segment 179 values0764

theorem block0764_domain : ExactDomain block0764 179 211 := by
  simpa only [values0764_size] using segment_domain 179 values0764

theorem block0764_get (i : Fin 32) :
    block0764 (179 + i.val) = some (values0764[i.val]'(by rw [values0764_size]; exact i.isLt)) := by
  exact segment_get 179 values0764 ⟨i.val, by rw [values0764_size]; exact i.isLt⟩

def values0765 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0765.coefficient52_211,
  OriginalRow227TriangleData0765.coefficient52_212,
  OriginalRow227TriangleData0765.coefficient52_213,
  OriginalRow227TriangleData0765.coefficient52_214,
  OriginalRow227TriangleData0765.coefficient52_215,
  OriginalRow227TriangleData0765.coefficient52_216,
  OriginalRow227TriangleData0765.coefficient52_217,
  OriginalRow227TriangleData0765.coefficient52_218,
  OriginalRow227TriangleData0765.coefficient52_219,
  OriginalRow227TriangleData0765.coefficient52_220,
  OriginalRow227TriangleData0765.coefficient52_221,
  OriginalRow227TriangleData0765.coefficient52_222,
  OriginalRow227TriangleData0765.coefficient52_223,
  OriginalRow227TriangleData0765.coefficient52_224,
  OriginalRow227TriangleData0765.coefficient52_225,
  OriginalRow227TriangleData0765.coefficient52_226,
  OriginalRow227TriangleData0765.coefficient52_227,
  OriginalRow227TriangleData0765.coefficient52_228,
  OriginalRow227TriangleData0765.coefficient52_229,
  OriginalRow227TriangleData0765.coefficient52_230,
  OriginalRow227TriangleData0765.coefficient52_231,
  OriginalRow227TriangleData0765.coefficient52_232,
  OriginalRow227TriangleData0765.coefficient52_233,
  OriginalRow227TriangleData0765.coefficient52_234,
  OriginalRow227TriangleData0765.coefficient52_235,
  OriginalRow227TriangleData0765.coefficient52_236,
  OriginalRow227TriangleData0765.coefficient52_237,
  OriginalRow227TriangleData0765.coefficient52_238,
  OriginalRow227TriangleData0765.coefficient52_239,
  OriginalRow227TriangleData0765.coefficient52_240,
  OriginalRow227TriangleData0765.coefficient52_241,
  OriginalRow227TriangleData0765.coefficient52_242
]

theorem values0765_size : values0765.size = 32 := rfl

def block0765 : ℕ → Option IntervalDyadic := segment 211 values0765

theorem block0765_domain : ExactDomain block0765 211 243 := by
  simpa only [values0765_size] using segment_domain 211 values0765

theorem block0765_get (i : Fin 32) :
    block0765 (211 + i.val) = some (values0765[i.val]'(by rw [values0765_size]; exact i.isLt)) := by
  exact segment_get 211 values0765 ⟨i.val, by rw [values0765_size]; exact i.isLt⟩

def values0766 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0766.coefficient52_243,
  OriginalRow227TriangleData0766.coefficient52_244,
  OriginalRow227TriangleData0766.coefficient52_245,
  OriginalRow227TriangleData0766.coefficient52_246,
  OriginalRow227TriangleData0766.coefficient52_247,
  OriginalRow227TriangleData0766.coefficient52_248,
  OriginalRow227TriangleData0766.coefficient52_249,
  OriginalRow227TriangleData0766.coefficient52_250,
  OriginalRow227TriangleData0766.coefficient52_251,
  OriginalRow227TriangleData0766.coefficient52_252,
  OriginalRow227TriangleData0766.coefficient52_253,
  OriginalRow227TriangleData0766.coefficient52_254,
  OriginalRow227TriangleData0766.coefficient52_255,
  OriginalRow227TriangleData0766.coefficient52_256,
  OriginalRow227TriangleData0766.coefficient52_257,
  OriginalRow227TriangleData0766.coefficient52_258,
  OriginalRow227TriangleData0766.coefficient52_259,
  OriginalRow227TriangleData0766.coefficient52_260,
  OriginalRow227TriangleData0766.coefficient52_261,
  OriginalRow227TriangleData0766.coefficient52_262,
  OriginalRow227TriangleData0766.coefficient52_263,
  OriginalRow227TriangleData0766.coefficient52_264,
  OriginalRow227TriangleData0766.coefficient52_265,
  OriginalRow227TriangleData0766.coefficient52_266,
  OriginalRow227TriangleData0766.coefficient52_267,
  OriginalRow227TriangleData0766.coefficient52_268,
  OriginalRow227TriangleData0766.coefficient52_269,
  OriginalRow227TriangleData0766.coefficient52_270,
  OriginalRow227TriangleData0766.coefficient52_271,
  OriginalRow227TriangleData0766.coefficient52_272,
  OriginalRow227TriangleData0766.coefficient52_273,
  OriginalRow227TriangleData0766.coefficient52_274
]

theorem values0766_size : values0766.size = 32 := rfl

def block0766 : ℕ → Option IntervalDyadic := segment 243 values0766

theorem block0766_domain : ExactDomain block0766 243 275 := by
  simpa only [values0766_size] using segment_domain 243 values0766

theorem block0766_get (i : Fin 32) :
    block0766 (243 + i.val) = some (values0766[i.val]'(by rw [values0766_size]; exact i.isLt)) := by
  exact segment_get 243 values0766 ⟨i.val, by rw [values0766_size]; exact i.isLt⟩

def values0767 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0767.coefficient52_275,
  OriginalRow227TriangleData0767.coefficient52_276,
  OriginalRow227TriangleData0767.coefficient52_277,
  OriginalRow227TriangleData0767.coefficient52_278,
  OriginalRow227TriangleData0767.coefficient52_279,
  OriginalRow227TriangleData0767.coefficient52_280,
  OriginalRow227TriangleData0767.coefficient52_281,
  OriginalRow227TriangleData0767.coefficient52_282,
  OriginalRow227TriangleData0767.coefficient52_283,
  OriginalRow227TriangleData0767.coefficient52_284,
  OriginalRow227TriangleData0767.coefficient52_285,
  OriginalRow227TriangleData0767.coefficient52_286,
  OriginalRow227TriangleData0767.coefficient52_287,
  OriginalRow227TriangleData0767.coefficient52_288,
  OriginalRow227TriangleData0767.coefficient52_289,
  OriginalRow227TriangleData0767.coefficient52_290,
  OriginalRow227TriangleData0767.coefficient52_291,
  OriginalRow227TriangleData0767.coefficient52_292,
  OriginalRow227TriangleData0767.coefficient52_293,
  OriginalRow227TriangleData0767.coefficient52_294,
  OriginalRow227TriangleData0767.coefficient52_295,
  OriginalRow227TriangleData0767.coefficient52_296,
  OriginalRow227TriangleData0767.coefficient52_297,
  OriginalRow227TriangleData0767.coefficient52_298,
  OriginalRow227TriangleData0767.coefficient52_299,
  OriginalRow227TriangleData0767.coefficient52_300,
  OriginalRow227TriangleData0767.coefficient52_301,
  OriginalRow227TriangleData0767.coefficient52_302,
  OriginalRow227TriangleData0767.coefficient52_303,
  OriginalRow227TriangleData0767.coefficient52_304,
  OriginalRow227TriangleData0767.coefficient52_305,
  OriginalRow227TriangleData0767.coefficient52_306
]

theorem values0767_size : values0767.size = 32 := rfl

def block0767 : ℕ → Option IntervalDyadic := segment 275 values0767

theorem block0767_domain : ExactDomain block0767 275 307 := by
  simpa only [values0767_size] using segment_domain 275 values0767

theorem block0767_get (i : Fin 32) :
    block0767 (275 + i.val) = some (values0767[i.val]'(by rw [values0767_size]; exact i.isLt)) := by
  exact segment_get 275 values0767 ⟨i.val, by rw [values0767_size]; exact i.isLt⟩

def values0768 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0768.coefficient52_307,
  OriginalRow227TriangleData0768.coefficient52_308,
  OriginalRow227TriangleData0768.coefficient52_309,
  OriginalRow227TriangleData0768.coefficient52_310,
  OriginalRow227TriangleData0768.coefficient52_311,
  OriginalRow227TriangleData0768.coefficient52_312,
  OriginalRow227TriangleData0768.coefficient52_313,
  OriginalRow227TriangleData0768.coefficient52_314,
  OriginalRow227TriangleData0768.coefficient52_315,
  OriginalRow227TriangleData0768.coefficient52_316,
  OriginalRow227TriangleData0768.coefficient52_317,
  OriginalRow227TriangleData0768.coefficient52_318,
  OriginalRow227TriangleData0768.coefficient52_319,
  OriginalRow227TriangleData0768.coefficient52_320,
  OriginalRow227TriangleData0768.coefficient52_321,
  OriginalRow227TriangleData0768.coefficient52_322,
  OriginalRow227TriangleData0768.coefficient52_323,
  OriginalRow227TriangleData0768.coefficient52_324,
  OriginalRow227TriangleData0768.coefficient52_325,
  OriginalRow227TriangleData0768.coefficient52_326,
  OriginalRow227TriangleData0768.coefficient52_327,
  OriginalRow227TriangleData0768.coefficient52_328,
  OriginalRow227TriangleData0768.coefficient52_329,
  OriginalRow227TriangleData0768.coefficient52_330,
  OriginalRow227TriangleData0768.coefficient52_331,
  OriginalRow227TriangleData0768.coefficient52_332,
  OriginalRow227TriangleData0768.coefficient52_333,
  OriginalRow227TriangleData0768.coefficient52_334,
  OriginalRow227TriangleData0768.coefficient52_335,
  OriginalRow227TriangleData0768.coefficient52_336,
  OriginalRow227TriangleData0768.coefficient52_337,
  OriginalRow227TriangleData0768.coefficient52_338
]

theorem values0768_size : values0768.size = 32 := rfl

def block0768 : ℕ → Option IntervalDyadic := segment 307 values0768

theorem block0768_domain : ExactDomain block0768 307 339 := by
  simpa only [values0768_size] using segment_domain 307 values0768

theorem block0768_get (i : Fin 32) :
    block0768 (307 + i.val) = some (values0768[i.val]'(by rw [values0768_size]; exact i.isLt)) := by
  exact segment_get 307 values0768 ⟨i.val, by rw [values0768_size]; exact i.isLt⟩

def values0769 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0769.coefficient52_339,
  OriginalRow227TriangleData0769.coefficient52_340,
  OriginalRow227TriangleData0769.coefficient52_341,
  OriginalRow227TriangleData0769.coefficient52_342,
  OriginalRow227TriangleData0769.coefficient52_343,
  OriginalRow227TriangleData0769.coefficient52_344,
  OriginalRow227TriangleData0769.coefficient52_345,
  OriginalRow227TriangleData0769.coefficient52_346,
  OriginalRow227TriangleData0769.coefficient52_347,
  OriginalRow227TriangleData0769.coefficient52_348,
  OriginalRow227TriangleData0769.coefficient52_349,
  OriginalRow227TriangleData0769.coefficient52_350,
  OriginalRow227TriangleData0769.coefficient52_351,
  OriginalRow227TriangleData0769.coefficient52_352,
  OriginalRow227TriangleData0769.coefficient52_353,
  OriginalRow227TriangleData0769.coefficient52_354,
  OriginalRow227TriangleData0769.coefficient52_355,
  OriginalRow227TriangleData0769.coefficient52_356,
  OriginalRow227TriangleData0769.coefficient52_357,
  OriginalRow227TriangleData0769.coefficient52_358,
  OriginalRow227TriangleData0769.coefficient52_359,
  OriginalRow227TriangleData0769.coefficient52_360,
  OriginalRow227TriangleData0769.coefficient52_361,
  OriginalRow227TriangleData0769.coefficient52_362,
  OriginalRow227TriangleData0769.coefficient52_363,
  OriginalRow227TriangleData0769.coefficient52_364,
  OriginalRow227TriangleData0769.coefficient52_365,
  OriginalRow227TriangleData0769.coefficient52_366,
  OriginalRow227TriangleData0769.coefficient52_367,
  OriginalRow227TriangleData0769.coefficient52_368,
  OriginalRow227TriangleData0769.coefficient52_369,
  OriginalRow227TriangleData0769.coefficient52_370
]

theorem values0769_size : values0769.size = 32 := rfl

def block0769 : ℕ → Option IntervalDyadic := segment 339 values0769

theorem block0769_domain : ExactDomain block0769 339 371 := by
  simpa only [values0769_size] using segment_domain 339 values0769

theorem block0769_get (i : Fin 32) :
    block0769 (339 + i.val) = some (values0769[i.val]'(by rw [values0769_size]; exact i.isLt)) := by
  exact segment_get 339 values0769 ⟨i.val, by rw [values0769_size]; exact i.isLt⟩

def values0770 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0770.coefficient52_371,
  OriginalRow227TriangleData0770.coefficient52_372,
  OriginalRow227TriangleData0770.coefficient52_373,
  OriginalRow227TriangleData0770.coefficient52_374,
  OriginalRow227TriangleData0770.coefficient52_375,
  OriginalRow227TriangleData0770.coefficient52_376,
  OriginalRow227TriangleData0770.coefficient52_377,
  OriginalRow227TriangleData0770.coefficient52_378,
  OriginalRow227TriangleData0770.coefficient52_379,
  OriginalRow227TriangleData0770.coefficient52_380,
  OriginalRow227TriangleData0770.coefficient52_381,
  OriginalRow227TriangleData0770.coefficient52_382,
  OriginalRow227TriangleData0770.coefficient52_383,
  OriginalRow227TriangleData0770.coefficient52_384,
  OriginalRow227TriangleData0770.coefficient52_385,
  OriginalRow227TriangleData0770.coefficient52_386,
  OriginalRow227TriangleData0770.coefficient52_387,
  OriginalRow227TriangleData0770.coefficient52_388,
  OriginalRow227TriangleData0770.coefficient52_389,
  OriginalRow227TriangleData0770.coefficient52_390,
  OriginalRow227TriangleData0770.coefficient52_391,
  OriginalRow227TriangleData0770.coefficient52_392,
  OriginalRow227TriangleData0770.coefficient52_393,
  OriginalRow227TriangleData0770.coefficient52_394,
  OriginalRow227TriangleData0770.coefficient52_395,
  OriginalRow227TriangleData0770.coefficient52_396,
  OriginalRow227TriangleData0770.coefficient52_397,
  OriginalRow227TriangleData0770.coefficient52_398,
  OriginalRow227TriangleData0770.coefficient52_399,
  OriginalRow227TriangleData0770.coefficient52_400,
  OriginalRow227TriangleData0770.coefficient52_401,
  OriginalRow227TriangleData0770.coefficient52_402
]

theorem values0770_size : values0770.size = 32 := rfl

def block0770 : ℕ → Option IntervalDyadic := segment 371 values0770

theorem block0770_domain : ExactDomain block0770 371 403 := by
  simpa only [values0770_size] using segment_domain 371 values0770

theorem block0770_get (i : Fin 32) :
    block0770 (371 + i.val) = some (values0770[i.val]'(by rw [values0770_size]; exact i.isLt)) := by
  exact segment_get 371 values0770 ⟨i.val, by rw [values0770_size]; exact i.isLt⟩

def values0771 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0771.coefficient52_403,
  OriginalRow227TriangleData0771.coefficient52_404,
  OriginalRow227TriangleData0771.coefficient52_405,
  OriginalRow227TriangleData0771.coefficient52_406,
  OriginalRow227TriangleData0771.coefficient52_407,
  OriginalRow227TriangleData0771.coefficient52_408,
  OriginalRow227TriangleData0771.coefficient52_409,
  OriginalRow227TriangleData0771.coefficient52_410,
  OriginalRow227TriangleData0771.coefficient52_411,
  OriginalRow227TriangleData0771.coefficient52_412,
  OriginalRow227TriangleData0771.coefficient52_413,
  OriginalRow227TriangleData0771.coefficient52_414,
  OriginalRow227TriangleData0771.coefficient52_415,
  OriginalRow227TriangleData0771.coefficient52_416,
  OriginalRow227TriangleData0771.coefficient52_417,
  OriginalRow227TriangleData0771.coefficient52_418,
  OriginalRow227TriangleData0771.coefficient52_419,
  OriginalRow227TriangleData0771.coefficient52_420,
  OriginalRow227TriangleData0771.coefficient52_421,
  OriginalRow227TriangleData0771.coefficient52_422,
  OriginalRow227TriangleData0771.coefficient52_423,
  OriginalRow227TriangleData0771.coefficient52_424,
  OriginalRow227TriangleData0771.coefficient52_425,
  OriginalRow227TriangleData0771.coefficient52_426,
  OriginalRow227TriangleData0771.coefficient52_427,
  OriginalRow227TriangleData0771.coefficient52_428,
  OriginalRow227TriangleData0771.coefficient52_429,
  OriginalRow227TriangleData0771.coefficient52_430,
  OriginalRow227TriangleData0771.coefficient52_431,
  OriginalRow227TriangleData0771.coefficient52_432,
  OriginalRow227TriangleData0771.coefficient52_433,
  OriginalRow227TriangleData0771.coefficient52_434
]

theorem values0771_size : values0771.size = 32 := rfl

def block0771 : ℕ → Option IntervalDyadic := segment 403 values0771

theorem block0771_domain : ExactDomain block0771 403 435 := by
  simpa only [values0771_size] using segment_domain 403 values0771

theorem block0771_get (i : Fin 32) :
    block0771 (403 + i.val) = some (values0771[i.val]'(by rw [values0771_size]; exact i.isLt)) := by
  exact segment_get 403 values0771 ⟨i.val, by rw [values0771_size]; exact i.isLt⟩

def values0772 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0772.coefficient52_435,
  OriginalRow227TriangleData0772.coefficient52_436,
  OriginalRow227TriangleData0772.coefficient52_437,
  OriginalRow227TriangleData0772.coefficient52_438,
  OriginalRow227TriangleData0772.coefficient52_439,
  OriginalRow227TriangleData0772.coefficient52_440,
  OriginalRow227TriangleData0772.coefficient52_441,
  OriginalRow227TriangleData0772.coefficient52_442,
  OriginalRow227TriangleData0772.coefficient52_443,
  OriginalRow227TriangleData0772.coefficient52_444,
  OriginalRow227TriangleData0772.coefficient52_445,
  OriginalRow227TriangleData0772.coefficient52_446,
  OriginalRow227TriangleData0772.coefficient52_447,
  OriginalRow227TriangleData0772.coefficient52_448,
  OriginalRow227TriangleData0772.coefficient52_449
]

theorem values0772_size : values0772.size = 15 := rfl

def block0772 : ℕ → Option IntervalDyadic := segment 435 values0772

theorem block0772_domain : ExactDomain block0772 435 450 := by
  simpa only [values0772_size] using segment_domain 435 values0772

theorem block0772_get (i : Fin 15) :
    block0772 (435 + i.val) = some (values0772[i.val]'(by rw [values0772_size]; exact i.isLt)) := by
  exact segment_get 435 values0772 ⟨i.val, by rw [values0772_size]; exact i.isLt⟩

def node0083_0147 : ℕ → Option IntervalDyadic := split 115 block0761 block0762

theorem node0083_0147_domain : ExactDomain node0083_0147 83 147 := by
  exact split_domain (by decide) (by decide) block0761_domain block0762_domain

def node0051_0147 : ℕ → Option IntervalDyadic := split 83 block0760 node0083_0147

theorem node0051_0147_domain : ExactDomain node0051_0147 51 147 := by
  exact split_domain (by decide) (by decide) block0760_domain node0083_0147_domain

def node0179_0243 : ℕ → Option IntervalDyadic := split 211 block0764 block0765

theorem node0179_0243_domain : ExactDomain node0179_0243 179 243 := by
  exact split_domain (by decide) (by decide) block0764_domain block0765_domain

def node0147_0243 : ℕ → Option IntervalDyadic := split 179 block0763 node0179_0243

theorem node0147_0243_domain : ExactDomain node0147_0243 147 243 := by
  exact split_domain (by decide) (by decide) block0763_domain node0179_0243_domain

def node0051_0243 : ℕ → Option IntervalDyadic := split 147 node0051_0147 node0147_0243

theorem node0051_0243_domain : ExactDomain node0051_0243 51 243 := by
  exact split_domain (by decide) (by decide) node0051_0147_domain node0147_0243_domain

def node0275_0339 : ℕ → Option IntervalDyadic := split 307 block0767 block0768

theorem node0275_0339_domain : ExactDomain node0275_0339 275 339 := by
  exact split_domain (by decide) (by decide) block0767_domain block0768_domain

def node0243_0339 : ℕ → Option IntervalDyadic := split 275 block0766 node0275_0339

theorem node0243_0339_domain : ExactDomain node0243_0339 243 339 := by
  exact split_domain (by decide) (by decide) block0766_domain node0275_0339_domain

def node0339_0403 : ℕ → Option IntervalDyadic := split 371 block0769 block0770

theorem node0339_0403_domain : ExactDomain node0339_0403 339 403 := by
  exact split_domain (by decide) (by decide) block0769_domain block0770_domain

def node0403_0450 : ℕ → Option IntervalDyadic := split 435 block0771 block0772

theorem node0403_0450_domain : ExactDomain node0403_0450 403 450 := by
  exact split_domain (by decide) (by decide) block0771_domain block0772_domain

def node0339_0450 : ℕ → Option IntervalDyadic := split 403 node0339_0403 node0403_0450

theorem node0339_0450_domain : ExactDomain node0339_0450 339 450 := by
  exact split_domain (by decide) (by decide) node0339_0403_domain node0403_0450_domain

def node0243_0450 : ℕ → Option IntervalDyadic := split 339 node0243_0339 node0339_0450

theorem node0243_0450_domain : ExactDomain node0243_0450 243 450 := by
  exact split_domain (by decide) (by decide) node0243_0339_domain node0339_0450_domain

def node0051_0450 : ℕ → Option IntervalDyadic := split 243 node0051_0243 node0243_0450

theorem node0051_0450_domain : ExactDomain node0051_0450 51 450 := by
  exact split_domain (by decide) (by decide) node0051_0243_domain node0243_0450_domain

def lookup : ℕ → Option IntervalDyadic := node0051_0450

theorem lookup_domain : ExactDomain lookup 51 450 :=
  node0051_0450_domain

theorem block0760_lookup (i : Fin 32) :
    lookup (51 + i.val) = some (values0760[i.val]'(by rw [values0760_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (51 + i.val) = _
  rw [node0051_0450, split_left 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0051_0243, split_left 147 node0051_0147 node0147_0243 (by omega)]
  rw [node0051_0147, split_left 83 block0760 node0083_0147 (by omega)]
  exact block0760_get i

theorem block0761_lookup (i : Fin 32) :
    lookup (83 + i.val) = some (values0761[i.val]'(by rw [values0761_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (83 + i.val) = _
  rw [node0051_0450, split_left 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0051_0243, split_left 147 node0051_0147 node0147_0243 (by omega)]
  rw [node0051_0147, split_right 83 block0760 node0083_0147 (by omega)]
  rw [node0083_0147, split_left 115 block0761 block0762 (by omega)]
  exact block0761_get i

theorem block0762_lookup (i : Fin 32) :
    lookup (115 + i.val) = some (values0762[i.val]'(by rw [values0762_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (115 + i.val) = _
  rw [node0051_0450, split_left 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0051_0243, split_left 147 node0051_0147 node0147_0243 (by omega)]
  rw [node0051_0147, split_right 83 block0760 node0083_0147 (by omega)]
  rw [node0083_0147, split_right 115 block0761 block0762 (by omega)]
  exact block0762_get i

theorem block0763_lookup (i : Fin 32) :
    lookup (147 + i.val) = some (values0763[i.val]'(by rw [values0763_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (147 + i.val) = _
  rw [node0051_0450, split_left 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0051_0243, split_right 147 node0051_0147 node0147_0243 (by omega)]
  rw [node0147_0243, split_left 179 block0763 node0179_0243 (by omega)]
  exact block0763_get i

theorem block0764_lookup (i : Fin 32) :
    lookup (179 + i.val) = some (values0764[i.val]'(by rw [values0764_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (179 + i.val) = _
  rw [node0051_0450, split_left 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0051_0243, split_right 147 node0051_0147 node0147_0243 (by omega)]
  rw [node0147_0243, split_right 179 block0763 node0179_0243 (by omega)]
  rw [node0179_0243, split_left 211 block0764 block0765 (by omega)]
  exact block0764_get i

theorem block0765_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values0765[i.val]'(by rw [values0765_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (211 + i.val) = _
  rw [node0051_0450, split_left 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0051_0243, split_right 147 node0051_0147 node0147_0243 (by omega)]
  rw [node0147_0243, split_right 179 block0763 node0179_0243 (by omega)]
  rw [node0179_0243, split_right 211 block0764 block0765 (by omega)]
  exact block0765_get i

theorem block0766_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values0766[i.val]'(by rw [values0766_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (243 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_left 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0243_0339, split_left 275 block0766 node0275_0339 (by omega)]
  exact block0766_get i

theorem block0767_lookup (i : Fin 32) :
    lookup (275 + i.val) = some (values0767[i.val]'(by rw [values0767_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (275 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_left 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0243_0339, split_right 275 block0766 node0275_0339 (by omega)]
  rw [node0275_0339, split_left 307 block0767 block0768 (by omega)]
  exact block0767_get i

theorem block0768_lookup (i : Fin 32) :
    lookup (307 + i.val) = some (values0768[i.val]'(by rw [values0768_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (307 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_left 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0243_0339, split_right 275 block0766 node0275_0339 (by omega)]
  rw [node0275_0339, split_right 307 block0767 block0768 (by omega)]
  exact block0768_get i

theorem block0769_lookup (i : Fin 32) :
    lookup (339 + i.val) = some (values0769[i.val]'(by rw [values0769_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (339 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_right 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0339_0450, split_left 403 node0339_0403 node0403_0450 (by omega)]
  rw [node0339_0403, split_left 371 block0769 block0770 (by omega)]
  exact block0769_get i

theorem block0770_lookup (i : Fin 32) :
    lookup (371 + i.val) = some (values0770[i.val]'(by rw [values0770_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (371 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_right 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0339_0450, split_left 403 node0339_0403 node0403_0450 (by omega)]
  rw [node0339_0403, split_right 371 block0769 block0770 (by omega)]
  exact block0770_get i

theorem block0771_lookup (i : Fin 32) :
    lookup (403 + i.val) = some (values0771[i.val]'(by rw [values0771_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (403 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_right 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0339_0450, split_right 403 node0339_0403 node0403_0450 (by omega)]
  rw [node0403_0450, split_left 435 block0771 block0772 (by omega)]
  exact block0771_get i

theorem block0772_lookup (i : Fin 15) :
    lookup (435 + i.val) = some (values0772[i.val]'(by rw [values0772_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0051_0450 (435 + i.val) = _
  rw [node0051_0450, split_right 243 node0051_0243 node0243_0450 (by omega)]
  rw [node0243_0450, split_right 339 node0243_0339 node0339_0450 (by omega)]
  rw [node0339_0450, split_right 403 node0339_0403 node0403_0450 (by omega)]
  rw [node0403_0450, split_right 435 block0771 block0772 (by omega)]
  exact block0772_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0760_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0760_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0761_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0761_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0762_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0762_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0763_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0763_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0764_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0764_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0765_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0765_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0766_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0766_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0767_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0767_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0768_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0768_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0769_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0769_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0770_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0770_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0771_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0771_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0772_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0772_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0760_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0761_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0762_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0763_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0764_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0765_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0766_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0767_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0768_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0769_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0770_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0771_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow052.block0772_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow052
