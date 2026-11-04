import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1592
import Grothe.UpperChaos.OriginalRow227TriangleData1593
import Grothe.UpperChaos.OriginalRow227TriangleData1594
import Grothe.UpperChaos.OriginalRow227TriangleData1595
import Grothe.UpperChaos.OriginalRow227TriangleData1596
import Grothe.UpperChaos.OriginalRow227TriangleData1597
import Grothe.UpperChaos.OriginalRow227TriangleData1598
import Grothe.UpperChaos.OriginalRow227TriangleData1599

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow131

open ConditionalTableLookup

def values1592 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1592.coefficient131_130,
  OriginalRow227TriangleData1592.coefficient131_131,
  OriginalRow227TriangleData1592.coefficient131_132,
  OriginalRow227TriangleData1592.coefficient131_133,
  OriginalRow227TriangleData1592.coefficient131_134,
  OriginalRow227TriangleData1592.coefficient131_135,
  OriginalRow227TriangleData1592.coefficient131_136,
  OriginalRow227TriangleData1592.coefficient131_137,
  OriginalRow227TriangleData1592.coefficient131_138,
  OriginalRow227TriangleData1592.coefficient131_139,
  OriginalRow227TriangleData1592.coefficient131_140,
  OriginalRow227TriangleData1592.coefficient131_141,
  OriginalRow227TriangleData1592.coefficient131_142,
  OriginalRow227TriangleData1592.coefficient131_143,
  OriginalRow227TriangleData1592.coefficient131_144,
  OriginalRow227TriangleData1592.coefficient131_145,
  OriginalRow227TriangleData1592.coefficient131_146,
  OriginalRow227TriangleData1592.coefficient131_147,
  OriginalRow227TriangleData1592.coefficient131_148,
  OriginalRow227TriangleData1592.coefficient131_149,
  OriginalRow227TriangleData1592.coefficient131_150,
  OriginalRow227TriangleData1592.coefficient131_151,
  OriginalRow227TriangleData1592.coefficient131_152,
  OriginalRow227TriangleData1592.coefficient131_153,
  OriginalRow227TriangleData1592.coefficient131_154,
  OriginalRow227TriangleData1592.coefficient131_155,
  OriginalRow227TriangleData1592.coefficient131_156,
  OriginalRow227TriangleData1592.coefficient131_157,
  OriginalRow227TriangleData1592.coefficient131_158,
  OriginalRow227TriangleData1592.coefficient131_159,
  OriginalRow227TriangleData1592.coefficient131_160,
  OriginalRow227TriangleData1592.coefficient131_161
]

theorem values1592_size : values1592.size = 32 := rfl

def block1592 : ℕ → Option IntervalDyadic := segment 130 values1592

theorem block1592_domain : ExactDomain block1592 130 162 := by
  simpa only [values1592_size] using segment_domain 130 values1592

theorem block1592_get (i : Fin 32) :
    block1592 (130 + i.val) = some (values1592[i.val]'(by rw [values1592_size]; exact i.isLt)) := by
  exact segment_get 130 values1592 ⟨i.val, by rw [values1592_size]; exact i.isLt⟩

def values1593 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1593.coefficient131_162,
  OriginalRow227TriangleData1593.coefficient131_163,
  OriginalRow227TriangleData1593.coefficient131_164,
  OriginalRow227TriangleData1593.coefficient131_165,
  OriginalRow227TriangleData1593.coefficient131_166,
  OriginalRow227TriangleData1593.coefficient131_167,
  OriginalRow227TriangleData1593.coefficient131_168,
  OriginalRow227TriangleData1593.coefficient131_169,
  OriginalRow227TriangleData1593.coefficient131_170,
  OriginalRow227TriangleData1593.coefficient131_171,
  OriginalRow227TriangleData1593.coefficient131_172,
  OriginalRow227TriangleData1593.coefficient131_173,
  OriginalRow227TriangleData1593.coefficient131_174,
  OriginalRow227TriangleData1593.coefficient131_175,
  OriginalRow227TriangleData1593.coefficient131_176,
  OriginalRow227TriangleData1593.coefficient131_177,
  OriginalRow227TriangleData1593.coefficient131_178,
  OriginalRow227TriangleData1593.coefficient131_179,
  OriginalRow227TriangleData1593.coefficient131_180,
  OriginalRow227TriangleData1593.coefficient131_181,
  OriginalRow227TriangleData1593.coefficient131_182,
  OriginalRow227TriangleData1593.coefficient131_183,
  OriginalRow227TriangleData1593.coefficient131_184,
  OriginalRow227TriangleData1593.coefficient131_185,
  OriginalRow227TriangleData1593.coefficient131_186,
  OriginalRow227TriangleData1593.coefficient131_187,
  OriginalRow227TriangleData1593.coefficient131_188,
  OriginalRow227TriangleData1593.coefficient131_189,
  OriginalRow227TriangleData1593.coefficient131_190,
  OriginalRow227TriangleData1593.coefficient131_191,
  OriginalRow227TriangleData1593.coefficient131_192,
  OriginalRow227TriangleData1593.coefficient131_193
]

