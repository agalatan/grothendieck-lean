import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1600
import Grothe.UpperChaos.OriginalRow227TriangleData1601
import Grothe.UpperChaos.OriginalRow227TriangleData1602
import Grothe.UpperChaos.OriginalRow227TriangleData1603
import Grothe.UpperChaos.OriginalRow227TriangleData1604
import Grothe.UpperChaos.OriginalRow227TriangleData1605
import Grothe.UpperChaos.OriginalRow227TriangleData1606
import Grothe.UpperChaos.OriginalRow227TriangleData1607

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow132

open ConditionalTableLookup

def values1600 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1600.coefficient132_131,
  OriginalRow227TriangleData1600.coefficient132_132,
  OriginalRow227TriangleData1600.coefficient132_133,
  OriginalRow227TriangleData1600.coefficient132_134,
  OriginalRow227TriangleData1600.coefficient132_135,
  OriginalRow227TriangleData1600.coefficient132_136,
  OriginalRow227TriangleData1600.coefficient132_137,
  OriginalRow227TriangleData1600.coefficient132_138,
  OriginalRow227TriangleData1600.coefficient132_139,
  OriginalRow227TriangleData1600.coefficient132_140,
  OriginalRow227TriangleData1600.coefficient132_141,
  OriginalRow227TriangleData1600.coefficient132_142,
  OriginalRow227TriangleData1600.coefficient132_143,
  OriginalRow227TriangleData1600.coefficient132_144,
  OriginalRow227TriangleData1600.coefficient132_145,
  OriginalRow227TriangleData1600.coefficient132_146,
  OriginalRow227TriangleData1600.coefficient132_147,
  OriginalRow227TriangleData1600.coefficient132_148,
  OriginalRow227TriangleData1600.coefficient132_149,
  OriginalRow227TriangleData1600.coefficient132_150,
  OriginalRow227TriangleData1600.coefficient132_151,
  OriginalRow227TriangleData1600.coefficient132_152,
  OriginalRow227TriangleData1600.coefficient132_153,
  OriginalRow227TriangleData1600.coefficient132_154,
  OriginalRow227TriangleData1600.coefficient132_155,
  OriginalRow227TriangleData1600.coefficient132_156,
  OriginalRow227TriangleData1600.coefficient132_157,
  OriginalRow227TriangleData1600.coefficient132_158,
  OriginalRow227TriangleData1600.coefficient132_159,
  OriginalRow227TriangleData1600.coefficient132_160,
  OriginalRow227TriangleData1600.coefficient132_161,
  OriginalRow227TriangleData1600.coefficient132_162
]

theorem values1600_size : values1600.size = 32 := rfl

def block1600 : ℕ → Option IntervalDyadic := segment 131 values1600

theorem block1600_domain : ExactDomain block1600 131 163 := by
  simpa only [values1600_size] using segment_domain 131 values1600

theorem block1600_get (i : Fin 32) :
    block1600 (131 + i.val) = some (values1600[i.val]'(by rw [values1600_size]; exact i.isLt)) := by
  exact segment_get 131 values1600 ⟨i.val, by rw [values1600_size]; exact i.isLt⟩

def values1601 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1601.coefficient132_163,
  OriginalRow227TriangleData1601.coefficient132_164,
  OriginalRow227TriangleData1601.coefficient132_165,
  OriginalRow227TriangleData1601.coefficient132_166,
  OriginalRow227TriangleData1601.coefficient132_167,
  OriginalRow227TriangleData1601.coefficient132_168,
  OriginalRow227TriangleData1601.coefficient132_169,
  OriginalRow227TriangleData1601.coefficient132_170,
  OriginalRow227TriangleData1601.coefficient132_171,
  OriginalRow227TriangleData1601.coefficient132_172,
  OriginalRow227TriangleData1601.coefficient132_173,
  OriginalRow227TriangleData1601.coefficient132_174,
  OriginalRow227TriangleData1601.coefficient132_175,
  OriginalRow227TriangleData1601.coefficient132_176,
  OriginalRow227TriangleData1601.coefficient132_177,
  OriginalRow227TriangleData1601.coefficient132_178,
  OriginalRow227TriangleData1601.coefficient132_179,
  OriginalRow227TriangleData1601.coefficient132_180,
  OriginalRow227TriangleData1601.coefficient132_181,
  OriginalRow227TriangleData1601.coefficient132_182,
  OriginalRow227TriangleData1601.coefficient132_183,
  OriginalRow227TriangleData1601.coefficient132_184,
  OriginalRow227TriangleData1601.coefficient132_185,
  OriginalRow227TriangleData1601.coefficient132_186,
  OriginalRow227TriangleData1601.coefficient132_187,
  OriginalRow227TriangleData1601.coefficient132_188,
  OriginalRow227TriangleData1601.coefficient132_189,
  OriginalRow227TriangleData1601.coefficient132_190,
  OriginalRow227TriangleData1601.coefficient132_191,
  OriginalRow227TriangleData1601.coefficient132_192,
  OriginalRow227TriangleData1601.coefficient132_193,
  OriginalRow227TriangleData1601.coefficient132_194
]

