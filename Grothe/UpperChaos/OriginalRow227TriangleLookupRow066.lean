import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData0936
import Grothe.UpperChaos.OriginalRow227TriangleData0937
import Grothe.UpperChaos.OriginalRow227TriangleData0938
import Grothe.UpperChaos.OriginalRow227TriangleData0939
import Grothe.UpperChaos.OriginalRow227TriangleData0940
import Grothe.UpperChaos.OriginalRow227TriangleData0941
import Grothe.UpperChaos.OriginalRow227TriangleData0942
import Grothe.UpperChaos.OriginalRow227TriangleData0943
import Grothe.UpperChaos.OriginalRow227TriangleData0944
import Grothe.UpperChaos.OriginalRow227TriangleData0945
import Grothe.UpperChaos.OriginalRow227TriangleData0946
import Grothe.UpperChaos.OriginalRow227TriangleData0947

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow066

open ConditionalTableLookup

def values0936 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0936.coefficient66_65,
  OriginalRow227TriangleData0936.coefficient66_66,
  OriginalRow227TriangleData0936.coefficient66_67,
  OriginalRow227TriangleData0936.coefficient66_68,
  OriginalRow227TriangleData0936.coefficient66_69,
  OriginalRow227TriangleData0936.coefficient66_70,
  OriginalRow227TriangleData0936.coefficient66_71,
  OriginalRow227TriangleData0936.coefficient66_72,
  OriginalRow227TriangleData0936.coefficient66_73,
  OriginalRow227TriangleData0936.coefficient66_74,
  OriginalRow227TriangleData0936.coefficient66_75,
  OriginalRow227TriangleData0936.coefficient66_76,
  OriginalRow227TriangleData0936.coefficient66_77,
  OriginalRow227TriangleData0936.coefficient66_78,
  OriginalRow227TriangleData0936.coefficient66_79,
  OriginalRow227TriangleData0936.coefficient66_80,
  OriginalRow227TriangleData0936.coefficient66_81,
  OriginalRow227TriangleData0936.coefficient66_82,
  OriginalRow227TriangleData0936.coefficient66_83,
  OriginalRow227TriangleData0936.coefficient66_84,
  OriginalRow227TriangleData0936.coefficient66_85,
  OriginalRow227TriangleData0936.coefficient66_86,
  OriginalRow227TriangleData0936.coefficient66_87,
  OriginalRow227TriangleData0936.coefficient66_88,
  OriginalRow227TriangleData0936.coefficient66_89,
  OriginalRow227TriangleData0936.coefficient66_90,
  OriginalRow227TriangleData0936.coefficient66_91,
  OriginalRow227TriangleData0936.coefficient66_92,
  OriginalRow227TriangleData0936.coefficient66_93,
  OriginalRow227TriangleData0936.coefficient66_94,
  OriginalRow227TriangleData0936.coefficient66_95,
  OriginalRow227TriangleData0936.coefficient66_96
]

theorem values0936_size : values0936.size = 32 := rfl

def block0936 : ℕ → Option IntervalDyadic := segment 65 values0936

theorem block0936_domain : ExactDomain block0936 65 97 := by
  simpa only [values0936_size] using segment_domain 65 values0936

theorem block0936_get (i : Fin 32) :
    block0936 (65 + i.val) = some (values0936[i.val]'(by rw [values0936_size]; exact i.isLt)) := by
  exact segment_get 65 values0936 ⟨i.val, by rw [values0936_size]; exact i.isLt⟩

def values0937 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0937.coefficient66_97,
  OriginalRow227TriangleData0937.coefficient66_98,
  OriginalRow227TriangleData0937.coefficient66_99,
  OriginalRow227TriangleData0937.coefficient66_100,
  OriginalRow227TriangleData0937.coefficient66_101,
  OriginalRow227TriangleData0937.coefficient66_102,
  OriginalRow227TriangleData0937.coefficient66_103,
  OriginalRow227TriangleData0937.coefficient66_104,
  OriginalRow227TriangleData0937.coefficient66_105,
  OriginalRow227TriangleData0937.coefficient66_106,
  OriginalRow227TriangleData0937.coefficient66_107,
  OriginalRow227TriangleData0937.coefficient66_108,
  OriginalRow227TriangleData0937.coefficient66_109,
  OriginalRow227TriangleData0937.coefficient66_110,
  OriginalRow227TriangleData0937.coefficient66_111,
  OriginalRow227TriangleData0937.coefficient66_112,
  OriginalRow227TriangleData0937.coefficient66_113,
  OriginalRow227TriangleData0937.coefficient66_114,
  OriginalRow227TriangleData0937.coefficient66_115,
  OriginalRow227TriangleData0937.coefficient66_116,
  OriginalRow227TriangleData0937.coefficient66_117,
  OriginalRow227TriangleData0937.coefficient66_118,
  OriginalRow227TriangleData0937.coefficient66_119,
  OriginalRow227TriangleData0937.coefficient66_120,
  OriginalRow227TriangleData0937.coefficient66_121,
  OriginalRow227TriangleData0937.coefficient66_122,
  OriginalRow227TriangleData0937.coefficient66_123,
  OriginalRow227TriangleData0937.coefficient66_124,
  OriginalRow227TriangleData0937.coefficient66_125,
  OriginalRow227TriangleData0937.coefficient66_126,
  OriginalRow227TriangleData0937.coefficient66_127,
  OriginalRow227TriangleData0937.coefficient66_128
]

