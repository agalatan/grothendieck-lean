import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1632
import Grothe.UpperChaos.OriginalRow227TriangleData1633
import Grothe.UpperChaos.OriginalRow227TriangleData1634
import Grothe.UpperChaos.OriginalRow227TriangleData1635
import Grothe.UpperChaos.OriginalRow227TriangleData1636
import Grothe.UpperChaos.OriginalRow227TriangleData1637
import Grothe.UpperChaos.OriginalRow227TriangleData1638
import Grothe.UpperChaos.OriginalRow227TriangleData1639

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow136

open ConditionalTableLookup

def values1632 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1632.coefficient136_135,
  OriginalRow227TriangleData1632.coefficient136_136,
  OriginalRow227TriangleData1632.coefficient136_137,
  OriginalRow227TriangleData1632.coefficient136_138,
  OriginalRow227TriangleData1632.coefficient136_139,
  OriginalRow227TriangleData1632.coefficient136_140,
  OriginalRow227TriangleData1632.coefficient136_141,
  OriginalRow227TriangleData1632.coefficient136_142,
  OriginalRow227TriangleData1632.coefficient136_143,
  OriginalRow227TriangleData1632.coefficient136_144,
  OriginalRow227TriangleData1632.coefficient136_145,
  OriginalRow227TriangleData1632.coefficient136_146,
  OriginalRow227TriangleData1632.coefficient136_147,
  OriginalRow227TriangleData1632.coefficient136_148,
  OriginalRow227TriangleData1632.coefficient136_149,
  OriginalRow227TriangleData1632.coefficient136_150,
  OriginalRow227TriangleData1632.coefficient136_151,
  OriginalRow227TriangleData1632.coefficient136_152,
  OriginalRow227TriangleData1632.coefficient136_153,
  OriginalRow227TriangleData1632.coefficient136_154,
  OriginalRow227TriangleData1632.coefficient136_155,
  OriginalRow227TriangleData1632.coefficient136_156,
  OriginalRow227TriangleData1632.coefficient136_157,
  OriginalRow227TriangleData1632.coefficient136_158,
  OriginalRow227TriangleData1632.coefficient136_159,
  OriginalRow227TriangleData1632.coefficient136_160,
  OriginalRow227TriangleData1632.coefficient136_161,
  OriginalRow227TriangleData1632.coefficient136_162,
  OriginalRow227TriangleData1632.coefficient136_163,
  OriginalRow227TriangleData1632.coefficient136_164,
  OriginalRow227TriangleData1632.coefficient136_165,
  OriginalRow227TriangleData1632.coefficient136_166
]

theorem values1632_size : values1632.size = 32 := rfl

def block1632 : ℕ → Option IntervalDyadic := segment 135 values1632

theorem block1632_domain : ExactDomain block1632 135 167 := by
  simpa only [values1632_size] using segment_domain 135 values1632

theorem block1632_get (i : Fin 32) :
    block1632 (135 + i.val) = some (values1632[i.val]'(by rw [values1632_size]; exact i.isLt)) := by
  exact segment_get 135 values1632 ⟨i.val, by rw [values1632_size]; exact i.isLt⟩

def values1633 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1633.coefficient136_167,
  OriginalRow227TriangleData1633.coefficient136_168,
  OriginalRow227TriangleData1633.coefficient136_169,
  OriginalRow227TriangleData1633.coefficient136_170,
  OriginalRow227TriangleData1633.coefficient136_171,
  OriginalRow227TriangleData1633.coefficient136_172,
  OriginalRow227TriangleData1633.coefficient136_173,
  OriginalRow227TriangleData1633.coefficient136_174,
  OriginalRow227TriangleData1633.coefficient136_175,
  OriginalRow227TriangleData1633.coefficient136_176,
  OriginalRow227TriangleData1633.coefficient136_177,
  OriginalRow227TriangleData1633.coefficient136_178,
  OriginalRow227TriangleData1633.coefficient136_179,
  OriginalRow227TriangleData1633.coefficient136_180,
  OriginalRow227TriangleData1633.coefficient136_181,
  OriginalRow227TriangleData1633.coefficient136_182,
  OriginalRow227TriangleData1633.coefficient136_183,
  OriginalRow227TriangleData1633.coefficient136_184,
  OriginalRow227TriangleData1633.coefficient136_185,
  OriginalRow227TriangleData1633.coefficient136_186,
  OriginalRow227TriangleData1633.coefficient136_187,
  OriginalRow227TriangleData1633.coefficient136_188,
  OriginalRow227TriangleData1633.coefficient136_189,
  OriginalRow227TriangleData1633.coefficient136_190,
  OriginalRow227TriangleData1633.coefficient136_191,
  OriginalRow227TriangleData1633.coefficient136_192,
  OriginalRow227TriangleData1633.coefficient136_193,
  OriginalRow227TriangleData1633.coefficient136_194,
  OriginalRow227TriangleData1633.coefficient136_195,
  OriginalRow227TriangleData1633.coefficient136_196,
  OriginalRow227TriangleData1633.coefficient136_197,
  OriginalRow227TriangleData1633.coefficient136_198
]

