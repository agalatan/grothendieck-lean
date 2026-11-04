import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1678
import Grothe.UpperChaos.OriginalRow227TriangleData1679
import Grothe.UpperChaos.OriginalRow227TriangleData1680
import Grothe.UpperChaos.OriginalRow227TriangleData1681
import Grothe.UpperChaos.OriginalRow227TriangleData1682
import Grothe.UpperChaos.OriginalRow227TriangleData1683
import Grothe.UpperChaos.OriginalRow227TriangleData1684

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow142

open ConditionalTableLookup

def values1678 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1678.coefficient142_141,
  OriginalRow227TriangleData1678.coefficient142_142,
  OriginalRow227TriangleData1678.coefficient142_143,
  OriginalRow227TriangleData1678.coefficient142_144,
  OriginalRow227TriangleData1678.coefficient142_145,
  OriginalRow227TriangleData1678.coefficient142_146,
  OriginalRow227TriangleData1678.coefficient142_147,
  OriginalRow227TriangleData1678.coefficient142_148,
  OriginalRow227TriangleData1678.coefficient142_149,
  OriginalRow227TriangleData1678.coefficient142_150,
  OriginalRow227TriangleData1678.coefficient142_151,
  OriginalRow227TriangleData1678.coefficient142_152,
  OriginalRow227TriangleData1678.coefficient142_153,
  OriginalRow227TriangleData1678.coefficient142_154,
  OriginalRow227TriangleData1678.coefficient142_155,
  OriginalRow227TriangleData1678.coefficient142_156,
  OriginalRow227TriangleData1678.coefficient142_157,
  OriginalRow227TriangleData1678.coefficient142_158,
  OriginalRow227TriangleData1678.coefficient142_159,
  OriginalRow227TriangleData1678.coefficient142_160,
  OriginalRow227TriangleData1678.coefficient142_161,
  OriginalRow227TriangleData1678.coefficient142_162,
  OriginalRow227TriangleData1678.coefficient142_163,
  OriginalRow227TriangleData1678.coefficient142_164,
  OriginalRow227TriangleData1678.coefficient142_165,
  OriginalRow227TriangleData1678.coefficient142_166,
  OriginalRow227TriangleData1678.coefficient142_167,
  OriginalRow227TriangleData1678.coefficient142_168,
  OriginalRow227TriangleData1678.coefficient142_169,
  OriginalRow227TriangleData1678.coefficient142_170,
  OriginalRow227TriangleData1678.coefficient142_171,
  OriginalRow227TriangleData1678.coefficient142_172
]

theorem values1678_size : values1678.size = 32 := rfl

def block1678 : ℕ → Option IntervalDyadic := segment 141 values1678

theorem block1678_domain : ExactDomain block1678 141 173 := by
  simpa only [values1678_size] using segment_domain 141 values1678

theorem block1678_get (i : Fin 32) :
    block1678 (141 + i.val) = some (values1678[i.val]'(by rw [values1678_size]; exact i.isLt)) := by
  exact segment_get 141 values1678 ⟨i.val, by rw [values1678_size]; exact i.isLt⟩

def values1679 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1679.coefficient142_173,
  OriginalRow227TriangleData1679.coefficient142_174,
  OriginalRow227TriangleData1679.coefficient142_175,
  OriginalRow227TriangleData1679.coefficient142_176,
  OriginalRow227TriangleData1679.coefficient142_177,
  OriginalRow227TriangleData1679.coefficient142_178,
  OriginalRow227TriangleData1679.coefficient142_179,
  OriginalRow227TriangleData1679.coefficient142_180,
  OriginalRow227TriangleData1679.coefficient142_181,
  OriginalRow227TriangleData1679.coefficient142_182,
  OriginalRow227TriangleData1679.coefficient142_183,
  OriginalRow227TriangleData1679.coefficient142_184,
  OriginalRow227TriangleData1679.coefficient142_185,
  OriginalRow227TriangleData1679.coefficient142_186,
  OriginalRow227TriangleData1679.coefficient142_187,
  OriginalRow227TriangleData1679.coefficient142_188,
  OriginalRow227TriangleData1679.coefficient142_189,
  OriginalRow227TriangleData1679.coefficient142_190,
  OriginalRow227TriangleData1679.coefficient142_191,
  OriginalRow227TriangleData1679.coefficient142_192,
  OriginalRow227TriangleData1679.coefficient142_193,
  OriginalRow227TriangleData1679.coefficient142_194,
  OriginalRow227TriangleData1679.coefficient142_195,
  OriginalRow227TriangleData1679.coefficient142_196,
  OriginalRow227TriangleData1679.coefficient142_197,
  OriginalRow227TriangleData1679.coefficient142_198,
  OriginalRow227TriangleData1679.coefficient142_199,
  OriginalRow227TriangleData1679.coefficient142_200,
  OriginalRow227TriangleData1679.coefficient142_201,
  OriginalRow227TriangleData1679.coefficient142_202,
  OriginalRow227TriangleData1679.coefficient142_203,
  OriginalRow227TriangleData1679.coefficient142_204
]