theorem values0937_size : values0937.size = 32 := rfl

def block0937 : ℕ → Option IntervalDyadic := segment 97 values0937

theorem block0937_domain : ExactDomain block0937 97 129 := by
  simpa only [values0937_size] using segment_domain 97 values0937

theorem block0937_get (i : Fin 32) :
    block0937 (97 + i.val) = some (values0937[i.val]'(by rw [values0937_size]; exact i.isLt)) := by
  exact segment_get 97 values0937 ⟨i.val, by rw [values0937_size]; exact i.isLt⟩

def values0938 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0938.coefficient66_129,
  OriginalRow227TriangleData0938.coefficient66_130,
  OriginalRow227TriangleData0938.coefficient66_131,
  OriginalRow227TriangleData0938.coefficient66_132,
  OriginalRow227TriangleData0938.coefficient66_133,
  OriginalRow227TriangleData0938.coefficient66_134,
  OriginalRow227TriangleData0938.coefficient66_135,
  OriginalRow227TriangleData0938.coefficient66_136,
  OriginalRow227TriangleData0938.coefficient66_137,
  OriginalRow227TriangleData0938.coefficient66_138,
  OriginalRow227TriangleData0938.coefficient66_139,
  OriginalRow227TriangleData0938.coefficient66_140,
  OriginalRow227TriangleData0938.coefficient66_141,
  OriginalRow227TriangleData0938.coefficient66_142,
  OriginalRow227TriangleData0938.coefficient66_143,
  OriginalRow227TriangleData0938.coefficient66_144,
  OriginalRow227TriangleData0938.coefficient66_145,
  OriginalRow227TriangleData0938.coefficient66_146,
  OriginalRow227TriangleData0938.coefficient66_147,
  OriginalRow227TriangleData0938.coefficient66_148,
  OriginalRow227TriangleData0938.coefficient66_149,
  OriginalRow227TriangleData0938.coefficient66_150,
  OriginalRow227TriangleData0938.coefficient66_151,
  OriginalRow227TriangleData0938.coefficient66_152,
  OriginalRow227TriangleData0938.coefficient66_153,
  OriginalRow227TriangleData0938.coefficient66_154,
  OriginalRow227TriangleData0938.coefficient66_155,
  OriginalRow227TriangleData0938.coefficient66_156,
  OriginalRow227TriangleData0938.coefficient66_157,
  OriginalRow227TriangleData0938.coefficient66_158,
  OriginalRow227TriangleData0938.coefficient66_159,
  OriginalRow227TriangleData0938.coefficient66_160
]

theorem values0938_size : values0938.size = 32 := rfl

def block0938 : ℕ → Option IntervalDyadic := segment 129 values0938

theorem block0938_domain : ExactDomain block0938 129 161 := by
  simpa only [values0938_size] using segment_domain 129 values0938

theorem block0938_get (i : Fin 32) :
    block0938 (129 + i.val) = some (values0938[i.val]'(by rw [values0938_size]; exact i.isLt)) := by
  exact segment_get 129 values0938 ⟨i.val, by rw [values0938_size]; exact i.isLt⟩

def values0939 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0939.coefficient66_161,
  OriginalRow227TriangleData0939.coefficient66_162,
  OriginalRow227TriangleData0939.coefficient66_163,
  OriginalRow227TriangleData0939.coefficient66_164,
  OriginalRow227TriangleData0939.coefficient66_165,
  OriginalRow227TriangleData0939.coefficient66_166,
  OriginalRow227TriangleData0939.coefficient66_167,
  OriginalRow227TriangleData0939.coefficient66_168,
  OriginalRow227TriangleData0939.coefficient66_169,
  OriginalRow227TriangleData0939.coefficient66_170,
  OriginalRow227TriangleData0939.coefficient66_171,
  OriginalRow227TriangleData0939.coefficient66_172,
  OriginalRow227TriangleData0939.coefficient66_173,
  OriginalRow227TriangleData0939.coefficient66_174,
  OriginalRow227TriangleData0939.coefficient66_175,
  OriginalRow227TriangleData0939.coefficient66_176,
  OriginalRow227TriangleData0939.coefficient66_177,
  OriginalRow227TriangleData0939.coefficient66_178,
  OriginalRow227TriangleData0939.coefficient66_179,
  OriginalRow227TriangleData0939.coefficient66_180,
  OriginalRow227TriangleData0939.coefficient66_181,
  OriginalRow227TriangleData0939.coefficient66_182,
  OriginalRow227TriangleData0939.coefficient66_183,
  OriginalRow227TriangleData0939.coefficient66_184,
  OriginalRow227TriangleData0939.coefficient66_185,
  OriginalRow227TriangleData0939.coefficient66_186,
  OriginalRow227TriangleData0939.coefficient66_187,
  OriginalRow227TriangleData0939.coefficient66_188,
  OriginalRow227TriangleData0939.coefficient66_189,
  OriginalRow227TriangleData0939.coefficient66_190,
  OriginalRow227TriangleData0939.coefficient66_191,
  OriginalRow227TriangleData0939.coefficient66_192
]

