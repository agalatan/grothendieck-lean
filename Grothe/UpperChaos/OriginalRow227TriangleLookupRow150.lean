import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1734
import Grothe.UpperChaos.OriginalRow227TriangleData1735
import Grothe.UpperChaos.OriginalRow227TriangleData1736
import Grothe.UpperChaos.OriginalRow227TriangleData1737
import Grothe.UpperChaos.OriginalRow227TriangleData1738
import Grothe.UpperChaos.OriginalRow227TriangleData1739
import Grothe.UpperChaos.OriginalRow227TriangleData1740

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow150

open ConditionalTableLookup

def values1734 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1734.coefficient150_149,
  OriginalRow227TriangleData1734.coefficient150_150,
  OriginalRow227TriangleData1734.coefficient150_151,
  OriginalRow227TriangleData1734.coefficient150_152,
  OriginalRow227TriangleData1734.coefficient150_153,
  OriginalRow227TriangleData1734.coefficient150_154,
  OriginalRow227TriangleData1734.coefficient150_155,
  OriginalRow227TriangleData1734.coefficient150_156,
  OriginalRow227TriangleData1734.coefficient150_157,
  OriginalRow227TriangleData1734.coefficient150_158,
  OriginalRow227TriangleData1734.coefficient150_159,
  OriginalRow227TriangleData1734.coefficient150_160,
  OriginalRow227TriangleData1734.coefficient150_161,
  OriginalRow227TriangleData1734.coefficient150_162,
  OriginalRow227TriangleData1734.coefficient150_163,
  OriginalRow227TriangleData1734.coefficient150_164,
  OriginalRow227TriangleData1734.coefficient150_165,
  OriginalRow227TriangleData1734.coefficient150_166,
  OriginalRow227TriangleData1734.coefficient150_167,
  OriginalRow227TriangleData1734.coefficient150_168,
  OriginalRow227TriangleData1734.coefficient150_169,
  OriginalRow227TriangleData1734.coefficient150_170,
  OriginalRow227TriangleData1734.coefficient150_171,
  OriginalRow227TriangleData1734.coefficient150_172,
  OriginalRow227TriangleData1734.coefficient150_173,
  OriginalRow227TriangleData1734.coefficient150_174,
  OriginalRow227TriangleData1734.coefficient150_175,
  OriginalRow227TriangleData1734.coefficient150_176,
  OriginalRow227TriangleData1734.coefficient150_177,
  OriginalRow227TriangleData1734.coefficient150_178,
  OriginalRow227TriangleData1734.coefficient150_179,
  OriginalRow227TriangleData1734.coefficient150_180
]

theorem values1734_size : values1734.size = 32 := rfl

def block1734 : ℕ → Option IntervalDyadic := segment 149 values1734

theorem block1734_domain : ExactDomain block1734 149 181 := by
  simpa only [values1734_size] using segment_domain 149 values1734

theorem block1734_get (i : Fin 32) :
    block1734 (149 + i.val) = some (values1734[i.val]'(by rw [values1734_size]; exact i.isLt)) := by
  exact segment_get 149 values1734 ⟨i.val, by rw [values1734_size]; exact i.isLt⟩

def values1735 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1735.coefficient150_181,
  OriginalRow227TriangleData1735.coefficient150_182,
  OriginalRow227TriangleData1735.coefficient150_183,
  OriginalRow227TriangleData1735.coefficient150_184,
  OriginalRow227TriangleData1735.coefficient150_185,
  OriginalRow227TriangleData1735.coefficient150_186,
  OriginalRow227TriangleData1735.coefficient150_187,
  OriginalRow227TriangleData1735.coefficient150_188,
  OriginalRow227TriangleData1735.coefficient150_189,
  OriginalRow227TriangleData1735.coefficient150_190,
  OriginalRow227TriangleData1735.coefficient150_191,
  OriginalRow227TriangleData1735.coefficient150_192,
  OriginalRow227TriangleData1735.coefficient150_193,
  OriginalRow227TriangleData1735.coefficient150_194,
  OriginalRow227TriangleData1735.coefficient150_195,
  OriginalRow227TriangleData1735.coefficient150_196,
  OriginalRow227TriangleData1735.coefficient150_197,
  OriginalRow227TriangleData1735.coefficient150_198,
  OriginalRow227TriangleData1735.coefficient150_199,
  OriginalRow227TriangleData1735.coefficient150_200,
  OriginalRow227TriangleData1735.coefficient150_201,
  OriginalRow227TriangleData1735.coefficient150_202,
  OriginalRow227TriangleData1735.coefficient150_203,
  OriginalRow227TriangleData1735.coefficient150_204,
  OriginalRow227TriangleData1735.coefficient150_205,
  OriginalRow227TriangleData1735.coefficient150_206,
  OriginalRow227TriangleData1735.coefficient150_207,
  OriginalRow227TriangleData1735.coefficient150_208,
  OriginalRow227TriangleData1735.coefficient150_209,
  OriginalRow227TriangleData1735.coefficient150_210,
  OriginalRow227TriangleData1735.coefficient150_211,
  OriginalRow227TriangleData1735.coefficient150_212
]