theorem values1633_size : values1633.size = 32 := rfl

def block1633 : ℕ → Option IntervalDyadic := segment 167 values1633

theorem block1633_domain : ExactDomain block1633 167 199 := by
  simpa only [values1633_size] using segment_domain 167 values1633

theorem block1633_get (i : Fin 32) :
    block1633 (167 + i.val) = some (values1633[i.val]'(by rw [values1633_size]; exact i.isLt)) := by
  exact segment_get 167 values1633 ⟨i.val, by rw [values1633_size]; exact i.isLt⟩

def values1634 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1634.coefficient136_199,
  OriginalRow227TriangleData1634.coefficient136_200,
  OriginalRow227TriangleData1634.coefficient136_201,
  OriginalRow227TriangleData1634.coefficient136_202,
  OriginalRow227TriangleData1634.coefficient136_203,
  OriginalRow227TriangleData1634.coefficient136_204,
  OriginalRow227TriangleData1634.coefficient136_205,
  OriginalRow227TriangleData1634.coefficient136_206,
  OriginalRow227TriangleData1634.coefficient136_207,
  OriginalRow227TriangleData1634.coefficient136_208,
  OriginalRow227TriangleData1634.coefficient136_209,
  OriginalRow227TriangleData1634.coefficient136_210,
  OriginalRow227TriangleData1634.coefficient136_211,
  OriginalRow227TriangleData1634.coefficient136_212,
  OriginalRow227TriangleData1634.coefficient136_213,
  OriginalRow227TriangleData1634.coefficient136_214,
  OriginalRow227TriangleData1634.coefficient136_215,
  OriginalRow227TriangleData1634.coefficient136_216,
  OriginalRow227TriangleData1634.coefficient136_217,
  OriginalRow227TriangleData1634.coefficient136_218,
  OriginalRow227TriangleData1634.coefficient136_219,
  OriginalRow227TriangleData1634.coefficient136_220,
  OriginalRow227TriangleData1634.coefficient136_221,
  OriginalRow227TriangleData1634.coefficient136_222,
  OriginalRow227TriangleData1634.coefficient136_223,
  OriginalRow227TriangleData1634.coefficient136_224,
  OriginalRow227TriangleData1634.coefficient136_225,
  OriginalRow227TriangleData1634.coefficient136_226,
  OriginalRow227TriangleData1634.coefficient136_227,
  OriginalRow227TriangleData1634.coefficient136_228,
  OriginalRow227TriangleData1634.coefficient136_229,
  OriginalRow227TriangleData1634.coefficient136_230
]

theorem values1634_size : values1634.size = 32 := rfl

def block1634 : ℕ → Option IntervalDyadic := segment 199 values1634

theorem block1634_domain : ExactDomain block1634 199 231 := by
  simpa only [values1634_size] using segment_domain 199 values1634