theorem values0939_size : values0939.size = 32 := rfl

def block0939 : ℕ → Option IntervalDyadic := segment 161 values0939

theorem block0939_domain : ExactDomain block0939 161 193 := by
  simpa only [values0939_size] using segment_domain 161 values0939

theorem block0939_get (i : Fin 32) :
    block0939 (161 + i.val) = some (values0939[i.val]'(by rw [values0939_size]; exact i.isLt)) := by
  exact segment_get 161 values0939 ⟨i.val, by rw [values0939_size]; exact i.isLt⟩

def values0940 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0940.coefficient66_193,
  OriginalRow227TriangleData0940.coefficient66_194,
  OriginalRow227TriangleData0940.coefficient66_195,
  OriginalRow227TriangleData0940.coefficient66_196,
  OriginalRow227TriangleData0940.coefficient66_197,
  OriginalRow227TriangleData0940.coefficient66_198,
  OriginalRow227TriangleData0940.coefficient66_199,
  OriginalRow227TriangleData0940.coefficient66_200,
  OriginalRow227TriangleData0940.coefficient66_201,
  OriginalRow227TriangleData0940.coefficient66_202,
  OriginalRow227TriangleData0940.coefficient66_203,
  OriginalRow227TriangleData0940.coefficient66_204,
  OriginalRow227TriangleData0940.coefficient66_205,
  OriginalRow227TriangleData0940.coefficient66_206,
  OriginalRow227TriangleData0940.coefficient66_207,
  OriginalRow227TriangleData0940.coefficient66_208,
  OriginalRow227TriangleData0940.coefficient66_209,
  OriginalRow227TriangleData0940.coefficient66_210,
  OriginalRow227TriangleData0940.coefficient66_211,
  OriginalRow227TriangleData0940.coefficient66_212,
  OriginalRow227TriangleData0940.coefficient66_213,
  OriginalRow227TriangleData0940.coefficient66_214,
  OriginalRow227TriangleData0940.coefficient66_215,
  OriginalRow227TriangleData0940.coefficient66_216,
  OriginalRow227TriangleData0940.coefficient66_217,
  OriginalRow227TriangleData0940.coefficient66_218,
  OriginalRow227TriangleData0940.coefficient66_219,
  OriginalRow227TriangleData0940.coefficient66_220,
  OriginalRow227TriangleData0940.coefficient66_221,
  OriginalRow227TriangleData0940.coefficient66_222,
  OriginalRow227TriangleData0940.coefficient66_223,
  OriginalRow227TriangleData0940.coefficient66_224
]

theorem values0940_size : values0940.size = 32 := rfl

def block0940 : ℕ → Option IntervalDyadic := segment 193 values0940

theorem block0940_domain : ExactDomain block0940 193 225 := by
  simpa only [values0940_size] using segment_domain 193 values0940

theorem block0940_get (i : Fin 32) :
    block0940 (193 + i.val) = some (values0940[i.val]'(by rw [values0940_size]; exact i.isLt)) := by
  exact segment_get 193 values0940 ⟨i.val, by rw [values0940_size]; exact i.isLt⟩

def values0941 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0941.coefficient66_225,
  OriginalRow227TriangleData0941.coefficient66_226,
  OriginalRow227TriangleData0941.coefficient66_227,
  OriginalRow227TriangleData0941.coefficient66_228,
  OriginalRow227TriangleData0941.coefficient66_229,
  OriginalRow227TriangleData0941.coefficient66_230,
  OriginalRow227TriangleData0941.coefficient66_231,
  OriginalRow227TriangleData0941.coefficient66_232,
  OriginalRow227TriangleData0941.coefficient66_233,
  OriginalRow227TriangleData0941.coefficient66_234,
  OriginalRow227TriangleData0941.coefficient66_235,
  OriginalRow227TriangleData0941.coefficient66_236,
  OriginalRow227TriangleData0941.coefficient66_237,
  OriginalRow227TriangleData0941.coefficient66_238,
  OriginalRow227TriangleData0941.coefficient66_239,
  OriginalRow227TriangleData0941.coefficient66_240,
  OriginalRow227TriangleData0941.coefficient66_241,
  OriginalRow227TriangleData0941.coefficient66_242,
  OriginalRow227TriangleData0941.coefficient66_243,
  OriginalRow227TriangleData0941.coefficient66_244,
  OriginalRow227TriangleData0941.coefficient66_245,
  OriginalRow227TriangleData0941.coefficient66_246,
  OriginalRow227TriangleData0941.coefficient66_247,
  OriginalRow227TriangleData0941.coefficient66_248,
  OriginalRow227TriangleData0941.coefficient66_249,
  OriginalRow227TriangleData0941.coefficient66_250,
  OriginalRow227TriangleData0941.coefficient66_251,
  OriginalRow227TriangleData0941.coefficient66_252,
  OriginalRow227TriangleData0941.coefficient66_253,
  OriginalRow227TriangleData0941.coefficient66_254,
  OriginalRow227TriangleData0941.coefficient66_255,
  OriginalRow227TriangleData0941.coefficient66_256
]

