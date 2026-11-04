import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1536
import Grothe.UpperChaos.OriginalRow227TriangleData1537
import Grothe.UpperChaos.OriginalRow227TriangleData1538
import Grothe.UpperChaos.OriginalRow227TriangleData1539
import Grothe.UpperChaos.OriginalRow227TriangleData1540
import Grothe.UpperChaos.OriginalRow227TriangleData1541
import Grothe.UpperChaos.OriginalRow227TriangleData1542
import Grothe.UpperChaos.OriginalRow227TriangleData1543

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow124

open ConditionalTableLookup

def values1536 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1536.coefficient124_123,
  OriginalRow227TriangleData1536.coefficient124_124,
  OriginalRow227TriangleData1536.coefficient124_125,
  OriginalRow227TriangleData1536.coefficient124_126,
  OriginalRow227TriangleData1536.coefficient124_127,
  OriginalRow227TriangleData1536.coefficient124_128,
  OriginalRow227TriangleData1536.coefficient124_129,
  OriginalRow227TriangleData1536.coefficient124_130,
  OriginalRow227TriangleData1536.coefficient124_131,
  OriginalRow227TriangleData1536.coefficient124_132,
  OriginalRow227TriangleData1536.coefficient124_133,
  OriginalRow227TriangleData1536.coefficient124_134,
  OriginalRow227TriangleData1536.coefficient124_135,
  OriginalRow227TriangleData1536.coefficient124_136,
  OriginalRow227TriangleData1536.coefficient124_137,
  OriginalRow227TriangleData1536.coefficient124_138,
  OriginalRow227TriangleData1536.coefficient124_139,
  OriginalRow227TriangleData1536.coefficient124_140,
  OriginalRow227TriangleData1536.coefficient124_141,
  OriginalRow227TriangleData1536.coefficient124_142,
  OriginalRow227TriangleData1536.coefficient124_143,
  OriginalRow227TriangleData1536.coefficient124_144,
  OriginalRow227TriangleData1536.coefficient124_145,
  OriginalRow227TriangleData1536.coefficient124_146,
  OriginalRow227TriangleData1536.coefficient124_147,
  OriginalRow227TriangleData1536.coefficient124_148,
  OriginalRow227TriangleData1536.coefficient124_149,
  OriginalRow227TriangleData1536.coefficient124_150,
  OriginalRow227TriangleData1536.coefficient124_151,
  OriginalRow227TriangleData1536.coefficient124_152,
  OriginalRow227TriangleData1536.coefficient124_153,
  OriginalRow227TriangleData1536.coefficient124_154
]

theorem values1536_size : values1536.size = 32 := rfl

def block1536 : ℕ → Option IntervalDyadic := segment 123 values1536

theorem block1536_domain : ExactDomain block1536 123 155 := by
  simpa only [values1536_size] using segment_domain 123 values1536

theorem block1536_get (i : Fin 32) :
    block1536 (123 + i.val) = some (values1536[i.val]'(by rw [values1536_size]; exact i.isLt)) := by
  exact segment_get 123 values1536 ⟨i.val, by rw [values1536_size]; exact i.isLt⟩

def values1537 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1537.coefficient124_155,
  OriginalRow227TriangleData1537.coefficient124_156,
  OriginalRow227TriangleData1537.coefficient124_157,
  OriginalRow227TriangleData1537.coefficient124_158,
  OriginalRow227TriangleData1537.coefficient124_159,
  OriginalRow227TriangleData1537.coefficient124_160,
  OriginalRow227TriangleData1537.coefficient124_161,
  OriginalRow227TriangleData1537.coefficient124_162,
  OriginalRow227TriangleData1537.coefficient124_163,
  OriginalRow227TriangleData1537.coefficient124_164,
  OriginalRow227TriangleData1537.coefficient124_165,
  OriginalRow227TriangleData1537.coefficient124_166,
  OriginalRow227TriangleData1537.coefficient124_167,
  OriginalRow227TriangleData1537.coefficient124_168,
  OriginalRow227TriangleData1537.coefficient124_169,
  OriginalRow227TriangleData1537.coefficient124_170,
  OriginalRow227TriangleData1537.coefficient124_171,
  OriginalRow227TriangleData1537.coefficient124_172,
  OriginalRow227TriangleData1537.coefficient124_173,
  OriginalRow227TriangleData1537.coefficient124_174,
  OriginalRow227TriangleData1537.coefficient124_175,
  OriginalRow227TriangleData1537.coefficient124_176,
  OriginalRow227TriangleData1537.coefficient124_177,
  OriginalRow227TriangleData1537.coefficient124_178,
  OriginalRow227TriangleData1537.coefficient124_179,
  OriginalRow227TriangleData1537.coefficient124_180,
  OriginalRow227TriangleData1537.coefficient124_181,
  OriginalRow227TriangleData1537.coefficient124_182,
  OriginalRow227TriangleData1537.coefficient124_183,
  OriginalRow227TriangleData1537.coefficient124_184,
  OriginalRow227TriangleData1537.coefficient124_185,
  OriginalRow227TriangleData1537.coefficient124_186
]

