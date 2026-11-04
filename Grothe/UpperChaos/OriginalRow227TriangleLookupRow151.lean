import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1741
import Grothe.UpperChaos.OriginalRow227TriangleData1742
import Grothe.UpperChaos.OriginalRow227TriangleData1743
import Grothe.UpperChaos.OriginalRow227TriangleData1744
import Grothe.UpperChaos.OriginalRow227TriangleData1745
import Grothe.UpperChaos.OriginalRow227TriangleData1746
import Grothe.UpperChaos.OriginalRow227TriangleData1747

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow151

open ConditionalTableLookup

def values1741 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1741.coefficient151_150,
  OriginalRow227TriangleData1741.coefficient151_151,
  OriginalRow227TriangleData1741.coefficient151_152,
  OriginalRow227TriangleData1741.coefficient151_153,
  OriginalRow227TriangleData1741.coefficient151_154,
  OriginalRow227TriangleData1741.coefficient151_155,
  OriginalRow227TriangleData1741.coefficient151_156,
  OriginalRow227TriangleData1741.coefficient151_157,
  OriginalRow227TriangleData1741.coefficient151_158,
  OriginalRow227TriangleData1741.coefficient151_159,
  OriginalRow227TriangleData1741.coefficient151_160,
  OriginalRow227TriangleData1741.coefficient151_161,
  OriginalRow227TriangleData1741.coefficient151_162,
  OriginalRow227TriangleData1741.coefficient151_163,
  OriginalRow227TriangleData1741.coefficient151_164,
  OriginalRow227TriangleData1741.coefficient151_165,
  OriginalRow227TriangleData1741.coefficient151_166,
  OriginalRow227TriangleData1741.coefficient151_167,
  OriginalRow227TriangleData1741.coefficient151_168,
  OriginalRow227TriangleData1741.coefficient151_169,
  OriginalRow227TriangleData1741.coefficient151_170,
  OriginalRow227TriangleData1741.coefficient151_171,
  OriginalRow227TriangleData1741.coefficient151_172,
  OriginalRow227TriangleData1741.coefficient151_173,
  OriginalRow227TriangleData1741.coefficient151_174,
  OriginalRow227TriangleData1741.coefficient151_175,
  OriginalRow227TriangleData1741.coefficient151_176,
  OriginalRow227TriangleData1741.coefficient151_177,
  OriginalRow227TriangleData1741.coefficient151_178,
  OriginalRow227TriangleData1741.coefficient151_179,
  OriginalRow227TriangleData1741.coefficient151_180,
  OriginalRow227TriangleData1741.coefficient151_181
]

theorem values1741_size : values1741.size = 32 := rfl

def block1741 : ℕ → Option IntervalDyadic := segment 150 values1741

theorem block1741_domain : ExactDomain block1741 150 182 := by
  simpa only [values1741_size] using segment_domain 150 values1741

theorem block1741_get (i : Fin 32) :
    block1741 (150 + i.val) = some (values1741[i.val]'(by rw [values1741_size]; exact i.isLt)) := by
  exact segment_get 150 values1741 ⟨i.val, by rw [values1741_size]; exact i.isLt⟩

def values1742 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1742.coefficient151_182,
  OriginalRow227TriangleData1742.coefficient151_183,
  OriginalRow227TriangleData1742.coefficient151_184,
  OriginalRow227TriangleData1742.coefficient151_185,
  OriginalRow227TriangleData1742.coefficient151_186,
  OriginalRow227TriangleData1742.coefficient151_187,
  OriginalRow227TriangleData1742.coefficient151_188,
  OriginalRow227TriangleData1742.coefficient151_189,
  OriginalRow227TriangleData1742.coefficient151_190,
  OriginalRow227TriangleData1742.coefficient151_191,
  OriginalRow227TriangleData1742.coefficient151_192,
  OriginalRow227TriangleData1742.coefficient151_193,
  OriginalRow227TriangleData1742.coefficient151_194,
  OriginalRow227TriangleData1742.coefficient151_195,
  OriginalRow227TriangleData1742.coefficient151_196,
  OriginalRow227TriangleData1742.coefficient151_197,
  OriginalRow227TriangleData1742.coefficient151_198,
  OriginalRow227TriangleData1742.coefficient151_199,
  OriginalRow227TriangleData1742.coefficient151_200,
  OriginalRow227TriangleData1742.coefficient151_201,
  OriginalRow227TriangleData1742.coefficient151_202,
  OriginalRow227TriangleData1742.coefficient151_203,
  OriginalRow227TriangleData1742.coefficient151_204,
  OriginalRow227TriangleData1742.coefficient151_205,
  OriginalRow227TriangleData1742.coefficient151_206,
  OriginalRow227TriangleData1742.coefficient151_207,
  OriginalRow227TriangleData1742.coefficient151_208,
  OriginalRow227TriangleData1742.coefficient151_209,
  OriginalRow227TriangleData1742.coefficient151_210,
  OriginalRow227TriangleData1742.coefficient151_211,
  OriginalRow227TriangleData1742.coefficient151_212,
  OriginalRow227TriangleData1742.coefficient151_213
]