theorem values0941_size : values0941.size = 32 := rfl

def block0941 : ℕ → Option IntervalDyadic := segment 225 values0941

theorem block0941_domain : ExactDomain block0941 225 257 := by
  simpa only [values0941_size] using segment_domain 225 values0941

theorem block0941_get (i : Fin 32) :
    block0941 (225 + i.val) = some (values0941[i.val]'(by rw [values0941_size]; exact i.isLt)) := by
  exact segment_get 225 values0941 ⟨i.val, by rw [values0941_size]; exact i.isLt⟩

def values0942 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0942.coefficient66_257,
  OriginalRow227TriangleData0942.coefficient66_258,
  OriginalRow227TriangleData0942.coefficient66_259,
  OriginalRow227TriangleData0942.coefficient66_260,
  OriginalRow227TriangleData0942.coefficient66_261,
  OriginalRow227TriangleData0942.coefficient66_262,
  OriginalRow227TriangleData0942.coefficient66_263,
  OriginalRow227TriangleData0942.coefficient66_264,
  OriginalRow227TriangleData0942.coefficient66_265,
  OriginalRow227TriangleData0942.coefficient66_266,
  OriginalRow227TriangleData0942.coefficient66_267,
  OriginalRow227TriangleData0942.coefficient66_268,
  OriginalRow227TriangleData0942.coefficient66_269,
  OriginalRow227TriangleData0942.coefficient66_270,
  OriginalRow227TriangleData0942.coefficient66_271,
  OriginalRow227TriangleData0942.coefficient66_272,
  OriginalRow227TriangleData0942.coefficient66_273,
  OriginalRow227TriangleData0942.coefficient66_274,
  OriginalRow227TriangleData0942.coefficient66_275,
  OriginalRow227TriangleData0942.coefficient66_276,
  OriginalRow227TriangleData0942.coefficient66_277,
  OriginalRow227TriangleData0942.coefficient66_278,
  OriginalRow227TriangleData0942.coefficient66_279,
  OriginalRow227TriangleData0942.coefficient66_280,
  OriginalRow227TriangleData0942.coefficient66_281,
  OriginalRow227TriangleData0942.coefficient66_282,
  OriginalRow227TriangleData0942.coefficient66_283,
  OriginalRow227TriangleData0942.coefficient66_284,
  OriginalRow227TriangleData0942.coefficient66_285,
  OriginalRow227TriangleData0942.coefficient66_286,
  OriginalRow227TriangleData0942.coefficient66_287,
  OriginalRow227TriangleData0942.coefficient66_288
]

theorem values0942_size : values0942.size = 32 := rfl

def block0942 : ℕ → Option IntervalDyadic := segment 257 values0942

theorem block0942_domain : ExactDomain block0942 257 289 := by
  simpa only [values0942_size] using segment_domain 257 values0942

theorem block0942_get (i : Fin 32) :
    block0942 (257 + i.val) = some (values0942[i.val]'(by rw [values0942_size]; exact i.isLt)) := by
  exact segment_get 257 values0942 ⟨i.val, by rw [values0942_size]; exact i.isLt⟩

def values0943 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0943.coefficient66_289,
  OriginalRow227TriangleData0943.coefficient66_290,
  OriginalRow227TriangleData0943.coefficient66_291,
  OriginalRow227TriangleData0943.coefficient66_292,
  OriginalRow227TriangleData0943.coefficient66_293,
  OriginalRow227TriangleData0943.coefficient66_294,
  OriginalRow227TriangleData0943.coefficient66_295,
  OriginalRow227TriangleData0943.coefficient66_296,
  OriginalRow227TriangleData0943.coefficient66_297,
  OriginalRow227TriangleData0943.coefficient66_298,
  OriginalRow227TriangleData0943.coefficient66_299,
  OriginalRow227TriangleData0943.coefficient66_300,
  OriginalRow227TriangleData0943.coefficient66_301,
  OriginalRow227TriangleData0943.coefficient66_302,
  OriginalRow227TriangleData0943.coefficient66_303,
  OriginalRow227TriangleData0943.coefficient66_304,
  OriginalRow227TriangleData0943.coefficient66_305,
  OriginalRow227TriangleData0943.coefficient66_306,
  OriginalRow227TriangleData0943.coefficient66_307,
  OriginalRow227TriangleData0943.coefficient66_308,
  OriginalRow227TriangleData0943.coefficient66_309,
  OriginalRow227TriangleData0943.coefficient66_310,
  OriginalRow227TriangleData0943.coefficient66_311,
  OriginalRow227TriangleData0943.coefficient66_312,
  OriginalRow227TriangleData0943.coefficient66_313,
  OriginalRow227TriangleData0943.coefficient66_314,
  OriginalRow227TriangleData0943.coefficient66_315,
  OriginalRow227TriangleData0943.coefficient66_316,
  OriginalRow227TriangleData0943.coefficient66_317,
  OriginalRow227TriangleData0943.coefficient66_318,
  OriginalRow227TriangleData0943.coefficient66_319,
  OriginalRow227TriangleData0943.coefficient66_320
]

