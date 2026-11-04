import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1624
import Grothe.UpperChaos.OriginalRow227TriangleData1625
import Grothe.UpperChaos.OriginalRow227TriangleData1626
import Grothe.UpperChaos.OriginalRow227TriangleData1627
import Grothe.UpperChaos.OriginalRow227TriangleData1628
import Grothe.UpperChaos.OriginalRow227TriangleData1629
import Grothe.UpperChaos.OriginalRow227TriangleData1630
import Grothe.UpperChaos.OriginalRow227TriangleData1631

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow135

open ConditionalTableLookup

def values1624 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1624.coefficient135_134,
  OriginalRow227TriangleData1624.coefficient135_135,
  OriginalRow227TriangleData1624.coefficient135_136,
  OriginalRow227TriangleData1624.coefficient135_137,
  OriginalRow227TriangleData1624.coefficient135_138,
  OriginalRow227TriangleData1624.coefficient135_139,
  OriginalRow227TriangleData1624.coefficient135_140,
  OriginalRow227TriangleData1624.coefficient135_141,
  OriginalRow227TriangleData1624.coefficient135_142,
  OriginalRow227TriangleData1624.coefficient135_143,
  OriginalRow227TriangleData1624.coefficient135_144,
  OriginalRow227TriangleData1624.coefficient135_145,
  OriginalRow227TriangleData1624.coefficient135_146,
  OriginalRow227TriangleData1624.coefficient135_147,
  OriginalRow227TriangleData1624.coefficient135_148,
  OriginalRow227TriangleData1624.coefficient135_149,
  OriginalRow227TriangleData1624.coefficient135_150,
  OriginalRow227TriangleData1624.coefficient135_151,
  OriginalRow227TriangleData1624.coefficient135_152,
  OriginalRow227TriangleData1624.coefficient135_153,
  OriginalRow227TriangleData1624.coefficient135_154,
  OriginalRow227TriangleData1624.coefficient135_155,
  OriginalRow227TriangleData1624.coefficient135_156,
  OriginalRow227TriangleData1624.coefficient135_157,
  OriginalRow227TriangleData1624.coefficient135_158,
  OriginalRow227TriangleData1624.coefficient135_159,
  OriginalRow227TriangleData1624.coefficient135_160,
  OriginalRow227TriangleData1624.coefficient135_161,
  OriginalRow227TriangleData1624.coefficient135_162,
  OriginalRow227TriangleData1624.coefficient135_163,
  OriginalRow227TriangleData1624.coefficient135_164,
  OriginalRow227TriangleData1624.coefficient135_165
]

theorem values1624_size : values1624.size = 32 := rfl

def block1624 : ℕ → Option IntervalDyadic := segment 134 values1624

theorem block1624_domain : ExactDomain block1624 134 166 := by
  simpa only [values1624_size] using segment_domain 134 values1624

theorem block1624_get (i : Fin 32) :
    block1624 (134 + i.val) = some (values1624[i.val]'(by rw [values1624_size]; exact i.isLt)) := by
  exact segment_get 134 values1624 ⟨i.val, by rw [values1624_size]; exact i.isLt⟩

def values1625 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1625.coefficient135_166,
  OriginalRow227TriangleData1625.coefficient135_167,
  OriginalRow227TriangleData1625.coefficient135_168,
  OriginalRow227TriangleData1625.coefficient135_169,
  OriginalRow227TriangleData1625.coefficient135_170,
  OriginalRow227TriangleData1625.coefficient135_171,
  OriginalRow227TriangleData1625.coefficient135_172,
  OriginalRow227TriangleData1625.coefficient135_173,
  OriginalRow227TriangleData1625.coefficient135_174,
  OriginalRow227TriangleData1625.coefficient135_175,
  OriginalRow227TriangleData1625.coefficient135_176,
  OriginalRow227TriangleData1625.coefficient135_177,
  OriginalRow227TriangleData1625.coefficient135_178,
  OriginalRow227TriangleData1625.coefficient135_179,
  OriginalRow227TriangleData1625.coefficient135_180,
  OriginalRow227TriangleData1625.coefficient135_181,
  OriginalRow227TriangleData1625.coefficient135_182,
  OriginalRow227TriangleData1625.coefficient135_183,
  OriginalRow227TriangleData1625.coefficient135_184,
  OriginalRow227TriangleData1625.coefficient135_185,
  OriginalRow227TriangleData1625.coefficient135_186,
  OriginalRow227TriangleData1625.coefficient135_187,
  OriginalRow227TriangleData1625.coefficient135_188,
  OriginalRow227TriangleData1625.coefficient135_189,
  OriginalRow227TriangleData1625.coefficient135_190,
  OriginalRow227TriangleData1625.coefficient135_191,
  OriginalRow227TriangleData1625.coefficient135_192,
  OriginalRow227TriangleData1625.coefficient135_193,
  OriginalRow227TriangleData1625.coefficient135_194,
  OriginalRow227TriangleData1625.coefficient135_195,
  OriginalRow227TriangleData1625.coefficient135_196,
  OriginalRow227TriangleData1625.coefficient135_197
]

