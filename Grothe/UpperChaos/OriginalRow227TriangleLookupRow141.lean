import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1671
import Grothe.UpperChaos.OriginalRow227TriangleData1672
import Grothe.UpperChaos.OriginalRow227TriangleData1673
import Grothe.UpperChaos.OriginalRow227TriangleData1674
import Grothe.UpperChaos.OriginalRow227TriangleData1675
import Grothe.UpperChaos.OriginalRow227TriangleData1676
import Grothe.UpperChaos.OriginalRow227TriangleData1677

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow141

open ConditionalTableLookup

def values1671 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1671.coefficient141_140,
  OriginalRow227TriangleData1671.coefficient141_141,
  OriginalRow227TriangleData1671.coefficient141_142,
  OriginalRow227TriangleData1671.coefficient141_143,
  OriginalRow227TriangleData1671.coefficient141_144,
  OriginalRow227TriangleData1671.coefficient141_145,
  OriginalRow227TriangleData1671.coefficient141_146,
  OriginalRow227TriangleData1671.coefficient141_147,
  OriginalRow227TriangleData1671.coefficient141_148,
  OriginalRow227TriangleData1671.coefficient141_149,
  OriginalRow227TriangleData1671.coefficient141_150,
  OriginalRow227TriangleData1671.coefficient141_151,
  OriginalRow227TriangleData1671.coefficient141_152,
  OriginalRow227TriangleData1671.coefficient141_153,
  OriginalRow227TriangleData1671.coefficient141_154,
  OriginalRow227TriangleData1671.coefficient141_155,
  OriginalRow227TriangleData1671.coefficient141_156,
  OriginalRow227TriangleData1671.coefficient141_157,
  OriginalRow227TriangleData1671.coefficient141_158,
  OriginalRow227TriangleData1671.coefficient141_159,
  OriginalRow227TriangleData1671.coefficient141_160,
  OriginalRow227TriangleData1671.coefficient141_161,
  OriginalRow227TriangleData1671.coefficient141_162,
  OriginalRow227TriangleData1671.coefficient141_163,
  OriginalRow227TriangleData1671.coefficient141_164,
  OriginalRow227TriangleData1671.coefficient141_165,
  OriginalRow227TriangleData1671.coefficient141_166,
  OriginalRow227TriangleData1671.coefficient141_167,
  OriginalRow227TriangleData1671.coefficient141_168,
  OriginalRow227TriangleData1671.coefficient141_169,
  OriginalRow227TriangleData1671.coefficient141_170,
  OriginalRow227TriangleData1671.coefficient141_171
]

theorem values1671_size : values1671.size = 32 := rfl

def block1671 : ℕ → Option IntervalDyadic := segment 140 values1671

theorem block1671_domain : ExactDomain block1671 140 172 := by
  simpa only [values1671_size] using segment_domain 140 values1671

theorem block1671_get (i : Fin 32) :
    block1671 (140 + i.val) = some (values1671[i.val]'(by rw [values1671_size]; exact i.isLt)) := by
  exact segment_get 140 values1671 ⟨i.val, by rw [values1671_size]; exact i.isLt⟩

def values1672 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1672.coefficient141_172,
  OriginalRow227TriangleData1672.coefficient141_173,
  OriginalRow227TriangleData1672.coefficient141_174,
  OriginalRow227TriangleData1672.coefficient141_175,
  OriginalRow227TriangleData1672.coefficient141_176,
  OriginalRow227TriangleData1672.coefficient141_177,
  OriginalRow227TriangleData1672.coefficient141_178,
  OriginalRow227TriangleData1672.coefficient141_179,
  OriginalRow227TriangleData1672.coefficient141_180,
  OriginalRow227TriangleData1672.coefficient141_181,
  OriginalRow227TriangleData1672.coefficient141_182,
  OriginalRow227TriangleData1672.coefficient141_183,
  OriginalRow227TriangleData1672.coefficient141_184,
  OriginalRow227TriangleData1672.coefficient141_185,
  OriginalRow227TriangleData1672.coefficient141_186,
  OriginalRow227TriangleData1672.coefficient141_187,
  OriginalRow227TriangleData1672.coefficient141_188,
  OriginalRow227TriangleData1672.coefficient141_189,
  OriginalRow227TriangleData1672.coefficient141_190,
  OriginalRow227TriangleData1672.coefficient141_191,
  OriginalRow227TriangleData1672.coefficient141_192,
  OriginalRow227TriangleData1672.coefficient141_193,
  OriginalRow227TriangleData1672.coefficient141_194,
  OriginalRow227TriangleData1672.coefficient141_195,
  OriginalRow227TriangleData1672.coefficient141_196,
  OriginalRow227TriangleData1672.coefficient141_197,
  OriginalRow227TriangleData1672.coefficient141_198,
  OriginalRow227TriangleData1672.coefficient141_199,
  OriginalRow227TriangleData1672.coefficient141_200,
  OriginalRow227TriangleData1672.coefficient141_201,
  OriginalRow227TriangleData1672.coefficient141_202,
  OriginalRow227TriangleData1672.coefficient141_203
]

