import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1509
import Grothe.UpperChaos.OriginalRow227TriangleData1510
import Grothe.UpperChaos.OriginalRow227TriangleData1511
import Grothe.UpperChaos.OriginalRow227TriangleData1512
import Grothe.UpperChaos.OriginalRow227TriangleData1513
import Grothe.UpperChaos.OriginalRow227TriangleData1514
import Grothe.UpperChaos.OriginalRow227TriangleData1515
import Grothe.UpperChaos.OriginalRow227TriangleData1516
import Grothe.UpperChaos.OriginalRow227TriangleData1517

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow121

open ConditionalTableLookup

def values1509 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1509.coefficient121_120,
  OriginalRow227TriangleData1509.coefficient121_121,
  OriginalRow227TriangleData1509.coefficient121_122,
  OriginalRow227TriangleData1509.coefficient121_123,
  OriginalRow227TriangleData1509.coefficient121_124,
  OriginalRow227TriangleData1509.coefficient121_125,
  OriginalRow227TriangleData1509.coefficient121_126,
  OriginalRow227TriangleData1509.coefficient121_127,
  OriginalRow227TriangleData1509.coefficient121_128,
  OriginalRow227TriangleData1509.coefficient121_129,
  OriginalRow227TriangleData1509.coefficient121_130,
  OriginalRow227TriangleData1509.coefficient121_131,
  OriginalRow227TriangleData1509.coefficient121_132,
  OriginalRow227TriangleData1509.coefficient121_133,
  OriginalRow227TriangleData1509.coefficient121_134,
  OriginalRow227TriangleData1509.coefficient121_135,
  OriginalRow227TriangleData1509.coefficient121_136,
  OriginalRow227TriangleData1509.coefficient121_137,
  OriginalRow227TriangleData1509.coefficient121_138,
  OriginalRow227TriangleData1509.coefficient121_139,
  OriginalRow227TriangleData1509.coefficient121_140,
  OriginalRow227TriangleData1509.coefficient121_141,
  OriginalRow227TriangleData1509.coefficient121_142,
  OriginalRow227TriangleData1509.coefficient121_143,
  OriginalRow227TriangleData1509.coefficient121_144,
  OriginalRow227TriangleData1509.coefficient121_145,
  OriginalRow227TriangleData1509.coefficient121_146,
  OriginalRow227TriangleData1509.coefficient121_147,
  OriginalRow227TriangleData1509.coefficient121_148,
  OriginalRow227TriangleData1509.coefficient121_149,
  OriginalRow227TriangleData1509.coefficient121_150,
  OriginalRow227TriangleData1509.coefficient121_151
]

theorem values1509_size : values1509.size = 32 := rfl

def block1509 : ℕ → Option IntervalDyadic := segment 120 values1509

theorem block1509_domain : ExactDomain block1509 120 152 := by
  simpa only [values1509_size] using segment_domain 120 values1509

