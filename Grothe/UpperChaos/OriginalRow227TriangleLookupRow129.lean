import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1576
import Grothe.UpperChaos.OriginalRow227TriangleData1577
import Grothe.UpperChaos.OriginalRow227TriangleData1578
import Grothe.UpperChaos.OriginalRow227TriangleData1579
import Grothe.UpperChaos.OriginalRow227TriangleData1580
import Grothe.UpperChaos.OriginalRow227TriangleData1581
import Grothe.UpperChaos.OriginalRow227TriangleData1582
import Grothe.UpperChaos.OriginalRow227TriangleData1583

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow129

open ConditionalTableLookup

def values1576 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1576.coefficient129_128,
  OriginalRow227TriangleData1576.coefficient129_129,
  OriginalRow227TriangleData1576.coefficient129_130,
  OriginalRow227TriangleData1576.coefficient129_131,
  OriginalRow227TriangleData1576.coefficient129_132,
  OriginalRow227TriangleData1576.coefficient129_133,
  OriginalRow227TriangleData1576.coefficient129_134,
  OriginalRow227TriangleData1576.coefficient129_135,
  OriginalRow227TriangleData1576.coefficient129_136,
  OriginalRow227TriangleData1576.coefficient129_137,
  OriginalRow227TriangleData1576.coefficient129_138,
  OriginalRow227TriangleData1576.coefficient129_139,
  OriginalRow227TriangleData1576.coefficient129_140,
  OriginalRow227TriangleData1576.coefficient129_141,
  OriginalRow227TriangleData1576.coefficient129_142,
  OriginalRow227TriangleData1576.coefficient129_143,
  OriginalRow227TriangleData1576.coefficient129_144,
  OriginalRow227TriangleData1576.coefficient129_145,
  OriginalRow227TriangleData1576.coefficient129_146,
  OriginalRow227TriangleData1576.coefficient129_147,
  OriginalRow227TriangleData1576.coefficient129_148,
  OriginalRow227TriangleData1576.coefficient129_149,
  OriginalRow227TriangleData1576.coefficient129_150,
  OriginalRow227TriangleData1576.coefficient129_151,
  OriginalRow227TriangleData1576.coefficient129_152,
  OriginalRow227TriangleData1576.coefficient129_153,
  OriginalRow227TriangleData1576.coefficient129_154,
  OriginalRow227TriangleData1576.coefficient129_155,
  OriginalRow227TriangleData1576.coefficient129_156,
  OriginalRow227TriangleData1576.coefficient129_157,
  OriginalRow227TriangleData1576.coefficient129_158,
  OriginalRow227TriangleData1576.coefficient129_159
]

theorem values1576_size : values1576.size = 32 := rfl

def block1576 : ℕ → Option IntervalDyadic := segment 128 values1576

theorem block1576_domain : ExactDomain block1576 128 160 := by
  simpa only [values1576_size] using segment_domain 128 values1576

theorem block1576_get (i : Fin 32) :
    block1576 (128 + i.val) = some (values1576[i.val]'(by rw [values1576_size]; exact i.isLt)) := by
  exact segment_get 128 values1576 ⟨i.val, by rw [values1576_size]; exact i.isLt⟩

def values1577 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1577.coefficient129_160,
  OriginalRow227TriangleData1577.coefficient129_161,
  OriginalRow227TriangleData1577.coefficient129_162,
  OriginalRow227TriangleData1577.coefficient129_163,
  OriginalRow227TriangleData1577.coefficient129_164,
  OriginalRow227TriangleData1577.coefficient129_165,
  OriginalRow227TriangleData1577.coefficient129_166,
  OriginalRow227TriangleData1577.coefficient129_167,
  OriginalRow227TriangleData1577.coefficient129_168,
  OriginalRow227TriangleData1577.coefficient129_169,
  OriginalRow227TriangleData1577.coefficient129_170,
  OriginalRow227TriangleData1577.coefficient129_171,
  OriginalRow227TriangleData1577.coefficient129_172,
  OriginalRow227TriangleData1577.coefficient129_173,
  OriginalRow227TriangleData1577.coefficient129_174,
  OriginalRow227TriangleData1577.coefficient129_175,
  OriginalRow227TriangleData1577.coefficient129_176,
  OriginalRow227TriangleData1577.coefficient129_177,
  OriginalRow227TriangleData1577.coefficient129_178,
  OriginalRow227TriangleData1577.coefficient129_179,
  OriginalRow227TriangleData1577.coefficient129_180,
  OriginalRow227TriangleData1577.coefficient129_181,
  OriginalRow227TriangleData1577.coefficient129_182,
  OriginalRow227TriangleData1577.coefficient129_183,
  OriginalRow227TriangleData1577.coefficient129_184,
  OriginalRow227TriangleData1577.coefficient129_185,
  OriginalRow227TriangleData1577.coefficient129_186,
  OriginalRow227TriangleData1577.coefficient129_187,
  OriginalRow227TriangleData1577.coefficient129_188,
  OriginalRow227TriangleData1577.coefficient129_189,
  OriginalRow227TriangleData1577.coefficient129_190,
  OriginalRow227TriangleData1577.coefficient129_191
]

