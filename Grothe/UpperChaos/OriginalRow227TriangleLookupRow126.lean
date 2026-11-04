import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1552
import Grothe.UpperChaos.OriginalRow227TriangleData1553
import Grothe.UpperChaos.OriginalRow227TriangleData1554
import Grothe.UpperChaos.OriginalRow227TriangleData1555
import Grothe.UpperChaos.OriginalRow227TriangleData1556
import Grothe.UpperChaos.OriginalRow227TriangleData1557
import Grothe.UpperChaos.OriginalRow227TriangleData1558
import Grothe.UpperChaos.OriginalRow227TriangleData1559

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow126

open ConditionalTableLookup

def values1552 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1552.coefficient126_125,
  OriginalRow227TriangleData1552.coefficient126_126,
  OriginalRow227TriangleData1552.coefficient126_127,
  OriginalRow227TriangleData1552.coefficient126_128,
  OriginalRow227TriangleData1552.coefficient126_129,
  OriginalRow227TriangleData1552.coefficient126_130,
  OriginalRow227TriangleData1552.coefficient126_131,
  OriginalRow227TriangleData1552.coefficient126_132,
  OriginalRow227TriangleData1552.coefficient126_133,
  OriginalRow227TriangleData1552.coefficient126_134,
  OriginalRow227TriangleData1552.coefficient126_135,
  OriginalRow227TriangleData1552.coefficient126_136,
  OriginalRow227TriangleData1552.coefficient126_137,
  OriginalRow227TriangleData1552.coefficient126_138,
  OriginalRow227TriangleData1552.coefficient126_139,
  OriginalRow227TriangleData1552.coefficient126_140,
  OriginalRow227TriangleData1552.coefficient126_141,
  OriginalRow227TriangleData1552.coefficient126_142,
  OriginalRow227TriangleData1552.coefficient126_143,
  OriginalRow227TriangleData1552.coefficient126_144,
  OriginalRow227TriangleData1552.coefficient126_145,
  OriginalRow227TriangleData1552.coefficient126_146,
  OriginalRow227TriangleData1552.coefficient126_147,
  OriginalRow227TriangleData1552.coefficient126_148,
  OriginalRow227TriangleData1552.coefficient126_149,
  OriginalRow227TriangleData1552.coefficient126_150,
  OriginalRow227TriangleData1552.coefficient126_151,
  OriginalRow227TriangleData1552.coefficient126_152,
  OriginalRow227TriangleData1552.coefficient126_153,
  OriginalRow227TriangleData1552.coefficient126_154,
  OriginalRow227TriangleData1552.coefficient126_155,
  OriginalRow227TriangleData1552.coefficient126_156
]

theorem values1552_size : values1552.size = 32 := rfl

def block1552 : ℕ → Option IntervalDyadic := segment 125 values1552

theorem block1552_domain : ExactDomain block1552 125 157 := by
  simpa only [values1552_size] using segment_domain 125 values1552

theorem block1552_get (i : Fin 32) :
    block1552 (125 + i.val) = some (values1552[i.val]'(by rw [values1552_size]; exact i.isLt)) := by
  exact segment_get 125 values1552 ⟨i.val, by rw [values1552_size]; exact i.isLt⟩

def values1553 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1553.coefficient126_157,
  OriginalRow227TriangleData1553.coefficient126_158,
  OriginalRow227TriangleData1553.coefficient126_159,
  OriginalRow227TriangleData1553.coefficient126_160,
  OriginalRow227TriangleData1553.coefficient126_161,
  OriginalRow227TriangleData1553.coefficient126_162,
  OriginalRow227TriangleData1553.coefficient126_163,
  OriginalRow227TriangleData1553.coefficient126_164,
  OriginalRow227TriangleData1553.coefficient126_165,
  OriginalRow227TriangleData1553.coefficient126_166,
  OriginalRow227TriangleData1553.coefficient126_167,
  OriginalRow227TriangleData1553.coefficient126_168,
  OriginalRow227TriangleData1553.coefficient126_169,
  OriginalRow227TriangleData1553.coefficient126_170,
  OriginalRow227TriangleData1553.coefficient126_171,
  OriginalRow227TriangleData1553.coefficient126_172,
  OriginalRow227TriangleData1553.coefficient126_173,
  OriginalRow227TriangleData1553.coefficient126_174,
  OriginalRow227TriangleData1553.coefficient126_175,
  OriginalRow227TriangleData1553.coefficient126_176,
  OriginalRow227TriangleData1553.coefficient126_177,
  OriginalRow227TriangleData1553.coefficient126_178,
  OriginalRow227TriangleData1553.coefficient126_179,
  OriginalRow227TriangleData1553.coefficient126_180,
  OriginalRow227TriangleData1553.coefficient126_181,
  OriginalRow227TriangleData1553.coefficient126_182,
  OriginalRow227TriangleData1553.coefficient126_183,
  OriginalRow227TriangleData1553.coefficient126_184,
  OriginalRow227TriangleData1553.coefficient126_185,
  OriginalRow227TriangleData1553.coefficient126_186,
  OriginalRow227TriangleData1553.coefficient126_187,
  OriginalRow227TriangleData1553.coefficient126_188
]