theorem values1672_size : values1672.size = 32 := rfl

def block1672 : ℕ → Option IntervalDyadic := segment 172 values1672

theorem block1672_domain : ExactDomain block1672 172 204 := by
  simpa only [values1672_size] using segment_domain 172 values1672

theorem block1672_get (i : Fin 32) :
    block1672 (172 + i.val) = some (values1672[i.val]'(by rw [values1672_size]; exact i.isLt)) := by
  exact segment_get 172 values1672 ⟨i.val, by rw [values1672_size]; exact i.isLt⟩

def values1673 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1673.coefficient141_204,
  OriginalRow227TriangleData1673.coefficient141_205,
  OriginalRow227TriangleData1673.coefficient141_206,
  OriginalRow227TriangleData1673.coefficient141_207,
  OriginalRow227TriangleData1673.coefficient141_208,
  OriginalRow227TriangleData1673.coefficient141_209,
  OriginalRow227TriangleData1673.coefficient141_210,
  OriginalRow227TriangleData1673.coefficient141_211,
  OriginalRow227TriangleData1673.coefficient141_212,
  OriginalRow227TriangleData1673.coefficient141_213,
  OriginalRow227TriangleData1673.coefficient141_214,
  OriginalRow227TriangleData1673.coefficient141_215,
  OriginalRow227TriangleData1673.coefficient141_216,
  OriginalRow227TriangleData1673.coefficient141_217,
  OriginalRow227TriangleData1673.coefficient141_218,
  OriginalRow227TriangleData1673.coefficient141_219,
  OriginalRow227TriangleData1673.coefficient141_220,
  OriginalRow227TriangleData1673.coefficient141_221,
  OriginalRow227TriangleData1673.coefficient141_222,
  OriginalRow227TriangleData1673.coefficient141_223,
  OriginalRow227TriangleData1673.coefficient141_224,
  OriginalRow227TriangleData1673.coefficient141_225,
  OriginalRow227TriangleData1673.coefficient141_226,
  OriginalRow227TriangleData1673.coefficient141_227,
  OriginalRow227TriangleData1673.coefficient141_228,
  OriginalRow227TriangleData1673.coefficient141_229,
  OriginalRow227TriangleData1673.coefficient141_230,
  OriginalRow227TriangleData1673.coefficient141_231,
  OriginalRow227TriangleData1673.coefficient141_232,
  OriginalRow227TriangleData1673.coefficient141_233,
  OriginalRow227TriangleData1673.coefficient141_234,
  OriginalRow227TriangleData1673.coefficient141_235
]

theorem values1673_size : values1673.size = 32 := rfl

def block1673 : ℕ → Option IntervalDyadic := segment 204 values1673

theorem block1673_domain : ExactDomain block1673 204 236 := by
  simpa only [values1673_size] using segment_domain 204 values1673

theorem block1673_get (i : Fin 32) :
    block1673 (204 + i.val) = some (values1673[i.val]'(by rw [values1673_size]; exact i.isLt)) := by
  exact segment_get 204 values1673 ⟨i.val, by rw [values1673_size]; exact i.isLt⟩

def values1674 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1674.coefficient141_236,
  OriginalRow227TriangleData1674.coefficient141_237,
  OriginalRow227TriangleData1674.coefficient141_238,
  OriginalRow227TriangleData1674.coefficient141_239,
  OriginalRow227TriangleData1674.coefficient141_240,
  OriginalRow227TriangleData1674.coefficient141_241,
  OriginalRow227TriangleData1674.coefficient141_242,
  OriginalRow227TriangleData1674.coefficient141_243,
  OriginalRow227TriangleData1674.coefficient141_244,
  OriginalRow227TriangleData1674.coefficient141_245,
  OriginalRow227TriangleData1674.coefficient141_246,
  OriginalRow227TriangleData1674.coefficient141_247,
  OriginalRow227TriangleData1674.coefficient141_248,
  OriginalRow227TriangleData1674.coefficient141_249,
  OriginalRow227TriangleData1674.coefficient141_250,
  OriginalRow227TriangleData1674.coefficient141_251,
  OriginalRow227TriangleData1674.coefficient141_252,
  OriginalRow227TriangleData1674.coefficient141_253,
  OriginalRow227TriangleData1674.coefficient141_254,
  OriginalRow227TriangleData1674.coefficient141_255,
  OriginalRow227TriangleData1674.coefficient141_256,
  OriginalRow227TriangleData1674.coefficient141_257,
  OriginalRow227TriangleData1674.coefficient141_258,
  OriginalRow227TriangleData1674.coefficient141_259,
  OriginalRow227TriangleData1674.coefficient141_260,
  OriginalRow227TriangleData1674.coefficient141_261,
  OriginalRow227TriangleData1674.coefficient141_262,
  OriginalRow227TriangleData1674.coefficient141_263,
  OriginalRow227TriangleData1674.coefficient141_264,
  OriginalRow227TriangleData1674.coefficient141_265,
  OriginalRow227TriangleData1674.coefficient141_266,
  OriginalRow227TriangleData1674.coefficient141_267
]