theorem values1735_size : values1735.size = 32 := rfl

def block1735 : ℕ → Option IntervalDyadic := segment 181 values1735

theorem block1735_domain : ExactDomain block1735 181 213 := by
  simpa only [values1735_size] using segment_domain 181 values1735

theorem block1735_get (i : Fin 32) :
    block1735 (181 + i.val) = some (values1735[i.val]'(by rw [values1735_size]; exact i.isLt)) := by
  exact segment_get 181 values1735 ⟨i.val, by rw [values1735_size]; exact i.isLt⟩

def values1736 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1736.coefficient150_213,
  OriginalRow227TriangleData1736.coefficient150_214,
  OriginalRow227TriangleData1736.coefficient150_215,
  OriginalRow227TriangleData1736.coefficient150_216,
  OriginalRow227TriangleData1736.coefficient150_217,
  OriginalRow227TriangleData1736.coefficient150_218,
  OriginalRow227TriangleData1736.coefficient150_219,
  OriginalRow227TriangleData1736.coefficient150_220,
  OriginalRow227TriangleData1736.coefficient150_221,
  OriginalRow227TriangleData1736.coefficient150_222,
  OriginalRow227TriangleData1736.coefficient150_223,
  OriginalRow227TriangleData1736.coefficient150_224,
  OriginalRow227TriangleData1736.coefficient150_225,
  OriginalRow227TriangleData1736.coefficient150_226,
  OriginalRow227TriangleData1736.coefficient150_227,
  OriginalRow227TriangleData1736.coefficient150_228,
  OriginalRow227TriangleData1736.coefficient150_229,
  OriginalRow227TriangleData1736.coefficient150_230,
  OriginalRow227TriangleData1736.coefficient150_231,
  OriginalRow227TriangleData1736.coefficient150_232,
  OriginalRow227TriangleData1736.coefficient150_233,
  OriginalRow227TriangleData1736.coefficient150_234,
  OriginalRow227TriangleData1736.coefficient150_235,
  OriginalRow227TriangleData1736.coefficient150_236,
  OriginalRow227TriangleData1736.coefficient150_237,
  OriginalRow227TriangleData1736.coefficient150_238,
  OriginalRow227TriangleData1736.coefficient150_239,
  OriginalRow227TriangleData1736.coefficient150_240,
  OriginalRow227TriangleData1736.coefficient150_241,
  OriginalRow227TriangleData1736.coefficient150_242,
  OriginalRow227TriangleData1736.coefficient150_243,
  OriginalRow227TriangleData1736.coefficient150_244
]

theorem values1736_size : values1736.size = 32 := rfl

def block1736 : ℕ → Option IntervalDyadic := segment 213 values1736

theorem block1736_domain : ExactDomain block1736 213 245 := by
  simpa only [values1736_size] using segment_domain 213 values1736

