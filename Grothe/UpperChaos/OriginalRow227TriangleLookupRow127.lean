import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1560
import Grothe.UpperChaos.OriginalRow227TriangleData1561
import Grothe.UpperChaos.OriginalRow227TriangleData1562
import Grothe.UpperChaos.OriginalRow227TriangleData1563
import Grothe.UpperChaos.OriginalRow227TriangleData1564
import Grothe.UpperChaos.OriginalRow227TriangleData1565
import Grothe.UpperChaos.OriginalRow227TriangleData1566
import Grothe.UpperChaos.OriginalRow227TriangleData1567

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow127

open ConditionalTableLookup

def values1560 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1560.coefficient127_126,
  OriginalRow227TriangleData1560.coefficient127_127,
  OriginalRow227TriangleData1560.coefficient127_128,
  OriginalRow227TriangleData1560.coefficient127_129,
  OriginalRow227TriangleData1560.coefficient127_130,
  OriginalRow227TriangleData1560.coefficient127_131,
  OriginalRow227TriangleData1560.coefficient127_132,
  OriginalRow227TriangleData1560.coefficient127_133,
  OriginalRow227TriangleData1560.coefficient127_134,
  OriginalRow227TriangleData1560.coefficient127_135,
  OriginalRow227TriangleData1560.coefficient127_136,
  OriginalRow227TriangleData1560.coefficient127_137,
  OriginalRow227TriangleData1560.coefficient127_138,
  OriginalRow227TriangleData1560.coefficient127_139,
  OriginalRow227TriangleData1560.coefficient127_140,
  OriginalRow227TriangleData1560.coefficient127_141,
  OriginalRow227TriangleData1560.coefficient127_142,
  OriginalRow227TriangleData1560.coefficient127_143,
  OriginalRow227TriangleData1560.coefficient127_144,
  OriginalRow227TriangleData1560.coefficient127_145,
  OriginalRow227TriangleData1560.coefficient127_146,
  OriginalRow227TriangleData1560.coefficient127_147,
  OriginalRow227TriangleData1560.coefficient127_148,
  OriginalRow227TriangleData1560.coefficient127_149,
  OriginalRow227TriangleData1560.coefficient127_150,
  OriginalRow227TriangleData1560.coefficient127_151,
  OriginalRow227TriangleData1560.coefficient127_152,
  OriginalRow227TriangleData1560.coefficient127_153,
  OriginalRow227TriangleData1560.coefficient127_154,
  OriginalRow227TriangleData1560.coefficient127_155,
  OriginalRow227TriangleData1560.coefficient127_156,
  OriginalRow227TriangleData1560.coefficient127_157
]

theorem values1560_size : values1560.size = 32 := rfl

def block1560 : ℕ → Option IntervalDyadic := segment 126 values1560

theorem block1560_domain : ExactDomain block1560 126 158 := by
  simpa only [values1560_size] using segment_domain 126 values1560

theorem block1560_get (i : Fin 32) :
    block1560 (126 + i.val) = some (values1560[i.val]'(by rw [values1560_size]; exact i.isLt)) := by
  exact segment_get 126 values1560 ⟨i.val, by rw [values1560_size]; exact i.isLt⟩

def values1561 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1561.coefficient127_158,
  OriginalRow227TriangleData1561.coefficient127_159,
  OriginalRow227TriangleData1561.coefficient127_160,
  OriginalRow227TriangleData1561.coefficient127_161,
  OriginalRow227TriangleData1561.coefficient127_162,
  OriginalRow227TriangleData1561.coefficient127_163,
  OriginalRow227TriangleData1561.coefficient127_164,
  OriginalRow227TriangleData1561.coefficient127_165,
  OriginalRow227TriangleData1561.coefficient127_166,
  OriginalRow227TriangleData1561.coefficient127_167,
  OriginalRow227TriangleData1561.coefficient127_168,
  OriginalRow227TriangleData1561.coefficient127_169,
  OriginalRow227TriangleData1561.coefficient127_170,
  OriginalRow227TriangleData1561.coefficient127_171,
  OriginalRow227TriangleData1561.coefficient127_172,
  OriginalRow227TriangleData1561.coefficient127_173,
  OriginalRow227TriangleData1561.coefficient127_174,
  OriginalRow227TriangleData1561.coefficient127_175,
  OriginalRow227TriangleData1561.coefficient127_176,
  OriginalRow227TriangleData1561.coefficient127_177,
  OriginalRow227TriangleData1561.coefficient127_178,
  OriginalRow227TriangleData1561.coefficient127_179,
  OriginalRow227TriangleData1561.coefficient127_180,
  OriginalRow227TriangleData1561.coefficient127_181,
  OriginalRow227TriangleData1561.coefficient127_182,
  OriginalRow227TriangleData1561.coefficient127_183,
  OriginalRow227TriangleData1561.coefficient127_184,
  OriginalRow227TriangleData1561.coefficient127_185,
  OriginalRow227TriangleData1561.coefficient127_186,
  OriginalRow227TriangleData1561.coefficient127_187,
  OriginalRow227TriangleData1561.coefficient127_188,
  OriginalRow227TriangleData1561.coefficient127_189
]

