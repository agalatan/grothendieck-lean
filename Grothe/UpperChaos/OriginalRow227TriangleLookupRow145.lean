import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1699
import Grothe.UpperChaos.OriginalRow227TriangleData1700
import Grothe.UpperChaos.OriginalRow227TriangleData1701
import Grothe.UpperChaos.OriginalRow227TriangleData1702
import Grothe.UpperChaos.OriginalRow227TriangleData1703
import Grothe.UpperChaos.OriginalRow227TriangleData1704
import Grothe.UpperChaos.OriginalRow227TriangleData1705

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow145

open ConditionalTableLookup

def values1699 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1699.coefficient145_144,
  OriginalRow227TriangleData1699.coefficient145_145,
  OriginalRow227TriangleData1699.coefficient145_146,
  OriginalRow227TriangleData1699.coefficient145_147,
  OriginalRow227TriangleData1699.coefficient145_148,
  OriginalRow227TriangleData1699.coefficient145_149,
  OriginalRow227TriangleData1699.coefficient145_150,
  OriginalRow227TriangleData1699.coefficient145_151,
  OriginalRow227TriangleData1699.coefficient145_152,
  OriginalRow227TriangleData1699.coefficient145_153,
  OriginalRow227TriangleData1699.coefficient145_154,
  OriginalRow227TriangleData1699.coefficient145_155,
  OriginalRow227TriangleData1699.coefficient145_156,
  OriginalRow227TriangleData1699.coefficient145_157,
  OriginalRow227TriangleData1699.coefficient145_158,
  OriginalRow227TriangleData1699.coefficient145_159,
  OriginalRow227TriangleData1699.coefficient145_160,
  OriginalRow227TriangleData1699.coefficient145_161,
  OriginalRow227TriangleData1699.coefficient145_162,
  OriginalRow227TriangleData1699.coefficient145_163,
  OriginalRow227TriangleData1699.coefficient145_164,
  OriginalRow227TriangleData1699.coefficient145_165,
  OriginalRow227TriangleData1699.coefficient145_166,
  OriginalRow227TriangleData1699.coefficient145_167,
  OriginalRow227TriangleData1699.coefficient145_168,
  OriginalRow227TriangleData1699.coefficient145_169,
  OriginalRow227TriangleData1699.coefficient145_170,
  OriginalRow227TriangleData1699.coefficient145_171,
  OriginalRow227TriangleData1699.coefficient145_172,
  OriginalRow227TriangleData1699.coefficient145_173,
  OriginalRow227TriangleData1699.coefficient145_174,
  OriginalRow227TriangleData1699.coefficient145_175
]

theorem values1699_size : values1699.size = 32 := rfl

def block1699 : ℕ → Option IntervalDyadic := segment 144 values1699

theorem block1699_domain : ExactDomain block1699 144 176 := by
  simpa only [values1699_size] using segment_domain 144 values1699

theorem block1699_get (i : Fin 32) :
    block1699 (144 + i.val) = some (values1699[i.val]'(by rw [values1699_size]; exact i.isLt)) := by
  exact segment_get 144 values1699 ⟨i.val, by rw [values1699_size]; exact i.isLt⟩

def values1700 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1700.coefficient145_176,
  OriginalRow227TriangleData1700.coefficient145_177,
  OriginalRow227TriangleData1700.coefficient145_178,
  OriginalRow227TriangleData1700.coefficient145_179,
  OriginalRow227TriangleData1700.coefficient145_180,
  OriginalRow227TriangleData1700.coefficient145_181,
  OriginalRow227TriangleData1700.coefficient145_182,
  OriginalRow227TriangleData1700.coefficient145_183,
  OriginalRow227TriangleData1700.coefficient145_184,
  OriginalRow227TriangleData1700.coefficient145_185,
  OriginalRow227TriangleData1700.coefficient145_186,
  OriginalRow227TriangleData1700.coefficient145_187,
  OriginalRow227TriangleData1700.coefficient145_188,
  OriginalRow227TriangleData1700.coefficient145_189,
  OriginalRow227TriangleData1700.coefficient145_190,
  OriginalRow227TriangleData1700.coefficient145_191,
  OriginalRow227TriangleData1700.coefficient145_192,
  OriginalRow227TriangleData1700.coefficient145_193,
  OriginalRow227TriangleData1700.coefficient145_194,
  OriginalRow227TriangleData1700.coefficient145_195,
  OriginalRow227TriangleData1700.coefficient145_196,
  OriginalRow227TriangleData1700.coefficient145_197,
  OriginalRow227TriangleData1700.coefficient145_198,
  OriginalRow227TriangleData1700.coefficient145_199,
  OriginalRow227TriangleData1700.coefficient145_200,
  OriginalRow227TriangleData1700.coefficient145_201,
  OriginalRow227TriangleData1700.coefficient145_202,
  OriginalRow227TriangleData1700.coefficient145_203,
  OriginalRow227TriangleData1700.coefficient145_204,
  OriginalRow227TriangleData1700.coefficient145_205,
  OriginalRow227TriangleData1700.coefficient145_206,
  OriginalRow227TriangleData1700.coefficient145_207
]

