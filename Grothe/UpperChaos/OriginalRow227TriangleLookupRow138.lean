import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1648
import Grothe.UpperChaos.OriginalRow227TriangleData1649
import Grothe.UpperChaos.OriginalRow227TriangleData1650
import Grothe.UpperChaos.OriginalRow227TriangleData1651
import Grothe.UpperChaos.OriginalRow227TriangleData1652
import Grothe.UpperChaos.OriginalRow227TriangleData1653
import Grothe.UpperChaos.OriginalRow227TriangleData1654
import Grothe.UpperChaos.OriginalRow227TriangleData1655

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow138

open ConditionalTableLookup

def values1648 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1648.coefficient138_137,
  OriginalRow227TriangleData1648.coefficient138_138,
  OriginalRow227TriangleData1648.coefficient138_139,
  OriginalRow227TriangleData1648.coefficient138_140,
  OriginalRow227TriangleData1648.coefficient138_141,
  OriginalRow227TriangleData1648.coefficient138_142,
  OriginalRow227TriangleData1648.coefficient138_143,
  OriginalRow227TriangleData1648.coefficient138_144,
  OriginalRow227TriangleData1648.coefficient138_145,
  OriginalRow227TriangleData1648.coefficient138_146,
  OriginalRow227TriangleData1648.coefficient138_147,
  OriginalRow227TriangleData1648.coefficient138_148,
  OriginalRow227TriangleData1648.coefficient138_149,
  OriginalRow227TriangleData1648.coefficient138_150,
  OriginalRow227TriangleData1648.coefficient138_151,
  OriginalRow227TriangleData1648.coefficient138_152,
  OriginalRow227TriangleData1648.coefficient138_153,
  OriginalRow227TriangleData1648.coefficient138_154,
  OriginalRow227TriangleData1648.coefficient138_155,
  OriginalRow227TriangleData1648.coefficient138_156,
  OriginalRow227TriangleData1648.coefficient138_157,
  OriginalRow227TriangleData1648.coefficient138_158,
  OriginalRow227TriangleData1648.coefficient138_159,
  OriginalRow227TriangleData1648.coefficient138_160,
  OriginalRow227TriangleData1648.coefficient138_161,
  OriginalRow227TriangleData1648.coefficient138_162,
  OriginalRow227TriangleData1648.coefficient138_163,
  OriginalRow227TriangleData1648.coefficient138_164,
  OriginalRow227TriangleData1648.coefficient138_165,
  OriginalRow227TriangleData1648.coefficient138_166,
  OriginalRow227TriangleData1648.coefficient138_167,
  OriginalRow227TriangleData1648.coefficient138_168
]

theorem values1648_size : values1648.size = 32 := rfl

def block1648 : ℕ → Option IntervalDyadic := segment 137 values1648

theorem block1648_domain : ExactDomain block1648 137 169 := by
  simpa only [values1648_size] using segment_domain 137 values1648