theorem values1674_size : values1674.size = 32 := rfl

def block1674 : ℕ → Option IntervalDyadic := segment 236 values1674

theorem block1674_domain : ExactDomain block1674 236 268 := by
  simpa only [values1674_size] using segment_domain 236 values1674

theorem block1674_get (i : Fin 32) :
    block1674 (236 + i.val) = some (values1674[i.val]'(by rw [values1674_size]; exact i.isLt)) := by
  exact segment_get 236 values1674 ⟨i.val, by rw [values1674_size]; exact i.isLt⟩

def values1675 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1675.coefficient141_268,
  OriginalRow227TriangleData1675.coefficient141_269,
  OriginalRow227TriangleData1675.coefficient141_270,
  OriginalRow227TriangleData1675.coefficient141_271,
  OriginalRow227TriangleData1675.coefficient141_272,
  OriginalRow227TriangleData1675.coefficient141_273,
  OriginalRow227TriangleData1675.coefficient141_274,
  OriginalRow227TriangleData1675.coefficient141_275,
  OriginalRow227TriangleData1675.coefficient141_276,
  OriginalRow227TriangleData1675.coefficient141_277,
  OriginalRow227TriangleData1675.coefficient141_278,
  OriginalRow227TriangleData1675.coefficient141_279,
  OriginalRow227TriangleData1675.coefficient141_280,
  OriginalRow227TriangleData1675.coefficient141_281,
  OriginalRow227TriangleData1675.coefficient141_282,
  OriginalRow227TriangleData1675.coefficient141_283,
  OriginalRow227TriangleData1675.coefficient141_284,
  OriginalRow227TriangleData1675.coefficient141_285,
  OriginalRow227TriangleData1675.coefficient141_286,
  OriginalRow227TriangleData1675.coefficient141_287,
  OriginalRow227TriangleData1675.coefficient141_288,
  OriginalRow227TriangleData1675.coefficient141_289,
  OriginalRow227TriangleData1675.coefficient141_290,
  OriginalRow227TriangleData1675.coefficient141_291,
  OriginalRow227TriangleData1675.coefficient141_292,
  OriginalRow227TriangleData1675.coefficient141_293,
  OriginalRow227TriangleData1675.coefficient141_294,
  OriginalRow227TriangleData1675.coefficient141_295,
  OriginalRow227TriangleData1675.coefficient141_296,
  OriginalRow227TriangleData1675.coefficient141_297,
  OriginalRow227TriangleData1675.coefficient141_298,
  OriginalRow227TriangleData1675.coefficient141_299
]

theorem values1675_size : values1675.size = 32 := rfl

def block1675 : ℕ → Option IntervalDyadic := segment 268 values1675

theorem block1675_domain : ExactDomain block1675 268 300 := by
  simpa only [values1675_size] using segment_domain 268 values1675

