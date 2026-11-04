import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1942
import Grothe.UpperChaos.OriginalRow227TriangleData1943
import Grothe.UpperChaos.OriginalRow227TriangleData1944
import Grothe.UpperChaos.OriginalRow227TriangleData1945
import Grothe.UpperChaos.OriginalRow227TriangleData1946

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow186

open ConditionalTableLookup

def values1942 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1942.coefficient186_185,
  OriginalRow227TriangleData1942.coefficient186_186,
  OriginalRow227TriangleData1942.coefficient186_187,
  OriginalRow227TriangleData1942.coefficient186_188,
  OriginalRow227TriangleData1942.coefficient186_189,
  OriginalRow227TriangleData1942.coefficient186_190,
  OriginalRow227TriangleData1942.coefficient186_191,
  OriginalRow227TriangleData1942.coefficient186_192,
  OriginalRow227TriangleData1942.coefficient186_193,
  OriginalRow227TriangleData1942.coefficient186_194,
  OriginalRow227TriangleData1942.coefficient186_195,
  OriginalRow227TriangleData1942.coefficient186_196,
  OriginalRow227TriangleData1942.coefficient186_197,
  OriginalRow227TriangleData1942.coefficient186_198,
  OriginalRow227TriangleData1942.coefficient186_199,
  OriginalRow227TriangleData1942.coefficient186_200,
  OriginalRow227TriangleData1942.coefficient186_201,
  OriginalRow227TriangleData1942.coefficient186_202,
  OriginalRow227TriangleData1942.coefficient186_203,
  OriginalRow227TriangleData1942.coefficient186_204,
  OriginalRow227TriangleData1942.coefficient186_205,
  OriginalRow227TriangleData1942.coefficient186_206,
  OriginalRow227TriangleData1942.coefficient186_207,
  OriginalRow227TriangleData1942.coefficient186_208,
  OriginalRow227TriangleData1942.coefficient186_209,
  OriginalRow227TriangleData1942.coefficient186_210,
  OriginalRow227TriangleData1942.coefficient186_211,
  OriginalRow227TriangleData1942.coefficient186_212,
  OriginalRow227TriangleData1942.coefficient186_213,
  OriginalRow227TriangleData1942.coefficient186_214,
  OriginalRow227TriangleData1942.coefficient186_215,
  OriginalRow227TriangleData1942.coefficient186_216
]

theorem values1942_size : values1942.size = 32 := rfl

def block1942 : ℕ → Option IntervalDyadic := segment 185 values1942

theorem block1942_domain : ExactDomain block1942 185 217 := by
  simpa only [values1942_size] using segment_domain 185 values1942

theorem block1942_get (i : Fin 32) :
    block1942 (185 + i.val) = some (values1942[i.val]'(by rw [values1942_size]; exact i.isLt)) := by
  exact segment_get 185 values1942 ⟨i.val, by rw [values1942_size]; exact i.isLt⟩

def values1943 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1943.coefficient186_217,
  OriginalRow227TriangleData1943.coefficient186_218,
  OriginalRow227TriangleData1943.coefficient186_219,
  OriginalRow227TriangleData1943.coefficient186_220,
  OriginalRow227TriangleData1943.coefficient186_221,
  OriginalRow227TriangleData1943.coefficient186_222,
  OriginalRow227TriangleData1943.coefficient186_223,
  OriginalRow227TriangleData1943.coefficient186_224,
  OriginalRow227TriangleData1943.coefficient186_225,
  OriginalRow227TriangleData1943.coefficient186_226,
  OriginalRow227TriangleData1943.coefficient186_227,
  OriginalRow227TriangleData1943.coefficient186_228,
  OriginalRow227TriangleData1943.coefficient186_229,
  OriginalRow227TriangleData1943.coefficient186_230,
  OriginalRow227TriangleData1943.coefficient186_231,
  OriginalRow227TriangleData1943.coefficient186_232,
  OriginalRow227TriangleData1943.coefficient186_233,
  OriginalRow227TriangleData1943.coefficient186_234,
  OriginalRow227TriangleData1943.coefficient186_235,
  OriginalRow227TriangleData1943.coefficient186_236,
  OriginalRow227TriangleData1943.coefficient186_237,
  OriginalRow227TriangleData1943.coefficient186_238,
  OriginalRow227TriangleData1943.coefficient186_239,
  OriginalRow227TriangleData1943.coefficient186_240,
  OriginalRow227TriangleData1943.coefficient186_241,
  OriginalRow227TriangleData1943.coefficient186_242,
  OriginalRow227TriangleData1943.coefficient186_243,
  OriginalRow227TriangleData1943.coefficient186_244,
  OriginalRow227TriangleData1943.coefficient186_245,
  OriginalRow227TriangleData1943.coefficient186_246,
  OriginalRow227TriangleData1943.coefficient186_247,
  OriginalRow227TriangleData1943.coefficient186_248
]