theorem block1634_get (i : Fin 32) :
    block1634 (199 + i.val) = some (values1634[i.val]'(by rw [values1634_size]; exact i.isLt)) := by
  exact segment_get 199 values1634 ⟨i.val, by rw [values1634_size]; exact i.isLt⟩

def values1635 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1635.coefficient136_231,
  OriginalRow227TriangleData1635.coefficient136_232,
  OriginalRow227TriangleData1635.coefficient136_233,
  OriginalRow227TriangleData1635.coefficient136_234,
  OriginalRow227TriangleData1635.coefficient136_235,
  OriginalRow227TriangleData1635.coefficient136_236,
  OriginalRow227TriangleData1635.coefficient136_237,
  OriginalRow227TriangleData1635.coefficient136_238,
  OriginalRow227TriangleData1635.coefficient136_239,
  OriginalRow227TriangleData1635.coefficient136_240,
  OriginalRow227TriangleData1635.coefficient136_241,
  OriginalRow227TriangleData1635.coefficient136_242,
  OriginalRow227TriangleData1635.coefficient136_243,
  OriginalRow227TriangleData1635.coefficient136_244,
  OriginalRow227TriangleData1635.coefficient136_245,
  OriginalRow227TriangleData1635.coefficient136_246,
  OriginalRow227TriangleData1635.coefficient136_247,
  OriginalRow227TriangleData1635.coefficient136_248,
  OriginalRow227TriangleData1635.coefficient136_249,
  OriginalRow227TriangleData1635.coefficient136_250,
  OriginalRow227TriangleData1635.coefficient136_251,
  OriginalRow227TriangleData1635.coefficient136_252,
  OriginalRow227TriangleData1635.coefficient136_253,
  OriginalRow227TriangleData1635.coefficient136_254,
  OriginalRow227TriangleData1635.coefficient136_255,
  OriginalRow227TriangleData1635.coefficient136_256,
  OriginalRow227TriangleData1635.coefficient136_257,
  OriginalRow227TriangleData1635.coefficient136_258,
  OriginalRow227TriangleData1635.coefficient136_259,
  OriginalRow227TriangleData1635.coefficient136_260,
  OriginalRow227TriangleData1635.coefficient136_261,
  OriginalRow227TriangleData1635.coefficient136_262
]

theorem values1635_size : values1635.size = 32 := rfl

def block1635 : ℕ → Option IntervalDyadic := segment 231 values1635

theorem block1635_domain : ExactDomain block1635 231 263 := by
  simpa only [values1635_size] using segment_domain 231 values1635

theorem block1635_get (i : Fin 32) :
    block1635 (231 + i.val) = some (values1635[i.val]'(by rw [values1635_size]; exact i.isLt)) := by
  exact segment_get 231 values1635 ⟨i.val, by rw [values1635_size]; exact i.isLt⟩

def values1636 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1636.coefficient136_263,
  OriginalRow227TriangleData1636.coefficient136_264,
  OriginalRow227TriangleData1636.coefficient136_265,
  OriginalRow227TriangleData1636.coefficient136_266,
  OriginalRow227TriangleData1636.coefficient136_267,
  OriginalRow227TriangleData1636.coefficient136_268,
  OriginalRow227TriangleData1636.coefficient136_269,
  OriginalRow227TriangleData1636.coefficient136_270,
  OriginalRow227TriangleData1636.coefficient136_271,
  OriginalRow227TriangleData1636.coefficient136_272,
  OriginalRow227TriangleData1636.coefficient136_273,
  OriginalRow227TriangleData1636.coefficient136_274,
  OriginalRow227TriangleData1636.coefficient136_275,
  OriginalRow227TriangleData1636.coefficient136_276,
  OriginalRow227TriangleData1636.coefficient136_277,
  OriginalRow227TriangleData1636.coefficient136_278,
  OriginalRow227TriangleData1636.coefficient136_279,
  OriginalRow227TriangleData1636.coefficient136_280,
  OriginalRow227TriangleData1636.coefficient136_281,
  OriginalRow227TriangleData1636.coefficient136_282,
  OriginalRow227TriangleData1636.coefficient136_283,
  OriginalRow227TriangleData1636.coefficient136_284,
  OriginalRow227TriangleData1636.coefficient136_285,
  OriginalRow227TriangleData1636.coefficient136_286,
  OriginalRow227TriangleData1636.coefficient136_287,
  OriginalRow227TriangleData1636.coefficient136_288,
  OriginalRow227TriangleData1636.coefficient136_289,
  OriginalRow227TriangleData1636.coefficient136_290,
  OriginalRow227TriangleData1636.coefficient136_291,
  OriginalRow227TriangleData1636.coefficient136_292,
  OriginalRow227TriangleData1636.coefficient136_293,
  OriginalRow227TriangleData1636.coefficient136_294
]

