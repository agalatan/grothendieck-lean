import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1608
import Grothe.UpperChaos.OriginalRow227TriangleData1609
import Grothe.UpperChaos.OriginalRow227TriangleData1610
import Grothe.UpperChaos.OriginalRow227TriangleData1611
import Grothe.UpperChaos.OriginalRow227TriangleData1612
import Grothe.UpperChaos.OriginalRow227TriangleData1613
import Grothe.UpperChaos.OriginalRow227TriangleData1614
import Grothe.UpperChaos.OriginalRow227TriangleData1615

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow133

open ConditionalTableLookup

def values1608 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1608.coefficient133_132,
  OriginalRow227TriangleData1608.coefficient133_133,
  OriginalRow227TriangleData1608.coefficient133_134,
  OriginalRow227TriangleData1608.coefficient133_135,
  OriginalRow227TriangleData1608.coefficient133_136,
  OriginalRow227TriangleData1608.coefficient133_137,
  OriginalRow227TriangleData1608.coefficient133_138,
  OriginalRow227TriangleData1608.coefficient133_139,
  OriginalRow227TriangleData1608.coefficient133_140,
  OriginalRow227TriangleData1608.coefficient133_141,
  OriginalRow227TriangleData1608.coefficient133_142,
  OriginalRow227TriangleData1608.coefficient133_143,
  OriginalRow227TriangleData1608.coefficient133_144,
  OriginalRow227TriangleData1608.coefficient133_145,
  OriginalRow227TriangleData1608.coefficient133_146,
  OriginalRow227TriangleData1608.coefficient133_147,
  OriginalRow227TriangleData1608.coefficient133_148,
  OriginalRow227TriangleData1608.coefficient133_149,
  OriginalRow227TriangleData1608.coefficient133_150,
  OriginalRow227TriangleData1608.coefficient133_151,
  OriginalRow227TriangleData1608.coefficient133_152,
  OriginalRow227TriangleData1608.coefficient133_153,
  OriginalRow227TriangleData1608.coefficient133_154,
  OriginalRow227TriangleData1608.coefficient133_155,
  OriginalRow227TriangleData1608.coefficient133_156,
  OriginalRow227TriangleData1608.coefficient133_157,
  OriginalRow227TriangleData1608.coefficient133_158,
  OriginalRow227TriangleData1608.coefficient133_159,
  OriginalRow227TriangleData1608.coefficient133_160,
  OriginalRow227TriangleData1608.coefficient133_161,
  OriginalRow227TriangleData1608.coefficient133_162,
  OriginalRow227TriangleData1608.coefficient133_163
]

theorem values1608_size : values1608.size = 32 := rfl

def block1608 : ℕ → Option IntervalDyadic := segment 132 values1608

theorem block1608_domain : ExactDomain block1608 132 164 := by
  simpa only [values1608_size] using segment_domain 132 values1608

theorem block1608_get (i : Fin 32) :
    block1608 (132 + i.val) = some (values1608[i.val]'(by rw [values1608_size]; exact i.isLt)) := by
  exact segment_get 132 values1608 ⟨i.val, by rw [values1608_size]; exact i.isLt⟩

def values1609 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1609.coefficient133_164,
  OriginalRow227TriangleData1609.coefficient133_165,
  OriginalRow227TriangleData1609.coefficient133_166,
  OriginalRow227TriangleData1609.coefficient133_167,
  OriginalRow227TriangleData1609.coefficient133_168,
  OriginalRow227TriangleData1609.coefficient133_169,
  OriginalRow227TriangleData1609.coefficient133_170,
  OriginalRow227TriangleData1609.coefficient133_171,
  OriginalRow227TriangleData1609.coefficient133_172,
  OriginalRow227TriangleData1609.coefficient133_173,
  OriginalRow227TriangleData1609.coefficient133_174,
  OriginalRow227TriangleData1609.coefficient133_175,
  OriginalRow227TriangleData1609.coefficient133_176,
  OriginalRow227TriangleData1609.coefficient133_177,
  OriginalRow227TriangleData1609.coefficient133_178,
  OriginalRow227TriangleData1609.coefficient133_179,
  OriginalRow227TriangleData1609.coefficient133_180,
  OriginalRow227TriangleData1609.coefficient133_181,
  OriginalRow227TriangleData1609.coefficient133_182,
  OriginalRow227TriangleData1609.coefficient133_183,
  OriginalRow227TriangleData1609.coefficient133_184,
  OriginalRow227TriangleData1609.coefficient133_185,
  OriginalRow227TriangleData1609.coefficient133_186,
  OriginalRow227TriangleData1609.coefficient133_187,
  OriginalRow227TriangleData1609.coefficient133_188,
  OriginalRow227TriangleData1609.coefficient133_189,
  OriginalRow227TriangleData1609.coefficient133_190,
  OriginalRow227TriangleData1609.coefficient133_191,
  OriginalRow227TriangleData1609.coefficient133_192,
  OriginalRow227TriangleData1609.coefficient133_193,
  OriginalRow227TriangleData1609.coefficient133_194,
  OriginalRow227TriangleData1609.coefficient133_195
]