theorem values1679_size : values1679.size = 32 := rfl

def block1679 : ℕ → Option IntervalDyadic := segment 173 values1679

theorem block1679_domain : ExactDomain block1679 173 205 := by
  simpa only [values1679_size] using segment_domain 173 values1679

theorem block1679_get (i : Fin 32) :
    block1679 (173 + i.val) = some (values1679[i.val]'(by rw [values1679_size]; exact i.isLt)) := by
  exact segment_get 173 values1679 ⟨i.val, by rw [values1679_size]; exact i.isLt⟩

def values1680 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1680.coefficient142_205,
  OriginalRow227TriangleData1680.coefficient142_206,
  OriginalRow227TriangleData1680.coefficient142_207,
  OriginalRow227TriangleData1680.coefficient142_208,
  OriginalRow227TriangleData1680.coefficient142_209,
  OriginalRow227TriangleData1680.coefficient142_210,
  OriginalRow227TriangleData1680.coefficient142_211,
  OriginalRow227TriangleData1680.coefficient142_212,
  OriginalRow227TriangleData1680.coefficient142_213,
  OriginalRow227TriangleData1680.coefficient142_214,
  OriginalRow227TriangleData1680.coefficient142_215,
  OriginalRow227TriangleData1680.coefficient142_216,
  OriginalRow227TriangleData1680.coefficient142_217,
  OriginalRow227TriangleData1680.coefficient142_218,
  OriginalRow227TriangleData1680.coefficient142_219,
  OriginalRow227TriangleData1680.coefficient142_220,
  OriginalRow227TriangleData1680.coefficient142_221,
  OriginalRow227TriangleData1680.coefficient142_222,
  OriginalRow227TriangleData1680.coefficient142_223,
  OriginalRow227TriangleData1680.coefficient142_224,
  OriginalRow227TriangleData1680.coefficient142_225,
  OriginalRow227TriangleData1680.coefficient142_226,
  OriginalRow227TriangleData1680.coefficient142_227,
  OriginalRow227TriangleData1680.coefficient142_228,
  OriginalRow227TriangleData1680.coefficient142_229,
  OriginalRow227TriangleData1680.coefficient142_230,
  OriginalRow227TriangleData1680.coefficient142_231,
  OriginalRow227TriangleData1680.coefficient142_232,
  OriginalRow227TriangleData1680.coefficient142_233,
  OriginalRow227TriangleData1680.coefficient142_234,
  OriginalRow227TriangleData1680.coefficient142_235,
  OriginalRow227TriangleData1680.coefficient142_236
]

theorem values1680_size : values1680.size = 32 := rfl

def block1680 : ℕ → Option IntervalDyadic := segment 205 values1680

theorem block1680_domain : ExactDomain block1680 205 237 := by
  simpa only [values1680_size] using segment_domain 205 values1680

theorem block1680_get (i : Fin 32) :
    block1680 (205 + i.val) = some (values1680[i.val]'(by rw [values1680_size]; exact i.isLt)) := by
  exact segment_get 205 values1680 ⟨i.val, by rw [values1680_size]; exact i.isLt⟩

def values1681 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1681.coefficient142_237,
  OriginalRow227TriangleData1681.coefficient142_238,
  OriginalRow227TriangleData1681.coefficient142_239,
  OriginalRow227TriangleData1681.coefficient142_240,
  OriginalRow227TriangleData1681.coefficient142_241,
  OriginalRow227TriangleData1681.coefficient142_242,
  OriginalRow227TriangleData1681.coefficient142_243,
  OriginalRow227TriangleData1681.coefficient142_244,
  OriginalRow227TriangleData1681.coefficient142_245,
  OriginalRow227TriangleData1681.coefficient142_246,
  OriginalRow227TriangleData1681.coefficient142_247,
  OriginalRow227TriangleData1681.coefficient142_248,
  OriginalRow227TriangleData1681.coefficient142_249,
  OriginalRow227TriangleData1681.coefficient142_250,
  OriginalRow227TriangleData1681.coefficient142_251,
  OriginalRow227TriangleData1681.coefficient142_252,
  OriginalRow227TriangleData1681.coefficient142_253,
  OriginalRow227TriangleData1681.coefficient142_254,
  OriginalRow227TriangleData1681.coefficient142_255,
  OriginalRow227TriangleData1681.coefficient142_256,
  OriginalRow227TriangleData1681.coefficient142_257,
  OriginalRow227TriangleData1681.coefficient142_258,
  OriginalRow227TriangleData1681.coefficient142_259,
  OriginalRow227TriangleData1681.coefficient142_260,
  OriginalRow227TriangleData1681.coefficient142_261,
  OriginalRow227TriangleData1681.coefficient142_262,
  OriginalRow227TriangleData1681.coefficient142_263,
  OriginalRow227TriangleData1681.coefficient142_264,
  OriginalRow227TriangleData1681.coefficient142_265,
  OriginalRow227TriangleData1681.coefficient142_266,
  OriginalRow227TriangleData1681.coefficient142_267,
  OriginalRow227TriangleData1681.coefficient142_268
]