theorem values1625_size : values1625.size = 32 := rfl

def block1625 : ℕ → Option IntervalDyadic := segment 166 values1625

theorem block1625_domain : ExactDomain block1625 166 198 := by
  simpa only [values1625_size] using segment_domain 166 values1625

theorem block1625_get (i : Fin 32) :
    block1625 (166 + i.val) = some (values1625[i.val]'(by rw [values1625_size]; exact i.isLt)) := by
  exact segment_get 166 values1625 ⟨i.val, by rw [values1625_size]; exact i.isLt⟩

def values1626 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1626.coefficient135_198,
  OriginalRow227TriangleData1626.coefficient135_199,
  OriginalRow227TriangleData1626.coefficient135_200,
  OriginalRow227TriangleData1626.coefficient135_201,
  OriginalRow227TriangleData1626.coefficient135_202,
  OriginalRow227TriangleData1626.coefficient135_203,
  OriginalRow227TriangleData1626.coefficient135_204,
  OriginalRow227TriangleData1626.coefficient135_205,
  OriginalRow227TriangleData1626.coefficient135_206,
  OriginalRow227TriangleData1626.coefficient135_207,
  OriginalRow227TriangleData1626.coefficient135_208,
  OriginalRow227TriangleData1626.coefficient135_209,
  OriginalRow227TriangleData1626.coefficient135_210,
  OriginalRow227TriangleData1626.coefficient135_211,
  OriginalRow227TriangleData1626.coefficient135_212,
  OriginalRow227TriangleData1626.coefficient135_213,
  OriginalRow227TriangleData1626.coefficient135_214,
  OriginalRow227TriangleData1626.coefficient135_215,
  OriginalRow227TriangleData1626.coefficient135_216,
  OriginalRow227TriangleData1626.coefficient135_217,
  OriginalRow227TriangleData1626.coefficient135_218,
  OriginalRow227TriangleData1626.coefficient135_219,
  OriginalRow227TriangleData1626.coefficient135_220,
  OriginalRow227TriangleData1626.coefficient135_221,
  OriginalRow227TriangleData1626.coefficient135_222,
  OriginalRow227TriangleData1626.coefficient135_223,
  OriginalRow227TriangleData1626.coefficient135_224,
  OriginalRow227TriangleData1626.coefficient135_225,
  OriginalRow227TriangleData1626.coefficient135_226,
  OriginalRow227TriangleData1626.coefficient135_227,
  OriginalRow227TriangleData1626.coefficient135_228,
  OriginalRow227TriangleData1626.coefficient135_229
]

theorem values1626_size : values1626.size = 32 := rfl

def block1626 : ℕ → Option IntervalDyadic := segment 198 values1626

theorem block1626_domain : ExactDomain block1626 198 230 := by
  simpa only [values1626_size] using segment_domain 198 values1626

