import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0402
import Grothe.UpperChaos.OriginalRow227TriangleData0403
import Grothe.UpperChaos.OriginalRow227TriangleData0404
import Grothe.UpperChaos.OriginalRow227TriangleData0405
import Grothe.UpperChaos.OriginalRow227TriangleData0406
import Grothe.UpperChaos.OriginalRow227TriangleData0407
import Grothe.UpperChaos.OriginalRow227TriangleData0408
import Grothe.UpperChaos.OriginalRow227TriangleData0409
import Grothe.UpperChaos.OriginalRow227TriangleData0410
import Grothe.UpperChaos.OriginalRow227TriangleData0411
import Grothe.UpperChaos.OriginalRow227TriangleData0412
import Grothe.UpperChaos.OriginalRow227TriangleData0413
import Grothe.UpperChaos.OriginalRow227TriangleData0414
import Grothe.UpperChaos.OriginalRow227TriangleData0415
import Grothe.UpperChaos.OriginalRow227TriangleData0416

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow026

open ConditionalTableLookup

def values0402 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0402.coefficient26_25,
  OriginalRow227TriangleData0402.coefficient26_26,
  OriginalRow227TriangleData0402.coefficient26_27,
  OriginalRow227TriangleData0402.coefficient26_28,
  OriginalRow227TriangleData0402.coefficient26_29,
  OriginalRow227TriangleData0402.coefficient26_30,
  OriginalRow227TriangleData0402.coefficient26_31,
  OriginalRow227TriangleData0402.coefficient26_32,
  OriginalRow227TriangleData0402.coefficient26_33,
  OriginalRow227TriangleData0402.coefficient26_34,
  OriginalRow227TriangleData0402.coefficient26_35,
  OriginalRow227TriangleData0402.coefficient26_36,
  OriginalRow227TriangleData0402.coefficient26_37,
  OriginalRow227TriangleData0402.coefficient26_38,
  OriginalRow227TriangleData0402.coefficient26_39,
  OriginalRow227TriangleData0402.coefficient26_40,
  OriginalRow227TriangleData0402.coefficient26_41,
  OriginalRow227TriangleData0402.coefficient26_42,
  OriginalRow227TriangleData0402.coefficient26_43,
  OriginalRow227TriangleData0402.coefficient26_44,
  OriginalRow227TriangleData0402.coefficient26_45,
  OriginalRow227TriangleData0402.coefficient26_46,
  OriginalRow227TriangleData0402.coefficient26_47,
  OriginalRow227TriangleData0402.coefficient26_48,
  OriginalRow227TriangleData0402.coefficient26_49,
  OriginalRow227TriangleData0402.coefficient26_50,
  OriginalRow227TriangleData0402.coefficient26_51,
  OriginalRow227TriangleData0402.coefficient26_52,
  OriginalRow227TriangleData0402.coefficient26_53,
  OriginalRow227TriangleData0402.coefficient26_54,
  OriginalRow227TriangleData0402.coefficient26_55,
  OriginalRow227TriangleData0402.coefficient26_56
]

theorem values0402_size : values0402.size = 32 := rfl

def block0402 : ℕ → Option IntervalDyadic := segment 25 values0402

theorem block0402_domain : ExactDomain block0402 25 57 := by
  simpa only [values0402_size] using segment_domain 25 values0402

theorem block0402_get (i : Fin 32) :
    block0402 (25 + i.val) = some (values0402[i.val]'(by rw [values0402_size]; exact i.isLt)) := by
  exact segment_get 25 values0402 ⟨i.val, by rw [values0402_size]; exact i.isLt⟩

def values0403 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0403.coefficient26_57,
  OriginalRow227TriangleData0403.coefficient26_58,
  OriginalRow227TriangleData0403.coefficient26_59,
  OriginalRow227TriangleData0403.coefficient26_60,
  OriginalRow227TriangleData0403.coefficient26_61,
  OriginalRow227TriangleData0403.coefficient26_62,
  OriginalRow227TriangleData0403.coefficient26_63,
  OriginalRow227TriangleData0403.coefficient26_64,
  OriginalRow227TriangleData0403.coefficient26_65,
  OriginalRow227TriangleData0403.coefficient26_66,
  OriginalRow227TriangleData0403.coefficient26_67,
  OriginalRow227TriangleData0403.coefficient26_68,
  OriginalRow227TriangleData0403.coefficient26_69,
  OriginalRow227TriangleData0403.coefficient26_70,
  OriginalRow227TriangleData0403.coefficient26_71,
  OriginalRow227TriangleData0403.coefficient26_72,
  OriginalRow227TriangleData0403.coefficient26_73,
  OriginalRow227TriangleData0403.coefficient26_74,
  OriginalRow227TriangleData0403.coefficient26_75,
  OriginalRow227TriangleData0403.coefficient26_76,
  OriginalRow227TriangleData0403.coefficient26_77,
  OriginalRow227TriangleData0403.coefficient26_78,
  OriginalRow227TriangleData0403.coefficient26_79,
  OriginalRow227TriangleData0403.coefficient26_80,
  OriginalRow227TriangleData0403.coefficient26_81,
  OriginalRow227TriangleData0403.coefficient26_82,
  OriginalRow227TriangleData0403.coefficient26_83,
  OriginalRow227TriangleData0403.coefficient26_84,
  OriginalRow227TriangleData0403.coefficient26_85,
  OriginalRow227TriangleData0403.coefficient26_86,
  OriginalRow227TriangleData0403.coefficient26_87,
  OriginalRow227TriangleData0403.coefficient26_88
]

theorem values0403_size : values0403.size = 32 := rfl

def block0403 : ℕ → Option IntervalDyadic := segment 57 values0403

theorem block0403_domain : ExactDomain block0403 57 89 := by
  simpa only [values0403_size] using segment_domain 57 values0403

