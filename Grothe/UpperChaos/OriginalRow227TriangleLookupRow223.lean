import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2070
import Grothe.UpperChaos.OriginalRow227TriangleData2071

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow223

open ConditionalTableLookup

def values2070 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2070.coefficient223_222,
  OriginalRow227TriangleData2070.coefficient223_223,
  OriginalRow227TriangleData2070.coefficient223_224,
  OriginalRow227TriangleData2070.coefficient223_225,
  OriginalRow227TriangleData2070.coefficient223_226,
  OriginalRow227TriangleData2070.coefficient223_227,
  OriginalRow227TriangleData2070.coefficient223_228,
  OriginalRow227TriangleData2070.coefficient223_229,
  OriginalRow227TriangleData2070.coefficient223_230,
  OriginalRow227TriangleData2070.coefficient223_231,
  OriginalRow227TriangleData2070.coefficient223_232,
  OriginalRow227TriangleData2070.coefficient223_233,
  OriginalRow227TriangleData2070.coefficient223_234,
  OriginalRow227TriangleData2070.coefficient223_235,
  OriginalRow227TriangleData2070.coefficient223_236,
  OriginalRow227TriangleData2070.coefficient223_237,
  OriginalRow227TriangleData2070.coefficient223_238,
  OriginalRow227TriangleData2070.coefficient223_239,
  OriginalRow227TriangleData2070.coefficient223_240,
  OriginalRow227TriangleData2070.coefficient223_241,
  OriginalRow227TriangleData2070.coefficient223_242,
  OriginalRow227TriangleData2070.coefficient223_243,
  OriginalRow227TriangleData2070.coefficient223_244,
  OriginalRow227TriangleData2070.coefficient223_245,
  OriginalRow227TriangleData2070.coefficient223_246,
  OriginalRow227TriangleData2070.coefficient223_247,
  OriginalRow227TriangleData2070.coefficient223_248,
  OriginalRow227TriangleData2070.coefficient223_249,
  OriginalRow227TriangleData2070.coefficient223_250,
  OriginalRow227TriangleData2070.coefficient223_251,
  OriginalRow227TriangleData2070.coefficient223_252,
  OriginalRow227TriangleData2070.coefficient223_253
]

theorem values2070_size : values2070.size = 32 := rfl

def block2070 : ℕ → Option IntervalDyadic := segment 222 values2070

theorem block2070_domain : ExactDomain block2070 222 254 := by
  simpa only [values2070_size] using segment_domain 222 values2070

theorem block2070_get (i : Fin 32) :
    block2070 (222 + i.val) = some (values2070[i.val]'(by rw [values2070_size]; exact i.isLt)) := by
  exact segment_get 222 values2070 ⟨i.val, by rw [values2070_size]; exact i.isLt⟩

def values2071 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2071.coefficient223_254,
  OriginalRow227TriangleData2071.coefficient223_255,
  OriginalRow227TriangleData2071.coefficient223_256,
  OriginalRow227TriangleData2071.coefficient223_257,
  OriginalRow227TriangleData2071.coefficient223_258,
  OriginalRow227TriangleData2071.coefficient223_259,
  OriginalRow227TriangleData2071.coefficient223_260,
  OriginalRow227TriangleData2071.coefficient223_261,
  OriginalRow227TriangleData2071.coefficient223_262,
  OriginalRow227TriangleData2071.coefficient223_263,
  OriginalRow227TriangleData2071.coefficient223_264,
  OriginalRow227TriangleData2071.coefficient223_265,
  OriginalRow227TriangleData2071.coefficient223_266,
  OriginalRow227TriangleData2071.coefficient223_267,
  OriginalRow227TriangleData2071.coefficient223_268,
  OriginalRow227TriangleData2071.coefficient223_269,
  OriginalRow227TriangleData2071.coefficient223_270,
  OriginalRow227TriangleData2071.coefficient223_271,
  OriginalRow227TriangleData2071.coefficient223_272,
  OriginalRow227TriangleData2071.coefficient223_273,
  OriginalRow227TriangleData2071.coefficient223_274,
  OriginalRow227TriangleData2071.coefficient223_275,
  OriginalRow227TriangleData2071.coefficient223_276,
  OriginalRow227TriangleData2071.coefficient223_277,
  OriginalRow227TriangleData2071.coefficient223_278
]

theorem values2071_size : values2071.size = 25 := rfl

def block2071 : ℕ → Option IntervalDyadic := segment 254 values2071

theorem block2071_domain : ExactDomain block2071 254 279 := by
  simpa only [values2071_size] using segment_domain 254 values2071

theorem block2071_get (i : Fin 25) :
    block2071 (254 + i.val) = some (values2071[i.val]'(by rw [values2071_size]; exact i.isLt)) := by
  exact segment_get 254 values2071 ⟨i.val, by rw [values2071_size]; exact i.isLt⟩

def node0222_0279 : ℕ → Option IntervalDyadic := split 254 block2070 block2071

theorem node0222_0279_domain : ExactDomain node0222_0279 222 279 := by
  exact split_domain (by decide) (by decide) block2070_domain block2071_domain

def lookup : ℕ → Option IntervalDyadic := node0222_0279

theorem lookup_domain : ExactDomain lookup 222 279 :=
  node0222_0279_domain

theorem block2070_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values2070[i.val]'(by rw [values2070_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0222_0279 (222 + i.val) = _
  rw [node0222_0279, split_left 254 block2070 block2071 (by omega)]
  exact block2070_get i

theorem block2071_lookup (i : Fin 25) :
    lookup (254 + i.val) = some (values2071[i.val]'(by rw [values2071_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0222_0279 (254 + i.val) = _
  rw [node0222_0279, split_right 254 block2070 block2071 (by omega)]
  exact block2071_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.block2070_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.block2070_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.block2071_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.block2071_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.block2070_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow223.block2071_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow223