theorem values1561_size : values1561.size = 32 := rfl

def block1561 : ℕ → Option IntervalDyadic := segment 158 values1561

theorem block1561_domain : ExactDomain block1561 158 190 := by
  simpa only [values1561_size] using segment_domain 158 values1561

theorem block1561_get (i : Fin 32) :
    block1561 (158 + i.val) = some (values1561[i.val]'(by rw [values1561_size]; exact i.isLt)) := by
  exact segment_get 158 values1561 ⟨i.val, by rw [values1561_size]; exact i.isLt⟩

def values1562 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1562.coefficient127_190,
  OriginalRow227TriangleData1562.coefficient127_191,
  OriginalRow227TriangleData1562.coefficient127_192,
  OriginalRow227TriangleData1562.coefficient127_193,
  OriginalRow227TriangleData1562.coefficient127_194,
  OriginalRow227TriangleData1562.coefficient127_195,
  OriginalRow227TriangleData1562.coefficient127_196,
  OriginalRow227TriangleData1562.coefficient127_197,
  OriginalRow227TriangleData1562.coefficient127_198,
  OriginalRow227TriangleData1562.coefficient127_199,
  OriginalRow227TriangleData1562.coefficient127_200,
  OriginalRow227TriangleData1562.coefficient127_201,
  OriginalRow227TriangleData1562.coefficient127_202,
  OriginalRow227TriangleData1562.coefficient127_203,
  OriginalRow227TriangleData1562.coefficient127_204,
  OriginalRow227TriangleData1562.coefficient127_205,
  OriginalRow227TriangleData1562.coefficient127_206,
  OriginalRow227TriangleData1562.coefficient127_207,
  OriginalRow227TriangleData1562.coefficient127_208,
  OriginalRow227TriangleData1562.coefficient127_209,
  OriginalRow227TriangleData1562.coefficient127_210,
  OriginalRow227TriangleData1562.coefficient127_211,
  OriginalRow227TriangleData1562.coefficient127_212,
  OriginalRow227TriangleData1562.coefficient127_213,
  OriginalRow227TriangleData1562.coefficient127_214,
  OriginalRow227TriangleData1562.coefficient127_215,
  OriginalRow227TriangleData1562.coefficient127_216,
  OriginalRow227TriangleData1562.coefficient127_217,
  OriginalRow227TriangleData1562.coefficient127_218,
  OriginalRow227TriangleData1562.coefficient127_219,
  OriginalRow227TriangleData1562.coefficient127_220,
  OriginalRow227TriangleData1562.coefficient127_221
]

theorem values1562_size : values1562.size = 32 := rfl

def block1562 : ℕ → Option IntervalDyadic := segment 190 values1562

theorem block1562_domain : ExactDomain block1562 190 222 := by
  simpa only [values1562_size] using segment_domain 190 values1562