theorem block1648_get (i : Fin 32) :
    block1648 (137 + i.val) = some (values1648[i.val]'(by rw [values1648_size]; exact i.isLt)) := by
  exact segment_get 137 values1648 ⟨i.val, by rw [values1648_size]; exact i.isLt⟩

def values1649 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1649.coefficient138_169,
  OriginalRow227TriangleData1649.coefficient138_170,
  OriginalRow227TriangleData1649.coefficient138_171,
  OriginalRow227TriangleData1649.coefficient138_172,
  OriginalRow227TriangleData1649.coefficient138_173,
  OriginalRow227TriangleData1649.coefficient138_174,
  OriginalRow227TriangleData1649.coefficient138_175,
  OriginalRow227TriangleData1649.coefficient138_176,
  OriginalRow227TriangleData1649.coefficient138_177,
  OriginalRow227TriangleData1649.coefficient138_178,
  OriginalRow227TriangleData1649.coefficient138_179,
  OriginalRow227TriangleData1649.coefficient138_180,
  OriginalRow227TriangleData1649.coefficient138_181,
  OriginalRow227TriangleData1649.coefficient138_182,
  OriginalRow227TriangleData1649.coefficient138_183,
  OriginalRow227TriangleData1649.coefficient138_184,
  OriginalRow227TriangleData1649.coefficient138_185,
  OriginalRow227TriangleData1649.coefficient138_186,
  OriginalRow227TriangleData1649.coefficient138_187,
  OriginalRow227TriangleData1649.coefficient138_188,
  OriginalRow227TriangleData1649.coefficient138_189,
  OriginalRow227TriangleData1649.coefficient138_190,
  OriginalRow227TriangleData1649.coefficient138_191,
  OriginalRow227TriangleData1649.coefficient138_192,
  OriginalRow227TriangleData1649.coefficient138_193,
  OriginalRow227TriangleData1649.coefficient138_194,
  OriginalRow227TriangleData1649.coefficient138_195,
  OriginalRow227TriangleData1649.coefficient138_196,
  OriginalRow227TriangleData1649.coefficient138_197,
  OriginalRow227TriangleData1649.coefficient138_198,
  OriginalRow227TriangleData1649.coefficient138_199,
  OriginalRow227TriangleData1649.coefficient138_200
]

theorem values1649_size : values1649.size = 32 := rfl

def block1649 : ℕ → Option IntervalDyadic := segment 169 values1649

theorem block1649_domain : ExactDomain block1649 169 201 := by
  simpa only [values1649_size] using segment_domain 169 values1649

theorem block1649_get (i : Fin 32) :
    block1649 (169 + i.val) = some (values1649[i.val]'(by rw [values1649_size]; exact i.isLt)) := by
  exact segment_get 169 values1649 ⟨i.val, by rw [values1649_size]; exact i.isLt⟩

def values1650 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1650.coefficient138_201,
  OriginalRow227TriangleData1650.coefficient138_202,
  OriginalRow227TriangleData1650.coefficient138_203,
  OriginalRow227TriangleData1650.coefficient138_204,
  OriginalRow227TriangleData1650.coefficient138_205,
  OriginalRow227TriangleData1650.coefficient138_206,
  OriginalRow227TriangleData1650.coefficient138_207,
  OriginalRow227TriangleData1650.coefficient138_208,
  OriginalRow227TriangleData1650.coefficient138_209,
  OriginalRow227TriangleData1650.coefficient138_210,
  OriginalRow227TriangleData1650.coefficient138_211,
  OriginalRow227TriangleData1650.coefficient138_212,
  OriginalRow227TriangleData1650.coefficient138_213,
  OriginalRow227TriangleData1650.coefficient138_214,
  OriginalRow227TriangleData1650.coefficient138_215,
  OriginalRow227TriangleData1650.coefficient138_216,
  OriginalRow227TriangleData1650.coefficient138_217,
  OriginalRow227TriangleData1650.coefficient138_218,
  OriginalRow227TriangleData1650.coefficient138_219,
  OriginalRow227TriangleData1650.coefficient138_220,
  OriginalRow227TriangleData1650.coefficient138_221,
  OriginalRow227TriangleData1650.coefficient138_222,
  OriginalRow227TriangleData1650.coefficient138_223,
  OriginalRow227TriangleData1650.coefficient138_224,
  OriginalRow227TriangleData1650.coefficient138_225,
  OriginalRow227TriangleData1650.coefficient138_226,
  OriginalRow227TriangleData1650.coefficient138_227,
  OriginalRow227TriangleData1650.coefficient138_228,
  OriginalRow227TriangleData1650.coefficient138_229,
  OriginalRow227TriangleData1650.coefficient138_230,
  OriginalRow227TriangleData1650.coefficient138_231,
  OriginalRow227TriangleData1650.coefficient138_232
]

theorem values1650_size : values1650.size = 32 := rfl

def block1650 : ℕ → Option IntervalDyadic := segment 201 values1650

theorem block1650_domain : ExactDomain block1650 201 233 := by
  simpa only [values1650_size] using segment_domain 201 values1650

