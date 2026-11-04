import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1616
import Grothe.UpperChaos.OriginalRow227TriangleData1617
import Grothe.UpperChaos.OriginalRow227TriangleData1618
import Grothe.UpperChaos.OriginalRow227TriangleData1619
import Grothe.UpperChaos.OriginalRow227TriangleData1620
import Grothe.UpperChaos.OriginalRow227TriangleData1621
import Grothe.UpperChaos.OriginalRow227TriangleData1622
import Grothe.UpperChaos.OriginalRow227TriangleData1623

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow134

open ConditionalTableLookup

def values1616 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1616.coefficient134_133,
  OriginalRow227TriangleData1616.coefficient134_134,
  OriginalRow227TriangleData1616.coefficient134_135,
  OriginalRow227TriangleData1616.coefficient134_136,
  OriginalRow227TriangleData1616.coefficient134_137,
  OriginalRow227TriangleData1616.coefficient134_138,
  OriginalRow227TriangleData1616.coefficient134_139,
  OriginalRow227TriangleData1616.coefficient134_140,
  OriginalRow227TriangleData1616.coefficient134_141,
  OriginalRow227TriangleData1616.coefficient134_142,
  OriginalRow227TriangleData1616.coefficient134_143,
  OriginalRow227TriangleData1616.coefficient134_144,
  OriginalRow227TriangleData1616.coefficient134_145,
  OriginalRow227TriangleData1616.coefficient134_146,
  OriginalRow227TriangleData1616.coefficient134_147,
  OriginalRow227TriangleData1616.coefficient134_148,
  OriginalRow227TriangleData1616.coefficient134_149,
  OriginalRow227TriangleData1616.coefficient134_150,
  OriginalRow227TriangleData1616.coefficient134_151,
  OriginalRow227TriangleData1616.coefficient134_152,
  OriginalRow227TriangleData1616.coefficient134_153,
  OriginalRow227TriangleData1616.coefficient134_154,
  OriginalRow227TriangleData1616.coefficient134_155,
  OriginalRow227TriangleData1616.coefficient134_156,
  OriginalRow227TriangleData1616.coefficient134_157,
  OriginalRow227TriangleData1616.coefficient134_158,
  OriginalRow227TriangleData1616.coefficient134_159,
  OriginalRow227TriangleData1616.coefficient134_160,
  OriginalRow227TriangleData1616.coefficient134_161,
  OriginalRow227TriangleData1616.coefficient134_162,
  OriginalRow227TriangleData1616.coefficient134_163,
  OriginalRow227TriangleData1616.coefficient134_164
]

theorem values1616_size : values1616.size = 32 := rfl

def block1616 : ℕ → Option IntervalDyadic := segment 133 values1616

theorem block1616_domain : ExactDomain block1616 133 165 := by
  simpa only [values1616_size] using segment_domain 133 values1616

theorem block1616_get (i : Fin 32) :
    block1616 (133 + i.val) = some (values1616[i.val]'(by rw [values1616_size]; exact i.isLt)) := by
  exact segment_get 133 values1616 ⟨i.val, by rw [values1616_size]; exact i.isLt⟩

def values1617 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1617.coefficient134_165,
  OriginalRow227TriangleData1617.coefficient134_166,
  OriginalRow227TriangleData1617.coefficient134_167,
  OriginalRow227TriangleData1617.coefficient134_168,
  OriginalRow227TriangleData1617.coefficient134_169,
  OriginalRow227TriangleData1617.coefficient134_170,
  OriginalRow227TriangleData1617.coefficient134_171,
  OriginalRow227TriangleData1617.coefficient134_172,
  OriginalRow227TriangleData1617.coefficient134_173,
  OriginalRow227TriangleData1617.coefficient134_174,
  OriginalRow227TriangleData1617.coefficient134_175,
  OriginalRow227TriangleData1617.coefficient134_176,
  OriginalRow227TriangleData1617.coefficient134_177,
  OriginalRow227TriangleData1617.coefficient134_178,
  OriginalRow227TriangleData1617.coefficient134_179,
  OriginalRow227TriangleData1617.coefficient134_180,
  OriginalRow227TriangleData1617.coefficient134_181,
  OriginalRow227TriangleData1617.coefficient134_182,
  OriginalRow227TriangleData1617.coefficient134_183,
  OriginalRow227TriangleData1617.coefficient134_184,
  OriginalRow227TriangleData1617.coefficient134_185,
  OriginalRow227TriangleData1617.coefficient134_186,
  OriginalRow227TriangleData1617.coefficient134_187,
  OriginalRow227TriangleData1617.coefficient134_188,
  OriginalRow227TriangleData1617.coefficient134_189,
  OriginalRow227TriangleData1617.coefficient134_190,
  OriginalRow227TriangleData1617.coefficient134_191,
  OriginalRow227TriangleData1617.coefficient134_192,
  OriginalRow227TriangleData1617.coefficient134_193,
  OriginalRow227TriangleData1617.coefficient134_194,
  OriginalRow227TriangleData1617.coefficient134_195,
  OriginalRow227TriangleData1617.coefficient134_196
]