theorem block1562_get (i : Fin 32) :
    block1562 (190 + i.val) = some (values1562[i.val]'(by rw [values1562_size]; exact i.isLt)) := by
  exact segment_get 190 values1562 ⟨i.val, by rw [values1562_size]; exact i.isLt⟩

def values1563 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1563.coefficient127_222,
  OriginalRow227TriangleData1563.coefficient127_223,
  OriginalRow227TriangleData1563.coefficient127_224,
  OriginalRow227TriangleData1563.coefficient127_225,
  OriginalRow227TriangleData1563.coefficient127_226,
  OriginalRow227TriangleData1563.coefficient127_227,
  OriginalRow227TriangleData1563.coefficient127_228,
  OriginalRow227TriangleData1563.coefficient127_229,
  OriginalRow227TriangleData1563.coefficient127_230,
  OriginalRow227TriangleData1563.coefficient127_231,
  OriginalRow227TriangleData1563.coefficient127_232,
  OriginalRow227TriangleData1563.coefficient127_233,
  OriginalRow227TriangleData1563.coefficient127_234,
  OriginalRow227TriangleData1563.coefficient127_235,
  OriginalRow227TriangleData1563.coefficient127_236,
  OriginalRow227TriangleData1563.coefficient127_237,
  OriginalRow227TriangleData1563.coefficient127_238,
  OriginalRow227TriangleData1563.coefficient127_239,
  OriginalRow227TriangleData1563.coefficient127_240,
  OriginalRow227TriangleData1563.coefficient127_241,
  OriginalRow227TriangleData1563.coefficient127_242,
  OriginalRow227TriangleData1563.coefficient127_243,
  OriginalRow227TriangleData1563.coefficient127_244,
  OriginalRow227TriangleData1563.coefficient127_245,
  OriginalRow227TriangleData1563.coefficient127_246,
  OriginalRow227TriangleData1563.coefficient127_247,
  OriginalRow227TriangleData1563.coefficient127_248,
  OriginalRow227TriangleData1563.coefficient127_249,
  OriginalRow227TriangleData1563.coefficient127_250,
  OriginalRow227TriangleData1563.coefficient127_251,
  OriginalRow227TriangleData1563.coefficient127_252,
  OriginalRow227TriangleData1563.coefficient127_253
]

theorem values1563_size : values1563.size = 32 := rfl

def block1563 : ℕ → Option IntervalDyadic := segment 222 values1563

theorem block1563_domain : ExactDomain block1563 222 254 := by
  simpa only [values1563_size] using segment_domain 222 values1563

theorem block1563_get (i : Fin 32) :
    block1563 (222 + i.val) = some (values1563[i.val]'(by rw [values1563_size]; exact i.isLt)) := by
  exact segment_get 222 values1563 ⟨i.val, by rw [values1563_size]; exact i.isLt⟩

def values1564 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1564.coefficient127_254,
  OriginalRow227TriangleData1564.coefficient127_255,
  OriginalRow227TriangleData1564.coefficient127_256,
  OriginalRow227TriangleData1564.coefficient127_257,
  OriginalRow227TriangleData1564.coefficient127_258,
  OriginalRow227TriangleData1564.coefficient127_259,
  OriginalRow227TriangleData1564.coefficient127_260,
  OriginalRow227TriangleData1564.coefficient127_261,
  OriginalRow227TriangleData1564.coefficient127_262,
  OriginalRow227TriangleData1564.coefficient127_263,
  OriginalRow227TriangleData1564.coefficient127_264,
  OriginalRow227TriangleData1564.coefficient127_265,
  OriginalRow227TriangleData1564.coefficient127_266,
  OriginalRow227TriangleData1564.coefficient127_267,
  OriginalRow227TriangleData1564.coefficient127_268,
  OriginalRow227TriangleData1564.coefficient127_269,
  OriginalRow227TriangleData1564.coefficient127_270,
  OriginalRow227TriangleData1564.coefficient127_271,
  OriginalRow227TriangleData1564.coefficient127_272,
  OriginalRow227TriangleData1564.coefficient127_273,
  OriginalRow227TriangleData1564.coefficient127_274,
  OriginalRow227TriangleData1564.coefficient127_275,
  OriginalRow227TriangleData1564.coefficient127_276,
  OriginalRow227TriangleData1564.coefficient127_277,
  OriginalRow227TriangleData1564.coefficient127_278,
  OriginalRow227TriangleData1564.coefficient127_279,
  OriginalRow227TriangleData1564.coefficient127_280,
  OriginalRow227TriangleData1564.coefficient127_281,
  OriginalRow227TriangleData1564.coefficient127_282,
  OriginalRow227TriangleData1564.coefficient127_283,
  OriginalRow227TriangleData1564.coefficient127_284,
  OriginalRow227TriangleData1564.coefficient127_285
]

theorem values1564_size : values1564.size = 32 := rfl