theorem values1593_size : values1593.size = 32 := rfl

def block1593 : ℕ → Option IntervalDyadic := segment 162 values1593

theorem block1593_domain : ExactDomain block1593 162 194 := by
  simpa only [values1593_size] using segment_domain 162 values1593

theorem block1593_get (i : Fin 32) :
    block1593 (162 + i.val) = some (values1593[i.val]'(by rw [values1593_size]; exact i.isLt)) := by
  exact segment_get 162 values1593 ⟨i.val, by rw [values1593_size]; exact i.isLt⟩

def values1594 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1594.coefficient131_194,
  OriginalRow227TriangleData1594.coefficient131_195,
  OriginalRow227TriangleData1594.coefficient131_196,
  OriginalRow227TriangleData1594.coefficient131_197,
  OriginalRow227TriangleData1594.coefficient131_198,
  OriginalRow227TriangleData1594.coefficient131_199,
  OriginalRow227TriangleData1594.coefficient131_200,
  OriginalRow227TriangleData1594.coefficient131_201,
  OriginalRow227TriangleData1594.coefficient131_202,
  OriginalRow227TriangleData1594.coefficient131_203,
  OriginalRow227TriangleData1594.coefficient131_204,
  OriginalRow227TriangleData1594.coefficient131_205,
  OriginalRow227TriangleData1594.coefficient131_206,
  OriginalRow227TriangleData1594.coefficient131_207,
  OriginalRow227TriangleData1594.coefficient131_208,
  OriginalRow227TriangleData1594.coefficient131_209,
  OriginalRow227TriangleData1594.coefficient131_210,
  OriginalRow227TriangleData1594.coefficient131_211,
  OriginalRow227TriangleData1594.coefficient131_212,
  OriginalRow227TriangleData1594.coefficient131_213,
  OriginalRow227TriangleData1594.coefficient131_214,
  OriginalRow227TriangleData1594.coefficient131_215,
  OriginalRow227TriangleData1594.coefficient131_216,
  OriginalRow227TriangleData1594.coefficient131_217,
  OriginalRow227TriangleData1594.coefficient131_218,
  OriginalRow227TriangleData1594.coefficient131_219,
  OriginalRow227TriangleData1594.coefficient131_220,
  OriginalRow227TriangleData1594.coefficient131_221,
  OriginalRow227TriangleData1594.coefficient131_222,
  OriginalRow227TriangleData1594.coefficient131_223,
  OriginalRow227TriangleData1594.coefficient131_224,
  OriginalRow227TriangleData1594.coefficient131_225
]

theorem values1594_size : values1594.size = 32 := rfl

def block1594 : ℕ → Option IntervalDyadic := segment 194 values1594

theorem block1594_domain : ExactDomain block1594 194 226 := by
  simpa only [values1594_size] using segment_domain 194 values1594