theorem values1601_size : values1601.size = 32 := rfl

def block1601 : ℕ → Option IntervalDyadic := segment 163 values1601

theorem block1601_domain : ExactDomain block1601 163 195 := by
  simpa only [values1601_size] using segment_domain 163 values1601

theorem block1601_get (i : Fin 32) :
    block1601 (163 + i.val) = some (values1601[i.val]'(by rw [values1601_size]; exact i.isLt)) := by
  exact segment_get 163 values1601 ⟨i.val, by rw [values1601_size]; exact i.isLt⟩

def values1602 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1602.coefficient132_195,
  OriginalRow227TriangleData1602.coefficient132_196,
  OriginalRow227TriangleData1602.coefficient132_197,
  OriginalRow227TriangleData1602.coefficient132_198,
  OriginalRow227TriangleData1602.coefficient132_199,
  OriginalRow227TriangleData1602.coefficient132_200,
  OriginalRow227TriangleData1602.coefficient132_201,
  OriginalRow227TriangleData1602.coefficient132_202,
  OriginalRow227TriangleData1602.coefficient132_203,
  OriginalRow227TriangleData1602.coefficient132_204,
  OriginalRow227TriangleData1602.coefficient132_205,
  OriginalRow227TriangleData1602.coefficient132_206,
  OriginalRow227TriangleData1602.coefficient132_207,
  OriginalRow227TriangleData1602.coefficient132_208,
  OriginalRow227TriangleData1602.coefficient132_209,
  OriginalRow227TriangleData1602.coefficient132_210,
  OriginalRow227TriangleData1602.coefficient132_211,
  OriginalRow227TriangleData1602.coefficient132_212,
  OriginalRow227TriangleData1602.coefficient132_213,
  OriginalRow227TriangleData1602.coefficient132_214,
  OriginalRow227TriangleData1602.coefficient132_215,
  OriginalRow227TriangleData1602.coefficient132_216,
  OriginalRow227TriangleData1602.coefficient132_217,
  OriginalRow227TriangleData1602.coefficient132_218,
  OriginalRow227TriangleData1602.coefficient132_219,
  OriginalRow227TriangleData1602.coefficient132_220,
  OriginalRow227TriangleData1602.coefficient132_221,
  OriginalRow227TriangleData1602.coefficient132_222,
  OriginalRow227TriangleData1602.coefficient132_223,
  OriginalRow227TriangleData1602.coefficient132_224,
  OriginalRow227TriangleData1602.coefficient132_225,
  OriginalRow227TriangleData1602.coefficient132_226
]

theorem values1602_size : values1602.size = 32 := rfl

def block1602 : ℕ → Option IntervalDyadic := segment 195 values1602

theorem block1602_domain : ExactDomain block1602 195 227 := by
  simpa only [values1602_size] using segment_domain 195 values1602