theorem values1700_size : values1700.size = 32 := rfl

def block1700 : ℕ → Option IntervalDyadic := segment 176 values1700

theorem block1700_domain : ExactDomain block1700 176 208 := by
  simpa only [values1700_size] using segment_domain 176 values1700

theorem block1700_get (i : Fin 32) :
    block1700 (176 + i.val) = some (values1700[i.val]'(by rw [values1700_size]; exact i.isLt)) := by
  exact segment_get 176 values1700 ⟨i.val, by rw [values1700_size]; exact i.isLt⟩

def values1701 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1701.coefficient145_208,
  OriginalRow227TriangleData1701.coefficient145_209,
  OriginalRow227TriangleData1701.coefficient145_210,
  OriginalRow227TriangleData1701.coefficient145_211,
  OriginalRow227TriangleData1701.coefficient145_212,
  OriginalRow227TriangleData1701.coefficient145_213,
  OriginalRow227TriangleData1701.coefficient145_214,
  OriginalRow227TriangleData1701.coefficient145_215,
  OriginalRow227TriangleData1701.coefficient145_216,
  OriginalRow227TriangleData1701.coefficient145_217,
  OriginalRow227TriangleData1701.coefficient145_218,
  OriginalRow227TriangleData1701.coefficient145_219,
  OriginalRow227TriangleData1701.coefficient145_220,
  OriginalRow227TriangleData1701.coefficient145_221,
  OriginalRow227TriangleData1701.coefficient145_222,
  OriginalRow227TriangleData1701.coefficient145_223,
  OriginalRow227TriangleData1701.coefficient145_224,
  OriginalRow227TriangleData1701.coefficient145_225,
  OriginalRow227TriangleData1701.coefficient145_226,
  OriginalRow227TriangleData1701.coefficient145_227,
  OriginalRow227TriangleData1701.coefficient145_228,
  OriginalRow227TriangleData1701.coefficient145_229,
  OriginalRow227TriangleData1701.coefficient145_230,
  OriginalRow227TriangleData1701.coefficient145_231,
  OriginalRow227TriangleData1701.coefficient145_232,
  OriginalRow227TriangleData1701.coefficient145_233,
  OriginalRow227TriangleData1701.coefficient145_234,
  OriginalRow227TriangleData1701.coefficient145_235,
  OriginalRow227TriangleData1701.coefficient145_236,
  OriginalRow227TriangleData1701.coefficient145_237,
  OriginalRow227TriangleData1701.coefficient145_238,
  OriginalRow227TriangleData1701.coefficient145_239
]

theorem values1701_size : values1701.size = 32 := rfl

def block1701 : ℕ → Option IntervalDyadic := segment 208 values1701

theorem block1701_domain : ExactDomain block1701 208 240 := by
  simpa only [values1701_size] using segment_domain 208 values1701