theorem values1553_size : values1553.size = 32 := rfl

def block1553 : ℕ → Option IntervalDyadic := segment 157 values1553

theorem block1553_domain : ExactDomain block1553 157 189 := by
  simpa only [values1553_size] using segment_domain 157 values1553

theorem block1553_get (i : Fin 32) :
    block1553 (157 + i.val) = some (values1553[i.val]'(by rw [values1553_size]; exact i.isLt)) := by
  exact segment_get 157 values1553 ⟨i.val, by rw [values1553_size]; exact i.isLt⟩

def values1554 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1554.coefficient126_189,
  OriginalRow227TriangleData1554.coefficient126_190,
  OriginalRow227TriangleData1554.coefficient126_191,
  OriginalRow227TriangleData1554.coefficient126_192,
  OriginalRow227TriangleData1554.coefficient126_193,
  OriginalRow227TriangleData1554.coefficient126_194,
  OriginalRow227TriangleData1554.coefficient126_195,
  OriginalRow227TriangleData1554.coefficient126_196,
  OriginalRow227TriangleData1554.coefficient126_197,
  OriginalRow227TriangleData1554.coefficient126_198,
  OriginalRow227TriangleData1554.coefficient126_199,
  OriginalRow227TriangleData1554.coefficient126_200,
  OriginalRow227TriangleData1554.coefficient126_201,
  OriginalRow227TriangleData1554.coefficient126_202,
  OriginalRow227TriangleData1554.coefficient126_203,
  OriginalRow227TriangleData1554.coefficient126_204,
  OriginalRow227TriangleData1554.coefficient126_205,
  OriginalRow227TriangleData1554.coefficient126_206,
  OriginalRow227TriangleData1554.coefficient126_207,
  OriginalRow227TriangleData1554.coefficient126_208,
  OriginalRow227TriangleData1554.coefficient126_209,
  OriginalRow227TriangleData1554.coefficient126_210,
  OriginalRow227TriangleData1554.coefficient126_211,
  OriginalRow227TriangleData1554.coefficient126_212,
  OriginalRow227TriangleData1554.coefficient126_213,
  OriginalRow227TriangleData1554.coefficient126_214,
  OriginalRow227TriangleData1554.coefficient126_215,
  OriginalRow227TriangleData1554.coefficient126_216,
  OriginalRow227TriangleData1554.coefficient126_217,
  OriginalRow227TriangleData1554.coefficient126_218,
  OriginalRow227TriangleData1554.coefficient126_219,
  OriginalRow227TriangleData1554.coefficient126_220
]

theorem values1554_size : values1554.size = 32 := rfl

def block1554 : ℕ → Option IntervalDyadic := segment 189 values1554

theorem block1554_domain : ExactDomain block1554 189 221 := by
  simpa only [values1554_size] using segment_domain 189 values1554

