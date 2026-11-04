import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0864
import Grothe.UpperChaos.OriginalRow227TriangleData0865
import Grothe.UpperChaos.OriginalRow227TriangleData0866
import Grothe.UpperChaos.OriginalRow227TriangleData0867
import Grothe.UpperChaos.OriginalRow227TriangleData0868
import Grothe.UpperChaos.OriginalRow227TriangleData0869
import Grothe.UpperChaos.OriginalRow227TriangleData0870
import Grothe.UpperChaos.OriginalRow227TriangleData0871
import Grothe.UpperChaos.OriginalRow227TriangleData0872
import Grothe.UpperChaos.OriginalRow227TriangleData0873
import Grothe.UpperChaos.OriginalRow227TriangleData0874
import Grothe.UpperChaos.OriginalRow227TriangleData0875

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow060

open ConditionalTableLookup

def values0864 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0864.coefficient60_59,
  OriginalRow227TriangleData0864.coefficient60_60,
  OriginalRow227TriangleData0864.coefficient60_61,
  OriginalRow227TriangleData0864.coefficient60_62,
  OriginalRow227TriangleData0864.coefficient60_63,
  OriginalRow227TriangleData0864.coefficient60_64,
  OriginalRow227TriangleData0864.coefficient60_65,
  OriginalRow227TriangleData0864.coefficient60_66,
  OriginalRow227TriangleData0864.coefficient60_67,
  OriginalRow227TriangleData0864.coefficient60_68,
  OriginalRow227TriangleData0864.coefficient60_69,
  OriginalRow227TriangleData0864.coefficient60_70,
  OriginalRow227TriangleData0864.coefficient60_71,
  OriginalRow227TriangleData0864.coefficient60_72,
  OriginalRow227TriangleData0864.coefficient60_73,
  OriginalRow227TriangleData0864.coefficient60_74,
  OriginalRow227TriangleData0864.coefficient60_75,
  OriginalRow227TriangleData0864.coefficient60_76,
  OriginalRow227TriangleData0864.coefficient60_77,
  OriginalRow227TriangleData0864.coefficient60_78,
  OriginalRow227TriangleData0864.coefficient60_79,
  OriginalRow227TriangleData0864.coefficient60_80,
  OriginalRow227TriangleData0864.coefficient60_81,
  OriginalRow227TriangleData0864.coefficient60_82,
  OriginalRow227TriangleData0864.coefficient60_83,
  OriginalRow227TriangleData0864.coefficient60_84,
  OriginalRow227TriangleData0864.coefficient60_85,
  OriginalRow227TriangleData0864.coefficient60_86,
  OriginalRow227TriangleData0864.coefficient60_87,
  OriginalRow227TriangleData0864.coefficient60_88,
  OriginalRow227TriangleData0864.coefficient60_89,
  OriginalRow227TriangleData0864.coefficient60_90
]

theorem values0864_size : values0864.size = 32 := rfl

def block0864 : ℕ → Option IntervalDyadic := segment 59 values0864

theorem block0864_domain : ExactDomain block0864 59 91 := by
  simpa only [values0864_size] using segment_domain 59 values0864

theorem block0864_get (i : Fin 32) :
    block0864 (59 + i.val) = some (values0864[i.val]'(by rw [values0864_size]; exact i.isLt)) := by
  exact segment_get 59 values0864 ⟨i.val, by rw [values0864_size]; exact i.isLt⟩

def values0865 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0865.coefficient60_91,
  OriginalRow227TriangleData0865.coefficient60_92,
  OriginalRow227TriangleData0865.coefficient60_93,
  OriginalRow227TriangleData0865.coefficient60_94,
  OriginalRow227TriangleData0865.coefficient60_95,
  OriginalRow227TriangleData0865.coefficient60_96,
  OriginalRow227TriangleData0865.coefficient60_97,
  OriginalRow227TriangleData0865.coefficient60_98,
  OriginalRow227TriangleData0865.coefficient60_99,
  OriginalRow227TriangleData0865.coefficient60_100,
  OriginalRow227TriangleData0865.coefficient60_101,
  OriginalRow227TriangleData0865.coefficient60_102,
  OriginalRow227TriangleData0865.coefficient60_103,
  OriginalRow227TriangleData0865.coefficient60_104,
  OriginalRow227TriangleData0865.coefficient60_105,
  OriginalRow227TriangleData0865.coefficient60_106,
  OriginalRow227TriangleData0865.coefficient60_107,
  OriginalRow227TriangleData0865.coefficient60_108,
  OriginalRow227TriangleData0865.coefficient60_109,
  OriginalRow227TriangleData0865.coefficient60_110,
  OriginalRow227TriangleData0865.coefficient60_111,
  OriginalRow227TriangleData0865.coefficient60_112,
  OriginalRow227TriangleData0865.coefficient60_113,
  OriginalRow227TriangleData0865.coefficient60_114,
  OriginalRow227TriangleData0865.coefficient60_115,
  OriginalRow227TriangleData0865.coefficient60_116,
  OriginalRow227TriangleData0865.coefficient60_117,
  OriginalRow227TriangleData0865.coefficient60_118,
  OriginalRow227TriangleData0865.coefficient60_119,
  OriginalRow227TriangleData0865.coefficient60_120,
  OriginalRow227TriangleData0865.coefficient60_121,
  OriginalRow227TriangleData0865.coefficient60_122
]