theorem values1742_size : values1742.size = 32 := rfl

def block1742 : ℕ → Option IntervalDyadic := segment 182 values1742

theorem block1742_domain : ExactDomain block1742 182 214 := by
  simpa only [values1742_size] using segment_domain 182 values1742

theorem block1742_get (i : Fin 32) :
    block1742 (182 + i.val) = some (values1742[i.val]'(by rw [values1742_size]; exact i.isLt)) := by
  exact segment_get 182 values1742 ⟨i.val, by rw [values1742_size]; exact i.isLt⟩

def values1743 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1743.coefficient151_214,
  OriginalRow227TriangleData1743.coefficient151_215,
  OriginalRow227TriangleData1743.coefficient151_216,
  OriginalRow227TriangleData1743.coefficient151_217,
  OriginalRow227TriangleData1743.coefficient151_218,
  OriginalRow227TriangleData1743.coefficient151_219,
  OriginalRow227TriangleData1743.coefficient151_220,
  OriginalRow227TriangleData1743.coefficient151_221,
  OriginalRow227TriangleData1743.coefficient151_222,
  OriginalRow227TriangleData1743.coefficient151_223,
  OriginalRow227TriangleData1743.coefficient151_224,
  OriginalRow227TriangleData1743.coefficient151_225,
  OriginalRow227TriangleData1743.coefficient151_226,
  OriginalRow227TriangleData1743.coefficient151_227,
  OriginalRow227TriangleData1743.coefficient151_228,
  OriginalRow227TriangleData1743.coefficient151_229,
  OriginalRow227TriangleData1743.coefficient151_230,
  OriginalRow227TriangleData1743.coefficient151_231,
  OriginalRow227TriangleData1743.coefficient151_232,
  OriginalRow227TriangleData1743.coefficient151_233,
  OriginalRow227TriangleData1743.coefficient151_234,
  OriginalRow227TriangleData1743.coefficient151_235,
  OriginalRow227TriangleData1743.coefficient151_236,
  OriginalRow227TriangleData1743.coefficient151_237,
  OriginalRow227TriangleData1743.coefficient151_238,
  OriginalRow227TriangleData1743.coefficient151_239,
  OriginalRow227TriangleData1743.coefficient151_240,
  OriginalRow227TriangleData1743.coefficient151_241,
  OriginalRow227TriangleData1743.coefficient151_242,
  OriginalRow227TriangleData1743.coefficient151_243,
  OriginalRow227TriangleData1743.coefficient151_244,
  OriginalRow227TriangleData1743.coefficient151_245
]

theorem values1743_size : values1743.size = 32 := rfl

def block1743 : ℕ → Option IntervalDyadic := segment 214 values1743

theorem block1743_domain : ExactDomain block1743 214 246 := by
  simpa only [values1743_size] using segment_domain 214 values1743