theorem values1681_size : values1681.size = 32 := rfl

def block1681 : ℕ → Option IntervalDyadic := segment 237 values1681

theorem block1681_domain : ExactDomain block1681 237 269 := by
  simpa only [values1681_size] using segment_domain 237 values1681

theorem block1681_get (i : Fin 32) :
    block1681 (237 + i.val) = some (values1681[i.val]'(by rw [values1681_size]; exact i.isLt)) := by
  exact segment_get 237 values1681 ⟨i.val, by rw [values1681_size]; exact i.isLt⟩

def values1682 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1682.coefficient142_269,
  OriginalRow227TriangleData1682.coefficient142_270,
  OriginalRow227TriangleData1682.coefficient142_271,
  OriginalRow227TriangleData1682.coefficient142_272,
  OriginalRow227TriangleData1682.coefficient142_273,
  OriginalRow227TriangleData1682.coefficient142_274,
  OriginalRow227TriangleData1682.coefficient142_275,
  OriginalRow227TriangleData1682.coefficient142_276,
  OriginalRow227TriangleData1682.coefficient142_277,
  OriginalRow227TriangleData1682.coefficient142_278,
  OriginalRow227TriangleData1682.coefficient142_279,
  OriginalRow227TriangleData1682.coefficient142_280,
  OriginalRow227TriangleData1682.coefficient142_281,
  OriginalRow227TriangleData1682.coefficient142_282,
  OriginalRow227TriangleData1682.coefficient142_283,
  OriginalRow227TriangleData1682.coefficient142_284,
  OriginalRow227TriangleData1682.coefficient142_285,
  OriginalRow227TriangleData1682.coefficient142_286,
  OriginalRow227TriangleData1682.coefficient142_287,
  OriginalRow227TriangleData1682.coefficient142_288,
  OriginalRow227TriangleData1682.coefficient142_289,
  OriginalRow227TriangleData1682.coefficient142_290,
  OriginalRow227TriangleData1682.coefficient142_291,
  OriginalRow227TriangleData1682.coefficient142_292,
  OriginalRow227TriangleData1682.coefficient142_293,
  OriginalRow227TriangleData1682.coefficient142_294,
  OriginalRow227TriangleData1682.coefficient142_295,
  OriginalRow227TriangleData1682.coefficient142_296,
  OriginalRow227TriangleData1682.coefficient142_297,
  OriginalRow227TriangleData1682.coefficient142_298,
  OriginalRow227TriangleData1682.coefficient142_299,
  OriginalRow227TriangleData1682.coefficient142_300
]

theorem values1682_size : values1682.size = 32 := rfl

def block1682 : ℕ → Option IntervalDyadic := segment 269 values1682

theorem block1682_domain : ExactDomain block1682 269 301 := by
  simpa only [values1682_size] using segment_domain 269 values1682

