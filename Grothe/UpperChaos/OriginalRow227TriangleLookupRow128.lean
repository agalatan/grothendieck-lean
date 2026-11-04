import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1568
import Grothe.UpperChaos.OriginalRow227TriangleData1569
import Grothe.UpperChaos.OriginalRow227TriangleData1570
import Grothe.UpperChaos.OriginalRow227TriangleData1571
import Grothe.UpperChaos.OriginalRow227TriangleData1572
import Grothe.UpperChaos.OriginalRow227TriangleData1573
import Grothe.UpperChaos.OriginalRow227TriangleData1574
import Grothe.UpperChaos.OriginalRow227TriangleData1575

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow128

open ConditionalTableLookup

def values1568 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1568.coefficient128_127,
  OriginalRow227TriangleData1568.coefficient128_128,
  OriginalRow227TriangleData1568.coefficient128_129,
  OriginalRow227TriangleData1568.coefficient128_130,
  OriginalRow227TriangleData1568.coefficient128_131,
  OriginalRow227TriangleData1568.coefficient128_132,
  OriginalRow227TriangleData1568.coefficient128_133,
  OriginalRow227TriangleData1568.coefficient128_134,
  OriginalRow227TriangleData1568.coefficient128_135,
  OriginalRow227TriangleData1568.coefficient128_136,
  OriginalRow227TriangleData1568.coefficient128_137,
  OriginalRow227TriangleData1568.coefficient128_138,
  OriginalRow227TriangleData1568.coefficient128_139,
  OriginalRow227TriangleData1568.coefficient128_140,
  OriginalRow227TriangleData1568.coefficient128_141,
  OriginalRow227TriangleData1568.coefficient128_142,
  OriginalRow227TriangleData1568.coefficient128_143,
  OriginalRow227TriangleData1568.coefficient128_144,
  OriginalRow227TriangleData1568.coefficient128_145,
  OriginalRow227TriangleData1568.coefficient128_146,
  OriginalRow227TriangleData1568.coefficient128_147,
  OriginalRow227TriangleData1568.coefficient128_148,
  OriginalRow227TriangleData1568.coefficient128_149,
  OriginalRow227TriangleData1568.coefficient128_150,
  OriginalRow227TriangleData1568.coefficient128_151,
  OriginalRow227TriangleData1568.coefficient128_152,
  OriginalRow227TriangleData1568.coefficient128_153,
  OriginalRow227TriangleData1568.coefficient128_154,
  OriginalRow227TriangleData1568.coefficient128_155,
  OriginalRow227TriangleData1568.coefficient128_156,
  OriginalRow227TriangleData1568.coefficient128_157,
  OriginalRow227TriangleData1568.coefficient128_158
]

theorem values1568_size : values1568.size = 32 := rfl

def block1568 : ℕ → Option IntervalDyadic := segment 127 values1568

theorem block1568_domain : ExactDomain block1568 127 159 := by
  simpa only [values1568_size] using segment_domain 127 values1568

theorem block1568_get (i : Fin 32) :
    block1568 (127 + i.val) = some (values1568[i.val]'(by rw [values1568_size]; exact i.isLt)) := by
  exact segment_get 127 values1568 ⟨i.val, by rw [values1568_size]; exact i.isLt⟩

def values1569 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1569.coefficient128_159,
  OriginalRow227TriangleData1569.coefficient128_160,
  OriginalRow227TriangleData1569.coefficient128_161,
  OriginalRow227TriangleData1569.coefficient128_162,
  OriginalRow227TriangleData1569.coefficient128_163,
  OriginalRow227TriangleData1569.coefficient128_164,
  OriginalRow227TriangleData1569.coefficient128_165,
  OriginalRow227TriangleData1569.coefficient128_166,
  OriginalRow227TriangleData1569.coefficient128_167,
  OriginalRow227TriangleData1569.coefficient128_168,
  OriginalRow227TriangleData1569.coefficient128_169,
  OriginalRow227TriangleData1569.coefficient128_170,
  OriginalRow227TriangleData1569.coefficient128_171,
  OriginalRow227TriangleData1569.coefficient128_172,
  OriginalRow227TriangleData1569.coefficient128_173,
  OriginalRow227TriangleData1569.coefficient128_174,
  OriginalRow227TriangleData1569.coefficient128_175,
  OriginalRow227TriangleData1569.coefficient128_176,
  OriginalRow227TriangleData1569.coefficient128_177,
  OriginalRow227TriangleData1569.coefficient128_178,
  OriginalRow227TriangleData1569.coefficient128_179,
  OriginalRow227TriangleData1569.coefficient128_180,
  OriginalRow227TriangleData1569.coefficient128_181,
  OriginalRow227TriangleData1569.coefficient128_182,
  OriginalRow227TriangleData1569.coefficient128_183,
  OriginalRow227TriangleData1569.coefficient128_184,
  OriginalRow227TriangleData1569.coefficient128_185,
  OriginalRow227TriangleData1569.coefficient128_186,
  OriginalRow227TriangleData1569.coefficient128_187,
  OriginalRow227TriangleData1569.coefficient128_188,
  OriginalRow227TriangleData1569.coefficient128_189,
  OriginalRow227TriangleData1569.coefficient128_190
]

