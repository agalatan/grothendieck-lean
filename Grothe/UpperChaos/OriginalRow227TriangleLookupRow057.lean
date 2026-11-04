import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0825
import Grothe.UpperChaos.OriginalRow227TriangleData0826
import Grothe.UpperChaos.OriginalRow227TriangleData0827
import Grothe.UpperChaos.OriginalRow227TriangleData0828
import Grothe.UpperChaos.OriginalRow227TriangleData0829
import Grothe.UpperChaos.OriginalRow227TriangleData0830
import Grothe.UpperChaos.OriginalRow227TriangleData0831
import Grothe.UpperChaos.OriginalRow227TriangleData0832
import Grothe.UpperChaos.OriginalRow227TriangleData0833
import Grothe.UpperChaos.OriginalRow227TriangleData0834
import Grothe.UpperChaos.OriginalRow227TriangleData0835
import Grothe.UpperChaos.OriginalRow227TriangleData0836
import Grothe.UpperChaos.OriginalRow227TriangleData0837

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow057

open ConditionalTableLookup

def values0825 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0825.coefficient57_56,
  OriginalRow227TriangleData0825.coefficient57_57,
  OriginalRow227TriangleData0825.coefficient57_58,
  OriginalRow227TriangleData0825.coefficient57_59,
  OriginalRow227TriangleData0825.coefficient57_60,
  OriginalRow227TriangleData0825.coefficient57_61,
  OriginalRow227TriangleData0825.coefficient57_62,
  OriginalRow227TriangleData0825.coefficient57_63,
  OriginalRow227TriangleData0825.coefficient57_64,
  OriginalRow227TriangleData0825.coefficient57_65,
  OriginalRow227TriangleData0825.coefficient57_66,
  OriginalRow227TriangleData0825.coefficient57_67,
  OriginalRow227TriangleData0825.coefficient57_68,
  OriginalRow227TriangleData0825.coefficient57_69,
  OriginalRow227TriangleData0825.coefficient57_70,
  OriginalRow227TriangleData0825.coefficient57_71,
  OriginalRow227TriangleData0825.coefficient57_72,
  OriginalRow227TriangleData0825.coefficient57_73,
  OriginalRow227TriangleData0825.coefficient57_74,
  OriginalRow227TriangleData0825.coefficient57_75,
  OriginalRow227TriangleData0825.coefficient57_76,
  OriginalRow227TriangleData0825.coefficient57_77,
  OriginalRow227TriangleData0825.coefficient57_78,
  OriginalRow227TriangleData0825.coefficient57_79,
  OriginalRow227TriangleData0825.coefficient57_80,
  OriginalRow227TriangleData0825.coefficient57_81,
  OriginalRow227TriangleData0825.coefficient57_82,
  OriginalRow227TriangleData0825.coefficient57_83,
  OriginalRow227TriangleData0825.coefficient57_84,
  OriginalRow227TriangleData0825.coefficient57_85,
  OriginalRow227TriangleData0825.coefficient57_86,
  OriginalRow227TriangleData0825.coefficient57_87
]

theorem values0825_size : values0825.size = 32 := rfl

def block0825 : ℕ → Option IntervalDyadic := segment 56 values0825

theorem block0825_domain : ExactDomain block0825 56 88 := by
  simpa only [values0825_size] using segment_domain 56 values0825

theorem block0825_get (i : Fin 32) :
    block0825 (56 + i.val) = some (values0825[i.val]'(by rw [values0825_size]; exact i.isLt)) := by
  exact segment_get 56 values0825 ⟨i.val, by rw [values0825_size]; exact i.isLt⟩

def values0826 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0826.coefficient57_88,
  OriginalRow227TriangleData0826.coefficient57_89,
  OriginalRow227TriangleData0826.coefficient57_90,
  OriginalRow227TriangleData0826.coefficient57_91,
  OriginalRow227TriangleData0826.coefficient57_92,
  OriginalRow227TriangleData0826.coefficient57_93,
  OriginalRow227TriangleData0826.coefficient57_94,
  OriginalRow227TriangleData0826.coefficient57_95,
  OriginalRow227TriangleData0826.coefficient57_96,
  OriginalRow227TriangleData0826.coefficient57_97,
  OriginalRow227TriangleData0826.coefficient57_98,
  OriginalRow227TriangleData0826.coefficient57_99,
  OriginalRow227TriangleData0826.coefficient57_100,
  OriginalRow227TriangleData0826.coefficient57_101,
  OriginalRow227TriangleData0826.coefficient57_102,
  OriginalRow227TriangleData0826.coefficient57_103,
  OriginalRow227TriangleData0826.coefficient57_104,
  OriginalRow227TriangleData0826.coefficient57_105,
  OriginalRow227TriangleData0826.coefficient57_106,
  OriginalRow227TriangleData0826.coefficient57_107,
  OriginalRow227TriangleData0826.coefficient57_108,
  OriginalRow227TriangleData0826.coefficient57_109,
  OriginalRow227TriangleData0826.coefficient57_110,
  OriginalRow227TriangleData0826.coefficient57_111,
  OriginalRow227TriangleData0826.coefficient57_112,
  OriginalRow227TriangleData0826.coefficient57_113,
  OriginalRow227TriangleData0826.coefficient57_114,
  OriginalRow227TriangleData0826.coefficient57_115,
  OriginalRow227TriangleData0826.coefficient57_116,
  OriginalRow227TriangleData0826.coefficient57_117,
  OriginalRow227TriangleData0826.coefficient57_118,
  OriginalRow227TriangleData0826.coefficient57_119
]