theorem values0865_size : values0865.size = 32 := rfl

def block0865 : ℕ → Option IntervalDyadic := segment 91 values0865

theorem block0865_domain : ExactDomain block0865 91 123 := by
  simpa only [values0865_size] using segment_domain 91 values0865

theorem block0865_get (i : Fin 32) :
    block0865 (91 + i.val) = some (values0865[i.val]'(by rw [values0865_size]; exact i.isLt)) := by
  exact segment_get 91 values0865 ⟨i.val, by rw [values0865_size]; exact i.isLt⟩

def values0866 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0866.coefficient60_123,
  OriginalRow227TriangleData0866.coefficient60_124,
  OriginalRow227TriangleData0866.coefficient60_125,
  OriginalRow227TriangleData0866.coefficient60_126,
  OriginalRow227TriangleData0866.coefficient60_127,
  OriginalRow227TriangleData0866.coefficient60_128,
  OriginalRow227TriangleData0866.coefficient60_129,
  OriginalRow227TriangleData0866.coefficient60_130,
  OriginalRow227TriangleData0866.coefficient60_131,
  OriginalRow227TriangleData0866.coefficient60_132,
  OriginalRow227TriangleData0866.coefficient60_133,
  OriginalRow227TriangleData0866.coefficient60_134,
  OriginalRow227TriangleData0866.coefficient60_135,
  OriginalRow227TriangleData0866.coefficient60_136,
  OriginalRow227TriangleData0866.coefficient60_137,
  OriginalRow227TriangleData0866.coefficient60_138,
  OriginalRow227TriangleData0866.coefficient60_139,
  OriginalRow227TriangleData0866.coefficient60_140,
  OriginalRow227TriangleData0866.coefficient60_141,
  OriginalRow227TriangleData0866.coefficient60_142,
  OriginalRow227TriangleData0866.coefficient60_143,
  OriginalRow227TriangleData0866.coefficient60_144,
  OriginalRow227TriangleData0866.coefficient60_145,
  OriginalRow227TriangleData0866.coefficient60_146,
  OriginalRow227TriangleData0866.coefficient60_147,
  OriginalRow227TriangleData0866.coefficient60_148,
  OriginalRow227TriangleData0866.coefficient60_149,
  OriginalRow227TriangleData0866.coefficient60_150,
  OriginalRow227TriangleData0866.coefficient60_151,
  OriginalRow227TriangleData0866.coefficient60_152,
  OriginalRow227TriangleData0866.coefficient60_153,
  OriginalRow227TriangleData0866.coefficient60_154
]

theorem values0866_size : values0866.size = 32 := rfl

def block0866 : ℕ → Option IntervalDyadic := segment 123 values0866

theorem block0866_domain : ExactDomain block0866 123 155 := by
  simpa only [values0866_size] using segment_domain 123 values0866

theorem block0866_get (i : Fin 32) :
    block0866 (123 + i.val) = some (values0866[i.val]'(by rw [values0866_size]; exact i.isLt)) := by
  exact segment_get 123 values0866 ⟨i.val, by rw [values0866_size]; exact i.isLt⟩

def values0867 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0867.coefficient60_155,
  OriginalRow227TriangleData0867.coefficient60_156,
  OriginalRow227TriangleData0867.coefficient60_157,
  OriginalRow227TriangleData0867.coefficient60_158,
  OriginalRow227TriangleData0867.coefficient60_159,
  OriginalRow227TriangleData0867.coefficient60_160,
  OriginalRow227TriangleData0867.coefficient60_161,
  OriginalRow227TriangleData0867.coefficient60_162,
  OriginalRow227TriangleData0867.coefficient60_163,
  OriginalRow227TriangleData0867.coefficient60_164,
  OriginalRow227TriangleData0867.coefficient60_165,
  OriginalRow227TriangleData0867.coefficient60_166,
  OriginalRow227TriangleData0867.coefficient60_167,
  OriginalRow227TriangleData0867.coefficient60_168,
  OriginalRow227TriangleData0867.coefficient60_169,
  OriginalRow227TriangleData0867.coefficient60_170,
  OriginalRow227TriangleData0867.coefficient60_171,
  OriginalRow227TriangleData0867.coefficient60_172,
  OriginalRow227TriangleData0867.coefficient60_173,
  OriginalRow227TriangleData0867.coefficient60_174,
  OriginalRow227TriangleData0867.coefficient60_175,
  OriginalRow227TriangleData0867.coefficient60_176,
  OriginalRow227TriangleData0867.coefficient60_177,
  OriginalRow227TriangleData0867.coefficient60_178,
  OriginalRow227TriangleData0867.coefficient60_179,
  OriginalRow227TriangleData0867.coefficient60_180,
  OriginalRow227TriangleData0867.coefficient60_181,
  OriginalRow227TriangleData0867.coefficient60_182,
  OriginalRow227TriangleData0867.coefficient60_183,
  OriginalRow227TriangleData0867.coefficient60_184,
  OriginalRow227TriangleData0867.coefficient60_185,
  OriginalRow227TriangleData0867.coefficient60_186
]

