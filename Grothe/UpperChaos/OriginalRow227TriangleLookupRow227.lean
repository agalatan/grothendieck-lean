import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2078
import Grothe.UpperChaos.OriginalRow227TriangleData2079

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow227

open ConditionalTableLookup

def values2078 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2078.coefficient227_226,
  OriginalRow227TriangleData2078.coefficient227_227,
  OriginalRow227TriangleData2078.coefficient227_228,
  OriginalRow227TriangleData2078.coefficient227_229,
  OriginalRow227TriangleData2078.coefficient227_230,
  OriginalRow227TriangleData2078.coefficient227_231,
  OriginalRow227TriangleData2078.coefficient227_232,
  OriginalRow227TriangleData2078.coefficient227_233,
  OriginalRow227TriangleData2078.coefficient227_234,
  OriginalRow227TriangleData2078.coefficient227_235,
  OriginalRow227TriangleData2078.coefficient227_236,
  OriginalRow227TriangleData2078.coefficient227_237,
  OriginalRow227TriangleData2078.coefficient227_238,
  OriginalRow227TriangleData2078.coefficient227_239,
  OriginalRow227TriangleData2078.coefficient227_240,
  OriginalRow227TriangleData2078.coefficient227_241,
  OriginalRow227TriangleData2078.coefficient227_242,
  OriginalRow227TriangleData2078.coefficient227_243,
  OriginalRow227TriangleData2078.coefficient227_244,
  OriginalRow227TriangleData2078.coefficient227_245,
  OriginalRow227TriangleData2078.coefficient227_246,
  OriginalRow227TriangleData2078.coefficient227_247,
  OriginalRow227TriangleData2078.coefficient227_248,
  OriginalRow227TriangleData2078.coefficient227_249,
  OriginalRow227TriangleData2078.coefficient227_250,
  OriginalRow227TriangleData2078.coefficient227_251,
  OriginalRow227TriangleData2078.coefficient227_252,
  OriginalRow227TriangleData2078.coefficient227_253,
  OriginalRow227TriangleData2078.coefficient227_254,
  OriginalRow227TriangleData2078.coefficient227_255,
  OriginalRow227TriangleData2078.coefficient227_256,
  OriginalRow227TriangleData2078.coefficient227_257
]

theorem values2078_size : values2078.size = 32 := rfl

def block2078 : ℕ → Option IntervalDyadic := segment 226 values2078

theorem block2078_domain : ExactDomain block2078 226 258 := by
  simpa only [values2078_size] using segment_domain 226 values2078

theorem block2078_get (i : Fin 32) :
    block2078 (226 + i.val) = some (values2078[i.val]'(by rw [values2078_size]; exact i.isLt)) := by
  exact segment_get 226 values2078 ⟨i.val, by rw [values2078_size]; exact i.isLt⟩

def values2079 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2079.coefficient227_258,
  OriginalRow227TriangleData2079.coefficient227_259,
  OriginalRow227TriangleData2079.coefficient227_260,
  OriginalRow227TriangleData2079.coefficient227_261,
  OriginalRow227TriangleData2079.coefficient227_262,
  OriginalRow227TriangleData2079.coefficient227_263,
  OriginalRow227TriangleData2079.coefficient227_264,
  OriginalRow227TriangleData2079.coefficient227_265,
  OriginalRow227TriangleData2079.coefficient227_266,
  OriginalRow227TriangleData2079.coefficient227_267,
  OriginalRow227TriangleData2079.coefficient227_268,
  OriginalRow227TriangleData2079.coefficient227_269,
  OriginalRow227TriangleData2079.coefficient227_270,
  OriginalRow227TriangleData2079.coefficient227_271,
  OriginalRow227TriangleData2079.coefficient227_272,
  OriginalRow227TriangleData2079.coefficient227_273,
  OriginalRow227TriangleData2079.coefficient227_274
]

theorem values2079_size : values2079.size = 17 := rfl

def block2079 : ℕ → Option IntervalDyadic := segment 258 values2079

theorem block2079_domain : ExactDomain block2079 258 275 := by
  simpa only [values2079_size] using segment_domain 258 values2079

theorem block2079_get (i : Fin 17) :
    block2079 (258 + i.val) = some (values2079[i.val]'(by rw [values2079_size]; exact i.isLt)) := by
  exact segment_get 258 values2079 ⟨i.val, by rw [values2079_size]; exact i.isLt⟩

def node0226_0275 : ℕ → Option IntervalDyadic := split 258 block2078 block2079

theorem node0226_0275_domain : ExactDomain node0226_0275 226 275 := by
  exact split_domain (by decide) (by decide) block2078_domain block2079_domain

def lookup : ℕ → Option IntervalDyadic := node0226_0275

theorem lookup_domain : ExactDomain lookup 226 275 :=
  node0226_0275_domain

theorem block2078_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values2078[i.val]'(by rw [values2078_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0226_0275 (226 + i.val) = _
  rw [node0226_0275, split_left 258 block2078 block2079 (by omega)]
  exact block2078_get i

theorem block2079_lookup (i : Fin 17) :
    lookup (258 + i.val) = some (values2079[i.val]'(by rw [values2079_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0226_0275 (258 + i.val) = _
  rw [node0226_0275, split_right 258 block2078 block2079 (by omega)]
  exact block2079_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.block2078_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.block2078_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.block2079_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.block2079_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.block2078_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow227.block2079_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow227
