import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1917
import Grothe.UpperChaos.OriginalRow227TriangleData1918
import Grothe.UpperChaos.OriginalRow227TriangleData1919
import Grothe.UpperChaos.OriginalRow227TriangleData1920
import Grothe.UpperChaos.OriginalRow227TriangleData1921

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow181

open ConditionalTableLookup

def values1917 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1917.coefficient181_180,
  OriginalRow227TriangleData1917.coefficient181_181,
  OriginalRow227TriangleData1917.coefficient181_182,
  OriginalRow227TriangleData1917.coefficient181_183,
  OriginalRow227TriangleData1917.coefficient181_184,
  OriginalRow227TriangleData1917.coefficient181_185,
  OriginalRow227TriangleData1917.coefficient181_186,
  OriginalRow227TriangleData1917.coefficient181_187,
  OriginalRow227TriangleData1917.coefficient181_188,
  OriginalRow227TriangleData1917.coefficient181_189,
  OriginalRow227TriangleData1917.coefficient181_190,
  OriginalRow227TriangleData1917.coefficient181_191,
  OriginalRow227TriangleData1917.coefficient181_192,
  OriginalRow227TriangleData1917.coefficient181_193,
  OriginalRow227TriangleData1917.coefficient181_194,
  OriginalRow227TriangleData1917.coefficient181_195,
  OriginalRow227TriangleData1917.coefficient181_196,
  OriginalRow227TriangleData1917.coefficient181_197,
  OriginalRow227TriangleData1917.coefficient181_198,
  OriginalRow227TriangleData1917.coefficient181_199,
  OriginalRow227TriangleData1917.coefficient181_200,
  OriginalRow227TriangleData1917.coefficient181_201,
  OriginalRow227TriangleData1917.coefficient181_202,
  OriginalRow227TriangleData1917.coefficient181_203,
  OriginalRow227TriangleData1917.coefficient181_204,
  OriginalRow227TriangleData1917.coefficient181_205,
  OriginalRow227TriangleData1917.coefficient181_206,
  OriginalRow227TriangleData1917.coefficient181_207,
  OriginalRow227TriangleData1917.coefficient181_208,
  OriginalRow227TriangleData1917.coefficient181_209,
  OriginalRow227TriangleData1917.coefficient181_210,
  OriginalRow227TriangleData1917.coefficient181_211
]

theorem values1917_size : values1917.size = 32 := rfl

def block1917 : ℕ → Option IntervalDyadic := segment 180 values1917

theorem block1917_domain : ExactDomain block1917 180 212 := by
  simpa only [values1917_size] using segment_domain 180 values1917

theorem block1917_get (i : Fin 32) :
    block1917 (180 + i.val) = some (values1917[i.val]'(by rw [values1917_size]; exact i.isLt)) := by
  exact segment_get 180 values1917 ⟨i.val, by rw [values1917_size]; exact i.isLt⟩

def values1918 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1918.coefficient181_212,
  OriginalRow227TriangleData1918.coefficient181_213,
  OriginalRow227TriangleData1918.coefficient181_214,
  OriginalRow227TriangleData1918.coefficient181_215,
  OriginalRow227TriangleData1918.coefficient181_216,
  OriginalRow227TriangleData1918.coefficient181_217,
  OriginalRow227TriangleData1918.coefficient181_218,
  OriginalRow227TriangleData1918.coefficient181_219,
  OriginalRow227TriangleData1918.coefficient181_220,
  OriginalRow227TriangleData1918.coefficient181_221,
  OriginalRow227TriangleData1918.coefficient181_222,
  OriginalRow227TriangleData1918.coefficient181_223,
  OriginalRow227TriangleData1918.coefficient181_224,
  OriginalRow227TriangleData1918.coefficient181_225,
  OriginalRow227TriangleData1918.coefficient181_226,
  OriginalRow227TriangleData1918.coefficient181_227,
  OriginalRow227TriangleData1918.coefficient181_228,
  OriginalRow227TriangleData1918.coefficient181_229,
  OriginalRow227TriangleData1918.coefficient181_230,
  OriginalRow227TriangleData1918.coefficient181_231,
  OriginalRow227TriangleData1918.coefficient181_232,
  OriginalRow227TriangleData1918.coefficient181_233,
  OriginalRow227TriangleData1918.coefficient181_234,
  OriginalRow227TriangleData1918.coefficient181_235,
  OriginalRow227TriangleData1918.coefficient181_236,
  OriginalRow227TriangleData1918.coefficient181_237,
  OriginalRow227TriangleData1918.coefficient181_238,
  OriginalRow227TriangleData1918.coefficient181_239,
  OriginalRow227TriangleData1918.coefficient181_240,
  OriginalRow227TriangleData1918.coefficient181_241,
  OriginalRow227TriangleData1918.coefficient181_242,
  OriginalRow227TriangleData1918.coefficient181_243
]

theorem values1918_size : values1918.size = 32 := rfl

def block1918 : ℕ → Option IntervalDyadic := segment 212 values1918