theorem values1569_size : values1569.size = 32 := rfl

def block1569 : ℕ → Option IntervalDyadic := segment 159 values1569

theorem block1569_domain : ExactDomain block1569 159 191 := by
  simpa only [values1569_size] using segment_domain 159 values1569

theorem block1569_get (i : Fin 32) :
    block1569 (159 + i.val) = some (values1569[i.val]'(by rw [values1569_size]; exact i.isLt)) := by
  exact segment_get 159 values1569 ⟨i.val, by rw [values1569_size]; exact i.isLt⟩

def values1570 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1570.coefficient128_191,
  OriginalRow227TriangleData1570.coefficient128_192,
  OriginalRow227TriangleData1570.coefficient128_193,
  OriginalRow227TriangleData1570.coefficient128_194,
  OriginalRow227TriangleData1570.coefficient128_195,
  OriginalRow227TriangleData1570.coefficient128_196,
  OriginalRow227TriangleData1570.coefficient128_197,
  OriginalRow227TriangleData1570.coefficient128_198,
  OriginalRow227TriangleData1570.coefficient128_199,
  OriginalRow227TriangleData1570.coefficient128_200,
  OriginalRow227TriangleData1570.coefficient128_201,
  OriginalRow227TriangleData1570.coefficient128_202,
  OriginalRow227TriangleData1570.coefficient128_203,
  OriginalRow227TriangleData1570.coefficient128_204,
  OriginalRow227TriangleData1570.coefficient128_205,
  OriginalRow227TriangleData1570.coefficient128_206,
  OriginalRow227TriangleData1570.coefficient128_207,
  OriginalRow227TriangleData1570.coefficient128_208,
  OriginalRow227TriangleData1570.coefficient128_209,
  OriginalRow227TriangleData1570.coefficient128_210,
  OriginalRow227TriangleData1570.coefficient128_211,
  OriginalRow227TriangleData1570.coefficient128_212,
  OriginalRow227TriangleData1570.coefficient128_213,
  OriginalRow227TriangleData1570.coefficient128_214,
  OriginalRow227TriangleData1570.coefficient128_215,
  OriginalRow227TriangleData1570.coefficient128_216,
  OriginalRow227TriangleData1570.coefficient128_217,
  OriginalRow227TriangleData1570.coefficient128_218,
  OriginalRow227TriangleData1570.coefficient128_219,
  OriginalRow227TriangleData1570.coefficient128_220,
  OriginalRow227TriangleData1570.coefficient128_221,
  OriginalRow227TriangleData1570.coefficient128_222
]

theorem values1570_size : values1570.size = 32 := rfl

def block1570 : ℕ → Option IntervalDyadic := segment 191 values1570

theorem block1570_domain : ExactDomain block1570 191 223 := by
  simpa only [values1570_size] using segment_domain 191 values1570