theorem block1602_get (i : Fin 32) :
    block1602 (195 + i.val) = some (values1602[i.val]'(by rw [values1602_size]; exact i.isLt)) := by
  exact segment_get 195 values1602 ⟨i.val, by rw [values1602_size]; exact i.isLt⟩

def values1603 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1603.coefficient132_227,
  OriginalRow227TriangleData1603.coefficient132_228,
  OriginalRow227TriangleData1603.coefficient132_229,
  OriginalRow227TriangleData1603.coefficient132_230,
  OriginalRow227TriangleData1603.coefficient132_231,
  OriginalRow227TriangleData1603.coefficient132_232,
  OriginalRow227TriangleData1603.coefficient132_233,
  OriginalRow227TriangleData1603.coefficient132_234,
  OriginalRow227TriangleData1603.coefficient132_235,
  OriginalRow227TriangleData1603.coefficient132_236,
  OriginalRow227TriangleData1603.coefficient132_237,
  OriginalRow227TriangleData1603.coefficient132_238,
  OriginalRow227TriangleData1603.coefficient132_239,
  OriginalRow227TriangleData1603.coefficient132_240,
  OriginalRow227TriangleData1603.coefficient132_241,
  OriginalRow227TriangleData1603.coefficient132_242,
  OriginalRow227TriangleData1603.coefficient132_243,
  OriginalRow227TriangleData1603.coefficient132_244,
  OriginalRow227TriangleData1603.coefficient132_245,
  OriginalRow227TriangleData1603.coefficient132_246,
  OriginalRow227TriangleData1603.coefficient132_247,
  OriginalRow227TriangleData1603.coefficient132_248,
  OriginalRow227TriangleData1603.coefficient132_249,
  OriginalRow227TriangleData1603.coefficient132_250,
  OriginalRow227TriangleData1603.coefficient132_251,
  OriginalRow227TriangleData1603.coefficient132_252,
  OriginalRow227TriangleData1603.coefficient132_253,
  OriginalRow227TriangleData1603.coefficient132_254,
  OriginalRow227TriangleData1603.coefficient132_255,
  OriginalRow227TriangleData1603.coefficient132_256,
  OriginalRow227TriangleData1603.coefficient132_257,
  OriginalRow227TriangleData1603.coefficient132_258
]

theorem values1603_size : values1603.size = 32 := rfl

def block1603 : ℕ → Option IntervalDyadic := segment 227 values1603

theorem block1603_domain : ExactDomain block1603 227 259 := by
  simpa only [values1603_size] using segment_domain 227 values1603

theorem block1603_get (i : Fin 32) :
    block1603 (227 + i.val) = some (values1603[i.val]'(by rw [values1603_size]; exact i.isLt)) := by
  exact segment_get 227 values1603 ⟨i.val, by rw [values1603_size]; exact i.isLt⟩

def values1604 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1604.coefficient132_259,
  OriginalRow227TriangleData1604.coefficient132_260,
  OriginalRow227TriangleData1604.coefficient132_261,
  OriginalRow227TriangleData1604.coefficient132_262,
  OriginalRow227TriangleData1604.coefficient132_263,
  OriginalRow227TriangleData1604.coefficient132_264,
  OriginalRow227TriangleData1604.coefficient132_265,
  OriginalRow227TriangleData1604.coefficient132_266,
  OriginalRow227TriangleData1604.coefficient132_267,
  OriginalRow227TriangleData1604.coefficient132_268,
  OriginalRow227TriangleData1604.coefficient132_269,
  OriginalRow227TriangleData1604.coefficient132_270,
  OriginalRow227TriangleData1604.coefficient132_271,
  OriginalRow227TriangleData1604.coefficient132_272,
  OriginalRow227TriangleData1604.coefficient132_273,
  OriginalRow227TriangleData1604.coefficient132_274,
  OriginalRow227TriangleData1604.coefficient132_275,
  OriginalRow227TriangleData1604.coefficient132_276,
  OriginalRow227TriangleData1604.coefficient132_277,
  OriginalRow227TriangleData1604.coefficient132_278,
  OriginalRow227TriangleData1604.coefficient132_279,
  OriginalRow227TriangleData1604.coefficient132_280,
  OriginalRow227TriangleData1604.coefficient132_281,
  OriginalRow227TriangleData1604.coefficient132_282,
  OriginalRow227TriangleData1604.coefficient132_283,
  OriginalRow227TriangleData1604.coefficient132_284,
  OriginalRow227TriangleData1604.coefficient132_285,
  OriginalRow227TriangleData1604.coefficient132_286,
  OriginalRow227TriangleData1604.coefficient132_287,
  OriginalRow227TriangleData1604.coefficient132_288,
  OriginalRow227TriangleData1604.coefficient132_289,
  OriginalRow227TriangleData1604.coefficient132_290
]

