import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1860
import Grothe.UpperChaos.OriginalRow227TriangleData1861
import Grothe.UpperChaos.OriginalRow227TriangleData1862
import Grothe.UpperChaos.OriginalRow227TriangleData1863
import Grothe.UpperChaos.OriginalRow227TriangleData1864
import Grothe.UpperChaos.OriginalRow227TriangleData1865

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow170

open ConditionalTableLookup

def values1860 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1860.coefficient170_169,
  OriginalRow227TriangleData1860.coefficient170_170,
  OriginalRow227TriangleData1860.coefficient170_171,
  OriginalRow227TriangleData1860.coefficient170_172,
  OriginalRow227TriangleData1860.coefficient170_173,
  OriginalRow227TriangleData1860.coefficient170_174,
  OriginalRow227TriangleData1860.coefficient170_175,
  OriginalRow227TriangleData1860.coefficient170_176,
  OriginalRow227TriangleData1860.coefficient170_177,
  OriginalRow227TriangleData1860.coefficient170_178,
  OriginalRow227TriangleData1860.coefficient170_179,
  OriginalRow227TriangleData1860.coefficient170_180,
  OriginalRow227TriangleData1860.coefficient170_181,
  OriginalRow227TriangleData1860.coefficient170_182,
  OriginalRow227TriangleData1860.coefficient170_183,
  OriginalRow227TriangleData1860.coefficient170_184,
  OriginalRow227TriangleData1860.coefficient170_185,
  OriginalRow227TriangleData1860.coefficient170_186,
  OriginalRow227TriangleData1860.coefficient170_187,
  OriginalRow227TriangleData1860.coefficient170_188,
  OriginalRow227TriangleData1860.coefficient170_189,
  OriginalRow227TriangleData1860.coefficient170_190,
  OriginalRow227TriangleData1860.coefficient170_191,
  OriginalRow227TriangleData1860.coefficient170_192,
  OriginalRow227TriangleData1860.coefficient170_193,
  OriginalRow227TriangleData1860.coefficient170_194,
  OriginalRow227TriangleData1860.coefficient170_195,
  OriginalRow227TriangleData1860.coefficient170_196,
  OriginalRow227TriangleData1860.coefficient170_197,
  OriginalRow227TriangleData1860.coefficient170_198,
  OriginalRow227TriangleData1860.coefficient170_199,
  OriginalRow227TriangleData1860.coefficient170_200
]

theorem values1860_size : values1860.size = 32 := rfl

def block1860 : ℕ → Option IntervalDyadic := segment 169 values1860

theorem block1860_domain : ExactDomain block1860 169 201 := by
  simpa only [values1860_size] using segment_domain 169 values1860

theorem block1860_get (i : Fin 32) :
    block1860 (169 + i.val) = some (values1860[i.val]'(by rw [values1860_size]; exact i.isLt)) := by
  exact segment_get 169 values1860 ⟨i.val, by rw [values1860_size]; exact i.isLt⟩

def values1861 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1861.coefficient170_201,
  OriginalRow227TriangleData1861.coefficient170_202,
  OriginalRow227TriangleData1861.coefficient170_203,
  OriginalRow227TriangleData1861.coefficient170_204,
  OriginalRow227TriangleData1861.coefficient170_205,
  OriginalRow227TriangleData1861.coefficient170_206,
  OriginalRow227TriangleData1861.coefficient170_207,
  OriginalRow227TriangleData1861.coefficient170_208,
  OriginalRow227TriangleData1861.coefficient170_209,
  OriginalRow227TriangleData1861.coefficient170_210,
  OriginalRow227TriangleData1861.coefficient170_211,
  OriginalRow227TriangleData1861.coefficient170_212,
  OriginalRow227TriangleData1861.coefficient170_213,
  OriginalRow227TriangleData1861.coefficient170_214,
  OriginalRow227TriangleData1861.coefficient170_215,
  OriginalRow227TriangleData1861.coefficient170_216,
  OriginalRow227TriangleData1861.coefficient170_217,
  OriginalRow227TriangleData1861.coefficient170_218,
  OriginalRow227TriangleData1861.coefficient170_219,
  OriginalRow227TriangleData1861.coefficient170_220,
  OriginalRow227TriangleData1861.coefficient170_221,
  OriginalRow227TriangleData1861.coefficient170_222,
  OriginalRow227TriangleData1861.coefficient170_223,
  OriginalRow227TriangleData1861.coefficient170_224,
  OriginalRow227TriangleData1861.coefficient170_225,
  OriginalRow227TriangleData1861.coefficient170_226,
  OriginalRow227TriangleData1861.coefficient170_227,
  OriginalRow227TriangleData1861.coefficient170_228,
  OriginalRow227TriangleData1861.coefficient170_229,
  OriginalRow227TriangleData1861.coefficient170_230,
  OriginalRow227TriangleData1861.coefficient170_231,
  OriginalRow227TriangleData1861.coefficient170_232
]