theorem values1609_size : values1609.size = 32 := rfl

def block1609 : ℕ → Option IntervalDyadic := segment 164 values1609

theorem block1609_domain : ExactDomain block1609 164 196 := by
  simpa only [values1609_size] using segment_domain 164 values1609

theorem block1609_get (i : Fin 32) :
    block1609 (164 + i.val) = some (values1609[i.val]'(by rw [values1609_size]; exact i.isLt)) := by
  exact segment_get 164 values1609 ⟨i.val, by rw [values1609_size]; exact i.isLt⟩

def values1610 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1610.coefficient133_196,
  OriginalRow227TriangleData1610.coefficient133_197,
  OriginalRow227TriangleData1610.coefficient133_198,
  OriginalRow227TriangleData1610.coefficient133_199,
  OriginalRow227TriangleData1610.coefficient133_200,
  OriginalRow227TriangleData1610.coefficient133_201,
  OriginalRow227TriangleData1610.coefficient133_202,
  OriginalRow227TriangleData1610.coefficient133_203,
  OriginalRow227TriangleData1610.coefficient133_204,
  OriginalRow227TriangleData1610.coefficient133_205,
  OriginalRow227TriangleData1610.coefficient133_206,
  OriginalRow227TriangleData1610.coefficient133_207,
  OriginalRow227TriangleData1610.coefficient133_208,
  OriginalRow227TriangleData1610.coefficient133_209,
  OriginalRow227TriangleData1610.coefficient133_210,
  OriginalRow227TriangleData1610.coefficient133_211,
  OriginalRow227TriangleData1610.coefficient133_212,
  OriginalRow227TriangleData1610.coefficient133_213,
  OriginalRow227TriangleData1610.coefficient133_214,
  OriginalRow227TriangleData1610.coefficient133_215,
  OriginalRow227TriangleData1610.coefficient133_216,
  OriginalRow227TriangleData1610.coefficient133_217,
  OriginalRow227TriangleData1610.coefficient133_218,
  OriginalRow227TriangleData1610.coefficient133_219,
  OriginalRow227TriangleData1610.coefficient133_220,
  OriginalRow227TriangleData1610.coefficient133_221,
  OriginalRow227TriangleData1610.coefficient133_222,
  OriginalRow227TriangleData1610.coefficient133_223,
  OriginalRow227TriangleData1610.coefficient133_224,
  OriginalRow227TriangleData1610.coefficient133_225,
  OriginalRow227TriangleData1610.coefficient133_226,
  OriginalRow227TriangleData1610.coefficient133_227
]

theorem values1610_size : values1610.size = 32 := rfl

def block1610 : ℕ → Option IntervalDyadic := segment 196 values1610

theorem block1610_domain : ExactDomain block1610 196 228 := by
  simpa only [values1610_size] using segment_domain 196 values1610

