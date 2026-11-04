import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0799
import Grothe.UpperChaos.OriginalRow227TriangleData0800
import Grothe.UpperChaos.OriginalRow227TriangleData0801
import Grothe.UpperChaos.OriginalRow227TriangleData0802
import Grothe.UpperChaos.OriginalRow227TriangleData0803
import Grothe.UpperChaos.OriginalRow227TriangleData0804
import Grothe.UpperChaos.OriginalRow227TriangleData0805
import Grothe.UpperChaos.OriginalRow227TriangleData0806
import Grothe.UpperChaos.OriginalRow227TriangleData0807
import Grothe.UpperChaos.OriginalRow227TriangleData0808
import Grothe.UpperChaos.OriginalRow227TriangleData0809
import Grothe.UpperChaos.OriginalRow227TriangleData0810
import Grothe.UpperChaos.OriginalRow227TriangleData0811

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow055

open ConditionalTableLookup

def values0799 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0799.coefficient55_54,
  OriginalRow227TriangleData0799.coefficient55_55,
  OriginalRow227TriangleData0799.coefficient55_56,
  OriginalRow227TriangleData0799.coefficient55_57,
  OriginalRow227TriangleData0799.coefficient55_58,
  OriginalRow227TriangleData0799.coefficient55_59,
  OriginalRow227TriangleData0799.coefficient55_60,
  OriginalRow227TriangleData0799.coefficient55_61,
  OriginalRow227TriangleData0799.coefficient55_62,
  OriginalRow227TriangleData0799.coefficient55_63,
  OriginalRow227TriangleData0799.coefficient55_64,
  OriginalRow227TriangleData0799.coefficient55_65,
  OriginalRow227TriangleData0799.coefficient55_66,
  OriginalRow227TriangleData0799.coefficient55_67,
  OriginalRow227TriangleData0799.coefficient55_68,
  OriginalRow227TriangleData0799.coefficient55_69,
  OriginalRow227TriangleData0799.coefficient55_70,
  OriginalRow227TriangleData0799.coefficient55_71,
  OriginalRow227TriangleData0799.coefficient55_72,
  OriginalRow227TriangleData0799.coefficient55_73,
  OriginalRow227TriangleData0799.coefficient55_74,
  OriginalRow227TriangleData0799.coefficient55_75,
  OriginalRow227TriangleData0799.coefficient55_76,
  OriginalRow227TriangleData0799.coefficient55_77,
  OriginalRow227TriangleData0799.coefficient55_78,
  OriginalRow227TriangleData0799.coefficient55_79,
  OriginalRow227TriangleData0799.coefficient55_80,
  OriginalRow227TriangleData0799.coefficient55_81,
  OriginalRow227TriangleData0799.coefficient55_82,
  OriginalRow227TriangleData0799.coefficient55_83,
  OriginalRow227TriangleData0799.coefficient55_84,
  OriginalRow227TriangleData0799.coefficient55_85
]

theorem values0799_size : values0799.size = 32 := rfl

def block0799 : ℕ → Option IntervalDyadic := segment 54 values0799

theorem block0799_domain : ExactDomain block0799 54 86 := by
  simpa only [values0799_size] using segment_domain 54 values0799

theorem block0799_get (i : Fin 32) :
    block0799 (54 + i.val) = some (values0799[i.val]'(by rw [values0799_size]; exact i.isLt)) := by
  exact segment_get 54 values0799 ⟨i.val, by rw [values0799_size]; exact i.isLt⟩

def values0800 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0800.coefficient55_86,
  OriginalRow227TriangleData0800.coefficient55_87,
  OriginalRow227TriangleData0800.coefficient55_88,
  OriginalRow227TriangleData0800.coefficient55_89,
  OriginalRow227TriangleData0800.coefficient55_90,
  OriginalRow227TriangleData0800.coefficient55_91,
  OriginalRow227TriangleData0800.coefficient55_92,
  OriginalRow227TriangleData0800.coefficient55_93,
  OriginalRow227TriangleData0800.coefficient55_94,
  OriginalRow227TriangleData0800.coefficient55_95,
  OriginalRow227TriangleData0800.coefficient55_96,
  OriginalRow227TriangleData0800.coefficient55_97,
  OriginalRow227TriangleData0800.coefficient55_98,
  OriginalRow227TriangleData0800.coefficient55_99,
  OriginalRow227TriangleData0800.coefficient55_100,
  OriginalRow227TriangleData0800.coefficient55_101,
  OriginalRow227TriangleData0800.coefficient55_102,
  OriginalRow227TriangleData0800.coefficient55_103,
  OriginalRow227TriangleData0800.coefficient55_104,
  OriginalRow227TriangleData0800.coefficient55_105,
  OriginalRow227TriangleData0800.coefficient55_106,
  OriginalRow227TriangleData0800.coefficient55_107,
  OriginalRow227TriangleData0800.coefficient55_108,
  OriginalRow227TriangleData0800.coefficient55_109,
  OriginalRow227TriangleData0800.coefficient55_110,
  OriginalRow227TriangleData0800.coefficient55_111,
  OriginalRow227TriangleData0800.coefficient55_112,
  OriginalRow227TriangleData0800.coefficient55_113,
  OriginalRow227TriangleData0800.coefficient55_114,
  OriginalRow227TriangleData0800.coefficient55_115,
  OriginalRow227TriangleData0800.coefficient55_116,
  OriginalRow227TriangleData0800.coefficient55_117
]