theorem block1682_get (i : Fin 32) :
    block1682 (269 + i.val) = some (values1682[i.val]'(by rw [values1682_size]; exact i.isLt)) := by
  exact segment_get 269 values1682 ⟨i.val, by rw [values1682_size]; exact i.isLt⟩

def values1683 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1683.coefficient142_301,
  OriginalRow227TriangleData1683.coefficient142_302,
  OriginalRow227TriangleData1683.coefficient142_303,
  OriginalRow227TriangleData1683.coefficient142_304,
  OriginalRow227TriangleData1683.coefficient142_305,
  OriginalRow227TriangleData1683.coefficient142_306,
  OriginalRow227TriangleData1683.coefficient142_307,
  OriginalRow227TriangleData1683.coefficient142_308,
  OriginalRow227TriangleData1683.coefficient142_309,
  OriginalRow227TriangleData1683.coefficient142_310,
  OriginalRow227TriangleData1683.coefficient142_311,
  OriginalRow227TriangleData1683.coefficient142_312,
  OriginalRow227TriangleData1683.coefficient142_313,
  OriginalRow227TriangleData1683.coefficient142_314,
  OriginalRow227TriangleData1683.coefficient142_315,
  OriginalRow227TriangleData1683.coefficient142_316,
  OriginalRow227TriangleData1683.coefficient142_317,
  OriginalRow227TriangleData1683.coefficient142_318,
  OriginalRow227TriangleData1683.coefficient142_319,
  OriginalRow227TriangleData1683.coefficient142_320,
  OriginalRow227TriangleData1683.coefficient142_321,
  OriginalRow227TriangleData1683.coefficient142_322,
  OriginalRow227TriangleData1683.coefficient142_323,
  OriginalRow227TriangleData1683.coefficient142_324,
  OriginalRow227TriangleData1683.coefficient142_325,
  OriginalRow227TriangleData1683.coefficient142_326,
  OriginalRow227TriangleData1683.coefficient142_327,
  OriginalRow227TriangleData1683.coefficient142_328,
  OriginalRow227TriangleData1683.coefficient142_329,
  OriginalRow227TriangleData1683.coefficient142_330,
  OriginalRow227TriangleData1683.coefficient142_331,
  OriginalRow227TriangleData1683.coefficient142_332
]

theorem values1683_size : values1683.size = 32 := rfl

def block1683 : ℕ → Option IntervalDyadic := segment 301 values1683

theorem block1683_domain : ExactDomain block1683 301 333 := by
  simpa only [values1683_size] using segment_domain 301 values1683

theorem block1683_get (i : Fin 32) :
    block1683 (301 + i.val) = some (values1683[i.val]'(by rw [values1683_size]; exact i.isLt)) := by
  exact segment_get 301 values1683 ⟨i.val, by rw [values1683_size]; exact i.isLt⟩

def values1684 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1684.coefficient142_333,
  OriginalRow227TriangleData1684.coefficient142_334,
  OriginalRow227TriangleData1684.coefficient142_335,
  OriginalRow227TriangleData1684.coefficient142_336,
  OriginalRow227TriangleData1684.coefficient142_337,
  OriginalRow227TriangleData1684.coefficient142_338,
  OriginalRow227TriangleData1684.coefficient142_339,
  OriginalRow227TriangleData1684.coefficient142_340,
  OriginalRow227TriangleData1684.coefficient142_341,
  OriginalRow227TriangleData1684.coefficient142_342,
  OriginalRow227TriangleData1684.coefficient142_343,
  OriginalRow227TriangleData1684.coefficient142_344,
  OriginalRow227TriangleData1684.coefficient142_345,
  OriginalRow227TriangleData1684.coefficient142_346,
  OriginalRow227TriangleData1684.coefficient142_347,
  OriginalRow227TriangleData1684.coefficient142_348,
  OriginalRow227TriangleData1684.coefficient142_349,
  OriginalRow227TriangleData1684.coefficient142_350,
  OriginalRow227TriangleData1684.coefficient142_351,
  OriginalRow227TriangleData1684.coefficient142_352,
  OriginalRow227TriangleData1684.coefficient142_353,
  OriginalRow227TriangleData1684.coefficient142_354,
  OriginalRow227TriangleData1684.coefficient142_355,
  OriginalRow227TriangleData1684.coefficient142_356,
  OriginalRow227TriangleData1684.coefficient142_357,
  OriginalRow227TriangleData1684.coefficient142_358,
  OriginalRow227TriangleData1684.coefficient142_359
]

theorem values1684_size : values1684.size = 27 := rfl

def block1684 : ℕ → Option IntervalDyadic := segment 333 values1684

theorem block1684_domain : ExactDomain block1684 333 360 := by
  simpa only [values1684_size] using segment_domain 333 values1684