theorem block0403_get (i : Fin 32) :
    block0403 (57 + i.val) = some (values0403[i.val]'(by rw [values0403_size]; exact i.isLt)) := by
  exact segment_get 57 values0403 ⟨i.val, by rw [values0403_size]; exact i.isLt⟩

def values0404 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0404.coefficient26_89,
  OriginalRow227TriangleData0404.coefficient26_90,
  OriginalRow227TriangleData0404.coefficient26_91,
  OriginalRow227TriangleData0404.coefficient26_92,
  OriginalRow227TriangleData0404.coefficient26_93,
  OriginalRow227TriangleData0404.coefficient26_94,
  OriginalRow227TriangleData0404.coefficient26_95,
  OriginalRow227TriangleData0404.coefficient26_96,
  OriginalRow227TriangleData0404.coefficient26_97,
  OriginalRow227TriangleData0404.coefficient26_98,
  OriginalRow227TriangleData0404.coefficient26_99,
  OriginalRow227TriangleData0404.coefficient26_100,
  OriginalRow227TriangleData0404.coefficient26_101,
  OriginalRow227TriangleData0404.coefficient26_102,
  OriginalRow227TriangleData0404.coefficient26_103,
  OriginalRow227TriangleData0404.coefficient26_104,
  OriginalRow227TriangleData0404.coefficient26_105,
  OriginalRow227TriangleData0404.coefficient26_106,
  OriginalRow227TriangleData0404.coefficient26_107,
  OriginalRow227TriangleData0404.coefficient26_108,
  OriginalRow227TriangleData0404.coefficient26_109,
  OriginalRow227TriangleData0404.coefficient26_110,
  OriginalRow227TriangleData0404.coefficient26_111,
  OriginalRow227TriangleData0404.coefficient26_112,
  OriginalRow227TriangleData0404.coefficient26_113,
  OriginalRow227TriangleData0404.coefficient26_114,
  OriginalRow227TriangleData0404.coefficient26_115,
  OriginalRow227TriangleData0404.coefficient26_116,
  OriginalRow227TriangleData0404.coefficient26_117,
  OriginalRow227TriangleData0404.coefficient26_118,
  OriginalRow227TriangleData0404.coefficient26_119,
  OriginalRow227TriangleData0404.coefficient26_120
]

theorem values0404_size : values0404.size = 32 := rfl

def block0404 : ℕ → Option IntervalDyadic := segment 89 values0404

theorem block0404_domain : ExactDomain block0404 89 121 := by
  simpa only [values0404_size] using segment_domain 89 values0404

theorem block0404_get (i : Fin 32) :
    block0404 (89 + i.val) = some (values0404[i.val]'(by rw [values0404_size]; exact i.isLt)) := by
  exact segment_get 89 values0404 ⟨i.val, by rw [values0404_size]; exact i.isLt⟩

def values0405 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0405.coefficient26_121,
  OriginalRow227TriangleData0405.coefficient26_122,
  OriginalRow227TriangleData0405.coefficient26_123,
  OriginalRow227TriangleData0405.coefficient26_124,
  OriginalRow227TriangleData0405.coefficient26_125,
  OriginalRow227TriangleData0405.coefficient26_126,
  OriginalRow227TriangleData0405.coefficient26_127,
  OriginalRow227TriangleData0405.coefficient26_128,
  OriginalRow227TriangleData0405.coefficient26_129,
  OriginalRow227TriangleData0405.coefficient26_130,
  OriginalRow227TriangleData0405.coefficient26_131,
  OriginalRow227TriangleData0405.coefficient26_132,
  OriginalRow227TriangleData0405.coefficient26_133,
  OriginalRow227TriangleData0405.coefficient26_134,
  OriginalRow227TriangleData0405.coefficient26_135,
  OriginalRow227TriangleData0405.coefficient26_136,
  OriginalRow227TriangleData0405.coefficient26_137,
  OriginalRow227TriangleData0405.coefficient26_138,
  OriginalRow227TriangleData0405.coefficient26_139,
  OriginalRow227TriangleData0405.coefficient26_140,
  OriginalRow227TriangleData0405.coefficient26_141,
  OriginalRow227TriangleData0405.coefficient26_142,
  OriginalRow227TriangleData0405.coefficient26_143,
  OriginalRow227TriangleData0405.coefficient26_144,
  OriginalRow227TriangleData0405.coefficient26_145,
  OriginalRow227TriangleData0405.coefficient26_146,
  OriginalRow227TriangleData0405.coefficient26_147,
  OriginalRow227TriangleData0405.coefficient26_148,
  OriginalRow227TriangleData0405.coefficient26_149,
  OriginalRow227TriangleData0405.coefficient26_150,
  OriginalRow227TriangleData0405.coefficient26_151,
  OriginalRow227TriangleData0405.coefficient26_152
]

theorem values0405_size : values0405.size = 32 := rfl

def block0405 : ℕ → Option IntervalDyadic := segment 121 values0405

theorem block0405_domain : ExactDomain block0405 121 153 := by
  simpa only [values0405_size] using segment_domain 121 values0405

