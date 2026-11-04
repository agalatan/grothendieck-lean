import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2055
import Grothe.UpperChaos.OriginalRow227TriangleData2056
import Grothe.UpperChaos.OriginalRow227TriangleData2057

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow217

open ConditionalTableLookup

def values2055 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2055.coefficient217_216,
  OriginalRow227TriangleData2055.coefficient217_217,
  OriginalRow227TriangleData2055.coefficient217_218,
  OriginalRow227TriangleData2055.coefficient217_219,
  OriginalRow227TriangleData2055.coefficient217_220,
  OriginalRow227TriangleData2055.coefficient217_221,
  OriginalRow227TriangleData2055.coefficient217_222,
  OriginalRow227TriangleData2055.coefficient217_223,
  OriginalRow227TriangleData2055.coefficient217_224,
  OriginalRow227TriangleData2055.coefficient217_225,
  OriginalRow227TriangleData2055.coefficient217_226,
  OriginalRow227TriangleData2055.coefficient217_227,
  OriginalRow227TriangleData2055.coefficient217_228,
  OriginalRow227TriangleData2055.coefficient217_229,
  OriginalRow227TriangleData2055.coefficient217_230,
  OriginalRow227TriangleData2055.coefficient217_231,
  OriginalRow227TriangleData2055.coefficient217_232,
  OriginalRow227TriangleData2055.coefficient217_233,
  OriginalRow227TriangleData2055.coefficient217_234,
  OriginalRow227TriangleData2055.coefficient217_235,
  OriginalRow227TriangleData2055.coefficient217_236,
  OriginalRow227TriangleData2055.coefficient217_237,
  OriginalRow227TriangleData2055.coefficient217_238,
  OriginalRow227TriangleData2055.coefficient217_239,
  OriginalRow227TriangleData2055.coefficient217_240,
  OriginalRow227TriangleData2055.coefficient217_241,
  OriginalRow227TriangleData2055.coefficient217_242,
  OriginalRow227TriangleData2055.coefficient217_243,
  OriginalRow227TriangleData2055.coefficient217_244,
  OriginalRow227TriangleData2055.coefficient217_245,
  OriginalRow227TriangleData2055.coefficient217_246,
  OriginalRow227TriangleData2055.coefficient217_247
]

theorem values2055_size : values2055.size = 32 := rfl

def block2055 : ℕ → Option IntervalDyadic := segment 216 values2055

theorem block2055_domain : ExactDomain block2055 216 248 := by
  simpa only [values2055_size] using segment_domain 216 values2055

theorem block2055_get (i : Fin 32) :
    block2055 (216 + i.val) = some (values2055[i.val]'(by rw [values2055_size]; exact i.isLt)) := by
  exact segment_get 216 values2055 ⟨i.val, by rw [values2055_size]; exact i.isLt⟩

def values2056 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2056.coefficient217_248,
  OriginalRow227TriangleData2056.coefficient217_249,
  OriginalRow227TriangleData2056.coefficient217_250,
  OriginalRow227TriangleData2056.coefficient217_251,
  OriginalRow227TriangleData2056.coefficient217_252,
  OriginalRow227TriangleData2056.coefficient217_253,
  OriginalRow227TriangleData2056.coefficient217_254,
  OriginalRow227TriangleData2056.coefficient217_255,
  OriginalRow227TriangleData2056.coefficient217_256,
  OriginalRow227TriangleData2056.coefficient217_257,
  OriginalRow227TriangleData2056.coefficient217_258,
  OriginalRow227TriangleData2056.coefficient217_259,
  OriginalRow227TriangleData2056.coefficient217_260,
  OriginalRow227TriangleData2056.coefficient217_261,
  OriginalRow227TriangleData2056.coefficient217_262,
  OriginalRow227TriangleData2056.coefficient217_263,
  OriginalRow227TriangleData2056.coefficient217_264,
  OriginalRow227TriangleData2056.coefficient217_265,
  OriginalRow227TriangleData2056.coefficient217_266,
  OriginalRow227TriangleData2056.coefficient217_267,
  OriginalRow227TriangleData2056.coefficient217_268,
  OriginalRow227TriangleData2056.coefficient217_269,
  OriginalRow227TriangleData2056.coefficient217_270,
  OriginalRow227TriangleData2056.coefficient217_271,
  OriginalRow227TriangleData2056.coefficient217_272,
  OriginalRow227TriangleData2056.coefficient217_273,
  OriginalRow227TriangleData2056.coefficient217_274,
  OriginalRow227TriangleData2056.coefficient217_275,
  OriginalRow227TriangleData2056.coefficient217_276,
  OriginalRow227TriangleData2056.coefficient217_277,
  OriginalRow227TriangleData2056.coefficient217_278,
  OriginalRow227TriangleData2056.coefficient217_279
]

