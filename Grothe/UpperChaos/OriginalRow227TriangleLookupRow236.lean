import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2096

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow236

open ConditionalTableLookup

def values2096 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2096.coefficient236_235,
  OriginalRow227TriangleData2096.coefficient236_236,
  OriginalRow227TriangleData2096.coefficient236_237,
  OriginalRow227TriangleData2096.coefficient236_238,
  OriginalRow227TriangleData2096.coefficient236_239,
  OriginalRow227TriangleData2096.coefficient236_240,
  OriginalRow227TriangleData2096.coefficient236_241,
  OriginalRow227TriangleData2096.coefficient236_242,
  OriginalRow227TriangleData2096.coefficient236_243,
  OriginalRow227TriangleData2096.coefficient236_244,
  OriginalRow227TriangleData2096.coefficient236_245,
  OriginalRow227TriangleData2096.coefficient236_246,
  OriginalRow227TriangleData2096.coefficient236_247,
  OriginalRow227TriangleData2096.coefficient236_248,
  OriginalRow227TriangleData2096.coefficient236_249,
  OriginalRow227TriangleData2096.coefficient236_250,
  OriginalRow227TriangleData2096.coefficient236_251,
  OriginalRow227TriangleData2096.coefficient236_252,
  OriginalRow227TriangleData2096.coefficient236_253,
  OriginalRow227TriangleData2096.coefficient236_254,
  OriginalRow227TriangleData2096.coefficient236_255,
  OriginalRow227TriangleData2096.coefficient236_256,
  OriginalRow227TriangleData2096.coefficient236_257,
  OriginalRow227TriangleData2096.coefficient236_258,
  OriginalRow227TriangleData2096.coefficient236_259,
  OriginalRow227TriangleData2096.coefficient236_260,
  OriginalRow227TriangleData2096.coefficient236_261,
  OriginalRow227TriangleData2096.coefficient236_262,
  OriginalRow227TriangleData2096.coefficient236_263,
  OriginalRow227TriangleData2096.coefficient236_264,
  OriginalRow227TriangleData2096.coefficient236_265
]

theorem values2096_size : values2096.size = 31 := rfl

def block2096 : ℕ → Option IntervalDyadic := segment 235 values2096

theorem block2096_domain : ExactDomain block2096 235 266 := by
  simpa only [values2096_size] using segment_domain 235 values2096

theorem block2096_get (i : Fin 31) :
    block2096 (235 + i.val) = some (values2096[i.val]'(by rw [values2096_size]; exact i.isLt)) := by
  exact segment_get 235 values2096 ⟨i.val, by rw [values2096_size]; exact i.isLt⟩

def lookup : ℕ → Option IntervalDyadic := block2096

theorem lookup_domain : ExactDomain lookup 235 266 :=
  block2096_domain

theorem block2096_lookup (i : Fin 31) :
    lookup (235 + i.val) = some (values2096[i.val]'(by rw [values2096_size]; exact i.isLt)) := by
  have hi := i.isLt
  change block2096 (235 + i.val) = _
  exact block2096_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow236.block2096_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow236.block2096_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow236.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow236.block2096_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow236