theorem values0826_size : values0826.size = 32 := rfl

def block0826 : ℕ → Option IntervalDyadic := segment 88 values0826

theorem block0826_domain : ExactDomain block0826 88 120 := by
  simpa only [values0826_size] using segment_domain 88 values0826

theorem block0826_get (i : Fin 32) :
    block0826 (88 + i.val) = some (values0826[i.val]'(by rw [values0826_size]; exact i.isLt)) := by
  exact segment_get 88 values0826 ⟨i.val, by rw [values0826_size]; exact i.isLt⟩

def values0827 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0827.coefficient57_120,
  OriginalRow227TriangleData0827.coefficient57_121,
  OriginalRow227TriangleData0827.coefficient57_122,
  OriginalRow227TriangleData0827.coefficient57_123,
  OriginalRow227TriangleData0827.coefficient57_124,
  OriginalRow227TriangleData0827.coefficient57_125,
  OriginalRow227TriangleData0827.coefficient57_126,
  OriginalRow227TriangleData0827.coefficient57_127,
  OriginalRow227TriangleData0827.coefficient57_128,
  OriginalRow227TriangleData0827.coefficient57_129,
  OriginalRow227TriangleData0827.coefficient57_130,
  OriginalRow227TriangleData0827.coefficient57_131,
  OriginalRow227TriangleData0827.coefficient57_132,
  OriginalRow227TriangleData0827.coefficient57_133,
  OriginalRow227TriangleData0827.coefficient57_134,
  OriginalRow227TriangleData0827.coefficient57_135,
  OriginalRow227TriangleData0827.coefficient57_136,
  OriginalRow227TriangleData0827.coefficient57_137,
  OriginalRow227TriangleData0827.coefficient57_138,
  OriginalRow227TriangleData0827.coefficient57_139,
  OriginalRow227TriangleData0827.coefficient57_140,
  OriginalRow227TriangleData0827.coefficient57_141,
  OriginalRow227TriangleData0827.coefficient57_142,
  OriginalRow227TriangleData0827.coefficient57_143,
  OriginalRow227TriangleData0827.coefficient57_144,
  OriginalRow227TriangleData0827.coefficient57_145,
  OriginalRow227TriangleData0827.coefficient57_146,
  OriginalRow227TriangleData0827.coefficient57_147,
  OriginalRow227TriangleData0827.coefficient57_148,
  OriginalRow227TriangleData0827.coefficient57_149,
  OriginalRow227TriangleData0827.coefficient57_150,
  OriginalRow227TriangleData0827.coefficient57_151
]

theorem values0827_size : values0827.size = 32 := rfl

def block0827 : ℕ → Option IntervalDyadic := segment 120 values0827

theorem block0827_domain : ExactDomain block0827 120 152 := by
  simpa only [values0827_size] using segment_domain 120 values0827

theorem block0827_get (i : Fin 32) :
    block0827 (120 + i.val) = some (values0827[i.val]'(by rw [values0827_size]; exact i.isLt)) := by
  exact segment_get 120 values0827 ⟨i.val, by rw [values0827_size]; exact i.isLt⟩

def values0828 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0828.coefficient57_152,
  OriginalRow227TriangleData0828.coefficient57_153,
  OriginalRow227TriangleData0828.coefficient57_154,
  OriginalRow227TriangleData0828.coefficient57_155,
  OriginalRow227TriangleData0828.coefficient57_156,
  OriginalRow227TriangleData0828.coefficient57_157,
  OriginalRow227TriangleData0828.coefficient57_158,
  OriginalRow227TriangleData0828.coefficient57_159,
  OriginalRow227TriangleData0828.coefficient57_160,
  OriginalRow227TriangleData0828.coefficient57_161,
  OriginalRow227TriangleData0828.coefficient57_162,
  OriginalRow227TriangleData0828.coefficient57_163,
  OriginalRow227TriangleData0828.coefficient57_164,
  OriginalRow227TriangleData0828.coefficient57_165,
  OriginalRow227TriangleData0828.coefficient57_166,
  OriginalRow227TriangleData0828.coefficient57_167,
  OriginalRow227TriangleData0828.coefficient57_168,
  OriginalRow227TriangleData0828.coefficient57_169,
  OriginalRow227TriangleData0828.coefficient57_170,
  OriginalRow227TriangleData0828.coefficient57_171,
  OriginalRow227TriangleData0828.coefficient57_172,
  OriginalRow227TriangleData0828.coefficient57_173,
  OriginalRow227TriangleData0828.coefficient57_174,
  OriginalRow227TriangleData0828.coefficient57_175,
  OriginalRow227TriangleData0828.coefficient57_176,
  OriginalRow227TriangleData0828.coefficient57_177,
  OriginalRow227TriangleData0828.coefficient57_178,
  OriginalRow227TriangleData0828.coefficient57_179,
  OriginalRow227TriangleData0828.coefficient57_180,
  OriginalRow227TriangleData0828.coefficient57_181,
  OriginalRow227TriangleData0828.coefficient57_182,
  OriginalRow227TriangleData0828.coefficient57_183
]

