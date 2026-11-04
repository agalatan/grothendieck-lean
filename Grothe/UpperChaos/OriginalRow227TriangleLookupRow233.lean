import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2090
import Grothe.UpperChaos.OriginalRow227TriangleData2091

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow233

open ConditionalTableLookup

def values2090 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2090.coefficient233_232,
  OriginalRow227TriangleData2090.coefficient233_233,
  OriginalRow227TriangleData2090.coefficient233_234,
  OriginalRow227TriangleData2090.coefficient233_235,
  OriginalRow227TriangleData2090.coefficient233_236,
  OriginalRow227TriangleData2090.coefficient233_237,
  OriginalRow227TriangleData2090.coefficient233_238,
  OriginalRow227TriangleData2090.coefficient233_239,
  OriginalRow227TriangleData2090.coefficient233_240,
  OriginalRow227TriangleData2090.coefficient233_241,
  OriginalRow227TriangleData2090.coefficient233_242,
  OriginalRow227TriangleData2090.coefficient233_243,
  OriginalRow227TriangleData2090.coefficient233_244,
  OriginalRow227TriangleData2090.coefficient233_245,
  OriginalRow227TriangleData2090.coefficient233_246,
  OriginalRow227TriangleData2090.coefficient233_247,
  OriginalRow227TriangleData2090.coefficient233_248,
  OriginalRow227TriangleData2090.coefficient233_249,
  OriginalRow227TriangleData2090.coefficient233_250,
  OriginalRow227TriangleData2090.coefficient233_251,
  OriginalRow227TriangleData2090.coefficient233_252,
  OriginalRow227TriangleData2090.coefficient233_253,
  OriginalRow227TriangleData2090.coefficient233_254,
  OriginalRow227TriangleData2090.coefficient233_255,
  OriginalRow227TriangleData2090.coefficient233_256,
  OriginalRow227TriangleData2090.coefficient233_257,
  OriginalRow227TriangleData2090.coefficient233_258,
  OriginalRow227TriangleData2090.coefficient233_259,
  OriginalRow227TriangleData2090.coefficient233_260,
  OriginalRow227TriangleData2090.coefficient233_261,
  OriginalRow227TriangleData2090.coefficient233_262,
  OriginalRow227TriangleData2090.coefficient233_263
]

theorem values2090_size : values2090.size = 32 := rfl

def block2090 : ℕ → Option IntervalDyadic := segment 232 values2090

theorem block2090_domain : ExactDomain block2090 232 264 := by
  simpa only [values2090_size] using segment_domain 232 values2090

theorem block2090_get (i : Fin 32) :
    block2090 (232 + i.val) = some (values2090[i.val]'(by rw [values2090_size]; exact i.isLt)) := by
  exact segment_get 232 values2090 ⟨i.val, by rw [values2090_size]; exact i.isLt⟩

def values2091 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2091.coefficient233_264,
  OriginalRow227TriangleData2091.coefficient233_265,
  OriginalRow227TriangleData2091.coefficient233_266,
  OriginalRow227TriangleData2091.coefficient233_267,
  OriginalRow227TriangleData2091.coefficient233_268
]

theorem values2091_size : values2091.size = 5 := rfl

def block2091 : ℕ → Option IntervalDyadic := segment 264 values2091

theorem block2091_domain : ExactDomain block2091 264 269 := by
  simpa only [values2091_size] using segment_domain 264 values2091

theorem block2091_get (i : Fin 5) :
    block2091 (264 + i.val) = some (values2091[i.val]'(by rw [values2091_size]; exact i.isLt)) := by
  exact segment_get 264 values2091 ⟨i.val, by rw [values2091_size]; exact i.isLt⟩

def node0232_0269 : ℕ → Option IntervalDyadic := split 264 block2090 block2091

theorem node0232_0269_domain : ExactDomain node0232_0269 232 269 := by
  exact split_domain (by decide) (by decide) block2090_domain block2091_domain

def lookup : ℕ → Option IntervalDyadic := node0232_0269

theorem lookup_domain : ExactDomain lookup 232 269 :=
  node0232_0269_domain

theorem block2090_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values2090[i.val]'(by rw [values2090_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0232_0269 (232 + i.val) = _
  rw [node0232_0269, split_left 264 block2090 block2091 (by omega)]
  exact block2090_get i

theorem block2091_lookup (i : Fin 5) :
    lookup (264 + i.val) = some (values2091[i.val]'(by rw [values2091_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0232_0269 (264 + i.val) = _
  rw [node0232_0269, split_right 264 block2090 block2091 (by omega)]
  exact block2091_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.block2090_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.block2090_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.block2091_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.block2091_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.block2090_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow233.block2091_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow233