theorem block1610_get (i : Fin 32) :
    block1610 (196 + i.val) = some (values1610[i.val]'(by rw [values1610_size]; exact i.isLt)) := by
  exact segment_get 196 values1610 ⟨i.val, by rw [values1610_size]; exact i.isLt⟩

def values1611 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1611.coefficient133_228,
  OriginalRow227TriangleData1611.coefficient133_229,
  OriginalRow227TriangleData1611.coefficient133_230,
  OriginalRow227TriangleData1611.coefficient133_231,
  OriginalRow227TriangleData1611.coefficient133_232,
  OriginalRow227TriangleData1611.coefficient133_233,
  OriginalRow227TriangleData1611.coefficient133_234,
  OriginalRow227TriangleData1611.coefficient133_235,
  OriginalRow227TriangleData1611.coefficient133_236,
  OriginalRow227TriangleData1611.coefficient133_237,
  OriginalRow227TriangleData1611.coefficient133_238,
  OriginalRow227TriangleData1611.coefficient133_239,
  OriginalRow227TriangleData1611.coefficient133_240,
  OriginalRow227TriangleData1611.coefficient133_241,
  OriginalRow227TriangleData1611.coefficient133_242,
  OriginalRow227TriangleData1611.coefficient133_243,
  OriginalRow227TriangleData1611.coefficient133_244,
  OriginalRow227TriangleData1611.coefficient133_245,
  OriginalRow227TriangleData1611.coefficient133_246,
  OriginalRow227TriangleData1611.coefficient133_247,
  OriginalRow227TriangleData1611.coefficient133_248,
  OriginalRow227TriangleData1611.coefficient133_249,
  OriginalRow227TriangleData1611.coefficient133_250,
  OriginalRow227TriangleData1611.coefficient133_251,
  OriginalRow227TriangleData1611.coefficient133_252,
  OriginalRow227TriangleData1611.coefficient133_253,
  OriginalRow227TriangleData1611.coefficient133_254,
  OriginalRow227TriangleData1611.coefficient133_255,
  OriginalRow227TriangleData1611.coefficient133_256,
  OriginalRow227TriangleData1611.coefficient133_257,
  OriginalRow227TriangleData1611.coefficient133_258,
  OriginalRow227TriangleData1611.coefficient133_259
]

theorem values1611_size : values1611.size = 32 := rfl

def block1611 : ℕ → Option IntervalDyadic := segment 228 values1611

theorem block1611_domain : ExactDomain block1611 228 260 := by
  simpa only [values1611_size] using segment_domain 228 values1611

theorem block1611_get (i : Fin 32) :
    block1611 (228 + i.val) = some (values1611[i.val]'(by rw [values1611_size]; exact i.isLt)) := by
  exact segment_get 228 values1611 ⟨i.val, by rw [values1611_size]; exact i.isLt⟩

def values1612 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1612.coefficient133_260,
  OriginalRow227TriangleData1612.coefficient133_261,
  OriginalRow227TriangleData1612.coefficient133_262,
  OriginalRow227TriangleData1612.coefficient133_263,
  OriginalRow227TriangleData1612.coefficient133_264,
  OriginalRow227TriangleData1612.coefficient133_265,
  OriginalRow227TriangleData1612.coefficient133_266,
  OriginalRow227TriangleData1612.coefficient133_267,
  OriginalRow227TriangleData1612.coefficient133_268,
  OriginalRow227TriangleData1612.coefficient133_269,
  OriginalRow227TriangleData1612.coefficient133_270,
  OriginalRow227TriangleData1612.coefficient133_271,
  OriginalRow227TriangleData1612.coefficient133_272,
  OriginalRow227TriangleData1612.coefficient133_273,
  OriginalRow227TriangleData1612.coefficient133_274,
  OriginalRow227TriangleData1612.coefficient133_275,
  OriginalRow227TriangleData1612.coefficient133_276,
  OriginalRow227TriangleData1612.coefficient133_277,
  OriginalRow227TriangleData1612.coefficient133_278,
  OriginalRow227TriangleData1612.coefficient133_279,
  OriginalRow227TriangleData1612.coefficient133_280,
  OriginalRow227TriangleData1612.coefficient133_281,
  OriginalRow227TriangleData1612.coefficient133_282,
  OriginalRow227TriangleData1612.coefficient133_283,
  OriginalRow227TriangleData1612.coefficient133_284,
  OriginalRow227TriangleData1612.coefficient133_285,
  OriginalRow227TriangleData1612.coefficient133_286,
  OriginalRow227TriangleData1612.coefficient133_287,
  OriginalRow227TriangleData1612.coefficient133_288,
  OriginalRow227TriangleData1612.coefficient133_289,
  OriginalRow227TriangleData1612.coefficient133_290,
  OriginalRow227TriangleData1612.coefficient133_291
]

