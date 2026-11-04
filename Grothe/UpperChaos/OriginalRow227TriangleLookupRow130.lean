import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1584
import Grothe.UpperChaos.OriginalRow227TriangleData1585
import Grothe.UpperChaos.OriginalRow227TriangleData1586
import Grothe.UpperChaos.OriginalRow227TriangleData1587
import Grothe.UpperChaos.OriginalRow227TriangleData1588
import Grothe.UpperChaos.OriginalRow227TriangleData1589
import Grothe.UpperChaos.OriginalRow227TriangleData1590
import Grothe.UpperChaos.OriginalRow227TriangleData1591

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow130

open ConditionalTableLookup

def values1584 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1584.coefficient130_129,
  OriginalRow227TriangleData1584.coefficient130_130,
  OriginalRow227TriangleData1584.coefficient130_131,
  OriginalRow227TriangleData1584.coefficient130_132,
  OriginalRow227TriangleData1584.coefficient130_133,
  OriginalRow227TriangleData1584.coefficient130_134,
  OriginalRow227TriangleData1584.coefficient130_135,
  OriginalRow227TriangleData1584.coefficient130_136,
  OriginalRow227TriangleData1584.coefficient130_137,
  OriginalRow227TriangleData1584.coefficient130_138,
  OriginalRow227TriangleData1584.coefficient130_139,
  OriginalRow227TriangleData1584.coefficient130_140,
  OriginalRow227TriangleData1584.coefficient130_141,
  OriginalRow227TriangleData1584.coefficient130_142,
  OriginalRow227TriangleData1584.coefficient130_143,
  OriginalRow227TriangleData1584.coefficient130_144,
  OriginalRow227TriangleData1584.coefficient130_145,
  OriginalRow227TriangleData1584.coefficient130_146,
  OriginalRow227TriangleData1584.coefficient130_147,
  OriginalRow227TriangleData1584.coefficient130_148,
  OriginalRow227TriangleData1584.coefficient130_149,
  OriginalRow227TriangleData1584.coefficient130_150,
  OriginalRow227TriangleData1584.coefficient130_151,
  OriginalRow227TriangleData1584.coefficient130_152,
  OriginalRow227TriangleData1584.coefficient130_153,
  OriginalRow227TriangleData1584.coefficient130_154,
  OriginalRow227TriangleData1584.coefficient130_155,
  OriginalRow227TriangleData1584.coefficient130_156,
  OriginalRow227TriangleData1584.coefficient130_157,
  OriginalRow227TriangleData1584.coefficient130_158,
  OriginalRow227TriangleData1584.coefficient130_159,
  OriginalRow227TriangleData1584.coefficient130_160
]

theorem values1584_size : values1584.size = 32 := rfl

def block1584 : ℕ → Option IntervalDyadic := segment 129 values1584

theorem block1584_domain : ExactDomain block1584 129 161 := by
  simpa only [values1584_size] using segment_domain 129 values1584

theorem block1584_get (i : Fin 32) :
    block1584 (129 + i.val) = some (values1584[i.val]'(by rw [values1584_size]; exact i.isLt)) := by
  exact segment_get 129 values1584 ⟨i.val, by rw [values1584_size]; exact i.isLt⟩

def values1585 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1585.coefficient130_161,
  OriginalRow227TriangleData1585.coefficient130_162,
  OriginalRow227TriangleData1585.coefficient130_163,
  OriginalRow227TriangleData1585.coefficient130_164,
  OriginalRow227TriangleData1585.coefficient130_165,
  OriginalRow227TriangleData1585.coefficient130_166,
  OriginalRow227TriangleData1585.coefficient130_167,
  OriginalRow227TriangleData1585.coefficient130_168,
  OriginalRow227TriangleData1585.coefficient130_169,
  OriginalRow227TriangleData1585.coefficient130_170,
  OriginalRow227TriangleData1585.coefficient130_171,
  OriginalRow227TriangleData1585.coefficient130_172,
  OriginalRow227TriangleData1585.coefficient130_173,
  OriginalRow227TriangleData1585.coefficient130_174,
  OriginalRow227TriangleData1585.coefficient130_175,
  OriginalRow227TriangleData1585.coefficient130_176,
  OriginalRow227TriangleData1585.coefficient130_177,
  OriginalRow227TriangleData1585.coefficient130_178,
  OriginalRow227TriangleData1585.coefficient130_179,
  OriginalRow227TriangleData1585.coefficient130_180,
  OriginalRow227TriangleData1585.coefficient130_181,
  OriginalRow227TriangleData1585.coefficient130_182,
  OriginalRow227TriangleData1585.coefficient130_183,
  OriginalRow227TriangleData1585.coefficient130_184,
  OriginalRow227TriangleData1585.coefficient130_185,
  OriginalRow227TriangleData1585.coefficient130_186,
  OriginalRow227TriangleData1585.coefficient130_187,
  OriginalRow227TriangleData1585.coefficient130_188,
  OriginalRow227TriangleData1585.coefficient130_189,
  OriginalRow227TriangleData1585.coefficient130_190,
  OriginalRow227TriangleData1585.coefficient130_191,
  OriginalRow227TriangleData1585.coefficient130_192
]

