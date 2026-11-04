import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1854
import Grothe.UpperChaos.OriginalRow227TriangleData1855
import Grothe.UpperChaos.OriginalRow227TriangleData1856
import Grothe.UpperChaos.OriginalRow227TriangleData1857
import Grothe.UpperChaos.OriginalRow227TriangleData1858
import Grothe.UpperChaos.OriginalRow227TriangleData1859

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow169

open ConditionalTableLookup

def values1854 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1854.coefficient169_168,
  OriginalRow227TriangleData1854.coefficient169_169,
  OriginalRow227TriangleData1854.coefficient169_170,
  OriginalRow227TriangleData1854.coefficient169_171,
  OriginalRow227TriangleData1854.coefficient169_172,
  OriginalRow227TriangleData1854.coefficient169_173,
  OriginalRow227TriangleData1854.coefficient169_174,
  OriginalRow227TriangleData1854.coefficient169_175,
  OriginalRow227TriangleData1854.coefficient169_176,
  OriginalRow227TriangleData1854.coefficient169_177,
  OriginalRow227TriangleData1854.coefficient169_178,
  OriginalRow227TriangleData1854.coefficient169_179,
  OriginalRow227TriangleData1854.coefficient169_180,
  OriginalRow227TriangleData1854.coefficient169_181,
  OriginalRow227TriangleData1854.coefficient169_182,
  OriginalRow227TriangleData1854.coefficient169_183,
  OriginalRow227TriangleData1854.coefficient169_184,
  OriginalRow227TriangleData1854.coefficient169_185,
  OriginalRow227TriangleData1854.coefficient169_186,
  OriginalRow227TriangleData1854.coefficient169_187,
  OriginalRow227TriangleData1854.coefficient169_188,
  OriginalRow227TriangleData1854.coefficient169_189,
  OriginalRow227TriangleData1854.coefficient169_190,
  OriginalRow227TriangleData1854.coefficient169_191,
  OriginalRow227TriangleData1854.coefficient169_192,
  OriginalRow227TriangleData1854.coefficient169_193,
  OriginalRow227TriangleData1854.coefficient169_194,
  OriginalRow227TriangleData1854.coefficient169_195,
  OriginalRow227TriangleData1854.coefficient169_196,
  OriginalRow227TriangleData1854.coefficient169_197,
  OriginalRow227TriangleData1854.coefficient169_198,
  OriginalRow227TriangleData1854.coefficient169_199
]

theorem values1854_size : values1854.size = 32 := rfl

def block1854 : ℕ → Option IntervalDyadic := segment 168 values1854

theorem block1854_domain : ExactDomain block1854 168 200 := by
  simpa only [values1854_size] using segment_domain 168 values1854

theorem block1854_get (i : Fin 32) :
    block1854 (168 + i.val) = some (values1854[i.val]'(by rw [values1854_size]; exact i.isLt)) := by
  exact segment_get 168 values1854 ⟨i.val, by rw [values1854_size]; exact i.isLt⟩

def values1855 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1855.coefficient169_200,
  OriginalRow227TriangleData1855.coefficient169_201,
  OriginalRow227TriangleData1855.coefficient169_202,
  OriginalRow227TriangleData1855.coefficient169_203,
  OriginalRow227TriangleData1855.coefficient169_204,
  OriginalRow227TriangleData1855.coefficient169_205,
  OriginalRow227TriangleData1855.coefficient169_206,
  OriginalRow227TriangleData1855.coefficient169_207,
  OriginalRow227TriangleData1855.coefficient169_208,
  OriginalRow227TriangleData1855.coefficient169_209,
  OriginalRow227TriangleData1855.coefficient169_210,
  OriginalRow227TriangleData1855.coefficient169_211,
  OriginalRow227TriangleData1855.coefficient169_212,
  OriginalRow227TriangleData1855.coefficient169_213,
  OriginalRow227TriangleData1855.coefficient169_214,
  OriginalRow227TriangleData1855.coefficient169_215,
  OriginalRow227TriangleData1855.coefficient169_216,
  OriginalRow227TriangleData1855.coefficient169_217,
  OriginalRow227TriangleData1855.coefficient169_218,
  OriginalRow227TriangleData1855.coefficient169_219,
  OriginalRow227TriangleData1855.coefficient169_220,
  OriginalRow227TriangleData1855.coefficient169_221,
  OriginalRow227TriangleData1855.coefficient169_222,
  OriginalRow227TriangleData1855.coefficient169_223,
  OriginalRow227TriangleData1855.coefficient169_224,
  OriginalRow227TriangleData1855.coefficient169_225,
  OriginalRow227TriangleData1855.coefficient169_226,
  OriginalRow227TriangleData1855.coefficient169_227,
  OriginalRow227TriangleData1855.coefficient169_228,
  OriginalRow227TriangleData1855.coefficient169_229,
  OriginalRow227TriangleData1855.coefficient169_230,
  OriginalRow227TriangleData1855.coefficient169_231
]