theorem block1626_get (i : Fin 32) :
    block1626 (198 + i.val) = some (values1626[i.val]'(by rw [values1626_size]; exact i.isLt)) := by
  exact segment_get 198 values1626 ⟨i.val, by rw [values1626_size]; exact i.isLt⟩

def values1627 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1627.coefficient135_230,
  OriginalRow227TriangleData1627.coefficient135_231,
  OriginalRow227TriangleData1627.coefficient135_232,
  OriginalRow227TriangleData1627.coefficient135_233,
  OriginalRow227TriangleData1627.coefficient135_234,
  OriginalRow227TriangleData1627.coefficient135_235,
  OriginalRow227TriangleData1627.coefficient135_236,
  OriginalRow227TriangleData1627.coefficient135_237,
  OriginalRow227TriangleData1627.coefficient135_238,
  OriginalRow227TriangleData1627.coefficient135_239,
  OriginalRow227TriangleData1627.coefficient135_240,
  OriginalRow227TriangleData1627.coefficient135_241,
  OriginalRow227TriangleData1627.coefficient135_242,
  OriginalRow227TriangleData1627.coefficient135_243,
  OriginalRow227TriangleData1627.coefficient135_244,
  OriginalRow227TriangleData1627.coefficient135_245,
  OriginalRow227TriangleData1627.coefficient135_246,
  OriginalRow227TriangleData1627.coefficient135_247,
  OriginalRow227TriangleData1627.coefficient135_248,
  OriginalRow227TriangleData1627.coefficient135_249,
  OriginalRow227TriangleData1627.coefficient135_250,
  OriginalRow227TriangleData1627.coefficient135_251,
  OriginalRow227TriangleData1627.coefficient135_252,
  OriginalRow227TriangleData1627.coefficient135_253,
  OriginalRow227TriangleData1627.coefficient135_254,
  OriginalRow227TriangleData1627.coefficient135_255,
  OriginalRow227TriangleData1627.coefficient135_256,
  OriginalRow227TriangleData1627.coefficient135_257,
  OriginalRow227TriangleData1627.coefficient135_258,
  OriginalRow227TriangleData1627.coefficient135_259,
  OriginalRow227TriangleData1627.coefficient135_260,
  OriginalRow227TriangleData1627.coefficient135_261
]

theorem values1627_size : values1627.size = 32 := rfl

def block1627 : ℕ → Option IntervalDyadic := segment 230 values1627

theorem block1627_domain : ExactDomain block1627 230 262 := by
  simpa only [values1627_size] using segment_domain 230 values1627

theorem block1627_get (i : Fin 32) :
    block1627 (230 + i.val) = some (values1627[i.val]'(by rw [values1627_size]; exact i.isLt)) := by
  exact segment_get 230 values1627 ⟨i.val, by rw [values1627_size]; exact i.isLt⟩

def values1628 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1628.coefficient135_262,
  OriginalRow227TriangleData1628.coefficient135_263,
  OriginalRow227TriangleData1628.coefficient135_264,
  OriginalRow227TriangleData1628.coefficient135_265,
  OriginalRow227TriangleData1628.coefficient135_266,
  OriginalRow227TriangleData1628.coefficient135_267,
  OriginalRow227TriangleData1628.coefficient135_268,
  OriginalRow227TriangleData1628.coefficient135_269,
  OriginalRow227TriangleData1628.coefficient135_270,
  OriginalRow227TriangleData1628.coefficient135_271,
  OriginalRow227TriangleData1628.coefficient135_272,
  OriginalRow227TriangleData1628.coefficient135_273,
  OriginalRow227TriangleData1628.coefficient135_274,
  OriginalRow227TriangleData1628.coefficient135_275,
  OriginalRow227TriangleData1628.coefficient135_276,
  OriginalRow227TriangleData1628.coefficient135_277,
  OriginalRow227TriangleData1628.coefficient135_278,
  OriginalRow227TriangleData1628.coefficient135_279,
  OriginalRow227TriangleData1628.coefficient135_280,
  OriginalRow227TriangleData1628.coefficient135_281,
  OriginalRow227TriangleData1628.coefficient135_282,
  OriginalRow227TriangleData1628.coefficient135_283,
  OriginalRow227TriangleData1628.coefficient135_284,
  OriginalRow227TriangleData1628.coefficient135_285,
  OriginalRow227TriangleData1628.coefficient135_286,
  OriginalRow227TriangleData1628.coefficient135_287,
  OriginalRow227TriangleData1628.coefficient135_288,
  OriginalRow227TriangleData1628.coefficient135_289,
  OriginalRow227TriangleData1628.coefficient135_290,
  OriginalRow227TriangleData1628.coefficient135_291,
  OriginalRow227TriangleData1628.coefficient135_292,
  OriginalRow227TriangleData1628.coefficient135_293
]