theorem values1585_size : values1585.size = 32 := rfl

def block1585 : ℕ → Option IntervalDyadic := segment 161 values1585

theorem block1585_domain : ExactDomain block1585 161 193 := by
  simpa only [values1585_size] using segment_domain 161 values1585

theorem block1585_get (i : Fin 32) :
    block1585 (161 + i.val) = some (values1585[i.val]'(by rw [values1585_size]; exact i.isLt)) := by
  exact segment_get 161 values1585 ⟨i.val, by rw [values1585_size]; exact i.isLt⟩

def values1586 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1586.coefficient130_193,
  OriginalRow227TriangleData1586.coefficient130_194,
  OriginalRow227TriangleData1586.coefficient130_195,
  OriginalRow227TriangleData1586.coefficient130_196,
  OriginalRow227TriangleData1586.coefficient130_197,
  OriginalRow227TriangleData1586.coefficient130_198,
  OriginalRow227TriangleData1586.coefficient130_199,
  OriginalRow227TriangleData1586.coefficient130_200,
  OriginalRow227TriangleData1586.coefficient130_201,
  OriginalRow227TriangleData1586.coefficient130_202,
  OriginalRow227TriangleData1586.coefficient130_203,
  OriginalRow227TriangleData1586.coefficient130_204,
  OriginalRow227TriangleData1586.coefficient130_205,
  OriginalRow227TriangleData1586.coefficient130_206,
  OriginalRow227TriangleData1586.coefficient130_207,
  OriginalRow227TriangleData1586.coefficient130_208,
  OriginalRow227TriangleData1586.coefficient130_209,
  OriginalRow227TriangleData1586.coefficient130_210,
  OriginalRow227TriangleData1586.coefficient130_211,
  OriginalRow227TriangleData1586.coefficient130_212,
  OriginalRow227TriangleData1586.coefficient130_213,
  OriginalRow227TriangleData1586.coefficient130_214,
  OriginalRow227TriangleData1586.coefficient130_215,
  OriginalRow227TriangleData1586.coefficient130_216,
  OriginalRow227TriangleData1586.coefficient130_217,
  OriginalRow227TriangleData1586.coefficient130_218,
  OriginalRow227TriangleData1586.coefficient130_219,
  OriginalRow227TriangleData1586.coefficient130_220,
  OriginalRow227TriangleData1586.coefficient130_221,
  OriginalRow227TriangleData1586.coefficient130_222,
  OriginalRow227TriangleData1586.coefficient130_223,
  OriginalRow227TriangleData1586.coefficient130_224
]

theorem values1586_size : values1586.size = 32 := rfl

def block1586 : ℕ → Option IntervalDyadic := segment 193 values1586

theorem block1586_domain : ExactDomain block1586 193 225 := by
  simpa only [values1586_size] using segment_domain 193 values1586