theorem values0867_size : values0867.size = 32 := rfl

def block0867 : ℕ → Option IntervalDyadic := segment 155 values0867

theorem block0867_domain : ExactDomain block0867 155 187 := by
  simpa only [values0867_size] using segment_domain 155 values0867

theorem block0867_get (i : Fin 32) :
    block0867 (155 + i.val) = some (values0867[i.val]'(by rw [values0867_size]; exact i.isLt)) := by
  exact segment_get 155 values0867 ⟨i.val, by rw [values0867_size]; exact i.isLt⟩

def values0868 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0868.coefficient60_187,
  OriginalRow227TriangleData0868.coefficient60_188,
  OriginalRow227TriangleData0868.coefficient60_189,
  OriginalRow227TriangleData0868.coefficient60_190,
  OriginalRow227TriangleData0868.coefficient60_191,
  OriginalRow227TriangleData0868.coefficient60_192,
  OriginalRow227TriangleData0868.coefficient60_193,
  OriginalRow227TriangleData0868.coefficient60_194,
  OriginalRow227TriangleData0868.coefficient60_195,
  OriginalRow227TriangleData0868.coefficient60_196,
  OriginalRow227TriangleData0868.coefficient60_197,
  OriginalRow227TriangleData0868.coefficient60_198,
  OriginalRow227TriangleData0868.coefficient60_199,
  OriginalRow227TriangleData0868.coefficient60_200,
  OriginalRow227TriangleData0868.coefficient60_201,
  OriginalRow227TriangleData0868.coefficient60_202,
  OriginalRow227TriangleData0868.coefficient60_203,
  OriginalRow227TriangleData0868.coefficient60_204,
  OriginalRow227TriangleData0868.coefficient60_205,
  OriginalRow227TriangleData0868.coefficient60_206,
  OriginalRow227TriangleData0868.coefficient60_207,
  OriginalRow227TriangleData0868.coefficient60_208,
  OriginalRow227TriangleData0868.coefficient60_209,
  OriginalRow227TriangleData0868.coefficient60_210,
  OriginalRow227TriangleData0868.coefficient60_211,
  OriginalRow227TriangleData0868.coefficient60_212,
  OriginalRow227TriangleData0868.coefficient60_213,
  OriginalRow227TriangleData0868.coefficient60_214,
  OriginalRow227TriangleData0868.coefficient60_215,
  OriginalRow227TriangleData0868.coefficient60_216,
  OriginalRow227TriangleData0868.coefficient60_217,
  OriginalRow227TriangleData0868.coefficient60_218
]

theorem values0868_size : values0868.size = 32 := rfl

def block0868 : ℕ → Option IntervalDyadic := segment 187 values0868

theorem block0868_domain : ExactDomain block0868 187 219 := by
  simpa only [values0868_size] using segment_domain 187 values0868

theorem block0868_get (i : Fin 32) :
    block0868 (187 + i.val) = some (values0868[i.val]'(by rw [values0868_size]; exact i.isLt)) := by
  exact segment_get 187 values0868 ⟨i.val, by rw [values0868_size]; exact i.isLt⟩

def values0869 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0869.coefficient60_219,
  OriginalRow227TriangleData0869.coefficient60_220,
  OriginalRow227TriangleData0869.coefficient60_221,
  OriginalRow227TriangleData0869.coefficient60_222,
  OriginalRow227TriangleData0869.coefficient60_223,
  OriginalRow227TriangleData0869.coefficient60_224,
  OriginalRow227TriangleData0869.coefficient60_225,
  OriginalRow227TriangleData0869.coefficient60_226,
  OriginalRow227TriangleData0869.coefficient60_227,
  OriginalRow227TriangleData0869.coefficient60_228,
  OriginalRow227TriangleData0869.coefficient60_229,
  OriginalRow227TriangleData0869.coefficient60_230,
  OriginalRow227TriangleData0869.coefficient60_231,
  OriginalRow227TriangleData0869.coefficient60_232,
  OriginalRow227TriangleData0869.coefficient60_233,
  OriginalRow227TriangleData0869.coefficient60_234,
  OriginalRow227TriangleData0869.coefficient60_235,
  OriginalRow227TriangleData0869.coefficient60_236,
  OriginalRow227TriangleData0869.coefficient60_237,
  OriginalRow227TriangleData0869.coefficient60_238,
  OriginalRow227TriangleData0869.coefficient60_239,
  OriginalRow227TriangleData0869.coefficient60_240,
  OriginalRow227TriangleData0869.coefficient60_241,
  OriginalRow227TriangleData0869.coefficient60_242,
  OriginalRow227TriangleData0869.coefficient60_243,
  OriginalRow227TriangleData0869.coefficient60_244,
  OriginalRow227TriangleData0869.coefficient60_245,
  OriginalRow227TriangleData0869.coefficient60_246,
  OriginalRow227TriangleData0869.coefficient60_247,
  OriginalRow227TriangleData0869.coefficient60_248,
  OriginalRow227TriangleData0869.coefficient60_249,
  OriginalRow227TriangleData0869.coefficient60_250
]