theorem values1628_size : values1628.size = 32 := rfl

def block1628 : ℕ → Option IntervalDyadic := segment 262 values1628

theorem block1628_domain : ExactDomain block1628 262 294 := by
  simpa only [values1628_size] using segment_domain 262 values1628

theorem block1628_get (i : Fin 32) :
    block1628 (262 + i.val) = some (values1628[i.val]'(by rw [values1628_size]; exact i.isLt)) := by
  exact segment_get 262 values1628 ⟨i.val, by rw [values1628_size]; exact i.isLt⟩

def values1629 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1629.coefficient135_294,
  OriginalRow227TriangleData1629.coefficient135_295,
  OriginalRow227TriangleData1629.coefficient135_296,
  OriginalRow227TriangleData1629.coefficient135_297,
  OriginalRow227TriangleData1629.coefficient135_298,
  OriginalRow227TriangleData1629.coefficient135_299,
  OriginalRow227TriangleData1629.coefficient135_300,
  OriginalRow227TriangleData1629.coefficient135_301,
  OriginalRow227TriangleData1629.coefficient135_302,
  OriginalRow227TriangleData1629.coefficient135_303,
  OriginalRow227TriangleData1629.coefficient135_304,
  OriginalRow227TriangleData1629.coefficient135_305,
  OriginalRow227TriangleData1629.coefficient135_306,
  OriginalRow227TriangleData1629.coefficient135_307,
  OriginalRow227TriangleData1629.coefficient135_308,
  OriginalRow227TriangleData1629.coefficient135_309,
  OriginalRow227TriangleData1629.coefficient135_310,
  OriginalRow227TriangleData1629.coefficient135_311,
  OriginalRow227TriangleData1629.coefficient135_312,
  OriginalRow227TriangleData1629.coefficient135_313,
  OriginalRow227TriangleData1629.coefficient135_314,
  OriginalRow227TriangleData1629.coefficient135_315,
  OriginalRow227TriangleData1629.coefficient135_316,
  OriginalRow227TriangleData1629.coefficient135_317,
  OriginalRow227TriangleData1629.coefficient135_318,
  OriginalRow227TriangleData1629.coefficient135_319,
  OriginalRow227TriangleData1629.coefficient135_320,
  OriginalRow227TriangleData1629.coefficient135_321,
  OriginalRow227TriangleData1629.coefficient135_322,
  OriginalRow227TriangleData1629.coefficient135_323,
  OriginalRow227TriangleData1629.coefficient135_324,
  OriginalRow227TriangleData1629.coefficient135_325
]

theorem values1629_size : values1629.size = 32 := rfl

def block1629 : ℕ → Option IntervalDyadic := segment 294 values1629

theorem block1629_domain : ExactDomain block1629 294 326 := by
  simpa only [values1629_size] using segment_domain 294 values1629