theorem block1675_get (i : Fin 32) :
    block1675 (268 + i.val) = some (values1675[i.val]'(by rw [values1675_size]; exact i.isLt)) := by
  exact segment_get 268 values1675 ⟨i.val, by rw [values1675_size]; exact i.isLt⟩

def values1676 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1676.coefficient141_300,
  OriginalRow227TriangleData1676.coefficient141_301,
  OriginalRow227TriangleData1676.coefficient141_302,
  OriginalRow227TriangleData1676.coefficient141_303,
  OriginalRow227TriangleData1676.coefficient141_304,
  OriginalRow227TriangleData1676.coefficient141_305,
  OriginalRow227TriangleData1676.coefficient141_306,
  OriginalRow227TriangleData1676.coefficient141_307,
  OriginalRow227TriangleData1676.coefficient141_308,
  OriginalRow227TriangleData1676.coefficient141_309,
  OriginalRow227TriangleData1676.coefficient141_310,
  OriginalRow227TriangleData1676.coefficient141_311,
  OriginalRow227TriangleData1676.coefficient141_312,
  OriginalRow227TriangleData1676.coefficient141_313,
  OriginalRow227TriangleData1676.coefficient141_314,
  OriginalRow227TriangleData1676.coefficient141_315,
  OriginalRow227TriangleData1676.coefficient141_316,
  OriginalRow227TriangleData1676.coefficient141_317,
  OriginalRow227TriangleData1676.coefficient141_318,
  OriginalRow227TriangleData1676.coefficient141_319,
  OriginalRow227TriangleData1676.coefficient141_320,
  OriginalRow227TriangleData1676.coefficient141_321,
  OriginalRow227TriangleData1676.coefficient141_322,
  OriginalRow227TriangleData1676.coefficient141_323,
  OriginalRow227TriangleData1676.coefficient141_324,
  OriginalRow227TriangleData1676.coefficient141_325,
  OriginalRow227TriangleData1676.coefficient141_326,
  OriginalRow227TriangleData1676.coefficient141_327,
  OriginalRow227TriangleData1676.coefficient141_328,
  OriginalRow227TriangleData1676.coefficient141_329,
  OriginalRow227TriangleData1676.coefficient141_330,
  OriginalRow227TriangleData1676.coefficient141_331
]

theorem values1676_size : values1676.size = 32 := rfl

def block1676 : ℕ → Option IntervalDyadic := segment 300 values1676

theorem block1676_domain : ExactDomain block1676 300 332 := by
  simpa only [values1676_size] using segment_domain 300 values1676

theorem block1676_get (i : Fin 32) :
    block1676 (300 + i.val) = some (values1676[i.val]'(by rw [values1676_size]; exact i.isLt)) := by
  exact segment_get 300 values1676 ⟨i.val, by rw [values1676_size]; exact i.isLt⟩

def values1677 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1677.coefficient141_332,
  OriginalRow227TriangleData1677.coefficient141_333,
  OriginalRow227TriangleData1677.coefficient141_334,
  OriginalRow227TriangleData1677.coefficient141_335,
  OriginalRow227TriangleData1677.coefficient141_336,
  OriginalRow227TriangleData1677.coefficient141_337,
  OriginalRow227TriangleData1677.coefficient141_338,
  OriginalRow227TriangleData1677.coefficient141_339,
  OriginalRow227TriangleData1677.coefficient141_340,
  OriginalRow227TriangleData1677.coefficient141_341,
  OriginalRow227TriangleData1677.coefficient141_342,
  OriginalRow227TriangleData1677.coefficient141_343,
  OriginalRow227TriangleData1677.coefficient141_344,
  OriginalRow227TriangleData1677.coefficient141_345,
  OriginalRow227TriangleData1677.coefficient141_346,
  OriginalRow227TriangleData1677.coefficient141_347,
  OriginalRow227TriangleData1677.coefficient141_348,
  OriginalRow227TriangleData1677.coefficient141_349,
  OriginalRow227TriangleData1677.coefficient141_350,
  OriginalRow227TriangleData1677.coefficient141_351,
  OriginalRow227TriangleData1677.coefficient141_352,
  OriginalRow227TriangleData1677.coefficient141_353,
  OriginalRow227TriangleData1677.coefficient141_354,
  OriginalRow227TriangleData1677.coefficient141_355,
  OriginalRow227TriangleData1677.coefficient141_356,
  OriginalRow227TriangleData1677.coefficient141_357,
  OriginalRow227TriangleData1677.coefficient141_358,
  OriginalRow227TriangleData1677.coefficient141_359,
  OriginalRow227TriangleData1677.coefficient141_360
]

theorem values1677_size : values1677.size = 29 := rfl

def block1677 : ℕ → Option IntervalDyadic := segment 332 values1677

theorem block1677_domain : ExactDomain block1677 332 361 := by
  simpa only [values1677_size] using segment_domain 332 values1677