theorem values1617_size : values1617.size = 32 := rfl

def block1617 : ℕ → Option IntervalDyadic := segment 165 values1617

theorem block1617_domain : ExactDomain block1617 165 197 := by
  simpa only [values1617_size] using segment_domain 165 values1617

theorem block1617_get (i : Fin 32) :
    block1617 (165 + i.val) = some (values1617[i.val]'(by rw [values1617_size]; exact i.isLt)) := by
  exact segment_get 165 values1617 ⟨i.val, by rw [values1617_size]; exact i.isLt⟩

def values1618 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1618.coefficient134_197,
  OriginalRow227TriangleData1618.coefficient134_198,
  OriginalRow227TriangleData1618.coefficient134_199,
  OriginalRow227TriangleData1618.coefficient134_200,
  OriginalRow227TriangleData1618.coefficient134_201,
  OriginalRow227TriangleData1618.coefficient134_202,
  OriginalRow227TriangleData1618.coefficient134_203,
  OriginalRow227TriangleData1618.coefficient134_204,
  OriginalRow227TriangleData1618.coefficient134_205,
  OriginalRow227TriangleData1618.coefficient134_206,
  OriginalRow227TriangleData1618.coefficient134_207,
  OriginalRow227TriangleData1618.coefficient134_208,
  OriginalRow227TriangleData1618.coefficient134_209,
  OriginalRow227TriangleData1618.coefficient134_210,
  OriginalRow227TriangleData1618.coefficient134_211,
  OriginalRow227TriangleData1618.coefficient134_212,
  OriginalRow227TriangleData1618.coefficient134_213,
  OriginalRow227TriangleData1618.coefficient134_214,
  OriginalRow227TriangleData1618.coefficient134_215,
  OriginalRow227TriangleData1618.coefficient134_216,
  OriginalRow227TriangleData1618.coefficient134_217,
  OriginalRow227TriangleData1618.coefficient134_218,
  OriginalRow227TriangleData1618.coefficient134_219,
  OriginalRow227TriangleData1618.coefficient134_220,
  OriginalRow227TriangleData1618.coefficient134_221,
  OriginalRow227TriangleData1618.coefficient134_222,
  OriginalRow227TriangleData1618.coefficient134_223,
  OriginalRow227TriangleData1618.coefficient134_224,
  OriginalRow227TriangleData1618.coefficient134_225,
  OriginalRow227TriangleData1618.coefficient134_226,
  OriginalRow227TriangleData1618.coefficient134_227,
  OriginalRow227TriangleData1618.coefficient134_228
]

theorem values1618_size : values1618.size = 32 := rfl

def block1618 : ℕ → Option IntervalDyadic := segment 197 values1618

theorem block1618_domain : ExactDomain block1618 197 229 := by
  simpa only [values1618_size] using segment_domain 197 values1618