theorem values1612_size : values1612.size = 32 := rfl

def block1612 : ℕ → Option IntervalDyadic := segment 260 values1612

theorem block1612_domain : ExactDomain block1612 260 292 := by
  simpa only [values1612_size] using segment_domain 260 values1612

theorem block1612_get (i : Fin 32) :
    block1612 (260 + i.val) = some (values1612[i.val]'(by rw [values1612_size]; exact i.isLt)) := by
  exact segment_get 260 values1612 ⟨i.val, by rw [values1612_size]; exact i.isLt⟩

def values1613 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1613.coefficient133_292,
  OriginalRow227TriangleData1613.coefficient133_293,
  OriginalRow227TriangleData1613.coefficient133_294,
  OriginalRow227TriangleData1613.coefficient133_295,
  OriginalRow227TriangleData1613.coefficient133_296,
  OriginalRow227TriangleData1613.coefficient133_297,
  OriginalRow227TriangleData1613.coefficient133_298,
  OriginalRow227TriangleData1613.coefficient133_299,
  OriginalRow227TriangleData1613.coefficient133_300,
  OriginalRow227TriangleData1613.coefficient133_301,
  OriginalRow227TriangleData1613.coefficient133_302,
  OriginalRow227TriangleData1613.coefficient133_303,
  OriginalRow227TriangleData1613.coefficient133_304,
  OriginalRow227TriangleData1613.coefficient133_305,
  OriginalRow227TriangleData1613.coefficient133_306,
  OriginalRow227TriangleData1613.coefficient133_307,
  OriginalRow227TriangleData1613.coefficient133_308,
  OriginalRow227TriangleData1613.coefficient133_309,
  OriginalRow227TriangleData1613.coefficient133_310,
  OriginalRow227TriangleData1613.coefficient133_311,
  OriginalRow227TriangleData1613.coefficient133_312,
  OriginalRow227TriangleData1613.coefficient133_313,
  OriginalRow227TriangleData1613.coefficient133_314,
  OriginalRow227TriangleData1613.coefficient133_315,
  OriginalRow227TriangleData1613.coefficient133_316,
  OriginalRow227TriangleData1613.coefficient133_317,
  OriginalRow227TriangleData1613.coefficient133_318,
  OriginalRow227TriangleData1613.coefficient133_319,
  OriginalRow227TriangleData1613.coefficient133_320,
  OriginalRow227TriangleData1613.coefficient133_321,
  OriginalRow227TriangleData1613.coefficient133_322,
  OriginalRow227TriangleData1613.coefficient133_323
]

theorem values1613_size : values1613.size = 32 := rfl

def block1613 : ℕ → Option IntervalDyadic := segment 292 values1613

theorem block1613_domain : ExactDomain block1613 292 324 := by
  simpa only [values1613_size] using segment_domain 292 values1613