theorem block1509_get (i : Fin 32) :
    block1509 (120 + i.val) = some (values1509[i.val]'(by rw [values1509_size]; exact i.isLt)) := by
  exact segment_get 120 values1509 ⟨i.val, by rw [values1509_size]; exact i.isLt⟩

def values1510 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1510.coefficient121_152,
  OriginalRow227TriangleData1510.coefficient121_153,
  OriginalRow227TriangleData1510.coefficient121_154,
  OriginalRow227TriangleData1510.coefficient121_155,
  OriginalRow227TriangleData1510.coefficient121_156,
  OriginalRow227TriangleData1510.coefficient121_157,
  OriginalRow227TriangleData1510.coefficient121_158,
  OriginalRow227TriangleData1510.coefficient121_159,
  OriginalRow227TriangleData1510.coefficient121_160,
  OriginalRow227TriangleData1510.coefficient121_161,
  OriginalRow227TriangleData1510.coefficient121_162,
  OriginalRow227TriangleData1510.coefficient121_163,
  OriginalRow227TriangleData1510.coefficient121_164,
  OriginalRow227TriangleData1510.coefficient121_165,
  OriginalRow227TriangleData1510.coefficient121_166,
  OriginalRow227TriangleData1510.coefficient121_167,
  OriginalRow227TriangleData1510.coefficient121_168,
  OriginalRow227TriangleData1510.coefficient121_169,
  OriginalRow227TriangleData1510.coefficient121_170,
  OriginalRow227TriangleData1510.coefficient121_171,
  OriginalRow227TriangleData1510.coefficient121_172,
  OriginalRow227TriangleData1510.coefficient121_173,
  OriginalRow227TriangleData1510.coefficient121_174,
  OriginalRow227TriangleData1510.coefficient121_175,
  OriginalRow227TriangleData1510.coefficient121_176,
  OriginalRow227TriangleData1510.coefficient121_177,
  OriginalRow227TriangleData1510.coefficient121_178,
  OriginalRow227TriangleData1510.coefficient121_179,
  OriginalRow227TriangleData1510.coefficient121_180,
  OriginalRow227TriangleData1510.coefficient121_181,
  OriginalRow227TriangleData1510.coefficient121_182,
  OriginalRow227TriangleData1510.coefficient121_183
]

theorem values1510_size : values1510.size = 32 := rfl

def block1510 : ℕ → Option IntervalDyadic := segment 152 values1510

theorem block1510_domain : ExactDomain block1510 152 184 := by
  simpa only [values1510_size] using segment_domain 152 values1510

theorem block1510_get (i : Fin 32) :
    block1510 (152 + i.val) = some (values1510[i.val]'(by rw [values1510_size]; exact i.isLt)) := by
  exact segment_get 152 values1510 ⟨i.val, by rw [values1510_size]; exact i.isLt⟩

def values1511 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1511.coefficient121_184,
  OriginalRow227TriangleData1511.coefficient121_185,
  OriginalRow227TriangleData1511.coefficient121_186,
  OriginalRow227TriangleData1511.coefficient121_187,
  OriginalRow227TriangleData1511.coefficient121_188,
  OriginalRow227TriangleData1511.coefficient121_189,
  OriginalRow227TriangleData1511.coefficient121_190,
  OriginalRow227TriangleData1511.coefficient121_191,
  OriginalRow227TriangleData1511.coefficient121_192,
  OriginalRow227TriangleData1511.coefficient121_193,
  OriginalRow227TriangleData1511.coefficient121_194,
  OriginalRow227TriangleData1511.coefficient121_195,
  OriginalRow227TriangleData1511.coefficient121_196,
  OriginalRow227TriangleData1511.coefficient121_197,
  OriginalRow227TriangleData1511.coefficient121_198,
  OriginalRow227TriangleData1511.coefficient121_199,
  OriginalRow227TriangleData1511.coefficient121_200,
  OriginalRow227TriangleData1511.coefficient121_201,
  OriginalRow227TriangleData1511.coefficient121_202,
  OriginalRow227TriangleData1511.coefficient121_203,
  OriginalRow227TriangleData1511.coefficient121_204,
  OriginalRow227TriangleData1511.coefficient121_205,
  OriginalRow227TriangleData1511.coefficient121_206,
  OriginalRow227TriangleData1511.coefficient121_207,
  OriginalRow227TriangleData1511.coefficient121_208,
  OriginalRow227TriangleData1511.coefficient121_209,
  OriginalRow227TriangleData1511.coefficient121_210,
  OriginalRow227TriangleData1511.coefficient121_211,
  OriginalRow227TriangleData1511.coefficient121_212,
  OriginalRow227TriangleData1511.coefficient121_213,
  OriginalRow227TriangleData1511.coefficient121_214,
  OriginalRow227TriangleData1511.coefficient121_215
]

theorem values1511_size : values1511.size = 32 := rfl

def block1511 : ℕ → Option IntervalDyadic := segment 184 values1511

theorem block1511_domain : ExactDomain block1511 184 216 := by
  simpa only [values1511_size] using segment_domain 184 values1511

