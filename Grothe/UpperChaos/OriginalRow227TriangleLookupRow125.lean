import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1544
import Grothe.UpperChaos.OriginalRow227TriangleData1545
import Grothe.UpperChaos.OriginalRow227TriangleData1546
import Grothe.UpperChaos.OriginalRow227TriangleData1547
import Grothe.UpperChaos.OriginalRow227TriangleData1548
import Grothe.UpperChaos.OriginalRow227TriangleData1549
import Grothe.UpperChaos.OriginalRow227TriangleData1550
import Grothe.UpperChaos.OriginalRow227TriangleData1551

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow125

open ConditionalTableLookup

def values1544 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1544.coefficient125_124,
  OriginalRow227TriangleData1544.coefficient125_125,
  OriginalRow227TriangleData1544.coefficient125_126,
  OriginalRow227TriangleData1544.coefficient125_127,
  OriginalRow227TriangleData1544.coefficient125_128,
  OriginalRow227TriangleData1544.coefficient125_129,
  OriginalRow227TriangleData1544.coefficient125_130,
  OriginalRow227TriangleData1544.coefficient125_131,
  OriginalRow227TriangleData1544.coefficient125_132,
  OriginalRow227TriangleData1544.coefficient125_133,
  OriginalRow227TriangleData1544.coefficient125_134,
  OriginalRow227TriangleData1544.coefficient125_135,
  OriginalRow227TriangleData1544.coefficient125_136,
  OriginalRow227TriangleData1544.coefficient125_137,
  OriginalRow227TriangleData1544.coefficient125_138,
  OriginalRow227TriangleData1544.coefficient125_139,
  OriginalRow227TriangleData1544.coefficient125_140,
  OriginalRow227TriangleData1544.coefficient125_141,
  OriginalRow227TriangleData1544.coefficient125_142,
  OriginalRow227TriangleData1544.coefficient125_143,
  OriginalRow227TriangleData1544.coefficient125_144,
  OriginalRow227TriangleData1544.coefficient125_145,
  OriginalRow227TriangleData1544.coefficient125_146,
  OriginalRow227TriangleData1544.coefficient125_147,
  OriginalRow227TriangleData1544.coefficient125_148,
  OriginalRow227TriangleData1544.coefficient125_149,
  OriginalRow227TriangleData1544.coefficient125_150,
  OriginalRow227TriangleData1544.coefficient125_151,
  OriginalRow227TriangleData1544.coefficient125_152,
  OriginalRow227TriangleData1544.coefficient125_153,
  OriginalRow227TriangleData1544.coefficient125_154,
  OriginalRow227TriangleData1544.coefficient125_155
]

theorem values1544_size : values1544.size = 32 := rfl

def block1544 : ℕ → Option IntervalDyadic := segment 124 values1544

theorem block1544_domain : ExactDomain block1544 124 156 := by
  simpa only [values1544_size] using segment_domain 124 values1544

theorem block1544_get (i : Fin 32) :
    block1544 (124 + i.val) = some (values1544[i.val]'(by rw [values1544_size]; exact i.isLt)) := by
  exact segment_get 124 values1544 ⟨i.val, by rw [values1544_size]; exact i.isLt⟩

def values1545 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1545.coefficient125_156,
  OriginalRow227TriangleData1545.coefficient125_157,
  OriginalRow227TriangleData1545.coefficient125_158,
  OriginalRow227TriangleData1545.coefficient125_159,
  OriginalRow227TriangleData1545.coefficient125_160,
  OriginalRow227TriangleData1545.coefficient125_161,
  OriginalRow227TriangleData1545.coefficient125_162,
  OriginalRow227TriangleData1545.coefficient125_163,
  OriginalRow227TriangleData1545.coefficient125_164,
  OriginalRow227TriangleData1545.coefficient125_165,
  OriginalRow227TriangleData1545.coefficient125_166,
  OriginalRow227TriangleData1545.coefficient125_167,
  OriginalRow227TriangleData1545.coefficient125_168,
  OriginalRow227TriangleData1545.coefficient125_169,
  OriginalRow227TriangleData1545.coefficient125_170,
  OriginalRow227TriangleData1545.coefficient125_171,
  OriginalRow227TriangleData1545.coefficient125_172,
  OriginalRow227TriangleData1545.coefficient125_173,
  OriginalRow227TriangleData1545.coefficient125_174,
  OriginalRow227TriangleData1545.coefficient125_175,
  OriginalRow227TriangleData1545.coefficient125_176,
  OriginalRow227TriangleData1545.coefficient125_177,
  OriginalRow227TriangleData1545.coefficient125_178,
  OriginalRow227TriangleData1545.coefficient125_179,
  OriginalRow227TriangleData1545.coefficient125_180,
  OriginalRow227TriangleData1545.coefficient125_181,
  OriginalRow227TriangleData1545.coefficient125_182,
  OriginalRow227TriangleData1545.coefficient125_183,
  OriginalRow227TriangleData1545.coefficient125_184,
  OriginalRow227TriangleData1545.coefficient125_185,
  OriginalRow227TriangleData1545.coefficient125_186,
  OriginalRow227TriangleData1545.coefficient125_187
]