theorem block1650_get (i : Fin 32) :
    block1650 (201 + i.val) = some (values1650[i.val]'(by rw [values1650_size]; exact i.isLt)) := by
  exact segment_get 201 values1650 ⟨i.val, by rw [values1650_size]; exact i.isLt⟩

def values1651 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1651.coefficient138_233,
  OriginalRow227TriangleData1651.coefficient138_234,
  OriginalRow227TriangleData1651.coefficient138_235,
  OriginalRow227TriangleData1651.coefficient138_236,
  OriginalRow227TriangleData1651.coefficient138_237,
  OriginalRow227TriangleData1651.coefficient138_238,
  OriginalRow227TriangleData1651.coefficient138_239,
  OriginalRow227TriangleData1651.coefficient138_240,
  OriginalRow227TriangleData1651.coefficient138_241,
  OriginalRow227TriangleData1651.coefficient138_242,
  OriginalRow227TriangleData1651.coefficient138_243,
  OriginalRow227TriangleData1651.coefficient138_244,
  OriginalRow227TriangleData1651.coefficient138_245,
  OriginalRow227TriangleData1651.coefficient138_246,
  OriginalRow227TriangleData1651.coefficient138_247,
  OriginalRow227TriangleData1651.coefficient138_248,
  OriginalRow227TriangleData1651.coefficient138_249,
  OriginalRow227TriangleData1651.coefficient138_250,
  OriginalRow227TriangleData1651.coefficient138_251,
  OriginalRow227TriangleData1651.coefficient138_252,
  OriginalRow227TriangleData1651.coefficient138_253,
  OriginalRow227TriangleData1651.coefficient138_254,
  OriginalRow227TriangleData1651.coefficient138_255,
  OriginalRow227TriangleData1651.coefficient138_256,
  OriginalRow227TriangleData1651.coefficient138_257,
  OriginalRow227TriangleData1651.coefficient138_258,
  OriginalRow227TriangleData1651.coefficient138_259,
  OriginalRow227TriangleData1651.coefficient138_260,
  OriginalRow227TriangleData1651.coefficient138_261,
  OriginalRow227TriangleData1651.coefficient138_262,
  OriginalRow227TriangleData1651.coefficient138_263,
  OriginalRow227TriangleData1651.coefficient138_264
]

theorem values1651_size : values1651.size = 32 := rfl

def block1651 : ℕ → Option IntervalDyadic := segment 233 values1651

theorem block1651_domain : ExactDomain block1651 233 265 := by
  simpa only [values1651_size] using segment_domain 233 values1651

theorem block1651_get (i : Fin 32) :
    block1651 (233 + i.val) = some (values1651[i.val]'(by rw [values1651_size]; exact i.isLt)) := by
  exact segment_get 233 values1651 ⟨i.val, by rw [values1651_size]; exact i.isLt⟩

def values1652 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1652.coefficient138_265,
  OriginalRow227TriangleData1652.coefficient138_266,
  OriginalRow227TriangleData1652.coefficient138_267,
  OriginalRow227TriangleData1652.coefficient138_268,
  OriginalRow227TriangleData1652.coefficient138_269,
  OriginalRow227TriangleData1652.coefficient138_270,
  OriginalRow227TriangleData1652.coefficient138_271,
  OriginalRow227TriangleData1652.coefficient138_272,
  OriginalRow227TriangleData1652.coefficient138_273,
  OriginalRow227TriangleData1652.coefficient138_274,
  OriginalRow227TriangleData1652.coefficient138_275,
  OriginalRow227TriangleData1652.coefficient138_276,
  OriginalRow227TriangleData1652.coefficient138_277,
  OriginalRow227TriangleData1652.coefficient138_278,
  OriginalRow227TriangleData1652.coefficient138_279,
  OriginalRow227TriangleData1652.coefficient138_280,
  OriginalRow227TriangleData1652.coefficient138_281,
  OriginalRow227TriangleData1652.coefficient138_282,
  OriginalRow227TriangleData1652.coefficient138_283,
  OriginalRow227TriangleData1652.coefficient138_284,
  OriginalRow227TriangleData1652.coefficient138_285,
  OriginalRow227TriangleData1652.coefficient138_286,
  OriginalRow227TriangleData1652.coefficient138_287,
  OriginalRow227TriangleData1652.coefficient138_288,
  OriginalRow227TriangleData1652.coefficient138_289,
  OriginalRow227TriangleData1652.coefficient138_290,
  OriginalRow227TriangleData1652.coefficient138_291,
  OriginalRow227TriangleData1652.coefficient138_292,
  OriginalRow227TriangleData1652.coefficient138_293,
  OriginalRow227TriangleData1652.coefficient138_294,
  OriginalRow227TriangleData1652.coefficient138_295,
  OriginalRow227TriangleData1652.coefficient138_296
]