theorem block0405_get (i : Fin 32) :
    block0405 (121 + i.val) = some (values0405[i.val]'(by rw [values0405_size]; exact i.isLt)) := by
  exact segment_get 121 values0405 ⟨i.val, by rw [values0405_size]; exact i.isLt⟩

def values0406 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0406.coefficient26_153,
  OriginalRow227TriangleData0406.coefficient26_154,
  OriginalRow227TriangleData0406.coefficient26_155,
  OriginalRow227TriangleData0406.coefficient26_156,
  OriginalRow227TriangleData0406.coefficient26_157,
  OriginalRow227TriangleData0406.coefficient26_158,
  OriginalRow227TriangleData0406.coefficient26_159,
  OriginalRow227TriangleData0406.coefficient26_160,
  OriginalRow227TriangleData0406.coefficient26_161,
  OriginalRow227TriangleData0406.coefficient26_162,
  OriginalRow227TriangleData0406.coefficient26_163,
  OriginalRow227TriangleData0406.coefficient26_164,
  OriginalRow227TriangleData0406.coefficient26_165,
  OriginalRow227TriangleData0406.coefficient26_166,
  OriginalRow227TriangleData0406.coefficient26_167,
  OriginalRow227TriangleData0406.coefficient26_168,
  OriginalRow227TriangleData0406.coefficient26_169,
  OriginalRow227TriangleData0406.coefficient26_170,
  OriginalRow227TriangleData0406.coefficient26_171,
  OriginalRow227TriangleData0406.coefficient26_172,
  OriginalRow227TriangleData0406.coefficient26_173,
  OriginalRow227TriangleData0406.coefficient26_174,
  OriginalRow227TriangleData0406.coefficient26_175,
  OriginalRow227TriangleData0406.coefficient26_176,
  OriginalRow227TriangleData0406.coefficient26_177,
  OriginalRow227TriangleData0406.coefficient26_178,
  OriginalRow227TriangleData0406.coefficient26_179,
  OriginalRow227TriangleData0406.coefficient26_180,
  OriginalRow227TriangleData0406.coefficient26_181,
  OriginalRow227TriangleData0406.coefficient26_182,
  OriginalRow227TriangleData0406.coefficient26_183,
  OriginalRow227TriangleData0406.coefficient26_184
]

theorem values0406_size : values0406.size = 32 := rfl

def block0406 : ℕ → Option IntervalDyadic := segment 153 values0406

theorem block0406_domain : ExactDomain block0406 153 185 := by
  simpa only [values0406_size] using segment_domain 153 values0406

theorem block0406_get (i : Fin 32) :
    block0406 (153 + i.val) = some (values0406[i.val]'(by rw [values0406_size]; exact i.isLt)) := by
  exact segment_get 153 values0406 ⟨i.val, by rw [values0406_size]; exact i.isLt⟩

def values0407 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0407.coefficient26_185,
  OriginalRow227TriangleData0407.coefficient26_186,
  OriginalRow227TriangleData0407.coefficient26_187,
  OriginalRow227TriangleData0407.coefficient26_188,
  OriginalRow227TriangleData0407.coefficient26_189,
  OriginalRow227TriangleData0407.coefficient26_190,
  OriginalRow227TriangleData0407.coefficient26_191,
  OriginalRow227TriangleData0407.coefficient26_192,
  OriginalRow227TriangleData0407.coefficient26_193,
  OriginalRow227TriangleData0407.coefficient26_194,
  OriginalRow227TriangleData0407.coefficient26_195,
  OriginalRow227TriangleData0407.coefficient26_196,
  OriginalRow227TriangleData0407.coefficient26_197,
  OriginalRow227TriangleData0407.coefficient26_198,
  OriginalRow227TriangleData0407.coefficient26_199,
  OriginalRow227TriangleData0407.coefficient26_200,
  OriginalRow227TriangleData0407.coefficient26_201,
  OriginalRow227TriangleData0407.coefficient26_202,
  OriginalRow227TriangleData0407.coefficient26_203,
  OriginalRow227TriangleData0407.coefficient26_204,
  OriginalRow227TriangleData0407.coefficient26_205,
  OriginalRow227TriangleData0407.coefficient26_206,
  OriginalRow227TriangleData0407.coefficient26_207,
  OriginalRow227TriangleData0407.coefficient26_208,
  OriginalRow227TriangleData0407.coefficient26_209,
  OriginalRow227TriangleData0407.coefficient26_210,
  OriginalRow227TriangleData0407.coefficient26_211,
  OriginalRow227TriangleData0407.coefficient26_212,
  OriginalRow227TriangleData0407.coefficient26_213,
  OriginalRow227TriangleData0407.coefficient26_214,
  OriginalRow227TriangleData0407.coefficient26_215,
  OriginalRow227TriangleData0407.coefficient26_216
]

theorem values0407_size : values0407.size = 32 := rfl

def block0407 : ℕ → Option IntervalDyadic := segment 185 values0407

theorem block0407_domain : ExactDomain block0407 185 217 := by
  simpa only [values0407_size] using segment_domain 185 values0407

theorem block0407_get (i : Fin 32) :
    block0407 (185 + i.val) = some (values0407[i.val]'(by rw [values0407_size]; exact i.isLt)) := by
  exact segment_get 185 values0407 ⟨i.val, by rw [values0407_size]; exact i.isLt⟩

def values0408 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0408.coefficient26_217,
  OriginalRow227TriangleData0408.coefficient26_218,
  OriginalRow227TriangleData0408.coefficient26_219,
  OriginalRow227TriangleData0408.coefficient26_220,
  OriginalRow227TriangleData0408.coefficient26_221,
  OriginalRow227TriangleData0408.coefficient26_222,
  OriginalRow227TriangleData0408.coefficient26_223,
  OriginalRow227TriangleData0408.coefficient26_224,
  OriginalRow227TriangleData0408.coefficient26_225,
  OriginalRow227TriangleData0408.coefficient26_226,
  OriginalRow227TriangleData0408.coefficient26_227,
  OriginalRow227TriangleData0408.coefficient26_228,
  OriginalRow227TriangleData0408.coefficient26_229,
  OriginalRow227TriangleData0408.coefficient26_230,
  OriginalRow227TriangleData0408.coefficient26_231,
  OriginalRow227TriangleData0408.coefficient26_232,
  OriginalRow227TriangleData0408.coefficient26_233,
  OriginalRow227TriangleData0408.coefficient26_234,
  OriginalRow227TriangleData0408.coefficient26_235,
  OriginalRow227TriangleData0408.coefficient26_236,
  OriginalRow227TriangleData0408.coefficient26_237,
  OriginalRow227TriangleData0408.coefficient26_238,
  OriginalRow227TriangleData0408.coefficient26_239,
  OriginalRow227TriangleData0408.coefficient26_240,
  OriginalRow227TriangleData0408.coefficient26_241,
  OriginalRow227TriangleData0408.coefficient26_242,
  OriginalRow227TriangleData0408.coefficient26_243,
  OriginalRow227TriangleData0408.coefficient26_244,
  OriginalRow227TriangleData0408.coefficient26_245,
  OriginalRow227TriangleData0408.coefficient26_246,
  OriginalRow227TriangleData0408.coefficient26_247,
  OriginalRow227TriangleData0408.coefficient26_248
]