theorem block1618_get (i : Fin 32) :
    block1618 (197 + i.val) = some (values1618[i.val]'(by rw [values1618_size]; exact i.isLt)) := by
  exact segment_get 197 values1618 ⟨i.val, by rw [values1618_size]; exact i.isLt⟩

def values1619 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1619.coefficient134_229,
  OriginalRow227TriangleData1619.coefficient134_230,
  OriginalRow227TriangleData1619.coefficient134_231,
  OriginalRow227TriangleData1619.coefficient134_232,
  OriginalRow227TriangleData1619.coefficient134_233,
  OriginalRow227TriangleData1619.coefficient134_234,
  OriginalRow227TriangleData1619.coefficient134_235,
  OriginalRow227TriangleData1619.coefficient134_236,
  OriginalRow227TriangleData1619.coefficient134_237,
  OriginalRow227TriangleData1619.coefficient134_238,
  OriginalRow227TriangleData1619.coefficient134_239,
  OriginalRow227TriangleData1619.coefficient134_240,
  OriginalRow227TriangleData1619.coefficient134_241,
  OriginalRow227TriangleData1619.coefficient134_242,
  OriginalRow227TriangleData1619.coefficient134_243,
  OriginalRow227TriangleData1619.coefficient134_244,
  OriginalRow227TriangleData1619.coefficient134_245,
  OriginalRow227TriangleData1619.coefficient134_246,
  OriginalRow227TriangleData1619.coefficient134_247,
  OriginalRow227TriangleData1619.coefficient134_248,
  OriginalRow227TriangleData1619.coefficient134_249,
  OriginalRow227TriangleData1619.coefficient134_250,
  OriginalRow227TriangleData1619.coefficient134_251,
  OriginalRow227TriangleData1619.coefficient134_252,
  OriginalRow227TriangleData1619.coefficient134_253,
  OriginalRow227TriangleData1619.coefficient134_254,
  OriginalRow227TriangleData1619.coefficient134_255,
  OriginalRow227TriangleData1619.coefficient134_256,
  OriginalRow227TriangleData1619.coefficient134_257,
  OriginalRow227TriangleData1619.coefficient134_258,
  OriginalRow227TriangleData1619.coefficient134_259,
  OriginalRow227TriangleData1619.coefficient134_260
]

theorem values1619_size : values1619.size = 32 := rfl

def block1619 : ℕ → Option IntervalDyadic := segment 229 values1619

theorem block1619_domain : ExactDomain block1619 229 261 := by
  simpa only [values1619_size] using segment_domain 229 values1619

theorem block1619_get (i : Fin 32) :
    block1619 (229 + i.val) = some (values1619[i.val]'(by rw [values1619_size]; exact i.isLt)) := by
  exact segment_get 229 values1619 ⟨i.val, by rw [values1619_size]; exact i.isLt⟩

def values1620 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1620.coefficient134_261,
  OriginalRow227TriangleData1620.coefficient134_262,
  OriginalRow227TriangleData1620.coefficient134_263,
  OriginalRow227TriangleData1620.coefficient134_264,
  OriginalRow227TriangleData1620.coefficient134_265,
  OriginalRow227TriangleData1620.coefficient134_266,
  OriginalRow227TriangleData1620.coefficient134_267,
  OriginalRow227TriangleData1620.coefficient134_268,
  OriginalRow227TriangleData1620.coefficient134_269,
  OriginalRow227TriangleData1620.coefficient134_270,
  OriginalRow227TriangleData1620.coefficient134_271,
  OriginalRow227TriangleData1620.coefficient134_272,
  OriginalRow227TriangleData1620.coefficient134_273,
  OriginalRow227TriangleData1620.coefficient134_274,
  OriginalRow227TriangleData1620.coefficient134_275,
  OriginalRow227TriangleData1620.coefficient134_276,
  OriginalRow227TriangleData1620.coefficient134_277,
  OriginalRow227TriangleData1620.coefficient134_278,
  OriginalRow227TriangleData1620.coefficient134_279,
  OriginalRow227TriangleData1620.coefficient134_280,
  OriginalRow227TriangleData1620.coefficient134_281,
  OriginalRow227TriangleData1620.coefficient134_282,
  OriginalRow227TriangleData1620.coefficient134_283,
  OriginalRow227TriangleData1620.coefficient134_284,
  OriginalRow227TriangleData1620.coefficient134_285,
  OriginalRow227TriangleData1620.coefficient134_286,
  OriginalRow227TriangleData1620.coefficient134_287,
  OriginalRow227TriangleData1620.coefficient134_288,
  OriginalRow227TriangleData1620.coefficient134_289,
  OriginalRow227TriangleData1620.coefficient134_290,
  OriginalRow227TriangleData1620.coefficient134_291,
  OriginalRow227TriangleData1620.coefficient134_292
]