theorem values1855_size : values1855.size = 32 := rfl

def block1855 : ℕ → Option IntervalDyadic := segment 200 values1855

theorem block1855_domain : ExactDomain block1855 200 232 := by
  simpa only [values1855_size] using segment_domain 200 values1855

theorem block1855_get (i : Fin 32) :
    block1855 (200 + i.val) = some (values1855[i.val]'(by rw [values1855_size]; exact i.isLt)) := by
  exact segment_get 200 values1855 ⟨i.val, by rw [values1855_size]; exact i.isLt⟩

def values1856 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1856.coefficient169_232,
  OriginalRow227TriangleData1856.coefficient169_233,
  OriginalRow227TriangleData1856.coefficient169_234,
  OriginalRow227TriangleData1856.coefficient169_235,
  OriginalRow227TriangleData1856.coefficient169_236,
  OriginalRow227TriangleData1856.coefficient169_237,
  OriginalRow227TriangleData1856.coefficient169_238,
  OriginalRow227TriangleData1856.coefficient169_239,
  OriginalRow227TriangleData1856.coefficient169_240,
  OriginalRow227TriangleData1856.coefficient169_241,
  OriginalRow227TriangleData1856.coefficient169_242,
  OriginalRow227TriangleData1856.coefficient169_243,
  OriginalRow227TriangleData1856.coefficient169_244,
  OriginalRow227TriangleData1856.coefficient169_245,
  OriginalRow227TriangleData1856.coefficient169_246,
  OriginalRow227TriangleData1856.coefficient169_247,
  OriginalRow227TriangleData1856.coefficient169_248,
  OriginalRow227TriangleData1856.coefficient169_249,
  OriginalRow227TriangleData1856.coefficient169_250,
  OriginalRow227TriangleData1856.coefficient169_251,
  OriginalRow227TriangleData1856.coefficient169_252,
  OriginalRow227TriangleData1856.coefficient169_253,
  OriginalRow227TriangleData1856.coefficient169_254,
  OriginalRow227TriangleData1856.coefficient169_255,
  OriginalRow227TriangleData1856.coefficient169_256,
  OriginalRow227TriangleData1856.coefficient169_257,
  OriginalRow227TriangleData1856.coefficient169_258,
  OriginalRow227TriangleData1856.coefficient169_259,
  OriginalRow227TriangleData1856.coefficient169_260,
  OriginalRow227TriangleData1856.coefficient169_261,
  OriginalRow227TriangleData1856.coefficient169_262,
  OriginalRow227TriangleData1856.coefficient169_263
]

theorem values1856_size : values1856.size = 32 := rfl

def block1856 : ℕ → Option IntervalDyadic := segment 232 values1856

theorem block1856_domain : ExactDomain block1856 232 264 := by
  simpa only [values1856_size] using segment_domain 232 values1856

theorem block1856_get (i : Fin 32) :
    block1856 (232 + i.val) = some (values1856[i.val]'(by rw [values1856_size]; exact i.isLt)) := by
  exact segment_get 232 values1856 ⟨i.val, by rw [values1856_size]; exact i.isLt⟩

def values1857 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1857.coefficient169_264,
  OriginalRow227TriangleData1857.coefficient169_265,
  OriginalRow227TriangleData1857.coefficient169_266,
  OriginalRow227TriangleData1857.coefficient169_267,
  OriginalRow227TriangleData1857.coefficient169_268,
  OriginalRow227TriangleData1857.coefficient169_269,
  OriginalRow227TriangleData1857.coefficient169_270,
  OriginalRow227TriangleData1857.coefficient169_271,
  OriginalRow227TriangleData1857.coefficient169_272,
  OriginalRow227TriangleData1857.coefficient169_273,
  OriginalRow227TriangleData1857.coefficient169_274,
  OriginalRow227TriangleData1857.coefficient169_275,
  OriginalRow227TriangleData1857.coefficient169_276,
  OriginalRow227TriangleData1857.coefficient169_277,
  OriginalRow227TriangleData1857.coefficient169_278,
  OriginalRow227TriangleData1857.coefficient169_279,
  OriginalRow227TriangleData1857.coefficient169_280,
  OriginalRow227TriangleData1857.coefficient169_281,
  OriginalRow227TriangleData1857.coefficient169_282,
  OriginalRow227TriangleData1857.coefficient169_283,
  OriginalRow227TriangleData1857.coefficient169_284,
  OriginalRow227TriangleData1857.coefficient169_285,
  OriginalRow227TriangleData1857.coefficient169_286,
  OriginalRow227TriangleData1857.coefficient169_287,
  OriginalRow227TriangleData1857.coefficient169_288,
  OriginalRow227TriangleData1857.coefficient169_289,
  OriginalRow227TriangleData1857.coefficient169_290,
  OriginalRow227TriangleData1857.coefficient169_291,
  OriginalRow227TriangleData1857.coefficient169_292,
  OriginalRow227TriangleData1857.coefficient169_293,
  OriginalRow227TriangleData1857.coefficient169_294,
  OriginalRow227TriangleData1857.coefficient169_295
]