theorem block1554_get (i : Fin 32) :
    block1554 (189 + i.val) = some (values1554[i.val]'(by rw [values1554_size]; exact i.isLt)) := by
  exact segment_get 189 values1554 ⟨i.val, by rw [values1554_size]; exact i.isLt⟩

def values1555 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1555.coefficient126_221,
  OriginalRow227TriangleData1555.coefficient126_222,
  OriginalRow227TriangleData1555.coefficient126_223,
  OriginalRow227TriangleData1555.coefficient126_224,
  OriginalRow227TriangleData1555.coefficient126_225,
  OriginalRow227TriangleData1555.coefficient126_226,
  OriginalRow227TriangleData1555.coefficient126_227,
  OriginalRow227TriangleData1555.coefficient126_228,
  OriginalRow227TriangleData1555.coefficient126_229,
  OriginalRow227TriangleData1555.coefficient126_230,
  OriginalRow227TriangleData1555.coefficient126_231,
  OriginalRow227TriangleData1555.coefficient126_232,
  OriginalRow227TriangleData1555.coefficient126_233,
  OriginalRow227TriangleData1555.coefficient126_234,
  OriginalRow227TriangleData1555.coefficient126_235,
  OriginalRow227TriangleData1555.coefficient126_236,
  OriginalRow227TriangleData1555.coefficient126_237,
  OriginalRow227TriangleData1555.coefficient126_238,
  OriginalRow227TriangleData1555.coefficient126_239,
  OriginalRow227TriangleData1555.coefficient126_240,
  OriginalRow227TriangleData1555.coefficient126_241,
  OriginalRow227TriangleData1555.coefficient126_242,
  OriginalRow227TriangleData1555.coefficient126_243,
  OriginalRow227TriangleData1555.coefficient126_244,
  OriginalRow227TriangleData1555.coefficient126_245,
  OriginalRow227TriangleData1555.coefficient126_246,
  OriginalRow227TriangleData1555.coefficient126_247,
  OriginalRow227TriangleData1555.coefficient126_248,
  OriginalRow227TriangleData1555.coefficient126_249,
  OriginalRow227TriangleData1555.coefficient126_250,
  OriginalRow227TriangleData1555.coefficient126_251,
  OriginalRow227TriangleData1555.coefficient126_252
]

theorem values1555_size : values1555.size = 32 := rfl

def block1555 : ℕ → Option IntervalDyadic := segment 221 values1555

theorem block1555_domain : ExactDomain block1555 221 253 := by
  simpa only [values1555_size] using segment_domain 221 values1555

theorem block1555_get (i : Fin 32) :
    block1555 (221 + i.val) = some (values1555[i.val]'(by rw [values1555_size]; exact i.isLt)) := by
  exact segment_get 221 values1555 ⟨i.val, by rw [values1555_size]; exact i.isLt⟩

def values1556 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1556.coefficient126_253,
  OriginalRow227TriangleData1556.coefficient126_254,
  OriginalRow227TriangleData1556.coefficient126_255,
  OriginalRow227TriangleData1556.coefficient126_256,
  OriginalRow227TriangleData1556.coefficient126_257,
  OriginalRow227TriangleData1556.coefficient126_258,
  OriginalRow227TriangleData1556.coefficient126_259,
  OriginalRow227TriangleData1556.coefficient126_260,
  OriginalRow227TriangleData1556.coefficient126_261,
  OriginalRow227TriangleData1556.coefficient126_262,
  OriginalRow227TriangleData1556.coefficient126_263,
  OriginalRow227TriangleData1556.coefficient126_264,
  OriginalRow227TriangleData1556.coefficient126_265,
  OriginalRow227TriangleData1556.coefficient126_266,
  OriginalRow227TriangleData1556.coefficient126_267,
  OriginalRow227TriangleData1556.coefficient126_268,
  OriginalRow227TriangleData1556.coefficient126_269,
  OriginalRow227TriangleData1556.coefficient126_270,
  OriginalRow227TriangleData1556.coefficient126_271,
  OriginalRow227TriangleData1556.coefficient126_272,
  OriginalRow227TriangleData1556.coefficient126_273,
  OriginalRow227TriangleData1556.coefficient126_274,
  OriginalRow227TriangleData1556.coefficient126_275,
  OriginalRow227TriangleData1556.coefficient126_276,
  OriginalRow227TriangleData1556.coefficient126_277,
  OriginalRow227TriangleData1556.coefficient126_278,
  OriginalRow227TriangleData1556.coefficient126_279,
  OriginalRow227TriangleData1556.coefficient126_280,
  OriginalRow227TriangleData1556.coefficient126_281,
  OriginalRow227TriangleData1556.coefficient126_282,
  OriginalRow227TriangleData1556.coefficient126_283,
  OriginalRow227TriangleData1556.coefficient126_284
]

theorem values1556_size : values1556.size = 32 := rfl

def block1556 : ℕ → Option IntervalDyadic := segment 253 values1556