theorem values1620_size : values1620.size = 32 := rfl

def block1620 : ℕ → Option IntervalDyadic := segment 261 values1620

theorem block1620_domain : ExactDomain block1620 261 293 := by
  simpa only [values1620_size] using segment_domain 261 values1620

theorem block1620_get (i : Fin 32) :
    block1620 (261 + i.val) = some (values1620[i.val]'(by rw [values1620_size]; exact i.isLt)) := by
  exact segment_get 261 values1620 ⟨i.val, by rw [values1620_size]; exact i.isLt⟩

def values1621 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1621.coefficient134_293,
  OriginalRow227TriangleData1621.coefficient134_294,
  OriginalRow227TriangleData1621.coefficient134_295,
  OriginalRow227TriangleData1621.coefficient134_296,
  OriginalRow227TriangleData1621.coefficient134_297,
  OriginalRow227TriangleData1621.coefficient134_298,
  OriginalRow227TriangleData1621.coefficient134_299,
  OriginalRow227TriangleData1621.coefficient134_300,
  OriginalRow227TriangleData1621.coefficient134_301,
  OriginalRow227TriangleData1621.coefficient134_302,
  OriginalRow227TriangleData1621.coefficient134_303,
  OriginalRow227TriangleData1621.coefficient134_304,
  OriginalRow227TriangleData1621.coefficient134_305,
  OriginalRow227TriangleData1621.coefficient134_306,
  OriginalRow227TriangleData1621.coefficient134_307,
  OriginalRow227TriangleData1621.coefficient134_308,
  OriginalRow227TriangleData1621.coefficient134_309,
  OriginalRow227TriangleData1621.coefficient134_310,
  OriginalRow227TriangleData1621.coefficient134_311,
  OriginalRow227TriangleData1621.coefficient134_312,
  OriginalRow227TriangleData1621.coefficient134_313,
  OriginalRow227TriangleData1621.coefficient134_314,
  OriginalRow227TriangleData1621.coefficient134_315,
  OriginalRow227TriangleData1621.coefficient134_316,
  OriginalRow227TriangleData1621.coefficient134_317,
  OriginalRow227TriangleData1621.coefficient134_318,
  OriginalRow227TriangleData1621.coefficient134_319,
  OriginalRow227TriangleData1621.coefficient134_320,
  OriginalRow227TriangleData1621.coefficient134_321,
  OriginalRow227TriangleData1621.coefficient134_322,
  OriginalRow227TriangleData1621.coefficient134_323,
  OriginalRow227TriangleData1621.coefficient134_324
]

theorem values1621_size : values1621.size = 32 := rfl

def block1621 : ℕ → Option IntervalDyadic := segment 293 values1621

theorem block1621_domain : ExactDomain block1621 293 325 := by
  simpa only [values1621_size] using segment_domain 293 values1621