theorem values1537_size : values1537.size = 32 := rfl

def block1537 : ℕ → Option IntervalDyadic := segment 155 values1537

theorem block1537_domain : ExactDomain block1537 155 187 := by
  simpa only [values1537_size] using segment_domain 155 values1537

theorem block1537_get (i : Fin 32) :
    block1537 (155 + i.val) = some (values1537[i.val]'(by rw [values1537_size]; exact i.isLt)) := by
  exact segment_get 155 values1537 ⟨i.val, by rw [values1537_size]; exact i.isLt⟩

def values1538 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1538.coefficient124_187,
  OriginalRow227TriangleData1538.coefficient124_188,
  OriginalRow227TriangleData1538.coefficient124_189,
  OriginalRow227TriangleData1538.coefficient124_190,
  OriginalRow227TriangleData1538.coefficient124_191,
  OriginalRow227TriangleData1538.coefficient124_192,
  OriginalRow227TriangleData1538.coefficient124_193,
  OriginalRow227TriangleData1538.coefficient124_194,
  OriginalRow227TriangleData1538.coefficient124_195,
  OriginalRow227TriangleData1538.coefficient124_196,
  OriginalRow227TriangleData1538.coefficient124_197,
  OriginalRow227TriangleData1538.coefficient124_198,
  OriginalRow227TriangleData1538.coefficient124_199,
  OriginalRow227TriangleData1538.coefficient124_200,
  OriginalRow227TriangleData1538.coefficient124_201,
  OriginalRow227TriangleData1538.coefficient124_202,
  OriginalRow227TriangleData1538.coefficient124_203,
  OriginalRow227TriangleData1538.coefficient124_204,
  OriginalRow227TriangleData1538.coefficient124_205,
  OriginalRow227TriangleData1538.coefficient124_206,
  OriginalRow227TriangleData1538.coefficient124_207,
  OriginalRow227TriangleData1538.coefficient124_208,
  OriginalRow227TriangleData1538.coefficient124_209,
  OriginalRow227TriangleData1538.coefficient124_210,
  OriginalRow227TriangleData1538.coefficient124_211,
  OriginalRow227TriangleData1538.coefficient124_212,
  OriginalRow227TriangleData1538.coefficient124_213,
  OriginalRow227TriangleData1538.coefficient124_214,
  OriginalRow227TriangleData1538.coefficient124_215,
  OriginalRow227TriangleData1538.coefficient124_216,
  OriginalRow227TriangleData1538.coefficient124_217,
  OriginalRow227TriangleData1538.coefficient124_218
]

theorem values1538_size : values1538.size = 32 := rfl

def block1538 : ℕ → Option IntervalDyadic := segment 187 values1538

theorem block1538_domain : ExactDomain block1538 187 219 := by
  simpa only [values1538_size] using segment_domain 187 values1538