theorem values0828_size : values0828.size = 32 := rfl

def block0828 : ℕ → Option IntervalDyadic := segment 152 values0828

theorem block0828_domain : ExactDomain block0828 152 184 := by
  simpa only [values0828_size] using segment_domain 152 values0828

theorem block0828_get (i : Fin 32) :
    block0828 (152 + i.val) = some (values0828[i.val]'(by rw [values0828_size]; exact i.isLt)) := by
  exact segment_get 152 values0828 ⟨i.val, by rw [values0828_size]; exact i.isLt⟩

def values0829 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0829.coefficient57_184,
  OriginalRow227TriangleData0829.coefficient57_185,
  OriginalRow227TriangleData0829.coefficient57_186,
  OriginalRow227TriangleData0829.coefficient57_187,
  OriginalRow227TriangleData0829.coefficient57_188,
  OriginalRow227TriangleData0829.coefficient57_189,
  OriginalRow227TriangleData0829.coefficient57_190,
  OriginalRow227TriangleData0829.coefficient57_191,
  OriginalRow227TriangleData0829.coefficient57_192,
  OriginalRow227TriangleData0829.coefficient57_193,
  OriginalRow227TriangleData0829.coefficient57_194,
  OriginalRow227TriangleData0829.coefficient57_195,
  OriginalRow227TriangleData0829.coefficient57_196,
  OriginalRow227TriangleData0829.coefficient57_197,
  OriginalRow227TriangleData0829.coefficient57_198,
  OriginalRow227TriangleData0829.coefficient57_199,
  OriginalRow227TriangleData0829.coefficient57_200,
  OriginalRow227TriangleData0829.coefficient57_201,
  OriginalRow227TriangleData0829.coefficient57_202,
  OriginalRow227TriangleData0829.coefficient57_203,
  OriginalRow227TriangleData0829.coefficient57_204,
  OriginalRow227TriangleData0829.coefficient57_205,
  OriginalRow227TriangleData0829.coefficient57_206,
  OriginalRow227TriangleData0829.coefficient57_207,
  OriginalRow227TriangleData0829.coefficient57_208,
  OriginalRow227TriangleData0829.coefficient57_209,
  OriginalRow227TriangleData0829.coefficient57_210,
  OriginalRow227TriangleData0829.coefficient57_211,
  OriginalRow227TriangleData0829.coefficient57_212,
  OriginalRow227TriangleData0829.coefficient57_213,
  OriginalRow227TriangleData0829.coefficient57_214,
  OriginalRow227TriangleData0829.coefficient57_215
]

theorem values0829_size : values0829.size = 32 := rfl

def block0829 : ℕ → Option IntervalDyadic := segment 184 values0829

theorem block0829_domain : ExactDomain block0829 184 216 := by
  simpa only [values0829_size] using segment_domain 184 values0829

theorem block0829_get (i : Fin 32) :
    block0829 (184 + i.val) = some (values0829[i.val]'(by rw [values0829_size]; exact i.isLt)) := by
  exact segment_get 184 values0829 ⟨i.val, by rw [values0829_size]; exact i.isLt⟩

def values0830 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0830.coefficient57_216,
  OriginalRow227TriangleData0830.coefficient57_217,
  OriginalRow227TriangleData0830.coefficient57_218,
  OriginalRow227TriangleData0830.coefficient57_219,
  OriginalRow227TriangleData0830.coefficient57_220,
  OriginalRow227TriangleData0830.coefficient57_221,
  OriginalRow227TriangleData0830.coefficient57_222,
  OriginalRow227TriangleData0830.coefficient57_223,
  OriginalRow227TriangleData0830.coefficient57_224,
  OriginalRow227TriangleData0830.coefficient57_225,
  OriginalRow227TriangleData0830.coefficient57_226,
  OriginalRow227TriangleData0830.coefficient57_227,
  OriginalRow227TriangleData0830.coefficient57_228,
  OriginalRow227TriangleData0830.coefficient57_229,
  OriginalRow227TriangleData0830.coefficient57_230,
  OriginalRow227TriangleData0830.coefficient57_231,
  OriginalRow227TriangleData0830.coefficient57_232,
  OriginalRow227TriangleData0830.coefficient57_233,
  OriginalRow227TriangleData0830.coefficient57_234,
  OriginalRow227TriangleData0830.coefficient57_235,
  OriginalRow227TriangleData0830.coefficient57_236,
  OriginalRow227TriangleData0830.coefficient57_237,
  OriginalRow227TriangleData0830.coefficient57_238,
  OriginalRow227TriangleData0830.coefficient57_239,
  OriginalRow227TriangleData0830.coefficient57_240,
  OriginalRow227TriangleData0830.coefficient57_241,
  OriginalRow227TriangleData0830.coefficient57_242,
  OriginalRow227TriangleData0830.coefficient57_243,
  OriginalRow227TriangleData0830.coefficient57_244,
  OriginalRow227TriangleData0830.coefficient57_245,
  OriginalRow227TriangleData0830.coefficient57_246,
  OriginalRow227TriangleData0830.coefficient57_247
]

