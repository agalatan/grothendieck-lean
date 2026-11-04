import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1656
import Grothe.UpperChaos.OriginalRow227TriangleData1657
import Grothe.UpperChaos.OriginalRow227TriangleData1658
import Grothe.UpperChaos.OriginalRow227TriangleData1659
import Grothe.UpperChaos.OriginalRow227TriangleData1660
import Grothe.UpperChaos.OriginalRow227TriangleData1661
import Grothe.UpperChaos.OriginalRow227TriangleData1662
import Grothe.UpperChaos.OriginalRow227TriangleData1663

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow139

open ConditionalTableLookup

def values1656 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1656.coefficient139_138,
  OriginalRow227TriangleData1656.coefficient139_139,
  OriginalRow227TriangleData1656.coefficient139_140,
  OriginalRow227TriangleData1656.coefficient139_141,
  OriginalRow227TriangleData1656.coefficient139_142,
  OriginalRow227TriangleData1656.coefficient139_143,
  OriginalRow227TriangleData1656.coefficient139_144,
  OriginalRow227TriangleData1656.coefficient139_145,
  OriginalRow227TriangleData1656.coefficient139_146,
  OriginalRow227TriangleData1656.coefficient139_147,
  OriginalRow227TriangleData1656.coefficient139_148,
  OriginalRow227TriangleData1656.coefficient139_149,
  OriginalRow227TriangleData1656.coefficient139_150,
  OriginalRow227TriangleData1656.coefficient139_151,
  OriginalRow227TriangleData1656.coefficient139_152,
  OriginalRow227TriangleData1656.coefficient139_153,
  OriginalRow227TriangleData1656.coefficient139_154,
  OriginalRow227TriangleData1656.coefficient139_155,
  OriginalRow227TriangleData1656.coefficient139_156,
  OriginalRow227TriangleData1656.coefficient139_157,
  OriginalRow227TriangleData1656.coefficient139_158,
  OriginalRow227TriangleData1656.coefficient139_159,
  OriginalRow227TriangleData1656.coefficient139_160,
  OriginalRow227TriangleData1656.coefficient139_161,
  OriginalRow227TriangleData1656.coefficient139_162,
  OriginalRow227TriangleData1656.coefficient139_163,
  OriginalRow227TriangleData1656.coefficient139_164,
  OriginalRow227TriangleData1656.coefficient139_165,
  OriginalRow227TriangleData1656.coefficient139_166,
  OriginalRow227TriangleData1656.coefficient139_167,
  OriginalRow227TriangleData1656.coefficient139_168,
  OriginalRow227TriangleData1656.coefficient139_169
]

theorem values1656_size : values1656.size = 32 := rfl

def block1656 : ℕ → Option IntervalDyadic := segment 138 values1656

theorem block1656_domain : ExactDomain block1656 138 170 := by
  simpa only [values1656_size] using segment_domain 138 values1656