theorem block1701_get (i : Fin 32) :
    block1701 (208 + i.val) = some (values1701[i.val]'(by rw [values1701_size]; exact i.isLt)) := by
  exact segment_get 208 values1701 ⟨i.val, by rw [values1701_size]; exact i.isLt⟩

def values1702 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1702.coefficient145_240,
  OriginalRow227TriangleData1702.coefficient145_241,
  OriginalRow227TriangleData1702.coefficient145_242,
  OriginalRow227TriangleData1702.coefficient145_243,
  OriginalRow227TriangleData1702.coefficient145_244,
  OriginalRow227TriangleData1702.coefficient145_245,
  OriginalRow227TriangleData1702.coefficient145_246,
  OriginalRow227TriangleData1702.coefficient145_247,
  OriginalRow227TriangleData1702.coefficient145_248,
  OriginalRow227TriangleData1702.coefficient145_249,
  OriginalRow227TriangleData1702.coefficient145_250,
  OriginalRow227TriangleData1702.coefficient145_251,
  OriginalRow227TriangleData1702.coefficient145_252,
  OriginalRow227TriangleData1702.coefficient145_253,
  OriginalRow227TriangleData1702.coefficient145_254,
  OriginalRow227TriangleData1702.coefficient145_255,
  OriginalRow227TriangleData1702.coefficient145_256,
  OriginalRow227TriangleData1702.coefficient145_257,
  OriginalRow227TriangleData1702.coefficient145_258,
  OriginalRow227TriangleData1702.coefficient145_259,
  OriginalRow227TriangleData1702.coefficient145_260,
  OriginalRow227TriangleData1702.coefficient145_261,
  OriginalRow227TriangleData1702.coefficient145_262,
  OriginalRow227TriangleData1702.coefficient145_263,
  OriginalRow227TriangleData1702.coefficient145_264,
  OriginalRow227TriangleData1702.coefficient145_265,
  OriginalRow227TriangleData1702.coefficient145_266,
  OriginalRow227TriangleData1702.coefficient145_267,
  OriginalRow227TriangleData1702.coefficient145_268,
  OriginalRow227TriangleData1702.coefficient145_269,
  OriginalRow227TriangleData1702.coefficient145_270,
  OriginalRow227TriangleData1702.coefficient145_271
]

theorem values1702_size : values1702.size = 32 := rfl

def block1702 : ℕ → Option IntervalDyadic := segment 240 values1702

theorem block1702_domain : ExactDomain block1702 240 272 := by
  simpa only [values1702_size] using segment_domain 240 values1702

theorem block1702_get (i : Fin 32) :
    block1702 (240 + i.val) = some (values1702[i.val]'(by rw [values1702_size]; exact i.isLt)) := by
  exact segment_get 240 values1702 ⟨i.val, by rw [values1702_size]; exact i.isLt⟩

def values1703 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1703.coefficient145_272,
  OriginalRow227TriangleData1703.coefficient145_273,
  OriginalRow227TriangleData1703.coefficient145_274,
  OriginalRow227TriangleData1703.coefficient145_275,
  OriginalRow227TriangleData1703.coefficient145_276,
  OriginalRow227TriangleData1703.coefficient145_277,
  OriginalRow227TriangleData1703.coefficient145_278,
  OriginalRow227TriangleData1703.coefficient145_279,
  OriginalRow227TriangleData1703.coefficient145_280,
  OriginalRow227TriangleData1703.coefficient145_281,
  OriginalRow227TriangleData1703.coefficient145_282,
  OriginalRow227TriangleData1703.coefficient145_283,
  OriginalRow227TriangleData1703.coefficient145_284,
  OriginalRow227TriangleData1703.coefficient145_285,
  OriginalRow227TriangleData1703.coefficient145_286,
  OriginalRow227TriangleData1703.coefficient145_287,
  OriginalRow227TriangleData1703.coefficient145_288,
  OriginalRow227TriangleData1703.coefficient145_289,
  OriginalRow227TriangleData1703.coefficient145_290,
  OriginalRow227TriangleData1703.coefficient145_291,
  OriginalRow227TriangleData1703.coefficient145_292,
  OriginalRow227TriangleData1703.coefficient145_293,
  OriginalRow227TriangleData1703.coefficient145_294,
  OriginalRow227TriangleData1703.coefficient145_295,
  OriginalRow227TriangleData1703.coefficient145_296,
  OriginalRow227TriangleData1703.coefficient145_297,
  OriginalRow227TriangleData1703.coefficient145_298,
  OriginalRow227TriangleData1703.coefficient145_299,
  OriginalRow227TriangleData1703.coefficient145_300,
  OriginalRow227TriangleData1703.coefficient145_301,
  OriginalRow227TriangleData1703.coefficient145_302,
  OriginalRow227TriangleData1703.coefficient145_303
]

theorem values1703_size : values1703.size = 32 := rfl

def block1703 : ℕ → Option IntervalDyadic := segment 272 values1703

theorem block1703_domain : ExactDomain block1703 272 304 := by
  simpa only [values1703_size] using segment_domain 272 values1703

