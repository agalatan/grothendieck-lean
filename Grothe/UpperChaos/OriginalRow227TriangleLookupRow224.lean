import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2072
import Grothe.UpperChaos.OriginalRow227TriangleData2073

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow224

open ConditionalTableLookup

def values2072 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2072.coefficient224_223,
  OriginalRow227TriangleData2072.coefficient224_224,
  OriginalRow227TriangleData2072.coefficient224_225,
  OriginalRow227TriangleData2072.coefficient224_226,
  OriginalRow227TriangleData2072.coefficient224_227,
  OriginalRow227TriangleData2072.coefficient224_228,
  OriginalRow227TriangleData2072.coefficient224_229,
  OriginalRow227TriangleData2072.coefficient224_230,
  OriginalRow227TriangleData2072.coefficient224_231,
  OriginalRow227TriangleData2072.coefficient224_232,
  OriginalRow227TriangleData2072.coefficient224_233,
  OriginalRow227TriangleData2072.coefficient224_234,
  OriginalRow227TriangleData2072.coefficient224_235,
  OriginalRow227TriangleData2072.coefficient224_236,
  OriginalRow227TriangleData2072.coefficient224_237,
  OriginalRow227TriangleData2072.coefficient224_238,
  OriginalRow227TriangleData2072.coefficient224_239,
  OriginalRow227TriangleData2072.coefficient224_240,
  OriginalRow227TriangleData2072.coefficient224_241,
  OriginalRow227TriangleData2072.coefficient224_242,
  OriginalRow227TriangleData2072.coefficient224_243,
  OriginalRow227TriangleData2072.coefficient224_244,
  OriginalRow227TriangleData2072.coefficient224_245,
  OriginalRow227TriangleData2072.coefficient224_246,
  OriginalRow227TriangleData2072.coefficient224_247,
  OriginalRow227TriangleData2072.coefficient224_248,
  OriginalRow227TriangleData2072.coefficient224_249,
  OriginalRow227TriangleData2072.coefficient224_250,
  OriginalRow227TriangleData2072.coefficient224_251,
  OriginalRow227TriangleData2072.coefficient224_252,
  OriginalRow227TriangleData2072.coefficient224_253,
  OriginalRow227TriangleData2072.coefficient224_254
]

theorem values2072_size : values2072.size = 32 := rfl

def block2072 : ℕ → Option IntervalDyadic := segment 223 values2072

theorem block2072_domain : ExactDomain block2072 223 255 := by
  simpa only [values2072_size] using segment_domain 223 values2072

theorem block2072_get (i : Fin 32) :
    block2072 (223 + i.val) = some (values2072[i.val]'(by rw [values2072_size]; exact i.isLt)) := by
  exact segment_get 223 values2072 ⟨i.val, by rw [values2072_size]; exact i.isLt⟩

def values2073 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2073.coefficient224_255,
  OriginalRow227TriangleData2073.coefficient224_256,
  OriginalRow227TriangleData2073.coefficient224_257,
  OriginalRow227TriangleData2073.coefficient224_258,
  OriginalRow227TriangleData2073.coefficient224_259,
  OriginalRow227TriangleData2073.coefficient224_260,
  OriginalRow227TriangleData2073.coefficient224_261,
  OriginalRow227TriangleData2073.coefficient224_262,
  OriginalRow227TriangleData2073.coefficient224_263,
  OriginalRow227TriangleData2073.coefficient224_264,
  OriginalRow227TriangleData2073.coefficient224_265,
  OriginalRow227TriangleData2073.coefficient224_266,
  OriginalRow227TriangleData2073.coefficient224_267,
  OriginalRow227TriangleData2073.coefficient224_268,
  OriginalRow227TriangleData2073.coefficient224_269,
  OriginalRow227TriangleData2073.coefficient224_270,
  OriginalRow227TriangleData2073.coefficient224_271,
  OriginalRow227TriangleData2073.coefficient224_272,
  OriginalRow227TriangleData2073.coefficient224_273,
  OriginalRow227TriangleData2073.coefficient224_274,
  OriginalRow227TriangleData2073.coefficient224_275,
  OriginalRow227TriangleData2073.coefficient224_276,
  OriginalRow227TriangleData2073.coefficient224_277
]

theorem values2073_size : values2073.size = 23 := rfl

def block2073 : ℕ → Option IntervalDyadic := segment 255 values2073

theorem block2073_domain : ExactDomain block2073 255 278 := by
  simpa only [values2073_size] using segment_domain 255 values2073

theorem block2073_get (i : Fin 23) :
    block2073 (255 + i.val) = some (values2073[i.val]'(by rw [values2073_size]; exact i.isLt)) := by
  exact segment_get 255 values2073 ⟨i.val, by rw [values2073_size]; exact i.isLt⟩

def node0223_0278 : ℕ → Option IntervalDyadic := split 255 block2072 block2073

theorem node0223_0278_domain : ExactDomain node0223_0278 223 278 := by
  exact split_domain (by decide) (by decide) block2072_domain block2073_domain

def lookup : ℕ → Option IntervalDyadic := node0223_0278

theorem lookup_domain : ExactDomain lookup 223 278 :=
  node0223_0278_domain

theorem block2072_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values2072[i.val]'(by rw [values2072_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0223_0278 (223 + i.val) = _
  rw [node0223_0278, split_left 255 block2072 block2073 (by omega)]
  exact block2072_get i

theorem block2073_lookup (i : Fin 23) :
    lookup (255 + i.val) = some (values2073[i.val]'(by rw [values2073_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0223_0278 (255 + i.val) = _
  rw [node0223_0278, split_right 255 block2072 block2073 (by omega)]
  exact block2073_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.block2072_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.block2072_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.block2073_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.block2073_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.block2072_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow224.block2073_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow224
