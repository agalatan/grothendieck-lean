import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1685
import Grothe.UpperChaos.OriginalRow227TriangleData1686
import Grothe.UpperChaos.OriginalRow227TriangleData1687
import Grothe.UpperChaos.OriginalRow227TriangleData1688
import Grothe.UpperChaos.OriginalRow227TriangleData1689
import Grothe.UpperChaos.OriginalRow227TriangleData1690
import Grothe.UpperChaos.OriginalRow227TriangleData1691

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow143

open ConditionalTableLookup

def values1685 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1685.coefficient143_142,
  OriginalRow227TriangleData1685.coefficient143_143,
  OriginalRow227TriangleData1685.coefficient143_144,
  OriginalRow227TriangleData1685.coefficient143_145,
  OriginalRow227TriangleData1685.coefficient143_146,
  OriginalRow227TriangleData1685.coefficient143_147,
  OriginalRow227TriangleData1685.coefficient143_148,
  OriginalRow227TriangleData1685.coefficient143_149,
  OriginalRow227TriangleData1685.coefficient143_150,
  OriginalRow227TriangleData1685.coefficient143_151,
  OriginalRow227TriangleData1685.coefficient143_152,
  OriginalRow227TriangleData1685.coefficient143_153,
  OriginalRow227TriangleData1685.coefficient143_154,
  OriginalRow227TriangleData1685.coefficient143_155,
  OriginalRow227TriangleData1685.coefficient143_156,
  OriginalRow227TriangleData1685.coefficient143_157,
  OriginalRow227TriangleData1685.coefficient143_158,
  OriginalRow227TriangleData1685.coefficient143_159,
  OriginalRow227TriangleData1685.coefficient143_160,
  OriginalRow227TriangleData1685.coefficient143_161,
  OriginalRow227TriangleData1685.coefficient143_162,
  OriginalRow227TriangleData1685.coefficient143_163,
  OriginalRow227TriangleData1685.coefficient143_164,
  OriginalRow227TriangleData1685.coefficient143_165,
  OriginalRow227TriangleData1685.coefficient143_166,
  OriginalRow227TriangleData1685.coefficient143_167,
  OriginalRow227TriangleData1685.coefficient143_168,
  OriginalRow227TriangleData1685.coefficient143_169,
  OriginalRow227TriangleData1685.coefficient143_170,
  OriginalRow227TriangleData1685.coefficient143_171,
  OriginalRow227TriangleData1685.coefficient143_172,
  OriginalRow227TriangleData1685.coefficient143_173
]

theorem values1685_size : values1685.size = 32 := rfl

def block1685 : ℕ → Option IntervalDyadic := segment 142 values1685

theorem block1685_domain : ExactDomain block1685 142 174 := by
  simpa only [values1685_size] using segment_domain 142 values1685

theorem block1685_get (i : Fin 32) :
    block1685 (142 + i.val) = some (values1685[i.val]'(by rw [values1685_size]; exact i.isLt)) := by
  exact segment_get 142 values1685 ⟨i.val, by rw [values1685_size]; exact i.isLt⟩

def values1686 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1686.coefficient143_174,
  OriginalRow227TriangleData1686.coefficient143_175,
  OriginalRow227TriangleData1686.coefficient143_176,
  OriginalRow227TriangleData1686.coefficient143_177,
  OriginalRow227TriangleData1686.coefficient143_178,
  OriginalRow227TriangleData1686.coefficient143_179,
  OriginalRow227TriangleData1686.coefficient143_180,
  OriginalRow227TriangleData1686.coefficient143_181,
  OriginalRow227TriangleData1686.coefficient143_182,
  OriginalRow227TriangleData1686.coefficient143_183,
  OriginalRow227TriangleData1686.coefficient143_184,
  OriginalRow227TriangleData1686.coefficient143_185,
  OriginalRow227TriangleData1686.coefficient143_186,
  OriginalRow227TriangleData1686.coefficient143_187,
  OriginalRow227TriangleData1686.coefficient143_188,
  OriginalRow227TriangleData1686.coefficient143_189,
  OriginalRow227TriangleData1686.coefficient143_190,
  OriginalRow227TriangleData1686.coefficient143_191,
  OriginalRow227TriangleData1686.coefficient143_192,
  OriginalRow227TriangleData1686.coefficient143_193,
  OriginalRow227TriangleData1686.coefficient143_194,
  OriginalRow227TriangleData1686.coefficient143_195,
  OriginalRow227TriangleData1686.coefficient143_196,
  OriginalRow227TriangleData1686.coefficient143_197,
  OriginalRow227TriangleData1686.coefficient143_198,
  OriginalRow227TriangleData1686.coefficient143_199,
  OriginalRow227TriangleData1686.coefficient143_200,
  OriginalRow227TriangleData1686.coefficient143_201,
  OriginalRow227TriangleData1686.coefficient143_202,
  OriginalRow227TriangleData1686.coefficient143_203,
  OriginalRow227TriangleData1686.coefficient143_204,
  OriginalRow227TriangleData1686.coefficient143_205
]