theorem values0943_size : values0943.size = 32 := rfl

def block0943 : ℕ → Option IntervalDyadic := segment 289 values0943

theorem block0943_domain : ExactDomain block0943 289 321 := by
  simpa only [values0943_size] using segment_domain 289 values0943

theorem block0943_get (i : Fin 32) :
    block0943 (289 + i.val) = some (values0943[i.val]'(by rw [values0943_size]; exact i.isLt)) := by
  exact segment_get 289 values0943 ⟨i.val, by rw [values0943_size]; exact i.isLt⟩

def values0944 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0944.coefficient66_321,
  OriginalRow227TriangleData0944.coefficient66_322,
  OriginalRow227TriangleData0944.coefficient66_323,
  OriginalRow227TriangleData0944.coefficient66_324,
  OriginalRow227TriangleData0944.coefficient66_325,
  OriginalRow227TriangleData0944.coefficient66_326,
  OriginalRow227TriangleData0944.coefficient66_327,
  OriginalRow227TriangleData0944.coefficient66_328,
  OriginalRow227TriangleData0944.coefficient66_329,
  OriginalRow227TriangleData0944.coefficient66_330,
  OriginalRow227TriangleData0944.coefficient66_331,
  OriginalRow227TriangleData0944.coefficient66_332,
  OriginalRow227TriangleData0944.coefficient66_333,
  OriginalRow227TriangleData0944.coefficient66_334,
  OriginalRow227TriangleData0944.coefficient66_335,
  OriginalRow227TriangleData0944.coefficient66_336,
  OriginalRow227TriangleData0944.coefficient66_337,
  OriginalRow227TriangleData0944.coefficient66_338,
  OriginalRow227TriangleData0944.coefficient66_339,
  OriginalRow227TriangleData0944.coefficient66_340,
  OriginalRow227TriangleData0944.coefficient66_341,
  OriginalRow227TriangleData0944.coefficient66_342,
  OriginalRow227TriangleData0944.coefficient66_343,
  OriginalRow227TriangleData0944.coefficient66_344,
  OriginalRow227TriangleData0944.coefficient66_345,
  OriginalRow227TriangleData0944.coefficient66_346,
  OriginalRow227TriangleData0944.coefficient66_347,
  OriginalRow227TriangleData0944.coefficient66_348,
  OriginalRow227TriangleData0944.coefficient66_349,
  OriginalRow227TriangleData0944.coefficient66_350,
  OriginalRow227TriangleData0944.coefficient66_351,
  OriginalRow227TriangleData0944.coefficient66_352
]

theorem values0944_size : values0944.size = 32 := rfl

def block0944 : ℕ → Option IntervalDyadic := segment 321 values0944

theorem block0944_domain : ExactDomain block0944 321 353 := by
  simpa only [values0944_size] using segment_domain 321 values0944

