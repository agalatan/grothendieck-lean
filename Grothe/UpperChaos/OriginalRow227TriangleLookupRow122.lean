import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1518
import Grothe.UpperChaos.OriginalRow227TriangleData1519
import Grothe.UpperChaos.OriginalRow227TriangleData1520
import Grothe.UpperChaos.OriginalRow227TriangleData1521
import Grothe.UpperChaos.OriginalRow227TriangleData1522
import Grothe.UpperChaos.OriginalRow227TriangleData1523
import Grothe.UpperChaos.OriginalRow227TriangleData1524
import Grothe.UpperChaos.OriginalRow227TriangleData1525
import Grothe.UpperChaos.OriginalRow227TriangleData1526

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow122

open ConditionalTableLookup

def values1518 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1518.coefficient122_121,
  OriginalRow227TriangleData1518.coefficient122_122,
  OriginalRow227TriangleData1518.coefficient122_123,
  OriginalRow227TriangleData1518.coefficient122_124,
  OriginalRow227TriangleData1518.coefficient122_125,
  OriginalRow227TriangleData1518.coefficient122_126,
  OriginalRow227TriangleData1518.coefficient122_127,
  OriginalRow227TriangleData1518.coefficient122_128,
  OriginalRow227TriangleData1518.coefficient122_129,
  OriginalRow227TriangleData1518.coefficient122_130,
  OriginalRow227TriangleData1518.coefficient122_131,
  OriginalRow227TriangleData1518.coefficient122_132,
  OriginalRow227TriangleData1518.coefficient122_133,
  OriginalRow227TriangleData1518.coefficient122_134,
  OriginalRow227TriangleData1518.coefficient122_135,
  OriginalRow227TriangleData1518.coefficient122_136,
  OriginalRow227TriangleData1518.coefficient122_137,
  OriginalRow227TriangleData1518.coefficient122_138,
  OriginalRow227TriangleData1518.coefficient122_139,
  OriginalRow227TriangleData1518.coefficient122_140,
  OriginalRow227TriangleData1518.coefficient122_141,
  OriginalRow227TriangleData1518.coefficient122_142,
  OriginalRow227TriangleData1518.coefficient122_143,
  OriginalRow227TriangleData1518.coefficient122_144,
  OriginalRow227TriangleData1518.coefficient122_145,
  OriginalRow227TriangleData1518.coefficient122_146,
  OriginalRow227TriangleData1518.coefficient122_147,
  OriginalRow227TriangleData1518.coefficient122_148,
  OriginalRow227TriangleData1518.coefficient122_149,
  OriginalRow227TriangleData1518.coefficient122_150,
  OriginalRow227TriangleData1518.coefficient122_151,
  OriginalRow227TriangleData1518.coefficient122_152
]

theorem values1518_size : values1518.size = 32 := rfl

def block1518 : ℕ → Option IntervalDyadic := segment 121 values1518

theorem block1518_domain : ExactDomain block1518 121 153 := by
  simpa only [values1518_size] using segment_domain 121 values1518