theorem values1545_size : values1545.size = 32 := rfl

def block1545 : ℕ → Option IntervalDyadic := segment 156 values1545

theorem block1545_domain : ExactDomain block1545 156 188 := by
  simpa only [values1545_size] using segment_domain 156 values1545

theorem block1545_get (i : Fin 32) :
    block1545 (156 + i.val) = some (values1545[i.val]'(by rw [values1545_size]; exact i.isLt)) := by
  exact segment_get 156 values1545 ⟨i.val, by rw [values1545_size]; exact i.isLt⟩

def values1546 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1546.coefficient125_188,
  OriginalRow227TriangleData1546.coefficient125_189,
  OriginalRow227TriangleData1546.coefficient125_190,
  OriginalRow227TriangleData1546.coefficient125_191,
  OriginalRow227TriangleData1546.coefficient125_192,
  OriginalRow227TriangleData1546.coefficient125_193,
  OriginalRow227TriangleData1546.coefficient125_194,
  OriginalRow227TriangleData1546.coefficient125_195,
  OriginalRow227TriangleData1546.coefficient125_196,
  OriginalRow227TriangleData1546.coefficient125_197,
  OriginalRow227TriangleData1546.coefficient125_198,
  OriginalRow227TriangleData1546.coefficient125_199,
  OriginalRow227TriangleData1546.coefficient125_200,
  OriginalRow227TriangleData1546.coefficient125_201,
  OriginalRow227TriangleData1546.coefficient125_202,
  OriginalRow227TriangleData1546.coefficient125_203,
  OriginalRow227TriangleData1546.coefficient125_204,
  OriginalRow227TriangleData1546.coefficient125_205,
  OriginalRow227TriangleData1546.coefficient125_206,
  OriginalRow227TriangleData1546.coefficient125_207,
  OriginalRow227TriangleData1546.coefficient125_208,
  OriginalRow227TriangleData1546.coefficient125_209,
  OriginalRow227TriangleData1546.coefficient125_210,
  OriginalRow227TriangleData1546.coefficient125_211,
  OriginalRow227TriangleData1546.coefficient125_212,
  OriginalRow227TriangleData1546.coefficient125_213,
  OriginalRow227TriangleData1546.coefficient125_214,
  OriginalRow227TriangleData1546.coefficient125_215,
  OriginalRow227TriangleData1546.coefficient125_216,
  OriginalRow227TriangleData1546.coefficient125_217,
  OriginalRow227TriangleData1546.coefficient125_218,
  OriginalRow227TriangleData1546.coefficient125_219
]

theorem values1546_size : values1546.size = 32 := rfl

def block1546 : ℕ → Option IntervalDyadic := segment 188 values1546

theorem block1546_domain : ExactDomain block1546 188 220 := by
  simpa only [values1546_size] using segment_domain 188 values1546