theorem values0800_size : values0800.size = 32 := rfl

def block0800 : ℕ → Option IntervalDyadic := segment 86 values0800

theorem block0800_domain : ExactDomain block0800 86 118 := by
  simpa only [values0800_size] using segment_domain 86 values0800

theorem block0800_get (i : Fin 32) :
    block0800 (86 + i.val) = some (values0800[i.val]'(by rw [values0800_size]; exact i.isLt)) := by
  exact segment_get 86 values0800 ⟨i.val, by rw [values0800_size]; exact i.isLt⟩

def values0801 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0801.coefficient55_118,
  OriginalRow227TriangleData0801.coefficient55_119,
  OriginalRow227TriangleData0801.coefficient55_120,
  OriginalRow227TriangleData0801.coefficient55_121,
  OriginalRow227TriangleData0801.coefficient55_122,
  OriginalRow227TriangleData0801.coefficient55_123,
  OriginalRow227TriangleData0801.coefficient55_124,
  OriginalRow227TriangleData0801.coefficient55_125,
  OriginalRow227TriangleData0801.coefficient55_126,
  OriginalRow227TriangleData0801.coefficient55_127,
  OriginalRow227TriangleData0801.coefficient55_128,
  OriginalRow227TriangleData0801.coefficient55_129,
  OriginalRow227TriangleData0801.coefficient55_130,
  OriginalRow227TriangleData0801.coefficient55_131,
  OriginalRow227TriangleData0801.coefficient55_132,
  OriginalRow227TriangleData0801.coefficient55_133,
  OriginalRow227TriangleData0801.coefficient55_134,
  OriginalRow227TriangleData0801.coefficient55_135,
  OriginalRow227TriangleData0801.coefficient55_136,
  OriginalRow227TriangleData0801.coefficient55_137,
  OriginalRow227TriangleData0801.coefficient55_138,
  OriginalRow227TriangleData0801.coefficient55_139,
  OriginalRow227TriangleData0801.coefficient55_140,
  OriginalRow227TriangleData0801.coefficient55_141,
  OriginalRow227TriangleData0801.coefficient55_142,
  OriginalRow227TriangleData0801.coefficient55_143,
  OriginalRow227TriangleData0801.coefficient55_144,
  OriginalRow227TriangleData0801.coefficient55_145,
  OriginalRow227TriangleData0801.coefficient55_146,
  OriginalRow227TriangleData0801.coefficient55_147,
  OriginalRow227TriangleData0801.coefficient55_148,
  OriginalRow227TriangleData0801.coefficient55_149
]

theorem values0801_size : values0801.size = 32 := rfl

def block0801 : ℕ → Option IntervalDyadic := segment 118 values0801

theorem block0801_domain : ExactDomain block0801 118 150 := by
  simpa only [values0801_size] using segment_domain 118 values0801

theorem block0801_get (i : Fin 32) :
    block0801 (118 + i.val) = some (values0801[i.val]'(by rw [values0801_size]; exact i.isLt)) := by
  exact segment_get 118 values0801 ⟨i.val, by rw [values0801_size]; exact i.isLt⟩

def values0802 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0802.coefficient55_150,
  OriginalRow227TriangleData0802.coefficient55_151,
  OriginalRow227TriangleData0802.coefficient55_152,
  OriginalRow227TriangleData0802.coefficient55_153,
  OriginalRow227TriangleData0802.coefficient55_154,
  OriginalRow227TriangleData0802.coefficient55_155,
  OriginalRow227TriangleData0802.coefficient55_156,
  OriginalRow227TriangleData0802.coefficient55_157,
  OriginalRow227TriangleData0802.coefficient55_158,
  OriginalRow227TriangleData0802.coefficient55_159,
  OriginalRow227TriangleData0802.coefficient55_160,
  OriginalRow227TriangleData0802.coefficient55_161,
  OriginalRow227TriangleData0802.coefficient55_162,
  OriginalRow227TriangleData0802.coefficient55_163,
  OriginalRow227TriangleData0802.coefficient55_164,
  OriginalRow227TriangleData0802.coefficient55_165,
  OriginalRow227TriangleData0802.coefficient55_166,
  OriginalRow227TriangleData0802.coefficient55_167,
  OriginalRow227TriangleData0802.coefficient55_168,
  OriginalRow227TriangleData0802.coefficient55_169,
  OriginalRow227TriangleData0802.coefficient55_170,
  OriginalRow227TriangleData0802.coefficient55_171,
  OriginalRow227TriangleData0802.coefficient55_172,
  OriginalRow227TriangleData0802.coefficient55_173,
  OriginalRow227TriangleData0802.coefficient55_174,
  OriginalRow227TriangleData0802.coefficient55_175,
  OriginalRow227TriangleData0802.coefficient55_176,
  OriginalRow227TriangleData0802.coefficient55_177,
  OriginalRow227TriangleData0802.coefficient55_178,
  OriginalRow227TriangleData0802.coefficient55_179,
  OriginalRow227TriangleData0802.coefficient55_180,
  OriginalRow227TriangleData0802.coefficient55_181
]