theorem values0408_size : values0408.size = 32 := rfl

def block0408 : ℕ → Option IntervalDyadic := segment 217 values0408

theorem block0408_domain : ExactDomain block0408 217 249 := by
  simpa only [values0408_size] using segment_domain 217 values0408

theorem block0408_get (i : Fin 32) :
    block0408 (217 + i.val) = some (values0408[i.val]'(by rw [values0408_size]; exact i.isLt)) := by
  exact segment_get 217 values0408 ⟨i.val, by rw [values0408_size]; exact i.isLt⟩

def values0409 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0409.coefficient26_249,
  OriginalRow227TriangleData0409.coefficient26_250,
  OriginalRow227TriangleData0409.coefficient26_251,
  OriginalRow227TriangleData0409.coefficient26_252,
  OriginalRow227TriangleData0409.coefficient26_253,
  OriginalRow227TriangleData0409.coefficient26_254,
  OriginalRow227TriangleData0409.coefficient26_255,
  OriginalRow227TriangleData0409.coefficient26_256,
  OriginalRow227TriangleData0409.coefficient26_257,
  OriginalRow227TriangleData0409.coefficient26_258,
  OriginalRow227TriangleData0409.coefficient26_259,
  OriginalRow227TriangleData0409.coefficient26_260,
  OriginalRow227TriangleData0409.coefficient26_261,
  OriginalRow227TriangleData0409.coefficient26_262,
  OriginalRow227TriangleData0409.coefficient26_263,
  OriginalRow227TriangleData0409.coefficient26_264,
  OriginalRow227TriangleData0409.coefficient26_265,
  OriginalRow227TriangleData0409.coefficient26_266,
  OriginalRow227TriangleData0409.coefficient26_267,
  OriginalRow227TriangleData0409.coefficient26_268,
  OriginalRow227TriangleData0409.coefficient26_269,
  OriginalRow227TriangleData0409.coefficient26_270,
  OriginalRow227TriangleData0409.coefficient26_271,
  OriginalRow227TriangleData0409.coefficient26_272,
  OriginalRow227TriangleData0409.coefficient26_273,
  OriginalRow227TriangleData0409.coefficient26_274,
  OriginalRow227TriangleData0409.coefficient26_275,
  OriginalRow227TriangleData0409.coefficient26_276,
  OriginalRow227TriangleData0409.coefficient26_277,
  OriginalRow227TriangleData0409.coefficient26_278,
  OriginalRow227TriangleData0409.coefficient26_279,
  OriginalRow227TriangleData0409.coefficient26_280
]

theorem values0409_size : values0409.size = 32 := rfl

def block0409 : ℕ → Option IntervalDyadic := segment 249 values0409

theorem block0409_domain : ExactDomain block0409 249 281 := by
  simpa only [values0409_size] using segment_domain 249 values0409

theorem block0409_get (i : Fin 32) :
    block0409 (249 + i.val) = some (values0409[i.val]'(by rw [values0409_size]; exact i.isLt)) := by
  exact segment_get 249 values0409 ⟨i.val, by rw [values0409_size]; exact i.isLt⟩

def values0410 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0410.coefficient26_281,
  OriginalRow227TriangleData0410.coefficient26_282,
  OriginalRow227TriangleData0410.coefficient26_283,
  OriginalRow227TriangleData0410.coefficient26_284,
  OriginalRow227TriangleData0410.coefficient26_285,
  OriginalRow227TriangleData0410.coefficient26_286,
  OriginalRow227TriangleData0410.coefficient26_287,
  OriginalRow227TriangleData0410.coefficient26_288,
  OriginalRow227TriangleData0410.coefficient26_289,
  OriginalRow227TriangleData0410.coefficient26_290,
  OriginalRow227TriangleData0410.coefficient26_291,
  OriginalRow227TriangleData0410.coefficient26_292,
  OriginalRow227TriangleData0410.coefficient26_293,
  OriginalRow227TriangleData0410.coefficient26_294,
  OriginalRow227TriangleData0410.coefficient26_295,
  OriginalRow227TriangleData0410.coefficient26_296,
  OriginalRow227TriangleData0410.coefficient26_297,
  OriginalRow227TriangleData0410.coefficient26_298,
  OriginalRow227TriangleData0410.coefficient26_299,
  OriginalRow227TriangleData0410.coefficient26_300,
  OriginalRow227TriangleData0410.coefficient26_301,
  OriginalRow227TriangleData0410.coefficient26_302,
  OriginalRow227TriangleData0410.coefficient26_303,
  OriginalRow227TriangleData0410.coefficient26_304,
  OriginalRow227TriangleData0410.coefficient26_305,
  OriginalRow227TriangleData0410.coefficient26_306,
  OriginalRow227TriangleData0410.coefficient26_307,
  OriginalRow227TriangleData0410.coefficient26_308,
  OriginalRow227TriangleData0410.coefficient26_309,
  OriginalRow227TriangleData0410.coefficient26_310,
  OriginalRow227TriangleData0410.coefficient26_311,
  OriginalRow227TriangleData0410.coefficient26_312
]