theorem block1736_get (i : Fin 32) :
    block1736 (213 + i.val) = some (values1736[i.val]'(by rw [values1736_size]; exact i.isLt)) := by
  exact segment_get 213 values1736 ⟨i.val, by rw [values1736_size]; exact i.isLt⟩

def values1737 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1737.coefficient150_245,
  OriginalRow227TriangleData1737.coefficient150_246,
  OriginalRow227TriangleData1737.coefficient150_247,
  OriginalRow227TriangleData1737.coefficient150_248,
  OriginalRow227TriangleData1737.coefficient150_249,
  OriginalRow227TriangleData1737.coefficient150_250,
  OriginalRow227TriangleData1737.coefficient150_251,
  OriginalRow227TriangleData1737.coefficient150_252,
  OriginalRow227TriangleData1737.coefficient150_253,
  OriginalRow227TriangleData1737.coefficient150_254,
  OriginalRow227TriangleData1737.coefficient150_255,
  OriginalRow227TriangleData1737.coefficient150_256,
  OriginalRow227TriangleData1737.coefficient150_257,
  OriginalRow227TriangleData1737.coefficient150_258,
  OriginalRow227TriangleData1737.coefficient150_259,
  OriginalRow227TriangleData1737.coefficient150_260,
  OriginalRow227TriangleData1737.coefficient150_261,
  OriginalRow227TriangleData1737.coefficient150_262,
  OriginalRow227TriangleData1737.coefficient150_263,
  OriginalRow227TriangleData1737.coefficient150_264,
  OriginalRow227TriangleData1737.coefficient150_265,
  OriginalRow227TriangleData1737.coefficient150_266,
  OriginalRow227TriangleData1737.coefficient150_267,
  OriginalRow227TriangleData1737.coefficient150_268,
  OriginalRow227TriangleData1737.coefficient150_269,
  OriginalRow227TriangleData1737.coefficient150_270,
  OriginalRow227TriangleData1737.coefficient150_271,
  OriginalRow227TriangleData1737.coefficient150_272,
  OriginalRow227TriangleData1737.coefficient150_273,
  OriginalRow227TriangleData1737.coefficient150_274,
  OriginalRow227TriangleData1737.coefficient150_275,
  OriginalRow227TriangleData1737.coefficient150_276
]

theorem values1737_size : values1737.size = 32 := rfl

def block1737 : ℕ → Option IntervalDyadic := segment 245 values1737

theorem block1737_domain : ExactDomain block1737 245 277 := by
  simpa only [values1737_size] using segment_domain 245 values1737

theorem block1737_get (i : Fin 32) :
    block1737 (245 + i.val) = some (values1737[i.val]'(by rw [values1737_size]; exact i.isLt)) := by
  exact segment_get 245 values1737 ⟨i.val, by rw [values1737_size]; exact i.isLt⟩

def values1738 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1738.coefficient150_277,
  OriginalRow227TriangleData1738.coefficient150_278,
  OriginalRow227TriangleData1738.coefficient150_279,
  OriginalRow227TriangleData1738.coefficient150_280,
  OriginalRow227TriangleData1738.coefficient150_281,
  OriginalRow227TriangleData1738.coefficient150_282,
  OriginalRow227TriangleData1738.coefficient150_283,
  OriginalRow227TriangleData1738.coefficient150_284,
  OriginalRow227TriangleData1738.coefficient150_285,
  OriginalRow227TriangleData1738.coefficient150_286,
  OriginalRow227TriangleData1738.coefficient150_287,
  OriginalRow227TriangleData1738.coefficient150_288,
  OriginalRow227TriangleData1738.coefficient150_289,
  OriginalRow227TriangleData1738.coefficient150_290,
  OriginalRow227TriangleData1738.coefficient150_291,
  OriginalRow227TriangleData1738.coefficient150_292,
  OriginalRow227TriangleData1738.coefficient150_293,
  OriginalRow227TriangleData1738.coefficient150_294,
  OriginalRow227TriangleData1738.coefficient150_295,
  OriginalRow227TriangleData1738.coefficient150_296,
  OriginalRow227TriangleData1738.coefficient150_297,
  OriginalRow227TriangleData1738.coefficient150_298,
  OriginalRow227TriangleData1738.coefficient150_299,
  OriginalRow227TriangleData1738.coefficient150_300,
  OriginalRow227TriangleData1738.coefficient150_301,
  OriginalRow227TriangleData1738.coefficient150_302,
  OriginalRow227TriangleData1738.coefficient150_303,
  OriginalRow227TriangleData1738.coefficient150_304,
  OriginalRow227TriangleData1738.coefficient150_305,
  OriginalRow227TriangleData1738.coefficient150_306,
  OriginalRow227TriangleData1738.coefficient150_307,
  OriginalRow227TriangleData1738.coefficient150_308
]

theorem values1738_size : values1738.size = 32 := rfl

def block1738 : ℕ → Option IntervalDyadic := segment 277 values1738

theorem block1738_domain : ExactDomain block1738 277 309 := by
  simpa only [values1738_size] using segment_domain 277 values1738