theorem block1538_get (i : Fin 32) :
    block1538 (187 + i.val) = some (values1538[i.val]'(by rw [values1538_size]; exact i.isLt)) := by
  exact segment_get 187 values1538 ⟨i.val, by rw [values1538_size]; exact i.isLt⟩

def values1539 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1539.coefficient124_219,
  OriginalRow227TriangleData1539.coefficient124_220,
  OriginalRow227TriangleData1539.coefficient124_221,
  OriginalRow227TriangleData1539.coefficient124_222,
  OriginalRow227TriangleData1539.coefficient124_223,
  OriginalRow227TriangleData1539.coefficient124_224,
  OriginalRow227TriangleData1539.coefficient124_225,
  OriginalRow227TriangleData1539.coefficient124_226,
  OriginalRow227TriangleData1539.coefficient124_227,
  OriginalRow227TriangleData1539.coefficient124_228,
  OriginalRow227TriangleData1539.coefficient124_229,
  OriginalRow227TriangleData1539.coefficient124_230,
  OriginalRow227TriangleData1539.coefficient124_231,
  OriginalRow227TriangleData1539.coefficient124_232,
  OriginalRow227TriangleData1539.coefficient124_233,
  OriginalRow227TriangleData1539.coefficient124_234,
  OriginalRow227TriangleData1539.coefficient124_235,
  OriginalRow227TriangleData1539.coefficient124_236,
  OriginalRow227TriangleData1539.coefficient124_237,
  OriginalRow227TriangleData1539.coefficient124_238,
  OriginalRow227TriangleData1539.coefficient124_239,
  OriginalRow227TriangleData1539.coefficient124_240,
  OriginalRow227TriangleData1539.coefficient124_241,
  OriginalRow227TriangleData1539.coefficient124_242,
  OriginalRow227TriangleData1539.coefficient124_243,
  OriginalRow227TriangleData1539.coefficient124_244,
  OriginalRow227TriangleData1539.coefficient124_245,
  OriginalRow227TriangleData1539.coefficient124_246,
  OriginalRow227TriangleData1539.coefficient124_247,
  OriginalRow227TriangleData1539.coefficient124_248,
  OriginalRow227TriangleData1539.coefficient124_249,
  OriginalRow227TriangleData1539.coefficient124_250
]

theorem values1539_size : values1539.size = 32 := rfl

def block1539 : ℕ → Option IntervalDyadic := segment 219 values1539

theorem block1539_domain : ExactDomain block1539 219 251 := by
  simpa only [values1539_size] using segment_domain 219 values1539

theorem block1539_get (i : Fin 32) :
    block1539 (219 + i.val) = some (values1539[i.val]'(by rw [values1539_size]; exact i.isLt)) := by
  exact segment_get 219 values1539 ⟨i.val, by rw [values1539_size]; exact i.isLt⟩

def values1540 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1540.coefficient124_251,
  OriginalRow227TriangleData1540.coefficient124_252,
  OriginalRow227TriangleData1540.coefficient124_253,
  OriginalRow227TriangleData1540.coefficient124_254,
  OriginalRow227TriangleData1540.coefficient124_255,
  OriginalRow227TriangleData1540.coefficient124_256,
  OriginalRow227TriangleData1540.coefficient124_257,
  OriginalRow227TriangleData1540.coefficient124_258,
  OriginalRow227TriangleData1540.coefficient124_259,
  OriginalRow227TriangleData1540.coefficient124_260,
  OriginalRow227TriangleData1540.coefficient124_261,
  OriginalRow227TriangleData1540.coefficient124_262,
  OriginalRow227TriangleData1540.coefficient124_263,
  OriginalRow227TriangleData1540.coefficient124_264,
  OriginalRow227TriangleData1540.coefficient124_265,
  OriginalRow227TriangleData1540.coefficient124_266,
  OriginalRow227TriangleData1540.coefficient124_267,
  OriginalRow227TriangleData1540.coefficient124_268,
  OriginalRow227TriangleData1540.coefficient124_269,
  OriginalRow227TriangleData1540.coefficient124_270,
  OriginalRow227TriangleData1540.coefficient124_271,
  OriginalRow227TriangleData1540.coefficient124_272,
  OriginalRow227TriangleData1540.coefficient124_273,
  OriginalRow227TriangleData1540.coefficient124_274,
  OriginalRow227TriangleData1540.coefficient124_275,
  OriginalRow227TriangleData1540.coefficient124_276,
  OriginalRow227TriangleData1540.coefficient124_277,
  OriginalRow227TriangleData1540.coefficient124_278,
  OriginalRow227TriangleData1540.coefficient124_279,
  OriginalRow227TriangleData1540.coefficient124_280,
  OriginalRow227TriangleData1540.coefficient124_281,
  OriginalRow227TriangleData1540.coefficient124_282
]

theorem values1540_size : values1540.size = 32 := rfl

def block1540 : ℕ → Option IntervalDyadic := segment 251 values1540

theorem block1540_domain : ExactDomain block1540 251 283 := by
  simpa only [values1540_size] using segment_domain 251 values1540