theorem values1604_size : values1604.size = 32 := rfl

def block1604 : ℕ → Option IntervalDyadic := segment 259 values1604

theorem block1604_domain : ExactDomain block1604 259 291 := by
  simpa only [values1604_size] using segment_domain 259 values1604

theorem block1604_get (i : Fin 32) :
    block1604 (259 + i.val) = some (values1604[i.val]'(by rw [values1604_size]; exact i.isLt)) := by
  exact segment_get 259 values1604 ⟨i.val, by rw [values1604_size]; exact i.isLt⟩

def values1605 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1605.coefficient132_291,
  OriginalRow227TriangleData1605.coefficient132_292,
  OriginalRow227TriangleData1605.coefficient132_293,
  OriginalRow227TriangleData1605.coefficient132_294,
  OriginalRow227TriangleData1605.coefficient132_295,
  OriginalRow227TriangleData1605.coefficient132_296,
  OriginalRow227TriangleData1605.coefficient132_297,
  OriginalRow227TriangleData1605.coefficient132_298,
  OriginalRow227TriangleData1605.coefficient132_299,
  OriginalRow227TriangleData1605.coefficient132_300,
  OriginalRow227TriangleData1605.coefficient132_301,
  OriginalRow227TriangleData1605.coefficient132_302,
  OriginalRow227TriangleData1605.coefficient132_303,
  OriginalRow227TriangleData1605.coefficient132_304,
  OriginalRow227TriangleData1605.coefficient132_305,
  OriginalRow227TriangleData1605.coefficient132_306,
  OriginalRow227TriangleData1605.coefficient132_307,
  OriginalRow227TriangleData1605.coefficient132_308,
  OriginalRow227TriangleData1605.coefficient132_309,
  OriginalRow227TriangleData1605.coefficient132_310,
  OriginalRow227TriangleData1605.coefficient132_311,
  OriginalRow227TriangleData1605.coefficient132_312,
  OriginalRow227TriangleData1605.coefficient132_313,
  OriginalRow227TriangleData1605.coefficient132_314,
  OriginalRow227TriangleData1605.coefficient132_315,
  OriginalRow227TriangleData1605.coefficient132_316,
  OriginalRow227TriangleData1605.coefficient132_317,
  OriginalRow227TriangleData1605.coefficient132_318,
  OriginalRow227TriangleData1605.coefficient132_319,
  OriginalRow227TriangleData1605.coefficient132_320,
  OriginalRow227TriangleData1605.coefficient132_321,
  OriginalRow227TriangleData1605.coefficient132_322
]

theorem values1605_size : values1605.size = 32 := rfl

def block1605 : ℕ → Option IntervalDyadic := segment 291 values1605

theorem block1605_domain : ExactDomain block1605 291 323 := by
  simpa only [values1605_size] using segment_domain 291 values1605