theorem block1738_get (i : Fin 32) :
    block1738 (277 + i.val) = some (values1738[i.val]'(by rw [values1738_size]; exact i.isLt)) := by
  exact segment_get 277 values1738 ⟨i.val, by rw [values1738_size]; exact i.isLt⟩

def values1739 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1739.coefficient150_309,
  OriginalRow227TriangleData1739.coefficient150_310,
  OriginalRow227TriangleData1739.coefficient150_311,
  OriginalRow227TriangleData1739.coefficient150_312,
  OriginalRow227TriangleData1739.coefficient150_313,
  OriginalRow227TriangleData1739.coefficient150_314,
  OriginalRow227TriangleData1739.coefficient150_315,
  OriginalRow227TriangleData1739.coefficient150_316,
  OriginalRow227TriangleData1739.coefficient150_317,
  OriginalRow227TriangleData1739.coefficient150_318,
  OriginalRow227TriangleData1739.coefficient150_319,
  OriginalRow227TriangleData1739.coefficient150_320,
  OriginalRow227TriangleData1739.coefficient150_321,
  OriginalRow227TriangleData1739.coefficient150_322,
  OriginalRow227TriangleData1739.coefficient150_323,
  OriginalRow227TriangleData1739.coefficient150_324,
  OriginalRow227TriangleData1739.coefficient150_325,
  OriginalRow227TriangleData1739.coefficient150_326,
  OriginalRow227TriangleData1739.coefficient150_327,
  OriginalRow227TriangleData1739.coefficient150_328,
  OriginalRow227TriangleData1739.coefficient150_329,
  OriginalRow227TriangleData1739.coefficient150_330,
  OriginalRow227TriangleData1739.coefficient150_331,
  OriginalRow227TriangleData1739.coefficient150_332,
  OriginalRow227TriangleData1739.coefficient150_333,
  OriginalRow227TriangleData1739.coefficient150_334,
  OriginalRow227TriangleData1739.coefficient150_335,
  OriginalRow227TriangleData1739.coefficient150_336,
  OriginalRow227TriangleData1739.coefficient150_337,
  OriginalRow227TriangleData1739.coefficient150_338,
  OriginalRow227TriangleData1739.coefficient150_339,
  OriginalRow227TriangleData1739.coefficient150_340
]

theorem values1739_size : values1739.size = 32 := rfl

def block1739 : ℕ → Option IntervalDyadic := segment 309 values1739

theorem block1739_domain : ExactDomain block1739 309 341 := by
  simpa only [values1739_size] using segment_domain 309 values1739

theorem block1739_get (i : Fin 32) :
    block1739 (309 + i.val) = some (values1739[i.val]'(by rw [values1739_size]; exact i.isLt)) := by
  exact segment_get 309 values1739 ⟨i.val, by rw [values1739_size]; exact i.isLt⟩

def values1740 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1740.coefficient150_341,
  OriginalRow227TriangleData1740.coefficient150_342,
  OriginalRow227TriangleData1740.coefficient150_343,
  OriginalRow227TriangleData1740.coefficient150_344,
  OriginalRow227TriangleData1740.coefficient150_345,
  OriginalRow227TriangleData1740.coefficient150_346,
  OriginalRow227TriangleData1740.coefficient150_347,
  OriginalRow227TriangleData1740.coefficient150_348,
  OriginalRow227TriangleData1740.coefficient150_349,
  OriginalRow227TriangleData1740.coefficient150_350,
  OriginalRow227TriangleData1740.coefficient150_351
]

theorem values1740_size : values1740.size = 11 := rfl

def block1740 : ℕ → Option IntervalDyadic := segment 341 values1740

theorem block1740_domain : ExactDomain block1740 341 352 := by
  simpa only [values1740_size] using segment_domain 341 values1740