theorem values1636_size : values1636.size = 32 := rfl

def block1636 : ℕ → Option IntervalDyadic := segment 263 values1636

theorem block1636_domain : ExactDomain block1636 263 295 := by
  simpa only [values1636_size] using segment_domain 263 values1636

theorem block1636_get (i : Fin 32) :
    block1636 (263 + i.val) = some (values1636[i.val]'(by rw [values1636_size]; exact i.isLt)) := by
  exact segment_get 263 values1636 ⟨i.val, by rw [values1636_size]; exact i.isLt⟩

def values1637 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1637.coefficient136_295,
  OriginalRow227TriangleData1637.coefficient136_296,
  OriginalRow227TriangleData1637.coefficient136_297,
  OriginalRow227TriangleData1637.coefficient136_298,
  OriginalRow227TriangleData1637.coefficient136_299,
  OriginalRow227TriangleData1637.coefficient136_300,
  OriginalRow227TriangleData1637.coefficient136_301,
  OriginalRow227TriangleData1637.coefficient136_302,
  OriginalRow227TriangleData1637.coefficient136_303,
  OriginalRow227TriangleData1637.coefficient136_304,
  OriginalRow227TriangleData1637.coefficient136_305,
  OriginalRow227TriangleData1637.coefficient136_306,
  OriginalRow227TriangleData1637.coefficient136_307,
  OriginalRow227TriangleData1637.coefficient136_308,
  OriginalRow227TriangleData1637.coefficient136_309,
  OriginalRow227TriangleData1637.coefficient136_310,
  OriginalRow227TriangleData1637.coefficient136_311,
  OriginalRow227TriangleData1637.coefficient136_312,
  OriginalRow227TriangleData1637.coefficient136_313,
  OriginalRow227TriangleData1637.coefficient136_314,
  OriginalRow227TriangleData1637.coefficient136_315,
  OriginalRow227TriangleData1637.coefficient136_316,
  OriginalRow227TriangleData1637.coefficient136_317,
  OriginalRow227TriangleData1637.coefficient136_318,
  OriginalRow227TriangleData1637.coefficient136_319,
  OriginalRow227TriangleData1637.coefficient136_320,
  OriginalRow227TriangleData1637.coefficient136_321,
  OriginalRow227TriangleData1637.coefficient136_322,
  OriginalRow227TriangleData1637.coefficient136_323,
  OriginalRow227TriangleData1637.coefficient136_324,
  OriginalRow227TriangleData1637.coefficient136_325,
  OriginalRow227TriangleData1637.coefficient136_326
]

theorem values1637_size : values1637.size = 32 := rfl

def block1637 : ℕ → Option IntervalDyadic := segment 295 values1637

theorem block1637_domain : ExactDomain block1637 295 327 := by
  simpa only [values1637_size] using segment_domain 295 values1637

