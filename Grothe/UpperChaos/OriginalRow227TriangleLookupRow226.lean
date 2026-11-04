import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2076
import Grothe.UpperChaos.OriginalRow227TriangleData2077

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow226

open ConditionalTableLookup

def values2076 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2076.coefficient226_225,
  OriginalRow227TriangleData2076.coefficient226_226,
  OriginalRow227TriangleData2076.coefficient226_227,
  OriginalRow227TriangleData2076.coefficient226_228,
  OriginalRow227TriangleData2076.coefficient226_229,
  OriginalRow227TriangleData2076.coefficient226_230,
  OriginalRow227TriangleData2076.coefficient226_231,
  OriginalRow227TriangleData2076.coefficient226_232,
  OriginalRow227TriangleData2076.coefficient226_233,
  OriginalRow227TriangleData2076.coefficient226_234,
  OriginalRow227TriangleData2076.coefficient226_235,
  OriginalRow227TriangleData2076.coefficient226_236,
  OriginalRow227TriangleData2076.coefficient226_237,
  OriginalRow227TriangleData2076.coefficient226_238,
  OriginalRow227TriangleData2076.coefficient226_239,
  OriginalRow227TriangleData2076.coefficient226_240,
  OriginalRow227TriangleData2076.coefficient226_241,
  OriginalRow227TriangleData2076.coefficient226_242,
  OriginalRow227TriangleData2076.coefficient226_243,
  OriginalRow227TriangleData2076.coefficient226_244,
  OriginalRow227TriangleData2076.coefficient226_245,
  OriginalRow227TriangleData2076.coefficient226_246,
  OriginalRow227TriangleData2076.coefficient226_247,
  OriginalRow227TriangleData2076.coefficient226_248,
  OriginalRow227TriangleData2076.coefficient226_249,
  OriginalRow227TriangleData2076.coefficient226_250,
  OriginalRow227TriangleData2076.coefficient226_251,
  OriginalRow227TriangleData2076.coefficient226_252,
  OriginalRow227TriangleData2076.coefficient226_253,
  OriginalRow227TriangleData2076.coefficient226_254,
  OriginalRow227TriangleData2076.coefficient226_255,
  OriginalRow227TriangleData2076.coefficient226_256
]

theorem values2076_size : values2076.size = 32 := rfl

def block2076 : ℕ → Option IntervalDyadic := segment 225 values2076

theorem block2076_domain : ExactDomain block2076 225 257 := by
  simpa only [values2076_size] using segment_domain 225 values2076

theorem block2076_get (i : Fin 32) :
    block2076 (225 + i.val) = some (values2076[i.val]'(by rw [values2076_size]; exact i.isLt)) := by
  exact segment_get 225 values2076 ⟨i.val, by rw [values2076_size]; exact i.isLt⟩

def values2077 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2077.coefficient226_257,
  OriginalRow227TriangleData2077.coefficient226_258,
  OriginalRow227TriangleData2077.coefficient226_259,
  OriginalRow227TriangleData2077.coefficient226_260,
  OriginalRow227TriangleData2077.coefficient226_261,
  OriginalRow227TriangleData2077.coefficient226_262,
  OriginalRow227TriangleData2077.coefficient226_263,
  OriginalRow227TriangleData2077.coefficient226_264,
  OriginalRow227TriangleData2077.coefficient226_265,
  OriginalRow227TriangleData2077.coefficient226_266,
  OriginalRow227TriangleData2077.coefficient226_267,
  OriginalRow227TriangleData2077.coefficient226_268,
  OriginalRow227TriangleData2077.coefficient226_269,
  OriginalRow227TriangleData2077.coefficient226_270,
  OriginalRow227TriangleData2077.coefficient226_271,
  OriginalRow227TriangleData2077.coefficient226_272,
  OriginalRow227TriangleData2077.coefficient226_273,
  OriginalRow227TriangleData2077.coefficient226_274,
  OriginalRow227TriangleData2077.coefficient226_275
]

theorem values2077_size : values2077.size = 19 := rfl

def block2077 : ℕ → Option IntervalDyadic := segment 257 values2077

theorem block2077_domain : ExactDomain block2077 257 276 := by
  simpa only [values2077_size] using segment_domain 257 values2077

theorem block2077_get (i : Fin 19) :
    block2077 (257 + i.val) = some (values2077[i.val]'(by rw [values2077_size]; exact i.isLt)) := by
  exact segment_get 257 values2077 ⟨i.val, by rw [values2077_size]; exact i.isLt⟩

def node0225_0276 : ℕ → Option IntervalDyadic := split 257 block2076 block2077

theorem node0225_0276_domain : ExactDomain node0225_0276 225 276 := by
  exact split_domain (by decide) (by decide) block2076_domain block2077_domain

def lookup : ℕ → Option IntervalDyadic := node0225_0276

theorem lookup_domain : ExactDomain lookup 225 276 :=
  node0225_0276_domain

theorem block2076_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values2076[i.val]'(by rw [values2076_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0225_0276 (225 + i.val) = _
  rw [node0225_0276, split_left 257 block2076 block2077 (by omega)]
  exact block2076_get i

theorem block2077_lookup (i : Fin 19) :
    lookup (257 + i.val) = some (values2077[i.val]'(by rw [values2077_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0225_0276 (257 + i.val) = _
  rw [node0225_0276, split_right 257 block2076 block2077 (by omega)]
  exact block2077_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.block2076_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.block2076_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.block2077_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.block2077_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.block2076_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow226.block2077_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow226