theorem values0869_size : values0869.size = 32 := rfl

def block0869 : ℕ → Option IntervalDyadic := segment 219 values0869

theorem block0869_domain : ExactDomain block0869 219 251 := by
  simpa only [values0869_size] using segment_domain 219 values0869

theorem block0869_get (i : Fin 32) :
    block0869 (219 + i.val) = some (values0869[i.val]'(by rw [values0869_size]; exact i.isLt)) := by
  exact segment_get 219 values0869 ⟨i.val, by rw [values0869_size]; exact i.isLt⟩

def values0870 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0870.coefficient60_251,
  OriginalRow227TriangleData0870.coefficient60_252,
  OriginalRow227TriangleData0870.coefficient60_253,
  OriginalRow227TriangleData0870.coefficient60_254,
  OriginalRow227TriangleData0870.coefficient60_255,
  OriginalRow227TriangleData0870.coefficient60_256,
  OriginalRow227TriangleData0870.coefficient60_257,
  OriginalRow227TriangleData0870.coefficient60_258,
  OriginalRow227TriangleData0870.coefficient60_259,
  OriginalRow227TriangleData0870.coefficient60_260,
  OriginalRow227TriangleData0870.coefficient60_261,
  OriginalRow227TriangleData0870.coefficient60_262,
  OriginalRow227TriangleData0870.coefficient60_263,
  OriginalRow227TriangleData0870.coefficient60_264,
  OriginalRow227TriangleData0870.coefficient60_265,
  OriginalRow227TriangleData0870.coefficient60_266,
  OriginalRow227TriangleData0870.coefficient60_267,
  OriginalRow227TriangleData0870.coefficient60_268,
  OriginalRow227TriangleData0870.coefficient60_269,
  OriginalRow227TriangleData0870.coefficient60_270,
  OriginalRow227TriangleData0870.coefficient60_271,
  OriginalRow227TriangleData0870.coefficient60_272,
  OriginalRow227TriangleData0870.coefficient60_273,
  OriginalRow227TriangleData0870.coefficient60_274,
  OriginalRow227TriangleData0870.coefficient60_275,
  OriginalRow227TriangleData0870.coefficient60_276,
  OriginalRow227TriangleData0870.coefficient60_277,
  OriginalRow227TriangleData0870.coefficient60_278,
  OriginalRow227TriangleData0870.coefficient60_279,
  OriginalRow227TriangleData0870.coefficient60_280,
  OriginalRow227TriangleData0870.coefficient60_281,
  OriginalRow227TriangleData0870.coefficient60_282
]

theorem values0870_size : values0870.size = 32 := rfl

def block0870 : ℕ → Option IntervalDyadic := segment 251 values0870

theorem block0870_domain : ExactDomain block0870 251 283 := by
  simpa only [values0870_size] using segment_domain 251 values0870

theorem block0870_get (i : Fin 32) :
    block0870 (251 + i.val) = some (values0870[i.val]'(by rw [values0870_size]; exact i.isLt)) := by
  exact segment_get 251 values0870 ⟨i.val, by rw [values0870_size]; exact i.isLt⟩

def values0871 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0871.coefficient60_283,
  OriginalRow227TriangleData0871.coefficient60_284,
  OriginalRow227TriangleData0871.coefficient60_285,
  OriginalRow227TriangleData0871.coefficient60_286,
  OriginalRow227TriangleData0871.coefficient60_287,
  OriginalRow227TriangleData0871.coefficient60_288,
  OriginalRow227TriangleData0871.coefficient60_289,
  OriginalRow227TriangleData0871.coefficient60_290,
  OriginalRow227TriangleData0871.coefficient60_291,
  OriginalRow227TriangleData0871.coefficient60_292,
  OriginalRow227TriangleData0871.coefficient60_293,
  OriginalRow227TriangleData0871.coefficient60_294,
  OriginalRow227TriangleData0871.coefficient60_295,
  OriginalRow227TriangleData0871.coefficient60_296,
  OriginalRow227TriangleData0871.coefficient60_297,
  OriginalRow227TriangleData0871.coefficient60_298,
  OriginalRow227TriangleData0871.coefficient60_299,
  OriginalRow227TriangleData0871.coefficient60_300,
  OriginalRow227TriangleData0871.coefficient60_301,
  OriginalRow227TriangleData0871.coefficient60_302,
  OriginalRow227TriangleData0871.coefficient60_303,
  OriginalRow227TriangleData0871.coefficient60_304,
  OriginalRow227TriangleData0871.coefficient60_305,
  OriginalRow227TriangleData0871.coefficient60_306,
  OriginalRow227TriangleData0871.coefficient60_307,
  OriginalRow227TriangleData0871.coefficient60_308,
  OriginalRow227TriangleData0871.coefficient60_309,
  OriginalRow227TriangleData0871.coefficient60_310,
  OriginalRow227TriangleData0871.coefficient60_311,
  OriginalRow227TriangleData0871.coefficient60_312,
  OriginalRow227TriangleData0871.coefficient60_313,
  OriginalRow227TriangleData0871.coefficient60_314
]