theorem block1613_get (i : Fin 32) :
    block1613 (292 + i.val) = some (values1613[i.val]'(by rw [values1613_size]; exact i.isLt)) := by
  exact segment_get 292 values1613 ⟨i.val, by rw [values1613_size]; exact i.isLt⟩

def values1614 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1614.coefficient133_324,
  OriginalRow227TriangleData1614.coefficient133_325,
  OriginalRow227TriangleData1614.coefficient133_326,
  OriginalRow227TriangleData1614.coefficient133_327,
  OriginalRow227TriangleData1614.coefficient133_328,
  OriginalRow227TriangleData1614.coefficient133_329,
  OriginalRow227TriangleData1614.coefficient133_330,
  OriginalRow227TriangleData1614.coefficient133_331,
  OriginalRow227TriangleData1614.coefficient133_332,
  OriginalRow227TriangleData1614.coefficient133_333,
  OriginalRow227TriangleData1614.coefficient133_334,
  OriginalRow227TriangleData1614.coefficient133_335,
  OriginalRow227TriangleData1614.coefficient133_336,
  OriginalRow227TriangleData1614.coefficient133_337,
  OriginalRow227TriangleData1614.coefficient133_338,
  OriginalRow227TriangleData1614.coefficient133_339,
  OriginalRow227TriangleData1614.coefficient133_340,
  OriginalRow227TriangleData1614.coefficient133_341,
  OriginalRow227TriangleData1614.coefficient133_342,
  OriginalRow227TriangleData1614.coefficient133_343,
  OriginalRow227TriangleData1614.coefficient133_344,
  OriginalRow227TriangleData1614.coefficient133_345,
  OriginalRow227TriangleData1614.coefficient133_346,
  OriginalRow227TriangleData1614.coefficient133_347,
  OriginalRow227TriangleData1614.coefficient133_348,
  OriginalRow227TriangleData1614.coefficient133_349,
  OriginalRow227TriangleData1614.coefficient133_350,
  OriginalRow227TriangleData1614.coefficient133_351,
  OriginalRow227TriangleData1614.coefficient133_352,
  OriginalRow227TriangleData1614.coefficient133_353,
  OriginalRow227TriangleData1614.coefficient133_354,
  OriginalRow227TriangleData1614.coefficient133_355
]

theorem values1614_size : values1614.size = 32 := rfl

def block1614 : ℕ → Option IntervalDyadic := segment 324 values1614

theorem block1614_domain : ExactDomain block1614 324 356 := by
  simpa only [values1614_size] using segment_domain 324 values1614

theorem block1614_get (i : Fin 32) :
    block1614 (324 + i.val) = some (values1614[i.val]'(by rw [values1614_size]; exact i.isLt)) := by
  exact segment_get 324 values1614 ⟨i.val, by rw [values1614_size]; exact i.isLt⟩

def values1615 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1615.coefficient133_356,
  OriginalRow227TriangleData1615.coefficient133_357,
  OriginalRow227TriangleData1615.coefficient133_358,
  OriginalRow227TriangleData1615.coefficient133_359,
  OriginalRow227TriangleData1615.coefficient133_360,
  OriginalRow227TriangleData1615.coefficient133_361,
  OriginalRow227TriangleData1615.coefficient133_362,
  OriginalRow227TriangleData1615.coefficient133_363,
  OriginalRow227TriangleData1615.coefficient133_364,
  OriginalRow227TriangleData1615.coefficient133_365,
  OriginalRow227TriangleData1615.coefficient133_366,
  OriginalRow227TriangleData1615.coefficient133_367,
  OriginalRow227TriangleData1615.coefficient133_368
]

theorem values1615_size : values1615.size = 13 := rfl

def block1615 : ℕ → Option IntervalDyadic := segment 356 values1615

theorem block1615_domain : ExactDomain block1615 356 369 := by
  simpa only [values1615_size] using segment_domain 356 values1615