theorem block1605_get (i : Fin 32) :
    block1605 (291 + i.val) = some (values1605[i.val]'(by rw [values1605_size]; exact i.isLt)) := by
  exact segment_get 291 values1605 ⟨i.val, by rw [values1605_size]; exact i.isLt⟩

def values1606 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1606.coefficient132_323,
  OriginalRow227TriangleData1606.coefficient132_324,
  OriginalRow227TriangleData1606.coefficient132_325,
  OriginalRow227TriangleData1606.coefficient132_326,
  OriginalRow227TriangleData1606.coefficient132_327,
  OriginalRow227TriangleData1606.coefficient132_328,
  OriginalRow227TriangleData1606.coefficient132_329,
  OriginalRow227TriangleData1606.coefficient132_330,
  OriginalRow227TriangleData1606.coefficient132_331,
  OriginalRow227TriangleData1606.coefficient132_332,
  OriginalRow227TriangleData1606.coefficient132_333,
  OriginalRow227TriangleData1606.coefficient132_334,
  OriginalRow227TriangleData1606.coefficient132_335,
  OriginalRow227TriangleData1606.coefficient132_336,
  OriginalRow227TriangleData1606.coefficient132_337,
  OriginalRow227TriangleData1606.coefficient132_338,
  OriginalRow227TriangleData1606.coefficient132_339,
  OriginalRow227TriangleData1606.coefficient132_340,
  OriginalRow227TriangleData1606.coefficient132_341,
  OriginalRow227TriangleData1606.coefficient132_342,
  OriginalRow227TriangleData1606.coefficient132_343,
  OriginalRow227TriangleData1606.coefficient132_344,
  OriginalRow227TriangleData1606.coefficient132_345,
  OriginalRow227TriangleData1606.coefficient132_346,
  OriginalRow227TriangleData1606.coefficient132_347,
  OriginalRow227TriangleData1606.coefficient132_348,
  OriginalRow227TriangleData1606.coefficient132_349,
  OriginalRow227TriangleData1606.coefficient132_350,
  OriginalRow227TriangleData1606.coefficient132_351,
  OriginalRow227TriangleData1606.coefficient132_352,
  OriginalRow227TriangleData1606.coefficient132_353,
  OriginalRow227TriangleData1606.coefficient132_354
]

theorem values1606_size : values1606.size = 32 := rfl

def block1606 : ℕ → Option IntervalDyadic := segment 323 values1606

theorem block1606_domain : ExactDomain block1606 323 355 := by
  simpa only [values1606_size] using segment_domain 323 values1606

theorem block1606_get (i : Fin 32) :
    block1606 (323 + i.val) = some (values1606[i.val]'(by rw [values1606_size]; exact i.isLt)) := by
  exact segment_get 323 values1606 ⟨i.val, by rw [values1606_size]; exact i.isLt⟩

def values1607 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1607.coefficient132_355,
  OriginalRow227TriangleData1607.coefficient132_356,
  OriginalRow227TriangleData1607.coefficient132_357,
  OriginalRow227TriangleData1607.coefficient132_358,
  OriginalRow227TriangleData1607.coefficient132_359,
  OriginalRow227TriangleData1607.coefficient132_360,
  OriginalRow227TriangleData1607.coefficient132_361,
  OriginalRow227TriangleData1607.coefficient132_362,
  OriginalRow227TriangleData1607.coefficient132_363,
  OriginalRow227TriangleData1607.coefficient132_364,
  OriginalRow227TriangleData1607.coefficient132_365,
  OriginalRow227TriangleData1607.coefficient132_366,
  OriginalRow227TriangleData1607.coefficient132_367,
  OriginalRow227TriangleData1607.coefficient132_368,
  OriginalRow227TriangleData1607.coefficient132_369
]

theorem values1607_size : values1607.size = 15 := rfl

def block1607 : ℕ → Option IntervalDyadic := segment 355 values1607

theorem block1607_domain : ExactDomain block1607 355 370 := by
  simpa only [values1607_size] using segment_domain 355 values1607