theorem values0802_size : values0802.size = 32 := rfl

def block0802 : ℕ → Option IntervalDyadic := segment 150 values0802

theorem block0802_domain : ExactDomain block0802 150 182 := by
  simpa only [values0802_size] using segment_domain 150 values0802

theorem block0802_get (i : Fin 32) :
    block0802 (150 + i.val) = some (values0802[i.val]'(by rw [values0802_size]; exact i.isLt)) := by
  exact segment_get 150 values0802 ⟨i.val, by rw [values0802_size]; exact i.isLt⟩

def values0803 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0803.coefficient55_182,
  OriginalRow227TriangleData0803.coefficient55_183,
  OriginalRow227TriangleData0803.coefficient55_184,
  OriginalRow227TriangleData0803.coefficient55_185,
  OriginalRow227TriangleData0803.coefficient55_186,
  OriginalRow227TriangleData0803.coefficient55_187,
  OriginalRow227TriangleData0803.coefficient55_188,
  OriginalRow227TriangleData0803.coefficient55_189,
  OriginalRow227TriangleData0803.coefficient55_190,
  OriginalRow227TriangleData0803.coefficient55_191,
  OriginalRow227TriangleData0803.coefficient55_192,
  OriginalRow227TriangleData0803.coefficient55_193,
  OriginalRow227TriangleData0803.coefficient55_194,
  OriginalRow227TriangleData0803.coefficient55_195,
  OriginalRow227TriangleData0803.coefficient55_196,
  OriginalRow227TriangleData0803.coefficient55_197,
  OriginalRow227TriangleData0803.coefficient55_198,
  OriginalRow227TriangleData0803.coefficient55_199,
  OriginalRow227TriangleData0803.coefficient55_200,
  OriginalRow227TriangleData0803.coefficient55_201,
  OriginalRow227TriangleData0803.coefficient55_202,
  OriginalRow227TriangleData0803.coefficient55_203,
  OriginalRow227TriangleData0803.coefficient55_204,
  OriginalRow227TriangleData0803.coefficient55_205,
  OriginalRow227TriangleData0803.coefficient55_206,
  OriginalRow227TriangleData0803.coefficient55_207,
  OriginalRow227TriangleData0803.coefficient55_208,
  OriginalRow227TriangleData0803.coefficient55_209,
  OriginalRow227TriangleData0803.coefficient55_210,
  OriginalRow227TriangleData0803.coefficient55_211,
  OriginalRow227TriangleData0803.coefficient55_212,
  OriginalRow227TriangleData0803.coefficient55_213
]

theorem values0803_size : values0803.size = 32 := rfl

def block0803 : ℕ → Option IntervalDyadic := segment 182 values0803

theorem block0803_domain : ExactDomain block0803 182 214 := by
  simpa only [values0803_size] using segment_domain 182 values0803

theorem block0803_get (i : Fin 32) :
    block0803 (182 + i.val) = some (values0803[i.val]'(by rw [values0803_size]; exact i.isLt)) := by
  exact segment_get 182 values0803 ⟨i.val, by rw [values0803_size]; exact i.isLt⟩

def values0804 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0804.coefficient55_214,
  OriginalRow227TriangleData0804.coefficient55_215,
  OriginalRow227TriangleData0804.coefficient55_216,
  OriginalRow227TriangleData0804.coefficient55_217,
  OriginalRow227TriangleData0804.coefficient55_218,
  OriginalRow227TriangleData0804.coefficient55_219,
  OriginalRow227TriangleData0804.coefficient55_220,
  OriginalRow227TriangleData0804.coefficient55_221,
  OriginalRow227TriangleData0804.coefficient55_222,
  OriginalRow227TriangleData0804.coefficient55_223,
  OriginalRow227TriangleData0804.coefficient55_224,
  OriginalRow227TriangleData0804.coefficient55_225,
  OriginalRow227TriangleData0804.coefficient55_226,
  OriginalRow227TriangleData0804.coefficient55_227,
  OriginalRow227TriangleData0804.coefficient55_228,
  OriginalRow227TriangleData0804.coefficient55_229,
  OriginalRow227TriangleData0804.coefficient55_230,
  OriginalRow227TriangleData0804.coefficient55_231,
  OriginalRow227TriangleData0804.coefficient55_232,
  OriginalRow227TriangleData0804.coefficient55_233,
  OriginalRow227TriangleData0804.coefficient55_234,
  OriginalRow227TriangleData0804.coefficient55_235,
  OriginalRow227TriangleData0804.coefficient55_236,
  OriginalRow227TriangleData0804.coefficient55_237,
  OriginalRow227TriangleData0804.coefficient55_238,
  OriginalRow227TriangleData0804.coefficient55_239,
  OriginalRow227TriangleData0804.coefficient55_240,
  OriginalRow227TriangleData0804.coefficient55_241,
  OriginalRow227TriangleData0804.coefficient55_242,
  OriginalRow227TriangleData0804.coefficient55_243,
  OriginalRow227TriangleData0804.coefficient55_244,
  OriginalRow227TriangleData0804.coefficient55_245
]