theorem block1518_get (i : Fin 32) :
    block1518 (121 + i.val) = some (values1518[i.val]'(by rw [values1518_size]; exact i.isLt)) := by
  exact segment_get 121 values1518 ⟨i.val, by rw [values1518_size]; exact i.isLt⟩

def values1519 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1519.coefficient122_153,
  OriginalRow227TriangleData1519.coefficient122_154,
  OriginalRow227TriangleData1519.coefficient122_155,
  OriginalRow227TriangleData1519.coefficient122_156,
  OriginalRow227TriangleData1519.coefficient122_157,
  OriginalRow227TriangleData1519.coefficient122_158,
  OriginalRow227TriangleData1519.coefficient122_159,
  OriginalRow227TriangleData1519.coefficient122_160,
  OriginalRow227TriangleData1519.coefficient122_161,
  OriginalRow227TriangleData1519.coefficient122_162,
  OriginalRow227TriangleData1519.coefficient122_163,
  OriginalRow227TriangleData1519.coefficient122_164,
  OriginalRow227TriangleData1519.coefficient122_165,
  OriginalRow227TriangleData1519.coefficient122_166,
  OriginalRow227TriangleData1519.coefficient122_167,
  OriginalRow227TriangleData1519.coefficient122_168,
  OriginalRow227TriangleData1519.coefficient122_169,
  OriginalRow227TriangleData1519.coefficient122_170,
  OriginalRow227TriangleData1519.coefficient122_171,
  OriginalRow227TriangleData1519.coefficient122_172,
  OriginalRow227TriangleData1519.coefficient122_173,
  OriginalRow227TriangleData1519.coefficient122_174,
  OriginalRow227TriangleData1519.coefficient122_175,
  OriginalRow227TriangleData1519.coefficient122_176,
  OriginalRow227TriangleData1519.coefficient122_177,
  OriginalRow227TriangleData1519.coefficient122_178,
  OriginalRow227TriangleData1519.coefficient122_179,
  OriginalRow227TriangleData1519.coefficient122_180,
  OriginalRow227TriangleData1519.coefficient122_181,
  OriginalRow227TriangleData1519.coefficient122_182,
  OriginalRow227TriangleData1519.coefficient122_183,
  OriginalRow227TriangleData1519.coefficient122_184
]

theorem values1519_size : values1519.size = 32 := rfl

def block1519 : ℕ → Option IntervalDyadic := segment 153 values1519

theorem block1519_domain : ExactDomain block1519 153 185 := by
  simpa only [values1519_size] using segment_domain 153 values1519

theorem block1519_get (i : Fin 32) :
    block1519 (153 + i.val) = some (values1519[i.val]'(by rw [values1519_size]; exact i.isLt)) := by
  exact segment_get 153 values1519 ⟨i.val, by rw [values1519_size]; exact i.isLt⟩

def values1520 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1520.coefficient122_185,
  OriginalRow227TriangleData1520.coefficient122_186,
  OriginalRow227TriangleData1520.coefficient122_187,
  OriginalRow227TriangleData1520.coefficient122_188,
  OriginalRow227TriangleData1520.coefficient122_189,
  OriginalRow227TriangleData1520.coefficient122_190,
  OriginalRow227TriangleData1520.coefficient122_191,
  OriginalRow227TriangleData1520.coefficient122_192,
  OriginalRow227TriangleData1520.coefficient122_193,
  OriginalRow227TriangleData1520.coefficient122_194,
  OriginalRow227TriangleData1520.coefficient122_195,
  OriginalRow227TriangleData1520.coefficient122_196,
  OriginalRow227TriangleData1520.coefficient122_197,
  OriginalRow227TriangleData1520.coefficient122_198,
  OriginalRow227TriangleData1520.coefficient122_199,
  OriginalRow227TriangleData1520.coefficient122_200,
  OriginalRow227TriangleData1520.coefficient122_201,
  OriginalRow227TriangleData1520.coefficient122_202,
  OriginalRow227TriangleData1520.coefficient122_203,
  OriginalRow227TriangleData1520.coefficient122_204,
  OriginalRow227TriangleData1520.coefficient122_205,
  OriginalRow227TriangleData1520.coefficient122_206,
  OriginalRow227TriangleData1520.coefficient122_207,
  OriginalRow227TriangleData1520.coefficient122_208,
  OriginalRow227TriangleData1520.coefficient122_209,
  OriginalRow227TriangleData1520.coefficient122_210,
  OriginalRow227TriangleData1520.coefficient122_211,
  OriginalRow227TriangleData1520.coefficient122_212,
  OriginalRow227TriangleData1520.coefficient122_213,
  OriginalRow227TriangleData1520.coefficient122_214,
  OriginalRow227TriangleData1520.coefficient122_215,
  OriginalRow227TriangleData1520.coefficient122_216
]

theorem values1520_size : values1520.size = 32 := rfl

def block1520 : ℕ → Option IntervalDyadic := segment 185 values1520