theorem values0871_size : values0871.size = 32 := rfl

def block0871 : ℕ → Option IntervalDyadic := segment 283 values0871

theorem block0871_domain : ExactDomain block0871 283 315 := by
  simpa only [values0871_size] using segment_domain 283 values0871

theorem block0871_get (i : Fin 32) :
    block0871 (283 + i.val) = some (values0871[i.val]'(by rw [values0871_size]; exact i.isLt)) := by
  exact segment_get 283 values0871 ⟨i.val, by rw [values0871_size]; exact i.isLt⟩

def values0872 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0872.coefficient60_315,
  OriginalRow227TriangleData0872.coefficient60_316,
  OriginalRow227TriangleData0872.coefficient60_317,
  OriginalRow227TriangleData0872.coefficient60_318,
  OriginalRow227TriangleData0872.coefficient60_319,
  OriginalRow227TriangleData0872.coefficient60_320,
  OriginalRow227TriangleData0872.coefficient60_321,
  OriginalRow227TriangleData0872.coefficient60_322,
  OriginalRow227TriangleData0872.coefficient60_323,
  OriginalRow227TriangleData0872.coefficient60_324,
  OriginalRow227TriangleData0872.coefficient60_325,
  OriginalRow227TriangleData0872.coefficient60_326,
  OriginalRow227TriangleData0872.coefficient60_327,
  OriginalRow227TriangleData0872.coefficient60_328,
  OriginalRow227TriangleData0872.coefficient60_329,
  OriginalRow227TriangleData0872.coefficient60_330,
  OriginalRow227TriangleData0872.coefficient60_331,
  OriginalRow227TriangleData0872.coefficient60_332,
  OriginalRow227TriangleData0872.coefficient60_333,
  OriginalRow227TriangleData0872.coefficient60_334,
  OriginalRow227TriangleData0872.coefficient60_335,
  OriginalRow227TriangleData0872.coefficient60_336,
  OriginalRow227TriangleData0872.coefficient60_337,
  OriginalRow227TriangleData0872.coefficient60_338,
  OriginalRow227TriangleData0872.coefficient60_339,
  OriginalRow227TriangleData0872.coefficient60_340,
  OriginalRow227TriangleData0872.coefficient60_341,
  OriginalRow227TriangleData0872.coefficient60_342,
  OriginalRow227TriangleData0872.coefficient60_343,
  OriginalRow227TriangleData0872.coefficient60_344,
  OriginalRow227TriangleData0872.coefficient60_345,
  OriginalRow227TriangleData0872.coefficient60_346
]

theorem values0872_size : values0872.size = 32 := rfl

def block0872 : ℕ → Option IntervalDyadic := segment 315 values0872

theorem block0872_domain : ExactDomain block0872 315 347 := by
  simpa only [values0872_size] using segment_domain 315 values0872

theorem block0872_get (i : Fin 32) :
    block0872 (315 + i.val) = some (values0872[i.val]'(by rw [values0872_size]; exact i.isLt)) := by
  exact segment_get 315 values0872 ⟨i.val, by rw [values0872_size]; exact i.isLt⟩

def values0873 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0873.coefficient60_347,
  OriginalRow227TriangleData0873.coefficient60_348,
  OriginalRow227TriangleData0873.coefficient60_349,
  OriginalRow227TriangleData0873.coefficient60_350,
  OriginalRow227TriangleData0873.coefficient60_351,
  OriginalRow227TriangleData0873.coefficient60_352,
  OriginalRow227TriangleData0873.coefficient60_353,
  OriginalRow227TriangleData0873.coefficient60_354,
  OriginalRow227TriangleData0873.coefficient60_355,
  OriginalRow227TriangleData0873.coefficient60_356,
  OriginalRow227TriangleData0873.coefficient60_357,
  OriginalRow227TriangleData0873.coefficient60_358,
  OriginalRow227TriangleData0873.coefficient60_359,
  OriginalRow227TriangleData0873.coefficient60_360,
  OriginalRow227TriangleData0873.coefficient60_361,
  OriginalRow227TriangleData0873.coefficient60_362,
  OriginalRow227TriangleData0873.coefficient60_363,
  OriginalRow227TriangleData0873.coefficient60_364,
  OriginalRow227TriangleData0873.coefficient60_365,
  OriginalRow227TriangleData0873.coefficient60_366,
  OriginalRow227TriangleData0873.coefficient60_367,
  OriginalRow227TriangleData0873.coefficient60_368,
  OriginalRow227TriangleData0873.coefficient60_369,
  OriginalRow227TriangleData0873.coefficient60_370,
  OriginalRow227TriangleData0873.coefficient60_371,
  OriginalRow227TriangleData0873.coefficient60_372,
  OriginalRow227TriangleData0873.coefficient60_373,
  OriginalRow227TriangleData0873.coefficient60_374,
  OriginalRow227TriangleData0873.coefficient60_375,
  OriginalRow227TriangleData0873.coefficient60_376,
  OriginalRow227TriangleData0873.coefficient60_377,
  OriginalRow227TriangleData0873.coefficient60_378
]