theorem block1511_get (i : Fin 32) :
    block1511 (184 + i.val) = some (values1511[i.val]'(by rw [values1511_size]; exact i.isLt)) := by
  exact segment_get 184 values1511 ⟨i.val, by rw [values1511_size]; exact i.isLt⟩

def values1512 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1512.coefficient121_216,
  OriginalRow227TriangleData1512.coefficient121_217,
  OriginalRow227TriangleData1512.coefficient121_218,
  OriginalRow227TriangleData1512.coefficient121_219,
  OriginalRow227TriangleData1512.coefficient121_220,
  OriginalRow227TriangleData1512.coefficient121_221,
  OriginalRow227TriangleData1512.coefficient121_222,
  OriginalRow227TriangleData1512.coefficient121_223,
  OriginalRow227TriangleData1512.coefficient121_224,
  OriginalRow227TriangleData1512.coefficient121_225,
  OriginalRow227TriangleData1512.coefficient121_226,
  OriginalRow227TriangleData1512.coefficient121_227,
  OriginalRow227TriangleData1512.coefficient121_228,
  OriginalRow227TriangleData1512.coefficient121_229,
  OriginalRow227TriangleData1512.coefficient121_230,
  OriginalRow227TriangleData1512.coefficient121_231,
  OriginalRow227TriangleData1512.coefficient121_232,
  OriginalRow227TriangleData1512.coefficient121_233,
  OriginalRow227TriangleData1512.coefficient121_234,
  OriginalRow227TriangleData1512.coefficient121_235,
  OriginalRow227TriangleData1512.coefficient121_236,
  OriginalRow227TriangleData1512.coefficient121_237,
  OriginalRow227TriangleData1512.coefficient121_238,
  OriginalRow227TriangleData1512.coefficient121_239,
  OriginalRow227TriangleData1512.coefficient121_240,
  OriginalRow227TriangleData1512.coefficient121_241,
  OriginalRow227TriangleData1512.coefficient121_242,
  OriginalRow227TriangleData1512.coefficient121_243,
  OriginalRow227TriangleData1512.coefficient121_244,
  OriginalRow227TriangleData1512.coefficient121_245,
  OriginalRow227TriangleData1512.coefficient121_246,
  OriginalRow227TriangleData1512.coefficient121_247
]

theorem values1512_size : values1512.size = 32 := rfl

def block1512 : ℕ → Option IntervalDyadic := segment 216 values1512

theorem block1512_domain : ExactDomain block1512 216 248 := by
  simpa only [values1512_size] using segment_domain 216 values1512

theorem block1512_get (i : Fin 32) :
    block1512 (216 + i.val) = some (values1512[i.val]'(by rw [values1512_size]; exact i.isLt)) := by
  exact segment_get 216 values1512 ⟨i.val, by rw [values1512_size]; exact i.isLt⟩

def values1513 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1513.coefficient121_248,
  OriginalRow227TriangleData1513.coefficient121_249,
  OriginalRow227TriangleData1513.coefficient121_250,
  OriginalRow227TriangleData1513.coefficient121_251,
  OriginalRow227TriangleData1513.coefficient121_252,
  OriginalRow227TriangleData1513.coefficient121_253,
  OriginalRow227TriangleData1513.coefficient121_254,
  OriginalRow227TriangleData1513.coefficient121_255,
  OriginalRow227TriangleData1513.coefficient121_256,
  OriginalRow227TriangleData1513.coefficient121_257,
  OriginalRow227TriangleData1513.coefficient121_258,
  OriginalRow227TriangleData1513.coefficient121_259,
  OriginalRow227TriangleData1513.coefficient121_260,
  OriginalRow227TriangleData1513.coefficient121_261,
  OriginalRow227TriangleData1513.coefficient121_262,
  OriginalRow227TriangleData1513.coefficient121_263,
  OriginalRow227TriangleData1513.coefficient121_264,
  OriginalRow227TriangleData1513.coefficient121_265,
  OriginalRow227TriangleData1513.coefficient121_266,
  OriginalRow227TriangleData1513.coefficient121_267,
  OriginalRow227TriangleData1513.coefficient121_268,
  OriginalRow227TriangleData1513.coefficient121_269,
  OriginalRow227TriangleData1513.coefficient121_270,
  OriginalRow227TriangleData1513.coefficient121_271,
  OriginalRow227TriangleData1513.coefficient121_272,
  OriginalRow227TriangleData1513.coefficient121_273,
  OriginalRow227TriangleData1513.coefficient121_274,
  OriginalRow227TriangleData1513.coefficient121_275,
  OriginalRow227TriangleData1513.coefficient121_276,
  OriginalRow227TriangleData1513.coefficient121_277,
  OriginalRow227TriangleData1513.coefficient121_278,
  OriginalRow227TriangleData1513.coefficient121_279
]