theorem values1577_size : values1577.size = 32 := rfl

def block1577 : ℕ → Option IntervalDyadic := segment 160 values1577

theorem block1577_domain : ExactDomain block1577 160 192 := by
  simpa only [values1577_size] using segment_domain 160 values1577

theorem block1577_get (i : Fin 32) :
    block1577 (160 + i.val) = some (values1577[i.val]'(by rw [values1577_size]; exact i.isLt)) := by
  exact segment_get 160 values1577 ⟨i.val, by rw [values1577_size]; exact i.isLt⟩

def values1578 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1578.coefficient129_192,
  OriginalRow227TriangleData1578.coefficient129_193,
  OriginalRow227TriangleData1578.coefficient129_194,
  OriginalRow227TriangleData1578.coefficient129_195,
  OriginalRow227TriangleData1578.coefficient129_196,
  OriginalRow227TriangleData1578.coefficient129_197,
  OriginalRow227TriangleData1578.coefficient129_198,
  OriginalRow227TriangleData1578.coefficient129_199,
  OriginalRow227TriangleData1578.coefficient129_200,
  OriginalRow227TriangleData1578.coefficient129_201,
  OriginalRow227TriangleData1578.coefficient129_202,
  OriginalRow227TriangleData1578.coefficient129_203,
  OriginalRow227TriangleData1578.coefficient129_204,
  OriginalRow227TriangleData1578.coefficient129_205,
  OriginalRow227TriangleData1578.coefficient129_206,
  OriginalRow227TriangleData1578.coefficient129_207,
  OriginalRow227TriangleData1578.coefficient129_208,
  OriginalRow227TriangleData1578.coefficient129_209,
  OriginalRow227TriangleData1578.coefficient129_210,
  OriginalRow227TriangleData1578.coefficient129_211,
  OriginalRow227TriangleData1578.coefficient129_212,
  OriginalRow227TriangleData1578.coefficient129_213,
  OriginalRow227TriangleData1578.coefficient129_214,
  OriginalRow227TriangleData1578.coefficient129_215,
  OriginalRow227TriangleData1578.coefficient129_216,
  OriginalRow227TriangleData1578.coefficient129_217,
  OriginalRow227TriangleData1578.coefficient129_218,
  OriginalRow227TriangleData1578.coefficient129_219,
  OriginalRow227TriangleData1578.coefficient129_220,
  OriginalRow227TriangleData1578.coefficient129_221,
  OriginalRow227TriangleData1578.coefficient129_222,
  OriginalRow227TriangleData1578.coefficient129_223
]

theorem values1578_size : values1578.size = 32 := rfl

def block1578 : ℕ → Option IntervalDyadic := segment 192 values1578

theorem block1578_domain : ExactDomain block1578 192 224 := by
  simpa only [values1578_size] using segment_domain 192 values1578