theorem block1570_get (i : Fin 32) :
    block1570 (191 + i.val) = some (values1570[i.val]'(by rw [values1570_size]; exact i.isLt)) := by
  exact segment_get 191 values1570 ⟨i.val, by rw [values1570_size]; exact i.isLt⟩

def values1571 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1571.coefficient128_223,
  OriginalRow227TriangleData1571.coefficient128_224,
  OriginalRow227TriangleData1571.coefficient128_225,
  OriginalRow227TriangleData1571.coefficient128_226,
  OriginalRow227TriangleData1571.coefficient128_227,
  OriginalRow227TriangleData1571.coefficient128_228,
  OriginalRow227TriangleData1571.coefficient128_229,
  OriginalRow227TriangleData1571.coefficient128_230,
  OriginalRow227TriangleData1571.coefficient128_231,
  OriginalRow227TriangleData1571.coefficient128_232,
  OriginalRow227TriangleData1571.coefficient128_233,
  OriginalRow227TriangleData1571.coefficient128_234,
  OriginalRow227TriangleData1571.coefficient128_235,
  OriginalRow227TriangleData1571.coefficient128_236,
  OriginalRow227TriangleData1571.coefficient128_237,
  OriginalRow227TriangleData1571.coefficient128_238,
  OriginalRow227TriangleData1571.coefficient128_239,
  OriginalRow227TriangleData1571.coefficient128_240,
  OriginalRow227TriangleData1571.coefficient128_241,
  OriginalRow227TriangleData1571.coefficient128_242,
  OriginalRow227TriangleData1571.coefficient128_243,
  OriginalRow227TriangleData1571.coefficient128_244,
  OriginalRow227TriangleData1571.coefficient128_245,
  OriginalRow227TriangleData1571.coefficient128_246,
  OriginalRow227TriangleData1571.coefficient128_247,
  OriginalRow227TriangleData1571.coefficient128_248,
  OriginalRow227TriangleData1571.coefficient128_249,
  OriginalRow227TriangleData1571.coefficient128_250,
  OriginalRow227TriangleData1571.coefficient128_251,
  OriginalRow227TriangleData1571.coefficient128_252,
  OriginalRow227TriangleData1571.coefficient128_253,
  OriginalRow227TriangleData1571.coefficient128_254
]

theorem values1571_size : values1571.size = 32 := rfl

def block1571 : ℕ → Option IntervalDyadic := segment 223 values1571

theorem block1571_domain : ExactDomain block1571 223 255 := by
  simpa only [values1571_size] using segment_domain 223 values1571

theorem block1571_get (i : Fin 32) :
    block1571 (223 + i.val) = some (values1571[i.val]'(by rw [values1571_size]; exact i.isLt)) := by
  exact segment_get 223 values1571 ⟨i.val, by rw [values1571_size]; exact i.isLt⟩

def values1572 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1572.coefficient128_255,
  OriginalRow227TriangleData1572.coefficient128_256,
  OriginalRow227TriangleData1572.coefficient128_257,
  OriginalRow227TriangleData1572.coefficient128_258,
  OriginalRow227TriangleData1572.coefficient128_259,
  OriginalRow227TriangleData1572.coefficient128_260,
  OriginalRow227TriangleData1572.coefficient128_261,
  OriginalRow227TriangleData1572.coefficient128_262,
  OriginalRow227TriangleData1572.coefficient128_263,
  OriginalRow227TriangleData1572.coefficient128_264,
  OriginalRow227TriangleData1572.coefficient128_265,
  OriginalRow227TriangleData1572.coefficient128_266,
  OriginalRow227TriangleData1572.coefficient128_267,
  OriginalRow227TriangleData1572.coefficient128_268,
  OriginalRow227TriangleData1572.coefficient128_269,
  OriginalRow227TriangleData1572.coefficient128_270,
  OriginalRow227TriangleData1572.coefficient128_271,
  OriginalRow227TriangleData1572.coefficient128_272,
  OriginalRow227TriangleData1572.coefficient128_273,
  OriginalRow227TriangleData1572.coefficient128_274,
  OriginalRow227TriangleData1572.coefficient128_275,
  OriginalRow227TriangleData1572.coefficient128_276,
  OriginalRow227TriangleData1572.coefficient128_277,
  OriginalRow227TriangleData1572.coefficient128_278,
  OriginalRow227TriangleData1572.coefficient128_279,
  OriginalRow227TriangleData1572.coefficient128_280,
  OriginalRow227TriangleData1572.coefficient128_281,
  OriginalRow227TriangleData1572.coefficient128_282,
  OriginalRow227TriangleData1572.coefficient128_283,
  OriginalRow227TriangleData1572.coefficient128_284,
  OriginalRow227TriangleData1572.coefficient128_285,
  OriginalRow227TriangleData1572.coefficient128_286
]