theorem block1615_get (i : Fin 13) :
    block1615 (356 + i.val) = some (values1615[i.val]'(by rw [values1615_size]; exact i.isLt)) := by
  exact segment_get 356 values1615 ⟨i.val, by rw [values1615_size]; exact i.isLt⟩

def node0132_0196 : ℕ → Option IntervalDyadic := split 164 block1608 block1609

theorem node0132_0196_domain : ExactDomain node0132_0196 132 196 := by
  exact split_domain (by decide) (by decide) block1608_domain block1609_domain

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block1610 block1611

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block1610_domain block1611_domain

def node0132_0260 : ℕ → Option IntervalDyadic := split 196 node0132_0196 node0196_0260

theorem node0132_0260_domain : ExactDomain node0132_0260 132 260 := by
  exact split_domain (by decide) (by decide) node0132_0196_domain node0196_0260_domain

def node0260_0324 : ℕ → Option IntervalDyadic := split 292 block1612 block1613

theorem node0260_0324_domain : ExactDomain node0260_0324 260 324 := by
  exact split_domain (by decide) (by decide) block1612_domain block1613_domain

def node0324_0369 : ℕ → Option IntervalDyadic := split 356 block1614 block1615

theorem node0324_0369_domain : ExactDomain node0324_0369 324 369 := by
  exact split_domain (by decide) (by decide) block1614_domain block1615_domain

def node0260_0369 : ℕ → Option IntervalDyadic := split 324 node0260_0324 node0324_0369

theorem node0260_0369_domain : ExactDomain node0260_0369 260 369 := by
  exact split_domain (by decide) (by decide) node0260_0324_domain node0324_0369_domain

def node0132_0369 : ℕ → Option IntervalDyadic := split 260 node0132_0260 node0260_0369

theorem node0132_0369_domain : ExactDomain node0132_0369 132 369 := by
  exact split_domain (by decide) (by decide) node0132_0260_domain node0260_0369_domain

def lookup : ℕ → Option IntervalDyadic := node0132_0369

theorem lookup_domain : ExactDomain lookup 132 369 :=
  node0132_0369_domain

theorem block1608_lookup (i : Fin 32) :
    lookup (132 + i.val) = some (values1608[i.val]'(by rw [values1608_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (132 + i.val) = _
  rw [node0132_0369, split_left 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0132_0260, split_left 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0132_0196, split_left 164 block1608 block1609 (by omega)]
  exact block1608_get i

theorem block1609_lookup (i : Fin 32) :
    lookup (164 + i.val) = some (values1609[i.val]'(by rw [values1609_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (164 + i.val) = _
  rw [node0132_0369, split_left 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0132_0260, split_left 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0132_0196, split_right 164 block1608 block1609 (by omega)]
  exact block1609_get i

theorem block1610_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values1610[i.val]'(by rw [values1610_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (196 + i.val) = _
  rw [node0132_0369, split_left 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0132_0260, split_right 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0196_0260, split_left 228 block1610 block1611 (by omega)]
  exact block1610_get i

theorem block1611_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values1611[i.val]'(by rw [values1611_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (228 + i.val) = _
  rw [node0132_0369, split_left 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0132_0260, split_right 196 node0132_0196 node0196_0260 (by omega)]
  rw [node0196_0260, split_right 228 block1610 block1611 (by omega)]
  exact block1611_get i

theorem block1612_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values1612[i.val]'(by rw [values1612_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (260 + i.val) = _
  rw [node0132_0369, split_right 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0260_0369, split_left 324 node0260_0324 node0324_0369 (by omega)]
  rw [node0260_0324, split_left 292 block1612 block1613 (by omega)]
  exact block1612_get i

theorem block1613_lookup (i : Fin 32) :
    lookup (292 + i.val) = some (values1613[i.val]'(by rw [values1613_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (292 + i.val) = _
  rw [node0132_0369, split_right 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0260_0369, split_left 324 node0260_0324 node0324_0369 (by omega)]
  rw [node0260_0324, split_right 292 block1612 block1613 (by omega)]
  exact block1613_get i

theorem block1614_lookup (i : Fin 32) :
    lookup (324 + i.val) = some (values1614[i.val]'(by rw [values1614_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (324 + i.val) = _
  rw [node0132_0369, split_right 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0260_0369, split_right 324 node0260_0324 node0324_0369 (by omega)]
  rw [node0324_0369, split_left 356 block1614 block1615 (by omega)]
  exact block1614_get i

theorem block1615_lookup (i : Fin 13) :
    lookup (356 + i.val) = some (values1615[i.val]'(by rw [values1615_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0132_0369 (356 + i.val) = _
  rw [node0132_0369, split_right 260 node0132_0260 node0260_0369 (by omega)]
  rw [node0260_0369, split_right 324 node0260_0324 node0324_0369 (by omega)]
  rw [node0324_0369, split_right 356 block1614 block1615 (by omega)]
  exact block1615_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1608_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1608_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1609_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1609_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1610_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1610_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1611_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1611_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1612_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1612_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1613_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1613_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1614_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1614_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1615_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1615_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1608_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1609_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1610_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1611_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1612_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1613_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1614_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow133.block1615_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow133