theorem block1743_get (i : Fin 32) :
    block1743 (214 + i.val) = some (values1743[i.val]'(by rw [values1743_size]; exact i.isLt)) := by
  exact segment_get 214 values1743 ⟨i.val, by rw [values1743_size]; exact i.isLt⟩

def values1744 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1744.coefficient151_246,
  OriginalRow227TriangleData1744.coefficient151_247,
  OriginalRow227TriangleData1744.coefficient151_248,
  OriginalRow227TriangleData1744.coefficient151_249,
  OriginalRow227TriangleData1744.coefficient151_250,
  OriginalRow227TriangleData1744.coefficient151_251,
  OriginalRow227TriangleData1744.coefficient151_252,
  OriginalRow227TriangleData1744.coefficient151_253,
  OriginalRow227TriangleData1744.coefficient151_254,
  OriginalRow227TriangleData1744.coefficient151_255,
  OriginalRow227TriangleData1744.coefficient151_256,
  OriginalRow227TriangleData1744.coefficient151_257,
  OriginalRow227TriangleData1744.coefficient151_258,
  OriginalRow227TriangleData1744.coefficient151_259,
  OriginalRow227TriangleData1744.coefficient151_260,
  OriginalRow227TriangleData1744.coefficient151_261,
  OriginalRow227TriangleData1744.coefficient151_262,
  OriginalRow227TriangleData1744.coefficient151_263,
  OriginalRow227TriangleData1744.coefficient151_264,
  OriginalRow227TriangleData1744.coefficient151_265,
  OriginalRow227TriangleData1744.coefficient151_266,
  OriginalRow227TriangleData1744.coefficient151_267,
  OriginalRow227TriangleData1744.coefficient151_268,
  OriginalRow227TriangleData1744.coefficient151_269,
  OriginalRow227TriangleData1744.coefficient151_270,
  OriginalRow227TriangleData1744.coefficient151_271,
  OriginalRow227TriangleData1744.coefficient151_272,
  OriginalRow227TriangleData1744.coefficient151_273,
  OriginalRow227TriangleData1744.coefficient151_274,
  OriginalRow227TriangleData1744.coefficient151_275,
  OriginalRow227TriangleData1744.coefficient151_276,
  OriginalRow227TriangleData1744.coefficient151_277
]

theorem values1744_size : values1744.size = 32 := rfl

def block1744 : ℕ → Option IntervalDyadic := segment 246 values1744

theorem block1744_domain : ExactDomain block1744 246 278 := by
  simpa only [values1744_size] using segment_domain 246 values1744

theorem block1744_get (i : Fin 32) :
    block1744 (246 + i.val) = some (values1744[i.val]'(by rw [values1744_size]; exact i.isLt)) := by
  exact segment_get 246 values1744 ⟨i.val, by rw [values1744_size]; exact i.isLt⟩

def values1745 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1745.coefficient151_278,
  OriginalRow227TriangleData1745.coefficient151_279,
  OriginalRow227TriangleData1745.coefficient151_280,
  OriginalRow227TriangleData1745.coefficient151_281,
  OriginalRow227TriangleData1745.coefficient151_282,
  OriginalRow227TriangleData1745.coefficient151_283,
  OriginalRow227TriangleData1745.coefficient151_284,
  OriginalRow227TriangleData1745.coefficient151_285,
  OriginalRow227TriangleData1745.coefficient151_286,
  OriginalRow227TriangleData1745.coefficient151_287,
  OriginalRow227TriangleData1745.coefficient151_288,
  OriginalRow227TriangleData1745.coefficient151_289,
  OriginalRow227TriangleData1745.coefficient151_290,
  OriginalRow227TriangleData1745.coefficient151_291,
  OriginalRow227TriangleData1745.coefficient151_292,
  OriginalRow227TriangleData1745.coefficient151_293,
  OriginalRow227TriangleData1745.coefficient151_294,
  OriginalRow227TriangleData1745.coefficient151_295,
  OriginalRow227TriangleData1745.coefficient151_296,
  OriginalRow227TriangleData1745.coefficient151_297,
  OriginalRow227TriangleData1745.coefficient151_298,
  OriginalRow227TriangleData1745.coefficient151_299,
  OriginalRow227TriangleData1745.coefficient151_300,
  OriginalRow227TriangleData1745.coefficient151_301,
  OriginalRow227TriangleData1745.coefficient151_302,
  OriginalRow227TriangleData1745.coefficient151_303,
  OriginalRow227TriangleData1745.coefficient151_304,
  OriginalRow227TriangleData1745.coefficient151_305,
  OriginalRow227TriangleData1745.coefficient151_306,
  OriginalRow227TriangleData1745.coefficient151_307,
  OriginalRow227TriangleData1745.coefficient151_308,
  OriginalRow227TriangleData1745.coefficient151_309
]

theorem values1745_size : values1745.size = 32 := rfl

def block1745 : ℕ → Option IntervalDyadic := segment 278 values1745