theorem values1513_size : values1513.size = 32 := rfl

def block1513 : ℕ → Option IntervalDyadic := segment 248 values1513

theorem block1513_domain : ExactDomain block1513 248 280 := by
  simpa only [values1513_size] using segment_domain 248 values1513

theorem block1513_get (i : Fin 32) :
    block1513 (248 + i.val) = some (values1513[i.val]'(by rw [values1513_size]; exact i.isLt)) := by
  exact segment_get 248 values1513 ⟨i.val, by rw [values1513_size]; exact i.isLt⟩

def values1514 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1514.coefficient121_280,
  OriginalRow227TriangleData1514.coefficient121_281,
  OriginalRow227TriangleData1514.coefficient121_282,
  OriginalRow227TriangleData1514.coefficient121_283,
  OriginalRow227TriangleData1514.coefficient121_284,
  OriginalRow227TriangleData1514.coefficient121_285,
  OriginalRow227TriangleData1514.coefficient121_286,
  OriginalRow227TriangleData1514.coefficient121_287,
  OriginalRow227TriangleData1514.coefficient121_288,
  OriginalRow227TriangleData1514.coefficient121_289,
  OriginalRow227TriangleData1514.coefficient121_290,
  OriginalRow227TriangleData1514.coefficient121_291,
  OriginalRow227TriangleData1514.coefficient121_292,
  OriginalRow227TriangleData1514.coefficient121_293,
  OriginalRow227TriangleData1514.coefficient121_294,
  OriginalRow227TriangleData1514.coefficient121_295,
  OriginalRow227TriangleData1514.coefficient121_296,
  OriginalRow227TriangleData1514.coefficient121_297,
  OriginalRow227TriangleData1514.coefficient121_298,
  OriginalRow227TriangleData1514.coefficient121_299,
  OriginalRow227TriangleData1514.coefficient121_300,
  OriginalRow227TriangleData1514.coefficient121_301,
  OriginalRow227TriangleData1514.coefficient121_302,
  OriginalRow227TriangleData1514.coefficient121_303,
  OriginalRow227TriangleData1514.coefficient121_304,
  OriginalRow227TriangleData1514.coefficient121_305,
  OriginalRow227TriangleData1514.coefficient121_306,
  OriginalRow227TriangleData1514.coefficient121_307,
  OriginalRow227TriangleData1514.coefficient121_308,
  OriginalRow227TriangleData1514.coefficient121_309,
  OriginalRow227TriangleData1514.coefficient121_310,
  OriginalRow227TriangleData1514.coefficient121_311
]

theorem values1514_size : values1514.size = 32 := rfl

def block1514 : ℕ → Option IntervalDyadic := segment 280 values1514

theorem block1514_domain : ExactDomain block1514 280 312 := by
  simpa only [values1514_size] using segment_domain 280 values1514

