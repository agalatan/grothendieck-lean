import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2082
import Grothe.UpperChaos.OriginalRow227TriangleData2083

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow229

open ConditionalTableLookup

def values2082 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2082.coefficient229_228,
  OriginalRow227TriangleData2082.coefficient229_229,
  OriginalRow227TriangleData2082.coefficient229_230,
  OriginalRow227TriangleData2082.coefficient229_231,
  OriginalRow227TriangleData2082.coefficient229_232,
  OriginalRow227TriangleData2082.coefficient229_233,
  OriginalRow227TriangleData2082.coefficient229_234,
  OriginalRow227TriangleData2082.coefficient229_235,
  OriginalRow227TriangleData2082.coefficient229_236,
  OriginalRow227TriangleData2082.coefficient229_237,
  OriginalRow227TriangleData2082.coefficient229_238,
  OriginalRow227TriangleData2082.coefficient229_239,
  OriginalRow227TriangleData2082.coefficient229_240,
  OriginalRow227TriangleData2082.coefficient229_241,
  OriginalRow227TriangleData2082.coefficient229_242,
  OriginalRow227TriangleData2082.coefficient229_243,
  OriginalRow227TriangleData2082.coefficient229_244,
  OriginalRow227TriangleData2082.coefficient229_245,
  OriginalRow227TriangleData2082.coefficient229_246,
  OriginalRow227TriangleData2082.coefficient229_247,
  OriginalRow227TriangleData2082.coefficient229_248,
  OriginalRow227TriangleData2082.coefficient229_249,
  OriginalRow227TriangleData2082.coefficient229_250,
  OriginalRow227TriangleData2082.coefficient229_251,
  OriginalRow227TriangleData2082.coefficient229_252,
  OriginalRow227TriangleData2082.coefficient229_253,
  OriginalRow227TriangleData2082.coefficient229_254,
  OriginalRow227TriangleData2082.coefficient229_255,
  OriginalRow227TriangleData2082.coefficient229_256,
  OriginalRow227TriangleData2082.coefficient229_257,
  OriginalRow227TriangleData2082.coefficient229_258,
  OriginalRow227TriangleData2082.coefficient229_259
]

theorem values2082_size : values2082.size = 32 := rfl

def block2082 : ℕ → Option IntervalDyadic := segment 228 values2082

theorem block2082_domain : ExactDomain block2082 228 260 := by
  simpa only [values2082_size] using segment_domain 228 values2082

theorem block2082_get (i : Fin 32) :
    block2082 (228 + i.val) = some (values2082[i.val]'(by rw [values2082_size]; exact i.isLt)) := by
  exact segment_get 228 values2082 ⟨i.val, by rw [values2082_size]; exact i.isLt⟩

def values2083 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2083.coefficient229_260,
  OriginalRow227TriangleData2083.coefficient229_261,
  OriginalRow227TriangleData2083.coefficient229_262,
  OriginalRow227TriangleData2083.coefficient229_263,
  OriginalRow227TriangleData2083.coefficient229_264,
  OriginalRow227TriangleData2083.coefficient229_265,
  OriginalRow227TriangleData2083.coefficient229_266,
  OriginalRow227TriangleData2083.coefficient229_267,
  OriginalRow227TriangleData2083.coefficient229_268,
  OriginalRow227TriangleData2083.coefficient229_269,
  OriginalRow227TriangleData2083.coefficient229_270,
  OriginalRow227TriangleData2083.coefficient229_271,
  OriginalRow227TriangleData2083.coefficient229_272
]

theorem values2083_size : values2083.size = 13 := rfl

def block2083 : ℕ → Option IntervalDyadic := segment 260 values2083

theorem block2083_domain : ExactDomain block2083 260 273 := by
  simpa only [values2083_size] using segment_domain 260 values2083

theorem block2083_get (i : Fin 13) :
    block2083 (260 + i.val) = some (values2083[i.val]'(by rw [values2083_size]; exact i.isLt)) := by
  exact segment_get 260 values2083 ⟨i.val, by rw [values2083_size]; exact i.isLt⟩

def node0228_0273 : ℕ → Option IntervalDyadic := split 260 block2082 block2083

theorem node0228_0273_domain : ExactDomain node0228_0273 228 273 := by
  exact split_domain (by decide) (by decide) block2082_domain block2083_domain

def lookup : ℕ → Option IntervalDyadic := node0228_0273

theorem lookup_domain : ExactDomain lookup 228 273 :=
  node0228_0273_domain

theorem block2082_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values2082[i.val]'(by rw [values2082_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0228_0273 (228 + i.val) = _
  rw [node0228_0273, split_left 260 block2082 block2083 (by omega)]
  exact block2082_get i

theorem block2083_lookup (i : Fin 13) :
    lookup (260 + i.val) = some (values2083[i.val]'(by rw [values2083_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0228_0273 (260 + i.val) = _
  rw [node0228_0273, split_right 260 block2082 block2083 (by omega)]
  exact block2083_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.block2082_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.block2082_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.block2083_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.block2083_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.block2082_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow229.block2083_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow229