theorem values0804_size : values0804.size = 32 := rfl

def block0804 : ℕ → Option IntervalDyadic := segment 214 values0804

theorem block0804_domain : ExactDomain block0804 214 246 := by
  simpa only [values0804_size] using segment_domain 214 values0804

theorem block0804_get (i : Fin 32) :
    block0804 (214 + i.val) = some (values0804[i.val]'(by rw [values0804_size]; exact i.isLt)) := by
  exact segment_get 214 values0804 ⟨i.val, by rw [values0804_size]; exact i.isLt⟩

def values0805 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0805.coefficient55_246,
  OriginalRow227TriangleData0805.coefficient55_247,
  OriginalRow227TriangleData0805.coefficient55_248,
  OriginalRow227TriangleData0805.coefficient55_249,
  OriginalRow227TriangleData0805.coefficient55_250,
  OriginalRow227TriangleData0805.coefficient55_251,
  OriginalRow227TriangleData0805.coefficient55_252,
  OriginalRow227TriangleData0805.coefficient55_253,
  OriginalRow227TriangleData0805.coefficient55_254,
  OriginalRow227TriangleData0805.coefficient55_255,
  OriginalRow227TriangleData0805.coefficient55_256,
  OriginalRow227TriangleData0805.coefficient55_257,
  OriginalRow227TriangleData0805.coefficient55_258,
  OriginalRow227TriangleData0805.coefficient55_259,
  OriginalRow227TriangleData0805.coefficient55_260,
  OriginalRow227TriangleData0805.coefficient55_261,
  OriginalRow227TriangleData0805.coefficient55_262,
  OriginalRow227TriangleData0805.coefficient55_263,
  OriginalRow227TriangleData0805.coefficient55_264,
  OriginalRow227TriangleData0805.coefficient55_265,
  OriginalRow227TriangleData0805.coefficient55_266,
  OriginalRow227TriangleData0805.coefficient55_267,
  OriginalRow227TriangleData0805.coefficient55_268,
  OriginalRow227TriangleData0805.coefficient55_269,
  OriginalRow227TriangleData0805.coefficient55_270,
  OriginalRow227TriangleData0805.coefficient55_271,
  OriginalRow227TriangleData0805.coefficient55_272,
  OriginalRow227TriangleData0805.coefficient55_273,
  OriginalRow227TriangleData0805.coefficient55_274,
  OriginalRow227TriangleData0805.coefficient55_275,
  OriginalRow227TriangleData0805.coefficient55_276,
  OriginalRow227TriangleData0805.coefficient55_277
]

theorem values0805_size : values0805.size = 32 := rfl

def block0805 : ℕ → Option IntervalDyadic := segment 246 values0805

theorem block0805_domain : ExactDomain block0805 246 278 := by
  simpa only [values0805_size] using segment_domain 246 values0805

theorem block0805_get (i : Fin 32) :
    block0805 (246 + i.val) = some (values0805[i.val]'(by rw [values0805_size]; exact i.isLt)) := by
  exact segment_get 246 values0805 ⟨i.val, by rw [values0805_size]; exact i.isLt⟩

def values0806 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0806.coefficient55_278,
  OriginalRow227TriangleData0806.coefficient55_279,
  OriginalRow227TriangleData0806.coefficient55_280,
  OriginalRow227TriangleData0806.coefficient55_281,
  OriginalRow227TriangleData0806.coefficient55_282,
  OriginalRow227TriangleData0806.coefficient55_283,
  OriginalRow227TriangleData0806.coefficient55_284,
  OriginalRow227TriangleData0806.coefficient55_285,
  OriginalRow227TriangleData0806.coefficient55_286,
  OriginalRow227TriangleData0806.coefficient55_287,
  OriginalRow227TriangleData0806.coefficient55_288,
  OriginalRow227TriangleData0806.coefficient55_289,
  OriginalRow227TriangleData0806.coefficient55_290,
  OriginalRow227TriangleData0806.coefficient55_291,
  OriginalRow227TriangleData0806.coefficient55_292,
  OriginalRow227TriangleData0806.coefficient55_293,
  OriginalRow227TriangleData0806.coefficient55_294,
  OriginalRow227TriangleData0806.coefficient55_295,
  OriginalRow227TriangleData0806.coefficient55_296,
  OriginalRow227TriangleData0806.coefficient55_297,
  OriginalRow227TriangleData0806.coefficient55_298,
  OriginalRow227TriangleData0806.coefficient55_299,
  OriginalRow227TriangleData0806.coefficient55_300,
  OriginalRow227TriangleData0806.coefficient55_301,
  OriginalRow227TriangleData0806.coefficient55_302,
  OriginalRow227TriangleData0806.coefficient55_303,
  OriginalRow227TriangleData0806.coefficient55_304,
  OriginalRow227TriangleData0806.coefficient55_305,
  OriginalRow227TriangleData0806.coefficient55_306,
  OriginalRow227TriangleData0806.coefficient55_307,
  OriginalRow227TriangleData0806.coefficient55_308,
  OriginalRow227TriangleData0806.coefficient55_309
]