theorem block1578_get (i : Fin 32) :
    block1578 (192 + i.val) = some (values1578[i.val]'(by rw [values1578_size]; exact i.isLt)) := by
  exact segment_get 192 values1578 ⟨i.val, by rw [values1578_size]; exact i.isLt⟩

def values1579 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1579.coefficient129_224,
  OriginalRow227TriangleData1579.coefficient129_225,
  OriginalRow227TriangleData1579.coefficient129_226,
  OriginalRow227TriangleData1579.coefficient129_227,
  OriginalRow227TriangleData1579.coefficient129_228,
  OriginalRow227TriangleData1579.coefficient129_229,
  OriginalRow227TriangleData1579.coefficient129_230,
  OriginalRow227TriangleData1579.coefficient129_231,
  OriginalRow227TriangleData1579.coefficient129_232,
  OriginalRow227TriangleData1579.coefficient129_233,
  OriginalRow227TriangleData1579.coefficient129_234,
  OriginalRow227TriangleData1579.coefficient129_235,
  OriginalRow227TriangleData1579.coefficient129_236,
  OriginalRow227TriangleData1579.coefficient129_237,
  OriginalRow227TriangleData1579.coefficient129_238,
  OriginalRow227TriangleData1579.coefficient129_239,
  OriginalRow227TriangleData1579.coefficient129_240,
  OriginalRow227TriangleData1579.coefficient129_241,
  OriginalRow227TriangleData1579.coefficient129_242,
  OriginalRow227TriangleData1579.coefficient129_243,
  OriginalRow227TriangleData1579.coefficient129_244,
  OriginalRow227TriangleData1579.coefficient129_245,
  OriginalRow227TriangleData1579.coefficient129_246,
  OriginalRow227TriangleData1579.coefficient129_247,
  OriginalRow227TriangleData1579.coefficient129_248,
  OriginalRow227TriangleData1579.coefficient129_249,
  OriginalRow227TriangleData1579.coefficient129_250,
  OriginalRow227TriangleData1579.coefficient129_251,
  OriginalRow227TriangleData1579.coefficient129_252,
  OriginalRow227TriangleData1579.coefficient129_253,
  OriginalRow227TriangleData1579.coefficient129_254,
  OriginalRow227TriangleData1579.coefficient129_255
]

theorem values1579_size : values1579.size = 32 := rfl

def block1579 : ℕ → Option IntervalDyadic := segment 224 values1579

theorem block1579_domain : ExactDomain block1579 224 256 := by
  simpa only [values1579_size] using segment_domain 224 values1579

theorem block1579_get (i : Fin 32) :
    block1579 (224 + i.val) = some (values1579[i.val]'(by rw [values1579_size]; exact i.isLt)) := by
  exact segment_get 224 values1579 ⟨i.val, by rw [values1579_size]; exact i.isLt⟩

def values1580 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1580.coefficient129_256,
  OriginalRow227TriangleData1580.coefficient129_257,
  OriginalRow227TriangleData1580.coefficient129_258,
  OriginalRow227TriangleData1580.coefficient129_259,
  OriginalRow227TriangleData1580.coefficient129_260,
  OriginalRow227TriangleData1580.coefficient129_261,
  OriginalRow227TriangleData1580.coefficient129_262,
  OriginalRow227TriangleData1580.coefficient129_263,
  OriginalRow227TriangleData1580.coefficient129_264,
  OriginalRow227TriangleData1580.coefficient129_265,
  OriginalRow227TriangleData1580.coefficient129_266,
  OriginalRow227TriangleData1580.coefficient129_267,
  OriginalRow227TriangleData1580.coefficient129_268,
  OriginalRow227TriangleData1580.coefficient129_269,
  OriginalRow227TriangleData1580.coefficient129_270,
  OriginalRow227TriangleData1580.coefficient129_271,
  OriginalRow227TriangleData1580.coefficient129_272,
  OriginalRow227TriangleData1580.coefficient129_273,
  OriginalRow227TriangleData1580.coefficient129_274,
  OriginalRow227TriangleData1580.coefficient129_275,
  OriginalRow227TriangleData1580.coefficient129_276,
  OriginalRow227TriangleData1580.coefficient129_277,
  OriginalRow227TriangleData1580.coefficient129_278,
  OriginalRow227TriangleData1580.coefficient129_279,
  OriginalRow227TriangleData1580.coefficient129_280,
  OriginalRow227TriangleData1580.coefficient129_281,
  OriginalRow227TriangleData1580.coefficient129_282,
  OriginalRow227TriangleData1580.coefficient129_283,
  OriginalRow227TriangleData1580.coefficient129_284,
  OriginalRow227TriangleData1580.coefficient129_285,
  OriginalRow227TriangleData1580.coefficient129_286,
  OriginalRow227TriangleData1580.coefficient129_287
]