theorem block1594_get (i : Fin 32) :
    block1594 (194 + i.val) = some (values1594[i.val]'(by rw [values1594_size]; exact i.isLt)) := by
  exact segment_get 194 values1594 ⟨i.val, by rw [values1594_size]; exact i.isLt⟩

def values1595 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1595.coefficient131_226,
  OriginalRow227TriangleData1595.coefficient131_227,
  OriginalRow227TriangleData1595.coefficient131_228,
  OriginalRow227TriangleData1595.coefficient131_229,
  OriginalRow227TriangleData1595.coefficient131_230,
  OriginalRow227TriangleData1595.coefficient131_231,
  OriginalRow227TriangleData1595.coefficient131_232,
  OriginalRow227TriangleData1595.coefficient131_233,
  OriginalRow227TriangleData1595.coefficient131_234,
  OriginalRow227TriangleData1595.coefficient131_235,
  OriginalRow227TriangleData1595.coefficient131_236,
  OriginalRow227TriangleData1595.coefficient131_237,
  OriginalRow227TriangleData1595.coefficient131_238,
  OriginalRow227TriangleData1595.coefficient131_239,
  OriginalRow227TriangleData1595.coefficient131_240,
  OriginalRow227TriangleData1595.coefficient131_241,
  OriginalRow227TriangleData1595.coefficient131_242,
  OriginalRow227TriangleData1595.coefficient131_243,
  OriginalRow227TriangleData1595.coefficient131_244,
  OriginalRow227TriangleData1595.coefficient131_245,
  OriginalRow227TriangleData1595.coefficient131_246,
  OriginalRow227TriangleData1595.coefficient131_247,
  OriginalRow227TriangleData1595.coefficient131_248,
  OriginalRow227TriangleData1595.coefficient131_249,
  OriginalRow227TriangleData1595.coefficient131_250,
  OriginalRow227TriangleData1595.coefficient131_251,
  OriginalRow227TriangleData1595.coefficient131_252,
  OriginalRow227TriangleData1595.coefficient131_253,
  OriginalRow227TriangleData1595.coefficient131_254,
  OriginalRow227TriangleData1595.coefficient131_255,
  OriginalRow227TriangleData1595.coefficient131_256,
  OriginalRow227TriangleData1595.coefficient131_257
]

theorem values1595_size : values1595.size = 32 := rfl

def block1595 : ℕ → Option IntervalDyadic := segment 226 values1595

theorem block1595_domain : ExactDomain block1595 226 258 := by
  simpa only [values1595_size] using segment_domain 226 values1595

theorem block1595_get (i : Fin 32) :
    block1595 (226 + i.val) = some (values1595[i.val]'(by rw [values1595_size]; exact i.isLt)) := by
  exact segment_get 226 values1595 ⟨i.val, by rw [values1595_size]; exact i.isLt⟩

def values1596 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1596.coefficient131_258,
  OriginalRow227TriangleData1596.coefficient131_259,
  OriginalRow227TriangleData1596.coefficient131_260,
  OriginalRow227TriangleData1596.coefficient131_261,
  OriginalRow227TriangleData1596.coefficient131_262,
  OriginalRow227TriangleData1596.coefficient131_263,
  OriginalRow227TriangleData1596.coefficient131_264,
  OriginalRow227TriangleData1596.coefficient131_265,
  OriginalRow227TriangleData1596.coefficient131_266,
  OriginalRow227TriangleData1596.coefficient131_267,
  OriginalRow227TriangleData1596.coefficient131_268,
  OriginalRow227TriangleData1596.coefficient131_269,
  OriginalRow227TriangleData1596.coefficient131_270,
  OriginalRow227TriangleData1596.coefficient131_271,
  OriginalRow227TriangleData1596.coefficient131_272,
  OriginalRow227TriangleData1596.coefficient131_273,
  OriginalRow227TriangleData1596.coefficient131_274,
  OriginalRow227TriangleData1596.coefficient131_275,
  OriginalRow227TriangleData1596.coefficient131_276,
  OriginalRow227TriangleData1596.coefficient131_277,
  OriginalRow227TriangleData1596.coefficient131_278,
  OriginalRow227TriangleData1596.coefficient131_279,
  OriginalRow227TriangleData1596.coefficient131_280,
  OriginalRow227TriangleData1596.coefficient131_281,
  OriginalRow227TriangleData1596.coefficient131_282,
  OriginalRow227TriangleData1596.coefficient131_283,
  OriginalRow227TriangleData1596.coefficient131_284,
  OriginalRow227TriangleData1596.coefficient131_285,
  OriginalRow227TriangleData1596.coefficient131_286,
  OriginalRow227TriangleData1596.coefficient131_287,
  OriginalRow227TriangleData1596.coefficient131_288,
  OriginalRow227TriangleData1596.coefficient131_289
]