theorem values0410_size : values0410.size = 32 := rfl

def block0410 : ℕ → Option IntervalDyadic := segment 281 values0410

theorem block0410_domain : ExactDomain block0410 281 313 := by
  simpa only [values0410_size] using segment_domain 281 values0410

theorem block0410_get (i : Fin 32) :
    block0410 (281 + i.val) = some (values0410[i.val]'(by rw [values0410_size]; exact i.isLt)) := by
  exact segment_get 281 values0410 ⟨i.val, by rw [values0410_size]; exact i.isLt⟩

def values0411 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0411.coefficient26_313,
  OriginalRow227TriangleData0411.coefficient26_314,
  OriginalRow227TriangleData0411.coefficient26_315,
  OriginalRow227TriangleData0411.coefficient26_316,
  OriginalRow227TriangleData0411.coefficient26_317,
  OriginalRow227TriangleData0411.coefficient26_318,
  OriginalRow227TriangleData0411.coefficient26_319,
  OriginalRow227TriangleData0411.coefficient26_320,
  OriginalRow227TriangleData0411.coefficient26_321,
  OriginalRow227TriangleData0411.coefficient26_322,
  OriginalRow227TriangleData0411.coefficient26_323,
  OriginalRow227TriangleData0411.coefficient26_324,
  OriginalRow227TriangleData0411.coefficient26_325,
  OriginalRow227TriangleData0411.coefficient26_326,
  OriginalRow227TriangleData0411.coefficient26_327,
  OriginalRow227TriangleData0411.coefficient26_328,
  OriginalRow227TriangleData0411.coefficient26_329,
  OriginalRow227TriangleData0411.coefficient26_330,
  OriginalRow227TriangleData0411.coefficient26_331,
  OriginalRow227TriangleData0411.coefficient26_332,
  OriginalRow227TriangleData0411.coefficient26_333,
  OriginalRow227TriangleData0411.coefficient26_334,
  OriginalRow227TriangleData0411.coefficient26_335,
  OriginalRow227TriangleData0411.coefficient26_336,
  OriginalRow227TriangleData0411.coefficient26_337,
  OriginalRow227TriangleData0411.coefficient26_338,
  OriginalRow227TriangleData0411.coefficient26_339,
  OriginalRow227TriangleData0411.coefficient26_340,
  OriginalRow227TriangleData0411.coefficient26_341,
  OriginalRow227TriangleData0411.coefficient26_342,
  OriginalRow227TriangleData0411.coefficient26_343,
  OriginalRow227TriangleData0411.coefficient26_344
]

theorem values0411_size : values0411.size = 32 := rfl

def block0411 : ℕ → Option IntervalDyadic := segment 313 values0411

theorem block0411_domain : ExactDomain block0411 313 345 := by
  simpa only [values0411_size] using segment_domain 313 values0411

theorem block0411_get (i : Fin 32) :
    block0411 (313 + i.val) = some (values0411[i.val]'(by rw [values0411_size]; exact i.isLt)) := by
  exact segment_get 313 values0411 ⟨i.val, by rw [values0411_size]; exact i.isLt⟩

def values0412 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0412.coefficient26_345,
  OriginalRow227TriangleData0412.coefficient26_346,
  OriginalRow227TriangleData0412.coefficient26_347,
  OriginalRow227TriangleData0412.coefficient26_348,
  OriginalRow227TriangleData0412.coefficient26_349,
  OriginalRow227TriangleData0412.coefficient26_350,
  OriginalRow227TriangleData0412.coefficient26_351,
  OriginalRow227TriangleData0412.coefficient26_352,
  OriginalRow227TriangleData0412.coefficient26_353,
  OriginalRow227TriangleData0412.coefficient26_354,
  OriginalRow227TriangleData0412.coefficient26_355,
  OriginalRow227TriangleData0412.coefficient26_356,
  OriginalRow227TriangleData0412.coefficient26_357,
  OriginalRow227TriangleData0412.coefficient26_358,
  OriginalRow227TriangleData0412.coefficient26_359,
  OriginalRow227TriangleData0412.coefficient26_360,
  OriginalRow227TriangleData0412.coefficient26_361,
  OriginalRow227TriangleData0412.coefficient26_362,
  OriginalRow227TriangleData0412.coefficient26_363,
  OriginalRow227TriangleData0412.coefficient26_364,
  OriginalRow227TriangleData0412.coefficient26_365,
  OriginalRow227TriangleData0412.coefficient26_366,
  OriginalRow227TriangleData0412.coefficient26_367,
  OriginalRow227TriangleData0412.coefficient26_368,
  OriginalRow227TriangleData0412.coefficient26_369,
  OriginalRow227TriangleData0412.coefficient26_370,
  OriginalRow227TriangleData0412.coefficient26_371,
  OriginalRow227TriangleData0412.coefficient26_372,
  OriginalRow227TriangleData0412.coefficient26_373,
  OriginalRow227TriangleData0412.coefficient26_374,
  OriginalRow227TriangleData0412.coefficient26_375,
  OriginalRow227TriangleData0412.coefficient26_376
]

theorem values0412_size : values0412.size = 32 := rfl

def block0412 : ℕ → Option IntervalDyadic := segment 345 values0412

theorem block0412_domain : ExactDomain block0412 345 377 := by
  simpa only [values0412_size] using segment_domain 345 values0412