theorem values1580_size : values1580.size = 32 := rfl

def block1580 : ℕ → Option IntervalDyadic := segment 256 values1580

theorem block1580_domain : ExactDomain block1580 256 288 := by
  simpa only [values1580_size] using segment_domain 256 values1580

theorem block1580_get (i : Fin 32) :
    block1580 (256 + i.val) = some (values1580[i.val]'(by rw [values1580_size]; exact i.isLt)) := by
  exact segment_get 256 values1580 ⟨i.val, by rw [values1580_size]; exact i.isLt⟩

def values1581 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1581.coefficient129_288,
  OriginalRow227TriangleData1581.coefficient129_289,
  OriginalRow227TriangleData1581.coefficient129_290,
  OriginalRow227TriangleData1581.coefficient129_291,
  OriginalRow227TriangleData1581.coefficient129_292,
  OriginalRow227TriangleData1581.coefficient129_293,
  OriginalRow227TriangleData1581.coefficient129_294,
  OriginalRow227TriangleData1581.coefficient129_295,
  OriginalRow227TriangleData1581.coefficient129_296,
  OriginalRow227TriangleData1581.coefficient129_297,
  OriginalRow227TriangleData1581.coefficient129_298,
  OriginalRow227TriangleData1581.coefficient129_299,
  OriginalRow227TriangleData1581.coefficient129_300,
  OriginalRow227TriangleData1581.coefficient129_301,
  OriginalRow227TriangleData1581.coefficient129_302,
  OriginalRow227TriangleData1581.coefficient129_303,
  OriginalRow227TriangleData1581.coefficient129_304,
  OriginalRow227TriangleData1581.coefficient129_305,
  OriginalRow227TriangleData1581.coefficient129_306,
  OriginalRow227TriangleData1581.coefficient129_307,
  OriginalRow227TriangleData1581.coefficient129_308,
  OriginalRow227TriangleData1581.coefficient129_309,
  OriginalRow227TriangleData1581.coefficient129_310,
  OriginalRow227TriangleData1581.coefficient129_311,
  OriginalRow227TriangleData1581.coefficient129_312,
  OriginalRow227TriangleData1581.coefficient129_313,
  OriginalRow227TriangleData1581.coefficient129_314,
  OriginalRow227TriangleData1581.coefficient129_315,
  OriginalRow227TriangleData1581.coefficient129_316,
  OriginalRow227TriangleData1581.coefficient129_317,
  OriginalRow227TriangleData1581.coefficient129_318,
  OriginalRow227TriangleData1581.coefficient129_319
]

theorem values1581_size : values1581.size = 32 := rfl

def block1581 : ℕ → Option IntervalDyadic := segment 288 values1581

theorem block1581_domain : ExactDomain block1581 288 320 := by
  simpa only [values1581_size] using segment_domain 288 values1581