theorem block1745_domain : ExactDomain block1745 278 310 := by
  simpa only [values1745_size] using segment_domain 278 values1745

theorem block1745_get (i : Fin 32) :
    block1745 (278 + i.val) = some (values1745[i.val]'(by rw [values1745_size]; exact i.isLt)) := by
  exact segment_get 278 values1745 ⟨i.val, by rw [values1745_size]; exact i.isLt⟩

def values1746 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1746.coefficient151_310,
  OriginalRow227TriangleData1746.coefficient151_311,
  OriginalRow227TriangleData1746.coefficient151_312,
  OriginalRow227TriangleData1746.coefficient151_313,
  OriginalRow227TriangleData1746.coefficient151_314,
  OriginalRow227TriangleData1746.coefficient151_315,
  OriginalRow227TriangleData1746.coefficient151_316,
  OriginalRow227TriangleData1746.coefficient151_317,
  OriginalRow227TriangleData1746.coefficient151_318,
  OriginalRow227TriangleData1746.coefficient151_319,
  OriginalRow227TriangleData1746.coefficient151_320,
  OriginalRow227TriangleData1746.coefficient151_321,
  OriginalRow227TriangleData1746.coefficient151_322,
  OriginalRow227TriangleData1746.coefficient151_323,
  OriginalRow227TriangleData1746.coefficient151_324,
  OriginalRow227TriangleData1746.coefficient151_325,
  OriginalRow227TriangleData1746.coefficient151_326,
  OriginalRow227TriangleData1746.coefficient151_327,
  OriginalRow227TriangleData1746.coefficient151_328,
  OriginalRow227TriangleData1746.coefficient151_329,
  OriginalRow227TriangleData1746.coefficient151_330,
  OriginalRow227TriangleData1746.coefficient151_331,
  OriginalRow227TriangleData1746.coefficient151_332,
  OriginalRow227TriangleData1746.coefficient151_333,
  OriginalRow227TriangleData1746.coefficient151_334,
  OriginalRow227TriangleData1746.coefficient151_335,
  OriginalRow227TriangleData1746.coefficient151_336,
  OriginalRow227TriangleData1746.coefficient151_337,
  OriginalRow227TriangleData1746.coefficient151_338,
  OriginalRow227TriangleData1746.coefficient151_339,
  OriginalRow227TriangleData1746.coefficient151_340,
  OriginalRow227TriangleData1746.coefficient151_341
]

theorem values1746_size : values1746.size = 32 := rfl

def block1746 : ℕ → Option IntervalDyadic := segment 310 values1746

theorem block1746_domain : ExactDomain block1746 310 342 := by
  simpa only [values1746_size] using segment_domain 310 values1746

theorem block1746_get (i : Fin 32) :
    block1746 (310 + i.val) = some (values1746[i.val]'(by rw [values1746_size]; exact i.isLt)) := by
  exact segment_get 310 values1746 ⟨i.val, by rw [values1746_size]; exact i.isLt⟩

def values1747 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1747.coefficient151_342,
  OriginalRow227TriangleData1747.coefficient151_343,
  OriginalRow227TriangleData1747.coefficient151_344,
  OriginalRow227TriangleData1747.coefficient151_345,
  OriginalRow227TriangleData1747.coefficient151_346,
  OriginalRow227TriangleData1747.coefficient151_347,
  OriginalRow227TriangleData1747.coefficient151_348,
  OriginalRow227TriangleData1747.coefficient151_349,
  OriginalRow227TriangleData1747.coefficient151_350
]

theorem values1747_size : values1747.size = 9 := rfl

def block1747 : ℕ → Option IntervalDyadic := segment 342 values1747

theorem block1747_domain : ExactDomain block1747 342 351 := by
  simpa only [values1747_size] using segment_domain 342 values1747