theorem block1586_get (i : Fin 32) :
    block1586 (193 + i.val) = some (values1586[i.val]'(by rw [values1586_size]; exact i.isLt)) := by
  exact segment_get 193 values1586 ⟨i.val, by rw [values1586_size]; exact i.isLt⟩

def values1587 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1587.coefficient130_225,
  OriginalRow227TriangleData1587.coefficient130_226,
  OriginalRow227TriangleData1587.coefficient130_227,
  OriginalRow227TriangleData1587.coefficient130_228,
  OriginalRow227TriangleData1587.coefficient130_229,
  OriginalRow227TriangleData1587.coefficient130_230,
  OriginalRow227TriangleData1587.coefficient130_231,
  OriginalRow227TriangleData1587.coefficient130_232,
  OriginalRow227TriangleData1587.coefficient130_233,
  OriginalRow227TriangleData1587.coefficient130_234,
  OriginalRow227TriangleData1587.coefficient130_235,
  OriginalRow227TriangleData1587.coefficient130_236,
  OriginalRow227TriangleData1587.coefficient130_237,
  OriginalRow227TriangleData1587.coefficient130_238,
  OriginalRow227TriangleData1587.coefficient130_239,
  OriginalRow227TriangleData1587.coefficient130_240,
  OriginalRow227TriangleData1587.coefficient130_241,
  OriginalRow227TriangleData1587.coefficient130_242,
  OriginalRow227TriangleData1587.coefficient130_243,
  OriginalRow227TriangleData1587.coefficient130_244,
  OriginalRow227TriangleData1587.coefficient130_245,
  OriginalRow227TriangleData1587.coefficient130_246,
  OriginalRow227TriangleData1587.coefficient130_247,
  OriginalRow227TriangleData1587.coefficient130_248,
  OriginalRow227TriangleData1587.coefficient130_249,
  OriginalRow227TriangleData1587.coefficient130_250,
  OriginalRow227TriangleData1587.coefficient130_251,
  OriginalRow227TriangleData1587.coefficient130_252,
  OriginalRow227TriangleData1587.coefficient130_253,
  OriginalRow227TriangleData1587.coefficient130_254,
  OriginalRow227TriangleData1587.coefficient130_255,
  OriginalRow227TriangleData1587.coefficient130_256
]

theorem values1587_size : values1587.size = 32 := rfl

def block1587 : ℕ → Option IntervalDyadic := segment 225 values1587

theorem block1587_domain : ExactDomain block1587 225 257 := by
  simpa only [values1587_size] using segment_domain 225 values1587

theorem block1587_get (i : Fin 32) :
    block1587 (225 + i.val) = some (values1587[i.val]'(by rw [values1587_size]; exact i.isLt)) := by
  exact segment_get 225 values1587 ⟨i.val, by rw [values1587_size]; exact i.isLt⟩

def values1588 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1588.coefficient130_257,
  OriginalRow227TriangleData1588.coefficient130_258,
  OriginalRow227TriangleData1588.coefficient130_259,
  OriginalRow227TriangleData1588.coefficient130_260,
  OriginalRow227TriangleData1588.coefficient130_261,
  OriginalRow227TriangleData1588.coefficient130_262,
  OriginalRow227TriangleData1588.coefficient130_263,
  OriginalRow227TriangleData1588.coefficient130_264,
  OriginalRow227TriangleData1588.coefficient130_265,
  OriginalRow227TriangleData1588.coefficient130_266,
  OriginalRow227TriangleData1588.coefficient130_267,
  OriginalRow227TriangleData1588.coefficient130_268,
  OriginalRow227TriangleData1588.coefficient130_269,
  OriginalRow227TriangleData1588.coefficient130_270,
  OriginalRow227TriangleData1588.coefficient130_271,
  OriginalRow227TriangleData1588.coefficient130_272,
  OriginalRow227TriangleData1588.coefficient130_273,
  OriginalRow227TriangleData1588.coefficient130_274,
  OriginalRow227TriangleData1588.coefficient130_275,
  OriginalRow227TriangleData1588.coefficient130_276,
  OriginalRow227TriangleData1588.coefficient130_277,
  OriginalRow227TriangleData1588.coefficient130_278,
  OriginalRow227TriangleData1588.coefficient130_279,
  OriginalRow227TriangleData1588.coefficient130_280,
  OriginalRow227TriangleData1588.coefficient130_281,
  OriginalRow227TriangleData1588.coefficient130_282,
  OriginalRow227TriangleData1588.coefficient130_283,
  OriginalRow227TriangleData1588.coefficient130_284,
  OriginalRow227TriangleData1588.coefficient130_285,
  OriginalRow227TriangleData1588.coefficient130_286,
  OriginalRow227TriangleData1588.coefficient130_287,
  OriginalRow227TriangleData1588.coefficient130_288
]