theorem block1556_domain : ExactDomain block1556 253 285 := by
  simpa only [values1556_size] using segment_domain 253 values1556

theorem block1556_get (i : Fin 32) :
    block1556 (253 + i.val) = some (values1556[i.val]'(by rw [values1556_size]; exact i.isLt)) := by
  exact segment_get 253 values1556 ⟨i.val, by rw [values1556_size]; exact i.isLt⟩

def values1557 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1557.coefficient126_285,
  OriginalRow227TriangleData1557.coefficient126_286,
  OriginalRow227TriangleData1557.coefficient126_287,
  OriginalRow227TriangleData1557.coefficient126_288,
  OriginalRow227TriangleData1557.coefficient126_289,
  OriginalRow227TriangleData1557.coefficient126_290,
  OriginalRow227TriangleData1557.coefficient126_291,
  OriginalRow227TriangleData1557.coefficient126_292,
  OriginalRow227TriangleData1557.coefficient126_293,
  OriginalRow227TriangleData1557.coefficient126_294,
  OriginalRow227TriangleData1557.coefficient126_295,
  OriginalRow227TriangleData1557.coefficient126_296,
  OriginalRow227TriangleData1557.coefficient126_297,
  OriginalRow227TriangleData1557.coefficient126_298,
  OriginalRow227TriangleData1557.coefficient126_299,
  OriginalRow227TriangleData1557.coefficient126_300,
  OriginalRow227TriangleData1557.coefficient126_301,
  OriginalRow227TriangleData1557.coefficient126_302,
  OriginalRow227TriangleData1557.coefficient126_303,
  OriginalRow227TriangleData1557.coefficient126_304,
  OriginalRow227TriangleData1557.coefficient126_305,
  OriginalRow227TriangleData1557.coefficient126_306,
  OriginalRow227TriangleData1557.coefficient126_307,
  OriginalRow227TriangleData1557.coefficient126_308,
  OriginalRow227TriangleData1557.coefficient126_309,
  OriginalRow227TriangleData1557.coefficient126_310,
  OriginalRow227TriangleData1557.coefficient126_311,
  OriginalRow227TriangleData1557.coefficient126_312,
  OriginalRow227TriangleData1557.coefficient126_313,
  OriginalRow227TriangleData1557.coefficient126_314,
  OriginalRow227TriangleData1557.coefficient126_315,
  OriginalRow227TriangleData1557.coefficient126_316
]

theorem values1557_size : values1557.size = 32 := rfl

def block1557 : ℕ → Option IntervalDyadic := segment 285 values1557

theorem block1557_domain : ExactDomain block1557 285 317 := by
  simpa only [values1557_size] using segment_domain 285 values1557

theorem block1557_get (i : Fin 32) :
    block1557 (285 + i.val) = some (values1557[i.val]'(by rw [values1557_size]; exact i.isLt)) := by
  exact segment_get 285 values1557 ⟨i.val, by rw [values1557_size]; exact i.isLt⟩

def values1558 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1558.coefficient126_317,
  OriginalRow227TriangleData1558.coefficient126_318,
  OriginalRow227TriangleData1558.coefficient126_319,
  OriginalRow227TriangleData1558.coefficient126_320,
  OriginalRow227TriangleData1558.coefficient126_321,
  OriginalRow227TriangleData1558.coefficient126_322,
  OriginalRow227TriangleData1558.coefficient126_323,
  OriginalRow227TriangleData1558.coefficient126_324,
  OriginalRow227TriangleData1558.coefficient126_325,
  OriginalRow227TriangleData1558.coefficient126_326,
  OriginalRow227TriangleData1558.coefficient126_327,
  OriginalRow227TriangleData1558.coefficient126_328,
  OriginalRow227TriangleData1558.coefficient126_329,
  OriginalRow227TriangleData1558.coefficient126_330,
  OriginalRow227TriangleData1558.coefficient126_331,
  OriginalRow227TriangleData1558.coefficient126_332,
  OriginalRow227TriangleData1558.coefficient126_333,
  OriginalRow227TriangleData1558.coefficient126_334,
  OriginalRow227TriangleData1558.coefficient126_335,
  OriginalRow227TriangleData1558.coefficient126_336,
  OriginalRow227TriangleData1558.coefficient126_337,
  OriginalRow227TriangleData1558.coefficient126_338,
  OriginalRow227TriangleData1558.coefficient126_339,
  OriginalRow227TriangleData1558.coefficient126_340,
  OriginalRow227TriangleData1558.coefficient126_341,
  OriginalRow227TriangleData1558.coefficient126_342,
  OriginalRow227TriangleData1558.coefficient126_343,
  OriginalRow227TriangleData1558.coefficient126_344,
  OriginalRow227TriangleData1558.coefficient126_345,
  OriginalRow227TriangleData1558.coefficient126_346,
  OriginalRow227TriangleData1558.coefficient126_347,
  OriginalRow227TriangleData1558.coefficient126_348
]