def block1564 : ℕ → Option IntervalDyadic := segment 254 values1564

theorem block1564_domain : ExactDomain block1564 254 286 := by
  simpa only [values1564_size] using segment_domain 254 values1564

theorem block1564_get (i : Fin 32) :
    block1564 (254 + i.val) = some (values1564[i.val]'(by rw [values1564_size]; exact i.isLt)) := by
  exact segment_get 254 values1564 ⟨i.val, by rw [values1564_size]; exact i.isLt⟩

def values1565 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1565.coefficient127_286,
  OriginalRow227TriangleData1565.coefficient127_287,
  OriginalRow227TriangleData1565.coefficient127_288,
  OriginalRow227TriangleData1565.coefficient127_289,
  OriginalRow227TriangleData1565.coefficient127_290,
  OriginalRow227TriangleData1565.coefficient127_291,
  OriginalRow227TriangleData1565.coefficient127_292,
  OriginalRow227TriangleData1565.coefficient127_293,
  OriginalRow227TriangleData1565.coefficient127_294,
  OriginalRow227TriangleData1565.coefficient127_295,
  OriginalRow227TriangleData1565.coefficient127_296,
  OriginalRow227TriangleData1565.coefficient127_297,
  OriginalRow227TriangleData1565.coefficient127_298,
  OriginalRow227TriangleData1565.coefficient127_299,
  OriginalRow227TriangleData1565.coefficient127_300,
  OriginalRow227TriangleData1565.coefficient127_301,
  OriginalRow227TriangleData1565.coefficient127_302,
  OriginalRow227TriangleData1565.coefficient127_303,
  OriginalRow227TriangleData1565.coefficient127_304,
  OriginalRow227TriangleData1565.coefficient127_305,
  OriginalRow227TriangleData1565.coefficient127_306,
  OriginalRow227TriangleData1565.coefficient127_307,
  OriginalRow227TriangleData1565.coefficient127_308,
  OriginalRow227TriangleData1565.coefficient127_309,
  OriginalRow227TriangleData1565.coefficient127_310,
  OriginalRow227TriangleData1565.coefficient127_311,
  OriginalRow227TriangleData1565.coefficient127_312,
  OriginalRow227TriangleData1565.coefficient127_313,
  OriginalRow227TriangleData1565.coefficient127_314,
  OriginalRow227TriangleData1565.coefficient127_315,
  OriginalRow227TriangleData1565.coefficient127_316,
  OriginalRow227TriangleData1565.coefficient127_317
]

theorem values1565_size : values1565.size = 32 := rfl

def block1565 : ℕ → Option IntervalDyadic := segment 286 values1565

theorem block1565_domain : ExactDomain block1565 286 318 := by
  simpa only [values1565_size] using segment_domain 286 values1565

theorem block1565_get (i : Fin 32) :
    block1565 (286 + i.val) = some (values1565[i.val]'(by rw [values1565_size]; exact i.isLt)) := by
  exact segment_get 286 values1565 ⟨i.val, by rw [values1565_size]; exact i.isLt⟩

def values1566 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1566.coefficient127_318,
  OriginalRow227TriangleData1566.coefficient127_319,
  OriginalRow227TriangleData1566.coefficient127_320,
  OriginalRow227TriangleData1566.coefficient127_321,
  OriginalRow227TriangleData1566.coefficient127_322,
  OriginalRow227TriangleData1566.coefficient127_323,
  OriginalRow227TriangleData1566.coefficient127_324,
  OriginalRow227TriangleData1566.coefficient127_325,
  OriginalRow227TriangleData1566.coefficient127_326,
  OriginalRow227TriangleData1566.coefficient127_327,
  OriginalRow227TriangleData1566.coefficient127_328,
  OriginalRow227TriangleData1566.coefficient127_329,
  OriginalRow227TriangleData1566.coefficient127_330,
  OriginalRow227TriangleData1566.coefficient127_331,
  OriginalRow227TriangleData1566.coefficient127_332,
  OriginalRow227TriangleData1566.coefficient127_333,
  OriginalRow227TriangleData1566.coefficient127_334,
  OriginalRow227TriangleData1566.coefficient127_335,
  OriginalRow227TriangleData1566.coefficient127_336,
  OriginalRow227TriangleData1566.coefficient127_337,
  OriginalRow227TriangleData1566.coefficient127_338,
  OriginalRow227TriangleData1566.coefficient127_339,
  OriginalRow227TriangleData1566.coefficient127_340,
  OriginalRow227TriangleData1566.coefficient127_341,
  OriginalRow227TriangleData1566.coefficient127_342,
  OriginalRow227TriangleData1566.coefficient127_343,
  OriginalRow227TriangleData1566.coefficient127_344,
  OriginalRow227TriangleData1566.coefficient127_345,
  OriginalRow227TriangleData1566.coefficient127_346,
  OriginalRow227TriangleData1566.coefficient127_347,
  OriginalRow227TriangleData1566.coefficient127_348,
  OriginalRow227TriangleData1566.coefficient127_349
]