theorem block1581_get (i : Fin 32) :
    block1581 (288 + i.val) = some (values1581[i.val]'(by rw [values1581_size]; exact i.isLt)) := by
  exact segment_get 288 values1581 ⟨i.val, by rw [values1581_size]; exact i.isLt⟩

def values1582 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1582.coefficient129_320,
  OriginalRow227TriangleData1582.coefficient129_321,
  OriginalRow227TriangleData1582.coefficient129_322,
  OriginalRow227TriangleData1582.coefficient129_323,
  OriginalRow227TriangleData1582.coefficient129_324,
  OriginalRow227TriangleData1582.coefficient129_325,
  OriginalRow227TriangleData1582.coefficient129_326,
  OriginalRow227TriangleData1582.coefficient129_327,
  OriginalRow227TriangleData1582.coefficient129_328,
  OriginalRow227TriangleData1582.coefficient129_329,
  OriginalRow227TriangleData1582.coefficient129_330,
  OriginalRow227TriangleData1582.coefficient129_331,
  OriginalRow227TriangleData1582.coefficient129_332,
  OriginalRow227TriangleData1582.coefficient129_333,
  OriginalRow227TriangleData1582.coefficient129_334,
  OriginalRow227TriangleData1582.coefficient129_335,
  OriginalRow227TriangleData1582.coefficient129_336,
  OriginalRow227TriangleData1582.coefficient129_337,
  OriginalRow227TriangleData1582.coefficient129_338,
  OriginalRow227TriangleData1582.coefficient129_339,
  OriginalRow227TriangleData1582.coefficient129_340,
  OriginalRow227TriangleData1582.coefficient129_341,
  OriginalRow227TriangleData1582.coefficient129_342,
  OriginalRow227TriangleData1582.coefficient129_343,
  OriginalRow227TriangleData1582.coefficient129_344,
  OriginalRow227TriangleData1582.coefficient129_345,
  OriginalRow227TriangleData1582.coefficient129_346,
  OriginalRow227TriangleData1582.coefficient129_347,
  OriginalRow227TriangleData1582.coefficient129_348,
  OriginalRow227TriangleData1582.coefficient129_349,
  OriginalRow227TriangleData1582.coefficient129_350,
  OriginalRow227TriangleData1582.coefficient129_351
]

theorem values1582_size : values1582.size = 32 := rfl

def block1582 : ℕ → Option IntervalDyadic := segment 320 values1582

theorem block1582_domain : ExactDomain block1582 320 352 := by
  simpa only [values1582_size] using segment_domain 320 values1582

theorem block1582_get (i : Fin 32) :
    block1582 (320 + i.val) = some (values1582[i.val]'(by rw [values1582_size]; exact i.isLt)) := by
  exact segment_get 320 values1582 ⟨i.val, by rw [values1582_size]; exact i.isLt⟩

def values1583 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1583.coefficient129_352,
  OriginalRow227TriangleData1583.coefficient129_353,
  OriginalRow227TriangleData1583.coefficient129_354,
  OriginalRow227TriangleData1583.coefficient129_355,
  OriginalRow227TriangleData1583.coefficient129_356,
  OriginalRow227TriangleData1583.coefficient129_357,
  OriginalRow227TriangleData1583.coefficient129_358,
  OriginalRow227TriangleData1583.coefficient129_359,
  OriginalRow227TriangleData1583.coefficient129_360,
  OriginalRow227TriangleData1583.coefficient129_361,
  OriginalRow227TriangleData1583.coefficient129_362,
  OriginalRow227TriangleData1583.coefficient129_363,
  OriginalRow227TriangleData1583.coefficient129_364,
  OriginalRow227TriangleData1583.coefficient129_365,
  OriginalRow227TriangleData1583.coefficient129_366,
  OriginalRow227TriangleData1583.coefficient129_367,
  OriginalRow227TriangleData1583.coefficient129_368,
  OriginalRow227TriangleData1583.coefficient129_369,
  OriginalRow227TriangleData1583.coefficient129_370,
  OriginalRow227TriangleData1583.coefficient129_371,
  OriginalRow227TriangleData1583.coefficient129_372
]

theorem values1583_size : values1583.size = 21 := rfl

def block1583 : ℕ → Option IntervalDyadic := segment 352 values1583

theorem block1583_domain : ExactDomain block1583 352 373 := by
  simpa only [values1583_size] using segment_domain 352 values1583