theorem block1546_get (i : Fin 32) :
    block1546 (188 + i.val) = some (values1546[i.val]'(by rw [values1546_size]; exact i.isLt)) := by
  exact segment_get 188 values1546 ⟨i.val, by rw [values1546_size]; exact i.isLt⟩

def values1547 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1547.coefficient125_220,
  OriginalRow227TriangleData1547.coefficient125_221,
  OriginalRow227TriangleData1547.coefficient125_222,
  OriginalRow227TriangleData1547.coefficient125_223,
  OriginalRow227TriangleData1547.coefficient125_224,
  OriginalRow227TriangleData1547.coefficient125_225,
  OriginalRow227TriangleData1547.coefficient125_226,
  OriginalRow227TriangleData1547.coefficient125_227,
  OriginalRow227TriangleData1547.coefficient125_228,
  OriginalRow227TriangleData1547.coefficient125_229,
  OriginalRow227TriangleData1547.coefficient125_230,
  OriginalRow227TriangleData1547.coefficient125_231,
  OriginalRow227TriangleData1547.coefficient125_232,
  OriginalRow227TriangleData1547.coefficient125_233,
  OriginalRow227TriangleData1547.coefficient125_234,
  OriginalRow227TriangleData1547.coefficient125_235,
  OriginalRow227TriangleData1547.coefficient125_236,
  OriginalRow227TriangleData1547.coefficient125_237,
  OriginalRow227TriangleData1547.coefficient125_238,
  OriginalRow227TriangleData1547.coefficient125_239,
  OriginalRow227TriangleData1547.coefficient125_240,
  OriginalRow227TriangleData1547.coefficient125_241,
  OriginalRow227TriangleData1547.coefficient125_242,
  OriginalRow227TriangleData1547.coefficient125_243,
  OriginalRow227TriangleData1547.coefficient125_244,
  OriginalRow227TriangleData1547.coefficient125_245,
  OriginalRow227TriangleData1547.coefficient125_246,
  OriginalRow227TriangleData1547.coefficient125_247,
  OriginalRow227TriangleData1547.coefficient125_248,
  OriginalRow227TriangleData1547.coefficient125_249,
  OriginalRow227TriangleData1547.coefficient125_250,
  OriginalRow227TriangleData1547.coefficient125_251
]

theorem values1547_size : values1547.size = 32 := rfl

def block1547 : ℕ → Option IntervalDyadic := segment 220 values1547

theorem block1547_domain : ExactDomain block1547 220 252 := by
  simpa only [values1547_size] using segment_domain 220 values1547

theorem block1547_get (i : Fin 32) :
    block1547 (220 + i.val) = some (values1547[i.val]'(by rw [values1547_size]; exact i.isLt)) := by
  exact segment_get 220 values1547 ⟨i.val, by rw [values1547_size]; exact i.isLt⟩

def values1548 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1548.coefficient125_252,
  OriginalRow227TriangleData1548.coefficient125_253,
  OriginalRow227TriangleData1548.coefficient125_254,
  OriginalRow227TriangleData1548.coefficient125_255,
  OriginalRow227TriangleData1548.coefficient125_256,
  OriginalRow227TriangleData1548.coefficient125_257,
  OriginalRow227TriangleData1548.coefficient125_258,
  OriginalRow227TriangleData1548.coefficient125_259,
  OriginalRow227TriangleData1548.coefficient125_260,
  OriginalRow227TriangleData1548.coefficient125_261,
  OriginalRow227TriangleData1548.coefficient125_262,
  OriginalRow227TriangleData1548.coefficient125_263,
  OriginalRow227TriangleData1548.coefficient125_264,
  OriginalRow227TriangleData1548.coefficient125_265,
  OriginalRow227TriangleData1548.coefficient125_266,
  OriginalRow227TriangleData1548.coefficient125_267,
  OriginalRow227TriangleData1548.coefficient125_268,
  OriginalRow227TriangleData1548.coefficient125_269,
  OriginalRow227TriangleData1548.coefficient125_270,
  OriginalRow227TriangleData1548.coefficient125_271,
  OriginalRow227TriangleData1548.coefficient125_272,
  OriginalRow227TriangleData1548.coefficient125_273,
  OriginalRow227TriangleData1548.coefficient125_274,
  OriginalRow227TriangleData1548.coefficient125_275,
  OriginalRow227TriangleData1548.coefficient125_276,
  OriginalRow227TriangleData1548.coefficient125_277,
  OriginalRow227TriangleData1548.coefficient125_278,
  OriginalRow227TriangleData1548.coefficient125_279,
  OriginalRow227TriangleData1548.coefficient125_280,
  OriginalRow227TriangleData1548.coefficient125_281,
  OriginalRow227TriangleData1548.coefficient125_282,
  OriginalRow227TriangleData1548.coefficient125_283
]

theorem values1548_size : values1548.size = 32 := rfl

def block1548 : ℕ → Option IntervalDyadic := segment 252 values1548

theorem block1548_domain : ExactDomain block1548 252 284 := by
  simpa only [values1548_size] using segment_domain 252 values1548