theorem block1629_get (i : Fin 32) :
    block1629 (294 + i.val) = some (values1629[i.val]'(by rw [values1629_size]; exact i.isLt)) := by
  exact segment_get 294 values1629 ⟨i.val, by rw [values1629_size]; exact i.isLt⟩

def values1630 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1630.coefficient135_326,
  OriginalRow227TriangleData1630.coefficient135_327,
  OriginalRow227TriangleData1630.coefficient135_328,
  OriginalRow227TriangleData1630.coefficient135_329,
  OriginalRow227TriangleData1630.coefficient135_330,
  OriginalRow227TriangleData1630.coefficient135_331,
  OriginalRow227TriangleData1630.coefficient135_332,
  OriginalRow227TriangleData1630.coefficient135_333,
  OriginalRow227TriangleData1630.coefficient135_334,
  OriginalRow227TriangleData1630.coefficient135_335,
  OriginalRow227TriangleData1630.coefficient135_336,
  OriginalRow227TriangleData1630.coefficient135_337,
  OriginalRow227TriangleData1630.coefficient135_338,
  OriginalRow227TriangleData1630.coefficient135_339,
  OriginalRow227TriangleData1630.coefficient135_340,
  OriginalRow227TriangleData1630.coefficient135_341,
  OriginalRow227TriangleData1630.coefficient135_342,
  OriginalRow227TriangleData1630.coefficient135_343,
  OriginalRow227TriangleData1630.coefficient135_344,
  OriginalRow227TriangleData1630.coefficient135_345,
  OriginalRow227TriangleData1630.coefficient135_346,
  OriginalRow227TriangleData1630.coefficient135_347,
  OriginalRow227TriangleData1630.coefficient135_348,
  OriginalRow227TriangleData1630.coefficient135_349,
  OriginalRow227TriangleData1630.coefficient135_350,
  OriginalRow227TriangleData1630.coefficient135_351,
  OriginalRow227TriangleData1630.coefficient135_352,
  OriginalRow227TriangleData1630.coefficient135_353,
  OriginalRow227TriangleData1630.coefficient135_354,
  OriginalRow227TriangleData1630.coefficient135_355,
  OriginalRow227TriangleData1630.coefficient135_356,
  OriginalRow227TriangleData1630.coefficient135_357
]

theorem values1630_size : values1630.size = 32 := rfl

def block1630 : ℕ → Option IntervalDyadic := segment 326 values1630

theorem block1630_domain : ExactDomain block1630 326 358 := by
  simpa only [values1630_size] using segment_domain 326 values1630

theorem block1630_get (i : Fin 32) :
    block1630 (326 + i.val) = some (values1630[i.val]'(by rw [values1630_size]; exact i.isLt)) := by
  exact segment_get 326 values1630 ⟨i.val, by rw [values1630_size]; exact i.isLt⟩

def values1631 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1631.coefficient135_358,
  OriginalRow227TriangleData1631.coefficient135_359,
  OriginalRow227TriangleData1631.coefficient135_360,
  OriginalRow227TriangleData1631.coefficient135_361,
  OriginalRow227TriangleData1631.coefficient135_362,
  OriginalRow227TriangleData1631.coefficient135_363,
  OriginalRow227TriangleData1631.coefficient135_364,
  OriginalRow227TriangleData1631.coefficient135_365,
  OriginalRow227TriangleData1631.coefficient135_366
]

theorem values1631_size : values1631.size = 9 := rfl

def block1631 : ℕ → Option IntervalDyadic := segment 358 values1631

theorem block1631_domain : ExactDomain block1631 358 367 := by
  simpa only [values1631_size] using segment_domain 358 values1631