theorem block1703_get (i : Fin 32) :
    block1703 (272 + i.val) = some (values1703[i.val]'(by rw [values1703_size]; exact i.isLt)) := by
  exact segment_get 272 values1703 ⟨i.val, by rw [values1703_size]; exact i.isLt⟩

def values1704 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1704.coefficient145_304,
  OriginalRow227TriangleData1704.coefficient145_305,
  OriginalRow227TriangleData1704.coefficient145_306,
  OriginalRow227TriangleData1704.coefficient145_307,
  OriginalRow227TriangleData1704.coefficient145_308,
  OriginalRow227TriangleData1704.coefficient145_309,
  OriginalRow227TriangleData1704.coefficient145_310,
  OriginalRow227TriangleData1704.coefficient145_311,
  OriginalRow227TriangleData1704.coefficient145_312,
  OriginalRow227TriangleData1704.coefficient145_313,
  OriginalRow227TriangleData1704.coefficient145_314,
  OriginalRow227TriangleData1704.coefficient145_315,
  OriginalRow227TriangleData1704.coefficient145_316,
  OriginalRow227TriangleData1704.coefficient145_317,
  OriginalRow227TriangleData1704.coefficient145_318,
  OriginalRow227TriangleData1704.coefficient145_319,
  OriginalRow227TriangleData1704.coefficient145_320,
  OriginalRow227TriangleData1704.coefficient145_321,
  OriginalRow227TriangleData1704.coefficient145_322,
  OriginalRow227TriangleData1704.coefficient145_323,
  OriginalRow227TriangleData1704.coefficient145_324,
  OriginalRow227TriangleData1704.coefficient145_325,
  OriginalRow227TriangleData1704.coefficient145_326,
  OriginalRow227TriangleData1704.coefficient145_327,
  OriginalRow227TriangleData1704.coefficient145_328,
  OriginalRow227TriangleData1704.coefficient145_329,
  OriginalRow227TriangleData1704.coefficient145_330,
  OriginalRow227TriangleData1704.coefficient145_331,
  OriginalRow227TriangleData1704.coefficient145_332,
  OriginalRow227TriangleData1704.coefficient145_333,
  OriginalRow227TriangleData1704.coefficient145_334,
  OriginalRow227TriangleData1704.coefficient145_335
]

theorem values1704_size : values1704.size = 32 := rfl

def block1704 : ℕ → Option IntervalDyadic := segment 304 values1704

theorem block1704_domain : ExactDomain block1704 304 336 := by
  simpa only [values1704_size] using segment_domain 304 values1704

theorem block1704_get (i : Fin 32) :
    block1704 (304 + i.val) = some (values1704[i.val]'(by rw [values1704_size]; exact i.isLt)) := by
  exact segment_get 304 values1704 ⟨i.val, by rw [values1704_size]; exact i.isLt⟩

def values1705 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1705.coefficient145_336,
  OriginalRow227TriangleData1705.coefficient145_337,
  OriginalRow227TriangleData1705.coefficient145_338,
  OriginalRow227TriangleData1705.coefficient145_339,
  OriginalRow227TriangleData1705.coefficient145_340,
  OriginalRow227TriangleData1705.coefficient145_341,
  OriginalRow227TriangleData1705.coefficient145_342,
  OriginalRow227TriangleData1705.coefficient145_343,
  OriginalRow227TriangleData1705.coefficient145_344,
  OriginalRow227TriangleData1705.coefficient145_345,
  OriginalRow227TriangleData1705.coefficient145_346,
  OriginalRow227TriangleData1705.coefficient145_347,
  OriginalRow227TriangleData1705.coefficient145_348,
  OriginalRow227TriangleData1705.coefficient145_349,
  OriginalRow227TriangleData1705.coefficient145_350,
  OriginalRow227TriangleData1705.coefficient145_351,
  OriginalRow227TriangleData1705.coefficient145_352,
  OriginalRow227TriangleData1705.coefficient145_353,
  OriginalRow227TriangleData1705.coefficient145_354,
  OriginalRow227TriangleData1705.coefficient145_355,
  OriginalRow227TriangleData1705.coefficient145_356
]

theorem values1705_size : values1705.size = 21 := rfl

def block1705 : ℕ → Option IntervalDyadic := segment 336 values1705

theorem block1705_domain : ExactDomain block1705 336 357 := by
  simpa only [values1705_size] using segment_domain 336 values1705