theorem block1548_get (i : Fin 32) :
    block1548 (252 + i.val) = some (values1548[i.val]'(by rw [values1548_size]; exact i.isLt)) := by
  exact segment_get 252 values1548 ⟨i.val, by rw [values1548_size]; exact i.isLt⟩

def values1549 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1549.coefficient125_284,
  OriginalRow227TriangleData1549.coefficient125_285,
  OriginalRow227TriangleData1549.coefficient125_286,
  OriginalRow227TriangleData1549.coefficient125_287,
  OriginalRow227TriangleData1549.coefficient125_288,
  OriginalRow227TriangleData1549.coefficient125_289,
  OriginalRow227TriangleData1549.coefficient125_290,
  OriginalRow227TriangleData1549.coefficient125_291,
  OriginalRow227TriangleData1549.coefficient125_292,
  OriginalRow227TriangleData1549.coefficient125_293,
  OriginalRow227TriangleData1549.coefficient125_294,
  OriginalRow227TriangleData1549.coefficient125_295,
  OriginalRow227TriangleData1549.coefficient125_296,
  OriginalRow227TriangleData1549.coefficient125_297,
  OriginalRow227TriangleData1549.coefficient125_298,
  OriginalRow227TriangleData1549.coefficient125_299,
  OriginalRow227TriangleData1549.coefficient125_300,
  OriginalRow227TriangleData1549.coefficient125_301,
  OriginalRow227TriangleData1549.coefficient125_302,
  OriginalRow227TriangleData1549.coefficient125_303,
  OriginalRow227TriangleData1549.coefficient125_304,
  OriginalRow227TriangleData1549.coefficient125_305,
  OriginalRow227TriangleData1549.coefficient125_306,
  OriginalRow227TriangleData1549.coefficient125_307,
  OriginalRow227TriangleData1549.coefficient125_308,
  OriginalRow227TriangleData1549.coefficient125_309,
  OriginalRow227TriangleData1549.coefficient125_310,
  OriginalRow227TriangleData1549.coefficient125_311,
  OriginalRow227TriangleData1549.coefficient125_312,
  OriginalRow227TriangleData1549.coefficient125_313,
  OriginalRow227TriangleData1549.coefficient125_314,
  OriginalRow227TriangleData1549.coefficient125_315
]

theorem values1549_size : values1549.size = 32 := rfl

def block1549 : ℕ → Option IntervalDyadic := segment 284 values1549

theorem block1549_domain : ExactDomain block1549 284 316 := by
  simpa only [values1549_size] using segment_domain 284 values1549

theorem block1549_get (i : Fin 32) :
    block1549 (284 + i.val) = some (values1549[i.val]'(by rw [values1549_size]; exact i.isLt)) := by
  exact segment_get 284 values1549 ⟨i.val, by rw [values1549_size]; exact i.isLt⟩

def values1550 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1550.coefficient125_316,
  OriginalRow227TriangleData1550.coefficient125_317,
  OriginalRow227TriangleData1550.coefficient125_318,
  OriginalRow227TriangleData1550.coefficient125_319,
  OriginalRow227TriangleData1550.coefficient125_320,
  OriginalRow227TriangleData1550.coefficient125_321,
  OriginalRow227TriangleData1550.coefficient125_322,
  OriginalRow227TriangleData1550.coefficient125_323,
  OriginalRow227TriangleData1550.coefficient125_324,
  OriginalRow227TriangleData1550.coefficient125_325,
  OriginalRow227TriangleData1550.coefficient125_326,
  OriginalRow227TriangleData1550.coefficient125_327,
  OriginalRow227TriangleData1550.coefficient125_328,
  OriginalRow227TriangleData1550.coefficient125_329,
  OriginalRow227TriangleData1550.coefficient125_330,
  OriginalRow227TriangleData1550.coefficient125_331,
  OriginalRow227TriangleData1550.coefficient125_332,
  OriginalRow227TriangleData1550.coefficient125_333,
  OriginalRow227TriangleData1550.coefficient125_334,
  OriginalRow227TriangleData1550.coefficient125_335,
  OriginalRow227TriangleData1550.coefficient125_336,
  OriginalRow227TriangleData1550.coefficient125_337,
  OriginalRow227TriangleData1550.coefficient125_338,
  OriginalRow227TriangleData1550.coefficient125_339,
  OriginalRow227TriangleData1550.coefficient125_340,
  OriginalRow227TriangleData1550.coefficient125_341,
  OriginalRow227TriangleData1550.coefficient125_342,
  OriginalRow227TriangleData1550.coefficient125_343,
  OriginalRow227TriangleData1550.coefficient125_344,
  OriginalRow227TriangleData1550.coefficient125_345,
  OriginalRow227TriangleData1550.coefficient125_346,
  OriginalRow227TriangleData1550.coefficient125_347
]