theorem block1583_get (i : Fin 21) :
    block1583 (352 + i.val) = some (values1583[i.val]'(by rw [values1583_size]; exact i.isLt)) := by
  exact segment_get 352 values1583 ⟨i.val, by rw [values1583_size]; exact i.isLt⟩

def node0128_0192 : ℕ → Option IntervalDyadic := split 160 block1576 block1577

theorem node0128_0192_domain : ExactDomain node0128_0192 128 192 := by
  exact split_domain (by decide) (by decide) block1576_domain block1577_domain

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block1578 block1579

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block1578_domain block1579_domain

def node0128_0256 : ℕ → Option IntervalDyadic := split 192 node0128_0192 node0192_0256

theorem node0128_0256_domain : ExactDomain node0128_0256 128 256 := by
  exact split_domain (by decide) (by decide) node0128_0192_domain node0192_0256_domain

def node0256_0320 : ℕ → Option IntervalDyadic := split 288 block1580 block1581

theorem node0256_0320_domain : ExactDomain node0256_0320 256 320 := by
  exact split_domain (by decide) (by decide) block1580_domain block1581_domain

def node0320_0373 : ℕ → Option IntervalDyadic := split 352 block1582 block1583

theorem node0320_0373_domain : ExactDomain node0320_0373 320 373 := by
  exact split_domain (by decide) (by decide) block1582_domain block1583_domain

def node0256_0373 : ℕ → Option IntervalDyadic := split 320 node0256_0320 node0320_0373

theorem node0256_0373_domain : ExactDomain node0256_0373 256 373 := by
  exact split_domain (by decide) (by decide) node0256_0320_domain node0320_0373_domain

def node0128_0373 : ℕ → Option IntervalDyadic := split 256 node0128_0256 node0256_0373

theorem node0128_0373_domain : ExactDomain node0128_0373 128 373 := by
  exact split_domain (by decide) (by decide) node0128_0256_domain node0256_0373_domain

def lookup : ℕ → Option IntervalDyadic := node0128_0373

theorem lookup_domain : ExactDomain lookup 128 373 :=
  node0128_0373_domain

theorem block1576_lookup (i : Fin 32) :
    lookup (128 + i.val) = some (values1576[i.val]'(by rw [values1576_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (128 + i.val) = _
  rw [node0128_0373, split_left 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_left 160 block1576 block1577 (by omega)]
  exact block1576_get i

theorem block1577_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values1577[i.val]'(by rw [values1577_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (160 + i.val) = _
  rw [node0128_0373, split_left 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0128_0256, split_left 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0128_0192, split_right 160 block1576 block1577 (by omega)]
  exact block1577_get i

theorem block1578_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values1578[i.val]'(by rw [values1578_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (192 + i.val) = _
  rw [node0128_0373, split_left 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block1578 block1579 (by omega)]
  exact block1578_get i

theorem block1579_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values1579[i.val]'(by rw [values1579_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (224 + i.val) = _
  rw [node0128_0373, split_left 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0128_0256, split_right 192 node0128_0192 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block1578 block1579 (by omega)]
  exact block1579_get i

theorem block1580_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values1580[i.val]'(by rw [values1580_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (256 + i.val) = _
  rw [node0128_0373, split_right 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0256_0373, split_left 320 node0256_0320 node0320_0373 (by omega)]
  rw [node0256_0320, split_left 288 block1580 block1581 (by omega)]
  exact block1580_get i

theorem block1581_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values1581[i.val]'(by rw [values1581_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (288 + i.val) = _
  rw [node0128_0373, split_right 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0256_0373, split_left 320 node0256_0320 node0320_0373 (by omega)]
  rw [node0256_0320, split_right 288 block1580 block1581 (by omega)]
  exact block1581_get i

theorem block1582_lookup (i : Fin 32) :
    lookup (320 + i.val) = some (values1582[i.val]'(by rw [values1582_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (320 + i.val) = _
  rw [node0128_0373, split_right 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0256_0373, split_right 320 node0256_0320 node0320_0373 (by omega)]
  rw [node0320_0373, split_left 352 block1582 block1583 (by omega)]
  exact block1582_get i

theorem block1583_lookup (i : Fin 21) :
    lookup (352 + i.val) = some (values1583[i.val]'(by rw [values1583_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0128_0373 (352 + i.val) = _
  rw [node0128_0373, split_right 256 node0128_0256 node0256_0373 (by omega)]
  rw [node0256_0373, split_right 320 node0256_0320 node0320_0373 (by omega)]
  rw [node0320_0373, split_right 352 block1582 block1583 (by omega)]
  exact block1583_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1576_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1576_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1577_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1577_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1578_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1578_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1579_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1579_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1580_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1580_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1581_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1581_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1582_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1582_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1583_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1583_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1576_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1577_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1578_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1579_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1580_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1581_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1582_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow129.block1583_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow129