theorem block1656_get (i : Fin 32) :
    block1656 (138 + i.val) = some (values1656[i.val]'(by rw [values1656_size]; exact i.isLt)) := by
  exact segment_get 138 values1656 ⟨i.val, by rw [values1656_size]; exact i.isLt⟩

def values1657 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1657.coefficient139_170,
  OriginalRow227TriangleData1657.coefficient139_171,
  OriginalRow227TriangleData1657.coefficient139_172,
  OriginalRow227TriangleData1657.coefficient139_173,
  OriginalRow227TriangleData1657.coefficient139_174,
  OriginalRow227TriangleData1657.coefficient139_175,
  OriginalRow227TriangleData1657.coefficient139_176,
  OriginalRow227TriangleData1657.coefficient139_177,
  OriginalRow227TriangleData1657.coefficient139_178,
  OriginalRow227TriangleData1657.coefficient139_179,
  OriginalRow227TriangleData1657.coefficient139_180,
  OriginalRow227TriangleData1657.coefficient139_181,
  OriginalRow227TriangleData1657.coefficient139_182,
  OriginalRow227TriangleData1657.coefficient139_183,
  OriginalRow227TriangleData1657.coefficient139_184,
  OriginalRow227TriangleData1657.coefficient139_185,
  OriginalRow227TriangleData1657.coefficient139_186,
  OriginalRow227TriangleData1657.coefficient139_187,
  OriginalRow227TriangleData1657.coefficient139_188,
  OriginalRow227TriangleData1657.coefficient139_189,
  OriginalRow227TriangleData1657.coefficient139_190,
  OriginalRow227TriangleData1657.coefficient139_191,
  OriginalRow227TriangleData1657.coefficient139_192,
  OriginalRow227TriangleData1657.coefficient139_193,
  OriginalRow227TriangleData1657.coefficient139_194,
  OriginalRow227TriangleData1657.coefficient139_195,
  OriginalRow227TriangleData1657.coefficient139_196,
  OriginalRow227TriangleData1657.coefficient139_197,
  OriginalRow227TriangleData1657.coefficient139_198,
  OriginalRow227TriangleData1657.coefficient139_199,
  OriginalRow227TriangleData1657.coefficient139_200,
  OriginalRow227TriangleData1657.coefficient139_201
]

theorem values1657_size : values1657.size = 32 := rfl

def block1657 : ℕ → Option IntervalDyadic := segment 170 values1657

theorem block1657_domain : ExactDomain block1657 170 202 := by
  simpa only [values1657_size] using segment_domain 170 values1657

theorem block1657_get (i : Fin 32) :
    block1657 (170 + i.val) = some (values1657[i.val]'(by rw [values1657_size]; exact i.isLt)) := by
  exact segment_get 170 values1657 ⟨i.val, by rw [values1657_size]; exact i.isLt⟩

def values1658 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1658.coefficient139_202,
  OriginalRow227TriangleData1658.coefficient139_203,
  OriginalRow227TriangleData1658.coefficient139_204,
  OriginalRow227TriangleData1658.coefficient139_205,
  OriginalRow227TriangleData1658.coefficient139_206,
  OriginalRow227TriangleData1658.coefficient139_207,
  OriginalRow227TriangleData1658.coefficient139_208,
  OriginalRow227TriangleData1658.coefficient139_209,
  OriginalRow227TriangleData1658.coefficient139_210,
  OriginalRow227TriangleData1658.coefficient139_211,
  OriginalRow227TriangleData1658.coefficient139_212,
  OriginalRow227TriangleData1658.coefficient139_213,
  OriginalRow227TriangleData1658.coefficient139_214,
  OriginalRow227TriangleData1658.coefficient139_215,
  OriginalRow227TriangleData1658.coefficient139_216,
  OriginalRow227TriangleData1658.coefficient139_217,
  OriginalRow227TriangleData1658.coefficient139_218,
  OriginalRow227TriangleData1658.coefficient139_219,
  OriginalRow227TriangleData1658.coefficient139_220,
  OriginalRow227TriangleData1658.coefficient139_221,
  OriginalRow227TriangleData1658.coefficient139_222,
  OriginalRow227TriangleData1658.coefficient139_223,
  OriginalRow227TriangleData1658.coefficient139_224,
  OriginalRow227TriangleData1658.coefficient139_225,
  OriginalRow227TriangleData1658.coefficient139_226,
  OriginalRow227TriangleData1658.coefficient139_227,
  OriginalRow227TriangleData1658.coefficient139_228,
  OriginalRow227TriangleData1658.coefficient139_229,
  OriginalRow227TriangleData1658.coefficient139_230,
  OriginalRow227TriangleData1658.coefficient139_231,
  OriginalRow227TriangleData1658.coefficient139_232,
  OriginalRow227TriangleData1658.coefficient139_233
]

theorem values1658_size : values1658.size = 32 := rfl

def block1658 : ℕ → Option IntervalDyadic := segment 202 values1658

theorem block1658_domain : ExactDomain block1658 202 234 := by
  simpa only [values1658_size] using segment_domain 202 values1658