theorem block1520_domain : ExactDomain block1520 185 217 := by
  simpa only [values1520_size] using segment_domain 185 values1520

theorem block1520_get (i : Fin 32) :
    block1520 (185 + i.val) = some (values1520[i.val]'(by rw [values1520_size]; exact i.isLt)) := by
  exact segment_get 185 values1520 ⟨i.val, by rw [values1520_size]; exact i.isLt⟩

def values1521 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1521.coefficient122_217,
  OriginalRow227TriangleData1521.coefficient122_218,
  OriginalRow227TriangleData1521.coefficient122_219,
  OriginalRow227TriangleData1521.coefficient122_220,
  OriginalRow227TriangleData1521.coefficient122_221,
  OriginalRow227TriangleData1521.coefficient122_222,
  OriginalRow227TriangleData1521.coefficient122_223,
  OriginalRow227TriangleData1521.coefficient122_224,
  OriginalRow227TriangleData1521.coefficient122_225,
  OriginalRow227TriangleData1521.coefficient122_226,
  OriginalRow227TriangleData1521.coefficient122_227,
  OriginalRow227TriangleData1521.coefficient122_228,
  OriginalRow227TriangleData1521.coefficient122_229,
  OriginalRow227TriangleData1521.coefficient122_230,
  OriginalRow227TriangleData1521.coefficient122_231,
  OriginalRow227TriangleData1521.coefficient122_232,
  OriginalRow227TriangleData1521.coefficient122_233,
  OriginalRow227TriangleData1521.coefficient122_234,
  OriginalRow227TriangleData1521.coefficient122_235,
  OriginalRow227TriangleData1521.coefficient122_236,
  OriginalRow227TriangleData1521.coefficient122_237,
  OriginalRow227TriangleData1521.coefficient122_238,
  OriginalRow227TriangleData1521.coefficient122_239,
  OriginalRow227TriangleData1521.coefficient122_240,
  OriginalRow227TriangleData1521.coefficient122_241,
  OriginalRow227TriangleData1521.coefficient122_242,
  OriginalRow227TriangleData1521.coefficient122_243,
  OriginalRow227TriangleData1521.coefficient122_244,
  OriginalRow227TriangleData1521.coefficient122_245,
  OriginalRow227TriangleData1521.coefficient122_246,
  OriginalRow227TriangleData1521.coefficient122_247,
  OriginalRow227TriangleData1521.coefficient122_248
]

theorem values1521_size : values1521.size = 32 := rfl

def block1521 : ℕ → Option IntervalDyadic := segment 217 values1521

theorem block1521_domain : ExactDomain block1521 217 249 := by
  simpa only [values1521_size] using segment_domain 217 values1521

theorem block1521_get (i : Fin 32) :
    block1521 (217 + i.val) = some (values1521[i.val]'(by rw [values1521_size]; exact i.isLt)) := by
  exact segment_get 217 values1521 ⟨i.val, by rw [values1521_size]; exact i.isLt⟩

def values1522 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1522.coefficient122_249,
  OriginalRow227TriangleData1522.coefficient122_250,
  OriginalRow227TriangleData1522.coefficient122_251,
  OriginalRow227TriangleData1522.coefficient122_252,
  OriginalRow227TriangleData1522.coefficient122_253,
  OriginalRow227TriangleData1522.coefficient122_254,
  OriginalRow227TriangleData1522.coefficient122_255,
  OriginalRow227TriangleData1522.coefficient122_256,
  OriginalRow227TriangleData1522.coefficient122_257,
  OriginalRow227TriangleData1522.coefficient122_258,
  OriginalRow227TriangleData1522.coefficient122_259,
  OriginalRow227TriangleData1522.coefficient122_260,
  OriginalRow227TriangleData1522.coefficient122_261,
  OriginalRow227TriangleData1522.coefficient122_262,
  OriginalRow227TriangleData1522.coefficient122_263,
  OriginalRow227TriangleData1522.coefficient122_264,
  OriginalRow227TriangleData1522.coefficient122_265,
  OriginalRow227TriangleData1522.coefficient122_266,
  OriginalRow227TriangleData1522.coefficient122_267,
  OriginalRow227TriangleData1522.coefficient122_268,
  OriginalRow227TriangleData1522.coefficient122_269,
  OriginalRow227TriangleData1522.coefficient122_270,
  OriginalRow227TriangleData1522.coefficient122_271,
  OriginalRow227TriangleData1522.coefficient122_272,
  OriginalRow227TriangleData1522.coefficient122_273,
  OriginalRow227TriangleData1522.coefficient122_274,
  OriginalRow227TriangleData1522.coefficient122_275,
  OriginalRow227TriangleData1522.coefficient122_276,
  OriginalRow227TriangleData1522.coefficient122_277,
  OriginalRow227TriangleData1522.coefficient122_278,
  OriginalRow227TriangleData1522.coefficient122_279,
  OriginalRow227TriangleData1522.coefficient122_280
]