theorem block1631_get (i : Fin 9) :
    block1631 (358 + i.val) = some (values1631[i.val]'(by rw [values1631_size]; exact i.isLt)) := by
  exact segment_get 358 values1631 ⟨i.val, by rw [values1631_size]; exact i.isLt⟩

def node0134_0198 : ℕ → Option IntervalDyadic := split 166 block1624 block1625

theorem node0134_0198_domain : ExactDomain node0134_0198 134 198 := by
  exact split_domain (by decide) (by decide) block1624_domain block1625_domain

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block1626 block1627

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block1626_domain block1627_domain

def node0134_0262 : ℕ → Option IntervalDyadic := split 198 node0134_0198 node0198_0262

theorem node0134_0262_domain : ExactDomain node0134_0262 134 262 := by
  exact split_domain (by decide) (by decide) node0134_0198_domain node0198_0262_domain

def node0262_0326 : ℕ → Option IntervalDyadic := split 294 block1628 block1629

theorem node0262_0326_domain : ExactDomain node0262_0326 262 326 := by
  exact split_domain (by decide) (by decide) block1628_domain block1629_domain

def node0326_0367 : ℕ → Option IntervalDyadic := split 358 block1630 block1631

theorem node0326_0367_domain : ExactDomain node0326_0367 326 367 := by
  exact split_domain (by decide) (by decide) block1630_domain block1631_domain

def node0262_0367 : ℕ → Option IntervalDyadic := split 326 node0262_0326 node0326_0367

theorem node0262_0367_domain : ExactDomain node0262_0367 262 367 := by
  exact split_domain (by decide) (by decide) node0262_0326_domain node0326_0367_domain

def node0134_0367 : ℕ → Option IntervalDyadic := split 262 node0134_0262 node0262_0367

theorem node0134_0367_domain : ExactDomain node0134_0367 134 367 := by
  exact split_domain (by decide) (by decide) node0134_0262_domain node0262_0367_domain

def lookup : ℕ → Option IntervalDyadic := node0134_0367

theorem lookup_domain : ExactDomain lookup 134 367 :=
  node0134_0367_domain

theorem block1624_lookup (i : Fin 32) :
    lookup (134 + i.val) = some (values1624[i.val]'(by rw [values1624_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (134 + i.val) = _
  rw [node0134_0367, split_left 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0134_0262, split_left 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0134_0198, split_left 166 block1624 block1625 (by omega)]
  exact block1624_get i

theorem block1625_lookup (i : Fin 32) :
    lookup (166 + i.val) = some (values1625[i.val]'(by rw [values1625_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (166 + i.val) = _
  rw [node0134_0367, split_left 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0134_0262, split_left 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0134_0198, split_right 166 block1624 block1625 (by omega)]
  exact block1625_get i

theorem block1626_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values1626[i.val]'(by rw [values1626_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (198 + i.val) = _
  rw [node0134_0367, split_left 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0134_0262, split_right 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0198_0262, split_left 230 block1626 block1627 (by omega)]
  exact block1626_get i

theorem block1627_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values1627[i.val]'(by rw [values1627_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (230 + i.val) = _
  rw [node0134_0367, split_left 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0134_0262, split_right 198 node0134_0198 node0198_0262 (by omega)]
  rw [node0198_0262, split_right 230 block1626 block1627 (by omega)]
  exact block1627_get i

theorem block1628_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values1628[i.val]'(by rw [values1628_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (262 + i.val) = _
  rw [node0134_0367, split_right 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0262_0367, split_left 326 node0262_0326 node0326_0367 (by omega)]
  rw [node0262_0326, split_left 294 block1628 block1629 (by omega)]
  exact block1628_get i

theorem block1629_lookup (i : Fin 32) :
    lookup (294 + i.val) = some (values1629[i.val]'(by rw [values1629_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (294 + i.val) = _
  rw [node0134_0367, split_right 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0262_0367, split_left 326 node0262_0326 node0326_0367 (by omega)]
  rw [node0262_0326, split_right 294 block1628 block1629 (by omega)]
  exact block1629_get i

theorem block1630_lookup (i : Fin 32) :
    lookup (326 + i.val) = some (values1630[i.val]'(by rw [values1630_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (326 + i.val) = _
  rw [node0134_0367, split_right 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0262_0367, split_right 326 node0262_0326 node0326_0367 (by omega)]
  rw [node0326_0367, split_left 358 block1630 block1631 (by omega)]
  exact block1630_get i

theorem block1631_lookup (i : Fin 9) :
    lookup (358 + i.val) = some (values1631[i.val]'(by rw [values1631_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0134_0367 (358 + i.val) = _
  rw [node0134_0367, split_right 262 node0134_0262 node0262_0367 (by omega)]
  rw [node0262_0367, split_right 326 node0262_0326 node0326_0367 (by omega)]
  rw [node0326_0367, split_right 358 block1630 block1631 (by omega)]
  exact block1631_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1624_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1624_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1625_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1625_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1626_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1626_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1627_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1627_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1628_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1628_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1629_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1629_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1630_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1630_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1631_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1631_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1624_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1625_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1626_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1627_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1628_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1629_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1630_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow135.block1631_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow135