theorem block1540_get (i : Fin 32) :
    block1540 (251 + i.val) = some (values1540[i.val]'(by rw [values1540_size]; exact i.isLt)) := by
  exact segment_get 251 values1540 ⟨i.val, by rw [values1540_size]; exact i.isLt⟩

def values1541 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1541.coefficient124_283,
  OriginalRow227TriangleData1541.coefficient124_284,
  OriginalRow227TriangleData1541.coefficient124_285,
  OriginalRow227TriangleData1541.coefficient124_286,
  OriginalRow227TriangleData1541.coefficient124_287,
  OriginalRow227TriangleData1541.coefficient124_288,
  OriginalRow227TriangleData1541.coefficient124_289,
  OriginalRow227TriangleData1541.coefficient124_290,
  OriginalRow227TriangleData1541.coefficient124_291,
  OriginalRow227TriangleData1541.coefficient124_292,
  OriginalRow227TriangleData1541.coefficient124_293,
  OriginalRow227TriangleData1541.coefficient124_294,
  OriginalRow227TriangleData1541.coefficient124_295,
  OriginalRow227TriangleData1541.coefficient124_296,
  OriginalRow227TriangleData1541.coefficient124_297,
  OriginalRow227TriangleData1541.coefficient124_298,
  OriginalRow227TriangleData1541.coefficient124_299,
  OriginalRow227TriangleData1541.coefficient124_300,
  OriginalRow227TriangleData1541.coefficient124_301,
  OriginalRow227TriangleData1541.coefficient124_302,
  OriginalRow227TriangleData1541.coefficient124_303,
  OriginalRow227TriangleData1541.coefficient124_304,
  OriginalRow227TriangleData1541.coefficient124_305,
  OriginalRow227TriangleData1541.coefficient124_306,
  OriginalRow227TriangleData1541.coefficient124_307,
  OriginalRow227TriangleData1541.coefficient124_308,
  OriginalRow227TriangleData1541.coefficient124_309,
  OriginalRow227TriangleData1541.coefficient124_310,
  OriginalRow227TriangleData1541.coefficient124_311,
  OriginalRow227TriangleData1541.coefficient124_312,
  OriginalRow227TriangleData1541.coefficient124_313,
  OriginalRow227TriangleData1541.coefficient124_314
]

theorem values1541_size : values1541.size = 32 := rfl

def block1541 : ℕ → Option IntervalDyadic := segment 283 values1541

theorem block1541_domain : ExactDomain block1541 283 315 := by
  simpa only [values1541_size] using segment_domain 283 values1541

theorem block1541_get (i : Fin 32) :
    block1541 (283 + i.val) = some (values1541[i.val]'(by rw [values1541_size]; exact i.isLt)) := by
  exact segment_get 283 values1541 ⟨i.val, by rw [values1541_size]; exact i.isLt⟩

def values1542 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1542.coefficient124_315,
  OriginalRow227TriangleData1542.coefficient124_316,
  OriginalRow227TriangleData1542.coefficient124_317,
  OriginalRow227TriangleData1542.coefficient124_318,
  OriginalRow227TriangleData1542.coefficient124_319,
  OriginalRow227TriangleData1542.coefficient124_320,
  OriginalRow227TriangleData1542.coefficient124_321,
  OriginalRow227TriangleData1542.coefficient124_322,
  OriginalRow227TriangleData1542.coefficient124_323,
  OriginalRow227TriangleData1542.coefficient124_324,
  OriginalRow227TriangleData1542.coefficient124_325,
  OriginalRow227TriangleData1542.coefficient124_326,
  OriginalRow227TriangleData1542.coefficient124_327,
  OriginalRow227TriangleData1542.coefficient124_328,
  OriginalRow227TriangleData1542.coefficient124_329,
  OriginalRow227TriangleData1542.coefficient124_330,
  OriginalRow227TriangleData1542.coefficient124_331,
  OriginalRow227TriangleData1542.coefficient124_332,
  OriginalRow227TriangleData1542.coefficient124_333,
  OriginalRow227TriangleData1542.coefficient124_334,
  OriginalRow227TriangleData1542.coefficient124_335,
  OriginalRow227TriangleData1542.coefficient124_336,
  OriginalRow227TriangleData1542.coefficient124_337,
  OriginalRow227TriangleData1542.coefficient124_338,
  OriginalRow227TriangleData1542.coefficient124_339,
  OriginalRow227TriangleData1542.coefficient124_340,
  OriginalRow227TriangleData1542.coefficient124_341,
  OriginalRow227TriangleData1542.coefficient124_342,
  OriginalRow227TriangleData1542.coefficient124_343,
  OriginalRow227TriangleData1542.coefficient124_344,
  OriginalRow227TriangleData1542.coefficient124_345,
  OriginalRow227TriangleData1542.coefficient124_346
]