theorem block1607_get (i : Fin 15) :
    block1607 (355 + i.val) = some (values1607[i.val]'(by rw [values1607_size]; exact i.isLt)) := by
  exact segment_get 355 values1607 ⟨i.val, by rw [values1607_size]; exact i.isLt⟩

def node0131_0195 : ℕ → Option IntervalDyadic := split 163 block1600 block1601

theorem node0131_0195_domain : ExactDomain node0131_0195 131 195 := by
  exact split_domain (by decide) (by decide) block1600_domain block1601_domain

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block1602 block1603

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block1602_domain block1603_domain

def node0131_0259 : ℕ → Option IntervalDyadic := split 195 node0131_0195 node0195_0259

theorem node0131_0259_domain : ExactDomain node0131_0259 131 259 := by
  exact split_domain (by decide) (by decide) node0131_0195_domain node0195_0259_domain

def node0259_0323 : ℕ → Option IntervalDyadic := split 291 block1604 block1605

theorem node0259_0323_domain : ExactDomain node0259_0323 259 323 := by
  exact split_domain (by decide) (by decide) block1604_domain block1605_domain

def node0323_0370 : ℕ → Option IntervalDyadic := split 355 block1606 block1607

theorem node0323_0370_domain : ExactDomain node0323_0370 323 370 := by
  exact split_domain (by decide) (by decide) block1606_domain block1607_domain

def node0259_0370 : ℕ → Option IntervalDyadic := split 323 node0259_0323 node0323_0370

theorem node0259_0370_domain : ExactDomain node0259_0370 259 370 := by
  exact split_domain (by decide) (by decide) node0259_0323_domain node0323_0370_domain

def node0131_0370 : ℕ → Option IntervalDyadic := split 259 node0131_0259 node0259_0370

theorem node0131_0370_domain : ExactDomain node0131_0370 131 370 := by
  exact split_domain (by decide) (by decide) node0131_0259_domain node0259_0370_domain

def lookup : ℕ → Option IntervalDyadic := node0131_0370

theorem lookup_domain : ExactDomain lookup 131 370 :=
  node0131_0370_domain

theorem block1600_lookup (i : Fin 32) :
    lookup (131 + i.val) = some (values1600[i.val]'(by rw [values1600_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (131 + i.val) = _
  rw [node0131_0370, split_left 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0131_0259, split_left 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0131_0195, split_left 163 block1600 block1601 (by omega)]
  exact block1600_get i

theorem block1601_lookup (i : Fin 32) :
    lookup (163 + i.val) = some (values1601[i.val]'(by rw [values1601_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (163 + i.val) = _
  rw [node0131_0370, split_left 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0131_0259, split_left 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0131_0195, split_right 163 block1600 block1601 (by omega)]
  exact block1601_get i

theorem block1602_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values1602[i.val]'(by rw [values1602_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (195 + i.val) = _
  rw [node0131_0370, split_left 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0131_0259, split_right 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0195_0259, split_left 227 block1602 block1603 (by omega)]
  exact block1602_get i

theorem block1603_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values1603[i.val]'(by rw [values1603_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (227 + i.val) = _
  rw [node0131_0370, split_left 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0131_0259, split_right 195 node0131_0195 node0195_0259 (by omega)]
  rw [node0195_0259, split_right 227 block1602 block1603 (by omega)]
  exact block1603_get i

theorem block1604_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values1604[i.val]'(by rw [values1604_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (259 + i.val) = _
  rw [node0131_0370, split_right 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0259_0370, split_left 323 node0259_0323 node0323_0370 (by omega)]
  rw [node0259_0323, split_left 291 block1604 block1605 (by omega)]
  exact block1604_get i

theorem block1605_lookup (i : Fin 32) :
    lookup (291 + i.val) = some (values1605[i.val]'(by rw [values1605_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (291 + i.val) = _
  rw [node0131_0370, split_right 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0259_0370, split_left 323 node0259_0323 node0323_0370 (by omega)]
  rw [node0259_0323, split_right 291 block1604 block1605 (by omega)]
  exact block1605_get i

theorem block1606_lookup (i : Fin 32) :
    lookup (323 + i.val) = some (values1606[i.val]'(by rw [values1606_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (323 + i.val) = _
  rw [node0131_0370, split_right 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0259_0370, split_right 323 node0259_0323 node0323_0370 (by omega)]
  rw [node0323_0370, split_left 355 block1606 block1607 (by omega)]
  exact block1606_get i

theorem block1607_lookup (i : Fin 15) :
    lookup (355 + i.val) = some (values1607[i.val]'(by rw [values1607_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0131_0370 (355 + i.val) = _
  rw [node0131_0370, split_right 259 node0131_0259 node0259_0370 (by omega)]
  rw [node0259_0370, split_right 323 node0259_0323 node0323_0370 (by omega)]
  rw [node0323_0370, split_right 355 block1606 block1607 (by omega)]
  exact block1607_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1600_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1600_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1601_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1601_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1602_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1602_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1603_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1603_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1604_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1604_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1605_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1605_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1606_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1606_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1607_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1607_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1600_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1601_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1602_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1603_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1604_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1605_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1606_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow132.block1607_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow132