theorem block0412_get (i : Fin 32) :
    block0412 (345 + i.val) = some (values0412[i.val]'(by rw [values0412_size]; exact i.isLt)) := by
  exact segment_get 345 values0412 ⟨i.val, by rw [values0412_size]; exact i.isLt⟩

def values0413 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0413.coefficient26_377,
  OriginalRow227TriangleData0413.coefficient26_378,
  OriginalRow227TriangleData0413.coefficient26_379,
  OriginalRow227TriangleData0413.coefficient26_380,
  OriginalRow227TriangleData0413.coefficient26_381,
  OriginalRow227TriangleData0413.coefficient26_382,
  OriginalRow227TriangleData0413.coefficient26_383,
  OriginalRow227TriangleData0413.coefficient26_384,
  OriginalRow227TriangleData0413.coefficient26_385,
  OriginalRow227TriangleData0413.coefficient26_386,
  OriginalRow227TriangleData0413.coefficient26_387,
  OriginalRow227TriangleData0413.coefficient26_388,
  OriginalRow227TriangleData0413.coefficient26_389,
  OriginalRow227TriangleData0413.coefficient26_390,
  OriginalRow227TriangleData0413.coefficient26_391,
  OriginalRow227TriangleData0413.coefficient26_392,
  OriginalRow227TriangleData0413.coefficient26_393,
  OriginalRow227TriangleData0413.coefficient26_394,
  OriginalRow227TriangleData0413.coefficient26_395,
  OriginalRow227TriangleData0413.coefficient26_396,
  OriginalRow227TriangleData0413.coefficient26_397,
  OriginalRow227TriangleData0413.coefficient26_398,
  OriginalRow227TriangleData0413.coefficient26_399,
  OriginalRow227TriangleData0413.coefficient26_400,
  OriginalRow227TriangleData0413.coefficient26_401,
  OriginalRow227TriangleData0413.coefficient26_402,
  OriginalRow227TriangleData0413.coefficient26_403,
  OriginalRow227TriangleData0413.coefficient26_404,
  OriginalRow227TriangleData0413.coefficient26_405,
  OriginalRow227TriangleData0413.coefficient26_406,
  OriginalRow227TriangleData0413.coefficient26_407,
  OriginalRow227TriangleData0413.coefficient26_408
]

theorem values0413_size : values0413.size = 32 := rfl

def block0413 : ℕ → Option IntervalDyadic := segment 377 values0413

theorem block0413_domain : ExactDomain block0413 377 409 := by
  simpa only [values0413_size] using segment_domain 377 values0413

theorem block0413_get (i : Fin 32) :
    block0413 (377 + i.val) = some (values0413[i.val]'(by rw [values0413_size]; exact i.isLt)) := by
  exact segment_get 377 values0413 ⟨i.val, by rw [values0413_size]; exact i.isLt⟩

def values0414 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0414.coefficient26_409,
  OriginalRow227TriangleData0414.coefficient26_410,
  OriginalRow227TriangleData0414.coefficient26_411,
  OriginalRow227TriangleData0414.coefficient26_412,
  OriginalRow227TriangleData0414.coefficient26_413,
  OriginalRow227TriangleData0414.coefficient26_414,
  OriginalRow227TriangleData0414.coefficient26_415,
  OriginalRow227TriangleData0414.coefficient26_416,
  OriginalRow227TriangleData0414.coefficient26_417,
  OriginalRow227TriangleData0414.coefficient26_418,
  OriginalRow227TriangleData0414.coefficient26_419,
  OriginalRow227TriangleData0414.coefficient26_420,
  OriginalRow227TriangleData0414.coefficient26_421,
  OriginalRow227TriangleData0414.coefficient26_422,
  OriginalRow227TriangleData0414.coefficient26_423,
  OriginalRow227TriangleData0414.coefficient26_424,
  OriginalRow227TriangleData0414.coefficient26_425,
  OriginalRow227TriangleData0414.coefficient26_426,
  OriginalRow227TriangleData0414.coefficient26_427,
  OriginalRow227TriangleData0414.coefficient26_428,
  OriginalRow227TriangleData0414.coefficient26_429,
  OriginalRow227TriangleData0414.coefficient26_430,
  OriginalRow227TriangleData0414.coefficient26_431,
  OriginalRow227TriangleData0414.coefficient26_432,
  OriginalRow227TriangleData0414.coefficient26_433,
  OriginalRow227TriangleData0414.coefficient26_434,
  OriginalRow227TriangleData0414.coefficient26_435,
  OriginalRow227TriangleData0414.coefficient26_436,
  OriginalRow227TriangleData0414.coefficient26_437,
  OriginalRow227TriangleData0414.coefficient26_438,
  OriginalRow227TriangleData0414.coefficient26_439,
  OriginalRow227TriangleData0414.coefficient26_440
]

theorem values0414_size : values0414.size = 32 := rfl

def block0414 : ℕ → Option IntervalDyadic := segment 409 values0414

theorem block0414_domain : ExactDomain block0414 409 441 := by
  simpa only [values0414_size] using segment_domain 409 values0414

theorem block0414_get (i : Fin 32) :
    block0414 (409 + i.val) = some (values0414[i.val]'(by rw [values0414_size]; exact i.isLt)) := by
  exact segment_get 409 values0414 ⟨i.val, by rw [values0414_size]; exact i.isLt⟩

def values0415 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0415.coefficient26_441,
  OriginalRow227TriangleData0415.coefficient26_442,
  OriginalRow227TriangleData0415.coefficient26_443,
  OriginalRow227TriangleData0415.coefficient26_444,
  OriginalRow227TriangleData0415.coefficient26_445,
  OriginalRow227TriangleData0415.coefficient26_446,
  OriginalRow227TriangleData0415.coefficient26_447,
  OriginalRow227TriangleData0415.coefficient26_448,
  OriginalRow227TriangleData0415.coefficient26_449,
  OriginalRow227TriangleData0415.coefficient26_450,
  OriginalRow227TriangleData0415.coefficient26_451,
  OriginalRow227TriangleData0415.coefficient26_452,
  OriginalRow227TriangleData0415.coefficient26_453,
  OriginalRow227TriangleData0415.coefficient26_454,
  OriginalRow227TriangleData0415.coefficient26_455,
  OriginalRow227TriangleData0415.coefficient26_456,
  OriginalRow227TriangleData0415.coefficient26_457,
  OriginalRow227TriangleData0415.coefficient26_458,
  OriginalRow227TriangleData0415.coefficient26_459,
  OriginalRow227TriangleData0415.coefficient26_460,
  OriginalRow227TriangleData0415.coefficient26_461,
  OriginalRow227TriangleData0415.coefficient26_462,
  OriginalRow227TriangleData0415.coefficient26_463,
  OriginalRow227TriangleData0415.coefficient26_464,
  OriginalRow227TriangleData0415.coefficient26_465,
  OriginalRow227TriangleData0415.coefficient26_466,
  OriginalRow227TriangleData0415.coefficient26_467,
  OriginalRow227TriangleData0415.coefficient26_468,
  OriginalRow227TriangleData0415.coefficient26_469,
  OriginalRow227TriangleData0415.coefficient26_470,
  OriginalRow227TriangleData0415.coefficient26_471,
  OriginalRow227TriangleData0415.coefficient26_472
]