theorem values0873_size : values0873.size = 32 := rfl

def block0873 : ℕ → Option IntervalDyadic := segment 347 values0873

theorem block0873_domain : ExactDomain block0873 347 379 := by
  simpa only [values0873_size] using segment_domain 347 values0873

theorem block0873_get (i : Fin 32) :
    block0873 (347 + i.val) = some (values0873[i.val]'(by rw [values0873_size]; exact i.isLt)) := by
  exact segment_get 347 values0873 ⟨i.val, by rw [values0873_size]; exact i.isLt⟩

def values0874 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0874.coefficient60_379,
  OriginalRow227TriangleData0874.coefficient60_380,
  OriginalRow227TriangleData0874.coefficient60_381,
  OriginalRow227TriangleData0874.coefficient60_382,
  OriginalRow227TriangleData0874.coefficient60_383,
  OriginalRow227TriangleData0874.coefficient60_384,
  OriginalRow227TriangleData0874.coefficient60_385,
  OriginalRow227TriangleData0874.coefficient60_386,
  OriginalRow227TriangleData0874.coefficient60_387,
  OriginalRow227TriangleData0874.coefficient60_388,
  OriginalRow227TriangleData0874.coefficient60_389,
  OriginalRow227TriangleData0874.coefficient60_390,
  OriginalRow227TriangleData0874.coefficient60_391,
  OriginalRow227TriangleData0874.coefficient60_392,
  OriginalRow227TriangleData0874.coefficient60_393,
  OriginalRow227TriangleData0874.coefficient60_394,
  OriginalRow227TriangleData0874.coefficient60_395,
  OriginalRow227TriangleData0874.coefficient60_396,
  OriginalRow227TriangleData0874.coefficient60_397,
  OriginalRow227TriangleData0874.coefficient60_398,
  OriginalRow227TriangleData0874.coefficient60_399,
  OriginalRow227TriangleData0874.coefficient60_400,
  OriginalRow227TriangleData0874.coefficient60_401,
  OriginalRow227TriangleData0874.coefficient60_402,
  OriginalRow227TriangleData0874.coefficient60_403,
  OriginalRow227TriangleData0874.coefficient60_404,
  OriginalRow227TriangleData0874.coefficient60_405,
  OriginalRow227TriangleData0874.coefficient60_406,
  OriginalRow227TriangleData0874.coefficient60_407,
  OriginalRow227TriangleData0874.coefficient60_408,
  OriginalRow227TriangleData0874.coefficient60_409,
  OriginalRow227TriangleData0874.coefficient60_410
]

theorem values0874_size : values0874.size = 32 := rfl

def block0874 : ℕ → Option IntervalDyadic := segment 379 values0874

theorem block0874_domain : ExactDomain block0874 379 411 := by
  simpa only [values0874_size] using segment_domain 379 values0874

theorem block0874_get (i : Fin 32) :
    block0874 (379 + i.val) = some (values0874[i.val]'(by rw [values0874_size]; exact i.isLt)) := by
  exact segment_get 379 values0874 ⟨i.val, by rw [values0874_size]; exact i.isLt⟩

def values0875 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0875.coefficient60_411,
  OriginalRow227TriangleData0875.coefficient60_412,
  OriginalRow227TriangleData0875.coefficient60_413,
  OriginalRow227TriangleData0875.coefficient60_414,
  OriginalRow227TriangleData0875.coefficient60_415,
  OriginalRow227TriangleData0875.coefficient60_416,
  OriginalRow227TriangleData0875.coefficient60_417,
  OriginalRow227TriangleData0875.coefficient60_418,
  OriginalRow227TriangleData0875.coefficient60_419,
  OriginalRow227TriangleData0875.coefficient60_420,
  OriginalRow227TriangleData0875.coefficient60_421,
  OriginalRow227TriangleData0875.coefficient60_422,
  OriginalRow227TriangleData0875.coefficient60_423,
  OriginalRow227TriangleData0875.coefficient60_424,
  OriginalRow227TriangleData0875.coefficient60_425,
  OriginalRow227TriangleData0875.coefficient60_426,
  OriginalRow227TriangleData0875.coefficient60_427,
  OriginalRow227TriangleData0875.coefficient60_428,
  OriginalRow227TriangleData0875.coefficient60_429,
  OriginalRow227TriangleData0875.coefficient60_430,
  OriginalRow227TriangleData0875.coefficient60_431,
  OriginalRow227TriangleData0875.coefficient60_432,
  OriginalRow227TriangleData0875.coefficient60_433,
  OriginalRow227TriangleData0875.coefficient60_434,
  OriginalRow227TriangleData0875.coefficient60_435,
  OriginalRow227TriangleData0875.coefficient60_436,
  OriginalRow227TriangleData0875.coefficient60_437,
  OriginalRow227TriangleData0875.coefficient60_438,
  OriginalRow227TriangleData0875.coefficient60_439,
  OriginalRow227TriangleData0875.coefficient60_440,
  OriginalRow227TriangleData0875.coefficient60_441
]

