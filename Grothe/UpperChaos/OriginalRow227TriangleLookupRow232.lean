import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2088
import Grothe.UpperChaos.OriginalRow227TriangleData2089

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow232

open ConditionalTableLookup

def values2088 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2088.coefficient232_231,
  OriginalRow227TriangleData2088.coefficient232_232,
  OriginalRow227TriangleData2088.coefficient232_233,
  OriginalRow227TriangleData2088.coefficient232_234,
  OriginalRow227TriangleData2088.coefficient232_235,
  OriginalRow227TriangleData2088.coefficient232_236,
  OriginalRow227TriangleData2088.coefficient232_237,
  OriginalRow227TriangleData2088.coefficient232_238,
  OriginalRow227TriangleData2088.coefficient232_239,
  OriginalRow227TriangleData2088.coefficient232_240,
  OriginalRow227TriangleData2088.coefficient232_241,
  OriginalRow227TriangleData2088.coefficient232_242,
  OriginalRow227TriangleData2088.coefficient232_243,
  OriginalRow227TriangleData2088.coefficient232_244,
  OriginalRow227TriangleData2088.coefficient232_245,
  OriginalRow227TriangleData2088.coefficient232_246,
  OriginalRow227TriangleData2088.coefficient232_247,
  OriginalRow227TriangleData2088.coefficient232_248,
  OriginalRow227TriangleData2088.coefficient232_249,
  OriginalRow227TriangleData2088.coefficient232_250,
  OriginalRow227TriangleData2088.coefficient232_251,
  OriginalRow227TriangleData2088.coefficient232_252,
  OriginalRow227TriangleData2088.coefficient232_253,
  OriginalRow227TriangleData2088.coefficient232_254,
  OriginalRow227TriangleData2088.coefficient232_255,
  OriginalRow227TriangleData2088.coefficient232_256,
  OriginalRow227TriangleData2088.coefficient232_257,
  OriginalRow227TriangleData2088.coefficient232_258,
  OriginalRow227TriangleData2088.coefficient232_259,
  OriginalRow227TriangleData2088.coefficient232_260,
  OriginalRow227TriangleData2088.coefficient232_261,
  OriginalRow227TriangleData2088.coefficient232_262
]

theorem values2088_size : values2088.size = 32 := rfl

def block2088 : ℕ → Option IntervalDyadic := segment 231 values2088

theorem block2088_domain : ExactDomain block2088 231 263 := by
  simpa only [values2088_size] using segment_domain 231 values2088

theorem block2088_get (i : Fin 32) :
    block2088 (231 + i.val) = some (values2088[i.val]'(by rw [values2088_size]; exact i.isLt)) := by
  exact segment_get 231 values2088 ⟨i.val, by rw [values2088_size]; exact i.isLt⟩

def values2089 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2089.coefficient232_263,
  OriginalRow227TriangleData2089.coefficient232_264,
  OriginalRow227TriangleData2089.coefficient232_265,
  OriginalRow227TriangleData2089.coefficient232_266,
  OriginalRow227TriangleData2089.coefficient232_267,
  OriginalRow227TriangleData2089.coefficient232_268,
  OriginalRow227TriangleData2089.coefficient232_269
]

theorem values2089_size : values2089.size = 7 := rfl

def block2089 : ℕ → Option IntervalDyadic := segment 263 values2089

theorem block2089_domain : ExactDomain block2089 263 270 := by
  simpa only [values2089_size] using segment_domain 263 values2089

theorem block2089_get (i : Fin 7) :
    block2089 (263 + i.val) = some (values2089[i.val]'(by rw [values2089_size]; exact i.isLt)) := by
  exact segment_get 263 values2089 ⟨i.val, by rw [values2089_size]; exact i.isLt⟩

def node0231_0270 : ℕ → Option IntervalDyadic := split 263 block2088 block2089

theorem node0231_0270_domain : ExactDomain node0231_0270 231 270 := by
  exact split_domain (by decide) (by decide) block2088_domain block2089_domain

def lookup : ℕ → Option IntervalDyadic := node0231_0270

theorem lookup_domain : ExactDomain lookup 231 270 :=
  node0231_0270_domain

theorem block2088_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values2088[i.val]'(by rw [values2088_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0231_0270 (231 + i.val) = _
  rw [node0231_0270, split_left 263 block2088 block2089 (by omega)]
  exact block2088_get i

theorem block2089_lookup (i : Fin 7) :
    lookup (263 + i.val) = some (values2089[i.val]'(by rw [values2089_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0231_0270 (263 + i.val) = _
  rw [node0231_0270, split_right 263 block2088 block2089 (by omega)]
  exact block2089_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.block2088_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.block2088_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.block2089_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.block2089_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.block2088_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow232.block2089_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow232