theorem values1522_size : values1522.size = 32 := rfl

def block1522 : ℕ → Option IntervalDyadic := segment 249 values1522

theorem block1522_domain : ExactDomain block1522 249 281 := by
  simpa only [values1522_size] using segment_domain 249 values1522

theorem block1522_get (i : Fin 32) :
    block1522 (249 + i.val) = some (values1522[i.val]'(by rw [values1522_size]; exact i.isLt)) := by
  exact segment_get 249 values1522 ⟨i.val, by rw [values1522_size]; exact i.isLt⟩

def values1523 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1523.coefficient122_281,
  OriginalRow227TriangleData1523.coefficient122_282,
  OriginalRow227TriangleData1523.coefficient122_283,
  OriginalRow227TriangleData1523.coefficient122_284,
  OriginalRow227TriangleData1523.coefficient122_285,
  OriginalRow227TriangleData1523.coefficient122_286,
  OriginalRow227TriangleData1523.coefficient122_287,
  OriginalRow227TriangleData1523.coefficient122_288,
  OriginalRow227TriangleData1523.coefficient122_289,
  OriginalRow227TriangleData1523.coefficient122_290,
  OriginalRow227TriangleData1523.coefficient122_291,
  OriginalRow227TriangleData1523.coefficient122_292,
  OriginalRow227TriangleData1523.coefficient122_293,
  OriginalRow227TriangleData1523.coefficient122_294,
  OriginalRow227TriangleData1523.coefficient122_295,
  OriginalRow227TriangleData1523.coefficient122_296,
  OriginalRow227TriangleData1523.coefficient122_297,
  OriginalRow227TriangleData1523.coefficient122_298,
  OriginalRow227TriangleData1523.coefficient122_299,
  OriginalRow227TriangleData1523.coefficient122_300,
  OriginalRow227TriangleData1523.coefficient122_301,
  OriginalRow227TriangleData1523.coefficient122_302,
  OriginalRow227TriangleData1523.coefficient122_303,
  OriginalRow227TriangleData1523.coefficient122_304,
  OriginalRow227TriangleData1523.coefficient122_305,
  OriginalRow227TriangleData1523.coefficient122_306,
  OriginalRow227TriangleData1523.coefficient122_307,
  OriginalRow227TriangleData1523.coefficient122_308,
  OriginalRow227TriangleData1523.coefficient122_309,
  OriginalRow227TriangleData1523.coefficient122_310,
  OriginalRow227TriangleData1523.coefficient122_311,
  OriginalRow227TriangleData1523.coefficient122_312
]

theorem values1523_size : values1523.size = 32 := rfl

def block1523 : ℕ → Option IntervalDyadic := segment 281 values1523

theorem block1523_domain : ExactDomain block1523 281 313 := by
  simpa only [values1523_size] using segment_domain 281 values1523