theorem block1658_get (i : Fin 32) :
    block1658 (202 + i.val) = some (values1658[i.val]'(by rw [values1658_size]; exact i.isLt)) := by
  exact segment_get 202 values1658 ⟨i.val, by rw [values1658_size]; exact i.isLt⟩

def values1659 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1659.coefficient139_234,
  OriginalRow227TriangleData1659.coefficient139_235,
  OriginalRow227TriangleData1659.coefficient139_236,
  OriginalRow227TriangleData1659.coefficient139_237,
  OriginalRow227TriangleData1659.coefficient139_238,
  OriginalRow227TriangleData1659.coefficient139_239,
  OriginalRow227TriangleData1659.coefficient139_240,
  OriginalRow227TriangleData1659.coefficient139_241,
  OriginalRow227TriangleData1659.coefficient139_242,
  OriginalRow227TriangleData1659.coefficient139_243,
  OriginalRow227TriangleData1659.coefficient139_244,
  OriginalRow227TriangleData1659.coefficient139_245,
  OriginalRow227TriangleData1659.coefficient139_246,
  OriginalRow227TriangleData1659.coefficient139_247,
  OriginalRow227TriangleData1659.coefficient139_248,
  OriginalRow227TriangleData1659.coefficient139_249,
  OriginalRow227TriangleData1659.coefficient139_250,
  OriginalRow227TriangleData1659.coefficient139_251,
  OriginalRow227TriangleData1659.coefficient139_252,
  OriginalRow227TriangleData1659.coefficient139_253,
  OriginalRow227TriangleData1659.coefficient139_254,
  OriginalRow227TriangleData1659.coefficient139_255,
  OriginalRow227TriangleData1659.coefficient139_256,
  OriginalRow227TriangleData1659.coefficient139_257,
  OriginalRow227TriangleData1659.coefficient139_258,
  OriginalRow227TriangleData1659.coefficient139_259,
  OriginalRow227TriangleData1659.coefficient139_260,
  OriginalRow227TriangleData1659.coefficient139_261,
  OriginalRow227TriangleData1659.coefficient139_262,
  OriginalRow227TriangleData1659.coefficient139_263,
  OriginalRow227TriangleData1659.coefficient139_264,
  OriginalRow227TriangleData1659.coefficient139_265
]

theorem values1659_size : values1659.size = 32 := rfl

def block1659 : ℕ → Option IntervalDyadic := segment 234 values1659

theorem block1659_domain : ExactDomain block1659 234 266 := by
  simpa only [values1659_size] using segment_domain 234 values1659

theorem block1659_get (i : Fin 32) :
    block1659 (234 + i.val) = some (values1659[i.val]'(by rw [values1659_size]; exact i.isLt)) := by
  exact segment_get 234 values1659 ⟨i.val, by rw [values1659_size]; exact i.isLt⟩

def values1660 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1660.coefficient139_266,
  OriginalRow227TriangleData1660.coefficient139_267,
  OriginalRow227TriangleData1660.coefficient139_268,
  OriginalRow227TriangleData1660.coefficient139_269,
  OriginalRow227TriangleData1660.coefficient139_270,
  OriginalRow227TriangleData1660.coefficient139_271,
  OriginalRow227TriangleData1660.coefficient139_272,
  OriginalRow227TriangleData1660.coefficient139_273,
  OriginalRow227TriangleData1660.coefficient139_274,
  OriginalRow227TriangleData1660.coefficient139_275,
  OriginalRow227TriangleData1660.coefficient139_276,
  OriginalRow227TriangleData1660.coefficient139_277,
  OriginalRow227TriangleData1660.coefficient139_278,
  OriginalRow227TriangleData1660.coefficient139_279,
  OriginalRow227TriangleData1660.coefficient139_280,
  OriginalRow227TriangleData1660.coefficient139_281,
  OriginalRow227TriangleData1660.coefficient139_282,
  OriginalRow227TriangleData1660.coefficient139_283,
  OriginalRow227TriangleData1660.coefficient139_284,
  OriginalRow227TriangleData1660.coefficient139_285,
  OriginalRow227TriangleData1660.coefficient139_286,
  OriginalRow227TriangleData1660.coefficient139_287,
  OriginalRow227TriangleData1660.coefficient139_288,
  OriginalRow227TriangleData1660.coefficient139_289,
  OriginalRow227TriangleData1660.coefficient139_290,
  OriginalRow227TriangleData1660.coefficient139_291,
  OriginalRow227TriangleData1660.coefficient139_292,
  OriginalRow227TriangleData1660.coefficient139_293,
  OriginalRow227TriangleData1660.coefficient139_294,
  OriginalRow227TriangleData1660.coefficient139_295,
  OriginalRow227TriangleData1660.coefficient139_296,
  OriginalRow227TriangleData1660.coefficient139_297
]