theorem values1566_size : values1566.size = 32 := rfl

def block1566 : ℕ → Option IntervalDyadic := segment 318 values1566

theorem block1566_domain : ExactDomain block1566 318 350 := by
  simpa only [values1566_size] using segment_domain 318 values1566

theorem block1566_get (i : Fin 32) :
    block1566 (318 + i.val) = some (values1566[i.val]'(by rw [values1566_size]; exact i.isLt)) := by
  exact segment_get 318 values1566 ⟨i.val, by rw [values1566_size]; exact i.isLt⟩

def values1567 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1567.coefficient127_350,
  OriginalRow227TriangleData1567.coefficient127_351,
  OriginalRow227TriangleData1567.coefficient127_352,
  OriginalRow227TriangleData1567.coefficient127_353,
  OriginalRow227TriangleData1567.coefficient127_354,
  OriginalRow227TriangleData1567.coefficient127_355,
  OriginalRow227TriangleData1567.coefficient127_356,
  OriginalRow227TriangleData1567.coefficient127_357,
  OriginalRow227TriangleData1567.coefficient127_358,
  OriginalRow227TriangleData1567.coefficient127_359,
  OriginalRow227TriangleData1567.coefficient127_360,
  OriginalRow227TriangleData1567.coefficient127_361,
  OriginalRow227TriangleData1567.coefficient127_362,
  OriginalRow227TriangleData1567.coefficient127_363,
  OriginalRow227TriangleData1567.coefficient127_364,
  OriginalRow227TriangleData1567.coefficient127_365,
  OriginalRow227TriangleData1567.coefficient127_366,
  OriginalRow227TriangleData1567.coefficient127_367,
  OriginalRow227TriangleData1567.coefficient127_368,
  OriginalRow227TriangleData1567.coefficient127_369,
  OriginalRow227TriangleData1567.coefficient127_370,
  OriginalRow227TriangleData1567.coefficient127_371,
  OriginalRow227TriangleData1567.coefficient127_372,
  OriginalRow227TriangleData1567.coefficient127_373,
  OriginalRow227TriangleData1567.coefficient127_374
]

theorem values1567_size : values1567.size = 25 := rfl

def block1567 : ℕ → Option IntervalDyadic := segment 350 values1567

theorem block1567_domain : ExactDomain block1567 350 375 := by
  simpa only [values1567_size] using segment_domain 350 values1567