theorem values1558_size : values1558.size = 32 := rfl

def block1558 : ℕ → Option IntervalDyadic := segment 317 values1558

theorem block1558_domain : ExactDomain block1558 317 349 := by
  simpa only [values1558_size] using segment_domain 317 values1558

theorem block1558_get (i : Fin 32) :
    block1558 (317 + i.val) = some (values1558[i.val]'(by rw [values1558_size]; exact i.isLt)) := by
  exact segment_get 317 values1558 ⟨i.val, by rw [values1558_size]; exact i.isLt⟩

def values1559 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1559.coefficient126_349,
  OriginalRow227TriangleData1559.coefficient126_350,
  OriginalRow227TriangleData1559.coefficient126_351,
  OriginalRow227TriangleData1559.coefficient126_352,
  OriginalRow227TriangleData1559.coefficient126_353,
  OriginalRow227TriangleData1559.coefficient126_354,
  OriginalRow227TriangleData1559.coefficient126_355,
  OriginalRow227TriangleData1559.coefficient126_356,
  OriginalRow227TriangleData1559.coefficient126_357,
  OriginalRow227TriangleData1559.coefficient126_358,
  OriginalRow227TriangleData1559.coefficient126_359,
  OriginalRow227TriangleData1559.coefficient126_360,
  OriginalRow227TriangleData1559.coefficient126_361,
  OriginalRow227TriangleData1559.coefficient126_362,
  OriginalRow227TriangleData1559.coefficient126_363,
  OriginalRow227TriangleData1559.coefficient126_364,
  OriginalRow227TriangleData1559.coefficient126_365,
  OriginalRow227TriangleData1559.coefficient126_366,
  OriginalRow227TriangleData1559.coefficient126_367,
  OriginalRow227TriangleData1559.coefficient126_368,
  OriginalRow227TriangleData1559.coefficient126_369,
  OriginalRow227TriangleData1559.coefficient126_370,
  OriginalRow227TriangleData1559.coefficient126_371,
  OriginalRow227TriangleData1559.coefficient126_372,
  OriginalRow227TriangleData1559.coefficient126_373,
  OriginalRow227TriangleData1559.coefficient126_374,
  OriginalRow227TriangleData1559.coefficient126_375
]

theorem values1559_size : values1559.size = 27 := rfl

def block1559 : ℕ → Option IntervalDyadic := segment 349 values1559

theorem block1559_domain : ExactDomain block1559 349 376 := by
  simpa only [values1559_size] using segment_domain 349 values1559