theorem values0806_size : values0806.size = 32 := rfl

def block0806 : ℕ → Option IntervalDyadic := segment 278 values0806

theorem block0806_domain : ExactDomain block0806 278 310 := by
  simpa only [values0806_size] using segment_domain 278 values0806

theorem block0806_get (i : Fin 32) :
    block0806 (278 + i.val) = some (values0806[i.val]'(by rw [values0806_size]; exact i.isLt)) := by
  exact segment_get 278 values0806 ⟨i.val, by rw [values0806_size]; exact i.isLt⟩

def values0807 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0807.coefficient55_310,
  OriginalRow227TriangleData0807.coefficient55_311,
  OriginalRow227TriangleData0807.coefficient55_312,
  OriginalRow227TriangleData0807.coefficient55_313,
  OriginalRow227TriangleData0807.coefficient55_314,
  OriginalRow227TriangleData0807.coefficient55_315,
  OriginalRow227TriangleData0807.coefficient55_316,
  OriginalRow227TriangleData0807.coefficient55_317,
  OriginalRow227TriangleData0807.coefficient55_318,
  OriginalRow227TriangleData0807.coefficient55_319,
  OriginalRow227TriangleData0807.coefficient55_320,
  OriginalRow227TriangleData0807.coefficient55_321,
  OriginalRow227TriangleData0807.coefficient55_322,
  OriginalRow227TriangleData0807.coefficient55_323,
  OriginalRow227TriangleData0807.coefficient55_324,
  OriginalRow227TriangleData0807.coefficient55_325,
  OriginalRow227TriangleData0807.coefficient55_326,
  OriginalRow227TriangleData0807.coefficient55_327,
  OriginalRow227TriangleData0807.coefficient55_328,
  OriginalRow227TriangleData0807.coefficient55_329,
  OriginalRow227TriangleData0807.coefficient55_330,
  OriginalRow227TriangleData0807.coefficient55_331,
  OriginalRow227TriangleData0807.coefficient55_332,
  OriginalRow227TriangleData0807.coefficient55_333,
  OriginalRow227TriangleData0807.coefficient55_334,
  OriginalRow227TriangleData0807.coefficient55_335,
  OriginalRow227TriangleData0807.coefficient55_336,
  OriginalRow227TriangleData0807.coefficient55_337,
  OriginalRow227TriangleData0807.coefficient55_338,
  OriginalRow227TriangleData0807.coefficient55_339,
  OriginalRow227TriangleData0807.coefficient55_340,
  OriginalRow227TriangleData0807.coefficient55_341
]

theorem values0807_size : values0807.size = 32 := rfl

def block0807 : ℕ → Option IntervalDyadic := segment 310 values0807

theorem block0807_domain : ExactDomain block0807 310 342 := by
  simpa only [values0807_size] using segment_domain 310 values0807

theorem block0807_get (i : Fin 32) :
    block0807 (310 + i.val) = some (values0807[i.val]'(by rw [values0807_size]; exact i.isLt)) := by
  exact segment_get 310 values0807 ⟨i.val, by rw [values0807_size]; exact i.isLt⟩

def values0808 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0808.coefficient55_342,
  OriginalRow227TriangleData0808.coefficient55_343,
  OriginalRow227TriangleData0808.coefficient55_344,
  OriginalRow227TriangleData0808.coefficient55_345,
  OriginalRow227TriangleData0808.coefficient55_346,
  OriginalRow227TriangleData0808.coefficient55_347,
  OriginalRow227TriangleData0808.coefficient55_348,
  OriginalRow227TriangleData0808.coefficient55_349,
  OriginalRow227TriangleData0808.coefficient55_350,
  OriginalRow227TriangleData0808.coefficient55_351,
  OriginalRow227TriangleData0808.coefficient55_352,
  OriginalRow227TriangleData0808.coefficient55_353,
  OriginalRow227TriangleData0808.coefficient55_354,
  OriginalRow227TriangleData0808.coefficient55_355,
  OriginalRow227TriangleData0808.coefficient55_356,
  OriginalRow227TriangleData0808.coefficient55_357,
  OriginalRow227TriangleData0808.coefficient55_358,
  OriginalRow227TriangleData0808.coefficient55_359,
  OriginalRow227TriangleData0808.coefficient55_360,
  OriginalRow227TriangleData0808.coefficient55_361,
  OriginalRow227TriangleData0808.coefficient55_362,
  OriginalRow227TriangleData0808.coefficient55_363,
  OriginalRow227TriangleData0808.coefficient55_364,
  OriginalRow227TriangleData0808.coefficient55_365,
  OriginalRow227TriangleData0808.coefficient55_366,
  OriginalRow227TriangleData0808.coefficient55_367,
  OriginalRow227TriangleData0808.coefficient55_368,
  OriginalRow227TriangleData0808.coefficient55_369,
  OriginalRow227TriangleData0808.coefficient55_370,
  OriginalRow227TriangleData0808.coefficient55_371,
  OriginalRow227TriangleData0808.coefficient55_372,
  OriginalRow227TriangleData0808.coefficient55_373
]

theorem values0808_size : values0808.size = 32 := rfl