theorem block1918_domain : ExactDomain block1918 212 244 := by
  simpa only [values1918_size] using segment_domain 212 values1918

theorem block1918_get (i : Fin 32) :
    block1918 (212 + i.val) = some (values1918[i.val]'(by rw [values1918_size]; exact i.isLt)) := by
  exact segment_get 212 values1918 ⟨i.val, by rw [values1918_size]; exact i.isLt⟩

def values1919 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1919.coefficient181_244,
  OriginalRow227TriangleData1919.coefficient181_245,
  OriginalRow227TriangleData1919.coefficient181_246,
  OriginalRow227TriangleData1919.coefficient181_247,
  OriginalRow227TriangleData1919.coefficient181_248,
  OriginalRow227TriangleData1919.coefficient181_249,
  OriginalRow227TriangleData1919.coefficient181_250,
  OriginalRow227TriangleData1919.coefficient181_251,
  OriginalRow227TriangleData1919.coefficient181_252,
  OriginalRow227TriangleData1919.coefficient181_253,
  OriginalRow227TriangleData1919.coefficient181_254,
  OriginalRow227TriangleData1919.coefficient181_255,
  OriginalRow227TriangleData1919.coefficient181_256,
  OriginalRow227TriangleData1919.coefficient181_257,
  OriginalRow227TriangleData1919.coefficient181_258,
  OriginalRow227TriangleData1919.coefficient181_259,
  OriginalRow227TriangleData1919.coefficient181_260,
  OriginalRow227TriangleData1919.coefficient181_261,
  OriginalRow227TriangleData1919.coefficient181_262,
  OriginalRow227TriangleData1919.coefficient181_263,
  OriginalRow227TriangleData1919.coefficient181_264,
  OriginalRow227TriangleData1919.coefficient181_265,
  OriginalRow227TriangleData1919.coefficient181_266,
  OriginalRow227TriangleData1919.coefficient181_267,
  OriginalRow227TriangleData1919.coefficient181_268,
  OriginalRow227TriangleData1919.coefficient181_269,
  OriginalRow227TriangleData1919.coefficient181_270,
  OriginalRow227TriangleData1919.coefficient181_271,
  OriginalRow227TriangleData1919.coefficient181_272,
  OriginalRow227TriangleData1919.coefficient181_273,
  OriginalRow227TriangleData1919.coefficient181_274,
  OriginalRow227TriangleData1919.coefficient181_275
]

theorem values1919_size : values1919.size = 32 := rfl

def block1919 : ℕ → Option IntervalDyadic := segment 244 values1919

theorem block1919_domain : ExactDomain block1919 244 276 := by
  simpa only [values1919_size] using segment_domain 244 values1919

theorem block1919_get (i : Fin 32) :
    block1919 (244 + i.val) = some (values1919[i.val]'(by rw [values1919_size]; exact i.isLt)) := by
  exact segment_get 244 values1919 ⟨i.val, by rw [values1919_size]; exact i.isLt⟩

def values1920 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1920.coefficient181_276,
  OriginalRow227TriangleData1920.coefficient181_277,
  OriginalRow227TriangleData1920.coefficient181_278,
  OriginalRow227TriangleData1920.coefficient181_279,
  OriginalRow227TriangleData1920.coefficient181_280,
  OriginalRow227TriangleData1920.coefficient181_281,
  OriginalRow227TriangleData1920.coefficient181_282,
  OriginalRow227TriangleData1920.coefficient181_283,
  OriginalRow227TriangleData1920.coefficient181_284,
  OriginalRow227TriangleData1920.coefficient181_285,
  OriginalRow227TriangleData1920.coefficient181_286,
  OriginalRow227TriangleData1920.coefficient181_287,
  OriginalRow227TriangleData1920.coefficient181_288,
  OriginalRow227TriangleData1920.coefficient181_289,
  OriginalRow227TriangleData1920.coefficient181_290,
  OriginalRow227TriangleData1920.coefficient181_291,
  OriginalRow227TriangleData1920.coefficient181_292,
  OriginalRow227TriangleData1920.coefficient181_293,
  OriginalRow227TriangleData1920.coefficient181_294,
  OriginalRow227TriangleData1920.coefficient181_295,
  OriginalRow227TriangleData1920.coefficient181_296,
  OriginalRow227TriangleData1920.coefficient181_297,
  OriginalRow227TriangleData1920.coefficient181_298,
  OriginalRow227TriangleData1920.coefficient181_299,
  OriginalRow227TriangleData1920.coefficient181_300,
  OriginalRow227TriangleData1920.coefficient181_301,
  OriginalRow227TriangleData1920.coefficient181_302,
  OriginalRow227TriangleData1920.coefficient181_303,
  OriginalRow227TriangleData1920.coefficient181_304,
  OriginalRow227TriangleData1920.coefficient181_305,
  OriginalRow227TriangleData1920.coefficient181_306,
  OriginalRow227TriangleData1920.coefficient181_307
]

theorem values1920_size : values1920.size = 32 := rfl

def block1920 : ℕ → Option IntervalDyadic := segment 276 values1920