theorem values1686_size : values1686.size = 32 := rfl

def block1686 : ℕ → Option IntervalDyadic := segment 174 values1686

theorem block1686_domain : ExactDomain block1686 174 206 := by
  simpa only [values1686_size] using segment_domain 174 values1686

theorem block1686_get (i : Fin 32) :
    block1686 (174 + i.val) = some (values1686[i.val]'(by rw [values1686_size]; exact i.isLt)) := by
  exact segment_get 174 values1686 ⟨i.val, by rw [values1686_size]; exact i.isLt⟩

def values1687 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1687.coefficient143_206,
  OriginalRow227TriangleData1687.coefficient143_207,
  OriginalRow227TriangleData1687.coefficient143_208,
  OriginalRow227TriangleData1687.coefficient143_209,
  OriginalRow227TriangleData1687.coefficient143_210,
  OriginalRow227TriangleData1687.coefficient143_211,
  OriginalRow227TriangleData1687.coefficient143_212,
  OriginalRow227TriangleData1687.coefficient143_213,
  OriginalRow227TriangleData1687.coefficient143_214,
  OriginalRow227TriangleData1687.coefficient143_215,
  OriginalRow227TriangleData1687.coefficient143_216,
  OriginalRow227TriangleData1687.coefficient143_217,
  OriginalRow227TriangleData1687.coefficient143_218,
  OriginalRow227TriangleData1687.coefficient143_219,
  OriginalRow227TriangleData1687.coefficient143_220,
  OriginalRow227TriangleData1687.coefficient143_221,
  OriginalRow227TriangleData1687.coefficient143_222,
  OriginalRow227TriangleData1687.coefficient143_223,
  OriginalRow227TriangleData1687.coefficient143_224,
  OriginalRow227TriangleData1687.coefficient143_225,
  OriginalRow227TriangleData1687.coefficient143_226,
  OriginalRow227TriangleData1687.coefficient143_227,
  OriginalRow227TriangleData1687.coefficient143_228,
  OriginalRow227TriangleData1687.coefficient143_229,
  OriginalRow227TriangleData1687.coefficient143_230,
  OriginalRow227TriangleData1687.coefficient143_231,
  OriginalRow227TriangleData1687.coefficient143_232,
  OriginalRow227TriangleData1687.coefficient143_233,
  OriginalRow227TriangleData1687.coefficient143_234,
  OriginalRow227TriangleData1687.coefficient143_235,
  OriginalRow227TriangleData1687.coefficient143_236,
  OriginalRow227TriangleData1687.coefficient143_237
]

theorem values1687_size : values1687.size = 32 := rfl

def block1687 : ℕ → Option IntervalDyadic := segment 206 values1687

theorem block1687_domain : ExactDomain block1687 206 238 := by
  simpa only [values1687_size] using segment_domain 206 values1687