theorem values1572_size : values1572.size = 32 := rfl

def block1572 : ℕ → Option IntervalDyadic := segment 255 values1572

theorem block1572_domain : ExactDomain block1572 255 287 := by
  simpa only [values1572_size] using segment_domain 255 values1572

theorem block1572_get (i : Fin 32) :
    block1572 (255 + i.val) = some (values1572[i.val]'(by rw [values1572_size]; exact i.isLt)) := by
  exact segment_get 255 values1572 ⟨i.val, by rw [values1572_size]; exact i.isLt⟩

def values1573 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1573.coefficient128_287,
  OriginalRow227TriangleData1573.coefficient128_288,
  OriginalRow227TriangleData1573.coefficient128_289,
  OriginalRow227TriangleData1573.coefficient128_290,
  OriginalRow227TriangleData1573.coefficient128_291,
  OriginalRow227TriangleData1573.coefficient128_292,
  OriginalRow227TriangleData1573.coefficient128_293,
  OriginalRow227TriangleData1573.coefficient128_294,
  OriginalRow227TriangleData1573.coefficient128_295,
  OriginalRow227TriangleData1573.coefficient128_296,
  OriginalRow227TriangleData1573.coefficient128_297,
  OriginalRow227TriangleData1573.coefficient128_298,
  OriginalRow227TriangleData1573.coefficient128_299,
  OriginalRow227TriangleData1573.coefficient128_300,
  OriginalRow227TriangleData1573.coefficient128_301,
  OriginalRow227TriangleData1573.coefficient128_302,
  OriginalRow227TriangleData1573.coefficient128_303,
  OriginalRow227TriangleData1573.coefficient128_304,
  OriginalRow227TriangleData1573.coefficient128_305,
  OriginalRow227TriangleData1573.coefficient128_306,
  OriginalRow227TriangleData1573.coefficient128_307,
  OriginalRow227TriangleData1573.coefficient128_308,
  OriginalRow227TriangleData1573.coefficient128_309,
  OriginalRow227TriangleData1573.coefficient128_310,
  OriginalRow227TriangleData1573.coefficient128_311,
  OriginalRow227TriangleData1573.coefficient128_312,
  OriginalRow227TriangleData1573.coefficient128_313,
  OriginalRow227TriangleData1573.coefficient128_314,
  OriginalRow227TriangleData1573.coefficient128_315,
  OriginalRow227TriangleData1573.coefficient128_316,
  OriginalRow227TriangleData1573.coefficient128_317,
  OriginalRow227TriangleData1573.coefficient128_318
]

theorem values1573_size : values1573.size = 32 := rfl

def block1573 : ℕ → Option IntervalDyadic := segment 287 values1573

theorem block1573_domain : ExactDomain block1573 287 319 := by
  simpa only [values1573_size] using segment_domain 287 values1573

theorem block1573_get (i : Fin 32) :
    block1573 (287 + i.val) = some (values1573[i.val]'(by rw [values1573_size]; exact i.isLt)) := by
  exact segment_get 287 values1573 ⟨i.val, by rw [values1573_size]; exact i.isLt⟩

def values1574 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1574.coefficient128_319,
  OriginalRow227TriangleData1574.coefficient128_320,
  OriginalRow227TriangleData1574.coefficient128_321,
  OriginalRow227TriangleData1574.coefficient128_322,
  OriginalRow227TriangleData1574.coefficient128_323,
  OriginalRow227TriangleData1574.coefficient128_324,
  OriginalRow227TriangleData1574.coefficient128_325,
  OriginalRow227TriangleData1574.coefficient128_326,
  OriginalRow227TriangleData1574.coefficient128_327,
  OriginalRow227TriangleData1574.coefficient128_328,
  OriginalRow227TriangleData1574.coefficient128_329,
  OriginalRow227TriangleData1574.coefficient128_330,
  OriginalRow227TriangleData1574.coefficient128_331,
  OriginalRow227TriangleData1574.coefficient128_332,
  OriginalRow227TriangleData1574.coefficient128_333,
  OriginalRow227TriangleData1574.coefficient128_334,
  OriginalRow227TriangleData1574.coefficient128_335,
  OriginalRow227TriangleData1574.coefficient128_336,
  OriginalRow227TriangleData1574.coefficient128_337,
  OriginalRow227TriangleData1574.coefficient128_338,
  OriginalRow227TriangleData1574.coefficient128_339,
  OriginalRow227TriangleData1574.coefficient128_340,
  OriginalRow227TriangleData1574.coefficient128_341,
  OriginalRow227TriangleData1574.coefficient128_342,
  OriginalRow227TriangleData1574.coefficient128_343,
  OriginalRow227TriangleData1574.coefficient128_344,
  OriginalRow227TriangleData1574.coefficient128_345,
  OriginalRow227TriangleData1574.coefficient128_346,
  OriginalRow227TriangleData1574.coefficient128_347,
  OriginalRow227TriangleData1574.coefficient128_348,
  OriginalRow227TriangleData1574.coefficient128_349,
  OriginalRow227TriangleData1574.coefficient128_350
]