theorem values1861_size : values1861.size = 32 := rfl

def block1861 : ℕ → Option IntervalDyadic := segment 201 values1861

theorem block1861_domain : ExactDomain block1861 201 233 := by
  simpa only [values1861_size] using segment_domain 201 values1861

theorem block1861_get (i : Fin 32) :
    block1861 (201 + i.val) = some (values1861[i.val]'(by rw [values1861_size]; exact i.isLt)) := by
  exact segment_get 201 values1861 ⟨i.val, by rw [values1861_size]; exact i.isLt⟩

def values1862 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1862.coefficient170_233,
  OriginalRow227TriangleData1862.coefficient170_234,
  OriginalRow227TriangleData1862.coefficient170_235,
  OriginalRow227TriangleData1862.coefficient170_236,
  OriginalRow227TriangleData1862.coefficient170_237,
  OriginalRow227TriangleData1862.coefficient170_238,
  OriginalRow227TriangleData1862.coefficient170_239,
  OriginalRow227TriangleData1862.coefficient170_240,
  OriginalRow227TriangleData1862.coefficient170_241,
  OriginalRow227TriangleData1862.coefficient170_242,
  OriginalRow227TriangleData1862.coefficient170_243,
  OriginalRow227TriangleData1862.coefficient170_244,
  OriginalRow227TriangleData1862.coefficient170_245,
  OriginalRow227TriangleData1862.coefficient170_246,
  OriginalRow227TriangleData1862.coefficient170_247,
  OriginalRow227TriangleData1862.coefficient170_248,
  OriginalRow227TriangleData1862.coefficient170_249,
  OriginalRow227TriangleData1862.coefficient170_250,
  OriginalRow227TriangleData1862.coefficient170_251,
  OriginalRow227TriangleData1862.coefficient170_252,
  OriginalRow227TriangleData1862.coefficient170_253,
  OriginalRow227TriangleData1862.coefficient170_254,
  OriginalRow227TriangleData1862.coefficient170_255,
  OriginalRow227TriangleData1862.coefficient170_256,
  OriginalRow227TriangleData1862.coefficient170_257,
  OriginalRow227TriangleData1862.coefficient170_258,
  OriginalRow227TriangleData1862.coefficient170_259,
  OriginalRow227TriangleData1862.coefficient170_260,
  OriginalRow227TriangleData1862.coefficient170_261,
  OriginalRow227TriangleData1862.coefficient170_262,
  OriginalRow227TriangleData1862.coefficient170_263,
  OriginalRow227TriangleData1862.coefficient170_264
]

theorem values1862_size : values1862.size = 32 := rfl

def block1862 : ℕ → Option IntervalDyadic := segment 233 values1862

theorem block1862_domain : ExactDomain block1862 233 265 := by
  simpa only [values1862_size] using segment_domain 233 values1862

theorem block1862_get (i : Fin 32) :
    block1862 (233 + i.val) = some (values1862[i.val]'(by rw [values1862_size]; exact i.isLt)) := by
  exact segment_get 233 values1862 ⟨i.val, by rw [values1862_size]; exact i.isLt⟩

def values1863 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1863.coefficient170_265,
  OriginalRow227TriangleData1863.coefficient170_266,
  OriginalRow227TriangleData1863.coefficient170_267,
  OriginalRow227TriangleData1863.coefficient170_268,
  OriginalRow227TriangleData1863.coefficient170_269,
  OriginalRow227TriangleData1863.coefficient170_270,
  OriginalRow227TriangleData1863.coefficient170_271,
  OriginalRow227TriangleData1863.coefficient170_272,
  OriginalRow227TriangleData1863.coefficient170_273,
  OriginalRow227TriangleData1863.coefficient170_274,
  OriginalRow227TriangleData1863.coefficient170_275,
  OriginalRow227TriangleData1863.coefficient170_276,
  OriginalRow227TriangleData1863.coefficient170_277,
  OriginalRow227TriangleData1863.coefficient170_278,
  OriginalRow227TriangleData1863.coefficient170_279,
  OriginalRow227TriangleData1863.coefficient170_280,
  OriginalRow227TriangleData1863.coefficient170_281,
  OriginalRow227TriangleData1863.coefficient170_282,
  OriginalRow227TriangleData1863.coefficient170_283,
  OriginalRow227TriangleData1863.coefficient170_284,
  OriginalRow227TriangleData1863.coefficient170_285,
  OriginalRow227TriangleData1863.coefficient170_286,
  OriginalRow227TriangleData1863.coefficient170_287,
  OriginalRow227TriangleData1863.coefficient170_288,
  OriginalRow227TriangleData1863.coefficient170_289,
  OriginalRow227TriangleData1863.coefficient170_290,
  OriginalRow227TriangleData1863.coefficient170_291,
  OriginalRow227TriangleData1863.coefficient170_292,
  OriginalRow227TriangleData1863.coefficient170_293,
  OriginalRow227TriangleData1863.coefficient170_294,
  OriginalRow227TriangleData1863.coefficient170_295,
  OriginalRow227TriangleData1863.coefficient170_296
]