theorem values1542_size : values1542.size = 32 := rfl

def block1542 : ℕ → Option IntervalDyadic := segment 315 values1542

theorem block1542_domain : ExactDomain block1542 315 347 := by
  simpa only [values1542_size] using segment_domain 315 values1542

theorem block1542_get (i : Fin 32) :
    block1542 (315 + i.val) = some (values1542[i.val]'(by rw [values1542_size]; exact i.isLt)) := by
  exact segment_get 315 values1542 ⟨i.val, by rw [values1542_size]; exact i.isLt⟩

def values1543 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1543.coefficient124_347,
  OriginalRow227TriangleData1543.coefficient124_348,
  OriginalRow227TriangleData1543.coefficient124_349,
  OriginalRow227TriangleData1543.coefficient124_350,
  OriginalRow227TriangleData1543.coefficient124_351,
  OriginalRow227TriangleData1543.coefficient124_352,
  OriginalRow227TriangleData1543.coefficient124_353,
  OriginalRow227TriangleData1543.coefficient124_354,
  OriginalRow227TriangleData1543.coefficient124_355,
  OriginalRow227TriangleData1543.coefficient124_356,
  OriginalRow227TriangleData1543.coefficient124_357,
  OriginalRow227TriangleData1543.coefficient124_358,
  OriginalRow227TriangleData1543.coefficient124_359,
  OriginalRow227TriangleData1543.coefficient124_360,
  OriginalRow227TriangleData1543.coefficient124_361,
  OriginalRow227TriangleData1543.coefficient124_362,
  OriginalRow227TriangleData1543.coefficient124_363,
  OriginalRow227TriangleData1543.coefficient124_364,
  OriginalRow227TriangleData1543.coefficient124_365,
  OriginalRow227TriangleData1543.coefficient124_366,
  OriginalRow227TriangleData1543.coefficient124_367,
  OriginalRow227TriangleData1543.coefficient124_368,
  OriginalRow227TriangleData1543.coefficient124_369,
  OriginalRow227TriangleData1543.coefficient124_370,
  OriginalRow227TriangleData1543.coefficient124_371,
  OriginalRow227TriangleData1543.coefficient124_372,
  OriginalRow227TriangleData1543.coefficient124_373,
  OriginalRow227TriangleData1543.coefficient124_374,
  OriginalRow227TriangleData1543.coefficient124_375,
  OriginalRow227TriangleData1543.coefficient124_376,
  OriginalRow227TriangleData1543.coefficient124_377
]

theorem values1543_size : values1543.size = 31 := rfl

def block1543 : ℕ → Option IntervalDyadic := segment 347 values1543

theorem block1543_domain : ExactDomain block1543 347 378 := by
  simpa only [values1543_size] using segment_domain 347 values1543