theorem values1574_size : values1574.size = 32 := rfl

def block1574 : ℕ → Option IntervalDyadic := segment 319 values1574

theorem block1574_domain : ExactDomain block1574 319 351 := by
  simpa only [values1574_size] using segment_domain 319 values1574

theorem block1574_get (i : Fin 32) :
    block1574 (319 + i.val) = some (values1574[i.val]'(by rw [values1574_size]; exact i.isLt)) := by
  exact segment_get 319 values1574 ⟨i.val, by rw [values1574_size]; exact i.isLt⟩

def values1575 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1575.coefficient128_351,
  OriginalRow227TriangleData1575.coefficient128_352,
  OriginalRow227TriangleData1575.coefficient128_353,
  OriginalRow227TriangleData1575.coefficient128_354,
  OriginalRow227TriangleData1575.coefficient128_355,
  OriginalRow227TriangleData1575.coefficient128_356,
  OriginalRow227TriangleData1575.coefficient128_357,
  OriginalRow227TriangleData1575.coefficient128_358,
  OriginalRow227TriangleData1575.coefficient128_359,
  OriginalRow227TriangleData1575.coefficient128_360,
  OriginalRow227TriangleData1575.coefficient128_361,
  OriginalRow227TriangleData1575.coefficient128_362,
  OriginalRow227TriangleData1575.coefficient128_363,
  OriginalRow227TriangleData1575.coefficient128_364,
  OriginalRow227TriangleData1575.coefficient128_365,
  OriginalRow227TriangleData1575.coefficient128_366,
  OriginalRow227TriangleData1575.coefficient128_367,
  OriginalRow227TriangleData1575.coefficient128_368,
  OriginalRow227TriangleData1575.coefficient128_369,
  OriginalRow227TriangleData1575.coefficient128_370,
  OriginalRow227TriangleData1575.coefficient128_371,
  OriginalRow227TriangleData1575.coefficient128_372,
  OriginalRow227TriangleData1575.coefficient128_373
]

theorem values1575_size : values1575.size = 23 := rfl

def block1575 : ℕ → Option IntervalDyadic := segment 351 values1575

theorem block1575_domain : ExactDomain block1575 351 374 := by
  simpa only [values1575_size] using segment_domain 351 values1575