theorem values1588_size : values1588.size = 32 := rfl

def block1588 : ℕ → Option IntervalDyadic := segment 257 values1588

theorem block1588_domain : ExactDomain block1588 257 289 := by
  simpa only [values1588_size] using segment_domain 257 values1588

theorem block1588_get (i : Fin 32) :
    block1588 (257 + i.val) = some (values1588[i.val]'(by rw [values1588_size]; exact i.isLt)) := by
  exact segment_get 257 values1588 ⟨i.val, by rw [values1588_size]; exact i.isLt⟩

def values1589 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1589.coefficient130_289,
  OriginalRow227TriangleData1589.coefficient130_290,
  OriginalRow227TriangleData1589.coefficient130_291,
  OriginalRow227TriangleData1589.coefficient130_292,
  OriginalRow227TriangleData1589.coefficient130_293,
  OriginalRow227TriangleData1589.coefficient130_294,
  OriginalRow227TriangleData1589.coefficient130_295,
  OriginalRow227TriangleData1589.coefficient130_296,
  OriginalRow227TriangleData1589.coefficient130_297,
  OriginalRow227TriangleData1589.coefficient130_298,
  OriginalRow227TriangleData1589.coefficient130_299,
  OriginalRow227TriangleData1589.coefficient130_300,
  OriginalRow227TriangleData1589.coefficient130_301,
  OriginalRow227TriangleData1589.coefficient130_302,
  OriginalRow227TriangleData1589.coefficient130_303,
  OriginalRow227TriangleData1589.coefficient130_304,
  OriginalRow227TriangleData1589.coefficient130_305,
  OriginalRow227TriangleData1589.coefficient130_306,
  OriginalRow227TriangleData1589.coefficient130_307,
  OriginalRow227TriangleData1589.coefficient130_308,
  OriginalRow227TriangleData1589.coefficient130_309,
  OriginalRow227TriangleData1589.coefficient130_310,
  OriginalRow227TriangleData1589.coefficient130_311,
  OriginalRow227TriangleData1589.coefficient130_312,
  OriginalRow227TriangleData1589.coefficient130_313,
  OriginalRow227TriangleData1589.coefficient130_314,
  OriginalRow227TriangleData1589.coefficient130_315,
  OriginalRow227TriangleData1589.coefficient130_316,
  OriginalRow227TriangleData1589.coefficient130_317,
  OriginalRow227TriangleData1589.coefficient130_318,
  OriginalRow227TriangleData1589.coefficient130_319,
  OriginalRow227TriangleData1589.coefficient130_320
]

theorem values1589_size : values1589.size = 32 := rfl

def block1589 : ℕ → Option IntervalDyadic := segment 289 values1589

theorem block1589_domain : ExactDomain block1589 289 321 := by
  simpa only [values1589_size] using segment_domain 289 values1589