theorem block1523_get (i : Fin 32) :
    block1523 (281 + i.val) = some (values1523[i.val]'(by rw [values1523_size]; exact i.isLt)) := by
  exact segment_get 281 values1523 ⟨i.val, by rw [values1523_size]; exact i.isLt⟩

def values1524 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1524.coefficient122_313,
  OriginalRow227TriangleData1524.coefficient122_314,
  OriginalRow227TriangleData1524.coefficient122_315,
  OriginalRow227TriangleData1524.coefficient122_316,
  OriginalRow227TriangleData1524.coefficient122_317,
  OriginalRow227TriangleData1524.coefficient122_318,
  OriginalRow227TriangleData1524.coefficient122_319,
  OriginalRow227TriangleData1524.coefficient122_320,
  OriginalRow227TriangleData1524.coefficient122_321,
  OriginalRow227TriangleData1524.coefficient122_322,
  OriginalRow227TriangleData1524.coefficient122_323,
  OriginalRow227TriangleData1524.coefficient122_324,
  OriginalRow227TriangleData1524.coefficient122_325,
  OriginalRow227TriangleData1524.coefficient122_326,
  OriginalRow227TriangleData1524.coefficient122_327,
  OriginalRow227TriangleData1524.coefficient122_328,
  OriginalRow227TriangleData1524.coefficient122_329,
  OriginalRow227TriangleData1524.coefficient122_330,
  OriginalRow227TriangleData1524.coefficient122_331,
  OriginalRow227TriangleData1524.coefficient122_332,
  OriginalRow227TriangleData1524.coefficient122_333,
  OriginalRow227TriangleData1524.coefficient122_334,
  OriginalRow227TriangleData1524.coefficient122_335,
  OriginalRow227TriangleData1524.coefficient122_336,
  OriginalRow227TriangleData1524.coefficient122_337,
  OriginalRow227TriangleData1524.coefficient122_338,
  OriginalRow227TriangleData1524.coefficient122_339,
  OriginalRow227TriangleData1524.coefficient122_340,
  OriginalRow227TriangleData1524.coefficient122_341,
  OriginalRow227TriangleData1524.coefficient122_342,
  OriginalRow227TriangleData1524.coefficient122_343,
  OriginalRow227TriangleData1524.coefficient122_344
]

theorem values1524_size : values1524.size = 32 := rfl

def block1524 : ℕ → Option IntervalDyadic := segment 313 values1524

theorem block1524_domain : ExactDomain block1524 313 345 := by
  simpa only [values1524_size] using segment_domain 313 values1524

theorem block1524_get (i : Fin 32) :
    block1524 (313 + i.val) = some (values1524[i.val]'(by rw [values1524_size]; exact i.isLt)) := by
  exact segment_get 313 values1524 ⟨i.val, by rw [values1524_size]; exact i.isLt⟩

def values1525 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1525.coefficient122_345,
  OriginalRow227TriangleData1525.coefficient122_346,
  OriginalRow227TriangleData1525.coefficient122_347,
  OriginalRow227TriangleData1525.coefficient122_348,
  OriginalRow227TriangleData1525.coefficient122_349,
  OriginalRow227TriangleData1525.coefficient122_350,
  OriginalRow227TriangleData1525.coefficient122_351,
  OriginalRow227TriangleData1525.coefficient122_352,
  OriginalRow227TriangleData1525.coefficient122_353,
  OriginalRow227TriangleData1525.coefficient122_354,
  OriginalRow227TriangleData1525.coefficient122_355,
  OriginalRow227TriangleData1525.coefficient122_356,
  OriginalRow227TriangleData1525.coefficient122_357,
  OriginalRow227TriangleData1525.coefficient122_358,
  OriginalRow227TriangleData1525.coefficient122_359,
  OriginalRow227TriangleData1525.coefficient122_360,
  OriginalRow227TriangleData1525.coefficient122_361,
  OriginalRow227TriangleData1525.coefficient122_362,
  OriginalRow227TriangleData1525.coefficient122_363,
  OriginalRow227TriangleData1525.coefficient122_364,
  OriginalRow227TriangleData1525.coefficient122_365,
  OriginalRow227TriangleData1525.coefficient122_366,
  OriginalRow227TriangleData1525.coefficient122_367,
  OriginalRow227TriangleData1525.coefficient122_368,
  OriginalRow227TriangleData1525.coefficient122_369,
  OriginalRow227TriangleData1525.coefficient122_370,
  OriginalRow227TriangleData1525.coefficient122_371,
  OriginalRow227TriangleData1525.coefficient122_372,
  OriginalRow227TriangleData1525.coefficient122_373,
  OriginalRow227TriangleData1525.coefficient122_374,
  OriginalRow227TriangleData1525.coefficient122_375,
  OriginalRow227TriangleData1525.coefficient122_376
]