theorem block1687_get (i : Fin 32) :
    block1687 (206 + i.val) = some (values1687[i.val]'(by rw [values1687_size]; exact i.isLt)) := by
  exact segment_get 206 values1687 ⟨i.val, by rw [values1687_size]; exact i.isLt⟩

def values1688 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1688.coefficient143_238,
  OriginalRow227TriangleData1688.coefficient143_239,
  OriginalRow227TriangleData1688.coefficient143_240,
  OriginalRow227TriangleData1688.coefficient143_241,
  OriginalRow227TriangleData1688.coefficient143_242,
  OriginalRow227TriangleData1688.coefficient143_243,
  OriginalRow227TriangleData1688.coefficient143_244,
  OriginalRow227TriangleData1688.coefficient143_245,
  OriginalRow227TriangleData1688.coefficient143_246,
  OriginalRow227TriangleData1688.coefficient143_247,
  OriginalRow227TriangleData1688.coefficient143_248,
  OriginalRow227TriangleData1688.coefficient143_249,
  OriginalRow227TriangleData1688.coefficient143_250,
  OriginalRow227TriangleData1688.coefficient143_251,
  OriginalRow227TriangleData1688.coefficient143_252,
  OriginalRow227TriangleData1688.coefficient143_253,
  OriginalRow227TriangleData1688.coefficient143_254,
  OriginalRow227TriangleData1688.coefficient143_255,
  OriginalRow227TriangleData1688.coefficient143_256,
  OriginalRow227TriangleData1688.coefficient143_257,
  OriginalRow227TriangleData1688.coefficient143_258,
  OriginalRow227TriangleData1688.coefficient143_259,
  OriginalRow227TriangleData1688.coefficient143_260,
  OriginalRow227TriangleData1688.coefficient143_261,
  OriginalRow227TriangleData1688.coefficient143_262,
  OriginalRow227TriangleData1688.coefficient143_263,
  OriginalRow227TriangleData1688.coefficient143_264,
  OriginalRow227TriangleData1688.coefficient143_265,
  OriginalRow227TriangleData1688.coefficient143_266,
  OriginalRow227TriangleData1688.coefficient143_267,
  OriginalRow227TriangleData1688.coefficient143_268,
  OriginalRow227TriangleData1688.coefficient143_269
]

theorem values1688_size : values1688.size = 32 := rfl

def block1688 : ℕ → Option IntervalDyadic := segment 238 values1688

theorem block1688_domain : ExactDomain block1688 238 270 := by
  simpa only [values1688_size] using segment_domain 238 values1688

theorem block1688_get (i : Fin 32) :
    block1688 (238 + i.val) = some (values1688[i.val]'(by rw [values1688_size]; exact i.isLt)) := by
  exact segment_get 238 values1688 ⟨i.val, by rw [values1688_size]; exact i.isLt⟩

def values1689 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1689.coefficient143_270,
  OriginalRow227TriangleData1689.coefficient143_271,
  OriginalRow227TriangleData1689.coefficient143_272,
  OriginalRow227TriangleData1689.coefficient143_273,
  OriginalRow227TriangleData1689.coefficient143_274,
  OriginalRow227TriangleData1689.coefficient143_275,
  OriginalRow227TriangleData1689.coefficient143_276,
  OriginalRow227TriangleData1689.coefficient143_277,
  OriginalRow227TriangleData1689.coefficient143_278,
  OriginalRow227TriangleData1689.coefficient143_279,
  OriginalRow227TriangleData1689.coefficient143_280,
  OriginalRow227TriangleData1689.coefficient143_281,
  OriginalRow227TriangleData1689.coefficient143_282,
  OriginalRow227TriangleData1689.coefficient143_283,
  OriginalRow227TriangleData1689.coefficient143_284,
  OriginalRow227TriangleData1689.coefficient143_285,
  OriginalRow227TriangleData1689.coefficient143_286,
  OriginalRow227TriangleData1689.coefficient143_287,
  OriginalRow227TriangleData1689.coefficient143_288,
  OriginalRow227TriangleData1689.coefficient143_289,
  OriginalRow227TriangleData1689.coefficient143_290,
  OriginalRow227TriangleData1689.coefficient143_291,
  OriginalRow227TriangleData1689.coefficient143_292,
  OriginalRow227TriangleData1689.coefficient143_293,
  OriginalRow227TriangleData1689.coefficient143_294,
  OriginalRow227TriangleData1689.coefficient143_295,
  OriginalRow227TriangleData1689.coefficient143_296,
  OriginalRow227TriangleData1689.coefficient143_297,
  OriginalRow227TriangleData1689.coefficient143_298,
  OriginalRow227TriangleData1689.coefficient143_299,
  OriginalRow227TriangleData1689.coefficient143_300,
  OriginalRow227TriangleData1689.coefficient143_301
]

theorem values1689_size : values1689.size = 32 := rfl

def block1689 : ℕ → Option IntervalDyadic := segment 270 values1689

theorem block1689_domain : ExactDomain block1689 270 302 := by
  simpa only [values1689_size] using segment_domain 270 values1689

