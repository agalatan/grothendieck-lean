import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2109

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow249

open ConditionalTableLookup

def values2109 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2109.coefficient249_248,
  OriginalRow227TriangleData2109.coefficient249_249,
  OriginalRow227TriangleData2109.coefficient249_250,
  OriginalRow227TriangleData2109.coefficient249_251,
  OriginalRow227TriangleData2109.coefficient249_252
]

theorem values2109_size : values2109.size = 5 := rfl

def block2109 : ℕ → Option IntervalDyadic := segment 248 values2109

theorem block2109_domain : ExactDomain block2109 248 253 := by
  simpa only [values2109_size] using segment_domain 248 values2109

theorem block2109_get (i : Fin 5) :
    block2109 (248 + i.val) = some (values2109[i.val]'(by rw [values2109_size]; exact i.isLt)) := by
  exact segment_get 248 values2109 ⟨i.val, by rw [values2109_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2109

theorem lookup_domain : ExactDomain lookup 248 253 :=
  block2109_domain

theorem block2109_lookup (i : Fin 5) :
    lookup (248 + i.val) = some (values2109[i.val]'(by rw [values2109_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2109 (248 + i.val) = _
  exact block2109_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow249.block2109_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow249.block2109_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow249.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow249.block2109_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow249