theorem values0830_size : values0830.size = 32 := rfl

def block0830 : ℕ → Option IntervalDyadic := segment 216 values0830

theorem block0830_domain : ExactDomain block0830 216 248 := by
  simpa only [values0830_size] using segment_domain 216 values0830

theorem block0830_get (i : Fin 32) :
    block0830 (216 + i.val) = some (values0830[i.val]'(by rw [values0830_size]; exact i.isLt)) := by
  exact segment_get 216 values0830 ⟨i.val, by rw [values0830_size]; exact i.isLt⟩

def values0831 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0831.coefficient57_248,
  OriginalRow227TriangleData0831.coefficient57_249,
  OriginalRow227TriangleData0831.coefficient57_250,
  OriginalRow227TriangleData0831.coefficient57_251,
  OriginalRow227TriangleData0831.coefficient57_252,
  OriginalRow227TriangleData0831.coefficient57_253,
  OriginalRow227TriangleData0831.coefficient57_254,
  OriginalRow227TriangleData0831.coefficient57_255,
  OriginalRow227TriangleData0831.coefficient57_256,
  OriginalRow227TriangleData0831.coefficient57_257,
  OriginalRow227TriangleData0831.coefficient57_258,
  OriginalRow227TriangleData0831.coefficient57_259,
  OriginalRow227TriangleData0831.coefficient57_260,
  OriginalRow227TriangleData0831.coefficient57_261,
  OriginalRow227TriangleData0831.coefficient57_262,
  OriginalRow227TriangleData0831.coefficient57_263,
  OriginalRow227TriangleData0831.coefficient57_264,
  OriginalRow227TriangleData0831.coefficient57_265,
  OriginalRow227TriangleData0831.coefficient57_266,
  OriginalRow227TriangleData0831.coefficient57_267,
  OriginalRow227TriangleData0831.coefficient57_268,
  OriginalRow227TriangleData0831.coefficient57_269,
  OriginalRow227TriangleData0831.coefficient57_270,
  OriginalRow227TriangleData0831.coefficient57_271,
  OriginalRow227TriangleData0831.coefficient57_272,
  OriginalRow227TriangleData0831.coefficient57_273,
  OriginalRow227TriangleData0831.coefficient57_274,
  OriginalRow227TriangleData0831.coefficient57_275,
  OriginalRow227TriangleData0831.coefficient57_276,
  OriginalRow227TriangleData0831.coefficient57_277,
  OriginalRow227TriangleData0831.coefficient57_278,
  OriginalRow227TriangleData0831.coefficient57_279
]

theorem values0831_size : values0831.size = 32 := rfl

def block0831 : ℕ → Option IntervalDyadic := segment 248 values0831

theorem block0831_domain : ExactDomain block0831 248 280 := by
  simpa only [values0831_size] using segment_domain 248 values0831

theorem block0831_get (i : Fin 32) :
    block0831 (248 + i.val) = some (values0831[i.val]'(by rw [values0831_size]; exact i.isLt)) := by
  exact segment_get 248 values0831 ⟨i.val, by rw [values0831_size]; exact i.isLt⟩

def values0832 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0832.coefficient57_280,
  OriginalRow227TriangleData0832.coefficient57_281,
  OriginalRow227TriangleData0832.coefficient57_282,
  OriginalRow227TriangleData0832.coefficient57_283,
  OriginalRow227TriangleData0832.coefficient57_284,
  OriginalRow227TriangleData0832.coefficient57_285,
  OriginalRow227TriangleData0832.coefficient57_286,
  OriginalRow227TriangleData0832.coefficient57_287,
  OriginalRow227TriangleData0832.coefficient57_288,
  OriginalRow227TriangleData0832.coefficient57_289,
  OriginalRow227TriangleData0832.coefficient57_290,
  OriginalRow227TriangleData0832.coefficient57_291,
  OriginalRow227TriangleData0832.coefficient57_292,
  OriginalRow227TriangleData0832.coefficient57_293,
  OriginalRow227TriangleData0832.coefficient57_294,
  OriginalRow227TriangleData0832.coefficient57_295,
  OriginalRow227TriangleData0832.coefficient57_296,
  OriginalRow227TriangleData0832.coefficient57_297,
  OriginalRow227TriangleData0832.coefficient57_298,
  OriginalRow227TriangleData0832.coefficient57_299,
  OriginalRow227TriangleData0832.coefficient57_300,
  OriginalRow227TriangleData0832.coefficient57_301,
  OriginalRow227TriangleData0832.coefficient57_302,
  OriginalRow227TriangleData0832.coefficient57_303,
  OriginalRow227TriangleData0832.coefficient57_304,
  OriginalRow227TriangleData0832.coefficient57_305,
  OriginalRow227TriangleData0832.coefficient57_306,
  OriginalRow227TriangleData0832.coefficient57_307,
  OriginalRow227TriangleData0832.coefficient57_308,
  OriginalRow227TriangleData0832.coefficient57_309,
  OriginalRow227TriangleData0832.coefficient57_310,
  OriginalRow227TriangleData0832.coefficient57_311
]

