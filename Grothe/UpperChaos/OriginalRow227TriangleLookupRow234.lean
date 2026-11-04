import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2092
import Grothe.UpperChaos.OriginalRow227TriangleData2093

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow234

open ConditionalTableLookup

def values2092 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2092.coefficient234_233,
  OriginalRow227TriangleData2092.coefficient234_234,
  OriginalRow227TriangleData2092.coefficient234_235,
  OriginalRow227TriangleData2092.coefficient234_236,
  OriginalRow227TriangleData2092.coefficient234_237,
  OriginalRow227TriangleData2092.coefficient234_238,
  OriginalRow227TriangleData2092.coefficient234_239,
  OriginalRow227TriangleData2092.coefficient234_240,
  OriginalRow227TriangleData2092.coefficient234_241,
  OriginalRow227TriangleData2092.coefficient234_242,
  OriginalRow227TriangleData2092.coefficient234_243,
  OriginalRow227TriangleData2092.coefficient234_244,
  OriginalRow227TriangleData2092.coefficient234_245,
  OriginalRow227TriangleData2092.coefficient234_246,
  OriginalRow227TriangleData2092.coefficient234_247,
  OriginalRow227TriangleData2092.coefficient234_248,
  OriginalRow227TriangleData2092.coefficient234_249,
  OriginalRow227TriangleData2092.coefficient234_250,
  OriginalRow227TriangleData2092.coefficient234_251,
  OriginalRow227TriangleData2092.coefficient234_252,
  OriginalRow227TriangleData2092.coefficient234_253,
  OriginalRow227TriangleData2092.coefficient234_254,
  OriginalRow227TriangleData2092.coefficient234_255,
  OriginalRow227TriangleData2092.coefficient234_256,
  OriginalRow227TriangleData2092.coefficient234_257,
  OriginalRow227TriangleData2092.coefficient234_258,
  OriginalRow227TriangleData2092.coefficient234_259,
  OriginalRow227TriangleData2092.coefficient234_260,
  OriginalRow227TriangleData2092.coefficient234_261,
  OriginalRow227TriangleData2092.coefficient234_262,
  OriginalRow227TriangleData2092.coefficient234_263,
  OriginalRow227TriangleData2092.coefficient234_264
]

theorem values2092_size : values2092.size = 32 := rfl

def block2092 : ℕ → Option IntervalDyadic := segment 233 values2092

theorem block2092_domain : ExactDomain block2092 233 265 := by
  simpa only [values2092_size] using segment_domain 233 values2092

theorem block2092_get (i : Fin 32) :
    block2092 (233 + i.val) = some (values2092[i.val]'(by rw [values2092_size]; exact i.isLt)) := by
  exact segment_get 233 values2092 ⟨i.val, by rw [values2092_size]; exact i.isLt⟩

def values2093 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2093.coefficient234_265,
  OriginalRow227TriangleData2093.coefficient234_266,
  OriginalRow227TriangleData2093.coefficient234_267
]

theorem values2093_size : values2093.size = 3 := rfl

def block2093 : ℕ → Option IntervalDyadic := segment 265 values2093

theorem block2093_domain : ExactDomain block2093 265 268 := by
  simpa only [values2093_size] using segment_domain 265 values2093

theorem block2093_get (i : Fin 3) :
    block2093 (265 + i.val) = some (values2093[i.val]'(by rw [values2093_size]; exact i.isLt)) := by
  exact segment_get 265 values2093 ⟨i.val, by rw [values2093_size]; exact i.isLt⟩

def node0233_0268 : ℕ → Option IntervalDyadic := split 265 block2092 block2093

theorem node0233_0268_domain : ExactDomain node0233_0268 233 268 := by
  exact split_domain (by decide) (by decide) block2092_domain block2093_domain

def lookup : ℕ → Option IntervalDyadic := node0233_0268

theorem lookup_domain : ExactDomain lookup 233 268 :=
  node0233_0268_domain

theorem block2092_lookup (i : Fin 32) :
    lookup (233 + i.val) = some (values2092[i.val]'(by rw [values2092_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0233_0268 (233 + i.val) = _
  rw [node0233_0268, split_left 265 block2092 block2093 (by omega)]
  exact block2092_get i

theorem block2093_lookup (i : Fin 3) :
    lookup (265 + i.val) = some (values2093[i.val]'(by rw [values2093_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0233_0268 (265 + i.val) = _
  rw [node0233_0268, split_right 265 block2092 block2093 (by omega)]
  exact block2093_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.block2092_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.block2092_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.block2093_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.block2093_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.block2092_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow234.block2093_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow234