theorem block0944_get (i : Fin 32) :
    block0944 (321 + i.val) = some (values0944[i.val]'(by rw [values0944_size]; exact i.isLt)) := by
  exact segment_get 321 values0944 ⟨i.val, by rw [values0944_size]; exact i.isLt⟩

def values0945 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0945.coefficient66_353,
  OriginalRow227TriangleData0945.coefficient66_354,
  OriginalRow227TriangleData0945.coefficient66_355,
  OriginalRow227TriangleData0945.coefficient66_356,
  OriginalRow227TriangleData0945.coefficient66_357,
  OriginalRow227TriangleData0945.coefficient66_358,
  OriginalRow227TriangleData0945.coefficient66_359,
  OriginalRow227TriangleData0945.coefficient66_360,
  OriginalRow227TriangleData0945.coefficient66_361,
  OriginalRow227TriangleData0945.coefficient66_362,
  OriginalRow227TriangleData0945.coefficient66_363,
  OriginalRow227TriangleData0945.coefficient66_364,
  OriginalRow227TriangleData0945.coefficient66_365,
  OriginalRow227TriangleData0945.coefficient66_366,
  OriginalRow227TriangleData0945.coefficient66_367,
  OriginalRow227TriangleData0945.coefficient66_368,
  OriginalRow227TriangleData0945.coefficient66_369,
  OriginalRow227TriangleData0945.coefficient66_370,
  OriginalRow227TriangleData0945.coefficient66_371,
  OriginalRow227TriangleData0945.coefficient66_372,
  OriginalRow227TriangleData0945.coefficient66_373,
  OriginalRow227TriangleData0945.coefficient66_374,
  OriginalRow227TriangleData0945.coefficient66_375,
  OriginalRow227TriangleData0945.coefficient66_376,
  OriginalRow227TriangleData0945.coefficient66_377,
  OriginalRow227TriangleData0945.coefficient66_378,
  OriginalRow227TriangleData0945.coefficient66_379,
  OriginalRow227TriangleData0945.coefficient66_380,
  OriginalRow227TriangleData0945.coefficient66_381,
  OriginalRow227TriangleData0945.coefficient66_382,
  OriginalRow227TriangleData0945.coefficient66_383,
  OriginalRow227TriangleData0945.coefficient66_384
]

theorem values0945_size : values0945.size = 32 := rfl

def block0945 : ℕ → Option IntervalDyadic := segment 353 values0945

theorem block0945_domain : ExactDomain block0945 353 385 := by
  simpa only [values0945_size] using segment_domain 353 values0945

theorem block0945_get (i : Fin 32) :
    block0945 (353 + i.val) = some (values0945[i.val]'(by rw [values0945_size]; exact i.isLt)) := by
  exact segment_get 353 values0945 ⟨i.val, by rw [values0945_size]; exact i.isLt⟩

def values0946 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0946.coefficient66_385,
  OriginalRow227TriangleData0946.coefficient66_386,
  OriginalRow227TriangleData0946.coefficient66_387,
  OriginalRow227TriangleData0946.coefficient66_388,
  OriginalRow227TriangleData0946.coefficient66_389,
  OriginalRow227TriangleData0946.coefficient66_390,
  OriginalRow227TriangleData0946.coefficient66_391,
  OriginalRow227TriangleData0946.coefficient66_392,
  OriginalRow227TriangleData0946.coefficient66_393,
  OriginalRow227TriangleData0946.coefficient66_394,
  OriginalRow227TriangleData0946.coefficient66_395,
  OriginalRow227TriangleData0946.coefficient66_396,
  OriginalRow227TriangleData0946.coefficient66_397,
  OriginalRow227TriangleData0946.coefficient66_398,
  OriginalRow227TriangleData0946.coefficient66_399,
  OriginalRow227TriangleData0946.coefficient66_400,
  OriginalRow227TriangleData0946.coefficient66_401,
  OriginalRow227TriangleData0946.coefficient66_402,
  OriginalRow227TriangleData0946.coefficient66_403,
  OriginalRow227TriangleData0946.coefficient66_404,
  OriginalRow227TriangleData0946.coefficient66_405,
  OriginalRow227TriangleData0946.coefficient66_406,
  OriginalRow227TriangleData0946.coefficient66_407,
  OriginalRow227TriangleData0946.coefficient66_408,
  OriginalRow227TriangleData0946.coefficient66_409,
  OriginalRow227TriangleData0946.coefficient66_410,
  OriginalRow227TriangleData0946.coefficient66_411,
  OriginalRow227TriangleData0946.coefficient66_412,
  OriginalRow227TriangleData0946.coefficient66_413,
  OriginalRow227TriangleData0946.coefficient66_414,
  OriginalRow227TriangleData0946.coefficient66_415,
  OriginalRow227TriangleData0946.coefficient66_416
]

theorem values0946_size : values0946.size = 32 := rfl

def block0946 : ℕ → Option IntervalDyadic := segment 385 values0946

theorem block0946_domain : ExactDomain block0946 385 417 := by
  simpa only [values0946_size] using segment_domain 385 values0946

theorem block0946_get (i : Fin 32) :
    block0946 (385 + i.val) = some (values0946[i.val]'(by rw [values0946_size]; exact i.isLt)) := by
  exact segment_get 385 values0946 ⟨i.val, by rw [values0946_size]; exact i.isLt⟩

def values0947 : Array IntervalDyadic := #[
  OriginalRow227TriangleData0947.coefficient66_417,
  OriginalRow227TriangleData0947.coefficient66_418,
  OriginalRow227TriangleData0947.coefficient66_419,
  OriginalRow227TriangleData0947.coefficient66_420,
  OriginalRow227TriangleData0947.coefficient66_421,
  OriginalRow227TriangleData0947.coefficient66_422,
  OriginalRow227TriangleData0947.coefficient66_423,
  OriginalRow227TriangleData0947.coefficient66_424,
  OriginalRow227TriangleData0947.coefficient66_425,
  OriginalRow227TriangleData0947.coefficient66_426,
  OriginalRow227TriangleData0947.coefficient66_427,
  OriginalRow227TriangleData0947.coefficient66_428,
  OriginalRow227TriangleData0947.coefficient66_429,
  OriginalRow227TriangleData0947.coefficient66_430,
  OriginalRow227TriangleData0947.coefficient66_431,
  OriginalRow227TriangleData0947.coefficient66_432,
  OriginalRow227TriangleData0947.coefficient66_433,
  OriginalRow227TriangleData0947.coefficient66_434,
  OriginalRow227TriangleData0947.coefficient66_435
]