theorem block1747_get (i : Fin 9) :
    block1747 (342 + i.val) = some (values1747[i.val]'(by rw [values1747_size]; exact i.isLt)) := by
  exact segment_get 342 values1747 ⟨i.val, by rw [values1747_size]; exact i.isLt⟩

def node0182_0246 : ℕ → Option IntervalDyadic := split 214 block1742 block1743

theorem node0182_0246_domain : ExactDomain node0182_0246 182 246 := by
  exact split_domain (by decide) (by decide) block1742_domain block1743_domain

def node0150_0246 : ℕ → Option IntervalDyadic := split 182 block1741 node0182_0246

theorem node0150_0246_domain : ExactDomain node0150_0246 150 246 := by
  exact split_domain (by decide) (by decide) block1741_domain node0182_0246_domain

def node0246_0310 : ℕ → Option IntervalDyadic := split 278 block1744 block1745

theorem node0246_0310_domain : ExactDomain node0246_0310 246 310 := by
  exact split_domain (by decide) (by decide) block1744_domain block1745_domain

def node0310_0351 : ℕ → Option IntervalDyadic := split 342 block1746 block1747

theorem node0310_0351_domain : ExactDomain node0310_0351 310 351 := by
  exact split_domain (by decide) (by decide) block1746_domain block1747_domain

def node0246_0351 : ℕ → Option IntervalDyadic := split 310 node0246_0310 node0310_0351

theorem node0246_0351_domain : ExactDomain node0246_0351 246 351 := by
  exact split_domain (by decide) (by decide) node0246_0310_domain node0310_0351_domain

def node0150_0351 : ℕ → Option IntervalDyadic := split 246 node0150_0246 node0246_0351

theorem node0150_0351_domain : ExactDomain node0150_0351 150 351 := by
  exact split_domain (by decide) (by decide) node0150_0246_domain node0246_0351_domain

def lookup : ℕ → Option IntervalDyadic := node0150_0351

theorem lookup_domain : ExactDomain lookup 150 351 :=
  node0150_0351_domain

theorem block1741_lookup (i : Fin 32) :
    lookup (150 + i.val) = some (values1741[i.val]'(by rw [values1741_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (150 + i.val) = _
  rw [node0150_0351, split_left 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0150_0246, split_left 182 block1741 node0182_0246 (by omega)]
  exact block1741_get i

theorem block1742_lookup (i : Fin 32) :
    lookup (182 + i.val) = some (values1742[i.val]'(by rw [values1742_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (182 + i.val) = _
  rw [node0150_0351, split_left 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0150_0246, split_right 182 block1741 node0182_0246 (by omega)]
  rw [node0182_0246, split_left 214 block1742 block1743 (by omega)]
  exact block1742_get i

theorem block1743_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values1743[i.val]'(by rw [values1743_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (214 + i.val) = _
  rw [node0150_0351, split_left 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0150_0246, split_right 182 block1741 node0182_0246 (by omega)]
  rw [node0182_0246, split_right 214 block1742 block1743 (by omega)]
  exact block1743_get i

theorem block1744_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values1744[i.val]'(by rw [values1744_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (246 + i.val) = _
  rw [node0150_0351, split_right 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0246_0351, split_left 310 node0246_0310 node0310_0351 (by omega)]
  rw [node0246_0310, split_left 278 block1744 block1745 (by omega)]
  exact block1744_get i

theorem block1745_lookup (i : Fin 32) :
    lookup (278 + i.val) = some (values1745[i.val]'(by rw [values1745_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (278 + i.val) = _
  rw [node0150_0351, split_right 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0246_0351, split_left 310 node0246_0310 node0310_0351 (by omega)]
  rw [node0246_0310, split_right 278 block1744 block1745 (by omega)]
  exact block1745_get i

theorem block1746_lookup (i : Fin 32) :
    lookup (310 + i.val) = some (values1746[i.val]'(by rw [values1746_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (310 + i.val) = _
  rw [node0150_0351, split_right 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0246_0351, split_right 310 node0246_0310 node0310_0351 (by omega)]
  rw [node0310_0351, split_left 342 block1746 block1747 (by omega)]
  exact block1746_get i

theorem block1747_lookup (i : Fin 9) :
    lookup (342 + i.val) = some (values1747[i.val]'(by rw [values1747_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0150_0351 (342 + i.val) = _
  rw [node0150_0351, split_right 246 node0150_0246 node0246_0351 (by omega)]
  rw [node0246_0351, split_right 310 node0246_0310 node0310_0351 (by omega)]
  rw [node0310_0351, split_right 342 block1746 block1747 (by omega)]
  exact block1747_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1741_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1741_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1742_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1742_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1743_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1743_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1744_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1744_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1745_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1745_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1746_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1746_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1747_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1747_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1741_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1742_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1743_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1744_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1745_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1746_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow151.block1747_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow151