theorem values1660_size : values1660.size = 32 := rfl

def block1660 : ℕ → Option IntervalDyadic := segment 266 values1660

theorem block1660_domain : ExactDomain block1660 266 298 := by
  simpa only [values1660_size] using segment_domain 266 values1660

theorem block1660_get (i : Fin 32) :
    block1660 (266 + i.val) = some (values1660[i.val]'(by rw [values1660_size]; exact i.isLt)) := by
  exact segment_get 266 values1660 ⟨i.val, by rw [values1660_size]; exact i.isLt⟩

def values1661 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1661.coefficient139_298,
  OriginalRow227TriangleData1661.coefficient139_299,
  OriginalRow227TriangleData1661.coefficient139_300,
  OriginalRow227TriangleData1661.coefficient139_301,
  OriginalRow227TriangleData1661.coefficient139_302,
  OriginalRow227TriangleData1661.coefficient139_303,
  OriginalRow227TriangleData1661.coefficient139_304,
  OriginalRow227TriangleData1661.coefficient139_305,
  OriginalRow227TriangleData1661.coefficient139_306,
  OriginalRow227TriangleData1661.coefficient139_307,
  OriginalRow227TriangleData1661.coefficient139_308,
  OriginalRow227TriangleData1661.coefficient139_309,
  OriginalRow227TriangleData1661.coefficient139_310,
  OriginalRow227TriangleData1661.coefficient139_311,
  OriginalRow227TriangleData1661.coefficient139_312,
  OriginalRow227TriangleData1661.coefficient139_313,
  OriginalRow227TriangleData1661.coefficient139_314,
  OriginalRow227TriangleData1661.coefficient139_315,
  OriginalRow227TriangleData1661.coefficient139_316,
  OriginalRow227TriangleData1661.coefficient139_317,
  OriginalRow227TriangleData1661.coefficient139_318,
  OriginalRow227TriangleData1661.coefficient139_319,
  OriginalRow227TriangleData1661.coefficient139_320,
  OriginalRow227TriangleData1661.coefficient139_321,
  OriginalRow227TriangleData1661.coefficient139_322,
  OriginalRow227TriangleData1661.coefficient139_323,
  OriginalRow227TriangleData1661.coefficient139_324,
  OriginalRow227TriangleData1661.coefficient139_325,
  OriginalRow227TriangleData1661.coefficient139_326,
  OriginalRow227TriangleData1661.coefficient139_327,
  OriginalRow227TriangleData1661.coefficient139_328,
  OriginalRow227TriangleData1661.coefficient139_329
]

theorem values1661_size : values1661.size = 32 := rfl

def block1661 : ℕ → Option IntervalDyadic := segment 298 values1661

theorem block1661_domain : ExactDomain block1661 298 330 := by
  simpa only [values1661_size] using segment_domain 298 values1661