theorem values1943_size : values1943.size = 32 := rfl

def block1943 : ℕ → Option IntervalDyadic := segment 217 values1943

theorem block1943_domain : ExactDomain block1943 217 249 := by
  simpa only [values1943_size] using segment_domain 217 values1943

theorem block1943_get (i : Fin 32) :
    block1943 (217 + i.val) = some (values1943[i.val]'(by rw [values1943_size]; exact i.isLt)) := by
  exact segment_get 217 values1943 ⟨i.val, by rw [values1943_size]; exact i.isLt⟩

def values1944 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1944.coefficient186_249,
  OriginalRow227TriangleData1944.coefficient186_250,
  OriginalRow227TriangleData1944.coefficient186_251,
  OriginalRow227TriangleData1944.coefficient186_252,
  OriginalRow227TriangleData1944.coefficient186_253,
  OriginalRow227TriangleData1944.coefficient186_254,
  OriginalRow227TriangleData1944.coefficient186_255,
  OriginalRow227TriangleData1944.coefficient186_256,
  OriginalRow227TriangleData1944.coefficient186_257,
  OriginalRow227TriangleData1944.coefficient186_258,
  OriginalRow227TriangleData1944.coefficient186_259,
  OriginalRow227TriangleData1944.coefficient186_260,
  OriginalRow227TriangleData1944.coefficient186_261,
  OriginalRow227TriangleData1944.coefficient186_262,
  OriginalRow227TriangleData1944.coefficient186_263,
  OriginalRow227TriangleData1944.coefficient186_264,
  OriginalRow227TriangleData1944.coefficient186_265,
  OriginalRow227TriangleData1944.coefficient186_266,
  OriginalRow227TriangleData1944.coefficient186_267,
  OriginalRow227TriangleData1944.coefficient186_268,
  OriginalRow227TriangleData1944.coefficient186_269,
  OriginalRow227TriangleData1944.coefficient186_270,
  OriginalRow227TriangleData1944.coefficient186_271,
  OriginalRow227TriangleData1944.coefficient186_272,
  OriginalRow227TriangleData1944.coefficient186_273,
  OriginalRow227TriangleData1944.coefficient186_274,
  OriginalRow227TriangleData1944.coefficient186_275,
  OriginalRow227TriangleData1944.coefficient186_276,
  OriginalRow227TriangleData1944.coefficient186_277,
  OriginalRow227TriangleData1944.coefficient186_278,
  OriginalRow227TriangleData1944.coefficient186_279,
  OriginalRow227TriangleData1944.coefficient186_280
]

theorem values1944_size : values1944.size = 32 := rfl

def block1944 : ℕ → Option IntervalDyadic := segment 249 values1944

theorem block1944_domain : ExactDomain block1944 249 281 := by
  simpa only [values1944_size] using segment_domain 249 values1944

theorem block1944_get (i : Fin 32) :
    block1944 (249 + i.val) = some (values1944[i.val]'(by rw [values1944_size]; exact i.isLt)) := by
  exact segment_get 249 values1944 ⟨i.val, by rw [values1944_size]; exact i.isLt⟩

def values1945 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1945.coefficient186_281,
  OriginalRow227TriangleData1945.coefficient186_282,
  OriginalRow227TriangleData1945.coefficient186_283,
  OriginalRow227TriangleData1945.coefficient186_284,
  OriginalRow227TriangleData1945.coefficient186_285,
  OriginalRow227TriangleData1945.coefficient186_286,
  OriginalRow227TriangleData1945.coefficient186_287,
  OriginalRow227TriangleData1945.coefficient186_288,
  OriginalRow227TriangleData1945.coefficient186_289,
  OriginalRow227TriangleData1945.coefficient186_290,
  OriginalRow227TriangleData1945.coefficient186_291,
  OriginalRow227TriangleData1945.coefficient186_292,
  OriginalRow227TriangleData1945.coefficient186_293,
  OriginalRow227TriangleData1945.coefficient186_294,
  OriginalRow227TriangleData1945.coefficient186_295,
  OriginalRow227TriangleData1945.coefficient186_296,
  OriginalRow227TriangleData1945.coefficient186_297,
  OriginalRow227TriangleData1945.coefficient186_298,
  OriginalRow227TriangleData1945.coefficient186_299,
  OriginalRow227TriangleData1945.coefficient186_300,
  OriginalRow227TriangleData1945.coefficient186_301,
  OriginalRow227TriangleData1945.coefficient186_302,
  OriginalRow227TriangleData1945.coefficient186_303,
  OriginalRow227TriangleData1945.coefficient186_304,
  OriginalRow227TriangleData1945.coefficient186_305,
  OriginalRow227TriangleData1945.coefficient186_306,
  OriginalRow227TriangleData1945.coefficient186_307,
  OriginalRow227TriangleData1945.coefficient186_308,
  OriginalRow227TriangleData1945.coefficient186_309,
  OriginalRow227TriangleData1945.coefficient186_310,
  OriginalRow227TriangleData1945.coefficient186_311,
  OriginalRow227TriangleData1945.coefficient186_312
]