theorem block1514_get (i : Fin 32) :
    block1514 (280 + i.val) = some (values1514[i.val]'(by rw [values1514_size]; exact i.isLt)) := by
  exact segment_get 280 values1514 ⟨i.val, by rw [values1514_size]; exact i.isLt⟩

def values1515 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1515.coefficient121_312,
  OriginalRow227TriangleData1515.coefficient121_313,
  OriginalRow227TriangleData1515.coefficient121_314,
  OriginalRow227TriangleData1515.coefficient121_315,
  OriginalRow227TriangleData1515.coefficient121_316,
  OriginalRow227TriangleData1515.coefficient121_317,
  OriginalRow227TriangleData1515.coefficient121_318,
  OriginalRow227TriangleData1515.coefficient121_319,
  OriginalRow227TriangleData1515.coefficient121_320,
  OriginalRow227TriangleData1515.coefficient121_321,
  OriginalRow227TriangleData1515.coefficient121_322,
  OriginalRow227TriangleData1515.coefficient121_323,
  OriginalRow227TriangleData1515.coefficient121_324,
  OriginalRow227TriangleData1515.coefficient121_325,
  OriginalRow227TriangleData1515.coefficient121_326,
  OriginalRow227TriangleData1515.coefficient121_327,
  OriginalRow227TriangleData1515.coefficient121_328,
  OriginalRow227TriangleData1515.coefficient121_329,
  OriginalRow227TriangleData1515.coefficient121_330,
  OriginalRow227TriangleData1515.coefficient121_331,
  OriginalRow227TriangleData1515.coefficient121_332,
  OriginalRow227TriangleData1515.coefficient121_333,
  OriginalRow227TriangleData1515.coefficient121_334,
  OriginalRow227TriangleData1515.coefficient121_335,
  OriginalRow227TriangleData1515.coefficient121_336,
  OriginalRow227TriangleData1515.coefficient121_337,
  OriginalRow227TriangleData1515.coefficient121_338,
  OriginalRow227TriangleData1515.coefficient121_339,
  OriginalRow227TriangleData1515.coefficient121_340,
  OriginalRow227TriangleData1515.coefficient121_341,
  OriginalRow227TriangleData1515.coefficient121_342,
  OriginalRow227TriangleData1515.coefficient121_343
]

theorem values1515_size : values1515.size = 32 := rfl

def block1515 : ℕ → Option IntervalDyadic := segment 312 values1515

theorem block1515_domain : ExactDomain block1515 312 344 := by
  simpa only [values1515_size] using segment_domain 312 values1515

theorem block1515_get (i : Fin 32) :
    block1515 (312 + i.val) = some (values1515[i.val]'(by rw [values1515_size]; exact i.isLt)) := by
  exact segment_get 312 values1515 ⟨i.val, by rw [values1515_size]; exact i.isLt⟩

def values1516 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1516.coefficient121_344,
  OriginalRow227TriangleData1516.coefficient121_345,
  OriginalRow227TriangleData1516.coefficient121_346,
  OriginalRow227TriangleData1516.coefficient121_347,
  OriginalRow227TriangleData1516.coefficient121_348,
  OriginalRow227TriangleData1516.coefficient121_349,
  OriginalRow227TriangleData1516.coefficient121_350,
  OriginalRow227TriangleData1516.coefficient121_351,
  OriginalRow227TriangleData1516.coefficient121_352,
  OriginalRow227TriangleData1516.coefficient121_353,
  OriginalRow227TriangleData1516.coefficient121_354,
  OriginalRow227TriangleData1516.coefficient121_355,
  OriginalRow227TriangleData1516.coefficient121_356,
  OriginalRow227TriangleData1516.coefficient121_357,
  OriginalRow227TriangleData1516.coefficient121_358,
  OriginalRow227TriangleData1516.coefficient121_359,
  OriginalRow227TriangleData1516.coefficient121_360,
  OriginalRow227TriangleData1516.coefficient121_361,
  OriginalRow227TriangleData1516.coefficient121_362,
  OriginalRow227TriangleData1516.coefficient121_363,
  OriginalRow227TriangleData1516.coefficient121_364,
  OriginalRow227TriangleData1516.coefficient121_365,
  OriginalRow227TriangleData1516.coefficient121_366,
  OriginalRow227TriangleData1516.coefficient121_367,
  OriginalRow227TriangleData1516.coefficient121_368,
  OriginalRow227TriangleData1516.coefficient121_369,
  OriginalRow227TriangleData1516.coefficient121_370,
  OriginalRow227TriangleData1516.coefficient121_371,
  OriginalRow227TriangleData1516.coefficient121_372,
  OriginalRow227TriangleData1516.coefficient121_373,
  OriginalRow227TriangleData1516.coefficient121_374,
  OriginalRow227TriangleData1516.coefficient121_375
]