theorem block1543_get (i : Fin 31) :
    block1543 (347 + i.val) = some (values1543[i.val]'(by rw [values1543_size]; exact i.isLt)) := by
  exact segment_get 347 values1543 ⟨i.val, by rw [values1543_size]; exact i.isLt⟩

def node0123_0187 : ℕ → Option IntervalDyadic := split 155 block1536 block1537

theorem node0123_0187_domain : ExactDomain node0123_0187 123 187 := by
  exact split_domain (by decide) (by decide) block1536_domain block1537_domain

def node0187_0251 : ℕ → Option IntervalDyadic := split 219 block1538 block1539

theorem node0187_0251_domain : ExactDomain node0187_0251 187 251 := by
  exact split_domain (by decide) (by decide) block1538_domain block1539_domain

def node0123_0251 : ℕ → Option IntervalDyadic := split 187 node0123_0187 node0187_0251

theorem node0123_0251_domain : ExactDomain node0123_0251 123 251 := by
  exact split_domain (by decide) (by decide) node0123_0187_domain node0187_0251_domain

def node0251_0315 : ℕ → Option IntervalDyadic := split 283 block1540 block1541

theorem node0251_0315_domain : ExactDomain node0251_0315 251 315 := by
  exact split_domain (by decide) (by decide) block1540_domain block1541_domain

def node0315_0378 : ℕ → Option IntervalDyadic := split 347 block1542 block1543

theorem node0315_0378_domain : ExactDomain node0315_0378 315 378 := by
  exact split_domain (by decide) (by decide) block1542_domain block1543_domain

def node0251_0378 : ℕ → Option IntervalDyadic := split 315 node0251_0315 node0315_0378

theorem node0251_0378_domain : ExactDomain node0251_0378 251 378 := by
  exact split_domain (by decide) (by decide) node0251_0315_domain node0315_0378_domain

def node0123_0378 : ℕ → Option IntervalDyadic := split 251 node0123_0251 node0251_0378

theorem node0123_0378_domain : ExactDomain node0123_0378 123 378 := by
  exact split_domain (by decide) (by decide) node0123_0251_domain node0251_0378_domain

def lookup : ℕ → Option IntervalDyadic := node0123_0378

theorem lookup_domain : ExactDomain lookup 123 378 :=
  node0123_0378_domain

theorem block1536_lookup (i : Fin 32) :
    lookup (123 + i.val) = some (values1536[i.val]'(by rw [values1536_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (123 + i.val) = _
  rw [node0123_0378, split_left 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0123_0251, split_left 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0123_0187, split_left 155 block1536 block1537 (by omega)]
  exact block1536_get i

theorem block1537_lookup (i : Fin 32) :
    lookup (155 + i.val) = some (values1537[i.val]'(by rw [values1537_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (155 + i.val) = _
  rw [node0123_0378, split_left 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0123_0251, split_left 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0123_0187, split_right 155 block1536 block1537 (by omega)]
  exact block1537_get i

theorem block1538_lookup (i : Fin 32) :
    lookup (187 + i.val) = some (values1538[i.val]'(by rw [values1538_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (187 + i.val) = _
  rw [node0123_0378, split_left 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0123_0251, split_right 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0187_0251, split_left 219 block1538 block1539 (by omega)]
  exact block1538_get i

theorem block1539_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values1539[i.val]'(by rw [values1539_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (219 + i.val) = _
  rw [node0123_0378, split_left 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0123_0251, split_right 187 node0123_0187 node0187_0251 (by omega)]
  rw [node0187_0251, split_right 219 block1538 block1539 (by omega)]
  exact block1539_get i

theorem block1540_lookup (i : Fin 32) :
    lookup (251 + i.val) = some (values1540[i.val]'(by rw [values1540_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (251 + i.val) = _
  rw [node0123_0378, split_right 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0251_0378, split_left 315 node0251_0315 node0315_0378 (by omega)]
  rw [node0251_0315, split_left 283 block1540 block1541 (by omega)]
  exact block1540_get i

theorem block1541_lookup (i : Fin 32) :
    lookup (283 + i.val) = some (values1541[i.val]'(by rw [values1541_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (283 + i.val) = _
  rw [node0123_0378, split_right 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0251_0378, split_left 315 node0251_0315 node0315_0378 (by omega)]
  rw [node0251_0315, split_right 283 block1540 block1541 (by omega)]
  exact block1541_get i

theorem block1542_lookup (i : Fin 32) :
    lookup (315 + i.val) = some (values1542[i.val]'(by rw [values1542_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (315 + i.val) = _
  rw [node0123_0378, split_right 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0251_0378, split_right 315 node0251_0315 node0315_0378 (by omega)]
  rw [node0315_0378, split_left 347 block1542 block1543 (by omega)]
  exact block1542_get i

theorem block1543_lookup (i : Fin 31) :
    lookup (347 + i.val) = some (values1543[i.val]'(by rw [values1543_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0123_0378 (347 + i.val) = _
  rw [node0123_0378, split_right 251 node0123_0251 node0251_0378 (by omega)]
  rw [node0251_0378, split_right 315 node0251_0315 node0315_0378 (by omega)]
  rw [node0315_0378, split_right 347 block1542 block1543 (by omega)]
  exact block1543_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1536_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1536_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1537_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1537_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1538_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1538_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1539_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1539_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1540_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1540_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1541_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1541_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1542_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1542_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1543_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1543_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1536_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1537_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1538_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1539_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1540_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1541_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1542_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow124.block1543_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow124