theorem block1621_get (i : Fin 32) :
    block1621 (293 + i.val) = some (values1621[i.val]'(by rw [values1621_size]; exact i.isLt)) := by
  exact segment_get 293 values1621 ⟨i.val, by rw [values1621_size]; exact i.isLt⟩

def values1622 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1622.coefficient134_325,
  OriginalRow227TriangleData1622.coefficient134_326,
  OriginalRow227TriangleData1622.coefficient134_327,
  OriginalRow227TriangleData1622.coefficient134_328,
  OriginalRow227TriangleData1622.coefficient134_329,
  OriginalRow227TriangleData1622.coefficient134_330,
  OriginalRow227TriangleData1622.coefficient134_331,
  OriginalRow227TriangleData1622.coefficient134_332,
  OriginalRow227TriangleData1622.coefficient134_333,
  OriginalRow227TriangleData1622.coefficient134_334,
  OriginalRow227TriangleData1622.coefficient134_335,
  OriginalRow227TriangleData1622.coefficient134_336,
  OriginalRow227TriangleData1622.coefficient134_337,
  OriginalRow227TriangleData1622.coefficient134_338,
  OriginalRow227TriangleData1622.coefficient134_339,
  OriginalRow227TriangleData1622.coefficient134_340,
  OriginalRow227TriangleData1622.coefficient134_341,
  OriginalRow227TriangleData1622.coefficient134_342,
  OriginalRow227TriangleData1622.coefficient134_343,
  OriginalRow227TriangleData1622.coefficient134_344,
  OriginalRow227TriangleData1622.coefficient134_345,
  OriginalRow227TriangleData1622.coefficient134_346,
  OriginalRow227TriangleData1622.coefficient134_347,
  OriginalRow227TriangleData1622.coefficient134_348,
  OriginalRow227TriangleData1622.coefficient134_349,
  OriginalRow227TriangleData1622.coefficient134_350,
  OriginalRow227TriangleData1622.coefficient134_351,
  OriginalRow227TriangleData1622.coefficient134_352,
  OriginalRow227TriangleData1622.coefficient134_353,
  OriginalRow227TriangleData1622.coefficient134_354,
  OriginalRow227TriangleData1622.coefficient134_355,
  OriginalRow227TriangleData1622.coefficient134_356
]

theorem values1622_size : values1622.size = 32 := rfl

def block1622 : ℕ → Option IntervalDyadic := segment 325 values1622

theorem block1622_domain : ExactDomain block1622 325 357 := by
  simpa only [values1622_size] using segment_domain 325 values1622

theorem block1622_get (i : Fin 32) :
    block1622 (325 + i.val) = some (values1622[i.val]'(by rw [values1622_size]; exact i.isLt)) := by
  exact segment_get 325 values1622 ⟨i.val, by rw [values1622_size]; exact i.isLt⟩

def values1623 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1623.coefficient134_357,
  OriginalRow227TriangleData1623.coefficient134_358,
  OriginalRow227TriangleData1623.coefficient134_359,
  OriginalRow227TriangleData1623.coefficient134_360,
  OriginalRow227TriangleData1623.coefficient134_361,
  OriginalRow227TriangleData1623.coefficient134_362,
  OriginalRow227TriangleData1623.coefficient134_363,
  OriginalRow227TriangleData1623.coefficient134_364,
  OriginalRow227TriangleData1623.coefficient134_365,
  OriginalRow227TriangleData1623.coefficient134_366,
  OriginalRow227TriangleData1623.coefficient134_367
]

theorem values1623_size : values1623.size = 11 := rfl

def block1623 : ℕ → Option IntervalDyadic := segment 357 values1623

theorem block1623_domain : ExactDomain block1623 357 368 := by
  simpa only [values1623_size] using segment_domain 357 values1623