theorem values1652_size : values1652.size = 32 := rfl

def block1652 : ℕ → Option IntervalDyadic := segment 265 values1652

theorem block1652_domain : ExactDomain block1652 265 297 := by
  simpa only [values1652_size] using segment_domain 265 values1652

theorem block1652_get (i : Fin 32) :
    block1652 (265 + i.val) = some (values1652[i.val]'(by rw [values1652_size]; exact i.isLt)) := by
  exact segment_get 265 values1652 ⟨i.val, by rw [values1652_size]; exact i.isLt⟩

def values1653 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1653.coefficient138_297,
  OriginalRow227TriangleData1653.coefficient138_298,
  OriginalRow227TriangleData1653.coefficient138_299,
  OriginalRow227TriangleData1653.coefficient138_300,
  OriginalRow227TriangleData1653.coefficient138_301,
  OriginalRow227TriangleData1653.coefficient138_302,
  OriginalRow227TriangleData1653.coefficient138_303,
  OriginalRow227TriangleData1653.coefficient138_304,
  OriginalRow227TriangleData1653.coefficient138_305,
  OriginalRow227TriangleData1653.coefficient138_306,
  OriginalRow227TriangleData1653.coefficient138_307,
  OriginalRow227TriangleData1653.coefficient138_308,
  OriginalRow227TriangleData1653.coefficient138_309,
  OriginalRow227TriangleData1653.coefficient138_310,
  OriginalRow227TriangleData1653.coefficient138_311,
  OriginalRow227TriangleData1653.coefficient138_312,
  OriginalRow227TriangleData1653.coefficient138_313,
  OriginalRow227TriangleData1653.coefficient138_314,
  OriginalRow227TriangleData1653.coefficient138_315,
  OriginalRow227TriangleData1653.coefficient138_316,
  OriginalRow227TriangleData1653.coefficient138_317,
  OriginalRow227TriangleData1653.coefficient138_318,
  OriginalRow227TriangleData1653.coefficient138_319,
  OriginalRow227TriangleData1653.coefficient138_320,
  OriginalRow227TriangleData1653.coefficient138_321,
  OriginalRow227TriangleData1653.coefficient138_322,
  OriginalRow227TriangleData1653.coefficient138_323,
  OriginalRow227TriangleData1653.coefficient138_324,
  OriginalRow227TriangleData1653.coefficient138_325,
  OriginalRow227TriangleData1653.coefficient138_326,
  OriginalRow227TriangleData1653.coefficient138_327,
  OriginalRow227TriangleData1653.coefficient138_328
]

theorem values1653_size : values1653.size = 32 := rfl

def block1653 : ℕ → Option IntervalDyadic := segment 297 values1653

theorem block1653_domain : ExactDomain block1653 297 329 := by
  simpa only [values1653_size] using segment_domain 297 values1653