theorem values1857_size : values1857.size = 32 := rfl

def block1857 : ℕ → Option IntervalDyadic := segment 264 values1857

theorem block1857_domain : ExactDomain block1857 264 296 := by
  simpa only [values1857_size] using segment_domain 264 values1857

theorem block1857_get (i : Fin 32) :
    block1857 (264 + i.val) = some (values1857[i.val]'(by rw [values1857_size]; exact i.isLt)) := by
  exact segment_get 264 values1857 ⟨i.val, by rw [values1857_size]; exact i.isLt⟩

def values1858 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1858.coefficient169_296,
  OriginalRow227TriangleData1858.coefficient169_297,
  OriginalRow227TriangleData1858.coefficient169_298,
  OriginalRow227TriangleData1858.coefficient169_299,
  OriginalRow227TriangleData1858.coefficient169_300,
  OriginalRow227TriangleData1858.coefficient169_301,
  OriginalRow227TriangleData1858.coefficient169_302,
  OriginalRow227TriangleData1858.coefficient169_303,
  OriginalRow227TriangleData1858.coefficient169_304,
  OriginalRow227TriangleData1858.coefficient169_305,
  OriginalRow227TriangleData1858.coefficient169_306,
  OriginalRow227TriangleData1858.coefficient169_307,
  OriginalRow227TriangleData1858.coefficient169_308,
  OriginalRow227TriangleData1858.coefficient169_309,
  OriginalRow227TriangleData1858.coefficient169_310,
  OriginalRow227TriangleData1858.coefficient169_311,
  OriginalRow227TriangleData1858.coefficient169_312,
  OriginalRow227TriangleData1858.coefficient169_313,
  OriginalRow227TriangleData1858.coefficient169_314,
  OriginalRow227TriangleData1858.coefficient169_315,
  OriginalRow227TriangleData1858.coefficient169_316,
  OriginalRow227TriangleData1858.coefficient169_317,
  OriginalRow227TriangleData1858.coefficient169_318,
  OriginalRow227TriangleData1858.coefficient169_319,
  OriginalRow227TriangleData1858.coefficient169_320,
  OriginalRow227TriangleData1858.coefficient169_321,
  OriginalRow227TriangleData1858.coefficient169_322,
  OriginalRow227TriangleData1858.coefficient169_323,
  OriginalRow227TriangleData1858.coefficient169_324,
  OriginalRow227TriangleData1858.coefficient169_325,
  OriginalRow227TriangleData1858.coefficient169_326,
  OriginalRow227TriangleData1858.coefficient169_327
]

theorem values1858_size : values1858.size = 32 := rfl

def block1858 : ℕ → Option IntervalDyadic := segment 296 values1858

theorem block1858_domain : ExactDomain block1858 296 328 := by
  simpa only [values1858_size] using segment_domain 296 values1858

theorem block1858_get (i : Fin 32) :
    block1858 (296 + i.val) = some (values1858[i.val]'(by rw [values1858_size]; exact i.isLt)) := by
  exact segment_get 296 values1858 ⟨i.val, by rw [values1858_size]; exact i.isLt⟩

def values1859 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1859.coefficient169_328,
  OriginalRow227TriangleData1859.coefficient169_329,
  OriginalRow227TriangleData1859.coefficient169_330,
  OriginalRow227TriangleData1859.coefficient169_331,
  OriginalRow227TriangleData1859.coefficient169_332
]