theorem block1740_get (i : Fin 11) :
    block1740 (341 + i.val) = some (values1740[i.val]'(by rw [values1740_size]; exact i.isLt)) := by
  exact segment_get 341 values1740 ⟨i.val, by rw [values1740_size]; exact i.isLt⟩

def node0181_0245 : ℕ → Option IntervalDyadic := split 213 block1735 block1736

theorem node0181_0245_domain : ExactDomain node0181_0245 181 245 := by
  exact split_domain (by decide) (by decide) block1735_domain block1736_domain

def node0149_0245 : ℕ → Option IntervalDyadic := split 181 block1734 node0181_0245

theorem node0149_0245_domain : ExactDomain node0149_0245 149 245 := by
  exact split_domain (by decide) (by decide) block1734_domain node0181_0245_domain

def node0245_0309 : ℕ → Option IntervalDyadic := split 277 block1737 block1738

theorem node0245_0309_domain : ExactDomain node0245_0309 245 309 := by
  exact split_domain (by decide) (by decide) block1737_domain block1738_domain

def node0309_0352 : ℕ → Option IntervalDyadic := split 341 block1739 block1740

theorem node0309_0352_domain : ExactDomain node0309_0352 309 352 := by
  exact split_domain (by decide) (by decide) block1739_domain block1740_domain

def node0245_0352 : ℕ → Option IntervalDyadic := split 309 node0245_0309 node0309_0352

theorem node0245_0352_domain : ExactDomain node0245_0352 245 352 := by
  exact split_domain (by decide) (by decide) node0245_0309_domain node0309_0352_domain

def node0149_0352 : ℕ → Option IntervalDyadic := split 245 node0149_0245 node0245_0352

theorem node0149_0352_domain : ExactDomain node0149_0352 149 352 := by
  exact split_domain (by decide) (by decide) node0149_0245_domain node0245_0352_domain

def lookup : ℕ → Option IntervalDyadic := node0149_0352

theorem lookup_domain : ExactDomain lookup 149 352 :=
  node0149_0352_domain

theorem block1734_lookup (i : Fin 32) :
    lookup (149 + i.val) = some (values1734[i.val]'(by rw [values1734_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (149 + i.val) = _
  rw [node0149_0352, split_left 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0149_0245, split_left 181 block1734 node0181_0245 (by omega)]
  exact block1734_get i

theorem block1735_lookup (i : Fin 32) :
    lookup (181 + i.val) = some (values1735[i.val]'(by rw [values1735_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (181 + i.val) = _
  rw [node0149_0352, split_left 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0149_0245, split_right 181 block1734 node0181_0245 (by omega)]
  rw [node0181_0245, split_left 213 block1735 block1736 (by omega)]
  exact block1735_get i

theorem block1736_lookup (i : Fin 32) :
    lookup (213 + i.val) = some (values1736[i.val]'(by rw [values1736_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (213 + i.val) = _
  rw [node0149_0352, split_left 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0149_0245, split_right 181 block1734 node0181_0245 (by omega)]
  rw [node0181_0245, split_right 213 block1735 block1736 (by omega)]
  exact block1736_get i

theorem block1737_lookup (i : Fin 32) :
    lookup (245 + i.val) = some (values1737[i.val]'(by rw [values1737_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (245 + i.val) = _
  rw [node0149_0352, split_right 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0245_0352, split_left 309 node0245_0309 node0309_0352 (by omega)]
  rw [node0245_0309, split_left 277 block1737 block1738 (by omega)]
  exact block1737_get i

theorem block1738_lookup (i : Fin 32) :
    lookup (277 + i.val) = some (values1738[i.val]'(by rw [values1738_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (277 + i.val) = _
  rw [node0149_0352, split_right 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0245_0352, split_left 309 node0245_0309 node0309_0352 (by omega)]
  rw [node0245_0309, split_right 277 block1737 block1738 (by omega)]
  exact block1738_get i

theorem block1739_lookup (i : Fin 32) :
    lookup (309 + i.val) = some (values1739[i.val]'(by rw [values1739_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (309 + i.val) = _
  rw [node0149_0352, split_right 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0245_0352, split_right 309 node0245_0309 node0309_0352 (by omega)]
  rw [node0309_0352, split_left 341 block1739 block1740 (by omega)]
  exact block1739_get i

theorem block1740_lookup (i : Fin 11) :
    lookup (341 + i.val) = some (values1740[i.val]'(by rw [values1740_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0149_0352 (341 + i.val) = _
  rw [node0149_0352, split_right 245 node0149_0245 node0245_0352 (by omega)]
  rw [node0245_0352, split_right 309 node0245_0309 node0309_0352 (by omega)]
  rw [node0309_0352, split_right 341 block1739 block1740 (by omega)]
  exact block1740_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1734_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1734_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1735_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1735_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1736_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1736_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1737_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1737_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1738_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1738_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1739_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1739_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1740_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1740_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1734_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1735_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1736_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1737_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1738_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1739_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow150.block1740_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow150