theorem block1589_get (i : Fin 32) :
    block1589 (289 + i.val) = some (values1589[i.val]'(by rw [values1589_size]; exact i.isLt)) := by
  exact segment_get 289 values1589 ⟨i.val, by rw [values1589_size]; exact i.isLt⟩

def values1590 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1590.coefficient130_321,
  OriginalRow227TriangleData1590.coefficient130_322,
  OriginalRow227TriangleData1590.coefficient130_323,
  OriginalRow227TriangleData1590.coefficient130_324,
  OriginalRow227TriangleData1590.coefficient130_325,
  OriginalRow227TriangleData1590.coefficient130_326,
  OriginalRow227TriangleData1590.coefficient130_327,
  OriginalRow227TriangleData1590.coefficient130_328,
  OriginalRow227TriangleData1590.coefficient130_329,
  OriginalRow227TriangleData1590.coefficient130_330,
  OriginalRow227TriangleData1590.coefficient130_331,
  OriginalRow227TriangleData1590.coefficient130_332,
  OriginalRow227TriangleData1590.coefficient130_333,
  OriginalRow227TriangleData1590.coefficient130_334,
  OriginalRow227TriangleData1590.coefficient130_335,
  OriginalRow227TriangleData1590.coefficient130_336,
  OriginalRow227TriangleData1590.coefficient130_337,
  OriginalRow227TriangleData1590.coefficient130_338,
  OriginalRow227TriangleData1590.coefficient130_339,
  OriginalRow227TriangleData1590.coefficient130_340,
  OriginalRow227TriangleData1590.coefficient130_341,
  OriginalRow227TriangleData1590.coefficient130_342,
  OriginalRow227TriangleData1590.coefficient130_343,
  OriginalRow227TriangleData1590.coefficient130_344,
  OriginalRow227TriangleData1590.coefficient130_345,
  OriginalRow227TriangleData1590.coefficient130_346,
  OriginalRow227TriangleData1590.coefficient130_347,
  OriginalRow227TriangleData1590.coefficient130_348,
  OriginalRow227TriangleData1590.coefficient130_349,
  OriginalRow227TriangleData1590.coefficient130_350,
  OriginalRow227TriangleData1590.coefficient130_351,
  OriginalRow227TriangleData1590.coefficient130_352
]

theorem values1590_size : values1590.size = 32 := rfl

def block1590 : ℕ → Option IntervalDyadic := segment 321 values1590

theorem block1590_domain : ExactDomain block1590 321 353 := by
  simpa only [values1590_size] using segment_domain 321 values1590

theorem block1590_get (i : Fin 32) :
    block1590 (321 + i.val) = some (values1590[i.val]'(by rw [values1590_size]; exact i.isLt)) := by
  exact segment_get 321 values1590 ⟨i.val, by rw [values1590_size]; exact i.isLt⟩

def values1591 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1591.coefficient130_353,
  OriginalRow227TriangleData1591.coefficient130_354,
  OriginalRow227TriangleData1591.coefficient130_355,
  OriginalRow227TriangleData1591.coefficient130_356,
  OriginalRow227TriangleData1591.coefficient130_357,
  OriginalRow227TriangleData1591.coefficient130_358,
  OriginalRow227TriangleData1591.coefficient130_359,
  OriginalRow227TriangleData1591.coefficient130_360,
  OriginalRow227TriangleData1591.coefficient130_361,
  OriginalRow227TriangleData1591.coefficient130_362,
  OriginalRow227TriangleData1591.coefficient130_363,
  OriginalRow227TriangleData1591.coefficient130_364,
  OriginalRow227TriangleData1591.coefficient130_365,
  OriginalRow227TriangleData1591.coefficient130_366,
  OriginalRow227TriangleData1591.coefficient130_367,
  OriginalRow227TriangleData1591.coefficient130_368,
  OriginalRow227TriangleData1591.coefficient130_369,
  OriginalRow227TriangleData1591.coefficient130_370,
  OriginalRow227TriangleData1591.coefficient130_371
]

theorem values1591_size : values1591.size = 19 := rfl

def block1591 : ℕ → Option IntervalDyadic := segment 353 values1591

theorem block1591_domain : ExactDomain block1591 353 372 := by
  simpa only [values1591_size] using segment_domain 353 values1591