def block0808 : ℕ → Option IntervalDyadic := segment 342 values0808

theorem block0808_domain : ExactDomain block0808 342 374 := by
  simpa only [values0808_size] using segment_domain 342 values0808

theorem block0808_get (i : Fin 32) :
    block0808 (342 + i.val) = some (values0808[i.val]'(by rw [values0808_size]; exact i.isLt)) := by
  exact segment_get 342 values0808 ⟨i.val, by rw [values0808_size]; exact i.isLt⟩

def values0809 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0809.coefficient55_374,
  OriginalRow227TriangleData0809.coefficient55_375,
  OriginalRow227TriangleData0809.coefficient55_376,
  OriginalRow227TriangleData0809.coefficient55_377,
  OriginalRow227TriangleData0809.coefficient55_378,
  OriginalRow227TriangleData0809.coefficient55_379,
  OriginalRow227TriangleData0809.coefficient55_380,
  OriginalRow227TriangleData0809.coefficient55_381,
  OriginalRow227TriangleData0809.coefficient55_382,
  OriginalRow227TriangleData0809.coefficient55_383,
  OriginalRow227TriangleData0809.coefficient55_384,
  OriginalRow227TriangleData0809.coefficient55_385,
  OriginalRow227TriangleData0809.coefficient55_386,
  OriginalRow227TriangleData0809.coefficient55_387,
  OriginalRow227TriangleData0809.coefficient55_388,
  OriginalRow227TriangleData0809.coefficient55_389,
  OriginalRow227TriangleData0809.coefficient55_390,
  OriginalRow227TriangleData0809.coefficient55_391,
  OriginalRow227TriangleData0809.coefficient55_392,
  OriginalRow227TriangleData0809.coefficient55_393,
  OriginalRow227TriangleData0809.coefficient55_394,
  OriginalRow227TriangleData0809.coefficient55_395,
  OriginalRow227TriangleData0809.coefficient55_396,
  OriginalRow227TriangleData0809.coefficient55_397,
  OriginalRow227TriangleData0809.coefficient55_398,
  OriginalRow227TriangleData0809.coefficient55_399,
  OriginalRow227TriangleData0809.coefficient55_400,
  OriginalRow227TriangleData0809.coefficient55_401,
  OriginalRow227TriangleData0809.coefficient55_402,
  OriginalRow227TriangleData0809.coefficient55_403,
  OriginalRow227TriangleData0809.coefficient55_404,
  OriginalRow227TriangleData0809.coefficient55_405
]

theorem values0809_size : values0809.size = 32 := rfl

def block0809 : ℕ → Option IntervalDyadic := segment 374 values0809

theorem block0809_domain : ExactDomain block0809 374 406 := by
  simpa only [values0809_size] using segment_domain 374 values0809

theorem block0809_get (i : Fin 32) :
    block0809 (374 + i.val) = some (values0809[i.val]'(by rw [values0809_size]; exact i.isLt)) := by
  exact segment_get 374 values0809 ⟨i.val, by rw [values0809_size]; exact i.isLt⟩

def values0810 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0810.coefficient55_406,
  OriginalRow227TriangleData0810.coefficient55_407,
  OriginalRow227TriangleData0810.coefficient55_408,
  OriginalRow227TriangleData0810.coefficient55_409,
  OriginalRow227TriangleData0810.coefficient55_410,
  OriginalRow227TriangleData0810.coefficient55_411,
  OriginalRow227TriangleData0810.coefficient55_412,
  OriginalRow227TriangleData0810.coefficient55_413,
  OriginalRow227TriangleData0810.coefficient55_414,
  OriginalRow227TriangleData0810.coefficient55_415,
  OriginalRow227TriangleData0810.coefficient55_416,
  OriginalRow227TriangleData0810.coefficient55_417,
  OriginalRow227TriangleData0810.coefficient55_418,
  OriginalRow227TriangleData0810.coefficient55_419,
  OriginalRow227TriangleData0810.coefficient55_420,
  OriginalRow227TriangleData0810.coefficient55_421,
  OriginalRow227TriangleData0810.coefficient55_422,
  OriginalRow227TriangleData0810.coefficient55_423,
  OriginalRow227TriangleData0810.coefficient55_424,
  OriginalRow227TriangleData0810.coefficient55_425,
  OriginalRow227TriangleData0810.coefficient55_426,
  OriginalRow227TriangleData0810.coefficient55_427,
  OriginalRow227TriangleData0810.coefficient55_428,
  OriginalRow227TriangleData0810.coefficient55_429,
  OriginalRow227TriangleData0810.coefficient55_430,
  OriginalRow227TriangleData0810.coefficient55_431,
  OriginalRow227TriangleData0810.coefficient55_432,
  OriginalRow227TriangleData0810.coefficient55_433,
  OriginalRow227TriangleData0810.coefficient55_434,
  OriginalRow227TriangleData0810.coefficient55_435,
  OriginalRow227TriangleData0810.coefficient55_436,
  OriginalRow227TriangleData0810.coefficient55_437
]

theorem values0810_size : values0810.size = 32 := rfl

def block0810 : ℕ → Option IntervalDyadic := segment 406 values0810