theorem block1575_get (i : Fin 23) :
    block1575 (351 + i.val) = some (values1575[i.val]'(by rw [values1575_size]; exact i.isLt)) := by
  exact segment_get 351 values1575 ⟨i.val, by rw [values1575_size]; exact i.isLt⟩

def node0127_0191 : ℕ → Option IntervalDyadic := split 159 block1568 block1569

theorem node0127_0191_domain : ExactDomain node0127_0191 127 191 := by
  exact split_domain (by decide) (by decide) block1568_domain block1569_domain

def node0191_0255 : ℕ → Option IntervalDyadic := split 223 block1570 block1571

theorem node0191_0255_domain : ExactDomain node0191_0255 191 255 := by
  exact split_domain (by decide) (by decide) block1570_domain block1571_domain

def node0127_0255 : ℕ → Option IntervalDyadic := split 191 node0127_0191 node0191_0255

theorem node0127_0255_domain : ExactDomain node0127_0255 127 255 := by
  exact split_domain (by decide) (by decide) node0127_0191_domain node0191_0255_domain

def node0255_0319 : ℕ → Option IntervalDyadic := split 287 block1572 block1573

theorem node0255_0319_domain : ExactDomain node0255_0319 255 319 := by
  exact split_domain (by decide) (by decide) block1572_domain block1573_domain

def node0319_0374 : ℕ → Option IntervalDyadic := split 351 block1574 block1575

theorem node0319_0374_domain : ExactDomain node0319_0374 319 374 := by
  exact split_domain (by decide) (by decide) block1574_domain block1575_domain

def node0255_0374 : ℕ → Option IntervalDyadic := split 319 node0255_0319 node0319_0374

theorem node0255_0374_domain : ExactDomain node0255_0374 255 374 := by
  exact split_domain (by decide) (by decide) node0255_0319_domain node0319_0374_domain

def node0127_0374 : ℕ → Option IntervalDyadic := split 255 node0127_0255 node0255_0374

theorem node0127_0374_domain : ExactDomain node0127_0374 127 374 := by
  exact split_domain (by decide) (by decide) node0127_0255_domain node0255_0374_domain

def lookup : ℕ → Option IntervalDyadic := node0127_0374

theorem lookup_domain : ExactDomain lookup 127 374 :=
  node0127_0374_domain

theorem block1568_lookup (i : Fin 32) :
    lookup (127 + i.val) = some (values1568[i.val]'(by rw [values1568_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (127 + i.val) = _
  rw [node0127_0374, split_left 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0127_0255, split_left 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0127_0191, split_left 159 block1568 block1569 (by omega)]
  exact block1568_get i

theorem block1569_lookup (i : Fin 32) :
    lookup (159 + i.val) = some (values1569[i.val]'(by rw [values1569_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (159 + i.val) = _
  rw [node0127_0374, split_left 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0127_0255, split_left 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0127_0191, split_right 159 block1568 block1569 (by omega)]
  exact block1569_get i

theorem block1570_lookup (i : Fin 32) :
    lookup (191 + i.val) = some (values1570[i.val]'(by rw [values1570_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (191 + i.val) = _
  rw [node0127_0374, split_left 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0127_0255, split_right 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0191_0255, split_left 223 block1570 block1571 (by omega)]
  exact block1570_get i

theorem block1571_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values1571[i.val]'(by rw [values1571_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (223 + i.val) = _
  rw [node0127_0374, split_left 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0127_0255, split_right 191 node0127_0191 node0191_0255 (by omega)]
  rw [node0191_0255, split_right 223 block1570 block1571 (by omega)]
  exact block1571_get i

theorem block1572_lookup (i : Fin 32) :
    lookup (255 + i.val) = some (values1572[i.val]'(by rw [values1572_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (255 + i.val) = _
  rw [node0127_0374, split_right 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0255_0374, split_left 319 node0255_0319 node0319_0374 (by omega)]
  rw [node0255_0319, split_left 287 block1572 block1573 (by omega)]
  exact block1572_get i

theorem block1573_lookup (i : Fin 32) :
    lookup (287 + i.val) = some (values1573[i.val]'(by rw [values1573_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (287 + i.val) = _
  rw [node0127_0374, split_right 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0255_0374, split_left 319 node0255_0319 node0319_0374 (by omega)]
  rw [node0255_0319, split_right 287 block1572 block1573 (by omega)]
  exact block1573_get i

theorem block1574_lookup (i : Fin 32) :
    lookup (319 + i.val) = some (values1574[i.val]'(by rw [values1574_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (319 + i.val) = _
  rw [node0127_0374, split_right 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0255_0374, split_right 319 node0255_0319 node0319_0374 (by omega)]
  rw [node0319_0374, split_left 351 block1574 block1575 (by omega)]
  exact block1574_get i

theorem block1575_lookup (i : Fin 23) :
    lookup (351 + i.val) = some (values1575[i.val]'(by rw [values1575_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0127_0374 (351 + i.val) = _
  rw [node0127_0374, split_right 255 node0127_0255 node0255_0374 (by omega)]
  rw [node0255_0374, split_right 319 node0255_0319 node0319_0374 (by omega)]
  rw [node0319_0374, split_right 351 block1574 block1575 (by omega)]
  exact block1575_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1568_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1568_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1569_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1569_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1570_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1570_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1571_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1571_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1572_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1572_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1573_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1573_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1574_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1574_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1575_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1575_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1568_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1569_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1570_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1571_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1572_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1573_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1574_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow128.block1575_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow128