theorem values1596_size : values1596.size = 32 := rfl

def block1596 : ℕ → Option IntervalDyadic := segment 258 values1596

theorem block1596_domain : ExactDomain block1596 258 290 := by
  simpa only [values1596_size] using segment_domain 258 values1596

theorem block1596_get (i : Fin 32) :
    block1596 (258 + i.val) = some (values1596[i.val]'(by rw [values1596_size]; exact i.isLt)) := by
  exact segment_get 258 values1596 ⟨i.val, by rw [values1596_size]; exact i.isLt⟩

def values1597 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1597.coefficient131_290,
  OriginalRow227TriangleData1597.coefficient131_291,
  OriginalRow227TriangleData1597.coefficient131_292,
  OriginalRow227TriangleData1597.coefficient131_293,
  OriginalRow227TriangleData1597.coefficient131_294,
  OriginalRow227TriangleData1597.coefficient131_295,
  OriginalRow227TriangleData1597.coefficient131_296,
  OriginalRow227TriangleData1597.coefficient131_297,
  OriginalRow227TriangleData1597.coefficient131_298,
  OriginalRow227TriangleData1597.coefficient131_299,
  OriginalRow227TriangleData1597.coefficient131_300,
  OriginalRow227TriangleData1597.coefficient131_301,
  OriginalRow227TriangleData1597.coefficient131_302,
  OriginalRow227TriangleData1597.coefficient131_303,
  OriginalRow227TriangleData1597.coefficient131_304,
  OriginalRow227TriangleData1597.coefficient131_305,
  OriginalRow227TriangleData1597.coefficient131_306,
  OriginalRow227TriangleData1597.coefficient131_307,
  OriginalRow227TriangleData1597.coefficient131_308,
  OriginalRow227TriangleData1597.coefficient131_309,
  OriginalRow227TriangleData1597.coefficient131_310,
  OriginalRow227TriangleData1597.coefficient131_311,
  OriginalRow227TriangleData1597.coefficient131_312,
  OriginalRow227TriangleData1597.coefficient131_313,
  OriginalRow227TriangleData1597.coefficient131_314,
  OriginalRow227TriangleData1597.coefficient131_315,
  OriginalRow227TriangleData1597.coefficient131_316,
  OriginalRow227TriangleData1597.coefficient131_317,
  OriginalRow227TriangleData1597.coefficient131_318,
  OriginalRow227TriangleData1597.coefficient131_319,
  OriginalRow227TriangleData1597.coefficient131_320,
  OriginalRow227TriangleData1597.coefficient131_321
]

theorem values1597_size : values1597.size = 32 := rfl

def block1597 : ℕ → Option IntervalDyadic := segment 290 values1597

theorem block1597_domain : ExactDomain block1597 290 322 := by
  simpa only [values1597_size] using segment_domain 290 values1597

