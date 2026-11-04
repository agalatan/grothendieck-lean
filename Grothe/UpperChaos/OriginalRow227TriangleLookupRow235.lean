import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2094
import Grothe.UpperChaos.OriginalRow227TriangleData2095

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow235

open ConditionalTableLookup

def values2094 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2094.coefficient235_234,
  OriginalRow227TriangleData2094.coefficient235_235,
  OriginalRow227TriangleData2094.coefficient235_236,
  OriginalRow227TriangleData2094.coefficient235_237,
  OriginalRow227TriangleData2094.coefficient235_238,
  OriginalRow227TriangleData2094.coefficient235_239,
  OriginalRow227TriangleData2094.coefficient235_240,
  OriginalRow227TriangleData2094.coefficient235_241,
  OriginalRow227TriangleData2094.coefficient235_242,
  OriginalRow227TriangleData2094.coefficient235_243,
  OriginalRow227TriangleData2094.coefficient235_244,
  OriginalRow227TriangleData2094.coefficient235_245,
  OriginalRow227TriangleData2094.coefficient235_246,
  OriginalRow227TriangleData2094.coefficient235_247,
  OriginalRow227TriangleData2094.coefficient235_248,
  OriginalRow227TriangleData2094.coefficient235_249,
  OriginalRow227TriangleData2094.coefficient235_250,
  OriginalRow227TriangleData2094.coefficient235_251,
  OriginalRow227TriangleData2094.coefficient235_252,
  OriginalRow227TriangleData2094.coefficient235_253,
  OriginalRow227TriangleData2094.coefficient235_254,
  OriginalRow227TriangleData2094.coefficient235_255,
  OriginalRow227TriangleData2094.coefficient235_256,
  OriginalRow227TriangleData2094.coefficient235_257,
  OriginalRow227TriangleData2094.coefficient235_258,
  OriginalRow227TriangleData2094.coefficient235_259,
  OriginalRow227TriangleData2094.coefficient235_260,
  OriginalRow227TriangleData2094.coefficient235_261,
  OriginalRow227TriangleData2094.coefficient235_262,
  OriginalRow227TriangleData2094.coefficient235_263,
  OriginalRow227TriangleData2094.coefficient235_264,
  OriginalRow227TriangleData2094.coefficient235_265
]

theorem values2094_size : values2094.size = 32 := rfl

def block2094 : ℕ → Option IntervalDyadic := segment 234 values2094

theorem block2094_domain : ExactDomain block2094 234 266 := by
  simpa only [values2094_size] using segment_domain 234 values2094

theorem block2094_get (i : Fin 32) :
    block2094 (234 + i.val) = some (values2094[i.val]'(by rw [values2094_size]; exact i.isLt)) := by
  exact segment_get 234 values2094 ⟨i.val, by rw [values2094_size]; exact i.isLt⟩

def values2095 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2095.coefficient235_266
]

theorem values2095_size : values2095.size = 1 := rfl

def block2095 : ℕ → Option IntervalDyadic := segment 266 values2095

theorem block2095_domain : ExactDomain block2095 266 267 := by
  simpa only [values2095_size] using segment_domain 266 values2095

theorem block2095_get (i : Fin 1) :
    block2095 (266 + i.val) = some (values2095[i.val]'(by rw [values2095_size]; exact i.isLt)) := by
  exact segment_get 266 values2095 ⟨i.val, by rw [values2095_size]; exact i.isLt⟩

def node0234_0267 : ℕ → Option IntervalDyadic := split 266 block2094 block2095

theorem node0234_0267_domain : ExactDomain node0234_0267 234 267 := by
  exact split_domain (by decide) (by decide) block2094_domain block2095_domain

def lookup : ℕ → Option IntervalDyadic := node0234_0267

theorem lookup_domain : ExactDomain lookup 234 267 :=
  node0234_0267_domain

theorem block2094_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values2094[i.val]'(by rw [values2094_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0234_0267 (234 + i.val) = _
  rw [node0234_0267, split_left 266 block2094 block2095 (by omega)]
  exact block2094_get i

theorem block2095_lookup (i : Fin 1) :
    lookup (266 + i.val) = some (values2095[i.val]'(by rw [values2095_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0234_0267 (266 + i.val) = _
  rw [node0234_0267, split_right 266 block2094 block2095 (by omega)]
  exact block2095_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.block2094_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.block2094_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.block2095_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.block2095_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.block2094_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow235.block2095_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow235