theorem values1525_size : values1525.size = 32 := rfl

def block1525 : ℕ → Option IntervalDyadic := segment 345 values1525

theorem block1525_domain : ExactDomain block1525 345 377 := by
  simpa only [values1525_size] using segment_domain 345 values1525

theorem block1525_get (i : Fin 32) :
    block1525 (345 + i.val) = some (values1525[i.val]'(by rw [values1525_size]; exact i.isLt)) := by
  exact segment_get 345 values1525 ⟨i.val, by rw [values1525_size]; exact i.isLt⟩

def values1526 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1526.coefficient122_377,
  OriginalRow227TriangleData1526.coefficient122_378,
  OriginalRow227TriangleData1526.coefficient122_379
]

theorem values1526_size : values1526.size = 3 := rfl

def block1526 : ℕ → Option IntervalDyadic := segment 377 values1526

theorem block1526_domain : ExactDomain block1526 377 380 := by
  simpa only [values1526_size] using segment_domain 377 values1526

theorem block1526_get (i : Fin 3) :
    block1526 (377 + i.val) = some (values1526[i.val]'(by rw [values1526_size]; exact i.isLt)) := by
  exact segment_get 377 values1526 ⟨i.val, by rw [values1526_size]; exact i.isLt⟩

def node0121_0185 : ℕ → Option IntervalDyadic := split 153 block1518 block1519

theorem node0121_0185_domain : ExactDomain node0121_0185 121 185 := by
  exact split_domain (by decide) (by decide) block1518_domain block1519_domain

def node0185_0249 : ℕ → Option IntervalDyadic := split 217 block1520 block1521

theorem node0185_0249_domain : ExactDomain node0185_0249 185 249 := by
  exact split_domain (by decide) (by decide) block1520_domain block1521_domain

def node0121_0249 : ℕ → Option IntervalDyadic := split 185 node0121_0185 node0185_0249

theorem node0121_0249_domain : ExactDomain node0121_0249 121 249 := by
  exact split_domain (by decide) (by decide) node0121_0185_domain node0185_0249_domain

def node0249_0313 : ℕ → Option IntervalDyadic := split 281 block1522 block1523

theorem node0249_0313_domain : ExactDomain node0249_0313 249 313 := by
  exact split_domain (by decide) (by decide) block1522_domain block1523_domain

def node0345_0380 : ℕ → Option IntervalDyadic := split 377 block1525 block1526

theorem node0345_0380_domain : ExactDomain node0345_0380 345 380 := by
  exact split_domain (by decide) (by decide) block1525_domain block1526_domain

def node0313_0380 : ℕ → Option IntervalDyadic := split 345 block1524 node0345_0380

theorem node0313_0380_domain : ExactDomain node0313_0380 313 380 := by
  exact split_domain (by decide) (by decide) block1524_domain node0345_0380_domain

def node0249_0380 : ℕ → Option IntervalDyadic := split 313 node0249_0313 node0313_0380

theorem node0249_0380_domain : ExactDomain node0249_0380 249 380 := by
  exact split_domain (by decide) (by decide) node0249_0313_domain node0313_0380_domain

def node0121_0380 : ℕ → Option IntervalDyadic := split 249 node0121_0249 node0249_0380

theorem node0121_0380_domain : ExactDomain node0121_0380 121 380 := by
  exact split_domain (by decide) (by decide) node0121_0249_domain node0249_0380_domain

def lookup : ℕ → Option IntervalDyadic := node0121_0380

theorem lookup_domain : ExactDomain lookup 121 380 :=
  node0121_0380_domain

theorem block1518_lookup (i : Fin 32) :
    lookup (121 + i.val) = some (values1518[i.val]'(by rw [values1518_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (121 + i.val) = _
  rw [node0121_0380, split_left 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0121_0249, split_left 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0121_0185, split_left 153 block1518 block1519 (by omega)]
  exact block1518_get i

theorem block1519_lookup (i : Fin 32) :
    lookup (153 + i.val) = some (values1519[i.val]'(by rw [values1519_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (153 + i.val) = _
  rw [node0121_0380, split_left 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0121_0249, split_left 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0121_0185, split_right 153 block1518 block1519 (by omega)]
  exact block1519_get i

theorem block1520_lookup (i : Fin 32) :
    lookup (185 + i.val) = some (values1520[i.val]'(by rw [values1520_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (185 + i.val) = _
  rw [node0121_0380, split_left 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0121_0249, split_right 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0185_0249, split_left 217 block1520 block1521 (by omega)]
  exact block1520_get i

theorem block1521_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values1521[i.val]'(by rw [values1521_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (217 + i.val) = _
  rw [node0121_0380, split_left 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0121_0249, split_right 185 node0121_0185 node0185_0249 (by omega)]
  rw [node0185_0249, split_right 217 block1520 block1521 (by omega)]
  exact block1521_get i

theorem block1522_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values1522[i.val]'(by rw [values1522_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (249 + i.val) = _
  rw [node0121_0380, split_right 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0249_0380, split_left 313 node0249_0313 node0313_0380 (by omega)]
  rw [node0249_0313, split_left 281 block1522 block1523 (by omega)]
  exact block1522_get i

theorem block1523_lookup (i : Fin 32) :
    lookup (281 + i.val) = some (values1523[i.val]'(by rw [values1523_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (281 + i.val) = _
  rw [node0121_0380, split_right 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0249_0380, split_left 313 node0249_0313 node0313_0380 (by omega)]
  rw [node0249_0313, split_right 281 block1522 block1523 (by omega)]
  exact block1523_get i

theorem block1524_lookup (i : Fin 32) :
    lookup (313 + i.val) = some (values1524[i.val]'(by rw [values1524_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (313 + i.val) = _
  rw [node0121_0380, split_right 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0249_0380, split_right 313 node0249_0313 node0313_0380 (by omega)]
  rw [node0313_0380, split_left 345 block1524 node0345_0380 (by omega)]
  exact block1524_get i

theorem block1525_lookup (i : Fin 32) :
    lookup (345 + i.val) = some (values1525[i.val]'(by rw [values1525_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (345 + i.val) = _
  rw [node0121_0380, split_right 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0249_0380, split_right 313 node0249_0313 node0313_0380 (by omega)]
  rw [node0313_0380, split_right 345 block1524 node0345_0380 (by omega)]
  rw [node0345_0380, split_left 377 block1525 block1526 (by omega)]
  exact block1525_get i

theorem block1526_lookup (i : Fin 3) :
    lookup (377 + i.val) = some (values1526[i.val]'(by rw [values1526_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0121_0380 (377 + i.val) = _
  rw [node0121_0380, split_right 249 node0121_0249 node0249_0380 (by omega)]
  rw [node0249_0380, split_right 313 node0249_0313 node0313_0380 (by omega)]
  rw [node0313_0380, split_right 345 block1524 node0345_0380 (by omega)]
  rw [node0345_0380, split_right 377 block1525 block1526 (by omega)]
  exact block1526_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1518_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1518_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1519_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1519_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1520_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1520_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1521_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1521_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1522_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1522_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1523_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1523_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1524_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1524_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1525_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1525_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1526_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1526_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1518_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1519_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1520_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1521_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1522_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1523_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1524_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1525_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow122.block1526_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow122