theorem block0810_domain : ExactDomain block0810 406 438 := by
  simpa only [values0810_size] using segment_domain 406 values0810

theorem block0810_get (i : Fin 32) :
    block0810 (406 + i.val) = some (values0810[i.val]'(by rw [values0810_size]; exact i.isLt)) := by
  exact segment_get 406 values0810 ⟨i.val, by rw [values0810_size]; exact i.isLt⟩

def values0811 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0811.coefficient55_438,
  OriginalRow227TriangleData0811.coefficient55_439,
  OriginalRow227TriangleData0811.coefficient55_440,
  OriginalRow227TriangleData0811.coefficient55_441,
  OriginalRow227TriangleData0811.coefficient55_442,
  OriginalRow227TriangleData0811.coefficient55_443,
  OriginalRow227TriangleData0811.coefficient55_444,
  OriginalRow227TriangleData0811.coefficient55_445,
  OriginalRow227TriangleData0811.coefficient55_446
]

theorem values0811_size : values0811.size = 9 := rfl

def block0811 : ℕ → Option IntervalDyadic := segment 438 values0811

theorem block0811_domain : ExactDomain block0811 438 447 := by
  simpa only [values0811_size] using segment_domain 438 values0811

theorem block0811_get (i : Fin 9) :
    block0811 (438 + i.val) = some (values0811[i.val]'(by rw [values0811_size]; exact i.isLt)) := by
  exact segment_get 438 values0811 ⟨i.val, by rw [values0811_size]; exact i.isLt⟩

def node0086_0150 : ℕ → Option IntervalDyadic := split 118 block0800 block0801

theorem node0086_0150_domain : ExactDomain node0086_0150 86 150 := by
  exact split_domain (by decide) (by decide) block0800_domain block0801_domain

def node0054_0150 : ℕ → Option IntervalDyadic := split 86 block0799 node0086_0150

theorem node0054_0150_domain : ExactDomain node0054_0150 54 150 := by
  exact split_domain (by decide) (by decide) block0799_domain node0086_0150_domain

def node0182_0246 : ℕ → Option IntervalDyadic := split 214 block0803 block0804

theorem node0182_0246_domain : ExactDomain node0182_0246 182 246 := by
  exact split_domain (by decide) (by decide) block0803_domain block0804_domain

def node0150_0246 : ℕ → Option IntervalDyadic := split 182 block0802 node0182_0246

theorem node0150_0246_domain : ExactDomain node0150_0246 150 246 := by
  exact split_domain (by decide) (by decide) block0802_domain node0182_0246_domain

def node0054_0246 : ℕ → Option IntervalDyadic := split 150 node0054_0150 node0150_0246

theorem node0054_0246_domain : ExactDomain node0054_0246 54 246 := by
  exact split_domain (by decide) (by decide) node0054_0150_domain node0150_0246_domain

def node0278_0342 : ℕ → Option IntervalDyadic := split 310 block0806 block0807

theorem node0278_0342_domain : ExactDomain node0278_0342 278 342 := by
  exact split_domain (by decide) (by decide) block0806_domain block0807_domain

def node0246_0342 : ℕ → Option IntervalDyadic := split 278 block0805 node0278_0342

theorem node0246_0342_domain : ExactDomain node0246_0342 246 342 := by
  exact split_domain (by decide) (by decide) block0805_domain node0278_0342_domain

def node0342_0406 : ℕ → Option IntervalDyadic := split 374 block0808 block0809

theorem node0342_0406_domain : ExactDomain node0342_0406 342 406 := by
  exact split_domain (by decide) (by decide) block0808_domain block0809_domain

def node0406_0447 : ℕ → Option IntervalDyadic := split 438 block0810 block0811

theorem node0406_0447_domain : ExactDomain node0406_0447 406 447 := by
  exact split_domain (by decide) (by decide) block0810_domain block0811_domain

def node0342_0447 : ℕ → Option IntervalDyadic := split 406 node0342_0406 node0406_0447

theorem node0342_0447_domain : ExactDomain node0342_0447 342 447 := by
  exact split_domain (by decide) (by decide) node0342_0406_domain node0406_0447_domain

def node0246_0447 : ℕ → Option IntervalDyadic := split 342 node0246_0342 node0342_0447

theorem node0246_0447_domain : ExactDomain node0246_0447 246 447 := by
  exact split_domain (by decide) (by decide) node0246_0342_domain node0342_0447_domain

def node0054_0447 : ℕ → Option IntervalDyadic := split 246 node0054_0246 node0246_0447

theorem node0054_0447_domain : ExactDomain node0054_0447 54 447 := by
  exact split_domain (by decide) (by decide) node0054_0246_domain node0246_0447_domain

def lookup : ℕ → Option IntervalDyadic := node0054_0447

theorem lookup_domain : ExactDomain lookup 54 447 :=
  node0054_0447_domain

theorem block0799_lookup (i : Fin 32) :
    lookup (54 + i.val) = some (values0799[i.val]'(by rw [values0799_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (54 + i.val) = _
  rw [node0054_0447, split_left 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0054_0246, split_left 150 node0054_0150 node0150_0246 (by omega)]
  rw [node0054_0150, split_left 86 block0799 node0086_0150 (by omega)]
  exact block0799_get i

theorem block0800_lookup (i : Fin 32) :
    lookup (86 + i.val) = some (values0800[i.val]'(by rw [values0800_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (86 + i.val) = _
  rw [node0054_0447, split_left 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0054_0246, split_left 150 node0054_0150 node0150_0246 (by omega)]
  rw [node0054_0150, split_right 86 block0799 node0086_0150 (by omega)]
  rw [node0086_0150, split_left 118 block0800 block0801 (by omega)]
  exact block0800_get i

theorem block0801_lookup (i : Fin 32) :
    lookup (118 + i.val) = some (values0801[i.val]'(by rw [values0801_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (118 + i.val) = _
  rw [node0054_0447, split_left 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0054_0246, split_left 150 node0054_0150 node0150_0246 (by omega)]
  rw [node0054_0150, split_right 86 block0799 node0086_0150 (by omega)]
  rw [node0086_0150, split_right 118 block0800 block0801 (by omega)]
  exact block0801_get i

theorem block0802_lookup (i : Fin 32) :
    lookup (150 + i.val) = some (values0802[i.val]'(by rw [values0802_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (150 + i.val) = _
  rw [node0054_0447, split_left 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0054_0246, split_right 150 node0054_0150 node0150_0246 (by omega)]
  rw [node0150_0246, split_left 182 block0802 node0182_0246 (by omega)]
  exact block0802_get i

theorem block0803_lookup (i : Fin 32) :
    lookup (182 + i.val) = some (values0803[i.val]'(by rw [values0803_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (182 + i.val) = _
  rw [node0054_0447, split_left 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0054_0246, split_right 150 node0054_0150 node0150_0246 (by omega)]
  rw [node0150_0246, split_right 182 block0802 node0182_0246 (by omega)]
  rw [node0182_0246, split_left 214 block0803 block0804 (by omega)]
  exact block0803_get i

theorem block0804_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values0804[i.val]'(by rw [values0804_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (214 + i.val) = _
  rw [node0054_0447, split_left 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0054_0246, split_right 150 node0054_0150 node0150_0246 (by omega)]
  rw [node0150_0246, split_right 182 block0802 node0182_0246 (by omega)]
  rw [node0182_0246, split_right 214 block0803 block0804 (by omega)]
  exact block0804_get i

theorem block0805_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values0805[i.val]'(by rw [values0805_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (246 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_left 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0246_0342, split_left 278 block0805 node0278_0342 (by omega)]
  exact block0805_get i

theorem block0806_lookup (i : Fin 32) :
    lookup (278 + i.val) = some (values0806[i.val]'(by rw [values0806_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (278 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_left 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0246_0342, split_right 278 block0805 node0278_0342 (by omega)]
  rw [node0278_0342, split_left 310 block0806 block0807 (by omega)]
  exact block0806_get i

theorem block0807_lookup (i : Fin 32) :
    lookup (310 + i.val) = some (values0807[i.val]'(by rw [values0807_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (310 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_left 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0246_0342, split_right 278 block0805 node0278_0342 (by omega)]
  rw [node0278_0342, split_right 310 block0806 block0807 (by omega)]
  exact block0807_get i

theorem block0808_lookup (i : Fin 32) :
    lookup (342 + i.val) = some (values0808[i.val]'(by rw [values0808_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (342 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_right 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0342_0447, split_left 406 node0342_0406 node0406_0447 (by omega)]
  rw [node0342_0406, split_left 374 block0808 block0809 (by omega)]
  exact block0808_get i

theorem block0809_lookup (i : Fin 32) :
    lookup (374 + i.val) = some (values0809[i.val]'(by rw [values0809_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (374 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_right 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0342_0447, split_left 406 node0342_0406 node0406_0447 (by omega)]
  rw [node0342_0406, split_right 374 block0808 block0809 (by omega)]
  exact block0809_get i

theorem block0810_lookup (i : Fin 32) :
    lookup (406 + i.val) = some (values0810[i.val]'(by rw [values0810_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (406 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_right 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0342_0447, split_right 406 node0342_0406 node0406_0447 (by omega)]
  rw [node0406_0447, split_left 438 block0810 block0811 (by omega)]
  exact block0810_get i

theorem block0811_lookup (i : Fin 9) :
    lookup (438 + i.val) = some (values0811[i.val]'(by rw [values0811_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0054_0447 (438 + i.val) = _
  rw [node0054_0447, split_right 246 node0054_0246 node0246_0447 (by omega)]
  rw [node0246_0447, split_right 342 node0246_0342 node0342_0447 (by omega)]
  rw [node0342_0447, split_right 406 node0342_0406 node0406_0447 (by omega)]
  rw [node0406_0447, split_right 438 block0810 block0811 (by omega)]
  exact block0811_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0799_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0799_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0800_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0800_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0801_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0801_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0802_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0802_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0803_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0803_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0804_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0804_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0805_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0805_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0806_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0806_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0807_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0807_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0808_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0808_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0809_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0809_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0810_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0810_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0811_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0811_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0799_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0800_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0801_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0802_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0803_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0804_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0805_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0806_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0807_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0808_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0809_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0810_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow055.block0811_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow055