theorem block1684_get (i : Fin 27) :
    block1684 (333 + i.val) = some (values1684[i.val]'(by rw [values1684_size]; exact i.isLt)) := by
  exact segment_get 333 values1684 ⟨i.val, by rw [values1684_size]; exact i.isLt⟩

def node0173_0237 : ℕ → Option IntervalDyadic := split 205 block1679 block1680

theorem node0173_0237_domain : ExactDomain node0173_0237 173 237 := by
  exact split_domain (by decide) (by decide) block1679_domain block1680_domain

def node0141_0237 : ℕ → Option IntervalDyadic := split 173 block1678 node0173_0237

theorem node0141_0237_domain : ExactDomain node0141_0237 141 237 := by
  exact split_domain (by decide) (by decide) block1678_domain node0173_0237_domain

def node0237_0301 : ℕ → Option IntervalDyadic := split 269 block1681 block1682

theorem node0237_0301_domain : ExactDomain node0237_0301 237 301 := by
  exact split_domain (by decide) (by decide) block1681_domain block1682_domain

def node0301_0360 : ℕ → Option IntervalDyadic := split 333 block1683 block1684

theorem node0301_0360_domain : ExactDomain node0301_0360 301 360 := by
  exact split_domain (by decide) (by decide) block1683_domain block1684_domain

def node0237_0360 : ℕ → Option IntervalDyadic := split 301 node0237_0301 node0301_0360

theorem node0237_0360_domain : ExactDomain node0237_0360 237 360 := by
  exact split_domain (by decide) (by decide) node0237_0301_domain node0301_0360_domain

def node0141_0360 : ℕ → Option IntervalDyadic := split 237 node0141_0237 node0237_0360

theorem node0141_0360_domain : ExactDomain node0141_0360 141 360 := by
  exact split_domain (by decide) (by decide) node0141_0237_domain node0237_0360_domain

def lookup : ℕ → Option IntervalDyadic := node0141_0360

theorem lookup_domain : ExactDomain lookup 141 360 :=
  node0141_0360_domain

theorem block1678_lookup (i : Fin 32) :
    lookup (141 + i.val) = some (values1678[i.val]'(by rw [values1678_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (141 + i.val) = _
  rw [node0141_0360, split_left 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0141_0237, split_left 173 block1678 node0173_0237 (by omega)]
  exact block1678_get i

theorem block1679_lookup (i : Fin 32) :
    lookup (173 + i.val) = some (values1679[i.val]'(by rw [values1679_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (173 + i.val) = _
  rw [node0141_0360, split_left 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0141_0237, split_right 173 block1678 node0173_0237 (by omega)]
  rw [node0173_0237, split_left 205 block1679 block1680 (by omega)]
  exact block1679_get i

theorem block1680_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values1680[i.val]'(by rw [values1680_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (205 + i.val) = _
  rw [node0141_0360, split_left 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0141_0237, split_right 173 block1678 node0173_0237 (by omega)]
  rw [node0173_0237, split_right 205 block1679 block1680 (by omega)]
  exact block1680_get i

theorem block1681_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values1681[i.val]'(by rw [values1681_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (237 + i.val) = _
  rw [node0141_0360, split_right 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0237_0360, split_left 301 node0237_0301 node0301_0360 (by omega)]
  rw [node0237_0301, split_left 269 block1681 block1682 (by omega)]
  exact block1681_get i

theorem block1682_lookup (i : Fin 32) :
    lookup (269 + i.val) = some (values1682[i.val]'(by rw [values1682_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (269 + i.val) = _
  rw [node0141_0360, split_right 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0237_0360, split_left 301 node0237_0301 node0301_0360 (by omega)]
  rw [node0237_0301, split_right 269 block1681 block1682 (by omega)]
  exact block1682_get i

theorem block1683_lookup (i : Fin 32) :
    lookup (301 + i.val) = some (values1683[i.val]'(by rw [values1683_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (301 + i.val) = _
  rw [node0141_0360, split_right 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0237_0360, split_right 301 node0237_0301 node0301_0360 (by omega)]
  rw [node0301_0360, split_left 333 block1683 block1684 (by omega)]
  exact block1683_get i

theorem block1684_lookup (i : Fin 27) :
    lookup (333 + i.val) = some (values1684[i.val]'(by rw [values1684_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0141_0360 (333 + i.val) = _
  rw [node0141_0360, split_right 237 node0141_0237 node0237_0360 (by omega)]
  rw [node0237_0360, split_right 301 node0237_0301 node0301_0360 (by omega)]
  rw [node0301_0360, split_right 333 block1683 block1684 (by omega)]
  exact block1684_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1678_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1678_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1679_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1679_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1680_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1680_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1681_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1681_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1682_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1682_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1683_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1683_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1684_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1684_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1678_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1679_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1680_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1681_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1682_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1683_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow142.block1684_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow142