theorem values0832_size : values0832.size = 32 := rfl

def block0832 : ℕ → Option IntervalDyadic := segment 280 values0832

theorem block0832_domain : ExactDomain block0832 280 312 := by
  simpa only [values0832_size] using segment_domain 280 values0832

theorem block0832_get (i : Fin 32) :
    block0832 (280 + i.val) = some (values0832[i.val]'(by rw [values0832_size]; exact i.isLt)) := by
  exact segment_get 280 values0832 ⟨i.val, by rw [values0832_size]; exact i.isLt⟩

def values0833 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0833.coefficient57_312,
  OriginalRow227TriangleData0833.coefficient57_313,
  OriginalRow227TriangleData0833.coefficient57_314,
  OriginalRow227TriangleData0833.coefficient57_315,
  OriginalRow227TriangleData0833.coefficient57_316,
  OriginalRow227TriangleData0833.coefficient57_317,
  OriginalRow227TriangleData0833.coefficient57_318,
  OriginalRow227TriangleData0833.coefficient57_319,
  OriginalRow227TriangleData0833.coefficient57_320,
  OriginalRow227TriangleData0833.coefficient57_321,
  OriginalRow227TriangleData0833.coefficient57_322,
  OriginalRow227TriangleData0833.coefficient57_323,
  OriginalRow227TriangleData0833.coefficient57_324,
  OriginalRow227TriangleData0833.coefficient57_325,
  OriginalRow227TriangleData0833.coefficient57_326,
  OriginalRow227TriangleData0833.coefficient57_327,
  OriginalRow227TriangleData0833.coefficient57_328,
  OriginalRow227TriangleData0833.coefficient57_329,
  OriginalRow227TriangleData0833.coefficient57_330,
  OriginalRow227TriangleData0833.coefficient57_331,
  OriginalRow227TriangleData0833.coefficient57_332,
  OriginalRow227TriangleData0833.coefficient57_333,
  OriginalRow227TriangleData0833.coefficient57_334,
  OriginalRow227TriangleData0833.coefficient57_335,
  OriginalRow227TriangleData0833.coefficient57_336,
  OriginalRow227TriangleData0833.coefficient57_337,
  OriginalRow227TriangleData0833.coefficient57_338,
  OriginalRow227TriangleData0833.coefficient57_339,
  OriginalRow227TriangleData0833.coefficient57_340,
  OriginalRow227TriangleData0833.coefficient57_341,
  OriginalRow227TriangleData0833.coefficient57_342,
  OriginalRow227TriangleData0833.coefficient57_343
]

theorem values0833_size : values0833.size = 32 := rfl

def block0833 : ℕ → Option IntervalDyadic := segment 312 values0833

theorem block0833_domain : ExactDomain block0833 312 344 := by
  simpa only [values0833_size] using segment_domain 312 values0833

theorem block0833_get (i : Fin 32) :
    block0833 (312 + i.val) = some (values0833[i.val]'(by rw [values0833_size]; exact i.isLt)) := by
  exact segment_get 312 values0833 ⟨i.val, by rw [values0833_size]; exact i.isLt⟩

def values0834 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0834.coefficient57_344,
  OriginalRow227TriangleData0834.coefficient57_345,
  OriginalRow227TriangleData0834.coefficient57_346,
  OriginalRow227TriangleData0834.coefficient57_347,
  OriginalRow227TriangleData0834.coefficient57_348,
  OriginalRow227TriangleData0834.coefficient57_349,
  OriginalRow227TriangleData0834.coefficient57_350,
  OriginalRow227TriangleData0834.coefficient57_351,
  OriginalRow227TriangleData0834.coefficient57_352,
  OriginalRow227TriangleData0834.coefficient57_353,
  OriginalRow227TriangleData0834.coefficient57_354,
  OriginalRow227TriangleData0834.coefficient57_355,
  OriginalRow227TriangleData0834.coefficient57_356,
  OriginalRow227TriangleData0834.coefficient57_357,
  OriginalRow227TriangleData0834.coefficient57_358,
  OriginalRow227TriangleData0834.coefficient57_359,
  OriginalRow227TriangleData0834.coefficient57_360,
  OriginalRow227TriangleData0834.coefficient57_361,
  OriginalRow227TriangleData0834.coefficient57_362,
  OriginalRow227TriangleData0834.coefficient57_363,
  OriginalRow227TriangleData0834.coefficient57_364,
  OriginalRow227TriangleData0834.coefficient57_365,
  OriginalRow227TriangleData0834.coefficient57_366,
  OriginalRow227TriangleData0834.coefficient57_367,
  OriginalRow227TriangleData0834.coefficient57_368,
  OriginalRow227TriangleData0834.coefficient57_369,
  OriginalRow227TriangleData0834.coefficient57_370,
  OriginalRow227TriangleData0834.coefficient57_371,
  OriginalRow227TriangleData0834.coefficient57_372,
  OriginalRow227TriangleData0834.coefficient57_373,
  OriginalRow227TriangleData0834.coefficient57_374,
  OriginalRow227TriangleData0834.coefficient57_375
]

