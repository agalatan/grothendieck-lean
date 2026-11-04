import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2086
import Grothe.UpperChaos.OriginalRow227TriangleData2087

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow231

open ConditionalTableLookup

def values2086 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2086.coefficient231_230,
  OriginalRow227TriangleData2086.coefficient231_231,
  OriginalRow227TriangleData2086.coefficient231_232,
  OriginalRow227TriangleData2086.coefficient231_233,
  OriginalRow227TriangleData2086.coefficient231_234,
  OriginalRow227TriangleData2086.coefficient231_235,
  OriginalRow227TriangleData2086.coefficient231_236,
  OriginalRow227TriangleData2086.coefficient231_237,
  OriginalRow227TriangleData2086.coefficient231_238,
  OriginalRow227TriangleData2086.coefficient231_239,
  OriginalRow227TriangleData2086.coefficient231_240,
  OriginalRow227TriangleData2086.coefficient231_241,
  OriginalRow227TriangleData2086.coefficient231_242,
  OriginalRow227TriangleData2086.coefficient231_243,
  OriginalRow227TriangleData2086.coefficient231_244,
  OriginalRow227TriangleData2086.coefficient231_245,
  OriginalRow227TriangleData2086.coefficient231_246,
  OriginalRow227TriangleData2086.coefficient231_247,
  OriginalRow227TriangleData2086.coefficient231_248,
  OriginalRow227TriangleData2086.coefficient231_249,
  OriginalRow227TriangleData2086.coefficient231_250,
  OriginalRow227TriangleData2086.coefficient231_251,
  OriginalRow227TriangleData2086.coefficient231_252,
  OriginalRow227TriangleData2086.coefficient231_253,
  OriginalRow227TriangleData2086.coefficient231_254,
  OriginalRow227TriangleData2086.coefficient231_255,
  OriginalRow227TriangleData2086.coefficient231_256,
  OriginalRow227TriangleData2086.coefficient231_257,
  OriginalRow227TriangleData2086.coefficient231_258,
  OriginalRow227TriangleData2086.coefficient231_259,
  OriginalRow227TriangleData2086.coefficient231_260,
  OriginalRow227TriangleData2086.coefficient231_261
]

theorem values2086_size : values2086.size = 32 := rfl

def block2086 : ℕ → Option IntervalDyadic := segment 230 values2086

theorem block2086_domain : ExactDomain block2086 230 262 := by
  simpa only [values2086_size] using segment_domain 230 values2086

theorem block2086_get (i : Fin 32) :
    block2086 (230 + i.val) = some (values2086[i.val]'(by rw [values2086_size]; exact i.isLt)) := by
  exact segment_get 230 values2086 ⟨i.val, by rw [values2086_size]; exact i.isLt⟩

def values2087 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2087.coefficient231_262,
  OriginalRow227TriangleData2087.coefficient231_263,
  OriginalRow227TriangleData2087.coefficient231_264,
  OriginalRow227TriangleData2087.coefficient231_265,
  OriginalRow227TriangleData2087.coefficient231_266,
  OriginalRow227TriangleData2087.coefficient231_267,
  OriginalRow227TriangleData2087.coefficient231_268,
  OriginalRow227TriangleData2087.coefficient231_269,
  OriginalRow227TriangleData2087.coefficient231_270
]

theorem values2087_size : values2087.size = 9 := rfl

def block2087 : ℕ → Option IntervalDyadic := segment 262 values2087

theorem block2087_domain : ExactDomain block2087 262 271 := by
  simpa only [values2087_size] using segment_domain 262 values2087

theorem block2087_get (i : Fin 9) :
    block2087 (262 + i.val) = some (values2087[i.val]'(by rw [values2087_size]; exact i.isLt)) := by
  exact segment_get 262 values2087 ⟨i.val, by rw [values2087_size]; exact i.isLt⟩

def node0230_0271 : ℕ → Option IntervalDyadic := split 262 block2086 block2087

theorem node0230_0271_domain : ExactDomain node0230_0271 230 271 := by
  exact split_domain (by decide) (by decide) block2086_domain block2087_domain

def lookup : ℕ → Option IntervalDyadic := node0230_0271

theorem lookup_domain : ExactDomain lookup 230 271 :=
  node0230_0271_domain

theorem block2086_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values2086[i.val]'(by rw [values2086_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0230_0271 (230 + i.val) = _
  rw [node0230_0271, split_left 262 block2086 block2087 (by omega)]
  exact block2086_get i

theorem block2087_lookup (i : Fin 9) :
    lookup (262 + i.val) = some (values2087[i.val]'(by rw [values2087_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0230_0271 (262 + i.val) = _
  rw [node0230_0271, split_right 262 block2086 block2087 (by omega)]
  exact block2087_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.block2086_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.block2086_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.block2087_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.block2087_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.block2086_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow231.block2087_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow231