theorem block1591_get (i : Fin 19) :
    block1591 (353 + i.val) = some (values1591[i.val]'(by rw [values1591_size]; exact i.isLt)) := by
  exact segment_get 353 values1591 ⟨i.val, by rw [values1591_size]; exact i.isLt⟩

def node0129_0193 : ℕ → Option IntervalDyadic := split 161 block1584 block1585

theorem node0129_0193_domain : ExactDomain node0129_0193 129 193 := by
  exact split_domain (by decide) (by decide) block1584_domain block1585_domain

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block1586 block1587

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block1586_domain block1587_domain

def node0129_0257 : ℕ → Option IntervalDyadic := split 193 node0129_0193 node0193_0257

theorem node0129_0257_domain : ExactDomain node0129_0257 129 257 := by
  exact split_domain (by decide) (by decide) node0129_0193_domain node0193_0257_domain

def node0257_0321 : ℕ → Option IntervalDyadic := split 289 block1588 block1589

theorem node0257_0321_domain : ExactDomain node0257_0321 257 321 := by
  exact split_domain (by decide) (by decide) block1588_domain block1589_domain

def node0321_0372 : ℕ → Option IntervalDyadic := split 353 block1590 block1591

theorem node0321_0372_domain : ExactDomain node0321_0372 321 372 := by
  exact split_domain (by decide) (by decide) block1590_domain block1591_domain

def node0257_0372 : ℕ → Option IntervalDyadic := split 321 node0257_0321 node0321_0372

theorem node0257_0372_domain : ExactDomain node0257_0372 257 372 := by
  exact split_domain (by decide) (by decide) node0257_0321_domain node0321_0372_domain

def node0129_0372 : ℕ → Option IntervalDyadic := split 257 node0129_0257 node0257_0372

theorem node0129_0372_domain : ExactDomain node0129_0372 129 372 := by
  exact split_domain (by decide) (by decide) node0129_0257_domain node0257_0372_domain

def lookup : ℕ → Option IntervalDyadic := node0129_0372

theorem lookup_domain : ExactDomain lookup 129 372 :=
  node0129_0372_domain

theorem block1584_lookup (i : Fin 32) :
    lookup (129 + i.val) = some (values1584[i.val]'(by rw [values1584_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (129 + i.val) = _
  rw [node0129_0372, split_left 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0129_0257, split_left 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0129_0193, split_left 161 block1584 block1585 (by omega)]
  exact block1584_get i

theorem block1585_lookup (i : Fin 32) :
    lookup (161 + i.val) = some (values1585[i.val]'(by rw [values1585_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (161 + i.val) = _
  rw [node0129_0372, split_left 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0129_0257, split_left 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0129_0193, split_right 161 block1584 block1585 (by omega)]
  exact block1585_get i

theorem block1586_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values1586[i.val]'(by rw [values1586_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (193 + i.val) = _
  rw [node0129_0372, split_left 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0129_0257, split_right 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0193_0257, split_left 225 block1586 block1587 (by omega)]
  exact block1586_get i

theorem block1587_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values1587[i.val]'(by rw [values1587_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (225 + i.val) = _
  rw [node0129_0372, split_left 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0129_0257, split_right 193 node0129_0193 node0193_0257 (by omega)]
  rw [node0193_0257, split_right 225 block1586 block1587 (by omega)]
  exact block1587_get i

theorem block1588_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values1588[i.val]'(by rw [values1588_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (257 + i.val) = _
  rw [node0129_0372, split_right 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0257_0372, split_left 321 node0257_0321 node0321_0372 (by omega)]
  rw [node0257_0321, split_left 289 block1588 block1589 (by omega)]
  exact block1588_get i

theorem block1589_lookup (i : Fin 32) :
    lookup (289 + i.val) = some (values1589[i.val]'(by rw [values1589_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (289 + i.val) = _
  rw [node0129_0372, split_right 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0257_0372, split_left 321 node0257_0321 node0321_0372 (by omega)]
  rw [node0257_0321, split_right 289 block1588 block1589 (by omega)]
  exact block1589_get i

theorem block1590_lookup (i : Fin 32) :
    lookup (321 + i.val) = some (values1590[i.val]'(by rw [values1590_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (321 + i.val) = _
  rw [node0129_0372, split_right 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0257_0372, split_right 321 node0257_0321 node0321_0372 (by omega)]
  rw [node0321_0372, split_left 353 block1590 block1591 (by omega)]
  exact block1590_get i

theorem block1591_lookup (i : Fin 19) :
    lookup (353 + i.val) = some (values1591[i.val]'(by rw [values1591_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0129_0372 (353 + i.val) = _
  rw [node0129_0372, split_right 257 node0129_0257 node0257_0372 (by omega)]
  rw [node0257_0372, split_right 321 node0257_0321 node0321_0372 (by omega)]
  rw [node0321_0372, split_right 353 block1590 block1591 (by omega)]
  exact block1591_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1584_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1584_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1585_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1585_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1586_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1586_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1587_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1587_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1588_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1588_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1589_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1589_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1590_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1590_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1591_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1591_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1584_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1585_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1586_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1587_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1588_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1589_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1590_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow130.block1591_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow130