theorem values0415_size : values0415.size = 32 := rfl

def block0415 : ℕ → Option IntervalDyadic := segment 441 values0415

theorem block0415_domain : ExactDomain block0415 441 473 := by
  simpa only [values0415_size] using segment_domain 441 values0415

theorem block0415_get (i : Fin 32) :
    block0415 (441 + i.val) = some (values0415[i.val]'(by rw [values0415_size]; exact i.isLt)) := by
  exact segment_get 441 values0415 ⟨i.val, by rw [values0415_size]; exact i.isLt⟩

def values0416 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0416.coefficient26_473,
  OriginalRow227TriangleData0416.coefficient26_474,
  OriginalRow227TriangleData0416.coefficient26_475
]

theorem values0416_size : values0416.size = 3 := rfl

def block0416 : ℕ → Option IntervalDyadic := segment 473 values0416

theorem block0416_domain : ExactDomain block0416 473 476 := by
  simpa only [values0416_size] using segment_domain 473 values0416

theorem block0416_get (i : Fin 3) :
    block0416 (473 + i.val) = some (values0416[i.val]'(by rw [values0416_size]; exact i.isLt)) := by
  exact segment_get 473 values0416 ⟨i.val, by rw [values0416_size]; exact i.isLt⟩

def node0057_0121 : ℕ → Option IntervalDyadic := split 89 block0403 block0404

theorem node0057_0121_domain : ExactDomain node0057_0121 57 121 := by
  exact split_domain (by decide) (by decide) block0403_domain block0404_domain

def node0025_0121 : ℕ → Option IntervalDyadic := split 57 block0402 node0057_0121

theorem node0025_0121_domain : ExactDomain node0025_0121 25 121 := by
  exact split_domain (by decide) (by decide) block0402_domain node0057_0121_domain

def node0121_0185 : ℕ → Option IntervalDyadic := split 153 block0405 block0406

theorem node0121_0185_domain : ExactDomain node0121_0185 121 185 := by
  exact split_domain (by decide) (by decide) block0405_domain block0406_domain

def node0185_0249 : ℕ → Option IntervalDyadic := split 217 block0407 block0408

theorem node0185_0249_domain : ExactDomain node0185_0249 185 249 := by
  exact split_domain (by decide) (by decide) block0407_domain block0408_domain

def node0121_0249 : ℕ → Option IntervalDyadic := split 185 node0121_0185 node0185_0249

theorem node0121_0249_domain : ExactDomain node0121_0249 121 249 := by
  exact split_domain (by decide) (by decide) node0121_0185_domain node0185_0249_domain

def node0025_0249 : ℕ → Option IntervalDyadic := split 121 node0025_0121 node0121_0249

theorem node0025_0249_domain : ExactDomain node0025_0249 25 249 := by
  exact split_domain (by decide) (by decide) node0025_0121_domain node0121_0249_domain

def node0249_0313 : ℕ → Option IntervalDyadic := split 281 block0409 block0410

theorem node0249_0313_domain : ExactDomain node0249_0313 249 313 := by
  exact split_domain (by decide) (by decide) block0409_domain block0410_domain

def node0313_0377 : ℕ → Option IntervalDyadic := split 345 block0411 block0412

theorem node0313_0377_domain : ExactDomain node0313_0377 313 377 := by
  exact split_domain (by decide) (by decide) block0411_domain block0412_domain

def node0249_0377 : ℕ → Option IntervalDyadic := split 313 node0249_0313 node0313_0377

theorem node0249_0377_domain : ExactDomain node0249_0377 249 377 := by
  exact split_domain (by decide) (by decide) node0249_0313_domain node0313_0377_domain

def node0377_0441 : ℕ → Option IntervalDyadic := split 409 block0413 block0414

theorem node0377_0441_domain : ExactDomain node0377_0441 377 441 := by
  exact split_domain (by decide) (by decide) block0413_domain block0414_domain

def node0441_0476 : ℕ → Option IntervalDyadic := split 473 block0415 block0416

theorem node0441_0476_domain : ExactDomain node0441_0476 441 476 := by
  exact split_domain (by decide) (by decide) block0415_domain block0416_domain

def node0377_0476 : ℕ → Option IntervalDyadic := split 441 node0377_0441 node0441_0476

theorem node0377_0476_domain : ExactDomain node0377_0476 377 476 := by
  exact split_domain (by decide) (by decide) node0377_0441_domain node0441_0476_domain

def node0249_0476 : ℕ → Option IntervalDyadic := split 377 node0249_0377 node0377_0476

theorem node0249_0476_domain : ExactDomain node0249_0476 249 476 := by
  exact split_domain (by decide) (by decide) node0249_0377_domain node0377_0476_domain

def node0025_0476 : ℕ → Option IntervalDyadic := split 249 node0025_0249 node0249_0476

theorem node0025_0476_domain : ExactDomain node0025_0476 25 476 := by
  exact split_domain (by decide) (by decide) node0025_0249_domain node0249_0476_domain

def lookup : ℕ → Option IntervalDyadic := node0025_0476

theorem lookup_domain : ExactDomain lookup 25 476 :=
  node0025_0476_domain

theorem block0402_lookup (i : Fin 32) :
    lookup (25 + i.val) = some (values0402[i.val]'(by rw [values0402_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (25 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_left 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0025_0121, split_left 57 block0402 node0057_0121 (by omega)]
  exact block0402_get i

theorem block0403_lookup (i : Fin 32) :
    lookup (57 + i.val) = some (values0403[i.val]'(by rw [values0403_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (57 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_left 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0025_0121, split_right 57 block0402 node0057_0121 (by omega)]
  rw [node0057_0121, split_left 89 block0403 block0404 (by omega)]
  exact block0403_get i

theorem block0404_lookup (i : Fin 32) :
    lookup (89 + i.val) = some (values0404[i.val]'(by rw [values0404_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (89 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_left 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0025_0121, split_right 57 block0402 node0057_0121 (by omega)]
  rw [node0057_0121, split_right 89 block0403 block0404 (by omega)]
  exact block0404_get i

theorem block0405_lookup (i : Fin 32) :
    lookup (121 + i.val) = some (values0405[i.val]'(by rw [values0405_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (121 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_right 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0121_0249, split_left 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0121_0185, split_left 153 block0405 block0406 (by omega)]
  exact block0405_get i

theorem block0406_lookup (i : Fin 32) :
    lookup (153 + i.val) = some (values0406[i.val]'(by rw [values0406_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (153 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_right 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0121_0249, split_left 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0121_0185, split_right 153 block0405 block0406 (by omega)]
  exact block0406_get i

theorem block0407_lookup (i : Fin 32) :
    lookup (185 + i.val) = some (values0407[i.val]'(by rw [values0407_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (185 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_right 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0121_0249, split_right 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0185_0249, split_left 217 block0407 block0408 (by omega)]
  exact block0407_get i

theorem block0408_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values0408[i.val]'(by rw [values0408_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (217 + i.val) = _
  rw [node0025_0476, split_left 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0025_0249, split_right 121 node0025_0121 node0121_0249 (by omega)]
  rw [node0121_0249, split_right 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0185_0249, split_right 217 block0407 block0408 (by omega)]
  exact block0408_get i

theorem block0409_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values0409[i.val]'(by rw [values0409_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (249 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_left 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0249_0377, split_left 313 node0249_0313 node0313_0377 (by omega)]
  rw [node0249_0313, split_left 281 block0409 block0410 (by omega)]
  exact block0409_get i

theorem block0410_lookup (i : Fin 32) :
    lookup (281 + i.val) = some (values0410[i.val]'(by rw [values0410_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (281 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_left 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0249_0377, split_left 313 node0249_0313 node0313_0377 (by omega)]
  rw [node0249_0313, split_right 281 block0409 block0410 (by omega)]
  exact block0410_get i

theorem block0411_lookup (i : Fin 32) :
    lookup (313 + i.val) = some (values0411[i.val]'(by rw [values0411_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (313 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_left 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0249_0377, split_right 313 node0249_0313 node0313_0377 (by omega)]
  rw [node0313_0377, split_left 345 block0411 block0412 (by omega)]
  exact block0411_get i

theorem block0412_lookup (i : Fin 32) :
    lookup (345 + i.val) = some (values0412[i.val]'(by rw [values0412_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (345 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_left 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0249_0377, split_right 313 node0249_0313 node0313_0377 (by omega)]
  rw [node0313_0377, split_right 345 block0411 block0412 (by omega)]
  exact block0412_get i

theorem block0413_lookup (i : Fin 32) :
    lookup (377 + i.val) = some (values0413[i.val]'(by rw [values0413_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (377 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_right 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0377_0476, split_left 441 node0377_0441 node0441_0476 (by omega)]
  rw [node0377_0441, split_left 409 block0413 block0414 (by omega)]
  exact block0413_get i

theorem block0414_lookup (i : Fin 32) :
    lookup (409 + i.val) = some (values0414[i.val]'(by rw [values0414_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (409 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_right 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0377_0476, split_left 441 node0377_0441 node0441_0476 (by omega)]
  rw [node0377_0441, split_right 409 block0413 block0414 (by omega)]
  exact block0414_get i

theorem block0415_lookup (i : Fin 32) :
    lookup (441 + i.val) = some (values0415[i.val]'(by rw [values0415_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (441 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_right 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0377_0476, split_right 441 node0377_0441 node0441_0476 (by omega)]
  rw [node0441_0476, split_left 473 block0415 block0416 (by omega)]
  exact block0415_get i

theorem block0416_lookup (i : Fin 3) :
    lookup (473 + i.val) = some (values0416[i.val]'(by rw [values0416_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0025_0476 (473 + i.val) = _
  rw [node0025_0476, split_right 249 node0025_0249 node0249_0476 (by omega)]
  rw [node0249_0476, split_right 377 node0249_0377 node0377_0476 (by omega)]
  rw [node0377_0476, split_right 441 node0377_0441 node0441_0476 (by omega)]
  rw [node0441_0476, split_right 473 block0415 block0416 (by omega)]
  exact block0416_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0402_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0402_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0403_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0403_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0404_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0404_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0405_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0405_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0406_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0406_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0407_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0407_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0408_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0408_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0409_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0409_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0410_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0410_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0411_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0411_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0412_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0412_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0413_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0413_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0414_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0414_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0415_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0415_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0416_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0416_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0402_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0403_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0404_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0405_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0406_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0407_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0408_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0409_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0410_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0411_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0412_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0413_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0414_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0415_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow026.block0416_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow026