theorem values2056_size : values2056.size = 32 := rfl

def block2056 : ℕ → Option IntervalDyadic := segment 248 values2056

theorem block2056_domain : ExactDomain block2056 248 280 := by
  simpa only [values2056_size] using segment_domain 248 values2056

theorem block2056_get (i : Fin 32) :
    block2056 (248 + i.val) = some (values2056[i.val]'(by rw [values2056_size]; exact i.isLt)) := by
  exact segment_get 248 values2056 ⟨i.val, by rw [values2056_size]; exact i.isLt⟩

def values2057 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2057.coefficient217_280,
  OriginalRow227TriangleData2057.coefficient217_281,
  OriginalRow227TriangleData2057.coefficient217_282,
  OriginalRow227TriangleData2057.coefficient217_283,
  OriginalRow227TriangleData2057.coefficient217_284
]

theorem values2057_size : values2057.size = 5 := rfl

def block2057 : ℕ → Option IntervalDyadic := segment 280 values2057

theorem block2057_domain : ExactDomain block2057 280 285 := by
  simpa only [values2057_size] using segment_domain 280 values2057

theorem block2057_get (i : Fin 5) :
    block2057 (280 + i.val) = some (values2057[i.val]'(by rw [values2057_size]; exact i.isLt)) := by
  exact segment_get 280 values2057 ⟨i.val, by rw [values2057_size]; exact i.isLt⟩

def node0248_0285 : ℕ → Option IntervalDyadic := split 280 block2056 block2057

theorem node0248_0285_domain : ExactDomain node0248_0285 248 285 := by
  exact split_domain (by decide) (by decide) block2056_domain block2057_domain

def node0216_0285 : ℕ → Option IntervalDyadic := split 248 block2055 node0248_0285

theorem node0216_0285_domain : ExactDomain node0216_0285 216 285 := by
  exact split_domain (by decide) (by decide) block2055_domain node0248_0285_domain

def lookup : ℕ → Option IntervalDyadic := node0216_0285

theorem lookup_domain : ExactDomain lookup 216 285 :=
  node0216_0285_domain

theorem block2055_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values2055[i.val]'(by rw [values2055_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0216_0285 (216 + i.val) = _
  rw [node0216_0285, split_left 248 block2055 node0248_0285 (by omega)]
  exact block2055_get i

theorem block2056_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values2056[i.val]'(by rw [values2056_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0216_0285 (248 + i.val) = _
  rw [node0216_0285, split_right 248 block2055 node0248_0285 (by omega)]
  rw [node0248_0285, split_left 280 block2056 block2057 (by omega)]
  exact block2056_get i

theorem block2057_lookup (i : Fin 5) :
    lookup (280 + i.val) = some (values2057[i.val]'(by rw [values2057_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0216_0285 (280 + i.val) = _
  rw [node0216_0285, split_right 248 block2055 node0248_0285 (by omega)]
  rw [node0248_0285, split_right 280 block2056 block2057 (by omega)]
  exact block2057_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2055_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2055_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2056_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2056_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2057_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2057_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2055_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2056_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow217.block2057_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow217