theorem values1550_size : values1550.size = 32 := rfl

def block1550 : ℕ → Option IntervalDyadic := segment 316 values1550

theorem block1550_domain : ExactDomain block1550 316 348 := by
  simpa only [values1550_size] using segment_domain 316 values1550

theorem block1550_get (i : Fin 32) :
    block1550 (316 + i.val) = some (values1550[i.val]'(by rw [values1550_size]; exact i.isLt)) := by
  exact segment_get 316 values1550 ⟨i.val, by rw [values1550_size]; exact i.isLt⟩

def values1551 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1551.coefficient125_348,
  OriginalRow227TriangleData1551.coefficient125_349,
  OriginalRow227TriangleData1551.coefficient125_350,
  OriginalRow227TriangleData1551.coefficient125_351,
  OriginalRow227TriangleData1551.coefficient125_352,
  OriginalRow227TriangleData1551.coefficient125_353,
  OriginalRow227TriangleData1551.coefficient125_354,
  OriginalRow227TriangleData1551.coefficient125_355,
  OriginalRow227TriangleData1551.coefficient125_356,
  OriginalRow227TriangleData1551.coefficient125_357,
  OriginalRow227TriangleData1551.coefficient125_358,
  OriginalRow227TriangleData1551.coefficient125_359,
  OriginalRow227TriangleData1551.coefficient125_360,
  OriginalRow227TriangleData1551.coefficient125_361,
  OriginalRow227TriangleData1551.coefficient125_362,
  OriginalRow227TriangleData1551.coefficient125_363,
  OriginalRow227TriangleData1551.coefficient125_364,
  OriginalRow227TriangleData1551.coefficient125_365,
  OriginalRow227TriangleData1551.coefficient125_366,
  OriginalRow227TriangleData1551.coefficient125_367,
  OriginalRow227TriangleData1551.coefficient125_368,
  OriginalRow227TriangleData1551.coefficient125_369,
  OriginalRow227TriangleData1551.coefficient125_370,
  OriginalRow227TriangleData1551.coefficient125_371,
  OriginalRow227TriangleData1551.coefficient125_372,
  OriginalRow227TriangleData1551.coefficient125_373,
  OriginalRow227TriangleData1551.coefficient125_374,
  OriginalRow227TriangleData1551.coefficient125_375,
  OriginalRow227TriangleData1551.coefficient125_376
]

theorem values1551_size : values1551.size = 29 := rfl

def block1551 : ℕ → Option IntervalDyadic := segment 348 values1551

theorem block1551_domain : ExactDomain block1551 348 377 := by
  simpa only [values1551_size] using segment_domain 348 values1551