theorem block1637_get (i : Fin 32) :
    block1637 (295 + i.val) = some (values1637[i.val]'(by rw [values1637_size]; exact i.isLt)) := by
  exact segment_get 295 values1637 ⟨i.val, by rw [values1637_size]; exact i.isLt⟩

def values1638 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1638.coefficient136_327,
  OriginalRow227TriangleData1638.coefficient136_328,
  OriginalRow227TriangleData1638.coefficient136_329,
  OriginalRow227TriangleData1638.coefficient136_330,
  OriginalRow227TriangleData1638.coefficient136_331,
  OriginalRow227TriangleData1638.coefficient136_332,
  OriginalRow227TriangleData1638.coefficient136_333,
  OriginalRow227TriangleData1638.coefficient136_334,
  OriginalRow227TriangleData1638.coefficient136_335,
  OriginalRow227TriangleData1638.coefficient136_336,
  OriginalRow227TriangleData1638.coefficient136_337,
  OriginalRow227TriangleData1638.coefficient136_338,
  OriginalRow227TriangleData1638.coefficient136_339,
  OriginalRow227TriangleData1638.coefficient136_340,
  OriginalRow227TriangleData1638.coefficient136_341,
  OriginalRow227TriangleData1638.coefficient136_342,
  OriginalRow227TriangleData1638.coefficient136_343,
  OriginalRow227TriangleData1638.coefficient136_344,
  OriginalRow227TriangleData1638.coefficient136_345,
  OriginalRow227TriangleData1638.coefficient136_346,
  OriginalRow227TriangleData1638.coefficient136_347,
  OriginalRow227TriangleData1638.coefficient136_348,
  OriginalRow227TriangleData1638.coefficient136_349,
  OriginalRow227TriangleData1638.coefficient136_350,
  OriginalRow227TriangleData1638.coefficient136_351,
  OriginalRow227TriangleData1638.coefficient136_352,
  OriginalRow227TriangleData1638.coefficient136_353,
  OriginalRow227TriangleData1638.coefficient136_354,
  OriginalRow227TriangleData1638.coefficient136_355,
  OriginalRow227TriangleData1638.coefficient136_356,
  OriginalRow227TriangleData1638.coefficient136_357,
  OriginalRow227TriangleData1638.coefficient136_358
]

theorem values1638_size : values1638.size = 32 := rfl

def block1638 : ℕ → Option IntervalDyadic := segment 327 values1638

theorem block1638_domain : ExactDomain block1638 327 359 := by
  simpa only [values1638_size] using segment_domain 327 values1638

theorem block1638_get (i : Fin 32) :
    block1638 (327 + i.val) = some (values1638[i.val]'(by rw [values1638_size]; exact i.isLt)) := by
  exact segment_get 327 values1638 ⟨i.val, by rw [values1638_size]; exact i.isLt⟩

def values1639 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1639.coefficient136_359,
  OriginalRow227TriangleData1639.coefficient136_360,
  OriginalRow227TriangleData1639.coefficient136_361,
  OriginalRow227TriangleData1639.coefficient136_362,
  OriginalRow227TriangleData1639.coefficient136_363,
  OriginalRow227TriangleData1639.coefficient136_364,
  OriginalRow227TriangleData1639.coefficient136_365
]

theorem values1639_size : values1639.size = 7 := rfl

def block1639 : ℕ → Option IntervalDyadic := segment 359 values1639

theorem block1639_domain : ExactDomain block1639 359 366 := by
  simpa only [values1639_size] using segment_domain 359 values1639