theorem block1653_get (i : Fin 32) :
    block1653 (297 + i.val) = some (values1653[i.val]'(by rw [values1653_size]; exact i.isLt)) := by
  exact segment_get 297 values1653 ⟨i.val, by rw [values1653_size]; exact i.isLt⟩

def values1654 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1654.coefficient138_329,
  OriginalRow227TriangleData1654.coefficient138_330,
  OriginalRow227TriangleData1654.coefficient138_331,
  OriginalRow227TriangleData1654.coefficient138_332,
  OriginalRow227TriangleData1654.coefficient138_333,
  OriginalRow227TriangleData1654.coefficient138_334,
  OriginalRow227TriangleData1654.coefficient138_335,
  OriginalRow227TriangleData1654.coefficient138_336,
  OriginalRow227TriangleData1654.coefficient138_337,
  OriginalRow227TriangleData1654.coefficient138_338,
  OriginalRow227TriangleData1654.coefficient138_339,
  OriginalRow227TriangleData1654.coefficient138_340,
  OriginalRow227TriangleData1654.coefficient138_341,
  OriginalRow227TriangleData1654.coefficient138_342,
  OriginalRow227TriangleData1654.coefficient138_343,
  OriginalRow227TriangleData1654.coefficient138_344,
  OriginalRow227TriangleData1654.coefficient138_345,
  OriginalRow227TriangleData1654.coefficient138_346,
  OriginalRow227TriangleData1654.coefficient138_347,
  OriginalRow227TriangleData1654.coefficient138_348,
  OriginalRow227TriangleData1654.coefficient138_349,
  OriginalRow227TriangleData1654.coefficient138_350,
  OriginalRow227TriangleData1654.coefficient138_351,
  OriginalRow227TriangleData1654.coefficient138_352,
  OriginalRow227TriangleData1654.coefficient138_353,
  OriginalRow227TriangleData1654.coefficient138_354,
  OriginalRow227TriangleData1654.coefficient138_355,
  OriginalRow227TriangleData1654.coefficient138_356,
  OriginalRow227TriangleData1654.coefficient138_357,
  OriginalRow227TriangleData1654.coefficient138_358,
  OriginalRow227TriangleData1654.coefficient138_359,
  OriginalRow227TriangleData1654.coefficient138_360
]

theorem values1654_size : values1654.size = 32 := rfl

def block1654 : ℕ → Option IntervalDyadic := segment 329 values1654

theorem block1654_domain : ExactDomain block1654 329 361 := by
  simpa only [values1654_size] using segment_domain 329 values1654

theorem block1654_get (i : Fin 32) :
    block1654 (329 + i.val) = some (values1654[i.val]'(by rw [values1654_size]; exact i.isLt)) := by
  exact segment_get 329 values1654 ⟨i.val, by rw [values1654_size]; exact i.isLt⟩

def values1655 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1655.coefficient138_361,
  OriginalRow227TriangleData1655.coefficient138_362,
  OriginalRow227TriangleData1655.coefficient138_363
]

theorem values1655_size : values1655.size = 3 := rfl

def block1655 : ℕ → Option IntervalDyadic := segment 361 values1655

theorem block1655_domain : ExactDomain block1655 361 364 := by
  simpa only [values1655_size] using segment_domain 361 values1655