theorem values1945_size : values1945.size = 32 := rfl

def block1945 : ℕ → Option IntervalDyadic := segment 281 values1945

theorem block1945_domain : ExactDomain block1945 281 313 := by
  simpa only [values1945_size] using segment_domain 281 values1945

theorem block1945_get (i : Fin 32) :
    block1945 (281 + i.val) = some (values1945[i.val]'(by rw [values1945_size]; exact i.isLt)) := by
  exact segment_get 281 values1945 ⟨i.val, by rw [values1945_size]; exact i.isLt⟩

def values1946 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1946.coefficient186_313,
  OriginalRow227TriangleData1946.coefficient186_314,
  OriginalRow227TriangleData1946.coefficient186_315
]

theorem values1946_size : values1946.size = 3 := rfl

def block1946 : ℕ → Option IntervalDyadic := segment 313 values1946

theorem block1946_domain : ExactDomain block1946 313 316 := by
  simpa only [values1946_size] using segment_domain 313 values1946

theorem block1946_get (i : Fin 3) :
    block1946 (313 + i.val) = some (values1946[i.val]'(by rw [values1946_size]; exact i.isLt)) := by
  exact segment_get 313 values1946 ⟨i.val, by rw [values1946_size]; exact i.isLt⟩

def node0185_0249 : ℕ → Option IntervalDyadic := split 217 block1942 block1943

theorem node0185_0249_domain : ExactDomain node0185_0249 185 249 := by
  exact split_domain (by decide) (by decide) block1942_domain block1943_domain

def node0281_0316 : ℕ → Option IntervalDyadic := split 313 block1945 block1946

theorem node0281_0316_domain : ExactDomain node0281_0316 281 316 := by
  exact split_domain (by decide) (by decide) block1945_domain block1946_domain

def node0249_0316 : ℕ → Option IntervalDyadic := split 281 block1944 node0281_0316

theorem node0249_0316_domain : ExactDomain node0249_0316 249 316 := by
  exact split_domain (by decide) (by decide) block1944_domain node0281_0316_domain

def node0185_0316 : ℕ → Option IntervalDyadic := split 249 node0185_0249 node0249_0316

theorem node0185_0316_domain : ExactDomain node0185_0316 185 316 := by
  exact split_domain (by decide) (by decide) node0185_0249_domain node0249_0316_domain

def lookup : ℕ → Option IntervalDyadic := node0185_0316

theorem lookup_domain : ExactDomain lookup 185 316 :=
  node0185_0316_domain

theorem block1942_lookup (i : Fin 32) :
    lookup (185 + i.val) = some (values1942[i.val]'(by rw [values1942_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0185_0316 (185 + i.val) = _
  rw [node0185_0316, split_left 249 node0185_0249 node0249_0316 (by omega)]
  rw [node0185_0249, split_left 217 block1942 block1943 (by omega)]
  exact block1942_get i

theorem block1943_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values1943[i.val]'(by rw [values1943_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0185_0316 (217 + i.val) = _
  rw [node0185_0316, split_left 249 node0185_0249 node0249_0316 (by omega)]
  rw [node0185_0249, split_right 217 block1942 block1943 (by omega)]
  exact block1943_get i

theorem block1944_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values1944[i.val]'(by rw [values1944_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0185_0316 (249 + i.val) = _
  rw [node0185_0316, split_right 249 node0185_0249 node0249_0316 (by omega)]
  rw [node0249_0316, split_left 281 block1944 node0281_0316 (by omega)]
  exact block1944_get i

theorem block1945_lookup (i : Fin 32) :
    lookup (281 + i.val) = some (values1945[i.val]'(by rw [values1945_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0185_0316 (281 + i.val) = _
  rw [node0185_0316, split_right 249 node0185_0249 node0249_0316 (by omega)]
  rw [node0249_0316, split_right 281 block1944 node0281_0316 (by omega)]
  rw [node0281_0316, split_left 313 block1945 block1946 (by omega)]
  exact block1945_get i

theorem block1946_lookup (i : Fin 3) :
    lookup (313 + i.val) = some (values1946[i.val]'(by rw [values1946_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0185_0316 (313 + i.val) = _
  rw [node0185_0316, split_right 249 node0185_0249 node0249_0316 (by omega)]
  rw [node0249_0316, split_right 281 block1944 node0281_0316 (by omega)]
  rw [node0281_0316, split_right 313 block1945 block1946 (by omega)]
  exact block1946_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1942_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1942_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1943_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1943_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1944_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1944_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1945_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1945_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1946_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1946_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1942_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1943_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1944_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1945_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow186.block1946_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow186