theorem values0834_size : values0834.size = 32 := rfl

def block0834 : ℕ → Option IntervalDyadic := segment 344 values0834

theorem block0834_domain : ExactDomain block0834 344 376 := by
  simpa only [values0834_size] using segment_domain 344 values0834

theorem block0834_get (i : Fin 32) :
    block0834 (344 + i.val) = some (values0834[i.val]'(by rw [values0834_size]; exact i.isLt)) := by
  exact segment_get 344 values0834 ⟨i.val, by rw [values0834_size]; exact i.isLt⟩

def values0835 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0835.coefficient57_376,
  OriginalRow227TriangleData0835.coefficient57_377,
  OriginalRow227TriangleData0835.coefficient57_378,
  OriginalRow227TriangleData0835.coefficient57_379,
  OriginalRow227TriangleData0835.coefficient57_380,
  OriginalRow227TriangleData0835.coefficient57_381,
  OriginalRow227TriangleData0835.coefficient57_382,
  OriginalRow227TriangleData0835.coefficient57_383,
  OriginalRow227TriangleData0835.coefficient57_384,
  OriginalRow227TriangleData0835.coefficient57_385,
  OriginalRow227TriangleData0835.coefficient57_386,
  OriginalRow227TriangleData0835.coefficient57_387,
  OriginalRow227TriangleData0835.coefficient57_388,
  OriginalRow227TriangleData0835.coefficient57_389,
  OriginalRow227TriangleData0835.coefficient57_390,
  OriginalRow227TriangleData0835.coefficient57_391,
  OriginalRow227TriangleData0835.coefficient57_392,
  OriginalRow227TriangleData0835.coefficient57_393,
  OriginalRow227TriangleData0835.coefficient57_394,
  OriginalRow227TriangleData0835.coefficient57_395,
  OriginalRow227TriangleData0835.coefficient57_396,
  OriginalRow227TriangleData0835.coefficient57_397,
  OriginalRow227TriangleData0835.coefficient57_398,
  OriginalRow227TriangleData0835.coefficient57_399,
  OriginalRow227TriangleData0835.coefficient57_400,
  OriginalRow227TriangleData0835.coefficient57_401,
  OriginalRow227TriangleData0835.coefficient57_402,
  OriginalRow227TriangleData0835.coefficient57_403,
  OriginalRow227TriangleData0835.coefficient57_404,
  OriginalRow227TriangleData0835.coefficient57_405,
  OriginalRow227TriangleData0835.coefficient57_406,
  OriginalRow227TriangleData0835.coefficient57_407
]

theorem values0835_size : values0835.size = 32 := rfl

def block0835 : ℕ → Option IntervalDyadic := segment 376 values0835

theorem block0835_domain : ExactDomain block0835 376 408 := by
  simpa only [values0835_size] using segment_domain 376 values0835

theorem block0835_get (i : Fin 32) :
    block0835 (376 + i.val) = some (values0835[i.val]'(by rw [values0835_size]; exact i.isLt)) := by
  exact segment_get 376 values0835 ⟨i.val, by rw [values0835_size]; exact i.isLt⟩

def values0836 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0836.coefficient57_408,
  OriginalRow227TriangleData0836.coefficient57_409,
  OriginalRow227TriangleData0836.coefficient57_410,
  OriginalRow227TriangleData0836.coefficient57_411,
  OriginalRow227TriangleData0836.coefficient57_412,
  OriginalRow227TriangleData0836.coefficient57_413,
  OriginalRow227TriangleData0836.coefficient57_414,
  OriginalRow227TriangleData0836.coefficient57_415,
  OriginalRow227TriangleData0836.coefficient57_416,
  OriginalRow227TriangleData0836.coefficient57_417,
  OriginalRow227TriangleData0836.coefficient57_418,
  OriginalRow227TriangleData0836.coefficient57_419,
  OriginalRow227TriangleData0836.coefficient57_420,
  OriginalRow227TriangleData0836.coefficient57_421,
  OriginalRow227TriangleData0836.coefficient57_422,
  OriginalRow227TriangleData0836.coefficient57_423,
  OriginalRow227TriangleData0836.coefficient57_424,
  OriginalRow227TriangleData0836.coefficient57_425,
  OriginalRow227TriangleData0836.coefficient57_426,
  OriginalRow227TriangleData0836.coefficient57_427,
  OriginalRow227TriangleData0836.coefficient57_428,
  OriginalRow227TriangleData0836.coefficient57_429,
  OriginalRow227TriangleData0836.coefficient57_430,
  OriginalRow227TriangleData0836.coefficient57_431,
  OriginalRow227TriangleData0836.coefficient57_432,
  OriginalRow227TriangleData0836.coefficient57_433,
  OriginalRow227TriangleData0836.coefficient57_434,
  OriginalRow227TriangleData0836.coefficient57_435,
  OriginalRow227TriangleData0836.coefficient57_436,
  OriginalRow227TriangleData0836.coefficient57_437,
  OriginalRow227TriangleData0836.coefficient57_438,
  OriginalRow227TriangleData0836.coefficient57_439
]