theorem values0875_size : values0875.size = 31 := rfl

def block0875 : ℕ → Option IntervalDyadic := segment 411 values0875

theorem block0875_domain : ExactDomain block0875 411 442 := by
  simpa only [values0875_size] using segment_domain 411 values0875

theorem block0875_get (i : Fin 31) :
    block0875 (411 + i.val) = some (values0875[i.val]'(by rw [values0875_size]; exact i.isLt)) := by
  exact segment_get 411 values0875 ⟨i.val, by rw [values0875_size]; exact i.isLt⟩

def node0091_0155 : ℕ → Option IntervalDyadic := split 123 block0865 block0866

theorem node0091_0155_domain : ExactDomain node0091_0155 91 155 := by
  exact split_domain (by decide) (by decide) block0865_domain block0866_domain

def node0059_0155 : ℕ → Option IntervalDyadic := split 91 block0864 node0091_0155

theorem node0059_0155_domain : ExactDomain node0059_0155 59 155 := by
  exact split_domain (by decide) (by decide) block0864_domain node0091_0155_domain

def node0187_0251 : ℕ → Option IntervalDyadic := split 219 block0868 block0869

theorem node0187_0251_domain : ExactDomain node0187_0251 187 251 := by
  exact split_domain (by decide) (by decide) block0868_domain block0869_domain

def node0155_0251 : ℕ → Option IntervalDyadic := split 187 block0867 node0187_0251

theorem node0155_0251_domain : ExactDomain node0155_0251 155 251 := by
  exact split_domain (by decide) (by decide) block0867_domain node0187_0251_domain

def node0059_0251 : ℕ → Option IntervalDyadic := split 155 node0059_0155 node0155_0251

theorem node0059_0251_domain : ExactDomain node0059_0251 59 251 := by
  exact split_domain (by decide) (by decide) node0059_0155_domain node0155_0251_domain

def node0283_0347 : ℕ → Option IntervalDyadic := split 315 block0871 block0872

theorem node0283_0347_domain : ExactDomain node0283_0347 283 347 := by
  exact split_domain (by decide) (by decide) block0871_domain block0872_domain

def node0251_0347 : ℕ → Option IntervalDyadic := split 283 block0870 node0283_0347

theorem node0251_0347_domain : ExactDomain node0251_0347 251 347 := by
  exact split_domain (by decide) (by decide) block0870_domain node0283_0347_domain

def node0379_0442 : ℕ → Option IntervalDyadic := split 411 block0874 block0875

theorem node0379_0442_domain : ExactDomain node0379_0442 379 442 := by
  exact split_domain (by decide) (by decide) block0874_domain block0875_domain

def node0347_0442 : ℕ → Option IntervalDyadic := split 379 block0873 node0379_0442

theorem node0347_0442_domain : ExactDomain node0347_0442 347 442 := by
  exact split_domain (by decide) (by decide) block0873_domain node0379_0442_domain

def node0251_0442 : ℕ → Option IntervalDyadic := split 347 node0251_0347 node0347_0442

theorem node0251_0442_domain : ExactDomain node0251_0442 251 442 := by
  exact split_domain (by decide) (by decide) node0251_0347_domain node0347_0442_domain

def node0059_0442 : ℕ → Option IntervalDyadic := split 251 node0059_0251 node0251_0442

theorem node0059_0442_domain : ExactDomain node0059_0442 59 442 := by
  exact split_domain (by decide) (by decide) node0059_0251_domain node0251_0442_domain

def lookup : ℕ → Option IntervalDyadic := node0059_0442

theorem lookup_domain : ExactDomain lookup 59 442 :=
  node0059_0442_domain

theorem block0864_lookup (i : Fin 32) :
    lookup (59 + i.val) = some (values0864[i.val]'(by rw [values0864_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (59 + i.val) = _
  rw [node0059_0442, split_left 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0059_0251, split_left 155 node0059_0155 node0155_0251 (by omega)]
  rw [node0059_0155, split_left 91 block0864 node0091_0155 (by omega)]
  exact block0864_get i

theorem block0865_lookup (i : Fin 32) :
    lookup (91 + i.val) = some (values0865[i.val]'(by rw [values0865_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (91 + i.val) = _
  rw [node0059_0442, split_left 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0059_0251, split_left 155 node0059_0155 node0155_0251 (by omega)]
  rw [node0059_0155, split_right 91 block0864 node0091_0155 (by omega)]
  rw [node0091_0155, split_left 123 block0865 block0866 (by omega)]
  exact block0865_get i

theorem block0866_lookup (i : Fin 32) :
    lookup (123 + i.val) = some (values0866[i.val]'(by rw [values0866_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (123 + i.val) = _
  rw [node0059_0442, split_left 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0059_0251, split_left 155 node0059_0155 node0155_0251 (by omega)]
  rw [node0059_0155, split_right 91 block0864 node0091_0155 (by omega)]
  rw [node0091_0155, split_right 123 block0865 block0866 (by omega)]
  exact block0866_get i

theorem block0867_lookup (i : Fin 32) :
    lookup (155 + i.val) = some (values0867[i.val]'(by rw [values0867_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (155 + i.val) = _
  rw [node0059_0442, split_left 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0059_0251, split_right 155 node0059_0155 node0155_0251 (by omega)]
  rw [node0155_0251, split_left 187 block0867 node0187_0251 (by omega)]
  exact block0867_get i

theorem block0868_lookup (i : Fin 32) :
    lookup (187 + i.val) = some (values0868[i.val]'(by rw [values0868_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (187 + i.val) = _
  rw [node0059_0442, split_left 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0059_0251, split_right 155 node0059_0155 node0155_0251 (by omega)]
  rw [node0155_0251, split_right 187 block0867 node0187_0251 (by omega)]
  rw [node0187_0251, split_left 219 block0868 block0869 (by omega)]
  exact block0868_get i

theorem block0869_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values0869[i.val]'(by rw [values0869_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (219 + i.val) = _
  rw [node0059_0442, split_left 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0059_0251, split_right 155 node0059_0155 node0155_0251 (by omega)]
  rw [node0155_0251, split_right 187 block0867 node0187_0251 (by omega)]
  rw [node0187_0251, split_right 219 block0868 block0869 (by omega)]
  exact block0869_get i

theorem block0870_lookup (i : Fin 32) :
    lookup (251 + i.val) = some (values0870[i.val]'(by rw [values0870_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (251 + i.val) = _
  rw [node0059_0442, split_right 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0251_0442, split_left 347 node0251_0347 node0347_0442 (by omega)]
  rw [node0251_0347, split_left 283 block0870 node0283_0347 (by omega)]
  exact block0870_get i

theorem block0871_lookup (i : Fin 32) :
    lookup (283 + i.val) = some (values0871[i.val]'(by rw [values0871_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (283 + i.val) = _
  rw [node0059_0442, split_right 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0251_0442, split_left 347 node0251_0347 node0347_0442 (by omega)]
  rw [node0251_0347, split_right 283 block0870 node0283_0347 (by omega)]
  rw [node0283_0347, split_left 315 block0871 block0872 (by omega)]
  exact block0871_get i

theorem block0872_lookup (i : Fin 32) :
    lookup (315 + i.val) = some (values0872[i.val]'(by rw [values0872_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (315 + i.val) = _
  rw [node0059_0442, split_right 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0251_0442, split_left 347 node0251_0347 node0347_0442 (by omega)]
  rw [node0251_0347, split_right 283 block0870 node0283_0347 (by omega)]
  rw [node0283_0347, split_right 315 block0871 block0872 (by omega)]
  exact block0872_get i

theorem block0873_lookup (i : Fin 32) :
    lookup (347 + i.val) = some (values0873[i.val]'(by rw [values0873_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (347 + i.val) = _
  rw [node0059_0442, split_right 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0251_0442, split_right 347 node0251_0347 node0347_0442 (by omega)]
  rw [node0347_0442, split_left 379 block0873 node0379_0442 (by omega)]
  exact block0873_get i

theorem block0874_lookup (i : Fin 32) :
    lookup (379 + i.val) = some (values0874[i.val]'(by rw [values0874_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (379 + i.val) = _
  rw [node0059_0442, split_right 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0251_0442, split_right 347 node0251_0347 node0347_0442 (by omega)]
  rw [node0347_0442, split_right 379 block0873 node0379_0442 (by omega)]
  rw [node0379_0442, split_left 411 block0874 block0875 (by omega)]
  exact block0874_get i

theorem block0875_lookup (i : Fin 31) :
    lookup (411 + i.val) = some (values0875[i.val]'(by rw [values0875_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0059_0442 (411 + i.val) = _
  rw [node0059_0442, split_right 251 node0059_0251 node0251_0442 (by omega)]
  rw [node0251_0442, split_right 347 node0251_0347 node0347_0442 (by omega)]
  rw [node0347_0442, split_right 379 block0873 node0379_0442 (by omega)]
  rw [node0379_0442, split_right 411 block0874 block0875 (by omega)]
  exact block0875_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0864_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0864_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0865_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0865_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0866_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0866_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0867_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0867_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0868_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0868_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0869_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0869_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0870_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0870_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0871_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0871_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0872_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0872_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0873_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0873_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0874_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0874_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0875_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0875_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0864_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0865_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0866_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0867_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0868_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0869_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0870_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0871_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0872_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0873_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0874_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow060.block0875_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow060