theorem block1639_get (i : Fin 7) :
    block1639 (359 + i.val) = some (values1639[i.val]'(by rw [values1639_size]; exact i.isLt)) := by
  exact segment_get 359 values1639 ⟨i.val, by rw [values1639_size]; exact i.isLt⟩

def node0135_0199 : ℕ → Option IntervalDyadic := split 167 block1632 block1633

theorem node0135_0199_domain : ExactDomain node0135_0199 135 199 := by
  exact split_domain (by decide) (by decide) block1632_domain block1633_domain

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block1634 block1635

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block1634_domain block1635_domain

def node0135_0263 : ℕ → Option IntervalDyadic := split 199 node0135_0199 node0199_0263

theorem node0135_0263_domain : ExactDomain node0135_0263 135 263 := by
  exact split_domain (by decide) (by decide) node0135_0199_domain node0199_0263_domain

def node0263_0327 : ℕ → Option IntervalDyadic := split 295 block1636 block1637

theorem node0263_0327_domain : ExactDomain node0263_0327 263 327 := by
  exact split_domain (by decide) (by decide) block1636_domain block1637_domain

def node0327_0366 : ℕ → Option IntervalDyadic := split 359 block1638 block1639

theorem node0327_0366_domain : ExactDomain node0327_0366 327 366 := by
  exact split_domain (by decide) (by decide) block1638_domain block1639_domain

def node0263_0366 : ℕ → Option IntervalDyadic := split 327 node0263_0327 node0327_0366

theorem node0263_0366_domain : ExactDomain node0263_0366 263 366 := by
  exact split_domain (by decide) (by decide) node0263_0327_domain node0327_0366_domain

def node0135_0366 : ℕ → Option IntervalDyadic := split 263 node0135_0263 node0263_0366

theorem node0135_0366_domain : ExactDomain node0135_0366 135 366 := by
  exact split_domain (by decide) (by decide) node0135_0263_domain node0263_0366_domain

def lookup : ℕ → Option IntervalDyadic := node0135_0366

theorem lookup_domain : ExactDomain lookup 135 366 :=
  node0135_0366_domain

theorem block1632_lookup (i : Fin 32) :
    lookup (135 + i.val) = some (values1632[i.val]'(by rw [values1632_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (135 + i.val) = _
  rw [node0135_0366, split_left 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0135_0263, split_left 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0135_0199, split_left 167 block1632 block1633 (by omega)]
  exact block1632_get i

theorem block1633_lookup (i : Fin 32) :
    lookup (167 + i.val) = some (values1633[i.val]'(by rw [values1633_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (167 + i.val) = _
  rw [node0135_0366, split_left 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0135_0263, split_left 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0135_0199, split_right 167 block1632 block1633 (by omega)]
  exact block1633_get i

theorem block1634_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values1634[i.val]'(by rw [values1634_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (199 + i.val) = _
  rw [node0135_0366, split_left 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0135_0263, split_right 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0199_0263, split_left 231 block1634 block1635 (by omega)]
  exact block1634_get i

theorem block1635_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values1635[i.val]'(by rw [values1635_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (231 + i.val) = _
  rw [node0135_0366, split_left 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0135_0263, split_right 199 node0135_0199 node0199_0263 (by omega)]
  rw [node0199_0263, split_right 231 block1634 block1635 (by omega)]
  exact block1635_get i

theorem block1636_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values1636[i.val]'(by rw [values1636_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (263 + i.val) = _
  rw [node0135_0366, split_right 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0263_0366, split_left 327 node0263_0327 node0327_0366 (by omega)]
  rw [node0263_0327, split_left 295 block1636 block1637 (by omega)]
  exact block1636_get i

theorem block1637_lookup (i : Fin 32) :
    lookup (295 + i.val) = some (values1637[i.val]'(by rw [values1637_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (295 + i.val) = _
  rw [node0135_0366, split_right 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0263_0366, split_left 327 node0263_0327 node0327_0366 (by omega)]
  rw [node0263_0327, split_right 295 block1636 block1637 (by omega)]
  exact block1637_get i

theorem block1638_lookup (i : Fin 32) :
    lookup (327 + i.val) = some (values1638[i.val]'(by rw [values1638_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (327 + i.val) = _
  rw [node0135_0366, split_right 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0263_0366, split_right 327 node0263_0327 node0327_0366 (by omega)]
  rw [node0327_0366, split_left 359 block1638 block1639 (by omega)]
  exact block1638_get i

theorem block1639_lookup (i : Fin 7) :
    lookup (359 + i.val) = some (values1639[i.val]'(by rw [values1639_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0135_0366 (359 + i.val) = _
  rw [node0135_0366, split_right 263 node0135_0263 node0263_0366 (by omega)]
  rw [node0263_0366, split_right 327 node0263_0327 node0327_0366 (by omega)]
  rw [node0327_0366, split_right 359 block1638 block1639 (by omega)]
  exact block1639_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1632_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1632_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1633_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1633_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1634_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1634_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1635_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1635_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1636_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1636_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1637_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1637_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1638_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1638_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1639_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1639_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1632_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1633_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1634_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1635_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1636_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1637_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1638_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow136.block1639_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow136