theorem block1705_get (i : Fin 21) :
    block1705 (336 + i.val) = some (values1705[i.val]'(by rw [values1705_size]; exact i.isLt)) := by
  exact segment_get 336 values1705 ⟨i.val, by rw [values1705_size]; exact i.isLt⟩

def node0176_0240 : ℕ → Option IntervalDyadic := split 208 block1700 block1701

theorem node0176_0240_domain : ExactDomain node0176_0240 176 240 := by
  exact split_domain (by decide) (by decide) block1700_domain block1701_domain

def node0144_0240 : ℕ → Option IntervalDyadic := split 176 block1699 node0176_0240

theorem node0144_0240_domain : ExactDomain node0144_0240 144 240 := by
  exact split_domain (by decide) (by decide) block1699_domain node0176_0240_domain

def node0240_0304 : ℕ → Option IntervalDyadic := split 272 block1702 block1703

theorem node0240_0304_domain : ExactDomain node0240_0304 240 304 := by
  exact split_domain (by decide) (by decide) block1702_domain block1703_domain

def node0304_0357 : ℕ → Option IntervalDyadic := split 336 block1704 block1705

theorem node0304_0357_domain : ExactDomain node0304_0357 304 357 := by
  exact split_domain (by decide) (by decide) block1704_domain block1705_domain

def node0240_0357 : ℕ → Option IntervalDyadic := split 304 node0240_0304 node0304_0357

theorem node0240_0357_domain : ExactDomain node0240_0357 240 357 := by
  exact split_domain (by decide) (by decide) node0240_0304_domain node0304_0357_domain

def node0144_0357 : ℕ → Option IntervalDyadic := split 240 node0144_0240 node0240_0357

theorem node0144_0357_domain : ExactDomain node0144_0357 144 357 := by
  exact split_domain (by decide) (by decide) node0144_0240_domain node0240_0357_domain

def lookup : ℕ → Option IntervalDyadic := node0144_0357

theorem lookup_domain : ExactDomain lookup 144 357 :=
  node0144_0357_domain

theorem block1699_lookup (i : Fin 32) :
    lookup (144 + i.val) = some (values1699[i.val]'(by rw [values1699_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (144 + i.val) = _
  rw [node0144_0357, split_left 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0144_0240, split_left 176 block1699 node0176_0240 (by omega)]
  exact block1699_get i

theorem block1700_lookup (i : Fin 32) :
    lookup (176 + i.val) = some (values1700[i.val]'(by rw [values1700_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (176 + i.val) = _
  rw [node0144_0357, split_left 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0144_0240, split_right 176 block1699 node0176_0240 (by omega)]
  rw [node0176_0240, split_left 208 block1700 block1701 (by omega)]
  exact block1700_get i

theorem block1701_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values1701[i.val]'(by rw [values1701_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (208 + i.val) = _
  rw [node0144_0357, split_left 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0144_0240, split_right 176 block1699 node0176_0240 (by omega)]
  rw [node0176_0240, split_right 208 block1700 block1701 (by omega)]
  exact block1701_get i

theorem block1702_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values1702[i.val]'(by rw [values1702_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (240 + i.val) = _
  rw [node0144_0357, split_right 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0240_0357, split_left 304 node0240_0304 node0304_0357 (by omega)]
  rw [node0240_0304, split_left 272 block1702 block1703 (by omega)]
  exact block1702_get i

theorem block1703_lookup (i : Fin 32) :
    lookup (272 + i.val) = some (values1703[i.val]'(by rw [values1703_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (272 + i.val) = _
  rw [node0144_0357, split_right 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0240_0357, split_left 304 node0240_0304 node0304_0357 (by omega)]
  rw [node0240_0304, split_right 272 block1702 block1703 (by omega)]
  exact block1703_get i

theorem block1704_lookup (i : Fin 32) :
    lookup (304 + i.val) = some (values1704[i.val]'(by rw [values1704_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (304 + i.val) = _
  rw [node0144_0357, split_right 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0240_0357, split_right 304 node0240_0304 node0304_0357 (by omega)]
  rw [node0304_0357, split_left 336 block1704 block1705 (by omega)]
  exact block1704_get i

theorem block1705_lookup (i : Fin 21) :
    lookup (336 + i.val) = some (values1705[i.val]'(by rw [values1705_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0144_0357 (336 + i.val) = _
  rw [node0144_0357, split_right 240 node0144_0240 node0240_0357 (by omega)]
  rw [node0240_0357, split_right 304 node0240_0304 node0304_0357 (by omega)]
  rw [node0304_0357, split_right 336 block1704 block1705 (by omega)]
  exact block1705_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1699_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1699_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1700_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1700_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1701_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1701_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1702_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1702_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1703_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1703_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1704_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1704_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1705_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1705_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1699_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1700_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1701_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1702_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1703_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1704_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow145.block1705_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow145