theorem block1661_get (i : Fin 32) :
    block1661 (298 + i.val) = some (values1661[i.val]'(by rw [values1661_size]; exact i.isLt)) := by
  exact segment_get 298 values1661 ⟨i.val, by rw [values1661_size]; exact i.isLt⟩

def values1662 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1662.coefficient139_330,
  OriginalRow227TriangleData1662.coefficient139_331,
  OriginalRow227TriangleData1662.coefficient139_332,
  OriginalRow227TriangleData1662.coefficient139_333,
  OriginalRow227TriangleData1662.coefficient139_334,
  OriginalRow227TriangleData1662.coefficient139_335,
  OriginalRow227TriangleData1662.coefficient139_336,
  OriginalRow227TriangleData1662.coefficient139_337,
  OriginalRow227TriangleData1662.coefficient139_338,
  OriginalRow227TriangleData1662.coefficient139_339,
  OriginalRow227TriangleData1662.coefficient139_340,
  OriginalRow227TriangleData1662.coefficient139_341,
  OriginalRow227TriangleData1662.coefficient139_342,
  OriginalRow227TriangleData1662.coefficient139_343,
  OriginalRow227TriangleData1662.coefficient139_344,
  OriginalRow227TriangleData1662.coefficient139_345,
  OriginalRow227TriangleData1662.coefficient139_346,
  OriginalRow227TriangleData1662.coefficient139_347,
  OriginalRow227TriangleData1662.coefficient139_348,
  OriginalRow227TriangleData1662.coefficient139_349,
  OriginalRow227TriangleData1662.coefficient139_350,
  OriginalRow227TriangleData1662.coefficient139_351,
  OriginalRow227TriangleData1662.coefficient139_352,
  OriginalRow227TriangleData1662.coefficient139_353,
  OriginalRow227TriangleData1662.coefficient139_354,
  OriginalRow227TriangleData1662.coefficient139_355,
  OriginalRow227TriangleData1662.coefficient139_356,
  OriginalRow227TriangleData1662.coefficient139_357,
  OriginalRow227TriangleData1662.coefficient139_358,
  OriginalRow227TriangleData1662.coefficient139_359,
  OriginalRow227TriangleData1662.coefficient139_360,
  OriginalRow227TriangleData1662.coefficient139_361
]

theorem values1662_size : values1662.size = 32 := rfl

def block1662 : ℕ → Option IntervalDyadic := segment 330 values1662

theorem block1662_domain : ExactDomain block1662 330 362 := by
  simpa only [values1662_size] using segment_domain 330 values1662

theorem block1662_get (i : Fin 32) :
    block1662 (330 + i.val) = some (values1662[i.val]'(by rw [values1662_size]; exact i.isLt)) := by
  exact segment_get 330 values1662 ⟨i.val, by rw [values1662_size]; exact i.isLt⟩

def values1663 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1663.coefficient139_362
]

theorem values1663_size : values1663.size = 1 := rfl

def block1663 : ℕ → Option IntervalDyadic := segment 362 values1663

theorem block1663_domain : ExactDomain block1663 362 363 := by
  simpa only [values1663_size] using segment_domain 362 values1663