theorem block1689_get (i : Fin 32) :
    block1689 (270 + i.val) = some (values1689[i.val]'(by rw [values1689_size]; exact i.isLt)) := by
  exact segment_get 270 values1689 ⟨i.val, by rw [values1689_size]; exact i.isLt⟩

def values1690 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1690.coefficient143_302,
  OriginalRow227TriangleData1690.coefficient143_303,
  OriginalRow227TriangleData1690.coefficient143_304,
  OriginalRow227TriangleData1690.coefficient143_305,
  OriginalRow227TriangleData1690.coefficient143_306,
  OriginalRow227TriangleData1690.coefficient143_307,
  OriginalRow227TriangleData1690.coefficient143_308,
  OriginalRow227TriangleData1690.coefficient143_309,
  OriginalRow227TriangleData1690.coefficient143_310,
  OriginalRow227TriangleData1690.coefficient143_311,
  OriginalRow227TriangleData1690.coefficient143_312,
  OriginalRow227TriangleData1690.coefficient143_313,
  OriginalRow227TriangleData1690.coefficient143_314,
  OriginalRow227TriangleData1690.coefficient143_315,
  OriginalRow227TriangleData1690.coefficient143_316,
  OriginalRow227TriangleData1690.coefficient143_317,
  OriginalRow227TriangleData1690.coefficient143_318,
  OriginalRow227TriangleData1690.coefficient143_319,
  OriginalRow227TriangleData1690.coefficient143_320,
  OriginalRow227TriangleData1690.coefficient143_321,
  OriginalRow227TriangleData1690.coefficient143_322,
  OriginalRow227TriangleData1690.coefficient143_323,
  OriginalRow227TriangleData1690.coefficient143_324,
  OriginalRow227TriangleData1690.coefficient143_325,
  OriginalRow227TriangleData1690.coefficient143_326,
  OriginalRow227TriangleData1690.coefficient143_327,
  OriginalRow227TriangleData1690.coefficient143_328,
  OriginalRow227TriangleData1690.coefficient143_329,
  OriginalRow227TriangleData1690.coefficient143_330,
  OriginalRow227TriangleData1690.coefficient143_331,
  OriginalRow227TriangleData1690.coefficient143_332,
  OriginalRow227TriangleData1690.coefficient143_333
]

theorem values1690_size : values1690.size = 32 := rfl

def block1690 : ℕ → Option IntervalDyadic := segment 302 values1690

theorem block1690_domain : ExactDomain block1690 302 334 := by
  simpa only [values1690_size] using segment_domain 302 values1690

theorem block1690_get (i : Fin 32) :
    block1690 (302 + i.val) = some (values1690[i.val]'(by rw [values1690_size]; exact i.isLt)) := by
  exact segment_get 302 values1690 ⟨i.val, by rw [values1690_size]; exact i.isLt⟩

def values1691 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1691.coefficient143_334,
  OriginalRow227TriangleData1691.coefficient143_335,
  OriginalRow227TriangleData1691.coefficient143_336,
  OriginalRow227TriangleData1691.coefficient143_337,
  OriginalRow227TriangleData1691.coefficient143_338,
  OriginalRow227TriangleData1691.coefficient143_339,
  OriginalRow227TriangleData1691.coefficient143_340,
  OriginalRow227TriangleData1691.coefficient143_341,
  OriginalRow227TriangleData1691.coefficient143_342,
  OriginalRow227TriangleData1691.coefficient143_343,
  OriginalRow227TriangleData1691.coefficient143_344,
  OriginalRow227TriangleData1691.coefficient143_345,
  OriginalRow227TriangleData1691.coefficient143_346,
  OriginalRow227TriangleData1691.coefficient143_347,
  OriginalRow227TriangleData1691.coefficient143_348,
  OriginalRow227TriangleData1691.coefficient143_349,
  OriginalRow227TriangleData1691.coefficient143_350,
  OriginalRow227TriangleData1691.coefficient143_351,
  OriginalRow227TriangleData1691.coefficient143_352,
  OriginalRow227TriangleData1691.coefficient143_353,
  OriginalRow227TriangleData1691.coefficient143_354,
  OriginalRow227TriangleData1691.coefficient143_355,
  OriginalRow227TriangleData1691.coefficient143_356,
  OriginalRow227TriangleData1691.coefficient143_357,
  OriginalRow227TriangleData1691.coefficient143_358
]

theorem values1691_size : values1691.size = 25 := rfl

def block1691 : ℕ → Option IntervalDyadic := segment 334 values1691

theorem block1691_domain : ExactDomain block1691 334 359 := by
  simpa only [values1691_size] using segment_domain 334 values1691