theorem values0947_size : values0947.size = 19 := rfl

def block0947 : ℕ → Option IntervalDyadic := segment 417 values0947

theorem block0947_domain : ExactDomain block0947 417 436 := by
  simpa only [values0947_size] using segment_domain 417 values0947

theorem block0947_get (i : Fin 19) :
    block0947 (417 + i.val) = some (values0947[i.val]'(by rw [values0947_size]; exact i.isLt)) := by
  exact segment_get 417 values0947 ⟨i.val, by rw [values0947_size]; exact i.isLt⟩

def node0097_0161 : ℕ → Option IntervalDyadic := split 129 block0937 block0938

theorem node0097_0161_domain : ExactDomain node0097_0161 97 161 := by
  exact split_domain (by decide) (by decide) block0937_domain block0938_domain

def node0065_0161 : ℕ → Option IntervalDyadic := split 97 block0936 node0097_0161

theorem node0065_0161_domain : ExactDomain node0065_0161 65 161 := by
  exact split_domain (by decide) (by decide) block0936_domain node0097_0161_domain

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block0940 block0941

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block0940_domain block0941_domain

def node0161_0257 : ℕ → Option IntervalDyadic := split 193 block0939 node0193_0257

theorem node0161_0257_domain : ExactDomain node0161_0257 161 257 := by
  exact split_domain (by decide) (by decide) block0939_domain node0193_0257_domain

def node0065_0257 : ℕ → Option IntervalDyadic := split 161 node0065_0161 node0161_0257

theorem node0065_0257_domain : ExactDomain node0065_0257 65 257 := by
  exact split_domain (by decide) (by decide) node0065_0161_domain node0161_0257_domain

def node0289_0353 : ℕ → Option IntervalDyadic := split 321 block0943 block0944

theorem node0289_0353_domain : ExactDomain node0289_0353 289 353 := by
  exact split_domain (by decide) (by decide) block0943_domain block0944_domain

def node0257_0353 : ℕ → Option IntervalDyadic := split 289 block0942 node0289_0353

theorem node0257_0353_domain : ExactDomain node0257_0353 257 353 := by
  exact split_domain (by decide) (by decide) block0942_domain node0289_0353_domain

def node0385_0436 : ℕ → Option IntervalDyadic := split 417 block0946 block0947

theorem node0385_0436_domain : ExactDomain node0385_0436 385 436 := by
  exact split_domain (by decide) (by decide) block0946_domain block0947_domain

def node0353_0436 : ℕ → Option IntervalDyadic := split 385 block0945 node0385_0436

theorem node0353_0436_domain : ExactDomain node0353_0436 353 436 := by
  exact split_domain (by decide) (by decide) block0945_domain node0385_0436_domain

def node0257_0436 : ℕ → Option IntervalDyadic := split 353 node0257_0353 node0353_0436

theorem node0257_0436_domain : ExactDomain node0257_0436 257 436 := by
  exact split_domain (by decide) (by decide) node0257_0353_domain node0353_0436_domain

def node0065_0436 : ℕ → Option IntervalDyadic := split 257 node0065_0257 node0257_0436

theorem node0065_0436_domain : ExactDomain node0065_0436 65 436 := by
  exact split_domain (by decide) (by decide) node0065_0257_domain node0257_0436_domain

def lookup : ℕ → Option IntervalDyadic := node0065_0436

theorem lookup_domain : ExactDomain lookup 65 436 :=
  node0065_0436_domain

theorem block0936_lookup (i : Fin 32) :
    lookup (65 + i.val) = some (values0936[i.val]'(by rw [values0936_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (65 + i.val) = _
  rw [node0065_0436, split_left 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0065_0257, split_left 161 node0065_0161 node0161_0257 (by omega)]
  rw [node0065_0161, split_left 97 block0936 node0097_0161 (by omega)]
  exact block0936_get i

theorem block0937_lookup (i : Fin 32) :
    lookup (97 + i.val) = some (values0937[i.val]'(by rw [values0937_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (97 + i.val) = _
  rw [node0065_0436, split_left 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0065_0257, split_left 161 node0065_0161 node0161_0257 (by omega)]
  rw [node0065_0161, split_right 97 block0936 node0097_0161 (by omega)]
  rw [node0097_0161, split_left 129 block0937 block0938 (by omega)]
  exact block0937_get i

theorem block0938_lookup (i : Fin 32) :
    lookup (129 + i.val) = some (values0938[i.val]'(by rw [values0938_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (129 + i.val) = _
  rw [node0065_0436, split_left 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0065_0257, split_left 161 node0065_0161 node0161_0257 (by omega)]
  rw [node0065_0161, split_right 97 block0936 node0097_0161 (by omega)]
  rw [node0097_0161, split_right 129 block0937 block0938 (by omega)]
  exact block0938_get i

theorem block0939_lookup (i : Fin 32) :
    lookup (161 + i.val) = some (values0939[i.val]'(by rw [values0939_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (161 + i.val) = _
  rw [node0065_0436, split_left 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0065_0257, split_right 161 node0065_0161 node0161_0257 (by omega)]
  rw [node0161_0257, split_left 193 block0939 node0193_0257 (by omega)]
  exact block0939_get i

theorem block0940_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values0940[i.val]'(by rw [values0940_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (193 + i.val) = _
  rw [node0065_0436, split_left 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0065_0257, split_right 161 node0065_0161 node0161_0257 (by omega)]
  rw [node0161_0257, split_right 193 block0939 node0193_0257 (by omega)]
  rw [node0193_0257, split_left 225 block0940 block0941 (by omega)]
  exact block0940_get i

theorem block0941_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values0941[i.val]'(by rw [values0941_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (225 + i.val) = _
  rw [node0065_0436, split_left 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0065_0257, split_right 161 node0065_0161 node0161_0257 (by omega)]
  rw [node0161_0257, split_right 193 block0939 node0193_0257 (by omega)]
  rw [node0193_0257, split_right 225 block0940 block0941 (by omega)]
  exact block0941_get i

theorem block0942_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values0942[i.val]'(by rw [values0942_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (257 + i.val) = _
  rw [node0065_0436, split_right 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0257_0436, split_left 353 node0257_0353 node0353_0436 (by omega)]
  rw [node0257_0353, split_left 289 block0942 node0289_0353 (by omega)]
  exact block0942_get i

theorem block0943_lookup (i : Fin 32) :
    lookup (289 + i.val) = some (values0943[i.val]'(by rw [values0943_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (289 + i.val) = _
  rw [node0065_0436, split_right 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0257_0436, split_left 353 node0257_0353 node0353_0436 (by omega)]
  rw [node0257_0353, split_right 289 block0942 node0289_0353 (by omega)]
  rw [node0289_0353, split_left 321 block0943 block0944 (by omega)]
  exact block0943_get i

theorem block0944_lookup (i : Fin 32) :
    lookup (321 + i.val) = some (values0944[i.val]'(by rw [values0944_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (321 + i.val) = _
  rw [node0065_0436, split_right 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0257_0436, split_left 353 node0257_0353 node0353_0436 (by omega)]
  rw [node0257_0353, split_right 289 block0942 node0289_0353 (by omega)]
  rw [node0289_0353, split_right 321 block0943 block0944 (by omega)]
  exact block0944_get i

theorem block0945_lookup (i : Fin 32) :
    lookup (353 + i.val) = some (values0945[i.val]'(by rw [values0945_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (353 + i.val) = _
  rw [node0065_0436, split_right 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0257_0436, split_right 353 node0257_0353 node0353_0436 (by omega)]
  rw [node0353_0436, split_left 385 block0945 node0385_0436 (by omega)]
  exact block0945_get i

theorem block0946_lookup (i : Fin 32) :
    lookup (385 + i.val) = some (values0946[i.val]'(by rw [values0946_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (385 + i.val) = _
  rw [node0065_0436, split_right 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0257_0436, split_right 353 node0257_0353 node0353_0436 (by omega)]
  rw [node0353_0436, split_right 385 block0945 node0385_0436 (by omega)]
  rw [node0385_0436, split_left 417 block0946 block0947 (by omega)]
  exact block0946_get i

theorem block0947_lookup (i : Fin 19) :
    lookup (417 + i.val) = some (values0947[i.val]'(by rw [values0947_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0065_0436 (417 + i.val) = _
  rw [node0065_0436, split_right 257 node0065_0257 node0257_0436 (by omega)]
  rw [node0257_0436, split_right 353 node0257_0353 node0353_0436 (by omega)]
  rw [node0353_0436, split_right 385 block0945 node0385_0436 (by omega)]
  rw [node0385_0436, split_right 417 block0946 block0947 (by omega)]
  exact block0947_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0936_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0936_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0937_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0937_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0938_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0938_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0939_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0939_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0940_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0940_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0941_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0941_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0942_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0942_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0943_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0943_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0944_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0944_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0945_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0945_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0946_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0946_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0947_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0947_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0936_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0937_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0938_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0939_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0940_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0941_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0942_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0943_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0944_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0945_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0946_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow066.block0947_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow066