theorem block1920_domain : ExactDomain block1920 276 308 := by
  simpa only [values1920_size] using segment_domain 276 values1920

theorem block1920_get (i : Fin 32) :
    block1920 (276 + i.val) = some (values1920[i.val]'(by rw [values1920_size]; exact i.isLt)) := by
  exact segment_get 276 values1920 ⟨i.val, by rw [values1920_size]; exact i.isLt⟩

def values1921 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1921.coefficient181_308,
  OriginalRow227TriangleData1921.coefficient181_309,
  OriginalRow227TriangleData1921.coefficient181_310,
  OriginalRow227TriangleData1921.coefficient181_311,
  OriginalRow227TriangleData1921.coefficient181_312,
  OriginalRow227TriangleData1921.coefficient181_313,
  OriginalRow227TriangleData1921.coefficient181_314,
  OriginalRow227TriangleData1921.coefficient181_315,
  OriginalRow227TriangleData1921.coefficient181_316,
  OriginalRow227TriangleData1921.coefficient181_317,
  OriginalRow227TriangleData1921.coefficient181_318,
  OriginalRow227TriangleData1921.coefficient181_319,
  OriginalRow227TriangleData1921.coefficient181_320
]

theorem values1921_size : values1921.size = 13 := rfl

def block1921 : ℕ → Option IntervalDyadic := segment 308 values1921

theorem block1921_domain : ExactDomain block1921 308 321 := by
  simpa only [values1921_size] using segment_domain 308 values1921

theorem block1921_get (i : Fin 13) :
    block1921 (308 + i.val) = some (values1921[i.val]'(by rw [values1921_size]; exact i.isLt)) := by
  exact segment_get 308 values1921 ⟨i.val, by rw [values1921_size]; exact i.isLt⟩

def node0180_0244 : ℕ → Option IntervalDyadic := split 212 block1917 block1918

theorem node0180_0244_domain : ExactDomain node0180_0244 180 244 := by
  exact split_domain (by decide) (by decide) block1917_domain block1918_domain

def node0276_0321 : ℕ → Option IntervalDyadic := split 308 block1920 block1921

theorem node0276_0321_domain : ExactDomain node0276_0321 276 321 := by
  exact split_domain (by decide) (by decide) block1920_domain block1921_domain

def node0244_0321 : ℕ → Option IntervalDyadic := split 276 block1919 node0276_0321

theorem node0244_0321_domain : ExactDomain node0244_0321 244 321 := by
  exact split_domain (by decide) (by decide) block1919_domain node0276_0321_domain

def node0180_0321 : ℕ → Option IntervalDyadic := split 244 node0180_0244 node0244_0321

theorem node0180_0321_domain : ExactDomain node0180_0321 180 321 := by
  exact split_domain (by decide) (by decide) node0180_0244_domain node0244_0321_domain

def lookup : ℕ → Option IntervalDyadic := node0180_0321

theorem lookup_domain : ExactDomain lookup 180 321 :=
  node0180_0321_domain

theorem block1917_lookup (i : Fin 32) :
    lookup (180 + i.val) = some (values1917[i.val]'(by rw [values1917_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0180_0321 (180 + i.val) = _
  rw [node0180_0321, split_left 244 node0180_0244 node0244_0321 (by omega)]
  rw [node0180_0244, split_left 212 block1917 block1918 (by omega)]
  exact block1917_get i

theorem block1918_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values1918[i.val]'(by rw [values1918_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0180_0321 (212 + i.val) = _
  rw [node0180_0321, split_left 244 node0180_0244 node0244_0321 (by omega)]
  rw [node0180_0244, split_right 212 block1917 block1918 (by omega)]
  exact block1918_get i

theorem block1919_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values1919[i.val]'(by rw [values1919_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0180_0321 (244 + i.val) = _
  rw [node0180_0321, split_right 244 node0180_0244 node0244_0321 (by omega)]
  rw [node0244_0321, split_left 276 block1919 node0276_0321 (by omega)]
  exact block1919_get i

theorem block1920_lookup (i : Fin 32) :
    lookup (276 + i.val) = some (values1920[i.val]'(by rw [values1920_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0180_0321 (276 + i.val) = _
  rw [node0180_0321, split_right 244 node0180_0244 node0244_0321 (by omega)]
  rw [node0244_0321, split_right 276 block1919 node0276_0321 (by omega)]
  rw [node0276_0321, split_left 308 block1920 block1921 (by omega)]
  exact block1920_get i

theorem block1921_lookup (i : Fin 13) :
    lookup (308 + i.val) = some (values1921[i.val]'(by rw [values1921_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0180_0321 (308 + i.val) = _
  rw [node0180_0321, split_right 244 node0180_0244 node0244_0321 (by omega)]
  rw [node0244_0321, split_right 276 block1919 node0276_0321 (by omega)]
  rw [node0276_0321, split_right 308 block1920 block1921 (by omega)]
  exact block1921_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1917_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1917_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1918_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1918_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1919_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1919_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1920_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1920_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1921_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1921_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1917_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1918_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1919_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1920_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow181.block1921_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow181