theorem block1623_get (i : Fin 11) :
    block1623 (357 + i.val) = some (values1623[i.val]'(by rw [values1623_size]; exact i.isLt)) := by
  exact segment_get 357 values1623 ⟨i.val, by rw [values1623_size]; exact i.isLt⟩

def node0133_0197 : ℕ → Option IntervalDyadic := split 165 block1616 block1617

theorem node0133_0197_domain : ExactDomain node0133_0197 133 197 := by
  exact split_domain (by decide) (by decide) block1616_domain block1617_domain

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block1618 block1619

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block1618_domain block1619_domain

def node0133_0261 : ℕ → Option IntervalDyadic := split 197 node0133_0197 node0197_0261

theorem node0133_0261_domain : ExactDomain node0133_0261 133 261 := by
  exact split_domain (by decide) (by decide) node0133_0197_domain node0197_0261_domain

def node0261_0325 : ℕ → Option IntervalDyadic := split 293 block1620 block1621

theorem node0261_0325_domain : ExactDomain node0261_0325 261 325 := by
  exact split_domain (by decide) (by decide) block1620_domain block1621_domain

def node0325_0368 : ℕ → Option IntervalDyadic := split 357 block1622 block1623

theorem node0325_0368_domain : ExactDomain node0325_0368 325 368 := by
  exact split_domain (by decide) (by decide) block1622_domain block1623_domain

def node0261_0368 : ℕ → Option IntervalDyadic := split 325 node0261_0325 node0325_0368

theorem node0261_0368_domain : ExactDomain node0261_0368 261 368 := by
  exact split_domain (by decide) (by decide) node0261_0325_domain node0325_0368_domain

def node0133_0368 : ℕ → Option IntervalDyadic := split 261 node0133_0261 node0261_0368

theorem node0133_0368_domain : ExactDomain node0133_0368 133 368 := by
  exact split_domain (by decide) (by decide) node0133_0261_domain node0261_0368_domain

def lookup : ℕ → Option IntervalDyadic := node0133_0368

theorem lookup_domain : ExactDomain lookup 133 368 :=
  node0133_0368_domain

theorem block1616_lookup (i : Fin 32) :
    lookup (133 + i.val) = some (values1616[i.val]'(by rw [values1616_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (133 + i.val) = _
  rw [node0133_0368, split_left 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0133_0261, split_left 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0133_0197, split_left 165 block1616 block1617 (by omega)]
  exact block1616_get i

theorem block1617_lookup (i : Fin 32) :
    lookup (165 + i.val) = some (values1617[i.val]'(by rw [values1617_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (165 + i.val) = _
  rw [node0133_0368, split_left 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0133_0261, split_left 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0133_0197, split_right 165 block1616 block1617 (by omega)]
  exact block1617_get i

theorem block1618_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values1618[i.val]'(by rw [values1618_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (197 + i.val) = _
  rw [node0133_0368, split_left 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0133_0261, split_right 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0197_0261, split_left 229 block1618 block1619 (by omega)]
  exact block1618_get i

theorem block1619_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values1619[i.val]'(by rw [values1619_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (229 + i.val) = _
  rw [node0133_0368, split_left 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0133_0261, split_right 197 node0133_0197 node0197_0261 (by omega)]
  rw [node0197_0261, split_right 229 block1618 block1619 (by omega)]
  exact block1619_get i

theorem block1620_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values1620[i.val]'(by rw [values1620_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (261 + i.val) = _
  rw [node0133_0368, split_right 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0261_0368, split_left 325 node0261_0325 node0325_0368 (by omega)]
  rw [node0261_0325, split_left 293 block1620 block1621 (by omega)]
  exact block1620_get i

theorem block1621_lookup (i : Fin 32) :
    lookup (293 + i.val) = some (values1621[i.val]'(by rw [values1621_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (293 + i.val) = _
  rw [node0133_0368, split_right 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0261_0368, split_left 325 node0261_0325 node0325_0368 (by omega)]
  rw [node0261_0325, split_right 293 block1620 block1621 (by omega)]
  exact block1621_get i

theorem block1622_lookup (i : Fin 32) :
    lookup (325 + i.val) = some (values1622[i.val]'(by rw [values1622_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (325 + i.val) = _
  rw [node0133_0368, split_right 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0261_0368, split_right 325 node0261_0325 node0325_0368 (by omega)]
  rw [node0325_0368, split_left 357 block1622 block1623 (by omega)]
  exact block1622_get i

theorem block1623_lookup (i : Fin 11) :
    lookup (357 + i.val) = some (values1623[i.val]'(by rw [values1623_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0133_0368 (357 + i.val) = _
  rw [node0133_0368, split_right 261 node0133_0261 node0261_0368 (by omega)]
  rw [node0261_0368, split_right 325 node0261_0325 node0325_0368 (by omega)]
  rw [node0325_0368, split_right 357 block1622 block1623 (by omega)]
  exact block1623_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1616_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1616_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1617_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1617_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1618_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1618_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1619_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1619_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1620_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1620_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1621_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1621_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1622_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1622_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1623_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1623_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1616_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1617_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1618_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1619_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1620_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1621_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1622_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow134.block1623_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow134
