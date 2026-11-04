import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2074
import Grothe.UpperChaos.OriginalRow227TriangleData2075

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow225

open ConditionalTableLookup

def values2074 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2074.coefficient225_224,
  OriginalRow227TriangleData2074.coefficient225_225,
  OriginalRow227TriangleData2074.coefficient225_226,
  OriginalRow227TriangleData2074.coefficient225_227,
  OriginalRow227TriangleData2074.coefficient225_228,
  OriginalRow227TriangleData2074.coefficient225_229,
  OriginalRow227TriangleData2074.coefficient225_230,
  OriginalRow227TriangleData2074.coefficient225_231,
  OriginalRow227TriangleData2074.coefficient225_232,
  OriginalRow227TriangleData2074.coefficient225_233,
  OriginalRow227TriangleData2074.coefficient225_234,
  OriginalRow227TriangleData2074.coefficient225_235,
  OriginalRow227TriangleData2074.coefficient225_236,
  OriginalRow227TriangleData2074.coefficient225_237,
  OriginalRow227TriangleData2074.coefficient225_238,
  OriginalRow227TriangleData2074.coefficient225_239,
  OriginalRow227TriangleData2074.coefficient225_240,
  OriginalRow227TriangleData2074.coefficient225_241,
  OriginalRow227TriangleData2074.coefficient225_242,
  OriginalRow227TriangleData2074.coefficient225_243,
  OriginalRow227TriangleData2074.coefficient225_244,
  OriginalRow227TriangleData2074.coefficient225_245,
  OriginalRow227TriangleData2074.coefficient225_246,
  OriginalRow227TriangleData2074.coefficient225_247,
  OriginalRow227TriangleData2074.coefficient225_248,
  OriginalRow227TriangleData2074.coefficient225_249,
  OriginalRow227TriangleData2074.coefficient225_250,
  OriginalRow227TriangleData2074.coefficient225_251,
  OriginalRow227TriangleData2074.coefficient225_252,
  OriginalRow227TriangleData2074.coefficient225_253,
  OriginalRow227TriangleData2074.coefficient225_254,
  OriginalRow227TriangleData2074.coefficient225_255
]

theorem values2074_size : values2074.size = 32 := rfl

def block2074 : ℕ → Option IntervalDyadic := segment 224 values2074

theorem block2074_domain : ExactDomain block2074 224 256 := by
  simpa only [values2074_size] using segment_domain 224 values2074

theorem block2074_get (i : Fin 32) :
    block2074 (224 + i.val) = some (values2074[i.val]'(by rw [values2074_size]; exact i.isLt)) := by
  exact segment_get 224 values2074 ⟨i.val, by rw [values2074_size]; exact i.isLt⟩

def values2075 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2075.coefficient225_256,
  OriginalRow227TriangleData2075.coefficient225_257,
  OriginalRow227TriangleData2075.coefficient225_258,
  OriginalRow227TriangleData2075.coefficient225_259,
  OriginalRow227TriangleData2075.coefficient225_260,
  OriginalRow227TriangleData2075.coefficient225_261,
  OriginalRow227TriangleData2075.coefficient225_262,
  OriginalRow227TriangleData2075.coefficient225_263,
  OriginalRow227TriangleData2075.coefficient225_264,
  OriginalRow227TriangleData2075.coefficient225_265,
  OriginalRow227TriangleData2075.coefficient225_266,
  OriginalRow227TriangleData2075.coefficient225_267,
  OriginalRow227TriangleData2075.coefficient225_268,
  OriginalRow227TriangleData2075.coefficient225_269,
  OriginalRow227TriangleData2075.coefficient225_270,
  OriginalRow227TriangleData2075.coefficient225_271,
  OriginalRow227TriangleData2075.coefficient225_272,
  OriginalRow227TriangleData2075.coefficient225_273,
  OriginalRow227TriangleData2075.coefficient225_274,
  OriginalRow227TriangleData2075.coefficient225_275,
  OriginalRow227TriangleData2075.coefficient225_276
]

theorem values2075_size : values2075.size = 21 := rfl

def block2075 : ℕ → Option IntervalDyadic := segment 256 values2075

theorem block2075_domain : ExactDomain block2075 256 277 := by
  simpa only [values2075_size] using segment_domain 256 values2075

theorem block2075_get (i : Fin 21) :
    block2075 (256 + i.val) = some (values2075[i.val]'(by rw [values2075_size]; exact i.isLt)) := by
  exact segment_get 256 values2075 ⟨i.val, by rw [values2075_size]; exact i.isLt⟩

def node0224_0277 : ℕ → Option IntervalDyadic := split 256 block2074 block2075

theorem node0224_0277_domain : ExactDomain node0224_0277 224 277 := by
  exact split_domain (by decide) (by decide) block2074_domain block2075_domain

def lookup : ℕ → Option IntervalDyadic := node0224_0277

theorem lookup_domain : ExactDomain lookup 224 277 :=
  node0224_0277_domain

theorem block2074_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values2074[i.val]'(by rw [values2074_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0224_0277 (224 + i.val) = _
  rw [node0224_0277, split_left 256 block2074 block2075 (by omega)]
  exact block2074_get i

theorem block2075_lookup (i : Fin 21) :
    lookup (256 + i.val) = some (values2075[i.val]'(by rw [values2075_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0224_0277 (256 + i.val) = _
  rw [node0224_0277, split_right 256 block2074 block2075 (by omega)]
  exact block2075_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.block2074_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.block2074_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.block2075_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.block2075_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.block2074_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow225.block2075_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow225