theorem values1859_size : values1859.size = 5 := rfl

def block1859 : ℕ → Option IntervalDyadic := segment 328 values1859

theorem block1859_domain : ExactDomain block1859 328 333 := by
  simpa only [values1859_size] using segment_domain 328 values1859

theorem block1859_get (i : Fin 5) :
    block1859 (328 + i.val) = some (values1859[i.val]'(by rw [values1859_size]; exact i.isLt)) := by
  exact segment_get 328 values1859 ⟨i.val, by rw [values1859_size]; exact i.isLt⟩

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block1855 block1856

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block1855_domain block1856_domain

def node0168_0264 : ℕ → Option IntervalDyadic := split 200 block1854 node0200_0264

theorem node0168_0264_domain : ExactDomain node0168_0264 168 264 := by
  exact split_domain (by decide) (by decide) block1854_domain node0200_0264_domain

def node0296_0333 : ℕ → Option IntervalDyadic := split 328 block1858 block1859

theorem node0296_0333_domain : ExactDomain node0296_0333 296 333 := by
  exact split_domain (by decide) (by decide) block1858_domain block1859_domain

def node0264_0333 : ℕ → Option IntervalDyadic := split 296 block1857 node0296_0333

theorem node0264_0333_domain : ExactDomain node0264_0333 264 333 := by
  exact split_domain (by decide) (by decide) block1857_domain node0296_0333_domain

def node0168_0333 : ℕ → Option IntervalDyadic := split 264 node0168_0264 node0264_0333

theorem node0168_0333_domain : ExactDomain node0168_0333 168 333 := by
  exact split_domain (by decide) (by decide) node0168_0264_domain node0264_0333_domain

def lookup : ℕ → Option IntervalDyadic := node0168_0333

theorem lookup_domain : ExactDomain lookup 168 333 :=
  node0168_0333_domain

theorem block1854_lookup (i : Fin 32) :
    lookup (168 + i.val) = some (values1854[i.val]'(by rw [values1854_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0168_0333 (168 + i.val) = _
  rw [node0168_0333, split_left 264 node0168_0264 node0264_0333 (by omega)]
  rw [node0168_0264, split_left 200 block1854 node0200_0264 (by omega)]
  exact block1854_get i

theorem block1855_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values1855[i.val]'(by rw [values1855_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0168_0333 (200 + i.val) = _
  rw [node0168_0333, split_left 264 node0168_0264 node0264_0333 (by omega)]
  rw [node0168_0264, split_right 200 block1854 node0200_0264 (by omega)]
  rw [node0200_0264, split_left 232 block1855 block1856 (by omega)]
  exact block1855_get i

theorem block1856_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values1856[i.val]'(by rw [values1856_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0168_0333 (232 + i.val) = _
  rw [node0168_0333, split_left 264 node0168_0264 node0264_0333 (by omega)]
  rw [node0168_0264, split_right 200 block1854 node0200_0264 (by omega)]
  rw [node0200_0264, split_right 232 block1855 block1856 (by omega)]
  exact block1856_get i

theorem block1857_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values1857[i.val]'(by rw [values1857_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0168_0333 (264 + i.val) = _
  rw [node0168_0333, split_right 264 node0168_0264 node0264_0333 (by omega)]
  rw [node0264_0333, split_left 296 block1857 node0296_0333 (by omega)]
  exact block1857_get i

theorem block1858_lookup (i : Fin 32) :
    lookup (296 + i.val) = some (values1858[i.val]'(by rw [values1858_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0168_0333 (296 + i.val) = _
  rw [node0168_0333, split_right 264 node0168_0264 node0264_0333 (by omega)]
  rw [node0264_0333, split_right 296 block1857 node0296_0333 (by omega)]
  rw [node0296_0333, split_left 328 block1858 block1859 (by omega)]
  exact block1858_get i

theorem block1859_lookup (i : Fin 5) :
    lookup (328 + i.val) = some (values1859[i.val]'(by rw [values1859_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0168_0333 (328 + i.val) = _
  rw [node0168_0333, split_right 264 node0168_0264 node0264_0333 (by omega)]
  rw [node0264_0333, split_right 296 block1857 node0296_0333 (by omega)]
  rw [node0296_0333, split_right 328 block1858 block1859 (by omega)]
  exact block1859_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1854_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1854_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1855_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1855_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1856_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1856_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1857_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1857_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1858_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1858_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1859_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1859_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1854_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1855_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1856_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1857_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1858_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow169.block1859_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow169