theorem block1551_get (i : Fin 29) :
    block1551 (348 + i.val) = some (values1551[i.val]'(by rw [values1551_size]; exact i.isLt)) := by
  exact segment_get 348 values1551 ⟨i.val, by rw [values1551_size]; exact i.isLt⟩

def node0124_0188 : ℕ → Option IntervalDyadic := split 156 block1544 block1545

theorem node0124_0188_domain : ExactDomain node0124_0188 124 188 := by
  exact split_domain (by decide) (by decide) block1544_domain block1545_domain

def node0188_0252 : ℕ → Option IntervalDyadic := split 220 block1546 block1547

theorem node0188_0252_domain : ExactDomain node0188_0252 188 252 := by
  exact split_domain (by decide) (by decide) block1546_domain block1547_domain

def node0124_0252 : ℕ → Option IntervalDyadic := split 188 node0124_0188 node0188_0252

theorem node0124_0252_domain : ExactDomain node0124_0252 124 252 := by
  exact split_domain (by decide) (by decide) node0124_0188_domain node0188_0252_domain

def node0252_0316 : ℕ → Option IntervalDyadic := split 284 block1548 block1549

theorem node0252_0316_domain : ExactDomain node0252_0316 252 316 := by
  exact split_domain (by decide) (by decide) block1548_domain block1549_domain

def node0316_0377 : ℕ → Option IntervalDyadic := split 348 block1550 block1551

theorem node0316_0377_domain : ExactDomain node0316_0377 316 377 := by
  exact split_domain (by decide) (by decide) block1550_domain block1551_domain

def node0252_0377 : ℕ → Option IntervalDyadic := split 316 node0252_0316 node0316_0377

theorem node0252_0377_domain : ExactDomain node0252_0377 252 377 := by
  exact split_domain (by decide) (by decide) node0252_0316_domain node0316_0377_domain

def node0124_0377 : ℕ → Option IntervalDyadic := split 252 node0124_0252 node0252_0377

theorem node0124_0377_domain : ExactDomain node0124_0377 124 377 := by
  exact split_domain (by decide) (by decide) node0124_0252_domain node0252_0377_domain

def lookup : ℕ → Option IntervalDyadic := node0124_0377

theorem lookup_domain : ExactDomain lookup 124 377 :=
  node0124_0377_domain

theorem block1544_lookup (i : Fin 32) :
    lookup (124 + i.val) = some (values1544[i.val]'(by rw [values1544_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (124 + i.val) = _
  rw [node0124_0377, split_left 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0124_0252, split_left 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0124_0188, split_left 156 block1544 block1545 (by omega)]
  exact block1544_get i

theorem block1545_lookup (i : Fin 32) :
    lookup (156 + i.val) = some (values1545[i.val]'(by rw [values1545_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (156 + i.val) = _
  rw [node0124_0377, split_left 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0124_0252, split_left 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0124_0188, split_right 156 block1544 block1545 (by omega)]
  exact block1545_get i

theorem block1546_lookup (i : Fin 32) :
    lookup (188 + i.val) = some (values1546[i.val]'(by rw [values1546_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (188 + i.val) = _
  rw [node0124_0377, split_left 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0124_0252, split_right 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0188_0252, split_left 220 block1546 block1547 (by omega)]
  exact block1546_get i

theorem block1547_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values1547[i.val]'(by rw [values1547_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (220 + i.val) = _
  rw [node0124_0377, split_left 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0124_0252, split_right 188 node0124_0188 node0188_0252 (by omega)]
  rw [node0188_0252, split_right 220 block1546 block1547 (by omega)]
  exact block1547_get i

theorem block1548_lookup (i : Fin 32) :
    lookup (252 + i.val) = some (values1548[i.val]'(by rw [values1548_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (252 + i.val) = _
  rw [node0124_0377, split_right 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0252_0377, split_left 316 node0252_0316 node0316_0377 (by omega)]
  rw [node0252_0316, split_left 284 block1548 block1549 (by omega)]
  exact block1548_get i

theorem block1549_lookup (i : Fin 32) :
    lookup (284 + i.val) = some (values1549[i.val]'(by rw [values1549_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (284 + i.val) = _
  rw [node0124_0377, split_right 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0252_0377, split_left 316 node0252_0316 node0316_0377 (by omega)]
  rw [node0252_0316, split_right 284 block1548 block1549 (by omega)]
  exact block1549_get i

theorem block1550_lookup (i : Fin 32) :
    lookup (316 + i.val) = some (values1550[i.val]'(by rw [values1550_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (316 + i.val) = _
  rw [node0124_0377, split_right 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0252_0377, split_right 316 node0252_0316 node0316_0377 (by omega)]
  rw [node0316_0377, split_left 348 block1550 block1551 (by omega)]
  exact block1550_get i

theorem block1551_lookup (i : Fin 29) :
    lookup (348 + i.val) = some (values1551[i.val]'(by rw [values1551_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0124_0377 (348 + i.val) = _
  rw [node0124_0377, split_right 252 node0124_0252 node0252_0377 (by omega)]
  rw [node0252_0377, split_right 316 node0252_0316 node0316_0377 (by omega)]
  rw [node0316_0377, split_right 348 block1550 block1551 (by omega)]
  exact block1551_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1544_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1544_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1545_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1545_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1546_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1546_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1547_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1547_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1548_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1548_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1549_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1549_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1550_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1550_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1551_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1551_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1544_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1545_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1546_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1547_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1548_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1549_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1550_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow125.block1551_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow125