theorem block1677_get (i : Fin 29) :
    block1677 (332 + i.val) = some (values1677[i.val]'(by rw [values1677_size]; exact i.isLt)) := by
  exact segment_get 332 values1677 ⟨i.val, by rw [values1677_size]; exact i.isLt⟩

def node0172_0236 : ℕ → Option IntervalDyadic := split 204 block1672 block1673

theorem node0172_0236_domain : ExactDomain node0172_0236 172 236 := by
  exact split_domain (by decide) (by decide) block1672_domain block1673_domain

def node0140_0236 : ℕ → Option IntervalDyadic := split 172 block1671 node0172_0236

theorem node0140_0236_domain : ExactDomain node0140_0236 140 236 := by
  exact split_domain (by decide) (by decide) block1671_domain node0172_0236_domain

def node0236_0300 : ℕ → Option IntervalDyadic := split 268 block1674 block1675

theorem node0236_0300_domain : ExactDomain node0236_0300 236 300 := by
  exact split_domain (by decide) (by decide) block1674_domain block1675_domain

def node0300_0361 : ℕ → Option IntervalDyadic := split 332 block1676 block1677

theorem node0300_0361_domain : ExactDomain node0300_0361 300 361 := by
  exact split_domain (by decide) (by decide) block1676_domain block1677_domain

def node0236_0361 : ℕ → Option IntervalDyadic := split 300 node0236_0300 node0300_0361

theorem node0236_0361_domain : ExactDomain node0236_0361 236 361 := by
  exact split_domain (by decide) (by decide) node0236_0300_domain node0300_0361_domain

def node0140_0361 : ℕ → Option IntervalDyadic := split 236 node0140_0236 node0236_0361

theorem node0140_0361_domain : ExactDomain node0140_0361 140 361 := by
  exact split_domain (by decide) (by decide) node0140_0236_domain node0236_0361_domain

def lookup : ℕ → Option IntervalDyadic := node0140_0361

theorem lookup_domain : ExactDomain lookup 140 361 :=
  node0140_0361_domain

theorem block1671_lookup (i : Fin 32) :
    lookup (140 + i.val) = some (values1671[i.val]'(by rw [values1671_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (140 + i.val) = _
  rw [node0140_0361, split_left 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0140_0236, split_left 172 block1671 node0172_0236 (by omega)]
  exact block1671_get i

theorem block1672_lookup (i : Fin 32) :
    lookup (172 + i.val) = some (values1672[i.val]'(by rw [values1672_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (172 + i.val) = _
  rw [node0140_0361, split_left 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0140_0236, split_right 172 block1671 node0172_0236 (by omega)]
  rw [node0172_0236, split_left 204 block1672 block1673 (by omega)]
  exact block1672_get i

theorem block1673_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values1673[i.val]'(by rw [values1673_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (204 + i.val) = _
  rw [node0140_0361, split_left 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0140_0236, split_right 172 block1671 node0172_0236 (by omega)]
  rw [node0172_0236, split_right 204 block1672 block1673 (by omega)]
  exact block1673_get i

theorem block1674_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values1674[i.val]'(by rw [values1674_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (236 + i.val) = _
  rw [node0140_0361, split_right 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0236_0361, split_left 300 node0236_0300 node0300_0361 (by omega)]
  rw [node0236_0300, split_left 268 block1674 block1675 (by omega)]
  exact block1674_get i

theorem block1675_lookup (i : Fin 32) :
    lookup (268 + i.val) = some (values1675[i.val]'(by rw [values1675_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (268 + i.val) = _
  rw [node0140_0361, split_right 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0236_0361, split_left 300 node0236_0300 node0300_0361 (by omega)]
  rw [node0236_0300, split_right 268 block1674 block1675 (by omega)]
  exact block1675_get i

theorem block1676_lookup (i : Fin 32) :
    lookup (300 + i.val) = some (values1676[i.val]'(by rw [values1676_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (300 + i.val) = _
  rw [node0140_0361, split_right 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0236_0361, split_right 300 node0236_0300 node0300_0361 (by omega)]
  rw [node0300_0361, split_left 332 block1676 block1677 (by omega)]
  exact block1676_get i

theorem block1677_lookup (i : Fin 29) :
    lookup (332 + i.val) = some (values1677[i.val]'(by rw [values1677_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0140_0361 (332 + i.val) = _
  rw [node0140_0361, split_right 236 node0140_0236 node0236_0361 (by omega)]
  rw [node0236_0361, split_right 300 node0236_0300 node0300_0361 (by omega)]
  rw [node0300_0361, split_right 332 block1676 block1677 (by omega)]
  exact block1677_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1671_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1671_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1672_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1672_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1673_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1673_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1674_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1674_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1675_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1675_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1676_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1676_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1677_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1677_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1671_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1672_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1673_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1674_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1675_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1676_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow141.block1677_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow141