theorem values1863_size : values1863.size = 32 := rfl

def block1863 : ℕ → Option IntervalDyadic := segment 265 values1863

theorem block1863_domain : ExactDomain block1863 265 297 := by
  simpa only [values1863_size] using segment_domain 265 values1863

theorem block1863_get (i : Fin 32) :
    block1863 (265 + i.val) = some (values1863[i.val]'(by rw [values1863_size]; exact i.isLt)) := by
  exact segment_get 265 values1863 ⟨i.val, by rw [values1863_size]; exact i.isLt⟩

def values1864 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1864.coefficient170_297,
  OriginalRow227TriangleData1864.coefficient170_298,
  OriginalRow227TriangleData1864.coefficient170_299,
  OriginalRow227TriangleData1864.coefficient170_300,
  OriginalRow227TriangleData1864.coefficient170_301,
  OriginalRow227TriangleData1864.coefficient170_302,
  OriginalRow227TriangleData1864.coefficient170_303,
  OriginalRow227TriangleData1864.coefficient170_304,
  OriginalRow227TriangleData1864.coefficient170_305,
  OriginalRow227TriangleData1864.coefficient170_306,
  OriginalRow227TriangleData1864.coefficient170_307,
  OriginalRow227TriangleData1864.coefficient170_308,
  OriginalRow227TriangleData1864.coefficient170_309,
  OriginalRow227TriangleData1864.coefficient170_310,
  OriginalRow227TriangleData1864.coefficient170_311,
  OriginalRow227TriangleData1864.coefficient170_312,
  OriginalRow227TriangleData1864.coefficient170_313,
  OriginalRow227TriangleData1864.coefficient170_314,
  OriginalRow227TriangleData1864.coefficient170_315,
  OriginalRow227TriangleData1864.coefficient170_316,
  OriginalRow227TriangleData1864.coefficient170_317,
  OriginalRow227TriangleData1864.coefficient170_318,
  OriginalRow227TriangleData1864.coefficient170_319,
  OriginalRow227TriangleData1864.coefficient170_320,
  OriginalRow227TriangleData1864.coefficient170_321,
  OriginalRow227TriangleData1864.coefficient170_322,
  OriginalRow227TriangleData1864.coefficient170_323,
  OriginalRow227TriangleData1864.coefficient170_324,
  OriginalRow227TriangleData1864.coefficient170_325,
  OriginalRow227TriangleData1864.coefficient170_326,
  OriginalRow227TriangleData1864.coefficient170_327,
  OriginalRow227TriangleData1864.coefficient170_328
]

theorem values1864_size : values1864.size = 32 := rfl

def block1864 : ℕ → Option IntervalDyadic := segment 297 values1864

theorem block1864_domain : ExactDomain block1864 297 329 := by
  simpa only [values1864_size] using segment_domain 297 values1864

theorem block1864_get (i : Fin 32) :
    block1864 (297 + i.val) = some (values1864[i.val]'(by rw [values1864_size]; exact i.isLt)) := by
  exact segment_get 297 values1864 ⟨i.val, by rw [values1864_size]; exact i.isLt⟩

def values1865 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1865.coefficient170_329,
  OriginalRow227TriangleData1865.coefficient170_330,
  OriginalRow227TriangleData1865.coefficient170_331
]

theorem values1865_size : values1865.size = 3 := rfl

def block1865 : ℕ → Option IntervalDyadic := segment 329 values1865

theorem block1865_domain : ExactDomain block1865 329 332 := by
  simpa only [values1865_size] using segment_domain 329 values1865