theorem block1567_get (i : Fin 25) :
    block1567 (350 + i.val) = some (values1567[i.val]'(by rw [values1567_size]; exact i.isLt)) := by
  exact segment_get 350 values1567 ⟨i.val, by rw [values1567_size]; exact i.isLt⟩

def node0126_0190 : ℕ → Option IntervalDyadic := split 158 block1560 block1561

theorem node0126_0190_domain : ExactDomain node0126_0190 126 190 := by
  exact split_domain (by decide) (by decide) block1560_domain block1561_domain

def node0190_0254 : ℕ → Option IntervalDyadic := split 222 block1562 block1563

theorem node0190_0254_domain : ExactDomain node0190_0254 190 254 := by
  exact split_domain (by decide) (by decide) block1562_domain block1563_domain

def node0126_0254 : ℕ → Option IntervalDyadic := split 190 node0126_0190 node0190_0254

theorem node0126_0254_domain : ExactDomain node0126_0254 126 254 := by
  exact split_domain (by decide) (by decide) node0126_0190_domain node0190_0254_domain

def node0254_0318 : ℕ → Option IntervalDyadic := split 286 block1564 block1565

theorem node0254_0318_domain : ExactDomain node0254_0318 254 318 := by
  exact split_domain (by decide) (by decide) block1564_domain block1565_domain

def node0318_0375 : ℕ → Option IntervalDyadic := split 350 block1566 block1567

theorem node0318_0375_domain : ExactDomain node0318_0375 318 375 := by
  exact split_domain (by decide) (by decide) block1566_domain block1567_domain

def node0254_0375 : ℕ → Option IntervalDyadic := split 318 node0254_0318 node0318_0375

theorem node0254_0375_domain : ExactDomain node0254_0375 254 375 := by
  exact split_domain (by decide) (by decide) node0254_0318_domain node0318_0375_domain

def node0126_0375 : ℕ → Option IntervalDyadic := split 254 node0126_0254 node0254_0375

theorem node0126_0375_domain : ExactDomain node0126_0375 126 375 := by
  exact split_domain (by decide) (by decide) node0126_0254_domain node0254_0375_domain

def lookup : ℕ → Option IntervalDyadic := node0126_0375

theorem lookup_domain : ExactDomain lookup 126 375 :=
  node0126_0375_domain

theorem block1560_lookup (i : Fin 32) :
    lookup (126 + i.val) = some (values1560[i.val]'(by rw [values1560_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (126 + i.val) = _
  rw [node0126_0375, split_left 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0126_0254, split_left 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0126_0190, split_left 158 block1560 block1561 (by omega)]
  exact block1560_get i

theorem block1561_lookup (i : Fin 32) :
    lookup (158 + i.val) = some (values1561[i.val]'(by rw [values1561_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (158 + i.val) = _
  rw [node0126_0375, split_left 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0126_0254, split_left 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0126_0190, split_right 158 block1560 block1561 (by omega)]
  exact block1561_get i

theorem block1562_lookup (i : Fin 32) :
    lookup (190 + i.val) = some (values1562[i.val]'(by rw [values1562_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (190 + i.val) = _
  rw [node0126_0375, split_left 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0126_0254, split_right 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0190_0254, split_left 222 block1562 block1563 (by omega)]
  exact block1562_get i

theorem block1563_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values1563[i.val]'(by rw [values1563_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (222 + i.val) = _
  rw [node0126_0375, split_left 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0126_0254, split_right 190 node0126_0190 node0190_0254 (by omega)]
  rw [node0190_0254, split_right 222 block1562 block1563 (by omega)]
  exact block1563_get i

theorem block1564_lookup (i : Fin 32) :
    lookup (254 + i.val) = some (values1564[i.val]'(by rw [values1564_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (254 + i.val) = _
  rw [node0126_0375, split_right 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0254_0375, split_left 318 node0254_0318 node0318_0375 (by omega)]
  rw [node0254_0318, split_left 286 block1564 block1565 (by omega)]
  exact block1564_get i

theorem block1565_lookup (i : Fin 32) :
    lookup (286 + i.val) = some (values1565[i.val]'(by rw [values1565_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (286 + i.val) = _
  rw [node0126_0375, split_right 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0254_0375, split_left 318 node0254_0318 node0318_0375 (by omega)]
  rw [node0254_0318, split_right 286 block1564 block1565 (by omega)]
  exact block1565_get i

theorem block1566_lookup (i : Fin 32) :
    lookup (318 + i.val) = some (values1566[i.val]'(by rw [values1566_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (318 + i.val) = _
  rw [node0126_0375, split_right 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0254_0375, split_right 318 node0254_0318 node0318_0375 (by omega)]
  rw [node0318_0375, split_left 350 block1566 block1567 (by omega)]
  exact block1566_get i

theorem block1567_lookup (i : Fin 25) :
    lookup (350 + i.val) = some (values1567[i.val]'(by rw [values1567_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0126_0375 (350 + i.val) = _
  rw [node0126_0375, split_right 254 node0126_0254 node0254_0375 (by omega)]
  rw [node0254_0375, split_right 318 node0254_0318 node0318_0375 (by omega)]
  rw [node0318_0375, split_right 350 block1566 block1567 (by omega)]
  exact block1567_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1560_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1560_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1561_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1561_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1562_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1562_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1563_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1563_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1564_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1564_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1565_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1565_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1566_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1566_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1567_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1567_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1560_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1561_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1562_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1563_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1564_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1565_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1566_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow127.block1567_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow127
