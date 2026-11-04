import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2098

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow238

open ConditionalTableLookup

def values2098 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2098.coefficient238_237,
  OriginalRow227TriangleData2098.coefficient238_238,
  OriginalRow227TriangleData2098.coefficient238_239,
  OriginalRow227TriangleData2098.coefficient238_240,
  OriginalRow227TriangleData2098.coefficient238_241,
  OriginalRow227TriangleData2098.coefficient238_242,
  OriginalRow227TriangleData2098.coefficient238_243,
  OriginalRow227TriangleData2098.coefficient238_244,
  OriginalRow227TriangleData2098.coefficient238_245,
  OriginalRow227TriangleData2098.coefficient238_246,
  OriginalRow227TriangleData2098.coefficient238_247,
  OriginalRow227TriangleData2098.coefficient238_248,
  OriginalRow227TriangleData2098.coefficient238_249,
  OriginalRow227TriangleData2098.coefficient238_250,
  OriginalRow227TriangleData2098.coefficient238_251,
  OriginalRow227TriangleData2098.coefficient238_252,
  OriginalRow227TriangleData2098.coefficient238_253,
  OriginalRow227TriangleData2098.coefficient238_254,
  OriginalRow227TriangleData2098.coefficient238_255,
  OriginalRow227TriangleData2098.coefficient238_256,
  OriginalRow227TriangleData2098.coefficient238_257,
  OriginalRow227TriangleData2098.coefficient238_258,
  OriginalRow227TriangleData2098.coefficient238_259,
  OriginalRow227TriangleData2098.coefficient238_260,
  OriginalRow227TriangleData2098.coefficient238_261,
  OriginalRow227TriangleData2098.coefficient238_262,
  OriginalRow227TriangleData2098.coefficient238_263
]

theorem values2098_size : values2098.size = 27 := rfl

def block2098 : ℕ → Option IntervalDyadic := segment 237 values2098

theorem block2098_domain : ExactDomain block2098 237 264 := by
  simpa only [values2098_size] using segment_domain 237 values2098

theorem block2098_get (i : Fin 27) :
    block2098 (237 + i.val) = some (values2098[i.val]'(by rw [values2098_size]; exact i.isLt)) := by
  exact segment_get 237 values2098 ⟨i.val, by rw [values2098_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2098

theorem lookup_domain : ExactDomain lookup 237 264 :=
  block2098_domain

theorem block2098_lookup (i : Fin 27) :
    lookup (237 + i.val) = some (values2098[i.val]'(by rw [values2098_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2098 (237 + i.val) = _
  exact block2098_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow238.block2098_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow238.block2098_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow238.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow238.block2098_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow238