theorem values1516_size : values1516.size = 32 := rfl

def block1516 : ℕ → Option IntervalDyadic := segment 344 values1516

theorem block1516_domain : ExactDomain block1516 344 376 := by
  simpa only [values1516_size] using segment_domain 344 values1516

theorem block1516_get (i : Fin 32) :
    block1516 (344 + i.val) = some (values1516[i.val]'(by rw [values1516_size]; exact i.isLt)) := by
  exact segment_get 344 values1516 ⟨i.val, by rw [values1516_size]; exact i.isLt⟩

def values1517 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1517.coefficient121_376,
  OriginalRow227TriangleData1517.coefficient121_377,
  OriginalRow227TriangleData1517.coefficient121_378,
  OriginalRow227TriangleData1517.coefficient121_379,
  OriginalRow227TriangleData1517.coefficient121_380
]

theorem values1517_size : values1517.size = 5 := rfl

def block1517 : ℕ → Option IntervalDyadic := segment 376 values1517

theorem block1517_domain : ExactDomain block1517 376 381 := by
  simpa only [values1517_size] using segment_domain 376 values1517

theorem block1517_get (i : Fin 5) :
    block1517 (376 + i.val) = some (values1517[i.val]'(by rw [values1517_size]; exact i.isLt)) := by
  exact segment_get 376 values1517 ⟨i.val, by rw [values1517_size]; exact i.isLt⟩

def node0120_0184 : ℕ → Option IntervalDyadic := split 152 block1509 block1510

theorem node0120_0184_domain : ExactDomain node0120_0184 120 184 := by
  exact split_domain (by decide) (by decide) block1509_domain block1510_domain

def node0184_0248 : ℕ → Option IntervalDyadic := split 216 block1511 block1512

theorem node0184_0248_domain : ExactDomain node0184_0248 184 248 := by
  exact split_domain (by decide) (by decide) block1511_domain block1512_domain

def node0120_0248 : ℕ → Option IntervalDyadic := split 184 node0120_0184 node0184_0248

theorem node0120_0248_domain : ExactDomain node0120_0248 120 248 := by
  exact split_domain (by decide) (by decide) node0120_0184_domain node0184_0248_domain

def node0248_0312 : ℕ → Option IntervalDyadic := split 280 block1513 block1514

theorem node0248_0312_domain : ExactDomain node0248_0312 248 312 := by
  exact split_domain (by decide) (by decide) block1513_domain block1514_domain

def node0344_0381 : ℕ → Option IntervalDyadic := split 376 block1516 block1517

theorem node0344_0381_domain : ExactDomain node0344_0381 344 381 := by
  exact split_domain (by decide) (by decide) block1516_domain block1517_domain

def node0312_0381 : ℕ → Option IntervalDyadic := split 344 block1515 node0344_0381

theorem node0312_0381_domain : ExactDomain node0312_0381 312 381 := by
  exact split_domain (by decide) (by decide) block1515_domain node0344_0381_domain

def node0248_0381 : ℕ → Option IntervalDyadic := split 312 node0248_0312 node0312_0381

theorem node0248_0381_domain : ExactDomain node0248_0381 248 381 := by
  exact split_domain (by decide) (by decide) node0248_0312_domain node0312_0381_domain

def node0120_0381 : ℕ → Option IntervalDyadic := split 248 node0120_0248 node0248_0381

theorem node0120_0381_domain : ExactDomain node0120_0381 120 381 := by
  exact split_domain (by decide) (by decide) node0120_0248_domain node0248_0381_domain

def lookup : ℕ → Option IntervalDyadic := node0120_0381

theorem lookup_domain : ExactDomain lookup 120 381 :=
  node0120_0381_domain

theorem block1509_lookup (i : Fin 32) :
    lookup (120 + i.val) = some (values1509[i.val]'(by rw [values1509_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (120 + i.val) = _
  rw [node0120_0381, split_left 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0120_0248, split_left 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0120_0184, split_left 152 block1509 block1510 (by omega)]
  exact block1509_get i

theorem block1510_lookup (i : Fin 32) :
    lookup (152 + i.val) = some (values1510[i.val]'(by rw [values1510_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (152 + i.val) = _
  rw [node0120_0381, split_left 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0120_0248, split_left 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0120_0184, split_right 152 block1509 block1510 (by omega)]
  exact block1510_get i

theorem block1511_lookup (i : Fin 32) :
    lookup (184 + i.val) = some (values1511[i.val]'(by rw [values1511_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (184 + i.val) = _
  rw [node0120_0381, split_left 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0120_0248, split_right 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0184_0248, split_left 216 block1511 block1512 (by omega)]
  exact block1511_get i

theorem block1512_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values1512[i.val]'(by rw [values1512_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (216 + i.val) = _
  rw [node0120_0381, split_left 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0120_0248, split_right 184 node0120_0184 node0184_0248 (by omega)]
  rw [node0184_0248, split_right 216 block1511 block1512 (by omega)]
  exact block1512_get i

theorem block1513_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values1513[i.val]'(by rw [values1513_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (248 + i.val) = _
  rw [node0120_0381, split_right 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0248_0381, split_left 312 node0248_0312 node0312_0381 (by omega)]
  rw [node0248_0312, split_left 280 block1513 block1514 (by omega)]
  exact block1513_get i

theorem block1514_lookup (i : Fin 32) :
    lookup (280 + i.val) = some (values1514[i.val]'(by rw [values1514_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (280 + i.val) = _
  rw [node0120_0381, split_right 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0248_0381, split_left 312 node0248_0312 node0312_0381 (by omega)]
  rw [node0248_0312, split_right 280 block1513 block1514 (by omega)]
  exact block1514_get i

theorem block1515_lookup (i : Fin 32) :
    lookup (312 + i.val) = some (values1515[i.val]'(by rw [values1515_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (312 + i.val) = _
  rw [node0120_0381, split_right 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0248_0381, split_right 312 node0248_0312 node0312_0381 (by omega)]
  rw [node0312_0381, split_left 344 block1515 node0344_0381 (by omega)]
  exact block1515_get i

theorem block1516_lookup (i : Fin 32) :
    lookup (344 + i.val) = some (values1516[i.val]'(by rw [values1516_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (344 + i.val) = _
  rw [node0120_0381, split_right 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0248_0381, split_right 312 node0248_0312 node0312_0381 (by omega)]
  rw [node0312_0381, split_right 344 block1515 node0344_0381 (by omega)]
  rw [node0344_0381, split_left 376 block1516 block1517 (by omega)]
  exact block1516_get i

theorem block1517_lookup (i : Fin 5) :
    lookup (376 + i.val) = some (values1517[i.val]'(by rw [values1517_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0120_0381 (376 + i.val) = _
  rw [node0120_0381, split_right 248 node0120_0248 node0248_0381 (by omega)]
  rw [node0248_0381, split_right 312 node0248_0312 node0312_0381 (by omega)]
  rw [node0312_0381, split_right 344 block1515 node0344_0381 (by omega)]
  rw [node0344_0381, split_right 376 block1516 block1517 (by omega)]
  exact block1517_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1509_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1509_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1510_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1510_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1511_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1511_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1512_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1512_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1513_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1513_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1514_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1514_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1515_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1515_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1516_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1516_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1517_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1517_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1509_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1510_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1511_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1512_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1513_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1514_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1515_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1516_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow121.block1517_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow121