theorem values0836_size : values0836.size = 32 := rfl

def block0836 : ℕ → Option IntervalDyadic := segment 408 values0836

theorem block0836_domain : ExactDomain block0836 408 440 := by
  simpa only [values0836_size] using segment_domain 408 values0836

theorem block0836_get (i : Fin 32) :
    block0836 (408 + i.val) = some (values0836[i.val]'(by rw [values0836_size]; exact i.isLt)) := by
  exact segment_get 408 values0836 ⟨i.val, by rw [values0836_size]; exact i.isLt⟩

def values0837 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0837.coefficient57_440,
  OriginalRow227TriangleData0837.coefficient57_441,
  OriginalRow227TriangleData0837.coefficient57_442,
  OriginalRow227TriangleData0837.coefficient57_443,
  OriginalRow227TriangleData0837.coefficient57_444
]

theorem values0837_size : values0837.size = 5 := rfl

def block0837 : ℕ → Option IntervalDyadic := segment 440 values0837

theorem block0837_domain : ExactDomain block0837 440 445 := by
  simpa only [values0837_size] using segment_domain 440 values0837

theorem block0837_get (i : Fin 5) :
    block0837 (440 + i.val) = some (values0837[i.val]'(by rw [values0837_size]; exact i.isLt)) := by
  exact segment_get 440 values0837 ⟨i.val, by rw [values0837_size]; exact i.isLt⟩

def node0088_0152 : ℕ → Option IntervalDyadic := split 120 block0826 block0827

theorem node0088_0152_domain : ExactDomain node0088_0152 88 152 := by
  exact split_domain (by decide) (by decide) block0826_domain block0827_domain

def node0056_0152 : ℕ → Option IntervalDyadic := split 88 block0825 node0088_0152

theorem node0056_0152_domain : ExactDomain node0056_0152 56 152 := by
  exact split_domain (by decide) (by decide) block0825_domain node0088_0152_domain

def node0184_0248 : ℕ → Option IntervalDyadic := split 216 block0829 block0830

theorem node0184_0248_domain : ExactDomain node0184_0248 184 248 := by
  exact split_domain (by decide) (by decide) block0829_domain block0830_domain

def node0152_0248 : ℕ → Option IntervalDyadic := split 184 block0828 node0184_0248

theorem node0152_0248_domain : ExactDomain node0152_0248 152 248 := by
  exact split_domain (by decide) (by decide) block0828_domain node0184_0248_domain

def node0056_0248 : ℕ → Option IntervalDyadic := split 152 node0056_0152 node0152_0248

theorem node0056_0248_domain : ExactDomain node0056_0248 56 248 := by
  exact split_domain (by decide) (by decide) node0056_0152_domain node0152_0248_domain

def node0280_0344 : ℕ → Option IntervalDyadic := split 312 block0832 block0833

theorem node0280_0344_domain : ExactDomain node0280_0344 280 344 := by
  exact split_domain (by decide) (by decide) block0832_domain block0833_domain

def node0248_0344 : ℕ → Option IntervalDyadic := split 280 block0831 node0280_0344

theorem node0248_0344_domain : ExactDomain node0248_0344 248 344 := by
  exact split_domain (by decide) (by decide) block0831_domain node0280_0344_domain

def node0344_0408 : ℕ → Option IntervalDyadic := split 376 block0834 block0835

theorem node0344_0408_domain : ExactDomain node0344_0408 344 408 := by
  exact split_domain (by decide) (by decide) block0834_domain block0835_domain

def node0408_0445 : ℕ → Option IntervalDyadic := split 440 block0836 block0837

theorem node0408_0445_domain : ExactDomain node0408_0445 408 445 := by
  exact split_domain (by decide) (by decide) block0836_domain block0837_domain

def node0344_0445 : ℕ → Option IntervalDyadic := split 408 node0344_0408 node0408_0445

theorem node0344_0445_domain : ExactDomain node0344_0445 344 445 := by
  exact split_domain (by decide) (by decide) node0344_0408_domain node0408_0445_domain

def node0248_0445 : ℕ → Option IntervalDyadic := split 344 node0248_0344 node0344_0445

theorem node0248_0445_domain : ExactDomain node0248_0445 248 445 := by
  exact split_domain (by decide) (by decide) node0248_0344_domain node0344_0445_domain

def node0056_0445 : ℕ → Option IntervalDyadic := split 248 node0056_0248 node0248_0445

theorem node0056_0445_domain : ExactDomain node0056_0445 56 445 := by
  exact split_domain (by decide) (by decide) node0056_0248_domain node0248_0445_domain

def lookup : ℕ → Option IntervalDyadic := node0056_0445

theorem lookup_domain : ExactDomain lookup 56 445 :=
  node0056_0445_domain

theorem block0825_lookup (i : Fin 32) :
    lookup (56 + i.val) = some (values0825[i.val]'(by rw [values0825_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (56 + i.val) = _
  rw [node0056_0445, split_left 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0056_0248, split_left 152 node0056_0152 node0152_0248 (by omega)]
  rw [node0056_0152, split_left 88 block0825 node0088_0152 (by omega)]
  exact block0825_get i

theorem block0826_lookup (i : Fin 32) :
    lookup (88 + i.val) = some (values0826[i.val]'(by rw [values0826_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (88 + i.val) = _
  rw [node0056_0445, split_left 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0056_0248, split_left 152 node0056_0152 node0152_0248 (by omega)]
  rw [node0056_0152, split_right 88 block0825 node0088_0152 (by omega)]
  rw [node0088_0152, split_left 120 block0826 block0827 (by omega)]
  exact block0826_get i

theorem block0827_lookup (i : Fin 32) :
    lookup (120 + i.val) = some (values0827[i.val]'(by rw [values0827_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (120 + i.val) = _
  rw [node0056_0445, split_left 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0056_0248, split_left 152 node0056_0152 node0152_0248 (by omega)]
  rw [node0056_0152, split_right 88 block0825 node0088_0152 (by omega)]
  rw [node0088_0152, split_right 120 block0826 block0827 (by omega)]
  exact block0827_get i

theorem block0828_lookup (i : Fin 32) :
    lookup (152 + i.val) = some (values0828[i.val]'(by rw [values0828_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (152 + i.val) = _
  rw [node0056_0445, split_left 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0056_0248, split_right 152 node0056_0152 node0152_0248 (by omega)]
  rw [node0152_0248, split_left 184 block0828 node0184_0248 (by omega)]
  exact block0828_get i

theorem block0829_lookup (i : Fin 32) :
    lookup (184 + i.val) = some (values0829[i.val]'(by rw [values0829_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (184 + i.val) = _
  rw [node0056_0445, split_left 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0056_0248, split_right 152 node0056_0152 node0152_0248 (by omega)]
  rw [node0152_0248, split_right 184 block0828 node0184_0248 (by omega)]
  rw [node0184_0248, split_left 216 block0829 block0830 (by omega)]
  exact block0829_get i

theorem block0830_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values0830[i.val]'(by rw [values0830_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (216 + i.val) = _
  rw [node0056_0445, split_left 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0056_0248, split_right 152 node0056_0152 node0152_0248 (by omega)]
  rw [node0152_0248, split_right 184 block0828 node0184_0248 (by omega)]
  rw [node0184_0248, split_right 216 block0829 block0830 (by omega)]
  exact block0830_get i

theorem block0831_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values0831[i.val]'(by rw [values0831_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (248 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_left 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0248_0344, split_left 280 block0831 node0280_0344 (by omega)]
  exact block0831_get i

theorem block0832_lookup (i : Fin 32) :
    lookup (280 + i.val) = some (values0832[i.val]'(by rw [values0832_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (280 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_left 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0248_0344, split_right 280 block0831 node0280_0344 (by omega)]
  rw [node0280_0344, split_left 312 block0832 block0833 (by omega)]
  exact block0832_get i

theorem block0833_lookup (i : Fin 32) :
    lookup (312 + i.val) = some (values0833[i.val]'(by rw [values0833_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (312 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_left 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0248_0344, split_right 280 block0831 node0280_0344 (by omega)]
  rw [node0280_0344, split_right 312 block0832 block0833 (by omega)]
  exact block0833_get i

theorem block0834_lookup (i : Fin 32) :
    lookup (344 + i.val) = some (values0834[i.val]'(by rw [values0834_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (344 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_right 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0344_0445, split_left 408 node0344_0408 node0408_0445 (by omega)]
  rw [node0344_0408, split_left 376 block0834 block0835 (by omega)]
  exact block0834_get i

theorem block0835_lookup (i : Fin 32) :
    lookup (376 + i.val) = some (values0835[i.val]'(by rw [values0835_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (376 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_right 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0344_0445, split_left 408 node0344_0408 node0408_0445 (by omega)]
  rw [node0344_0408, split_right 376 block0834 block0835 (by omega)]
  exact block0835_get i

theorem block0836_lookup (i : Fin 32) :
    lookup (408 + i.val) = some (values0836[i.val]'(by rw [values0836_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (408 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_right 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0344_0445, split_right 408 node0344_0408 node0408_0445 (by omega)]
  rw [node0408_0445, split_left 440 block0836 block0837 (by omega)]
  exact block0836_get i

theorem block0837_lookup (i : Fin 5) :
    lookup (440 + i.val) = some (values0837[i.val]'(by rw [values0837_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0056_0445 (440 + i.val) = _
  rw [node0056_0445, split_right 248 node0056_0248 node0248_0445 (by omega)]
  rw [node0248_0445, split_right 344 node0248_0344 node0344_0445 (by omega)]
  rw [node0344_0445, split_right 408 node0344_0408 node0408_0445 (by omega)]
  rw [node0408_0445, split_right 440 block0836 block0837 (by omega)]
  exact block0837_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0825_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0825_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0826_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0826_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0827_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0827_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0828_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0828_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0829_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0829_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0830_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0830_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0831_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0831_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0832_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0832_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0833_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0833_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0834_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0834_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0835_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0835_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0836_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0836_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0837_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0837_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0825_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0826_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0827_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0828_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0829_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0830_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0831_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0832_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0833_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0834_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0835_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0836_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow057.block0837_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow057