theorem block1691_get (i : Fin 25) :
    block1691 (334 + i.val) = some (values1691[i.val]'(by rw [values1691_size]; exact i.isLt)) := by
  exact segment_get 334 values1691 ⟨i.val, by rw [values1691_size]; exact i.isLt⟩

def node0174_0238 : ℕ → Option IntervalDyadic := split 206 block1686 block1687

theorem node0174_0238_domain : ExactDomain node0174_0238 174 238 := by
  exact split_domain (by decide) (by decide) block1686_domain block1687_domain

def node0142_0238 : ℕ → Option IntervalDyadic := split 174 block1685 node0174_0238

theorem node0142_0238_domain : ExactDomain node0142_0238 142 238 := by
  exact split_domain (by decide) (by decide) block1685_domain node0174_0238_domain

def node0238_0302 : ℕ → Option IntervalDyadic := split 270 block1688 block1689

theorem node0238_0302_domain : ExactDomain node0238_0302 238 302 := by
  exact split_domain (by decide) (by decide) block1688_domain block1689_domain

def node0302_0359 : ℕ → Option IntervalDyadic := split 334 block1690 block1691

theorem node0302_0359_domain : ExactDomain node0302_0359 302 359 := by
  exact split_domain (by decide) (by decide) block1690_domain block1691_domain

def node0238_0359 : ℕ → Option IntervalDyadic := split 302 node0238_0302 node0302_0359

theorem node0238_0359_domain : ExactDomain node0238_0359 238 359 := by
  exact split_domain (by decide) (by decide) node0238_0302_domain node0302_0359_domain

def node0142_0359 : ℕ → Option IntervalDyadic := split 238 node0142_0238 node0238_0359

theorem node0142_0359_domain : ExactDomain node0142_0359 142 359 := by
  exact split_domain (by decide) (by decide) node0142_0238_domain node0238_0359_domain

def lookup : ℕ → Option IntervalDyadic := node0142_0359

theorem lookup_domain : ExactDomain lookup 142 359 :=
  node0142_0359_domain

theorem block1685_lookup (i : Fin 32) :
    lookup (142 + i.val) = some (values1685[i.val]'(by rw [values1685_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (142 + i.val) = _
  rw [node0142_0359, split_left 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0142_0238, split_left 174 block1685 node0174_0238 (by omega)]
  exact block1685_get i

theorem block1686_lookup (i : Fin 32) :
    lookup (174 + i.val) = some (values1686[i.val]'(by rw [values1686_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (174 + i.val) = _
  rw [node0142_0359, split_left 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0142_0238, split_right 174 block1685 node0174_0238 (by omega)]
  rw [node0174_0238, split_left 206 block1686 block1687 (by omega)]
  exact block1686_get i

theorem block1687_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values1687[i.val]'(by rw [values1687_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (206 + i.val) = _
  rw [node0142_0359, split_left 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0142_0238, split_right 174 block1685 node0174_0238 (by omega)]
  rw [node0174_0238, split_right 206 block1686 block1687 (by omega)]
  exact block1687_get i

theorem block1688_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values1688[i.val]'(by rw [values1688_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (238 + i.val) = _
  rw [node0142_0359, split_right 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0238_0359, split_left 302 node0238_0302 node0302_0359 (by omega)]
  rw [node0238_0302, split_left 270 block1688 block1689 (by omega)]
  exact block1688_get i

theorem block1689_lookup (i : Fin 32) :
    lookup (270 + i.val) = some (values1689[i.val]'(by rw [values1689_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (270 + i.val) = _
  rw [node0142_0359, split_right 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0238_0359, split_left 302 node0238_0302 node0302_0359 (by omega)]
  rw [node0238_0302, split_right 270 block1688 block1689 (by omega)]
  exact block1689_get i

theorem block1690_lookup (i : Fin 32) :
    lookup (302 + i.val) = some (values1690[i.val]'(by rw [values1690_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (302 + i.val) = _
  rw [node0142_0359, split_right 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0238_0359, split_right 302 node0238_0302 node0302_0359 (by omega)]
  rw [node0302_0359, split_left 334 block1690 block1691 (by omega)]
  exact block1690_get i

theorem block1691_lookup (i : Fin 25) :
    lookup (334 + i.val) = some (values1691[i.val]'(by rw [values1691_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0142_0359 (334 + i.val) = _
  rw [node0142_0359, split_right 238 node0142_0238 node0238_0359 (by omega)]
  rw [node0238_0359, split_right 302 node0238_0302 node0302_0359 (by omega)]
  rw [node0302_0359, split_right 334 block1690 block1691 (by omega)]
  exact block1691_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1685_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1685_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1686_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1686_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1687_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1687_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1688_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1688_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1689_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1689_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1690_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1690_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1691_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1691_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1685_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1686_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1687_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1688_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1689_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1690_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow143.block1691_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow143