theorem block1597_get (i : Fin 32) :
    block1597 (290 + i.val) = some (values1597[i.val]'(by rw [values1597_size]; exact i.isLt)) := by
  exact segment_get 290 values1597 ⟨i.val, by rw [values1597_size]; exact i.isLt⟩

def values1598 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1598.coefficient131_322,
  OriginalRow227TriangleData1598.coefficient131_323,
  OriginalRow227TriangleData1598.coefficient131_324,
  OriginalRow227TriangleData1598.coefficient131_325,
  OriginalRow227TriangleData1598.coefficient131_326,
  OriginalRow227TriangleData1598.coefficient131_327,
  OriginalRow227TriangleData1598.coefficient131_328,
  OriginalRow227TriangleData1598.coefficient131_329,
  OriginalRow227TriangleData1598.coefficient131_330,
  OriginalRow227TriangleData1598.coefficient131_331,
  OriginalRow227TriangleData1598.coefficient131_332,
  OriginalRow227TriangleData1598.coefficient131_333,
  OriginalRow227TriangleData1598.coefficient131_334,
  OriginalRow227TriangleData1598.coefficient131_335,
  OriginalRow227TriangleData1598.coefficient131_336,
  OriginalRow227TriangleData1598.coefficient131_337,
  OriginalRow227TriangleData1598.coefficient131_338,
  OriginalRow227TriangleData1598.coefficient131_339,
  OriginalRow227TriangleData1598.coefficient131_340,
  OriginalRow227TriangleData1598.coefficient131_341,
  OriginalRow227TriangleData1598.coefficient131_342,
  OriginalRow227TriangleData1598.coefficient131_343,
  OriginalRow227TriangleData1598.coefficient131_344,
  OriginalRow227TriangleData1598.coefficient131_345,
  OriginalRow227TriangleData1598.coefficient131_346,
  OriginalRow227TriangleData1598.coefficient131_347,
  OriginalRow227TriangleData1598.coefficient131_348,
  OriginalRow227TriangleData1598.coefficient131_349,
  OriginalRow227TriangleData1598.coefficient131_350,
  OriginalRow227TriangleData1598.coefficient131_351,
  OriginalRow227TriangleData1598.coefficient131_352,
  OriginalRow227TriangleData1598.coefficient131_353
]

theorem values1598_size : values1598.size = 32 := rfl

def block1598 : ℕ → Option IntervalDyadic := segment 322 values1598

theorem block1598_domain : ExactDomain block1598 322 354 := by
  simpa only [values1598_size] using segment_domain 322 values1598

theorem block1598_get (i : Fin 32) :
    block1598 (322 + i.val) = some (values1598[i.val]'(by rw [values1598_size]; exact i.isLt)) := by
  exact segment_get 322 values1598 ⟨i.val, by rw [values1598_size]; exact i.isLt⟩

def values1599 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1599.coefficient131_354,
  OriginalRow227TriangleData1599.coefficient131_355,
  OriginalRow227TriangleData1599.coefficient131_356,
  OriginalRow227TriangleData1599.coefficient131_357,
  OriginalRow227TriangleData1599.coefficient131_358,
  OriginalRow227TriangleData1599.coefficient131_359,
  OriginalRow227TriangleData1599.coefficient131_360,
  OriginalRow227TriangleData1599.coefficient131_361,
  OriginalRow227TriangleData1599.coefficient131_362,
  OriginalRow227TriangleData1599.coefficient131_363,
  OriginalRow227TriangleData1599.coefficient131_364,
  OriginalRow227TriangleData1599.coefficient131_365,
  OriginalRow227TriangleData1599.coefficient131_366,
  OriginalRow227TriangleData1599.coefficient131_367,
  OriginalRow227TriangleData1599.coefficient131_368,
  OriginalRow227TriangleData1599.coefficient131_369,
  OriginalRow227TriangleData1599.coefficient131_370
]

theorem values1599_size : values1599.size = 17 := rfl

def block1599 : ℕ → Option IntervalDyadic := segment 354 values1599

theorem block1599_domain : ExactDomain block1599 354 371 := by
  simpa only [values1599_size] using segment_domain 354 values1599

