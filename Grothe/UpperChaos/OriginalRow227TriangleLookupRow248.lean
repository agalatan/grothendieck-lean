import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2108

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow248

open ConditionalTableLookup

def values2108 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2108.coefficient248_247,
  OriginalRow227TriangleData2108.coefficient248_248,
  OriginalRow227TriangleData2108.coefficient248_249,
  OriginalRow227TriangleData2108.coefficient248_250,
  OriginalRow227TriangleData2108.coefficient248_251,
  OriginalRow227TriangleData2108.coefficient248_252,
  OriginalRow227TriangleData2108.coefficient248_253
]

theorem values2108_size : values2108.size = 7 := rfl

def block2108 : ℕ → Option IntervalDyadic := segment 247 values2108

theorem block2108_domain : ExactDomain block2108 247 254 := by
  simpa only [values2108_size] using segment_domain 247 values2108

theorem block2108_get (i : Fin 7) :
    block2108 (247 + i.val) = some (values2108[i.val]'(by rw [values2108_size]; exact i.isLt)) := by
  exact segment_get 247 values2108 ⟨i.val, by rw [values2108_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2108

theorem lookup_domain : ExactDomain lookup 247 254 :=
  block2108_domain

theorem block2108_lookup (i : Fin 7) :
    lookup (247 + i.val) = some (values2108[i.val]'(by rw [values2108_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2108 (247 + i.val) = _
  exact block2108_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow248.block2108_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow248.block2108_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow248.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow248.block2108_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow248