theorem block1865_get (i : Fin 3) :
    block1865 (329 + i.val) = some (values1865[i.val]'(by rw [values1865_size]; exact i.isLt)) := by
  exact segment_get 329 values1865 ⟨i.val, by rw [values1865_size]; exact i.isLt⟩

def node0201_0265 : ℕ → Option IntervalDyadic := split 233 block1861 block1862

theorem node0201_0265_domain : ExactDomain node0201_0265 201 265 := by
  exact split_domain (by decide) (by decide) block1861_domain block1862_domain

def node0169_0265 : ℕ → Option IntervalDyadic := split 201 block1860 node0201_0265

theorem node0169_0265_domain : ExactDomain node0169_0265 169 265 := by
  exact split_domain (by decide) (by decide) block1860_domain node0201_0265_domain

def node0297_0332 : ℕ → Option IntervalDyadic := split 329 block1864 block1865

theorem node0297_0332_domain : ExactDomain node0297_0332 297 332 := by
  exact split_domain (by decide) (by decide) block1864_domain block1865_domain

def node0265_0332 : ℕ → Option IntervalDyadic := split 297 block1863 node0297_0332

theorem node0265_0332_domain : ExactDomain node0265_0332 265 332 := by
  exact split_domain (by decide) (by decide) block1863_domain node0297_0332_domain

def node0169_0332 : ℕ → Option IntervalDyadic := split 265 node0169_0265 node0265_0332

theorem node0169_0332_domain : ExactDomain node0169_0332 169 332 := by
  exact split_domain (by decide) (by decide) node0169_0265_domain node0265_0332_domain

def lookup : ℕ → Option IntervalDyadic := node0169_0332

theorem lookup_domain : ExactDomain lookup 169 332 :=
  node0169_0332_domain

theorem block1860_lookup (i : Fin 32) :
    lookup (169 + i.val) = some (values1860[i.val]'(by rw [values1860_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0169_0332 (169 + i.val) = _
  rw [node0169_0332, split_left 265 node0169_0265 node0265_0332 (by omega)]
  rw [node0169_0265, split_left 201 block1860 node0201_0265 (by omega)]
  exact block1860_get i

theorem block1861_lookup (i : Fin 32) :
    lookup (201 + i.val) = some (values1861[i.val]'(by rw [values1861_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0169_0332 (201 + i.val) = _
  rw [node0169_0332, split_left 265 node0169_0265 node0265_0332 (by omega)]
  rw [node0169_0265, split_right 201 block1860 node0201_0265 (by omega)]
  rw [node0201_0265, split_left 233 block1861 block1862 (by omega)]
  exact block1861_get i

theorem block1862_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values1862[i.val]'(by rw [values1862_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0169_0332 (233 + i.val) = _
  rw [node0169_0332, split_left 265 node0169_0265 node0265_0332 (by omega)]
  rw [node0169_0265, split_right 201 block1860 node0201_0265 (by omega)]
  rw [node0201_0265, split_right 233 block1861 block1862 (by omega)]
  exact block1862_get i

theorem block1863_lookup (i : Fin 32) :
    lookup (265 + i.val) = some (values1863[i.val]'(by rw [values1863_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0169_0332 (265 + i.val) = _
  rw [node0169_0332, split_right 265 node0169_0265 node0265_0332 (by omega)]
  rw [node0265_0332, split_left 297 block1863 node0297_0332 (by omega)]
  exact block1863_get i

theorem block1864_lookup (i : Fin 32) :
    lookup (297 + i.val) = some (values1864[i.val]'(by rw [values1864_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0169_0332 (297 + i.val) = _
  rw [node0169_0332, split_right 265 node0169_0265 node0265_0332 (by omega)]
  rw [node0265_0332, split_right 297 block1863 node0297_0332 (by omega)]
  rw [node0297_0332, split_left 329 block1864 block1865 (by omega)]
  exact block1864_get i

theorem block1865_lookup (i : Fin 3) :
    lookup (329 + i.val) = some (values1865[i.val]'(by rw [values1865_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0169_0332 (329 + i.val) = _
  rw [node0169_0332, split_right 265 node0169_0265 node0265_0332 (by omega)]
  rw [node0265_0332, split_right 297 block1863 node0297_0332 (by omega)]
  rw [node0297_0332, split_right 329 block1864 block1865 (by omega)]
  exact block1865_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1860_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1860_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1861_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1861_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1862_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1862_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1863_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1863_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1864_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1864_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1865_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1865_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1860_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1861_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1862_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1863_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1864_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow170.block1865_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow170