theorem block1599_get (i : Fin 17) :
    block1599 (354 + i.val) = some (values1599[i.val]'(by rw [values1599_size]; exact i.isLt)) := by
  exact segment_get 354 values1599 ⟨i.val, by rw [values1599_size]; exact i.isLt⟩

def node0130_0194 : ℕ → Option IntervalDyadic := split 162 block1592 block1593

theorem node0130_0194_domain : ExactDomain node0130_0194 130 194 := by
  exact split_domain (by decide) (by decide) block1592_domain block1593_domain

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block1594 block1595

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block1594_domain block1595_domain

def node0130_0258 : ℕ → Option IntervalDyadic := split 194 node0130_0194 node0194_0258

theorem node0130_0258_domain : ExactDomain node0130_0258 130 258 := by
  exact split_domain (by decide) (by decide) node0130_0194_domain node0194_0258_domain

def node0258_0322 : ℕ → Option IntervalDyadic := split 290 block1596 block1597

theorem node0258_0322_domain : ExactDomain node0258_0322 258 322 := by
  exact split_domain (by decide) (by decide) block1596_domain block1597_domain

def node0322_0371 : ℕ → Option IntervalDyadic := split 354 block1598 block1599

theorem node0322_0371_domain : ExactDomain node0322_0371 322 371 := by
  exact split_domain (by decide) (by decide) block1598_domain block1599_domain

def node0258_0371 : ℕ → Option IntervalDyadic := split 322 node0258_0322 node0322_0371

theorem node0258_0371_domain : ExactDomain node0258_0371 258 371 := by
  exact split_domain (by decide) (by decide) node0258_0322_domain node0322_0371_domain

def node0130_0371 : ℕ → Option IntervalDyadic := split 258 node0130_0258 node0258_0371

theorem node0130_0371_domain : ExactDomain node0130_0371 130 371 := by
  exact split_domain (by decide) (by decide) node0130_0258_domain node0258_0371_domain

def lookup : ℕ → Option IntervalDyadic := node0130_0371

theorem lookup_domain : ExactDomain lookup 130 371 :=
  node0130_0371_domain

theorem block1592_lookup (i : Fin 32) :
    lookup (130 + i.val) = some (values1592[i.val]'(by rw [values1592_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (130 + i.val) = _
  rw [node0130_0371, split_left 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0130_0258, split_left 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0130_0194, split_left 162 block1592 block1593 (by omega)]
  exact block1592_get i

theorem block1593_lookup (i : Fin 32) :
    lookup (162 + i.val) = some (values1593[i.val]'(by rw [values1593_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (162 + i.val) = _
  rw [node0130_0371, split_left 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0130_0258, split_left 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0130_0194, split_right 162 block1592 block1593 (by omega)]
  exact block1593_get i

theorem block1594_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values1594[i.val]'(by rw [values1594_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (194 + i.val) = _
  rw [node0130_0371, split_left 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0130_0258, split_right 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0194_0258, split_left 226 block1594 block1595 (by omega)]
  exact block1594_get i

theorem block1595_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values1595[i.val]'(by rw [values1595_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (226 + i.val) = _
  rw [node0130_0371, split_left 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0130_0258, split_right 194 node0130_0194 node0194_0258 (by omega)]
  rw [node0194_0258, split_right 226 block1594 block1595 (by omega)]
  exact block1595_get i

theorem block1596_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values1596[i.val]'(by rw [values1596_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (258 + i.val) = _
  rw [node0130_0371, split_right 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0258_0371, split_left 322 node0258_0322 node0322_0371 (by omega)]
  rw [node0258_0322, split_left 290 block1596 block1597 (by omega)]
  exact block1596_get i

theorem block1597_lookup (i : Fin 32) :
    lookup (290 + i.val) = some (values1597[i.val]'(by rw [values1597_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (290 + i.val) = _
  rw [node0130_0371, split_right 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0258_0371, split_left 322 node0258_0322 node0322_0371 (by omega)]
  rw [node0258_0322, split_right 290 block1596 block1597 (by omega)]
  exact block1597_get i

theorem block1598_lookup (i : Fin 32) :
    lookup (322 + i.val) = some (values1598[i.val]'(by rw [values1598_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (322 + i.val) = _
  rw [node0130_0371, split_right 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0258_0371, split_right 322 node0258_0322 node0322_0371 (by omega)]
  rw [node0322_0371, split_left 354 block1598 block1599 (by omega)]
  exact block1598_get i

theorem block1599_lookup (i : Fin 17) :
    lookup (354 + i.val) = some (values1599[i.val]'(by rw [values1599_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0130_0371 (354 + i.val) = _
  rw [node0130_0371, split_right 258 node0130_0258 node0258_0371 (by omega)]
  rw [node0258_0371, split_right 322 node0258_0322 node0322_0371 (by omega)]
  rw [node0322_0371, split_right 354 block1598 block1599 (by omega)]
  exact block1599_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1592_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1592_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1593_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1593_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1594_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1594_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1595_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1595_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1596_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1596_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1597_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1597_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1598_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1598_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1599_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1599_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1592_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1593_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1594_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1595_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1596_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1597_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1598_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow131.block1599_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow131