theorem block1559_get (i : Fin 27) :
    block1559 (349 + i.val) = some (values1559[i.val]'(by rw [values1559_size]; exact i.isLt)) := by
  exact segment_get 349 values1559 ⟨i.val, by rw [values1559_size]; exact i.isLt⟩

def node0125_0189 : ℕ → Option IntervalDyadic := split 157 block1552 block1553

theorem node0125_0189_domain : ExactDomain node0125_0189 125 189 := by
  exact split_domain (by decide) (by decide) block1552_domain block1553_domain

def node0189_0253 : ℕ → Option IntervalDyadic := split 221 block1554 block1555

theorem node0189_0253_domain : ExactDomain node0189_0253 189 253 := by
  exact split_domain (by decide) (by decide) block1554_domain block1555_domain

def node0125_0253 : ℕ → Option IntervalDyadic := split 189 node0125_0189 node0189_0253

theorem node0125_0253_domain : ExactDomain node0125_0253 125 253 := by
  exact split_domain (by decide) (by decide) node0125_0189_domain node0189_0253_domain

def node0253_0317 : ℕ → Option IntervalDyadic := split 285 block1556 block1557

theorem node0253_0317_domain : ExactDomain node0253_0317 253 317 := by
  exact split_domain (by decide) (by decide) block1556_domain block1557_domain

def node0317_0376 : ℕ → Option IntervalDyadic := split 349 block1558 block1559

theorem node0317_0376_domain : ExactDomain node0317_0376 317 376 := by
  exact split_domain (by decide) (by decide) block1558_domain block1559_domain

def node0253_0376 : ℕ → Option IntervalDyadic := split 317 node0253_0317 node0317_0376

theorem node0253_0376_domain : ExactDomain node0253_0376 253 376 := by
  exact split_domain (by decide) (by decide) node0253_0317_domain node0317_0376_domain

def node0125_0376 : ℕ → Option IntervalDyadic := split 253 node0125_0253 node0253_0376

theorem node0125_0376_domain : ExactDomain node0125_0376 125 376 := by
  exact split_domain (by decide) (by decide) node0125_0253_domain node0253_0376_domain

def lookup : ℕ → Option IntervalDyadic := node0125_0376

theorem lookup_domain : ExactDomain lookup 125 376 :=
  node0125_0376_domain

theorem block1552_lookup (i : Fin 32) :
    lookup (125 + i.val) = some (values1552[i.val]'(by rw [values1552_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (125 + i.val) = _
  rw [node0125_0376, split_left 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0125_0253, split_left 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0125_0189, split_left 157 block1552 block1553 (by omega)]
  exact block1552_get i

theorem block1553_lookup (i : Fin 32) :
    lookup (157 + i.val) = some (values1553[i.val]'(by rw [values1553_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (157 + i.val) = _
  rw [node0125_0376, split_left 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0125_0253, split_left 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0125_0189, split_right 157 block1552 block1553 (by omega)]
  exact block1553_get i

theorem block1554_lookup (i : Fin 32) :
    lookup (189 + i.val) = some (values1554[i.val]'(by rw [values1554_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (189 + i.val) = _
  rw [node0125_0376, split_left 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0125_0253, split_right 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0189_0253, split_left 221 block1554 block1555 (by omega)]
  exact block1554_get i

theorem block1555_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values1555[i.val]'(by rw [values1555_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (221 + i.val) = _
  rw [node0125_0376, split_left 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0125_0253, split_right 189 node0125_0189 node0189_0253 (by omega)]
  rw [node0189_0253, split_right 221 block1554 block1555 (by omega)]
  exact block1555_get i

theorem block1556_lookup (i : Fin 32) :
    lookup (253 + i.val) = some (values1556[i.val]'(by rw [values1556_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (253 + i.val) = _
  rw [node0125_0376, split_right 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0253_0376, split_left 317 node0253_0317 node0317_0376 (by omega)]
  rw [node0253_0317, split_left 285 block1556 block1557 (by omega)]
  exact block1556_get i

theorem block1557_lookup (i : Fin 32) :
    lookup (285 + i.val) = some (values1557[i.val]'(by rw [values1557_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (285 + i.val) = _
  rw [node0125_0376, split_right 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0253_0376, split_left 317 node0253_0317 node0317_0376 (by omega)]
  rw [node0253_0317, split_right 285 block1556 block1557 (by omega)]
  exact block1557_get i

theorem block1558_lookup (i : Fin 32) :
    lookup (317 + i.val) = some (values1558[i.val]'(by rw [values1558_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (317 + i.val) = _
  rw [node0125_0376, split_right 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0253_0376, split_right 317 node0253_0317 node0317_0376 (by omega)]
  rw [node0317_0376, split_left 349 block1558 block1559 (by omega)]
  exact block1558_get i

theorem block1559_lookup (i : Fin 27) :
    lookup (349 + i.val) = some (values1559[i.val]'(by rw [values1559_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0125_0376 (349 + i.val) = _
  rw [node0125_0376, split_right 253 node0125_0253 node0253_0376 (by omega)]
  rw [node0253_0376, split_right 317 node0253_0317 node0317_0376 (by omega)]
  rw [node0317_0376, split_right 349 block1558 block1559 (by omega)]
  exact block1559_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1552_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1552_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1553_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1553_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1554_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1554_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1555_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1555_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1556_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1556_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1557_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1557_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1558_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1558_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1559_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1559_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1552_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1553_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1554_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1555_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1556_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1557_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1558_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow126.block1559_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow126