theorem block1663_get (i : Fin 1) :
    block1663 (362 + i.val) = some (values1663[i.val]'(by rw [values1663_size]; exact i.isLt)) := by
  exact segment_get 362 values1663 ⟨i.val, by rw [values1663_size]; exact i.isLt⟩

def node0138_0202 : ℕ → Option IntervalDyadic := split 170 block1656 block1657

theorem node0138_0202_domain : ExactDomain node0138_0202 138 202 := by
  exact split_domain (by decide) (by decide) block1656_domain block1657_domain

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block1658 block1659

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block1658_domain block1659_domain

def node0138_0266 : ℕ → Option IntervalDyadic := split 202 node0138_0202 node0202_0266

theorem node0138_0266_domain : ExactDomain node0138_0266 138 266 := by
  exact split_domain (by decide) (by decide) node0138_0202_domain node0202_0266_domain

def node0266_0330 : ℕ → Option IntervalDyadic := split 298 block1660 block1661

theorem node0266_0330_domain : ExactDomain node0266_0330 266 330 := by
  exact split_domain (by decide) (by decide) block1660_domain block1661_domain

def node0330_0363 : ℕ → Option IntervalDyadic := split 362 block1662 block1663

theorem node0330_0363_domain : ExactDomain node0330_0363 330 363 := by
  exact split_domain (by decide) (by decide) block1662_domain block1663_domain

def node0266_0363 : ℕ → Option IntervalDyadic := split 330 node0266_0330 node0330_0363

theorem node0266_0363_domain : ExactDomain node0266_0363 266 363 := by
  exact split_domain (by decide) (by decide) node0266_0330_domain node0330_0363_domain

def node0138_0363 : ℕ → Option IntervalDyadic := split 266 node0138_0266 node0266_0363

theorem node0138_0363_domain : ExactDomain node0138_0363 138 363 := by
  exact split_domain (by decide) (by decide) node0138_0266_domain node0266_0363_domain

def lookup : ℕ → Option IntervalDyadic := node0138_0363

theorem lookup_domain : ExactDomain lookup 138 363 :=
  node0138_0363_domain

theorem block1656_lookup (i : Fin 32) :
    lookup (138 + i.val) = some (values1656[i.val]'(by rw [values1656_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (138 + i.val) = _
  rw [node0138_0363, split_left 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0138_0266, split_left 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0138_0202, split_left 170 block1656 block1657 (by omega)]
  exact block1656_get i

theorem block1657_lookup (i : Fin 32) :
    lookup (170 + i.val) = some (values1657[i.val]'(by rw [values1657_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (170 + i.val) = _
  rw [node0138_0363, split_left 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0138_0266, split_left 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0138_0202, split_right 170 block1656 block1657 (by omega)]
  exact block1657_get i

theorem block1658_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values1658[i.val]'(by rw [values1658_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (202 + i.val) = _
  rw [node0138_0363, split_left 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0138_0266, split_right 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0202_0266, split_left 234 block1658 block1659 (by omega)]
  exact block1658_get i

theorem block1659_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values1659[i.val]'(by rw [values1659_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (234 + i.val) = _
  rw [node0138_0363, split_left 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0138_0266, split_right 202 node0138_0202 node0202_0266 (by omega)]
  rw [node0202_0266, split_right 234 block1658 block1659 (by omega)]
  exact block1659_get i

theorem block1660_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values1660[i.val]'(by rw [values1660_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (266 + i.val) = _
  rw [node0138_0363, split_right 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0266_0363, split_left 330 node0266_0330 node0330_0363 (by omega)]
  rw [node0266_0330, split_left 298 block1660 block1661 (by omega)]
  exact block1660_get i

theorem block1661_lookup (i : Fin 32) :
    lookup (298 + i.val) = some (values1661[i.val]'(by rw [values1661_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (298 + i.val) = _
  rw [node0138_0363, split_right 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0266_0363, split_left 330 node0266_0330 node0330_0363 (by omega)]
  rw [node0266_0330, split_right 298 block1660 block1661 (by omega)]
  exact block1661_get i

theorem block1662_lookup (i : Fin 32) :
    lookup (330 + i.val) = some (values1662[i.val]'(by rw [values1662_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (330 + i.val) = _
  rw [node0138_0363, split_right 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0266_0363, split_right 330 node0266_0330 node0330_0363 (by omega)]
  rw [node0330_0363, split_left 362 block1662 block1663 (by omega)]
  exact block1662_get i

theorem block1663_lookup (i : Fin 1) :
    lookup (362 + i.val) = some (values1663[i.val]'(by rw [values1663_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0138_0363 (362 + i.val) = _
  rw [node0138_0363, split_right 266 node0138_0266 node0266_0363 (by omega)]
  rw [node0266_0363, split_right 330 node0266_0330 node0330_0363 (by omega)]
  rw [node0330_0363, split_right 362 block1662 block1663 (by omega)]
  exact block1663_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1656_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1656_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1657_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1657_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1658_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1658_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1659_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1659_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1660_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1660_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1661_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1661_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1662_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1662_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1663_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1663_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1656_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1657_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1658_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1659_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1660_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1661_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1662_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow139.block1663_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow139