theorem block1655_get (i : Fin 3) :
    block1655 (361 + i.val) = some (values1655[i.val]'(by rw [values1655_size]; exact i.isLt)) := by
  exact segment_get 361 values1655 ⟨i.val, by rw [values1655_size]; exact i.isLt⟩

def node0137_0201 : ℕ → Option IntervalDyadic := split 169 block1648 block1649

theorem node0137_0201_domain : ExactDomain node0137_0201 137 201 := by
  exact split_domain (by decide) (by decide) block1648_domain block1649_domain

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block1650 block1651

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block1650_domain block1651_domain

def node0137_0265 : ℕ → Option IntervalDyadic := split 201 node0137_0201 node0201_0265

theorem node0137_0265_domain : ExactDomain node0137_0265 137 265 := by
  exact split_domain (by decide) (by decide) node0137_0201_domain node0201_0265_domain

def node0265_0329 : ℕ → Option IntervalDyadic := split 297 block1652 block1653

theorem node0265_0329_domain : ExactDomain node0265_0329 265 329 := by
  exact split_domain (by decide) (by decide) block1652_domain block1653_domain

def node0329_0364 : ℕ → Option IntervalDyadic := split 361 block1654 block1655

theorem node0329_0364_domain : ExactDomain node0329_0364 329 364 := by
  exact split_domain (by decide) (by decide) block1654_domain block1655_domain

def node0265_0364 : ℕ → Option IntervalDyadic := split 329 node0265_0329 node0329_0364

theorem node0265_0364_domain : ExactDomain node0265_0364 265 364 := by
  exact split_domain (by decide) (by decide) node0265_0329_domain node0329_0364_domain

def node0137_0364 : ℕ → Option IntervalDyadic := split 265 node0137_0265 node0265_0364

theorem node0137_0364_domain : ExactDomain node0137_0364 137 364 := by
  exact split_domain (by decide) (by decide) node0137_0265_domain node0265_0364_domain

def lookup : ℕ → Option IntervalDyadic := node0137_0364

theorem lookup_domain : ExactDomain lookup 137 364 :=
  node0137_0364_domain

theorem block1648_lookup (i : Fin 32) :
    lookup (137 + i.val) = some (values1648[i.val]'(by rw [values1648_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (137 + i.val) = _
  rw [node0137_0364, split_left 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0137_0265, split_left 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0137_0201, split_left 169 block1648 block1649 (by omega)]
  exact block1648_get i

theorem block1649_lookup (i : Fin 32) :
    lookup (169 + i.val) = some (values1649[i.val]'(by rw [values1649_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (169 + i.val) = _
  rw [node0137_0364, split_left 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0137_0265, split_left 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0137_0201, split_right 169 block1648 block1649 (by omega)]
  exact block1649_get i

theorem block1650_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values1650[i.val]'(by rw [values1650_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (201 + i.val) = _
  rw [node0137_0364, split_left 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0137_0265, split_right 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0201_0265, split_left 233 block1650 block1651 (by omega)]
  exact block1650_get i

theorem block1651_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values1651[i.val]'(by rw [values1651_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (233 + i.val) = _
  rw [node0137_0364, split_left 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0137_0265, split_right 201 node0137_0201 node0201_0265 (by omega)]
  rw [node0201_0265, split_right 233 block1650 block1651 (by omega)]
  exact block1651_get i

theorem block1652_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values1652[i.val]'(by rw [values1652_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (265 + i.val) = _
  rw [node0137_0364, split_right 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0265_0364, split_left 329 node0265_0329 node0329_0364 (by omega)]
  rw [node0265_0329, split_left 297 block1652 block1653 (by omega)]
  exact block1652_get i

theorem block1653_lookup (i : Fin 32) :
    lookup (297 + i.val) = some (values1653[i.val]'(by rw [values1653_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (297 + i.val) = _
  rw [node0137_0364, split_right 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0265_0364, split_left 329 node0265_0329 node0329_0364 (by omega)]
  rw [node0265_0329, split_right 297 block1652 block1653 (by omega)]
  exact block1653_get i

theorem block1654_lookup (i : Fin 32) :
    lookup (329 + i.val) = some (values1654[i.val]'(by rw [values1654_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (329 + i.val) = _
  rw [node0137_0364, split_right 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0265_0364, split_right 329 node0265_0329 node0329_0364 (by omega)]
  rw [node0329_0364, split_left 361 block1654 block1655 (by omega)]
  exact block1654_get i

theorem block1655_lookup (i : Fin 3) :
    lookup (361 + i.val) = some (values1655[i.val]'(by rw [values1655_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0137_0364 (361 + i.val) = _
  rw [node0137_0364, split_right 265 node0137_0265 node0265_0364 (by omega)]
  rw [node0265_0364, split_right 329 node0265_0329 node0329_0364 (by omega)]
  rw [node0329_0364, split_right 361 block1654 block1655 (by omega)]
  exact block1655_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1648_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1648_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1649_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1649_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1650_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1650_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1651_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1651_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1652_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1652_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1653_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1653_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1654_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1654_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1655_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1655_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1648_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1649_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1650_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1651_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1652_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1653_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1654_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow138.block1655_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow138
